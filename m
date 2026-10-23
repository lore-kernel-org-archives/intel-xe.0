Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72819606A31B
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 17:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Rl7vmOQN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A28A10E6BE;
	Fri, 23 Oct 2026 17:07:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034D310E6F4
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 17:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792775251; x=1824311251;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0JCbSKdeTTWce1hHw/EFOAzzSRfd+qdijqpBu+0Oax4=;
 b=Rl7vmOQNGhD8fR/YhzY1eCsWCFqQJfIOW5UtKQutWFHuQz9N5mhrEaJ4
 TOLJJbh8nD4m4K8oMZ5QFXwIUEReUg1/SbDdb+vL0F5JnM1xNdmdYuQSw
 ijKWipSCCGdxY/0681BnGtA8vv7/6828dXZnlk6Rs5eo5aZlq8sQgsbkU
 MpPunBhkHREhpaU+hMfGnaAfe5zMy/1zJR7xDHyvYCibNNAGnUg+2lE/G
 F3Oldp9rZQKT4SVTHGPUVnqehjxnKDLBMLw4MLrce0dNtVo0VWChnjCDV
 0jDOrS6iQqbKx6JkJJMO6fV/5Gvor7U19sxo1C+ibdf9ycwQoZUdPz7A8 w==;
X-CSE-ConnectionGUID: SPRuMXahQ5eXGouXF6fFVA==
X-CSE-MsgGUID: yw+ktYjxRQGIGgKXmlgbwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1443003"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1443003"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 10:07:30 -0700
X-CSE-ConnectionGUID: qomL0G9nTW+h/4EbZNj4aQ==
X-CSE-MsgGUID: gHCcdqy6Sq+Wt7xDZz0XcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3689227"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 10:07:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 10:07:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 10:07:29 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 10:07:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uTRoSK2tWTblHOwVdiWKjZCC9V8bXIc3LIgX16v/punmS6WyT723Dc8krwK7NCzFfEtA4RMw17WE+NwJ9k/mKpq2pBH86c0fPJ6vbsC/0LzAfIuhqH/ZSQviaTWmlxsQq/2GBtpO0DAy4q6LAIowWMCwfRo0VvEo2uiRdcPQTpd4MDctL6tDpEf5W0Q1WjC0QKcZl9cmPQVt7j+f8UDsCS6iB1XUOn1NPXK3qEkZysflz0dgWw/MqortkHs0VpcaftIB9TqI+njEzgLLvFHgZF3aFwN5iQYY8c06C+hK530xv8HlwBKB0LKSz0yO4susKm8boET9iQhMboemOrgKEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+Lyyi4v+K8/SDwIlgnACOGOgX7L3RU9lNmCfoAJyvw=;
 b=F5OGFOTf5XT/nezfjGRfU2W9OSthmSi7WdJiERgJq3rY0++R+3lN+4yGpCs9H08zZ4QCnluYwYCVh9SL4TL871Ux0LBNc6y4zwWCFN8reNbv2AKDCkYtVDA3QOWlEuc81ALUOvymLNCrM7QPUZmaPkMBx9MWgN1YFi7HOYtNIxZ3cnZwFqJ2vkQK1mxCCsCAo0HnKdOHXIWyg0KsgKDaluVpZ13YcfRzxxGf6vthhxE9HTV/WfXI08Wy7GFVw2GwsvjAZVgPkOR5l52d0ZkMUQFSkEb8tGSduBNvI9lqusbV8jnaD4grRg18tBM4mu3iAZK33h3k9aYDpAb7XeWYpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DM4PR11MB6018.namprd11.prod.outlook.com (2603:10b6:8:5e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 17:07:25 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%7]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 17:07:25 +0000
Message-ID: <63feb129-946f-4915-8869-22c62be2bf4c@intel.com>
Date: Fri, 23 Oct 2026 10:07:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/xe: Access GT MMIO after pcode init
To: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Karthik Poosa <karthik.poosa@intel.com>
References: <20261020173943.669600-5-vinay.belgaumkar@intel.com>
 <20261020173943.669600-7-vinay.belgaumkar@intel.com>
 <7a1417ab-b7b3-4fe9-ad90-98b293732106@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <7a1417ab-b7b3-4fe9-ad90-98b293732106@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:a03:255::35) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DM4PR11MB6018:EE_
X-MS-Office365-Filtering-Correlation-Id: e47296af-e449-45de-d76f-08df31281c0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|6133799003|22082099003|18002099003|4143699003|11063799006|261021121427099003|10067099003|261009223027099003|261021123027099003|261022105027099003|56012099006|261022075727099003;
X-Microsoft-Antispam-Message-Info: +SEI/rhwf8WxuuK/eBJaj5RYk8J1G/Ay3Uz31HRfAxgg+EhQ1xQyktDecxTcVj1NBJcWaP+UuqpktXSNDXybgDWolVGb1K0goQBnmjggUrwMnvJ5qZkmbDnHJ/29wxrwGuDQr9hONsZ3jpIv7haTRcPFqoYXu7OpWq0YZTMb3VpakJzCKHrP783dpEqam9KLO/BKD5BUmUFUedtWvkH/3mXT8Yx5NZzTaXfOFatoPJSy7IDWY8Pt0xmz6iSJmHZXPT4LawrDOyW5qCWy7PrYHyEUTgbJwViGIj6P8tejPW+3PElPaaR9yeOptv5pCePs9+h9m6qA3bxNoNHYUh5jtBVn0jDwqUr4f0bq1VpL6zYc10SmtfU7QXsFSrrgqBq/iXIR8S97fGaqmMkB0vJWwVrf2M0XG5BaKq2lQfPQ0cd6n5aZO4N4N1fqQn95sTjvI5ASPDUQ777ha3EMfeQr2VnN1wEaIqVPlR6qdmik6lFz6oiddYY3HppNNH/pSY92juJTshp7rxGwbOn7A1EeG3+E/RRV3en6Gckbt2tICA3aqy1ZCjO4lZcFdCPX1p/y2ya/nm7QtzO3KDionRx0YCbm4L5axC3ZT8gUMxrwQUM87JhmUT7yu2YB+2Lj80f5ejEyLRajHdUdY37Q/APuMlZaB67NdB6OeMjHGx3Y+XM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(261021121427099003)(10067099003)(261009223027099003)(261021123027099003)(261022105027099003)(56012099006)(261022075727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW1MR3d3WVBoNGdHbDFXdVVhZVJIUG4yMU9xK1o1OWVHV3FHQ2J0THM1RHpw?=
 =?utf-8?B?ZnZQTHhkT0lsTkZoUXJ4ZEp6bUpsdnl4K1FPaG9BZXRXV1M1YWxudURFUEVl?=
 =?utf-8?B?NVpLTkRNYXpNL1RKaGpPcGY3R2p5U0FPOElvQ040ZWo4RXJXVm9oV05aTTUv?=
 =?utf-8?B?Y3NVcmRiY2RoWktYYVBiZHdLVElUcXEyYWJsWTBhUG9kd3Q4SXhtcGdlZy9H?=
 =?utf-8?B?MXR5dHhIOEtlZFhNWjZDVE1lemNrYmt5L2J2cGtMUmNMRTkyV1FEV1JTUkVp?=
 =?utf-8?B?d2tCVGlSVjk4TDlnenZjNW4wYlEwTjRDdTBHRXF3SW4yOUhHNnBBNDZKSFcx?=
 =?utf-8?B?UFBlbHdUbmFXZ0hXN3E4cEZwUjNzNmthLzdOaUNRaUFWSWxXWi80bjFLTE9T?=
 =?utf-8?B?WGhiRU9KS3JxcHZBZXR1Ukh3YjMvWUtVVWR1cXV3TVRmYVl0bEwwQmF4WVBJ?=
 =?utf-8?B?TmIzdGVJWktsUkNqVFF5UzRnUjlZdTZYdGlFazdrMFVOeUpiZlNhVCtlclh2?=
 =?utf-8?B?T21YdldXcFdlNHFPRnlOeFlTK1JETW9WeldiZEpiOHg0N1RzeEpwaDVCK1A1?=
 =?utf-8?B?ZzdxTnU5Y2FzRHFjNjNzR3ZTTGJGV1V0TVZVRHhMT0JaR2xjcWZUUEZseG5S?=
 =?utf-8?B?R1RxWjlQdGM2akdNWGZ3bTlmaUNhTWgyZm1wcytXWEo4VmZNWkI4NVFWSXk2?=
 =?utf-8?B?Skw3NlhqdGpyQklpUXZiOTRrYm92djVzZERTWUo3QldDRDU1T2ZyWHg2MjVZ?=
 =?utf-8?B?SStnNWVDM0luYm5od0JPTlBRbFY2OGJEUHQvUm9YOTkrOEdjTmhRcWdrRE4r?=
 =?utf-8?B?anVpL2dDVk5FTVZJWDlaUFpndFZlcnE1UUFWaU9VQ1hrZCtwY2J2V3lSazNK?=
 =?utf-8?B?SnhNVGVEZUU4T2drdTBDNXhRSk5vWGdiTWg3ZzJ1Y25DYmI1Wmc4OWZZNGZT?=
 =?utf-8?B?U1NqdWFaTm9jdXplN0E5OTE4TmZUZkJvcTVQQlpXaWkzVG1EUHdJTk9zanNo?=
 =?utf-8?B?cUhKMm45bmN5Qk9TdVFScVkrcVl1eFp5dEFnM1NQRC9jRHVmNVowbjNMamhH?=
 =?utf-8?B?NUlyN0tLcUZmQ0J3a0ZSUEFSUkZUeEF4Z3RlR2szNUU2S2dIZ2Z5c21wM3N4?=
 =?utf-8?B?czVVUkZvVEU2b1htZlBGRkFHNmcwRWJSQk5qL05EeG5aa2s3ejlFNnpZY0Q1?=
 =?utf-8?B?ZWhkTGxGMXZtTGJwcEpzVGF5Q3pZTUEzN1doWmhuNXkwRFNCZGU4RTVUZW1E?=
 =?utf-8?B?RzJlRTZzOW1UM05rRVhPY3pmbmp2RUVZMFVMYUVkSWtnbFp1QVR2ZHlKS1Jm?=
 =?utf-8?B?SitycEErUzFjRnE1amFHVXJLK2hoUTYvandocXJ2bjlKYmhkVGFuL09WK0FR?=
 =?utf-8?B?WU44bkluSG9oWmxHYStvSUY4ZXdzMFh0cG9BcEdnUEhRdkNnOCtiZGdyNmJL?=
 =?utf-8?B?bnoxck1KTlVNN0tRWnZrUGFtdEZIV0FVZEU0ZlRSalNPdk15UzVUbUNxRXN6?=
 =?utf-8?B?RlloMUZWZHlNSGRSRVNvQXFLa015UXlQQllqTHVlTFVnM0RsQjB3am5ta2kx?=
 =?utf-8?B?MElwamo5NTFmNC91Qy9xR3lqeWtxdlZLejUyWjdWZEg5UlhSSnZPTWoyeFBj?=
 =?utf-8?B?MnpSRDlzKzVYVk5UZVc2UzlxTStmMHJYMHYzY214Zkl3Y3lYSlN6Vm9lVHpK?=
 =?utf-8?B?ZEN1QjVnTHF1Rk4xcVViK2ZaVFZxNHBtbmcwVWlSZGlvRVVJdEprSHNTYi9H?=
 =?utf-8?B?YmpDTzEzUCtYN0hJM2V1SUxGdit1ckJkc0M2dVAwclowSDFvemNZQ1VOQXF1?=
 =?utf-8?B?Sy9tSGxia0YwZ25YajFuNUMzTG5JVXE5d2x6K1lGU2lMTmM4M2M1VGlVZ1NS?=
 =?utf-8?B?MHRySzhGb1R5bFF0VHN5YXBKVTVVdkJxOEhyS2xHejM4enludCt4MnJzL3k5?=
 =?utf-8?B?NlcrQVFTcFlXUHRjMjJWSVArZU1WbC8zNUx2WjJ6WFZGMDNqVXdLUzUyY2hU?=
 =?utf-8?B?U1JHNkxKd1pybS9Vc1ZKZnk1OFVtZTNaRDBraHRyWlBWTk45bm5yU205aVlP?=
 =?utf-8?B?UWJhY0MxM2N5K2JvUWNtQ3hZemptdGtQTTgzZTk5NTVZVHFZNWpzRmxTQnU5?=
 =?utf-8?B?NEZ2dTlySW9RbjJPdEx1TDlwRG50NjZrWHdGUHRnWmJWYXF3YUhOZ0J6c1Zp?=
 =?utf-8?B?WEFwWXJ0MkcxRVpYUHllTXdPWjZkZWUwZGVvZTRyL1NIaStRZElSR1haZDVR?=
 =?utf-8?B?UGhaaFVORVBkU0dXS0Y1Rjk3UXprL0dET1oyYVJMOW5LWGl6TERNOFBhVDFn?=
 =?utf-8?B?anYxYTRrZTBCUnFxTVV5YS9Lbnd1TVhuU2xMWDFma2JsSU1FdDN0cWNKT2lt?=
 =?utf-8?Q?EDGYpiAFeNrKzRpQ=3D?=
X-Exchange-RoutingPolicyChecked: l7b6jpvZ+aYJJSBAbPSw3gC5uYDAU8J4jKy9ac2RFveOBLIv2tExZ2Epf5Xs/hK5WKLQVP6XxHb1/8uTP4xEkWBqUPAkWPVXXXKy2FV31/WzaExbXtDWRCodzxMHVibHkV5/pvwF0ey4+nUNigiG+CTrVipfVxIs/DiMsuvWBMFwcFvxuyhEVpvHpkYcPjn5WlLckcPoZXy8QjMGTsvc/qMBX4tUIxJ5aau0d+mtgjWcVxJ7VXm6AsaO3SdkDdBw//1UTQkpySWSk28r5M5nmKfsR7Q+gForfGL1wEm1BCeEDc+pCG0u24X6lYUurbqP+eAToHe5YpukDFj1Omf0dw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e47296af-e449-45de-d76f-08df31281c0e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 17:07:25.2182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Ne1heL+lCBJqYNfS8qJUCYu0v9V6ATqgZXhrjzoUJeFNjOkskmAmCP9fZ5sgqlhIc6fpVwS30iaaqMIpow4E+y+PS3SdoRmTTDv5LMFe68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6018
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/22/2026 10:33 PM, Tauro, Riana wrote:
> Hi Vinay
>
> On 20-10-2026 23:09, Vinay Belgaumkar wrote:
>> Allow pcode initialization to complete before we start poking around
>> the GT MMIO space during resume as these accesses go through sgunit.
>> We do write to MMIO registers in xe_wa_apply_tile_workarounds(), but
>> those are in uncore space. Those accesses remain viable even during
>> d3cold suspend.
>>
>> v2: Clarify about xe_wa_apply_tile_workarounds (Karthik Poosa)
>>
>> Cc: Karthik Poosa <karthik.poosa@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pm.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index daa7ba2df317..1f5097875bcd 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -241,9 +241,6 @@ int xe_pm_resume(struct xe_device *xe)
>>       drm_dbg(&xe->drm, "Resuming device\n");
>>       trace_xe_pm_resume(xe, __builtin_return_address(0));
>>   -    for_each_gt(gt, xe, id)
>> -        xe_gt_idle_disable_c6(gt);
>> -
>>       for_each_tile(tile, xe, id)
>>           xe_wa_apply_tile_workarounds(tile);
>
> Currently we are not accessing any gt mmio in this function. Do we 
> need this function before device is ready.
> To avoid any other additions causing the same issue, can we move this 
> after pcode init and add a comment .

xe_wa_apply_tile_workarounds() has clear documentation that it is meant 
only for non-GT/soc registers. This particular WA is disabling sgunit 
clk gating, so I think it should be fine. Uncore register writes are 
allowed at this point.

Thanks,

Vinay.

>
> Thanks
> Riana
>
>>   @@ -251,6 +248,9 @@ int xe_pm_resume(struct xe_device *xe)
>>       if (err)
>>           return err;
>>   +    for_each_gt(gt, xe, id)
>> +        xe_gt_idle_disable_c6(gt);
>> +
>>       xe_display_pm_resume_early(xe);
>>         /*
>> @@ -698,13 +698,13 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>       xe_rpm_lockmap_acquire(xe);
>>         if (xe->d3cold.allowed) {
>> -        for_each_gt(gt, xe, id)
>> -            xe_gt_idle_disable_c6(gt);
>> -
>>           err = xe_pcode_ready(xe, true);
>>           if (err)
>>               goto out;
>>   +        for_each_gt(gt, xe, id)
>> +            xe_gt_idle_disable_c6(gt);
>> +
>>           xe_display_pm_resume_early(xe);
>>             /*
