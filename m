Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20486C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 16:23:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0BD4113546;
	Fri,  8 Mar 2024 16:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NiN8jcMk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E3C112FBC
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 16:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709914982; x=1741450982;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QdcWbE6MzfREsBHofrjB0Sv60YRfGk3h35+YVeSoAr0=;
 b=NiN8jcMkEpArk9yrkGrnrsG3ha9i01apuquSM+6EtDFpW25D3Sdu0hJg
 CW5EchXuARDpnvnfySglQBry27nKmKkdjFIwR0Ba2dHsdXUfqV5dkKtCI
 zV3SqsvahyVSEmEBDtAc32xdQca3Z+FBjJZcko7YlP7h7Wz8mG9JXE2os
 6OzmvpLtEx7mEyjoBvW9+buQttzEvPh80MCFaCexs7TiMSo8W0gmv7+zo
 j6Co/4TkaxOUXcUpB2xAZU/kxLZKkbA6nBDGcTxMOd018Rw30SkfUes+j
 k00QDv14CpELX7ieXOuJKY/ixWJg3X7dLipd1tIpucEzSRMtMDVAYWuPF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15361166"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; d="scan'208";a="15361166"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 08:23:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; d="scan'208";a="14994787"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Mar 2024 08:23:01 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 08:23:00 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 08:23:00 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 08:23:00 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Mar 2024 08:23:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMu/vPu8ThPGSNj8KX18yM2euUbFAjWnloN7flgVSr8p6wqHrwQxHmcPefhPxv91AP/l6qMadYtrk08+ZlNk7Yv1l/VIL7WQaBa9TgJfPQnHCv0uRsmi1kOCUAyaH3Ur2oMpxF4sRH4U/cG2BB4TiMgpOuIarsGvP1zKWiwT3KgGtMONxGtZkKrw3DS/7SRipCRwsqIWZ9WOsO2pgHR0Nr08N+CWc4cxbeGfV/DfaDqvtMz8JxmCTI0H8FlOG78yO2TvCpvlodpJ5um8jyNk9WQhq09PfZCuyrVCS56XIn47MouFEAp06OHlrgnjZCtwNh0K40gBDMaGzqlICFG7QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K05Kb/iuz0KfpkYy8Ul353ditjbd0NfWw2XcTjw93FE=;
 b=YWpSEsbvl4FU/60fh2VueVLtXKHQWTYRva+rA6KNCcyK3EnVwMeeUN8ZbfrPW6e+QGZMuAhDpE4yZ+UOOt5JjwjvvatSOHanYKhyHZEqihGDorGOJScWBU73pPKgsYqBZyVEjzzootEXCEiizPqhnKyETZ6NYnuVaaMLelJoQu5skWZaoTF/x5TlpqYbc0hSvwoYY/HG+aHQXh9clFWoV2kvGKVwKCu/f9hvg4E7Sjcu/KMY7iJstSTtMrIVcc10yISq6TGCC4+j6N1T2gQEIvpy5NVFdXnkZJ3ubFydTAdEii4Fjgw55ybbcWLcu++27jpaJJCXEK10OggYTcrhJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by BY1PR11MB8126.namprd11.prod.outlook.com (2603:10b6:a03:52e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.8; Fri, 8 Mar
 2024 16:22:58 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7386.005; Fri, 8 Mar 2024
 16:22:58 +0000
Message-ID: <ad13f0ba-4dbb-4f37-8a1d-879b2cb111cd@intel.com>
Date: Fri, 8 Mar 2024 21:52:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/vf: Remove lmtt->ops null check in
 xe_lmtt_estimate_pt_size
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240308043651.2010165-1-himal.prasad.ghimiray@intel.com>
 <20240308043651.2010165-3-himal.prasad.ghimiray@intel.com>
 <ZesmInDmDsLY1uPh@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <ZesmInDmDsLY1uPh@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0197.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::6) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|BY1PR11MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: 9918f730-e43d-4826-5e2f-08dc3f8c0466
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S0sgpd3stp5gWdTVXT5EEOR34RCbkGji9uTN0TPREx0oLnA9D9uLgC/YoP8sH7J1O4x1O1zKrd1iKPMGfGsaz05tXDiCzn4jXu85vBLkP4VeUuC2CqRieb0xM5XgDz6bg5CdZMro65t+vDUQScTh4Elry1QdyAWWSxsUM9ZACtKlcs/Qmkvqla3XudeRv6Kr1JqBlJ4PQOovO+2NVpC6H9r171pw/1SRHVfc/I47+zPTmglFbQuRoCZsTlPac9GkQFYwOue6k+ncMAygdYM7lKgKnRYyx73Gs02gNztIKssz//gD85Hax0ZIdFH3ppImOqcxp/6eQH0C2C7t1ZoBVKwArET1H3wliUvFCUm2oU0POxTlA4sDayXG1hpyUSJjDJcgQIAfkJafsQ0kB58AJNpJ09qzguWgkWJjHh2FQd/+dngEALS4Cg9wBqBBXh7YaAxQMgQG2HnqNJ4WGslSf9n1Bt0rgZe/TDy2h27DDvw7xRWaScFB4LwAyWRNeT4FUOXikYUY7NjxVc/hGuxD0ykJzLOLgiDDDP7LayAxTij6mEAbblhssHB39+wEsSdmO4qeFZx4OZ48adH105A6AVwCirw0wy+Xe4LIHJJP4DWyXiLkqG7+OV1lhL1gN5FhjwCv1OW1K486BIWVB3f0bQyvDPH0uWKgugJusQtuqUQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d25aaEI3UHZRNUhpV291d1d2WkEzMVRlR1hZWU9QV3kxdlE1bmFicHRVZjRV?=
 =?utf-8?B?bzJWR2N1LzNVNUVDdkpQK1RIZlZiTFd3NlRVZ2FBdkk0WTIxcC9qNFBMTTJL?=
 =?utf-8?B?QWhHZHRwb01aWWt4RGI2WG8yV2xGTlQxM1VrbDYwd1llNkJKMFczbnpFTXhs?=
 =?utf-8?B?Qjc2VW0xV3ZpR1BEK045dzBIZm9TRmk5Q1NIL04xcHEraVVvdzB5aDdBQXdT?=
 =?utf-8?B?R0diK0JFSXdMMTVVMjhwRFJKbXBFZE9ZS1hDREVtMEpnclBwMXRra3JuY0pq?=
 =?utf-8?B?Y2kwQ3AzTTkvb000b2ZmS05CbkplaXZuSytSWTdyemFRYnZLcTEvSVNVTU5l?=
 =?utf-8?B?d0N5bUxDRDVtQndLSWVxaWR1NmpGTHNPZWtpUGI3Y3R0R0ZMckkyRC9qWFgx?=
 =?utf-8?B?WkJ3eWpiVHE5SmhBVzR0QTFYMEdva0hudjNjZmY0UVIvRkIzMjJVeEI5OFdX?=
 =?utf-8?B?cVV1L2VIQmt3REdxM1hkdm8ybXJHbVJ6WkxObE1oYStKbHpWN2RERHFKV3ZE?=
 =?utf-8?B?VTVXWTI2QWJ1eGpURmY4VWhjYTVQNC8wNXFNVENqVHFITnZXVFdQZjhycDUv?=
 =?utf-8?B?N1huRmliczBlcUVRd3RLblprWXpGL3FucmlNOGNJVVZsNlJPc2xoSGFhaVBz?=
 =?utf-8?B?YmxWbEI4MmpBT3Izc3FiY0pjdUZkdVRFY09oNWJrL3VJZjhWUE4xOVRLRkhu?=
 =?utf-8?B?eGp0dW1aRytUa2RJSms3dVdNQU5FYnNwQ3d3cDZmMWZzSW9HdHlBOW9FSzlG?=
 =?utf-8?B?TTV6bnlyV09rMmN1WlJIeTRsRGs0SzBoZFV1NjdRNFl1ajh5eTk1Y3BFdENk?=
 =?utf-8?B?bnRndGVkNzZjaG16VzN0K3RlVUZkVnBqU2V4V1pxNmdBYXRhT1ovU20wTlNU?=
 =?utf-8?B?Rk9LT1A3d0llT21FRS90b3Z2alp1VXpmSVpaYU85anlOWldYcjhXVkYzWVZ6?=
 =?utf-8?B?R1lkNURJUVRmbEJkRE1Ca3J6RWNkU3BUdmdHSWtkUTJoN1FhU3dpYnNEWEhw?=
 =?utf-8?B?SjNRSUsvek0yOXZMWHNlWU5qc1dzZE9iam1ncnAwVjhJRmFFMitZemVQdkN4?=
 =?utf-8?B?UHN3K1RsS3FnS09waCtydGR6QVZUWlBlTm03NW1NZHRMVzdaWklDdHN6M1Js?=
 =?utf-8?B?RUFRSmVQUlV4M2lrR1RqYTV0ZlJhQktXYWNUVFNDKzZDT1Q1MXlDSlQ1YXBv?=
 =?utf-8?B?bzlRcHEwK2d1UlZMbVVZYVQyOTVHK2I2cnNqOVRrQWEzY3lMcFhWU0MydWZs?=
 =?utf-8?B?VWJ3YytWS1pmSzd4QkVoS0ExeGs4K2VETklRLy91dkZvb2VydWNERDVVMWhU?=
 =?utf-8?B?MmZFQ3NXNWVNYm1ZNERlMVBORGJSRmQ4a25QenB1OWpHRlBERE8vaUpkQTZY?=
 =?utf-8?B?V3NrREp0SEtzMTFKQzdyRjVGcTZLRHJiWEJ1Szgvc1MzZ1c1RXRsVmRxSklV?=
 =?utf-8?B?bWRqbnlPMUNreTRwMG9TMWJscmVIbHVObzBnNTVwR0lJMGFZNkl6bWtMVUdw?=
 =?utf-8?B?NTBIMHlHNGVKYjdCSGVkb2RiMDBvcUhhTWdpWmhpY29iU3p6a2xvZ0kxL1ZE?=
 =?utf-8?B?OFdtV0ZXejlCbGlZb2pPa0RWWmNtb01tYUsxK3QwWlJxK0d0TGIzM1dSL1lM?=
 =?utf-8?B?anJDVGVIb0FabGExdEs0bnBWdXdlbytCb3JVNWJENTZ3SjdacG1QSTRESGRD?=
 =?utf-8?B?MFppZWJYN2xBdTcrN1NlRDhhTGlNd0JBN29SbGtCTUVUZ0FEcml6YkEzM1pw?=
 =?utf-8?B?bXQxNHlYdnUzcWdBbEZtc1Fwb1Y1cnYzdTZ1M24zQnk3dDNOUjFndWNCTU5R?=
 =?utf-8?B?RlEySXZaRkpzRWVWOHFPbThmc2xlZTZnZnVabU92bmM0K2h6VlBXbnhVWFBC?=
 =?utf-8?B?OVQwZjNtaEVaYTFXbUlRTnlDZk9tKzhLYk50MWovZGFOcm1yWWtQcFdlNmp2?=
 =?utf-8?B?RWsrbUpneiszOERhdlVUVEU2RFFBek5hcktRaWYvemgwaExlVWZPRVU5NnJO?=
 =?utf-8?B?MVJOMXBrekxyaFhVbEx5VWYzRjdsWGkvT2htZmRwM1hmVXpvS3NNeVVNODU0?=
 =?utf-8?B?T2dXTzhuTmphb0xubitGM1dzelRMSnpYUmVhLzZ5VUZHNmRJS2lGekZYV2RG?=
 =?utf-8?B?bDFjR1hpREVpeFpScFRaODd3bmkwclkyMzZWVUNjMkJoYThpa3NQOGZ4Szhm?=
 =?utf-8?B?SFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9918f730-e43d-4826-5e2f-08dc3f8c0466
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 16:22:58.5065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3g7rFf+UIUMgup7s5pGKU4iFFGGbszzZYBwn85K/VEw02Mefa+h4QHfappNUb5OAFzGCypXnJeuD1QvnD+iSj2MQTTbRpNf3DX2c6rvQrBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8126
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


On 08-03-2024 20:22, Rodrigo Vivi wrote:
> On Fri, Mar 08, 2024 at 10:06:50AM +0530, Himal Prasad Ghimiray wrote:
>> In xe_lmtt_estimate_pt_size: Pointer is checked against null but then
>> dereferenced anyway.
> And what's the problem?
>
> In the line below it access beyond this pointer, so it is a fair
> case.

The problem is even if it is NULL it will be  try to derefrence it. 
Which might lead to segmentation fault.

>
>> Since xe_lmtt_init ensures lmtt->ops is populated
>> remove the check.
> With this in mind we could simply remove all the asserts in the code.
>
> I believe that if someone introduced it here it is likely because
> during some development or refactor this ended up being a problem
> and want some earlier kind of warning with backtrace information.
>
>> Reported by static analyzer.
> Perhaps then replace with an
> if (!lmtt->ops) {
>      drm_WARN(...);
>      return;
> }

I am also of the opinion that this is the correct check to have instead 
of just warning

about lmtt->ops being NULL and continue to dereference it. Need clarity 
on what should we return in

case of lmtt->ops being NULL since expected return type is u64.

>
> and/or mark the tool as a false positive?!
>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_lmtt.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
>> index 0d7c5514e092..d6d75414bb99 100644
>> --- a/drivers/gpu/drm/xe/xe_lmtt.c
>> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
>> @@ -487,7 +487,6 @@ u64 xe_lmtt_estimate_pt_size(struct xe_lmtt *lmtt, u64 size)
>>   
>>   	lmtt_assert(lmtt, IS_SRIOV_PF(lmtt_to_xe(lmtt)));
>>   	lmtt_assert(lmtt, IS_DGFX(lmtt_to_xe(lmtt)));
>> -	lmtt_assert(lmtt, lmtt->ops);
>>   
>>   	pt_size = PAGE_ALIGN(lmtt->ops->lmtt_pte_size(level) *
>>   			     lmtt->ops->lmtt_pte_num(level));
>> -- 
>> 2.25.1
>>
