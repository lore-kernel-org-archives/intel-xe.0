Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98767D5B86F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 21:48:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C5110E198;
	Mon, 15 Dec 2025 21:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cyhsd2tD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A0D10E198
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 21:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765835303; x=1797371303;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Bf0us3cz8oG4Hq4YG85s9vtuKp+oBPF5SFUWMW+krOU=;
 b=cyhsd2tDYNiyBhGNvlwPiVwYloc6WYIIU0pKYgYT1L7krKc6Zty7B474
 6MauD7eoY39tbtr9dUmQ7OLrKURtLTjDO0Q06f5ZiHD4qJsKK9Abd9h5Q
 8Ym0XdhpjBS1+1pFh1bnb6JCiN9wT9lo4krJ5bcZAtULFPgXvCs3EB/zA
 gZXXAwPKMen0a4pMizIi0/rbLQoMf4gBKJJH0Hjdktw+FvcdkT7pHSwsa
 3PlcM8dyqnFM3c1IxMHAKUnE7SP71WVo9+WNXK02zlCfOUVKw559oQBvr
 lD4LV8LmbHvKn14Q9xspVU7MTC43SGrp6PJrIX6TF91Bn8E1tFrDbTsg+ A==;
X-CSE-ConnectionGUID: SUS9LvliStKVDpOOJKYDkg==
X-CSE-MsgGUID: snOE8iKKSdu6abMOV2Nu5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78386709"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="78386709"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 13:48:23 -0800
X-CSE-ConnectionGUID: sDpSJEMkRpGjZ3/WMt0dwQ==
X-CSE-MsgGUID: Gk0RYn4wQuur7eW4XaW2PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="202752458"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 13:48:23 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 13:48:22 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 13:48:22 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 13:48:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PjB14xKgjWtskQkFimyv50Dog++f8QIfd3crP9+rlwibWRI5eBbQ0FiYBTNGJDijmYVukoJtazTr5t5S4f4H+9YG8IPy+jbGDlhevJfM5xP5MGWrtxiV5OuJ85hQu14CDldWs2m+DX4UMVrIHgW1n4VtaS6OhuZxy5MoMYE6pBmxN4uxJpcptgdPIHN/sNwI/M7uFfuHPJXn1ZokSozm7tCNJc4nFwzcy6cmYM1ptGZ5fA8qY4KmhSzfzvEk8Nthmf0AudiC2OK72TghQ4XmWMOev3F8MiF4YG8+sd8xe+J5pT91thURL5TsQxZyeCgqTCRAx0KSyuPuAmh2hafOAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBwFA/q06ZhbFixgyfZZ98QdJwaZ0d12aZd4r/HqytM=;
 b=HjZ2ZFabF5LBwR759xQW7tJ89QLKLC/I8YAvC/HlHuWbb6m/xFgiYK46R+ASUmVew0xi24n+0AHKBmlwVaDvxMETjHOwlN2WvZFccG0PXzGgGb6IFlcXCTjNtJ0zroXNepDNEwR3CBZ5mLzx3P9jPpOLyI1OLb94Qcnua7Yis6feJAY47nykvZAGi7HDleMH8R+C9/rzCkLHtfAdbLp/eFqjselVrx6wGjBj2Gn6oLU4I4QWHCFn0jeZUJm5fcLmfYNOV48AvUYg/tU2BAaYbvEJUtyi6rHHptPI1fE+quMlZXxVvAYCK8gHLV3IGSagFSjQaYDdZQQDxI2sG8/maw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8317.namprd11.prod.outlook.com (2603:10b6:806:38d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 21:48:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 21:48:19 +0000
Date: Mon, 15 Dec 2025 13:48:17 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <francois.dugast@intel.com>,
 <michal.mrozek@intel.com>
Subject: Re: [PATCH v2 1/7] drm/xe: Adjust long-running workload timeslices
 to reasonable values
Message-ID: <aUCCIVAhQs1sv1XB@lstrano-desk.jf.intel.com>
References: <20251212182847.1683222-1-matthew.brost@intel.com>
 <20251212182847.1683222-2-matthew.brost@intel.com>
 <86788bb40fabb2eee6cfe741514805d48d4e824f.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86788bb40fabb2eee6cfe741514805d48d4e824f.camel@linux.intel.com>
X-ClientProxiedBy: MW4P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: 217dc986-9abd-41e4-2c5e-08de3c23a96f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?6OJJ+IYi2P4aoC6+6goeWAzI5JmBPEHzFCOvfhAQqjJY0P//gAMTTfzLs3?=
 =?iso-8859-1?Q?fQWgiB+wmG6jDbBu7x3tJBxa/n160InhpoecaMg9cdDoKJNZfY3ZYOW1sp?=
 =?iso-8859-1?Q?EEBuVf5bcyVbNOQ4T+trm5rexxOZYv48J8Ddti2jq2wUJ9LK5GJIEvE+FO?=
 =?iso-8859-1?Q?j8wzttvUWofrcPSQ3B2pFRfrFRL/LBL57TcYVzvFKXCa9Uz5uNg0LnfVu+?=
 =?iso-8859-1?Q?84kvgLLqxl4R6YpK6/mHNsV8ViHFoRQgt3DPBIU9QE02bwZSB+jBxEy9us?=
 =?iso-8859-1?Q?ZHdXkCELFC/lCZh6cw4Do0hlVrIisPNkw/5YfzvFIW3owlPdrIj3+B0aCP?=
 =?iso-8859-1?Q?RatLWieltiDrgGgO51b3VzfVSKLF0PaPzegVTsRqWvudqaEqkC80yCkPbi?=
 =?iso-8859-1?Q?s7kl1jUyG2Y/nXnWkwCSiWr9ScNWzZ1OVkWLvR39d3WrWEC71XfY1c2xJu?=
 =?iso-8859-1?Q?o1nAKbQdzmLlDkkts2+Dm+71f1gLRwO6JLamYbSdNsN46vB4egpWNmMAKD?=
 =?iso-8859-1?Q?4v80c12mJYuKjnXiIDqgj3p9dS6KqTLZwBhnbbem12bh5xtbP1rASyJDxr?=
 =?iso-8859-1?Q?ZyMk9/OMHttwD2poKDLBa4SqEyXOA0vOrQ9JVGfVUQScChIAXA8CJp4hl7?=
 =?iso-8859-1?Q?GV78ae9mTP06QtW/xhZ7+5eORXqpOGKgjkgL6msf8b0Gk57xmke1ViTqRu?=
 =?iso-8859-1?Q?NQMBSHjVQKAWPYQa2aQe7EphefpeilQjdruNBEMTAtn3N9oEGDNI4Wyu0l?=
 =?iso-8859-1?Q?T8ZI+e7UhiMiwOmkKxXVhd3NCj1ywEMGA/EM3Kzmx+wyOJKKGo2n7hGRW4?=
 =?iso-8859-1?Q?iYWGHT+Mg1uniK50HeP+QmE4ScPGLAo3DQtg4taAeVem6BshOyaIAo/mlV?=
 =?iso-8859-1?Q?wKqdHUD5hoAKgHNvCXa4XKnd+TAPeE+U7bE7H2XFNtPAETOsPa4ip5U5fa?=
 =?iso-8859-1?Q?EkQI32Gbgh3xc8J/KmuzgeFIbm4M/1Kqoc6oic6OYn1UJyQwExj0qL06EZ?=
 =?iso-8859-1?Q?hKiwibl+z/bMCWX66NA8OfPgulvx10RzYsakepE8lhxBZLbGHuc134D4vx?=
 =?iso-8859-1?Q?vR8zHh037kXFM1UudiSx7xZRv3o19YWD3M43i3xC6rkU6sQ+aSF+Vbw1CF?=
 =?iso-8859-1?Q?q0eCRSAqxSSroE5PIj0G3R6vQwPQtAvS8SHfhdg0jDoIMUzOAgVpztbyj2?=
 =?iso-8859-1?Q?oKcdvhovd2FXPi8RprJwqTyCKP22KF6G6tgklLNClacl6eonsUYxkDlXAm?=
 =?iso-8859-1?Q?DPCXXG2A+2Dwv+rKMT1ASzbIwBKnihWzRWDQ/4cUx+ZAWX+TUo1oXuISli?=
 =?iso-8859-1?Q?8jdxsAVUpDfEwdko8pv29HHD1QbUr20Q3CgqtDax9teYfipFvAQ1tjXXXO?=
 =?iso-8859-1?Q?5ROLNFkvT6gxdGE6VpRU7ioJI/Cmb1DRtnQ7vcomcT0dtPDFzTATRjQ+Il?=
 =?iso-8859-1?Q?+AiNFwlrGAZuy9jxRgND3HgBqfLe1aNWqz6o+jwWGMXH7iXie7SMeXHANE?=
 =?iso-8859-1?Q?sAb9+OANmsxQw3qtVk5jWP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DRMS6NZH1puuljnGO95903lJqMXdBTG/OLUf9MUOeVxsVQM+bFE9iZO8Ut?=
 =?iso-8859-1?Q?gtMceQ9jQCgHztV7Id9vAq/+WcD3JcNjbQ0xcIg5oWFKAbnrUVuDLw9I0G?=
 =?iso-8859-1?Q?U+q1JpxnoVa6tF6157dCpCYsAgC93evGqXGJrBtHsGK9Tl3BnBamFCQQAq?=
 =?iso-8859-1?Q?JcEtFaNhkSMCqZ82HEpNxoTLsb5jujLmFDXpYPGDNezEokC2dWLW33m5V7?=
 =?iso-8859-1?Q?GSyX4sgmU/S2WfLSRySWXR+65c7i2PtGmyXqqk3KG3Pi4BpAVsNfn7RhmU?=
 =?iso-8859-1?Q?6yfyCWrOAQWpqgGE9HaYv3CN3biMVLLACL6RVDjFR6InC35FeY/ZCoW6Lp?=
 =?iso-8859-1?Q?Cbo8X2aAZHZnuL9mKu5K3vttGP5pmJbC5+yuBbt/jVzYVVln7n6HDmFE+M?=
 =?iso-8859-1?Q?mkl/s5d+pWKjXnzkTbJHVbZnz83dO+bIbA2uzDIJpJBksC/dBvK3cN6SdD?=
 =?iso-8859-1?Q?HLgWfXf/5Im3Y+T4kO/Wbo9FPmuE5lcsIy0dL7qkTIqfQFksQHEgn1Yomi?=
 =?iso-8859-1?Q?DZHwKvOJpWGtzHjR4jGWY0eVEYIPIOHDzx9MX07UZlShpSNKFzgboSLgQs?=
 =?iso-8859-1?Q?AnsEh/5G9cYpx37AvhJdFE2VOVY46mYEKjP5cJI8B8xRh3lGOojHyEENKn?=
 =?iso-8859-1?Q?MYbEZ9ototZR4fNLeIORyzBJ3aikuDv/Xt7EpXLePpdTgmISnEZ8zSh4Wx?=
 =?iso-8859-1?Q?g+Z7bPVOKZ55Trl+obzZrxM3Q8aO4n4kvWlhmRwFxeLUFU9x/iEAgsV52N?=
 =?iso-8859-1?Q?dkKXUHXSu2dY22DukCVzo1QWDTxxO0sviKjb+ucGW0xYItimls/g++zjCi?=
 =?iso-8859-1?Q?YhiOWRSDQv62y6P6RKc06SAKuODy8Fa7G4iWh3W0mfAsn8GfZWDjsbdxgT?=
 =?iso-8859-1?Q?p4Is9CTrYIJNI0tVWvfRQjIm5Mvzocb86eWeRw9jh/qBhjrTU1AWjo/FVM?=
 =?iso-8859-1?Q?m2k7JjY8c30bXBVTZFodCNgiL9leveWDdFoGDqpmpgD5xJLdkuQnC9q6oR?=
 =?iso-8859-1?Q?fjq54d/i9GOBHDElIU4PGSRAX71hVtciHHNJS1DltMWN0K96mI914gZQkz?=
 =?iso-8859-1?Q?kLUEsZl1GC2cKtPAbOswhS+GPfimHhAOdqG6BvMDJ4qcn58U0yrVeYh4fO?=
 =?iso-8859-1?Q?IUQ+NY9cbOZgIUWWekufVbYVruM80cPn5IuT6Qg48FeONmi0RgbFb0W8Ed?=
 =?iso-8859-1?Q?FU1gNbZdjfFhBrMziZ59s9rR8hTNW6tiklCz9yGLwtQOXc5Soag13IBpRA?=
 =?iso-8859-1?Q?rN3bXluuMcL3HcET6ECnVc3h+SkLHwL11lO22TmdrmbO1E60Pmx+8Ywx2T?=
 =?iso-8859-1?Q?WvcIcAPLNdTY+2Cw4hwl81JxZn+2CCwKULIOXGWAdbOv7BWj8JNWidxhXi?=
 =?iso-8859-1?Q?1/U04yuc9p0Q3J4I+f/PGNQKsg4XFc9KTCZjDNyrzxRt1yTleQ4YvNwUaJ?=
 =?iso-8859-1?Q?iMCTrlGLuF219QSjD2S3JJ8L4aDGEvyGg19RLtwQi8ehbexVxkrcXo+HnK?=
 =?iso-8859-1?Q?K7ZVET+VXwMPrRbm9KOywrrothv/ywAborddp19M5SDaTVFAlg+uze96F3?=
 =?iso-8859-1?Q?6tWu9k/temjA4yDclFPm1XZc71VKD0xjVzLViQasMe35VGhxjHUMd0HxhS?=
 =?iso-8859-1?Q?hq9gXWFOndStUK527qsT+nVmHpDuLeV9+l0xg4JsQjyzZHUcP+vJaeKA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 217dc986-9abd-41e4-2c5e-08de3c23a96f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 21:48:19.8905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uT/RO4SXysMYYEF2BDpSyNJbonZMV06dFkKcCpf2JHyOfCu9DcZVFM8MSrmOZmeF4McJurs7IImcIo/XuQ3kdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8317
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

On Mon, Dec 15, 2025 at 11:08:21AM +0100, Thomas Hellström wrote:
> On Fri, 2025-12-12 at 10:28 -0800, Matthew Brost wrote:
> > A 10ms timeslice for long-running workloads is far too long and
> > causes
> > significant jitter in benchmarks when the system is shared. Adjust
> > the
> > value to 5ms for preempt-fencing VMs, as the resume step there is
> > quite
> > costly as memory is moved around, and set it to zero for pagefault
> > VMs,
> > since switching back to pagefault mode after dma-fence mode is
> > relatively fast.
> > 
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
> > GPUs")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Please add a comment in the commit message explaining why the type was
> changed.
> 

Will do. I noticed s64 type which makes no sense at all when working on
this series, so fixed that part up too.

Matt

> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> 
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c       | 5 ++++-
> >  drivers/gpu/drm/xe/xe_vm_types.h | 2 +-
> >  2 files changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index c2012d20faa6..4648f8a458cf 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1508,7 +1508,10 @@ struct xe_vm *xe_vm_create(struct xe_device
> > *xe, u32 flags, struct xe_file *xef)
> >  	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
> >  
> >  	INIT_LIST_HEAD(&vm->preempt.exec_queues);
> > -	vm->preempt.min_run_period_ms = 10;	/* FIXME: Wire up to
> > uAPI */
> > +	if (flags & XE_VM_FLAG_FAULT_MODE)
> > +		vm->preempt.min_run_period_ms = 0;
> > +	else
> > +		vm->preempt.min_run_period_ms = 5;
> >  
> >  	for_each_tile(tile, xe, id)
> >  		xe_range_fence_tree_init(&vm->rftree[id]);
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 3bf912bfbdcc..18bad1dd08e6 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -263,7 +263,7 @@ struct xe_vm {
> >  		 * @min_run_period_ms: The minimum run period before
> > preempting
> >  		 * an engine again
> >  		 */
> > -		s64 min_run_period_ms;
> > +		unsigned int min_run_period_ms;
> >  		/** @exec_queues: list of exec queues attached to
> > this VM */
> >  		struct list_head exec_queues;
> >  		/** @num_exec_queues: number exec queues attached to
> > this VM */
> 
