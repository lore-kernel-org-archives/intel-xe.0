Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF28EE0211
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 06:51:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E1E10E0A7;
	Wed, 11 Sep 2024 06:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mY+0zGns";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174CA10E0A7
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 06:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726037479; x=1757573479;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KXJ6eDA6vtRJ8utcLkxZ1geRAEnfpFNUmXlWvEcEKhk=;
 b=mY+0zGnsrJVmTZT5QGa8mLbh+VuN8GNqfdGmUvql8EuyZjru5/6Iq+hb
 60GpYJ75BUlaL5SMJJgPINp7HYwdKkrRH0SweO6WRVxQ1GdrUrghSwZdJ
 gTD9YgERhwZa5U4yz+GKXP8v2P5QFv8lv0mrWJ3RVO63jCPappOFmy+aP
 4nfkmXyoU01AS2dcn6oyexGUGeHznpGo2cefqj/uAAuHk5nqMaxsGUFRX
 QI1RuW2XsHNhMEWSSHjZ+lMm5wQt4tx8X8AJ4vkADgl6TgnKw2AqT676G
 a41G8SmaM4IECqq12jYicoCPhRbBOncPuFQVHf1HHQgUCr5+7svT6x8jI Q==;
X-CSE-ConnectionGUID: aw0zEykTTc2LUOzBXnm3Mw==
X-CSE-MsgGUID: eZKNwTI6TSWkRdmDX0Ik9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24963146"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="24963146"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 23:51:19 -0700
X-CSE-ConnectionGUID: wQPA8TBnT3qrO0iUYRQR+A==
X-CSE-MsgGUID: vBioiStoSLmxjCcHQMe/wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="67223741"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 23:51:19 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 23:51:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 23:51:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 23:51:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPfcvx/TC6On8qV+3ZX5OUvd9eMPqIDlKjZTFCOmXc6WwTUnhmGHVNHPC7qy5D90YwdPQGa9XdzQlhpTjJ1by8p7ucEO/oCM2mdQrdGZ879tW6BkTUYTpaZWBMcDy4eC5mec1F9RoK3XOgmuoTEtWyNEOzho9pE0FTvcIFw9FUzpCs88Zqzpwx+B/KXUvdsYl/n+Rr32w+aWmFyFJg0FGJ9yyjuivVlrYW+E7F4leFCokpKl0YYUt61r9fvA9wEbh4Iz3NA/BJfkTmiXGYqe1sJHXdPYXmFxODd4FN1PYMb3yJ73yCFfUMJuoyXjTgscZABJ7snw6IPMp/hpWP5iEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcRw6SUfUVNvLFYNvqYysJfpDbslG7eaTrmQ91oxxrE=;
 b=GxtqBtq9ea1HTmfkTWGi+MEWVy74wI7XtckKd8TwT5MN9yO41sUnkkUWIlmxSrRn65TbI9Fe3DHUJE9o37IXFohyOktXHqZ7+IMO2G8PIOb84gJuLVE8cnYslBXlAk6cwewvDe1RktR1ETiwZtWNiT6mWCfwlHPcxbRGDiV2/G3+UXDFPjlGBEjEz5xnnRePtKpqRAEwn56BU4W/vRgjDMHWewdWe2DNTqs9cARLsDiNfQnpnhUgZtY4E9cfzQ1VEHyhw5c7GmyA4AWiFtWmqoMAOsSEk+XZfizXwPto8QRCCWnuEKQwMK1LfzKBoMorctjlN0+vWFGdST0S0Oy8tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CO1PR11MB4916.namprd11.prod.outlook.com (2603:10b6:303:9c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Wed, 11 Sep
 2024 06:51:12 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 06:51:12 +0000
Message-ID: <eb8b96e2-d593-4c15-9116-f4dca3976dd7@intel.com>
Date: Wed, 11 Sep 2024 12:21:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/9] drm/xe: Error handling in xe_force_wake_get()
To: "Nilawar, Badal" <badal.nilawar@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
 <20240830052326.3707019-2-himal.prasad.ghimiray@intel.com>
 <ZtoGpjVmZbwLsD1s@intel.com> <82a78b3a-14e6-472a-8e45-2cb4af2ff3a2@intel.com>
 <ZtsrTvFHbMuNvXvk@intel.com> <5d29a6d1-80ea-4b21-b14c-619d719a7d23@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <5d29a6d1-80ea-4b21-b14c-619d719a7d23@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0144.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::14) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CO1PR11MB4916:EE_
X-MS-Office365-Filtering-Correlation-Id: f72e8451-f468-4482-3914-08dcd22e1ff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEFBcHBPRXRaZ253enl2SnBUNTZzK3duZFFrK2cxTEV6Smh0K2dPNXJCTjc4?=
 =?utf-8?B?aGpoSWhGMTQ0V2doVzhmSlp2Wkw5ZkZvUTV4dWhGMmN4dHN5LzJvYmwxNi93?=
 =?utf-8?B?b0Mra1QxbFIrZzNYcjFHQXh6a3lpTHdKeExQcllBY2F3KzRhdmlQVEFQbjNy?=
 =?utf-8?B?VDQ4UTl4SHYwZkdCZlQ2d3IweDlMemFKSUthS2gwZXoyY0Y5T285OFJjTkJ2?=
 =?utf-8?B?YzlzYUdhVDdXc3ZUZnZhQmpEclBlb3BJK3RUbkxaMjI3VDJ4eUxVcHZEVlFB?=
 =?utf-8?B?NlBNUVg4TlkwYUhRTmZqV05HSW9ab01ZMU5xN1RTK2VmTWlQRkU3Qk1VTHN4?=
 =?utf-8?B?Y3FLdE4zT2tIUVZjRWxPcVFpNmIxazlQTDQxR3pXQm9jQ1pPUm1DdHppaXQy?=
 =?utf-8?B?VENyUmt6STA5ZXJra0hVbjJmdTV5YXRwZEk1T1pybkVxQUdSaXJqQjVpS2M3?=
 =?utf-8?B?MDR0UmIvMG9wdENpYWdqdG5ESUZzYS9UaTdrUFN3MUZiazZVKzl3WDdqQ2Ro?=
 =?utf-8?B?OWF0UmVNZ2szZGpEaUJGSTJ2czFHNmhZcGlrMk9Mb2lTdHN6eDFhMWFDdE1U?=
 =?utf-8?B?UXRGM3NjbFJxREhiN2Q0VjFLODgvZGw5R1k3NDYvSllXY3ZCREZuQWd3dGph?=
 =?utf-8?B?R0hSd29mY2dLNjdyNXhDVHBmczZCbiszTU9yc1RBeWhwb3NqYlJrd0tSODN4?=
 =?utf-8?B?NEs5cU1GR0NUaTl4cy9iYm8vYmFiK0lIKy9ONTJsU1RPZGYrdmhjMHZnbVp3?=
 =?utf-8?B?NnhMV2NUZEx2dVVGWlFRSWZSdS9EbUNkSmFyOUFQd25OZDhwM2tpcTVlZDRI?=
 =?utf-8?B?WDNaRFhBTjdoVmJnRjNibEdTc3IwVm1uMGk4em9ZUDhLL0hlcjZuckVISm1z?=
 =?utf-8?B?OHJzcHg4QU41VTY5ZU45akRJUzBud3QwOGJsOG00WjZTZFk4YlNSNUpseGMw?=
 =?utf-8?B?aHNzY1RPeHczeWtBY0hFMzJIb2xpVTdMNW9BNlN1REhWQ1hLMkZRclRFa1NE?=
 =?utf-8?B?WktRNWVvK2VSZjlOVlh3SFZUQlpnRzFGay9tU2J4WVpYTmxqN21BRmZFL0lo?=
 =?utf-8?B?Yi9wTDNqYmtzUVhhNnFWSnNrYlZkY0ErZXlPRGVhV09Wd1JWdmQxWElRVU9S?=
 =?utf-8?B?L29ZY210KysvbityTmVoeUltU0VxYnA3cnJ6eUEvRzJieStpTE1EK2M2bnJo?=
 =?utf-8?B?eGUxZitEenplcFloVUg1Wm05V1NJb0Z0RStLMkJkWGZYTG8xWEcvMlhnRTRZ?=
 =?utf-8?B?cisxL2N6bDNmY0NjN2JZRGJ2bVBzY3g3TldlVHYwd0Z1cWRUZHpLVFdrRTVS?=
 =?utf-8?B?TFpjUndPT2FWM0ZhK24yemZ2WU5TTDVuUGZWakltekh2TWVCcGJEcFR2OFVX?=
 =?utf-8?B?aklva3JHK2hVR2w0L0ZsQWkrRzcvNTkweStjZkhrU1phR3FFbFVSVjdHTGlS?=
 =?utf-8?B?QmZRclp1ZFl3dGZvSU52UnVkS3h1MGtlM20ySEJFZUhaeTBYSEpCZDM3S0FQ?=
 =?utf-8?B?a05STlFibGlqc1dhcnlZZU5pQ1o0K1A1T1Z1WDloaTQ0YlU2Mmd4alp4TmdW?=
 =?utf-8?B?V3E3T01tRHlMbG1EVVJTTG85Y09vQnhyaURhTlZTN216SlFjK05Gc0JoME9I?=
 =?utf-8?B?ZnJXcHZXWEdqa3NUcUVWZjdsTG9XY1NQOEk2Y3A4bzFzZjA4RStyUm0raFVk?=
 =?utf-8?B?eXFTMEZzYncrYVRqTzVoMkwwZTVCcWlUVjFOQUplQlFDVnhSWlk1bWlnWGxD?=
 =?utf-8?B?QlpYT0xTWitkRk9SeGFXdmxYaFNLN3pwQzJnZmxMQjBjOTUyeUF4NkdKRXBl?=
 =?utf-8?B?bTNCK3cvby82WWZvUjYyQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1dqTkY0MjNtOTdVcFJubGl6SnZtazZtVUtOSytlMUM1UEFzT3RoeEZkV2Fm?=
 =?utf-8?B?NGluL0crVDdQWGQ1NE44cWtsYVhYMUZKbXJBcjBRTEwzTEs0VytGQjJNUm9l?=
 =?utf-8?B?azlaSUt5bThTT1BCNmJ3OFdMVHZyakltNVlTV21lK1p4QjlPNXdiVCt3clFB?=
 =?utf-8?B?YzVFU01wOG90VTlQSThPT3h3MWRLa245ckZZc2lIY0VrdzAzdGptRTIxbzBa?=
 =?utf-8?B?MDdlcVFpbFJBTE9VN3JXbW9odFBLNjBXcy9zOHdTR1hHOW10QzNTajZ1dlVT?=
 =?utf-8?B?Z0dacHlsb2dZWmlxTGRmb2JtM0JmTkxHaW90R2Yrc0xVNlI4aFh2LzJBK21s?=
 =?utf-8?B?SnMzSjAwZzJJV3hYNk9tR0dDVGJPV3B2UmJJTVQyeFlZZmZtcTRsK3FVTXlj?=
 =?utf-8?B?aUd2N2hwV0NPWk1FY1lhOXJIZnhqTWlrSE9GdzhvTTEwcnFnWTJsMzR0T2Mr?=
 =?utf-8?B?YUFobzVSTmNyVTZhOUhyTEo4cnowY05rQjk5NUpLNkJzVVFPcWFrQmpLemx6?=
 =?utf-8?B?L3hqbVlLVmhraWdsY3lCSTBvelZkNVEwVWhLZEluOUVaSUgxNDRrK2FUeElC?=
 =?utf-8?B?MjF6ZjYreHdQRHNkUGVjdndHRjRwSjIva2pkTC9wTS9CWUJzSWdCL21acXFD?=
 =?utf-8?B?RU9ld2h0WTIrRFYwK2FwbVUvUnlGbTAzUy82azUrY0hJOC80T21RSEx0aFNh?=
 =?utf-8?B?ekxnQmE2SEQ3SzJMVGNtL3BzdXJSOERGTVdNek1tUVRuQjJLQXBqUTRMMEU3?=
 =?utf-8?B?VVdId1V6MlpyQ294TnZqNThtTEwyaUo0TFBDcHVHM2lRVVhKZ3plSU1BOENK?=
 =?utf-8?B?ckxmUG04NjR4eXRQTVZJUkR3V0hYejFzUkJTTWVTWHdVSnFvQldLOUtIczdI?=
 =?utf-8?B?UFFyQ2lVOTFZT25MU3ZDQUY2RlhZZ2N6NW9IMUNOak9GU3MwamdYSnVaSjln?=
 =?utf-8?B?RFRTRHFDdGJOSlZoUjkvcDBmWkdYNVREajBuVCtsQ2hZanh3MlhPQkF2RnJr?=
 =?utf-8?B?REUvTjIzR011TlhwbWtKRlgyK21wT0p2VVQ0Z1o4d2RSRjdrbEdUZEdnZWxO?=
 =?utf-8?B?MVBqSmlLeWR4M1E5N3BIeWFoVkNpNmhrTWUyZC9ldy8zSVBhUzJPZmtoSGhk?=
 =?utf-8?B?NkwrSVJqaWo5L3VKb0FxTWhvM3BBQmdpR3RjT2xQaXdvRHZKNnhzeU8zbVZn?=
 =?utf-8?B?eDdQWTdZZksyRVdFcXUzVEdmZ0pKamxxdm1ibTNBL3hKYW0yK1lxN1g2VlZt?=
 =?utf-8?B?VkszMzRwN2EvUG1pRUUzQjBhbUVTSDJacEcxR2pMdTdKU1lDdk00VjIzZlln?=
 =?utf-8?B?bVdhNUZwczVTdEY3TFNCMnFVYjBVeWt1Y2J1bDRVWlhkVnlQTWpzSlRFZk4z?=
 =?utf-8?B?Zm9zN1FKcFFaQVU2RDgzOWRRVFJQdDM2RTFMV1VjMVA0bDFDK21SVjE0N2d0?=
 =?utf-8?B?eU9JWGU0eEtXVWoraXpiN3p6T2JvLzdqMDkybER2dDVkQTB3VXVUYXBUVXF0?=
 =?utf-8?B?OEFwL2gxOTF4ZmVYU0N2NGVad2VPbythQ2kvUmoyMVFSRXcrUVJsYmxxUG9D?=
 =?utf-8?B?Y2ZuQ1AxL1lCbEtXT1RDcGdKK3VWdTJzVnZ1ek1BLzFBbzdnbnVRbFBGRFIr?=
 =?utf-8?B?MDl6bVZPMy9vdS9SS2ZhSEFaUUpSSlYrM2tPUlVWeTk0YVdJR0xtSXo4YzNt?=
 =?utf-8?B?dkExRGJncThwWjBzUHF4MWRVeXQ1aVk0ZTh3TEx0QldrSXhZVTlqU2JtQy8r?=
 =?utf-8?B?elQ5Z3k1c21CNG5QYWJUSlE0dndvbENlUUtQNUhRTitQK2NuY3ZYS2szcXky?=
 =?utf-8?B?WDFqMHBRWTkrdUZ1N0JBU3JXMVZ6QkR5VTdQN01RVzhicEVBYTNCSGloODdL?=
 =?utf-8?B?Z1BDb1FTOGFoQnd1d3dxNCtDcTlORnpVWmw5MTdCRXlYaVlNTldiNGdIbGlh?=
 =?utf-8?B?bnJWSmhybUg0OW5LY0h1dy9ESUxJdkE4aWNmUVJMN3Q4UzkwMUxPVnhWam8y?=
 =?utf-8?B?SldvNGdZWVdkWXZxekl1bnNJZEJ0dURHTFlQZnJuT283RlJIVEtYVjM1TUlO?=
 =?utf-8?B?NFo2VlNIYUc2UjRudGs3a2hoMjRxSU4yUE1hNUtYdmlZaFB1UDkvdEFwU0VE?=
 =?utf-8?B?WFFFd2kwa1ZEc2lxMXNseHMvbkFUYTUvY1ExS0FKd3JQTi80OW1GY3ZFN25Z?=
 =?utf-8?Q?okmGVQ8nIbdyqV5BCPbSpjk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f72e8451-f468-4482-3914-08dcd22e1ff2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 06:51:12.8864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0GjnMguzUXmF7X8BNAJCRcYhU1Sla+iYOD5zSPz44AYs8Q8QeRYQUU4QCcdOm4eAdk50PC0VonA7/iIhR1gIsR/ZR9iSKlN4/UeFLx5VQNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4916
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



On 10-09-2024 23:57, Nilawar, Badal wrote:
> 
> 
> On 06-09-2024 21:48, Rodrigo Vivi wrote:
>> On Fri, Sep 06, 2024 at 01:32:38AM +0530, Ghimiray, Himal Prasad wrote:
>>>
>>>
>>> On 06-09-2024 00:59, Rodrigo Vivi wrote:
>>>> On Fri, Aug 30, 2024 at 10:53:18AM +0530, Himal Prasad Ghimiray wrote:
>>>>> If an acknowledgment timeout occurs for a domain awake request, put to
>>>>> sleep all domains awakened by the caller and decrease the reference
>>>>> count for all requested domains. This prevents xe_force_wake_get() 
>>>>> from
>>>>> leaving an unhandled reference count in case of failure.
>>>>> While at it, add simple kernel-doc for xe_force_wake_get() and
>>>>> xe_force_wake_put() functions.
>>>>>
>>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_force_wake.c | 52 
>>>>> +++++++++++++++++++++++++++---
>>>>>    1 file changed, 47 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c 
>>>>> b/drivers/gpu/drm/xe/xe_force_wake.c
>>>>> index b263fff15273..8aa8d9b41052 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>>>>> @@ -150,31 +150,73 @@ static int domain_sleep_wait(struct xe_gt *gt,
>>>>>                         (ffs(tmp__) - 1))) && \
>>>>>                         domain__->reg_ctl.addr)
>>>>> +/**
>>>>> + * xe_force_wake_get : Increase the domain refcount; if it was 0 
>>>>> initially, wake the domain
>>>>> + * @fw: struct xe_force_wake
>>>>> + * @domains: forcewake domains to get refcount on
>>>>> + *
>>>>> + * Increment refcount for the force-wake domain. If the domain is
>>>>> + * asleep, awaken it and wait for acknowledgment within the specified
>>>>> + * timeout. If a timeout occurs, decrement the refcount and put the
>>>>> + * caller awaken domains to sleep.
>>>>> + *
>>>>> + * Return: 0 on success or 1 on ack timeout from domains.
>>>>
>>>> * Returns 0 for success, negative error code otherwise.
>>>
>>> Hi Rodrigo,
>>>
>>> Sure. Will fix in next version.
>>>
>>>>
>>>>> + */
>>>>>    int xe_force_wake_get(struct xe_force_wake *fw,
>>>>>                  enum xe_force_wake_domains domains)
>>>>>    {
>>>>>        struct xe_gt *gt = fw->gt;
>>>>>        struct xe_force_wake_domain *domain;
>>>>> -    enum xe_force_wake_domains tmp, woken = 0;
>>>>> +    enum xe_force_wake_domains tmp, awake_rqst = 0, awake_ack = 0;
>>>>>        unsigned long flags;
>>>>>        int ret = 0;
>>>>>        spin_lock_irqsave(&fw->lock, flags);
>>>>>        for_each_fw_domain_masked(domain, domains, fw, tmp) {
>>>>>            if (!domain->ref++) {
>>>>> -            woken |= BIT(domain->id);
>>>>> +            awake_rqst |= BIT(domain->id);
>>>>>                domain_wake(gt, domain);
>>>>>            }
>>>>>        }
>>>>> -    for_each_fw_domain_masked(domain, woken, fw, tmp) {
>>>>> -        ret |= domain_wake_wait(gt, domain);
>>>>
>>>> now you suppress the mmio error code...
>>>> should be better to find a way to propagate that.
>>>
>>>
>>> AFAIU the only possible error code from domain_wake_wait is 
>>> -ETIMEDOUT, was
>>> planning to assign same to ret below, which I missed in the RFC.
>>>
>>>
>>>>
>>>>> +    for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
>>>>> +        if (domain_wake_wait(gt, domain) == 0)
>>>>> +            awake_ack |= BIT(domain->id);
>>>>> +    }
>>>>> +
>>>>> +    ret = (awake_ack == awake_rqst) ? 0 : 1;
>>>>
>>>> s/1/-EIO/ ?
>>>
>>> How about -ETIMEDOUT ? Since this is same error which will be 
>>> propogated in
>>> case of domain_wake_wait failure ?
>>
>> hmm, I guess it makes more sense indeed.
> On patch 9 discussion we are aligning with returning mask of awake 
> domains. Make sure whenever the error code is required to return for 
> _get -ETIMEDOUT is maintained. May be document this as guideline.

Thanks for the input, very valid point. Will try to document it.

> 
>>
>>>
>>>>
>>>>> +
>>>>> +    /*
>>>>> +     * If @domains is XE_FORCEWAKE_ALL and an acknowledgment times 
>>>>> out
>>>>> +     * for any domain, decrease the reference count and put the awake
>>>>> +     * domains to sleep. For individual domains, just decrement the
>>>>> +     * reference count.
>>>>> +     */
>>>>> +    if (ret) {
>>>>> +        for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
>>>>> +            if (!--domain->ref && (awake_ack & BIT(domain->id)))
>>>>> +                domain_sleep(gt, domain);
>>>>
>>>> wonder if it would help to extract this in a separate function to be
>>>> used here and in the -put function.
>>>
>>> Let me think around that.
>>>
>>>>
>>>> But more then that, I have a question here...
>>>> Do we really need to sleep other domains if we are not getting ack 
>>>> from certain domain?
>>>> Doesn't it generally means that we are busted anyway?
>>>
>>> I have no strong opinion on this, main thing is refcount shouldn't be
>>> incremented.
>>>
>>>>
>>>> But also, if we really need to sleep, then perhaps shouldn't we also
>>>> call the sleep function even from the guys who didn't ack? perhaps 
>>>> the ack
>>>> timedout, but it really woke-up? how sure we are that this is not 
>>>> possible?
>>>
>>> I didn't want to change the hw state by calling sleep for the "ack 
>>> failed"
>>> domain, so if necessary, Debug tools (PythonSV) can help us pinpoint the
>>> exact failure state of the HW registers.
> Agreed, let’s avoid putting a failed domain to sleep as it will aid in 
> debugging. It’s possible that the acknowledgment timed out but the 
> domain still woke up. As discussed in patch 9, subsequent firmware 
> get/put calls will put the domain to sleep. The only concern is if the 
> device is idle and forcewake is triggered via a sysfs/debugfs entry, the 
> domain may remain awake until a forcewake get/put call is made.


That is true. I think this is something we will need to live with in 
term of keeping hardware state same untill next get/put.


> 
> Regards,
> Badal
>>>
>>>
>>>>
>>>>> +        }
>>>>> +        awake_ack = 0;
>>>>>        }
>>>>> -    fw->awake_domains |= woken;
>>>>> +
>>>>> +    fw->awake_domains |= awake_ack;
>>>>>        spin_unlock_irqrestore(&fw->lock, flags);
>>>>>        return ret;
>>>>>    }
>>>>> +/**
>>>>> + * xe_force_wake_put - Decrement the refcount and put domain to 
>>>>> sleep if refcount becomes 0
>>>>> + * @fw: Pointer to the force wake structure
>>>>> + * @domains: forcewake domains to put reference
>>>>> + *
>>>>> + * This function reduces the reference counts for specified 
>>>>> domains. If
>>>>> + * refcount for any of the specified domain reaches 0, it puts the 
>>>>> domain to sleep
>>>>> + * and waits for acknowledgment for domain to sleep within 
>>>>> specified timeout.
>>>>> + * Ensure this function is called only in case of successful 
>>>>> xe_force_wake_get().
>>>>> + *
>>>>> + * Returns 0 in case of success or non-zero in case of timeout of ack
>>>>> + */
>>>>>    int xe_force_wake_put(struct xe_force_wake *fw,
>>>>>                  enum xe_force_wake_domains domains)
>>>>>    {
>>>>> -- 
>>>>> 2.34.1
>>>>>
