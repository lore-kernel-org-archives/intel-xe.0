Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27092D4979F
	for <intel-xe@archiver.kernel.org>; Mon,  2 Dec 2024 06:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC66310E41A;
	Mon,  2 Dec 2024 06:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Umav9TTc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D4B10E41A
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Dec 2024 06:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733122275; x=1764658275;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pI0KPDl4oH0I5vDYHA+t6v9Fd+RNasg0eMP1ZsDqqic=;
 b=Umav9TTc1kDl/szWR9UC4XZNdZk30yugD8G0erY5COUtQ5lYLoQfX05i
 p/1J7L7ac+qInigbA49x5AFzrOi3ay7Ft6dyQmRbUHAx79L/IVSO7HydI
 5zqyNKBosWAYlsinwqwM7GCwhGHnQt2NjSX3C0sat1PR50dp6mlpe8eXl
 1yxDJUeUD00ZrRZHxyPRpjk2U70bXADTvK/xETUKls94vj2YqRBaXp3cc
 MleppsleLk2diHrO0sL7KJnDFDPd1En9Iy+oj28AguXvHw1rpoDB8cVk2
 VlLKrAo1gaZexxjr+n5v3eSjDyQpTR9f3gSIQjZQh2HgHIvV7HwLzITwU g==;
X-CSE-ConnectionGUID: dO3REr8uRjW0Igm9Gw1/8w==
X-CSE-MsgGUID: nqkgnBztSlqbKrL1OgvePg==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33020267"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; d="scan'208";a="33020267"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2024 22:51:14 -0800
X-CSE-ConnectionGUID: XBUEkOgTTbKTxRK36iY/jA==
X-CSE-MsgGUID: VWcp6VVCQRW1EffTj1SvNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; d="scan'208";a="97096066"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Dec 2024 22:51:07 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 1 Dec 2024 22:51:00 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 1 Dec 2024 22:51:00 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 1 Dec 2024 22:50:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9EfgNixKKt8cKisYgi+/MKj7z5AhBb81LScgPdthLSV7ii6kqOjO9Q3HYI3+gn4sTaG0+2uikDAFnefKtQqERdIpDXwpKOOFR8Cyv24WPfMTY8pfs2YgwAqBY1PF99/NuyUkhuU9U02zhiioIWzxcY8cmkJBKzEk022hRJvZAzcBmxDLw4uS0Mbzph5Kq4CQv3pNlIwGSw6WtKv8PM/sqeLMPM8LOwznwpRvQvhoqrnCYuAR8m3+cA+u3IM6qaYbE8wBygzOWqMaHxZPrq5DBOR9UANghHuDwdt2xz+gZ3VcnanHoKWZen7zksdTNBI7b0A5VhPqqMsRqDHgwMzfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YClDZR8Vw/gPzZZ8n2rlaCsRMPalNOCcYdhdSib+4VM=;
 b=EJ4sOx6TZTpd+eyfJA+4Bj8r4Ym+ybPj9IBZ0QaRnXuvAn0jMCGqbPwS8OdQBDzrDUCbnkyBYT4WSq61mfSkwe3TRoIc2mPzHWaTlMUJuK1e+l7ex6tn7CoGFWUZVVN53ysUg9Tkx+ixUSBC2YC8CeoX1Dd2dEppLQEBhHDB+NfBe5tJveB10JICiSaM3xp82UIjCnxzTv/GAceRsmYMOKkwAGefSRURUsNn/wL4cEB0yY9lVWELbakr16VScAm2qquB4/dwG/3iBzkicsL/HQuV18D7/nKPPK5a0va689gCNSA80TNrv5sCA9GfaPjG2zaXAVKYXKd6gYo+5OOsjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by SA1PR11MB8594.namprd11.prod.outlook.com (2603:10b6:806:3b1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 06:50:52 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d%4]) with mapi id 15.20.8207.014; Mon, 2 Dec 2024
 06:50:52 +0000
Message-ID: <9f227ba3-4f59-418e-bd20-dbb462aaccc4@intel.com>
Date: Mon, 2 Dec 2024 12:20:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/throttle: Log throttle reasons
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <Michal.Wajdeczko@intel.com>,
 <ashutosh.dixit@intel.com>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
References: <20241129074300.1304068-1-raag.jadav@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20241129074300.1304068-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::28) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|SA1PR11MB8594:EE_
X-MS-Office365-Filtering-Correlation-Id: e3850b52-7527-493a-fb86-08dd129da98d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bm8vc3g4SWswOXozbzBxY01FdTQxMEFlaDY5RjJIMHAzWERKOUdWV1l4cTdr?=
 =?utf-8?B?bHVPWStkdHJ5dC9FQ0Qwb005UFp6WHNIOEJkSHZGRWRJUlhBTXpYcDlOci9M?=
 =?utf-8?B?UEdQQWxaZnlYSUMvUmRNLzV3Qmlqa2k1cldrdktVUGhBNjE1d0NjVW1lelJP?=
 =?utf-8?B?RldqMkR3ays1alEveEZQUTdJWW1jS2ozRDJ2NkdRNklIbnZ5YnRJdHQvWVhO?=
 =?utf-8?B?cnlCU1E5b29rU1Q2ZFVvcGZvUXlUeVpUWHExVTlDR2pzRmMvZ1VwSmNNREtR?=
 =?utf-8?B?b0I0UlRyNzcvbUEzT0JGUlliUFVTQVo3MktjZmN6TU94RkhpMms3VzNkaTYy?=
 =?utf-8?B?NVhmQURET2FORzgwVG5WdFBSZW82dnNBclA3Y1NWOGduZHMxaWRlaGVtb3NW?=
 =?utf-8?B?dFRrc0VVeks0bGhEeVJKbHk2QUZLL1kwbkczYjR3c0xBZCszMHVrdzRKejAy?=
 =?utf-8?B?TDN6VVE4RmVIM3U4bTFQNWhrRXFjY25SUk5IOHQxRll4U1k2aWRHQy96aG12?=
 =?utf-8?B?dk12REJRdUFhRStWWEFManQzTHBONUxBbnZMU2ZTUU9RSHYrREdRMUd1OHZy?=
 =?utf-8?B?T3Vqa2ZnVnEvN1BLTXFXaXd6Nno5WDFSZ2I3b0ozYXZjWGs0SWpMMXZVRUo5?=
 =?utf-8?B?OVo3S3ppOGNlSHBxVEVzZ2diNlFOSCtPV0xVemJqd25PdnZPUWJWNzZabity?=
 =?utf-8?B?TDg2WlhkQUtWTS9hZE5mM29oVzZQbCswVE5sdElYTzNpNkNQTFhTYThmSGRV?=
 =?utf-8?B?RTI0eHNsbHhEUm9IcFJyZkQ4RWlCU2Rzb3RLKzJFYTR3ZE9XcWhSWWlweXFF?=
 =?utf-8?B?UnhhazMyZ3NMMDN5bGlRRkpYQVltOEZzZ1FnL2M1czFQbXQrM2pUeEhwL0hG?=
 =?utf-8?B?ZFJXdC82SDlablZhZncrdmkydzRsMERSNHBFQUdyY2FLd0tOb3o3NXkvamlQ?=
 =?utf-8?B?V1p4UnU2aEo1WS9Nd0M2U2NhdDU1Y09MYXhDaEh4ZjIyNUFwK01kVUd0ekN0?=
 =?utf-8?B?d09xaDUyVGh5LzZsd2cvMmhIbHphb25PRTg0UUJTdWtraVpJSHZSVW93M0xG?=
 =?utf-8?B?eHBxZUNndmdMczVzWTlrRWkyK04zcEhZcGtWMDBPTnExQ2RXN2QrUmhzQmM0?=
 =?utf-8?B?clErdGNzRE1oTjZPWjVnUGQvM2ppWk1nRTFUVEFHWThSa09TcEtHL2tmbTM1?=
 =?utf-8?B?T3BBQ3VOKzM0VGp3SjhzYThqTkszaUluVHMvODBXLzlKOHlpKzVuQXpYalVk?=
 =?utf-8?B?Y2xBWEFwK3JEWEgrMDdiTENmQmFJWktKSVNLTktLcFZielVLc3JMVERqRlp5?=
 =?utf-8?B?V3BCekNtRmQvVkVLUFpEUmIyRlk2Z2M5ZDd4TVBrb0pyRVRxS0liSzViLy9L?=
 =?utf-8?B?N25GVjRmYXVyaENvUjdvdEU2NUxvam5sc1ExdFczWERTK1V0SVhJUURobWlR?=
 =?utf-8?B?SXc4UVdaTTQyUWlxY1RXUHNBNm1OaS82SlNLOVM1d3NBdFQ1c1h4LzVRWlJD?=
 =?utf-8?B?ZEJyZ0xvVHRYNUNVL2xjNHhVTTFJbVBRMzlCVTFsZjBuVDU4NUI4bnk5QWNV?=
 =?utf-8?B?bElENWdjOWUza2Zsd0h6dHBEZ1BDcEJHYkc5QVJFaEcvbWRnRXBpcGg5S2VQ?=
 =?utf-8?B?NWZ2VnFBSlQyVVpTMklzL0NBOEpWN3NvRzRDUjRxeFBpT20ySm8wWUNBQ3BD?=
 =?utf-8?B?WnhDYTRIL1JROGJjRHJSMTJMUjBialN1bk5XOVdNRG9VUHdpanNFRU1aVjZ6?=
 =?utf-8?B?SFo0UlgyZGxGK3k3ZU10NXg1ZGZnSHRWc1hnSFlDTkhobm0zZGJFV0xQUkRh?=
 =?utf-8?Q?JSqkzsO/SqbzEcYI5kZ1Wur7F8clf33c3Pww8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnJyNG1iYjhybi9MUjhwdFBkTFdBN2ZTMG5OdGFwdit0RVRuZXgyditLU2Ex?=
 =?utf-8?B?SGt3MEc3QnpHMDh5N1duSURMUzJ1Syt5R0RJMlhsa1RmTEZTV09YNlpjT2Fz?=
 =?utf-8?B?SWMxZmtaMW1TNWE2SUVWWWNycWNHYW1ZRGZJekRmUGtSYnlhN3pWVk1pNDBI?=
 =?utf-8?B?S0c2V1R0cFc2L2QvblQvU0tmUlhDY3NvbksxejBHWlBrV1ZBeDl5ZGhEOHVF?=
 =?utf-8?B?YlhLcHZtSVpldS9YU2xGY1VMYVJRNlY4eGF0VWxhQXdlaXlvdjRmVTVSZk9i?=
 =?utf-8?B?R0Z0aUE4MmFqTmlscHQzZ0RDQitXTU5qQzlVc1UxODdTeGZkMlU4Z2NtUTRF?=
 =?utf-8?B?K2VGTFVqeVNJNzBUSVgzb3NsZFJ6RFNibUF4aHF6ZTFVajdDWFdoeTdPNXpm?=
 =?utf-8?B?ZEYxMit6UE1vUGd5UExFSGc0YUY2ZXhWVlZZZUJSeGlzNWlKdkF6OThQZlhN?=
 =?utf-8?B?dmdJSWd4M3BNR3hlQ3hMQlpQRTBKTC8xMFpxa2VqWklqaUNKc2d0S2ZEQTl1?=
 =?utf-8?B?aHB5Qko1T2kxbzZqL3Zxb011UFNKZld0cjh3enNxNE1Hanh2WWRwWndFN21z?=
 =?utf-8?B?TWdwSDRDTG5CMEFxMG5OUU1PaktKL3VpTHpFQWNacU9Xd0lvVzNUckxYaWRY?=
 =?utf-8?B?U1dVZnd2Wm1TQ1lLZTdsbTRhYzBxa1E4RWk2QlBQT1RkRnkzSlRxb2MvbUpQ?=
 =?utf-8?B?OVBvWTA3Y3VPOVV2Vi9WcVhQajI0bWUwV0tuNWtQRXhyQkwyUU94eGFDNWsy?=
 =?utf-8?B?RkZ1aFJxampPUmhZRmxCZmFuNU5PZlBRZmg0b2ZwaGhGc3ZMdmFOSzBscUpy?=
 =?utf-8?B?M3M1SVo4ODJEZDVDcXBiYUtuamlCL2U0UzNIODZQaWxQVEtWS0VFVlRTdXRD?=
 =?utf-8?B?K2xDZGs5MWxGdUVHNTRRbUFYaUF3QUE4aTZrQXhWcHFzZmhOcUVkSFFGVGJj?=
 =?utf-8?B?SDJocm1NNExsUGhzQU5KelA5Y3pBY0QrQXhjdjh2aWIyek55ZFFCNFhMZzFU?=
 =?utf-8?B?dE1LL0s4bHk1MXRkK0puL25vSU4ramhsS1ZQUjNNVm5TbG9WUFp3TmVuRlV4?=
 =?utf-8?B?eFpLOTYwSm1zNHVuMVdJRWJiYjNlT1FiK2U5RHBVT3NoNjk3VjJ4MlYzZVR5?=
 =?utf-8?B?N2xQdjlReXhVbW81RkZNK3F2Z3ZHR3lSUUJZdGhRYVB6Y2xDZ3Z0YU05bGMz?=
 =?utf-8?B?eUplUWZlUXBubmhyQmFmRjU1SHUzUWt2bnRzT1d4Nms5dkRjcXZCMVM0Vmpt?=
 =?utf-8?B?cEtOeTlCaWtuRWszQTdiZjAvRnhoenFTdlVlOG5TalNGZkd0V3lKY0pGT3Bw?=
 =?utf-8?B?RlB0WVlYaXJZeWpIWlpyS2JneDZFWHdFSjZkV2tGK0Z0LzBDRkUzZmEyZTZm?=
 =?utf-8?B?Tit3YmVRQXB6RUNUMVdlRGkrZTZRY3doZzh0SVNCNWN3T09UNzkySTRNUmQ3?=
 =?utf-8?B?ZW1hakttZ1NHTjFva1BFT1lRSW9pVjBPTlZGYS9HN2g5VWZ5V0t6WDkwckFz?=
 =?utf-8?B?bmowZml1NWhtdlBwZ0hYSkdTTnhoZFdkN2RiWjI2eWlQQmswSkY2cy9iS3dr?=
 =?utf-8?B?ZkluLzFVMDdCaVcvdERlbzFLOGRzckR1eGZYQTNzYXluMnBkVDRTb0cvQkgx?=
 =?utf-8?B?WFRNRm9wcGxNdlJtNUdINElHYWdreU5kUjBNZ0tDMXBMVFBjNStoSnc0Yjc4?=
 =?utf-8?B?U3J4SytKdE9uaUZDYTJFYS9vN2kwWHFJbWhEb3hBd0Q3MUJCMVl3Y0l0RExW?=
 =?utf-8?B?QVR3WFNsaWlray8xdEhjdndRWFp6UDNEYmZpQ0VIN3JZbWpVR3NOVHdCakdK?=
 =?utf-8?B?TzZIN3hIZDU1QjZCTElpZFhSSDh3OFJ4YzI4M05jdHYyYm5OZ1NyUllhMVFH?=
 =?utf-8?B?K0FvNlJQazhwMitWM3FVU1RsU202ZTNDN0VUTjl2WC80VXlqNU1JV1EvYVV0?=
 =?utf-8?B?Yk1jMHN1QlM0cTZ6VGIyb0EyMk1JUmZqc0ptekJ1RFZXOHZmQzFhSXNGZ0hx?=
 =?utf-8?B?VjNqcVg0bE5ycnFDU3hLWjR4UEpadWc1ZWlNeXdwZ1JOdHhtTUpia0I0Tnlw?=
 =?utf-8?B?VFFjWFdrSjYvZXBla1JaTVpQQm00ZTBSWXFQeWM1UnRCQ1dWVUNOaWxDN0sv?=
 =?utf-8?Q?i2sNYNZC+A1+sTX71LXcBOKFo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3850b52-7527-493a-fb86-08dd129da98d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 06:50:52.1862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8HKDYocj/aekh0Kb8X7fXBq1ZmNZJD4+9XM5DAbaW9Z4qBlZzv55XuDVu/EgfAmXbj0wYTeeM5LPDukSMKVDTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8594
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



On 11/29/2024 1:13 PM, Raag Jadav wrote:
> Log throttle register MMIO reads which will be useful for debugging.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> ---
> 
> v2: Use gt oriented logging (Michal)
>      Drop local variables (Ashutosh, Rodrigo)
>      Move logging to status attribute and reduce spam (Matthew Brost)
> 
>   drivers/gpu/drm/xe/xe_gt_throttle.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
> index 03b225364101..8db78d616b6f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_throttle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
> @@ -8,6 +8,7 @@
>   #include <regs/xe_gt_regs.h>
>   #include "xe_device.h"
>   #include "xe_gt.h"
> +#include "xe_gt_printk.h"
>   #include "xe_gt_sysfs.h"
>   #include "xe_gt_throttle.h"
>   #include "xe_mmio.h"
> @@ -53,6 +54,7 @@ static u32 read_status(struct xe_gt *gt)
>   {
>   	u32 status = xe_gt_throttle_get_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
>   
> +	xe_gt_dbg(gt, "throttle reasons: 0x%08x\n", status);
>   	return status;
>   }
>   

