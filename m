Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32060C36002
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 16:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC84610E186;
	Fri, 21 Mar 2025 16:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BiFI2MfE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303CB10E17C
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Mar 2025 16:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742575080; x=1774111080;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2Qf+3K+vlwAjzEVU9T40uU91eG2KYZXrwu4q0la4Fnk=;
 b=BiFI2MfEHBFYRDS2f7raFSbfuFIARCgOv1QpnpksteyZiIv8NkpKQ9HL
 0chCGHK5JF2X/A+Lnh2/OblRM7FUygUAaaK8cmPA4t2GbjqkAqo3y7+c8
 wxo9qSiYjn7RtzhX/YkwdjAsu1DsWthRXo42Ap3R/r0PA1/nZ5Bh8l963
 eA6kyNtGZvdU4dhPsgFGH9Pc//MzoD1SEGVhLDg7MSG2cOL5IUX8xpBKr
 d4u0N6av1awndnZLcxsNPmfqtPJb+5spYkSKgK6cROE/TrLlHgXDfaohA
 uYw40QVqopnrwXhzc7pmLLMrkVr25QRxClkxWlF4l4o+za4B+izVbbpqW w==;
X-CSE-ConnectionGUID: mR1I9boMQVuxoHAyFXmQbQ==
X-CSE-MsgGUID: KSIX5PCRQo6ebXWsda2JoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43726054"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="43726054"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 09:37:59 -0700
X-CSE-ConnectionGUID: cm59Ti8XRZ2YycJY+xdhJg==
X-CSE-MsgGUID: KBLUMVK9QyuNTRD0t6hM5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="128665940"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2025 09:37:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 21 Mar 2025 09:37:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Mar 2025 09:37:58 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Mar 2025 09:37:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wqz2D0b7hMCUK21ysXDkAfIaDw7kPy6mWhtxl5TiOZiq6bifzBDEs6PpMiqH0Pi0zQEXeagF8L2ZkS8HOuO+HJqYZ1U/s9vt/2RE13buUErgrLox4Og7MI5w/FWSx67OijXuwL3xbfX60UKEM37fU0vweNA1Le+M+/Qht0xLq1nLdptWYAX4zq8N4ppP+/gz6zCQqbntHjN7A9KFQGxO/Skj36Pq2IRP2BBiSgFkKHvkTZ3G0acRDLximkfFri1QyUOpZNv9u4aK3J6mZbyjzavQekMSObMqiCsUxTnPXKto8xiCFffwp4j0rT/C66qDyrSSZ9gjARzYKsKW0nTORA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hrT6i2obsMM3MlkpnK92HfhwzrVw7/Mp2a9YoSSag8w=;
 b=GMFrh3fDGIiR2vWzZ04v2f5PaGXGwsf1lOTS+l9lkiNd2+WkCL2sdbOMvb1+AkM+w2vKxF4ps+uz2iZb7nTf/pQceKEnHQE3VwExIb6Qjdm5NSDIz5y27WFwnvT90gaYPm5lG41NaTKeBeyvWiIyaV0G6NoGF0kk/IHVWB4p9L0shX28L26BWkfzwyh+GSsRkyC3uQ8SrcpuZ32iahuTGLTPz0vrXN6oehpD9+ieNTGlvKSu++Obpo6QsDv/MBh6nW7uqZeRmoKTrWZWseoCzgKaOPm4864evkFmFRlNQXs5sQo4hlIqN0txAGNjiRYjvwlnFyxF5xHHG74cb4C9Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA1PR11MB6417.namprd11.prod.outlook.com (2603:10b6:208:3ab::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Fri, 21 Mar
 2025 16:37:41 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%7]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 16:37:41 +0000
Date: Fri, 21 Mar 2025 11:37:37 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/guc: Refactor GuC debugfs initialization
Message-ID: <mtoba6bcnbpdmz7gw4ttxcqq3ghrqz4ije5vv54nehhvoywdwt@wpw4ulvjrsps>
References: <20250320210738.1733-1-michal.wajdeczko@intel.com>
 <20250320210738.1733-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250320210738.1733-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0037.namprd04.prod.outlook.com
 (2603:10b6:303:6a::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA1PR11MB6417:EE_
X-MS-Office365-Filtering-Correlation-Id: c73e9c97-f63a-4375-3a2f-08dd6896b2b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b21WRFlYZjNhZHB2dTAycWFSblhLbnhZaTBmRFcwczFJcUVmcEw3UUIydGlz?=
 =?utf-8?B?RjNReE1FbEdWMlJ6QXlLZENUTEx4V0dkdktiSGxDcU1sVG0rT2VsbnlQSE5i?=
 =?utf-8?B?ZlNDTUlKQVJncU1rKzFqTnc3dWVUK01zeE5NYUM4UE9HS2ZPenR6NjgxZ0lI?=
 =?utf-8?B?eHJoai9KSE9jbi81VlM5SUExSVVEelFQQzdWOXBkbVZUOHIvaGNmSUlxS3BI?=
 =?utf-8?B?Sy9YekxLamVHenBoOHE1bXkrcVllR1FyZTNIc0JPT0thcnVHMlRlSW93WUpp?=
 =?utf-8?B?akxPN0tPdThFQitNNCtBOVN1TlBmeFAyTzN1aVMxNHF6K1pNZWZjOHJyUnYy?=
 =?utf-8?B?UWNRajBqSkViMU5sSWxDY1o3S3NoTGtXem1TSWl4N1hxa2ZndjVzbTdoU0hj?=
 =?utf-8?B?aGIzMWdtUUl4Q0gvSmdNU0NVQytxNmJTckFCS0hOYno1NlEzcVZETmhWYkJp?=
 =?utf-8?B?c05KQ1VKbGV2QzVqTDdRdExpNVFJYjZFa1R4b0owZzVSZnlRNWt0Y0pKTi9n?=
 =?utf-8?B?bk1rNk56VnhSd0E0MFlGU2hhUWJRK253dXg1YU51aTEvRzBUZENqNUZia3V6?=
 =?utf-8?B?aGVKMmdyM2RGdkhrYnNpNVpDS2hlMUZBVFgxTUVZU0d2RE9qQU9yKzJBYTg3?=
 =?utf-8?B?RytXdkhzaU1FWWZLTWdGaU9EaG1zZXRwc0R5YmRqZ1gxR1BoMHlZTzR5MW9x?=
 =?utf-8?B?eXJ0MFU1ZEVUdnpveGRXUDE1b2QwVnJ6U3Ezc1JQS3ZhWkN3Ujlmdk5XaXJq?=
 =?utf-8?B?U2x1NVlPOG9OejBqaFd1ODJZa2ZtdW5pd3lKa3c3UmVXWllHZUhPU0JhS0NZ?=
 =?utf-8?B?dENSaGxVcGo5c1F6dlk5bTdCYjR0VkEwTWI3YWVSTGpqQkozbTRwanFKOVc3?=
 =?utf-8?B?aFZtdkEzczZ4aktTMHM3VEhJOEE3MVMxSEx4bCtRS2pPYXpFUTVqY3NIVUZU?=
 =?utf-8?B?QkpBVjc0S0tSWG5xWUxoVkRMQ0VlTWRWbFQyUEVpSHo1aTkvSjFzNkVBSXk5?=
 =?utf-8?B?YVp6Rm0vYzA1K0VJVi8vVDNjUVF0S0xDN1hzL2I3eGxZaVFEeEx5NFQyQkQr?=
 =?utf-8?B?eGR3ZVNCVDQzcW5sTHp3bXVJR3pBOFc4MWREcG5wWStPZUpoK0k0dGhjeTlX?=
 =?utf-8?B?S0dqRW5MeDhxWE0xb0lpV01kU2kzZ0JsOUdFVXNMejA0bGcxTUd0bnd1d0R4?=
 =?utf-8?B?WjdyMUZRY3crV3hBcTlJNjg3bFhYN3EyNW9GdXl6dHJZUHVhM3lSeGVVbGIr?=
 =?utf-8?B?RlFVUWE3a296M3d6UCtJOW41Z1JMNEUwaDBOMzJlUGt6SDViVWRKWDJydnVM?=
 =?utf-8?B?anI0TUZxbjB3cE41SlcyM20rdHpVblppdDE0bC84Qy83dE9abzVjaVljeGdi?=
 =?utf-8?B?NVp5YnI0MEpkeTVsVWpQL2h3aW1WYVdmTGw5YVVjakY3Tnd3NXRDUjZwVGRZ?=
 =?utf-8?B?QWlkL3drYUFGUXFVdnVJZnVwbXloWEh3cmVvNWozbzBPaXh2M2c5VStocS9Z?=
 =?utf-8?B?UkVwcnU3NUFWc1YyK2p2cDAyTTlTZUFhNUYwd3VYRytlYVg2dG5oeXc4Y0NQ?=
 =?utf-8?B?Y3hpTEs3c0hSMHRsaitMdndDY1BRNjhMSFlJNFVQOXFEUk11WUtZMFZGSE5k?=
 =?utf-8?B?SUEwa3ZpZXJ5d2RYcnFvUDVTeVVQNEdqYTFPT2VPblpRRWoybDlSOGZLZGpZ?=
 =?utf-8?B?VkVHZzdqUjUzT0k3Tkc0aXNFNzFjY0JBZldDY1AycjlsU3RsWEpQMW5GZnlu?=
 =?utf-8?B?eC8vQXlKa3NlZmJ5aldHREJ5Tzdydm83UUVTWk9seTM1Rm5DN0NYV3F0Z0xE?=
 =?utf-8?B?RDB2QmtMQXM3blQ0VTBUdEZxV0NZcU43NVh1RWR6VGFUMzlxRTM3NnQrUlZ4?=
 =?utf-8?Q?4x1Y41fDR39kj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0ttalY3eC93c0tYdUptU2l4bUxUTTNDRTdMUHFXWXRqOEpmTyt4bGZMOWdl?=
 =?utf-8?B?R0svaFplcnJrV0pvd05BMFZ2UmZSRmJtb3MwQVNwWEd0dlhhL0ZxVlhWditR?=
 =?utf-8?B?MjJwajJmU0dabWFOWUJZN2Zkb09qOVJtVTUxblEwdHhKVHpGOEtJTjNKU2tQ?=
 =?utf-8?B?NXl6K2NrUDk5dmdFQTJVYzdtMmFhTnF4SW9Sd3FZU3RiMEF5UkpwR2VuWDlH?=
 =?utf-8?B?MyttaEh3bzZ1K0Jwb1dLUWFDbHdwcVNCTGNmS0Fma2g3RFQ3a0NIZ013UG4w?=
 =?utf-8?B?cGg4T0VnWW5jV0gwd1BqRDNmQjRSNVgxREIveVd0eHJSNHdnaVFseGxzM2pW?=
 =?utf-8?B?SVRzWTZVMnJDRTZOTUtOaEdwSDJJUXA2bGNWZGg1VzBJZktaRzVCdUhQWUJ2?=
 =?utf-8?B?cE9jRnh4aUlDbkQrU3NzUjBab09iRjdGZnJId0V2blNQQ0l3V0RCUVNLZEkz?=
 =?utf-8?B?U2xvOXRqK2Y5Mzg4Z1J5ZTI1bXFSYnVvN2JJYWYwdEVycDBzNnAyQUZXK2tV?=
 =?utf-8?B?RVdNaWZ4ekkrV0Y2c29zaVdza054RDhWQTNKNllvMVI5ZDBoQVBseGczSU1X?=
 =?utf-8?B?dHNyekNtUmxmUE4xVHQwYjV1ZEFFa3ZYVEphMDdDdUg3elh3WG5KSkhjcW5D?=
 =?utf-8?B?R05PWXo4WTZZUFY3ZkNwb1RjRnF4aE1MbUVnYThkRUpPQTk4OXRWWVNXY2JD?=
 =?utf-8?B?VWY2dTFpVHd4UXZScGk2cUMzTmNZaGVDK3lVczd1ZWdKUVFQM01vSDljbFVN?=
 =?utf-8?B?aGFpZzRmVW9idzQxZVpGMTJEeWd3L3NNSzNGb2Y3TUxXbEo1QlVIbFJJbUZO?=
 =?utf-8?B?dk1HdW5MN3l6bVpEb2tYVnE3MStOT1U0cEVsdTRrb1BXb3NWTmJZU2lkZVZy?=
 =?utf-8?B?eFdkZzdobDg4NU9IQXhjb3Y4eThBQ2JEaHZaUmhwSk9oQmt0SURNZDRMazB1?=
 =?utf-8?B?YllKS3pEQnJjbUpUdXRqd0ZacWY4VXEwTVBKNUk5bVJQZ3ZGTEtJMTFac1Vx?=
 =?utf-8?B?OFE0SkJSUkFxTVBWZ3hxVUhDUzRucEZ3blJlVTJ5N1B5SStzU1dYdy82bzQy?=
 =?utf-8?B?bTNGb3gybDhqSHFHa3A2RlNhWTZMYWxSb051Y3NlM2RGdW1EK2pxMExIa1ly?=
 =?utf-8?B?YWd5NHg2YkRTTCtlYnBmU3VKeGdYcmI3eUNrT1dXUE9jNlR6MlJHbGFwL293?=
 =?utf-8?B?UFZEZHVPSHlWclNZZ2FEaHZ3QjY0WU83MGJoN05GcVZMQVFjR0pHcGdCNW92?=
 =?utf-8?B?TjU3LzhjV3hXNlRhcVdSK2c3c2pFOE84eTFoTlIyMjJ4UE9QL3RNU3JONllU?=
 =?utf-8?B?aHMzUFluZUJCc1l5THZMcHpRdVR5cVJ2Z3NTdEF1VFZmakpSdWVJekJqWDVO?=
 =?utf-8?B?MGRVLys0WUpzanh6cEk2N3h6dGlIVW9IZXlOMDJaTmxnSEhZRm1YME1uZnYv?=
 =?utf-8?B?UzFxSVVnSE0wa0Z0Um5CV0EyVk90UEJUWW1UZjExd3hJeFZIMHE2UWdTQ2pI?=
 =?utf-8?B?RTNPTk94M3FhUlQwS0ZFSVZkazFhdXRoUlVDTXh4U3B0R2VqUXRHVis1aGxV?=
 =?utf-8?B?NjE4Tm0rUXVKZjZUYllzZUhTK1ovKy9yTldXbGEyODRjTXQzcHhjNHJmQ3N6?=
 =?utf-8?B?VXJubWd2QmtUbjlVbi9sVksxSUcrRVFFRWxSejd0UVh5MGVPTm8wR2RlcVFU?=
 =?utf-8?B?VVcyYWpoYTJvZ2NZcmdwTE1pQjV1VnZOemhiSXpNd1lhZmpKZXluTjVtV1Vw?=
 =?utf-8?B?cnEyYTVYcTN1T1lXZko2WUc0NXRqZFJCbWF5ZUFMQURXckxoYnh4UnUyNXpM?=
 =?utf-8?B?STVYWUxrZkZLa0dzd2JhZGxjNVlsWk9DZEdrNmdyeUQyQTA4UnhIRGg0Ujkw?=
 =?utf-8?B?VkN5LzZRU3RBWFhCZHhvbHAwa08vY0Y1ZFhaOWxHRmhrQytVQ1ZKQmRMU0Vv?=
 =?utf-8?B?MmhGZ0swTTIwRTJlRjRUTWU3YUxYeWE1V1VhdHErWVFib1hFNm5PYjJrK0J6?=
 =?utf-8?B?UkNIMjBmNmE5UTJ0d3FmVGZHSW9BUTBEODhzZmFQU0JUeTRaV1lML2lHZCtO?=
 =?utf-8?B?bktuZmVBUE9ocGdBMDNGQ1NQWU5XckRZTVZFV283YXJvc3VHdEZwcjZJZG5t?=
 =?utf-8?B?Z2VEL24vYmlqYlJHcU1ZR0MzbEpGMk1hd29vdmVTcVRhRGt6elFPYi9ZRVdV?=
 =?utf-8?B?VGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c73e9c97-f63a-4375-3a2f-08dd6896b2b1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 16:37:41.1143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XuAWIQL8eu1UX+vTVR1wV8j3qNIg4M00VZvm1wfA7xXIZM1fV9UNb+cBkuUfF8RequRg9bL8/mTot5EP/hdEf/WrA4EtJvAudvtl2muNgA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6417
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

On Thu, Mar 20, 2025 at 10:07:36PM +0100, Michal Wajdeczko wrote:
>We don't have to drmm_kmalloc() local copy of debugfs_list to
>write there our pointer to the struct xe_guc as we can extract
>pointer to the struct xe_gt from the grandparent debugfs entry,
>in similar way to what we did for GT debugfs files.

Please add something like this here:

No change in file/directory structure, just refactor how they are
created and used.

>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_debugfs.c | 94 ++++++++++-------------------
> 1 file changed, 31 insertions(+), 63 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
>index c569ff456e74..d59408ef0b9d 100644
>--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
>@@ -17,101 +17,69 @@
> #include "xe_macros.h"
> #include "xe_pm.h"
>
>-static struct xe_guc *node_to_guc(struct drm_info_node *node)
>+/*
>+ *      /sys/kernel/debug/dri/0/
>+ *      ├── gt0
>+ *      │   ├── uc
>+ *      │   │   ├── guc_info
>+ *      │   │   ├── guc_...
>+ */
>+
>+static int guc_debugfs_show(struct seq_file *m, void *data)
> {
>-	return node->info_ent->data;
>-}
>-
>-static int guc_info(struct seq_file *m, void *data)
>-{
>-	struct xe_guc *guc = node_to_guc(m->private);
>-	struct xe_device *xe = guc_to_xe(guc);
> 	struct drm_printer p = drm_seq_file_printer(m);
>+	struct drm_info_node *node = m->private;
>+	struct dentry *parent = node->dent->d_parent;
>+	struct dentry *grandparent = parent->d_parent;
>+	struct xe_gt *gt = grandparent->d_inode->i_private;
>+	struct xe_device *xe = gt_to_xe(gt);
>+	int (*print)(struct xe_guc *, struct drm_printer *) = node->info_ent->data;

I was a bit nervous when that was done  for gt. As I am for guc.
There are several type assumptions here. Like is done for
xe_gt_debugfs_simple_show, please add documentation, even if not
kernel-doc.

Other than those comments,  Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
