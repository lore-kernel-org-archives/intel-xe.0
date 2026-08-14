Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96ADC5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 10:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920A210E0F4;
	Fri, 14 Aug 2026 10:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A55K6Gmr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD7410E0F4
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 10:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786704737; x=1818240737;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OynCwfk89PyK0WbX4e0hozr/3+IDIOKuU0z7t0S72/0=;
 b=A55K6Gmr+THPokaBEnZIuI6wCVhRw+TpBtKF4mGB8lp5W+KGbLRffh7e
 iDBTafZCs3tRpb6haTyLE4DobNXRCutEzUyKhENsaRS+6SaH2t2v4CI7j
 tGvc70fFlCsOmNlGyUdTWojY9SGqbxn6pm/TGBu9NeBEFf4Tt2k+TZbhJ
 FO9VFDto37t/R6LjsBsmd5BFHZyTtLfGhL4ijlrhvAICCXxPpcw+aVp2J
 APimeCWwiC0dIIUjBCmAhQs3FQVwEKl0S5+te4VorsfDv/ZNnVKr6yE/B
 d+0BuGmani/3KMmoTYzkOOgAdiVNUNT3jkjmDe5onaVl5DCkilm2roJGE Q==;
X-CSE-ConnectionGUID: kANMQPqbQPOfknoNQjYmHw==
X-CSE-MsgGUID: IRW8bBSASGuyYnLxbLTU2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87413135"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="87413135"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 03:52:17 -0700
X-CSE-ConnectionGUID: loSZOUu9Rn+7tagiIy9zKg==
X-CSE-MsgGUID: Dk1oZeC1QtCTTdtke6fRtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="288988953"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 03:52:16 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 03:52:16 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 03:52:16 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.57) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 03:52:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARIGDINaDx0aV2GgR9hetiyM1TbuENmHJRbGD3WLbwc3egTTofOSmfIwYE4/DeZsV8xa0jDrXIePxZtaBL7iRLhovYbehJXRr3YLel3dd6JduH5M35HD21JESUZeYB3JoVvO2GCWSw+O47sevPSB5PmfHIRs7YbgOSlNlXm8BEeNSwxuFq4xs8v8qnGQsDtNLKwsH46LjH6XgO3UmN2C8oahw1BcIjLXA6mL5SzSLQ/5SGMGcSCp4m6CLPY8AKfnj0VjIamok81PAX2H1gXSNAYpSyMxvk7DokHdUw3ZqoUgYLy98cJX9DHmYCpQmrFvdBrl1R94S4rcHbwlDFw5qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=saEV/XLqokcNzygvZ72bXJnomfORc/xygSDKRypxWIc=;
 b=IAYG+DiP5zOZ9VfKxUB/gdigMI/r2dQiIK8PB6IyLqjyGesMivvEY3InPtNGRSNnxCGr3wc70RAgQYQKdx9GdTOITnXjjmXNkZfSKaNiJffWuL1nS3P8WsRJUvDMOYLtGxHA32Ewpn+c52SNYQOGntXNej2f+MTDhN+rT/CV27kzkuGQ7gbQxdBYeQfWn3m6DxlHCNibPqdwgTmtSMTSQzSY06m1czHvPSqcX4NbjT/o9ejB0H87ZoE2/MbYgv1yDlGDDUmCDES2KT/T3E/+9xIctmfMoT7yeRimdsD+Gd+pDrQ0ugDjsgZ4qRMCR75rmWMTbbiDwYWwIAcMphVQ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ2PR11MB7454.namprd11.prod.outlook.com (2603:10b6:a03:4cc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 10:52:08 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 10:52:08 +0000
Message-ID: <5a05f13f-f3df-4391-8303-6b4d07fb2c8a@intel.com>
Date: Fri, 14 Aug 2026 16:21:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/32] drm/xe/survivability: Report 'Boot Mode enabled'
 status using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, "Mallesh, Koujalagi"
 <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>, "Aravind
 Iddamsetty" <aravind.iddamsetty@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-23-michal.wajdeczko@intel.com>
 <f4c58382-6edf-4d8d-bba8-e7fc0c18b4de@intel.com>
 <8eac682d-bb57-46b6-8974-e7593ba9a620@intel.com>
 <5e6afb20-43d0-4ec5-81e4-c4568e1145d6@intel.com>
 <a0fe9b9e-95bd-438a-b96f-e9ad1005a8f4@intel.com>
 <fa82aca7-1cc8-460e-b7b0-3d11c1729f7d@intel.com>
 <9b18aaad-9844-4e54-804e-b8fe20c8eb43@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <9b18aaad-9844-4e54-804e-b8fe20c8eb43@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0360.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ2PR11MB7454:EE_
X-MS-Office365-Filtering-Correlation-Id: 7691a0a3-5f27-49f7-5758-08def9f215e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|6133799003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: S6XmIdw548YFIGyTlyyuKjTUnjY9HjpdyuvVFnEt44cAT0RpkNF0X4wyEntHNslgHN0fGtWaFSeSdKaEDSmpk7+ySDoAoD4QAiLPbfbZW2lbAIhzXJ5GnriWQ3xl6RwgkraKTgj6BTMlk8Vrsr1jLgJGWFhdcYBqOFEJwcL9w3LcIBDzmvYImFawxstAnOdycH/x8icnXeBLDFaGmdej5RPB2vycmO/XyT7CdwDi1sa6mibpeq6EqWdOhHAGaxPi3ssuTugA8G3DM/9AmnpJXW02hB1U8E6rZIOkfp1sngGlQOqPNndgnL8THEGRhy/Olq/W0C5/hRcTCpFlph82Pgu4jc4zYN1Np5g637fop7fxV4UMel816Pj7g9FkZiX+P8HjtJCQkF8OPbiu1YwXxmqRakPPfHwjYcSwhRhy8CwWlZ8f0rvdeLFfh6DYgZgxkE+XMbnq4zXziaN3m90Io7QxLDJIzzPkEjX4R+Mn8OYBIcQq/j7KaLzR2OpbAXiBGnxj3JIggD+raEdqiG7d5+kXaWyW8J53HpM9vuEcrooPLRlCOmlY6WbTL41BsvrR32G52zd6z0krx7IuFfDXQkbGXHD355W0+rYpV5YD0vlhgJSF/XPdjz2C8Gthj20S
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(6133799003)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUNKMmJaOU81cnZ3cml3aEl3SG9WRFlReC91VGFvcUhyMlF5dXc3RnZFM1Rr?=
 =?utf-8?B?SE1KeWhOblU1Z1pEOTI3Q25KOENKU0ZRRWRQNWw2UlN2Sk1xUk41QklST2NN?=
 =?utf-8?B?QzRpVVVEZjhHanVvR0kvaDFueXdQZEpYcXdCMXBQQjJ3aER3MmZUY3dQN2xt?=
 =?utf-8?B?WmY0RW1BU0dQK1hpYzJRNWNtQ1c2WUs1ekxEdlY2bk1pbExZRTZmNEs4TU83?=
 =?utf-8?B?ellQTmNoai9aOHp6UzBmTU1WdVJNNnhUV1pMa0hySkI3a25hWlNDa2pWK2dz?=
 =?utf-8?B?cGFFd2oyUXJBYy93VXJwMUREUVR6Qktzdk84UkhsUy9GUmhtQ3BxWGx2d3M2?=
 =?utf-8?B?MGF6dmYrRE5OUW5xc2tZdmxPYXpIVnVIOEJ2K0xKbTBCOGpkSWNYN3ZoQUlW?=
 =?utf-8?B?Yzh6aFdUUGNjUjJGdjdqQmF4SWZTYWVDQlp1eGt5cnloVWtjKzlRK1N1MENX?=
 =?utf-8?B?TmdRTVpsVlRJYWF2VVpnc2ZuZWkzdFFDLzltaG90Z1RhUlZuZkNXcEFnbHVI?=
 =?utf-8?B?REczT0VudUYvRTNOVWRLOTNFd3VnU09pR0pSMjlSOEdFWnRVb0VmYVJlZ0lO?=
 =?utf-8?B?SVNaeDVZajN1SCthT0txWm5JbzJTcGRRVThhUVFrSFVpRE1NcGxjUm1tOXkw?=
 =?utf-8?B?aERsVDFkRG5aWFBmSC9Ha3FUTDZ1L3JTTGJSSHdVV094LzlzLzc0ZU1zK1pr?=
 =?utf-8?B?V0M2b3ZLS3dJdW9xcVhWSHE2dEJyZ3VEV2V3ZDFqODJuTUVsaTk2WFRvM1g4?=
 =?utf-8?B?MFN6Mk5od2xXMGVBdlI2cERNMkh3akx3OHkwOXlBRDdwdExmTlZzbzJqQUNL?=
 =?utf-8?B?dElTek50SEI1dytkOFdrbyt5MmJ3VmllV3BVQkR3YURjS2N2QWVuencrVENw?=
 =?utf-8?B?TlFEK2cyenFWMW84cGtLOWcyTFdXcGFVd3BFRDhWUXZJME1kUWI1ME9RNkxQ?=
 =?utf-8?B?NVBPNnBQUHRjeDljTnZkMGV2RFB3YkdZdkZqelBxS3ZHa3JCbGxSdCtWL3FM?=
 =?utf-8?B?QTgzUlN3YjFIYXNyanBwTTlzcXZOTjMyWnpoR2YvMk0yZVdONTUzWVV0UnZk?=
 =?utf-8?B?VWx1TG9ZOXVCRll6eWM2a3hOM0xwbXR2MkRZOWpiNENkb0ovNFJLSmZnL0dz?=
 =?utf-8?B?TzFhbEo3ZVZnWmExRjF3UUpqTkV6QlZRUUVVcXN2OUdQclJadDNVRkJrSDVM?=
 =?utf-8?B?M1NWM3YyOURPNUhQNktwanQzVi84NW5MTU1VcU11YmZZaW0rcEpoMkxxa3Fl?=
 =?utf-8?B?aUpsWlZRZi9ObGE1eXNVeUlYZHBtWTBNQXI5N0ZPT1RrQVFhV2R4U0ovL3R6?=
 =?utf-8?B?NUpUUm9VL1BEQ0FuMHZXYXFnZ0hFT1NVQ09Sd2ZWYVpqNTBRZ2Y0bjVtVnZK?=
 =?utf-8?B?SkRpN2F3KzVFTDlkRlE2K3BleEtEeFk0NmwySlJUWnptWGgyaElKZTBlWTQ2?=
 =?utf-8?B?VnRhV1l6dGdIMEJEME91VTA3dm5YZXpKN3ZreGtpY3M0YUN0RXVGRzhkQlVK?=
 =?utf-8?B?QmJaaEUvSCtkVFREaEVzNFpOTnd5S3A5eE1zVytuQ2tjS2VOM3RVNlduanVZ?=
 =?utf-8?B?WTBieCtDajIxNkxDTnRtOTBqRFNDalRxL1JXT01haDlYQU1TbHlCZ2FhUFk3?=
 =?utf-8?B?YUs3RHhLVFNPMFFFUTkrTm91OHBodnJzcmhZSTVHNG96b3JKS0dBVUFmTjZO?=
 =?utf-8?B?RzdJWENTZFcrS0Y2bjBqcFF0QUVGQkFpMWRxKzRIQjVZcGMzZE9jMHpETG92?=
 =?utf-8?B?TWh3QzhCeEpjNzRXYTFoME1HelI0bXI2K2lJbnpROFVPTGhHc2NNQnlqcTdK?=
 =?utf-8?B?YzZuUEdWM0tHNnFCdE4wM25QbGRtdXh2TWN4YUp0Sm0wY0ZoekVDV3ZGQmVG?=
 =?utf-8?B?U2lGVmZrNjNqNWZpWWk5Q3ljclYwcHZ0cGJhbU5SWXJ3Qm9xN3lsV2YrVis5?=
 =?utf-8?B?blYxRGt2N2pkcHNTY3lnb1EwWTZaMHB4aFNva3hlU2NTaDBFcHpiQ3Fjd1FH?=
 =?utf-8?B?elFqRUhGUjhTdEpvTENiT0lVOXFCSFNOZTZhN0VVN0JYb1dyZGhaYVlqQmtZ?=
 =?utf-8?B?NlgrejA4dHFVdkJ1Um5KL1pNbnFDRDVVQzFoOGpPM1hTL0lsVk5xRFpXUEoz?=
 =?utf-8?B?T1M2KzZmSzAzd0ZpcGJ3MjRCRVowNjIvN2FSN0lQbG1xNE12VGtuNTYrbDg2?=
 =?utf-8?B?dDMwOWVwenhMK2VIbGhieWtMSVNTcFpJZkJUTmdLTWM2NVhtb3ZGbWxtelFP?=
 =?utf-8?B?bldsQkpEaGlza1B5MkJXdUZiZEVJY1NCSXdYdHhaaDlZSFJ6YUpYV212SUw5?=
 =?utf-8?B?cmZjM0hoNHQxS0VWdHRlWlZoaStNcVNPdkNtWU5xSGd6aGtsNzVqZz09?=
X-Exchange-RoutingPolicyChecked: CXezVpf3ZQvUCeuNC6JtFOjqlgI3XmVC0LynB3ZEfbxK9c5FhRNE/4iEhAQjaE2BM6bNuHXMlyHEXkC/xb9JsepKp+hwnEWX5LhWYU/h7ZRS2QoV8tlhXE5iGi0YRH+XAnOaXd5NaCnqJaGRTr8Z+1c/adIVdYndu72zTqJr5f8WTOwkA4OunmcEF52AAEgVeQ5Mm+nRt5K98rNAeJXsYFTT17/FI6TeKKKtCXGbrfWuonyzHlGDEUWfsvImXlQhTrK7bUo7g/2uQgHfYB1T1xRnE1kq04F7jwUR9xlK9khye2ZjkBwXa32GO2WdP+O00TrOjBwAFpch53Tz8sdvwA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7691a0a3-5f27-49f7-5758-08def9f215e3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 10:52:08.1532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: miGDPOzslrDk+1Dd8HKSqrKbokM5bRnFDsNVRscR4wLPSojvdmmC03wBCSP573MLkWg31s0JIWTCiFwk34f2Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7454
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


On 14-08-2026 16:10, Michal Wajdeczko wrote:
>
> On 8/14/2026 12:20 PM, Tauro, Riana wrote:
>> On 14-08-2026 15:36, Michal Wajdeczko wrote:
>>> On 8/14/2026 8:31 AM, Tauro, Riana wrote:
>>>> On 13-08-2026 16:31, Michal Wajdeczko wrote:
>>>>> On 8/13/2026 12:52 PM, Mallesh, Koujalagi wrote:
>>>>>> On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
>>>>>>> Report 'Boot Mode' status or failure using various xe_log() helpers.
>>>>>>>
>>>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>>>>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>>>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/xe/xe_survivability_mode.c | 21 +++++++++++++--------
>>>>>>>      1 file changed, 13 insertions(+), 8 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>>>> index 2d8c532157fd..ebd288986c11 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>>>> @@ -304,14 +304,13 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>>>>>>>        static int enable_boot_survivability_mode(struct pci_dev *pdev)
>>>>>>>      {
>>>>>>> -    struct device *dev = &pdev->dev;
>>>>>>>          struct xe_device *xe = pdev_to_xe_device(pdev);
>>>>>>>          struct xe_survivability *survivability = &xe->survivability;
>>>>>>> -    int ret = 0;
>>>>>>> +    int ret;
>>>>>>>            ret = create_survivability_sysfs(pdev);
>>>>>>>          if (ret)
>>>>>>> -        return ret;
>>>>>>> +        goto failed;
>>>>>>>            /* Make sure xe_heci_gsc_init() and xe_i2c_probe() are aware of survivability */
>>>>>>>          survivability->mode = true;
>>>>>>> @@ -323,19 +322,25 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>>>>>>>          if (survivability->fdo_mode) {
>>>>>>>              ret = xe_nvm_init(xe);
>>>>>>>              if (ret)
>>>>>>> -            goto err;
>>>>>>> +            goto failed;
>>>>>>>          }
>>>>>>>            ret = xe_i2c_probe(xe);
>>>>>>>          if (ret)
>>>>>>> -        goto err;
>>>>>>> +        goto failed;
>>>>>>>      -    dev_err(dev, "In Survivability Mode\n");
>>>>>>> +    if (check_boot_failure(xe))
>>>>>>> +        xe_log_comp_fatal(pdev, SURVIVABILITY,
>>>>>>> +                  &survivability->boot_status,
>>>>>>> +                  sizeof(survivability->boot_status),
>>>>>>> +                  "Boot Mode enabled!\n");
>>>> Do we need this check? This function is only called if it is a boot failure.
>>> are you sure?
>>>
>>> in xe_device_probe_early() there is:
>>>
>>>      err = xe_pcode_probe_early(xe);
>>>      if (err || xe_survivability_mode_is_requested(xe)) {
>>>          err = xe_survivability_mode_boot_enable(xe);
>>>
>>> and xe_survivability_mode_is_requested() may return true based
>>> on the xe_configfs_get_survivability_mode() settings
>>
>> Configfs also is provided for users to enable boot survivability mode.
>> So one log should be sufficient.
> there will be still one log entry but it will be with different
> severity based on the configfs vs bootstatus origin

configfs should also result in fatal because it also enters 
survivability mode and it was user's decision.

>
>> If we do need to add a blob instead of error no we should go ahead with all
>> the scratch registers as they contain the error details instead of just boot status.
>> Can't we just add 0 for now and come up with something that we can decode in future.?
> including boot_status value here was requested by Mallesh in [1]

Don't agree with [1].

[2] prints only for critical errors. As responded on that patch, it was 
a intentional change
based on review feedback.

No error no should be good here or a hardware error (-EIO). Lets not use 
boot status

Thanks
Riana

>
> and logging all boot status registers is already done in [2] but
> only if boot mode was not triggered by configfs
>
> [1] https://patchwork.freedesktop.org/patch/743324/?series=171022&rev=3#comment_1372191
> [2] https://patchwork.freedesktop.org/patch/746002/?series=171022&rev=4
>
>
>>
>>>> We can have a error log with the type here. We don't need if else.
>>> based on [1] all survivability mode SIGID are FATAL
>>> and based on 21] it was an arch choice to go with info level for all
>>>
>>> but IMO if the boot mode was selected via configfs it doesn't
>>> make sense to call it FATAL, but if there was real problem detected
>>> we should make it FATAL (like we do with failed PROBE)
>>>
>>> [1] https://patchwork.freedesktop.org/patch/732271/?series=168333&rev=1
>>> [2] https://patchwork.freedesktop.org/patch/743324/?series=171022&rev=3#comment_1373731
>>>
>>>> How about something like this? and remove else
>>>>
>>>>
>>>> <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=<N> FATAL (01000000) SURVIVABILITY: mode=Boot
>> I am still trying to understand this series. Apologies if it is wrong, i tried to generate log using AI.
>>
>>>                                                         ^^^^^^^^
>>> boot_status is u8 so it will be at most (01)
>>>
>>> and I don't think we should be so cryptic in the user facing error messages
>>>
>>>>>> In case of fatal, will make sense to return "0" OR we can add return as -ENXIO right? any thoughts?
>>>> Mallesh, you cannot change return codes here. This defeats the purpose of survivability mode
>>>>
>>>>> you're a reviewer here ;)
>>>>>
>>>>> but seriously, enable_boot_survivability_mode() is called from
>>>>> xe_survivability_mode_boot_enable() which says:
>>>>>
>>>>>     * Return: 0 if boot survivability mode is enabled or not requested, negative error
>>>>>     * code otherwise.
>>>>>
>>>>> so returning 0 as success code in enabling boot mode is the correct one
>>>>> returning -ENXIO will be no different than failing to enter boot mode
>>>>>
>>>>> @Riana, this is your code, can you please confirm that
>>>>>
>>>>>> After handling fatal case
>>>>>>
>>>>>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>>>>
>>>>>>> +    else
>>>>>>> +        xe_log_info(pdev, SURVIVABILITY, "Boot Mode enabled!\n");
>>>>>>>            return 0;
>>>>>>>      -err:
>>>>>>> -    dev_err(dev, "Failed to enable Survivability Mode\n");
>>>>>>> +failed:
>>>>>>> +    xe_log_err_fatal(pdev, SURVIVABILITY, ret, "Failed to enable Boot Mode!\n");
>>>> Can we retain the previous dmesg?
>>> there will be already "SURVIVABILITY: " prefix included,
>>> so IMO instead of generic:
>>>
>>>     [drm] *ERROR* SIGID=103 (-EXXX) SURVIVABILITY: Failed to enable Survivability Mode
>>>
>>> it's better to have more clearer message:
>>>
>>>     [drm] *ERROR* SIGID=103 (-EXXX) SURVIVABILITY: Failed to enable Boot Mode!
>> Boot Mode and Runtime mode doesn't sound right.
> both "Boot Mode" and "Runtime mode" were existing names in the code ;)
>
>> But i don't have any better suggestions here due
>> to repetition.Since its message and can be changed . Will replace it if i can come up with something better in
>> the future.
> I take it as an ack-by then
>
>> Thanks
>> Riana
>>
>>
>>>> Thanks
>>>> Riana
>>>>
>>>>>>>          survivability->mode = false;
>>>>>>>          return ret;
>>>>>>>      }
