Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9D7C83030
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 21:22:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBF010E1CB;
	Thu,  3 Jul 2025 21:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KjNS1HMh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9519110E1CB
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 21:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751577740; x=1783113740;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Hucv1UzBVD2rAY5PRY6q0m9yPdSp/NIbHfHofpnqngE=;
 b=KjNS1HMh6CfVGOv8Nr3kQRHKi+JmBsn38+K2+iUyHIoT8VVpzxUl71+r
 CsixNZeih+QCgrtuRiWtVLGREesnvP/k13GV+WAfeBqDoe/fPBv7jvyN+
 zOmkm7cD7Ol+6NtqhZhgH5OtkrN1LXsjVbdJwDU/UG3wdnEMOFokx1zl1
 JiOEMGyZQGV9N7E4CvBUTkdBWXSSLKAs1ewBqRev/7ms9B7rjtrk5ZYCY
 Ht+qiA/QZ6g3kWcTugfwJPGhUUKtSETDEn8QoCGpe3ZHn7OriZxMLC4W5
 1ZyDardpoNCXhEvHxX+8Z6MYDJQ7C/QxLyKaM1Mx8b5B4K7Q0uJkmY7lw Q==;
X-CSE-ConnectionGUID: N/+NiOW6TdKivZDs2PyYrg==
X-CSE-MsgGUID: uqIEHphrQIOUbIvwKuCn0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64607480"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="64607480"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 14:22:20 -0700
X-CSE-ConnectionGUID: 0E+l42CrQ6qDkK35L3RhrQ==
X-CSE-MsgGUID: eMgJJwncTga/AT2PzrjaXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="153889814"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 14:22:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 14:22:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 14:22:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 14:22:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOxZDXXz7HcQRoYFSoRdHPRnl1QLisdefJDmdlGB0DoqVCr1YRvBzegwunPX3rMTU2/wmamSIFU4TiiTHIVrHmfK48sNjf6fin2gDdvUs8EmFaPksLCTL/zNZRGXKCSOZ49wtIC/O9m9whUIjCceTgAbJc/QNivdQg1BfQEpr0uiyqQU+SMmyRRHj5qUYyMZFeqnWRSEivStCW3pC34kG6CglnGViZn10S33DU9bgtEbPjBSN4aJPC+5iy2Pjy0bxtakXNfa/bb7owcfR6fOsMqWP1ujwRQsbgMPEWXipnfveOlbSCBdXaV1/BVDc41CfPkES/ybvn/6oiI/WX5EPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/gBUpskxsPFVvuLF+f1FdQ8+uQUyqVaK26WBYhz2Xw=;
 b=KhkLncOhZLfY5OFLzJU4sbE9q9R64UVJ+X9DDXQHhz230ZDhIc6eG6m2FBPKX0/jRsjvCinghhGUNUDH8xI6Hf9Dt94EPl99r3FORugMq0+PZDEiB9bFiy6P57lJi8khtHZhC0OUmJRAcQsO87rJBETgG9psGs4V9EOUCAT37rsMdjiisR4olY+L10bm6KmVmnDHhPCbplFANUov/zqqSth5mdJV7biJkoD761BBXi1DH4zAsxj5QdYCKO07i+G6VZoQdvfajpX6VwYQKAVxydo0+syBfDamgzwARgKWYFcW86ozYTfyGg3oyQEQdVot//UHXXYi7fJr1Vc+OX6qww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM3PPF67FA1A8F8.namprd11.prod.outlook.com (2603:10b6:f:fc00::f28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 3 Jul
 2025 21:22:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Thu, 3 Jul 2025
 21:22:01 +0000
Date: Thu, 3 Jul 2025 16:21:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v5 6/6] drm/xe: disable wa_15015404425 for PTL B0
Message-ID: <pzkeutc5tc7bfp5zq3ilkpkhopqyzwazgh5db3txr7myvk7l4x@or6c73cezznk>
References: <20250702193036.1417416-1-matthew.s.atwood@intel.com>
 <20250702193036.1417416-7-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250702193036.1417416-7-matthew.s.atwood@intel.com>
X-ClientProxiedBy: BYAPR06CA0042.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM3PPF67FA1A8F8:EE_
X-MS-Office365-Filtering-Correlation-Id: 48771d0a-2d4e-4e8c-0351-08ddba77a66d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nGZuTGvNJdQz+xj1wjjM7OQflg6kjH6xW0fn5sIfJDYltaeyGDWp9E1qzwpD?=
 =?us-ascii?Q?tbLySN7BSwSahonxcREzozn0E1o3oYASIJOpLd7tWt2bnSeuB9FNKDXAraCW?=
 =?us-ascii?Q?6H+UvCi77U/7xm+jaDF9T2qIT26aLHuzWNNkrg8yOmbc+UHsZVGL9TP5OwbY?=
 =?us-ascii?Q?1pYZ5pGKHgeqwpdOvh/qDIkDAAoBnkCWdFWC3V0dodb6QicQTVGBuPG5lL+P?=
 =?us-ascii?Q?dcXrI44MMUo5JJiQyGCJ/FbCs3Lfq7yKYcchlJcFPu10sqF3kZPefKWw9aqa?=
 =?us-ascii?Q?3mII57ZlNhcUeW+Gm0mV9RcnfkD7nF/jqRi/E1ZvoPsBOFa0YQE29Qycfn+Y?=
 =?us-ascii?Q?sEtpzJvvy8Ohtp1sK2rEqMEhZ+CreMOziRGPyK5RdToCHjtmKhuwSOusDXIg?=
 =?us-ascii?Q?5DvDldpYp0t98kygeUD1PUCik9rWxN5ZH3QPE2vOYH+2My20XsoraQKsS5Bm?=
 =?us-ascii?Q?z4QaQkG8z9jpV0HOv6X4qGL9s8WN5/jqBUMH4di0M6jbjTh6k2eiY2xsXQyI?=
 =?us-ascii?Q?W0Eve0rp74cI5AIPVOo45KW0Pcq4xJt9fEUz9pQkLlehazRTP/7v38s+4IlO?=
 =?us-ascii?Q?NpSlN4Hu75DH5/S/rl+R62/BLyKr9xMDzCflzWZBexq9Av892mnUoQjvuGCC?=
 =?us-ascii?Q?1ktWAxkbEUchYQJzPEif+zNzdfyf51qUnc9Ug9w5H7k16QWJHEHxcJZFx3D0?=
 =?us-ascii?Q?n3HYHV74i8n5NAPaC9mL7AEyyrvTllmFWXM/Uvqc1JaYKvz1zfSxlhwCgVYp?=
 =?us-ascii?Q?5LtXGtxpVoxVlt6BrG2Oxv7ceERSXXOvEFAiuoG979qyfD2Skp43dHLNNMsy?=
 =?us-ascii?Q?+dUYmquUpaSN0AwHK19CuQJMBmH6gxryUNpQAsAOvFyaV83NmYGH7NSMAD+0?=
 =?us-ascii?Q?+Uo5OC+qo6JST+SZKRpS0cJHdbM4EoPt1ntTjVkcSvYe5fIEcqgsc5QSjZrb?=
 =?us-ascii?Q?QWHJ9H51aczehss2OIoJkSjAWc+riEda8dZMuxD750R7XB00DdY6CY3hW7nK?=
 =?us-ascii?Q?V4cnK0ktksKKrlv0jEL1bDPE2mTeznJoeTQXsry1i484GvHTewYLf7Pkgpgl?=
 =?us-ascii?Q?LOjk7NY56xnUM0DmLoEJQmrLR8S2sgF97HK8iouVXgsWmHNi+miI/TCNyCx0?=
 =?us-ascii?Q?MeDoyXbU52MwD4f/nc5qlQyrXkCobOsWidRZ7JN+rBRn9hxS/oQVI83b/CcU?=
 =?us-ascii?Q?tLoyt1gbcit+tHtZ//ivxulxFWQUn01ETb9KefFr1JRONftB6Tfhv3l8cCJK?=
 =?us-ascii?Q?jAJ78GgKuMYkBML76yyMsVJWcI4HLQLESRYCJVKCKlHbsOmp/+kqil4PIvnQ?=
 =?us-ascii?Q?JsPhZEIGqQEgx+8AaJYD+dtk4GmcLgsbmR18e1P3CvDUTs/lDVKJvT+M/ULH?=
 =?us-ascii?Q?DWD4aoz6L8nm92SYU5L2O3HYon2QtUfRjzAuQXtYprABsRH4XcA5oU3dtKNF?=
 =?us-ascii?Q?78MRhOMA/hQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g8WjdY+brMfmmY/rlgPJpHnd9gBCK5rLDh7PONgOKzKHJGjB1eAdPJoJWd59?=
 =?us-ascii?Q?nJROBOBwhnt9D0JUKrRpnLd7OAcjnLfedopfTcx3ksN7JYh8OeonzGbPGvMw?=
 =?us-ascii?Q?y026b9+TXWUR9pMAvmdJLcbtkuEnQxWCkxLQnV1xHfdZZsy9mC2T/OecVzyf?=
 =?us-ascii?Q?TnmW2A7EACF2EjFIB0DDenNhmJPKJsLrhev8Ywv12/y0fuhWhGwVxyz4Pbq/?=
 =?us-ascii?Q?OuSIOlgOad3SHRCswqJFsiIJszvlW7kp2mu2o/XyDjcGo0QXwMv0CqHst6rs?=
 =?us-ascii?Q?AB3x+1p3/mypXfZsuQXEipaIvyjVqMUamjzuw7Ae4jEi5xgKlqcKAx5v7JT9?=
 =?us-ascii?Q?zmMwsOf74FIX031mbarWNwHdKwLdoRww+7f3ZB0n7drK5i+NLIb0qiLQ2l0E?=
 =?us-ascii?Q?PZpNUKkESfxlYD317OPy6LoHPUbykMF99++tKu6Q17TNhV+tYAa4/tItho47?=
 =?us-ascii?Q?uwbJ6E1DNkNBpWOtMvuxnt93TQM/I8g2c5kO0oNHvjUNyLxBJ7+AFh8q1gHg?=
 =?us-ascii?Q?zyXbmMAfNSCSCaxmlTnaC3/6EO/fQrHpx38GeFHjQvr0ho6hMOWFTXU/NHt7?=
 =?us-ascii?Q?Vp9Hb8sHJwXFxPTOnocMJN0eqx9LEuRWaiziOgp7p9ZTUdn/juPVg15l6VG9?=
 =?us-ascii?Q?x7CT3qEC/V+nz+0PxHbief9Ks9FiZ1F98o7fC9FTbVasDFFJsYOitTRV1Aqo?=
 =?us-ascii?Q?368Nd4DUJY3Uk9HND55wq3eHRM6sC3P5+eToXQzhkiTy8yEDmG4+r05rlrro?=
 =?us-ascii?Q?J18JNzhSA6gA0lRQeya/KgSqMA1jZd5/sBC1tMB5s4mmPviiX+LiKaPKRiuJ?=
 =?us-ascii?Q?vp1wzgnPlpA7qtmk8vrUhIFJaJ+P6B3y75uddCmDPtGak2a8GI1SoHc+4M/G?=
 =?us-ascii?Q?WkltlN5B+FR+vly9iPXH+CC0mg9i2HrHxrPv3pvkxUBBXvzvC6c+PiHLXlk3?=
 =?us-ascii?Q?+JcFNlymJsKvhqef+tZJ6OgiLkAwf4VQSSpT0qNAu9Ni4aQXodAJirO49tB8?=
 =?us-ascii?Q?9lexsoVdkjUPi/kTfjKZdH/2FCPqRA3e1sNHEn/6mzWTzCHvcAFL8QNrSJXj?=
 =?us-ascii?Q?HxB7bTVIi+CKKZfbF291iOmHWac2f01xoMucG1iXKFKn48/jZcKmb5Mj3I6Q?=
 =?us-ascii?Q?W4HMZCo/kVXcakNtd852201KPykp1feU1eSzM3zk8GdTsD0jLp9RMiA8cnS4?=
 =?us-ascii?Q?BcfcF9TJgnyLs0Pcthy5VZlQsrxBqhZ+lmd45oUz1t/kwXxE79gidAlMCvHQ?=
 =?us-ascii?Q?Ak6BHySyrihsskslJkJFqx/r9ZoRXGDWMkJiM2OBVpO/4CP3YofjNRDkYV2/?=
 =?us-ascii?Q?/aVursbntdVTpUJzFFFx4IcgZuizkCXKVvR9psfgebY14GIyODZE1Qa+SVqD?=
 =?us-ascii?Q?gKdh1temeqZzo5puFdD3RdgLV2HwnOZPhHBXOtS44vsiF4aLaNsmBeGTJTBO?=
 =?us-ascii?Q?H6cKzU1M5aN4Jo2dPicNOgS5jTXQb4QFC6d23KtapBjA6oAd40E8JVtoJM+/?=
 =?us-ascii?Q?CwCWTNHRZxl/GBXsjbeUMejg+YQAOU9uDCsXorYSGPnXzNnJyxbW+K0LfJeI?=
 =?us-ascii?Q?gr/aV/FcrQAfsxCUUg6qqNVXybX4je2OdLoOfraXo5aXQ1xF7fQq3+9+hW65?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48771d0a-2d4e-4e8c-0351-08ddba77a66d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 21:22:01.3935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PfjD0R31FqKSiEdMicgDPN6Ph8CSJG+idXLEBtaI/dqmchfYzKIRmWVuI6T+1JMwzmGPCvdAQdhfCOisa23fPs1xoWygi3q5ooRbh/4bEPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF67FA1A8F8
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

On Wed, Jul 02, 2025 at 12:30:36PM -0700, Matt Atwood wrote:
>Wa_15015404425 only needs to be applied on PTL platforms with an A step
>compute die. There is no way to map PCI revid to the compute die
>stepping. The easiest way to figure out compute die stepping our end is
>to map the media IP's stepping to the compute die. For PTL, compute die
>has an A stepping if and only if the media IP's stepping is also A-step
>(This relationship is determined on a per platform basis and just
>happens to be this way on PTL).
>
>In addition this workaround is a chicken-and-egg problem. Wa_15015404425
>requires that all register reads be preceded by four dummy MMIO writes
>(including during early driver  init and even pre-OS firmware). The
>driver needs to perform some MMIO reads during init which include the
>GMD_ID register that contains the Media IPs stepping. To handle this in
>the safest manner assume the workaround applies to all of PTL during
>driver probe and deactivate the workaround after.
>
>The overall solution becomes a set of two workarounds:
>
>* 15015404425 - a Device OOB workaround that's always active for PTL
>* 15015404425_disable - a GT OOB workaround that applies to PTL
>  platfroms with a B0 or later stepping
>
>The first of these workarounds issues dummy MMIO writes we do when
>reading registers. The second guards logic that disables the first once
>we have the necessary information later in the probe process.
>
>v2: rename SoC to device, avoid null pointer dereference, update commit
>message.
>v3: rebase
>v5: move disable check into xe_device_probe to avoid linking in xe_wa
>into xe_pci, reword commit message
>
>Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>

I don't want to have the case of applying just the previous patch and
thus leaving this WA enabled when it shouldn't. Let's squash this patch
with the previous one.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_device.c     | 5 +++++
> drivers/gpu/drm/xe/xe_wa.h         | 5 +++++
> drivers/gpu/drm/xe/xe_wa_oob.rules | 2 ++
> 3 files changed, 12 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 53df142c1031..5a771b0f8f19 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -68,6 +68,7 @@
> #include "xe_wa.h"
>
> #include <generated/xe_wa_oob.h>
>+#include <generated/xe_device_wa_oob.h>
>
> static int xe_file_open(struct drm_device *dev, struct drm_file *file)
> {
>@@ -863,6 +864,10 @@ int xe_device_probe(struct xe_device *xe)
> 			return err;
> 	}
>
>+	if (xe->tiles->media_gt &&
>+	    XE_WA(xe->tiles->media_gt, 15015404425_disable))
>+		XE_DEVICE_WA_DISABLE(xe, 15015404425);
>+
> 	xe_nvm_init(xe);
>
> 	err = xe_heci_gsc_init(xe);
>diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
>index 3793fcae38a0..907eea020b9d 100644
>--- a/drivers/gpu/drm/xe/xe_wa.h
>+++ b/drivers/gpu/drm/xe/xe_wa.h
>@@ -45,4 +45,9 @@ void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
> 	test_bit(XE_DEVICE_WA_OOB_ ## id__, (xe__)->wa_active.oob);		\
> })
>
>+#define XE_DEVICE_WA_DISABLE(xe__, id__) ({				\
>+	xe_assert(xe__, (xe__)->wa_active.oob_initialized);			\
>+	clear_bit(XE_DEVICE_WA_OOB_ ## id__, (xe__)->wa_active.oob);		\
>+})
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>index 96cc33da0fb5..255e67113406 100644
>--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>@@ -70,3 +70,5 @@ no_media_l3	MEDIA_VERSION(3000)
> # SoC workaround - currently applies to all platforms with the following
> # primary GT GMDID
> 14022085890	GRAPHICS_VERSION(2001)
>+
>+15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
>-- 
>2.49.0
>
