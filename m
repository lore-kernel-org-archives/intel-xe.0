Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEBFCAC5B5
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 12:50:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 714ED10E40D;
	Mon, 29 Sep 2025 12:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P8OGB+qj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E5A10E409
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 12:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759150249; x=1790686249;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=x0yUIesArS8SUgPaUqobFXEV+1+4S8KqnVgJnaba0p8=;
 b=P8OGB+qjxSUWGcmR+v9agtEUcFq51K8W+9P7IzG52x0oczRQtNqncFDD
 KGOuhvWe4KhLbvaJYLljKFLVxSpu5nZjKptO+jNFQrbzES9Ca7D2iHV+n
 jGzEDKhl5F1+kucZ772pTMquGc/GOXgnfNc21d7bJt5YtWvYw8WBJJ/5W
 rcUtJifDE8ue+iaGN+XgpN13KKggGsk+tUoJhg9q2hphbZE7brwlwHcn/
 UKqjlAYWgbkwR14KVj2gmb1IwcWvjK+XGJTG6hVIcoYIg1j4QxUio3pM0
 MgzdFB5/x3H61wSUjcIWoP0Rq9vOSLGj3V4cHE/820FVRJVWY8+HL1q5t g==;
X-CSE-ConnectionGUID: 4WAy5mg1RriadMtHnYGZgw==
X-CSE-MsgGUID: Tc2Gi46TRhek3W7tmSiIoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="78810948"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="78810948"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 05:50:49 -0700
X-CSE-ConnectionGUID: 9KqccBlfSIeoMPrFcdAbzA==
X-CSE-MsgGUID: QD4+Y5TERBmRZdu4D8ImSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="177483564"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 05:50:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 05:50:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 05:50:48 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 05:50:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BWOLPNj4CMFKwC+KauALcmOYIQZMQtVeGEFdCUaYFucJRec1UO/a+j8UI3m51CIbotRBkYGnF4Za43qmSz0bpRsH23xZuKNDitVFo/O8HQdb0wWwVvjBm5SVaGctPFVg+ab9SRPXE+etmGU3jG1y0L4/qgDE37NUMqZ6iEp3FQ4OKM2Z6GIqf19k0AeE0jQ4e1vQvSxj0dGGrxeDSmWMKw4P9qYVdDNcXHGVtmIdd+bm8AAoBFcF7n0fgiNVfa6BBZ3vKKxxO0lPaKFdK6lnItlzgYHJQTEqtohIddSJ8FsYeqByb7IO8DkqqX0CSnO+olWuaOBmpU5KVRgpXrHIxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5Nqi+rE4lEdlEMKXv7/JwIkurtFvTaD7nRf1Xo+43s=;
 b=REMsvNY6bDvB9WY9uWvRtHV7O9foETTmHUhzBcTppJW6f5Mcyxm+q610XslH6OVT/EeVNasbHBlnSpJIyQxbHkhdQe0zknptYTC604iolOppQ1qeJntdSTqmHrBst4BOk9PLQVrk0vZ7X2UGDAQJQX7I8VRph/IZxgQvT/iFlf3ELXYKS097ILpBURj1qqk39o9ckUTiFdIw0H/snU9E3sqb08fFgFCrcZT5Y+wiH9/t8h1oh+mgqwahAOxr1QOP/4Rp1padJKiJNqUwer/bnOw98/VnrPAExupq+9xc4vXb40JeNTJe0u9+kKy917Fv4RawXQaltfyKEBc9M+Am/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6997.namprd11.prod.outlook.com (2603:10b6:510:223::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Mon, 29 Sep
 2025 12:50:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 12:50:45 +0000
Date: Mon, 29 Sep 2025 05:50:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 18/36] drm/xe/vf: Don't allow GT reset to be queued
 during VF post migration recovery
Message-ID: <aNqAot3W+ovnljKK@lstrano-desk.jf.intel.com>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-19-matthew.brost@intel.com>
 <7133a2f0-82c2-4af0-b0c6-62765adb151d@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7133a2f0-82c2-4af0-b0c6-62765adb151d@intel.com>
X-ClientProxiedBy: MW4PR04CA0390.namprd04.prod.outlook.com
 (2603:10b6:303:81::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6997:EE_
X-MS-Office365-Filtering-Correlation-Id: ce8b0e59-4b08-4037-4201-08ddff56ce09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0IyYWpMb1lXbUJsZHpCT2phZWFiWHJ5dlRyVk4yUElIQXZCd2JtNXM3UUox?=
 =?utf-8?B?dDlSN0d2ak1BaWl5VXZkR2E0MzVSYUhiNzVNdVg2WCs5WExuQmRMV1FCVDZY?=
 =?utf-8?B?aFZUaFArQzllYUJlNnkrMkZGbkQrbXJRWVUya081VkN4YmpZeU4zMm12aUFx?=
 =?utf-8?B?OUxvLzV6RzdrQ0kzVDFmb1BrTFhWOGNmWDk2Uzhhc2hPQk80NGw3eEJxdzBs?=
 =?utf-8?B?bUlXM1Y2emNSUlUvaFo0RXdaaVlDUzl2dzB4aElVTllVYk90TjB0TG1BNk55?=
 =?utf-8?B?UzhRWVg1b0N5TmVOaStadjNMZXhSZmNrbEw4SGY3ZVZhTHdVdzcrc3dyZkcz?=
 =?utf-8?B?bytRVXYwbkpPcWJYeFdzUWpwUlJ0MmhFTVdsRFJ3ZnFMbmU1WXBma04zaThY?=
 =?utf-8?B?cm00T1VlTGJuQXN2d3dpdFdyTjNwZnI2Nm1YLzB3MlloaGxxTTV1NUhrOWZu?=
 =?utf-8?B?Z2hxOEw3T3NqV0pVUy81SklkdDF4RmlVYUNiczhLRjczRnVUOTM0ZXI3bzd4?=
 =?utf-8?B?Zkh4SFhobXZjc1FvODNseEpxMVBMMEEwVVlaWWRRMGs4d1dQL05PNStsUVlN?=
 =?utf-8?B?dFI0OUExMUVxQXc4bUhxNW5obDhaTm05K3RXdm8xY0ZlSGg3YnB5N3RvTzVB?=
 =?utf-8?B?MHJtbGdDK0tmMnQ0T0JjZ0QyQmpKbDJRUytqYnhvYVZKTzllMnh3K3dhaEg1?=
 =?utf-8?B?eHBOeFhwdzZzMzRObHZhV1orRGo1Rm9uZlM3aUh4ekJFaFcrOGFUQW1LbTJV?=
 =?utf-8?B?U1lNUlV5UWJuditqMEFIUm5VVDRqenhaNDRTNlhJMEVySVFGaDMwWmhMTThI?=
 =?utf-8?B?NngzWFVhOXZJRW9MRndWQ013dE5Ka3N6MEVsQmZWOHNTclpTVVcrbkcrQUFy?=
 =?utf-8?B?WDNuYW93V3g1Z0lYb2p4ODY3bWtYNitRZWYyZUtIZ0t3TGdEQ0Z2Zlhxa0Nk?=
 =?utf-8?B?VGcyTlRreUxraTNQVUhlT1lTU3o5MGZhdzE3WStEUnY1VGF4b1AzOUNXM0dx?=
 =?utf-8?B?dFBUeTRodVpiVkg5cWhQNjhER0p1bjFQWDViOGc4VHJseVUrMGVzMS8veklW?=
 =?utf-8?B?ZGZRTi9uajBubjFlREN6VUlDOTEvQkJubk5IMFdDait5ZVpsUmFOeUNxZFhP?=
 =?utf-8?B?SUFBM3UweU1UU1RaQ0lvMkIyTHYrQXRoeDJ5am1aMWd0aWZkOXJ3RWRmeGIv?=
 =?utf-8?B?TU5hTWlNYnc3Z2NvaEZmNEYxejRuUmVhdEpvbnIvTURvREFQaHd5b0Vxazc3?=
 =?utf-8?B?OXFSL1gxVFRCQmQ1ZGJmMzRnZUc2VnlsMUFBcmloNi9tTlhiTmJKMXVlWmdL?=
 =?utf-8?B?dDVqWW1ETlBKMzdsb3RIMGs5b2N1eXlSWHpXR2theWVrZTBPeUxWNUJJblYx?=
 =?utf-8?B?UE9yU2lVWmI1STRhK3hPK1dxeEJ6U290Z2JRQ0ZSQWZPVUJhSUJyb2JlZ1RG?=
 =?utf-8?B?dEMwVGtyeHQ4dllIa3NEbWYxRnV6SEJWOVNBaGtldDdZOUs5OGQ5RzgzYTFZ?=
 =?utf-8?B?ZFdGaGp3c1h0MGZKNWhVZEN1WjY0cVhScVQ4N04zSk0yWFQzeUxibUlNQzRi?=
 =?utf-8?B?TzhPU2ErNFd6VUtDL0FiN1pObG9FTmwrWlZaZGdZYzZFVS9DVTExbm1Qd2xr?=
 =?utf-8?B?azIrTkZWdzl5aG5pUnc4NlNrR2xQaEdRZTZIWFp5RXRHRVY0NGJTMlFrYVNW?=
 =?utf-8?B?cXBZSUxlNWVtWXdKZ0Y4MDVFek1SNWYvV2lJNEF1OGs2UGNMdTlYZ2NvS1JS?=
 =?utf-8?B?L0huYUQ0em8vMUNlMTA4QkI4RzVnTUVhSkhjWkN2dkNyNHFCeTExYk1LVW04?=
 =?utf-8?B?U3pHNnlyWk5GV3RWZi94bXZaQ1hiMUxtblFtdUlhQWxNY2VQNU93bVZya1V0?=
 =?utf-8?B?YUw0QUxXaHBtcmFJa1p0ZkRUSklWTWRIakRob05LNFEvN081VU9mbW90MkI5?=
 =?utf-8?Q?Ig6fvX+rhJrih9PasJn6j74IP0OTAvuO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkdJbUE5V0k0bWZlT05EUEZiU09QTlAxWlB5SFRLRzJNWlRmdUloQ2hsTVhH?=
 =?utf-8?B?WFV4Ynk1cWRTRDh3NktZV3ZxckVXSnNvYXVLSEQ0aXhmK3plcmhvaU1IRXdX?=
 =?utf-8?B?dm9lajZlMmQrNkN3bWYwRk9KRlBNOWxvcmtWTW1WUzkzRUc2b2hIOWxnVkM0?=
 =?utf-8?B?YzV5TG9RSE9MWm55bFJZWUF1bnFOVHluZTgyYjAvS0locDNMOUtXQVRQMFUx?=
 =?utf-8?B?UW9LNGFvalFCaTdpMEFnTFlUZWI5TzltRklNTlBtREhrVlNIQ3d5anE3RFFO?=
 =?utf-8?B?MXg2Y1EvUVNmQXIxQXduOVd1TExMdXpPYkhqMmhBMDZ3NUM2YVpuUUd3R1pt?=
 =?utf-8?B?eFdNTHljaDlhd2pJeU9QUUY2YnVnQk5SVmwwQ1hNV0FkNlI3ZVZpWlVqemQ0?=
 =?utf-8?B?UWZOeW0xWGdYd01PaWdpZUtJcXhkeHcrYlZBTDQ3RGlDcTN5Z2FkWjhodjhW?=
 =?utf-8?B?bEhlYWdYMkxQQXN5aGI0aE1sZmZlT0pWTXhqbmdLL21GenpydzVrK2pCTlVw?=
 =?utf-8?B?VmZUNGlFTm1tV3lVQkRSRE8vd2tORWFrbStLaStGL0ZFS3BQWDRuaERhSzRy?=
 =?utf-8?B?L0RDWnlsZkJoQlF2SVpGTGNpbE9vTjZsVEZ2N1F5cENTUm9JUHVZbXRIcXhH?=
 =?utf-8?B?WU5VVm5LeUFQVDFVUDhiK24rQWtEYjZaalFDcjlhTFVoNlVzUVJkQUppWWNH?=
 =?utf-8?B?R1ZOZHBsbmg0cXFxZ1VMNEM4U2ZoWm55THhoOExteUc4VTJ2TnZuV0M5cDJP?=
 =?utf-8?B?VXNtTzlZcERhVGt4UWxaak81eWc0SXRHOXNQcjE0R01kRXpjeVpMYS9jbnky?=
 =?utf-8?B?cURsR2pweUZoZ0xud0I5YVRqNXhCN2dlaCs5eWYweHFVdWt5Ni8yVzMxdFdY?=
 =?utf-8?B?bWtILzZlMUltZTVtbUsyY2s4eDQ4ZkIrbFFnN2pzK3p3WDVUTEticFFkNjdx?=
 =?utf-8?B?enYvYzd5SkRBOWJSNmtldmV6eUtzakxYR2k3VkRJb1JUaDRBdHZBZmZsK0lG?=
 =?utf-8?B?c0tGYk5DelBnMC9sd2crbzVEM1Q2NksxcTRjWWhXMnRGY1k4clBxMGczZE5J?=
 =?utf-8?B?amJ3bFhVcUV4djFSekt5NCtGZittWlNzTXZlbjYzM1VZK29OaVVNakJoaFRv?=
 =?utf-8?B?YzFSTUVubktadEpWdW0wcGdiR254S0U3Y2ZqT2ZFdU5BRWh4RkhHVXl6VmxT?=
 =?utf-8?B?ejNTd3dTMHUwU2VjT2VDcjZBcEliM1FTbTIwd09NMGpnaXljYm0xWTBmWC8r?=
 =?utf-8?B?aWczU1VHc2Z6REpoU05xZk1GZitJNzE3NVV0c2k1d2FWbXVrUENGSHFWcVcz?=
 =?utf-8?B?U3g0Y25kUTAzRjQzNnpLZE1lUE5MYzVhZW44U1drMXhEaU9udm9UdkJ0UEtm?=
 =?utf-8?B?Y1BOVW9Qdk11RUMzVWEwS0hGUFQ3UWtZVzZGNzNBakpISGJVZ0hrNHRGTWht?=
 =?utf-8?B?QWFqTTlnRTVOUm9zNHB4RnZkYS84NURNYTN0U2RUR0F1cVd5ZGI2ZmRrbUdZ?=
 =?utf-8?B?ZjlEZ3J2anlJOVkvVWVqR2hkb0tuenAzdHhRTVgzemZQdjFHeTdNdjNOTFJQ?=
 =?utf-8?B?WXkxQUdwR1YySWc3WnAvUElIWko2Q2JQeGJVSWNyWm1rVSszZFRPM1ZGZ1g1?=
 =?utf-8?B?dnB5SDRJQXpSSUlXbHpnK09YRjV6VnZDVk9FSHcxZnd2UGU5bTlJeFBvQ21P?=
 =?utf-8?B?WWpMVVlyWllFUTRjYzBjdHplVUdtQmphcm5XU1RucG1uYngwTXhLdDBOcHpT?=
 =?utf-8?B?SnZxSnBEMi9IaUhHNzNWRCtMSE5rZG9vakZoaFZBNHAxaXlvUENPNUNoWVVs?=
 =?utf-8?B?bkZjWHh1YndqM0NPeU5CT04zUy90eTJEWDFhM3ZvVnp2WWRscVB6SnprVTc1?=
 =?utf-8?B?M1RLbUF0QzNvRjYza2labUl5VStYNCtsRW5WQjhnV0lZRjUvcGlpWFlUa3pm?=
 =?utf-8?B?dTRYckpwTEw2WnRjbEk2WGczSGEyMnBWenpnQW12RnJ5QTMyMytxTnJkZFRr?=
 =?utf-8?B?aExIc0ExWXFMMWQ2UWtZTW9ZYjB1SlZUc1g5LzBvcWJlSG5TNkxJR0JEMGo4?=
 =?utf-8?B?WTZnaEpjYXZLVGt1eEtaNDNwR25NeGNFMEpNN1pCUUhVd2NyRWNQRmsxSGVQ?=
 =?utf-8?B?Z0FLQmNDVCsrVVhWL29LdUdMVVB2Q1UvVEhiWTVabkxZc2dkTWh1UW9MZWIw?=
 =?utf-8?B?Smc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8b0e59-4b08-4037-4201-08ddff56ce09
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 12:50:44.8024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hmnCcKldaRbNbfirHV/qn/C8O3QP3k99Zy+DS5vAnRMM/7sWH5LAvOnNOHu0kfPM7X0vOga80WwTPGv2JgLlfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6997
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

On Mon, Sep 29, 2025 at 11:17:27AM +0200, Michal Wajdeczko wrote:
> 
> 
> On 9/29/2025 4:55 AM, Matthew Brost wrote:
> > With well-behaved software, a GT reset should never occur, nor should it
> > happen during VF post-migration recovery. If it does, trigger a warning
> 
> hmm, I'm not sure that GT-resets depends only on the SW side, nor that
> reasons for it couldn't happen just before VF was migrated
> 

GT resets should ideally only occur due to hardware, GuC, or KMD bugs—in
practice, they should never happen. Of course, we’ve encountered bugs in
all three components at various times, and GT resets help recover the
KMD/GPU.

It’s possible that a GT reset could be queued before VF migration, but
that’s highly unlikely. What this warning is really about is broken VF
migration code that accidentally triggers a GT reset—for example, a WAT
queue timing out during submission and causing a reset. That would
indicate a bug in VF migration that we need to fix.

> > but suppress the GT reset, as VF post-migration recovery is expected to
> > bring the VF back to a working state.
> 
> can't we just say this last sentence, that "there is no need to run
> explicit VF-reset sequence during recovery as VF-recovery is equivalent 
> and it is also expected to bring VF back to working state?
> 

See above, I think the commit message is largely correct.

> also, since the patch is a refactor, it should mention that "instead of
> blocking resets, just rely on the recovery" 

I can add snippet saying this.

> > 
> > v3:
> >  - Better commit message (Tomasz)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c          |  9 -------
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  7 -----
> >  drivers/gpu/drm/xe/xe_guc_submit.c  | 41 +++--------------------------
> >  drivers/gpu/drm/xe/xe_guc_submit.h  |  3 ---
> >  4 files changed, 4 insertions(+), 56 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 82be38c99205..5f04d562604b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -815,11 +815,6 @@ static int do_gt_restart(struct xe_gt *gt)
> >  	return 0;
> >  }
> >  
> > -static int gt_wait_reset_unblock(struct xe_gt *gt)
> > -{
> > -	return xe_guc_wait_reset_unblock(&gt->uc.guc);
> > -}
> > -
> >  static int gt_reset(struct xe_gt *gt)
> >  {
> >  	unsigned int fw_ref;
> > @@ -834,10 +829,6 @@ static int gt_reset(struct xe_gt *gt)
> >  
> >  	xe_gt_info(gt, "reset started\n");
> >  
> > -	err = gt_wait_reset_unblock(gt);
> > -	if (!err)
> > -		xe_gt_warn(gt, "reset block failed to get lifted");
> > -
> >  	xe_pm_runtime_get(gt_to_xe(gt));
> >  
> >  	if (xe_fault_inject_gt_reset()) {
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index cc5af19c1911..b16e8fd271f8 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -1175,17 +1175,11 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
> >  
> >  static void vf_post_migration_shutdown(struct xe_gt *gt)
> >  {
> > -	int ret = 0;
> > -
> >  	spin_lock_irq(&gt->sriov.vf.migration.lock);
> >  	gt->sriov.vf.migration.recovery_queued = false;
> >  	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> >  
> >  	xe_guc_submit_pause(&gt->uc.guc);
> > -	ret |= xe_guc_submit_reset_block(&gt->uc.guc);
> > -
> > -	if (ret)
> > -		xe_gt_sriov_info(gt, "migration recovery encountered ongoing reset\n");
> >  }
> >  
> >  static size_t post_migration_scratch_size(struct xe_device *xe)
> > @@ -1219,7 +1213,6 @@ static void vf_post_migration_kickstart(struct xe_gt *gt)
> >  	 */
> >  	xe_irq_resume(gt_to_xe(gt));
> >  
> > -	xe_guc_submit_reset_unblock(&gt->uc.guc);
> >  	xe_guc_submit_unpause(&gt->uc.guc);
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index cd5e506527fe..b82976f031e5 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -27,6 +27,7 @@
> >  #include "xe_gt.h"
> >  #include "xe_gt_clock.h"
> >  #include "xe_gt_printk.h"
> > +#include "xe_gt_sriov_vf.h"
> >  #include "xe_guc.h"
> >  #include "xe_guc_capture.h"
> >  #include "xe_guc_ct.h"
> > @@ -2182,47 +2183,13 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> >  	}
> >  }
> >  
> > -/**
> > - * xe_guc_submit_reset_block - Disallow reset calls on given GuC.
> > - * @guc: the &xe_guc struct instance
> > - */
> > -int xe_guc_submit_reset_block(struct xe_guc *guc)
> > -{
> > -	return atomic_fetch_or(1, &guc->submission_state.reset_blocked);
> > -}
> > -
> > -/**
> > - * xe_guc_submit_reset_unblock - Allow back reset calls on given GuC.
> > - * @guc: the &xe_guc struct instance
> > - */
> > -void xe_guc_submit_reset_unblock(struct xe_guc *guc)
> > -{
> > -	atomic_set_release(&guc->submission_state.reset_blocked, 0);
> > -	wake_up_all(&guc->ct.wq);
> > -}
> > -
> > -static int guc_submit_reset_is_blocked(struct xe_guc *guc)
> > -{
> > -	return atomic_read_acquire(&guc->submission_state.reset_blocked);
> > -}
> > -
> > -/* Maximum time of blocking reset */
> > -#define RESET_BLOCK_PERIOD_MAX (HZ * 5)
> > -
> > -/**
> > - * xe_guc_wait_reset_unblock - Wait until reset blocking flag is lifted, or timeout.
> > - * @guc: the &xe_guc struct instance
> > - */
> > -int xe_guc_wait_reset_unblock(struct xe_guc *guc)
> > -{
> > -	return wait_event_timeout(guc->ct.wq,
> > -				  !guc_submit_reset_is_blocked(guc), RESET_BLOCK_PERIOD_MAX);
> > -}
> > -
> >  int xe_guc_submit_reset_prepare(struct xe_guc *guc)
> >  {
> >  	int ret;
> >  
> > +	if (WARN_ON_ONCE(xe_gt_sriov_vf_recovery_inprogress(guc_to_gt(guc))))
> 
> we have a gt-oriented variant:
> 
> 	xe_gt_WARN_ON
> 
> and likely we should not use the _ONCE variant as resets could happen few
> times in the VF lifetime
> 

IMO once is enough, as we really only care in CI if pops the first time
but sure can switch to xe_gt_WARN_ON.

> and since we are sure that "recovery" has the same power as "reset"
> does it really need to be full WARN ? maybe just "info or notice" ?
> 

I think we should complain as loudly as possible and capture a stack
trace if this occurs.

> also if want to skip real GT resets, shouldn't we have this check
> upper in the reset stack, at GT level, not just under gt.uc.guc.submit ?
> 

This code is already somewhat mislayered, but in its current state, I
believe this is the correct location. If we refactor the layering later,
we might be able to move the warning further up the stack. For now, I
think it's best to leave it here.

Matt

> > +		return 0;
> > +
> >  	if (!guc->submission_state.initialized)
> >  		return 0;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> > index 5b4a0a6fd818..f535fe3895e5 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> > @@ -22,9 +22,6 @@ void xe_guc_submit_stop(struct xe_guc *guc);
> >  int xe_guc_submit_start(struct xe_guc *guc);
> >  void xe_guc_submit_pause(struct xe_guc *guc);
> >  void xe_guc_submit_unpause(struct xe_guc *guc);
> > -int xe_guc_submit_reset_block(struct xe_guc *guc);
> > -void xe_guc_submit_reset_unblock(struct xe_guc *guc);
> > -int xe_guc_wait_reset_unblock(struct xe_guc *guc);
> >  void xe_guc_submit_wedge(struct xe_guc *guc);
> >  
> >  int xe_guc_read_stopped(struct xe_guc *guc);
> 
