Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36027CD4F2F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 13:41:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A3010E816;
	Thu, 13 Nov 2025 13:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rrr7mP3f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B7110E816
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 13:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763041265; x=1794577265;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=4f+5fXScbk7samVo4UlI8XFK1HSPlTr+xTuaRWH1bKU=;
 b=Rrr7mP3ff4Xf4/ZIesFKrqnbAwDIMM+Fs1wwufc9ggIS2P9BDq59tDRS
 b+h/PxF28cRjp1uQJmNmx901kFdcR369E0KoEU2bTVBBweDSCnWvKfisz
 Sh9cnVijXPtOjC8KW9n3idGuRIMri7L2Kwlp9MbekrhErddq6IpU5W7tM
 jcj1l3xNavsLM/c6v89aTD6i9a2hPUO3/yVh+qAD3m2bfvbO/tqhRamJq
 EdpF/AQ0axVog9H+Co56o6fm2rfg4kBhgCMuAuXYjU6FMuU6XJgQV57TQ
 110m3az+61MqruYIDpLDgTAvZSb8dcMb27oiLl0SIqvyRwxtwZLw3oDbt Q==;
X-CSE-ConnectionGUID: EzAkH1XoQHGuU7rKUHvlBw==
X-CSE-MsgGUID: GN7lW6D/ReKx4qJwbExa1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65158553"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="65158553"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 05:41:05 -0800
X-CSE-ConnectionGUID: GLpVj+kqSb+HB0jBeLe2+w==
X-CSE-MsgGUID: nKXcMYfbSn+P8AfX0JfLqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="189772766"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 05:41:05 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 05:41:04 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 05:41:04 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 05:41:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQaPH+J1ihbR73Q5elXFrIHxOE/k2KpRmQAi2LuBfXY0qIh3GAzHxlAYoL7ef/tqX9KRT7fobtsPUl/C263sJTRxyttCNzefkF85HxhdOCLWGMM3WINwCl4Cr64BQq3MiWWLw0HuTrO2TfmwGzWF8SSH+s1CBv1ijnh9QUpspcYwIgsuiLIxF+7aUDSrvYvrTs+2jFekvRk4BgsnSdV86Q2gAP28vT/M/lOSnjZEtGFjLu721Roc9tLBGSjLl2cpcMQQzf1esuQAZWCNEsaLcPftXE+4fZEQmlEl+LSmnBI4Lvyl3p/sa6GOdXkcMcYeO7ojgKjU7herfBkbsv8Rqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0NVxTQiMpEetDI1V2vnGjAB4RdEpncSskcQyaFbpiGg=;
 b=RNUtv6/dqUjjMiqBLJra4s+9Hc76uR984/1ZC98mXGNA9QHbkI+wQA/dpBbHRdcrR/jdCEn2QK6ci7Cl4YW0KHhXZt/LwBvmHM49O7ZrRf+VolBCDTlZ/e0tDVLoAVsF7ZRyBGOegHj79gZvVrr96sTkKZQCtqVXz6MkOD/ib2dWMutzDgChc1xxuO5qkHm7YcJS0vAz/QVW61gzdYW4bR+q/0t0/oOTIeECHkvn0mskaT0Mw0IM6CCw6MHCcAmvl6Gw1s7HJHJoOzfeHjRBHed/4HOIVFC4xN5AX3/DZUqicV68pAVdG/Ellmz6EycAhsH5CWjWy0tARJQr6j791g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CY8PR11MB7924.namprd11.prod.outlook.com (2603:10b6:930:7a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 13:40:57 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 13:40:57 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110232017.1475869-44-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-44-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 12/30] drm/xe/pxp: Use scope-based cleanup
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 13 Nov 2025 10:40:39 -0300
Message-ID: <176304123951.3698.6745332835580573152@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::39) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CY8PR11MB7924:EE_
X-MS-Office365-Filtering-Correlation-Id: eebbdbac-4160-4992-7b17-08de22ba4627
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXdzQVFEVDU0K1dQRUJ4Y0xZWlJDd1lMU3ZJUVpkUkZSUTdweHFvZkNLazdm?=
 =?utf-8?B?NVpFQVJzTzR4aHhtdE9DOFZuY21oMkZvTWhydFFoSUlzU3ZiTkZmQklDQ3NF?=
 =?utf-8?B?RDh1cXdXM1BLWm1XOWNqTkJrbEFsOEVZRGc3VjVLUXdoYnp1R3MyUW5rZHds?=
 =?utf-8?B?OXUxWjlXRkFhMzNOMDVveUtSS1FyVXJtOFlkUURyQXkwd21LazhRdHU0MnRT?=
 =?utf-8?B?UFlWK1dTajNwaEliV3BGaWJVS21qWFcxZjR6UVhkVk5SM0RyN3E1TktNc3RZ?=
 =?utf-8?B?NGpNT2swbFlIUFh6YlVmMCs4NUdOZFErSkRVQWsrT3EyREtDekhvT1daWkZR?=
 =?utf-8?B?SGxzQXhvaXhpblpQOEtnREFEdW45OStoVFk2Z0I1R3NreXlUMkhtcEIyRmlJ?=
 =?utf-8?B?SHlhdit2RmpoZnlhSTRidWY1LzFCM1BsMlRGNE9CWVFNSk8xNnVHY1U4SVVF?=
 =?utf-8?B?TkFaZTlsVDdhRUdhako1VThacWRmc1plaVhZRWhHUkdmWkZyV2NGdG9zYXpC?=
 =?utf-8?B?emhLNXRCVnFFRVg5U21HblVveTUvOHE0WS9pK01CeStITnBmVFFWOEY0a2dz?=
 =?utf-8?B?c1ZZdU4xOTBRbW5icnUveTY1ZFlVV3JQdVd6ZUtHQ2p2ZWxzTjZyanhURDVL?=
 =?utf-8?B?RjIwQm1SMEgrUkpZK2lOekI4LysxK0FRN1pPZ3hZM05scnJrSnJUci9DTWVl?=
 =?utf-8?B?cldISjRxbHEvTGxQWnRhd2JqclF4aFdFZGlXRDdMTGY3Ui94dG1TUzV3Z2Zj?=
 =?utf-8?B?Nlp5Uk1VNCtITnEzbkpvSjdLQ1dIMWVYMENSdEFXTzZKdnFnOGdlb1M1bWpU?=
 =?utf-8?B?N1BUODdSWjRCcit6ZHJMdUpaekRZcDR6K1d2MkxWdHNJaU1iS0tteGo0ZWNl?=
 =?utf-8?B?ejFVaC93ZUlpamtZNGFXbHJFaTJqZGdtUkdJRzZuN1A2Kzlyc29tWTlaNWtO?=
 =?utf-8?B?QjRRbXE1TFdhM3BQR3NRUjFQOUJGTzdMcHBFMUxKU1ZpVmJidTJmTWVKcUxv?=
 =?utf-8?B?RDhXaktBNVNud3JBRjJ0eUlzNnpEbGw2YVpQSjM0M2M4VkV4ZFdBN2RmMU1H?=
 =?utf-8?B?S2R0TnVvbjRxcVVVQXhCSkVmMThyY3Njak5yMTBZM2lWMzVWcmhZVFJxNmNX?=
 =?utf-8?B?cWorMnZ5WTgraWZWVXNPOTdaUWFkUnBBTy8rRjZlVXhEd0EvNkxFNkNzWTFk?=
 =?utf-8?B?bEgvb0grQ2NFaFQzb0ptb1BVMnJsR1B4dTVwUVN3dzc1ZnV6N2ZGdjZ3dFAx?=
 =?utf-8?B?RHg4OTBIYXRVZTZhRTc0bkJMMTZIaGcwUVB5eXcyY1ZVYitxUnVkZ3ovajdQ?=
 =?utf-8?B?Tys4b3J3MWxmMld4MWhpeWV6ZUx0MUFEbkxpaXY1bTVtQzEzQVF6N1FySjFM?=
 =?utf-8?B?NGxwNFhpOXU5TG1Cenp2MDkvUzlMWGttVXMvelNwYTRsZE8yR3I2U1RCeUZw?=
 =?utf-8?B?NldEdkQzZDF3NmlXWk5QY1RtUkNwU3k2aDVGalRjMlVSTGRxdGQ1Nkx1NHZq?=
 =?utf-8?B?TlJ2Q21RZXdOOW54N1NCRFQxR2NxQlBMeEZUM0RFOE9sakZkQ1BmSkw1MXFl?=
 =?utf-8?B?aTZQVXU2akFSdnNhSzFxZjJmYlZJWFlTVjV3Zm1tdnhaWkFHM2wreDBhR2k5?=
 =?utf-8?B?b01OTU83RFN3djFwbVVhdXFWNTN2enBTcEpEQ2F3aTAvcmZmeU1TM1FiT2dM?=
 =?utf-8?B?cWZxeXZ3d2dRdVkxVlZUTVpoTk44NFVKS2RXaWhUcXlSdlY3MjhTMDZmYXRl?=
 =?utf-8?B?OW9aejlkb1FHYS9TTGR1NVhxUG5STGdDdUFuNzFBNlkvMjhjd2cxOTdjUUh2?=
 =?utf-8?B?L3lrTVZaVm1vR3plTzRZVjdTU3NNbzdhZmxpTnhmcWFSS0U4MTlzcE5tME5t?=
 =?utf-8?B?ejIxcTF6bm50blJ0Mlh6NnRYTnBUR2lPdFJwbEJZbmdOY242cURxTitwUG5W?=
 =?utf-8?Q?Ubii7A3h1hlqgVndfoJc0j2EuPNzvvGi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjZTWGFCT1FHZlF2Z0tnYlQwcWVHM1FHdG5UWXRpR3NlNUtJMEVhKzBQNkpO?=
 =?utf-8?B?SGhncmIwYnRqbkFTSFJid0pCeDdCNDJycnRrNWh6bmVTbjNjcGM0cVEzUXVs?=
 =?utf-8?B?UnkzSFNJa1k0cDNGNDg2ZDJLd1RpKzg2aVNHU0cxZFlaRlN6dVo4aUwyeXJE?=
 =?utf-8?B?OTdRSm9QQlV4emJPUVZtcnEvakc1RzhTR2FOR2hjWjZodUtXakJqS3JzVm5T?=
 =?utf-8?B?NGdtSW40TzVJK294eUNYVm80YlNxZWVwVVUzSXc1VGJpUWF3TzhMc2hFeFh0?=
 =?utf-8?B?SlIwUVZ6T2w3cTZwdEJjWDlTSHgrWnZuT3V1cDFlbFUxMkxjSG00OCtLcUxz?=
 =?utf-8?B?T1BLQnJXVEtPcnBhanhFTW5SeFNhQW5RdEFkN1ZtZ2c0UDZKVE9wZ3JHbHpB?=
 =?utf-8?B?SDUzeFI3WGc2Ukd4TlRXOTRBTUt0WWV2YWdyZHB6R1o0SFRXUlRYRm5HQkZj?=
 =?utf-8?B?SDZsUUVaWmVDM3EzV0lvQVYyQXRqdEJORkx3N1M1OFNMQnBkUzNJMElodk5U?=
 =?utf-8?B?clBobEpVSGh6bHRPT2R2VlFTOVM4L3Q2N0VMemdKOGpaTXNZL0NyVlhpQTd3?=
 =?utf-8?B?YjYxUGFVWC9iY3dYNlFhVTYxQkhJdHZYSUdFS1FiWjYzWXlUcUZQYTV6V3dh?=
 =?utf-8?B?cXhna29wY3FNSEJac1BIalVrcjdqT0c2a2tuZ1A0SUg1SGtUWVlMSzdmYW1F?=
 =?utf-8?B?elhBMFR1R3ExZXZGdisyMmhXSXFMbmdoMFo3akdHc0QzOWo1Q2pXUU9JUzJh?=
 =?utf-8?B?TFNVOUdmMUJXWXFyT2tTT3VRUW1mQWxJRlN0VWZoemVIc1UwSFhyWHhzL1dG?=
 =?utf-8?B?R0FFTnY1dzhSR054ZXRuUndSVlJsb08xWllwWkpNWkI4aEE1TWFaN0ltbXVt?=
 =?utf-8?B?WllZNlQ3bTljcU9Sdm9OUnVja3dsUWVxNFhGQkJQdXVESHlONGdFbS9FWWlx?=
 =?utf-8?B?Rm5qSEZrNUVFK2V5ODNWTWNTaTkrSGtrMVpzaTdZckdlekV0RVF3dVd1eG4r?=
 =?utf-8?B?VnB6MFRZcFhXNFA2RXBqUVpUSTFIbzRsTTJsSVJGQytPWlRCQ0VQMUVrdHE4?=
 =?utf-8?B?S1VPVVNFUzFmbE0zZHZQalU1VWgxTE4zdnI0aWZoRXBaa0w4b2RRUW5ER1lY?=
 =?utf-8?B?WUxFcDdzVkptR3dBTVlZaGpsaU4reDY0dzErb3NESDhndnhaRzcwLzdjWDJQ?=
 =?utf-8?B?WFgrRGxHaW5OaytzbWY0VDZkcW5zNi9hakpNSCt1MDg5Tm1NV051QlhMbHdM?=
 =?utf-8?B?MHFWVGZQMkc0dndaK3FYQnJOOEVKRHhSdTlKZkZneHdjMVJYVmJvbEZ1cnZk?=
 =?utf-8?B?SHdOdUNtUkQwSmRQVVJReE4vQVFsME53NUZ2dUdFY3F2ZFBEc09aM2gzUkQ2?=
 =?utf-8?B?WEVkZWUvRmVDcUNXZHdydjZhcUpEL1lHVUdaYzE5S0p3OEl5ZXY2ZkUrOGxO?=
 =?utf-8?B?bGFwVFlXUktTNngrQzBtWEJCbXBCUENIMGZ1YS9ZUlFiUmpQMUl4WUc4RW5M?=
 =?utf-8?B?M1p1ci9lN2d5UEhIWW41QnFndnkyMmtnaGd1b25UVWl4d0ladnpReklnV3Q5?=
 =?utf-8?B?bklHSThadFJpLzgxZDlXNURQSnZJL1RCNHRHZ3BrU1pSMnRHblloSFRPclNB?=
 =?utf-8?B?eTI5NDJmR0t6ZFZ2RmJacHVIeEdSMGkrM3hXUENTUVl4S2JwWVlkRkdKWnd2?=
 =?utf-8?B?eCtrWHZHWk0ybEx0Q1BERnRwQmI4dUJTbk1yTlFNMXozQXBwYmJiZjM0QTd6?=
 =?utf-8?B?TnM3WkxPY1RUUWlKdG5sUHdQRUt3THM2RzNXamlzK2FRZjZUUWxMMitMclNU?=
 =?utf-8?B?S0k5SXBwaHB4ajJiRFNlTEJWVUVhWHFLaDdUYlczYmZ5U1hXdUpOakxTS2Na?=
 =?utf-8?B?V1NWUUlYQTNwSCtsMjFTVExEcUFaa1ZxWXJXTmJOQW5iYlZRbGFSWWFoWlRB?=
 =?utf-8?B?QllZRFl3aXNWNHcrM3Q4NVd2bUFzdFdraGVsMU5venVpNFZoN0RYNlhZNkhC?=
 =?utf-8?B?TlZwcWxadys2NUhaMzdBUzcvMnF6VnJ2VkYxVDFlcFIxa2d4SnQ4UG5Md3ZJ?=
 =?utf-8?B?WnI1a05VRVQxYnh4b1h6SmZEd2ZVbzBTb0I1WVdOUDJ4NnB4M0RMekpoTEJD?=
 =?utf-8?B?aEMxNFgyenVMeDNyVWxmZU1LT3VtejVvcUY3Wi9MM3BsK0lXWlZGWEdxaHVn?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eebbdbac-4160-4992-7b17-08de22ba4627
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 13:40:57.1471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SMlhkMJUhcouYAC6nEUCsJkDXRyE9LboL4yt4RDVuWUPSZ+EGKhKz/bcvfL607aJ4Z9sJazGSiZZZ5rpuxIOzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7924
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

Quoting Matt Roper (2025-11-10 20:20:30-03:00)
>Use scope-based cleanup for forcewake and runtime pm.  This allows us to
>eliminate some goto-based error handling and simplify other functions.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_pxp.c | 55 ++++++++++++-------------------------
> 1 file changed, 18 insertions(+), 37 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
>index bdbdbbf6a678..508f4c128a48 100644
>--- a/drivers/gpu/drm/xe/xe_pxp.c
>+++ b/drivers/gpu/drm/xe/xe_pxp.c
>@@ -58,10 +58,9 @@ bool xe_pxp_is_enabled(const struct xe_pxp *pxp)
> static bool pxp_prerequisites_done(const struct xe_pxp *pxp)
> {
>         struct xe_gt *gt =3D pxp->gt;
>-        unsigned int fw_ref;
>         bool ready;
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>=20
>         /*
>          * If force_wake fails we could falsely report the prerequisites =
as not
>@@ -71,14 +70,12 @@ static bool pxp_prerequisites_done(const struct xe_pxp=
 *pxp)
>          * PXP. Therefore, we can just log the force_wake error and not e=
scalate
>          * it.
>          */
>-        XE_WARN_ON(!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL=
));
>+        XE_WARN_ON(!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCE=
WAKE_ALL));
>=20
>         /* PXP requires both HuC authentication via GSC and GSC proxy ini=
tialized */
>         ready =3D xe_huc_is_authenticated(&gt->uc.huc, XE_HUC_AUTH_VIA_GS=
C) &&
>                 xe_gsc_proxy_init_done(&gt->uc.gsc);
>=20
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-
>         return ready;
> }
>=20
>@@ -104,13 +101,12 @@ int xe_pxp_get_readiness_status(struct xe_pxp *pxp)
>             xe_uc_fw_status_to_error(pxp->gt->uc.gsc.fw.status))
>                 return -EIO;
>=20
>-        xe_pm_runtime_get(pxp->xe);
>+        guard(xe_pm_runtime)(pxp->xe);
>=20
>         /* PXP requires both HuC loaded and GSC proxy initialized */
>         if (pxp_prerequisites_done(pxp))
>                 ret =3D 1;
>=20
>-        xe_pm_runtime_put(pxp->xe);
>         return ret;
> }
>=20
>@@ -135,35 +131,28 @@ static void pxp_invalidate_queues(struct xe_pxp *pxp=
);
> static int pxp_terminate_hw(struct xe_pxp *pxp)
> {
>         struct xe_gt *gt =3D pxp->gt;
>-        unsigned int fw_ref;
>         int ret =3D 0;
>=20
>         drm_dbg(&pxp->xe->drm, "Terminating PXP\n");
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>-        if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT)) {
>-                ret =3D -EIO;
>-                goto out;
>-        }
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>+        if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
>+                return -EIO;
>=20
>         /* terminate the hw session */
>         ret =3D xe_pxp_submit_session_termination(pxp, ARB_SESSION);
>         if (ret)
>-                goto out;
>+                return ret;
>=20
>         ret =3D pxp_wait_for_session_state(pxp, ARB_SESSION, false);
>         if (ret)
>-                goto out;
>+                return ret;
>=20
>         /* Trigger full HW cleanup */
>         xe_mmio_write32(&gt->mmio, KCR_GLOBAL_TERMINATE, 1);
>=20
>         /* now we can tell the GSC to clean up its own state */
>-        ret =3D xe_pxp_submit_session_invalidation(&pxp->gsc_res, ARB_SES=
SION);
>-
>-out:
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-        return ret;
>+        return xe_pxp_submit_session_invalidation(&pxp->gsc_res, ARB_SESS=
ION);
> }
>=20
> static void mark_termination_in_progress(struct xe_pxp *pxp)
>@@ -326,14 +315,12 @@ static int kcr_pxp_set_status(const struct xe_pxp *p=
xp, bool enable)
> {
>         u32 val =3D enable ? _MASKED_BIT_ENABLE(KCR_INIT_ALLOW_DISPLAY_ME=
_WRITES) :
>                   _MASKED_BIT_DISABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES);
>-        unsigned int fw_ref;
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(pxp->gt), XE_FW_GT);
>-        if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT))
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(pxp->gt), XE_FW_GT);
>+        if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
>                 return -EIO;
>=20
>         xe_mmio_write32(&pxp->gt->mmio, KCR_INIT, val);
>-        xe_force_wake_put(gt_to_fw(pxp->gt), fw_ref);
>=20
>         return 0;
> }
>@@ -453,34 +440,28 @@ int xe_pxp_init(struct xe_device *xe)
> static int __pxp_start_arb_session(struct xe_pxp *pxp)
> {
>         int ret;
>-        unsigned int fw_ref;
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(pxp->gt), XE_FW_GT);
>-        if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT))
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(pxp->gt), XE_FW_GT);
>+        if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
>                 return -EIO;
>=20
>-        if (pxp_session_is_in_play(pxp, ARB_SESSION)) {
>-                ret =3D -EEXIST;
>-                goto out_force_wake;
>-        }
>+        if (pxp_session_is_in_play(pxp, ARB_SESSION))
>+                return -EEXIST;
>=20
>         ret =3D xe_pxp_submit_session_init(&pxp->gsc_res, ARB_SESSION);
>         if (ret) {
>                 drm_err(&pxp->xe->drm, "Failed to init PXP arb session: %=
pe\n", ERR_PTR(ret));
>-                goto out_force_wake;
>+                return ret;
>         }
>=20
>         ret =3D pxp_wait_for_session_state(pxp, ARB_SESSION, true);
>         if (ret) {
>                 drm_err(&pxp->xe->drm, "PXP ARB session failed to go in p=
lay%pe\n", ERR_PTR(ret));
>-                goto out_force_wake;
>+                return ret;
>         }
>=20
>         drm_dbg(&pxp->xe->drm, "PXP ARB session is active\n");
>-
>-out_force_wake:
>-        xe_force_wake_put(gt_to_fw(pxp->gt), fw_ref);
>-        return ret;
>+        return 0;
> }
>=20
> /**
>--=20
>2.51.1
>
