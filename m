Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF837CAC5A7
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 15:21:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DB110E96B;
	Thu, 25 Sep 2025 15:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Amtnj5Cj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2B910E96B
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 15:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758813672; x=1790349672;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+/+2TLuouxzF4AUq2tjMkGK87E7zO0Puxnlr5VS04RI=;
 b=Amtnj5CjMkwh702enBHZXSRUfdglwRhUJ+24DIqCzShsW3OXA8j60k7T
 D5cb1GXYwZepXn+1KYtTBa8lZLn/G6/DOCN0B8oqlwyZ/O8PfiSKeTqmy
 PYHKYoRf3uEut9FLIrvwKtI0DMHimff2QEqG0PfdFLyk3adKte2UZ8AQI
 LXDKRvaRDfjUxZmFz8NHW3rsmhjtmiJWoha2TdJHoL1l9CPDcN1MvjcxF
 9wVsqJOBhm1R0adsuO2c3O48C9CmpZNR4zYZ3M3bIBm056a0hUrvhMqGs
 GZu/di/nIX+yAowKbacEera6VEY0f/x7z8My3p9i+viYZYd+fqTbOvz4C g==;
X-CSE-ConnectionGUID: EPjfIq33RNGAw0NKUTujkw==
X-CSE-MsgGUID: GNMt05oAQGqM2I4zzUjbvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="64980646"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="64980646"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 08:21:09 -0700
X-CSE-ConnectionGUID: lyBKnY+WTYC+N8AoVKBPaA==
X-CSE-MsgGUID: /u6+ZXUMSEiWmrLwgNiUaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="176973165"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 08:21:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 08:21:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 08:21:07 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.56)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 08:21:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQgyJx1Zc5m4vfV+24J0zKqXozIHLKgk0l5moiSuaK2dqw3l/7KJb1a/77AjNuHPGjKvcFx601OefJF9pQUdBPrB731NObQsl3KFnUOO/PV1trGZdPTJRZRthHiUThubZcf1reZPE1S6SuVzW0UAu511+5MQ5+YCDpxdHZbKB9EZCQLB/WMPA6YyL6m0/AkuOV5mLN9TXs2uI3UPY8jgKtucGktIX/cm5Q0iQaV9kRgRaWCRxFIlhQ2cmJbhKW+cRkIxQ5TZ5xEb+v18rUxEtxECM7POF1jASrEmpOrVOk0YRsQdoXgPfNWuM7nKuR4t3B6OQ2Om/xdF9/73QCEjHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkCwdX37i8Mn86YuxiFqMHRS0NpP0tCwaF4fqCMlLco=;
 b=bAc5YBzTLZMtxHq3mRCcj3ZzwjabtDw/6dM1uKI+/QYqZcLzdxwdxJWV4yVfdbb9XmHaRTHay5uQS0GVl0FOZ1orxLPPUyvTK/rGvmDOEbdMlEwzwszZJrrwon8ypOMHzDT35Iyp9sutRurRWnM/3i5GCredldQMvP53l4J+ob/49CZZ0PDtMzjpRCHq8y8qxbJE+OH3JlsIOgMNoMbXQlFYZ6YvvZPZBkCfCXmc9TMSNAuxPgHUMpXTpkAoHV5N5BCX9nJvk0vZphrJjCp1QdMYSmC2yRK9f3LvaAO+tBHCArHPr0uyLQyGSWgJZs34VZiw+6M2lf8bsSM5TSVOGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SN7PR11MB7592.namprd11.prod.outlook.com (2603:10b6:806:343::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 15:21:02 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 15:21:02 +0000
Message-ID: <2318dc1f-f03f-416b-a53e-eda9991083a0@intel.com>
Date: Thu, 25 Sep 2025 11:20:59 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Update GuC log buffer type value
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <stuart.summers@intel.com>, <john.c.harrison@intel.com>
References: <20250904151406.736972-1-zhanjun.dong@intel.com>
 <44a754f4-78a3-4cbd-9f1f-55d62f19c957@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <44a754f4-78a3-4cbd-9f1f-55d62f19c957@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0378.namprd04.prod.outlook.com
 (2603:10b6:303:81::23) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SN7PR11MB7592:EE_
X-MS-Office365-Filtering-Correlation-Id: c741e0e3-9cd7-47db-55f9-08ddfc472352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGdYRmkxMjVWcFBvOFlRd1oxVlU5ZSthOWFJd2xReTdQSjFYVFYvTWZkME43?=
 =?utf-8?B?YkFPdWdCdWVwL2Q1aWF0aXRSTUx4d3FqL3lybnhTVkVDNE9Qc1psbVI0THRB?=
 =?utf-8?B?ZnM3WjUyenhVUUFHRndLWEFqNlpOOC9mRUhCQ2xyKzlUb0s5Wlh0NXRCbng4?=
 =?utf-8?B?RTB4WjdKd0g3Q09xOGxVOHo3dmw3NGxpeHZhci9VM2txUkp6TWplcVhVMDJk?=
 =?utf-8?B?QncrdlNJVzlPdlZoanFaazArQStIL0pvVG80UTFqU05UZnM3aWlSOGRTVXFq?=
 =?utf-8?B?VjdFTy9XOHpoQ2IwL2xjdm1qd0Z6WjhyZi90dVV5c3JUTGxRM2d1YUx1MXJY?=
 =?utf-8?B?eExHWkRaVFlKUC85dGRTUVdPUXV3SE9KWHZjQzMrNlVZbWR2blBPcnE2eU9t?=
 =?utf-8?B?aTZuOFoxc1g1Zmp3YURLNGtMdTJXaklTb2dnazVDOWdYWllqeEhHdVZlbEpK?=
 =?utf-8?B?MWgydnhiTUlVZkpZbWRJL1JLZFIwL0pQUGVDek9uZXpSTnRUQWFvK0toV1p5?=
 =?utf-8?B?dlJhalRQV0sweTN3Mm5yWGFmWDh1aVpCaDJ3emVXcFlHTjUySWY5dHQ0UUtk?=
 =?utf-8?B?N04vTUphMUticm96cU11NzVmcVJSTis2dGdZOVMyY055M3ZjWk9kWFpNbzg3?=
 =?utf-8?B?VlJwYm11S3JSNnkrWFQ3RTRHTjdsdDJ6cW9hWGhCU2pBRG9CUUV2WXRuUzhh?=
 =?utf-8?B?WExrYk02QWFGUkFmajhsd2lOZTVIOFpjUUhtbHFnQnBPKzNoMDhJa3BvMEo2?=
 =?utf-8?B?cFNaRUtaRXpjYld4QnpVSUtuV1lObTBLYjFJNEd4S01JMzZhT2svNW0yWUp5?=
 =?utf-8?B?K1d2NS9IOFh6ZFl1L1FTTkpsb3IyeXZzNDA2RGJRZU1aM1pMOGllVC9mKzZp?=
 =?utf-8?B?MSszNXl1RTdjV1JLZkJzWStCSmRIM2dMZHhlZ0d3V1Y0djZ3b095VGFNaFZI?=
 =?utf-8?B?SHAwMm42MVNPdm5SOEhPVEx1YzZYY0dxMkJVL0JGS3REQW1mNDZxY1N3SUc1?=
 =?utf-8?B?MngzcFk0dTRQaER5ZmNJZHc2WmhJWUNUMklVbTBiNWtoK2dxMmRHdCtVVG5a?=
 =?utf-8?B?c054SFgyeFZnemtZRVJFR3g1OHE1QU9HRnYxVkt0K1JXc01ZR1ZvK1BtU1k0?=
 =?utf-8?B?VC9ZUEJ0eFBSVnVvcVFQaG85MkxLYU1rcFlHR3g5dktZbTkyR3dacGtYTWk5?=
 =?utf-8?B?cDZ4NytrZnFaTFc4YU1icEJTZlJpKzE0bDJmV0ZFZWxNM0poNVVRZWFQQ3c3?=
 =?utf-8?B?VG5tRXhjU0tJdEh3aktBZHZNQlRBSE5aTFhsNDJJdC9iVkd0ZUM4QlRvd0Uw?=
 =?utf-8?B?OGtRZFU1dHVrdktsUFNpUHQza1NzZHYzK3UrNlRKL1NoTUtoWmcyL1VkbTZm?=
 =?utf-8?B?aXo2TnhCRWo1RGNMWGJjRFYyYWE0dUZZTmRLbk0rMEhweWppUlQ2cDI2cFFw?=
 =?utf-8?B?N1FpNVRvTkU4dVF1aHMzVW5HT1U3Rm1NenVaQ29yaXNIRjlHb1RvN3hEcHQ1?=
 =?utf-8?B?a3VHbE9kb0Z0cjcxRDVqRmczUG9sSHVZcjlGOW83aUFIREVHdHZSU2dBcGVq?=
 =?utf-8?B?K1A0Vit6UVBWT01ZeXRRUld1YU1lbjVid0RLeWMwZWtVREF4V3ZBZTlrSzI2?=
 =?utf-8?B?YkVYbTcrZnV5WkVwSjFnQkR2WmhYdmZrTVJCODBqeDlxY1RZMEVYWkJlbk1S?=
 =?utf-8?B?RFpzMjBzQUhKdnp3TVdDTC9iYmw2VklTZXl0L2lTdTUwR0llSGpob3pXU1Vw?=
 =?utf-8?B?NFMrVzRic2lkWTF5ejRIdTVTMStKVXZwbTRDRzVxZXIybERkZy9FS3BHalJz?=
 =?utf-8?B?RnlwbnVXZkpUWEVLaGhZalVWL3paRkp6c0RpaTJpZXVtaUMvcUY0QjlnVjVM?=
 =?utf-8?B?ZzB1ZXZxRUx3d21aK0luUk9FbUZGSmNZeDJEaVhGVmxzSHdzaFBLbFNacEVJ?=
 =?utf-8?Q?icCD695xqxk2VA31lecd+PT2EzXkzz3w?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkZkUGJuc25ZMVBvUjBPRytxaTVKNlNUSUJicDBDaEJXbWVzMExGV0ppZDdP?=
 =?utf-8?B?L2I5ZzF4MUY0dkE0TUZ0dTJJQ2Noc3I5MndERERYa1R5YlV0ZmhKMkdGbVJv?=
 =?utf-8?B?RTdwdUZrZUVhZWJmaG1rS1Zia1A4Rjl0emx5dVBtSDBzVDFSejNPVzZQV2NB?=
 =?utf-8?B?WnZUWHh2dk5OdHBYaFIxbWJvbVRyUGF4WVpKY2RBOGo0YTFDYXJpaXNxc2kx?=
 =?utf-8?B?TkZheUZ0c0hJaTlLWk51Y3luWGpZTURoZjAvMVR6SVZWaE9xd2NGK3VMWWtJ?=
 =?utf-8?B?czJwdEpDc3VzVWl3MWxhZC9LMm9ubEZZb1JsbndhTHBCS1RRS3E0cUR0NEpE?=
 =?utf-8?B?S2NHOHg2S2VDSTBodTA3bnlVT2tKQ25mRGpPV21nY1UxYmpNbFh5dDMzSXZ0?=
 =?utf-8?B?dWg0Wi9BMC93c0hYN2FqYTF6QndJS2IxUENGZ3lHVTRSbGx2RFRma0JORXE5?=
 =?utf-8?B?RHBMYkFOMlEvNXVLYWw1QzlwbU00djFNYmtTckprWk9VQXhCWnZLenNNWEF5?=
 =?utf-8?B?VTJnVmRrU080bEt6clQydG5CRWhaQmwvbjR1L0phUkQwRStuZDNXQjFLYnpI?=
 =?utf-8?B?d1h3RE1oUGE4N0x4VndadkkzWU9HNHNCQnIrMGNOOCtJbU1wYm1aUVFyclY2?=
 =?utf-8?B?Vi9wejZpNCtlYk9YeVBnTDhnT2huUS9PNCtGYVNTdzJtR0NwQXJ3MThabnBG?=
 =?utf-8?B?WjRoT2xTU0pITU4za0QxUDhxYklGQmlBdGs5K0sySXd6S25BTWI2ODQvUW9j?=
 =?utf-8?B?OGZsK2kxN2FzNDVMaGtqRUJSZTNhdllhazVwWmZzdVdVczNRWittV3ZaL0lW?=
 =?utf-8?B?TW5hNTVsVERxOEg2UzRuNHFPRHhkdi92QnRUYTRqZGFpR2dwZUVBM2lWbTEv?=
 =?utf-8?B?QktMaXlKOTlVbDRoQXk3Ky82YUV6a2RqWWRJK3N2MzdZUzd0WHRJUzBJUTZx?=
 =?utf-8?B?QUFQR0RwN1J1ZEFyV25RZFJOMEROcVNnTEVnM1A1bG9EK2Q2a1NzZFNMVG5L?=
 =?utf-8?B?T25GbjMySUFOYkY3bHdKUVdZUDVLemNNN0EvN1QvZFR5NGZPSk1HZm11UnBk?=
 =?utf-8?B?WnB1bmVuaVRTUExNdno5MS9OcThUNTVUeHJRcG5ZVXBTZWtocU9xdDFyak9m?=
 =?utf-8?B?bTh0aG9OUGRYbHBLc1ovT3FuZWlZa1JjOFBiR01HWTFPS2lFTTNDc2dwbCtU?=
 =?utf-8?B?NzkvREZxdlJvbCtnY1dtNTMxRG5KT2xyMDhVcGd6V0ZISWJaYWFrazFEcU43?=
 =?utf-8?B?U1EvK1ZHRGtZL3NXL1BIKzhubTE1VXpKU1dMT3gyN0dzQjFmbXcrYS9aU2tW?=
 =?utf-8?B?ZkRyMlBBV0JPZVlBU0dHRUNDODU4QThVbGxKUERTVXBuclo5UzRNRXIwazJl?=
 =?utf-8?B?eUpGODRuVGM3bXpONVhUUWwrSkZqRnRsN0NpSjNESElUc3IvZ1Z5bHZTZEJO?=
 =?utf-8?B?Nm51a1Y4V0IwekRkYWhqbU1yc3ZrNk45V2pGT2ZLUk1sVG5vTlp6eE9xWEJM?=
 =?utf-8?B?RVI2QnJKdWpvQzYvZHluVkVYT3N0cU5iVTZ3b09mOTZVMXhYczczMUR1Umpv?=
 =?utf-8?B?N2ZCK090b20ySkV0RmRucGVLWTRFTERtRUlVVUk2cHhNNmhXTW54WUFxYW4z?=
 =?utf-8?B?cW4zOVZYR2djNWZsVmg0VWpRQlB2TCtBL2N4bUQvWTZWN3lBU2FyUXA5RkVG?=
 =?utf-8?B?cXdVUlZRNi9JempvQldDU1QxKy9Wem51endKaGVRSnpMdjhoUFFyb285RUI3?=
 =?utf-8?B?bGZlVXlMNDRXQ3k5YWdBSHZNZnJEdkR0WXRjSkRqWlhVMzhaYzRTUnc5N0lG?=
 =?utf-8?B?ZjhGZTZuWGFyQnJVdzVoTUM2ak1zd0dPSDJVK1JCRUEycUVoNDhGTHpCbkwx?=
 =?utf-8?B?VThQZm1maEduVlUxV0xVcHNKWHVaaEhXbUV4VEIzWklmOFZsbmRBblJBNjdO?=
 =?utf-8?B?cno0SXZqb3BRcVlnRlhIV0ZpV0pmZzc5ODhTdmR2ZWY0Vmx5ZVUrcHpKdmkx?=
 =?utf-8?B?Z3hpdllyWnJERlBrUk1jcXpleHFMODNHU0h2eUZpWGh6NXdWVStnTnB2L1dp?=
 =?utf-8?B?S2tPODhJTkdYblc3MUtYZW1DdHNNSHV3RURXaTdqUU5RNDNDQ3hxYUI5Mkc1?=
 =?utf-8?B?dXZQY1FNU0FBbnZ2bTVaTmFnd20rQzNHQk5BUkEvdzZ2b2phWktkSWpZcnpW?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c741e0e3-9cd7-47db-55f9-08ddfc472352
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 15:21:02.5104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: do9qmB5sDtAavvzLcpaItyPeQzoiDmH2RvXL8OFrLlkabLDwiJcAs/aETfVkoNo8mxauHoyY5TMzx1YOr4kRww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7592
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



On 2025-09-23 6:20 p.m., Michal Wajdeczko wrote:
> 
> 
> On 9/4/2025 5:14 PM, Zhanjun Dong wrote:
>> Update GuC log buffer type value, to align with the GuC specification.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>> Change list:
>> v2: Use SZ_4K, instead of PAGE_SIZE
>>      Expand for loop with switch and fallthrough
>> ---
>>   drivers/gpu/drm/xe/abi/guc_log_abi.h |  2 +-
>>   drivers/gpu/drm/xe/xe_guc_log.c      | 20 ++++++++++++--------
>>   2 files changed, 13 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> index 554630b7ccd9..b1819679fa35 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> @@ -10,8 +10,8 @@
>>   
>>   /* GuC logging buffer types */
>>   enum guc_log_buffer_type {
>> -	GUC_LOG_BUFFER_CRASH_DUMP,
>>   	GUC_LOG_BUFFER_DEBUG,
>> +	GUC_LOG_BUFFER_CRASH_DUMP,
>>   	GUC_LOG_BUFFER_CAPTURE,
>>   };
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> index c01ccb35dc75..6cbb0378d2ba 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -50,7 +50,7 @@ static size_t guc_log_size(void)
>>   	 *  |     Capture state header      |
>>   	 *  +-------------------------------+ 96B
>>   	 *  |                               |
>> -	 *  +===============================+ PAGE_SIZE (4KB)
>> +	 *  +===============================+ 4KB
>>   	 *  |        Crash Dump logs        |
>>   	 *  +===============================+ + CRASH_SIZE
>>   	 *  |          Debug logs           |
>> @@ -58,7 +58,7 @@ static size_t guc_log_size(void)
>>   	 *  |         Capture logs          |
>>   	 *  +===============================+ + CAPTURE_SIZE
>>   	 */
>> -	return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
>> +	return SZ_4K + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
>>   		CAPTURE_BUFFER_SIZE;
> 
> nit: can you do the math in the same order as on diagram?
> 
> 	return 4K + DEBUG + CRASH + CAPTURE
Actually the order in diagram is reversed, I will update it in next rev.>
> and btw, since in this function you are using hardcoded values
> 
>>   }
>>   
>> @@ -327,13 +327,17 @@ u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type
>>    */
>>   u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type)
>>   {
>> -	enum guc_log_buffer_type i;
>> -	u32 offset = PAGE_SIZE;/* for the log_buffer_states */
>> +	u32 offset = SZ_4K; /* 1st section size */
>>   
>> -	for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
>> -		if (i == type)
>> -			break;
>> -		offset += xe_guc_get_log_buffer_size(log, i);
>> +	switch (type) {
>> +	case GUC_LOG_BUFFER_CAPTURE:
>> +		offset += xe_guc_get_log_buffer_size(log, GUC_LOG_BUFFER_CRASH_DUMP);
> 
> do we need to use fancy helpers to finally get the same hardcoded value?
> 
> here it is just CRASH_BUFFER_SIZE
> 
>> +		fallthrough;
>> +	case GUC_LOG_BUFFER_CRASH_DUMP:
>> +		offset += xe_guc_get_log_buffer_size(log, GUC_LOG_BUFFER_DEBUG);
> 
> and here DEBUG_BUFFER_SIZE
> 
>> +		fallthrough;
>> +	case GUC_LOG_BUFFER_DEBUG:
>> +		break;
>>   	}
>>   
>>   	return offset;
> 
> then since XXX_BUFFER_SIZE macros are already in .h maybe we get kill those helpers?
The value is fixed for now, with the helpers, logic inside could be easy 
to change for future, currently, caller of xe_guc_get_log_buffer_size 
for crash and debug log are inside of this file only, but user of 
capture has external reference on xe_guc_capture.c.

Consider the helper won't cause code hard to read and only return fixed 
value, make it easy to be optimized, I would keep it as is. >
> and btw, those BUFFER_SIZE macros in .h should have likely have XE_GUC_LOG prefix
> (since those are Xe driver specific) - something for next (or prerequisite patch)
Yes, need to add prefix. I will make another patch to change it.

Regards,
Zhanjun Dong>
> 

