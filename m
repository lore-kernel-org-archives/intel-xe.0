Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CC9CD5BD0
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 23:08:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9905E10E6FC;
	Tue, 26 May 2026 23:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ngTV80Jv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9AC10E6FC
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 23:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779836889; x=1811372889;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=c4LBEkUR/Fxrayatcs2ENxUvMrZYodA3wGI3xTZcvMk=;
 b=ngTV80Jvd2bWxJLA88oif0TNlIiHB0LwmRmNZz8ePSAVDuK4qLARWaR4
 YuYF5J2ssAQXNnT3GvnAnekekZp7aQr0Akr/GJkoeqAU5wO5CW+uqx5Oe
 fxFnYtwU1GV1D8f6hknDRIK7Zh+STwsYH66Q+pwM5gWXhHbRlc7ERxmHK
 SnT0vd4VxzKipRu16XioGyou6pkRTnodBpRwFsuWfnez8EUTVm0q4kZLx
 E3bXb2JIrjVM2FOD78UlxJlI8wdtPvxv1gYHQio6W5caCdPMihUslKujQ
 Y+yjB8GnX0ScZumTg0YQula+D5/Le0pNqhuwC1faofn9LBSFH3k2a4rEV Q==;
X-CSE-ConnectionGUID: UkrCTAgMQCurDLAuV+vqZg==
X-CSE-MsgGUID: YyXdJTA0RrKgZc+d8Tz0Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="79810595"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="79810595"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 16:08:08 -0700
X-CSE-ConnectionGUID: QUCZ3zidSIiMTl4jhC69SQ==
X-CSE-MsgGUID: 9PHFxnc9SOSrRn3z7pMGvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="237890200"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 16:08:08 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 16:08:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 16:08:07 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.13)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 16:08:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/4MhqX7uXTWfrRw44D+t5oo/SmlTzDKOWtvzFHkm8TLn2EhIEHRkZdZGAUofcPj7hxoMktfX7fd+cTs28H9QjwjxiKqqhSPiObEbE4mEmF4GswMqdaST4fLQ9uNowolZnPzLs+dSVaIdW7ZYrk3eCUjPM24CJBQuZb+j5bwCTSV3lDmZrsEofpTb5hFb3Z+Trz00I3AEJpoxF0fTETV3EXZfXyDXg6jqbiessr3B9EiGBj/RbjlkJ7GwAvgBi778MigF4VLoYrP+b+fXtRTO9wKQz5+sJiZmUFRbXM/5cxPE7LlJ978gb2/o1qTs0PuiQINNI9wtRp9vkUKhzNt4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85KoQEFeDTtsXazYfc7MC2JoCz3qS3NgMzUw6liJ+RI=;
 b=vSUy1X4TggN4Ik7RqqB+oKXGqxkDLhh03ypCnVFohLUbqz4t7IPRz9vgRWGvIlGmJX/EPY5Rk1+PPolY/vLbBl9SWtJgxtMJf25EbD7JY7DIXz7VgmLXKmaNqmM2LNF+UO9f2fe/fpc90xhAoCFyXhi8vGAc5z7BNcHSnt1bYXg2nerIWF23h22AZwZun/Hbpaz4+rbmBsa0HKh01uZALGe/MxIfcdZX/sp2rtf5aTHYmK0ACGxdfUxax+xLz4JbzQrvQTRe/9JZeG0iRA5bzd+lEVQpbW9umegepSVvKg3rBgGgBi6Kk0O5bVKP2KKLoYyeDVCRlbfcspeFcEZpqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SABPR11MB9962.namprd11.prod.outlook.com (2603:10b6:806:50d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 26 May
 2026 23:08:06 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.21.0071.011; Tue, 26 May 2026
 23:08:06 +0000
Message-ID: <60ac04b7-c8fd-44b2-a700-4134e97c6c03@intel.com>
Date: Tue, 26 May 2026 16:08:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] drm/xe/guc: handle submit mask with paging engine
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260526141901.62207-12-matthew.auld@intel.com>
 <20260526141901.62207-19-matthew.auld@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260526141901.62207-19-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0192.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::17) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SABPR11MB9962:EE_
X-MS-Office365-Filtering-Correlation-Id: cbae2b87-49de-4924-7a82-08debb7ba513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 8SKOAN3nWOACEQ/Y5Jr2rcoGX+50qN0y4WWhiBpD01bYuDKBFG77l/PhYNZtRjDhY++dc926jRXChkX8e5K5VMjCp1rpjjSA1PF8jG+1EJp9m243VDukR0PPkd05cUefg+w7YFZSXHWOtcA2Km06XO6IuQfghSPJZkos11fihFDzYZsRST1k4XvUfsupJ5W0ePNj7n+rFGRpSScXeDBA3vCrdJR82h9bc8SX+frAc6dOihRmRj316WGnf6MVQIVsv7PpJfFzu6ybtmhefL9QhucqlSvKqJUwIOd5guS+P4hHgbj5BEyJioXmX6dBOZomnyecGDCTwosH7HtVzmasKRQGTn45N2ZM8SWcNoNjkdWe1O2kKg4D46Pd+vnwtyYHdDuW+geB/BhaI7xv7/JgtSiIqr6oAL9bQa8/Ppefxlm4BelnpHDDuX7Ql0maqmAyRJpERVWOIxSMdSEh6nw7liyJeoflXIttN9EpZiv7hCE2uIxlN1SyBPH6M6uBbQK+bDz/Vc5l1nrUggzFNPpcpS8NbjmwcQuGAvoFmrpSdSaRNo+qD9wHhSw1EfjYHxqXPGV06RVLr5hZrtumlqHR2rfVRd/kT5NyaDDC2/exUEwECMiCohd8GWzqcrl23SOElC+kUmRnZMymjlSloiiwt7mIbsGxvPrWmCrKKwjt7GXmg00M0DDNTGYeO5kxFNjF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHhVUXNKdVRaZWFpTW14ZUhnd0hIOTVoNm1XSDI2elg4bk45TWFNeEhPMFpZ?=
 =?utf-8?B?ckZ0WmxUWWxBbFJtZ3NhcUkveU4vZVhqMzBWWWpmTXA4ZzdwbmlZNWVkblpz?=
 =?utf-8?B?ZjVpeHpvOEZRWTRyUU9HS3BaYmVkY2srdTBRTFJZM091NHpEZmhVL29DcmJs?=
 =?utf-8?B?bmxzbnQ5UmhyWkhLZDBaemg4ZVlDWVZaMmQvTytzaW8wLzN6bXJSU2ExRjZw?=
 =?utf-8?B?RU9tU2NhcjZkKy84WllDWDJPeG9GdHBmYUNPTDVHUFRnczRMZFoyZVpMaVpC?=
 =?utf-8?B?ditvd0dlTUZiYmpmVXpmanZWM2x4blFiTXlCS2VvVVpMb0UycFkvM2E4SDlK?=
 =?utf-8?B?NTFMMlJnRG1pdzhOanA4QmpCWFZtNTJqdnZwSU1xMWlUNXdGUjREbER2ZTl6?=
 =?utf-8?B?U1NLdjg5Z09Ua1VhdjljWUlPOUJlak4wSkk4akNlNlA3MmlSMlhTVmhSRnZz?=
 =?utf-8?B?akIwUjFVTFFyTmdscjR1U2V5NzlMUjdIMTh2M2lFSWdXa2MzaThlUCthb1lS?=
 =?utf-8?B?SVlVcDF0N3E2Q3VCNmdnRWNTSWRZazB1SmNCTzNiTFRwcFVwM1Y4eDhsbkpL?=
 =?utf-8?B?T3ZuVnluQlhPRVV5ZHhZVEJFalNlV2QvY0NXVVJ4Um0yQ3dDREM2OGJtaXdW?=
 =?utf-8?B?QjhFWWhjS2RuYVFmUUx2MnFDd3ExbGxXMk9ZRFJXcjFiZ2o5aktVQjd1emhZ?=
 =?utf-8?B?NGJkbEdnaXJyOG0wZlhpSHZMQXZaVDQ2QjdnVERIaC9sbi94UGR4WWlYRkt6?=
 =?utf-8?B?czZaTEozTnVsb29UUUZGTWZyMm5RSTlrUGRVajJkd3FMODJXb2Q1WTBOSUcy?=
 =?utf-8?B?OXZZRUxCajlUMGFyUWVxVkZLaDNzK291MnhxV0NTS2g4b1lzcWpPNk04T1ZV?=
 =?utf-8?B?K3ZmSmprQ3BxOUZUTXY1NnYzWEsxMGJpb0xTT2JWOXZwczZscS9jbE5WNjM2?=
 =?utf-8?B?SjJ2dnVWdEFRbnEwWTNUdnVRcGxuT0kwdHZGU2UwUUtXRlpDZ3FFZS84ekQ1?=
 =?utf-8?B?NWk3T0pLblFUc1l4Rmc4ZnNnSXpyR1V4UjN0U3BwZWtSaldFRXNBK1N1bHM4?=
 =?utf-8?B?WGxsK1lhWEUyKzhYNUVvMDdEZUpQeVlIcVdNMVdYQ0Joa0pQaDd4Q0xWTWVz?=
 =?utf-8?B?MDN0b3FHQ0NOQzdzb05TOUhiS3N3ajZQdVNrZ1hORS9ybytpRHh5NVRERi92?=
 =?utf-8?B?SktsT0l1QTExVEpVeFo4VUVrUXJPK0NBZ1JjdkxXZlZjRnFEb3kyUTNYU3ZC?=
 =?utf-8?B?V201cGluMVNCMUJ5bkQvRVd5MUg3ZklXVC9nZEV2YXh1S2VPSHVnckNYNzVs?=
 =?utf-8?B?SEhETUN1WG5mUlFKS0pDdVhEdU51bS9MR1lVZTVzT1NibktjbjcrSjhVY1Nt?=
 =?utf-8?B?dm1DY21QR0JhUU9rTUJ2N3JmOWNHQ1czYng3THJ0TXNmZmpVU0lyN3R1Qi9Y?=
 =?utf-8?B?b0FWU1VFTWcyeEVrWHRxb1JQcW40K1N0UERTL2lPbXFxOG00UEJnSVVQVWhD?=
 =?utf-8?B?UjF6eTlybDRGNVlwWXFmeDhwRE9OM0RYYnV4ZGwxTnhYWUtrb1JodTAwSW1u?=
 =?utf-8?B?T1dORC9mNzhKTFRuU2NJL2l4RGE1YXdRRm10SXBaUjRNQTZFZ0RiOGxjUHBW?=
 =?utf-8?B?YkNoUFo0b0hadmFncFg4dlpSb2lHdEthaXYwYXF6TzQ5MXl2TlpsNXR5aXRZ?=
 =?utf-8?B?M2o4QUhOWE1JODk1ZjJxMjU3c3NkQVlOK0xaSjNXSGJvUlQ2b1Njb2ppd2xv?=
 =?utf-8?B?OUx3UlFWSjhLRnk3NTlwTm01U0hlaEtYRnY2eHpPd0xPWkZpbCthOXdQRS9O?=
 =?utf-8?B?S1NNQzRZZWdtVkdDZUtrZnYwN0dLdi9HblhQN2NoMk9PcXhib2VKMmVkb2lt?=
 =?utf-8?B?SC92UFBreEpLU2Erc1RpL0ppejZkU1d1Ti8zekZrNUQ2U2dOSG0rV3J5U3du?=
 =?utf-8?B?UWdFUmFhS2hoVkpUbnNoYlprcFZuVnJ4TEUxdVZZNDFXVVNFZ0VOUTdCajVE?=
 =?utf-8?B?cFlHdDB5Rit0TzlxZkVYUEROTnJZSlYrVU51VjRPQjZ1SUVLU3ZlWGwyV3ls?=
 =?utf-8?B?SnBYWnFnMGU4dGlveUY3MFUxYlJtYWtnclVXMCt6SXVRK09zNjNCbnVacURM?=
 =?utf-8?B?VEVuVU1pSHdaNVgySDZjdXJJaUU5bGlaUHRPSVNkRkVZTEdyVWt4cFU1TUVX?=
 =?utf-8?B?OVlpckF3aE5xUmlkbDJteUh2d3piMDBJZEpEL0p1dDdSM2RiUWQyM1VGbGFQ?=
 =?utf-8?B?ZE5RbGFSSDAyTlBzN3JqOVJHZVJYYy8vcks4MDBtODZJeHozV0ZXVFVVeHlZ?=
 =?utf-8?B?TEVZTHZubnZMQ1U0aTFGRU5IeW9QVUVpOEphZ2NmcSs4aHBkYTM5cUloLzYy?=
 =?utf-8?Q?3bKXSBYvsBEF+GLM=3D?=
X-Exchange-RoutingPolicyChecked: LDJRFIQ2aKOgOD9VeDHOecikMNFYjrBhy+cRqmmyUvN+JuxcDK5NHpnZ/F9sznEm1gnSU3LcAG6ewfnei3MdSXtPM0PPuOZaV2GRWPyLV66Mx4J3CNYHFFK/jESrFInDRlxkFaS36yOsMkYLQ236AVwe81q3HvRcgabyEO3L1AcoMohEW7aNx1zZQ92H0ibK9hbBmPRIowBQ2cM342OO7bFOMUHcs7REW287Ie2TgOsFdvZUzCN8AC9fyQkv9On2fiVnH8X0g1rJ7WHzhEN56xPPdKBsTG9awfk+u+zHtj6nE1kzCY7KdH4jbqusMEwhxliKw2TeeGILVs0L+8brHA==
X-MS-Exchange-CrossTenant-Network-Message-Id: cbae2b87-49de-4924-7a82-08debb7ba513
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 23:08:05.9993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IiezLeX22gy9a1TlwEDh2C6wLfnoCxbMFc7QerEI1rgP/3sbHggh5Or3nj7O/4AJTDfJgZxXyBgmTixi+jc7mHahiCUEYG3v7jgLRtrpT9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SABPR11MB9962
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



On 5/26/2026 7:19 AM, Matthew Auld wrote:
> We need to re-map the submit mask so that we correctly account for the
> logical mask of paging engines, if the GUC_PAGING_CLASS is in play. We
> could also have multiple instances (possible on VF), so we need to
> handle that also.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.h        |  1 +
>   drivers/gpu/drm/xe/xe_guc_ads.c    | 21 +++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_submit.c |  3 ++-
>   3 files changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 61e3ee19a59b..dd98ceb81026 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -70,6 +70,7 @@ int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *payload, u32 len);
>   
>   u16 xe_hwe_to_guc_class(struct xe_hw_engine *hwe);
>   u16 xe_hwe_guc_logical_instance(struct xe_hw_engine *hwe);
> +u32 xe_hwe_guc_logical_to_submit_mask(struct xe_hw_engine *hwe, u32 logical_mask);

This seems to have ended up in the wrong file, because you're declaring 
this in xe_guc.h, implementing it in xe_guc_ads.c and using it only in 
xe_guc_submit.c.
Given that there is a single user, maybe just have it as a static in 
xe_guc_submit.c?

Apart from that the change looks ok to me.

Daniele

>   
>   static inline struct xe_gt *guc_to_gt(struct xe_guc *guc)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index b7d7eb4f3296..10ebcfb11c70 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -544,6 +544,27 @@ u16 xe_hwe_guc_logical_instance(struct xe_hw_engine *hwe)
>   	return hwe->logical_instance;
>   }
>   
> +u32 xe_hwe_guc_logical_to_submit_mask(struct xe_hw_engine *hwe, u32 logical_mask)
> +{
> +	struct xe_gt *gt = hwe->gt;
> +
> +	if (xe_gt_is_usm_hwe(gt, hwe)) {
> +		int shift = gt->usm.paging_hwe0->logical_instance;
> +		u32 paging_logical_mask = gt->usm.paging_logical_mask;
> +
> +		xe_gt_assert(gt, (logical_mask & paging_logical_mask) == logical_mask);
> +
> +		/*
> +		 * Remap to GUC_PAGING_CLASS logical instance mask, if
> +		 * applicable.
> +		 */
> +		if (xe_guc_has_paging_engine(&hwe->gt->uc.guc))
> +			return logical_mask >> shift;
> +	}
> +
> +	return logical_mask;
> +}
> +
>   /*
>    * Write the offsets corresponding to the golden LRCs. The actual data is
>    * populated later by guc_golden_lrc_populate()
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 1ee4f2434876..53df499df968 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -986,7 +986,8 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>   	memset(&info, 0, sizeof(info));
>   	info.context_idx = q->guc->id;
>   	info.engine_class = xe_hwe_to_guc_class(q->hwe);
> -	info.engine_submit_mask = q->logical_mask;
> +	info.engine_submit_mask =
> +		xe_hwe_guc_logical_to_submit_mask(q->hwe, q->logical_mask);
>   	info.hwlrca_lo = lower_32_bits(xe_lrc_descriptor(lrc));
>   	info.hwlrca_hi = upper_32_bits(xe_lrc_descriptor(lrc));
>   	info.flags = CONTEXT_REGISTRATION_FLAG_KMD |

