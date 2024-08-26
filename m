Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602A0C5321E
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 08:12:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB8410E12A;
	Mon, 26 Aug 2024 08:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRLG+KX5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05AAA10E12A
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Aug 2024 08:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724659943; x=1756195943;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+40nYHQgQD7ev2U7glyfm1mv2j2nTbnecJXyBKgIpS4=;
 b=VRLG+KX5X2ZzKCacvVUoTQKzTLSHV3PbzTcdrHaaqNjxHWF8QDGD/D/r
 2cFu1ty4RuL+15MKVxYxwzDHXG38eunVzvMBcXIGUrR0CNT6xRNGNEeWk
 6FTYWn2y6MElcBlU6K+/eliw+mD8d075XwatuLqeZHxGlCXP/AOLk4Jia
 A97oAsajV2Qy4YZh9gUlQJK25+BJduvlQL9BRKL+4Xbe5/8TRNCyHaOCq
 IyymY5ZYb8MvNJwMamGe6DadYdAMczr87Wft4BASuHkYykCr2a50smzTd
 iR17aO1tTBW3Ga9x2qSLXRqzVUnv86s4hA9ZjsZS4ZeVb54UzKyNmHEs2 A==;
X-CSE-ConnectionGUID: NzpwK23nQqifprFfNvfZsw==
X-CSE-MsgGUID: DupUs0TyTbKfFkfCOKCfRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="26833159"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="26833159"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 01:12:22 -0700
X-CSE-ConnectionGUID: CfeVakBqTFqD+u93AovwkA==
X-CSE-MsgGUID: 0Nf461lmTdGa7K75CA7k9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="85617640"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 01:12:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 01:12:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 01:12:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 01:12:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 01:12:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ddf8PQhGmGrVsMwxbos0YHpmTsSEfS30UdRfHRcMru1Xt+nNWlcK+e5JtCzSGL7NYpbBsweZD7XX+FfeWoc+wOgkctLO/iCX2eFiNsgD6H83ENaWXTo801tpUONQq5965iacsMRlt0kVUE1cfJasuIIf0Xc4NhRxVqSN+mmEbVoSmVHQEp71DW5vYQGbgVd2C/5Fd6N31UTsefOAsVV13bTnmLPGX99Yf6M/YCoLytfhHYHs+GuoEhj5WDt8QSYPRD8QHEuj4gJjJW8r7CodeOFRcEuzGNQcKEcNs/NkZvDzIyEWUHGevqBqRDwTVe0ID/30zp8Z3j29Ytka5F0iFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CDx7D505knkbyc0L8dw8HR7QTHdz20cUkHA7ctgUp0=;
 b=ThEBdXAzevJ0Swk7QjBNHjt1pwsBNR8l761Wpq211cPbaafoKg3XDm/iEJoPR2uIx92CJQ38H4I5iSX9MuK4WcQnM5ZfOgFEGjsU4T5Co0hEebYjQsVgsG5T3rw/iTipq3WPhh3FxZ26DVDJW/t36VQ1tv7PpPjIGElUzUiv6qRa2OU5VePWxz0gTf3tNQUDm75qUi1MIUnE2TB+1Y9WiFJspoEZbUNUltJbYeTdXzxir86DsJpcO9nKA3tkCWvj564pOd7O09KqCuNNjUAJ9HEy3sNHa8gJaogawmFlkRUnnEsPNShlxzdQn+v6bteSP+j/ZgEI59LVDXhyVSp9qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA1PR11MB6291.namprd11.prod.outlook.com (2603:10b6:208:3e5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 08:12:18 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 08:12:18 +0000
Message-ID: <fed29970-bb0e-4196-ba6c-004ffc71d2c4@intel.com>
Date: Mon, 26 Aug 2024 13:41:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Fix xe_hwmon_pcode_write_i1 param from u32
 to u16
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <ashutosh.dixit@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20240808172734.2233594-1-karthik.poosa@intel.com>
 <09eb6fd4-e333-4b0c-82c3-2ffee7295304@intel.com>
 <3650fdb0-af3c-4732-9f72-21bab3304d76@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <3650fdb0-af3c-4732-9f72-21bab3304d76@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::13) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA1PR11MB6291:EE_
X-MS-Office365-Filtering-Correlation-Id: 497e99ca-03aa-4386-023b-08dcc5a6cd35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXhkdmF5YVNCbjNIMEE3U3NjZGppT3JtZ1RWSFJuanBRRUFic2x6cVM5MDkv?=
 =?utf-8?B?c0xjRmFGbldTeGJlK1E2VzhDMXZaeGNqWE9zYm9UQ0MrU3A1ajVqRGlpbzdr?=
 =?utf-8?B?TzF1ZFBoYUU1MFNMTlFLT005MnZDTFhmY0pTTXQyU2N0UEs1dmpzd0hhQU44?=
 =?utf-8?B?OUQwWGRPekJaa2wxdXFZUkk3ejdaZEtNK3NOOFd3MEdueDQ2WWV1V08wTGdJ?=
 =?utf-8?B?M1p0MUt3OE9EWUlkQzlHVHBKd1c5THRYZUtseStmOU11TEtUUGVjNmgrZU5s?=
 =?utf-8?B?VHZOMGJyN2ZnZW13UTNqdHVaRFNLMG51M0VWcEYrVzBtSHJNL3MxOU5rNE9F?=
 =?utf-8?B?dEh4WUw4blgxSG9mK04xeWVSTVVQUzFBdGFxWWNXWlZGYXV5V2x1VmRhclFN?=
 =?utf-8?B?N21vQ3BqVi81M1FTYks5ZHdLZHNkSUhxazQ5bTZ2dWJFTGFiVWVEL2JLL1ZG?=
 =?utf-8?B?cSsreUt5cVE5dnlCVGJHaDdiaXlDWVpFY2FBTHIzcC9hRWVPUDJ6NUNTRnU4?=
 =?utf-8?B?NmZ0aHQvNWllVTBoWFNCUE5nRU81VjErRFltamlxV1I1ZGRZQzlpSldDUUFY?=
 =?utf-8?B?U00vbDJLZTZpTWxEVUJFOU80MkJGM0VJOGp5Mk5pODlaampTV2ZpRU42Qm5V?=
 =?utf-8?B?VEQ5OWdXWHJTb1NQQXRlUTN0Ymc3R3JXY1ljaTNodEFRS3c1SGNnSTJWQ3Fu?=
 =?utf-8?B?UWVrMEZ3QnJFL0dWZFBGSHoyLzk4cDhIREFzYmFCb3J6cTN6R2VKNlF0NEM0?=
 =?utf-8?B?VGVZLzJMaHd3cmorUkN3Rk1yY1psL1E1eU0wQitNWW9MbnNzSk9OZzgxdHh2?=
 =?utf-8?B?V1MwRjAzN1Zyb0s5MlhaUXBQZ3Fiam9Zc01DWW1hRklUT29IWWxVRXRyZWlX?=
 =?utf-8?B?V2trdWdWZjFRSWpBZWFYN1BSdS80OFBWZm94MklvQU1EcGYydUxRV0hKNmpW?=
 =?utf-8?B?MldPWUlNVGxpcHgrZFdBNUtCTzRDV1hlOWRwcXBRRE9QMzJzblg4c0hnL01p?=
 =?utf-8?B?eDNhQ09jYUpqUlkwYW9oT1VvREo0Q3FlU3lvejRzd29oajlvV1RVT0JYOUxL?=
 =?utf-8?B?ZGpOTVVHdmd0NEJhWm9HOXVqUXI3OHYybmVpaFlXNDRoT3R4djF1UEtBazkv?=
 =?utf-8?B?OUJJTXJCTDc2Vi8wQmV3UE1Rc2FXTmN1MldDZFVmRHpZUjdJNzFUaVJpRjZW?=
 =?utf-8?B?Vkh2RzQ3RkxBVnNGc2ZYSWNzMEZnTHJVaGV1bW8zTEU1aG5EbU1WMEUvN3Uz?=
 =?utf-8?B?bTdIM0kreVRZT2liOGwvV2h2UFd0ZkJoRW1OMXIvTTl3WkZSVU50MStHbFdu?=
 =?utf-8?B?ZGtnVHJ0aEo5UTg1T3hNY25OblpaNjRiT3FmaFJxUGE3cUw2VThlWkVYS0h2?=
 =?utf-8?B?S3FmQU9aaDRHNjRWK3p6TEFkTGd0aXFHR0Zmbm9hMnk0YmZOUW8ySkxaMElq?=
 =?utf-8?B?d0JRcHNKUWpvUEdFM0ZxWnRzNnRZTk96UVF0RmtZOHBhdFJ2b2N5Vlc0ZmJU?=
 =?utf-8?B?WW9YUEdwWUlrWndXcHcwTm44V0dSVnJCdlF3bTlyM3N0VHZvZWhBWlVYUXpl?=
 =?utf-8?B?SEI0Y005VGhlbUVNYVkyQWNHVG05amd0UWI2N3IwUGZ1SEVNUnc0Q1UyNUw2?=
 =?utf-8?B?eGZ2cHRGRFBjelB1enREblZRM2h0QWJ1SFFpbFU3N2ROSjcxWXRSNWdQWEV6?=
 =?utf-8?B?YXhEdTNtbi9pdjM5SWR3V3UyTVJCTHVncFhNQmIwcUFZMXo2ZExra20yNXVv?=
 =?utf-8?Q?QP4nAlZJa1cdi6bE/4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emVNcnBOMjVDU1gvWkV5YUQxS2N6QTdSOHRPa3RPYUNRc0h4OWhQanc0WVZn?=
 =?utf-8?B?aElkMjlCVGIxL1hyM1JWZTYxaXNPQWVvaDJENG5JR3hkRUtZRWUyL1ZmdmQ3?=
 =?utf-8?B?RkFEYlh4bUMvR1ZkU0dDY3RXdzhGTkhmVUFKa1RlWnRWU0ZOeFVraFA5TVJU?=
 =?utf-8?B?elBQcDVmaU1PR3FtV0puR1c0MXphVlVLQmdqdUU4RlF6R2hlNmNhWUdEYTZy?=
 =?utf-8?B?bVlHNzJLWG4wVmZIS0lsY1Z0UmpOdVVyQjRFc01xeEwwd3hONksyUmN0Lzln?=
 =?utf-8?B?T3krVERjaEVNWGw3VHFkM2VReEY2ak84K1RUQWNUVjJwU2MwblphR2lZVG5J?=
 =?utf-8?B?VkF5SzkwQ1JKMm0yQXpwSHI1QlhVMmlpVnFLU0VVS3NTaEhCUXpoZ0ZwSEJD?=
 =?utf-8?B?a2pSZEdBREUxZDJIUjIxUEw1QVFzMWxxTEtzRGI1SHhJV2tLejVxWWJMbGY4?=
 =?utf-8?B?UWFBL000bUZ6Y2Z4Nlo4dk50YlRKV1FjWDAybDlLNjdrd1VKMitXVGlwNUt6?=
 =?utf-8?B?UTZ5SXg3aDQzNTZTd01NVjdVVStTNktHOGNqUFpNRlRSbzV0R0RwWDZweDNK?=
 =?utf-8?B?SkorZzM4dnJMUEJzR1NjVVVXc2pqdk95dm1KaytDK2UxQVYramdoMTFKRVlH?=
 =?utf-8?B?OUJIcVRFemg4aDlVcFNDUEwvV0lQaUIzVERlWFNHOStBVWdkT0xGZWU5S203?=
 =?utf-8?B?VCtuU05tS2p3UHhjSkhSOW1xN3Brck5ublNiUHpoMENUNGZIVG5aSHlIWllr?=
 =?utf-8?B?QVlNRUFsK2FxY0dMbzJnRlVCR21GNVl5bUgvTzRCM0FHTjNvRHdQVW1QNk5Q?=
 =?utf-8?B?WGUwbFhCeDRESDgrZGUwTDg0SUJPVUdsSGVLY2Z4ZW12NmtDbXdQdE8wYXFv?=
 =?utf-8?B?VWVGV0hMUHJ5emdGUmt1UjRjRGRJRys2aXl3RVJFS1Z1QnIwOFVnZTh4ZFc3?=
 =?utf-8?B?eVhyMDBydHZ3L1pML29zK1RQU1dwdVJTWXZ5ODlHRFZoL2l6eGxKVEVyV1Vl?=
 =?utf-8?B?ZUs5TldNaUxKbmtWUFpkR2pxazJ1UVF4M3F5eUI3ZFQ5ZG5SZGhtTXpzRFkr?=
 =?utf-8?B?ODBLc3p6NkdqSmNrcjk4SmIzOXR4QmxDNmVyTjh5S3BKdkRudndQN24yeUl2?=
 =?utf-8?B?MGpUZHZ5TEc2WC9DRmZkMVRLM3Z5OWtKUk5iUnd3V2xJUnF3cFhMLzNGaTgr?=
 =?utf-8?B?N0Y1MzM0K0RiMCtzY1VqNTF6RDRpUUdLS1ZSNnA5L0xLaW9oZGRCWFVSTk9S?=
 =?utf-8?B?ZkVtalNzdnJzZkFEUXBIL2lQbGpQZy9lSUxvK3NBRU9oL1NYMlAxS2kwaWtm?=
 =?utf-8?B?WUE4eEZYWU9zMTByRXRHejhTRG5MUHdKWldvYzdaYzZjeE1zSFMyWGpsTHNE?=
 =?utf-8?B?UTZ0V0VJQm1tb0hHRVhiUERtcng5S0ZUWEpadmkybG5jOXk5U21XWTNBQkNw?=
 =?utf-8?B?N1pLVTYwS0s0UTQyUWFNVUhXMEZYVWNvNjF5SFVXK2pIQVYvRnFiL3JOc0Rz?=
 =?utf-8?B?Qyt4WENrR1lGT2xaMEVmVHI0aFBOMHcvbXdwUVZEa1JlaHBUSDBWdWl4WEs4?=
 =?utf-8?B?MGloRDVBeGpvcTFtNTlueXpKR0IrZURWRmNzekljSlNUb2c5dVFzckNLYy81?=
 =?utf-8?B?aVRtOEFuNG05U0JjNU1ERDZmdzlURis5bWVINDNjbDBTcDNSeXNNSUpwV2l3?=
 =?utf-8?B?VnVVVDE5RWJ6R2IwUnVBdjhlbGJYb0doQmUvYkV3dVFTQlgyN0J2SGJTZ2NF?=
 =?utf-8?B?M0dnVUZEdEJyekE5RXRxdWtSTG1Yb1Y5Z29HMVZLOVlubXVoNkRKbHk1N001?=
 =?utf-8?B?WGZjMnBYdzFyL244VVRaVCt6RE1veUo3OVdGWElJNFFGKzFHbmNYdEpuTy9B?=
 =?utf-8?B?MHJVWlg1dVJzMGZneXU1RjhTYXZqbEJVQkV3S0FKVUlyVUlpd2xIWlEyZnRi?=
 =?utf-8?B?WHgvaHduSkpqdnQrcGZVRGdmRThWYkFSSEJoRHhGbUplZGNYRElhUjhndU40?=
 =?utf-8?B?RkRBSVhIdVNrZXNLNUtxWHVMU2NnUy84YSt2b0ZZbkVSMTBwMDVYMGJUNjVl?=
 =?utf-8?B?aldOK0FUUm95Vk1BY0xXdXFRc3c3NmpicFVERUZrMzBiaTBjMmVQeXFockFH?=
 =?utf-8?B?cENZODhCa1hvNjZ2aXVjSDZObXY5WXg1aVlUcGhMWnJlenhKRCtaT3EyY3ZP?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 497e99ca-03aa-4386-023b-08dcc5a6cd35
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 08:12:18.1232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQpSegdGfFVHeHRQkEZuoBxIe8xoEWSYZ6uhtcrzNs0z6dprKjyN9lYN45jYKIGZ4VEUp7wSJ0yUOjZeYYwUKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6291
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



On 26-08-2024 12:38, Poosa, Karthik wrote:
> Didn't find failures from HWMON tests from CI results.
Could you please check this failure
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137054v1/shard-bmg-4/igt@intel_hwmon@hwmon-write.html

Regards,
Badal
> 
> You can review this patch now.
> 
> On 09-08-2024 09:37, Poosa, Karthik wrote:
>> Ignore this revision of patch. Raised this to get igt results.
>>
>> On 08-08-2024 22:57, Karthik Poosa wrote:
>>> WRITE_I1 sub command of pcode takes param of u16 compared to u32 for
>>> READ_I1, so corrected it. Without this pcode shall return illegal
>>> sub command errors.
>>>
>>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>> Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical 
>>> power")
>>> ---
>>>   drivers/gpu/drm/xe/xe_hwmon.c | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>>> b/drivers/gpu/drm/xe/xe_hwmon.c
>>> index 832ea81faeee..617c8bdb8f28 100644
>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>> @@ -446,11 +446,11 @@ static int xe_hwmon_pcode_read_i1(struct xe_gt 
>>> *gt, u32 *uval)
>>>                    uval, NULL);
>>>   }
>>>   -static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
>>> +static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u16 uval)
>>>   {
>>>       return xe_pcode_write(gt, PCODE_MBOX(PCODE_POWER_SETUP,
>>>                     POWER_SETUP_SUBCOMMAND_WRITE_I1, 0),
>>> -                  uval);
>>> +                  (u32)(uval & POWER_SETUP_I1_DATA_MASK));
>>>   }
>>>     static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, 
>>> int channel,
>>> @@ -476,11 +476,11 @@ static int 
>>> xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, int channel,
>>>                         long value, u32 scale_factor)
>>>   {
>>>       int ret;
>>> -    u32 uval;
>>> +    u16 uval;
>>>         mutex_lock(&hwmon->hwmon_lock);
>>>   -    uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT, 
>>> scale_factor);
>>> +    uval = DIV_ROUND_CLOSEST((u16)value << POWER_SETUP_I1_SHIFT, 
>>> scale_factor);
>>>       ret = xe_hwmon_pcode_write_i1(hwmon->gt, uval);
>>>         mutex_unlock(&hwmon->hwmon_lock);
