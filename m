Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1852A606A324
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 16:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k7LZERmw;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=eGBUeGEE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D9510E7D2;
	Thu, 19 Nov 2026 16:36:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D50910E7D2
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 16:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795106173; x=1826642173;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2pjo9SPx+ADQiLZ1/4LOhfWEPb7oZgFxdNwz6VaTF34=;
 b=k7LZERmwVEDnEuXPtkS7ujeXfoxsFgCkH1yiRM9J2izYUsJFtn6BrC/p
 p/ysBpMpXCV9QXaFcyf4MYBaCA/f36Ibo+0jzkGke30VCxRTiJJJb1xar
 17PKvCVXlF4ThwYrpXfjYjJCkWvkeZ2oU8yKQq6UZ/ZRGQzcI9LA1a5/R
 6FFvRcCQxE3k8PxbLX4p9iUMZ3W2T7ztgmTMOBJdelIy7snZ9dvhxB8Dh
 x37/hhwPem4Ilmj+t3kNZzJAh8aKi/v9XKwuTBusRrfao3g5uFaDgjeUn
 p7qJorm7oavR0Faebw6t3PXSZ6X6AEY9w7UyAgRcTBkFbsikoMHAnjWps w==;
X-CSE-ConnectionGUID: W7MJ2MYMSKm5jpdmUn4b0g==
X-CSE-MsgGUID: hI45cQe2RHCB4WJ8uEqEpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3845118"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3845118"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 08:36:13 -0800
X-CSE-ConnectionGUID: Pwj/06bxQ/mrKzgK3j/bww==
X-CSE-MsgGUID: hzIdIC0eTM+9814tRbsWfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10279724"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 08:36:13 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 08:36:12 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 08:36:12 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 08:36:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UC2gbEwa7PB9knmEmbRvxuPWoauWJHkjnzAi/J6E1Waa06TcmEy1pc659HGxWO0gO4JEPZFVFcPL6B8Bn+TnNDmnoG1WASX/vpYwBdSGVMf/fB4emNBFuR/wSVN6mB848JGO9eSsWKvWsUoibepIvfQK8F+kZ4WVPe10adkGw6Y2jIyJb03Tb8Ybtbioctqcw5Gnpkvz42+WOfKO/GXY8r5VgQxosi44I5GiInKZwtqiooR043DGQt8byorUu9N6RnwBhOmWsTyxwTjmIs6nNhAJJdxPXI9ZkHYDYlcByyaQvu4hM+pm+6V2p8YXlMtqdA2f3xO/6TXIg05h6qU+5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9s4yosRyycWETfpsSUHWzAl8lHcUJrMl+HPLulylCDM=;
 b=poGHczfINT4dS0j7SmKZHCJ0fTYv9TkXQImXbnGN9IkN3tSoh5Dk0U6gYpXuZRqIlU3iRDsjuHG417c1CmnIkEUriv9PpRtAoKI/c5scO15e0oxMHMOUg7jBEKAkiGRHDHg4/HQua7w0K4oS5wnp6I7N4kr7L2KQIBcumLPm3mgtOIKyYpy0691gjb+M2SFHP1t0wj683CcA/69bOCpEJCxx/mY8MkcHwgN3u13OKVYc5dh8t9jqouDZy6yXffU4Y0mOb7nuNgIcYJqMT/wWlE5pkcP52l5ni2QDod4v0lbnkEbFouJ0oxjiNJ+YQgzko6s4kmw7HtR25IF/j623ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9s4yosRyycWETfpsSUHWzAl8lHcUJrMl+HPLulylCDM=;
 b=eGBUeGEE5ak8jcdQ2jhSyqeoAPiMroE4F8G53JRDTa8edV7Tg9lw5OTeSTfKQgUcuZxgdxTu/eSPUZkbB04EUTCpgCw8ncSo78sLBqqVmXJqNwIQ1IAaDY6kaP/ui+faY5OtvAIKh/70Hg87lBtyVp5CJ0WeZhcfUl2/qj6PAdk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by PH0PR11MB5928.namprd11.prod.outlook.com
 (2603:10b6:510:144::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 19 Nov
 2026 16:36:03 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837%3]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 16:36:02 +0000
Message-ID: <04a4d814-13b0-479f-815f-c9537a7b9920@intel.com>
Date: Thu, 19 Nov 2026 22:05:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/xe/vm: restore userptr invalidations on VMA op
 unwind
To: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20261119-userptr-repin-v1-0-af2e327833a9@intel.com>
 <20261119-userptr-repin-v1-1-af2e327833a9@intel.com>
Content-Language: en-US
From: Himal prasad Ghimiray <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20261119-userptr-repin-v1-1-af2e327833a9@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0276.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21d::6) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|PH0PR11MB5928:EE_
X-MS-Office365-Filtering-Correlation-Id: ea4b7651-230d-4ce6-d531-08df465b3314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|261009223027099003|261102123227099003|261021123027099003|56012099006|10067099003|4143699003|261022105027099003|261026140227099003|261026121527099003|261028144727099003|261021121427099003|11063799006;
X-Microsoft-Antispam-Message-Info: G8Xhfwk8Ml1t2FaB0LS82NA5c1dNEN9/MFl+LevwpF6XYJoIQnGnOpgb3vmXvaj01kzZM32TbqMydrjnS+JYF1p9H1aQ/WLKIq9YOYQ1CwI5z43DPbH/lX0ehgS5ZWB/nWDKfuLfa3eB/Sy4sm7Aa7+7Ox13TnyKGUzG2pFCn8ptYcgnpfsTy1LsHvIOHS2/groqxRh5Rkrgdnam/yAXMGcql0HKKK5K5vH8imrtpfk20F5j5qX2uL4GBYlViy8HAPXljVl9/szV3pDR/beQOs4wQ1XsVGu9LVV/KsFrS0nXbFtvbQVyfPGoj0e4DrhuQ5tEJbOQ9KbhvA4Qn1DNNUxQKpOsTOYo5TbVHW/tBvYkJonaqSKD2S39J/Km5SEis28Mp91klIRkrkEj6f4YEkvbOhY17R3PUgoU0bmNmRgCgzwBCeRuoaP6LnV8mdQzIX+II4ubUhZSZAuKH5hayHcpbNFEbc12EP4RB1nIacxlUEdbMhSOtfBytvGaq0bQ7/QVL3a61hx1zcfcjYrEcEBXyiEyEN8vVm7x8JKygO5iF1+ajGfGjj1WMuZEjr8b5KLb0cpY0CSBCCp+bHnIRcjOdxRxRpWJkyR8WmGCMwmxCWahm71eFR7hTucjXq8PHlUZfdvZOI8DFLpJ707y6FjERychXgwcZxiUQCnXz6c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(261009223027099003)(261102123227099003)(261021123027099003)(56012099006)(10067099003)(4143699003)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUlnZnlQZXZCam85OWFPSDB2RGkvajBFcnNzaFpYNURnR2p3ck9lVGZqUFVX?=
 =?utf-8?B?cmJrODlTaFczOW5YTVNSMlZ2RnNRcUQ5RjhCNm1uQk1DeHZDYWNIcVdTNjV4?=
 =?utf-8?B?UmhheFJZZFBnbmE3WFJiRUQ5OTM4dUZ1SDF4M1JzbjVhYXRsVVBNd2c4d1cx?=
 =?utf-8?B?dldYRzBiSHA1b3dkSy9NQ3hnTFVYQ3I5OFpXa2EzODdOS1M0dFlqY3NVWkZD?=
 =?utf-8?B?dXVrRkFHRnJpVWtsQTMxdENVSXJSelJ0YkR6SVM1d0lQNTZja0kvYmE3V0dI?=
 =?utf-8?B?OTZQZE42SkNyOUdoTzFCRHdFbXlMUElTMUpPVlUrTnpuSDMveTVQOWRhemk0?=
 =?utf-8?B?M1hkb1g2WkI5NnBSdmxQYkdzZitGNkFMelo3QzlFcCtNeDFDOG8zZ1B2ajM0?=
 =?utf-8?B?dVpNRFd3OTJaaFlaSTcwMnFxN0Erd016eFc1aUxrZWhyUUFycXdrUnJibTRD?=
 =?utf-8?B?Q1ZsL0NWWmU1S3hQbzBDbWNFYy9OTkNhYW82WUlOdkcra1NPTGdNSm9udEZm?=
 =?utf-8?B?LzFCWjVwY0hnYkFaR2Nab05kWXVOWHdoNEFUcjcwTmp6LzdNOXFiVE90Zzdn?=
 =?utf-8?B?VWtDbTE3RDNybGExSnMvN0FiNzE3NUxGVG04blFKbEE0UTZYMFhLUXQ0NUtS?=
 =?utf-8?B?b3FQT253K3VvWVdnYVlBd0tucCt6bGFpckR5QnJVSklUcGRaLytySXp2YXRN?=
 =?utf-8?B?S1Q4SDRnc25GVHZjY2RCa2FCZnF5eHVGR2VJUnNJRGRNbTRRbVBRM2FXZmIz?=
 =?utf-8?B?YUpVdkFlOTVkMWlKYUg3OUhuOUdZTDlWWjJKR3RTZ2V5MGRxeFJMaURXckRE?=
 =?utf-8?B?UThFUDF3MGJ6UGk0MG16aVNlRmN1YzI0d0hheHRQL0tkYUhkSVJLRW1nbjdB?=
 =?utf-8?B?MzdhRVlFTjM0YlpOajVUdG5YTnRhVnltRDdiSjBJSlRBcm5yTHZsb25EMUNX?=
 =?utf-8?B?ZmQvN2xsdkdWT095cjJOVlh4bml4d29jaHlSclV3TGJZYWhLYnNLSGVvZzlB?=
 =?utf-8?B?NVM0Q2JkQmp5d3NLN1hXeUdUTWRwNXBOcmtydXNtaXpEZHR1cmpkRkdubFVN?=
 =?utf-8?B?cXc1T0pScHF1VllqNjhWazBDa0YwYzVJNkxxYXNmdWhaVnJmQS83YjMwYktM?=
 =?utf-8?B?N29oVmJLSTQwN05YLzlDYUdKWnphL0FSbEkvZnZ0V0RXc1hNT3c4aDJZZEZz?=
 =?utf-8?B?RzNxSDNJYml0UmZrU1U5QjdiZFpIK01QK2dhUjhUSm9WU3RCcEo0WDB4YTlQ?=
 =?utf-8?B?SEVuYUJaRXpDdFVwdHJ3SGh6bzZxZElKRE5XdEgvR2JGNmlTQ2x6WStvT2xQ?=
 =?utf-8?B?djl5MHVrMmFrMXVRT2ZGM0QwT010VjRXb2E1WGY2b0I2dG5KRi85OWZRdXNB?=
 =?utf-8?B?OVozeTg2UmUzUFRvNEp3NDFrandWMm13T1ByMTFLV1doa3laTnRTa3Y4VUFn?=
 =?utf-8?B?SjYyVzJXMnhFWTVCRUhqTTl2bFBxTWRpN0IvSmZObDRibUloUGtwZCtqekZn?=
 =?utf-8?B?NU9CVzNtTFpLZG1wcExlS1BEeDF6WldvQlRCUDJ4OHFmY2t4ZzJHbnFOT1R3?=
 =?utf-8?B?RVpmTWUwYVJibHVheFUyRXgzRE9Fck9TSm5Gb21UcmpsWVFvb0xiRFd5QXpB?=
 =?utf-8?B?N01TcnNBWXJxK1Q4RTFlRXl1TnFPZzhqMmcvYm43Nzd0OWV2QysxRUFKS29h?=
 =?utf-8?B?dVIrVnd6NHdtQ0p1TjdlRmNpTjFxYUxESXJ6NnpiQ0VnQ0ZteUc0ZEJqS3Jl?=
 =?utf-8?B?TnRFSWJEclZzMzBhSUpBbHF4a2NwR0tUMHZNaW4ybU1OSnlDVVZncEx6U3d2?=
 =?utf-8?B?dmFMdWZUMEFvcm1lNHQ1NnJPVHRnUGt5MlQ5NFpvRWkzelRMbUcwVSsveUQz?=
 =?utf-8?B?Kyt6TTdob3Q3OGhERmUrMUdndmRheldwa2ZLNEMyb00rUWhJVVlWR01xSE9Q?=
 =?utf-8?B?MWxpYjdDWGdUNkFZdTgrYmdzT0J4aUN5bmtoMEtZOXBNSWZ0cjdhelN2bTJi?=
 =?utf-8?B?M0hvNk02ZkgyYmY1SWFaYnhESENtelcrVWdkOWZLS1o3cnorODVGZVMzNDBr?=
 =?utf-8?B?aE91c1lqb2FKVDRUd2NieHFTS3FGd1gwYjBiZ0ZJMXRJcUdQbE5KNFhzakNY?=
 =?utf-8?B?NVNNQ2t4cTU1NHNyTWlnZzdNWnN0dHRScmNCQkRsa2Zlb09LSEx2enpyZHNn?=
 =?utf-8?B?YkVzMWxiSE45OWYxVlhtSDdXQ1hudHpxOWhQbk5uckY5cVRKS3RCN2ZGNldp?=
 =?utf-8?B?MFFiVkhRYitFME9aQ3U0V0Nmc1dKdEJ5eTZFNDNzWHRuVDdQaEZHNmJuWEtN?=
 =?utf-8?B?SnRpaTNHY3JNT2hQNHRNdmRCc3lHRHJkVjQ4NkZSWTk2aDhoMDFCcWJBZmJy?=
 =?utf-8?Q?6UuEb2DzK+gsQE5Q=3D?=
X-Exchange-RoutingPolicyChecked: M4COiPH6i3gEh6b8A3bh4efjTXYUW2pkRgkRm+aDwDFHUypREGtkZ4vneRiVF/w4L7e+sPHm+K5HKv0xDnIqcWDVA7Jd+p5DRfHWqWvz6WvLDl+RS7KzJYD5MGhaF2Bwbx0qwZo9QkKuSVcIMYviEirMta/vP5b0GbbQEzHeSvPGKkWp0uJb64efp9BqhmOCjlhPZEv5QEQwinlUYJGuzCMfzyYKdbueR/vRTyxUbM6HbPEJ7vZpHGpiEkBrR9KqVeQNKtW3otSiSMtOa5HZi3CfHsWIND65CcDF1v+qEQGeZBfbz+woOZbmkUIwFRpp/E8mOLY0iXBjYwtqOz+FXQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ea4b7651-230d-4ce6-d531-08df465b3314
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 16:36:02.7576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9gMxikidWt17+foHchXmY8v7wTKbzh5P5zlB4N6jUFnsV/Bb2wluQkkWt4zVCYwng8jNzh+g666GVP5AgMQ4HuFzJ92OPEkJkPS6BSDhYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5928
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


On 19-11-2026 16:44, Matthew Auld wrote:
> When xe_vma_op_commit() commits DRM_GPUVA_OP_UNMAP or
> DRM_GPUVA_OP_REMAP, prep_vma_destroy() sets XE_VMA_DESTROYED while the
> old VMA's GPU page tables remain live. If a subsequent step fails and
> unwinds (for example splitting a userptr VMA where new_vma() fails, or a
> later op in an array of binds failing), a concurrent MMU notifier
> invalidation is lost on non-fault-mode VMs:
>
>    CPU0 (VM_BIND / MADVISE)            CPU1 (MMU notifier)
>    ------------------------            -------------------
>    down_write(&vm->lock)
>    xe_vma_op_commit()
>      prep_vma_destroy(vma)
>        flags |= XE_VMA_DESTROYED
>    ...
>    /* later step fails */
>                                        xe_vma_userptr_invalidate_start()
>                                          down_write(&notifier_lock)
>                                          mmu_interval_set_seq()
>                                          /* XE_VMA_DESTROYED set: skips
>                                           * vm->userptr.invalidated
>                                           */
>                                          drm_gpusvm_unmap_pages()
>                                          up_write(&notifier_lock)
>    xe_vma_op_unwind()
>      flags &= ~XE_VMA_DESTROYED
>      xe_vm_insert_vma(vm, vma)
>    up_write(&vm->lock)
>
> Once vm->lock is dropped, the VMA remains in the VM with live GPU PTEs
> pointing at unmapped pages, while neither exec nor the rebind worker
> knows to repin and rebind it.
>
> Add unprep_vma_destroy() to check xe_vma_userptr_check_repin() while
> clearing XE_VMA_DESTROYED under the notifier lock and queue invalidated
> non-fault-mode userptr VMAs onto vm->userptr.invalidated.
>
> Fixes: b06d47be7c83 ("drm/xe: Port Xe to GPUVA")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org> # v6.12+
> ---
>   drivers/gpu/drm/xe/xe_vm.c | 35 ++++++++++++++++++++++++-----------
>   1 file changed, 24 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index dd855876f571..75be5e5329bd 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -44,6 +44,7 @@
>   #include "xe_tile.h"
>   #include "xe_tlb_inval.h"
>   #include "xe_trace_bo.h"
> +#include "xe_userptr.h"
>   #include "xe_vm_madvise.h"
>   #include "xe_wa.h"
>   
> @@ -2401,6 +2402,26 @@ static void prep_vma_destroy(struct xe_vm *vm, struct xe_vma *vma,
>   		xe_vm_remove_vma(vm, vma);
>   }
>   
> +static void unprep_vma_destroy(struct xe_vm *vm, struct xe_vma *vma,
> +			       bool post_commit)
> +{
> +	xe_svm_notifier_lock(vm);
> +	vma->gpuva.flags &= ~XE_VMA_DESTROYED;
> +	if (IS_ENABLED(CONFIG_DRM_GPUSVM) && !xe_vm_in_fault_mode(vm) &&
> +	    xe_vma_is_userptr(vma) &&
> +	    xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
> +		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
> +
> +		spin_lock(&vm->userptr.invalidated_lock);
> +		list_move_tail(&uvma->userptr.invalidate_link,
> +			       &vm->userptr.invalidated);
> +		spin_unlock(&vm->userptr.invalidated_lock);
> +	}
> +	xe_svm_notifier_unlock(vm);
> +	if (post_commit)
> +		xe_vm_insert_vma(vm, vma);
> +}
> +

LGTM

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   #undef ULL
>   #define ULL	unsigned long long
>   
> @@ -3093,13 +3114,8 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
>   
>   		xe_vm_assert_write_mode_or_garbage_collector(vm);
>   
> -		if (vma) {
> -			xe_svm_notifier_lock(vm);
> -			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
> -			xe_svm_notifier_unlock(vm);
> -			if (post_commit)
> -				xe_vm_insert_vma(vm, vma);
> -		}
> +		if (vma)
> +			unprep_vma_destroy(vm, vma, post_commit);
>   		break;
>   	}
>   	case DRM_GPUVA_OP_REMAP:
> @@ -3117,9 +3133,6 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
>   			xe_vma_destroy_unlocked(op->remap.next);
>   		}
>   		if (vma) {
> -			xe_svm_notifier_lock(vm);
> -			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
> -			xe_svm_notifier_unlock(vm);
>   			if (post_commit) {
>   				/*
>   				 * Restore the old va range, in case of the
> @@ -3131,8 +3144,8 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
>   					op->remap.old_start;
>   				op->base.remap.unmap->va->va.range =
>   					op->remap.old_range;
> -				xe_vm_insert_vma(vm, vma);
>   			}
> +			unprep_vma_destroy(vm, vma, post_commit);
>   		}
>   		break;
>   	}
>
