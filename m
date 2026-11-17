Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899B1606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 18:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i9Tg7X0U;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=S6DxrRt8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E13410E623;
	Tue, 17 Nov 2026 18:16:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBA310E623
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 18:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794939390; x=1826475390;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=tXErqUdmqsSD7IZKiUZIPmK02GqSnzJH1n/dZqkmD+Q=;
 b=i9Tg7X0U3T3EPbd87XhJmafphKF1o1usxCFn+UGJP9WXn9OV9q3I8pYI
 kGVr/xjH+yJNNX6rUCqEMrwq7CBOs23pMnyWHfAorSSA2ez3D/RYWhKGf
 W+vJ47eqNZw50AwBLQETIS61ibB4qUi7fFJn2WhpyWpcoX3KbDOC9cbHE
 zek1YhwydZNuz0VacUIaUZ/p4OoKxVRoso16ZtubOMS1zg39fVoHRFf3e
 9jc3j1xMGNo+wzbuaLTx5DgJcSPmXymZbyPqwIuX4MCGO5eC07mX5uM7C
 2okxJEk+d4Zea9wBhBAuSKPni928rA50RmpKab9uh0whqhbc9JxCU88th A==;
X-CSE-ConnectionGUID: dNjYZSvPSv2RwIzR7DnVUQ==
X-CSE-MsgGUID: vKfHHHieQFuafsFGGG37Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3614586"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3614586"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 10:16:30 -0800
X-CSE-ConnectionGUID: n8ER8pELT9KninjoQ7ukAw==
X-CSE-MsgGUID: 9dG6/+caQwWqVSwYYYVEJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9801453"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 10:16:29 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 10:16:28 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 17 Nov 2026 10:16:28 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 10:16:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PcFEKjnc7aUys2+Zkuzvo9gbduYHOkY8MM6NO6dt7IwWt1cKLe/n+OeSxKMh6/xdS3boQ4NofqTNvCo7yGG9KwixldnXr+alO06Db4Sl13LNyex5J2lLnHOMgN0hKxTep6c3eJLGUw09XY5zsTVlmqmV7RvOimcf7ZOxGbZkcR6Xm636Z2ItCQdxJyCmyqkYlEwueSVFn9/qfzok40fJHvb+4wjfbfC9fNWeMEW12gHM11AyxXD9a5LSjC2TFbqT02R15JFZ8fZQ95oCaBH/s+/TOFmTz5q183CTCa3l9NCLyrR1qS+36Lnt80mJrhSSb1wP19/3iPEiBWmW4q06Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+tfbG1RvByWEVArsU1YtzWtLSlFN3/53WDjFxgLV/I=;
 b=VyNbEyZ2gW9uW/k2yAUkx+cHiD0cACnxUW8/hpStsz3lWxHjkQ5W9XOgDfMj20tni9OqmqgQTfTF+DL4C79oY+4ES6mgOH5a2xYuAaca7kntkFHrvjgtkzEiF3lHS0zJr5u5IFXg6oO4pEYlxk8Hcg1oifnvTfyKvz7yAeQ4uYnIvV92Zkf/GZSoOKjUNcjv88c9iyfiVz2s3Hd5iZCdwYi2nAXLj+VFH8N48bgfE1otnPCq74ZaJ39ebvLVx61BJ94nmVus/JVicUuiMKrS04SroA5XBcIIzK/jGXrzDHyMdZxCu+toBp5Ysm/3cLFw1P58cc6V66+qEja+lcIrRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+tfbG1RvByWEVArsU1YtzWtLSlFN3/53WDjFxgLV/I=;
 b=S6DxrRt80jgDcvgS2LnwHyKd/WpKwxbiGrgBqF3GThkKuEB2dH8o9Gtiwvu6Q2R83XxGeJoIESN0xttNBVIjOaL77knmLRuHyz1qCIXgQ7P0cgz2yHddiTYgHRpc8BLS1GchDnwlsDlMvd14R21xtjFxuSUGV/7r1OXJC2cpSbg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB6491.namprd11.prod.outlook.com (2603:10b6:208:3a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Tue, 17 Nov
 2026 18:16:24 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 18:16:24 +0000
Date: Tue, 17 Nov 2026 10:16:22 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 drm/xe/lrc: Fix math in LRC offset comments
Message-ID: <20261117181622.GE6134@mdroper-desk1>
References: <20261116225052.1167601-2-matthew.d.roper@intel.com>
 <179492074958.36785.17516419969049412166@9ac1b63fe3ea>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179492074958.36785.17516419969049412166@9ac1b63fe3ea>
X-ClientProxiedBy: SJ0PR13CA0180.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB6491:EE_
X-MS-Office365-Filtering-Correlation-Id: 78392b7e-aa40-4d48-b0c8-08df44d6e364
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|261026130827099003|261022105027099003|4143699003|11063799006|5023799004|56012099006|261021123027099003|261009223327099003|261009221227099003|261021121427099003|10067099003|261021130227099003|261009220027099003|261021135927099003|261021133027099003|261102123227099003|261009221727099003|261026140227099003|261009223027099003|261026121527099003|261022113327099003|261026135527099003|261022075727099003|261022115727099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 6PLcYr5KNXUAk9hwIMlRqkxpax8yWRcd4wIA6ZCRv5pSMkZ3c8V2iheOSM8/puQeqpVZ7vqRnu/tzO/yXrcyCMnXEUGiPT0y3LwFzxZoZljNsvUGrAVXlOsQipTtnwiRJvMYZKtgqHkOQ6kAM1nLWIEEUIeSdW08azB/31OiRGdYT2H1QPXKQWwBAY7BP5rf67yPq6+DHHLG25orpuJdqr97/bBkfLPKEScyAn5TuJum/Epf41GfN38ZUWXukLK2Q4ZLH8QIM1xyZWCjrvb1RD9s1gWIHPHHxaVZDWDUg7SGBByakZ7J+LQoH2yn/YxJhv9VO57NUUWtco3DAKGugIEZFrqXp7Z9B1AloF8WVknp/mb9NY43c4PSzRUE742JgGTsBsEM3qD9Mqn4gOfA2GAydVXvHdCk+bm5utWD+ML+pdQ0ilw4BjWgpekILv7QNsYDFS7DSSrrM9TrmeiSGw+9+S14ck+fmgI0GhY4WqGx/rQAlkFhEwYScAIZfO+nhp9J6UcbL4GPxLjh3XXa7N+dCzNE5j04X2s6IXIYw7bhs8VV7GnKirepHXPQ43iq1UT1kvp8xAJVh7F8aOwhcfvZss703+CVShuOmcDCezE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(261026130827099003)(261022105027099003)(4143699003)(11063799006)(5023799004)(56012099006)(261021123027099003)(261009223327099003)(261009221227099003)(261021121427099003)(10067099003)(261021130227099003)(261009220027099003)(261021135927099003)(261021133027099003)(261102123227099003)(261009221727099003)(261026140227099003)(261009223027099003)(261026121527099003)(261022113327099003)(261026135527099003)(261022075727099003)(261022115727099003)(261028144727099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m+5Bbsqe75Jr7+4+uDvr4qJCN7Bn4tq30rcBMppfDKH/kOcilwgdvEyE9xgS?=
 =?us-ascii?Q?odPW+JEoOnPNj88602P9wjnQjqbmIs8A/yKs4BjqCrLIW0sGV6MPW+CPUPPJ?=
 =?us-ascii?Q?RJuxkpprqgnFPYhX+QVU3fWosDv2tA53f11mAwlADOvszD9GEzQ6L8skJgnQ?=
 =?us-ascii?Q?vhRUI++GdRUuRi2XaLQwKfJbs4j91xbQnO/bzWJCdjJHE8R6A1YBE63jrV6A?=
 =?us-ascii?Q?kpdg1iZitQuIuEsApltc+hl8YKxwn/Cxj0h9FEGZMbz12W6zEzpxItK0jxOc?=
 =?us-ascii?Q?HGO3BLuOso4pFYJKmLRGUh3soVOpGh7hR1CpCuJLc4oQY+7AIn8UWyO1cWZV?=
 =?us-ascii?Q?VerUK/zEgayHECteaVSwht5YKX9H65zJNfivAp14NcROTjLT9QSpg0VtAMTT?=
 =?us-ascii?Q?phQacMtl3GjJjjsxm1fVCB3BQ4jXyZsfgd+Q6omjfO+TUmkqD4k3HHCC0o0l?=
 =?us-ascii?Q?CLj98sC8hEAuEWAfg0WJLzyI2JskBpVzsb2KX4ac+A1BvsHxyAHPfpbMWptm?=
 =?us-ascii?Q?6xjVCKPn34oG4Y14H7+Qx6e72TAXf9DG9we6G0qp8UI1fVQqxDk5PjOEKDwz?=
 =?us-ascii?Q?ZMnwz0DtVtJaG4Kd4p9zXN5tnWV9y/Mx1jjzsbLRkOPTiMzB8qw9KIFt1gVB?=
 =?us-ascii?Q?iU2gjoeksl8350PyExOU1q3hWkWIjZy00R4zpQvJY0jGkqL/xccKtgKItsZ/?=
 =?us-ascii?Q?Tnf33Wl7p+vVjsUnBJUblImBwepZ8V8cWirid4RTB7YlAIoPTYN6hBxJqcZI?=
 =?us-ascii?Q?f5y5q2lM3TPM/XCP8lCdZkwj44Tz7wn8eCXftCzZiPtodj8uG8uvi0MiAyZS?=
 =?us-ascii?Q?pStBltvKmzTCChnInK3ouGvMR8Lsu5YdrJO07GpKHKjIw6Q/p0f51sR9Yekc?=
 =?us-ascii?Q?qqW3BOPiKGSKFC5nPRNKjhYItYg+oEdJkRS9W16xuPHeebXwJe0kGeuMBXvy?=
 =?us-ascii?Q?dXGI2xKUShDy9xM1pVD7niLybkgblf9JvX0QJ1P68pKrnLecxZLFk4eKg4cj?=
 =?us-ascii?Q?FlnIHvl6zxoZ/XAsqF83Q4tfssb0GH9t+PjZ/v2dBvZDrpXIkW3b3zjIIdun?=
 =?us-ascii?Q?t2GGX2zrHdUOj+0RF3ie4yQVnpBh/k3LnYblh9VlcF5ia2PSvYduveI3QVLy?=
 =?us-ascii?Q?7UXL8O9SVNlGHfHEYe7CVrZWpP7A/ap5MXPA+DjfXf8mht44xJtIGgwyo/VY?=
 =?us-ascii?Q?88GYoDAQEboc/CXKqJ20Cuu/zZ4uP5mSQ+bY9tQAmQNlP18TGo/IuULuvyd2?=
 =?us-ascii?Q?mZmoT9x2IHDKLB9A+1diXKL5KoK3z0vXclfUSc8RGfZG7jEwTdTS8KYED6wA?=
 =?us-ascii?Q?J4EbHvdxTnn30IzAiox3W65o/Nek7kwiO1Xd2KQ5uCjl7XEuQCcUAdcfRcCp?=
 =?us-ascii?Q?k6RyhrWwEhLugBLroohifywOrulE2kmQwvgLghql7K9LDfvYMlSOvmrSJBqT?=
 =?us-ascii?Q?sPycbB9MbLH5bxFXPgoIBAihtncTMLKWku8aUPKK369r2l7BlTYR+VvTJMys?=
 =?us-ascii?Q?7Juq3gXoiPQnLopCmSYYG3Kl3oTLmNF4/l8r68iXyuXCHpF2hDpzoUXBKDYz?=
 =?us-ascii?Q?yqQxVHIhofaIbw65nPsA9XYA51SAJoKoEoRaOeYbT055WmifnodHP56iEXbA?=
 =?us-ascii?Q?9OWJoT6u+rAF9e6KLJ/y3SzdTMEUowzz526GewgTfxQrZBRZxrd6VQ2o5ecr?=
 =?us-ascii?Q?R6QyDGKxcdU/GLzJz9a9QwXc9BKKyyO3Z4ggIcdGr7k17krU8wA/E4ODuxOe?=
 =?us-ascii?Q?rgXi19kt4ZXJPPH3SVhMMIryXCFSG9c=3D?=
X-Exchange-RoutingPolicyChecked: HWYryt9qWmCyfFy4f1pCrNxEWZb5KK6wdiEyNtNqL6l2pD4KsxQO7xiykANKUpGmR1vma+BxLQweNs9kt0Aj8CSMYQYYBFeRto+L2HrIYtiWvX8raTpDkayeqII2XOhbu+MqLdmK3fhUzwxlXVD9g+Fs2T6BkKBH7AIJoRjV87tzpWoG0jpgmjsq+2m3+v81r/4N6KbYCzxbIsmn670rZ+lBebhQEBjDeMZ0XsTKw0X0NCAMEs9GmM1qQWYUqJrW0CmFOVy1p+rot+SYFj1NodCgQ2MaHJ/mGP00QuqFJeC6Q95F8LY9D/7HcRm7wdsS+9iKaBKKv0WlH0klQO2fMQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 78392b7e-aa40-4d48-b0c8-08df44d6e364
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 18:16:24.3063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O6sYw7PALct3lyck0g8AxwRCT2Bu3xbfZIKAieyvL1CAq7q0VYc9GWvrzmWsgduYSiwGIiXoClXvqHt29pFd8cyImvOWzW+VGn4rUl1/aW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6491
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 01:05:49PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/lrc: Fix math in LRC offset comments
> URL   : https://patchwork.freedesktop.org/series/178744/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda_FULL -> xe-pw-178744v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-178744v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-178744v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-178744v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_system_allocator@unaligned-alloc:
>     - shard-bmg:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda/shard-bmg-1/igt@xe_exec_system_allocator@unaligned-alloc.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-9/igt@xe_exec_system_allocator@unaligned-alloc.html

Unrelated; this patch was a comment change only with no code/functional
impact.

Applied to drm-xe-next.  Thanks Gustavo for the review.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-178744v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition:
>     - shard-ptl:          NOTRUN -> [SKIP][3] ([Intel XE#5947])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-2/igt@kms_atomic_transition@plane-all-modeset-transition.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>     - shard-ptl:          NOTRUN -> [SKIP][4] ([Intel XE#5901])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-ptl:          NOTRUN -> [SKIP][5] ([Intel XE#6925])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#7059] / [Intel XE#7085])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>     - shard-ptl:          NOTRUN -> [SKIP][7] ([Intel XE#5808]) +6 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-3/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +2 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#367])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:
>     - shard-ptl:          NOTRUN -> [SKIP][10] ([Intel XE#367]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-2/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
>     - shard-ptl:          NOTRUN -> [SKIP][11] ([Intel XE#5822]) +4 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-dp-1:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2652]) +7 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-dp-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [PASS][13] -> [INCOMPLETE][14] ([Intel XE#7084] / [Intel XE#8150])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][15] ([Intel XE#7084] / [Intel XE#8150])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2887])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - shard-ptl:          NOTRUN -> [SKIP][17] ([Intel XE#5824])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-6/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7358])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-2/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:
>     - shard-ptl:          NOTRUN -> [SKIP][19] ([Intel XE#8391])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html
> 
>   * igt@kms_chamelium_edid@dp-edid-resolution-list:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2252]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - shard-ptl:          NOTRUN -> [SKIP][21] ([Intel XE#2252]) +1 other test skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_chamelium_sharpness_filter@filter-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#6507] / [Intel XE#7358])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-2/igt@kms_chamelium_sharpness_filter@filter-basic.html
> 
>   * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#6969]) +7 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-2/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4.html
> 
>   * igt@kms_content_protection@atomic-dpms-hdcp14:
>     - shard-ptl:          NOTRUN -> [SKIP][24] ([Intel XE#7642])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-2/igt@kms_content_protection@atomic-dpms-hdcp14.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-1:
>     - shard-bmg:          NOTRUN -> [FAIL][25] ([Intel XE#3304])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-7/igt@kms_content_protection@srm@pipe-a-dp-1.html
> 
>   * igt@kms_content_protection@uevent@pipe-a-dp-1:
>     - shard-bmg:          NOTRUN -> [FAIL][26] ([Intel XE#6707] / [Intel XE#7439])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a-dp-1.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x32:
>     - shard-ptl:          NOTRUN -> [SKIP][27] ([Intel XE#5900]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-3/igt@kms_cursor_crc@cursor-offscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x32:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2320]) +2 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-2/igt@kms_cursor_crc@cursor-random-32x32.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-ptl:          NOTRUN -> [SKIP][29] ([Intel XE#5962])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-ptl:          NOTRUN -> [SKIP][30] ([Intel XE#5962] / [Intel XE#7343])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_dp_link_training@uhbr-sst-tbtalt-train:
>     - shard-ptl:          NOTRUN -> [SKIP][31] ([Intel XE#9537])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-6/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-ptl:          NOTRUN -> [SKIP][32] ([Intel XE#9009])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_dsc@dsc-basic-ultrajoiner:
>     - shard-ptl:          NOTRUN -> [SKIP][33] ([Intel XE#5907])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-3/igt@kms_dsc@dsc-basic-ultrajoiner.html
> 
>   * igt@kms_dsc@dsc-with-bpc:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#8265]) +1 other test skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-2/igt@kms_dsc@dsc-with-bpc.html
> 
>   * igt@kms_feature_discovery@hdr:
>     - shard-ptl:          NOTRUN -> [SKIP][35] ([Intel XE#9287])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-6/igt@kms_feature_discovery@hdr.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
>     - shard-ptl:          NOTRUN -> [SKIP][36] ([Intel XE#2316])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>     - shard-ptl:          [PASS][37] -> [FAIL][38] ([Intel XE#3321]) +1 other test fail
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda/shard-ptl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate-interruptible:
>     - shard-bmg:          [PASS][39] -> [FAIL][40] ([Intel XE#5408] / [Intel XE#6266])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda/shard-bmg-7/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-8/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2:
>     - shard-bmg:          NOTRUN -> [FAIL][41] ([Intel XE#5408] / [Intel XE#6266])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>     - shard-ptl:          NOTRUN -> [SKIP][42] ([Intel XE#7178])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-ptl:          NOTRUN -> [SKIP][44] ([Intel XE#5800] / [Intel XE#6312]) +5 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt:
>     - shard-ptl:          NOTRUN -> [SKIP][45] ([Intel XE#6312]) +2 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-6/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2311]) +10 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#4141]) +1 other test skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
>     - shard-ptl:          NOTRUN -> [SKIP][48] ([Intel XE#5812]) +34 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-fullscreen:
>     - shard-ptl:          NOTRUN -> [SKIP][49] ([Intel XE#7865]) +6 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:
>     - shard-ptl:          NOTRUN -> [SKIP][50] ([Intel XE#7061]) +1 other test skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-6/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#7061])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-2/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2350] / [Intel XE#7503])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
>     - shard-ptl:          NOTRUN -> [SKIP][53] ([Intel XE#7061] / [Intel XE#7356])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-6/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2313]) +11 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [PASS][55] -> [SKIP][56] ([Intel XE#1503])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_hdr@static-swap:
>     - shard-ptl:          NOTRUN -> [SKIP][57] ([Intel XE#5917] / [Intel XE#6174])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-3/igt@kms_hdr@static-swap.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#7283]) +1 other test skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html
> 
>   * igt@kms_plane@pixel-format-x-tiled-modifier:
>     - shard-ptl:          NOTRUN -> [SKIP][59] ([Intel XE#7283]) +3 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-2/igt@kms_plane@pixel-format-x-tiled-modifier.html
> 
>   * igt@kms_plane_lowres@tiling-4:
>     - shard-ptl:          NOTRUN -> [SKIP][60] ([Intel XE#5844]) +4 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-6/igt@kms_plane_lowres@tiling-4.html
> 
>   * igt@kms_plane_multiple@tiling-x:
>     - shard-ptl:          NOTRUN -> [SKIP][61] ([Intel XE#5020])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-2/igt@kms_plane_multiple@tiling-x.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#1489])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
>     - shard-ptl:          NOTRUN -> [SKIP][63] ([Intel XE#7304])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2387] / [Intel XE#7429])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-pr-suspend:
>     - shard-ptl:          NOTRUN -> [SKIP][65] ([Intel XE#1406])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-2/igt@kms_psr@fbc-pr-suspend.html
> 
>   * igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:
>     - shard-ptl:          NOTRUN -> [SKIP][66] ([Intel XE#1406] / [Intel XE#5835]) +1 other test skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-3/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html
> 
>   * igt@kms_psr@psr2-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2234] / [Intel XE#2850])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-2/igt@kms_psr@psr2-basic.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-ptl:          NOTRUN -> [SKIP][68] ([Intel XE#5910])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-3/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#6503])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-ptl:          NOTRUN -> [SKIP][70] ([Intel XE#5949] / [Intel XE#9277])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-2/igt@kms_vrr@negative-basic.html
> 
>   * igt@kms_vrr@seamless-rr-switch-drrs:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#1499] / [Intel XE#9271])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>   * igt@xe_evict@evict-beng-threads-small:
>     - shard-ptl:          NOTRUN -> [SKIP][72] ([Intel XE#5764]) +2 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-2/igt@xe_evict@evict-beng-threads-small.html
> 
>   * igt@xe_exec_balancer@once-cm-parallel-rebind:
>     - shard-ptl:          NOTRUN -> [SKIP][73] ([Intel XE#7482]) +5 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-2/igt@xe_exec_balancer@once-cm-parallel-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
>     - shard-ptl:          NOTRUN -> [SKIP][75] ([Intel XE#5575] / [Intel XE#7484]) +3 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-3/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-imm:
>     - shard-ptl:          NOTRUN -> [SKIP][76] ([Intel XE#8374]) +5 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-imm.html
> 
>   * igt@xe_exec_fault_mode@once-multi-queue-userptr-imm:
>     - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#8374])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-imm.html
> 
>   * igt@xe_exec_multi_queue@max-queues-preempt-mode-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#8364]) +2 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-2/igt@xe_exec_multi_queue@max-queues-preempt-mode-userptr-invalidate.html
> 
>   * igt@xe_exec_multi_queue@one-queue-preempt-mode-basic:
>     - shard-ptl:          NOTRUN -> [SKIP][79] ([Intel XE#8364]) +14 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-basic.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#8378]) +1 other test skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate:
>     - shard-ptl:          NOTRUN -> [SKIP][81] ([Intel XE#8378]) +2 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-2/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate.html
> 
>   * igt@xe_mempage_offline@inject-duplicate-page:
>     - shard-ptl:          NOTRUN -> [SKIP][82] ([Intel XE#9203])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-2/igt@xe_mempage_offline@inject-duplicate-page.html
> 
>   * igt@xe_multigpu_svm@mgpu-atomic-op-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#6964]) +1 other test skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-1/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html
> 
>   * igt@xe_page_reclaim@random:
>     - shard-ptl:          NOTRUN -> [SKIP][84] ([Intel XE#7793]) +1 other test skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-6/igt@xe_page_reclaim@random.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-ptl:          [PASS][85] -> [ABORT][86] ([Intel XE#9362]) +1 other test abort
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda/shard-ptl-6/igt@xe_pm@s4-basic.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-8/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze@gt0:
>     - shard-bmg:          [PASS][87] -> [FAIL][88] ([Intel XE#9254]) +1 other test fail
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt0.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html
> 
>   * igt@xe_prefetch_fault@l2-prefetch-fault:
>     - shard-ptl:          NOTRUN -> [SKIP][89] ([Intel XE#8815])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-2/igt@xe_prefetch_fault@l2-prefetch-fault.html
> 
>   * igt@xe_prefetch_fault@prefetch-fault:
>     - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#7599])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-2/igt@xe_prefetch_fault@prefetch-fault.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-edp-1:
>     - shard-ptl:          [FAIL][91] ([Intel XE#6078]) -> [PASS][92] +1 other test pass
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda/shard-ptl-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-edp-1.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-edp-1.html
> 
>   * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
>     - shard-ptl:          [FAIL][93] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][94] +1 other test pass
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda/shard-ptl-4/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-1/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
> 
>   * igt@xe_pm@s2idle-multiple-execs:
>     - shard-ptl:          [ABORT][95] ([Intel XE#9362]) -> [PASS][96] +1 other test pass
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda/shard-ptl-8/igt@xe_pm@s2idle-multiple-execs.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-ptl-6/igt@xe_pm@s2idle-multiple-execs.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-bmg:          [ABORT][97] ([Intel XE#9362]) -> [PASS][98]
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda/shard-bmg-8/igt@xe_pm@s4-exec-after.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-1/igt@xe_pm@s4-exec-after.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][99] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][100] ([Intel XE#2426] / [Intel XE#5848])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
>   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
>   [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
>   [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
>   [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
>   [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
>   [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
>   [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
>   [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
>   [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
>   [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
>   [Intel XE#5844]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5844
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
>   [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
>   [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
>   [Intel XE#5910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910
>   [Intel XE#5917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5917
>   [Intel XE#5947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5947
>   [Intel XE#5949]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5949
>   [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
>   [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
>   [Intel XE#6174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6174
>   [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
>   [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
>   [Intel XE#6925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
>   [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
>   [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
>   [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
>   [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
>   [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
>   [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
>   [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
>   [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
>   [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
>   [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
>   [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
>   [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
>   [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
>   [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
>   [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
>   [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
>   [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
>   [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
>   [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
>   [Intel XE#8815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815
>   [Intel XE#9009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009
>   [Intel XE#9203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203
>   [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
>   [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
>   [Intel XE#9277]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277
>   [Intel XE#9287]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9287
>   [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
>   [Intel XE#9537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9537
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda -> xe-pw-178744v1
> 
>   IGT_9195: 9195
>   xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda: ccb10a534282f16c6d068bc06e5c722680045dda
>   xe-pw-178744v1: 178744v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178744v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
