Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A0AC02199
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 23:31:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BF510E00D;
	Fri,  7 Feb 2025 23:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hgafHkLJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C855A10E00D
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 23:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738971083; x=1770507083;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6AZKlHsPcQwnAg0h+s4bkZf9RGKECXUEGxSxXDMlKrY=;
 b=hgafHkLJpXHeQ94oCmCbcvORAxuboEB411sXLiwx6nXWE9ZMuZ+lBHXw
 8HFEZ4qOanrGYHQPdrpWoomnYekbH0rZw6392HQZy8DMXl2cME0Y22jB/
 E7bwWjK1XPfla+wPgkxEDoL9gYRgx+bIL0gQ9I4NcaWq/ZCGK96+CAo/1
 e96cD9YBhDXXex81VvU+imdZkFtBGhXkVaNErXP4jxCI9/PS1Rq5eUxxF
 ejCW7Z+ZYTFVZvG6nNs1S9m4P8tnazFd1X/D6UaACxMvJ05Y7zFGeBkyw
 lU9V16umABCddT5WiJtZf4xU8c9CTdbHtFzbSuXuPoVfXBxhdDnsJvxLL w==;
X-CSE-ConnectionGUID: C0xYvYYFSe6ZfNQNADGJ9g==
X-CSE-MsgGUID: d8pDBR9VTnyxdZueXMH2Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="43387408"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="43387408"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 15:31:22 -0800
X-CSE-ConnectionGUID: 9jGBKoKNTGKew2RonmXeYQ==
X-CSE-MsgGUID: zygZwPVHRmu0dQss/2bVyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115741370"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 15:31:22 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 15:31:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 15:31:21 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 15:31:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nEVZ520HmwjaqvBS3mVzDcYEaLKSqTh+nVq6yIjFx4WXz1/q5OXwkDlMAJT6qNwRjS1V0DRNKWU98AOUKoh0yJZpTuAaN9vhVMWs2fAzsC0oPUyi/YU1t+w2CNj64d6rCPKifthZAXLOCosPF40dVQKSGS1p7nvX1VoxjmYHz7w0RX4CrbFqcGRXd1uI1VqpVSofRhgkrujHTotYMYb2wF02KFrj7YRAIE0xa2Ziu+6bZd+Bf3K1EAj/8VDbYN0k24E2RUtJy1QZC/jCwMkCkfA8k8r2pfkKFCxF0dyq1w7AxVOFa+1qBlxOAQjMRTZweBVjv2Mcooh3tp3mt9P/jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5z3PVQfdFgjMX+sr+UqWYslbZkV3dl607cRjAUwS8SY=;
 b=TEuzNhDGIlriONN9kl3fuOCVCWtGEjs3e+5DLS9WlNkIV+c/t7bv0QK73ib2DblunwIVeJZLqBrlcKw6aukAXvPhpsbS8ZNkX2gv5NZAixUKr047jMVr20POmuYS7VLbt08QxoDDifJyIbPLwhfsgSGEB9uHlfr/fOqGSzWncVs+6nO9ScE7M1GU5JnVoW4Xw7WI4GFIO7vLmsp2WMCsF32orRF86DEUUaT7of/z6JXSCrZZu8dyhRoH0nQ3qZL5XMg3nmya6Yqnie82AusDq71aHS/I3u0xoRrX3OsSHv0llVT7X9R0QhBJvd5VUbtqzoypWiOyt3xjBVVE/WSrGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ2PR11MB7597.namprd11.prod.outlook.com (2603:10b6:a03:4c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 23:31:17 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8422.011; Fri, 7 Feb 2025
 23:31:17 +0000
Date: Fri, 7 Feb 2025 15:31:15 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <vinay.belgaumkar@intel.com>, <soham.purkait@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v5 5/8] drm/xe/xe_pmu: Acquire forcewake on event init
 for engine events
Message-ID: <Z6aXw52sdI+3KnyT@orsosgc001>
References: <20250206104358.3436519-1-riana.tauro@intel.com>
 <20250206104358.3436519-6-riana.tauro@intel.com>
 <ad580886-537b-4026-bc64-781efb182148@intel.com>
 <8ae02a6c-4459-43f6-8db9-95bb9a7cf898@intel.com>
 <71fed9a8-b8e2-4a38-bf2c-c328eb2d4673@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <71fed9a8-b8e2-4a38-bf2c-c328eb2d4673@intel.com>
X-ClientProxiedBy: MW2PR16CA0021.namprd16.prod.outlook.com (2603:10b6:907::34)
 To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ2PR11MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: aca939f0-8e3c-49ae-26f7-08dd47cf8509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3oydW9qSHRhT0k4a01KTEhXUnFzeHBKTVUvM0pWdDd5dWVZbkIyY3Fmb0FV?=
 =?utf-8?B?N1hEbjNyd1ExdHNrT2N2RUFoeWtUSkNZVUZPL1NXNEZtV29Ja2xodEhYZFZS?=
 =?utf-8?B?NC90WWpoOHREb0xTeXNqRTR5Si9Ma2krc3hGRHI1Vmc3T2RzbXpZRnVjNmNE?=
 =?utf-8?B?bXhWZG50M1FReFRmaWlSK2oxWEdHVjZjS2VkdDgvQ1BhMFNScll3dlJLeCtW?=
 =?utf-8?B?NTdNU3NtbklXSUMzd1NqWXArSGtLMzcyZGVLMWFoWncvbTVzRkhaQllTaXZ6?=
 =?utf-8?B?SzBQNjdrUDdUd2RwVUFWbGtOOWZpazBLN3BNQmNKb2FuRVA1c2F1V0JoSjll?=
 =?utf-8?B?V0V3SEdaenhlR1lvcFhwdU9XVUwvT2VPNDdJWjc4bmkvU09Wa3hyMHA1OVdC?=
 =?utf-8?B?dndhWmhTMHdtNVRkdkJwM1dFZXR1Y2FNVm1seEIzb2pCRUcvYWp1eXhvYmd2?=
 =?utf-8?B?Qm9yYjhOZFZ4bDRVZVJESVlqUW40YlZxYTB1WkgyUXNkeU11MDE5ak95SUNo?=
 =?utf-8?B?amdRNmhlOEJ0YUJ2M29DdnRLeXNqd1VKUENaMTZPQ3YxWWl3cHdTQmNTUFg2?=
 =?utf-8?B?ajUxNnJCK3pIN1lRdi9OUlhxTWtyMnc3ZWNmOWZFck5VNVQ5aFdONkQ0dnpW?=
 =?utf-8?B?YTNydFVpOTlzWU9xTC9NVkNTemZ3V1h2TkRTM01oTW5FWEFSK2d6YnRwYmp6?=
 =?utf-8?B?WGwxTGw2a0tLVUN3VW5DNEU4dTVjcnYzSDlTNDVJYnJOQUkyYmthTnFHZXBi?=
 =?utf-8?B?ZTI2eXFYL2lZdmxNUzR4bFViVHpjRDMwYzVuUUFRVERXQzdzR3ZzRzJDZnor?=
 =?utf-8?B?bko1VHptOVdXUi9YanNJMEFtWElSVEUvY3VMK01OdmlnWVJnbzQ4Wm45L01t?=
 =?utf-8?B?WklyTnVvUGx2MFNjU3JSK2xPdkNKdHpPb1owUW5pWkhjWTE1UENWcnBQK1lh?=
 =?utf-8?B?L0tUN3o1anozU256cEN0eS80Yk1keUxHSW1BTlByeHI0bU1sWGpQeVY0bjZv?=
 =?utf-8?B?M1VXOWFBUWNncGZkdC9oVDF2SGx0THB1WEE2K04vZ0NNb1pDRlplUldCVUNU?=
 =?utf-8?B?WU5RcytLK1MvZmVKbWpCVDdldnEzZTEwMnkycy93alNYRTZtWldmclpqQ0tv?=
 =?utf-8?B?bGU0dFIxVUdIaytQL0ZLb1psdnJ4TGdjM29iVDN2MTRtYkZhL0ZweUdQdllQ?=
 =?utf-8?B?aENOT1kxaVplVlpMZVZ0aHlGS1hGNGN4T3lDK01zRU12U1JzOWo5MFRhN2FV?=
 =?utf-8?B?ZEZxaDVsdFQrZmk1aHhKZERiSjg3Z2RPcWtldnc0SWMwT0hrVmhUR1IyWlFP?=
 =?utf-8?B?UTY5Vis4cm5HaWJNU0xFU3BJQ3UwU2FNd3dESUNWSjBrS01lYmd0cWxIbk9M?=
 =?utf-8?B?NUc3M3VRcCtYbVdwV3E3eUtWLzh1VDR3VDJNalVpcmM3QWgwSnlDQjhQMEpL?=
 =?utf-8?B?VHJndjdadk8vVTh5SFhXeExxRW1vYmJmZEZGbFZPYnNaOS9iVzV3RkNaVFhS?=
 =?utf-8?B?TnY2VFdSSjFLTzc1a2NaTU5IRlFzbWtTaGlJUENuTDc4NDB4VzA3aFZ6eFBu?=
 =?utf-8?B?WitjdjZWeUxuekxDeDBGbDdKZEVSRHJkM0M1NFY3dE9GaUhndmxOYmRzTFV6?=
 =?utf-8?B?MjBPSHZpUXR5cGJZUDJ5ZFhpRnJ6Y3ltejQzcmdiY2pRZC9PM3JxeGwxRDB2?=
 =?utf-8?B?a0xqcDJHTE9raGRtSk9pWkZJQnRIUTNZNERTYm5OMFNISFRxRVFIZmhtRVg3?=
 =?utf-8?B?Wmp4a21HU2VuR0ZpcFFGV0c3a0RucEx3UWl6MDlvZjd3dDhZeHE0WFpra1ZV?=
 =?utf-8?B?aHpaNE16bFdNV0JrTEVTVGJWaThodkRUb01pcTM3VjBYSlorYW1aSzhhcFNz?=
 =?utf-8?Q?6RoxHWpgHGKsy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXZOMzJQQnNqSklKb3d0UXpWKzMrc3NVdTlIeGs4MzJjbGpaV0tPS21FRlFS?=
 =?utf-8?B?ZkRCeEJqLy96Z3dJcHdpaHp5WDVkZlZLdXRvd3JHeFladDNaa2ZQSHBWMEVH?=
 =?utf-8?B?b2Q3ckNVek1GY1pFRWpLVDB2U0lxVkJVRFIvYyswRkJzZlpOSFNVaEZGODVa?=
 =?utf-8?B?cDZzd2lFRnd4L2hwS2J1ZEk3NmJCVElRMkcya2VUaGdnMkQ1bHlESWVsdnJi?=
 =?utf-8?B?L0YvZlBLOXlVcm1DTThpd3FzWkJmVFVSZ1VhaExjSnExZDRCNG1mclprMjJj?=
 =?utf-8?B?Z2xFcmYvS1VmVUNaeDFHZ1Zmc1BTYlFHSEkyMlNsVEdia1NIYVZVamlVNWR2?=
 =?utf-8?B?SG1sV0NPcjVRMFUrZHR4SEE5aUtEaHloKytJNkFwMTRpRm1mVjMyd2x2NGNQ?=
 =?utf-8?B?KzZIak1LZDRlQlh0VkNONk4wZ2NjWXdZRzFsQXdDcVUwdlcyZXg2NVJCSFNJ?=
 =?utf-8?B?RDJtNlozZlZhTHV5SHJhKzlGMEZDL1ZORnFCSTJUWWZZM09MdjRyUStUcjhr?=
 =?utf-8?B?NDRVL1hIQjRML3FCbzMyWmd0bStoZ1ZWcFFrakIyck45MlM4MVdXNUphVjhu?=
 =?utf-8?B?TGwzUjRnQXh2Nksxc1Arei9XNGE3SElVR0I1WFVWYThwOWI3M203Q1dMUUJM?=
 =?utf-8?B?NVRCU1pqWW1ocHh2SUxOQU9DczdxaTNKUVBtOVBJbEFuMCtYaEdXM3R3UzNG?=
 =?utf-8?B?RlNHY0hSM3E0YlQ3YXZ1OEYxR0Y1U1J3WGhZdlE0cXUwWUlsc01hTm5XOGpV?=
 =?utf-8?B?NzNVSUEwd1FwSkYrYTF3eVdjUlo5Y2JKTGJVS1hEYTlBRit3d1d5NnV1Mk9v?=
 =?utf-8?B?dzdIcW1lQ0dkRE1wMkNZWk8wcXA0N1lxbVVXK0UzRGJHS2UwbzBpWmVSSnB0?=
 =?utf-8?B?SDlEL0JTd0ZVVTM4WTh3SnNEMVR6UWE2a0hBcWhlQkdCak04ajNTSjlhazJ4?=
 =?utf-8?B?WmUwSUVrbjM2d0NuZ0pGYVlBVjAvOThqQ0ZqMlVNTDMyTTZTU2Y3V0dOOHpL?=
 =?utf-8?B?dEZRdzhLZ1ltS0MyWlFkK1FmWEQxRE9TbmpOQWxKVlo3Y25sR0JVakpBWlBG?=
 =?utf-8?B?Z2lZM0sxMXgra25QZXVnOWlhQjNKZGMxNDQ4VGRlL1NheUJKM3FyTU93MlJt?=
 =?utf-8?B?aU9PM1dCeWIzZlR0d09zUFpEQW4wUkJVL1BQTTM3SHhxakFVMXNKMFBrRWxS?=
 =?utf-8?B?WkV5WVk2c1M1U2l4NWl0bnU4ejlhdVQ1Y1lEd1orNUZLMGladU5ydHkrcVJa?=
 =?utf-8?B?S1JmRWJ1NVB3aFFOWXR3RjY4Y3ZlSE93SkxjS3FObnNhZUpLdFNpZDAxdmxu?=
 =?utf-8?B?ZlJUd3VaZzBSRVU1MzRyRXRtWVFISktQVlNNZGp0Q2IzVE40WGdRaFZZTUpm?=
 =?utf-8?B?WVhlbEI2ZnM4M0UrR3hnbm5BbCtmRXJ6eUNhNHpkcXFPZ1pWZkxZT1VNWTdx?=
 =?utf-8?B?eDBudE1WeDFsSXlRWTRnelA4azdvKzZEUEJYY1l2TWZRWDdxa1U0QktZQ3ln?=
 =?utf-8?B?b3NNM3RENFRmbE1iaU8xQUx6N2ROcENQTzF1L09xMTlpQXpvcWV4ZGZnbjUx?=
 =?utf-8?B?enhQaURrZ0dERHhVQlJvelhBOFdEOElpdkVOaThSMVdrT3BldTlmYXNSOGpv?=
 =?utf-8?B?Z3Z3QmcwYVpWeTVIMHhXMGZ5Y3BzbFdiR2tDb3RYaHowZWFsMVRoMVYxQzRM?=
 =?utf-8?B?RmxWbUt0Ym11VGVuelBPamdNSWlUS3ZJZU9rclk4bjFwOUJwUzJOcjZtdUox?=
 =?utf-8?B?NzQ0Rmh5eDVUQ0VjNFB2VUQ5Si9WUmF6ZmhSR0VVemJIRWJxSmRnWWpjb0M3?=
 =?utf-8?B?NGQrQTh1UkdidHNOZVd0ZXJTU3RjanptTDRsakpUTUZiZm5sYXJtQlpDWGFR?=
 =?utf-8?B?ZzFXR0djNm9YcFl0K3YwNnhjMS9uUlNlY2ZlUk5maHE1YzRoUTJ6dHVzOXZ3?=
 =?utf-8?B?R3JXTEVnQ2FDY1QrQUdKYVlhdVFmOUpSWHNuNzdrNkp1WGlQQnRnaFQ5ZFJ1?=
 =?utf-8?B?bysvVHVSbTdUY1o4YzlxRnZQVExyYldhc1BubzFQVFBlVkVQUnVya0lBWU83?=
 =?utf-8?B?NEE5Znp6S3JYQTAyRjVQNU5DK3V3MGNidmdZUVVqQStBT25JZENmMXBSTk0v?=
 =?utf-8?B?OVFlMnZaak42TDlPaEtkYXNVL1VKdkREZHdtN0hzWUx6L2VIU1FTbUZKanlu?=
 =?utf-8?Q?2fCc8hiXNZEySZGQT8za238=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aca939f0-8e3c-49ae-26f7-08dd47cf8509
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 23:31:17.4043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EiZsLjMxi+AaIcRLOHj7esTeuE9/qtRWPqzWoZeDhnzH0a8rhWzdm695uMi+2WHfGdlZ+xg3GsnnQ9X7iF1eeFj8DSB/PqB3hICkapQH41o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7597
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

On Fri, Feb 07, 2025 at 12:21:24PM +0530, Ghimiray, Himal Prasad wrote:
>
>
>On 07-02-2025 11:48, Riana Tauro wrote:
>>
>>Hi Himal
>>
>>On 2/7/2025 8:39 AM, Ghimiray, Himal Prasad wrote:
>>>
>>>
>>>On 06-02-2025 16:13, Riana Tauro wrote:
>>>>When the engine events are created, acquire GT forcewake to read gpm
>>>>timestamp required for the events and release on event destroy. This
>>>>cannot be done during read due to the raw spinlock held my pmu.
>>>>
>>>>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>>---
>>>>  drivers/gpu/drm/xe/xe_pmu.c       | 47 +++++++++++++++++++++++++++++--
>>>>  drivers/gpu/drm/xe/xe_pmu_types.h |  8 ++++++
>>>>  2 files changed, 53 insertions(+), 2 deletions(-)
>>>>
>>>>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>>>index 06a1c72a3838..5b5fe4424aba 100644
>>>>--- a/drivers/gpu/drm/xe/xe_pmu.c
>>>>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>>>>@@ -7,6 +7,7 @@
>>>>  #include <linux/device.h>
>>>>  #include "xe_device.h"
>>>>+#include "xe_force_wake.h"
>>>>  #include "xe_gt_idle.h"
>>>>  #include "xe_guc_engine_activity.h"
>>>>  #include "xe_hw_engine.h"
>>>>@@ -102,6 +103,36 @@ static struct xe_hw_engine 
>>>>*event_to_hwe(struct perf_event *event)
>>>>      return hwe;
>>>>  }
>>>>+static bool is_engine_event(u64 config)
>>>>+{
>>>>+    unsigned int event_id = config_to_event_id(config);
>>>>+
>>>>+    return (event_id == XE_PMU_EVENT_ENGINE_TOTAL_TICKS ||
>>>>+        event_id == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>>>>+}
>>>>+
>>>>+static void event_gt_forcewake(struct perf_event *event)
>>>>+{
>>>>+    struct xe_device *xe = container_of(event->pmu, 
>>>>typeof(*xe), pmu.base);
>>>>+    u64 config = event->attr.config;
>>>>+    struct xe_pmu *pmu = &xe->pmu;
>>>>+    struct xe_gt *gt;
>>>>+    unsigned int fw_ref;
>>>>+
>>>>+    gt = xe_device_get_gt(xe, config_to_gt_id(config));
>>>>+    if (!gt || !is_engine_event(config))
>>>>+        return;
>>>>+
>>>>+    fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>+    if (!fw_ref)
>>>>+        return;
>>>>+
>>>>+    if (!pmu->fw_ref)
>>>>+        pmu->fw_ref = fw_ref;
>>>>+
>>>>+    pmu->fw_count++;
>>>>+}
>>>>+
>>>>  static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
>>>>                  unsigned int id)
>>>>  {
>>>>@@ -144,6 +175,13 @@ static bool event_param_valid(struct 
>>>>perf_event *event)
>>>>  static void xe_pmu_event_destroy(struct perf_event *event)
>>>>  {
>>>>      struct xe_device *xe = container_of(event->pmu, 
>>>>typeof(*xe), pmu.base);
>>>>+    struct xe_pmu *pmu = &xe->pmu;
>>>>+    struct xe_gt *gt;
>>>>+
>>>>+    if (pmu->fw_count--) {
>>>>+        gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
>>>>+        xe_force_wake_put(gt_to_fw(gt), pmu->fw_ref);
>>>>+    }
>>>
>>>
>>>Considering that fw->lock will be acquired and released multiple 
>>>times during the put operation, this might create an overhead.
>>>
>>>How about implementing a _put function that can take the number of 
>>>refcounts to decrement as an input parameter, similar to 
>>>xe_force_wake_put_many?
>>Could you give more details on your suggestion? Would put_many just 
>>decrement the count? But wouldn't that still require a lock? 
>>Multiple event_destroys can call the function at the same time 
>>right?
>
>I was thinking about putting all refcounts at the end of last event 
>destroy in case of multiple pmu's.
>
>>
>>
>>One thing that can be done is to take forcewake on first count and 
>>release it when the last event is destroyed in cases of multiple
>>pmu being used

Unless there is a measured inefficiency, I would recommend not 
refcounting this in PMU. If a forcewake is already taken, the code in 
forcewake_get is just handling increments and not really accessing MMIO, 
so we should be okay here.

Also, pmu->fw_count is not required, since the force_wake_get logic 
should be already handling that. We should just call get and put and 
this should be good enough.

Thanks,
Umesh

>
>This sounds even better.
>
>>>
>>>If the overhead has already been considered and found to be 
>>>acceptable, I am fine with avoiding unnecessary modifications to 
>>>this patch.
>>This is the first rev for this patch. Open to suggestions
>>
>>Background for this patch: force_wake is needed to read the timestamp
>>register required for engine events.Cannot take it while reading the 
>>register from pmu_read due to a lockdep splat 
>>(PROVE_RAW_LOCK_NESTING).
>>
>>The suggestion was to take forcewake throughout the duration of 
>>event being read
>>
>>Thanks
>>Riana
>>>
>>>
>>>>      drm_WARN_ON(&xe->drm, event->parent);
>>>>      xe_pm_runtime_put(xe);
>>>>@@ -183,18 +221,23 @@ static int xe_pmu_event_init(struct 
>>>>perf_event *event)
>>>>      if (!event->parent) {
>>>>          drm_dev_get(&xe->drm);
>>>>          xe_pm_runtime_get(xe);
>>>>+        event_gt_forcewake(event);
>>>>          event->destroy = xe_pmu_event_destroy;
>>>>      }
>>>>      return 0;
>>>>  }
>>>>-static u64 read_engine_events(struct perf_event *event)
>>>>+static u64 read_engine_events(struct perf_event *event, u64 prev)
>>>>  {
>>>>      struct xe_device *xe = container_of(event->pmu, 
>>>>typeof(*xe), pmu.base);
>>>>+    struct xe_pmu *pmu = &xe->pmu;
>>>>      struct xe_hw_engine *hwe;
>>>>      u64 val = 0;
>>>>+    if (!pmu->fw_count)
>>>>+        return prev;
>>>>+
>>>>      hwe = event_to_hwe(event);
>>>>      if (!hwe)
>>>>          drm_warn(&xe->drm, "unknown pmu engine\n");
>>>>@@ -218,7 +261,7 @@ static u64 __xe_pmu_event_read(struct 
>>>>perf_event *event, u64 prev)
>>>>          return xe_gt_idle_residency_msec(&gt->gtidle);
>>>>      case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>>>>      case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>>>>-        return read_engine_events(event);
>>>>+        return read_engine_events(event, prev);
>>>>      }
>>>>      return 0;
>>>>diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h 
>>>>b/drivers/gpu/drm/xe/ xe_pmu_types.h
>>>>index f5ba4d56622c..134b3400b19c 100644
>>>>--- a/drivers/gpu/drm/xe/xe_pmu_types.h
>>>>+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>>>>@@ -30,6 +30,14 @@ struct xe_pmu {
>>>>       * @name: Name as registered with perf core.
>>>>       */
>>>>      const char *name;
>>>>+    /**
>>>>+     * @fw_ref: force_wake ref
>>>>+     */
>>>>+    unsigned int fw_ref;
>>>>+    /**
>>>>+     * @fw_count: force_wake count
>>>>+     */
>>>>+    unsigned int fw_count;
>>>>      /**
>>>>       * @supported_events: Bitmap of supported events, indexed 
>>>>by event id
>>>>       */
>>>
>>
>
