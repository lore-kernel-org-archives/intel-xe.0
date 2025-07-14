Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09DCC83F1A
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 23:32:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626B910E111;
	Mon, 14 Jul 2025 23:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7RpNPta";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4002310E0C2
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 23:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752535971; x=1784071971;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=iNOI8k9vmTDQEzJb3K+047wQ0PAAfjdZ7Y1r7Wp4eow=;
 b=G7RpNPtarKhwS7yvp6yWilQbO0NcZxgethxUAV+0RDWmM50uAEXWlfsQ
 NSu6CEJh019XJgHKcYn42+STyDFgu3x3wflqk9VndSc3Wj5cTDxyLWDXi
 QSXdPC7gEeTpLtyDX4nCvCyL+DQyjyikr/P8bmuYfgtNex1mHFl2RlNzQ
 mmHtj1znqrBt5KJD4i37uJIg+QTt/oetT460AtDHstexyBToQJdvxzKr1
 9jE+POWM5oP4GIVl6tG0nYHumy43tDh4XuLgumErIBwvuSA7AkrFgB3Bi
 dmuacIAqdVtwp/whzBoC4CWHQ3x57eJPVuIoLdLozeenJDQxhHSYrVofe w==;
X-CSE-ConnectionGUID: D4lbxX4cQtuaB4t1vL1oYw==
X-CSE-MsgGUID: +9XD8nFhQi2Y2rNUfJI1xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54896380"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="54896380"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 16:32:51 -0700
X-CSE-ConnectionGUID: eiSB7luvTMW9qZlJlc72NA==
X-CSE-MsgGUID: NOlaxUm/SCOL80NOy0cwFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="157609641"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 16:32:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 16:32:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 14 Jul 2025 16:32:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 16:32:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKygQmHUZMPSbzUsTWyK6MWElifvbx/hxPuPVN4wicrB+8G9FfA4fELBGKKeZ9nDCpg2N8yi5lOaKWc+gU14x4wVjpr4KCIt5z28zDUL/rFFZxoU69sEXFDcc0tJDIl/Ozb//1xSVN5BpCdRUalRee99QwrcxKVeO9hMHuJDGsYUeGgRHFHjoZla6YWq7DLKocxp3B6LetdUGFB916arbbDGXiaKfsweFnI27q4xOoBTDcpPnX/eU8T082Ta0p3qwXBsD3bAAofpWYbw5I5dud9HDycbMig9wU7ktiKx4gN8iWsLLb4GyTjLv1giEk3u4EhWpxj1V/64WlzIcY//uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0k5GkdsPmHdX9UV5skHW6wnXCgmO+jTK4bd0kvCeno=;
 b=Glc1DOwBahcZXzKK6i8eNDKAlJeNvVaq2d098ZKM87VSk8GAhBYFp9v5ldunagr7MBpmo43I6+xwBC4sfikrmikNf8Hvze5QiPggCOMNMEtIw/d5rUVMyBv5fTR3KYh9yRQ2oxsp1e6zFtQURoZYsUSoLchRe0GIV/PgeGZVz/vk64p4XUhnkW9k8RYHW/meSfDLlKk2HA/SqGQSUxcAyf1ZAd4pLOzX/9/UyFR//pz2W0UJpTRlCT/CxYob/TixTPSh2+ihWsD6++4dRtbPRsw9nDK6aXmrcDw21JZQenO2e9jdBdhOxJY85AsLy0RQCb9Q1KvQ+sXwXvX/Y7vwZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH7PR11MB6979.namprd11.prod.outlook.com (2603:10b6:510:207::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Mon, 14 Jul
 2025 23:32:06 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8922.025; Mon, 14 Jul 2025
 23:32:06 +0000
Message-ID: <f18a0409-edc7-4399-bcb8-fee92d49553b@intel.com>
Date: Mon, 14 Jul 2025 19:32:04 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] drm/xe/guc: Add GuC log event buffer output in LFD
 format
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250423215821.3078428-1-zhanjun.dong@intel.com>
 <20250423215821.3078428-6-zhanjun.dong@intel.com>
 <d1207c05-35c4-4c2b-9012-635231c8cb08@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <d1207c05-35c4-4c2b-9012-635231c8cb08@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0215.namprd04.prod.outlook.com
 (2603:10b6:303:87::10) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH7PR11MB6979:EE_
X-MS-Office365-Filtering-Correlation-Id: 209c8e58-b5a9-490b-7258-08ddc32ea545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFkxUDYyMGtKVGdrVlBQMEZuNXhPOHNHMXprWWxPaG5vMFd6SkdZT3lYay92?=
 =?utf-8?B?aTFPcXh1K3FqVm9WME1tRXpuZE5zNlk2TFpkMHVkQUxSY1N5RkhlTEZMWGt0?=
 =?utf-8?B?SGc3c29WVGxodWRZU2xTZUl3SDZEdGRBZVF3S1doRXhLOHhiQnJiTUZQblVH?=
 =?utf-8?B?Wkpqei9Ca1NmTFBQcEFjQUtjbFZYM3lpT3k1YTQybXpwWHZuZU1rY1pnTHJs?=
 =?utf-8?B?akt5a0N2bkgwMDYxWWhGWkpZdzVDNG5iVVBENEMzL1l6OE9reGJodE1HVXda?=
 =?utf-8?B?M3VabHN5Ym53SDNnd1N0V0pLK05VdDArc3ArVjUzSXhPbFpYVWFadTNaaXJs?=
 =?utf-8?B?bmp3WXFxS01LYkEwNFVBMnlLdU85WXdBWkhvOVJncDFLUThNTVJhYm10NDA4?=
 =?utf-8?B?VG5BWFFZVFZYYjJ3em1sYzl6bENxblpQY3A1VVFsN1pjL2U5K05HSTA1Zkx3?=
 =?utf-8?B?VUNIaEUwR2s5ODRDRXg0UEJ6SnNCYlFrVkdHM1QveVRudEsyTVRQZ0RZV1Fm?=
 =?utf-8?B?NlQ4TVNRSVJHclRJZW1YN1VIRW9WL08yTnBxT1J6YzdJc2ljVW5obm8vTUJF?=
 =?utf-8?B?L2NnME92M3cxR3JQZXNWT3NBM1BYZ1haZXpXb2s4eUtIWmpUQ1ZYcC8zTitB?=
 =?utf-8?B?ZG5NS3pJQXpNQytYV0IySXNqZXQreU8zVy9Ma1lrK2d4RmMxcDNNdGZDZTFL?=
 =?utf-8?B?NnJCWDlNRXEydmVOVWxhdER3MVpReDJOUkRtbnN3NUZ5MlBYK1JRVjBZNU1Y?=
 =?utf-8?B?YXlMYnBlOU4rVSt0eGNEZkVEdWJSbTNwM1RMbHI1T1g4YUkrcTdCOGxIeUNN?=
 =?utf-8?B?UjM5Yi81UzBTL2pIRlB2Vk1xMFpmbVJiTmVwRUUveHVPK3NSRWpmdUdWa2xS?=
 =?utf-8?B?UURoU2FVZCtDN2dzVWFiSzFoYzdGU3BERmxyR0JxVWRXWGx2dW9MY2NiVE5Z?=
 =?utf-8?B?SDNhQmV2U2NyT3hsa3IraFZvb1VSQTRpQ0N1QllQNjMyZ0Niam5pZjRxajhu?=
 =?utf-8?B?OUJHY2FhMW9kTThjRWpOaEVwQWJNVFVmbE9pdXZQc3FuZEFmdy90dXNGRVFQ?=
 =?utf-8?B?akhCTitvZGZXUlJZaGdVeXN3VDFGZkhkc05DYlpxL2pwaFhHUXNrakR1MHJE?=
 =?utf-8?B?SWxzbWZqN3lzaDBsTTRhWmtLdUsycll3Q2hSakxPWnVWenpwTk4wYWN2M0Rr?=
 =?utf-8?B?aWJ5OXk5MUlVSCs1OHRIVFMwbmJydWt3ZVo0UFF2YVZBOFJCMWg5azFjZ2lN?=
 =?utf-8?B?RkgxUlBCcGF4SVBkVmVpRXJma0hYTElpVjhzUjRML1dabENHSEQ1NGM0TXZk?=
 =?utf-8?B?REIvS1U5WFRoeUFrY1ZDVWE0L1NnWS9QS0t4YXBudjZGRitxYzVMaWwzOGND?=
 =?utf-8?B?WnhkRkhMallmVS9reVlPS3puYVRRRVd5OE1KTTQrYlpCTjhIRXpjQ0pMVHZC?=
 =?utf-8?B?aUhIN04yTHM2Qnk2b0JvVkNDcituOUw1QWREdEQrVkR5U3NrbVBic1BhaytD?=
 =?utf-8?B?K3VNMW90TmlxZElzQThYWGtrejZ1NnV6YytscGR2MmFUK0ZDdEZNRHVuZnJr?=
 =?utf-8?B?OW4zUGJJU0sreFd2N0NQZHprcjBTaE00TE5iY2tjVUZjQnRBVG5qd0FmcXJO?=
 =?utf-8?B?VVVZRi9hd3NiNE5nTkZPOFdNeHR5Y2xqTlArZFlKamdMSFlpU2ZBZmRqSkFJ?=
 =?utf-8?B?SXFiN0NkcEl2dEtCMlczNnpiODN2bjF1VDZrY0k2elJCN0Y4NlRDWThOZ3dx?=
 =?utf-8?B?UDc3RzBIZ3ZSK0JLa05iNlo4MG5tQUVkNjBUaFkxTVVBMnZGR2pmQnRNZHFU?=
 =?utf-8?B?SEdBV1MvbzlIcHNnakx2djM0NERIVFhONkJHSk5hOFFtQzZIeWpxdnpwZXNC?=
 =?utf-8?B?SUY4VndmOW1yUDUrbnR2QzdJNFNpcW5Ra3loeFg3SEI2K3hMWGhlN2lZMzRM?=
 =?utf-8?Q?Cy2xKerrOEs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFlTSjR2MDZLK3VIYnhRbzBUaHljazkyUjhjYUlIVUpXVlIyN2g4QmMxQ2ZZ?=
 =?utf-8?B?OFFtQ0lpTUN3VmpoL3BwNXRqVXRuSm13VmV5NUdTZkUrN1RRSnNmVDJUWHkr?=
 =?utf-8?B?Q0NvKzFOWktTSU5xUTFHdTRJUGpvaTErd2d6cTQxV2VYdDVIRHV1cE9hbGp3?=
 =?utf-8?B?VWlPWXN1Rk14dXZWK3hLTWsyZkpLbFp0S0d2U3U4T2ZwaEZVY1hPdmEvaVBK?=
 =?utf-8?B?N1JYRDlGclVmeEVtOFNWTU54aWlQa0NYUTBrazhmU3pSZlBMeHdjOWZxMWVk?=
 =?utf-8?B?WUROdmdUSGl4d2VHcEJLK2txMFErYm1Wam5IZlVYeFN3SzliZjlkY0RPSE1j?=
 =?utf-8?B?NGlrTzlrMm5seUpTM3RTd2NKRFc3V1JkMzU2ZjR4eWZNdHk2VDFraW5adUh6?=
 =?utf-8?B?alhhNEpKbU1BZzYxc3NESld5QkNiUC9rZURyTGhsd0dWZWtSUDlRTGdXeVNP?=
 =?utf-8?B?VU9yek5OUFlDZ2ViQ2JOYnJyNGJFSGIzZm9tSDJJY1hZeFBoOHBvdzFPd25X?=
 =?utf-8?B?Y3BUYnAxZHFtaUo2OEJKV214TDJtV0VzTFBWMnkxeUFDcElqRW1MZVJCSzVB?=
 =?utf-8?B?ODRoUzEzZVJYR2kxaDhHVHJtc1NEell4UXArZVN4RnA2MVM5WEtGWklSRVlI?=
 =?utf-8?B?S2lKaStxa3U0RitXOUlRQWlYUyt6Rm1xcGxMQk5ycTk0dzdwMXB0TXRndEVZ?=
 =?utf-8?B?YzNtTVJNeCtnTjQyQ0hIdWVGYzhST0pKTEQweWZYemZtRWNvUStERkNRU0RK?=
 =?utf-8?B?LzZYKzJQWEdrdldTZzM4Q3M5MWJWSjEvcG5ESlVDRnpsN29LN016VERHRTNq?=
 =?utf-8?B?UUs5SG9ScUxUcTB1ODFGcHRBTmtiYmthNnlHMkVZM0xGUjZrbDM3Sisrbk1D?=
 =?utf-8?B?bjhVbW5Pd0E3My9abGordVFvVlNwY1dlZGNyc3d1dWJMSzFYUHc3d2YwV29N?=
 =?utf-8?B?ZDNMa3BBUENWWTBiaW5zNU5xMDV5b0hMdHp1Mnk0S0cvc0pjVmZPUnFBUTll?=
 =?utf-8?B?WnloQ09xakMwUFZYa0dRY0svNHVmNWZtSHZmRmRMOGlWMWxTZlFPQThaTzc5?=
 =?utf-8?B?TWFJSE1SRGxpY0cvZHJtZmlOcHhXVCtsbUpMajhWUFE2ZVpjdHNUeEhtM1VQ?=
 =?utf-8?B?Q3ZiS25HSVRSc1NRS2hTRGdKeEtDZzVoL2lsbEVuRG43dmh6ZXlneDNBN2dJ?=
 =?utf-8?B?MVh5TEFMSU9QRWJMUHdKQzBCSHZCaURiNnBGNFlLbnJ5c3c5N21adytndGVT?=
 =?utf-8?B?N2FOa3hPVGJ6UzRPNmtrcjVkSGprSkNtam9zZ3hvUGhseUJPeFhTZVM0THp0?=
 =?utf-8?B?R0FvV0t3L3d6cGVQVFRCUzFXblhMdnI1UTl3QW8rZDNlek9FUnprUVFaUlZL?=
 =?utf-8?B?ZTh6K1plN1ZXUHdZOVhJRmhSRHUwcStxNHJNMG1jL0J4Y2g0emhhQ2xPOE9y?=
 =?utf-8?B?VExsdExMTVpPa2VBK0x3RU9EZnBxOU1qQVJtc21hNkFLWENweURGSEhwVGJH?=
 =?utf-8?B?SEVRQVBkUU9oOVV5cFhTMENza0ZyblRkVDFWb2pTQllwL1M2a0pkdytUSG0x?=
 =?utf-8?B?amw5ZGpUd0lTR29Kaks1UTZCb2loSGZ5bXFLRDNLOVhEaTRIS0liWU5PcnE5?=
 =?utf-8?B?amZtV1d1a3lCVDBwbTVzOVFybTdQRmZ5akk4djd0ODE4a0llemJSWEMrTlhG?=
 =?utf-8?B?SldyREhNdUlueE1vSFNFQUF6TGVya3Fwd3ZJanIxd2RTNWZ0QnNtMHlhMkN2?=
 =?utf-8?B?ZXJudlhicUgyTXpOZEdvNEFHTCswQXVxVkc5amRyaUJFdXNtYTdDSnlMbHNn?=
 =?utf-8?B?Uzk2dG05RVozQlBxRG9kQlBoakpCd29FNTMyeVNkeHY2M0ZhUHpMSE9wT1Az?=
 =?utf-8?B?MCtIUzA0aTQ3bHNpMVNXZnlZWmIwbVBiQS9UaTM5T0pMbEUyRjFJUUNSN2tp?=
 =?utf-8?B?cjNBd3lvR1oza04ydVRabFprT3NNZW9LNDE3aTNKQnJpRldSOUhrRTFMOG1x?=
 =?utf-8?B?V0dxSUpmbDhPWVZTYTNJNzZQYk42U2N4SUZKQkY2QzEyc3hHWkpJS1JQQ3Vn?=
 =?utf-8?B?a1lCOHJOYzBSRloyNXVNZXY0VkxUdjY2UXB0Q2VMUnJCMnpqOTNBZWNkNHVo?=
 =?utf-8?B?cjZXOFJJWFdNaVhiRzQxOWMxY1BZRjB2aGQxUEJEcERQWjQvZ2czQVMvVWVI?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 209c8e58-b5a9-490b-7258-08ddc32ea545
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 23:32:06.6762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bqWVcfffA4MdGsGoHMNxwjb+k5TM7xRxICNgtJZY1dc3P84HpdhG9IZRaOe0ibI4f+tVY2b2+ujU+p8jjRA2pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6979
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

Please see my comments inline below.

Regards,
Zhanjun Dong

On 2025-06-28 10:46 a.m., Michal Wajdeczko wrote:
> 
> 
> On 23.04.2025 23:58, Zhanjun Dong wrote:
>> Add GuC log event buffer output in LFD format.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_log.c | 87 +++++++++++++++++++++++++++++++--
>>   1 file changed, 84 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> index 3fdf3823e2d0..5aa9b9dbe3f3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -33,6 +33,7 @@ struct guc_log_buffer_entry_list {
>>   };
>>   
>>   struct guc_log_init_config_save {
>> +	u32 version;
>>   	/*
>>   	 * Array of init config KLVs.
>>   	 * Range from GUC_LOG_LIC_TYPE_FIRST to GUC_LOG_LIC_TYPE_LAST
>> @@ -336,7 +337,6 @@ static int xe_guc_log_add_os_id(void *buf, int buf_size, u32 id)
>>   		return -ENOMEM;
>>   
>>   	strscpy(os_id->build_version, version, info_len);
>> -
> 
> unrelated change
To be removed>
>>   	return xe_guc_log_add_typed_payload(buf, buf_size, GUC_LFD_TYPE_OS_ID,
>>   					   info_len + sizeof(*os_id), os_id);
>>   }
>> @@ -366,6 +366,7 @@ static void xe_guc_log_load_lic(void *guc_log, struct guc_log_init_config_save *
>>   	int i = 0;
>>   
>>   	memset(config, 0, sizeof(struct guc_log_init_config_save));
>> +	config->version = p->version;
>>   	while (p) {
>>   		for (i = 0; i < GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT; i++) {
>>   			if (p->marker[0] == entry_markers[i].key[0] &&
>> @@ -380,8 +381,7 @@ static void xe_guc_log_load_lic(void *guc_log, struct guc_log_init_config_save *
>>   					p++;
>>   				} else {
>>   					/* Load log init config */
>> -					xe_guc_log_loop_log_init((void *)p,
>> -								 config);
>> +					xe_guc_log_loop_log_init((void *)p, config);
> 
> unrelated change
To be removed>
>>   
>>   					/* Init config is the last */
>>   					return;
>> @@ -417,6 +417,86 @@ xe_guc_log_output_lfd_init(char *buf, struct xe_guc_log_snapshot *snapshot,
>>   	return index;
>>   }
>>   
>> +static void
>> +xe_guc_log_print_over_chunks(struct drm_printer *p, struct xe_guc_log_snapshot *snapshot,
>> +			     u32 from, u32 to)
> 
> guc_log_snapshot_print_chunks(
> 			struct xe_guc_log_snapshot *snapshot,
> 			u32 from, u32 to,
> 			struct drm_printer *p)
> 
>> +{
>> +	int chunk_from = from % GUC_LOG_CHUNK_SIZE;
>> +	int chunk_id = from / GUC_LOG_CHUNK_SIZE;
>> +	int to_chunk_id = to / GUC_LOG_CHUNK_SIZE;
>> +	int chunk_to = to % GUC_LOG_CHUNK_SIZE;
>> +	int pos = from;
>> +
>> +	do {
>> +		size_t size = (to_chunk_id > chunk_id ? GUC_LOG_CHUNK_SIZE : chunk_to) - chunk_from;
>> +
>> +		xe_print_blob_ascii85(p, NULL, 0, snapshot->copy[chunk_id], chunk_from, size);
>> +		pos += size;
>> +		chunk_id++;
>> +		chunk_from = 0;
>> +	} while (pos < to);
>> +}
>> +
>> +static void
>> +xe_guc_log_lfd_print_from_chunks(struct drm_printer *p, struct xe_guc_log_snapshot *snapshot,
>> +				 struct guc_log_buffer_entry_list *entry)
> 
> I'm not sure if having this function helps,
> IMO better to keep this code at the caller, where you are already
> accessing the data from the 'entry' in "Calculate data length"
will do>
>> +{
>> +	/* Output data from guc log chunks directly */
>> +	if (entry->rd_ptr < entry->wr_ptr) {
>> +		xe_guc_log_print_over_chunks(p, snapshot,
>> +					     entry->offset + entry->rd_ptr,
>> +					     entry->offset + entry->wr_ptr);
>> +	} else {
>> +		/* print from rd to buf end 1st */
>> +		xe_guc_log_print_over_chunks(p, snapshot,
>> +					     entry->offset + entry->rd_ptr,
>> +					     entry->offset + entry->buf_size);
>> +
>> +		/* print from buf start to wr */
>> +		xe_guc_log_print_over_chunks(p, snapshot, entry->offset,
>> +					     entry->offset + entry->wr_ptr);
>> +	}
>> +}
>> +
>> +static inline int
>> +xe_guc_log_add_log_event(struct drm_printer *p, char *buf, struct xe_guc_log_snapshot *snapshot,
>> +			 struct guc_log_init_config_save *config)
> 
> guc_log_snapshot_print_events(
> 			struct xe_guc_log_snapshot *snapshot,
> 			const struct guc_log_init_config_save *config,
> 			char *buf,
> 			struct drm_printer *p)
will do>
> but do we really need this 'buf' ?
> those lfd headers are quite small and could be defined on stack
Let me check and might use stack on next rev.

> 
>> +{
>> +	struct guc_logfile_lfd_data *lfd = (void *)buf;
>> +	struct guc_lfd_data_log_events_buf *events_buf;
>> +	struct guc_log_buffer_entry_list *entry;
>> +	u32 data_len;
>> +	int index;
>> +
>> +	memset(buf, 0, GUC_LOG_CHUNK_SIZE);
>> +	entry = &config->entry[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG];
>> +
>> +	/* Skip empty log */
>> +	if (entry->rd_ptr == entry->wr_ptr)
>> +		return 0;
>> +
>> +	index = xe_guc_log_add_lfd_header(buf, GUC_LOG_CHUNK_SIZE);
>> +	lfd->dw0 |= FIELD_PREP(GUC_LOGFILE_LFD_DESC_TYPE, GUC_LFD_TYPE_LOG_EVENTS_BUFFER);
>> +	events_buf = (void *)&lfd->data;
>> +	events_buf->log_events_format_version = config->version;
>> +
>> +	/* Adjust to log_format_buf */
>> +	data_len = offsetof(struct guc_lfd_data_log_events_buf, log_format_buf);
>> +	index += data_len;
>> +
>> +	/* Calculate data length */
>> +	data_len += (entry->wr_ptr + entry->buf_size - entry->rd_ptr) % entry->buf_size;
>> +	/* make length u32 aligned */
>> +	lfd->desc_dw_size = DIV_ROUND_UP(data_len, sizeof(u32));
>> +
>> +	/* Output GUC_LFD_TYPE_LOG_EVENTS_BUFFER header */
>> +	xe_print_blob_ascii85(p, NULL, 0, buf, 0, (size_t)index);
>> +
>> +	xe_guc_log_lfd_print_from_chunks(p, snapshot, entry);
>> +	/* log event buffer content did not use buf, exclude from size count */
>> +	return index;
>> +}
>> +
>>   static void
>>   xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
>>   			      struct xe_guc_log *log)
>> @@ -441,6 +521,7 @@ xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_p
>>   		goto lfd_out;
>>   
>>   	xe_print_blob_ascii85(p, "[LOG].data", 0, lfd_buf, 0, (size_t)index);
>> +	index = xe_guc_log_add_log_event(p, lfd_buf, snapshot, &config);
>>   
>>   lfd_out:
>>   	drm_printf(p, "\n");
> 

