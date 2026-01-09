Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC6CD26D6F
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 16:05:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F3810E8FB;
	Fri,  9 Jan 2026 16:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUpi0xV9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A3710E8FB
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 16:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767974733; x=1799510733;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=GiKxFznyxfundn872xHtds0m3OgN7jd8EZkLFMnsZUU=;
 b=dUpi0xV9U0FV8Fw3/7grXrIz7oPq6cw/Ic1sz7mOinhSShR/YM4/VVMB
 s6UX1AYiY7Pz/IoI7bYkxjm9J1U2LrZ0/H2Tha7X8/kGyHax2ZVTe34o7
 lpy4D7Oq9QNNP4Xa4OiyNe2O9I2DEh5D4Rwir4eLfXe1itVjawgDowmA4
 dzdPLy4P48/N31YmuAm/1o5+Tvd5oRFad8/JR89EufvBTwZOrLAHWLKAG
 5P9gEKah+OjhoZ5diKxh4kUYyxuLx5KHR3Agfur0IEsy7oHzDjQj8otBS
 4Z9Cgyh2sjZkbCF8ozIbeBf95gC55aaIZh0rszuX4Tn8Gg0R/wfAOV0oY w==;
X-CSE-ConnectionGUID: bPFDkL5xSwmCSTzc7Knx/w==
X-CSE-MsgGUID: x+j3UIwYTqSpBHOmiG4H+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="94830314"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="94830314"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 08:05:33 -0800
X-CSE-ConnectionGUID: IlA9k02wT8GVnERn5vNhlA==
X-CSE-MsgGUID: XB0OPx5LSDWPVQzBhtRHYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="203515299"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 08:05:33 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 08:05:32 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 08:05:32 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.12) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 08:05:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCoQl4vu2XN/lKAdsMi/bJXT+rSW9wplqTDYA9MeP8YaUpIzteiwl4Hjd++U81f/Gv/kTdVgHgI9Invi5UCiO5eIKmmbK9MCVo2yjfHjiKQr0UzNAfBb2qjsaRei7zrysG0WymDks1CR1wnXyUc62RH/Xg86bNhhjNAWCB2p37SeOIZn+kFjuGW6qJLaamueuQlaPba1oxV/KHsAQJMP9UxYJOcsbTL+fAzuv2fPXQlGWx0P91NLnom1NqG6E0E6kawQo+gDLknqiqM7iSKU0tp5v7dMjV4AuXwbfjocFMjeY92HeKXCFZo3u9ld16WoCPzir8lz//jWWqk0Lil/zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=we5pKriSqXLVZ51QFCX2tmaP1alCBkCkPJGVPLx7JAw=;
 b=aFzkOBA0DpiLV4dGwtz22e7FkYt96ytff1+qVkMccM1AoWAsyeSVUbvOyXOCQlDpwOGhSskJjpytMrKZ0cj/rymL9j6bS94nFOBW8VZLpNxI+ife2gP+yLQgv0Vs9XPHsk0SBjJA+6Db+pCHE1xyVL/EoIiD7lnf/EvY0pocrWzP1JLFGs/1OSa+/qB19xQEiROqOJHiVA1cHB2qYutI8cO8IDQhGNsj45Y4ssK0cRsw9IT0QkY+/jMorDHN/duFmeL7qi/hGQNY+HryuN/oLpPWWZ499ZhPhhmzoI2BH4/apx1FBwp0ySl2tqNeaVTsecbqYCvO3jxueWRdj2Szeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB4798.namprd11.prod.outlook.com (2603:10b6:a03:2d5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 16:05:30 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 16:05:30 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: [CI] drm/xe/eustall: use bitmap_weighted_or() in
 xe_eu_stall_stream_init()
Date: Fri, 9 Jan 2026 11:05:27 -0500
Message-ID: <20260109160526.183574-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.52.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0136.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::21) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB4798:EE_
X-MS-Office365-Filtering-Correlation-Id: fcbe80dd-b546-499e-de6a-08de4f98e972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3H0Q6VqyMU5so8dSwZB9rZ+KmKtPA2vPeTiEhprJlnmKcnbykoykIPPfVrQl?=
 =?us-ascii?Q?6IeO9cX2ZekoSzmGueAnZF0wgHWlLMPr1p9/uCCvhS0ozHRjLp9SeX2vUGze?=
 =?us-ascii?Q?YXBd1BsvfbBhyIkX27IWnA4BlCuaN9pAGRqXav5aPNvrQo4L+4A7cOloVqfv?=
 =?us-ascii?Q?LqZhRuOGbqcIJ9eUGlUu+nRcR4NP+rI4K3tA6nK6P9AbPNa7qOxXKvEdfzn8?=
 =?us-ascii?Q?NK8HktlEO4PJgvqnBfuJy91QTbY0pUKLmrASS0ZQ+JNQ6mir7pin7OESuJRq?=
 =?us-ascii?Q?AUkdGLDnoJ7OVaoyjPt0y2gjXhxTmjs09aW6J651+sZsssyCrClDRqzqmKGT?=
 =?us-ascii?Q?QvsDNO5Ge0xIIgun8kyv+MHorI64GRBA33qSXokp9Dx8ponZhKMARd8n1QmR?=
 =?us-ascii?Q?soUugQrXZUiQc15IEhf5X2vXFn11raCyn57HqpeRI61ANipC1cGlw3KLWLmx?=
 =?us-ascii?Q?VfesQkkUHINCtjW9VcQRqQeB8pISjM3hP+EPVPPXZ+EMa8X1EsGZaMxwy+Rk?=
 =?us-ascii?Q?t9cVDwsAf6mqchHrm29HvReCgvCXMlE8UM7Oju+oDmcIpGd5SDc0O8XxIwcU?=
 =?us-ascii?Q?umTt8gfzymCkVp/55r4jKOGErGHXGfWIgS8ynvyAYj6Wz77BtVI7g/72o79/?=
 =?us-ascii?Q?LkzwWDOz/Lpuxtza23XxgCN69HXs0bkcIq6h4RhOOFDgJY0G6LL89jtY7CCd?=
 =?us-ascii?Q?XGPE5VfPMU5l0j+MzLVog4Cn9hr3q61E+Zz4+mFAOR2Zf1G1eJBXuqy5jojr?=
 =?us-ascii?Q?I5A/FUkn6/v3WN2lDXRKw6Ozvz3zXCQ8gCRQfW2gtpG6KJ5vqt0IFhwtcahm?=
 =?us-ascii?Q?HNPZ8cSEe1qwzqhJyEE5jsM+9C+AhKkSU+7n2mpp3cxMkq2h8QeuMk33IMYP?=
 =?us-ascii?Q?pqCbdxbRkOpKD6YHbjOo5EuRBGm3lxvAN1Wk48bYm0PyDVt79SLtQjrX130x?=
 =?us-ascii?Q?AqNZo/METRwj6q7H03tpiCvuPcWEjRf3Qauenk6oz5oaP/4gpCIbbxdGzox2?=
 =?us-ascii?Q?smFiBRipL65YUkM+9Q+Xr8XyvRk/ekzluZLAMBVkJoXKLuvKznPfZPaVRfzV?=
 =?us-ascii?Q?zupOlBm0Pn/U2ZS3a+d1hvhEVHNZJs0HZrDi9TQp9LP4i953qxEtwBlvrbGF?=
 =?us-ascii?Q?9L+E8C7/PrpStnS6SBWNS3nUm1zuCVTzz5ewRPeOjya/XfysGxGKbLKHhm7L?=
 =?us-ascii?Q?BLJ4pvDp45PCs+NHesWbSHqGL/9xiOCHeIA7SCdpT9QGLlHe3eHpPmg5Ftw+?=
 =?us-ascii?Q?Xu6jHdYKNyEkG42ccQVV2T2JgCc+66eSwWcFEXdvRES1TEcsLonu8gWUyd2E?=
 =?us-ascii?Q?7HES6xWZw+BZD0/PWwLAYJvKaTFHeVavlZBZ/ZuYRSYXlDr7u2GFPDacwhLK?=
 =?us-ascii?Q?jG7TdSrZ4+qAjUnJDoItQ+MTeYtRi1C+NIyVNcEcFYvttaIXr5YASvN3dooO?=
 =?us-ascii?Q?NSjBTJwMa0/vGCNEMCqNl3UBNNyHp9F7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rszidfSCbE2mAJ858dVKVrjuR1+5RdLnLq+bw8jrPMWarL7DXJYNohc9Bq1l?=
 =?us-ascii?Q?SELYXdVSmrsmi/On/9IQ5NZ1zMYpnoiXigbvudKrgacqLUMge3cebkp6IXcM?=
 =?us-ascii?Q?bgML7dd7m3vq9f32v/ucoa+k+j28YeYI5icC8Q7rsgKIDyIqvwQhcNfTvWJX?=
 =?us-ascii?Q?Wh7nqE23XgrvjrfHtzAVP1SYISc+D6U2wbd5AFyLLOGmE8qw8EhRF9CRa2XP?=
 =?us-ascii?Q?SjbUxAJj8lu5fh14LauqtuepgyAuLlFMTAaSV8lP2ehktyc7HaJ/yyo02yM8?=
 =?us-ascii?Q?QM+8JmYWP4tFWnRuug1axKFOm/Ovdied7zhIk1lmn3j8UHo2crY/LTf/pCcY?=
 =?us-ascii?Q?TrbjIPXUokwv1dug3CPWTf6HehIJwedOLrmyFC6PAnoD62Lrx+a0bjx9O+b9?=
 =?us-ascii?Q?SvfsPVC17E1uqONTdE5GLgO4va++LXNrhloNwt9TncLbtupX9ghcJWyNkOzF?=
 =?us-ascii?Q?9HoZwohYoRr6x93Hsz9+RyKq75ZBhOoOeLrBM8qaM7txqciCJG8EIG6sAlmW?=
 =?us-ascii?Q?v7aNM7UQ6fo9dzFfufaCdzJqMkN+QUmThtWf1ahGJGxni0TD4xHEEgpvlrwB?=
 =?us-ascii?Q?U7kv4JVnjj7Yfss2/ggrXb9mX5Hao9m/LhTnvqgZcsEO9In+E7/A570FSyx1?=
 =?us-ascii?Q?VpVY/aAI0FCZ8DJ9AJm1Tqa0pt6l9P5V6ehC3G5YzOI6lIg0IBWQ1OKNXHcF?=
 =?us-ascii?Q?jF/QMl1X2U9xNvMPDzzuPJxJQW3Dsk2qiDfwPShn9uaUqg7Sue3jt1HdTpRm?=
 =?us-ascii?Q?Spx20SyHDLyRPIS1VkIACw/uKPpvPhnVjLxsDSSQ2qBtKclSHB4L90EvjKMq?=
 =?us-ascii?Q?UkQxNLeT+8lq41kaVbwbFYGk1C6rSOhnH2A54CutIbc5Ay73J73nnJjHY0B6?=
 =?us-ascii?Q?u2Fk+4Dmd2XGNPeX7+OICMIg7lQMxhzsJH0PLR4OcKTe/SwKMjrdxHdukXoF?=
 =?us-ascii?Q?eQB+3FUrYP5o/1uLEpADqaLUmWXgxX5vig3aAZfE2olu0eQEpPEAf2pcRm8J?=
 =?us-ascii?Q?Fh+byT2Hzl33eF+P0Qqedu2hNUgHOxMKL0C78MnZy3aU/OaJZyjvsnRZeFNi?=
 =?us-ascii?Q?eoCQNA55O2iWpXx8eZQeIiUguE0YsfGz0QbolhENrNlv4aAlTBaNHvWzoRMb?=
 =?us-ascii?Q?UDwq2s/26WBw6nlbAat5XLf9244ufBB23A1YsJC87WIHqaDwywDZCEtHiAU3?=
 =?us-ascii?Q?hxbOcUeQxYok+KrXKp7LOd3aY7e/8d8icOaLGXJBcOQnO8DYWgC3hOKAs8l2?=
 =?us-ascii?Q?/mEQzyUrCdQLZGMoG/TdHSe93m1fOLf+wAtmY6TPR4ApUPEGDha4dS12/8n+?=
 =?us-ascii?Q?VYWcxCtTYCyDn0aPYDcH7mMaFZqf0LOd56pxZfxsgAkGHdVlCk+uXrDDRB/k?=
 =?us-ascii?Q?An1fAs6jttKj2ntnJVxCZcQHJ0Uw8rEEvF/f/t3IGl08yAULBnHJR9jtO9Df?=
 =?us-ascii?Q?vEIo5xqfZq6+nsnjx0/IJQCiMLlj0sYMzUKOd1s9iOMP2G/wWrWlLkCxwlQO?=
 =?us-ascii?Q?eCTWhcupiO9TbwebqvA/Lx32OfNLJTCZuKbL+SarplRvSV8bebjV/XXfe+cu?=
 =?us-ascii?Q?62Dtb9ot7+eP7NLpB5YOBzhTAt4f2fjQpK5XbWo/oUOomco3A7yJnV/HHBoB?=
 =?us-ascii?Q?FLxRJCjMBEPLsLsGfWqAAGPtAuUKUkLo7OZSwxfZJRHnRb70NG+VEhBjoVwp?=
 =?us-ascii?Q?ukLN5q1fhCnKCrlgGulmdmZ4LmBvHHlyjgqcyYDXC3//UXDyPIZ2N3gdeNtZ?=
 =?us-ascii?Q?2MtK9bkNAQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcbe80dd-b546-499e-de6a-08de4f98e972
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 16:05:30.5272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Dgvk5wxMHH6SQEzeFbNU+i/FJ6ksYSJPCoV45ANskPrFMnL5caCs5kwHlB6VBgamykczg6mQ1a5fPsUQfSlcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4798
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

From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>

Commit 437cb3ded2503 ("cpumask: Introduce cpumask_weighted_or()") added
the new helper, which fits well here. Use it.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index a5c36a317a70..f4c9f79012a7 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -737,9 +737,9 @@ static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
 	u32 vaddr_offset;
 	int ret;
 
-	bitmap_or(all_xecores, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
-		  XE_MAX_DSS_FUSE_BITS);
-	num_xecores = bitmap_weight(all_xecores, XE_MAX_DSS_FUSE_BITS);
+	num_xecores = bitmap_weighted_or(all_xecores, gt->fuse_topo.g_dss_mask,
+						      gt->fuse_topo.c_dss_mask,
+						      XE_MAX_DSS_FUSE_BITS);
 	last_xecore = xe_gt_topology_mask_last_dss(all_xecores) + 1;
 
 	max_wait_num_reports = num_data_rows(per_xecore_buf_size * num_xecores);
-- 
2.52.0

