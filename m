Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7559CC77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 05:23:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0D110E3A3;
	Wed, 17 May 2023 05:23:47 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C936210E3A3
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 05:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684301024; x=1715837024;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1joFIAkuPL3LdJ1P/8ovgyYF7Q8uYckOMuz2GPNeszw=;
 b=JoimT3af4MVbm4f1RGc78SFvRb20rFail4p+Cv81SB157BRy6d1yzEv2
 GYOnIWk6+Jb1XfyPhOyZ2J4fXJ5yggD/HDUu0ffd5xX/Ms4FWd+8XcCu9
 kwB105Zp5Zf42GZJOOWpQJfGkXGahc3/dRSLwxDlxdJBpBe+I7bXU5rZX
 V70Z2PowSOjebn64nlsMkDAeXP6rjf2XtBXUnEEyQecDdNIGvccUOgIyK
 ysNn/2+J8+HAk+yhqhTZUzoiv9pHjtdKMb1dTx8WcRVbNq4oiCOnvjzhr
 d613m+UpCYPXuzlx/vj3r1aKqJppZ561kU05xh+jeybY5k9Nua8wpODOw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="438012444"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="438012444"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 22:23:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="704688680"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="704688680"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 16 May 2023 22:23:38 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 22:23:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 22:23:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 22:23:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4rONRsE8xy+c6ob/ufwZewMh2ZFga8sw/Wx0eA/XH9BLHuzjvvUIqG9xMF/q6+ULIR6hCKDREwqNOUomi+N/jaf43Rs9nh+MCc69RLVSLK266RcezS189cuKC7FckvSYfoVXuFa4WJIJp+CTBzp/M5GAfg8BQFtxHrHZocnaE2lkpGwBKlQYXhPeM5qttPB7nNGFrSZenrcSO29AwTayVnyHK8whUuI/L1D1PTzxKgJdv+XjPy6WUz1bepuRAusISvZF3ZfOYcXTsQxc3EQNgmUh6hzOrjR9VujjVd/N2bqsKBmyqe17y/SOWyMvNo6S9omPAhpcC8bHPX+k9kOFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpDPuy9N+9BoFKlqNeJZrUNv4xBG+ENVJ2NpaQOwDks=;
 b=a+/ClhD3y7AaNBzIO43l2CJkwrFkduIkpn+jgTxY3z88ux/5wjTUU54mSKwGwe7yNzxgVA1uOiiUZLbE4TgA9oLAkYDYm6PMzHrZd/m/eW9IjLciTghAf2YZLS6EhOGNCg3/6IKfTxovLPG3HTwqEDRqBa6bj6AGW2RZgrFv/kz1ls7mf/i9BIBlSObuifEIKKEn/59wJ2DhtRNkFzn8n3GpO6ePfFlmbfuC2dcj8/DO45zjIDMo/5pc6D97L2A7jwJIggRx4uklMZl1/C2T18qkqYDJjwuPhnhDbCApqu6oenl89phE/gLsTwGEejeQaVQPs74rteEx+VR9euAPWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 05:23:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 05:23:30 +0000
Date: Tue, 16 May 2023 22:23:26 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <3ybteg3igxosaghlkphfmvpuyky6qcbm7d6gybzjiokuqhkg7c@c5zvxdvsxijm>
X-Patchwork-Hint: comment
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-13-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230511034722.1929038-13-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0048.namprd03.prod.outlook.com
 (2603:10b6:303:8e::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB8399:EE_
X-MS-Office365-Filtering-Correlation-Id: 03ed8656-957a-459e-1fa7-08db5696d97a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lg6Zm3QllNcOKrLcwieHDsr5Yc2TKADcfMkTiyGB077kG6H6gyMI15Oa2N2lLomoZS8cUgGZH2oOyoS2AUXKgLrItdznwaVsJSDTsNyuS9n+1YYFa52xWagYMfUj8OH+gbOZlEDZRrnGE6VWoR2NCElkSuFlKnYhUtQ6IwcvrcQz/3+GvuXhOQkFtsARulFbA/AQD7+El5UQI30E2hXxEyPMiXWkCwwlUgo/kOZCLEytlUNJ0zktwEhcUkOOXATaA5W/WEs3c41DUfu9WYuq7TmRIqCmOaUZz6GAXRYNhcmtemIbmVYP/9UkT3/6GiDmPczRnEUAKkPIlncJz3xFWRjGegOgSlzZWCituGTvg6+a7E1Xeo/qZCOLRz8fwYdHEs0acSakzK/pTtiRMoToScePqDhZ9+rhepVtAJ1RF9OkbC1+ndq9vYSxsQcvU2LTZsmg2QyPuUh6Kd8psQxoSSv2ZjzHXROxDe6iyUHqgO8cssOl0xhXiFfP6q110Xy6gIYFleaCUnqb/E/WCGu/tBERnQBdQk/Q2ptZhWR3ANhBzf9BGNTwFk/8U4EaadBn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(376002)(366004)(396003)(136003)(39860400002)(451199021)(86362001)(316002)(66946007)(66556008)(66476007)(6636002)(4326008)(478600001)(33716001)(5660300002)(8936002)(8676002)(2906002)(6666004)(6862004)(38100700002)(82960400001)(26005)(6506007)(9686003)(83380400001)(6512007)(186003)(41300700001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4cu++pz0993L32GTQ5JAVXjnryCdztDH7L4rYOZndcOioCxTcqaLupq2nLxV?=
 =?us-ascii?Q?Up0Lrv5a6LERgl1UJbsT3fB5683DN6SBhd9XJ16z9NGlcNUVl+tqZnnp/YN2?=
 =?us-ascii?Q?04+OcTPgQVhBinaAYxEC/NYuSwxFe3MfZnkw0LuOAscpOAOeagnaHjIgbosL?=
 =?us-ascii?Q?g05zYLTvFGXYCVUCsRyU/ZDz3g1sSOIRtjoN/JiYIxVjN+S58ubrXPr4tcZ2?=
 =?us-ascii?Q?kqOUMDCSG2Hhxp3eOxV6U28D0GmL6h3536XRUV8W7eK0CP/UErekfp77Lk8f?=
 =?us-ascii?Q?Z/XTgvEVCbMqy4S7ZlBMqFE4afgQsipyHZ60NCsb4f1FVo1Lfq2f/PgwLlEL?=
 =?us-ascii?Q?Q33MTf++zd9ohj/IFmmnVu0Pal8s0d3p6rnAFZY1r0+Ydfe6SMtw1jetTIta?=
 =?us-ascii?Q?izoMOoXZnR1EOLU53ffQ47oTZXkX2PqfSC9Ovapy0HNNgW/pq5jog/UhHyI7?=
 =?us-ascii?Q?NxZCyjwcaqKPbW+SQupFAc1cVoZyDAka9vF0QfQhdHd9Vy8C4x0J6ry3uZ9z?=
 =?us-ascii?Q?0id/Mh12SGQd+hFZAbNFFIQJT2lOgmK15vjjorbRM4kHPGGrp+gYT0QkRZoW?=
 =?us-ascii?Q?eV4ybskplG2AFyoxuWNSkaBy542AzeEtuFvQlTlncTt/avYpvi96Hv168WOM?=
 =?us-ascii?Q?f9ALxvT2CSHObc1OIJhUq+tSQ/5x9DOYJeXcVXO4788iFoOoRrr8+dwE6UY/?=
 =?us-ascii?Q?je1lldgdhyeRfWGlxOhI7zqYKy+IuWZJ+EutQqTEEjTBCGRGY8bij8qciv0G?=
 =?us-ascii?Q?pFsM39P9Iv5KEYIIS3Y0xIEqGy2xh6IM4+wTovffzhz1d7H7CMHuRHJrciHS?=
 =?us-ascii?Q?1msXrydA1kCQGkz/I8DEDuyA84MZ5kWScMdlkn3huN5GK7QqC6Ckom1w9lJ3?=
 =?us-ascii?Q?vMsTZSDhX0yvHtaCFGwMJNHo/AEWQFVpJKzby9RYzIQAvEO0JC2AFdaWO40/?=
 =?us-ascii?Q?eVRWAt/wnStZE5IaoW/9IRymizM66Tei0nhIhTHvXgj4vN+v65GqCuJe7tv+?=
 =?us-ascii?Q?T4Ml6lyt039e4SwFj/euVX2hhDtYT7635XNFCUlhg3WTjHvjHyTaG8GjDKDM?=
 =?us-ascii?Q?JEvfuYdyebTU1qf0Ul9QrF1PvCHf3FZB2XTwOCmEjcLhxbPVsnBgIN0vqqce?=
 =?us-ascii?Q?/rcHr/DMPpHZql9eSIK00P9nRS15a1wKr4M67eTPxv8ZgA/Kr9lkbii1wiXf?=
 =?us-ascii?Q?wM0glyq18a0gDx20lnpnx7TIQ2BPpv6ZVOiD2nGMjyPZrqgiT37yE+zAMQR5?=
 =?us-ascii?Q?RfAyA3ZA7A8w2czNOHNn3mkdb2t2WrjFRIykGeVif82/4zbHb1t3W1rRGlOS?=
 =?us-ascii?Q?fnIiSGcNmKrZzIjuTAwma3/igHbYLFske1FfCC9ZRKSVQSa6qvGBbofKO/e3?=
 =?us-ascii?Q?XwnGzcS6philpeU4MHnXLrUHDzcuLQ/0WxgPbiAlYeX6LrigerUy3f7eiotg?=
 =?us-ascii?Q?apF5fwQeJW/rGMjNPpR/tZBIwmk3JrePwtLbPgj1Uc4j++UA2g7bu7aplqbw?=
 =?us-ascii?Q?ieEopea5xcOzdsDtqkgaPfN/Pw7X43QZVPsUsVihWjrBi9wD4csmRE7h9nMV?=
 =?us-ascii?Q?z+5u4QN1tTKAHc5DlEjTiEMVqUrISOU44y2Yo1/GXC50COvXC22R/lQ3JLBX?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ed8656-957a-459e-1fa7-08db5696d97a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 05:23:29.8500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7xKtg/qdp08x4RHcWQoxTg9OQ6VPVMMWZd5SA6CxD5xLXMuSZatPPYgcX00hIpw45+x13n+ERUWAa4alXyQr7wrvl55rAZdUf5+crN2vER0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8399
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 12/26] drm/xe: Allocate GT dynamically
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 10, 2023 at 08:47:08PM -0700, Matt Roper wrote:
>In preparation for re-adding media GT support, switch the primary GT
>within the tile to a dynamic allocation.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c       |  4 ----
> drivers/gpu/drm/xe/xe_device.h       |  8 ++++++--
> drivers/gpu/drm/xe/xe_device_types.h |  2 +-
> drivers/gpu/drm/xe/xe_ggtt.c         |  2 +-
> drivers/gpu/drm/xe/xe_gt.c           | 11 ++++++++---
> drivers/gpu/drm/xe/xe_gt.h           |  2 +-
> drivers/gpu/drm/xe/xe_migrate.c      | 12 ++++++------
> drivers/gpu/drm/xe/xe_pci.c          |  7 +++++--
> drivers/gpu/drm/xe/xe_pt.c           |  4 ++--
> drivers/gpu/drm/xe/xe_vm.c           |  6 +++---
> 10 files changed, 33 insertions(+), 25 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index c93c8895862f..b6fecee68cc6 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -254,10 +254,6 @@ int xe_device_probe(struct xe_device *xe)
> 		err = xe_tile_alloc(tile);
> 		if (err)
> 			return err;
>-
>-		err = xe_gt_alloc(xe, &tile->primary_gt);
>-		if (err)
>-			return err;
> 	}
>
> 	err = xe_mmio_init(xe);
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index fc2655484dfd..370b9ccb875b 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -58,7 +58,11 @@ static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
> 	struct xe_gt *gt;
>
> 	XE_BUG_ON(gt_id > XE_MAX_TILES_PER_DEVICE);
>-	gt = &xe->tiles[gt_id].primary_gt;
>+
>+	gt = xe->tiles[gt_id].primary_gt;
>+	if (drm_WARN_ON(&xe->drm, !gt))
>+		return NULL;
>+
> 	XE_BUG_ON(gt->info.id != gt_id);
> 	XE_BUG_ON(gt->info.type == XE_GT_TYPE_UNINITIALIZED);
>
>@@ -75,7 +79,7 @@ static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
>  */
> static inline struct xe_gt *xe_primary_mmio_gt(struct xe_device *xe)
> {
>-	return &xe_device_get_root_tile(xe)->primary_gt;
>+	return xe_device_get_root_tile(xe)->primary_gt;
> }
>
> static inline bool xe_device_guc_submission_enabled(struct xe_device *xe)
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index fa76750a9a5f..1033f233f6ab 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -79,7 +79,7 @@ struct xe_tile {
> 	/**
> 	 * @primary_gt: Primary GT
> 	 */
>-	struct xe_gt primary_gt;
>+	struct xe_gt *primary_gt;
>
> 	/* TODO: Add media GT here */
>
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index b11f22b68bb8..7c87623ef5c5 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -194,7 +194,7 @@ void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
> 	 * TODO: Loop over each GT in tile once media GT support is
> 	 * re-added
> 	 */
>-	struct xe_gt *gt = &ggtt->tile->primary_gt;
>+	struct xe_gt *gt = ggtt->tile->primary_gt;
>
> 	/* TODO: vfunc for GuC vs. non-GuC */
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 297ee32ad928..20663cd0ddaf 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -42,13 +42,18 @@
> #include "xe_wa.h"
> #include "xe_wopcm.h"
>
>-int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
>+struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
> {
>-	XE_BUG_ON(gt->info.type == XE_GT_TYPE_UNINITIALIZED);
>+	struct xe_gt *gt;
>
>+	gt = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*gt), GFP_KERNEL);
>+	if (IS_ERR(gt))

on error it returns NULL, not an error code encoded into the pointer.

other than that,

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+		return ERR_CAST(gt);
>+
>+	gt->tile = tile;
> 	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
>
>-	return 0;
>+	return gt;
> }
>
> void xe_gt_sanitize(struct xe_gt *gt)
>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>index c8abbeb0fb96..abcefd8cde78 100644
>--- a/drivers/gpu/drm/xe/xe_gt.h
>+++ b/drivers/gpu/drm/xe/xe_gt.h
>@@ -16,7 +16,7 @@
> 	     for_each_if (((hwe__) = (gt__)->hw_engines + (id__)) && \
> 			  xe_hw_engine_is_valid((hwe__)))
>
>-int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt);
>+struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
> int xe_gt_init_early(struct xe_gt *gt);
> int xe_gt_init_noalloc(struct xe_gt *gt);
> int xe_gt_init(struct xe_gt *gt);
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>index c3a37109bc64..8a4fd80a7fde 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -229,7 +229,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> 		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
>
> 		if (xe->info.supports_usm) {
>-			batch = tile->primary_gt.usm.bb_pool->bo;
>+			batch = tile->primary_gt->usm.bb_pool->bo;
> 			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE,
> 						&is_vram);
> 			m->usm_batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
>@@ -313,7 +313,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
> {
> 	struct xe_device *xe = tile_to_xe(tile);
>-	struct xe_gt *primary_gt = &tile->primary_gt;
>+	struct xe_gt *primary_gt = tile->primary_gt;
> 	struct xe_migrate *m;
> 	struct xe_vm *vm;
> 	struct ww_acquire_ctx ww;
>@@ -546,7 +546,7 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
> 			       u64 dst_ofs, bool dst_is_vram, u32 dst_size,
> 			       u64 ccs_ofs, bool copy_ccs)
> {
>-	struct xe_gt *gt = &m->tile->primary_gt;
>+	struct xe_gt *gt = m->tile->primary_gt;
> 	u32 flush_flags = 0;
>
> 	if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs && dst_is_vram) {
>@@ -601,7 +601,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> 				  struct ttm_resource *src,
> 				  struct ttm_resource *dst)
> {
>-	struct xe_gt *gt = &m->tile->primary_gt;
>+	struct xe_gt *gt = m->tile->primary_gt;
> 	struct xe_device *xe = gt_to_xe(gt);
> 	struct dma_fence *fence = NULL;
> 	u64 size = bo->size;
>@@ -853,7 +853,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> 				   struct ttm_resource *dst)
> {
> 	bool clear_vram = mem_type_is_vram(dst->mem_type);
>-	struct xe_gt *gt = &m->tile->primary_gt;
>+	struct xe_gt *gt = m->tile->primary_gt;
> 	struct xe_device *xe = gt_to_xe(gt);
> 	struct dma_fence *fence = NULL;
> 	u64 size = bo->size;
>@@ -1128,7 +1128,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> {
> 	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
> 	struct xe_tile *tile = m->tile;
>-	struct xe_gt *gt = &tile->primary_gt;
>+	struct xe_gt *gt = tile->primary_gt;
> 	struct xe_device *xe = tile_to_xe(tile);
> 	struct xe_sched_job *job;
> 	struct dma_fence *fence;
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index bfdc9563e54f..7d5e65d34f39 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -517,9 +517,12 @@ static int xe_info_init(struct xe_device *xe,
> 		tile->xe = xe;
> 		tile->id = id;
>
>-		gt = &tile->primary_gt;
>+		tile->primary_gt = xe_gt_alloc(tile);
>+		if (IS_ERR(tile->primary_gt))
>+			return PTR_ERR(tile->primary_gt);
>+
>+		gt = tile->primary_gt;
> 		gt->info.id = id;
>-		gt->tile = tile;
>
> 		gt->info.id = id;	/* FIXME: Determine sensible numbering */
> 		gt->info.type = XE_GT_TYPE_MAIN;
>diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>index a606cd1a7e3a..60e4a97c78fb 100644
>--- a/drivers/gpu/drm/xe/xe_pt.c
>+++ b/drivers/gpu/drm/xe/xe_pt.c
>@@ -1316,7 +1316,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
>
> 		/* TLB invalidation must be done before signaling rebind */
> 		if (rebind && !xe_vm_no_dma_fences(vma->vm)) {
>-			int err = invalidation_fence_init(&tile->primary_gt, ifence, fence,
>+			int err = invalidation_fence_init(tile->primary_gt, ifence, fence,
> 							  vma);
> 			if (err) {
> 				dma_fence_put(fence);
>@@ -1636,7 +1636,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
> 		int err;
>
> 		/* TLB invalidation must be done before signaling unbind */
>-		err = invalidation_fence_init(&tile->primary_gt, ifence, fence, vma);
>+		err = invalidation_fence_init(tile->primary_gt, ifence, fence, vma);
> 		if (err) {
> 			dma_fence_put(fence);
> 			kfree(ifence);
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 6beb73b40dca..cbbc809ae4e4 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -1200,7 +1200,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> 	/* Kernel migration VM shouldn't have a circular loop.. */
> 	if (!(flags & XE_VM_FLAG_MIGRATION)) {
> 		for_each_tile(tile, xe, id) {
>-			struct xe_gt *gt = &tile->primary_gt;
>+			struct xe_gt *gt = tile->primary_gt;
> 			struct xe_vm *migrate_vm;
> 			struct xe_engine *eng;
>
>@@ -3368,7 +3368,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> 			 * FIXME: We potentially need to invalidate multiple
> 			 * GTs within the tile
> 			 */
>-			seqno[id] = xe_gt_tlb_invalidation_vma(&tile->primary_gt, NULL, vma);
>+			seqno[id] = xe_gt_tlb_invalidation_vma(tile->primary_gt, NULL, vma);
> 			if (seqno[id] < 0)
> 				return seqno[id];
> 		}
>@@ -3376,7 +3376,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>
> 	for_each_tile(tile, xe, id) {
> 		if (tile_needs_invalidate & BIT(id)) {
>-			ret = xe_gt_tlb_invalidation_wait(&tile->primary_gt, seqno[id]);
>+			ret = xe_gt_tlb_invalidation_wait(tile->primary_gt, seqno[id]);
> 			if (ret < 0)
> 				return ret;
> 		}
>-- 
>2.40.0
>
