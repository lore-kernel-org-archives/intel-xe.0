Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A921606A323
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 09:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hLOCeZrX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACB410FF79;
	Thu, 12 Nov 2026 09:36:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B2010FF79
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 09:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794476178; x=1826012178;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=oFnErZaBAgzJu4AxqspdYikrDr84yBPcuv/TAnVrTTA=;
 b=hLOCeZrXrYH47vXjw1Jd5a8nJQoVAg5jK9HGCGlAD2h+HrQBidCSikNR
 DjYaBxRMH8yTLl47geS3ECf5UHU6TLuCw6S78qXM39vm/cuZ2EV75HSTT
 sBKDNLUyK10+YcFKo1ZTfNW28sdp2o1LFr09vfMyGWdWwMJbVSu/KHX99
 LeiKTJYkQiKFnsrZbIY0Sgcvj2nA/RhwIG6elqphfaKQYbiQnYp4W2GAC
 pQnQhXpcBrZB3WhEBBVDUMAg0/orYrOhP3YZgiEP7WqZpKyPzdiixynoS
 x8O7w116x/fxmTWqBFRc561nOHMnIpBdK7lAri5AeyP2RyZPAFRMv5USh g==;
X-CSE-ConnectionGUID: o0qCr3uESQWeqk4yvIfsnA==
X-CSE-MsgGUID: 7PEOikM+R4uqq/JJ2agxfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3122569"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; d="scan'208,217";a="3122569"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 01:33:07 -0800
X-CSE-ConnectionGUID: a5He/oqLTIu5G28rjV3COQ==
X-CSE-MsgGUID: yZo2RGQsQUKCcSG2gFzSng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; d="scan'208,217";a="8432967"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 01:03:02 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 01:03:02 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 01:03:02 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.27)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 01:03:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yjeBqslbHBlPOu0pa83U9UG5j8iEJeNAN4VLAaz+pr5DyoJdjg6CMX2x+ZPw6Pmh6uhJfi7HXJuW3eaAVBDo7TCNQCLmjk+vq5RIPMI7SVabawfpmhYog8hAHrBoJKf6XbTK41F4rCj9nGuq3dFgKKROo5cSjjSjH/GqbAZSzet9jIhq4DLO1RmzA1NQddMohhzL/4lJWCSEDKovp3fNWTlNqEG/9xyeAIoKenaFuaPtUG7SPN9QLc/HRZxZ6ScqbPfarhfheOWXa07x4AqI4nnMECvs9U290waVKZfnpTp//4rZ9nwjpFtRxl8EgYIUqur+8IUSyQUxSdeVJOAeyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=evTTbONFxqMcTJ9PENqDxVb4xVNJPQrm32c6UunkY+A=;
 b=Deni/UAfi3j5eCYCQYsMUdF6e2hs/o7YTDhJm8bg9kBs/FmM9m5tdX26qRqjmMkWOKgKMgHRTa/iE42rTcsvSoRLCntnSmhNXSZz0D1NAjRgiz0eL4TsuVKtHL5Z2WsahZXveloAPYcwhYMbtoHNNv82WGluhWjQsCAR8eUY9UFfMLGYHLHbMG182ZEoPOYwkJZjas0AIR9hknz8Ha0AYq0gHqFLwU2+JNpdSHBB+dgaSAwv65KiLvS5k6j6bfdS1GUN47wR9rimKCzV2gjOYEIo2yh4vpobkVdumlvDThBrk9SfTEyqovt0gCrmDdWlNEv6VHcZQoOF+TVSwvLklA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by CH4PR11MB983712.namprd11.prod.outlook.com (2603:10b6:610:51b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 09:02:58 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 09:02:58 +0000
Content-Type: multipart/alternative;
 boundary="------------NxpqxcZZbz59UT0ZazBF2ymA"
Message-ID: <da57b7e4-a2e3-45df-b925-e840595b6b29@intel.com>
Date: Thu, 12 Nov 2026 14:32:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/xe_ras: Add support for PCIe error component
 handling
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <badal.nilawar@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>
References: <20261111123021.3253044-2-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261111123021.3253044-2-riana.tauro@intel.com>
X-ClientProxiedBy: MA5P287CA0103.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::8) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|CH4PR11MB983712:EE_
X-MS-Office365-Filtering-Correlation-Id: 23a9e10b-37ac-4ff0-cd19-08df409bbef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|261009223027099003|18002099003|8096899003|261022113327099003|261022105027099003|261021121427099003|261102123227099003|261028144727099003|261026140227099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: Nt0wn7SlnXlZYzI2TNoSg6hQE1Rt3/T3ABEFL0j+L7QlOKdxrmQIQWglbTx4knZpmGEYA9fDCLdoJeVPm9ddp19tHNQseNxN+kVVZ8an7OKTAd4/oBx7kKiatqKMQdtC06kYdTOeF/NHCz52dEqMpc8D3JM0ynQe65K4f3H3j3EVQftZcnQkYXJPEdhc+Oghv3I9n5QtgQuUW+WgiDAHK6wnon9qrgHddbbTMk3pf6toIY+8KEoArS7okq2gJ7R5JywAvo1N2sPQi8LUfxCDKx7vCTo55lou/I4z//R4ynh8Z2ciWsg4iyLyeQQ6pfNb91UDCQAjMYdv/fZshleaOYYc0Rk9ogsL5UnSMn0ZrwZor/T9o+GBGsUY7zXR1u01gxRrF0dTvkzBIkd1cRcilvvWhOKzpymLTsGNkzumy5d1J1xpXYoeqU1Dq2ulItDD75lMSv/Php9R4L62fMB4qT82XQaWtcKrDc2jqBrSh9CbgY7apNsz70kBtT6FFOfyiTs2SM3wsfkN4J9tJKtVkmGkx3feCKi20GuvbteoyM39YDs90VZmCqisKOxZGUTQPl6GXJw3pRE2sKcvhGCX7ycH48MIZkKC6AIuT9kPshfJif2ESmjA70HaeJkNuqnRJPHNz1mCSTdMVdfL04we91x/0+RdXV7zTufmriCyxU8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(261009223027099003)(18002099003)(8096899003)(261022113327099003)(261022105027099003)(261021121427099003)(261102123227099003)(261028144727099003)(261026140227099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGtwbGJaajZMVFVpd2tCUG1YSmFrYlBST0o4cGwrcUFRa0hERm1SWkNSK1NH?=
 =?utf-8?B?WlF4VXRXTjJxRW5uVWp3dk51b1dnSkRFYysrZDE1UGw1RGl1T25zeks4Z05P?=
 =?utf-8?B?UERrSTR1NGxCU3cwMzUyM2hIdlp2Z0h6U3RkNGR4OGxsK00zdGFxRkp3TzNN?=
 =?utf-8?B?My9NTVhKNmduOXNSc3haNEd3eWtyQ3BTZVJqb3l3cWF2Y3llRUN4ODdRUks2?=
 =?utf-8?B?amdnV1RXUTZnaG5uSHdiMmEzMEN4enFNTW5LKyswZVRmSjZhK2NWR2ppSExT?=
 =?utf-8?B?Sm1NdU9GdmxDb1RNOWx5MDdrNGdhZUZYYUV1OFoyZS9tcUVxRU9meHM0Qzlx?=
 =?utf-8?B?VFNUNXV6d3o5V2dOeDR5TlZ1ODdvVENMTE0wTGVBN3A3SEVuc0Z1MmdvV0hF?=
 =?utf-8?B?cG5Td1oydGtUdkJUS0lSTmRIWEZYR3U1RWNIeEpwTUwzbUlwSVhDS04vcm5V?=
 =?utf-8?B?ZGo4YWVObzJQa0sxdEFtNExJaTVsSzllVmxwcFVpb1BEMWtRTUZYbjRxck5v?=
 =?utf-8?B?Mm1FOElLcHEyM0JrZXhwcDdiT1RYU0Jueit0dXU1cmRoTEh6bzF6N3NTQm5u?=
 =?utf-8?B?Yjc4dGNiZE5WOU1mdm1nSFIxcW54WlFmMVE3bk12V1IrMFJXS0dpQ2QyR1RH?=
 =?utf-8?B?QVVoR2JIb3BpUnpIZ2FzNk9DNmVQYjFzai8vWmZHamZvM2IwWmhFMFp4NExh?=
 =?utf-8?B?L1VsTEcwcW5MU29WTFk0am9TRjJQUDhySGhxUTZXL1pXbjJRREZWRmhFMklI?=
 =?utf-8?B?Z2luVVl0L0c0YUpUeTc5SmZBY1l2Nkdwc1BrQ2lSV2Fwd1ZoVGtKcEQ1bGpj?=
 =?utf-8?B?OU5KVXo1bDVrVFlpcElPMTU5T2ZSWXlnaWt0a0VkdHhTdTMvRGExRk9YK2FV?=
 =?utf-8?B?QlZKNEZjUEF0M0ZNQ3ZtY2VIdTRoODJOZDlmay9qdlgveDlnamd3Wmt0Rnlh?=
 =?utf-8?B?NU9nYXRHTFJZOUxvbWVGOWlKMzM1MDJHdVk3SDd2QXllOUJzdWJsaWoxaU9K?=
 =?utf-8?B?RXQramNIVUlkbGdWKzZoQ1FKNjRsZ3pmZk5odG92R2ptRGROdElsUXU5dW8y?=
 =?utf-8?B?NXhkVjBaRG9PRThqbytNMldsWDArZjFRQ3A4ZjF4N2JZTkN5RzNEL3FySFhH?=
 =?utf-8?B?dzBOcFJIN2l5WjloZ29peDdmVW5jeXlpWk5sOVBreFhhYit5cVk2bGM1OFpN?=
 =?utf-8?B?MlpiWDcrbUtHVjJLYXZpZHl4cVhzc2FaZSs4bkQ4Vk5yWGU4V1M3NHF2VU9P?=
 =?utf-8?B?M3I1bVVTK0ExUk1qSTh1K1NLR0lpSVRkR05MY1dwTFBOTXZZanNIT3VkdGc2?=
 =?utf-8?B?YzBIa2JqTFVtQTFCbkdrTWEzVmdhKzVOWHJkN3RobG1SaStFZUN3b0d4Ky9O?=
 =?utf-8?B?M2dLa2lhU0k4am5DRFMvY2pQVnZvUUVRakZaQmNYSEVTRkFpbHNrMUZwMFpT?=
 =?utf-8?B?dUkzSkpUSmpWS3hscUp0a3g5akgvZ1B0dDl0ZEhobGpjV296U2FDK1RqVXAx?=
 =?utf-8?B?RndEeUk4WlFzeTYrN1ZseUxVV2tMdW5YM2lDbTBUYnBMWlZSSFN2NndQR3A3?=
 =?utf-8?B?VUt3R0laNTdLZ21WN1BPMC9Mb2c4ZUw4bUNLRUVUVm9jVTlyczRXbkJwbEE1?=
 =?utf-8?B?dmRid0wwM3FOTUhmY3Zzbkg1dExsTmhhQkMvRVZUQzE3MGhxYlkzTjY4ZHd4?=
 =?utf-8?B?OWJvb0pyc2tnS2Z0M1JvQWdSd1p4aVhES3AwUXVlenljWE5qVXh4SlFQVU9Y?=
 =?utf-8?B?N01EMksyeGFadjduWlNlSVF0ZWdYbVE5Q1p5QUwvNFVJNUZsRmtnYlpqcEUv?=
 =?utf-8?B?V1VvZlZRY3hTbUMxT2ZpRmwxTEphRjhia2ZKZ3dNaUQyMHBkWHZOU3ZMYnpY?=
 =?utf-8?B?eG1jZUN6d2w3SElBT0hHSWlDRHJJSzVhUWVsS3BoTXhTRDNBVXZhV1k5aW1y?=
 =?utf-8?B?QjBFZWQ3TUxob3Rab3FwSVkveld3TS81LzVTTWlFVTA5aW00bnVpMzZpUmhR?=
 =?utf-8?B?UFgrSkRYenBFVFNNTVVxOTZQbkJpNFo1czVsbDNIZ0t1OXg2dGh6eVhnazgv?=
 =?utf-8?B?N2QwQWl3Z2pWOTRSUm1LR2NSbkJYQ0VyK0tKK1lrNkwxcDFvV05OQlBOV0lL?=
 =?utf-8?B?VEJtS1Y5TE1PU0RGdVNZd1dieStXZk9WWlFpMzVWOGErMlQwZmt4ZVI0WGcr?=
 =?utf-8?B?UVVIaXRuQjQ1TFpTUjZIamVXRnA2SW1MQVM3aGhKNG9yems2MmxVcWR0R3lK?=
 =?utf-8?B?ZEFET0Q1ZmpLMktERnlESGRUOStlWkdSTkJBeHVQSUJoczRFMkdsWjZnbHZG?=
 =?utf-8?B?WThMaFZjV0tHblRQRGlBdHI2ZGZOaW5Rc2ZOY0Q1RElIZzdWdGp3eEc4MlNO?=
 =?utf-8?Q?QIyr9VuEsp3S5IOo=3D?=
X-Exchange-RoutingPolicyChecked: mGyBA0WCf8rbm0fSYfVOjGumb6ys4fdbBPixzUYkXMpJ2ZHUzaz97nJXpG5vw1NyD+hdyiUxKXT893ASI2iVd3XaYGV46fntPWRHpF7ezxwkCSRd+OHpG4gcCmVJnguknjnXj4JBn1AO/jskcEQsMEgVTCh+mkcs8OyOVSnfPklGQdIHo6KZSgvxJnJHs6OfCXR9WIWDWmO7lGWp6pKxQm+8A1lyh3Z1qSpDZNOSlpTHrOGHk5FsGN+ii3gbyoushypUN5qDrPqATP4427A0Qer7y56DU7TvTBg2zpWif1oI1ZcTxwL2k6wUDwINQhhw0EBJZOJR30S/uRM4kYllTg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a9e10b-37ac-4ff0-cd19-08df409bbef0
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 09:02:58.2577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HfYe9yxqYIZwwckW8B0tEaTBnsBlYLgxafvCFsWT8PDnAF98ZoIYEQO/70XDXXmgYNr5Tfzy0ofcS+MUTRYPRl2tP9LMbpWO61mEvU8oSIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR11MB983712
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------NxpqxcZZbz59UT0ZazBF2ymA
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 11-11-2026 06:00 pm, Riana Tauro wrote:
> Add support for handling PCIe subsystem errors. PCIe subsystem power
> management errors require a Seconday bus reset(SBR) for recovery. Treat all
> others as recovered and take no further action.
>
> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
> ---
> v2: add mapping to cper severity (Badal, Rodrigo)
>      add abbreviations
>      fix punctuations (Raag)
> ---
>   drivers/gpu/drm/xe/xe_ras.c       | 16 ++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras_types.h |  2 ++
>   2 files changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 2c01c183d02b..bd3ad017f013 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -698,6 +698,19 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>   	return XE_RAS_RECOVERY_ACTION_RECOVERED;
>   }
>   
> +static u8 handle_pcie_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
> +{
> +	struct xe_ras_ieh_error *info = (void *)arr->details;
> +
> +	xe_log_comp(xe, ras_sev_to_cper_sev(arr->counter.common.severity), PCIE, &arr->counter,
> +		    sizeof(arr->counter), "error detected\n");

For consistency, start message with capital letter and log 
global_error_status as well.

Thanks,

-/Mallesh

> +
> +	if (info->global_error_status & XE_RAS_PCIE_IEH_GPMA)
> +		return XE_RAS_RECOVERY_ACTION_RESET;
> +
> +	return XE_RAS_RECOVERY_ACTION_RECOVERED;
> +}
> +
>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   				      struct xe_sysctrl_event_response *response)
>   {
> @@ -889,6 +902,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>   			case XE_RAS_COMP_DEVICE_MEMORY:
>   				action = handle_device_memory_errors(xe, arr);
>   				break;
> +			case XE_RAS_COMP_PCIE:
> +				action = handle_pcie_errors(xe, arr);
> +				break;
>   			default:
>   				/* For any other component, reset */
>   				action = XE_RAS_RECOVERY_ACTION_RESET;
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index a86f9d2b8c92..36435a3f52e7 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -14,6 +14,8 @@
>   #define XE_RAS_NUM_PAGES			25
>   /* Error bits in IEH global error status register */
>   #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
> +#define XE_RAS_PCIE_IEH_GPMA			BIT(5)
> +
>   /* Device memory error categories */
>   #define XE_RAS_MEMORY_DB_ECC			BIT(1)
>   #define XE_RAS_MEMORY_POISON			BIT(2)
--------------NxpqxcZZbz59UT0ZazBF2ymA
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11-11-2026 06:00 pm, Riana Tauro
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261111123021.3253044-2-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">Add support for handling PCIe subsystem errors. PCIe subsystem power
management errors require a Seconday bus reset(SBR) for recovery. Treat all
others as recovered and take no further action.

Signed-off-by: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
---
v2: add mapping to cper severity (Badal, Rodrigo)
    add abbreviations
    fix punctuations (Raag)
---
 drivers/gpu/drm/xe/xe_ras.c       | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 2c01c183d02b..bd3ad017f013 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -698,6 +698,19 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
 	return XE_RAS_RECOVERY_ACTION_RECOVERED;
 }
 
+static u8 handle_pcie_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
+{
+	struct xe_ras_ieh_error *info = (void *)arr-&gt;details;
+
+	xe_log_comp(xe, ras_sev_to_cper_sev(arr-&gt;counter.common.severity), PCIE, &amp;arr-&gt;counter,
+		    sizeof(arr-&gt;counter), &quot;error detected\n&quot;);</pre>
    </blockquote>
    <p>For consistency, start message with capital letter and log&nbsp;<span style="white-space: pre-wrap">global_error_status as well.</span></p>
    <p>Thanks,</p>
    <p>-/Mallesh</p>
    <blockquote type="cite" cite="mid:20261111123021.3253044-2-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	if (info-&gt;global_error_status &amp; XE_RAS_PCIE_IEH_GPMA)
+		return XE_RAS_RECOVERY_ACTION_RESET;
+
+	return XE_RAS_RECOVERY_ACTION_RECOVERED;
+}
+
 void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response)
 {
@@ -889,6 +902,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 			case XE_RAS_COMP_DEVICE_MEMORY:
 				action = handle_device_memory_errors(xe, arr);
 				break;
+			case XE_RAS_COMP_PCIE:
+				action = handle_pcie_errors(xe, arr);
+				break;
 			default:
 				/* For any other component, reset */
 				action = XE_RAS_RECOVERY_ACTION_RESET;
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index a86f9d2b8c92..36435a3f52e7 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -14,6 +14,8 @@
 #define XE_RAS_NUM_PAGES			25
 /* Error bits in IEH global error status register */
 #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
+#define XE_RAS_PCIE_IEH_GPMA			BIT(5)
+
 /* Device memory error categories */
 #define XE_RAS_MEMORY_DB_ECC			BIT(1)
 #define XE_RAS_MEMORY_POISON			BIT(2)
</pre>
    </blockquote>
  </body>
</html>

--------------NxpqxcZZbz59UT0ZazBF2ymA--
