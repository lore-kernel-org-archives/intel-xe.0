Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90937CA101F
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 07:35:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9EB10E878;
	Wed, 10 Sep 2025 07:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A9qWhbpr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D8710E886
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 07:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757489746; x=1789025746;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=iNiuJTcHomye4uoJxL0jrhSXDB7YwNlAFyHVcsdOIkQ=;
 b=A9qWhbprPRraVaQ7txOPgANRuu6SdbmE95we6KywS33gCPi4ZELISVnk
 ZvuCDOQ3W7ZwCA405qhQ4yoJI2MWo8JepqzUZXCN/mEgtK9y6ZB62p5ne
 tNy4MUVY6a/mLy/fDXQR3dJLKzDyWSj8BF5stA9GV7P+s5M94TlmuebWU
 C9SvBqQKDMa1B6KZbtZ8Qj96XHmDpVqRgxZ/+dIasMq+hb6irXfGPLskv
 TxraJhkS1eVs25/l/9O6Mjz9hPdeeZdq0J2/w5R8QYQoOv3nD5ZOboTZH
 527y7vNEl/n8nnRx6b3MXy+Pc/4rEA+Xm9necjb5YblWLHDUrSLrtGoml w==;
X-CSE-ConnectionGUID: 7PU4tANfR+eGDLszlD3BlA==
X-CSE-MsgGUID: 3f0eWWtLRjC6o3V3JQe9wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="85235196"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="85235196"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 00:35:46 -0700
X-CSE-ConnectionGUID: 4GHUNXTtQlyClbGeAh9gFA==
X-CSE-MsgGUID: P+jKpbqRQMuewpKG6bz11g==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 00:35:46 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:35:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 00:35:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.55)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:35:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvQZdyIaq9fm3gCehYKQ3HVOdPy5yaTyMqiE8A1KZFDdq9DFlnTOamfSvxiyytmYr0NLcBkd5dnUFfVFQtDFsNfdj+kGZrZPDJWx95rw2Xz/qSSzfHgKyOz7xzEu8mehOvBLemupDHy8piKTNLJI7NQDSVmx5xvtGvf8Ds453lFsiR51Hwc8hC2EMYHzvENBCDSANkw9klAkOpy6GPxzphUGAnpO9ABOax6KwWQUUqc3kKaYDlYc+DvwGvzGlvKnrrEOjTqAiswbrpVQ0Hf3eY7Kvg0eCgEGEO1L9RxaRGrG9uttNPUOQ62YlVbFzKdAJrhNKQYaFHw51tV/o6YqZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mu2rLl/MeBXAQLcDTMqVv3jCyLPwL+so2gE4JcJhzNc=;
 b=ntYDG0GTYgrRU8W8hGPLbkl9oXHw+9ABykLx5KFPfqewAJXYl3HdKkJihbzrlouCsnr1Aww1lfiJ453bgAjWqCUMCmB8JhFiIuLdvqtoL47fIkj0hZtkdB1byWPJkYdA3k0XXdAf555L/zekOhCVAFQR+2tKEUICBEA2OMuXURxN04QfqPYyaL8BAZbWszOdWlYlFloYmzXhFukRg9OjpX+QLyVBrQKQsYTpujKg6vryE+UjkFo9mFFBKYH32xK4oAY9zgrAm3YPDilzeN5UzXpnWkoQDPTx2eUblFWFH5v3OZ+VYPDMsqr/gMuy5D5wkyxEB2jdcN0GZAIr8j1jFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB7902.namprd11.prod.outlook.com (2603:10b6:8:f6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Wed, 10 Sep 2025 07:35:44 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 07:35:43 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 4/4] drm/xe/pf: Force use user VRAM for LMEM provisioning
Date: Wed, 10 Sep 2025 09:35:10 +0200
Message-ID: <20250910073510.732250-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910073510.732250-1-piotr.piorkowski@intel.com>
References: <20250910073510.732250-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0023.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: cbe19947-40d1-45fe-ec6d-08ddf03ca66d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3NXODNMejAyUnFUMEtUN3c0em90OGZtbk9TYVdWZ3QxT2ViMytYWkZKc09a?=
 =?utf-8?B?djk1SnQ5YWlkdWdOWGE5ZzBKZ2gzdzhqbC9Na0kxRmFGUkRISjFCQVB4aTRu?=
 =?utf-8?B?Q2VyYU0vTU9UR05RRVRSOG4wWXJIT3JtT3BGOWdMQk5xaE5CMXZTem5ta0Ry?=
 =?utf-8?B?bkE0dHVBY0VJTEc4aERqQ1hjM1RaUTUvZ2hwV2xEUzdROTUraC9pTmpDdlpN?=
 =?utf-8?B?SzJ2bnFKekpJZlY3bkJ0Y1FPU0NSZ2xDWWVueDZSUmVYVGtuMkMvRklpb3Zr?=
 =?utf-8?B?YjZLdzVzOTU0UHJkeDFENHdWNnFYdkh1VGpnZ2xFNU5HVVpQK2lvWU8zZEJu?=
 =?utf-8?B?QXZyc0xoWDU1RHRaVW1DNForSERYTkFlakg5aCs2alp0U0Qxa21IUko3aVZT?=
 =?utf-8?B?dmFDMzhlMHkySjJNc3JUd0ErOTNrWTEwR21Xd1cxYXdtWG0wdFhFajVoRDJs?=
 =?utf-8?B?NjcxZTh1bWJHMzZyNE9XY2ZVeEVZM1NDRlBDMERxbU9iUTJrbjNJSmVIQTFR?=
 =?utf-8?B?c1VkQzFYdHFhaVVnajdwclJQWkdaSEdQemdxYkg4K3NKWDFVRklCeHVqN29r?=
 =?utf-8?B?RWE1WlR2SkVZaFJtMTkrSnBjY3AzSGFLNUdaQUVtQndMWERlWWRMd0JBOElF?=
 =?utf-8?B?Y1AyUFV3RllRUlRRQkpOdE9va2xpUHhFVC9DUnpJTXFPQlNQMlg1dGhURU5q?=
 =?utf-8?B?bU16bWFRenlubFJpMHB0OHQrK2tkSzFTTVcwUFhvV0ZGcGs4OERLM3Fzc1ZI?=
 =?utf-8?B?WFF2Mm4wVDdmamZncURWdWJTYlp4dVlnN2QzNXZqZFJwc2I4V2l0Umd1eENl?=
 =?utf-8?B?OFljWWx0RTI2Y0hqcXZiMzlITTZIR3hGVWYwZk9zNTFmRWlSVG9jTGRUWjFj?=
 =?utf-8?B?dEFqQ2t2NWNjaGxiZ2NDUGlLQ1QvZnNDc3prOERiQ1JXNjI4ZVgvb3lRWFY4?=
 =?utf-8?B?SlI0eWxIQ21mVnF5MVB1dU5ESlZGUjlYek1BcHp4VXZOZGdmMHlYK3hsOEdv?=
 =?utf-8?B?QndlUHFoSFI5b3UxVlgzWjhPa0xrQ1VFSHpuaUh5a09seUpPdkpsWHNldVVZ?=
 =?utf-8?B?aXBKL3RZZytnZzFmQi93ZUJLZFhlcjRSRElmTUp5WUliaHNQUWxWVlZqTTVs?=
 =?utf-8?B?TWtuR2J0aWovVlg5SWpJSXliZXJmM1A5bFhrbjVndXFPb0wvV0gvZXVVa212?=
 =?utf-8?B?ZlpGVEc4YitZdmRYdXdUMkVWZTIrcFp1NERLNWhtNy9od091eUZPU2ljQkNJ?=
 =?utf-8?B?dU5ZRk5IQnN5M25qclZsa2I1Z1BldWFEOXp0S2Y1Z0xrakNDRUNHSDJFRlp4?=
 =?utf-8?B?UXRwU3VZRFhhbnRpM0VwN2pJdXI2R2pwUlpTOXdGVXpONjdtSzJjYlFnZmpO?=
 =?utf-8?B?Sk1NY29rS0g0Yllsdi9vZ29jZ05ZVGR6WVpLd09HZitoencyVUNQaC9VWFZL?=
 =?utf-8?B?RzhiVnphcGNidmw0RG9EcmRmdGlYSjYzVTFXK1QwQlRmOVBkR3llNjRFcUZj?=
 =?utf-8?B?UTk0SkdFem1Ianp0azl3NEpnYkppaE9wQjF2VzdrNkx5VE1LUHBaUGN0YmlV?=
 =?utf-8?B?b2FYZkVoVndEZDlDQTNXV3FFbVB5U3ZLanRjeEVKemMwWTg3UHR5aDBrNVFB?=
 =?utf-8?B?RHNqKy9ncVp3SFM2aHJObjlLVlBqWkhia1ZJMTJZY0JGVTV0enVxWUhndUYy?=
 =?utf-8?B?bVBNZEtkVDg2Vk9wWC9TbnhKWjlGYjFNd2ZubnBMWnpnb3ZhdUhQVnBqWFVP?=
 =?utf-8?B?aTZiUXhZMDR4K0dWaHZuUEs0UytwT0FvOFg2bUFFVDNqei94N0krU25DNG9t?=
 =?utf-8?B?bWlybXN6L3lkTVFWK2RYcWRNYWdEQmRlbVdWSHRzN1o0NWJNeFZXdTIvUFdC?=
 =?utf-8?B?V1Q3Q2lVRkdjNjl1MHlDOVBEM2tCN0hOUU1iSHZyRkx2WHNTK2FBcEVHZlFG?=
 =?utf-8?Q?q6vCymMane8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3JNSlZVSEF2MjlOdTlrRjNKRHdBL0pYWTFGckhmZlFXN203aW9BMmFrZW1Y?=
 =?utf-8?B?NjNVSDc4WEJVN0E1YzkrRkczWkN2Z2JPRE43N2hQaDlyRFFZQWUwR3dNazk0?=
 =?utf-8?B?UG1kNVQ1Snh2UzNEQnp4bEIvRmFzTEQ2Z1FRckdnK0tkSDIwUmkrRGozc3lE?=
 =?utf-8?B?MUlIZmRGUEo3ZCs4TmovaGQzN2VNcyt3K01rNUxBbTZXVWNXNzFLb1dqcDFU?=
 =?utf-8?B?RWNqVE9JMUlBaklFcjA5ajlPd1lRamtYN29jZTlwcCtPL2RXM3Vlclg4aXJ2?=
 =?utf-8?B?UkZmY0JTQmFFMGxseGpjQ1pYZHE2Sys0MmRaS0tjamduSWhQZnlFdEZZMVkz?=
 =?utf-8?B?Qkl4a0Q5RCsrZWdzVFJSbVV6Z2dyaFM5ci91WW0zMW1CL1dkZVcvYjBEaks1?=
 =?utf-8?B?SUNJK2p1Rk05RXpTVjFzMDczSGk5ZGFtM3dMVUlXYitKa2JRS0RyMXFEa0U5?=
 =?utf-8?B?dDBxNlV0blJTYkhqb2hHS0RnSDd4dlVmbmJYdWEwK1RGLzEyUjZmbFZ4Z2da?=
 =?utf-8?B?c0xETlVHaGp0RUhtZzBPdXVyYVVLZnRvcXp1d1d3S1JKODI5amM0ajBlZ1Jh?=
 =?utf-8?B?YmVyclUzYlNFUU1Rek4zYzFwVFg4aUxRbGlsMkJqMHdxQTlteW5BT3QxWkwr?=
 =?utf-8?B?LzAxT1VHKzU0aTVIOEhxY0tZRXVsRVd0MlhoSkwrVEdUZGJWZmdqdXEvd3Z0?=
 =?utf-8?B?Y1dkRHpMR2NlYUwwR3M0S0NROFdFY2JaRWdKcS96eDVYWllGTmszSUFUckl2?=
 =?utf-8?B?RkRaQ2t6UmlwWXA4UmRISmRoVkczMytqbGZRSGdDSkhMVGNzMTdRekk5V1BE?=
 =?utf-8?B?ZWdRODJHR3czelpHZnl0c3I3SFJYSTNYNjcwTTFGRlQzS0cyYUd5bXpXTmZj?=
 =?utf-8?B?LzdqTnAxWXZqUjZZR00vRWp0RXUrNGJRd2xPKzNJanArc3NGOHU3VGF3d1FP?=
 =?utf-8?B?U3lSakx3YUF2emcrby9PcmNoYXVQL3A2azBGMVZyTENCcDdrZERkaHRPakxC?=
 =?utf-8?B?ZlFlMytsTXEvT0dCWVA2TzNMenVBK0IzeDJwbEhyVGk1eEVhcjJyazhMdHls?=
 =?utf-8?B?ZFhnWThFbTZRbFFIZG52VEtOR3haTkdjOTBEVzJLelVEOHp0MWlKdGEydVRG?=
 =?utf-8?B?Q3Vja3lJVXpNSXhKQmVyNHptMEoxck1QNVRvbzJnbGhlNjYxa1dML0E4K2tZ?=
 =?utf-8?B?aVUzZnlZVWJXeERtU3VxZXFhU29kTVlnTzdVRVhLbFFzY1NPNFh5dm9CNldk?=
 =?utf-8?B?QTU1NGlYb0Vxdmd0SFUxVDAvZ0NhSXV0MmNsVWhUaWhoMFYzdHN3NjU5T0F5?=
 =?utf-8?B?NEU4dndReHdjL2xxUXZvbXVCdVJXUjBYOVoyRzdMYnZlZTY4ek9tUG5IVTZj?=
 =?utf-8?B?MS9wY1JXMCtTOW9RSGN2SG94Y1c4b3VZVElYVGtldkswSXNjN3lXYThhby9r?=
 =?utf-8?B?dnl6QXZ5KzJIUlZmM2FweHNHMWt1MVRnekZKTE9wTmJ5a2NETjY4UmViL3Vt?=
 =?utf-8?B?c1Z2c0RMZVZBNThrSEJwVE5jQjJBVW9jaTU0NjZCeWp0dFIvcktWbkpQRWFK?=
 =?utf-8?B?ajluSndmYVZaclN0N0NFRjNPU0tBa0l0dFlQMU9DU2hDRW1wT2xFUEtzanly?=
 =?utf-8?B?M3ovKzJEdnJvS2YrczJ1bDNnQ0JvaVpoTVVtWkF0UkdDbFo2MUtXYno0QmdR?=
 =?utf-8?B?RXJUZGtvM3VtdFNzYTg5YVRSMWZxMTlmZ2QxRFR0SnJnVnVQa2tzMUlsZFNJ?=
 =?utf-8?B?MmRYemtmQTdpNGF2SW85R1F2T0djKy82YWU1akZXTzRmVE9iTVVBUk4zREo5?=
 =?utf-8?B?eXk5YlRJaHFFeXBaUGVJajhtUWZGZy93STE1N1BKWmFRK0pnYnU0eUF3dEp4?=
 =?utf-8?B?MFZyYmx3Q0JZcnhibWhKMTIxbnNjOHFoVXFZNzE4TmNvQXl3WldnTngwWVNr?=
 =?utf-8?B?bWNIQkxOWExNNkp1aXlxeXYvbC9YSFcvVGdiemhOaERqZGtqMFlPWlBYRmtD?=
 =?utf-8?B?bFBIMUZ4Vm9UR0pualZ6QVU2S0JpRjExaUs1WFVYSVdZVSsxL0s5dk5iRVBV?=
 =?utf-8?B?Um5EMTBCemVMZ01qTzQvL0Z4Yy9QRjV2Mll0dGVEOTZEb3ozNy9CVHZMOWFi?=
 =?utf-8?B?L2VQMzRJU3dIK2FMcmNEODJYWnpLSGpkTThNdjhGVnVvMlo5Nm9rSmFBc1Bk?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe19947-40d1-45fe-ec6d-08ddf03ca66d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:35:43.8884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K/AD3fQuQNa2dfZs2s6kvEE+SvgLvJvIn4rG1RS0tL1+MNYRvjuE6De2m3R74cg7vGlrcLrbqWzq5iwRyIc9z/CS6NFoV2l3ydUPlx1JiXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7902
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

The LMEM assigned to VFs should be allocated from the general-purpose
VRAM pool, not from the kernel-reserved region.
Let's force the use of general-purpose VRAM for BOs intended for VFs.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index c8f0320d032f..ca8a1824147a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1484,7 +1484,8 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 				 XE_BO_FLAG_NEEDS_2M |
 				 XE_BO_FLAG_PINNED |
-				 XE_BO_FLAG_PINNED_LATE_RESTORE);
+				 XE_BO_FLAG_PINNED_LATE_RESTORE |
+				 XE_BO_FLAG_FORCE_USER_VRAM);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
-- 
2.34.1

