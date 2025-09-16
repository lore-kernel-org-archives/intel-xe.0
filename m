Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911CFCAC598
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 14:39:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D4B10E79A;
	Tue, 16 Sep 2025 14:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AHMiI2+R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4A710E0F9
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 14:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758033555; x=1789569555;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XdQW7kaIbsceTDujrGx+Tx4pLbE6uMCENeHKlw+XKrI=;
 b=AHMiI2+RV7J2PeG6yuFrOwL/zIzxfaCtd386LfMmxIDUEVHcEjnt2s4F
 YBT1hguIjhidDRiqT6kJ8rRevqFEFEMyVWbimjSap++KtJaKW3y4f0OWe
 ZWNSTgFLyAppK2RaF6tFpWEOljRlMwTN0UXMTH/hGu5WVrjjcqSwMG8bq
 fFzDs1ZeWhd9utaWuTR5+i3uTkh+ZXG08/HLnTnV8Vj2N76+JshkVyol8
 ZwgXlDZJrGRu4jGI10+RAsNMMY+4t2VyJuq60MEpbmdA0Dsg0clZPxUXx
 crdGl9aZjYaAWPa7Pb8gs9Txt3L0Pd6kUoGX+o78//Llh/y2fSitP7Dj4 A==;
X-CSE-ConnectionGUID: ntP6HJt3SIyr9uLsk+DjaQ==
X-CSE-MsgGUID: of30GYh0RE2BmLj6pVRyrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="60244117"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="60244117"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 07:39:14 -0700
X-CSE-ConnectionGUID: vBl/NdpERJmYPSVyNLtTiA==
X-CSE-MsgGUID: zKABNLeCS8GidRGBCJEDwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="174557693"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 07:39:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 07:39:13 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 07:39:13 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.14) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 07:39:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IuR2CLclGeDNsD0mhFrjTQ9JjdihigVEcXyugKfwzwY/yppuUKnI6FQ/atYLKiy9so2sWZK82ZuLCW1JKxEU9uhWvSRMR6bCgnJIDib/9GNmED6VhY/eccIrlTZ4OkaQ+Xqwk6LgjMEZxyL+892izPIw7UxjDGa54Bl6iUkSqnb4p2h2AuU88uF6dfFYNU59zx4smt8lDZ7SfmNeRKg2UJAMsYF+Uc3Linbh1lSUpSxiKtb4UQPa7orSBatkUF8B561i1OXvg28tzhl8xRzWOk1OhXSDOEQWvfQGCypQqNTEHJq7O4Uy40FCAMY9TVZWt2eskcc4P/jtzicKuL2hew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1LpGCa47/rW0gKDiYnJiT55V7qOWi/9FP4916r5y1Mg=;
 b=fHT18pHiipQ+tDHuGZIoEjZ99X9FbYE85xl3bYtVYcTINdxgHaQCZTVUhX9JfCBw3LXVHKx5JHFxVVhIn0RXPbKjTkStZ9vihzFNPBC3Tjqz/2IyIBGOy9iBD2T8LbgLiipPQy3FLCgKBUJed5BNWBQZ+ecVQMsVrY+c15FdOWSdFEYoFaAOnxwGbhiz6GYrv8lExw2oZVBkoeszSsEAMtIWoi9DHXdVzAnOBFk3MLo/hIFJBgA+DE+KtgCDzEunrpRG5MmzAngA3lbzEPOrzx2Zf5HdgXch0tEUdWeWvyIr4BAvmbs+VebjPmMJfIYhLUyRiG5gmSuT15QxiBR0Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM3PPF7468F7991.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Tue, 16 Sep
 2025 14:39:10 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 14:39:10 +0000
Message-ID: <7cdce3a1-7b03-439d-980c-a47bc542452c@intel.com>
Date: Tue, 16 Sep 2025 16:39:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/xe_device_sysfs: Remove sysfs
 unconditionally while clean sysfs entries
To: Zongyao Bai <zongyao.bai@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Stuart Summers
 <stuart.summers@intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>
References: <20250910183233.3971054-1-zongyao.bai@intel.com>
 <20250915214716.1327379-1-zongyao.bai@intel.com>
 <20250915214716.1327379-3-zongyao.bai@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250915214716.1327379-3-zongyao.bai@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0073.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::14) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM3PPF7468F7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 83c90541-d400-477c-fb77-08ddf52ecc80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1ZpTFFGSXhtWHl3SFAycHBNeTZuUWovaHB4U1lQYzZLY0dITEpja3pXVFZm?=
 =?utf-8?B?S0duejBSbDFzSUxpUFVTRFByVWxaVmxzVDc2VFloRkpUZHlpak53M3I5ck5W?=
 =?utf-8?B?UEFUUWJ2RXNXazFhL1MvTzFnNWxiQkhIL3M0eWV6TTFxdUxJY3R3SHZ6Q2w2?=
 =?utf-8?B?ZXduQjhCam5qUDd5emxTVjNFV01SRnZEemZKSjZrcit5bkdkSkY1dUVLd3Q5?=
 =?utf-8?B?aEpzSWsrZVN3ZW1OcE5zQ1kzVmRGWStremlvbEc4d1EvbFJ6cUVUOG1CdExW?=
 =?utf-8?B?WExzOTVTeTRRKzFTUVBLQ0xhY1lnSXFhbmltY3hhQ0EyZnVvaEEyMlV6VTFI?=
 =?utf-8?B?MjBjQlpmc09yckNlUnJUWldpY2Z5dXFva2ZSSHhUV3FjbE8yR2hmK3RGVHVv?=
 =?utf-8?B?dDhmelgyZGUyVWtzM0hiTUhzbU05bmgrNVZrb0dZTW9CLzJXcitDMmwrSXpS?=
 =?utf-8?B?cHJzWTRlK1RFV2lNeFJYUXAxVnRTOUJMcnJCd3B0Y1d1VzVxL2hkRzUxZUFk?=
 =?utf-8?B?RzcyYVQwaG1MSWs4eEo0RHlOMURodjhIYlkwOVdKeGtkakJYU2tQVVpGcTJL?=
 =?utf-8?B?MU1iS1BzNnIvMVlnam5IT2FqTlhsMXdSWmVKT1ByMTNaa1VzOUpKaHcrWWtB?=
 =?utf-8?B?SkJ1MGpPcnJsbFlHZldKWXhhaWFGa0Yza1hNUU9kMVVxeFI2bkJrWGJwcDY3?=
 =?utf-8?B?Vmc5NkpjKzJrU01xUTQwY1czZmptNnoyeU9tQkRJQm9heVp1dXBkRUFxVHJ2?=
 =?utf-8?B?MFViWHVWc0gvc3hsRVpQblVRR2RyTGJ6SkZwSlA4RnZOamluYzBRR1BjcE1V?=
 =?utf-8?B?eEpKVTVML2h4NVIrWG5mTlk5M3Y3RTVyWml4UzVoUFA3alh6Q1VPb1J5OU11?=
 =?utf-8?B?UVV5RlUxbjNkK3FWdm1TMy8xem5NN3gvQUR6YVdyM3V2RXkwRXEwUERDZG5M?=
 =?utf-8?B?WHJUM29hTFRWRExtMnhyaDVILzF1TDJkSnloYVdGbzY4eWVmL0IzVmV3L3dD?=
 =?utf-8?B?ZmducVZxWWt0R0IxVzVRaVNrMVFrU001ZEFPVUluVDVCUHZuMmRaYko0eEg3?=
 =?utf-8?B?R0htcWdGYmQ5ZmFZSzVMdFNHUDVSNXdaSHdXbFByRndFVnFhY3E3WWFDcW44?=
 =?utf-8?B?aDYvUlpzUkFmK0QvdWlxZi9sZVlCbEpYYk1oTFU1eW1PdnhzdUhNcC9Zc01i?=
 =?utf-8?B?dXU4WVNYaDN6TzhjcW5NY3YrbkFybXlNRndvMWtZOWZWME9NN2wreDVlK3l3?=
 =?utf-8?B?cys4K285U1FDY0diSU93NzRFMld3bFZSdGlQbnZPbVZoZkVIaDhEOHd5Slcr?=
 =?utf-8?B?bE1XMktMb2NySDJUNDl3Q3BLMG9FaVQ4QnZLeFdjbm5JMEROdlhuV1h1V0dC?=
 =?utf-8?B?ZFNTZTQrZXVpTWFtYWRPSXlDc0tiN1RWVkZFclFWRDRvSFZ0YXlOMmpYLzF2?=
 =?utf-8?B?MnpoVjhFOHNuc3lvTjJwTzhUbE4wcGlqcGt1eXBMc2FOV0kzZ0tUV25zOEFk?=
 =?utf-8?B?YVFvM3laRklRdjM0RDluMTRoRCs5dVZkbDFaeUJQcEx2cW9UMDB2T2tGVllV?=
 =?utf-8?B?VVVIZjJOM29IdEJOUy82QldwMUFOT3M3QmR2a00rNTAwUUFYMlV0WGZLM0pO?=
 =?utf-8?B?ZTBCbXUwYmllZWF2WFpRNmplYllGNVg1N0c0QTExVXE1RFpjVERyWXgzWkhR?=
 =?utf-8?B?dVIvMTR4YVJGOVZDa2xMNE5WektGWHNGb1U4ejc1VVpRR0czMmppM2tZWG5k?=
 =?utf-8?B?T3AxeHBWdldlRWdxYVNaZUpyNjl0YThDUlJaNVFEZkc2OXlXT1U1S3ltUEht?=
 =?utf-8?B?NVZXWjJzTTV3aDdqZVhWK0E3eHhWU0ZPcE9rcldKYnpFQkVpeHhGb0FGS25h?=
 =?utf-8?B?dW9MenBuVXNVSzNuWUVLU0lIMlVMZ2NBbjNMaWFDV3JzNUZLN0pMOUZmLzRs?=
 =?utf-8?Q?paHIlk4N/TM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVo4bVFWZ051WnhpVDZWNnY2QXVuL2ZFT0tXdFlFZzVEQ1I3NCt4K2Z2cUc1?=
 =?utf-8?B?dnh1SjliZTJuMVNKQ3REUi9Ia1BIUi9Cdy9teWRiL0QrV2lxTkttSisrRzUz?=
 =?utf-8?B?R0J0Q25Ebm8xem9VRWp0RFQvNEtiTkxGa29iMkpaNkNFYzBIUDRaMTQzTVUr?=
 =?utf-8?B?NWE3OTFER3JxNDAyRHBHbm5oclNvSEw0ZjlPQ3hUNTlieDFDOFk4NG9Gcnc1?=
 =?utf-8?B?ZDlqRVBuQnZkTTQ3NGR5RkRWazZ2TEFQdVdqZmxObHRZUC9qVlh5eFZwSVpv?=
 =?utf-8?B?QStyc3VGYnExcSt2cTZlS1RqTVMvci9jV1FLM2JUVUxySU81TG14QlgvOFdu?=
 =?utf-8?B?dURRYjltQ0xyaXFwd1VkTXZGaTJhUHg2Mnpyb1R4L3pCRmVnaHNCaXVGQ1Q5?=
 =?utf-8?B?OFFZQUN3N2JCUWdoOUFlbEV5Z3I2WkxqQndjVmVXeEpPOVgrWGNVbk5hcGZv?=
 =?utf-8?B?TzRVRkoxTVNEY0dBMkZscmpqdWJRQWZUNXRzUkZuRjdDNk1oYWg4alI2bTdh?=
 =?utf-8?B?M3E5NW1ITi92Vzg0OWVWUXR0K0FoK0tnVElQTWQvUW83NXVUaW16d0lRQjVp?=
 =?utf-8?B?dFhEN2kvdTFNZjhCOWwvcnd0eGxyeS9JUlRjelovdElFT2J0VHN2Nk9CVGNp?=
 =?utf-8?B?NGFPK2I0K2NwVlZ5dTAzKzlrKzd6VDVLQmk5SUEzL2xjVzRlZlhlWEt0aVVS?=
 =?utf-8?B?WU5LV0Zya3ZQeWFCbjFaem8vVEFhc0FDeFJxdEE0QUtUajdJK0t3Y1JzY1Vx?=
 =?utf-8?B?UWJsZlM1cU00bHprdFEyZGRIZmVFUXV0VEJhQU1ZZUdCVTFSUkQ2MnZEbTFU?=
 =?utf-8?B?L21tT1k1Z0lMT1pYR2prTHBWSDZXWW9va3F0bHNtVXk5TmUyQkw3VjBKNmN6?=
 =?utf-8?B?eGZadVZOMjVwTUtoNTJCRVdrazVEcVpIZUdrYVd0Y0ZzcG53cVRoai8rYzUw?=
 =?utf-8?B?QzFRMDhnMG9hKzRNMmVQR2V1VkJLMUpiTko4eG1GcmRCTUFFK2laVmcyT29W?=
 =?utf-8?B?bEQ3VEM5NEdaQitFN3NCYTVpUjlFRzVVdEVndkp3T2lJRXpjN0oybS94MDhn?=
 =?utf-8?B?cExjUUNwcjE3NUkrdllxN3FHUmIvaDZ4dUlqWVFzL3E1a1g3VTdzT2lrTnZV?=
 =?utf-8?B?L1lTbTJpL2NhUjlFWE43VDgzc3dRbnpvdDg3amkwdkVaTzh0NjBNaXBrY2N1?=
 =?utf-8?B?Tld0N0xUYWFWKzNQZFFyYk0yTUtDOEtFUjZDTmI3YzBNSTFNUEE2dmhKQVhx?=
 =?utf-8?B?RVdvMnZKM1dmdk1zcldHTlcyNXRhL3Fpb0Yxanl5Ymx5ek1CenNnU3FiK0Nk?=
 =?utf-8?B?blBXQTg1ZENLWVFoNlBUV0RHQWJpQWErWnRxeHJadE44TXFXck94OVRpNWE1?=
 =?utf-8?B?V1FZWitobHNCU3J2cDNTWStUOWdRQnZOQWEwTlFvVWtCeG9qendtMkVTSi9X?=
 =?utf-8?B?VHJnK2tRaWZuMzVVK21hc0Q0alpkVGxQN0k5eHVQK2JZWG1WRXN1VFYyVGg4?=
 =?utf-8?B?K1ZXSmUwaVZ5V0VtK3ZjTHdhZGY0OU8zMzFZS2drMjFnazAwT3JGQ3g4Ym1o?=
 =?utf-8?B?U1hSRkR6bHN3UzdXOWxscjVXTEhya2RyMWl3bGZ2RGVzTW5jeXpQSTA2UDQ5?=
 =?utf-8?B?QXB1Umw4VVJKQktLUllFU2ZFZTgveUtINkVkdGpsNnlQaFVVdjJ3N09uUTlS?=
 =?utf-8?B?V2U4V1lYL2JHTE83N3pNd21uc0JIRmFQMTFubEt2TlZGT1VNbHNhVnlKQUdj?=
 =?utf-8?B?MjY0OVE4SU9jakc5Tkh0UjZDMFQyWE1uRlZBU0E1b0M5ejVocEZtNXF0ZFpm?=
 =?utf-8?B?WEVucXEzVTlMOGphYStKaWZzdWZ6RHcrL1hySlJGQzREMktTUXljc3pERXU2?=
 =?utf-8?B?TGZmNVVybjVBUGNWUW5HZDlBM3JDYVhRWExqNXdTTTkwZEl5SzV1T0ZVOFZr?=
 =?utf-8?B?TndGU1hOL3NhQ1pHU1FUcFRYOEo2ZTZUSDhwR2tOVk9YS25DVUw3dmxKS3Zn?=
 =?utf-8?B?UjJFSVNrUVRVWXFrbHNLWWFndnFaOHVITnNYK0plemVGcnRpbDFKdzNCU24z?=
 =?utf-8?B?NmgwalNra3JLNnBDS29tV3VGSTJQN3kyalpTSXpieVdLOXBlS3RyOWlmS2pV?=
 =?utf-8?B?cUsvZ1RpdmNNTDZZNjlsbnRFNzVPbE9OM042c2RldEpOdFZuSGpQVHVRY0lR?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c90541-d400-477c-fb77-08ddf52ecc80
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 14:39:10.6708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D6ZomudpxmT8RJx96YLZCtLA7HdA140pmheYNRS4W0Hq0U+l30o2TCfNIqbCFtmUozrbKRDWPM/claDxirr0ruzT7fq/Qmm18HP8CrXxPzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7468F7991
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


please use correct subject prefix

On 9/15/2025 11:47 PM, Zongyao Bai wrote:
> xe_device_sysfs_fini() and late_bind_remove_files():

above line could be dropped,
below lines don't need to be indented 
>   Adjust the remove order of sysfs entries to follow LIFO.
>   Remove configuration and status checking,
>   call the sysfs removal unconditionally.
> 
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_sysfs.c | 32 ++++++----------------------
>  1 file changed, 6 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index e5e3c56ea53c..693bfda1cfa6 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -184,25 +184,8 @@ static int late_bind_create_files(struct device *dev)
>  
>  static void late_bind_remove_files(struct device *dev)
>  {
> -	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> -	struct xe_tile *root = xe_device_get_root_tile(xe);
> -	u32 cap = 0;
> -	int ret;
> -
> -	xe_pm_runtime_get(xe);
> -
> -	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
> -			    &cap, NULL);
> -	if (ret)
> -		goto out;
> -
> -	if (REG_FIELD_GET(V1_FAN_SUPPORTED, cap))
> -		sysfs_remove_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);
> -
> -	if (REG_FIELD_GET(VR_PARAMS_SUPPORTED, cap))
> -		sysfs_remove_file(&dev->kobj, &dev_attr_lb_voltage_regulator_version.attr);
> -out:
> -	xe_pm_runtime_put(xe);
> +	sysfs_remove_file(&dev->kobj, &dev_attr_lb_voltage_regulator_version.attr);
> +	sysfs_remove_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);
>  }
>  
>  /**
> @@ -287,14 +270,11 @@ static const struct attribute *auto_link_downgrade_attrs[] = {
>  static void xe_device_sysfs_fini(void *arg)
>  {
>  	struct xe_device *xe = arg;
> +	struct device *dev = xe->drm.dev;

if you only need "dev" here then maybe pass it as "arg" instead of "xe" ?

>  
> -	if (xe->d3cold.capable)
> -		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> -
> -	if (xe->info.platform == XE_BATTLEMAGE) {
> -		sysfs_remove_files(&xe->drm.dev->kobj, auto_link_downgrade_attrs);
> -		late_bind_remove_files(xe->drm.dev);
> -	}
> +    late_bind_remove_files(dev);

as you remove files unconditionally, does it make sense to keep this helper function?
maybe just move here:

  +	sysfs_remove_file(&dev->kobj, &dev_attr_lb_voltage_regulator_version.attr);
  +	sysfs_remove_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);

> +    sysfs_remove_files(&dev->kobj, auto_link_downgrade_attrs);
> +    sysfs_remove_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
>  }
>  
>  int xe_device_sysfs_init(struct xe_device *xe)

