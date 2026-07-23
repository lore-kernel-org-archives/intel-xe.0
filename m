Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2973FC531D1
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 15:03:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58A610E110;
	Thu, 23 Jul 2026 15:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jek1lLpj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0977C10E110
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 15:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784819028; x=1816355028;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iTdGQNZPDhbgmU8Ml604N9BSFrrR6iCobDlG5Z4hyfw=;
 b=Jek1lLpjWDXlxSI7D1ZAvRHG0U8aBduhFBIAktVJ/rl4BIxPXGkKlbcy
 g30HDrAJHIgE5X1G2bBAGp6NEBKfdBFGmx/ZP7Sp0Tr1EMaPY8jpVY4w6
 IcTEAJPQNky+StB/WQTum+ju8RGWEMKscirrYro1Sf27ML62Wpe+fhUjl
 bcHF8msZ56k53vvqwpJCHSgLYVir488d5KZUgZyGiLhmAj1+VwIpuaelP
 ah8IXq0n9HHO4v+51JnmMyr9UK0j1bIx4Wx78w36XgxzVRl8CGURtocD4
 ZSnaNnYTB7R2qIUv9vqtBgOumHCoyORetsJMrZrzJQrfCGuH+AD6dXsLZ g==;
X-CSE-ConnectionGUID: wjQKw/ynSDOwxjqd572I3w==
X-CSE-MsgGUID: yH6C0L3bSVyg+VRo7ZPi1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85238244"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="85238244"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 08:03:47 -0700
X-CSE-ConnectionGUID: 1zMmuuHtScaw7M74Y8Ydcg==
X-CSE-MsgGUID: wf25/lfhS0+SMXMk0YLdWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="288414424"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 08:03:47 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 08:03:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 08:03:46 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 08:03:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMuWw59x3z697Q7EpQ0gnAJzSjVyFvmrrpimSdUL+ZP3q9Gtyi/zoHMKGmoR9ZCItluZ7TUQm0fvAQPoq+F7f3nUkoEYI5qSJ7Ym/bHkE5RLnLA/UCDEnvPjg7InoJVGRnd0kArsKheijG4rPaEJxuiL4IQyglacVc60zkw8FHMIHabuXn6Hf9tZW3nmDmXF5YJpis5tP8oGCrvK55ePcfnSmmz21sRV7QbNuCvJmlwFSCjc2g6Bclyo3a2uPYNtiCtY1wpVFCWtUMrp9f76xL++rTsRZmMDKW+hA3Y/etTIjsKweBMfpybYsV3XnxBCUOuZjJ1stco29zj/wzGOOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0OU5TH9R4Fa6EHcSJuenTNcIydJSXnAd16SFT5HXtM=;
 b=MSC8ydv6Qz30DG7BROkOQpeyeci3ijqgJEUbPJTF4P0Qph78S296XdWsYQTlQ2BdTJbE4eabjFb8nEKQU/jwDyoDL/wVZZyVSvIUwODbfnyZgmpRCOzrge2YHYgQU1GwrOog46bGvqRuwT7lz/oYi4zdTGPk53SsfsSFPiIxbvIPGrzQmAy9R/A86NQZIA+MFGCTqhi1lYqaWcriBSnQ1ZdTeuOICqXaEJHaDMmwLHhZSrPNTlc46HOgperP7YEmkXcFli0YzAPBN/6hAUwGwZEwqMZFyT8gTTg2ZB672uj61s1mL8NufqZ/xsFC+oVgn+NfcyvKh4ipx0TN426RWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA4PR11MB9057.namprd11.prod.outlook.com (2603:10b6:208:55d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 15:03:42 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 15:03:42 +0000
Message-ID: <94fa85ed-5e7a-4347-9411-5a0f7209aaad@intel.com>
Date: Thu, 23 Jul 2026 20:33:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] drm/xe/xe_ras: Report correctable/uncorrectable
 error events to userspace
To: <rodrigo.vivi@intel.com>, Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260722094134.3036087-4-riana.tauro@intel.com>
 <20260722094134.3036087-6-riana.tauro@intel.com>
 <amDglMC44EIWChvp@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <amDglMC44EIWChvp@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0201.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA4PR11MB9057:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e8f4ecb-ea45-401a-2b9d-08dee8cb9598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|10067099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: IeT8z/oY9rwsnOfUSU1Ja4/cD4L1njT0g01l2GOu3lgwb9SfP+YE7/X3FOAGtjRZ5fzqYp8H7+UnGepX2aVng40rYu0ZwtHtU2Qzmg61zzD9I14wwx4mQxVHB5jCTpVv5ZHy7O1zfrOAxi9q3QeqpsFrK9BJsAmo6Dm2oFjxzkNrfjHX+Npgnj3WCvmnCT++DkC3m7NzFf1wXN0QtN0KWApW4su/CK6QquneRAdQMen2MQNu5UX3Fdr8ZhafgcajdWjeu2m2NztD5kNICppWI/iagzKzCLuo7mtxJZ0kP7tLvRCJJXigWlLqFwFTsCO6nYAlJg5Wcae6D6DdCoaIPmAwhHBKxoz9PXbmBzoYDFF+WbJuzTB8xf4G9GFyjzJ1GnIA6Vt15jm4FpB63njl84mHfpsJoCAaVoErrA7or9O/vjjys0LEbUZ0+Ve9lcBmm2eV5i+vNtKmJBUHq6X1eKar0fl5s/KW53luNOcz7EkmjVrQOPsyrvZioidWNKGiXOE+OtOgB+6h9Nwz7iA1nGMzizS69XwQ0g1jYlRGCECABliLGn9hAmh3NTk09XncIIHKLvNffsRpqHGpJA3oW/UTbvO/BY4rTooOTj9NkJMfFDrdcOgwFfNwZ+Q1n/OdXhTuENANESNwHGcwsK8ROdcZxzKdCFiVtgBEkpz0vKU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUdiZzRreHpuYmNWa2ZSNUtyWGVVUkV5UzUxb1QyRjZyV3hZV0tTekpubEpu?=
 =?utf-8?B?QU80VHh6dSt6clYweC9JaVV2WTdXUFN3RWF6dEFOakJFa3pFSHpDU2txcnRx?=
 =?utf-8?B?bnZxbGNlRHpzT0l5SnI1d2xjRmZPT2pGK2tkQitjWjhxVlBYSDc5TmJCT1o2?=
 =?utf-8?B?ZTY2ZnBlMFRBQUtNOEhaRXBVMlkzYmcyM3lqMDAwcHU4ZVNpdjZoOUF2U2pS?=
 =?utf-8?B?bWREZVFKWFMrVmtoYWdlYWd1V1Fmb2xYTXdON2hiRkdmNzlPbUVlbUtQWm81?=
 =?utf-8?B?N203UXNoR2xiRFlKOFhCNW5GSFU5WUlsRk9oT05tTFV4UG9NL250MVpiekY5?=
 =?utf-8?B?WU14NlUvTkh6SU1lWDJ2Qk56Y0FkbGtET3NPZ3piVkpwcWdnbzk1YzJnRlRV?=
 =?utf-8?B?ZDM2R3BwaVphbGJtbWgwU09mRVVTOXowRlVXOWZ2NFlHOTdXcU5hQVhnRU54?=
 =?utf-8?B?RHhEMExEcnZ5YzJUNHExNEE3Y28walk5SEpNTG90R3NwZHVHeWxiUUgrNmVW?=
 =?utf-8?B?Y2tpQWxobzcrbzN2NzNNTFJIU2NiWVozSExMRlE1dGZWSVhSenB6TDc3WGxt?=
 =?utf-8?B?UDFtTEdyT2pUbjYvK1orTEd2RStNQkJFeHRkbnpIL1E1QS85bURJS0Z3TjRZ?=
 =?utf-8?B?aFp2d3JYYTllekl4dlBiZVdGQ1pMSnVvajJ3VTFYNFRzczZYUVJjOUI4QlRS?=
 =?utf-8?B?dkhUaEpweVRFTGdSaFhuemtGWU94amVCd1E0ZS9GUVptMlRYK1RpREpaV2Zi?=
 =?utf-8?B?dFc4V09sRklzdXdZYnhibDdRK3ZPN3c0Tlc0QmFpUGhJVW83MzdlY3piMGJw?=
 =?utf-8?B?aGxRcHorQXdXTDhXNEJnQnZKOGtHNzQ0ZVVDdS9hOWF4OGEzbVMzYm13WERr?=
 =?utf-8?B?dDVvN2lRNXZiR2s0aHUrOGtQVm5BSjhsOGZsZXBGNnJPYS8vZzVUNTJvWlJv?=
 =?utf-8?B?SS9vQ0hEcnBlRXdGR09mUTB5dzRLMDVDUk5WRGJiWHljTVJUSXo2RGorTG1y?=
 =?utf-8?B?U1BMaHU3dWI0OFV2VUFBc04ySjBnajB4RkpsTUs0b09JL2lCSzl4U1VjeDZk?=
 =?utf-8?B?dy9DWXBLbm05Rmg2aWFYZ3FPTktSUktydDArOEp1MEZWTjhpN2xjZGwrRVlu?=
 =?utf-8?B?OS9TWFpnbDRWaDdjR3doUXpTemphbmhJZXMrUzV4NE9QNWttMVlGR0U5aHYw?=
 =?utf-8?B?MGpucnBUL0lkTWhRUFhTM2lpTVA5VkJFMzA0WGZFUjh5ZGFuYmZOSk9NemFU?=
 =?utf-8?B?RW45bHpxV2JSSndNZnp5YVF3bkx5SDZoclFhU2dZeFA5dDdQR0RqOEtGeFFm?=
 =?utf-8?B?djJGWU9sbXdkckdrWXBwUE9CSU1tNkpETURIL0dMQ1huVzlZRDg5YWtBOVdE?=
 =?utf-8?B?SlZkU0dndmlIaGoza1VvRExtbWtSeDdPcUFzclVnNThYdW1VRzFjS1RKdGNy?=
 =?utf-8?B?WGxjS0tNSUdqTUdEM1FPUXVPekZXUklsL3Bha3daZU1PYnNERUhZYkhDOFV6?=
 =?utf-8?B?SHpPL25LL3BxbGRRczV3VDh0MlhWMHBCem1xM3A4UWhJTkdyV0JYWGdQVEJp?=
 =?utf-8?B?TUFNcHgxNVQvYW5uSEJVSHpIeENUa1NGeWIwaEJ3eVAzWnJ5T3NtQ244amZP?=
 =?utf-8?B?SWZKbnZiWFpkdmFzajdxSDVTeVN2MW1KRTNlMjZUYnNpQW8zNnJIbjBlUlZW?=
 =?utf-8?B?cnVzZXZOdFNHbjIzV2pZd0FpRG9NTlJDSkNqR2hVNkRGWmNWUHYyZ2J6Ni9K?=
 =?utf-8?B?YVVyK3p6V29oVDB5Q0xWUlBUOFdRYmY5NWd4eTZodWt6K3VjT0tsdjQwSER3?=
 =?utf-8?B?bVJSbC9TN3lIOERLV3lLR05IeTU3UGRQQzA2eDloaFgzUCtUdFpKdTFZbC9P?=
 =?utf-8?B?NWZoQTZhbzN5bWZFWGdaU3BrV016MzdLMGc3YzBSS0h6VmoyVksvTHFuYjFN?=
 =?utf-8?B?T0pERTlmK3prT0pieVo0WkxIQWJtV3g1UWhyOEhocUZKZThiZy9hSFgxOUsz?=
 =?utf-8?B?TTBOMnF3OWc2aFg4YncwR2VXd3BEVjdRRGtWSkw1dGdKZFp1aENNUXJodVZu?=
 =?utf-8?B?TWUwVFVMZVMvVnNyWXJ2ZVZNcmtrVytqQmpYdzkzMGNhNzNWSXMxblF5WGlJ?=
 =?utf-8?B?TlBkSGpTZzd0Qm1haGlnZ3NIaUdMaVdDR1UrNm1nRGtNUkRpUW1TV1NFdDlU?=
 =?utf-8?B?dEJBZDdpRllKTEdwSU9tWU5rdGZoVmpERXdUcStxMk52VWVrS2c3SmtRc3dE?=
 =?utf-8?B?dFR5YUQ1ZmxiWE04UWJzajVQT2hrc0NySmhuUUUxeUN0YmJjNksrT2p1dE1K?=
 =?utf-8?B?NHhWTjFiV3g1N1o2YnBCZXY2amJKK2ttUHAzOFlEcUJOTmE0NE1nUT09?=
X-Exchange-RoutingPolicyChecked: TkX1bOGD8BP/EkVmGJLUH6c6kJRjHJQksjJGVGtrrZsFUYAS3TmmVuMBQAyrZVg+zJuMcbTGfpZEMmrvcvvKpynCvn9CuyRrY0y+KC/0FoUV+WFmxDnxtnlvZU2Y2esio/2fdO/SicOr+moEPa/akYO5fzvyRtWpzWS6sZAf5WT2RaWo+n+2N4xZSG+5A27oPWP5FtcYkD03gn7FVpqSLhyRHSSuYgVqseJv+9+sCtxDZDPmxPLKe+7pHK3SdmmJUxy730sBdl8veYQbD5rrSCLjsjGsBMzB1iXJ/AwWe/Q2IHj264/DL2yCRXZxUjZ2WTyDwRAG6SgmP3IhpIw5Uw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e8f4ecb-ea45-401a-2b9d-08dee8cb9598
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 15:03:42.0295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2HDvb/3HJtPiIKsS1yIET1I81Iu8o2KYLg1IOpo5gXEetMrps3G/UwthEYBiP3KNJJ3vbgIHQRosGDQJ0P7TRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9057
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


Sashiko: [Severity: High]
Does this code introduce a regression where an unexpected firmware 
response can
cause an out-of-bounds memory access here?

Response: firmware level check is resolved by below commit. Should 
resolve on final rebase.
https://lore.kernel.org/intel-xe/20260722143142.675658-1-raag.jadav@intel.com/
<https://lore.kernel.org/intel-xe/23532ff4-498b-4d43-ae79-a1c4326491c5@intel.com/>

Sashiko: [Severity: High]
Does this deduplication logic introduce a regression by dropping 
distinct RAS
events?

Response: Avoiding multiple events for the same component was an 
intentional change and
does not require a fix.


On 22-07-2026 20:54, Raag Jadav wrote:

> On Wed, Jul 22, 2026 at 03:11:37PM +0530, Riana Tauro wrote:
>> When an interrupt is received for correctable errors indicating that error
>> counter has crossed its threshold, read the current counter value and
>> deliver a drm-ras error-event to userspace for each affected component.
>>
>> Also send drm-ras error-event to userspace for uncorrectable errors on
>> receiving an AER.
>>
>> To avoid sending duplicate events when the same component appears multiple
>> times in the response, Send the error-event once per component.
> ...
>
>> @@ -425,6 +487,12 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>>   			xe_info(xe, "[RAS]: %s %s detected\n", comp_to_str(component),
>>   				sev_to_str(severity));
> Similar to threshold crossed case, we should probably have a BUILD_BUG_ON()
> against XE_RAS_NUM_ERROR_ARR.
>
>
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>
>
> +			/* Send event once per component */
> +			if (!(sent & BIT(component))) {
> +				sent |= BIT(component);
> +				ras_send_error_event(xe, severity, component);
> +			}
> +
>   			switch (component) {
>   			case XE_RAS_COMP_CORE_COMPUTE:
>   				action = handle_core_compute_errors(arr);
> -- 
> 2.47.1
>
