Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1B9CAC583
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 12:40:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F3210E6F3;
	Tue,  9 Sep 2025 12:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sr63sRha";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E3310E6F3
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 12:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757421615; x=1788957615;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tvteovtZlfUNRHaZfPW8XDPNVHy3C7JdhW1JbteG4KM=;
 b=Sr63sRhagNnSAl1i917xlcPMOEB+IMwhUu1BkO+vpRuVjPPNYSFIkyOG
 yf7Y8hpySQHeK0KXxGsJ79319yWNethox7soyKnWgBM8bUCukUM9hVFIl
 61tE9ElrA+KLXk9+6++VauaGtKP4KCVaK0BuQRSyNg/YcwkZMtZ3zT67g
 D+/iV/EHI/FhCpkjFMfw++XbFNiNASQq2jfYruVulusk8LA+sCgWPDBQc
 KUZwsdOy1YuWxNRLdl119YaicyhBP7teD7Fkbm76YM6cN9NyCVL+tRe32
 4zjb4QHjcwolyK4sYFOvGCJVERIu25B9fXZ34xrCwrRsv+ErU9C2RD0ab Q==;
X-CSE-ConnectionGUID: ICHuSVt+REuAsk88pD/I5Q==
X-CSE-MsgGUID: wya+NSX6Rz2gtcD3HlguEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="47276504"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="47276504"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 05:40:15 -0700
X-CSE-ConnectionGUID: uu0lj38eQ7SIYcAC/Hpy+Q==
X-CSE-MsgGUID: O4HRX/0FQaeGlfYT2JP1oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="172993819"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 05:40:08 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 05:40:07 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 05:40:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.40)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 05:40:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZ/NRlI4yh4EI2M5mJeYFlt2aeYqTnCmKLQp1ziZTx3w4WX75gKM2ihcl24SjPwymsbL+Hecbq64sMIE8xVThr38/pbk35o2hoHhynup20pRRBUcM3phZSKafgI0ferAlrtZxLCzv+FUoUKKGuF4dwJ8PY5eBsamRp//4GAoQTVZNTsSDhOk/AzO0DoJAlvlJ+CzD8zi2/+c06yTc0apWIvlqyPpb/aXgpoL1fxp44iuyzjLszvngUhPzhlw2WKqrtrnFWKZ+z//H9M3tyypZfMbh91PoSCsKdPta0ZPN6jlgtFoBeO4/ONZc+rUsgmN5sa27/sPZlpREjNCJs5Miw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECL8fwQjKSEmjIiKbfSO5WcmiyhCnNqgBmbsxEFv+Bo=;
 b=QrrvIw6nVZ1CGzReW9D7tvSeHMcbWu6aHVMnvGGby1q3fk5HBbcUXKYU+m4lWpjgFCyuIO7dR+cGJCbc5IlJ0xP74xegGzfvH/Hi+CIiVvql+CB9D5cTQP4s8DYCM8R3M8CS2N+a/9RoFXfsaZYCtFoG7cg5osTqTyOMGeDRClf8e+J8IXfPh++xLwLXTwFixLEqQCjcfzlCJjFhz2VUm3TsBlPgLswwvU6ePFAPoPJT3lNsQLdd2LNY0gtH0tRTMYrg5/AhlRN4iHKXWoXjtuBNri/f1Tmx7DhVQPkUJ+ah2DvEoovEEWKwrhoRZLzRDSc6qdnCbY271IjXBtIKCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7385.namprd11.prod.outlook.com (2603:10b6:208:423::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 12:40:04 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 12:40:04 +0000
Date: Tue, 9 Sep 2025 07:40:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Bai,
 Zongyao" <zongyao.bai@intel.com>, "Lin, Shuicheng" <shuicheng.lin@intel.com>
Subject: Re: [PATCH] drm/xe/xe_device_sysfs: add cleanup action in
 xe_device_sysfs_init
Message-ID: <3tkvzv7krbeuofuew44zm3ibenlntqkfclueq3soazkagwkezg@wtdhq4yvengu>
References: <20250905213738.2936785-1-zongyao.bai@intel.com>
 <b846e886fbcacb1265a408c8e077a842971e9c1c.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b846e886fbcacb1265a408c8e077a842971e9c1c.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7385:EE_
X-MS-Office365-Filtering-Correlation-Id: 406c05ec-2cd0-4c6a-239d-08ddef9e0006
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?8m8ilkF/vrpYKYn7ZeQxGy9ahLwdXksobM0OE1CZgR/Hwk7q3d7xjs3zg0?=
 =?iso-8859-1?Q?EgIaMOCvU8cPJjCVSItw0VRxvzvJbotOXYaVUhPwGmlArirelNj2YlEsFx?=
 =?iso-8859-1?Q?n01hOXj1+zndfwZtYs6Tx6oE/e3cGWjbQLKqs1DhCGX24bKshQf5njARM+?=
 =?iso-8859-1?Q?ZOwp2F5kcLLGsWOsfWHkf4DCGzZqKnSPijB+VmVBe3kwPEr4PJ/l7R/eV1?=
 =?iso-8859-1?Q?Em8Gee+GjrDWwmdSE2T2LhMbrU9zp7Xttbey6RWAAAsvIC/us3sVuoqBg5?=
 =?iso-8859-1?Q?cnH35+UTuEkoJruJ/9JoAe8DTJNhiF1s/K2xDWCCQQSEc43zIlOujlHcKw?=
 =?iso-8859-1?Q?ndut/U8vI6skdULjYjCwqsI6kkZ0LWgbGiBBWHhzHRgM3+vyMyRvk/Rni5?=
 =?iso-8859-1?Q?/zZfK+lvcDdszFB1q9HYqDtThfS5ImHluYz2lju5QM0mi0lhMhdkun3a1I?=
 =?iso-8859-1?Q?VYp3tBZOM6eJdHGqw1b0Ay4s0117XA4ANldR6+0XlZ7IWxeHFNfY8S0g8s?=
 =?iso-8859-1?Q?n5HmdTH+2Cr2Gn/Y3vukbWih47UzzYl900nQPMKKgv2LuenjKEYs+husfL?=
 =?iso-8859-1?Q?U/q9dg8jbcg9yzhKKe9SuvmAo6yQK3UbiEUotGS3LSG7GnPfbCPYMkiIPs?=
 =?iso-8859-1?Q?IGpSbiJYU+wedcA+/GMSwIu8KQZb1NadqlVrY+Rza2al/UbU2wEdBcw1Y/?=
 =?iso-8859-1?Q?IgW4oq4tUnWpavlG34Ks8043lschxomuM0CiP/U9Q+SOMxwh8kN3tsTpj+?=
 =?iso-8859-1?Q?JLhQeedBcdTYgxjRkZqhc1a3M8AyIoZsJON74Px/gIdDjVM7s+Gh/EDB3q?=
 =?iso-8859-1?Q?25cSzc5S9MZaC5iY4IRCd8ck1FnQFupGr0YV9+wpaD78h1K5Ua0UH9N4dS?=
 =?iso-8859-1?Q?Z3ANR4eVahcySLQX8+aTKzjiALhnoV1Gvf60FUg3Ro1RS/EbNNyHJy3QBs?=
 =?iso-8859-1?Q?dZIloGmuQEqxJXjInk0VXhr3MlwtaA17gMOc36TOmiwJsTEDeijFhHsazr?=
 =?iso-8859-1?Q?kqGgrGC0da0aIMl6H76qRG+CCFyPF6kMEJR5rfh70PkzDd0ATcJhdAw2c8?=
 =?iso-8859-1?Q?4t6Xb9IPqX5tHRPOQ8ZJN1YaSqrneFDgzSlQYQ/tCOfhC/KPMyEpp08PGq?=
 =?iso-8859-1?Q?McZkWHi30/NnktPXDVpVxv42grFeLxBVwGHCVmkiyGAvqRdOns+/2geAx1?=
 =?iso-8859-1?Q?WHOqiLGGKlTkunfJpxwGQAciiVKEKGkKfrl4CRabo5IFJOwgrSOoSyBoZy?=
 =?iso-8859-1?Q?WryDrzuEQCK8s82hGSafjQFqsCB0qLk8hE/10t43WqN0ARnYqSzlYd48uA?=
 =?iso-8859-1?Q?Oib2yrrCvtvMCARdL5P6d1YYYZq/QtIbWl3qn3aPltCZWMktqPiWffpJfp?=
 =?iso-8859-1?Q?Dv06OY3xLBmYhJRdbeOSU3mfZftD3FxeeR9GKEebEDuuaXXvFZ77g9j35d?=
 =?iso-8859-1?Q?8fjTLcpb6ingB1eqyU1Mp5PDBFL+sI7wYN5jmIiRzppDK3o5A7D1EolJMF?=
 =?iso-8859-1?Q?4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?U8xnEkXcf6OOmWSWcNBwiQ5v2mgM3LOtryuuoLx9BPrCcSz4pSJoyPS8H+?=
 =?iso-8859-1?Q?GJab4ONr6LK0r8G+34PlNRyt21+S2D9x/ioCvN+VL1skAEtwrmy4+SeRDM?=
 =?iso-8859-1?Q?CI6x1jODonA5GBTi2PrRM691YxYYOUARlt5lhHtvPeLsU8v05T84fHB6LT?=
 =?iso-8859-1?Q?QdHb2LbmvNRI68664dnSTNRTdfHOEeXSnxMph4Ag7jX++7RhpsLYo6WO2h?=
 =?iso-8859-1?Q?qMOJkilPQzfOsgbLtPVuVqu+Lw+J72G1sY41SzdG4hkuB3Wg2wqNCq5A33?=
 =?iso-8859-1?Q?LbC8Jig18vlDIm8JzpctuiWZaJJRjxv/xbu8ZNhcjlrMp4UuAExO+n4bVR?=
 =?iso-8859-1?Q?4+dw7hXsnoX64qPdVqqVHjQf588752GCSUQSdC7EbnFZQcJ5+SUjODeoWS?=
 =?iso-8859-1?Q?cNg7r9PBRRWSzzeRKI1/nKVXGvFQIROJoITY/jP5fZ4TlM8UcvRw14M79n?=
 =?iso-8859-1?Q?ySs2CmwYub8qGgY8PsshsGUfRY/5BPoldrWXkoIVvvS7YAsXMztpZPceHM?=
 =?iso-8859-1?Q?2IZlrjlLG2AlLf5CXI2rBuhzXIj7Ki+CPKA5/nCTgKnRwcJzbsrKXgrB4V?=
 =?iso-8859-1?Q?zysiZEpEsjjc28kTgRpsSl2KHHR2KfxeJs3Xe+9ZJOZj25rCx+9sg9m/sV?=
 =?iso-8859-1?Q?68yJZKFZIWVpgX5n8ud70SNd9GviNlM1HLny3rN4kmr17R3ixOFS9Bzrii?=
 =?iso-8859-1?Q?xjHSdOEA5lzgcNaz2AESY/rVLo3HS02Jgvj1haPpsLPHZocdRWRRvFXAb0?=
 =?iso-8859-1?Q?uHwgqxbSzxXa/ZUY+y4IOm7cmx4cW8oBcmnSHZ4+PRFsvYov2t25zcpJgC?=
 =?iso-8859-1?Q?+6FTU05p5xAGA3KPaq8sW7m3+cxKRnKqgkqjYRsNcmr2h7dW5r05+rQvWW?=
 =?iso-8859-1?Q?qQy4cOjCPkaHQTUOpTIfB1dRxZReuiH51OMEaRtysR1ONyiHMEyZYkAdlb?=
 =?iso-8859-1?Q?nBWU1BDTQNjlgUAaf/RhZFbwtMjzABQ1wdRkXYwB8voCNq78X9n0Zc/YBl?=
 =?iso-8859-1?Q?7LpOz28JYw1ElqNqsM1om/QER8TCuRwbmQ3UV8JA9+vBZj3v13VzjFo6iT?=
 =?iso-8859-1?Q?qBqspH4X+Rv+0zeu1fGXYHNAy4INu+LdTZttFsaSaiAMYmIBZbWduCkrbF?=
 =?iso-8859-1?Q?TiAXaeqQTaDhLq/58J6yh/jny/FjlGTtIL9Gb/w6cWZUEMaj5Yn6wMksf3?=
 =?iso-8859-1?Q?nmCR1v18Jk2r3BisS2ZlLIqfM+csnax8Awyyly2WZi6YBqvp/n4D8pNXbL?=
 =?iso-8859-1?Q?YiD+RFSN9ZNfr4SY1SHSZhv3gmaQN2y6pTdZLVx6vYOVXAvbyxiyd1zxZG?=
 =?iso-8859-1?Q?sBdwEyKS6E6tRoqNiGZCbHcZUBNMFj6sllemgS/8K0EP2tfgDRmO+/yj90?=
 =?iso-8859-1?Q?gBBt3J7b0Sezw9dez9vbIsa+dFox08L1CY6lf0hs574McJILUUxZamD/7P?=
 =?iso-8859-1?Q?szxg66BzkYNoLYOPQd/o+7hWgXUSSYyVl1KwkvYufQkswznjlIoQkZAMCk?=
 =?iso-8859-1?Q?OcBDNv3KZepnjPR5gd2jdmaDJC+85Wz+mK5eQeOtZIzDGfNNnxK8I2L8+0?=
 =?iso-8859-1?Q?nfGLkMJRme7rwgoiewsbMQ3oyF2bDVUqrHKYUj2RJ7vOW+mlvZt9lMicgp?=
 =?iso-8859-1?Q?8Ej14TjI6kuy2uiWM6AF+G5Uq+WGdoieddsLqe0Qon3s0arFtbCci7Qw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 406c05ec-2cd0-4c6a-239d-08ddef9e0006
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 12:40:04.3755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fdW5/JgPi8BIsD9wJTdtuOhWk7qFru1mnQJqwDH1qeJa5qFYE0YV5SfO5AnBlFKWAz578ekPO3rWkwE6chDEqs+AerdKzt5/yQJS6Z3ujtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7385
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

On Fri, Sep 05, 2025 at 11:01:09PM +0000, Stuart Summers wrote:
>On Sat, 2025-09-06 at 05:37 +0800, Zongyao Bai wrote:
>> xe_device_sysfs_fini(): switch the order of late_bind_remove_files
>> and sysfs_remove_files to follow the rule that files create latest
>> deleted first.(LIFO)
>>
>> xe_device_sysfs_init(): on partial failure, any sysfs files created
>> before the failure will be cleaned up via xe_device_sysfs_fini,
>> ensuring no leaked sysfs entries
>> Add function description comments for xe_device_sysfs_init().
>>
>> Fixes: 0e414bf7ad01 ("drm/xe: Expose PCIe link downgrade attributes")
>
>I realize the exact line was added in this patch, but the late binding
>patch is the one that introduces the ordering issue. So I think you
>should mark this against:
>commit cdc36b66cd41d0f6e18e86d7aa50554c852f97e2

But the order itself is not the real issue. The real issue is
that commit 0e414bf7ad01 ("drm/xe: Expose PCIe link downgrade attributes")
started leaking dev_attr_vram_d3cold_threshold if 
auto_link_downgrade_attrs failed.

We could rather group the attributes in a attribute_group and use one
function to decide if attr is visible. Then there would be just one call
to sysfs_create_files

Lucas De Marchi

>Author: Raag Jadav <raag.jadav@intel.com>
>Date:   Wed Jul 9 22:12:24 2025 +0530
>
>    drm/xe: Expose fan control and voltage regulator version
>
>    Add sysfs attributes for late binding features which expose bound
>version
>    to the user.
>
>    v2: Rework attribute and macro naming (Badal)
>    v3: Drop fancy formatting (Rodrigo)
>    v4: Form version string using local variables (Rodrigo)
>
>    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>    Link:
>https://lore.kernel.org/r/20250709164224.2676086-1-raag.jadav@intel.com
>    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
>
>> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device_sysfs.c | 22 +++++++++++++++++++---
>>  1 file changed, 19 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
>> b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> index 6ee422594b56..27b6d90a0009 100644
>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> @@ -292,11 +292,23 @@ static void xe_device_sysfs_fini(void *arg)
>>                 sysfs_remove_file(&xe->drm.dev->kobj,
>> &dev_attr_vram_d3cold_threshold.attr);
>>  
>>         if (xe->info.platform == XE_BATTLEMAGE) {
>> -               sysfs_remove_files(&xe->drm.dev->kobj,
>> auto_link_downgrade_attrs);
>>                 late_bind_remove_files(xe->drm.dev);
>> +               sysfs_remove_files(&xe->drm.dev->kobj,
>> auto_link_downgrade_attrs);
>>         }
>>  }
>>  
>> +/**
>> + * xe_device_sysfs_init - Initialize sysfs attributes for the Xe
>> device
>> + * @xe: Pointer to the Xe device structure
>> + *
>> + * Creates and registers sysfs attributes for device-specific
>> controls and status,
>> + * including VRAM D3cold threshold and PCIe link downgrade
>> capabilities, depending
>> + * on device capabilities and platform type.
>> + *
>> + * On partial failure, any sysfs files created before the failure
>> will be cleaned up
>> + * via xe_device_sysfs_fini.
>> + */
>> +
>>  int xe_device_sysfs_init(struct xe_device *xe)
>>  {
>>         struct device *dev = xe->drm.dev;
>> @@ -310,12 +322,16 @@ int xe_device_sysfs_init(struct xe_device *xe)
>>  
>>         if (xe->info.platform == XE_BATTLEMAGE) {
>>                 ret = sysfs_create_files(&dev->kobj,
>> auto_link_downgrade_attrs);
>> -               if (ret)
>> +               if (ret) {
>> +                       xe_device_sysfs_fini(xe);
>
>IMO it would be better to have a goto here to the error return at the
>bottom of the function. That saves a line by combining the calls to
>xe_device_sysfs_fini and moves the return to the end of the function.
>
>So:
>	ret = sysfs_create_files()
>	if (ret)
>		goto cleanup;
>
>	ret = late_bind_create_files()
>	if (ret)
>		goto cleanup;
>
>	return 0;
>
>cleanup:
>	xe_device_sysfs_fini()
>	return ret;
>
>I also see the sysfs create/remove functions within the late_bind
>routine are in first in/first out order. Should we go ahead and fix
>that here too?
>
>Thanks,
>Stuart
>
>>                         return ret;
>> +               }
>>  
>>                 ret = late_bind_create_files(dev);
>> -               if (ret)
>> +               if (ret) {
>> +                       xe_device_sysfs_fini(xe);
>>                         return ret;
>> +               }
>>         }
>>  
>>         return devm_add_action_or_reset(dev, xe_device_sysfs_fini,
>> xe);
>
