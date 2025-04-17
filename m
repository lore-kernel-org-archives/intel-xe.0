Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2795DC369C2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 14:22:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF75C10E0F3;
	Thu, 17 Apr 2025 14:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l9CxqkPv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D178610E0F3
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 14:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744899749; x=1776435749;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Tswy5765G7UTTG7xR8bfmSgJvQuBX/xmDMY3m8wtOuQ=;
 b=l9CxqkPvpbzw8PsQLsW9e73FkQH0/QI5KMG5eTgaP4xEA4RMDU112wgb
 V++VQYS5B1bXZC08ZGsHwjVoM7pjsend0k/9pxot+Ux5F39ZZHFXlx20I
 ZVFT3ApLDNtjwnCaj3ElXxNVAdK+UfNXkbDONsQyO9TAsb+Fb3QtsjZnR
 K9o9CJ/I8yRmNEMW2hgxaI9klj7hHhcjEJKw9YCKv7U4FNB0zN6WsUMBV
 e9agtuKX7Q4fNlLw8lBhM6iNU3UXtacYgToyQxGhKNX1e6Dv8XXS2okzO
 pDr55kWquhtjuiPLAiSOVoR79ZmkkLoEl1JTgu9pV6AQxWUzqNVscF9RU Q==;
X-CSE-ConnectionGUID: MdBdQ3lzSTOvXeUo/v3d1A==
X-CSE-MsgGUID: 8Dx4IdYLSd+o61JLJmCphw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46658136"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="46658136"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 07:22:25 -0700
X-CSE-ConnectionGUID: Bihkyx+mRqOEM9lfJVYy4w==
X-CSE-MsgGUID: uNlOvCbUQAuKIqYs8CIQ+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="130668758"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 07:22:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 07:22:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 07:22:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 07:22:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aw2FI2KhVLDHN3dWauGUu7yB62QdrNBVm8+HcE9GrtRFsx952s4lt6RK9pNP4ZoBzifx9L76dd+TS5qDH2UhJXIXIEkIDRvug+d9NQ5WJc/vjzlTV7N7CV7tzmf0HqErhF4DLf0Srf6l0VTRkkrX2Y4M6eQgOqfRb0fWuhtW6ruqY2TJJpqJYfFwokJq5gU9VdeOjH1rlwJ7tHeLeNPAbWZzosSNjik7sUdV6ncGCkJBtlh5SEoty85njOKQq00ZdWv7A+SXMs+xeHt+DLWPKnSA3D1/jOr4dulqrr9l/a06pC4RHA55ZkHGVMpDLc74gC5j+gg0lEmyLDNMKrUOrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZI4Iu5rzR8Bj2TvUy7FawJZSnvRPImrwhJOd8jLXXxE=;
 b=wfpzWIrUantzYlOXFpAeDczJus15+YzMpe+DG7u+hqvMpRcIbIvgQ/+ZHUKXu9rp/UTPZj3Yp2O5Cto15uOLtsMPjF3lqRMqc7KJUBDN0BPeyGGUxS/Tqx5Ht0cMtjcXtSIU9LSXZ+pikcTNyvFdmnaa7OXCjNrV9raEedTNI92RlhbwmHSZHcyO87EpMjQuRGYgXDoA2Fcn/dbOHGGkzh+5jdlEov8Wq36VsfQmiZwMiRku7k23aADjBZY5LXpqlvtSbfhrCc3WLzmhcz2n6vZgjsS9LduLErFzfiTR6+am0/TcOtw94urh9O55xqPNFr5RC8vcYRiD6lSIN96jww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB4999.namprd11.prod.outlook.com (2603:10b6:510:37::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 14:21:54 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%5]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 14:21:54 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3] drm/xe/pf: Don't allow LMEM provisioning if LMTT isn't
 available on the device
Date: Thu, 17 Apr 2025 16:21:47 +0200
Message-ID: <20250417142147.278727-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0494.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7e::13) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB4999:EE_
X-MS-Office365-Filtering-Correlation-Id: 52c0f880-14bc-4f78-557a-08dd7dbb339f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eXJGS1MvcDNqSS9iWkRtSG1nYWYzeDNOSUc5RnBxUHNpTmFIRXFOZHBlUEtS?=
 =?utf-8?B?QTNnWTFTZytSMWlpWW9FcFVkNlRaeG9aaURUQ1p0RkhOeVR3Z1hIRS85Smky?=
 =?utf-8?B?VittZ1BzSU4yRFI1TWFjT0FleWV5Z2Q4aFVCNWdFN0NieWgvMzNtV3RDSWJ5?=
 =?utf-8?B?TnNNVzJOd0hYV09sZnVjVWRNRThBTkFoYmlzTHFLZ0g0M3kxU3k4R2cwd2Qv?=
 =?utf-8?B?eHM3WE1rMHk5QkZ6bmc3QWNjZUNlRHlyWnZZdU1DWnVtcXBuMFFVVHQ5RjQ5?=
 =?utf-8?B?Y3pWWVYrSzREb2t5cUZwZytlRU9SdnVwTlB0NDZOQjArUi9pbDR0c2E1M2Jo?=
 =?utf-8?B?a1Y5b1JibXlIalRKUUZUTkZycEVUd2txNGdxempNWWV3UDlBVng4Qno4bXRq?=
 =?utf-8?B?bWFqUzVMWFp1SEtDMEc2MGkyR3I0aERQNDVrTU8xcHp0Z1I3MFdySWw0NlVC?=
 =?utf-8?B?ZlVFSEpFeDA1T3NDTnliM1k2YW90NWlYckdkWitkUyt3ckR1REdLcDJ0WXA2?=
 =?utf-8?B?dXBqdmpzdHRibW5WWnBFMS80NFFGZGt3cElkdWRYbjM3T1NONWlsdG92SU43?=
 =?utf-8?B?ZTk4eGM4V3FydWRwTm01ZlpUVlBSNFVLUmRnaUtsMU5pNXZIS21RL25LSkIz?=
 =?utf-8?B?Vmw0VUFHV1ZhL2NrVkZXdmliMTIwclNWdTFOUGg0d0pBQ05nZ2RpVmNsZS8x?=
 =?utf-8?B?R2h0WHljejQxM1dEWEJrbWlEcTUvVWdOQW9nS0FITWNXdjhROHcwSFF3TXRo?=
 =?utf-8?B?bDFTRE9XblgydDRpUzBBRStwUXRkcGY3YzZlQURnNklNbG8raHh2YWp3elNI?=
 =?utf-8?B?ZEJnL0JYSUlXeXRyeWsvNm5xWFk0Qy8wL3E1NzNCZW9PZGk0MmRPMmwyaTZY?=
 =?utf-8?B?dTRtanZHUHpzc1o1TCtyWU1kWFZVaEpUYnRtK1o0a2JXZUtiWTZFSitjZWFH?=
 =?utf-8?B?WU5jL3RFSVVjelI4VEZXSW43ZHVXNWpNek1MM0hldkpmZkROOFl3TkJCbmdU?=
 =?utf-8?B?d3FNNTZLbS9wRElVdnpPZlJUK0g4YTFwa2l0cEoxNGhVVXg3RmpjWDQ1eHFZ?=
 =?utf-8?B?Q1dkbWtrczBHK2s1TFMxUEhZSU82Sy9uY0xzd1U1cEN6ZCtRdzFMNi9xMWVR?=
 =?utf-8?B?Y25HQ09CSWdEMGZoZzZQb1poUm1OekhMT1BITFFLQlRJamF3N3J4U1dVSUxv?=
 =?utf-8?B?bkl2YVgwUHJnMzFVazV3cTJ5TmpzYkhHVGRQZXJ4b1F1a2ZuWmEyY3BVNHlB?=
 =?utf-8?B?OVpnQldJZ0lhNVNyUVNHWUNCWUFoQUxRbVM0OHlRdFBKSnhrck1UT2pjNXdC?=
 =?utf-8?B?bS9QSCtpa1RHekM3alhDdnlhQ2RLUFNvS0lGUkRGMENmYk5BY0ovUjFoNzRT?=
 =?utf-8?B?Z3Vxdi9zZkFINENPVWZnSnZtWHNrMXhvNHYrWU10SGJTdDIxNkR1dEkwbUtp?=
 =?utf-8?B?YUZiMHA2bUVrNSt1SncyeE0zQjdldVlHWE5QUDIwZEVCeHg1eDZOcWRCbWpT?=
 =?utf-8?B?bHlpNkNkY1JWaHlUdXVXQ2RnNzcwVTAzL3FoY1BncDRtNWdDekRLOHo3Qklu?=
 =?utf-8?B?c2hGNlYrZk0wTUxydVg1T0dkN0VueEEvcHhWcGlFaEEwdkJtcU10M3UybFJi?=
 =?utf-8?B?YWVFZlpoWEVESWs1UGFTV0hoQ1JZQ2RNVG91UkNabm1la2tuNmJqWmRnbDVm?=
 =?utf-8?B?aHdZUlV0MytleU9WMC90QVJEN3pDU3FsckltOGRUcnRRR2l1M0NxUm9hUmpN?=
 =?utf-8?B?ZVBRT011STZMNkZVSmt2V2E2cUozdXNZaEoyRUxRK1ozcno5UUxzYTFRdXVh?=
 =?utf-8?B?ZFk1VDljaVNtNDJpWUltWGdycWNEbjQ0aEpWVitVOW5ZMTZFNlFzQkN5dUtY?=
 =?utf-8?B?bDN2cGRpNlNOZzluS3oyck83M2JRbmZnOGVpb3k4bGpoSy9vWjFncG4wcXYv?=
 =?utf-8?Q?6CJlTGAwCG0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnVyY2xidThSK3JkVUYxcmtSMGo4UXZmalhHUVROUm5Zd0dSVVRVMGxKYmg3?=
 =?utf-8?B?WEpDQmJKN1ZoNzE3cVRHRjk3UFc5MFVsOFhmd0NzMFF5bkhmeU9qRlBwTnUz?=
 =?utf-8?B?aHNMRnBFRjZYZXIwMFhmdnI0VlFjUnFidXlVWitZSjc0WVpyNU9KVnlvVCsz?=
 =?utf-8?B?L3ZxTzJFeVRxNWNzaDA5NThyWmRCbjgxNW5MNzIwK3l4c1hMWlNPTi82bmpJ?=
 =?utf-8?B?RS9ZNFNNWjRoREJTREpTMkp5K0FuV0p0T1UzNGtibXdiemVLNEpIbXRnQi9n?=
 =?utf-8?B?M1p0K080SFhPVHBEQmtZSlN6ME16U3RWYkc2N25HL1RjdTJoNTJxdlJjWmNa?=
 =?utf-8?B?Ry9DaDVNSVdhbzB0SnVzRHBZVDJJUkFFSS9uMlRMYno4WitYTTltWHlVL1Ev?=
 =?utf-8?B?MEN6VjZueGo2UXVpN0ZzYTk2TmV4enUrNERvODlRN28yWHBNMlBQQ0N2ZXFk?=
 =?utf-8?B?anRrajRweXU1U0R0UjZGTDkralkyQ0VvelJCZmV4OVFHbjg2YVcrS3dKelZu?=
 =?utf-8?B?V2o2TzNhT25iaVJNT2pGUm5aM1Y1bE5MSHl4dlBIM1Y2TE5vUGI0L2o2dWVR?=
 =?utf-8?B?VEZFRkRFeU91anl2STVlaVozSkxxUEtlNzBsZUxTaitXUU51aklwTDJHbkdm?=
 =?utf-8?B?VU90SG9RdER5MHZCU0wvenhrSGVEblNPenJLS3dIRTJncW02NE83RTZuNHFk?=
 =?utf-8?B?NXRLbU5meVUzWFQ4NWhLcFZGeVNBenJkQzZuYk5TSmlRbnc3RHFEaVZJVWpm?=
 =?utf-8?B?SThvQ3p6UVIxTWdHbyt3cUpwRlZMZUxpQmpQYlY4bDRwblZ1U3dLV1VKUlM2?=
 =?utf-8?B?dUtBSTUyTFl5SHZ0cEFrSE5JUzE3ZHlkT3JvNVp1cWVCSDEzc0o1V1QwQ09n?=
 =?utf-8?B?NUlhM1FCdVNXc1RVL0ZUQU8yaU1uQjZpVFM3MTllbDhFdFN2RVU0U0FpYVRW?=
 =?utf-8?B?aHFqS1V5MHpKVzk3REJtK2RJYXBMQm9FaEIwcHRlL2hhNHZhU3NwV0sya2Uz?=
 =?utf-8?B?d1E4amd1RDYwR0c5Q0pKSjVBWHhtZEhXSjZkaWFxZWtQV2JkYlpPanlKUmdZ?=
 =?utf-8?B?YmFXZENJQjc3WGY4Tnp0M0hEQU1TRFdkYUdNdHJYU2RodC9iZklNZ1V5ZnJJ?=
 =?utf-8?B?SVBqUFpZU0ZHTU10VXcvVTA3bFU1UmsvVnFVbzNFY2VmMHA2NlBmYno1SXVo?=
 =?utf-8?B?c3RGRzRnVmxwYkdpU2lmMTYwZElxVFJyV0d4K2J6N0gzWjJFL2lvZmV0S0J2?=
 =?utf-8?B?ZFNJNy9CZTJKUW0zRzUyclpYTmozL21nS3JHVjlkM1dHd1FaUks1OXNsQUda?=
 =?utf-8?B?emVreDFlNnJmYWFML0dlWWZiMVV3T25OSDNBYk5xTjE3WFp5c2ZlWWJ5bmNK?=
 =?utf-8?B?aEF1TmhLVlhpR2xvbUo1K0E0bFdkeXczaDJsdXFNNzVJT2hIK09idFF4b2g1?=
 =?utf-8?B?SFY5WVh2ZExtUXNaQU9TZ09LWmlIaWNPSVVTbHljYzdyYUdVdGVhMGlxODhw?=
 =?utf-8?B?SkFlRCtPN0cwYWFLemQ4dFRIMWRUUmRzMDBwZU9tSGQ3V09rTHRzZ0IyN1FD?=
 =?utf-8?B?WThLc2xUUjRtaFEvL2s4TE9scUUrdnlxVzlFT0o4T0pRR0Z1M1k3SjZmZ1lm?=
 =?utf-8?B?Y1MyUEx2aGZaTVB1cU9KN0pJN1Z5WGMzU2VjbDFoQlJYU3c1NmdUeFJsb1M3?=
 =?utf-8?B?N0VYVTBwL2RNakRmY01NQ281TDI0Z2pRUEZYRDM3R0M5bEFhQy80YWdSd0hw?=
 =?utf-8?B?Z0hjU1BHRnVweXJXTXc1SlNVTWFpN0FRZ0k3UDl2VFB6RWxTaTRFRGF6d0c0?=
 =?utf-8?B?eU1IMmxvVVRUd3Q5cTdJVE9GWW1tQi9DbXQzYlBteUxlenZldVBVcmNYYksy?=
 =?utf-8?B?Rkl4bUpVSUVwd3ZRU282QTNXRUZaYmdzdjR1cGQ0Mk1RSWFkRUVuUi9vU2FQ?=
 =?utf-8?B?NW5IYTFxQnUrTk1nTTBPenJsa3g5QW80ZitKMENha0FSRDFwem9QNm0yaGNY?=
 =?utf-8?B?a2trSi8vWWcwSEFRUGRwbmlqcDBrL2RCRHNjUUdvVi9EUE9lVGQ2WUdGeDNo?=
 =?utf-8?B?Q3dOVkdlZHVCUG1ldUFTRC92RVk5anFqbU41Umc0eTFzOS9BaTg2aUtlOUhp?=
 =?utf-8?B?NjJIOUtlZ2V6Y1hYR1JNY2FrVnRGZlF4NjVPY09EV2paK1hXTWM5d0ZyWHhQ?=
 =?utf-8?B?eFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c0f880-14bc-4f78-557a-08dd7dbb339f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 14:21:53.8879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4gcJ2b/8DFBW0/hPSZ3BXF1ihH5WqDdXU01C7uvDwe9Wz94F0Nx1aeJIFJeGrK9LxJHQxLwtMLVWHVONaXSFy1JX4Sqg5qULD0Qxr1tNU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4999
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

The LMEM provisioning is applicable only on platforms with LMTT.

v2:
 - new commit description
 - use xe_gt_assert in xe_gt_sriov_pf_config_set_lmem instead return
   error,
 - disable pf_lmem_info if LMTT is not available
v3: fix condition in xe_gt_assert

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  | 6 ++++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 2420a548cacc..3556c41c041b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1520,6 +1520,8 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size
 {
 	int err;
 
+	xe_gt_assert(gt, xe_device_has_lmtt(gt_to_xe(gt)));
+
 	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
 	if (vfid)
 		err = pf_provision_vf_lmem(gt, vfid, size);
@@ -1629,7 +1631,7 @@ int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
 	xe_gt_assert(gt, num_vfs);
 	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
 
-	if (!IS_DGFX(gt_to_xe(gt)))
+	if (!xe_device_has_lmtt(gt_to_xe(gt)))
 		return 0;
 
 	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
@@ -2163,7 +2165,7 @@ static int pf_validate_vf_config(struct xe_gt *gt, unsigned int vfid)
 	valid_all = valid_all && valid_ggtt;
 	valid_any = valid_any || (valid_ggtt && is_primary);
 
-	if (IS_DGFX(xe)) {
+	if (xe_device_has_lmtt(xe)) {
 		bool valid_lmem = pf_get_vf_config_lmem(primary_gt, vfid);
 
 		valid_any = valid_any || (valid_lmem && is_primary);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 0fe47f41b63c..13970d5a2867 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -308,7 +308,7 @@ static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigne
 	if (!xe_gt_is_media_type(gt)) {
 		debugfs_create_file_unsafe(vfid ? "ggtt_quota" : "ggtt_spare",
 					   0644, parent, parent, &ggtt_fops);
-		if (IS_DGFX(gt_to_xe(gt)))
+		if (xe_device_has_lmtt(gt_to_xe(gt)))
 			debugfs_create_file_unsafe(vfid ? "lmem_quota" : "lmem_spare",
 						   0644, parent, parent, &lmem_fops);
 	}
@@ -558,7 +558,7 @@ void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root)
 		drm_debugfs_create_files(pf_ggtt_info,
 					 ARRAY_SIZE(pf_ggtt_info),
 					 pfdentry, minor);
-		if (IS_DGFX(gt_to_xe(gt)))
+		if (xe_device_has_lmtt(gt_to_xe(gt)))
 			drm_debugfs_create_files(pf_lmem_info,
 						 ARRAY_SIZE(pf_lmem_info),
 						 pfdentry, minor);
-- 
2.34.1

