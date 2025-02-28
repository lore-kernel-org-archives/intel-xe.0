Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7143C282D0
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 20:07:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7357210ED2E;
	Fri, 28 Feb 2025 20:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IgqmyLUG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A60A10ED2E
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 20:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740773244; x=1772309244;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qSo+YPvLyFFTazVNZVJqjX2DuIf0xMxpjLpQMhygHmk=;
 b=IgqmyLUGINRzalcB9spgLQ6XZXYnFwvV5AAkjddyS/jwbrad6BaJkNnZ
 8oAjSzysavRF2+T3otZK7xt03FtpqHfNq/7YgAaLVE5qjpVCND0W/Rz59
 HkQfF12JNCoJdUk9d5UiAY3yTDWhvzVnvTkIHXTQs5F9y3IgOUFIo1o4i
 jXwGNK3/S189MIVusmWSAoq1M2Is9Wpn/yY35wltv40BjRjWDEarfGExu
 x8m0VDVcQTakSbhbeIOiUjgkQyCgaGztJ7BTB05HLqVnjUFmbNRSv/wq5
 DSytHcg1f8oIXNR5wkk7XwoPygvkIrTkT4Exctodh3LvhOthFKGYiof/R Q==;
X-CSE-ConnectionGUID: 9MMYUuuAQMavvyi4i8HBwg==
X-CSE-MsgGUID: FuiRdd7gTti8UJam0ju2yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41634434"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="41634434"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 12:07:23 -0800
X-CSE-ConnectionGUID: UAJhLcZBR8KBX77fZydzLw==
X-CSE-MsgGUID: VeUEgy6ZTP602FQ6MT1ifw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121556818"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 12:07:22 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 28 Feb 2025 12:07:21 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 28 Feb 2025 12:07:21 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 12:07:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJOm/ka6Gr6PZ3w/ewT3occQai3TB+9S53FFK58QpDLqrV6oQhHYOSuzTcjQkUk1hOpgBwSYehEnKzDLA3i566xKwQ0OVxTzuGijGEazKQNhDmJyrdcZABJHH6fbDV7GVvGrW4bb/WUCmmi6Ksd4HPVmTvKob4sXoR5+H5BQobzf128zfkZkNus7qQpuQ2AdDfYkzVmbD/g4D2W84I7QWvqP8c1oAfXH61eftbdRV5JsisjpOAbyM3YydycLRfXHJHxM97Tb+NDXAZ32vrsvUujUa0bpok79v4JHRudqP1cpGAG3RLvgkRJKLaB2ctaaHK35HA3P5cq+lX/5NoLJeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6UhhTtJMlpKDrtMG0lUWTXO8JCR5uR3IUSuuhviv/8=;
 b=Qksf0vRQan6FkKTSrCmzGy6+qW+14BKjJL/aykVmx/0DkqyKg8FuXemhkBo35zE9NF3x2neEzu0bj/ADKkFvGBTnmDsmtLn9sZ9203DIKkI0yMMukT9jNgi1oERGeN8BXYSlwwFZeXj99CypGzo48PP5HPMElOI1EMd30A4NW/byn69cVJdX1zaikzKFX46kzJTJXry31iY6Gg9U0052bB+MXldifsHtA24f394IQ04lEVU3q3gssVtwa9WE2pY/lsf4fyFeCyoL/29Uv8wy+cQ6VORfKcMfefejzSjOTCuqgZ3QNIfk2earClsEnIwYxROwZVA/HvPXE6I8htoc7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ0PR11MB7153.namprd11.prod.outlook.com (2603:10b6:a03:48d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 20:07:16 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.8466.016; Fri, 28 Feb 2025
 20:07:16 +0000
Message-ID: <cabf54e6-c523-4a0d-b7c7-00280d9748ea@intel.com>
Date: Fri, 28 Feb 2025 12:07:15 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/vf: Set submission version in xe_uc_fw struct
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>
References: <20250225132337.6508-1-lukasz.laguna@intel.com>
 <20250225132337.6508-4-lukasz.laguna@intel.com>
 <f42f1fb1-9cca-429c-b232-1dc2984e04fe@intel.com>
 <91ed57cd-f17a-469e-9bef-fd43f2894e39@intel.com>
 <058ab253-3ed9-4a1a-a23e-c75282ec1069@intel.com>
 <62e7b237-e6c9-4022-a83e-4d77584f54b0@intel.com>
 <292e7fb6-1537-4ae1-9685-00b0f8096718@intel.com>
Content-Language: en-US
In-Reply-To: <292e7fb6-1537-4ae1-9685-00b0f8096718@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::30) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ0PR11MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: fd4c1ba4-508d-42aa-e61d-08dd58337f9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTMvY2JCaXVmZmVvYjdqUUxrN1dEUTl4cHZOT3FKUjlnT2YyYTB6M1V3U3ZQ?=
 =?utf-8?B?SExlMXZDcUU3S0ZyWWhqMGtIVC9iUktOdGN4Zk9aRkxGN1pLRGJ0QmovQ2Zl?=
 =?utf-8?B?K01MZDlIblBuVjYxTmp4KzhtQk96L0txb0tBRjcvUzhyUE9MRWdhRWRnUTd4?=
 =?utf-8?B?eUtjY21ZQUJMclVTN2pHNmZZMnZmY3lBaVgvOXFSYnZyUGlKRVA4VDBqRmYr?=
 =?utf-8?B?WjZPcW5NVW8xUWc5L1dlR1hJOVQwTnhKRFpDa3Q3RHRLZ3ZmSEJQL3JiM1hw?=
 =?utf-8?B?MTd6WkY1ZCtwVnA2YTUyNk82SFhQekIvYSs3TGtadUNkb3M3R3M3UExXaDV3?=
 =?utf-8?B?akxIOXJTcDdqL0xUcVlueU1NSjVLMGRBVUV5a3lETnFLRTVoM2JtRkFrdTQ3?=
 =?utf-8?B?bjc5OE1wTXQ5K29kWURlZktINTRldVZlMkZRZGdMSFZ4dG9HMmcxNm1oQWhG?=
 =?utf-8?B?OUFObm5HaEZ5RkhydmR2RVFobTdKdmgzV3NPclRFTVJFNWsxSTZLLzY5UnJo?=
 =?utf-8?B?VDVYanhxemRZbUsrdXNnbFo0cDR2TzdBSWIxNHRFcThITlc3U0JFcHNaRDBh?=
 =?utf-8?B?SHNkbCtMOURrWU5la0FhbnFSTXdNOE5WdFpGcDlKdndGdG9Iak9aVEdQclRX?=
 =?utf-8?B?Z0ZrS1NrMTdDQnpRa0lEQjBKOUtSM0dsR0lkcW1DV21KejRHb25sb0ZRa0lt?=
 =?utf-8?B?ZUNXTVhKaFA3WGkyQVdqc3UvOENqQ2FsWkZYNDA4ZU1saVA5Nm56VlJhWGp6?=
 =?utf-8?B?ZkF1Q2ZMdWJ6dXhydEtzd01hUFROeFVhQjYxUVNHUGlEamlnMTdKYXlEbkVR?=
 =?utf-8?B?eEhOK0NkTmZBMDBMRElxU1VvelRhMnJ6eUVCMHFyMzZXaTA3VzhMU0tYVmFa?=
 =?utf-8?B?a3hZM0JlZUt6ZCtpdGxMRFBIWEIvZW9mdXdIMWhPMG1NTC9kNjNKY1lXMUYr?=
 =?utf-8?B?bEhHMWE4QjlmZTl5ZDh0aGQ1TjBCOHYwalhacnZoV2tzM2RyWkZaQTNhM1N4?=
 =?utf-8?B?aWt2UVhCSUc5RlY0QWVBSkJqQ2RRVlo2NUNBb3RRM1ZEdEhrVUh3dkI0WXdl?=
 =?utf-8?B?aGJjSmxjU0hYZ3lnVjZxcmNVVVJZbVUxRFM5OENpbjVDK3BVK0lrZ2NqOENS?=
 =?utf-8?B?bVoyb0draXMvbVZ6SGU4VENBVmluTGc4c1BuTTEydUpWN3Exd1hxbEZnQ3hr?=
 =?utf-8?B?MVBHMEErSVBPN3FzdUREMFBXSGdSb29DZFBBRG1QSG1XeHZXK09YamtuOWpT?=
 =?utf-8?B?SnF3MmVDVXIxQ3dpS3lOZ0ZVbll6TU9lZlozRDM4V3NKd0R6Z1NPS211QnZn?=
 =?utf-8?B?UXp1czAxZ1Q4eTdjSmVnTUxqK3JlRlBMY2dMeDBQYzJxL2F2dEJsc3hBYmts?=
 =?utf-8?B?UDdtc0FxRmxxKzVKdkhxdy9DVXR5R2xnTEUzYW1LdGNBMFlpYWlSK0FOeUU1?=
 =?utf-8?B?ajZSbEdlaEo0LzR2MGIxWEhsVFVNUm5rMXZGZTNtaFVYVmVQL2xNV2hsUVU4?=
 =?utf-8?B?Q0ZtcFNYRnlMZDFYZHVNSGlhUDFBNmRRNkhka0ROeXgxLytsV1JUMjErUVpG?=
 =?utf-8?B?dkt1RDhqL2phVDlRZktpS2VvUGI1dmZJQmR4MmdPQ3JnK2JiUXJRakFJeDZG?=
 =?utf-8?B?OGlNcm9Wa0l3RTFjYUlSYkJCVTdpTDlDVGwvdG1QZCtLMXpqNUFWWEJuUDdV?=
 =?utf-8?B?a1ZyZm44Y1JzNmMvQ1pNQVhRUWFyM0IxdmJRS01GaEJ4UFV5LzcrWWlCam5v?=
 =?utf-8?B?RzEvbWhoeGxEcUEvZ2tpUmZyZk83a2FjTnloNE45Y0hVY2todXFKZHFZU1FP?=
 =?utf-8?B?eFN3SXhoWVJYdStrYmpuQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3hDT09hNVRyMlVTNDhHemx5MXV6VG13N1pTQ3FRc2hIcmhuZVRYbXFVOE9C?=
 =?utf-8?B?LzBpdjB5SEFLcFI5M2VrMmVxTk1xTTNvQzdqbUs5QVlYanBSODdoNTlHUkxQ?=
 =?utf-8?B?bThYOTVBTTJndytzTzBITTlBbnRFQzdlSmhjckE5a3BMbG9NREwwNVoyOEJp?=
 =?utf-8?B?SUpac0ZyelE0ZDN1ZnVONmdWdmxLbm5mOHExUFNTQVdpc1J4NkxGMHJYeDVi?=
 =?utf-8?B?UUU4WGFabFpCbkwzRUp6b2VpckkwUzBjam1VVTNNQTFnTmZtMitEOFdHN2Qz?=
 =?utf-8?B?SWZvdUNGQ1J4VkRlTDZGcXR4ek9PbDgxaEtqT1Y5STZiQ015ZmtOREFZR2ts?=
 =?utf-8?B?TytwMHVyRFlnV25ld01McnpJamRNUm15Yk9NY3F2UkwxaDBtc3V6MGwvb1hL?=
 =?utf-8?B?Q1lOWVk5OHhuRUg4ZmVRR3UxR2V1OUtVRFhJT3QwSEl6eHY5OG5TVDZXWi9r?=
 =?utf-8?B?UWZFUFUxczM1c2ZTaVh2RDNscm5CRXAzYzBBd1NrcVZwTmpWdWRmV3lHQ2tL?=
 =?utf-8?B?c01TNHRlUTNFVGlYYmlwWW8xS1pSNDdSdGZaV3NzaGJLVGFkT1lBSXg0WUw5?=
 =?utf-8?B?WGRBeWF4dWFXRVdrVkVkZVd0S1lvRlAwWlNFNVhkSDU2VE90QTFEWDQ0ZThC?=
 =?utf-8?B?eWkvWWRINTluVk41NFR6WVRHaC81OWtvc2gzaDhqcFp4MlBoakxOc282c2FE?=
 =?utf-8?B?Y0krVWJTa1dMSTcrTEdTUG5nQUJLS1V0YnlvNk16eGs3VkRScFhxVHUxR1JQ?=
 =?utf-8?B?ZmErdG01UlBUeXVJbjJOQzhJb01CVVorL0xZMXZzZUFqcTZhQWV0L0JrTldS?=
 =?utf-8?B?UGtKeVdRcXRpOHBGNmxPUi8vRmxZaDd0cDdmVlAwZHJsZFhVa1lLUGpucXdT?=
 =?utf-8?B?WW5ZUkFYMzlpSWN4NFppMGpBb2ZiZ3RjNFdQVmhlOUk2ZXdOMEJRTWIrTWRV?=
 =?utf-8?B?bFZHMW44TnhPak1EZlg3UnhmNit2Uk4vUk1lSFUyVTZ0VmozbTVvSXJhNGFX?=
 =?utf-8?B?Y080TjdlcnBFOWU5ditRSGhFZG9IZ1NGTlIvRzNvdEV4c3dDU2xrdzExQjFV?=
 =?utf-8?B?R2RFUEUxZkxrN1NRdndhYjNiREtCdGxqdjJma3o5eWpIckQ2RWYxc1loZGV2?=
 =?utf-8?B?UURuOFFMNTZkS2ROb3dJd3dnbUk2S3JKZTdmamRrOXk0cktIVm8zbnVOSDhT?=
 =?utf-8?B?am1lNE1KVEtVam9EcjZkQy8rdTY0ZlNNZ0pnM0xHNzFwNHR5WGZxZDlsbmVE?=
 =?utf-8?B?YmZLMDlOK2MvV3dPYlhPSytOYjcvM0sxc0RuOUF3bXlPY3hSOXc2RGFiaVlj?=
 =?utf-8?B?b0xEMk5aWk5OcUlUaENmQTFxTlhtZHZXQTd1bDF1ZUIrL05ZUi9vb0V1VjQr?=
 =?utf-8?B?ZDhIMVM3d2VUSkpzYkJ4L1YyNW9LVUQ1VCtYVXMwY0VEdFNRUVQ4aXdGeEhE?=
 =?utf-8?B?Zy9jTkxPSHJWQ2NGWWxzWjMrbVhxQmV6cW5RelFUaGJvM3hPZTVKWTZCbXlY?=
 =?utf-8?B?V1BzdnJ5UzBvaXJVN3RSeWxrSFBYTTRmV3dmcjNxaWlmeWMzRExYK1JuM3RQ?=
 =?utf-8?B?VGV6aHBNUEZ3eFpxVFhHWWNSQW5YNFJLbzRuOHRqTjJtS283QVM4bzRWVWVs?=
 =?utf-8?B?aTZBR3NPWmtid3FlMHNxY1VNRFZRRW1vb1JqS1FVZVJyaHQ1cmhJMjdTV0pw?=
 =?utf-8?B?SUl0QzBhbXp3dHJvNFY4RHNBQXliVDFOOXY5RGNHZVN5N1c5Y3o5Zk9XTWg4?=
 =?utf-8?B?YTI5elVjci9CUm9BUjlVeDlSZ1JSanNHVHB3RDhkU1lJemJhYUJnRGZnQ2F4?=
 =?utf-8?B?VUVUaGtjQ1hGbVlnNzdINkdjWGtLcVZ3ODJQUTloU0NtMXV6UXhROHUvWUVh?=
 =?utf-8?B?a1FjTFFpelRHWnU2T0t5eXhxMTM5NEZkb3BISDBYK3ZpRVZTb0JPMktaNlhM?=
 =?utf-8?B?eWxZV0t3c2EweUVZUXdySGlZcXlUdVg5VHFCbkZIendCS2ZEMGJBWFVVSVFs?=
 =?utf-8?B?NnY2YmVUb2JMS0NlNVgvWmZBMklHd04rczVyRHlzZ1FLUTJUUVlPT3pFSWJZ?=
 =?utf-8?B?S0k0S2JHM0ZLZVdTQ2Frcmg0YzhmZWNuK0lDbUNQTXdXaU1oZEVQQ2lmTW0x?=
 =?utf-8?B?STA5ZVkrak1hck5QVHBZSTdGVE9NUWV5ZUNaWEF0MUhzdWNiV2tTL0JWQXZL?=
 =?utf-8?Q?gc2kpe96/2cjovRVKLsX1og=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4c1ba4-508d-42aa-e61d-08dd58337f9c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 20:07:16.6137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YhnrfSUmmtZ2nlViLwIAwB23V7aTok+l7D3yl6EFFvqbBurw5Qljcqo3a+psU+cEOk1H4nuCMyUcssroQfYABVmT4qWhVXQPrP7LTXCzBeo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7153
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



On 2/28/2025 8:29 AM, Daniele Ceraolo Spurio wrote:
>
>
> On 2/28/2025 1:25 AM, Laguna, Lukasz wrote:
>>
>> On 2/27/2025 20:43, Daniele Ceraolo Spurio wrote:
>>>
>>>
>>> On 2/27/2025 3:22 AM, Laguna, Lukasz wrote:
>>>>
>>>> On 2/25/2025 23:30, Daniele Ceraolo Spurio wrote:
>>>>>
>>>>>
>>>>> On 2/25/2025 5:23 AM, Lukasz Laguna wrote:
>>>>>> The VF driver has already negotiated the ABI version with GuC. What
>>>>>> remains is to populate the generic xe_uc_fw struct with the version
>>>>>> before initializing submission.
>>>>>>
>>>>>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/xe/xe_guc.c | 9 ++++++++-
>>>>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c 
>>>>>> b/drivers/gpu/drm/xe/xe_guc.c
>>>>>> index bc1ff0a4e1e7..7b38447d902c 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>>>> @@ -703,9 +703,16 @@ int xe_guc_init(struct xe_guc *guc)
>>>>>>     static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
>>>>>>   {
>>>>>> +    struct xe_gt *gt = guc_to_gt(guc);
>>>>>> +    struct xe_uc_fw_version ver;
>>>>>>       int err;
>>>>>>   -    err = xe_guc_submit_init(guc, 
>>>>>> xe_gt_sriov_vf_guc_ids(guc_to_gt(guc)));
>>>>>> +    err = xe_gt_sriov_vf_get_guc_ver(gt, &ver);
>>>>>> +    xe_gt_assert(gt, !err);
>>>>>> +
>>>>>> +    xe_uc_fw_set_compatibility_ver(&guc->fw, &ver);
>>>>>
>>>>> Why not just pass &gt->sriov.vf.guc_version here, instead of 
>>>>> copying it into another variable first?
>>>>
>>>> By using xe_gt_sriov_vf_get_guc_ver(), we additionally verify 
>>>> whether the handshake completed successfully (major > 0). Only in 
>>>> that case we set the version in xe_uc_fw.
>>>
>>> But it's impossible to get here with a wrong major value, because 
>>> xe_gt_sriov_vf_bootstrap() would fail. If you really want to have an 
>>> emergency check then IMO it'd be better to just have:
>>>
>>> xe_assert(xe, gt->sriov.vf.guc_version.major);
>>>
>>> which you can have in this function without the need for an helper 
>>> (the same assert exists in other SRIOV functions like 
>>> xe_gt_sriov_vf_lmem).
>>>
>>
>> Next thing is that gt->sriov.vf.guc_version is a different struct 
>> (struct xe_gt_sriov_vf_guc_version). xe_gt_sriov_vf_get_guc_ver() 
>> sets version in generic xe_uc_fw_version structure format.
>
> Ok I missed that. It makes no sense though for them to be different 
> types, because they're meant to hold the exact same information. 
> Thinking more on it, why does vf.guc_version even exist as a separate 
> variable to begin with? Can't you just store the VF info directly into 
> the compatibility struct when you handshake? And if the 
> xe_uc_fw_version is missing something (like the branch variable), that 
> needs to be fixed, not worked around, because if we ever get a release 
> with a non-zero branch value all the runtime checks will break 
> (because they're done on the compatibility struct, see the 
> GUC_SUBMIT_VER() macro).

I ended up rabbit-holing on this and producing a couple of patches to 
remove gt->sriov.vf.guc_version and use the compatibility version 
directly: https://patchwork.freedesktop.org/series/145667/
Let me know what you think.

Daniele

>
> Daniele
>
>>
>> Lukasz
>>
>>> Daniele
>>>
>>>>
>>>> Lukasz
>>>>
>>>>>
>>>>> Daniele
>>>>>
>>>>>> +
>>>>>> +    err = xe_guc_submit_init(guc, xe_gt_sriov_vf_guc_ids(gt));
>>>>>>       if (err)
>>>>>>           return err;
>>>>>
>>>
>

