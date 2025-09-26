Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F14CAC5B8
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 16:41:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA30610EAAC;
	Fri, 26 Sep 2025 16:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lG8lkg/1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD1B10EAAC
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 16:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758904904; x=1790440904;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UUqe1gHnQEBIKSFE8qELYq8JZ+J9hjO5MurFzSlNk8M=;
 b=lG8lkg/1cr7XaK3mbPWPSpEll69pnRKiq8Fi0SpjSbd6L0inNN7Xy7Cc
 PCBw1sXNY8XD7fK7wnP6ycT1MpbjgmZtX4+ArhwEYk6kb1QqNgkMvUOuQ
 pL01OtSaXEa6ZMPcSgPBKEPYmw2PD3ZVQQbdVKADf96iKhn9KmanK91wq
 odziXEZftXyI5g1/V838y5Qd6jWBFF1xR2KbaKo/FZjYjVU9d/EBdF080
 0MPFAcMY9OrDiGLl4a999SWyocaIZtT/34/i97JdL7d3upmPXcYWgvUD4
 sSl6dUAwBtx5sFlDUccUKgnV+ip3mMZFebg8I8/5iaE0NRtmDO1M97AV/ Q==;
X-CSE-ConnectionGUID: WiF9okrCQS+PymTvIPq8uQ==
X-CSE-MsgGUID: OrPI6FWsR9+Sxx80EdnqtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="83853726"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="83853726"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 09:41:44 -0700
X-CSE-ConnectionGUID: b0eOxlbERzm4yOvWx2EKvA==
X-CSE-MsgGUID: qeR5n442TxSAmlWZnaGonA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="177497520"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 09:41:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 09:41:42 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 09:41:42 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.20)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 09:41:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RTXQzkY5mufrjsjlE1wXZ4E0j15CA1JJ9PpPND8CZxWbOz6XjQQZajRh1uGhCKmxhZYHD7PN2junUsiNjTrmGtrEPKXkENJgco67Ehl08v1jNZzfVPYpnkUhDXZLUykb4vOl3ti1pBpdt5kRI3HERTcwyj/E4ctL5OnVfHTWPBRoVd+pQT1nCk9s6reu7AM96oSOojusAsOK+CXKyCQmwS0sVHMyzmqCFv+OP1LyGcz0FGRCC7w0r5euCki4EV0Ki1eoDBTARXJu3viZqm1HEhVHvnDNsoxEvOez+BuYJxWF5i6zkLS3jOFg/lr8HG3uHYuADLvZMd4Mfpsu/sVeFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhdsxqeAQ0CW6sAmJ5H/69S3FDNl6LRW30BvBIj/LCE=;
 b=vqngjHpnFBA6m/OvFsEOAWoLrR91iS5YdCFLu92adBRMkljxsO5WKeIulMLkMTkji3vpg7OT6UNAYfN1SIqP6nfe8QP2BoMTf1NiDhwkn8Lo8yDtl5OpcuIagTr128wUVCfMca6T/H/F2O+Z26gVzCxoGOq1pnmlomhda8raw5cTaprbdCoFGPMzAwBD5ywGwHa+ie7awbUecUBkrXosGg5M/vIv5GaYY/EkaEvxo+waWU5+xyVRf5wZQOXAW5GzuxpLYjKWPwEqawM9DTpMR5v2xfxTP2C2RCY7gKZNQXErvfmsbTnNIAw94vZ9INTmaRFcWSobPwYn9X0xT9bAYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4530.namprd11.prod.outlook.com (2603:10b6:5:2a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Fri, 26 Sep
 2025 16:41:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 16:41:37 +0000
Date: Fri, 26 Sep 2025 11:41:35 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 05/22] drm/xe: Move 'vram_flags' flag back to platform
 descriptor
Message-ID: <xhgfebbvz5fjkvsyb2kimhpmgiyhimyrnd7lvpfvmybacu4jbo@xttypm3rq32z>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
 <20250925234628.2112163-29-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250925234628.2112163-29-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY3PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4530:EE_
X-MS-Office365-Filtering-Correlation-Id: 41b3f69b-8a7b-4588-9ad0-08ddfd1b8fce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xp2tMEfDCccxUcu51YFgcDH7K3oRP9GLbkBLpjgb13W/AgUaJ0y1xznxHOWM?=
 =?us-ascii?Q?a+rteikA3tApw4tAka6XYCaLHiff2ru3Is75XIBGuPeLt2p271ejnGbujAhK?=
 =?us-ascii?Q?7pmiF1k1LvOGu46wQLs255sJ9cQEOKxKPW5GuzIJoDJcG8YE0uMKHNPimuIL?=
 =?us-ascii?Q?W8dIja+C58qeMxcyVYTxIQ1e57C7YxtJWJ3iXJWxNAHXhlXFOHsKPHU5Ftys?=
 =?us-ascii?Q?BR6IvCHVWwKxiZ1ZrTD7XQMIRdH2dfAzY7ryj03fe+fza2Xknq5ag1TuHQQ8?=
 =?us-ascii?Q?J/5tgIL273Ed/sp2jLQ7WNwEdmiQ8/kREBIkuQtuy23YWpxoJ8zoybFe1n5I?=
 =?us-ascii?Q?ZxkPvjqXUn+8FHfF2QpgY8BOuCGVqJ+z3L6rwLHJ5fz7/+HIQrykI4p2YyCa?=
 =?us-ascii?Q?5ff2JZnKKpKVz68UIbFthZu78dnycaVqg0BApKuULHAaQitA9TgupAey41c4?=
 =?us-ascii?Q?K8gw7n7JJbpRgcDl7n+cXEMiZ1pLFSz74JobsqePDnW3NVa2emfbPi23dR4u?=
 =?us-ascii?Q?LU27NPy8oApMWFN2d+L4kHx5j8h7jZ/CyKe8+0l/qJ4FEbrEslERfbhEZ0za?=
 =?us-ascii?Q?zZTyd0Fmg2o3zLmFTcidDEtPZauRGnRO+8UaOxHinA++JVW0EsTHO++E0aB9?=
 =?us-ascii?Q?9UItM9Ysr4ARe35oOhdQOQPBONQeq821zvWDH0y6voZvHGLYF+oic09pohOy?=
 =?us-ascii?Q?YKjx9KAncgcDhR2n56hXUUnyM/uowtfWv3rSTDROgxXhsElPzrQ1rGDmCZmt?=
 =?us-ascii?Q?Im7nxeWXLF3qe5ox3YHWUA+TLxH+nOiUiHSZK8XdDQXXXgYTWFXts+KXVt/X?=
 =?us-ascii?Q?dmM+CGapS4gZ6qfQzvY3s5TwfnfdOBPeYAlxRda0Y3/CEsOpCOZDFmxdoJ/2?=
 =?us-ascii?Q?sFpuF+chIIBTyRAIYozMR9XcAPQ1K3hWmZQHIBUJ9RZdtrSQTLzFgQ3zciDU?=
 =?us-ascii?Q?7F/ZgLhI2LPP2FiRXfLYQymmtU7Cwn/U3b61RRMfYtoIJ2S73HBUAeb86Nhl?=
 =?us-ascii?Q?achcZNC/ou5vvgY/w7LVsfUOSFap4shMNNvnYI4qbj4zcyxmzOCs9nja6vw4?=
 =?us-ascii?Q?rjRz64qLQuw0mlrbprQPMqrEOUH7GI7ApVczNohySkYTBTDr6fEZoO9RgSU0?=
 =?us-ascii?Q?UAZeXWzsp4WIQ73WbEwnLpGk+SU9ydI/7nzXOUTXiEwk1KmkG7Rb2Y7iY6d4?=
 =?us-ascii?Q?/ODFQCe7+nOsWZ28ldcIZffZgnD6hGOnDF2laTKJ4aXHYuh4aeiM4qYXSJVT?=
 =?us-ascii?Q?gVgk61nWXUGU0tHT7c4Ivt/umr+q92q/7q2+aycFY0OTo5aCLu/iMIViPTCv?=
 =?us-ascii?Q?Ki09JAX39MsK+RSUDfEDg07CObxDBlwRaOBG0u++3FPSQpE4o3LHTusZ+7sc?=
 =?us-ascii?Q?nyHJncYT/KpWSVG1otAisksmGeYGDNpvFlGy9YlY1bY5YQ7fmu0s581fwL86?=
 =?us-ascii?Q?1OZX2fo3A/2ef081ooSDVtkk4vbzomJq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XzqpsphuI9rmD8oYPsXGHy4y2Ho5I39ML57T5L5XElD9YV/zRAiM4+uMGmhS?=
 =?us-ascii?Q?oaZ0YEgb7PKhC1/YRUpJiY7eBrvHnV1d2x/TB672IFa5Ekir2rpAl0xJv7HF?=
 =?us-ascii?Q?LR2FEVedTITr9b63IdzQFtCVLLjs+QG2UQKI8ThMsbEFAv2aRG2D87eariob?=
 =?us-ascii?Q?JOWvK87JJqPN3Sv4KKFIQLE7ak7OCQwgnkHzSuwttuwHpSZFRIyq57sETtAc?=
 =?us-ascii?Q?KWarH5Z+LFRsXHI4ut+W/vJtqfkG7ZWgiF+6G3+eg+OcZ/Kms4Z0mR+sdpHL?=
 =?us-ascii?Q?OR9SiOoxgk+B8LdzHliOSx/Blm6v4B83N1Vx/sVLacUKaLnKOqQCJ4CnaRZN?=
 =?us-ascii?Q?JhFfhvgadCWRU3rWmUgMyb9Xbm0hOxXWxAFF5PuVC8eAvYOA4ITvXMqRszsF?=
 =?us-ascii?Q?FI0yJJSZ/yV0KTDQ7nHvZCcCpHGyEYEFzwHDEMarhkpKYgXvCcSfdhmvVQje?=
 =?us-ascii?Q?fhMS3aBIv1lPB38lVafpFNO3HivHPsz9EVY2NFx6nN/DU8CYixvCT+ULUHa1?=
 =?us-ascii?Q?Jnns/PrArdjTzDrnAWj0ExN1wX2PA/4mUDWDeKc/g9ErATgzJbrBV2bwZPgP?=
 =?us-ascii?Q?DCbuP6XW9MFK7lMOw1C6ZVlHHMU57OfJASwayzoY5CiMh8MhmwJgRG1Jzt8q?=
 =?us-ascii?Q?bdBF5s6SezZbWtM0fStVeHbw30v+YJcviLxyMPB5COLfcfsQyXCEhenPhOvz?=
 =?us-ascii?Q?nV7wU9HLWQyYBb1DTDz3s5kzGu61SjL12DMrpnO1Wk9KiE0o7ZUqHWrh0HCH?=
 =?us-ascii?Q?xcGpYbTe9ynzTeosb90uRvj4ZOYrARXbqHc/NZXA/2HCHWiqpXoh4K69Ugdg?=
 =?us-ascii?Q?CU1eW/Y3OkujeDOAKmqbG1K1X/j9VLUwcEvtg4dJizp9pLPh+YAqCuDvIa0a?=
 =?us-ascii?Q?OoF7x2XmFS/l3nnqPn/pvjLG2a0zZwgQGqFG6fwb+BfBLlkl8KBXuKInjoid?=
 =?us-ascii?Q?dpWtePWshdR2Tv/pwRAAdnnZbcqGvdtfzwC+SmNjP9xzz58A/78olDJIwjAp?=
 =?us-ascii?Q?/5x1LS0/x0IsScK4Gp3ZL1cDJ6/bvSJLf93yWSXStuSLZWs/I7gy8D0t1XU3?=
 =?us-ascii?Q?yK+mu3gtpG2AO1wgElRXp3nToRNhrQ10f44NixFQy9Q5WNg15RzQVm5MHGu8?=
 =?us-ascii?Q?6JTt7viWP2ImH7Ropxl9wqhIcmmPsMNq46wGHDD+vlX30h8EqJtk3oehW4Wr?=
 =?us-ascii?Q?tdIOXmi8dlsRbGe0uS0iB2EUOxROzps/LyKwRX1d7VEk21Cq/mGh4srgPQ4M?=
 =?us-ascii?Q?uwbRXmf9Ch5EqNYD5VDR26dW8/9vy0Jm5VUMubzIFFfgm3op8Klxfb5er/y4?=
 =?us-ascii?Q?Izm0oq453msqmgxIYlxznowPd7GM5bXHVypswTxtRCoXynNi0HumVikb0SMg?=
 =?us-ascii?Q?708R+ZdJFVY9AaPPADntK//IW+03cvhwUmdytqz7QzawuK1iIpRv7eANH1c4?=
 =?us-ascii?Q?Nj/21jU+BRGR9O/Mg9PC1uWXBMEXDXHDikvkpJ8RP4MP0XPzGcHXlmoEqhJH?=
 =?us-ascii?Q?4hMuFLi72W7lJ6TDx1W60/U+RVT2vA6F2kjvMCKpRJJ1ip5QffB3kX1WbsPr?=
 =?us-ascii?Q?znKDC0ufHHCyRIzdZPzBhiKN2ncuBYmVS7nhfetcyIAHAohl1jbdxJRMqJFM?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41b3f69b-8a7b-4588-9ad0-08ddfd1b8fce
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 16:41:37.6455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yNOB5PBkdpBBO2bIfukILfg1wcinN1Z4yTiO0T01r5DyxLgZLew9T7aLXtptMd/d9Gn+69IUxoFg0a3X6VJndeEJrcGa0ItXHnlIYvngc5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4530
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 25, 2025 at 04:46:33PM -0700, Matt Roper wrote:
>Restrictions and requirements on VRAM alignment are something that
>should be tracked at the platform level rather than the IP level.  Even
>when mixing and matching various graphics, media, and display IP blocks,
>the platform as a whole has to have consistent memory allocation
>handling.  This is also a trait that should be tied to the platform even
>if the graphics IP itself is not present (e.g., if we disable the
>primary GT via configfs).
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
