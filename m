Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D18C83F1F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 10:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5000C10E8AE;
	Thu, 10 Jul 2025 10:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B2rY23U4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA1B10E8AE
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 10:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752144201; x=1783680201;
 h=message-id:date:cc:subject:to:references:from:
 in-reply-to:mime-version;
 bh=KwQomqPSWFLhBzAyfODKHjBnbYWsgE6VSR2c+n7anJE=;
 b=B2rY23U4mWWXfjGy71w3wWbSLbJFcH8fOq3ilvzE12mqVW+Wb02jzYAE
 7dioCmIMe5+DnJr8jn8pw0jYs2GB1gj1t3V4fMu6D4PefRyY4R5PYG+lG
 7GBITnpqR3LPUcU3TaeQDTeSPjPczZL5/pkhB2gXQ8xFBI6Ntg9czpK/t
 ykJ4pe9tY6pWafHC+qBG5i7wffHg4VLjVQezYFhbd6GU59RyD9e+KTpIH
 MH4Jc57pVEkXOM190KS4oKHALVMndhpg0ipSqnqfdVEQL8bCcip1JAd4u
 +ltVVhcyReNk11NopyS+8Hyq+ydFhh9DdUwFau4DIhYHT3wewh5svnzpw w==;
X-CSE-ConnectionGUID: wK0FZb1oRyOEixHP+aG/ew==
X-CSE-MsgGUID: dY4MfoEgQVu7rWGXWKkumQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="65481652"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208,217";a="65481652"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 03:43:21 -0700
X-CSE-ConnectionGUID: sZQ1nvMhRbmiaxSyBqbmlA==
X-CSE-MsgGUID: friUplWsSAquTGGlCwJgcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
 d="scan'208,217";a="156164698"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 03:43:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 03:43:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 03:43:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.86)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 03:43:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sgj91OfcwpkQslYyzXsPdiSJLLqKsSuKOSlc+Ugc8grF+JjmhAf4Ce/yIjtFEbZT3wylL0wPLYjhNDB6pdLYau41jVsY+7gdSM526Ca4f7evXf5nE7iegW+y9V+9RAWMIhHRfEzBWTcVHFmZjpkYNG0iotXhZaVtqmWOQE5sfTNEPpRvVxBZbyCDctmiH6WXRcQ0TStACg86Qie9GT5m+IfR32ruAnRe3busQaEK47KKnhfMJpStsaKzi+ew8RuWYl15wpxwoQhOVg4cgM/27Lmwr+Bbj6+EDMOqzGH7r1gwKWVQMN6dzT+3BMSj2/xucwiBiGNAqpmS/HfrMMWlZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NaGHKDYYib2CWJXKJZ+nZZoHPYEPimabedxpMdlKz6E=;
 b=eIpGtU5L3kHOPbrcTPgfKhlzR3wGVaWDwUYJ5fX3HI6fbrzZR3eJFhd1YmWRY1s/aO0Sp4xGa9i/UheJAkJ0QTb6IGpbHMMycwI/9OW0TBVjSL4CMRSbQDhtgb3lSC+pDSgvkSelriE1c6ooJEpdUtMCSTas8fH/pb4T32KhpqK/J9XakFd9lXUgB5ofZbRf0aXiFifotgXEsDnZPeEFDsZWJOJ2FZKnaup0whxcUxXJ0/BhVWb5vhrDY7/7KCstZR7PZ2swiBltUAYctLP5hJxx1XEyuAcc1DAkfdDM7u4k7Y1B6FYjwLGL37sfSPDmUHp6wdtYeZe+2xJhdh1/8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by CYXPR11MB8689.namprd11.prod.outlook.com (2603:10b6:930:d8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Thu, 10 Jul
 2025 10:42:50 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 10:42:50 +0000
Content-Type: multipart/alternative;
 boundary="------------QVwBML0rebw6DVerX0WUCcgk"
Message-ID: <b5fce548-01be-4a60-8ae7-e31c53c6ffa9@intel.com>
Date: Thu, 10 Jul 2025 16:12:42 +0530
User-Agent: Mozilla Thunderbird
CC: <satyanarayana.k.v.p@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/bmg: Don't use WA 16023588340 and
 22019338487 on VF
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250710103040.375610-1-jakub1.kolakowski@intel.com>
 <20250710103040.375610-2-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250710103040.375610-2-jakub1.kolakowski@intel.com>
X-ClientProxiedBy: MA1P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::31) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|CYXPR11MB8689:EE_
X-MS-Office365-Filtering-Correlation-Id: 48b72197-a36d-4f36-06a3-08ddbf9e844f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUlXdkU1YzN2VkJGMXVSRHZ0ZTJRLzU1b2t2L0ZHdlBhSXdlRHNPSUM3RHl6?=
 =?utf-8?B?cGFIZHBCbnhhU1N6U3laSlBuZHdGSzUwR3B0ell1Qm1POGs3TGY5L1RGVVEy?=
 =?utf-8?B?RDNFNGEweU9tMTh1aFpaZ2RaR2o1ek13QVlQUkowbkhpOWdhRXNJU093cFl3?=
 =?utf-8?B?UjVOZ3RjS3BCeXdZN1lPTkRlRWd3TVZ1cFN0eEFXU1ZQcUx1WHVEZVlYWWcy?=
 =?utf-8?B?eVRXMkxkY2F4Vit2Yy84VnR0Y3ZNU1kreXFxd1BBZTkzUEZ6aE5YQklZeHFk?=
 =?utf-8?B?WUtqb0ZkNG9lUnhWSGxBcCtJYmlMVTViZWcxcnJPZElJQStqcDBLNjhtN0tP?=
 =?utf-8?B?U3hiWDFWczJEVWw1UE4xQWQ5dVB2QkwyaDJXZDhSTUVtSkNXMlVpMEpSVENv?=
 =?utf-8?B?VHVORDRSQUtWM3h5MDFtcllmS3lJUGRIQVJOaHR3Z1B5TTFVSjV1RTNhVGR5?=
 =?utf-8?B?VzJ0ZDJqNVhQcE1qa0w5c1BaWXNMc3ZyMG9xTTZrQVNZRnFjZHIrMFNDUXhr?=
 =?utf-8?B?MklMaE5yblhLdDU3eU9lOWsySmlpYkxZYUtPcmVRYWtpWU45SENhRVA0ekU0?=
 =?utf-8?B?Z1Q0SGtPZ05CSFZBdlYxRitwVllMWktYS2N0TjRvM1NYQ0VOZ0J6M1RKTVhF?=
 =?utf-8?B?K3BteFcxeTlKYW5kTXhNa3p3YmpXNEZ1Q1lyVGk3SmV6RFA4c05jSVRIOE1S?=
 =?utf-8?B?alRsNnA2eGR3aDRBTGdzcUs0aHJ1QXJvSWI0dXVvQ01xVWRlT1Zld1dwK3pE?=
 =?utf-8?B?VnU2Nng1N0U0dWduZGVhaXZaRW5BNWhHc0RaaUNqZzFNYTZtOEdTZDVsMk1R?=
 =?utf-8?B?amNTK2Ruckh6UGp2Rkc4QUViaHZXdThVLzJQMHNRUjF6WkFCcHQ3cnZabk9G?=
 =?utf-8?B?YWJLVTloN1RsVEM0WThnMlJISTh6L2R1cFBsN255SE5YZWcrLzkzTUhoTkwv?=
 =?utf-8?B?NVpvcVc2MTRQOFZOVW5NamhVL1NxRXhkdkVxek8zbSthdVhxbXVxTGxmR2Jm?=
 =?utf-8?B?N0R4YjFQK3kvTVY4MDV6NTVwTjd0Z2xjemFEMW5VcjZxRWdveGF2eWRmVGZB?=
 =?utf-8?B?VUJNZWJ0RWlBdjVoWHF5SWdPYVBudTZqOW1YbW9QdW5hMU5RbzV5ZXJTbG1U?=
 =?utf-8?B?bkkwRWFDWU1COCswblFBSXNrKy9JbVEvVUlCWWtBL3BKK0N2NVFUZXlyaThw?=
 =?utf-8?B?N0VKNlNJMU9ZcnB6YUdVOE9KQ0trWjhZTzNPaFdXZERCMHpQTmorWFpBeDlo?=
 =?utf-8?B?ZHhvdm0yV2pKQzZvWWxVS3d3Vkh4TmdJSWFjNEpyRGkxcE9wSEMzbnluMEFG?=
 =?utf-8?B?N2VGUkIyTzhlRzRMcjhXU0d0REQ1QkFhdHJxeitqa29iZ1pXUW45REI1bGF3?=
 =?utf-8?B?ajY3cWI0ajRBT1N3WVZIUUJ1cmlQa0ZoZTRJelA2SUt0aGtieHoraC96YU5W?=
 =?utf-8?B?Q0duclIxOTJZOHVhbkt5T01WdE1NK1QzV29UcDhTVUNzRDFFcnNYR0x3aVl1?=
 =?utf-8?B?WERKMXUyVTMyQUhqWHpWellHakpwL0lQNVN0NE1UcXBORVFnVFpMTzBiTENk?=
 =?utf-8?B?Ym9tRS95U2JUUWh5WjhSV1NtNCt0SlBSaWxYQXpGZTA1Q1N1QmpDclNqdGgx?=
 =?utf-8?B?d0dCL28zM2V5MXhtbVkwTkhFVHB4ZzM4RlZMUmxtZDliNUdDSmJOb2ZlNW5J?=
 =?utf-8?B?eXJVUUtkVldnWFhOdHFyVU4rQjZ6SXNSbUQzcS9idEhvUnpFSHhVV25YZjUz?=
 =?utf-8?B?d08rWDlMdFpnd3Bwem1KRTUxUVo0TGlnUTNhbyt2WWgrKzlZbHh2L056WndT?=
 =?utf-8?B?Z3ptQzlmc0MvSldJcEFTMHM3bE1JdFFwNDJGd2JKWW90cTZ3cktnSkdnQ2dD?=
 =?utf-8?B?REpJM2M2ZjA1RVdhRlBON2Z2blRoQzFEVlplWnFmWEI5VTdMYUd6UC9FSjg4?=
 =?utf-8?Q?xgbggT51tv0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFB0T2N1SVJNQzdGeWppYVR4bG1VTjl5M29hSmpqTlRyVmV1b3JTcnQ2b2Vw?=
 =?utf-8?B?N1ZCOXRSckl1SHJqUXVtYUttV1NXSXJkRGNrNnZ2SE0ySWptKzAxOTU3bWZF?=
 =?utf-8?B?MnoyTnYzRmIxVkZSMzRHdGd4d2NzTVpwbVVkQk5nM0N6OThDMk1CMENRZDVF?=
 =?utf-8?B?dXNIS1V2SFdhc0ZneWdtdmE4S3VYNHBkYVppcUFNSTZiRDRaU2pXakdPZUhU?=
 =?utf-8?B?SjVWTzYvKy8xVjZ6OEdLYjd1K0dKZFRWa251eDdBZm5BY1NDdEU2bC9qRkJB?=
 =?utf-8?B?eHhuNnNIM0ZCQllHWFZHSHhXTWp4aWQwaURsZXZ0WlFKRm1zUUk3OG9ma0tX?=
 =?utf-8?B?TlJXcGZBYnNFa0lOdEdOVzBtUCtsT0JDODljd1JieDhpbVlLWDhzNzRkZFBa?=
 =?utf-8?B?SktvZTZKZ28xTHdFU1hPVDdPdGhnTmkxQlpDTkd3ejlPOVRhUFJ4ZU1FSEs1?=
 =?utf-8?B?UmVwZDFFSnJLVHIzOUhNemZPSWFqb3VGenU3d1FmbWZGaEJTRmttSUZJSDRr?=
 =?utf-8?B?QkVrNkdSMzhYbm1FUWplWStXclNYcDdjQWk4UDZ2MzJLUWUvMWlVVC8rMFZV?=
 =?utf-8?B?c0YraDBNM3ZFQUs4QlRJcjh4UEsvUm94K08vVEVMZFNWSTlMQVhCRGw2dFJZ?=
 =?utf-8?B?d3FQVVpwaDIvVkkzN0dzS1VhUFlQSzNUa2FyVXFiYnVJQVJaOTZwUVRzRndx?=
 =?utf-8?B?aUU4M1RIUEYrNUN2ZFlaa2VTcFk5YndnUEV1ejQ1QW51YjFjM1ljRVh0YmxR?=
 =?utf-8?B?KytjSEt6dldUUDl5Tzl3MjN0L055bm1BMnFoNnJmZVFNU0QwK1VCV2xsVkEr?=
 =?utf-8?B?Z2RTNk9vNzRhWTRqdGZVdVlKLzZETm03enJIRllzODA2dXk4SUpjREkwRTN3?=
 =?utf-8?B?YTBkWHk1N0NGc1Z6S09rd1VmTUNUQnMwRk16K3k3Z2lEa0dFQ3E0QTJQSEN0?=
 =?utf-8?B?VnhKQmhHcFFoYXFrN3k4YzlsQjh6b1krTmNoMzdNNkpnakp6VFFKS3hyQjZz?=
 =?utf-8?B?V3NPcVhOQ2VTcHVXNEpTcWUxZzArNVdHL3VINDRUY2JpSC9uQWJxeVoyWG9j?=
 =?utf-8?B?b1NIbEczUHV6UmxvZzNCZldwRGFBUG8xdGVlVDJuS2NxVHdyZlB2MEFic3JI?=
 =?utf-8?B?dmIzSHdGZU5tVFZYRUQwSElyZnh3dFhrM21rcWhzUU1CeXVDTnhxd01oV1lj?=
 =?utf-8?B?ZWNmODdmbUg2V09yUjJxK2RxSEgrVHBaTWUzRXMvc2lsNFJBOE5BRGpMV094?=
 =?utf-8?B?S0haWmREWG5SZHhrNXpIRFQ0ek1LK1U1ci95dzQ3bDNqUzdvL0p2MmtCcTF4?=
 =?utf-8?B?OGpZK3h3Wnh6dEoxYmRWK3M2OGtzL0lsRkVRRDhJOVY3WFNPNDQrc0hUQVlV?=
 =?utf-8?B?WXVja09tcHFKQkdZS1VORXBQalFsa1JxVmF5SzZ5b3JINDJZeEwwQWNmVXlj?=
 =?utf-8?B?RE1FK1NONUUxV0V2QW9qU3p0dWlJMW1SS2dJckxoYjZiU2IxWTlSK3ZDaE0r?=
 =?utf-8?B?ZGo1ZGtDR2VrUXJuTjlqOXI0TGZENEgwZjZyWUd4RHIydjRzVjFVWlpwdG5V?=
 =?utf-8?B?RStBV09aUU1BemM0YUNxU2phYW1uVU9qZWhmME9aRjEybTV1R2c3YjQ1akJk?=
 =?utf-8?B?N0NVV2tMSTErd3NCWUFBSnl3UDdzWDhhRzhqZURlK3V5U2dFd0l0NkV5ZEUw?=
 =?utf-8?B?cVBpMDFWTktUYlovbnNIY1BrZytXcnNjNENnNU5PNkFyZ29iSEgybEoxOUtw?=
 =?utf-8?B?OW85Mk5rL3VTbG16dUNuYVNlY3R0eEVJUm1SbUlnU2RESzVMTy9URUY5ZG03?=
 =?utf-8?B?MWxCVEtMVmc1MkNVcXYyQXhYQnYyMUV0cldURFh4NmRJaVluc1NCWFF5RFVH?=
 =?utf-8?B?dC9PUVJJMHJGcERXbktrdEliamFSMnpjZ3JkandLWU1WMG5aeS9zSGYrNVlL?=
 =?utf-8?B?QWdVblV5MjVRUXVCajhYQ3gvc1VrSFJNVGxZQTlpK0pjUXloSnNmbHFid3ZL?=
 =?utf-8?B?bDhydGIzUmF3ajMwQ0xjaHUzMnhyb3ZqQ0NDYWgxMC81aFZDbXU2UjNjcEtM?=
 =?utf-8?B?K2h6U1lUYW05RU9YbFY2dUNEMXZoSXJpYUZwQ2hMSVp6SWx1dEhLNnplTTFs?=
 =?utf-8?B?aDdJbExWUzI3d0VlWUtUK0xySGFnVFFNYmdYYWxmNml1VC9wdS9MZnFNdkFw?=
 =?utf-8?Q?bYc4phd8UXJpGibHIaYHTXI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48b72197-a36d-4f36-06a3-08ddbf9e844f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 10:42:50.5406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GpPjtCYnNdabirFo/6dTEM44sD4HFHhkTCXrRVyrzgQG3qqeQufj+EtFQfLKF63+/tk40d2huvVDrD2RNUYbRbvBWxswfExR8N2CPx7dQeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8689
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

--------------QVwBML0rebw6DVerX0WUCcgk
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10-07-2025 16:00, Jakub Kolakowski wrote:
> From: Michal Wajdeczko<michal.wajdeczko@intel.com>
>
> These workarounds are not applicable for use by the VFs.
>
> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> Tested-by: Jakub Kolakowski<jakub1.kolakowski@intel.com>
> Acked-by: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_wa_oob.rules | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 96cc33da0fb5..e7ed5d583d68 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -40,10 +40,10 @@
>   		GRAPHICS_VERSION_RANGE(3000, 3001)
>   		GRAPHICS_VERSION(3003)
>   22019338487	MEDIA_VERSION(2000)
> -		GRAPHICS_VERSION(2001)
> +		GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_not_sriov_vf)
>   		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_not_sriov_vf)
>   22019338487_display	PLATFORM(LUNARLAKE)
> -16023588340	GRAPHICS_VERSION(2001)
> +16023588340	GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_not_sriov_vf)
>   14019789679	GRAPHICS_VERSION(1255)
>   		GRAPHICS_VERSION_RANGE(1270, 2004)
>   no_media_l3	MEDIA_VERSION(3000)
LGTM.
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com 
<mailto:satyanarayana.k.v.p@intel.com>>
--------------QVwBML0rebw6DVerX0WUCcgk
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10-07-2025 16:00, Jakub Kolakowski
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250710103040.375610-2-jakub1.kolakowski@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>

These workarounds are not applicable for use by the VFs.

Signed-off-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Tested-by: Jakub Kolakowski <a class="moz-txt-link-rfc2396E" href="mailto:jakub1.kolakowski@intel.com">&lt;jakub1.kolakowski@intel.com&gt;</a>
Acked-by: Satyanarayana K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_wa_oob.rules | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 96cc33da0fb5..e7ed5d583d68 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -40,10 +40,10 @@
 		GRAPHICS_VERSION_RANGE(3000, 3001)
 		GRAPHICS_VERSION(3003)
 22019338487	MEDIA_VERSION(2000)
-		GRAPHICS_VERSION(2001)
+		GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_not_sriov_vf)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_not_sriov_vf)
 22019338487_display	PLATFORM(LUNARLAKE)
-16023588340	GRAPHICS_VERSION(2001)
+16023588340	GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_not_sriov_vf)
 14019789679	GRAPHICS_VERSION(1255)
 		GRAPHICS_VERSION_RANGE(1270, 2004)
 no_media_l3	MEDIA_VERSION(3000)</pre>
    </blockquote>
    LGTM.<br>
    <span style="font-family:Menlo">Reviewed-by: </span><span style="font-family:Aptos">Satyanarayana
      K V P &lt;</span><a href="mailto:satyanarayana.k.v.p@intel.com"><span style="font-family:Aptos">satyanarayana.k.v.p@intel.com</span></a><span style="font-family:Aptos">&gt;</span>
    <blockquote type="cite" cite="mid:20250710103040.375610-2-jakub1.kolakowski@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------QVwBML0rebw6DVerX0WUCcgk--
