Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989DCC25B74
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 21:04:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5E310E5AD;
	Thu,  9 May 2024 21:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c7mhwanD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F42E10E5AD
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 21:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715288658; x=1746824658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3iKxCrxmYld2CkqbioqSe6chkkJePyZlqfp7hqdBwvM=;
 b=c7mhwanDRA7KQ71A81tFTznVrL7V8wSDT945zPDYQEVZkzALd9dfUSrV
 7t5xOmdqsAtcqYFitKPBh8dJTUSwOiVF6eIqsUmR53UrS5pzrEqFNkJGo
 izXyBRbbLlhFuFmGxWfGkIbMjZHjfRtMCrN2tPRZ2yOmKt/1mIF5RF9Uy
 iW+c5R3mthV3UJyx50A8y4IILxknQUJQLJKkv0WiexUXE2ypUlTVl71Rb
 uIoH2Bx1Y0WkJ30t9FbAdpndMwvM3EbeXGHjOcl5ngydyLfIBczPazjrm
 mlJygBI3HzCaGCx7VbZsMR8zFdNJTPXHLTxh1x0l5Z3J7lCW/Og3cYlv0 A==;
X-CSE-ConnectionGUID: eokvB8nYTP2NfWK8rg+XOw==
X-CSE-MsgGUID: crCCGlo7SxG+mfEmZF4ltQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11082963"
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; d="scan'208";a="11082963"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 14:04:12 -0700
X-CSE-ConnectionGUID: WRF01pLeRz+EsRINx/MWRA==
X-CSE-MsgGUID: 02VNOqefQpqVJQK1/YCZ+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; d="scan'208";a="29477639"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 14:04:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 14:04:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 14:04:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 14:04:10 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 14:04:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jtnkcm0lFzd6gD3VxUOyIdpwGecr7AEFEbXHrQdQs7NMgsKppQPUROt6oHqbIgrU9Z8t2agZsU0KDT00NDgJu7OL/FL0Ur2yClgbQjmTNFRvfmkNKwgSdUG6eqLEPTl1FKJM9svcJgOTJExvIzJO5wDKdZ/hEWfuQyeLeU/zyfNtmyHii2oNWDkGT8mpsfUsckyWvh89yiKSGTDlPPyoUX47yCC0ufhV7As+UbswXKGQMMJXHcN4rQbEgZ+z6OaP0VlXeNhyyWLsXmGVr3ViWXrdxc7EHmyvobDM9AIhQ+Oyace0U0cRRTH7CRPaPOYe95Nl73LGPvF32tGAjsbtYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwNE6moSzYFYS7WWCnTyVTmASdCPIhHKI6tif0R9KA8=;
 b=DjF/2T8jiu/+bFT0PL+uupXzGJ/pkC00Nv30ddDbyyXP/PwkOQeuWmViyykgUIT7s/LKNLDNdbKve/AEcNQwYLuJuM3RlbyRizyNL9AmdZm4AVP8kTznojh1yEC+gyztNYdzdz5nfm2IJ0HyU65YozdwaA1Ln+ut6d2NMoCLQIW1mq9JHlCG3Nf/hd6p/MZ9pNBUJ4a8AuuBQwGgP+e/ZZTfBRz4YAiQupyjsKiOKCo66l504ljtabbMsbp49bG7Ie5DF/5IIPo/XTjq8HGD3HzQeGjyJ4/iMLTupXK7BdwEzwdkANWyQiHkcCcMPShHwzUjZFem538M3BO67CB4og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB8141.namprd11.prod.outlook.com (2603:10b6:610:18a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Thu, 9 May
 2024 21:04:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.047; Thu, 9 May 2024
 21:04:09 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>
Subject: [PATCH 2/4] tests/intel/xe_pm: Also disable display for mmap_system
 test
Date: Thu, 9 May 2024 17:03:59 -0400
Message-ID: <20240509210401.519062-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509210401.519062-1-rodrigo.vivi@intel.com>
References: <20240509210401.519062-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a03:505::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB8141:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f171248-db83-480a-b7ae-08dc706b91d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WIYngiOZ+XmrwuJP2XhrQeZg7+1UhR+xeVsbzY3HKZGBOmTjp9Ozi0vYAEk0?=
 =?us-ascii?Q?1q1EsRsIfVFQyVD3Q/+YJmLCP85J5MsV53GYCE06vturq0Y52pFdmf7jQ+GQ?=
 =?us-ascii?Q?+k5RZxTbNe/+IBevsrR3UG6KszAVTo1dyH+61+HNDkNB52Gv7iUbmqt4wV6f?=
 =?us-ascii?Q?OsHgtxmzQ5mW+O26xPKZssYSYZrbrwgjyKnapg+9z5BDTMP2SuVIY4tuk8ta?=
 =?us-ascii?Q?R5U4TpHG4/fR0hMDiNHVLeszxenQINFs4Gb/k9v9JHe05ozPp14Zby7zPIa1?=
 =?us-ascii?Q?7mfpdiAJzrQzx2LcFRePCOKL0jdyQVxqWYtz4SF7qVw/5ulGU+XSWw6b0OIW?=
 =?us-ascii?Q?AQYMwcVE+cdJdzhMj3xcgXmFZFMxupIEDqDVi89fZCeQJx30ZZ/tsH068dUu?=
 =?us-ascii?Q?Us9SsrkLPAqGW8n01R6TU650C1mQK0M2YRbmGJbxLecEh3bdix32ScydSMZk?=
 =?us-ascii?Q?wiF8UxzDdqi5vPxmed64n1YM5hUUlu5UwHTeKl+MKg9lMujzzS0P/S7HTZMk?=
 =?us-ascii?Q?EAxuWTI5sJLwof9+2pZj2/ZSKMgTo7n6dpJTU8AtkFKZ5k3qBQhxVizvksyf?=
 =?us-ascii?Q?Sppx5J9j6WiacTyfL2kyZsL9/7Nbi4+yTrQDy/cfphfpazUFS+XN0JtjWZvg?=
 =?us-ascii?Q?v8DRrs85OZHHHYwlqSCnLYnQkRjKRxm+g/mdPXfrYryCOc/0yW19Tdu52U4z?=
 =?us-ascii?Q?5TbDPJ1JdkIAvGUCMb5uM3XzGF7rEdMWpgos6muifo71t2cmkRy9xthwXoKm?=
 =?us-ascii?Q?ZJ+s6Nm4F3OB4hK1LUkJQ7bC5JdXo1PhnYYluP9HtlSCH7lqSVocbiL4AsPm?=
 =?us-ascii?Q?dZJQD2m2DRT12jyII9AvmTgnYFuC+2u6JfApZVQ2IMXiIk/t2OquVZzahTyq?=
 =?us-ascii?Q?WQ/vZCO4GUhF2hk/Uto0xwQ52We1vhvyEkz2SmOlsQz2xkbr7WVP6+i0wB7A?=
 =?us-ascii?Q?SUpmcHUpc8IceKo0QPY/9/zEibEo+6nP0ZDcp+S7I8J43tkdwt1MgrMFPVJc?=
 =?us-ascii?Q?JrrzyxESHGkvHjKCP0Piba7i/IZDuxzrlp+BbUM04ibOSX16zMomxp+HQUjk?=
 =?us-ascii?Q?1qm3Ulgtiu3/Dq074jycwdUpolvjF6JhtScLTONGtpFkYpHgQgC8BtGtFR9q?=
 =?us-ascii?Q?bSsj/KEI88TIkPs0BN5ZemU6kxYKWPTWioVg3LJkIhLugiXanVq6g0fzuf4r?=
 =?us-ascii?Q?8UYezCvgS1TXrJ1AxDHXc/tYLmsdtTtTgD9++s31/QjkORqgawZ9F+jOH1Vk?=
 =?us-ascii?Q?hO3I1ojJIb1rz47ckPLSNE5IBVWy23rX3/u3Q8wUFQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TkzAzlscb+2hLKKaSMARzkBxUq0ugYoJLDFBSnLPxBe4+NjGo6VNrLvs2Ts6?=
 =?us-ascii?Q?aNCyItJfsX1oh5ZA4DvDB1d4uzWpeTXGWpdzDL/XzC8Emqgd10ndf23IvNmm?=
 =?us-ascii?Q?QprI4hZcdC8LZk7S+alqefHSEP2FNrEaZIK2jtChLujSAvArDbnhicS/2yOx?=
 =?us-ascii?Q?mPBvGEylEeoaaNhbdC+bwkbryf7mgVZlg6H/90WDpLzmj/IKickiDbCEXR3F?=
 =?us-ascii?Q?2G9wg0oCJsnoU+/EOsOQ8TbS4eNT6SHTiC28bE5hc1px3Ch832Hsymc1+cef?=
 =?us-ascii?Q?zT4KwFoBoSFz/3S7WrQybPF2m7+v0VMtoEejEJ3ZHxl0zn0H+8RkX/Sgve+I?=
 =?us-ascii?Q?tySRAcq2/C1/8hb0k7mC7LoVrbaDFzQjm3xLEl3cZGvHjnscK7dx/i3FA1ok?=
 =?us-ascii?Q?Cpue2f0/d9tdn6M6tm0XqLf8NvnoHHa07gqpFw9rM30KxANz4y+Bmzn4VwWD?=
 =?us-ascii?Q?8MzqNGrylCDaAntracoQa3DSHjU/+x4dgemPD4NARJppjCbhzTd7V8OkZAWN?=
 =?us-ascii?Q?AoIwvj9sKby1S7jYfNMpsVO8DAeOVdRa1Q0PqllEbjh5Ps4q2k2mXk0Xyy35?=
 =?us-ascii?Q?ErQcs+m8L7Fh+6IW0AgnGE1//sues/Nqb0SB8aoa7hj9m2tylN+59NBOeSYA?=
 =?us-ascii?Q?gpoV4NQw8URxXvqLAZydaKA3mvtLhPATTR5F33ZgjY+vRkyCaY4/kHyL3YmJ?=
 =?us-ascii?Q?ykaYY9Emerk3Y57YjS2JfmIeRKRqAQiJVOKPDlHSD+iIAMFv6djbrW1S30rc?=
 =?us-ascii?Q?qi3lPkw8xScXcPoiqP4xxCJQxenpJhavYTkCFx4IqE/6+Dx1eY5b9qYkW5eC?=
 =?us-ascii?Q?44Qnli8tmNw2oc6tY/oux0kQZagVEC4ciDLLE2V+bYdq6mnyET7xXGRSMOoQ?=
 =?us-ascii?Q?4hjzFh9y+ZwmOXg/uULWoPE7rbIBRpviShbEmBrlcZs9gvX4aS+3ox9tEjkL?=
 =?us-ascii?Q?jNvDQafTwyxRFEL2dUZRiZJ7SK8XH2O6RDh+inAAjgxSC3iK3rmP/+BbKIXR?=
 =?us-ascii?Q?n1jO25MRGmk556OK4EdZryKxr2iF/BRCydtfKzII/PkRCsNw95wZLRksShIk?=
 =?us-ascii?Q?uTxbF225ea1rmebokViYkNB05ucJ2iB1ATnUI5SvQ+ctDKE4gSJw5r4BZjLN?=
 =?us-ascii?Q?Bdvt6qccGbl53+NJSOMzo+DexZYixmfUU9mVdD7gJHkkLQ5ZmeojCumDmwvQ?=
 =?us-ascii?Q?eizEvOQ1N/P7Uv2ljvpzEMO/boXTRxq4ehJBGsID38IwGb2TX6wpeIPHNKAr?=
 =?us-ascii?Q?8n/G2Fy3k+pq+2YGOWITbkney/mbeBdFkO4AwoVDL5Da2GurfGjklIFqPqv2?=
 =?us-ascii?Q?c0M0Y1i1nqOLbdc+dnaDH/eE1GRjYnC5FglBiaQsDL2Wh4Ad+G/k67pDVA0L?=
 =?us-ascii?Q?SeuEVRSDt6gOHBhkYpELNeCfkbk3TU9Cn0Bd5LBM9HvsJoU+tCwbsqbeWCOb?=
 =?us-ascii?Q?wT1txtrF03Vo5+1Wc3CSUbPv5gXH+AFgzkiGODm3WUUDX+pvdzZh5fnsoSMC?=
 =?us-ascii?Q?xqekR/O4dvwW/F3j0H4m1Z1/HtVr3jb9iTTVXvBdKr3fz7Jd58wimoltJH3i?=
 =?us-ascii?Q?UYQ6Jke6O/entglHlxZxtGaK5bga2DNn6qCCcFsg+Q7IHzHPJ03zersQRfce?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f171248-db83-480a-b7ae-08dc706b91d2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 21:04:09.1100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SIdeYPuQMOEAQIVYTmxePM7UXFNeK4bi5KseKKuj9z1ZnXoF3Z+Zl3ZnlGOgfNTYoSt9tyAzwwsgKJ856i0Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8141
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

If display is enabled, the always-on components will always
keeps runtime pm references, unless you put DPMS_OFF.

Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 3f963bd9b..72d484163 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -780,7 +780,9 @@ igt_main
 		igt_describe("Validate mmap memory mappings with system region,"
 			     "when device along with parent bridge in d3");
 		igt_subtest("d3-mmap-system") {
+			dpms_on_off(device, DRM_MODE_DPMS_OFF);
 			test_mmap(device, system_memory(device.fd_xe), 0);
+			dpms_on_off(device, DRM_MODE_DPMS_ON);
 		}
 
 		igt_describe("Validate mmap memory mappings with vram region,"
-- 
2.44.0

