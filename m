Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542E5C02192
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 10:00:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29FF10E46E;
	Mon,  3 Feb 2025 10:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dDiyOU96";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C7B10E469
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Feb 2025 10:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738576823; x=1770112823;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d3nM0IYMsry+BAxzaQcMaiVHx+A8zZJ55jtjywL3Zyk=;
 b=dDiyOU96uUriDXo/0S+s5te+l7S1QEERZFeHLibzLx4lFa432C0GTS3i
 3fQhut4eNzefLcsxgrT/JhnKkI7pGS0R6LaFqwBCqwbq+rNxTs+BybwOp
 SNHSHa4IWcEflZ8DanTQJDH/B/YapNoa/hhYaiWrk0le2P/nwL+gwZrWu
 7ic6h4Q0ZV8/j5014rwz0w0K7Ow6ukEyTJeUhYCqQwAlDrN9GkWwIKkLs
 C7FA6TIij5MrWqrCYZaUGj4Ip3MF6F3dwJwYdaUzp/LlFZePI6hLbjaGr
 Xpjza5+IHvvzIrRHGUZkiXlIrxA8KTy7tP7+OJ/EBq0umRUfsY+31mnO6 Q==;
X-CSE-ConnectionGUID: UC3A59YSSSCBdJvWEab2MA==
X-CSE-MsgGUID: ClX5wcltQrmwsm89wDt5Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39164235"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39164235"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 02:00:23 -0800
X-CSE-ConnectionGUID: WtKxL/crSkOpf5lzLTYzMA==
X-CSE-MsgGUID: grWO5gp2RVGjMJNapk9M3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="115256230"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 02:00:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 02:00:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 02:00:22 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 02:00:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AMERYasqz4Jzpsp6sFhwN+HZyqqkzPLY2cWBD37IHuJlDUiP/OdwcWiXlr7WRgEKopCNg8/3X9OrO90GzI5FBXoaGkMqqUQXJX14OLDgYHbvKPGa5CWYTS6+yj6BHyiu6Hq1OGXrE64c8Tp6w5golD6joDbtC1C3JR74/2CYRXOk743PUX/yq4XAOP9xDSeaeBIQgQrJVeaa7SN4IP6hgJweQ7h8DIQ8Se1akI2HsHxavPPyyROjVJm3d2VspJuQYvSyoUkGmNL3wBQDQCXDG/TYWigm5CmEsIT7GWBdpto+ASJxA2/1oCbZjGoFHrJPHAhUZRxUfZOVtDA80HG/cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZYxe7tluw9g9kqGYs4s4htTBVq3K22cTQ74UG/LmYI=;
 b=vYE3cKiEqoXwrZj+eYOaZkeOgorESF2zLUkDjZbN9G8EtIxD81shgCOfvYy1wn/PO+1Xbsa1h3siHQDQ6+gQLYicywD/MQDvOQZRAUaTrlT53HRwIvjbDuQ9S+CHjT9sjtUfGxBOA47KRAEfOK0pWFGcS0iIq9HffJuuCdoSujEbfTgXfo1lZ2FMHvaY2983Qu76/kHrxYQYzevIJetLHZama+rVy57x/W3NwdcX6QKl4WQZlAZopzMKvP9DncNeI2hWtjD2pU8eokHq95CGUW1Miq6KYBEYmSfVZRvsvLFA2BDV3rzf4SvwsGs9W4s4iPY6oFQeJDkKGDU1hnFuMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB4981.namprd11.prod.outlook.com (2603:10b6:510:39::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.24; Mon, 3 Feb 2025 09:59:39 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 09:59:38 +0000
Message-ID: <163bb1a3-41fe-40cc-89e3-eaeceed6df21@intel.com>
Date: Mon, 3 Feb 2025 15:29:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] drm/xe/xe_pmu: Add pmu support for per-function
 engine activity stats
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
 <20250129101653.1976699-8-riana.tauro@intel.com>
 <fvycaneavttc4bj2ue22oa4tguepz7dtyr3stmibs3pd7yeofe@s7dzrdswg6kv>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <fvycaneavttc4bj2ue22oa4tguepz7dtyr3stmibs3pd7yeofe@s7dzrdswg6kv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB4981:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dbf43e7-9d7e-4e00-a556-08dd443978ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWIya0xraUtBQktzSDVXSldNWThramVnbUVBcWY0RS9JcWNiMHlxcnY5Q0t3?=
 =?utf-8?B?QkhKSVYyRjVoQWtGOG5sZEtpNHNRQTRFWFlUSUVmeGpMS0tDQ1FKcmxYcWpK?=
 =?utf-8?B?aVJEZXRhOTJyZ0lSSjhqUmJBcy9XM0I1K1I3QW5NZDNkei9TUTRWU3c2ZFRC?=
 =?utf-8?B?b01vYU5YNHNQYVUxMEladStoeFIySjVSM09JNXdSUjVweitPNktHMm5PbVZ3?=
 =?utf-8?B?WUI5YUFHRVBYTnMyS1l4MnBLamVCRzRUcU45aWx5MU56ZTRpUVl1N1NHdG0v?=
 =?utf-8?B?WG5DUGdGNXBZdW5WK25xMGdONVN0TmV1QzRVMCt1NnUzc3RNcEtyNHhnU2xO?=
 =?utf-8?B?eGd5ZmZqSmNBMFliVk9VTkdhVjBEWFVEcDBNLzV4ZGZYSzBhRDhDZklZYlFt?=
 =?utf-8?B?Y1BrKzRPOG01bUNaMEUxWGNrZjNnZjhlVmtPNWM5b0VWZUI1aWxRSDh2QUhq?=
 =?utf-8?B?Rm1iUHprSUFncStxemFjbXhwYlJ6SUlwTEdRbHJzVTN3Q3FsbW56Y1ZSckRh?=
 =?utf-8?B?RkpDNmxXR0drOHNPVGUvQkIzZG8zeGdxTjdBaVkvOXBOU3pjZ3lLdTR6QlVD?=
 =?utf-8?B?cjNVbnZTcjRzSGNhQWp1SHJCQXpnWGpZTWRLRldWVXBFdVZMbFZGL21ZUzhI?=
 =?utf-8?B?VXJIdVV3dmtOS2Y0VWp5SUh4TGNlTG9IOFZNc05uUnQ0RnZJbm9rOHhIMkVX?=
 =?utf-8?B?UEF0STJqZ0xwaHhJU3BYcnpEdDVudXpWOEFtbjNtWS9WblVLRThqYkZZbGZ0?=
 =?utf-8?B?Q0hxMGo3UFFNc2x5OTlocjIvRjFpRTdHWEF4QmRwRXI5WUF3cEpRL2E5UXJS?=
 =?utf-8?B?Y2NjaXRxTHozd0xQdDYzRWEzSTlaUnkreDRUY0VtZUFYbHNLc2QwTjZzS1Jl?=
 =?utf-8?B?c0JSRXJLMXJuaSsyZElVT2pQNDBqaFp3SHhIZE9NY1hLeGVJQXVmZVhIMVJM?=
 =?utf-8?B?STh6WEJIQWJsK0RCNE40SUJ3UmVGd1dpSU5DdDJndlhPUHNPdUtKdkJRRks4?=
 =?utf-8?B?akRnZFVHMGMxbWQ4b1JMQUVhVEoyaFFjNDFJT2FScmVVVzFpeXJDYklEL2FE?=
 =?utf-8?B?cDlQVDMyM2pUUFo4KzNMd1o0OGpKcm9rZElydFM3b2pXQXRjblFkUXNjSUJW?=
 =?utf-8?B?TTI5Qy9TL0hDVzhxNEI0b1Fsd1k4T24wZTZnQTIydUdQdlg2SUg0WDNqb1hq?=
 =?utf-8?B?eS9URUJsUVUzdEVDTEZSQnpqS3IyVzd6U1pRWm5COE9odlhLcUx6V1ZPVkNX?=
 =?utf-8?B?UmdGQzMrUTNsY2tkVWVjdUNsZXNGOURzMDhFdUR4bk9OQjBSUnZhQVRCRTNI?=
 =?utf-8?B?M0lVRUJ2UkV0TkhJYkdPZytya2MxaFFXU1NNK0w3eUEycndQclF0dURoRjRU?=
 =?utf-8?B?d0lXaW81dlIxdGhQVHI5aWQ5ZEFiREc3aTNQM2tmdGllU0x6R3BPVC9sVVoy?=
 =?utf-8?B?d0s0a2pzNFFmS2ZlTE5hNGYybld2MXZVN09XdXkzcnUwTVN0UWljMFN5SkpJ?=
 =?utf-8?B?ZnluUkhTb055cDB4MUNEOTZoVkZJZmtySWQxVk1kREU2eGdaYndJK1I3blZD?=
 =?utf-8?B?bFFnNUtaNDNsdWQ5dmRuUGRHbE0zMlNFMXhOcC9tVkg2eG1sVGRENG4wdjBa?=
 =?utf-8?B?WklySkJPK0d5TE91cGd6QXlrY3YxcXpqem0zY0tLMnZJajVYRkpWS0ZUeFpX?=
 =?utf-8?B?YVFhRWcyWFBDNXlKRTIwcDVnNkdrT2xtVThGZEEwQnpGYU9NUENrNVAyRC9z?=
 =?utf-8?B?Tm00RmpSMUE5MXQ3aEJzbVlhQ3NxYjdwek1scm8raks3QTNDQTJUVlhsRUlQ?=
 =?utf-8?B?N0d0OS9mVzJ6NlN4a1JENTJucWw1Sm4wY21NUFZyWTBweW9nakt1dHhCcWxY?=
 =?utf-8?Q?AfZX6MPIvAaa/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3k0QnVmZXpHOXZmeS9NYkg3aC9GdGtOcVhvZVVKTUpmWW5qa0ZsWk9qTjE2?=
 =?utf-8?B?ZGRDRThqUGhRU0JsM2tyREpaSXZLOC9FMWtuaVR2aUxQVGJ3bFdYZVUvdGlK?=
 =?utf-8?B?ZWVFOGxjaU44YlNhRVFxR2sxRW13YWtkQ3pRTVJ5Nkg1OVJ5TUlBbUlNZ1pM?=
 =?utf-8?B?YzlrOHJXTW9HWTByMWhWNDRub3U0QXYxLzV2NUVhalkycTc5K2xadzNTODBW?=
 =?utf-8?B?SGdtc2FLd3A2WkxpNDMzOEh1YWNBbk5xZUVUbU92WWlXMHAyemhCWndXeWpN?=
 =?utf-8?B?NmZReitOeWV6M2J0QzVFNWFXcnc0Z01YeEVJS21OVU96Qk16RWlEN2l2N3A4?=
 =?utf-8?B?dFRUWDIrWnhxWFA0ZHgrNUFVblBzYlNqajJObnZzb05hWHJieTZBU2FmVDd0?=
 =?utf-8?B?cEkwakFjZ0VWUzBFNWdNZ1NGT1E2aDBHbEZ1d3JoNGpVaXF5Y1V0ZmZ1aVhV?=
 =?utf-8?B?RVByenFMMzV5RzhybmQ0dDRiUHIyMzBtb0g0TVgwdGVZQVBNL3ZOeXRxckNu?=
 =?utf-8?B?UG40THlQc0x3YXIwT1JPQTRxNHpTa0xSdnZNekRXY3d0MG5jaW5qRWt6SVJZ?=
 =?utf-8?B?NkpqbVkrR1ZNeHB1ckZMckJwOGoxRmYyRS9NRmV6aXZFZUIzdHRIaHhJdkNR?=
 =?utf-8?B?VTNrNzEzT0J3SkxpWGdsVVZabXMxNWcweS9tVDNvc1U4Q0JaVG1EVkxLL1RM?=
 =?utf-8?B?NGlJbkdNS0l2Nk1sSEJmUEUwRlBldUY2c2x0TWpVVEtNUWpLQVluaUJXS0NJ?=
 =?utf-8?B?dTVkMUtvak1QbnA3RTBoM3h4VDVRekRpYjVXRWFRcXlzRm5vdU51elMrdDMw?=
 =?utf-8?B?a3ZxdUoreTlSQmxSMlNZZmN1dDBxR3preXdaUUtjQzVwaEdVL0ZNT3ZzUDlM?=
 =?utf-8?B?dnBWYVdzeG1NU2gvM1BWS01zUHZmdStURngzYTlEQXdNdklTQkFjYjlGRWNs?=
 =?utf-8?B?Q29aN3htRnFDMHphK1BGSDlUS0FBcEt3SFhndzdGNnp2YitrZUQ3Q1NEdG9i?=
 =?utf-8?B?TllJNk8yRzAvdDdFWkRQQmlmUEs5bEY0SUlNOUtYZjY4VzhmczBFTllxdWdT?=
 =?utf-8?B?Y3MyTmpXVUlGV3J6Z01lS3N4TXdibzRHcnYrbGcxa09Bb3IrbXpXNXFIL1o4?=
 =?utf-8?B?aVJtNjkveEFaVDJmM2x0STRWR1lONDV0MjhCQWNhLzlkdnpURnJSSkp0YUJP?=
 =?utf-8?B?L28yTzFvNURvcGN5NlpNSHdvNXl3U25lc0sxZk04V2FwQ3BaSGhBOXZLNTJq?=
 =?utf-8?B?ZEY1QnFYVng2SDhKM0JQbkUrOXNMUEZGS25ORXFLYnZqNGozYVN1Vy83eWxB?=
 =?utf-8?B?dmpidm0rVTQ0YWNFM0JSdEllUlZwOXBKRHp4dHZBUktTQmhpM1F0cHI0ZzVD?=
 =?utf-8?B?YVpnU1RmTEJSMnJoREJvWlQ3N3BIZkpUZ0liR3BabjR6dDF1RlEwajVEUlpz?=
 =?utf-8?B?LzlJWU90VHEwMTJiczh3bnY5c2FhZHM2S2JUSE9jWEwzbTBoT3FUOEI4c2Y5?=
 =?utf-8?B?cmMxYXRlVnJHbjg2cXB0d1dpNERYdG1vbnJZckxRQjU3R054eGJpczlIMy9w?=
 =?utf-8?B?ZXJ2QXJ1eVNjVThFUUNPODR5U2tESzRwMXZmclRhUGlKM2FTMGdyZzRnSlh5?=
 =?utf-8?B?eHFmWHZSY0h0WFFqMjJNcW9GYkppUHdFRjBMZGNhSTRYK3BST2dndkJFL2l6?=
 =?utf-8?B?M05Yc3lRcDhCcXhYaFZxMmFGUzgwZU9LWUxXbkdOdmQ1YzVnZWMxc1lmWWJw?=
 =?utf-8?B?dFNXcmJMYi9tclIrcjQ2M3hLV2xKSVcydGQwTjF6Wklyekk0VGlkS2twUXVi?=
 =?utf-8?B?S3YxQnNwaGdHOGROdTkvdXpyL2ExZnkyZkc0bEZqMGZ2dzA3bnBmNy94K1Bp?=
 =?utf-8?B?VVRWVGN1N1ZtRGQ1RUNvRjJ0ZzY4L1lQS094MGNRc2tlS294WXZPUnhuZ3lB?=
 =?utf-8?B?YUNUV1QzbHYzTmxaL1pBVDlBSSswRDJxdHJGZGk5MUlWQ2VTQTVQRG5OdUVK?=
 =?utf-8?B?RStwL0lLUFlZS2FFTkh5aTFabnljT2haVmNOWFF1OTMwMllTc1Q4a2NGaGpx?=
 =?utf-8?B?QUtFc0F6NUV4RWVPK1NYdGYyZkxsWWp4b2dhM3JOazBBcWtZY09wRDQyR0Vy?=
 =?utf-8?Q?3QAH9xeSSKGzP/GyO5kFj050M?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dbf43e7-9d7e-4e00-a556-08dd443978ae
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 09:59:38.8585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g90fUcOZq/33uXxiXLfFlkUOKMz7pKTvNZiak4+X+5SQqhLP3jRd5MWZK5KNEE4qoG829U1LqJJVLFx7Q4cv0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4981
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



On 2/1/2025 5:53 AM, Lucas De Marchi wrote:
> On Wed, Jan 29, 2025 at 03:46:50PM +0530, Riana Tauro wrote:
>> Add pmu support for per-function per-engine-class engine activity
>> stats.
>>
>> per-function per-engine-class activity is enabled when num_vfs
>> are set. If num_vfs is set to 2, then the applicable function ids
>> are
>>
>> 0 - Global per-engine-class activity
>> 1 - PF per-engine-class activity
>> 2,3 - per-VF per-engine-class activity from PF
> 
> IMO that's super confusing. The pci function is already part of the
> pmu name and hence event source:
> 
>      /sys/bus/event_source/devices/xe_0000_00_02.0
>                       function --^
> 
> in a pf/vf scenario, what's the point of the global one?
> Also is it monitoring per-vf, all vfs or what? The interface looks
> confusing.
> 
> 
>>
>> This can be read from perf tool as shown below
>>
>> ./perf stat -e xe_<bdf>/engine-active-ticks,gt=0,engine_class=0,
>>              engine_instance=0,function=1/ -I 1000
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_pmu.c | 45 ++++++++++++++++++++++++++++++-------
>> 1 file changed, 37 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index 15e9a57aa429..2968fc9a358c 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -12,6 +12,7 @@
>> #include "xe_hw_engine.h"
>> #include "xe_pm.h"
>> #include "xe_pmu.h"
>> +#include "xe_sriov_pf_helpers.h"
>>
>> /**
>>  * DOC: Xe PMU (Performance Monitoring Unit)
>> @@ -29,15 +30,21 @@
>>  *
>>  *        60        56        52        48        44        40        
>> 36        32
>>  * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - 
>> - | - - - - |
>> - *   [ gt ]
>> + *   [ gt ]    [             function              ]
>>  *
>>  *        28        24        20        16        12         8         
>> 4         0
>>  * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - 
>> - | - - - - |
>>  *            [   engine_class  ] [ engine_instance ] [         
>> event             ]
> 
> I usually like ascii art, but I'm not sure this buys us anything
> compared to the GENMASKs below, particularly because they don't apply to
> all events and they are **not** set in stone. 

Yeah but there were some pmus using similar format description in 
documentation even if all the bits are not applicable to every event.

Thought adding format bits in description would be better than
going through code to find the bits. Will remove it if not required.

Will add the formats specific to engine events in description instead

Thanks
Riana
Userspace is supposed to
> read from sysfs what are the bits correspond to each parameter.
> 
> Lucas De Marchi
> 
>>  *
>> - * engine_class and engine_instance bits will be applicable for
>> + * function, engine_class and engine_instance bits will be applicable 
>> for
>>  * per-engine-class activity events (engine-active-ticks, engine- 
>> total-ticks)
>>  *
>> + * Function id applicable for per-engine-class activity
>> + *
>> + * 0 - global per-engine-class activity
>> + * 1 - PF per-engine-class activity
>> + * 2 .. (num_vfs + 1) - per-VF per-engine-class activity from PF
>> + *
>>  * The standard perf tool can be used to grep for a certain event as 
>> well.
>>  * Example:
>>  *
>> @@ -49,6 +56,7 @@
>>  */
>>
>> #define XE_PMU_EVENT_GT_MASK            GENMASK_ULL(63, 60)
>> +#define XE_PMU_EVENT_FUNCTION_MASK        GENMASK_ULL(59, 44)
>> #define XE_PMU_EVENT_ENGINE_CLASS_MASK        GENMASK_ULL(27, 20)
>> #define XE_PMU_EVENT_ENGINE_INSTANCE_MASK    GENMASK_ULL(19, 12)
>> #define XE_PMU_EVENT_ID_MASK            GENMASK_ULL(11, 0)
>> @@ -58,6 +66,11 @@ static unsigned int config_to_event_id(u64 config)
>>     return FIELD_GET(XE_PMU_EVENT_ID_MASK, config);
>> }
>>
>> +static unsigned int config_to_function_id(u64 config)
>> +{
>> +    return FIELD_GET(XE_PMU_EVENT_FUNCTION_MASK, config);
>> +}
>> +
>> static unsigned int config_to_engine_class(u64 config)
>> {
>>     return FIELD_GET(XE_PMU_EVENT_ENGINE_CLASS_MASK, config);
>> @@ -116,7 +129,7 @@ static bool event_supported(struct xe_pmu *pmu, 
>> unsigned int gt,
>> static bool event_param_valid(struct perf_event *event)
>> {
>>     struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> -    unsigned int engine_class, engine_instance;
>> +    unsigned int engine_class, engine_instance, function_id;
>>     u64 config = event->attr.config;
>>     struct xe_gt *gt;
>>
>> @@ -124,18 +137,28 @@ static bool event_param_valid(struct perf_event 
>> *event)
>>     if (!gt)
>>         return false;
>>
>> +    function_id = config_to_function_id(config);
>> +    if (function_id && !IS_SRIOV_PF(xe))
>> +        return false;
>> +
>>     engine_class = config_to_engine_class(config);
>>     engine_instance = config_to_engine_instance(config);
>>
>>     switch (config_to_event_id(config)) {
>>     case XE_PMU_EVENT_GT_C6_RESIDENCY:
>> -        if (engine_class || engine_instance)
>> +        if (engine_class || engine_instance || function_id)
>>             return false;
>>         break;
>>     case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>>     case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>>         if (!event_to_hwe(event))
>>             return false;
>> +        /*
>> +         * Two additional functions are required for global(0)
>> +         * and PF(1) when SRIOV is enabled
>> +         */
>> +        if (function_id > xe_sriov_pf_get_totalvfs(xe) + 1)
>> +            return false;
>>         break;
>>     }
>>
>> @@ -194,15 +217,19 @@ static u64 read_engine_events(struct perf_event 
>> *event)
>> {
>>     struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>>     struct xe_hw_engine *hwe;
>> -    u64 val = 0;
>> +    unsigned int function_id;
>> +    u64 val = 0, config;
>> +
>> +    config = event->attr.config;
>> +    function_id = config_to_function_id(config);
>>
>>     hwe = event_to_hwe(event);
>>     if (!hwe)
>>         drm_warn(&xe->drm, "unknown pmu engine\n");
>> -    else if (config_to_event_id(event->attr.config) == 
>> XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
>> -        val = xe_guc_engine_activity_active_ticks(hwe, 0);
>> +    else if (config_to_event_id(config) == 
>> XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
>> +        val = xe_guc_engine_activity_active_ticks(hwe, function_id);
>>     else
>> -        val = xe_guc_engine_activity_total_ticks(hwe, 0);
>> +        val = xe_guc_engine_activity_total_ticks(hwe, function_id);
>>
>>     return val;
>> }
>> @@ -305,6 +332,7 @@ static void xe_pmu_event_del(struct perf_event 
>> *event, int flags)
>> }
>>
>> PMU_FORMAT_ATTR(gt,            "config:60-63");
>> +PMU_FORMAT_ATTR(function,        "config:44-59");
>> PMU_FORMAT_ATTR(engine_class,        "config:20-27");
>> PMU_FORMAT_ATTR(engine_instance,    "config:12-19");
>> PMU_FORMAT_ATTR(event,            "config:0-11");
>> @@ -313,6 +341,7 @@ static struct attribute *pmu_format_attrs[] = {
>>     &format_attr_event.attr,
>>     &format_attr_engine_class.attr,
>>     &format_attr_engine_instance.attr,
>> +    &format_attr_function.attr,
>>     &format_attr_gt.attr,
>>     NULL,
>> };
>> -- 
>> 2.47.1
>>

