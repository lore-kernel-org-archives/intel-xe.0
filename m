Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636D8C3DA4D
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 17:13:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370D110EB18;
	Thu, 11 Jul 2024 17:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BlTvfzuJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA9A10EB1E
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 17:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720717982; x=1752253982;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=KCTEFuZOM+taXaUKeU0VDqVA6OZxl9Dd4jVFyZqBRaY=;
 b=BlTvfzuJ0KhJCjeqzkDLgeR9C7skyJl2u6YKUAYmcF21XowSfsWStNNJ
 5ZnHgJ7Lc7GNSw2fe72NE/olhR84a2tHlMuXacBbe5ZwQWkWE8wX6VMfA
 Ss4uA3ndZYgucbEGCs60ic9sXQDlbO/jtrXBSaJj/gZ9uyMSkJojzpByb
 9StMEOo/nHue2FF9YMIkR0XsfNxmqDqXZwh2T729rKTxWuEjs4UFqr+Jq
 xRGJurBPbl0fYVt6zeJV/Rf0aeU0nJlmOM7YShHHq0OVTE7Yzu7Xuk/ep
 CwoFoxxemzeHO5bInD6cquxqPkmWByeC1K+XTIzsMUHpGWxNcYxgp2k6X g==;
X-CSE-ConnectionGUID: bn30bkm0Qb+iGpXwcOphVg==
X-CSE-MsgGUID: fdL9z32JSia+FQLP36hc5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="29518853"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="29518853"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 10:12:34 -0700
X-CSE-ConnectionGUID: Nv9NCdPPQv22Em0/eR0nEA==
X-CSE-MsgGUID: DGDPJvewRqGQI9/cg3/rlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="53821159"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 10:12:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:33 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 10:12:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fKgTzkgGNNoCMgs2xjE+VwXQaglHvMm+VVWoS8yqyUbytWAaL3kwuOfIsK/2kdklDxGJsFvuhrkfepQCG2I4VPdawkMdWdz1VHiO6htQp8JGobWApFvG1Rir7FITWmjDQf+WGn3j23at1NX4k0XFTImkjg6rwEOvrsXha3dMvm/fFSfGFtXsi4RzYzogZIeDRvCD94O50jwUJCqPpA+qQpkPV72zPzzMDSTwgqz4FuxaqJIW86UwfCYSJIZhoieNysBVBQT9GMFO7iqsRRZmIpOe7xELjj8mRB3dwmc75hQqS8+rfC9uTnjHQD0HC0eVTUaJft1VAKyyvktK7uk5Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QRfgUzXZInmXhv0HVYgn68RBwU7FZvUdAk122z3rxc=;
 b=KnHc3egFGcDNnqArM5U5TgKGXey2EDHKFu/HBJwAfiFvKkMkfByYbvQBfAeWtQRy2R6y49SPVjhjiSgqewb67K+qxquFPHlcmp9343/PpxPWtwRFgQP+3yTQVfh1qFmKVl6zvae2P1u0XGXrmzrw3KskI3t2ytxqqNauM9TwBwjr2MmJO8VqTT8fbsPhtfPnloXF2SfyeWnhT9FexSAvYHmLhhrVqyQ60xV3XQyo/BvOsry1FDd6+b9v9hLHY5y+rxiVJLP4AWDl8pukMV9kB2bNBqCfpYrHfw2lE7MTw9XzuYIVdJtLzLsllo820MuipoYh6Zzr30H/fHLnmYSXbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 CY8PR11MB7107.namprd11.prod.outlook.com (2603:10b6:930:51::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.33; Thu, 11 Jul 2024 17:12:24 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 17:12:24 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 06/12] drm/xe: Rename xe_ggtt_node related functions
Date: Thu, 11 Jul 2024 13:11:49 -0400
Message-ID: <20240711171155.173717-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711171155.173717-1-rodrigo.vivi@intel.com>
References: <20240711171155.173717-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0106.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::21) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|CY8PR11MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: a7eadc20-9d77-412a-6a21-08dca1cca23e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sTX/Ka/zd8BW0lCC9gLnIoGXeQSksvdI/Nj01WC+xdzF5WjnGrGEu9qk3cMq?=
 =?us-ascii?Q?3SepAgmRZ0fg5nEFHlykfGOoLH2hXJcNxUptyrJubKeDKOxmSuU6kW05atnO?=
 =?us-ascii?Q?4KN9aDK+7kRwVXzxYwTU2eMJRgIwUGLTEMjtmrAtMUkET280mQpd5eGmuknz?=
 =?us-ascii?Q?yMScQREqshYGacGDIItwo4c2seaNNnMIsJtmGg0Kof4lmxYi67AWKq80Q2yL?=
 =?us-ascii?Q?pjRhJYcKuLv+JMM7Fg4RktYRZlcW3azxh0ERRBGfRWpYJtdUUp4UewwGI8+7?=
 =?us-ascii?Q?kiNG6Riyxu/9YOXouwnLjmVpN59yl7Xwgb1bIEQdyjzUdiLOqgVgu34Fngc1?=
 =?us-ascii?Q?Xg1Kq6lh787imo4Ybw5oYyGgJehr0zQNJ/lJY2Xjl6m1/6ZXIh4xBiFx3hUS?=
 =?us-ascii?Q?dtCyrmQTPl9SpKac3JddiTqs5BUzXDfiKtoy6UspdCoaL74u159RMyHSyrsw?=
 =?us-ascii?Q?oQkSYyBAehOpWqiLcYeYEG1Xkq8YrUtIfkWUggVDRWfhVIQPWA22/wa+w1fr?=
 =?us-ascii?Q?KwH7d3ju7H6nfmO28vCpykiS3d+oAc/86G8w2q0z4aGJ4gNzmUuvtWmrSadh?=
 =?us-ascii?Q?W8PyRejgXf7d6UpoHoC7GNPj9lhvneqXA7h3lLnNmjBBCU8+2JKB8EE5MBRp?=
 =?us-ascii?Q?2ZqZCPqaHYXVNxwlNBeINI1hWkrY3fV3Qv5bslHzgSPmRJMQp9vfVd4H1buT?=
 =?us-ascii?Q?x+0enUsiuSGnrkaAerS2YuI59Aw4rYVcVggPTz8Qjwh1Wts6VoOTnJahfAYL?=
 =?us-ascii?Q?iqnbG8oh5zLnvmXr8+Z4dgmtdNYzdd9IeEJ4XIWUAWDkBlqCq7z2vp/a4cqN?=
 =?us-ascii?Q?Zh+4gqAG1KZC79ztEGRZl2Bj1nOpxKSUlXnvbIO6OeBzpG8oknfSWXgvoReM?=
 =?us-ascii?Q?KVM+UI4h5HbC/7u+hlKmzHIxmZ4ET57PPrRzwpJ6bwEF+7F8ViHS+0dgbdaD?=
 =?us-ascii?Q?IsLttCpQ5C7+hnsKwTmEYVoxISc0ddZ8s4jzRmmSr03vDNgbk2NRVjskzFJb?=
 =?us-ascii?Q?/tfZO1j7zSi87jdHd/YWDJVkep4731EVzXi4P9xxYr2IVhM0fXz1iMPcTYjb?=
 =?us-ascii?Q?ZHvHS5aIHw95iG/bC25EdPULKjDaH07cV87Bww8QNDTx7UpWu1afR3XpxyBw?=
 =?us-ascii?Q?y6BbvdDrHryVnrUdJ5Lg0isYD4fu2JLeRNVcsRSwyJUJk4ltlR+sNLLtW475?=
 =?us-ascii?Q?jrExWZ8MSPbhqXXJxYWUlgdsk8R5kSF2caGtwNGD2yIPWrs2PCDF2ejXjmG6?=
 =?us-ascii?Q?a2yI0wvLXHbis4uDpYq90YHIGj7uAyY/Mr0iFPWi2j0s0CYFJwzCSrWCrVIo?=
 =?us-ascii?Q?8SI2EcD81Nz1ECP/ju4+XgMXBVZv8iIE/VNqjFJVLztmsw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rCwNTQMCT/nCccDSRZeW9i+cflE7DIdIJRdhGyJN5qfruGoz1G3JYZ1DQP51?=
 =?us-ascii?Q?40D2aEIcCXQcpw0/7+dTKKkaeaiGoBDfF2E3IPRS81hyqaxUwmMt4igLaYVv?=
 =?us-ascii?Q?Q24ymd5TrRg9Ev3Da+r7zk+ta9Vy4vm7yqZu56QvGRiuktdaNmf5min+1Weu?=
 =?us-ascii?Q?G/wQlbslQbEPTlSQrwls9nW5L7hwlffSFQObvd3PSMYFji5GYouTTZ7eq+CC?=
 =?us-ascii?Q?ivzDKOHHinoSXgcMlFEKi9D6/UPgbT0kwUNRjJkiEFZlIWi5ts2B4wo46yDm?=
 =?us-ascii?Q?6iQ8Q4oSoloeUoVOXuAwx+rHWOdXs70rLBe2jNCZ/KNaTxRmMR4YTj/kQfNY?=
 =?us-ascii?Q?cQRsmRVjIYHZ9Iv8ETyzJEPsa6XfxGnDdpA7Zmp40lDcIMdw7aDYnVSPEAbr?=
 =?us-ascii?Q?qp/N3btwVOkx05TVHvZX9DJ2B7Eqplkx+DIrenkFlfdTRRobMrDYV51NF4ZU?=
 =?us-ascii?Q?7Du2KA0m5zqO9K7rx/miJvYFhuTxcKadCBsu7q7UFU6Ubn96z4Vj0b4SOU+P?=
 =?us-ascii?Q?0HgHisF9UFteWsxnFl8f6MGg76peR9NIUkbeQNuvN9zZI2qPChC8nktN/c7H?=
 =?us-ascii?Q?ykI0L5dDxIi74Ccs1zMDkSArsNSISBvl91GJLOXKRmirVd9S1rux3ZKooEBq?=
 =?us-ascii?Q?4UeUmJfPpURZI9pXJu97XvGCYormPlLMGmDaxnnk/wK1Y5mtTXdoChY964AA?=
 =?us-ascii?Q?EL06WPTx2YdPH4cSKJW8jn4z7vN2twKidDrL78EdHjv2vIL6j2BnusZenKzF?=
 =?us-ascii?Q?NnL2hgXU8SDGBGG9+iXECm6Ji3EN+GGVZ/SUCMw/9AtJyylnowXA9m/hslPU?=
 =?us-ascii?Q?lZK+OxFFDonA7xTCuiA3lm3ERiqFKjMLo0uSySaEGtCsGeuum2q9VC9la7Ds?=
 =?us-ascii?Q?44tD/gBNSKvYuEXaX5leQE7hN5ZZSlU148q0oCvwTfG8mMIUN7vdc1hhwjUn?=
 =?us-ascii?Q?v0U/2NLQmCQ6ToB2W+zYPge2qwF55vWQheHU13MN7HunR4jQBuSOMySPdZWp?=
 =?us-ascii?Q?x4f0OYj7yxYGHB1JA0ntwMFyfwYrrNzXG2H9qriqrl9O8MyizS2EriLxlNZJ?=
 =?us-ascii?Q?EpY/vj+p4XOBw0Y7qYrMNfEXafL48LFPjlO/Bx275OHbmQGwhIXtpRVFW0ap?=
 =?us-ascii?Q?G8R69HnCZoY34rD7PCh0QdmyVg08zN5QgKvixNPoBZQuprCd2puF+qCAiYOc?=
 =?us-ascii?Q?jbvCQqgEXdwMktFn1FYUpkqG94cnt4+ljUdsmbeLOUogp1K3t7lIYbmhjILD?=
 =?us-ascii?Q?H4ULQlUmMYFLXMxmBZwMCbo1v/D8/kIG+V3Tyr3Ner6CR3V5QdLqu/WVSWTA?=
 =?us-ascii?Q?5iMdqxQE641AYcneSSD63kxmk8pHOB++0/itG4TPjudRU31dfSk4PYWdupmy?=
 =?us-ascii?Q?ToVuvc3Qwuhp1BO0HxSTzH5MNfXMwBbXJPk9PUwJEvU+ZnMTjdlaYDzfcXAK?=
 =?us-ascii?Q?MYszAQqFQ1zoGAbr6U+ThLvl/kLMHflRzd31oG28419ndqAMZdiiRbXo/tGv?=
 =?us-ascii?Q?HFeiXcg/PzQYTsXEYqhmnOAKSjxjGE43mbfDd2L0C5XxGivP1VYYWaUiHfWM?=
 =?us-ascii?Q?VtseUl5NvAUf1iDIT/yWGTKap5DzRKIP0l+VwX7QMp/gv1VtR+s9z/AryzGn?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7eadc20-9d77-412a-6a21-08dca1cca23e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 17:12:24.8645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7s2tDWuVs8jc3n1ExJJwson7L3L/Vi92JolDkaAHTdkDWcPtue1TsSraOH2C/tZoVdFfUHbyGV2ZCGP0xgrkXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7107
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
index ea55c7eabee4..3ab29588a068 100644
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
index 3600468da013..dfa71bcd0f56 100644
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
2.45.2

