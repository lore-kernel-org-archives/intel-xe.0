Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB967D3B7E2
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 23:49:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B17A10E44C;
	Mon,  8 Dec 2025 23:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A5WpsgPl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F84910E458
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 23:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765237795; x=1796773795;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2nnxpKs0oknb+WCL9uk6ZfbyFZLqT9eU6TgOPHrBEXM=;
 b=A5WpsgPlvhQnXQAaSLbg4KEFGb5cAJXPlfELpSHhmOxdCMSlS35URx8t
 bM99pUJR41y6Wz/AzNm0EOSGHNTQV+dJoY3oPOrVGI6sTEX0Tc7HAvL9T
 otLLtjiEIsD9HiyDxQBL3nbrqQ7yqhR1P9iia64FSLzfVqYUGt5777F44
 3frdswsh0OiAxKA7lcv9BB0LQm21cgpgfSsOvTRH31DQsWW89dCJljhQl
 6dtSDRD3a1G3EHCuGhFhvG1kTo0qbcABPvszBQgXqRqbPv/0BSfonhSSU
 ccOoy+HDryYcvBa5OvxNNT2x6iWIcoy1OsiPD2cuwdNdt69xKdZmgNhpZ g==;
X-CSE-ConnectionGUID: rcNeZIAVSkqHdnN6TkqMxQ==
X-CSE-MsgGUID: Yx49CszPRA2nALSAYDUupg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67073838"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="67073838"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 15:49:54 -0800
X-CSE-ConnectionGUID: X0CLOUWVSh+Xu38RdFroUA==
X-CSE-MsgGUID: omOkdUT0R1+F3gy5HEn/gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="196120824"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 15:49:55 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 15:49:53 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 15:49:53 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 15:49:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9VWEhyvXPuSO941x9Iv4nwYUspTAs4t1cYqVhCEVX02j0MkPAPI1ufb2gNWkKUaB9W67m4Yl4slyN0R2xFFgSX8xIgGoEcWnL8QAnM2pT99Is4wOu/YR74L2Bi83e9RXytpTn2eKfd2deAHgEY4/KE3dN3BdMmnIAQvnX73YSwF/lDi/SgGMYVWxQbKVWWIQqY4yJrGDkhuXeHZDzGdK/HPPPPN//X3lS/HNv0AJ/PxrvgGcjt4ifEMOvrJqHYaRs9FsHAZtrfI0QUgcnn503W/jzON72niaQ2hIO+6lLRmF4y2jgYgSlodMYigg9Y540qu0bI1iDK7BYlQ/V3XQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pY8D8Ium1HVk2F1o1xvwFzajHQqbt+ZlMASldoA8OaA=;
 b=Y74VWEn2v1tZVLIJTMe1ujMrGavttQaT8EMcdCSvdKURGCVCmySusOsSVHdn/SNN3n4p9q+xWINX2pf9YrqfVtk4x+XlFPoIOXAbHYgD09PzYOVki8p9epgry9a5Zf5YRuey4qX1zcZjuXJ0KQPwSTPMQw194YXG/4Dgtw7/cWPPwFzSkJNdRjCUu7XqWVBYNuxUL3lRl2r7Xem/eEVSIMTppJRpwRPNxn+OWkl2035mfogYhy0+p+G2pLRcjmo+mNdMPjhopZHac8fSqMclbOh3AgHgsfYJq7xwCECzYHWsuuJKD4g1PkGg5Tw1FPIg+6CfuhRsP4HyXMxTU7H61w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7755.namprd11.prod.outlook.com (2603:10b6:208:420::18)
 by CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 23:49:46 +0000
Received: from IA1PR11MB7755.namprd11.prod.outlook.com
 ([fe80::8a57:c694:2dfa:e041]) by IA1PR11MB7755.namprd11.prod.outlook.com
 ([fe80::8a57:c694:2dfa:e041%6]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 23:49:45 +0000
Message-ID: <e50749b6-40cb-4f24-a0d1-36a83a069258@intel.com>
Date: Mon, 8 Dec 2025 15:49:41 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Decouple GuC RC code from xe_guc_pc
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251205143815.1343989-1-vinay.belgaumkar@intel.com>
 <20251205143815.1343989-2-vinay.belgaumkar@intel.com>
 <a606b491-c841-4bd0-89a7-36b76058f563@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <a606b491-c841-4bd0-89a7-36b76058f563@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0298.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::33) To IA1PR11MB7755.namprd11.prod.outlook.com
 (2603:10b6:208:420::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7755:EE_|CH3PR11MB7177:EE_
X-MS-Office365-Filtering-Correlation-Id: ebc4084a-97b8-4dca-611c-08de36b4772f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bW1wdys1amkxYWtkamxoUGdQY25YMTVjSjdKVHQyeitKZjV2RnJ6aEtxanhB?=
 =?utf-8?B?OGYyUFBEYlJxREdKT2RMVWo0S2VZQWtVUTRBSHN4VXl0cjdmRGhLWE94bVBl?=
 =?utf-8?B?YzBIaEtpazdyV095Q080TXpGb2FWZm9xNWFOVS9kQ3J0cnI0b25sZW5CaWs4?=
 =?utf-8?B?UVlxWlR4Y09sQmFjMm9nQW4vUHJYeUd0MzBEc09nWkc2bDAyZnE1dmp4emtQ?=
 =?utf-8?B?TjBqWTB1N3JOUTM1VmFKdVRRTWZCcm45eGtIV3Zab1hCdkFMbWFhbXdPbmtH?=
 =?utf-8?B?OFdid0I3SXV0NG5XdDJmdXdSVUJ6VHViRHZ5ektjN2E3SWNiZ1BlOUtWbG9p?=
 =?utf-8?B?R1RXeXJKcEt3VHJ5QWhoMGtOQjdrZmpWbERJRkNGUnBxRHdsZjdaTGhOazZ3?=
 =?utf-8?B?SjVUcURpZjNlY3RNWTY0aEc2aENjNldTZ0RJYytkY2ZPRzdGTUxjUUdqNGRx?=
 =?utf-8?B?ZXhkUnQ0Ull0L0FtdFZaNWRMU00zNnF5cUUrUC9GMThiUThLOVhaT3FuSGgw?=
 =?utf-8?B?UUFTM1hPMUF2dnQ0M2I2NFB3RXFOT0w1QmNzSGdLRUgrSGdML0JqTVRMQXh0?=
 =?utf-8?B?MEdwUW1JRTNhUXdpVEZRUlF4ZE9CaU1wT29JdUVreXJsVHBqUEFKZzl1OWhV?=
 =?utf-8?B?ODE4M1lURHRrMEJGNk1BbVpLUTdzZTZXbFdmTXBGVHZzS0JWOVlHaHprS3Nr?=
 =?utf-8?B?ZGo0NzMrcnM2UkRYRDcwS200aGk1U0cyb3ZwZWVKNng1bTdXWm5uZnhJT1gw?=
 =?utf-8?B?YlhKQTlpQW1yeEZwcFBHVHRqM3RJOW4yRzBSdmZ0bCswVm1lUVd5ZldDNFRL?=
 =?utf-8?B?bWVXUlRzTzdPa01SNUtEQlQ1UVYzZjAxQkIzQTlFU0FKbFJRSGEvL29HWnFk?=
 =?utf-8?B?em5UMWZ2Mm1PbFlUT09qMk5ubEZFa2YzVTkwV3U4Y3Nhd0pCU2JUcUtSNkIr?=
 =?utf-8?B?OTVrUitMbzR1ZHpFNHJza0ptTGV6MXU0bmN0MDN0K2JaOXB4Q3RLa1pnbFJD?=
 =?utf-8?B?dHYwVDBGOFBjejJKQjhtcGJ6ZXpYV3R6a3FaK3l6b2wxL0lZbFVKemhsU1VY?=
 =?utf-8?B?elhNRUtxUHlnY1hyWmk3dFdLeU51bFc5bERkLzFSVGNzYlQxdkRyQkdkcDhj?=
 =?utf-8?B?SGhSMFBCRVR6NzExSDltK0w5cjRrOEc5SCtaUy9KYWUrZVNjVEptemNhS2wy?=
 =?utf-8?B?bForTi9kMFlxVG14K0RQK3dIUkh1b1BSNUFxOTlMUHNHZ1BHaDBDcWNqQkU4?=
 =?utf-8?B?c1h4T251S3RXVmVCcE1iaVA0M2JjVzFpUXoyRWx3OHBXelNhRzkxeVo2NkpO?=
 =?utf-8?B?R0RERC9Oa2J2MTZweFhPSDZYR0EwenBuN3VueFIvTWgvS1ZROXVLZml5UGhN?=
 =?utf-8?B?dkIrdWJ5TlFpZm5ueUxGN0F0U0hRVUpadW0wUGp0RGNZMk1YakZLYnU1RkpR?=
 =?utf-8?B?b2xvVHJISjZoaERPbnZhYmpVdzF2VHFxNUIvVGlhNjkvSTJGZGFuMFpiZFlp?=
 =?utf-8?B?ZjBWbE1pb2V0cFRxR0UrSzFMRWNSSk0rM2hqYjJ6MlU1K1pBaVh0NDdJcXg2?=
 =?utf-8?B?Y3ovUzhnU2NLRjdVYVJPd2ZBdG1NUCtTdDdhdWJXbmtCYXFod2x5SExaSnI5?=
 =?utf-8?B?T2lkZCtIcnFreWNLUit4TlNhNTM1ekJqcm9DZDY4QUl2dUhpOVNnWGczNVJ4?=
 =?utf-8?B?NTJuMVZaOU9lVUx3SUoweHpLcGxMY0JxYUIzcXV4M0hlTFhpWUJUZVJBNVJk?=
 =?utf-8?B?YS9XMEpBNk95Tmt0OHhMeUlVUU4xeDRCdUY0amcrcVJJbC9aUnRWQlBQQTIw?=
 =?utf-8?B?UzFIT0NRS1ZNQXdZTXBFMU1KT250ZXRDRnVETTJWbTRBQ082WmliUCtESmVO?=
 =?utf-8?B?bWJkUlJIK09QbXBRQXJyb0NlRWRxbzNqTDlYK3cxN1VDMzFicnBxZzdSeGx2?=
 =?utf-8?Q?Z45TjIp7k4plbaYlPu/+eVZEemTObUgc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7755.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEROZndFdHJnOHlHUGxpTnZ4THZ3ZklNd0xNYWhtZGpBSVJvekNObnpXdnRO?=
 =?utf-8?B?Qjk3SW9jakVDUXNsV2tZTm1jRktqeStwWGhVTkRPZzJXWjZMcWF5K2NyRTBN?=
 =?utf-8?B?a1VraGFpZzhPcXdvQm5PenMxMEpicFBYelR4V0R4eTdjQ2ZvRVVlK0dlOUJv?=
 =?utf-8?B?Ylptb0NtWHlDOVc3LzAvMkh5MEg0SFM2ckVlcE12bGZETVdXRzVlc0x3NnpK?=
 =?utf-8?B?Zk1UUTAvYXAzZHRseks5YTNxaldaUDR0K1I0Z1NZMnRQZGl6QWtDcERTWUg3?=
 =?utf-8?B?UUVRNDA5RUdzMTZRMDAvT2NEdTgzZzhZS1gzTFFrUmI1cS9GTjFicjFrUzhm?=
 =?utf-8?B?dGQvTDZ5QlhXOThkdmVHOUFXTGlVQ3NoajRRSHphdjdkTDlrYkViMUJHR2NI?=
 =?utf-8?B?YTFocTB3bSt5UW8rWTB0M2hPK0RiUk9uNXpobG9rbXZveGJwbE5qK2pRdmha?=
 =?utf-8?B?anhSYTdXc0VxQ2VNME1CempxNm5VNDlDeERYVTlqYVBINFcxV213MVBVOC9H?=
 =?utf-8?B?dWJwckRPM1E0YUg2UEE1TXJPdW1EQVJocUVDa21UYS85dnhCQTh5R01MRUlo?=
 =?utf-8?B?QXFDWGw3eEZtZ091MWNad0FmQmpYOXFRYVFSZllGVUkrRWI5UUppYXBCUXVK?=
 =?utf-8?B?Z3VNenpRa0JRM1dnQlFyZ0I4WDMzN28wSVkzL0tKeHY3ZkFsQ3Q5MktMNUtp?=
 =?utf-8?B?YVhpcVhiQXo1NFM0MXF0OWpsU1N2U3N4MHUzeEFic0lZRUVIOTNJU05kamty?=
 =?utf-8?B?a2x2TlVETjg5cWNYNUlQYVp3MkMvM0c1eVZ5NlRXb0lZelNxbXNkUFVuNGl4?=
 =?utf-8?B?RkZNU3g2MFY5YnZrRHRTUnR6dlpRcVZJTEZ0aE5UQVphOHZiNjRlZ1BiclVR?=
 =?utf-8?B?VUtiZVBhL1dFTFRaQjRJOHFDZis4OWZHeTJhZS9ab2xPRmxZQlFucE9vRTBU?=
 =?utf-8?B?Skd3M2xGVmhEeThRNWkwR2RNQS9tWjZXc2tXMlZ0VC9SM1ZQaGlINzhzZEJD?=
 =?utf-8?B?R2wrWFZyTVZCbDNaQXZrd1NKVDVVakh1SnR0N0hsTVBUc0lmbUxoc2xLWDY1?=
 =?utf-8?B?YTN0dVRGRlVVWmxuclIyOFFqNWlZQStEMlUwTlJWVFBGbEZnOEE2aHkzeE95?=
 =?utf-8?B?T0E2N3pWV1VRUzFUTHY5Ukk3ZjNwdVZoYmszYnlXRTEyaVhiZUl6TWkxTlNF?=
 =?utf-8?B?dFJRQVgvbFJ4REVhNy9GQ2NFVlZCUlRrRmU5aHJZcDhoT3I1ZmVWV3JwLzV2?=
 =?utf-8?B?OUJIUytuL3BBaG1EQU9iNVNBNi82MmNLYm5veHJEZVVPeXNtd3ROOUd5Q0Zo?=
 =?utf-8?B?WlZRQkR0b3FpYWt5NjI2U1dMTllVTTJOMDhEUHhzd2RKeXEwbHgzR0FHeWMx?=
 =?utf-8?B?VXZ3YlE3ZU03NWJNalhMMXRyaGlvdWNJNmlwaGM5dTFHR09yTk0vVVBjUm8w?=
 =?utf-8?B?VUJ5L1RUU0NRY0JjU3B1c0FWMTV3dVZ4aTg5cFdTdlBJeFVtMW0zWnB4dHQz?=
 =?utf-8?B?UDlIVGJZekZWOU9pZUw5dU5Udllsa256ZEFDbTdiS1FaQkorNjNjM0pqS2l2?=
 =?utf-8?B?NWRDK2d0MWM4UlRxVGhTUjBNbXhrdFE5c0MwdXl0c0NSTjBrQWU5aUxqc1ll?=
 =?utf-8?B?WVlIaTRLVGRPWlJ4U2N5bHJmSXZmMWJWWVF3S1VnRUJCUnBtalpXWjAwdGJo?=
 =?utf-8?B?WFVKNVllY2xCVjArVFdSQ2lNaXFSRlpBZlNkZWZHN2E1aEw2RHRDc3RZNGxi?=
 =?utf-8?B?VXF2WmNvK0xhYzhQSWxxREc0dGNFMXdxUkNvcVFLaUxtUXBRRFhIZVIrWisz?=
 =?utf-8?B?UTdhaU9meTZsUU5QcFFheUxFQnczQmdxVmx6RUhtcUxkY1VIY3NoS1NRTmk1?=
 =?utf-8?B?R3VnWkJIZkdwU0R5ZHNGKzl6ekJtYlNKRklOSlNiODlEaDg3S1cwZDVXNS8y?=
 =?utf-8?B?ekhQa1pETlhMK0Q3M2VwR1REU055Q1dOTThRdGtvVXhHaUtweXBmZU01YWIv?=
 =?utf-8?B?dklRZGFGWG9BTGxtd2NHeDVTOXdjcE0yVndFdks1OEVCUE0rbXVHR2lWTU00?=
 =?utf-8?B?QkVyZ1R3U0xEeWJpQnlWWTdPUyszWjhwaUwwYmxwS2JJODZSQUtvZUxjMFd6?=
 =?utf-8?B?UWYzRy9sWVRtSUw2bHhSbTZFeFFNM1FkZWRaVnZUTHl4MXlOclQ2Q3hTaTFP?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc4084a-97b8-4dca-611c-08de36b4772f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7755.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 23:49:45.9026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/PvxMvl9rUUyZxcD8ZaxoDE6fUWn3MVbrmXOJ+TRDUZQyK2LvXhdXglo6ba+z/QALtiz++XDwxDiF2XHXd+Hq6QX74PUbBnXDVR9mV8w1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7177
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


On 12/5/2025 9:50 PM, Michal Wajdeczko wrote:
>
> On 12/5/2025 3:38 PM, Vinay Belgaumkar wrote:
>> Move enable/disable GuC RC logic into the new file. This will
>> allow us to independently enable/disable GuC RC and not rely
>> on SLPC related functions. GuC already provides separate H2G
>> interfaces to setup GuC RC and SLPC.
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile    |   1 +
>>   drivers/gpu/drm/xe/xe_guc.c    |   5 ++
>>   drivers/gpu/drm/xe/xe_guc_pc.c |  50 -------------
>>   drivers/gpu/drm/xe/xe_guc_pc.h |   1 -
>>   drivers/gpu/drm/xe/xe_guc_rc.c | 128 +++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_rc.h |  18 +++++
>>   drivers/gpu/drm/xe/xe_uc.c     |   7 +-
>>   7 files changed, 158 insertions(+), 52 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index a7e13a676f7d..d1258bd22752 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -74,6 +74,7 @@ xe-y += xe_bb.o \
>>   	xe_guc_log.o \
>>   	xe_guc_pagefault.o \
>>   	xe_guc_pc.o \
>> +	xe_guc_rc.o \
>>   	xe_guc_submit.o \
>>   	xe_guc_tlb_inval.o \
>>   	xe_heci_gsc.o \
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 88376bc2a483..72740d17c769 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -35,6 +35,7 @@
>>   #include "xe_guc_klv_helpers.h"
>>   #include "xe_guc_log.h"
>>   #include "xe_guc_pc.h"
>> +#include "xe_guc_rc.h"
>>   #include "xe_guc_relay.h"
>>   #include "xe_guc_submit.h"
>>   #include "xe_memirq.h"
>> @@ -865,6 +866,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>   	if (ret)
>>   		return ret;
>>   
>> +	ret = xe_guc_rc_init(guc_to_gt(guc));
>> +	if (ret)
>> +		return ret;
>> +
>>   	ret = xe_guc_engine_activity_init(guc);
>>   	if (ret)
>>   		return ret;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index e2e6edb851ae..5ced9ef37cf3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -253,22 +253,6 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>>   	return ret;
>>   }
>>   
>> -static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
>> -{
>> -	struct xe_guc_ct *ct = pc_to_ct(pc);
>> -	u32 action[] = {
>> -		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
>> -		mode,
>> -	};
>> -	int ret;
>> -
>> -	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>> -	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
>> -		xe_gt_err(pc_to_gt(pc), "GuC RC enable mode=%u failed: %pe\n",
>> -			  mode, ERR_PTR(ret));
>> -	return ret;
>> -}
>> -
>>   static u32 decode_freq(u32 raw)
>>   {
>>   	return DIV_ROUND_CLOSEST(raw * GT_FREQUENCY_MULTIPLIER,
>> @@ -1050,30 +1034,6 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
>>   	return ret;
>>   }
>>   
>> -/**
>> - * xe_guc_pc_gucrc_disable - Disable GuC RC
>> - * @pc: Xe_GuC_PC instance
>> - *
>> - * Disables GuC RC by taking control of RC6 back from GuC.
>> - *
>> - * Return: 0 on success, negative error code on error.
>> - */
>> -int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>> -{
>> -	struct xe_device *xe = pc_to_xe(pc);
>> -	struct xe_gt *gt = pc_to_gt(pc);
>> -	int ret = 0;
>> -
>> -	if (xe->info.skip_guc_pc)
>> -		return 0;
>> -
>> -	ret = pc_action_setup_gucrc(pc, GUCRC_HOST_CONTROL);
>> -	if (ret)
>> -		return ret;
>> -
>> -	return xe_gt_idle_disable_c6(gt);
>> -}
>> -
>>   /**
>>    * xe_guc_pc_override_gucrc_mode - override GUCRC mode
>>    * @pc: Xe_GuC_PC instance
>> @@ -1257,15 +1217,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>   	if (ret)
>>   		return ret;
>>   
>> -	if (xe->info.platform == XE_PVC) {
>> -		xe_guc_pc_gucrc_disable(pc);
>> -		return 0;
>> -	}
>> -
>> -	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
>> -	if (ret)
>> -		return ret;
>> -
>>   	/* Enable SLPC Optimized Strategy for compute */
>>   	ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>>   
>> @@ -1310,7 +1261,6 @@ static void xe_guc_pc_fini_hw(void *arg)
>>   		return;
>>   
>>   	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
>> -	xe_guc_pc_gucrc_disable(pc);
>>   	XE_WARN_ON(xe_guc_pc_stop(pc));
>>   
>>   	/* Bind requested freq to mert_freq_cap before unload */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
>> index 0e31396f103c..1b95873b262e 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -15,7 +15,6 @@ struct drm_printer;
>>   int xe_guc_pc_init(struct xe_guc_pc *pc);
>>   int xe_guc_pc_start(struct xe_guc_pc *pc);
>>   int xe_guc_pc_stop(struct xe_guc_pc *pc);
>> -int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>>   int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
>>   int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
>>   void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
>> new file mode 100644
>> index 000000000000..945433ef35f0
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_rc.c
>> @@ -0,0 +1,128 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include "xe_guc_rc.h"
>> +
>> +#include <drm/drm_managed.h>
> since you are using dev-managed action, maybe it should be:
>
> #include <linux/device/devres.h>
ok.
>
>> +#include <drm/drm_print.h>
>> +
>> +#include "abi/guc_actions_slpc_abi.h"
>> +#include "xe_device.h"
>> +#include "xe_force_wake.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_idle.h"
>> +#include "xe_gt_printk.h"
>> +#include "xe_guc_ct.h"
>> +#include "xe_pm.h"
>> +
>> +/**
>> + * DOC: GuC RC
>> + * ================
> remove this underline, this is not a RST
ok.
>
>> + *
>> + * GuC handles the GT transition to deeper C-states in conjunction with Pcode.
>> + * GuC RC can be enabled independently of DVFS, which is also controlled
>> + * by GuC.
>> + *
>> + */
>> +
>> +static int guc_action_setup_gucrc(struct xe_gt *gt, u32 control)
> for "guc_action" functions we usually pass "guc" as param, not "gt"
ok, will change to use xe_guc * instead.
>
>> +{
>> +	struct xe_guc_ct *ct = &gt->uc.guc.ct;
>> +	u32 action[] = {
>> +		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
>> +		control,
>> +	};
>> +	int ret;
>> +
>> +	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>> +	if (ret && !(xe_device_wedged(gt_to_xe(gt)) && ret == -ECANCELED))
> btw, is this wedged/ECANCELED check a GuC RC specific case or generic?
> if latter maybe we should return dedicated error code from CTB ?
It is the latter. I think we had added this patch a while ago since we 
didn't want to flag an additional error during wedge state. Not sure 
what you mean by dedicated error? Since CTB code returns ECANCELED when 
this happens.
>
>> +		xe_gt_err(gt, "GuC RC enable control=%u failed: %pe\n",
>> +			  control, ERR_PTR(ret));
>> +	return ret;
>> +}
>> +
>> +/**
>> + * xe_guc_rc_disable - Disable GuC RC
> for function doc, we should add () to function name
>
>      * xe_guc_rc_disable() - Disable GuC RC
>
>> + * @gt: Xe GT instance
> hmm, as feature and file have "GuC" in their names, why functions take "gt"?
> they should take "guc" like all other "xe_guc" functions
GuC RC(RC6) is per GT, so felt more intuitive to have it that way 
instead of per guc. But can change to use guc instead since it is 
enabled through guc.
>
>> + *
>> + * Disables GuC RC by taking control of RC6 back from GuC.
>> + *
>> + * Return: 0 on success, negative error code on error.
>> + */
>> +int xe_guc_rc_disable(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	int ret = 0;
>> +
>> +	if (xe->info.skip_guc_pc)
>> +		return 0;
>> +
>> +	ret = guc_action_setup_gucrc(gt, GUCRC_HOST_CONTROL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return xe_gt_idle_disable_c6(gt);
>> +}
>> +
>> +static void xe_guc_rc_fini_hw(void *arg)
>> +{
>> +	struct xe_gt *gt = arg;
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +
>> +	if (xe_device_wedged(xe))
>> +		return;
>> +
>> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>> +	xe_guc_rc_disable(gt);
>> +}
>> +
>> +/**
>> + * xe_guc_rc_init - Initialize GuC RC
>> + * @gt: Xe GT instance
>> + *
>> + * Initializes GuC RC feature.
>> + *
>> + * Return: 0 on success, negative error code on error.
>> + */
>> +int xe_guc_rc_init(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +
>> +	if (xe->info.skip_guc_pc)
>> +		return 0;
>> +
>> +	return devm_add_action_or_reset(xe->drm.dev, xe_guc_rc_fini_hw, gt);
>> +}
>> +
>> +static int xe_guc_rc_enable(struct xe_gt *gt)
>> +{
>> +	return  guc_action_setup_gucrc(gt, GUCRC_FIRMWARE_CONTROL);
>> +}
>> +
> missing kernel-doc
will add.
>
>> +int xe_guc_rc_start(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	int ret;
>> +
>> +	xe_gt_assert(gt, xe_device_uc_enabled(xe));
>> +
>> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>> +	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
>> +		return -ETIMEDOUT;
>> +
>> +	if (xe->info.skip_guc_pc) {
>> +		if (xe->info.platform != XE_PVC)
>> +			xe_gt_idle_enable_c6(gt);
>> +
>> +		return ret;
>> +	}
>> +
>> +	if (xe->info.platform == XE_PVC) {
>> +		xe_guc_rc_disable(gt);
>> +		return 0;
>> +	}
>> +
>> +	return xe_guc_rc_enable(gt);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h b/drivers/gpu/drm/xe/xe_guc_rc.h
>> new file mode 100644
>> index 000000000000..3a8c8d50313f
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_rc.h
>> @@ -0,0 +1,18 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GUC_RC_H_
>> +#define _XE_GUC_RC_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_gt;
>> +enum slpc_gucrc_mode;
> enum forward not needed here
ok.
>
>> +
>> +int xe_guc_rc_disable(struct xe_gt *gt);
>> +int xe_guc_rc_start(struct xe_gt *gt);
>> +int xe_guc_rc_init(struct xe_gt *gt);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 157520ea1783..44e5fabe2a50 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -14,6 +14,7 @@
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_guc.h"
>>   #include "xe_guc_pc.h"
>> +#include "xe_guc_rc.h"
>>   #include "xe_guc_engine_activity.h"
>>   #include "xe_huc.h"
>>   #include "xe_sriov.h"
>> @@ -216,6 +217,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
>>   	if (ret)
>>   		goto err_out;
>>   
>> +	ret = xe_guc_rc_start(uc_to_gt(uc));
>> +	if (ret)
>> +		goto err_out;
>> +
>>   	xe_guc_engine_activity_enable_stats(&uc->guc);
>>   
>>   	/* We don't fail the driver load if HuC fails to auth */
>> @@ -246,7 +251,7 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
>>   
>>   void xe_uc_gucrc_disable(struct xe_uc *uc)
>>   {
>> -	XE_WARN_ON(xe_guc_pc_gucrc_disable(&uc->guc.pc));
>> +	XE_WARN_ON(xe_guc_rc_disable(uc_to_gt(uc)));
> maybe use xe_gt_WARN_ONCE_ON(gt, ...) here

ok.


>
>>   }
>>   
>>   void xe_uc_stop_prepare(struct xe_uc *uc)
