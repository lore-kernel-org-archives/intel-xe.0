Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662D3CED24D
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 00:34:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356DB10E0EB;
	Tue,  8 Oct 2024 00:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eMLe4jkH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9EE10E0EB
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 00:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728347667; x=1759883667;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=yON4DrCK5Eecq0XtVCBylViV/AkhyJlwtPIjoh9jH5c=;
 b=eMLe4jkHAIr8uZCniQ8u5dxm1vGDzrWFyrRHqFHc3VNeWQrDkbznK9At
 aRGxaD+sdqfK204l7Y+DyUJgASBZXsazBbdqhtrVYN2wXm+2HJInkjwH6
 K2Uc1cGLZ5MD41GX3Vostj/4yZWhtZr0BA7D8Nb2FgU1DmqjLfohGqpvd
 BddFFe+wbzQVkZrBoKnoz/UmACZmObBErPdqJgABO3TOUX17JOJll2Ttl
 TVAf4PDYFKOm5qCaOTRAC0X+8Uta9thpuYGZi8lb54ld2WhFpURcVSRA6
 9JvwheeaF1VVQjut9A1jsAQv/HG/vU5ltuRk6laKRyblbeoyaoxclAVAS w==;
X-CSE-ConnectionGUID: pFbeSYpzRCCUbROnSrpphg==
X-CSE-MsgGUID: BQGRg2nZQZ6KkEM4BNBrUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27604209"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="27604209"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 17:34:26 -0700
X-CSE-ConnectionGUID: 46M+i3rAQ7a8G76cJLd8dw==
X-CSE-MsgGUID: UPfuExtvSW+UCnxZdc1pGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="79631994"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 17:34:26 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 17:34:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 17:34:25 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 17:34:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOWC903b3zCtC3X9OcJ2IsOtTo45YhvvHpXfhYrw5jLruO/g3DpPYuh/sFC8OOI4IdJhMGn/uDLvfBMe1o7QoIX/HHKn2tPJvnAHxUKmSVFhsv9jOyCXmIRBKHrxVTC3hccfp3Ar1ergoWfpv4w3HMcKweCpdN/h8FLq0FK++NIPPpry14wAcZ4DOLipb0jcrWtSc6Lwc6qCT9PlGgYxpQMZNfsLjmAQN0fB65njY7BYn0l+HOSefX7q9gFRffF+Q6HpLD2FwKnxI5Ix/ch9UhkijniSr4Mefm1QtR6wzBHsQ5Ha4VbcIH+NCkczm+k/k4svUecnNEMHAnCG9TwjhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i37oRCtim0Plg/SoR4TXFKJP5SrwkXp3oE+b1AgTqaI=;
 b=wuJsjXXMR7pYU2cVt1j6eWr4WuNgOg8f7+TC7X40Lo49W37PZn78dNrQx9xbNPnTlxZwLc8Wr/3dql4913/981VR1ONVHqYoXIlp55cPSTogftq2fhEzTjd0h6jwNd/zH9VvsKFYLjz0LKbpvrQ+JFxiqcvir4cznYGAlbU15BshpFdgTUxvoZNTeFRRnBJ+VnUx0F27YOZUsMp7JTE4MoJVZ+rFkhUwSTDtc2sJc9bwwIe13khM8Ret9kqBs5bKsaracabrJuq8Hyz980OZBkDD+jOvBvNfYP4QdhJCCswL71fgb4gDdu8v2B2zWl7wc3+OX3DuJ0yHm7SzYY+19g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CYXPR11MB8731.namprd11.prod.outlook.com (2603:10b6:930:db::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 00:34:23 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 00:34:23 +0000
Message-ID: <9655d74e-f3f0-4d60-bef3-b9006db61bc3@intel.com>
Date: Mon, 7 Oct 2024 17:34:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] drm/xe/pxp: Handle the PXP termination interrupt
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-6-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240816190024.2176976-6-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:303:2b::10) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CYXPR11MB8731:EE_
X-MS-Office365-Filtering-Correlation-Id: 887feae3-8076-4aa0-2200-08dce730f4a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzJmZ01UYVJiQnhaYTFyK1o4TEQyeTNGNTR3L2dTRGtVT0Vha1NJZ1Bxd3N1?=
 =?utf-8?B?NVVWYTVwUnJYWVBmRVdJUDRxOFNHdnZwZkE1TGxSYXNQNXJJUHlQWWlXN1JK?=
 =?utf-8?B?VFBTUE9PRGh3OVk0bzNCVlJBSFN6emZISGg3OHdMaWNhd09VNmpnbHdNT0Vs?=
 =?utf-8?B?K1RuOStkRGdTK3Nrb2MzL0xQZFlCVU1OLytLbHFGMncrNzUybEIvNk1WaFZM?=
 =?utf-8?B?Z3NPMC9nNEVtWDRCYTZ4emNkY29QbVM4MStJMUtPWHM5eUVlSTdEZmV6b2xW?=
 =?utf-8?B?T3RwQmV5MnFHYUgwdzlNYVBLWm9Ec0c4amtHekF5NXFkMjFENWY5NnhwZUly?=
 =?utf-8?B?NDQ0R09Ybys0M21XQ3dVRXdhV3NzVUhaM0lrRUtHSXRHb3Y3WDIxSjgzNG52?=
 =?utf-8?B?eW1COVByN0tPRjhBVjZjMytsS01tdTIxdktQSHlFS3MrMGNtRFlwRUQrbEtw?=
 =?utf-8?B?OVBmaHNvRGdUcXdYR2V0VjF0NmdlRjNqWXNPb3BwNkxlRWF4dVNNWUcrbC9m?=
 =?utf-8?B?Rm1rOXM5TnQxQ2pBdjVPMzhHVnBVWXV5QkJUVHlHa2NEckU4eHJqcnR2bVln?=
 =?utf-8?B?TVlKR003ZE9QdGpiMTlwb3pQRzR5TW9Hbm5yaEYzallsRVowQ1U0d2F5eDlw?=
 =?utf-8?B?NlJVYmQ3c3FIckN2c1pZaXlSR1FwUnFrdGZxTEJCOVdhaVVhT1dORldMazdo?=
 =?utf-8?B?enJzY0FEV2ovbWZOWFdDaGpZdmxCdnRFaWJ3SlR3ZU40cDBIeHRzNXJHbXZp?=
 =?utf-8?B?N1lnd1ZHY3FRUXlZMi9laW9sUkdVK1Jkb2E1Vlhhcmt2MXhpNjRlbHJkRzRr?=
 =?utf-8?B?Rk5SNE04ZDdqU2hKOTBZVUVJa2x1TFFDNlp3b0o2NUdlUFJWRitNaW1FUytn?=
 =?utf-8?B?ZXBmUXJIN0VNVDZBeTRiYjZkS0IrUk9vRUljVU5GVjBmU1Z3WUYyZHdZTzIx?=
 =?utf-8?B?d3BTMEZLdlN6dExuL3lFMndJMDd4b0FqeHJBV3FKUk8xVXE1SUZZL1JrenpW?=
 =?utf-8?B?d04yaHowNDM2L1BoWlRkVDFFM2JKQ1NwYkZzWE1Od3RsZmZGOEplbnhNc21R?=
 =?utf-8?B?QUk5UXQwMC9CdWNxSFhaeFlsL1l1YnArbVNHM0llSDM4cFlwS0hZRVZ5MDlX?=
 =?utf-8?B?aG9WMTM1b1JhK2ZnQVV2dVFjL2d6YXQ2MzQwMlN3a2VyckE1L2lVb3FoTkox?=
 =?utf-8?B?d3E5Ulpsbm9hb2YvaWh0N0xBT01KZ015NERWelRPZ1FRdUZVVDRwVEZOeE5p?=
 =?utf-8?B?Wkd0VVI3bWxITUthVEZYK1M1R0lJb3BTalFoMWlGUnpOOWhXODN3eitTdVdH?=
 =?utf-8?B?SlFCUjFsM2NKZXF1ZWRwOGNGTUJ2bEs4by9tT1ZBOUdoSmQxdU9pUDFSdmNR?=
 =?utf-8?B?VG9zbDZyNGZlbXlNWEZ5dUMwVnh0TW1icmw1b1IrNkRkTGZWWURXVkRhNVU0?=
 =?utf-8?B?TUFFbEljR01TNElWalQ5Rk15NlFKQ2pGaktpOUVIcm1XanI0a0gySldIZ2U1?=
 =?utf-8?B?MTZ2eGdnYnVheHgwYnRTdGJKYzh3Wnlvb24yQitmbjhteWR0YWs2aldMTDdr?=
 =?utf-8?B?dnBsdDE3S3BNYU1tbmo1RERLbUdkNEV3WnZURm9QNHRzMlVBcnFLQlh0QmpM?=
 =?utf-8?B?K2xXbHFOaHdSNUNJR1F2WHpiY3lnR1lUVlh1TEV2VHp5VUFPTy8rdFJTMVVx?=
 =?utf-8?B?UVlNck1JZHBmUGxwZENTZDdpUnhkY2luNkJ0MlJVUEZHYzYzRndURGFRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDk1Z0U5SlBNdzdPTnhhQjZNNFN1VW9KbkErM1FDQ2xaNWVzUlpHZkVYZE9X?=
 =?utf-8?B?aDBhL2lrVTQrbmZ5ZERNaDVCcURnWm5HQnZ1ckNFNXdoVVNUT1RQMlNlRzVU?=
 =?utf-8?B?V3Z5ckFvOHNxbloyQnBBOUdSc2poeFJscVl6Ri9hcUtjZ28zMTlQaFlDY2gz?=
 =?utf-8?B?VTFyODBuZ1R0MDBhR1VVZ2dpM1dSZHQzQUJjUTNoZlBNQkJrdjhrU3k3UGdk?=
 =?utf-8?B?SHdsQjU2ZFNPSUIyUGp3UEYxUGJTQ0pHNFpsazlrd0dkZ0Rqa0UxTi9qa2w2?=
 =?utf-8?B?R2NlZlJlNG1JZ1NweXVkOXZYbmM5c2cxVUVSSzBuUGhmaCtrdWVwRktLZWkr?=
 =?utf-8?B?OFhORHVKeW1TR2piWWRiSjlrTGFZSkoxUEgvaE9jT3B2Z2Y1U1NET3A2WFlj?=
 =?utf-8?B?NktnQ0o1dVF4bVVzVW1JOVU5dFV3K0hjcURac3JPRzhnUXordnRzQVhodjZp?=
 =?utf-8?B?QmlQM3FEbk9iRHI0U2k2eUxIRENrRHM1YnBZQ05nc1E4bFNVSFZHRGVERHV6?=
 =?utf-8?B?eHd3Y29tNU44V2oxS3VmY2pud2tYcDBuTnhDZXpsUjlzdGtaWS9XSUNlUUZR?=
 =?utf-8?B?ak1nMFBvUktBaWY5cjVublpwZVlsOE1XZExtclFEVXZmcDh2RitDV3hrQVZF?=
 =?utf-8?B?bmN5cHZ1ZnZzMjJXUTVIUmhweTRjOFhYb2ZkSVVNMjVPcHRCS2c1QkNrQy9r?=
 =?utf-8?B?UGZRbTgwd2JucmJaSys4ckZ1clBwaklGL1VwQzg4bDhxU1g2MGlLMnFrdDhz?=
 =?utf-8?B?VmhPbDdDTS84OXZGWHltZGRCZWg2ODBhc1FRaURoUE9LMS9nM05yY1ZHS0Zs?=
 =?utf-8?B?M1FMS3hpQzM0L2xCWXJ5OXMrVmlLVEVwbml5c1hleHU4L1J5TzkxVzFVdDBD?=
 =?utf-8?B?bi8xeHFaNUY1UzRnbVRwUW1OVkRodGs2a29GYWRMbHJOcFpMUnY0SXBuTFE1?=
 =?utf-8?B?T1p2L0hZUW42S1Zka2hPL2xhTUxaSlE1UksxY1FsQXFtV0t1ZXpKdnMyRkND?=
 =?utf-8?B?VFRScmh5a1lnOUpxanQzUjVxUzJHdGJNRk5ndmNpSE1FNUhzaW51Sjhnb3Jz?=
 =?utf-8?B?K05nc0cwKzF5OVY5dGEyVTUxWDR0R2dyeEwvOXRsa2FuSG5KTkNGL1hmb3ZB?=
 =?utf-8?B?aGZJSkZMRnByb2xBZmxWRnhEYkJlcm1zOUNYK01PS1JwakJxd0k0WFpqVWd0?=
 =?utf-8?B?bFlHRUtWRFlaVTJUNHNPV2VMMHRxQVllMHVmT3E4WjFJOS9DSDByUWxXek1Q?=
 =?utf-8?B?Z1VPQzlBQndET3ROMEdjNzczeXRDdDlwOThITEF5RnlvN1BpQVZWSUVPc3Uy?=
 =?utf-8?B?ekNMU3F6R3M2bncwK0V1djNUR2JiZzAwL0ZnYjQ1aDUyTWdOdDc2bG9Hb2du?=
 =?utf-8?B?eUhjU0NKTzQ1aW45QXhIYytWdWNWTzhXQm1XL2pJdmQ1YU9MWUdjcXh0YTF4?=
 =?utf-8?B?SXF2Vm5lZDZFMndIMTE4RkhQK1R5R3hQL1dSR3pmNUwzeGpFc081QndRYnlm?=
 =?utf-8?B?WGdNOE1nUDBtbFpKM2ZzRmFqY0VQZWxkMGtkL1FzaXF5WnJqeVNkeUNOTS9x?=
 =?utf-8?B?NmZmTUZGaG5WY1BtaWxEVGFMSlUxSjBpZTZkaklLZHl4OSs3OGZlVGg4Ti9s?=
 =?utf-8?B?U3pLdkNKamY5YklwYStNTFRrS2pFa3FOT3pIcm5xajJiMzNBRCtEbDZmc3p2?=
 =?utf-8?B?ZUMxTDNVMFNXTEZMclRZRElHOVV1UVBWb3V4dVBTMklPV2hqVEIwTW1laDda?=
 =?utf-8?B?YUtaUnJHRWViWmpvdmFjTTVGUTZTWlQ4UkFNdXdLM2taZzQzUVJRK0hQbmpF?=
 =?utf-8?B?WkRkTjJvQW16WnNzc2tJSlBRU1JBellRSXpDdm5mRTlBNFFVdW9MZjBLSkdS?=
 =?utf-8?B?QnBCSTh5N0t6NzNRRXZwdG43V0U2ejQxa0xEVGpmNlZ2ZnZFL2dKaEpjeWJP?=
 =?utf-8?B?bkhEcUxEUDVUTVNocTUzMmZyRklKc3d4NC85VDloT0V3UUpzdDNCOFZvbTJW?=
 =?utf-8?B?THpKcjRNR3JQZXdJWDMwVlpiR1NTS20zVGVRa0xBZVo2YUhvQlNPRWxUdVU2?=
 =?utf-8?B?TVZFenBJcll3Wm1LL1ZWVWpvL1crMFhIT1hKT2NBczhYQkFRQnhYTFhTQTFX?=
 =?utf-8?B?aTY3ZThjb0tiVnBTSzRnaGhoV0U5V3U5eDd0SzM5Vy9CQ1hSTTJyLzBHVzhR?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 887feae3-8076-4aa0-2200-08dce730f4a5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 00:34:23.0219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vBVIGpHCJNzsUr0laqdgAWnZ1A/4hrHwq3sLgibIKBo0ugwHG8Kfz4RNokXANLh8SdsOTOmDC1k6q4c/jPDMkcTrVPdzRRMba3eYJ272st4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8731
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

On 8/16/2024 12:00, Daniele Ceraolo Spurio wrote:
> When something happen to the session, the HW generates a termination
> interrupt. In reply to this, the driver is required to submit an inline
> session termination via the VCS, trigger the global termination and
> notify the GSC FW that the session is now invalid.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h  |   8 ++
>   drivers/gpu/drm/xe/regs/xe_pxp_regs.h |   6 ++
>   drivers/gpu/drm/xe/xe_irq.c           |  20 +++-
>   drivers/gpu/drm/xe/xe_pxp.c           | 138 +++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_pxp.h           |   3 +
>   drivers/gpu/drm/xe/xe_pxp_types.h     |  13 +++
>   6 files changed, 184 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 0d1a4a9f4e11..9e9c20f1f1f4 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -570,6 +570,7 @@
>   #define   ENGINE1_MASK				REG_GENMASK(31, 16)
>   #define   ENGINE0_MASK				REG_GENMASK(15, 0)
>   #define GPM_WGBOXPERF_INTR_ENABLE		XE_REG(0x19003c, XE_REG_OPTION_VF)
> +#define CRYPTO_RSVD_INTR_ENABLE			XE_REG(0x190040)
>   #define GUNIT_GSC_INTR_ENABLE			XE_REG(0x190044, XE_REG_OPTION_VF)
>   #define CCS_RSVD_INTR_ENABLE			XE_REG(0x190048, XE_REG_OPTION_VF)
>   
> @@ -580,6 +581,7 @@
>   #define   INTR_ENGINE_INTR(x)			REG_FIELD_GET(GENMASK(15, 0), x)
>   #define   OTHER_GUC_INSTANCE			0
>   #define   OTHER_GSC_HECI2_INSTANCE		3
> +#define   OTHER_KCR_INSTANCE			4
>   #define   OTHER_GSC_INSTANCE			6
>   
>   #define IIR_REG_SELECTOR(x)			XE_REG(0x190070 + ((x) * 4), XE_REG_OPTION_VF)
> @@ -591,6 +593,7 @@
>   #define HECI2_RSVD_INTR_MASK			XE_REG(0x1900e4)
>   #define GUC_SG_INTR_MASK			XE_REG(0x1900e8, XE_REG_OPTION_VF)
>   #define GPM_WGBOXPERF_INTR_MASK			XE_REG(0x1900ec, XE_REG_OPTION_VF)
> +#define CRYPTO_RSVD_INTR_MASK			XE_REG(0x1900f0)
>   #define GUNIT_GSC_INTR_MASK			XE_REG(0x1900f4, XE_REG_OPTION_VF)
>   #define CCS0_CCS1_INTR_MASK			XE_REG(0x190100)
>   #define CCS2_CCS3_INTR_MASK			XE_REG(0x190104)
> @@ -605,4 +608,9 @@
>   #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
>   #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
>   
> +/* irqs for OTHER_KCR_INSTANCE */
> +#define   KCR_PXP_STATE_TERMINATED_INTERRUPT		REG_BIT(1)
> +#define   KCR_APP_TERMINATED_PER_FW_REQ_INTERRUPT	REG_BIT(2)
> +#define   KCR_PXP_STATE_RESET_COMPLETE_INTERRUPT	REG_BIT(3)
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/regs/xe_pxp_regs.h b/drivers/gpu/drm/xe/regs/xe_pxp_regs.h
> index d67cf210d23d..aa158938b42e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pxp_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pxp_regs.h
> @@ -14,4 +14,10 @@
>   #define KCR_INIT				XE_REG(0x3860f0)
>   #define   KCR_INIT_ALLOW_DISPLAY_ME_WRITES	REG_BIT(14)
>   
> +/* KCR hwdrm session in play status 0-31 */
> +#define KCR_SIP					XE_REG(0x386260)
> +
> +/* PXP global terminate register for session termination */
> +#define KCR_GLOBAL_TERMINATE			XE_REG(0x3860f8)
> +
>   #endif /* __XE_PXP_REGS_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 5f2c368c35ad..f11d9a740627 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -20,6 +20,7 @@
>   #include "xe_hw_engine.h"
>   #include "xe_memirq.h"
>   #include "xe_mmio.h"
> +#include "xe_pxp.h"
>   #include "xe_sriov.h"
>   
>   /*
> @@ -202,6 +203,15 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>   		}
>   		if (heci_mask)
>   			xe_mmio_write32(gt, HECI2_RSVD_INTR_MASK, ~(heci_mask << 16));
> +
> +		if (xe_pxp_is_supported(xe)) {
> +			u32 kcr_mask = KCR_PXP_STATE_TERMINATED_INTERRUPT |
> +				       KCR_APP_TERMINATED_PER_FW_REQ_INTERRUPT |
> +				       KCR_PXP_STATE_RESET_COMPLETE_INTERRUPT;
> +
> +			xe_mmio_write32(gt, CRYPTO_RSVD_INTR_ENABLE, kcr_mask << 16);
> +			xe_mmio_write32(gt, CRYPTO_RSVD_INTR_MASK, ~(kcr_mask << 16));
> +		}
>   	}
>   }
>   
> @@ -324,9 +334,15 @@ static void gt_irq_handler(struct xe_tile *tile,
>   			}
>   
>   			if (class == XE_ENGINE_CLASS_OTHER) {
> -				/* HECI GSCFI interrupts come from outside of GT */
> +				/*
> +				 * HECI GSCFI interrupts come from outside of GT.
> +				 * KCR irqs come from inside GT but are handled
> +				 * by the global PXP subsystem.
> +				 */
>   				if (HAS_HECI_GSCFI(xe) && instance == OTHER_GSC_INSTANCE)
>   					xe_heci_gsc_irq_handler(xe, intr_vec);
> +				else if (instance == OTHER_KCR_INSTANCE)
> +					xe_pxp_irq_handler(xe, intr_vec);
>   				else
>   					gt_other_irq_handler(engine_gt, instance, intr_vec);
>   			}
> @@ -512,6 +528,8 @@ static void gt_irq_reset(struct xe_tile *tile)
>   		xe_mmio_write32(mmio, GUNIT_GSC_INTR_ENABLE, 0);
>   		xe_mmio_write32(mmio, GUNIT_GSC_INTR_MASK, ~0);
>   		xe_mmio_write32(mmio, HECI2_RSVD_INTR_MASK, ~0);
> +		xe_mmio_write32(mmio, CRYPTO_RSVD_INTR_ENABLE, 0);
> +		xe_mmio_write32(mmio, CRYPTO_RSVD_INTR_MASK, ~0);
>   	}
>   
>   	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_ENABLE, 0);
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> index 56bb7d927c07..382eb0cb0018 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.c
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -12,9 +12,11 @@
>   #include "xe_gt.h"
>   #include "xe_gt_types.h"
>   #include "xe_mmio.h"
> +#include "xe_pm.h"
>   #include "xe_pxp_submit.h"
>   #include "xe_pxp_types.h"
>   #include "xe_uc_fw.h"
> +#include "regs/xe_gt_regs.h"
>   #include "regs/xe_pxp_regs.h"
>   
>   /**
> @@ -25,11 +27,133 @@
>    * integrated parts.
>    */
>   
> -static bool pxp_is_supported(const struct xe_device *xe)
> +#define ARB_SESSION 0xF /* TODO: move to UAPI */
> +
> +bool xe_pxp_is_supported(const struct xe_device *xe)
>   {
>   	return xe->info.has_pxp && IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY);
>   }
>   
> +static bool pxp_is_enabled(const struct xe_pxp *pxp)
> +{
> +	return pxp;
> +}
> +
> +static int pxp_wait_for_session_state(struct xe_pxp *pxp, u32 id, bool in_play)
> +{
> +	struct xe_gt *gt = pxp->gt;
> +	u32 mask = BIT(id);
> +	int ret;
> +
> +	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_mmio_wait32(gt, KCR_SIP, mask, in_play ? mask : 0,
> +			     250, NULL, false);
> +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +
> +	return ret;
> +}
> +
> +static void pxp_terminate(struct xe_pxp *pxp)
> +{
> +	int ret = 0;
> +	struct xe_device *xe = pxp->xe;
> +	struct xe_gt *gt = pxp->gt;
> +
> +	drm_dbg(&xe->drm, "Terminating PXP\n");
> +
> +	/* terminate the hw session */
> +	ret = xe_pxp_submit_session_termination(pxp, ARB_SESSION);
> +	if (ret)
> +		goto out;
> +
> +	ret = pxp_wait_for_session_state(pxp, ARB_SESSION, false);
> +	if (ret)
> +		goto out;
> +
> +	/* Trigger full HW cleanup */
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
Why WARN here but no explicit message at all if the earlier force wake 
fails? And is it safe to keep going if the fw did fail?

Also, given two identical, back-to-back fw get/put sets, would it not be 
more efficient to have pxp_terminate do the get and share that across 
the two register access? It would also remove the issue with failed fw 
half way through causing problems due to not wanting to abort.

> +	xe_mmio_write32(gt, KCR_GLOBAL_TERMINATE, 1);
BSpec description for KCR_GLOBAL_TERMINATE says need to check 
KCR_SIP_GCD rather than KCR_SIP_MEDIA for bits 0-15 being 0. Whereas the 
KCR_SIP being checked above is KCR_SIP_MEDIA only.

> +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +
> +	/* now we can tell the GSC to clean up its own state */
> +	ret = xe_pxp_submit_session_invalidation(&pxp->gsc_res, ARB_SESSION);
> +
> +out:
> +	if (ret)
> +		drm_err(&xe->drm, "PXP termination failed: %pe\n", ERR_PTR(ret));
> +}
> +
> +static void pxp_terminate_complete(struct xe_pxp *pxp)
> +{
> +	/* TODO mark the session as ready to start */
> +}
> +
> +static void pxp_irq_work(struct work_struct *work)
> +{
> +	struct xe_pxp *pxp = container_of(work, typeof(*pxp), irq.work);
> +	struct xe_device *xe = pxp->xe;
> +	u32 events = 0;
> +
> +	spin_lock_irq(&xe->irq.lock);
> +	events = pxp->irq.events;
> +	pxp->irq.events = 0;
> +	spin_unlock_irq(&xe->irq.lock);
> +
> +	if (!events)
> +		return;
> +
> +	/*
> +	 * If we're processing a termination irq while suspending then don't
> +	 * bother, we're going to re-init everything on resume anyway.
> +	 */
> +	if ((events & PXP_TERMINATION_REQUEST) && !xe_pm_runtime_get_if_active(xe))
> +		return;
I assume it is not possible to have both REQUEST and COMPLETE set at the 
same time? I.e. is it possible for this early exit to cause a lost 
termination complete call?

John.

> +
> +	if (events & PXP_TERMINATION_REQUEST) {
> +		events &= ~PXP_TERMINATION_COMPLETE;
> +		pxp_terminate(pxp);
> +	}
> +
> +	if (events & PXP_TERMINATION_COMPLETE)
> +		pxp_terminate_complete(pxp);
> +
> +	if (events & PXP_TERMINATION_REQUEST)
> +		xe_pm_runtime_put(xe);
> +}
> +
> +/**
> + * xe_pxp_irq_handler - Handles PXP interrupts.
> + * @pxp: pointer to pxp struct
> + * @iir: interrupt vector
> + */
> +void xe_pxp_irq_handler(struct xe_device *xe, u16 iir)
> +{
> +	struct xe_pxp *pxp = xe->pxp;
> +
> +	if (!pxp_is_enabled(pxp)) {
> +		drm_err(&xe->drm, "PXP irq 0x%x received with PXP disabled!\n", iir);
> +		return;
> +	}
> +
> +	lockdep_assert_held(&xe->irq.lock);
> +
> +	if (unlikely(!iir))
> +		return;
> +
> +	if (iir & (KCR_PXP_STATE_TERMINATED_INTERRUPT |
> +		   KCR_APP_TERMINATED_PER_FW_REQ_INTERRUPT))
> +		pxp->irq.events |= PXP_TERMINATION_REQUEST;
> +
> +	if (iir & KCR_PXP_STATE_RESET_COMPLETE_INTERRUPT)
> +		pxp->irq.events |= PXP_TERMINATION_COMPLETE;
> +
> +	if (pxp->irq.events)
> +		queue_work(pxp->irq.wq, &pxp->irq.work);
> +}
> +
>   static int kcr_pxp_set_status(const struct xe_pxp *pxp, bool enable)
>   {
>   	u32 val = enable ? _MASKED_BIT_ENABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES) :
> @@ -60,6 +184,7 @@ static void pxp_fini(void *arg)
>   {
>   	struct xe_pxp *pxp = arg;
>   
> +	destroy_workqueue(pxp->irq.wq);
>   	xe_pxp_destroy_execution_resources(pxp);
>   
>   	/* no need to explicitly disable KCR since we're going to do an FLR */
> @@ -83,7 +208,7 @@ int xe_pxp_init(struct xe_device *xe)
>   	struct xe_pxp *pxp;
>   	int err;
>   
> -	if (!pxp_is_supported(xe))
> +	if (!xe_pxp_is_supported(xe))
>   		return -EOPNOTSUPP;
>   
>   	/* we only support PXP on single tile devices with a media GT */
> @@ -105,12 +230,17 @@ int xe_pxp_init(struct xe_device *xe)
>   	if (!pxp)
>   		return -ENOMEM;
>   
> +	INIT_WORK(&pxp->irq.work, pxp_irq_work);
>   	pxp->xe = xe;
>   	pxp->gt = gt;
>   
> +	pxp->irq.wq = alloc_ordered_workqueue("pxp-wq", 0);
> +	if (!pxp->irq.wq)
> +		return -ENOMEM;
> +
>   	err = kcr_pxp_enable(pxp);
>   	if (err)
> -		return err;
> +		goto out_wq;
>   
>   	err = xe_pxp_allocate_execution_resources(pxp);
>   	if (err)
> @@ -122,5 +252,7 @@ int xe_pxp_init(struct xe_device *xe)
>   
>   kcr_disable:
>   	kcr_pxp_disable(pxp);
> +out_wq:
> +	destroy_workqueue(pxp->irq.wq);
>   	return err;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
> index 79c951667f13..81bafe2714ff 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.h
> +++ b/drivers/gpu/drm/xe/xe_pxp.h
> @@ -10,6 +10,9 @@
>   
>   struct xe_device;
>   
> +bool xe_pxp_is_supported(const struct xe_device *xe);
> +
>   int xe_pxp_init(struct xe_device *xe);
> +void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
>   
>   #endif /* __XE_PXP_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
> index 3463caaad101..d5cf8faed7be 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_types.h
> +++ b/drivers/gpu/drm/xe/xe_pxp_types.h
> @@ -8,6 +8,7 @@
>   
>   #include <linux/iosys-map.h>
>   #include <linux/types.h>
> +#include <linux/workqueue.h>
>   
>   struct xe_bo;
>   struct xe_exec_queue;
> @@ -69,6 +70,18 @@ struct xe_pxp {
>   
>   	/** @gsc_exec: kernel-owned objects for PXP submissions to the GSCCS */
>   	struct xe_pxp_gsc_client_resources gsc_res;
> +
> +	/** @irq: wrapper for the worker and queue used for PXP irq support */
> +	struct {
> +		/** @irq.work: worker that manages irq events. */
> +		struct work_struct work;
> +		/** @irq.wq: workqueue on which to queue the irq work. */
> +		struct workqueue_struct *wq;
> +		/** @irq.events: pending events, protected with xe->irq.lock. */
> +		u32 events;
> +#define PXP_TERMINATION_REQUEST  BIT(0)
> +#define PXP_TERMINATION_COMPLETE BIT(1)
> +	} irq;
>   };
>   
>   #endif /* __XE_PXP_TYPES_H__ */

