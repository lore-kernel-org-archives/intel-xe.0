Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C5DE63F3F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 08:53:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE9310E192;
	Mon, 16 Feb 2026 08:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U2Aj1wKu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3328B10E192
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 08:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771232002; x=1802768002;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=XnbHBXLcPWFrQcaDe+WlYuqZfQxHiitOY/CkHeCjP+o=;
 b=U2Aj1wKu3Mo5zEHT3mNt2JXZrsWsbvB4m2pk9GpFxU93DZM/4q+kWVdB
 faKbwSlGkfZnaJPWv/bfaM8JeJTAdSzgQXwvtFbnDJq4Dh7mRifohTeP4
 nV4ZUEKwMbeMv7vUcaTt0IdwxAbIr6oa4zcHf4GRCwnyTUkcLK6PlnaJu
 zEvt6pzJypUeDMwmxCIv6s3kupkZTrV1a2DQuS9lG/R0b0bN38nP58UF1
 C8iurGc7Wqiep8PetBhOKwEjryJ0lVMFuxoM8f644LnnKUeTuRvN7e204
 abQ2OdqtEX5Uoy9dRo7ssxjCpdiqOJ97pV8vDbQM7uRobK2nnq2irRMQZ A==;
X-CSE-ConnectionGUID: QaNDvWjrS3Klt3lxtJ9Niw==
X-CSE-MsgGUID: kxTTBpogQICnLjh7YdGW4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="83408056"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208,217";a="83408056"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 00:53:20 -0800
X-CSE-ConnectionGUID: jK2zqUVxSViKLEj34RCyZg==
X-CSE-MsgGUID: AjLna4RKSGW0apIe1+l26A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
 d="scan'208,217";a="218096100"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 00:53:19 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 00:53:18 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 16 Feb 2026 00:53:18 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 00:53:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s44LLe67msC9ttCjglSCTj/HuR0FD3MdwI/M7p54LcHNyqFStM5R0hrLUsk+aHpEQ1odc7O1FU9lt4cQ41eXjsCa5EpYcwHRHk0cdaZ0VDaI/155Gdt3dcaHRfZUtsgUyMqBxjZiyI8DkFcn48rqT/LYx/k5V0wIBRk3QhQfkjbRkQIJZwY9CcNDa9q7SqjRgO+qckbxTWw1kH/HLUNLIVmqMazaobMX4V8EHbWsnOI62fBJsShibIcNnCnZGlSmpDbwxC+8eWFcRU3WxjsWRR963f/uqJTnMb7J2NTfBuEFAcU4djwy0boAV8pZNT4iHNqFvPftmSAhfibeKnpmQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLftjn2FEE6qTG7kv2P4Nc3McoX5tpzT/AhSFipVtc4=;
 b=Yd1tKydHi/iBIxQssTMJI4kHBbzUbZFKgmdnkqI6PJwTVgjcmypcT6v8F2710owbOK6M/O86EOFF82EogPZ/LTXLBxKA7IV2kYMhAumQ9nHZ889IRFOXTnEueV0Mlq7H6v7+mwq6xuKdgAgjCyzIFUZrlR+syWYtGFCyWy0v0q+pFpJZu5j74/+Ka7Zz5lk2QDARozD8LsAq+7psygm7t0zgD453Ngii7bsI6qhDrYQU52CQmeaAzVC7DzDtiQAZgiBipi04FoVUySpn96vG6SuxgOx/GJvjZLmuvdJ8DkGUjuBISbhxMMnpiXFBAtwGZYqvZ6dJ5PobmjI+RxHoTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SN7PR11MB7510.namprd11.prod.outlook.com (2603:10b6:806:349::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 08:53:16 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 08:53:16 +0000
Content-Type: multipart/alternative;
 boundary="------------aOnWJkQP01vmL8Jw4sOonuYQ"
Message-ID: <b903b2bb-572b-4269-81c7-792b16e2acaf@intel.com>
Date: Mon, 16 Feb 2026 14:23:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/xe/xe_pci_error: Implement PCI error recovery
 callbacks
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-12-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260122100613.3631582-12-riana.tauro@intel.com>
X-ClientProxiedBy: MA5PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::17) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SN7PR11MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eff9311-6490-4933-47af-08de6d38d333
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vzd6Tm5CWUVRZ2NnN1JyRUJ3ZVVYKzVVZnREbXJ6QVVkVy9RUTFrS0lpZ2lN?=
 =?utf-8?B?UXZlMXZLUXp6Z240b3VXTGhHeGRtSHNqTldaQXpINmNJcytTYVhMUUFiNGNa?=
 =?utf-8?B?TDBQUGJMTDRoRkEwMjVkSzFLQTBad1FOQkhZQVU2WWsxSlNqbWtLdTBiaU8x?=
 =?utf-8?B?NXdlTExwMVlhUXNyNlpuRHpWc1JGeGI4ejRzRTBjM0NDRmdFQkR5dGlES0pv?=
 =?utf-8?B?RFFUV0pBWWN2Ny9SVkppK3dwZU1wd2lBYmRZQ0tTajZ1Ty9ORzRibkpyMEpV?=
 =?utf-8?B?K3RNcHdaY0d6UW9VdWlYRnNNT29qUEZKMkJ2cXZwallqUE9nS29yZDRXWGdj?=
 =?utf-8?B?dU9CSlRySXFSc295U0R5bWV3ODJIZWtaY094dFd5TFNTV0hLdmtqNVJ5Vkxa?=
 =?utf-8?B?dmUyVnZrSHY0LzkrNzhVVGphOEJINkh5VWZPOVo2RDNXakVWbGxUTHFEeEQ3?=
 =?utf-8?B?SkE3TGJsMGhlYUlVTGJqbXlBU0laQnJSR3gzUU1LclFEWVhTTEMxbTdHNTFE?=
 =?utf-8?B?RUVCQUowRXJyWnp6Z2JaaXFDSHpQM2hvWmw3Tk5Bb01PT1k5T0w1Z3lqWldB?=
 =?utf-8?B?M29yMGJPWG80ZTFxaGd5YkpxQmxDS0xnRENBZTlPZElKNVR3S3BvWmIvbHJI?=
 =?utf-8?B?TFVwUkx6c3lBWUgxUmcvTitHMER6d2hzYm0ydHR6ZFlLM0RJNEZCSmM0RlBO?=
 =?utf-8?B?RFVCcExCVlVRUktTa3d3ZzNSLytsSGg3MUxiUEltZVE0NXFOMXBJaTZsN2F2?=
 =?utf-8?B?bWIyL2ZTV3U5RE9qOFF4QVdqZXR3RGRVelBkbzkzU1hIY0VaSHhjRHNtL0xY?=
 =?utf-8?B?TmFDSVZTdXduU2E4UlVxdTlpdDhqaUdFTEQ3VGdGTTBMSUI3ZFVlL1Q3TU00?=
 =?utf-8?B?cStvVUFGTWg4MXFQWXUrT2tTLzNmTkF3Uk5GUm1uSkRpUC9GRExVeUhuOWVp?=
 =?utf-8?B?cXN1ZWxOZ0RtZEFSU0xUdXZJdnhPeEhmejh3MDVSZjFYem1uazNwVEgxcFdN?=
 =?utf-8?B?dC9iUEV2RjNPOXl3OWh2RXZLaEhSSnZhbS9UaEltNzhKNU5IQlRJdzFwTUxN?=
 =?utf-8?B?RXAvdkcvdDhCTVhXNHZaYjRzc1pwK2huYlBSUVpXdEQ4YUwzNWlMOWRGaXhR?=
 =?utf-8?B?Z2lpejltcjdNazF0R09BL3RMaHc1OE9qWTB0MEd5Q1A2dyttM0VNeWVHUnl1?=
 =?utf-8?B?L0pVMTFtbkRGWjVKWGhXOHRMa0J3ZHErOXJmOGZ3eXBxenpYNms3VWVuV3lW?=
 =?utf-8?B?c09wazB0QmxEZVlRblVlbHduLzVVeVpJNDlKYU1NWjlMTzRTUGZaTjRXaDNr?=
 =?utf-8?B?bTB4dzRNSTB5aU44U0Y2UkNDbDBuV3EwWFpnTnk1WENPRU5QN3NITTh5djVP?=
 =?utf-8?B?M0orSzlIellPc2NSZ0FTendoeEtzS3Z0SDl0ZVk2YjF1KzRvVWcxWlhQaDF2?=
 =?utf-8?B?UnEwc08yWXlhTVJXZDhLNk1ZRVZsSEovQmJDckNsZ05mWncyYzI2U212dmNL?=
 =?utf-8?B?aHJUUC9oVXptUTNpQ04zY05pQi9qVUFrbUcvOXhYNkE4MUgvNldUeDI0T0Jt?=
 =?utf-8?B?a1habUFKSldieXlFTXFMbWwzOGI5SWFVUXlhL0ZtczVvVWhzaWVHeHA1bzJW?=
 =?utf-8?B?NDFic0c5VDFYUGZBUDJzTVg0Z3Y5TDhsU0VsOWFoSHlIbXlJbWpUZGw3MWRK?=
 =?utf-8?B?aVkvbUFtdDBjTDQxdm5JSGs4Q0I4R1NJOCtlajBHZDY3ZGhGKzRaN2h1dnFU?=
 =?utf-8?B?aXN5SE1nZXhHa0NsL1c5V3NVV2JZQ0JIQTlTaDg2elZ5VlpmTWJ2aFJFc2Mw?=
 =?utf-8?B?eW1lTFg2L2tiZzBsczV6QmhGTWZxMnl6aDVPeXpZTU1EbXF6N21XaGlONmhE?=
 =?utf-8?B?SkJSQWVmS1FDSjVzVDY2QWE5a3VNSnczY0lKM0ZZS2lCOWdaR0E3aC9jRkEy?=
 =?utf-8?B?d1NYd3lBc2xwbGhRZGxVL1BpSTZaQ01icU1KY2xweWtsV0JiTm9BWExzeU5P?=
 =?utf-8?B?MDhZYzIxcUsvNmpPanJqa1FwOTl4Z3JOQUFOaTdFQ1dENzJPOXp4YVNLdGFH?=
 =?utf-8?B?SzdpQUl0bG5xYzZVMFhMWm1GZldSSGR3WDdFYitkV0x3aXFobTZ6akFzMlZh?=
 =?utf-8?Q?S0yA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnpjY2lEd1l5ZDY2NFVCRHVrZjRmek81by96RE44SGJqNnlJeFlORHRZWXhP?=
 =?utf-8?B?L1BQc09sVkU5V3IvbUYxc0VqNWdudFZzQzJMV1pPV2dvd0NrSnpHMmp5VERl?=
 =?utf-8?B?dnlUZ2VMc3J0RnNYTmFmTlZ4WkVEYVR1NEVvdE1TRTJJWVdiamh6c1FCWTY4?=
 =?utf-8?B?UG51azlsREhrQVRsUG5GY1JHK1hCNmt4cnhOYzFjeGNtWHllQ29KL09ZNFox?=
 =?utf-8?B?WmhPUGxtaTdHeE1CVHMrSnkyWDl6YVdTQjA4OHplN1M5YXVVZ1RMaVA3UVZt?=
 =?utf-8?B?dEZHUFRQSGNWV0hYZXpzS3RNNk5sQWw0cXdTYkxoS3BBNkNNRmZSMktyWUMz?=
 =?utf-8?B?blJadlQvM3RQSS9ac01rTDJySzlMMSsrUkpkZU9GUjE1Y08vdDVZM0xRcDhp?=
 =?utf-8?B?cnZiQStiamtJcDFjcEJYRkl4WG1mbzFhY09WdEhKYnIyQVpJN1NEK2RiS0N3?=
 =?utf-8?B?RnBHdFA0aDBnbklTQ3B5ZGIxL0EzSFF2RWpQcjAwRHlselRRQTZEdDZDY0RX?=
 =?utf-8?B?M0RrMlA5QmI4VU9uQmxWbVI0cldSWFY4QzBPS1Y4SzkxeUVzSktuVnUxS05P?=
 =?utf-8?B?b2cwdm5IVk5VUmtIQVNUMlZ5UlZ5cWFhRHdSU0FlOGk5Y2lGYXI3dU1XbWR0?=
 =?utf-8?B?eVBwNzBESXV1U1JFZ1RXUWJ5SHIrdzh4MTFEeld5QW1zQVYrU3RNUEdhRk5K?=
 =?utf-8?B?Z0VmVkhDekxzOGtrYnRKaVFnVUFPamtVRlRPNzZQQVc4S01HQVUxaUlZMlV4?=
 =?utf-8?B?ZmpPNFBMdkJPLzcxSVF5MTBBRFZ0ZTlaL25pSmtXREhRcjdyTW5iTTk0MTg4?=
 =?utf-8?B?a0NqMDJiUXZOYllTYzNWUVMvTGFBT3dYeFZaVTZJdUN3VFJvVnhGcGhSL0xv?=
 =?utf-8?B?R0lMeTBoOWZUOU1lem50Wmd5UmhKTjlJOHFvN1M5UEtpMURtdXVyS2cyNkxl?=
 =?utf-8?B?TjBQOUR0SDhKenR4VTNtckZLaGcrNEFYSUVVdjkvaDFUemRZYUFXekwxSkZS?=
 =?utf-8?B?enN5S2NPb3JDMW5xaFI1UUo2em05S2tIWWlkbFo5TFpLWkQvRWt3RlM5djZR?=
 =?utf-8?B?ZzdzbXp6WFk1cjJzWWlJUll6cWRJK2kvTjBrYk9YZTl0SVoxSkk3cHFEclFu?=
 =?utf-8?B?TFhZeVpZN0ZxM1IyVjQ4bTltMmozQkk4UytPWnFyYkhCdXZ5bi9xZ0JvOUxK?=
 =?utf-8?B?cDBYR1M1SkJncXJ0ZU9OZDE3YTZLekRsRDlobnd3dDhMa2NFaGdodndYWERF?=
 =?utf-8?B?VjZPcFZPZ1Q2WTR6b2JuUGhGVjVIb05tdlBiWFVJTm9Ma3l2bWtMMFdZNVZj?=
 =?utf-8?B?d2dPTDlWbHpiS083c3k3OTNmUnJkellENG8yVEhqSC9PTEU0NFZTM3RBSlFj?=
 =?utf-8?B?ZEZpMGtqNjUxYmUyMnU4WlNzOEdxR1NhMnZxYUpoaUs1TllmSGV6WVhWRjU0?=
 =?utf-8?B?cXRJM3BpcmxPdXh6MHlWdVQzNkZoTFE0SWtPUTd2K3NXTnNEblRVQnYwR1Uv?=
 =?utf-8?B?TXpLcFYzajhqcVlIRGdIeVlxK2ZOSVlsOEh5OW11VFNaNWRSUDYyZzJkN25i?=
 =?utf-8?B?blcyRk5RejBIL1lqc3BML1JHcDNpMGt2ckxjclk5ZEN2RkdyRC8yamxtQTBG?=
 =?utf-8?B?L09vUG0vRTdYNDBBZHc1dXc3Ty96SytrRHUvdUJLbFRJZnZaWnA0eHNlWDJT?=
 =?utf-8?B?ZmlJTi8wd0duWHdUNy94cm41aEViNHVUU2lqRmRZYk5FV1hWYWZUMjN1bXp6?=
 =?utf-8?B?K0ErVC9tQTF0Q3Q0KzVjM0c3QnFrQldoTXRsV1hnTVVlOEZsaTZ2S0JUVzJp?=
 =?utf-8?B?RTk1T05LR2xCOFBnV08xWFMvUXVZZWpRRWF1dUJEQ0xyNVRwQVZnRlhjNU81?=
 =?utf-8?B?Z0M1K2h0UDB6Y2FBY1JWMzlwR1pjMm9lSnRqb0J4NFJqMkI0ZWFoTmwvaVRP?=
 =?utf-8?B?aDJ1ZGU3RWxIZHIrRFJqZjVvQXJLVVc1QktoTExXaG1wRzdXUzM3U1g1SlZs?=
 =?utf-8?B?TTNPQVo1Ri90cTVKaWxyVzEwOW9qeEVUNFFXNCtCdHM2d0lCclpLSmh4Uk0r?=
 =?utf-8?B?VG9wdGZYbURJaGxZb3FZU2htd2xWanFabkdmRkpnaUE3bG96KzQyTDhiWjFV?=
 =?utf-8?B?SmsrL0FIbEtoOEtPc0h1T1ZZMnViWEZtbU5XQ0ZIOUJ4eVQzcm1peDBHTTE1?=
 =?utf-8?B?Y0RQaUdEaHJrODZPTDB4Q0VtZDFvOTY0czNMUDdEa0d4OFhYclBvSk1NVkV6?=
 =?utf-8?B?MjUydjJ6Y21scWtlVm96UCtacFNWRFZSV1lGTnlpSGQ1eWNOTDUzSEsrK09M?=
 =?utf-8?B?MWphajhsdFVtS1lIenAyYnRjekk5VGJHemJ0Q3N5cUZxMFIwYmZoekVVT1FE?=
 =?utf-8?Q?4FWMqq2bkNGt/pWI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eff9311-6490-4933-47af-08de6d38d333
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 08:53:16.5694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6PCS0Vr+A0xwRCijEBAWIBbBLpmDmBVW6scOMgq04J5s+2Qd1uHSVlX1Iwnu6iiJZ3+zDZp3DbdyS8Sacq86T3ys25kM+aZmVm8gB0YR43o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7510
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

--------------aOnWJkQP01vmL8Jw4sOonuYQ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Riana,

On 22-01-2026 03:36 pm, Riana Tauro wrote:
> Add error_detected, mmio_enabled, slot_reset and resume
> recovery callbacks to handle PCIe Advanced Error Reporting
> (AER) errors.
>
> For fatal errors, the device is wedged and becomes
> inaccessible. Return PCI_ERS_RESULT_SLOT_RESET from
> error_detected to request a Secondary Bus Reset (SBR).
>
> For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
> error_detected to trigger the mmio_enabled callback. In this callback,
> the device is queried to determine the error cause and attempt
> recovery based on the error type.
>
> Once the secondary bus reset(SBR) is completed the slot_reset callback
> cleanly removes and reprobe the device to restore functionality.
>
> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile          |  1 +
>   drivers/gpu/drm/xe/xe_device.h       | 15 +++++
>   drivers/gpu/drm/xe/xe_device_types.h |  3 +
>   drivers/gpu/drm/xe/xe_pci.c          |  3 +
>   drivers/gpu/drm/xe/xe_pci_error.c    | 85 ++++++++++++++++++++++++++++
>   5 files changed, 107 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index f6650ec3ab42..5581f2180b5c 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -98,6 +98,7 @@ xe-y += xe_bb.o \
>   	xe_page_reclaim.o \
>   	xe_pat.o \
>   	xe_pci.o \
> +	xe_pci_error.o \
>   	xe_pci_rebar.o \
>   	xe_pcode.o \
>   	xe_pm.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 58d7d8b2fea3..81480248eeff 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -43,6 +43,21 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>   	return container_of(ttm, struct xe_device, ttm);
>   }
>   
> +static inline bool xe_device_is_in_recovery(struct xe_device *xe)
> +{
> +	return atomic_read(&xe->in_recovery);
> +}
> +
> +static inline void xe_device_set_in_recovery(struct xe_device *xe)
> +{
> +	atomic_set(&xe->in_recovery, 1);
> +}
> +
> +static inline void xe_device_clear_in_recovery(struct xe_device *xe)
> +{
> +	 atomic_set(&xe->in_recovery, 0);
> +}
> +
>   struct xe_device *xe_device_create(struct pci_dev *pdev,
>   				   const struct pci_device_id *ent);
>   int xe_device_probe_early(struct xe_device *xe);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 944f909a86ad..2d140463dc5e 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -669,6 +669,9 @@ struct xe_device {
>   		bool inconsistent_reset;
>   	} wedged;
>   
> +	/** @in_recovery: Indicates if device is in recovery */
> +	atomic_t in_recovery;
> +
>   	/** @bo_device: Struct to control async free of BOs */
>   	struct xe_bo_dev {
>   		/** @bo_device.async_free: Free worker */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index c92cc176f669..e1ee393b7461 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1255,6 +1255,8 @@ static const struct dev_pm_ops xe_pm_ops = {
>   };
>   #endif
>   
> +extern const struct pci_error_handlers xe_pci_error_handlers;
> +
>   static struct pci_driver xe_pci_driver = {
>   	.name = DRIVER_NAME,
>   	.id_table = pciidlist,
> @@ -1262,6 +1264,7 @@ static struct pci_driver xe_pci_driver = {
>   	.remove = xe_pci_remove,
>   	.shutdown = xe_pci_shutdown,
>   	.sriov_configure = xe_pci_sriov_configure,
> +	.err_handler = &xe_pci_error_handlers,
>   #ifdef CONFIG_PM_SLEEP
>   	.driver.pm = &xe_pm_ops,
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> new file mode 100644
> index 000000000000..a3cc01afa179
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +#include <drm/drm_drv.h>
> +#include <linux/pci.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_pci.h"
> +#include "xe_uc.h"
> +
> +static void xe_pci_error_handling(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	xe_device_set_in_recovery(xe);
> +	xe_device_declare_wedged(xe);
> +
> +	pci_disable_device(pdev);
> +}
> +
> +static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_state_t state)
> +{
> +	dev_err(&pdev->dev, "PCI error detected, state %d\n", state);
> +
We need to set recovery flag here right?
> +	switch (state) {
> +	case pci_channel_io_normal:
> +		return PCI_ERS_RESULT_CAN_RECOVER;
> +	case pci_channel_io_frozen:
> +		xe_pci_error_handling(pdev);
> +		return PCI_ERS_RESULT_NEED_RESET;
> +	case pci_channel_io_perm_failure:
> +		return PCI_ERS_RESULT_DISCONNECT;
> +	}
> +
> +	return PCI_ERS_RESULT_NEED_RESET;
Please make default case where we see "Unknown channel state" as dev_err 
and return PCI_ERS_RESULT_NEED_RESET.
> +}
> +
> +static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
> +{
> +	dev_err(&pdev->dev, "PCI mmio enabled\n");
> +
> +	return PCI_ERS_RESULT_NEED_RESET;
> +}
> +
> +static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
> +{
> +	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
Check xe is null or not? if null then return PCI_ERS_RESULT_DISCONNECT.
> +	dev_err(&pdev->dev, "PCI slot reset\n");
> +
> +	pci_restore_state(pdev);
> +
> +	if (pci_enable_device(pdev)) {
> +		dev_err(&pdev->dev,
> +			"Cannot re-enable PCI device after reset\n");
> +		return PCI_ERS_RESULT_DISCONNECT;
> +	}
> +
> +	/*
> +	 * Secondary Bus Reset wipes out all device memory
> +	 * requiring XE KMD to perform a device removal and reprobe.
> +	 */
> +	pdev->driver->remove(pdev);
> +	xe_device_clear_in_recovery(xe);
> +
> +	if (!pdev->driver->probe(pdev, ent))
> +		return PCI_ERS_RESULT_RECOVERED;
> +
> +	return PCI_ERS_RESULT_RECOVERED;
> +}
> +
> +static void xe_pci_error_resume(struct pci_dev *pdev)
> +{
> +	dev_info(&pdev->dev, "PCI error resume\n");

We need to clear recovery flag (if not already cleared), for normal 
operations.

Thanks

-/Mallesh

> +}
> +
> +const struct pci_error_handlers xe_pci_error_handlers = {
> +	.error_detected	= xe_pci_error_detected,
> +	.mmio_enabled	= xe_pci_error_mmio_enabled,
> +	.slot_reset	= xe_pci_error_slot_reset,
> +	.resume		= xe_pci_error_resume,
> +};
--------------aOnWJkQP01vmL8Jw4sOonuYQ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Riana,</p>
    <div class="moz-cite-prefix">On 22-01-2026 03:36 pm, Riana Tauro
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260122100613.3631582-12-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">Add error_detected, mmio_enabled, slot_reset and resume
recovery callbacks to handle PCIe Advanced Error Reporting
(AER) errors.

For fatal errors, the device is wedged and becomes
inaccessible. Return PCI_ERS_RESULT_SLOT_RESET from
error_detected to request a Secondary Bus Reset (SBR).

For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
error_detected to trigger the mmio_enabled callback. In this callback,
the device is queried to determine the error cause and attempt
recovery based on the error type.

Once the secondary bus reset(SBR) is completed the slot_reset callback
cleanly removes and reprobe the device to restore functionality.

Signed-off-by: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device.h       | 15 +++++
 drivers/gpu/drm/xe/xe_device_types.h |  3 +
 drivers/gpu/drm/xe/xe_pci.c          |  3 +
 drivers/gpu/drm/xe/xe_pci_error.c    | 85 ++++++++++++++++++++++++++++
 5 files changed, 107 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index f6650ec3ab42..5581f2180b5c 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -98,6 +98,7 @@ xe-y += xe_bb.o \
 	xe_page_reclaim.o \
 	xe_pat.o \
 	xe_pci.o \
+	xe_pci_error.o \
 	xe_pci_rebar.o \
 	xe_pcode.o \
 	xe_pm.o \
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 58d7d8b2fea3..81480248eeff 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -43,6 +43,21 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
 	return container_of(ttm, struct xe_device, ttm);
 }
 
+static inline bool xe_device_is_in_recovery(struct xe_device *xe)
+{
+	return atomic_read(&amp;xe-&gt;in_recovery);
+}
+
+static inline void xe_device_set_in_recovery(struct xe_device *xe)
+{
+	atomic_set(&amp;xe-&gt;in_recovery, 1);
+}
+
+static inline void xe_device_clear_in_recovery(struct xe_device *xe)
+{
+	 atomic_set(&amp;xe-&gt;in_recovery, 0);
+}
+
 struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent);
 int xe_device_probe_early(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 944f909a86ad..2d140463dc5e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -669,6 +669,9 @@ struct xe_device {
 		bool inconsistent_reset;
 	} wedged;
 
+	/** @in_recovery: Indicates if device is in recovery */
+	atomic_t in_recovery;
+
 	/** @bo_device: Struct to control async free of BOs */
 	struct xe_bo_dev {
 		/** @bo_device.async_free: Free worker */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index c92cc176f669..e1ee393b7461 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1255,6 +1255,8 @@ static const struct dev_pm_ops xe_pm_ops = {
 };
 #endif
 
+extern const struct pci_error_handlers xe_pci_error_handlers;
+
 static struct pci_driver xe_pci_driver = {
 	.name = DRIVER_NAME,
 	.id_table = pciidlist,
@@ -1262,6 +1264,7 @@ static struct pci_driver xe_pci_driver = {
 	.remove = xe_pci_remove,
 	.shutdown = xe_pci_shutdown,
 	.sriov_configure = xe_pci_sriov_configure,
+	.err_handler = &amp;xe_pci_error_handlers,
 #ifdef CONFIG_PM_SLEEP
 	.driver.pm = &amp;xe_pm_ops,
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
new file mode 100644
index 000000000000..a3cc01afa179
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+#include &lt;drm/drm_drv.h&gt;
+#include &lt;linux/pci.h&gt;
+
+#include &quot;xe_device.h&quot;
+#include &quot;xe_gt.h&quot;
+#include &quot;xe_pci.h&quot;
+#include &quot;xe_uc.h&quot;
+
+static void xe_pci_error_handling(struct pci_dev *pdev)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+
+	xe_device_set_in_recovery(xe);
+	xe_device_declare_wedged(xe);
+
+	pci_disable_device(pdev);
+}
+
+static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_state_t state)
+{
+	dev_err(&amp;pdev-&gt;dev, &quot;PCI error detected, state %d\n&quot;, state);
+</pre>
    </blockquote>
    We need to set recovery flag here right?
    <blockquote type="cite" cite="mid:20260122100613.3631582-12-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	switch (state) {
+	case pci_channel_io_normal:
+		return PCI_ERS_RESULT_CAN_RECOVER;
+	case pci_channel_io_frozen:
+		xe_pci_error_handling(pdev);
+		return PCI_ERS_RESULT_NEED_RESET;
+	case pci_channel_io_perm_failure:
+		return PCI_ERS_RESULT_DISCONNECT;
+	}
+
+	return PCI_ERS_RESULT_NEED_RESET;</pre>
    </blockquote>
    Please make default case where we see &quot;Unknown channel state&quot; as
    dev_err and return&nbsp;<span style="white-space: pre-wrap">PCI_ERS_RESULT_NEED_RESET</span>.
    <blockquote type="cite" cite="mid:20260122100613.3631582-12-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+}
+
+static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
+{
+	dev_err(&amp;pdev-&gt;dev, &quot;PCI mmio enabled\n&quot;);
+
+	return PCI_ERS_RESULT_NEED_RESET;
+}
+
+static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
+{
+	const struct pci_device_id *ent = pci_match_id(pdev-&gt;driver-&gt;id_table, pdev);
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+</pre>
    </blockquote>
    Check xe is null or not? if null then return&nbsp;<span style="white-space: pre-wrap">PCI_ERS_RESULT_DISCONNECT.</span>
    <blockquote type="cite" cite="mid:20260122100613.3631582-12-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	dev_err(&amp;pdev-&gt;dev, &quot;PCI slot reset\n&quot;);
+
+	pci_restore_state(pdev);
+
+	if (pci_enable_device(pdev)) {
+		dev_err(&amp;pdev-&gt;dev,
+			&quot;Cannot re-enable PCI device after reset\n&quot;);
+		return PCI_ERS_RESULT_DISCONNECT;
+	}
+
+	/*
+	 * Secondary Bus Reset wipes out all device memory
+	 * requiring XE KMD to perform a device removal and reprobe.
+	 */
+	pdev-&gt;driver-&gt;remove(pdev);
+	xe_device_clear_in_recovery(xe);
+
+	if (!pdev-&gt;driver-&gt;probe(pdev, ent))
+		return PCI_ERS_RESULT_RECOVERED;
+
+	return PCI_ERS_RESULT_RECOVERED;
+}
+
+static void xe_pci_error_resume(struct pci_dev *pdev)
+{
+	dev_info(&amp;pdev-&gt;dev, &quot;PCI error resume\n&quot;);</pre>
    </blockquote>
    <p>We need to clear recovery flag (if not already cleared), for
      normal operations.</p>
    <p>Thanks</p>
    <p>-/Mallesh</p>
    <blockquote type="cite" cite="mid:20260122100613.3631582-12-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+}
+
+const struct pci_error_handlers xe_pci_error_handlers = {
+	.error_detected	= xe_pci_error_detected,
+	.mmio_enabled	= xe_pci_error_mmio_enabled,
+	.slot_reset	= xe_pci_error_slot_reset,
+	.resume		= xe_pci_error_resume,
+};
</pre>
    </blockquote>
  </body>
</html>

--------------aOnWJkQP01vmL8Jw4sOonuYQ--
