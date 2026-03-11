Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDEE1125839
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 14:56:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BA210E205;
	Wed, 11 Mar 2026 14:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hricGtH6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06FF10E205
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Mar 2026 14:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773240970; x=1804776970;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iJGX+sHt8T1mDsbhwOtSWuFeE5XaEYa9yz9e/eT1UbQ=;
 b=hricGtH6nPJfQRVV9alcYZReix/uVu5UPEPmVbVMjm/g2s70PGwfjB3h
 9y46837LHIE3qYYpXORNdecOiXNQxav3X7bhwEOkuD8BfCADtOQikjonE
 nT64+QKL20137cZjaUckjPy2pluCrB69ig/mDkQzr89q7LKUQhM9eEZqN
 27nNQ0289LePSYgu0UbGvyNuGhaIqvVBY5ozCQHvCw6xnSUYS38A9bayI
 543wVGHrMtb5DcbnxbiMAjmpItyBdQd+pqk0SiiU2FhpA/mLzXVlclL+x
 TFgvFWRBAi/rHGem67bIs5SFoNktW66Yvcl0ZIx1QmIwk9HU8aNW1luqL A==;
X-CSE-ConnectionGUID: h9Zpf6WkQyuUk/vjrHqcRQ==
X-CSE-MsgGUID: DK2ZJ9XdSyqd0Xl1kL9gZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85788832"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="85788832"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 07:56:06 -0700
X-CSE-ConnectionGUID: 8yegEgt1Rd+EXfF8cvJKww==
X-CSE-MsgGUID: MWstGjT7RJCUIej8mj3ZYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="217959218"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 07:56:06 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 07:56:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 07:56:05 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 07:56:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCkODSGmaD/cyFyP6PKGGiSE+CMTraSLf1sE2ZedhAfEGgFwgIwbTsBUnKjZgRvWZQg/GvSRghoAYguFFvd699TUrTMbGaSFWWCaIPzPJ41IWS0cz1VfF8Fzt8zzvHc0IKkTCFauthzP/lSCdHgQ0tj2PXapLSNKPPk+3zxRg7fRNLpmYPPxSdbCWoF3eYiib3tegDXBhxJijD3lvaXHr9Z+FViFAxRyqNz5XEbrV6XxJMsklsupx4gBw2v/YK8KFHN5Fnpls2w9dmuQwXC0qKUG557uFZhB8nEsYYthZwq+qnjFQCubQClUPKYL4CjieTlBwRXlnugdSgQIhukvLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXe5zj26eGN3QZLJ3IWm1BOJsMBpRnJdwrXH+oev3n4=;
 b=etWe4yadz41pZnMNGLg+EZvfrYgyZWuEewlOMab24XfEXLQnTcCouQ0g+0eywmuMwB8hns7M0tKnm2ycQODxcZfyW8pq3cbQ1bRNeRRN1TVO86gCmQtrRhM18toO0B60hQjik5AjzyhHA38G3SyJichFd3pxOhlEwpFziVlriZsFNNwTKLomcPGoWeOmW4e9x8BEw74X30AL1Z3n0v0E+HLXBaHYK1DJcpj8H3WKQTExLR4BzA+aqgO43LBBtPnquL1rOq6Hrf6c/AEsaJXuHEQgC61YnDZ3tsEzDmvsZqzsSmhC81nwdukA1efiJ/GJaT4zKu0s1kqHaTQmMBeR+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA0PR11MB7330.namprd11.prod.outlook.com (2603:10b6:208:436::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 14:56:00 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 14:55:59 +0000
Message-ID: <8cd2bf2f-f923-4791-8644-2500354937f5@intel.com>
Date: Wed, 11 Mar 2026 20:25:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] drm/xe/xe_ras: Handle Uncorrectable SoC Internal
 errors
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
 <20260302102155.4074630-23-riana.tauro@intel.com>
 <4d62f154-dd1f-4213-a5ff-87abf09c4ab9@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <4d62f154-dd1f-4213-a5ff-87abf09c4ab9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA0PR11MB7330:EE_
X-MS-Office365-Filtering-Correlation-Id: 740136de-8356-4c17-88de-08de7f7e4ea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 3LJqTiFAJoFqBI8GVZFELxl99ahKKzzduv8eNG2M+vL6Eeg8UPagdChpmG8xkEYtHStCvy8dBGr3mo1zuijuGRVP4IO9tZoYGLTDYWrLAneAnsIox5Njx4FYhFf7xNTr3fVcQEFt0G9f/QR6d7bk+Va0Dx1Y/5mcGG5Zawa4CxyjAdPnEphJOxz3MMXJ2FVPCXb8o//rVt9zmOg+T8beqDK8ovztT8FJc044u6tUFljKElcEuhtuW9m0QviNZ6QcqYYnm4cRMFE1D1mHyUu8i7E9h7qnYlEZepBSXEn4ySWcrGMmMaJe4h1SaMJLQgQIVJhBLXe1CYaarArfluPxP/cFovSagAF+PVX7Aqg904w2+opYdN/i8CMGIbCoNJCX5V7dzaxLAmsL/GG5bFxTN5fzvqdYDaisfwQPpByoUSnPXWmkNzZcFnQIRd1EbGytdufEU3YUBeWx7yapkJ/FqcUNPKxmpp3HLld4CNj1A7BPxyigbK/sgtPAvZSOHdZbblyQjufwhfmBBIYLFSrTWm2XKHC3L0Lt2YAfFLj0O2NNHff4UUqJPYyu2vlvksGVVGn8RNHuYKF9Ema3lX9TDV/Y0gBhqsHOWOGRT12FXSRq4AQLp3IkDvSK/eH/f8R1FWzO2JnF+XRlm5XcWmFVh5UwlPNVhizGvMEGrLSX7p/eGMjijQpYdv9lKM7jFyPYI6+yvdknPHrvh7kSkI1e2dLRpgDNcdBCr6TREZ0MYrQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2NPOW9DZk02T0Z2eldaR1ZBTUE1THVoS1RhVzFZVmx6SjZpNGpxQWQxcC90?=
 =?utf-8?B?NDhoeTIwaTgvT2ZGL3BFUFpNSVZzbTNCeGp1bG4zU2VHRTQ2blFqYVlsTzhx?=
 =?utf-8?B?dkllVEM5Ui9Ocjl1N0xRb21zQlpka1JwYW1yZ3NZK2pjb21aVks1RG93YndE?=
 =?utf-8?B?anVNSnh0bkRlWi9VTmpmN2VMaE9uRFYrYWJRYm5kUjhiT0dSM080ZzBRaEZW?=
 =?utf-8?B?WG5DRVJJbzMxS1hNbkhWUDllVkEwTWwwMlhBWm9DWTVxZUQ0TWptZzBPT0p5?=
 =?utf-8?B?RHk3WnZ0OEJrWlVza0lzclNSaW05bE11UDk4Nm1TNlAzeHQwNE5LMVAyS1dE?=
 =?utf-8?B?RVBRaU1vYWNpZXJlLzVCV0QyQjhvcEFkd3FFT0xQOFdodWhmejNJR0JhRktD?=
 =?utf-8?B?THJMSzQ1MTA0NDE5NGlacEw3TE5Fa2FpclBBUWczdVJFeVZ0Ykk3ZTBYck1D?=
 =?utf-8?B?UDl6akFSbjZPMC9vNXdmTTBtb01lRzBDWURKcURBd2szb041b1BWUVd0R25a?=
 =?utf-8?B?VWdBai9CdlU0R1RLdFlQWDdNaGZvYVZTcFppSFFESDRGQVBnd25WNEo2eU4x?=
 =?utf-8?B?T3FOUy9PRFBBOHpLanJyWmJxTXJIN0ZhOXhERWFKanMwNmZOY24xb2pJUVpK?=
 =?utf-8?B?bkoxWUhtMWJmdU83UC8vSjRmTzVTWVphSGMyL2MxODBmeHRGd3hDbnFTdmI0?=
 =?utf-8?B?TkRFYUd3ZWtxbUFoRHB1akZHcUUwK1JETmF4RWg0Z280dzRDWVMwSm5URGJy?=
 =?utf-8?B?Y0x6Q0gyK2ppQTQrZ2VxcGU3K1A2c0ZweEhyeHVIbUFSNHVVU2I5MUdRdXcz?=
 =?utf-8?B?c2o1d0lWaEExRk1YLzZjRHNaZmgyaldmQ2JUUDdxbVp1Vml3S01XQzJIOWtJ?=
 =?utf-8?B?NlFqZjc2QU90QWIrV2FrU2VGM0RIT3FQRSs4UWpsYUNLUGhiS25wMDdycnpp?=
 =?utf-8?B?M3Jrc0pYZ2M1TXk1emNtSFo1b211b2xQdWtBUnZGaWF4aEd6U1kveGlrVEh1?=
 =?utf-8?B?Uis0MUVoaDl1R2Y1VC9oM3pXUkRUalpDYUE3TzhoeWhwVHZkTFVFZTMrdWpx?=
 =?utf-8?B?aTJab0lOZFVmRGl2dlVVR3ZISExobEFRWkdvR2pDR2Y0eWJlZUQ5UG9XOGVj?=
 =?utf-8?B?TDFqb21vL2kxL1puUC9zVEkwZlRFcmhzMWs1VWc1OFQvRG9QSzJXeWh3Umli?=
 =?utf-8?B?dk1LR3M5SzRuL0FhdWJ6OFk3dk9MWW1YNVhKNHdheGlLeVl4MFBLQUp4MlVm?=
 =?utf-8?B?aTQxMVV2UFM4bzJMVTFsOHZFSS9UOHVPQUNsUVVuSFE4ekdNdjQ2UVhjd0gw?=
 =?utf-8?B?SWQ4NTkzQlZJV3V0WVZhcHIvUTRhYnZGMU5xbmkxdVFlQ0ZNVDIwWjVXWXQ0?=
 =?utf-8?B?aE5aUXZneDNpLzB6SG1tSWR4NC9SeXFuTU9zRHROV0ZTWER0M3JLeXh2WndC?=
 =?utf-8?B?MnRDNG9UMlRVQ2Nua3RyczY2ZjR0N0hJSFRLYWZpS3hKUTJ5OVZWeTMvdTg5?=
 =?utf-8?B?TWV1cEwyUHVwS0ltbk9EcUplR1NnYkRDNVJqNDZvZVdmMU5talk5NUM2VzlQ?=
 =?utf-8?B?VGhKL2pyemp6M3NKL3hnNTloMXhtZERSSE9ScHBZeTJjeW5YV1djcjhISGlW?=
 =?utf-8?B?RkY4YW5TcEFUQnpKczRSWW5BY1lISitwd1ZEajZzWjI1cTM3K29VWXNIOVpy?=
 =?utf-8?B?alBqRndMMm81YzhYaUFmUDVGdkFlUS9Na3M0Y2JDZUpvZk96ck9ZOU5PdUxs?=
 =?utf-8?B?ZjA2cTNNazhvVUNqNXpLa0pMZ3pETDBzWmRsMXQxTnQ2VTdJTjNiRjlTM0s0?=
 =?utf-8?B?MWV0anhvc1RkMkZISndQdUZOTUZCREEzVStNNWFKMWZORDR2OHVEblRQQWYx?=
 =?utf-8?B?SVAwR1NhZkxrWURBdFlnT0lNREhOdUFVYzBjMnVjNkY4bFVIL1pkWisxLzBO?=
 =?utf-8?B?ekVaWTJFVWRTMjFQaThnbkVXUlJxV1VkRG11WnUydGJSWVBEVHUzeU01RUJD?=
 =?utf-8?B?cFdIVGgzS0NNMW9oMnk5bCtrdW5WaVBtQjNKUS92b1kvSmk3emNrRTNOb3B1?=
 =?utf-8?B?SmExRWlqZzR4RHpCYVRJNkxENVk5OGNpTFNOSlowSzd2TDl1ajY1enZ3VG8y?=
 =?utf-8?B?Y3JKQS8rWjlLZ0grVXJLZ2hDUFNqZzZRUkMxWkFrd3E0WEdSVlQ2QTNzbmJY?=
 =?utf-8?B?UVF6bU1wang5VnA0Uy9pblRxQWhFeDF0aDdvemljRlM1T0RwcXJ1RDUwSlJ0?=
 =?utf-8?B?Q2RWOG9CSmFRTXp2WDlIc1dzU0pudkhkTTJoWnZQV0haYkg5ODJjM0hrTUdP?=
 =?utf-8?B?aytrWkdkaUVSS0xEUlpFOE1ENG54MnF3Mkhqc1hpNjA1aTYydVFuZz09?=
X-Exchange-RoutingPolicyChecked: BHDXYrFiIEvgHv3KDdCdIiKFq+PoWBip8aPXulSlSqolacM1DCqouNR3zZoTEwU4vAW1f2G7VtDYKFaeQHiz+MmFUu+4flDllqWpsKyC3XvNAIfyb8AO3webZm+Zpd7tXXqZlbTitKZqkALf3VUzssuUkRYmOsghe0tW4wyp62C6Qy/O9uxZgsJK33NhSPHluBC2aU2b8ZWa/gbYCkeoiEoHE5zk6XBMoiiCH1CMitZPy0/UZVEXte4JONAP22HpeI7776JMkyrdYnpFM7wgvyMxaRbToV0e0gOign+5xejNOnVZ+mlDPFonle03lV3NZPbugmWkZTQcKieivE5/cg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 740136de-8356-4c17-88de-08de7f7e4ea7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 14:55:59.8835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bo2Yp/XA5pHrfqz6L0kfVXzzTMLU1QUZ3815473wp0lBbmThLnevV6bwmoXgKxHsgIiPX2cPyKOTqw6C3bQoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7330
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



On 3/10/2026 6:59 PM, Mallesh, Koujalagi wrote:
> 
> On 02-03-2026 03:52 pm, Riana Tauro wrote:
>> Some critical errors such as CSC firmware and Punit are reported under
>> SoC Internal Errors.
>>
>> CSC errors are classified as hardware errors and firmware errors.
>> Hardware errors can be recovered using a SBR whereas firmware errors
>> are critical and require a firmware flash. On such errors, device will
>> be wedged and runtime survivability mode will be enabed to notify
>> userspace that a firmware flash is required.
>>
>> PUNIT uncorrectable errors can only be recovered through a cold reset.
>> TODO: Wedge device and notify userspace that a cold reset is required.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c | 52 +++++++++++++++++++++++++++++++++++++
>>   1 file changed, 52 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 61c01a4bfadb..f35d77654c8f 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -7,6 +7,7 @@
>>   #include "xe_printk.h"
>>   #include "xe_ras.h"
>>   #include "xe_ras_types.h"
>> +#include "xe_survivability_mode.h"
>>   #include "xe_sysctrl_mailbox.h"
>>   #include "xe_sysctrl_mailbox_types.h"
>> @@ -102,6 +103,54 @@ static enum xe_ras_recovery_action 
>> handle_compute_errors(struct xe_device *xe,
>>       return XE_RAS_RECOVERY_ACTION_RECOVERED;
>>   }
>> +static enum xe_ras_recovery_action handle_soc_internal_errors(struct 
>> xe_device *xe,
>> +                                  struct xe_ras_error_array *arr)
>> +{
>> +    struct xe_ras_soc_error *error_info = (struct xe_ras_soc_error 
>> *)arr->error_details;
>> +    struct xe_ras_soc_error_source source = error_info->error_source;
>> +    struct xe_ras_error_common common_info = arr->error_class.common;
>> +    enum xe_ras_recovery_action action;
>> +
>> +    /* Default action */
>> +    action = XE_RAS_RECOVERY_ACTION_RESET;
>> +
>> +    log_ras_error(xe, &arr->error_class);
>> +
>> +    if (source.csc) {
>> +        struct xe_ras_csc_error *csc_error = (struct xe_ras_csc_error 
>> *)error_info->additional_details;
>> +
>> +        /*
>> +         * CSC uncorrectable errors are classified as hardware errors 
>> and firmware errors.
>> +         * CSC firmware errors are critical errors that can be 
>> recovered only by firmware
>> +         * update via SPI driver. PCODE enables FDO mode and sets the 
>> bit in the capability
>> +         * register. On receiving this error, the driver enables 
>> runtime survivability mode
>> +         * which notifies userspace that a firmware update is required.
>> +         */
>> +        if (csc_error->hec_uncorr_fw_err_dw0) {
>> +            xe_err(xe, "[RAS]: CSC %s error detected: 0x%x\n",
>> +                   severity_to_str(xe, common_info.severity),
>> +                   csc_error->hec_uncorr_fw_err_dw0);
>> +            xe_survivability_mode_runtime_enable(xe);
>> +            action = XE_RAS_RECOVERY_ACTION_DISCONNECT;
>> +        }
>> +    }
>> +
>> +    if (source.soc) {
>> +        struct xe_ras_ieh_error *ieh_error = (struct xe_ras_ieh_error 
>> *)error_info->additional_details;
>> +
>> +        if (ieh_error->error_sources_ieh0.punit) {
>> +            xe_err(xe, "[RAS]: PUNIT %s error detected: 0x%x\n",
>> +                   severity_to_str(xe, common_info.severity),
>> +                   ieh_error->error_sources_ieh0.punit);
>> +            /** TODO: Add PUNIT error handling */
>> +            action = XE_RAS_RECOVERY_ACTION_DISCONNECT;
>> +        }
>> +    }
>> +
> 
> Use else if in source.soc, since source.csc and source.soc bits are set 
> (even it's not happen), the same additional details are
> 
> cast two different structure type may cause undefined behavior.

Yeah you are correct. Thanks for catching this.
I can just return the action.

Though will double check if two error bits can be set in a single response

Thanks
Riana

> 
> Thanks
> 
> -/Mallesh
> 
>> +    /* For other SOC internal errors, request a reset as recovery 
>> mechanism */
>> +    return action;
>> +}
>> +
>>   static void xe_ras_prepare_sysctrl_command(struct 
>> xe_sysctrl_mailbox_command *command,
>>                          u32 cmd_mask, void *request, size_t request_len,
>>                          void *response, size_t response_len)
>> @@ -180,6 +229,9 @@ enum xe_ras_recovery_action 
>> xe_ras_process_errors(struct xe_device *xe)
>>               case XE_RAS_COMPONENT_CORE_COMPUTE:
>>                   action = handle_compute_errors(xe, &arr);
>>                   break;
>> +            case XE_RAS_COMPONENT_SOC_INTERNAL:
>> +                action = handle_soc_internal_errors(xe, &arr);
>> +                break;
>>               default:
>>                   xe_err(xe, "[RAS]: Unknown error component %u\n", 
>> component);
>>                   break;

