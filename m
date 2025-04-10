Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8633FC3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 05:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D49710E35E;
	Thu, 10 Apr 2025 05:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bTUaHQ2v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93ADD10E35E
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 05:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744263298; x=1775799298;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XBI2RHu6eHCfcqdYNvFSuXyuwVSssop6/ypYiGKFY0o=;
 b=bTUaHQ2vvLBQQjM96zh+7iA/Hzguz9sQRctq6XUPuXymXNQh0yeP0B1c
 XqyzpoYtFyAIE54mdArnhXCzv8tLtTTh4rdi2DTES3yt+F99GbgYVuRBL
 vmUhWa69YSt4jOnzIkjb9XFmnJS35TZQbR0yw1skR1Zdmi6BEaJF0FNmv
 O+A/DGaXCrrFeIGZ+Fs8z2nqNYcOT4hUbJ53uAno+WdVoyVDsR8DK10fC
 1b9lYoEyXHO2tOnaaAjabQ2gbl2PQhkltNWAljwILpAfw0t1/4DppFHfZ
 5MUui9AI8n+LBviqx/WsiAFMCyriPuF/DrGzLU0Pk5U/1IgMhSFaWC73F w==;
X-CSE-ConnectionGUID: 4r3bpOw1TT6RQuSmCGAULw==
X-CSE-MsgGUID: YaldMtNES6++iaJBmaSOhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="49602942"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="49602942"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 22:34:57 -0700
X-CSE-ConnectionGUID: p76MSLMFSjCex2OIMbFxhA==
X-CSE-MsgGUID: V00ZbJOETV6iFsYpDThdMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="129737603"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 22:34:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 22:34:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 22:34:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 22:34:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7GoRSk0ih8NMBVjfdSUnRwgbEJrGr0Ug2nUBZUkcmniVQGvWMNb1JsMVFY6i4HK5l4g2qOuMlNKQTd5LbeIEmsWgsAvGu0zEZrJcl4Du7NlHCQY9Y18qrhnKJNi28+Y5FyINpuscI2ila9tAxLcTRSXjMKLNZgUBKTK3mZAZY+x06A8ysgc8MVZ76zP5XNVFR6R2b96a1rNAUItQqcHeT/FwHX0sJuEJ/J2+3rYtp96xcy/pYNDFu5YtkY22vKBehjrW1xmqqWCcmH6KCEC5j6sHNKm+lqzELVAyV/KUsWyqWEY+QBdHcjJkNaLouaw6YrC45gA/82pf8Wa0pfPXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVajgzCKze3cNtsb4reHgHVFkX8vWYWbwTEDuJPetY0=;
 b=mMNUnewIlg6XLCTRoZhNwK1s2Y3JH8dvmMx3eUwYSdauxEpbA1qWCbfcjwdZ66gPRBz07MhTp/4bAfc15vkkiwi80/jB+eASIDl/45RaPb6WDn8YDtkrTodmwDrlySA9RwAY1LUvQbJc/CR5QH10kcfZ7R04UhvZ8rb4pDLFL/e2HQb5OxzZYKtoBMKDalGOCSOjrQMn3S6IiZTChrKVrHp/bh4/WDHBKgHIEdNVYhSxOVMkeO9bk2mDYTfjOpFyWZvfByJYrKm3TCnmcOONGQsD2QOTIYKSbeocjzrtuphB5SxHLMQGJvBh+Vz6LcEKsJn3kkIJtkNWvC7vLt0pzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Thu, 10 Apr
 2025 05:34:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8632.017; Thu, 10 Apr 2025
 05:34:53 +0000
Date: Wed, 9 Apr 2025 22:36:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Chee Yin Wong <chee.yin.wong@intel.com>, 
 John Harrison <john.c.harrison@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: Set LRC addresses before guc load
Message-ID: <Z/dYyioDSygp6STJ@lstrano-desk.jf.intel.com>
References: <20250409-fix-guc-ads-v1-1-494135f7a5d0@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250409-fix-guc-ads-v1-1-494135f7a5d0@intel.com>
X-ClientProxiedBy: MW4PR03CA0199.namprd03.prod.outlook.com
 (2603:10b6:303:b8::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bdc43d6-bf88-4480-3cca-08dd77f16bc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qm7fUBb1LymbhTSMOk1tXfjcvuxsUXza3Ok4zaBdOk+DAt3oiUuJTME8C2ts?=
 =?us-ascii?Q?nGFN+aIJ9+v3c7QzGl3mQ5UaK7LOG/qu11AFMTToJK9xG/ABXpMIjRZTk196?=
 =?us-ascii?Q?o0Oc8RZFscdEjai8dgEUsYi+801CUe5PVjevTx8Nm2CuBiEVqjhmkzpfnix6?=
 =?us-ascii?Q?d/iilLpw0KfYkVC4JGyrzphuYWJAHkCOypji7mqwlrmddEMY/EZ2twZULBO3?=
 =?us-ascii?Q?5JSf5jOEdu8G/+4Irdg0xRxWRUni8uvEylRt5aovhPaSMG9SSP1PVsjeJfAm?=
 =?us-ascii?Q?XQ2E0BLLhNVaqXq5S1gRCB/HH24fMcd6XULUjgE4mAnoi0H/H65CvqqlVTx6?=
 =?us-ascii?Q?A9qC2BDnUE4PGvvjqRZcF+PNuRx1jedo9ctoLRKLw2s3WWPDpXi0+GSImL5O?=
 =?us-ascii?Q?IhyVRardW+++sP2phLkFL0ZPcwCfFasWS20EZy+Q0DkzZdrQPCr2RzTkTSdK?=
 =?us-ascii?Q?mYmNwzysSxyHNrmHPqTVRxfg1myYbCWFVo76oAek4MyJ2dm41P2o85zfbtAf?=
 =?us-ascii?Q?xLufF+gN6JhaezfRK7ZHY8yHG1ZZRsgzb1KW1X8cLDQyH0cvvylHiKQuTjs5?=
 =?us-ascii?Q?G1/RZGZBOKQixNMUcxPOORH75718QR2upDoAa/tl5bcI2qQBE2xPKtdAILqu?=
 =?us-ascii?Q?B1ppgBpPXVW1LsyMPqJMSxr4VD+m5eEXnRDm3k6Jnhr3LMal/SWw+Vpzpr3h?=
 =?us-ascii?Q?LATGTWUT8KX9/6QbQ7JA8Z92bcQW+ouPTtrN0mlGQqkxVeRpN9Qac7LWW376?=
 =?us-ascii?Q?yJL4DH+jamr/dcCR36sRu0ElT4cwWkvd1SoJBtZ5drIHauupIBOv0FmROiqg?=
 =?us-ascii?Q?b9nAaiJmqdfx0Klpz+JYgvMZXD5LjMtWunzTdOI2qW7OHWyyouVrvh/L+urk?=
 =?us-ascii?Q?MgbK16XvRBFIFyZV0e0jesUhdfLOb4vv0cqK9IdBsg9o9TgItVMct04+BggF?=
 =?us-ascii?Q?iBqEpN2XwNC0Pf1hS20X1YUWIqRRSNSBBRKAqLBDtXRmeuD+ZBldnP0TcCIe?=
 =?us-ascii?Q?AepJVIAI/BFWFDbzeTlFF0rcq53rnFTKYg7yK9gBbERMIUw/CBj2MQ8khu//?=
 =?us-ascii?Q?NUrZ5NeuKRyuP53n5HzzvnFUx3DKsQ6mLmR5STejpdpNhBMmR0hJ0zF6NZcy?=
 =?us-ascii?Q?u/VyRJhoTfMnHmceEooOCv9KjYHUGT0ebWAk+OVAdOfrJiFGVYnVgpqb39dG?=
 =?us-ascii?Q?eIVpKEhHCOlGaS9CG6bLfgOIhY6hqltW+QPKTGcpWtUz2y/y9ysjC/228NRX?=
 =?us-ascii?Q?4QrWAlaEya36rcqtAZfY+qxnjlbFpavZa2PqiFeDpZ39Q5OVNavq3BML+diJ?=
 =?us-ascii?Q?sCekl4lLZ2lekAC3nII6YxGj40nBY9X/SsDXQ4Xy0vvGqfeOUz00FbP02JuQ?=
 =?us-ascii?Q?SwkybxkxJYbtsedTlfzrdON+8HR+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zrr3hh5osgPOUHMST/mvANuwIf2vgjMdiybVO17W6rMAwAZ1DSHhBHDJUykV?=
 =?us-ascii?Q?XgUr83fS4wVF1NeNQoG5rJfxm5lON16EId8HGf3jbOOoJUciv07obsP+UM7v?=
 =?us-ascii?Q?V38BmEAYzyLwrPpoIUOzz91wmXx1ZXAUVwRRf9i7owT2pOiAp9XKYSzzdMHu?=
 =?us-ascii?Q?c7kI3gQRMJ8wqoUglq6p00yO49Z3Rs/aX4bmwNBAQogjptOOIXedml/ZRF8g?=
 =?us-ascii?Q?nTXLPeOU/zOlPJp4viVJKI8Efen4j15KyWLGh6BL7kajqfLPpjdhm3pqNQn4?=
 =?us-ascii?Q?7P2JhnCZAPe+9f37yq8lSuqi/KqDaXn2OFl0xPkRw9uasm/F+/ciAiDDKc9R?=
 =?us-ascii?Q?LMyVkjwAhbVVF9ctmS1kENnG42hoq315fpoXdBSF811JgvnQ0AoqoJ+rOHXZ?=
 =?us-ascii?Q?A7Nbea/gK2ADfQKbSqWlkc1qaDANA/ZkDsdLxNDdvkEzp+E+BCBl/JbgvuOF?=
 =?us-ascii?Q?mYhwoViE36DaqqoHItMEcJXYn59LrEJEVqRFC4cjNScNMvJ/Cim5Whx8EHlV?=
 =?us-ascii?Q?V/QwECQoqQ+4tZxfbHYBxmytQ3BgBxbhCn6oq1z9UOo+IhGcRTUvTWmbUNGi?=
 =?us-ascii?Q?nf+18XiMDS8rOb/EabLIGK+hOoBB11pljNSvaQ6bKt3xG2Mw45O5gLkfITQC?=
 =?us-ascii?Q?mtciW5EP1ThqUGFWs23EKfm+Ub7pL4c9RSVo5KMXvO5jb9nRhewGiFnF/ahb?=
 =?us-ascii?Q?Wczyntdfyxg4KL79nVIWdOG7plxMUObHVEjbhRLl/9Oi6vMVYNG0bUosJTPo?=
 =?us-ascii?Q?svwesXz7k/Enhd2FGv0xhW+/N251XygxPFVAFmePe7sVt3PbJwV9WNDsQ9w7?=
 =?us-ascii?Q?TQtqYBs3K69uu7iJDJFvt+K6Gy4ud6AeC5IAJvnamyGWuGf88ODTjUJ7Avu2?=
 =?us-ascii?Q?+2vTIgbe6I3Q5TOS6YYn2e/Ms554e93VXugzwTEm+vM+cUDp9zN6Y9wkiZhQ?=
 =?us-ascii?Q?K1y9OG8QmU6VlWkePs0VPAD6oLBb694cvv6ghv5Mh2yt0LXH+1D5Om9fcm3w?=
 =?us-ascii?Q?wsvT5hosUKxpdD0t1g3/ATYtQ7+Xe2qVU/32diPXoS7Wx5DFQrIAKhN4yyHn?=
 =?us-ascii?Q?3WvN4BNCTGnHuWW7bCJNU2Nvwaw32lzhHo7W8SWEIcrXG3IV9reD3IJ/CLwX?=
 =?us-ascii?Q?SB1Nm3qwLtbw5jEZ81Zfzxl7cUkG6zN/AWXXeeQtK9/rV6jZr9T70HnozOf3?=
 =?us-ascii?Q?1T0WVIBxjY+T2kc+OpbcM5lsRLa3mM/CCeANskAVei5nITes8GAf/toPPG1c?=
 =?us-ascii?Q?cCo1OhW15YvYlOc6d8j/5Mhd/a/6WHRXYgiqE+e4vV4RruAGs0Rl4TwZE4g9?=
 =?us-ascii?Q?T9QpyVZ/8MXte4rDFQZpoDdeMbYEcjdBw+G5EZpn/FPzcMEEL4EnK7UUxShk?=
 =?us-ascii?Q?6Iu8rZGKMIk7ulUb9jawEYm/Ix6f5Ce6NI5bX+WjMxjGVTManjkGOBtzwXX6?=
 =?us-ascii?Q?8MkIVORHGpfn7I+c10/h6QJuTyBOHOWV52+wD42T9MX6w7skedQlilWTu1Hu?=
 =?us-ascii?Q?e97u4Jb785Lgn4BQxL4hjrJVqAJBCaiCWfyCup3GH/ip0xd7wSw6vmbhdbxP?=
 =?us-ascii?Q?738Drti3lPnv2RvL2pITN844aAXw0RdB/BwtQ+KwuZchRLIC6uQw0j+bOyRh?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bdc43d6-bf88-4480-3cca-08dd77f16bc6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 05:34:53.7134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SE3UFjP93m9q6zyzRFbXFqPW6T6np9Oqtrm6zTNC0Vvii9uaMrVFlh8XYC9cdUyNZIuZ5c1EkKzJ5tBTO5Peg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7862
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

On Wed, Apr 09, 2025 at 09:59:34PM -0700, Lucas De Marchi wrote:
> The metadata saved in the ADS is read by GuC when it's initialized.
> Saving the addresses to the LRCs when they are populated is too late as
> GuC will keep using the old ones.
> 
> This was causing GuC to use the RCS LRC for any engine class. It's not a
> big problem on a Linux-only scenario since the they are used by GuC only
> on media engines when the watchdog is triggered. However, in a
> virtualization scenario with Windows as the VF, it causes the wrong LRCs
> to be loaded as the watchdog is used for all engines.
> 
> Fix it by letting guc_golden_lrc_init() initialize the metadata, like
> other *_init() functions, and later guc_golden_lrc_populate() to copy
> the LRCs to the right places. The former is called before the second GuC
> load, while the latter is called after LRCs have been recorded.
> 
> Cc: Chee Yin Wong <chee.yin.wong@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Fixes tag? Anyways patch LGTM.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ads.c | 75 ++++++++++++++++++++++++-----------------
>  1 file changed, 45 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 88400f249e614..2a227213c37ff 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -491,24 +491,52 @@ static void fill_engine_enable_masks(struct xe_gt *gt,
>  		       engine_enable_mask(gt, XE_ENGINE_CLASS_OTHER));
>  }
>  
> -static void guc_prep_golden_lrc_null(struct xe_guc_ads *ads)
> +/*
> + * Write the offsets corresponding to the golden LRCs. The actual data is
> + * populated later by guc_golden_lrc_populate()
> + */
> +static void guc_golden_lrc_init(struct xe_guc_ads *ads)
>  {
>  	struct xe_device *xe = ads_to_xe(ads);
> +	struct xe_gt *gt = ads_to_gt(ads);
>  	struct iosys_map info_map = IOSYS_MAP_INIT_OFFSET(ads_to_map(ads),
>  			offsetof(struct __guc_ads_blob, system_info));
> -	u8 guc_class;
> +	size_t alloc_size, real_size;
> +	u32 addr_ggtt, offset;
> +	int class;
> +
> +	offset = guc_ads_golden_lrc_offset(ads);
> +	addr_ggtt = xe_bo_ggtt_addr(ads->bo) + offset;
> +
> +	for (class = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
> +		u8 guc_class;
> +
> +		guc_class = xe_engine_class_to_guc_class(class);
>  
> -	for (guc_class = 0; guc_class <= GUC_MAX_ENGINE_CLASSES; ++guc_class) {
>  		if (!info_map_read(xe, &info_map,
>  				   engine_enabled_masks[guc_class]))
>  			continue;
>  
> +		real_size = xe_gt_lrc_size(gt, class);
> +		alloc_size = PAGE_ALIGN(real_size);
> +
> +		/*
> +		 * This interface is slightly confusing. We need to pass the
> +		 * base address of the full golden context and the size of just
> +		 * the engine state, which is the section of the context image
> +		 * that starts after the execlists LRC registers. This is
> +		 * required to allow the GuC to restore just the engine state
> +		 * when a watchdog reset occurs.
> +		 * We calculate the engine state size by removing the size of
> +		 * what comes before it in the context image (which is identical
> +		 * on all engines).
> +		 */
>  		ads_blob_write(ads, ads.eng_state_size[guc_class],
> -			       guc_ads_golden_lrc_size(ads) -
> -			       xe_lrc_skip_size(xe));
> +			       real_size - xe_lrc_skip_size(xe));
>  		ads_blob_write(ads, ads.golden_context_lrca[guc_class],
> -			       xe_bo_ggtt_addr(ads->bo) +
> -			       guc_ads_golden_lrc_offset(ads));
> +			       addr_ggtt);
> +
> +		addr_ggtt += alloc_size;
>  	}
>  }
>  
> @@ -858,7 +886,7 @@ void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads)
>  
>  	xe_map_memset(ads_to_xe(ads), ads_to_map(ads), 0, 0, ads->bo->size);
>  	guc_policies_init(ads);
> -	guc_prep_golden_lrc_null(ads);
> +	guc_golden_lrc_init(ads);
>  	guc_mapping_table_init_invalid(gt, &info_map);
>  	guc_doorbell_init(ads);
>  
> @@ -884,7 +912,7 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
>  	guc_policies_init(ads);
>  	fill_engine_enable_masks(gt, &info_map);
>  	guc_mmio_reg_state_init(ads);
> -	guc_prep_golden_lrc_null(ads);
> +	guc_golden_lrc_init(ads);
>  	guc_mapping_table_init(gt, &info_map);
>  	guc_capture_prep_lists(ads);
>  	guc_doorbell_init(ads);
> @@ -904,18 +932,22 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
>  		       guc_ads_private_data_offset(ads));
>  }
>  
> -static void guc_populate_golden_lrc(struct xe_guc_ads *ads)
> +/*
> + * After the golden LRC's are recorded for each engine class by the first
> + * submission, copy them to the ADS, as initialized earlier by
> + * guc_golden_lrc_init().
> + */
> +static void guc_golden_lrc_populate(struct xe_guc_ads *ads)
>  {
>  	struct xe_device *xe = ads_to_xe(ads);
>  	struct xe_gt *gt = ads_to_gt(ads);
>  	struct iosys_map info_map = IOSYS_MAP_INIT_OFFSET(ads_to_map(ads),
>  			offsetof(struct __guc_ads_blob, system_info));
>  	size_t total_size = 0, alloc_size, real_size;
> -	u32 addr_ggtt, offset;
> +	u32 offset;
>  	int class;
>  
>  	offset = guc_ads_golden_lrc_offset(ads);
> -	addr_ggtt = xe_bo_ggtt_addr(ads->bo) + offset;
>  
>  	for (class = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
>  		u8 guc_class;
> @@ -932,26 +964,9 @@ static void guc_populate_golden_lrc(struct xe_guc_ads *ads)
>  		alloc_size = PAGE_ALIGN(real_size);
>  		total_size += alloc_size;
>  
> -		/*
> -		 * This interface is slightly confusing. We need to pass the
> -		 * base address of the full golden context and the size of just
> -		 * the engine state, which is the section of the context image
> -		 * that starts after the execlists LRC registers. This is
> -		 * required to allow the GuC to restore just the engine state
> -		 * when a watchdog reset occurs.
> -		 * We calculate the engine state size by removing the size of
> -		 * what comes before it in the context image (which is identical
> -		 * on all engines).
> -		 */
> -		ads_blob_write(ads, ads.eng_state_size[guc_class],
> -			       real_size - xe_lrc_skip_size(xe));
> -		ads_blob_write(ads, ads.golden_context_lrca[guc_class],
> -			       addr_ggtt);
> -
>  		xe_map_memcpy_to(xe, ads_to_map(ads), offset,
>  				 gt->default_lrc[class], real_size);
>  
> -		addr_ggtt += alloc_size;
>  		offset += alloc_size;
>  	}
>  
> @@ -960,7 +975,7 @@ static void guc_populate_golden_lrc(struct xe_guc_ads *ads)
>  
>  void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads)
>  {
> -	guc_populate_golden_lrc(ads);
> +	guc_golden_lrc_populate(ads);
>  }
>  
>  static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_offset)
> 
> 
> 
