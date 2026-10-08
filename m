Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66FECA600C
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 11:47:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895B110E7DE;
	Thu,  8 Oct 2026 11:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GoN+I+va";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308F010E7DE
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 11:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791460069; x=1822996069;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HPWuRNmCIvxL/6rNbxVvW+JQDrtFkjbpBtX4yLVEon4=;
 b=GoN+I+vaTTQ6X0RgU4cKGuFdmM+3u+YkYenkj6HcHEPWbQnnM5XGXsJ/
 8SvoneyCPqXjRTskbjQPBkyDCoWN/fbw0aiOg88ULB70glCf1uGhanQb7
 TYZ3cEE9/30oUoDbrN39RWyjmYHpXZAKsHyh8iwV2XXBe37RkgAk9sESF
 HfuWK1nQUQZoVWVUvddTVPrMwbFS7YU54RYb/Z77D7z/s1DD5/Ac7QdrS
 xxiQLVfsGcBN4rUvtDdn6YrUqtjLFxQGU6EO9DR+NgK4x//6ZxS+7wA/K
 ipAHBAg0vBzKCjYidOgCciXEtOe0vWsKWOg+pNW47CK/9M9SbmaSpC+HY w==;
X-CSE-ConnectionGUID: fMCQhsqXQmqfErwJOZj83g==
X-CSE-MsgGUID: 5FIxidrnSlKcBPqGZrtJ0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="252004"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="252004"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 04:47:49 -0700
X-CSE-ConnectionGUID: 18f7l+McRYCQZgjhIH0wRQ==
X-CSE-MsgGUID: exazMdwrSN2HrR9CTIBg0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="385316"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 04:47:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 04:47:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 04:47:48 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 04:47:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBxxChnOmISnCoXlrPVLAUoulEFWstn6VIo5r5pp7FyS37rbRnbRGYc3oWAJa8DV7TiNIEH502rGdn3ROxtY3m1FByB75COAX5hXIcgei2tTh1O9nuvdFAyPpUaVqquNDxEy9Xlc5FWVftPB9RzZVypB9NAhBGY2LW4g+joZU5NzS1A89H/Ph9nfLTR0OZCLUVFFx25iXff5szsI2sACf/dm0Tws5kObtPUFqy7zx4I0QNDzGReAc1txr2D39mXYO3Yh6YShZm3wzVcedfj8UFC2qJ3WHsEoiO23Cthoi0Gts5+q8CzLDGz5L6d6noI46Y2suQXIngr+S+pU1TwwhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gqxcyapE2nEYLLXlD4aerKmi6+SBkk2+EdVrdcFf1M=;
 b=Ha6aDszwEMvBSMRCqnpQaCUBWB20Hcfv3R9VB1bZZ6UDstAGGeK1dr0iEU+7yFf2mSweRbNXQ1RQujVBTzhJLXXtFcjFO/gzDkxbjmkQSMpvZ281ykIwRd/gCxvETouK2PnrMvwHBrWz++5Kv/kIMMNy6zyFNnhvPl39SugT2/GztfSTBOIFqlM35C9n6bVLznBxJQORsgEKYIzcbHd3OL/HOLMr7ilQUkv6ctI/KkryFR0/xEIVqshp1yslsbFk3LlhEkfd+EpXZjMSgiQY84j+l0L5Qq8Oz7533MRcyOlb//rd9pOB38j4C2gn5/1R9FwmxAd4EV6cg7O5bl+axw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1SPRMB0026.namprd11.prod.outlook.com (2603:10b6:208:3fb::12)
 by IA3PR11MB179642.namprd11.prod.outlook.com (2603:10b6:208:61f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 11:47:46 +0000
Received: from IA1SPRMB0026.namprd11.prod.outlook.com
 ([fe80::9f8a:191b:3db3:168a]) by IA1SPRMB0026.namprd11.prod.outlook.com
 ([fe80::9f8a:191b:3db3:168a%2]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 11:47:46 +0000
Message-ID: <958f7d35-65a5-4a09-9047-32822d88cddc@intel.com>
Date: Thu, 8 Oct 2026 17:17:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] drm/xe/hwmon: expose pwm[1-3]
To: "Purkait, Soham" <soham.purkait@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
 <20260717041757.2759084-5-karthik.poosa@intel.com>
 <1bfb95e2-9ff6-40ee-9a3a-d1594bcda1a4@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <1bfb95e2-9ff6-40ee-9a3a-d1594bcda1a4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0140.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::9) To IA1SPRMB0026.namprd11.prod.outlook.com
 (2603:10b6:208:3fb::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1SPRMB0026:EE_|IA3PR11MB179642:EE_
X-MS-Office365-Filtering-Correlation-Id: 912cff5d-c6bb-4cd1-c1d3-08df2531f857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|56012099006|4143699003|11063799006|260925021911599003|260925022911599003|260925021311599003|22082099003|10067099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 14IkyP7K2lMNlIva0Bn8q72L/hBmdITANDgf6DytNEJ7VlEPQuAuKmu1HV9z/k3EnVbPC0Sn5aatdD6bC1wKjhxpUWzDdQnNgbxowJeTMOxXfv/H1gTdjbjIca08F1p/VCGfe0SDdFlNzZ6OL9AEAV3OX0HET4pzah7+XaPULM7OiIFNMU7rsspLipfjd5I5igdPwpTF2SfEDQBQm609TSiOCs5tHvQOQL1xmIk0+e1XO4tG+hkL2H/msypX5VcoGC2zye3C6HNBhVYJcQWSxTMVgwxLMaI4gnBGMsgpHZhLvyrEVwNfkAgKYinX7fJ4pyv5iiBmMLAIHoizD5oy59YrfneHd84VhZoewlIWlg9rs3O5sWwl+cpj++xEDWgV5Mcfcw4bwmGJT3RtPBjjRRS1Mf3rj8keMrz1K1uY8QPPXo7423+MpHb9y+KebYj+dId4dTC2Zb53mJHrJ6ei7cTUKaE2YMRaK2YhyFlR4dCMKdNRKPBrBusjFby7wDHftLEghYDsV+T7Jk3uXuetbnf8mJdhcldO/inea47OwEU1O5cgn/mNTIDfxUMqva1hbuC6JbYCqirIc+f9UT9HtAbPBQbgAMI5AAmq6qo6opVbiuopmXKBG9L5F0I4k3fRUUtpz67t91OqXa5hmeCNAMfRUKvHvHDOSZoDf72KknU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1SPRMB0026.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(4143699003)(11063799006)(260925021911599003)(260925022911599003)(260925021311599003)(22082099003)(10067099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UElBWGhhTFBRYUYwbVZGNWFHMjFoQzJORkRKOVRDSGtWVlVlV3R6dGhVckU4?=
 =?utf-8?B?MDVoSnlaNTRYK1pXSlpCWDJRc3NjOGwrcm9wWTBzeWYxRG1DcVczWFZoeTZ4?=
 =?utf-8?B?d3dka091aWhrZXRjQVlGa3BrQ3N4MjBmNC9ZZUMvbGhlRm1FUUNVbEZFb250?=
 =?utf-8?B?UjJyZnBENC9OYzUzSStxWWo4VWROYnlrK3owZWhXaHhIbUNJMnA1dkxZNmEz?=
 =?utf-8?B?ZjhZTmY2RW8rTGN0cEpPU3dOUTBSM1JMdUc2eGVNZWN2NU1FVWErcTdCV3Np?=
 =?utf-8?B?ekVjcFk4QmhQTEFKcm1GeVFGaXZETEthVC8vZzQ3Y2hEL2pySW5JTzgzOEcr?=
 =?utf-8?B?eWxBTUwvd0M5WXNyc3owbmlSYlEvcDVBZXJFOFhDSWlIWUc2dzE2NzRZWS8w?=
 =?utf-8?B?dkpaNjZxcjUxSkc3RzBNME9reHd4RDV3Q0ZtdWJlLzZHRUs0NXBuZ0g5Z3ZN?=
 =?utf-8?B?KzVBbzYyUW1qdDN0bS9INHQxbnJ4b2pIVVBnK0g0RW5CQ0tDaW81VHV5WlJr?=
 =?utf-8?B?Z0VTc0pScUVrRzd1MGMzdVp4UUVZblduUGl6NjZrbEgxQ3hzZ0FHazdNMGh4?=
 =?utf-8?B?UG5IaThPWjRVR2JFNVY2Z3F3a2xYMDIxb3BqSW5uNDROQU9Odk9yc0sxTDRl?=
 =?utf-8?B?UzA5SUhpV1ppQXNlRGlpNFVRZ3VDa0ZJcE1OWndTZ3UwWjVPTjhhTXVpYVFZ?=
 =?utf-8?B?Y2tnbEoxcEhxNFd5QWtvOXh3SElmeXZFS0FFenBHOTBkQktWWVFXRHEwQ2Rz?=
 =?utf-8?B?Sm1Cczk0REZSVXVkbko2UkNFNlhSM2EzMk0wUmtUbVgzZHI0SGFROGlwVlhF?=
 =?utf-8?B?WU5Ub0ZZMjZ5clZETm13V0NoUU1xM05iWWt2eUZTTFp3Y0thYzhJenlsZWxN?=
 =?utf-8?B?Y0NzSlZ4SGtKdklVMnZmZzBsb05CRG05MU9YSm0vSXBDL0E5QUUzditTSm9R?=
 =?utf-8?B?WktwYUREbUl4V0RRN3hKTDlmTkllYkJ2a2dRbTVwVW5TL1g3MlVTUWdHNDFB?=
 =?utf-8?B?ZGRPa3pzQ2RqQndjQmV3WGhCcDU5TldTMGJXeW8yV2xNeTFlRktxTDRmWUhw?=
 =?utf-8?B?SnV0ZDQreXJ6d053MlZ6TXhvZ3Zoa0lKNk5WQ1AvY29ITnlTNWNualVUa3R0?=
 =?utf-8?B?c2Y0ZDhYNjFKRGsrMyszNmRJWktvMHNremlnbkZUbHllL3VCaGErbm4vODlm?=
 =?utf-8?B?RHN2SWRCVjZBMXovWExBWnlncFRXSkVIaGlLOUNhWUFteW43L0lPb2d2a2tY?=
 =?utf-8?B?ZUg1bEExK29RdjZPUXd1VVFOSXFRN0x2aE1JcTBFSG1aM25SNUtSbEJtOWtu?=
 =?utf-8?B?MlJVYWhmUENtajROeEhNN245OVNxME9rdXZONTdsczhVWlE1UCtDQzBPNW1z?=
 =?utf-8?B?OXFiVVhSWFcycnZ6eFNVS0tMU3FjNjhIanQ3R3NYb2MwWDNCeFVjS1ZZMGU3?=
 =?utf-8?B?SGVVditudm1JeFYvb2tPbWk1K0NnM29HSnJUNUZEWUVsRUVzdzk0YmUwenhH?=
 =?utf-8?B?S0Q1WGR2dFdUSUhqN0ptTlprOW5JYUdKemE3bDY4bUNuTXNCdHk5VEQ0dDVX?=
 =?utf-8?B?dFJDUHVLbWRGODdMZm5vbjFVZGFaMkl0VU51MG1RdTVnQ3VtR0Q3QWhKZFpa?=
 =?utf-8?B?R0NoNTRVaDhXY1BoMnZ6UWVHc1FJMmhiRVFkNmZzUXFxOTZhTUV6NlpCM0dP?=
 =?utf-8?B?WllkbEo0NENESDZ5UWY3OVVRY0JVcEIydXh1eHFmTFZmcmZYVFVvMmdyNlZ4?=
 =?utf-8?B?NlNFM24wOTk5MmtzZG5CNURvcmFEamZ0cURkZGo4QjFpNXJnVGVDaXIwMVg0?=
 =?utf-8?B?ajdPbmxOUUM0SWIyWmxiL3VvNnVKMGdQVHNKa1M5Vlp0T044bzNUZHpJeXZp?=
 =?utf-8?B?c0ZlaEEyTTA4T0FFemd5QkVQU0orVFZsYkRIb3UvUU9XR3Nka1Y0eHdXR3RC?=
 =?utf-8?B?T01aOTZVeW83WU1TN05HYWEvZ29FVGJhNGQzSG40S0ZtMzF6WjB0ZVRucnVY?=
 =?utf-8?B?a0UyZjQ3YzR1ODRnUjdHVTJZbTIzaEMxMTJXdEw3VUVjN0F2NS9oaXBvaENE?=
 =?utf-8?B?Qzk4NTVWMGFweFBWVGRLeHU4K3lrY2s0NEl2UnBpWVdRcnpaV1pQK2NQYU1o?=
 =?utf-8?B?c0hUKzJldmhJMjJDeDhUTEZSSVlEVGh2cnovNlpwY29MZ0ZQZSttei9XRm1x?=
 =?utf-8?B?dlRkQmpPRnlaVTFBVjhFL3hZTzJhblNHMjhjQ1VQZ09mc3d6SmwrdlowZzFu?=
 =?utf-8?B?ZS84ZTRPRmdlOTE0WnVUYWYrOGliTU1pa0I5V1c1ZnN2cms4NGN5Tmw5UjlO?=
 =?utf-8?B?bWJ5bGpNemM0UEVCeWF4VDFJOVcyT0FDbkszbjZ1L0h4TUsyUkFGdz09?=
X-Exchange-RoutingPolicyChecked: 5Pq9cCiTSv/Om5NRnOifNO9jD2fvY7M4kyzRYhUtmMSxdFdlaejI5ttxaqpCoosHoYmkjOt2JsYn5I9xEg00QPqhhBveskTtaMCdMPAkV/Qog4ilWgNEodUDvw4OjJ34wRepZoqgScNZEBPgLtG2vgrxVwo/7Q/zL6+NAJWgKY6JnxQ+bd79dRDmc5jCmrncfqJIO2uxFV/ow9BSoPQ+I97SIuKi85+4+tlhPqQs5iSn+9PIqGgWIH63uBuznoYEelVKbbs6eLn6BBtl6ywoh0HEUq2enboalWQ9xTcx5+X8BX9sdPpMND65zYZxfZGZXm7I6tNE20t3wps1RlwfZw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 912cff5d-c6bb-4cd1-c1d3-08df2531f857
X-MS-Exchange-CrossTenant-AuthSource: IA1SPRMB0026.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 11:47:46.4447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hplNfZJVBhKZFueC8fKXrKDAVOvRR2o+yR7VNMqbbO85pKm0Z0BScmrESILzuXN9Ktqv/vTuBaYsWU60z87QBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB179642
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


On 03-09-2026 11:52, Purkait, Soham wrote:
> Hi Karthik,
>
> On 17-07-2026 09:47, Karthik Poosa wrote:
>> Expose pwm[1-3] fan duty attributes through hwmon.
>>
>> This enables reading and writing user PWM values (0..255) for each
>> available fan channel.
>>
>> Update Xe hwmon ABI documentation for pwm[1-3].
>>
>> This sysfs node can be used for manual control of fan speed,
>> irrespective of fan curve.
>>
>> v2:
>>   - Use xe helpers for dmesg logs.
>>   - Avoid use hwmon->num_fans to get fan count in 
>> xe_hwmon_pwm_is_visible().
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> Assisted-by: Codex:gpt-5-4
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |   9 +
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 230 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pcode_api.h             |   3 +
>>   3 files changed, 242 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon 
>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> index ec0b94d76e22..7383898890aa 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -321,3 +321,12 @@ Description:    RW. Package burst power limit 
>> interval (Tau in PL2/Tau) in
>>           milliseconds over which sustained power is averaged.
>>             Only supported for particular Intel Xe graphics platforms.
>> +
>> +What: /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]
>> +Date:           July 2026
>> +KernelVersion:  7.2
>> +Contact:        intel-xe@lists.freedesktop.org
>> +Description:    RW. Target fan PWM duty value in the range 0..255. 0 
>> is zero
>> +                fan speed and 255 is 100% fan speed.
>> +
>> +                Only supported for particular Intel Xe graphics 
>> platforms.
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 769f4d1da83e..d3379727b1a9 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -803,6 +803,7 @@ static const struct hwmon_channel_info * const 
>> hwmon_info[] = {
>>       HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, 
>> HWMON_E_INPUT | HWMON_E_LABEL),
>>       HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, 
>> HWMON_F_INPUT | HWMON_F_MAX,
>>                  HWMON_F_INPUT | HWMON_F_MAX),
>> +    HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT, HWMON_PWM_INPUT, 
>> HWMON_PWM_INPUT),
>>       NULL
>>   };
>>   @@ -928,6 +929,158 @@ static int xe_hwmon_get_num_fans(const struct 
>> xe_hwmon *hwmon, u32 *num_fans)
>>       return 0;
>>   }
>>   +static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 
>> fan, u32 *point_count,
>> +                    int table_type)
>> +{
>> +    int ret;
>> +
>> +    ret = xe_hwmon_pcode_read_fan_control(hwmon,
>> +                          (table_type == USER_FAN_TABLE) ?
>> +                          FSC_READ_USER_FAN_CONTROL_POINTS :
>> +                          FSC_READ_STOCK_FAN_CONTROL_POINTS,
>> +                          fan, point_count);
>> +    if (ret) {
>> +        xe_err(hwmon->xe, "failed to read fan %d %s point count, 
>> ret=%d\n", fan,
>> +               (table_type == USER_FAN_TABLE) ? "user" : "stock", ret);
>> +        return ret;
>> +    }
>> +
>> +    xe_dbg(hwmon->xe, "fan %d %s point count read as %u\n", fan,
>> +           (table_type == USER_FAN_TABLE) ? "user" : "stock", 
>> *point_count);
>> +
>> +    return 0;
>> +}
>> +
>> +static int xe_hwmon_write_user_fan_point(struct xe_hwmon *hwmon, u8 
>> fan, u8 point, u8 temp,
>> +                     u8 speed)
>> +{
>> +    struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +    u16 user_fcp_raw = FIELD_PREP(FAN_CONTROL_POINT_TEMP_MASK, temp) |
>> +             FIELD_PREP(FAN_CONTROL_POINT_SPEED_MASK, speed);
>> +    int ret;
>> +
>> +    ret = xe_pcode_write_timeout(root_tile,
>> +                     PCODE_MBOX(FAN_SPEED_CONTROL, 
>> FSC_WRITE_FAN_TABLE, fan),
>> +                    (u32)user_fcp_raw, 
>> XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
>> +    if (ret)
>> +        xe_dbg(hwmon->xe,
>> +               "failed to write fan %d user point %d temp %u, speed 
>> %u %%, ret=%d\n",
>> +               fan, point, temp, speed, ret);
>> +
>> +    return ret;
>> +}
>> +
>> +static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, 
>> u8 fan,
>> +                        bool is_full_speed, enum fan_table_type 
>> table_source)
>> +{
>> +    struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +    struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>> +    u32 point_count;
>> +    int ret;
>> +    int point;
>> +    struct fan_table *source_table = &fi->fan_table[table_source];
>> +
>> +    xe_dbg(hwmon->xe, "activating fan %d user table from %s 
>> table\n", fan,
>> +           (table_source == USER_FAN_TABLE) ? "user" : "stock");
>> +
>> +    point_count = source_table->fan_control_point_count;
>> +
>> +    if (!point_count) {
>> +        xe_err(hwmon->xe,
>> +               "fan %d %s table point count is 0, cannot activate 
>> user table\n", fan,
>> +               (table_source == USER_FAN_TABLE) ? "user" : "stock");
>> +        return -ENODATA;
>> +    }
>> +
>> +    for (point = 0; point < point_count; point++) {
>> +        u8 temp = source_table->fcp[point].temp;
>> +        u8 speed = is_full_speed ? 100 : max_t(u8, 
>> source_table->fcp[point].speed,
>> +                        min_t(u32, fi->min_pwm, U8_MAX));
>> +
>> +        ret = xe_hwmon_write_user_fan_point(hwmon, fan, point, temp, 
>> speed);
>> +        if (ret)
>> +            return ret;
>> +
>> +        if (table_source == STOCK_FAN_TABLE) {
>> +            /* Update user table cache with stock table values */
>> +            fi->fan_table[USER_FAN_TABLE].fcp[point].temp = temp;
>> +            fi->fan_table[USER_FAN_TABLE].fcp[point].speed = speed;
>> +        }
>> +        if (is_full_speed)
>> +            fi->fan_table[USER_FAN_TABLE].fcp[point].speed = speed;
>> +    }
>> +
>> +    ret = xe_pcode_write_timeout(root_tile,
>> +                     PCODE_MBOX(FAN_SPEED_CONTROL,
>> +                        FSC_WRITE_NUM_FAN_CONTROL_POINTS, fan),
>> +                     point_count, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
>> +    if (ret) {
>> +        xe_dbg(hwmon->xe, "failed to write fan %d user table, 
>> ret=%d\n", fan, ret);
>> +        return ret;
>> +    }
>> +
>> +    /* Verify if all the user points are set */
>> +    ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, 
>> USER_FAN_TABLE);
>> +    if (ret) {
>> +        xe_err(hwmon->xe,
>> +               "failed to read fan %d user table point count, 
>> ret=%d\n", fan, ret);
>> +        return ret;
>> +    }
>> +    if (point_count != source_table->fan_control_point_count) {
>> +        xe_err(hwmon->xe, "fan %d user table point count mismatch, 
>> expected %u, got %u\n",
>> +               fan, source_table->fan_control_point_count, 
>> point_count);
>> +        return -EIO;
>> +    }
>> +
>> +    fi->fan_table[USER_FAN_TABLE].fan_control_point_count = 
>> point_count;
>> +
>> +    return 0;
>> +}
>> +
>> +static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, 
>> u8 pwm)
>> +{
>> +    struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +    struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>> +    u32 point_count = 
>> fi->fan_table[USER_FAN_TABLE].fan_control_point_count;
>> +    u8 clamped_pwm;
>> +    int ret;
>> +    int point;
>> +
>> +    /* Read user table fan point count, if it is not set, activate 
>> the user table */
>> +    ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, 
>> USER_FAN_TABLE);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (!point_count) {
>> +        xe_dbg(hwmon->xe, "fan %d user table not set, activating 
>> it\n", fan);
>> +        ret = xe_hwmon_activate_user_fan_table(hwmon, fan, false, 
>> STOCK_FAN_TABLE);
> Seems like this is redundant. As already after this code block, fan 
> control point is being set.
yes, this can be removed.
>> +        if (ret)
>> +            return ret;
>> +    }
>> +
>> +    pwm = DIV_ROUND_CLOSEST(pwm * 100, U8_MAX);
>> +    clamped_pwm = max_t(u8, pwm, min_t(u32, fi->min_pwm, U8_MAX));
>> +
>> +    for (point = 0; point < point_count; point++) {
>> +        u8 temp = fi->fan_table[USER_FAN_TABLE].fcp[point].temp;
>> +
>> +        ret = xe_hwmon_write_user_fan_point(hwmon, fan, point, temp, 
>> clamped_pwm);
>
> Why do we need multiple point_count for setting a fixed pwm ? could it 
> be managed with just 2 (max and min) points ? Then user fan table 
> might not be required in this case.
>
> Thanks,
> Soham
actually 1 point also should suffice, we can use only 1 point, with temp 
0, pwm to user set value.
>
>> +        if (ret)
>> +            return ret;
>> +
>> +        fi->fan_table[USER_FAN_TABLE].fcp[point].speed = clamped_pwm;
>> +    }
>> +
>> +    ret = xe_pcode_write(root_tile,
>> +                 PCODE_MBOX(FAN_SPEED_CONTROL, 
>> FSC_WRITE_NUM_FAN_CONTROL_POINTS, fan),
>> +                 point_count);
>> +    if (ret) {
>> +        xe_dbg(hwmon->xe, "failed to update fan %d user table count, 
>> ret=%d\n", fan, ret);
>> +        return ret;
>> +    }
>> +    return 0;
>> +}
>> +
>>   static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>>   {
>>       struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> @@ -1424,6 +1577,20 @@ xe_hwmon_fan_is_visible(struct xe_hwmon 
>> *hwmon, u32 attr, int channel)
>>       }
>>   }
>>   +static umode_t
>> +xe_hwmon_pwm_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>> +{
>> +    if (!hwmon->xe->info.has_fan_control || channel >= hwmon->num_fans)
>> +        return 0;
>> +
>> +    switch (attr) {
>> +    case hwmon_pwm_input:
>> +        return 0644;
>> +    default:
>> +        return 0;
>> +    }
>> +}
>> +
>>   static int
>>   xe_hwmon_fan_input_read(struct xe_hwmon *hwmon, int channel, long 
>> *val)
>>   {
>> @@ -1478,6 +1645,62 @@ xe_hwmon_fan_read(struct xe_hwmon *hwmon, u32 
>> attr, int channel, long *val)
>>       }
>>   }
>>   +static int
>> +xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, 
>> long *val)
>> +{
>> +    struct xe_hwmon_fan_info *fi;
>> +    int ret = 0;
>> +
>> +    if (channel < 0 || channel >= FAN_MAX)
>> +        return -EINVAL;
>> +
>> +    fi = &hwmon->fi[channel];
>> +
>> +    switch (attr) {
>> +    case hwmon_pwm_input:
>> +        /* Check if user fan table is set else activate it.*/
>> +        if (!fi->fan_table[USER_FAN_TABLE].fan_control_point_count) {
>> +            xe_dbg(hwmon->xe, "fan %d user table not set, activating 
>> it\n", channel);
>> +            ret = xe_hwmon_activate_user_fan_table(hwmon, channel, 
>> false,
>> +                                   STOCK_FAN_TABLE);
>> +            if (ret)
>> +                return ret;
>> +        }
>> +        *val = 
>> DIV_ROUND_CLOSEST(fi->fan_table[USER_FAN_TABLE].fcp[0].speed *
>> +                        U8_MAX,    100);
>> +        return 0;
>> +    default:
>> +        return -EOPNOTSUPP;
>> +    }
>> +}
>> +
>> +static int
>> +xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, 
>> long val)
>> +{
>> +    int ret = 0;
>> +
>> +    if (channel < 0 || channel >= FAN_MAX)
>> +        return -EINVAL;
>> +
>> +    mutex_lock(&hwmon->hwmon_lock);
>> +
>> +    switch (attr) {
>> +    case hwmon_pwm_input:
>> +        if (val < 0 || val > U8_MAX) {
>> +            ret = -EINVAL;
>> +            break;
>> +        }
>> +        ret = xe_hwmon_set_user_fan_pwm(hwmon, channel, (u8)val);
>> +        break;
>> +    default:
>> +        ret = -EOPNOTSUPP;
>> +        break;
>> +    }
>> +    mutex_unlock(&hwmon->hwmon_lock);
>> +
>> +    return ret;
>> +}
>> +
>>   static umode_t
>>   xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>>               u32 attr, int channel)
>> @@ -1504,6 +1727,9 @@ xe_hwmon_is_visible(const void *drvdata, enum 
>> hwmon_sensor_types type,
>>       case hwmon_fan:
>>           ret = xe_hwmon_fan_is_visible(hwmon, attr, channel);
>>           break;
>> +    case hwmon_pwm:
>> +        ret = xe_hwmon_pwm_is_visible(hwmon, attr, channel);
>> +        break;
>>       default:
>>           ret = 0;
>>           break;
>> @@ -1533,6 +1759,8 @@ xe_hwmon_read(struct device *dev, enum 
>> hwmon_sensor_types type, u32 attr,
>>           return xe_hwmon_energy_read(hwmon, attr, channel, val);
>>       case hwmon_fan:
>>           return xe_hwmon_fan_read(hwmon, attr, channel, val);
>> +    case hwmon_pwm:
>> +        return xe_hwmon_pwm_read(hwmon, attr, channel, val);
>>       default:
>>           return -EOPNOTSUPP;
>>       }
>> @@ -1551,6 +1779,8 @@ xe_hwmon_write(struct device *dev, enum 
>> hwmon_sensor_types type, u32 attr,
>>           return xe_hwmon_power_write(hwmon, attr, channel, val);
>>       case hwmon_curr:
>>           return xe_hwmon_curr_write(hwmon, attr, channel, val);
>> +    case hwmon_pwm:
>> +        return xe_hwmon_pwm_write(hwmon, attr, channel, val);
>>       default:
>>           return -EOPNOTSUPP;
>>       }
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h 
>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 419ab4f416fa..5c5fdc650a97 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -84,9 +84,12 @@
>>   #define     PCODE_MBOX_DOMAIN_HBM        0x2
>>     #define   FAN_SPEED_CONTROL            0x7D
>> +#define     FSC_WRITE_NUM_FAN_CONTROL_POINTS    0x0
>> +#define     FSC_WRITE_FAN_TABLE            0x1
>>   #define     FSC_READ_MAX_FAN_RPS        0x3
>>   #define     FSC_READ_NUM_FANS            0x4
>>   #define     FSC_READ_STOCK_FAN_CONTROL_POINTS    0x5
>> +#define     FSC_READ_USER_FAN_CONTROL_POINTS    0x6
>>   #define     FSC_READ_FAN_TABLE            0x7
>>   #define     FAN_CONTROL_POINT_TEMP_MASK        REG_GENMASK(7, 0)
>>   #define     FAN_CONTROL_POINT_SPEED_MASK    REG_GENMASK(15, 8)
