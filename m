Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7987CCCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 12:38:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ABFA10E771;
	Wed, 22 Oct 2025 12:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CJqXoUNY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E6110E771
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 12:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761136702; x=1792672702;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tlvUNDZlcGLJ7wKDKXAZw9B5/ZmBIPSlhJSGvmziJrQ=;
 b=CJqXoUNYTjG0rcY0pScmUNpyjrLbxuq/sH5PdqIHme4WK8WrhyCAFP0U
 PuWsTl1vS5ZGZMy6Mgg5pDFNMQyW8hqOvR+uIl5ypabnuM/aARaxv0LBH
 FiPVg9RDecER+4WHrxP9zXfCk3PwXS/FkNkUbAeJ2I+0dxZ/7LcupKYLg
 o+saq57kk0S5LiLVTTd9Uz/D7VoMvUdqBOgFCtYGIEKKdmzxXcMNEzOzE
 reSSF2ag6aIvOVRLqvqBLCX595ud/LU8mMkIx9qZ/y8Y6BTMa3aXB+AQJ
 N3ex3B2o2BJ5SPfSQp4VqXSwGdgsVTzkf8C7J6EATUo2L0XTdDhafcvdm w==;
X-CSE-ConnectionGUID: 1/NbxhOSSpinPM+HqhibBA==
X-CSE-MsgGUID: 9FUvaGmKQi6BojdWU0T3Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80719178"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="80719178"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 05:38:22 -0700
X-CSE-ConnectionGUID: bjmqGtHlQTy1WbCr9W8t7w==
X-CSE-MsgGUID: wKbYE3tYRyywkFWVEnwWhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="188143574"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 05:38:22 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 05:38:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 05:38:21 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 05:38:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzpbDM2pIruQA27fwmHnL2YpgXMhceuBgizkZkuhBNYAjSZYArr3dHHqwhP22b/0/wejFvi96qNZoe/+TpHAeqHX7Ep0n0ofeh0AwIngFap68DuPTTQUAE5fMmGh7THgm7D30Q1UPCmdv9eB77KuRAV+l0INDafQDlg3OYkxu6aDVSuDKkC9qK1ckZ7VgzQ/6taFTGhq+rNIH2emFjYtGpWgVuZQuL5Tzcg6Q702SFvjNHyKvTz1UvKFXSutjwViC4g8EoCV7aGQe6Qwi6tVZ4jpEqStfANZDFl2xgxEjbYK+DbVZackE1xahB8k7wZEf4pQ1W0IdpBdpya9mcqAmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lg3nmtIfGBNUdqtasxbJShtNAW3Kv3Ww0whcmqNg9u0=;
 b=Ll1TOXbKpOnVxCxuDgqCNJx3aTQbbfyjzhYHSe3zlMGOqtWgfDBTGBcHx83zI5trEUhVeCdzAiKZD3RrTLlO+Iz/4wGVird7rmqZST2EYDz4bizz8Smlr+Q1iC9JTI3Zz9fqak64XObt+QY7Nf3BF0FuWefhNK1Oelzs3ro1WmiyBeX8GYtPfNloKtg1HUR3twv7hesSfkuU1LVYEen5M6AbNUjVynbmi1RCRMiKO8IEi2IYbeaa/Ula3EdovOARgxYpBH17GAVjoX4J96clybgtiI/CjwhC30V3jGvOVOznPm7UDdqdQjuguBwzwGaTkduRyOE2oXk5hq2UM+aqJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MN2PR11MB4662.namprd11.prod.outlook.com (2603:10b6:208:263::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Wed, 22 Oct
 2025 12:38:19 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 12:38:18 +0000
Message-ID: <b02685b2-5e50-495d-8ddb-00acffd8f8c5@intel.com>
Date: Wed, 22 Oct 2025 18:08:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_survivability: Add support for survivability
 mode v2
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>
References: <20251014053257.3417575-2-riana.tauro@intel.com>
 <aPFE4hIJKUKh1pjz@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aPFE4hIJKUKh1pjz@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MN2PR11MB4662:EE_
X-MS-Office365-Filtering-Correlation-Id: c2b4ef4c-5b7b-4e4e-6d9a-08de1167e0db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1pEZGpTakIranhYZklnYyswOEVIN1dwa2RDSmNibzI3SHA0RGNMaFZrT2kr?=
 =?utf-8?B?TWJOQXdvd0k4dkc3RXhSOEZPT3c2cVpsNGNpWUtUb1Q0eHgyWDVDcjJtVmRx?=
 =?utf-8?B?RlhEM0tHOGhUVUQ2ck9DcEtWdTR6TGozb2VvanEzMjgyeWhmTXJuM1lBV1My?=
 =?utf-8?B?N2VGNG5YbSsybnBEZkt6R0l3UkpEamdaeDNPbDhOK1BVWVdzNjh0eU8wcXhG?=
 =?utf-8?B?bzFVUDU1NTRRZjlMMUh6bWEvNHorc05sSEl2NFNtQW5BMlBzRk9UQkd5VmlP?=
 =?utf-8?B?KytTT0RFdElFS2Z0OExwZGhqZUUxbERKSnNQVWdFQkNhYjMvL25Jb1VmRGlR?=
 =?utf-8?B?UUN2L1ZkNlhkY1g4VFF3elFGcmt1d09rWVhZSUN2YkFOUzVxZ2hMV1M0YUdm?=
 =?utf-8?B?bE5kS0pIY0FYcE9iR003a2RsbDZNbXVrYUFqS2FJRmNnZS94T0kwbVhrZU0w?=
 =?utf-8?B?bklXQnZGbCs4dWFXMzNHSmtKRERZZmVKeVYwV2g3ZzZJa1NmRWFiUVdIZVEw?=
 =?utf-8?B?UnNXTHZRSCtURU5vTTBseTB4ODhObWFuakh6dHozNnpPZTZ2bUVlVkFodWdr?=
 =?utf-8?B?ZnR2SHRHYTZVQ1hPVkJiZlNtZk1uYnBORUkrL2p6ZG9RamxSWW4zWTR2OEVm?=
 =?utf-8?B?YjZyS1A4VDRPdjdvTHJUQ1A1Z2NWblJxYWR0NmZqYVowUVdBMlAwRlIzeFRv?=
 =?utf-8?B?UDFpdVJmc3JCTXdtL1JVZk01VHRveE5DenpYc2hFcW9lODA0OC9PY0FZQnpO?=
 =?utf-8?B?YlVJRG8yUzNxaURGZ1laVjExWjNWeFBremZVTzFESUVOdnFtNmo1Q1Rqemkv?=
 =?utf-8?B?cnl3ZXQzRk9FelBSanFkemIrb01tVkRrdVJSUnZNbEdVOW95Q0xCVUM5YzZY?=
 =?utf-8?B?UkZhQ2RIbkFmN015WVB2WWQwSmIyNjBWY2VKYXArUmhHdnJmeWk3Q1lmdk9J?=
 =?utf-8?B?cWtyYUtXazE0bmpBanNwQ0FraVdWNy9uUTArUjI3YW1sbm95Z1lUQytJMS92?=
 =?utf-8?B?K2tjTGxKNDR4cUdxQ0h6RFcxNEtYeEZuRWJJS3JzdTIzakl3WEhvUE5Iaktz?=
 =?utf-8?B?QVBQYnhZaUo5WmxXNXlHTnIycjVHMjN3QVI2eXJnR29kN2VzWjU5UnBCSFg3?=
 =?utf-8?B?ZTJvOCtOT3B4T2tJWjNQQWwwaGZ0NUk2ek16OHZvb2pIckFNZmhTampBSmtu?=
 =?utf-8?B?NmplemJNTkJNa0ZmVm9lODVUakJibzRUSFFUWDF6b2h6MDVtN2NnbjROQ2Yz?=
 =?utf-8?B?Y1ZNMnJ6L1MwKysxNnR3UHMwY2tvZTVhRHFJRy9MVHB2MFRsQkNhWllqRU5T?=
 =?utf-8?B?VlF0ZkNjN3VnNmFpMXlYeTVrY1hKdWZDNks1a3BJRGhXZHlhZ2k4aFNybFdi?=
 =?utf-8?B?L3lQYk1od0JFL0dtYmpkbzA0bzdJMERMT2NIUHk0YWJjTHFadXBaZ2J5RkMv?=
 =?utf-8?B?cEtuTHJLRWlBK3NWL2RBYTFhRC9uQ0ZiVDA2QXorY2NYQXZkZEYrZUJxakpx?=
 =?utf-8?B?ek5vU1pxeHR6R2NKZ0ptVjV1aEhZR0ZqK2Zva0laZXhQcmhFMEZLT1pKdUN2?=
 =?utf-8?B?azAzeDRNSGYxa2w1aE9vNjByZGd6dGxPTGZaWTZxTm5tZWIyMzFvVVlkSGpB?=
 =?utf-8?B?OCtGQ01EN0sybDlxOHQzbVlYY0VHR0Nlbmd3UXZwSjhId1VuRWNVeWx6UWdL?=
 =?utf-8?B?UVBGUE5obVdHSDEwbmhXN0xRNExramYyNDd2b1VzVTFvdlh5TTVaK3lxUjFs?=
 =?utf-8?B?bnBQV3k4TW0xTzI4YUs3SmtFblBxSmxxd2Z1d2UrWDI2UkJTMFU0d3RuSXN1?=
 =?utf-8?B?d21neTFRWDU3SGQ1VWlmSEVmbnI0QVFtcTdBb1hjaE1GQmRsL3AwZlJmd2Zy?=
 =?utf-8?B?TEZYMjV2ZmpaQXRCOXRmQnpISmxibDNWZDYxUVpUdnRpL25xcFFWVG5jNkNQ?=
 =?utf-8?Q?VTeZdAxUVULmsqSCyOywzoBkGFIsDm5i?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEhqMWN1dnovK3Q5aHBrMTNHeU5rQ2cvMCthY0pGMmlqbkJNdGYwL3FXendt?=
 =?utf-8?B?bmRZNGdMbWZ0QmhDZVNHQzR2RjBjNVh6RHZ5VlZxTDdoRzhNSzR1WGpvNjhE?=
 =?utf-8?B?YlN2cDNMSS9yVUpTQm9udG1MemFKaFZHUTl0WWtpNTZuWXpvUmw0WW5GQUFx?=
 =?utf-8?B?UDBoTzFDRVBMd0xOUWVmSERtK3FlTUpadXc5dERDazFwNEx4WTZFcGlYcjha?=
 =?utf-8?B?M2dVai9PYnczYW1WL2p1OExzd3lqUmZRNVp3ZTQyL0JiZ1pXWDE4MTlleWdw?=
 =?utf-8?B?YjFYeEo1b0krdnVzOFlpZFFtRkJ0d0xSRlhoNkQreGh1S21tbnFTWTBsc2dj?=
 =?utf-8?B?Qjlndnp0MTBCN3creThQN1k1bFpHdE9hRzZzNURIbW1RNGdhNEVCc1F5bTVH?=
 =?utf-8?B?QmVLbDllMERQKzYxTTE3TklqK01ZVzFQTWxwTlppS2gwVVZIM2hNbnlzZllU?=
 =?utf-8?B?ZEhycDNpTGhaZjE3THpNM3VkZ1c1dFIzdUY0aFg4N1MyV0NJYjQzN2tPdmp5?=
 =?utf-8?B?amtJQWVpYS9BY2FNaWVOMW0xWTZDNGk1ZW1YSWJ6cmh1NW9sTWFlWWUrTUcv?=
 =?utf-8?B?YjJxejFCUlB2Z1crNk5WWkc1aEVLaGZ2N0hDeWJqeDlXSjBObmVJNXlIbE5V?=
 =?utf-8?B?ZUJFZ0k5OUY3RXZSazlRRWhNdFhsU3Fid2RLNkFzRER3VEczOXNxVFFCNExE?=
 =?utf-8?B?OU1zYS9aVUhvR1ZmUjVaMlMxRm5wVmlHaWlQZEw0cHBOS2ZHUkRCNU96MDFv?=
 =?utf-8?B?SUNVOW9DNmFpV3FQS2dCMkIzaWljSVNjT3lSQzJVT2RWTnFlbUVKdHNrM1BJ?=
 =?utf-8?B?b3ZHRnNtUXkrT1JLMGpqbW4zS1JjSlRjRThDbzZkckxnTGpELzVpMm1iQzFB?=
 =?utf-8?B?cUx0aHlBNldiWWlHdGRpTmRWcUhUWnAydGcrQU5CcmlRQThpcHlCT05jeHlw?=
 =?utf-8?B?L1VwWGppbWQrdjQ3MFFlclgzOHluZ1NmV0xzS0FiY2xlbUx5aFRvNHZNWS96?=
 =?utf-8?B?a1JaMUdyZ0dUSWRobGkva1k0Qkt3MXdhQjFXditVd3htT1VIL0lRSjk2NEZW?=
 =?utf-8?B?SlpRQXZzdHhQMm5XOW10ZDlONGQvRXdSWVFvai9LNlI3THBpNVNENC95M20x?=
 =?utf-8?B?QmRvYWxNNWVLMlpCaEc1TmYxR04xVXk2eVVuQ0xpaUp4UzZOTVVXb2ZLbkw0?=
 =?utf-8?B?TER5bEd1Q0tESnhXcjNXT1JzL2ppNndFVTZqencxVXBxbmZOVUxrY2RLN0N5?=
 =?utf-8?B?TFA3cVpnY0c3dkdZNmQvWm1RWFpDWVVWWEZoYXpybE1NRG93VytyMDE4R3F4?=
 =?utf-8?B?ckVhcnp5ZGQxekVaRG1keG5CRTJwbmVHcmRWbkY4QUczYWlTMlYrZlA0ZHRQ?=
 =?utf-8?B?QXZ5ZEljTzA4K2t0WTQySkxaUmc1WkMxa1BOeW4yeWtHZUVRRWYvdGQ1czNO?=
 =?utf-8?B?Wlc4aWVKUE5NNU5tMEhWeTRxSlFGMktwWm0xa2VqcGJpZ3lxaW9HeUR3ZnZr?=
 =?utf-8?B?TzVMVFppOUxjbThaWEswTVhIMmVRRzBBMDNRdXlURjVaQ3A3ekozdVFqZ0Q3?=
 =?utf-8?B?eVhXd0owenZMdTFvZUNpNWE3aHlNcHBXUkVDaUdrdktMU0dMOWErRHF5eU40?=
 =?utf-8?B?OS9oaGEvWGt1VUhwSUxMQmgwek9UaG15K0xjanlQQW9uVmhQVVhkRGJZUGlK?=
 =?utf-8?B?Nlp5YUpLYlFTL3kxUU8zN3hEaWtRRU1QV3RUbEVybVZZYWdiNmR0eGF5eGZj?=
 =?utf-8?B?a3JtOW43K0IyWGkvNDRxeG9nU3pOWXZ3UEN3TEJrZGJyaGljTkVjUlBjQ204?=
 =?utf-8?B?WFpvYm1sZmwvclVDYktnT0hpZDNCdmdKcUZTMlpBL2hUeVRDR3lEVUl2bmlk?=
 =?utf-8?B?d20yNDJXUGhSbXFnK2xjVWtHaG1JY0FuSkdyRWhIRjB2N3RhdU1vcllDYmF1?=
 =?utf-8?B?ZzFaaDdMU1A4ekllSUVNeEdnNlFNb3RYZVp6ZDhDNkVua0dha296cXZNMmQr?=
 =?utf-8?B?WjhZSW5HL29iOFl3VitQWGlXNFFRc2QwSkt5RnlqZjNiVEtuQ2h0SDdPZTIx?=
 =?utf-8?B?QUF6YW44UDJkWmg4TFpnZFdpaU9VMXZSdHBFcVYxT2tlRXVmVlovSTFaWVV2?=
 =?utf-8?Q?DPvoE2Pfo9JnbDtJ8TTdWRlB/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2b4ef4c-5b7b-4e4e-6d9a-08de1167e0db
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 12:38:18.7315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5uXc2ZpL5pyymNyMuUYtnaZAsXdVg4XQs2u0y2YoKgIqxJA6THQ1b0vKMofndfWtzUSi/uMKikSqDGDsI9JyxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4662
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

Hi Rodrigo

On 10/17/2025 12:47 AM, Rodrigo Vivi wrote:
> On Tue, Oct 14, 2025 at 11:02:58AM +0530, Riana Tauro wrote:
>> v2 survivability breadcrumbs introduces a new mode called
>> SPI Flash Descriptor Override mode (FDO). This is enabled by
>> PCODE when MEI itself fails and firmware cannot be updated via
>> MEI using igsc. This mode provides the ability to update
>> the firmware directly via SPI driver.
>>
>> Xe KMD initializes the nvm aux driver if FDO mode is enabled.
>>
>> Userspace should check FDO mode entry in survivability sysfs before
>> using the SPI driver to update firmware.
>>
>> v2 also supports survivability mode for critical boot errors.
>>
>> 	cat /sys/bus/pci/devices/0000\:03\:00.0/survivability_mode
>>
>>                 Capability Info: 0x138320 - 0x2001ae06
>>                 Postcode Info: 0x138324 - 0x0
>>                 Overflow Info: 0x138328 - 0x0
>>                 Auxiliary Info 0: 0x13832c - 0x0
> 
> I am truly sorry here, but although I was the one that designed this,
> looking it now, I realized that this is breaking the sysfs rules
> of one value per file and no fancy format. This is only allowed in
> the debugfs.

Just found the link regarding the "one value per file". When i had tried 
this i found few sysfs having this format, so used the same.

> 
> We need to change this asap, and with help from any tool that
> might be already consuming this.
> 
>>                 FDO Mode: enabled
> 
> After we fix that we can come and add this.
> 
> About our options: I don't believe that debugfs is an option
> without the drm card right?

No debugfs will not work here. And changing the path now will break
any tool using it.

> 
> Perhaps what we need is to transform survivability_mode in
> the directory. Each entry becomes a file in this directory.

Since tools check for presence of survivability_mode file. We
can try this. Will check and respond

Thanks
Riana

> 
> Sorry,
> Rodrigo.
> 
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pcode_api.h             |  2 ++
>>   drivers/gpu/drm/xe/xe_survivability_mode.c    | 32 +++++++++++++++++--
>>   .../gpu/drm/xe/xe_survivability_mode_types.h  |  6 ++++
>>   3 files changed, 38 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 92bfcba51e19..d41f07f9194d 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -77,11 +77,13 @@
>>   
>>   #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
>>   /* PCODE_SCRATCH0 */
>> +#define   BREADCRUMB_VERSION		REG_GENMASK(31, 29)
>>   #define   AUXINFO_REG_OFFSET		REG_GENMASK(17, 15)
>>   #define   OVERFLOW_REG_OFFSET		REG_GENMASK(14, 12)
>>   #define   HISTORY_TRACKING		REG_BIT(11)
>>   #define   OVERFLOW_SUPPORT		REG_BIT(10)
>>   #define   AUXINFO_SUPPORT		REG_BIT(9)
>> +#define   FDO_MODE			REG_BIT(4)
>>   #define   BOOT_STATUS			REG_GENMASK(3, 1)
>>   #define      CRITICAL_FAILURE		4
>>   #define      NON_CRITICAL_FAILURE	7
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> index 1662bfddd4bc..1c9421651548 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -16,6 +16,7 @@
>>   #include "xe_heci_gsc.h"
>>   #include "xe_i2c.h"
>>   #include "xe_mmio.h"
>> +#include "xe_nvm.h"
>>   #include "xe_pcode_api.h"
>>   #include "xe_vsec.h"
>>   
>> @@ -61,6 +62,12 @@
>>    *	Provides history of previous failures
>>    * Auxiliary Information
>>    *	Certain failures may have information in addition to postcode information
>> + * FDO Mode
>> + *	To allow recovery in scenarios where MEI itself fails, a new SPI Flash Descriptor
>> + *	Override (FDO) mode is added in v2 survivability breadcrumbs. This mode is enabled
>> + *	by PCODE and provides the ability to directly update the firmware via SPI Driver without
>> + *	any dependency on MEI.
>> + *	Xe KMD initializes the nvm aux driver if FDO mode is enabled.
>>    *
>>    * Runtime Survivability
>>    * =====================
>> @@ -105,6 +112,11 @@ static void populate_survivability_info(struct xe_device *xe)
>>   	set_survivability_info(mmio, info, id, "Capability Info");
>>   	reg_value = info[id].value;
>>   
>> +	survivability->version = REG_FIELD_GET(BREADCRUMB_VERSION, reg_value);
>> +	/* FDO mode is exposed only from version 2 */
>> +	if (survivability->version >= 2)
>> +		survivability->fdo_mode = REG_FIELD_GET(FDO_MODE, reg_value);
>> +
>>   	if (reg_value & HISTORY_TRACKING) {
>>   		id++;
>>   		set_survivability_info(mmio, info, id, "Postcode Info");
>> @@ -171,6 +183,9 @@ static ssize_t survivability_mode_show(struct device *dev,
>>   					       info[index].reg, info[index].value);
>>   	}
>>   
>> +	if (survivability->version >= 2)
>> +		count += sysfs_emit_at(buff, count, "FDO Mode: %s\n",
>> +				       str_enabled_disabled(survivability->fdo_mode));
>>   	return count;
>>   }
>>   
>> @@ -179,9 +194,13 @@ static DEVICE_ATTR_ADMIN_RO(survivability_mode);
>>   static void xe_survivability_mode_fini(void *arg)
>>   {
>>   	struct xe_device *xe = arg;
>> +	struct xe_survivability *survivability = &xe->survivability;
>>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>   	struct device *dev = &pdev->dev;
>>   
>> +	if (survivability->fdo_mode)
>> +		xe_nvm_fini(xe);
>> +
>>   	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
>>   }
>>   
>> @@ -230,11 +249,18 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>>   	if (ret)
>>   		goto err;
>>   
>> +	if (survivability->fdo_mode) {
>> +		ret = xe_nvm_init(xe);
>> +		if (ret)
>> +			goto err;
>> +	}
>> +
>>   	dev_err(dev, "In Survivability Mode\n");
>>   
>>   	return 0;
>>   
>>   err:
>> +	dev_err(dev, "Failed to enable Survivability Mode\n");
>>   	survivability->mode = false;
>>   	return ret;
>>   }
>> @@ -365,8 +391,10 @@ int xe_survivability_mode_boot_enable(struct xe_device *xe)
>>   	if (ret)
>>   		return ret;
>>   
>> -	/* Log breadcrumbs but do not enter survivability mode for Critical boot errors */
>> -	if (survivability->boot_status == CRITICAL_FAILURE) {
>> +	/*
>> +	 * v2 supports survivability mode for critical errors
>> +	 */
>> +	if (survivability->version < 2  && survivability->boot_status == CRITICAL_FAILURE) {
>>   		log_survivability_info(pdev);
>>   		return -ENXIO;
>>   	}
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> index cd65a5d167c9..379d90759c28 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> @@ -38,6 +38,12 @@ struct xe_survivability {
>>   
>>   	/** @type: survivability type */
>>   	enum xe_survivability_type type;
>> +
>> +	/** @fdo_mode: indicates if FDO mode is enabled */
>> +	bool fdo_mode;
>> +
>> +	/** @version: breadcrumb version of survivability mode  */
>> +	u8 version;
>>   };
>>   
>>   #endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
>> -- 
>> 2.47.1
>>

