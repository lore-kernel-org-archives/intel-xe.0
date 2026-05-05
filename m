Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3855FF885A
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 05:16:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576CB10E021;
	Tue,  5 May 2026 05:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h/EVEh3l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD98A10E021
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 05:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777958185; x=1809494185;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qE5ttqrioDTOXUMOFlSUQASFEoBg4zHOI6okl4xl5Qc=;
 b=h/EVEh3l3NjZk/867+WBLcRgZDiAXLptkLXjEByWoeUD7/qDj4s9tOwh
 D0HE0oFQsRWoRfME6Qm6AF3qxg36xTMNi+NuXWPUr137jNkhs61cIAoJV
 503REdTNE6FGCwGCb+8Y7LAHx+4XIBae7kjxxGVzqi2tu4RUwRMdZrvcI
 q6XfazXT/4Fj1sMAhFBo+9llwH8Fwq14tsEyb+pMZQ53LLUnRZ3RxK1FB
 ARqxEAq9VphT2qh3LLKq74+mStgjkOC5mLkHoR2DaZxkHnqooZDbvEeRr
 CL4mtpMQr/TQCZIWRf7El9u6vQlPvStWd3oL9HNyThWnKQId7neCDNCph A==;
X-CSE-ConnectionGUID: k7y397e2Tkqa1XBQYz18gQ==
X-CSE-MsgGUID: XcrePnkeQC2VntEAl+zJWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="77978436"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="77978436"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 22:16:24 -0700
X-CSE-ConnectionGUID: Vs2JoGb1Tzm662UCrcHTIg==
X-CSE-MsgGUID: Tj0I9AAYSbqRvDDj9BX0yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="235764287"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 22:16:24 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 22:16:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 22:16:23 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.4) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 22:16:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YWPwYeoAiBSPj0ya7Msy97lybUs5D/h4mzQcnh/MuLDwr4cKrP3+GS96GX0magDfFahUPNbB567zwTy6J3hMQq9wJmReO87J7t5weqaIpIjzM9/o5qGImWSCX99bDhRDtDGmcwhe4o0JsJjzlsRmEQ+4CX9XVKMB7nqUm72lr4Z7T34Vq7FZFcTktfYoVA34oCgYxUd9fEjEs6mUJ7FCKlfwwnckGA+IYDHdevOPu7imVGavXMyclSAiZSsXYb5JF9W1I97h0IBsJCRu709kF8ufjIfj2ZRrpKXOBLf2XQNKtmgVKcRwyrXKUO+aB0SdHbmS2PLarwBmPOrh5MGpmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1j6nlvUxahre62zVaUetEuee9IsBIQoi/1iLPr94fs=;
 b=mBHtlNbFAI09Nk8rCwI9TwuJwQUEJ3XWF2khA+IPia9TSR970C3yPm/NrrlVjwKM3vz0rawwMmHJ9H+nUdn2mL5orXKwso4OuIqfirbKkHFBimNXP1HdnYnifRdwv7jBQPXLR70xA3LOupEYavV2bPOmDiix58bn4wxoz72Lv2+ds7zYepi2g+YLB3KMGNUZpO+5X/rFuchOmfhuMHvR8bJbWPXm80H55w+dZ4uGWq856g+wfCLrLIWPwkiJfT6Ko4aV8M7wDTRjM8KsOCM0d6HZqoNLuDKPJ8mYX2elUnWLjaGAIfV9JlmHd1WJB53C0birQYmb9wNvvlPVFWiY8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS4PPF2EEA5C68E.namprd11.prod.outlook.com (2603:10b6:f:fc02::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 05:16:19 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 05:16:19 +0000
Message-ID: <1346fe74-b860-44a2-893d-b6e1880d2358@intel.com>
Date: Tue, 5 May 2026 10:46:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/13] drm/xe/xe_ras: Add support to offline/decline a
 page
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, 
 Mallesh" <mallesh.koujalagi@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
 <20260417085812.4013309-25-riana.tauro@intel.com>
 <SN6PR11MB3232FF644E0579D4FD1D28AA812C2@SN6PR11MB3232.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <SN6PR11MB3232FF644E0579D4FD1D28AA812C2@SN6PR11MB3232.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0073.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS4PPF2EEA5C68E:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f748a6-0f34-4728-b517-08deaa6570a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: knEJQGgoS8/YlzYyhjg3VQqmqyc8wfwf60SScKksVBtd3iW/UyKhTy7E5luKa0CxHcf78MDJG2sN8gBV1qP1/bY0/9qjpcWmeqHV4/BwTfly3FiXUZ3vD6IosMCkOnYu6RVFyyoZ1gbLEXMj91IOxJ315e5SGToYtDV3LibwgcYSt9+f4aolqKexi4YAM09xqb/41/t+yOkIISWK1fx4lHQlU4fuA1gx8lFrWcZNk8QOxFc0x9k4VebsOoCen0LDiJ6gD2hzQtyWpa5+wxycc3iWkHVmE03Uk2EMEuv9QD8fZTa6quWCoMJ/Ai4kLzQ3MiDWfdN8A7Ctba4lO331x50vVhyK9OqZf7GiHb/J6IxorITDofqaEY6+ReA/xUJkih2/OzWv5iuN8drANIpvD3JybCSw0OiDV522mIFE5FcgYd5az0QzOWjs6XD4mmOJZ6DjUEHnvFkC6yhcvM4a+THY5ANxzPyIh+rAfKNuQ3XLUIO/VhBH6ZDm3213EBf82DhzbFQQb1+zYHJY9G/Wx6KZyO7N78eTIrpSIaUeN9Y6SkCMVRzfFERbvqquTn+KnEA1GecFaN/9XrYgb67uh6YuOMP+5asTNr1R5kHzsqJSGxsPXSfewyn23Shw98/QCaaOGShaPUTA4YMkMRzbww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTFPWWFZZk9IMG4zaEdGbFFlaEJtOWViQWlORnd0UGJiWDRCRXArMnV4L255?=
 =?utf-8?B?SlVNcWNpc0lUOUNOcmNOT3pYazh4VmpnbkJEZ0E2SWluZTVwcGNhTHNrZFRG?=
 =?utf-8?B?WEpIcjZhK1pHUGoybFQ0cE0zeDN1MWZPMHdmMVdvNWYvc3dsZGdwRUFMejJ0?=
 =?utf-8?B?WU9jK1FrdFVjSVh2eFJPVlExU1FieTdhSTRZS1JjVGoyZHBoY0FCaGhlZ1pz?=
 =?utf-8?B?K25PMTl4b1pPelQ3Y3JOdE9tbnRsalYxa09hNzdjMElmQWZ6dmhweTd1dXNB?=
 =?utf-8?B?RldNTm84UHlxM1hnRXloV3ROTUk5MWV1YTZqZiszTDkwdkxlZHkxY0V4Rmp5?=
 =?utf-8?B?U3dNUUdzWlNlYmtDbUJCdWU4N1ViQmZma0hNZzhmUkRTTE9ZNFF0WG8wZGxN?=
 =?utf-8?B?YlN2clQ1bTY0TkZaY1BONzEwcTYvTG1jcXhndDFEWEc0M1BsOHlzZkhMV082?=
 =?utf-8?B?RUlDNmRzUTUxcmdUcjNjTHNKUE5kMlk3ZEZHV3Z3dmNXWnYxWFh1K0pPMzN1?=
 =?utf-8?B?bUxGN01tY1dQMVJXT1FJRmpzWS9OZUZxQjhxL0RHeVJSeUpvaFk4ekJjUGpL?=
 =?utf-8?B?bVd4ZWdvb283RjVJSzN2SmhCT25BaXphVGd3Y0gvSVZsV2R2SlpVUjErSEtI?=
 =?utf-8?B?OVlRL1RlVWQ1SHVXa1pCK1ltenYzalJxbzN4eFZ1SE1qalF4T1RiSjJ0TWFt?=
 =?utf-8?B?L0U0d3pPZ05qcmp3b2cwaGxXamJreVpvMTVsSllXekd5L0R0SElnK2lsa0hO?=
 =?utf-8?B?cUdmVHpnNDdBWU9aUGJxUlp0N2NwYmQvWUljM3d5dnd4K0lHVm1PYThFSi9s?=
 =?utf-8?B?WDI0L1VDY2ZOaU5uQWtzdTF0QjVKYTF2RFVPK2dyT1V1UnpieE9sMFBFTis2?=
 =?utf-8?B?WVR5dTdic2k2eWR4UEsybUtHSXRWcUJmMVFiQVFiOUxSTXBnR0xiNlE4bDE2?=
 =?utf-8?B?OHBUZlFHT2l2VUFJbkliVkRLRGF0WjNCN0ZFdDl3a1hJc0ZHcGIwazJBSjVr?=
 =?utf-8?B?VHVRdkNabmtkampLWTFIV3dMK1BOSk5oRVhIV0llUysyNFhpTHVGUDBWa25t?=
 =?utf-8?B?KzAxWlN0VUJ0YldJRXpSTFJERGZmM1FvWExhei82T2E1ckYxaFRPRjFLQVVr?=
 =?utf-8?B?MmIxRG10Vk1KZ2lOMkoxa2NEam5FTTQwOVY0RG4xWmZPeXJaUHY3dkNWK0VP?=
 =?utf-8?B?dU5JVVU1M25OR0tRYWNLTkQ5ZkZoMUU5Uit2UnBrUnlhMGoraUNXYlNYVUNv?=
 =?utf-8?B?YURrdEJRejVlZkU1dFRIaThOS2JGQnNKTHBNNmJDUms1MGE3TmFmQk91UWk0?=
 =?utf-8?B?SW9TMTgrT0JKaWpNUDl2bG9KVTd4ZXQ3U2plQjdrYThNM20rS04vY3hDNTFt?=
 =?utf-8?B?ME1nbWdYem5aWkltZzNiZFRBWWNaUFM2UDUzMlBSdFlySURubWVtZ1hwMlpo?=
 =?utf-8?B?bXdadkxJMjdHZCtqRU9YR1E4RlNmZVR5bmdnT2FybEJxdDBxQ3IxS3E5aVpv?=
 =?utf-8?B?cktML3NkUDl2ZVRsdWp3UzlGaldjQks2VllUY2ZLbUU4c3dhUmtrZHkvRzNU?=
 =?utf-8?B?VWk0eDNkZnNGVFo1dnlsUE9rL0FIaUsvN2MzenJ2ZnNoK01xYkNXaFJ2RVc1?=
 =?utf-8?B?RjdVSTY1aWxZYzBsWFkvRlY3QmhOdngxelhCbTNoWDlGR1NxVGFBcjhjMlh2?=
 =?utf-8?B?eTJtbzFmeDRucGtQelVuRWRyV01iVTRtd0pLUjBwWUw2bWRMVlRFMnhlLzZq?=
 =?utf-8?B?c1dLSUxIemY0VlJseU04SHJzSFp1amp5UFFQMXhkVFByUHljbitUcVppZUhk?=
 =?utf-8?B?bHhnZjBFY2IxTXlVWUZWVTJSQXBFei84cSt2V1B1eUFnSjY0SWJXeS8xRVRs?=
 =?utf-8?B?NnZiMzNyd2gvT3UzeTVZc00rS05xd2NiREVLeVgvejhONjE2WU9hdDU4S1Zz?=
 =?utf-8?B?RFJPQXZEb0hKZ0RHM3JWb0I1bENoUVlQMkxkMzgrVSsvU0Roay93T1pEM0xp?=
 =?utf-8?B?eGZjRW55dGYweUFTRkdnS0VoNFZzQnFGOGxybmpheEVFRjJ1QXR4aVcydTFu?=
 =?utf-8?B?WXhLTHlKL2JEUnhtQjBxeE0zeDlCcG9hb0txNmVudThVMWxWM2pTT3Nwbk0v?=
 =?utf-8?B?Y1ZvNTVPNFNPR2I1Z2lTTGNvZ1NITmowL2Fjb1hZOUt2QXhDa1FpNWl6MXVm?=
 =?utf-8?B?NFZzRUxobDlUUWY2ZzFTdnlnQnNZSWJkZTA1bVF1WjZTOVgyRkk4bG5UYk5P?=
 =?utf-8?B?RDE1N0d5ZS9WanpveWJVYWJjQmhsdStOandWYmorY3k1dkQ4ejMvSEs0U0xv?=
 =?utf-8?B?WTdHREtJb05wcHhtSXNFdDNTdTFFcmRYcENQeGVhL203RTRhYnJwQT09?=
X-Exchange-RoutingPolicyChecked: Vac5VYRhRcZcM58R2yABsmGIVvUXvestmrWUPKsZEVUcLYbr20enGey5EX5kCDLLak4ODa2bqhmtm6xcc2UUJqXKmxpmMKdtOetLUwCdw1cKyppYsHFj0UH5ACJhTwGjm8kubG1+uMJEG+9qRvzdQZCvCCCPzz6nHWXg+t/0KyspFswoedf6mxY5N6HR/bHiJhIrx7o5Pkhxe8rqXcfTR6wY5XA4F9vE67fkL0qDM+/n3R3HhD3qh6YvSLd1qmzOVvFoZCq7ksIJGBtET3rGzXjJRFfWsZ73jncn2PTb7OyEf/or4Zpxl7+1qu1/TON9+esl3ZIv5X/HnL7uB+rRNA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f748a6-0f34-4728-b517-08deaa6570a8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 05:16:19.7054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S3QQVu5aTQxIjDxEtrj0F7EyX5u71nFr2KRoS4x02N1gO01ij8NWWcztPsske6FBLe0RSZdp15vQB8kuel1qdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2EEA5C68E
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


On 4/21/2026 11:51 AM, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Tauro, Riana <riana.tauro@intel.com>
>> Sent: 17 April 2026 14:28
>> To: intel-xe@lists.freedesktop.org
>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
>> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
>> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Koujalagi,
>> Mallesh <mallesh.koujalagi@intel.com>; Purkait, Soham
>> <soham.purkait@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
>> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
>> Subject: [PATCH v4 10/13] drm/xe/xe_ras: Add support to offline/decline a
>> page
>>
>> Add a helper function that sends commands to system controller to
>> offline/decline a page based on user policy.
>>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c                   | 51 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras.h                   |  2 +
>>   drivers/gpu/drm/xe/xe_ras_types.h             | 37 ++++++++++++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  4 +-
>>   4 files changed, 93 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c index
>> 347844b3d2bf..cd1ac6441b92 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -268,6 +268,57 @@ enum xe_ras_recovery_action
>> xe_ras_process_errors(struct xe_device *xe)
>>   	return XE_RAS_RECOVERY_ACTION_RESET;
>>   }
>>
>> +/**
>> + * xe_ras_page_offline() - Send page offline/decline request to system
>> +controller
>> + * @xe: xe device instance
>> + * @action: Action to be performed (offline/decline)
>> + * @page_address: address of the page
>> + *
>> + * Returns: 0 on success, negative error code on failure  */ int
>> +xe_ras_page_offline(struct xe_device *xe, enum xe_ras_page_action
>> +action, u64 page_address) {
> Where is this used?

I have just added helpers. The integration of this is dependent on your 
patch
Intel Xe - Patchwork.
<https://patchwork.freedesktop.org/series/161473/>
Only once this patch is merged i will be able to integrate this

Riana

>
> Tejas
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	struct xe_ras_page_offline_request request = {0};
>> +	struct xe_ras_page_offline_response response = {0};
>> +	size_t rlen;
>> +	int ret;
>> +
>> +	if (!xe->info.has_sysctrl)
>> +		return 0;
>> +
>> +	if (action >= XE_RAS_PAGE_ACTION_MAX) {
>> +		xe_err(xe, "[RAS]: Invalid page offline action %d\n", action);
>> +		return -EINVAL;
>> +	}
>> +
>> +	request.page_address = page_address;
>> +	request.action = action;
>> +
>> +	prepare_sysctrl_command(&command,
>> XE_SYSCTRL_CMD_PAGE_OFFLINE, &request,
>> +				sizeof(request), &response,
>> sizeof(response));
>> +
>> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +	if (ret) {
>> +		xe_err(xe, "[RAS]: sysctrl: error ret %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (rlen != sizeof(response)) {
>> +		xe_err(xe, "[RAS]: sysctrl: response size mismatch. Expected
>> %zu, got %zu\n",
>> +		       sizeof(response), rlen);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (response.status) {
>> +		xe_err(xe, "[RAS]: sysctrl: Page offline command failed with
>> status %u\n",
>> +		       response.status);
>> +		return -EIO;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   #ifdef CONFIG_PCIEAER
>>   static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
>> { diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> index e191ab80080c..ec59258eb3df 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.h
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -12,5 +12,7 @@ struct xe_device;
>>
>>   void xe_ras_init(struct xe_device *xe);  enum xe_ras_recovery_action
>> xe_ras_process_errors(struct xe_device *xe);
>> +int xe_ras_page_offline(struct xe_device *xe, enum xe_ras_page_action
>> action,
>> +			u64 page_address);
>>
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h
>> b/drivers/gpu/drm/xe/xe_ras_types.h
>> index 020e3f92a057..d76310866da5 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -30,6 +30,19 @@ enum xe_ras_recovery_action {
>>   	XE_RAS_RECOVERY_ACTION_MAX
>>   };
>>
>> +/**
>> + * enum xe_ras_page_action - Page offline actions for page offline
>> +request
>> + *
>> + * @XE_RAS_PAGE_ACTION_OFFLINE: Instruct firmware to remove page
>> from
>> +queue
>> + * @XE_RAS_PAGE_ACTION_DECLINE: Instruct firmware to mark page as not
>> +offline
>> + * @XE_RAS_PAGE_ACTION_MAX: Max value for validation  */ enum
>> +xe_ras_page_action {
>> +	XE_RAS_PAGE_ACTION_OFFLINE,
>> +	XE_RAS_PAGE_ACTION_DECLINE,
>> +	XE_RAS_PAGE_ACTION_MAX
>> +};
>> +
>>   /**
>>    * struct xe_ras_error_common - Common RAS error class
>>    *
>> @@ -260,4 +273,28 @@ struct xe_ras_memory_error {
>>   	/** @reserved2: Reserved for future use */
>>   	u32 reserved2[2];
>>   } __packed;
>> +
>> +/**
>> + * struct xe_ras_page_offline_request - Request for page offline
>> +command
>> + *
>> + * This structure provides the request format to offline/decline a page
>> +*/ struct xe_ras_page_offline_request {
>> +	/** @page_address: Page address (4KB aligned) */
>> +	u64 page_address;
>> +	/** @action: Action to be performed (enum xe_ras_page_action) */
>> +	u32 action;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_page_offline_response - Response from page offline
>> +command  */ struct xe_ras_page_offline_response {
>> +	/** @status: Status of the page offline request */
>> +	u32 status;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved;
>> +} __packed;
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index 00a0f05aab32..2cafa8a14cc3 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -14,9 +14,11 @@
>>    * enum xe_sysctrl_mailbox_command_id - Command ID's for GFSP group
>>    *
>>    * @XE_SYSCTRL_CMD_GET_SOC_ERROR: Get basic error information
>> + * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/decline a
>> + page
>>    */
>>   enum xe_sysctrl_mailbox_command_id {
>> -	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01
>> +	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
>> +	XE_SYSCTRL_CMD_PAGE_OFFLINE		= 0x08
>>   };
>>
>>   enum xe_sysctrl_group {
>> --
>> 2.47.1
