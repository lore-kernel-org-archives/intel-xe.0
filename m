Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87760606A331
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 15:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B6dkbLmL;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Z3RQuEA8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430E010E53A;
	Fri, 13 Nov 2026 15:33:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01FB10EC31
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 15:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794583972; x=1826119972;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=98uq49W0QWILZ94xkZM5nNhfC8SHTfeZQVwXZBS004o=;
 b=B6dkbLmLJmj8S3y3zjZZ/kuJ4wWQNrD8fRZ7fJMx/vOPf+FgiCcEY/KC
 cD8YEJGcKGIzBoe7GCNfJ6A6W87VBdFvf0e6LJlJeqpxnjjspBAZirCZt
 poyBEkfdKl6aFAo9rBmrAuRreVwdRZtajRwQQhPRrye2tqnVPvBekmExg
 sj2fef2OWF4M2Z+cbMYtCDWf/PW8GmEKuOHWJmM9Fppl3Rnnhtp/KsVSV
 eaTFSU2Vcyl3ElziX1w/PhyguBU2au8OZAofhRWNjF5g/lt/URdn6BwE4
 NavrAQUO6YMqp0rjPHTVFF2Vg5gXjgiSXqDRRQOKvjU1Ix2cNvX01YtIM Q==;
X-CSE-ConnectionGUID: RNWko7fXRWOxB48tJTwciw==
X-CSE-MsgGUID: UdLSctbySnGZ1zZITw4lWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3405647"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3405647"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 07:32:51 -0800
X-CSE-ConnectionGUID: 7Fq8SXYERgaO7RBHOSmCvw==
X-CSE-MsgGUID: JyhUzwANTY2GMfoZevbHqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9048575"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 07:32:51 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 07:32:50 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 13 Nov 2026 07:32:50 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.8) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 07:32:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnZd0D91fyssRlAbn6meIwGfc/uQPIhQDFYm4yqhLhPELA1oZ9DkgFuuqDASJCQ8TXsIy0sN3P+FFtnE8/QN59UgkU0bbktfBXcQ1T3vBrLQyVbqM2pX+cLw7CSjZDMv8QxSlGwQkalLWN72Sb5+78gQguGUe9VKW/eVTqE3GKaeKHXqs18nZQ6ozEqYMkwe27Dnxh6L9F9VOoxzbc5rPMjt0oQkuOathqfH3zckwJX6rU3lWYyQ4+U8s+fpSXIRluDIMzQzNXdQO9NOiK2ZmCzGrs7OAJc++8ZNMsxOa1scxhM/SUB5aDspfWwH/zirT9gwH0dZede5AVoF2bU/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdPf/L26EMZS6rTpb+0FiBIEjwKXg4TxvWY+yilxvJU=;
 b=CY/c3FFBldLvD7iHkb0OsKimx//YqwIl7/ILqcFCF+aeyrjnmHJTM3X+blbgYwbb6FcaAjh2rLPSWG893hzInElc/AtM7/sQoEGbrf9fUFffPZ6naIjEe4m+1n/wt5Klllk6b4HVtXxBIOCssn0UJi5N6XMkGHlqHDbw2eU4JvqdFVNigCxS0EaC8XX68aQyiCv+FJnXxt+GbsdU9JW8OVrJPgd7hejuLUtItpHw2I+WL3NVth6uf1Qq5eJA5BKPbbrz2jamH1ShYP2v3Up6+5uiwFnp62wGke7y6HYoRyVuTUnFZ64bIWqm4uJKo72O0OXJHw/umAJY8y/YIgWYsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdPf/L26EMZS6rTpb+0FiBIEjwKXg4TxvWY+yilxvJU=;
 b=Z3RQuEA8p5J98SL9PvxhnH/wYSZvWQaYefgasYToAbIfQNfvsNUTswTXc2DHCnrWuVUgFqbzarWylETE4r0jQr1M59AO9YndNqwfu0a+1oCkpkqfQOi1cdYa6whrRWCX2ewi73RPmvCF3+FbNtSC8U/WOUGAuN5XtB+892pGo8o=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by SJ5PPF6E07EBAE7.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::832) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 15:30:17 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0615.008; Fri, 13 Nov 2026
 15:30:16 +0000
Date: Fri, 13 Nov 2026 07:30:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/ttm, drm/xe: Drop the ttm_tt on null moves to VRAM
Message-ID: <avctByO+qRX9FQ+l@gsse-cloud1.jf.intel.com>
References: <20261107-oom-fun-v1-0-be9eb05b82ed@intel.com>
 <20261107-oom-fun-v1-3-be9eb05b82ed@intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261107-oom-fun-v1-3-be9eb05b82ed@intel.com>
X-ClientProxiedBy: MW3PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:303:2b::13) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|SJ5PPF6E07EBAE7:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f103399-4e1d-4e72-99c9-08df419b04e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|10067099003|4143699003|11063799006|56012099006|261026140227099003|261022105027099003|261026121527099003|261028144727099003|261021121427099003|261021123027099003|261102130727099003|261102123227099003|261009223027099003|261009221227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: HEnddCV6v36jVgbdAYV9GYbeD+x3s6kY9f45l1z0dHccQ9+tQp/ZrI74AxyeMg7a0ci9BYMUKUX5fQDQwHW7lO6589E61VPNbfP0SbCznD+o64Fbzfef2gO8Um5qmUfYdnNrgkZSHNKKf9DVYIBndohd2rk7z9d5uaqRC8JXznvwBHn8mzv8qeJqyf6VmrF+zXGC6MFgPkX8cN7KeRQQW2DEpO+hPPNz0y5n99hk4MGWHNGdW3py48QBoPYi5Au7ro7oLn7WVvGaQngOpxSrm0xayX8GBfqGo9/IjEx02SX94OXDwbFw8RXQJcqYdeRCtj3x/ZLScVXTERNNhHjwqDIlr2nZYQBHmQriLRRIHGN1r070cnpI4efZ5y1rSfz0Bv4ygfAMSm8Ty+4VvVdvvqHkkfYyejtxSKrnJLFMmGBweZGUyWxZ9jx0u4r8U6xwauPOZXXoTsONoDbw/liHUyNVtWROafbc9B91gro49umudpuRrRHZsTc7U09IpzzZmbH+lWVTWrm6OL9IUfvew7lDMbhnP93rAeKIasJNIceyBneAn+A4fAv/sAzzsHtSvOVDTUgO5Oze4CQs0Zf2KwBQ512nlkCio3u1MZyM/et5D3NO3av/30biKO7qVzTKgscHD32QPdjrDET50JkH9p5EtutzPHhcZrD7nRITtmc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(261026140227099003)(261022105027099003)(261026121527099003)(261028144727099003)(261021121427099003)(261021123027099003)(261102130727099003)(261102123227099003)(261009223027099003)(261009221227099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0Yr3kPSI3tAokLCB7kqzAhfJPzoq0kMX+p4OVCBNUfzNLik9O+2OKobCvw?=
 =?iso-8859-1?Q?87KzQFDME09kvngXldfMC2OAwZYuOBJp1tg/AExDSYGxwxtdOOLASHqMqs?=
 =?iso-8859-1?Q?o7Ckf1H2U2xIBndZZC0fzDlXDaOEj2bdQ6+c7TMaygenu0GPO3TtdeK4Ge?=
 =?iso-8859-1?Q?jKUvIZUsPlIb14U8RxIfwkq2Z047uaWCZmrIkueDze9B5vzXCZlj+gfPO9?=
 =?iso-8859-1?Q?InOMQgXHqprfydBhA+lSjvWPAy6wz2Grwv8RiZuarvIV4QYQD6nqY2j0eq?=
 =?iso-8859-1?Q?ia3PE6jWBkcHZBzuryljFq3IhhH04mKOAcVqslDe3KXNendiHChsZ7GR6h?=
 =?iso-8859-1?Q?hQtOxZqU7ZijRXGmhduDVS2y05T+SHaP5p4dvI4GeRJkBQzJIjnScwZsSI?=
 =?iso-8859-1?Q?w37FeXjV72kTZzRwgVjqvItt0uOp8jtJSD3oUnpBDxklIOKjmiCwr+0yPl?=
 =?iso-8859-1?Q?P21u0kq29kpfYGhQSRKc1jfxq/u62nkv7nkjymGOXbnlk5hD5OWwfD3h3B?=
 =?iso-8859-1?Q?9BnJZVC8l+kdzUlCHK3xw/fox1bW4fJVpif1qObzkegg5udcQVc0TEfDPG?=
 =?iso-8859-1?Q?hWiENPbS2kCpggRpQ7ysKqMuiyOsEsWopdga++R78alyXZ6Uh2F4hta8kL?=
 =?iso-8859-1?Q?7EVuxPdpNpcUM4ZJZo0MiKz3oWCPobBbuWQa+TJObSmZaf5ECGtSl/qGyH?=
 =?iso-8859-1?Q?iV3Zf2Qbb2WZ2MolhKOwpPdDw8xEA+ngxOhgNP+tn8D+j1R//ecHO3eXt+?=
 =?iso-8859-1?Q?6pd8vpGXilXyLH3Usox+LCthgd4ZHfg7JCVvHwsDSmnOYIac4q8E7j67UT?=
 =?iso-8859-1?Q?xbSolWwJzqaQfgE8vwIDyH7VOu/hKjApgp63nzOy2QG56HyHa2mVQoKKbT?=
 =?iso-8859-1?Q?wXdpVmt5x6H5hq6jLnQNzYnSRi18cEK8M1BO/oGEXQgPPdJsdKFdtoq8ry?=
 =?iso-8859-1?Q?XIlgpuydfq5k6OZ9uRXKVCiGokNo0fra0wCqxrL5yTo+AUyVWhWiolrsIX?=
 =?iso-8859-1?Q?JCfmz7U6uc0Ek8gEz1TmI6LrHj+HUhnpvO1Agny+t5a96idUGrxKPE5bLb?=
 =?iso-8859-1?Q?L61Dn96R2+B87qRSxLUk3JRCGWj2OZCvEpGJ/Nayi/B6LrmoqEodWw+75r?=
 =?iso-8859-1?Q?5efJO0CO6kR4oiA9/az0Bbd9Fzk8/jvr9NiFKfJv15gHc/qPavGXORhVmO?=
 =?iso-8859-1?Q?M1qyS/p9Bftu42Tj993qS6filxfzVA4wMg5U8W49JY9nbauRJsaMR667uD?=
 =?iso-8859-1?Q?TRi8lBsVLqWrizzhTUE/004rvFxSXn5w4vHtYSbvYG2gKHjQMWvhn1AXnf?=
 =?iso-8859-1?Q?U5qCDBC+IxUATuUAWX1W2tkuj15gudNWKRW41qOc70U7IOovn7Xgronz8t?=
 =?iso-8859-1?Q?BroXd418jEkdLSky7sCG8hXF6/eE132ElVk9Crp0hYVsKLEUeNSFWz2lFW?=
 =?iso-8859-1?Q?tybZNn3t8mY3qyyJ2X5fTms4D7LwBh2zYqo5u7WR9N5+OMWdEGEayPQfy8?=
 =?iso-8859-1?Q?kLcm0F7Yl06D6i5JcofHnK4j7UDuxBGXaZSlR56j51kfOxsav7OoyrFOjA?=
 =?iso-8859-1?Q?bBMrhiiFNF0AeBOX/6Pq4RszgIN4wq2e543S+n4Lq+53q5Bg0SIinIbXUg?=
 =?iso-8859-1?Q?IGBxo0+Jbp+y7nCfdUtv1myUb+yDS5ltuYhLT4l1SAMltBK70TEz8hfqzC?=
 =?iso-8859-1?Q?/NiqGv0e89nuFXDj0p5k248xZLNC5gAUbDcmqsyyi7PXy6okwdvifd3qf4?=
 =?iso-8859-1?Q?W8fLOBy6E9HBri5K7b1zy21/TpoN3BFBUng8o7WXCFnSJVr7yTHxE5w0Xx?=
 =?iso-8859-1?Q?ydnB3PpAUw=3D=3D?=
X-Exchange-RoutingPolicyChecked: hdyQ5VKKfcURFT1TRFcbS4nEXd67A/9eU3Wc/2yXHg4CMiDdYYGBVFDbpwQIadIEzcvEu5DnHxhEr8snMNOELEPtl7A95fmzId4fsWLq8DulDomy0jUGq5jnlRbjtMH4Nvsq0pfbG9J2U+KIXtE6mto5L5PqtE2I4JgcBJjg3I4+m3gdrgwJH/BETIqrxcjHTgr9VfM5C558Z0tP/dIhXJqjzmqDCxMfqxHwmiaQDq+HIfk3i2qFl+i2rhzb/9Bs5NReMHrNlXPIh3VxoJUl/k//GhQ1Xw08or3zVUvVMhO25zk1HlulrPCDhiV18wZ64p5Hm4MD4CpDoxpkyvWoMg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f103399-4e1d-4e72-99c9-08df419b04e3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 15:30:16.9351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AK7tprwMUnEa6BksSy1VgI6emHG1ceRzcVKkd0Esva2rNtuaJLyNJlx8CWehT710ohexEjmS7fHpYA3P9jkfFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6E07EBAE7
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 07, 2026 at 05:26:52PM +0000, Matthew Auld wrote:
> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> A BO created with DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING starts in system
> placement with an unpopulated ttm_tt. Its initial move to VRAM has no
> source data and uses ttm_bo_move_null(), which unlike
> ttm_bo_move_accel_cleanup() leaves bo->ttm attached. If the VRAM BO is
> later exported, ttm_bo_setup_export() populates that stale ttm_tt,
> pinning unused, unshrinkable host pages equal to the BO size and
> potentially exhausting host RAM.
> 
> Add ttm_bo_move_null_drop_tt() to destroy the ttm_tt when moving to a
> manager that doesn't use one, and use it in xe_bo_move().
> 
> Fixes: 91494dee1091 ("xe: populate buffers before exporting them.")
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo_util.c | 20 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_bo.c        |  6 +++---
>  include/drm/ttm/ttm_bo.h          |  2 ++
>  3 files changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index f9458a4d5a09..0ab52be3a5f7 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -756,6 +756,26 @@ void ttm_bo_move_sync_cleanup(struct ttm_buffer_object *bo,
>  }
>  EXPORT_SYMBOL(ttm_bo_move_sync_cleanup);
>  
> +/**
> + * ttm_bo_move_null_drop_tt - assign memory without moving data, dropping the TT
> + * @bo: The buffer object.
> + * @new_mem: The memory to be assigned.
> + *
> + * Like ttm_bo_move_null(), but if the memory manager of @new_mem doesn't use
> + * a struct ttm_tt, also destroy @bo's ttm_tt, mimicking what
> + * ttm_bo_move_accel_cleanup() does. The caller must hold the bo's
> + * reservation, and the ttm_tt must not hold data that needs to be preserved.
> + */
> +void ttm_bo_move_null_drop_tt(struct ttm_buffer_object *bo,
> +			      struct ttm_resource *new_mem)
> +{
> +	if (!ttm_manager_type(bo->bdev, new_mem->mem_type)->use_tt)
> +		ttm_bo_tt_destroy(bo);

This is certainly right, as I have seen TT leak.

I do have question - should this just be built in ttm_bo_move_null?

IOW...

mbrost@gsse-cloud1:xe$ grep -n ttm_bo_move_null *.c
xe_bo.c:892:    ttm_bo_move_null(ttm_bo, new_res);
xe_bo.c:1110:                   ttm_bo_move_null(ttm_bo, new_mem);
xe_bo.c:1137:           ttm_bo_move_null(ttm_bo, new_mem);
xe_bo.c:1146:                   ttm_bo_move_null(ttm_bo, new_mem);
xe_bo.c:1163:           ttm_bo_move_null(ttm_bo, new_mem);
xe_bo.c:1173:           ttm_bo_move_null(ttm_bo, new_mem);
xe_bo.c:1195:                   ttm_bo_move_null(ttm_bo, new_mem);
xe_bo.c:1272:                   ttm_bo_move_null(ttm_bo, new_mem);
xe_bo.c:1283:           ttm_bo_move_null(ttm_bo, new_mem);
xe_bo.c:1340:           ttm_bo_move_null(bo, new_resource);

Why are some call sites in Xe in which use ttm_bo_move_null_drop_tt vs
ttm_bo_move_null?

Matt

> +
> +	ttm_bo_move_null(bo, new_mem);
> +}
> +EXPORT_SYMBOL(ttm_bo_move_null_drop_tt);
> +
>  /**
>   * ttm_bo_pipeline_gutting - purge the contents of a bo
>   * @bo: The buffer object
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 0181f73ef66d..6628db44951f 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1178,7 +1178,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	}
>  
>  	if ((move_lacks_source && !needs_clear)) {
> -		ttm_bo_move_null(ttm_bo, new_mem);
> +		ttm_bo_move_null_drop_tt(ttm_bo, new_mem);
>  		goto out;
>  	}
>  
> @@ -1313,7 +1313,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  						new_mem);
>  		if (ret) {
>  			dma_fence_wait(fence, false);
> -			ttm_bo_move_null(ttm_bo, new_mem);
> +			ttm_bo_move_null_drop_tt(ttm_bo, new_mem);
>  			ret = 0;
>  		}
>  	} else {
> @@ -1324,7 +1324,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  		 */
>  		dma_resv_add_fence(ttm_bo->base.resv, fence,
>  				   DMA_RESV_USAGE_KERNEL);
> -		ttm_bo_move_null(ttm_bo, new_mem);
> +		ttm_bo_move_null_drop_tt(ttm_bo, new_mem);
>  	}
>  
>  	/*
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 32791c4db2a9..123ef68bd849 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -480,6 +480,8 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
>  			      struct ttm_resource *new_mem);
>  void ttm_bo_move_sync_cleanup(struct ttm_buffer_object *bo,
>  			      struct ttm_resource *new_mem);
> +void ttm_bo_move_null_drop_tt(struct ttm_buffer_object *bo,
> +			      struct ttm_resource *new_mem);
>  int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo);
>  pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct ttm_resource *res,
>  		     pgprot_t tmp);
> 
> -- 
> 2.56.0
