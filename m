Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC4CCEFC36
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 17:18:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D83110E59C;
	Tue,  8 Oct 2024 17:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j2Lmr61H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648AB10E59C
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 17:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728407888; x=1759943888;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kQiah+hELKRvxp2rZwyHOJaXEFcy9seO94uLhF4Ij4g=;
 b=j2Lmr61HGZZa0c+i+axissbxB96yYumnocLxgnIa7Xg/rJ1Rao4NrpD9
 aYo8SPj1UzhrjDeAZ8RG875nIzB6LIjo2dc2P8D8AiM+TIL8BcsOtoOqO
 MGTnSv6Udvj6BCLuZx64rsjsrsOxeph4FZLTF8AKfP3LF2cUhEuHOCzrM
 tB3mRGIE8hdhfHR3zDJ6HQQ3cRmsBsR2+TG1q5QmL5gV3ZPyhbQslAwZw
 rV5aUcED1Tw0h+dZ1PVxyVUGqSV2Af9VAcohssuYyL7NaJr0VZRjq4ljw
 vl41rYnA5q40IIIYptM7L2jT8SPqVdWHWOiOBoYouPGnTEoSHXY6JIwGX w==;
X-CSE-ConnectionGUID: pquW5st2R5Cu33Cp8VxIkQ==
X-CSE-MsgGUID: HFpL/EcWRPuMi/yMk8IE1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27578516"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="27578516"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 10:18:08 -0700
X-CSE-ConnectionGUID: HBHBZp3kTsWOAOGtIt/LBQ==
X-CSE-MsgGUID: e9U5VbkCQqe0l1nXmt+waQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="80344411"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 10:18:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 10:18:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 10:18:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 10:18:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HnqZoNhos9GECoc9NVfrWD6X97FBftVBuIlriFiR6/nSmWM8lbnDeZqYS89Cglc4whIGCnFdF+ywwoqCfKIMdai9eU5Dpgva6AHmRRK1kZcA7fep21L3nomqzngiaOFcSC1jRpzdgwI+VjxkJy1mv28soT5fmjQ4YSK3TyT06tmTuycF6ySIhUiwytt7zkW/twRvmRs8cHf4lUzQoVCS0jsGTuLN03WjXKZtzwxz74qbMAcIItf9soh3wuQ191g3+q/vN72UhJ3fhl1rwmtnM5F2j35YNb491LFUwPPpqBfB/FHUHj3CVoyT1rw8slNdlqrxWcxJny5FHUkuXInjjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JQBP3DqByLgaMsho6DaN1ARKFaikM7xPzRpwrUBGCg=;
 b=oPBhAQCaxFQ5TCfOEApcHGpXe3y5KgAUf9lXDPutF5ILpLbPJuEgHhkgoLhTfPNaEvHNCDz1tNkLJm/9vC0GYbLddAq0d6qhW7Bbmk5YVx5/Qy0J+wLsLTwgr7Z/jpqUDkHupHu3v9EHrmr20uZYT4/wyd+DyaASU5Mf9wuKbb0S+VL3oXhRPrbWBNG8ydf1HjfFpRZy2ftdb6q9KZ8GnaG0NIKFvBE5VrRbvjEK/5QNOaeCIccL6NP8kqH67yjgv7V8KMyCLZ5JqgxHH6TiIiNIXt8TuD83NYxDmnGPkVe02xzMusFkxzUnBthn+PRRmcPDkq/GoLubAT7Mys6L1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW6PR11MB8411.namprd11.prod.outlook.com (2603:10b6:303:23c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 17:18:04 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%6]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 17:18:03 +0000
Message-ID: <0a4e7b14-b55e-4ea2-a044-b48fe711a887@intel.com>
Date: Tue, 8 Oct 2024 22:47:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 25/26] drm/xe: Ensure __must_check for
 xe_force_wake_get() return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
 <20241008071115.1862704-26-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241008071115.1862704-26-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::12) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW6PR11MB8411:EE_
X-MS-Office365-Filtering-Correlation-Id: e48e562d-a8c9-46cd-7aa7-08dce7bd2b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUt1SHdTblFsZ1MrYnFtOEpvYThtMEEyNnRPaE5Lcm5JMUJTV2p6VVpwRjlV?=
 =?utf-8?B?VnVDQUZPV254NTQyZDZvdDVwbWFqcjVXQ2NiRzVtV1dZTDRoeHc1S21yRlZk?=
 =?utf-8?B?eGM0YVJINFJwQTJleUp1am5Xbk81U0c0ZkIxSFpxOUVDSjhKOUJldGZYeXNt?=
 =?utf-8?B?SnhyK0NKd1VES3graDhlMDhLM3NvMzdoVk8wSXAzOFUxSTZFSlhoSDZoRW1z?=
 =?utf-8?B?VlJGZDdPcVg5d044RExadVFJeFNOLytMNERyL0tkVi9YeFc0amRXampzTFFm?=
 =?utf-8?B?WGk3bnEvMnFDK0p5OE5CbFZNcGxPZHFUejVWamRxZ0d2OC9mdjd4dVUxVEhP?=
 =?utf-8?B?RWZBQUIrSlJxNjRXSlJVU2lBQkVTdjllTFRQbjVxckdmbU80N0RvWmdaUlV0?=
 =?utf-8?B?YUkveXBLL1JtbVV3UlBiNVpQcUlkd25Wb0kvSXB0YlUzYlZaUGxZOWlSU1Bt?=
 =?utf-8?B?dmdZcXJrWHZWZUkreVN5OXlpdGNpN1NqYjBrcUd2Zm4zbTl4VWZaMHFqTytp?=
 =?utf-8?B?SHcvMTJSVDR1b1RURTlhdWhJUng0NTEyckJDS3ExWTJBL3BDUjhnUnBJVmp1?=
 =?utf-8?B?UDhwb1dFajBNdEppTE55bk14b2FSRlpkVEE1b0c3N0tKUWU2WEY4NHZLZUdk?=
 =?utf-8?B?NXFXN2s3SXMrWm8wSVlZRWJCL0JKdFREZllRQlJBMWZyVjd5Z09rcXpUZ3R1?=
 =?utf-8?B?T2ZZQ2J0dEtEb0ZtaDBxMkNCNjdkTGRmd3dKdU1WZkFIT0VNbDlUVG44S01Y?=
 =?utf-8?B?WmlTVlFxaWQrSkxTL1pQZzE2amJWVitxOW81SnNMT2xJV2plYXlFbG9uWGRx?=
 =?utf-8?B?WkhTRldUQUUyR0hiS01aeGZUaG5vbG5HNjIyWUR3ZHNyeGpxajJVVGExa0Nk?=
 =?utf-8?B?SEljaDBaMUJ2eWxGbDR1S0JyYkp2NCt6SzVFNVozSElNQkZZQndZMXZVR2t3?=
 =?utf-8?B?Z044VGRRT0xLcVBKMVZIdVpiQ1NKeHE0UjEzN2xRci94R2dReWNYTElRWFdz?=
 =?utf-8?B?eFRiVHJKaWVOMDlvOTNnbXlTL3MzMXNBS2hLaHhrZlpBMzlFa3VkTkNqRWVD?=
 =?utf-8?B?Vi8vVUR0RHJ0RWV3Qlo4dnRKZ05BOHhFd2ZZbVlpRDNFbW9sM3hpdmFiTjBQ?=
 =?utf-8?B?YzZiVlZkT2ZuT2FTSm0zS2VkcjkvL3FNMGVUWGtxNHVpQ3AxL1VqOW80eVlu?=
 =?utf-8?B?YTY4RE9wWHFkWlh3dHBCTU4zQTExZGtVUytveTNBRlJXWElPYkF6bzNZcmVw?=
 =?utf-8?B?QVdIZWk5NS9zR1htcktJeHdGRVgxdjh0amFpTnQ1QklwRW15b1dSSktwK1RN?=
 =?utf-8?B?Z3VWTW5oVVZmQ2s1Y294cUo5RDBwOU5UWmhqQmdsTWtwSE9aNUIvQ3hZTG5w?=
 =?utf-8?B?ZERnaGJSRzlEQ0lNVVNoYnRsWXltaUlzbXVOTlFQMlFsTFNhOHZsN2VzL04y?=
 =?utf-8?B?T3ZyaHd5b2Vlem1nbUwyZUFnMWZFdHJoampVYWxjUVNFWFNHTjBCaUhUL0Fu?=
 =?utf-8?B?cHNmQ3ZqNERodHdaaGF2S0RPVHVKSlBCUkFJQ3dFeExFVEh2dU9wTDhOYkxT?=
 =?utf-8?B?NEdVTWszUGg0NGNYMkZQZjExZ3RkUS9OeGlEMHlzci9oZzZ2eUVJTTZRODBH?=
 =?utf-8?B?NWIrdGR2amRJOFU5Um9ROWpxRzVhSkZKckorV1Q1MGF0ZWxPK0JLYm95TEpH?=
 =?utf-8?B?Y3NNVjZESnV2ai81eE1zSU1aVXBCcGFINXRvRWNOZ0dpdEhCeUVtVDR3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0JjUzJQdzZ6VXdSMUgyS3VxYjkzOWVGcndPVDA2cXplTVplYXhhK0ptWHpO?=
 =?utf-8?B?bDVsZjZSOS96UGQ2Yms5OVhCQ0lOaDZ5TExYb0RXRkx1RTdUNjQ0ZU1TcHJs?=
 =?utf-8?B?eHBnVDZXbkRsMmpISkNpdTI0aEpwNnJZeWxrVGxmK0hGdGgvY2diekdyczhR?=
 =?utf-8?B?aXh3L3c3M3lBSmI4SGt2bzA4bDR6Y1JhTjErNUJvbXA3dU5OVmdITnE3MnRy?=
 =?utf-8?B?MXdyRGFUL0Z3OHBvQ3hFeVhUcWx6akV0ZkRZNFZnK1lXNUF1ZExKcHMxSlU3?=
 =?utf-8?B?K0t4KzBoU2lOOUNpSytoSmpLVmtNSHRBQ1oxWUNCS3pPcGM1enZ5Z3VCMnlv?=
 =?utf-8?B?QXZLSG5RQmRHcURHc1l5S3FkRWxZOEhQaVpiVTFJeWs0ZTc3RDE3L3FHeW92?=
 =?utf-8?B?MzU4VVdzVjRpTktSeEN6SjUxKzBydWVTdFFoLzJlZExUMmVhTFd3K3RtV3JO?=
 =?utf-8?B?TVoxV1kvWldORzgyUmtPaXhicGpLSDlrcjl6Y2dWTGQ1NWZoWFUyMUMzeExO?=
 =?utf-8?B?OERjcTJQbnZJVWF2VEhFV2ovOGRYclo2UjhIUDdPOWpsTitVUEc0Unl4T2hl?=
 =?utf-8?B?VjRYL3dqRlgzSXRUeHR1TUR0ei84RzVPc0RPZEZBeFZrU0JBOUpGSCtVSjB6?=
 =?utf-8?B?QWZXRWZNb0lCZ29ZVjJTb1p1YVJlR0NGU3d5WnpEVGI3VHp4VW5DakFpSzhh?=
 =?utf-8?B?QTkwNmhsTVA0cFpjMzJERFVNTUQ3MDlOVHdVYWhjdkxiK1BTZkkyOUdQUlI3?=
 =?utf-8?B?aEp2RHh2RUJ0bFphbGcrWW5KcWEzaE9wdlRwanhSUTZRcE9Lc29zaFJ5S3pl?=
 =?utf-8?B?dW1ScldDU0FTSXYrNmhnbGpVUWdHam8yRk5pT21VR1B4djd2STVBaTRlWGhR?=
 =?utf-8?B?aFNxSUl6a3RZMnE2WDA5TUJUbDJ1RmVabGZiakE2bEdzV3ZKMnNJVzRyQ012?=
 =?utf-8?B?R2dLTThUY1k4S1VIekJDUjhwYk95a3NtRGVYR2xLNGFsUmUxMXIvM3duelJq?=
 =?utf-8?B?bDVyczF2ZXVIUWhkTzVIOEgya0ZtMWlEMGp2Z3Z3dVRLQVpEQUR4WVFobzNl?=
 =?utf-8?B?UVg3RWFvdFlZTWhFMU5lZlhqV1BkNGRvZWx6eEhzUGRyUlpPVElXRWprZG9t?=
 =?utf-8?B?NXFpNE1DMWNhVlAyYXpkY2NEcW1zZVdIbHdkVDhkcWlOeUVvZnhNYlFNYWdt?=
 =?utf-8?B?VXprcmxWVVp5TC9DWTlGM29CekJ4UnZZNi9QSDBURXlSNml5cTQ2dDZnNjc4?=
 =?utf-8?B?OHlpQWdsU21JU3RmaWNsQzVtZWdsSG9kQ1hkbkVZakpHR0l0RDFUYmg0VHhl?=
 =?utf-8?B?UkNPWldySGhXVERGcFZWb0l3dnhxSC9yU2pRS2E5WS9BWmVneHhUcWFWNFUw?=
 =?utf-8?B?U2hWWGFTYTBQanJnZVlVZloxZlJkTjdXMUVGWGljM1o3WklNMzRFV2dUWFZW?=
 =?utf-8?B?dW4veUtOdUlxOStTMDJOVGUxMlJpYWZoV2R5VWptbXpsNDliYzNLOWRyRGg5?=
 =?utf-8?B?amUvcXcvbGEzMWFmMk5zZFd3bmQyRjFWaVRxc2JsUVNieVRNNFlWUm5FRk4w?=
 =?utf-8?B?bWF4aTYyN3BxRU5GNHd6K1c3NTM3K2ZqdVI5V0g3a2hSSjlHb3BVVkh5bkVL?=
 =?utf-8?B?U3lIMUh1WGZOYVpjZUV1TFVqUzNhKzloYmJMQUphTUk0b0QyRGx2cTRkREUx?=
 =?utf-8?B?WC9TbE1iUnZDMy82K3c3YTM3aEtCVXozNFNXcGxnYU9ucllwNk1OR2ZrQWNj?=
 =?utf-8?B?aU5MQVk5eW5GV2JVcXh4M0xwczUzam1KaWNMUDV0N1U4TlBiUmgrM2pxcDJt?=
 =?utf-8?B?RHdMWWo4TzI3TEJxQWFDOTdvZjZqNllCbjlwOWdkUjhpMWtwMDZrcHlQQlU2?=
 =?utf-8?B?amJJU2ZpbjlzM000RGpHRWNERFdSVFVUakd0OHBQTXBieTBmVlBXNGp2YWV2?=
 =?utf-8?B?amRhbXQyeUFYeHNPV0lQVkoydTVDQnA0WjlrbHlCQ2hlbHBDRldxaFUxdDRr?=
 =?utf-8?B?MnFhbmZBZktFVER5eDhEaVBKT2RrK2lXUU4zWnI3Yk95c1dQZm15NHBndEJx?=
 =?utf-8?B?STBScU94Q3lWN1dCKzRZUVBIeW5aRU5UVzRqZXV1K1h6QU1kbzFlRW1UTU1Z?=
 =?utf-8?Q?EK8Puw8OqNG7tVBQxbNIIXFbx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e48e562d-a8c9-46cd-7aa7-08dce7bd2b04
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 17:18:03.9670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IltAL5dZsieJYG5pdnpEWTHIg1RZVL09BVvJTyxOl1b/MmpfhamJIY6bzdFSope+bL74YP+C4V9TjVfAHjCeLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8411
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



On 08-10-2024 12:41, Himal Prasad Ghimiray wrote:
> Add __must_check attribute for xe_force_wake_get().
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> (#rev1)
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_force_wake.c | 4 ++--
>   drivers/gpu/drm/xe/xe_force_wake.h | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 7ff2588a8c47..5d749bad9496 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -169,8 +169,8 @@ static int domain_sleep_wait(struct xe_gt *gt,
>    * Return: opaque reference to woken domains or zero if none of requested
>    * domains were awake.
>    */
> -unsigned int xe_force_wake_get(struct xe_force_wake *fw,
> -			       enum xe_force_wake_domains domains)
> +unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
> +					    enum xe_force_wake_domains domains)
>   {
>   	struct xe_gt *gt = fw->gt;
>   	struct xe_force_wake_domain *domain;
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index f0b27dbe7581..70faec9ae2d9 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -15,8 +15,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
>   			   struct xe_force_wake *fw);
>   void xe_force_wake_init_engines(struct xe_gt *gt,
>   				struct xe_force_wake *fw);
> -unsigned int xe_force_wake_get(struct xe_force_wake *fw,
> -			       enum xe_force_wake_domains domains);
> +unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
> +					    enum xe_force_wake_domains domains);

I believe this is meant to guarantee that the return code is used; 
otherwise, it results in a compiler warning.

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

>   int xe_force_wake_put(struct xe_force_wake *fw,
>   		      unsigned int fw_ref);
>   

