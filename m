Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC493C02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 23:20:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9487B10E70D;
	Tue,  4 Feb 2025 23:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KSKRudac";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB79910E70D
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 23:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738711214; x=1770247214;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3dwfey0xNKtHpQgV+8MB5b4FNyD0P0hTtExbpzE4xMo=;
 b=KSKRudacyp5fzBO3i7KXMmBLb9K3sIcPsa3fC0HrAd+NdRgRzxAJcMxH
 rVa0+mtXO3imcPpxwLG5idtjW2JEFT1ONJsJL0BIIKz2OeFGAqyxWdQn3
 iFyIQw4et2cJ/3sscbziHPwYPmjokrqi6775XcFf7y8NBC9RXHM5YtrC9
 oiy+90pfrqKO4Yl8EOrFq/rg7ARtZmCOcj3SxrnUGFyNaa3I8hnIOJ31Q
 8a13XGxM9ca6z0LHSa5mbVHuRDe/C1bye2gApA4cFwJFNomgfF3cznJTR
 23H2Yyka2iQ0ZxYzh1yfHHluilB8fKCNegh+DbOc6Msw4Is9pKZtiMqdC w==;
X-CSE-ConnectionGUID: sb38V4x5TmyDs72ZrLJDOw==
X-CSE-MsgGUID: 8JBWqy/iRB6nCW8+DDu3hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38494356"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="38494356"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 15:20:13 -0800
X-CSE-ConnectionGUID: UGBaZW+VRjCD0CNK02fkJw==
X-CSE-MsgGUID: BuRqyB6TSSO967FcOiuPew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114792587"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 15:20:13 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 15:20:12 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 15:20:12 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 15:20:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlfCEUa4VVdPf3hnYJvROnKIcHhskUDJd082+MG4FFNOA9LFJoB7piHgg4m8IcPFtdnfXa3M+uewN8DvYuVRPAy8sCCvWEaql63tRfZTVDHxr4qi5jtbkpvtnLFrAQggk894RGFK0CXv1xeJHbAAvpHIjehyWVLj8WKsW+970OXeEMmmKTwCUwMl9n3ANBApAZfWncy+AyF9c1hMOuodK6XzEeyWDOP+YqyflwAgyQe2OKeiF1mDnKCZshyH0IJxJj+YYdmK1cY1EELB2em9zJYrLJWqo1opwBLgjBTVaWXSYt7KmRtynU0dtg/xfSu5atJF8QjPBgQNHpOio6SuAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPw9LBEGS9+avX2GEnveNcpjCfuUo9tmqMYoYprT6oM=;
 b=QkpampI6+7ezwn4n613hxrZ0/xomh7nIELVMCOcnMtoP33dZUHvz7j/8p2FKqc7K6GHYHlI5ZXvJgrb0zjgQ3spKE9kwti7Q1RWN5C1BoLQHXNttmcaRRitBBEyE6J1GDaS9xthu/0HXUOgQPMEh/Wp8vBDzMcxaDEiIJrpOiyqvMmVG4JxcXCNT6ieF0Z2fqwvBKpk4Xguf//41ef0zJ7ww+p4uoA7GGYVzhpZpAtjzsur+JHRPmbyiIyNssqunk7d3bDUCsA5EuEpYezxauT1znvZCzMWmStvUWiqqnujx2jTmBWIwcdItrYoiAEHXtSKwLAef1llchBZX87mtFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by BL3PR11MB6529.namprd11.prod.outlook.com (2603:10b6:208:38c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 23:20:09 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%4]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 23:20:09 +0000
Message-ID: <8039a334-62b1-467c-bf6a-824cbae578b8@intel.com>
Date: Tue, 4 Feb 2025 15:20:08 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe/pmu: Add event tracking
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
References: <20250204180905.1347210-1-vinay.belgaumkar@intel.com>
 <20250204180905.1347210-2-vinay.belgaumkar@intel.com>
 <tbg7365xok7b6px5rnvvnkuklln7zhbzr7ahmkmdpdpw54yoko@i7fsjxiefpul>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <tbg7365xok7b6px5rnvvnkuklln7zhbzr7ahmkmdpdpw54yoko@i7fsjxiefpul>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0067.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::12) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|BL3PR11MB6529:EE_
X-MS-Office365-Filtering-Correlation-Id: 70594fc7-c757-46ea-c8f6-08dd457277cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnRRNWRqeTdNMUIxSk5sczBFSUJVZ28rRzhkMWpmRmZGa1l1b01ydG84OVl1?=
 =?utf-8?B?UXJYQXJjSFkwMEVzYzNSRjhaTTM5NFd4SkdQZ1F6RnlqLytuYjNaOXRUTnpB?=
 =?utf-8?B?UTR3dmhiRnM3VFNjL0R3Y0JVY2hNL2VtNTk4S2l4UTg4cGpkYXE2NW9zVVcy?=
 =?utf-8?B?RnFpakkwYjZIc0VMeVZzQmRIOG9GUnkxdnM1ck1XSXJyWWV5eXk1U1RCSDBO?=
 =?utf-8?B?QWg4QTVZVHlVbk43MnFXZUFTUEFFamJmZXdZRnBLMnVwZWN6SUJ3K2RrWmV6?=
 =?utf-8?B?SENuSDNiSzJ1MEo0aXRSbzZTZ3Y3ZmRnSEZ0MVczZFU4LzJ1YnZnVjJWMzAr?=
 =?utf-8?B?SFFRc3dEV3ZIeEFhODI0OXVFYm1YQlRTbW0xSk1ZZU9GN29hYVN1U1pOTnVl?=
 =?utf-8?B?VzdOckg3RzEzd3UzOW83MVliM21acmV5MEtrSHZ5eGRZcnNOK1RRbXU2ME1B?=
 =?utf-8?B?ZWtCN3N1SlhkK3RsY1htRUM3cllSNWpLV0IrK1Bod2p2aFVwWlI3VjhWMFB1?=
 =?utf-8?B?eTY1TGxPWXBheGNKSE1XOVpiMEN4OHlVSlA5dGVBSlkyMDVSakxjZkRqWkRr?=
 =?utf-8?B?cXFRd2Z2YkU0Y2cvVms0WUl4VTZMbksrL0djVzJjVXlNOUFXZzJUaTJwakN6?=
 =?utf-8?B?VzVtMGZhd0xSVHQzYTNKSVNtSkFrN1czRk1BY1B0WkNJcW0wVHFSOUwyek9s?=
 =?utf-8?B?NDN0cXNObkhXWnlycUxOVG5FZTR1RHNZYU5YSlZMODNobFEzWDZzWldlMzZp?=
 =?utf-8?B?MS9KTVVkK3cwWVRIbGU3SGJKQ29UUk92aWlBTXlDQTk3VzI5UTlwWmw4UXha?=
 =?utf-8?B?dU5WUGN3UFNrWDIyMi9GZnRNRmhTM1RoYVI1YXd3QjJncm5FVERtSW1pcUVm?=
 =?utf-8?B?ZGNkeEZUWFlGTzVOQU9kMmxSZ1ZKTmtVZVhiY2lsZWNFdkg1T1ZCRUdrdllB?=
 =?utf-8?B?bzRwVEZVWmlXQjNON0RjcDViS3lLWDluZms0YmxwQnA4RS9yc09KWjBRUFpJ?=
 =?utf-8?B?UDdXVTUva291N2lWdDZKQTBrYnRsNzJ3RzF5c0JRSG44eHROdDVEMG9xSXBP?=
 =?utf-8?B?cXkyNlVoMXBmZUVDTmdlbFBEWDJwcUJVVWp1MWlMSkp1My9hQnRwODZmZ2dz?=
 =?utf-8?B?QWFZRHpoREtacVN5SFppVnpPUldKRGo5Um5aM05FZjl4MnZMcHJWaEJOdEc0?=
 =?utf-8?B?SEgramRnZHhxN0xReitySzh4Tm1na2FROG9jOERpRzFmWlEwR2FqS3RTTWxk?=
 =?utf-8?B?OHN6WGFQdXRiSHZvYmdKeUM5QVJUcUJUQjhhZjBwaysxSXN1YU1PcU9paDAy?=
 =?utf-8?B?RVUwdVJZY3c0ZFZER1ZjQTF6R1pScHM4dktkeGFNQmxYVXZZMmYweGtmVHFs?=
 =?utf-8?B?MlNjdndUenJjUHYrZlNndjczWkVCTmkxdm51UUtqbTdDaVh5RzhVd2JPK2l4?=
 =?utf-8?B?d2xpdi9idTk0UGJpTUNWMktJbkNmcXYreHBHZjU5OFJ3Z2d0ZVVTODRaeE1S?=
 =?utf-8?B?YkVoV0JFKzNQeFdSTUd5Mm1odkRzVUU2WWp5ak5jYkZhWnlNeGhWaThCaW80?=
 =?utf-8?B?NkZackZ0cWtuU29XTGlDNy9zNi96QUw3WU85UlhRVVZIZUJndG9GZ2M3R0t5?=
 =?utf-8?B?RlFTazB1c2lWRHBpN3BFSC9FN1lrWXV1YTV2ampsQnVGcDhTTTFNWXFVK0h1?=
 =?utf-8?B?YTdTRDJVRzd2V3A5SmZreWQrRUFYK0krTC9SOCtXY0pHd3RQV3Z3Zy9TcTJJ?=
 =?utf-8?B?TjhmcnJ0bkV1UHBYcFNPOElUS3JJell5OERJTllHNlFMWjNwSWs4TEhTdFFV?=
 =?utf-8?B?cmpnRk02OU5oYU1oTXYrYXVyNlgrUS9rMzhNY3ZzWnZSTjZ0bEcyOXBoZ0Jq?=
 =?utf-8?Q?ZLhTa4M3Xk4CF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2dPeUxJaSs4cDZZUW9VWFJBL1phMkdCd0FCQlEraGF2dkZxWWNCbWl1c0No?=
 =?utf-8?B?WDJXa2JvNDByS0ZiMTc1dUVaKzd5dXc1bE1Wc0J6ekQ5L0VQSGJOaWsxa09u?=
 =?utf-8?B?UEZpdjk2U0p2djk5MjZwM3gyNFNrUWYvemtZblFvTWFEM3c0ZFNQVUFDTmRm?=
 =?utf-8?B?QkU4dGRCSjE5eTBHWkZxM3hvelpmTkd3K0ZiVmtFNllMcmFNd1EyRU82T2Z5?=
 =?utf-8?B?UjRyWjFSOUs4VlZDR0tudTNkbWpLdEdVYzF3TGlBUnhmV283L1VTaHJzdGtZ?=
 =?utf-8?B?S3pDNktTZnVEd282YW5uRWl0Mnp3Mmg5c1FqRGt6bG5sSlhTYXNTVkt1NEhi?=
 =?utf-8?B?SFdrcTh2eEhMaFZ4MVZKNFZiU1EwNjAyRXJDTGF2bHp0U0llRjFXTS9iVmUv?=
 =?utf-8?B?bkRGTEE1K29TcVJwbGxONW42dklNT1ZrLytmWFBiNmtzWi9mQWtTVGtIZ3JW?=
 =?utf-8?B?UmhoenJyMzJkckVuVGIyTzEzNlR3eEpTRHc3WWQ0R1RXU0JTQzZTQ2IyU3B1?=
 =?utf-8?B?djIzY05pUXQyWWE2cEM1Y2t6U2JJV1JhYTloNGdNbFBqSDB2TlJRcm16aDMz?=
 =?utf-8?B?cWk2djlxelRCMW0zRUI0elBxaGVMcDdCbmdJTjNYcWxBQUplQkJzN0UvY2lk?=
 =?utf-8?B?eU4vcjVYbnp4eTZLRENPZWZKdFBLS29PcTFiQWYzSGgydng4SnEzdG5SMkxm?=
 =?utf-8?B?YVY2WXFydTNkQ1M0MlpITW1BYytvM2dOVTJYcnRnai9KS2djcDJBdzhlQUo3?=
 =?utf-8?B?WXJJVnhYTGZVVGFoMC9NWHl1UEM2SkVhU0NTOGFCME1mS2prREhVQUpBV0gv?=
 =?utf-8?B?TVVMeThvWnVrbzJxY1g1TFZIcjFZT0dBSzBzWVRHQUhOWmh0Wks0NnFnVENr?=
 =?utf-8?B?NFluOE13TndIYmY2Sk5uQ0V5ZGJ0MjlhT1VBYnQ1bEZsVzVGakp1dVB3MTJB?=
 =?utf-8?B?c2JOYnRjZDNteUVOQUtOUFAzdnB6L2s1bUt5QUhuQzVJM2t1WEh1dStIdUpm?=
 =?utf-8?B?aHJRaDVoVzE0cncreDdOWS9TOWpITXdIbUpzbG5zVWZnODg2OFFMZTlaKzNZ?=
 =?utf-8?B?czZrUG9HWDhUYzEyZkI2YTk3L1ZzbkZpMTRGbFdxQ2JqZWlucE1MVUUrRUZR?=
 =?utf-8?B?aE9RRE9VbjVBcGpvY2xFV2pnWFRtOWgzL3BuUE9pRXJORHRzekhmbk01TW1i?=
 =?utf-8?B?dFVOTmRQZ0NjbVUzV1hkaTgva2lXSHk5bmkwdEJES04zc29TN2xLRmRWREVw?=
 =?utf-8?B?MjQyd2tCb1htWmwwclU3YWlqdmtTZy9ZSGRkOVlzZmdWT24yTWdZWWpzZHls?=
 =?utf-8?B?NkxrZlRCV0x6djRiSGs3MmZrN0JNS3RTcW5zTit3OHUvOFE3VC84MjQrMkZB?=
 =?utf-8?B?NERpWThmUHBxRlhoTzZtUmxjckoyMGc5Q3ZqRlprM2dCc0VUMnhaTTc5dHht?=
 =?utf-8?B?Q1FyUnc0SEJPVTJwd0IreVgrZGZnbGkyQUtpQVUzWHN0bDBrdG9pOWtKOGRm?=
 =?utf-8?B?ZkgzMWx3L014ckVFWmdBQW9tK0kwSGpYVlNreGNNSVNoamw2bFZVR0FvYkNW?=
 =?utf-8?B?ckR2OFRRYjlMRThOQks1dElRWUQ4amZDd2dHbXAzdnBGNXNwQzZXdE9kazBB?=
 =?utf-8?B?bE42UDhIWmZ3R2VYeGxFNktybUZ0UUYzRzVKa1Y3WG81c3ZYNUdYMzlNVXhG?=
 =?utf-8?B?M2FtcjhCc3F3dWpkS1VwbUxTbWYzMk5xRUQ1QVZxUjQwTUhNZDBJUWpvKzE4?=
 =?utf-8?B?T01MVWRBL0dWcXBnak9QUm5LbGQ2U2VlZmtvWnUwY042Tm5IdG1zdFcyYXhi?=
 =?utf-8?B?VkJIWndYNkc0bXgvSzNySVlpc0xaNmsvbHArWmlhSHJ3VlJHUmxSTjUxaklG?=
 =?utf-8?B?YkhQL0NUUWRnL3ZBUlZYbEJpelVlU25qK3Z5U1hmSmlpMHA1dHdEemJjN1ZS?=
 =?utf-8?B?eHEzdmRCa0RXMzdMaWhqaEwxK2loZXU1a0ZyM1hsdmZuTHo0aTFsN2Zra245?=
 =?utf-8?B?OVJDaTd6Zkova3pLc3ViQ0VhcHIrQ0duYlhETEc4enJDSkYyWmVKWEtlMklB?=
 =?utf-8?B?T1hCMzU2RTRocDJkOTNCZkdKRmMwZE55d2YwWVJ3MVErQ0h4UUE5WWpwRXdR?=
 =?utf-8?B?UnI3cVBDTGY4M2haeDBHNFdPMlE2bFZxaUtlR1JuTFJnYnl1RHk3ajI5TGkr?=
 =?utf-8?B?cFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70594fc7-c757-46ea-c8f6-08dd457277cc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 23:20:09.6513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hl2waT5QfA8pERbJ2jwikJckQmoEHr2iCKnBFid+wyC6eLSDFUQDuymXKYEiiAg0TxoxhHdaA8XB9cnuq6legrJ0/UM1nIHu/XG4cT2eMnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6529
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


On 2/4/2025 2:30 PM, Lucas De Marchi wrote:
> On Tue, Feb 04, 2025 at 10:09:04AM -0800, Vinay Belgaumkar wrote:
>> Keep track of which events are enabled and number of instances
>> as preparation for the PMU frequency events. Also add locks where
>> we update these structures.
>>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_pmu.c       | 44 ++++++++++++++++++++++++++++++-
>> drivers/gpu/drm/xe/xe_pmu_types.h | 14 ++++++++++
>> 2 files changed, 57 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index 3910a82328ee..10603e7c3eff 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -8,6 +8,7 @@
>>
>> #include "xe_device.h"
>> #include "xe_gt_idle.h"
>> +#include "xe_macros.h"
>> #include "xe_pm.h"
>> #include "xe_pmu.h"
>>
>> @@ -38,6 +39,11 @@
>> #define XE_PMU_EVENT_GT_MASK        GENMASK_ULL(63, 60)
>> #define XE_PMU_EVENT_ID_MASK        GENMASK_ULL(11, 0)
>>
>> +static struct xe_pmu *event_to_pmu(struct perf_event *event)
>> +{
>> +    return container_of(event->pmu, struct xe_pmu, base);
>> +}
>> +
>> static unsigned int config_to_event_id(u64 config)
>> {
>>     return FIELD_GET(XE_PMU_EVENT_ID_MASK, config);
>> @@ -156,6 +162,21 @@ static void xe_pmu_event_read(struct perf_event 
>> *event)
>>
>> static void xe_pmu_enable(struct perf_event *event)
>> {
>> +    struct xe_pmu *pmu = event_to_pmu(event);
>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +    const unsigned int event_bit = 
>> config_to_event_id(event->attr.config);
>> +    unsigned long flags;
>> +
>> +    raw_spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +    XE_WARN_ON(event_bit >= XE_PMU_MAX_EVENT_TYPES);
>
> ^ not compatible with raw_spin_lock... if the warn triggers you are
> likely to bring the machine down. it's also called event_id, not
> event_bit.
> Please do not copy and paste from i915. It's not a good reference.
Not meant to be a copy paste, wanted to add protection to ensure the bit 
index doesn't go out of bounds. The config-0:11 bits should match the 
array size. Maybe check should be before spin_lock().
>
>> + XE_WARN_ON(pmu->enable_count[event_bit] == ~0);
Same here, should be before the spin_lock() in case it is not compatible.
>>
>> +
>> +    /* Save the event config */
>> +    pmu->enable |= event->attr.config;
>
> what does "enable" have to do with config?
We need this info while toggling/using the internal timer for frequency 
stats (next patch).
>
> we can't simply OR any event config since there are more things than the
> event_id. Suppose userspace did this:
>
> proc1:
> perf_event_open(gt-c6, gt=3)
>
>     pmu->enable = 3 << 60 | GT_C6_ID
>
> proc2:
> perf_event_open(freq, gt=1)
>
>     pmu->enable =  1 << 60 | FREQ_ID
>
> now when you close the fd in proc2, your pmu->enable field will have a
> gt == 2.

Hmm, true. We need a per GT event bitmask along with the count.

Thanks,

Vinay.

>
>
> it's not clear at all why you need to save the config. I will try to
> figure out from next patch.
>
>> +    pmu->enable_count[event_bit]++;
>> +
>> +    raw_spin_unlock_irqrestore(&pmu->lock, flags);
>>     /*
>>      * Store the current counter value so we can report the correct 
>> delta
>>      * for all listeners. Even when the event was already enabled and 
>> has
>> @@ -176,15 +197,34 @@ static void xe_pmu_event_start(struct 
>> perf_event *event, int flags)
>>     event->hw.state = 0;
>> }
>>
>> +static void xe_pmu_disable(struct perf_event *event)
>> +{
>> +    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    unsigned long flags;
>> +    unsigned int event_bit = config_to_event_id(event->attr.config);
>> +
>> +    XE_WARN_ON(event_bit >= XE_PMU_MAX_EVENT_TYPES);
>> +    raw_spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +    if (--pmu->enable_count[event_bit] == 0)
>> +        pmu->enable &=  ~event->attr.config;
>> +
>> +    raw_spin_unlock_irqrestore(&pmu->lock, flags);
>> +}
>> +
>> static void xe_pmu_event_stop(struct perf_event *event, int flags)
>> {
>>     struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>>     struct xe_pmu *pmu = &xe->pmu;
>>
>> -    if (pmu->registered)
>> +    if (pmu->registered) {
>>         if (flags & PERF_EF_UPDATE)
>>             xe_pmu_event_update(event);
>>
>> +        xe_pmu_disable(event);
>> +    }
>> +
>>     event->hw.state = PERF_HES_STOPPED;
>> }
>>
>> @@ -334,6 +374,8 @@ int xe_pmu_register(struct xe_pmu *pmu)
>>     if (IS_SRIOV_VF(xe))
>>         return 0;
>>
>> +    raw_spin_lock_init(&pmu->lock);
>> +
>>     name = kasprintf(GFP_KERNEL, "xe_%s",
>>              dev_name(xe->drm.dev));
>>     if (!name)
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h 
>> b/drivers/gpu/drm/xe/xe_pmu_types.h
>> index f5ba4d56622c..b15858d4d4a9 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -10,6 +10,8 @@
>> #include <linux/spinlock_types.h>
>>
>> #define XE_PMU_MAX_GT 2
>> +/* Event config is defined as 0:11 */
>> +#define XE_PMU_MAX_EVENT_TYPES 12
>>
>> /**
>>  * struct xe_pmu - PMU related data per Xe device
>> @@ -34,6 +36,18 @@ struct xe_pmu {
>>      * @supported_events: Bitmap of supported events, indexed by 
>> event id
>>      */
>>     u64 supported_events;
>> +    /**
>> +     * @lock: Lock protecting enable mask and sampling
>> +     */
>> +    raw_spinlock_t lock;
>> +    /**
>> +     * @enable: Store requested PMU event config.
>> +     */
>> +    u64 enable;
>> +    /**
>> +     * @enable_count: Reference counts for the enabled events.
>> +     */
>> +    unsigned int enable_count[XE_PMU_MAX_EVENT_TYPES];
>> };
>>
>> #endif
>> -- 
>> 2.38.1
>>
