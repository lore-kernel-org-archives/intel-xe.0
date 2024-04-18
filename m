Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E34C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 14:55:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A314113D32;
	Thu, 18 Apr 2024 14:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mza3+RP/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB495113D30
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 14:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713452121; x=1744988121;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ztbdOaymVZq0SbbbFbpVisdnNbxehFlys2gbkX3x7PE=;
 b=mza3+RP/R4PMEfaosIvlCni3Ur2je7rdo4kMWSCEij9blBzmudjXMC4S
 B5f7nrNX5mvwELLuqOiWtkl8dSBeNCnHa7wEzwzyl/vQVCiXYOIWCYETz
 klIz1ndm0f+vOG0CKg7cTWgLKdxlhZSHTFS9iBJyXCmEL5UEFTALevZzb
 EdEZiidPVS8KNNfOh+WCHKyb6UvbCv5rfY4dxrxwq2g4463FZa/9Aotqy
 ebBHQQUbzgoU1qNQEdZG0ra/nDy+soGHBXUGCWePCFuImkpFK0W4Xlj4V
 d/cj7dA/FKf/4fIjhlpu0R4kwz4yVr3sGxJrU0y2MVQHaVabo9LRXvEP/ A==;
X-CSE-ConnectionGUID: 8AYdQUmcQte9BOirHV475w==
X-CSE-MsgGUID: J94jo07ZTQWilr86q1W+3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="19704511"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="19704511"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 07:55:05 -0700
X-CSE-ConnectionGUID: XqKXJt9iQW244XRAdDFOLw==
X-CSE-MsgGUID: 01hJYCx5R3ShOnBYb5YYyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="23450380"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 07:55:04 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 07:55:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 07:55:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 07:55:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RnScYjb/UBlP4VCtM904xIr8Zj3psxvcPdxykoWqjha8EJivqnuJVydpVuZiAN9SwAasOoPx1hJXWQ9YsWvdlAMfFcFHO0SvJIaI/au286rijxx1ncP8vNHEj5S18bZVYr4Amt2PTIEJJqtW0kT1D2jEoaXWzoNGJmyEvLc3Qq/BBcRsSFgM39i9uokhB/aWE/q9iatV7BMKbaaPdo5WAgNpw6PL6O2FfZXwyO4LvEgt5Sm9ts2uzU0GQQeSH+yHXjIvkRSOurty168w4XaIujf9zysOgXE5MRNDzCftPqHcd5b22hY81adtnTeXmYNo//SFHxvF8PPweht3T7cifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zo/Z0tLMcZdXG1XKbeJ0yD/2Z4hAq4nR0J1hhJTKy3U=;
 b=hkmhb2hceJhcjGKaSAwIyBmmuOnkFGnNb8m43/kSw7O7xL+ryN0BBv7MuNyIvOPLVgeuWtJa56HkFi7NXP6vi633nCxkQfZUE0eCvTFV8O/tce1CigFJ0jd74iTRjWI4OdtvpAsgsgtXTs4S1ORcS8o9CIxFHiFOI/+V2uerE1gHZasNON1mtl2w95NlVNBN08VYwRju1gp4D74sgYoQECrdsNdhUvuyCrxmGSnPGQtI+iZBXIRj4XV6k7Kb6rzUUBINf8ApKpZQyQx4dSRJXG6byXLsZk59uv7tXdgy5IELpLIjsl5ZOcTlByB+gvVeZkFvl5gK24N6Vq8rUY7ZMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB8234.namprd11.prod.outlook.com (2603:10b6:610:190::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Thu, 18 Apr
 2024 14:55:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 14:55:01 +0000
Date: Thu, 18 Apr 2024 09:54:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 5/7] drm/xe/gt: Abort driver load for sysfs creation
 failure
Message-ID: <ng6h5mittqwvuab6hvxaq53fleqminvgvex6j5b5ldwia527lf@5anxka7onnt3>
References: <20240412181211.1155732-1-himal.prasad.ghimiray@intel.com>
 <20240412181211.1155732-6-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240412181211.1155732-6-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BYAPR08CA0002.namprd08.prod.outlook.com
 (2603:10b6:a03:100::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB8234:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b2c8032-bab2-43aa-806d-08dc5fb785d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RW/buAxCBHLIGwBYxylgvI6dByHWpKyEvmYTm72uxLd57xQafs7cIXKJpOrwF+22AOmXWSeUBVk1dr4iB457piquKAlXuN2AwcFtPvYLrmncz82cq2KbN0EG41yNPBKkOlQXySWHjHA1vjcBZjG67Y7n1BtQQEzFS77UhHfbgoe+dgBgDSZxyJxbooiOUAfwPMDXbuU7gWFmvjTGSgCPbYXHiDtumZlsmJBslqgdde1SQ57fiybNwjvmikKt0IIKRar5HAjJNcBbPI/Px5N4w3qi6x58HLBhi7jj2nIOTnEdpoabEaEZAQP8r3B2ibM7l0xS4ZpbXTXfHdnHfQo1gLPxYN7wGPcRaayrtvF85bLlES8pbQ5Gd4gx8LVuWTNk8oquHgc6CgVnX96+7t2RNwsxannLunJdpQe1X6k8An4p1VXMlpBkconbQZlcIaPxfh6g16hwp7zXZr3suWKPEoWQlMvuL5XO+6bDNHazaGgLeBOaPpO7EvcaBR4m6EVaR7V5VFtlQnQGr7D8ZOTN4FXemjacvIYqIDQKFvto4NB3ee6ZDPbjYMGTERvZqu4PPk1NXy0XbWyrGY+zRxZAX/AYb9FVYjX5r+usqTmgxWY8BA6N0tIWE60E0NTItsSe3Ud3O4TJD9+TsTBsvCc9LZaP68PnSmcHTvZon7IUbWc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OEFKoP1BV7JaB38nMcb78tFO30SymgJVcHQlgabpZ1bJ4B8sfFXOcTo/Gi+t?=
 =?us-ascii?Q?VwDEE87xiORTC9X1DoVkUwf/E2Ay8bTE8fg6oIIcM7z0Lp1+84FNhGuu9mks?=
 =?us-ascii?Q?Ppn4SVQwxKQ7jfsPSaeQ/yduiVIzlz2L0oaPawRRGUIkq7PMGv0lYR8ojO8z?=
 =?us-ascii?Q?di+RPwYOnX0hDcTcF8K2sMkiS6jSGHJhephHtFNJrSfXn1DEZlH8E6MZMeVQ?=
 =?us-ascii?Q?TWMT83r8QvV8BUDl/iSS/faP4AG5K+SkdBN8NWHTmBrvZBlH8416WFw/nE46?=
 =?us-ascii?Q?OffwM48OoPm2t+PJZ47+kwM5n0hVja12CgeSTYJeNsCSbTmH2mh7t9VJAQW6?=
 =?us-ascii?Q?s7RP6aLBuHD6fQmE0MB7tIzijbS7aGRkIp+gtD4utA8M47npUICsV4WBiw+8?=
 =?us-ascii?Q?n6pMiStL7FIDcgwJ0doAVZT/Xm7a/z6jopXifZRtlRxBkUWvA7L3FD3ad8HG?=
 =?us-ascii?Q?0cefolPO22faLLVVV0laFtrHlrgZ6VwvQ1kEmCaEGLfq79OKlgqOUuO6NzRG?=
 =?us-ascii?Q?jR4F9qesqnTCcbYBwbZ9GLkhyQdruorBhoBR+YqngOjSHA0SifGD67QN/PMl?=
 =?us-ascii?Q?MKY1+ZZ02JepQmCDZHxLG8ukJw7OWridSpf2/YD5K6ZrNPPxN1JmbKw3xBQC?=
 =?us-ascii?Q?x62snglQ3os121b1MlzcVUoOpgxEDprzSKdF1IMsSjSBklnm0BzhrY/KqHov?=
 =?us-ascii?Q?1ujBDnxPBk0LdSVIcumK1858k5qUnxonWSo0ge7wgOZv8r0GWYV3s77GCZxF?=
 =?us-ascii?Q?gt7GTt4KSrgvfk1hYcqBTdrVba7dbMq/v9IFp84ZVOFKNsG7uv27laRjWCQK?=
 =?us-ascii?Q?fFlVhY6vVFVEVqUrxrqtJ6kN+62gwi4yQkv1SLJ199WNwWwxruTpVONabV2j?=
 =?us-ascii?Q?HslFvkIa8rQ+fH1O79B0ao/ypaaSVTPYQ6utlq0iT7wfw8jEP7sxJX8YyX9h?=
 =?us-ascii?Q?IBqp41aKj8zL8z5Z+5Dw+V4nQbRmJO/V/gEd+9rwdCbX4Y71W7yFq0dSNS/I?=
 =?us-ascii?Q?laTvcyDAHLGINdKB4qg54I/+W2ew0qin/951NhgQ0KK7kEKajWmmWMWTOwvP?=
 =?us-ascii?Q?gdsCx0b1REzKKX4CY8Cu/ad5sLOh0bDJOxLs0+71XPzMp1yIQCBi9tjsJ5aF?=
 =?us-ascii?Q?aBP8+4iyihs5g+1fLIXgalYeqkWDVtHx4OZS+sCppEKG5B2vyFRxYh2v9twS?=
 =?us-ascii?Q?hwbC0j5pHJsofmz1WHZnrKYjFMdp46PYIserygP0KHFj46m0UBc+TqUmmxMx?=
 =?us-ascii?Q?VoNHRK1vaq5QqWUmS+Hp5Rli4LJHbC/iWEI+GXL8XQ2+E7R7v3rw5f7GANzA?=
 =?us-ascii?Q?e3sq0/MM8Brbw/8XL9T6MKEwCCBC5I/vjtGRjjTHdwL42kz/J5jj+5Q9m7q2?=
 =?us-ascii?Q?spbMJoC5TwDYfLNQqtSTk1jIjwgxXXm/RLKEfVumCTdM/jBtGi/LpKyGXfro?=
 =?us-ascii?Q?mDMIkK8ZgQatzPW7O18+WUBDgwwFNRulIBxDtDI88jotNGfI54Hs6zshmgy1?=
 =?us-ascii?Q?kGIO0XGRr31Emj6Hl+b9bPXCK/4R66BuH3aMwr6xFrha2/Xua2tEMolf7Kh2?=
 =?us-ascii?Q?bzjoISHe2jb5ccksyMFZ1lxtX1zGUQcGRS9ZoVVurvSE4qqa/bVhnuJ4IZIv?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b2c8032-bab2-43aa-806d-08dc5fb785d8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 14:55:01.1163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ffysBhKVE2Vi3GnNBxyTJuOJa3qkJCWIxQSixXik2oFnBMNsu1Etcw7iWTVYIJnYnR9hfFs14Etax6XKAg2YRMiInRDDcUB30sewSLaCrho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8234
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

On Fri, Apr 12, 2024 at 11:42:09PM GMT, Himal Prasad Ghimiray wrote:
>Instead of allowing the driver to load with incomplete sysfs entries in
>case of sysfs creation failure, we should terminate the driver loading.
>This change ensures that the status of all gt associated sysfs entries
>creation is relayed to xe_gt_init, leading to a driver load abort if any
>sysfs creation failures occur.
>
>-v2
>use err_force_wake label instead of new. (Lucas)
>Avoid unnecessary warn/error messages. (Lucas)
>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

good cleanup of boilerplate copy and pasta we had.

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_gt.c                    | 16 +++++++-----
> drivers/gpu/drm/xe/xe_gt_freq.c               | 25 ++++++++-----------
> drivers/gpu/drm/xe/xe_gt_freq.h               |  2 +-
> drivers/gpu/drm/xe/xe_gt_idle.c               | 16 ++++--------
> drivers/gpu/drm/xe/xe_gt_idle.h               |  2 +-
> drivers/gpu/drm/xe/xe_gt_sysfs.c              | 14 +++--------
> drivers/gpu/drm/xe/xe_gt_sysfs.h              |  2 +-
> drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     | 13 +++-------
> drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     |  2 +-
> drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c |  6 +----
> 10 files changed, 38 insertions(+), 60 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 68534b7853f3..ce7eae094c41 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -360,7 +360,9 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> 			xe_lmtt_init(&gt_to_tile(gt)->sriov.pf.lmtt);
> 	}
>
>-	xe_gt_idle_sysfs_init(&gt->gtidle);
>+	err = xe_gt_idle_sysfs_init(&gt->gtidle);
>+	if (err)
>+		goto err_force_wake;
>
> 	/* Enable per hw engine IRQs */
> 	xe_irq_enable_hwe(gt);
>@@ -374,9 +376,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>
> 	err = xe_hw_engine_class_sysfs_init(gt);
> 	if (err)
>-		drm_warn(&gt_to_xe(gt)->drm,
>-			 "failed to register engines sysfs directory, err: %d\n",
>-			 err);
>+		goto err_force_wake;
>
> 	/* Initialize CCS mode sysfs after early initialization of HW engines */
> 	err = xe_gt_ccs_mode_sysfs_init(gt);
>@@ -548,13 +548,17 @@ int xe_gt_init(struct xe_gt *gt)
>
> 	xe_mocs_init_early(gt);
>
>-	xe_gt_sysfs_init(gt);
>+	err = xe_gt_sysfs_init(gt);
>+	if (err)
>+		return err;
>
> 	err = gt_fw_domain_init(gt);
> 	if (err)
> 		return err;
>
>-	xe_gt_freq_init(gt);
>+	err = xe_gt_freq_init(gt);
>+	if (err)
>+		return err;
>
> 	xe_force_wake_init_engines(gt, gt_to_fw(gt));
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
>index 32b9a743629c..855de40e40ea 100644
>--- a/drivers/gpu/drm/xe/xe_gt_freq.c
>+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>@@ -222,33 +222,28 @@ static void freq_fini(struct drm_device *drm, void *arg)
>  * @gt: Xe GT object
>  *
>  * It needs to be initialized after GT Sysfs and GuC PC components are ready.
>+ *
>+ * Returns: Returns error value for failure and 0 for success.
>  */
>-void xe_gt_freq_init(struct xe_gt *gt)
>+int xe_gt_freq_init(struct xe_gt *gt)
> {
> 	struct xe_device *xe = gt_to_xe(gt);
> 	int err;
>
> 	if (xe->info.skip_guc_pc)
>-		return;
>+		return 0;
>
> 	gt->freq = kobject_create_and_add("freq0", gt->sysfs);
>-	if (!gt->freq) {
>-		drm_warn(&xe->drm, "failed to add freq0 directory to %s\n",
>-			 kobject_name(gt->sysfs));
>-		return;
>-	}
>+	if (!gt->freq)
>+		return -ENOMEM;
>
> 	err = drmm_add_action_or_reset(&xe->drm, freq_fini, gt->freq);
>-	if (err) {
>-		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>-			 __func__, err);
>-		return;
>-	}
>+	if (err)
>+		return err;
>
> 	err = sysfs_create_files(gt->freq, freq_attrs);
> 	if (err)
>-		drm_warn(&xe->drm,  "failed to add freq attrs to %s, err: %d\n",
>-			 kobject_name(gt->freq), err);
>+		return err;
>
>-	xe_gt_throttle_sysfs_init(gt);
>+	return xe_gt_throttle_sysfs_init(gt);
> }
>diff --git a/drivers/gpu/drm/xe/xe_gt_freq.h b/drivers/gpu/drm/xe/xe_gt_freq.h
>index f3fe3c90491a..b7fddbe7b9b6 100644
>--- a/drivers/gpu/drm/xe/xe_gt_freq.h
>+++ b/drivers/gpu/drm/xe/xe_gt_freq.h
>@@ -8,6 +8,6 @@
>
> struct xe_gt;
>
>-void xe_gt_freq_init(struct xe_gt *gt);
>+int xe_gt_freq_init(struct xe_gt *gt);
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
>index bc1426f8d731..8fc0f3f6ecc5 100644
>--- a/drivers/gpu/drm/xe/xe_gt_idle.c
>+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>@@ -152,7 +152,7 @@ static void gt_idle_sysfs_fini(struct drm_device *drm, void *arg)
> 	kobject_put(kobj);
> }
>
>-void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
>+int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
> {
> 	struct xe_gt *gt = gtidle_to_gt(gtidle);
> 	struct xe_device *xe = gt_to_xe(gt);
>@@ -160,10 +160,8 @@ void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
> 	int err;
>
> 	kobj = kobject_create_and_add("gtidle", gt->sysfs);
>-	if (!kobj) {
>-		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
>-		return;
>-	}
>+	if (!kobj)
>+		return -ENOMEM;
>
> 	if (xe_gt_is_media_type(gt)) {
> 		snprintf(gtidle->name, sizeof(gtidle->name), "gt%d-mc", gt->info.id);
>@@ -180,14 +178,10 @@ void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
> 	err = sysfs_create_files(kobj, gt_idle_attrs);
> 	if (err) {
> 		kobject_put(kobj);
>-		drm_warn(&xe->drm, "failed to register gtidle sysfs, err: %d\n", err);
>-		return;
>+		return err;
> 	}
>
>-	err = drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
>-	if (err)
>-		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>-			 __func__, err);
>+	return drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
> }
>
> void xe_gt_idle_enable_c6(struct xe_gt *gt)
>diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
>index 69280fd16b03..75bd99659b1b 100644
>--- a/drivers/gpu/drm/xe/xe_gt_idle.h
>+++ b/drivers/gpu/drm/xe/xe_gt_idle.h
>@@ -10,7 +10,7 @@
>
> struct xe_gt;
>
>-void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle);
>+int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle);
> void xe_gt_idle_enable_c6(struct xe_gt *gt);
> void xe_gt_idle_disable_c6(struct xe_gt *gt);
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>index c69d2e8a0fe1..1e5971072bc8 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>@@ -29,7 +29,7 @@ static void gt_sysfs_fini(struct drm_device *drm, void *arg)
> 	kobject_put(gt->sysfs);
> }
>
>-void xe_gt_sysfs_init(struct xe_gt *gt)
>+int xe_gt_sysfs_init(struct xe_gt *gt)
> {
> 	struct xe_tile *tile = gt_to_tile(gt);
> 	struct xe_device *xe = gt_to_xe(gt);
>@@ -38,24 +38,18 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
>
> 	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
> 	if (!kg)
>-		return;
>+		return -ENOMEM;
>
> 	kobject_init(&kg->base, &xe_gt_sysfs_kobj_type);
> 	kg->gt = gt;
>
> 	err = kobject_add(&kg->base, tile->sysfs, "gt%d", gt->info.id);
> 	if (err) {
>-		drm_warn(&xe->drm, "failed to add GT sysfs directory, err: %d\n", err);
> 		kobject_put(&kg->base);
>-		return;
>+		return err;
> 	}
>
> 	gt->sysfs = &kg->base;
>
>-	err = drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
>-	if (err) {
>-		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>-			 __func__, err);
>-		return;
>-	}
>+	return drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
> }
>diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h b/drivers/gpu/drm/xe/xe_gt_sysfs.h
>index e3ec278ca0be..ecbfcc5c7d42 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
>+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
>@@ -8,7 +8,7 @@
>
> #include "xe_gt_sysfs_types.h"
>
>-void xe_gt_sysfs_init(struct xe_gt *gt);
>+int xe_gt_sysfs_init(struct xe_gt *gt);
>
> static inline struct xe_gt *
> kobj_to_gt(struct kobject *kobj)
>diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>index 9c33045ff1ef..fbe21a8599ca 100644
>--- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>@@ -236,19 +236,14 @@ static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
> 	sysfs_remove_group(gt->freq, &throttle_group_attrs);
> }
>
>-void xe_gt_throttle_sysfs_init(struct xe_gt *gt)
>+int xe_gt_throttle_sysfs_init(struct xe_gt *gt)
> {
> 	struct xe_device *xe = gt_to_xe(gt);
> 	int err;
>
> 	err = sysfs_create_group(gt->freq, &throttle_group_attrs);
>-	if (err) {
>-		drm_warn(&xe->drm, "failed to register throttle sysfs, err: %d\n", err);
>-		return;
>-	}
>-
>-	err = drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, gt);
> 	if (err)
>-		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>-			 __func__, err);
>+		return err;
>+
>+	return drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, gt);
> }
>diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>index 3ecfd4beffe1..6c61e6f228a8 100644
>--- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>+++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>@@ -10,7 +10,7 @@
>
> struct xe_gt;
>
>-void xe_gt_throttle_sysfs_init(struct xe_gt *gt);
>+int xe_gt_throttle_sysfs_init(struct xe_gt *gt);
>
> #endif /* _XE_GT_THROTTLE_SYSFS_H_ */
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>index daab970f8be8..4db4a20559d1 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>@@ -690,12 +690,8 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
>
> 		keclass->eclass = hwe->eclass;
> 		err = xe_add_hw_engine_class_defaults(xe, &keclass->base);
>-		if (err) {
>-			drm_warn(&xe->drm,
>-				 "Add .defaults to engines failed!, err: %d\n",
>-				 err);
>+		if (err)
> 			goto err_object;
>-		}
>
> 		err = sysfs_create_files(&keclass->base, files);
> 		if (err)
>-- 
>2.25.1
>
