Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6543CD6DDD5
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 05:47:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2090910E38E;
	Fri, 15 Nov 2024 05:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wnm8PKGX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A606F10E38E
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Nov 2024 05:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731649664; x=1763185664;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hK0tpeatjy/za2NXLFkOD+u/c5gqZ4CBYl3WVqTtADo=;
 b=Wnm8PKGXTk2g3NxVGQjbc7NjeZDYqFo2l1MauNgHuvDxmz0vHsSJdIcR
 LpSbefewCq31ZSVl3dhltf12KPF/561MXOdURS1//ly00skXmucc6gJbn
 8PZadXadt/XFoyqScGEMrcrQ3WETEooxmwAPhPny3LWEfj3E2jjsf16PG
 YOc7krgM6hn/IjRhf+gwplKpZySfBnX1F2kxY7YanpG+6HnyYfq1Q+o7E
 Z6wjzHOe5he6aa70Z3i5zUxIrGJns22jJl0x51Q/9g8f/J0AyHetQsw7E
 TeIYdseLGtgk6tXnhUdEfh7zDEiD7g5gDISM6ubUt5hJVlLf/10B9RFiW A==;
X-CSE-ConnectionGUID: s2DJXF+2TFe9TWtlWujEgA==
X-CSE-MsgGUID: KLjW41isQ3q1CwzH4V9a7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31573585"
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="31573585"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 12:36:54 -0800
X-CSE-ConnectionGUID: GolqNF2qSmaP4uFKSqRXMQ==
X-CSE-MsgGUID: bhZsKaw2QJOhzryw0liojg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="88740345"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 12:36:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 12:36:53 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 12:36:53 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 12:36:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d7pkNSutUvQA5TRYQuWjx2vwdfI7O0d/U9bAyOurdvOhvIlinDSJG7umPATgZv6pTrvD/1RfHT1QeWU5EbgBi+W+wkci6c/7zZ5cr7WgfMNgypMpA7zEKi1d41x1pQu8/2fXsmd9p3XUWO7rK66z1GC4NEUIOVSu7Nm618oN5wah52IbvEMEDM/cACiMSSkjxmJ6zcKOn/bdN1ce6yy3fWMW9BBy84ZG0LbsA+MxQGujSEgzBnVzE4VKf2NB2BgBCZ20BTTzPyih6SwSJYJQrQTshKUPTpddnoM12BoECxWW7XnxerBFiG2075+thMDuNzdCRRgEoJ6PgVf9g3+FDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8b1LeqkAdhvc5+lCT3wa+KQV/upDnDG/NxFt/qL0Kc=;
 b=tFd8CLwMdJP3inj99iK/ZHvIdlc3BtENWkgX/AA62xwXWFUVMyBHzWzotWmmr5wS00I8W4gMvw1sM13FL8ouPwf0ccDtR51+fSWwXUSm1CakwzpcU/UlCOf8r8YYLTasukXwpD2rI6XviYemZzz6W4z6BvrLQddPMK2kQsc5RUG/nylbYZNYDLhwf10qE3NbDjvSni2MQ2nT06sSXnE1X+e5Eul2jWQfXqfsZ1E3ArrrswdbZokeRLPvHRXLvtlY97GFVKCG3biayuJhusSuQ7QSNfoBsC17PcoveWjVyK0U8BE4m3f6Tx+l7Wi5aHxGdFBHBS7RE27i1Jk720iwow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Thu, 14 Nov
 2024 20:36:51 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 20:36:50 +0000
Message-ID: <799e2c4a-e41c-450f-b69d-f2978de5a0d8@intel.com>
Date: Thu, 14 Nov 2024 12:36:47 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/12] drm/xe/pxp: Add GSC session initialization
 support
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-7-daniele.ceraolospurio@intel.com>
 <5a1779e7-14b5-4ff5-9c25-1ccb8bc5f05b@intel.com>
 <6f649863-750a-4289-a8eb-4418652ca46b@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <6f649863-750a-4289-a8eb-4418652ca46b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0101.namprd03.prod.outlook.com
 (2603:10b6:303:b7::16) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH0PR11MB7424:EE_
X-MS-Office365-Filtering-Correlation-Id: 222d1a23-5c96-4ab6-84c1-08dd04ec10f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zy83V3Y5NG53OHAzeHJWR0hhWkJlZzJoMzJTS054NFJkam1NeFo5UjE1RzAv?=
 =?utf-8?B?QkRGYmJINjM4SVBXK1diV3JGZHNiekdOZEtMaHp1T1BSZ1hPUnFXRndZb2dQ?=
 =?utf-8?B?ZnZQVVR2Tnk4dVp2TEFSSHhtelplTzZ1RER1MVdXQ3VhbmRFYUhBZ0M0QkVJ?=
 =?utf-8?B?RE5zQkdFWU85RjJVTVgvQ3I0WkYxQUlGQWpYNzVMakIzdFJzZzc1eVZ2Q01y?=
 =?utf-8?B?T2lUQ3EvTCttZmw5aUpxR2Y5Q3V2WVNhT3Q1SmFYckh4L2t5NGtUSHJrbURy?=
 =?utf-8?B?Njd1Q0RLVjkwb0xuc1YvMStTRk5KS2lrR2xIU0o2bW8xWXgzd0ZXZ2loNWdP?=
 =?utf-8?B?VlNPQ3N5Mmg2VytxYnROYWM2YnI5UmtXYzc5ajNQVTdjSCtqQ1JJS2FyMitN?=
 =?utf-8?B?RkVXWmRGNlpPZEFWR0FQcmI0bFNXZmtEaHNYcWd2VTZnUHFuTTF2cDh4Qitt?=
 =?utf-8?B?dkxDYnY3aW5scUk3a2NXTmlQMzArSU4yM0RPaUZGVC9WUHdXUkh4UmQyUjhY?=
 =?utf-8?B?d3JvbzB0R0FOQUVTd3RvdjlJVXVVTDFoVUxWZnA1MHcvVUE5dVJVUkRrVG5t?=
 =?utf-8?B?TGpwS0dBRDY5Tm9kbXRpMThLblFiek0zeVZ2SjdqRDJiRSs2U0RxNHRrTyt2?=
 =?utf-8?B?TEtYV292VzRvckVCV29ONHZFQXpTS2gwU0VpU20zQm81bHBaRWpFMkZPcjFL?=
 =?utf-8?B?MmREOHdpajRQanE0VjlBS2xUTDhDOFpKSms4OW81ZTl0TnA4Vnd2a2dXcHA4?=
 =?utf-8?B?WTA1cEI3NzgyTzdCWGFocFhMa0Y0Tm1EeFlEZWFTK3VoVHRCOU9JSjcrVkp2?=
 =?utf-8?B?eHU5LzVJeU1NRG4zVEQxNVNjNjZFUm0vdEU1MUxGSkI4ckdWV1BoNlU2OTgw?=
 =?utf-8?B?TTRYWVFDRnJndThtZ2R4d1FTL2FYUTNkSm0vSXUzbE84QzRoVEVuWVlZL2E1?=
 =?utf-8?B?VWlpbUNUUWZZVFdTRGx0UkN3WHNLK0R5a3pWWmk4RVFuUldNQVFHWmlISXc5?=
 =?utf-8?B?cHZPZk1kMUlkY3hTNnRPQnBERi9vTFhsYU0wV2JYZjRrbm9yMmF3MVg3L1BB?=
 =?utf-8?B?V05PeTU3Nmx6Y1dCMFRHS0cwNmZrU0o5QmpWNG1TcUl3NXQrYzhvNVhxTmJF?=
 =?utf-8?B?VXBYbSsxUklxWXlsM2d3elQ3MHp3QUt6TWZwUTdsVXJLaTR1R0xrUzZTNzFS?=
 =?utf-8?B?RytTS2xCT0pCTzVXMG5KcW9LVk8wYmZvY2x6SXhzVlBYUjV6cG5Vemc5NG9s?=
 =?utf-8?B?dzZPVHhmUmMrWUc0cXVXVFF3UkQ3bytTbEIxaFRJTmJWYWFEWHN4SEdrTDQz?=
 =?utf-8?B?aGZrdmt5enRnak4xem5oOHJWT0Fjd051eUVaSGR5SExnMGpWdDMyN0UyL1dQ?=
 =?utf-8?B?UGt2MzV4M2ZGM3RaQzJFRlRTZ2ZFREhlaDEzNDlxcFNnLzNONUd0aWlMNDF2?=
 =?utf-8?B?VlNQZDl0UHhyZFo4UGZ2YUZqRkVXekoraVY5TnBGZmgwRjBSeDhVd1pRcUFi?=
 =?utf-8?B?OEtybjNnUGFKc1lZeVlSOUhmYWRhV2NjTU5oMCtFU3h2cVhtY1loY2ZRdGF4?=
 =?utf-8?B?VVJmbXRxUkExZzRmQ1pSbGlGYkUreE9QREc3S09wdWNQQzVuSVpnaExqWnF3?=
 =?utf-8?B?VVFFVHVRRmhPQ3BlVkFhRjVRN3pJdHVnakdiZnIvM2c4SVlmb2s4VE0wTUZs?=
 =?utf-8?B?WCt3UW9ISEtGa3pSWDJZci9RckdKU0IzK3Y1dmxNZEIyVjlrTWFPME40ZTVY?=
 =?utf-8?Q?+BkuyY/AMujhCVzHKRE8yihneGctvdBOib0T1MX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yks4a3hKN2UzRjdzWGRUczF6UE1VeTdZdTRhWndXYkZMN3hSbklJdnJDdFN1?=
 =?utf-8?B?SXdRZjUxWlBISFo3T1FEY3AvNGV2QmxseEU3TytBQ200VnRVMUNqbFBwVlQy?=
 =?utf-8?B?czhZWVYxYjN4b0o5MkNYc1BjM2x2S0VwNDMrK2FsaDgwSWJYMEZicnIxWW9K?=
 =?utf-8?B?ckJuRlRJejR2TmpJenZtZUo3Z3RsMUs0K3lLTVg0dm5ZcEZIc1U4WEN6K012?=
 =?utf-8?B?UC9pQjcwcjRkb2ltb3c0ZFdtSXVkNWJwQnRDZU1WS0VFOFpvbW8vOWlRNHly?=
 =?utf-8?B?WUUwaS9wdmRkaURxTmVydHF4OU0xZDJ3U0lCRWxOaWlTYkRYZTFyWGRFNnhU?=
 =?utf-8?B?RjJNc3R4M3JPK3NTd09Id1hxRTNYekVRK2YzYnM4RnhBWmlHNGNBMDkzVVJP?=
 =?utf-8?B?citqQTVxM2J3YjArb0FCN3FCT0I0REp5N2Fqa0dkYXMyOGJBM0FDTGhzakhl?=
 =?utf-8?B?T1BONTliVklpOVB2R284VDhFUVRoY0tZRWhrVzUxaW1SNDgrOHcvd3A3TW10?=
 =?utf-8?B?YllSL0hReXQzQ1VIaWNFWmRxb1ViUnlCbEp6Y2pQOEZoMHU3QlMzeHhXN2VG?=
 =?utf-8?B?NmdqNXJUL3diOC8zWHVVdTV4VGhVWCtybkpjMDFETXNYYXNYK3RtRHdFZE5H?=
 =?utf-8?B?dUlDaW5jMk5ZWjdsNThPb1NvZERXQjRxOE9OVUpxUVJNd1NVQTZibjUrd1dK?=
 =?utf-8?B?Wmppb3lmcHNmVDl2eUpZWTdsUDEydklGQ1YxemRobnBUTVdTOXR0MmorOWR6?=
 =?utf-8?B?QllHbTcxT3czcllmUlNHTGk4OFkwUHl3Q29JV2FBczA1bGVleGgyZUV2b0Fp?=
 =?utf-8?B?djlueTYybFdOM3E4b25UY1VNTmZqTjdWS0c3Y29hVk1Ud1oyaUJubTJEbVpu?=
 =?utf-8?B?Sk5oZzBxWlhKeUhyc2lYYlhSV242TmJONUtrR28zMTVQaUxFL0ZiL3JyR2hQ?=
 =?utf-8?B?UVc4TFlhMUpnRUNOTHFPTEsraEtrdkRwUkwyTzh2RlR0bW5Mcmc5RnpsQlNa?=
 =?utf-8?B?ME16d0sycUhFWlczYVgwbFZGLzkyYU9JMXZrZUZsQW1LMEkzOFJjNzlQSmhY?=
 =?utf-8?B?OVA1TVY0WWRQK0tkamdscUNDNWlGemVBOXpMRnVnbDNSVkJsR3h2WXlsQUtC?=
 =?utf-8?B?NHZOY3VXNFlYOVFQcHo3VytJTHdHL3BFRXhYY2tORHhWZ0lrcjdIMXZlcktY?=
 =?utf-8?B?N1ptRXRNeHZQTEpjcWhBL25vZmpYOEsveG5vbVFtK1dNQ0NUb3dKTllMOHBD?=
 =?utf-8?B?dGdCSm5Ub1ZmN3h3b0x1TXRIejZjbWhDdGgrMGR0S2ViSWRxTzVCaHoyV2tM?=
 =?utf-8?B?d1RibDcwU2ZWbHFlMjVWaE1MdGhWLzJEWWRYeUhGY0FhMDI2UmFCZXh6cWtn?=
 =?utf-8?B?Vmg2eWRzYlM1dEp5VDV0VXhYaFhINEd5RG1na0dNVU81REJpZnVtSHBIb2p6?=
 =?utf-8?B?K0xzT1h5cXVjeHlGakYza2R2c2VBdzdwWHBVTGRiU09MblhmdnBHUG1OdGdW?=
 =?utf-8?B?MXJza2Q5L1JUbi9RQXJRaXJxVllManZpUVZ0eG51N01MZGhCb0lxbGpsdkhI?=
 =?utf-8?B?S0lmM2ozUjM5RXpud0krY2dzellTYkdMUEczZ1lpTGttc211cWtJYjJxRGpW?=
 =?utf-8?B?Rzk5Q3o5bzdwL3ZIWmpUaTJDaHdJVGlBTGJJNTFiaUpVbHN1L0FQMndXa2FJ?=
 =?utf-8?B?M1VLTXBDTEo2RTFDZ2xxOHZFQ3N5VTVJR2xxT0xYMmJKR2hVRnRlMWFrNU5X?=
 =?utf-8?B?dnNOeGhUMzd2MEVFNlZlYitVaXpIQjRuZjNWZ3lHSWVzR2txSjVDVm5xVk9G?=
 =?utf-8?B?NCtkRDFjMUxTdTBBRDYrOVNVdlpzcUk2Zk91QjlBakUyMFdCcU44TUY3eExG?=
 =?utf-8?B?NWF4cjQxeng4Y2Zyb2JoNGpJQm5mQ21IRzZnNDYxWnZYYjhGT0hSL2lYcjUv?=
 =?utf-8?B?RXk1VnQrd3ZmZHByRDlmSWwyTlVGV2FKUWJONFE0NHhsNVVLVXhvOG9RWDEw?=
 =?utf-8?B?Rk1pMmxlaVUzMkpoK2dDV1N3S1JCV0FSVTVqcHg3YnQwWEcrSUUxbnVMayty?=
 =?utf-8?B?Ri9RUzZvczhnbTB0WldFbkxjYkRZVXRHU2c3VkJPZU5lOWdFaWJCOC80clJS?=
 =?utf-8?B?UkJPVS9IZ2xpZEZPa1FDNXQ0UUxwV1RIVlMxMGJMeklsU3JwOHBOWGY3eW04?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 222d1a23-5c96-4ab6-84c1-08dd04ec10f9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 20:36:50.2132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dZoDeeDBEhEkrnQKs/i2iB/XIqv9J5SF38W+iYpPpObCQ4mqNjNjjvFNttPMc0OUSpMXJiAsP3TOvak1JkG5LfHM6FG0+McEHIn3/dsuqGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7424
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

On 11/7/2024 14:37, Daniele Ceraolo Spurio wrote:
> On 10/8/2024 11:43 AM, John Harrison wrote:
>> On 8/16/2024 12:00, Daniele Ceraolo Spurio wrote:
>>> A session is initialized (i.e. started) by sending a message to the 
>>> GSC.
>>>
>>> Note that this patch is meant to be squashed with the follow-up patches
>>> that implement the other pieces of the session initialization and queue
>>> setup flow. It is separate for now for ease of review.
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h | 21 ++++++++
>>>   drivers/gpu/drm/xe/xe_pxp_submit.c            | 50 
>>> +++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_pxp_submit.h            |  1 +
>>>   3 files changed, 72 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h 
>>> b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
>>> index 4a59c564a0d0..734feb38f570 100644
>>> --- a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
>>> +++ b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
>>> @@ -50,6 +50,7 @@ struct pxp_cmd_header {
>>>   } __packed;
>>>     #define PXP43_CMDID_INVALIDATE_STREAM_KEY 0x00000007
>>> +#define PXP43_CMDID_INIT_SESSION 0x00000036
>>>   #define PXP43_CMDID_NEW_HUC_AUTH 0x0000003F /* MTL+ */
>>>     /* PXP-Input-Packet: HUC Auth-only */
>>> @@ -64,6 +65,26 @@ struct pxp43_huc_auth_out {
>>>       struct pxp_cmd_header header;
>>>   } __packed;
>>>   +/* PXP-Input-Packet: Init PXP session */
>>> +struct pxp43_create_arb_in {
>>> +    struct pxp_cmd_header header;
>>> +        /* header.stream_id fields for vesion 4.3 of Init PXP 
>>> session: */
>>> +        #define PXP43_INIT_SESSION_VALID BIT(0)
>>> +        #define PXP43_INIT_SESSION_APPTYPE BIT(1)
>>> +        #define PXP43_INIT_SESSION_APPID GENMASK(17, 2)
>>> +    u32 protection_mode;
>>> +        #define PXP43_INIT_SESSION_PROTECTION_ARB 0x2
>>> +    u32 sub_session_id;
>>> +    u32 init_flags;
>>> +    u32 rsvd[12];
>>> +} __packed;
>>> +
>>> +/* PXP-Input-Packet: Init PXP session */
>>> +struct pxp43_create_arb_out {
>>> +    struct pxp_cmd_header header;
>>> +    u32 rsvd[8];
>>> +} __packed;
>>> +
>>>   /* PXP-Input-Packet: Invalidate Stream Key */
>>>   struct pxp43_inv_stream_key_in {
>>>       struct pxp_cmd_header header;
>>> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c 
>>> b/drivers/gpu/drm/xe/xe_pxp_submit.c
>>> index 41684d666376..c9258c861556 100644
>>> --- a/drivers/gpu/drm/xe/xe_pxp_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
>>> @@ -26,6 +26,8 @@
>>>   #include "instructions/xe_mi_commands.h"
>>>   #include "regs/xe_gt_regs.h"
>>>   +#define ARB_SESSION 0xF /* TODO: move to UAPI */
>> This same define is now in two separate source files? Even if it 
>> can't be moved to the UAPI header yet it should at least be in an 
>> internal header rather than being replicated.
>
> I thought about it, but couldn't find a clean solution. This define 
> would belong in pxp.h, but that's not included from this file and I 
> didn't want to add the include just for a define that is going away a 
> few patches later. I could put it in pxp_types.h or pxp_submit.h, but 
> if it needs to be in the wrong place anyway I thought I might as well 
> just duplicate it.
> Any preference?
Yeah, I saw that it disappeared again later but it still feels wrong to 
be defining the same thing in multiple places. Also, as per comment in 
later patch, it would also be cleaner to use the correct name from the 
start rather than having extra deltas to rename it later.

Not entirely convinced it can't be added to the correct header file in 
advance of the rest of the API arriving. It's not like it's tentative or 
won't be landing in some much later patch series. But failing that, 
pxp.h seems like the right place. Is adding and removing a #include 
really worse than adding and removing a #define?

John.

>
>>
>>> +
>>>   /*
>>>    * The VCS is used for kernel-owned GGTT submissions to issue key 
>>> termination.
>>>    * Terminations are serialized, so we only need a single queue and 
>>> a single
>>> @@ -470,6 +472,54 @@ static int gsccs_send_message(struct 
>>> xe_pxp_gsc_client_resources *gsc_res,
>>>       return ret;
>>>   }
>>>   +/**
>>> + * xe_pxp_submit_session_init - submits a PXP GSC session 
>>> initialization
>>> + * @gsc_res: the pxp client resources
>>> + * @id: the session to initialize
>>> + *
>>> + * Submit a message to the GSC FW to initialize (i.e. start) a PXP 
>>> session.
>>> + *
>>> + * Returns 0 if the submission is successful, an errno value 
>>> otherwise.
>>> + */
>>> +int xe_pxp_submit_session_init(struct xe_pxp_gsc_client_resources 
>>> *gsc_res, u32 id)
>>> +{
>>> +    struct xe_device *xe = gsc_res->vm->xe;
>>> +    struct pxp43_create_arb_in msg_in = {0};
>>> +    struct pxp43_create_arb_out msg_out = {0};
>>> +    int ret;
>>> +
>>> +    msg_in.header.api_version = PXP_APIVER(4, 3);
>>> +    msg_in.header.command_id = PXP43_CMDID_INIT_SESSION;
>>> +    msg_in.header.stream_id = (FIELD_PREP(PXP43_INIT_SESSION_APPID, 
>>> id) |
>>> +                   FIELD_PREP(PXP43_INIT_SESSION_VALID, 1) |
>>> +                   FIELD_PREP(PXP43_INIT_SESSION_APPTYPE, 0));
>>> +    msg_in.header.buffer_len = sizeof(msg_in) - sizeof(msg_in.header);
>>> +
>>> +    if (id == ARB_SESSION)
>>> +        msg_in.protection_mode = PXP43_INIT_SESSION_PROTECTION_ARB;
>>> +
>>> +    ret = gsccs_send_message(gsc_res, &msg_in, sizeof(msg_in),
>>> +                 &msg_out, sizeof(msg_out));
>>> +    if (ret) {
>>> +        drm_err(&xe->drm, "Failed to init session %d, ret=[%d]\n", 
>>> id, ret);
>> %pe for error code
>>
>>> +    } else if (msg_out.header.status != 0) {
>>> +        if (is_fw_err_platform_config(msg_out.header.status)) {
>>> +            drm_info_once(&xe->drm,
>>> +                      "PXP init-session-%d failed due to 
>>> BIOS/SOC:0x%08x:%s\n",
>> Style mis-match - "init session %d" in the first error but then 
>> "init-session-%d" in this one and the one below (I prefer the first 
>> one that actually looks like an operation rather than variable).
>>
>>> +                      id, msg_out.header.status,
>>> + fw_err_to_string(msg_out.header.status));
>>> +        } else {
>>> +            drm_dbg(&xe->drm, "PXP init-session-%d failed 
>>> 0x%08x:%st:\n",
>>> +                id, msg_out.header.status,
>>> +                fw_err_to_string(msg_out.header.status));
>>> +            drm_dbg(&xe->drm, "     cmd-detail: 
>>> ID=[0x%08x],API-Ver-[0x%08x]\n",
>> More mis-matching message styles - 'SOC:%s:%s' vs 'ID=[%x]'. Neither 
>> of which is the normal format of kernel messages.
>
> Those I've copied straight from i915. Will reword.
>
> Daniele
>
>>
>> John.
>>
>>> + msg_in.header.command_id, msg_in.header.api_version);
>>> +        }
>>> +    }
>>> +
>>> +    return ret;
>>> +}
>>> +
>>>   /**
>>>    * xe_pxp_submit_session_invalidation - submits a PXP GSC 
>>> invalidation
>>>    * @gsc_res: the pxp client resources
>>> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.h 
>>> b/drivers/gpu/drm/xe/xe_pxp_submit.h
>>> index 48fdc9b09116..c9efda02f4b0 100644
>>> --- a/drivers/gpu/drm/xe/xe_pxp_submit.h
>>> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.h
>>> @@ -14,6 +14,7 @@ struct xe_pxp_gsc_client_resources;
>>>   int xe_pxp_allocate_execution_resources(struct xe_pxp *pxp);
>>>   void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp);
>>>   +int xe_pxp_submit_session_init(struct xe_pxp_gsc_client_resources 
>>> *gsc_res, u32 id);
>>>   int xe_pxp_submit_session_termination(struct xe_pxp *pxp, u32 id);
>>>   int xe_pxp_submit_session_invalidation(struct 
>>> xe_pxp_gsc_client_resources *gsc_res,
>>>                          u32 id);
>

