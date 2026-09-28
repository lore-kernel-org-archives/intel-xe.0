Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B91C98328
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 05:10:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E86610E76D;
	Mon, 28 Sep 2026 05:10:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IXr0CCyj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9FE10E077;
 Mon, 28 Sep 2026 05:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790572257; x=1822108257;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=mjzXy4XTq4jaugdWeEmxVQCOOn+uxi71eZI2/+MHudY=;
 b=IXr0CCyjfGvBio+Io/aZQthgO8xhDuzuxInRUr4I1pZK0wj5L9uLYi03
 JTHTbnuQpUpFyNnnCXg7jRFmIxs3ZirEapuBCci2mTlJFDCqX2rgTh+Zf
 9vtOl0yIcznIIea0hiJgBDTeq5vfUnnaxmCc+9h/lepUS+3XPr7apbWvg
 t+HkjlVf5/f42OhEglUKjUGTLLpThczx08W0zkZVDo2V8JFUO4vk3IWIv
 B3uvPqbw9i8n/+bWFGExgb2d/0XyZ3+0+RZst6KswB4K4xWLxgT+B8k0g
 ZmhTIowfdIOmmynQ0EEXhSSH1x4GzFWieOWm+WvH8xKdzMaffSFKui9uI A==;
X-CSE-ConnectionGUID: ikrB66IdSYGyzMicN3uumQ==
X-CSE-MsgGUID: v6kPkNg1T22m+3EVt5J7tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="91284242"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; d="scan'208,217";a="91284242"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 22:10:56 -0700
X-CSE-ConnectionGUID: a/PYOU+jQ+ejRKumUmbxVQ==
X-CSE-MsgGUID: rvk5mhkPRXal30hE862Edw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
 d="scan'208,217";a="278292176"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 22:10:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 22:10:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 27 Sep 2026 22:10:55 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 22:10:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPdbPjJfsCJ2GT6BI4j1xOynO3+nz16h3QYHrcZMs3DNxymMVxWeJU9KMLTFIZ0q9976uJgouhk3T1UvsxFkM11aVRSkRpW+7/qzTePJygq7TpbUa27ZffJs1FlppNGndUp7Vx8//SB0peYviEsa7nMaLFiGLH6YcGoGdsavpyEkAbz/O6U7GSHL0cHSYDq7+u2gSsHQT42O3LcAcKIf6AiG0jPxbwH13+Eh/gw9aNH5M3wBSxOjfTSZl4J+AbLw+GQX4Ig2ee3YTJheGUBiV3QntT71hL4RIfVHIofw5ZwyCfcZrupHJ5ocPHw0zWOqoPFQ94c+bn/wm9Wb/eGqSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8gPfu/Qgnc+J6r9W8awOSa27fjpoE5AkaoULCiAGzSo=;
 b=gYKpwsAoCLaFOWcFYxIfEWpWE3wpD45or58Nv9bOXgjseF9buV6p4c8YgyUabdwPcRTErNBV0ZFAZkSOe1c4gjT9C0UK0fNMDXrMfWPl6lFMY/gkjuEeMdWhMkq4ULebTMKGaAZo+iSkEEwdCgQ95CWDn+T1FkRJHBlZXFkJN5gJ1r8L6eemRuG92IbNf0mhLG+pz7h2SSAm+6OW/EU7sFccT6imSd51RbH+XybrTD0HETALxElAmqtBzPNNF8MOgDfh7PRgZaLfRJhA0bK44YhOaOqbJO7ePTRHmM7JtB13e+MDRivy4x4dhqBygvrlVeanZi9kIgYFyPsaAYoogQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by SJ5PPF867D7FF5E.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 05:10:50 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%4]) with mapi id 15.21.0451.014; Mon, 28 Sep 2026
 05:10:49 +0000
Content-Type: multipart/alternative;
 boundary="------------0KaxMRX0bFE9Uz3W4Zrr7J7B"
Message-ID: <b57275aa-41bc-41d4-9f4d-e8c6dbf9b03b@intel.com>
Date: Mon, 28 Sep 2026 10:40:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/i915/gmbus: Add bit-banging debugfs control
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
References: <20260924152812.439986-1-ramanaidu.naladala@intel.com>
 <20260924152812.439986-2-ramanaidu.naladala@intel.com>
 <20260924153641.6B2891F000FF@smtp.kernel.org>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260924153641.6B2891F000FF@smtp.kernel.org>
X-ClientProxiedBy: MA5P287CA0130.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::12) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|SJ5PPF867D7FF5E:EE_
X-MS-Office365-Filtering-Correlation-Id: ef8b8a72-87cd-4ab8-c8d5-08df1d1edc83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|6133799003|10067099003|56012099006|11063799006|4143699003|8096899003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 09vYly/OF+Hl7R/tsR95Zx3kQAnPiTM9YYJuGqRu80fnSlQYdLCo7hYJFr8BudEaBXFe2v+j7WbX8ojrV44PesRSbO1yRTAbhYz8qUyDRK++uE+pSu0QwdSg8HGUMI++P9LX5/FjsQVzaZbJFAaHiGMqMcNSsv5kgUAHevx4y1w13Y7KZjOVVwHZef1ZgMvboqbKs/nCFUw4Z7qZIB40wzF4D2Po3M1oIrKsD9FNxhV6WxwF+Ieo5A5Ywbd7s1mKOi8k7l5Pkq9s92pmAnPzLSpu0FrkfHidAdZgvjHxyTf7xYfnlM8hlt2RDBzOeKdHbkVCPE2lnKcMPdRVw4rnqlnm/aUdwUQW0K4hQMFcGOnJYihNzQV2g5S9rdoxxobdThIx0Enad0UCuS94XNUtK17llorozyp41lJxI/umA9Rsez/PP01CoNULJ+lGY/ekDnELGLgKpGUxkeWsaDlhJPI9ES4zFUP1UBPZtQA7XAXEbtnG6m73ThYDQAU0twyDsB0ImtsbU+ziG4ATrtCD4GylsvV5bEJDl/UALGnSZM+FN/Ehdh5pk/d8Kc786uVDFbPtUct7Vi4/Pbdux8ell/zfwLS4fWzhH+IloEfwtbWic3/c2A+LDbu4r3thecn6mwlmTXhiFyyxhCI/mgrByOv4H5B7w/zbrYcl5GPlUkg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(8096899003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V214VFU3OEZvQTZRNExxWFlBdEMxZGxDVWoraHBodnlzNDlaOCtWZWJRZVp4?=
 =?utf-8?B?RjFMOERUVCtZVnRoSXI3YlQvUFMyQVh1Yy95QnVTNkFJTEd2YTFSS2lrdGV5?=
 =?utf-8?B?YmhxQ0poMVN6R1NkUHpQNXU0L0x6RjFwdjZYUzM1WU44SUU2NjdaQW9JQlBY?=
 =?utf-8?B?SHV0TkgxcS9ORFZBalJwT1JqSWlVWmhwNStWbkJuWnhLTXA4UjFFLyt3cjE0?=
 =?utf-8?B?THY2Z0lkL3RYZS9mdTZocVArYnFEMlB4SEEvbWE4NnZMbzVqbjJvbkdTV0t3?=
 =?utf-8?B?NS90TDdIWVhGdjVrZmM0ZlFLbWVWRDZTczA4OG9aY1NXZTZRbWdzVlQ4b2c1?=
 =?utf-8?B?NmFTQ1lPcWNhWnZrZ2VoMmU5T3JtYWVhdVNac2xCVmhJZVA3U3JabHJPbVZr?=
 =?utf-8?B?K1NWdGFiKzFraGRuZ0NzT3hNN0tDR293VHJUeDEyVnJJWU1NS2dlZlF2WlQy?=
 =?utf-8?B?aTJLd1hnMEt2TzJZRWljd05ZRTZIc2U1b3VVY1JvTDlJdWh0ZHRSZFE1UDhD?=
 =?utf-8?B?RTlQSGFtalMvWTEzR2JlTllWNWdSbUhFQUFUeFU3Nmg2WXhlNFVjNEUrdDZR?=
 =?utf-8?B?Z3BoaWNaQytNS2txSnZFR3ZFVDR1VzFRWEVXR0lPSUZySkdPa0JybXU2THlt?=
 =?utf-8?B?N3ZQaHI3bU82a3lVZ1p0eXRvcUpDUnhnK3dkSGVST3RCWGlpWTZTRGRSV2VP?=
 =?utf-8?B?blBUWnI0endqek14MGoxR056VkZDNDBCbzg4dEg2azZURG9UcUVISk1kZXEv?=
 =?utf-8?B?MTlZY1pNSnZ2ZU1pemJQSk1DaEFRdXd0NVJ5d09lN2ExRVdEcTJRYzROQXU3?=
 =?utf-8?B?NEdxM1VIRUM3UFhXRGtpUlhzeFFObDRJUjVoZ3F4V1lycU84UlpzekZLeUNq?=
 =?utf-8?B?VTdyZjBnbUxpNk0rRS9OM2g5aGh5THdIUHdrZ0lFZHZSY2Eza3JoYnNXcXV3?=
 =?utf-8?B?TTlMdzdEbUNmYlM0a1BhTGtkZGJaM0diWHJlRTJFWEE3TVpkWHpPZnZGb0xr?=
 =?utf-8?B?clpKQnFxWjBnbXdTVjFLZnc5eUdBRmQ5NGlNZnBCZUlwRXZYWWd6M3VlbTY4?=
 =?utf-8?B?dVJwY01KR2tEOTAvVzFLeDFURUJGbitqeWpERTM3dlk3bUUzTjdrNjluQlkr?=
 =?utf-8?B?MUprY3RDaXBCZ3h4LzJDUVhON3ZQekFrbEtoamZCVnZzajRXNXgxcS82YmNl?=
 =?utf-8?B?NnFIT3J0MitVTkVsSTNsSVJmWUNmd2NaTUlkcUNHQzNBZXhXSkNMN2xWRE9Z?=
 =?utf-8?B?RThqNHhxdTMzOS9WTFVjdVg3Zk1PWmVtOGI2MThqcDdvSUFXS2VzNDNxRU9n?=
 =?utf-8?B?cmtMeERFdnZRYjdMUHFub2pDY1dIMnRiaTRoQkU4elh2VGhsZTNYNmJkeEJX?=
 =?utf-8?B?NGdxTDVBWG44UFY2dk4rVjk5TXI0bkVzYXRaL1pDM0Y5anRGd04rTmZxdnVi?=
 =?utf-8?B?cFEwQmN6dXY4ck1oVHN1eUVsNnB5cXZsV2lnRkc2Ny9Gc3NSYWZiSWtCYngv?=
 =?utf-8?B?YlZtUnhpd1F5N3JZdG05Q0J1UnlHSTR3Zis3L3Q3SFVTclRxNDVieXkyQXVl?=
 =?utf-8?B?eGVCOEExUGh4R21way9lM20velZQOEhwNkVqUUtBU2VPU3I1bmRJRWtSeitn?=
 =?utf-8?B?QkJyVlBvNi80dkJxcVhjNVFnYzh1blNPQ0g1TEI2YjVFbXBsblBzM3FUazFw?=
 =?utf-8?B?Y2w0M0Rtcm95cTlSdkxwVlRZZWhQdmx1a0dqdWRqRmQyUnZDMGVSUkc4TzJ6?=
 =?utf-8?B?K3RHaHU4VGEra1o5d1EvZmhCOFpEeDlsOUIvanVrVUNPK0xiRXk4Q1JuTjdF?=
 =?utf-8?B?aFVTWmN1c0p5RkU0WlhWdFVZbjJKNCsrTzhWdWtnMlZKNHFIWElxMjIyYWU1?=
 =?utf-8?B?VWk5Z1FRdWExWUJsMVhJclVFM25pQzFOQU1TdlViSHJ5R21uUS9NemhlWXVk?=
 =?utf-8?B?d0xuUndXcTZPcjBIVityTXV1MFhUeUZaaElmTk5sak5iNFVoSjJ6VUpHTC85?=
 =?utf-8?B?NGxYWlIxRzRUeGlMcXdyenNUZVd6MnlVVmtkYWZiYVUrbzkzMXNpTDF0cisw?=
 =?utf-8?B?d3E2RDdkNHB1R0lSV3d4WEwvY3lCam1IVEZDeTlnLzhWOHphVzZ0T2c4N1B2?=
 =?utf-8?B?VWhQT2ZiQjZXd3hhOGNGOTlwbXVLR2ZNdU1xZ3FHWk1JelZBVVdyWmFwZzg1?=
 =?utf-8?B?NmVnYkRWRlUyUFlTTU8xeHFSejc0cm9YVHhLdWppQnAwS3BrT1lzdFFwaHcv?=
 =?utf-8?B?KzZQdmhxbzdENnlKNGovdFNJZTdNZURzYlFlMnQrcVhzemVHK29OOTF1aGgz?=
 =?utf-8?B?eFdrZzFsQjhBUHA4UXJsMXlEUmQyZjN4YXRySzhocGJqa3dPVUYwTE45RHRh?=
 =?utf-8?Q?djgRqmQ+mlwvk/V4=3D?=
X-Exchange-RoutingPolicyChecked: oIOsZf4+un16+0+K9NBXDWhYY/IlP2rGGhpoA+vry2CUfKjpYlX7DxdSQmtSHDvHjy7J7MNY+sSEtAAHl8aobS6N1HNSOzGEPWi5rpti5vfZHFdKBcmX0DwRzexVCfA/oMCsHG9PExu0Szc4O4NLxlTHDLphRvGiWkP30r6HWOMpl1jDIL70wU3AqwXkePs4VHqkW1Zf+r5ioHNy6SxA6gnoHR1Is5RMoa7iTAFoYB5zCXb4IOttt+0tyL73VDqYzv7bWH5sUXHuISU1P768iiQM1lRAjsuSMr6N1gilSxHdnL9/6q+GTYbKAmvpJ/0Ohwpj1MbyliMolaI6kYvitQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8b8a72-87cd-4ab8-c8d5-08df1d1edc83
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 05:10:49.7539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hFBJijv+e5rokdW+zuxvVYSpcXGp3IHa7YAaai9GBzmLpJFIidC2K58LdDu8VLTIq4d8FkoXuz5NyAvfplCIy5r9hTSUDnqCkvP8sZ8ZhQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF867D7FF5E
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

--------------0KaxMRX0bFE9Uz3W4Zrr7J7B
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 9/24/2026 9:06 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/i915: race in debugfs write causes force_bit refcount corruption
> --
>
> commit dbe416d20c046e80d3b0b6e516a640339bbbd1e9
> Author: Naladala Ramanaidu<ramanaidu.naladala@intel.com>
>
> drm/i915/gmbus: Add bit-banging debugfs control
>
> This commit adds a connector debugfs interface to enable or disable I2C
> bit-banging for Intel GMBUS adapters.
>
>> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
>> index 60a70dea5d856..38d6d11483994 100644
>> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
>> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> [ ... ]
>
>> +static ssize_t intel_force_bit_banging_write(struct file *file,
>> +						     const char __user *ubuf,
>> +						     size_t len, loff_t *offp)
>> +{
>> +	struct seq_file *m = file->private_data;
>> +	struct intel_connector *connector = m->private;
>> +	bool force_bit_banging;
>> +	int ret;
>> +
>> +	ret = kstrtobool_from_user(ubuf, len, &force_bit_banging);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (force_bit_banging != connector->force_bit_banging) {
>> +		intel_gmbus_force_bit(connector->base.ddc, force_bit_banging);
>> +		connector->force_bit_banging = force_bit_banging;
>> +	}
> [Severity: Medium]
> Is this state transition safe against concurrent debugfs writes?
This is a debugfs-only control intended for user space use. We generally 
don't provide strong concurrency guarantees for multiple user space 
writers racing on debugfs interfaces. The actual GMBUS state changes are 
already serialized inside |intel_gmbus_force_bit(). |
>
> Since this read-modify-write block on connector->force_bit_banging
> is not protected by any locks, multiple threads concurrently writing to
> the intel_force_bit_banging debugfs file could trigger multiple calls to
> intel_gmbus_force_bit() for the same state change.
>
> Looking at intel_gmbus_force_bit(), it manages bus->force_bit as a
> reference count:
>
> drivers/gpu/drm/i915/display/intel_gmbus.c:intel_gmbus_force_bit() {
>      ...
>      mutex_lock(&display->gmbus.mutex);
>      bus->force_bit += force_bit ? 1 : -1;
>      ...
> }
>
> Could unbalanced calls resulting from a race here cause the refcount to
> underflow or leak, permanently forcing bit-banging mode for the adapter?
>
>> +	*offp += len;
>> +
>> +	return len;
>> +}
> [ ... ]
>
--------------0KaxMRX0bFE9Uz3W4Zrr7J7B
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/24/2026 9:06 PM,
      <a class="moz-txt-link-abbreviated" href="mailto:sashiko-bot@kernel.org">sashiko-bot@kernel.org</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260924153641.6B2891F000FF@smtp.kernel.org">
      <pre wrap="" class="moz-quote-pre">Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
- [Medium] drm/i915: race in debugfs write causes force_bit refcount corruption
--

commit dbe416d20c046e80d3b0b6e516a640339bbbd1e9
Author: Naladala Ramanaidu <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a>

drm/i915/gmbus: Add bit-banging debugfs control

This commit adds a connector debugfs interface to enable or disable I2C
bit-banging for Intel GMBUS adapters.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index 60a70dea5d856..38d6d11483994 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
[ ... ]

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static ssize_t intel_force_bit_banging_write(struct file *file,
+						     const char __user *ubuf,
+						     size_t len, loff_t *offp)
+{
+	struct seq_file *m = file-&gt;private_data;
+	struct intel_connector *connector = m-&gt;private;
+	bool force_bit_banging;
+	int ret;
+
+	ret = kstrtobool_from_user(ubuf, len, &amp;force_bit_banging);
+	if (ret)
+		return ret;
+
+	if (force_bit_banging != connector-&gt;force_bit_banging) {
+		intel_gmbus_force_bit(connector-&gt;base.ddc, force_bit_banging);
+		connector-&gt;force_bit_banging = force_bit_banging;
+	}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
[Severity: Medium]
Is this state transition safe against concurrent debugfs writes?</pre>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>This is a debugfs-only control intended for user space use. We
    generally don't provide strong concurrency guarantees for multiple
    user space writers racing on debugfs interfaces. The actual GMBUS
    state changes are already serialized inside <code>intel_gmbus_force_bit().&nbsp;</code>
    <blockquote type="cite" cite="mid:20260924153641.6B2891F000FF@smtp.kernel.org">
      <pre wrap="" class="moz-quote-pre">

Since this read-modify-write block on connector-&gt;force_bit_banging
is not protected by any locks, multiple threads concurrently writing to
the intel_force_bit_banging debugfs file could trigger multiple calls to
intel_gmbus_force_bit() for the same state change.

Looking at intel_gmbus_force_bit(), it manages bus-&gt;force_bit as a
reference count:

drivers/gpu/drm/i915/display/intel_gmbus.c:intel_gmbus_force_bit() {
    ...
    mutex_lock(&amp;display-&gt;gmbus.mutex);
    bus-&gt;force_bit += force_bit ? 1 : -1;
    ...
}

Could unbalanced calls resulting from a race here cause the refcount to
underflow or leak, permanently forcing bit-banging mode for the adapter?

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	*offp += len;
+
+	return len;
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
[ ... ]

</pre>
    </blockquote>
  </body>
</html>

--------------0KaxMRX0bFE9Uz3W4Zrr7J7B--
