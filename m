Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D245EEA7943
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 19:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8779710E14A;
	Wed,  4 Feb 2026 19:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l1H4yzaQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0855B10E14A
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 19:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770234364; x=1801770364;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dZsj2gkGB9FSM5IZGv0ylSdxssSZYZCGjrKbSj3RCX8=;
 b=l1H4yzaQKE2/zoPST/xx/nhqyJn0kHSJ8U5U8M24CP5TYFhIvlLWz8/C
 /uQHNqFQLnfduhGVjHycSE7/LnPBEgGmlU5NXoPqOUcNUTmOfWSjsnYQ/
 H0wqbqf2agzm1wBfC8pUSPwDUDaQ3KCTwUzVllaTXRIlPuq9PR8DN+wdf
 nvZ/1yrRLgCbTkXmeaZUgZWRFuuYV+xb11c0rJrK7HmGxXeFhBkc/x3zc
 Rkd1aZ1oGSNacHYfNrXA8OVYt5+1DwTL0Vq8iKGIscVsO5gOHDorfjWki
 691+PkSy/YJcoh3fMUq5EjRI2HjnKoFLO+SY7qbD+izrTtMNKhOcEHs0p Q==;
X-CSE-ConnectionGUID: qxh8YTHZSdecUNlysR9Rnw==
X-CSE-MsgGUID: jTsjziy+T4m6dqsnAZFU9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="94079555"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="94079555"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 11:46:03 -0800
X-CSE-ConnectionGUID: tdKFMOcqQd2UmmSQmn/AnA==
X-CSE-MsgGUID: X4Zoy1O4SBOXzsF1s/x/Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="209555670"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 11:46:03 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 11:46:03 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 11:46:03 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.1) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 11:46:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wP2UaMATWG+3S5mlNSLYWorMZHWbhvGGbA8dae89fRf7rMgNp8fLNWqLkyEMi9Ik0k1Gwb2FgrFtE4XfgwmwS6MGdlSH6AGJeN3qtJ2JVbqrmC8BUfHRs5pj1co/AM5u+qwoJx1bv9f/tOX2jyuE2kc6ZdEBs51VGhRilk2n03aV4a/GKcT/ak5McV9WTHC1Gya4JGbsK/nP67wLn3tT8lrfZWQ62R2vA5ccvrl93hVvU/8bj0WhkaPMM7rmwfKHYbYi4EtNgfjgW4DOOax0UPWGnnbdBMiHiPrnpX/H/guOMQS3KHdhhUCsOJ6gnbzMUBNrktrTYlNyfY7BUuLA6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14FyRP2VuBJMektSKf73JMLU9ii8VRjT46/7CPLAaoM=;
 b=ROt8We9uZUQIOoRf5S6q/QLlY511a5wBoD+MNwQY8M7E44aijDLZCP/ZdYzg6rQI8JLqduKlPgAcwqyjGielCCQVj/L+6501UIO6AKLstUNbgG+v7QW5eP8TFft/rHP+gZME5RGl3pcE7eZ5haj1hzbi4454kEW3t4zepUhoehOcyHGy4JQsLjx9E+T7/p8vnCUR8glCwk+NNqepz1F3HDwIgYPTUH375PO+aHRKlix8+Pc3kiKXfTLRUZaLvzFvutmogjVvlLWeWcKjR8XV28gX8b7p2BYnI19fRkz0ks2RB5XSGb+++aSvvbZ1txvnsfsZdjCIJxGyJNwwT/EepA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 19:45:59 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%3]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 19:45:59 +0000
Date: Wed, 4 Feb 2026 11:45:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2 1/3] drm/sa: Split drm_suballoc_new() into SA alloc
 and init helpers
Message-ID: <aYOh9AfqhMntB5MD@lstrano-desk.jf.intel.com>
References: <20260204164642.3509298-5-satyanarayana.k.v.p@intel.com>
 <20260204164642.3509298-6-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260204164642.3509298-6-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: SJ0PR13CA0039.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::14) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH3PR11MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: dd75c050-73ca-4c00-20fa-08de6426052c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?3qceJr8lpRNu849OcyHWJ0++ul9gyRROidSj5BjunmA3YGOgMni2ynQMPv?=
 =?iso-8859-1?Q?MXoKzVINGfdh0i4uJxnSFInzwrpYsTOm6TAbLjyVI2zHO/f2kevO+1urJL?=
 =?iso-8859-1?Q?xK6k/EpAcCTca3H0w2gjmWbw0bgPSU+A6zWAiyRInBZlSx5Ujt8ZDO5IVA?=
 =?iso-8859-1?Q?WUZFM1dQ52rGesZOmLhQEr29vcaqywJlUgQWa7CCUK+4ep1jdwNmbaQAi7?=
 =?iso-8859-1?Q?EXRXMRwn3x0f8YhiCfkhQCUFVKYcPwNxsFU9pcQLqV9/aHjiOg4b+sFS+y?=
 =?iso-8859-1?Q?5bf+s4SYyrMUXvZq4u34FxbTN4XtE5Jm5D49Y6y/HwD+WehUrJ4jsWF1Fk?=
 =?iso-8859-1?Q?7UlL32kNvetEt9mT/75+On1Fwcc9t6cdBrOLeEaec3zb111HLtL3lPDChC?=
 =?iso-8859-1?Q?sOHqhINd0ma+hLoskXh5AFO7y5EGUZbC4HKkLXO7cZ1OxChdPaHJuvxr3k?=
 =?iso-8859-1?Q?Esa/a1wAjcEvC4Gb6hu2GbqzOhrrCmwKueo9WefZA+nEgbn6+qJ1bLzkv0?=
 =?iso-8859-1?Q?zgft9HGOmcBD92HRtYVDceErjSVL2aip+59Hvg/GyNrWuAKQJMVdkqwl8x?=
 =?iso-8859-1?Q?vBZhRYsAPzEs9wyMvi2WSwSYgGM1sRUHBIBnrsDD3LQNb6H6P1yRDErxUs?=
 =?iso-8859-1?Q?QjTw03Dals+sitZwm4dnDuadRralLvmpJx/3y9mm+oLaC8dK9yscM1bms/?=
 =?iso-8859-1?Q?XiXiLJM7MP6a6AlLIIiqM1Jhg0YF2xJusVEFXzxjWD3EduOPzVGVH+2lcu?=
 =?iso-8859-1?Q?SUaDVNsRK8xncRy4iGNyPuSSNUMHfJQ4kJWgx4iT4FPFydx/oro/EkaXeM?=
 =?iso-8859-1?Q?X2laA8F/MDXm8bhxzngfTfcltNIbVNxjxQtHtrlGXrDu3xbzH7/YXUy/3A?=
 =?iso-8859-1?Q?ToqezSM91SnDo/ASdX66AwoEbCLF7kZ77dRra+0wf/XBo/dQzsRhjV85l3?=
 =?iso-8859-1?Q?8x0qmj0ILvSsKqkAO2PfahUOC77i9FCwpWFDLYzyDfowNJgXOwvrAuTg1J?=
 =?iso-8859-1?Q?+TDriYF6z4JALSFAeO+FAYZ0pTHQYGjKyJ2z6DXh/s1cz5jF1Jwuw02eky?=
 =?iso-8859-1?Q?DB2wzfTE03VhwRP7bDRM4nduLBTSCSVyWiPubggz5ypmF8ZZeUhfn5//6m?=
 =?iso-8859-1?Q?CbPZKm+/9OrUM0zqN/NFfPUkCBG88e7XzMUZpyzeT59hlz6H96MZbEhUw6?=
 =?iso-8859-1?Q?Dwt3FMeaD5DHP8gvhUUG8BhXV+VAvOYhX4/LJtBP84AkfnsZG+I34K0PSj?=
 =?iso-8859-1?Q?BWUnnka5zZUsOgsK/YSS6aXHPHj1M2yaaZfwQZe0SC3fITZzbt3FUHJDWm?=
 =?iso-8859-1?Q?ipxuBHwPqnyI6syeRDqi8+lh/ZftLsVFlf5Ous5pmLZFniuwMzl2B85X3t?=
 =?iso-8859-1?Q?lmt7Egq5geM+/s9mEMSdTtBk7abLn6s6UTEF5DAueBW+GfVnNATg4hJXIN?=
 =?iso-8859-1?Q?ytEY08CYa9Ogrl5qbI7GR9FlNAUSrTTJzQBSznhSewLXYScOcNhokdTjaN?=
 =?iso-8859-1?Q?h94oY4FXn14c+dfA/5DQqSfySDGBAtqJDQ+Bvl6bHaq+DPOtQ0Cv7wIZxc?=
 =?iso-8859-1?Q?9vEllXwhNNrzzIv3nIuXIj2EEZBRAFm1lknBsLjYmtGBgd/CVoctpp4j7y?=
 =?iso-8859-1?Q?Qa6T5NiolD54Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SopJ0I9EJTqErgA9fNhjqVg03FZTM8y+nsTFxHk6PMtH+ACJ6O0evmmhiT?=
 =?iso-8859-1?Q?xU9MsdbfzOakkVkJLcXAQyMXd6dxsL6mIeGn12Wrar3Ry+EVBT1Gsjxbn6?=
 =?iso-8859-1?Q?E6PZzCE01Q/jAVwEHuSdGEMSEM2i3cJx611OJmwvudL6PVe+M9eKPMX21w?=
 =?iso-8859-1?Q?uRkGf6hzJOflfX4o48Bx0A2Emu0r9Oqm6SUUfOQ+0qjapzfq5fNSt9Et3o?=
 =?iso-8859-1?Q?pV7RL61J+PnCQXUIWUupiCkkFDGHIisI0rs1qw26BOVkqxxGvcQQEXUPuU?=
 =?iso-8859-1?Q?OaS2QUS/GWq/G2eFWdGfCGimUm+f5K2Swv/bV6vhJ4ncmyBbFYXSsibWUJ?=
 =?iso-8859-1?Q?KAQHSM8EsnqClusvgm9RpCSw2OuPdUzI4pfnfZT+J7TVt59pDEdOUht+Te?=
 =?iso-8859-1?Q?jOF3YPTl2vBv9ZNpmS/7fhpv1fZJp6/jl4Zwwb3qkFYTslbVgHZv1Qxmhb?=
 =?iso-8859-1?Q?KvSdNHPVV5W5EFR4U43LlDUWNYCeOfAmazkKYXGBu2eEe7HeiS0ZT0K7GZ?=
 =?iso-8859-1?Q?Ue27SN7Hyz3brFNFGgYBTdSAZA7GV4PlxKDxf2lJqtAqW5KYIsQuqRwV2r?=
 =?iso-8859-1?Q?7mJiRSwsxAgpdzkV4YZX9qpzUeTInc0965AR2zj8fhVJz566JNx2EUhRob?=
 =?iso-8859-1?Q?/ygWwFMUxcbkHywsUVkH1UQWJo2Zw4/AyD9NIKFcvToS5k9YK+vDIJYARa?=
 =?iso-8859-1?Q?ww77eF6YydikntLjtznRHRAcpGD6owsyhyvTDdSw1Ggn/97QpnRWkX/us9?=
 =?iso-8859-1?Q?0wuZN3NZ1w1FXOUcyNFCREyiPJ0qzJ6nwaJsvjmk3tGZC+9VwMjyhogYjS?=
 =?iso-8859-1?Q?1aBz4QbBtset38Lo3GdR4VPv621c0SKSOV+kIO0kBl5RMbmW519FzOP3j2?=
 =?iso-8859-1?Q?bAs7o46tcX/V5i81IMH2ZioBQv5xDDPQTTIkwLaKnAYlSPp/P0NJqaGf95?=
 =?iso-8859-1?Q?szwRHtoLGQe7ty5OXwnkOmcS6aT9O5mNa8Q7RlhyTIvpOHt/dfHoQbxJa5?=
 =?iso-8859-1?Q?8kftTYqesICQKeKdeGckSstvFxMGcN0UUEExJ5xCORb+V0YxHWV2oEeumH?=
 =?iso-8859-1?Q?LDuoXvrJNKpmdTSq4rgkRdxRIjJqbFxrc/r70nCXnzo3mKyz+CGZgne0th?=
 =?iso-8859-1?Q?AbzLtP84Anij7EiYUe3mX9FKCaHCsNthsdaa8dgnSYDRxdVTVZ6kuG1APi?=
 =?iso-8859-1?Q?Rh8C932JsOb/5QXUXFl0xMicCUAulj5sM3rEMifrYY9gCpsC0vCG04O58n?=
 =?iso-8859-1?Q?7oWDEc/13stizel/ZpSWSIy9R65OpYMk7KihA3tvRXxfQ1CHn3VH0hkdhX?=
 =?iso-8859-1?Q?6w0VLRqWlBDx5cfN8LyAd6Oed7evkZpc9cpoiRmyX3VJsjw5BEbuCAZSLo?=
 =?iso-8859-1?Q?iJDEM/C5qP+KeIjw9CotL0/f7N2yiVsmeEeIHgYeMYspPvIeyHZsQjqURy?=
 =?iso-8859-1?Q?fDJ509M8r4CJrJwYnfqNIEE4i4OAxRlAo0SeM8YSt1sLfrw6sMxg41H6T1?=
 =?iso-8859-1?Q?hParTaAwEK/d5W1Tx+J7YHfbu6gFMYstIdJ41T4Qys5A2b9e80lPsfv7Y8?=
 =?iso-8859-1?Q?iesZ4UadeLunMPISZBsmi7iZsCiA0/oKr8rRqPQeEzzuXvBOFIU/8tiL+g?=
 =?iso-8859-1?Q?7+MWVMYajEwNbqKC+/5RGaONIlyhQo4UdMq4Dv2889+s/y92BNV4tQOCcD?=
 =?iso-8859-1?Q?Yiyk2anTp6oPJIFXjgsYo/HUdVbo5ewHWnb5E+EkTQk7dMexlk9mPWMj/h?=
 =?iso-8859-1?Q?l4BCFkAF5cclNQIG3chMK0EiTXEaee7D2QlYUiBQ0R6oCaNdBDJYo5++mA?=
 =?iso-8859-1?Q?KA590lajzQDbtrA8EeWMQGeTj7xr2xQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd75c050-73ca-4c00-20fa-08de6426052c
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 19:45:59.5403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ci9HdFOZrBhcEEny2XNa2pYBiEYgKzg7wWsI6FZnq8r2FZhj86S0BxIDsxOJdatIWTGkev2V3LeuVJPVEOwkMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8414
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

On Wed, Feb 04, 2026 at 04:46:44PM +0000, Satyanarayana K V P wrote:
> drm_suballoc_new() currently both allocates the SA object using kmalloc()
> and searches for a suitable hole in the sub-allocator for the requested
> size. Since kmalloc() may take internal locks, performing memory
> allocation while holding the sub-allocator mutex can trigger lockdep
> deadlock warnings.

The above isn't quite right. By spliting the kmalloc step outside of the
init step, this allows kmalloc to be reclaim unsafe (GFP_KERNEL) and the
enter a reclaim unsafe section (e.g., take a reclaim tainted lock)
during init.

> 
> Fix this by splitting SA allocation from drm_suballoc_new(), separating
> object allocation from sub-allocator initialization and hole selection.
> 

I'd also mention that a timeout argument is provided in init too,
with use cases in mind where the suballocator is sized to never fail
finding a hole or if does, it won't hang forever.

Matt

> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> ---
> V1 -> V2:
> - Splitted drm_suballoc_new() into drm_suballoc_alloc() and
> drm_suballoc_init() (Thomas).
> ---
>  drivers/gpu/drm/drm_suballoc.c | 135 +++++++++++++++++++++++++--------
>  include/drm/drm_suballoc.h     |   8 ++
>  2 files changed, 112 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_suballoc.c b/drivers/gpu/drm/drm_suballoc.c
> index 879ea33dbbc4..6f21f9e048d6 100644
> --- a/drivers/gpu/drm/drm_suballoc.c
> +++ b/drivers/gpu/drm/drm_suballoc.c
> @@ -123,7 +123,7 @@ static void drm_suballoc_remove_locked(struct drm_suballoc *sa)
>  	list_del_init(&sa->olist);
>  	list_del_init(&sa->flist);
>  	dma_fence_put(sa->fence);
> -	kfree(sa);
> +	drm_suballoc_release(sa);
>  }
>  
>  static void drm_suballoc_try_free(struct drm_suballoc_manager *sa_manager)
> @@ -293,45 +293,75 @@ static bool drm_suballoc_next_hole(struct drm_suballoc_manager *sa_manager,
>  }
>  
>  /**
> - * drm_suballoc_new() - Make a suballocation.
> + * drm_suballoc_alloc() - Allocate uninitialized suballoc object.
> + * @gfp: gfp flags used for memory allocation.
> + *
> + * Allocate memory for an uninitialized suballoc object. Intended usage is
> + * allocate memory for suballoc object outside of a reclaim tainted context
> + * and then be initialized at a later time in a reclaim tainted context.
> + *
> + * @drm_suballoc_release should be used to release the memory if returned
> + * suballoc object is in uninitialized state.
> + *
> + * Return: a new uninitialized suballoc object, or an ERR_PTR(-ENOMEM).
> + */
> +struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp)
> +{
> +	struct drm_suballoc *sa;
> +
> +	sa = kmalloc(sizeof(*sa), gfp);
> +	if (!sa)
> +		return ERR_PTR(-ENOMEM);
> +
> +	return sa;
> +}
> +EXPORT_SYMBOL(drm_suballoc_alloc);
> +
> +/**
> + * drm_suballoc_release() - Release memory for suballocation.
> + * @sa: The struct drm_suballoc.
> + */
> +void drm_suballoc_release(struct drm_suballoc *sa)
> +{
> +	kfree(sa);
> +}
> +EXPORT_SYMBOL(drm_suballoc_release);
> +
> +/**
> + * drm_suballoc_init() - Initialize a suballocation.
>   * @sa_manager: pointer to the sa_manager
> + * @sa: The struct drm_suballoc.
>   * @size: number of bytes we want to suballocate.
> - * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL but
> - *       the argument is provided for suballocations from reclaim context or
> - *       where the caller wants to avoid pipelining rather than wait for
> - *       reclaim.
>   * @intr: Whether to perform waits interruptible. This should typically
>   *        always be true, unless the caller needs to propagate a
>   *        non-interruptible context from above layers.
>   * @align: Alignment. Must not exceed the default manager alignment.
>   *         If @align is zero, then the manager alignment is used.
> + * @timeout: Time to a wait suballocation to become available.
>   *
> - * Try to make a suballocation of size @size, which will be rounded
> - * up to the alignment specified in specified in drm_suballoc_manager_init().
> + * Try to make a suballocation on a pre-allocated suballoc object of size @size,
> + * which will be rounded up to the alignment specified in specified in
> + * drm_suballoc_manager_init().
>   *
> - * Return: a new suballocated bo, or an ERR_PTR.
> + * Return: zero on success, errno on failure.
>   */
> -struct drm_suballoc *
> -drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
> -		 gfp_t gfp, bool intr, size_t align)
> +int drm_suballoc_init(struct drm_suballoc_manager *sa_manager,
> +		      struct drm_suballoc *sa, size_t size,
> +		      bool intr, size_t align, signed long timeout)
>  {
>  	struct dma_fence *fences[DRM_SUBALLOC_MAX_QUEUES];
>  	unsigned int tries[DRM_SUBALLOC_MAX_QUEUES];
>  	unsigned int count;
>  	int i, r;
> -	struct drm_suballoc *sa;
>  
>  	if (WARN_ON_ONCE(align > sa_manager->align))
> -		return ERR_PTR(-EINVAL);
> +		return -EINVAL;
>  	if (WARN_ON_ONCE(size > sa_manager->size || !size))
> -		return ERR_PTR(-EINVAL);
> +		return -EINVAL;
>  
>  	if (!align)
>  		align = sa_manager->align;
>  
> -	sa = kmalloc(sizeof(*sa), gfp);
> -	if (!sa)
> -		return ERR_PTR(-ENOMEM);
>  	sa->manager = sa_manager;
>  	sa->fence = NULL;
>  	INIT_LIST_HEAD(&sa->olist);
> @@ -339,6 +369,8 @@ drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
>  
>  	spin_lock(&sa_manager->wq.lock);
>  	do {
> +		long t;
> +
>  		for (i = 0; i < DRM_SUBALLOC_MAX_QUEUES; ++i)
>  			tries[i] = 0;
>  
> @@ -348,7 +380,7 @@ drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
>  			if (drm_suballoc_try_alloc(sa_manager, sa,
>  						   size, align)) {
>  				spin_unlock(&sa_manager->wq.lock);
> -				return sa;
> +				return 0;
>  			}
>  
>  			/* see if we can skip over some allocations */
> @@ -359,34 +391,75 @@ drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
>  				fences[count++] = dma_fence_get(fences[i]);
>  
>  		if (count) {
> -			long t;
> -
>  			spin_unlock(&sa_manager->wq.lock);
>  			t = dma_fence_wait_any_timeout(fences, count, intr,
> -						       MAX_SCHEDULE_TIMEOUT,
> -						       NULL);
> +						       timeout, NULL);
>  			for (i = 0; i < count; ++i)
>  				dma_fence_put(fences[i]);
>  
> -			r = (t > 0) ? 0 : t;
>  			spin_lock(&sa_manager->wq.lock);
>  		} else if (intr) {
> +			spin_unlock(&sa_manager->wq.lock);
>  			/* if we have nothing to wait for block */
> -			r = wait_event_interruptible_locked
> +			r = wait_event_interruptible_timeout
>  				(sa_manager->wq,
> -				 __drm_suballoc_event(sa_manager, size, align));
> +				 __drm_suballoc_event(sa_manager, size, align),
> +				 timeout);
> +			spin_lock(&sa_manager->wq.lock);
>  		} else {
>  			spin_unlock(&sa_manager->wq.lock);
> -			wait_event(sa_manager->wq,
> -				   drm_suballoc_event(sa_manager, size, align));
> -			r = 0;
> +			t = wait_event_timeout
> +				(sa_manager->wq,
> +				 drm_suballoc_event(sa_manager, size, align),
> +				 timeout);
>  			spin_lock(&sa_manager->wq.lock);
>  		}
> +		r = (t > 0) ? 0 : !r ? -ETIME : t;
>  	} while (!r);
>  
>  	spin_unlock(&sa_manager->wq.lock);
> -	kfree(sa);
> -	return ERR_PTR(r);
> +	return r;
> +}
> +EXPORT_SYMBOL(drm_suballoc_init);
> +
> +/**
> + * drm_suballoc_new() - Make a suballocation.
> + * @sa_manager: pointer to the sa_manager
> + * @size: number of bytes we want to suballocate.
> + * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL but
> + *       the argument is provided for suballocations from reclaim context or
> + *       where the caller wants to avoid pipelining rather than wait for
> + *       reclaim.
> + * @intr: Whether to perform waits interruptible. This should typically
> + *        always be true, unless the caller needs to propagate a
> + *        non-interruptible context from above layers.
> + * @align: Alignment. Must not exceed the default manager alignment.
> + *         If @align is zero, then the manager alignment is used.
> + *
> + * Try to make a suballocation of size @size, which will be rounded
> + * up to the alignment specified in specified in drm_suballoc_manager_init().
> + *
> + * Return: a new suballocated bo, or an ERR_PTR.
> + */
> +struct drm_suballoc *
> +drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
> +		 gfp_t gfp, bool intr, size_t align)
> +{
> +	struct drm_suballoc *sa;
> +	int err;
> +
> +	sa = drm_suballoc_alloc(gfp);
> +	if (IS_ERR(sa))
> +		return sa;
> +
> +	err = drm_suballoc_init(sa_manager, sa, size, intr, align,
> +				MAX_SCHEDULE_TIMEOUT);
> +	if (err) {
> +		drm_suballoc_release(sa);
> +		return ERR_PTR(err);
> +	}
> +
> +	return sa;
>  }
>  EXPORT_SYMBOL(drm_suballoc_new);
>  
> diff --git a/include/drm/drm_suballoc.h b/include/drm/drm_suballoc.h
> index 7ba72a81a808..cff0e14556d1 100644
> --- a/include/drm/drm_suballoc.h
> +++ b/include/drm/drm_suballoc.h
> @@ -53,6 +53,14 @@ void drm_suballoc_manager_init(struct drm_suballoc_manager *sa_manager,
>  
>  void drm_suballoc_manager_fini(struct drm_suballoc_manager *sa_manager);
>  
> +struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp);
> +
> +void drm_suballoc_release(struct drm_suballoc *sa);
> +
> +int drm_suballoc_init(struct drm_suballoc_manager *sa_manager,
> +		      struct drm_suballoc *sa, size_t size, bool intr,
> +		      size_t align, signed long timeout);
> +
>  struct drm_suballoc *
>  drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
>  		 gfp_t gfp, bool intr, size_t align);
> -- 
> 2.43.0
> 
