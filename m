Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEABC5B572
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 14:04:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406F010E7EB;
	Mon, 17 Aug 2026 14:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UoHCrBzu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FB610E7E4
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 14:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786975448; x=1818511448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aga1ahAnS//4qFHoqgX5jFOnJgWN/acKnmnfhbXFz6Q=;
 b=UoHCrBzuAVtO+wZ95HwfI1zkep4ATeKrTTcwGnVlESy1WvPC6+shJNNc
 AZ6TLF9US5X8I3K0mLLbEp+Z91Qha8Kc67CRAWxMdm7hqbA4zs4OjE7aH
 UaMpkqtzalpt9BiZHO7+befO8Xd3wpHBmzZrc2ImhaKpAIwMchjM/nsqO
 Nf4mKZ3pfjE6zmWfYQPvh48maLwy2Fh4ZxmDuC/hR/Me1UtlpLY3cUUyO
 NXK7ii5uW7pb32sDS5U8+eih6AuMaYrnNFbs43Bw9yJrzxg63tcFhPEC6
 yn2hnVKjbr+FHcSRE3amx90hUJKItXXWRYlqb0G40NVsyy7lQ3HoIdzyk w==;
X-CSE-ConnectionGUID: 646DifBfRFOyWySe7jWv7g==
X-CSE-MsgGUID: +R+vVrkgRwCJXbI8HyDMjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87517046"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="87517046"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 07:04:07 -0700
X-CSE-ConnectionGUID: 86kld6dmR0SV0nwbKoywhA==
X-CSE-MsgGUID: edlYaXC9Q+iZoFiKEUsGgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="269198671"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 07:04:07 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 07:04:06 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 17 Aug 2026 07:04:06 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.39) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 07:04:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xz9h7fcn+a8MmufTovtSF5/5g0oS4UXypDV6UY4ZUtVM3zppuQG9wJw36ILD//aqz3yocPqXd8cOKJHn2NcOG2Kmv3Juxdu9LzvAsTpibzTSEiQmBJhwa5TdJLPotdmvBp8GDOKp07sc68Wfwzi9JrgJWin4YYhPf14zie6pawMhqAy7j9nVUlZvGy7GtTMJAzic47R2V9+facaWRV3K4ZZ09S1HLUCH2MusIHRKVa7E3tb7ep8JAZUVRhY9Cpzid9gii8p1ZoKtHwweD+jtMWRlH/vSTPB6QDaKomDu64/3UJKuPtr6GleAuFEQbZJfqwvftG3H3GaCfyxh8eP5YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcHqgC48GlaSrirZ5Tq2YIyoP6lQH2l/gQcsDB19hVk=;
 b=IvY4QWCbtiwH7mjZHKZbuU6NOAYDTFYCeuTXUTiyxnaxzXRc2FarlCXVLXQr93/aIq0h9z0iSPbhyf4AG4PPF/daEsAC+eO7wSgmgqArc5nS+0NrwVNVJQAgaRj50V20az9l5AhrY51647TrhPvwb8mvnjutTnW6TyOAUnZM75Tn85F78DjIrJ7Dj4YiZVvtHHwKFdyc8ZW03R/R6SNp3+xqYlrTBLyY7Uy96/mz9/FtB0o78xpBzHM+F3jnQXdunkL2nT9z/1LV+dAPusw/U64FiHdrMG+cpTaFkHfZ4Kgifg4qdzcP4NlrfeFRcBnv1Ez1nJnXNVpJwu41XI59sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SN7PR11MB7637.namprd11.prod.outlook.com (2603:10b6:806:340::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 14:04:00 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 14:03:59 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v3 2/3] drm/xe/ggtt: Initialize GGTT pools by SR-IOV mode
Date: Mon, 17 Aug 2026 16:03:41 +0200
Message-ID: <20260817140342.415803-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260817140342.415803-1-piotr.piorkowski@intel.com>
References: <20260817140342.415803-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIVP296CA0018.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:354::16) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SN7PR11MB7637:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c0ba146-6ee4-4231-13ac-08defc6862b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: S+UuYkIIgaLnxjM+LLXPklZTy7uBvfjHtRoRKvqMnvguruw3D38zdJikW7xiN+FX6NS+9Teq0kFlKOPEOWyrMlOAhIbpdXVd3HyCJKL+o5431M5DtaU9Dkldq4MFFXJkHwLQ26HBD3AORdtJzylo/aPkAvGaWtdK3BubPPgJRmNUJtuPtBJbJ4TyMnpdtRA0cvzQfq3YCsROYt5era4nBRVx0lewewK4HhXjxe2CjKT77nsRJm48HtBLHxqoUXQvDVvsnqexrxfqtnTv16pL5z6YjkH99p9f9wTaGwRwYEAYtlCNDPUDdj1iRrNLS8Hbft9Hox5WOozhoaBnu+IwssCCIZgqksbuM9l9m8x+qFhPRF4DYcftATCvZY3iPtpYP7IqWU4urIkukkDKaT9DA13MFMq5C6uz9pfLGXlgXGERHjHatbmZmTinpGjobWLvDt1Y2jydIb3Hm1UPFeSOgm4iPR2PSCqQXm8A2yzti6na/Cw++VdKH3Uehk+3Gau2uFEXDIFqD6Y7HkpVKk8SggeDudqJzTzq51Yy2lG7PDqBsT5Wgg+ps1dZ1FXAy5Dqnf9dETI6oGfaArJhjnb46BaqfhWc3g6ctjUkSVdgjY1yGDS31L7fr9gJ5ihL2rhf3PuJeOYAF20G1yVctrwrwar7oBqDxOK1pruFdEE3COM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDBiNFpnbExqdS9PSnN1bkRzNHpmY2k5OEI2SURoblN5ekZGQ1BKSFhkRnRD?=
 =?utf-8?B?L3BMZkk3Sy9va3R2RUQyR2hqelE5aUc4VGErRkV3OW5BV1A3cTZobnUyZ20v?=
 =?utf-8?B?ZDRDQjhaTlJhd0lBZ3R3U25reGZzanBSY2lLbEcvVDJGbFhUK2o5L0tpRnpS?=
 =?utf-8?B?UnZDSnJ3M2J5UC83bUtHUDRUbmRKRExsYTI1d2FVSkpCbHhNc1N5NVRzMHRi?=
 =?utf-8?B?OWwrYVR2ek11Yk5GcW83ZDMzY1gzSjhjTVNWUnBnMjBHRk1CN0d0cjNhOUVT?=
 =?utf-8?B?SjRPYnp4QUpMYTJZbVNlTzR5bmhINjB1dWhxdUxpeWE1RVBueVFKUkkrN2ZS?=
 =?utf-8?B?YVRNdytuazAyUktta2d1TGdaMFB4c3JFK0s4dENzU1RtZG5kQU1qRFU5dWNW?=
 =?utf-8?B?dmVYZm50QnF3NmhleFpMZHFlcmZibThqZDFMSll3VWJGWWtXM2dIdWZQQlQ0?=
 =?utf-8?B?S0lKZTZYN1ZKLy9uT2s3ck1DbzJSQnlPQnVPa3lMTXA3b282UGIzekRXSTVm?=
 =?utf-8?B?RmR0Wk1tejFFYldkV2ZiajAzb09tVTdrZDJ3Y2M3bzBSQzMvZk9HdmFoQUVy?=
 =?utf-8?B?VmlTYkFTZXIvMDdxN3JKVkx6VUR1S01wWlo1a05oRFVhS2F0QVl6NXErMUdk?=
 =?utf-8?B?cDRDNkJlMGpFUS9ZcUg4aTFqMk9sVlhQZzFQenlUcHRWOXJzblhlVnRsaThy?=
 =?utf-8?B?YTZNTGdYZTZHa3h0eWxORHE3SHR2d0RCTTQ2dThzQ2w4NGdCamRuUEs2NUxR?=
 =?utf-8?B?ZkMrOWlFcy9zNFh4d2lYWTE4ME1wbHNIeGw2enIzc05VMStrNjhLTEE4aFd6?=
 =?utf-8?B?MSszbTN5ZVZLSDI1VWhmQkpQZDU2M1BBSzJJZXZDTGJ0WVJQTDByTktTMVRU?=
 =?utf-8?B?bVpMTktzMGJwalN6WVdHQ2FLd1VndTc3TEFXWUdtc0YyRVMyNngzKy9UNzN3?=
 =?utf-8?B?b3pzRVN6WGtxVW11YmZ4QVA0R1pCMkR1a0c2cFJ1YzA2S0RTUmJud0s2Yk9G?=
 =?utf-8?B?MjRWL2kwVDFlamVyTnNmbWZaYldVbDZxWks3YTUxMm94a3RJQmZPK2VmWGZm?=
 =?utf-8?B?WEpVSVg3cGU3cG9PT21DUnkrdkZwRitBdU4vQm12aGtoVWRJdW5iZjJaTDNw?=
 =?utf-8?B?WGtacHovZG8rUGZSbUVxQWRvRFRub2Fvc2k3NVhCbDRzelJSWkhCazRPUFlo?=
 =?utf-8?B?WTVCOHg5NkNudkRkb3VKbndrbG5Kd0FISDZVdEFrT1FRdU5QOHpONjRnMkdj?=
 =?utf-8?B?Mm9rODJPam52SCtNQklaYVZPYXowOFlLa1M2TUkzT3FKMk55cHhvWXIvcm5T?=
 =?utf-8?B?VjdHVVplK2MwTlE1dExGQ2dURGRyQ0Vzc2c5cGs3R1ZqQzRSdGhWb1phc1VB?=
 =?utf-8?B?REI5b2o0Ujl1VXNSV29XeG9Zei9NUGVQOStaaUh5Y3h2ZXZ4NUdtSzhHNU1Z?=
 =?utf-8?B?Z3BpM3FuSHAvUjZNenZLWXExUHJHamlBUGdOMDYvNmJ4VXY3dXJPSjZXUWtZ?=
 =?utf-8?B?cCs4cFhQQ3FWWEFkeGFFNGVMREQ4amdub3NuVFBYc2Z0T3JkVGtUdTRIUHRP?=
 =?utf-8?B?YXEwdkNuYmJxT08zWENrZUpYekdSbENpMkUwWW02NTlIMEtqQmpEM3dLbXYw?=
 =?utf-8?B?cDNhTTJOU2NyVTZQVFZ2VjJFNU8wc1pXQWtNbWtBZ3hiRzZuWERkRDhxN3ph?=
 =?utf-8?B?ZjA5TXUxcGdzU3g3WXNYNGhrNGY2Z1o1SlM3YmJKL0VvQUxRZFlqNWt5ODdz?=
 =?utf-8?B?K2xPWjRXaWUrdVNIMk9raTNLSXVRd2tEQWV6QWJoYm5qSmxSaWgwR1FUTFJr?=
 =?utf-8?B?N3hOODduSFQ1MWdjVUQ0bjlBTTkxRXk2OTRTTllqYzZOM1lBZ09Mb1JZV2JZ?=
 =?utf-8?B?cXAwL2lSVkc5MzY0bU5VWWJGdjR0SGhOajlvWDVpUlJQdHZkVmhPYXoxQ3Jr?=
 =?utf-8?B?MVlBdmd5ZE5GZW8wMEh2Tjd3Y2NXREJQbkczdk41VFR3anIvaXM2RGh4SmV3?=
 =?utf-8?B?MWpHS0pyMzU4SWV0SExNaHlDaXYxWGcySUFDZE5IWHFYTE1MYm5GYjZ1cXdO?=
 =?utf-8?B?ZVNDcFZIemRXUERRV0FDTUg5YmVZY3ZzaXlDRzJ2eWhrcW9neHhra2UwNzhz?=
 =?utf-8?B?YmR4UjdCZHprODIwS29pREF1ejNXOWFFZTJ3bWF2dUlGQlZGRGY1LzJQQjBx?=
 =?utf-8?B?RUJscHNRRGxzUzg0SmN0MmxwQjBYR2FOTWFvRkF4NFUrQkw1dDZ4dXQvaVBi?=
 =?utf-8?B?bU51RSsrbWNwd29wQzBicFJ1QTYzTFk4dGFORGdCR1VLYlFudFh2Nm1pWHBG?=
 =?utf-8?B?eGtITERiL1VvRHRlTkZYMVFYdEtpZFlyb2U4bDl4TXFabDQvT1JHZ2tTcWx6?=
 =?utf-8?Q?wkDQ2uGyxo2O9ajY=3D?=
X-Exchange-RoutingPolicyChecked: GI2GvEzGRYINjM93J8HR84C5F9X4pkk3bc/M52K1n7zenIIR7QdB1z1hU0fNnJXM72RaGPgZf7qEj2B9EzO91lHCJbNCu4vOfh+8FZA9wLOv5WwsZOHfK2TiY8enLpXBYBfc4r5UHaJ9HaVZosZ3o/X15duYJBFuMg0V6dHzSgL+MwVirNDJ3rp+k33zu+K6FNdsGaw6k2ZUh3jND+oledLctlnuBOieWqoKUMoYoehO2U+dXSSR+xsyDEkmuHhxETPq3DUPQ2vRe/FT7jLt+ZIbepajZz1+25gZpTJhKTMcVihOidbiQKIHQdbduriGyMTzPxPcBPnESCDixlTSmA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c0ba146-6ee4-4231-13ac-08defc6862b5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 14:03:59.7813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QyIc48vRqpJw7OlV1jRbT2Ds8zOtZk576zyHplKAfLKzM9R8bMUSyr6cIjiZH6O4y+QdEaUQnY6iyChHFr0QXgdr5qAAjF3Phxs8xDokBwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7637
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

GGTT initialization currently uses the full available range for both the
usable and shareable pools, regardless of the SR-IOV mode. The range is
read from hardware on native and PF devices and assigned by GuC on VFs.

Let's separate range discovery from pool setup and initialize the pools
based on SR-IOV mode. Native and VF modes will use only the usable pool.
Shared PF mode will use both pools over the same full range, so they fully
overlap.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 131 ++++++++++++++++++++++++++---------
 1 file changed, 97 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index c7e1cb1b1ccb..84fcc62b1798 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -365,8 +365,8 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
-static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 usable_size,
-				 u64 shareable_size)
+static void ggtt_init_ranges(struct xe_ggtt *ggtt, u64 start, u64 usable_size,
+			     u64 shareable_size)
 {
 	struct xe_gt *gt = ggtt->tile->primary_gt;
 
@@ -386,10 +386,87 @@ static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 usable_siz
 	drm_mm_init(&ggtt->mm, 0, ggtt->hw_size);
 }
 
+static int ggtt_get_range_from_hw(struct xe_ggtt *ggtt, u64 *start, u64 *size)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	unsigned int gsm_size;
+
+	if (GRAPHICS_VERx100(xe) >= 1250)
+		gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
+	else
+		gsm_size = probe_gsm_size(pdev);
+
+	if (!gsm_size) {
+		xe_tile_err(ggtt->tile, "Hardware reported no preallocated GSM\n");
+		return -ENOMEM;
+	}
+
+	*start = xe_wopcm_size(xe);
+	*size = (gsm_size / 8) * (u64)XE_PAGE_SIZE - *start;
+
+	return 0;
+}
+
+static int ggtt_get_range_from_guc(struct xe_ggtt *ggtt, u64 *start, u64 *size)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	u64 wopcm = xe_wopcm_size(xe);
+
+	*start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
+	*size = xe_tile_sriov_vf_ggtt(ggtt->tile);
+
+	if (*start < wopcm || *start + *size > GUC_GGTT_TOP) {
+		xe_tile_err(ggtt->tile, "Invalid GGTT configuration: %#llx-%#llx\n",
+			    *start, *start + *size - 1);
+		return -ERANGE;
+	}
+
+	return 0;
+}
+
+static int ggtt_read_available_range(struct xe_ggtt *ggtt, u64 *start, u64 *size)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	int err;
+
+	if (IS_SRIOV_VF(xe))
+		err = ggtt_get_range_from_guc(ggtt, start, size);
+	else
+		err = ggtt_get_range_from_hw(ggtt, start, size);
+	if (err)
+		return err;
+
+	if (*start + *size > GUC_GGTT_TOP)
+		*size = GUC_GGTT_TOP - *start;
+
+	return 0;
+}
+
+static void ggtt_init_native(struct xe_ggtt *ggtt, u64 start, u64 size)
+{
+	ggtt_init_ranges(ggtt, start, size, 0);
+}
+
+static void ggtt_init_shared(struct xe_ggtt *ggtt, u64 start, u64 size)
+{
+	ggtt_init_ranges(ggtt, start, size, size);
+}
+
+static void ggtt_init_generic(struct xe_ggtt *ggtt, u64 start, u64 size)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+
+	if (!IS_SRIOV_PF(xe))
+		ggtt_init_native(ggtt, start, size);
+	else
+		ggtt_init_shared(ggtt, start, size);
+}
+
 int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
 {
 	ggtt->hw_size = size;
-	__xe_ggtt_init_early(ggtt, start, size, 0);
+	ggtt_init_ranges(ggtt, start, size, 0);
 	return 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
@@ -417,43 +494,19 @@ static void dev_fini_ggtt(void *arg)
 int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	unsigned int gsm_size;
-	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size;
+	u64 ggtt_start, ggtt_size;
 	int err;
 
-	if (!IS_SRIOV_VF(xe)) {
-		if (GRAPHICS_VERx100(xe) >= 1250)
-			gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
-		else
-			gsm_size = probe_gsm_size(pdev);
-		if (gsm_size == 0) {
-			xe_tile_err(ggtt->tile, "Hardware reported no preallocated GSM\n");
-			return -ENOMEM;
-		}
-		ggtt_start = wopcm;
-		ggtt_size = (gsm_size / 8) * (u64)XE_PAGE_SIZE - ggtt_start;
-	} else {
-		ggtt_start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
-		ggtt_size = xe_tile_sriov_vf_ggtt(ggtt->tile);
-
-		if (ggtt_start < wopcm ||
-		    ggtt_start + ggtt_size > GUC_GGTT_TOP) {
-			xe_tile_err(ggtt->tile, "Invalid GGTT configuration: %#llx-%#llx\n",
-				    ggtt_start, ggtt_start + ggtt_size - 1);
-			return -ERANGE;
-		}
-	}
+	err = ggtt_read_available_range(ggtt, &ggtt_start, &ggtt_size);
+	if (err)
+		return err;
+
+	ggtt->hw_size = ggtt_size;
 
 	ggtt->gsm = ggtt->tile->mmio.regs + SZ_8M;
 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 		ggtt->flags |= XE_GGTT_FLAGS_64K;
 
-	if (ggtt_size + ggtt_start > GUC_GGTT_TOP)
-		ggtt_size = GUC_GGTT_TOP - ggtt_start;
-
-	ggtt->hw_size = ggtt_size;
-
 	if (GRAPHICS_VERx100(xe) >= 1270)
 		ggtt->pt_ops =
 			(ggtt->tile->media_gt && XE_GT_WA(ggtt->tile->media_gt, 22019338487)) ||
@@ -466,7 +519,17 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (!ggtt->wq)
 		return -ENOMEM;
 
-	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size, ggtt_size);
+	ggtt_init_generic(ggtt, ggtt_start, ggtt_size);
+	xe_tile_info(ggtt->tile, "GGTT usable %#llx-%#llx = %lluK\n",
+		     ggtt->start, ggtt->start + ggtt->size - 1,
+		     ggtt->size / SZ_1K);
+#ifdef CONFIG_PCI_IOV
+	if (IS_SRIOV_PF(xe))
+		xe_tile_info(ggtt->tile, "GGTT shareable %#llx-%#llx = %lluK\n",
+			     ggtt->start + ggtt->shareable.start,
+			     ggtt->start + ggtt->shareable.start + ggtt->shareable.size - 1,
+			     ggtt->shareable.size / SZ_1K);
+#endif
 
 	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
 	if (err)
-- 
2.34.1

