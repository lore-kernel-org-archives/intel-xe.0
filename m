Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CB8C02192
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 08:12:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21C210EA46;
	Fri,  7 Feb 2025 08:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VjZqyYd1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3E910EA46
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 08:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738915923; x=1770451923;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dkgbN7DrWRpIT2WguHAlRPxF34dpRon+aCTHwRSYqCc=;
 b=VjZqyYd1WzrSqxdzSeRJU7V1PG3e1OWATcYxZczNcSEhCo59/6c/d1gY
 5+1DM/1QZ5pMmX/3bssooEFTaJOYr+9RVrRyu8BDvDqShOVSyhoWSgUKl
 aaTa4Xpi7JSHqnhzYKbbF1hVS4JYnaCLOrJIXvgANleBs3DutbyiD31XY
 LVoJz2R8j6TIXH8Oj8r+4q4P6PZkUrEHi0ihuzUNmyEDAGFSj3dTIFbXS
 MtD5JIQiGHuh9IpS+xW+wo2R3gFdDkAuy9Z8qkEjwBesLTbLMhWnvYjSu
 2tZJcBpqh3hisI/gAOohTto2N8QZQ2e7g1Zqi+IiwKKDYlRNAaHWVJiwb A==;
X-CSE-ConnectionGUID: B73/HA+dQPOlutoVALhZbA==
X-CSE-MsgGUID: t4kCgA6mTRGg4JqC62lxhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50940674"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="50940674"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 00:12:00 -0800
X-CSE-ConnectionGUID: dBBhOnsbQPKwvtIPUS3c4g==
X-CSE-MsgGUID: +d/qDBqPRsOD3H7oFfnWPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116079615"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 00:11:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 00:11:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 00:11:52 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 00:11:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1WVQeL9VCL5jqLzkgcoDy63r5Q2hqJT1wLNVH953BE7bjXnca/Y+mwthA2ZthfcJffaCdKO2yBKYZEPUUyzg6WS7aJMgUambXr7KQwdBfUTZSrI951hB90qaS2p52wLG4XiQkUdsNc3YJhk9kxDPX7YfnNERJ1myi9TXboDlrMJ7nR9+rq2xxLpMe5TJX3+mNXQbH6ZuK1XcNf6rKkr2JKDgm1HFKCqtFMy+Zf9Ew0r+VrbQICHfLK9MxiSRlZO4a6lP/J/vwzwYRes0TuR3p4XqtstZxvV8+0eXl0fXhzudd2BHeueKUshf5aUeMlAizsnGY8uAl3dhzGHyHbFAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/zQDTl72TeSRKqFmhVHX9iNyhLDkHAOsCU3MhnpiSs=;
 b=eQDBpCFxrGoAgWOBJPVYIezxPc6sKpytuPkYGdl4Zgu3zalGbx9C07Kd49w0ND58QOuKEJP32QofMMRiOcONgd8EKg8dyA7J+5JJdW7Wd6ld6GYGaOGLUf/IU7yEzeZs4M7LsRwaiEIpzhiLp29tVdTyeNULtaa4md/jBu2Igm7vaVlyPtoUtqaous9bYsAZOotqsnpnUv5ArRdUCkbKvhbI88kpRySRmmeFBTUkxoLi2Wd2jc5zQAmVa1GnHoA8qGlbcLOHeDdsM9FgU+PlXhFNXW+zpg4EhoPl20I60s+SYtNRMTbBy/DGhIokIaWRE5yw2TUi1sYTX5eI6TS99Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW4PR11MB8292.namprd11.prod.outlook.com (2603:10b6:303:20c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Fri, 7 Feb
 2025 08:11:34 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 08:11:34 +0000
Message-ID: <9d7b9617-e7aa-4c24-80ad-34e81b3ebaac@intel.com>
Date: Fri, 7 Feb 2025 13:41:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/8] drm/xe: Add support for per-function engine
 activity
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, <umesh.nerlige.ramappa@intel.com>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <vinay.belgaumkar@intel.com>, <soham.purkait@intel.com>
References: <20250206104358.3436519-1-riana.tauro@intel.com>
 <20250206104358.3436519-7-riana.tauro@intel.com>
 <b6020e99-5e20-42d7-a0f9-169ed068b983@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <b6020e99-5e20-42d7-a0f9-169ed068b983@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW4PR11MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e95f447-8336-4ad5-7a4a-08dd474f092c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1l6M09LVGJIRGNtYVdGUFh5VlozSU9wd05nbjRCemFFWTZMR3ZieDlHcWh0?=
 =?utf-8?B?RHlDODhZei9KT3VHWmJkREN6Yy9GU2N6Q0F0cFlGaU9aZmVDNlZMOTZwTnpw?=
 =?utf-8?B?d3BaVS9KblpwdlVzWUFXS3dzcTRYTkNMK2tsZGdlcTFsUWIwMGt0UWw4bFdH?=
 =?utf-8?B?R3I0a2hUUmVPVnhreGlSMSsxakx4NzBxeWFUZmx1UjZvWmZXY1hBOFBSa1dT?=
 =?utf-8?B?UUxPL3A5RlZ3QUcveC9admZPdWw0WjRmNlZLZFlPSGJQeDhTa2c4TEZoSlJw?=
 =?utf-8?B?dC9oUE8wbDZnM0VRQ1dsR0pvRFM3dnhoclM5ZDNRejFiNlhkUTh5UTJIVE85?=
 =?utf-8?B?RmhEQTdXcGp4T25obkJCalBldE1DZG9ZSFV2YXI2T1c3RzhRQjY5a1hpQ1k4?=
 =?utf-8?B?b0piUDZHSlpEQzVZc1MwV0dMdTN0M3RNNllSM0pKVDNGZFJmSFBaOFJTVEJY?=
 =?utf-8?B?ZDNvYWhHVkZnV2tYelBlRnJ6WjR6WlVaZG1JU3V5NVUyTFdsSzFqdTBYS1NN?=
 =?utf-8?B?YWJaNFN0SVIxN25NZzF6d1FRZWNPeHVVMGw2UVl6ZkNiY3IzWk1Ta1B2S3I0?=
 =?utf-8?B?bW9MU2JzazZPcFdvdW1Dek4rUmN3Y2xpY1FidnczVVk4UXkyZXVPMG1STHFJ?=
 =?utf-8?B?K0VXVWxocTFqNEF0dkdWc3gxNlhEL1ZaRlE1MzV6UUVzNjhzVXppbUI0Ly9O?=
 =?utf-8?B?ZWRWWkl1MEc4dWhkNHFrVjJGVFlHN2NSRTVtNGpMejdoVmNTbSsyWmJtekRB?=
 =?utf-8?B?aUpkeWs0MndFODdqbXJWblhtbG5zODc4ampZOEhHLzRJdXVrK0NXVmhKdVJ6?=
 =?utf-8?B?MlpHNW9MOGZUL29uOXJoOVlxUW5sUFkzSDQwRFlqaldWVmt0ZldDNFVpcjhC?=
 =?utf-8?B?akJpNjhTdGJiak0zeVltNjRqZDBsbVlyb1RSSVlueTNkb0pYVG9CdE1Hbmd0?=
 =?utf-8?B?ZDdvV1NGSXVGdWl0ajVoUEFmTlR2Zk0vRWRzZHVuOVVHYlFBeG9ORGovdmIw?=
 =?utf-8?B?ZXRheDQrcHhiN2IvbGpIRXhtY2VWWk1jVU1BWm91M2xTQ2ZPcTVjVWM2Nm91?=
 =?utf-8?B?NjlzaTl3ck1ZNUdqVU9IL2tBTFdWU01WSzhXQmF6TGE5djB5QkhVWlo5T0FK?=
 =?utf-8?B?VFU2RXgvWWhZNW1xSDR5R0NDcUMvemdMQXpmTlFxMHlQelNmcXppR21JZWFn?=
 =?utf-8?B?Y0VXaDFuN2xOZWtMcUdoYTRyN0F5enpZYVBmYmt6UkVGdVY4WHEyR1d0MC9M?=
 =?utf-8?B?OXpuNGRjTmhwdEswQXY5b2w2MTg2ZEZBd2l2b1JKKzNKMDM0K0xOcUtRMytP?=
 =?utf-8?B?dVJraW1oWFVqc3ZLZDJSMTZjT2ZYVnZ2MGMvYnpla0dlMGsxcm9lVEg3RFUw?=
 =?utf-8?B?WVpxNmtDQ3FnbnlHM0g2NnMwU2RQdmpoWktOYTVXWC9KUUxxL0RZV0t6UFJW?=
 =?utf-8?B?ZjdycUZ3TG9PdjBHMEVrYWZVMGQyc29VbzhZMUxaNm9KekpGVGRWejA1UkVL?=
 =?utf-8?B?clRIZ1NhZkZoSE1YTkFta0JaNmdGR3U1MS92R3NXcHMvTkp6OVpqTThucU15?=
 =?utf-8?B?OFprZVVjdmdxYk5Ld1VjaGxSRkQ3Ly9kVm1HMU04MlZlK01BdkVLQVBEQXBQ?=
 =?utf-8?B?Y0dXZkorMC9qMEIyNDdtN0JaUEZEWUFscEZ5amNDZ2wzb21CbGM4V3RUa1dT?=
 =?utf-8?B?ZUl4NGI5S056Zjg4V3Z5cWJEVERjUVYyOVBiS1FEbXRKb0QycUhOR3dmcUpL?=
 =?utf-8?B?bzJhTzk5Y3NOeTBXbGdqR0kzZjdkMDkrVG1NL2EzZTFFaTVTNTZXL0V0V1Az?=
 =?utf-8?B?UFhWbGVGQ1ZSelVSOHRiNUh6WlRwWWVsa1NSaHQrUUpxNUVhb0VmYUV4WGVC?=
 =?utf-8?Q?FW42Ld7lgqmAI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlRma3dJMWpXc1JrdHVySjNjNHpwWUlTL2ZHdUlXODJFSUJJbktUeVFhVE10?=
 =?utf-8?B?NDM0djE0UzlkMzFvb1lFSFlIdmJGR3N1NllKY3dPTE1BUGhDaDRIWDhhYWVJ?=
 =?utf-8?B?eHdQVFp3c3YrTHhKRHQyYlZBY3Nnc2RqU0lva0lrNXNudjFBQ2o5eHRySHZR?=
 =?utf-8?B?YTZ0SWlyUU0wQlhodWVaSGY5c3JlZzJDSFNVTUlCelQrcU80bFZ4NTFKa0RS?=
 =?utf-8?B?REQ5WEFiR0Eyekk5ckowQlJKMEp0WWNnOGozZGxaTmxkaUFidVpPZ0pUbThY?=
 =?utf-8?B?aEF2aUUwSFllM2tOUHFOak03U3VYMjRFRWszZWJabU1WVzBXNFovMmwvWGxr?=
 =?utf-8?B?bUhtSWk2Qm1ldXA2L2pFUVVjMDBjRElUQW1IWDR1MXNzemtaa0Ixa2NabmZi?=
 =?utf-8?B?N0tDb2tIMFljRHFHR1lJcUJHVlR1dkJ6enVjYUpxcytGWjhQK0plcDI5Tnoy?=
 =?utf-8?B?THdFcjI0Q1V0WFMxTlpNc3lHTFdUbWg0akdNLzJIRUdhYnp2dFhFaGFrOGgv?=
 =?utf-8?B?K1ZsVHJBQVpKNE5pUndEL0Mza0c5bCtrT05xNUVPN3NaQzlGdjhFZ3VnNXlE?=
 =?utf-8?B?Q0ttNlZuV25Za1k5NzNPMjZYZVFnK0swQStkekxKdG4zd1ArWVE0ZzhRbEts?=
 =?utf-8?B?amxtQWttalR2N21jVEFyQTA2K3FMRTNzbk1kcTV1QXhHSkVZeXBIYTMwbFd5?=
 =?utf-8?B?WXFoMitVOGZ3eVgzYTNXSmlSdFhwZ09GSm9QYnhrTUErdkpSYWJvc2xQSVls?=
 =?utf-8?B?V0U4YTdjdzRIcHVYdE5YNzFFdzY5aXh0bWVDRGZZek1nVUw0dm1vdlB3ZTcx?=
 =?utf-8?B?THZad2ZxSkVvV1pVTURNQStwZUV2alhvVEYwZEhFU0lGNUI2NUFtenQzNGFx?=
 =?utf-8?B?RnlwVFFRUVdMTXJTU0VVNTRWbmdlWEhVVVBVUVFxbktLWWZZT2RBRlRBZFIy?=
 =?utf-8?B?VzNackN0QzJlNzdBUGU5bThLWi93b0IwdGRIREhiU0Rva1VObEZBaGRuMFEz?=
 =?utf-8?B?eHpBaEpLMjFWRWRVNDg5NUN1YzFKQ1FON2dFS2YxSWI2b3JlYmVSMzRuVDBi?=
 =?utf-8?B?a3d4U0NJcy9qUVNaSjdjeWtyVlhqODlWRXR5bUVRK0RzQWwyTVN4SzkwZUFy?=
 =?utf-8?B?eWxrZkg4ZmpVdkRlRCtmYktSbUY5eXBLb09ZQkdyY1V4UDI2YWV6cFl5cHBP?=
 =?utf-8?B?N3VoVTlhSm0yOGNIRVBOMytNZ05yUDZxQzNVaTJDVlNCbC9tR3dMZUhqai9s?=
 =?utf-8?B?RUxWYjNoUFVCbXBncDl4U3psZ2MzUEllQ1drZXhOWUI3bnNUTUYrbm9FYUJK?=
 =?utf-8?B?bWovZ1laMXRLbWptRWtUMkFrTUloNHFzZXpqRkxQUjU2OU93SnlNRW8yNHZU?=
 =?utf-8?B?YlRPS3RGeVNSVm1GSFI5N3ZHVnJaVHVpQ0JJV3g4NUdqRnFwL3lBbk14bytn?=
 =?utf-8?B?NGlqOGYzK3hrTkQ5TGxtYnhETDdhRm1UWTVBT3NsN3ExY09NNXFlbi9aVTlX?=
 =?utf-8?B?andsbGYzTWgvMzdXRHNGdnBSaHFDckpGSmY2SVlFMG5NQXZURWVPU2dDRVlI?=
 =?utf-8?B?bHVKdFhRT0pWbkVFT3lVampTaTNJcy9QN1RjYWR0RFVNQ05RRldleGRPYWZM?=
 =?utf-8?B?bHRoTTNMWTYvQTZSdnhTM1F4S3MyUlJlbklXSGZRZGFENjAyVThTOWdhdXAr?=
 =?utf-8?B?NUhLOTEwRjEyRCtYMG55aUZudVpzK05IZCtoVVVGZjVrL2hVaVZEOWxDaHgz?=
 =?utf-8?B?Um5mOFZYdEtha21HUGxSeTV1RWVGOUlXM1BWSU1JTWpPYUtZZU9keEdWa3lm?=
 =?utf-8?B?alVSdDR2U0xJcktXK1hQL0k3UDdQa2VldU5BY3lsYTYzYm03eGw5WmltUVRS?=
 =?utf-8?B?NlZXWDV0MGRlOC9SMnpLZ0t1MXhEaE1IUWFjbWc4eHZGSGZtMEtENjE4d1hE?=
 =?utf-8?B?WndxQXhzUStoakRIUDJQU1dab2ZLMDV6L0ROQU1KbUVMQXNjcVZPSXhEVko0?=
 =?utf-8?B?RUtsUURpSGlLUVREa2pJYTVNSmtFclNjbG5xQnBqRFkvZnRoc21CWjh2UHFO?=
 =?utf-8?B?STBrbTk0WG4yTWJVR3k3ZEdLZkcvMk92TisvTmk2SmtXMVNRMWphNWZRS3c2?=
 =?utf-8?Q?U2xGNcLAJMclYmPWFVuLifI7g?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e95f447-8336-4ad5-7a4a-08dd474f092c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 08:11:33.9964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tHKwf9Is1BP2fbYYXl7ZvT5BgQcHxx3fxeftvrkdemXjFhebFXkqj9ELNPhk0OEgRRI41SuIiQ3mJIoWcBhptw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8292
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

Hi Michal

On 2/7/2025 12:36 AM, Michal Wajdeczko wrote:
> 
> 
> On 06.02.2025 11:43, Riana Tauro wrote:
>> Add support for function level engine activity stats.
>> This is enabled when sriov_numvfs is set and disabled when vf's
> 
> VF's

will fix this
> 
>> are disabled.
>>
>> v2: remove unnecessary initialization
>>      move offset to improve code readability (Umesh)
>>      remove global for function engine activity (Lucas)
>>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
>>   drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 208 +++++++++++++++---
>>   drivers/gpu/drm/xe/xe_guc_engine_activity.h   |   5 +-
>>   .../gpu/drm/xe/xe_guc_engine_activity_types.h |   8 +-
>>   drivers/gpu/drm/xe/xe_pmu.c                   |   4 +-
>>   5 files changed, 192 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> index ec516e838ee8..448afb86e05c 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> @@ -141,6 +141,7 @@ enum xe_guc_action {
>>   	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>>   	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>>   	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>> +	XE_GUC_ACTION_SET_FUNCTION_ENGINE_ACTIVITY_BUFFER = 0x550D,
>>   	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
>>   	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
>>   	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> index 5d67fe38639a..0ab9112466f1 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> @@ -15,35 +15,62 @@
>>   #include "xe_hw_engine.h"
>>   #include "xe_map.h"
>>   #include "xe_mmio.h"
>> +#include "xe_sriov_pf_helpers.h"
>>   #include "xe_trace_guc.h"
>>   
>>   #define TOTAL_QUANTA 0x8000
>>   
>> -static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_engine *hwe)
>> +static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_engine *hwe,
>> +					    unsigned int index)
>>   {
>>   	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> -	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>> +	struct engine_activity_buffer *buffer;
>>   	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>> -	size_t offset = 0;
>> +	size_t offset;
>> +
>> +	if (engine_activity->num_functions) {
>> +		buffer = &engine_activity->function_buffer;
>> +		offset = sizeof(struct guc_engine_activity_data) * index;
> 
> maybe we should assert that index < num_functions?

This function gets called from get_active_ticks and get_total_ticks

is_function_valid does this check

+	if (engine_activity->num_functions && fn_id >= 
engine_activity->num_functions)
+		return false;
> 
>> +	} else {
>> +		buffer = &engine_activity->device_buffer;
>> +		offset = 0;
>> +	}
>>   
>> -	offset = offsetof(struct guc_engine_activity_data,
>> +	offset += offsetof(struct guc_engine_activity_data,
>>   			  engine_activity[guc_class][hwe->logical_instance]);
>>   
>>   	return IOSYS_MAP_INIT_OFFSET(&buffer->activity_bo->vmap, offset);
>>   }
>>   
>> -static struct iosys_map engine_metadata_map(struct xe_guc *guc)
>> +static struct iosys_map engine_metadata_map(struct xe_guc *guc,
>> +					    unsigned int index)
>>   {
>>   	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> -	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>> +	struct engine_activity_buffer *buffer;
>> +	size_t offset;
>> +
>> +	if (engine_activity->num_functions) {
>> +		buffer = &engine_activity->function_buffer;
>> +		offset = sizeof(struct guc_engine_activity_metadata) * index;
>> +	} else {
>> +		buffer = &engine_activity->device_buffer;
>> +		offset = 0;
>> +	}
>>   
>> -	return buffer->metadata_bo->vmap;
>> +	return IOSYS_MAP_INIT_OFFSET(&buffer->metadata_bo->vmap, offset);
>>   }
>>   
>>   static int allocate_engine_activity_group(struct xe_guc *guc)
>>   {
>>   	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> -	u32 num_activity_group = 1;
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	u32 num_activity_group;
>> +
>> +	/*
>> +	 * An additional activity group is allocated for PF
>> +	 */
>> +	num_activity_group = IS_SRIOV_PF(xe) ? xe_sriov_pf_get_totalvfs(xe) + 1 : 1;
>> +
>>   
>>   	engine_activity->eag = kmalloc_array(num_activity_group,
>>   					     sizeof(struct engine_activity_group),
>> @@ -59,10 +86,11 @@ static int allocate_engine_activity_group(struct xe_guc *guc)
>>   }
>>   
>>   static int allocate_engine_activity_buffers(struct xe_guc *guc,
>> -					    struct engine_activity_buffer *buffer)
>> +					    struct engine_activity_buffer *buffer,
>> +					    int count)
>>   {
>> -	u32 metadata_size = sizeof(struct guc_engine_activity_metadata);
>> -	u32 size = sizeof(struct guc_engine_activity_data);
>> +	u32 metadata_size = sizeof(struct guc_engine_activity_metadata) * count;
>> +	u32 size = sizeof(struct guc_engine_activity_data) * count;
>>   	struct xe_gt *gt = guc_to_gt(guc);
>>   	struct xe_tile *tile = gt_to_tile(gt);
>>   	struct xe_bo *bo, *metadata_bo;
>> @@ -105,10 +133,17 @@ static bool engine_activity_supported(struct xe_guc *guc)
>>   	return false;
>>   }
>>   
>> -static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe)
>> +static void free_engine_activity_buffers(struct engine_activity_buffer *buffer)
>> +{
>> +	xe_bo_unpin_map_no_vm(buffer->metadata_bo);
>> +	xe_bo_unpin_map_no_vm(buffer->activity_bo);
>> +}
>> +
>> +static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe,
>> +							    unsigned int index)
>>   {
>>   	struct xe_guc *guc = &hwe->gt->uc.guc;
>> -	struct engine_activity_group *eag = &guc->engine_activity.eag[0];
>> +	struct engine_activity_group *eag = &guc->engine_activity.eag[index];
>>   	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>>   
>>   	return &eag->engine[guc_class][hwe->logical_instance];
>> @@ -125,9 +160,10 @@ static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, u32 freq)
>>   #define read_metadata_record(xe_, map_, field_) \
>>   	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity_metadata, field_)
>>   
>> -static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>> +static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe,
>> +				   unsigned int index)
>>   {
>> -	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>> +	struct engine_activity *ea = hw_engine_to_engine_activity(hwe, index);
>>   	struct guc_engine_activity *cached_activity = &ea->activity;
>>   	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>>   	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> @@ -138,8 +174,8 @@ static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>>   	u64 active_ticks, gpm_ts;
>>   	u16 change_num;
>>   
>> -	activity_map = engine_activity_map(guc, hwe);
>> -	metadata_map = engine_metadata_map(guc);
>> +	activity_map = engine_activity_map(guc, hwe, index);
>> +	metadata_map = engine_metadata_map(guc, index);
>>   	global_change_num = read_metadata_record(xe, &metadata_map, global_change_num);
>>   
>>   	/* GuC has not initialized activity data yet, return 0 */
>> @@ -182,9 +218,9 @@ static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>>   	return ea->total + ea->active;
>>   }
>>   
>> -static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>> +static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe, unsigned int index)
>>   {
>> -	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>> +	struct engine_activity *ea = hw_engine_to_engine_activity(hwe, index);
>>   	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>>   	struct guc_engine_activity *cached_activity = &ea->activity;
>>   	struct iosys_map activity_map, metadata_map;
>> @@ -193,8 +229,8 @@ static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>>   	u64 numerator;
>>   	u16 quanta_ratio;
>>   
>> -	activity_map = engine_activity_map(guc, hwe);
>> -	metadata_map = engine_metadata_map(guc);
>> +	activity_map = engine_activity_map(guc, hwe, index);
>> +	metadata_map = engine_metadata_map(guc, index);
>>   
>>   	if (!cached_metadata->guc_tsc_frequency_hz)
>>   		cached_metadata->guc_tsc_frequency_hz = read_metadata_record(xe, &metadata_map,
>> @@ -236,10 +272,35 @@ static int enable_engine_activity_stats(struct xe_guc *guc)
>>   	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>>   }
>>   
>> -static void engine_activity_set_cpu_ts(struct xe_guc *guc)
>> +static int enable_function_engine_activity_stats(struct xe_guc *guc, bool enable)
> 
> IMO it's cleaner to have separate 'disable()' function that will prepare
> and send tailored action params
> 
>>   {
>>   	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> -	struct engine_activity_group *eag = &engine_activity->eag[0];
>> +	u32 metadata_ggtt_addr = 0, ggtt_addr = 0, num_functions = 0;
>> +	struct engine_activity_buffer *buffer = &engine_activity->function_buffer;
>> +	u32 action[6];
>> +	int len = 0;
>> +
>> +	if (enable) {
>> +		metadata_ggtt_addr = xe_bo_ggtt_addr(buffer->metadata_bo);
>> +		ggtt_addr = xe_bo_ggtt_addr(buffer->activity_bo);
>> +		num_functions = engine_activity->num_functions;
>> +	}
>> +
>> +	action[len++] = XE_GUC_ACTION_SET_FUNCTION_ENGINE_ACTIVITY_BUFFER;
>> +	action[len++] = num_functions;
>> +	action[len++] = metadata_ggtt_addr;
>> +	action[len++] = 0;
>> +	action[len++] = ggtt_addr;
>> +	action[len++] = 0;
>> +
>> +	/* Blocking here to ensure the buffers are ready before reading them */
>> +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>> +}
>> +
>> +static void engine_activity_set_cpu_ts(struct xe_guc *guc, unsigned int index)
>> +{
>> +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> +	struct engine_activity_group *eag = &engine_activity->eag[index];
>>   	int i, j;
>>   
>>   	for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++)
>> @@ -256,36 +317,106 @@ static u32 gpm_timestamp_shift(struct xe_gt *gt)
>>   	return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
>>   }
>>   
>> +static bool is_function_valid(struct xe_guc *guc, unsigned int fn_id)
>> +{
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> +
>> +	if (!IS_SRIOV_PF(xe) && fn_id)
>> +		return false;
>> +
>> +	if (engine_activity->num_functions && fn_id >= engine_activity->num_functions)
>> +		return false;
>> +
>> +	return true;
>> +}
>> +
>> +static int engine_activity_disable_function_stats(struct xe_guc *guc, bool enable)
>> +{
>> +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> +	struct engine_activity_buffer *buffer = &engine_activity->function_buffer;
>> +	int ret;
>> +
>> +	if (!engine_activity->num_functions)
>> +		return 0;
>> +
>> +	ret = enable_function_engine_activity_stats(guc, enable);
>> +	if (ret)
>> +		return ret;
>> +
>> +	free_engine_activity_buffers(buffer);
>> +	engine_activity->num_functions = 0;
>> +
>> +	return 0;
>> +}
>> +
>> +static int engine_activity_enable_function_stats(struct xe_guc *guc, int num_vfs, bool enable)
>> +{
>> +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> +	struct engine_activity_buffer *buffer = &engine_activity->function_buffer;
>> +	int ret, i;
>> +
>> +	if (!num_vfs)
>> +		return 0;
>> +
>> +	/* This includes 1 PF and num_vfs */
>> +	engine_activity->num_functions = num_vfs + 1;
>> +
>> +	ret = allocate_engine_activity_buffers(guc, buffer, engine_activity->num_functions);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = enable_function_engine_activity_stats(guc, enable);
>> +	if (ret) {
>> +		free_engine_activity_buffers(buffer);
>> +		engine_activity->num_functions = 0;
>> +		return ret;
>> +	}
>> +
>> +	for (i = 0; i < engine_activity->num_functions; i++)
>> +		engine_activity_set_cpu_ts(guc, i + 1);
>> +
>> +	return 0;
>> +}
>> +
>>   /**
>>    * xe_guc_engine_activity_active_ticks - Get engine active ticks
>>    * @hwe: The hw_engine object
>> + * @fn_id: function id to report on
>>    *
>>    * Return: accumulated ticks @hwe was active since engine activity stats were enabled.
>>    */
>> -u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe)
>> +u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe, unsigned int fn_id)
>>   {
>>   	struct xe_guc *guc =  &hwe->gt->uc.guc;
>>   
>>   	if (!xe_guc_engine_activity_supported(guc))
>>   		return 0;
>>   
>> -	return get_engine_active_ticks(guc, hwe);
>> +	if (!is_function_valid(guc, fn_id))
>> +		return 0;
>> +
>> +	return get_engine_active_ticks(guc, hwe, fn_id);
>>   }
>>   
>>   /**
>>    * xe_guc_engine_activity_total_ticks - Get engine total ticks
>>    * @hwe: The hw_engine object
>> + * @fn_id: function id to report on
>>    *
>>    * Return: accumulated quanta of ticks allocated for the engine
>>    */
>> -u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe)
>> +u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe, unsigned int fn_id)
>>   {
>>   	struct xe_guc *guc =  &hwe->gt->uc.guc;
>>   
>>   	if (!xe_guc_engine_activity_supported(guc))
>>   		return 0;
>>   
>> -	return get_engine_total_ticks(guc, hwe);
>> +	if (!is_function_valid(guc, fn_id))
>> +		return 0;
>> +
>> +	return get_engine_total_ticks(guc, hwe, fn_id);
>>   }
>>   
>>   /**
>> @@ -303,6 +434,25 @@ bool xe_guc_engine_activity_supported(struct xe_guc *guc)
>>   	return engine_activity->supported;
>>   }
>>   
>> +/**
>> + * xe_guc_engine_activity_function_stats - Enable/Disable per-function engine activity stats
>> + * @guc: The GuC object
>> + * @num_vfs: number of vfs
>> + * @enable: true to enable, false otherwise
>> + *
>> + * Return: 0 on success, negative error code otherwise
>> + */
>> +int xe_guc_engine_activity_function_stats(struct xe_guc *guc, int num_vfs, bool enable)
>> +{
>> +	if (!xe_guc_engine_activity_supported(guc))
>> +		return 0;
>> +
>> +	if (enable)
>> +		return engine_activity_enable_function_stats(guc, num_vfs, enable);
>> +
>> +	return engine_activity_disable_function_stats(guc, enable);
>> +}
>> +
>>   /**
>>    * xe_guc_engine_activity_enable_stats - Enable engine activity stats
>>    * @guc: The GuC object
>> @@ -320,7 +470,7 @@ void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
>>   	if (ret)
>>   		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
>>   	else
>> -		engine_activity_set_cpu_ts(guc);
>> +		engine_activity_set_cpu_ts(guc, 0);
>>   }
>>   
>>   static void engine_activity_fini(void *arg)
>> @@ -350,7 +500,7 @@ int xe_guc_engine_activity_init(struct xe_guc *guc)
>>   		return ret;
>>   	}
>>   
>> -	ret = allocate_engine_activity_buffers(guc, &engine_activity->device_buffer);
>> +	ret = allocate_engine_activity_buffers(guc, &engine_activity->device_buffer, 1);
>>   	if (ret) {
>>   		xe_gt_err(gt, "failed to allocate activity buffers%d\n", ret);
>>   		kfree(engine_activity->eag);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> index 9d3ea3f67b6a..765397b959e0 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> @@ -14,6 +14,7 @@ struct xe_guc;
>>   int xe_guc_engine_activity_init(struct xe_guc *guc);
>>   bool xe_guc_engine_activity_supported(struct xe_guc *guc);
>>   void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
>> -u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe);
>> -u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe);
>> +int xe_guc_engine_activity_function_stats(struct xe_guc *guc, int num_vfs, bool enable);
>> +u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe, unsigned int fn_id);
>> +u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe, unsigned int fn_id);
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>> index 81002c83d65e..d95ec6a74b30 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>> @@ -79,14 +79,20 @@ struct xe_guc_engine_activity {
>>   	/** @num_activity_group: number of activity groups */
>>   	u32 num_activity_group;
>>   
>> +	/** @num_functions: number of functions */
>> +	u32 num_functions;
>> +
>>   	/** @supported: checks if engine activity is supported */
>>   	bool supported;
>>   
>> -	/** @eag: holds the device level engine activity data */
>> +	/** @eag: array with entries to hold engine activity stats of global, PF and VF's */
>>   	struct engine_activity_group *eag;
>>   
>>   	/** @device_buffer: buffer object for global engine activity */
>>   	struct engine_activity_buffer device_buffer;
> 
> do we need both device ad function buffers ?

If we have a single buffer, then every time num_vfs is
set, the device buffer(XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 
0x550C) needs to be disabled and then the function buffers need
to be created and vice versa on disable.

Would be better to have two buffers. @Umesh thoughts?

Thanks
Riana
> 
> for non-PF case (native) we can still buffer[1]
> for PF case we will allocate buffer[1 + totalVFs]
> and in the future
> for PF case we will allocate buffer[1]
> 
>> +
>> +	/** @function_buffer: buffer object for per-function engine activity */
>> +	struct engine_activity_buffer function_buffer;
>>   };
>>   #endif
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index 5b5fe4424aba..a758fc517048 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -242,9 +242,9 @@ static u64 read_engine_events(struct perf_event *event, u64 prev)
>>   	if (!hwe)
>>   		drm_warn(&xe->drm, "unknown pmu engine\n");
>>   	else if (config_to_event_id(event->attr.config) == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
>> -		val = xe_guc_engine_activity_active_ticks(hwe);
>> +		val = xe_guc_engine_activity_active_ticks(hwe, 0);
>>   	else
>> -		val = xe_guc_engine_activity_total_ticks(hwe);
>> +		val = xe_guc_engine_activity_total_ticks(hwe, 0);
>>   
>>   	return val;
>>   }
> 

