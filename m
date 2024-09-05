Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CF4CD4F54
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 05:49:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4A310E681;
	Thu,  5 Sep 2024 05:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kr+/1Xsb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A28410E681
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 05:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725515345; x=1757051345;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ECchOHG/kDxZg7ZjPI7t5xXOK8VXRkx7Vz8xKguJJnQ=;
 b=Kr+/1XsbJ+p92Uo3FftKpUzgkD+vqzXpE7tdKfCXAtKQmsLdbTg34rIh
 ET4KPjCsNtcd1ajhSaFM+bp8xd1Gq5OC0GO6Awd04YeNiU3TWhf5Pzpqj
 2TRgSmrd3yrw+Rz6qtCnMOT+DFRnvaAibkgw+InT0Cg004WsQ5tgqAB9P
 hALmTxZJtFb35XH7XuEV8abeqmdJDf/CYFcNCRDP/eZJe36ooOsPaO2g+
 bBVen4zmhc/D8uegT36Ij1D1/2lLEW5YED3nqZLTmVs3vvGKqrCooSyva
 A+O3bDCZIY+4PX3nQuY08vDyOYhvmzKA4hLba5nYxRD5tiU3FejYDOmln Q==;
X-CSE-ConnectionGUID: nh7+P7gnQFSpOIhi7sWOYg==
X-CSE-MsgGUID: r1ZaAW6rQF+SqXA2+LY1KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24354733"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; d="scan'208";a="24354733"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 22:49:05 -0700
X-CSE-ConnectionGUID: CSRTOPksTpeftYbE0ZSgQg==
X-CSE-MsgGUID: kMWFNSiKRRayNKmi2u06pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; d="scan'208";a="65197628"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Sep 2024 22:49:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 22:49:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 22:49:04 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Sep 2024 22:49:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xUE5kQUHyywHi/v91FhKdZcKTW0VKtCKz6Xx6eb0Xf2CzO0mT88rNmOu8aMXBGL7Lqhjfg6X2tnJLMe65sNQiJC2kIZuNNT8LPN5Q2QRLqW5Qu3b6fQ32XrWo3m3KhJhoceCSrcPC8XEl/A5S1EpQUesWXS953D1NelhZd2fwJTgXBRkLG0hKEaRAdQfb+qxfTq6fsQ+l4/la7IWqClGOE93V9XTIMiL0VQR2mxtgaJo1AapOE8/DhRV2ZHl+E2sH3OyfVJYmbzvZDAf3p2u2cU0SpCSjz4aZzk5mUzgZECmlk9kjYX+gkH1rdDQDNNC8NW7btgsw+8T+tSBwk69ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0s2GlPTUA3lSaQK/412ZZdAlALFSb1ycEkJbcqj2hyg=;
 b=B9x0/HEKSueeKZiKewbNh2CUTyJG/WaC2CLai5Z8XWhnEdjxCewVauzNhP50gWRp7gdpxqeuVwxfLeN1QLm/CYdjczzxHDTQVyq40WDH25DjO4btocV7RW2jao031K3gpl2C7MXBPXO9Y86wwZ1ccoQdbzhLUwOxk/Ov+kIF2L5PqX+ddhKNfzS4303vZ2BXp260fFJr9K4na2mKiwY++PlMsSi6boKjP6GQwd3Jmvn0O8jU11Ss55S6xyvpgBjVOduKL9nWC9z+EXuIVMDuYBX8ePU7qMDY1ASZjlKLuTsym5eD0x/ZbDo7bHx0QqQik1OgFSZI6Rp9rwZAYKDFow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by SA2PR11MB5004.namprd11.prod.outlook.com (2603:10b6:806:112::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Thu, 5 Sep
 2024 05:49:01 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 05:49:01 +0000
Message-ID: <c16670e1-9cf1-4e17-8818-e5dc8b6b2456@intel.com>
Date: Thu, 5 Sep 2024 11:18:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/xe/xe_gt_idle: modify powergate enable
 condition
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <vinay.belgaumkar@intel.com>, <badal.nilawar@intel.com>
References: <20240905052813.4169007-1-riana.tauro@intel.com>
 <20240905052813.4169007-2-riana.tauro@intel.com>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <20240905052813.4169007-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::11) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|SA2PR11MB5004:EE_
X-MS-Office365-Filtering-Correlation-Id: 201f86ce-5903-4280-b586-08dccd6e7176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eC9WcGE1M3RjK1ZkSndqYUJHUlAyWldRdHVQc1YrRmJZbnlLbnE1ZE44R1pV?=
 =?utf-8?B?RlRqdExDYU1kVnJwTXVDaXN5YU1rN2cvZXVhT2llakxFY0FTUFY4SGFGZW5t?=
 =?utf-8?B?cGZNcFNWRGUvcHBlNlJnY2JoZUc2SDNqenMyMFIwZ0EyZ2toaHBmRzBkZGVC?=
 =?utf-8?B?Mkh5anV1RjcrWVphSkRMeXBTUjhxZDVTYW9Xd203aXZtRHdWR2xhM2RBeDVP?=
 =?utf-8?B?c0pXQmZMb0FMZTVXMmVxRHVoSW4ySVRGVWZCUkFqMHA4TmtRYnpRU2JDR0No?=
 =?utf-8?B?UURMa3ZGUTUrQkZmVmNUd1ErSDlON2VQTmUvQ0JrdXA1eDRwMldZSjM5M1or?=
 =?utf-8?B?eVJxd0U5L0xXdkhIUDhaREVaUWFUbTQxWGdKRkhhNUMzZW1LVlVscXZEQ0lO?=
 =?utf-8?B?T2poRGsxZFNCc3Rsa1pBN3JvRlVWTFpqWXFUTHdZT3RDRFVtQjFOMVl6SzN3?=
 =?utf-8?B?RjVGVTlQTW43YUZ4ZEIzWFlvcE5HMHpHRXY4dHpiU2JmVFdxSGsycG95bElj?=
 =?utf-8?B?d3k1TWFrL1BiNDBCUDZ2WWc4N0huL016ZWMzV2hCYjM4V0tmWU1mcGpkNDVz?=
 =?utf-8?B?ckk5aVA1QzdhMFNMa0Y3Mi85dzVqNVVXdHptQ2E1Qk12bFFmQStIN3JxaVdG?=
 =?utf-8?B?T25sdzFaWE5WcU1RSCtiZm5qU0pBQlg1K2FEbTJwTEhRMWpiNjVzeGVxMFJ5?=
 =?utf-8?B?OWhtbEJWNTFtV2k2VTk4MHBXWmRtSHNqaXNJekhGaE96WVFDMGd2SUM5ZVRJ?=
 =?utf-8?B?SURJSlZETk5PdGxCZjhuSjBpM1ZDaktOaktxUk9LUkM1ZDAzQkowR282Z0FD?=
 =?utf-8?B?SHB4UFRPTFY1OWpuSGhUL3o4NnBaVmlZK3FpRDZXS0xlWSsvYUJwMGlyUEJL?=
 =?utf-8?B?a3lEa3d6bTFZalFJakRqQ211QUpVV1lJQnN4OFhveTkrc2pHTXZtYlhPNjdo?=
 =?utf-8?B?bHJFaXFpNzJGajJadklaVStrOThLV0xRUzBJMFloM05LdGNQY2syczhYMG5m?=
 =?utf-8?B?T1N2eXdOVExWOHZlcm5haUtiZ3FkYjBIZ0dCSHZERVBjN0Q0UTkxalh4eU1H?=
 =?utf-8?B?cms5R3BESENBckwwSEhVYVZrMUVNclN0N2o2NFpWRk10bHh1UU1PaDNycGpC?=
 =?utf-8?B?ajFRSE1ZQmNlbGpHT0xEbFRQamdxc1NnTnF0bXRkRVVnUG1Pem5pT0RnZWZp?=
 =?utf-8?B?TDRSVzI0dGxidllkVFNGbytQWE1OdWJyRnFyUjVoZFMwd0tJNGtrMkJudEZK?=
 =?utf-8?B?ZkNKSExtM2Y5S01JMzgyRnMxL2lBRUFjcURURk9HSDc1aTZabWcvYzl0ejdU?=
 =?utf-8?B?alE2T0JVMmlXYnZQdmhrZldIc01kMHV5VWhvbG52S0RuSGpNZnRFNXptbnVP?=
 =?utf-8?B?OEpuQUc2a3oxSWtZS2pGb3lKZWIzTVJIa2xnd3pGYlVIQnBnay8va0R5WGQx?=
 =?utf-8?B?T1pCSENzUXRETWIzL0VRTGd0UjdtdTVsSllzN1BrdjhBOUZucjd6eTR1ZkJp?=
 =?utf-8?B?RlFIUTZadDNWeHgxWWFMNnBBSXlRUkFjNisxSTR4REIzZ0g4VFo2c3JqTVZO?=
 =?utf-8?B?K282VnNaVkU4NUw5UFBtZGFkTjVleWw3N3BBYzQrcTU5UjdHQndhS3l3dVc0?=
 =?utf-8?B?RTFacEVIWGwzbUxJbnFja1p5dTNiZ0dSMmltWHpuRGQxays2OGFLT2ZqYnFP?=
 =?utf-8?B?TnhCOW1vWi83a1AwS3Q1Z2lCZ2lYdjRCejZCcnNiQnEwK1MyYnl5T3ZQais4?=
 =?utf-8?B?UlFsNVpxRkpKRlQxWEk0L0RnR1YyVlZSQXQ2TmxxTXVSaStGU2FWNmtjN3hi?=
 =?utf-8?B?NkFPOW5yendqVEVScHNhZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmV0bkFEZVpLckVXcEpYUEx3MUpBTnpPZW9xUGhKemI1TFdZTXBvem5VQ0w0?=
 =?utf-8?B?djQrSkQ0cEV0aXFOdWNYT1YveFlJSzhnTjVEL0doZVhhaVFCRW5XaUZlWDV6?=
 =?utf-8?B?ZnVZUTIycHY3eTd2OWgyN0FMTnVHd3pZaDNDQUF6NUpCbmFaT0FTS2FtRjVm?=
 =?utf-8?B?Q2E2ZHNYQ3cwOWdLc0wrTmZyaTUxblhiWG5LQnNIVkQ4am5XMFB6OGxyZ0pk?=
 =?utf-8?B?OGNpMVY5S0tJU2dWdHVyZnRYNGtBZTUzbW1Hb0hmR1Myb3B4eGl2Z0YrZGty?=
 =?utf-8?B?Z1h3SGlnZVlmVWIwMlVURGpaOGc4MmFRUlg5UXNreUZNUUtyWkRIVEN2U0tS?=
 =?utf-8?B?U2d0M0d4MGJZRWlUR1hvNE9OVGdDYS9kdUt5OGRjeWJRNzRUOGNDeUE1K1Vo?=
 =?utf-8?B?VHE2c3pKNUhrN0IyTWZVTldRMmNvKzY2Zlg4blNwSWN4RGVLQWJUelB0d1JY?=
 =?utf-8?B?U0lpbVYzZGtUbUw2cXhjS24zMVFZaFlqaEZQRnZIR0wxbytKamdOU1dkSGp1?=
 =?utf-8?B?NEMwRjJTSWF3QW9ubithbnYveXBuVURlbzBtZ2laOTB5NGE2dTMrK0FNcFJv?=
 =?utf-8?B?VmpuUHNFazY2WjV3RjRUUjJSRTQ3TENjak5DQ2FQTHB6d0E3V1lwUzhIWjNx?=
 =?utf-8?B?NXIyQmI4aWttUko0NjlpYmtCQW40RlNQQ2FwaEtmOTBhaDVZR3ljRkVwVFRh?=
 =?utf-8?B?OHUvcmFMTy83aEV0d2FPM1U5d1VPOTRzUldjTG1RekQ0dG9kTFhMOEZoMElx?=
 =?utf-8?B?NTRhR25hS2ZDWWV3bktaeHhWRGZBQ2FiWTE4ZEhXTTVrS0s4R2lld1c0Q0JE?=
 =?utf-8?B?d3o2NlRDSm9EWi9lMlFtYVpSblhNbzBzYjlQK0drS1djcUNFNWZ5eFhEZUZy?=
 =?utf-8?B?T1FmeEZCS0lIS2ZQTWVmV0VjQkpSUEVIc290NmxMazZvd0NtYTZyL2FoMWdv?=
 =?utf-8?B?bnlHcXgyaFJXVHVIOGNmOE1ZWFMwVFpLZU5zbnhSeTloNDEzTFlqV2tDbjV5?=
 =?utf-8?B?cDd3VXZjL3hNZTExYUVDbW1jR0Evbkl4V3BmYjdmYXozL2VBSHBNaWtvbjYz?=
 =?utf-8?B?MkhPdDJlMTM3Q2dRY0ZqUFFCRzd6eWMrdkNycjJUcUZFN2t0V2syc0xzcWYy?=
 =?utf-8?B?aXVnam44Rm5tNnNEei9ob3JobUdDbklHaFIwN2FMMFpYV2phUmlYeTVwWnhK?=
 =?utf-8?B?bGI4S3FPclN2NlF1dlk5WVYvMnV2TkV0aGdhVWFoVVY2d1h5WERNZnl0UVRh?=
 =?utf-8?B?RzJNUzlsSVdtTC84WkJoKzZ2MEpmdjlhNjQ0NmkrcklKaUtWT0RkRVFCbzFl?=
 =?utf-8?B?WWlxdjlYZjlDM0VJS1RNL3dPakFyOW1zWUcyN1Y4QldlYUpFUE1uYnNFQ2xY?=
 =?utf-8?B?YmIwYUNVM1IrTmVrSTJ0dU12ekxkL3g1eGF0SkFnQmtYZnlReWp2Vkh2MEtM?=
 =?utf-8?B?V3RmYzRJZStLTVEvRjMwcUE2c01aUGtIalNvbzNPMUxocG8vb29VT2k3VVZL?=
 =?utf-8?B?aXBXeTl0c3QxemRmcDcxckFVdjB6YmpOb2pac3BZU0k4YnVJWUtHTFRQbjVX?=
 =?utf-8?B?c2c1ZUUwcU0yckEvdlUzc0hWUEhhUXVxSDlTSlpRRHpjcmtnSnlhNld6c3N0?=
 =?utf-8?B?MU52aWZQRGE0UlVmL3hRTlMrSzM5cVN6c2FabUl0MEtOSlo1WGEzU3lpdmF0?=
 =?utf-8?B?WVdIemtmaWgvSVliMmtmQjMzVDFOcTA4YWNySHFOYW9BbjNDQ3FsaFhvUjcw?=
 =?utf-8?B?ZEhRNlRHMC9ZL1NzVXFMWUwyZGFFY2ZEQnZSMkhHT3A5ODErUEs3UVV6ZHpv?=
 =?utf-8?B?Ums2emlXaDhxSi9xd3lGbStBWEZxd25VbFhTMnZsVmZnUTBYMGh4Ykw3SjJy?=
 =?utf-8?B?WHJWWGxnVDhxZHVuWkJxSnhDYTFnWGR3MHE2R2FsY3NWRUpIUG1ldEpDZmt4?=
 =?utf-8?B?R0pYSzdhNThWb0oxeXhZL2UybjhOOUI2dHlZdktodi95TktrTXhUSDJ4WnF4?=
 =?utf-8?B?VmRLM2VPbTN6TERvTWpRTFdUSWJsTHRUbWJwQnFqZ0VtVXpKNTd1YmZPV0ZJ?=
 =?utf-8?B?b2dFelJMUkZBQjRGWVUwMVhMMWdVYTJMeXE2RlVBUGN0WUxnU1U4cHIxa0Ry?=
 =?utf-8?B?ZVVBSDVWZXFOd1Y4RjBrTUhUNG42c0t0Q0tPV2VOMlZsNHVxcWc1djNNYTVN?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 201f86ce-5903-4280-b586-08dccd6e7176
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 05:49:01.6387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1iff4WSvzACA88ZlOMl1kJXSQD8BKRmhr+xL3K49V1beAkZG1MvcuMS0THo4fFTnfHZ9NG3lR6E4DxIuGIwDb0HPWU70L+5XLl+q8irMjGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5004
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


On 9/5/2024 10:58 AM, Riana Tauro wrote:
> modify powergate enable condition based on the type of GT or presence of
Minor cosmetic change: We usually tend to begin the commit description 
with a capital letter.
> media engines. Also have a copy of the value written to powergate enable
> register.
>
> v2: add condition to enable render or media powergating (Badal)
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Other than the above mentioned cosmetic change, LGTM, and with that,
Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_idle.c       | 26 ++++++++++++++++++--------
>   drivers/gpu/drm/xe/xe_gt_idle_types.h |  2 ++
>   2 files changed, 20 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 67aba4140510..3924f9f3d0a5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -98,7 +98,8 @@ static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
>   void xe_gt_idle_enable_pg(struct xe_gt *gt)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> -	u32 pg_enable;
> +	struct xe_gt_idle *gtidle = &gt->gtidle;
> +	u32 vcs_mask, vecs_mask;
>   	int i, j;
>   
>   	if (IS_SRIOV_VF(xe))
> @@ -110,12 +111,19 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>   
>   	xe_device_assert_mem_access(gt_to_xe(gt));
>   
> -	pg_enable = RENDER_POWERGATE_ENABLE | MEDIA_POWERGATE_ENABLE;
> +	vcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
> +	vecs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
> +
> +	if (vcs_mask || vecs_mask)
> +		gtidle->powergate_enable = MEDIA_POWERGATE_ENABLE;
> +
> +	if (!xe_gt_is_media_type(gt))
> +		gtidle->powergate_enable |= RENDER_POWERGATE_ENABLE;
>   
>   	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
>   		if ((gt->info.engine_mask & BIT(i)))
> -			pg_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
> -				      VDN_MFXVDENC_POWERGATE_ENABLE(j));
> +			gtidle->powergate_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
> +						     VDN_MFXVDENC_POWERGATE_ENABLE(j));
>   	}
>   
>   	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> @@ -128,20 +136,22 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>   		xe_mmio_write32(gt, RENDER_POWERGATE_IDLE_HYSTERESIS, 25);
>   	}
>   
> -	xe_mmio_write32(gt, POWERGATE_ENABLE, pg_enable);
> +	xe_mmio_write32(gt, POWERGATE_ENABLE, gtidle->powergate_enable);
>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>   }
>   
>   void xe_gt_idle_disable_pg(struct xe_gt *gt)
>   {
> +	struct xe_gt_idle *gtidle = &gt->gtidle;
> +
>   	if (IS_SRIOV_VF(gt_to_xe(gt)))
>   		return;
>   
>   	xe_device_assert_mem_access(gt_to_xe(gt));
> -	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> -
> -	xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
> +	gtidle->powergate_enable = 0;
>   
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> +	xe_mmio_write32(gt, POWERGATE_ENABLE, gtidle->powergate_enable);
>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_types.h b/drivers/gpu/drm/xe/xe_gt_idle_types.h
> index f99b447534f3..7a8e63f2ebcc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle_types.h
> @@ -23,6 +23,8 @@ enum xe_gt_idle_state {
>   struct xe_gt_idle {
>   	/** @name: name */
>   	char name[16];
> +	/** powergate_enable: copy of powergate enable bits*/
> +	u32 powergate_enable;
>   	/** @residency_multiplier: residency multiplier in ns */
>   	u32 residency_multiplier;
>   	/** @cur_residency: raw driver copy of idle residency */

-- 
-shekhar

