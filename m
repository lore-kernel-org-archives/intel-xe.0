Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F107EC2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 16:19:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D1310E1A1;
	Tue, 25 Jun 2024 16:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X4CflRrJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C3710E1A1
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 16:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719332355; x=1750868355;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=q4hvyEj5W80Z57w74/bhF/ZXTgI5ltRfl/Vj7FDRykM=;
 b=X4CflRrJRXxGR7YdS1KCcdvGVs7m7KF/omPgWtiuxvqGIGHRfAtD6eQR
 BIKqfTn3q0ht8kaXHH/BVMZuFNPuBGey2pfGTbOKyETPskv/VsokzJ0/Q
 c2nsSvTEELRtP85SbAlxo/pU8Mnzoa5UAmNcwz2Xv0aXz/y/l6Zt4nAeE
 +RWS+bgOCmxykh1oy6OsE2BSZyPs8PoDNWd1FcnGwE0pgMyMh/PQzFAFk
 0RzTw+r5HSzgS4DHYfAIhN15MywRuzga7u2BLepzoiME3yWHVe30cpX5u
 YCFN2VooDhA793uyrhml0ctryKvGIdOEcc3aCqlsPtxTswESe1yl+B2zo w==;
X-CSE-ConnectionGUID: 2IGp3p7MQ+2StuuDZ5xgDQ==
X-CSE-MsgGUID: j/zOYmDoR+meme7VKa6TiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16119287"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="16119287"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 09:19:15 -0700
X-CSE-ConnectionGUID: kuqkth/6TkKidVViuw1a1A==
X-CSE-MsgGUID: i01+K7XCTtm7nPhGKepr9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="48273921"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 09:19:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 09:19:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 09:19:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 09:19:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Khxlkppdjzjw4Zm/He6SefMxpCOtQcTEpStb1uxMW/YNMJdF4EpMEwI8kx2A+LAwwY25d17YeJcTDm+cJSpJyM9OBbKlUA5iG0FIxNJS0mtpbUOl+4PMQuoClGhICkk5gkiAaQHLY700H01qFJ9LkZB7foE49Fxs4HRO2F4l1tsGhnmya2CRXBOuspyryzCdlDvaUXn7Bl8xw6Pz7XVF1vwg7eZQlHNA0MW2A5Fi8zJSGyUxbBlHGNfV9Qy23zH8AZT5CCs/3PruKlVWaZdB95Dp/ssRQ/Paca0fmgta0VrdP5H7+NiLIodgcozA9TS7J1xBDkWa9B4tsP4GP35LxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZqqkEunhy/4kvvjvCPdqDOtOlIF6SuUmdhsvCj7qvWQ=;
 b=YXUHNKRhAYsiONNrAsfi5Cld3FZMqUdCiC37tdjrGe0Voi0mJmGbHFEWHE5OukZbdvNE8leuG0fAmK6ZzKoDjTCl8P5iVkxPUWuFkBrcs9ZnRGiyoHcGWPt3ER7RMBHaQ/1550yXCzfvBEannOjJmxeSghThuXd6UjGPs8FXOe51nKmUUfr7J5cuJ90CeN23632y9khIZ7bfBjJhIG5/UeQYr0+2Myov9SgkvN7Et9Tcb10N/wcyGdekiTYWPjJszv0bNlfEfpleavJHe6g6tXHPeLPClewleeB1EBJDZf6aAb+d7l097/k8XjY+fgSm6TOHa+cvl+vnTsjwBdoyBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.24; Tue, 25 Jun
 2024 16:19:12 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7698.017; Tue, 25 Jun 2024
 16:19:12 +0000
Date: Tue, 25 Jun 2024 18:19:08 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/pf: Trigger explicit FLR while disabling VFs
Message-ID: <20240625161908.tsen6yxwqd7ib252@intel.com>
References: <20240624205737.1213-1-michal.wajdeczko@intel.com>
 <20240624205737.1213-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240624205737.1213-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI1P293CA0015.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::14) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SN7PR11MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 124dc863-4020-4854-14f8-08dc95328c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|366014|376012|1800799022;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXJ4L3VnZkVDbnhXRlhMd01wdDVreXd6RnEyRFppMjJIQnRuSEE5MnU1UGQ2?=
 =?utf-8?B?VmVUTk9MdWpHQU1RK3pqRXhsbkVXOHl0R2FlTzYzMFBDQVdkaXhGaVFLVjBZ?=
 =?utf-8?B?UlFZa3EzSnNVWFM3T3hTVDRSRXZ2TWZMR1VMOXhLZGhTZGtPOFM1NEYxOGhl?=
 =?utf-8?B?M3c0eDY3SlJlSXdGWGlwQW1FaWpBcjNITmlSZElGMlYzcjBtWU0wWUJCaXY2?=
 =?utf-8?B?UlFCWWplck1Wek94dHNwNTA4c2J2YmR2ckJwMWxwMUdYdkwxdHVBdkdacnNj?=
 =?utf-8?B?TEJzVGpsK0hRazlpZktEY0piU29pa0lyUXloSEpsQ2llczcxeE1pSUJZK0VI?=
 =?utf-8?B?VHMzUWpaUmp5OWJBbWo1YXVMM2c0eE5WMXJuV2Q2Vi9sUnJYSWdxTHVtTmdo?=
 =?utf-8?B?QWZtVG9Ta1NaU01aMkV5Ynovc2JyVXU1bWtOKzBVVU1MZlVyUmV5QUpHdzUw?=
 =?utf-8?B?UUlBb0lwU1k5c1ZTaUpIRnNPRHVKOUthUTgzd2g2NzBmVlFpWGx0Q0h2OFpN?=
 =?utf-8?B?Y0pFS282T1FPWXNtL0JyLzA2Ti93WFN6Y1NjK1hVdDVaTWNJaVN3UW5TNVZH?=
 =?utf-8?B?dDVLSFJ6N1FoZG1kSEZnenlqRnlwMWwwakhRRitrdXl0dUUxdXIwS1lLUGJo?=
 =?utf-8?B?cnViQ3ZBckZReDZwSnB5Z0VGSHI2dVJvSGE4UnlLK0RBQnVYQ3FhNlpoejg3?=
 =?utf-8?B?ZmtxeCthaGNYaUVhS3UvNmxtYmpFQUkxYXFYSC9sL01vb3BkbHlYb3VoamlQ?=
 =?utf-8?B?SnJ4bDNVN0VpTXpsbkRYaHB5NmVWSk42L0ZrUmRBMUlQWERlZndYTHVzNkd0?=
 =?utf-8?B?Z1FyZnNya1BwZTNzc1dybHQ2dGpBTk9XTnE3N0s1VGxFVVhlK1l6SGFta1Zz?=
 =?utf-8?B?K2RWcHFSK2lrMGh0SE5lQndSTnlNMTJRbVg4cTZjZ0U3eW1kVVZGYWE3TzlS?=
 =?utf-8?B?NE9manp4Vytpd21ZNFZLcGpQejdBTms4dXAyKytadEVKWUkvRzQ5Y3FkTU91?=
 =?utf-8?B?ZkxQZmhTSER6VVR0dnZOeXdmOUlCV1lUT3dtNXVNZ0tSYTZ0RkRUTFJ1L3du?=
 =?utf-8?B?Ync5R2tDVmhETnFSb0pZeUZaMGVtK0sxUDhsREx4Z1VmSTdxQ3lLQWVpRUFw?=
 =?utf-8?B?VFhEZXhqanRvUHhqNzhKV1JmWTBBSEtYZEtUY205ZkV6bXQ2TVczSEJDNkNP?=
 =?utf-8?B?VlNWV3N1Qm5BdE43ZTljL3JDVXF2WTVOZmZoK28rQjBrMmlqUFVDYWdueU14?=
 =?utf-8?B?RWx5WGY0UWNQMWY2UmJWaGpKNWpmTUl3Z1U0SnRNcFpZQ3FRcm9KZURZOW5o?=
 =?utf-8?B?VWxhcjNBb0o0RmMzVlFQQldpS0MyUG9NYjcxalFnZGdsZ0NFcU9Xc0o2QXVn?=
 =?utf-8?B?R2grVGNXU3YwMk5YSG5iQ0o3U2hmVFhITTY3M0g1bVVIV1RiSTdCNXZVK3Ju?=
 =?utf-8?B?Z1VFVWpSQXJuNStWMEVlUzFrak93ZE5BekFlQWNlY1B2aEFOMjZGdDczczEv?=
 =?utf-8?B?RjlmQ2ZidjdVUzd2WEMxYTZnRWVRZTVvWVI5cEtyalh6M2VsamNWMnBDc2N1?=
 =?utf-8?B?RWZERkJraFI5aEprTldwaTVYL0pKTkMvenJnejFzOVFkcjNEUGJmbXRXcEhL?=
 =?utf-8?B?cWFiN3RIT3NrTmpQU3RUbWR3WVdYdlhmYWw5aVhDcG55SXRCY3FYS015RnV6?=
 =?utf-8?B?SkNxY3lYblp6WHBlczY2Z1h5bEhkSTgrRnovL3BQY3lwK0ZqQlhwNkFua2tR?=
 =?utf-8?Q?SDGnMUr4OBZ3KvtkxE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(366014)(376012)(1800799022); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2dGM0FFbW0yMS9CVnRGY2RpMUpPcEQ2dUcrYVJOQjRXMnBWeWdONFY1cURl?=
 =?utf-8?B?bnM2VUZqdnRCMXl0eFFtVVpzR2hPVG0xWnhBczhUN2FSUXRQSG8zMHhDcW9U?=
 =?utf-8?B?N0hXS2hZNnNNNXpKYTV0Nll2OWFOTXNveDdWTDdTVG50WlVhVUc4T240K0JK?=
 =?utf-8?B?azNIQ0RPejJ5QXBiNFlUdHZvbnArcmk1ZFhzUE1LOXN4RVdQWk5XNVVacDUr?=
 =?utf-8?B?ZVBWdDJJZm1qNlBUVE1LdEtUZ1BYOFZTa1gyWWNIL2FCMVQ2dWxFZzhReVVo?=
 =?utf-8?B?UFF5NzZNTGl4eHRyTjRsb1Z0YUFHanpCRXM0SDQvaUJCaTJKbXdrT3pKUUJQ?=
 =?utf-8?B?VC9pRTBrZHpPSTVud0hZUVZncWdMK1hjZk5tYWdvZzlCZ2hQcVdNL0xUM01T?=
 =?utf-8?B?WjZkbkpZdHp4TldidTA1RExpRmRvdGtFelBSZTNORmtkNG1OTXY0QnNkNlAz?=
 =?utf-8?B?c0dqenBPQnpYTDJwSTNHaEJUSWhJVmMxZ01SRmd2RkZWVi8wSVEzalZYYWVM?=
 =?utf-8?B?QXBSWFJuY2dveFlhbEliekdiVDdXZFhZRTBiSFZIOWJQTXE5K3NLaDYzNnJa?=
 =?utf-8?B?VUZoRS9vNVRKa3A1TUVROHVsTWIyNENRTjNIZUVWNjFncmpMZkYzWmRlUFB3?=
 =?utf-8?B?dGg5K0d2Y0c4SXRQZVk4Ym1WSnhxWXY0ZEtxWi9RajdUUFVYNnl1bGNpMWpN?=
 =?utf-8?B?LzdSZkVsMlZzSVlCblV3bXFHaTVvVUo5QVh5RmxqcFdVVGUrcHFEWGFLMTl2?=
 =?utf-8?B?U0l4VGVna1BjOXlzQTVWa0IzT2pXQm1XN1owa0o0bW1oNFBxd3oyT2xJNjJy?=
 =?utf-8?B?YVNvQ1V2YVJLL25aeGlXbzl3VnJJVGZIL2NVWktiNVd6SFBGUWlyalZGeGVw?=
 =?utf-8?B?c3h2dGQ5ZmRsTkNkVFJ1ejczOW9xc1JpbEo3YUlpc0I2UGpOVGlUcXlTVElB?=
 =?utf-8?B?bmFDSjh0MkprSGFlRW0xMVBHUWVPUmtZUE4xaEh1am53a3N3Z0xZdjZCdmNU?=
 =?utf-8?B?SjkyQ05ObmR0UmdpNE00cjFjcFBvajQ5ZzMyb2tOajdrMU1UYyt1WGIzOFhj?=
 =?utf-8?B?ZXJrdmNmemsycDBaWG1ZVi9RRnFxalc2REYwcjA0UFBUY0NHNFFnV2I4Q0o2?=
 =?utf-8?B?YmwyaVVIa1Z0RGp6V3kySk5JR1ZDemZFelQ3WmdvRFlpR1FxUGZ3ZnpybUY3?=
 =?utf-8?B?aDBVZE1MTVhiOVFKR3I0UW5IODdEcTJNaGJUNUIyQXZMeDFCdmYvTGx2Y0py?=
 =?utf-8?B?WkJDL1cyOUl5ZTY1d1pBSTJuak1Ya0dJdlJ2eWZ4YjdNN0xjSzV0RUsrQ2Zj?=
 =?utf-8?B?VG1IakJUZ09VUVJOdnZrU3dSK3RSVlRyZTJ1MnJDSWg1NW4zUUczd1hJd1Bh?=
 =?utf-8?B?Mnd2SnB4bCtuVWtXNDZOdWtZVitKY0R1bkxpeXFGaU5kTWc5ZGJoc2tPSC9p?=
 =?utf-8?B?WmtFdjYxUUVGWXJmaTBnbWpGQVhDTkFGdGRSK0tNeG90NkFLM1RtdHhFeGQ0?=
 =?utf-8?B?WHcrZ09Xdmt2UmtPWkRDTUlNWHJCWDJRQThwU1ljM3B3MUw0REVQa3dTMjA1?=
 =?utf-8?B?Q1Y4UW9ib0hiRStVZXk2T2UwSjl5a3I5cUlGbGpHUFh2Wkc1N0JFV1FsOTd2?=
 =?utf-8?B?NHU2Zy9yYm90cFJ5Y1NsVEZ3TTVROUI1cWRtVDVYNkV1T25DT0J5QXpodE9K?=
 =?utf-8?B?bEp1M2JleFYxUmczL09wNS9haG1JMVEwRVJDSDBpcjRIQXN2dWU0dGU1MFpw?=
 =?utf-8?B?Z0I0LzlmL3A3MjllVHJmYk5TdGVtQVVYUDh3YlphZFp5VGtVcFdnYUJUaEZH?=
 =?utf-8?B?UEt4clcvaG5ZRkNLMXp4d05nTWpkLzR5eC9GTnRTdVFrZmhlMDZnckpZejUz?=
 =?utf-8?B?b2p0RS9iSmFkQ01nSkhNNkg0Y0FtRTlqVmY0alVvYW95WTdkS2V2NmlIbm5o?=
 =?utf-8?B?cW1QbEw4SE5xZmhPdWh5MUJINzJKVUtqSFlFbWx5dytMSW9QMFRpMmdNLysz?=
 =?utf-8?B?SVBhbXRkaWpTanF0T0JhdVZyc20yT25ESnlVYzl0YkJUblF4WWtHZWFBdHYy?=
 =?utf-8?B?NnY1UHZvSW5yaEp4a3hUa0d6dm40bWNOTjFuS203REZobi9najJzR000b1pp?=
 =?utf-8?B?U2ZjOXhlR1ZzdlVQWnlGZzdXaGVENkhjTTZqdmVUQy9XVGlSNlNOUnYrZ1Iv?=
 =?utf-8?B?V1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 124dc863-4020-4854-14f8-08dc95328c91
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 16:19:12.0916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 28ayoYF4JBnVbwecj7Fvkf0DC0LiWC/WnGHbeeCbawQo7ThCBX++FUCLbYtDORdXEo9WOL9QvyGpMDL7F2jSnStDM0sWnN2Z+QL3IkzMfq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8282
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2024-cze-24 22:57:36 +0200]:
> We attempt to unprovision all VFs GuC when disabling them, but
> GuC may reject such request if the target VF was previously active
> but VF driver didn't unload with explicit VF reset H2G action or
> the VMM has not started the VF FLR.
> 
> To avoid mismatches between configs maintained the PF and GuC,
> trigger an explicit FLR sequences just before releasing resources.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 21 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h |  1 +
>  drivers/gpu/drm/xe/xe_pci_sriov.c           | 14 ++++++++++++++
>  3 files changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index 40b8f881fe04..ebf06e037750 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -129,6 +129,27 @@ int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid)
>  	return pf_send_vf_stop(gt, vfid);
>  }
>  
> +/**
> + * xe_gt_sriov_pf_control_trigger_flr - Start a VF FLR sequence.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.

NIT: If I haven't missed anything, it seems to me that we don't have any
assert to check IS_SRIOV_PF, maybe it would be worth adding it here?

> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid)
> +{
> +	int err;
> +
> +	/* XXX pf_send_vf_flr_start() expects ct->lock */
> +	mutex_lock(&gt->uc.guc.ct.lock);
> +	err = pf_send_vf_flr_start(gt, vfid);
> +	mutex_unlock(&gt->uc.guc.ct.lock);
> +
> +	return err;
> +}
> +
>  /**
>   * DOC: The VF FLR Flow with GuC
>   *
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> index 850a3e37661f..405d1586f991 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> @@ -14,6 +14,7 @@ struct xe_gt;
>  int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid);
>  
>  #ifdef CONFIG_PCI_IOV
>  int xe_gt_sriov_pf_control_process_guc2pf(struct xe_gt *gt, const u32 *msg, u32 len);
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index 06d0fceb5114..74c8fadc9365 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -6,6 +6,7 @@
>  #include "xe_assert.h"
>  #include "xe_device.h"
>  #include "xe_gt_sriov_pf_config.h"
> +#include "xe_gt_sriov_pf_control.h"
>  #include "xe_pci_sriov.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
> @@ -37,6 +38,17 @@ static void pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
>  			xe_gt_sriov_pf_config_release(gt, n, true);
>  }
>  
> +static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	unsigned int n;
> +
> +	for_each_gt(gt, xe, id)
> +		for (n = 1; n <= num_vfs; n++)
> +			xe_gt_sriov_pf_control_trigger_flr(gt, n);
> +}
> +
>  static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> @@ -94,6 +106,8 @@ static int pf_disable_vfs(struct xe_device *xe)
>  
>  	pci_disable_sriov(pdev);
>  
> +	pf_reset_vfs(xe, num_vfs);
> +
>  	pf_unprovision_vfs(xe, num_vfs);
>  
>  	/* not needed anymore - see pf_enable_vfs() */


One comment above, but the code seems fine:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> -- 
> 2.43.0
> 

-- 
