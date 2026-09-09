Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8249C79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 19:35:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7259010E227;
	Wed,  9 Sep 2026 19:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ae/IBB29";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAA310E227
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 19:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788982510; x=1820518510;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=aMRSZgCDxIi1iVlpFj4RSpneB5t4SVkB06hEve7Wttw=;
 b=ae/IBB29B3mQ8Z4d+f8Ab5CP4r2BPK9Phfq5uq9Zzu3gLR8eCJvVoj4q
 5D7D+9E29TMGGfT9nO+uOk+kLXSwuHR0lgUGxpMWJF1sRGZXznXrESC9Y
 BZ7HfgEarLO7CeXO77aExJx0r6Y5ibT3w+0JwbBfXenHQEBEKzxQffZPF
 3nQEGXhbZtThb8TVc8wbg9+XS9oMoTe3lIXfA4fBdc/A988rQw7NnyRxp
 SgCGFaKc60wJ4kaVTjImiS8rpqBAAgV/5bS/ghLYql1AcHu7qhptEiKQJ
 ho2ETduiViFM7WS8T/I3yzrr4XnOZoA94xBeXiQBNA0IdyXFwDAl2Av8M Q==;
X-CSE-ConnectionGUID: 07IJ8vyCQ+aSJOxC5NCwrw==
X-CSE-MsgGUID: cxmukwsETaGfnKCCQZQeng==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100079691"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="100079691"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 12:35:10 -0700
X-CSE-ConnectionGUID: cv37XzJoSfyAPN7RIrYPvQ==
X-CSE-MsgGUID: wiL8AvU6RaGh2lxzBlv/YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296358725"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 12:35:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 12:35:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 12:35:09 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 12:35:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rpT/nojWNS7WN4fTfOUfM/QQMD03gYkOF/ymt3YuAko2QmWsUueRzVG30EBKksJ4la5vUp9JDOoEvdaDfssAv35dYy8jlBqMrBHRGGDnb8FrqMoJvlOEJJg523qOhY2XH+eQYh3cnedvx36mMSYCRxYxuh533d6DpUrzXcr9yDhMe96tTOQzStBzICqrYh/SAJcqA0OTSkZ43H/dlx2ry3OIlxHgmK1Jlw8RfJerCI2OVCB5Tby37nNsIanX8KWz/8OS217XmE+YWlw+arCdOUVF94s5Jf1dGvrfzODIOnORZcK00bGjq+K+s3EEAOOMg9OChJ1pz/3bKk7nKkN0Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBSZ1bPwpKCKYg9Jk4XvfL9PCPTnxa75sdTUP95P6MM=;
 b=K5wI3S9Q6DUVNYDIE78Q7jvqJQTcMbOc9ysI7Irn4mPaoX5oXPMnNW84jbF8tkJXOs+ppvIL0GalLtc2Dt9aZdEBd0b+4qRiyE7PTOLlCaNtHITpnraROOT0miq0DctwvieZpbQ2u4Kr9cD3GVMgpv89cxB5l7GAyp3z6nxy32gBqabXXFsVJ1yf4xUympfpkRp3hdFjihzixZ7YFVxN06gM3zg9Nuf1ku6blbZcXqSaDe2qg8N4BgF3aoR99BlDvIsTdV7xnqi0CmSon/O5y51aeN7VctHntNoNViLEtlrN6gR0eeFjEks6o9lyAZ9YtqgCtGliuRa2zaxpeJLW4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by CY8PR11MB7898.namprd11.prod.outlook.com (2603:10b6:930:7b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 19:35:07 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 19:35:07 +0000
Message-ID: <c7abb2f1-39fd-4e30-8b3a-91aa197b8484@intel.com>
Date: Wed, 9 Sep 2026 21:35:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/tests: Fix subplatform selection
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260905200157.3164-1-michal.wajdeczko@intel.com>
 <20260905200157.3164-3-michal.wajdeczko@intel.com> <87ik4ejl0g.fsf@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <87ik4ejl0g.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0056.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::33) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|CY8PR11MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: fb3a1ce1-76a3-4bba-0c46-08df0ea9745f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: WjwFtR9qv/ygBQngJik0qenuOMGDl1nEyDY9WnkpKkTIVrqme7LcSpzFb64sEBLJOgYVdg8jLmOwfA0W3omukZVskaEnVe0qe2m8mlFAq0iS5P45ajf/4OuwcjzCEsFA0KWFbi0dEmKR89ZTYOGKUgK2cNEtUlaC/FlaNBTE+ladf8HRubQLVHy3fwojzhaTC/1xZbwtmvIsJZW//YLydLaFurD1lKxdQat3LGODriO6moY6CVAsDPg7zNuaFeYf9icjFc/BMoXcwL2tMdFafKTeajAA59lCDyWcSeoKKxr6ghHv2dWSdHUhu+j/YxBhGqZxoARyFpEJ23iRk85VkYJbt12RE7awKGBk/0EVELDhxjOsAnP6RdONnrMFHPdZflOE7l8ItL6dAcTYjljGZdkqeMpjeFPLyBnR6snGG5VrorNNpSsmcM8TcH2Ui7zqujqzcI8Ad8QdB3kiX6xqhrRn+5zLGUjJXmd9Z/xNScaVOwjUOMB45SlVT4txmBqWzubChI3mgPwGjx4S7mU4ewdWZRre5YLIVAB876icJhEqI4QzJLblXctfMp1p/1bk5b6tBNxa5Sr+7XMUXgHTxd3WD0aJgbDWix8NBx+nytltsAO/NfM3fCbuf6PMxNwz6KMpEMvSxY59VfmsqgctIvUkjTFp7QGGuPICMGIFMic=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(10067099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkxFS1lmdTVCTm01blZ1cDIzVUdGbS94bGVoRVRnZkdRWkxsR3FwOXVmaTBS?=
 =?utf-8?B?NGFvb2Z1ZzYxRlg0bnlPa3BqU3o1aTVkbDF1M3NtS3FrWHpSVlFZSDFGaDRs?=
 =?utf-8?B?VFFjOFJ0NmlXclY2VjNIUnpxQ2YvN3ptRDZiSVQ2cWEyQkUybzdHemcrTjVw?=
 =?utf-8?B?WmViUDdvaStuR3I3LzlJcUxKb3ZMbkwzREVKdUFKeE4rVUpYdHM4L21OS2F2?=
 =?utf-8?B?UnR4akRDWGxrUTd6ZUpoVXJBcnhOK1BGMHgyK2hqZmFtWG8rTU5NWHlqelZK?=
 =?utf-8?B?bDh2cS9vRlBxUThjSWdnb2tsY2FSUnNIM2IydSt5REV2emFuSy8vU1EvYWM3?=
 =?utf-8?B?dkRSaDF4REo2cmhBdWNYbXZqYm43MU9BbVRHcVJYWU9udUZkM1Z2SVhDWThm?=
 =?utf-8?B?MEN4YXo2SXhIOWNscGpFazkwRDcraTdkNlJacHNiZTk2ZEs4NlYyZHRqcTdY?=
 =?utf-8?B?bzFiOVJMUkJXWDkvRFVCVkM5SGt1MnV0SzdGZmJvS0liQnJZTHJoZGRzVGJH?=
 =?utf-8?B?bzlZRHhOU0wydTFRNkxPQzYwQ0NhL2lYZ3Uxem5WYW95UWZHci9nUk1SQWVq?=
 =?utf-8?B?TUFtejlDOHdIWkx6cWQ2V2dtTHdxQittdzVBUjNZQjJGaEM1ditkUjh4WVdh?=
 =?utf-8?B?NXNocnN4ZG1oU1dhMzRaOE8vU2NKQjhqNndtM0FmcVVzdHB2bUtBZTB4ODlB?=
 =?utf-8?B?OU54d1RBeFBrR3Q1amdoYVBsWG5ZaFFiN1UzVzZFbTNqSlhBeHJZbWJXYnEw?=
 =?utf-8?B?VFZ3eE1nRUhKR1F2RkMwUTQvZm54bDFSWC9IQnZkdlgrRWVaYkN3Q2hNNXdh?=
 =?utf-8?B?NzZ2L2ZIT1FQWjU3SU1QQ1pEYjJ4OUMzN0dMVitibkt5aGpMS1RmM2ppdHdS?=
 =?utf-8?B?VlFJY2NXWTdUREZIaTlsVmFYaFlkQ1lGS1FJb2FFNGJCUWJCR1V0WUlmUktN?=
 =?utf-8?B?c3c3dkxRdkZNL1hpNmU3Nk1uemZSTDh0Wm1jSU1Oaml0SU1CZU1ybGliN0NL?=
 =?utf-8?B?UlUyTEY3RjVqWnozeFR0TlcwTDVmaEduVE5IMFhMa2ozWmRvVHp6UVk5U1dq?=
 =?utf-8?B?SGx5QkdYS0pjdzVIVENVQSszUm1BbWk5aGwzN1Zqc3FaMlYwUUhqWitpNHFS?=
 =?utf-8?B?cDlpbmRCWTZKL3FNRzBBMXk4S01EQmNMdTRBdlA0ZUoyRE5RbXdSUU9QV2lK?=
 =?utf-8?B?VG1JRXNhVExYVWRuQVIzbDlTa1djYjM2bkpHeFZwbjV5cWU1S2N4Zkx3bWw3?=
 =?utf-8?B?NVpHSjdMZStNRHhLNTRkR1BaVEwrQVNUbWZCSjhXTXNLVjdiVHJmSElnbmRh?=
 =?utf-8?B?T1ZJdVE4SStndFRScHdJbExUUDVidG5kNm9KLzZIbGhVNzZuQVgwVmlFYzlT?=
 =?utf-8?B?bmZicUNaOW9ZamJTTENRZmJScFRlbFF4M2NlTGpQUkdJVjBzMHVQbVlVMTUw?=
 =?utf-8?B?di9MTVRWUFRBVFRzUEJJWGFiNEtwcC9MNVpURTNsbHVndU01Qnp1RW5PbkJz?=
 =?utf-8?B?TDg0N3VTWVB3SjhIVTFBY0p5TUl3cnlkNlhpbnM0V0lSUFhBMVhnT3R6NXNJ?=
 =?utf-8?B?aDFCN1N1enZxWHNXRlFzNUVTNVNiaGVJM1hoWGx5MHREL0grS1pXN2RsdUlp?=
 =?utf-8?B?REZaRGo1b3NuZjN5Zk52aGYzR1lSZ2FQN0hHYjdwZ2xmRnZXejFleHVaUFVZ?=
 =?utf-8?B?QWtwYWY5VEoyb091ZUFiRUllQVBSMWhEdFNCS0ZQbVBzUjlDVXpKVk1BZ1hJ?=
 =?utf-8?B?aFpNQlRSN2E5QSt4TmtJSTRmRkx0bGtjMGUzTksxeGpabmNsaGIrR3lIUWFQ?=
 =?utf-8?B?NVZoU3kyRnZUeGdkSEJ5bUUwMCtuWkxkYkd0ekIrcmkyeW52Z3N2YkFCME5V?=
 =?utf-8?B?MkVuSm50bVNIdll1WTltQ0ZMa3RMaCtvVW5WYXBpV1dINC9Rb3ltakxRblRY?=
 =?utf-8?B?MFFhcnZXSERGWW0xVFdYR3NGdE9VSjlydlI0M25FK29YSkRIdjA3OGZRL21Q?=
 =?utf-8?B?bHQvMjdtc0JmYlp3Q1JibnU0b3BSZ1c4WVR5UlF2TW00MW13NzRleExsMTlG?=
 =?utf-8?B?bmp4bWMzT0xIVFhWOVl6cVhkRXZldGtoR3JFOGtZWnJ3YjF5MXBrRER3WEJU?=
 =?utf-8?B?SEZjVHJpMWlDeHFsQVk0cDdqUHg5cWhuWk9La0dhV2s2SmR5eEo1RnlSWXV5?=
 =?utf-8?B?N1B3MC9hdGltNnRCSHhpN21MS0l2VHVHTWdENmF0L25oWXM1UVlCcXlERmln?=
 =?utf-8?B?UWZaeTkxc1R4S21tbDhiSW16SkNGYk4xTXdwajJxWDE0TlprajV6Z2VLUVlv?=
 =?utf-8?B?eld2R1RGVGJLdXpyS3A1SVZ4NkN3T09nR1JaaGZyMHN1MFNnd0wrLzJDbERr?=
 =?utf-8?Q?g03WwHStyUSzs4CQ=3D?=
X-Exchange-RoutingPolicyChecked: jz1VnWMgAB3tK8OTZLsvXuLP8qoPqbaBIDeRIBeuuXNaAONn1sSXnrX2LQQAd/ph/cD3EpDD2OpcsPIh/xYb36lggy7bh8g5wz9bQ8Q9ywhnDlJ1x2aghLViSirDirsHu6polYXSBHIIOPrZ8JNeohUqVPIQlCkiN+EfaPJ+OzFgGAAgFmUQ5MsZzS3HJrViSWXaVCTDHFbJvn29XZf4b42/exjhExUh4eApthAAK4lIOaELq7lDTVDnbbbSCYvbx95hJNoEJmhRjE91zTGQyvW0KJmhn8oPU0yOZfwnBdLPPneJGXxaTF4vrTVoQSuQLxOBxlP9w6oLDCBW0urwhQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3a1ce1-76a3-4bba-0c46-08df0ea9745f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 19:35:07.5430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t7G5JjrIu70q74NhnBdKKhjXiv/VkOSeeqWnk19cT+ndSnjLrHpxf7xeiMjp0TESrq5m7YxkzmnBWaH9ZfnnRhWi9CUUme7cOjStxtUBVFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7898
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



On 9/9/2026 9:13 PM, Gustavo Sousa wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> writes:
> 
>> If a test does not specify subplatform details about the fake device
>> it wants to create, our helper may select a sentinel of the subplatform
>> descriptors list instead of the first available subplatform.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/tests/xe_pci.c | 12 +++++++++++-
>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>> index a82cab7a2b86..8ab4270cf5d8 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>> @@ -364,13 +364,23 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>>  	if (!ent->device)
>>  		return -ENODEV;
>>  
>> +	if (data->subplatform == XE_SUBPLATFORM_NONE) {
>> +		subplatform_desc = NULL;
>> +		goto done;
>> +	}
>> +
>> +	if (data->subplatform == XE_SUBPLATFORM_UNINITIALIZED) {
> 
> I guess here as well, subplatform_desc will be either NULL or the first
> one, but if we add a comment in patch #1, I think we don't need to
> repeat ourselves.

IMO code is not so complex that it would require a comment 

> 
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

thanks!

> 
> On a side note, orthogonal to this patch: I wonder if it is okay to match
> no subplatform when the device descriptor defines a list of
> subplatforms.  The current behavior is that find_subplatform() returns
> NULL and doesn't complain.

it was complaining in the past, but that was removed by

commit 64c9ae213d2ab1cce824841518e9539f597ee91e

    drm/xe/kunit: Handle fake device creation for all platform/subplatform cases

to support special case of ADLP (but maybe ADLP descriptor should be fixed instead? 

> 
> --
> Gustavo Sousa
> 
>> +		subplatform_desc = desc->subplatforms;
>> +		goto done;
>> +	}
>> +
>>  	for (subplatform_desc = desc->subplatforms;
>>  	     subplatform_desc && subplatform_desc->subplatform;
>>  	     subplatform_desc++)
>>  		if (subplatform_desc->subplatform == data->subplatform)
>>  			break;
>>  
>> -	if (data->subplatform != XE_SUBPLATFORM_NONE && !subplatform_desc)
>> +	if (!subplatform_desc || !subplatform_desc->subplatform)
>>  		return -ENODEV;
>>  
>>  done:
>> -- 
>> 2.47.1

