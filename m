Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC972C5B572
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 12:56:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A666010EF12;
	Wed, 12 Aug 2026 12:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aBGgBH+b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD9F110EF12;
 Wed, 12 Aug 2026 12:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786539409; x=1818075409;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5/zcSKKB8U386VJBVqZhBk25/itK483wJvtJwHYokAs=;
 b=aBGgBH+bu3fN8Gc26WmugVV3eb4B76g3Nqgxysv4tRs9G67iXbYRBODG
 Gqo7Kb/ycTg2K+i4qy2h+zs/678NCF2ZEPuAvZ8H12x5kKv44ePRi3Q9e
 2StqpUgGS/pQ1FFjcZAdP6wv2C3PIiQ958mb0Ehm1Nw4I+RVb3G9yGFo1
 mwKSUj25hM3drwRy4qA3kvDrCoJdnCPB7J9zobTfrN+GLJKMKqz/mHOni
 TJ+P52y60ZlfZas2GqgbIAlH9toQIywXd5C8OoP5fHzJ5ISzurBwSDHcf
 5/jtpQgub9ENQ95fRVyhJdZrAw6UYbTzqhRADLl7DPFZ8pLeX+6fZ7Qhx Q==;
X-CSE-ConnectionGUID: nBt+BECOSRmtx06ySMBs6w==
X-CSE-MsgGUID: l67Ibs0wQvqAbnVHhyj3fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87167695"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="87167695"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:56:48 -0700
X-CSE-ConnectionGUID: LWeWYyp3RTuGkfsZHsVVWA==
X-CSE-MsgGUID: aMMBeFfxRY+Nj+emr8XM9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="260328825"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:56:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 05:56:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 05:56:47 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 05:56:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SA54wkoqCQwRA9D1UH+3+0qm0mfHMXvY/Y/EuHz/RuLbpDOSpoj0YiJqVrx4mAI2NrYJdrcJuSvZzeeSDYwelVu1V+9Z9VuSXIsQ0042L548MuuiyMSBsMu++KMyrxJsKr5RTs/yiNEDOMAmmR3qfv8gfmL7+T9TUCIeVg1QAoi20x5J970AwHb6xDnilaWF3vVZF3Rrf72mU09tjOZHTZhr3gr9uMyxQ7v5IoouAxdt6nH7pe0fKkfltvzf/GmQ0e/AiUb32dzLJXR3alCensZ4jUM4FAUd7XJk6B5ZyhYs/g5HpF/yzb+suOOdo6qQ0dLqOgJUR12wiUKluO/DsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/kpOHyvUXwC7gMriBL+BJxMxIp3GZwTELYCW0Yw1ng0=;
 b=AUH7yTTXj6talgBnUvrn9U23Pg7otgO4m814mPcKZWYzx/8Nh2cxvLxRCtGMCaNWwZy/Q1/hMQb//52AtIgJz3NpQYiU2y11YxZf+yU4G8gccGerQxz/KdGnnCcvAiTWMEjJsMdlbxlVaj9JVfuc0vjug7nVeKAqwmXdtUGnDNZj1wkISmA3P94HGn4/iuXoFYgFy2/7WyGMx3qv4eM8Eq9/oSGccAxFe3CtOf1cz2oS8c/JCB5cKPvylOUN8BGl3JNIRVYfhaYHY9nYCiwuq3V0Z3MSdfSjbCt//O3lQ49c3lUTqcAsFXlkqeaAeFh4YoeF1uxi+HfhIYBZnzt+FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SA0PR11MB4573.namprd11.prod.outlook.com (2603:10b6:806:98::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 12:56:43 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0315.011; Wed, 12 Aug 2026
 12:56:43 +0000
Message-ID: <40b913a3-07be-4c2c-b337-bfbb838888b1@intel.com>
Date: Wed, 12 Aug 2026 18:26:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 2/2] drm/i915/audio: Prune ELD SADs based on HDMI audio
 bandwidth
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
CC: Kai Vehmanen <kai.vehmanen@linux.intel.com>, Ankit Nautiyal
 <ankit.k.nautiyal@intel.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Vinod Govindapillai
 <vinod.govindapillai@intel.com>, Mitul Golani
 <mitulkumar.ajitkumar.golani@intel.com>
References: <20260812065427.3154985-1-chaitanya.kumar.borah@intel.com>
 <20260812065427.3154985-3-chaitanya.kumar.borah@intel.com>
 <44efde31ad9f5dc4368bb84cc082f5d97dd8ec20@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <44efde31ad9f5dc4368bb84cc082f5d97dd8ec20@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0189.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::11) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SA0PR11MB4573:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fda8e98-dcae-42be-2a88-08def871289d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 5BgQe/hEAaDFRQ4unuvl8vlC+8btSo+SAsC5P0nRjzx9mDQrmYHlKLtJ2ThPjsqkbw/1Lu+HwI/Wp54iBSU4FhFQEUMVLPdOygvwNeuK+nWLt/EfDwoknY7JBP3y1YW1yacOfA82cU88nMVOkkvxModSKJ1OFwbmPQjH5/pSX6aFIztaWSM8zNwmCmSHhaPzgzElNTVeCBc8x4Oy0rNKgtlsTLnw48/5qTVNdmqAu0LQcXdlncSL4xyS60nX3KBvJSj0vvUlEX7fnaFwjSTKRqsLX1y7hDDuiC7CdZ29cP3m8r90SmsmUjBffasCinBRWbJabbAt/wJ+MCX6cu+Kw8vRSvEVmYD1a16UcC4Qa/w0PQ6KlxzULJQYG02IXq1fSyRwenczlCKUpWKs0FTUr19wWsdQ8flngjKBwf159lhvo6IQzoT3Ir3PUx767g7pfhC2b+fTQli8bawFICUk377RwjciRvDdsvbUJuPLAqsRQ+0pFgDmFlBbMGMdO56ZZUcyw8R7pUVo3o9nM4gC1wagaDEgSPQedZoO9rzabWaKmvf01rq1J35wNZJmqLCPg+dSOhjlAbGAE8hsrRAGQ6knO2Ocay9kR2xCeQ/RGJBaRlzaMTgY2Atb+/oQqXrNPaId1Idn5xhSJ1caRi8pEEMa44RHXw66Imp5TO95gd0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cENoVjFndmxWWitXVTN3NmtnSDBKaGFmNmNmaG9ON1h3dDJWYmlXMUY5alV1?=
 =?utf-8?B?MnVHOTd6bGxrdDE0YWJvQm84SG1qeExZWGtTS01tMUFHYjRKMTR6NFBYd012?=
 =?utf-8?B?SWhQZXl4c0Y1TkgxWExQUVZwQVhCL29OcG5qWGxtR2tKdmFOVzBYOFpJQ0NK?=
 =?utf-8?B?KzdFS0tTdHhWWVVDUVFTamkySndGd2ZWN0VPMCtkd0NuRXhaODErT25jcWcy?=
 =?utf-8?B?T3Y2TjFsMWtPR29MakV6SzJzVzV0TmFmRHBlYXRzWnM2ZWpwR0Fxb2RKaVlO?=
 =?utf-8?B?dTh5NGxEb25leXpkVURkUG1pNm8vM2czSVptRFVUMThFUVpyUDFwUkRWa0Ey?=
 =?utf-8?B?R2QxVVJBYWkxMWhUYVc0NGlLMkFUTkphVzJmcHd0eTZma3NHcU8wbXhBOVNL?=
 =?utf-8?B?YjNGcCtzS1lzcHF5QUJCWXgwR2JzYUdXNlF6MFZFNnJYNkI3WVA1bW40Ympz?=
 =?utf-8?B?cmJlZWIvZDFUTTRLbUo5V3ZVMVhXVlVzSGRsci9tZnZVS2dSN0RnL3VKbXda?=
 =?utf-8?B?aWlBSkc1blA3NVdsTHlVUzZGVzUvVFhPYVM5T3F1cXRaSU8vbFVxVXBOZ1Ja?=
 =?utf-8?B?aXg2YnNHcS96NUdBZ05Ld0NLZENYQ0UzWmI4UUF3WERWZDMyOElXNGptTzE3?=
 =?utf-8?B?OS9iNVhNZ0czenlnQ29lNHY1OFRSdWNUN3JXODhsZ0hHK29Cc1hlVTVqK09s?=
 =?utf-8?B?ejdKcG5iV3FTd0k3L0d1RGdQWGRsQXBsVyswQVNNcmI4RGhxbk8vTllHUmV0?=
 =?utf-8?B?YjF3RzA2Nkh5dDgyb2YzMXNMM0tITGNMdGhTaERKUTRYQXdRQjZYZ1dtYkRP?=
 =?utf-8?B?ZEFCRUFpKzc3NlpkU3NTNlVlN0tGODIrVm8reGtJeS9qY2w2WXR4RnBDSXdO?=
 =?utf-8?B?TmVMclFrNjViUVJlSEgxdG9mWEFSem82UlJpVFpNQ080V2xNM253alcrRGx0?=
 =?utf-8?B?S3BmMmZWdE9QQzZzR3AxRWttWW1PbUZMSFF0TG1XNy9YdVEydlQ1cjBvQXhx?=
 =?utf-8?B?VUtUeUgxc0lSWmR0TTFYMUlnc1Mrd0lWR0pWYmFlWS9hTTFhLzdQdDBYYUNh?=
 =?utf-8?B?RVd0MDVNY210cHhzR2x5VzNSRGg3Sm9CdXRUWVFrcmlrVW12UlE0K1dtbXhG?=
 =?utf-8?B?eWNIa0s2U0RpNnZqcjVOcHlpbURhU0tUeWJucmxDS2RCdE9ZcnVGV2Via20x?=
 =?utf-8?B?bWw4Nk1aeE15cFdBVGJPUk4zMExDUzN1dU83YTd5WHhHVEd4T21BUThkbVFa?=
 =?utf-8?B?ZmlEL0ZoeGtuaTRnbnRaT1Vraklldm4vNjFhN0F2cUpZYjcvTUpvdXdrYjM0?=
 =?utf-8?B?T05jTmJ6QkMzaUNCS2JLdEU0RzhGWFUrZW15dWtjZ2RENHdIQ3F2bFNacHFZ?=
 =?utf-8?B?UVdKOU12eStCTk05ZzgrNlZiU2NYZ2FsNE9qSUdKYVFVbU52VjBzdjRTeW9N?=
 =?utf-8?B?ak1ubVoxVjNMS0ZHTHFMd1RHc2xQZE1kOHRab2Fuc3BvUnFaZ2hUeFJ4SmtT?=
 =?utf-8?B?V2ZuS3d3a1I0enIxM3h0VCt1NDFpV0N4cFBqWncrVUs5b09ncUtkRE9NZjVK?=
 =?utf-8?B?V1ZkSHQrdEt2WUxVVmt6Y0lCZnFmSWhoMHY2VGx5K3FBMUpQV1Z3ZGJmWVF3?=
 =?utf-8?B?YnNPOFd6RDlRUldiMGtzR0hSSGFlRXlLV0w0YVZWb2VOK2lmT25nRVdYcXk4?=
 =?utf-8?B?OTJvSlNnVnF4VVNibjJ3aVp1K21FeU5vWE55Rmp0cXdNMkNxNVkyZlc1MVNr?=
 =?utf-8?B?NVhDTzBaazhtM2pVOWhxL1Joc2laam0zenhWbW5ON2gwR05PekNJV2JUeUxP?=
 =?utf-8?B?L0ZRZUgvKy9LVTQ1clRDVEhFb1VMalppdmNoRWNrMjUvbDRIdHpISmppanlC?=
 =?utf-8?B?ZkMwbkNEcGRoMGxWSXd1cUs0Zk5QQXh2Ykp1clRKT0J4S3RLTjJzckh0Smxw?=
 =?utf-8?B?aVMyNHZxODhGelNLWjh5YW0yeithWSt2SUREV0JicG1CTjhUL2dDUDJveGtP?=
 =?utf-8?B?NU5CTzExZEpoWmMrVzJ0VkM2UHFQMkF1c1ZzR3VhckloLzJaangvYXIwWmdJ?=
 =?utf-8?B?ZFNyRURra056WU0veFJibTY4SS9VanVua2V3WmppaTY5M1R0Z3FlUnNhVkVk?=
 =?utf-8?B?ZXJwRWVvNkZjNnVZWjhOZUtYdHpQbDRZQloxS3g5MTZZQll2SlZYcks3SGJm?=
 =?utf-8?B?UXI5VTVqQjh3RXhKcExpN0NGUzMzaE1LRVhDWlJrbjZiZ1dqQU9Ga3J3YzNM?=
 =?utf-8?B?b0w2d0lwY09mS1IrV3VDR3NRYTRaSU1EVEo1VXdaVkNwNjZ0L3lQbWtjR2g5?=
 =?utf-8?B?QlVaeVNiT0RaMzNQMmRVdUgrNi94T0pKSmZnMzJxQ0I4SS9rTmlvVzUvRlFR?=
 =?utf-8?Q?n+4UnKWtGlgqWY+8=3D?=
X-Exchange-RoutingPolicyChecked: ozrS91ROC+93qojhHhK8+P6DSx67Ma+h8uO18A4rt5foo8bSEWfyOBQIABZszEuzPoPGT4/03Epxcjw54ftwzT4Gp5D/WRXPuEmB/YoOKchHkKuhToWwfGSQrPwCnwAQioL8ICMO+A+FlOev7Tfvd7QCxKl81V096up1sII3NPmacawUk3E3ubH0zF/5w3gjJdiwRBMKN6oiWLzD8O8XCFBsD/KpnjLegyrbdwj9P39HJbSO7HGsP8VKYxw+QqYq+LVCrcbtttDKsfFIRFJtbiiYB3QX10+cVojS+kuhCE3bTaE0YlJ6CzMc2Zf9SMGBGUzoYocT0XTxVH+3YaTKLA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fda8e98-dcae-42be-2a88-08def871289d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 12:56:43.3288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVOSwTBdQISq4JSnjMY0vjDr1gGiFOKK88bP+rixGIFnrOoiZjD8sPAJGrLGt80zxAQy473yRFNcqmE+BjxZ/74Pe+U9udqyTgbnNN12d9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4573
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



On 8/12/2026 1:51 PM, Jani Nikula wrote:
> On Wed, 12 Aug 2026, Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com> wrote:
>> Add bandwidth check to determine whether a given audio sample rate and
>> channel count can be carried within the hblank period for HDMI TMDS mode.
>>
>> Use this check to prune unsupported sample rates from each SAD in the
>> ELD during intel_audio_compute_config(). SADs with no remaining
>> supported rates are removed entirely.
>>
>> Sample rates are pruned rather than channel counts, since compressed
>> formats (e.g. AC-3) are associated with specific channel counts.
>>
>> v2:
>>   - Use DIV64_U64_ROUND_UP() instead of DIV_ROUND_UP_ULL() to avoid
>>     do_div() truncating the 64-bit divisor to 32-bit, which caused
>>     audio_packets_line to be wildly inflated and all SADs to be pruned.
>>   - Guard intel_audio_hdmi_eld_compute_config() against HDMI FRL modes.
>>     (Remove it when BW calculations for FRL are added.)
>>
>> v3:
>>   - Rebase
>>
>> BSpec: 68944
>> Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>
>> Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
>> Assisted-by: GitHub-Copilot:claude-opus-4.6
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_audio.c | 149 +++++++++++++++++++++
>>   1 file changed, 149 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
>> index eae76e961105..d59acb390f8a 100644
>> --- a/drivers/gpu/drm/i915/display/intel_audio.c
>> +++ b/drivers/gpu/drm/i915/display/intel_audio.c
>> @@ -39,6 +39,7 @@
>>   #include "intel_display_types.h"
>>   #include "intel_display_wa.h"
>>   #include "intel_dp.h"
>> +#include "intel_hdmi.h"
>>   #include "intel_lpe_audio.h"
>>   
>>   /**
>> @@ -697,6 +698,151 @@ static void ibx_audio_codec_enable(struct intel_encoder *encoder,
>>   	mutex_unlock(&display->audio.mutex);
>>   }
>>   
>> +static bool hdmi_audio_rate_supported(const struct intel_crtc_state *crtc_state,
>> +				      int available_tmds,
>> +				      int audio_rate, int channels)
>> +{
>> +	const struct drm_display_mode *mode = &crtc_state->hw.adjusted_mode;
>> +	int pixel_clk_max_hz;
>> +	int audio_pkt_factor;
>> +	u64 audio_pkt_rate_x4_x1000;
>> +	int audio_packets_line;
>> +	int hblank_overhead;
>> +	int required_tmds;
>> +
>> +	/*
>> +	 * Part 2: Calculate TMDS clock cycles required for Audio Bandwidth
>> +	 *
>> +	 * Step 1: pixelclk_max = nominal_pixel_rate * (1 + 0.5%)
>> +	 * crtc_clock (kHz) * 1000 * 1.005 = crtc_clock * 1005 (Hz)
>> +	 */
>> +	pixel_clk_max_hz = mode->crtc_clock * 1005;
>> +
>> +	/*
>> +	 * Steps 3-4: Audio Packet Rate.
>> +	 *   R_AP = (audio_rate * AP + 2 * acrrate_max) * (1 + 1000 / 1e6)
>> +	 *        = (audio_rate * AP + 2*1500) * 1.001
>> +	 *
>> +	 * AP = 0.25 (2ch) or 1.0 (3-8ch); acrrate_max = 1500 Hz (max ACR
>> +	 * packet transmission rate per HDMI spec)
>> +	 *
>> +	 * Scale by 4*1000 to stay integer:
>> +	 *  x4: eliminates AP=0.25 -> audio_pkt_factor=1(2ch) or 4(3-8ch),
>> +	 *      scaled acrrate_max: 2 * 1500 * 4 = 12000
>> +	 *  x1000: eliminates 1.001 -> *1000*1.001 = *1001
>> +	 *
>> +	 * R_AP * 4 * 1000 = (audio_rate * audio_pkt_factor + 12000) * 1001
>> +	 */
>> +	audio_pkt_factor = (channels <= 2) ? 1 : 4;
>> +	audio_pkt_rate_x4_x1000 = (u64)(audio_rate * audio_pkt_factor + 12000) * 1001;
>> +
>> +	/*
>> +	 * Steps 2+5-6: Audio packets per line.
>> +	 *   AudioPackets_Line = CEIL[R_AP * htotal / f_pixelclk_max]
>> +	 *
>> +	 * With audio_pkt_rate_x4_x1000 = R_AP * 4 * 1000:
>> +	 *   = CEIL[audio_pkt_rate_x4_x1000 * htotal / (4 * 1000 * pixel_clk_max_hz)]
>> +	 */
>> +	audio_packets_line = DIV64_U64_ROUND_UP(audio_pkt_rate_x4_x1000 * mode->htotal,
>> +						(u64)4 * 1000 * pixel_clk_max_hz);
>> +
>> +	/*
>> +	 * Steps 7-9: Hblank overhead.
>> +	 * Standard:  2*dip_guardband + 2*control_period + video_guardband
>> +	 *          = 2*2 + 2*12 + 2 = 30
>> +	 * HDCP 1.x:  rekey_period + dip_guardband + control_period + video_guardband
>> +	 *          = 58 + 2 + 12 + 2 = 74
>> +	 *
>> +	 * Always use HDCP 1.x worst case (74) since HDCP can be toggled
>> +	 * via fastset without compute_config.
>> +	 */
>> +	hblank_overhead = 74;
>> +
>> +	/*
>> +	 * Step 10: Required TMDS cycles for Audio.
>> +	 *  32 TMDS clock cycles per audio packet.
>> +	 *   Hblank_audio_min = 32 * AudioPackets_Line + Hblank_overhead
>> +	 */
>> +	required_tmds = 32 * audio_packets_line + hblank_overhead;
>> +
>> +	/*
>> +	 * Part 3: audio supported if Hblank_audio_min <= TB_blank and
>> +	 * audio packets per line <= Maximum allowed packets per line (18)
>> +	 */
>> +
>> +	return required_tmds <= available_tmds && audio_packets_line <= 18;
>> +}
>> +
>> +static void intel_audio_hdmi_eld_compute_config(struct intel_crtc_state *crtc_state)
>> +{
>> +	static const int sad_freqs[] = {
>> +		32000, 44100, 48000, 88200, 96000, 176400, 192000
>> +	};
>> +	const struct drm_display_mode *mode = &crtc_state->hw.adjusted_mode;
>> +	int hblank = mode->htotal - mode->hdisplay;
>> +	int bpc = crtc_state->pipe_bpp / 3;
>> +	int ycbcr_420_divider = (crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR420) ? 2 : 1;
>> +	int available_tmds;
>> +	u8 *eld = crtc_state->eld;
>> +	int mnl = drm_eld_mnl(eld);
>> +	int sad_count = drm_eld_sad_count(eld);
>> +	int i = 0;
>> +
>> +	/* Only applies to HDMI TMDS, not FRL */
>> +	if (intel_hdmi_is_frl(crtc_state->port_clock))
>> +		return;
>> +	/*
>> +	 * Part 1: Calculate available TMDS clock cycles (TB_blank).
>> +	 *
>> +	 * TB_blank = CEILING[hblank * K_CD / K_420]
>> +	 *
>> +	 * K_CD = 1 for YCbCr4:2:2, bpc / 8 otherwise.
>> +	 * K_420 = 2 for YCbCr4:2:0, 1 otherwise.
>> +	 * Rearranged: CEILING[hblank * bpc / (8 * K_420)]
>> +	 *
>> +	 * TODO: As and when support for YCbCr4:2:2 is added, set bpc = 8
>> +	 * to achieve K_CD = 1
>> +	 */
>> +	available_tmds = DIV_ROUND_UP(hblank * bpc, 8 * ycbcr_420_divider);
>> +
>> +	while (i < sad_count) {
>> +		int sad_offset = DRM_ELD_CEA_SAD(mnl, i);
>> +		int channels = (eld[sad_offset] & 0x7) + 1;
>> +		u8 freq_mask = eld[sad_offset + 1];
>> +		u8 new_freq_mask = 0;
>> +		int bit;
>> +
>> +		for (bit = 0; bit < 7; bit++) {
>> +			if (!(freq_mask & BIT(bit)))
>> +				continue;
>> +			if (hdmi_audio_rate_supported(crtc_state, available_tmds,
>> +						      sad_freqs[bit], channels))
>> +				new_freq_mask |= BIT(bit);
>> +		}
>> +
>> +		eld[sad_offset + 1] = new_freq_mask;
>> +
>> +		if (!new_freq_mask) {
>> +			/* Remove this SAD by compacting the rest */
>> +			memmove(&eld[DRM_ELD_CEA_SAD(mnl, i)],
>> +				&eld[DRM_ELD_CEA_SAD(mnl, i + 1)],
>> +				(sad_count - i - 1) * 3);
> 
> What if there is no SAD i + 1?
> 

It should lead to memmove(x, y, 0) and therefore a no-op.

>> +			memset(&eld[DRM_ELD_CEA_SAD(mnl, sad_count - 1)], 0, 3);
>> +			sad_count--;
>> +			continue;
>> +		}
>> +		i++;
> 
> I believe it would all be more readable and robust if you used a for
> loop to go through all the sads, without modifing the end conditions
> while iterating, and used a separate destination index for when you have
> to move sads over. And only moved the sads one at a time as you iterate,
> not all the time.
> 
> Sometimes decrementing the sad_count and sometimes incrementing i makes
> this difficult to reason.
> 

Ack. I will try to simplify the loop in the next version.

==
Chaitanya

>> +	}
>> +
>> +	/* Update SAD count in ELD header */
>> +	eld[DRM_ELD_SAD_COUNT_CONN_TYPE] &= ~DRM_ELD_SAD_COUNT_MASK;
>> +	eld[DRM_ELD_SAD_COUNT_CONN_TYPE] |= sad_count << DRM_ELD_SAD_COUNT_SHIFT;
>> +
>> +	/* Recalculate baseline ELD length (in dwords) */
>> +	eld[DRM_ELD_BASELINE_ELD_LEN] =
>> +		DIV_ROUND_UP(drm_eld_calc_baseline_block_size(eld), 4);
>> +}
>> +
>>   static
>>   bool intel_audio_needs_cpu_transcoder_id(const struct intel_crtc_state *crtc_state)
>>   {
>> @@ -725,6 +871,9 @@ bool intel_audio_compute_config(struct intel_encoder *encoder,
>>   	BUILD_BUG_ON(sizeof(crtc_state->eld) != sizeof(connector->eld));
>>   	memcpy(crtc_state->eld, connector->eld, sizeof(crtc_state->eld));
>>   
>> +	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI))
>> +		intel_audio_hdmi_eld_compute_config(crtc_state);
>> +
>>   	crtc_state->eld[6] = drm_av_sync_delay(connector, adjusted_mode) / 2;
>>   	mutex_unlock(&connector->eld_mutex);
> 

