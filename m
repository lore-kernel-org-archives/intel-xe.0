Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62B1CA5FE0
	for <intel-xe@archiver.kernel.org>; Fri,  2 Oct 2026 10:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6505810E62D;
	Fri,  2 Oct 2026 10:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FcBpbwIv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B79710E478
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Oct 2026 10:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790937663; x=1822473663;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Sivwscr4mXGJhkjMTJauTwn3O5Z4fxRWroRBE7C7ZyQ=;
 b=FcBpbwIvcU/RCn0ac/BCmImrXjX/h++Bdmz3Fw2FnRbpziJmpHCXDSKP
 fgZNg/M+89I+0dVgYA/fbxjn79hrByp8DN/uxG7N8u0GMSxX7qX3ioy2L
 iX1qzycaZ3n7xNIRQJ69byYufyUqYRT+LQeoswBZsN17cVpedxLYKywro
 99JVJnYi29OGmd3qUz4IXB6PuQwNrbWIL5jgaqgl0F64rxChVPH5cMk5W
 O+L64jRIqIxG1zAloXI9HwV+8wnQa1bzb0E49dVJtNBtqa7TD0D0xoYSm
 BuyLOsnR6BiNNl+BPJCba1ipUcpj366J/6C+YAd89A7gvBq+hJNtm6MXh w==;
X-CSE-ConnectionGUID: RBH8o+XBQsq9MffGHo1BIg==
X-CSE-MsgGUID: 3UjWxVRBTzmtkI5HV2fvww==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="109188840"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="109188840"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 03:40:49 -0700
X-CSE-ConnectionGUID: YxZ9cNIVQsCqCYakJCOHyw==
X-CSE-MsgGUID: l8hkbJmLSsyWzq78uq+Csg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="279480198"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 03:40:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 03:40:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 2 Oct 2026 03:40:48 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 03:40:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YztWEo3ZTNNCwejSpbsEE0qr7QLPAG2100B37oeLWcU67qn+X3uha2KtWJxThblAtJZ/roK8dhN95jSmGD7rWQq2anxb6JJbZ2of21lz88tQ0CbzV8OQhN7bwyT97pGltXyP04Jd33iHxTLZQkXyyBVi3vzibCLElcZsPYVNtDb9TYNXd2SeyB8LG3Cuexh4jM3QXXqHeXGvU55di2dUNC9bU7G1rLUIbLxMSSjOKtMRqFD0KoTk+ej9vqw/2WOkiX3sJaUI5nhNfnosE//GlTDmk2ELyYGpGU5oZdVcP1cUvkgjFfimuHW7YemzJPUAUARNQaOcuLlvgLaCPZaQ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coa+nYbYvM7heYOCwOBmu7Hm4ozdr9AC5HiZM3TzM8o=;
 b=aW+IHli6Vqsrfs80PhozGsUHDixOmO0f9VXIlq9bYDadA5LAjdeQnJ1jvvImbOCTvqkbgd0fBUqsWjf62jPBuqoLce/jPHVet/gcD3qnmYzAJ05aYkbtKKwmGAODQgiNitSGUHYXBXB4jN3/zs0WwCRIDBII8boSTEsi8N4uHKJDHjOeihXDqoB48zpgweit8K8yfpKD+dOA/RMlJs9D1r9i3Xk83kWW9AfKb2DAkkGc87FBwcs3YmeRUzOq2D8EDUuTUm4UfowUwibkqwtnJhpJG2E3HQNTy6yDEBOfzFByUKKY+Wmt6QTgS2WfpqjPqd2n1Flkh2BEMlYk8Ij+mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DSVPR11MB9577.namprd11.prod.outlook.com (2603:10b6:8:388::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 10:40:44 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Fri, 2 Oct 2026
 10:40:43 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 2/7] drm/xe: Define VRAM regions and pools
Date: Fri, 2 Oct 2026 12:40:13 +0200
Message-ID: <20261002104018.3648425-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002104018.3648425-1-piotr.piorkowski@intel.com>
References: <20261002104018.3648425-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P251CA0021.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:551::23) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DSVPR11MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: 0365736d-183c-490d-2ceb-08df20719c6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|10067099003|56012099006|5023799004|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: HUVTU4VMV++tY/3273nAJMvbZpLz3emGowzS7iSg54JcIXFlllWvOUhP045ouTVFZLjK1b2JpBcEaVI5LlF9HN6QrrKnfcdWfsN0kCKh+OoCPMOWjZOw/gp9kill0X+UaVd4VB7qZ89Aa+erZ+qDp2wY46evtkrQhdVItBbTmtHxlRq8rfvzN5zuH1Ywn7WWLVHKVGNkT60BnlWVg2UmTJ/q1YbmFuR9rq636bfUh3XVawg1vInng+Zl4wFr90V7C4vH5ZTtNXKorsS6HZak77UxDx0PGEnysbWzDxcqziZ08yzvroUpLYA7ups3cE7yFgSNXx4uH0SsxapNxvQm7S+/TZxKifB1fZMuZ0oNWWG+JDaxu3S+sCYdsZEA5VsxHgSLaznL88xFRAGGDZetiUfMyzEWUIhppxEjxk31QIRyE1tiIzqzHlApW0rN72//P0KRsmvF3oWxWF/lS1xOeyTSkJFAlrRbKW9kuuW134YCZ7+S7w0aC5Y3M7jPbqeALKr33QhIic4lHbiBIm7/WEBkNiVuPeWSWKR3efOpvNYKjcswoE5zLdcLqJXZWPUiZrMNj1ctFJfRfYD85slQo263bMhNAX1c1xedznZ617brgkc9DKDZGA5xweXSOTPMkGNkbCgRIPOB2k5PB55l/u3Rzd+oCbBmsSW3x6WYavQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(10067099003)(56012099006)(5023799004)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTNidmRrbmZ4WjVmdUJVbllmcWpTb3JBMk5ubmR3aG1UNDZuVHAxWEVtT1hJ?=
 =?utf-8?B?OTRxMHQxU24zdnlLMUdQRkJqelZXdGloZTREcXo3Q0VmTGdFanc1MGR2WWxs?=
 =?utf-8?B?cENUdlJydFB4eEVRR0lLR2g4WWZHREsxS2dxZWVBeUlHcHd4MXFmYzRkb29q?=
 =?utf-8?B?UHdqSHRXTmhxaTViTkI0UG5kcDZZUEdlbDhsaDhra3Q3OTJYN21ZT2tieXlj?=
 =?utf-8?B?VEdMMTYwYUtlQXBZcWJWZERDcTNQZStNWjNVTHRxNHJiQnl4SFlFWDlwWkYv?=
 =?utf-8?B?ZzRwZEMxby9pbFI0cWxQc1FVOEVVVEk5QjdvRzljZld1VHNVMVJNcEUxaldP?=
 =?utf-8?B?YWFSdWFVNTF2S21rWEtGWlNuR2JQRnVVZlFnYWw5Y3ZPNEdKQ01BZXJzS0xW?=
 =?utf-8?B?ZndFZk9pSy9ZOTBWRWZTeFAzNlpzbWhTYVJpTC9LUFZOaS9JNDZ5dG9YcWxV?=
 =?utf-8?B?QmxuSWlRR0lsL005YlVFNExOUjlkZjR1RDZDdWJqeWlHSDVQWmJwT1pWRGIx?=
 =?utf-8?B?bkMwRjMyYkN3SkNRbEVxNjEzZGxHUkJkbUFLVVZvMlVDbk5KdkZGSEdac1FL?=
 =?utf-8?B?K3JHSjBESmFKV0R2MXhCcFlWR0psOVlWYm96QW8wR1g3L0ZTZG1BY3R3ZVRC?=
 =?utf-8?B?T3ZiS1FaNkkvb1pSNFpTZXJKcTRCbURBTTNvWUpRQk1GaU5IM2tpRVlSWml6?=
 =?utf-8?B?aVBla3JkOHB3a0dLUFI3MkV6R1B2azBYT0R5dTBOSDZTRmMzczZZeEtIRFhR?=
 =?utf-8?B?WFFHTnRtbDhJR2NQVmZJSVBvQUVEMU03a21uQnBlUEZ6dTVsYTA5dlBhbWox?=
 =?utf-8?B?RnFqUlI0NGpMR2t2NkhnZFNRZDRFSFNXbkdjMTlPckJqRmhlZi9rNXMyeTlk?=
 =?utf-8?B?Q2NrODlqcG9tUHJmQjJnQ1prb2p5d3J6K1BSR0NCZDB6c2tsRUs3aUpjLytF?=
 =?utf-8?B?L25Sbm5lRGFNRGNwZXptUGF1dGJVbTVadGlsejFteVZ4alZJT2s3ejZQMTlu?=
 =?utf-8?B?MTBBcDF4bzBVU2dmNnB4dStCVXJ5WVRuT1lmb2JSUncwTWswakFJSVA2WVp0?=
 =?utf-8?B?ZWZGN3JLUU9lRWE4UUpBQzJIa0JhUkZ2WHB5M09ya2ZEUW5MaVFHdUdDeFVS?=
 =?utf-8?B?czQ0UTYycWVNcTBzUW5yS3c3MktvbFpGZ1haT0VMa1dsUk9qb2lodk9jM2pK?=
 =?utf-8?B?RlIwMmk1ZUdxcll3bmtWWS8vTmdpUVQ0MmhCeDVQdnozeUZUeDNZZE1YS0dp?=
 =?utf-8?B?RWQzYVk2WVlwR1NDWXZIbXRGdUtrVVVKWHV0M0o1VHU0cnd0VWZ2SWQzZ3RC?=
 =?utf-8?B?b05BeEUvajZwOGdhTi81WUFFb1p0WmdlMTMzRmtlb252M0x3dlkyWUdrMUR1?=
 =?utf-8?B?YXZ5N3NZNkd5ZzRjYVNvd0Q2ckRUN0F0d1IvUFlQNHoxS3FodjJHem9ZSUxN?=
 =?utf-8?B?clFQZnh6RTd6cWxabWFVdEJTSEFESmNyNmNDbGRGcEpmSEJnVHVOUkU4SzdV?=
 =?utf-8?B?K1djNWdnK0JKZEhnNmNKT2cvUzhiWG9HYlZOemVMYnNWcjRXREJwZmlTbVo2?=
 =?utf-8?B?OXVDUVRZbXI1RU9iSGRsVmphQkcvaGRhQVhRL1dQOTNjNnhMZU9JVUIvRk9h?=
 =?utf-8?B?UXYyaFcvd1gvOVZ1MUhQMGRjdHNsaVpBMmFzeENzYm9TN1ltbVdXU3ROeS9h?=
 =?utf-8?B?NzBwNWhHN0NtRXgzS2t0Zmp3Y0N1Slk4MWlSMnRsVDJyd3Ztb0ltT1BiZ0xL?=
 =?utf-8?B?ODZSUHdodHZmcDMvcU9ZMzZ5R1ZrcHFEM2FQMmNiMnk4cHI4TWxvenpxd2p2?=
 =?utf-8?B?TEFWZXRiUk9Gak9maDVkd3ZScnFORzkrNmpXQ2pGRk5EVTQ3RVZkUVp1NERq?=
 =?utf-8?B?TExyc1RGQ2Mwc1Q4M05tNjhmZjJRa0JERWs3WUdmajIxblJLdjZGOEJ0R2tz?=
 =?utf-8?B?VUNuUEFIWjJ0cVBkY1Y3R3JsdXZsanI3SlVXVnlwcTFIeDY4MlcvMWRoSUlj?=
 =?utf-8?B?MHZ5Nk9QcUxjbERmQUsvRmkzcERhTFVUU0NXVnNhNTg0bloveWJLV0JzZ0tw?=
 =?utf-8?B?WVdNdmNSQmR0SmdTZnd0RTl2VjFjYlB1M1o3Mit2ZHZSNysvMnMzQkpxemtH?=
 =?utf-8?B?UkVBd2FBTDRZZE5IWnJEdFVGVFZSdVFzU2UraXNIRGJnNFFabGpoaW5xU2or?=
 =?utf-8?B?SmhFSW84dHpXRVRwMkRhb0F1UHBlS1B5bXB5T0ZQRDFZSkdzLy9oR28vSnc1?=
 =?utf-8?B?VzNSN0U5WXNkR3R4Zkk5SmJ6T2RFUzVHd2JXcnlyRFRrbzJneVpXZXBNem1k?=
 =?utf-8?B?L0F3cTBYN0hrZFdOc1pndEIyRlQ5ajliNlBlSExEMTdDY2NkaGpSZ0U0SVZq?=
 =?utf-8?Q?9nKTAMOTQm0li6g4=3D?=
X-Exchange-RoutingPolicyChecked: q3CDVISO88eZA3/6H5mL4u4lmR04mGQDJoIs9sox824jk6KjgEQFh6S9JuxUztzPfMnEDtGxhnlbBbYI2MzK1um4SEaF4FcARgELGTrDXu2EAa0F43fv+Z3iD8vkUgco0PPcShnZC98Xk6yXihdZjV0dpM52/D26cOFSs+L93PE1w8mFz9b9Kce2Chymuoaz1pFKIPhgUs7Cd6nmNz0x/NeJBdMfvRfOUr3wDYEz8N8XV3UqIsIf1Ahf4YGWnqFP767m0PliwGsrmr9ouQ1ee/7LsRk2VGn4GbnXgcp00y2hTg8G3zDlI4g6Qmg9DOM9RSL8RExYMqOv30JDzFwN+A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0365736d-183c-490d-2ceb-08df20719c6b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 10:40:43.8920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VBawkd6PxHknTHCgPMW5YVFLPpsl6hqE1tAB7Xx+d01XutYLwU9LcfI3Ogd1xaPnvAgDxUhMo2zROCOYYZPzPuu7j0zS7iZy68gITfMJRoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9577
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Allocation paths place memory through a struct xe_vram_region, which is
both the physical carrier of a VRAM range (BAR mapping, DPA range, TTM
manager) and the only handle for the purpose an allocation serves. That
makes it impossible to dedicate part of a region to a given purpose,
e.g. to keep kernel allocations such as LRCs and page tables in a range
of their own, away from VRAM that may be reachable by other agents.

Separate the two concepts. A struct xe_vram_pool represents an allocation
domain: it identifies the purpose served by a range within a VRAM region,
whether that range is available for general use or dedicated to
a particular purpose. A struct xe_vram_region owns the physical resources
and embeds its pools as partitions, keeping pool pointers published during
initialization stable when the region is later split. The region also
records its binding, distinguishing a device-wide aggregate from a tile
region, since both may use ID 0 for the first tile.

Assisted-by: Claude Opus 5.5
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_vram_types.h | 159 ++++++++++++++++++++++++++++-
 1 file changed, 158 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
index 646e3c12ae9f7..a3e421f2f32d4 100644
--- a/drivers/gpu/drm/xe/xe_vram_types.h
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -15,6 +15,142 @@
 struct xe_device;
 struct xe_migrate;
 
+/**
+ * enum xe_vram_binding - VRAM region binding types
+ * @XE_VRAM_BINDING_NONE: no binding assigned, default value of a zeroed region
+ * @XE_VRAM_BINDING_DEVICE: device-level region aggregating all tile VRAM regions
+ * @XE_VRAM_BINDING_TILE: VRAM region bound to a tile
+ */
+enum xe_vram_binding {
+	XE_VRAM_BINDING_NONE = 0,
+	XE_VRAM_BINDING_DEVICE,
+	XE_VRAM_BINDING_TILE,
+};
+
+/**
+ * enum xe_vram_pool_purpose - What a VRAM pool serves
+ * @XE_VRAM_POOL_GENERAL: general-purpose memory, available to userspace
+ * @XE_VRAM_POOL_KERNEL: kernel-only memory, never exposed to userspace
+ */
+enum xe_vram_pool_purpose {
+	XE_VRAM_POOL_GENERAL = 0,
+	XE_VRAM_POOL_KERNEL,
+};
+
+/**
+ * XE_VRAM_MAX_PARTITIONS - Max partitions a single VRAM region can be split into
+ *
+ * A region currently holds its default pool and at most one pool dedicated
+ * to another purpose. The TTM manager mirrors the partitions of a region one
+ * by one, so a region cannot hold more of them than the manager can back.
+ */
+#define XE_VRAM_MAX_PARTITIONS	XE_TTM_VRAM_MGR_MAX_PARTS
+
+/**
+ * DOC: VRAM pools, regions and partitions
+ *
+ * Allocation paths place memory through a struct xe_vram_pool. A pool names
+ * a purpose (general-purpose, kernel-only ...) and resolves to a TTM
+ * placement plus the address range serving it, see xe_vram_pool_place().
+ * Whether that range is the whole region, or one of several partitions
+ * sharing a region, is a backend detail pool consumers do not need to know.
+ *
+ * A struct xe_vram_region is the physical carrier: it owns the BAR mapping,
+ * the DPA range and the TTM resource manager. A non-aggregate region
+ * initially contains one partition spanning its whole usable range. That
+ * partition is the region's default, general-purpose pool. It always
+ * occupies partitions[0].
+ *
+ * Each partition is described by a struct xe_vram_pool embedded in the
+ * region, so a pointer published during initialization remains valid if a
+ * later split changes the pool's offset and size. A split never changes a
+ * pool's purpose and may only happen before the region's TTM manager is
+ * initialized.
+ *
+ * The device aggregate described below is the only region type that has no
+ * manager and no partitions.
+ *
+ * The id shown below is the VRAM region instance id. For a tile region it
+ * is the id of the tile, which the uAPI relies on. The pair (binding, id)
+ * must uniquely identify a region.
+ *
+ * Partitioned region:
+ * A tile's VRAM region can be split so that a pool dedicated to some purpose,
+ * e.g. kernel-only, gets a range of its own and the default pool keeps the
+ * rest. The dedicated partition is carved out at the start of the region, at
+ * the lowest addresses, and takes the next free index. The default partition
+ * keeps index 0 and is moved above the dedicated range. A tile without such
+ * a reservation keeps one partition spanning the whole usable range::
+ *
+ *         xe_vram_region "tile0" (VRAM region id 0, binding TILE)
+ *         ,-------------------------------------------------------------.
+ *         | ttm: struct xe_ttm_vram_mgr (one manager, shared)           |
+ *         | .---------------------------------------------------------. |
+ *         | |  partitions[1]            |  partitions[0]              | |
+ *         | |  offset 0                 |  offset pool_size           | |
+ *         | |  size   pool_size         |  size   usable - pool_size  | |
+ *         | `---------------------------------------------------------' |
+ *         `-------------------------------------------------------------'
+ *                  ^                               ^
+ *                  |                               |
+ *             dedicated pool                  general-purpose pool
+ *
+ *         xe_vram_region "tile1" (VRAM region id 1, binding TILE)
+ *         ,-------------------------------------------------------------.
+ *         | ttm: struct xe_ttm_vram_mgr (one manager)                   |
+ *         | .---------------------------------------------------------. |
+ *         | |  partitions[0]                                          | |
+ *         | |  offset 0                                               | |
+ *         | |  size   whole usable range                              | |
+ *         | `---------------------------------------------------------' |
+ *         `-------------------------------------------------------------'
+ *                                     ^
+ *                                     |
+ *                            general-purpose pool
+ *
+ * Device aggregate:
+ * A device-level aggregate region is unrelated to the tile regions. It is
+ * never backed by a resource manager and has no partitions. It only
+ * aggregates the sizes and DPA ranges of every tile for reporting purposes.
+ * Nothing is ever allocated from it::
+ *
+ *         xe_vram_region "device" (VRAM region id 0, binding DEVICE)
+ *         ,-------------------------------------------------------------.
+ *         | ttm:        unused, not backed by any resource manager      |
+ *         | partitions: none, this region is never allocated from       |
+ *         | size:       total VRAM summed across all tiles              |
+ *         `-------------------------------------------------------------'
+ */
+
+/**
+ * struct xe_vram_pool - VRAM range used for a given allocation purpose
+ *
+ * VRAM allocations are placed through this frontend. It identifies an
+ * allocation purpose and resolves it to a TTM placement and the address
+ * range serving it. Whether that range is a whole region of its own - and
+ * thus has its own placement, mapping and address range - or one of several
+ * partitions of a region is a backend detail the allocation paths do not
+ * need to know, see xe_vram_pool_place().
+ *
+ * A pool stays valid for the lifetime of its region and its purpose is fixed
+ * once published.
+ */
+struct xe_vram_pool {
+	/** @region: region this pool belongs to */
+	struct xe_vram_region *region;
+	/**
+	 * @part: TTM partition backing this pool, or NULL until the manager
+	 * is initialized
+	 */
+	struct xe_ttm_vram_mgr_part *part;
+	/** @offset: byte offset of the pool from the start of @region */
+	u64 offset;
+	/** @size: size of the pool in bytes */
+	u64 size;
+	/** @purpose: allocation purpose served by this pool */
+	enum xe_vram_pool_purpose purpose;
+};
+
 /**
  * struct xe_vram_region - memory region structure
  * This is used to describe a memory region in xe
@@ -26,9 +162,11 @@ struct xe_vram_region {
 	/**
 	 * @id: VRAM region instance id
 	 *
-	 * The value should be unique for VRAM region.
+	 * The pair (@binding, @id) must uniquely identify a VRAM region.
 	 */
 	u8 id;
+	/** @binding: VRAM region instance binding */
+	enum xe_vram_binding binding;
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
@@ -57,6 +195,25 @@ struct xe_vram_region {
 	 * (e.g stolen mem)
 	 */
 	resource_size_t actual_physical_size;
+	/**
+	 * @partitions: partitions this region is split into
+	 *
+	 * A non-aggregate region initially has @partitions[0] spanning its
+	 * whole usable range. It is the region's default, general-purpose
+	 * pool. An optional split may adjust its range and create another
+	 * partition before the TTM resource manager is initialized.
+	 *
+	 * A device aggregate region has no partitions. Allocation paths do
+	 * not take a region pointer, they take a &xe_vram_pool pointing into
+	 * this array, see the DOC above.
+	 */
+	struct xe_vram_pool partitions[XE_VRAM_MAX_PARTITIONS];
+	/**
+	 * @num_partitions: number of valid entries in @partitions
+	 *
+	 * Zero for a device aggregate region.
+	 */
+	unsigned int num_partitions;
 	/** @mapping: pointer to VRAM mappable space */
 	void __iomem *mapping;
 	/** @ttm: VRAM TTM manager */
-- 
2.34.1

