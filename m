Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243E8CA0FED
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 07:42:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CD810EB2A;
	Fri,  5 Sep 2025 07:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="itzrxZad";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9B310EB2A
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 07:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757058158; x=1788594158;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ilCs2YHfEo9kRPv8TT1YujR1XBIRQ3omUJrlEFeDDOk=;
 b=itzrxZadYSjpk3ARE8rch9AXAehaUU7qYTxnD2IhHXNQ0H4RzdExW+8e
 71/JmUI0J947FfKvSKoGFbDlVzs7BH7rykkzD8cF90dvSlb7H4v1yuVOP
 uM28SL8Q0HiWkdmx/rJWm5T4uIo2DUpGA3PMiq6UP7IW3L1TepaGA4gcv
 vr6OgpR+S7MsnqdFWtol3DWFpXtDISjeHpan8UpbD0tpZoZO7xq9SoAHc
 U3x83Kk4SBhdsIFwOHE1h7jj9kdZq/eX6oGkqlSGBvkgM3lFf2RkPC05U
 kHU6I3xTKMypOW3Ea4PGliEq7x1dMzQFDP0eV0OwsUR/qGyHVv3G6dyMT w==;
X-CSE-ConnectionGUID: HLDLK5UJSBKbGVIAyRjOXQ==
X-CSE-MsgGUID: cFYENsYTQhKh0Qtzyheseg==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="70021561"
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; d="scan'208";a="70021561"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 00:42:38 -0700
X-CSE-ConnectionGUID: ws9StT9JSUmiB7smDx8qNg==
X-CSE-MsgGUID: F5054bhKQGOhFXeMPO3vsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; d="scan'208";a="176444966"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 00:42:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 00:42:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 5 Sep 2025 00:42:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.88)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 00:42:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7bZJejVvM3By1DP4N6k/+hp7IBS40nKab/96rCb7QhUQR33OubvdATgrIAsHJ9ogaNNCzrMCoT96n1u3ePB/lKmJYokzakNcD+vyzeZzJWcwlRW/aLCxWXs2nrwOlm7aakp5FQpi39dGRCYzSFH3Ja6EJwi9y+ZTfTGJV8ayYLmSkOS+D/sjr55AxoV0AKV1y40suScjVSrt4Up0MZOVRUOvTh9N1bFWiqX2Z1GXqzSYl8I6XqsuTf4NYQacLRiOAsPXWyfha6kQ1Ibww+NdhKwCSJb5DlaaRnwcGMWtwdWibE/6Tm4u8V/Gs53iAsjVWGlEiwAQuywT6mcgPc9eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5oHnXvXjrsL+BGHNq/KXLoeNlOltwS2HLsS43UNSA8=;
 b=tRy8vPvpgzCm+1fIAonQEy+I9QWr1DMvIxQyD3U3ZF904p/FX0jjkkmq5s1jPXk8KNDuNuK33JddS0MRCJ+lRe/0Vshjbwix8Z+ZqaHviW1D/ROTunaJrPAA1GvV4rgWoXmY3SoHTBgsyl6XEIQ1nFlSFaQSdXe7Ifkkp7ILkIsvtaLf5Iq7cQpHsPLsQvILEZRcoqmBTSRvgonY8ZinJXARi16ELD3tie/1ulHVKLISuRHXbhgEDPGa+pSRWkCAM2e2kkrAftaPKI9AEe89cwlHX/0l0e/1x2LoDiL9O23/6hZ3iUDVayXE6K6YSEpBYxodJ+zYdiRUROWtkqu3uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by DM4PR11MB6237.namprd11.prod.outlook.com (2603:10b6:8:a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 07:42:30 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9094.017; Fri, 5 Sep 2025
 07:42:30 +0000
Message-ID: <7cb6f98b-dd51-4036-9fba-488415d9284d@intel.com>
Date: Fri, 5 Sep 2025 13:12:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/xe/bo: Add xe_bo_has_valid_ccs_bb helper
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20250904192918.7346-1-michal.wajdeczko@intel.com>
 <20250904192918.7346-6-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250904192918.7346-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::9) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|DM4PR11MB6237:EE_
X-MS-Office365-Filtering-Correlation-Id: a0857e87-5ccc-47d4-380a-08ddec4fc447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d09CK3VnRXJuYkxwT2RSams2TUJHN1JhUDdRQXBoS0ZXNldvL24xRTR3TFA3?=
 =?utf-8?B?VTVKR09mNnEwMkVVVGZiU3I5MTFUcmVXQVE5YmpiQTBacDJvRXUvS3Q4Yktw?=
 =?utf-8?B?d3hMOGFZUitSWW5JYzJEdi8wckhqRmVmUUlBUDIxSHZZb0RDcFg4ZlRLT1Rt?=
 =?utf-8?B?YVNHaTI5U29teFdCVFI4dnFIMDE4S1Q1bW5kV3NTYVlwKzA3OGFzRWVTc0Fj?=
 =?utf-8?B?dmpWc1czMHlCMDQxRGpUQkhpUUxwM0w5cnI2OWhNd25pVXpuenNXejlWV2pU?=
 =?utf-8?B?cStCa0xhMzR1UG84T1lsVW42RHZmckxnZ0hMR25HR3k2VmVmaGNVME12ckhK?=
 =?utf-8?B?eXRyRmcxcEkwL0V4bGlXTmIwZk5OSmQ2RndWWXFNZmpPaERSMGdLWjJvejVs?=
 =?utf-8?B?bjBQUk1mMENXTStzOHg2L1Fkb0RHZU02SkxtWm5GQmhoUW1zQzNCcWkzZUlL?=
 =?utf-8?B?MXdhVjBpWGpQN1VySkJIMUI0N0FzMmp5WElmSGJTUlZCZjc2YTlqbSszcFYw?=
 =?utf-8?B?WVBaamtNdDdBVzZFYTZyUlFSekN4cXRucWdUeFQ1dXNKb1JHTEVsdGdqTXdk?=
 =?utf-8?B?a01kY0FucEE4aGVFM0VTM1lvNC8yRmlQN3FEa0c1aHQreWV1SjdXTGhSMkRJ?=
 =?utf-8?B?bjdjZmtKdWVYOExQTEsycEtELy8zWFJ0V2VtMWtrTStXVWYzOEVIUEJZcy8x?=
 =?utf-8?B?M05yQ2E1UjR3TW9PK2FlcWxQeFVuME5hTnJZTi9leE1mWk1pbHhycTFINFVS?=
 =?utf-8?B?T1pycU01S2o2OTdyNVlmYWFUbmowaFR6Nlk2QWd6WEcvOHk2MmRuSFcwY0R5?=
 =?utf-8?B?WHp4Tlc5bVZtYlhub3huQ1JBNW1GTjZOVWorMEJzaElJRFU2RFJjOC82eSs4?=
 =?utf-8?B?MjBLT29qLzBOdXdPdVRLb1NHVHNFSGZZamd2YWdLbXJueEhRajcvZTRJY1NU?=
 =?utf-8?B?THdaaStEWXBiTVZEUlZXTmxJV2c2N2lKWHBaeGUvZE5xOERHQTQ2Vk50NEZr?=
 =?utf-8?B?K1ZYMS90Y1NtL2RZMG90RnBQVzNiZXloUU5WZ3F4QS9NaVR4UHVEWkFLQTh3?=
 =?utf-8?B?KzV6azVhc285RVhtcC9tSXEzQ2ZYTnRhWlR5M0pxZ3diQ1FYeW5GbkF0emo2?=
 =?utf-8?B?S2lCQ21BYjAxSDg2a0JITTdkUVhCMnRnLzdiaTN6aFU3RTNWenRSZ2R5aWJu?=
 =?utf-8?B?elpoZ25MVmVUQVJwRGk5Ny9xKzduYUt3Szhud3g0UWRMVGdYdGpoWlR3TWdK?=
 =?utf-8?B?VXlBS2U4RDd3S1dYaWg2SUQrV2lxdjQ4YkZvcURZRUVZd1BaOWFsTDhJejhF?=
 =?utf-8?B?WUQzNnNoSFVxR1RwZlZLLzdqSDk0KzZ5RmVPRERpUDBuWi9QR28vZ1FEaVow?=
 =?utf-8?B?bHlnYW8vZVNKUFBPRWlZNi9CWjB0RmVVVGNoZVZOOVVLbCttR2xTbzVuSWtS?=
 =?utf-8?B?U1JpVi9IeE5vWkFqQ2lNRDlrNUQ5T0pxbG91VlViUmtpVTdYZGhuYytpRHdQ?=
 =?utf-8?B?b21CZHhIWWVjejcyZnM2L2wyNmc1V2FqdUFiMTRzeXYrNnJ0YlhkWVdRUWR6?=
 =?utf-8?B?SU5IY3YzcGpNSzJNbHBRcXpoVlZNTGtLc0YwRVVNUVJabGwxaXlObFpwZzd6?=
 =?utf-8?B?eEpnaUtWL1VRSERZWGp6YjcyTGQ2czNnSGdVWDNiRldVVHZuSUhQZUJzNzlI?=
 =?utf-8?B?cGhlbWkrTndGSHIzWVFkbmhOZXpWR0NOUWEwTmdvUERyRFc3cU5tYmJiRDY3?=
 =?utf-8?B?N0hKcHBIK0RtNnkyb1RuaFRBN216NVJUbXlIMEFJYUlsc1hybmt0d3FTdzNN?=
 =?utf-8?B?aS9FVUFqN1RjT2txWDhtU1M5UzFRdTNoQWQrTHY0WXdGM21NQ2M0N2JrdjZJ?=
 =?utf-8?B?eStoanYyWXFZZm1pYmYwVCtUay9rQ21QcVZQc3R6T21qVDBzeThsa2cvUGQ5?=
 =?utf-8?Q?5EHv/7cyGwQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGlReklmRVNIcG5ZcDMrTTZLSnNDOTRocVdzOUZkeTYvNytzbDh5bkRTbFhI?=
 =?utf-8?B?eFh0K3ZkSG9MM2tqbjZ4Z3k2cWNYaFVtWlVjS0Vka1Q1WFErRk9XanZ5QkhE?=
 =?utf-8?B?czErOHlZN1MrYlVEaEg2WUI5bm9MMTF0SHpBSWxOSHMrOEhybEQ5Q0lLeGZO?=
 =?utf-8?B?L0RtaCswYTkydGhFNExNTllZYlphQU11elZSbnh5cXNwTk9iOWh3VlZyekJ1?=
 =?utf-8?B?bEhwOVdETXhYK005YUVWWjRMYzRoRkVKWW1LM3ZuOXA2THRhZlM4UlZycHY4?=
 =?utf-8?B?REtuWmV3WXVndG9RT1N0UWFGcDdpWGszQVFKckJzb05CeHFBdjhxVUxNWmI5?=
 =?utf-8?B?NkFKREdtNnJkdTY1NkFLdnI5aEF2VUlXSHF0WTk0emFzcnpKak1ObkljclVu?=
 =?utf-8?B?cE0vYTBucmJEVGlJRjlJYzJkSU9WeFFlNlY0UWZ5dGR4TXNkcFA4VTl4ZlhO?=
 =?utf-8?B?UXk3TEpHQ3gxaSt1bFRNWVdhM05qTWsyZzFDWGxoR0xxN2JhcU1DZ0FmdGNZ?=
 =?utf-8?B?ZGZPc0JCR2RSRy9lakhEb1cxRmpIUEg1SHhVam9sV3hERE1FTnVwZ2pSMFpa?=
 =?utf-8?B?djRrVzNVSkFQZ1IzTkR5Zld6clVrU01jN1FTbU1VSjFhRmxnM1owTldkcXc0?=
 =?utf-8?B?dXArMGN1em8wTjNsQUE2UklkN3VlcHloUHZoK09reVkrSWNWZFFDTzcxUnpl?=
 =?utf-8?B?UEM0emR2MkNONURLRmR5Mld1RHR3NUV4MXhEUGl6N3B0SGtBdWliLzJmc1c5?=
 =?utf-8?B?eXE2ZVMwREU4Q2tpeXdLVVpKQkhDNDZzTzBPd2xhN05MNDE3QWI1eVVDbkJx?=
 =?utf-8?B?NWNaaXNQTUN0c2M0M25QQWp0cDcybm5DNDZNUTF2T3dSVUVlMnpFQzFuUEhp?=
 =?utf-8?B?Rm54YWNNdjFPSDVIVVRQb2xwQ1RvRUxQaEhFMEc0aXIrK1ozTUg3U3JCUXVx?=
 =?utf-8?B?aDdTVXdvQkxvZGVIaWNxT01TelBiNUJvc3ZzN2srUm4zblpia2MyaGM2ckZN?=
 =?utf-8?B?UXJSOGtBck1RWjJhWnkyVmtWWHNkNnBKNVA1bzdJaDNUcVRNQ0pNckF0bHJ4?=
 =?utf-8?B?aVRjNTVJNDhwZ0RueGNVV1F3SkRkK3lyaHBqSzZ2enRpRTMvUHJyVEwzQW1Z?=
 =?utf-8?B?T0JPdUxObkVnMUErQ2sxdmxqVVFLMkNKbS8yb3dPamZIR1ZIQ0dUUnJpVkw4?=
 =?utf-8?B?U1VFNWpZWCs4SVVoV0loQU85cmoyMllmdS84SExWUmNDTWtGQi9mcTJHSG1k?=
 =?utf-8?B?aXpBUzR1WFUvSjh1S3grSGNSeEdDNWhoV0h1SkRHR0VvWDZQaEdpVlI5ZDRL?=
 =?utf-8?B?ZDhyTzNCYjZjZGRwcGZyMXdDMEJEWlgrUWFhNFBJcnhXNndPdEcvYThIQVdB?=
 =?utf-8?B?V0RuQ1p3NXdxeHpIUEtoZU5HN3JrUmdhWUlqempCbS9PTU1pUHcxK3lqbFNo?=
 =?utf-8?B?UnBFemxIQWhkMzRKRjV2QXpXWWFlSDdrd0Y4N3pRVkhBTkcvWUVTVXplbmJT?=
 =?utf-8?B?bWpMcDVUZmw2dnkwVThEN1Mrd2U2Wk5SbFh0MFkxUzV4dUVHYVpleHY3cGlu?=
 =?utf-8?B?OHpUU0g3Q2lXV0htLzNkRnVYMWN0NHRFa2hSNlV3dnNQTmdYZFpnSmQ0ak40?=
 =?utf-8?B?bStldTFPMUNteEVnQXJIWXZQRm1DRnFVZFVacGVOK3FDV3d4VWFISHp0dDZF?=
 =?utf-8?B?aHJ2NG5GTmxsWUVsOTNEVTZ2RFNSRDN0WkRxQUI3dnhlaUNtRndPSXYwZ1JM?=
 =?utf-8?B?QjIyUzc4MC9RNyt5aFNjc05HQnF6Q2pSVnkvTkNGUDBMcDhOdHk0ZHY3T0Vr?=
 =?utf-8?B?aXNReE1HYlU3dkJ2RklMUEtpZXVJSklhenVySFltTS96WWp5YWFWbmJhdG82?=
 =?utf-8?B?VWYzK0QxUHdFNnpvRC8xWkRKai9NRWlraFJZSkVmY0dqYWVtaVVQanBZR2Q5?=
 =?utf-8?B?QXFuRVZiekozSE1BdzFOdGR2OHJLdTU3V1JjNCt6bEZvS3pQNXFPMjhRVWFZ?=
 =?utf-8?B?dnhPZ1d6dDI5VjY0MHFZbytjNVdWbWxkMCtoMEt4U1g5ZmpJWXlxSnVYWXFR?=
 =?utf-8?B?QlJEbGhSNGlIWG9yOWRVOEhvTldpV01VbGJFcmxlMGhPeHV4aHdUcVRQaHc0?=
 =?utf-8?B?bU5MQjRsZkhtUVlVTWdFdDlZSDU1U2pQZHNINnJvbEljSU1HWkVMY0pOdTla?=
 =?utf-8?B?dlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0857e87-5ccc-47d4-380a-08ddec4fc447
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 07:42:29.9733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HtlGU7rb/s3m9+i+2WmCwMV67zMAEyUA9QmxafR2l/6RyIVqNNFnnu+KrUOOBherE+HVzfCuJhcSpWMpDNu5E2pOyIV2lM0MjTzjypOm498=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6237
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



On 05-09-2025 00:59, Michal Wajdeczko wrote:
> This will allow as to drop ugly IS_VF_CCS_BB_VALID macro.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.h                 | 15 +++++++++++++++
>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       |  2 +-
>   drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  8 --------
>   3 files changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 8cce413b5235..5e666fc2d00b 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -315,6 +315,21 @@ static inline size_t xe_bo_ccs_pages_start(struct xe_bo *bo)
>   	return PAGE_ALIGN(xe_bo_size(bo));
>   }
>   
> +/**
> + * xe_bo_has_valid_ccs_bb - Check if CCS's BBs were setup for the BO.
> + * @bo: the &xe_bo to check
> + *
> + * The CCS's BBs should only be setup by the driver VF, but it is safe
> + * to call this function also by non-VF driver.
> + *
> + * Return: true iff the CCS's BBs are setup, false otherwise.
> + */
> +static inline bool xe_bo_has_valid_ccs_bb(struct xe_bo *bo)
> +{
> +	return bo->bb_ccs[XE_SRIOV_VF_CCS_READ_CTX] &&
> +	       bo->bb_ccs[XE_SRIOV_VF_CCS_WRITE_CTX];
> +}
> +
>   static inline bool xe_bo_has_pages(struct xe_bo *bo)
>   {
>   	if ((bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm)) ||
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 30aea958a337..eb8436e44ca4 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -363,7 +363,7 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
>   
>   	xe_assert(xe, IS_VF_CCS_READY(xe));
>   
> -	if (!IS_VF_CCS_BB_VALID(xe, bo))
> +	if (!xe_bo_has_valid_ccs_bb(bo))
>   		return 0;
>   
>   	for_each_ccs_rw_ctx(ctx_id) {
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> index 79092e386c4a..4d3c10907135 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> @@ -15,14 +15,6 @@ enum xe_sriov_vf_ccs_rw_ctxs {
>   	XE_SRIOV_VF_CCS_CTX_COUNT
>   };
>   
> -#define IS_VF_CCS_BB_VALID(xe, bo) ({ \
> -		struct xe_device *___xe = (xe); \
> -		struct xe_bo *___bo = (bo); \
> -		IS_SRIOV_VF(___xe) && \
> -		___bo->bb_ccs[XE_SRIOV_VF_CCS_READ_CTX] && \
> -		___bo->bb_ccs[XE_SRIOV_VF_CCS_WRITE_CTX]; \
> -		})
> -
>   struct xe_migrate;
>   struct xe_sa_manager;
>   

LGTM.
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
