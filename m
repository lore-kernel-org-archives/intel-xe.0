Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E286D17143
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 23:19:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E2110E27E;
	Mon, 21 Oct 2024 23:19:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TGKPdYgl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7853410E27E
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 23:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729552769; x=1761088769;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zJiCUqrnwroRwDez9kzTk8dYiqM5+OVnquNa7UEL7ZA=;
 b=TGKPdYgl0n+smfLYdvIbXaW5LW8djWM+38UkTmlHC3Ca9EoV1d0JZzon
 EGJf+///qRjDlAAFHi40xR15kE4votU2V74L7QQ03oOSCKHjMqdzN79Kb
 VooAtwFHj6RxDu2iSVHA+Xe+qZ5HEdTKPuHP94H3o1M3zG10ROKKfmAvf
 9R1x4v7T9h+Mwz33hQxb6eUE/PhwyKKwAK/mA59X5DIneueXXw4+d95OJ
 7JH40Dpal79BWK5sD+ikYtaHR8KfIVDaaThK4lut010+zhAzwJwkzmcva
 KJ6geZEQKf+HLaf+krY0lNiwKFIM/tK4dlxtZYCO4WUeLE/v8koDyQe5E w==;
X-CSE-ConnectionGUID: 8VPmrPAUQGWqTiP3Pg83Lw==
X-CSE-MsgGUID: +RwdhvsjRmyQf0C2+mK5UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40181353"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40181353"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 16:19:28 -0700
X-CSE-ConnectionGUID: Tt7b5vrmSfiK24rtp8rAag==
X-CSE-MsgGUID: KF5AkNq+SwyeWqKO1qzMLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="80492605"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 16:19:28 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 16:19:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 16:19:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 16:19:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZfrWI+sJAYgWXORSwzPt0MLF4ciQ628aXTolLjc/IiWy4mRFrqv/t1xHM51BUGBlEa04qWflV/BG80Ze3RxOuzB/gbjWkYG70EockzgZSgR+ia90Dzi1VO6DnIjlN9fv/L14zKg982hap+v/6KDQ6P4RpHtOYiqoM0+5gx2WV0F04h9ShGwpH1Y8vk4mF6MQP6K3YV4TmdF0SFrXTCV0bv1ND1JRW3SHNS5DyCjvAvt647xHn/qGuWbQ7ASEH5cCjPQh6wQiZ+L8s9lld622UXKlP2ng/BO0jDmtufuKn4cz3DgM1WUcCnb/+7GxjEirTwh8kbhLe3DBnn5XIjhpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5V6baJKCS8oKTFMvZFP/buWKZgNnuBWrstAOd/KnMCQ=;
 b=No6vyEtRrpQ3VEG/6zydPk/waDl22y+1Y+ELU6EFcV+BXDoqfg4yRS8nmRNu5MM2g7QQpduFg234YCyjmY0X4fyh6LJy2aWcCeyAXrWMc4uEevkhXILJ/k0XVREDBq3LYNwNuzjXLPQ0bMQc+RPG7+PclNePKDRsal0PDC5QLaaB+JBzVk9nAtdsoF/V60l41mL3ctsz7meDjohohSEBq4rIXtpL937uGAPnD0tVguZO4czuGsAPlkFqhWRhi4T07drOGk7ZHX/FzPsr2JR9xP1gQPGwE9vERk9G+P77YiwuyuDhGsPHIYKMMZLmsNT3R3NcFxWYwUzoCdINVHBj5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA1PR11MB8100.namprd11.prod.outlook.com (2603:10b6:208:445::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 23:19:23 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 23:19:23 +0000
Date: Mon, 21 Oct 2024 16:19:21 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <john.c.harrison@intel.com>
Subject: Re: [PATCH] drm/xe/xe_guc_ads: save/restore OA registers
Message-ID: <ZxbheaL0nzSZFTM1@orsosgc001>
References: <20241021222401.95833-1-jonathan.cavitt@intel.com>
 <85a5ex2gr8.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <85a5ex2gr8.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0229.namprd03.prod.outlook.com
 (2603:10b6:303:b9::24) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA1PR11MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: e9ef4241-2083-4ffa-6ffd-08dcf226cc88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VCs1czJTL1dYTUxGQXhEZFAyQWV0RHVOWEpLd1RjdXVIb0hsb2pKZGtIVXBK?=
 =?utf-8?B?dkIwdThPOTc5Y1E1aFJVRFhoYlZQSHlkS2lBZVArWXM2djNRVzhHQzZFcEx3?=
 =?utf-8?B?cGw1U1JvQllpdVhUTnNRTUFuampPS1o3YUJWQmUvdnFzVGYvQVdzSTVjTjFY?=
 =?utf-8?B?Vk91czVXOEZrOUF6cjF1ZmJadFBkeTNUS083OVAxdEFiMmxwN29LSllRYmlS?=
 =?utf-8?B?YUdpYWJTVlpGMkd3elhhcUl2c0Vzd2hmU3JaQXlrNXdPeXREa0I1eXd4TjBm?=
 =?utf-8?B?Q0xqRmd5Qk5YQTJrdmNoenY0Q0t4Rm1JUFVEUVZnbUdLazdhU1A0aGNSdm14?=
 =?utf-8?B?bDM0NTN6UWxDRUExQ1IwTnhQUGxleVFuaFlDMmhvTFpKYXRHU2grbVBkOWJM?=
 =?utf-8?B?M25ZbXZNWE0rdTF1bHYrTVhzb2tIT0wrL3pjUEloUXlKanFBb3B6WWNKb3ZU?=
 =?utf-8?B?a0I0MDltK250ZlVBei9mL1c5UHRYWDdRZHE5Yk9qNEVDU1B1SXlyT1doOHhO?=
 =?utf-8?B?anRoVmZ5RUlwZzcrQUJQZVgyT0V5WGtlQ3plZjdSQzVIQnBGb25aVERqMUFj?=
 =?utf-8?B?a1FUQWJrNThDTStBR0lQQUxrNDIxa3ZmVFdPUXBMNG95V2o1WEJxQ3JWUXZS?=
 =?utf-8?B?MWJvN28wVGJNaTAzQ1c4TFllQ2pCZFJsRUNYQUZWT1hnNVVITGtEY2VRVzVp?=
 =?utf-8?B?RVp2Y0EzOXdidlhWVFpqOUE4QXBpc0ZvQ1hValc2Q1NBMEt0eCs0WHdDcFBO?=
 =?utf-8?B?cFc0L3pYTTlvY0pWTWppd0xudDNycWN3WWthbkljQVRTYVE1ZHdKV25KZGFR?=
 =?utf-8?B?MnJ5czVTOXMraDFDZHAzWUpHbW9kZEVFd1lXYWdVcHlCTVJvQzVjeVBNcGNO?=
 =?utf-8?B?R3FNeXgwcG9nakE0ZTROR2N1dlhGcDZ1U2huS0xoN3VGWk56S0xZSWcyMERm?=
 =?utf-8?B?b25DcndBeFp0QW9zOTRqUVZJTUpZNW11bndFOUg0YnV6L0liWlJ4c1FEZXds?=
 =?utf-8?B?MnA5c0x0VGRFbnBzYnpTRHVuQjNtM1Q0SGwyVkRiQnJTeFZheUFuS05XREZW?=
 =?utf-8?B?MnZXVzlxRnhmVGxYbmpjUmdrU3BDL2lRY3UzOGo2amR1M1Q3SytwNWlEb1lu?=
 =?utf-8?B?Umc5TFhYTjM3aXJwYk1mZVRmNnk5L28wSlFDQXZUSTFaVWk0UzFqWkliSnE3?=
 =?utf-8?B?azJpQzZHNDJMM3hEUDgrYmduaDVkZjZGaXJRbjhQelhQTGozQ0lvRHd6bWtz?=
 =?utf-8?B?RkZRbklBeUdobTRNZTNwMEVFQVRtcWNWTHdENGNHQW53bUhSSlBjenlHbEF5?=
 =?utf-8?B?UUtJakZoTy94Sm5nTFNkZFQ5ejhmbTZTSWE3eXdRNGpvSmRqcFpSci82WGpq?=
 =?utf-8?B?Zm13TUNjamRmaFc0SE5DWi9kOGJzbmJJUEFSYTBjaUJSRStTekQxSHFwNmVH?=
 =?utf-8?B?TEk3WlJsVVVpYy9ZVENoMFF4ejVxOUt3eHlUdVg5ZkFsQ2lKUStUR3dESEdH?=
 =?utf-8?B?MFJZVEZJVnFwMVhhS1BmbHhkbkxTYTdvWWNGZ1ZRMGFWOEFyamZKV0RHZWU4?=
 =?utf-8?B?L2NKN0pQN3ErOE5iVEZpN2JCcVVGbmJTZGQvb3B6R09oeGYxbWdhMXNTZGxk?=
 =?utf-8?B?eXFuelNEbGE5UXU2UVNqcUpUTWVnVFZaMHVDUjdqTjRJeXM0ZExia0c4MWdW?=
 =?utf-8?Q?B8C2AiFkyJkVrIjwmhwh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bndtUW9IWUUrQ00wUXFjVXdlczVyWDduK0FJbEYxYXhvT2lnL0Zla1dNWS93?=
 =?utf-8?B?ZWxjdHd3V3BSTWZlREdWL1ZONjhwOUNteW9wZTBzODA2bDZnRzVjUXpsOVZj?=
 =?utf-8?B?aXV5OTd0eDRLckVBb3NMYzZlZGVyNG9uWEdScml1RXlIYkFjSjI0RzRVNmp1?=
 =?utf-8?B?RFB3SENJVC95OXBmNFY3MWNJcVlkWTE4VkU4a2NUMm93QmJ0WUdCQXhpWlpW?=
 =?utf-8?B?SW91elhsS1NpMkNRR290UHpPRmFSblk3b1NJbi8vTUg0Tyt1S2F6ZXNlNGo2?=
 =?utf-8?B?UWhoMFF2VnY3VmRjeWNZMk5QMHVFSGlXUkNJSW5FVExmUkphTnJZdGw0WWVm?=
 =?utf-8?B?UjV2ZWlqejk3OVpleGpHWk9iUk1ta3Fia1pJZTd4VVliazhtSmlNaEFIeWdT?=
 =?utf-8?B?VTNHVUMwZHhqSENRUkxMckZJaC9BeFNtWGZyMDd2bUgwOHF4cTNJREhjMDQx?=
 =?utf-8?B?a25xcTV1eEVFZDc5cExiRFgwZThGc2UzTjJLQkNLak9hZVZCcDVLdm92Ykwx?=
 =?utf-8?B?THhjQzJUbTMwVkZVbDViQkJyVjJvMFFDTENNWGlqb0NmZU55QzEvWVB2MHlI?=
 =?utf-8?B?aDhwYTdLMWxIYVhnM1FvMXYxYk1IYzNUeDVzYmJic1VIVjBTVXJVRDV1LzhE?=
 =?utf-8?B?Z1F5T2VFaFZFSDI3UVhGNmlmOElaSzlETFc2UUgwNDhZdzlRdWpuSHQrU0x6?=
 =?utf-8?B?aGZDUW1Cd3RrL0V2U0FoUkhnMFFCaXF5Y3RjOVVFRThrNGk4WWxCZVJFQVFN?=
 =?utf-8?B?VWM5TVFpS3lpbUpiREcyS1hNUFNKRzRJOCt5aUF0NHpvczg0TlhjanJNdG9u?=
 =?utf-8?B?WGtNVzVmMTBPZG9mUE9IK1ZlU1A1UitqWWVWWE1mLytTaDJJK0FJMW9Rd3g5?=
 =?utf-8?B?WWJ6YmY2ZnZCN1VpQ1F5Tm9Jb0JBSFExYzVYdWpnWmtzZEljblZiRDkwUVpr?=
 =?utf-8?B?d2d0QzNzV2dkNlZMTGFTVVFXa0Y2bDY0VEZHWDJFdVVBZFpJTzFvdUYzNllv?=
 =?utf-8?B?QW5YSEFmSzlZQ2FxSStURy8yMnVlNWFQc3VjTlBzblBoUEFWcEpkTXFwSC9m?=
 =?utf-8?B?U0dlN25aTEp4cjY5d0lsSnBqd2lOOUNXVVc3UXlzYURhdDJiNlArV1BHWUNX?=
 =?utf-8?B?WkpjWFhyMTNQZ0gxSkJ1NkNIYVYxekk4OGhHRzRrVDh5alA0djlGeVJCS3pW?=
 =?utf-8?B?WUt2dXVuMmE1WUNvVW9obWlEMmZZVXJjM1JHVlkxWkt3ajRoS2d3dlVENmZp?=
 =?utf-8?B?aUZzV2M0T1gzdkVCSm9qcjVpT3Q3RndEUU1RMUlTemZ0K2RrbXpoWk83M0tp?=
 =?utf-8?B?VW5iQ1k1d1NTT2h4WiswSy81VmRjMXlxODE1NmFkNjZjanhnUWQ0N1JCdkhY?=
 =?utf-8?B?bXJHMlY0MnVTZElBb0xXM0tjNk5lWks4VTRrSGY5T21wYWNybGsreXMyeEVT?=
 =?utf-8?B?NU43SW15TGtZNTlWdFY0c29FdHdNUjhlMzFrNS9oMFoyd0l5RGg4cGRGTUFo?=
 =?utf-8?B?Wk11cXZ1cTN3RE1uV2t6L0J4Tk4xSWxEb2Jrc2RHZ3J4M2hiV0VhUTdSdXVq?=
 =?utf-8?B?aW9Qd2xlalJjaFYrbWZHRTBJNVp3djQ4elByKzVJN0JWMS9uejZwdEUybTVR?=
 =?utf-8?B?d2p5R3kzZGlKaVd1SHE2N2xORU41RWhKUjBrVmVmbmVkSER2VWJkY3pySEpD?=
 =?utf-8?B?OXNrbEE4SEdvbmpGN2Vnamd5SkpTSitNMHVCQlQ3eXVDT213cHBLdDZtMXdB?=
 =?utf-8?B?WmlJbW01VWFmWk1lc201TnlYanhrRi9SN21oTzdlTkFIb1MyeE1aTUZXT1c2?=
 =?utf-8?B?MEU3TzRFTUV2c25XVDIzOUpIWUxUQWwzcjdRdDNDK0RpZTB6ZGQrNXVVdEN2?=
 =?utf-8?B?VU8xWEh3bS85TWlydnZBRjNYOGd1WGwzZW5vQUlOZi95eHZNVy9PcWx0Y1FS?=
 =?utf-8?B?ZkpwY3NCcVZXYm9Yd0Z1dkZGT1g0aGFmalFTckgyUXU2N2hNTEFyTHZlaEUy?=
 =?utf-8?B?WHc4UTNXK1p3VUhGclNWT3hpeTAwVkxaOWJOd08zRDhNeXptNmRHMUtUWit2?=
 =?utf-8?B?N1czSWdSWTMzMW8yQ0xsZ1JiWUd0RjY0N1hkMlhBTEpVc0VHMk9NcmlzSUt3?=
 =?utf-8?B?RTUwVVR5aUl1ZVprQkl1enMrN2FqRjMxMTk3SGhBUm5pSXk3NC9tMXFSWis4?=
 =?utf-8?Q?vw3DViXOE4ZTLg3jDIYiTZY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ef4241-2083-4ffa-6ffd-08dcf226cc88
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 23:19:23.5680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+ImjBT27VoGRtw4U3Kno7+Rh4mQD53+xf8lOxJK2KnC/4a2fG3eNIcCe/rTvzx4EG3NB+Utqd6C5w5eV8xPYFDLCfqsuGpuiZ/dLrmCI10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8100
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

On Mon, Oct 21, 2024 at 04:11:39PM -0700, Dixit, Ashutosh wrote:
>On Mon, 21 Oct 2024 15:24:01 -0700, Jonathan Cavitt wrote:
>>
>> Several OA registers were missing from the save restore list for GuC and
>> could be lost during an engine reset.  Add them to the list.

Thanks for isolating this issue. Just a nit here:

OA is just one of the users of the command streamer allow/deny-list 
regs, so I would just reword this:

s/OA registers/OA registers and allowlist regs/

rest looks good,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>


>>
>> Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Suggested-by: John Harrison <john.c.harrison@intel.com>
>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>
>Thanks for chasing this down.
>
>Think we should consider this a fix and add:
>
>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2249
>
>And also, maybe,
>
>Cc: stable@vger.kernel.org
>
>For that we may also need a "Fixes:" tag?
>
>Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
