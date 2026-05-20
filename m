Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11930CD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 06:44:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C440810EEFA;
	Wed, 20 May 2026 06:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L5oaXLL9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E382B10EEFA
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 06:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779259438; x=1810795438;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ywo4gmM6eTlYcGplvrUdszo37ktA+dVfp4PB+rQYpYc=;
 b=L5oaXLL9IAJiqsCjm4MhuVobq8tQSvsBb/pEsB9XDAoAnXE3ggTakMqH
 G8qpqNkEcbTcCu5wt2KKQ5jG2V6BuHFPxs/NQMsIf5pUQRRQThR6qCqdo
 rkjRxcZhIODqspvVhwfxON6KRJ7VKM6u/6GQAGkVrBeOOQuD+FCTDL+Bc
 HHwuKy2anq1+aBxN4Wk3+3k82Tl7j0ksM6FGWR4ra2MSYM8QwoLJlmKEK
 9DvT7fUwkjbeuWfNIdp8QDDO9AOtxaOhftzZ05oizIMaa+YrKBrBjMR/u
 qlWDYgwM37n6ltnQTgWDTbE2MkVetit/bae1oF8a+WBXbfNApdnY/8uBF Q==;
X-CSE-ConnectionGUID: hAgRPKEJQd2ya2ISI8RdSA==
X-CSE-MsgGUID: QfsFR9N1Riixqhh6vs1gKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="90448063"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="90448063"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 23:43:58 -0700
X-CSE-ConnectionGUID: mjYQX97zSA+xYrwvVC9FSw==
X-CSE-MsgGUID: jSqWkENeQTmSRSkr5y6jwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="278156021"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 23:43:57 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 23:43:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 19 May 2026 23:43:57 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 23:43:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6LsE0BFvfxNy7TaRVvivoAnnEw0Kq7LyIhzsqQldLhSaRATCjajEl+z6GbOAXvJY3LX0xdR8yBukf+6LJ0aNKNds5BcO+yKYHlOznpRPNzud83Mamf0LbuU+dVPqDR1i+3jKVsMcWYRNcYVjLLMyZ7YIxnfgMDZaVEpQdo9qcqcilm+ftM4qwTi/apm5vBwDnKieFV9X0jxqQu5D4GEtogpJZgK4LfIhx6eIq+0qwsXZke4bYGUjDDqhRa4i66iEFC+ugi0fd3Cx6MOzSI+eaFSISOHcEQum1Sf63Emk5F/hoGVTS/UZrv6qc2htaPRzqRyAgyEpadJ5Mo7P4FWDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JLuCnjxVbqjaH9C9kup6Qdi8CZ9zY/uCARGyEZ6MO4U=;
 b=mPTPataQp/AaHnV5HjttkDypKYJH0MIFKI+j7+CGWFSXyPFigXaOEqzBiozaySQGCjIDBAySGLO2hVpkQ4A8w2QJt80SEnRsmhF5gyK+X3/u5dFcT+b+EiJyk5c5jdPsiDt8T0iH6cfjMA//DTDujQWLA8g+/JYRDS6NZxRlf7nhTE/VE4cUWrBWZ0Kj3SOfTv4lJwx1wuPHydjbhsmxri16945429WwU74RgCHPu30zGLQCKm9CKRF1sf0otoJ2nY3j3LgVBXBTKkba+vOQc4CbhrimlrcJjHhRCHb3acNokZANDsOL3PIuNNNN5kmaxnfBa3U2kd4RNBm9Gxc8bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ2PR11MB7647.namprd11.prod.outlook.com (2603:10b6:a03:4c3::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.14; Wed, 20 May 2026 06:43:49 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 06:43:49 +0000
Message-ID: <62177de8-d7bd-4b5d-a193-0140b488b5c1@intel.com>
Date: Wed, 20 May 2026 12:13:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/14] drm/xe/xe_sysctrl: Make sysctrl flood limit
 reusable
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
 <20260511172908.1122252-18-riana.tauro@intel.com>
 <bd5ea64f-f088-4903-9f68-5f041304c300@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <bd5ea64f-f088-4903-9f68-5f041304c300@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::20) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ2PR11MB7647:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bc41086-e833-4010-53fb-08deb63b25ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003|3023799007|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 2xM3KXE2PynpXBpBukbpH2W2/MvaHXZLuCMP5BAIo5KxJl2Mwk1+UXW1+yZr2dTZ9S1j2GCMrS1JQk5rGrJqRpdA9GfwXPv16xm/wYTpJrfYlg3xaPQLCcoLZ5JCckytXzOW5Oz2gU2PCq2IJE8VnoreLuTI6s7eM1c3GSs1vFfV9FRuOPvQahBgToDoVS3IyVtqmRIShARg9lpgxENaAIkr6AinpojYCIgAfI74dBhmUnelnzhg9avqC6Bms6IDppeq6q+mGEbqM0PqtmWFqnnB/XTWGYTWjiCMu2r+zpgKvArmcBTrPnhRQn4U5EnCOCmCAwdup7nspwWVXcUg5g1TseUBxfD7LNhcZl+VaVlvv8OYjD9WMF50efqGLBquoURpoUVbWWWjTanC9VoQzTzGuL5XKL91ps0Zm4sZe5oQaUIYJ4qyI2XF0veqWTtNMkffIDj1ADXsNp/fV8Hy8W8luKAvi27q00sTFjFBWBeTOsT1/Gq8m6T30O1fbTJP2oc0ZOcmuiEEBF/LvV91LcqH1qm2Y48YS7Vko3tCMdwLvQQ5w7cgJauqUTKjmlPjW8lMp8asjDRoHVekyGO62AuR6h656h4w00OKfxBp4rJ7XVz7msgHeTnaaS2UBTfM5CisT0Nr68zEU3hOPFoxIEZW/rR70FlMjF/FXcDhoF0mRMB8MUHhTJYg7vQL1MU5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003)(3023799007)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGU1UGUwbFBWWmVheFpkTmNhOC8zNU4vY2JLWnRVOWNwOEpURW1ydU1jU0FM?=
 =?utf-8?B?bmhRZ3libVdUMTB3R3dDTi9UOEphODdWQUc3SEFyZFB6Y3RXeWEwR0F2NTMw?=
 =?utf-8?B?bXoxMDQ0MmtSSUdWZldmWGQ3U3VGMklDd3UxZ1NvVjcyNTd6b2JSUmY2QmNr?=
 =?utf-8?B?ZDMzU2RBSW10N09wSncxaG1kbVZSVXkySmdQSktydU9wK3dKV2V2eDR6TzhN?=
 =?utf-8?B?UEVNalVhTlJkT3hrc2RFbTl6MFV6dWZUZTk1TFpTVkNXTW9EZWl2VkJJTjRI?=
 =?utf-8?B?OHhPanJnRlp2L2tkdzNqYXc5Q0NpQU15WVlUU3JGL2pFMkVGeW1mUjduNi9x?=
 =?utf-8?B?Q01kNGRpaGJmTHp0MXYzdmdmQkUxNUJyZUZxcXlaSFUvZWh4cy93QXduRzM4?=
 =?utf-8?B?Q214NGVEcFgwTUdranpwWFc5M3pqTGZDS2N6MnEvZ013eFZDQk1NUHoyK3Jj?=
 =?utf-8?B?SG5mbDVoQmhkL1lxNEI0Q3B4ei9uZHl0YzE1dzc5cDl4UzNBayt1akxwaGNk?=
 =?utf-8?B?U0NQWStRQWZML25tTjF3czd5MlFzenFpVGZ6djU3SUdlZ20rK05JMEt3U1J3?=
 =?utf-8?B?Y2RMNmlhQmxFMkd1SWlOVHp0TTE4Y3hzRGNzWndrYTFxYmJMQVNWbDEweHRZ?=
 =?utf-8?B?dlVmdzNmZGM4Sk85RVFlZTlTMWt2YmFtdzRvaTA5WFZzWGk0WktIYWxJSXB3?=
 =?utf-8?B?L0p0MWlKcnJxdnlZTEZIRjV5RkYwRkYzTzRaM1BPODJUSTJSelZ4bWF1R0Zx?=
 =?utf-8?B?QzI5blJ2S29GbTQrVHV1bWxISjg4OUx0VUZQRUY3U3M0czlXUzJoYWd5aHJY?=
 =?utf-8?B?UTMxbnBpenIxb09Eb1M2czJjUEJDa1hrTWNIUUhGQ0dWMUlBYXVTVHNiNGxN?=
 =?utf-8?B?dVNoQStMeHFNbTZPdFRJV1JHczZyVW1xUkM3TUZ1VmtKd2RsM3U5RHBiWkEv?=
 =?utf-8?B?a0dDL0FhRjVtekkwdGp6WWNJY0c4TXBYVC9aTXVZUlNnZ0VEK1hvU0t3L3JE?=
 =?utf-8?B?OW1WUjFMQ2gwaWtGOVhlRXZnTXY4RW5vWjM1RjFiZnBFSGRNakN3MHh2eHVq?=
 =?utf-8?B?dFk0QkhkN28vWGtpODNuYnI4S3lYVzBDMUhHSTZmRzR6TEE2dFpUTW5EamRy?=
 =?utf-8?B?ZWZlb2NJQjJ1UWZKS1hja0daUUhtdFZ4bVNRT1VLOFVaYjEzcTVncjVTVkNH?=
 =?utf-8?B?SnRVRGdzMHIzckhmTTVFbXR2Qk4rOGVQQ2RiWDVNcVdmQ201U1lhQnhqVHkx?=
 =?utf-8?B?b2FyWGZjUFRwYWFPakpoQjduNDdXVTZ2Vzl4RnNKUE41UjhCOE1zV1Jlb3M3?=
 =?utf-8?B?NGl5M3FFbHBkR2NEcVZYRjRBRzN0SmdFcEdXQTZrL21QVEhVZTdrQUJSZmVm?=
 =?utf-8?B?c1Q1ak1DdGRJSHhKUmFoL1g4QVNicTd0OXJ5SmdTL1AxMmUvQ3E5RERFZnV6?=
 =?utf-8?B?MkgrTmx5ZUlkZURPRFhIK0pRaU9vdExuMlhTNElYempMM2tzUS85dGpBTFpJ?=
 =?utf-8?B?YW5OSE9ERnYrWHBDclZwNXVrU0cvRFZnZmNUa1d6WkQ4TkFzbml0RXhGbURP?=
 =?utf-8?B?R2p6QUxNMERvaHNmanlZdlFqaEkrRWozZkYwZGdTS1VvUGlOOTh2VkRUaGV3?=
 =?utf-8?B?OFE3RFZMSkZlc2h4REZscGxZd21DSkdwVXBURW5henRPS2hNVnJHa2wvUWV3?=
 =?utf-8?B?RmFzM3VMWUlkSEU1RnVYODMxQkhVNTVYYnhGazR5MTY4K1o1Wmx6UytuYkFE?=
 =?utf-8?B?OE9KT25sRFdwYTlnV3BFeEFheWlqdUlOWGs3VmJpVkFjTm9lUVFWck1Fc3Rj?=
 =?utf-8?B?Z1Z5cCt0WVlDRVNSU202OEZmTnBuMnVlTElvSmdsYno3aE1qdmkzYit4NUpR?=
 =?utf-8?B?ZWYzajZLMks0Y1Jsd1dKc2RmbWNMNEo0M2JKclF1S1BHUnNkek8rS1lJcnRm?=
 =?utf-8?B?cFNUZWtORXM0TUp3MWFRNFVKNjY4ZEwvWXRZdGxXdEc2WmpUNVd1WmE3N0Nz?=
 =?utf-8?B?MXhRQ2U4MG5hdkFyamVqZ0R1MHhMVzluSS9hb0d2VzlUZHY0ZHpTQWpqbW8r?=
 =?utf-8?B?dURuTElSRlZ4bWV2dWovaDF4YndDeUExZUZrTU5nTE5RM3lkcVkxTVB1Q3dP?=
 =?utf-8?B?STJYVFZDVXRXRTFKVkdoSWpFU3pIbTdOVGgyaW1TSVY4b05tYnNmOHZlTEFj?=
 =?utf-8?B?ZFV1ajBybHNGY2tkWE93QWhEU2V0KzhwT1hjc2QwbGRyR3QxNVkzc3ZOR0Rk?=
 =?utf-8?B?UkNGc08wNmc3czBlOWFrSGtnMExxK0ovMUpFd0lZVmY3eE1RS3FidGVWYW10?=
 =?utf-8?B?d2U5SzNHR2VET3RNRDNOOWxtRGttdks0Qk9CT3RVYTB1MXhpbjFrQT09?=
X-Exchange-RoutingPolicyChecked: AzMKPTFLxvq9zJJ7ee5V24J6QvjmI903IJjidiD+HagecAAjSUlKw/IhtfKHN8BlAe6iNQDz1fXx5+ViqZmvdiwKiNPenbdYRwEKPj0aJW+6HvZgMRCv/VexN3fcOjQ6jgZfj8VyOR1XUdICWbLm6qumzwyu8La4WhkZZEG5jin/hVV6pSfM7z73DGayZLRGcNkpnHkRSRXsEYdhxkdmqT71cUqjaLriQJZZsPXvL1rB7Hj14ELyDUDjUDGt99/NeL2EBvWeIkW8Lh97GEooV1M/LB2sNDrCjk/wvWrj3w5S0+SGZBuUZfD0Fy5g3QFCF/rxJ8zYMS46DuOEW2dyug==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc41086-e833-4010-53fb-08deb63b25ff
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 06:43:49.2508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XU5KlwrIW5q/W9oAJj7Vm38rlqTnyJITMOrPw2g10fVgcH9Z67Jpoog1fChynUztAcKPAi+V+cpbDVC93hI19A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7647
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


On 5/14/2026 6:21 PM, Mallesh, Koujalagi wrote:
> Hi Riana,
>
> On 11-05-2026 10:59 pm, Riana Tauro wrote:
>> The sysctrl command flood limit was defined in an event specific header,
>> restricting its usage to event handling. Move it to the shared header
>> with a generic name so it can be re-used across all files
>> using system controller commands.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_sysctrl_event.c         | 2 +-
>>   drivers/gpu/drm/xe/xe_sysctrl_event_types.h   | 2 +-
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 3 +++
>>   3 files changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c 
>> b/drivers/gpu/drm/xe/xe_sysctrl_event.c
>> index b4d17329af6c..faf6ba89ce98 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
>> @@ -16,7 +16,7 @@ static void get_pending_event(struct xe_sysctrl 
>> *sc, struct xe_sysctrl_mailbox_c
>>   {
>>       struct xe_sysctrl_event_response *response = command->data_out;
>>       struct xe_device *xe = sc_to_xe(sc);
>> -    u32 count = XE_SYSCTRL_EVENT_FLOOD;
>> +    u32 count = XE_SYSCTRL_FLOOD;
>>       size_t len;
>>       int ret;
>>   diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h 
>> b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
>> index c16c66b9fa7f..d236e22fe9dd 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
>> @@ -11,7 +11,7 @@
>>   #define XE_SYSCTRL_EVENT_DATA_LEN        59
>>     /* Modify as needed */
>> -#define XE_SYSCTRL_EVENT_FLOOD            16
>> +#define XE_SYSCTRL_FLOOD            16
>>     /**
>>    * enum xe_sysctrl_event - Events reported by System Controller
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h 
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index 84d7c647e743..0fa786a9e8c8 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -48,6 +48,9 @@ struct xe_sysctrl_mailbox_command {
>>       size_t data_out_len;
>>   };
>>   +/* Modify as needed */
>> +#define XE_SYSCTRL_FLOOD            16
>
> The XE_SYSCTRL_FLOOD definition appears in two files. This is like 
> keeping
> two copies of the same information - if we need to change it later, we 
> might
> forget to update both places and cause problems. Let's move it to one 
> shared
> location so there's only one place to maintain it.


My mistake :( I missed removing the second one

Thanks
Riana

>
> Thanks,
> -/Mallesh
>
>> +
>>   #define XE_SYSCTRL_MB_FRAME_SIZE    16
>>   #define XE_SYSCTRL_MB_MAX_FRAMES    64
>>   #define XE_SYSCTRL_MB_MAX_MESSAGE_SIZE    \
