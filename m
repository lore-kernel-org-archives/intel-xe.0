Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DD4EBFD10
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 07:56:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A19710E350;
	Mon, 13 Apr 2026 07:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AgxI/aCY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AB410E34E
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 07:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776066979; x=1807602979;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t0vsJB6GHoIlTIyvZ1DKo8TJT4GHSfCnoYNZiPG3sII=;
 b=AgxI/aCYNo4FzwRlSkhhqAf1Mb7Le+rGsNE6sosoHe2iaiL/+gDCMkRq
 D6OYuxi0JuYto7tyaeMmtPb2EyitD9xeoVFr0kyy81ZbrEVgr0zXWZIeL
 BDZ4ZAAt2+9GJQVhWBYiLoXlRrYatKpH2o23IzAlN3OXGPNIknTWhB6ek
 RgEgaJ06P/VHzyYU0CMNj8mpqQ/rlzFGeJ4zA9IkbErMPFjEtk8Pk0aoy
 3NNNr7Pq4wtrh8Zz4iURi5o2X8yC9GZpshswATGQZf9NgBXZtoVHXxNaA
 jcxr9Mx07womL5Y5W/bHYNTfWrTVlMVPUh/Pbd1pjYKM9lIV5UFmno6IT Q==;
X-CSE-ConnectionGUID: Tcrkyr7OQTipCtA7asWhYA==
X-CSE-MsgGUID: D0xZG6vISlOUQHlXDBMVEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="99640246"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="99640246"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 00:56:19 -0700
X-CSE-ConnectionGUID: ghotVkIsR6qoJaFSslzdzA==
X-CSE-MsgGUID: /65jgNMUTbOy7/SBmPe86A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="223229232"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 00:56:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 00:56:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 00:56:16 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 00:56:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mj9u9lxC1Bn4vbPEkpeS0HoaInFh/sdshlT+oYucPGptH6olUlkjac51oFThyT1oZpK5ggQfG/pzjsjPbxweiDaQ9UUNX/h6KgXlNurmRlD3X3baTouk5LN0wk7YG6RcWynulzfet6EgdaFombdP09gEme/RCqRGplpbXXebZSvvsQCY5vyh1HOrlRV+tf+w7kZh59sGSe8H15daGYBm+ZN13SrqXzMLOh2n10R4vq3qE71VaKaYk6OVqv0FdKL8yUXaeBwZnNovLM83jHfFG1wE+E851GYvJnO1VZ9USo44Jmw05p0r/LqaTfi7pJUr3Mx/gCXNe/2zqeN9hMDLvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OO+Fc8xkadUi8waRPWVg05ylJlCh/BiTjhEI8iuZJ+E=;
 b=lUaIj2QRWwSosgmMcLajdEqAWNzcCzl7yl1RWXEyVr2DHKgqbsMjx58TyQ6vncTQ177cuxpbjd6YQZ+T3MDYyKTXk3SaYIPSUWQQ6HvQkesjDMisWgl41bf3Z1sQ69lTXBOdjEGN/ExlkdpPUPnAXtmyxgv7RED3dll9axoUGNC8yR/Cp5vdeqDLSKTIf+gloenvWuupZs0Wnb3MlNPFPK8LYAJuk50nSGL19YdXB2lCHrlNAFZx5eJxkJi1ZHRbW/3Nd7lZQmsU8n6Ha9kfdTe6IGHYJ4F5mxwaxkiXfNOxurDK84uqa4Q1LHzCOiZ2UZK8keQWjVQbzyjcuHQbIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB6501.namprd11.prod.outlook.com (2603:10b6:8:88::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.20; Mon, 13 Apr 2026 07:56:09 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9791.032; Mon, 13 Apr 2026
 07:56:08 +0000
Message-ID: <61f6226a-1dd1-4643-8fe4-ad5c08c118d4@intel.com>
Date: Mon, 13 Apr 2026 13:25:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/10] drm/xe/xe_ras: Add structures for SoC Internal
 errors
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260402070131.1603828-12-riana.tauro@intel.com>
 <20260402070131.1603828-20-riana.tauro@intel.com>
 <adY5hH7l-HiXt-Fu@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <adY5hH7l-HiXt-Fu@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB6501:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ff73784-2d5a-4617-e6c6-08de99321f24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: XCN63N4kjFEyBkpO/dJyk5dIPIUaMlUTrOhfJgA3kYnDlArmFBa7dBlT7YXyXXwvojUMC/yz6hgaSpFJpsqpqhOP8o8woun9JyJOgT/rg8K20CymIOXyVoyNVPKdR0bzhBaKUn1OKJ7OgbhUPY14MYCoKmsiNRfRHRIlnSRf5aDE41MvIdFi654KdRMCIlZHMX052PAlwaWbKANeNnSCOYRjfUx1jcLZKR0tDiG6quvHfun0mid1MJIoT1EiRWXAqc7FQtaMfYFPq8L9bPTCXYpqExsl1BFi1xKyMLdbwG4AjWmxk54Ltm/dwZZ78dO/dpcVaIMUjkzAydOnqsqH0plxKNZz/NqYADvs2vjszf7c+237pHZKQ2zyF1x3hgkmtZifghPcQwtwkRInQVtk+pyf31jb7Insor0MEU1IYN8BUIx5gku4CwX4EPWrrrVUO6INZ2R/PsxP5jabCxm0t7lzVRt6oN+KrNMLzp3Ln9B47QupmzPc0Z8j1y2UCftxpJDUbGr0Umn1KwiPQ238b9JGZLh7TQLfBIwZIb9Puk7WDf1Xpdg0ckoJQyKLNKid+bgOi6KoGFjodH+p+NHdZJlBdyI0lPwIKyG0/wZHxflE92RUCm5SDuNrviG2C1Bnn+DqRX7lhG+wSKV9inMTweT1B7dCZKWDUPTY4NIb2m77lqdBBMaIwHBtGs/vG+QAUGNiO21iw8cyXtYPsgWN+xD22lkCwc5DyCqvhK/Od1Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFA0em9JUVZWeFdmZCszSjVFeW9ub1FGcHg2S3RBdWtqOGc2dVhxa01ZRjNj?=
 =?utf-8?B?emdPTUsrREdSL3BmVVRVSnUyM1NXeS9RbzZPdWttK3psVW1paWZZcWxxQjBX?=
 =?utf-8?B?N3NWRW5vdXNCR2hIRHhEZVF0R0FQZ0NzbHRMNmlkcHB5Ni9LODJ5UDA2dWZO?=
 =?utf-8?B?TWpoMjAvSE0rZ01aaEtPWXBMRnBmLzNOTXVxQU1CQUcybGVDUlFKRTNMeGJh?=
 =?utf-8?B?ZElaM1RJZ2FWeW50eWxNd25YM2J0RUR3UWE2R2t2bzNXclVaMHNrVjVvSUI5?=
 =?utf-8?B?bEdmSjl6Y0MyRW1JS0hiQ1UzbUpzckhuUjlic215RHdaTWx1eVFCQ1dsVkRY?=
 =?utf-8?B?SU9iM2xNQ2IxNjQvODFPajRmTVBTblE4VGd4UmtNMXMzamtzSDM5OWE1ZEln?=
 =?utf-8?B?UFJBa2JLdDd0dUpHWVpQcVZPUHpDVmZ4WGxjNWZUT1FKNzZUaGVpOXlJQjho?=
 =?utf-8?B?ZGR3QnlPaWl0MC9WZnZPMitGcUhLYk5ySS8vOVVEcURpekJsTnZEVUhrQXVx?=
 =?utf-8?B?eWhISHpYeDlIcGxMNC9pOWtORnhtT2xXakpwRGpGR1dBdXA3eVdLNlF4R3kr?=
 =?utf-8?B?cUhGMTVqdlZ6L28zczNzMzdmMW4xeklTU1lSUXJUWEl3dW91R2lKUDd4UUZX?=
 =?utf-8?B?eWFsMC9zRmkrMm1tUlNNL1VvUzRrVitYd2c1RW8zZ3h5M3IxZGNkMUNSSXJm?=
 =?utf-8?B?aEo5SHFtZDRjVDJDZ08vckpTSGY2V3VJaThqektPZ05pc0M5OFBodDJrSjc5?=
 =?utf-8?B?czk4VUF6V2d3UjI4cWJ2cGNZNVl4dzhKUHBDTmdEbWtTOU0xRm1ZYklueTk4?=
 =?utf-8?B?TTd0SmorS0JQNitvUWpOVmZZb0k4VU1wcCtESlh1TE93aEt0VGw1eFlsUlM0?=
 =?utf-8?B?SGxBSzcyYW9maHNjdUdsSDFldVhEekxlajdud0Z5R1hRcDZ4K3ZPNFNZTUtS?=
 =?utf-8?B?NE5BWmIrODJGY2xaVXljMmp5czdqemthd2JZaVQ5QlRYdlFCbytGV2s2OTg2?=
 =?utf-8?B?OFVjQVRBR0N6UjVMUGZUSm8rNE0xU3FLY0FHb2pYVGFTbXduYUttUVp6bVIy?=
 =?utf-8?B?aUZEMS96VVIybzdhaWgwT1BlR2JnZjJHT055aHdyOFN5VmRTa2VwMVJqenli?=
 =?utf-8?B?cUU5NVVXMkVhQjZZelNQeEloWWs1RHFvZTZmRk8vMzFVOXgzV3ZkenExTEVR?=
 =?utf-8?B?Q0Myd1JEVndQM1QrSTBER1NRM0NLT3NkQjVieVBXMFZJSVBKcUJOV0FPYjhK?=
 =?utf-8?B?VHUrQWVTYU9Wb2h4MENFRE91NWV6cDRzS0ZPZGY2QVVWQk5VYUFncDV3eDQ1?=
 =?utf-8?B?QXB5Ylc2L0VHM0hNV0lvWnRMbDhXV3J3QzJLbHhsbUxBclJUV3l5S1orclEy?=
 =?utf-8?B?UTBucVRnZk0vckdyd0VyWkJtSVlxaWo0UlZWeFh0cVhTczQ2RFRRaGtnYlFI?=
 =?utf-8?B?ek9Bd2hFaUdlNnk1ZWwrdnNYdVA2NUFCRnBLbStuUURMWkRXWGFYQ2JCQ3A4?=
 =?utf-8?B?SW9IRGN1Y2VVYU1HbWFHOVhFRkxIM05BcUdkdS9WczN3aEtRSkIvWWNkWkdq?=
 =?utf-8?B?SHpVejBDbThWRTI2WllzMFhFOUQ0ZUJ2UUxxTjQwYXk5SnhpcVU3MDN4NkMy?=
 =?utf-8?B?UXhHdjE2dUwwdkFvajFaMzNZaHF2ZUU0NW9NWmxiY2dDK2tETWhWUGlXMDJT?=
 =?utf-8?B?SFBGYlMvQ2FRY3drczZOOEY1bU1wWWFKNXFqY3NhN1l2YVUwT0lHN3VBZTMv?=
 =?utf-8?B?VVlyRVFEbVJCaUpFdTNYeGJEQ0djenpPOXA4eVJtVGE0WEZaN1AySXQ3OFov?=
 =?utf-8?B?c3VBZGRzMEhra2UyN0xpcnJ4QzlycG5qL1RTTnQrVmRpUUJ1ZDJRaG1Ya2ky?=
 =?utf-8?B?dCtpU0h1Yi9YRFZXR1JkR2hrQk1jRjFVbWt1d2FzamdhZjl0Y0VsWEIvT0o5?=
 =?utf-8?B?WlR1MDBaNnVIdW9SSXpMTGp2S3hBUGpTNlYreHNpUmNnc3B0cTc4L0wvYnc0?=
 =?utf-8?B?Zmk3VHhTUG0wRzVpZUJGRXIwM255QmNNdTk2Rk9vN2xFanRLbnFEcDRSYnR1?=
 =?utf-8?B?dHdmWUV4M2tNTkxodVZkb203OVRzRDVsQW9HeWRjNE83eVZVMGpIZkIyVWJY?=
 =?utf-8?B?SDhxbVFrT1J5VkUzeDZOdEJGWTYvY1dyVDV5Q3NCalErSU5lN2xNS3lhamIx?=
 =?utf-8?B?M3VobitUUG5GTFR5SGJiK3ZtdkQyclJvZzdaSU1XVEd6dVlEWVdJM2oxRjUz?=
 =?utf-8?B?Zk9iN2NWcFBPTEtnZmxUdTFScVRvRDQyb1YxRHRpWDZGcCtWQjVEdEZzTWRn?=
 =?utf-8?B?bXd3WHZaU2JvR3QyN2MxaXdtdDNpZmdNN3RuazQreE1lY09OUjRYdz09?=
X-Exchange-RoutingPolicyChecked: qo6eXHbQ5e2nLZu/wGrB7ZrChvRdnCGKHjiM+CwMCQSHzoIzr0UWUg/JzUhTDSWUBgkoxSJfXQ9D5S7H/1ZRBrlymKlTK6/iJb1WasSEm2pK3Vt9As98cEx4A8v+vLpeBCgT2qTwQq37bCOSnRcJsltVhptzQCkXj4HBqJ6UbJ3ajVMHK16aYFbObDVwzpy/X4z3ST4uLzbxGuJxef5MGxcUTJu/WXm8aGXLcKi8knqIVOz2QfR1J4Db1S4jPZsCN8RRBGXm9KZmwqrKG6g8P4+15L8cLH+7U7ns1BB2BmQlTDIm3gqEFQA+533/NSsVD/EyWYWa9Jb59lZ1yCW2yw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff73784-2d5a-4617-e6c6-08de99321f24
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 07:56:08.7364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gE43Pu19HhRVxoeJP9VnCoEYG7op5MQY/oGEOarTZdoL3M6zPdlPOrBuofYtXbI/Zqrs14aDddbDgUvEOHXahQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6501
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


On 4/8/2026 4:48 PM, Raag Jadav wrote:
> On Thu, Apr 02, 2026 at 12:31:39PM +0530, Riana Tauro wrote:
>> Add response structures for SoC Internal errors.
> This looks like should be squashed with next patch, or did I miss something?
Yeah it can be combined. Will squash it in next rev

Thanks
Riana
>
> Raag
>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: simplify soc structures
>> ---
>>   drivers/gpu/drm/xe/xe_ras_types.h | 51 +++++++++++++++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
>> index e37dd12bffa3..65158bf716a7 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -10,6 +10,7 @@
>>   
>>   #define XE_RAS_NUM_ERROR_ARR		3
>>   #define XE_RAS_MAX_ERROR_DETAILS	16
>> +#define XE_RAS_IEH_PUNIT_ERROR		BIT(1)
>>   
>>   /**
>>    * enum xe_ras_recovery_action - RAS recovery actions
>> @@ -149,4 +150,54 @@ struct xe_ras_compute_error {
>>   	u32 spare_log3;
>>   } __packed;
>>   
>> +/**
>> + * struct xe_ras_soc_error_source - Source of SOC error
>> + */
>> +struct xe_ras_soc_error_source {
>> +	/** @csc: CSC error */
>> +	u32 csc:1;
>> +	/** @soc: SOC error */
>> +	u32 soc:1;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved:30;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_soc_error - SOC error details
>> + */
>> +struct xe_ras_soc_error {
>> +	/** @error_source: Error Source */
>> +	struct xe_ras_soc_error_source error_source;
>> +	/** @additional_details: Additional details */
>> +	u32 additional_details[15];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_csc_error - CSC error details
>> + */
>> +struct xe_ras_csc_error {
>> +	/** @hec_uncorr_err_status: CSC error */
>> +	u32 hec_uncorr_err_status;
>> +	/** @hec_uncorr_fw_err_dw0: CSC f/w error */
>> +	u32 hec_uncorr_fw_err_dw0;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_ieh_error - SoC IEH (Integrated Error Handler) details
>> + */
>> +struct xe_ras_ieh_error {
>> +	/** @ieh_instance: IEH instance */
>> +	u32 ieh_instance:2;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved:30;
>> +	/** @global_error_status: Global error status */
>> +	u32 global_error_status;
>> +	/** @local_error_status: Local error status */
>> +	u32 local_error_status;
>> +	/** @gerr_mask: Global error mask */
>> +	u32 gerr_mask;
>> +	/** @additional_info: Additional information */
>> +	u32 additional_info[10];
>> +} __packed;
>> +
>>   #endif
>> -- 
>> 2.47.1
>>
