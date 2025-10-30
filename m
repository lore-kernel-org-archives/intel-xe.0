Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D192CCF9E3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 15:11:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF3E10E9DB;
	Thu, 30 Oct 2025 15:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UGUNGuyZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A737E10E9DB
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 15:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761837104; x=1793373104;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lgIb+P4156Srg347Et20C+SIi2O0+1d5w7B574wmFJE=;
 b=UGUNGuyZHac+g7VIjmRDQETN4IgTCFSDlz8V6yXtWa288kLgVCno+qi9
 kKgXWYwrLyNHvBuGDYDLVvs4ToZxrmlGEbjvaQS5W7S5tOh7KHJOYkSSN
 /703i5v2VDIvvZ1L3mcsQ4kESOlGdnsHNuIr09d3OLXxyw+rJy+U0Guew
 PAYXmrVF6aEwnw0+UIkXZuQZ2IfV4q/al5Wet20jykYV+0N85AW8aQ0LZ
 x95XnBOJpXq/VZ6tS6MiYsVEWGV3fki1Ab7piYQ66Rx4oqPnWxpcOr0aw
 JZjcRaCnnzLvCQVr6+Jn7P6HOoFAdxNzpBtTo5OhDhDlG1JfstcfPcvNT g==;
X-CSE-ConnectionGUID: nyeyCox7QIWCchUQjIGF/g==
X-CSE-MsgGUID: zMNJLUNIQ+mN15OSP29MNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="67634203"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="67634203"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:11:44 -0700
X-CSE-ConnectionGUID: s5sr/6l7QAybs3ykGUlNFw==
X-CSE-MsgGUID: 19WHmxxoTHm5O6C588Zudw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="190051424"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:11:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 08:11:42 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 08:11:42 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 08:11:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UmI6x/o6ZoL4BE3bAy2o5tDSnsYscIpnecQzgb0TkXh1wdboGeyaNGdeXU8affdSFoZVW0ion+CA0rgdOU1XwD5zB2hK5LjEKxtx6u4nfY4nxCTVExVY7ctZSeI6q0VwFI7XPbQD//iuchfeC+XtQwisRaV1/h49v8WQ4NXf9W35AsDvTVtzq3XHa2B0enB6pIj+fU93NNOwI+MvrKmSirOZCw1do8TJgyZ6kZBh7AYplQqwqEqZ8Ri/U8KdAlRBxdEsqpEyi86FBATRFJEJ9jpo/rLKbEfzcvePHepolxAeC843mzNb9Ezvjm+uyNT7PBOm7flkim6HDbB8VScdBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4XPHLSew2PS7mTn8yZL6lJqQChGKQ3RshQwEE8PKqtI=;
 b=rRKPkcH68a5MQjreMGqO959ywJdUKgqDkHgeOOQDes++pVuP5rk6EKNZcOVzLWbrtSa2Yoacimkb+IbLasczYmFLQc14G7X+9/BRXO7iNqbvxF0iydXXjelsdlhhkNUgNzGm2UCGxQqpLXRUx3oagIaSJ7PEH/Zjmb+jMDT1xFVM9au8gCz9AFHnoXlw21NTlNUek2k6Qk6anuBrIsKDZX6PXjZEyOEcRRkqRApFkkm6ZcM9rHW+HZBRa2JebzkEVrqqLPwVz77/64knOVQkPFE8W+vtnwZihizaSyxGi5iUTL4H4xLRX6yg+bt57UfMHMdiDNxHPTWKpjK5mYfJXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by SN7PR11MB6559.namprd11.prod.outlook.com (2603:10b6:806:26d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 15:11:40 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%5]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 15:11:40 +0000
Message-ID: <368c2a70-324c-43bb-bb2c-7f0a022fe7f5@intel.com>
Date: Thu, 30 Oct 2025 20:41:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] drm/xe/guc: Eliminate RPe caching for SLPC
 parameter handling
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Jadav, 
 Raag" <raag.jadav@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>, "Purkait, Soham" <soham.purkait@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Poosa, Karthik" <karthik.poosa@intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>
References: <20251029112014.3747915-4-sk.anirban@intel.com>
 <20251029112014.3747915-5-sk.anirban@intel.com> <aQJXIw7zBBy38Dhi@intel.com>
 <ba940a51-9d20-47d4-8b33-6f8241f8edd7@intel.com>
 <984175e33b6669dd3db02cc306465c51f196f314.camel@intel.com>
 <696c7127-84e0-420f-8ee1-72b7a64492e7@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <696c7127-84e0-420f-8ee1-72b7a64492e7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0087.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::16) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|SN7PR11MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: b43f5dd7-25cd-4ae8-a08e-08de17c6a067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnB4aW1ybksyRmhzajhCSWM2NWpYbVlYYlg0Q3R3WFZUaEpzRWFjTjcrTWU5?=
 =?utf-8?B?SUl3dERYZkg0VERpaWdNcEtwUDNrK01USWdqdG43VVVWWGJaeHdnMTgrQklv?=
 =?utf-8?B?MjJ5MUpqK1JFakNEdXdubGgvNTBUejY0QzRES0N6RmJHL3VGUWg2VUN2RUl1?=
 =?utf-8?B?MkN6TmFBSzI1R21BT0hCSkdMNWNaRHF0K0UzQW8zMFc4amFjaEl0WEtIZVNX?=
 =?utf-8?B?Tml6SGlxODVaaXV4L3A5NE9wdXp1TmwzTHRGM21JSm9SRTl0UFNDU1NiNjdt?=
 =?utf-8?B?K2xIOVhGNm5sMGpVK3FGZWJjYmhQbmJ5ZUNUbllvTWNwWldTZlJqRGloV0pD?=
 =?utf-8?B?VVhpelRObStRSDYxc2ZaY1ZUcExvUkx2MWdpSWdvZFpJRmthSzQybXVKSkhn?=
 =?utf-8?B?Mm1BOVBiVjdJSi9lVjM1Z1JETnZJTncxV1RQejNBVFRPYzVQYkI0K0lTbVNQ?=
 =?utf-8?B?aGl3RmViZzNheVZOQSswR3hINFRwbUxWVkdoWFZoZVUwSDJmNXhWc0RlNmdi?=
 =?utf-8?B?SXVvZ1k4RUtraG16WVpjUDJXZDFwZGs4WlkyV2VwL3pHNndQUzAzVDRKUzlo?=
 =?utf-8?B?MTd4UXh3Zm9OS1E3V2xJKzVEZ2IvTlo1TTlNUXVuMzAvU1JKdC80SGVpR0VU?=
 =?utf-8?B?ZzNvaXZlSUU4ZENtV2xqNktSRzIrS3lxR3NDNDQ2MnptTVRqYjU3UmZBUXBL?=
 =?utf-8?B?QkZEUktzSkNxTUpPVHNqbHdPTVFyZU9HTDYxVzB2RCtPN29DRHYydzdSQ2sy?=
 =?utf-8?B?R0wvMHNKaG1CYnZSSjB0K3dSc1htM2FiUjZJdmpnNFFmNS9rUnU2blJsNXBv?=
 =?utf-8?B?RlhXYWNOdFV0UmFqZ2wrYmpLcTFkbkdmUXZEQzNlV0Jkdmc1YnZ6ODZwcThx?=
 =?utf-8?B?Qkx6RkhRUGlzN3VrZFQ5SGI2SzhHamorLzRPRzVHaC90TEJYdjgxSFBJRDVE?=
 =?utf-8?B?L2J4bzB5UVVtc3pWQWY5Q3Zia25WVlB4aVNhNlRvaTNMdlZXdXlrSHRVdHVj?=
 =?utf-8?B?QlFBUzdBSkdUM0prSmxlWUlSeVBQelJWaGtMdko4L2xycDV3YlJmOXRZS0xj?=
 =?utf-8?B?akh6dTVXSHhBbFZVTUlCSThLa0FSb0tSL3VJcnNZYVBtSmZDeUVYT1E0WTZF?=
 =?utf-8?B?alB4WW5YYWNNNWVaMzlscDFXNTJua0hYd2l0UVpCV0VhQWJ0UWExSUw0KzFG?=
 =?utf-8?B?MUVubm9kcktBWHErbVJmNUZGRHVwMUpoKzVHV2t3Q1NyZ2xBc3FWL0R5dUsw?=
 =?utf-8?B?NkN1cng2Ukxwek9DdGgwSXRRYXUyVFRFbXliemNEVGk0eEZWWE5kY3NOUGtP?=
 =?utf-8?B?R2EwWmgrQ0xYWlhQRE1XYzlRNU5kYUpVR0JDbGltbHBhdFdMOVlZQTAxdXo3?=
 =?utf-8?B?S3BpcDg4aFpxaHFXdjB5Y1RDVXk0aDJMay9nazZpWWhZSmN1aXpab1BGeEdI?=
 =?utf-8?B?cnczeDJzbjFlU3J3ZUp0d2tsQU1jK0NOcUtPVTZFai85MVNEZUJJY1BnZlY5?=
 =?utf-8?B?UHdDRFIvb1B4L29kanFpRFRTZGV1RThjOTRHcklLZzhvczhrNWIyNEhwNm5j?=
 =?utf-8?B?SDJKVmxBNm5tQjdWL0ZYN2RBQXZrZnZlRjZjUVRRSU1GQ1hRYmVuMEJXQmZL?=
 =?utf-8?B?VW9salppTktIY3dTRDJzbXA5L2JYME5Ub3BnOTNzbmlmOXJDbXdQWDdZSTY1?=
 =?utf-8?B?b1haWHpnVXJQUFZZbnNDbjcvV0Rsc1E4d1dSc0s5TFdBTXJjSE9nZTUrekxo?=
 =?utf-8?B?QmdDeThZeThySnRqSWxhY2FRd2xVcnhaTmNmWUZhT2xIdmwzZ1d6c2tWZHow?=
 =?utf-8?B?UW9UcDdWeUljTTJ3T0czRVVyOHJWUlpYUHBmcjJWcm96M3R0SlJmdTRxU0x0?=
 =?utf-8?B?U0FVN25vOUdMZ3EyQ295Nm52OTRWZEEzQ3VtMUdOYlRRYXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWVtWDVTSksyZkVhcXdsR25QUjZlN0FjZGROMGkrMTl0TCt5UVdkZi9VNTZI?=
 =?utf-8?B?YTgxMmMvejVvVDVZbUZrVlVrRVg3eVhBU3daMlVlTE5hZW9IYXdLNUJBd3Zz?=
 =?utf-8?B?cHREWWdmTE9YTWNlZnBiUml1R1d2RmFkOVljME5lcUJnMFBkOTNielVUMlNP?=
 =?utf-8?B?L3FHTWRYTjR4VVRFUzd6c2RzYWJnN1plRHhhdHZDbGRROWVSNm02YXFGTnJR?=
 =?utf-8?B?eFJreGdRdm9ndWZZVDgwbDVyN1QrcUVWU0RuMkJObEUwbktlN09RUit6UWty?=
 =?utf-8?B?NHRMa0huNkRqWjhucE1XK2NBcEYrUTlPYWRDREFlNklxVktxY20vTmg2Yi9V?=
 =?utf-8?B?L3F6QjF4ZUt5S0F0NXlGalJ4cUNRM2R3aGhWTk5YNkVKZGJMV3BSSHhHTks2?=
 =?utf-8?B?dlMvVy94cHRvbWEvTVpIa0x3dW0zbnVXWnlHSEo2WXJnc3p2djFDN0JsL1Fw?=
 =?utf-8?B?S1E1a2NuWXM4U1NVQllWOWozdDJ0NXVqQk14MzR0UnVzZ2gyMElrSjJIQStx?=
 =?utf-8?B?OE9JS1NhUnAvdFFlMVpVY2paSnQwUHVVK0Vyb1R3RGhpOG5CTGFqWktpNDNR?=
 =?utf-8?B?YzNpSmY1cm9TSWpvY2JSbno1Z2owcnlTUlRMUEFEb3RVbVh2OWppUFlkK0Yv?=
 =?utf-8?B?d1Axb3RhOXNUcnI4NW5hV2Zka3IwRmhRd2pVSmc1a3d5N1U4aTJieVRWV3o1?=
 =?utf-8?B?eVpmMVpIc2I4NHRDVldLV0pIaFF6ajBhSWh2RElxaC81MU9GcitFZU1XZTZT?=
 =?utf-8?B?LzdESmsvci8vanZjMTR1Z3BEZFVJYmtGQ21uMERrV3drTU94MVA4S0owVEFK?=
 =?utf-8?B?WXNEbnBrWU45eEdYN3Fza09BNTVBV0k2d0Zxb2NaMTEveUxDOWZuNlZ4dnpl?=
 =?utf-8?B?eEFJL2MxSDY5aVlCQjhyZVdzYjhDV1lhMDdyMlZFVWJiemZoY01TOU1STWM2?=
 =?utf-8?B?QWxqYThkVTNNRFJKQWpodDg1TUdQdkZHeXdXY09sR28xU21lZ2E5cEkzVVFI?=
 =?utf-8?B?SWc1V3h2VGI0aUxROXFSWXZGdFp1a3U1bFJqc2RlcTlmUVVkb2haTDZwK0F4?=
 =?utf-8?B?RGVzM3g5TWZQSmtPUGRiMFpGbDR0QVRUSGtGbFJmbngrSEx5Rk5CV0Zzd1VC?=
 =?utf-8?B?QzY3MFJydHBiNTM4ZGtsSDlpeXN6V0poV1dXNFFFWFBEcFcvUlVTdzdkZXpQ?=
 =?utf-8?B?OHZ5Tjk0QnhYbTYrWSthWXN0VHRlYmNFamhyRTE2VWsrSldkdWZZWUhsdERj?=
 =?utf-8?B?RzVBcWJaK1ZuczhjT2JGQnN6OVM0K1pDbW1YK2pKeHVreUcyQ2kvVDBiWVV1?=
 =?utf-8?B?MHdqVmZKVzNWcWNnRlErVXBseFN1UFl3bFpuaUNDUEJuaXFMSWRjalNWcjg5?=
 =?utf-8?B?aFVjRFI3WUI4M0QzTzJ4eW9paXo3YUloOEVGNXlVc1RkbXJGbHowU3B4bW1B?=
 =?utf-8?B?ZGN0anlYYnRPWWFiMVZOdE8rcmUvckdXZkd5OXY2d0dCZkQ5cjhMM0Mrdmlk?=
 =?utf-8?B?Mjlmd0szNFVWVzhSSVVWR3V5Rk9FQWs5RndJbDhGZzhLSzUzakUvYlJtYm5N?=
 =?utf-8?B?dms0L3NoaHZaM2ZGOFZmRVRML2NDRWNaZUExUVZxdGZFZnRmc2QvaGRzdUxu?=
 =?utf-8?B?Y1pxZVlHUU1Qc0QxZUJtbWRGbXd2eHd3WGJ2bURCdFIyNk93YTlsTkQwZ2Zy?=
 =?utf-8?B?Nkw5Q2F5Y1YrdEtSNnN3NURuYi9MeVZ6Wk5zaWM0NXo0T3VzMnhEUTdIVVM5?=
 =?utf-8?B?N0ovckpyR0E2VDdlQkFZZGZpNWtzcGFMdGF4L0tvRkk1WkZ2UG1NRFdZVU5X?=
 =?utf-8?B?bVU5QUJyNmJJV0x2RmlTWEZQa1FzQzl3MTFSS05xTTEzT2RCSm9aZVJVeXJj?=
 =?utf-8?B?MCtMb3B3SlNYQS9odXBlQkF1S0p6eTV0aUxWNm5BSTVxUzBBam9ubk0yYWZM?=
 =?utf-8?B?VzkvVVlxYTlaQmJIb2JjM2x5MTkzSXVIaUtRU2dFMW9DS3loMm5yRmFKQkNZ?=
 =?utf-8?B?NXVVNFFrc21BSHRhT0FzWFZockRtNkFKeitpS3E2SU1QbmRvQVptUHJhK28y?=
 =?utf-8?B?OGQwdXZYeXVEK2RYWXBXZDZ1Wkp0dGtyMTVCejBNWGlXS1h4LzViVVNLL2FX?=
 =?utf-8?Q?0rYkK+zBEK/Da0KZWEGqzgMOK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b43f5dd7-25cd-4ae8-a08e-08de17c6a067
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 15:11:39.9129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +RVMXF16Kgh74ZqECS5Sy2w1B33uOw43KZnoaJVvjaqwLOULbMEuyoXMJnX52XXs3gRmOvpqfa5I9jImPP8FmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6559
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

Hi,

On 30-10-2025 02:07, Belgaumkar, Vinay wrote:
>
> On 10/29/2025 12:58 PM, Vivi, Rodrigo wrote:
>> On Thu, 2025-10-30 at 00:05 +0530, Anirban, Sk wrote:
>>> Hi,
>>>
>>> On 29-10-2025 23:34, Rodrigo Vivi wrote:
>>>> On Wed, Oct 29, 2025 at 04:50:16PM +0530, Sk Anirban wrote:
>>>>> RPe is runtime-determined by PCODE and caching it caused stale
>>>>> values,
>>>>> leading to incorrect GuC SLPC parameter settings.
>>>>> Drop the cached rpe_freq field and query fresh values from
>>>>> hardware
>>>>> on each use to ensure GuC SLPC parameters reflect current RPe.
>>>>>
>>>>> v2: Remove cached RPe frequency field (Rodrigo)
>>>>> v3: Remove extra variable (Vinay)
>>>>>       Modify function name (Vinay)
>>>>> v4: Maintain a separate function for PVC (Rodrigo)
>>>>> v5: Update RPn while fetching RPe frequency
>>>>>
>>>>> Closes:
>>>>> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166
>>>>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_guc_pc.c       | 75 ++++++++++++++++-----
>>>>> -------
>>>>>    drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 -
>>>>>    2 files changed, 42 insertions(+), 35 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>> index 3c0feb50a1e2..08deaa64aa85 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>> @@ -330,7 +330,7 @@ static int pc_set_min_freq(struct xe_guc_pc
>>>>> *pc, u32 freq)
>>>>>         * Our goal is to have the admin choices respected.
>>>>>         */
>>>>>        pc_action_set_param(pc,
>>>>> SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>>>>> -                freq < pc->rpe_freq);
>>>>> +                freq < xe_guc_pc_get_rpe_freq(pc));
>>>>>           return pc_action_set_param(pc,
>>>>>
>>>>> SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>>>>> @@ -375,7 +375,7 @@ static void mtl_update_rpa_value(struct
>>>>> xe_guc_pc *pc)
>>>>>        pc->rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK,
>>>>> reg));
>>>>>    }
>>>>>    -static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>>>>> +static u32 mtl_get_rpe_freq(struct xe_guc_pc *pc)
>>>>>    {
>>>>>        struct xe_gt *gt = pc_to_gt(pc);
>>>>>        u32 reg;
>>>>> @@ -385,7 +385,7 @@ static void mtl_update_rpe_value(struct
>>>>> xe_guc_pc *pc)
>>>>>        else
>>>>>            reg = xe_mmio_read32(&gt->mmio,
>>>>> MTL_GT_RPE_FREQUENCY);
>>>>>    -    pc->rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK,
>>>>> reg));
>>>>> +    return decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>>>>>    }
>>>>>       static void tgl_update_rpa_value(struct xe_guc_pc *pc)
>>>>> @@ -408,24 +408,22 @@ static void tgl_update_rpa_value(struct
>>>>> xe_guc_pc *pc)
>>>>>        }
>>>>>    }
>>>>>    -static void tgl_update_rpe_value(struct xe_guc_pc *pc)
>>>>> +static u32 pvc_get_rpe_freq(struct xe_guc_pc *pc)
>>>>>    {
>>>>>        struct xe_gt *gt = pc_to_gt(pc);
>>>>> -    struct xe_device *xe = gt_to_xe(gt);
>>>>>        u32 reg;
>>>>>    -    /*
>>>>> -     * For PVC we still need to use fused RP1 as the
>>>>> approximation for RPe
>>>>> -     * For other platforms than PVC we get the resolved RPe
>>>>> directly from
>>>>> -     * PCODE at a different register
>>>>> -     */
>>>>> -    if (xe->info.platform == XE_PVC) {
>>>>> -        reg = xe_mmio_read32(&gt->mmio,
>>>>> PVC_RP_STATE_CAP);
>>>>> -        pc->rpe_freq = REG_FIELD_GET(RP1_MASK, reg) *
>>>>> GT_FREQUENCY_MULTIPLIER;
>>>>> -    } else {
>>>>> -        reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
>>>>> -        pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) *
>>>>> GT_FREQUENCY_MULTIPLIER;
>>>>> -    }
>>>>> +    reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
>>>>> +    return REG_FIELD_GET(RP1_MASK, reg) *
>>>>> GT_FREQUENCY_MULTIPLIER;
>>>>> +}
>>>>> +
>>>>> +static u32 tgl_get_rpe_freq(struct xe_guc_pc *pc)
>>>>> +{
>>>>> +    struct xe_gt *gt = pc_to_gt(pc);
>>>>> +    u32 reg;
>>>>> +
>>>>> +    reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
>>>>> +    return REG_FIELD_GET(RPE_MASK, reg) *
>>>>> GT_FREQUENCY_MULTIPLIER;
>>>>>    }
>>>>>       static void pc_update_rp_values(struct xe_guc_pc *pc)
>>>>> @@ -433,20 +431,10 @@ static void pc_update_rp_values(struct
>>>>> xe_guc_pc *pc)
>>>>>        struct xe_gt *gt = pc_to_gt(pc);
>>>>>        struct xe_device *xe = gt_to_xe(gt);
>>>>>    -    if (GRAPHICS_VERx100(xe) >= 1270) {
>>>>> +    if (GRAPHICS_VERx100(xe) >= 1270)
>>>>>            mtl_update_rpa_value(pc);
>>>>> -        mtl_update_rpe_value(pc);
>>>>> -    } else {
>>>>> +    else
>>>>>            tgl_update_rpa_value(pc);
>>>>> -        tgl_update_rpe_value(pc);
>>>>> -    }
>>>>> -
>>>>> -    /*
>>>>> -     * RPe is decided at runtime by PCODE. In the rare case
>>>>> where that's
>>>>> -     * smaller than the fused min, we will trust the PCODE
>>>>> and use that
>>>>> -     * as our minimum one.
>>>>> -     */
>>>>> -    pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
>>>>>    }
>>>>>       /**
>>>>> @@ -560,9 +548,30 @@ u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc
>>>>> *pc)
>>>>>     */
>>>>>    u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
>>>>>    {
>>>>> -    pc_update_rp_values(pc);
>>>>> +    struct xe_gt *gt = pc_to_gt(pc);
>>>>> +    struct xe_device *xe = gt_to_xe(gt);
>>>>> +    u32 freq;
>>>>>    -    return pc->rpe_freq;
>>>>> +    /*
>>>>> +     * For PVC we still need to use fused RP1 as the
>>>>> approximation for RPe
>>>>> +     * For other platforms than PVC we get the resolved RPe
>>>>> directly from
>>>>> +     * PCODE at a different register
>>>>> +     */
>>>>> +    if (xe->info.platform == XE_PVC)
>>>> I believe it would be better to convert this to the graphics
>>>> version here
>>>> instead of the platform name. But no block since it was already a
>>>> platform check
>>>> above.
>>> sure, I will look into this.
>>>>> +        freq = pvc_get_rpe_freq(pc);
>>>>> +    else if (GRAPHICS_VERx100(xe) >= 1270)
>>>>> +        freq = mtl_get_rpe_freq(pc);
>>>>> +    else
>>>>> +        freq = tgl_get_rpe_freq(pc);
>>>>> +
>>>>> +    /*
>>>>> +     * RPe is decided at runtime by PCODE. In the rare case
>>>>> where that's
>>>>> +     * smaller than the fused min, we will trust the PCODE
>>>>> and use that
>>>>> +     * as our minimum one.
>>>>> +     */
>>>>> +    pc->rpn_freq = min(pc->rpn_freq, freq);
>>>> setting rpn_freq inside this get_rpe function makes no sense.
>>>>
>>>> I'm sorry I forgot about this when I told you to kill the other
>>>> function.
>>>> It should stay there, but be called update_rpn instead...
>>> Since RPn updates depend on RPe, my intention was to update RPn
>>> whenever
>>> RPe is fetched.
>>> Alternatively, I can maintain a separate update_rpn() function, but
>>> in
>>> either case, it will be invoked during initialization and while
>>> retrieving RPe frequencies.
>>> Another option could be to simply rename the function to
>>> xe_guc_pc_get_rpe_rpn_freq() to reflect its dual purpose.
>>> What are your thoughts on this approach?
>> I think you need to get to the drawing board and think on another
>> proposal. This is becoming to get really messier.
>>
>> update_rp simply update them all before the actual get.
>>
>> you don't update another thing inside a get of a specific thing
>> of interest.
>>
>> think of what are the cases where the rpn update is really needed.
>> think if we should have a constant workqueue refreshing it if not
>> idle/suspended. Think about all the consequences of the updates
>> and removal that you are proposing. And always making sure that
>> that that igt freq test is reliably passing.
>>
>> But something is strange in the current proposal.
>
> Agreed. The issue was we needed to get updated RPe. Why do we need to 
> update RPn? That is a fused value and never changes. SLPC min freq 
> changes with RPe. So we need to ensure we read SLPC min every time (if 
> we are not doing that already).
>
> Thanks,
>
> Vinay.
In that case I guess it's better to remove the RPn update from the 
current implementation. Also we are not caching the min_freq & guc will 
update both so everything else should be fine. I will send a revision 
with these fixes.
>
>>
>>> Thanks,
>>> Anirban
>>>>> +
>>>>> +    return freq;
>>>>>    }
>>>>>       /**
>>>>> @@ -1021,7 +1030,7 @@ static int pc_set_mert_freq_cap(struct
>>>>> xe_guc_pc *pc)
>>>>>        /*
>>>>>         * Ensure min and max are bound by MERT_FREQ_CAP until
>>>>> driver loads.
>>>>>         */
>>>>> -    ret = pc_set_min_freq(pc, min(pc->rpe_freq,
>>>>> pc_max_freq_cap(pc)));
>>>>> +    ret = pc_set_min_freq(pc,
>>>>> min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc)));
>>>>>        if (!ret)
>>>>>            ret = pc_set_max_freq(pc, min(pc->rp0_freq,
>>>>> pc_max_freq_cap(pc)));
>>>>>    @@ -1339,7 +1348,7 @@ static void xe_guc_pc_fini_hw(void *arg)
>>>>>        XE_WARN_ON(xe_guc_pc_stop(pc));
>>>>>           /* Bind requested freq to mert_freq_cap before unload */
>>>>> -    pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc-
>>>>>> rpe_freq));
>>>>> +    pc_set_cur_freq(pc, min(pc_max_freq_cap(pc),
>>>>> xe_guc_pc_get_rpe_freq(pc)));
>>>>>           xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), fw_ref);
>>>>>    }
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h
>>>>> b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>>>>> index 5e4ea53fbee6..f27c05d81706 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>>>>> @@ -21,8 +21,6 @@ struct xe_guc_pc {
>>>>>        u32 rp0_freq;
>>>>>        /** @rpa_freq: HW RPa frequency - The Achievable one */
>>>>>        u32 rpa_freq;
>>>>> -    /** @rpe_freq: HW RPe frequency - The Efficient one */
>>>>> -    u32 rpe_freq;
>>>>>        /** @rpn_freq: HW RPN frequency - The Minimum one */
>>>>>        u32 rpn_freq;
>>>>>        /** @user_requested_min: Stash the minimum requested
>>>>> freq by user */
>>>>> -- 
>>>>> 2.43.0
>>>>>

