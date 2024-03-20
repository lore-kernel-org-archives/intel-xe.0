Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E75AC54E68
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 00:07:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C3010F3FE;
	Wed, 20 Mar 2024 00:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZAizBj36";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33EA10F3FE
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 00:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710893271; x=1742429271;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZjW8Nv4QErTnu8vEYqFp3CvmQGGs/OkFg/zB8u+X/Wo=;
 b=ZAizBj36s4jLpotZvqI5ctp91wpM/Y5VsY5f8alkfWWc/2MRi884SYD1
 P16GrWXIWoLALuS0GaexlPRuAdsjy+/trfG/Or8ZJpPKLQHf2UM/av1kw
 uvvThl7E91H1rewrLYYBpGzd5pIN5GlFhvQnwMNOkXCjLOcte9vC86Rrx
 7ZysUHimYI1aZIXAG1TX/vQnxo016zfFOIAlsD220KhwoOlakkmvHmGT9
 I42WyodgRckvR6bePL/5Av7rUjy/jvGH+8CQblt57sCyYDpPYIGK9l4+t
 6Ji3KBV+yj3PZYVcoKTAOdEWYmz4XhrVMLBPVCIdn7wn6x146Mte9tkzO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="17201761"
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; d="scan'208";a="17201761"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 17:07:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; d="scan'208";a="18436139"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2024 17:07:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 17:07:49 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 17:07:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 17:07:49 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Mar 2024 17:07:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjTF+8tQCp7ews6ilBENn89+Q3wi/kAdNIOOlFQ9Px4ZTRuFseOIQH80EKimkwNLgmzroQLY7EhaJoD1OU19EQQv51a4en1RR3ndJawBbr9gICoQaRxgM2m4whgATzz0sJ+DUwgvQ41aNdEMMzcf3HawmZJsp2au2EaG33r9Om1micNFZwBFonaw9+kVgIdcyFWOn/p2DF6o69gfrqfKQgdF5LxNa7r5YzfPiAUD45mhS+a0wX7sJ3jnHIUGWGWsQ36tIzqbyNneuszPqK0QNOQ2RA9nJkf2pmQhkx4tRcgf4yaAIbpFRfsetc7pVdHY8qS33Evs/7CIO8GXLArSfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PETGPmIhiOx6Jm/fsfG2U5UnNGj2hnXBO/YV/0J2jc8=;
 b=fL/gQhGkoie5f4zqUx5QCoND12s8bnRWM9IIuLYz3usqBxnHlC415kqxQYj8ACcvvG9sZuPfEks681/ZXbiKyv34gbZV4A8hxwZzMCTcIzdXk117lz1EoOZ3gbQxMz4p33HXfhPiWy2/XnpnbG22usp3aByl6YtkN/PysT9E4Zb+hAb00Tvq/1Ew+sfOj6VJoeM5+ruQHz7iR1LGI0+NeV0xHdpXrci7MFjhLuBvvWG1yc3Ee3qU3XpX/YTStiajK7UMrlu/cw8tfTsmrKuhw9Ay3UDNjw1n5SVCVIooMBjwShR3l8LzYMODz8cO+c9wDvYygxUpQCMFbByf5RqUKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6782.namprd11.prod.outlook.com (2603:10b6:806:25e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Wed, 20 Mar
 2024 00:07:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 00:07:47 +0000
Date: Tue, 19 Mar 2024 19:07:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI 2/3] drm/xe: Add XE_BO_GGTT_INVALIDATE_BIT flag
Message-ID: <v7rscyk7swjiyge422fd23nf5wi23u5xiawk7tgbuuqbhwzxor@xgalqnagwgyw>
References: <20240319170756.14020-1-maarten.lankhorst@linux.intel.com>
 <20240319170756.14020-2-maarten.lankhorst@linux.intel.com>
 <46c323f5-6a43-4535-992f-3ff340efc5d1@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <46c323f5-6a43-4535-992f-3ff340efc5d1@intel.com>
X-ClientProxiedBy: BY5PR20CA0013.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6782:EE_
X-MS-Office365-Filtering-Correlation-Id: 24b99f1b-aa6f-47f9-c5b9-08dc4871c5fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KVnEUhRtPV+rBGX7jgTsNSzIKBR7iY10HV3KC0Wn5z9FnnTSt85VDG/28CtgO7xRwjbpXwD9XcGIDxFQ6uFNIKINfUrp8qiS+ZLQnMxXaD5wWNsXNcE30f2d3HYx+1O+VihN8naEcovce+YCk2+98RWrOXKAsIBHTkWAH+9I+TDGtMh20HhjwZ5Wt/SYFMsWKqlH44uXpTkreT88z6lJjbcp6mw8KitpdwtqACRdvnpdquyQqel/hJGM1BpIHTvxddkN1s6ZVv0aNPpyJUFXyi59+lHfdQLcskOe+U8aVpr3rYeSQg8zjEX4RqNXTDixWdaa5tiSisRfDLZoGLXL9SK8HmAgWZJj3z48Lu2cfOpPbDfQI69foi8NL5vWzDBR4TDgCb85g9e7KCq7pE8jEBfnfQU7kkhngGVXdwWMlgblldwSFaq2xY12202L6/pcLlKb5v2zFKLQjVNvpdT2hYqUplqqnoYu+/Ppw5v14X24Xfn4fjeIqg4ZeGuhA4TQtEo1qTHdbsWrC6lnF6ZkwAYghsLmpJqVdblxXj63+rlJx7fbiwLtVJV4kb7SaxNgh5Q7Rj0y+Jid9RVOROiSL21GGMzq7BGgx4Ka0BOshpYUMWeKRDGiMP8fwYvKIXpXwG8/sfdi520vL9FGmr66fWl5sWWcnSmFtri3kzpO8AU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(27256008); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9t36JpoIM1Vd+WY0laB2XZiigXN9IFaZtWTUVEwyFwGKL+/ak1/KbQNWNkCt?=
 =?us-ascii?Q?7eYMINHtfmEtCeAd4vAXkvn92dma/3FMADXrn5qu8zBar+vtxims2DEwqg0i?=
 =?us-ascii?Q?lwbUld4CAMmCfNFTJgHFqqsVDpzpqBpzaYqpxrrnfxxKArlSUlxEbKozb6yE?=
 =?us-ascii?Q?W69mlrzXucfZzim39YUr9wPRsnbAqdsu0cCUeduhT1NgBe+PGWIXxm+pn2rS?=
 =?us-ascii?Q?B3DWpXbHrT9H/p9L9qgKmC/7EQ5yOsVtHQ1jcWiAXMu/NJHfKJYl8XRCV43+?=
 =?us-ascii?Q?cj250cJf7n8S2vE+n8fT2U9ICPjpq8OjNZItlxBFnUbVWK00SSobE+zRYW6S?=
 =?us-ascii?Q?bUkoOTMtKNmebd6/SUgDqfk5j/fU6idEYtqm9by+O1rdfnq0uYVn2GYgl86O?=
 =?us-ascii?Q?vgZZuXdzsZLy/qb1lrZevDz22dANrEjMwunLvF3Rq1G6HbWYHr1q2J4zLcch?=
 =?us-ascii?Q?PqLkVFiM91QeK9hPhAd2tzykPTdageR7TSNVu3BhZlrAQTqeiLi3S96s1zbB?=
 =?us-ascii?Q?vdZUEpA1dM2vIOqTRDwDnWiJQ8S8uJiv09bdnifLSBSHqzTdw3Ot3aYXaRbY?=
 =?us-ascii?Q?Yl8642zZydBFpe9s9aKA9u6955c+FMR3gIj0xEU56MVIZr1vNv6XyUF6kFb9?=
 =?us-ascii?Q?AX6cyxK+qErNmfCoMJuXFeixtTTrmo+8eBuEr7uYBTO3vvTLIe1YoILluRFr?=
 =?us-ascii?Q?IweUHK2w5tMHCeTGY0wBXLw850djZi43Tx9igCIkKS3pWZr2ndWy7fYJgIL3?=
 =?us-ascii?Q?1aMAb2pQIOPXBISIsZn7ijvWb+tf99IQwJN72AqBQkGDM3Y0dh83XFXiRsXs?=
 =?us-ascii?Q?pTm3m5jiq8j/9NfUL621owdWYA4fAEIjXyKKeif5egRXqMLBIyxubJGIBSfe?=
 =?us-ascii?Q?gHIWA25OTkFf6ZxmMv6RXGb/TmgjwAZPN+R6rc/rBkB2NVToEXdsXfCLTPVL?=
 =?us-ascii?Q?3ch5mmE42gFJww9k4BKMC9+pVonqb+uOCrKIBDAyte2PvDt4Ttf0i+mqXiB0?=
 =?us-ascii?Q?7RPSpRlYDPsT7M+yJO9aIBEB4q357of17Q5t1DcNm8TaecpCWQFsdQ/i6Y55?=
 =?us-ascii?Q?452pjadY2geRQnl93HvXmMOgURHIQDceBUKGI9Odn0f2CLekxEu0Y9xQBSPu?=
 =?us-ascii?Q?ZSxMM/iW+THqd2vuZ8ZSzo3QlR4mlttFUJdc01XHR7X3uvG8fE4K6vkDUtKu?=
 =?us-ascii?Q?sUSk9zSMn0eF4kWMff8GjRSt5Zk5sIMlIbhAkXEfQhRfZMYQ0e5At6qG/4a+?=
 =?us-ascii?Q?bhGIb0yYgN/up54qRT7pFirLw4JAt4bfsTfd0YipstqgjiHsTfF0XdCOx41u?=
 =?us-ascii?Q?7/FoOPpgGRAScHAJ0wzReE9b3mtbzGBezwlZaDeL76ueU8BLKd8TkDJ0z0wu?=
 =?us-ascii?Q?sab2XWDbYI241+O2QA1RCo/HG4g26pJzZxZHffQNvts0daQ2687Jey0R5OYT?=
 =?us-ascii?Q?WyyrnEZ8RVcb2kAn96rzNFdPfuXF5p7msDJBeSarxXTLys4rFfXpaU5ea9hJ?=
 =?us-ascii?Q?h5CxZQUe+fdM3XBb7r2PTjSsxSNKLZh4Romip8Hxh1dbdDNdDe6feRgo2zlb?=
 =?us-ascii?Q?iQjMiM6l+JVA2jNQmk1UZYBqFCOWv6B+64JfClizTPKavxSkmxmr0nAI+FLQ?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b99f1b-aa6f-47f9-c5b9-08dc4871c5fe
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 00:07:47.1452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mRoWjTPB+0JvGiZqGYhPd3Y/53dQb+zMHPePEJ3zTcfnHHwaj8YzChuFdHIN4JK4hOFpJ7XCCVBhQpB3hcVDnHND59F3+BQdFvYaMckCRLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6782
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

On Tue, Mar 19, 2024 at 11:30:09PM +0530, Ghimiray, Himal Prasad wrote:
>
>On 19-03-2024 22:37, Maarten Lankhorst wrote:
>>From: Matthew Brost <matthew.brost@intel.com>
>>
>>Add XE_BO_GGTT_INVALIDATE_BIT flag which indicates the GGTT should be
>>invalidated when a BO is added / removed from the GGTT. This is
>>typically set when a BO is used by the GuC as the GuC has GGTT TLBs.
>>
>>Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>[mlankhorst: Small fix to only inherit GGTT_INVALIDATE from src bo]
>>Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>Link: https://patchwork.freedesktop.org/patch/msgid/20240306052002.311196-4-matthew.brost@intel.com
>>---
>>  drivers/gpu/drm/xe/display/xe_fb_pin.c |  2 +-
>>  drivers/gpu/drm/xe/xe_bo.c             |  8 +++++---
>>  drivers/gpu/drm/xe/xe_bo.h             |  1 +
>>  drivers/gpu/drm/xe/xe_ggtt.c           | 12 ++++++++----
>>  drivers/gpu/drm/xe/xe_ggtt.h           |  3 ++-
>>  drivers/gpu/drm/xe/xe_guc_ads.c        |  3 ++-
>>  drivers/gpu/drm/xe/xe_guc_ct.c         |  3 ++-
>>  drivers/gpu/drm/xe/xe_guc_hwconfig.c   |  3 ++-
>>  drivers/gpu/drm/xe/xe_guc_log.c        |  3 ++-
>>  drivers/gpu/drm/xe/xe_guc_pc.c         |  3 ++-
>>  drivers/gpu/drm/xe/xe_hw_engine.c      |  3 ++-
>>  drivers/gpu/drm/xe/xe_lrc.c            |  3 ++-
>>  drivers/gpu/drm/xe/xe_memirq.c         |  1 +
>>  drivers/gpu/drm/xe/xe_sa.c             |  3 ++-
>>  drivers/gpu/drm/xe/xe_uc_fw.c          |  3 ++-
>>  15 files changed, 36 insertions(+), 18 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>index 311ffad6e2c0..2a50a7eaaa31 100644
>>--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>@@ -323,7 +323,7 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
>>  		xe_bo_unpin_map_no_vm(vma->dpt);
>>  	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node) ||
>>  		 vma->bo->ggtt_node.start != vma->node.start)
>>-		xe_ggtt_remove_node(ggtt, &vma->node);
>>+		xe_ggtt_remove_node(ggtt, &vma->node, false);
>>  	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
>>  	ttm_bo_unpin(&vma->bo->ttm);
>>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>index 8383c56c9960..8ee04535da2a 100644
>>--- a/drivers/gpu/drm/xe/xe_bo.c
>>+++ b/drivers/gpu/drm/xe/xe_bo.c
>>@@ -1580,13 +1580,15 @@ struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_til
>>  int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src)
>>  {
>>  	struct xe_bo *bo;
>>+	u32 dst_flags = XE_BO_CREATE_VRAM_IF_DGFX(tile) | XE_BO_CREATE_GGTT_BIT;
>>+
>>+	dst_flags |= (*src)->flags & XE_BO_GGTT_INVALIDATE_BIT;
>>  	xe_assert(xe, IS_DGFX(xe));
>>  	xe_assert(xe, !(*src)->vmap.is_iomem);
>>-	bo = xe_managed_bo_create_from_data(xe, tile, (*src)->vmap.vaddr, (*src)->size,
>>-					    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>>-					    XE_BO_CREATE_GGTT_BIT);
>>+	bo = xe_managed_bo_create_from_data(xe, tile, (*src)->vmap.vaddr,
>>+					    (*src)->size, dst_flags);
>>  	if (IS_ERR(bo))
>>  		return PTR_ERR(bo);
>>diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>>index 87ae8ee7c316..d7afcf49fd9e 100644
>>--- a/drivers/gpu/drm/xe/xe_bo.h
>>+++ b/drivers/gpu/drm/xe/xe_bo.h
>>@@ -46,6 +46,7 @@
>>  #define XE_BO_NEEDS_CPU_ACCESS		BIT(13)
>>  #define XE_BO_NEEDS_UC			BIT(14)
>>  #define XE_BO_NEEDS_64K			BIT(15)
>>+#define XE_BO_GGTT_INVALIDATE_BIT	BIT(16)
>
>There is another patch from lucas where he is dropping usage of _BIT 
>suffix for existing BO flags name.
>
>Better to align to same convention.
>
>https://patchwork.freedesktop.org/patch/582863/?series=131120&rev=2

The hard part of that patch was finding a convention to follow
and the command to generate the patch. The rest is trivial and I can
simply re-generate it on top. I don't want that patch to block other
pending work.  So, if this is ready, feel free to apply and I will send
mine on top.

AFAIR there was another patch from Matt Auld I was waiting so my
refactor doesn't disrupt other pending work.

Lucas De Marchi
