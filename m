Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2499C07E8E
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 04:09:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A28D10E9DB;
	Wed, 24 Apr 2024 04:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uy7VYQzf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8F410E9DB
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 04:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713931785; x=1745467785;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y4+FUC36aJJgnjdl86v9Qij2JJmEfDyFQfCxwQGCnoc=;
 b=Uy7VYQzfeGQTNyFbhOnsV97G5HRnDJJmjMnwY0jfVfH4ulKRAX8zD1Fm
 GgRFvCOyrxd/1W5jbBD7DNmCW1cSPl6gItHz9AnOHHtVpIV6x6fE1SPBt
 a2hRNYlsQC6pE66jj7PafOQm6PFAosmWGBmY3gHE22z7dxxmpN8XEoEc9
 1o5nfrB99KZ6/Uyzte/DElfNn6pn2V91LnW/8NADEfiIIVBPKFnGshACF
 EfA/EQHGHoQbW7i4Dky9En1Rv+XUhh5JQhLtKxf+lUUtOiNwJ571w66BS
 hRWpw3HachLtB6kHkyn+/uxGM9G0WBHH7IlTqudnnLEWmATmFnRvMl3Mh Q==;
X-CSE-ConnectionGUID: GzGf1UfcQEi+hLngvKXDvw==
X-CSE-MsgGUID: avMZmyG+QMqR34+8kDVFwg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9762983"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9762983"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 21:09:44 -0700
X-CSE-ConnectionGUID: xz+aaxHlQoCbKdTR4AOSgg==
X-CSE-MsgGUID: /MCdBW77TjK09JeHspBjWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="55780898"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 21:09:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 21:09:44 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 21:09:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 21:09:43 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 21:09:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJmmf1HPvRae9OAugQI1IP/PmwC2Tu6ndUQEUmwKP9mUu2NGrAh8LoYKKY3PjbHr3bV4PzjESc31Q/JMUVICjpKTKnqIlaGDjBuWxOzTWiiFCXT+g1REKQPTL9w6CesK8Rm1PPm/fa6PB+rfoFTkUs62SbobdVys5dPGVvFa1NVEnWJ3BxWzlrtfOCb7aO4PODjSPGfoht0pAGttOC0WYZUQ0UT7DqbIpm/Q91AgDi3VxAL0DSyiPFPxG3/LFhuX6nWw1hGZ43HeouVVDc1zr6y5stAdYj3aK5FaycTyMnWi+/GaP3DepoR6H5mQ9puut4iR3A8ec5Z60aXllSWf+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9qrrvRbugcOvT5o3k25FK9FLRBhXUdRc3jqnijI0dU=;
 b=oaHuDALLje+7WgT8g6vU1Szp/X2SgUPihyZHpGEwcnrc6fu1xZFXOenDxtD9lhk/VrbeMeco+PXbeI7coTTcG57CdY336yf87ELBB1XXHXFHk0ZyU4wXfFKmfLtIlTxMzMb9X+6ADLwmn2FL7tZ2e071oo5lwXZBs0fZg/lIbnwXuKTfEzW0+NuwUpan3zczNEEnFNmD4e723VXJX6q9yiBiGlOCsTulR/DJRy6fJUa8O+vD2SpqNvWYShhvu55Ygny8SYn6fcr44P6dz7XZaemdG1zzsFoO8w2lmHuWekda8IMcTUHJhpXS2zx9PTlqFyzdu0piBNfeejs6k9YHRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA1PR11MB6491.namprd11.prod.outlook.com (2603:10b6:208:3a5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 04:09:37 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8e17:1f3b:64f:9c67]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8e17:1f3b:64f:9c67%4]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 04:09:37 +0000
Message-ID: <e5b7ca24-f272-41d6-b10b-2973b94e6dc8@intel.com>
Date: Wed, 24 Apr 2024 09:39:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/vm: Use xe_vm_lock()/xe_vm_unlock() helpers
From: "Nilawar, Badal" <badal.nilawar@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <20240424035756.2169209-1-himal.prasad.ghimiray@intel.com>
 <20240424035756.2169209-2-himal.prasad.ghimiray@intel.com>
 <ZiiCi8RUNDytoZoS@DUT025-TGLU.fm.intel.com>
 <19d1ea6e-eea8-4a14-a886-740f1f8a4464@intel.com>
 <062c0ae2-e67b-4513-a7d6-eecaf84020a4@intel.com>
Content-Language: en-US
In-Reply-To: <062c0ae2-e67b-4513-a7d6-eecaf84020a4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::17) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA1PR11MB6491:EE_
X-MS-Office365-Filtering-Correlation-Id: 92466968-63b6-4751-3bf2-08dc64145b0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGkrUE9GcEZWU1ZVOXJ5TmxCV2pjT2hpK0VIazRVRzRudVRvZC9NbEFSUFlM?=
 =?utf-8?B?Vm1CMHhvNXI1OVJHLzZkdnpFaXovWGtlMHlvU0R1RnhtMVh4cndVdWZzRUs5?=
 =?utf-8?B?ZjBSZXZ6UW9Hb2E0NnRkUkMvc3pRTGVZK3dkc1hJampCaWRtZy9EQlFtR08v?=
 =?utf-8?B?emR4bkxXVEIvOTB3WS8weUl2WWdvYVg0VG5hYkN4b0ZqZ0dRdTMyS0dxakhI?=
 =?utf-8?B?Q2Nvd2IwQ255RU5ZQ3FtTTJnRmZXc1JpMXNmMGVWaE0yaU5qQ1V6cUszV3J4?=
 =?utf-8?B?NUQ3QVV6eVNxVWpieFY5TWdZVnlkM3NaWUp4RVdTL09ycXMyd2FML3hNRTdZ?=
 =?utf-8?B?bGtLclNweE0yL1JTK29XNFFmbTNsc3pHejYrTTNhcnE4dkpvMGtxZTZGODhE?=
 =?utf-8?B?SWNrL3FiUmFJUDhBbTVtYjQzNTQ3RTFnbXVYTVNxVjdKNHlaQjMrYTFjZ082?=
 =?utf-8?B?THlMcU9tN2kvV1A1Y3ZzQU52OFhSWVE4VC9OekJEL1BuZVMzdlJEZFZmUm03?=
 =?utf-8?B?dG1LR0NoTWI5WFFOSlJFS2ZiU2QrSFBNTDlQN0pubVppekNBeHFQVm1EQVhY?=
 =?utf-8?B?emlqRHFSSXhadnpiK0FBMzJhRmIzQVhXZzIrOVFLdEtrcGdUd2J1ZTVnK2lp?=
 =?utf-8?B?Y0ZEc2Z3N0oxZWtGaUFXdWdTSzVoZ1JWemMxeUMyY2hBZ0RSRHYwcVdNVEl5?=
 =?utf-8?B?OU9MZ2hmcUYwL1RZMjdld25zSmxubnRwNUNQMmlYV1poL25QZFFFYTZiV0Q3?=
 =?utf-8?B?WXZ1ZTl0YXlJcm92cWMrYjdPbUdYcEZDb0xvOHNzSllkOEozRS96SnFkVXlI?=
 =?utf-8?B?SXBkWlRGemZJUkx1cXh0L0pmS255OE53TGhNeTRHdjVkem8xV3NndmUwQkY3?=
 =?utf-8?B?czVRUjltYWNYaDk2a1BpQVYwY0R1RkNTUGNnWmFxYysvejEwUDFtYy9pM1hB?=
 =?utf-8?B?aW1iK2VMWVA4MWF1T2Y0ZVcrRytlV3dQTjgwR3JPU1JMWG5RYngwbGFoU2tx?=
 =?utf-8?B?cGRSZkhzMyttUks0SVlnb2wwVnc2N0xOTEhvQ0hHMlM1Q3IzUkVVbTZLcWVU?=
 =?utf-8?B?aXBLK3VZNUNNcEpXcDlGc1lHa25XSHptNGFSbkVWWXd2Qi9QWnZteHl5VU1E?=
 =?utf-8?B?bFJvR2RvN1p0b2tqS3h2ckhiTUoyc0NyQTBCVXBkQi91RXlYazhHaTdDd0V5?=
 =?utf-8?B?RC8vT1hSVU9MWlBpM3dLM1lYbEJmamc0YnloOW1pUXpRbmt3cWxiUHU5ZS9w?=
 =?utf-8?B?MXlFVGViNkhTMTkvQjQ3c1BFVDcwUkJBOG44bVQvVndLUXorWFducVRNQytR?=
 =?utf-8?B?TzBYbytBT3VUMmJsNnVxTmdGa056OGsrbDFjOFp4T1JrNU9kSHlYYStqdnRG?=
 =?utf-8?B?bE13U255K2ltVzFNc25KWTRtajJWc0ZNUm05S1I5VkZCQmFRK0VxVlhjdWlr?=
 =?utf-8?B?M2xQNXJmbGd1aWhaTkovVHBERnhBTWNVOXBvTk40SmgxRkVVbDEwalpKcEpR?=
 =?utf-8?B?YXdkek9sVkxzUnU0UHhIZWQvblFQY0ZBR3JacGhRSGNway9xNE9LdU1TMFI1?=
 =?utf-8?B?Ykllbm1HQXp0OTlDTG51SE5sWGNFZkRNd1gxMFVHaW14VzYzem5LKzNtUXNk?=
 =?utf-8?B?dno0N0N2akV5UlVwb3VnSGFqQ3lNR1U4bjVudVRoZ2FNeVczQXZtTVdGaFpo?=
 =?utf-8?B?Z2VIZTRCeitobEROV3JaNkcweEhqamNkWmlNOVljeXFRbTJ2cU9hT29BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODhVN2JvR2J4c3M0WFZKZVg2OXVWNU5nZGF1bmczZWNaTU8yK3p2UWFzdTRm?=
 =?utf-8?B?Ukswd3UvZGxlL3JCYk9uQjcxYVpTVkdhbWg2Q1EwWkw2VkdYbERWd3hTZjdz?=
 =?utf-8?B?OXVncUhRTkpMVm56RjdESVk2SmtJVWxkVkwwWkN0RGF0VHZYMWZCM0xoMGRZ?=
 =?utf-8?B?a21XaGpVVzcyOEZvV3M2NURBY25hbzIxSUY2bE9SbmJxRVFsUHpHNTlJZWR4?=
 =?utf-8?B?WnNqcmN0YURva2szOUFNWGtsVnFzV1c2ajBkazJtbkZPK1VsNlZDWGJaOWxI?=
 =?utf-8?B?R1Z2WG91dXNEd2tmR0RuSkRONXhGYnErTkhxdE9PempoMjFua3VES3RpVGgw?=
 =?utf-8?B?Y3FJZnQrcFcrUVpidm02eHQrQmFPcjN1cTFqa2VyRTNTeHlDc212elN3TzQx?=
 =?utf-8?B?dTUyS2cyNUlBOVhhMDRYM3R6RFdrZWFTd21uekVUUGM0aU55VXE3cGNERW1J?=
 =?utf-8?B?QVluSXBtZWlsMHJ4VGhKVExxT05XTmY4MGhRZ3lYVy8zY3hKbHVaSkFGeEtE?=
 =?utf-8?B?MDRxdWhRdCtuMnJNZllXaW03bkc2dHR6NVFEVmJHY2wxSFYxMTdEU2FRWk9O?=
 =?utf-8?B?TDJIVWxjV0lBNTNNU0FuN3VCRmVWNVJuVFVKM0xiL1NYcnFZRlRJUnI1aUpp?=
 =?utf-8?B?aklpWDVGeXBiaWU1cElCR1kwVU5UaDdHM0RFamUvek9ib1R3TWFDK3NPZnQx?=
 =?utf-8?B?SUNaME1pTS9oNnZOZ09aaW1KTDA0WTFoczhmUkNIb2I5QlQrb3BjZ0U5L0kz?=
 =?utf-8?B?VG13NGx0d2JudE9sM0lwRGI0a3lpVDRpcWFXQzZTWllhOTJMVklTNUFyMFo5?=
 =?utf-8?B?NElTWWlJb2ZSaWpGZGFSRDVybkVxbHpieGVTanR0am5VOGhLNndjd1J4dHcy?=
 =?utf-8?B?SUMrOGl4dXdYN1ZBYnN1UHpjVW84OEI2dzZybFRseGtwbTVCUEc0aW1SZ2Uy?=
 =?utf-8?B?U1ZyVnVpUE1sUUVzQTF3d093N3hxemRHVFp5MjkwZkZVK01acGpDSjNTdE94?=
 =?utf-8?B?NGlnNXAzR3FEZkgxcnpqWUROVkZMblFRcWxjN3hoNytiNkRQZlM2Vnlwd0tC?=
 =?utf-8?B?SHd4NmM1V3Z5cFQ4M0dmTUlWaXpvSWtqTkdUV09FV1JtYnFtRG9VRFpoSk1C?=
 =?utf-8?B?aGNoN2VMUk5TcTRVVURiREVGREhwaTBWd3Vac1c4WHBmaWsrc2VJdGxOeWlG?=
 =?utf-8?B?ek9wa3owWEo0bUplNU9MT2hvOElIN2VyNVdhVmtFMjdzUi8rR0hSTXVOVERZ?=
 =?utf-8?B?YkEzS1RzdFVOdGhGd0NLL08yRWVtUmNrZjhwYXpxZUNDYTZMOFJTOVV5WUZL?=
 =?utf-8?B?cExEVFNmL0xRUDRJZ0k2Vzl5WHlUck5WcFhmV2JlL1h4dC9nWlBZdE1rNzYz?=
 =?utf-8?B?bm44Mm4vYW5oMHFBUTl3bDBrOWZuSHpDdzNnczROZDVnMUROaEk2T25SWHdT?=
 =?utf-8?B?b0FNWFJWNmtNRnpPaDNiMkQ2ZEw1VkJONEdrOU1oM2Q2N1p3UWRBMmE4RVg1?=
 =?utf-8?B?OHV1R2tFbC9QWC9sUU8weXh6b0p4N2tsNExXU090R09DY3U5OXRFQ0UxVVZX?=
 =?utf-8?B?SzBBNlZUVmRQbGNhNExEancwWmhNWU1yQ2ZLQkRieDBrZW9SNUNST0JWdE1w?=
 =?utf-8?B?Y24xaDFJNS9wdkpBNFNyeGhkZTQ2SCtkLzZuZUxYY3FiSnM2YUNSUkxha3pN?=
 =?utf-8?B?eVg1K2IwSlJESzJWM0d0UXJpdk1NODBmOURvYjdYblNnTGNSUHJuZVZNMjBD?=
 =?utf-8?B?c1NHR3dZU0labXlCOXIrSXhGVHlJQ3F4Q3RtU1JxWCtoSjlLYUpzN3E2ZC81?=
 =?utf-8?B?ZlZHdEIxWjRuT1pKTWNXK0NLS0oweFZ5bStiYmF4OStabCtwamR0c3NrRFA0?=
 =?utf-8?B?NnlMOGJ1TUxVL0RNQzlrc1U5cHhyMENuTndnYW5SeUJNUSt2NlFCWFhwZnNu?=
 =?utf-8?B?ZUNvMVpuSEFVZHZHcXptb0hzQ1N1MVhaNTBVdnFOM3ErOVorT1hNb3ZKWmU1?=
 =?utf-8?B?TVliRTZNc21BWTZ5RUlLODJ2bnBZWWVJQ1diY0pVdTVyVkc0UmJ1a1MrK3Nx?=
 =?utf-8?B?MU16cHgwQWNiTGQwdEdnREN3WVBpdXM1ZHA3dDJqeVZXTWE3VVg4czc0UEZz?=
 =?utf-8?B?L3NreWtLQ1ozYWZMM3MzSTJHL21KMkwrRk9XQit6UzNhSVlieEdiNXRpckZh?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92466968-63b6-4751-3bf2-08dc64145b0f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 04:09:37.2360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qd/2X65Bg5rORrXhtR0gASySrEwXY0VpzQCarCO0Wwz8oWMP5HuvD0vw7JKQB6jA9AbXi8ur9xKtdSDIPtjxYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6491
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



On 24-04-2024 09:35, Nilawar, Badal wrote:
> 
> 
> On 24-04-2024 09:27, Ghimiray, Himal Prasad wrote:
>>
>> On 24-04-2024 09:24, Matthew Brost wrote:
>>> On Wed, Apr 24, 2024 at 09:27:55AM +0530, Himal Prasad Ghimiray wrote:
>>>> There is no change in functionality. Using the helper function
>>>> defined within the driver.
>>>>
>>>> -v2
>>>> Use xe_vm_unlock() (Ashutosh/Matt)
>>>>
>>>> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_vm.c | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>>> index 85d6f359142d..c350c561e7d9 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>> @@ -1279,7 +1279,7 @@ struct xe_vm *xe_vm_create(struct xe_device 
>>>> *xe, u32 flags)
>>>>       drm_gem_object_put(vm_resv_obj);
>>>> -    err = dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
>>>> +    err = xe_vm_lock(vm, true);
>>>>       if (err)
>>>>           goto err_close;
>>>> @@ -1323,7 +1323,7 @@ struct xe_vm *xe_vm_create(struct xe_device 
>>>> *xe, u32 flags)
>>>>           xe_pt_populate_empty(tile, vm, vm->pt_root[id]);
>>>>       }
>>>> -    dma_resv_unlock(xe_vm_resv(vm));
>>>> +    xe_vm_unlock(vm);
>>> There is another dma_resv_unlock below the label 'err_unlock_close' too.
>>>
>>> Matt
>>
>>
>> Thanks Matt, Addressing it in next version.
> I think dma_resv_lock_interruptible also be replaced with wrapper.
> 
> xe_vm.c:1282:   err = dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
> xe_vm.c:3117:   return dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
> 
> xe_bo.c:2050:  return dma_resv_lock_interruptible(bo->ttm.base.resv, NULL);
Please ignore this, it is already addressed.

> 
> Regards,
> Badal
>>
>>
>>>
>>>>       /* Kernel migration VM shouldn't have a circular loop.. */
>>>>       if (!(flags & XE_VM_FLAG_MIGRATION)) {
>>>> -- 
>>>> 2.25.1
>>>>
