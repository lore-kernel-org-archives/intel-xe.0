Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B67D10395
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 23:51:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA7710E06A;
	Thu, 24 Oct 2024 23:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OEiW+qZM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B1310E06A
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 23:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729813863; x=1761349863;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NV0LvVLMxJeYEkB/YTpEAH0DVRl57de5ftYQa6WfK3k=;
 b=OEiW+qZM7+SaaDVC8O3i4D/S/XxivebWmBihTL6D+Xuh6EU5FR59YMIc
 9twUM/GbYe/Lbh3M0rmgCt9JcafdIrcUXTOIz1ZQ8eZ5NE5fwQ1BikM9y
 f6eaRMpJvW1XamFIljzoTnCF63NGGjDITvMYJfdaHI6nUIrhJjjteFS2H
 SmVq7DGzuznDd73bnJ1lKJK1maufCBQ2gMJ+XByPQ4YLrYaEhJhQe9P4B
 4bZGr12EFCRCro3uJqwvL4i/NR1sX9sJohM8XfysSjlQouNr01TOVDTjt
 uAdVIM8N4+fc5flpgCBw8kFp+/Dq+8hMAfTWecPvWHMYpxtd5K6s0aKuE g==;
X-CSE-ConnectionGUID: M7/JdB/HToGwsTA1AflNkg==
X-CSE-MsgGUID: KoKkUsQrTnqPCLlbIlLd3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29595944"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29595944"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 16:51:02 -0700
X-CSE-ConnectionGUID: BMdh7HWXSrWFTtqV/CCr9g==
X-CSE-MsgGUID: 53LGmXtUQlivTH9wxa5OZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="85335550"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 16:51:02 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 16:51:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 16:51:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 16:51:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJ0fJydcW+5lN9RU55hmgCrQfBw47tr6X6emGLu/4+6OoIZlJN6ns+qZoYQhNNhsR1TGAyVap9E5sO9DNf93lZMEW1QkY/vXiPAeXO7Z4KL4rQsc8jZgGOsYnbb+xtQkM56IhPVMRSMmIdNGQ8uzs7tl0Ot7M1sl9/g1p3I6+F7PPl09MWnqmGwYoISnissbzYo4hSh0wRNbgIebLAi/PiX6+9bS48koTaZvlUrqR3GLH4Rz0pWbuzmA0EwtSNaRXKhEKZ22LTvg1FfPVJVkwWIlF/hjzydNnjFbl2UNqnxx/EKJRcT4uiZKfhHA6pDhm821qRKCY/HJsMvdnphCPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NV0LvVLMxJeYEkB/YTpEAH0DVRl57de5ftYQa6WfK3k=;
 b=jRb5peNIyX2Z8XGtZuAkAfGjrKWLo+DXQM8FsR9OChu5Q44uAJmFQa3qQhbS1yxJE1eG9UyjUG+5ziREjQcuFjo3QMddK/CZ93FA1Bdr3KmNoT+rSwhauEbPVHmRnYEIpsGGextbBaZlyeMuYxdl8Z16ixOzCFLDai52vVV6V6pKWvHtGNOIpdOPTwot8k82DuMQdG9ggE8j4kxBqpH9s31t1Y+y2+ukS8g8MbPG4d1y5qC6emtw1PMOfAO7Yuz88hS1+KTHB3gkiHzt6NOaRjjae7MI3PFF/9IWI5PsJlAWBzgEzuaH1jtcQL3JqcU4IuTu9SL1KenOS7dxa9sMHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CO1PR11MB4852.namprd11.prod.outlook.com (2603:10b6:303:9f::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.21; Thu, 24 Oct 2024 23:50:58 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%5]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 23:50:58 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "nirmoy.das@linux.intel.com"
 <nirmoy.das@linux.intel.com>
CC: "everestkc@everestkc.com.np" <everestkc@everestkc.com.np>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v1 1/1] drm/xe/guc: Fix missing init value and add
 register order check
Thread-Topic: [PATCH v1 1/1] drm/xe/guc: Fix missing init value and add
 register order check
Thread-Index: AQHbJYEZyeC3gjjTgEOHlTKyd0WKbrKVxF+AgAAuYgCAAKFfAA==
Date: Thu, 24 Oct 2024 23:50:58 +0000
Message-ID: <6894f0472669600c06d43457bf2be60e26892ebb.camel@intel.com>
References: <20241023192307.746525-1-zhanjun.dong@intel.com>
 <a6db328f-54ef-4941-99cf-b7da52287345@linux.intel.com>
 <IA1PR11MB82006A9865919A669C83594E8F4E2@IA1PR11MB8200.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB82006A9865919A669C83594E8F4E2@IA1PR11MB8200.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CO1PR11MB4852:EE_
x-ms-office365-filtering-correlation-id: 84a4852c-1e86-4ba0-03f5-08dcf486b54f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NDdlMnVQRWRWNXc2cW9ucFI4UFBzUXR3UFdOdzRhUEtMa0UvdldJa25qMEp2?=
 =?utf-8?B?UVZlckVDZERGS3RmdEppaHhIUzJsSWVOenZBUlcxais1QVRoZGNZcVloc1lO?=
 =?utf-8?B?UHRCVmFVWjN6d1Y2Tnc0dWg4MUxVKzhiVytUYy96Z3h5L2dVZTNhbmwrTkZQ?=
 =?utf-8?B?bHdpalRmWDltWlBXc0RVWEZPdzcvVENvT3pvL2RzZ2I0Z1NuMm8yc05PR3NQ?=
 =?utf-8?B?dFNrTVhXbmI0amo3dm1YR1BTeTBvK3lpRFZ5bFJ6bnJTc2VpOEs2QVk2NDNq?=
 =?utf-8?B?REVPNHk4aDc5a0dqTnV0Wm1Pb0pRbTUxb0I2dkFDQ2JzczVQVkZ3NTM4NDh2?=
 =?utf-8?B?YWpnU2FrNlVKWGxYd3ZpV1FZaHNDZ2RuWEcxOEhnankrOFpUOGZPYkJRLytM?=
 =?utf-8?B?aENXT1ZhYnFScmxoT0FzZUM5ay9WMGU2RXlYTTZIVlpteWxTNHoyRkptWWlK?=
 =?utf-8?B?cXFPY0ExeWc5ajl3Wm9pZlp6ZklDRk5jYjNpVzJXazR6UXlZbms3VXAveXRY?=
 =?utf-8?B?QWVTNTBuTGpnR3NqSi9UUVZMeFlmbDVjd1BDQUNnMTNBSXNEaDRPSURjckNG?=
 =?utf-8?B?T2tZeEU1KzNKc3V0ZWZFZVVuVTNUNGVtRzFyWHJ0VWhPd1pWTm1GMGVVZmxN?=
 =?utf-8?B?THJuWjVOd0pqc1cvUU5LYldUd2lXdGdJSW9MSVpnYkc1MU9MS3BkcU9uTzlK?=
 =?utf-8?B?enFWWEg3ajNkcTVxVDdVaDFBVWZjNG8wbENmVjN4VlBzd3Z0d2dHeGhiMVBG?=
 =?utf-8?B?WmJTWnBjV2MxS0d1ZjYyeXIxeVBWNk5xT2dKU29KUCtaL3A2YmE3UnArQWY2?=
 =?utf-8?B?WmFUemJZdnJpWFN6b01JMWtTaENIWWk4S2FJcGF5VWY5b1Z3MVRkUUY3KzVG?=
 =?utf-8?B?dStkdmFhZi82TGc3TFFZNzd6bnFjeFhJM1J4ekNPUThKQU9LNlkxL25TUjMw?=
 =?utf-8?B?MVVVMU1NN2ovUUJ6TWc0TWJpRGN5ZHhQWkNuWDZDbXpHbWV3cG5YZ1Y1L291?=
 =?utf-8?B?V3lCRllTY0tLcVFMK2RUQlRDRm91dTM2ZTlldW1kUlpwTzczRGoxYllrZ2lX?=
 =?utf-8?B?ekJKcVYvZ0F1eHo2SXRLOFFuZTJ5QkdxYVZNRTBjbHlKT3N0cjZVZVBEOVlZ?=
 =?utf-8?B?VnptS2hRSHoxSmlwMUNnYmlpcFc5dHVJWjlsUDdJMmZGeGRQbGRqWkx1R2py?=
 =?utf-8?B?T3hRMFphamF3RjB3UzJrelZmZ2tZWWFDL2JGS1UrbHFVU2pNZ2hpNGhKRTZj?=
 =?utf-8?B?YXprUEh5K2plMGlCd2RrNFBzY3A5ajdiQlJwMS91VmdvYXUxWjdvK3ZZYm1k?=
 =?utf-8?B?eWMyMWpTRzhsK2tiTUU1T3lLUHFjdHpwTVRHdHpZUHFrTzN3SDVVUGprR3dz?=
 =?utf-8?B?eHVsMkdqTHBrZUN5SUd3ekJuKzNoYkY5bEZBOTJSWmxWUHc4SktZSGR1Tk1Q?=
 =?utf-8?B?ZW5GVkpHOUU3TmZiVkRZeEQ1MSsrRk5wanBINnRUV052ZHdiUFlyZXdsdHQ4?=
 =?utf-8?B?Ly92L1RmS2RGNmtWTjUySVdEOU05TTU5dUpoejloVGFMMEtQZkVNekNPY1FZ?=
 =?utf-8?B?MkNpSzZXbkJVNnNMMno0S2F2TVdYZDU4UEowL1VRR2NEZ28xSlorM20vTUcz?=
 =?utf-8?B?cGthUGI1SFJkWnpXTmJobzZkS2syUW16YnNsb1ZjOFpFYlIwOEhBVzZDc2p5?=
 =?utf-8?B?Y1Zwa3d2dEtTL3RPV0NES1ExUlhSYlRZMVVUYXRoRDhSbk11NFFrZERtUisv?=
 =?utf-8?Q?zIaZV5dCGhTgjdjxfc/BK6BkGNTFPdNl8IY3tvd?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eStRbldVYk5yanR1cXpWMmJGdi8weTZhTVNsT25lS2E4VEEzR1QzNFc0TjZF?=
 =?utf-8?B?c1ZaRkl1ZFZRUEdXRU9sZlByTVE0dFR6V3VEdmQvQW15NUt1Qjd4OHJQbWIw?=
 =?utf-8?B?WUlaMkU2aUNPNFBLVU5WSFFWQUJuOE0vT2l5WHAxSFVHaDh3ektUbTBMT2RG?=
 =?utf-8?B?bmZvYjFlc1JET2xYeFB4RS83OVpIL1FGa1FtTDV0Y0FVUndUSzdZMHBNZXlm?=
 =?utf-8?B?YnowVy91UnR1eTZJc0paZUJmSzRDTkFmeGE1d0lzWWhXb0R0a0x6WkgyVkJk?=
 =?utf-8?B?TjhreW5nY1p3N0NlWC9qT2hIeC9IakdKZUdXOUlidVg0VHdPQ2doQTN6ZjlU?=
 =?utf-8?B?WUVBd1F1dmFwb1paSzY5NnZxbUgxOWdTRnRhWmpwUy9ldkVPdmR6TWx6MnNQ?=
 =?utf-8?B?TDV2Uy8rVFFaRWlLWmswSlczaktNS1VySlMybUlEU1pMamZEUDVHa3F3S2hP?=
 =?utf-8?B?REJmY015UjhYQzJxVzVkaUpTOUFQaHorSDBJM2xYZU5hQ3lTQzNMSmRaSTM1?=
 =?utf-8?B?MjNSOWRyaG5SZUEyUmpGbXpmQXAzRHhMOUpLNlh1enFGR0pHREFpTGVDQzBZ?=
 =?utf-8?B?Vm85ZjlLVHVyUU5PVTRTWkFyMjJycVVVaDgxVGdyQUw2U0hqMzYyekc5RnhJ?=
 =?utf-8?B?Ly9ablhlVE95S0JXSkJ6Q20zUHhLZGVCaTVvQWFWU1Fxd3VjVk01N3RRM2NG?=
 =?utf-8?B?T2x3OXZFd3h4bW1BakwwTU5FbWNQZ2tXRjNsZDZzeCsvTXdCbjBRVVA5Kzky?=
 =?utf-8?B?bG9aZzhFODRXU2Vna0haNjNkeU1BbHZvQzBjN0MvU3NVc2JRZnRoZUVPWFRE?=
 =?utf-8?B?bkE0UklzaWdFRSt5NXBXVjZZK29nc2FMUzg0STBlbmthakd3S0NKWkliQXVI?=
 =?utf-8?B?bDUwK1RMVjZYOGlnOGc2ZE4rbzIvU3RDU3NVWlY3b0dTQVNBcXo3eVdhQkw1?=
 =?utf-8?B?d0hyR2JaNCtVOGNKSUJxczdWMzVTUUFuTm9Nc2U2emtMUitqSTltNWRUaS9E?=
 =?utf-8?B?Zzhkdnpna1lpU09QVjJ4ZE5TaGFiSkJKbi9zRlhlZGhWWlRmZ3NDdlV1Rldu?=
 =?utf-8?B?bUdsa3lSUElUTzV6bUtudHFtMEVQOWx0YlhBS0tiSVNWTDN6Mi9VZ0tod2o5?=
 =?utf-8?B?V0hYZS8wQkU1am9rQUJVZnQrYS92MjZCNXQ0NzRsT3NJZjZ5M1JVNGNlK3JH?=
 =?utf-8?B?aGVkZnJGNHY3Tzl1djR2RmtFNnMrSnJLVlg1L3lzcU9Qamk0WGtYYXZWdmEz?=
 =?utf-8?B?SFpLUlJzbitJMWNyK2s1OHpYc3NSOHhhem9ZSEl1N3ZCeDdLa2ZudEZEWkRL?=
 =?utf-8?B?bUxOQXAyTnJPcEdCcUFVYU5xMlBaelNBY3BseDBXaWVvZkhQcUlmbVFUdUJl?=
 =?utf-8?B?VlBGcGxHSzNXelpMai9OQ0lUNmpITW85a2JXTkUvcEs2R0poNlg0SzMzdExX?=
 =?utf-8?B?M0JFSm0zTWhoeWovaDlTYUtLbW1Oc0lDM0ZtczVwb2ZueUZPMXVhVm9OQWtZ?=
 =?utf-8?B?MHBNZnpjMXVRR1BwUGdaZ2U2WFhDZUpHV3c0Uy9KV0lMWWRDaWRNOUhBbWZV?=
 =?utf-8?B?bnVEcXhkSUo0QjhFblZGR2V0UDBTcGhRb2tyTDJFKzZuU1pKR1dVMytzSCs0?=
 =?utf-8?B?Q3NDakREOFBNL0JyRGJxY2t0WmdXVHZRUHRtOGdKYjZaNytEeFRFL3EvbHU5?=
 =?utf-8?B?aVR6NGkveC9mUHRFRlBjQ3A4YTN0N3hOd0hrUGRJN3Q1eW1WbzhzYi9SRzBG?=
 =?utf-8?B?RFFYNGZOSm5RR21wSzJrR2MxVk8rWmJ3WVp6akhHV2d5d3BhcGFtdmQ3M1hF?=
 =?utf-8?B?OFlRbWFpZVZoVWhPUzJldGltR3IrelZXbkpnNmhBMXB2NG5IVmg2UHQvRFE1?=
 =?utf-8?B?NSt3dDRMeFdFZFh1bEhmMmtsNVNtVlhvZlBjcGp1L01Zd2JOaFp2UVBURGZR?=
 =?utf-8?B?dVpxNmRBZnJrb245aXNkbFpHZTdhYTlRUkgzUVp5czBoZzlnVFZ0WWNzOFJ0?=
 =?utf-8?B?MUxMMFZLQXo5RHBvUm1xSkFGSG9zVVVXbVNxRVc3TjNDSkZ5Y3Mzbi9UN00z?=
 =?utf-8?B?V0I3cHV5a0FoRWhPb00zeXc4MmJGczJoalRlYzFNSkJuL1oxTzlRU3M4elZ2?=
 =?utf-8?B?MmJNNkZqTEZScnFsTjl1MXZHUFpNdnZlSFg2WmdYOXVVcEloamFkZ0p0MGJS?=
 =?utf-8?Q?4hqaT5gyEY2AZ9mQ4fFjDZI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <18AFD9FEEA0A76478B6686709275D5C5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a4852c-1e86-4ba0-03f5-08dcf486b54f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 23:50:58.3818 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CCUMOOGORFnZr6TPFSCEKRqGOekGgNM5GJm/SPscUTLnbZtzSvenBOLKKMx2u+cJ7cWaqOVL4RSlWaH3tsezgsbjnbVRqfno9Omo2CkBtgeZO8wNjGbiW4l4LC/zNmDu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4852
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

T24gVGh1LCAyMDI0LTEwLTI0IGF0IDE0OjEzICswMDAwLCBEb25nLCBaaGFuanVuIHdyb3RlOg0K
PiBZZXMsIEkgd2lsbCBzZW5kIG5leHQgcmV2aXNpb24gaW4gYSBzZXJpZXMsIHdoaWNoIGluY2x1
ZGUgdGhhdCBwYXRjaC4NCj4gDQo+IFJlZ2FyZHMsDQo+IFpoYW5qdW4NCg0KYWxhbjogSSBqdXN0
IG5vdGljZWQgdGhlIG90aGVyIHBhdGNoIERJRCBnZXQgc2VudCB0byBYZT8NCihodHRwczovL3Bh
dGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzEzOTg5MC8pIGJ1dCBDSSByZXN1bHRzIHdh
cw0Kb25seSB0aGVyZSBmb3IgcmV2NCAtIG5vdGhpbmcgb24gcmV2NC1yZXNlbmQuIFdvbmRlcmlu
ZyBpZiBOaXJtb3kNCndhbnRlZCB5b3UgdG8gZ28gYWhlYWQgYW5kIGNyZWF0ZSBhIHR3by1wYXRj
aCBzZXJpZXMgd2l0aCB0aGUgRXZlcmVzdCdzDQpwYXRjaCBmb2xsb3dlZCBhbmQgeW91ciBwYXRj
aCB0aGF0IGFkZHMgdGhlIGxvd2VyLXZzLWhpZ2hlci1kd29yZA0KZW5mb3JjZW1lbnQuIA0K
