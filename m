Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C04D3B7EA
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 21:12:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06FF10E121;
	Mon,  8 Dec 2025 21:11:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TqIHLSHZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265D710E121
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 21:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765228319; x=1796764319;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FKDas9KDeilooPudoJGo187pSwX71lMCPPjscSu84ss=;
 b=TqIHLSHZts6BJgjcgVDWb/htOkg1zWdz8+5oUaSBROMUphhYS5oSkbU1
 buU+93dcUzXfAAlXzHc7YwDL8k3yQWSnB36Xy+NbS0hW7YuKV4HVfDSr6
 V4aeCey3C8u+X0Ke289Au8EBifF90OmDDex70/vUQUe/EsD/jqFdj+GbV
 aOiShIRNOYwl2DgCyrr5YgEFsRBuqBvweW8dk3IbeLpM5PQonYQ0/eCis
 5AyiggjXgTxZXCBLOFALKHcoxD+boO6j8rnMss5T99C9qphDk8Qc45yAa
 T7G+5SN3OTxz5aVS4Fpf/L3V2D2swyJOUve7CalP8Psst//iLWS5T4o5M w==;
X-CSE-ConnectionGUID: rRJcVeAhQsOTIIpvke/zPg==
X-CSE-MsgGUID: tWqiHPuzTm6AIjNKxnAOdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="54720442"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="54720442"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 13:11:59 -0800
X-CSE-ConnectionGUID: 00qh8fJOSh+6hAdDVhqFzg==
X-CSE-MsgGUID: e8vnG4zQQt2juhUBWtqicQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="196499757"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 13:11:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 13:11:58 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 13:11:58 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 13:11:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4xPJ6G8mC9PHxMUQp1Xk6ZcvmocmpAjXFbgp2zXaGaz5V/8y+a+jOo/dYHX4PNIOqX7pez9LBCVxHzNXVPrV6RHKnEIIWMZ0l0+d8QSd1axh9PTDLMMr+lEo+ExEJHM80piiu0C6v4rbLsm5tlnjtSQyrhvT/ybM35u9YKYLM/9caNPSF+wObexVXJiSq44ow7i4LNF0NNnNdbmPZ+gmgghHUnQVCWHccEf9o5YnPpC4oHS9s1AZSNF5j3/+4wBGCQ/A857dxAC4wfr6zfYES5sfM/o2DgNEZKfKJ0M5ovlYpm9TEZV0R0RAq8jm4c2lAnSfC1EpxM23v/4lJ7Siw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1m3LLHIUKoPVLSFueZIwUCW7ziBxPTuCUG/HIycpijw=;
 b=dkTEbU31Wg1t6hj+otn1U9N/PwVvfrv5KZwZCN60XJZXBLoZR9srRC3R0Oukp4ItLfhTezW2TzHEVIAxxup3Y2379nNWLYocppciEOL2K3+n2qOgmRhzXvFZkT5n10PLyXsMmnf185Gm1YO2CjM+2FO1t6lsQDRjOYmJki7dF25//lp4Wgnd1rcxKY/M5IRpwCVUPIDL4e3B8XMf26uy0KrhSV92Zq8LcQTrEi8n2QeIUPS/hZWphQs9s8Y4IxvkvxOqvv6zPddYfltJU7SIK4zl6DDEeDQJwIng+DG6WsH4MC89kDfOlFvViIH31RCJJE/iFwbLKjZOac8DnR7/iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MN0PR11MB6088.namprd11.prod.outlook.com (2603:10b6:208:3cc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 21:11:56 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 21:11:55 +0000
Message-ID: <2015cc97-e380-4ea7-902a-c674e55a39fc@intel.com>
Date: Mon, 8 Dec 2025 22:11:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe/vf: Avoid queuing migration recovery if
 queued or teardown is active
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20251208072739.336647-4-satyanarayana.k.v.p@intel.com>
 <20251208072739.336647-5-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251208072739.336647-5-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P191CA0007.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::17) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MN0PR11MB6088:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a88e264-824b-4d56-3c19-08de369e6ab4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UXJ0WStxUnd2VkZIZjJIeWxuS2hYYllrZFFiYjFQaVhUYkxkTk9waGJGU2o1?=
 =?utf-8?B?aFRkdlptTHFwdUNOb1B3ajNTK1ZsWG1kc2ZwNHhoNkJxVFRFd0tGNkQ3UEg3?=
 =?utf-8?B?Yis3VVRCVi94dDg4Q0JzaVZCeFVBTXBweHFSN1FidTIxZU9PdjJxVVlJbEp2?=
 =?utf-8?B?MVIwRlhwOGVJOU55THd1RERpNGtMeXhBeTZpYVFBemxSRXFHbFptOUNnYlBC?=
 =?utf-8?B?enR3aWJaNXkvNDBNNVpOQkZMeVVsWWhLSVVZaGhjZlJOd3pBclBSdjliWThF?=
 =?utf-8?B?MDF5N2RXU2JKNVZnRFczQmc1V29ya3dkUG5YS3VyZ0FxK0VPbzFwaE9UNUhC?=
 =?utf-8?B?eTZIdFlCWUt4SnFSb2gvdWRUWERQTms2bkw5Rlh0ZlIybVRkSEc2RC9Sc290?=
 =?utf-8?B?VXZVWmo3Rk4ySitKUzF1ZXNyTmhxRkJHQnlDeThKeE8vbEtRYk1mQjgrZnUv?=
 =?utf-8?B?NW9POGd3aHI2NldWUG9NMkZudk5QdThkMmVoZHVLL0s0NGYwS1hVTk04Wkhh?=
 =?utf-8?B?aWdrMGI0UkkydFhkVFJXbVhtV3lwMk5xVXZ5UERqS3pQOGFrWHRhSmpLTWRk?=
 =?utf-8?B?SFBFV0cwVWk2Zmt2V2ZSMDQyNFlKK1QvVk9SeTlmYUxTRWEydDE4enVSck1K?=
 =?utf-8?B?R0JSRWsyVXBxZFZsVGdaU1BxU0dMYnRpWEJxSCtKTFN1YUdESGFXVTdNWEdF?=
 =?utf-8?B?SVBBYjExVHBhcWJRMmlBZmJZeFp3am51WW51bVVkU1lRSVZ2SXN6ZUNtWkNO?=
 =?utf-8?B?ZWVjU1daT1hpS0taQ0RLaGFXcUZJR0NkSUJUM0dkMys3NVVTeTJLRko3d3RL?=
 =?utf-8?B?alBjVVZUQzhZaUI2bXFYam5aUkhwbUFnQTdQOXBWYUdyUURROHBoRzUrbmZ2?=
 =?utf-8?B?L3lHaU85Tm5EOHlucWxoQnZ5OXpwN0M0dDh3cURoWDF3Q24zZURSWnlaZ1dY?=
 =?utf-8?B?b3kxSUpONHNGTGhhR1JnU2FmZmFlcDNYMXpWTk13UWtuUVVwbEh4d2ZWOS9s?=
 =?utf-8?B?MjVLUTF2L3FEZXZ4ZU9hNk40SzZlVzJDTitvcTNHRmhsSDB6ZURKRzkxM1JS?=
 =?utf-8?B?NUJnb2huNEFnSS9BbzBFMUhsbElBS3pMSXg5YjRVRFR2b1RTenVSRFV4Ymdu?=
 =?utf-8?B?WGJvY1ZSUDRGSXdxdEJKMXU2UFNXMTV1ejRvN2NjVjVveFBjWmQrdThJYUhK?=
 =?utf-8?B?V0wxZjNnQmdRVE0rL05uUkVRYzZyTmJoTGw1b1JkQ3Z5YTMwZXBjNldvcEZT?=
 =?utf-8?B?MnF1UUx0RFpNazg1MXI3SEc5ZlNHVzJHMCsraEdpdlcrWnBBNi9mQkE1eVl6?=
 =?utf-8?B?aE5qa1RiYWY2Vm9OUmNSM3d1RU5MSC9rSVZUOVFFZEpwMWp3OFRpazNwZ3Yx?=
 =?utf-8?B?K2drTUVFc0hNbnNJWVBxSE90TTE5R2s1MWtDampTQXV0a3NWY1E2eW5pZW42?=
 =?utf-8?B?ckprQi82N2NaNXBZOHNBUXFEbmo0bCt4VWJvMTN5YTlOMVd6ZEowSHUvN21C?=
 =?utf-8?B?Y0xHWFljREhsUitVMllLWnR2L0IxWGx0T25rQ1BGdU4wNkF0bmhScno2b3hu?=
 =?utf-8?B?UHZJS3Z1d21MMjZiSXJoREd1UDBmZW83VWNzSys5Y25pYWNNVG9jd2pZMGo4?=
 =?utf-8?B?djdLYVkxaVdaMDZaem5oamcrWmw0TlVQcTZlQlBjU0NkUTIycGZEYTY3OHV3?=
 =?utf-8?B?c1EyNkJLS2U2Q1FaQ2h5bzJQQ01Db1hyVE5hQXZFaFJ6S2E1R096TnI5dG5k?=
 =?utf-8?B?MTYwMVVFdTh6STltMnBZU3dzbVRHSWkxVXY2K1hWUnBlaGhNeldEdldiRk9P?=
 =?utf-8?B?LzdQemxRbGJqOEs3RHFFa1pOZUtvVGozWnhEbkliOUYvd2FGZmp6V01yWjV5?=
 =?utf-8?B?czFtK2VZTHA2Zk80dXV2TFJSK3hzRWxtMG9oVzJGSFNVckNRR01PT1l6RmtK?=
 =?utf-8?Q?Fqpqbt23wJCSsBb+9gDcgromm9ATC3tZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGxQQjRmN0VTVG5JWkJ3M3QxczNwSHVWRmNkZzVSUzgzSXRod0ZMbU0zQ2dU?=
 =?utf-8?B?WTcrbVhVeUt2NW8yOEdBRU91TGllRGsvRStiQlBYc0tvVnZ5dkhyUG5OT0pH?=
 =?utf-8?B?cFV5YkxNRlRZUkgvL3Izc1ZaRElOdlI2SEFRT2kvSXBhSTlhWjkzUDNuMUJs?=
 =?utf-8?B?b1NHMk1SRWk3eVc0SmZza2c1V3NZSVBYSk1VVStZZXFObWlMVVhaS1BiUStK?=
 =?utf-8?B?QVloelJ5cm81b2NIZkxmU2NYNVpQbStzSlZXTTkxdHVxRFlnY1hUL2RseEg3?=
 =?utf-8?B?Wjh0TUVYRnJROXJ1M1JPUU1nRDZESG5JQlVUS3M5YlNIcWdPa2JOQlhVMXhp?=
 =?utf-8?B?M01Tb0dyM1Z2QzZjMmdUZ1hXU0ZxZnBqU3Y0WVg1bjFMNGxnZDhzUFlVeUlV?=
 =?utf-8?B?Z3dhWjk0UkxQekNRWGp5aXphUUhyRUpueWMzSUMydmczbUlVeWxiUlB4Z2VV?=
 =?utf-8?B?NTlSY0pDQWgzdEk2eVA4NGZlN3VDeHp2UU4ydm9CZGY4NWJqSEFTcXY4M05Q?=
 =?utf-8?B?d1VFamRvbzFvOXVCeWswRGpTNk85VlJ6Szh6clFKN2ZCelZweFkxamxPWFdO?=
 =?utf-8?B?QUhOM3R3cXNFaU85WFVwYjlOODM2TnZxQTV4TWJuaGVYME1PcmVaWnpYMklD?=
 =?utf-8?B?SHFrYnR1RnhPeXdIRm1ZS0w5T2lwaU94ZUdSMjVaL25ycWJlL3NrR3RqK2hN?=
 =?utf-8?B?dERnalVuY0ovejYxbU9NUzhvQ1FqV3gzakc0ZGxBeEIzUDQ0UFJOenB0R0pZ?=
 =?utf-8?B?SkdhYnFSVEd3ZEI2M2QwWmNvcWI0dFd4SmtOV3dZZjBmL0RPaVlZV3NiWURu?=
 =?utf-8?B?aDlWOHlxaWg5ai9zdkE2eWVkMm5wUmxLdzdrZzg2U1ZjTnc1R3RXdWFGL2lX?=
 =?utf-8?B?WHdPa3pYZ0gzTUNJWWJaZVBTY0E4YXdHbDY4cFdrLys5WDZwWlk2MWNlUThX?=
 =?utf-8?B?RzZ2RnYzVjdaUkNvZjNiQ2x1R1pGc2UrRUdTeHNHd0g5ZXF3QU9EblYrZHJ1?=
 =?utf-8?B?MHR4YzlEbkd1VVV6R3pHVlpDUEVYYmN5dC80djVaTDEzN2pyeTBiU3ZROFBp?=
 =?utf-8?B?VmdRajA4ZnhrUHk1Qm5teFB5NVNsWFNtTGt6NG1ua1R6a0MzK0h4UzRPbDVZ?=
 =?utf-8?B?NzVobElvdUxGREdZSnhZYkI5MnIxazVVMGxYUzZ0bFM4Mm9TYlNDemZqN1Ux?=
 =?utf-8?B?SVRYWEZsRGlxay9wMGNSdzgzTURWanRvbzIxdXRuemtVZkdBejV2bDJiUzdU?=
 =?utf-8?B?RjJYRnBNR1dFakg1WmtVSVoraUVCN0JsaUZHWUpDTFFwdm1DUDJsdUZmZWF3?=
 =?utf-8?B?UmxQcTBqUkNTeTR1Rll4dFI1WCthYytBN2dXTTRCcVA5S2JUaDB1ZUtXRWZO?=
 =?utf-8?B?cm1hU0dGdjNWcTJRK1ZOR1FFUzRjNXd1WlBJdnYyMEpYY3dZbWJhb1UxVFNr?=
 =?utf-8?B?WUZ0UWREa3RpcUp4SUFqa1dwNUtZR1VNbndIZ0plek8vLzlSYW5Rblk1d3pZ?=
 =?utf-8?B?WE9WZzJrYU1LMXY2akZ3ZTVxNEk0eTdFWkc0MjdHRXNkWUhKTjh2NGZPNFRL?=
 =?utf-8?B?SitNTk5PRzZXNHBWUEJYNXpzWmxGdmorYWZpeXp3YkNMelFZWWRqaHFlcjdF?=
 =?utf-8?B?blp3OVM2K2JGc25vZHNHMUFDNUtGeHlacVV1Z3BLaEZYdTlXQ0lHcGFMUldG?=
 =?utf-8?B?TXUvelhkTWhvVG13Uy9MeEkySzkrVE93aVNENnR2dG5MWFF4dkF2ZEZFL0I0?=
 =?utf-8?B?cVc4YWZMZi94STJwd3E0am9TeTByTmNueTEwdHlUWk9wS3R2RFhkL0lKVzV4?=
 =?utf-8?B?TFFqbTlxS215ZjNqK3hGRzZzT2ZndjVwcWo0ZFZDR2djVU9rNGtWRjlGbC9o?=
 =?utf-8?B?N0wyRzREdHdpaG1aL3BBUXIyM2hzeXpqZmI5QjZndWo1SUVYYzlsSWwwVENu?=
 =?utf-8?B?N1hGYjc4U0t4NUFVRU5ZMWlmd3l6ejJJdStpUFhjeHJQdjRSc1BPWndLbGF2?=
 =?utf-8?B?VnB4OEtJdytITHRmejBmQVA1elgrWFQxcEVPZzd5MWp0UCtVbVIwUUNSQVor?=
 =?utf-8?B?bFA4TEJnVENSN3hkNGZxUHY3TFR6bFVkL0l0TzdXM2NGVmRhRk1telc3NFFT?=
 =?utf-8?B?SjBKMzluNXdWUWliNS9ZcURKZ0FKTGQ4K1U3dk0xeEhFQVNwY3BSczlVUmlp?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a88e264-824b-4d56-3c19-08de369e6ab4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 21:11:55.8377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JW/F0MO57zmHYWl6FYKETR+AmiBrw5w9HvkwhDygCdupfeH/lYbcCBxja34dev2EtfVAFHZuQ/GLqsdTF9vVn4NbYY9gUXPk05wGkLEVTVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6088
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


On 12/8/2025 8:27 AM, Satyanarayana K V P wrote:
> Ensure VF migration recovery work is only queued when no recovery is
> already queued and teardown is not in progress.
> 
> Fixes: b47c0c07c350 ("drm/xe/vf: Teardown VF post migration worker on driver unload")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>

nit: subject is little too long, maybe just:

	drm/xe/vf: Fix queuing of recovery work

but fix is fine, so

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> 
> ---
> V1 -> V2:
> - New commit (Machal W & Matt B)
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 3c806c8e5f3e..47612e67d462 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -781,7 +781,7 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
>  
>  	spin_lock(&gt->sriov.vf.migration.lock);
>  
> -	if (!gt->sriov.vf.migration.recovery_queued ||
> +	if (!gt->sriov.vf.migration.recovery_queued &&
>  	    !gt->sriov.vf.migration.recovery_teardown) {
>  		gt->sriov.vf.migration.recovery_queued = true;
>  		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);

