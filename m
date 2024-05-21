Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0F5C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 20:29:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B54F10E0D7;
	Tue, 21 May 2024 20:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YmZ6NHmI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D9210E0D7
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 20:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716323356; x=1747859356;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y3SttOHQ7QT4XwFPFEP71sWVQhitTejJF+8Uk9LBXIE=;
 b=YmZ6NHmIF/t2oR54iBfIOxo9f5fewenkhg1+YZUPgV4NtBplOlgbSJ7v
 aFuufNv/Olg2JB3/WFOkftqjRQWPgoioGHWc4WdhckY4+9BhlOJqKJ39h
 KmgQSD/nxlddteL6NktYcPudMB/oARhcMwpHQUOwhSx3QujgJoYqM883p
 tHtZSPgosXRc985UooaMARDx8c3dFF2wIvdxDBL+/ySrtIvHGw6E8vOwi
 0R/+HnX+PfJ4vV1sPg8+LoWAU46MZhPc5rswq0kNEr0/AeC9CrJfnE5k+
 hUHvLycRVVDo3JfRd8Hmsm1hBGrkRNlPog7b8MOE+E+kBP0m24HlD+DHk Q==;
X-CSE-ConnectionGUID: ABZgMcJMQ/aT/J3XJQRcOA==
X-CSE-MsgGUID: p7w6Ew6KS0a2OLlTpAdW/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="16372802"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="16372802"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 13:29:16 -0700
X-CSE-ConnectionGUID: qPxGHq0xRNe9HYlko1fbkg==
X-CSE-MsgGUID: 4Qj6DFY7TPiLR/GtjAatKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="33647791"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 13:29:16 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 13:29:15 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 13:29:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 13:29:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 13:29:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I1Y/K0Apwnw+IpKgwr1ZYn4/3aHuemc9PycfSwjVLJzFjHQRI/33bz+JSntBbewYDNl3gjQYVbGZkFRWQYhGCVX4c0Nb0P4diSb654sTiy0ctcW26aIuOpF98ych1Keq2CONqECCZlCtVYifw8+wR/OKpx3wS/Tdc7klL50h+p2lgxI5ZWmla3aPUO5cahL4xq6LuZaIwprKlZUIhk5UV/ser26WVJiN3dGsIXYzs5NEr2TVgB2M+zU+VfgIzdQzxnva0K9k5pruomMov48Oxir5NC5NumGI6vLa/liTeZ7+IYkovFs2fq58Kz7rRi02FPSolDuoW2sJbc+weNIbgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULv5pdsWxmHxWG41ed21g/foLla5ghj5azHV6UezzNA=;
 b=anVPeKWvsnsB6uVahD9j+v7C0wzDnjvG4UI5NjVYMm6rfHzHE+k41DNGlniN7VFDxm380Ofuk20+lHK7rP5GAI9loU+G6hqutTRDfL4PsgYLWTOcsZkUvwDA62wWHOd/0bcYsZjPvhqbH7N3RmTLFDrWqkmlzJQJwzLyVygYiJ9ZNnu4A18z2nW/gJ7zrffiV/tFxooSn8zk0WHu2Cbe14YgR0bU5GUPpm0illmTjDd7worF2yhJwhPCDkq2/63GmyLpZWZ8z/Qw6SbWDqWKB+jkd9Du1iBjVgtRkUoaY7hzbaqPKvNB+OJsHBVaf6DlZzzTdVsHFu5r913x8aF9Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH7PR11MB6906.namprd11.prod.outlook.com (2603:10b6:510:202::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 20:29:10 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.7587.030; Tue, 21 May 2024
 20:29:10 +0000
Message-ID: <e49cf066-5ede-4699-bc80-8f3594d2191f@intel.com>
Date: Tue, 21 May 2024 13:29:02 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Enable Coarse Power Gating
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>
References: <20240521092201.4183305-1-riana.tauro@intel.com>
 <20240521092201.4183305-3-riana.tauro@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20240521092201.4183305-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0025.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::38) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH7PR11MB6906:EE_
X-MS-Office365-Filtering-Correlation-Id: b926be4f-6221-4d89-fceb-08dc79d4ac14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTgyWmRaekdlM29OQ1NKcnp0U2M1UzRnTTBWZE9PVXZYTVZCMW1naEhDR1Rm?=
 =?utf-8?B?WVc3UmxHaUQ3d2lHeVgrZXU2QlQza0ZucWhXOXZZUXo4blZrcDgxamFrcWti?=
 =?utf-8?B?ZDk4OExFTHJwWmtrRGZid2N6VWthTnF6TDAzWnBDNXQzNkxQeU5nbmc1Nng3?=
 =?utf-8?B?NGJtY0pIUm9CSTJieW1qQXNyd2s3aXZlclVTaVpES2ZCRzY1cXhlYjJPczR0?=
 =?utf-8?B?YVJybGJHOUovMS9WTjhYdE9YYTFBa05XRnZZaWpmVnRXRTFhQkZNNWoyQ0s2?=
 =?utf-8?B?SHJRakxWVFFSU2VsNjFRVUtBRzhPYWhnalc0cFVydDdZQzhkRlFoalRVVEVS?=
 =?utf-8?B?L20vOVk4MDZiOVBHb0NnN2dsRmJxZ3BqVjV3L3J0dUxqQUd0SlMrYUhCdjVN?=
 =?utf-8?B?TjdpRGp0YUdJZnhFWUFCSU5QdUtQU084Nk8vc3ZraStySFVLTVFlYm83dXhJ?=
 =?utf-8?B?NUVUMzZJSHZIRmNwOCtWd0NYMWVNVWRpMXNySWF0b3NVSC9Nd1gydnBOQXR0?=
 =?utf-8?B?enVuVHh0NUlaUVQreFNLYVRPak1qMW5NdkxRZFIrZFZkOXhZUURrZDQrd2NE?=
 =?utf-8?B?MEFMQUtaMVY3YlVMcG9GRnp5ZEdoUEc2VW5MZ1ZseUtFMUFyT0NtRyszR3BV?=
 =?utf-8?B?VjdJVFdDbVJxVjVhWkg1NEhhNmFOSmxXL2k0R2hGOU5FNVp6TzFTdk9QSHBB?=
 =?utf-8?B?c1MrL1lQOGZhcVNtSGdsMUNiTzBHeERVQ0x6Q3ZZQlBGREFKWEU4bFM5V055?=
 =?utf-8?B?TTNjSXQ5TE1iVEZtamJzeThHd29sd0pMSFpKVmdqZkRHeURSaWwvN1IrdHN5?=
 =?utf-8?B?N0JwZk9IaXcxazRZeTVoSStCbmpKc1lsblF4VVJmWVdFUTZmN3VFalhocHBQ?=
 =?utf-8?B?UzgzbTVNUUYyNFYzekUvbW9rQWNpR3dHTjU3dlU5bXN3MS9pTElycW5scVhr?=
 =?utf-8?B?RnZsY29hR3R1ODdpY1JNM3orSUxJWUhtWXlvTnIyQWc5S0dFSHRTazdvb2dZ?=
 =?utf-8?B?SGZiOHhBZDc1TWp2VWUranp4RURCVktzUEVSODFxMVBWVE1oUmJqc3QvbjFq?=
 =?utf-8?B?SWhDeURmakhzY2JoeFdNbitvUzJiVThyNW1tMVY5UGI2QjllaWh6RG9qdGNh?=
 =?utf-8?B?aXliQm5VMGl6Ymp5UEV4SzcvZ3N6dXR5RVB5WkxtYmFCN3VWSTNuamJLeXhi?=
 =?utf-8?B?VlBKcU4wcE1iUDdRKzhER3lnZGxiMEhlVXgwVzZ1OEdUemNBa0JiUkVQRHR0?=
 =?utf-8?B?Rkx4ZW1QaFhVdTNWTFJqc1JTbC9FaTRPSlIyMEYreFZIL3hraVZNRFZKNXNy?=
 =?utf-8?B?amVEZVVDN1F0YTY5RzF6Zmo5KytSTm9lNXIrYWU1SHJCakhDV3cxNkV5eUVt?=
 =?utf-8?B?UHdLV2E2dVJkRWFTbGVRSEFsakgxMUEwOVRPK2xoaWdqNEM1UDFHeDZpVzUz?=
 =?utf-8?B?MG5NRG83bHFRM3JSRnhwZ0F2Mys2RHhnS2huRnpUS2Zqd2YwVVNHVlJqRzNS?=
 =?utf-8?B?ejVua0EvOGpRNUhUMTIydHJHNDhoK0dYWXJkcWVaRlEvbTYrZ2lrYmp4Z0FG?=
 =?utf-8?B?MmpIdHdUaXgreEZINkQyL3E4LysvckJDYVlUSE9nRjQycG9zRmsrQ2NLbCtw?=
 =?utf-8?B?RWpEM2FZbjFJelA4WngxSGYxeGtkbkZQaEo2K1JDbG5rc2gxR2ZhMlBPNFk2?=
 =?utf-8?B?SndRbGx3VXJmVnUrSkxTdlI1ZW4vYUxvejBPbkcrUlhTT01HNmtVTVhBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjVQeklIcjNsa0pSNG5tb2RHZ1BZOHpINWNhdHZyWllRUEVHOTkwSkwzTFpN?=
 =?utf-8?B?c3JNZ0g3c2ZWM3k5MXVYWnEvUzdUR3g1Z09WY2VyTllSNlNjYmhHRnk2RHFt?=
 =?utf-8?B?NTVuOUVQQzZkU1BibVdXUTFBdlhZUmtqWnVWYVFKTW9WRjhlNTdhQ0Zzc3VZ?=
 =?utf-8?B?blRjd1BFcnhiekIxcUc5bjhWODNHTlNaTjVlNDRFZFpFRTVHMGZlOVE2UldT?=
 =?utf-8?B?WDNtSThqNE9mZU9nSFhsT0RiQlR1NkdySkNzenk5SndlY2pGVmxxTjNIWnIw?=
 =?utf-8?B?eStYYXVJajhOUHpzejY2a29QMlppWjNqZGI5RHN5Wm5PUjBzR3ptejJmeXVo?=
 =?utf-8?B?ZCtReC85YWx3b1oxcjVaRzJPU2plVUJCRjhnRC92MDE2bW9HaWViL0o5S0J2?=
 =?utf-8?B?a0prZDY5NkVLeER2N3kyaFQ3QWhDTmdyZVl0MFRIcm9WaWNQUlF0T1JmWjli?=
 =?utf-8?B?WTYrK1pLOFg4b211ZUNzVkFLcjYyNTFsbWgrMHZjYzhUZFhaY3loKzc0RlRp?=
 =?utf-8?B?WXBld2tteUJTM3gzVGdXdFRpVjkzMldCemNjcEZXSkhSL1RhV1ZxRldES1hC?=
 =?utf-8?B?eVI2RS90eHBXaDlSVW1nVXNSelRZelZMTlRUQVFrU3NqbTVTWTk3eDlTTmdz?=
 =?utf-8?B?YndwS05zdjg1dWl1dEZPQTNpRmpNbVQzWm82NUZvbUJtM0RtWGlmWS8xOFhV?=
 =?utf-8?B?NDdheWZwbFcxUldDYVBqZllxc3p5Q1R6NjlUUjJqRGI4TSs1VERNM1ArS1h4?=
 =?utf-8?B?WXNOeldxMlEyVlNhL2RqdnpxcXEyTHRIdTEzbGNsamtsUjdoQmt5UVZKOGZE?=
 =?utf-8?B?YkFCWHhrQXNxYWFRM0hqU2xkNjBUWjNqRWZvTW1Qc0s4TThZWk15elJtaTdP?=
 =?utf-8?B?dG5vSjZXTi9IUDgrNWhaYXhDL3ZxMkZHKzZBUjNzbExuWWZQTmg4T0k4SGxN?=
 =?utf-8?B?a2JoU0hxa0krTCtkR1BkSkEwZ2JHOTMxWjhvZVlwMUlFUCtHeUo3cFlOWUFs?=
 =?utf-8?B?aTFaU1lFNWtnV2ZuTzV6MTVTT2VRWWFMTFV6ejhxLzB2TVNZU2V2b1d4SVFh?=
 =?utf-8?B?bE5tQW5KSW1IenhnQ1lZaDdqTHQ4WTZqUTBMWEtOODhkODRZQ3Nnb20yVjBW?=
 =?utf-8?B?Zm52clA3bFYvZ0xGRVU5NWthWUJjVkV1Z3o0MnY3UkpUNDJDQlQ1K2dMbXZX?=
 =?utf-8?B?WjFqeStUM0dFZzNkTEwrZ2N2ZU85WEd6UXdwVENoVlk0M1lKdFlHNndHQk1L?=
 =?utf-8?B?UG1HaEpBRERhOVhVUzl1WFFaK3JSSENkS0dYdmR3SkFxNjRhZjNkTGpwclVI?=
 =?utf-8?B?RFpDNjR6azFZbXJmM29hWUxtUit3d21kTGQ0ZllXb2tXdk85RExDQWFOajMx?=
 =?utf-8?B?bjdhZHB5VnVSRUNDU001UTdvYmpLSUhWVmhJSHAzbHp0SjgxMXhlRWpJalZQ?=
 =?utf-8?B?d1pLWDB1ZnBFMUdCMy83WE5rcHV0NU4veGtxNmluRlZHcGdsL2hCcHo0UEgw?=
 =?utf-8?B?NUd6QmQ1aGU0WFRYdlRCSU9oakVMaWw3TWpFMUwyb1liTndteDh0Mys0QjFD?=
 =?utf-8?B?aWttN08rVS9SbXVpd2ozY0MxYW5BNDE1UkI4Q0t3Q28wcWdzOWhVS0Y4QkRH?=
 =?utf-8?B?REtFUXhRcTNOc05HaWNRMmJjdUYwQVQ2aDRXM21zN3JjMnQ3SlFzOU1HUUZj?=
 =?utf-8?B?YXQ1eDlBak85aFQ5bGo2ZmRBcE9MeDRKYS96Wm5ML1RoZUFWaWsrOEpGWkg2?=
 =?utf-8?B?VUs5dk5vdXl0c2hkN0V6MVRlcEY4WjFjU0ZBRkkxN1hHNlgxVzZLU0c5eSty?=
 =?utf-8?B?bjU4Z0tDRXNEL2pwYmszTFBVWDI1Z085MnN6MHMzQ0tOUTZMNmltSUJaQ2RL?=
 =?utf-8?B?cjNnbU55Q2MvWGtpbmxKMWhsdi90RERlVnc4bmRtWWc0NVJyNXNDMys3WjF2?=
 =?utf-8?B?OW1HWXlYU2oxYkE2ZTJzNmtXMllHYk40UmNsR3dJUzZHWWJERWFNT3hVV2NB?=
 =?utf-8?B?UWE3SnlXZ3ZicWZqeGtBSFRWaXFucXUwSXhHSTJ6clpNbjRTdERya0Jib3pY?=
 =?utf-8?B?a1FpbXVqRnl1c3pzTllOaHhpV3c5Z3M1WTNhTHB4aTZiMG42ZktZSHJZdCtS?=
 =?utf-8?B?RnZjVm8wbXZJU1NNNjd0QWlDZ0dNemZZNG51L2xVVGhnWTBqa2VlOU9SR3c0?=
 =?utf-8?B?RHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b926be4f-6221-4d89-fceb-08dc79d4ac14
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 20:29:10.8252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mHdSNpQVY6K/HmPkpJPZWam+nMpJaLfZMX9/M+Asulk4wUxKo3Vbew6QtJBlbS1Hf0LwHGbR1LnAYf26k05yVQdb5TKKl5aMdciJR68BEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6906
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


On 5/21/2024 2:22 AM, Riana Tauro wrote:
> Enable power gating for all units and sub-pipes that
> are disabled by default.
>
> v2: change the init function name
>      use symmetric calls for enable/disable pg
>      re-pharase commit message (Rodrigo)
>      modify the sub-pipe power gating condition
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 ++
>   drivers/gpu/drm/xe/xe_gt.c           | 12 +++++---
>   drivers/gpu/drm/xe/xe_gt_idle.c      | 43 +++++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_gt_idle.h      |  4 ++-
>   4 files changed, 52 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 7c173db7d585..1cb0343ab581 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -317,6 +317,8 @@
>   #define FORCEWAKE_GT				XE_REG(0xa188)
>   
>   #define POWERGATE_ENABLE			XE_REG(0xa210)
> +#define   RENDER_POWERGATE_ENABLE		REG_BIT(0)
> +#define   MEDIA_POWERGATE_ENABLE		REG_BIT(1)
>   #define   VDN_HCP_POWERGATE_ENABLE(n)		REG_BIT(3 + 2 * (n))
>   #define   VDN_MFXVDENC_POWERGATE_ENABLE(n)	REG_BIT(4 + 2 * (n))
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index e69a03ddd255..1ed6309270cb 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -362,10 +362,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>   			xe_lmtt_init(&gt_to_tile(gt)->sriov.pf.lmtt);
>   	}
>   
> -	err = xe_gt_idle_sysfs_init(&gt->gtidle);
> -	if (err)
> -		goto err_force_wake;
> -
>   	/* Enable per hw engine IRQs */
>   	xe_irq_enable_hwe(gt);
>   
> @@ -550,6 +546,10 @@ int xe_gt_init(struct xe_gt *gt)
>   	if (err)
>   		return err;
>   
> +	err = xe_gt_idle_init(&gt->gtidle);
> +	if (err)
> +		return err;
> +
>   	err = xe_gt_freq_init(gt);
>   	if (err)
>   		return err;
> @@ -733,6 +733,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>   	if (err)
>   		goto err_force_wake;
>   
> +	xe_gt_idle_disable_pg(gt);
> +
>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>   	xe_gt_dbg(gt, "suspended\n");
>   
> @@ -759,6 +761,8 @@ int xe_gt_resume(struct xe_gt *gt)
>   	if (err)
>   		goto err_force_wake;
>   
> +	xe_gt_idle_enable_pg(gt);
> +
>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>   	xe_gt_dbg(gt, "resumed\n");
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 4384f7e80258..a056e00b4ab9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -12,6 +12,7 @@
>   #include "xe_gt_sysfs.h"
>   #include "xe_guc_pc.h"
>   #include "regs/xe_gt_regs.h"
> +#include "xe_macros.h"
>   #include "xe_mmio.h"
>   #include "xe_pm.h"
>   
> @@ -93,6 +94,36 @@ static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
>   	return cur_residency;
>   }
>   
> +void xe_gt_idle_enable_pg(struct xe_gt *gt)
> +{
> +	int i, j;
> +	u32 pg_enable;
> +
> +	xe_device_assert_mem_access(gt_to_xe(gt));
> +
> +	pg_enable = RENDER_POWERGATE_ENABLE | MEDIA_POWERGATE_ENABLE;
> +
> +	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
> +		if ((gt->info.engine_mask & BIT(i)))
> +			pg_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
> +				      VDN_MFXVDENC_POWERGATE_ENABLE(j));
> +	}
> +
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> +	xe_mmio_write32(gt, POWERGATE_ENABLE, pg_enable);
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));

One other thing we typically setup here is the media/render hysteresis 
(0xa0c4, 0xa0c8). When SLPC is enabled, GuC will set this up. However, 
if skip_guc_pc is set, we will need to set these.

Also, we need to ensure CPG is not enabled for PVC as we do not setup c6 
either -
         if (xe->info.platform == XE_PVC) {
                 xe_guc_pc_gucrc_disable(pc);
                 ret = 0;
                 goto out;
         }

It will also be good to have a patch that adds a sysfs that can display 
CPG enable and status bits. This can be a separate series.

Thanks,

Vinay.

> +}
> +
> +void xe_gt_idle_disable_pg(struct xe_gt *gt)
> +{
> +	xe_device_assert_mem_access(gt_to_xe(gt));
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> +
> +	xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
> +
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +}
> +
>   static ssize_t name_show(struct device *dev,
>   			 struct device_attribute *attr, char *buff)
>   {
> @@ -145,15 +176,18 @@ static const struct attribute *gt_idle_attrs[] = {
>   	NULL,
>   };
>   
> -static void gt_idle_sysfs_fini(struct drm_device *drm, void *arg)
> +static void gt_idle_fini(struct drm_device *drm, void *arg)
>   {
>   	struct kobject *kobj = arg;
> +	struct xe_gt *gt = kobj_to_gt(kobj->parent);
> +
> +	xe_gt_idle_disable_pg(gt);
>   
>   	sysfs_remove_files(kobj, gt_idle_attrs);
>   	kobject_put(kobj);
>   }
>   
> -int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
> +int xe_gt_idle_init(struct xe_gt_idle *gtidle)
>   {
>   	struct xe_gt *gt = gtidle_to_gt(gtidle);
>   	struct xe_device *xe = gt_to_xe(gt);
> @@ -182,7 +216,9 @@ int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
>   		return err;
>   	}
>   
> -	return drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
> +	xe_gt_idle_enable_pg(gt);
> +
> +	return drmm_add_action_or_reset(&xe->drm, gt_idle_fini, kobj);
>   }
>   
>   void xe_gt_idle_enable_c6(struct xe_gt *gt)
> @@ -202,7 +238,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt)
>   	xe_device_assert_mem_access(gt_to_xe(gt));
>   	xe_force_wake_assert_held(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   
> -	xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
>   	xe_mmio_write32(gt, RC_CONTROL, 0);
>   	xe_mmio_write32(gt, RC_STATE, 0);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
> index 75bd99659b1b..554447b5d46d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> @@ -10,8 +10,10 @@
>   
>   struct xe_gt;
>   
> -int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle);
> +int xe_gt_idle_init(struct xe_gt_idle *gtidle);
>   void xe_gt_idle_enable_c6(struct xe_gt *gt);
>   void xe_gt_idle_disable_c6(struct xe_gt *gt);
> +void xe_gt_idle_enable_pg(struct xe_gt *gt);
> +void xe_gt_idle_disable_pg(struct xe_gt *gt);
>   
>   #endif /* _XE_GT_IDLE_H_ */
