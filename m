Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C9BC54E68
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 00:13:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F320010E51A;
	Wed, 20 Mar 2024 00:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EZorYkdv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D960F10E51A
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 00:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710893603; x=1742429603;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fUVKMcKBm4xZTlVq7r3tVoqk2mjYD08uOVh4pNQrSBA=;
 b=EZorYkdv2bhkfmuV7pH4cmRBzJmdPadKUUDa3+KZspOnaNg7TH0isj6z
 30qL9YFYkxv1cFD+UEsKzSIYOmKdX92QGAm29W9OBtVLVW8+3O4fLFgte
 IzyZrJyD9YXS99WDn3v0qYxRYkL2Bcxz/L9Myaf1Fu4orefZO4uMbf9np
 wkgh/I2nCy8k7ZCLc5EbNnchrueuHIch5gUyETjzmTLGLMM1ekArmaAeG
 SJu3NtAx8XdOBQ4+XEplUaNnKR5M2lRj5bQHnAC6lamxaDKeY9V1fcKoR
 tZx6rF8T76n/GVLifguL/9iSe4TNoddrwOvs8ATBovgSS9v14KLZi5iQI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="23299178"
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; d="scan'208";a="23299178"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 17:13:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; d="scan'208";a="14405332"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2024 17:13:22 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 17:13:22 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 17:13:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 17:13:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Mar 2024 17:13:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8CZA2WenQb8z/6iZ6ddPEq4T3jmh3DucxC5aC3ZcUse3SExrsL16U2qePnRTe6D/RcT7D/srGRViXF79YR9Wx+AL49lrXxGvDlOzp4t/YwV6ZMQqg6NkbW31oeJy6FUWVEj8Qjqso3CPcEXb2Dy1nP5cw//xM0BfXmYj8basRIEJnAdVYVRjwhSGz6PL+kATzfRH1OKW2aOFOla2QiaFsBnZZRGGjZ3M48knmPuLwhmtwAaCkjFJJfUNzT7fJgnl/9E+gd9jukd3cGdcQUuV/C2RAnQCysC3/hxaU/m8jjxPpUJx2LkmJ9KUfEb5wyBka7uliQN1BuXSckyHg0M5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEifPRno9rsc8bdbtSnNh7wscKYcOWK1BBZeNReXjL0=;
 b=dayA5Pc/u+WWyz7vUDdJ44GUwiIyx9WpsIyBkXzH4TSdmLOfk74Jf6KNAfax1LRfJFc1pz4v3rNoVJhSUyTy+lrXbqOHLGFUsGFcamac7tDKNPUgdrPbkpJ00uvOgo+07VYo5vwPSL8d9dGcsfe2IvCb9X+qem2qdPzjQ5rZwk7bE5SJQf/Pe1HpcvfhRL3leE/0Bvm5348MEWGegCLD/0aEWyQ+OtXiliDHeNUWwjXNuo+d7gKWIEUx2J5P1Dx0CdcNH/YC3VOMZwAKxszAdlp1LCk9TpW6A5mVS6/dx2QIHmLLoIOZ+NJz/mTrTPT8rxScIg1bq85rR4npr5dR0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6782.namprd11.prod.outlook.com (2603:10b6:806:25e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Wed, 20 Mar
 2024 00:13:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 00:13:19 +0000
Date: Tue, 19 Mar 2024 19:13:13 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [CI 2/3] drm/xe: Add XE_BO_GGTT_INVALIDATE_BIT flag
Message-ID: <b27eezey4joifbklz643rhh3km3mqrq5wvtd7ecffbcbmwnhjx@lgz3qduqi67a>
References: <20240319170756.14020-1-maarten.lankhorst@linux.intel.com>
 <20240319170756.14020-2-maarten.lankhorst@linux.intel.com>
 <46c323f5-6a43-4535-992f-3ff340efc5d1@intel.com>
 <v7rscyk7swjiyge422fd23nf5wi23u5xiawk7tgbuuqbhwzxor@xgalqnagwgyw>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <v7rscyk7swjiyge422fd23nf5wi23u5xiawk7tgbuuqbhwzxor@xgalqnagwgyw>
X-ClientProxiedBy: SJ0PR05CA0157.namprd05.prod.outlook.com
 (2603:10b6:a03:339::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6782:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d794e3b-a7aa-4f91-3f91-08dc48728c53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /sP/ND8LVFGNLNWL63c/OACYAFBKIZWtkLhssNGaUsnfFmmYl4Hm1TWMnszpjfB6u3vzy1OzIOV9dJAGKAQhsiMIm7Wv9aRy1fym3Vl0wFG8kTA4jRxq7xjNJ4i2EsmgQjDkygLHngd/yJel/bzoiPmPCVOts01fT3pL7PASl1y9oX5vXTnXnpuMgHZkFcfz2cDCg3So20v7G8LcPbEsJuUjDHrumXJqTiXgR/mVEXode2zwDL48D5NiGUU3czU3phGnQQ1j8lbUIr2TjdFU2bqYSvkegRUcABwp/0OnbrmAp4WZMG2lY8rTnoioLZdxf1lGEZ/Dqxy0omS5R5G+dObyNkqnuVUEuF+AGMqgO6IvxjGWu5CgXiBwehUS/1yRGQS+Ap68jsFTsCIaOdOOZjEHYhjg7vvaq1ihxtJL5dOGWvigL4KcHCbwg4HbEzl4GNQGHDLox05eedCsgTSr5N3EzQa2WB2FU+0VycF88H3iedagdzg8qpYqMg+QskkD1ekkqvHDgew3RwD+eY1oxbs5ffTlR+dK7EH71yishtF5hQK1amZvWgK82h9Qo/UjyoiV/XCXljg/SLpgsiChG8FACVfO6UsEZFX7x/itMwuR/n5vnX++FxBxzcyJFS75
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jv8WG2icbxyUZrfOhw9ajVXssDxLy7chEKB+zBLtA6PjefK33XpBGNTzzduD?=
 =?us-ascii?Q?3yvPQCUzzSLgjPkgFHqlqTKmtKWvQU/5L6k1y7ah+Fb/23qwu/upw9kaw1DE?=
 =?us-ascii?Q?584qfpl6tH84XLfpgiS1jqLnKef6mQo2NvleGN6/d7gU+HSIP+lPfYc4txfO?=
 =?us-ascii?Q?OYsfmctjQvLteZy9KlfsYJGTDTH48Lhf1xuL0LP2c6AwBfrmRHGqKuHJKzbH?=
 =?us-ascii?Q?COwK3rtAEFVvRo1L5bfS3CwJvx+cpf0sJyXhoE4Dc2Ff89m1E6CyIZ5tApEH?=
 =?us-ascii?Q?jEFkYoajJ61Z7gInGD6dOUT+f7qIiBzJApXLGcXOXMDiW+grNciArWqDtpeZ?=
 =?us-ascii?Q?hFnsGrHb36WLdfriXWF3lBPt2gzJbo9TKf6l1+w06GlDWBSGjl990asL9QFC?=
 =?us-ascii?Q?e/sPwSe66JqqSlvBUDQUWRAfz30fCbhIJVn837XcocRbBqWzhi8wb+xyRSOP?=
 =?us-ascii?Q?89BaWVgAQRDDQoe0sUtH/DDPe/4IaZPcvfBCT3XmyaNZ2mbh6GTRpOD/ZDcp?=
 =?us-ascii?Q?ly5381zK9pXOFaWrRPr8+bMBbUXUb/0FUPoxUwgxhpvDRQYiidEzV/kq+CGH?=
 =?us-ascii?Q?iCPVM/KmhbAoU99+JB7b3S9A7ZLUJnlF97dEjS0HoWHu7Q5oMG6V3HXpQfzA?=
 =?us-ascii?Q?DJFIpdXTyNt7bKa85kcIMYWeIlj95GbcTrp0IeQGPev2Kc4ibMzT29bEocec?=
 =?us-ascii?Q?STyd9deck1yupFZC+wXMHyJHMjG9v0n7d8J7+CXnN8X+9Glo4GmG9uZkEuzD?=
 =?us-ascii?Q?VXL2QKkPg6cX90Bmnp9dlRb6ldreAnfG8sPhP8E0CMwwJA4YjmUbc876N0hP?=
 =?us-ascii?Q?S4rPQ+89/Ex1dkPRUKSqPmtNUyf/7REpN3lx+Ar2LyVKkzAdmft2fAZG6xE2?=
 =?us-ascii?Q?fyd6YfzllRX/YHt0+AuowIUWl/BNdQt5zeGUiR2p7p6L0FLd3yHri7hk56Oj?=
 =?us-ascii?Q?M4tBI6btkDqCyMWu9yJA3sojI16G2vVYT+icqx2rYH7C7zRHz801tRxWTGj6?=
 =?us-ascii?Q?iRDy2/cczxaBSgYML4bsst/Ns9p/ozIOtJjvakeDtqgKnKXtHrExY+vnb09j?=
 =?us-ascii?Q?UP77oSoXZqBcFrAUzfr5UdJEOoacckeo4ii8nRucHC9fS60oJj697h5UkCZI?=
 =?us-ascii?Q?LYPTPXbqDfUVDQKuAHcAYmFOcXZJyFsWhYRB2Qb4fPGINwfCePizHYWieexY?=
 =?us-ascii?Q?8pGv7tPdsEDtAJnEgejFyUHMgqGTCQYEr0ly4pITlQN0kR9fEMs0D9ZMQeEz?=
 =?us-ascii?Q?9H1jwJeWvrEM36WDLwf6lI0jjSoX8WoCAFev7HRKDKpOGCK7XMS03qiTBtRQ?=
 =?us-ascii?Q?ySmbcLcBOs7SHTEnwWm5lZQ6CLK1YQE+psLyL6/TynW5V5CUnCYu1m5LIaOL?=
 =?us-ascii?Q?xdMOmaz1mYNjyfvVZThS+RWPm3aYXcOi96s0fxH1MfGBA6cp1Fax6yE6w3Sl?=
 =?us-ascii?Q?ynnxrjrAS/w3D4kS4nADU9Po6CK2+X14PXZNa7BIqo0G2uvBBHe5EP2bhZZD?=
 =?us-ascii?Q?DrgBPA0hRKyf1xeIhU9OqNBtoEpN3TP87P+1Wiqx1lGzbTpxD9zFo1CzlBZw?=
 =?us-ascii?Q?DWB7EGfWU13aXm9Lbu6stZWXE95hWKtte7t/dk57FD/Pb5kaUSwCCpka/GwJ?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d794e3b-a7aa-4f91-3f91-08dc48728c53
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 00:13:19.8748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rYmoYgTM6s2jNkuU5TNn05yL0fFo0UUqYcjTL3cUQMUQ2EKjYMiM+IB/n5vTuuqODYQGVzOSkur4tmCvuKVB+g1jYuKveeocjPtVJYxs24=
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

On Tue, Mar 19, 2024 at 07:07:41PM -0500, Lucas De Marchi wrote:
>On Tue, Mar 19, 2024 at 11:30:09PM +0530, Ghimiray, Himal Prasad wrote:
>>
>>On 19-03-2024 22:37, Maarten Lankhorst wrote:
>>>From: Matthew Brost <matthew.brost@intel.com>
>>>
>>>Add XE_BO_GGTT_INVALIDATE_BIT flag which indicates the GGTT should be
>>>invalidated when a BO is added / removed from the GGTT. This is
>>>typically set when a BO is used by the GuC as the GuC has GGTT TLBs.
>>>
>>>Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>[mlankhorst: Small fix to only inherit GGTT_INVALIDATE from src bo]
>>>Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>Link: https://patchwork.freedesktop.org/patch/msgid/20240306052002.311196-4-matthew.brost@intel.com
>>>---
>>> drivers/gpu/drm/xe/display/xe_fb_pin.c |  2 +-
>>> drivers/gpu/drm/xe/xe_bo.c             |  8 +++++---
>>> drivers/gpu/drm/xe/xe_bo.h             |  1 +
>>> drivers/gpu/drm/xe/xe_ggtt.c           | 12 ++++++++----
>>> drivers/gpu/drm/xe/xe_ggtt.h           |  3 ++-
>>> drivers/gpu/drm/xe/xe_guc_ads.c        |  3 ++-
>>> drivers/gpu/drm/xe/xe_guc_ct.c         |  3 ++-
>>> drivers/gpu/drm/xe/xe_guc_hwconfig.c   |  3 ++-
>>> drivers/gpu/drm/xe/xe_guc_log.c        |  3 ++-
>>> drivers/gpu/drm/xe/xe_guc_pc.c         |  3 ++-
>>> drivers/gpu/drm/xe/xe_hw_engine.c      |  3 ++-
>>> drivers/gpu/drm/xe/xe_lrc.c            |  3 ++-
>>> drivers/gpu/drm/xe/xe_memirq.c         |  1 +
>>> drivers/gpu/drm/xe/xe_sa.c             |  3 ++-
>>> drivers/gpu/drm/xe/xe_uc_fw.c          |  3 ++-
>>> 15 files changed, 36 insertions(+), 18 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>index 311ffad6e2c0..2a50a7eaaa31 100644
>>>--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>@@ -323,7 +323,7 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
>>> 		xe_bo_unpin_map_no_vm(vma->dpt);
>>> 	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node) ||
>>> 		 vma->bo->ggtt_node.start != vma->node.start)
>>>-		xe_ggtt_remove_node(ggtt, &vma->node);
>>>+		xe_ggtt_remove_node(ggtt, &vma->node, false);
>>> 	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
>>> 	ttm_bo_unpin(&vma->bo->ttm);
>>>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>>index 8383c56c9960..8ee04535da2a 100644
>>>--- a/drivers/gpu/drm/xe/xe_bo.c
>>>+++ b/drivers/gpu/drm/xe/xe_bo.c
>>>@@ -1580,13 +1580,15 @@ struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_til
>>> int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src)
>>> {
>>> 	struct xe_bo *bo;
>>>+	u32 dst_flags = XE_BO_CREATE_VRAM_IF_DGFX(tile) | XE_BO_CREATE_GGTT_BIT;
>>>+
>>>+	dst_flags |= (*src)->flags & XE_BO_GGTT_INVALIDATE_BIT;
>>> 	xe_assert(xe, IS_DGFX(xe));
>>> 	xe_assert(xe, !(*src)->vmap.is_iomem);
>>>-	bo = xe_managed_bo_create_from_data(xe, tile, (*src)->vmap.vaddr, (*src)->size,
>>>-					    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>>>-					    XE_BO_CREATE_GGTT_BIT);
>>>+	bo = xe_managed_bo_create_from_data(xe, tile, (*src)->vmap.vaddr,
>>>+					    (*src)->size, dst_flags);
>>> 	if (IS_ERR(bo))
>>> 		return PTR_ERR(bo);
>>>diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>>>index 87ae8ee7c316..d7afcf49fd9e 100644
>>>--- a/drivers/gpu/drm/xe/xe_bo.h
>>>+++ b/drivers/gpu/drm/xe/xe_bo.h
>>>@@ -46,6 +46,7 @@
>>> #define XE_BO_NEEDS_CPU_ACCESS		BIT(13)
>>> #define XE_BO_NEEDS_UC			BIT(14)
>>> #define XE_BO_NEEDS_64K			BIT(15)
>>>+#define XE_BO_GGTT_INVALIDATE_BIT	BIT(16)
>>
>>There is another patch from lucas where he is dropping usage of _BIT 
>>suffix for existing BO flags name.
>>
>>Better to align to same convention.
>>
>>https://patchwork.freedesktop.org/patch/582863/?series=131120&rev=2
>
>The hard part of that patch was finding a convention to follow
>and the command to generate the patch. The rest is trivial and I can
>simply re-generate it on top. I don't want that patch to block other
>pending work.  So, if this is ready, feel free to apply and I will send
>mine on top.
>
>AFAIR there was another patch from Matt Auld I was waiting so my
>refactor doesn't disrupt other pending work.

found it and it's now merged: 2a4172be4013 ("drm/xe/display: mark DPT
with XE_BO_PAGETABLE"). Let me know if this is going to merge soon or if
I should just re-generate mine with the current state.

Lucas De Marchi

>
>Lucas De Marchi
