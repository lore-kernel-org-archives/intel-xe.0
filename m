Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D0E606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 05:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I/YP39lq;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=EZTuIhzy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F1810E0F0;
	Fri, 20 Nov 2026 05:04:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A729810E0F0
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 05:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795151089; x=1826687089;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uvFIxt8pEBzz99vXbVS/Ir1d/pJwO2clydtoYRZE8U8=;
 b=I/YP39lqYvLJcpCuG+bVgGPcf1kVfEZadyrlIQ0pWPGNdLiDLhM9Q0My
 0WyspLPYIocXr6WLCIors/oq1WDba6TjJlbXPwPo1el4jTHqrERsweFP9
 OFr6Xg+J3bl9A1AOeyhCoar7reSQ8LDU8XIRNFZrtVR75w3So6rz1LGkh
 nxDgOMrMMFWIESPazCt61azY8WMmRh4fqGvB9k7nWvaSUaCZWhOMRCLa6
 +BzAkY7HuQgs/56oVAR6hMEZTRn5ejinspOL0MjN/zAOvrrZRP5Ten7Rz
 Ogty2Fv5laQ1UMfi7DShY/TALrR2s3EKFKhBR9fre1NqZhKm3m/TOumFt Q==;
X-CSE-ConnectionGUID: 3vf2U9P/Sjav+NIJq+9nhw==
X-CSE-MsgGUID: MVadfUTkR9eHU4kKB9tDig==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4015884"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4015884"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 21:04:48 -0800
X-CSE-ConnectionGUID: LAY7237cQCyHS8nIroNicw==
X-CSE-MsgGUID: j6IwHc/rR3K7kPn5o3YlnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10693527"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 21:04:48 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 21:04:47 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 21:04:47 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 21:04:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i7o46PichimeKSS+h3GVDDdt2QQK9ej8po4GAoPReIt5N02ydbva9tmZgmKy2S6nbSdUAiP6U2wf+AriMAZpy/8abS4DLeS1zL8ABZaQbUBzU49KN9kfFEH4lZ+75O4nVpzc7on7ywnnzPXisvX/t8pU99PmQT0JHKgY+8gHLdf//e5xapOtzBX/Gx5u7VLHZ2NMxvaHzbOWn+J+7Nlkm6EVm+G/4qkBb2o31t9IgRr4LmFBZ8WyZqCzwB3M6V4+7kFLI1ztCEm9nuNLuBi6ZJnrG/NXg1q0bZPWbcbKkyj5nIlhZCCzlCZ7Pd8pdCB596JftUPRCtOQvlJx3Zlhyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndS7lMWSMnpg1lFnMs71JMddf8di321XBUT4HEdRsxI=;
 b=kXSmIxrrF+QY8mNBZ18999/5IuoQKnQsNGRHealOaSv9WwtXpcV/Gtm6tIXdhUB//bzXAqfbS6T3bycjGZU+ePxFmPH8P4ZG3aqUd7K5/AvJ5O47fFK3lNDIRyhghHEyLKk9fEbOUckWrkwDPrrrRulOjbg4LagoekFov7yijyS01MUa6zaecUunoTQmCU29FV2jAow7s1HJlRsAYlL68ABPHGNu4VXh8xFouTvqgRUQ9prdKdvDuQiUKDq/i8BY07///MbngY0QKHaXbO0//flzZXj6vw2GnjXIKRttXNa12cY0BE8KJAch9YdICAwhZdFF7nluT5jCEbJr87uP5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndS7lMWSMnpg1lFnMs71JMddf8di321XBUT4HEdRsxI=;
 b=EZTuIhzycyjKGlfpNpG9aX1fa/0oSmoKdaceccKFdsTmVIe4pMwG5RGn2tc8Ke1Nrb+bg0QSkSa98hrLHKMmQgDNtC7wV4yPakip6A7d0JNbAyQbRhtoNUfpEIDcJqevMUjHV8xW6EBVy23TI6hTG3EHkknrgbImYxFQ0QJvcLU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6468.namprd11.prod.outlook.com (2603:10b6:208:3a4::18)
 by IA1PR11MB6267.namprd11.prod.outlook.com (2603:10b6:208:3e5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 05:04:44 +0000
Received: from IA1PR11MB6468.namprd11.prod.outlook.com
 ([fe80::c69b:dedf:a089:33e5]) by IA1PR11MB6468.namprd11.prod.outlook.com
 ([fe80::c69b:dedf:a089:33e5%5]) with mapi id 15.21.0615.012; Fri, 20 Nov 2026
 05:04:44 +0000
Message-ID: <737a7bee-1393-4f59-8fd1-625bb99b116b@intel.com>
Date: Fri, 20 Nov 2026 10:34:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] drm/xe/vf: Late fixups of LRCs after VF migration
To: Tomasz Lis <tomasz.lis@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Adam Miszczak <adam.miszczak@linux.intel.com>
References: <20261119171125.1780773-1-tomasz.lis@intel.com>
 <20261119171125.1780773-2-tomasz.lis@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20261119171125.1780773-2-tomasz.lis@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0183.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::13) To IA1PR11MB6468.namprd11.prod.outlook.com
 (2603:10b6:208:3a4::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6468:EE_|IA1PR11MB6267:EE_
X-MS-Office365-Filtering-Correlation-Id: 80217fb7-1882-4dff-7eea-08df46c3ca55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|18002099003|22082099003|261028144727099003|11063799006|4143699003|56012099006|261102123227099003|261022075727099003|261026140227099003|261026121527099003|261021121427099003|261021123027099003|261022105027099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: W5eKNKIML8m8XC6Qfko7Kt4zuzJRxtlXp8GmPRAHX9KRUniJ9DzAdAuv4Xm16RxxGcGoU4zOUvwMjUiOR6EmvD5aHEPzwJtZge/JHkq7nfGdI06vQYmKfb+uCgpIRfvGfUoUlHoUbMQmv8odVMIwXsgEFIp54itxXLU2fdxR6nu5W3jE+q9gZ8C3EdP5Zr7xPK29lwHunmCWcyfFGeJb1ftcLhOccurb9ak1Bo2Wd3f6tG5ixPU/At01Gi/z/UL1vLBIw0KIV7QZXuEh0qu17nBBy+sxl+0RKx5Ib5owEFlETCOh29Wvkh/63UQVwK7JUnVUboAs+03M5CqJP0Il1q6cP+zhUvoxtXuV9BdaMvCEKtRfjQ8/bveKgiqIUyXReHs5ec6rrP5gvE12WNM9GpMi26ZtlVhyGd6RJ+8k9k+ryJqJPvEQkudFxSy7F6kkM+a83uH8QvGlVHcjTj8GPRl4DInFAGYJVdavsH3HhTFQtGMLv4MFZFTCa4OOG10WMUj1t049JYPpaO4gpl96kAfgOCs9Gtxwb43ymhF9jkVi5Nxa1A1KAH29ghOhFwIXM73Ej6/4ngBnA9w15NMDl2BTTWHfqDQE274jO5lviyvaX9ilQH6qXbczHoREt76Ts+XJfhRG7l+hNY4Kbu2yQ5RpsTiEa44+1sf4OJz71Fg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6468.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(261028144727099003)(11063799006)(4143699003)(56012099006)(261102123227099003)(261022075727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0tMdFhsODVlRmQ0UWhrTkhoZ3FKNzRLTGFGanVQZXlIL2Z2aXYxVWMzWWRE?=
 =?utf-8?B?c2c3ZXo0ZE90L3cycUhocGdsR25tQmNSQmpTZ3Nad3A3ZjJqSWRrVDEzcU5t?=
 =?utf-8?B?M0Q2Y0dQcTFFMDZjMTE0UWtJbEpuSHhYbWR3a2h0TjM5akFJRXk1djhvdGxP?=
 =?utf-8?B?aVRWcUxHeDgvRDdrbnRhOW1mRHlWMjNseEFsTnJzVk14QWU2T3V5ZzQ4dGo1?=
 =?utf-8?B?ek1wN25PZThLMjhlUUJ3Qm5xa1pxY3pGUGpRSUYxOGc0cWtnZ3p0TWoybjZy?=
 =?utf-8?B?RitCNGxtYmRoYUNVeEFjNm15L3BEckxKeDJIWHZKbTV5dWhxYlYraWROUGdk?=
 =?utf-8?B?NVNYMnJuV2haOENiTy9jcVUyWVpjVzZjb3c5NlFjZENod3hRR1Q4L0NrVk5B?=
 =?utf-8?B?YmZybUhFekVIN1JoN1FJTEVOQ3l2aHp2OVJ1b0xld3QrMkNvY3lqS21Vb2V3?=
 =?utf-8?B?cUlwdDBKWHlXYWFkOVVVa0FCWDJoS1hRWU5maGNsTmRrTkVMU0tMMnBSMGZW?=
 =?utf-8?B?SWt2VVlLc21Uc0FBYXQ5SUNyaE1od0pKSXllTERVSzZObjJlUmhYU3JYeGo1?=
 =?utf-8?B?ZDA5ZGoxVm12ejRrcC92N1ZUa1E3SzNWYis2WWJIM3VMazVNQWF1SWlNbk8v?=
 =?utf-8?B?ZFMrK1g3cGJJT1pybDFFcm5KYXhMRi95by9yeitXYlJsUXlBY1gyTWF2NVU2?=
 =?utf-8?B?ZUNMVktzdkwxY0pvYmh6Vmt3MkRrTXByN1diVFpCNmgxdlN1MllsZTd0Y3BF?=
 =?utf-8?B?QktuT2R6eDhwbUdHSXBVeThHbTZCRVp2NERHSlZVSy9MR1daQlM5bDI2bXVs?=
 =?utf-8?B?MlVvTS96SVpROVlZc3NTWGhQaXN6SG1Fd2FRMUtUR2l2Z1Vpd3U3YkRSRThV?=
 =?utf-8?B?UndSL3FKU3ZhN3VLQ1I5NTM5ZFQ1N2dWZEFLQmlwWlkvVVV3NW9rMlNZN2cv?=
 =?utf-8?B?a0FNSHZXK28yV2IzdklucWk5Qm45YzRPN3QybFk5MllyNVRhZ1huV3crZXR5?=
 =?utf-8?B?VStjZFFUbWJjdU9tTFZ4cnBKcE9NMktiVzZseUhuTzFsQ3VYZ2t3UHo5Wkc5?=
 =?utf-8?B?cEJLVGtkS00wT1RTcHN0Ykc1WVpNSXBjSCtwUkpsTUZHNVN1WHFLeUFSV2NV?=
 =?utf-8?B?YzRzcDNhRG9ZM0U5THNUOTNvV1NjYjJ6Q3BucEEvT2cxNHJ4RmpFVmJyOVJZ?=
 =?utf-8?B?ZzY2TkdLWUErWXpZTnV2WGhqaUtweHljbFh3U21BcjlSRUpNTzBXTUZvUW12?=
 =?utf-8?B?SkxUQlBYQWUwUHNYbzlLY3RTdmFpU0JEdU1FWHJkaFJOR0djY3JPbFdSQ0p6?=
 =?utf-8?B?dDZpV3gzSElxYlJFenVFcWUvdzJId0RwZ08vZGs5M0hJMjFMMWVadFpob2xo?=
 =?utf-8?B?WlJYV0tZb04zVzR5UHV1R1BkUWpKWmN3UHE2SnVNREQ4ZHNwVi9ZMG9OS1Jz?=
 =?utf-8?B?NzRjR2JFeWJTc0trV20yUHpmQXVUN1k5WGRhVm05aFd5TkVhL01GOWFyU0Iy?=
 =?utf-8?B?Yzd5NXdhWFpKT1hmbUJJMGQ1N2p6Njd5STZoNUZVZW5laUROMXJWMUFvOWNK?=
 =?utf-8?B?d2w3RkxzdXpCOHZIUFVIZk9VRlBmZXUwVVd5OHdvZzhlRkduelNmanNXV1hD?=
 =?utf-8?B?a2VJamxCZ3kydm5UcW1vWVVyZzRadjNBSXorM1RVWlpPc1paVjFESDNNa3Uv?=
 =?utf-8?B?TGtjQVp0ZW5hZlEyRStDYWhkTVAxNFYwR0xOZDR3WHZFSVZnckZKUjFvVjhI?=
 =?utf-8?B?djVLdXBjYlVBU1pmRFpmcTdiclQrczBpVUlpNDFZczAzaXFwNWExQzJIQndV?=
 =?utf-8?B?RXd4Q1pEVzNLTDgzQURWUHROdjFNdU84ekNJK0RqZ3RPUy9TLytOa2h6YWdn?=
 =?utf-8?B?aG5mUDhuYWlDSlc0dWxxVlhqV2pZRnllejFjR3ZqN3l6MGt6aWZtdjlQMHYz?=
 =?utf-8?B?WkNQaEVGNThFbklpSEpPVzNLMSs2WDFIUzhBRGIyVVYvQkFnUjJFQUtRMndR?=
 =?utf-8?B?SUdlSUdTR2ViQjVaU1pGZm94UFRzTkw0V0ZIYXdBMDY5a1dEUGhCSWJQbUJX?=
 =?utf-8?B?eG9LSUM3d0I1aitjdDRrd2swUkVCWGtvWENESFJDZ0lNeGJHczJ2am9uejlj?=
 =?utf-8?B?bENtMXZiUk5oaEREYkVSWE5OWENEY0xVd1Ftb0g1Ny94Mi9Dd2RqQm8xTEFs?=
 =?utf-8?B?RnBaa2hMb0QvWGc2REt4QUp2Y1FKcE1pSkFuMnIweXZmdkUxYlZMeFBVR0NT?=
 =?utf-8?B?Y3lRcFF4ZFd1UUdaamtaZUs5YnhoVFFFQU52SEl0VXZ5TUViOGtXL251Uy9q?=
 =?utf-8?B?bW1WeURRUkVESFFpc3NWdElQUWhuc2FkSVhSSmRiSEJpMExyZkQxWHA2SS9E?=
 =?utf-8?Q?U+9EAlx71vfAWigY=3D?=
X-Exchange-RoutingPolicyChecked: epZWTxnzM+eyXBWkN7vLxgOuxgpIkOKSUTZ4yFLgFWotRMJNoiDE0H/8wjtNh5b6qmuhSHkocZphDMvm4gB3GioR2+1ytBWtlJ3jBifBOaHsgyUOK+ATDlLLCiSzBqHko07Rb2AHjRwlm+2cDl38YXETM3QbddSLtF1jRhIcKWcXK2hw7t4TMRanmDxenMRjBn2nHdIOQcfK0xQ3yFKl7lR1ZQ3NW4cGQCSTmbm3RshK1YKjOskSgBF0EnLRROP3KFlIjKsOGrtBvxHlhM1VgKJYGuwI54+cFyEK/Kn6ErkcAUGGsmcOXYWAfTLMYFKiSjsjcZNJ6sxT6eJqJEL96A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 80217fb7-1882-4dff-7eea-08df46c3ca55
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 05:04:44.2328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8F6z0VgoXvhTFgBOIlR62Tjw8rJy8rp2Erjh/fsyZL8zLwVdtknIVmTYwvBYnhEBwBneqLTd2hJYu/DsvmX0ODHS7LlLadbafJ/3fO4rmgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6267
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 19-Nov-26 10:41 PM, Tomasz Lis wrote:
> For contexts not registered to GuC, do not fix LRCs during VF
> post-migration recovery. Instead, perform fixups before every
> exec queue registration.
>
> This introduces a minor extra work during context registration,
> but also decreases the amount of work required to be finished
> during post-migration recovery.
>
> To mitigate issues with concurrent registrations, the scratch buffer
> required for LRC fixups is now protected by a mutex.
>
> v2: Just a rebase - getting back to the subject after 6 months.
> v3: Use drm-managed mutex lifecycle.
> v4: Protect from mutex creation fail; make more precise description.
>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Tested-by: Adam Miszczak <adam.miszczak@linux.intel.com> (v1)
> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c        | 28 +++++++++++++++---
>   drivers/gpu/drm/xe/xe_exec_queue.h        |  2 +-
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 18 +++++++-----
>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 ++
>   drivers/gpu/drm/xe/xe_guc_submit.c        | 35 ++++-------------------
>   drivers/gpu/drm/xe/xe_guc_submit.h        |  2 --
>   6 files changed, 44 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index ddd9e38aa80b..0f6dfed2756b 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1904,15 +1904,14 @@ void xe_exec_queue_tlb_inval_last_fence_set(struct xe_exec_queue *q,
>   	q->tlb_inval[idx].last_fence = dma_fence_get(fence);
>   }
>   
> -/**
> - * xe_exec_queue_contexts_hwsp_rebase - Re-compute GGTT references
> - * within all LRCs of a queue.
> +/*
> + * Re-compute GGTT references within all LRCs of a queue.
>    * @q: the &xe_exec_queue struct instance containing target LRCs
>    * @scratch: scratch buffer to be used as temporary storage
>    *
>    * Returns: zero on success, negative error code on failure
>    */
> -int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
> +static int xe_exec_queue_lrcs_hwsp_rebase_with_scratch(struct xe_exec_queue *q, void *scratch)
>   {
>   	int i;
>   	int err = 0;
> @@ -1934,3 +1933,24 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
>   
>   	return err;
>   }
> +
> +/**
> + * xe_exec_queue_lrcs_hwsp_rebase - Re-compute GGTT references
> + * within all LRCs of a queue, using migration scratch.
> + * @q: the &xe_exec_queue struct instance containing target LRCs
> + *
> + * Returns: zero on success, negative error code on failure
> + */
> +int xe_exec_queue_lrcs_hwsp_rebase(struct xe_exec_queue *q)
> +{
> +	struct xe_gt *gt = q->gt;
> +	int err;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
Use xe_assert() as it is not GT specific file.
> +
> +	mutex_lock(&gt->sriov.vf.migration.scratch_lock);
> +	err = xe_exec_queue_lrcs_hwsp_rebase_with_scratch(q, gt->sriov.vf.migration.scratch);
> +	mutex_unlock(&gt->sriov.vf.migration.scratch_lock);

We can simple use guard(mutex)/scoped_guard(mutex) instead of 
mutex_lock() and unlock()

-Satya.

> +
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index d48775ef6baf..ccdc57386b82 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -158,7 +158,7 @@ void xe_exec_queue_tlb_inval_last_fence_set(struct xe_exec_queue *q,
>   
>   void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
>   
> -int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
> +int xe_exec_queue_lrcs_hwsp_rebase(struct xe_exec_queue *q);
>   
>   struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q);
>   struct xe_lrc *xe_exec_queue_get_lrc(struct xe_exec_queue *q, u16 idx);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 2a5f2064ad3e..b71ebe4df74c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1319,7 +1319,6 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
>   
>   static int vf_post_migration_fixups(struct xe_gt *gt)
>   {
> -	void *buf = gt->sriov.vf.migration.scratch;
>   	int err;
>   
>   	VF_MIGRATION_INJECT_WAIT(gt, FIXUPS);
> @@ -1333,9 +1332,6 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
>   		xe_sriov_vf_ccs_rebase(gt_to_xe(gt));
>   
>   	xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> -	err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> -	if (err)
> -		return err;
>   
>   	atomic_inc(&gt->sriov.vf.migration.fixups_complete_count);
>   
> @@ -1498,17 +1494,25 @@ static void vf_migration_fini(void *arg)
>    */
>   int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
>   {
> +	struct xe_device *xe = gt_to_xe(gt);
>   	void *buf;
> +	int err;
>   
> -	if (!xe_sriov_vf_migration_supported(gt_to_xe(gt)))
> +	if (!xe_sriov_vf_migration_supported(xe))
>   		return 0;
>   
> -	buf = drmm_kmalloc(&gt_to_xe(gt)->drm,
> -			   post_migration_scratch_size(gt_to_xe(gt)),
> +	buf = drmm_kmalloc(&xe->drm,
> +			   post_migration_scratch_size(xe),
>   			   GFP_KERNEL);
>   	if (!buf)
>   		return -ENOMEM;
>   
> +	err = drmm_mutex_init(&xe->drm, &gt->sriov.vf.migration.scratch_lock);
> +	if (err) {
> +		drmm_kfree(&xe->drm, buf);
> +		return err;
> +	}
> +
>   	gt->sriov.vf.migration.scratch = buf;
>   	spin_lock_init(&gt->sriov.vf.migration.lock);
>   	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 466f0abd9c28..443377b40a94 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -56,6 +56,8 @@ struct xe_gt_sriov_vf_migration {
>   	spinlock_t lock;
>   	/** @wq: wait queue for migration fixes */
>   	wait_queue_head_t wq;
> +	/** @scratch_lock: Mutex lock to serilize scratch buffer use */
> +	struct mutex scratch_lock;
>   	/** @scratch: Scratch memory for VF recovery */
>   	void *scratch;
>   	/** @fixups_complete_count: Counts completed fixups stages */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index b5c916a764db..911feed9496e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -47,6 +47,7 @@
>   #include "xe_ring_ops_types.h"
>   #include "xe_sched_job.h"
>   #include "xe_sleep.h"
> +#include "xe_sriov_vf.h"
>   #include "xe_tlb_inval.h"
>   #include "xe_trace.h"
>   #include "xe_uc_fw.h"
> @@ -1035,6 +1036,9 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>   	xe_gt_assert(guc_to_gt(guc), !exec_queue_registered(q));
>   	xe_gt_assert(guc_to_gt(guc), ctx_type < GUC_CONTEXT_COUNT);
>   
> +	if (IS_SRIOV_VF(xe) && xe_sriov_vf_migration_supported(xe))
> +		xe_exec_queue_lrcs_hwsp_rebase(q);
> +
>   	memset(&info, 0, sizeof(info));
>   	info.context_idx = q->guc->id;
>   	info.engine_class = xe_hwe_to_guc_class(q->hwe);
> @@ -3152,6 +3156,8 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
>   	struct drm_sched_job *s_job;
>   	bool restore_replay = false;
>   
> +	if (exec_queue_registered(q))
> +		xe_exec_queue_lrcs_hwsp_rebase(q);
>   	drm_sched_for_each_pending_job(s_job, &sched->base, NULL) {
>   		job = to_xe_sched_job(s_job);
>   		restore_replay |= job->restore_replay;
> @@ -4099,32 +4105,3 @@ u32 xe_guc_submit_active_multi_queue_lrca(struct xe_guc *guc,
>   
>   	return lrca;
>   }
> -
> -/**
> - * xe_guc_contexts_hwsp_rebase - Re-compute GGTT references within all
> - * exec queues registered to given GuC.
> - * @guc: the &xe_guc struct instance
> - * @scratch: scratch buffer to be used as temporary storage
> - *
> - * Returns: zero on success, negative error code on failure.
> - */
> -int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch)
> -{
> -	struct xe_exec_queue *q;
> -	unsigned long index;
> -	int err = 0;
> -
> -	mutex_lock(&guc->submission_state.lock);
> -	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> -		/* Prevent redundant attempts to stop parallel queues */
> -		if (q->guc->id != index)
> -			continue;
> -
> -		err = xe_exec_queue_contexts_hwsp_rebase(q, scratch);
> -		if (err)
> -			break;
> -	}
> -	mutex_unlock(&guc->submission_state.lock);
> -
> -	return err;
> -}
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 7a81d0aa19bb..9c72ff5fa62e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -60,6 +60,4 @@ u32 xe_guc_submit_active_multi_queue_lrca(struct xe_guc *guc,
>   					  struct xe_hw_engine *hwe,
>   					  u32 cur_lrca, u32 active_id);
>   
> -int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch);
> -
>   #endif
