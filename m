Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DA1D2629E
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 21:10:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D9610E666;
	Tue, 20 Jan 2026 21:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kvSJ/gDQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2DA10E66C
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 21:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768943426; x=1800479426;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Tvuia9TR+4ipndkAVFGeum4T0U3e560gJf1vIIVmZ5U=;
 b=kvSJ/gDQftbhdbWCBBtuWWJJi0ZAhifkishDkfEGVqgPKDdI0wolTGRq
 8zIAggCjahiv7B/uEbtGFxE69iYcs7tbpfgDMUR6y0n3nVYenDUF46wss
 f9oOdtnFg7viit2ZO3Y7/syF0XlvJc1lnedRINzUPPr3QXW/o+KuwRM5X
 jukgDNYn5mWRxDG9KWYSiVgykdo9n72g7zH2aX+z7snNPv9VuaKenx+yE
 bthNs1ZzEtS8AYf/1QJ+uLX5jrextp3zS22kkpvl7T1PLg26z6Or/cJbi
 KOlfOASB2+Uc0Sfw9UgKKZprilk0FfKGYYaJDs3KIOnchBdPnctpVGeQh A==;
X-CSE-ConnectionGUID: FtcvGFAfQHODhtOFotOy2A==
X-CSE-MsgGUID: taDAc6ZrQzeKvUMgPp101w==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="74018219"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="74018219"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 13:10:25 -0800
X-CSE-ConnectionGUID: k8QCEnuKQl2p6owF9oG1oA==
X-CSE-MsgGUID: ZiyOxrx1SiulNG8/YLazxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="206648461"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 13:10:26 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 13:10:25 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 13:10:25 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 13:10:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MCzf78dCsInAEfubbeaCTGRjkikUomjLGUTsJ0S353byhz/26VmUDj4OlZt4B6Oqq71CKY8OUjK+kz4MW7RlU1jgH1J6TlPruWs5wT4BO5vhCEPiZr4/KxScc0pA5WZciSkL3ja7KL93JNLLgP6iOzr7VyH+JKw5eDLvItb2SOV7WenkT0asZWnpvSoTGPgF3WXMUkvDawPRwcEfhz37IhqDe69oFJYAK2jw7ipjb/I/2tu8caFw3n6OyCbeOR7rQU2MG0SjjEyxdLCWV7J9qwHoRfPrVWnCGCz555xW8monQVXSwk5WSRlY2Qaqrxn4SnxizPwBAJF+YZj7BZ8Tzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrkF58lY/iUxQF+TWNEePcP0mtja9qCT8kAPXg7wo7M=;
 b=ATh7YKEYmXe298BcMuECBgONmbAsY5donPQ81S+arEvS41MJBYEmYuXllmQ3z4xR/11hMma2gR3+lLbMAj945og7lYKCgwzfWpLFnMDVyzkk1uKhHXMFgo6Rk/l3rozQiJik0V78RiCOziSk1i8wrGvUIVLtJ3M5YUu6I768iVfaP7icVWM8Z+qzLk2ErNSjZOvjLIXKP9SFjGnjg7G08G5fg87hOjB1zsHcBR1YDpWNf8fdgpdzTYh20+DE2T6mbo9T6HSVRoGWVbEaUp2+ZAjD9IYsN6bnmp3rwGO+Ydd0C69swiVs+wreQBLbpYULy6RfE/snYe6GNAM8Q/eYdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by LV3PR11MB8530.namprd11.prod.outlook.com (2603:10b6:408:1b8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Tue, 20 Jan
 2026 21:10:22 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9520.012; Tue, 20 Jan 2026
 21:10:22 +0000
Message-ID: <e8cf019c-409b-4e17-ae80-8b95e51e366a@intel.com>
Date: Tue, 20 Jan 2026 13:10:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Do not preempt fence signaling CS instructions
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Carlos Santa <carlos.santa@intel.com>
References: <20260115004546.58060-1-matthew.brost@intel.com>
 <q4f6zwko4q6337m3ap244j6q3lfqqrkmlxq2l5ojgcbensliaf@yj7ndeqnrvuz>
 <aWqn/eXaw2t9j4fY@lstrano-desk.jf.intel.com>
 <5nddlxy5z2naxxoz7jnyhpwpv3pofv57fuhflcjjwhxell5ozg@xmrhis4b7hhf>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <5nddlxy5z2naxxoz7jnyhpwpv3pofv57fuhflcjjwhxell5ozg@xmrhis4b7hhf>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0135.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::20) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|LV3PR11MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: 26fa8e0e-408f-4cb8-2ee2-08de586852c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0lKVzR5TWdzWHpTRGZjbWJGRTMvMkttbmhUaTBtWFl2bmNiYkUwTXdSUkRu?=
 =?utf-8?B?aUlpWC9rSUUwZVlSbWNIQnd6K00yNHBBSkZQalhBNmFQYVRxU2RIMFNZcktr?=
 =?utf-8?B?Y0d3MHZCczNSVlBOUG90TEs0d0x4R0NiS0VjakwyRTU2eHRtbVU3ejY4UU9O?=
 =?utf-8?B?WXB3WE0wbkoyNjdrOGk3aGJDS1VBNStlUnhFOGdpZE5tdWkzRnpjYkpTVGE0?=
 =?utf-8?B?RzgzWk1Eam9qaWkxSDRtN3Z5LzZoaG9pS1BkVWZpdndDV3N2VTJGNFExVEFa?=
 =?utf-8?B?R1RuSDkxWWdseEx1QUVtcHlxSVhWQ0RKSnR6YVpMeGE2NmllMkIrUWRSNmRC?=
 =?utf-8?B?OThyd1ZLNjdlNGhQWVkxSXJyd2dNcnNYSWVqRzBZVEl3dDNocGRuRVRrZFRs?=
 =?utf-8?B?ak4xNTJYSHdESHVVcVlYc254clZPUUJGMCt1VEdBclBPS2xNNG1DbjhHcmVS?=
 =?utf-8?B?N3I3b2s5KzhNTGtOYTJyNkdpbHBnbGdsQjd6R2lhamJpN01ibU5EZnNwWVVX?=
 =?utf-8?B?OUZ0NjJJUCtkelZ0d3FaTVJ4TmtZazBTblkyY0gvemhab0d6eXVCTCtqLzFV?=
 =?utf-8?B?TXBUenRJM2d3SHAwTUNOYzliK3EvUk04Yll4ckZteXlWckdiREhtaFI0M0NL?=
 =?utf-8?B?c1hkNkhqVlVpcWFING1ZK2FlRWFMMkFHVXlwZWR0c2xyRkNMeWx4ckFCbzhX?=
 =?utf-8?B?aTZqOENweEVQcUthNUZ0QS8wVUdtYkdhczNmb3k2VXN1Z1Uya09vdm9XYUlp?=
 =?utf-8?B?dlN2RUFBOUJJM2FTai9VSFlQT3NDWVVkaXlacEdzbkppTnZTNG5kOFRtMUR5?=
 =?utf-8?B?cGRhN0svZ2JINDduSHRsVTN5R204ZExkajVORzdhbk4yMHBSbG5ZTG55cHZo?=
 =?utf-8?B?ZUkrS0ZoSXhQOFdrS3BySUhrRjBWZVdSbGVpcFVXWlZxS3NEY3RBUS9UYW9p?=
 =?utf-8?B?clhoUTVvQnRRVk9VY1RnK3ZiOEFRRGhERjB3RWRTTkljUVRQY1NmdG5RT1gx?=
 =?utf-8?B?QjNUaFY0R2UrUjdmS1RtR2lrRFNaRTFyc1RKQU1MUEx4RlplRm9qOWlLckNP?=
 =?utf-8?B?c25QMGRRSUxNbnZsVjlsWFNCUVl5RWcyb1Jma2xFV1hmUms1TGxxUWhwQ2tS?=
 =?utf-8?B?ekh4ejNjbkdnV0lxanBPNTBFc3k3WmVNVk1JWHdqNkFEdzRtcFUwM2VTQjBX?=
 =?utf-8?B?NE54Z0dmalFmTkh2YlVsNVRwd1VvNHFOR1E3dGhtQkhqbXZqY2kvUVRYS2I4?=
 =?utf-8?B?Qmk2VWo1T1hSdU1JY2V5T1lFK3Y5YnAyU0swR0pEeXd0Q0I0Z1R2aWVHOW9y?=
 =?utf-8?B?T2V6UTRwbkREVFJSbGNGVWlJM0RsOWtzY0p0WDJXQzFPSUxvUW1IeFJvTnNh?=
 =?utf-8?B?aVB2blZnMlZqaWZVQjNBZHdJSTdLWnBCMDA0Q25PclZjS3V3ZVZDcXpWNFdi?=
 =?utf-8?B?V0hpZDhvZ1kvVi9leWRSeXpJcUptbkFzUDR6MGlsazJPUzB4RmpRamF4SHlW?=
 =?utf-8?B?ZDQzZVg4ZVdoL1k2SUVoajFHRFQ1N3VYbFhGdEFSd3BrQ25IVTlXZHQ4bFYr?=
 =?utf-8?B?aXhreUpWV0tWQXZmSlJHcndhQ0Jwd2l3OFZqQ1dqNlNnNklWUjhodmZXYk5z?=
 =?utf-8?B?VWVhMStJWXEyTEZ4MktOOEdUS0RNcVgwYUxOSzA2NzJsMjUvd0RPdmJPL1Vw?=
 =?utf-8?B?cTk5dndZRzRPRGdEcUl5NGdVZ1MvWGdEYk1Ed1BrZFdFd0QxS092NFFtNFhG?=
 =?utf-8?B?ZDRST2k4cWJBNml5SlFqZDl2Y1ljbmNBRjg5dXhtVmZlZ2pMSHZBOTlLZmNh?=
 =?utf-8?B?ckw0SFJJWG4veHdYRjZkQzRNUlVxWVNMT1hoK3ZIRjNjTmZiUDFzUFJwRnJa?=
 =?utf-8?B?UWMvZTd4SEJ0bXRGOXJMemN6aXo2MzFhcWdZN3VJZ1E3ZVhmOURyYXIrTDBC?=
 =?utf-8?B?YkpNT1Examg2UGZKNCtXY3FkT1pOV3ZZekJLYk1pQlAvN1hBNUdlL1JlRXQ4?=
 =?utf-8?B?bU5FUFdCbC9DOEtZUkRzNjFoSDRMR04zV1RsVmhna2hGOUpkSGV1bmlCcWFs?=
 =?utf-8?B?WU4xMVROYUxJWVA3bXZ6c1kwalY5UEx6Y0RpaU5uOXdNODM1elJVenNmM3Vs?=
 =?utf-8?Q?TqFQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUpYUmpMblg1T2JNbjNENExDVWVZMDJPYVl5THJZSHhrQXNZOHEzTnpnaXo2?=
 =?utf-8?B?OC9KY0VxT1VOUTlHeTBzeFB5MEdLUmdTRUsycTdLdzhjVWlBU2tYQW05NVFh?=
 =?utf-8?B?RHdtQ0dJakhjU1lncC9zbWtKdklnSStqK0t5MktCWWc2L01DSEZLSnVqbWpI?=
 =?utf-8?B?dlNLYXVYQjIydjN0eUZDMXpCeVdEZDJkYkJFMEppa05ZRmh3UVVHNG02ODQw?=
 =?utf-8?B?WWo4VTdQL2I1cnlkSGdJNThEbDZ4SnI3dlBZdldkTzRydUxyTHV5L1hjcEVM?=
 =?utf-8?B?VU9sZ002SGRieFdYK1k2UEZHd3U4cTdHWWNuajYxdVNZT3h0OXJRemlOK29h?=
 =?utf-8?B?aURnWWF5U1dNS1ZGTFRhc0x2VDE5c0NQYnhvU3c1dEpGSWQ2Wm1rMTlETE03?=
 =?utf-8?B?cVFSZjJueWhlSDgyTHRxWWx0RUNuajlIdyttMmpMWEpjTzVwcFBGdWs5eWpj?=
 =?utf-8?B?VXZWMUxGM0dFalB3MHl6aTJGaWhRZW1JUXBobUNpeGlBMTdDUGswalphR0ZF?=
 =?utf-8?B?UnRyNU5VTVpVa2UzN2VDT1lyTEgvTzdHVi9QbGhwbE1YQm8xbzl2UHNMNUln?=
 =?utf-8?B?clJUSFdGR3hjUkZMd1h5czcwYjRFMU15UmsrRUpiYXUyMVV4THFXbEx4QjYx?=
 =?utf-8?B?K2Nwb0ZCbklNMmVUN1pmUHlzeDM0S2JPZXMwQU8yNWt3bjhCQnJCMUNRbFhO?=
 =?utf-8?B?NC8wZkU2dlRoQVJYY2MyaTdnQzRLdSt0RThnd0RKVE9pVXFUTk5XVjdkWmFP?=
 =?utf-8?B?d2Y3ZVdPdzRPTlBIdi9mbFdnWk1aRGNvOHdQd0FLVFJOdlBnbmhSeFBmM0Z0?=
 =?utf-8?B?cWk5TDVBNDQxQnNFdENPOFVlZStuRDcwblRSaDF6ZjM4Ym1CeU9temM3a2hI?=
 =?utf-8?B?c0ZtM0lUdWU2dVJmV09CM1IyNDZuai9VWFF5VWhKUnVRZ1ljV1FZWTVUUXpv?=
 =?utf-8?B?K2hoc0VQaDZrekZxUFp4YklrZGE4cXpieHZ2ckl1T0w2UzlMaU5hc2hxeUJt?=
 =?utf-8?B?V0UrcUR5RS9hV1h3TFRBTWtuVHRrV3ZJRVNoZEpmN2RxYjlyL1Z4UnB2eTZ5?=
 =?utf-8?B?TzVSbU1ET2E3aHA4bVd6dGUyMHVTNUNEck03K1JtL0dJaElKclptQmVnS3Vw?=
 =?utf-8?B?SzVYVE5PdnFQUjBxOXB5MHVFK3VyYnNORGZ0OUpPVE1SUkQ3VVp1bEdlNnhv?=
 =?utf-8?B?V0hWVHlrN2hHYXFCZ0tFbW1nNEJ3cExNdmpQb0JDSk56bUwxY1pDaG9RK0pD?=
 =?utf-8?B?OGFwQUZKNFhrK294VGhQM21ZbzlPRzFUcENoOHJuTnByMVkvNU5zbmJlVm1h?=
 =?utf-8?B?WUZyK3RBWVZOcE1qS2dMdDcyaWxPWENLWkc5TVRVdHZXdXFNakNpRWlxUXpl?=
 =?utf-8?B?OEM1KzFkNytERnNVSWlWb0RCd1BBWVJxeTBSeUZ3ZTdzWGdSeG5Pdm84Qkcw?=
 =?utf-8?B?T1QveW41STB2aWZ1b2VMeXlvTGpxTE1vTjErdFJwNU54bkZWMWljWXpzcm9R?=
 =?utf-8?B?SmlMTkJMcXR1ZStyd1ZkVkxmUFpvSnRNQ1pxY29rc0RKNFo5OElmZGRBVEdE?=
 =?utf-8?B?S0hMZDloWnozeFI2enl5RlVmUU1qc25RUTN6RHhpcEN5a1U3YjZScFBuMWU0?=
 =?utf-8?B?WGk4RDVjdVFPM01nYWowV3RxSGhvOStZbDI0UEtpcU00OEt2YVpnOGJ4WHVS?=
 =?utf-8?B?NER6MHQyZ3FPM21NQnB5QjV4N2xlY0c3Z282c1FBVlpJVFY5Y1JFR0Y5TTdP?=
 =?utf-8?B?OWxhdWFUQjU1UmFDSG9ZVmt4S2FucWtaZGxPYW9zTHpzeFFzQzFHYUV5eEN6?=
 =?utf-8?B?VVZBM1lQZG82VS9NYnQycThhSDdVenZocmR3TXcyTi9MV0JxcEdiSUh5bnNr?=
 =?utf-8?B?bWpUNWFKSHpaaDJTRS9aWlN5SzZlNElhVnUxUFllZVp5M1Z6eFdLUU9XbUU3?=
 =?utf-8?B?cjEyNll3RlJodU96MDZ1UGd4ZFlNaE16UXFxZ2p2ZVhPS1o4WTA2K1VxRE5u?=
 =?utf-8?B?aHN5RlVlYndZV2IzS0NpR0ttZGRITkpUancwUlgyU21Bd1h2cW9qRXkxWmIw?=
 =?utf-8?B?cFFlNGZGQWtad1NMalFjYlhaaVhQWGVFbDFmYmFFQVJ6TWtvYm5KbmtpWWRE?=
 =?utf-8?B?NFhXOU90YnFRYkpnUitsM3FvNEZKM285L3ozY0h3YjhyaFBaVm1DTVhJOE5X?=
 =?utf-8?B?bE0zMmhwVk5iLzFCRlB4elAyV0ZGajQ3M2tGd1hBU1FtVDI0TWJtRTNuajM3?=
 =?utf-8?B?djdxVzBZR0pEY2laOU8rQlBBOE10Rjg4VlNsSmNBMmxaeXZtNysyZStMZnlt?=
 =?utf-8?B?WGFHUVplMGVCdzNVcVQ1U0ZNRXEva1pMTHVWWUZsdmxPQkZ5ZmVteVNmTUFy?=
 =?utf-8?Q?FRg0/+s3H75D+xwE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26fa8e0e-408f-4cb8-2ee2-08de586852c0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 21:10:22.3485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N2zaF5MxEBPyQ57Kal1lbW9rnaYtvel5oBwS7H9odDcDbLEy9JZlmAomW4zXuirI5eUv7jnI3I+/8vnGhO+q0WqCsgAcaPbiNuJSxBfCvT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8530
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



On 1/19/2026 4:01 AM, Zbigniew Kempczyński wrote:
> On Fri, Jan 16, 2026 at 01:05:01PM -0800, Matthew Brost wrote:
>> On Fri, Jan 16, 2026 at 10:45:39AM +0100, Zbigniew Kempczyński wrote:
>>> On Wed, Jan 14, 2026 at 04:45:46PM -0800, Matthew Brost wrote:
>>>> If a batch buffer is complete, it makes little sense to preempt the
>>>> fence signaling instructions in the ring, as the largest portion of the
>>>> work (the batch buffer) is already done and fence signaling consists of
>>>> only a few instructions. If these instructions are preempted, the GuC
>>>> would need to perform a context switch just to signal the fence, which
>>>> is costly and delays fence signaling. Avoid this scenario by disabling
>>>> preemption immediately after the BB start instruction and re-enabling it
>>>> after executing the fence signaling instructions.
>>>>
>>>> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>>>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>> Cc: Carlos Santa <carlos.santa@intel.com>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_ring_ops.c | 9 +++++++++
>>>>   1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>> index a1fd99f2d539..cd645ee400b9 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>>>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>> @@ -282,6 +282,9 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
>>>>   
>>>>   	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
>>>>   
>>>> +	/* Don't preempt fence signaling */
>>>> +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
>>>> +
>>>>   	if (job->user_fence.used) {
>>>>   		i = emit_flush_dw(dw, i);
>>>>   		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
>>>> @@ -347,6 +350,9 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>>>>   
>>>>   	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
>>>>   
>>>> +	/* Don't preempt fence signaling */
>>>> +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
>>>> +
>>>>   	if (job->user_fence.used) {
>>>>   		i = emit_flush_dw(dw, i);
>>>>   		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
>>>> @@ -399,6 +405,9 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>>>>   
>>>>   	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
>>>>   
>>>> +	/* Don't preempt fence signaling */
>>>> +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
>>>> +
>>> IGT tests which calls compute-walker, then bbe are asynchronous (don't
>>> wait for completion, pipe-control is necessary to wait on
>>> compute-walker).
>>>
>> This asynchronous behavior may explain things. Is this a common use
>> case?
> Compute runtime if I'm not wrong uses pipe-control explicitely. IGT are
> not doing this relying on kmd.
>
>> Also do you know if render engines have similar asynchronous behaviors
>> or is this specific to compute engines?
> I don't know, I think Mesa folks may know the answer.
>
>> Lastly, the i915 disables preemption on both render / compute engines
>> immediately after the BB before emitting the pipe control. Is this async
>> behavior a new few feature in Xe2 parts which only the Xe driver
>> supports? This might explain why the i915 works and Xe does not.
> Test exercises WMTP and this is supported starting at Xe2+. Probably
> what test is doing has a meaning in this case. First compute-walker
> submits kernel which loops until it will observe some memory write.
> Second job executes compute-walker with kernel which does some quick job.
> But first occupies all EU's so second job can be preempted only when
> preemption occurs and SIP will be executed. So if we disable preemption
> immediately we submit compute-walker I think we have no change to enter
> SIP and switch. Even if I add pipe-control to batch level according
> to Daniele comment job it is still preemptable and we move pipe-control
> location from kmd -> batch level..

So basically the test requires a preemption but does not put any 
preemption points within the batch? I'd argue that the fact that the 
test works at all is by chance, because the kernel just happens to add a 
preemption point after the BB and the batch doesn't wait for the results 
before completing. IMO it should be ok to go ahead with this patch and 
rework the test, but we probably need an ack from a maintainer because 
something that worked before (even if just by chance) is not going to 
work anymore.

Daniele

>
> --
> Zbigniew
>
>> Matt
>>
>>> May you try to put arb disable after emit_render_cache_flush?
>>>
>>> --
>>> Zbigniew
>>>
>>>>   	i = emit_render_cache_flush(job, dw, i);
>>>>   
>>>>   	if (job->user_fence.used)
>>>> -- 
>>>> 2.34.1
>>>>

