Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7D7C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 20:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4A710E2D0;
	Tue, 20 Aug 2024 20:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HvMtKyDv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A0010E2D0
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 20:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724185560; x=1755721560;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Qw1MIFZmWoDjikNpo3KUjAdOq2Q9mJbzfmw2/m1JkpI=;
 b=HvMtKyDv7rCml9tsU80mNg74zhVD0+An3eIVwh4A8Lvs36dQLd+jG2dU
 xcX1azQey6WNQFGtG7Z0DGaEcm8yJoznhc9FA+aGGdMt+PRajmNWmtOGK
 3PMTFJfqBz24P1j6HGmA8lFeB+Ab0SRoVbGvT4N3fVZzw03tpNY+Asm8o
 BOTU5VJ84ZmHyy7VM0wZvjbrKhuBQM/WW87GLbypclVgW/l5l0vdlvU1+
 56o3dXOMnvbMZSJj6OJG1gnluJOi83SkrfhZ1cuXvH6EcUWbBlV9WE+GG
 Gh0aju/sidH76sJ6dWxLvi59NWrukFd6dTrEaFSDjt9/stdETHmQ3bTfa A==;
X-CSE-ConnectionGUID: xIM5YRayQ+yfSV+OXUoIoA==
X-CSE-MsgGUID: Crlue9XVSJuwqYg2yAmugQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22648292"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="22648292"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 13:26:00 -0700
X-CSE-ConnectionGUID: Hu1xQSJkSqC4/WIfwZACog==
X-CSE-MsgGUID: cL6TRjErRw+EAiiZGWY7zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="84039303"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 13:25:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 13:25:58 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 13:25:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 13:25:58 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 13:25:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xcOq1svwG0Jc57m5AhTHlGq5rB9TdoM4qdChkdobJhhNXLAU0Iln7JDmUj5JPVbJ3I1y82u0rUh2m6vMOJtuhAhD0ApKEFhXF7w4oIKx4vbz7MTfb80SZI3/0d8NHt4IdI/zfu3RjED1AxZl9pRCl58w5TkbXJSLN7KseB7aVjgKo8mm+W3IJ8xP8PdDi3KnF3rJoEBnxk0UTIj/i3jm4++lL41RhhvfxCCXuiOvfE8wBiCDNaPGnsCMjfxSqT5V3HjDnP8Rx/Q8ZLjrpA13rkmcou28PFXMD1oaJkYTl7D/vp8IDUqRqKYpBLbeQtS44hFqH26qF1hgpGBZTTflag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9n4zj4tm68dbxIoJLq7qX24KVWzpf68sEZxKyeR4vU=;
 b=ySxlMZRUAuRiinqG91Yauc98noItPxoRX0SqXqTOfizfBnztiqpOk3EkfsR5XUsCG6bQhTcTd06lXFgrjgtIn8WLSAX7EHG983h3t2VIX9ni9aiMu8JljL1+mIohDUNkP7Cnayk+DeHPpW5dnJ1u6DtecvytQ2ARbXSYUm9+fY4PN4BCovMJulNsWcBWSlATI/aVbOvbTo6lz+kEy8Kd9WUfgf6BcaxLytmZ1g1BFeynLwnUNmZyR+rgjIpkAhsNb4HS+vob/Sv2N0zAD/9HSRb+0f9bc/p5QmbC6sWF/+UWV9dwOkvFX+wPanXh0GqDx/QHt6d1SIU0/8CpH6ffhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 20:25:55 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 20:25:55 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 03/12] drm/xe: Remove unnecessary drm_mm.h includes
Date: Tue, 20 Aug 2024 16:25:38 -0400
Message-ID: <20240820202547.300257-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820202547.300257-1-rodrigo.vivi@intel.com>
References: <20240820202547.300257-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0076.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::17) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: babe097f-f83d-440a-958d-08dcc1564ad9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qDYCruEygjRWB/THHa1adhVRPzLXgly9qCMw7XZ6LoWo33bvCZGnyyR5aMjh?=
 =?us-ascii?Q?21gN/f+k9/x779ZB76CVvm1fCoJ1FfDrR04wHHPL+hidkEeRUDB7J3PTfwpK?=
 =?us-ascii?Q?qFBy9ugk68qEmgcba3SV2Jl8bs5/yQb3sPaUiHISNDb3Hk7+kSc0JpA34NsF?=
 =?us-ascii?Q?6Bp3N4LK9hBOgeO/qxcllKG0uYJKSzx0YztGknHb9CUfTI6wXTcYVXZ8Xg5t?=
 =?us-ascii?Q?3/+v/8NGqeHZSfLXs8kAHg53PIcdcEd3COnEhwyv4fP2eLVomujoNqxkqqDc?=
 =?us-ascii?Q?0SZOImKogKBcmlSAmGVakMo3J0fBgHc/rBN3g8WGL2e8zOH0FcS1CM9Qtgwt?=
 =?us-ascii?Q?g9FfvaFtw4TkI2osVfV+pCkHfpGnj52ZATjydB9vQdVJ6Hhd+gWU43kMQOJz?=
 =?us-ascii?Q?2KTZlFbOeg3KTmHF66pBhbnHnS8BLpCkMTqvFlrQuOUBNvdNetK4qOqlVaWx?=
 =?us-ascii?Q?x4NDFCuvy9slVft9sfuspm6Q5htDwkjUAoep1ZMgYmC3Cz7NA1tQC6V/dvCM?=
 =?us-ascii?Q?M6tqc5Ps+32vKY7oEGeN0EuG72gr0/VBTmYn5Uhc6aWSffvxB28l/Vl68oZ7?=
 =?us-ascii?Q?J2iOVehLV+TbmYDLFiuvfKqlOsv0K/JPqdb/tJriLv6YMJ7Zm2LALeZR71rb?=
 =?us-ascii?Q?ZfhxCSYIbpcxbalEGJOFV5G4ysIDEqjsBkQWLZzGYbcl85AAI0xD+8RkwGHK?=
 =?us-ascii?Q?DDFC6nVaq13T7S4epqrkrafbqlpMOQjlIXwQA/pU9iA3ltjhyh15Bgz+9GXQ?=
 =?us-ascii?Q?OHeKG0YMwR8Gzg8rfID00MsDl/044eCg7HTcv82kmA/H/6lS0mLT+zDm46dg?=
 =?us-ascii?Q?JEfvgN5kQOdQOr1wCFwOW5eTG9Sm9dRGouqziqoysCCgVrPqBBP7kfrohQWN?=
 =?us-ascii?Q?7JdCiVZeefFtH4DgRsfWMwuy1g8QhxtMZHb3ZVRewUAJcPLgIjByiBrjFytT?=
 =?us-ascii?Q?qbaP4zNZetrdKyf41oS2uG+XukwKWdeT2/KQx0yFNZ9esGDSAijkL7+AVS2E?=
 =?us-ascii?Q?4MzI3cTGQ9ZjiExnQ59GIoAFayssv4fujYZC2lFCcfzaKLYxx84j5PIQ2r8j?=
 =?us-ascii?Q?qDWske/ICt+fV2/r1S5p1151SBMZupr64acqlYqa6aYjgPejceIz6BxaIcm3?=
 =?us-ascii?Q?byhju9YjkOsvomMI6YpsB/GpzkfmWKRB/ghBQFO9ld9ytgFAVXsSiGZT/vUQ?=
 =?us-ascii?Q?VB7xTrWZZZ248cJ5T9WBL3RAzDlTxjH50BPxeiyb5uWlMJ1blHGzt1jlAzDs?=
 =?us-ascii?Q?a8UkQ1oDMK+uzYgcXe9d8aKjeSwCYCsVtniO++/fLh6zCU44mLOQCphOJ4Yz?=
 =?us-ascii?Q?HreaI0WghN5i57PoXBbUxTUdB7b5Vw4FWzLDPt9y6a/81A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IZhtvc1ZOrpQauhvlqsZNIlU3ZJojUsBw4d99XIEDFn/4ZLJIjthPbcvQdPJ?=
 =?us-ascii?Q?5MxgfAD9Hp9EcoUlTZGSo7oPWROAD5fyuW3+IXOIygAIr8TwMTWBa2T7Gvx1?=
 =?us-ascii?Q?5PMnJv9/ANN5/GpxLjejE7SGVHt9aIB2+sJvX51RYZhFADtaEgtSaLifA2Kw?=
 =?us-ascii?Q?4J+axk4JR/gMNbA2AFTM1FyI/caTQcB6YxfZdbaxnmoZFG+DBBpcni3wHH/j?=
 =?us-ascii?Q?WCEbv3NBOUWeXlSxW5HpaWyg46aBl2tZLfc55qNPntxYzcRVZaxRRcvPuiQ0?=
 =?us-ascii?Q?XPMheTFor9mNmV7ZWqluYCnB/PznzcU2fiuBPd2HUYUIGX4zXy3VOp0P58Yp?=
 =?us-ascii?Q?g+cSJY6vN0NdXmjATG1x6DoC72rLlbm++ng1/alTO0TBJWSyY3xmai+pAB9E?=
 =?us-ascii?Q?NzyUktt3JGjD31nVgrWMUHhDKmZpAitM7p+irLyggSFof12LHuxvvezgt6i7?=
 =?us-ascii?Q?D4LC59mRGJYm6Se8f78uW5rgJugXrSgzpj4KtDRDHPdHoCrdDk97GaSdisQn?=
 =?us-ascii?Q?4L4TGEHMTB0B1tEZglhQDEgsHND9Gsxic5NqEKJQ4QCnbm3utPXHHn/2ImsR?=
 =?us-ascii?Q?CkE6++ZjZ2NH3mH4Rp1Gwrj5PIv+2IRiUpdU58C795vvpj2gpJiaswTcbOOR?=
 =?us-ascii?Q?IN9p2d+XUkyubeegOm50kHxrsld0beEegxUoTSTGGDqDahEMDa7lr3AQHSpo?=
 =?us-ascii?Q?yzKm1RE5Jp/xBRM4/CnT5emGcDLjbz9lAjl2uUetygzSVB8q81LCwfxexxqH?=
 =?us-ascii?Q?ZRqc7mq7DAmU/SL4yzB4HfB4fP74zXVOi2eAFg6iRoReWjvRbK9D158TlR8D?=
 =?us-ascii?Q?0FF0W+2ouPqVOatF3Lk0Ws1lMXR9t3ASOjH2likwwdKeewUtbo9bZVOFcgsH?=
 =?us-ascii?Q?4X9IU+i0R2/8ZVW0aMOOZzQzLe460AB09UolY2IrmknxbmZj1+OEayCcgq9K?=
 =?us-ascii?Q?uMq+3IWj5na5WGabhc8+Sd14YoRtaUZUtBF4caFAvVdjkFu6ow0T1I9nPnYv?=
 =?us-ascii?Q?QvgZrLK0YsLkPYjr7FUVDoX8ghcq60+YJE7chKXVg27RQvN2sBdoXHBRHOkS?=
 =?us-ascii?Q?N1KQgSv2ZioJl5Bc92sdpmclway7NkYsJ0csOzfySqJKzaB/0twzu3e+ZbMg?=
 =?us-ascii?Q?3K+PsaCj/wpH9CLFLvB+8TSdK9UsQ6x0kYF7BaE6E7myOTtzReCdAAm6Tivn?=
 =?us-ascii?Q?nK3BcSuHMfkpx/phhwCd90XfbyqSNXxIbPMSTDA4yENntQKyCsTqXvZk7xI0?=
 =?us-ascii?Q?rvhn0SrUUE8DatJGPqT80PzQG06BHiSnmdNI4rYIUKrjvdW1OT0WJv6MzFfM?=
 =?us-ascii?Q?oMSmDGsXRE8XjdC3IrifKEvse8q0yPzO5VSTKijXjUTwzztnLAXtUMqq/IRc?=
 =?us-ascii?Q?Altx3mS6v37YnIeMpWa7UYmnm359YYwzM3J58JJ3pFJx7zABNFgc1PB9zyWV?=
 =?us-ascii?Q?LFU/IPq5rqRFSNJOlYLJTq5YxvKaAJUbB3JjTfa2uJ15oUStSs+OJ8gzXfKE?=
 =?us-ascii?Q?g+zQgMSS0eYhEVHW2w0YW31IRRMO7I9Lk05h2U5qNS4IRtulI6BCNJiIWSvN?=
 =?us-ascii?Q?/7kJmGyuFJGmmpA8efUSxlv390cN7ZmKvKIUVfE5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: babe097f-f83d-440a-958d-08dcc1564ad9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 20:25:54.9332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1v5UOYqFpdxUH5fdDr1frvyt0JekYPW8jtSoXPtQRnuSdFvrKoWBUUJ26UHewB8cmsjLA5xQz/LoQ/TJR46tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6029
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

These includes are no longer necessary, and where appropriate
are replaced by the linux/types.h one.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.h        | 2 +-
 drivers/gpu/drm/xe/xe_res_cursor.h     | 1 -
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 7929cc2425e8..0109866e398a 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -6,7 +6,7 @@
 #ifndef _XE_MIGRATE_
 #define _XE_MIGRATE_
 
-#include <drm/drm_mm.h>
+#include <linux/types.h>
 
 struct dma_fence;
 struct iosys_map;
diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index 655af89b31a9..dca374b6521c 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -26,7 +26,6 @@
 
 #include <linux/scatterlist.h>
 
-#include <drm/drm_mm.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_range_manager.h>
 #include <drm/ttm/ttm_resource.h>
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index f46fd2df84de..f7113cf6109d 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -5,7 +5,6 @@
  */
 
 #include <drm/drm_managed.h>
-#include <drm/drm_mm.h>
 
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
-- 
2.46.0

