Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D987C8303C
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 06:45:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9EF10E0A0;
	Mon,  7 Jul 2025 06:45:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SKB+/KOA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481A610E0A0
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 06:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751870710; x=1783406710;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eCV4uP/RrSo0hXmD+aHLl4ahMJ2jg4Jf0WVugvy2neA=;
 b=SKB+/KOAYtxI3tESf43EFpLu/35eHSojsRawMn9Sk5B50+bTArkyw8tu
 ahLmndie2QtxfNwIJuflioYBl0IWfbYIhx8xiilHBHPf2dIXYbz5lSGyR
 SfzhGa/O06jwxbpcZe7WWTpt4VfHIuLuJINPpLYOfMXJo3n5zgxZsb3Vp
 3y/BPXSTWcKuC59/nXtifFTjPDqXhHkejUUp//0Sd2SSunPzdTcJoL40L
 rav0XLUyCLbA0u4XCPHtrRi4mrPfNI8QSUjjsJKqCxYjJfGJUk/DjFpTv
 QZZBXyq3HwQ5l/KPHoRCVZ3xqlw3YkCiOGP36mYNlxeO2Bo8uU1M1svRZ g==;
X-CSE-ConnectionGUID: o9UrbIhdSGWBADm00oTRvg==
X-CSE-MsgGUID: PGLwYfdcSZ+MtZK34v/tKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="54007506"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="54007506"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 23:45:09 -0700
X-CSE-ConnectionGUID: Y8N5CoTbSgalTHSLSWLoaQ==
X-CSE-MsgGUID: UVDio0yLTM+I0veqrL/o5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="155233369"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 23:45:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 6 Jul 2025 23:45:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 6 Jul 2025 23:45:00 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 6 Jul 2025 23:45:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EOFIHo6eWn8WZLEpY4WgWYnw7gl+xggW3hqNinsaGUG65QmGmWyfyWHajZb+dwSqrp/3QrHAj7vd1NEbqcsyHxLys5nJAIw+8YB5wOBhMJQvuOsPP/DxJ1hcFa9vXJwno17Jn+im25tVZJdfgtHQaSZh9KbaaG/t+ohQKleAS2scmWWkSCqBoUVbTyA4uAEHj7nB8izSwGjwMg7EwXjDX3MH6tL3ncOfyGRoGmNDFIpWZcv80NAofuacsnVYpXJalVkMLG7XsmNmxMHqaBbTWKd53FE8skwLO2mEPpUur+/OEW6yEUw1dHOXOA09xRBOWt5sEXxkeUnH6tnFLi3zTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+AmsLMSjHL0bsphtcEqqL32A3l131o16utv7P5dUsw=;
 b=tpkJN/HoLwb7ruSB1TxKOKGK5n5B8mqLjWYNWCqnq4/aP0YebOSUWdS9v0C/hPIr4Uv3DKbmbIoUgcSMS51hDjZhxutvquYYaqDyXQbiY+4xHebAZ3N1St3WVmM3qbbJMFmHY99WrBagI3XJPzcg1SA0z8EG33hgEec41yLDwpZliqchDl0XsKbcZ5SpCLwLBoDzE2hdi/hjyd/9YEaZiEE7RA1cDg12lRVPCRFy4UMr3wThdMxot0hJP79qXZPwGHWrNCnWm0e5zOTVFw2KRwFY2LPUmeV6V/fdB/XuV740T4FJ0fnxBTNC0zAwGilyTY4mfjuuUxBiKqfvdm01tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY8PR11MB7243.namprd11.prod.outlook.com (2603:10b6:930:96::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.25; Mon, 7 Jul 2025 06:44:16 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8901.021; Mon, 7 Jul 2025
 06:44:16 +0000
Message-ID: <85434c79-ab24-44f0-b96e-cf91ccc17de3@intel.com>
Date: Mon, 7 Jul 2025 12:14:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] drm/xe: Set GT as wedged before sending wedged
 uevent
To: Raag Jadav <raag.jadav@intel.com>, <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <frank.scarbrough@intel.com>,
 <sk.anirban@intel.com>
References: <20250702141118.3564242-1-riana.tauro@intel.com>
 <20250702141118.3564242-3-riana.tauro@intel.com>
 <aGYEh4xOlqnB1AoY@black.fi.intel.com>
 <bfb862d4-145a-46ba-a944-2214db388eca@intel.com>
 <aGYnCXkIuYMapBpf@black.fi.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aGYnCXkIuYMapBpf@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY8PR11MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: f1840e34-9635-4d35-4753-08ddbd21b12a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXZwbytaS2dXeVI1N0VtYnhycnVnN1N0S2NBc1VUUm94aHQ1SnFnM3RvUHJY?=
 =?utf-8?B?WVh0UW9iTktnYUVyVHBTVGRuYjFORFR0L0FFbGJsRDlaTGh5eEtST1orRFZk?=
 =?utf-8?B?SDNwdityZk5SRm9JeFVkOUZLRk9aNS8zVkx4Ynh3VUhkSGZVckxjc0hBUE10?=
 =?utf-8?B?VFRrRDRYbm92aVVlanVoZzVtc1NLMC9pdWllN2RDdnJhV2h4YUt5Q1IwWnFh?=
 =?utf-8?B?bDdzRHlUWjhTK29HL0tpbElVVmgwV1JUeGhWZjNNQjBSSTJuWEZJTFRmUEMw?=
 =?utf-8?B?VlFBd0l0RFVQSmlqWEFMUmtYVnY1aWl4T0pJR1NOcEZBQmUrRGhONC9YSzJY?=
 =?utf-8?B?ZUZCOTV2RjJybys1SVl3eitLN0Z6bEI4Y0k2aTNSS3ZyZ2pPd1k1R1BHbjVV?=
 =?utf-8?B?VHpBNUJzODl0Z0FrdnQ5QVhZeWUrdG5ic085VkpiU0ZJZ2JJWmlLUWhPSW9Y?=
 =?utf-8?B?bjcyc01WR3kwSVY1VGdnK1lXZnliSFUwNEVaT0J4b0FmRTJlcHRCK0VwTGRY?=
 =?utf-8?B?MnFUOEFiVlVFZEhpNGNWOVphTEtIa3cwaE83UjdidmtIZEpoMlR6R2hWeVpj?=
 =?utf-8?B?MTdxVXZCa2FFZEd1Z0ZuVHhPWGphYzBML3daMlNvNmZMUGwxejJEaHBGUUtp?=
 =?utf-8?B?blJsRU9VUTBXTktVakloUGgvN2x2KytNSlZ1cFZmRU8zbFJ1UVpyWmNseGR0?=
 =?utf-8?B?V0ZDOXQyMjNhZmZaY2tmSUdoU3NUUkxjLzhieGx0SWphakpLMThBb0NPYzg2?=
 =?utf-8?B?VW1uaUdXUUx0bGN4Q1B0NzFvMnBQaG54cEs5RW5mQklrSVdvNlNOMWdRd2lM?=
 =?utf-8?B?R1RwZUg5Y2FGelArK1BPbGtOZjFoRzhMM1hjSFdhaG5ZYzlCb1AvSzBRbVJH?=
 =?utf-8?B?ODZzV0NRY05teXl3STJ4bDJVQ1F0bXlqcnR0VWxqa2doVkVzSDdLcDhDYlVO?=
 =?utf-8?B?SjZYbkFuTTZLMlMzSFk2eE45NVNuZmdOSFdrYW1NN1R4VmR2K0xCR3ZKUlVW?=
 =?utf-8?B?Q1dmclhib2JUU09Rb2FqNkpqZHJBN0Y4UFAvZnNaYTFEeW81blNnQkExQm5h?=
 =?utf-8?B?cXFCWTdrZ3pPaVBDa0xIKy9WbE9Ic2ZQeENveHhMclJGeXZhd0UwUmlBc05z?=
 =?utf-8?B?dWgvcDdGbGRxUG42bFA3bFd4UWdTb3hvL0lKVWxPOTBRbnFPQ0c5QWR1Ny9L?=
 =?utf-8?B?UUFyaGJTRXlQQkRBTzczRnk1bWdKNmpMRWIzQ0RWSzNOaG5Eb1FNMWd3UklD?=
 =?utf-8?B?Y0lEek41UjIvOFdkcW5UK3NxZWpQVGpSQnRKZitFNGxidUwva0lzNW5uNVl0?=
 =?utf-8?B?bnY5STlOS3pVUU0rc2VReXMvYkl0Y29KRkZjeVh6d083cHNKMzlQVXUzaHVr?=
 =?utf-8?B?MHB1bEJ0ZUVySkVsUmZvZjZiZjNwR05na2FabGtLeEZ2Q0g0RFd2SUxZNEdz?=
 =?utf-8?B?cGRNbU5QVm5VRVAwYkpQSlVPeDNHSjlPRG1FSFVhdUZYOVYrdXNvT0tHL3M5?=
 =?utf-8?B?QnJNUWU2WGZzc1BWUFduZ0hNZTc4eEhEeW45ZlMzN2hZYTdUdHpIcVI0Z0NR?=
 =?utf-8?B?V2gxNHQ4SFZHdHBmRDJaUGJTUVhyc3Z2YUpDdW1ZR2dUUHIydFRvRmV1M1Fp?=
 =?utf-8?B?QmpWN1hnOThiekR2b3dJWFpPcVcwelVzcktUOC9RWmRuczlTTUZHV1ZLUnpw?=
 =?utf-8?B?aE85RDVGRzRQYlFmNjk0T2doUzRGZ0pGS1BDN1p4V0t3K1JKY3RIelRlbDR5?=
 =?utf-8?B?R08xaGxXVDljMXBJMzNoaW9GMHQwc0JiT3BFVjVVUEtMNlZGRE1BOXlQVmxl?=
 =?utf-8?B?cUthY1loVHlhakpOcTBRME9IMFNKR2RXSDJ5YlVHcE0wV1JCUGF2eHVXUHFH?=
 =?utf-8?B?clBZN3JMM0NUZFdaa3hXTCs3UVVTMXdzU0RXUCtEN3VYWGpQci9BKzE5Ynpv?=
 =?utf-8?Q?+JOWu8hTo0c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVNIZnpHL1pqK294eGNVVmd3QVJKdStWOTVVVnUxczVSU0lPRU1CMkRubjZv?=
 =?utf-8?B?bUQwZGpJM2Z4bWJCTnJ3bUJvYWd6akpmV3lsUTNnWVlZZEV1b0RudDA5dVlI?=
 =?utf-8?B?b3ZSU0JNN1lxMHhva3FZS1IwdHYxQThjSVJzY01tSHVST0wxd28wekJ4TmxW?=
 =?utf-8?B?T1VGN2dIeXEwT3A3SkNxbjFVZSt6V3RBaEI4WS9wa2xITytXMTgzOVJTNGl4?=
 =?utf-8?B?WktQMHAwOWkxZisyejV0ZGFnYkhDMmZWZVU1cUNCY0JBT2pmbzY0dUtVdU1q?=
 =?utf-8?B?RkxLR0NFZVFkOWQ3cXg1MzlTV0k2ZVZ2ZUFBWU1LbGxRT1g2ZEtEWStsNGN3?=
 =?utf-8?B?dm5lajJZak4yWVMwOEFJZGtYYkdrbktxMUxYRUZkYkdrb2cxLzU4MzBnQVhU?=
 =?utf-8?B?Q2swaVVBcitiVnplWk1oVVJVOEFPNEtCZHhrZWMwM0d4bnRGaDU3UkIvbGxI?=
 =?utf-8?B?Y3NFM24rWnFGMjF6Tm5UVnVJMHA2WGJ1d0duakovZThaZld2Y0poVjI5MHhF?=
 =?utf-8?B?WC9MRmIvSElMNE9YaUp4dng0eU5PdmZaRnFOeERhckx5ajhicml0SG5DRHlG?=
 =?utf-8?B?YVZrck9NMGJOVWIzT05FUWZSMmovUHhpd0tadmFUVjI4c0JHYU1McjhKS1JI?=
 =?utf-8?B?L0hkSnpUZUV3QlJRSUZhM2FsYURnK2dtRUUwWEIxeUl3SDFOc0Z2Z3ZhYnJs?=
 =?utf-8?B?dTdvN0I0M09kRVpDRk9tdWVDenM3VUFVdkdzRUx1WGZqcXFWc2xmNG1iSVdQ?=
 =?utf-8?B?cG0zUVYwMUhJN0Y4WjhIMmZsREMxQU14KzFXZEoyeVpHb1ZId2RhQUx2bXlF?=
 =?utf-8?B?Y1ptQXNZUGhWTjlDOGVLZGJkWk9SRkZqc3NaYUVjMDhRbmhFdk85T0JzU3Av?=
 =?utf-8?B?SEhhcm0xcVZiK1BhME9RbnFzSTZKYUw2byt3QlpHL0hmMGpvZG1jUGJhZXF1?=
 =?utf-8?B?NVRiY0xhVTg3VjdaUnFEcVRvM3dkdEJpQmhtME9ianBISi93Tk5ScHFvZ2li?=
 =?utf-8?B?QTFKa1Blcnh2bk5JcDZ0V09oODBMUGo0KzR3ZGpPMmZpeVJ1K1d4UTc3VXYy?=
 =?utf-8?B?WGRkZ1pIZ1NWdSs5K2p0dk4wMHVrWFE1SDVKaDhaUFNTaEErNktNbU91MDEx?=
 =?utf-8?B?Z29NbFpBUmFrbE83OW1tM3JHZHBvNTlPMnN0UncvcXBBQVJ3dEYzWUtXcnpP?=
 =?utf-8?B?Qko1d0NHMHQwM3cvR25QTk92Yk12K2h5WU55OTBXN2RMMG9yam5XeGJabTk4?=
 =?utf-8?B?WEdVeklLZEVlTVVHSnAzU2hEQ0RvWHJPZHIwUDA5V0JsTUFiTzBOcUV3emdH?=
 =?utf-8?B?dWgxU2MzNXJkNmJxZ0NVV21Gc1VTb3JsNVFxek0yczd4OVpBTllUREo3MHBM?=
 =?utf-8?B?bTMzc1dxbWpLYlVaRlNabHlpemg1OUN0M1o5Y1VXN1Z3UWI4dG83elA3cXVI?=
 =?utf-8?B?bGRwc2R5RGdhK1E5Nk5uVU96MHp5b25zbVZvSnJnMEhzSzB6b09GRUtYMm1I?=
 =?utf-8?B?ZjNLaFRlcmlIVEFPbTltNXFZVnBJQllEeWt0akNrVXVGVWtMc3VWc0Z2Z01j?=
 =?utf-8?B?UzZHbGxlK09tRXZabVpFd3VENFRDeTgzU1NNS043N1lNdXZENVhuRHI2MHAz?=
 =?utf-8?B?WGdCQWtoUUxRTlRrU1Z6OWM2WHMvYlZrSC8zZG8xbUZmNkM3U2VjRGVCamtx?=
 =?utf-8?B?ZXRwZEQ1ZFdON0pXZ015ZEVySGJhKzBQUHNxU3VydDZyWnNhRmZEQVZOdU1K?=
 =?utf-8?B?cDl3blA1QUhlZEsxNWtBUXhiLzFtYTZOOWlVRHB1cVJ4blhqb0VpSHU2cnNz?=
 =?utf-8?B?WmZvUEVpZnFQLzJYZXgxM1VhN29SSVB6Q2xsSnZkTkViOG40c1J0M1RBYkJl?=
 =?utf-8?B?bWkyVkw0elBBVmZlTTZGbnJ4d055SHJJM3RQUnIyMTVra3NLakJmVXlReHgr?=
 =?utf-8?B?amNBU210a3IvRlRzaGFxd0cyQW92N2VTWlBTTFJXdzdFMGxYWnl1YmtzaS9p?=
 =?utf-8?B?SXdpVUZkVkZ1cVJoVFpCelFSemhLWTI2UGpOUXAybzlYZ3A2VEcwVXFCb1Z2?=
 =?utf-8?B?M0dqZnBTbE1yMW1pYk9vZjhXQ1d3OXFxQ2VHblpscUxsQk1UMW9wRXMzT2Jh?=
 =?utf-8?Q?2IsHcuz1QP7WgXlUQ2k+kan2S?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1840e34-9635-4d35-4753-08ddbd21b12a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 06:44:16.4174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1qfEMq7xO8dchlpE68FF07t0JYzdtDcP8pqVoajeAmVkWJkhJ23T7clLL9nPGrmtqEeAR8i7xqPsIDzX2iaPNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7243
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



On 7/3/2025 12:15 PM, Raag Jadav wrote:
> On Thu, Jul 03, 2025 at 10:48:06AM +0530, Riana Tauro wrote:
>> On 7/3/2025 9:48 AM, Raag Jadav wrote:
>>> On Wed, Jul 02, 2025 at 07:41:12PM +0530, Riana Tauro wrote:
>>>> Userspace should be notified after setting the device as wedged.
>>>> Re-order function calls to set gt wedged before sending uevent.
>>>>
>>>> Suggested-by: Raag Jadav <raag.jadav@intel.com>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_device.c | 10 ++++++----
>>>>    1 file changed, 6 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>>> index 0b73cb72bad1..4a38486dccc8 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>> @@ -1123,8 +1123,10 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>>>>     * xe_device_declare_wedged - Declare device wedged
>>>>     * @xe: xe device instance
>>>>     *
>>>> - * This is a final state that can only be cleared with a module
>>>> + * This is a final state that can only be cleared with the recovery method
>>>> + * specified in the drm wedged uevent. The default recovery method is
>>>>     * re-probe (unbind + bind).
>>>> + *
>>>>     * In this state every IOCTL will be blocked so the GT cannot be used.
>>>>     * In general it will be called upon any critical error such as gt reset
>>>>     * failure or guc loading failure. Userspace will be notified of this state
>>>> @@ -1151,6 +1153,9 @@ void xe_device_declare_wedged(struct xe_device *xe)
>>>>    		return;
>>>>    	}
>>>> +	for_each_gt(gt, xe, id)
>>>> +		xe_gt_declare_wedged(gt);
>>>
>>> This is changing GuC CT state and can race with ioctls, so I think
>>> the sequence should be
>>>
>>
>> Then isn't the previous flow better. The ioctls are blocked anyway before
>> sending uevent.
> 
> Yes, the idea was to move the event call and not xe_gt_declare_wedged().
> 
> https://lore.kernel.org/intel-xe/aEMFcBSWL_jPMYKa@black.fi.intel.com

Is there any reason that xe_gt_declare wedged is not inside if?

Can this be moved inside if instead?

Thanks
Riana



> 
> Raag


