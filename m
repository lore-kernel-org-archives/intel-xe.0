Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0EFC5DF70
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 08:19:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF2D10EA3A;
	Tue, 18 Aug 2026 08:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YTMvFqjS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6298E10EA3A
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 08:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787041166; x=1818577166;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hBfBqmbfk/SAdIkGlb2uvvB4JIUG4N3ZWFJwuNhnhYw=;
 b=YTMvFqjSf6H/JMJk9K7fxuVzunuL3vWfUDRKYzTG8aSV967RVFjONH62
 ZXvXdwEQvb7S6FtWSELw8aRf18TnBJI8I79PrMwc4/ACNDvy/5y8d3oLT
 nqhM3MApKnGr9/toXmbvzNkQFncCcLm/BBgH8JIoYH31Lu6c/oN+ECTYG
 UNlp6ZMtpNSanHh5doLsAEMfM1lPBpBmsf3O1fWSM1aFmdV7jwS/54hQI
 pHCXYbA2stCDN6ZcV701GmuX9ob1XLNfw+EVL7LwYHbPSZGKmCxAhINHU
 /yRuDcEY7NJotzVC5RBtNWgyNQpW5ZDPQS2oBXkGiS9BCZv7dCUfY5Ri4 w==;
X-CSE-ConnectionGUID: 7inO3LW+RwefiK2cpT4L3A==
X-CSE-MsgGUID: +4oO5W73QKO3Lyk5iRPdsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="99044256"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="99044256"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 01:18:52 -0700
X-CSE-ConnectionGUID: LMD+eHUkTW6sRk/w1tgtpA==
X-CSE-MsgGUID: g7xtB/RiTGO9F2HqfBmY3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="269462750"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 01:18:51 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 01:18:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 01:18:50 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 01:18:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fhx6IEL5WUBa6sLm5GKWpaZKTYRhdF5nzZfgv4FiGY2+vH3fNO+9ijE137mWfDU1/WmswtIhMFEfkVy1isO6OAnncxFAszQHvmUomCDSEGr2lWlucF10Z/J4Nv6Be76FATDaDOKgOiiQ9F+YMPPSCXTVsNdADzPtF6yxluN0+xIfQxSF+vlVE64qX0FqGzSE+FUviiWQoGYG6GiybA3dB7C9tBmRnCZKIDpDj+FrvNg5l7a3x7fEBVM8+i1lRHQg/HLw9QizdpTf3FzJBb9W2zWxuXWvgRMSYE42rn/DWh6G56KHe8mX2OTemHA7MlkyB/ut7SZ/8V46Sg3sipLmxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmjB4HB3/PriMTf/2cZ00H22Di0qEJUEuGqJbcUjsy8=;
 b=oF3dsIjwK6qJLbr8xLl7+EoMfQVLth9HbAc0qFY3fuVXFmK7t6uYnzwEupUcU0DkLD1ZKxqiyUIWFGbNsZRfuYk1Ot6uYQNU1BJ9zQLdoBXPR38Nx+3X/yuiYsaikCdblw0vtGLK3JoifYybY9QMJeB/rJDG3CziUbJyZ2AlIITOK80oDo6V6fqep/db9seVo/9050TlJl+T40VyIIdWllmfjeTTIbZsp+3SccO/hRhzrd/Q1Oq9CmxYYGBQ/bfmGZRnuGPAyIHi2PVBVolu2SeDDxSyujs5CnTwjyuYHPtcqwyVzPJO5t9Du4q0/DwQdiGydyYo17uCXjVYLACB4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB9494.namprd11.prod.outlook.com (2603:10b6:208:59c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 08:18:43 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 08:18:43 +0000
Message-ID: <d07c319a-96a0-4ffd-9623-695cf4d27e69@intel.com>
Date: Tue, 18 Aug 2026 13:48:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_drm_ras: Enable CONFIG_DRM_RAS
To: Raag Jadav <raag.jadav@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260818075454.1508724-2-balasubramani.vivekanandan@intel.com>
 <aoQQ05RgZxVOeY_U@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <aoQQ05RgZxVOeY_U@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB9494:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d470df3-e2af-4ebb-9777-08defd01505f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|56012099006|11063799006|6133799003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: O3a/PaKn8XbniJMcD9AsbQGn1Z3BkPrJza2adVLPPhe1MkI4T8XLT3mO2YZ4hOuJg5QP3wCHi+aRkfFOuIIiJMPd87m9als3d01i3avIdVa+PyGhXbp28z5cplQk/XWoTG9Dc3gsQJr1D8U1B1NIgAzoCnwOc47YkDWTa6/FkzcxxeX+WeREWE+xTorghZ5FgdY26FqmpF6pbqsXVKiHGTMVMGkzyNujo+vRgY0VxReDHBpMLlXaIWSrMarDnUpGc5d9jZmfd5eb63WAGUDybxNWkpu7BcP+UpVf8s/woHkKfVk2fiDGwzQS8xkgh8lJ1uaugFu60NPLmXwyK0BT2kNQ57wvbzfDv29CDmOE8UenRtfjeK/nWzHMm6Z3MwUstuw/sJvCERT/DBlvWfRSIrXvNBXzfmGMaa13S2T2L8b9K8d3viOMG6MIDZPKzTD366KcxYGzmRquGqOhyJsUUFb+UPZFoEqhARPmHsEAhcFOl+qQV9v7K28VCJQfoP8Usk3vx1927WM+o8mpOgoanE/fTE7gDXkqxSfDChbDo+N9qFsJTnovYJF9ZDUNCg06fBtQEZVbFnJBJHPAVKDRAQAazRNJlcclKpXX+m18xW2LsIc33t77o/xFxATdohEE7wj3k+7bU6kl3I6N2ZCtK/d2zLCJ0bvvXO6eoiW8sNU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(6133799003)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFVwR2ViaUtVRmJ2UGhMQlk1ODNrcksyb1BPazd1OWVKNUZqdEozV2hGNy95?=
 =?utf-8?B?ZExFb2tQZHpSMDlJMFZLMlhsNExZZmdGN1BFYlFmYTZjNDZFVU1XVjZJN3o1?=
 =?utf-8?B?TDE4RG95T2FhelRqWVNwUDA3YUZPa3RZZ05sM0tyNzV2dWJtK3E2aEJvcmFa?=
 =?utf-8?B?NzVqVEZKblpzUzIzcVJjSGZuTC9XOGpBNXBmVUtLSlV2elRFTEx3Q1JVYmxY?=
 =?utf-8?B?TmlyMTFMMGU2MEhpQnBaK2JjNjdZWkdMc1lkNHZlWEpjMERPTXlDR0JBcWFw?=
 =?utf-8?B?M1NPZVpLSi8xNUZnamdWYUJmVWlyREwyOGlueU9TNzJVTWwrY2FoOFZ5ZFpH?=
 =?utf-8?B?ZURrZ1ZZc08xd3Vta3diRFdpMUlzai9UV3plNURUUk0rM1piNmlyZ3FIbFE1?=
 =?utf-8?B?c2N3MXVRa21aYzYyQlQxSFk0b2NqalRMRDNDN1RmV3YvRmI4b08xMEQwSHoz?=
 =?utf-8?B?OFNhVUtybVY5YzlWMkFCeGJEUFovMmcwbTNlajRrNk5YT3lrekdCdHl0bTdj?=
 =?utf-8?B?VW85TGpaU2g4RzAycC9mN1NTVTdoUktiWmpTNGlrMUpZNVQ0V2V2WUlMMUU2?=
 =?utf-8?B?MnBYdHk1RmhjMGFJc0xKbjZkSFdDcnUySzlZMjh5N0lYaHJlVzJVOFdKTTRs?=
 =?utf-8?B?Q2VWQmdycDZZY1d6ZVJsK1I5TXNEb3h5dzhUZkEvb2hqeDJwUFdJWnhMUE9Q?=
 =?utf-8?B?ems4bG1ocmZDK2VtWHJtQ1B2TmtZL1VGVjcrK2NFbUVNYUdsUFI5ZW9XaE1U?=
 =?utf-8?B?UHlRL1dEelhSTzUzRXB1b0owUjlaTTJUamFhSTN1UlhYcXB5dW9NTmhIZ0tU?=
 =?utf-8?B?Ulg2UXk1SExERmNTeDJRL0U5K0xiVm5XdnN2a0ZWZFhlU1ZWcnBBTHZuZ1Vx?=
 =?utf-8?B?R0l4MUlSNGNXaGNKM1V3aVJJUFpGVFhjWGJxMXJJZC9IazR5R1FrME9nbm1L?=
 =?utf-8?B?cEJQdStCS3NmN3hYejl2WTRmNzBISnhKNnhYKzlsa2F6RGpZSi84TjNiaVpr?=
 =?utf-8?B?Q0RVTnJOSVE3ZnU3cGM5RWlMY2wrM3ZIK1ZIbEtHam54K054bDdFeDlmZzRQ?=
 =?utf-8?B?enJPZlhLVWtDQ3JVNWVLRExwaXlLcjVzNU5ISXFleFhuemFaUTYraW01QjRh?=
 =?utf-8?B?OWFSc1NCZHN0RkgraU5CYXRpRGZyWW1oNDBxNTl4TklXVjduYWVOeEhuSUpM?=
 =?utf-8?B?TnNjVXB2cjQ1WjQ0d1Vtcys1dk1kWmYxQVZHVUYvV3BBMm9FR3ZEWTA0UFBt?=
 =?utf-8?B?cjZvdFJSSkhiUC9CK1lYdnNHNUZGYmlwYjFSeTZDdENZckM4YlNLMVB5NVNN?=
 =?utf-8?B?RDg2VjN4UXZGOFlvbk5CUXkxajdxYlNiT1FlMGxCWTVrQzJTNjBHdVhHSTFM?=
 =?utf-8?B?cW9qVmVlL0ZpdzBZS2s0cE1md1BSU0JXQXkvdDMvSkFXRUIxRUhvQTVvQktT?=
 =?utf-8?B?OUFuVi9BS1dSdDF4MVA2U2pwMHNOaVgrUEtnQ0RGdFNNZzFvSUZjaFpKbEdC?=
 =?utf-8?B?VWlrR1Q4UHYvNWFudmY2c1hKZThuR0ZRelJuSVBJSzFxRDBhSTZLcGJBOTlM?=
 =?utf-8?B?USs2VFROMXRhMHZRNWprMVhrcDRlVThqaXEydmsxdllIM0RINmNuaVpCZHEz?=
 =?utf-8?B?RXZrZXRDcEV0MzE0ZXBrUHRJMFhqVlczV1l5WVpFcHFFeDJhYXpMN2M4c2Vu?=
 =?utf-8?B?RVNETDFtTVNaU2ovQ2R5VnNJeC95ZjFYUVhqMDNPNHNOaVZ0ejdOeDRPMjZv?=
 =?utf-8?B?UHBTVDZiWDh0M2JRZi92VmtKS0dBbjhSNUtUdEJxTHVqMWJoaW9DSkZlMmJY?=
 =?utf-8?B?TS9vQ2xhVHhBZmc3NlUvdlBsRE1OeHNlUHBsR05YQ2xjQlJDdkVjTk5MUEtI?=
 =?utf-8?B?OWI1M3BCbjZZcytQY3RhRktSclR0SUtOeDJGR29YM1k5dlRUVXZQR09RYk5w?=
 =?utf-8?B?bHBYV29FWERYVUJiaWNVeEloVXMxb0V2WDJhaDZUVEYveTg0cmFCVnF3eTZW?=
 =?utf-8?B?amVvS1AvcDJSa0NqSDZLVmpsNTdCNHhub2VqSTJaSVJCQTV0eFRaSnNRQjR2?=
 =?utf-8?B?Z1JsVVZrSEJyNVBMRFpWaGVXK290QXVMdE1XR3VGQXZVOTJMdGUyYXpCMEVu?=
 =?utf-8?B?ZktsTzlNME5na2duQW5XVVlPSlJZSUNSQUFuczdNcjZzYlBudE50Q0RHZk5n?=
 =?utf-8?B?bHpGMnRIS1d6NmJjMVJwSkNCQzZtaDdYZ0QvRmN4a3UvUnpRaTdmT0Roa0xX?=
 =?utf-8?B?aTBINUQ4SXZCVDl3TEphUzBPT1VzdCsvNmM5WDZPb2NvN2VwVGdLY2M0T3Z3?=
 =?utf-8?B?VVlEV3JlN29jNituQ1NXbnhHOTJxcXhXRGRjZXJveTYxSHFTV2Z6QT09?=
X-Exchange-RoutingPolicyChecked: OzI+H7bwGNtW6HpUqNgZV37nWg5xrHdn7OptLXN7cK/w5Ehgcgdh+wkCUf5WAmGDQdTRB0+a9K4gaWoxOsR/no5DpUzY+T4VnWyTOruM0Bkm37SveBW9wluWrrRuVb+AVclxubVFVxgVND7FcdunYOl9J/9J3KXFLW/biW0P9UR9py5fUu7SCkCW/vrgrbJx8biV2sdg80urWs4eBe8IfXyeztFtQXUeAsydfAFMaO7eCbsIaDDL7aJNNJ2hVGQESPDPlbkTOrNsSoaZfr94FnzG9PjZ3dItY5DPUjzHnc17EgY2XeJ1lJW48XJ0whoSU6BIHmkq7aYuDF4R7CB1kw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d470df3-e2af-4ebb-9777-08defd01505f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 08:18:42.3086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTf3ACd/7HzhRTGCrMl/bNgT8zSTeGZjmc4NHPjpHjmTA4woZnknuAnPtK6LmWjCb+Dl60LwYtFS5RTfAmNt4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9494
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


On 18-08-2026 13:29, Raag Jadav wrote:
> On Tue, Aug 18, 2026 at 01:24:55PM +0530, Balasubramani Vivekanandan wrote:
>> Xe RAS functionality needs DRM RAS support. Enable it.
>>
>> Fixes: b40db12b542f5 ("drm/xe/xe_drm_ras: Add support for XE DRM RAS")
>> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>> index 4d7dcaff2b915..6c584f918edf2 100644
>> --- a/drivers/gpu/drm/xe/Kconfig
>> +++ b/drivers/gpu/drm/xe/Kconfig
>> @@ -42,6 +42,7 @@ config DRM_XE
>>   	select DRM_GPUSVM if !UML
>>   	select DRM_GPUVM
>>   	select DRM_SCHED
>> +	select DRM_RAS
> Nack, this was an internal workaround. It's upto the user to decide.

Agreed. This should be upto the user. We can add it in CI config but not 
select it from xe.

Thanks
Riana

>
> Raag
>
>>   	select MMU_NOTIFIER
>>   	select WANT_DEV_COREDUMP
>>   	select AUXILIARY_BUS
>> -- 
>> 2.43.0
>>
