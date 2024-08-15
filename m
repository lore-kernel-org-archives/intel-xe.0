Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53D5C531DF
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 22:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F2F10E47F;
	Thu, 15 Aug 2024 22:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SNlwjE7E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4464A10E479
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 22:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723759681; x=1755295681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=0f0xGgvGDN9FAaRK0TC8lszxrTmyQz3IkOk2ZoslOEg=;
 b=SNlwjE7EBwa7rvysXmdTegu3Ife4PsXmsXbZr9kxyBatZKiF8OupgQGH
 YFg0SR4mTrHYRl2GeS/Q5+3/HxdeFecHAmflqZk2xmwPRlHJ9YN1+CHlW
 74BkkI9qybnUovxEd1V3vsCm9/jpmXcq5uyEiiqcRyWeWvIi1dSgOaC5P
 T1O5DsO+5XlhmiTtbmaMr9TxURwCDUs79WQCoEFZ6EWcNMz2X5Ax0qmA+
 FQt+ABJtasaLPQWF4Jk8th/U2JtfowNnsIR4FeK11V4PSVcmDRl6uIAQD
 UCW1eXVZvmEOmUHCP5FY4C3GlwghNd2P+cPfrs4h178HkF6QiWJQNMFlV A==;
X-CSE-ConnectionGUID: nkLS6SlbSIWpx67Co72Z3w==
X-CSE-MsgGUID: xXz3kHhYTGSgr0wuPG10qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="33455512"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="33455512"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 15:07:59 -0700
X-CSE-ConnectionGUID: 5za7Sw95TKWbdq7MHAVYFw==
X-CSE-MsgGUID: 5pg00QkPSVWHjWD5hoSUzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="64375311"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 15:07:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 15:07:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 15:07:57 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 15:07:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VM+13NWmcCVkqdD3O89x1V/WytII7cCD7B/qmj2oixXYpZ3EUfiJTY8A40ifBYLXEGDONgLRdYjpk904v+sqYi9KivBOPcNg4r2+Px3dDo8YJDHcDd9PrKje1eoG70Bgw+mezxC+rlsCM1nCvXM0FBHUTtVyaMduoZmb96OYTpawMWf2/SgBPfYczSLK/Vp/KNKaImr8+ig8lXc8kd/Su/mBBvq8rfuhiPjRSWu61hQp23LhEFmAW6ely+4PteWmN2Cw8H8m98DxLFMDjtbfFK5yUCm6oDPt8/O/9ib80dO88C/6WK5UNLsKxxaimN3q7pUvvTe4QeIh97F7gQsFbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxeDTExAiMFb0rUpW4mGKkpKdrbnR5DEJdeAX76um8I=;
 b=CjS7MJn6xVxfvB7SXucl2APQQy1QUb9VsSIzOg8f86r9+ZBZ++Psz0gQ+haHqJVk13x6YWuOONtopzWu+ZQ3XfQRtj133+bphhzgI+whcwwcY5KDwFE2aos6FjxsBx/7tgJ7j9tfMC4aHrM+hmR2tGOUxusbsVUL1BXkqbROY4KewW+7RVNOcqSennMsictK8Shy3yAqdvopp271L8GdvwHzXYeukCjb2eG4WEf44rDa6i7U4AB6mV85rm4S1ErT0RPleSnRnDztSbt/EqJKeKktQxKrI0+/ptpJJ/4GvQPEODsXyrD1jQD5wIGIlaaxxVms33spYTT+Y3zr8nJing==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CY8PR11MB7133.namprd11.prod.outlook.com (2603:10b6:930:63::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 15 Aug
 2024 22:07:52 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Thu, 15 Aug 2024
 22:07:52 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 06/12] drm/xe: Rename xe_ggtt_node related functions
Date: Thu, 15 Aug 2024 18:07:26 -0400
Message-ID: <20240815220732.49675-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240815220732.49675-1-rodrigo.vivi@intel.com>
References: <20240815220732.49675-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0039.namprd07.prod.outlook.com
 (2603:10b6:a03:60::16) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CY8PR11MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a1385de-5372-464c-7ffe-08dcbd76b426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4KPQv1DW+QgQNfnqBN/xMZCoQSEFzKfSVLovBkM2bqZ1X/rU7dMiP7LKnZNi?=
 =?us-ascii?Q?UUKFlu+pRLYDwvgUvHstZV+z6cqYrMUNeiOcLW/mGMvItzp4Phoo2h53pncG?=
 =?us-ascii?Q?AQWlQVoNO63P1Bs2fcLJLyNkOuA9zb841d+laFMBPe5bO0JVXGIeAfUrGrJ8?=
 =?us-ascii?Q?Na7oBaksp5i7Coj6aXAkbD9PqDr6whbezgRWcDRvs+9hfbcDz5FMUE+VUDgu?=
 =?us-ascii?Q?7++F1new6mQCtnyzTGiipxPKi1MOXtVCqph6/Ldfmzzvrn2s+l9KjVvQs4ek?=
 =?us-ascii?Q?rojEaq7REwZPsHzJ8CoRyiUwxLKhISW7HTaEWOhdQAlxzgKEM9NtYEKWoUf2?=
 =?us-ascii?Q?GRIPwfF1nDPjLMw7YjDwXOimIVkO9dx62utewSWvw7nCjww9hogW3cCiNS/r?=
 =?us-ascii?Q?v65NxhMxNvUHa2cIjPNTI9RKz0Nf27wezaCKL1jDSgRxRQKXUmyfY1stbm2D?=
 =?us-ascii?Q?wZZvlD8sO1x13bB8BBUOjdkmUi12LBnFDGi93G8a+XU3TqWJ02f7Ji/rSVfh?=
 =?us-ascii?Q?wL9FIvvtpC/VwLWvgEofHYWa6C4CsEV8NMoaLXYUWv6S/vj5B8xOGXsGkPad?=
 =?us-ascii?Q?IfknX2y0uDizpqAJcPSjnAWvtxozta0yzl20M4+qYmme6PdcN6RnUKjgcZmc?=
 =?us-ascii?Q?yFcCiGzURF/CwBWcr4b5z+l3bzigySbDGLIoqGZ1PByqTbqdFXaVJTjuQltY?=
 =?us-ascii?Q?RpbhvQ9ou+BUW7wxjCqoPCPYNwYBF3U4yy0kn5jtskXtwnnVUQsz3XjgqtzN?=
 =?us-ascii?Q?gGbffZXT/IftASbks/C0UM1zIJvQtQ0kztJ6oCQ/35K5TaMa3pFKX08EJzIL?=
 =?us-ascii?Q?4eH2MrmzezZ7zcg9pfH3OBgiLxVSk6WPw0Nm5+z40bkxSAP1V2S8pU/Ysbvk?=
 =?us-ascii?Q?bVq9VhfkWoyhThIBUhxF+V8X8Yu8heLw8Z+g33WZhv/IiLcXpd/XVWCBM0hQ?=
 =?us-ascii?Q?rTuleoeoo1KI53W/tcOM8a7Zh5PVwFKJkd+NcKP0s31azpvaOtGSzcyxZQMp?=
 =?us-ascii?Q?w1oyD8fX+H50ncscxWFkO0LwHf+lOMXxyYienoEHcB0Og1HGgbOvR18sADSk?=
 =?us-ascii?Q?UI4uTCjTb0SuicX1KWANsYEkHJNaBOH1UCiREsjmrS+i2te489TMIqVwmMtO?=
 =?us-ascii?Q?9zcEBqO85cklGPUMrg+nKftXGqJ8EQyWUSWqsCxJ7Q1fwV8HrFpqtSZrKngf?=
 =?us-ascii?Q?DQ1EIKgDYCz7FBSRwgIMGdl1VrQMobn52tQBrea6729LDEce+ax32Rf7Ai+h?=
 =?us-ascii?Q?mrCIL4kOM4xiw3BDCstUWaSACzx3EjyRvFUe7i0IsAPie6pcvh/p5NpLox+t?=
 =?us-ascii?Q?4jFaFCsyVpY3bj0Yg/yPNEwPPt706nZ9AfNuqwxei7eSag=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3mcNl1sl45WNxiBnmiRO6GKMrsdANmDEcAi9oOSut8jrNqsiaG3IdgLWLfrn?=
 =?us-ascii?Q?qZ/H1PUroJ6b2Z9lpk81cW7NZhM9fYOvlYCp8nGUKLKU/ygeuuCG9uyAxOob?=
 =?us-ascii?Q?vipOq7M0Py0fuSCO0vBYugY8NGGbRwd+xGC7dJGVnhEgMi4VynVz6KddfZUE?=
 =?us-ascii?Q?fYoRZyl8GKWrI2BfzqOuDADpx8vZi17JnMG8PjGoWWuHh2yZwpJews30mIn1?=
 =?us-ascii?Q?Seriu/vwOW1UU6HJygtDhqoY9TKnXz0NQe8hVr1kPLCaCunG+x6Fv0BSdwYU?=
 =?us-ascii?Q?vRSrACK1eaBUG6tb0/BRpX2xw+6z3KvPZgAu0i/SKAEKFdft0ataYa/zKyqI?=
 =?us-ascii?Q?LsUd/BCVvVzDhQgEApkJyOwM2Fvq2feO3O740SNsoVPdmKTP8egv8Ry8yBpq?=
 =?us-ascii?Q?8cL3kX7o4R+jSDFixLd5cVAuv5LGKa+I+GbIA+REmvvAmERXXRrDSXYJGAXv?=
 =?us-ascii?Q?5a2MT1ps+Ir44RswlJF4JIMkb/HEnIpLRWN/nkbFotVCsiYNa7f0MIxam2Y5?=
 =?us-ascii?Q?vL9JJ9T+0m3KeIXNVBb+3jISpsODM+dg43p/8HZJmNl1WtFSAG2VwejZFL7K?=
 =?us-ascii?Q?PQBBn6tdtijiAXQXROOhZVGMgRBw9zGckfaC2Cavx0siqi+0E1VOe9YetI4q?=
 =?us-ascii?Q?IeShxHhaji+bYj94RqXIHTgAltoesLi7cXTYPm5g/Au7xEUE3uszvZ2k7vs5?=
 =?us-ascii?Q?M+gSJ46gHnE0+971Zdd18/DO+F128FGpaFjzVWeeFoS+a1Pv2vngoYUeQ12Q?=
 =?us-ascii?Q?ipAla25EHRhIyhMk5phi6f/Rg9A41S5hq5uaVtlYqTwyc5IuH5Gg9PH7TZze?=
 =?us-ascii?Q?Cvseun4Kws5TusgyzpOB/G0rcE2jnRUlG4TmkkvHg/mvjD+YUspMT8R0JHYZ?=
 =?us-ascii?Q?f1yUuzfLMKxG4maIMZOT2lXMdW8pPFFyq7pZcOHvZPQjIjFnPCKcINLDSX/i?=
 =?us-ascii?Q?Fj/CJQ81L7n0QEPt7Oqpk7eSH8bAs57lSzr4r2tLc3yx54H/DLEtPDurT4Sk?=
 =?us-ascii?Q?v13MGHbIeQOD/zmoIfYtqDfxp8scgZaVITlKCTuATovG0pLqTUruFLVBWTFk?=
 =?us-ascii?Q?dRg+gOiOnRr5MvIuB8xETSkeW2CSnZvKVWzuMstr8TApp1phkY4wFCsZ44h0?=
 =?us-ascii?Q?TkqMtaUOc5KFY9w+/vWdZYmitKZPrXMoGnRgsMd/LbPeS6pjCqTQXwGo0+OU?=
 =?us-ascii?Q?n8eTGWRMaJ+n6xBu4tjnOtAvAZPjbHKxzPNsQIUwCXIwt3AH7rXdMGgxgUcE?=
 =?us-ascii?Q?et407IirvL6ey6hFgtJEqwhvT3qMcPMzhEFeIUYTpiRdGKWNMuVN3IjtcUWW?=
 =?us-ascii?Q?5uulMIPwz8zY3Hd9L3vmnMSBup/YAsseViOrAR2qdwkmEQQdcGMpyGLiQq4S?=
 =?us-ascii?Q?TXtkvxUyzBJE+4dsQG7effEVQRcXobyu4wy+yKp178nZ1T1H6CFvXkvGCPWO?=
 =?us-ascii?Q?atT8NzYw8YrmIbyNgqj89qtazlgys5g5NIah717G2mcPxT6VAJsRkA004//d?=
 =?us-ascii?Q?1ytLkbkbUhHwXm4c8f/wmHxAFaoHLcarhD24ElMh6fGItqOX1Oa/8GFwvY1l?=
 =?us-ascii?Q?1vseExoYL6Jbnb3spC+DWVM0LsClAAvb49gXA8oG++XyLhwIcwHhE8A2RmaQ?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1385de-5372-464c-7ffe-08dcbd76b426
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 22:07:50.7988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZOnHDx/yKknnIbRxI541CndI4kinpLOgAOuhGKXuIj/rM1gw+rqxhbFztHrMMXexGQO95NAkz0GkD0EV12pDDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7133
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

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c     |  8 +-
 drivers/gpu/drm/xe/xe_ggtt.c               | 86 +++++++++++-----------
 drivers/gpu/drm/xe/xe_ggtt.h               | 12 +--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  4 +-
 4 files changed, 54 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index a93923fb8721..db74c3395ef8 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -209,8 +209,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	} else if (view->type == I915_GTT_VIEW_NORMAL) {
 		u32 x, size = bo->ttm.base.size;
 
-		ret = xe_ggtt_insert_special_node_locked(ggtt, &vma->node, size,
-							 align, 0);
+		ret = xe_ggtt_node_insert_locked(ggtt, &vma->node, size, align, 0);
 		if (ret)
 			goto out_unlock;
 
@@ -227,8 +226,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 		/* display seems to use tiles instead of bytes here, so convert it back.. */
 		u32 size = intel_rotation_info_size(rot_info) * XE_PAGE_SIZE;
 
-		ret = xe_ggtt_insert_special_node_locked(ggtt, &vma->node, size,
-							 align, 0);
+		ret = xe_ggtt_node_insert_locked(ggtt, &vma->node, size, align, 0);
 		if (ret)
 			goto out_unlock;
 
@@ -327,7 +325,7 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 		xe_bo_unpin_map_no_vm(vma->dpt);
 	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node.base) ||
 		 vma->bo->ggtt_node.base.start != vma->node.base.start)
-		xe_ggtt_remove_node(ggtt, &vma->node, false);
+		xe_ggtt_node_remove(ggtt, &vma->node, false);
 
 	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
 	ttm_bo_unpin(&vma->bo->ttm);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 1cf682d15253..e0da24bb5774 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -403,7 +403,7 @@ void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
 }
 
 /**
- * xe_ggtt_insert_special_node_locked - Locked version to insert a &xe_ggtt_node into the GGTT
+ * xe_ggtt_node_insert_locked - Locked version to insert a &xe_ggtt_node into the GGTT
  * @ggtt: the &xe_ggtt where node will be inserted
  * @node: the &xe_ggtt_node to be inserted
  * @size: size of the node
@@ -414,15 +414,15 @@ void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
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
@@ -430,19 +430,53 @@ int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct xe_ggtt_node
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
@@ -522,40 +556,6 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
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
@@ -569,7 +569,7 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
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
index f107ae550c0f..3ca98f8a0eae 100644
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
2.46.0

