Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A4CC77B6C
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 22:08:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39DA10E5C4;
	Wed,  5 Apr 2023 22:08:36 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECD510E5C4
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 22:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680732515; x=1712268515;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=89EYl2wuWSe+Pv0qM0LRZjmKo8AIM0PIqGOxzKCg0Ps=;
 b=djtCJZfo5NbyyEgQCD3/DMaOeH2y1dpGxBNPuDff56S4okllwUL2Pfl+
 5E4pGul5POSaOk50pMkTFkp/LddWc3E4NkEc3kO/o4u8BYop83H+TD82g
 aaflCnDSNN/zkexuqw5mjR3m6+sAzvzkqTbW/l+7XlyxbQZ/kTD+81Kj/
 LnnkBHSV1a17gzs9AG+t/rEFkJVTWS3cuznQAOKD1ClC6xJYOni40njlb
 bfMl1U9KSVi5jcnOaAmj5TYf9jBucc4GhQBKpxAnMfGcB9Ahgg2Ozhmg8
 0Hbww4cQtHoDMraJP+gs3KcKceqocxyoZW/d2C+OyIwmjsl9zIi6A4V76 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="370413788"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="370413788"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 15:08:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="861144273"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="861144273"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 05 Apr 2023 15:08:29 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 15:08:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 15:08:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 15:08:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 15:08:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M76DG7Mtay81jsKL9ddzsoqzcOqQOm8Tzx2vM7mcMnughoxXe2ShfGqF7aKJn8amcd1m8tIQTnpNxV8UgzaavanpW76vM4Oix1JX9B+MDTlSd0+3401ogiPKKwSVA12MAw0tqb+QZYebn4V2p6hcvajWB32tSDBPmt8ZDzr49UG0+c8mThatntYuS14tk1v4CKwZ1omd6/6yCAOBSASVsHpSnufRWd71/wUmYheV/mWhOQQ0Tq6DlBuuFacpif+oTk4vROj4u7d2nchVviuqWgfCnMQ+wAb2rSNR2e5O8Yql1YsSxrXWJnMFoKLIV4DZult+7VQyHHuPFI7ArEBmIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjBH/cmKSLiTrftH7L7Dh75JitqdgF4zgxJDSfEqNvk=;
 b=QXPgB3AKCsJVUWk7u0P3s12SSiXMYJRj3Hvha/KmlVFJngzksquk4pGx14XzPIkdRrZSTZiNsHrrY9DG5Aw9I51ZFrlG8D/2ZhWcSpHizxvYwmi4QoQ5bCPxBD5ZlUuHKgI8LKIIEXvzF7q2WlFo4vl6qlJim5HFwycDQMF+R1Yitq1mhxZridYPEyde8J5ASlBYjGhvtqj2NANGy28Z+pPw2/KCPtTS8IaqO9SfFAqVnt2CJVhOF0ROEMX4kQEHdOh5dhB/o1V5FT/ARzNyHq6qjFhgjccxPYe5OCupoq/riFtNN+airtkojdak9TNncYiF0QnlhHW3N/saTvsJ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5230.namprd11.prod.outlook.com (2603:10b6:5:39a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 22:08:23 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.030; Wed, 5 Apr 2023
 22:08:23 +0000
Date: Wed, 5 Apr 2023 15:08:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230405220820.kz24cypkaxzso2ab@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230403201702.996400-1-matthew.d.roper@intel.com>
 <20230403201702.996400-4-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230403201702.996400-4-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY3PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:254::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5230:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c02d40e-131f-45d5-0a96-08db36224598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /IlwEtMhVQ8lKw7p2gkiDfBNglX6ml8vlldfc9XB3ACOLlhNQhPSsrlqJcutqXhcalpGGLBgIZtVegp6qe++B/+pC008ofHy5t9fLMZQWMOvtVjJex7MW3/QGxn5B+0OSrSaucSzaB39Xa5dfzHxQUctQeMrUleh8IkC7knlBpMWUQJjsb9CxUFTrp3QTu4hbLoB5XB8NRuk4IGuQSbLpnDQz/JCoxfgeo0RxZtA+SsfkvRCNDVLm44YwDJhrgPgBeKs96+GObiC9QzpyYQMofQmcrt+UCPD9ve/REKQauY/nOIvlBIreBlWIQW389CoDdtcxsMPeaZgnhYUiiktYoNy7t7tAL8Eoi3gOhe59DuBdp7SNf5bWQC4/Ww9RLFbsThj97kfC9pXnMczVA29lAZyC6jPZsDDlkXnPkqDYmHffm1WzkALD3pGOEaKt/mullXX9U/3D/GSuW5SvrQWSCOj64aJvJ+YAntyrZFY7CBryrcfKmqiVobb3xzAU4nVKgbMOP0EGKBkIKbIa7txACGeisd5QNOCUvLv0nWu0zX1jlsuiTGROLr15gCSddJj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(26005)(1076003)(9686003)(6512007)(66476007)(66899021)(6506007)(6636002)(36756003)(478600001)(316002)(6486002)(5660300002)(8936002)(6862004)(2906002)(82960400001)(86362001)(66946007)(4326008)(8676002)(38100700002)(66556008)(41300700001)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2GIcYtxJbBzI+hDkSQGMROzU0tf8Rn5B0EheM16ZPxRCyri66szVK5B09RSX?=
 =?us-ascii?Q?M7o/fFXUg/vOyf6WfWqaoVVOjX2IBmByU7t8tGm+8565/4s/3hzrklggpVQx?=
 =?us-ascii?Q?aBL0Wb/GCrRqNPVdscV7HLHJBJkcsGTNn3tSaMSSMbrnpBzp/Wbe6ynQ8VYE?=
 =?us-ascii?Q?rs6zOMIvLG1A+Iu4A00BBuQsmALY6EMKnmn0OpoZkZOQdzJxzx409Jq114Mi?=
 =?us-ascii?Q?+fCdZ9Qbrmqgq+dhyRwU+fGNWCRbK62tvoLLbA1XOLoDLrIvC5jmJu64vpy+?=
 =?us-ascii?Q?2KUCOyMyVpty/1Wlh5xPJuczC/l1J73t7WuePIqf8AA0hX2lNaYqn0iSirk1?=
 =?us-ascii?Q?LLMNfMMjXpLiJk749i8wJu3MQMBrouwsCSe2JYY3iCEnN+kVAFTI8FqgLNBc?=
 =?us-ascii?Q?vTOQRM2f1PPZ5uGSl0DYixIrO35UR3v0M15CKVCECvMpUcneHwzNPGtxw0f0?=
 =?us-ascii?Q?PGizvIU2wcTVR7rHBenGMrkCeZwNTyq/QlgUSPUO70VdTveYOpqdAHds/Zlo?=
 =?us-ascii?Q?te7JNMFH6qx8OMJcWEoLcg3PWlrof7l0ULLX4S7e2vdtHpKwia9tqhf+QXb4?=
 =?us-ascii?Q?Z0vvhuWB5xk8UyHnuhUp1CobazhWujNApOtmaQv7ONwkFZGpKFzbCGPeG537?=
 =?us-ascii?Q?9S02QtW93HiJZ/I5DgSgg1a33MEfSLNlJlihO+bF1aOLUGnVXxhbzMqlarGc?=
 =?us-ascii?Q?eQwKrkOPFJd/ytMmfyKIuC29wH5VJ1gfhv9hPTRTE2rGNMFWViw+hns86BNA?=
 =?us-ascii?Q?GXo8vPJdjwsaT60tiQZB2uBMeuf1dRiUE8wFz2lfySYr8iHLEjeX3HbqqIME?=
 =?us-ascii?Q?Q+QPPaxuirw/qybHU8N4Z/iQb3BAww6ZYm7A5SidoP0brSyx1GXFMs1U0VFo?=
 =?us-ascii?Q?5cZ/mOGV3/wEAhgO4EDeJ1Yi5D0yWTSuvi21NL6/d3rWj99Wg+fQrx6vV0OT?=
 =?us-ascii?Q?/3tPnDcpF9dtoy5W88vNr7gcciBozRFg1sVETefcyoqkRCzu5kZEt7PdF9wm?=
 =?us-ascii?Q?VyPj7E1FNY0VuBNa8vIFZazNOSUAWnQelBeFy49hwVAhxZ/GpAX2d3BFYZ/2?=
 =?us-ascii?Q?fPbD66BCJkVkoNR7B8ZRdw19pA6yzWCw3EzB2YxBHJ6Z8KgK6hGpyaa2kwxx?=
 =?us-ascii?Q?+VZKPryVZB1tHK0QKc4i4Dp2EsQVE03WHDumyFE6FzGxRQWI9qXkVeg1Cqnm?=
 =?us-ascii?Q?QOrOQbvGC/JME4Dnk7bHkJuTdt0rmECkARkpPGigNkHpWb2BISGzeFQppfIN?=
 =?us-ascii?Q?JGQleihXjntxEd2KhHxWVPWyl4JeZMFpegMpHASjHkzlV84Go9KoXWHW5kAD?=
 =?us-ascii?Q?NDolz9m6g2NprTnNK8l8lC/EYVUZsViA5Y263hx17MBwBU8Ln8oS1SwJVKzs?=
 =?us-ascii?Q?PiZx845FfgR/NZvm9fy1Mc8qWtwU52OHkdfEfR38iEt1IjE8UNG5/tAKMYWj?=
 =?us-ascii?Q?Hmpd/3dDLtQUBW7UWnTPZx7MRmo0qPCXdAw+yLBtNOlZU1WVK0VzYTeHZzlA?=
 =?us-ascii?Q?y3NQhmds2KJX9j5y/XUIQC1KnV7k2J0GIn0cHBglkMBCmNrMBOSCCw2uWDcQ?=
 =?us-ascii?Q?g5Na6UlPsdxvCkBvMNAhIGvLr//yospVIrFIQ1FTTPNqEs34udr0dn8oEp0t?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c02d40e-131f-45d5-0a96-08db36224598
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 22:08:23.0347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2fyy4NTvP8Qhyr038Q+yNPhOtYBEhwzoc5hFz0aFErxyMHwWGF8NRvZu7MTdJ3ApJVL18H3rF6G1R1D/8LAe89bhWg2zvKKecNUcacQ9Fg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5230
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/6] drm/xe: Move most platform traits to
 graphics IP
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

On Mon, Apr 03, 2023 at 01:16:59PM -0700, Matt Roper wrote:
>Most of the traits currently in the device descriptor structures are
>either tied to the graphics IP or should be inferred from the graphics
>IP.  This becomes important on MTL and beyond where IP versions are
>supposed to be detected from the hardware's GMD_ID registers rather than
>mapped from PCI devid.
>
>Engine masks are left where they are for now; they'll be dealt with
>separately in a future patch.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_pci.c | 110 ++++++++++++++++++------------------
> 1 file changed, 56 insertions(+), 54 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index e9c92034765c..ba56f92c3c5f 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -45,6 +45,17 @@ struct xe_gt_desc {
> struct xe_graphics_desc {
> 	u8 ver;
> 	u8 rel;
>+
>+	u8 dma_mask_size;	/* available DMA address bits */
>+	u8 max_tiles;		/* defaults to 1 if unset */
>+	u8 vm_max_level;
>+	u8 vram_flags;
>+
>+	u8 has_asid:1;
>+	u8 has_flat_ccs:1;
>+	u8 has_link_copy_engine:1;
>+	u8 has_range_tlb_invalidation:1;
>+	u8 supports_usm:1;
> };
>
> struct xe_media_desc {
>@@ -63,24 +74,18 @@ struct xe_device_desc {
> 	const struct xe_subplatform_desc *subplatforms;
> 	const struct xe_gt_desc *extra_gts;
>
>-	u8 dma_mask_size; /* available DMA address bits */
>-
> 	u8 gt; /* GT number, 0 if undefined */
>
> #define DEFINE_FLAG(name) u8 name:1
> 	DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
> #undef DEFINE_FLAG
>
>-	u8 vram_flags;
>-	u8 max_tiles;
>-	u8 vm_max_level;
>-
>-	bool supports_usm;
>-	bool has_flat_ccs;
>+	/*
>+	 * FIXME: Xe doesn't care about presence/lack of 4tile since we can
>+	 * already determine that from the graphics IP version.  This flag
>+	 * should eventually move entirely into the display code's own logic.
>+	 */

drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c:               if (HAS_4TILE(i915) && t->buffers[i].tiling == CLIENT_TILING_Y)
drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c:               else if (!HAS_4TILE(i915) && t->buffers[i].tiling == CLIENT_TILING_4)


also used in gem selftests. But indeed, otherwise seems it would be
better to have it in the display side.



Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi
