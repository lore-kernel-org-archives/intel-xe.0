Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45C7CCA470
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 21:52:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9AB10E160;
	Mon,  6 Oct 2025 21:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="INfEEptW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1385510E160
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 21:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759787534; x=1791323534;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=3Wd35nKmX1doueR0hmDBzqFpHtsOcLjldPHmx2LczUQ=;
 b=INfEEptWzes9ZTBInq5/z7IoqWCbhgBd6NDLLSH56ERUfbo16nQwuJjB
 YyxxbbKDND3OxlDIrjISaH3TvJte7Dd2Ps4pG2Gyjg+Rs8XHSrf9Ol7oU
 Tp7tOCzj/EmI6941nhLqBjQP+gP41ol+xeJE6MMZKZFDm7aLTZnn+dFag
 JXeuZjodrmy58BZDfhXDJnqfDXF0XixmSLGs3x4LVkStFixtIeXCiwGnv
 PL7ZWmmzBlqG2MSaVmSyo1Ea0o0gbLoyybvgYLpVHx8Q+DddcglMLk7Mh
 7KfFeH2NBeP+x0ksLvJLV6C6DE+nu4XwO+5XfT37CNW3xfbgFE2RP5uzG A==;
X-CSE-ConnectionGUID: H4+8WSlMRV+57zkGKJuMLA==
X-CSE-MsgGUID: 0OAMHJHXTN2e87S3LuCGZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="49523183"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208,217";a="49523183"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 14:52:14 -0700
X-CSE-ConnectionGUID: LppobU/DTtGDEtn03cHZxQ==
X-CSE-MsgGUID: GkouhmdjQAmrQu90KSpQVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; 
 d="scan'208,217";a="184355396"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 14:52:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 14:52:13 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 14:52:13 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.40)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 14:52:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FPVi4gg6XL/O6Flo4iGp6JUk18+CKnLzsdwEH+tu1STneyjUOYTT7M5AdZ7wzGGeA8tchbT49n28aM9pe5ZOsVYR+Za7aFpjol4z/yMfgDb2iIBEMXkn32+OXCUE95NEIq4kZEWnkfWzZdk0NblvcvVxAdJATQR3W5GFvJDAyq9u1jtro2V0rEJfzCkt1sllsHXTY5S8uNCVyrlyUIz/o/aaVO0RVOAoan/uqFndF/OaKNh/AEZVhDRDsGOKb5noSSIUFuwp2admsZ8YhIeoaCeg7shSc2EaWFtm9xYlnGQpEJ4BKNhJC5fAgjbkF74mHuxMJi8oYWVklOWW8+19yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ZUoD2sMLSyjED63/I0KEE6kIpnBaxmMN9fTCURgpao=;
 b=JjZpGq5F07dZ81420Ehs8LX6NcT66nJ/+2r3KcS8oHnBXf9yqUjkno26HMpXhYo4A6FMdn0SkoTYDkgRpzXT/blVN7aXP47eNUqJxnC6PCb+AQ8/kpw5XdoS3Fxo3mTZERcEEVFZlNp3Y+Rn0Txv6+nCZu6oWb2exzMtUVkanDTK1SPD5K+FGE5CmcYjOhRAbfBVqCrc+62oNGLPsxcTn6c/glsOI4hrTkb5Muhleufmq1j7HomBuM/0ELwMkVu8BP+NrLDlmkA7pmiRJP7x+RXoSiMOpxaewaoygc9h7LWg0kffi2m3VbFeILosd6m9HjJtEqrDb4YekuZ9lNXsTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by LV2PR11MB6048.namprd11.prod.outlook.com (2603:10b6:408:178::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 21:52:01 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Mon, 6 Oct 2025
 21:52:01 +0000
Content-Type: multipart/alternative;
 boundary="------------6CHAhgQmFzBhq9j9r17j0Yfw"
Message-ID: <8f29423a-dde6-4a7a-867e-a8ea4e258cc7@intel.com>
Date: Mon, 6 Oct 2025 23:51:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/30] drm/xe: Add NULL checks to scratch LRC allocation
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
 <20251006111038.2234860-2-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20251006111038.2234860-2-matthew.brost@intel.com>
X-ClientProxiedBy: BE1P281CA0195.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::12) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|LV2PR11MB6048:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ab29c53-a754-4876-b481-08de05229475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUVPRUx6aGNvRjI4Zno4VlNmS2pYR3FUS3g3dEc2NHFCRmY2YmUwQzZJTW9C?=
 =?utf-8?B?VkN2Qm9Nd3dYYU1sVURNbzFBTDB0Q01UQUNtaVhzWXBoSEZyZ0FmSWVpRjVm?=
 =?utf-8?B?ektXUmx5NENBU0tCS21kZmJBaks5ZjZFZkxLQnZ2MEEra0J3d2ZsNlV3cGNS?=
 =?utf-8?B?R3J1TXJrVi9iUXd2VVdrRkp4U0RKbFFRY3dYVkJvekN4MjgxRm4rUjJEZlVw?=
 =?utf-8?B?SmZ3QmM1dk5raGRPUmhNSVlIZXBPRFZRdmpkWmdVVkw2cFNSVTVJd0RiN0hQ?=
 =?utf-8?B?cmQzczBBVks3MTl3QVQxTTBzbEgxRFREZWpmQ21jdmduU1JMTWpnYm54blAy?=
 =?utf-8?B?c0ZLOG1DZ1M3bjJlS0xMd3lYT2g5YzBrSk9yUUtZK2U1UEJnM3B5WllkWmwx?=
 =?utf-8?B?Y2Y1VWFNQ3pmN0NzUm5VRTlybVFnbEVnVFdBcjFLeHFvWk1HbTY4VXJScHlJ?=
 =?utf-8?B?NzlkT3daeHNQRHhRcXZZcFZoc1ZzRFNzQ0g2K1g4TE1oSDJuOTJzZzV0V2l3?=
 =?utf-8?B?RUtWdmVGaFZEM0ZrM2JjOG10c3R2SmxHS29uUVZaZWtpaDZ3SkllSzF4bnVm?=
 =?utf-8?B?QkUxVlJvbWlScC9YQkpEbXlwS0ZzcWFuQ05uMTdWcVFVaHgyL0EwbHA0OUJO?=
 =?utf-8?B?bGV5SUpyNC9JVVBQYlppUHNUSGtZVG0rLzgvc0gyeU9jMlBYb1loYllMWHlV?=
 =?utf-8?B?akM2dFg3OGtMbXphc1Q5aWI3b05EMEw3SW9LTHo5NENOc2RHcWpmYlQ3dE9O?=
 =?utf-8?B?QSt6U2ZEMlRtZnZRRUdBZUVuM2hGU0VUcVNSVkhRdXVCU0tIOXlwb0t1aVNv?=
 =?utf-8?B?clpscGlnaWdGZWZlY05FdVcvMTJqU2pPMHhEYkk0L3ZqbElPY2dBWlVrM0Ru?=
 =?utf-8?B?RHVSMzFkRUtKL3ZvRGFNNDYvN2x3QjIxL2hGdTRnVnJIMHBDRkMwSGJUdnhm?=
 =?utf-8?B?R2ZMU2tkNnB0cjVqeWN4dyt6YW9adXBmMFVNUTY3TlVLRGdTUUM3dEw4ZUxL?=
 =?utf-8?B?SXRpdWpEWGdRTDRjclM0VzRDbTkvVC9UQWdLRll4OTNDajJ1QXB2N0V4dnBE?=
 =?utf-8?B?NStoYTU4U093Y3E1L1JXeTRISXNrUnlVOFB0akFNTGN4K3ZRaHdUUUlJMnh3?=
 =?utf-8?B?Snk2cnZzekFtVFU3NWpNOUtzRlkzUXJVWXl4Zmg3QTUrNGlMeGEwT3YvOW1K?=
 =?utf-8?B?eFpRWE1PZ2ZQOHljR1RJZDA2dEpGQkJHdTI2TXVlby9LMGdsWmtUREljZDMz?=
 =?utf-8?B?RVR1TytjWDM4YUFjeFFmSlphck9NRzVCVUlkUzAvZU5xT2xCMk9oSU9LMWd1?=
 =?utf-8?B?TEtlZkRVT2pRdlpGcy9KZjB3aGE2M1NvRDdFUHIzRU1PQUg2SHdjSGZzMVVj?=
 =?utf-8?B?T3pRY3YrME4rc0JKNzFtclNVcUQrNHRpeHhFQjR1TFVNcHFvYWVOVmhoSnNO?=
 =?utf-8?B?eERJbXpoZjJJdVU5QkxjVWFkSU1VRXIzMzR4TFlLWWtIZFI2Q1R3OW1WR3p0?=
 =?utf-8?B?M0FCYllXTG12MWd2Vk5aY1RRUXJxZnphQlgwZXJKK05IQmhqRjBURFR3L3Fi?=
 =?utf-8?B?QTdkNVNOaFFXYndsWUQ5WjFVV2YvZU1EQnBIbWxxdnpHUkFycHRjU3VVTnhX?=
 =?utf-8?B?dWZGV0M5Rlc4Y1k2eHd6blNIMStQU3dBMjlIVThjeXg4UXBqMFZad3l5dU9l?=
 =?utf-8?B?TTRxMkFGQi8yL2dDcFovend2SE4vWUxybjRLa1hDNWhWSTUwWGU1STkwaS9l?=
 =?utf-8?B?Tzh3K1dLWk9UWEFqeUVML2VJTHZranErVmxqRHA2S283YlQ4dTJ4VG9Fem5S?=
 =?utf-8?B?SDREckpUdzZjbjZJaGs2eVdHWkNwL2dPZEF1VDBIM3BpVCtmTE1GazFDWmk0?=
 =?utf-8?B?NVpHOWJTSUJNZXlvaU9LMmlWY05JRVNYd08zTnUwRGlzOTFaSUlqNzY2NS8y?=
 =?utf-8?Q?UqiFj014Nd0JH3+Pvg0XgjxZfdOjE6dY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2tkempCbTNpVTJsVUdod0dCcmF3N0h1Q2sxaGdSOVhUUWpoSmR6RXVnS2JF?=
 =?utf-8?B?NndleDUrdUdWcGJRZ2lHTjlXM2ZwVlc1bVk5eTlISWlhajhOeTlhQVJoQUJZ?=
 =?utf-8?B?Z0trQmNuek1WdVU3M1AxSExKc2krUE1TbzRWTEQ2Y1I5WnhzSWdpYnRkbjh0?=
 =?utf-8?B?ZnNpUFYvYjZhUTYvaUpmRXhGSzR5cGR6ZTRnLzZ6TjVhR1A5VFFrYXNWN0dR?=
 =?utf-8?B?VUVQbDJZMTI1dU9BU3RhakI5dmpLM1Fxd0NNM1pjb1JwOU5kMXFodzZ6QkNM?=
 =?utf-8?B?ekxKamlqbnZDUVRoa29VQmlVMm1xb2FFZ1FCUGF2SXVFcU1XY0RSS2hROUZI?=
 =?utf-8?B?OU8rR2FiWFRFalBXMk9OWHY3UEJORmdndXRRRFRMRS9XWEQ5M09zSUw3Rlhl?=
 =?utf-8?B?eG5vU2pWRUdCYVQ0cFFoYVM4UlFkQ1ZIK1NNQnBLZlczSi9xcE5yL0dyeHd2?=
 =?utf-8?B?UHgxRm1GNk0reEVycDNCdUtRTit3Z29MeE02NWhDSzYxV0hmaXlsdEdWeFVl?=
 =?utf-8?B?YVpCSGJxQ3Q4SWNRajkxQ1diUmR5aUZHS0svNDVndVVQRGppREN2L1dhNk1G?=
 =?utf-8?B?RGhuVHkyZ21qZEVRcklVNmN6enRwK3BDZjk4aFNtekZSOGV2Z284bGJIUDFs?=
 =?utf-8?B?MEZQV0xrOEJCMjFtWS9ZUnhRUGJabEdLaXRiRS83N0c1dW0xODl3dTM4aE9s?=
 =?utf-8?B?aEFCQ0FIRmdoM205UDR1RXRxeG5vN0l2NWlkejNwOVMzR0ZjS2dCd1V2aC8x?=
 =?utf-8?B?UE9XYWtWUGwvNUw0S0JzRUx5M1M0QUNoWTloc1dybFk5ckljbUdDcnpPbUdV?=
 =?utf-8?B?dHBqQzVENWIydjRVWXBUa2toWUVkakgzbXJUSngxemQ5bm5zamRjUHpjc3Va?=
 =?utf-8?B?UXF0UERhUXFoUFlNWmtWaWlpTWlBRFlVbjJlZnc1bUQvY1JlR1Y4bkhzMDV0?=
 =?utf-8?B?Z29ZUFQ5YnE5TWlLUGt0ZFdRQit3U3ROV2dZLzdsT3Zzb25tdDFwc1pQekpM?=
 =?utf-8?B?cGJ0WkNrbXlMQkU0OWdkYy9mQlp1cnEwMCtyQWZXVFFNSC9hbUxlYllBRWhV?=
 =?utf-8?B?K1NtM01ERUg4ZU5pZWJ2UVZSYXZjdUcyamxlbHB3M1E1MFFFYjRaK3JzZzYy?=
 =?utf-8?B?YitDa3ZCdHdUWkdTZkZjSy9OUTlOM25hV2dLSzIzMnhzallsUzI1SytvRHM4?=
 =?utf-8?B?WnNndEErc1ZtbHU4bDNKbjh4anZGN3V6bmkwOWg3S3ZKampLSy9XVmUxZXdH?=
 =?utf-8?B?b2lJU0dYM2pNSEozTHg4Q0RRTGM0OHZMQTNzZWZYcXNCL3hqS0p2cnlzNXdu?=
 =?utf-8?B?VzFjcGprQjlpck04b2dITDUrUzRhWDRoRXVKYWpRc1JQZUZ5VFd6a0xsQWN0?=
 =?utf-8?B?eG9NV1hyT2pibXlnTGhZQ3FlczUrMTBFVi81L0tSamVnM1crSUFaelZSMm5C?=
 =?utf-8?B?WlpJNkUvcTlBcVhLeDhINmJXR3Q1eXJQd2lDbWQ4UGhqcG1LNkdsM0hUQXVY?=
 =?utf-8?B?bnJJOWtZcXpKb0VtRlVHQVFjamJaWFJlaWR4VE1na2pUYko2WUVFbHpxOUtV?=
 =?utf-8?B?RUIxVTV0RTZFaFNYdEJzaDNEN2ozekdmUnlhcGlDbW5sT3hzYnJIdzlBSHQv?=
 =?utf-8?B?S2t2aEFZZlZuVmtybkdWUVZNL2ZFeC9rRG14aDZTSnB1ZUFUdDRXZWliSnlh?=
 =?utf-8?B?c3ZRem1VMWV3K1Jtbks3R2QyL0JmT0k4Q3BtS25VYTJLMHp0ZTVrU1dZYzNx?=
 =?utf-8?B?VkpiR2VUWHg4eE92NHYvZWovZDFBWFlhWXZ5QnEydm5sM1liK1l4aGtTRTJI?=
 =?utf-8?B?OWJ0RWw3aDA0YmRzSks1TEdKRkRZdXRHTWtmbVd5OXBmQndKRm1id3A2c3R6?=
 =?utf-8?B?dUwySDA4cWtPSCt3S3JKMXlXU2FQcDV1N2ZydVV2U3BkVTQxRjZaR0JBZzZJ?=
 =?utf-8?B?M1hwU1JuWDJQbU85aDlYc0JZRHlnbWltMm9JMWVqWStXa1FzOWtyK2p1K0sz?=
 =?utf-8?B?czNjcTRMd04xNFdxWEhzSVd6UkdOK3REb0o3aGFOcUlDVmVObkJUNUViU05J?=
 =?utf-8?B?c0hEeEFJS3lTdk1TTW1QY2s3b0liV2JwZ2pBL2N6cWI3aWFlZTZ2Z2hKQnBQ?=
 =?utf-8?Q?N0eQO6EX0dqN82PTMAbeCcnIW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab29c53-a754-4876-b481-08de05229475
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 21:52:01.3187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsUXoN3lNoLm4VLRSmiH6XmZlp5E4kB3wtYJDQ9mHImMUFPZat7/fhY4SqPJ5aryA1Lv6fZXZEBo7Ocsi/AZUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6048
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

--------------6CHAhgQmFzBhq9j9r17j0Yfw
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10/6/2025 1:10 PM, Matthew Brost wrote:
> kmalloc can fail, the returned value must have a NULL check. This should
> be immediately after kmalloc for clarity.
>
> v5:
>   - Assert state->buffer in setup_bo if buffer is iomem (Tomasz)
Repeating as I sent it to rev5 late:

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

-Tomasz

> Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_lrc.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index af09f70f6e78..2c6eae2de1f2 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1214,8 +1214,7 @@ static int setup_bo(struct bo_setup_state *state)
>   	ssize_t remain;
>   
>   	if (state->lrc->bo->vmap.is_iomem) {
> -		if (!state->buffer)
> -			return -ENOMEM;
> +		xe_gt_assert(state->hwe->gt, state->buffer);
>   		state->ptr = state->buffer;
>   	} else {
>   		state->ptr = state->lrc->bo->vmap.vaddr + state->offset;
> @@ -1303,8 +1302,11 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>   	u32 *buf = NULL;
>   	int ret;
>   
> -	if (lrc->bo->vmap.is_iomem)
> +	if (lrc->bo->vmap.is_iomem) {
>   		buf = kmalloc(LRC_WA_BB_SIZE, GFP_KERNEL);
> +		if (!buf)
> +			return -ENOMEM;
> +	}
>   
>   	ret = xe_lrc_setup_wa_bb_with_scratch(lrc, hwe, buf);
>   
> @@ -1347,8 +1349,11 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>   	if (xe_gt_WARN_ON(lrc->gt, !state.funcs))
>   		return 0;
>   
> -	if (lrc->bo->vmap.is_iomem)
> +	if (lrc->bo->vmap.is_iomem) {
>   		state.buffer = kmalloc(state.max_size, GFP_KERNEL);
> +		if (!state.buffer)
> +			return -ENOMEM;
> +	}
>   
>   	ret = setup_bo(&state);
>   	if (ret) {
--------------6CHAhgQmFzBhq9j9r17j0Yfw
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/6/2025 1:10 PM, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251006111038.2234860-2-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">kmalloc can fail, the returned value must have a NULL check. This should
be immediately after kmalloc for clarity.

v5:
 - Assert state-&gt;buffer in setup_bo if buffer is iomem (Tomasz)
</pre>
    </blockquote>
    Repeating as I sent it to rev5 late:
    <pre class="content"><span class="reviewed-by">Reviewed-by: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a></span>

-Tomasz</pre>
    <blockquote type="cite" cite="mid:20251006111038.2234860-2-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">
Signed-off-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_lrc.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index af09f70f6e78..2c6eae2de1f2 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1214,8 +1214,7 @@ static int setup_bo(struct bo_setup_state *state)
 	ssize_t remain;
 
 	if (state-&gt;lrc-&gt;bo-&gt;vmap.is_iomem) {
-		if (!state-&gt;buffer)
-			return -ENOMEM;
+		xe_gt_assert(state-&gt;hwe-&gt;gt, state-&gt;buffer);
 		state-&gt;ptr = state-&gt;buffer;
 	} else {
 		state-&gt;ptr = state-&gt;lrc-&gt;bo-&gt;vmap.vaddr + state-&gt;offset;
@@ -1303,8 +1302,11 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	u32 *buf = NULL;
 	int ret;
 
-	if (lrc-&gt;bo-&gt;vmap.is_iomem)
+	if (lrc-&gt;bo-&gt;vmap.is_iomem) {
 		buf = kmalloc(LRC_WA_BB_SIZE, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+	}
 
 	ret = xe_lrc_setup_wa_bb_with_scratch(lrc, hwe, buf);
 
@@ -1347,8 +1349,11 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	if (xe_gt_WARN_ON(lrc-&gt;gt, !state.funcs))
 		return 0;
 
-	if (lrc-&gt;bo-&gt;vmap.is_iomem)
+	if (lrc-&gt;bo-&gt;vmap.is_iomem) {
 		state.buffer = kmalloc(state.max_size, GFP_KERNEL);
+		if (!state.buffer)
+			return -ENOMEM;
+	}
 
 	ret = setup_bo(&amp;state);
 	if (ret) {
</pre>
    </blockquote>
  </body>
</html>

--------------6CHAhgQmFzBhq9j9r17j0Yfw--
