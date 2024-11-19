Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B2FD6C2B8
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 23:59:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125C910E0D9;
	Tue, 19 Nov 2024 23:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XOoGbOWK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3105210E0D9
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 23:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732060768; x=1763596768;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0WJQPgLpVYYDKDrumB1g5oGp6RrZObQdsFuABHycVYw=;
 b=XOoGbOWKjk6IyFXTLMvHemNhr8khbd49bBL/1kysYYtDDgv8Ui7mogAS
 T1E+ABxxHDE0Ki3/JV3xfXWb8eLI5Mr8aYiBv6vNMVKPybaK2punpXzom
 vSQRXTQy4W3k8g7CnMuZHaWmVsLbsUmMJ4h5xwwQOf7TCdInZED0iFo89
 zyXyZp/zohYBl2INq2MDruwd6sHDaGI3jG5j1lVVvX0pDxexUgKWxLGCJ
 /uIWVWJLBqugjO3EP2jyFTi4OtDcV6y0bB8E+wt7Dv5EnsPnqfZNXSjbT
 F3dUhSGHnW6WQZcabxtOrA8HZAShcv7ybqZGSpjGpwJRcSPA8dsmP//bo Q==;
X-CSE-ConnectionGUID: Jq1JH/6bTXaMKs5PRZlmJw==
X-CSE-MsgGUID: N+CHtzNORHSQQ7big8wZ0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="43481650"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="43481650"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 15:59:28 -0800
X-CSE-ConnectionGUID: +oGC1J08S0ikGwfK39uXPQ==
X-CSE-MsgGUID: jjuCX4SRR1OU9M5Yvd2aXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="94546784"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 15:59:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 15:59:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 15:59:27 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 15:59:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KKsB2vYz9veLuB057xiaRJd0wLpCDXHL8dUHk9V38iA649WJD6kIp1K/oCSkVxwmA2CIUdXQINtPgCBGrzI/Y0aR7bU+67YPE3lMEZEPFXZl1hz5bFIPRSx17FdOURQ3/aGMaZjX7BWjdCL2chGQN9+wSRix1bpLIWRNUaT0UPrD3P69glqrFd8YOpXegpJylDFEVVRkHerV47seOELs10pxWXhG8h4tBDGIvtfYmLH149KmHhSG+M1sAHEFM3bUBu9loIVFyj6iJEypp/Z92SRWvdTwEXZAFGJmYpYLp8WfjEgJkX5QzvLpzG3NlOlFLskVYhg3/jUr0KwDBKVRUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfNDxKIOgFjmWWyIR0m7rRtuRdACxrTi6p/YRMu2GMs=;
 b=O2MfhS3ioZbRYBQbrU7VWO21fveqG5It2FQ8EeoQ+CLBA5HFPk9DO2FoyswxlK//DWuXDlstxjfwpNs8AEhDyauoQO9FkXAFxeHdWOXV2n/lUdaByuChy4k46VthI1jt3qDPUSGJavmKgBWjrY+zgEdb2GNXQ5bz0eQRH2vlW8ABmluwK8wFTG2Zyq7PDylL7NT0Q9SvP338I+4pWzF+eiahluC2yI0uIVyHQ+xOdBt8Oj0FR5eLjByQh12U4BthLYV9MsmKAL1nfbnsQy5iu28Rdj0Xf9AmuecxaBjXpLtBUtXB4sRxoi4WdLvQll+uZbdZ4WN+9oL8BQ1XWHHFOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by MW3PR11MB4729.namprd11.prod.outlook.com (2603:10b6:303:5d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 23:59:23 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%6]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 23:59:22 +0000
Date: Tue, 19 Nov 2024 15:59:12 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ashutosh.dixit@intel.com>,
 <james.ausmus@intel.com>, <felix.j.degrood@intel.com>,
 <jose.souza@intel.com>, <matias.a.cabral@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <shubham.kumar@intel.com>
Subject: Re: [PATCH v4 2/5] drm/xe/eustall: Introduce API for EU stall sampling
Message-ID: <Zz0mUGCKzLXI5Y13@intel.com>
References: <cover.1728884074.git.harish.chegondi@intel.com>
 <a4ca443e9dc0e25ff4d77908f785cdfdf6c80f7f.1728884074.git.harish.chegondi@intel.com>
 <ZzYj53waEWwK/5za@orsosgc001>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZzYj53waEWwK/5za@orsosgc001>
X-ClientProxiedBy: MW4PR03CA0055.namprd03.prod.outlook.com
 (2603:10b6:303:8e::30) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|MW3PR11MB4729:EE_
X-MS-Office365-Filtering-Correlation-Id: e5a6aad2-b725-44d7-3660-08dd08f63058
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NEZLak9Hd0ZjL1BlMEpvam9HUHhHOXNFN1dFYzI0SDVYYjJ2WElxOTNXMVZ6?=
 =?utf-8?B?VUdnQnFjTVZTK1NEWWgxRkNiUTJ3TFZ4dyttNXR0ZzNLTGFJZFdSa0hkQ3Jq?=
 =?utf-8?B?d0JwRk5ETTF1VTIvYUUxbTdMNUNYamxNV2FmUitTdHF5TDFSelJVams5YXRG?=
 =?utf-8?B?d0pvVWdFODh5MmVlMDhYNHhiVUpVV3hqMlpxempZRU9IZElnNm9SNGhnaXds?=
 =?utf-8?B?SUx1RFZ5V3ZBT2UrU3B3ODVkUXFlR0VleUJqbG9kOWk4RnZtM2d3RHh2V2N6?=
 =?utf-8?B?SDZNMmJiSm1rdkFoOUJmeGgvbTcyenU4ODJrUGtpUXQzQUZQdVhwdml4VDJG?=
 =?utf-8?B?cUZuRDFXRDkyRUVKMWd6bVRJdllzd3dBQllndVNBVlJTK1owQlkzVmIxMzNC?=
 =?utf-8?B?ZnNMVytzZVVXdVEvMWVxclcwVUdOVHhXVklSbldsQ2dUWHpVenVWcCtRdS9U?=
 =?utf-8?B?K1dwdFlqRFpsYWFRdE01ei9TV2V4OXh6Q2lRSmFUb1JFRWZaeUlSY0crVG9Z?=
 =?utf-8?B?N1dzcGJiaWZNak4xZnY2WW55amR2dlBWVzR3NGhwTFVkRHQzMjFsUlFQT3N6?=
 =?utf-8?B?OWpROXBabCthaE9EcGxYZFBnSTZEYU9CV3ZLVzRDcWtpVkMrZGptU3U0bjg4?=
 =?utf-8?B?aCtsNzAvQm5ML1FZQWJaNlgyQnBQUUpkU0g5NmpXajl3ZDRpV3l2R25IYnV4?=
 =?utf-8?B?MVVDcDZWamwwdjlBTUJpZ3phaU5sOFlXQUE3R0JETmZjc3JSOGl5QmljblAv?=
 =?utf-8?B?elBQMmZndXJQZ3kvZUEvWk95TjhSUUdjc1NSM2g5azg4QzU3WUR6MWJZU0lk?=
 =?utf-8?B?dHliZHMrTDlYSHRZSnZjK1lSRE0zYitqeWJURUU5K3RKYlUxYWdDblIrdnB1?=
 =?utf-8?B?bHFRSFVLKzFJZXhTTGFrN2k0ZXd4MXI4QU9jZXVvSktIbTZSdVNaOWNOZlBk?=
 =?utf-8?B?ZU9RVjhiSUFaZEhLK2JDSndQVHQwNElVL090QnJmVkNKUTZPQmZ6R0JSQzZx?=
 =?utf-8?B?S3dlVTdld1ZkMlVJQjk5Z21SUlZFdUFGMk9NRjVwNnJKYURpaEMzditNNm9X?=
 =?utf-8?B?WXpHNjk1ZFNCMUlRK3NBMkQzcmhCY3FuRVdYQ1dFNjlKcldmY2lvY1luZmo4?=
 =?utf-8?B?SmVnd0pJUlNxamNXVWNjTWpLcnNadkpOSThxRW1CY1hVYUJ6M0NDUWQ2cldU?=
 =?utf-8?B?aUMxZzEvTDFNa0NSQkxjeUNBb1M4TUlmWXg1LzdSOGhZeHpsMG8yYWlXQTZC?=
 =?utf-8?B?UUw3Nm44dEdrNHpCSUxiZndOQVNoTVlpeXREa1B0d211VEozbTNoQjB4bkZD?=
 =?utf-8?B?VEFWQno5d29hOElzWmMzd2JSaktmTUNLcm1naWkyNGZ5WkU4QWYwRUplWXNh?=
 =?utf-8?B?eFV2UGdlRURvS09yY2NLKzlpZzc2bUk5RHVDUHIwSGIvY3hQNmhjaGx6RzMr?=
 =?utf-8?B?ODU5c1lqbU44QUtnQlQ3aU1GTkE2RkFYNmhScFVxdDRGWExEYW9hcDRkNDBa?=
 =?utf-8?B?OXNQVVczTlQ5RDhnRWd0TU1HbEdVd1A5UFVmOXM1cUNHZnVZZVZUbU9vem45?=
 =?utf-8?B?Y0VtVm9EV0tHdlU1aDkxMVM2SzBBenYwUEFuR3ZSRnRzTXJkRldrU3JEdzUv?=
 =?utf-8?B?Y2c3MVhIOE9EbThsNmxKUUJWNElhYnFVVEdXUVJ5QU0yM011UU80aWhmUEw5?=
 =?utf-8?B?MmpINm53dnlMdXNJWnRzdWtkRVBwSmpmVDJqUnBsZ0hEYjVzeDQwd0hoOEFW?=
 =?utf-8?Q?fKGhp8/ADlA91stqlJjTMOAzJvDVaf7p4eYYxIB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mzg2YVRQS3FjcmZaZjY2clBCdzVTR2tPYm9aVFY2Sm1jcnRKNkpDSVJPK28z?=
 =?utf-8?B?NmxqVkNCd2U5cUlncU9MWXV1K3lmd0FzclZTcUU5eW84WEFkekxRZ3hDTEZt?=
 =?utf-8?B?Qkl4VW40ak41MWdMcUIrN1VrMlE2Z1V2LzFza2YzbXNzQk9PMEtSV3JsaGhJ?=
 =?utf-8?B?NU1uaVZBMytSc0Q2M2p2TkJJL1dDN3Voa0lYRUcrN0JZd2xiSzZ6SEZRTFk0?=
 =?utf-8?B?TzBXSTBSOEVwMi8rOW5TaU1sME5uUmUxNmxCMGJobnJOOEVpUkVUcVJURFov?=
 =?utf-8?B?TEo2QjY2OUxUSExMOU5MZkpTakJDRlpsbXdHZUpuNkg0SzZRSXhNa0k4Lzhs?=
 =?utf-8?B?cE1kZXlzSHdOSDJaMGJTRDdlS0Fkelo2T09odk80VDgrV2dlbnlWNXVFOUN0?=
 =?utf-8?B?YnJDd1lWQXVBNTJMOGNaYnBnb0J6WkRyZWc3OERWRDdkMXBHUm9HVmd1c0hO?=
 =?utf-8?B?Vm4zdmc0QjV0V1Q0UFI2RitRY3hWd2xBTndrVU5ZYWZYaStUTnFsK0lsREc0?=
 =?utf-8?B?Q3ZpODk0RlE4WU5EQXpLL2xBRnRCaWExa1pwOTUyMUdlVmRMSVhBRXhHekdL?=
 =?utf-8?B?NGVOcG9XMngyc1JxVm96eWVPWXB5TU4vdDNyKzhoVGJhdERXZmd2NVJWUi9Y?=
 =?utf-8?B?SWFqaHlKbkF4ajJoUjNpa3Babnp1TjZZL2hWaXhMczEwSjRINW1BZUNrN0dn?=
 =?utf-8?B?K3p6N1ZSeHFjb1U4enFjUytlVGFLRUlUNkc3aW9CeVlHQk1RdDhYZjVhanRw?=
 =?utf-8?B?emtsMjFyZnZTc3NlMjI1SGwwTzd5dXhFbG5ITFZLYm9vUysrUFJrZnhzUjJM?=
 =?utf-8?B?ckhjcFhQanBiQ3E0UGM1THR4em10RkF0eGFBZU1qVXZjbDMzVzBDVElyalNa?=
 =?utf-8?B?SFVBTVh2cElqbWNDdXJWL0NQSGJ3Yk5CQXFJcjg0dzZuam5uM3BYcktwa1Vz?=
 =?utf-8?B?UjBYRUl5ZVlYd3pRT01hNXk3dVV5YlpSTE96bGJzamxSV3I0N3BHMEVZNnM4?=
 =?utf-8?B?YTd3Y0hlRmlWSEQ4SVp6ZGlYYXpRajF2YkxtNFVjZEltWHh5cG5vNmFOWHZ3?=
 =?utf-8?B?ZTVTWjZzM21RR1F6VlZjQ3hkeTZOVHBVaCtaMEx6SW5GeUZLWGJhVHRINldZ?=
 =?utf-8?B?WE8xaXJkM1Bud3I5WTdoZU1VcFRyNE5vOXVvbkRrenkxNzRoT0pSV01kbENy?=
 =?utf-8?B?UjErYVFRL2M0QWZpWXZKQnpTRk9hbld0cnp3WE93U3dpQ0IyN3h5cGVQNlpE?=
 =?utf-8?B?cy9HMXRCTk9Ec3NGS1ZxR3Y4ZmVRS0xNTlR0SFhEVnRWS01MR2dhN0R0d215?=
 =?utf-8?B?OW9vWlNWS0QvUXZGYm5Sbnl2TlVXR3pnTDJURndBcC9WUTI3a2JnQmFsWnRq?=
 =?utf-8?B?MEFlQ3hDSXFpSUxFZGM0aThla0huQkN4cmw0SXJ4WTNLWG0zVHR0K2VJL1NW?=
 =?utf-8?B?NUhmNW1TWWROVEdqZjhaZERqblA2bXlQNklDSnp4eExLRTl4dVVTL1RTSTZo?=
 =?utf-8?B?NExpWWMraXFUcDd5TUlkTHVCaEovQzVDZnNxOXl6WFVmYlNSMkNCZTlJRlJQ?=
 =?utf-8?B?UUxydDJSU3h3UXA4aGczVnkwUDBIMjg2TzBsVjZta3VYbkxDUFJ4QURSNk45?=
 =?utf-8?B?NmhJTU02VDNrSVhRUHQzWFhsMlBTcDFRSkZDY0Q2OTI4czQxY291WWpFK0Nv?=
 =?utf-8?B?QXNxeG9HempLTTVjRnc3Y05DOU03T1dmdlBNOFk5dno2VlY5WHR0Y2FLMkhl?=
 =?utf-8?B?cE16SHQ0TUZ2Q3lzc0orRjFUUmY0TE81Ylh1c29BRHc4dkZ3eTE3MnlqVnFB?=
 =?utf-8?B?ck5YKzhqdzR1N21PMU5weHE1NHA4bEVidXpubTB1VDZ1L1BPaHlzLzZJbHFZ?=
 =?utf-8?B?bUNOTGxmdndJRnhNY25XWXEyZVN0TGFkWUdpTkIrSk5PWHY2aFdlQ2pTQktn?=
 =?utf-8?B?MzA3eFJqMU9qbWFXOFozQkFDK0FrZlUyZmZxcHJpNWVIUEFOVWZLOU9aZk1r?=
 =?utf-8?B?UDUveXkzMWdyVGhrelBWby9QOURkRzFGdE1aTFNoaXFTZ3p1Mnl2TTJZSHpB?=
 =?utf-8?B?QktDRmZUWVBFemg3QkQ0bHVnL3VqVWtoZEhnYjlITmZiMGo2Rlc0ZXM1U01J?=
 =?utf-8?B?dUs4alh6b2hxbmVNU0g5bWJvaFNya3FmUktGZnhjd2w1SkhCSjFxR1M1Wm9q?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a6aad2-b725-44d7-3660-08dd08f63058
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 23:59:22.4899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: spzP7+QRWdw3Oc7Yb7E84bQLL0o1cpLU+LCKapW8zoKumjlW0VTcGHkbmyFoNaICPGp5QZT55PfPheYCpz4/DTHVDWQVktzHSOzwOW6Zt+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4729
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

On Thu, Nov 14, 2024 at 08:23:03AM -0800, Umesh Nerlige Ramappa wrote:
> On Sun, Oct 13, 2024 at 11:00:33PM -0700, Harish Chegondi wrote:
> > A new hardware feature first introduced in PVC gives capability to
> > periodically sample EU stall state and record counts for different stall
> > reasons, on a per IP basis, aggregate across all EUs in a subslice and
> > record the samples in a buffer in each subslice. Eventually, the aggregated
> > data is written out to a buffer in the memory. This feature is also
> > supported in XE2 and later architecture GPUs.
> > 
> > Use an existing IOCTL DRM_IOCTL_XE_OBSERVATION as interface into the driver
> > from the user space to do initial setup and obtain a file descriptor for
> > the EU stall counter data stream.  Input parameter to the IOCTL is a struct
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
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > ---
> > drivers/gpu/drm/xe/Makefile         |   1 +
> > drivers/gpu/drm/xe/xe_eu_stall.c    | 275 ++++++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_eu_stall.h    |  12 ++
> > drivers/gpu/drm/xe/xe_observation.c |  14 ++
> > include/uapi/drm/xe_drm.h           |  42 +++++
> > 5 files changed, 344 insertions(+)
> > create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.c
> > create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index cb6c625bdef0..bf21feae6950 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -33,6 +33,7 @@ xe-y += xe_bb.o \
> > 	xe_device_sysfs.o \
> > 	xe_dma_buf.o \
> > 	xe_drm_client.o \
> > +	xe_eu_stall.o \
> > 	xe_exec.o \
> > 	xe_execlist.o \
> > 	xe_exec_queue.o \
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > new file mode 100644
> > index 000000000000..5e4c90f9614d
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > @@ -0,0 +1,275 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2024 Intel Corporation
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
> > + * struct eu_stall_open_properties
> > + *
> > + * @eu_stall_sampling_rate: Hardware EU stall sampling rate.
> > + * @event_report_count: Minimum no of EU stall data rows for poll to set POLLIN.
> > + * @poll_period: The period in nanoseconds at which the CPU will check for
> > + *		 EU stall data in the buffer.
> > + * @gt: GT on which EU stall data will be captured.
> > + */
> > +struct eu_stall_open_properties {
> > +	u8 eu_stall_sampling_rate;
> > +	u32 event_report_count;
> > +	u64 poll_period;
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
> > +{
> > +	return (data_size >> 6);
> > +}
> > +
> > +static int set_prop_eu_stall_sampling_rate(struct xe_device *xe, u64 value,
> > +					   struct eu_stall_open_properties *props)
> > +{
> > +	if (value == 0 || value > 7) {
> > +		drm_dbg(&xe->drm, "Invalid EU stall sampling rate %llu\n", value);
> > +		return -EINVAL;
> > +	}
> > +	props->eu_stall_sampling_rate = value;
> > +	return 0;
> > +}
> > +
> > +static int set_prop_eu_stall_poll_period(struct xe_device *xe, u64 value,
> > +					 struct eu_stall_open_properties *props)
> > +{
> > +	if (value < 100000 /* 100us */) {
> > +		drm_dbg(&xe->drm, "EU stall data poll period %lluns less than 100us\n", value);
> > +		return -EINVAL;
> > +	}
> > +	props->poll_period = value;
> > +	return 0;
> > +}
> > +
> > +static int set_prop_eu_stall_event_report_count(struct xe_device *xe, u64 value,
> > +						struct eu_stall_open_properties *props)
> > +{
> > +	if (value == 0) {
> > +		drm_dbg(&xe->drm, "Invalid EU stall poll event report count %llu\n", value);
> > +		return -EINVAL;
> > +	}
> > +	props->event_report_count = (u32)value;
> > +	return 0;
> > +}
> > +
> > +static int set_prop_eu_stall_gt_id(struct xe_device *xe, u64 value,
> > +				   struct eu_stall_open_properties *props)
> > +{
> > +	props->gt = xe_device_get_gt(xe, (u8)value);
> > +	if (!props->gt) {
> > +		drm_dbg(&xe->drm, "Invalid GT ID %llu for EU stall sampling\n", value);
> > +		return -EINVAL;
> > +	}
> > +	return 0;
> > +}
> > +
> > +typedef int (*set_eu_stall_property_fn)(struct xe_device *xe, u64 value,
> > +					struct eu_stall_open_properties *props);
> > +
> > +static const set_eu_stall_property_fn xe_set_eu_stall_property_funcs[] = {
> > +	[DRM_XE_EU_STALL_PROP_SAMPLE_RATE] = set_prop_eu_stall_sampling_rate,
> > +	[DRM_XE_EU_STALL_PROP_POLL_PERIOD] = set_prop_eu_stall_poll_period,
> > +	[DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT] = set_prop_eu_stall_event_report_count,
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
> > + * xe_eu_stall_stream_ioctl - support ioctl() usage with xe EU stall data
> > + *								stream fd
> > + * @file: An xe EU stall data stream file
> > + * @cmd: the ioctl request
> > + * @arg: the ioctl data
> > + *
> > + * Returns: zero on success or a negative error code. Returns -EINVAL for
> > + * an unknown ioctl request.
> > + */
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
> > +int xe_eu_stall_stream_open(struct drm_device *dev,
> > +			    u64 data,
> > +			    struct drm_file *file)
> > +{
> > +	struct xe_device *xe = to_xe_device(dev);
> > +	struct eu_stall_open_properties props;
> > +	int ret, stream_fd;
> > +
> > +	memset(&props, 0, sizeof(struct eu_stall_open_properties));
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
> > +
> > +	if (!has_eu_stall_sampling_support(xe)) {
> > +		xe_gt_dbg(props.gt, "EU stall monitoring is not supported on this platform\n");
> > +		return -EPERM;
> > +	}
> > +	stream_fd = anon_inode_getfd("[xe_eu_stall]", &fops_eu_stall,
> > +				     NULL, 0);
> > +	if (stream_fd < 0)
> > +		xe_gt_dbg(props.gt, "EU stall inode get fd failed : %d\n", stream_fd);
> > +
> > +	return stream_fd;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.h b/drivers/gpu/drm/xe/xe_eu_stall.h
> > new file mode 100644
> > index 000000000000..70fc89480df2
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.h
> > @@ -0,0 +1,12 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2024 Intel Corporation
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
> > #include <uapi/drm/xe_drm.h>
> > 
> > #include "xe_oa.h"
> > +#include "xe_eu_stall.h"
> > #include "xe_observation.h"
> > 
> > u32 xe_observation_paranoid = true;
> > @@ -29,6 +30,17 @@ static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_observation_param *
> > 	}
> > }
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
> > /**
> >  * xe_observation_ioctl - The top level observation layer ioctl
> >  * @dev: @drm_device
> > @@ -51,6 +63,8 @@ int xe_observation_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
> > 	switch (arg->observation_type) {
> > 	case DRM_XE_OBSERVATION_TYPE_OA:
> > 		return xe_oa_ioctl(dev, arg, file);
> > +	case DRM_XE_OBSERVATION_TYPE_EU_STALL:
> > +		return xe_eu_stall_ioctl(dev, arg, file);
> > 	default:
> > 		return -EINVAL;
> > 	}
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index c4182e95a619..50ad6b2e1450 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -1397,6 +1397,8 @@ struct drm_xe_wait_user_fence {
> > enum drm_xe_observation_type {
> > 	/** @DRM_XE_OBSERVATION_TYPE_OA: OA observation stream type */
> > 	DRM_XE_OBSERVATION_TYPE_OA,
> > +	/** @DRM_XE_OBSERVATION_TYPE_EU_STALL: EU stall sampling observation stream type */
> > +	DRM_XE_OBSERVATION_TYPE_EU_STALL,
> > };
> > 
> > /**
> > @@ -1696,6 +1698,46 @@ struct drm_xe_oa_stream_info {
> > 	__u64 reserved[3];
> > };
> > 
> > +/**
> > + * enum drm_xe_eu_stall_property_id - EU stall sampling input property ids.
> > + *
> > + * These properties are passed to the driver as a chain of
> > + * @drm_xe_ext_set_property structures with @property set to these
> > + * properties' enums and @value set to the corresponding values of these
> > + * properties. @drm_xe_user_extension base.name should be set to
> > + * @DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY.
> > + */
> > +enum drm_xe_eu_stall_property_id {
> > +#define DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY		0
> > +	/**
> > +	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate
> > +	 * in multiples of 251 cycles. Valid values are 1 to 7.
> > +	 * If the value is 1, sampling interval is 251 cycles.
> > +	 * If the value is 7, sampling interval is 7 x 251 cycles.
> > +	 */
> > +	DRM_XE_EU_STALL_PROP_SAMPLE_RATE = 1,
> 
> What is the rate of 251 cycles? If that can be clearly defined, then at
> first glance, I would think it's better to define this in terms of
> frequency. The implementation can decide how to translate that to HW
> configuration.
> 
> Regards,
> Umesh
Since the duration of a cycle depends on the GPU clock, it can very from
GPU to GPU. So, if there is any translation in the driver, it will have
to be different for each GPU. I think keeping this input as a multiplier
of cycles may be more future proof for the uAPI. I am trying to get more
information and feedback from the user space regarding your suggestion.
If it is feasible, I will implement in v6.

Thank You
Harish.
> 
> > +
> > +	/**
> > +	 * @DRM_XE_EU_STALL_PROP_POLL_PERIOD: EU stall data
> > +	 * poll period in nanoseconds at which the driver polls
> > +	 * for EU stall data in the buffer. Should be at least 100000 ns.
> > +	 */
> > +	DRM_XE_EU_STALL_PROP_POLL_PERIOD,
> > +
> > +	/**
> > +	 * @DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT: Minimum number of
> > +	 * EU stall data rows to be present in the kernel buffer for
> > +	 * poll() to set POLLIN (data present).
> > +	 */
> > +	DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT,
> > +
> > +	/**
> > +	 * @DRM_XE_EU_STALL_PROP_GT_ID: GT ID of the GT on which
> > +	 * EU stall data will be captured.
> > +	 */
> > +	DRM_XE_EU_STALL_PROP_GT_ID,
> > +};
> > +
> > #if defined(__cplusplus)
> > }
> > #endif
> > -- 
> > 2.45.1
> > 
