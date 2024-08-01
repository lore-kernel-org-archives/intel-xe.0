Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28536C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 20:43:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E242F10E8CB;
	Thu,  1 Aug 2024 20:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RXnmDlo9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8B410E8CB
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 20:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722545028; x=1754081028;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=t1uVwUAzfj1UKUKiACOIvFCdk5naYFDbp5Wmn5+o3No=;
 b=RXnmDlo9dPnLH4rI+NJuW5I9nuY2cbvYF7b4rZuRoK2JBaPpR2sQqpWe
 GyCdNPVCNCZzdt/o5+wRqci5Q9VQql3nVabCY1ZfCqFjpiMmVgeZyNcA3
 3JumOA8vsLMtxxWX77vvrmEv/1at15Z4c2b/0UATopfP71Opl7QzJZhge
 r2FO8p/mR26oNv6NwjsF3TPFeErnsh6kXdGFIOrB5qqja2exF/DCnmq9a
 XmYgDsX5r2VxigJSn1oG/iR7FIdGJDGh3d7WKTUZMr3lCSWayg9iBb1a9
 JZJrmb8N4CNCLVitlPyrYzy9IV7tG4gjToRIS0vlZkqnNU+17TsbFacgg A==;
X-CSE-ConnectionGUID: C2iCz7dJSBO5RbKOCw+8TA==
X-CSE-MsgGUID: RDFF6Pf8S8Glun1wprclgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="24324790"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="24324790"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 13:43:47 -0700
X-CSE-ConnectionGUID: LBCmKPycT4O1JZCo+rZmPA==
X-CSE-MsgGUID: qWF8+TMcTwyd060zqhBj+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="78438358"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 13:43:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 13:43:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 13:43:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 13:43:45 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 13:43:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1wEoX447czAjFmSNhbi1FFE7UGfnA9QP9SG4XDJ7WOPCOaqnYZXFblMSFOLSsJPQxpTwE4mzOawcqOqAQeWqoErCtBVQaCPtSSZOsB+jRIP4qGnE2GoAkuX/nFhvT+jjFg7eeuZY/cJiE7PJlq2LoLEgSZcm1qZMI7J0rUXr84s/FhDsisLdbolYN5LZnOtta+HM+T5H2Gs6d3yGp8vQAnrls0wJ+n9yw6rpVxuusjt8y3+1190s2dfv2jafv0J0eKeS7yFlCC7vgVqw6kDVKqjGb2GVmlN1kz3LJv1pNWSqZcTT1j/vfcEDU9G4aKmYS2axiHDtfs2wjszFXEoRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1uVwUAzfj1UKUKiACOIvFCdk5naYFDbp5Wmn5+o3No=;
 b=yXYfXyWP3dHiNQshB2QbhZDDME4UcZTZzpGINGeJzW2f2t0HKi57ibMkZiI4rIqJp9JNtzaoSSSU1bBtDagf8n6Mtt1748r4dT+3Zg3HbFkKl5UrGpwpYh1JZn4K+t7+8wwarEu2ssMg6E9uT9RFh2GG7fMQaA/bvc8ELLLbupbNqMJh8TJr2f8DjWK9GVCwpXWelgSVGLdBvW7GHxZiVfn3IXY41Uyeg9tHPeBC6ZFgrp7UyhevvXMW2elzBqcI3B0RDAVnmFjpl2+sgb/eHRxrRhLXFWZYfVaccx7JM9Hzlof26p/NuOLoV9NDGZifFIJ22YhpIbPOwMIfQSMijw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by PH7PR11MB7985.namprd11.prod.outlook.com (2603:10b6:510:240::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 20:43:43 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%5]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 20:43:43 +0000
Message-ID: <233af08f-3d83-4bd7-9bae-a3f5a11f4b5e@intel.com>
Date: Thu, 1 Aug 2024 13:43:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Revert "drm/xe/guc: Pre-release GuC firmware v70.24.0
 for LNL/BMG/PVC"
To: <intel-xe@lists.freedesktop.org>
References: <20240801203341.3042386-1-julia.filipchuk@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20240801203341.3042386-1-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0195.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::20) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|PH7PR11MB7985:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d0e1f0f-c8d6-46a4-ae72-08dcb26aa1c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVBLQUVHL0FjRzhiVUtUT29OT2JBejNtdU5uVDgzSmxJdkJrRDZpVFA0dXZF?=
 =?utf-8?B?TDNURVhwaC9zZGpFZklUSXB6NlZyblY5NndwT2NJMUlkRVd6Mk5hL1FkNEZa?=
 =?utf-8?B?MVU4SmZqTk1SYjdpVWloY2tNSk83RXY3OXdWRDdhaTRPUHBaNzRScFpkejVu?=
 =?utf-8?B?TG1XOUdGSGhBZlVqSnZ2bVhkYlV2aWRydmJkaFdWdm5va21iY3dKNnUraUpO?=
 =?utf-8?B?UFcxeWNDamFyYUVmT2tzM0dpekgzODlSNXVVNHdOMkVNd3BFWGZjVXdkNE5X?=
 =?utf-8?B?eERCYjg5VElLWWtTZmx1VFV3cnloSkNPYWllU3hMWVRmNDJ3bUd0SU1OVHo0?=
 =?utf-8?B?MUtvRDJ4VHpSTGZab0xqV3UxYVRFSGpjQU9VYWNKRlpvcWwyNUpFUCtyaWtk?=
 =?utf-8?B?SzNRdlQ3bDJ2SWxoYjlEQU92bmJIUlNZTEhoVlM4Z0RGa3FKVUtxWVZIWklT?=
 =?utf-8?B?OEUvQjlrUVd1MzBUTWlJcXl3V0k0SjhvREZlblpnK1NrZG9MdmhrZTJRVy9k?=
 =?utf-8?B?SWxUMW8vdGxuWHlkSk1wUmZrcGlYNCs5Q0ZHQTdOSW5GV1l5SStseWxDUTdi?=
 =?utf-8?B?UGpqTUdRV1p4RE9FSVN4Um1obHBDVVZkK3A5aU5LUmtWLzM2dEtkUEl6enhP?=
 =?utf-8?B?ODhtRzNzRkJteVZGcUptQ3ExNEF5VWIrcEhSZ2ZXZHhWRU9xY1pnclRvcVpW?=
 =?utf-8?B?VVE4a0NKYjVJbXkycEQ3dkxHcXk5YnBySHFxcEMxM2FIODdkampGS2VVZWlm?=
 =?utf-8?B?RkRtNkErd0loUHpRTWhQd3hhTEV0enU0dFZNcVFWaHNIR0hSbXdTK1BObm5z?=
 =?utf-8?B?RzF0eUF2b2MzN0N1NjZFbGo4ZHRSNDR2ell5WGVqTG42dnBxamZqSVhabVgr?=
 =?utf-8?B?VWE1TEROUXJkdXJPZ2VhYnhTTFlkVndkd3V1d0JlR0k3eDBSUUtmNXZiaVda?=
 =?utf-8?B?RHFTMHQ1WlBDbEZ1NWhDeHRaMHJsR0JGNTRhODdQVHlpQk01b2Foa1FoS25s?=
 =?utf-8?B?cEpYeGJ2M0Q5cjFraEtua3RpY3RjVXRyTTRxWnJ1dXNkRTdHOC9kNnl5czVa?=
 =?utf-8?B?aHdab0ZrV0IxaE43ZDMwLzloNDQvNmFRckx4WDQxSktJVUEzaU9jZTNtRDJL?=
 =?utf-8?B?R3cwOWZMbUZWUjNKdE94d01IRFVGYlVtajdOU3JReFVLQWprVW9Wdjl4cEZS?=
 =?utf-8?B?SU9IV3ZlSHpLT1k3TmZoOWNzcnNpZ1pyWXdib0NqSnNwRGtobitZZFNRMVZw?=
 =?utf-8?B?ZDhpdFFsV1dnOC83QmdpYlZ6RTNWV2pEbEI2c2sxeDMrRWxZd3ByNW5mVjBK?=
 =?utf-8?B?cnNIeHFvN0ZsM2xQRkZ4TEhZU1doeEtkZjRJeDFadk5NUnp1b3dJeGpmWG52?=
 =?utf-8?B?WS9jU3dHenZOY24rSWJPU3JnWlFibDg1QzNVQmhsZGZRbkE3RVNzOWlvNTFr?=
 =?utf-8?B?R1NBSWZFaElDdlljVzVVdWprR0l5RXhreS9vajNkRzBZUUJDMitmMFdCd244?=
 =?utf-8?B?cjBBZ0NOK0w5SnB1RGRuV0NEd0lUclRvWFRYOEFNTHVWS3gyZERobE1ka0gz?=
 =?utf-8?B?eFpCeHlYZEZlMS9kMTdYaW9mb3ROcDluQ29JaWRGUTNjVkRRSzdlMlFqcjJp?=
 =?utf-8?B?eXZaV0NGeURnTTl5VExQWjVvZXdpVzJ1VkZIR0pLTVF2R2ZJZTBRS0xUWXI1?=
 =?utf-8?B?SWsrVzVwR2VzRnVBZmRlVEsxbUJkVVo1azJqVFNXeU9zQjhoN1VYQ2FyY25W?=
 =?utf-8?B?ejlTTlZDR3pTV0V0MGVtQkpleE9vM3BrZXZSWnNPTWNnVldmYk9Na2NjTGJG?=
 =?utf-8?B?MlJXRWdCT2dscFExTm9qQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d21KcU9EVUlkTnZzTmlDN1YyME1Fbm1qdk5jbXZER1pSenhRZll0cE0yMlVS?=
 =?utf-8?B?QjVPS1VwRzhtaXloZ05JbThmZFFTNUJ1eWZRVmNrWnNtSW9yNk5mZE9UUU5U?=
 =?utf-8?B?SzNxaXYvRUo1VmpIWVBtTnNhMm1iVU1KcGFyZmRBWDBkUmxtSy9ScWo2OC9p?=
 =?utf-8?B?OEZ4YW9HYmEzMnhHTnQ3RWswS3l0c1JUL2RSRHh4SSthcEtHUC8yUE5VTXlO?=
 =?utf-8?B?RzNnazJTaDJ3NjBNQlN2bk54Qk92Q2I5aWJCcUJyb1dkaStqeGpUWkU0anRI?=
 =?utf-8?B?cWRCRFVmV3FLUVBzNUFlSDRlZWlLOHo5VGxacDQ1dkNhMHp4SzAvUzBEdHp5?=
 =?utf-8?B?K0h5Y2VlVktYdE5sQzhIaVRtcnNIYTZwZWIzcFo5Y3hwQmMxSHFtbEJFSnJU?=
 =?utf-8?B?cGVyajQzZ1RteE9Wc1FTazJZbzJPYUYrcFNqY21obXZTZ1NtanJhdVFFQ1A0?=
 =?utf-8?B?bGlaVU9ucWI5dFlxanRjb2t0RDJvcU5UVkZzeUh4TUlLUGpxWVdtZ0R6bHNL?=
 =?utf-8?B?NzVUWnIyekpKdXppVTJqNXBGUVVIbkF0MGVvL29UVU1CRjJCV1hWSWhkc2ww?=
 =?utf-8?B?T1RENEpGS0tLYjZoYkFPZlp0OFZBbkl3MjV1UUdWU2dOdmdJQ0ltZnFjeitq?=
 =?utf-8?B?Sk5Ca2ZqRkIrV1ArZXkwVkxIMFpSa0cvVnVGYnFqckpYb0pidE1RZ0pxTzI2?=
 =?utf-8?B?cDNjaWpNdTNPb0xoZVpDdEFNSVZNeWZucEI4UG9Nakk3R09vanc4YitpTVVP?=
 =?utf-8?B?RUZSeUlrZE41WCtkTmdSczZNUVF5UXRNSmNJQzZ2Y09CRVpCbFVJMUJLcTVq?=
 =?utf-8?B?OWhmTVVZU0N5TDVMMTd2RjJvMEc2ZW5CTktmMnFIcmlhTWI3V2MyYzRPdGhw?=
 =?utf-8?B?SEYyODM4aFpCVWtCYzB3ajR3ZnowQ3IvOGFPMDNPaWdieWo1eDg2TzA4L1pL?=
 =?utf-8?B?RkQzY21qZjBMVmFsS1d1WFo1aGlwQ1BHV0JLMjFURG02ZElXaGpjS1ozcEhq?=
 =?utf-8?B?NXd1QkFuWVJvZEFhcWRBWUhKazA1NytPaU1KMGRPa0VDVS9xSnRCVmhzaHhH?=
 =?utf-8?B?WW84Q3JneXlSTmNTeUhYbERYbytGZm9KVG1ZcHc3dzBoNG9iUXVmMWViT1RK?=
 =?utf-8?B?anNLb3VqbjRwQ2lxMHRMNG9leU80K0JWZjdtRVdWbzZpd3pZd0RudEVUMzhR?=
 =?utf-8?B?Zk1tVWQzbnFObFgrbFBwU293SDdweHN0bUpsazlWeE1UTG5tS1dPZ3U4dDVL?=
 =?utf-8?B?YllwcGxmeVdYc05ydW1oMmFUU3MwREhJMmtTazJpK3N1RkVob3c2RVFqQXVi?=
 =?utf-8?B?Um41QXFQd2tmNE51WkN1MFB5bjIyS3VHRUNWd2VYcVY4TmhxSEFGbi9RQ29X?=
 =?utf-8?B?elBkaVBHNVhxcUlFMW1Xd0MzVmR5amlyVjIyUmpvOG5ZaTZEUEs1M0ovZXVk?=
 =?utf-8?B?Q0c3aVgwMzhLNWNSUDM3bmFWRERMWmFSUjdZb0pVbHdvbkVjaDcvL2JxSlZh?=
 =?utf-8?B?UCtiN1VZYzlxVlNnU24xbTdzM012NysydGdVdEZYc1ZNdGxLYWxWS0h1UlFB?=
 =?utf-8?B?RU1YM0kyZ083aWx2dE9aWjgvMkg1YS9RNU9MaUV0T3VWVHc1VzhBVkNNOG9B?=
 =?utf-8?B?SDNMN3hHSTJTS2dlMS9xOTdzcTVHWXQvQWI5MGF5YlpjdTVlemlvVzllT1J0?=
 =?utf-8?B?VmlVUVZ3Y3NycWhzK1VHQkt0ZWFrU0ZLQVhFakhsKzcrZDNCVldrK01YUmJG?=
 =?utf-8?B?T0pKcjh4Rmp1MFJxZmp3ZzNCYTFqWU9VRnJKRHpoQVVwSC9jenVKeXBMbXlK?=
 =?utf-8?B?dlFoYi9pTkNsaEd0Q3hxaU9tUjl0QmFKdytRYmcrQzhCVFpVN0l4YjlIa3M5?=
 =?utf-8?B?bWdBKzlRNmZmQ2s3YzkvTEhleWdHY2lYa2orT0d2TFJNbCtiSlZ6cTBGOFJr?=
 =?utf-8?B?ZU00TlJ1NEppMXEyWERyeUFBYm02eHRUTXZ2bDl6NnpmOWJLRHVxUkphQnY3?=
 =?utf-8?B?RGg1THFiMzNLQWNjc1hiRmg4WUw2U3JvYW1rNHJwTVZFZGorSHNlV3ZUUUZI?=
 =?utf-8?B?WnpWYmRwK2dlVkFTc3V0WTBmNGQ3aHdkYXhIcHVMNHlBWkNTN1YrSTZ6dlVn?=
 =?utf-8?B?MzNXSklFMmxseTVQajZpQU5tUEdsVFBtTXlIb0h4ZU4wT3M4cGtwZkdFcVVn?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0e1f0f-c8d6-46a4-ae72-08dcb26aa1c6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 20:43:43.2716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gR9+pSwBg5ZcEMPvSZ5Il6j5rFfv0moa+1cQFYOCyWs0NAP91CH+ngpqJ47PmMf6jjMIpSfxbYrf/AdMSI91XTFpNOUnm18P3VL8BaxnrKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7985
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


Please Ignore. CI canceled.

Will resubmit with cover-letter and --reset-author after cherry-pick.

