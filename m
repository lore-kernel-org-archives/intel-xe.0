Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9185FC27C53
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 12:09:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328D310E842;
	Wed, 12 Jun 2024 12:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bkBnpyi7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16AD710E0A7
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 12:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718194157; x=1749730157;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=sgarH7mOcGzRgyAwVHe6E7bhuwp61s/WZSXVXTboaFo=;
 b=bkBnpyi7v7m5I0jq5x6bVwvw5Y3BvYn44bqE0x0v+FRXcXQBQsA2P8go
 ePKfgEOataRYRFC/1wz0NJzCpCJ+CFNqzVxrCwlUplPBK8ZStffMw3fF8
 WX4iREXmpW9BoweYuj/oU5buGBxOwWykvjcmJRd2Ae62qpXTnkAv9dHDE
 KwyB/ctunC9U6MjbQ0O8ix1Np6HRrUrueNEQIBoDGIUl1jxf3L56ACxP8
 q55h7MFELPwe9wLGhtbwLskMXnuVI/GFbAJMSR4QjdzaSchctbZxbC+51
 Uv1UkQ+PcRdYkMnR8ZFFCu53dz4s/rK3D86o2z9MeblSqfABu6/Zl+J5j w==;
X-CSE-ConnectionGUID: +/fYy3NKRMaX+c3MTqKrXQ==
X-CSE-MsgGUID: iZblhxOAQhW/c+wrZKPVIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11100"; a="15106346"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="15106346"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 05:09:16 -0700
X-CSE-ConnectionGUID: mYSWPeiqTUqQxW5V22YE2A==
X-CSE-MsgGUID: uJ+JdehdQQ+xdXDcFhX5GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="40470080"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 05:09:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 05:09:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 05:09:14 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 05:09:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMiE0Mo+23jWCvREOy+jRJLBZfs3b2s5Q6UfPueOqg1TzXSfm4IU9e97pPN+LEJ5fugJKzjAz3c/DMDoVWkbEnqHhsOzKxAAMpKsw1U8hABtoxsaYDvO4DvRRCjumm379k5KNPmcd7OnfxnlmO13bM0HupR1efYmIU9BZitBWBv1mmiKQqcU0/PnatvsESg4DML2eW5ew9MVeGWzr48xvd3SlbMTGm6zb/eiGnfsHLgB664oJhG5Ip4gEyLv7X4KBYFYMw2bHeMBPzDM81mOpOIzXC78AP9cXwY/+jFEnr8N39rZ35UZQ0G01d0TfWNI9Z0R4xl8+ozhEDYzSVMt5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmHyO9VlZy5tNldQuBdt9UxbzjPkOP5Dim+klahWIX8=;
 b=foeGiXHWtroFJ98EGMJmRBGzra7e1kjc6XDFLVigQjgLtmVOnlQAaMenfxMT1ASPOS/Vmg8Hs9YzApieimWdC7/oSA79eoxxV26ia1GNkiwJ5M6PROoMEyaLqj7J4OMyG5dAG27Y9vWFgtlWMfhlLhgpFdjrQihfhPyzUEY6HTUuefSIKNO5/rgD+USIjE1vjfBWi/K+4irFvZv1CWnQLkolC+eV8YdibV/a40qYdQXt4+l0YAuEEXPgVZAxeSJnbHKeH2xRaSrP5BoaTqkRhFsmAw3mMO4O/jC2I8FM8hbPxk7h/zkXQ/4AMhMZ2/fyL3sVZIDYbLRbFXtjsY4exg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB6216.namprd11.prod.outlook.com (2603:10b6:8:a8::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.37; Wed, 12 Jun 2024 12:09:12 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%3]) with mapi id 15.20.7633.036; Wed, 12 Jun 2024
 12:09:11 +0000
Message-ID: <89b9ca9b-c1d4-4d77-a616-41c1d22a058f@intel.com>
Date: Wed, 12 Jun 2024 17:39:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/10] drm/xe: Add xe_gt_clock_interval_to_ms helper
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20240610141823.2605496-1-matthew.brost@intel.com>
 <20240610141823.2605496-6-matthew.brost@intel.com>
 <CH0PR11MB5444CA0A965A6A39F47CA498E5C62@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <CH0PR11MB5444CA0A965A6A39F47CA498E5C62@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::6) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM4PR11MB6216:EE_
X-MS-Office365-Filtering-Correlation-Id: 9820fc3d-64d0-429d-ad07-08dc8ad877bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|1800799016|366008|376006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0FXdm9HSkk3eWpKSWhFVnhCdGkzTkM1VHZrOEp6dzBIY2M1SDZuRHJjVFdz?=
 =?utf-8?B?QXlPSWVXYjZBVDFxT1NTcUVKb0lJZFFZWThvSzlMTzNVaFVEZldrenhNV3Rp?=
 =?utf-8?B?b2Y3U1liYzZxcmVkaXM3K1F3RmxjQ2Y2TEVkNTFWOU9vSUNOcnJZTFZTQllj?=
 =?utf-8?B?a3dOSEcwYVE4TlVyNWl5blJUcHpDVnFZdDA0U1ZVWHdKVzhLSCtuWVF5RndX?=
 =?utf-8?B?bnp3a1hXUUpFaWx4T1RJcVVTOElLdDdxVXl5SUZ6SHJBR1ZQS25VRFgvanlE?=
 =?utf-8?B?WVdkZjRnaW9jSmJsYlZjbjdOMS9vQjlTMmFSbDV6UGpqVThZYVJFc1BIMDFr?=
 =?utf-8?B?b0oyWUFhU1E5T1J0Q045TUo2aVR1SnBreXJFaGoyaldacXFHOU9BS2tDZ01Z?=
 =?utf-8?B?ckZEVGxnU1puSzFWUjV2MHNsN0NacU4zY3F1QmpYdUd3UTYrZkxRZ3A0MmZQ?=
 =?utf-8?B?SWg0U1VVa0JvUGFwQXNFNVZFMmRSNDhtRnJSTmlEWjJXWFlOZ1kxem1Ic21H?=
 =?utf-8?B?bWluRm9oSTJoUGFieVczOXFvRFBKMjlhVFNXZGVkdXFhaU5YTDUxZTNQVzF3?=
 =?utf-8?B?UjdwOEZMeUlWQmFFZHFGKy9sVGJhRHRSRE1jenlMclMzVm1VRTBvVi8rbTdQ?=
 =?utf-8?B?NVkyNU0rY083U2NVU0VTZXJNOFdNUmMySGFHVzl2ZENLb0ZzKythWjJVZXUw?=
 =?utf-8?B?OHFReFVIdzlmWTNpRWtEZWdBNjJtRlYvMG9rYmFSSHQzLyt5NW1KN1lBVGV6?=
 =?utf-8?B?MVFxOFZXb09XSnEvR2RaZWduOVFFM3Y2SmhyMkpVWUVIb2FIaFUrQThNUDR3?=
 =?utf-8?B?MlRVQ2FrcVBTb1pQZXhYb2QyWUFJMzQwck1vbkNZRUlYYXZkLzVNTmIwZ2M3?=
 =?utf-8?B?anMvbTFLczZneCttUklLRTdpQVBUMlhhdURCSE1DdkpVakRuTm5adytYMlR6?=
 =?utf-8?B?THlxcTE4WGw5djFIL3JyN0pmTkdjS2F5d2FxaXB3M2diTGdLTVpScUFNaC91?=
 =?utf-8?B?RlBqeWw4b0xoV2FVZWozZU9zVTFNZzZPTzhYd0ZkS2RHSFVhM0wwQ25UT2xZ?=
 =?utf-8?B?UVB3YlRqWS82ek0zWGZoZmc0azJ5VGp6Q3lXKzdNSkVMNFBjUjc3MDdrRWty?=
 =?utf-8?B?OS9Dems0QjB1Wnl5QVd5ZE93YndxUitvRkFLQzJUQ2g2dTl1dkdicysrR1N6?=
 =?utf-8?B?WkVmNFFIaTBIZnlNTzF0NXJsL0x1Q0Jrb2pLdWxRWEF6ZzhIV0Zua093QzFD?=
 =?utf-8?B?NUxvZG12YnJpNmw3Lzd0dWlXbVY4WUoxWUZ3NzltdWdCMndGV2RIaktocnFv?=
 =?utf-8?B?c0I0YWJZbndKeXFHVUlrT3JMRmVlb1BQNjZWT3phU09DMlFPSmlZQXIrMGNT?=
 =?utf-8?B?RGFZM0NqYkl6a1VBa1VpeC9DNHpYaHY1aWZ0TXBudnVZYmxFTjNFMTgvZnNC?=
 =?utf-8?B?TVZHVjk1N1ZOb1ZVZENwbU1BUWdVQjMrcit3MEpuaDNqbUp1anNxU0wydDBq?=
 =?utf-8?B?RWhxdTZjQ0VQaG44YXVEa0owZ3FuSWtpUklZRmc0TlZtcXFkV3RMZlFzdHgw?=
 =?utf-8?B?L0wrQ1dhWWtBQlBTL0tabWNsbDNsMnZSK2NVVldaT2ZPY2gwVUZ4Nk1xNlRC?=
 =?utf-8?B?MXJ6MEJIWTBLa0V3Uk1hUVpmaW9FUWU3aDB2V25GMlV1R0VRWmx3YU1tejIy?=
 =?utf-8?B?OVhtdE5aMnFlRVRESVRRNkxhcjlwQ3ZvcXd1d2Y2eUtVb1pGYnk0Y1JuZmZn?=
 =?utf-8?Q?a++SycEi+lqKuJAJdR2e/T33FBhizKT2xJwB+Nz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(1800799016)(366008)(376006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFFJOWZmT1RabDFVS3gxZGRQcjJZNFJxMXRmQmtEVzgzUHVRUS9BN3ozbENO?=
 =?utf-8?B?RC9uVHVMd214ejJoYzQzY0ZvZmRVQlBKTklzNzkraEZsU0d3ZWJCUkVyMFNX?=
 =?utf-8?B?UWlkQ0NXZGxUMWlJY01iRnBpdXI2Sk9aT0g5VGFkVS9qSTFrVC9kQ01MbTYz?=
 =?utf-8?B?dUhWNVBjNVhGTGN5RzdybVRSRzl5UkdqMHhpM1h4NDZmUlErTDNwNkNuT3li?=
 =?utf-8?B?L1JUUXRhUmo1ODRjS2E0SXRhNEtkcXpZSVpJbzNGNzZjUVdxS1gwd1ltTHZQ?=
 =?utf-8?B?RmNQRHVGN2tuVmppcE5zZE83cVh0cWkzY0RDTXBHY2ZlYXFWcUlOYjlGR0tj?=
 =?utf-8?B?Zi9pcFZZaXBuY0lzRFZEdGVJaTVpeW43YVc1KzByeUZ6WEp0U01DeHAyU2o0?=
 =?utf-8?B?VW5jaXBkNnhqWGdWRXpoVDJqRmcrQXNnd1lRMmpOczg2R3JZSnhYdmh4Rzlo?=
 =?utf-8?B?NnJ6VUFPV2IyQjVxZWVZQ2dTWjcxMUhwQXFKZGIxTEtqblA1bFhMVnpQWVkv?=
 =?utf-8?B?MFB0aXZvc3dXdFZaSXlHWkFOUVRmWEJ5ai83ak9HOWdrR3lIVjIyOW52TFVq?=
 =?utf-8?B?TkpIU2VpVXRtSzdzOTlkV1FQMWtRRm9KNDdrcy9PVUlxdDdrVW9Pb25obXIv?=
 =?utf-8?B?UGQ2MlVLa1cwWDVVV3FVOEczWlZ6ZmQzS3FNb2p5RTZ0ZEh6Z0JlTGRmS21z?=
 =?utf-8?B?Nm5XZDVYUkcyeVd1Qmt3R0pRM0p2cUp1RmhsWllNSkhSUHhDQ2pOWkxScVAz?=
 =?utf-8?B?SmJxMFJsS0p5M3NTcmVlWTNQaGFiaUFMV2JkR2NESitBdWhhWGQwek5LbTVz?=
 =?utf-8?B?dXMvYnEvcWdMd3JOamlGL0VERUsxbktVUVQxdWhIQjlacElMbVZ4RldIQmlG?=
 =?utf-8?B?dkVHZG1YemZmQktkY3lDTHY2Rys2YnhxbVBIa1U0NVZWZjRHT3NFZ3kxZmRQ?=
 =?utf-8?B?RUtPcWlmbjJ5VEFlaE52OG94akRRU29EdUVYQmdIcmliSksxdWFtMThzR3Fw?=
 =?utf-8?B?L3BxYjVYS21oYVBoYWRYYi9YWVY4bXN1Qkx6TmFpTWorR2cwbDl4N1hPOFZJ?=
 =?utf-8?B?VFhFM0xIRTVDclNxK2h1dnBHMkpPbThNTkNtYkpoUVY2cXJxZ3RzWS8rQ1Jl?=
 =?utf-8?B?ZDlyUTRzZG9oNlRhbTFMbEgxOExXNjkrdVVwa1lZZDRMWVJXeS8xZVFucVlz?=
 =?utf-8?B?VnZyOWNSMkRucUxGSHVlek9nWUpzREtYVEVJY01qc0lybkZOZEMvcFg2L051?=
 =?utf-8?B?V2NhT0Vab2J3ZnZ4Y3FGTjdMa09USmcreGQ0eExnckkzc0Y4dFlzLzB4YWI5?=
 =?utf-8?B?QUJkSDcxTEEwQjNSWEV2M2hyTTJWRmsvcVZydGRDeWNiNlVRMlZBVjFtRnB6?=
 =?utf-8?B?MktTZWJTaCtXZmNPOEdlOUNxSnMyR050VzhVL3p5VTBRVHg4eHZUVEl5dGpH?=
 =?utf-8?B?OXNzQmFtT3FvbCtNRVh1aGQzc1RrTkgwTEpuZk5kTFZpajY1QmJFWDAzaC9r?=
 =?utf-8?B?RUoxRDdMOTJ6a01OdC9KcTdRRzhIYi9ickVyMENqMlF4NFdmNS9QS3BDYXQ3?=
 =?utf-8?B?VjRoRDZqWGRGZE9iU1A3Q1Q4VUNyWVlaeHRQSmM4aWRFRUdGcnE1OTNMU1ZP?=
 =?utf-8?B?KzB1YXlXVjF0MzczYzJkSFA2c1pQRk01TzJYdkpNWWdyZ1ZpUkgwazYwSlQr?=
 =?utf-8?B?V0hLOWcwa1N4SGNkRzc4WXF5NmNxZEZLTmFtK01IYitVQ0gyZzgzL1pNNzhk?=
 =?utf-8?B?ejFwdWJHRDBCNjJTTUxHRXIyUHlHMzFyWXNWOS9WdDFOQUU5QnlnOWw2ckhZ?=
 =?utf-8?B?TDdaU1JXdU5HcHNZcFVYODFpRDdIK3poS1k1WXVYL3JRazVkYjFydVBOYUNB?=
 =?utf-8?B?OGVQaklubXdVQlhXYW55K1BwL3dmTFNEZmxnanZ0c0pwcEtKVGF1bHYvVDZ0?=
 =?utf-8?B?eEREQkJNclpxYnNIY1RzWG81MnU0c3BrOWRHcjVrdWtXa3pFT3Yrd0VNOXNI?=
 =?utf-8?B?OHJZd2VOZStPM3FBNTBhamlmSjNyMFBRVHRabTJFTUxRNjAwMWo0ZEg2ck1m?=
 =?utf-8?B?c0N1VnNEdisvcjNMYlhQc21teGVCN0dZSFdPbndSOHJSZnhYZ2ZyaVArZzdY?=
 =?utf-8?B?bnU3TGthaXZGT21XR3J5NTBDQy83VkZTNURQS1IvNzl3Z1RvcDVWSkNhOGVH?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9820fc3d-64d0-429d-ad07-08dc8ad877bb
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 12:09:10.9640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oW2WpXItT4Uy827M2CBMKJoQyiQM1lq6dokBPhK64Jv7yAKcR6oFrbrnoLeq2D3W3ka7rBABpCWTzzQPX+q6qXIvhNf7gcdwjb1zkNMMjQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6216
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



On 10-06-2024 22:04, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Brost
> Sent: Monday, June 10, 2024 7:18 AM
> To: intel-xe@lists.freedesktop.org
> Subject: [PATCH v5 05/10] drm/xe: Add xe_gt_clock_interval_to_ms helper
>>
>> Add helper to convert GT clock ticks to msec. Useful for determining if
>> timeouts occur by examing GT clock ticks.
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_clock.c | 18 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_clock.h |  1 +
>>   2 files changed, 19 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
>> index 9ff2061133df..a9392a743fd5 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
>> @@ -79,3 +79,21 @@ int xe_gt_clock_init(struct xe_gt *gt)
>>   	gt->info.reference_clock = freq;
>>   	return 0;
>>   }
>> +
>> +static u64 div_u64_roundup(u64 nom, u32 den)
> 
> Nit: I think this should be "num" for "numerator" instead of "nom".
> Or maybe just:
> static u64 div_u64_roundup(u64 n, u64 d)
> If "num" for numerator would be confused for "num" as in "number".
> 
> Otherwise:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
> 
>> +{
>> +	return div_u64(nom + den - 1, den);
>> +}
>> +
>> +/**
>> + * xe_gt_clock_interval_to_ms - Convert sampled GT clock ticks to msec
>> + *
>> + * @gt: the &xe_gt
>> + * @count: count of GT clock ticks
>> + *
>> + * Returns: time in msec
>> + */
>> +u64 xe_gt_clock_interval_to_ms(struct xe_gt *gt, u64 count)
>> +{
>> +	return div_u64_roundup(count * MSEC_PER_SEC, gt->info.reference_clock);

DIV_ROUND_CLOSEST_ULL can be used here.

>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.h b/drivers/gpu/drm/xe/xe_gt_clock.h
>> index 44fa0371b973..3adeb7baaca4 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_clock.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_clock.h
>> @@ -11,5 +11,6 @@
>>   struct xe_gt;
>>   
>>   int xe_gt_clock_init(struct xe_gt *gt);
>> +u64 xe_gt_clock_interval_to_ms(struct xe_gt *gt, u64 count);
>>   
>>   #endif
>> -- 
>> 2.34.1
>>
>>
