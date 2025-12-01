Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D585DD116F3
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 23:00:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD0810E4BD;
	Mon,  1 Dec 2025 23:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eh5utbM6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582BD10E4BD
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 23:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764630018; x=1796166018;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Fi/3ua3GXKm4HnoKMadyA9wRQd8/sAiFYTaXpqnQnRk=;
 b=eh5utbM6z5dDdeivA13bHQIJ/VUYCpRyBq4QupfCjuxANNEXu0xwlsRk
 T5PRROZfdCB6++cw469ayOWXr5NXFeDXFaag9Z6VNx/d3cMyBxW/0n2y7
 Qg77WsBFfEaAgKJgns2U+2AZURsuFTD6A/kUxwtueWPiUsl98C60ObfGw
 9fJwQFNsVnw5VMjhXtCyU67Kx17SNIGrrcTIMT6vik83UHk+X5J/MMb4y
 8j0E9ytwDV5wHXD5YfQRA8exZhgeRl5+yA2AAMsrFxqACvcKR3RWxaAq9
 1SK7mSvEpnwZtqwR0BcmpxsoCBlQhH0xyhq4LzltmaqACRLd4a/c7+iff g==;
X-CSE-ConnectionGUID: ISeSbvrkQ3uYdRMEZneQuQ==
X-CSE-MsgGUID: hsq5FHtCQKGIdWr3c0MwVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66621784"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66621784"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 15:00:17 -0800
X-CSE-ConnectionGUID: rD4h7IehR9ugj0IqxybDyg==
X-CSE-MsgGUID: t6uy1REST5yAvk0kLB4zbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194637547"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 15:00:17 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 15:00:16 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 15:00:16 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.62) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 15:00:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MnFwVJ9GLotD0/u2sXwvUV8Gd2b3oA2GsrNa/llUOtpMWehSKGXI34ejzmKXG8sZ7FqHvXGN7f0TjoWilLiiMQ+b6nTlvgFmUB7mK3WLBNx9OcMLT5pNUh3X5JRMGDVRFb4N8mcI4+rr7gcWbhUQVZEgtT0w17gaF/SQd1cTp9RQqtPI6+BFdj+qP4J4jDDuZY7MaU5nekoMQWh8+VJ2OdgS8SGd7z9vuA082JYinr1P5FR/Ojg7v/bDMGguK8wEu1Nf32Sc1nghJiMV4sLmKaz5zGCnMS502GWZMwQIsAWFIxn6X7eCs66CUp/RCRnOYLJAfMD1LntMwC31x4pSEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Od6jSw2WMuddqbKvKP3SE5eAIztVwRnxDPKiSkwyMEY=;
 b=EmG7iROKWxj9gqpI7jh/NMPhMFbhBdhC0eO5tJ1xhmSV0rRGq4KDXv7yJeWR/256ABOsUpjTfycavo4oA58ciu19hxFLlI9lc96PqCR2L9Euy/sOO6H6rDdeLBb9FO8ho+coEvfrVv4IAwi3dvr+lhfdQaHElWOgblwx80E68FQNTzBrw8do34KmspVyZ/mc0w9DZSNRo915lie9g5i23XZp0cUxwIZtarympx53MBWL63FAnvVsAZFgCnOlDK4E621rt98mWCShW6yIwkXy136zHqh8sqzin+qGyabv4DtKVcGdukZ6gY7wRY6Dn+HQuxGkK6GEVgZZNuW4Ecgmkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA1PR11MB7700.namprd11.prod.outlook.com (2603:10b6:806:330::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Mon, 1 Dec
 2025 23:00:10 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 23:00:10 +0000
Message-ID: <4f3fb4f2-c322-48a3-9dae-dc80e4ea1168@intel.com>
Date: Mon, 1 Dec 2025 15:00:08 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] drm/xe/guc: Recommend GuC v70.53.0 for MTL, DG2, LNL
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251125014134.2075988-10-julia.filipchuk@intel.com>
 <20251125014134.2075988-14-julia.filipchuk@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20251125014134.2075988-14-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::8) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA1PR11MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: 8271f0bf-18b4-41a4-866f-08de312d60c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmZYODBScm9heWNTeEVGMzFtc3V6ditwNXVJeS9PWWlvOUR6bU5rNHJoYlhp?=
 =?utf-8?B?UkFSTFRBM0xIQVVONzcrRUVWcXozeTlGbnhlRENESTBkSUhsVGVaRk9xc0RD?=
 =?utf-8?B?V1FkUkNiYXpodFF3SlNRODNMdTNsVGlscUxETTFPRGszVTVuaUdTNjFVQ2Fv?=
 =?utf-8?B?dVFQMnlHR3JPRnpZQXBuUmU5OEJ1NGtyaDdoR3pZbW9kVW0yUzdodFpNOWhs?=
 =?utf-8?B?eHg4bVhIeUdGZU5QWXVWWmoyWmtHUEduSXptQk5qZGNvMk0rMTQyVmg4anJ1?=
 =?utf-8?B?emZDeFFiNWNQaEtxSGMzdFFIVEtJenQ5aTRaRDhDaG81QmJmWkRCMEpYTk5M?=
 =?utf-8?B?M3lLaUs1alp3NStST0NWbWFVbHIxOTN6aUJQdHFUZ1lQdDZhZFJwTHFLQTlt?=
 =?utf-8?B?VDBkdStRWHJYR3ArNlhTOWs1SkdOZTVtSjN5SmMvaExkbGFMb2hibWdFMmh0?=
 =?utf-8?B?c0g1M24rbVdhWVlzbG9OcVBoQjRXZlVHSFRIaGtkUUh3ejNoWDBQbzN5UnVX?=
 =?utf-8?B?MzRlbFZydEZVL29XV1EzMmNqMlV0YStiRDlHNEwycVkvYXVDR1dFeG9vODZL?=
 =?utf-8?B?UC9NOXFJQ1dKd3B5VW1qQi91eDY1cnpDZmNjV1RMNFVMWHhUT0ZzTndUVDEv?=
 =?utf-8?B?V3ZLeXRLeHducmZBMHZzVTdYbmJ3d1ZVNGx3SXlYWlhvMEh2U2o0dFpRSEll?=
 =?utf-8?B?d1ZEamYwZFZsL2xnL0JleThnZE9BKzNXTjRMcmdpUHhUNVVsS2ExSEJSMTQw?=
 =?utf-8?B?aGcrVmtUcjJpaHFud3VYTTJYZW9Bc1FQWGM3V0Z2R3NSUGtVSEE1czA5MlI3?=
 =?utf-8?B?bCtNdzRFb1dpeWtKZmRob3NvWXlhaHNjeStKNWJyMXZlNW4yYzlvR2JWaVVU?=
 =?utf-8?B?QmpJTWVrbENOUEhrRFVwZkpOL1JrSmNmZjlnQXFWYy8yVmhqa0RMb2Ewbk9R?=
 =?utf-8?B?Tk9RMHhkenpwUm1QZDBwWUpHZmY2UkFxZFJISHJGdXMzaTdsL3hmemY5ZXVw?=
 =?utf-8?B?RTJkdVNxbUZzdEtrU0FYL0J5bTlYdUI2YTVoZm0ybzhqdEwzMW5JV0UvdThw?=
 =?utf-8?B?aDZGanE0ZlJGY0NSbTlpbDZ3RUFaT2VKblQ3SEJSUHFaUHcrQXp0MlFJT24z?=
 =?utf-8?B?L0FyV0pXNEdQRFJmWkZDbThGQ3hIVldDYVZZU0JZWVVlVS9ITjZRS08yWDdD?=
 =?utf-8?B?ckREbndiM2NxVkVqUjA0ZW1hVFYxZjRwbXo1YnJ2VWl4M0pXbCtYaTBMREJI?=
 =?utf-8?B?R2tLd1A5azAxVjhDK3BzSmFrUVlvY1JnbjYrUmZmbW8vaStIVWI0UFpMU21Y?=
 =?utf-8?B?M0haSEdBUUwxQ282S3htd0Y0SzYvQVBObk1sVnZlTk1SWG5EbHg1Q0hwM3cw?=
 =?utf-8?B?cmp6WFRVQXcwaFdFTVZ4VkRhbC9RUzBBVFFIR054aFhKbU40cFViRXN5MEYz?=
 =?utf-8?B?ZGNoQUE4MHV3dWZ0TWpIN3hwbys0c2k0Y2NpRFh5UWlRK0ljU3h1NUN6TlJo?=
 =?utf-8?B?a3Yxa1p0cWQzVDhkZ2V1N0tBOUFGNCtkVXVISXovTm9ZWU43ZC90cTJja3Y1?=
 =?utf-8?B?b3ZJS3g1QXp0UENZc2c5SWUwMWxWclpLUnlrWVUwRUZDUWRPSGN6WWdRZXlj?=
 =?utf-8?B?ejBkT0M2ZUwva1VBYVF4dk9TODBoTVFUR3dxbkkwaEsya2E2U2ZYVWxsZHZr?=
 =?utf-8?B?K3VwcjFjUVJwQ3E0R0t0OVpLVndIOUFGK0F4emc3R0dpM3ozaStHSzRiQm56?=
 =?utf-8?B?OTdTRW5zbWVYLytsbVExNzBhVzZXMERqNHZ2ZGpCNzBlRDZHVmVmWms2NXBB?=
 =?utf-8?B?UXhVdVNSWE1ncTlNeHpGM0U4WmROTXlVOEJRekhoOGd4M2RWR2dSdUdhakJv?=
 =?utf-8?B?bSs0WGVKZlZlQ3hUeUZHYlkrL2w3RUh1aG5ocDlwTkpXVzhnM1hndTBkSUtn?=
 =?utf-8?Q?davmBUYk8yc04FZziZZhpLuFRkzTqpUr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXQwK1FKZjZOM0NnWnRYdE1pdDhzMldQRmVXZ05oMWxiM1JiNUkvSC9pUVlB?=
 =?utf-8?B?bG1xYUFKdEV3YUtpYm9YQ1d5V1FXRjJMMEJmY0lwTThZeWJBcFpIV3BzUmwx?=
 =?utf-8?B?V29XR2tObXI4ejBMdkVDa3VWelNPSnR3R05BdHlOSUJqL2FaNy84Rmp2VllN?=
 =?utf-8?B?UkV6M2szVUJrWWwvL2Q5V3d2QTMrYWFLNXd6WVNFVDRBa2E5OWN4M2g4a251?=
 =?utf-8?B?OUw0ZGZQKzQ3OUNPajM2VjhqQjNlQU5qRmUvVWY4ODNndGlMb2xRWFhRMFRk?=
 =?utf-8?B?WGl5QllzMk9OK2tkcjN3M0FjdlMyZGFhU3JybHJpL3R4R2phdkRhM2xUa1NO?=
 =?utf-8?B?aWY3dE1kMnE3NHAyNWZ3YVYzL1JSbHBIMHY5ZUIra2d0cXRmQXo1bElCazlq?=
 =?utf-8?B?ZzhYQjBKQm5zd2s5NEU2enZKTHE4a3ZHNys2UTEySEFtRlBOaklvYnVDOVRl?=
 =?utf-8?B?L3R2UXc5Q0w1c3NmVU1jam1BZ1pyVDlKSnFpdVppWnlFSkN4SlVBSGhLaUxj?=
 =?utf-8?B?RlFETlNCS3daTE1KK2VIMmZzQ25lRnYrbU9ONnJ1d3lCcTNpcENyazZpYXMy?=
 =?utf-8?B?Z08rSVV4eFVLWEl0eW9sNmtBTVRaeXlNM3c0UmxFczBhWGp1STdBYzN2aHRx?=
 =?utf-8?B?ak9ld2RIalZGeUNlR1htWmVIQnk1VWV0UFIyWFM1TlJoUEdrZ0M3Tlg3UkJz?=
 =?utf-8?B?a2p6ditYTVpnU1p5VFVaVjFRMk9laUJ1bml3KzVDWDdjNHJnOU9HYU9zbnRS?=
 =?utf-8?B?bXNvQWFBcXhmbWRYd0EzaFRvbzFIbE5MRmhYK1FwSjFwSFMwM1QvNm1Ea0ZR?=
 =?utf-8?B?eVhCOWRVc3dKLy9QUVdwYVA2TzFkRzNmUmxJUDI1MlBKMDV2amRnTytONmVn?=
 =?utf-8?B?RjVQcEJyRlF2S1lWVDRYODRIM1RQVDdBblNZUHJzRjlONm9jNWloeXpNYWNF?=
 =?utf-8?B?Y3BuNlI3YXU5SWxhTU9qQ3JJbTJEL2dKUmZKbngwZlVTTzNjUXRoSEJjTCtj?=
 =?utf-8?B?aGdubFpBbnEwK1Y2TXR5RFpDblduR2FCTlVCLzdsYXJMN3Z0dlVNQXg0VUhx?=
 =?utf-8?B?L3FJbk5BNzlGNE1xWGRFd3ZKNUYva2VHY2ttOFFINjJkbGk1WW80RCtObGVO?=
 =?utf-8?B?RTZFSnpubm83SitaK2RmT2hZVi9XanhpeEdPeURiN1ExLzdoZk5idk9vV0Rv?=
 =?utf-8?B?a3lkODJ3OUlRalRnMnVEWU1BaGFydWlPZ1lJK0dBd0w2WEZDSjVuanZSUHg1?=
 =?utf-8?B?aEs1NmIzT0hHd2VKRDZ2U2FuaFlzTTR3VnZTNVpWNXZmdTFnV2lJQXh1aG1V?=
 =?utf-8?B?SXI0blgrM0crZVNCTG1taXNnN01CNldreFFibjFMaDk4T015bEoycFJHckhE?=
 =?utf-8?B?dVVEK2k3K293RjJrSGRIbk44R2s1YmIvOTYzdTRpQWxQVy95TXI4WVJHLzVm?=
 =?utf-8?B?MlpsalVHdTFVd1JCYWVObUlDUGs3My9iUlFubVk4QVAwNnNRUHNBOW84S0sz?=
 =?utf-8?B?amVOM1RpOW5PUGlPVk14a1VxQmdaNzJQS2VPM0IwZTNZTU5WdlA2SmZHS1R4?=
 =?utf-8?B?MGF6WmlmVDJmK01wZnNSbnE4V0lab1kwSlJmTjJBM3NTbnd5VENQRnlhK0FM?=
 =?utf-8?B?eHVHVG5FQXI3b0tidW1oaVlzSW5Dd3gxM0JFQWp5ZnVVSFFxU2hTbXNrZ3JR?=
 =?utf-8?B?L2NyMnM4Z0V4YVNkSmhGNEFoaGx0L3VaMUt3bzNqTDBKZlUydWFsVEN2Zy9D?=
 =?utf-8?B?dWJCeStvYm91TWYxc2o3b1NJMm5kN01XUWxhQU1VNGdCSE5VK1R5RUh2RUdh?=
 =?utf-8?B?ZDd5L05MamdvMk9UNlhXZzVIWVFBR0x2bGxObzhSWEh2OXk1eWwxTnFIYmgr?=
 =?utf-8?B?SzdSbVFzQjZrOTBKTW8zbWEyQzkzK0I5M2lXR0xQczloZTVEdE9BVVFYekFn?=
 =?utf-8?B?T3pXTW8yMFNzb0ErOFBSbEszM3g2eWRpM2NHa1R2Ukw0Z1ZvYkhzT3VkcDJL?=
 =?utf-8?B?clU2Z0NRWXY1VE0vUlZzdnhDelQvKzZjTkdXcFQrVU5ITlhMZ1hBclJGZXlP?=
 =?utf-8?B?QTFLbmt2dU03WUs1SGtLdjhTRnZpSWUwdnZxRlJnZDlBT2RSNmoyRjFYWTQ0?=
 =?utf-8?B?L0wwdEhrMDNRVGxvc2I1bzVidjVMMGp6bzRrVmIwVnduR2RTQjNSelQ0WDZi?=
 =?utf-8?Q?z5ydhVTV1zytHDisTjEG800=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8271f0bf-18b4-41a4-866f-08de312d60c7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:00:10.1604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCxkewgLqIiJFEJsD2/PBLhYv75STZkBVkT1L1dctWyRi4xfezCBB+OJOe4qkOpxD+NDqGFjiEiWLWoJWd2kC24TYciLxjTcbnV0i2x4OQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7700
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



On 11/24/2025 5:41 PM, Julia Filipchuk wrote:
> UAPI compatibility version 1.26.0
>
> Update recommended GuC version for MTL, DG2, LNL.
>
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 622b76078567..810709f106e7 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -117,9 +117,9 @@ struct fw_blobs_by_type {
>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
>   	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 49, 4))	\
>   	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 49, 4))	\
> -	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 45, 2))	\
> -	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 44, 1))	\
> -	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 45, 2))	\
> +	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
> +	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 53, 0))	\
> +	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 53, 0))	\
>   	fw_def(DG1,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg1,	70, 44, 1))	\
>   	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))	\
>   	fw_def(ALDERLAKE_P,	GT_TYPE_ANY,	major_ver(i915,	guc,	adlp,	70, 44, 1))	\

