Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27D7C531DF
	for <intel-xe@archiver.kernel.org>; Sat, 17 Aug 2024 10:36:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77AFB10E063;
	Sat, 17 Aug 2024 10:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mKpMgtBY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C6C10E034
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Aug 2024 10:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723890967; x=1755426967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7NqO29wmwPFzQD3EWMQ8R9S65yF5Edw1BEhvvGQxMIA=;
 b=mKpMgtBYGA7Wpqvt6YP1Zdm/FL9j4lckoeHUOLfOihNyLCeupYBvElat
 XPrzssq2kPZzPk3qcRLhLVXdIz62vbRjj25zDk0PxG4pGepZEIOyaLqBX
 osVQjXk0UzITJntOseNiyteXUsCu59SIvvjEWX5t0SneMkyd2ywuD3UzT
 eaW5xHmyJpY1IHjWJMrTXaS1fZJQOSGfrrBNf0qcfJyPufcV9fHZ3MV/f
 R5haHHqCLXy9ljZdKGfx1Vy8S71BY6JvFo5Cr6I2Aw4hqP+0hZ5VU/XHh
 BtE/Eeh/tRWxGooW5JgFvuF+vT6Dl7HY6narKrcjvk84UAEdgS2IDMRWv g==;
X-CSE-ConnectionGUID: sYPmUShPTKyRU1010XwyOw==
X-CSE-MsgGUID: fLX4uJoKQS2CFr7kVr/wEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="26049106"
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="26049106"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 03:36:06 -0700
X-CSE-ConnectionGUID: JVf1Jw4nQ7u/z/Sjy4B1eQ==
X-CSE-MsgGUID: ivn2mZKdQTyabz1Dq55E3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="64866576"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Aug 2024 03:36:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 17 Aug 2024 03:36:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKo533TOt5BA4/U92jJMZYHIoX8jRfWEJCF4d8hR20rrN2UFmV/0AwqYcqefXbgvo3vlTeiFhSF/X4eiCO0ccTm6VGQCojIm8GI94vDdKE9C8XaLCeYlzZp1Zi8ZwN5ZWDtAzEV1FB6THV9xYX/hTou7OS3j+a4pK8Ny1vl1gUz3BOU16+sfza4nFznQbDOBDKHKb2ExsES/t0pVVQ+x1jCt8zTXYZpYLjXkcq6+rDnEJaqrRMCOLLsWvinBc6o/caXvdL7CmOAJVVW6/1zWItQVnPx/+e9sp62YeAG5WexheS6h4m/74lbTTn2aOgoqSVfahUx4IGHoVJTpPMs+VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPGGF6cOSh5MufufwMWlimDzt13nY6gMjMaiD/7Fzfw=;
 b=C/aTGw12mtlyPx6SoCcXlj4GA/F4tkJ4AJ7OFxdgOpuyUHzg1ixr5BGTYUdax5SiFpF0OTMQxJGJpTUme8in/vl2NcOxmIbj+Nc8jBVkrMkms8feK9do05RNhm8FvLLEtX4CMj7tVVt57ratIZBsg+qD1Jkq/NgeDWNZ4bmSyuKrNhn/kvkkMm0iK4qRElr/kYL7PmV0nZjihCwu/Jm2PPsBAztj1vqMWcScFOZC3+12VapkDTthJ1vcoQybsJN43LnK8lvWzn9vT3n1Uc9IOEN0nqbI1yug4QulUMY7qSHiYnBXyT9Y7g5BpR7xjMD8B06ZmneK5fO/p9Nb5CEXfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SN7PR11MB6679.namprd11.prod.outlook.com (2603:10b6:806:269::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Sat, 17 Aug
 2024 10:36:01 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Sat, 17 Aug 2024
 10:36:01 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 02/12] drm/xe: Introduce GGTT documentation
Date: Sat, 17 Aug 2024 06:35:45 -0400
Message-ID: <20240817103556.163783-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240817103556.163783-1-rodrigo.vivi@intel.com>
References: <20240817103556.163783-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::25) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SN7PR11MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: de034206-fee3-4604-eae4-08dcbea8635b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JZ3Qb32VRppPBil2cLuNAWZH94TZVgohUlBKk02539XKwa/4WqwC0vD2e/Hr?=
 =?us-ascii?Q?ZsLtdmftn7a8SksA3R/JtlRtrNYZO9iEgiOXoYWWmMYcCAqg0HTcMxodwvt3?=
 =?us-ascii?Q?SWs0RPuomFKWbys9FhXzsnbRS/gISv0ILpnMaJBH6VZybM5PfUn/z1QaBNpE?=
 =?us-ascii?Q?AjXcpVcmZfCzeM+RGPrxNuQpRS3FLDKc/j7Mm8aMI1xrA4Jg3gJUbQvFD3zB?=
 =?us-ascii?Q?iBd4U2QkTABNKffj2BFytX2EneIK5Y9MogwxkOYJMjWX3Pv0NraO1z6jVYgn?=
 =?us-ascii?Q?YMSyAekP7SXfIQ8XXECVt9T78JnBcHn1JSsJP7aIL7m0ZZpy+yb0nYiAefbi?=
 =?us-ascii?Q?Y+T1WcUGgWJCFZldzkMTvVbgvGeORNMP103rBW0BFpInY4wBW5jS3HDOOpGX?=
 =?us-ascii?Q?pEdgoijv5CnkvktQ5BFc2pFFAj25zAAjMEmjJvpgiVhLuCGNw1YxOT0PaaYW?=
 =?us-ascii?Q?WQ2Ac3VkJPw+BBWi+Rn3G+tmSsh/3qCwCskBLKrgyuAB5gqqX596lASRwDnI?=
 =?us-ascii?Q?0yTSKTXMmmwMqR9GpHNN9PkDcM1d/D7VdCBtfS2fZwixvS9WvSMGI3WoSQew?=
 =?us-ascii?Q?a+ljSWaZVhWaJ/crfy7EH9i+rACpIJYu3Yz6Uj5KSTfg1ap2DczpMDHOVF9W?=
 =?us-ascii?Q?Hf0lEYYFAFxlgXLIC6l/y2IbVCkXsbrCNn+oOtMDU/BJJnhjSiUj3yFA1TqH?=
 =?us-ascii?Q?iv+3Vj31Ppfyq5ud1QWAnk6EybgdzkBwWAAmu7gmRjAPcvQnIJOy95g6lorF?=
 =?us-ascii?Q?ybPkmaoYbPqk1xjgpbEaNwFLjv//PgOnbtB8FszYwGAxDUCDUmigQcj6vcuH?=
 =?us-ascii?Q?Grt+7YDS+zpNf8xqn96Y3FvoDtEzt2pBhN6yk+b/VCwDzMPH49vImaLJAldz?=
 =?us-ascii?Q?jjTlWDQAvKFrbTYYv4N5VckxTNbZU3OvS2+q2HB8PfBsV44Dfu31O0Dx/N8m?=
 =?us-ascii?Q?QItkjcoHLQmnn5pOpOjKur5oe8zb2Ij1HGuPXErv8+JB5aOOqxz6sToe6fRs?=
 =?us-ascii?Q?45zZJcXOLvh430o3jRr2W1ewOUrSXDEIHUKHOTSkDZgdiHC1yh9ZKIINW4AX?=
 =?us-ascii?Q?dcGUlwZSBDhZp42xehIzmloDvG78NjSTaLO7r+hY+Ho1uH40gv4I/VEXouHi?=
 =?us-ascii?Q?zX2pMdwBvss9YDk5micQp1xPbC5vLXW0n8ToQRkADRwXUOWzIOTacgGnZp4j?=
 =?us-ascii?Q?/TW0YORTzpxo1RYB7rp1p1nsfpuNEofPMd8C2dhLzPB/owt/kTvQATjgPuO8?=
 =?us-ascii?Q?pwsPWEYP8UZJ0l/G/Vl641SkdmjcB7tKWutYoq2DikVvjnq2lBF/qA9+IPUX?=
 =?us-ascii?Q?f+ojC7lWpWaF75XG5q3dZchJdkwBGIu1mpyuDgWN/X6IUA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IoKsleLSmWDG7RV0xWj6DMETHSMPvKC1336ik4w2IwZprFaf1H8Fx4I/JxhW?=
 =?us-ascii?Q?MkwNKui56/ho7tAaBv1MNlJpLDJbeNabyRbe0E50nclCBSsNTcabzKYq2U+5?=
 =?us-ascii?Q?gmG9EhrvMBDIjbsMqNGKtPzhFFLf491I9tBBSyLo9HTkAt01EXVPzugsMQBM?=
 =?us-ascii?Q?lgoXgScO36KBhso1B2MXX7clSRG6EfOwXgiU3w+pVCOy/W1zqsfV90+8V3zK?=
 =?us-ascii?Q?QZHzv8kaPB6awqJubh7NMcq/pXSkT4lcW603AoopyBl5KmkvGVCiNjHcfXgB?=
 =?us-ascii?Q?FEplPkYJFp69x7vzqp7i0AqJ0ECFmKR7Vi1O/PZ2jlQ13qqWX6VuQq3/N/7n?=
 =?us-ascii?Q?aZHbZyjm1r0E9Hk5eXO+b593UDJ+jjYWDmSg0uYZGCwDpW5QukE+5pvXzoNi?=
 =?us-ascii?Q?CCUIHiS5qF49cq6ogbUgwntVv/JWSckovCDgyg+nf8a4O5WgEnNL8D0C6FSa?=
 =?us-ascii?Q?Ftg7mTvBR1hv4e40cjPXI0vu4y8d1JmnC4uydAAo0cR3Np4f4wAq22NPeWtw?=
 =?us-ascii?Q?9rDNVW5RZ5ZZcg+hihOqCjBcWwhbEQVOuR9A+kkdyTwAXvYnFtaWGts08KdI?=
 =?us-ascii?Q?Iu6p8P/GsuB+t9YfpJlTUtWYHjK+7MIYnRsXsd2YQDEv91zTsq1x28Ok+0gI?=
 =?us-ascii?Q?tWPPcBiWMcM2Ct07tH1Aipm7crZjF4R8XK4T+REeQSyEgLQ9IqpujkB6um4T?=
 =?us-ascii?Q?jWnDYhISO6DOlBPZyi2PGCrVHoJZB93rUoWNoaTqKkebmR73/B7St9ZawPjT?=
 =?us-ascii?Q?/t//aMxo+g0wOa6bm6ETiY9vQqfRMawEYtnnEhDjOcVaJpIhLf8gn1dJiAQ9?=
 =?us-ascii?Q?YARBpCxw8eu5THgmyUSSZ+INyYtmo4u9YPgTpIdUW2oAy+oBugCJQp5e8MEf?=
 =?us-ascii?Q?+Rc1IeIYeeed9Zm7vwsZBEa9yZ+7U8KvKVm8vgYIbzPGAW4lsyn9riAed+4t?=
 =?us-ascii?Q?VKmrEyiVwA+tBtrzaUeAUxJYbp6LoL1tvtDpEdM/QiHk0VAW3VScJT6g4c3B?=
 =?us-ascii?Q?xor07sse9H/OPdKSX5CfF33/DzELO3b59LJbKWu75ECp0R+BW86Dgh5jNIO8?=
 =?us-ascii?Q?sz4kESpHAjZRU8tVsy24R4ArZ3axr5wOhtR8QjodI/fpSxd6bhxD/FRKzZoL?=
 =?us-ascii?Q?NvCTHWhexzc8LChX3OZmZUO3vRTU+cUtsDLrLKfq5SzZKYr8n2NXuk3eVdgF?=
 =?us-ascii?Q?3t4h6znfkHVGyXU0xEId36lH7NkdwhXqH2dIOtmy7LN7KcDBfzJIC2VosQSG?=
 =?us-ascii?Q?2XtspMxtUu86Qci5JKIb1/eWEuq4KOg4fAj0LZ0AcprLN69eJEtltT3tA3DC?=
 =?us-ascii?Q?zdGaYbs++2qyVOj5rZMD3FcSVET6xaThwWzme6VJQ66RDh1QJKtofzI3KGq5?=
 =?us-ascii?Q?AanC6ePvPGOtc7LJHuuGlwdDRd5mue1Q2i7buxwyTDCVWwwL8r5w0qwHb1i/?=
 =?us-ascii?Q?Id2VfeoBCuU7S7ZLucDz+7gHSaWB1vXvWtj0iQy3HFUNniXI2q5xdhRtsHTI?=
 =?us-ascii?Q?oeFvjl5/vwijTa+bkiBlPRBQ43/TEod2sMGMILZg/XspW4BEWqGplPDKgsau?=
 =?us-ascii?Q?xHENIPaET19m0JANf8mkHMoDmKlSxBm8B/WvSosDkCGhnDA+FGakdwR/G9jZ?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de034206-fee3-4604-eae4-08dcbea8635b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2024 10:36:01.2591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +7S9TRJ8sDQ+uCyTT7WVu54C35qFdXMD14Qv8gHMWqT5ovgkUg+WlS2X0iegFndzzx4x8XYCzC4LOSF13zbp7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6679
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

Document xe_ggtt and ensure it is part of the built kernel docs.

v2: - Accepted all Michal's suggestions
    - Rebased on top of new set_pte per platform/wa function pointer
v3: - Typos and other acronym fixes (Michal)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> #v1
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/xe/xe_mm.rst     |  15 ++++
 drivers/gpu/drm/xe/xe_ggtt.c       | 136 +++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_ggtt_types.h |  34 ++++++--
 3 files changed, 150 insertions(+), 35 deletions(-)

diff --git a/Documentation/gpu/xe/xe_mm.rst b/Documentation/gpu/xe/xe_mm.rst
index 6c8fd8b4a466..95864a4502dd 100644
--- a/Documentation/gpu/xe/xe_mm.rst
+++ b/Documentation/gpu/xe/xe_mm.rst
@@ -7,6 +7,21 @@ Memory Management
 .. kernel-doc:: drivers/gpu/drm/xe/xe_bo_doc.h
    :doc: Buffer Objects (BO)
 
+GGTT
+====
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_ggtt.c
+   :doc: Global Graphics Translation Table (GGTT)
+
+GGTT Internal API
+-----------------
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_ggtt_types.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_ggtt.c
+   :internal:
+
 Pagetable building
 ==================
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index add14f3dea1f..dd5cd0df705c 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -30,6 +30,39 @@
 #include "xe_wa.h"
 #include "xe_wopcm.h"
 
+/**
+ * DOC: Global Graphics Translation Table (GGTT)
+ *
+ * Xe GGTT implements the support for a Global Virtual Address space that is used
+ * for resources that are accessible to privileged (i.e. kernel-mode) processes,
+ * and not tied to a specific user-level process. For example, the Graphics
+ * micro-Controller (GuC) and Display Engine (if present) utilize this Global
+ * address space.
+ *
+ * The Global GTT (GGTT) translates from the Global virtual address to a physical
+ * address that can be accessed by HW. The GGTT is a flat, single-level table.
+ *
+ * Xe implements a simplified version of the GGTT specifically managing only a
+ * certain range of it that goes from the Write Once Protected Content Memory (WOPCM)
+ * Layout to a predefined GUC_GGTT_TOP. This approach avoids complications related to
+ * the GuC (Graphics Microcontroller) hardware limitations. The GuC address space
+ * is limited on both ends of the GGTT, because the GuC shim HW redirects
+ * accesses to those addresses to other HW areas instead of going through the
+ * GGTT. On the bottom end, the GuC can't access offsets below the WOPCM size,
+ * while on the top side the limit is fixed at GUC_GGTT_TOP. To keep things
+ * simple, instead of checking each object to see if they are accessed by GuC or
+ * not, we just exclude those areas from the allocator. Additionally, to simplify
+ * the driver load, we use the maximum WOPCM size in this logic instead of the
+ * programmed one, so we don't need to wait until the actual size to be
+ * programmed is determined (which requires FW fetch) before initializing the
+ * GGTT. These simplifications might waste space in the GGTT (about 20-25 MBs
+ * depending on the platform) but we can live with this. Another benefit of this
+ * is the GuC bootrom can't access anything below the WOPCM max size so anything
+ * the bootrom needs to access (e.g. a RSA key) needs to be placed in the GGTT
+ * above the WOPCM max size. Starting the GGTT allocations above the WOPCM max
+ * give us the correct placement for free.
+ */
+
 static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
 				   u16 pat_index)
 {
@@ -164,12 +197,16 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 	.ggtt_set_pte = xe_ggtt_set_pte_and_flush,
 };
 
-/*
- * Early GGTT initialization, which allows to create new mappings usable by the
- * GuC.
- * Mappings are not usable by the HW engines, as it doesn't have scratch /
+/**
+ * xe_ggtt_init_early - Early GGTT initialization
+ * @ggtt: the &xe_ggtt to be initialized
+ *
+ * It allows to create new mappings usable by the GuC.
+ * Mappings are not usable by the HW engines, as it doesn't have scratch nor
  * initial clear done to it yet. That will happen in the regular, non-early
- * GGTT init.
+ * GGTT initialization.
+ *
+ * Return: 0 on success or a negative error code on failure.
  */
 int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 {
@@ -194,29 +231,6 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 		ggtt->flags |= XE_GGTT_FLAGS_64K;
 
-	/*
-	 * 8B per entry, each points to a 4KB page.
-	 *
-	 * The GuC address space is limited on both ends of the GGTT, because
-	 * the GuC shim HW redirects accesses to those addresses to other HW
-	 * areas instead of going through the GGTT. On the bottom end, the GuC
-	 * can't access offsets below the WOPCM size, while on the top side the
-	 * limit is fixed at GUC_GGTT_TOP. To keep things simple, instead of
-	 * checking each object to see if they are accessed by GuC or not, we
-	 * just exclude those areas from the allocator. Additionally, to
-	 * simplify the driver load, we use the maximum WOPCM size in this logic
-	 * instead of the programmed one, so we don't need to wait until the
-	 * actual size to be programmed is determined (which requires FW fetch)
-	 * before initializing the GGTT. These simplifications might waste space
-	 * in the GGTT (about 20-25 MBs depending on the platform) but we can
-	 * live with this.
-	 *
-	 * Another benifit of this is the GuC bootrom can't access anything
-	 * below the WOPCM max size so anything the bootom needs to access (e.g.
-	 * a RSA key) needs to be placed in the GGTT above the WOPCM max size.
-	 * Starting the GGTT allocations above the WOPCM max give us the correct
-	 * placement for free.
-	 */
 	if (ggtt->size > GUC_GGTT_TOP)
 		ggtt->size = GUC_GGTT_TOP;
 
@@ -262,6 +276,12 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	mutex_unlock(&ggtt->lock);
 }
 
+/**
+ * xe_ggtt_init - Regular non-early GGTT initialization
+ * @ggtt: the &xe_ggtt to be initialized
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_init(struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
@@ -382,6 +402,18 @@ void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node)
 	mutex_unlock(&ggtt->lock);
 }
 
+/**
+ * xe_ggtt_insert_special_node_locked - Locked version to insert a &drm_mm_node into the GGTT
+ * @ggtt: the &xe_ggtt where node will be inserted
+ * @node: the &drm_mm_node to be inserted
+ * @size: size of the node
+ * @align: alignment constrain of the node
+ * @mm_flags: flags to control the node behavior
+ *
+ * To be used in cases where ggtt->lock is already taken.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 				       u32 size, u32 align, u32 mm_flags)
 {
@@ -389,6 +421,15 @@ int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct drm_mm_node
 					  mm_flags);
 }
 
+/**
+ * xe_ggtt_insert_special_node - Insert a &drm_mm_node into the GGTT
+ * @ggtt: the &xe_ggtt where node will be inserted
+ * @node: the &drm_mm_node to be inserted
+ * @size: size of the node
+ * @align: alignment constrain of the node
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 				u32 size, u32 align)
 {
@@ -402,6 +443,11 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 	return ret;
 }
 
+/**
+ * xe_ggtt_map_bo - Map the BO into GGTT
+ * @ggtt: the &xe_ggtt where node will be mapped
+ * @bo: the &xe_bo to be mapped
+ */
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
@@ -449,17 +495,39 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	return err;
 }
 
+/**
+ * xe_ggtt_insert_bo_at - Insert BO at a specific GGTT space
+ * @ggtt: the &xe_ggtt where bo will be inserted
+ * @bo: the &xe_bo to be inserted
+ * @start: address where it will be inserted
+ * @end: end of the range where it will be inserted
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 			 u64 start, u64 end)
 {
 	return __xe_ggtt_insert_bo_at(ggtt, bo, start, end);
 }
 
+/**
+ * xe_ggtt_insert_bo - Insert BO into GGTT
+ * @ggtt: the &xe_ggtt where bo will be inserted
+ * @bo: the &xe_bo to be inserted
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
 }
 
+/**
+ * xe_ggtt_remove_node - Remove a &drm_mm_node from the GGTT
+ * @ggtt: the &xe_ggtt where node will be removed
+ * @node: the &drm_mm_node to be removed
+ * @invalidate: if node needs invalidation upon removal
+ */
 void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 			 bool invalidate)
 {
@@ -488,6 +556,11 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 	drm_dev_exit(idx);
 }
 
+/**
+ * xe_ggtt_remove_bo - Remove a BO from the GGTT
+ * @ggtt: the &xe_ggtt where node will be removed
+ * @bo: the &xe_bo to be removed
+ */
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	if (XE_WARN_ON(!bo->ggtt_node.size))
@@ -544,6 +617,13 @@ void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vf
 }
 #endif
 
+/**
+ * xe_ggtt_dump - Dump GGTT for debug
+ * @ggtt: the &xe_ggtt to be dumped
+ * @p: the &drm_mm_printer helper handle to be used to dump the information
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index 2245d88d8f39..154de298a4e3 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -13,30 +13,50 @@
 struct xe_bo;
 struct xe_gt;
 
+/**
+ * struct xe_ggtt - Main GGTT struct
+ *
+ * In general, each tile can contains its own Global Graphics Translation Table
+ * (GGTT) instance.
+ */
 struct xe_ggtt {
+	/** @tile: Back pointer to tile where this GGTT belongs */
 	struct xe_tile *tile;
-
+	/** @size: Total size of this GGTT */
 	u64 size;
 
 #define XE_GGTT_FLAGS_64K BIT(0)
+	/**
+	 * @flags: Flags for this GGTT
+	 * Acceptable flags:
+	 * - %XE_GGTT_FLAGS_64K - if PTE size is 64K. Otherwise, regular is 4K.
+	 */
 	unsigned int flags;
-
+	/** @scratch: Internal object allocation used as a scratch page */
 	struct xe_bo *scratch;
-
+	/** @lock: Mutex lock to protect GGTT data */
 	struct mutex lock;
-
+	/**
+	 *  @gsm: The iomem pointer to the actual location of the translation
+	 * table located in the GSM for easy PTE manipulation
+	 */
 	u64 __iomem *gsm;
-
+	/** @pt_ops: Page Table operations per platform */
 	const struct xe_ggtt_pt_ops *pt_ops;
-
+	/** @mm: The memory manager used to manage individual GGTT allocations */
 	struct drm_mm mm;
-
 	/** @access_count: counts GGTT writes */
 	unsigned int access_count;
 };
 
+/**
+ * struct xe_ggtt_pt_ops - GGTT Page table operations
+ * Which can vary from platform to platform.
+ */
 struct xe_ggtt_pt_ops {
+	/** @pte_encode_bo: Encode PTE address for a given BO */
 	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
+	/** @ggtt_set_pte: Directly write into GGTT's PTE */
 	void (*ggtt_set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
 };
 
-- 
2.46.0

