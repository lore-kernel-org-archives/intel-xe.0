Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89C6CD3436
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 13:50:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9780D10E5A8;
	Tue,  3 Sep 2024 13:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jxE1YonF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E54D10E5A8
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725371410; x=1756907410;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ljpYkfJog05IYQtZoz1WjVLlbGLaByENiHvrvAGQtkA=;
 b=jxE1YonFC3DvruE14XknFZXtImo43tmpRwr6IYRulhKM90iy+D1mvuVd
 I9Bk3NEpk6QR5srv0J6FhPlWvhuhlry8J3wYXf48Xnkn0xtudtNi/DS4W
 AVd3xyPAacw1ij4Bt3g8BoZVclJ6bSKgkRQQRCcsfcpBggc7FQdzjkvfj
 w0l0ATVRxXb9CEsY/8tPKPKer78cUUPeCPgTswdN+5IyuwAb3i5RsrtSg
 YdZZu5LEZzPVJx3edKFEirHKkmwLCvGTRlJoAUuttQB0++cYza6cbOz7W
 n0GSFRFAWa5dJdilDf5ywzu4BOeyZf38U6QgNXgAqkEq2E7W7dPoB+olq w==;
X-CSE-ConnectionGUID: XeqBYv+fS3+GoHMio5aQ5Q==
X-CSE-MsgGUID: daNof8CTRHyMbRZoFakMYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24110050"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="24110050"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 06:50:08 -0700
X-CSE-ConnectionGUID: 2KBt2q32QmawgOto6rm97w==
X-CSE-MsgGUID: mvnCKEXvRyaUvZfivYtDsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="64961968"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Sep 2024 06:50:07 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 06:50:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Sep 2024 06:50:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Sep 2024 06:50:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZQ6i5O7pncM7+BMbBVzc7pC1LRelK7j/f8Whaxkxor5vCZ1EY0pGr49da15X0y1lgBFW6bU3L5nSLNslYi78ipJcpxAlN8no+0u95dtB6uJegoy1cDK3Upi7twZSNjpnovDbjkpat4+brxjk8nebgu4A8KtrT+kRN1EQevY+2RyqbTvdAs3MuQHJSYp5Mjf+RyCOYjRm6TV1SBCn/iSDw8LEFm3lOEgV117mdrljd8reO/efd1z3gqb10ifgBR+gUmaneVNP+dtLGgzWaIkzf2fRrISiVScg2nVOIrRu0WSew46fnasdSZyt7onF+InpxnuJ4TijXw+kgUys9bd/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyJjlvLLw5ReD6uTdevUkCjA1SYhpz+8wKe9GAU8ep8=;
 b=S4S9xbKGYSkfnCy/+vfiO/QVlgKlg+nYXYmqaAwlUUM/unQiHMenTlAU6s1LLo9NAJxIK09wTlX11pdHBZXR30QJnVazuztCKPktliUM6xQYD8XADVpGvQGSiKEkZhwZKQFkrVtQ3lysd5sKWiAihSps2rEPSU8d96I8py3R4PgKWeU3cvKA+zRSiwi2hggymC5rPVRsKgf+KgFTz6eG6CaPZRy2IxTLz61I23Y26U/Z+A7k9GrQIcCgPZmYbi2IsknjzQSGhD/RqlWdqNCGMjqHeNpaDpGT9u8Vkyr1lCn5zEhMxz0rKKOBgp2gSr5GPxm55ZpokjjeszBDaxpgFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SJ2PR11MB7574.namprd11.prod.outlook.com (2603:10b6:a03:4ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 13:50:03 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%3]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 13:50:03 +0000
Message-ID: <6c4a28d3-1c45-40ee-8401-9557e6bbd060@intel.com>
Date: Tue, 3 Sep 2024 15:49:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/bmg: improve cache flushing behaviour
To: Matthew Auld <matthew.auld@intel.com>, Nirmoy Das
 <nirmoy.das@linux.intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
References: <20240902153744.63456-2-matthew.auld@intel.com>
 <9d3f3a9d-bfde-4a06-a776-743b1ed47236@linux.intel.com>
 <4bcc669d-7fb9-4daa-a94d-22a785f04b22@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <4bcc669d-7fb9-4daa-a94d-22a785f04b22@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0001.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::19) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SJ2PR11MB7574:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a68ae92-5b5b-4ae0-acbb-08dccc1f4f74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEE2Y3F0Q2haS1ordzRQUjRCa1c2bWh4bDNKSnhmRUdTZDVIaW5TUDZCS3Fh?=
 =?utf-8?B?TjBGUkdCKzlOSnZlTmlCQVh0THlCZEd2QkZ6VEdFK0hQNHNVZkRPZ3I1Vzcz?=
 =?utf-8?B?WGNiN2g2elltVjFVU1V6MXFidWlCOU83d2VBaTh2RVpibEhLRURJU2JGcHYr?=
 =?utf-8?B?SUpIQW1RZWxJSDJtZ244N3RWNzV5T295SnNQTTJZc081anhUdUJvSXZQVEht?=
 =?utf-8?B?K0RjY0RpZjluOVJJeStyc2F6NzlkYVI5MHM3Sm5hcVhISGhoU0ZlT2NESXhY?=
 =?utf-8?B?OGxxTFpsUHAzUGU1eHBQMWhKcWFBTjlHQjYybzc5Z2kvQnJ3VFZhUkdaUXBO?=
 =?utf-8?B?SFJrQkJWVkU0QVlxV1hFSEliZmtTUjBaVG50OHJ3aEpmSi8ydmdjKzlnS1BK?=
 =?utf-8?B?SXErN3pjZENVQWd4eDFUcHRDeWRoMXlJQUlkUngvRmVvT0t6akFsd2E5QkJ2?=
 =?utf-8?B?aU1JTFRWYkV3cDFyNkI0eWxpSXppQ2FNMHd1Vm5XeUNTMWEwdjg1Y2ErZk1a?=
 =?utf-8?B?ZCt6WEVrZkt3aGtjMHExRTRmL1R1RTh2TFkzMDM0N3FCYjQzQWlyTElWNXl3?=
 =?utf-8?B?WDJaL2ZxazJuU0dSTTFES1FxVzA0cURLUHFoOWpiRkF5ZFFlaVFjRkxGeTVJ?=
 =?utf-8?B?UlhEUVF5NUlybTREVnBEcWN1T3E0MDFBM3RUK0NQVW1JWUpQUkZZcDJFbVZy?=
 =?utf-8?B?UkM3ZEhibzRRdHQvZHNwL1lDQXZ0T3RzVEZ6bWJodGp5d3ZscUMxNS9SR2h5?=
 =?utf-8?B?eStidHlIZitCMkpXOTNDTHVBN1lLd0VOK0wvQzFyZzNQVWZySzhmeEVhbDVr?=
 =?utf-8?B?NVB1aC9WK1AzZXJTeHppL2E3bEVpS1dydENsbzVpbEtQMitUcGVKQzA0S3N3?=
 =?utf-8?B?Ulc4VVlyWk13Q3o2TWNtYTBGeGo1bmhHWmFUOUs1WE5lWk5HTGErSUgvMldN?=
 =?utf-8?B?WkZQUFV4M1JzOGRBVUJnZ09CLy96ei9mc1NCV28xLzFNbjkyWDdsMnlGRllw?=
 =?utf-8?B?RHc3YmtKejRNU1d1aUI3dS8zMW1RcW5lMUdaQnFtb1FmTzZWeTI2M1NqRnNL?=
 =?utf-8?B?NURhUDdoeURSamU4TGw1eXdqUGhob1N4WGJXYVJ5NFhtOXNxRzczSXJodWNS?=
 =?utf-8?B?L0wyenlkTDlPeGNmVXVSN3UrN0p6OXlWYXRQck56VnR6Y3B4UGdtb0Evbm84?=
 =?utf-8?B?L0VLRFdHS2NWYSs5cEdkeUY4WXZmT080YytjMUIzN3AwNUJkZWpPWEc2SUQr?=
 =?utf-8?B?dW9lM2lIZHJjSUZtdEkxRlJHakZyYkFDb082S0E4WnphRWE1dkNtdGlpZTdX?=
 =?utf-8?B?SWhOZnNFU0U5MFVtbXFlUDFtc29nejllQU1vUFB3YzdCcGZzYXh3V2pBQi9B?=
 =?utf-8?B?cW5pMkxSZ0xzckZnMUNHaEIwdEFNZ09kQnpSY3htVHZ2M01yc2hmT0xEZCtn?=
 =?utf-8?B?dG9KakxpRUN0VFJDVTZZOTZrRjA4cnFDKzUyZHRGZm15SE1qOE5DVUdrWTVw?=
 =?utf-8?B?RHhXWnpoc2g1RGtaZ3BQcXd3ckRmekwycGNjKzFyVU5xU29IVmlMckQ2c2RF?=
 =?utf-8?B?WUNPZEhqSWtmNlhsNzROc2lFOUZHRTBvSEtob004M1IzOHoyanFIVE9QSVpY?=
 =?utf-8?B?dmtCRGR5akEyNWZCaGJLYU5uQmQycjNicGlMMkpsdEtLMVNoeHRqOUF6S2NZ?=
 =?utf-8?B?bzg5V05GQXdYb0RjSi94WG4zUlA2V2lXYjM5aktiUFVnQStCYVphR3d6eERz?=
 =?utf-8?B?M3h5SG1iY3VrUzRwSDJUdXdaRlYvSiswQ3pGeExUV0xVK2g0SkpxN003V2F2?=
 =?utf-8?B?LzlxKzQxSTI0cWhPRC9oQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDdXRFh2MklRSjZtNDN5S0o2c3FucnJadWlOTC9tZkk5VjZpcE9qT3VWUHpl?=
 =?utf-8?B?MnFvOWZNamRrWGg3QVhkVEFCRjFWODBDVVE3WGZLdFlCaG9JR0dMNktTQlpH?=
 =?utf-8?B?aklPUmtQc29VaTd5d3RDbmkzV0krdVowcjg2UEc2UzBvSWRRVFpjKzlNZ2Zp?=
 =?utf-8?B?Y0ZiczJVdE94dXJEdVpkaFRqMW9ycHdNeDJrNmZPSWpxMUhEY1d3bHF3MGVO?=
 =?utf-8?B?NHlvVGRUazk2MG5obkZrTmxZTzhyYmJMb0VVMENrK3FxelArbllwKy9rZFZk?=
 =?utf-8?B?MDVadkZXZURVOUw0NlllTG5yWmlHa0MvTFFlYzhUSmhONHJMd2RNZnc5S2xQ?=
 =?utf-8?B?RDN4S2RBQlViOEdnZ2M1d1VHQXF2Wnlaeld5aHlRRmdOUHVDSGgwUHgyYkhn?=
 =?utf-8?B?ZGprSlowb3FheTZ6S3Z2M3djdE0vRHIrbXRUaWs2Qk1tbkdqVm1GeG5oNTJN?=
 =?utf-8?B?NVN4QllxdldMY2licmdNZnFoVzdPTlZaU3BDZFQrTUVRT3cwOU9sQ3lmZ3lZ?=
 =?utf-8?B?SHBISWo0M3NFTU1yOEdjZ0lFMDkyanIxeGhXUG1EQWQ3U1BsSTc0VmhlT1g3?=
 =?utf-8?B?K2Rsd3ZSMXY2SC9RdFdOMEFIekFscjFCUGJYUkMzVUJtMG55b1hoRU8zOEVn?=
 =?utf-8?B?V3daYTFpeEFqd2xIMzdZOUxYd3hzUjZWcjFGbUo2SDhPRE1tR21IYnhDbHlZ?=
 =?utf-8?B?eDRGb05hZUVYd2ZDbG8wMjRPaVFxODlrREk1ZEpaMkJSdGFzakd2UGlYcFRS?=
 =?utf-8?B?aDlRT3lySTVXQmNFd3BETmZNQ0hyTEtPb2JtUUgrUG9sVXByVllIbVZvb3Uv?=
 =?utf-8?B?a0Z2cm5NamZXMmlkcGlGQ2pNNEczaThLc0xZdGdkMFF1ckM2dGJoS2J5NzdZ?=
 =?utf-8?B?UTZNT1FMaUpDWWx6RmtBZW5IdGFVTGg2L2JKczM5Nzd3M2ZObVdqMUlLOG94?=
 =?utf-8?B?MEtKWGJ6Vy9kb3lVaFdOM3RHcDhhMWR0TDBFMHFOMUNoV3JmZzdzT3ZHWHV3?=
 =?utf-8?B?Wm9DUmkySCtkb1Z0MzRkdXJGTVZ5SzBiMmcxTSt1a0lUQ21Dc0ZaWHlaUmEr?=
 =?utf-8?B?K1FvbVpVNFVXc0cvMU1kQ1hXZkx0YVp0VGFscHhXMFQ0N01ycW02T21DTFFl?=
 =?utf-8?B?UG1pVFE1V0lJUW1yb2txbHdhdFF4OTFOY1h0ZkxVcVQ2Ny9Rcno5NUtxd2NS?=
 =?utf-8?B?aXd2eVo5enRPSEQ1RGphVDgyZURSdGZPVGpGSGF4UjFZZUNOa01lWWdiZXNv?=
 =?utf-8?B?SmF4ajFrcVg3aFNSYllDeXJ5cHliaGt1VGFtRmQ3RnR5dEJLZFc5WHU2WGlK?=
 =?utf-8?B?VHVsdmNkMWF1RGY1ZW9oMWVhc3RETnl0eGV2TFQ2a25zSlYzRnN6NmVVMnpj?=
 =?utf-8?B?a052NTZiZnNlZ2RnUTlOTEV5Mk1CdjZ2amlzakY0Zk1rN3F3VWZzcVRPL0dp?=
 =?utf-8?B?V0NwUkk0UTRxdGVyS21zWWNtVGlITVduNGo1N2R3cmhsWEpEbG0rTng3MVpq?=
 =?utf-8?B?T2hOME5mbDV4NmxqK2xKVmF3Z2lrMkQvYitqVkdYZERWbVFLZUZ5MERBTjBS?=
 =?utf-8?B?dG9DbUw3UU81UFJFQ2hnZi9PQjVJRTBhUmpWanBRUFpjQWdoV0gwL1VuVWE0?=
 =?utf-8?B?bVB1TzlhekE5aGxPY1dIc2EyWElIeXJFUE42T0swMHptWmlPWnpJQXFTMGha?=
 =?utf-8?B?SFdDMkFqaHFkOUNzRURib2lmQW9rT205TjdTeDlrbTNWMUl5ODVtWjRPN1ZK?=
 =?utf-8?B?RHdWaFhpNUZ6R0xQNDMvMWdkUC80THl5SlBOV2hueTFxK28zMEFXT1ZPekhh?=
 =?utf-8?B?TXVweXV2T0RUSHZyK051OFBiV3QxbDA0MUFsMVdKQWQvZjVrUE8reldHdGxO?=
 =?utf-8?B?R2dQSFdnSkdHTnQ3b21xZllSNFJJQzNtYU94cnpxOW1kK1dzYlJYVStESm4r?=
 =?utf-8?B?OVBZbFpFdUhBTEgza3JTdXFLeXVVeFN2ZUFvbjRkS2VyamIxeTh5bmJ3SnN1?=
 =?utf-8?B?VlRveVRQOTFYNnh1Uy82eUttY0hRajNrVDhkSzFYRUppM2JNTDgwTEFhazhn?=
 =?utf-8?B?WnhtRkg0U1BwcUlPdEFxdHR2eWYxZnhMZW5WNVcxWDJqMTR6YkhhSE9tVndL?=
 =?utf-8?Q?cRP5PIjizfX6XAaJPto8bpViV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a68ae92-5b5b-4ae0-acbb-08dccc1f4f74
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 13:50:03.3073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFRDp717Emx5kcdawRwlO+BIKKNbpKim2o38k3XSX35XBjqj9YwWSWU2VpviE4TdgOi5o30cBsEmDZfvfBubJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7574
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


On 9/3/2024 1:08 PM, Matthew Auld wrote:
> On 03/09/2024 11:53, Nirmoy Das wrote:
>>
>> On 9/2/2024 5:37 PM, Matthew Auld wrote:
>>> The BSpec seems to suggest that EN_L3_RW_CCS_CACHE_FLUSH must be 
>>> toggled
>>> on for manual global invalidation to take effect
>>
>> I couldn't find this reference, in which bspec is this mentioned ?
>
> BSpec: 71718
>
> For discrete under global invalidation it says: "Device Cache flushed 
> if SCRATCH1LPFC bit[0] is set". 


I was only looking at the register spec.

If I get this correctly, setting SCRATCH1LPFC would flush device 
cache/l2 from the L3 without it I assume global inval isn't useful to 
flush device cache.

Can SCRATCH1LPFC be set/reset dynamically, if so then may be set 
SCRATCH1LPFC  before global inval and reset it back after that ?



> Which is why I originally added this, however this then turns flushing 
> on for all kinds of stuff like pipecontrol which is not what we want. 
> But from playing around with this a bunch on BMG that doesn't look to 
> be true. Also the original WA made no mention of needing to mess with 
> SCRATCH1LPFC.
>
> I'm kind of hoping this helps that compute benchmark with not nuking 
> entire device cache between submissions.


I tried this one and is indeed improves compute test bandwidth.


Regards,

Nirmoy

>
>>
>>
>> Regards,
>>
>> Nirmoy
>>
>>>   and actually flush
>>> device cache, however this also turns on flushing for things like
>>> pipecontrol, which occurs between submissions for compute/render. This
>>> sounds like massive overkill for our needs, where we already have the
>>> manual flushing on the display side with the global invalidation. Some
>>> observations on BMG:
>>>
>>> 1. Disabling l2 caching for host writes and stubbing out the driver
>>>     global invalidation but keeping EN_L3_RW_CCS_CACHE_FLUSH 
>>> enabled, has
>>>     no impact on wb-transient-vs-display IGT, which makes sense 
>>> since the
>>>     pipecontrol is now flushing the device cache after the render copy.
>>>     Without EN_L3_RW_CCS_CACHE_FLUSH the test then fails, which is also
>>>     expected since device cache is now dirty and display engine 
>>> can't see
>>>     the writes.
>>>
>>> 2. Disabling EN_L3_RW_CCS_CACHE_FLUSH, but keeping the driver global
>>>     invalidation also has no impact on wb-transient-vs-display. This
>>>     suggests that the global invalidation still works as expected 
>>> and is
>>>     flushing the device cache without EN_L3_RW_CCS_CACHE_FLUSH 
>>> turned on.
>>>
>>> With that drop EN_L3_RW_CCS_CACHE_FLUSH.
>>>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 ---
>>>   drivers/gpu/drm/xe/xe_gt.c           | 1 -
>>>   2 files changed, 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> index 0d1a4a9f4e11..88a01970cc5c 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> @@ -387,9 +387,6 @@
>>>   #define XE2_GLOBAL_INVAL            XE_REG(0xb404)
>>> -#define SCRATCH1LPFC                XE_REG(0xb474)
>>> -#define   EN_L3_RW_CCS_CACHE_FLUSH        REG_BIT(0)
>>> -
>>>   #define XE2LPM_L3SQCREG5            XE_REG_MCR(0xb658)
>>>   #define XE2_TDF_CTRL                XE_REG(0xb418)
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>> index f82b3e8ac5c8..313cc4242281 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>> @@ -110,7 +110,6 @@ static void xe_gt_enable_host_l2_vram(struct 
>>> xe_gt *gt)
>>>           return;
>>>       if (!xe_gt_is_media_type(gt)) {
>>> -        xe_mmio_write32(gt, SCRATCH1LPFC, EN_L3_RW_CCS_CACHE_FLUSH);
>>>           reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
>>>           reg |= CG_DIS_CNTLBUS;
>>>           xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
