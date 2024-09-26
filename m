Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6A5CDE031
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 18:43:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379BF10EBCE;
	Thu, 26 Sep 2024 18:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fRemNtrJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFAE410EBCE
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 18:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727376213; x=1758912213;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bw0oBgb7oPZ8g7xl2Lj7QDRKE9QEaAulMG2hKsAsCPU=;
 b=fRemNtrJD1ZsPpeNWeTuYUkpWnpQo0u3WKB2SbNN9+XKkktV7AJU7L/2
 rlm4OfCedfnvjY3aZsl6uSU20exX+fCPlCkaOIscAwT/Jdq2K+BIVBLVm
 Ds3CYiLrSMOrOlmOSYqA4bZ88/MFieG80u6KznOMIH98KLQ3dIZMxWdKA
 V9MRdss/2FqQEmJq+2iSQ6J/MA8bekwQ9uO54ddNmWzvhEKqajO7OuptL
 vwxbM86X9Umj/VUfZi55yJEmN13mEmoR6jj+eFcTCNOjPs+6vvBf8C96N
 drjiP+e7MfsisSQd7ohf9bU+bKc9wmQv/hSHo9efzPLEU43IVZuB8NAKR g==;
X-CSE-ConnectionGUID: xaHT2VYtTZWub3FnWoXGNA==
X-CSE-MsgGUID: ki1mrMbNTFC5sIdvjCxzpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="29383362"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="29383362"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 11:43:32 -0700
X-CSE-ConnectionGUID: jEt5dpOvStmvdbAUV1/bRA==
X-CSE-MsgGUID: PhWEtJvCTx6rQJ4ed+l8FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="103050956"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 11:43:32 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 11:43:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 11:43:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 11:43:31 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 11:43:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sFUV/Fsyq6b/LG+mOCp3GzHPXL962/KqN3dzgMSG5+BTNo5BiGChwDMG0LpPKXYynoiouEgx8KPFazDS3n/bzbVAWcz9K5xUo1eutWvdrVahjuMWJFU7mP6GfGVDlG417Rvs8k2xJwu+V0BbclyJclTnhEduNInr7709tZml/gmfCB7o4/JNKrXqz5Yw2XpTtmLSkTkKg2HT80CAi6WjzaAKIZvUyV9SkPE/bnkrGzyBmjlD9X6mhgcxcw4DXkQB2H7avZt2WeHkCAQAJXAJA33V+VgN5AzwOp8/GhouKcQMOGpJSXU9ZwdIa7At+1s1HH+OmX4ntI4uACVnaZLjNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyYzrYHBImFVqooTDCTC4gZrSU3j2eWP4NC/BcT4ZXQ=;
 b=RCBvtyrKAod929Fi2U2A68YRDhcuRJEt+GwpSuytaR4aXMUg8a9SKsoAQMzu3sxlADa1Nw8NKjbq2/khYXVsjieRbZECzYpemYxN9zq4bmeD2i+ZJovVfXZfscs1nIPeINH7HE77tFgExq5DnkyWXJ4ifqSPr8oP0TomXC/ezQy5NS1Mpa4Asts7NRURRZksnIvfrb0zARTUUS+Gsr0wui3dAn1B+cjYIt6MTUWHC4Znk2yb1x+sSk3inve/0GbH57tlG2ISZTd1CjwsdXGwaEvsGloVPvkeYA3TBSl5acay7zVTfviF91pnEpsNlgZZlS6w069ohIB8kBhw+rX/Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CH3PR11MB8436.namprd11.prod.outlook.com (2603:10b6:610:173::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Thu, 26 Sep
 2024 18:43:28 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7962.022; Thu, 26 Sep 2024
 18:43:28 +0000
Date: Thu, 26 Sep 2024 14:43:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2] drm/xe: Use fault injection infrastructure to find
 issues at probe time
Message-ID: <ZvWrS1pwqdbtZHMS@intel.com>
References: <20240920131834.3368299-1-francois.dugast@intel.com>
 <ZvGtzSXTmacUx-HV@intel.com> <ZvK3g7x-K_wPmaiB@fdugast-desk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZvK3g7x-K_wPmaiB@fdugast-desk>
X-ClientProxiedBy: MW4PR03CA0300.namprd03.prod.outlook.com
 (2603:10b6:303:b5::35) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CH3PR11MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: 258d7774-bfdc-4c57-9e16-08dcde5b1c52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?1Sn85BZwh7DMOXPlX3YYgNir3Fyag5nikfjHmbHWfgJsZxX6Fvko/K87My?=
 =?iso-8859-1?Q?Rzlh6nnHZlsOmlgtahqBf4ui/Tp0C1EBBjkpd8cYBYbjpxPUtdWonHXIb/?=
 =?iso-8859-1?Q?+6XWy7TXNu0t73jJQStpaHzWHA+Pq/4naGozC+zjPOBaVVuZQBL4483xND?=
 =?iso-8859-1?Q?hGOf/lOjV4RTA3THfx1eTW0dyNxwtNMGGaVEI8Z8dz8luFraspkkikil81?=
 =?iso-8859-1?Q?gkSp8gwpyq5409S9+g4LqfaiLXgoeynrXVO1TfDk0Pk7lS07oSbrlbm0JF?=
 =?iso-8859-1?Q?fDh2NVHYJ7XzQ3hEytloJHcn4R/Z/WZLDxi8AaU5/HLr+eseO1c2NTKKxd?=
 =?iso-8859-1?Q?cE9XOHTdHOmROoZy7RLB8bYIwQYNy1eOTfzsJfcs6Gaz/lfGvCxb6I9SVg?=
 =?iso-8859-1?Q?mes+T0mkMra76Af6hQ+K9/EIn9FWaLd0Xd16aO+YpghBQyaeeFFpb9+eJe?=
 =?iso-8859-1?Q?rWRSqqqQxo85dfA9pgbyqrJleNcYsxwVx0g+7k6Wkj34qBSf7qlL0xcd7m?=
 =?iso-8859-1?Q?20qP3VINSclyOStvzcagV8GICn8EM0hwf8+kmOJkhFXxmiJ9kU1MGrSWDG?=
 =?iso-8859-1?Q?YNO9LZTSEaEWnVL5dW/i4r7lo1Nme7qzTMK49zWjuwS6ec0qOTSL/bRFnP?=
 =?iso-8859-1?Q?5tbeuayL5yQoyVvxEoHzgfgppHYJ1pa9+WUTdUffP1JeNh3RyqDObqsWtU?=
 =?iso-8859-1?Q?nwNi6k53OJ/BZL2m14baYegb1p3UCa9GJKf9+NTHQXaTLtQkg+KQgOi097?=
 =?iso-8859-1?Q?QF6OunUGy8iP0z0xYLD5WGCN6TAuP370SbUCckhmrM0HTedUk3znfCpHkX?=
 =?iso-8859-1?Q?tq1sLL5Rk6GbgNikA7gD5fBCV8N3nvi8CRA5U4gU2B9L/p8Mh9Yd3G5hbb?=
 =?iso-8859-1?Q?nZaS07UaIBaClUbos7fshxMIiEZ3IWHFgw8K6ObWgtjMsVDUyIq3nsWLz8?=
 =?iso-8859-1?Q?lrdTU5GQjAI5SzCaoG/rUNNY2s5XkhKb0m/we6No/q6v618UJTTIw5GU/9?=
 =?iso-8859-1?Q?6FWBWFSdF36UUYDf9YXEYTqcBW/UOoC+h3piSgYF7uvNsJGYxQolTE1z4a?=
 =?iso-8859-1?Q?3OqD74Fb5Vfi0lHd5zdtPRajk8WE7kv9FqCMVFkL+nh0npFxkDbY2IvXhE?=
 =?iso-8859-1?Q?DsATCQmpLon4f9CvgrtRb3QEJmQKhwp5Wz+F6tJsVa87AlNlxf7v7G8bqT?=
 =?iso-8859-1?Q?P//syH9XiOr6AH2g+qPTWKZ7YYQ4S18WRz8NTQUla7d+6sDoSaDjaF6faJ?=
 =?iso-8859-1?Q?idlmEPVKT2IScevm6AKKEHmofM14icHsJhOVqDTCuhExr3G1ueKNsYEhzY?=
 =?iso-8859-1?Q?7rY4U7whtqnlVbUBfooDX6QcIw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IYoTrztyZn3LGphq/8tkjk2LT7wJUgM2vjzOVCyciOuoBbdxtN16E81B6B?=
 =?iso-8859-1?Q?opfARIFo+XuScopl8LuMUcntVVQvhM/DoVFHEKEEiiSU72HrIKb6V5uJXb?=
 =?iso-8859-1?Q?7bnA0kFke9he+uyfp646VTYQqJDJEmWB2wFHKH3z/RZALR0lnWSS9bKXuh?=
 =?iso-8859-1?Q?u39Ab7UDXDleuJCKhU5itEB6x5/pbH8Lv0r5yAl86z70mCDYAhjzEzYiE0?=
 =?iso-8859-1?Q?Ac/sWqf2jVnhrFOQO4oJRLtzk95kJ4YPrjEZVfDIIzYcYcaDbdiiKZOTlp?=
 =?iso-8859-1?Q?FB2dPhur6K7RZgg0cBAskfeIvK0MJlJuYoxykYdTpEaqYwQPvOISt4LM50?=
 =?iso-8859-1?Q?tMtv4Brw+WM9stcSzlhQtKGV0kyOY1hVwt1eEu123ff4dM05zv6egZj4Td?=
 =?iso-8859-1?Q?f/vy6BnqBxEIq70EU4Vfy075MhBK6iTT7yQA//e/b7SZugoGoHgdFYreES?=
 =?iso-8859-1?Q?3nNSgXbU3DOLjHefrvKchSECvQLKjiK0qedIgG/UBaRSEUJA6LjeSkjPCE?=
 =?iso-8859-1?Q?94vGZBF772UvhvRgKTxQmPMaTtFPG4GNrV3+tgLCwtutNZE/a0cnFkcYc0?=
 =?iso-8859-1?Q?SPDgSbsVLoi+BFi08DlHw/9nj+F3W4Sz6IVyFVMznbrAsiKfdt6MzLVAMI?=
 =?iso-8859-1?Q?2Kt69Z21NoDRRRCj4xdnwaSmX/LpiSY5/4veA/qqYZEoesGcRuZmuX1Ot1?=
 =?iso-8859-1?Q?YtoShcA3HiHqTLtogDtuOc/0/aQbY01q1U+Hwb7Ve2Veq5ztRH4ndNH8IW?=
 =?iso-8859-1?Q?IDVdeELHBvV2atDQyn33SPe1tDSoT/gy77UbfQ1aZ8x2EFKBsj28omFauX?=
 =?iso-8859-1?Q?ytnhiculfEaZ0aC/ONiIrMO9TzZs5Ie9Kcreldw6NT17y5e1B0v2JSdhsx?=
 =?iso-8859-1?Q?6ef2ehzdSHE8Sewh87dLeP5xhUsURWXbpWAY4RSMjSSxPMB1mSCAOMaJNU?=
 =?iso-8859-1?Q?igZj2yp1l2jYQopBLNymhJlzR2YBqP3L3f85LC5OiT08Raua5s3mSI0drL?=
 =?iso-8859-1?Q?bH96/Kou8l4RdIJy5Pg6ZAqGez2fPcZISbD1gsMvKLj500z4ovSZD10AJC?=
 =?iso-8859-1?Q?4cjrZHPM2ltPn9Fu0zPBs5Jm87DsmTluMXZpG7iRZ/gz+Y5tPC78dLFa0/?=
 =?iso-8859-1?Q?3Vl11byownzU8Hhaar2pZIA1BjuH5oygj2NoD3fsSilqgyNfNgncsKOh8y?=
 =?iso-8859-1?Q?pKnV7ZGkHmxHuFuynQktE3/rKrfIAycH5aN7yfmtobuqPIym/k7nVv1iKQ?=
 =?iso-8859-1?Q?Dg/JKylU8FY4Yzj6msftgRkfz2EHRmVp8BrxZCRRKQKvJqIiVLh/4HMaFl?=
 =?iso-8859-1?Q?yTgBaYUmMRmXhjiAuveA+zBLvNELbHwlVwvPudnB4qsxSD0I2gCkpq4OYR?=
 =?iso-8859-1?Q?HC4LSdvpw2JnSuQobIeeBNZ3nd/mjcwppSaqxe0OpAziWofDdtJk10gKPZ?=
 =?iso-8859-1?Q?yA3BG7Hd9FlMy8xzMpgLv4Z7b4z1d/5NDKn0zT4xitGeeVE2prAYIx515W?=
 =?iso-8859-1?Q?oU0KmQ0YPugkd5AnkfpduAri2d1KIO6taxzmrqr9cAZfv03ZEMMn2LwwfZ?=
 =?iso-8859-1?Q?FKyIMpHzjwGH83PxlowZyInSThQGkJU1vZ3W5XbSvlcLft7l2QV4DzU2rg?=
 =?iso-8859-1?Q?u59NDMT+UAmB4gVpdaf3HxOfyHiQ0S9uC1uweN2rp8WAnMWjXeBqJQbg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 258d7774-bfdc-4c57-9e16-08dcde5b1c52
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 18:43:28.1846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cF1SpCRuVoqas0jLSvjmJ68kDyfK87lo9Z6NF4vXl5EQlKu3YP3AubBR2z3Giwp3hmESuanCagauvm9Icp+mAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8436
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

On Tue, Sep 24, 2024 at 02:58:43PM +0200, Francois Dugast wrote:
> On Mon, Sep 23, 2024 at 02:05:01PM -0400, Rodrigo Vivi wrote:
> > On Fri, Sep 20, 2024 at 03:18:34PM +0200, Francois Dugast wrote:
> > > The kernel fault injection infrastructure is used to test proper error
> > > handling during probe. In particular, ALLOW_ERROR_INJECTION() is added
> > > directly to functions which fullfill the injectable functions
> > > requirements:
> > > fault-injection.html#requirements-for-the-error-injectable-functions
> > 
> > Okay, I read this. This was my biggest initial question here...
> > 
> > > 
> > > Otherwise a helper function is added and called in the beginning of the
> > > function where the fault is to be injected.
> > > 
> > > The return code of the functions using ALLOW_ERROR_INJECTION() can be
> > > conditionnally modified at runtime by tuning some debugfs entries. This
> > > requires CONFIG_FUNCTION_ERROR_INJECTION (among others).
> > > 
> > > One way to use fault injection at probe time by making each of those
> > > functions fail one at a time is:
> > > 
> > >     FAILTYPE=fail_function
> > >     DEVICE="0000:00:08.0" # depends on the system
> > >     ERRNO=-12 # -ENOMEM, can depend on the function
> > > 
> > >     echo N > /sys/kernel/debug/$FAILTYPE/task-filter
> > >     echo 100 > /sys/kernel/debug/$FAILTYPE/probability
> > >     echo 0 > /sys/kernel/debug/$FAILTYPE/interval
> > >     echo -1 > /sys/kernel/debug/$FAILTYPE/times
> > >     echo 0 > /sys/kernel/debug/$FAILTYPE/space
> > >     echo 1 > /sys/kernel/debug/$FAILTYPE/verbose
> > > 
> > >     modprobe xe
> > >     echo $DEVICE > /sys/bus/pci/drivers/xe/unbind
> > > 
> > >     grep -oP "^.* \[xe\]" /sys/kernel/debug/$FAILTYPE/injectable | \
> > >     cut -d ' ' -f 1 | while read -r FUNCTION ; do
> > >         echo "Injecting fault in $FUNCTION"
> > >         echo "" > /sys/kernel/debug/$FAILTYPE/inject
> > >         echo $FUNCTION > /sys/kernel/debug/$FAILTYPE/inject
> > >         printf %#x $ERRNO > /sys/kernel/debug/$FAILTYPE/$FUNCTION/retval
> > >         echo $DEVICE > /sys/bus/pci/drivers/xe/bind
> > >     done
> > > 
> > >     rmmod xe
> > > 
> > > It will also be integrated into IGT for systematic execution by CI.
> > > 
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device.c    | 12 ++++++++++++
> > >  drivers/gpu/drm/xe/xe_ggtt.c      |  2 ++
> > >  drivers/gpu/drm/xe/xe_guc_ads.c   | 13 +++++++++++++
> > >  drivers/gpu/drm/xe/xe_guc_ct.c    | 11 +++++++++++
> > >  drivers/gpu/drm/xe/xe_guc_log.c   | 13 +++++++++++++
> > >  drivers/gpu/drm/xe/xe_guc_relay.c | 11 +++++++++++
> > >  drivers/gpu/drm/xe/xe_pm.c        | 11 +++++++++++
> > >  drivers/gpu/drm/xe/xe_sriov.c     | 15 ++++++++++++++-
> > >  drivers/gpu/drm/xe/xe_tile.c      | 12 ++++++++++++
> > >  drivers/gpu/drm/xe/xe_uc_fw.c     | 11 +++++++++++
> > >  drivers/gpu/drm/xe/xe_wa.c        | 12 ++++++++++++
> > >  drivers/gpu/drm/xe/xe_wopcm.c     |  3 +++
> > >  12 files changed, 125 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index cb5a9fd820cf..d26352ecf75e 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -6,6 +6,7 @@
> > >  #include "xe_device.h"
> > >  
> > >  #include <linux/delay.h>
> > > +#include <linux/fault-inject.h>
> > >  #include <linux/units.h>
> > >  
> > >  #include <drm/drm_aperture.h>
> > > @@ -300,12 +301,22 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
> > >  	ttm_device_fini(&xe->ttm);
> > >  }
> > >  
> > > +static noinline int fault_inject_device_create(void)
> > > +{
> > > +	return 0;
> > > +}
> > > +ALLOW_ERROR_INJECTION(fault_inject_device_create, ERRNO);
> > > +
> > >  struct xe_device *xe_device_create(struct pci_dev *pdev,
> > >  				   const struct pci_device_id *ent)
> > >  {
> > >  	struct xe_device *xe;
> > >  	int err;
> > >  
> > > +	err = fault_inject_device_create();
> > 
> > But then I don't understand here. To me it looks like this function would
> > fulfill the criteria. It is not doing any clean up on the err goto,
> > nor changingn any state before the first error return.
> 
> I believe the second requirement for error injectable functions [1] is
> not fullfilled:
> 
>     "The function does not execute any code which can change any state
>     before the first error return. [...] For example, [...] set a flag"

ouch! even local flags that means nothing after the returned probe!
that is really so strict.

> 
> Before this code change, the first return statement comes after the call
> to xe_display_driver_set_hooks() which sets some flags. After this, the
> call to drm_aperture_remove_conflicting_pci_framebuffers() continues to
> change the state.

hmm, in this case, this drm_apearture call can really change the memory.

But I had only looked to the xe_display_driver_set_hooks() that is
really inoffensive, because the rule tells 'before the first error'.
With this I was assuming that the first line to return the error is never
executed... only what is *before* that... but that would be too magic
right?!

> 
> But for the sake of keeping the code simple, maybe in such cases we do
> not need to take this requirement so strictly and could go with using
> ALLOW_ERROR_INJECTION() directly, without the wrapper, as long as the
> caller function does not expect something to be done in the called
> function. For example, this can be the case when in the caller function
> the return code is propagated without the need for cleanup. It seems
> to be the case here.
> 
> [1] https://docs.kernel.org/fault-injection/fault-injection.html#requirements-for-the-error-injectable-functions
> 
> Francois
> 
> > 
> > Why can't we go directly?
> > 
> > Perhaps we should add a comment on each of this new fault_inject
> > functions to explain why that was chosen instead of the direct
> > macro assignment?
> > 
> > > +	if (err)
> > > +		return ERR_PTR(err);
> > > +
> > >  	xe_display_driver_set_hooks(&driver);
> > >  
> > >  	err = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver);
> > > @@ -548,6 +559,7 @@ static int wait_for_lmem_ready(struct xe_device *xe)
> > >  
> > >  	return 0;
> > >  }
> > > +ALLOW_ERROR_INJECTION(wait_for_lmem_ready, ERRNO);
> > >  
> > >  static void update_device_info(struct xe_device *xe)
> > >  {
> > > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > > index f68af56c3f86..4906e3f3150b 100644
> > > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > > @@ -5,6 +5,7 @@
> > >  
> > >  #include "xe_ggtt.h"
> > >  
> > > +#include <linux/fault-inject.h>
> > >  #include <linux/io-64-nonatomic-lo-hi.h>
> > >  #include <linux/sizes.h>
> > >  
> > > @@ -264,6 +265,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
> > >  
> > >  	return 0;
> > >  }
> > > +ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO);
> > >  
> > >  static void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > > index 66d4e5e95abd..e366043eb4b8 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > > @@ -5,6 +5,8 @@
> > >  
> > >  #include "xe_guc_ads.h"
> > >  
> > > +#include <linux/fault-inject.h>
> > > +
> > >  #include <drm/drm_managed.h>
> > >  
> > >  #include <generated/xe_wa_oob.h>
> > > @@ -396,12 +398,23 @@ static int calculate_waklv_size(struct xe_guc_ads *ads)
> > >  
> > >  #define MAX_GOLDEN_LRC_SIZE	(SZ_4K * 64)
> > >  
> > > +static noinline int fault_inject_guc_ads_init(void)
> > > +{
> > > +	return 0;
> > > +}
> > > +ALLOW_ERROR_INJECTION(fault_inject_guc_ads_init, ERRNO);
> > > +
> > >  int xe_guc_ads_init(struct xe_guc_ads *ads)
> > >  {
> > >  	struct xe_device *xe = ads_to_xe(ads);
> > >  	struct xe_gt *gt = ads_to_gt(ads);
> > >  	struct xe_tile *tile = gt_to_tile(gt);
> > >  	struct xe_bo *bo;
> > > +	int ret;
> > > +
> > > +	ret = fault_inject_guc_ads_init();
> > > +	if (ret)
> > > +		return ret;
> > >  
> > >  	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
> > >  	ads->regset_size = calculate_regset_size(gt);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index 4b95f75b1546..61967ddd319f 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -8,6 +8,7 @@
> > >  #include <linux/bitfield.h>
> > >  #include <linux/circ_buf.h>
> > >  #include <linux/delay.h>
> > > +#include <linux/fault-inject.h>
> > >  
> > >  #include <kunit/static_stub.h>
> > >  
> > > @@ -165,6 +166,12 @@ static void primelockdep(struct xe_guc_ct *ct)
> > >  	fs_reclaim_release(GFP_KERNEL);
> > >  }
> > >  
> > > +static noinline int fault_inject_guc_ct_init(void)
> > > +{
> > > +	return 0;
> > > +}
> > > +ALLOW_ERROR_INJECTION(fault_inject_guc_ct_init, ERRNO);
> > > +
> > >  int xe_guc_ct_init(struct xe_guc_ct *ct)
> > >  {
> > >  	struct xe_device *xe = ct_to_xe(ct);
> > > @@ -173,6 +180,10 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> > >  	struct xe_bo *bo;
> > >  	int err;
> > >  
> > > +	err = fault_inject_guc_ct_init();
> > > +	if (err)
> > > +		return err;
> > > +
> > >  	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
> > >  
> > >  	ct->g2h_wq = alloc_ordered_workqueue("xe-g2h-wq", 0);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> > > index a37ee3419428..a3e54f1bb0c3 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_log.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> > > @@ -5,6 +5,8 @@
> > >  
> > >  #include "xe_guc_log.h"
> > >  
> > > +#include <linux/fault-inject.h>
> > > +
> > >  #include <drm/drm_managed.h>
> > >  
> > >  #include "xe_bo.h"
> > > @@ -77,11 +79,22 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
> > >  	}
> > >  }
> > >  
> > > +static noinline int fault_inject_guc_log_init(void)
> > > +{
> > > +	return 0;
> > > +}
> > > +ALLOW_ERROR_INJECTION(fault_inject_guc_log_init, ERRNO);
> > > +
> > >  int xe_guc_log_init(struct xe_guc_log *log)
> > >  {
> > >  	struct xe_device *xe = log_to_xe(log);
> > >  	struct xe_tile *tile = gt_to_tile(log_to_gt(log));
> > >  	struct xe_bo *bo;
> > > +	int err;
> > > +
> > > +	err = fault_inject_guc_log_init();
> > > +	if (err)
> > > +		return err;
> > >  
> > >  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
> > >  					  XE_BO_FLAG_SYSTEM |
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
> > > index ade6162dc259..ede7fd3e7785 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_relay.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_relay.c
> > > @@ -5,6 +5,7 @@
> > >  
> > >  #include <linux/bitfield.h>
> > >  #include <linux/delay.h>
> > > +#include <linux/fault-inject.h>
> > >  
> > >  #include <drm/drm_managed.h>
> > >  
> > > @@ -320,6 +321,12 @@ static void __fini_relay(struct drm_device *drm, void *arg)
> > >  	mempool_exit(&relay->pool);
> > >  }
> > >  
> > > +static noinline int fault_inject_guc_relay_init(void)
> > > +{
> > > +	return 0;
> > > +}
> > > +ALLOW_ERROR_INJECTION(fault_inject_guc_relay_init, ERRNO);
> > > +
> > >  /**
> > >   * xe_guc_relay_init - Initialize a &xe_guc_relay
> > >   * @relay: the &xe_guc_relay to initialize
> > > @@ -335,6 +342,10 @@ int xe_guc_relay_init(struct xe_guc_relay *relay)
> > >  	struct xe_device *xe = relay_to_xe(relay);
> > >  	int err;
> > >  
> > > +	err = fault_inject_guc_relay_init();
> > > +	if (err)
> > > +		return err;
> > > +
> > >  	relay_assert(relay, !relay_is_ready(relay));
> > >  
> > >  	if (!IS_SRIOV(xe))
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > index 33eb039053e4..87075aed885d 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > @@ -5,6 +5,7 @@
> > >  
> > >  #include "xe_pm.h"
> > >  
> > > +#include <linux/fault-inject.h>
> > >  #include <linux/pm_runtime.h>
> > >  
> > >  #include <drm/drm_managed.h>
> > > @@ -247,10 +248,20 @@ static void xe_pm_runtime_init(struct xe_device *xe)
> > >  	pm_runtime_put(dev);
> > >  }
> > >  
> > > +static noinline int fault_inject_pm_init_early(void)
> > > +{
> > > +	return 0;
> > > +}
> > > +ALLOW_ERROR_INJECTION(fault_inject_pm_init_early, ERRNO);
> > > +
> > >  int xe_pm_init_early(struct xe_device *xe)
> > >  {
> > >  	int err;
> > >  
> > > +	err = fault_inject_pm_init_early();
> > > +	if (err)
> > > +		return err;
> > > +
> > >  	INIT_LIST_HEAD(&xe->mem_access.vram_userfault.list);
> > >  
> > >  	err = drmm_mutex_init(&xe->drm, &xe->mem_access.vram_userfault.lock);
> > > diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> > > index 69a066ef20c0..f1dafcfd4eae 100644
> > > --- a/drivers/gpu/drm/xe/xe_sriov.c
> > > +++ b/drivers/gpu/drm/xe/xe_sriov.c
> > > @@ -3,6 +3,8 @@
> > >   * Copyright © 2023 Intel Corporation
> > >   */
> > >  
> > > +#include <linux/fault-inject.h>
> > > +
> > >  #include <drm/drm_managed.h>
> > >  
> > >  #include "regs/xe_regs.h"
> > > @@ -91,6 +93,12 @@ static void fini_sriov(struct drm_device *drm, void *arg)
> > >  	xe->sriov.wq = NULL;
> > >  }
> > >  
> > > +static noinline int fault_inject_sriov_init(void)
> > > +{
> > > +	return 0;
> > > +}
> > > +ALLOW_ERROR_INJECTION(fault_inject_sriov_init, ERRNO);
> > > +
> > >  /**
> > >   * xe_sriov_init - Initialize SR-IOV specific data.
> > >   * @xe: the &xe_device to initialize
> > > @@ -102,11 +110,16 @@ static void fini_sriov(struct drm_device *drm, void *arg)
> > >   */
> > >  int xe_sriov_init(struct xe_device *xe)
> > >  {
> > > +	int err = fault_inject_sriov_init();
> > > +
> > > +	if (err)
> > > +		return err;
> > > +
> > >  	if (!IS_SRIOV(xe))
> > >  		return 0;
> > >  
> > >  	if (IS_SRIOV_PF(xe)) {
> > > -		int err = xe_sriov_pf_init_early(xe);
> > > +		err = xe_sriov_pf_init_early(xe);
> > >  
> > >  		if (err)
> > >  			return err;
> > > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> > > index dda5268507d8..c82b4278c03e 100644
> > > --- a/drivers/gpu/drm/xe/xe_tile.c
> > > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > > @@ -3,6 +3,8 @@
> > >   * Copyright © 2023 Intel Corporation
> > >   */
> > >  
> > > +#include <linux/fault-inject.h>
> > > +
> > >  #include <drm/drm_managed.h>
> > >  
> > >  #include "xe_device.h"
> > > @@ -99,6 +101,12 @@ static int xe_tile_alloc(struct xe_tile *tile)
> > >  	return 0;
> > >  }
> > >  
> > > +static noinline int fault_inject_tile_init_early(void)
> > > +{
> > > +	return 0;
> > > +}
> > > +ALLOW_ERROR_INJECTION(fault_inject_tile_init_early, ERRNO);
> > > +
> > >  /**
> > >   * xe_tile_init_early - Initialize the tile and primary GT
> > >   * @tile: Tile to initialize
> > > @@ -114,6 +122,10 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
> > >  {
> > >  	int err;
> > >  
> > > +	err = fault_inject_tile_init_early();
> > > +	if (err)
> > > +		return err;
> > > +
> > >  	tile->xe = xe;
> > >  	tile->id = id;
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> > > index eab9456e051f..8fff0fd7c675 100644
> > > --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> > > +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> > > @@ -4,6 +4,7 @@
> > >   */
> > >  
> > >  #include <linux/bitfield.h>
> > > +#include <linux/fault-inject.h>
> > >  #include <linux/firmware.h>
> > >  
> > >  #include <drm/drm_managed.h>
> > > @@ -776,11 +777,21 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32
> > >  	return err;
> > >  }
> > >  
> > > +static noinline int fault_inject_uc_fw_init(void)
> > > +{
> > > +	return 0;
> > > +}
> > > +ALLOW_ERROR_INJECTION(fault_inject_uc_fw_init, ERRNO);
> > > +
> > >  int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> > >  {
> > >  	const struct firmware *fw = NULL;
> > >  	int err;
> > >  
> > > +	err = fault_inject_uc_fw_init();
> > > +	if (err)
> > > +		return err;
> > > +
> > >  	err = uc_fw_request(uc_fw, &fw);
> > >  	if (err)
> > >  		return err;
> > > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > > index 22c148b1e996..121443b790bf 100644
> > > --- a/drivers/gpu/drm/xe/xe_wa.c
> > > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > > @@ -8,6 +8,7 @@
> > >  #include <drm/drm_managed.h>
> > >  #include <kunit/visibility.h>
> > >  #include <linux/compiler_types.h>
> > > +#include <linux/fault-inject.h>
> > >  
> > >  #include <generated/xe_wa_oob.h>
> > >  
> > > @@ -818,6 +819,12 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
> > >  	xe_rtp_process_to_sr(&ctx, lrc_was, &hwe->reg_lrc);
> > >  }
> > >  
> > > +static noinline int fault_inject_wa_init(void)
> > > +{
> > > +	return 0;
> > > +}
> > > +ALLOW_ERROR_INJECTION(fault_inject_wa_init, ERRNO);
> > > +
> > >  /**
> > >   * xe_wa_init - initialize gt with workaround bookkeeping
> > >   * @gt: GT instance to initialize
> > > @@ -829,6 +836,11 @@ int xe_wa_init(struct xe_gt *gt)
> > >  	struct xe_device *xe = gt_to_xe(gt);
> > >  	size_t n_oob, n_lrc, n_engine, n_gt, total;
> > >  	unsigned long *p;
> > > +	int err;
> > > +
> > > +	err = fault_inject_wa_init();
> > > +	if (err)
> > > +		return err;
> > >  
> > >  	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
> > >  	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
> > > diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> > > index 93c82825d896..88a201122a22 100644
> > > --- a/drivers/gpu/drm/xe/xe_wopcm.c
> > > +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> > > @@ -5,6 +5,8 @@
> > >  
> > >  #include "xe_wopcm.h"
> > >  
> > > +#include <linux/fault-inject.h>
> > > +
> > >  #include "regs/xe_guc_regs.h"
> > >  #include "xe_device.h"
> > >  #include "xe_force_wake.h"
> > > @@ -268,3 +270,4 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
> > >  
> > >  	return ret;
> > >  }
> > > +ALLOW_ERROR_INJECTION(xe_wopcm_init, ERRNO);
> > > -- 
> > > 2.43.0
> > > 
