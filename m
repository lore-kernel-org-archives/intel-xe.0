Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351C6C02182
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 19:10:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FF110E1E5;
	Tue, 21 Jan 2025 19:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eQX7zLdM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB1010E1E5
 for <Intel-Xe@lists.freedesktop.org>; Tue, 21 Jan 2025 19:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737486632; x=1769022632;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=q6JPDhoI+saYkc1jCrgkM/I30DjJjSkG5MLJji0wpXI=;
 b=eQX7zLdMkMQssd3FqI2a8WiPIX+sHlIcO1m60Fo85vEQFeHSSEnsmu9m
 JDIY+aXEdzTalpQ9BJkGKC0s/Tl8XTvyt6egbauv2jG/D6SV+L6unzygG
 iOWUeVVBiooazoRvmAF4yksxAkPOoltoj81nYWgcPtV0q/yBaR8fZ52EI
 7jDCXzOTK6dRlGQj5sWjnXBZyEBxuQf39VlremUHfhYU5Pb3d3UbH9KqV
 OIxfs57G0WoqaWG/3ik1W/gx1B8D3SpO1ZIp0cSNfZ/jwEBVRAjQ2yDtQ
 p6tTuiFqRb2FrdDm1vTIHXeKxhikwCgZveH8xeQBzq1NoJl5A4jaSdF9T Q==;
X-CSE-ConnectionGUID: gMoGtjQSSM2DAIYR1yOL9Q==
X-CSE-MsgGUID: 3HO5iBgNQpKIEtSY3pymSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37942851"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="37942851"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 11:10:30 -0800
X-CSE-ConnectionGUID: cQMiGXpnRSG3zITxTbkNWQ==
X-CSE-MsgGUID: 78FB8++9Qian9/TujkU4KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="111887109"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jan 2025 11:10:29 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 21 Jan 2025 11:10:28 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 21 Jan 2025 11:10:28 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 21 Jan 2025 11:10:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hLlo4rT9rEcv9JsqbGL/TqJ3Dls2pYsPPxtOkhqcwSwu3INhNOsIqYUl8C2QMqiybWWhq5YQlLt1H9hHMmCj1eIdQejuLwc1PMOMnsRcLa8bcSndnBNNrEt/jmQcf6hHoc2jInFKWvpM2liqrLtMQdAjyq7z13Ycs4WZDLfj/vb+K7DkNudGwHYFpwzFWhu/CnM5+YF9TfDEBJivwD6hwkQTb1ShSL47KC8aLq+FhADIUVSkgPMzKK50A0AE45VvV/xcS3BrlceLhngMw5dipomMVaIR1fUMi+MclPAkiu7bRmJ/ZCbgeoCGJQPzmskWuYxn3CTJiubXQmyCTLTLTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2b+5s/vjNe1BZ7A6Vv/hX+HvywFbyBsxDdyb6y9Fnc=;
 b=KuwMSiC7QPdqWDjWYJGkNDRDw89UeiVuUgInOs80dMghrAYk0aIa0JM0mbU+py1xPRwJfW6+VAjr1s6RRwxn491Y0m6xtvVGbi7NL/3fQuQ7l1RrJARPfn6dKe7CsAbASFaUPW5GikYNV5WEmu8PzF8QKJvXEDYk01+HA6Qx2KvuUd/ecfftqAJUXMlR2Uc7Aq1XrGH6NlbTzUe/FZAtSk2XiB3U5y68LDvWkIh+79EGACxJffi8pcsIQcVXSdFvsLyoNMGekXZjb6Zsa3CGV+wuwjHgxlRnmNrzRRvZGbfcwUAvC58gVKg0zh0VcT0iKpuXUwLBO5cyfZ+FdXP3nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CY8PR11MB7194.namprd11.prod.outlook.com (2603:10b6:930:92::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Tue, 21 Jan
 2025 19:10:26 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 19:10:26 +0000
Message-ID: <24263415-c44d-47d5-bb92-d3fbc0aa356e@intel.com>
Date: Tue, 21 Jan 2025 11:10:24 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Upgrade complaint about missing slice info
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>
References: <20250118005403.2960807-1-John.C.Harrison@Intel.com>
 <02d1075214e3ba35645686c1cb479dd5c74b5571.camel@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <02d1075214e3ba35645686c1cb479dd5c74b5571.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0283.namprd03.prod.outlook.com
 (2603:10b6:303:b5::18) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CY8PR11MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: ee5de70a-3a1d-461c-1b45-08dd3a4f435d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVloQ3hkYTFJbEhMLzdQSm51UlZsSHVTZ1p5U3FjNFRrL2R2V2xMRWk5d3kv?=
 =?utf-8?B?UVg5bmdkZU1IQ3NCMGlEVXBsLzRRRjlDNnUwMkdkd1hTamRZOWpSaW1kWVdT?=
 =?utf-8?B?NXdtcHByTVlHY254ZVlHVzl5YUFnUGEzREo4ZG4zRXVrWVFqMlhnSkZaRUp0?=
 =?utf-8?B?SFFQcHRHd3R5VEdlblhmZTh4Wk1SL2JhVXlUMmphWDlqMWc0OWxMZnYwZjlB?=
 =?utf-8?B?MVF2dW9KUFR1Z3F3dEJDNXVvbmV1bGJPWkVNbzkrK1o2Ky9Kc3d0VGFIZ056?=
 =?utf-8?B?cktzekd4UFlRNlpMVmhZQkppYWRtdHBld2twN01NZi95blpUbHowY2JybC8y?=
 =?utf-8?B?UEpnbVU2ZDljelRaT3RmVWtrQzZmcUNodW5mRFhucitpQk1HSXZCcGUyQTJo?=
 =?utf-8?B?VlllRnFoK25BZi9iUzRxOXZEMXB6bVNUNXptQmZTVzdGL2YxMWZ6UzVoT1px?=
 =?utf-8?B?TlR4TS9FT2VrZXRZN1E1WjNXUnEvR0Mrb3FDZFVDVFFsZTVZbEpmckt3OXVM?=
 =?utf-8?B?eVBWR1Nsd0g5Wk9EQlAvL3pnWXF0TG1TcTdWQzZadnhTai9LS2Y1R3lQbk4r?=
 =?utf-8?B?Yzh0RGU4SjYxaHZ0RVEwemxzTG9Va1lUL2pOZXpFdmVqN2Rwanp2Ui9Wc0ZR?=
 =?utf-8?B?OFJQaFNuZUpIWmVVTE5HZUY3ekZUQVVDZWU5T2FNT1VnSjdGdEQyQjU2aWxV?=
 =?utf-8?B?V29oWks3bzlGaFBNMjl4QzIzL1NacmZreFM2VDdTQWtKeXFIckFxU2FtOElQ?=
 =?utf-8?B?SFNRUTVFWnlwNVcxcnh4N09WcFlnam90Q053UWdLK0t5Y0hHQWg1MC80Mjdr?=
 =?utf-8?B?WnREb3ZXbTNDakRYdWJvcU9JZXl6aUN0Qzh1VnlvME5KeFpqWWJKU0Q4UWZ4?=
 =?utf-8?B?VC9Wak5xZzk2TWxnNVFNK05iQXUrRHhiS0kwMWNnMXBQVjlhM0h3NXVOOFBV?=
 =?utf-8?B?ZnA5N3R6Z0RHR2RYbUloSGFLT25zYXlLQVZMQUI0cUx4blc0ZUswNXZGeHBv?=
 =?utf-8?B?YkQ2S2lNYjVXV3I0TER1cDZhTWQ1bmltekUxSHJaZHpzczAzejNnbUJ3enN6?=
 =?utf-8?B?S1orM0tCd1BvYURvM3lNa0toNXRWVnN3eVE1UXlHLy9oKzVPQjB6dnJkYWh4?=
 =?utf-8?B?SUpJaFNFZFBJdytSYVNRNXg0Z3p2MGFlQUNZc3c4OGZDV1k5QVliQmNKTUtB?=
 =?utf-8?B?MkRiNGdkOWlZbmM4Z2tIRklEN1hsOWZJaGRyMC9qcGdBWmNtUUJNQnpMQ2FY?=
 =?utf-8?B?L3dtbFdPNWRnYUNwYnl5cmRTRkhrREFDdnVpdy9yOE9KWmNqWXQrUEs5U09I?=
 =?utf-8?B?OStIeWVlZnBxZmxZZjFDeWFGakVzeEVyQnJDK1NTU3YxU2c3KzE3OTZTOUhq?=
 =?utf-8?B?empkZFhvR2ZQaHNWSU8rdDZVcFRtdGt2MjYvUU5FZTVkSjVEbEpRRTBRQWxN?=
 =?utf-8?B?U0w4Y3dOaW5BZmcwQUg1MWRVdGIyQlEzM0I4bktBMTdLbFFFd0k4UkpEcGpt?=
 =?utf-8?B?eW1lck5nZzNYY2hOQXJxdjhoa3FxVjhuNWRLZ3FQdTl6cXBjMHJDTkp3anBI?=
 =?utf-8?B?UmZmN09DczlaUUpEQThFeVJvZzdsdGV5Tzkycm11Zk16RGIrNEpwUThlbkN0?=
 =?utf-8?B?TUZQTUlLOEo2Nzk4bERUUVFvR2NpMC83cUxSS29PU1c1WElpbFpaZ0FSdlR6?=
 =?utf-8?B?RnpOK3hXVEFwRU1ic2J1UnVqMnNwVG52bGtUMXJ4cG9GbUJIaCtXL3NidFUv?=
 =?utf-8?B?UHQ1NkZzMEFjNDVUK203MUVoY2pTMUFwb3Q0ajQ1RUNRSjBYWE9OVHlDMGUy?=
 =?utf-8?B?dmFmNUY5bms4T3J2QmNINUpZSmhTcjJzTlFPc01LRVhvY1BGTlhtaHRJK0E0?=
 =?utf-8?Q?ZtVD/kH+GZqvi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDd0WFlYWlY0UEk3VVIyQmRYNHNDWlZLNlprQ0JoUXVWeUtNK3BLSkN0SGZ0?=
 =?utf-8?B?UzF2WWUxQ0tXQlZxTnJraTVVY1RVSm1ib2s0WXN2d2tSVlFhN2VwWFY1amZr?=
 =?utf-8?B?RnAvOS9EczFQSmxiN2twYVBEOVNtVStIOW9iQXV2NnV0ZmRLNy9ULzM0c2tD?=
 =?utf-8?B?NUwrbWU5U21GNTdCaUJuUG5SWVFQbGVJRkxTQi83SDBtYXNjVWg5cG83YSta?=
 =?utf-8?B?Rmo5bHplRXJWNGdUNGhqMmh1Mm1ua3R4MjM2a1NvSWkrZXVoK3BDSjRId1Nh?=
 =?utf-8?B?THBYMTZoMUZNK3Q0bnhrR3FwSmI5eXozdTJJWlArMStUT3V4ZzBLQTB5K05s?=
 =?utf-8?B?cUJBZGJkNmo2K0Ryc0JDTWlnaGJ6dXVxNzQrZDJZbXQ2RWljRXg5NXhBcUN4?=
 =?utf-8?B?aXZIZVZiL3ZCeis5clpJR1dhNFpNT3NjTXJLOGFBaGdPN09uRmVxQ1RYRnJy?=
 =?utf-8?B?MHBJalk4M25ud3J3RlQ2ZS92elJMT3lUMkw0K05RdWd1TUdwMFd1QjRFMUNB?=
 =?utf-8?B?Y2MvbEc4TytVYmozNVl4TE5UT0NzOWUwVThwZ1VvY0dSVVgrRXVtd3VUMm10?=
 =?utf-8?B?T1p6VG01T09jNVdubHQwc1FQRDhOSHVoMlV6THlsdUk1MW1VYUZmZkplWGJm?=
 =?utf-8?B?MWY1Q21OUlRCcHZ6OXkwcUNJcGJvVm9ZbWpvVVpwWEQwRUNsV1QyazBBNngr?=
 =?utf-8?B?Y3Jnb1BDdnJWY3pHemxPQXhmVEh2ZWVta0N1UXRjWXlXZE93WVlCOENLcXdL?=
 =?utf-8?B?djlkdG83QThpT3djaVN5YTdqQ0d4U3UxTE5FV1REUExUK1VPUVordktWTlcv?=
 =?utf-8?B?RHZ1dmUyWFlUZ2JCZ2pGSm9NSkFUZjhDWUR2emp2dFN2S3M1Y2JSbFNrVkRu?=
 =?utf-8?B?ZzF2SC9SeHgxT0hvOTVxZHlOamNnNlpRczBrcEhzVWh5WFpkTXJ6VzRmOWF1?=
 =?utf-8?B?NGJqOVM3MmZvcG5TV1hUTmxqUzU2M2dGT0V0UDYrU0VGMUJBWUEzWDBtQTFF?=
 =?utf-8?B?bnRORG1xcU1OMVZITGdtQXkwVTZsYUNMSjlDNkJ4L3R3bldUZERNenN1QTFB?=
 =?utf-8?B?Mzhyd1I0eWluejR3bmkxckpwcDdGbDNoUHhscnVRVlFMeHNQNVUyaytieXg0?=
 =?utf-8?B?MDNEWWF3WGUwR1EwcnplQmNqdG1XelhUQ0NIOVZsd2wzaWdGbEhBL0Z2Mlcw?=
 =?utf-8?B?eVgzMlJFR0R1WHliR0lIMTY0bWE1RWkxWEZGbnNTblV2YVZEcDRidmQramlk?=
 =?utf-8?B?VklCRUo5eXMxMFpkMHpLSktGdkR5OFBkaStVSy82QVJQc3N0OXV2QkVseUF5?=
 =?utf-8?B?M3VOZjR5Vmt1UVErcWxKYjhyZXNNczQyRDhGUEFhVlBVamhaekthU2NBdXl1?=
 =?utf-8?B?UllwLzdTc0NQTGI2LzNTZ1ZpWXZibTdYL0Z5Kzl1MlNYRTZIbkcyc3hFZitR?=
 =?utf-8?B?TjN3aUxNa3JxS2U2SXNyT2lYaXVXRjd2RzVrR3dxM3RWOXZwdlFML2huQTFs?=
 =?utf-8?B?RnI1aHB1SG5CRnZsb0xrS0JpV1BPeVA1Sm14blZHZjFCVkl6UVdtVkFsK1dK?=
 =?utf-8?B?Y1lzYWhUNkFKLzFVdG0vWWRLbndIUzg5RGZoZWE0R2tkWURLK3lkaURlUkNw?=
 =?utf-8?B?Ujd4QWVTT1RkNEpjZ1ZtYm8za1UrUnZTeWsyMWFRYzNnNW53Rzk3VGV0NWVI?=
 =?utf-8?B?a1kvUjlHQUYyVmJqM2RtN3lBdWdYOURoKytTUVUraXFwMlozRU1iVUpRTWpU?=
 =?utf-8?B?bVdINXdGNmk4UG5JUnV3dzJzcHZCd0FZUmdaRitnRFo0c3RJRUVuSHJWN0pw?=
 =?utf-8?B?cHdaSElwNkhMd2hnS0wwa3JpZGhURGpmS2hXU2x5UHJpdEhid1VuZXFvMVgz?=
 =?utf-8?B?RWVXSEJpSHo2TTc2NUE0NXVDN3BXTFZvV05NOGpjb1FBWGRuWklTamhYZVpj?=
 =?utf-8?B?VnNlNEFpcnRrbHFwVkQrLzBkS2FsRG44VURsNlB3Zm0yeU13WVpEa01VUC8y?=
 =?utf-8?B?SU50T0ZRUkh1YldWNTdKdFpWMWNVaklFNlQxOGVXa1lPNzNhejI4U0ZvdWts?=
 =?utf-8?B?UDRsNXVnYmprTzgvWEh1d1VOR3RoNm9IVUlsMkhPRDIvMEwrUlArcWdQZVl6?=
 =?utf-8?B?NC9TNWQyUjZqT1JQK0dncU5XUlppaVJKa09hZ2laWTRncE02ZUVjbVoydlpN?=
 =?utf-8?B?VGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5de70a-3a1d-461c-1b45-08dd3a4f435d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 19:10:26.5528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKbCWp3SjxpCJJp4n0Z/AgHgYxlXhYaBUmsvwKDWgvPbbxMJRU6aG+OWkXL6zemxU/gQsd47AmNQp/fUbfSJTymLJX/NFAvkVoxKI5yDcd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7194
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

On 1/21/2025 09:42, Summers, Stuart wrote:
> On Fri, 2025-01-17 at 16:54 -0800, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The steering code needs to know slice/subslice counts and this
>> information should be retrieved from the hwconfig table. However,
>> earlier platforms don't have it, hence the KMD has a fallback path.
>> Newer platforms really should have the entries and if they are
>> missing
>> that is a bug that needs to be fixed in the table.
>>
>> So update the complaint to be an error on newer platforms and remove
>> it completely for older ones that we know are bad (but are not POR
>> for
>> the Xe driver anyway). Also, re-word the message a little to make it
>> clearer what the issue is.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_mcr.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c
>> b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> index a1676b787fdc..605aad3554e7 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> @@ -341,7 +341,13 @@ static unsigned int dss_per_group(struct xe_gt
>> *gt)
>>          return DIV_ROUND_UP(max_subslices, max_slices);
>>   
>>   fallback:
>> -       xe_gt_dbg(gt, "GuC hwconfig cannot provide dss/slice; using
>> typical fallback values\n");
> Agree with Rodrigo that this is still interesting for older platforms
> to show the expectation.
But it does not provide any useful information. You might as well just 
have a loop on initial driver load that prints the warning out ten times 
for any platform prior to LNL. The comment below has all the information 
that the above message tells you (and more, because it actually tells 
you this is expected rather than unexpected). There is zero use in 
spamming the user with debug messages to say something that is an 
absolute guarantee on a given platform.

>
>> +       /*
>> +        * Some older platforms don't have tables or don't have
>> complete tables.
>> +        * Newer platforms should always have the required info.
>> +        */
>> +       if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 2000)
>> +               xe_gt_err(gt, "Slice/Subslice counts missing from
>> hwconfig table; using typical fallback values\n");
> I understand the intent here, but IMO it would be better for this to be
> a warning.
Whereas, if this is a platform which is supposed to have this 
information then it is absolutely an error if that information is 
missing. Something, somewhere is broken and very definitely needs to be 
fixed. Also, while the fallback should be accurate for the platforms 
below, that is not guaranteed to be the case in future. In which case, 
using a fallback may lead to incorrect register accesses. Which, again 
is very definitely an error.

Either it is a new platform and someone forgot to add that information 
to the table. Or it is a new platform that does not conform to this way 
of accessing registers and thus needs a KMD update to support it. Or it 
is an existing platform that got broken because of some regression bug. 
Either way, it is something that we need to catch in CI before the cause 
of the issue makes it out of the door and on to end user systems.

John.

>
> Thanks,
> Stuart
>
>> +
>>          if (gt_to_xe(gt)->info.platform == XE_PVC)
>>                  return 8;
>>          else if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)

