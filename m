Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AC3C369A2
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 20:22:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B0F10E130;
	Fri, 11 Apr 2025 20:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TAYxfhJw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF1710E130
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Apr 2025 20:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744402924; x=1775938924;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KMdHLUFG8/apB66EDUv76B14WBddShdJjzvfCq/zcGk=;
 b=TAYxfhJw+DqmERFKocoxAIGLWX5P2XVBXhPGK9sJNE7naoFbX0MfxIDx
 U0yGSSqjr9UzcLiJQfFTz6EDxu6udxG1OvP5nBbdb1ObKPfGCg0QELIz2
 fbXuWMKgHIG//uQd16ptVaFPvIoXg1z0bkUGZnohjFI5+a4PL4rJfS7DP
 Ge2HgchRNlrfOfvabB4LSCE0nj0NBQhRGlZpqE9sAO2xmgL/K5LEOxDET
 CjiZh2B/ezIu1leowmJH5YAsOFpG+vnsn7aghUwhlawSoX6iCw8kBfq6o
 C49RVrjEWCRfOPo8vg9ohS7NIycwx8+Q98GBqH4ftF6dsyEnlGoEmZocz Q==;
X-CSE-ConnectionGUID: xzGKVurIQT2IIjunsFuddg==
X-CSE-MsgGUID: Q5fbRzTkRGOY4M2EKdSYEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="33578535"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; d="scan'208";a="33578535"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 13:22:04 -0700
X-CSE-ConnectionGUID: vHDkzcV5R/KpgT+AGKXZPA==
X-CSE-MsgGUID: iKO0XhiyTxSj49j4nlqvFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; d="scan'208";a="129633934"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 13:22:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 13:22:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 13:22:03 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 13:22:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qxwz5+draKvRWX6oChdEuJpQVaWAaxc9zu6p+q1Nqz5SXWFl79Lf58t2yC2R40XiY16Z5mxOM1ixLleNgyWgMT+Vug1MJrPO++vrXqkQ8ccHLbl2ZjbmCuqwEuajUzUsVlyco5g7Ht2/TKbfxsVLmtn2KyjJx6EZXnlWZvLgCiAj6Nki702BqCQxK5TGJG2crsfIsXXB4epyhMhOOI+oBrbKrogJJ6YpvIx7xt6eALsvcYrx+yGTN0CEAWkcSVRZjJJQPawvYa2W0qhLKuXJ1CTeum6/WfoV4biymQ9MdDA5ZYJdpYft2gcrOf+DNXEJCpSnV0gYfitJHaC4JsVo0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPTIfuzC6vf9x9LjN4hXMDKULBx2u3wLa+t8xdWuTgU=;
 b=naXAAakdye5bBSwp/+gLXtiaHPKhI+EVKXumofPeajrNtaOUNO5quOAJrdCMaFrmoSJcQMEwgld+ErA5XwhlT55tc2tHY7MDAyaJUdo3RKFY/VpCuZq3ghYjjowwW+grAz9dGjZzw4lMSNXZcuyTxzHRzti7E+Fh0ExfQvNMrdk4TCGSbnl9Zo3b0Ehv9K3flL4Yz7sZU9tMmsDaGlpXU9LftFOw/Lq5+0CbNxbSgBehymrxfQ802btK1MxPoP2OXiXjk5KERWdiUY0eRPGIr9WqZ7y0xoUFlQyCGzuU3lGbKMtb+W6uJ+hL4wkYU+CQauydsHLBBZiPgRB6gMYm5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CH0PR11MB5300.namprd11.prod.outlook.com (2603:10b6:610:bf::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Fri, 11 Apr
 2025 20:22:00 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 20:22:00 +0000
Message-ID: <377a6819-525a-4090-a9c0-9b244ed0d3b6@intel.com>
Date: Fri, 11 Apr 2025 16:21:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe/guc: Add LFD format output for guc log
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250327234028.249314-1-zhanjun.dong@intel.com>
 <20250327234028.249314-2-zhanjun.dong@intel.com>
 <Z+YaCmivtd1Wa9wU@lstrano-desk.jf.intel.com>
 <ce6d3489-ee79-4834-b4be-1c5a590d682d@intel.com>
 <55fcfe89-2eb2-48bc-93f9-bb02109097bd@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <55fcfe89-2eb2-48bc-93f9-bb02109097bd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0157.namprd04.prod.outlook.com
 (2603:10b6:303:85::12) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CH0PR11MB5300:EE_
X-MS-Office365-Filtering-Correlation-Id: c7025bbc-450a-4ace-9199-08dd793683f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTBmZTh6b0pDb3ZGQnlOQjk5NGE3Y0hsbXZHTVAwRnBVbWhUaDFlb1FhQ0dL?=
 =?utf-8?B?cUtxYjRDS21YTHB4R2YzVUlpS2cvTE1WMGtGblhOUjZPbHlmMGdvbGlxWkw4?=
 =?utf-8?B?eENaQnFUMEVId3NoYjN6bVM1QXFFZTFrYi9KYmJGR3djMzIraTNKWUxRZFRF?=
 =?utf-8?B?Mm9uVHB6UmJSY3JXS2I5d1ZSaUp0b2t1OGRxb2Q2ODU1cnBFS3pSWllnQ1lt?=
 =?utf-8?B?b1NYN3ZkL0JKZ1JTcUkvZVNxdkhmdFIxVHhPWFlWaGhiN0dReU5pazNJSEdB?=
 =?utf-8?B?RFk3TGZtNHJkVEJqS2NVVW9VdmZudVVaY1lnYm5HNlZuam5OcWZETGEyWTVy?=
 =?utf-8?B?UVBSL3NHSDhLVDN6Y2ZhRGI2N1JkUVVOdHJqNGM0MGthTnJ4Y1NSMkZyc3Fj?=
 =?utf-8?B?YkIxRnF0cCtaMFJwWXlCVll2RTVKdHlUY1JQamJIblBja256MnByTWpqVm12?=
 =?utf-8?B?ZWVHUDlWTGZWR0x1R1htOEl5K2pkZlpremdvWG1ncXRLTEwyRXQvQ2xiVWNX?=
 =?utf-8?B?dE1RZUtZdlorclMvNWc1NEl5T2FNaVJTUzR2QVMwcDVNeGtTenRPWGhJb3Rq?=
 =?utf-8?B?QUE3YVR4c1JMeW1FQzVYeHZIV1p6dlBucDV4S3dsSTcwcEovTEJzNXFGR29Y?=
 =?utf-8?B?U0V0TThzWnpEall4SVZObWp3MGhuNTZ4VnhmeTNtWnJPZkFZblM4Z0taTkVk?=
 =?utf-8?B?UGYzUVJHTDdqbFlCbEdNcy95MkNTZ0RPZE5HOXRTRkNpOHB3YzRGWkFWdmpC?=
 =?utf-8?B?d2RpWFNFcy9RMERtaDB1NFlvM0VxQ0N0Rm00dW1vZ3liL3NNQzJYS1lCNTVV?=
 =?utf-8?B?OFZqQkw1WnUvZ2hJZi9JKzQ4NHBwZC9UN1Z3eU9IemtDL25sVEpFRzhSalhT?=
 =?utf-8?B?ZWo3Y05wS3JHcnZZeWhOS1JBbTZ6VmxrY0dlVk5CcWluRHRYNTJMNEh4WUlo?=
 =?utf-8?B?MTl3YWk0MThwNnlIbGltSGY5QlpuNXhYenRxcDM0YzVOazN4RE9ESGE4Rk1p?=
 =?utf-8?B?TWljSTl6N2wrQlpDL0FybXhJc0RMOWNhQVVSYVMrYVlXNGs5ZkhmdHhrMVhz?=
 =?utf-8?B?cEcvbEJ3VEQ3d0tBQkpwVXRjT0tsdzJURkVaOEplcWxLZ3NSU09CMHQyVnJD?=
 =?utf-8?B?RVBNUnlvcFlWa2k4RnRJU1diVHFCRmpzcUdIOXBiUndCNzhPQUtrMDM4SWxq?=
 =?utf-8?B?Q3FOTE9WZElib210UlVlR2UvOWdlS3E2R0MzWXpCZzRWMHdjekpib2hQK09Y?=
 =?utf-8?B?dGNRNDZqbUI1Y040Ym9Ndk12SVlwQjU0cFZDYVNNRm1CdjJpNW1LMnJScnNI?=
 =?utf-8?B?aTJ3eU4vaW1jcDRQVXZJTFhyRERZQjFSam8zWTB2RSt2V1dyQ0FpU005dFM5?=
 =?utf-8?B?bThZNm5tZC9UcmdkaVg3Y3ozOVp6Mk5xaERmYjZieUd4V1pSQ3QzWmkyWXd0?=
 =?utf-8?B?eFRLbndmazM2M1ZoNkx6c1lSemx0ZkxDVjJQZzFkbzhIdWc1RmFVczJ4eVU0?=
 =?utf-8?B?U21icitXTktkRE9BN0RGOFhlQjJGK0haK3psa2paUmp4NUhHaE40NzZTeG5I?=
 =?utf-8?B?dVBqZE5HSURmZTgxUmpnWSt5K284MnR2TkZnVG5WUWg3ek5mdjRhOFQ2cWo2?=
 =?utf-8?B?SGdPcFJWZXQrRTN3eS8xb1RIT0NkczRxSFMybVJuTVBtMmtZS3kwREM5YjdP?=
 =?utf-8?B?dVpFaW9ocG1wRDY0cjFmUHdOMTAxWXV3OTZmZlpOOElNVFdaa0RWUjlhS0tL?=
 =?utf-8?B?N25vQ3hqcEZZbCtLa3dzSEpHTGhIU29mRWJZeklTM3Y1T1NGMkxYaVlLSkdK?=
 =?utf-8?B?SUovZmQ1MHhxM3FaSjlScmI1VEtsb3d1bVlWQWxXZTlHK1Bkd3lkNyt6V1BY?=
 =?utf-8?B?enZLeUhrdnJLaGVlMHVESnNoUjVqQ2VWN3JDaG5DaW9pZ3VKQXdUWlVlZWpq?=
 =?utf-8?Q?GInQYDBWPkA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzZnaUlOV1hLN3JwU0lGNE9mbWcyU2ppUVJ4aHpOVmRrL3haQWtCald2Uisv?=
 =?utf-8?B?dFpqdnNJR1dCcU9nWFFoTG9xckdzeDNIV084djdBQXZrd0ZyOVdobk9veTMv?=
 =?utf-8?B?QmxmckhLL080eFBhUXJvZndqaGxhalE0aVVaWiswL3NOc0ZQOGdDK050aGVD?=
 =?utf-8?B?ekFhQ293UVk5MjFFY1ppblYzV0lxZUh5SzZMMWtiM0hqYUd3eEt3M3EyUDRr?=
 =?utf-8?B?M0Q5RkEvK2VSL1hDK0pML3ZvNVB5TWd5REJxQUwvckp3Wkc0YzU0QTNteDFF?=
 =?utf-8?B?N3VBRm43OU5tbitvSk10SjVoZ0pzTC9nNVVIcXZZNUxtaUtmNUZyS3NscVFN?=
 =?utf-8?B?YlJlOTBVY0NGOUo4bzZoL2h5Q3drczhKdndhTXl3cDZkSlJSRnNuWnVLQnJL?=
 =?utf-8?B?VnVGUFNFYTZ3RDRRUWxjRzZ4N0Q3WGxwTzg4U2k5K05UcEU1UGkxcXB0aFE1?=
 =?utf-8?B?WWEwWHlWU2NjK0tBN2ovZzlMQ0hiYVVVNE82M2FiWDZsM0RLMDBwSi96MlFO?=
 =?utf-8?B?ZDFDdDZ6dlI2VTdmVmFWaHYrR0FSWTVQOTBBSWFNY1BtYkIxN2o2MWwxQ1RT?=
 =?utf-8?B?dlRqZGQwSUVleWtxeFJuOEtYTjRKTkJPK0ZEVlJCV3hWYTRuaG1lS2Iya0t0?=
 =?utf-8?B?Zk5IYjFTU3BNTGYyUndhaEpIWUZRNWk0NFVLdUQwV1ViL3l6QVdxUDZyaTlp?=
 =?utf-8?B?ZjRpTS9OTStxRXV5L1hTNTh5TW5WbFlwNmFGeVI5S1RzT2lCL1NKa3RiSjFm?=
 =?utf-8?B?L0pvTnhCNElybkl4NnBLVGdSYUlkVE9iSUhpTzh3c1RheDR6TUU0dFdTTXUz?=
 =?utf-8?B?NzJnbGJ0SG82ZlRaVExPSytWc09uWHZkek84dEwzdXVHQVc4cEJlam1uSCtT?=
 =?utf-8?B?eDZQdm02OWdjbmowcWR1TE12eGVOSEt2TjFvT01qMXBxOHZEQjJCTnFRSkhi?=
 =?utf-8?B?SS8rSkNNTFJ5YUJsSGkxQ0JtNW1TajNXV3lQOW81ODhESy9URnJuVHZVSG9o?=
 =?utf-8?B?VWIyOFB3QkJUSXRPYldtTjRLRlFjUW4wQXpFWTdmR05SdG5vUDlHR0pJa29X?=
 =?utf-8?B?VUJEbTFiQ1pBQUtFUStsT1hYSGgzL1paTDFtNnhZUXJEKzlGTnFkMXZMdUs2?=
 =?utf-8?B?OVd2bXJHNTNaaFQ1eFVsTjBkVFowVnRicHJobVJxWVc0OU5sQVpEWmFoYmF1?=
 =?utf-8?B?Z0hsTW9aRzZHZm4wYUF5aDdQN1lHajBMLzFTaTE4SytFNXpjd0VDbjBiNS93?=
 =?utf-8?B?TWNmdloxUnpFdmUwdkJNaXRVT1JLbTM5TkR5ZGlHeW5Fd2czd3crNE41MzNX?=
 =?utf-8?B?clZEb29YQnBCMEp1dk9WRHBMSW5CbWdNMllvaEpSNGtHdGxVMFdXVGV1NUZC?=
 =?utf-8?B?aVBxUHJTNlYvYnJWWUtqTWZMZjVsUTRLajRTMTFxRU13eGNNcTdBSWhjSnd2?=
 =?utf-8?B?M2Y1Rk40T3N3Mk4zZEQ2NFJ1bzN4TEdpK2Uzcm9PYkVSck14OTFrbVorMUNt?=
 =?utf-8?B?WVFtaC9RWTNXazVQdVZJL0Q5dE1nV0huMFVLZ24rK0RrVDhWM1JsTUV4Z0lD?=
 =?utf-8?B?REkxU054SjZXcHFOaUFkc3NTU3FqMk1HSmVhb2loSDhsbTU4RnF5RGk1ME1x?=
 =?utf-8?B?a3JpVjhaa3pud2Y4dGYxWnpKNWhIRlVEZUYrN2pkMTJ0Y0ZHRi9pV0E2ZnJU?=
 =?utf-8?B?WEUxdFlqbVZFa2s0aEFhNnBlZGZYOVNndm5zbUkxRlpoMjhac2xSam4xOVZm?=
 =?utf-8?B?OTk5cFJGci9XTk1OeUNoamFTeDVtMHRQZ1VMQjZyaU5HUUhGVE1FTVdramth?=
 =?utf-8?B?UzFYUjJ2cTZTdzMxWjg3Z1h6TXFyMnZZTVJVZUF1YVgxODdnSXFyT1lDV1Fp?=
 =?utf-8?B?c0lBWUJtcVJoenRCd3IxSnZhdmtHbmdnYW1yZVF6WHMyZjY1ZUZBaCtYSE9D?=
 =?utf-8?B?VkZwTHBZeXpwbWh5YkxPMitNWUZLdmRFSzJZT0RESklRbzhxQ2Y4ZTJjcGM3?=
 =?utf-8?B?azVHVWZrdHJOMmhaZ2RhMWcrMC9UR1FSMzZKY1RzNnQ0U0ZRYVJCbmk0RGFa?=
 =?utf-8?B?anFLME4rMzdyK004SE9Yc2VqbHdPNXo3L0lhZ042cFhIcWNsem93UkJSM2Fa?=
 =?utf-8?Q?ltKndS4XwZcP9oZULfSPXlMUV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7025bbc-450a-4ace-9199-08dd793683f2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 20:22:00.7062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I16X+S4JlLKv0Dbj1dluiaqTBMv9XGzt93eDZiND0wDuWS/vL/w0wtihN2cf5V4sPopYPqRnhmJpxaX8ZIH92Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5300
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



On 2025-04-11 10:38 a.m., Michal Wajdeczko wrote:
> 
> 
> On 03.04.2025 17:20, Dong, Zhanjun wrote:
>> Please see my inline comments below.
>>
>> Regards,
>> Zhanjun Dong
>>
>> On 2025-03-27 11:39 p.m., Matthew Brost wrote:
>>> On Thu, Mar 27, 2025 at 04:40:27PM -0700, Zhanjun Dong wrote:
>>>> Add new debugfs entry "guc_log_lfd", which supports output guc log
>>>> in LFD(Log Format Descriptors) format.
>>>>
>>>
>>> Not a full review - but couple of drive by comments.
>>>
> 
> ...
> 
>>>> +
>>>> +/** Log Init Config KLV IDs. */
>>>> +enum guc_log_lic_type_t {
>>>
>>> '_t' suffix isn't used in the Xe style as typically is used for typedefs
>>> which are frowned upon in upstream Linux. I'd drop "_t" suffix
>>> everywhere.
>>
>> I agree _t is not Xe style, while for this case, the ABI header file is
>> follows with GuC spec, which is a cross system/project thing. The name
>> here is the secondary defines.
>> I guess simply follows orginal spec will make things more easy to
>> compare and reduce possible mismatches among systems.
>>
> 
> I was also requesting to drop the _t suffix, so it's not just Matt voice
> 
> also please note that the raw GuC spec is not based on some solid ISO
> standard that we should use as a role model, so blindly following what
> was written there is not exactly the right choice
> 
> and while comparing spec you can easily drop _t suffix (that shouldn't
> be there in first place)
> 
> 
No problem, since both of you request to drop it, I will drop it in next 
post

Regards,
Zhanjun Dong
