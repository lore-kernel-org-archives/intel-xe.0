Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990C6E64016
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 21:37:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5236010E2EC;
	Thu, 21 Nov 2024 21:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bwa52IrW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C31110E415
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Nov 2024 21:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732225076; x=1763761076;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iyeQpjyTTFMvUz9pNlW5eVRKPTpEnJBCvhKAwHp9VVw=;
 b=Bwa52IrWkVRYOrw3w0oIkwVfB6/eOBDwiWNppZqWw0o0LkoiRpQEE7oi
 2k0Sn8venvrZkJxijdOJJNCyKhx957+bH/RfMEvmVhxb7sDLgk5nnaiaO
 wAU8MldrRsa34CZt6CadjYA8m1707RF4B84KiGg85eZlWY8jfsUmcTYWi
 Yg40XfjshRokdGecPFIRjJOlZstzrG5gAex09mhSJF0blQ99YHi6csGS3
 xm2yJZ4kn3V4ocpfWttFfztL/eZtmdLiYfBY5vdrX/9ARWvu6Ee73G/KK
 KmPG0NDQ0tGz1txvAeUXH0XgqBTyAu5sKjn4z67lCOjeCxKwD4MoHdoij Q==;
X-CSE-ConnectionGUID: 9rosDVGmR+KKdz69P2f+Ww==
X-CSE-MsgGUID: 8tJ+NGb/Qmij+kmQKFeuTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32422304"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32422304"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 13:37:56 -0800
X-CSE-ConnectionGUID: B3Wbi/J7QbG8rxN+LTW+Gw==
X-CSE-MsgGUID: tpSgLr0yRbSLYWvThelzIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="95454880"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 13:37:56 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 13:37:55 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 13:37:55 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 13:37:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RwoRV2cUGJ6BVU6OJxp+Xd+thQ09ku2ZS2eg63sTzhhaj1IedkQeuPGbt8HJOqiIZsXCsWUWCrT+IcJ7G3iRa1hDKFt27+rJJodRVQ4vDXvRW6me03NmvxUInF3Cvcy0enpbjZvVCjoTJ+/tXsZk+F0HITHF52WdZm/WMzn6oSfVfUYEYuh9s/oqa18HTyZVKKyHiCWJZf4MJN0lFaMlDhw6lxG4eB9JoixiMTlctm6sR6oVfiexhPnfXW48cHmd1/+8gb8dKyrA5Kxlc0ww3kLYKZq3qH7LQjI4IOCZZ6EpEXRIL0MAaQK7KruaaTEJZov0SUDYmXW4jO2NLRuJEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsrUm64FUDXX6UPfHpJGYOGZecj1dUdaFnztLWAmyvI=;
 b=L08KrgqDO18Xp0gNxcr7An6c8/B2BIlZLEP8wXr/PzDflPGU/nvcyFOIHznNsUL3R/FiFhOLBAVD6Ap0xzfpzvbp+DUPOHRtoMFO01XlpiyS0b56P6WdQJpudHcGAxG/0u3CqPO/wY8voJWhSNQxk1xDDy3HIvaxyrRRTlkcmNxZelc3SUAli4YIZoK5uQ1anDd0cGsERIA2B5AOqLG1/wLrN4Mvas4n1zd8J07exw60KTh83MpmzJK8V2tmH8QOHpmw22b+fHbq2JtcNe3cRHeYzRNoFyNL4o8Bkq2KKl9zYzLX0kRu7y+g41XG+Zwyj0n0sJHMYczUHFTd/bBi1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9)
 by SN7PR11MB7512.namprd11.prod.outlook.com (2603:10b6:806:345::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Thu, 21 Nov
 2024 21:37:52 +0000
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::1e69:8fa2:c9aa:7524]) by SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::1e69:8fa2:c9aa:7524%5]) with mapi id 15.20.8158.021; Thu, 21 Nov 2024
 21:37:52 +0000
Message-ID: <7dcfa3af-35e5-40cf-a910-4b3cc1e34c03@intel.com>
Date: Thu, 21 Nov 2024 13:37:50 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/12] drm/xe/pxp: Add API to mark a BO as using PXP
To: Jani Nikula <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
References: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
 <20241120234353.1037180-10-daniele.ceraolospurio@intel.com>
 <87iksg29kt.fsf@intel.com> <cb789d6f-dcf0-4077-bc36-e630df0d9913@intel.com>
 <87plmoz759.fsf@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <87plmoz759.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0079.namprd03.prod.outlook.com
 (2603:10b6:a03:331::24) To SJ2PR11MB7617.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7617:EE_|SN7PR11MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bcbd0a9-ace8-474d-e71c-08dd0a74c086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDFsOFR1SVRGUlRQaHRhQzB0QitHcWNGcHdlUCtjN0I0Y0trS0s3eVMwT2pT?=
 =?utf-8?B?bkRMZUFXNlYyK3BmME1rQUpGSmdUc2U3U0U5VE9ROFdqUEQ5ZWhSVFUxaFda?=
 =?utf-8?B?UzlGbFdQT1dJMEMxRjhJZHVRbzlLcTNiYU56VVVPdFErWi9NK2p1MlBRK2Fk?=
 =?utf-8?B?VUxVb1lScUdzaFQ2bm1aNG1Qa20zRExaUVRPTTZJc2dXRzBsODl5TUZYTU5j?=
 =?utf-8?B?Ky9YUTR2V3JVU3k3WkxPb3E4empOb0dEc0YwNm5CaTdZckpDSU5sOGpQa3VU?=
 =?utf-8?B?Rzc1R0NobDJnVG0yQVdLQmp3bTdtMGpaVnlFV09tdkx5WTdMd2R1SVFiTWdt?=
 =?utf-8?B?WjlqSmE3QVlpSWJMa01oZDhkcW56SW1Ec3R4cmt2NnlraitzeEhxNFp3M05a?=
 =?utf-8?B?dVVtcTc4V0RMTE5SKzhvdnZqQkdrbFMvMXF1aUhNMXYwKzIwZGRlVVd3Tnhr?=
 =?utf-8?B?ek1ZNlBoeWdlVUk5YUJYWm5Eb25ZRko0QklEYUhHZHhOdmd3UDIrTGx0M3NO?=
 =?utf-8?B?aHU2cHRPbGh1T0NvdW1xWUFyM0VWaktER1VTRTZhenM3SkZMMzRteVE2UnAx?=
 =?utf-8?B?SDd4MUlmZmJmajJwYklYeWY4bVl2aDQwdGxCVkFhSHptT29JNmg4VENjQWVB?=
 =?utf-8?B?NW5SNTJUU0ZUYnd2VFdZZUUrNGhqRmJ3Mm5uNnZQZWRFb3J2RVYrVWlqTWlY?=
 =?utf-8?B?MEJLUlpwU1JoWVBMU3NFRVdkd2Fvbm9HcVIvNjhEdHduQ1lHbGlzRkhKd0F2?=
 =?utf-8?B?aHJjbWJOTjc3T3FJWm9Ec0diajhZZE5sTy8xSzZkVmVFVm1STGZwTUVIeVh1?=
 =?utf-8?B?TStlYXlEQ0RnejYxeGVxMXVsRmg0RWpJRzFXMG5hZHFZTmRVRzhSN2pHSFls?=
 =?utf-8?B?RUlKNWVrRUFkSml6eHJxcE43SC9vNWZCNGZmMlJJVVk4L0szMFZzQkx5T3lj?=
 =?utf-8?B?alo5SVFHR0dxMHVCZGFmb2dHdVpNQTIyWkVRdFNCTGYrZkNRV0NpVEF6eGo2?=
 =?utf-8?B?aTNwSllHVmJSK05lWFdCYkpSR3R1WEFBa3JkNkUzZnZQcnpxRFRHUi9lVW56?=
 =?utf-8?B?Q001V2VsU1lwUW1IclRpVkpaYVhjZ3U2eFVkbzRCeGI0d2crMjNuZCtBbjll?=
 =?utf-8?B?a1dIYk5kZzdkWTE1dEw3WEo4UFU1Z1dNNU5Wc1VTcXdNQnVPNmdiWXRaRU15?=
 =?utf-8?B?L0dTaDNRN2JZZWNiTEI0V2c5RDE2TFVSaG9Jc3J2b1JkWFd4NzBocnpuNU1m?=
 =?utf-8?B?cmlIQlVESUZ5a3NGS1pxVElrdjkyc055NUU5dERYOWlPc05pVTN6eDZNQmp5?=
 =?utf-8?B?eGhFV2hnZjhWcEtPdjRyNE84Q04xMms0QkhLd0drdzhvVkI2dkhnZXJ0Mk9N?=
 =?utf-8?B?R0FNQk1yUWJUZC95RkRrNDZnSHgrR2tPUzN2WkJ3UlpNd2lYb2JuOC93ZVRH?=
 =?utf-8?B?KzNyMzhqUVZNSUN1TkJuRERxc0hFZzNTVkF0Z1NkN3NpcWFzOWhnaGxEaWRl?=
 =?utf-8?B?WVd6bjhMYnNMSERMTm9VYlRFSzhNNWplbDNwblJTYW00NXYrY25lMXVDYkU0?=
 =?utf-8?B?MzUvNEQ3d1RGSXJmOWZ2OE04M0tpTWNiZjRZcWtoZ1ZzbWNFUnZDMXBZcE92?=
 =?utf-8?B?ME95VnpjVlFnbzNWUWRvZXY5NUMrOFkva0J6WlJRa1cxcTArTTI5WWVrT0V2?=
 =?utf-8?B?RG16TmpwUFByWlJ3dVdlSzN2MmlCN3M2NU9keUNCc201R0U5RXZhbksxRGhV?=
 =?utf-8?Q?DwoGz4+E6ovV8SGnf0MwoR7rzmZDdwlfEyUKOnU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7617.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0l0ZjJqakxXa1JHWGdUMHpaT0V4OURMS0pia2R4R1pGQjlEdnhOS2NtM0Nx?=
 =?utf-8?B?MlkxYnVaTUxwbG42ZWNpWXlPdU9qZzIwVGZReFlFQzV0dWFxMEZQSDFFM0w1?=
 =?utf-8?B?RnVHV0d1NnI5YzRrNlpyRjlmZmR5TDVhUUwwSGk3TFk0OFdES25reitPTGNz?=
 =?utf-8?B?akxxNE8zMVk2L05rRnE1d3p0aGNQUHVWdmNSZUtwekI1YmR1K1MyNFRGOCtw?=
 =?utf-8?B?SllndmJvaW91bGNvRU5TYjdxT2pXZkVlNkRBeXh6eUxwMkRmQXJyc1JLekpT?=
 =?utf-8?B?aXpFVkI5Rkowa0Y2OXVqMXoxS3dobFYzd1U2NzBUc3Z5cTg3dkoyOW5VZmZS?=
 =?utf-8?B?cWpHWmRsYUJEcisrZHBxNVFhaEhvUDFNK1labWh2Zm9WbVRLZHFOVXhITzFi?=
 =?utf-8?B?cmhMWE10cmluL3czaTVvcWl0c0IwZmNRRzJlSVJzMzNwdWR1WGpZdUg3eXJr?=
 =?utf-8?B?dGU4dlpuUm5iUUhXS29HdmhMZDV6bjNoUGJ2bmNUc0t2ZUJqak5ZeUk5R3BL?=
 =?utf-8?B?dmtrN3U2bjB4K0FWWGo5cmhTczg1S3lqVWlOc21yNFovNnRxWmhJL2tPUVlj?=
 =?utf-8?B?YlNrYkQxd1ZUV09pc2NyMlptcUw3aGpWcDdOaTVVMmd1UjkyZVQ3TW13K1BJ?=
 =?utf-8?B?MlczSUlweFdNeWhqZVJvSlBoOWZ5MnIrUi9uZGV6eVBMRHdpLzZFaVljcXB2?=
 =?utf-8?B?amhwU3ZlbUZ5ZGdaWGIyTFo1YjFlSGhVZi82YlBweHhPaHI3ODk4TUdtcFpL?=
 =?utf-8?B?WklzUGVjU2RVZWFqLy9OMTVYQnB6cmlXMXVvR3pYL2FnRVVSakN0UjFwdm9x?=
 =?utf-8?B?MnAwemV2VCswUHVjNE9MR0dZajhqRTJBZHNUM2VFaGF4dXJNYU9NL290Y0pp?=
 =?utf-8?B?SmFzUC8zQjh1NU1wTU5ENy85SWJlaWpDYnZJT1pIckdYVzM5aDBaTzdyVDdE?=
 =?utf-8?B?ZzArQlY3TC9hSURkeXpkMW51Z1R4RlBobXpaVHJqdlNaeTdOd0dyK2VOYTRX?=
 =?utf-8?B?Y2wwSWtDUmFzS2k1OUxxU0xjNVhDYUl2ZllremtSMzNFdElWamJ4Nk9xQUVK?=
 =?utf-8?B?b1pnY0VYZnRqSjZIRTJaMG9FS1h0SnpjY2ZQWDBuenpUSGsveEc3L1duV29B?=
 =?utf-8?B?QUloZEF3ZWpqSkpQVndNMlRseldldE5rclF2ZDBjNmVrdXNrcnZVb0xnOVVM?=
 =?utf-8?B?ZTNPYWdaWWxLTWxNK0d3VU9GelpPM2UrbkJuVE52OVdYNnFMNFMrMUtBc2tO?=
 =?utf-8?B?WCtrL0lMd3A1c1A0dXVyakNXNWdmdXBJWThXL2hEdmhRYkhzcWJ6bnNXWnl1?=
 =?utf-8?B?ODBrQ3p1eWw5ZEt1cUVaRGIzamVmR2NTM0h5SDNMU3EyU2dZSG1vWjh4ckZx?=
 =?utf-8?B?eXF4eWZxa0tnNW5kcXQ3THFCNjhKOXl6NzE3ZmNoQ3FIRUE0RDlSVitKV1RR?=
 =?utf-8?B?T2w1T1cxUk1NZVVKVUV4MzcwM25iSWE5ZXM0dks0ZzhtN0RCTDg3SWtROGE0?=
 =?utf-8?B?UDBhaWlQUUpEb2Z5YVQ4S09RaUJFUEwzY0FYVU9BdjB0YUZnblFmRE95WlRX?=
 =?utf-8?B?QkhzT1hLMndqd0E2bmhBV3Zabnd0YXB0TkZMR0tha0NERVhJLzM4TmtWRDdH?=
 =?utf-8?B?RmMrOGUvam1kSWZhUGJHSUZFMEk4V0Z1K1I1K0l4VWtnYkV2QmVFdi9UWHdy?=
 =?utf-8?B?MHE5dXlmV005QmkxL3JKTjFhakJ4N1MxUFNDZEM5YU45WGVaYmQ2b1lJK1Av?=
 =?utf-8?B?UHhEY3lPcEQwb0RXUCszcDJZTXB3dkJueUE3ZFJsUEtwOFJCTnBzUlFqbWw5?=
 =?utf-8?B?T1I3dUZoKzdNMWg0TU5kcHJmTWJSNEtudy91Ukl2U0FWWi9tWWZKTmJ6dDU3?=
 =?utf-8?B?MHRBSWUvVFZTbzVudFdsaHk1a3V2eDdnWGwzUWRRQWJsU1RuQWhTU2xmTzBh?=
 =?utf-8?B?U3c3SUtYb2FVNVhDSDh3eU5kL3AwYm04M2RxWXRFYlVaRVJVQmU3RFFyb3Br?=
 =?utf-8?B?UjllTWFWWFJVdGpYS1NDY0VQVXFBOC81UDlackpCNmFHaE1oOEhWTC9yNHZH?=
 =?utf-8?B?bzVmUkV0UG9MYVlRMXBkOUw1L1E5SjMzT1dEakZjNDhjT3ZjTTg3OFdUWFc2?=
 =?utf-8?B?RThFRllsNmR4ak5aVFROVHo5TVB0cVNQclUzRmxGajBjQy9zeEphQklzaGRI?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bcbd0a9-ace8-474d-e71c-08dd0a74c086
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7617.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 21:37:52.0178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OnUg7PNj5H0psCw0oAERKjNX1lKcHDxC6rQWK6Zrhp/KhZWwxj86WwluomF6MOk7td04o/l9dzDS0/MQHjGzgxB8cCZzCBikWOdTxCHUa20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7512
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




On 11/21/2024 12:03 PM, Jani Nikula wrote:
> On Thu, 21 Nov 2024, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
>> On 11/21/2024 1:57 AM, Jani Nikula wrote:
>>> On Wed, 20 Nov 2024, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
>>>> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
>>>> index 419e8e926f00..533bc82255b6 100644
>>>> --- a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
>>>> +++ b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
>>>> @@ -9,6 +9,9 @@
>>>>    #include <linux/errno.h>
>>>>    #include <linux/types.h>
>>>>    
>>>> +#include "xe_bo.h"
>>>> +#include "xe_pxp.h"
>>>> +
>>> Can't have this. This will include xe_bo.h and xe_pxp.h from i915
>>> display.
>>>
>>> Basically you can't use gem_to_xe_bo() in static inlines in headers that
>>> get included to i915 display. It all needs to stay opaque.
>> Why would this be included to i915 display? This is the copy of the
>> header used for building the display code with Xe, i915 should use it's
>> own copy (i915/pxp/intel_pxp.h). Several other headers in the
>> compat-i915-headers subfolder include Xe headers. Or is the problem
>> specifically with the BO part of it? Because I can move the code to
>> xe_pxp.c, but I'd still have to include at least xe_pxp.h.
> With "i915 display", I refer to the display code that gets built for
> both i915 and xe. And regardless of which module the code is being built
> for, it should not include details like this. The goal is to make it
> more and more independent from the two, eventually spawning into a
> dedicated module. So we want to axe includes that lead from i915 display
> to either i915 or xe core headers.

Ok that makes sense, but I'm not sure if it can be easily avoided here. 
The PXP key is managed outside of the display code, so we do need a 
callback into Xe or i915 to get that info. The only way I can see that 
being doable without the different headers is if we pass a function 
pointer at display init time and keep that stored inside the 
intel_display structure. That to me sounds like something that should be 
introduced more structurally for multiple callbacks into i915/xe instead 
of just for PXP, but I can do it if that's the preference.

thanks,
Daniele

>
> BR,
> Jani.
>
>
>
>> Daniele
>>
>>> BR,
>>> Jani.
>>>
>>>>    struct drm_gem_object;
>>>>    struct xe_pxp;
>>>>    
>>>> @@ -16,7 +19,15 @@ static inline int intel_pxp_key_check(struct xe_pxp *pxp,
>>>>    				      struct drm_gem_object *obj,
>>>>    				      bool assign)
>>>>    {
>>>> -	return -ENODEV;
>>>> +	/*
>>>> +	 * The assign variable is used in i915 to assign the key to the BO at
>>>> +	 * first submission time. In Xe the key is instead assigned at BO
>>>> +	 * creation time, so the assign variable must always be false.
>>>> +	 */
>>>> +	if (assign)
>>>> +		return -EINVAL;
>>>> +
>>>> +	return xe_pxp_key_check(pxp, gem_to_xe_bo(obj));
>>>>    }
>>>>    
>>>>    #endif

