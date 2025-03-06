Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34AEC28B24
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 21:36:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A239910EA94;
	Thu,  6 Mar 2025 21:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nOAn6as3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FC510EA93
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 21:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741296985; x=1772832985;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=OgEeAV4zzcCWjP13f7gAZEwTayBdb4sk6FIldj0t9V8=;
 b=nOAn6as3wmrm7A84M45P4et3qoTvBdd0z/OgPvIAdp1VnIv50PuzA0Eh
 T7e0iT1tW0fva6xRd6F22j2svvYEj6CO3otp+k81YoseuAAFI5l4wu4q2
 f/oSJCWHCAr68zPazz3miBwh7pIRXYbakgfW6dNcFQ91r9LxpXUenUAOl
 63NORlMnf8+gxVeQjT7akwnjQYr7W9j//uiFsT7BJdZZJjZCKuHnYLdxl
 4uag5onKvtsA9N/yzJa6QOeEIy1ZebWH3fvlxKzfhCVRu1cBmeOAA+cJH
 iuh37E03WArjzomrwvYbDIzQ7yxooUFzP3neM3eAl0XH6xPa3EY9OK3gR w==;
X-CSE-ConnectionGUID: /HrnvuW4RnmsUVqQrlEAxQ==
X-CSE-MsgGUID: Z3VJ2BCcRXiLTIXqjmbtBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52976569"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="52976569"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 13:36:25 -0800
X-CSE-ConnectionGUID: NiD11FXWRnKlVEEJg/P+2g==
X-CSE-MsgGUID: umKij9zSST6zpiMsQcpFqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119658623"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 13:36:25 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 6 Mar 2025 13:36:24 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 13:36:24 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 13:36:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ESY6fCw6iSXEDPJEv+O8hkagA5q7rnyhjW95zVmeXjhxLOcLzP6NE8WX0sqjxHuOlO9x1HVfl7qJQ7L6nPtjFt4Lj82IhIhGdKQPF/V3QgjpUrsA3YKWrfzL9DVr0HT/le1y4omGQZn4nwswnl8w5lwrcxLS4qD3rdstXI4Z1/WDtr4N8JijmoABQZrVYFohMm4KSezFjpHHv5/Bl1vNYtCDHDtavJLJB0fGs6MqCNuY3Lg8sxkonEoZGfgN7dH4/XuHToD6peBaYKqZVw/pyL4Q19c2ZJH7Lxik0eOKfZ4tCG16jNzltwYCwgQtGTX8ZdWXAfXo1+DT4cQmKIWAZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ss8awtxtD0NwnaHAEXw2jLp6aDDTOu+8Pu3FLwe08Hw=;
 b=NVb9jCu8Mi0qiY3/1hWGreE8nygXMy3JmTkTRW2E685iwF+ctSl2ede64tTfPooKilFXgx8APtFmlZUvCt/cm2BErLXn4E8449NoSQIqE0jyoxtovkNaM5ozHrTPTXgMB2KmJcV8TIaUa5p+IJZzO1u1p3otShaE/CaaruwPmfWAizOKLE8SD3vqUWB/6LyeuuQGKIL4uWAH+s/X0MAehOYi9rp7c92KpLhRM0wrvrMF0M4vgLim91MePZcpJrPQULzYb7BTYUuSz4yKNV5wYHlLm5ug+nT1Ontbfdo2mZHA9ojGHpXg+jAAH5KOsIk35/c53rPkhClQXDWc30DAjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 21:36:21 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 21:36:21 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Karthik Poosa
 <karthik.poosa@intel.com>
Subject: [PATCH 1/2] drm/xe/pm: Temporarily disable D3Cold on BMG
Date: Thu, 6 Mar 2025 16:36:14 -0500
Message-ID: <20250306213615.1004502-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306213615.1004502-1-rodrigo.vivi@intel.com>
References: <20250306213615.1004502-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0389.namprd04.prod.outlook.com
 (2603:10b6:303:81::34) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB6006:EE_
X-MS-Office365-Filtering-Correlation-Id: 21bdb6d2-f960-43e7-5284-08dd5cf6f012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XDIB7mN5iKiqGQ5idRdlmqdAMHOFL4VNv7GYlCzrXuKoMPR6HRN+quu32OPe?=
 =?us-ascii?Q?wShvz0ag8JSl7H8PSmFOwP4P7aqmVKKyUCvL4Z+p27Jf3/tbK1xKq3nsTVsW?=
 =?us-ascii?Q?tP/0UlIBAB+n4Ot43Xpe71B0uEQkh74VF0fBbnE7Hw6L+zLDUC3QVlHP4rCW?=
 =?us-ascii?Q?PBBxfPt1eU0hDRieVWUNnb0uyazfpc/WaVJ7aMhxQld0ACLH60GvKaK40JXh?=
 =?us-ascii?Q?C5xdLRlIel0QnRJMEbSyxHHS4afaAOX7xlKSIScxrDijebl/AVXYaMvmnjZ5?=
 =?us-ascii?Q?nWLl1rct7lrjgNeuqOlXsL9+o5xHf5oZXmk5YMjy3hMj05sFPjyVTk9ZXSbJ?=
 =?us-ascii?Q?HJyjtxPawt8So2laVPprHbdI6dNB3QAMKOIVpnQN2SAwyZRdRf+LKloThM7J?=
 =?us-ascii?Q?EkwssNu/FefRU85zfNCuNfHZ+tmJOQFGMALZpouqQ5qomWZH5r+OIwM4iSzl?=
 =?us-ascii?Q?E0MlyAC4Eb5hND0Avn6IgAMXPAuypy7HuDGTCLuhvRrM0Kl9XtttRIc13dU5?=
 =?us-ascii?Q?2xJ1Cp+rJq6nlyuUQcMNbqNpYvAP0wjazhyzUHOlNjBKs/3cDBASXrtUb0r1?=
 =?us-ascii?Q?6JEf7+bQXBhm8pI1zbaqe0AFlH6qCazKwDIXprVRJ4A1qnvry6jcy0wxgcnI?=
 =?us-ascii?Q?21tzb76HLudO6wQVfAkfb3mbhhbQC0vAy4gxZYVSiyX2ChiRQkEVBTsD1MMW?=
 =?us-ascii?Q?ken6GDDgpVlAa9EifFGXUI8CcIEeNKsIhzUPeTB5PP3hmepw0ikmd5kZDsIN?=
 =?us-ascii?Q?ZllJXGjniYXkp1kUoATV4isoZVU1gMLoyBd1dtdi3OVv22NgHwfiLvkPWpcH?=
 =?us-ascii?Q?j6lPescXucQ4nlHi8YbuuuS+vqubvoCfvxQlpizeAguHDCl1PdjrO/FOW2iT?=
 =?us-ascii?Q?pPd5asNLKtOnHAMUwEPnbmiJMTO0rIEAK0rX5RjpqigTNDEj790qKLuMdsch?=
 =?us-ascii?Q?633PntkxGFcPAgilEj2J06xrtj6vemYP0YJX/4wOnKR/9BFcgf7N+yFzCu9t?=
 =?us-ascii?Q?9V8frvfnBKL7G4WT+wQ0zKjOlu7ndh9QqJGXHNO0BdLpz64czmrhLEJP4JSQ?=
 =?us-ascii?Q?m3EkeHVwyMOZS7U0UrrL1v3cajNoG9x3c+1X0xqOnfnwykz3BmEtWCWyMWCS?=
 =?us-ascii?Q?AqPzI9hSkHiwjAJgRBLbfajq3f6do1ZKiifamB9hUfIy6kixNkSwBEb7471T?=
 =?us-ascii?Q?eNfW//nHKdcR+KOPJfa069fttX3T4TMVe6cC+7+/WQnCVOCR/DSeADIZfrbP?=
 =?us-ascii?Q?F9vqe0DyfAqhBQjaDRMG/Cr4Topvdxk9fBFO+ZmxPbhnARjcEU6RC+QhqkqD?=
 =?us-ascii?Q?WVz9161UI2z7WVbkH5qbzQ5dMg6bi3DRUCd+ZoAh3FFWMw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e/uohgWhnYUX/oBbrxP4pWbiNN9XuEEZFnE0sw9v/RKzNTJyBYAQ/kMqQ0oA?=
 =?us-ascii?Q?mpBGYm0eo2ZSnVEK8iEI7QSuKDvM6dvkGendxhFN8L//BB1jjMz3Ie3nZcwb?=
 =?us-ascii?Q?/UTGhQfg46kZSbcSBfh2mR+PZ8IhryAnIeFvLPBi29vygeZEOwkU/pmiBXmE?=
 =?us-ascii?Q?fYQhZh72/GIqlfiMlAuEoi+HNF+lDGk9An/iy9Yj4utxMCXhBrpCTyEvWWVw?=
 =?us-ascii?Q?Wanb+PexxACRoHjWazThXTIa2G/6Y64T00vRv+u94MXiY/cuUQOSCjAvENby?=
 =?us-ascii?Q?Lf4sd92eQpfIHmnDXyOMMcFlEAzDlOL6xHCF5JYEmIh2qQSKgaxfxbSnsmp6?=
 =?us-ascii?Q?9BK7aDV0zDpzjaY5OPbYY/RZkdB+0PkOFG/L+wqOtRUGrvrWyMEaMz1wIgaZ?=
 =?us-ascii?Q?w8bWEJZgP705hgPk5IUxLI2LpWseKEx9onEMSy3j+cq52Bz9GBJP8ypjnC/F?=
 =?us-ascii?Q?UAQC/wMMr7Bkf/T9a8+8G2Qo75Z/MsM5MaSv5sZ3LnZGzwnlKyC+05U/eEHS?=
 =?us-ascii?Q?Z6cUg0q5znv4H/ahTJQ1V4RE0zpqT2l7cq9clAdfzUGbSJG3Lxul1UDLBGss?=
 =?us-ascii?Q?eKfFNK5615a8V4+ApMgfGXxJisrqRXbtQda3IZL7rAvaJBiO4MQaNxw0FGvl?=
 =?us-ascii?Q?1joGgB449br+9sbZTZqHYLoxeACTtGv4lMz+nhXDBDAX1EnRVJgsgmEOmB4C?=
 =?us-ascii?Q?A0XE3Qa4dOz5u6I7vt0uAYgX69o9FA5yR3Dt2TMmsmr/Rn+v3IHsnt5J/Mtf?=
 =?us-ascii?Q?c+nLCYZoZXetAiKA9gY2QNwMDhxXStei+B9Bqvf5L+QkB/DnJSx35R0bNG3Q?=
 =?us-ascii?Q?XEgER0INquzhgnpOLUjHMda1lTlcwaYmO4J78iuWV5SK1NQz3w83xWgk6Ivv?=
 =?us-ascii?Q?DjzR5fbAjPHBu5JEwtDvYFJ892XH3TGjGsUjukTk8knGtgaWy6CYo9NaU5tG?=
 =?us-ascii?Q?wqNor2CosTo4Upg+Kz/uhSLurWRAtvYWFkPi7ZMpderwPM3P5NrRVhSOqJqS?=
 =?us-ascii?Q?GS80cyDC1L2qE3pkPYh5siURvfk3NqZBafSUpB8C0U2tGg7lk/2VYuYcOJ2m?=
 =?us-ascii?Q?gL38UghZtrKPNdlouP7fKwMeqvxAmqRxbnW+y9uAwPZ/VsEhfUcdVlT6L9I1?=
 =?us-ascii?Q?HW7rd+21RNd+0X+nlFEFGZ92YVaXL108awtduX0Ykd9ydcviCQ6P4hkkSK+E?=
 =?us-ascii?Q?WCFM5oGStAXCCnLECEIzxBuq3L6TuL5fx2vqje5NZQ0/dltP1RtZvK/3kBNJ?=
 =?us-ascii?Q?oKOw+Q/QlMyaDTJKndB2PjkBl5oFb1YoJ4UQKKfph97taAfi9Z3Z1b6eb06d?=
 =?us-ascii?Q?fwNfFfkwGBJrkXro1vTn2nkmzaKQjPyC6q4tp7HTNvHxOnZbtbBo2XeJCuFH?=
 =?us-ascii?Q?joS4sAgeV72JWQR6/th2tFkgcp39X/rJZYycaSh41OQrPseiWF3eI2VUs9Lv?=
 =?us-ascii?Q?Upf5c4u+hIG4OlmNin7UFW0xRsWQdmA4rGx1hVX+yGnyJ6Vd0fv7avAqXgzY?=
 =?us-ascii?Q?QBrcpL5LJR4mk6AIUyEC088PWnHeZGIipVPXRObn2ZIxxQI7BMmEsVJHthCt?=
 =?us-ascii?Q?z8iACz5kyPKdMNwAHMEFsgQnYK3Oac49Xb8589kjouO458Y/Ysk3e9gGT2qF?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21bdb6d2-f960-43e7-5284-08dd5cf6f012
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 21:36:21.7491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yKeroos+52APtzKuhnnY14yUL5z4Kpm0YfqKFYNpSqz8Sail4QJxsIvqfR9hC3Zf2IpYKqCBG4ig3jOlY979xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6006
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

Currently, many instability cases related to D3Cold -> D0 transition
on BMG are under investigation. Among them some bad cases where
the device is lost after 1 to 3 transitions from D3Cold to D0
on the runtime pm, with pcieport upstream bridge port link retrain
failure.

In other cases, it works fine, but with some sudden random memory
corruptions after D3cold, that could be 0xffff missed ack on GT
forcewake or GuC reload related failures.

In some other cases though, D3Cold -> D0 works pretty reliably.
It looks like it is a combination of GPU cards and Host boards at
this point. So, there is no possible/available quirk at this time.

This patch disables the D3Cold by default on BMG by reducing the
vram_d3cold_threshold to 0. Users and developers who wants to enable
it are still able to via
$ echo 300 > /sys/bus/pci/devices/<addr>/vram_d3cold_threshold

Fixes: 3adcf970dc7e ("drm/xe/bmg: Drop force_probe requirement")
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4037
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4395
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4396
Cc: Karthik Poosa <karthik.poosa@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 12200be7b43d..a9f61a5fc971 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -287,6 +287,7 @@ ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
  */
 int xe_pm_init(struct xe_device *xe)
 {
+	u32 vram_threshold;
 	int err;
 
 	/* For now suspend/resume is only allowed with GuC */
@@ -300,7 +301,11 @@ int xe_pm_init(struct xe_device *xe)
 		if (err)
 			return err;
 
-		err = xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
+		/* FIXME: D3Cold temporarily disabled by default on BMG */
+		vram_threshold = xe->info.platform == XE_BATTLEMAGE ? 0 :
+				DEFAULT_VRAM_THRESHOLD;
+
+		err = xe_pm_set_vram_threshold(xe, vram_threshold);
 		if (err)
 			return err;
 	}
-- 
2.48.1

