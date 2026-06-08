Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9199ACD8C92
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 09:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EAF110EFD4;
	Mon,  8 Jun 2026 09:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FtVVWpJ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B778510EFD4
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 09:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780909288; x=1812445288;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=co+ZoX+XA34p6Vxh9rEuA1mk1QVgfTbbuC2LuQSy5vA=;
 b=FtVVWpJ/P+a/2YrlrM2O9slwDNcMoJ83iruYAq+Y6prrVPRw2Rz5v87M
 N0RND90HGoYnwvG9ziurr/iahlPUYfjCVpOCMqh+jo7mptSLiKc7rLcqQ
 nCTEtdF3f4nPJhpZK7k1NklBFj53f6H9I9ulB+NgMjDrsJ6r1m5MxQZtk
 JrCAOQbsomUQI8XkPVdKDr1U4Xs2bBr3mOWYyJneebCvUMxcpS/UfMCSt
 kH6hsdJSs+G+AFK1Co1ewM95MxtM1TVGZdFRtDmO77P/NdY+5qHrW3CEG
 12QVXanZ1S+F55UwLH+VLOVR6a44LjCgKjuUDEhKZxM2IOA3GnhFK98Ac A==;
X-CSE-ConnectionGUID: euDsiwU2SdOIAYXA5gc/0g==
X-CSE-MsgGUID: vMWE9G5lQhqasmvU/B1fNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="81384419"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81384419"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 02:01:28 -0700
X-CSE-ConnectionGUID: lX8kjiBwQZ66n6lBC0nl+w==
X-CSE-MsgGUID: 6Ihn31UXQMyRo+sS0EgVuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="269199497"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 02:01:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 02:01:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 8 Jun 2026 02:01:26 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.17) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 02:01:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVoTi462eQd25WDFB0g7Lxr1YNDGt74yR5cxUNnGHTg+lcNJMk0A8sqI6fP8EA0lARHBCjQdYJpDJQh9SeXWhuSw1VMsaGniwSG/a/0KtIA1fqcWne2azu3RJCFbVQQx/6oW9mjE/p3wU8B/meDgPCCTqsi63Ku2ggry0gov0PFW9rSwNzoPigBJw2Kq/gKHxjQdhcLw1vS5AMWE41WDGYj5wDsdUfzaOS+7N5rKX29fZwRMQOEExhfNZkTqqqsE2gazpwnf4XmCOMeBGP0zg9+GwhHnBGC7jr067oICjjJsdFLDnGIBta6lIFwkhh6xnC79OjnObPL5tb5nklxc5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UP4q/qpU2nvDy0i23ilBZjnekJNHzBRDIuuMgw5xr0w=;
 b=taCC9w1BL9OL0q5nWFA1+Dd+bInYmCfaVuguuMm8eFawgjd0r0doyOwgK+WkJg1wCze//RA+RqEzawfBoudEo9OuazKaxu1DelgEsXyy4mgHrAGqiBnpa4JhWTBBi5dIZBGxGiPr9YUVh8sUTU7UiDEUx0A3SpZXKMLHez/7YmCo+ymDKQUVij/Jq+b8n1zuKhwIE9QItnzBqqJnGFzJEMZOd5+WAyDNqiB3RnCm0OTXxyNar0QlRIVkhiJ1wJdlGTbjTCXjsNlYiP8Xo5MZOupeQ4KpkpWTVl/rKXDhDLJ3ti205ORrl+YAImmilrMSIvaA5Ob4u7WJnM5dvzpUeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM3PPF453C3BEC4.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 09:01:23 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 09:01:23 +0000
Message-ID: <d1153948-4268-4436-8ff6-3ce4139187a7@intel.com>
Date: Mon, 8 Jun 2026 14:31:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] drm/xe/hw_error: Defeature hardware error handling
 with system controller
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260608080346.1135464-1-raag.jadav@intel.com>
 <20260608080346.1135464-2-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260608080346.1135464-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0172.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::16) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM3PPF453C3BEC4:EE_
X-MS-Office365-Filtering-Correlation-Id: b340637a-1643-4ff7-2035-08dec53c8326
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 7K82+ISKICZFK0EN0Nz45xOhArE8ByLeZM2y19BbOxOp8MKIt6xrnqwGDIIheoOITBVAkmndwqmQ/RRR4nlxAG3VcGDIRpOeLFImh5yAjSjGqOroR8OQ/O1qA7MJXDE01mpevTg5V352ZQMENuGqEyGRzLE7Dk9rM38gBYium3OOTNNYyYKSitv5ywKSdXnU5SO4VLxQuBZeemkTQ4zDUOu/HH9FwiW1/z8Wat/M56xbihcop+piYNUm3C5+fotmJL2OzzUjIGwWRfmkkbcGepzfV/Slaw3yRw2u7SGL385AqCBiNpFdKmlB4raKU+tagZl2pMU3iSUSPlDElJ+YpvRZ8lDgOmN3TbI6L33zNvipF63mjmHVKFTm85e6yNjFI/Q1hZNlDsmHEJeaQpst/OzGN6KFJjWaHVK7Bvl36TS/mEkB6WWZtxtYY0Rf9GmpfcyjUrwJjQG1bA0ZHxjY+bHBUuWt9GDS4LTaeraglnsL4t+2cOGsMZZ1fmIcrGUipnijdGJSWf11w8zQp7yD2bNenk0Xl/vMIo4c4jeO+h10Aal50A1i/hBueSyHo1d5RdCI8YRhpsl8ObES6vlb+/Q+CWT5Q+JEPv6vBHxmd2GMjPSdjD6q2Jp7ESDYkWJG8/ZeUZfeh6EC/+zSf3OjC7HzaYFo+eq+nE4Ym8RJU+a4VRlM7UPlpB7CM73Zdlmv+RxEpCQOTRPVqcl09j4j2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnIyNTB3TERtK0k1aXVjKzJXY2twRnBZUFFOQTFJU3h2VWZ5T05iM1J5Q1NM?=
 =?utf-8?B?S2JOR3JDZkZuUWdhV3ZBVUlCT29McUUycGcvWktzdWF4SzhkZjhZWnA5ZU1r?=
 =?utf-8?B?V1BleTJLcm5YUnJacjYxREVVckdEeEpaaVJ3b0lyV0RueGo3RDUyVmllT2gy?=
 =?utf-8?B?cklJbUlZVUwvRU53cjN6NDJhOVRtVkJtTjNONWNzaVQxamNnUWlncHkrMmVp?=
 =?utf-8?B?SHJzL3lGRzllc2UycHVVejQvWE5VN3dUMzE0MUZ2UER3b01UZEdtMmEwQkhB?=
 =?utf-8?B?aWZsR1JtRmRYOGR4czcwVVozdEV0OVdYeVNxQ1IvSTE0UWl0RUM4MTRhNVZr?=
 =?utf-8?B?N1JjeVMyMFFQQ25INTdrbzVWSHJpcHE1QWEzaE5SdEJVRDYzbVZGcWJCQmZq?=
 =?utf-8?B?MURHZXRGUzlWcWpMMG54dnFUWmpOMmJNRTEvOXlsQ2pQTkFMakMxVjBSMm9Q?=
 =?utf-8?B?N3VFR1h6WU82RUl2WHBkZ3l5NXZjWmJqbTYvR2R0ckliU21JRVg4NVMyS0Q2?=
 =?utf-8?B?ZUxyT3dGeG12Rkx0NFpkblFCbVZwREp1RExDdFZ2TEZVTUdGZk41aVVJWWhY?=
 =?utf-8?B?bWI3ajg1emx6TDFDdURJQWo5Zi83Qmx2aTh2NGlzQzZOMnV0dUJkMFV6YVFl?=
 =?utf-8?B?cjZnbEs1eVh4NTFEUWd2ano4dk1iSWdzSnhEeWxTMDdzRGxydklwT3V4TmFB?=
 =?utf-8?B?QVBFT09heDZNc0w1MlhldGcxWGs2d2ZvblVPQzlmdENXMEkzRWtxaHdOemxO?=
 =?utf-8?B?T2RvTkNiNHBtaStveUZPWXJJSkd0N2NBVmw3L2xSU3lQN2hiL0pyRzY0bUJw?=
 =?utf-8?B?RnJyRFFxcFlvaEJ0ZmNWM2JkMmNYYlVSU1c3YXZzY0RYeld3c0ZOeVIxWC9x?=
 =?utf-8?B?akJBa20zY3hVNTRNSTkza2gxMzhPeEFPbG02VVZQSmc4K2lRNnpuM2FacStG?=
 =?utf-8?B?K2VtbnAxT2FPNjQyY0ZlSVB4M05HL3F1cmdtbGI0L1B1L2k4T0lnRzF5VmE3?=
 =?utf-8?B?eWlYSDcxZC96bk9TRlo5SWxQTUxvaW1paUxtM0tVYkl3VVRTTGJTbzJZSkVq?=
 =?utf-8?B?TmdyYzcxYTZBRUF5Q2M1WFdhb3RmcVhGazNJa2owaUo0VDE3MUk2NXRRQkxq?=
 =?utf-8?B?V2lMSVdQdWdIT2xoVUdTTnlPcitqdEcxcGRyRTNMeThyV2MxcnIrRFJFcUdR?=
 =?utf-8?B?aHBMcEhiK1JLakdhT1RiV3FSVXE2aWJJTXlVMHk3akpKN3Z6MjZiaElIUjR1?=
 =?utf-8?B?UlRUVTh0bEFJekE0SWNRVkMxYS9KcGxOL0NobmIyODZVMlNmQUhoY01EVHVm?=
 =?utf-8?B?QW9UQTBXc1F4YXhXdGxQUndZbm5yVE8zV3N5ZFRkTGh6MUF5bjc0WXdWNUI3?=
 =?utf-8?B?WkVtbEZQMHprWmVzV1pOUzJUdWdTSE9IYVNWbEVsZU54WG81UnYvamFVQjB2?=
 =?utf-8?B?Z0ZzYm1OQS9JbmI5MXV1SHVqKzhIZUkzYURwQ0s3M2V1LzFBam5ZMS80disz?=
 =?utf-8?B?VFZYWVYvOG5CT2VubDVMdG4zc2h0UjVUbkhnbzVnaG56THg4ODV6SEg0Z095?=
 =?utf-8?B?M05GeldEYXBPMEVXRXdDbHhac3NINXV3WDZUZFFlS0tXdlFlanVzaVJCWGNE?=
 =?utf-8?B?cmxKTVZVcFovaitOV2lwaTlrYXdLMG1iQXFtL3dRYXIycGJiazlIQmR2b0Rk?=
 =?utf-8?B?N0hORklsZE1RdlNYR1U4ME1YOEozSVdwa3RLMVBoSk1keUZ4QkxTSjBBVjFH?=
 =?utf-8?B?N2pyYzVsR0ZYa1ZzN0NLNmtnblBUSm8rdXpUVDFoZGlaMFJWeFlHVEtESnNh?=
 =?utf-8?B?VnR4cnd0ZWZLbXVXbmV6N2c1TlZraEJiUjRXSXdFbFVQeXkvTHAzbzF6UUcx?=
 =?utf-8?B?Zklnb05kV2tmd0diRDFraldYd2pLbVphVVVQeDF3YUt6b2RmelBIUUZQV0Jp?=
 =?utf-8?B?dncyZ0N6aWRZS0pZQVAxbWQvWE1wTDUxVTZqNUpQT2E1a2c4SC9yM2FObWlB?=
 =?utf-8?B?OEx3eURJZGRINVgyclFXdmp2aFRkUFY4RFlpaERPbnNsMHYrYTFLanBxZDRi?=
 =?utf-8?B?Mk9LZmVMamJ6aStYK1FQQ1JZZWFWU096LzFiT3dJUTUxQ3VOU213MFRyb1Vp?=
 =?utf-8?B?U3FRdVRqQW45Qi9vcmloVVJuR1pqWHZZak5vdUcyNTJOWERONjh1MStLN255?=
 =?utf-8?B?ZGxRTXN2WllUNWFDaWxESU44akZQcWM4MVJ1c2k5TzdRT0VnbEp4aXh3YmE2?=
 =?utf-8?B?OUUxUG1vN2pHSEZWeXVaZjNYUVBxWkVreXFhbDRIYUc1WUdsZnRzYlcrTjl2?=
 =?utf-8?B?aElRV3dvZERVY2NSL0taeW82OU1CUG42dEUrNUorblUwR2ZnZ2xWZz09?=
X-Exchange-RoutingPolicyChecked: sM96D6U9ufv2kJedwULy6Lj7QOVuVGYv+Rl/E9QpAfoUaFuAUpa8tQq89+q//4OLwtu7E5QlIAnBtELZlapM5P1lbuTQicVT56zYhyD5eOUINTkRtNoqrs/viSzm67FJnwv2AHz/Dg0sIMQoNptnI2L4189kcY474TOXYDwmJMhcGx1LcBCsj0nKxBkwC4H55V4PaV4x6uXZahzaX8XqZ8n//eRjHin/hElJB3Q+BnVzi07ODut5jek04bhaP1642APLb/2xW8fXdYIOABH2ZteaUzwD9JoubtCV4Sr+RDW1rDTco/Y1ASpQYrfOMlDSgD3C4lsVZGKkRMAYbcnHbw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b340637a-1643-4ff7-2035-08dec53c8326
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 09:01:23.1802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YWlfDE+1DZChFwHDOzeWWHUUptSj+ch9E+JtIfvsW0KvMJLw9N/eJn8T0KwzHhIfsrcKroY8XbtIcSsEuBfIjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF453C3BEC4
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


On 6/8/2026 1:33 PM, Raag Jadav wrote:
> Hardware errors are reported through System Controller on the platforms
> that support it, and never routed as direct IRQ to SGUnit. Defeature
> their handling to prevent unexpected side effects.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hw_error.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 3c1dc9f83d1a..fd4177819afa 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -434,7 +434,7 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>   	unsigned long flags, err_src;
>   	u32 err_bit;
>   
> -	if (!IS_DGFX(xe))
> +	if (!IS_DGFX(xe) || xe->info.has_sysctrl)

Add a comment here why we need this skip.
Also a debug/error log for sysctrl would be helpful here in case of any
actual errors of routing.


With that
Reviewed-by: Riana Tauro <riana.tauro@intel.com>

>   		return;
>   
>   	spin_lock_irqsave(&xe->irq.lock, flags);
