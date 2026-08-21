Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F0DC5DF7D
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 08:27:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DF610E273;
	Fri, 21 Aug 2026 08:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MkCUnsBg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DC410E273
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 08:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787300830; x=1818836830;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=++EL6LUBXdGsq58epKHy8NhOhMd9HZQZZYc0mxgIp4Q=;
 b=MkCUnsBgufhFp/TGtpTj58TayS7iamQBjl4JRKqeLzUBAGXkbOqwEQTl
 zBEZC4Ew9QBLIBL6e5Tujg5EPCzHOfDL5l1pMid9DNuHt/ZG7G+VTNgCl
 gNJPeqHVBc7tE7yEA+BYJJ7L1lSXlA242gjAoEkM/ACWYCPG51E4TWmm8
 /ESKCOwFK+biD2ADqYoUHJzFinusWNVFElWaHhQHY+V4mLgInaE0LWQAO
 F9eHrwdmVCNGls6dpbKrLQRmEyzxuYPdGeQ52GxdrYmJjTHlcRRTVFjQv
 qhP3IGg9/9mwJrwoUdRp/mmGGGgTQ+p+CGl2mksQby6P7Eja2QtiqolUF w==;
X-CSE-ConnectionGUID: Zo12A+gkSlS1CMGxYOi3sQ==
X-CSE-MsgGUID: lTPu02RxSd6UFYDAi5r5ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="99001757"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="99001757"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 01:27:09 -0700
X-CSE-ConnectionGUID: 8/zikEdLRVmKcafpKHL+3Q==
X-CSE-MsgGUID: dEaFwR/zSt+JlPI3X8J4tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="264992965"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 01:27:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 01:27:07 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 21 Aug 2026 01:27:07 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.35) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 01:27:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhh1oECvsHl56+3IgauPZDWq/CCHnFGN6i60uVaDnLrVgtovre68MvPf9i+J2eZ2zNrYlZzXc12w4ExDxiMJTY5xgGwGocbGg4KGerxwV1INiN+td0uUnHZTWBPUHfPBIyJ67M4y5oQfno/Cy2A7DyW4eDvenIwi+OWi86ijoha9op2UenqC4wPKY2TtA5mVpom1Jn49LDRsQuIJyZ0QMJ9gSVWw8d2UdZbfTrdb5QovP43UhtcL+viS3i8txGqwE5hyV9zREfRE4gmQ4uLnJq/iq3GBAdrCq2u/MYvWBvtNop2Ggdv3JEUIJ3H7wgvrANMNy0XZ/Yo5te8+++8zqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wzw7dML1Z04EhzqhGuK/YOt4Gg/UM0vorMoAr5XfS4=;
 b=j/+YYphkW070tRu03BjmWTrBAPlQH+WCUw4RKBPfTDXhxavg6RZZqbj5LAGtJo2wwfr+AMIssSMMH02gKvUKWI4zXAherr+xcWT3F0gNleYgBnbnF3vfDimoHG7nlKz48IO20UFD/ldnHLZpPNgVA+T7sRjTj57gH0C/Pkera7/ekB5ZLPjZmeqYcqjRqD4rm1J0m2ndKqdfUgxLG8DqGObss9XZMijVb7lUomEulHPBjlTlH3OdwryLKzxx03uRZY88Elhb7Owln7FhPENNadYr1hMr7UfFrvYLNVKSlLhy5Ef43Kib/ql9lZcp+BvwkfDc8kl67jeNBnKNJdqGVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 08:27:05 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 08:27:04 +0000
Message-ID: <363aea8d-10ee-4b44-abdc-be759aec822f@intel.com>
Date: Fri, 21 Aug 2026 10:26:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 08/10] drm/xe: Improve wedged state management
To: Raag Jadav <raag.jadav@intel.com>, Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>, <dev@lankhorst.se>,
 <jani.nikula@intel.com>, <zhanjun.dong@intel.com>, <lukas@wunner.de>,
 <daniele.ceraolospurio@intel.com>, <badal.nilawar@intel.com>
References: <20260701083051.450259-1-raag.jadav@intel.com>
 <20260701083051.450259-9-raag.jadav@intel.com>
 <alASTH5nHedKPPP8@gsse-cloud1.jf.intel.com>
 <alB8ubrXvqWSTOQL@black.igk.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <alB8ubrXvqWSTOQL@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0202CA0020.eurprd02.prod.outlook.com
 (2603:10a6:803:14::33) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|CY5PR11MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: ce09789b-f592-4682-4233-08deff5dfb17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|13003099007|6133799003|10067099003|56012099006|11063799006|5023799004|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 5PuU6M7XaZr25G9wJ/qfKfPo4RWhvsSDIayWdKb2HxhcRaewO64lZe4v2PU84HyFGucRzV6ofjasE/9tR8JA90DqnnseBfd3ZZBVsNfig0fQZPXa3N6hRF6Wgj0VLUBvaP3IoOPkc0gX0h9LOEyI2WcWaYHVg4n+YuNU6olvJtmryJL5dusdy6wDxMw7t6H8gjm8Db2fxCuFM3TqF7MS/Hwtn1rNL06j5UMVpOzp+W+XxDnabDoRet7GzyGr3DD0rQLz++oPZucWuPDRl0HM4R9RkxD8q3XDmalgNaCigLHZm5jSuBQudOsvy35t/UCKsBGn4Z0/sJSwZOdXp29oFVqrEPxVI2Ede3Ja1rtYeM6Dh6RhPwQb5pcsSgVGiBY9kXi9JfCyHwwGiEmDH/rXa4i95qcjxdwSaW8ZTU5/XBMixCCna+aiGxQMDr90w9+347bDRq6VCkmKsl3Z7YIpWRMn7EgwTZmGshLe7dJDVKsYvAjyPSY0TOnsIpiCowFEiU7rgB7HNW6+Q20jassz+BsvTG5tgKiQvrpIqkAO/nuc4FYQ+IaRmDrqyjOBkvAc5gf3S5qpFJfe6NGqwUtF48+GRxfQeZ93dUjV5G+2NEfSSLsWyG4X+7ncR70PMPOn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(13003099007)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REVMK2pEVU5aa3oyVkk5V1I2SkNYQjFOeDMzWW0zYzh3b0wxR1k1QkIvbWRq?=
 =?utf-8?B?MGNDT2JGRkV5SHp5c0VWUVAyT2JxejhNamxEbmJBQkVsbHNTYTRZNHJ5ZDFK?=
 =?utf-8?B?V2ZtWS9TRVJ1Q0cyMjVNUm5xbmFpdmx3UEh4SllEV3VFV214OFY1NFZpY29J?=
 =?utf-8?B?WHh3WTBnM2RzeEo0WmFUUmFzZGFsUHlRRUNFTXo5WVhwOUZLaGdvbjRHMS80?=
 =?utf-8?B?WGtKTGVVY1RnTGRDUE9SNTRHcEk1UFF0QjdQWXpET3IxR1ZkOW50OFhqSDF1?=
 =?utf-8?B?NitRRWM4V09JOFJKc2dmcHNXSGk0eTFIRHFwb3l4ZWtJU25ydmNyRWM1WWx0?=
 =?utf-8?B?M2xSU2VJRXNGK0ZDTy9MUS9ad0tkNFB4RmY0T2MrMStBL2IwREo5TWV2c0lN?=
 =?utf-8?B?eHdVVUZVY2NBN1dOVThmcGZsd0NwM0xLcWVCbzNUeGZaZnM4d0ZnQXQvZ29p?=
 =?utf-8?B?QnUxckpzS0huRzd1S2hSZkJzMnU4YldnSlJzWjV6NW1VYVVkb3NDQm9EVWFX?=
 =?utf-8?B?M0xkS2FGenBHYTRCQ3VIc25OYVA5Yy9ld2dSbExzeHRNWjc1eWJIYldIRW9v?=
 =?utf-8?B?aXFXRkhaZ1liZTJ2NU9GdjFITjhQMXhHeEJvZFIxVHl3ZFk5V1NMazBmWEV4?=
 =?utf-8?B?VGZJT0MwL3NxV0x3NkljZEVPTWRHYmlwNERsc3MyUG5FTmtoRVZ2TXFwVnhU?=
 =?utf-8?B?OUVBMkRlRmNjM2UrMFl3eHRJSzRaaU5ieDBtRENGUlN5ZGV2M3VkTDBuOE9L?=
 =?utf-8?B?bktxZWpCNzJRN282a1cvRGhRdTR1cXgvakl4ZFc3cm1zcTdGbHQvWWtxaUk5?=
 =?utf-8?B?SjRZYUtyZjJNNVNwM2xrTjBadmVrUUFZTGdkYzF6M2ZaMStpRXRlb1ZyUGFp?=
 =?utf-8?B?N09RaGFJR3pNdjFacHkwSk1abG51aThuUTZXVWVQVGRZM3JhSWpHUTErYng1?=
 =?utf-8?B?ZWZLL2RGMmpPcklGYjV4UE1qT2diUDRzZUo2V242OUlod1hBelRwSFpKWWd6?=
 =?utf-8?B?dzhBQ3RJU3NkOThWcDNJek1rMkd4TUtSVWVoY09BdzlKRWRSVEI4MllTbnMx?=
 =?utf-8?B?REl0T2Q0Q0JXUHZXdmhNT3Y3RDg3OXJLaG92NGRFZnpQdlhNbE1mQnVWcXNP?=
 =?utf-8?B?aUtrVVUvWUF5VmE1bUN5VC9SZUQ1aTA3elgxcnNsZVViNTd0aXpRd2tsTy9Z?=
 =?utf-8?B?QVFXcUlKalFmNHFya21LcDlMbFMvSVFNT3lSaWdrelo0SVgremJMeVN5NDBO?=
 =?utf-8?B?c29DcUdWVG94dkR0UUY0eUw4K2JpK2pDK2VWVDZBUDZ6bDYvSE9ieDVmV0Ry?=
 =?utf-8?B?bzJydk5Eak90MDBNdlVpVW16dk4zeW1LTUtMLzZiQnJybTlBaWVwNjYwVkJ0?=
 =?utf-8?B?QmFHZ2h4cTV5alZwUWlLUVI3QThOaFBOL0ROZTgybFVFWWt2WHRyNFZDRmJr?=
 =?utf-8?B?dlVLRlJQSlJkcCt6dnMrMjdJQzYyRHFOZHh5d3k1RVdDRmpyQzdKdG1YdWV2?=
 =?utf-8?B?QWtuS0laNDByeUwreWFmUkxWclFPckM2NUM2ZGZGeTRFTjNURUlVNDFIYzJE?=
 =?utf-8?B?dVRBYlhUWnZHMHVnbGJuN3ZJZU92eGt4ZXBrZGRhMFo1QXR3UUJrQnpqd0lk?=
 =?utf-8?B?RE5jV3ZqUU1ZbE5ocDVoaktpS2hqTTk5WVNUdWFLOUFuZEsrL0RsOVc2Vmlw?=
 =?utf-8?B?UUo3RFBMOFl3Znd6UjdrVVhUeGR0U1hNRTI1a0tEbU5zNHpRT0lpQVZJUHQ1?=
 =?utf-8?B?YVNGeTJLM2pLYTY4RG0wQWwyM1JaRXU4aGwrSFlEWFJGMkpzVlhyVXNtUkhO?=
 =?utf-8?B?Z2NkMURnZXp2T2o5VCtsbm1CWHZxK2hnbnk2My9KWFpPOVprMk93ZVZPaFRS?=
 =?utf-8?B?T2VtczB6WllRa2EwT1BrVFZiMERwUUFvWlg2UWlrMkZyNmRlbWx3b1NyWGww?=
 =?utf-8?B?QmNsU1o4UEFxZGtlNDRicnBrWjRUc1RXVDJKVUpYT2w0eTRTSW9TbDB1NTRO?=
 =?utf-8?B?aDlFekVKdnpmdHNPbWUrNU5HN2dFMVFDMmw0eW14RUtvVDhKQzBSVk45NVMr?=
 =?utf-8?B?UUUwK1RnOHJoSWtJNTJGcGpNWk9jQllIUWhxTGlRSktFc1RQMi8yaE1qeDJD?=
 =?utf-8?B?eE56TlExWE8yWXNMRTlDSnpkc3pnSDNWdVoxdVhlVWxTQ2VIbzFiNE9FSlIv?=
 =?utf-8?B?S2d6VUg0ditxVFlkbzV2em1WdXB3NnVaMHVHOWFIUllYYzdGYnVtV1pwV0VE?=
 =?utf-8?B?NkVDTUlYV3YwTFNuQjJJeVZVZUl6MU1YZUVUeER5bGtLOXE1U3J4VXE2SHJx?=
 =?utf-8?B?S3EvMmpxUHdKUUFHRkRzZVJZNnhXdUFabE93dGZtcnlFZGdKQ1hkdz09?=
X-Exchange-RoutingPolicyChecked: ePriAJ5RkSxk6eyR+Bbq1jj8Wfs6WoS61F64dwUKaxLWQ4ZRz4VTCiHSUBETKeHiMWTDIQbGc0TO8IQXzRwkMq6s6Iq3C07OjOXyLHbM20bdpSzxaRL4KpyLVcFMcFfMYTq27N5YDR9knbZKZVilThVz5tznIwSbhbN9Lceb9M82hoghPMMNEUBuHGdoZvomyqM7RM9e/NTMFCRCx48dSBFJ1yPuoNIQDmkO8PZ4W1ho2lAdfkNddjJ5swS7+F/SLbuphyfmLzqat4nb98LQthKYFtwiGi5fHKegasPZ9GcnCgpDG0jinzWrmHDggDuYB04d8La80xu78URa1iH5BA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ce09789b-f592-4682-4233-08deff5dfb17
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 08:27:04.4613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CGAXOaUq3fnJ8gieD1sKjIH3XQD9HI/LbIL/IRXKMHG/SRn4OhF0lD5gCY5GbI7zRvS7n8Uhy47vs9kz9y76RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6344
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



The current title seems to be too general. Please consider something 
like "drm/xe: Introduce temporary wedged state".


On 7/10/2026 07:01, Raag Jadav wrote:
> On Thu, Jul 09, 2026 at 02:27:40PM -0700, Matthew Brost wrote:
>> On Wed, Jul 01, 2026 at 01:59:32PM +0530, Raag Jadav wrote:
>>> Currently, wedged state is serving a single usecase where the device is
>>> permanently declared wedged, but this doesn't allow any wedged state
>>> management for runtime usecases. In preparation of usecases which require
>>> to facilitate temporary device wedging, convert wedged.flag to wedged.ref
>>> which serves as a driver internal refcount for wedged state and blocks
>>> critical path execution during device lifetime. While at it, introduce
>>> wedged.perm which signifies permanent device wedging and operates
>>> independent of the refcount allowing relevant cleanup action on unwind
>>> path.
>>>
>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>> ---
>>> v9: Redesign to prevent races
>>> ---
>>>   drivers/gpu/drm/xe/xe_device.c       | 102 ++++++++++++++++++++-------
>>>   drivers/gpu/drm/xe/xe_device.h       |   8 +--
>>>   drivers/gpu/drm/xe/xe_device_types.h |   8 ++-
>>>   3 files changed, 84 insertions(+), 34 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>> index c5e3e2d1f7c3..e8b6afb29ab6 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -598,6 +598,10 @@ int xe_device_init_early(struct xe_device *xe)
>>>   	if (err)
>>>   		return err;
>>>   
>>> +	err = drmm_mutex_init(&xe->drm, &xe->wedged.lock);
>>> +	if (err)
>>> +		return err;
>>> +
>>>   	err = xe_pm_init_early(xe);
>>>   	if (err)
>>>   		return err;
>>> @@ -920,8 +924,10 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>>>   {
>>>   	struct xe_device *xe = arg;
>>>   
>>> -	if (atomic_read(&xe->wedged.flag))
>>> -		xe_pm_runtime_put(xe);
>>> +	if (xe->wedged.perm)
>>> +		xe_device_wedged_put(xe);
>>> +
>>> +	xe_assert(xe, !xe_device_wedged(xe));
>>>   }
>>>   
>>>   int xe_device_probe(struct xe_device *xe)
>>> @@ -1387,6 +1393,44 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
>>>    *   firmware and restore device to normal operation.
>>>    */
>>>   
>>> +/**
>>> + * xe_device_wedged_get() - Acquire wedged reference
>>> + * @xe: xe device instance
>>> + *
>>> + * Get runtime PM reference and block critical path execution.
>>> + */
>>> +void xe_device_wedged_get(struct xe_device *xe)
>>> +{
>>> +	int ref;
>>> +
>>> +	/* We should not be runtime suspending as long as critical paths are blocked */
>>> +	xe_pm_runtime_get_noresume(xe);
>>> +
>>> +	ref = atomic_inc_return(&xe->wedged.ref);
>>> +	xe_assert(xe, ref > 0);
>>> +}
>>> +
>>> +/**
>>> + * xe_device_wedged_put() - Relinquish wedged reference
>>> + * @xe: xe device instance
>>> + *
>>> + * Restore critical path execution and put runtime PM reference.
>>> + */
>>> +void xe_device_wedged_put(struct xe_device *xe)
>>> +{
>>> +	int ref;
>>> +
>>> +	ref = atomic_dec_return(&xe->wedged.ref);
>>> +	xe_assert(xe, ref >= 0);
>>> +
>>> +	xe_pm_runtime_put(xe);
>>> +}
>>> +

missing doc

>>> +bool xe_device_wedged(struct xe_device *xe)
>>> +{
>>> +	return atomic_read(&xe->wedged.ref);
>>> +}

__guc_ct_send_locked() and g2h_read() return -ENOTRECOVERABLE when 
xe_device_wedged() is true, but with the new refcount approach device 
may only be temporarily wedged.


>>> +
>>>   /**
>>>    * xe_device_set_wedged_method - Set wedged recovery method
>>>    * @xe: xe device instance
>>> @@ -1427,36 +1471,40 @@ void xe_device_declare_wedged(struct xe_device *xe)
>>>   		return;
>>>   	}
>>>   
>>> -	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>>> -		xe->needs_flr_on_fini = true;
>>> -		xe_pm_runtime_get_noresume(xe);
>>> -		drm_err(&xe->drm,
>>> -			"CRITICAL: Xe has declared device %s as wedged.\n"
>>> -			"IOCTLs and executions are blocked.\n"
>>> -			"For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
>>> -			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
>>> -			dev_name(xe->drm.dev));
>>> -	}
>>> +	mutex_lock(&xe->wedged.lock);
>> Sashiko pointed out what is likely a pre existing issue:
>>
>>
>> Can this mutex_lock() trigger a scheduling while atomic panic?
>> Looking at the call chain, xe_device_declare_wedged() can be invoked from
>> a hardirq context when a hardware error occurs:
>> xe_irq_handler()
>>    xe_mert_irq_handler()
>>      mert_handle_cat_error()
>>        xe_device_declare_wedged()
>> Since the interrupt handler runs in atomic context, acquiring a sleeping
>> lock here causes a crash.
>> Could this synchronization be handled without introducing a mutex in the
>> interrupt path?
> Yes, the event call performs memory allocation for environment buffer
> so mert was broken to begin with. But I'm not sure if that in scope of
> series? Perhaps fix it separately? Michal?
>
>> This is an issue and currently unsafe too as we take mutexes deeper in
>> xe_device_declare_wedged call stack too. Maybe declare wedged in an
>> async work item? We have other issues in xe_device_declare_wedged too
>> which stop / start scheduling which also isn't safe unless this is on
>> the GT ordered work queue too.
> Yes, I have planned this as part of my wedging improvement series once we
> land this. It'll be reusing some parts of patch 3 where we use GT ordered
> wq for it.


xe_device_declare_wedged() is already unsafe from atomic context. I 
agree that it can be fixed in the follow-up series.

Lukasz


> Raag
>
>>> +
>>> +	if (xe->wedged.perm)
>>> +		goto out;
>>> +
>>> +	xe_device_wedged_get(xe);
>>> +	xe->wedged.perm = true;
>>> +	xe->needs_flr_on_fini = true;
>>> +	drm_err(&xe->drm,
>>> +		"CRITICAL: Xe has declared device %s as wedged.\n"
>>> +		"IOCTLs and executions are blocked.\n"
>>> +		"For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
>>> +		"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
>>> +		dev_name(xe->drm.dev));
>>>   
>>>   	for_each_gt(gt, xe, id)
>>>   		xe_gt_declare_wedged(gt);
>>>   
>>> -	if (xe_device_wedged(xe)) {
>>> -		/*
>>> -		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
>>> -		 * hangs, so wedge the device with 'none' recovery method and have
>>> -		 * it available to the user for debugging.
>>> -		 */
>>> -		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
>>> -			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
>>> -		/* If no wedge recovery method is set, use default */
>>> -		else if (!xe->wedged.method)
>>> -			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
>>> -						    DRM_WEDGE_RECOVERY_BUS_RESET);
>>> +	/*
>>> +	 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
>>> +	 * hangs, so wedge the device with 'none' recovery method and have
>>> +	 * it available to the user for debugging.
>>> +	 */
>>> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
>>> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
>>> +	/* If no wedge recovery method is set, use default */
>>> +	else if (!xe->wedged.method)
>>> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
>>> +					    DRM_WEDGE_RECOVERY_BUS_RESET);
>>>   
>>> -		/* Notify userspace of wedged device */
>>> -		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
>>> -	}
>>> +	/* Notify userspace of wedged device */
>>> +	drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
>>> +out:
>>> +	mutex_unlock(&xe->wedged.lock);
>>>   }
>>>   
>>>   /**
>>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>>> index 11b67820eb67..89bf909c96e0 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>> @@ -194,11 +194,9 @@ bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
>>>   void xe_device_td_flush(struct xe_device *xe);
>>>   void xe_device_l2_flush(struct xe_device *xe);
>>>   
>>> -static inline bool xe_device_wedged(struct xe_device *xe)
>>> -{
>>> -	return atomic_read(&xe->wedged.flag);
>>> -}
>>> -
>>> +void xe_device_wedged_get(struct xe_device *xe);
>>> +void xe_device_wedged_put(struct xe_device *xe);
>>> +bool xe_device_wedged(struct xe_device *xe);
>>>   void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
>>>   void xe_device_declare_wedged(struct xe_device *xe);
>>>   int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>> index 46a9e9fad7a9..80fa60821a47 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -485,14 +485,18 @@ struct xe_device {
>>>   
>>>   	/** @wedged: Struct to control Wedged States and mode */
>>>   	struct {
>>> -		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
>>> -		atomic_t flag;
>>> +		/** @wedged.ref: Refcount for wedged device, blocks critical path execution */
>>> +		atomic_t ref;
>>>   		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
>>>   		enum xe_wedged_mode mode;
>>>   		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
>>>   		unsigned long method;
>>>   		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
>>>   		bool inconsistent_reset;
>>> +		/** @wedged.perm: Permanently wedged, needs cleanup on fini */
>>> +		bool perm;
>>> +		/** @wedged.lock: Lock protecting wedged state */
>>> +		struct mutex lock;
>>>   	} wedged;
>>>   
>>>   	/** @bo_device: Struct to control async free of BOs */
>>> -- 
>>> 2.43.0
>>>
