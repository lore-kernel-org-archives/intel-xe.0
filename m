Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8A6C531DF
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 15:03:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9DDA10E7E5;
	Fri, 16 Aug 2024 15:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SMJwD50i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D36310E7E4
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 15:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723820592; x=1755356592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=0f0xGgvGDN9FAaRK0TC8lszxrTmyQz3IkOk2ZoslOEg=;
 b=SMJwD50iqQz1drcqflfuziiDMR6Jn6c+eLEDxK7tX1BBDTGEb4VO2Cqd
 iz8hyfpY6WN1xp/QpxNTH0LfQ3du7lxUOtMWjFhJhhlP4UUNRRmGfzZKK
 38VAl3I8HlbosZpP3UZYNen/Y2VPsOIQk/dSDHHgHUhbQz7hhFppWQLXz
 bd7EaSPpchtL2E07men6+/1zAcwW9y7csc9NpeOjxxedipxMu9IuE2vLy
 QeWPz5933ytB34TyRbxy9nAGBz8qqxXzbLO47DxLO8sZ3QESBw9pgjqvF
 VtW8IPZXRuVNVlJeHkLG+IWbEXCzrNyef1qZmlsPUgPq6/Ia8+WIUc6P4 Q==;
X-CSE-ConnectionGUID: +DXKTNrQQGOVees6N/IdTQ==
X-CSE-MsgGUID: hg91spZWRuiTqW83QheF7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="33528386"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="33528386"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 08:03:12 -0700
X-CSE-ConnectionGUID: 4HnXJtuyTzW3BdBL1sDsCg==
X-CSE-MsgGUID: DHkA9uMYTX+5XYRrG15Pwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="97210458"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 08:03:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 08:03:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 08:03:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 08:03:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 08:03:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9+6X7mBmghE8/CAHSpX/L4zqA4DDdWi+gt8JEEYeMVyQpXJzWilm+4LqLcXI3ebuYWBV77uKwdRrSmLFqFkFPhyA2xX3vA5y/hXzInRRiKNIcdORHIW4C/UqOyPey+XiLgqqchHZDkzoCoRm3vxvGzxdhsKs8DPOfjcYTZg1BVqmsxoox6mougeBBDKrC2B6dAssD0OOFLZkzPNTb4T26SfWhoQzF6qYzrG9BBlcgeUQ7/THOmQOYGj4dWifK/6R7rHjyu/qVlwqHC6mjxJTjhceVjeoBQe/YwOYvBqqQqgM/7Pl+TsN4WsbGyv2YdZSD2LdrZcyWE3uJQz2jsXDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxeDTExAiMFb0rUpW4mGKkpKdrbnR5DEJdeAX76um8I=;
 b=HPJGVesqTain6Wlfhy64YULNYMbXDTRN1/lLRo1enHbtDG2/hBknq13Tx3PtgWzEw0eJrEzzkY/lVLklb7MQvwib1tPLPJZUSucb1tPPQcPDNPd4IOpigryCF/BExdz9t0AisM3+O58xufq4h+8vdBf+wAq6lvPPhdZnfr+Jz5sOKqgQThHOykycmg0o8i0/FAK/Ues6v6TMRFryZrrroq47x8AMUTwvANu2tNki8hFXb0giWbmfCnqja3SJThKVoAjcXVbgNnORxZay8fGakjlr2y7EL+TW+HeZWzyd2q9ANxLmMDFraD+EI6Q4OM9YCDhxCxaTJ8iWF3BOrpngRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by LV3PR11MB8554.namprd11.prod.outlook.com (2603:10b6:408:1bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Fri, 16 Aug
 2024 15:03:01 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Fri, 16 Aug 2024
 15:03:01 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 06/12] drm/xe: Rename xe_ggtt_node related functions
Date: Fri, 16 Aug 2024 11:02:37 -0400
Message-ID: <20240816150243.87596-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816150243.87596-1-rodrigo.vivi@intel.com>
References: <20240816150243.87596-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::19) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|LV3PR11MB8554:EE_
X-MS-Office365-Filtering-Correlation-Id: 3808de9d-7aaa-43bd-70dc-08dcbe0485d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MWZOgW2+vC3wWTx2CYEob8cw2Cu7JvPiw+C2ELfnqR34/Lg29oAbGfRq32IL?=
 =?us-ascii?Q?W1WUfkcWbA/9pE20WZY/RZFdKppLB2YD2ypuFwLzztC5gjwzCu5lHAmKjSCR?=
 =?us-ascii?Q?l4AZQj1WTdLy2PQ7elUDIMj76Txz/DqXZrpaUjLmJGEqyGdmbs6gRoPxqNdO?=
 =?us-ascii?Q?B3jflKaHhoViEojUV1b3PhAR7Etm6fplt0Nfz/QuZaUwflSzCJhWRAbUc1c5?=
 =?us-ascii?Q?yy2NCC+bE1KbDEwXOA+3/eNv88MxllQV4WckOS8V/jyyOlKu1GG21MO+l4OK?=
 =?us-ascii?Q?pdLFfuX2pM9jVf13BtTrm0WsCiIbhSh/dAR/UFM3hctnV9co4aT7gn+tOTnt?=
 =?us-ascii?Q?l93YpZxiJgyH1Iq2Yehz+f9bnIPIwW/17SiwsDPM6YFK0FnOgyUH0MHEAYmx?=
 =?us-ascii?Q?WvD2PTgDPjItdScIiYFMoFZyRckL2WD3jaiVkY1luDPyJLDIPEO+c9d3gtlv?=
 =?us-ascii?Q?jSWOl6eZ6Y+yb+8nkoJ9YTB5oYuOk4nbe8gYJo93gk9qhlUfbogBrxd8I4wJ?=
 =?us-ascii?Q?uap7vzelP2eCy4hA1qMHQnAk7mliGGQS2DZ6+8SsM3HpBV4ZGXcvqRajGjT5?=
 =?us-ascii?Q?bQVzMFMd2lQlAfeTe1FInAfgyPohnNGsRVAuvUaQgd0Fj4xtfCrIjJUpow64?=
 =?us-ascii?Q?XzVvkcmAW08/2081XkCE338xUa4PbFEbXtW+KcOJOpPG2nVmHnzXbwI23iCs?=
 =?us-ascii?Q?bkXm9FYsMiOdD3HVQVrP1EwqsRmiWSNHlVqRiPJSe244qdFTVIek/UKXgd9g?=
 =?us-ascii?Q?7XZVdXOq8EY1YghmG5RXt0HNz7nxcsDqDByqcIB3X2c3vsQzWQysmbQJHVT7?=
 =?us-ascii?Q?JKOlutFigcFkwCwMNLQKbOX7QIprMIj+FkNTu105iNh41iwWymgpROrbgR86?=
 =?us-ascii?Q?pJhbOmT3hvnW5UmoKtmOBpY2Z9X3ZgAACvb2cY+9FU+YRx3CzBNrkM9jKBvw?=
 =?us-ascii?Q?TPDQxvztzmPIPJKpGFurzCqhFuc8w+dgt/JKMksPEdPOCfLtoKV7JhHc1/8B?=
 =?us-ascii?Q?L7JMjdHuUJ8o/rTLtnvw/XBfnndyyPM7wACeubhqilkMHgCUbucX1ctlfjsI?=
 =?us-ascii?Q?qoXwAAcrS/xGHpxqIPsZS/94vT+zt+WhQzE7RV8k2aYXnF+vkcbxDBVJF8wo?=
 =?us-ascii?Q?wfkbpJF1ynpZVFley1EkuYBJ1hDjoRaLk36O5yJG241RG4H/DFmfH1STwbGs?=
 =?us-ascii?Q?RJh+NeQUsJsgOh6/QFG/8pZr1dKN+4xR1jKkXeQ16IBQwJ3L4ccSTQbqVts3?=
 =?us-ascii?Q?tTGeXWO+Pc3OnKtScUl359g+ixrDgUJY7CRv/8gpLtAV8462yvHEqyZO4NO0?=
 =?us-ascii?Q?SOUxFss6oP6kq93ZPJ1AVn7uuM0FBm4YFNWn9rFjtMJ6SA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yrn8ayb2smD3DU/2hcmghkwxX9ckASTJLTodXpR5YeJLE+kAZMwnc+lZeayz?=
 =?us-ascii?Q?m3IAwh2QMuKKpKOwINsEfr81wgnPi9tzP3haMIYh/8R1D7q8XiuGRSJMjZGB?=
 =?us-ascii?Q?JkUjOCwrGThCI53CUpVEuBrQKCfq66M0+c3Mqw8LmMjWHkotCVS4twU81GFF?=
 =?us-ascii?Q?QhkMrAs0JOEErZkzJjY89rHWMoTQZx8Es0opgKnoUuZKv/Nt+mudCqO8fo3L?=
 =?us-ascii?Q?e3U/GM4I5M1A1XkvN7Aac59tQ2SCm7Twxp2h2i+hd653QdwyLaePydlY7+bO?=
 =?us-ascii?Q?ceYraSwgACpMCnjrT7D9S6r0PUVFG+269kh+9KVRJIx+9JHc1OxWeZKRhxdx?=
 =?us-ascii?Q?opi97lB+yyYSI3rBs5IphqTgOJ/uWSUXkFWA6w7MMn3zto/WkuC1WVuoc6Wh?=
 =?us-ascii?Q?EgjICYTJb2qzKkb4BM+05dqR6AYW9hI3B+WIhLKndFdf4iwCN12wIwAspw1L?=
 =?us-ascii?Q?Ml0aGKfPglJYxft/Ai4ixWpFbcKU1V6YZGaIJYi6EMVE0njGLtxNaZotjEMp?=
 =?us-ascii?Q?v6mW4puxcybpVmdQITrVXb00T/gHfa2ymKnCl4YamXXRF7//RzIslZmSbIp4?=
 =?us-ascii?Q?pkr888qfQ1BolOEUwEywsqhTbSOT2WlJiBlm/mSqTw9X8O8ERpoCkg4QrOIP?=
 =?us-ascii?Q?3UmsGT0gyXWAi5q5m+ohJfUrJuyb3qm4v2nEtJlzAY89z5vuEmQo7xz8/iVu?=
 =?us-ascii?Q?IwJbQ+hZIrzXD+esfeCUNW9dyz/GbJuzo8cafqwgwkYic/L644nYrEcVO1Nd?=
 =?us-ascii?Q?AKam+zwEPGEv3UeSjcgGkv8NT+GjNY23FqgS2lBzuJvWqYYomlscJU0uX8vB?=
 =?us-ascii?Q?Wf3PyBrS1Y9yfiSn/4396gegerukb9gd66f4U3QcM/l0FUoKYdjF4Lc/gsTr?=
 =?us-ascii?Q?BnLXUXP6jAMzBEUQSqedZr/M8ebZUEqhuasBc52h23u0voXiWgQcg20p77E8?=
 =?us-ascii?Q?DKMY5YVJNH7rzw/du5pUyGX8aE66CaNHMWxbP7L8MkUaRcMziSGuF3+6+hSQ?=
 =?us-ascii?Q?VvvkthC41G4yVLnV/PH4J7dfXoj1rRgyQGQxwl3h4y81iZH+lmaPrJuKvwVm?=
 =?us-ascii?Q?yGPgk0vosmqwjfg+DI7BppsSzCopMH25W/GNwLKupvMIm2JT1fu00OmVcWS0?=
 =?us-ascii?Q?TMz74EwY/DxGbEmUjljdjySmtjsoAckzbFr2YRoKOctlRzj6iemc4S4kxUqb?=
 =?us-ascii?Q?RWwoFlhk+68MTscbk3priegVSqW83lI9KOui9USui6e+s1fd4Ij8TCXOqTP/?=
 =?us-ascii?Q?s5mxzCfvldnkFS8ffAZRWob0ym/YdLhPf7B6BhTubFqm58y2cMhFTxtUBcf4?=
 =?us-ascii?Q?VV5uMQJCHGP2/746HkjCRZQJ7D1qjhfh/K7Jf2wAOO26TCjrMfbAIbRbV7FL?=
 =?us-ascii?Q?LzOyB8P44oW83lYHFeWqF8WX+rFsaqtdyc39pSuF0CUzjP7eyMuTfrOTyr/U?=
 =?us-ascii?Q?dL25T8ZRr5OIVoXqUeK2KhYWzGbToxnYQT2gfhXzWB6pnK1CnFC2Qv90kkLB?=
 =?us-ascii?Q?FnGQbeXtnzGOqxbFEYJHU9ge+UmeJAPFgX0RHoA0QEd63P5J+EL2NoO3G4UY?=
 =?us-ascii?Q?NCnxBiQ8l1Yx3kDZlrEteeb5NRNaJBW86jI2E2eH88CwD5Bqphuh4xoEy/66?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3808de9d-7aaa-43bd-70dc-08dcbe0485d8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 15:03:01.6705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JaWLiP1MjKijWjB+FHa4OA6Wah/aZEIAbyYa3R+wu5tFNVAVk+1bq2bhKFePdiROmRMpZmLoQE8+VGLY3F2IJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8554
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

