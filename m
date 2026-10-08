Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F1ACA6007
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 13:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA97710E88F;
	Thu,  8 Oct 2026 13:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QPsvXc4r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD03310E88F
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 13:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791467976; x=1823003976;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jrO9R2gYxT3AzVgPkQlzv6LUFuKxnSO/xl8ixVsW2xc=;
 b=QPsvXc4r8RlXIYYn4qNl9H1A76ZTuyjkls2tdTWQU30Igy0hZ28Quux1
 wifl3rkr1PB47RhBEhKCXbsuG/vjx2zIS9fsp/+c4zuUi4QDDUATsMKsi
 lEGnMZWPajXIfk5Rq0+BuBIyZjadHqr4pfMdNLozQIKyDy2FbSrmGwARV
 3BsIUq8YzzHnhuaDHHHW7f5RGFwiL8lY/lhJG+uCxqYyzAnUvslDEPlsy
 njP5txM4FM4KuS9SWtDrx9+NgBJ3BFn3OgvqTwVgKkpkmDnGp9gihB005
 Ndwd27YtIyhq8ckFemmc1OMqKNEd80rYLkmDf+c/De+sTl8rI35NMnTaj Q==;
X-CSE-ConnectionGUID: CAA1vMonRkyn2fc7CkH7Jg==
X-CSE-MsgGUID: yRuINJgkSlubFJtgBxFc4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="135649"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="135649"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:59:36 -0700
X-CSE-ConnectionGUID: DfghfbPwRbiGxezvNTZoWw==
X-CSE-MsgGUID: 2lAf0KfIShijgoEa0QK4Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="155552"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:59:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 06:59:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 06:59:34 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 06:59:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrDhonim5D6WPoZLdRzhtPSMBUMWi/kO/I3eeYVomctfdYpQNw8/ljtA/sO+8a1r9dcndcQMppUQzxLFOzRDlWV146TcBPFBj0Tk3FHd8PIk0zqWMJDqiJMuBYObIWd5J9hjjQC+cn4ETUEkoFGoYpJt5TFQq+XdlnBPVbz+drGvYqvXFIM9TJ4ZWCQjSOHgTaumoeEJrcJCDGKBxBygQM+mGsnvPLltT0r4JLqFj8HlmiIYTv72zPCR2YHM6fgfYvvrIjLySgGYeH82VQ6mHYtJU4m2+KgX1NWDv7JDtZxZCP5DF/VRDQoqWa7O1jEzP8tsuLM1AKjLLi3s4jnFQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qy68uI7U/V6klFEEATqwWIx1QwHnj+457nmKzusNXU=;
 b=aqXOpZpCRhi9i8JZ5XE35Ha02yUsWh7yGF3sqVs4VULa4Br+b01GHVCvBVvPbbHojzLXZixaU5aqU+Qvj2lAZrecqhy34wcNZwizC/sJwSnckRaabyYd+PMHE+dUIfBBOVtqU2Uk7WzI9LilisNim8VZiWOupdfKcZuGPNdqKMbpb1PEiB3Pv6OMaJLL6zSNNeZ7GWHccObCD6qhHRisKKO0ey7CxXF+P9QGWXXjPVb+F3aH9m19hIYev3FJeO6aw5K1K7NQtLx6vvbBkHSEWAyoEYpJ9nCYcxQUpYZkkYv/iktbLkxFe4Fa7Z1LV/9GXIwRgv0aBAKlX4rkpB3gRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by CH9PR11MB9928.namprd11.prod.outlook.com (2603:10b6:610:342::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 8 Oct
 2026 13:59:32 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0472.016; Thu, 8 Oct 2026
 13:59:32 +0000
Message-ID: <dd9856ae-a088-44fd-aca6-1fb3f2fea15e@intel.com>
Date: Thu, 8 Oct 2026 19:29:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/12] drm/xe/log: Add VRAM, PAT, and HWMON
 DRIVER_HARDWARE components
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20261007211417.2093611-1-dnyaneshwar.bhadane@intel.com>
 <20261007211417.2093611-2-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261007211417.2093611-2-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0167.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::14) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|CH9PR11MB9928:EE_
X-MS-Office365-Filtering-Correlation-Id: b9cf761d-8bd8-411d-ca80-08df254460b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|4143699003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: E1sfsc9gxomQQ1Y3BxOvrjAYz31YgdQRor5LpwLjnI549CRObWJ2vrAkoudXyGwlpHZ17NTBj4CccXCOGZcGtgHNyzHLrAewXEGLbeZKmM2xItRhypE3HvXRwVuUf/DQnNSWt9IUXlVo6RyCy6NTpOpG8fLgEMvJnZCJcYoUN49Ricb9r3CY/TJVEEmOTzU/yo40cLFUjgjCaPJUjwY06BxURDrYgYM9+VAFATBAFL0ALkaC46zqIFI1JW6i3fetePi/VSnH+HtIEBnzhW4v7q9c8lCIkGYduV6bvcj6PycVVuKrnGUvEiU4vIkwB+Ykw7JOFtktLI1fqeF3H1TExWyWuQUg7lGW2n6nt3aWbKOCLdiZycfYRAPXqKmb/HaekyT6FIHB+2jl8j0LJJH9rblOsXO1jf41N9JPBa2T6r0qJuTvSVoORAkzdwB2NeRIaJ7y7KSeWYHiVzDSyFfgEIzpUEmqnWXK/TWdUHXz7lY05pIbzIMGpr1Wg+8shFbyUDXhe8isteELaSqzTSzqJKtbyL+68oJJbE9oUQQkRu/8BZ5t/BSNTSIzHVhqqE21yHSO2iwE8Vv70EilACoO3mbET86ps6NBeblAANbmYFa6lJ736MvrSTGQPeBmfK0pARDEX7I1cZDeDkNn3OmDpD9I0h4d8VBHvP1mNYJzf9U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(10067099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlZCMGplRmVaZzZBVURJM3h6RmFOWGc2Wk5SL1lXQUE3Z0wwMFpVVytQajY3?=
 =?utf-8?B?Rm0yV2hrdlNvbVJNNkVFSTc2YkNmY3hkRVpTQWJzbnpDRG9TZGNkQm5Qb3Yx?=
 =?utf-8?B?c2VET2RySkRWVzg1ci9hb0M1aXA4ZkF0Y1Uwb3QvSlFweXhOMzlkWmVZa0VB?=
 =?utf-8?B?TU8wR1drQmdXby9kaytCanZxNUVKdGV1Z1pheElBeE9vQWZyUUhsUWlyTE5z?=
 =?utf-8?B?SlFtOHU5Q1dsTnprR01jVFpMNE9yaVRPczE3QW4waHZFNU5tcVIvc1FaUU1C?=
 =?utf-8?B?aWhFcEMwaSs3U3RVb3J4SVFkU3phS1hTL0wvL2pKRlJjSDlmODZiSWVlMVZ4?=
 =?utf-8?B?MytKN0FQaVRiYXh6U0NuT3R5VnNFNlp1U2ZyTXBiRExIaitCdCs0cjVqSEQ0?=
 =?utf-8?B?Z1BqSkpjelovL3l1Q1ZHOEZBWUJnbDEyaGlpaUtJamdQcWVNdU4wSmc5bm9r?=
 =?utf-8?B?SW1ZM2U5NzMzSlRrOFR5bDZITGZaa2QvVUQ5eHNtNGthaU5rY1ZiM0hRanc2?=
 =?utf-8?B?Y3cvREZ5VWRvVGZLNzYzNThGZUZpUFhkQXlPYzBSZU45VFMzYWZ6UkhadEMx?=
 =?utf-8?B?MGtUcTFicE0vQW5sQ0lkdnFpOWtyeTBHVFI5M1ljTWg2cGRVSUdicFEwZFdR?=
 =?utf-8?B?aW1UbVJDakhzV0hmdVQwdTU3NUhGV21jQ3QrSFhWNDBlcERpR2F2QXQxY2hS?=
 =?utf-8?B?aXZOZDEwZ3RYcWMrdVZGSUVyTXlWeFhGK0kySHVXUjV0OUdodFdSbHhublpG?=
 =?utf-8?B?WjVJcm90OG1Jd1RtTUo1Q01sQTJNUzJkVDRZK3UyT1hnc2xNUUZPR2hzaHlo?=
 =?utf-8?B?YWZNNGRob01DNS9jQmdSdTlKWDR2VU9MY1hTZUxLcHdPVy9IMy9XT2JxZlVJ?=
 =?utf-8?B?dmlpWjlGM2Z2MzM3YjU4b2hhTzA1WTBYdmpHWi91WENzRXlFZ0FDUm9FUkNU?=
 =?utf-8?B?VUdNOXdDOTVjTytra0ZLQnV5Z3RKbER1T2h2TENNaUp1clhHZ0VONG04RTZr?=
 =?utf-8?B?R2Q1aGppMXk1ZDVZckJzSyt3SWVXaGxmOThaemVabkRUdkJHWStCS3JjeDlG?=
 =?utf-8?B?STZtZmh5NXAwZ3hoZWVROEZtWTBCZUdNT3JJbHFjb1dnQUdxY1Fkc2RxekIz?=
 =?utf-8?B?aFZsc0ZwZGIwdGNvT0h1VnBGWm5IcG4yK25MSitEUy81S3dqbVBGTGhBQnNG?=
 =?utf-8?B?Ynhzamk1c1RxNXN0eXJCY2MvSnd6TWdEREVVRU9HdlFjeG5Dd29mUFBIZTdI?=
 =?utf-8?B?enZyRFRGSDQvK0REYWVKcUVWVDNGRGM4M1VacmJYTzZPbklCYWt0eGluRFpj?=
 =?utf-8?B?UW5XZWJiTWQ2S1p0R011UUFmQ1ErWTRyUjBXSDJZdlFsMmRhMFIxRXNpZjND?=
 =?utf-8?B?aWU1ME1EMEJKYnd2Tjh2T096NWRZa1BPUHhNcWNaMVVnYzRtdTl3bU54S2dD?=
 =?utf-8?B?Ni9ZUkJNeE1Da1lQVWJFYk5QQ1h6NGpVcDZLVnFDZ29QUXRUZFdFRWdoRjE4?=
 =?utf-8?B?WWJteExIdUZodU5WVlBWMTMxWEI2SXN3T09jK3JKMWtHRE9VdzBwYnRkQnpn?=
 =?utf-8?B?cE0xK3pLMVJYQlRsR1RpRUIvWDY2WjAwWS9melRyNkpkbzJSZEVLdkYyTE9P?=
 =?utf-8?B?U1BkNFR0RlVCenY5YS9xNXJCNkRmNFNwTm8vSzl5bDVPVEdGTUsxaEpoa1Bm?=
 =?utf-8?B?bGZxbC9wYWlHeW5NQTVwblFoVVJnTmFSbVVFVGhkZEh4VlBjMXlmR0M2Ti82?=
 =?utf-8?B?RnBBVUdxZEVVb1l1eHlTVVBJQ3dnQkZ6a1dodDY2RGdEaG9EOVV2NFc3dHpW?=
 =?utf-8?B?ZnNLc281V290T1A4NVdiM0JpckJqNklEekZVOHN3UFJQUmltSGxzUERJWVY2?=
 =?utf-8?B?TlZnVTh5UTk3eDRScUY0cHI2dzdnMitSZUZrVUtBeFpzT1ZBZXg0dDR3Yjhn?=
 =?utf-8?B?cEtaZ3dXZ08xT25lNkU5LzVNUEJWRHJVQjRKVDFnVWNraFovendjcitpVFdH?=
 =?utf-8?B?UGRnYitKc0w4eEFYaE9rZDNEMS9XRDJKVjZkTlpRRVZEbHNpbExRZTczVnQ2?=
 =?utf-8?B?THovU1ZSaGo0dGZkNHk1NEhPbUhrZVJsMUhiQnh5QnVCNUtJTFVEUjVYai9B?=
 =?utf-8?B?VFNnbWJMZGptdEdQQ29XT3JhSmQvRVo2bEhxMjR5K1RYNFFjSCthNTlwWU9O?=
 =?utf-8?B?bGlVQjF0UGd6S2xCdGFXZ1ZnTVdZeDBja1gzMElXWU9wVVRTM2ZHdE5XUkhw?=
 =?utf-8?B?enM2YitwakIyeGhFUy9ZY3V4ZmtzTXpScW95L1NTMFU5cHdUOVdSeVB1S0lj?=
 =?utf-8?B?QlBwNVBhTnoxWlA0ZGZ0RTlyQllRbGZPM3RWTERyR1JaL2dkSWZBaGJ5anQ4?=
 =?utf-8?Q?p94Qp7Moq/icLzqU=3D?=
X-Exchange-RoutingPolicyChecked: howCiR4D+Q172gBfb1qd/T+GloFqXCD3ITDKBPyYT45rH63MCZwokagnIB92FUdZkZklTH+YN+b8s5V3FKEqgS47AlYlalTfFjoCVVIynpAaPPBnN09k9GSmBVsqlKf5uwdW86aa5ltH0QHX/viadOONBqV8JB3Gydt3lSpz5Rf7h1FD3lye1a5PYqbNVBDke/NwmAbDBcNX0+1/sTW5run6z04/9q6So/qq5Eu73lyF0IriCf4Nl1aTwVzEi/91Gaw4C3KHbE4UdwdNxiECe2KD4EAAG5iIVnMHxEwwralbcyEkBsQx0fbCL+tOh0sHExsy0DRQG+ge/3+nayp3iA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b9cf761d-8bd8-411d-ca80-08df254460b9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 13:59:32.4081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gkSJVymT1rRjzbzZZOLDFInKt6fFqSzZCocngVgRhNa4VqjCyxFRB+LlwvSsNQKkLj2VCy90biOct9MTNrdmo/aljDwTd5GQwPoQR1OnL1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR11MB9928
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


On 08-10-2026 02:44 am, Dnyaneshwar Bhadane wrote:
> Register new DRIVER_HARDWARE log components for hardware I/O subsystems
> that currently lack structured error reporting:
>
>    - VRAM (ID 6): Video RAM/Local Memory access and BAR visibility errors
>    - PAT (ID 7): Page Attribute Table programming errors
>    - HWMON (ID 8): Hardware monitor registration and sensor errors
>
> All three use IO_BUS as their default SIGID since they interact with
> hardware through MMIO or PCode register paths.
>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/xe_log_abi.h | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
> index 526aadf85fe9..ef45c3a9b414 100644
> --- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
> +++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
> @@ -151,6 +151,9 @@ enum xe_log_location_bits {
>   	define(DRIVER_HARDWARE, 3, GT, GT_TDR, "Graphics Technology")		\
>   	define(DRIVER_HARDWARE, 4, LMTT, IO_BUS, "LMEM Translation Table")	\
>   	define(DRIVER_HARDWARE, 5, MEMIRQ, IO_BUS, "Memory Based IRQ")		\
> +	define(DRIVER_HARDWARE, 6, VRAM, IO_BUS, "Local Memory")		\

Add Video Memory/Local Memory

With that

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

> +	define(DRIVER_HARDWARE, 7, PAT, IO_BUS, "Page Attribute Table")		\
> +	define(DRIVER_HARDWARE, 8, HWMON, IO_BUS, "Hardware Monitoring")	\
>   	/* */									\
>   	define(DRIVER_FEATURE, 1, PF, SW, "SR-IOV Physical Function")		\
>   	define(DRIVER_FEATURE, 2, VF, SW, "SR-IOV Virtual Function")		\
