Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5ACC10F1A
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 14:08:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC1110FC81;
	Tue, 23 Apr 2024 14:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="giqh5MMf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB75B10FC76
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 14:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713881322; x=1745417322;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RpOKVmAt0zpKhvx/9od2ycph28UlTaWTm7HVT59zG0Q=;
 b=giqh5MMfn5WOeJX+p9Isr+6aXI0roxhPx+lQuCusICrs7e6SnDN3Z/jz
 1CAjBAV/vjk5T2I6Dfo3iZBVf1ZZVXPytZoZS4KUh4ZF+wo/3EWDnYBfX
 avtmLC3EPHMN0YkpyrhBSVPHsQtnwoL4IWtelESvNcKy+aP6T8ZiS1+yO
 JTgW1P3oT6ZTiTPEwpc+16ZeWp4mm4bzOKJkicKZwJfUiY0CRTnt+21tJ
 QiR1Df56HZM50Bc7EvsYmfG2VWQZ5eSiujs4aUupYhndEaegCJ0mp1avQ
 OPsiVDilLl05RBFRu2dVALkdQ9jSyDy/35VdKqgBnZjp5ysn7oqibjPjp Q==;
X-CSE-ConnectionGUID: e0a+mMfkSyyjz7Vkw/YHoA==
X-CSE-MsgGUID: jSQhuBSRRaeDYTEc09saYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9631298"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9631298"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 07:08:42 -0700
X-CSE-ConnectionGUID: +Ysnn7r9QwG6Ib42YV8upQ==
X-CSE-MsgGUID: /ZttsMWmSzWYzTqMAJBp3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29176701"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 07:08:41 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 07:08:40 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 07:08:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 07:08:40 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 07:08:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYsuSpL8uR4opEXsVioQuuqbjYRo3X0B4LjrS4Lfk/hN6ko06gF75MHMgjoDHIwv6fZFoLaZnUGGFU199Jh77CQZDq4Y1r8ovB7jhdWHMkxaAKocbvOCFVfsE/L4Ni4FEiSbWMkdVybbGkG/qsYEtt3420CN8o+xzXei/HzT6tZizVzMaR0YmTFNWd6hPEAQY5LrThZwaeNSVWN/etKPDoyHB2Je3QX58+zn17b8GXmuPWdCzQ0eJ69YaAizhx0lFqb+d8SoL/OmEtx1uu4c1LRQOaVptXrNG5BTespClXWMjflIS+nefMjYBL1CC83qDQ3olSgkvNHbr79f/2JF4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7cWa1x6Haamv8m/BCLJs0lp/t+NHgO2xcm30lvBCzEU=;
 b=VwlvsQ5wIPaUuexIQYESceWUPX0T3ytt7ctToYufRCpWJkVdfCUgCKrgvXmkEOP1riFbuFlg8wPSdEZVof8lh2WSt8C7ITK7GwGdKVlTonbWyL70EhI50HWM8xWP/bmVbCR0bV6FaupkQp8EawCEkXYGNtrF7THfbVQQFA046vBrqxmnWP9UNao6Zy7nygiyBkMF2pEln2/fZk07hudKVuzHWcdzsIEOZRPQTz3P0eqF63hXB7I1wt+GRPhMq3Xt4ivPOmRosBd95ilCvEwXbV1X7nCpdwxACgEEJMEDCAZqaOew34Psh+g7k33zOE3cDzhFdHHqHEpBu+6k7Ezhig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SJ0PR11MB5813.namprd11.prod.outlook.com (2603:10b6:a03:422::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Tue, 23 Apr
 2024 14:08:38 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8e17:1f3b:64f:9c67]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8e17:1f3b:64f:9c67%4]) with mapi id 15.20.7519.021; Tue, 23 Apr 2024
 14:08:37 +0000
Message-ID: <bcdda006-e3ee-404b-bbbf-45626e1292d5@intel.com>
Date: Tue, 23 Apr 2024 19:38:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: make xe_pm_runtime_lockdep_map a static struct
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: kernel test robot <lkp@intel.com>
References: <20240422201454.699089-1-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240422201454.699089-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0091.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::31) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SJ0PR11MB5813:EE_
X-MS-Office365-Filtering-Correlation-Id: 8417017f-95fc-45ad-77a2-08dc639edef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFpSQnkvNlJ2eWZVVjFHNHo5aWxVTVpGQlVuRk5HeWtaN01VQ3Z5KzB2bzNF?=
 =?utf-8?B?RWMxSnU3SkpuVjJJQWtqS2lqNmE1azZ0d2JHcnBLYkxUZHBFWUl5L25RU1pE?=
 =?utf-8?B?MlRCOHZKWElnaGJaVzdHSGwvNTBrNm81elNEbGowQUlEdnU0WVI4NHhld3lw?=
 =?utf-8?B?b1FaR29UdUZSNEhrTkdXbXlKcHRndnU2dzRsbUVpVGt5NnloQklkM20zODFm?=
 =?utf-8?B?UURkMXlua20yU254dFRxbnNKVG9MTVY3c01FaWxvQXl3RnZUaTcyMWwwbi9n?=
 =?utf-8?B?cVpmU0NGVXZxSHkxRzR5ZU1zbDMwM3B1RUZWL1BidnVVS2NtS1ZnTVlYNmhh?=
 =?utf-8?B?a09ubUR3U0FnYmtpMVBvOXhVaXQ2ZG0ybFZvMHNRZ0Q4dUx4Q0paVHY1NXpQ?=
 =?utf-8?B?b2R3YjhtNkIxRHI0ZWhPTnhTdm52VmQ0MUNLOW1rNENkSDRURnhWejBIWjFV?=
 =?utf-8?B?ZDlQRnI1RFJHN01DeUJURzJBSFkvUHNSSDBScHFJRDN3SUNtYy80TDVjZlR0?=
 =?utf-8?B?dFYrUkZ0aHkwbFh6eHUzVWFDRmdCQU5DNW1jK3Q0UnNoZC9BWXBQZy9Pekdp?=
 =?utf-8?B?K2R6YXVZVzNvNURZdWNZMXZYNXFlNDNhdE9Dck9XMGcvZHFnZmhTbnIraXRj?=
 =?utf-8?B?Um1MMUNnSmZ1YytsMjN4Mll2cHQ3TCtFaVVaaHlnRzlCdFhiUzEvMDJhSDlI?=
 =?utf-8?B?WGFWQ3VLdEZ0b0Rrei9lamtBdG5pNVFESFg4eDR4cU13QkU1cU56dUdoSmQ0?=
 =?utf-8?B?NExDckRxNEY0VERRRzRDZXJyaFhra0tmSzJGdDc1ZDN5WEpJTEx2Qmt3QktN?=
 =?utf-8?B?SzYrSy9ydlhtRGZzTmZDT09YUm9Geit0aFhZRDBrZW1LNm41YjEwZlRKRUFO?=
 =?utf-8?B?WVdRWUlrZEJGVkE2bzNtNVc5R0xqMEdGM3g3SlNUeENPNkVLdkZ2eDZCMlJs?=
 =?utf-8?B?QjJUOWdaZkhUODhQd2tRMUhKelovVHlSYmh3cXQvQXk5VUdxa0tZWmZRYS9T?=
 =?utf-8?B?SndFUkREeExaM2VmcXR2dGNPTnZhVVJoTVBqSElUZTVXMWQ2bmtzYStvZHlz?=
 =?utf-8?B?TWJoUkZ1TmlLMG0xTmtLT1k4a0xEUkRySVNhejFoNUNLOWtFUDBmMitIQzdS?=
 =?utf-8?B?TzUva2sxL3hPdXlqNk5sdDEzUHFhYm11SUJnNHVvcERMMzNGVDREVzRQbTVV?=
 =?utf-8?B?TitRVzdyRzBEdW0rZ2NtdDRkam1LWWxxSlkvSUdVSnQva3dIL2R6dDBpWGJo?=
 =?utf-8?B?MkJ0REdSZ3dHOEVQUmxjM1EzSDdsdzRIUW43M3JnZVFwbGw5TUJVTFdRY0J2?=
 =?utf-8?B?eW5FS3cvVkM1SDFFQ25odzVxQlpUZkJxNEphYWc2MzdYM2l4bURsK2pHMTZ4?=
 =?utf-8?B?Vy84M0c4dnFWZXVDM3g2ek5uQnV1T2Q0ZStpZG9UMDRYRmJqQjdBQnBBbDNu?=
 =?utf-8?B?RjFYRUg4YjViMXBhTmVXUEFkQVhqcG0wRERhY1IzVTZEQjRUZkdLS1ZWMWZR?=
 =?utf-8?B?UEo2WDZKdGFseG5sME5ZU3AwbXdHUVFuVjhOMWxoUDBFM09jZTBNN0ZZRExP?=
 =?utf-8?B?OXkyQWJSMzRGVmhLeEprWGFud2k2R05pYXRtNGVmc2dJODRhbkRpOExpeHhZ?=
 =?utf-8?B?eFQrb204UFRudjZueTBIWmxiTDFEMGJJMDdPMHVENXhWQkwzaFZtN2VsSWxD?=
 =?utf-8?B?azh0ZGJZZVNpK2FVbzZaUUc4YzNnekxTaFZqWktCdUdZYlJMcEF5SHpRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlN4WmovcHJNdFRkV1NlZUFHb2JGa25xblpFTzVUbk14Y2JNenpkYUgwbGhr?=
 =?utf-8?B?YjQ2SlRsbkdvSStWajJTb1hBaEFLN3A0eFk0T1lvMWNjcDNjL21qTldydHdi?=
 =?utf-8?B?eEhRcVhPczdRbnBvREQvMEFCdXA4QnlPS294aXFsSUR1eEhYdmxHM3BQdDYz?=
 =?utf-8?B?S0Q4U25tbUZuNEh4U0ZpWVVJMkFaNGxIdDJPdmVHVzZ0Nk1EMVIvdmR5NDRT?=
 =?utf-8?B?MDlDQ1grVEJRUUhIL2VidGlhT3g0VjFCUTUxMTg3SW9pOXRpejBwVC9EVk1v?=
 =?utf-8?B?ZXRETG8yd2lSUmNEQ1BYVDBwUityTkw3c0JGSUZIRWNVUTdDempQakJzalNO?=
 =?utf-8?B?NzZEK0tyWWx5U0xHeDdIYW51RXhRaHFJUERkWEVRK1RFV1BRbkhyc1JaZUo0?=
 =?utf-8?B?ZjR5dy93dXNQOWZ6ZVlmVnVqZC9zb1BxSE9oZmxEakREOE5NbTNPUWRhcWY0?=
 =?utf-8?B?cWNxU25mVmx2c2xpRkgxM05oVmpJTDFSVnpvL0wweXY4Rjh3VXAyaGlGeTIr?=
 =?utf-8?B?N1gwT3U3NW1MUm1LUldSaWhmcXpyTEJkTW9nc1Y5Z28zNktHVGxGUHJXbkI1?=
 =?utf-8?B?K05pQVR1QjVUNDFhai9rNUI0SUJKVWhjc2thdnJKRHdRbFBzVEhjaFkvWjda?=
 =?utf-8?B?ODhoUjZwRzF1SzkzOWJIQ0tGU0gxOExUYW91N2gxUEVHWE1aZTVQWVZKaVpR?=
 =?utf-8?B?WTAzNm1hY3dVS0pvWGlMTW5Rdm9xazFPTGpHMWhNM2NLclJOblhWUXpqenNj?=
 =?utf-8?B?MVJHOWFRQzNUV1Fzd3FoRTgreUZDTytsa1RQcFBIQ3RSYTlIMkFUQ05UUjZj?=
 =?utf-8?B?TENFL0NDWTVna0UvTC9Wb3JyWWo3eTNoVngyaGs3cGljazJPQjM2MzNJTHF4?=
 =?utf-8?B?a1IvaC9INkRvWTEwbVh6N2ljeldJeE4wMHRKUVIwdTlSbXNjc0hWTEplS294?=
 =?utf-8?B?eUpTRm5LKzFPcVU5NlZaR2c1dFF4QlBBRmltNGtTa09uZ3ZqT2ZpRktmazJL?=
 =?utf-8?B?U255Q1gzSlpEL2Z1OXpNVzROSVZtMHpSSkQ0TUtBa3UxdzhlSitIVlU5b1FX?=
 =?utf-8?B?aTA4WStZRkVVN2NFalpkL2Q3RC9pTWxxeS8xczAvMnJWYWd1ODNZaDBYcnRZ?=
 =?utf-8?B?eWJNY0lqR0xoWGlrUEpaZkVkc2Nab01TSkJyL0orMm9sNmIyOFphcW4xSlhi?=
 =?utf-8?B?ajBmVGlUR1VNZ1l6bjBKL1VSem8wd1owSTE1cjc2N2p5dkpORnJNRCtpa1Fu?=
 =?utf-8?B?S3d4MU1sc1N5alZnd3BmWEFQMzg3L2tnQVNHaGNZQit6ek1WZXZuVmlEbk5D?=
 =?utf-8?B?T1RGTEJkQmtYWGJGSkFLa0EySHZmU1RjaGZsK0w3eHE3bGFNYSs1eGNTeUxm?=
 =?utf-8?B?MzBMVHZIYitNdnFiWlNXZkhadjJ1dWR4L3VNVmh4QTRZMVJSb1dKblBGWGlP?=
 =?utf-8?B?ZHc5N3I5YmRzZW9WUnFGSXQ0OWdBMVBLK2lqYngycG8vQlF2U3lDRDhCanNU?=
 =?utf-8?B?QjAvR01sS0V2RTkzSGc4Y2t3bXl0a1daNjJuTFJqUzVLeFBYNVNkcXJCU0pG?=
 =?utf-8?B?cURKenZmZFlqZkhMTWE1N3Zxb0VNTlh1RWJVeWNMYlVOb2Y4UHFsS1duUURj?=
 =?utf-8?B?VFpZZzRmT1Fpa0tjSVpmSExuU3Q1aGo1eVZqWEVGMVRJc2NlMHU2NFJhcVpG?=
 =?utf-8?B?WE9qcE1Jb3E1Nk9WeHZrZDBNU0hPRGpKS01VNHZtSzNvOEJOcEc5R1hWMmEv?=
 =?utf-8?B?VzJHU0gwY3NKWElMTW5uTVB6Z3JTTEtJVUNRdW1PNGE3NkxNd1FjM3lYYlhR?=
 =?utf-8?B?dHMvT1U0a3hWTitBZU5SUmJudm1jSURBK0xDMHdMSUNCNDZTaHNwWEQ3VEhk?=
 =?utf-8?B?OVlaQjJPaUVjNys1NWdNeXFUM0JJNWRZQURrWDV3ZklVKzZrYWc0YjBJT3Bm?=
 =?utf-8?B?NDlZeE1YZC96Q3lRY1FSbll4Ris3ZUQyR0k0WThQMjJLdnBHRjJZSU1JYUN4?=
 =?utf-8?B?OWpVNFRrNFI1NnhPVmE3VG9yWW1DVWkwNUxhOGp0V1BaZTJXWExadmxZOW5L?=
 =?utf-8?B?UFRodk5vaklGbE1rVHZHcERMNnBmdCtkWVBtdHkvQkNJKzF0ZmViZlpPakVS?=
 =?utf-8?B?ajhBczQ5VDUzRzVpb3NvVE9JbjB1bUZ2NTJVdXhoU1VmUkVYOFFLdXZjVDh6?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8417017f-95fc-45ad-77a2-08dc639edef0
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 14:08:37.7211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 91xj7UCeWq3jxMgYGccbA8Xjmnu9IHtZnFi/VLumE8nzKIRnQ6Od1L75cfFZh49rC+T7sqMSXKHJ0zx+PKKa9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5813
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



On 23-04-2024 01:44, Rodrigo Vivi wrote:
> Fix the new sparse warning:
> 
>>> drivers/gpu/drm/xe/xe_pm.c:72:20: sparse: sparse: symbol
> 'xe_pm_runtime_lockdep_map' was not declared. Should it be static?
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202404191329.EZzOTzwK-lkp@intel.com/
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 37fbeda12d3b..c1831106ea4b 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -69,7 +69,7 @@
>    */
>   
>   #ifdef CONFIG_LOCKDEP
> -struct lockdep_map xe_pm_runtime_lockdep_map = {
> +static struct lockdep_map xe_pm_runtime_lockdep_map = {
>   	.name = "xe_pm_runtime_lockdep_map"
>   };
>   #endif
