Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD254E6F068
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 18:40:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D82910E9F8;
	Fri,  1 Nov 2024 18:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KZEaOq9+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9BD10E9F8
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 18:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730486407; x=1762022407;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xcmz5jau8ghtbTt1nWMgaqXtZw0tpVZPEl2Ty0Q9aCY=;
 b=KZEaOq9+jG7TNdlnYoBQObyZZAvatSHrRiBYrbno6lmdqTe60nRxG9SV
 2vjD7qIsFv3V6X1mAzhehy30ZHdq8HNU2i273qYqiHASGcifu8nrI54Cc
 RxhZdXwSgfbasojZWxugEbpYEJn7LqRoQxWoS/7DkHdx/kmrY7EQrrmUr
 oz5XEnpOM+KoWfiYCUR4HMWaOaoy8LjL1hTLN7+cIOTJAVn84dTtYKMyx
 Tjg1kdul3p82BSSNXkzlyrBhGz7eSGr1UMu1PPVosZcQiuNOekv0tND2m
 horBDkJo1q8F4DgzXAB0MZHIpjFkXi3ksLOfN9tSErG1+CLhDNRhfsUs8 w==;
X-CSE-ConnectionGUID: xuuVY3MOSMOQ2laj0VQ05Q==
X-CSE-MsgGUID: YBZnmWP9QnWkkthk9CXxDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33951057"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="33951057"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 11:40:06 -0700
X-CSE-ConnectionGUID: 1pukBlrZSYuVQj3f/rtTcA==
X-CSE-MsgGUID: jbTcfSEmSruJTzeckWAW8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="83865514"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2024 11:40:05 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Nov 2024 11:40:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 1 Nov 2024 11:40:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 1 Nov 2024 11:40:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8Xrwj8l813Z+zeQGXkiuAQpdw3grAuFIpZyUKi93tEQ8OhJNGGpdy8u1ozPG2lgkxm8Mb+UFM0MrKf/UcyOx82RDfcMgYwQzoCrJvwFRPK54RS6kDNXk35pWmA+xfTY0P0P/YEzj0954X9vZmxERSBTdOGS2ni3hmp+YlZ6XbLQNq+MasmtTlD+xfWatkC8ZOk8mZzYDnxVYP+U11bJtXEMpCbHCPewplkt/5Jqc5p8i5KXYWtW2ZVoES2UcqIG3i9qhr4/WkpYW5lSROMgzaTp7ahF/sKo12HJGRfgftAVzZOyItw0u3BoX94LpSxfft9VloqXsKSYJfVyWLRyOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVlWYYfJrIFIapCTwd8qVJ3IVpMeCJMlq+xjq2GfkH0=;
 b=MzubFvl5Vy6kIIHt+2/73RBiFQEwxyPYY9v3k5ni/Lt5BlYGPcxxs/fwJGTf8KS8D3m5AQVsOaSV2KLvjvxPUNaCaUTJGPlWwDpsl6UM9j4DgjNsEdn/wT0nuXTXy8QLoH/95VehawPXazU8KZx4hzYLfGCMnwA22oaxOUCIcMNFLALppLF14Fk5ediZhPcud61lbdo7rnfXMqa9gpte/4BAWuW9tEF1Ld4Q1eLJhoZWn2JmFJRx7bcZ14xTzYx27LqQyDxTpYUd8biGyqrrAklhQD27Vqg54EwJgUXUQda0kEFeGnhRPOcUCFdE2P1RpMq53m2V58VhtB+heCkhMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH8PR11MB7094.namprd11.prod.outlook.com (2603:10b6:510:216::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Fri, 1 Nov
 2024 18:40:02 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 18:40:02 +0000
Message-ID: <49fb16e0-8cf9-4d2c-b783-1ad851bf9dd0@intel.com>
Date: Fri, 1 Nov 2024 11:39:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Improve devcoredump documentation
To: Raag Jadav <raag.jadav@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
References: <20241031182916.1441987-1-lucas.demarchi@intel.com>
 <20241031182916.1441987-2-lucas.demarchi@intel.com>
 <ZyRrisQfc_59rrK-@black.fi.intel.com>
 <4kw2zzb76m42zbisvsy2fu52q2litchy6dfl4hyrmvze5u5dvk@hjs2pdynjemd>
 <ZyTutrXXD73sofRo@black.fi.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZyTutrXXD73sofRo@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0321.namprd03.prod.outlook.com
 (2603:10b6:303:dd::26) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH8PR11MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: 18757521-627d-432b-fd38-08dcfaa49873
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dW9wejhCK21iQU5HdTBVVUNhNWVKZmZDb3ZRMlRzbWNuNnZKZE5uNEV0UEtz?=
 =?utf-8?B?MnlOODkxd2lUOHFESmJiaWY3Q3R3b25QQ3BuVm9YUDFETDE5MzUwVFRlaFJh?=
 =?utf-8?B?Y29uaCtsSkQ1SGExbWQrQzQ1UXpDYzZDazhiOFU1dDJFVWhGNUlqUlNwUWVD?=
 =?utf-8?B?b2NndEluenYrRHhhSGkrQnNKUjVJYUpSdkhzS2t2WGZmZDJaNHRscnFHQmJs?=
 =?utf-8?B?Yk4yZ1poZXRYb0U2QlkxaWVKZ0NFNHZnR2FaMzcrelZUQWRDUHdtT1JYZUlr?=
 =?utf-8?B?TFVCRGtKdXdWU2s1cTRUQkFaNVhQMTd4eEF3M01IUy9Ed2FnekRabWZXSlJi?=
 =?utf-8?B?ZVpZZFdSNll6akkrVzUyMHh1N2t2YXoxajJHZWlkMUErTUhnRkVqR0ttYmR6?=
 =?utf-8?B?VHQrNlk4TUFJNmVseVpBdWJEbGNnMmlseUxNaFJnRk9GKzVtWUdCWklxZVlK?=
 =?utf-8?B?QXFyWWVIQWJxd3A3WHIxT0dCTVBlRForUlFQbjBGa0NLc3FFMEJYSzFETGlr?=
 =?utf-8?B?OXUybjNQMFhlZnJwTXZzNHlWemg4dWg5UHBwLzZLQlRxNXpoL3pwczJRNGIw?=
 =?utf-8?B?SXdHUENlODViWTE3V29XajdFK2JIRkhNMjlLcUI5UmZNY0hCVy9XOWxCQnh3?=
 =?utf-8?B?UXNLTnExN2NOaTJjd0JVU1NLWVJCTndsZ2Q4d3puUHpqUHNGa0pMcTkyRkYv?=
 =?utf-8?B?OUQ0RkltWnZKRzdXSmxEOHhkUVlyVWtEZzJjcFZrbFdxaDZkQk5GSU8xd1RF?=
 =?utf-8?B?ZTFCdmFJNFhvV1E5UGoraURKdUlULzNsdFF5Q2JwQmwxSUpVaXpuU24zaDNs?=
 =?utf-8?B?UTZ6bnEvR0NZZ0ljUnRNRVVsakpwS1l5RUU4R2dpZFI5aFFTLy9BbTRsL1Ev?=
 =?utf-8?B?YklJS3UxMDlyTHJpeXpjTFpJZkJ6SWNrUTRWTmpBUHl3bnZIc25paVNRSGZ4?=
 =?utf-8?B?UDNqNkZGN01VUHBTTkFyUzlrbUhsS2lnMTlqRnc0aHN2ZGxPT0VCclc5SjlW?=
 =?utf-8?B?bnY3Yk9BODNTZ1dPSmVVSjQ1YWdVbHpqeU5kYTk5eE5JOUdDemsxZTU2VUs2?=
 =?utf-8?B?dWdQeDhQYXdnYVYzQm1VVnhkd1BCaDN4WTVVVHpVSSs0eXRIVUpveld0R0Z2?=
 =?utf-8?B?ZVB6T3d0VUxpUURGWVVkQnJlbkR4M1pxbW9XZUZzWkhua3hUNm5jYVdqSXRq?=
 =?utf-8?B?VW8wMkV3Mjg4cktQZkdsbFlRVUZMenF5d3VGbUp0UEdjMGI1Q0l4aXMzRjBk?=
 =?utf-8?B?QUxXaEU5NUErdWJ2eHdPQjEwejVCbEMvZUpMZ1dsYmpxT1lpVC93THRMTVNQ?=
 =?utf-8?B?MDFLUDQ0T3hjQ2ZNME9WZGdGZklQRCtacUdkU0l2a1dMZUNkb2lhWllIeTZK?=
 =?utf-8?B?NlpmdDJZdWlKdkg5RVJ6RytNUXV1NTBtTWRmK0pvZHpwT051dE50dk5jWnV5?=
 =?utf-8?B?N1ZxTlBWRCs3QU40L1JheTBTNTY5REtIb2ZnUkZRZGdvOVJtMDEyYSt5TmU1?=
 =?utf-8?B?MlAvN0dya0dzakQySDR6T2NSUjNqbEN4OWlTZW02VHkxcnoxYmZzejBmL0NH?=
 =?utf-8?B?VzNGdDlRVVJUdlB5dlVwWlp0VFdqNHY2WXNFZk1VbllXV085aXRPQ1ZvVHlo?=
 =?utf-8?B?U3RiSUJ6RTlsSGRnUnE3TjV0UXFnN1VBcEN0Wk53UzByTmlQdklsbGRwV3Bx?=
 =?utf-8?B?cnNVK29WNm82cmpQZG1pR3NaQWMyVCszUE4yZU81V2w5NzdHemlrQXlMUytn?=
 =?utf-8?Q?L0W1FI0pTS6wzquusxMIFQkZ2QlBtmPN4szdpef?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVUxWlB0MlRyd0hTMWM0T3ZLd3hqL0k4WDl2ZXRPb2RURkkwNkVrZURZbWZV?=
 =?utf-8?B?Lytya2lqeU8xNG81czIyVnNTY3BtaFFXVUZUdnB4cUhGV1BObHBXdjVtemhq?=
 =?utf-8?B?UlFSZ0lxd3E1MUM5Z0UvODZUa0JocHdFSzZlakhxNjdLQndrNWx1MHNLbFNY?=
 =?utf-8?B?RHVaVXdrM2tiQjhHSFhZSW44bTNmL0I1VjNRalJRdzc1dTFZeTY1STdZZW9y?=
 =?utf-8?B?d3MwOTNNeTJHdTZKTnNSTm9ObEdjdGFiT3Nkb1pUanlTb1NMRVJHbG1rZnR2?=
 =?utf-8?B?aTMrc1JKbUhZZGQyZEF6Mk5rbUZ3WVVFS0xLMStSeWdNSExwSUJiUDRteGx4?=
 =?utf-8?B?RUtmYllteUNudThFOUVjMTNTUEhuVnFoZ200STBGaW1SWFBRRVluZmtORklL?=
 =?utf-8?B?YVR0REt2WjlUSlJJQXFVNnBHUVVRRWlIS08yelV2NlVJRXc5RzI3YXBsWDIz?=
 =?utf-8?B?aUxmTGlaeUdJZzAwR1g2SUxHSmwwTkpVNE9mbVNaRDU5NVp1ZHhKaTl0THFD?=
 =?utf-8?B?bk5UUXdGZllSeFhJYVlkakdXODFCcUYvRnVhZlRFNmVwQjZvZncwek96alpz?=
 =?utf-8?B?T29yL0p5WjJYU210NmQ3SjNnb0NLOEVtRTMvNlBSWU0wTEZ5M3NrRFk4NHRn?=
 =?utf-8?B?Uk5jWDFHUEZJVUVCaTRLV2tVemhJcGlEMDEzN0JaSldKZmN1SHh4VzVsdGpR?=
 =?utf-8?B?ODk0b3JMRUFYNHR3bGwzNHNYWWhiQ2NvaWZTa2NMVVFneEZqZFhwRmc1RjVh?=
 =?utf-8?B?QjFBTzdybnZjeFZjeFQ0cEV6aUhid0VVcWwreVRaUndMNE04S0locGpGQlJ4?=
 =?utf-8?B?STNpdktKMU5DS3dsV0k1L3hiY3BHQXcyWDVpMUJkbktpY0hqaGhXYzF3MHpH?=
 =?utf-8?B?bmJkTHV4TkJGOTZtL093a2xqN0Z0RzBORGN5WW5qSUtvY1FPMEp3MkhaLy82?=
 =?utf-8?B?UUVlR0xTaWRkcG9YNnpROFFYS1lCYkJrQ3hjaGlFYzhGYk9yYloySnEyTGJr?=
 =?utf-8?B?MWpCTzRGRDBmMWt0VmRqUkJWcFVzdVVDNG12VXNZOXlCaDh5RW1SQkd5dmxE?=
 =?utf-8?B?c2VDcDBSTklhMjF3a1dpL1NmdzJINTgvVmtNS3JhNDRxZWhBNUpzdW92enRq?=
 =?utf-8?B?bkpFb0wrUE96L01md0tScGIvS1MwV2JoVXZZMkN0WjRRL2pyZ3JSUldVODBV?=
 =?utf-8?B?blZ5Q2hOUVZJMFVOUmdjNHhTcEIra0lrRzdTMzQ5QmNFV3p6b3FMZlZ1dGVn?=
 =?utf-8?B?M045SGE3Yk1ydko3dlhUbThXai9VWlBuUnN3YWFXRDRkM0dUUTIwZlhVR05O?=
 =?utf-8?B?dkhpaTdxZjA1V3piMjMrVWJFYnVkSXJKYWlwRlQ5clVEWjFWWTcvWTYraERE?=
 =?utf-8?B?cS9nNXExdzVZWWhHWW51eHcyQ0loYnBXdGRid2pUSUo2ZHQ1T2t0SkNVYUEx?=
 =?utf-8?B?ZnJrLzdmZnp4eU91aUp3NHZTSU8yR0N5alRWM1RJQmt0RGVENXQrYk1zeVEz?=
 =?utf-8?B?c0sySXJobGpmKzVlZkltSDZNRlQzSU8xWkJTVmlGOHhEeXJ0TGQ1TkhNWWth?=
 =?utf-8?B?NXhSMTJpdTUwaFM5Mi9WZUJRdCtDY2Y0ZnJ5cWFUVjl2V05Lbm1RZmRPZEdP?=
 =?utf-8?B?ZnU2ZEdZWloya1p4aVBMeWJnTDE5NWJkUHhUNWNjeWZxZmlMWnNJaGNuNUZF?=
 =?utf-8?B?eFNzYjVYVks4amN4eUV2QTdvUnh4aDQwalhzbVdyYkUvZ3N3VmpTZ0tZdnhS?=
 =?utf-8?B?UXo0T09PUlNLcW0wNnVYTUJLajJ3TENONnpZbGN6ZUd5SjVYbHVSVGQ3Nkx2?=
 =?utf-8?B?R0h5ZnVsOGY5cGpSSnZ2OU9ZZ2lTRW50aDQ2Z1AvSHNyN3hWdVp6Znl2dWUw?=
 =?utf-8?B?QXg2N0Y2dFlSSHZaeTYwWUt1S0xISTFGY2owSTJMc3pCTGovZ0xJaWR3dWY3?=
 =?utf-8?B?bGxIc050c0JNbDk4Mk41QWQ1QlYrb3VIaU52dm1ucjFnZG9mTHN2MmNqdnJL?=
 =?utf-8?B?VXJRaEI5UEFKTW1ubmY3UmFmbHFVazlJOE0yazI0cDN4dDlsR1Q4R2dMSncr?=
 =?utf-8?B?d1k2bENLSVNZZWNxWGlTY0NXYno5M0tQcUI3SjhacHNaS1duS3BwdHc1Z1hH?=
 =?utf-8?B?RkZDTldBNUxBbFAvV2QwOG82c3JQeSsvTGJjbnJNK2cwQUl1WVVDU0lGVDZT?=
 =?utf-8?B?cnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18757521-627d-432b-fd38-08dcfaa49873
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 18:40:02.1223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExQQAQMBqUQK2Z842mQt5UTkpUyJpcmmR8/3hxGcv9OiW1rCd1arPqb/LprJdQGipmDj8tflJBLb2i0NEDgaHlXOs23vgAcRM6UqxNaMGBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7094
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

On 11/1/2024 08:07, Raag Jadav wrote:
> On Fri, Nov 01, 2024 at 07:44:37AM -0500, Lucas De Marchi wrote:
>> On Fri, Nov 01, 2024 at 07:47:54AM +0200, Raag Jadav wrote:
>>> On Thu, Oct 31, 2024 at 11:29:15AM -0700, Lucas De Marchi wrote:
>>>
>>> ...
>>>
>>>> - * Snapshot at hang:
>>>> - * The 'data' file is printed with a drm_printer pointer at devcoredump read
>>>> - * time. For this reason, we need to take snapshots from when the hang has
>>>> - * happened, and not only when the user is reading the file. Otherwise the
>>>> - * information is outdated since the resets might have happened in between.
>>>> + * The following characteristics are observed by xe when creating a device
>>>> + * coredump:
>>>>    *
>>>> - * 'First' failure snapshot:
>>>> - * In general, the first hang is the most critical one since the following hangs
>>>> - * can be a consequence of the initial hang. For this reason we only take the
>>>> - * snapshot of the 'first' failure and ignore subsequent calls of this function,
>>>> - * at least while the coredump device is alive. Dev_coredump has a delayed work
>>>> - * queue that will eventually delete the device and free all the dump
>>>> - * information.
>>>> + * **Snapshot at hang**:
>>>> + *   The 'data' file contains a snapshot of the HW state at the time the hang
>>>> + *   happened. Due to the driver recovering from resets/crashes, it may not
>>>> + *   correspond to the state of when the file is read by userspace.
>>> Does that mean the devcoredump will be present even after a successful recovery?
>> yes.... if it's not succesful then it's moved to the wedged state. Easy
>> way to test is running this:
>>
>> 	xe_exec_threads --r threads-hang-basic
>>
>> You should see something like this in your dmesg:
>>
>> 	[IGT] xe_exec_threads: starting subtest threads-hang-basic
>> 	xe 0000:00:02.0: [drm] GT0: Engine reset: engine_class=rcs, logical_mask: 0x1, guc_id=34
>> 	xe 0000:00:02.0: [drm] GT0: Engine reset: engine_class=bcs, logical_mask: 0x1, guc_id=32
>> 	xe 0000:00:02.0: [drm] GT1: Engine reset: engine_class=vcs, logical_mask: 0x1, guc_id=18
>> 	xe 0000:00:02.0: [drm] GT0: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=34, flags=0x0 in xe_exec_threads [2636]
>> 	xe 0000:00:02.0: [drm] GT1: Engine reset: engine_class=vecs, logical_mask: 0x1, guc_id=17
>> 	xe 0000:00:02.0: [drm] GT1: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=18, flags=0x0 in xe_exec_threads [2636]
>> 	xe 0000:00:02.0: [drm] Xe device coredump has been created
>> -->	xe 0000:00:02.0: [drm] Check your /sys/class/drm/card0/device/devcoredump/data
>> 	xe 0000:00:02.0: [drm] GT1: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=17, flags=0x0 in xe_exec_threads [2636]
>> 	xe 0000:00:02.0: [drm] GT0: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=32, flags=0x0 in xe_exec_threads [2636]
>> 	xe 0000:00:02.0: [drm] GT0: Engine reset: engine_class=ccs, logical_mask: 0x1, guc_id=27
>> 	xe 0000:00:02.0: [drm] GT0: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=27, flags=0x0 in xe_exec_threads [2636]
>> 	[IGT] xe_exec_threads: finished subtest threads-hang-basic, SUCCESS
>>
>>
>> If you run it again, it won't overwrite the previous dump, until user
>> cleans the previous dump or the timeout on the kernel side fires to
>> release it.
> Yes, which I think we're covering at later point in "First failure only".
> So maybe establishing the mechanism itself before explaining reset/recovery
> would be a bit neater...
>
>>  From a distro-integration pov, I think it should have a udev rule that
>> fires when a devcoredump is created so the dump is copied to persistent
>> storage. Just like it happens with cpu coredump (see systemd-coredump)
>>
>>> Perhaps moving the 'release' part to above paragraph will add required context.
>> not sure I follow. Are you suggesting to swap the order of "First
>> failure only" and "Snapshot at hang" ?
> ... in whichever way you think is best.
Note that 'snapshot at hang' and 'first failure only' are totally 
separate concepts. And neither explains the release mechanism. Reversing 
the order of the descriptions would be incorrect, IMHO.

The point of 'snapshot at hang' is to say that the universe continues 
existing after the snapshot is taken. It is not just that the driver 
recovers but that it keeps processing new work. In an active system, it 
is extremely unlikely the system state (hardware or software) would 
match what is in the snapshot by the time the user is able to read the 
snapshot out. That has nothing to do with when or if the snapshot is 
released, nor with how many snapshots are taken.

The point of 'first failure only' is that only one snapshot is taken at 
a time. If there are multiple back to back hangs then only the first 
will generate a snapshot. Further snapshots will only be created for new 
hangs after the existing snapshot has been 'released'. And I'm not 
seeing mention of how to release the snapshot? It would be good to add a 
quick comment about that.

John.


>
>>>> + * **First failure only**:
>>>> + *   In general, the first hang is the most critical one since the following
>>>> + *   hangs can be a consequence of the initial hang. For this reason a snapshot
>>>> + *   is taken only for the first failure. Until the devcoredump is released by
>>>> + *   userspace or kernel, all subsequent hangs do not override the snapshot nor
>>>> + *   create new ones. Devcoredump has a delayed work queue that will eventually
>>>> + *   delete the file node and free all the dump information.
> Raag

