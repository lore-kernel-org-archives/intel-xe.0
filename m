Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5F4CCFA04
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 11:33:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31ED310E102;
	Tue,  4 Nov 2025 11:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jNuF2pTa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B4610E102
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 11:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762256019; x=1793792019;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SYlHZxdXUN5x6vqWKDer3IU8brhOI8cUwBbBIV6CxsY=;
 b=jNuF2pTac390KF/1IuEod+OH83bI0E3Y8Rl8qeyUvrwe/n59P22Byyae
 tbkWeMSY9yGj7WRJdu/Y46zovi8QGI0ilKqX38W4doiLB9HQH4AjXA6s3
 PNeKPD+mjc8y/9hfmVz+E0njWF1pbjrChMFVjflszgFnN7kjCq55sfWLx
 UCKR+rsEPQ3ZlCIaPinPNj6Lgua1y4zc4lQyVdbAo2+4fvnzH1A2KjB9w
 Cmuil9NqiwFkYaY3Si4wFoScwd/53zYFjI83MQoan16FBWCj6X16SCe4D
 JEVVICMRlmJl6zXqIu9uLreaTXfNLotUIKldEYxJetwmH8Vcu3eQBRo6P A==;
X-CSE-ConnectionGUID: o4Bs7LKUR5iKXZ4KJSvK2A==
X-CSE-MsgGUID: iXOUd7GESw6DOM087a9U/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="63358963"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="63358963"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 03:33:39 -0800
X-CSE-ConnectionGUID: CpGkpB/EQCeG6SUupneGrw==
X-CSE-MsgGUID: hPcm+tbITCyHxTl6xfHxTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="186811551"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 03:33:39 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 03:33:38 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 03:33:38 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 03:33:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTkTYuzFhaCAftIkx7l/Uc5LX7ZHnOLGx1c5OwqmYamDCU/rojgdBn1OmXfQCB1dlWe2BhtuJTrWXNbAfe597EWwxqNOameWG6alPsgag1KsgaaGnEGtKIyJkr2kObXWXozlLpym92g+ZBbEftlLYkquvkLPIFZM15zi+Pfw3wVlRnKdFuI/VRnDzwoEqmKmrxYp13fSepRI+tt3e+aCwo2pN6IABn1qps8JTxO88o2/8Hz8Z8aAOiBWaQ70riEQG/VnjBWQupWX8K13qBUBjqJTWkAZTL8prYXOUJoXTvK6Tlz31UFJfZM4hmVclwOYh9e9Z/xIs7/Jjx8y2S+Z9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLAjfPjXLk6TxhOy730c/FtdWiNjVJFjkomFkk2gbAM=;
 b=c1JXB2kit6CrOfU4IdkQZCi939U8/lkMOdA6PjLjpzSHvb8yV0oxttcqt68K7uq42acYs/bKCl1ksVuyuhfQ7ur7IgiLEuJRPnz156SLHH/oFRb7VjaFnB0J2rQa8UARvdt3aRZI60gkx7HS11X6AkNCP/phOK4rFNnTfivURY5e2s1zVHxnSi5ROMF3nPNXyW4z+CgUmdMEuGMDL6qtjFyGKPXTUDE7HKY9KF0ugPgvOhS2eQGnyyFEnKXhe0g1rHjfPuD0NI8Ru5eBC3RPAFmn7+h4vDlU3RpT5X1pMLj6QEZkOeebKRhPFtZCxhUnaZnYRBdeyA2ni4RGM7ZZ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH0PR11MB5029.namprd11.prod.outlook.com (2603:10b6:510:30::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 11:33:36 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 11:33:35 +0000
Message-ID: <9526076a-3369-44f4-ab01-c78a4b19d3db@intel.com>
Date: Tue, 4 Nov 2025 12:33:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] drm/xe/guc: Cleanup GuC log buffer macros and helpers
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>
References: <20251028145333.3132013-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251028145333.3132013-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0221.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:88::14) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH0PR11MB5029:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e2e6658-9bb0-46b9-afec-08de1b95fdd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEtNSmxCUFNhTkUyNTljc01wNkx5ek1LSmxRS3hDcTlleXJza05WZHlwUmFv?=
 =?utf-8?B?ZlR5VTRNazg3YmRzVGFpZ3RPYlhSb1IzamJOeVVvZFhsSFY2bjZJNTE2bHk3?=
 =?utf-8?B?SG8zTUZrYTMySnR2S0NlS3FoT2t1VVFPaXBteEtSUE9YZXZZZHRRWEVEOGI4?=
 =?utf-8?B?QUlsd3p6dmUrVHdEYXRVV0xRSnZCd0pBeVdyQkd3cEhrU1RRYVU4T3ROdG8r?=
 =?utf-8?B?eGpFV29ZZVd4TnVVWlRSQWtMeFlGVVlEWUN6ZmE2bGU4VURCNGJSVjh4M05G?=
 =?utf-8?B?aGIvMWVGSk50TStNMEU4eTNRQ0d0V2t3MXdQSUVNdHpIYTVtQmJhakRlTm50?=
 =?utf-8?B?QlIvclBQR2dvd2xhSi9DZ2FCa2FJTnlDaGxTb0k1TCtGWk00T2VtQXZqWVVK?=
 =?utf-8?B?Smo1SmNKL1J3OGI2a1ZtZXU1VE5XMjFrN3RqS21DOW81RTNhL2U4MTA2OHpx?=
 =?utf-8?B?TmdNWlI4VzZtVWxNSHdaMm42UFNDSmUyNTZzcDQrTDh0WFRRTW40Nk5vd3dC?=
 =?utf-8?B?SThibGoxdExEZ2d3OHZiUEZNWm5YK0VJQm5pZzVjN29zNVRVa01uR3d6YW9w?=
 =?utf-8?B?bFNLVFpOWFJtaVp3WElPSXdYSmJGRGVHdkRQVVQ3aTRHby9Mc3hQcTdUZFZQ?=
 =?utf-8?B?eUs1SE11Wk5XWDlTbjkyR21QdW8vSzIvdG1wTkg4Wlh6TDJWeGpnbFBGc05q?=
 =?utf-8?B?djhJbEU0NEpPMVZMS3pwc00yMWFwS0grVzJnR21SVmRKVjltREl3OTBCbnI2?=
 =?utf-8?B?bGtzYUhiVk9ELzVoZG5mZ3M5RVRJaWEwYUhsaXRjakdERUxodlR3clU3NTRH?=
 =?utf-8?B?N2lNY1hkWHRINXlGRFdFRHdrRm9PbnlNM1hNb2xKdTRIMkRtTUl1ekI4MHEz?=
 =?utf-8?B?YWIxZEk0dmpGckF4SkxwTjZQcWc5SkVObWQzd0JTdjNyZ3F6UGJuY3E1WE0x?=
 =?utf-8?B?WU1QYXkxZ3dqSDlCMjlGbjZyaTN0VUJzWjRQM0s1M0dYU2FiQmtTZ3VqTldL?=
 =?utf-8?B?VUp2d0pkMTAvTFZPVVR6ek1Nd1RnTzYrd3VQY0VnaDhtcjZQektubWx1cE1F?=
 =?utf-8?B?NlVhNjhtZUE5UjB1cmhjMk9Lbmk4WWRncG16bGdTakZMNmM2bmRSTG4zTUIy?=
 =?utf-8?B?VEdqdWVRdWNvWTdEVks0Z2NKNkFtV2FzQjhVR1E5ZnFWRk9Ybm1sc0V6OHcx?=
 =?utf-8?B?d1ArSWJmN0lrRXlDSGs3L29Fd20rRVVSMTloVGFYc2tSK3dYSlZkaVZvaWdU?=
 =?utf-8?B?elJRemFWWVJScTEzdTNpOFdKNVBxQ2E4czNiZ0ZuMFRpODdpZzFRWWpycGJo?=
 =?utf-8?B?VGhoRXpwK0JUbXRpVzlYNDhNMVEyVHpEUGFYZktZbG9TL3RBTlFrOXpIUVBC?=
 =?utf-8?B?QVV5SjBQUHBUTXBzWXdEcEtmZEoxb0hCdEVWelpwSCthMlBtVjlZdWpBc1F5?=
 =?utf-8?B?a2s2Y2YvV3hUVCtCK1Znc3hhZjRkYmx1cGQxZENNRzM2V1FkMnIzb3RmRno1?=
 =?utf-8?B?ZXZ2U0F3T0lqL2Y4eGpkYlVyYXNHYXoxMDBZcmJnUnNibWhCTG5BQzRsMElQ?=
 =?utf-8?B?b2ZSSHlHMFFBNG9vZWpDOWxhNmtYTDZDOTJ4UWNYaHZsUmd0UjI0RTY2ZjN0?=
 =?utf-8?B?NGdYUHhuZFUycy9MaW5aNGhMUDhTM3VtRnFFYTk5dFh0b0dwTVAvRmVOWlRu?=
 =?utf-8?B?QkROb0x4RXdiQmRUa1dZNW1sRWhTc1ZhUytQdGYvT3RKWktlSUFDQmM5UXdw?=
 =?utf-8?B?dDNobmRxb2phcUxudUU2VU8ySmxLVUJVYXBxbDROcmt5SCtEUE14WXRqdEtq?=
 =?utf-8?B?OHgrMmlrVDRoWHExekJJVDI0VnlielF1eEptRDRqdWlKQkhLZzFGVDRiNFFa?=
 =?utf-8?B?MCtVUWR0YXIyRHVjM1BqN3lqb1daMVYwcERpelFwRnBqNEUycmt0Mkx0bVFi?=
 =?utf-8?Q?7T2BlwpUXJ8sCJBLlfkpLEJBz/SqNWGl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUM0Q3JMUnplMEc2ZTRoTVk1REdLU0dGaks5bzdWakE5a0Q3MDRwOFdLNGtH?=
 =?utf-8?B?dDl3VjhGUXFEQXdGM0VoekZZdkIzVDFTeGhZa1lCVlVBUWV0N2svWW5na3pO?=
 =?utf-8?B?L041WDdWRnJTVStTTjBHQmxBYU5mY3h4QnBVcFdxcWZ6QkM1Mit5TUozWGt1?=
 =?utf-8?B?M2c2WThQVnI4M21FR3hEcG1IRCtoZTB4OXNsSjVHMkFOWStURmw2bW5CSXBt?=
 =?utf-8?B?Vnl4dkQ4VmZMbml6Ry9ETll2QTZpWFNZMlEzaVBMempEaWVyNVZ2UzVwelpv?=
 =?utf-8?B?L25Dd3VORkxkSjRYQkM2c1BKcFhDc3V5SFFXRnk3VXNuUDM2MUp6bWlxUGd1?=
 =?utf-8?B?ZDE4UTBwV016RkFkVzMzNHUzdU9rWk1qR1ZYQlpxM0ZOOHlBcFNYWStxT0xx?=
 =?utf-8?B?ZXdnbmtXQWhucE12V01OQ3NtMUtxOUlZcjhYZjFDbW1qazRaUFpYUkp6T0xJ?=
 =?utf-8?B?YkZ2cWlkK3NrajBFUmZPSzFSdmRPc0pJY3hYc2FIZlR5U0pTWEYzM3FSQTM0?=
 =?utf-8?B?VVBHRGx3Y2VBRzQ3Y3I1TTJOOFJIaE1oTjI1MkdNaTRMMEIwcnRVNkRXVlVH?=
 =?utf-8?B?WHJnZTUzelBHUTlnODk3RkUvUUF3UW9rcnZrQUhCUFFjQm52RkRtY0hGWHYv?=
 =?utf-8?B?R3hmc0htSFFEdjViTGJyb09EVS8wRHpSSWw3RlJOOS9HTEN5cmtNekVpL0VM?=
 =?utf-8?B?akJnazg3MXZ3NmtzM1V1TE9FZ2FKR2ZvWEZYR092TzBJdVc5Z0FmS3RnR1J2?=
 =?utf-8?B?aGFMZzZoQU9JbEhZazUzdXFaMkMxM20vNWVHS0x4OG9jejVGMnFkVUxJUjA5?=
 =?utf-8?B?OFRjYkpPckFXVWpOM2RYNy9vRDJFVEZwL0J3YW9IQXN5M2NHd2wyRVhhN3Fs?=
 =?utf-8?B?QTBBVmVZOENodElMNEJDQ0VMcEFncWNzc1NSUHR2Q3RpWEpRTkc2ZnhPRDls?=
 =?utf-8?B?ckFlUnkxcjExQ0lZY24yT0pnakVXVytoRjhYUWVrMzZlZUFDSnN3bFQ0Nmhm?=
 =?utf-8?B?alUzN3MvTnhxdldsVVBvRGhnN3YycmFSeit1MkE0S2ppNE1RRWVQd2RhUVRY?=
 =?utf-8?B?cGJjM3Z3MDl0b0VKMStOd253ZCtKVDVXZU9LNlVLRDZnUjQvYUYxdjJ3eVlj?=
 =?utf-8?B?b3VhZHpZWklyaG0xM2t6OHhmY3ZTcUVBVG1kWWpvWTZzaTJCL2p0TkM0ZHZT?=
 =?utf-8?B?MHBkWDZFdFlqNldGbmtTczkzREJDczM3dkpPMFZramRMbnZ1NmVBSGkrUkpy?=
 =?utf-8?B?UHV6YmtzS0hnUnVtemR1YzczRk4wT2dnNnQwYVRrWEJneEJKRzFwaFk5WkM3?=
 =?utf-8?B?MUdqbFhOSVF3MldoWjFxWUc4S3JsdmpnM0liZU1Pems4ckxoZE93T1NYcEpS?=
 =?utf-8?B?M0w0WVcvVHlGQ0h1MVgxcUlLbi85K0YxOWcvV0hHbmxDKzhGYjU3d1BmZ2dF?=
 =?utf-8?B?VjEwakQvOXlhVnhtcEx1WER6V0NlcCs2cjNQRFFDaE5iQlRkWGJNMEdYR3lG?=
 =?utf-8?B?MUd6cUVrUXY1a3hWWjgxWFpyV2V3SDFaald5Tkh0YmM5THZsaS9RSnM4ZnJB?=
 =?utf-8?B?am5HRG9sOTZ2K1F6NzkxdEZzOFphWlRNUm9qSVRLK2pES0hoQ2xUWVJ3Wm1H?=
 =?utf-8?B?aFp2T3Njb2xINHlKWkF6UVZSV3VNLzROMjJ3SVJUanU2UFVBTGs3ZjBjOWlx?=
 =?utf-8?B?VGhyR2JMOFlRalJLTWszTVVKYmR1WWpkaXcwcXlpTHhJQTlpK3krdHN1akwz?=
 =?utf-8?B?OEorSkY0VEpaNjFtaGxRZFN1c09VK1hOdVN6UFhqTzgzWlVSVzJuYWQzeDg2?=
 =?utf-8?B?UzlmRklWSmZTaXdkSDJVRFJoeFFvbGRBZEdTbkRPVXFPdXBoamxUeGE1RkNT?=
 =?utf-8?B?TDhDczJXWnFHVFZGMDIvWnpIZWhLOG1rajV6VjR1S2wwNnFHWDV6Ky8wcFpy?=
 =?utf-8?B?ZmxySWpzVkQrMUpxSU9XQk1mVFFSZFNSWFF0cnJ3R09qOUYrT3kxM0hmUmdO?=
 =?utf-8?B?WTB2MG1RUEhrQitZUHF0ZUpjVWZpU3lDUURZb2hvczdxUUVhS1FESWpvbUVE?=
 =?utf-8?B?bStpOGRtS3BrTStXNk4ycHlHQlN3eFMyV0tUMUgrOFAxbURTSkdKL2V2dmxI?=
 =?utf-8?B?NFJYTkFYSVJ2UnpBNE02dFFtajBtYjJrQnlMQzI3cTNhL3EwQmhTakZGT0p5?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2e6658-9bb0-46b9-afec-08de1b95fdd9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 11:33:35.8427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t9iHhlQjFrg6KwqGFSYKeG/9I+UbRtP/BvBQGSwvT1qht881qOu4PVrgywVVpkQS45XDzHrOyLoLCx5nJNrW03sen+pmVEn23YuFc9+wCeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5029
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



On 10/28/2025 3:53 PM, Zhanjun Dong wrote:
> Cleanup GuC log buffer macros and helpers, add Xe style macro prefix.
> Update buffer type values to align with the GuC specification
> Update buffer offset calculation.
> Remove helper functions, replaced with macros.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
> Cc: michal.wajdeczko@intel.com
> ---
> Change list:
> v7: Remove _BUFFER from macro names
>     Move some macros/comments to other header files
>     Replaced get log offset function with macros
> v6: Avoid change same line in series twice, squash into single patch
>     Correct PAGE_SIZE to 4K
>     Promote memory layout comment to kernel-doc
> v5: Change patch order
>     Sync macro names across buffer type, size and GUC_CTL_LOG_PARAMS
>     Replace guc_log_size with macro
>     Update log buffer layout comments
> v4: Replace helper functions with macros
>     Rename log type xxx_DEBUG to xxx_EVENT_LOG
> v3: Update comments
> v2: Use SZ_4K, instead of PAGE_SIZE
>     Expand for loop with switch and fallthrough
> ---
>  drivers/gpu/drm/xe/abi/guc_log_abi.h |  43 ++++++++++--
>  drivers/gpu/drm/xe/xe_guc.c          |  23 +++---
>  drivers/gpu/drm/xe/xe_guc_capture.c  |  16 ++---
>  drivers/gpu/drm/xe/xe_guc_fwif.h     |   6 +-
>  drivers/gpu/drm/xe/xe_guc_log.c      | 100 ++-------------------------
>  drivers/gpu/drm/xe/xe_guc_log.h      |  29 +++++---
>  6 files changed, 86 insertions(+), 131 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
> index 554630b7ccd9..956de874194f 100644
> --- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
> @@ -8,11 +8,46 @@
>  
>  #include <linux/types.h>
>  
> +/**
> + * DOC: GuC Log buffer Layout

    * DOC: GuC Log Buffer Layout

> + * ::

this ::

> + *
> + * The in-memory log buffer layout is as follows:

shall be here instead as

    * The in-memory log buffer layout is as follows::

> + *
> + *  +===============================+	      0000h
> + *  |    Crash dump state header    |		^
> + *  +-------------------------------+ 32B	|
> + *  |      Debug state header       |		|
> + *  +-------------------------------+ 64B	4KB
> + *  |     Capture state header      |		|
> + *  +-------------------------------+ 96B	|
> + *  |                               |		v
> + *  +===============================+ <--- EVENT_DATA offset

as you don't use separate word "size" below then maybe

    *  +===============================+ <--- EVENT_DATA_OFFSET


> + *  |  Event logs(raw data)         |		^
> + *  |                               |		|
> + *  |                               | EVENT_DATA_BUFFER_SIZE
> + *  |                               |		|
> + *  |                               |		v
> + *  +===============================+ <--- CRASH_DUMP offset
> + *  | Crash Dump(raw data)          |		^
> + *  |                               |		|
> + *  |                               | CRASH_DUMP_BUFFER_SIZE
> + *  |                               |		|
> + *  |                               |		v
> + *  +===============================+ <--- STATE_CAPTURE offset
> + *  | Error state capture(raw data) |		^
> + *  |                               |		|
> + *  |                               | STATE_CAPTURE_BUFFER_SIZE
> + *  |                               |		|
> + *  |                               |		v
> + *  +===============================+ Total: GUC_LOG_SIZE
> + */
> +
>  /* GuC logging buffer types */
> -enum guc_log_buffer_type {
> -	GUC_LOG_BUFFER_CRASH_DUMP,
> -	GUC_LOG_BUFFER_DEBUG,
> -	GUC_LOG_BUFFER_CAPTURE,
> +enum guc_log_type {
> +	GUC_LOG_TYPE_EVENT_DATA,
> +	GUC_LOG_TYPE_CRASH_DUMP,
> +	GUC_LOG_TYPE_STATE_CAPTURE,
>  };
>  
>  #define GUC_LOG_BUFFER_TYPE_MAX		3
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index ecc3e091b89e..5dab37644c28 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -102,7 +102,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)

nit: maybe to keep all log related code together (can be as a follow up cleanup patch)
we could move guc_ctl_log_params_flags() to xe_guc_log.c as:

	u32 xe_guc_log_ctl_init_params(log);

then we should be able also to hide some macros from xe_guc_log.h in .c

similarly we can move guc_ctl_debug_flags() as:

	u32 xe_guc_log_ctl_params(log);


>  	u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> PAGE_SHIFT;
>  	u32 flags;
>  
> -	#if (((CRASH_BUFFER_SIZE) % SZ_1M) == 0)
> +	#if (((XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE) % SZ_1M) == 0)
>  	#define LOG_UNIT SZ_1M
>  	#define LOG_FLAG GUC_LOG_LOG_ALLOC_UNITS
>  	#else
> @@ -110,7 +110,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>  	#define LOG_FLAG 0
>  	#endif
>  
> -	#if (((CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
> +	#if (((XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
>  	#define CAPTURE_UNIT SZ_1M
>  	#define CAPTURE_FLAG GUC_LOG_CAPTURE_ALLOC_UNITS
>  	#else
> @@ -118,20 +118,21 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>  	#define CAPTURE_FLAG 0
>  	#endif
>  
> -	BUILD_BUG_ON(!CRASH_BUFFER_SIZE);
> -	BUILD_BUG_ON(!IS_ALIGNED(CRASH_BUFFER_SIZE, LOG_UNIT));
> -	BUILD_BUG_ON(!DEBUG_BUFFER_SIZE);
> -	BUILD_BUG_ON(!IS_ALIGNED(DEBUG_BUFFER_SIZE, LOG_UNIT));
> -	BUILD_BUG_ON(!CAPTURE_BUFFER_SIZE);
> -	BUILD_BUG_ON(!IS_ALIGNED(CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
> +	BUILD_BUG_ON(!XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE);
> +	BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE, LOG_UNIT));
> +	BUILD_BUG_ON(!XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE);
> +	BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE, LOG_UNIT));
> +	BUILD_BUG_ON(!XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE);
> +	BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
>  
>  	flags = GUC_LOG_VALID |
>  		GUC_LOG_NOTIFY_ON_HALF_FULL |
>  		CAPTURE_FLAG |
>  		LOG_FLAG |
> -		FIELD_PREP(GUC_LOG_CRASH, CRASH_BUFFER_SIZE / LOG_UNIT - 1) |
> -		FIELD_PREP(GUC_LOG_DEBUG, DEBUG_BUFFER_SIZE / LOG_UNIT - 1) |
> -		FIELD_PREP(GUC_LOG_CAPTURE, CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) |
> +		FIELD_PREP(GUC_LOG_CRASH_DUMP, XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE / LOG_UNIT - 1) |
> +		FIELD_PREP(GUC_LOG_EVENT_DATA, XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE / LOG_UNIT - 1) |
> +		FIELD_PREP(GUC_LOG_STATE_CAPTURE, XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE /
> +			   CAPTURE_UNIT - 1) |
>  		FIELD_PREP(GUC_LOG_BUF_ADDR, offset);
>  
>  	#undef LOG_UNIT
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 0c1fbe97b8bf..2cda92f7b323 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -843,7 +843,7 @@ static void check_guc_capture_size(struct xe_guc *guc)
>  {
>  	int capture_size = guc_capture_output_size_est(guc);
>  	int spare_size = capture_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
> -	u32 buffer_size = xe_guc_log_section_size_capture(&guc->log);
> +	u32 buffer_size = XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE;
>  
>  	/*
>  	 * NOTE: capture_size is much smaller than the capture region
> @@ -949,7 +949,7 @@ guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *no
>   *                  ADS module also calls separately for PF vs VF.
>   *
>   *     --> alloc B: GuC output capture buf (registered via guc_init_params(log_param))
> - *                  Size = #define CAPTURE_BUFFER_SIZE (warns if on too-small)
> + *                  Size = XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE (warns if on too-small)
>   *                  Note2: 'x 3' to hold multiple capture groups
>   *
>   * GUC Runtime notify capture:
> @@ -1367,7 +1367,7 @@ static int __guc_capture_flushlog_complete(struct xe_guc *guc)
>  {
>  	u32 action[] = {
>  		XE_GUC_ACTION_LOG_BUFFER_FILE_FLUSH_COMPLETE,
> -		GUC_LOG_BUFFER_CAPTURE
> +		GUC_LOG_TYPE_STATE_CAPTURE
>  	};
>  
>  	return xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
> @@ -1384,8 +1384,8 @@ static void __guc_capture_process_output(struct xe_guc *guc)
>  	u32 log_buf_state_offset;
>  	u32 src_data_offset;
>  
> -	log_buf_state_offset = sizeof(struct guc_log_buffer_state) * GUC_LOG_BUFFER_CAPTURE;
> -	src_data_offset = xe_guc_get_log_buffer_offset(&guc->log, GUC_LOG_BUFFER_CAPTURE);
> +	log_buf_state_offset = sizeof(struct guc_log_buffer_state) * GUC_LOG_TYPE_STATE_CAPTURE;
> +	src_data_offset = XE_GUC_LOG_STATE_CAPTURE_OFFSET;
>  
>  	/*
>  	 * Make a copy of the state structure, inside GuC log buffer
> @@ -1395,15 +1395,15 @@ static void __guc_capture_process_output(struct xe_guc *guc)
>  	xe_map_memcpy_from(guc_to_xe(guc), &log_buf_state_local, &guc->log.bo->vmap,
>  			   log_buf_state_offset, sizeof(struct guc_log_buffer_state));
>  
> -	buffer_size = xe_guc_get_log_buffer_size(&guc->log, GUC_LOG_BUFFER_CAPTURE);
> +	buffer_size = XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE;
>  	read_offset = log_buf_state_local.read_ptr;
>  	write_offset = log_buf_state_local.sampled_write_ptr;
>  	full_count = FIELD_GET(GUC_LOG_BUFFER_STATE_BUFFER_FULL_CNT, log_buf_state_local.flags);
>  
>  	/* Bookkeeping stuff */
>  	tmp = FIELD_GET(GUC_LOG_BUFFER_STATE_FLUSH_TO_FILE, log_buf_state_local.flags);
> -	guc->log.stats[GUC_LOG_BUFFER_CAPTURE].flush += tmp;
> -	new_overflow = xe_guc_check_log_buf_overflow(&guc->log, GUC_LOG_BUFFER_CAPTURE,
> +	guc->log.stats[GUC_LOG_TYPE_STATE_CAPTURE].flush += tmp;
> +	new_overflow = xe_guc_check_log_buf_overflow(&guc->log, GUC_LOG_TYPE_STATE_CAPTURE,
>  						     full_count);
>  
>  	/* Now copy the actual logs. */
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index c90dd266e9cf..7d93c2749485 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -91,9 +91,9 @@ struct guc_update_exec_queue_policy {
>  #define   GUC_LOG_NOTIFY_ON_HALF_FULL	BIT(1)
>  #define   GUC_LOG_CAPTURE_ALLOC_UNITS	BIT(2)
>  #define   GUC_LOG_LOG_ALLOC_UNITS	BIT(3)
> -#define   GUC_LOG_CRASH			REG_GENMASK(5, 4)
> -#define   GUC_LOG_DEBUG			REG_GENMASK(9, 6)
> -#define   GUC_LOG_CAPTURE		REG_GENMASK(11, 10)
> +#define   GUC_LOG_CRASH_DUMP		REG_GENMASK(5, 4)
> +#define   GUC_LOG_EVENT_DATA		REG_GENMASK(9, 6)
> +#define   GUC_LOG_STATE_CAPTURE		REG_GENMASK(11, 10)
>  #define   GUC_LOG_BUF_ADDR		REG_GENMASK(31, 12)
>  
>  #define GUC_CTL_WA			1
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index c01ccb35dc75..29ea350157cc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -19,6 +19,8 @@
>  #include "xe_mmio.h"
>  #include "xe_module.h"
>  
> +#define GUC_LOG_CHUNK_SIZE	SZ_2M
> +
>  static struct xe_guc *
>  log_to_guc(struct xe_guc_log *log)
>  {
> @@ -37,33 +39,6 @@ log_to_xe(struct xe_guc_log *log)
>  	return gt_to_xe(log_to_gt(log));
>  }
>  
> -static size_t guc_log_size(void)
> -{
> -	/*
> -	 *  GuC Log buffer Layout
> -	 *
> -	 *  +===============================+ 00B
> -	 *  |    Crash dump state header    |
> -	 *  +-------------------------------+ 32B
> -	 *  |      Debug state header       |
> -	 *  +-------------------------------+ 64B
> -	 *  |     Capture state header      |
> -	 *  +-------------------------------+ 96B
> -	 *  |                               |
> -	 *  +===============================+ PAGE_SIZE (4KB)
> -	 *  |        Crash Dump logs        |
> -	 *  +===============================+ + CRASH_SIZE
> -	 *  |          Debug logs           |
> -	 *  +===============================+ + DEBUG_SIZE
> -	 *  |         Capture logs          |
> -	 *  +===============================+ + CAPTURE_SIZE
> -	 */
> -	return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
> -		CAPTURE_BUFFER_SIZE;
> -}
> -
> -#define GUC_LOG_CHUNK_SIZE	SZ_2M
> -
>  static struct xe_guc_log_snapshot *xe_guc_log_snapshot_alloc(struct xe_guc_log *log, bool atomic)
>  {
>  	struct xe_guc_log_snapshot *snapshot;
> @@ -257,7 +232,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
>  	struct xe_tile *tile = gt_to_tile(log_to_gt(log));
>  	struct xe_bo *bo;
>  
> -	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
> +	bo = xe_managed_bo_create_pin_map(xe, tile, GUC_LOG_SIZE,
>  					  XE_BO_FLAG_SYSTEM |
>  					  XE_BO_FLAG_GGTT |
>  					  XE_BO_FLAG_GGTT_INVALIDATE |
> @@ -265,7 +240,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> -	xe_map_memset(xe, &bo->vmap, 0, 0, guc_log_size());
> +	xe_map_memset(xe, &bo->vmap, 0, 0, xe_bo_size(bo));
>  	log->bo = bo;
>  	log->level = xe_modparam.guc_log_level;
>  
> @@ -274,71 +249,6 @@ int xe_guc_log_init(struct xe_guc_log *log)
>  
>  ALLOW_ERROR_INJECTION(xe_guc_log_init, ERRNO); /* See xe_pci_probe() */
>  
> -static u32 xe_guc_log_section_size_crash(struct xe_guc_log *log)
> -{
> -	return CRASH_BUFFER_SIZE;
> -}
> -
> -static u32 xe_guc_log_section_size_debug(struct xe_guc_log *log)
> -{
> -	return DEBUG_BUFFER_SIZE;
> -}
> -
> -/**
> - * xe_guc_log_section_size_capture - Get capture buffer size within log sections.
> - * @log: The log object.
> - *
> - * This function will return the capture buffer size within log sections.
> - *
> - * Return: capture buffer size.
> - */
> -u32 xe_guc_log_section_size_capture(struct xe_guc_log *log)
> -{
> -	return CAPTURE_BUFFER_SIZE;
> -}
> -
> -/**
> - * xe_guc_get_log_buffer_size - Get log buffer size for a type.
> - * @log: The log object.
> - * @type: The log buffer type
> - *
> - * Return: buffer size.
> - */
> -u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type)
> -{
> -	switch (type) {
> -	case GUC_LOG_BUFFER_CRASH_DUMP:
> -		return xe_guc_log_section_size_crash(log);
> -	case GUC_LOG_BUFFER_DEBUG:
> -		return xe_guc_log_section_size_debug(log);
> -	case GUC_LOG_BUFFER_CAPTURE:
> -		return xe_guc_log_section_size_capture(log);
> -	}
> -	return 0;
> -}
> -
> -/**
> - * xe_guc_get_log_buffer_offset - Get offset in log buffer for a type.
> - * @log: The log object.
> - * @type: The log buffer type
> - *
> - * This function will return the offset in the log buffer for a type.
> - * Return: buffer offset.
> - */
> -u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type)
> -{
> -	enum guc_log_buffer_type i;
> -	u32 offset = PAGE_SIZE;/* for the log_buffer_states */
> -
> -	for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
> -		if (i == type)
> -			break;
> -		offset += xe_guc_get_log_buffer_size(log, i);
> -	}
> -
> -	return offset;
> -}
> -
>  /**
>   * xe_guc_check_log_buf_overflow - Check if log buffer overflowed
>   * @log: The log object.
> @@ -352,7 +262,7 @@ u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_typ
>   *
>   * Return: True if overflowed.
>   */
> -bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log, enum guc_log_buffer_type type,
> +bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log, enum guc_log_type type,
>  				   unsigned int full_cnt)
>  {
>  	unsigned int prev_full_cnt = log->stats[type].sampled_overflow;
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
> index 98a47ac42b08..0bd5e89d75e0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
> @@ -13,14 +13,26 @@ struct drm_printer;
>  struct xe_device;
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
> -#define CRASH_BUFFER_SIZE       SZ_1M
> -#define DEBUG_BUFFER_SIZE       SZ_8M
> -#define CAPTURE_BUFFER_SIZE     SZ_2M
> +#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_8M
> +#define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE	SZ_1M
> +#define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE	SZ_2M
>  #else
> -#define CRASH_BUFFER_SIZE	SZ_16K
> -#define DEBUG_BUFFER_SIZE	SZ_64K
> -#define CAPTURE_BUFFER_SIZE	SZ_1M
> +#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_64K
> +#define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE	SZ_16K
> +#define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE	SZ_1M
>  #endif
> +
> +#define GUC_LOG_SIZE (SZ_4K + \
> +		      XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE + \
> +		      XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE + \
> +		      XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE)
> +
> +#define XE_GUC_LOG_EVENT_DATA_OFFSET	SZ_4K
> +#define XE_GUC_LOG_CRASH_DUMP_OFFSET	(XE_GUC_LOG_EVENT_DATA_OFFSET + \
> +					 XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE)
> +#define XE_GUC_LOG_STATE_CAPTURE_OFFSET	(XE_GUC_LOG_CRASH_DUMP_OFFSET + \
> +					 XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE)
> +
>  /*
>   * While we're using plain log level in i915, GuC controls are much more...
>   * "elaborate"? We have a couple of bits for verbosity, separate bit for actual
> @@ -51,11 +63,8 @@ xe_guc_log_get_level(struct xe_guc_log *log)
>  	return log->level;
>  }
>  
> -u32 xe_guc_log_section_size_capture(struct xe_guc_log *log);
> -u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type);
> -u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type);
>  bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log,
> -				   enum guc_log_buffer_type type,
> +				   enum guc_log_type type,
>  				   unsigned int full_cnt);
>  
>  #endif


otherwise LGTM, with kernel-doc fixed,

	Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

