Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E300C83F17
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 18:20:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C312310E94A;
	Thu, 10 Jul 2025 18:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2zQR50g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336A510E94D
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 18:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752171606; x=1783707606;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LcBMQrBXbZe8kf7aaKvBIYq6wDv8+o6zaZ5LGuDe4m8=;
 b=m2zQR50g3gLm8I/t7fWBWneiLul/ONkC1Lsaft5nMr28NdpDzNi5k3Uc
 tMqh0avvY6hpiUv/AJOfVUeWsOgqj2THtm+IJUmBSMxkJyIydkv9q8uAB
 bgSoYBSdDE6Jq0WG4MR/MyommTB/jD4Xtdy1zfCwKnzwLuhHwjHKUcQt5
 sUNxmxQDo9dLEtwuTQJ1Y2CL4VPKxXAqt/9rnkSDaDN1CfPpuhVYE8i99
 9JfkMTnRb+21JYXL81wmBpgfuuD0fXc8uTzA6s8X0rqrwILpimGJQD5Pc
 skKfXDI8NSdcvuELTw1qIA/r9vwEGb86MHKRSANOFq4jLfWxFQmVmfODt Q==;
X-CSE-ConnectionGUID: GYvj4knxSRmzqsh46LljKA==
X-CSE-MsgGUID: 3598xnZtR3Cyr6xB5w05vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="57077079"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="57077079"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 11:20:06 -0700
X-CSE-ConnectionGUID: PogxLOhHST6KWFpV39MKCQ==
X-CSE-MsgGUID: akYr+kO9QwOJA8excFf+AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="160716933"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 11:20:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 11:20:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 11:20:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.88)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 11:20:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bMqMIi1PUMFvfjAKySNgwg7Xt0DcBxmZ9g0i6Cj2OjGRLMHP/t9WyHYnjKs92Ie6Yt37kokZREvnzcmrT+p60M/dAXrQqw3607cCVkYhZmendnaur9iIH0gbTbt8pkBTw3Km3q+NHtXRVum3zJsuuZaAYfQa4Jt3ywed3/5ZmG3rxehDLafy9qS9aKNYBS9w6SRfYvt847G9BZVo+g3wiSB1xOUGPZKQKvJWMmVpGNM/3hnRO7re8/yEDbwhqOqXhzCNTc0etNH1wlj0g9ZxeU0ME3VsvwYwda4IWHbb4ShcN05dXT7r4lANPEigi6knX+eHoEHN0lHFOnbITvhJFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weE7lnclqmOvkKadlMPZzHW1kSkF0zvtQiApwjHc+3g=;
 b=ICmcZsRj1X25fhAHDcpd/+EcfAPmRoGib7ITj70EnucVASVJ8aQ0QPoxkQ+u6C+2YK/sbGWnT6d6n9auZNctbUIyEHY1c1ozomWRh1s3re4qop/1VogGE+VR+qa3oZmF+ArVaxRASq23bfHiwzEzqvu+D7u83w1vSt63lTO3el0P+V0suFC9HiayCLDJM0SdSMNJr7GOLDqOKUcwbcjcHkRZUYCMmSqEXaNiIM0Xv2USxzrABmaC6kESHN3SwwEWJ9cnyFkMjUtd6zYakgeEzrNtXsq5O7KcKHeRzoF6BexsPKz2l7rEwgcuI/TQ5i7w/zkBpjGqgLpZbACfznDjfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB5777.namprd11.prod.outlook.com (2603:10b6:806:23d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Thu, 10 Jul
 2025 18:19:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 18:19:34 +0000
Date: Thu, 10 Jul 2025 11:21:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Nitin Gote <nitin.r.gote@intel.com>, <tejas.upadhyay@intel.com>,
 <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <joonas.lahtinen@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY
Message-ID: <aHAEnkKnOuJRUF8l@lstrano-desk.jf.intel.com>
References: <20250710075435.407068-1-nitin.r.gote@intel.com>
 <5gwyv6u4qtbqbmnnxaat6zjlbp3hgdl65dqron4w6qcxhyq5ua@h7vffx4fs3uc>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5gwyv6u4qtbqbmnnxaat6zjlbp3hgdl65dqron4w6qcxhyq5ua@h7vffx4fs3uc>
X-ClientProxiedBy: MW4PR04CA0306.namprd04.prod.outlook.com
 (2603:10b6:303:82::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB5777:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cac0002-68ae-437b-b897-08ddbfde52b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z7Nv7HYrs33/aW65Lq2dpGxLF4nSxLHx3nfilAj98zpWO6KsI9SnskoagqD1?=
 =?us-ascii?Q?vJMwQ/OATeDNQgt3W6nrizTYARZrzAgfiyiL6KHSFkW2wyGaRLL0WAKPwWuc?=
 =?us-ascii?Q?FBPEO0gdT7XfXgm819MU4jd9JWYQXQZOuZ6OEWwSTEJK6Pw/Tp46x2VSlpQq?=
 =?us-ascii?Q?/lcyEFMh2WRYq4uqgfydn/R8mRwLZWNu02tQ52cCec4xCtgfP7cKJkHkFWWB?=
 =?us-ascii?Q?k/YYXDGJPmhRpOd05p48k/BtVOW2ca6Vbn8DNLa5FdNnftywi4E0A4gmb+7b?=
 =?us-ascii?Q?wtfG6Y9qWGNKbMPa0Cbr1q7SNNL71ks9npmDIbiBBmDHzrf0WRKT7OdiVgj3?=
 =?us-ascii?Q?hHKF82cUyXsmXpsibr2MgagGtzo3LDsv7hEWuw19/A5fUPOeukX60mjdpakF?=
 =?us-ascii?Q?Cp08Czwzx/HYlxhLNSj6+Bbc4liZQANjlC9XloxAdIaYISrP/5pOM7Tz45Ok?=
 =?us-ascii?Q?yx7eLfPOm6SN5FrNwZmqsAWJkZ7YGta0YVzZ+4zOdIGhw8Eh3HlCuwKrDRcG?=
 =?us-ascii?Q?MJu+/kjTWppUuJrthDHzV4pu0OpBDuk/2elpl7t5FNv/dOwkoSjIJb1bVHpc?=
 =?us-ascii?Q?ic0Uzs7PplvMvjd85xVOct5NqqJGzDh+ik1lI3rBfoZeQtvITsClAa7VIL6x?=
 =?us-ascii?Q?siT+GsfN6ILeGkAaI+UB9XmdBESRYQNEz4G0rtMe6X9jEYkHailsH868Lx4Z?=
 =?us-ascii?Q?po73s888PsUQtlpqIb7X4xvP3N8fAnJkiwJXZ8WVCdO2nbLxyAZh0DvNxdUQ?=
 =?us-ascii?Q?5mMF5GmHzV0kbq+vKk1MZzFFZxkODqXV0ELKwKgL6qrdgsGVbVciqfyTPoa7?=
 =?us-ascii?Q?iWuYbYaH9eLAve7BiPVChXHrI7RnD8+q5frbNgn/H/xxannkaWrrYLcdRMrx?=
 =?us-ascii?Q?PK8YtOXxDlgJWsvg87UOn5/AcmY8H05/l1AjrFNUmAOcXxq7Z+PSCSZgNoH4?=
 =?us-ascii?Q?0tyOwu+QiVx9/Iol0VWB6qRR5a8QbI1vP+UnAqtzMvlOpwFDQQ8AoZ9azdyw?=
 =?us-ascii?Q?kCml6C7bmEzmytqPVikxocMnKlta9ssU73e41px8wjxz4OA4jRoRAmP3PEvp?=
 =?us-ascii?Q?+5ArEB7OiNs05IhB3SgwMDSkZr8NJsZ4HlCffmAgEnrVkXDkDUR7ff4GQzLR?=
 =?us-ascii?Q?ZAj/LWP+1FOs35hIWntJPNjSO2PnkNCQBfHnPl0xwIP9XfEyhoaBSJSzT8gr?=
 =?us-ascii?Q?XBlh4WKre6Zepr6zvM2BrQ6yB4ZjdbkaRtU2VrRgh2DiKT4RLW47o6Xz3RRS?=
 =?us-ascii?Q?kI8IY0x85140delPs7x3qaV8kPczPXL6qk4eD+E2Z8elYhdEiUVWoZeEavGe?=
 =?us-ascii?Q?+Vo0mQbJj/dcAjaA6hp+Gkp21UGdEPFl2A0Mk3rXhCRCJpDStJBcN+SdqxOG?=
 =?us-ascii?Q?w6iEYtE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V9z+yTfgDWA6l1/Oco5Vn5CZoFaBltuED3ja7iDEA6xIu4GC6HDw8uORwQDN?=
 =?us-ascii?Q?uw8fjJGdLGnZ2RMexep3AqJpQgiRRTfpQ3HUZ9oA7x1ZkCDmKHZ+iQoNatKB?=
 =?us-ascii?Q?2sE2z+OXIftUfZ4lMOjRmPvcL0Dr/ron98MEtNChMUl4gRKTE1Dt4ZsElIsd?=
 =?us-ascii?Q?lEWyKkLpAAm2y8ODxZ76RAbZfEKdr1qt6BGwY9JFGGCFqNzhdTz3CjbOaSzb?=
 =?us-ascii?Q?rtEL5XbYS6BvaoweRPfHMgCYVF74nzwjJhHIA6rv/9T37pFzPLWxu16So0ID?=
 =?us-ascii?Q?lvFj+hpIvunpv3QzSqCvHqGBRAb6cflj5HSNILPtFsYuR82qVv80KOSOmCLS?=
 =?us-ascii?Q?7ltBKtrvi9y9DMd1uvR5G9JocudH6LtrH9I7yG95CZzTbHkkxqZotseeDIZG?=
 =?us-ascii?Q?IOqkrHRpLIYjRcuhjjQX8RsQmWkcaD8mn5aBxR+Wp6BdhmnkPpWsKOQZrZtM?=
 =?us-ascii?Q?p3GSVCK0Nn9XWAWSH3uZHB1OsektlXq61UjAtCBUgvfEtJw2Wb17wd+lt3T7?=
 =?us-ascii?Q?OUZ8uspSnAa8Bh+ZS+kH2tBjLgnOQfKu9rgkT89+bBFEal52mOj3bL4uYoCg?=
 =?us-ascii?Q?u0RMkG7OygqCKR4yBQnufGdtmFmG7Y4K1a+lb82W7eKIRNthEl/KsJdg0FT6?=
 =?us-ascii?Q?AH3VNXH1L4rWliI7q7qxQi+WoRCx7IpmpYX9NkU+oGwaevN8Z3owOmQShpr6?=
 =?us-ascii?Q?sOZnA2XUAgytj0VL9NPGAyiPxWASLMWEK2RLLzEpm+nM5RPrQuAuvLGEIdN6?=
 =?us-ascii?Q?tXYTjow5EkaSIqRHBHUcC5TO1fo05Ar3pIpgoNzevu+IxiZnO+REqhijOVXv?=
 =?us-ascii?Q?LXEUQyJRN2k3tuZQ64Io5WGctD7/tDnCzJ3v+vDWPY+GDeCq2JBOw5h7sAnJ?=
 =?us-ascii?Q?8qpYwsVM/6WjyV0iPkSw85Yohw1bz58oZGRTqRa9tO7wHzTkijb7w5cB3NkR?=
 =?us-ascii?Q?SA8/LJWHzkNRYBzrBpPYmqNX3vLZabNq+8aXD33rZfdKzBA3/e31rTuy5BO6?=
 =?us-ascii?Q?KDekMWu1cuDGv5reHnOmuesrWQnJaBWzYJAhhZUL1n9ACpofHynIlNGmmYZ5?=
 =?us-ascii?Q?x67eLaJiCavLPVc5l1/ur13sHNj7FeyWMZCLrBK/76RFabIJPd74WSQIKBWG?=
 =?us-ascii?Q?Zc5bzUKsCEGyXyi3FsyRPKco+Qe9XunOlBnrce6xqS2PGKG/rJbJu03BchO6?=
 =?us-ascii?Q?22w2DgT3D+ZLm4K2GFVztNtOh8v2j3hPTBObfkCAZSse5WlI9MBtd+hEf7oM?=
 =?us-ascii?Q?P8UTbBLJqLoTVK/u3kL4Om6H1ot2Mz2VVxO3J617wFw4nAhoSmEZLv/W63Zm?=
 =?us-ascii?Q?nu4o2toYxLkQHzlN9ditkxKhOq2IzrQDpM+v5FoQmcKJOf+8XSIC9G8CIq5H?=
 =?us-ascii?Q?d4XInHokBAtYGP8y+iZXi1aIlLTumT07APQxBTZqfQTU2vU3vZ8lS9izTmDe?=
 =?us-ascii?Q?9IcK2+D8UYSQxQyZ0hpWF36/WPesBb421P0/NKZNEpMx1F1IvxJMLtg4RJXg?=
 =?us-ascii?Q?5TwlIIsAGS2s4jYoT0tNKToCi3N8IUjFbXmTlpWpPm74cKupSGTitEOiUrpH?=
 =?us-ascii?Q?k3pUlnhpqzvVBtwONx1Ya7jBy1BJHoEWXXN3vceJNWUzX9+y+JiYUhMkD/iM?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cac0002-68ae-437b-b897-08ddbfde52b5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 18:19:34.8942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cih1Xaoi1r1o8Pvyc5tLYAdExAY62COicMDUvN0307kkiUwomI1NTBHEj6EJjV0+8N7u0pU6J28RrZS4qWQ8cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5777
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

On Thu, Jul 10, 2025 at 01:03:41PM -0500, Lucas De Marchi wrote:
> On Thu, Jul 10, 2025 at 01:24:35PM +0530, Nitin Gote wrote:
> > Add the DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY device query flag
> > which indicates whether a device supports DIS_NULL_QUERY (Disable null
> > anyhit shader query mechanism). The intent is for UMDs
> > to use this query and opt-in DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY flag
> > to disable null query mechanism for anyhit shader by setting
> > DIS_NULL_QUERY bit of RT_CTRL register for Xe2.
> 
> it seems like this commit has been over squashed and this commit message
> doesn't really match what it's doing. This isn't just adding a
> DRM_XE_QUERY_* (what the title implies), it's actually implementing the
> DRM_XE_EXEC_QUEUE_*
> 
> > 
> > v2:
> >   - Use xe_rtp_match_first_render_or_compute() api to check
> >     render_or_compute. (Tejas)
> >   - Validate args->flags (Tejas/Matthew)
> >   - Add proper kernel-doc for both DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY
> >     and DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT. (Matthew)
> > 
> > v3:
> >   - Rename DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY to
> >     DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY. (Matthew)
> >   - Move implementaion from exec queue creation time to
> >     WA BB program. (Matthew)
> > 
> > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > ---
> > Hi,
> > 
> > Please note the review comments from previous rev2, addressed in this patch.
> > https://patchwork.freedesktop.org/patch/660580/?series=150601&rev=2
> > 
> > 
> > .../gpu/drm/xe/instructions/xe_mi_commands.h  |  4 ++
> > drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  2 +
> > drivers/gpu/drm/xe/xe_exec_queue.c            |  9 ++-
> > drivers/gpu/drm/xe/xe_exec_queue_types.h      |  2 +
> > drivers/gpu/drm/xe/xe_gt_mcr.c                |  1 -
> > drivers/gpu/drm/xe/xe_lrc.c                   | 65 +++++++++++++++++++
> > drivers/gpu/drm/xe/xe_query.c                 |  3 +-
> > include/uapi/drm/xe_drm.h                     | 12 ++++
> > 8 files changed, 95 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > index e3f5e8bb3ebc..84e889528464 100644
> > --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > @@ -80,4 +80,8 @@
> > #define MI_SET_APPID_SESSION_ID_MASK	REG_GENMASK(6, 0)
> > #define MI_SET_APPID_SESSION_ID(x)	REG_FIELD_PREP(MI_SET_APPID_SESSION_ID_MASK, x)
> > 
> > +#define MI_SEMAPHORE_WAIT		__MI_INSTR(0x1c)
> > +#define  MI_SEMAPHORE_POLL		(1 << 15)
> > +#define  MI_SEMAPHORE_SAD_EQ_SDD	(4 << 12)
> > +#define  MI_SEMAPHORE_REGISTER_POLL	(1 << 16)
> 
> look at the defines above and implement it according to them. There are
> multiple things wrong wrt coding style here:
> 
> 1) the MI definition is sorted by its number. 0x1c shouldn't be the last
> in the file
> 2) bits definition should be sorted, highest number first, to follow the
> bspec and be easy to compare
> 3) don't use shifts, use REG_BIT()
> 4) there's a missing space in the bits definitions
> 

Thanks Lucas - it was late when I was reviewing this and apparently
missed a ton things.

Agree with everything Lucas says here.

One follow up below.

> 
> > #endif
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 5cd5ab8529c5..8234789f05b7 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -55,6 +55,8 @@
> > #define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
> > #define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
> > 
> > +#define STEER_SEMAPHORE				XE_REG(0xFD0)
> 
> ditto, should be sorted too, but it also clashes with
> MCFG_MCR_SELECTOR. I'm actually not sure why we are using MCFG_MCR_SELECTOR
> name... probably a copy & paste from i915. That register is indeed
> called STEER_SEMAPHORE in bspec.
> 
> > +
> > #define PS_INVOCATION_COUNT			XE_REG(0x2348)
> > 
> > #define XELP_GLOBAL_MOCS(i)			XE_REG(0x4000 + (i) * 4)
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 8991b4aed440..18a0bee38eed 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -131,6 +131,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
> > 			flags |= XE_LRC_CREATE_RUNALONE;
> > 	}
> > 
> > +	if (q->flags & EXEC_QUEUE_DISABLE_NULL_QUERY)
> > +		flags |= EXEC_QUEUE_DISABLE_NULL_QUERY;
> > +
> > 	for (i = 0; i < q->width; ++i) {
> > 		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
> > 		if (IS_ERR(q->lrc[i])) {
> > @@ -597,7 +600,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> > 	u32 len;
> > 	int err;
> > 
> > -	if (XE_IOCTL_DBG(xe, args->flags & ~DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT) ||
> > +	if (XE_IOCTL_DBG(xe, args->flags &
> > +	    ~(DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT | DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY)) ||
> > 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > 		return -EINVAL;
> > 
> > @@ -616,6 +620,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> > 	if (args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
> > 		flags |= EXEC_QUEUE_FLAG_LOW_LATENCY;
> > 
> > +	if (args->flags & DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY)
> > +		flags |= EXEC_QUEUE_DISABLE_NULL_QUERY;
> > +
> > 	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
> > 		if (XE_IOCTL_DBG(xe, args->width != 1) ||
> > 		    XE_IOCTL_DBG(xe, args->num_placements != 1) ||
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index cc1cffb5c87f..b62502a18c1b 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -87,6 +87,8 @@ struct xe_exec_queue {
> > #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
> > /* flag to indicate low latency hint to guc */
> > #define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
> > +/* flag to indicate disable null query hint */
> > +#define EXEC_QUEUE_DISABLE_NULL_QUERY		BIT(6)
> 
> 		     ^ missing FLAG here to follow the other defines
> > 
> > 	/**
> > 	 * @flags: flags for this exec queue, should statically setup aside from ban
> > diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > index 64a2f0d6aaf9..a7624b30d0c9 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > @@ -46,7 +46,6 @@
> >  * MCR registers are not available on Virtual Function (VF).
> >  */
> > 
> > -#define STEER_SEMAPHORE		XE_REG(0xFD0)
> > 
> > static inline struct xe_reg to_xe_reg(struct xe_reg_mcr reg_mcr)
> > {
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > index d2ad8fe737eb..6fc09df67442 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -13,6 +13,7 @@
> > #include "instructions/xe_gfxpipe_commands.h"
> > #include "instructions/xe_gfx_state_commands.h"
> > #include "regs/xe_engine_regs.h"
> > +#include "regs/xe_gt_regs.h"
> > #include "regs/xe_lrc_layout.h"
> > #include "xe_bb.h"
> > #include "xe_bo.h"
> > @@ -25,6 +26,7 @@
> > #include "xe_map.h"
> > #include "xe_memirq.h"
> > #include "xe_mmio.h"
> > +#include "xe_rtp.h"
> > #include "xe_sriov.h"
> > #include "xe_trace_lrc.h"
> > #include "xe_vm.h"
> > @@ -972,9 +974,56 @@ static ssize_t wa_bb_setup_utilization(struct xe_lrc *lrc, struct xe_hw_engine *
> > 	return cmd - batch;
> > }
> > 
> > +/*
> > + * wa_bb_disable_null_query() - Emit commands in the WA BB
> > + * to disable or enable NULL Anyhit Shader Query Mechanism.
> > + *
> > + * Some platforms require a workaround to disable (or enable) the
> > + * Anyhit Shader NULL QUERY for specific engines (typically the
> > + * first render or compute engine). This function emits a sequence
> > + * of MI commands into the workaround batch buffer (WA BB) to perform
> > + * a multicast write to the RT_CTRL register, setting or clearing the
> > + * DIS_NULL_QUERY bit.
> > + *
> > + * The sequence includes a semaphore wait to ensure proper ordering,
> > + * followed by MI_LOAD_REGISTER_IMM commands to write the desired value
> > + * to the RT_CTRL register, and finally restores the semaphore state.
> > + *
> > + */
> > +static ssize_t wa_bb_disable_null_query(struct xe_gt *gt, struct xe_hw_engine *hwe,
> > +					u32 *batch, size_t max_size, u32 value)
> > +{
> > +	u32 *cmd = batch;
> > +	struct xe_reg_mcr reg_mcr = RT_CTRL;
> > +	struct xe_reg reg = reg_mcr.__reg;
> > +	struct xe_reg reg_sema = STEER_SEMAPHORE;
> > +
> > +	/* Add WARN_ON check for minimum required space (10 DWORDs) */
> 
> no need for this comment
> 
> > +	if (xe_gt_WARN_ON(gt, max_size < 10))
> > +		return -ENOSPC;
> > +
> > +	if (xe_rtp_match_first_render_or_compute(gt, hwe)) {
> > +		*cmd++ = (MI_SEMAPHORE_WAIT | MI_SEMAPHORE_POLL |
> > +			  MI_SEMAPHORE_SAD_EQ_SDD | MI_SEMAPHORE_REGISTER_POLL);
> > +		*cmd++ = 1;
> > +		*cmd++ = reg_sema.addr;
> 
> I think we can simply use
> 
> 		*cmd++ = STEER_SEMAPHORE.addr
> 
> and similarly in other places here and let go the local vars above.
> 
> > +		*cmd++ = 0;
> > +		*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) | MI_LRI_MMIO_REMAP_EN;
> > +		*cmd++ = reg.addr;
> > +		*cmd++ = value;
> > +		*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) | MI_LRI_MMIO_REMAP_EN;
> > +		*cmd++ = reg_sema.addr;
> > +		*cmd++ = 1;
> > +	}
> > +
> > +	return cmd - batch;
> > +}
> > +
> > struct wa_bb_setup {
> > 	ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> > 			 u32 *batch, size_t max_size);
> > +	ssize_t (*disable_null_query)(struct xe_gt *gt, struct xe_hw_engine *hwe,
> > +				      u32 *batch, size_t max_size, u32 value);
> 
> this is not how this works... you should define just your function, and
> add it to the array below as a "setup function".
> 
> > };
> > 
> > static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> > @@ -982,6 +1031,7 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> > 	const size_t max_size = LRC_WA_BB_SIZE;
> > 	static const struct wa_bb_setup funcs[] = {
> > 		{ .setup = wa_bb_setup_utilization },
> > +		{ .disable_null_query = wa_bb_disable_null_query },
> 
> should have been:
> 
> 		{ .setup = wa_bb_disable_null_query },
> 
> But also beware we are refactoring this a little bit, so on next rev you
> will hit some conflicts. See
> 
> drm/xe: LRC refactors @ https://patchwork.freedesktop.org/series/151152/
> More missing XeLP workarounds @ https://patchwork.freedesktop.org/series/149097/
> 
> 
> 
> > 	};
> > 	ssize_t remain;
> > 	u32 *cmd, *buf = NULL;
> > @@ -1000,6 +1050,18 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> > 	for (size_t i = 0; i < ARRAY_SIZE(funcs); i++) {
> > 		ssize_t len = funcs[i].setup(lrc, hwe, cmd, remain);
> > 
> > +		if (((GRAPHICS_VER(gt_to_xe(lrc->gt)) >= 20) &&
> 
> this check should be inside the setup function, not here.
> 
> Also, is this a WA? It's looking like it, which means you need a
> WA number, add it to drivers/gpu/drm/xe/xe_wa_oob.rules with the
> graphics range where it applies and then in wa_bb_disable_null_query()
> you use:
> 
> 	if (!XE_WA(gt, ...))
> 		return 0;
> 
> > +		     (GRAPHICS_VER(gt_to_xe(lrc->gt)) < 30))) {
> > +			if (lrc->flags & EXEC_QUEUE_DISABLE_NULL_QUERY)
> > +				len += funcs[i].disable_null_query(lrc->gt, hwe,
> > +								   cmd, remain,
> > +								   DIS_NULL_QUERY);
> > +			else
> > +				len += funcs[i].disable_null_query(lrc->gt, hwe,
> > +								   cmd, remain,
> > +								   ~DIS_NULL_QUERY);
> > +		}
> > +
> > 		remain -= len;
> > 
> > 		/*
> > @@ -1175,6 +1237,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> > 	map = __xe_lrc_start_seqno_map(lrc);
> > 	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
> > 
> > +	if (init_flags & EXEC_QUEUE_DISABLE_NULL_QUERY)
> 
> ahn? Please don't mix LRC_*_FLAGS and EXEC_QUEUE_*_FLAGS. This
> is a recipe for disaster. I don't see why you'd need to set any flag in
> lrc.
>

I think the caller (__xe_exec_queue_init) needs to go from
EXEC_QUEUE_DISABLE_NULL_QUERY -> to an LRC specific flag and pass it via
init_flags.

Matt

> Lucas De Marchi
> 
> > +		lrc->flags |= EXEC_QUEUE_DISABLE_NULL_QUERY;
> > +
> > 	err = setup_wa_bb(lrc, hwe);
> > 	if (err)
> > 		goto err_lrc_finish;
> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index d517ec9ddcbf..5b48befd32cd 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -344,7 +344,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
> > 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> > 			DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
> > 	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> > -			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
> > +			(DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY |
> > +			DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY);
> > 	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
> > 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
> > 	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index e2426413488f..adab49e63757 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -397,6 +397,8 @@ struct drm_xe_query_mem_regions {
> >  *      has low latency hint support
> >  *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag is set if the
> >  *      device has CPU address mirroring support
> > + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY - Flag is set if the
> > + *      device has null query support for anyhit shader.
> >  *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
> >  *    required by this device, typically SZ_4K or SZ_64K
> >  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> > @@ -415,6 +417,7 @@ struct drm_xe_query_config {
> > 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> > 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
> > 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
> > +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY	(1 << 3)
> > #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
> > #define DRM_XE_QUERY_CONFIG_VA_BITS			3
> > #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> > @@ -1270,7 +1273,16 @@ struct drm_xe_exec_queue_create {
> > 	/** @vm_id: VM to use for this exec queue */
> > 	__u32 vm_id;
> > 
> > +	/** DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - \
> > +	 *	Flag is set if the device has low latency hint support
> > +	 */
> > #define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
> > +
> > +	/** DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY - \
> > +	 *	flag is use to disable null query check for Anyhit shader
> > +	 */
> > +#define DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY	(1 << 1)
> > +
> > 	/** @flags: flags to use for this exec queue */
> > 	__u32 flags;
> > 
> > -- 
> > 2.25.1
> > 
