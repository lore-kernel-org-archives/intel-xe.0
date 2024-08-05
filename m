Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC4EC3DA4A
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 04:17:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0DC10E121;
	Mon,  5 Aug 2024 04:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LlVSdN99";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC3710E121
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Aug 2024 04:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722831447; x=1754367447;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Hqj6+Yd1ZxvOnAiV/Nh4+gHosaT1LxZZqYzLNx9/JcI=;
 b=LlVSdN99bB81TamLjEBBcPCuOqAJ24Hv2ek6Vdj5TB7ztIKIcJpk/5jX
 j8lcN1Sn6LbFGr/gZDGTcjnO5siAtnlQuKm+xp+fMd7mAdUXoiqQJM2vM
 jo6fCGMtIvihtVA3oBwxnPcwUfh4pgOi9CHPUUFbSzlmT3yeBGSAocy9K
 U6B19pdhSAAqHOsxBkQs14MdF6pSft5FC0KAfh9vC216aq6X/hjrqdNzk
 lNG85d7+6oEMSH+cDSwUNmJu+nbaDtZJWqCK0iA4r7ZZpZSUouDVrNk+k
 bsyyA8seYRKCJ4j51DvTE0GK1lF/ABJr5mXyWB8tod5kiYjl1J1GfJ1eY w==;
X-CSE-ConnectionGUID: 42145R1RSTKj4zv9vavjNg==
X-CSE-MsgGUID: yAncBSJuSLyWf6ff80BV2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20351737"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; d="scan'208";a="20351737"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2024 21:17:27 -0700
X-CSE-ConnectionGUID: z5YtsGOKTCKqBQlhs003mA==
X-CSE-MsgGUID: 7A2pKONVRW6dz1J7H/ovgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; d="scan'208";a="60865032"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Aug 2024 21:17:26 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 4 Aug 2024 21:17:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 4 Aug 2024 21:17:26 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 4 Aug 2024 21:17:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvnI7Lippscj3aqhqd+D5PEOMYj71/hDIi4xQqIbDiUOEkYRsXr1ASNU9ygo6+RnIw/eP8ruO7AicQ17Z0nIzYVVRb3kHZJkmHf51DH6vkoveIJlcew3RKX5bKX9yN+nkFEOY7vPyskE8ems7WngT1Lf+338t5wkrsfH4fQFju619MdxntwxcXpZbN3Q42mQxdNNG2fmLfJHIYMMsJWrK0HPk8Eb4DfrM5XjSr38PR3QA79X4xrlLgWH4Qc++548MLo7fPnHgdXzZuyxD/VQZgoyUoVLNlk0OyxpvQ4npjc+2APkPT9bIjj0FwrFEQGfAO8+n5KrvtFa+EzewEe37A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KAhh5qzvQIo5xr8kN3Jr3mNf0VMNbUePmrD2OVWfjA=;
 b=VH+b6nh2BAlr5M+jiS7NwvBRzVTdAQyO0YEcrYcOP0alec/WJNJEl8544eyFloes+3ScSSrY/NtoBrg4WQKbw9TCsTNDgq+Bk8L2pdf0NrJSZu6m2ITF+nUupp1cujBbM2eBg67/vKyHQBDR7lFTnh5PugzWBZCnFZ9wriZjbf1T+968xeinOpCksePXUjgDbmMFjgyGD9s1Ffx98Q5Ghr9JMsCOLHTdWpsiqFsYd6jQKlyNA90ZXxf+1zhZOhRNFFEzrTO3y7rCU8TgdQDD9IIyG+w8cCdGvt3lG7YTlweHnCYmLZp8vDnawxC6U7cZ/lIAPRartxsDRfMD4dOEEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by IA1PR11MB7294.namprd11.prod.outlook.com (2603:10b6:208:429::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 04:17:24 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 04:17:24 +0000
Message-ID: <e194709e-5237-48d8-8dec-7e280992142c@intel.com>
Date: Mon, 5 Aug 2024 09:47:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] drm/xe/xe2: Introduce performance changes
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <tejas.upadhyay@intel.com>
References: <cover.1722607628.git.akshata.jahagirdar@intel.com>
 <c2dd753fdc55df6a6432026f2df9c2684a0d25c1.1722607628.git.akshata.jahagirdar@intel.com>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <c2dd753fdc55df6a6432026f2df9c2684a0d25c1.1722607628.git.akshata.jahagirdar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::12) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|IA1PR11MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: ae2573ed-e92b-4483-90e5-08dcb50581dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXkxNGliRFRLUFFIYTNDSFRKVGhib3Z1MHMrVkNmNmc4N1czZlU0SWZ1N2FE?=
 =?utf-8?B?VWlEcnRrUWh5OFRQbTFhbkhoTWR4WWFnb21wOXBjM0I3U0hGTC9YL2RWRkJR?=
 =?utf-8?B?QkxvWW11UTZRSE9YNnlnajdzUlU1Q0Z6eU1GaEUxSStBMDBSU3NINXZQWjVN?=
 =?utf-8?B?dXpHNURwcGZXeGg4WmhWUUp5S0V6UXFuWGFqTVFicjZmcEU1cldTbUJEbHo2?=
 =?utf-8?B?QnNlTTBEUXNYU21SZ2p1YlU2WkY3MUduczNBdFVzcXNRYVRtUXhEZ29FM1I4?=
 =?utf-8?B?VFJ5eklTWTZDQUM1dHhPQ3NMeE1LNVl6Vkx3c21SR3p0NWYzWEVwZGNIZWhW?=
 =?utf-8?B?eUltQnBwMjByc1Y2RXg3ZWd5bFhiWU9RUVBGaXRRcWtBWEdwa0s2MVBGU01I?=
 =?utf-8?B?bnlXbm1GSEFOV2g2Uk1vN2JrTWdtOHRXR0RMcnRYYTluUUozcHQyaEVKTVdN?=
 =?utf-8?B?VmdvZzdNVFZISkJLak9tUzJ2STRYVDc3OXo4YS8zRWFzQ1RHMXNIQU1MNEJp?=
 =?utf-8?B?UElyQW91YWIyOFdzaU1SbG1SMHBhSWovT0dxQVBrQjFSMXJobTZQaHd5Uk5l?=
 =?utf-8?B?S0N2R3E0TWVXbXJNRGZUM0ZZbjVDZmRrc29USzYrMVAxdlhjWVJuaHZ4MHVN?=
 =?utf-8?B?UGNpUWhBWmlwbitDWGJvclBsWDU3NzRmNzdobWR2RlVaTThRdHFabk1XcXhm?=
 =?utf-8?B?cVg0MkZ3QVJ1RGZ6RExleDIvYWMycXZJMDBOWnE5T0s4YmhIR0dFdmhqNTJK?=
 =?utf-8?B?b1o4dENaNFVUR1RwRUcrTUo5dEpjbmROQjJHdHArYm5zd1ZxQ1BxOXlETWE4?=
 =?utf-8?B?SFoxYXBwN2IrOG84ZUI3OU1tSlU2NkpxL3JTYU1qQ0x6UDRHUnV1T2R0VUU0?=
 =?utf-8?B?cHNINThzM0wvWVRTT3huSVY0ekNjeWthZkQ4N2hJWjRDQkhBYytyMkU1c2lO?=
 =?utf-8?B?VS9mYVNsTVYxZjcyUXpMWWtPeVJrU2M4K3JMcHRUKzVCajhqeGNVaVczWkVI?=
 =?utf-8?B?WkFLUm1nQ0U3WTZpcko3VTRtRmd1NXAzWlVhZE5EbzhqalFxUW8wRTZCMWpC?=
 =?utf-8?B?WVVmZldRTW0zYWZ4TnE3V2lyOFJFSDA0MThLVjFYQWgyRFVkOVJTK1NXZERY?=
 =?utf-8?B?dHJ3U1NDTThCY01vTlo4OUxMZkkyWDFoaEFvbWNuWWtQTm9hRFdHZnBRWHQv?=
 =?utf-8?B?VXMwNUl1c0xqMm5McWdpWGlnK3A2cGo1QXRDRU9xTEVzeHJONCtDTjV2ejNQ?=
 =?utf-8?B?bGxFWUVZZDhTYUF2SVQ4bGkyRGNZcjhlc0hETURRQWIyUTc5NGZncFFDMVlR?=
 =?utf-8?B?MXkzQXJyK2wvVlE2dnJvZkVxYmI1MVJBM1ZnSGhNOXdJZWhZZ3lBbG5iaVF5?=
 =?utf-8?B?eE5xNDlZTjU3aE5GRU5pbDRCNUpvUE9rU1JFR2NCaFFDaERnU0RVa0gvY0ZO?=
 =?utf-8?B?c3I5WVFVS1o5NzRvd2RSaHYwcHljeDhXaFE2MWtLYkxPRVpQSDJmMEhkMUw3?=
 =?utf-8?B?RVhhOFp3N1RycU9qcFdHZjI1Y2UyNGpsZ045bDVVMEw3NWNXNzJVN3AxTnRr?=
 =?utf-8?B?dHR3Y3MyNy9vYTFobnh5OUlnSTlRdTFNdXlYUWFrK2pXM2tJQm1IU2dEeTN1?=
 =?utf-8?B?Mi9JbE5idGJKemZDTHgxRHdvRU5EbnJqNFVDRFZkc2k0c2grMzRKdXlidGl5?=
 =?utf-8?B?YUg1VnZ2NmkrMG0wa2hrQjloVExnTkZWVHBjYlZOZ2lVRSt0K1hQTHhuT2RM?=
 =?utf-8?B?SE93ajdpRmRMOXljTlBDcCs2Ny85citXTlliWEovZFdBMldSY0ZsVnhmRGlR?=
 =?utf-8?B?c0orMmlTRnBVU3B0VkZlZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHdoVThwS0QrNk8ySGhSdGVTR1dubGlwY2NWYVllN1gvd0ZaUXlhV01ubnBI?=
 =?utf-8?B?VnJPUDRhSDBSeU0zSDZYWGZRZTI2aGRBaUNMTmdNeWFTVXhBMjlzT0dMOVgy?=
 =?utf-8?B?S2xHYnZMNVlTLzViUnVhS3k3UUhwZUZSOW1UeTFXUEpMUWFVTE1rd2Y0OUIy?=
 =?utf-8?B?dzlQQ1o3OWJvWXp5aWZWTGNEdnN0N24rcWZEbnYwR252VXpaSTRzWitGejVE?=
 =?utf-8?B?dUU5d3BHZWo3Y3FVMzRHcUlmMnp2L1JkMkNIVE9VVW1maDVvcElva1gzejBw?=
 =?utf-8?B?cGplNEJERWttN2Z6R2p4bEh2QXluSFFVZHBqWkcxMU50NW5yOHZtR0hna3Vm?=
 =?utf-8?B?NGNDODhGT3R1OGw2WFNSTDZaOStoNndnNk5DU1REWFN0SEVmcFVvTlFqTy93?=
 =?utf-8?B?dFkwdGs0Q2F2WU5Hd1Z5WDNDQ1BYdTFoRkozbU1Cc0hseDZSQWtHVzY5M09X?=
 =?utf-8?B?MENiN3ZTdU5QNnhicEpOQVUyV2ZBWHRadjlobW13WHRlRWR3RkRGVFZnMEQ5?=
 =?utf-8?B?VHZTS0EwanN4QS91WmNML2dYS3RieFVvOEszTHFLbmlESW5USnpLOWZ0SU00?=
 =?utf-8?B?blpRamFDdEkwbTNncENGZHFnWFljZDE3Y1hPR1NOaEdtZEJzMkprTnp1aWVz?=
 =?utf-8?B?RUc4NmtXc3E4NlltcGxzTndnd2FCQWZMNkJJSFpmYStEam9KQlNza0tJRDBy?=
 =?utf-8?B?YTZoa0s3RzhzQTdFVm1CaVRNcEh0TEFTTkFOVG5DM1E0Z2pMYnNDNmdFMEVm?=
 =?utf-8?B?ZGpsdGVYQzl0MHYzOENCaUNzUm80Y0c4RURGL2FIeWNpTmpBckV3NGQ4ODRY?=
 =?utf-8?B?TkJIQW9IdmZKbHk1aVZtamh0SHNVbU5NUG9OOHZFR3l4TXFBZHJxdThnejh2?=
 =?utf-8?B?WGFPU2l5YUIwQ2hTa2xXZ1MzdjcwZzdaNkwxM3JFcGpnQnVKYlVnUTgyQk1D?=
 =?utf-8?B?VFZCakYrN01XS1VPY21CR3FMOHFKRG81L01rMTRHYUhxaGNiWFpDVTBxSWpC?=
 =?utf-8?B?OENOTy9zZFlzSSszc3ZvbWtaVjN5WXpMbE5VMmFhaDMwelY1NUprQk8wa0RZ?=
 =?utf-8?B?MUVqMzZDbG9NQ2c5bWxQOE0wTFd5SXV3TkliYmpja3JYaS9zU1pkMFdGV2Q5?=
 =?utf-8?B?VUxnZ0JJU2NISDVCNFVXQ01kM1kvaVF0UFBnK2lXQVRLZW94RGo0RHlzZ1di?=
 =?utf-8?B?TDN1UFp4OUNaNkRNcWcyV29VbDdxU1p3TzFaRXdDK2VzK0dlaHZXd1pLOHpR?=
 =?utf-8?B?UzZkQm9BRW5XVXJxS01BRTZTLzlqcXJDQUtubVhlOVdkMlAvdHRlQTFHejlR?=
 =?utf-8?B?TVlkV1IvODlJakYwUTNXMlBLUHUrNzFkVDBBbWxQeFUxWUo5d05rZk9YVTkz?=
 =?utf-8?B?REpaclF1bTFYQUtYVWN2LzA2WEQ2djdpbFNGZGlGSWpQZWdmMFRXMk05dG9v?=
 =?utf-8?B?RC9FbFdMZ2NvR0pMa3M4UFRZSFhmYVR3WURkZjgzNVVYbTdpckM5L2xVajFJ?=
 =?utf-8?B?NnA4akRUZWlwUXcva0VaVXEwTU1wWmFIcEx0T3lNNXprN0c0T2VhZ216VU5H?=
 =?utf-8?B?aFY4d01KMEFWZmw4SXdKMUM5MzYwR3lRMCs4OTczMjdNSkVua2tYL1B1bnhJ?=
 =?utf-8?B?b0FxcDI3UVU4TXZHOG4rTzJPTzF6N3FycngzSWVoWi8zRXlzaTNzNTN2d1J3?=
 =?utf-8?B?SWlORnJtTHhUWXlzTkNGVWlBbWtXOEtLVjVMU2VxM3lPd2tZN1dZM0QvVGFC?=
 =?utf-8?B?clZjdHM2UFVhTGRYVDNQM2JISk5kSGl3UzMwL3BSaHRGQ1IxbEE3RTNQUHB0?=
 =?utf-8?B?TTdKQWl1RURSS2hRMzBaMG85d0FsU2lvWEJZWDNmSlhQZTZzb0lxU1FCcExL?=
 =?utf-8?B?VENoSy9Oa2NlWnl0cFJmNjJJNXFLSkFTN2pSS0xtRlhHUENOazIvRDIxeHNS?=
 =?utf-8?B?MnZDaWQ5TW93ZElSdS93QnJGRDdYQUFEelgxZ2JlYy9sZGZBTTBERG9ielkx?=
 =?utf-8?B?SmdoRFVVRTY5c2VaNkd6d3FlNXloR3B5RDBVdjRTOFJBeXRSWDFqaCtVaDJM?=
 =?utf-8?B?QmFvM0F2NWszSXV0SVNxSXFSRk5jZjNZbi9GNU5iNXducTRPRVRVTlNUcFFa?=
 =?utf-8?B?alpsMStXWFFyQnlOV0JpRWgzNUVoSWV4QUxZUmxJZUQ3QzFTWnBPK3Rldmxt?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae2573ed-e92b-4483-90e5-08dcb50581dc
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 04:17:24.1057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v7gWiU39tBYzqk1t6DdW2B+js2dYDoxtoZIMUF8ccegHC0QSzuZnZGveaRyplqpVaidMvfJBn7xJDKuHDPAGMbwfk+1Y6GYzsoFJFEGBr+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7294
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


On 8/2/2024 19:42, Akshata Jahagirdar wrote:
> Add Compression Performance Improvement Changes in Xe2
>
> v2: Rebase
>
> v3: Rebase, updated as per latest changes on bspec,
>      Removed unnecessary default actions (Matt)
>      formatting nits (Tejas)
>
> v4: Formatting nits, removed default set action for bit 14 (Matt)
>
> Bspec: 72161
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
>   drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
>   2 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 3b87f95f9ecf..c50643ab4c84 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -367,6 +367,9 @@
>   #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
>   #define   XEHP_LNESPARE				REG_BIT(19)
>   
> +#define L3SQCREG2				XE_REG_MCR(0xb104)
> +#define   COMPMEMRD256BOVRFETCHEN		REG_BIT(20)
> +
>   #define L3SQCREG3				XE_REG_MCR(0xb108)
>   #define   COMPPWOVERFETCHEN			REG_BIT(28)
>   
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 77d4eec0118d..3817b7743b0c 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -45,6 +45,11 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>   	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
>   	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
>   	},
> +	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_ACTIONS(SET(L3SQCREG2,
> +			     COMPMEMRD256BOVRFETCHEN))
Can we merge this into the same line, or any particular reason for 
adding a line break?
> +	},
>   	{}
>   };
>   

-- 
-shekhar

