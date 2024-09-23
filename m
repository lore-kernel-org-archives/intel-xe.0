Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C74ACF9C5B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 05:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211F510E379;
	Mon, 23 Sep 2024 05:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hRcUSR3a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD7D10E379
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 05:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727068211; x=1758604211;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=irnI1LqjM7DDUUZUAkbLA+8hwnt9XY2cW7d2cp3LmuA=;
 b=hRcUSR3aaZu6k4as1E8NYsgBl6x5qmrCjhHTj1/pkrYKuAwtEFtvXGzT
 o6MS4HSgQCnNWKiUoSqLQSIqDa6AYWnLd3wp7tou0TZZCCxMdXgZG1l+a
 FDb3HLA362iJ6bAwpD1Vs7D6w+R2PgBd+2i5COPmiAAHfdgo1ErXEhr9e
 H5byxPkr4yu+BRS8faoTvbc7kzvRIAygF7p4S7CYWvqazukdPasgq4oP3
 yBRSSB7CbenQJLd+EP0XPjd1Wc357Kf38N4ohymbQ6Jk8T+V9UzBVIx1X
 uGM/hevAa+D4LD4AROTEz4+KP/hlhkFHZMKVDdImqKkoj+BWnJwe8Uf6k Q==;
X-CSE-ConnectionGUID: hC1QSMdnQaKTO3M/WhtgFg==
X-CSE-MsgGUID: oWyBjFW7RsmriE4NUXplOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36570525"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="36570525"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2024 22:10:11 -0700
X-CSE-ConnectionGUID: HJm3LFCnS4SkjcPnrWByvg==
X-CSE-MsgGUID: E++H60eyQCuJEyWjue4t+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="71768589"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Sep 2024 22:10:11 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 22 Sep 2024 22:10:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 22 Sep 2024 22:10:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 22 Sep 2024 22:10:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 22 Sep 2024 22:09:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GU8jabH/QzCBWzzVzKJZ/id6TuZGgMqquf64eYup0sxMyTQngbL50mrC8gnxDSzDzdE0wPw4Uirf6Lv9nAMuWKeNPaVo0nGLveKx5vK42kWYr6CJD24Xb6RxGdtxZvngn4ohCRQVNUnCXyZGm8YuAO1anzdHtcRiXIlzXjmxcZoqMSIPj7dPbKF9muzZKNvTArU2dDAZgrpx+8k8swlob9aof0aXeOmULFd3W/laz53664HfD4ri4bBzue0696d9DxC8Y5dOnpJbeiICT9mwlVD05IvHu5TLhDRxY1vct7mvJvahp8DgEr7/NvdScgZvONENojLCKN6BEirSOOylJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5wYgZCbX52iwqop+KSTRngEDro3pbVffl6hY0C2lZE=;
 b=bvLLFxyt0JtOTf6T1Sg+U8dUns6jI6enTOCjrjneCPGR+c9c5bNLB67xOPiyekCQShOJujTYXOKz4XoxHZ4XqE7fWrYW4jsCdbjD3hQvjdCIZD/Sdi7gtX5vm2wFOj+7zqYhQsag737q5E2Zd9yePBASiHtNB+B6wwrHwasJe4/px6tFnw/vJy3fWYBAhywnBaB5g57H+dNhESM6lLB3+8LKFVs6H6lXENZmY/MXtmH1++ndPMe6Iis7K6xpuS7n6CySBpZcODA1rkfnbfvgHZ6yFoNoPtMk+bZAAceKANQR8agfVc/3bpEj7eGuX4/WfAeqOUZeeXvQtPLKImL0MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB8752.namprd11.prod.outlook.com (2603:10b6:610:1c2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 05:09:25 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 05:09:25 +0000
Message-ID: <6bda76e6-571a-4d3c-a46d-e8099c4e3e5a@intel.com>
Date: Mon, 23 Sep 2024 10:39:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Check return values of functions in
 xe_gt_shutdown()
To: <apoorva.singh@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240920105342.1798882-1-apoorva.singh@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240920105342.1798882-1-apoorva.singh@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::13) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB8752:EE_
X-MS-Office365-Filtering-Correlation-Id: fbde939a-ba58-4eec-5d4b-08dcdb8de476
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVlwUXcwZys4NkFGQ3RQdFR2cEg1dGxIcCtIOHhsaWNEZnV6bGM5T0djNHFS?=
 =?utf-8?B?SUdVKytiMUVTR1JlRHVxaU1BQjFvc0FEc3Y2YWVMb3RMenB3bnF4a0xRSlRY?=
 =?utf-8?B?M2FPYTRTaExTM0Y3a3JEWG45bWVEQkhxN1pTMkZYL2ZQQUI4RHdrbk1RM2Yw?=
 =?utf-8?B?SW5WWmdzMnluOUlOa3loNWtBUXpuQVBwS0p4Z2tYNFJ5ZTJZTzkxVkhnS3hW?=
 =?utf-8?B?MGdsaW5SWE04QmlTVHRTNHVJR0hhODdENVFENWx0NGxYakJ4SE1GWXE5L2J2?=
 =?utf-8?B?enNVb1phVzlOQmZublU3TUtyVUpmdGRidktaRVdlZGhpTHJHRUdPWHM0eXda?=
 =?utf-8?B?WlhFcWFySkF6Y0Y4dmlGa3dneTltN0J2akRlL2VHcW9iTVZxa0VQUlA0Yk9i?=
 =?utf-8?B?RlQ2SW8ydjNtNzd2aENrM3prdHFVaUg1TmU1YjN5WFJoRHVqTm5USDNHUmVo?=
 =?utf-8?B?UXJrZ3FlRi9LeTQ5R1dEOTltOW1GcE9NNEozTE5NZUhoUjdqWmlsRzAyVjNX?=
 =?utf-8?B?OWpCSFV2NjBEZ1hsSm9ERmJ0SFVnZmdPdlJ1K2N6bWRWYmpJWUZVa29QTG4z?=
 =?utf-8?B?RlkzNUZyM05tOG41cWhrMWpBSUlyeHgzMnZBazJhQlNCdE1HREFZNk9oNzUv?=
 =?utf-8?B?RndPM29JVVhKS1ZKWS9oMUhxWXhLUmZhU3lJSFQ0V0xUbEFQU29BN3Y4M1o3?=
 =?utf-8?B?V2daeDNtbFdCRzB2QWdXNzJqbGZtRFRhMGxlVFVUSjA3VHZmbFpqcVFlMVJl?=
 =?utf-8?B?TXRNVERWU0hQYm1WaG5TMjNDcjdYcVRFN1hDVXVrc1hOTUxDK2dHTHJTSnZ6?=
 =?utf-8?B?Nk9qSkwvRm54K29Sa0c4L1JoQnVLdzhwMEZ5TkdmK3ljc0Y2YlNxL2JWNjFu?=
 =?utf-8?B?K2pQaUxJNmRzUmtvNmdBQlQyNGdPYjhjMnNPZ0VsNFRCcUN0TnU1WEJkSng1?=
 =?utf-8?B?RVNDNWtuSWN5UnljalNTQUxqMzNzZEVQQi9mSHBGWkh6cTR3R05MZVpHWDFJ?=
 =?utf-8?B?N0c3QXZPMFJTZVJjUmhJWGlzM2NEUkNnZEcrYkVHQmNuWkVQYXJuTVViZFhC?=
 =?utf-8?B?dG5jT0Rpam9ETlVsbE5hWnlKaUI2eHdIVUV1NDVwN1J4eGxHTGVPQjdyemx3?=
 =?utf-8?B?V0JkbDFQRlB5T0w2ZCsxaENLZGhML0pKamlsNUtYaWcwUFBNQ3o1ZDJMMjVC?=
 =?utf-8?B?cCs3R01JdkhoOFhTSmtvbHBPWkRzMkgwY1FGY2dpaG1TQ294NUhaWlhBS01T?=
 =?utf-8?B?OGdJanc2aVpaOTRYOWF5NEh3L2l2YWIwWFZxNzJ0eWQrNGg0dEFNRFpvckRm?=
 =?utf-8?B?TzFXc0FWTlIwNDQ4VkhyOHd0cng3YkRKYmVNMVJ6Qm8wcUdZSCtZV1ZmOGFj?=
 =?utf-8?B?TS9JRFloZ1B1aXpOeDVnT0dxZGpmZ2NkclFtY3FNVmVPdEllSzFBNW5DNE42?=
 =?utf-8?B?Z3F6V2FLQmNVQWZpcEJQd1QyeXgya2hBRDdDWHBMMjRwb2lIR2dycHp5Z0Fr?=
 =?utf-8?B?QUFNTk5KZ2NoTWdlZmtWTlRMZVRUSTNRalJmeXhrN1NhbEY3eVYwMXllQVFC?=
 =?utf-8?B?SWVUaWpxL2VvRWRJRE9hSnk0bGZnZ2FySHdKTndXZjhxelBUbDdJT3VPZGRs?=
 =?utf-8?B?QnJ6VUI0eGFnK0FHZjRrZU1KdTNEeGlmZ0hYZHJUS2Q5ZWJRdDdoMlJYN2tW?=
 =?utf-8?B?VjNQUE9kbjBId2J3U25DOE4vM2MzRHYyeWN6YU1IeGEzZjlVZ3doZzB3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkxuNWowdm1YQTVxOFNSNmwzMXJZV3FWbE5udHI4WDFWL3JodUJGOS9RUEpV?=
 =?utf-8?B?bmQwMDJ5elV6T2FhMUoxc29GaGtGaTNVUjBMSHlPRVV3VXFUeWR3N3g1aSta?=
 =?utf-8?B?UmtiektQbkZqUDQwYVJCMzBFOE0xcFRhWEFuQkJENTJvaHhQL3Z0RzJpeVY4?=
 =?utf-8?B?Sm8xSzlWbWVwalExSVRBRW1teHJqUDYwVmVBV0NIa0U0RHc3SWtISzd0cUF0?=
 =?utf-8?B?Y2d4K0VwamxqOWZFek5IY0Y2MTB1V3RqczVoY1NXSDc2Y2dsbHk5ZzJ5SUFl?=
 =?utf-8?B?Slpad1Z3Wm52VmVnY2lFNnFsVDlBUnNZRmdnUFk3U05Ld3BBdzFING4vbnBX?=
 =?utf-8?B?THJDVllpUTJtWjRGMFFCaDcwVHc1Snh6V01oekR0bXBpak5UV3JsTmpMeVVy?=
 =?utf-8?B?cXV3NXMzZTRCSTU0VkIrdE5nU2RjeUxMN2w5M0xqWFBUbWd5SCtXbHlSc1M0?=
 =?utf-8?B?Y0IwdHgramNrL3JzVmZYbXhNbHY2c2p1TXFacmcyQ1Q4SEh5YXdRSEw2Zkho?=
 =?utf-8?B?RlROcnF4TUpmeUJReVBSYitwdjFaeFpnRGNNMEt3aXovMGtmMlBXajEwLzZ6?=
 =?utf-8?B?QUh4NkJhNTNIaFVncmVtS3VBd3dETjA4YmtKMU9pMU9hNDNZMHR6ZjhsRWI1?=
 =?utf-8?B?bUcxRFF6R242U01Qa2gvUWE1YlBLSzh0bFh3M3o4N3RlMnJRWnhzelNMN2Ix?=
 =?utf-8?B?R0RTM0FWRHdYK1dZL0EvdDF4cmVReHlnVGlQeUg0QmNUUi83RzQ1Rklkbk04?=
 =?utf-8?B?S2VZV1V3bGNaSHdYcHVXbjByc1A5MGpjUFhiRVhpYkk2VFZ6eVJkRHBaWHNh?=
 =?utf-8?B?UU5aVTJ0bGpoVSt1b2lwcWlFNjJGNWRobitBUFBTWDZOMEM1N2JlN0ZGRGhT?=
 =?utf-8?B?L0RhTzYvTFIzVjhVbk9EUmUrSmJGVzJVZ3ViWnYwZ0V4OXJWUWdyeVlaT3RV?=
 =?utf-8?B?M3FsYXFtYnViSU1wZE00VjB1eGtQdmlhcFRweUJMclloUDNJREx0ZEUzZ2NH?=
 =?utf-8?B?NFM2SG5LR1hTWW5CYnduOTBzQW51NjFRLzQrTVBXTVd3ZUIvcEZmZzVaQzlM?=
 =?utf-8?B?a2wxam00eFBNSEw3OTMyQWwrYVlwbTBRaEtGc3VoWmVKTlpKbHluVnFaZWph?=
 =?utf-8?B?QWFzYjlNTTNOVGF6M21CaVhLWDZpNFFmeklnK2t2NHJ4dmw3WXVXd2MySXEx?=
 =?utf-8?B?aXU0Qk1hOWI2aDgydzBOWGNhQ2gveTJJRjdaZjc2L1Bvb0tBUTlrSXEzS0xH?=
 =?utf-8?B?REo4Zi9XcWJXNlBiUTBidHc0WncveG9xZEdaN0sxN1dnWnBmWXlwSlJ1Qk13?=
 =?utf-8?B?aHFNd3pmdjkwcnovamFyUEFsYmlLcHljNkVZb3dENVVLaDZjbkJ0ajVyQ1JL?=
 =?utf-8?B?bHZlZ0x1clFTa2VETWZVS1M3ejVKZjVHaXJKekVLR1ZQdXdVT1RLd29GajJJ?=
 =?utf-8?B?TnFhMkhTWkRvU0E3Y2d0cDg3KzVHdnowVHJlREwxR1pZZ09oS05BMnlvT1lr?=
 =?utf-8?B?c0FTVlJqZ1lVeEErRDl3c2MwYnlscjJtZVA5V3BtU3NKVWJMMzhHT01JNzZU?=
 =?utf-8?B?OHZDcDFUMkFpbmlGc1c2WHpiV25lSFpkbkt0dWlhWmFrc1JrN1ZZSkowUCsz?=
 =?utf-8?B?Wjh4ZFhLNm1OKzVTQzlEbHoxQzhhYVNweUNndkRScDl0Zkx2a1RKV092eVdZ?=
 =?utf-8?B?eVUyK2xGa3FuZ1FkNVY5T1IxOG1lcWJXVjRMaEZFNTV5N2RtaGVtTVBvUk51?=
 =?utf-8?B?Zm8rZ2lnd3REdTRvWGwvaU1qM3NnV3VVMWJVcUtCTUFCcGgrbTh3NmdWVFlJ?=
 =?utf-8?B?SjVGemdPUWV3ZWhOU2NmUWlpWGtaQjlwcExUc3R2QTJ4RXUvWUh0QmhhRUtm?=
 =?utf-8?B?VndkRVFLa0tKQ1lodUJlczhpZFNrZEVaQ3Q5Ui9sNm1GRDFxQzYxcWp3eEpp?=
 =?utf-8?B?NXFseDBtbktZQ1phQVVncmZFdDdNek40OVdhK1lJRmc3ak9VRFZ2WEk2K01M?=
 =?utf-8?B?OHl5ZXZGSVdWc3hsdUZOU28zWDVEMHdRbERhaHRqSi9YN2ZOMUQ1MUNPeXFv?=
 =?utf-8?B?aHZUbUlxZW5lSEc5U1llNGlmamJYVkRlZ1dJaHI1MkE4R2lmaCtxc3lQMzZs?=
 =?utf-8?B?R0FkbmlUOUF3MzIzSnhzRVYycnhSQ2FjWUdoYWRHcFpnRWNIejYxQXV6NTVB?=
 =?utf-8?Q?rbO+raUk9RiaCyTwgY/a20E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbde939a-ba58-4eec-5d4b-08dcdb8de476
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 05:09:25.2403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4FJ2azl79Ws+EMb+Sz5CFiFCW0SxCW7wt+JbMN39X6lfVGmY5mBbp4yDj0XAK+JlOJ9BnBnPpILVYzbudQQyduEGTll0YRFZilj7/NDEdzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8752
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



On 20-09-2024 16:23, apoorva.singh@intel.com wrote:
> From: Apoorva Singh <apoorva.singh@intel.com>
> 
> Put check on the return value of functions xe_force_wake_get()
> and xe_force_wake_put() to avoid mistakenly considering error
> values as normal values.

Will it be possible to rephrase. Something like,

Check the return values of the functions xe_force_wake_get() and 
xe_force_wake_put() to prevent mistakenly treating them as void returns.

I had addressed this in 
https://lore.kernel.org/intel-xe/20240917122126.438448-7-himal.prasad.ghimiray@intel.com/, 
the series might take more time for conclusion.
In the meanwhile lets go ahead with this patch to silent the static 
analyzer.

With above addressed:
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> 
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 274737417b0f..eaeaae1df198 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -890,9 +890,9 @@ int xe_gt_suspend(struct xe_gt *gt)
>   
>   void xe_gt_shutdown(struct xe_gt *gt)
>   {
> -	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>   	do_gt_reset(gt);
> -	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>   }
>   
>   /**

