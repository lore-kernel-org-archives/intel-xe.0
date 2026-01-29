Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35718D73E83
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 20:46:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43AF10E8D8;
	Thu, 29 Jan 2026 20:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZNmErfeD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2399010E8CF
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 20:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769719572; x=1801255572;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Zxm5lor625VypKJPy/enbZpBVhQ8J6jl6NTJtbCqCyU=;
 b=ZNmErfeDETLC+GvEeyxS6HWm23WHFYpCc2JBweg4qKfhIYYZhHT9r7DB
 gqLdoX39cJVCIG4oKgKJNsw7Z3jQXFmHTVVCkXMI4/BNJ98GBcY7QcN1M
 ihHBGAjfenm0Wc3PSSsqR26TNOpxv7+sXyatp3IHCTeZ9/Toq+GRekHzz
 geXkDkhRVDXuy/iMDBgL1EsBK11jbkclN2NNCs2GSCKJPwCPdBnbQE8PG
 gbL/D/OOkTMWGmNHtupDrPl+4Rwuz+n5wOu2JnkpfHqk4xpXZM5V2vKw6
 kEtja1SKZqYkaBFquZ7hzsa2oTqHA0woXbtFCdH8Ev3slqQ1nU7CrO9a/ w==;
X-CSE-ConnectionGUID: 0nJE6XveSzCGMwJfwxMFBw==
X-CSE-MsgGUID: KSpw3718RMG0EnD0XGlkDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81607444"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="81607444"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 12:46:12 -0800
X-CSE-ConnectionGUID: 7KD5svxoRN6OauknEOCoaw==
X-CSE-MsgGUID: 99bIA68xQBGfbQ1jSulCOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="239925551"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 12:46:11 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 12:46:11 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 12:46:11 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 12:46:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+ViJ8tNSX0qF0h8h+OButFvK1WEV7F8Ni+kLQghMLrZZIYxFVcnM4eNeMU3fHkwdbLVho4FSDxKITWJ5pKrizsu4gjyN11y6s+ovfU0FGmww3f9GATitGflR1YNGH0LB/L7fFGgF/1CJnAcxsFglxgl9o9ex7faU0qXrWlqGxznOpQ/Hv7T7+0qTKX9U9HsrSTu1Cxsvi9Oo9wrz8PXja1R0AdsuYFFm9AqP186ID60IjVRKgSh6RVaFYeJ0lr6fNFqop62TW7cNyGEZ6SFV5x6Eq8Ks5C88gznqY0IjcCsxOjn7AhQ6GZXrgNjSgHkrxBBaWvfRBaPo+XWQjRo0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgJRW9/6lH/ANueX8kFvdO1SXSsYWgXKKtWgRzthtB0=;
 b=JgojuCLKuKmRc42gRWCirpUQZAlvmH1dSdXOVhSuv43LQJybxw+1ym2AHWkZt3esqSJUo8e2zCso9yfvu65aZ7xdcvjKj5+H6a0RfcKiuUy0LsONa0XFUtNGwfELPY8zQ2Bjc7SsqdDfGQHJt/JBApKvfF8A5r/U9TEnc22J/SXPYIB0N1ZjAWojGZ6laV+oXN4J8fiDfL7LiKOaExZ296tx0WfViwyI5tNaALr8e4a05p5M4jFfIhqm/LOLMHnmOIt9eNSLAOIE1kQ2YdhAz9aDfI7kPTkRyOKbHG856QSMBliNdNRvG36eYtgZomRxUiA11EIdy4/TCDKRCDN0Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB6808.namprd11.prod.outlook.com (2603:10b6:806:24f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 20:46:08 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 20:46:08 +0000
Message-ID: <f9ea0d01-a093-4480-a077-005ca61df82a@intel.com>
Date: Thu, 29 Jan 2026 21:46:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Fix CFI violation in debugfs access.
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: George D Sworo <george.d.sworo@intel.com>
References: <20260129182547.32899-2-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260129182547.32899-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0196.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::17) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB6808:EE_
X-MS-Office365-Filtering-Correlation-Id: 62cc93de-31d6-4e6f-e478-08de5f776de9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHR6YTduMVc3eHJ2VVNzdGxnT1JnQldRdjZjTWtvK1NSRkh0Rzg1cnFTdlhD?=
 =?utf-8?B?Um94OW15VE9pT01LUThUMlFGUEluQ3c3NVIwZE5aRGJhME5RM082bHY5a1VG?=
 =?utf-8?B?Y21JUnB2U3Z2SStuQWVVeFVVdnY5czF3M3FUbm00cHh1dlF0aHhROUxqM3VH?=
 =?utf-8?B?Mk1uQ0IvZm9UczZtNjM4QVpsYktac1MvN1UrNFViMndsMmh5NkRoSU9pbHRC?=
 =?utf-8?B?Qk16NHUxbUppUUNUdXdhek03SnRZdmxyQVlHa093dkV6TzM5Y1VVZXVKbGpO?=
 =?utf-8?B?TlhPT3lkNlFNK3VvQTQxekZpa2d4dXV6dVg3OWgwZG1iaFlkbnZ3RFZlcTBF?=
 =?utf-8?B?RU81aVlyZUZ2MnB0MHFDZDM3YzE4Y0FONlA5YmRSNHVrMGpKNVJLOUdCWjNP?=
 =?utf-8?B?UXMvSXpVSmtjQUZCLzBjZFZDVUhjSHJmSEwxM3VORVNLSEhXTHlCZlFVZy9P?=
 =?utf-8?B?VlpkMEloUVZGZWZ0eHZ2UGRRNHFRVUVhTGJBRXc2bWNvS0ROemRaVHFkQ0VI?=
 =?utf-8?B?ckRIMVVKZ1dyN3VWRmV4L1Z2NXYyNVNsOHRZMFdWWlFoWFhnSnZGbmlRNGQy?=
 =?utf-8?B?MnR0cEUxbmttci9TNVFraUczVFI1Z1NNS3BUc09TdFRqNlpYWUZDRzRZQ3Q3?=
 =?utf-8?B?NVNFYnJFckxKSGl0Y1FrV1pTcEY4cEhLY3VGdkhIQTgzcFQ1ZWxBV1hSKzVq?=
 =?utf-8?B?UXBnTFZaSUxEMlVXMndqc1p2REk2UkVlandkcW9WWXdhZzNKVWRuM2JFTVFZ?=
 =?utf-8?B?bnh6dGNER0hYYkllS3Y2Vmk3V3V1NHBQd1NLTnNzbmVhUmJsYXlSZG1ObndQ?=
 =?utf-8?B?WEtwN0VFdXRYc0hwTTd1NC9yaHJ6ZWRUV050Y1ZuU0ZDYXFnTnFnZlN5ekMw?=
 =?utf-8?B?ZHR0eHhuMnVZM2RJOWwyZDE5eHd5RjBYbU9kSVhtR2dsWS9wUXZ1aDhoSTBK?=
 =?utf-8?B?UnVoVld4VWQzYXBGa3ZRdTBtQzFFTlBWNEEvUGhOZVMzL2ZlR1Jwd2I0UmU5?=
 =?utf-8?B?UWJDL3FmZnQ2bHV1bDJ5YXNNQ3BSSFlRVUlZQ1o1TEtLNWlZZkQrTWV3cDlt?=
 =?utf-8?B?YWJ4a0xrVE9KaEhxVmtiN2JtOUwrbHpZd0FYVHZhVzc3TjB6SnlpMXlKV2tv?=
 =?utf-8?B?b3MzcUNFUlVNUUhUeGRvNitKZExNc1M4WWhhNUorcmlVWjlxV0F5d0RmczZa?=
 =?utf-8?B?UWR3R3BGL2tVY2NITkVyVkJneGR2K2VCSXpJMnBIU1hBaGhWaFl5M2k0RUJT?=
 =?utf-8?B?eFJ6UzVGZHoycHJJMXJNdFIvNnlvV2hMeEJwbTZFV1piYW5uVm41UG5xYXh5?=
 =?utf-8?B?VExiUnYyMVBLSmJkZ2cyV2FwUHhQNk83QnRkV1pvTnpkdlVGOWNvYk4zRFFt?=
 =?utf-8?B?bVlOTFlONFBKWmFJeUszeTRPWm9aZ1dnY2pXTW1sZUxYUUovSjdMT200MHFK?=
 =?utf-8?B?M3NrL0RDTTR5OGpqcUpJWTFBV093aVp4QVF1d2grdGFQbW1hYU5sSW4yenA2?=
 =?utf-8?B?M2VDWlBQSGdFOXFXcmNSRWR5ZnVZN1JQT0pTZ0FOQ2dkcWF3ZFVxUlBCQnpl?=
 =?utf-8?B?VVFveEZBdDZmaGREa0RrZlprblNsbUFhcjc5RXRWdWh0WldmNmY0Zk4zUnBK?=
 =?utf-8?B?dzZva3NBa0FvdXFOVml0anR4cDArZTRmMFh3Vks4YzdMM1ZmSkZqNlRaS0l3?=
 =?utf-8?B?MnhpUGo2K0htMjNReUhNRUtnd1dZSFpvSFUwRHVobkVqNW00Z1AzR0drVDVS?=
 =?utf-8?B?TU4zRG9ZUkd4eno1VUdkQ2JFZU1qUTBaWUNwTzJiaTdQYTdQZXBuN2g3RUdF?=
 =?utf-8?B?MUw2NFJCcmwxc0xUck5YdUl0SjJXVTNIZ252WHRVT2lxUlRYd0FYT1Z4OThK?=
 =?utf-8?B?MlVUa3I5ajVndURUQ1NXa3lLUEtSS1dHUVRmZFB3Q2Y1UzRhUGxpcEJOa2tn?=
 =?utf-8?B?Nm81WDF1cm8wb254Uy9UNDJldWhWZjRxQllsY00wV0RZSTI2bzQ1eGN1bTlS?=
 =?utf-8?B?d3IwUFk1OWc0LzZFMUUvYjdiWHl6dllEcUFadlpqSVdHZ1ViN0FkOHJiSXlw?=
 =?utf-8?B?TncxQWVIeGpZb091ZWZab0pLWVhOcEdHNVhvQStPSVZIbTltazU1UXZKTnZ3?=
 =?utf-8?Q?h2+A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWowRzh3azE1dkFjVUhUZ3dVRXM5YWw1SUVlS25YNGFZa1RGRkNzY3h1dTdS?=
 =?utf-8?B?Q3RIYXRpTmRTckVXZm12K0JrcC9VaTgvU2dOQTlRZk5jS1o2aWxPZllXODRJ?=
 =?utf-8?B?dWFJTVlXa240L05WSS9iaW5vU3ZlZGRsMGI0d0xRa2h5RnU0MktkTHIyNG1F?=
 =?utf-8?B?VzZJWXVhaHNXTVlpMDVoRmVKcFRCNDJUU1M3Qzd6Y2t0YzBOZThLNWMxQlRZ?=
 =?utf-8?B?eWdkZWF4cXdlSStTNGR2bW5Sdk9rSVdDM3Y0TE56NzdqR0x3d3NCY2Y3NVVM?=
 =?utf-8?B?SEwzQy92YWFxRm5IQWdtbGxyUWorNThMd2hwMk9GMXBVZlNIdWJZcHhzY1dy?=
 =?utf-8?B?cm92TytobkRFdEkxLzZQV1B1dzlQYURNN0dZTE5YQnVkcGhrNENvTkFXQzBz?=
 =?utf-8?B?TTdDaHRCZGExaWV3LzIxOEd4Qlp4R3c2djB2N09RS2s0M09MbEZEbm8vaGtI?=
 =?utf-8?B?WVhWMUZjbWJIQmNlbnM2YXhEd1kza2lLdGY4NUwzR2paV2VtY0xGaVpza3ZL?=
 =?utf-8?B?ZzN3dzJpcGl4RkdaYytYbndIMTRtTm5EZWVoS0hxN2tndDlkMGY4Mm14Yjdm?=
 =?utf-8?B?TnRGMzR2Mm5aVWpJenltRVRaRFEwM3l4d3UvL0NtbXFIOW4zZk55UGc1NlNw?=
 =?utf-8?B?cEErNDE1dG9HeGhxdXBlY2huNHVOcHVJOCt3aDN6QUkyME5OVkhBMCtzUTBS?=
 =?utf-8?B?VlFwbGhKeFo1ZGJWMkVyL2IvSmwyck9La0dFekN1eWREZFRxMlEreU9ITGtO?=
 =?utf-8?B?RlBLdk41Rk9UWnp1TkxaYW43NHlYODZwVlpVYUpSbEVFMDVwWHhYcU1ZR3Yv?=
 =?utf-8?B?a1lqMFk0N0lXMnNVSHBiZzd3Mkd5Q0JhRDJYWjdxbHJEd3ZKeFcvSzJXR3JS?=
 =?utf-8?B?RU5RejYzV2gxaVU3OWNBa1pET2xyZ3lieVpIbnVrcEFjOW83Yk5HVVcrSksv?=
 =?utf-8?B?OTlkSkdiemxTNDNMeDZZZGtMUG55ak96bjNYQTNob2praTJ4QjZxL1dRK1BJ?=
 =?utf-8?B?bTlzeHFJY3BiVG42RWE5OXZ0WmNHUGNKY0p0ZytibGxvZDE0cjVSYmpEdWhP?=
 =?utf-8?B?dmpzTnVxWXhCYnI0TFp0Z1VDRGhTRm5sYmV3OFVjclhISjFZaGM0bVNSRlgx?=
 =?utf-8?B?Ni8ydGtTUWkzMkRyQ3NmQXFSZWlKZDlTNXA4a0Nxck9SdlhTbkxrOWNYNFZa?=
 =?utf-8?B?c09hTDNFMEhaWUxTcDNkQW9uV2VQR3owU3htcld5aVgxanZ2UjE1WlF2SUJ2?=
 =?utf-8?B?cGVyTmhLbWRyRVEwaHJsaUplUlZ3Z1NuM0dlRVhwTjVKV1U5SC9mWDBHUnQw?=
 =?utf-8?B?VjNGbFdrY0VNQW95T3VzdzhRTC9RNWpkRmIyRWx5OTAvNE9JckJDOEFGZ2hV?=
 =?utf-8?B?K0ZUcnp3dVg3bFhRMEVjTjBXUElnTUpVTjUvK2lnQTJ3Rk5sYnJhNU5GaXdP?=
 =?utf-8?B?TkN0YVV1b2M0V1RrM0wyZ3RyOWZDZ2xwUmdUS2p4aENwMlJxTDJ4NGlkbHp4?=
 =?utf-8?B?RWE3UVVYS2toVWg5OUptVnYxM0hUSkZpZGhEd0prZXJmTGdKQzI3d20rU2Za?=
 =?utf-8?B?ZERqNXc3Tk1vKzZTUTNoVHZyczBHZktCRnRXVS80RWQ3cHdoQU9DOVlESXlh?=
 =?utf-8?B?cnVQVHJpYkJBVEcvRDFqbjcxNlZCMG1pRWxwaG53L3dlUW55YlVDWWh2aE9B?=
 =?utf-8?B?cU9BMU9ZOUNSaVhUdE43RjVnZGt0NFRoUEtudzhrZEVVejFoQVpkUXVyN3FI?=
 =?utf-8?B?bUNMSHRZTFk1MnBwVnVxcE00dmprNXU4NG1yYzFBNTBEbjFtWFpxUU9DaHBj?=
 =?utf-8?B?VW10ZSthcUc1ckU1dUdMRlVpTzZta2xURHZlMTJ1c1E5a0UxemRUVVVINVBj?=
 =?utf-8?B?dFdjT1hoMlg2Q0luZkhtSjYzK2NQVWRPTXNsY3dpSXM2Vlc3RndRby9MckVW?=
 =?utf-8?B?aHp3N2cvYXdIWXBVR2U1VlNJK0lsVGZxVGhSdmdoUDA3ckxBd3VYVTVld0VU?=
 =?utf-8?B?ZlpHUVhKd1BxcytCWGNQWHZLYzlhSXl0dU9LUWFXdGhkVGFsZnRhS0hXVmZ5?=
 =?utf-8?B?N1J5OTErTzIydzg1U0w2UEgrR2hBcHNrMEhhYXE1elc3K2EzdkFVcDVNZEZt?=
 =?utf-8?B?ckxuZGMyc05vU1lTN0k5SUcwSUorNUR6VjlkdXE1YnRYSldlVGI5am5JcFdt?=
 =?utf-8?B?ZnZyV09iNU9ua0plMWJFVE5BckIzWGxibE5lOUV6QTRpdXVUVWpvY3hHNmNa?=
 =?utf-8?B?emtPU05ycGliYm5pWTBkOWRVR0I2V1lIMUE1M1V0eFRLTzU2d3RIMXYwME1T?=
 =?utf-8?B?eEMyNll0TUhCTVA4VTdpZFVRbFhzY25uY0xoSXZaR2t5QzREcTZNbEpFQnN0?=
 =?utf-8?Q?uDdNQrn5RAyc2c68=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62cc93de-31d6-4e6f-e478-08de5f776de9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 20:46:08.4995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w+feXMB/Kh5046hgQuGjA/7+Y5WtlHDiHplauIshff1lXpWqZ357mZB2j06o7PuNKZ6sL9R489g7jmteEqCRxAvmzjA1k92t8aAfmhp/3ug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6808
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



On 1/29/2026 7:25 PM, Daniele Ceraolo Spurio wrote:
> xe_guc_print_info is void-returning, but the function pointer it is
> assigned to expects an int-returning function, leading to the following
> CFI error:
> 
> [  206.873690] CFI failure at guc_debugfs_show+0xa1/0xf0 [xe]
> (target: xe_guc_print_info+0x0/0x370 [xe]; expected type: 0xbe3bc66a)
> 
> Fix this by updating xe_guc_print_info to return an integer.
> 
> Fixes: e15826bb3c2c ("drm/xe/guc: Refactor GuC debugfs initialization")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: George D Sworo <george.d.sworo@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
> v2: make xe_guc_print_info return int instead of using a local func
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 6 ++++--
>  drivers/gpu/drm/xe/xe_guc.h | 2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index d2d3aa7a859a..8d7d20819eea 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1662,7 +1662,7 @@ void xe_guc_runtime_resume(struct xe_guc *guc)
>  	xe_guc_submit_unpause(guc);
>  }
>  

nit: one day we should add kernel-doc here ...

> -void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
> +int xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	u32 status;
> @@ -1673,7 +1673,7 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>  	if (!IS_SRIOV_VF(gt_to_xe(gt))) {
>  		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>  		if (!fw_ref.domains)
> -			return;
> +			return -EIO;
>  
>  		status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
>  
> @@ -1699,6 +1699,8 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>  
>  	drm_puts(p, "\n");
>  	xe_guc_submit_print(guc, p);
> +
> +	return 0;
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index a169f231cbd8..66e7edc70ed9 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -53,7 +53,7 @@ int xe_guc_self_cfg32(struct xe_guc *guc, u16 key, u32 val);
>  int xe_guc_self_cfg64(struct xe_guc *guc, u16 key, u64 val);
>  void xe_guc_irq_handler(struct xe_guc *guc, const u16 iir);
>  void xe_guc_sanitize(struct xe_guc *guc);
> -void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p);
> +int xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p);
>  int xe_guc_reset_prepare(struct xe_guc *guc);
>  void xe_guc_reset_wait(struct xe_guc *guc);
>  void xe_guc_stop_prepare(struct xe_guc *guc);

