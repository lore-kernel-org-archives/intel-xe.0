Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF95C30658
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 19:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CEA610ED1D;
	Fri, 28 Jun 2024 19:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GI2tGJbg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1A910ED3D
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 19:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719602904; x=1751138904;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=C0jwUj7NmNkp20+qZ+JgZrXkTt2sj9h2K+CEkpGhQIM=;
 b=GI2tGJbgu0k8hbW5AREwtY0Qad4+Gk/f9ZfxJpQRNcKAUAwS36J4VBhl
 tkv9lh82ACW+XGMIfJAA/ggqaEkjL2Ql1SvsJXRTQmPwIOQzNyhyIOpib
 GYxqLbeE13aw3MPMqNxQS/w4lTXbIHGJsX1PakECIWQwIXQQ5eWqQQG0l
 da66uSvYgNqFckIcaUf4fGUGyrdKCw4Yzu4Uyuf5zfuC4TYK5LjlUF5yN
 PYtT9Cf1Nngtw+0kP7C0HMJfPjSO8+T0oBZ9CMKVY7u0Z5o3BA2JgTf1B
 uAUMQrRy4eetcnvyBPw02pwWTbMiq3JWUcBXUiUyv0Bwrsrf9E9GwAWlL w==;
X-CSE-ConnectionGUID: 7JR49OS1RWit2swAA1ZmOA==
X-CSE-MsgGUID: XZu7KGJFRv+13whARwaH7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="28189799"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="28189799"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 12:28:24 -0700
X-CSE-ConnectionGUID: BMNCSd4qR5SYwGvyKpVG3A==
X-CSE-MsgGUID: HNCriptzTW6huzTUR3JQag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="50015539"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 12:28:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 12:28:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 12:28:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 12:28:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 12:28:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OB/wiWCoJRbHAB18UBaX4VhqgD8MJb8RNX/GnBbdPWPQLRb51I5hoEV8XPfdF67hNv+wjPGgif4TtBiUTezphnI45bVEwaBy0Pq9N/wNMziTQto4iJNVFJ5+6xlB8WIk/H/9+dSQ2XiRl+axbs8LCc5YAujZ7LqJEqPVBvbj8Tkwx5na3VvbwQvd/fEW0ksq3mK97gfIdPh2VEAH5FLe8kYmmFgFW2WjLX6NILQQctgGkci6rgeTuaz00hY0K0iXwIgo3D4QWCfxKAakMJwWuMMZ5A3EwqUknY41kkHjROwgp9QKQFOuF9x/wJb8UI2oa4ZvxeqeGX35rTfQRUrUHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HONunYDVJcyFtEDUlM7KWHVc9a/v7IoqPtr9FFtSOs8=;
 b=Be5PzOTahPyWg6tb+9yjOJuvjW265/VWOoH/NeH2QKQxATsaL9UoNCr+WW+m0SDj6PJvG2F3ktSHyBo9Za+2sZE6kJ5F7JKDtYUAAW5LWby7neqHQ65AfqeObW5MxNSBa2Wsk1AD/td85LX5OeKhbbJ3XzAIyZ55z6WyWkaDCcbiK+v9WPAIx5WLXmZpAPAj0zLhwxz2M5HltKI9nHJ8n5976UtjEknhgrQwwRA15MIFPNNJLr0cFYSK39u4u7uWD+Dko5dWydTGjMvaDaj0va2gNvhVhwBimm372X+J4QSWF4ZMEITHVRE/3aVIR+TOD43Bd727E5zzF0RF2xtE2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7483.namprd11.prod.outlook.com (2603:10b6:8:147::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 19:28:19 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 19:28:19 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [RFC 06/12] drm/xe: Rename xe_ggtt_node related functions
Date: Fri, 28 Jun 2024 15:27:47 -0400
Message-ID: <20240628192753.386137-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240628192753.386137-1-rodrigo.vivi@intel.com>
References: <20240628192753.386137-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0102.namprd03.prod.outlook.com
 (2603:10b6:a03:333::17) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: d61263ee-9e2a-4bc6-36b0-08dc97a8779f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OJBhdJDBxBXE8Cf7Ld1TmbxP53/e9ADfG+EP8OfE72M2awk9SVE8VuXEVC/P?=
 =?us-ascii?Q?WnRteMlRFgy8PCUfOhp0eLRCIFuIl7gh+CjJusWtv/DU769UzsBwPyqK03zc?=
 =?us-ascii?Q?mINM0qP1k7s3gpIY3CmTBZO4tCqKWwNbe0yhzNf2Tej9oxJJfuenCnxR/TmS?=
 =?us-ascii?Q?lvJWMrSrarwuZ+t6niS/IywO7oWn2uMLSnqbOGwNjmNoFvXhAHAl7mUEFvv7?=
 =?us-ascii?Q?CIzWunMSVpEyXW3X8EpUDZyP84isJ1tQT51vSNsJKbPhRORqrf/BV4tXyUQS?=
 =?us-ascii?Q?qa3LQthpqdIG3W3bj88jZ7+D08GfwEuEVhSZnFgonF6BktoN9x1CpEj4I/oh?=
 =?us-ascii?Q?oQdeiAq/Tzp9SdUt3ZUC+WfRVOXPsEk3K9mtl08M6ihJiNASbnab/QmD5TJT?=
 =?us-ascii?Q?Vvc5aM1Ll8Lr6FMs8ZyZbQc+8MKFbkg6rfWpQh31jv4M6+iLKJh9FfT25ZzO?=
 =?us-ascii?Q?d53EQkzV4xKEXmqfOKQ3qxG6rK+LsZUR964Nwp7DpPds6nsJClL5WHj4KiF/?=
 =?us-ascii?Q?rz/yXIU/O89qGruGFwljkRTp+fmXZI3x7D0tPYorNe3obSJSa50bTWQeIMpD?=
 =?us-ascii?Q?R/FKAFQediXEB+xuMb2shmhJOTZxHHqqztWMIQvcKK7/XV6XRQZIyD3t6Vxp?=
 =?us-ascii?Q?U3m97AWvUwJiSPj1a4J/DWNMPQ/413dwtJyKc2aJuP8B3FvmahNrT1a6iXin?=
 =?us-ascii?Q?YpZi3zxkqN6miJKTfWT8nZGPRYQ1RtuOQmLTJNnghw0J5yGymeYg4BjpBxhM?=
 =?us-ascii?Q?Sn6CnTwQR1T9Tt+74hC+LkyBK8V2ZClMApV9uZV7g/oyTJn0+hhPLwzKcEbK?=
 =?us-ascii?Q?xkkOukjzOT8cBE02xVRmNFaHliml0/ya6PShbYfHGg0QD/DHOpwaQnZ3XksD?=
 =?us-ascii?Q?FyZL8Ebzou+PyD6f5G6bGtv7M9r2zKFKVsVVai7ANccmsUsnSK2Zl1V5pGjR?=
 =?us-ascii?Q?tIkav3gzhDs5SdyXVItJM14J+IHBkghwcau4Maa1xEdkzDdjGrNvJ20FTOMe?=
 =?us-ascii?Q?5b2cwPSrbMjLIFuKuyvUAFlW8pAB3pqfVqCMUsEs0Q4HVuaHhDXl+f1zt6Oq?=
 =?us-ascii?Q?nKyxUyDz7Mq3bPpIoIJ0HkXcgqbmFj2uOyl1IIEcrHXe69gwVUqmeLCYCwqh?=
 =?us-ascii?Q?Ydko+hykkrNyEXUkq+4erXW36tyugtyY35aP4bBLO98pOJgD0FgRvbG5h+JG?=
 =?us-ascii?Q?n4ByChbKxuiitETsy6bHoH+hFdPZDnpKYEKXBKJrHxE8mbkEiHKrqghtBkR1?=
 =?us-ascii?Q?CI8kuCVfXbWLQ2NXPxfQppwIoonTKfQ/7C55dzmTl+VSxxXVmG5kssHoBZvm?=
 =?us-ascii?Q?3uKswFtKnTcvAcPaaM9mVZm2BAfdlZI1yHlQYVWBxPKh1g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c6P/VhHO+vyyDYmY1NPbXpEFT24pHeRrXznQCZb6lLTJjVGEi6I4hnJKJ9th?=
 =?us-ascii?Q?OqdoxJSp2ps2Ga1fy7ajx2CyKrNRA8GT0c2sri8zg7ez1dM9YQ2mYlcEYuGN?=
 =?us-ascii?Q?emhbZBJYSM+hYJ9Txta4OtANCoEHYo7BfzH0Q89ceOnVxPxogDjLUsIZpaAo?=
 =?us-ascii?Q?gKVcspzmpLBI3yj1MKf8SSwvfCpwEavNqfRku+eABPJthBz206VPWzTzTo89?=
 =?us-ascii?Q?faiMIKz/ejz7CGKqmu1LoOnN16CkXS99mfNwxeom1H52o09mQ7O8cgkgHaS4?=
 =?us-ascii?Q?1SGu08LHthwlUi0JeUv9qE5VPClyBwZ/zhocngcYaf5/MH4WVIdb43PgygLF?=
 =?us-ascii?Q?4sSmlYgh30Y64eD3q1LIBz4xwmNjijvCKJ6MZ+0Up6faTUdUIlUD+VsHThJl?=
 =?us-ascii?Q?mqitV37pIJCS2o0lIW5MJDMTH434oSBqCPmZbBvOUXsvrwdUmtTxxgifzzEh?=
 =?us-ascii?Q?nRSJdLLGFjrBh9Zpdtv5Hgje+iIdSvIZ2w4LUUbmFirhD5fNxaFFeN8or23u?=
 =?us-ascii?Q?lMdWE5A5dOVogBLJ1rb4/qkHmuVfapdqF5W5B+V/P7peHX6lfs2gGsAJ/tLo?=
 =?us-ascii?Q?DjofKB3lBVQFYYyj5FyX1zNAiI1MxU9PaLvwnRierC5mmXnMopgIyDzeKA1f?=
 =?us-ascii?Q?yZfxVR1cdHXXlStQYaHSwisk8QSqj1Y4HXp3z4gkwFrB1a8Ai/FtaFIRhr/e?=
 =?us-ascii?Q?Eb/pPzHEaqxp0ehgmUxeE68oTvNakwN4ex51SnvZqK4ol3gGofD4XlVV0C4+?=
 =?us-ascii?Q?Bgx04ijSFesVZap8sDWXARykE+GVDJ0VU8q5njep5RDtEDWZ1DLxOlH7H2wI?=
 =?us-ascii?Q?5KNCbKFLOklLG4Pm+2A6RKop6/1ilWe/SngBnNH5965fNlfYyzGPf040bQIY?=
 =?us-ascii?Q?4FbwCLxl71UxTs8Em33DFfxV34s6XIyfl4aPHeZbs6Njls+XoBH1UZ7ASvH3?=
 =?us-ascii?Q?+alFmtlKvMhYXz/BXK8EmeZDQA/5VV/ASZWCAtAQqt377tdyNGnJSedO8UB3?=
 =?us-ascii?Q?2k2NDYcB89rpGRCXHzVvAQ/DKJgLDDQGK+NnB7AN0gi2XGSKqVXhcFJvTeI3?=
 =?us-ascii?Q?P69PCJGmIWp1d5E7YrDs2AG/w0JP62JXvwEixcziEwtIBVtOIhwPtZekhQaM?=
 =?us-ascii?Q?Ux0t/09EplrYBp5FHyoNFkMq0IwZpQamYUf+3TWty4yoLqOr3NEVkFPMw9OK?=
 =?us-ascii?Q?4Kehq8KjlglpSAtsKRp7jzgjTmpuqoMADDs0FPox5GDwxRUELs+uk2MRdywx?=
 =?us-ascii?Q?gM/Fbo7kd9cGiH030kkLnDq3Cw8Z+WbcXaTjLJfJD+wmhSxhC8fQrF65H1Gl?=
 =?us-ascii?Q?daJKJ9gkBKHKe3Eg1B+t/6O+PU2pPWLSuXCaa2yIBOD5qicWbz/7g1vAU+cK?=
 =?us-ascii?Q?ZHERhGQ3YcQZpGKXNj1/t3Zd7E0TaLurvMudtsFlOENbafkq2Y8vDpukcaVw?=
 =?us-ascii?Q?GHKAzS8PJOWyUriGe2L8GKbZx5MRWxKf5zP1uDrn2WgS4kC/M167Af355VM4?=
 =?us-ascii?Q?C3NsNs5P3/tP4NktR0PcKCeHETUsaaX3f2KatMVHKw6CAoj1gWOE9ak8JFWm?=
 =?us-ascii?Q?zv5VC/iC+qztLMCs7FqhXJf4wJ6/ZbWqYM/oG3v8esKXs9k70CXZtlvcOm5G?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d61263ee-9e2a-4bc6-36b0-08dc97a8779f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 19:28:19.8853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eps27SoKygpIDOBOcRdhfOpL+95iFqYhPUlw1zVLg9urWQa1HHIqJv6N0v7cO2oKeqEPy7r898r4FLMvn6XNQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7483
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

Bring some consistency and prepare for more xe_ggtt_node related
functions to be introduced.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c     |  8 +-
 drivers/gpu/drm/xe/xe_ggtt.c               | 86 +++++++++++-----------
 drivers/gpu/drm/xe/xe_ggtt.h               | 12 +--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  4 +-
 4 files changed, 54 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 1c46aa16357c..0ae1a635e30d 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -208,8 +208,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	} else if (view->type == I915_GTT_VIEW_NORMAL) {
 		u32 x, size = bo->ttm.base.size;
 
-		ret = xe_ggtt_insert_special_node_locked(ggtt, &vma->node, size,
-							 align, 0);
+		ret = xe_ggtt_node_insert_locked(ggtt, &vma->node, size, align, 0);
 		if (ret)
 			goto out_unlock;
 
@@ -226,8 +225,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 		/* display seems to use tiles instead of bytes here, so convert it back.. */
 		u32 size = intel_rotation_info_size(rot_info) * XE_PAGE_SIZE;
 
-		ret = xe_ggtt_insert_special_node_locked(ggtt, &vma->node, size,
-							 align, 0);
+		ret = xe_ggtt_node_insert_locked(ggtt, &vma->node, size, align, 0);
 		if (ret)
 			goto out_unlock;
 
@@ -324,7 +322,7 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 		xe_bo_unpin_map_no_vm(vma->dpt);
 	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node.base) ||
 		 vma->bo->ggtt_node.base.start != vma->node.base.start)
-		xe_ggtt_remove_node(ggtt, &vma->node, false);
+		xe_ggtt_node_remove(ggtt, &vma->node, false);
 
 	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
 	ttm_bo_unpin(&vma->bo->ttm);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 65399a472e77..0c350f367427 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -398,7 +398,7 @@ void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
 }
 
 /**
- * xe_ggtt_insert_special_node_locked - Locked version to insert a &xe_ggtt_node into the GGTT
+ * xe_ggtt_node_insert_locked - Locked version to insert a &xe_ggtt_node into the GGTT
  * @ggtt: the &xe_ggtt where node will be inserted
  * @node: the &xe_ggtt_node to be inserted
  * @size: size of the node
@@ -409,15 +409,15 @@ void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-				       u32 size, u32 align, u32 mm_flags)
+int xe_ggtt_node_insert_locked(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+			       u32 size, u32 align, u32 mm_flags)
 {
 	return drm_mm_insert_node_generic(&ggtt->mm, &node->base, size, align, 0,
 					  mm_flags);
 }
 
 /**
- * xe_ggtt_insert_special_node - Insert a &xe_ggtt_node into the GGTT
+ * xe_ggtt_node_insert - Insert a &xe_ggtt_node into the GGTT
  * @ggtt: the &xe_ggtt where node will be inserted
  * @node: the &xe_ggtt_node to be inserted
  * @size: size of the node
@@ -425,19 +425,53 @@ int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct xe_ggtt_node
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-				u32 size, u32 align)
+int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+			u32 size, u32 align)
 {
 	int ret;
 
 	mutex_lock(&ggtt->lock);
-	ret = xe_ggtt_insert_special_node_locked(ggtt, node, size,
-						 align, DRM_MM_INSERT_HIGH);
+	ret = xe_ggtt_node_insert_locked(ggtt, node, size,
+					 align, DRM_MM_INSERT_HIGH);
 	mutex_unlock(&ggtt->lock);
 
 	return ret;
 }
 
+/**
+ * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
+ * @ggtt: the &xe_ggtt where node will be removed
+ * @node: the &xe_ggtt_node to be removed
+ * @invalidate: if node needs invalidation upon removal
+ */
+void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+			 bool invalidate)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	bool bound;
+	int idx;
+
+	bound = drm_dev_enter(&xe->drm, &idx);
+	if (bound)
+		xe_pm_runtime_get_noresume(xe);
+
+	mutex_lock(&ggtt->lock);
+	if (bound)
+		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
+	drm_mm_remove_node(&node->base);
+	node->base.size = 0;
+	mutex_unlock(&ggtt->lock);
+
+	if (!bound)
+		return;
+
+	if (invalidate)
+		xe_ggtt_invalidate(ggtt);
+
+	xe_pm_runtime_put(xe);
+	drm_dev_exit(idx);
+}
+
 /**
  * xe_ggtt_map_bo - Map the BO into GGTT
  * @ggtt: the &xe_ggtt where node will be mapped
@@ -517,40 +551,6 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
 }
 
-/**
- * xe_ggtt_remove_node - Remove a &xe_ggtt_node from the GGTT
- * @ggtt: the &xe_ggtt where node will be removed
- * @node: the &xe_ggtt_node to be removed
- * @invalidate: if node needs invalidation upon removal
- */
-void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-			 bool invalidate)
-{
-	struct xe_device *xe = tile_to_xe(ggtt->tile);
-	bool bound;
-	int idx;
-
-	bound = drm_dev_enter(&xe->drm, &idx);
-	if (bound)
-		xe_pm_runtime_get_noresume(xe);
-
-	mutex_lock(&ggtt->lock);
-	if (bound)
-		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
-	drm_mm_remove_node(&node->base);
-	node->base.size = 0;
-	mutex_unlock(&ggtt->lock);
-
-	if (!bound)
-		return;
-
-	if (invalidate)
-		xe_ggtt_invalidate(ggtt);
-
-	xe_pm_runtime_put(xe);
-	drm_dev_exit(idx);
-}
-
 /**
  * xe_ggtt_remove_bo - Remove a BO from the GGTT
  * @ggtt: the &xe_ggtt where node will be removed
@@ -564,7 +564,7 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	/* This BO is not currently in the GGTT */
 	xe_tile_assert(ggtt->tile, bo->ggtt_node.base.size == bo->size);
 
-	xe_ggtt_remove_node(ggtt, &bo->ggtt_node,
+	xe_ggtt_node_remove(ggtt, &bo->ggtt_node,
 			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 30a521f7b075..5147930357de 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -16,12 +16,12 @@ int xe_ggtt_init(struct xe_ggtt *ggtt);
 int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct xe_ggtt_node *node);
 void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
 
-int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-				u32 size, u32 align);
-int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt,
-				       struct xe_ggtt_node *node,
-				       u32 size, u32 align, u32 mm_flags);
-void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+			u32 size, u32 align);
+int xe_ggtt_node_insert_locked(struct xe_ggtt *ggtt,
+			       struct xe_ggtt_node *node,
+			       u32 size, u32 align, u32 mm_flags);
+void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 			 bool invalidate);
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index dcae08e046fc..5e20b0114c66 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -382,7 +382,7 @@ static void pf_release_ggtt(struct xe_tile *tile, struct xe_ggtt_node *node)
 		 * is redundant, as PTE will be implicitly re-assigned to PF by
 		 * the xe_ggtt_clear() called by below xe_ggtt_remove_node().
 		 */
-		xe_ggtt_remove_node(ggtt, node, false);
+		xe_ggtt_node_remove(ggtt, node, false);
 	}
 }
 
@@ -418,7 +418,7 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 	if (!size)
 		return 0;
 
-	err = xe_ggtt_insert_special_node(ggtt, node, size, alignment);
+	err = xe_ggtt_node_insert(ggtt, node, size, alignment);
 	if (unlikely(err))
 		return err;
 
-- 
2.45.1

