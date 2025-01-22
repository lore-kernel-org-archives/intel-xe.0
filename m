Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3019C02181
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 23:45:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4E610E095;
	Wed, 22 Jan 2025 23:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZWJXA2Uh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3883C10E095
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jan 2025 23:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737589522; x=1769125522;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=P88M2J72pfkjiLdyPAeXApCsnzT9nkIkFca86yrZ9BI=;
 b=ZWJXA2UhasJrVm16nWGjt1HQ7fKykdqcpx5gBfEPch8dYy9659cgr0N3
 dGvLIKC2DNAZfUs5BR4YLIx+BQ3EeJwjfHP62F7SGX7ilaK4wAT2+ujRZ
 TpMT8mSlhK75ThAABBx9KF5bv5wmP2qal7xmiEmjY4g+h5HKPTVWSAz/S
 HCzaMg2QGelW5epX6LcqFzgAbjH8b821IQ/Kx4JBTylXSSn4y13nYcoXN
 dqm4hMyGwoTsrn5Q14cfZkA+gYe+lENCBrvtYsX5sNZHOscnzaV1uhX2A
 jqtI06hRx2CLzHhHfyYAbbTHRTyVIUhLLQkS8KgpmVVIgrBZAmDItaiXY g==;
X-CSE-ConnectionGUID: 4jZHL0r2TqyVZGw6oDJnpg==
X-CSE-MsgGUID: wddqd44xTASYJmGXYqtkxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="48738737"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="48738737"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 15:45:20 -0800
X-CSE-ConnectionGUID: P5FjkslvRh66P5AjyoFAAA==
X-CSE-MsgGUID: 1r9/oWGyS7yzmSE5aCQFjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="138145466"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 15:45:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 15:45:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 15:45:19 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 15:45:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VsC4UDHtoVwCoEp4HoQPffpFZ2ZV1fJlUz0gOVyBGsKIetd9JZLpcQa5yNcgN+hp3EMgMLyZOxi0jXHBixNzIUamyrvBQrL+vGO4gc7qN0cDVgsTn0IF8MVP4i/WkJqNbauMC/IeR456U3m8RbzcfdM+MWtE67pma7nTPuFbkP5N2QobIxIwck41NgrxhQ+ksRp8Io600Bssufh1cI+NP88fmlwQA1mbaGn1yEsOCFAnJMfswbxy66pAC2vPTN846cU1aWVdojh0Xl4cvkdqm+CAnsCyE0x5a0XXUkqIdfUhqv9W+4/dzojsNevUx0XZR84Ddacas6cfEwrST8Lf9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bfENerNtDd/rJBPobFRysaSFvQCdYB6Za8WMTPs/QY=;
 b=skf7iHSHj9JQUIwyt+Ye3KvRJHSE3IrSIa3nKi1PRKjzxn5ue0r51yN4E/Pj5ZFeKvMn9ntrnjPLm7x09jVcZ7fT0MqAt2R4OlZyvrYirZNqVM2+LLrqeX1eNgIKirKJkUvfgX+FXVSQYOQt21rsZEia/h4fVkLEuL/K015IlVBxrEmOj1mVSSqaQ+rUhXfomdhikN3brBnAQHIu49AuxP7Nou7c8eGST8hNQpxP56lPGwGZmAMqdA+/dbN/J18kwA1gmE8UbX2QpNyJb0DsLAV2NVMZtlfYNDJbt5TIg8EIKkmNRF+dYpv4fbxz1rmr9avluLfQRIjKdgjmkdt92Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by DS0PR11MB7457.namprd11.prod.outlook.com (2603:10b6:8:140::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Wed, 22 Jan
 2025 23:44:35 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%6]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 23:44:34 +0000
Date: Wed, 22 Jan 2025 15:44:31 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <james.ausmus@intel.com>,
 <felix.j.degrood@intel.com>, <matias.a.cabral@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <shubham.kumar@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.olson@intel.com>,
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v8 2/7] drm/xe/uapi: Introduce API for EU stall sampling
Message-ID: <Z5GC3z8yzSDZddbE@intel.com>
References: <cover.1736970203.git.harish.chegondi@intel.com>
 <e7976be3cc70ce56a2f64edf007bccacbaa2b37b.1736970203.git.harish.chegondi@intel.com>
 <85jzate00v.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85jzate00v.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0315.namprd03.prod.outlook.com
 (2603:10b6:303:dd::20) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|DS0PR11MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: dc05be81-66aa-49f5-ec20-08dd3b3eb9a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlJVU3NsWjhKV3RZc3gxb3krdU4wOFhSSnduSE8yYnR6UkRWQ0RtaE5BSVlT?=
 =?utf-8?B?a1JESSt1akhRYTQxMDNVRW44by9SZlN3RjhUNURzZXU1TWtlbWpTTUJwQyt4?=
 =?utf-8?B?WVIzaGZicDNUa1lpb3BPTDY2Q0NIN0ZqZFkwR1ZucTZCemdkcXVJc2RHVytT?=
 =?utf-8?B?WlFpZUVBU04veTg2Nm01YVRwRnl2WE80OUNHbkpDUFNiOWQ4c3dFcW5FY2Rt?=
 =?utf-8?B?ZWIvMGcwVldvREZvSUV1RFZzNkpiZ3ZJM21kYzBwSHFYc1l2VG1UTHFDcWVV?=
 =?utf-8?B?ZkJ6SktrNllPNXI0aGxRenN5YUhuSzZiYTZSMm1oSWVZTi9xRlVCcmp6K2kz?=
 =?utf-8?B?MVBUditHRFhLRUJaSkt6cndTdGxWa0s0RnhSVGRBNDM3czVuZEl3dlRNU0FD?=
 =?utf-8?B?L0RCQU82VUNSemw5UGl0TFU5WU1BaFRRUXEvRS9KaitiT2dybEVtUE5OU2R5?=
 =?utf-8?B?d2EvbE1od1M4L1J0RlN3Uk9PYVM2RkR6bG80ajhiMmN0OFZjMkRiZEd4bGNv?=
 =?utf-8?B?aUp0bXFxRzY4Skd6dnd3NThlWEtaU2RUZDF4T3d5Yldrd1RIdjVNMm1ad0lk?=
 =?utf-8?B?ZjN1TlpMRjVwTW1wTW0xdXgvbzB0VksvNlk1anhYZjNGNDA4WXdwaTlnMFJu?=
 =?utf-8?B?dzlUMmYySW5iSHJCcm82b2ZjYWJ5bk1PUFREVlpFKzVOTG9NbkQvMzZxUmI5?=
 =?utf-8?B?bUFCY2Qxc1hQM3hZVWF6anFFZ0NkT2Z0UjVOQ1Q4SUpJbG0wTlBnaGpHYjFO?=
 =?utf-8?B?b21NTEhUVlNIUkpraU9iSitGbFBSZW1Ca21KOXVRM0syZCtzSXBVU0RzVm9C?=
 =?utf-8?B?cjBRZkZEcngvcSsrWjIxWVltV1gvL0NGdWE1bzVseGdId2dHYUIwaFVYczlB?=
 =?utf-8?B?azdwT21OcENsQkp0VkY1WUVLaDZXQnBHeTYzcDNQQkc2NWtOMHlXOC9DWnBi?=
 =?utf-8?B?bUtScnhsTXhBVE5VZXhJdU1aaVU4NXUxZ081MTZWYzlpL3k3MWRBT0g1VTFq?=
 =?utf-8?B?U2d0NjlZUlFTU0FObnk3UlhvU1FMMkNBeC9mTUd3dGg2dk1FVGFldlNHdFhK?=
 =?utf-8?B?T0RjT3dBTVBzeXBwWlZJNXhrbU5BUTBJR3N4OGYwU2V3L0pnVjJnbWJYN3pI?=
 =?utf-8?B?UlFWRUdTcE9xSjVpVEFhUm1ibTZHWWE2Z212K2tqRTdFemhybjJZUkI3N2R0?=
 =?utf-8?B?QmxBNFRIT3pTSUxralNlbC9lU2xpMXJFKzhQMEZJdHJXYStqSnBQWC9HMERJ?=
 =?utf-8?B?b3pDWGxCK3R1TWZ0WHpHNVhtQjlUd0xJMGtRb0hyeDk5bmNQbVpWTEJwTUU1?=
 =?utf-8?B?SnFqQSs4TDNaU1ZzUEtXcFhMM2Y2QXBiZ0h5eUZld3NBSG84T0pyaG5hWklq?=
 =?utf-8?B?YkF1djR3cFZtVVJaVkZXSEhmWnREZU14dVh6bVBwRkNRQm5MQnA1L0RRbmRs?=
 =?utf-8?B?aFlFZW9ZL2pWQUZmRVJ5U0tpcFNMTFVjYXNabUl0S2psVG80SFRBYnRVZnJ3?=
 =?utf-8?B?bmRYcGxBd3E4R29Cb2Jaa3RmOXJlYlNSdHlSWnhLby9kVDVRQThjeU9zUDY1?=
 =?utf-8?B?NGdYUXFjLzF2LzhucVVTL09EV2pGcWIxTkhnNnpCZ25LVXhHVEZoYjJocTlj?=
 =?utf-8?B?dU5QempxUW0wSnlIbFlYU2ZhZGdzOEJrVzlva2VzOGlzQlg5ZGhWR2pxWHdw?=
 =?utf-8?B?RlBPbUxwMHUxMitoa3pMYXZzRG9nQUppZkZSc0JBb1cydUJMVVhjTEVuaUg4?=
 =?utf-8?B?MWpaRG5haTRHbkIxWm0xN0hCNDk3ZDFUU0NBdHhOTmJLVUR2ZnZBUFhnYU50?=
 =?utf-8?B?eThtTllIcWdLdGoxVU9pUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODl1eWg2clRGb0lUWU5rbHRpcDlJZE9SWDFpeDVGalltY21rc1F6bDY2NXRh?=
 =?utf-8?B?WFhSYXozMkF1RDN4dU9ZTTZXeFU3cmgwdDBBVEZkZUVSTnVKenZlZjJWK0JV?=
 =?utf-8?B?dEkvdmR1RVNzakJXeTZQZk1jYncxUCtUeEVZQkdDTjBCbTUwYjFlVmhnL2ZT?=
 =?utf-8?B?YjNsU2NNcStLRHVsOENNNUlGaTMvTEV6ckxrbEhKMDU2Q1BXQXNkODhqNEdH?=
 =?utf-8?B?RTB3Y3NEa3VaVWNQekZhM0NPemxySmhlYzBCZVZwRVNQaTlRQ2tWM01aQ2pa?=
 =?utf-8?B?eVptbFoyOUNNbVNVUmhVS1l1RmJ0M01VTlI1aEZza3FHbHcxbU1KM1Joa2p1?=
 =?utf-8?B?QzM2elNlY2xtaXFYdFhhVEVyNkV0ODJxczZEbGZZb1IxV3ZGalFuUFJ3a01H?=
 =?utf-8?B?U2d3Sll5cVo4UlpMdmJPOFM4N2ROenBGZzRpS3pzMHZRRklzNWk2UjM0MWVz?=
 =?utf-8?B?L2l3Uk1PeUVzN0grcjNzd2hKUHd2cm4wRysvUEVSd3RhT01DQmpUdnZqbWlK?=
 =?utf-8?B?bTVMc0s3QVNzdVhPcUNyeFpxeHpFMHdqWkdiWk9odEFaV2MvM2JUYjZNditT?=
 =?utf-8?B?RytSdWJDWmVsR3I0Q3JtMzZZWDBQY21sYncvT1lpRVRZYmd1aHo5VEJkTDBk?=
 =?utf-8?B?Ris0aHpmV2ZGM0NNU2ZiYXQ1aThFcGFtWFNzSHd3djZRVHhEVmU5Wmp5Mm1h?=
 =?utf-8?B?YXIweTBiZWp3ZHltL0Nkb1RtOER2WnBENTlML1RsUXNMYnVIbHFMc1pldWxr?=
 =?utf-8?B?ZFBmSVQxYWhQYWVmZXdKeDVtOXBVUkE2T1RYaHg3UDFyOHBKTDBVRVYwaWJV?=
 =?utf-8?B?WHk3ZzNyQTBKZ0ppV0F1eFBSVWd1Y0RDUHQ2QkNxQlh0VjFUaFljSTBmWjlY?=
 =?utf-8?B?TklYeU9JM1pCSXF5OUVjZ0JHTW9CZUhmNXNtSUUwSnlHcE95ZmpFSncvTzUv?=
 =?utf-8?B?bDdTU1RvbnBlOUxNRy9CbXhnN2VTR1Mxb0w2MFNCc2tKRHhtQXQ0NHE4bFpK?=
 =?utf-8?B?SnpYbFBjc0Z6a3V5NSs0MlEvU09OYjNJT0diQy81djk0cUZndjBWd201aUU0?=
 =?utf-8?B?cDl3WkhUS2Rjc3ZvK1ljZG1tR3B0UEJxUTlmWE5XUWE2Z2ZDaWdvZ05TUkpu?=
 =?utf-8?B?NzhaWmFoQ2Ftamtyc0gwK05zSVhPZVlwT1lEOHBoZDh3RWZSTy9BWDVXSnNY?=
 =?utf-8?B?S0U1Ti9sUjg3b1NUQXFtbEw0SFdoaGovdzV4Q0hhNXNWSTE5RjhEdk1zeVNJ?=
 =?utf-8?B?cXBFUktPT1pXUEo4TmJWV0t3NkpUdDRxR3grZlhjeTFJSDBkVncwVGRiKy9G?=
 =?utf-8?B?WUhkMCtCTFFta1Jrc21rQ29ubzZyWHJqZHhRRG5YMVh5MnN6SW5NQzlQemd6?=
 =?utf-8?B?REpIT01XejFqMkhJYXlhbi9GMG0vb1VGTTdnVXZJZGx5THFJNlF4cE9LSjFH?=
 =?utf-8?B?aEtxcnNDeEc1Wng1WU4vbHNTdU1ybkYzcitubnlWcmtBeGVFU1kycnJIOXVx?=
 =?utf-8?B?ZWt5MkVRRm5RN29ZR3lTamlCbE5XL0xLSEFrK3VaVGo3NVhIcTR1SG5NYnVl?=
 =?utf-8?B?V1poVC9obldzMzdIMVVaZWJjTnJKMlU0RlhwTmZqYnZiamtLdjFSQnJVMmFM?=
 =?utf-8?B?N3MyRVRFclNQQmlMR0JibkJmRUdyMmlOM2pSdEVnYjJ3N1dDY2xxSm9ueVJM?=
 =?utf-8?B?WCtwK2NGUzJGSHBDcmFOSXljM0x1Z09mL1ZXc2dXSkFYV1NyRmtpQzd3NTE0?=
 =?utf-8?B?UWdWTFdMYlRWSmZvVk9QQXRSeVhUdkJhc3ZjUGQ2UElheFNJTHkzQjVhTVkv?=
 =?utf-8?B?VjBCWDdydjUyVmNoa3lVWWEwK3QrWHo2b1NTR0ZwUGp5ZENFNUc0UVExaSt6?=
 =?utf-8?B?QjgrOWJFM1g1dlg0ajhpdkNoTS8xRHoyRzBMcXJ6R3d4TzdtYVFHenJJZGQr?=
 =?utf-8?B?dkxKL244RC9scVlMaWJxY2tUTllhVVhWcG9KSVhOV2VJMUdYeW9wWVNBbDd0?=
 =?utf-8?B?MTVJZFJ6Q1NKMlJiRVZCUVphdW1OOUhDMTFhWTNscVNRVHRxUFJRTjZoQ0dh?=
 =?utf-8?B?L2E1a0tMRjRQaU8wcEVSNUp2TnhMRzYyOWFRTmZpdGEvZE5ickh1aHlJbWJY?=
 =?utf-8?B?enNsSE1hUTR1aU4ycjF5NExJZWtTUTA2WCtRNDRmRHhRd2ZKZW8yRzEwT1Qw?=
 =?utf-8?B?VWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc05be81-66aa-49f5-ec20-08dd3b3eb9a7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 23:44:34.7777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xpN2kCfyONWHmfeawQoV54zmJnvKBqtmkhehNd9czvkmEG608kGIOGWwORrWYDhDSspI5etnxaRAP4sbUDDtO8lgcSsvTqqIs21nPQiUHyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7457
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

On Fri, Jan 17, 2025 at 11:02:56AM -0800, Dixit, Ashutosh wrote:
> On Wed, 15 Jan 2025 12:02:08 -0800, Harish Chegondi wrote:
> >
> 
Hi Ashutosh,
> This patch doesn't compile :/
I am able to compile this patch without any errors. Which config file
are you using? Earlier there was a 32-bit build error due to 64-bit
division. I fixed it in this patch with a div_u64().
> 
> > A new hardware feature first introduced in PVC gives capability to
> > periodically sample EU stall state and record counts for different stall
> > reasons, on a per IP basis, aggregate across all EUs in a subslice and
> > record the samples in a buffer in each subslice. Eventually, the aggregated
> > data is written out to a buffer in the memory. This feature is also
> > supported in XE2 and later architecture GPUs.
> >
> > Use an existing IOCTL - DRM_IOCTL_XE_OBSERVATION as the interface into the
> > driver from the user space to do initial setup and obtain a file descriptor
> > for the EU stall data stream.  Input parameter to the IOCTL is a struct
> > drm_xe_observation_param in which observation_type should be set to
> > DRM_XE_OBSERVATION_TYPE_EU_STALL, observation_op should be
> > DRM_XE_OBSERVATION_OP_STREAM_OPEN and param should point to a chain of
> > drm_xe_ext_set_property structures in which each structure has a pair of
> > property and value. The EU stall sampling input properties are defined in
> > drm_xe_eu_stall_property_id enum.
> >
> > With the file descriptor obtained from DRM_IOCTL_XE_OBSERVATION, user space
> > can enable and disable EU stall sampling with the IOCTLs:
> > DRM_XE_OBSERVATION_IOCTL_ENABLE and DRM_XE_OBSERVATION_IOCTL_DISABLE.
> > User space can also call poll() to check for availability of data in the
> > buffer. The data can be read with read(). Finally, the file descriptor
> > can be closed with close().
> >
> > v8: Used div_u64 instead of / to fix 32-bit build issue.
> >     Changed copyright year in xe_eu_stall.c/h to 2025.
> > v7: Renamed input property DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT
> >     to DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS to be consistent with
> >     OA. Renamed the corresponding internal variables.
> >     Fixed some commit messages based on review feedback.
> > v6: Change the input sampling rate to GPU cycles instead of
> >     GPU cycles multiplier.
> >
> > Cc: Felix Degrood <felix.j.degrood@intel.com>
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile         |   1 +
> >  drivers/gpu/drm/xe/xe_eu_stall.c    | 283 ++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_eu_stall.h    |  12 ++
> >  drivers/gpu/drm/xe/xe_observation.c |  14 ++
> >  include/uapi/drm/xe_drm.h           |  38 ++++
> >  5 files changed, 348 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.h
> >
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 7730e0596299..259ccbb0c031 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -33,6 +33,7 @@ xe-y += xe_bb.o \
> >	xe_device_sysfs.o \
> >	xe_dma_buf.o \
> >	xe_drm_client.o \
> > +	xe_eu_stall.o \
> >	xe_exec.o \
> >	xe_execlist.o \
> >	xe_exec_queue.o \
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > new file mode 100644
> > index 000000000000..48dcc7cb7791
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > @@ -0,0 +1,283 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#include <linux/anon_inodes.h>
> > +#include <linux/types.h>
> > +#include <linux/poll.h>
> > +#include <linux/fs.h>
> > +
> > +#include <uapi/drm/xe_drm.h>
> > +
> > +#include "xe_macros.h"
> > +#include "xe_device.h"
> > +#include "xe_eu_stall.h"
> > +#include "xe_gt_printk.h"
> > +#include "xe_gt_topology.h"
> > +#include "xe_observation.h"
> > +
> > +/**
> > + * struct eu_stall_open_properties - EU stall sampling properties received
> > + *				     from user space at open.
> > + * @eu_stall_sampling_rate: EU stall sampling rate multiplier.
> > + *			    HW will sample every (eu_stall_sampling_rate x 251) cycles.
> > + * @wait_num_reports: Minimum number of EU stall data reports to unblock poll().
> > + * @gt: GT on which EU stall data will be captured.
> > + */
> > +struct eu_stall_open_properties {
> > +	u8 eu_stall_sampling_rate;
> > +	u32 wait_num_reports;
> 
> nit but the recommendation is to just use generic types, viz 'int', unless
> you have specific needs to use u8/u32 etc.
> 
> > +	struct xe_gt *gt;
> > +};
> > +
> > +/**
> > + * num_data_rows - Return the number of EU stall data rows of 64B each
> > + *		   for a given data size.
> > + *
> > + * @data_size: EU stall data size
> > + */
> > +static inline u32
> > +num_data_rows(u32 data_size)
> 
> Remove inline, put on a single line.
Why remove inline?
> 
> Is something like num_cachelines() a better name?
As of now, each data record is cacheline sized, but it may increase in
the future.
> 
> > +{
> > +	return (data_size >> 6);
> > +}
> > +
> > +static int set_prop_eu_stall_sampling_rate(struct xe_device *xe, u64 value,
> > +					   struct eu_stall_open_properties *props)
> > +{
> > +	value = div_u64(value, 251);
> > +	if (value == 0 || value > 7) {
> > +		drm_dbg(&xe->drm, "Invalid EU stall sampling rate %llu\n", value);
> > +		return -EINVAL;
> > +	}
> > +	props->eu_stall_sampling_rate = value;
> > +	return 0;
> > +}
> > +
> > +static int set_prop_eu_stall_wait_num_reports(struct xe_device *xe, u64 value,
> > +					      struct eu_stall_open_properties *props)
> > +{
> > +	u32 max_wait_num_reports;
> > +
> > +	max_wait_num_reports = num_data_rows(SZ_512K * XE_MAX_DSS_FUSE_BITS);
> 
> Can't we just add the final function to this patch?
Yes, I can make this change.
> 
>         max_wait_num_reports = num_data_rows(per_xecore_buf_size * XE_MAX_DSS_FUSE_BITS);
> 
> > +	if (value == 0 || value > max_wait_num_reports) {
> > +		drm_dbg(&xe->drm, "Invalid EU stall event report count %llu\n", value);
> > +		drm_dbg(&xe->drm, "Minimum event report count is 1, maximum is %u\n",
> > +			max_wait_num_reports);
> > +		return -EINVAL;
> > +	}
> > +	props->wait_num_reports = value;
> > +	return 0;
> > +}
> > +
> > +static int set_prop_eu_stall_gt_id(struct xe_device *xe, u64 value,
> > +				   struct eu_stall_open_properties *props)
> > +{
> > +	if (value >= xe->info.gt_count) {
> > +		drm_dbg(&xe->drm, "Invalid GT ID %llu for EU stall sampling\n", value);
> > +		return -EINVAL;
> > +	}
> > +	props->gt = xe_device_get_gt(xe, value);
> > +	return 0;
> > +}
> > +
> > +typedef int (*set_eu_stall_property_fn)(struct xe_device *xe, u64 value,
> > +					struct eu_stall_open_properties *props);
> > +
> > +static const set_eu_stall_property_fn xe_set_eu_stall_property_funcs[] = {
> > +	[DRM_XE_EU_STALL_PROP_SAMPLE_RATE] = set_prop_eu_stall_sampling_rate,
> > +	[DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS] = set_prop_eu_stall_wait_num_reports,
> > +	[DRM_XE_EU_STALL_PROP_GT_ID] = set_prop_eu_stall_gt_id,
> > +};
> > +
> > +static int xe_eu_stall_user_ext_set_property(struct xe_device *xe, u64 extension,
> > +					     struct eu_stall_open_properties *props)
> > +{
> > +	u64 __user *address = u64_to_user_ptr(extension);
> > +	struct drm_xe_ext_set_property ext;
> > +	int err;
> > +	u32 idx;
> > +
> > +	err = __copy_from_user(&ext, address, sizeof(ext));
> > +	if (XE_IOCTL_DBG(xe, err))
> > +		return -EFAULT;
> > +
> > +	if (XE_IOCTL_DBG(xe, ext.property >= ARRAY_SIZE(xe_set_eu_stall_property_funcs)) ||
> > +	    XE_IOCTL_DBG(xe, ext.pad))
> > +		return -EINVAL;
> > +
> > +	idx = array_index_nospec(ext.property, ARRAY_SIZE(xe_set_eu_stall_property_funcs));
> > +	return xe_set_eu_stall_property_funcs[idx](xe, ext.value, props);
> > +}
> > +
> > +typedef int (*xe_eu_stall_user_extension_fn)(struct xe_device *xe, u64 extension,
> > +					     struct eu_stall_open_properties *props);
> > +static const xe_eu_stall_user_extension_fn xe_eu_stall_user_extension_funcs[] = {
> > +	[DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY] = xe_eu_stall_user_ext_set_property,
> > +};
> > +
> > +static int xe_eu_stall_user_extensions(struct xe_device *xe, u64 extension,
> > +				       struct eu_stall_open_properties *props)
> > +{
> > +	u64 __user *address = u64_to_user_ptr(extension);
> > +	struct drm_xe_user_extension ext;
> > +	int err;
> > +	u32 idx;
> > +
> > +	err = __copy_from_user(&ext, address, sizeof(ext));
> > +	if (XE_IOCTL_DBG(xe, err))
> > +		return -EFAULT;
> > +
> > +	if (XE_IOCTL_DBG(xe, ext.pad) ||
> > +	    XE_IOCTL_DBG(xe, ext.name >= ARRAY_SIZE(xe_eu_stall_user_extension_funcs)))
> > +		return -EINVAL;
> > +
> > +	idx = array_index_nospec(ext.name, ARRAY_SIZE(xe_eu_stall_user_extension_funcs));
> > +	err = xe_eu_stall_user_extension_funcs[idx](xe, extension, props);
> > +	if (XE_IOCTL_DBG(xe, err))
> > +		return err;
> > +
> > +	if (ext.next_extension)
> > +		return xe_eu_stall_user_extensions(xe, ext.next_extension, props);
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_eu_stall_stream_read - handles userspace read() of a EU stall data stream fd.
> > + *
> > + * @file: An xe EU stall data stream file
> > + * @buf: destination buffer given by userspace
> > + * @count: the number of bytes userspace wants to read
> > + * @ppos: (inout) file seek position (unused)
> > + *
> > + * Userspace must enable the EU stall stream with DRM_XE_OBSERVATION_IOCTL_ENABLE
> > + * before calling read().
> > + *
> > + * Returns: The number of bytes copied or a negative error code on failure.
> > + */
> > +static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
> > +				       size_t count, loff_t *ppos)
> > +{
> > +	ssize_t ret = 0;
> > +
> > +	return ret;
> > +}
> > +
> > +/**
> > + * xe_eu_stall_stream_poll - handles userspace poll() of a EU stall data stream fd.
> > + *
> > + * @file: An xe EU stall data stream file
> > + * @wait: Poll table
> > + *
> > + * Returns: Bit mask of returned events.
> > + */
> > +static __poll_t
> > +xe_eu_stall_stream_poll(struct file *file, poll_table *wait)
> > +{
> > +	__poll_t ret = 0;
> > +
> > +	return ret;
> > +}
> > +
> > +/**
> > + * xe_eu_stall_stream_ioctl - support ioctl() of a xe EU stall data stream fd.
> > + *
> > + * @file: An xe EU stall data stream file
> > + * @cmd: the ioctl request
> > + * @arg: the ioctl data
> > + *
> > + * Returns: zero on success or a negative error code.
> > + *	    -EINVAL for an unknown ioctl request.
> > + */
> 
> What is the purpose of providing documenatation for static functions, such
> as the functions above? There is no useful information in such
> documentation at all.
> 
> Let's save some lines of code and vertical real estate and provide
> documenation only for functions which are exposed in a .h. Unless there is
> a "real" reason for providing documentation for something.
As per the https://docs.kernel.org/doc-guide/kernel-doc.html ,
while the documentation is not required for static functions,
it is recommended for consistency.
> 
> > +static long xe_eu_stall_stream_ioctl(struct file *file,
> > +				     unsigned int cmd,
> > +				     unsigned long arg)
> > +{
> > +	switch (cmd) {
> > +	case DRM_XE_OBSERVATION_IOCTL_ENABLE:
> > +		return 0;
> > +	case DRM_XE_OBSERVATION_IOCTL_DISABLE:
> > +		return 0;
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +
> > +/**
> > + * xe_eu_stall_stream_close - handles userspace close() of a EU stall data
> > + *			      stream file.
> > + * @inode: anonymous inode associated with file
> > + * @file: An xe EU stall data stream file
> > + *
> > + * Cleans up any resources associated with an open EU stall data stream file.
> > + */
> > +static int xe_eu_stall_stream_close(struct inode *inode, struct file *file)
> > +{
> > +	return 0;
> > +}
> > +
> 
> Not sure why you've introduced these empty functions in this patch, they
> should just be introduced in later patches where they have valid bodies.
> 
From a review feedback in series V3:

   Initial patch that implements the basic interface
   and such, but just stubs out the parts that actually go touch
   hardware.

Since I didn't have any code in this patch that touches the hardware,
some functions are empty.

> The idea is that the initial patches should just add lines of code, not
> remove lines of code. If you see the initial OA patches, there is not even
> a single line of deleted code:
I have moved some code around into different functions in the next
patch. There isn't much code that is deleted. Will try to improve it in
the next patch series.
> 
> 	git log --stat 67977882a2f1..392bf22238ff
> 
> Don't worry about adding a few lines of code to the later patches.
> 
> Anyway I don't want you to spend too much time changing patches again, so
> I'm ok leaving things as is too. Just let me know if it's going to be a
> problem and what you prefer. I am just letting you know what the preferred
> practice is.
> 
> > +static const struct file_operations fops_eu_stall = {
> > +	.owner		= THIS_MODULE,
> > +	.llseek		= noop_llseek,
> > +	.release	= xe_eu_stall_stream_close,
> > +	.poll		= xe_eu_stall_stream_poll,
> > +	.read		= xe_eu_stall_stream_read,
> > +	.unlocked_ioctl = xe_eu_stall_stream_ioctl,
> > +	.compat_ioctl   = xe_eu_stall_stream_ioctl,
> > +};
> > +
> > +static inline bool has_eu_stall_sampling_support(struct xe_device *xe)
> > +{
> > +	return false;
> > +}
> > +
> > +/**
> > + * xe_eu_stall_stream_open - Open a xe EU stall data stream fd
> > + *
> > + * @dev: DRM device pointer
> > + * @data: pointer to first struct @drm_xe_ext_set_property in
> > + *	  the chain of input properties from the user space.
> > + * @file: DRM file pointer
> > + *
> > + * This function opens a EU stall data stream with input properties from
> > + * the user space.
> > + *
> > + * Returns: EU stall data stream fd on success or a negative error code.
> > + */
> > +int xe_eu_stall_stream_open(struct drm_device *dev,
> > +			    u64 data,
> > +			    struct drm_file *file)
> > +{
> > +	struct xe_device *xe = to_xe_device(dev);
> > +	struct eu_stall_open_properties props;
> > +	int ret, stream_fd;
> > +
> > +	memset(&props, 0, sizeof(struct eu_stall_open_properties));
> 
> struct eu_stall_open_properties props = {};
Will change.
> 
> > +
> > +	ret = xe_eu_stall_user_extensions(xe, data, &props);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (!props.gt) {
> > +		drm_dbg(&xe->drm, "GT ID not provided for EU stall sampling\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (xe_observation_paranoid && !perfmon_capable()) {
> > +		xe_gt_dbg(props.gt, "Insufficient privileges for EU stall monitoring\n");
> > +		return -EACCES;
> > +	}
> 
> This check should be the first check right at the top of the function.
Will change.
> 
> > +
> > +	if (!has_eu_stall_sampling_support(xe)) {
> > +		xe_gt_dbg(props.gt, "EU stall monitoring is not supported on this platform\n");
> > +		return -EPERM;
> > +	}
> > +	stream_fd = anon_inode_getfd("[xe_eu_stall]", &fops_eu_stall,
> > +				     NULL, 0);
> 
> Move to previous line, lines can be upto 100 char in length..
Will change.
> 
> > +	if (stream_fd < 0)
> > +		xe_gt_dbg(props.gt, "EU stall inode get fd failed : %d\n", stream_fd);
> > +
> > +	return stream_fd;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.h b/drivers/gpu/drm/xe/xe_eu_stall.h
> > new file mode 100644
> > index 000000000000..3447958a7a22
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.h
> > @@ -0,0 +1,12 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef __XE_EU_STALL_H__
> > +#define __XE_EU_STALL_H__
> > +
> > +int xe_eu_stall_stream_open(struct drm_device *dev,
> > +			    u64 data,
> > +			    struct drm_file *file);
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_observation.c b/drivers/gpu/drm/xe/xe_observation.c
> > index 8ec1b84cbb9e..cca661de60ac 100644
> > --- a/drivers/gpu/drm/xe/xe_observation.c
> > +++ b/drivers/gpu/drm/xe/xe_observation.c
> > @@ -9,6 +9,7 @@
> >  #include <uapi/drm/xe_drm.h>
> >
> >  #include "xe_oa.h"
> > +#include "xe_eu_stall.h"
> >  #include "xe_observation.h"
> >
> >  u32 xe_observation_paranoid = true;
> > @@ -29,6 +30,17 @@ static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_observation_param *
> >	}
> >  }
> >
> > +static int xe_eu_stall_ioctl(struct drm_device *dev, struct drm_xe_observation_param *arg,
> > +			     struct drm_file *file)
> > +{
> > +	switch (arg->observation_op) {
> > +	case DRM_XE_OBSERVATION_OP_STREAM_OPEN:
> > +		return xe_eu_stall_stream_open(dev, arg->param, file);
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> >  /**
> >   * xe_observation_ioctl - The top level observation layer ioctl
> >   * @dev: @drm_device
> > @@ -51,6 +63,8 @@ int xe_observation_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
> >	switch (arg->observation_type) {
> >	case DRM_XE_OBSERVATION_TYPE_OA:
> >		return xe_oa_ioctl(dev, arg, file);
> > +	case DRM_XE_OBSERVATION_TYPE_EU_STALL:
> > +		return xe_eu_stall_ioctl(dev, arg, file);
> >	default:
> >		return -EINVAL;
> >	}
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index f62689ca861a..d9b20afc57c1 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -1397,6 +1397,8 @@ struct drm_xe_wait_user_fence {
> >  enum drm_xe_observation_type {
> >	/** @DRM_XE_OBSERVATION_TYPE_OA: OA observation stream type */
> >	DRM_XE_OBSERVATION_TYPE_OA,
> > +	/** @DRM_XE_OBSERVATION_TYPE_EU_STALL: EU stall sampling observation stream type */
> > +	DRM_XE_OBSERVATION_TYPE_EU_STALL,
> >  };
> >
> >  /**
> > @@ -1729,6 +1731,42 @@ struct drm_xe_oa_stream_info {
> >	__u64 reserved[3];
> >  };
> >
> > +/**
> > + * enum drm_xe_eu_stall_property_id - EU stall sampling input property ids.
> > + *
> > + * These properties are passed to the driver at open as a chain of
> > + * @drm_xe_ext_set_property structures with @property set to these
> > + * properties' enums and @value set to the corresponding values of these
> > + * properties. @drm_xe_user_extension base.name should be set to
> > + * @DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY.
> > + *
> > + * With the file descriptor obtained from open, user space must enable
> > + * the EU stall stream fd with @DRM_XE_OBSERVATION_IOCTL_ENABLE before
> > + * calling read(). EIO errno from read() indicates HW dropped data
> > + * due to full buffer.
> > + */
> > +enum drm_xe_eu_stall_property_id {
> > +#define DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY		0
> > +	/**
> > +	 * @DRM_XE_EU_STALL_PROP_GT_ID: @gt_id of the GT on which
> > +	 * EU stall data will be captured.
> > +	 */
> > +	DRM_XE_EU_STALL_PROP_GT_ID = 1,
> > +
> > +	/**
> > +	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate
> > +	 * in GPU cycles.
> > +	 */
> > +	DRM_XE_EU_STALL_PROP_SAMPLE_RATE,
> > +
> > +	/**
> > +	 * @DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS: Minimum number of
> > +	 * EU stall data reports to be present in the kernel buffer
> > +	 * before unblocking poll or read that is blocked.
> > +	 */
> > +	DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS,
> > +};
> > +
> >  #if defined(__cplusplus)
> >  }
> >  #endif
> > --
> > 2.47.1
> >
