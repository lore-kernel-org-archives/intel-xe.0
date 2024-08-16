Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCEFC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 15:03:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D66A710E7DD;
	Fri, 16 Aug 2024 15:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="isGS1NHs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E9810E7E2
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 15:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723820583; x=1755356583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Fij2zguv6ZuXHVDpcjuqFZMVnQ5AZ12pXxacHabxtTA=;
 b=isGS1NHsGiIW6LsNM9lLZG6oI8gJD1U4OtCZE9kTZ+QnJLeAULOVtV4S
 pm045S441nlpd821NXB/yPZgigugV6QDZd4/H5eyw9Bh4BUyiYCDptMgM
 Juh98hmor2oCaeSGiG0nG25b0p3bUH92vWvPnnSlZyt6kLGNZuBKubDE+
 SvJgPG2pQYzXY3n9i1eI/2L7mH4i3lTECsZdPKKSI2C0IvV8KX91mxBP0
 hWtmN0NYmSWhyB/15x9oR2wd7YWRVrWZJ5nD1s+q8aRYtW1HuGwdcuui3
 NsMDEJw/efpHZ7jdR2hL0TuAJqGW+Y7uSKEP9G2pUKcdmTQ34aqtjIlP0 A==;
X-CSE-ConnectionGUID: n0ZwMo+0Q/2DxudAAa9Dyg==
X-CSE-MsgGUID: dlr9lN2iTFmG3e7/V153Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="13054366"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="13054366"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 08:03:02 -0700
X-CSE-ConnectionGUID: ekpxZsCnRpG6871zrmrpxg==
X-CSE-MsgGUID: 2IAgo0LIR3yZFkcvaWxx9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="59384087"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 08:03:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 08:03:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 08:03:01 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 08:03:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZDOClny4xxCyXSWTA9m8VQeDtCXaXVVRhVIbwsXLHhDYtWII/GmM3c34fBbrmxZSycpS4UzyMKKsVo3/5VLSOOAtQT5QwB2eqVjyNzSb4s+70FxuvXjTI+brfhCAvV3iL624P9i2g2SDvmxSiY+pBQemkS7QlnSl/RyKw6R3zAof7Ups+EuaFoTCtB7YeYPtAKxhjXijxWAlq2O0x99UT6rMWggyh6nlEgTqztr2xDgix1Zp9nyY3HqIVxzm0R9+Vb7opYBrjzcoVa+NLCwhHvU/OBUqjUgGIeRgouaZzz3DbT6+rkFad3qUFWiOT5zgLD1z5EtgpbVuPMJ58Gt+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNS8PU8sBu2nEvuBKtH5uvVrs2cjIro+V3KD3u94Ldg=;
 b=SuGPNftMp4ZKzi5JKjyAdIggHVSsktDhRmTEWs3b8v81d/WhSNpu8mFhr/FGyNSijV7Id/Owh0P/GRg0P+llp9XRpD4GIXwV+cv2lc2Q3pmKsQbs4z0Eo8RGLLPwRxXIRCGnHHyrKNjCFMhSKZO2Xr7zveqflJbszM5kTa6AQf9Xux8/Kw2oaCF2aTSNxlTVaiGgTy2il3SXwMj/+ijpzZ5TFotRDQUyeHRiRFxpyOOvzTzT7EXC5noRKsWC1mHE/sOOJuvvopOsMN22OYapZEPmWy6/uPAWMZW7LGaVg2SIT8w9FAWZvVNKrl8M2Ttcr3PMN9VBXOu3hjF8iCGSMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by LV3PR11MB8554.namprd11.prod.outlook.com (2603:10b6:408:1bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Fri, 16 Aug
 2024 15:02:53 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Fri, 16 Aug 2024
 15:02:53 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 02/12] drm/xe: Introduce GGTT documentation
Date: Fri, 16 Aug 2024 11:02:33 -0400
Message-ID: <20240816150243.87596-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816150243.87596-1-rodrigo.vivi@intel.com>
References: <20240816150243.87596-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0179.namprd03.prod.outlook.com
 (2603:10b6:a03:338::34) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|LV3PR11MB8554:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bc66bd6-79ed-47ff-8fd1-08dcbe0480b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QH94n3JqHMHjNv7EkDEOwlLNnygqtUEJVWezP/2TSRnAqGd7FjRJNmknSqcq?=
 =?us-ascii?Q?MIv8oLO0nX7DpAW8vIalrTngns7kkE98rrZ3uL+VB0D/JPvGwXLmG1pK+asc?=
 =?us-ascii?Q?NH8n6JLgxjeXbR26xTunmZIFp2ahKWLn54/rIoQPHn8O5gtPu+FgGSgr+V3f?=
 =?us-ascii?Q?h1TYSuhWXgyTG6Lu8rCYbL1kQSpFZpN2ArDYU9h3nTKuQXroAuefpJDeeEmM?=
 =?us-ascii?Q?aD+sM0C0d531t+QyLNTlU6iuoIkM6gWjvHsjEtEzwLsUwElAgHM8mQb1N4yt?=
 =?us-ascii?Q?LgC08qdhqAUoh5dyqNIkkfaqTPmT9E7//WgEWGBXMjhg2Smt1c3k1Ap4w+5t?=
 =?us-ascii?Q?o4tThC6qx+Y/hpaCK7OD3XXoArHMdjWXPJKOYiQSyONjZK5mAYhFrfzwEzDx?=
 =?us-ascii?Q?mG+cv3DbIujpIB+Ns93Lc0AA+YQNINpSA5csmgtW2fdXRKY56DKsWa3FB27S?=
 =?us-ascii?Q?wg/GZBK0afGl8GvHUzhBBupSQljP7z9Q4BCOuDtMUNyVOLPNojFGZKhTZqGW?=
 =?us-ascii?Q?ONCoeE9u7jHfl/18aTxZsmtF47ooZ0zgDp4tKhaJd5vi62gm17M0JgIav2iC?=
 =?us-ascii?Q?Twm0pezAlh+WdiOaW5rU8x4qi10TKoP0FfUFLZsnPC8XnRYOfva8BR2TD/ww?=
 =?us-ascii?Q?mzwmrcjDKr9mSR3TXbGVyt6S+jXysPlqFSvw71GedWC6Q5kPTd7Dnbyt9sXb?=
 =?us-ascii?Q?SFZ4wsagoFQ6lpj7deCGRJVh7idXFrrfib9st/NHWn7plS2V+3Z7EAxK7Wwl?=
 =?us-ascii?Q?N7EBFNn29G59e+VbsRJ88AWj+FqOZSU1V5fQ1TTE5ctLt2m3JeEszONq9OhT?=
 =?us-ascii?Q?zYF16glZsqJA63kc0chGFdqZ3HuR6TdOHr8f71vNZTuz8exBpzO0XJXdwb/u?=
 =?us-ascii?Q?8gSqUcrad8s47TyZZ5oKyIRZi6Cm308qyIoEODuSFX4UdeMKeYFAaTPs5Yxn?=
 =?us-ascii?Q?NKvGrExomfwvXLWua5OueZAt01wGzJ5ZnmtodxgA0tRhObJ4HXNL2y6ACZwx?=
 =?us-ascii?Q?FPgm15AhK5WMlBpvjZcoXkpEfKUCAf7QxesytfT27CzlIrzYjVWe4fAIM7LY?=
 =?us-ascii?Q?TQIqBhRkvcG218vxPuHtJ3mINVnkFFkzY0nwIgOHNCLyieGj8+hzU1fs5+Os?=
 =?us-ascii?Q?HSwxnvekiqqXfqh9K8D+f/wXkEuAATqm4MhuYhVHO+wVeJ5UVuxzHED4dlF3?=
 =?us-ascii?Q?tqc5dLr3lDtr72gXynx3yA8APD1QZMDsA4YlfUbFLPDD3mX+DfrtC76IThJ0?=
 =?us-ascii?Q?DgxaNrlwuoaGt/G4iO1PVRJFPqLk8N/hcK4IoIatryUzh6pX4EXE0a0CiRTs?=
 =?us-ascii?Q?FNiugKVdK0q6lPYa4vPjxFAcB+o6mhgKbX97ytOo2ipW/A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NUHDwizoxlR5GNEUVhWfo64Jb9hieQdTb/hu7w4mNan4BrEuG6PSdzsEFF/Q?=
 =?us-ascii?Q?B1dhkDJWGf5fnnbuC7UNGTZl6ANAgNlFgT7B8grcBdBZYG9a7GQgi7yD1A3w?=
 =?us-ascii?Q?Ux3xHps8kQe70uaHhP5r4bdnBcB5eJxKvhdL6zM9ineouDCzr72ZkBpmrRCP?=
 =?us-ascii?Q?VXR7hS+Gj6vLe3y1rh6G1VmGMWrPJyBg4qKkOssDeyNCbV6CmRf2cjWkeulU?=
 =?us-ascii?Q?HdWbir1DyT9uYMf+POl9I7o39X97RIlsAR7fSjjckTJF7UuKcRkdrGigL75z?=
 =?us-ascii?Q?ilMv5R64VGdGd0UjrApT3JbbVe9TKd0yLj/c6Bjytv0IMIy3kWoOS+ZwVau0?=
 =?us-ascii?Q?aOe1nEiCLIYBZhJh5yLXJ3TngnXX9VK3CvB7Vuy+21MzNVyPEd7TF8ixUzjq?=
 =?us-ascii?Q?/QFwfIDWOaYMCBJc4jxhIs73ts6R1wVhb6i2Q1LEBgw3L5E0uy0PnhnivyTl?=
 =?us-ascii?Q?PiUOJ0tUze30GV5zZjlMh9Kv41kp9Yx3sK3wxzMSVHHk2HhsOSuHSOWCv22r?=
 =?us-ascii?Q?P2+f3vd2TEzGWLpZiMQ7PTnNfQfAWhIqP6PqPZnb4QEaO3iZkDt65GjLLLHA?=
 =?us-ascii?Q?FxeAQzJvRCI+efEEAFTQufMnpCwGsNuXjqvNW/AD0FNYohqE9sLyF/6Mbvuz?=
 =?us-ascii?Q?qOrp+6byWb8zkvV7BNykIOzz8H4WMjIhR1lRMTaiekE+DF2fxde+rbjlpybI?=
 =?us-ascii?Q?7QB0gQfkWt0TyHV+N7/SA6F0DhyHxV2RshXAzFySm6YuwkzHb3iWyymD/ZF9?=
 =?us-ascii?Q?Ps9R5YK+fIeju5+laypID2NT9weeUWFXi03Hj7kc2Fm4XlV61970BqLftYte?=
 =?us-ascii?Q?kXGss6nG1J7z+Dr0Maa4QKw3WikB7O8CzNstRtLxDJbeqI/U2oZB6GlNTZxt?=
 =?us-ascii?Q?vZ8amTzYFPJyBSr8ZIdYmCsQhEQm9rFeC3Tl5LhNzmtwNbTaJ1hGk6hbTwtt?=
 =?us-ascii?Q?BbKsth811V4SJNPIT7BZAr9Ef64i3F9SIHxOdB/gNOcoejCSQDenOQi5+Q1x?=
 =?us-ascii?Q?m/3t/RSK/idheBzylqlV0tFNLXzbnpTCJN6xJ7uGHBCne/ru78QvGayldheA?=
 =?us-ascii?Q?Zm8OOOYA2BtpYUZE4anKpWKBkjVTPIzDu2aKXJu4l/uSdolpQAI1XzLV4ugR?=
 =?us-ascii?Q?i/WG5J3Ncg4bjyPip3lzyu9ggwJdN6p3VlHV/Rl9yp1qom188ou9/ljxBM1F?=
 =?us-ascii?Q?TYgeQxOWyv9aC4z5pn9wGLhAeWbCuiYWCBVKLeQ+003BvK1CI8EXINrh2aPK?=
 =?us-ascii?Q?yICxfZMasWNaA4LzXeR9PtdCMHDQxSQ8/oPWbfjBPxqRwnZGa+K3Vz4VJog6?=
 =?us-ascii?Q?7EoT8TJTi8W3eY86s23czFfAE5h/uXa72fsHDn1YuiTSFp/vhsJ5v4lAMiVD?=
 =?us-ascii?Q?ty9xLmNEjSes8AtA4mtG6fVl+JQ5lYOz+bMjkr3xNl49cnciLlAjTiNA1etb?=
 =?us-ascii?Q?GSZWrUPDWUcmNgEKjlwSjpCKHcWWNDIjxSgh6luuw4qjgKHhfNi0FfExro8s?=
 =?us-ascii?Q?8tBIIJJdOXGJN2VrTW+XZiPGe2emsO61ZKqvt8uGF+BPAiq1t3yu2h/p9RaM?=
 =?us-ascii?Q?pxSbNWQyywpRKV7I8tLqPsY4XwOGEHcd2xY0D77qWX+rducAy1KJPfohsb45?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc66bd6-79ed-47ff-8fd1-08dcbe0480b1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 15:02:52.9812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9BEBPoGcKlqauJv3TOAlNfl7aaSWoVT3yNcY+acgr8LJNsAblyQsjDysnbEp6351dYtUSUKqUlVc976v0UkotQ==
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

Document xe_ggtt and ensure it is part of the built kernel docs.

v2: - Accepted all Michal's suggestions
    - Rebased on top of new set_pte per platform/wa function pointer
v3: - Typos and other acronym fixes (Michal)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> #v1
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

