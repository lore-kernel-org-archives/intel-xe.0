Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3F2C61DA4
	for <intel-xe@archiver.kernel.org>; Tue, 14 Feb 2023 19:46:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8447D10E27A;
	Tue, 14 Feb 2023 19:46:07 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EA810E27A
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Feb 2023 19:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676403965; x=1707939965;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Kynss2yvJ/0RwR8THEWQtCX+D4IWlaorB3DdUFGe5bU=;
 b=V5JyyYS92bFJETpr6ycSoYHZ6+eGMy6herMC9frHl9VCaik/Kh3MEdE1
 rsXajR5F3qzeYX21+C0M/mSUq6S/kroVYI5kdU3fY1MnY4NO2RIFgYuLL
 W2ZLO3iRHuzlM8xp7dlY+1gwcqNuVDU5WcKIGrbBfcQ/Bqeq75/1aioRd
 jMy/VH42YpqHHWXNSIznLw81EHWyIbSIzz+eFIU7f7UiJGYw6SmieA92y
 BlP1VO3a62PcR5twIi1QnGdCCQVH/ywAMWVFNaXQxMI3HM/CpiiIb7S5Q
 MiyxAgXxY4KyRE+5pFuBbXV//BG1C+ed79eVpbSnQ6gg8LrDYRxX311Bn Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="331247269"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; d="scan'208";a="331247269"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 11:46:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="732994673"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; d="scan'208";a="732994673"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 14 Feb 2023 11:46:04 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 14 Feb 2023 11:46:04 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 14 Feb 2023 11:46:04 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 14 Feb 2023 11:46:04 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 14 Feb 2023 11:46:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RMA+HKUh9cujK/fO0jfJViueMG5/B1AWCKjCEW+thdWg9V/J9Gtrw67qoZx6zl0fYYx5B6GrN/MqomHtvg+StA16Tyr+crKZ6oLntkC1pfktcdOXyBSCiWVjJd57Z4ESn6lHZkJu39eerDCFauOUCUvpxrST+XB8vkSrbru+q50L7zQfjWwdGQYKTs2d4mSxul7nfmj0IoxGw/lRNIKVqj49vIrT3YHnPQLRcQjuTisEBnd3PgC9rJqYdxd3VXEFNxz5HM52t1lKyd2F+cyQ4vfA2XBje6jYL8RFeXr/ot94KdpNPhMcOud3sfC6BbAUdQKdZqtH727qR//ib4vsfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNjv+tlSF3/HMYDktnJrrWSo6RpJMDD7Oz8renWpHeg=;
 b=hCSgsmR8JrrNvsILUzi2EVBMJUD+6AcEAj9hGt1fQAYXWqXDhh5XbzefSNBrg+GOby0+rW7PeHCGjxadSp8WNPuDn3VHJOE/Q4SMx/nHt+zH+j+Xs/9fMlb1qoIfCLbvyNsXXlakCuY64g1OXePTk5uMuNOe9XXbJgwv+jl6FmLWdlcT9JR0Kr7im0oBFxUO/gJ5KSCsrziizhF1Oxsq3ZdSFJxxhbf68JZBFer6QpkZVoTCPZuVPPsG9/i+YUCMeLbQ1J4JXG5iSMeYEuORkHmMwRyZCOdq54yez7+LExhppGaWsnv9qrwtiwfrtIyve5OoYdMu4vCBcbtDtd9AoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7175.namprd11.prod.outlook.com (2603:10b6:208:419::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 19:46:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a%7]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 19:45:58 +0000
Date: Tue, 14 Feb 2023 11:45:55 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20230214194555.m4mi6f6pjfmddtnu@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230214173224.198898-1-matthew.auld@intel.com>
 <20230214173224.198898-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230214173224.198898-2-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: d0cff6f6-9524-4816-5de6-08db0ec41837
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zl0PZblfuCmTFNZgZnstrmkgz/I5dogEurLfmmepG4IdPj27m51DPrtTaiJOY0H7IhtHm2camL0Cbg/T/f4a/1UGBGT2PgI19h69ePcH+DGpereZ2NlpvQ5j0QmO6tk4DtFzRrXURHdEBqEgbbD1gMFdr5NC7T5FKdA6o+YOypmzo8BGUIb/36tLwHrEEzm/wiH+7uRRfpIlB/zTPfjWEwPQDkfHu0CcXl0S1M0AkXR5H1JfVKHIF0b3Wiu4HqCNdNB+h/RQqk81Qv/UPRtVs5O5E889TUxe6SNiSbYOmBOhrDGOIr79Y0Mx4bTiLOXaV50sUKnRR3hi4f7xiL/o0YZyexCEVjNYCa6HGNsM2QxMCGcvjvhq3HwOBid3xoxnMo8vnc3E+/MdOaavcnRo1eOV630YGBsjGdwKwIribf4Vvh0HcNJ9ASqMZ3Kx7WNaR3jw1NGyJ5dsOVqSMCPwlNw88a5b1/SBqIgVL1uzM+t/I5vPm6mCTXiJLGNx8jFUBaAEYF+OpI/SanmBQDTSvuawHFW6U6tLC7EnUC0n+u5+tyKhrWX8Hwt9P4yd0H6oEtslCTjBihPvYJJ/Sj1zSulGtb9iaEALR9GWJWYmSGz/zsyeoUcxgDAc7I1Ovu0E/amgQtCeO1+CMU7n9+J0Xw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199018)(6512007)(9686003)(82960400001)(38100700002)(83380400001)(8936002)(6862004)(8676002)(66946007)(5660300002)(41300700001)(966005)(2906002)(66556008)(4326008)(66476007)(6486002)(6506007)(1076003)(36756003)(26005)(186003)(478600001)(6666004)(316002)(86362001)(6636002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?icYsS7CxZrKm1R8XokvVFuJD1CdMASy1z2NAC5SwnMnsrzn0849LPWZDy6Ba?=
 =?us-ascii?Q?8KjK/gzYAnoZW9XEqxGv3SwTfO0U+5+dB/oQGZexoFO42PxY3sP3FJ/yyGwy?=
 =?us-ascii?Q?QQLezFr4GkOrjbRzaw9GQPk5jkzPOjM9DJyo3bUPbJfs14Rio06+xgkYzRdm?=
 =?us-ascii?Q?KxA8ncEZbOryOcQxFEmgVCPcSmQlzfQbeukAhqVaz9xOkvI4PGd/raCNja/C?=
 =?us-ascii?Q?4f79f4aTNZ//379CJAT/vX0tUerat/I4iAS5uCpwM4jkLWlfB9yxctq9DgVk?=
 =?us-ascii?Q?giu4O1qXISg7W9NLMhEsGjkJhNvL0Aaj+0QE0BuivYfsH10WwU2SHSfhuWnO?=
 =?us-ascii?Q?Egnpigtb7vXW51lq3uKLDHdJq8H7xnsmogKSuWloDslXb5zPsgrqh1yRVDiz?=
 =?us-ascii?Q?V37hfuHdWKJad7q4qQ7oH+9VxjadD15jXMgnBx4DDtZz9jpjQ696XB3Ua55n?=
 =?us-ascii?Q?JVTYW5wrMJpxECg27Voyi9Vel6Ic5vxontc0mvOOM6D/72qiM6rmo5zNv7QR?=
 =?us-ascii?Q?7E3Pqkg3mgIaOWoP0NoUdVpetTXMnm6TLDdqKxHk9VlMhB9hmAX+0h0Gt4xP?=
 =?us-ascii?Q?kFgxdHzB1YVm64b0XwxkneSIITG0M/yGAJJxfmpnAV/g0U2uaN4bMBzgDQfI?=
 =?us-ascii?Q?OUpvM4FbIqR+UZy+XnCJUHYpygkwKAY0ucG3PmZC7Z6dYsbCNTAl+RyqaBOe?=
 =?us-ascii?Q?LGHUZF95S2qtBBDJ2rNzs6GT58EKGASCQMFpLRJ48eUuKCB4v5/GZVICysHx?=
 =?us-ascii?Q?ZQVGjFZ6pjb4TzkbhP4bAe7nwZu4DyEnnIOT/DhbkOizCY4YAQgpS1qgZDIb?=
 =?us-ascii?Q?AwIh8g3R5wkUPVfxpbWB2Xqofo2s9YxSfDsZVEVFQ9VtLRPWXz4Lzjdkt3/z?=
 =?us-ascii?Q?gPNA5WvEe1rJUuV3nCYz0pq5naFUIFX7KAs/VXqL/cX1OpAqt/ywmHEcGswE?=
 =?us-ascii?Q?XvMCTWWYa0KA4DknXnf9VuT+1/LJsaUC8nhFWYKt3orQd6kkl2ZFLZmc30T7?=
 =?us-ascii?Q?6IHM/wo49KrAjEmKHyRLS4CU30aU0YHiOvzH7X75H9e44nERgoRiSnGItemN?=
 =?us-ascii?Q?n9xq3HOYwTN4skeOiLftg8LPILJguSs+D1IeAcpmPL33s4znpwdYi3M5DJ+k?=
 =?us-ascii?Q?YIrvhyyORk5rbbjM97AnvQ+li0im2gUCBRSCDHE9qi6rngU3RRwHaC4dU30m?=
 =?us-ascii?Q?S2egnrGPPb9Jgb7oywJ6+kMx3FJeHh9lvvjOcbMJrq9/cIs20t4w3j6sgsPI?=
 =?us-ascii?Q?6UhwoY14Y7Vh7iQNHSaF9wmPJUO60/NJpCE5cnCnE8mOKK3pd/kG6ELkuR1h?=
 =?us-ascii?Q?vF2RiZkc9rQZefqwwUPduHoIW6V/+/pMvTlxJ+B9QcdkGg/RWijArlh5U+is?=
 =?us-ascii?Q?gZBQYyfnks6CkuLOTw4Q8NK+h+aEQReON4zQdvMY4kerhEdn2YfPO7WihvjY?=
 =?us-ascii?Q?8j/wQ2rDvHoQumWGP++lIooPY/hHc2o4dABbINuFOSe/7FirVjJGdJ1eSJPJ?=
 =?us-ascii?Q?n2K3VnAY9vHPYwRJJJPMqCFNoOOaGq+3Qn8Ve3cw1jMtcc5iwmZ/RXB1j1de?=
 =?us-ascii?Q?IxqGUuT8CKduC2a1hQA7LYAdtdhuULTRbcW2t3kFuCMjQSPqSkp0WquFNHOT?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0cff6f6-9524-4816-5de6-08db0ec41837
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 19:45:58.7436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DochK7ax9c0C2iDhaLdgKxTNo0/s6jPM6z8tq5c89s2jTEA0e9uzOjCoYkYbePGqDxwybakvfwMN2B1VDW7p6wGeVlzWCVVV4SnjGnLLHbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7175
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/stolen: don't map stolen on
 small-bar
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

On Tue, Feb 14, 2023 at 05:32:24PM +0000, Matthew Auld wrote:
>The driver should still be functional with small-bar, just that the vram
>size is clamped to the BAR size (until we add proper support for tiered
>vram). For stolen vram we shouldn't iomap anything if the BAR size
>doesn't also contain the stolen portion, since on discrete the stolen
>portion is always at the end of normal vram. Stolen should still be
>functional, just that allocating CPU visible io memory will always
>return an error.
>
>v2 (Lucas)
>  - Mention in the commit message that stolen vram is always as the end
>    of normal vram, which is why stolen in not mappable on small-bar
>    systems.
>  - Just make xe_ttm_stolen_inaccessible() return true for such cases.
>    Also rename to xe_ttm_stolen_cpu_inaccessible to better describe
>    that we are talking about direct CPU access. Plus add some
>    kernel-doc.
>
>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/209
>Reported-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matthew Auld <matthew.auld@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_bo.c             |  2 +-
> drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 47 +++++++++++++++++++-------
> drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h |  2 +-
> 3 files changed, 37 insertions(+), 14 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index 9b7b9c8f84be..4173c1418b63 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -1149,7 +1149,7 @@ struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_gt *gt,
> 	u64 end = offset == ~0ull ? offset : start + size;
>
> 	if (flags & XE_BO_CREATE_STOLEN_BIT &&
>-	    xe_ttm_stolen_inaccessible(xe))
>+	    xe_ttm_stolen_cpu_inaccessible(xe))
> 		flags |= XE_BO_CREATE_GGTT_BIT;
>
> 	bo = xe_bo_create_locked_range(xe, gt, vm, size, start, end, type, flags);
>diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>index b4e9c88644e4..e20c567f276f 100644
>--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>@@ -21,11 +21,6 @@
> #include "xe_ttm_stolen_mgr.h"
> #include "xe_ttm_vram_mgr.h"
>
>-bool xe_ttm_stolen_inaccessible(struct xe_device *xe)
>-{
>-	return !IS_DGFX(xe) && GRAPHICS_VERx100(xe) < 1270;
>-}
>-
> struct xe_ttm_stolen_mgr {
> 	struct xe_ttm_vram_mgr base;
>
>@@ -43,6 +38,34 @@ to_stolen_mgr(struct ttm_resource_manager *man)
> 	return container_of(man, struct xe_ttm_stolen_mgr, base.manager);
> }
>
>+/**
>+ * xe_ttm_stolen_cpu_inaccessible - Can we directly CPU access stolen memory for
>+ * this device.
>+ *
>+ * On some integrated platforms we can't directly access stolen via the CPU
>+ * (like some normal system memory).  Also on small-bar systems for discrete,
>+ * since stolen is always as the end of normal VRAM, and the BAR likely doesn't
>+ * stretch that far. However CPU access of stolen is generally rare, and at
>+ * least on discrete should not be needed.
>+ *
>+ * If this is indeed inaccessible then we fallback to using the GGTT mappable
>+ * aperture for CPU access. On discrete platforms we have no such thing, so when
>+ * later attempting to CPU map the memory an error is instead thrown.
>+ */
>+bool xe_ttm_stolen_cpu_inaccessible(struct xe_device *xe)
>+{
>+	struct ttm_resource_manager *ttm_mgr =
>+		ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
>+	struct xe_ttm_stolen_mgr *mgr;
>+
>+	if (!ttm_mgr)
>+		return true;
>+
>+	mgr = to_stolen_mgr(ttm_mgr);
>+
>+	return !mgr->io_base || GRAPHICS_VERx100(xe) < 1270;
>+}
>+
> static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
> {
> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>@@ -126,7 +149,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>
> 	if (IS_DGFX(xe))
> 		stolen_size = detect_bar2_dgfx(xe, mgr);
>-	else if (!xe_ttm_stolen_inaccessible(xe))
>+	else if (GRAPHICS_VERx100(xe) >= 1270)
> 		stolen_size = detect_bar2_integrated(xe, mgr);
> 	else
> 		stolen_size = detect_stolen(xe, mgr);
>@@ -140,7 +163,6 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
> 	if (pgsize < PAGE_SIZE)
> 		pgsize = PAGE_SIZE;
>
>-
> 	err = __xe_ttm_vram_mgr_init(xe, &mgr->base, XE_PL_STOLEN, stolen_size, pgsize);
> 	if (err) {
> 		drm_dbg_kms(&xe->drm, "Stolen mgr init failed: %i\n", err);
>@@ -150,7 +172,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
> 	drm_dbg_kms(&xe->drm, "Initialized stolen memory support with %llu bytes\n",
> 		    stolen_size);
>
>-	if (!xe_ttm_stolen_inaccessible(xe))
>+	if (!xe_ttm_stolen_cpu_inaccessible(xe))
> 		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, stolen_size);
> }
>
>@@ -161,10 +183,9 @@ u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset)
> 	struct xe_ttm_stolen_mgr *mgr = to_stolen_mgr(ttm_mgr);
> 	struct xe_res_cursor cur;
>
>-	if (!mgr->io_base)
>-		return 0;
>+	XE_BUG_ON(!mgr->io_base);
>
>-	if (!IS_DGFX(xe) && xe_ttm_stolen_inaccessible(xe))
>+	if (!IS_DGFX(xe) && xe_ttm_stolen_cpu_inaccessible(xe))
> 		return mgr->io_base + xe_bo_ggtt_addr(bo) + offset;
>
> 	xe_res_first(bo->ttm.resource, offset, 4096, &cur);
>@@ -202,6 +223,8 @@ static int __xe_ttm_stolen_io_mem_reserve_stolen(struct xe_device *xe,
> #ifdef CONFIG_X86
> 	struct xe_bo *bo = ttm_to_xe_bo(mem->bo);
>
>+	XE_BUG_ON(IS_DGFX(xe));
>+
> 	/* XXX: Require BO to be mapped to GGTT? */
> 	if (drm_WARN_ON(&xe->drm, !(bo->flags & XE_BO_CREATE_GGTT_BIT)))
> 		return -EIO;
>@@ -228,7 +251,7 @@ int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem)
> 	if (!mgr || !mgr->io_base)
> 		return -EIO;
>
>-	if (!xe_ttm_stolen_inaccessible(xe))
>+	if (!xe_ttm_stolen_cpu_inaccessible(xe))
> 		return __xe_ttm_stolen_io_mem_reserve_bar2(xe, mgr, mem);
> 	else
> 		return __xe_ttm_stolen_io_mem_reserve_stolen(xe, mgr, mem);
>diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
>index ade37abb0623..2fda97b97a05 100644
>--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
>+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
>@@ -14,7 +14,7 @@ struct xe_device;
>
> void xe_ttm_stolen_mgr_init(struct xe_device *xe);
> int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem);
>-bool xe_ttm_stolen_inaccessible(struct xe_device *xe);
>+bool xe_ttm_stolen_cpu_inaccessible(struct xe_device *xe);
> u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset);
> u64 xe_ttm_stolen_gpu_offset(struct xe_device *xe);
>
>-- 
>2.39.1
>
