Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841D6C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 20:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B6E10E797;
	Mon, 29 Apr 2024 20:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mk6+q53c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8C910E6E4
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 20:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714423066; x=1745959066;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=6yTmK0HccHh4wPuSJSXyaUjIcqWbq2Uk38BcJ+XUFYs=;
 b=Mk6+q53cjBopc5ONi3Oai16q0G6oaLoCcHFBEzUnL2f3MJakCwpwGB06
 EbGyWMQuzN5HHoW9QF1kwijuwnZXZ/eAquH0l6V0O+0bHKarIyxSm4YKf
 rmlguv1Zu/CP8OmqYSs7y8o6kcQ+aJzJAPznuhthC1UMtGfm+tLfk/ie3
 7yXzRUjG2Nh31S0YVwrPgpsn/Ijai/5hL7JsFx2CqfBFzibsgKCq0Dstp
 of4C3y4Ot2tUfQ6/ah6My6AHYCYp+52Yj32isAINMgsCjubX7JSksRoC6
 XN86AD93OyqI4fKczx8LOmKcVbiM6ytkKy8X8AthQj7E/BSwG1pM7dQJT A==;
X-CSE-ConnectionGUID: /nMe5oOmT9WDAoYG6qLlHQ==
X-CSE-MsgGUID: iC/Ge7ZmSy+1fTgM2xE5nA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10226750"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208,217";a="10226750"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 13:37:45 -0700
X-CSE-ConnectionGUID: eOhdV8g8QoeL8i+uq9akUw==
X-CSE-MsgGUID: 58FCulfLRx+7Cgt0UcNfPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208,217";a="26307537"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 13:37:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 13:37:44 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 13:37:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 13:37:44 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 13:37:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=clU2aRVQQkyiBxVAeO0es8TevLHDHT7khxzYgamlooPr+I0pdy1AsvaF2w7XMdhqxGPWYH73z6ulwPFqmhMQ293NSmRtpwTleAagXtE7Pj+zWJNOhwNeeemUvsCq0+MeF+ZmaoUqrFmMTpv4FJ6uBeEqCTK/mExUv3Ryk1IiKCPUF58jmn0dZsCtEOmQdK/hAe9WFcPFrkWDbjiZ8XmRm+cVb9Lr2SjHPYPrqHk52xA+6whRem/RrMC9R86AV4EJikdsICsKpG+mQvSjqSDhAo5+QQboKAOcuUO6aCaje14khYJMMr1hVJlH0JKt6rDk/BJ0j4kmm9NWID39ugpxpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MT0w9UGFBp2JCO6YgNpDRkyJNCg5RoRk/XX1tFo9f8E=;
 b=JeQ3u5uZ5w4vAceVce3uUsJwgHC3T/4AfJ3yOGpt6Eg/iy+JmPK/Rq33m+o9FXM1uwHmW+xUALQ/xcE8RE6ZSZ+rWqjuA5Pr7NYKjYbV2pUHPLsQDkhVm1tOREHjG23x0IpFszoa0WpTUq8ibtpCUCZFZWK8uvBoXhjbQ1VrytI8AgXJRwz20RSx0wr28M05ijVOdA+FSAW3lbOvJ1QZkety3CNhBUeggC3MyC6w8wzkVOq2s02apEj1Xj06YuV2Ly1Fa9izg7OvbqIGoAasU0X/XgVdZLJUPjiesJ/BYCEmiU/xGiIUfiRMQlmLsBNCL9sVXOiCizSNFk1K5WyMtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 LV3PR11MB8505.namprd11.prod.outlook.com (2603:10b6:408:1b7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Mon, 29 Apr
 2024 20:37:41 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724%7]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 20:37:41 +0000
Content-Type: multipart/alternative;
 boundary="------------dcqn0jd9l0RWR5ld4uSKlHYH"
Message-ID: <9beecd13-ed05-4f87-8631-217d7e947d8b@intel.com>
Date: Mon, 29 Apr 2024 22:37:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] drm/xe: Refactor default device atomic settings
To: "Welty, Brian" <brian.welty@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240425222346.13026-1-nirmoy.das@intel.com>
 <20240425222346.13026-6-nirmoy.das@intel.com>
 <41eb1fab-d9a5-45be-9c95-05a34fc7685e@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <41eb1fab-d9a5-45be-9c95-05a34fc7685e@intel.com>
X-ClientProxiedBy: MI1P293CA0001.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:2::8)
 To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|LV3PR11MB8505:EE_
X-MS-Office365-Filtering-Correlation-Id: fba5c467-a7cf-4a6d-8545-08dc688c376d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzR6U1JYK1JYWEt1UXRvU051SUZnalNzYkgrbHV2VE9IVFNVOTRyNHk1M0JE?=
 =?utf-8?B?WDZXUHVJZktXdmZ1SUNrelFGeVlzN0RUVjJ4ZmxicExMOHY3elNpUjhaOXMz?=
 =?utf-8?B?azU5Y2pDSUNnUHBCQU1Hb3BqSGZBVTdDVUY0dzRURzkyck9RT1RjOE9RNlZK?=
 =?utf-8?B?VmtZcGNYemE5bWZYTWRGRHprMlVMcEhWaE45UU9IWGprSXJLY1NWVVpNRy8w?=
 =?utf-8?B?bnZEdjdGdHNWbm4wL0FaQlFjY1dCQllvbEdQb0pHeEJnaVZZME9XaHg5OFJn?=
 =?utf-8?B?NGF3aHpMYUFhTXgrMGFkOGJrSHo0aTdsejVUUkgydGh5b3o5VlZkcDBENUc5?=
 =?utf-8?B?M3l5bXJqYjZnVVg5UzRRTWo0UjlvMHZtZ0dVRkYzNHM0VUxxUllTVVZYVWpq?=
 =?utf-8?B?b1pnbnp5RnVyVE96Y1BJbjUzUlVCdzREUUhIR2F1WUVVOE1STDY5NnlFbXFK?=
 =?utf-8?B?MVBXaUdxd3NGbWVGTG51ckg5bkZVRDA3V0JURWpDN1pzQWxPMDI3NUxEZUFu?=
 =?utf-8?B?NVQ0WVprMjlGTDEwcWxGR2RvbjdUSXZtQy9hR3NLbzUyejFZQm9zS3dlbzJs?=
 =?utf-8?B?TnEvb1lGNWFnWnc1M0c4SDBacWZ2bzZObVFqV0lmc0hVa2FISG9oUDFOVmc5?=
 =?utf-8?B?bDlyQ045bWUxMXBtaWtENGF0cWU0cDhibFJmd2xtclZGcGlRL3VrU3UzWndN?=
 =?utf-8?B?VTNOQ0IxRzVEQ2lFa2VEWGNDMCtPYU1lSlZWdDc0VnUyWndubkhBOXNoOWt6?=
 =?utf-8?B?R1lPdjFNcng4N21iVVQ4b2ZzZUExNXZ4cWdjTlA2Q1JCc1A3RU04TVZyRGxu?=
 =?utf-8?B?QWdMc2FUeU81M3M0QThHcENPSVdUdDk4NUZKVFdiTDBkNHkvNWtFMEo4a1pW?=
 =?utf-8?B?QXZSK0RMTWNTZjdCa0htZG1RZkVzZHNEVjRKQTdnN3RaK3RyV0U0K3dVWDhC?=
 =?utf-8?B?R0MrSklOZjVNTGxvL2dHWHNsTXdCcFJ3bk5oRUlLeFExUk1ONjBHYjM0TWto?=
 =?utf-8?B?TGhiaHp0ay9vR0NPaVlFeVVidG5sN2pyTlNORkFrUTFZWWdraWdvL04zcHRn?=
 =?utf-8?B?Y1E4YkE2b3BOY0JadmNEWXlRQWloc1lJa1FVaysxL0lkbGg3Z1lFWVBVS3NQ?=
 =?utf-8?B?QXJmNGtmd1NhUnNxd1BBeHJFc2J3RWgvVXhGeWJwM2Foc2k4MWRndEVOaVMy?=
 =?utf-8?B?MHdVemY2SFZUNDN0VFlLZW1kRkVrdkErUXllLzBpWmNzeFFIa3lqV1lzdTRl?=
 =?utf-8?B?d3VTU1lobCtiZ0JqSjdnYmNQZTUyZ0VvSHNWaTRGYVJHUUxVVmZ0b0Ntb25y?=
 =?utf-8?B?a2tnU25MZWd2bUg5d2t1QXY5VFVDYnp6Z1NyOWJMSUhUQ2xTMTVUam5uOEJo?=
 =?utf-8?B?bnozeWFIR2F0R2xEMmtHZVJITXcxZVE1VjBvd0tyZHo0ZGVMZWtvMXB3TGc1?=
 =?utf-8?B?SExXaHlxNzM2aitiTDBiMnpDSGZKekprRlF2c21Udm9ibFg3SmxFVDNRaWd2?=
 =?utf-8?B?bVArRk5uWEJyVUhUUHQ1VmRpcG5WN1JZNCsrN0NLSXNPU000QTRHTStBUEYr?=
 =?utf-8?B?d2FVV01ibU8wZnpjNk5Bdzd5dXBVcG1aR2RNNjJaa2dyaHZhR3Mwei9QbHZQ?=
 =?utf-8?B?KzEyZlhEM3MvcytQSmp3UURqY2N3N3BPNHE3SmNDRkw4YzJYRHhlUE0wRFhn?=
 =?utf-8?B?Z1pCa1BRTEtMajRoNm41dWd2WVd6alVON2VNVjBseXZGeEdjKzFncTFnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTArdyt4bGdLV2xlRGM3UW5WTGlsSitvZVdtTkNtOG0vamMrdzRLS3VaM0pB?=
 =?utf-8?B?TEgwZW9ucHFwTGMvYWZqWjdYRVE0Snc2anpybm83TVkrdXVocWJJZllTUllS?=
 =?utf-8?B?T0t1ZFBWNXhCNUsyTU9MRXhlNzBWRW9xRDhLc28wUmphNlF4UWF5TmtzZU40?=
 =?utf-8?B?bm5sUHhwRWkxd0dkbGFISzhneENJdHR1UTlJWGpramJ5clBQbzBHTklxSFps?=
 =?utf-8?B?SWtKMFhwZGZVY3ZLQ0VFajB0b3lRTUNTRjcrR1pCOU5RbmtoMDY3ZlJudFRh?=
 =?utf-8?B?bzJIOStkbWw3RFZtS05SQ2EyTUhJZUhwanpCL2M1K0pveEhlVXFJWXozSWZP?=
 =?utf-8?B?RWdwN2RVaVRBdVYvUE9qRFF1Tm5oNjdMNFhMenBxOTlGSUFzV1V0emRqRWVC?=
 =?utf-8?B?VzlkVmJ4N3lTVSsrSWJNRW1GTWVNOUM1ZE1tM2RhOTdlZ0ZDRTFXUm44cVBW?=
 =?utf-8?B?bHpUMFUzWndZNFdlaG82N3ZUem8zRDhXVU95NVI1d2pFQ1VMYTdoZFlhcENz?=
 =?utf-8?B?d2FFdnlqMjJ1bWQwNys4am5NeFhzZlhENGJ1cEdVeE9GZERRZ3c3YVRxOU84?=
 =?utf-8?B?RzhqdkhIcWRmZml0dkd5ZEs5Q2VjTU5YUXZlS2hxVExlUEtsYTJkT3ZwYjhO?=
 =?utf-8?B?NU8vQUU0R08ybGx1b3owV3pETlI3bVJvcVB1eWlXQnZZeHBIbE1SRm42ci8v?=
 =?utf-8?B?cFJ0aFZnMUJ6MHNMcEpqeDA3eWR1M2ROV29MajNseFNIZ3UxaHBma01CV1dY?=
 =?utf-8?B?bEVwSUVVeUhSc0lraEFLVEVEUTFJQkltemwrdlpFZU11YUhiT0VDMVNHNldU?=
 =?utf-8?B?WGxuSW5PbXdYNUp2cjdvNzJOdHZBWmhMbHl1MG5qd3BDQXhNdWtZZ0hRMVlN?=
 =?utf-8?B?SjZtS0ZRajBTRmo5NzNDLzdFdkl3ZXQzMHB1SEpnWFZoSjBseUE0U0U4YWtV?=
 =?utf-8?B?dE1lcUZZb1dqK0RNWEdBMGQwTzVVYitsUUlWbVJBcC8vSDgwMmszZytsMGlr?=
 =?utf-8?B?aHFxZWZ2eVUyc1ZCQ0dXVUQwSVpJTWRYRnRDSW1mcHZmODZpanpMZUlIeXhM?=
 =?utf-8?B?RDdTVFl3NzRVSWh0QUpxYmZhUDA5RHFTaGlnVDAwbGFUbmxFMmRzSVRBSVBR?=
 =?utf-8?B?SSt0NHdvam9nVUowaEhSb0psVG5NTWdnQlRkckFwNFhwNy9WcmxRRGFTTzJU?=
 =?utf-8?B?MVloZjhHYkVNdHBldDRHYXlVZ2VTeFJsOXQ3S2R5eEpvMG1hMG92YXBYbkRh?=
 =?utf-8?B?eXNzRy9hTVY3N0hiVGlDYlRuVWtTblkrWXJFTy9pSEdxbTRqSjFoT3c1UnZO?=
 =?utf-8?B?UUxEKy9HbzlpTGNhWDRQWXkzeG1vQXV0NFRxSTZnMkdJblNiWjlSS3U3MmZl?=
 =?utf-8?B?UDcrMitob2hmc21WVW4vRmxwM0xCaXZLcmEzK1REOWs2M3NjYzRYT20wU1Rl?=
 =?utf-8?B?dXlGUG9pVkU4RDd3NHlIWlltd0JlTkQ2dE9ubHdzZDJHV0l4ckNSMnVRRjI2?=
 =?utf-8?B?b3pjVkU1bTlCUnNWLzFnamVwQklKUlZ5SXdoQ0FkQVgwQTJNdy9DS1EyakJa?=
 =?utf-8?B?WVpxNytMUlE0VEE1eXdGdG1VekRWYkJYR3lWNUZia01rcXEvd1orUDdzdDVF?=
 =?utf-8?B?V2d4R0xETjBrV0s3dmpGYU5Hc1E5cG5HTVRkeUg2eE4wSWQvV1Yxd1RIOHln?=
 =?utf-8?B?QlloRGJqY1ZST016c045UEpXc0N4YXY5QzRPb0tvZXdERFdES1ltU2xlbGU4?=
 =?utf-8?B?dE81a3d1ZGIwUHplTHR4bUQrcDBvaFVIVTVTbDlSdGtGOVJiaVJUMEcxS2pp?=
 =?utf-8?B?V3hQR1RWamVub1g5ejg5WmFiajBxNGJYc0lMU25nUjFhT3ZraFJTdnowS3hO?=
 =?utf-8?B?RUxySnN5TEdoM3BwbW9xZWhNRTJ1bkZscUN5aXNJeXVXNlVxdldxYUFYRjNO?=
 =?utf-8?B?R2hCQ3hGSTlrL244RFVXTjArOW1ZbjFLZWZoV0hhcUF3Wk9GM3pycGNNRDN6?=
 =?utf-8?B?MGo1d2pEY0haTTdxRW5wRjEycnFqbjQ5R1NvNW1sODV6UlpwSk1yd2grREIx?=
 =?utf-8?B?elBKNDJ3cmRYYnRkYktibUJhWXJvU1RsWGV4UTBqdHZkYjIzeGJEZ1FkcHB3?=
 =?utf-8?Q?8L3ayVRryqlnGJZGXd81YZdxZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fba5c467-a7cf-4a6d-8545-08dc688c376d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 20:37:41.7224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Y00QI0oK2kbqjm9sR576eP7Nc1cUd+qjWdqRtHh4kWM/RAHqNzkO2QNgwuV0tr9fG1OMYsXx7p6YFEbCOgBFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8505
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

--------------dcqn0jd9l0RWR5ld4uSKlHYH
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Brian,

On 4/29/2024 10:14 PM, Welty, Brian wrote:
>
>
> On 4/25/2024 3:23 PM, Nirmoy Das wrote:
>> The default behavior of device atomics depends on the
>> VM type and buffer allocation types. Device atomics are
>> expected to function with all types of allocations for
>> traditional applications/APIs. Additionally, in compute/SVM
>> API scenarios with fault mode or LR mode VMs, device atomics
>> must work with single-region allocations. 
>
> I think additional patch may be needed..... for the Compute mode
> handling.
> I'm not sure correct thing will happened for 'shared' 
> (multi-placement) allocations.
> HW will raise an atomic access page fault.

Yes, I think the change should be then

     if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
         if (xe_vm_in_fault_mode(xe_vma_vm(vma)) ||
             xe_vm_in_lr_mode(xe_vma_vm(vma))) {
             if (bo && (xe_bo_has_single_placement(bo) || *is_devmem*) )
                 xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;

         } else {
             xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
         }
     }

So when the handle after migration state. Though currently shared 
allocation is broken as cpu access will not trigger any

cpu migration. This needs future uAPI.

> Our page fault handler only checks this was atomic fault and proceeds to
> migrate the BO to VRAM. I think PTE_AE bit won't be set with your
> changes, so seems are in infinite loop of atomic access faults on same 
> address.
>
> I think we need to fail the page fault in this case, so HW raise CAT 
> error here? As atomic access not supposed to be allowed for above case
> until future uAPI is added?
>
> And need IGT test for this.

IGT for the patch ? Currently we have a test(xe_exec_atomic) for atomics 
access which will test the traditional one but yes, we need some IGT for 
compute case.


Thanks,

Nirmoy

>
> -Brian
>
>
>> In all other cases
>> device atomics should be disabled by default.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pt.c | 24 ++++++++++++++++++++----
>>   drivers/gpu/drm/xe/xe_vm.c |  3 ++-
>>   2 files changed, 22 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index 5b7930f46cf3..a8e9e8592c43 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -597,7 +597,6 @@ static int
>>   xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>>            struct xe_vm_pgtable_update *entries, u32 *num_entries)
>>   {
>> -    struct xe_device *xe = tile_to_xe(tile);
>>       struct xe_bo *bo = xe_vma_bo(vma);
>>       bool is_devmem = !xe_vma_is_userptr(vma) && bo &&
>>           (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
>> @@ -619,9 +618,26 @@ xe_pt_stage_bind(struct xe_tile *tile, struct 
>> xe_vma *vma,
>>       struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
>>       int ret;
>>   -    if ((vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
>> -        (is_devmem || !IS_DGFX(xe)))
>> -        xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>> +    /**
>> +     * Default atomic expectations for different allocation 
>> scenarios are as follows:
>> +     *
>> +     * 1. Traditional API: When the VM is not in fault mode or LR mode:
>> +     *    - Device atomics are expected to function with all 
>> allocations.
>> +     *
>> +     * 2. Compute/SVM API: When the VM is either in fault mode or LR 
>> mode:
>> +     *    - Device atomics are the default behavior when the bo is 
>> placed in a single region.
>> +     *    - In all other cases device atomics will be disabled with 
>> AE=0 until an application
>> +     *      request differently using a ioctl like madvise.
>> +     */
>> +    if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
>> +        if (xe_vm_in_fault_mode(xe_vma_vm(vma)) ||
>> +            xe_vm_in_lr_mode(xe_vma_vm(vma))) {
>> +            if (bo && xe_bo_has_single_placement(bo))
>> +                xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>> +        } else {
>> +            xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>> +        }
>> +    }
>>         if (is_devmem) {
>>           xe_walk.default_pte |= XE_PPGTT_PTE_DM;
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index e41345c1627d..ac08b6fd537e 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -805,7 +805,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm 
>> *vm,
>>       for_each_tile(tile, vm->xe, id)
>>           vma->tile_mask |= 0x1 << id;
>>   -    if (GRAPHICS_VER(vm->xe) >= 20 || vm->xe->info.platform == 
>> XE_PVC)
>> +    if (vm->xe->info.has_atomic_enable_pte_bit &&
>> +        vm->xe->info.has_device_atomics_on_smem)
>>           vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>>         vma->pat_index = pat_index;
--------------dcqn0jd9l0RWR5ld4uSKlHYH
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Brian,<br>
    </p>
    <div class="moz-cite-prefix">On 4/29/2024 10:14 PM, Welty, Brian
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:41eb1fab-d9a5-45be-9c95-05a34fc7685e@intel.com">
      <br>
      <br>
      On 4/25/2024 3:23 PM, Nirmoy Das wrote:
      <br>
      <blockquote type="cite">The default behavior of device atomics
        depends on the
        <br>
        VM type and buffer allocation types. Device atomics are
        <br>
        expected to function with all types of allocations for
        <br>
        traditional applications/APIs. Additionally, in compute/SVM
        <br>
        API scenarios with fault mode or LR mode VMs, device atomics
        <br>
        must work with single-region allocations. </blockquote>
      <br>
      I think additional patch may be needed..... for the Compute mode
      <br>
      handling.
      <br>
      I'm not sure correct thing will happened for 'shared'
      (multi-placement) allocations.
      <br>
      HW will raise an atomic access page fault.
      <br>
    </blockquote>
    <p>Yes, I think the change should be then <br>
    </p>
    <p>&nbsp;&nbsp;&nbsp; if (vma-&gt;gpuva.flags &amp; XE_VMA_ATOMIC_PTE_BIT) {
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (xe_vm_in_fault_mode(xe_vma_vm(vma)) ||
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_vm_in_lr_mode(xe_vma_vm(vma))) {
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (bo &amp;&amp; (xe_bo_has_single_placement(bo) || <b>is_devmem</b>)
      )<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE; <br>
    </p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
      <br>
      &nbsp;&nbsp;&nbsp; } <br>
    </p>
    <p>So when the handle after migration state. Though currently shared
      allocation is broken as cpu access will not trigger any <br>
    </p>
    <p>cpu migration. This needs future uAPI.<br>
    </p>
    <blockquote type="cite" cite="mid:41eb1fab-d9a5-45be-9c95-05a34fc7685e@intel.com">Our page
      fault handler only checks this was atomic fault and proceeds to
      <br>
      migrate the BO to VRAM. I think PTE_AE bit won't be set with your
      <br>
      changes, so seems are in infinite loop of atomic access faults on
      same address.
      <br>
      <br>
      I think we need to fail the page fault in this case, so HW raise
      CAT error here? As atomic access not supposed to be allowed for
      above case
      <br>
      until future uAPI is added?
      <br>
      <br>
      And need IGT test for this.
      <br>
    </blockquote>
    <p>IGT for the patch ? Currently we have a test(xe_exec_atomic) for
      atomics access which will test the traditional one but yes, we
      need some IGT for compute case.</p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>Nirmoy<br>
    </p>
    <blockquote type="cite" cite="mid:41eb1fab-d9a5-45be-9c95-05a34fc7685e@intel.com">
      <br>
      -Brian
      <br>
      <br>
      <br>
      <blockquote type="cite">In all other cases
        <br>
        device atomics should be disabled by default.
        <br>
        <br>
        Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_pt.c | 24 ++++++++++++++++++++----
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_vm.c |&nbsp; 3 ++-
        <br>
        &nbsp; 2 files changed, 22 insertions(+), 5 deletions(-)
        <br>
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_pt.c
        b/drivers/gpu/drm/xe/xe_pt.c
        <br>
        index 5b7930f46cf3..a8e9e8592c43 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_pt.c
        <br>
        +++ b/drivers/gpu/drm/xe/xe_pt.c
        <br>
        @@ -597,7 +597,6 @@ static int
        <br>
        &nbsp; xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_vm_pgtable_update *entries, u32
        *num_entries)
        <br>
        &nbsp; {
        <br>
        -&nbsp;&nbsp;&nbsp; struct xe_device *xe = tile_to_xe(tile);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_bo *bo = xe_vma_bo(vma);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool is_devmem = !xe_vma_is_userptr(vma) &amp;&amp; bo
        &amp;&amp;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
        <br>
        @@ -619,9 +618,26 @@ xe_pt_stage_bind(struct xe_tile *tile,
        struct xe_vma *vma,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_pt *pt =
        xe_vma_vm(vma)-&gt;pt_root[tile-&gt;id];
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;
        <br>
        &nbsp; -&nbsp;&nbsp;&nbsp; if ((vma-&gt;gpuva.flags &amp; XE_VMA_ATOMIC_PTE_BIT)
        &amp;&amp;
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (is_devmem || !IS_DGFX(xe)))
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
        <br>
        +&nbsp;&nbsp;&nbsp; /**
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; * Default atomic expectations for different allocation
        scenarios are as follows:
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; *
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; * 1. Traditional API: When the VM is not in fault mode or
        LR mode:
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp; - Device atomics are expected to function with all
        allocations.
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; *
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; * 2. Compute/SVM API: When the VM is either in fault mode
        or LR mode:
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp; - Device atomics are the default behavior when the bo
        is placed in a single region.
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp; - In all other cases device atomics will be disabled
        with AE=0 until an application
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request differently using a ioctl like madvise.
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; */
        <br>
        +&nbsp;&nbsp;&nbsp; if (vma-&gt;gpuva.flags &amp; XE_VMA_ATOMIC_PTE_BIT) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (xe_vm_in_fault_mode(xe_vma_vm(vma)) ||
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_vm_in_lr_mode(xe_vma_vm(vma))) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (bo &amp;&amp; xe_bo_has_single_placement(bo))
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_devmem) {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_walk.default_pte |= XE_PPGTT_PTE_DM;
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_vm.c
        b/drivers/gpu/drm/xe/xe_vm.c
        <br>
        index e41345c1627d..ac08b6fd537e 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_vm.c
        <br>
        +++ b/drivers/gpu/drm/xe/xe_vm.c
        <br>
        @@ -805,7 +805,8 @@ static struct xe_vma *xe_vma_create(struct
        xe_vm *vm,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_tile(tile, vm-&gt;xe, id)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vma-&gt;tile_mask |= 0x1 &lt;&lt; id;
        <br>
        &nbsp; -&nbsp;&nbsp;&nbsp; if (GRAPHICS_VER(vm-&gt;xe) &gt;= 20 ||
        vm-&gt;xe-&gt;info.platform == XE_PVC)
        <br>
        +&nbsp;&nbsp;&nbsp; if (vm-&gt;xe-&gt;info.has_atomic_enable_pte_bit &amp;&amp;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm-&gt;xe-&gt;info.has_device_atomics_on_smem)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vma-&gt;gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vma-&gt;pat_index = pat_index;
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------dcqn0jd9l0RWR5ld4uSKlHYH--
