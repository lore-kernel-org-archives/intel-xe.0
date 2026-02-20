Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD2DC55822
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 10:49:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786E210E221;
	Fri, 20 Feb 2026 10:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H9EyzhUu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0578010E0EE
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 10:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771584552; x=1803120552;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nAO/S0F1E3atv5uMdyHTrwyzdi4JxZrcPaC6hGNwghI=;
 b=H9EyzhUunWTBU50BhOh0Nnq7w8CgLFayOTdX5OzT64LARNnpgwmfAaEx
 WtchI8KDckoZoBCJTNf3jl4WCvCaCyTM6PjWL6ElStx6YqV3fg1MuYYJF
 WLm+JCH6grvu50mjQDdTlkBlgaCBI7I0WvTaClm2pqPRh1qWWMbm41zZ0
 tdHlESaBWunAFdQYhYDQ8diO8akpydmalj8eMzibxQ4IxAwgieVSCjbK2
 9XigSTxxUf+Sm4/upWIizxnPviO/yRaDOcV+4gJwM9NkB+AyD6e/LV5I2
 ffkI8kmZUOfyBnKctDQzhSn8o1kjr7ADIJJgXe+Fiw/x/PYfsGqF2IOex A==;
X-CSE-ConnectionGUID: zpHv2oE0S/yaD4sMmxzgnw==
X-CSE-MsgGUID: WoZpcW+ZQvqbBlh1dfFNbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72851655"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="72851655"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 02:49:11 -0800
X-CSE-ConnectionGUID: PTX2P+lhQoC/sBz1Yf1JwQ==
X-CSE-MsgGUID: w5KhoW7dQbuIZzdreE4esw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="214935309"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 02:49:10 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 02:49:10 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 02:49:10 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 02:49:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxESWrNh0u1wBIaE5vcAHOyLOPlJDiepkSZ6qH0X6A+71cbus7xiX/it/+wtQqCEKVzyee5ZTZmHAVZEZkZOQs8EgXpZz92wvkmScLxo7pTIOheZSvRCj5Guar3divRjI3TKo0JubdBTofa9HiKADMW7uJWHkloj30xfsK4MBn9lpYh+zaqCm1jR36qSRhG3NnDVRVz//+LyF42wilEg7QRXq3MqDc/bCl8ebLd4LJStRAswymDjq0Tvo1v6DbZuRyVMco3pdISNCSzuaypciBThG7rJi4Iuw2p+w2+1Aq+TJl/vu2aK6OgN1rrgUBZqgOVQGHqVNN5qXTXxOiSUBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w79x19J6+7lfH2rD+pDhmNJu9frK1QHt0CPGyXOHw90=;
 b=wlWq3kI2MxTK81sV0Z0qaHsAfCEYQyTOJrqfw3+IFaD+9L6MTtjQSig5sRy/5KQqw7BtMBAHqFku+f1MnA7dKI2PNISZilqpskKbA8Hmul2kvifv3QG3eSSRNAKR9e4/KepJD6x7ieu0T2Z5ICobuce5IFBjQtcwyENxYjWtVTjtzgE5cH1/dW1uLlyEq3P0CRJPvxv/ZTfPTLMuOqrbVZr7iFeqTRsA7ibZN3jyNa6XbDsW1fxibVV6nHcxmsx6KgG0D5yWkxOsV8sxtuzULU2aplkCF0D2xJn3t8J0P/0qL3E9o3TSM2/X1xhSOzsywwA6JN1tSE584hwbdCpBLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5366.namprd11.prod.outlook.com (2603:10b6:208:31c::17)
 by DM4PR11MB6384.namprd11.prod.outlook.com (2603:10b6:8:8a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Fri, 20 Feb
 2026 10:49:02 +0000
Received: from BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848]) by BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 10:49:02 +0000
Message-ID: <0c063f2b-ab79-40fb-991d-ed7da61c1ddd@intel.com>
Date: Fri, 20 Feb 2026 16:18:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe: Add prefetch fault support for Xe3p
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <priyanka.dandamudi@intel.com>,
 <stuart.summers@intel.com>
References: <20260220043502.1060473-1-varun.gupta@intel.com>
 <20260220043502.1060473-3-varun.gupta@intel.com>
 <aZfrapNUURrx5J7c@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Gupta, Varun" <varun.gupta@intel.com>
In-Reply-To: <aZfrapNUURrx5J7c@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0196.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::16) To BL1PR11MB5366.namprd11.prod.outlook.com
 (2603:10b6:208:31c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5366:EE_|DM4PR11MB6384:EE_
X-MS-Office365-Filtering-Correlation-Id: 43035ad9-2a4a-42dd-b3e1-08de706da8b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzJ0RW5iQzQvcXF0V0U1aGswaWZFZGhEYXdHZE1aZGZEWlFNMllpbUhYWjRw?=
 =?utf-8?B?b0VuK25NRk1JNzJUUHUvZFVDY2p1L2xsNFpuT2k3TXV3L1ZwbU1MRnRYOUhk?=
 =?utf-8?B?WkR1OXhSU3Q3SUpMTmZwMTlYTVRvVE02TDlUMnZZdkpQNmN4eHRWait0WGwx?=
 =?utf-8?B?RGFEdXpIRWtpT0FzcHFnbFBsbXdTeWZDWTAyVjN6SE1WTVlsbFg3VlRQRTV2?=
 =?utf-8?B?V2VXWGZRd29HWGtVQ2tVakVEaDMyMjY0WWNURHJyUSswazJocE9oc2pMWGxo?=
 =?utf-8?B?VEJVczd3VkllL094MWlScmp3VVNLaFRmR2V1bmdVaXJYcXYxVEhiUWZLMnJM?=
 =?utf-8?B?WWVreXg0aEwxZkI3bmp5Rk5rR2FHRHRORnoyVjVKZ1Boby9nWUxPOUtVblZ3?=
 =?utf-8?B?L3hKczUwMm5Kd0x6Vk9KT3dUaFphWUpLVnF6VlhvTWJlczJ2WktST3NqOXpV?=
 =?utf-8?B?eHBGNzUwbGNMR2JVV3hscXZ0NjFJSDhlbUhLczJaQ2pETVhrQ0lNYzM3Wjgz?=
 =?utf-8?B?WW9qb2ZUK3VZVGF0YkdCTE4xT3pLYXNOdi9MR2ZkOCtuRy9iYVFFbmQ1NDdq?=
 =?utf-8?B?ekhjemJHaDIrVCsrQnFmNFJJZWFZRTE4TmpyaDZUM25IdVBNdGhnd0o3YStJ?=
 =?utf-8?B?eDJtY0hnVzl3bHhhTTNpMlFHakRvYzJEZy9UZEhiRVc2aGJxbndhWFh5azU4?=
 =?utf-8?B?bERVMCtXT1lGTzFRTkdVbnBTS3pxUXpXeFc0cEdRUlRnaU1PY0VJZ3g3bUR2?=
 =?utf-8?B?c1NrRVpJWEVrUVZqTU0xQkdrSzRBRVNzR3hDNmgyRWlTTmQ5VkRNUmRISCt5?=
 =?utf-8?B?Y0tsTDJ0eE9Uam1QbmtuY1Fwd1d1RTFoK1VzL3YwNk5MeWh1a05NNWNpZ2ww?=
 =?utf-8?B?SG9EN3ZkZTlLWlBOWHZCNkt3c1V6N1lydkJBUzc4Mkx3VlpNVWdHeE1OcU43?=
 =?utf-8?B?L3FzTUpHbVRLMTZIWStsNEtmazdHVzB4RStFZkJIVXc2ekMvdStGN2ZlZGdp?=
 =?utf-8?B?UEhockt4NmxjQ3ZGR0JOcFZBdEFxUmROMy9VVWFuMVA3bG1MWStmWnZFVkUw?=
 =?utf-8?B?T2NpS0I5RTl1RVB6ajRZVjFRSnNrdGlzbjFRRDBlSHd6dkp4dUthREtaaE9B?=
 =?utf-8?B?aUlwcmZhTngrR3lva3RTeGtLN2VPb3V3VGpHRXgyUVZmZlFCcEt2OFdtZ3Jp?=
 =?utf-8?B?R0c4dXFPUjhIUGVkMnJLUitHRFF2cFV3bzgxQnVDQnVUUm5ONmV3WUFzL2hZ?=
 =?utf-8?B?ZmEvN0xjM2JDT1NRZHBzWjJ6alFmNHNVbHhKSEozeTZ0NjZOSmE5K3JXNGhS?=
 =?utf-8?B?Ulhxek1yY3IyZmlmZXl4QzEzL3h4R2VGMTRvS2NvSUtteks2b0ZDKys0TnRw?=
 =?utf-8?B?R1NoTWZQczU5M2x2UkhuUVFxWnpvL2dRZklCNHlLOEx0b3FKWUNDK0Z6UUE0?=
 =?utf-8?B?Vnk2dDVlWWg2bFZ4TU13ZC9oRUpQbXZDeFFqM3cvdDVYa05YZWpLQldybVlQ?=
 =?utf-8?B?UUJCRG5lQThmbmt4aWNRU2pOanVRNEtuTFplNGdOU3EyaE9DdGVlODNncHh1?=
 =?utf-8?B?elp0bURqOWhnTk1hMk1VOHhXQ1h2eUU5Q1grTUFWT0daekE3dDNrSmU0OHB6?=
 =?utf-8?B?dXo2Vy9SeHpNanBkWklwd2dyd3B1OG9FUEFyRmhyNEJOWVdZd0RINFIxZFRR?=
 =?utf-8?B?MGNEaXduN1JaQzBNVnNkSVhXRWJKTUtlVVI2dmhMdTJtdlczRklzU1Z6YjhK?=
 =?utf-8?B?Ymh6MlRSK0FCcG1NS3grQU9mRmE3SktGZ21WcVBqV3R4N3JjZmpKckFMRSt6?=
 =?utf-8?B?ZHZROW9MVDFlUFZCYmJHTWtNZUVYYkxqQnVVajJNK1ArRktPc1UwdEFYRUxU?=
 =?utf-8?B?amp2MzBCSisyK1hVZEpOQ25HYUd1aXkweG95WGR4UkxZV0E4SDh0a0V1bndt?=
 =?utf-8?B?TW5hRUVBKzdycXRhSGRGVXdDMWRUSC9VbVJkWTNmYWtwYkliM3F3dFQ3QzVN?=
 =?utf-8?B?eXdGSURSZ1VGb2xQM3JDSCs4Vk1FZ0RjKzJRY24zU1A1WVp5LzljUVRlZ1E1?=
 =?utf-8?Q?ok0q88?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUR4UnA2UnVyMTlHajE1Zjd4dW9GaTk5VU5BNXBES2dpaG1IeFI0YjNyUjhv?=
 =?utf-8?B?M1gzY0tkYWthOEtZY0x4bmFRby9FQ0VYU3NwS0tMdHlzZ1prTVNYZTFLMjNq?=
 =?utf-8?B?KzdKaS96Z1VHMzM3MXNKRHNJMGo2bmpkUHRzTVVYZW0zaTZXbDVzV1pGVExz?=
 =?utf-8?B?cDN5WllHM2NOM21HYW9CdmhJVnNOanhXMWc4YTRSZGZxMzNBTDRoRENsK3RH?=
 =?utf-8?B?d2xoQTRydjVNZVhOcndpNWxXZU1pb0ZNc1J2dGppWWpxd0psOWNlOHFDYi9B?=
 =?utf-8?B?NXVFb0FacVJuU3lienlocE9WaFhYaTFYOVl1L0k0dVZGb1lsUDkyZU12a1VH?=
 =?utf-8?B?MWk3SEp4T0d1bHV0UG9Eem1Dbk9GVXh0VWtMV1ovdVdmSjh6S3ZWS1hxOTZH?=
 =?utf-8?B?RkVCZTh5cm0zQ3g3Wm9icThqUEhqc2NEV3pnUnczV3dVRmRpSmtiN2FzRkdD?=
 =?utf-8?B?MXp4ZHpiS3BGT2JWNWplKy9LRGtUSmpaM0ViN2ZaZG5RRUVsOUZicDZ6c09v?=
 =?utf-8?B?UDhqY1lWK1NyYjU4VTF4anNTNFI1ZUdNZCttU1I2SzNHWmNlOUJEdG9ZU2l2?=
 =?utf-8?B?MVJVUmJnZ25sMElIQjhnd21MdEsxRFJ5QnNYZHlZRkNjSENCbkJra2JlS2NL?=
 =?utf-8?B?YWQ5bk0zTzZjYy90alBCTG1sOTRDSTNIczN0UXBjRGpTTEZEb1dSaXBsczFB?=
 =?utf-8?B?cE92azZZRzd1R1l5QWZhSVRIUThyS21nUUR4T3BEKzhEenRLaXltRTJleG1B?=
 =?utf-8?B?djlSOHIyVXh5aEFZNllUWGY1SCtqRkdpOTdFdCtqQ3N0Tys4Y0xaOVFlV3Qw?=
 =?utf-8?B?QnAzOWlsTWJ0VU03SEl4N0g3VkRmQVg4bkZ3VG9Mdk53OVAyMk5HKzFKbVF2?=
 =?utf-8?B?U3lZdHZHMzNsMGFNdWQ0VE16MUhSblh0bTVPSjdrTzFWZDR6MFlKYWQ2Y3d2?=
 =?utf-8?B?eTZSZG1ZNC9zdmNreHZiQklLeEhZS0tTMjIzU28zaVEzZC9SQlcrd2RxcGpK?=
 =?utf-8?B?aE13VFcvalI2Y2R1ZTJ3ZHUyL0loZHRNd2U2Q09RYW9BTDZaRVB4WlNUUHhr?=
 =?utf-8?B?UkI0OGVlTzBkYnJvZElxNEt3M29RNTF2cW1NeXVjdnI2b0lSSWlTaFgyQmpR?=
 =?utf-8?B?K1hua1hPb3htOVFJdTRsaXpDOGZucGI5dFZJZFVFdzdKSi9pWFRvWEVadS80?=
 =?utf-8?B?UE94MUpWajBleHV1RGN4TjBnT2dQUFM5bWFWQ2JKOXV2ZE92VHJXNC8zZnlP?=
 =?utf-8?B?bXYyNGRBQisxUEJZMGFndThVL2kvWXVlRktnOGxEQTF3OG9lcmN0QXZtZ3Zj?=
 =?utf-8?B?Uk9xdVkycVI2U2wwbTdiejFZUUU4L0hCS2ZZUVplVXpyeTgrdElsMFlYUVlW?=
 =?utf-8?B?a3MvTG10YWYxd0xvYWtCUnFOTmo1QWZ5anFNR3hBOGt6NVhEeFE1cE1YOFZa?=
 =?utf-8?B?cGE1ZWlSUmtaL3lqY1YvVHdpTHRiZ25yTk1sak9PcDdSOWRTdGsvSkxEcnBW?=
 =?utf-8?B?WUpNWVhrSGxHaVZpelk1d0dDcXhLYmRnc2R5S002MVJZRHVJSTZxZVg2emYz?=
 =?utf-8?B?SVVXR0VTbXdINGtNNU9VaFpGdDZNVzJyNi9HK2RSVCtVRC92Umh6NjZNS01Y?=
 =?utf-8?B?cENXcldYb1d6Z0dWaUxxUnk0bVRHOEJIUFNPQ0o5RDNNQmQ3ckJTZ1VGS0Js?=
 =?utf-8?B?bmxHR3ZRL1V0c2svMmpkTFQzdXJqZGtiREVBM2g4cUFqSjl6YVpoUWJrdnNk?=
 =?utf-8?B?WTlxL2VRcFg2ZFpzb2Z5REZkQXM4K2ZLTVNFVnJQb20xVnZXQTVsUzNNNXVV?=
 =?utf-8?B?ckNiNGcwWjlybVB6bXFScEhmZXpxTjhSY0cwUTQzMFRvWE0xVXk3YmZzMVE4?=
 =?utf-8?B?eUNQblhvS1dJK3psY0NpTEN1SWdhRExJcmluSzVWTE5uMUZjdVFSeVpFMjFR?=
 =?utf-8?B?VjZ3ZEo5bG53ZG1BSnhzWU9qUDVXeWxVWTQwbUxNNVNSajNlL3ZjeDl3T2lk?=
 =?utf-8?B?b0NLTGFQN3hUNjB2UTE0cmZ2UU5PRmlYOHpYd0FJaURsMTY1ck40aFhlMkY5?=
 =?utf-8?B?N0I1N3JybXNqSnRTdmpKNDdZd0dVVEhjeDgzOW5KaUJUOThHbE4wRFJIcmp4?=
 =?utf-8?B?QTFwZzNIcjdDV3NzK0hkUmwxdkpWN1NwK2R5V1VoUW1PRFFHWXl1TlQ3OGl1?=
 =?utf-8?B?L0pYUEZHd0d3WEF2aDgrQ2QwV0F4bTFzZ0pWUnNucU1YS3RUQmZLTTFReHc2?=
 =?utf-8?B?QnBqVzBick9MWHpxbVM2c09oOWo3ZE80Z0lWTVc0NDZyblhxNUtRS204RGhn?=
 =?utf-8?B?Q1dIemZMZXNiYnRzaFNwbXhWdHdFVHdwaW8relRsdVZsbmlpZ08zZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43035ad9-2a4a-42dd-b3e1-08de706da8b7
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 10:49:02.1408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MPxhF/MjhDKr8o7Uybjc1GE9sYc9KPRqRN4jWg3ZiZ41xXzG4ingtx4DWFmRqcmPxFcc/zSZZdGXEJPgNZ9rwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6384
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


On 20-Feb-26 10:34 AM, Matthew Brost wrote:
> On Fri, Feb 20, 2026 at 10:05:02AM +0530, Varun Gupta wrote:
>> Xe3p hardware prefetches memory ranges and notifies software via an
>> additional bit (bit 11) in the page fault descriptor that the fault
>> was caused by prefetch.
>>
>> Extract the prefetch bit from the fault descriptor and echo it in the
>> response (bit 6) only when the page fault handling fails. This allows
>> the HW to suppress CAT errors for unsuccessful prefetch faults.
>>
>> For prefetch faults that fail, increment stats counter without verbose
>> logging to avoid spamming the log. Clear the prefetch bit on successful
>> handling so it's not echoed in the response.
>>
>> Based on original patches by Brian Welty <brian.welty@intel.com> and
>> Priyanka Dandamudi <priyanka.dandamudi@intel.com>.
>>
>> Bspec: 59311
>> Originally-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
>>
>> ---
>> v4:
>>   - Downgrade prefetch error log to xe_gt_dbg to avoid spam (Matt Brost/ Stuart)
>>
>> v3:
>>   - Drop the rename patch, keep xe_pagefault_print() unchanged (Matt Brost)
>>   - Move prefetch check to caller instead of inside print function (Matt Brost)
>>   - Remove XE3P_ prefix from prefetch bit defines and add platform comment (Matt Brost)
>>   - Show prefetch bit in error messages for debugging (Matt Brost)
>>   - Split stats counter into separate patch (Matt Brost)
>>
>> v2:
>>   - Changed comment wording from "repairs" to "handling" for clarity (Matt Roper)
>> ---
>>   drivers/gpu/drm/xe/xe_guc_fwif.h        |  5 +++--
>>   drivers/gpu/drm/xe/xe_guc_pagefault.c   |  2 ++
>>   drivers/gpu/drm/xe/xe_pagefault.c       | 18 +++++++++++++++---
>>   drivers/gpu/drm/xe/xe_pagefault_types.h |  6 ++++++
>>   4 files changed, 26 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> index a33ea288b907..bb8f71d38611 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> @@ -261,7 +261,8 @@ struct xe_guc_pagefault_desc {
>>   #define PFD_ACCESS_TYPE		GENMASK(1, 0)
>>   #define PFD_FAULT_TYPE		GENMASK(3, 2)
>>   #define PFD_VFID		GENMASK(9, 4)
>> -#define PFD_RSVD_1		GENMASK(11, 10)
>> +#define PFD_RSVD_1		BIT(10)
>> +#define PFD_PREFETCH		BIT(11) /* Only valid on Xe3+, reserved on prior platforms */
>>   #define PFD_VIRTUAL_ADDR_LO	GENMASK(31, 12)
>>   #define PFD_VIRTUAL_ADDR_LO_SHIFT 12
>>   
>> @@ -281,7 +282,7 @@ struct xe_guc_pagefault_reply {
>>   
>>   	u32 dw1;
>>   #define PFR_VFID		GENMASK(5, 0)
>> -#define PFR_RSVD_1		BIT(6)
>> +#define PFR_PREFETCH		BIT(6)  /* Only valid on Xe3+, reserved on prior platforms */
>>   #define PFR_ENG_INSTANCE	GENMASK(12, 7)
>>   #define PFR_ENG_CLASS		GENMASK(15, 13)
>>   #define PFR_PDATA		GENMASK(31, 16)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
>> index d48f6ed103bb..0cb68e956af9 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
>> @@ -28,6 +28,7 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
>>   		FIELD_PREP(PFR_ASID, asid),
>>   
>>   		FIELD_PREP(PFR_VFID, vfid) |
>> +		FIELD_PREP(PFR_PREFETCH, pf->consumer.prefetch) |
> You can set this up based on the producer data and error.
>
> I'd like to avoid touching consumer fields in this path, see [1].
>
> I think the logic would be...
>
> u32 prefetch = FIELD_GET(PFD_PREFETCH, pf->producer.msg[2]);
> ....
>
> FIELD_PREP(PFR_PREFETCH, !err ? 0 : prefetch);
>
> This is a better logical divide as the producer is the one who knows if
> it should set the PFR_PREFETCH in the acknowledgement - not the
> consumer.
>
> [1] https://patchwork.freedesktop.org/patch/704579/?series=161560&rev=1
>
>>   		FIELD_PREP(PFR_ENG_INSTANCE, engine_instance) |
>>   		FIELD_PREP(PFR_ENG_CLASS, engine_class) |
>>   		FIELD_PREP(PFR_PDATA, pdata),
>> @@ -77,6 +78,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>   		 PFD_VIRTUAL_ADDR_LO_SHIFT);
>>   	pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
>>   	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]);
>> +	pf.consumer.prefetch = FIELD_GET(PFD_PREFETCH, msg[2]);
>>   	if (FIELD_GET(XE2_PFD_TRVA_FAULT, msg[0]))
>>   		pf.consumer.fault_type_level = XE_PAGEFAULT_TYPE_LEVEL_NACK;
>>   	else
>> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
>> index 72f589fd2b64..b05860b3607d 100644
>> --- a/drivers/gpu/drm/xe/xe_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
>> @@ -261,9 +261,21 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>>   
>>   		err = xe_pagefault_service(&pf);
>>   		if (err) {
>> -			xe_pagefault_print(&pf);
>> -			xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
>> -				   ERR_PTR(err));
>> +			if (!pf.consumer.prefetch) {
>> +				xe_pagefault_print(&pf);
>> +				xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
>> +					   ERR_PTR(err));
>> +			} else {
>> +				xe_gt_stats_incr(pf.gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);
>> +				xe_gt_dbg(pf.gt, "Fault response: Unsuccessful %pe, prefetch=%d\n",
>> +					  ERR_PTR(err), pf.consumer.prefetch);
>> +			}
>> +		} else {
>> +			/*
>> +			 * Clear prefetch bit - only needed to suppress CAT errors
>> +			 * on unsuccessful handling.
>> +			 */
>> +			pf.consumer.prefetch = 0;
> With above you can drop this logic.
>
>>   		}
>>   
>>   		pf.producer.ops->ack_fault(&pf, err);
>> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
>> index 0e378f41ede6..23a6a986d5b2 100644
>> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
>> @@ -84,6 +84,12 @@ struct xe_pagefault {
>>   		u8 engine_class;
>>   		/** @consumer.engine_instance: engine instance */
>>   		u8 engine_instance;
>> +		/**
>> +		 * @consumer.prefetch: fault is caused by HW prefetch.
>> +		 * Echo in response to suppress CAT errors on
>> +		 * unsuccessful handling.
>> +		 */
>> +		u8 prefetch;
> This will grow this structure from 64 bytes in the page fault queue to
> 128 which is not desirable.
>
>>   		/** consumer.reserved: reserved bits for future expansion */
>>   		u64 reserved;
> I also we like to leave this u64 reserved as I plan on using it as
> single linked list of pagefaults that come in a storm that all match the
> same address [2]. This is reason I'd packed fault type and level into a
> single u8 here [3]. Maybe pack prefetch into the upper bits of the
> access_type field?
>
> Matt
>
> [2] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-svn-perf-6-15-2025/-/commit/93669c7f4e00ec13d0a18e28d34dfcb41803b7c9#d0e961d15e218e9be8819f1311674d537b25ebdd_91_109
> [3] https://patchwork.freedesktop.org/patch/704578/?series=161560&rev=1

Noted, will the necessary changes.

Thanks,
Varun

>>   	} consumer;
>> -- 
>> 2.43.0
>>
