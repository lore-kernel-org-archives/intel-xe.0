Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C541E9A05F
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 20:33:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FEE810E0A4;
	Thu, 19 Feb 2026 20:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WqyKkaDQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13EC510E0A4
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 20:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771533219; x=1803069219;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0fMoQEiRhdUeMgGHuBIDxCweqGS8Uxv6bbw0dDANyHg=;
 b=WqyKkaDQA/UAAw8MSJZsE3UVH40oJmRC/35nBDLBRh0MlFXEFe8fYwob
 tal2DEg+qa+D4YAMRKM9FqQ4YOrXdU26Au2b5SPlVz6AVMYrDzhhQpxya
 ezyeEd1YHjrHAjGjYwqzovnfh1zn94Pqph/auAR6xUgeJ2qCAZKr7cS/s
 4pK7W/UrnkophHvl3+Cp7CD6e/Txh3QrnNRQvz2Da0lpR77NCKMRQtmih
 xdjsLxdtQTJHkA5p+TIaA6tyP//sGrFIVqAvg2vaNlqJrGaiBoOY8gCV3
 RRARXC1VUrU4w4qd95O8SAR4k388SL1gmtnx3YY2D6d9Fs8Sl8KfFMG84 A==;
X-CSE-ConnectionGUID: KOo/yWGORhuQqm9o0TLCRQ==
X-CSE-MsgGUID: jm4sjNJfSvKnYL2Wc4Qwiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="90040739"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="90040739"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 12:33:38 -0800
X-CSE-ConnectionGUID: s4okFZHZSb2ywd30bdwAIA==
X-CSE-MsgGUID: 8VadK2rHT5yKrkAEd5U4ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="218792646"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 12:33:38 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 12:33:37 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 12:33:37 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.26) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 12:33:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XzcpKsMcWU5e0gIwwyynTxL/EayygrrFJndLqoFFOhpkzaMZE+PganGLq/Bpgb7eBSjCdQMaguIlq7SMYBaUzM1V98VdytpfFzGIrhofRJ093VTgkSFz7vNDswv5goQv7PXZjBTOiQaOkTUos312L7fwL8JqoS6CifuyIIR4fXbbqZDSIiqDIaOVQFdw6AUui+ZDoEgNojb0hfuKKSdVLf8i6Wquczj4SbzbbZQDgs+ajKfLUgHA6SidTqEctn/beC5j/sRt101dttihwKzzW5+V3GQOxOi15NUS2YLic+lcWIaxyZWHaN/BSIsigGlDmjH4mD8Pv72ON9kfswY+xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpwQympWJApSnLjxfYaSgxMmEz1eM76glizdmVndDvQ=;
 b=Ng83a4oNa4UVGEy9ljrdkccCGnpH+Z9nBJO1eNzFEsBpRQDWMFn/QbSCN8w00j00k52S6jAaitm/6EGiQi2r2T2B/vuSxWfnLR95PCxkzH/sYkENS7pYODctylJkhMEUas3s4Ex//lYJMNgaW+Hk8rnAFjEKlD6Fmkpy54OtQOu/iW8FvaKJYBT5odwA1CMNsp32i4m5KiXSGGpcQJjldCnzcmwY97OZJEWgcr4aBVPWmm7OkMf+qvt7Qd769PGIBI8NnZzZrYYFODd9ufWQni+p+ut2iYRzYCxEkwLy0gKiJsIwcUN5qjOa/V1cqbZuWAQN8Hc329JmNhDAxe9tMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPFC222DF22F.namprd11.prod.outlook.com (2603:10b6:f:fc02::4a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.12; Thu, 19 Feb
 2026 20:33:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.015; Thu, 19 Feb 2026
 20:33:35 +0000
Date: Thu, 19 Feb 2026 12:33:32 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v2 5/5] drm/xe/vf: Use marker to catch fixups during LRC
 creation
Message-ID: <aZdznFXPHUm6QxYD@lstrano-desk.jf.intel.com>
References: <20260218232159.1726873-1-tomasz.lis@intel.com>
 <20260218232159.1726873-6-tomasz.lis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260218232159.1726873-6-tomasz.lis@intel.com>
X-ClientProxiedBy: BY5PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPFC222DF22F:EE_
X-MS-Office365-Filtering-Correlation-Id: 22ec2088-c280-44e3-d0a8-08de6ff6277c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GNMJKZugBFCNC1rqjEnW3d3hMk0XxNCk/F9RCwj4eq2JlTaVXWHMiqT6zs5Z?=
 =?us-ascii?Q?cRG1j8SCfvvriitVkF90RDvM1qUn0dUhJ9gjTtKG/aFmLJ7VXMseVtL+/Ix4?=
 =?us-ascii?Q?ojTW4mg66Gl/wKL0E97dEH8xPN3lg64cVyDhQzsSfcGAaiiUNb2lvSs0DJgD?=
 =?us-ascii?Q?R7TCkSEpBwU3tKhVxOAxbUqPPmyQWGKRNoRK/A9WGHPe4NcsmsH8v6xWgmRk?=
 =?us-ascii?Q?JIO0ztHNE8uUF6vypQJl9KAN3IPXEargKLzXcPF025s27h2Q17TYBDmq/mLK?=
 =?us-ascii?Q?JlxU0Di5/cM81MenZd0X2OawbSU8VmTVkMCS5RGOoAcDyodWmxE6u5xxY5oQ?=
 =?us-ascii?Q?3FkKK02PKZ1KSPALdzwm5XYfXRq3nNR66+ex3A32ZLyAlQ90AwX4YtWgTOFT?=
 =?us-ascii?Q?lZ5YXVP6nze+WjKYun2ZoBZeYNJ/qq+9f3WOcM8omf85B0EPLN9po8X5CdZ4?=
 =?us-ascii?Q?oj700MkG47OcQmOP6O1k0EPVTG91v2Qo6FsfujmF4zupoRNR7fQfFp4IJAbl?=
 =?us-ascii?Q?7Djr7jg8pmQxpyuthUKM176w1Rwi9rNZMzYMOlBo6TjA/oeJzjVznbzh/NbO?=
 =?us-ascii?Q?QA70Q8qwnb5Q7UGlZ25qUyQ0iOIqdePEnpcMENSssjnwMgW1JFWdik7HPWtp?=
 =?us-ascii?Q?Rx2rwr/6aWRoA9mMVAfc4bDQZHFAjIGRlQYQJwEJmemltXwVBNL/L40FaJAd?=
 =?us-ascii?Q?OHHWuSOJf8qefAcQgC3JNR9FjhKFJG4Jg16fo5WOV2Kz0HW+H8lIwc+qYbM6?=
 =?us-ascii?Q?oCmr7pUJnx+6kBd+iarIPJgQ9idlocoE7H3Ti0y6aH+MVK/fvyFJ02mp5wCB?=
 =?us-ascii?Q?6zaOnHbaRzWO6AYrYj/I+r8xvTa+9bxsTthbuwplplEWb5EqQLMdPf16CbqL?=
 =?us-ascii?Q?P3CrnSAOi6suI4J4PdOItRgLOzjLq60AyoUeps1kvxbhmmN+DKwmzr2KJO8+?=
 =?us-ascii?Q?xiU+8lwHPsxc/B4A27/8yZ6X1kAeaj22zc1Fi1ZMzG5YqjBMos245HQpClF9?=
 =?us-ascii?Q?qDdzs25X50HBhvWGK88vBYF/GX16Q7/Q3ioiLUYg20+qiKkTM1boM8EQ+bYJ?=
 =?us-ascii?Q?beRFhPVQ4WXgfFWVZij+wzKG1mj4Co4lm/NJ+WTg0FioJX5Rcn6B1bKq572y?=
 =?us-ascii?Q?IoEgmUmvmdqMoa96mRUgLAb67CbejMhqDtiP/ym74dY3kBrsSpRvldsFv/z7?=
 =?us-ascii?Q?1M6BI9f8wBUOpPGp1j9EmCVwGjc3ojVETvTVIyXaVQJRgvSrCDA9PImZ/vpe?=
 =?us-ascii?Q?ji+UbZwoBW2pSTdMFYyGZmkeJ3VTL6rGqk8Y6gshv41525mDDYNtNKW7A6Px?=
 =?us-ascii?Q?xySW/+q9ixH6dHZua5ntaIu9Tv/0ewfcIXNewY284/VVBUuwDnQny6hanJ6X?=
 =?us-ascii?Q?xMG1vjAB+MAeg3BOGV6GM792vLEKbJcfzRlVp145cvgsuocUkERR6DRkXrjb?=
 =?us-ascii?Q?jnzP8AP/4qBDm+UztqBvAArQyF2MT7lJrjLhaftNxgK9GGw9oH6C1cXMj8TO?=
 =?us-ascii?Q?l0rCEPGMjifM6xES9F+q0rXXahFXFiANGbW9eKHzTCBhN7469ZA4B5tfafZC?=
 =?us-ascii?Q?yT3x5Fe0zux+MpZDtIo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OdH5m4wSuFNvl79tNYYz3yleEURPNiQUTc1fiaKrRPhDujo5GTlKAEKQ/L/N?=
 =?us-ascii?Q?d1gLILo7oYobNdWFEdXcG5qBPkRT4nghn8V2kNmhrOxpTOpGFq753age2491?=
 =?us-ascii?Q?n7evsq6U1ewrr5776zALqxmj/dMyr2E5SMZz8dkED2fg2JZhEEs+bMNEgJbO?=
 =?us-ascii?Q?L7XAd/l0Ipbmme04WdCByZnYlBb1CevU+VHlyUzF1kSEhbeBiOesKU7C2xjR?=
 =?us-ascii?Q?xAlT4arwvVBH7vCXsb2BfRIRzRC3aqMnFq0PEfe8E2W70xNvNCh2IoNSvvUK?=
 =?us-ascii?Q?RQ0oDvpYPkJ68Td4kah/eE4T5ubKYxjp2/xJBH251NqlZskC3zPtRBIhENJ+?=
 =?us-ascii?Q?M5kWhjxEYS44VEBFlcs94vrPVw+h3j1ZEjkQ6aXhJnOBIDLq/wB1F+puPI9w?=
 =?us-ascii?Q?0Zv70Oh7OGj7mUS/DI7sil9oDHVGzBEwiNtvFyQVSPtnP8CMRpHOYlMFdlXl?=
 =?us-ascii?Q?QkaFS7AjQabfyVl6seAtGBSmF54ncOq7Pkq7RgHucsdB5T2MhRiHJSC5hyLr?=
 =?us-ascii?Q?Izc2Zn6bEfCyYP6nshm0iqMe8+gQHytRsbYpXMlSB9OenvXKvJeTOB3YVrhC?=
 =?us-ascii?Q?BKPwpu/H2G3XGkMhuIyFU2zsdxBAAxRPsGjhsU0RlnzzFMiyEw8bA/6BheYY?=
 =?us-ascii?Q?YrySCHGPA8JuZGVIyFT6Tq/cz8tr7lKwYW349fIJxFKYGZOvsKjpQu94KobX?=
 =?us-ascii?Q?kgibGasj5vuUSplahhcnGkZFi1fiXDqsWadigMtd9nymi0NOmH7Godvh/DQG?=
 =?us-ascii?Q?fL0JpaRsPfy7inKd44s+xvu52NO89IW523HnbzN8UNpf9KKjQUtwEf7uwM19?=
 =?us-ascii?Q?L6pUntt+eYnrcaoVm4JQxpGbh2TqRA/UAB2TeILUKw1gEm1NQsM4sW7CimPg?=
 =?us-ascii?Q?7GbJ1SEAlaACiBvkDPDNKnyDs+i4X607mX7MqCQRPM10UZRh6m0OhHnBnqds?=
 =?us-ascii?Q?FvBY+sJW3xBKMRSeJlFHXWec1H72LHu3Mxr7A2J7i6w3nEv9D1SAz51LJI+h?=
 =?us-ascii?Q?pS3LsnGsAWmbXe3C8nCEAoZpP3N9wGZQH2swkEPXKXcVhbHUNfSz/qewy9kg?=
 =?us-ascii?Q?gDaHta0YLTHb1bwcP8BLRLczKCMXIMJ7oyQYfBPb4UppjJEumzu5FXuYKOr7?=
 =?us-ascii?Q?7mprast8BG+91TG4I5/I204f9s9GfgrO5I/BrZ8um+KkOMxb6rXv9JC3//3t?=
 =?us-ascii?Q?HkQtw1KXCU6QxIT/WXIkUebRoOefc5ukLc71Wi2zZI1YeaiZgLpxtY2SKhi3?=
 =?us-ascii?Q?oMVon/9o2TC2SFbJhY1SbY5fLxHfqoKGJv1ulbhoJknYxF3eZUtriqtJP7nQ?=
 =?us-ascii?Q?bxLs2hXnn/d0lmEwKm+mctsx6V6jZa2ajQTewB1oN0ylYlBwQ3uAQv/HEnNR?=
 =?us-ascii?Q?+RezLOW82NwUcyv7pJF4dD/O/0hqOZeQ7ATyF1509qXad4Z/tTMHbu3eeSv3?=
 =?us-ascii?Q?KMGBalk1jytbwLzBTjTpWwmpLQw/by0eFwBxfRx+b14a+U98JwCl/CcMullH?=
 =?us-ascii?Q?q7xagrJH8Zy576STdBbXHQBWZ/Ef5Pe9dweRTKTObepH2ODHvZrvXhCWvPaL?=
 =?us-ascii?Q?nl7HmfFM6QF8NNCyNW+b7XswoT9iuF24I/PhIjUHxwBryEscvtrriVhOU1Tc?=
 =?us-ascii?Q?kk1ryEFPXoNYl8yPKI/fmTTSQ5kSy6d0h+bcWeospePPYSqesSfTzhsW0xSU?=
 =?us-ascii?Q?L8ELuLGmby2sqcwfelIN2M4wC7O4JY0X64Sj/HskQWWbeQ+mBpb/pE/DnL/l?=
 =?us-ascii?Q?UAgejj3MkGSlfxgSbnZT/KBQAHyY1D4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ec2088-c280-44e3-d0a8-08de6ff6277c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 20:33:34.9844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MCKk5rCi8u0/ItgctOrGS41CCayeB/bcw0d/p2wbPgFdJDh6tV9/1xPGQ8F5e5UNAm0IUHNmT/KG6iGEQcfLRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFC222DF22F
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

On Thu, Feb 19, 2026 at 12:21:58AM +0100, Tomasz Lis wrote:
> When LRC is created during fixups, it may have invalid state. Ensure
> that all such situations are caught, so that LRC creation can be
> repeated.
> 
> Due to VM having arbitrarly set amount of CPU cores, it is possible
> to limit the amount to 1. In such case, there is a possibility that
> kernel will switch CPU contexts in a way which makes previously used
> detection methods miss a VF migration recovery running in parallel
> (by simply not switching to the LRC creation thread during recovery).
> 
> This possibility is not only theoretical, it was revealed by testing
> that in a small percentage of specially crafted test cases, the
> resulting LRC is damaged and causes GPU hang.
> 
> With the additional atomic value increased after fixups, any VF
> migration that avoided the usual detection during LRC creation will
> be caught.
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c        | 6 +++++-
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 7 +++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       | 1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 2 ++
>  4 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 2ebf25a35557..a8d26fece38a 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -308,15 +308,19 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>  	 */
>  	for (i = 0; i < q->width; ++i) {
>  		struct xe_lrc *lrc;
> +		int marker;
>  
>  		xe_gt_sriov_vf_wait_valid_default_lrc(q->gt);
> +		marker = xe_vf_migration_fixups_complete_count(q->gt);
> +
>  		lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
>  				    xe_lrc_ring_size(), q->msix_vec, flags);
>  		if (IS_ERR(lrc)) {
>  			err = PTR_ERR(lrc);
>  			goto err_lrc;
>  		}
> -		if (!xe_gt_vf_valid_default_lrc(q->gt)) {
> +		if (!xe_gt_vf_valid_default_lrc(q->gt) ||
> +		    marker != xe_vf_migration_fixups_complete_count(q->gt)) {
>  			xe_lrc_put(lrc);

What exactly does this marker buy us? Couldn't patch #3 just signal
'gt->sriov.vf.migration.default_lrcs_need_fixes' where
'gt->sriov.vf.migration.fixups_complete' is incremented in this patch?

Then just drop this patch?

Matt

>  			i--;
>  			continue;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index ff9fb9196486..240c53b07eb3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1254,6 +1254,11 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
>  	return max(xe_lrc_reg_size(xe), LRC_WA_BB_SIZE);
>  }
>  
> +int xe_vf_migration_fixups_complete_count(struct xe_gt *gt)
> +{
> +	return atomic_read(&gt->sriov.vf.migration.fixups_complete);
> +}
> +
>  static int vf_post_migration_fixups(struct xe_gt *gt)
>  {
>  	void *buf = gt->sriov.vf.migration.scratch;
> @@ -1274,6 +1279,8 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> +	atomic_inc(&gt->sriov.vf.migration.fixups_complete);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 8c21b8ab2f16..4651c7f3335c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -41,5 +41,6 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
>  
>  bool xe_gt_vf_valid_default_lrc(struct xe_gt *gt);
>  void xe_gt_sriov_vf_wait_valid_default_lrc(struct xe_gt *gt);
> +int xe_vf_migration_fixups_complete_count(struct xe_gt *gt);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 8be181bf3cf3..41d6199e3508 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -54,6 +54,8 @@ struct xe_gt_sriov_vf_migration {
>  	wait_queue_head_t wq;
>  	/** @scratch: Scratch memory for VF recovery */
>  	void *scratch;
> +	/** @fixups_complete: Counts completed fixups stages */
> +	atomic_t fixups_complete;
>  	/** @debug: Debug hooks for delaying migration */
>  	struct {
>  		/**
> -- 
> 2.25.1
> 
