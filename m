Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22581CF9C71
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 21:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF83E10E4A1;
	Mon, 23 Sep 2024 21:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MYp930L5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AA210E4A0
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 21:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727125890; x=1758661890;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6ntD49SoHTUCsfzKftaDl7piY6tMKvn9r+CBkotYQ+g=;
 b=MYp930L5FiRdFBh0UcBmaR9ZaFnJIyBlGpAGRjdvoO16887JgncB3s0F
 xKI636szuO8bbeSNrnm2PxOncwOdiHJThVIzarvDufdLq03ozui0Gy5Mi
 6w/yEarT6ZA4xf1hnotjhFjfaz+BJ+E2mNm5ZdbampMPHbYNjjwIlicCa
 HKiWCOGaNZAIR3PAxI7wq2sR76bvPGyzA2MipnxXG0+FUaulVFUlQZ7Kv
 rDm8w2lZ4FiKYcCR75YMDWp5+IjI5aRnAR1C8Iv8BnIZXkZY6Xdj9WCDt
 tBBHnJrlkBlnEI/ai3g2qOYutepLl5IeaWymWwRRtbcOE6Ik28x3/TN3g Q==;
X-CSE-ConnectionGUID: 3lnKJ7QNRr+w2+HS01uHzg==
X-CSE-MsgGUID: BwZd/5i3Qz6KXOhxf5yHhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37471834"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="37471834"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 14:11:27 -0700
X-CSE-ConnectionGUID: 002lIAd8SKGU7so/rG2NoQ==
X-CSE-MsgGUID: n0oWZYSNSf+/+knkOXwpPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="75724953"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Sep 2024 14:11:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 14:11:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 14:11:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 14:11:26 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 14:11:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iCXOCC9KvvuUBiDJ1MvY0/FIfpuvt9rXnw4dBlxR50yKtcsEKnsybjNoo9JggpmRjpSVJQEJOuq1Pj1nBiY63+oI9MjDDeaZ15gxl9rY/o4wEwoYe/StCIiDSpyjeFaoWLkTRgLB46XmhCJPhwAqwKGgPOEPAnw3NJgGdwCZQaVBZX4ppqi3Jk3AS1252/VRwAKGNvnhVrfN/bG6iphSquuFe1v5sfkc2qVuJyx3Ps+1Z6YPgQp+01ordQBSz9M/4QT3d2AJuo8oJrLd/gItZPaajT378uCnAzhRKgSTt7q9zvSkn9q4KzlsFJeqynPT9UurCq/PUhRHsYdZIq+9WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0tc+MWKffyqGcf4QABnkdLqgU5Ym1wCgPWWKRzPe88=;
 b=OpzkEuyTqmnDi226PC7sapVBlStcSPfx7pxEk0AP2AiPx7NDj8EvkSwsd9ymUTt7tBPFhoS6/Swh/1ZZiR2HgPQELOjCE/sW7rI8pPS8XaNznFcm+RKz5LmDvuf4er6FLB/FD3swEOvHkLeMQ157oSIlG47gzl1vqRcyA9whavr+ORFWbgyG5zT9TgE/218NbqEEYKDI/CwC6hC+0PHUGxqYN/PJqjNwAN03fQBdtHtdtqumAShOVl2OMpimBTjaB6+8D9vWeOHDQapiRw+Zck5fdo6gsoguNFAl3m8xkRsDliEoq9hIsOoaH8M2kKtZFA9OIvGIm0+Iutkt7Gaccg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by MW4PR11MB6934.namprd11.prod.outlook.com (2603:10b6:303:229::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Mon, 23 Sep
 2024 21:11:23 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%7]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 21:11:23 +0000
Message-ID: <c164b4cc-952f-4c43-8d21-10da823ca64d@intel.com>
Date: Mon, 23 Sep 2024 23:11:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe/vf: Start post-migration fixups with GuC MMIO
 handshake
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20240920222926.846985-1-tomasz.lis@intel.com>
 <20240920222926.846985-4-tomasz.lis@intel.com>
 <b015dd94-4b39-4f9a-ad1e-8ec7b7cfe346@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <b015dd94-4b39-4f9a-ad1e-8ec7b7cfe346@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI1P293CA0022.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::19) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|MW4PR11MB6934:EE_
X-MS-Office365-Filtering-Correlation-Id: ebfe39e5-b59e-465b-5b26-08dcdc144726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGtyaDMwMDdRUXlpME96RDUvZWEzQmYzRzQzS1dmZXd1aktwbUZPZXZxcFlr?=
 =?utf-8?B?SDg5amZHUDE5aFNCVWlMUGttOUJTc3gvTk1haGtwNklNL0pwcVJXKzhyVk1F?=
 =?utf-8?B?N2FCSmxaRlYwS1JqYjU1QzFMdk85d1pEWmxTT2NMcWtKSXJUdXFuUFBkNFBw?=
 =?utf-8?B?UFJTbE5aK2s4T2hTaks2a1pkeDRhZmdSbnlaTC91VGRWNFZraFNQVzR2WmJz?=
 =?utf-8?B?OWs5ZDIramZiM2sxbWFOb1lEaGpxNFNRVUcyL1R4eEQxTElwVThKZGN4Nnlt?=
 =?utf-8?B?NHM0dUxRZVB4U0VtdmM3My9DVE96clpYaVhuSWtMYWprWVZ4YnFGZWwzcm05?=
 =?utf-8?B?b1dnZ2Y0ZlBicUNYT2IxRGEwa0FmUTNTTDVVNlVvU2Y5MjB6c3BHTGdYS0F0?=
 =?utf-8?B?Q1pMMC9Gamd3QnRPK05xRG42am5wWHl6LzB4dzhGSWNVU3Rkbm84aERiY3Vi?=
 =?utf-8?B?SktSbDBsUkE0enZXcHhkQ21vSUpXa1pabi9GOUpndzJ3NEJ1T1hacnVDTnlX?=
 =?utf-8?B?NUVONUJ1dWkrZ09YVEhqUG91OFFZK0plbFhIdVRtd1VEVVFvTEkzTjY4azVx?=
 =?utf-8?B?b2QzckpQVEFXWEdvOU1JanA1ZTJuSGpNRm82SjBpYWp0aFFuWmpRWUYyamhJ?=
 =?utf-8?B?SUtqY1g2a3RhcEtORVY0c3gwTFRONVdDVXFaQ3RRR2Ribi9WU0FEWGdiNlhS?=
 =?utf-8?B?RmE3azZKNU9YaG82bElZdWtYNFNDVmdzZmRvVXdVc3UxQlVUSjdsY1ZGc0FK?=
 =?utf-8?B?aXByZkphRFc0NS9SMGg3bG9TajQzWEI0cE51SU1jK2M2bEtyVDRYZWdvb3Nt?=
 =?utf-8?B?TnVXbXlDWkR0MjhtV21Edkg0TmZiZDB3MllsVGxJamltNmhyNldsNnluNUZJ?=
 =?utf-8?B?L0lSc0pxd2QvUG9xTVFCYnBybTE3Y2VqOEdmQk4ya0lYWHhwWDZiOTRtVTYv?=
 =?utf-8?B?SGNONXY5enlSck5oTUVSQzVpdG5Hbm9aYVhuWEtLbkZ1UlNsdU1TaHF4UGUx?=
 =?utf-8?B?VkJNWkRvSlhlNCswOUJaQlVsSzFVM1JVZ0FNQUt4aThMWklJZy9COC9RN2pE?=
 =?utf-8?B?MDhXbnlORjRIbFFJUjhOQUtGODJrL0JlUjlKb3VJUEFYZnN1VWcyVWEyZjZX?=
 =?utf-8?B?cW45K25VQTFPN2pDYUxnbXhORzA5R2gyOUtQOUJTbHpydGxmSkNtK1pmMkY3?=
 =?utf-8?B?Q3lrTVl2ZGxHWUVReVdVaUpZdWt2eGJFUmdZcEt2bXJmZnJzV3ZmK2tLd204?=
 =?utf-8?B?TExjTVNkOWIxUVArbkVHWksyQUhxNlZ6YWlVU2FkanM4d2xIVlVmVGlNdmpB?=
 =?utf-8?B?dXRmRkYwYnZsQnFIbThLb0FrVEg4ZmoyMlVJNngxWGg5b0VZYThaS2h1THY4?=
 =?utf-8?B?c0FIT0JhTjhZbm9aNTduTlBaRUFUVUVzbDdEWWdwVVF6SFViUFo3cHEwbWJa?=
 =?utf-8?B?cEtUK21uditvVXpyVUlMaDJWMzA2THUzRUJQVlNPMnlBMDJBa08zR3B2Yzd0?=
 =?utf-8?B?eTRmQkh1SnNLT3FVZVA2Z2s2WlBNTzB2RmhBMGhWeWhIQ1h6UXRwNmdZaGRV?=
 =?utf-8?B?MmxWU2dBOE0ySnMyZmNudSt2MkRZUmwrd25HZmg1a0RGbTdnTjVWYk1Eangz?=
 =?utf-8?B?Njk3QUlXV09YNkg5MmhXZXVjeTJYUDMzNlJhQmltRGp1U0gwSER5VEs5YWNm?=
 =?utf-8?B?VzNDSHdkZ1BiOG8wc0xwQ3dKWm5lQzhtM294NmNIcllDVHBkY2N3VGdnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2pVWk1icXQxYTFhNGhOVW1abFoxYVJNV0NHVDBlVVczbDBtUFZWMGJLRFBY?=
 =?utf-8?B?WUthODhZK0hPVUZnU1BNR0g1V1pPSDQzNzhEb24wWVlQenFhTldCSkYydzBI?=
 =?utf-8?B?ZkFBaE52QkU4K2V6ZGswejk0UHVHbGJlYjJ3M0d5VTJvai9BbEQ0UlZUTFMr?=
 =?utf-8?B?b1EzQkxrNU5HTmxkbWZQMVZ6dlpiNXoyOFpSZlpNcE1KVjZzYjF2Y2dzands?=
 =?utf-8?B?b3IvcXNPRkJ2ZVJXZWZzbk1BbUsvTUxzRk9jYWdicFBjZWU2dlArbkhpb1Rr?=
 =?utf-8?B?THM4dzBTeVJZNlBwdmVSbUhFcjZkczhGSm8vQXBwR0ROdWdXRE1wM21QQkhk?=
 =?utf-8?B?S05ZQlppWDdaQ1JRQ3ZubzN6MUpsRVdXbjBUYis0L01lQ3Q3L3JlNWNiUWIx?=
 =?utf-8?B?ejM3bmNvWFFWN1I2VzZaVkNCYUFQMHBhbVhBM3pRRW1TZk9lRXU2K0lQZkFa?=
 =?utf-8?B?NDE5ek1hbVUwcXAwSTNUWm5SMEM1VkJ6R1M4MVNlU1FRM0svZ0FWcXRUSHVu?=
 =?utf-8?B?RDM0QTMzaURHdDF5bXRFZXVRa3RCUUdaMm5SSkJsb0pJRjhKdlRqQVJFTlVE?=
 =?utf-8?B?RWd2WkFqYndrM2FGMU5mZ0VrMnAxZ2dqeVBRT3FaSEpRV1AvWjNhdmdTdVFY?=
 =?utf-8?B?cTl3d1phdkNCVkNPWXJNR1g2STBmN1FYUlIrWnIvL0RkSmNMckJ1aEs1YWxU?=
 =?utf-8?B?dmN2MnY5bmFaYjJ5dk1UeVJoQXJJOVNyNzdLZFQxVjgybjdFMThSdmxZQUcz?=
 =?utf-8?B?cUxnNFRjRlcvTUNWSVFGdGpVRXpGQ1N6TERtQ3NjdVlYcjlXbzBRY3JKb1M3?=
 =?utf-8?B?emhqK3hWcWwvRi9oemRSZU94OW5ubzJ5R01ab0tsbVgxOU5DaDVmRHFXcnFV?=
 =?utf-8?B?aVNaeUtjTEJqc0dSMnczV1VIaUh2Rk54eVk4YVBLNlVPWWpWamdka3B6ckE0?=
 =?utf-8?B?OU1adjlOUGorY0w5WUlYNzdSeU5meWhueFRLakVudmROeHdCM3NZZ0dHSG9Z?=
 =?utf-8?B?WHp3MU5WR0UzY2Y3bEpCMm5STVYwbStDZW52aUVNL1cvRG43TVc5Z25kK29E?=
 =?utf-8?B?UXhmSFdSc0x5YjFXM3B3ZjNyMS8zN0d4dXNEZno4elY2MktEcksxRGNVTlRy?=
 =?utf-8?B?N2c1ZUxTSmtwMm5mOVRCTFgwUzg3N2k3cGM3ck5oOU1Nci9xYVJ2QlJWdHFE?=
 =?utf-8?B?YndxQ0dvQlMrbngxanRLaStEZW5rdmVKelB5YVBacDZ3MWJFM3hGSUcxZEJD?=
 =?utf-8?B?SFJoWUVzTys2amlNcDhyNCt4N0J5V2ZlK29BMkZ2VWJRUTF1enQ1TktJN1Qx?=
 =?utf-8?B?dXl2aklKY2V4ZFphTGVhbHgrdkN2SC9rOE1ZRXdXbE9JQ3R3QTVjcGJVUERw?=
 =?utf-8?B?MlQ4enBGV2lVdk1zN2xleFg5RENPdVlZNGRmMW1MUWp0Wk9PVDVCNGE0dXln?=
 =?utf-8?B?ZHpxYTlJTVErK0M0WGREckVaU1RleVJQOTI3YTJkeU5IQVFHcTljdUlwNGZ3?=
 =?utf-8?B?UUliVG5jVnhkNUFBQmpMU1h5VlJaWmVjUWJVYzRmS3hlelpTRkZ3QndUdkRt?=
 =?utf-8?B?ZlJrdGovNkpidnVxQ2Z0YkVGY1hHUk9Hd3JnK0NlRlQ2Vk1ubDEwblZCblln?=
 =?utf-8?B?THF4NVVFVEJ3b3VuSXZkVzVOd2NaejRPZ243ZHFnajQ4NnIxeXl2WjFNRHNa?=
 =?utf-8?B?b1ZYOE9ZN3hMZ0IzbkFtdjlWa1FaaUVLUFFld1QyeHlCVXFPMEFTZG01NzN1?=
 =?utf-8?B?K0xORElxQ3JHa1V0aWFqZGpJZ3F0akZUQ2NUYWEwWTJST0haVVRsMU1RaXRL?=
 =?utf-8?B?Kzd1OGxmaWxRb21kb01DQ1ZFMmdQQW9yN3M0bU5rRjEweGZ6QkJ0dmtSQnY4?=
 =?utf-8?B?ZHMwZ2gyRUhRNUg4NFVRQk0xSWQveVU1WXJtbFNwVU50RDEyZjU0dHU4c0RQ?=
 =?utf-8?B?Q2d3WU1kc0t1eEtCQVBGdi9KMXFqZmRUbmhHM05YUHV2Vzl1TythUG9wNWNy?=
 =?utf-8?B?cEdHSXZCd3ZlWVdIdE5ZNjRQS3lkaEFuNVlYcVgrbjV2UXFaMmVpdWR5dGZo?=
 =?utf-8?B?SHVMQ0ZjN3V6U1VDK2VQNFVpY3cwUUhpb0sxckN3eGVqeDRTWGE1dEp0Tnov?=
 =?utf-8?Q?rNjrFs93msXco6tIWdO2PlYyM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebfe39e5-b59e-465b-5b26-08dcdc144726
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 21:11:23.3390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2RTqwtuQjIG1SBHQIZC5AA/56lQfCh1q+ajVCSyY5lDfVedSjWpLPy/q8wp73SGLWIMXa1E5dHq8pG1DHM7ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6934
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


On 23.09.2024 14:02, Michal Wajdeczko wrote:
>
> On 21.09.2024 00:29, Tomasz Lis wrote:
>> During post-migration recovery, only MMIO communication to GuC is
>> allowed. But that communication requires initialization.
> shouldn't this be patch 2/4 ie. before actually trying to send anything

GuC is obligated to accept the RESFIX_DONE or RESET while in the RESFIX 
state. Regardless of whether the KMD says "Hi" first or not.

This means the patches are in the correct order.

>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_sriov_vf.c | 40 ++++++++++++++++++++++++++++++++
>>   1 file changed, 40 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index 459fa936aaba..3cea2d21525f 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -22,6 +22,36 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>>   	INIT_WORK(&xe->sriov.vf.migration_worker, migration_worker_func);
>>   }
>>   
>> +/**
>> + * vf_post_migration_reinit_guc - Re-initialize GuC communication.
>> + * @xe: the &xe_device struct instance
>> + *
>> + * After migration, we need to reestablish communication with GuC and
>> + * re-query all VF configuration to make sure they match previous
>> + * provisioning. Note that most of VF provisioning shall be the same,
>> + * except GGTT range, since GGTT is not virtualized per-VF.
>> + *
>> + * Returns: 0 if the operation completed successfully, or a negative error
> correct tag is "Return:" see [1]
>
> [1] https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation
ack
>
>> + * code otherwise.
>> + */
>> +static int vf_post_migration_reinit_guc(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +	int err, ret;
>> +
>> +	err = 0;
>> +	xe_pm_runtime_get(xe);
> again, maybe PM can be done once in vf_post_migration_recovery()

We could, but we do not need to keep it during fixups. From what I 
understand, the lower the granularity, the better.

>
>> +	for_each_gt(gt, xe, id) {
>> +		ret = xe_gt_sriov_vf_bootstrap(gt);
>> +		if (!err)
>> +			err = ret;
>> +	}
>> +	xe_pm_runtime_put(xe);
>> +
>> +	return err;
> do we care about sending a reset to those GuCs that successfully
> completed handshake or we assume that going wedge is sufficient?

On wedge, all we should do is silence the hardware. If left in RESFIX 
state, the hardware is silent.

We can't assure that GuCs won't be in RESFIX state anyway, because 
another migration might happen after the wedging.

-Tomasz

>
>> +}
>> +
>>   /*
>>    * vf_post_migration_notify_resfix_done - Notify all GuCs about resource fixups apply finished.
>>    * @xe: the &xe_device struct instance
>> @@ -44,10 +74,20 @@ static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
>>   
>>   static void vf_post_migration_recovery(struct xe_device *xe)
>>   {
>> +	int err;
>> +
>>   	drm_dbg(&xe->drm, "migration recovery in progress\n");
>> +	err = vf_post_migration_reinit_guc(xe);
>> +	if (unlikely(err))
>> +		goto fail;
>> +
>>   	/* FIXME: add the recovery steps */
>>   	vf_post_migration_notify_resfix_done(xe);
>>   	drm_notice(&xe->drm, "migration recovery completed\n");
>> +	return;
>> +fail:
>> +	drm_err(&xe->drm, "migration recovery failed (%pe)\n", ERR_PTR(err));
>> +	xe_device_declare_wedged(xe);
>>   }
>>   
>>   static void migration_worker_func(struct work_struct *w)
