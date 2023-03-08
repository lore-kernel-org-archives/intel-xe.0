Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D926C678D5
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 00:36:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7ED10E57B;
	Wed,  8 Mar 2023 00:36:52 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05FA10E57B
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 00:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678235809; x=1709771809;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0o0hx7exFB1gYkPdXkTSTJndTwnCUZ4V5VSbgBncWCA=;
 b=FmdwkPH+baJBFopH8dd1A7F8CaHsRf7A3rjomckeOMk0DmXtN1qpq8KR
 R0qd5DE6gk/xHlqVdAtP2i/M5KmgfaEcm+i3gkmKj724CmI0f8DocezU+
 0VpicikbzJWCrjKiRJfn4LTZ9STsRagb7Getl9K7RN+UPyxOqf2jMf97o
 Gi09v27rx8FXq6L88teWBSExQaCISBCPXht8GHeMsELKuCT0UtdFQ7Xgr
 AXLuwY1WO7e01HpMwtkbSjN/Kck2qIvERL+TnjeN5ubePvPbsbDne2kOw
 QH/IIzP6dTaKT1rII1eHYUmFSfQbwSaCn3/3Svna2GC/iuk26yz6mGeJB Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="400841418"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="400841418"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 16:36:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="800555790"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="800555790"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 07 Mar 2023 16:36:49 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 16:36:48 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Mar 2023 16:36:48 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 7 Mar 2023 16:36:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lyyVJQ0MZ6W7nBsJ3OWPb2IlYL7ZtKKVUOnJAJZR83Atq0Lx7GJJzK5HxvtK3STd+dAD188tVdOBZ5SBYD2p7dmWD1yC474fsoYpg408NlfwX2kZvZnW9uOz83FciHf6zuEZuSYXz5cSLmFCf5qKXBKcLnBYE4zj+Qi74aNjBeGTU8MAtPJ0CcaghGPdoKbCURj8FZTf5fUX/bCxXCg2BuHyh30VAMBMNkKm7X5ZRWYZU/U0cTwmrtiVi18okJBgo290y1jWcJG3ax7ewaYgBZ3Ds3vhqMKzOfb2r87bIn5sb7n/exAoUQJzoWcFfr1LBtnh1D674Z9yMAA7OGog9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKvdKxyABexhBy5050QWHwPrtNqYet8aWj2a4q4j7+U=;
 b=QsCs9scWz0+uINqO0XjOHj1F+kFJkhamjdbs0CG4WQD6oN3YYjQnZ/6NqpynWX2h2E2v4Sqi9zrL2CJJZemSyyFvXgCDBXaGx0RuxhbbqBnGHb3OEu/5aIXmLdGzKSMFYIVqkq2UeOJyxcTDles0UbOyPizXervp8AvfvFv163IpomV06uHcY57iS4IEH19h/mE9q0alT9GscAhzyvHR/nOrkVvVmn+wqTJAKwM43Yln7/oZhftVpv0EgoP6+AhjuQ01HqgrVUbB2DoEKcmoCqRgU5LM6jG6NP1jaDM0I3kWHYwiHcdAjg4Rqvad6EC/q52q8WI5DJv4kR/pz0a3VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4850.namprd11.prod.outlook.com (2603:10b6:303:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 00:36:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%9]) with mapi id 15.20.6156.029; Wed, 8 Mar 2023
 00:36:46 +0000
Date: Tue, 7 Mar 2023 16:36:43 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230308003643.mukv763qvm4sjwqb@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230306223651.2428170-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230306223651.2428170-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0085.namprd03.prod.outlook.com
 (2603:10b6:a03:331::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4850:EE_
X-MS-Office365-Filtering-Correlation-Id: 67d8b0d3-5ac4-4702-d8e7-08db1f6d326c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0VcLUvKmGXPCZLz0SYOrdYBa0SFnc8Jeds/WXjM5DOJ9tpWT1nO0W6rIcxGtNGoFsDh3+77N+3cTSo7GGHmebUBli1eUDLllNh91Fbx3U15Z6sNKBK3s8B28NBFV7xstqNELtTTmgxwT+w5Jwv6x+Gxax2bLgHleIg5oYT+d2KFLrZVj6qGLKF6fr7tRefRT2qpLA8i3MbReigTzkTUEDuplrwsGL9I6x+C+2XZ/eLAgRfAIkn/LroWHHtaXkx6D/KLH2IEkRJk9nW0viCBqpYka2NjDOYdZV6uMpDWhctVFOSmd5ZugrZpwCeKAw6oMDgIJ0SHDuVhVKUr9U0a8vBTTNRb31BDUUqaFlxLPyZfqaeg6V+xF0VOd6iKXKuFRhdM4Mz5RpQKwqOqGhB8jvckVN6ZvdTv4wX0kdqOo9iaaXDgd/cFEaremEWWtCEUqFXuI+gGxcoI6w9LKZH3k8fj3Jtnew0Qn3Jor4e82wfyogRnyWc9iR86+wJQNtyuG5PTxzMDRAR4NsFahUBOfEPYOrkdHtugq7Sn85R8c5yJ6Vf8kGzsrZL+/wrReKxxUrr9PFa6uHZnjDN1BrkbyjaDTV398xa91NMxKezU5CXkQAcqHedCN/+4Qa/VAy1sQmeGmm4pG+wHWOkzzho2tEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199018)(36756003)(66946007)(4326008)(66556008)(6862004)(66476007)(8936002)(5660300002)(2906002)(82960400001)(86362001)(38100700002)(41300700001)(8676002)(6506007)(6486002)(1076003)(6512007)(478600001)(316002)(6636002)(6666004)(83380400001)(186003)(9686003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1DQ6LsONEf+kYzUcCqhbY+PlwXajXbxkmMdQEZxkN1NF+8yCXrHrr+hXtT9X?=
 =?us-ascii?Q?NvBIyqQTThana0x6NUAaW4EUIMz4D4tEmvTVncGrdKPSsIDaW/X2wzCYrm9o?=
 =?us-ascii?Q?gVrstucC5Py9LbC5YbJ1P3BkIe4RFTdZUW67ypbkUNGffs3nCq21flB59IqN?=
 =?us-ascii?Q?dSvUuJmvUFnbpBSNoatZQ/h4j8vNE8nuwE4zSyAMLUWBTYR9mYZS7apRcmRa?=
 =?us-ascii?Q?ZEIoZj2U55eaT/aliocfUDkw5auARJ9P5t6Bi2EmYMcuVpC3lhu81BZD6IDo?=
 =?us-ascii?Q?hB1BsRSJszLBU0UP7NB2BqT12olChxcM7sY3G0NVdTV8PKGGwCuF7Zx53rS6?=
 =?us-ascii?Q?3+Qq3t24i/fPycfiZF/rZ9OQLIm5DvAwjbaSyv2uNjWWm6W1eH7dbxTURxkj?=
 =?us-ascii?Q?AI6WIz7Xtl188M/JgoQfbiIQi32qFSg7U1qnuG4rlFrYcRG84myBzSapzKan?=
 =?us-ascii?Q?+Tr3Ml/OmTTEyV96lupBVmX4oS0681GEiNSry7G30r626Q0s2djYWQGJ6LDr?=
 =?us-ascii?Q?9Ne1yhFiVBJoP1a+LZ3O9gCD8Bn6hoZh/ycyeySlL18f4NBgFHVG+WlETL0Z?=
 =?us-ascii?Q?M4bxkPD5PdrTHlX8VH+TSZSw/cUIjNzDeMWlt4PZ94z333GBbuFxy2lFQoUa?=
 =?us-ascii?Q?njeJQwL2VA4ORraQ2DqIqd95c3LZquJv7e4uYs95C41Mi6awxIDT1hVn7JHE?=
 =?us-ascii?Q?3DTAzg8FxicrBfOpsrOHEiuTciSRjrAddmu+cACEhRy2yvmUaAS3Iiqvz9Wc?=
 =?us-ascii?Q?USu9tPiXw5ivC9/SZ2A/LjJtNLSy8Q6/OPFHU40Ue/scybKOjPHFuO6qnQhR?=
 =?us-ascii?Q?e491GIXxSLbzlJa372Tdm0UfVYFam68DbLM2p/6Ne0mzhTq6jsR2RphoAJ1S?=
 =?us-ascii?Q?wGm2RMJb0SLZ5yjEvlPS3D1P+qoh5PsZ3s8xX4meKHlQDyfAewdn1e2zF3LU?=
 =?us-ascii?Q?diFPc3B6A8+ZtOdMzQWshoBbxzvmp+Xi/e/vqaWjjdCX5m7GB7UQSYlv3LZE?=
 =?us-ascii?Q?FwuCOuTbKXPn6kXxG01IXBOF9ib6D+8A0LG+xZaLRd6psMPNkgS7RmY04sWD?=
 =?us-ascii?Q?rStNBqZbTWEVuYTWnGqVqFiP+z6MWloa+20qEKGOkdgY5Jr8tX90G1ZMVQf0?=
 =?us-ascii?Q?U4yrdeMxsMmFde8ix/PjjbJr9wjiBw+x4Lu5cSTbYHoAoBlF93WSPIRqU5VN?=
 =?us-ascii?Q?iJsCPtapmddwd7NU5qbiPDHxv4eJOzjcDOzsjY1Nxqf1/35wvPS+rfc1ADNv?=
 =?us-ascii?Q?0tRUE0FNXoHa+CYKxZl2IUdq0wPNcmj+vltvervEcqoDjnJIRls5GBJDCqUb?=
 =?us-ascii?Q?DpUPpobkK+fkKQliRdTdoSFaBMdIWUvfq958TD5Ql7WbBQg5lZdHPYiz0xR1?=
 =?us-ascii?Q?AIwUOFvXKle0S4wDNi141IqS/nSFzUuFvJbxOJGSFM4piondrfvrsr49QxNT?=
 =?us-ascii?Q?uVkjVi708oWHZNEN2QpgZ48o9ZTt0kbqIBzF2XXHstpjm5aaEglG1t96+LOa?=
 =?us-ascii?Q?vOapedP+iZ88p5H10JdHcZknKJj3441URmD6f9xP+s4OlCZZiJpZA69e+vQa?=
 =?us-ascii?Q?ErIQHoAcbjcNYxh5iM5ESHko2rUlXb8pWVBOvJPEqNu06S6lWTFVuyqnv2xA?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67d8b0d3-5ac4-4702-d8e7-08db1f6d326c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 00:36:46.3772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GtanfNRxgyZVX4QA+aoKxyq5xcmgFTOwh7pwyJ8DZJj2eodcdjZEzodGL0odzcOedBPnLH+NxMjEdPLvghnLUJUtcXnROdyjVlHIkngtWIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4850
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Separate engine fuse handling
 into dedicated functions
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

On Mon, Mar 06, 2023 at 02:36:50PM -0800, Matt Roper wrote:
>The single function to handle fuse registers for all types of engines is
>becoming a bit long and hard to follow (and we haven't even added the
>compute engines yet).  Let's split it into dedicated functions for each
>engine class.
>
>v2:
> - Add note about BCS0 always being present.  (Bala)
> - Add forcewake assertion to read_copy_fuses.  (Bala)
>
>Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_hw_engine.c | 35 +++++++++++++++++++------------
> 1 file changed, 22 insertions(+), 13 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index b035e2fa6744..ac00693ba0b2 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -369,29 +369,29 @@ static void hw_engine_setup_logical_mapping(struct xe_gt *gt)
> 	}
> }
>
>-static void read_fuses(struct xe_gt *gt)
>+static void read_media_fuses(struct xe_gt *gt)
> {
> 	struct xe_device *xe = gt_to_xe(gt);
> 	u32 media_fuse;
> 	u16 vdbox_mask;
> 	u16 vebox_mask;
>-	u32 bcs_mask;
> 	int i, j;
>
> 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>
>+	media_fuse = xe_mmio_read32(gt, GEN11_GT_VEBOX_VDBOX_DISABLE.reg);
>+
> 	/*
>-	 * FIXME: Hack job, thinking we should have table of vfuncs for each
>-	 * class which picks the correct vfunc based on IP version.
>+	 * Pre-Xe_HP platforms had register bits representing absent engines,
>+	 * whereas Xe_HP and beyond have bits representing present engines.
>+	 * Invert the polarity on old platforms so that we can use common
>+	 * handling below.
> 	 */
>-
>-	media_fuse = xe_mmio_read32(gt, GEN11_GT_VEBOX_VDBOX_DISABLE.reg);
> 	if (GRAPHICS_VERx100(xe) < 1250)
> 		media_fuse = ~media_fuse;
>
>-	vdbox_mask = media_fuse & GEN11_GT_VDBOX_DISABLE_MASK;
>-	vebox_mask = (media_fuse & GEN11_GT_VEBOX_DISABLE_MASK) >>
>-		      GEN11_GT_VEBOX_DISABLE_SHIFT;
>+	vdbox_mask = REG_FIELD_GET(GEN11_GT_VDBOX_DISABLE_MASK, media_fuse);
>+	vebox_mask = REG_FIELD_GET(GEN11_GT_VEBOX_DISABLE_MASK, media_fuse);
>
> 	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
> 		if (!(gt->info.engine_mask & BIT(i)))
>@@ -412,11 +412,20 @@ static void read_fuses(struct xe_gt *gt)
> 			drm_info(&xe->drm, "vecs%u fused off\n", j);
> 		}
> 	}
>+}
>+
>+static void read_copy_fuses(struct xe_gt *gt)
>+{
>+	struct xe_device *xe = gt_to_xe(gt);
>+	u32 bcs_mask;
>+
>+	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>
> 	bcs_mask = xe_mmio_read32(gt, GEN10_MIRROR_FUSE3.reg);
> 	bcs_mask = REG_FIELD_GET(GEN12_MEML3_EN_MASK, bcs_mask);
>
>-	for (i = XE_HW_ENGINE_BCS1, j = 0; i <= XE_HW_ENGINE_BCS8; ++i, ++j) {
>+	/* BCS0 is always present; only BCS1-BCS8 may be fused off */
>+	for (int i = XE_HW_ENGINE_BCS1, j = 0; i <= XE_HW_ENGINE_BCS8; ++i, ++j) {
> 		if (!(gt->info.engine_mask & BIT(i)))
> 			continue;

while at it may be worth fixing the coding style one line below.
In any case,


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>
>@@ -425,15 +434,15 @@ static void read_fuses(struct xe_gt *gt)
> 			drm_info(&xe->drm, "bcs%u fused off\n", j);
> 		}
> 	}
>-
>-	/* TODO: compute engines */
> }
>
> int xe_hw_engines_init_early(struct xe_gt *gt)
> {
> 	int i;
>
>-	read_fuses(gt);
>+	read_media_fuses(gt);
>+	read_copy_fuses(gt);
>+	/* TODO: compute engines */
>
> 	for (i = 0; i < ARRAY_SIZE(gt->hw_engines); i++)
> 		hw_engine_init_early(gt, &gt->hw_engines[i], i);
>-- 
>2.39.2
>
