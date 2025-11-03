Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAA7CCF9F8
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 19:11:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C57610E21E;
	Mon,  3 Nov 2025 19:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YgVeYno9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F5A10E21E
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 19:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762197101; x=1793733101;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vX2F5FFL7SX/91eu7716EshOHv7YUO9jtNdMivyVn9k=;
 b=YgVeYno9lkUScDN+wkoRbRM1E/meePKCws2+6ToRRHOamfvvmGZzjNcb
 XjMUnIM3nG2J3LiPpatNcOHO788JlZYNTKtyfCLozDDrAR4Hn0PxWIeSO
 4soXRC6xN03/4CatnWO84Omh9Xos9RbNRjq0v4PDwLYtBY+JqGznHrDUH
 tabcjH0JAM2lRuERcUjByUyxPyo/2lFgQJ93IIZYGkFtyxnb7XzJZ55z2
 FHyQVbMDOw+3W8moYmMZGQPSg+dzSpOh4ai8d1g7RP8GaRWZ9PiLnvDKC
 uN38cnDUASam0Ogu72Qf8uhk711q2Fjj+4SgFljoxpL/Tef2OAfwVIqCA g==;
X-CSE-ConnectionGUID: zOMcScFoSSWXrlqyGT8MbA==
X-CSE-MsgGUID: YWOhhnRlQIaub2QpwwxhTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64186367"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64186367"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 11:11:40 -0800
X-CSE-ConnectionGUID: 2tXPaiX3SqubZmaL+m4IRw==
X-CSE-MsgGUID: FYgIGM81RFGF90J8vKRSRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="210463094"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 11:11:40 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 11:11:39 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 11:11:39 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 11:11:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5WLcbtSkCYiRoWOnkSsWB3buF1OGy5f8HzvZkouTR8eywNF/C20VPr8AEtkTTxj54vq6zcrwun2EVU9OTmrnzLhb3kKGj2zViiqPSNQpOYpKf7UUeu8EFzbl1hyy1VEEplR5H6+5zIXJYonS4qBT1xjdGZlcE2pCeZ/aISko7uHN6S+MnfUJroUay2rMGgg7PngKnP5733t8hgOzaeHvE7wNmGZMuTwRTI6KHGeOYKwRxrYfDO6oxWp0KBeUzqHaYoc2r2gwTlm7dIAqRZ0pXVkzHK8jj5hQh29SUN1rO++T9tjkpXk794eScv49FsNZHUL5uMpjTiwRlS9QLhu0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOG0JxFegnkSQjMmbGBo7bbb8Jb4KX9oid4yFe1kOYk=;
 b=H7sFcJPTAzTjfNAkq19bBzJts68xkOGPDXo2yprBiCzdHhT3Gp5QPPhMW9gSEvbUXYc8CDZatCmQ7gbCXJbxjqkL8ZV+p5bikG91YaD8Px4QMpPLin8Bw6wN3fjqMDuXhfqSAeOBPnhXMTfDfuaFbP07dFGj+27wYbXRvqeLLIq2ZfubJP2lQEaidc2nMEOJsDeBVUiChgDht0yT2bJNu9OAC81vLZGB7BlMv8m9HbHlHo7A2cg3bBXOubEQj/aQwaBSGifJ8wnU6d9Fs2aRY9YxH3tOKk2OWtt505MjW2KVKyob3pdfyUh4YkD+GmcGnOrKNn8cp5AJdhLFpITjXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB9510.namprd11.prod.outlook.com (2603:10b6:806:47e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 19:11:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 19:11:38 +0000
Date: Mon, 3 Nov 2025 13:11:34 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <francois.dugast@intel.com>
Subject: Re: [PATCH v4 6/7] drm/xe: Add xe_guc_pagefault layer
Message-ID: <n5hncgadbxnnyxqz2rqz7klrytupp2zvwxrnxyc5ysmuky46hb@nsn5invv6hvr>
References: <20251031165416.2871503-1-matthew.brost@intel.com>
 <20251031165416.2871503-7-matthew.brost@intel.com>
 <sfcg7e3k33utodthmvswkqyav66z3toqn6seiipgnkz5gmxzdc@7f37xxkdfspn>
 <aQj6xi3HUTHcBoD4@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aQj6xi3HUTHcBoD4@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BYAPR08CA0047.namprd08.prod.outlook.com
 (2603:10b6:a03:117::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: f6f6d0c8-b50b-4555-a466-08de1b0ccf7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BcpptkpiL4PtCPGA/YHDwkoQWsprgBJ9uvMjrp4pjloy4GhZkC1hugfMEZcs?=
 =?us-ascii?Q?JcPx5Z2db9BsPu9wr9K1VM30sPZOiCKG+3nCgWT27ljiI+F7giM1RwjgHbYD?=
 =?us-ascii?Q?o67OnmSsDiWJJT6zPGqdQFoJIe5mQU71dCKZI76FahQUDAjlm2HmqBzDAQTw?=
 =?us-ascii?Q?Gzeqy2QIpbTv3TuQ1+4Ytpr4XFi5L1ArHJoQUl3uTaUqmRRZm5GMkXjpGfce?=
 =?us-ascii?Q?PHxD0r/8pVEAhAlnZMLwgn7UjFUereZ41sLRtlJ/kbb3p1GHRRzmayzUV+u0?=
 =?us-ascii?Q?hsDClj5DWgQMJI/cwRpzw/sR685BBUqOXTzRNgJxoKro3MuZvy268juy+Tdt?=
 =?us-ascii?Q?USC9pgNIIEW51JKnbFYMjpPJdP+dxu3oelMalgeYvIsujJORm1ujp2OM5yRk?=
 =?us-ascii?Q?a61lYnGOxp6d3DEY+qhFmESzwGKUopURGvQrSMnvb2ScO38gMiyK3NEqKmRn?=
 =?us-ascii?Q?mjO3hiiwS+OkSuPqEJamL8T9TEtpUw1OsDW9E6SPXSGKuaoMxHeflf1t50/n?=
 =?us-ascii?Q?y+4L2r2DDsN9D0Kv7mT2I8xb2VrAo4HNK6FfNIgkQUUDTEpsLWVnO68xizHq?=
 =?us-ascii?Q?c1/z4H0EDwMRMIZVZzEN/jFweVm/vAhk/NA7hYcT6ixFjN+HjML4PDkpV1xl?=
 =?us-ascii?Q?prFsD+nNEZFEShh3pFjUKykg03QEG/UvaKaZhEkO7ANML3fSpHaKt1X1oYrd?=
 =?us-ascii?Q?gt1TdMZFq2heD+XoSXMGyxiuJG/hakht1QKMKb8mXRxRMQ5vna4cn1C9O08D?=
 =?us-ascii?Q?HflvJNq2rHm1YgfhPfe0cueV16mOC5VcULZ9EOUg55sXgQoLfv65x4cjzJ6y?=
 =?us-ascii?Q?mv05DgRYmWvBQlIr/gnvvy3lGQS2TD/uQSFqTzvBsOBgPT04PTtwuL5BUNGV?=
 =?us-ascii?Q?SZNsuTpsKCX8gk8cesbpFOvVy0MGnqhH6HjFOQO22mKteFqzspGxckMJMJbE?=
 =?us-ascii?Q?rJyp6U7FVNS9SmMofes7h/u1p+qpu6AsXqKqqwJ4HRiJf2g0qO7bXdlqET4j?=
 =?us-ascii?Q?iQzGLZhegiWAxXdoaMg4dwVsw9i7EB01a6qM+pjPTJaQPMEdtfsMGwzk6kkv?=
 =?us-ascii?Q?yI7Hw8LTzqOEl12/fuys0LPoGsPH2adEeCwgIgaj409GYQf2cqkRKx6hIdXO?=
 =?us-ascii?Q?MVXzN3R54elDg+VffmvfBGoBuAI1A25X2AcPf3IpsOZhoDuCmTbcZh8TwWn/?=
 =?us-ascii?Q?QmdyDTr/ziQ1ReDQAjGUTulfRzHi+m3LlggOWid2d+3/rX3Fl+uggefdG/TL?=
 =?us-ascii?Q?qd4tRALdR+CY3Ekf+JbwUKnFLLO0KnQ/BB0tOizZG0YePxnQ1NcS7mFvj7ap?=
 =?us-ascii?Q?ZTQDjs4TC1H0N1lCRYzNyn9ahW64PAS4UR48ebPWkr4m/rrvHxVhX0dbI0uQ?=
 =?us-ascii?Q?N10o2H1NL/GDXoswBbtVLHzJy7KiNuTTrK/dS9HFNuUOjovc4hd6D4SbhKGF?=
 =?us-ascii?Q?IrnAgLb9LMGdAvKFfyz14Ns3HLwEPTRV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MGIHdpJ2omqTA3jvHFoNv+e/ROv7JWEzEye147fKMsVw05DeYjPmBXbkYNWH?=
 =?us-ascii?Q?hHWXwSLH+65XAZvEXCkG3MOrUExItwj4+FQxLGEn454Z9MvFWEv+BHAl81im?=
 =?us-ascii?Q?uElkBC3YJeyikAjKiwyE77mOxUx2wcjnYPoS27FyyVkf5KLC9sa/KsAtVtRD?=
 =?us-ascii?Q?VhqqD7z778Al2OyPVPui2yBfdqEDjeZqQr84RE0HcG/W4vrc6Kg9w6UYTm7w?=
 =?us-ascii?Q?OGwSgByrmZMIz45xvsVea5cdEpXAA+lq0pw0yZ4jrwk/t7ec2TS9s75thE83?=
 =?us-ascii?Q?s4H5knMaFSbLDebLAlFXAatCXTPC+v5CZQAaIFsGFBhAizs4k1Kf9nifTplp?=
 =?us-ascii?Q?lpG4Cmv2rwn2QBQmYtgYBHivrst9VXBDsljnm3MoxQcoCXFHGeUTvaZl2CsT?=
 =?us-ascii?Q?bUxfOPkfwFTRBFmUw4oUeuhd5jvoatWi/KrN7A5xABKo8K5Q0FuWVqQd9Ct+?=
 =?us-ascii?Q?Yt+urhtfZsnxay2F85uGRC6GRpVWWvwMEEtdWyGuTJAqCF7FUy9MWd+9EOcW?=
 =?us-ascii?Q?FBY6JF5tgJ7NG6NJsxHPkND8F3fJgbuxeywKhUfJmOMeXnkRTPo0RzyvCFso?=
 =?us-ascii?Q?OA94hdi8Uqvg6EdtJOcz7pnVmP2c4IXpQuUagtsDSGfKsXtPNNvdgq5wrmww?=
 =?us-ascii?Q?KnemzIKhmZ7HkqLaUny6kHDBE/HC2QdAgQFBx7d+10eV2pcSFur1Bugs5/EU?=
 =?us-ascii?Q?/rEH0G1UdFKLwl6Iu1gN9cjFvdKqe9+bRqXb3bUoOfbR9hM4ULCyq19HQWYG?=
 =?us-ascii?Q?F3f8ibZF5qwa5prX8jErTu1laNh3J/ioHD+sAjIdcp2YjHjaNH+bYdruj2nI?=
 =?us-ascii?Q?W1/VJsNsLDnRQ1Y9aOFUmmUhfcmZcBOXtKtoXuB8FUU0QtE2Nmtka1/wlWJs?=
 =?us-ascii?Q?Ax2h/ehyturo8siDbgxrpLTdyVSajTc1IO5lBR5204yyBVdlMlSV9ml4eJDg?=
 =?us-ascii?Q?kP73ocrtU7KuDeWJt3Hhy1fvwgzA5nqbBVwor0pJcO8Y4T4QuYKzkrL6Drx7?=
 =?us-ascii?Q?Ks9LzC8Bc6rU4+Q+Agv4dKQCpFWt/mhpQaYoo+30wGaiXHBjSGpgBNiZRKHo?=
 =?us-ascii?Q?mTYzPrOlbqhJk84VXI3bmMD21jWcsRyIwFQnYdg6DIE2NsqPHQl9W5eA3WIH?=
 =?us-ascii?Q?HS2wkujKzFTCozVI5opc5tE9GgPQYHEpPgEpnzAf6JlhdVuYScHU3gbYhdnn?=
 =?us-ascii?Q?J2EFwlV2CIj8PmgzYgMONJ9MkmXVBIG5/+eUAD6SQKi7PM6uevfN6C5j/RZG?=
 =?us-ascii?Q?oDJD3+1l2ON9Jhz/I7ri6pfOLKVKInjGHCC6q5ycokzC3R6k+ejQ6v/ghPwV?=
 =?us-ascii?Q?mMUcVsdKwyWhZYdDisJT+EXv/LU7vcqnESgQN+uFmbPSpXug0N+0xQzQF6XZ?=
 =?us-ascii?Q?Man9RPZBDUQ5YJlAro3gLQxxIxLtJ/rLQ5lltfp6tfE5fQ3r/HX2NOpB/DiM?=
 =?us-ascii?Q?3+jF5Cf4ONT0NGmSLKb5fX2wZguV0B/jg7HcEvGh+NMQyiSo6PLUnOS5h9pv?=
 =?us-ascii?Q?uyucgWRcippmXQS3a3MfmQXvtyTpQcaKjtv8jWX291nxvBfU164wF8jbUI8Q?=
 =?us-ascii?Q?9TBt26EJmpeIzcQM8m9562p7aVqRyj7wCn/6jqguF0cXLTYLX3oC+gMFq7q0?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f6d0c8-b50b-4555-a466-08de1b0ccf7e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 19:11:37.0489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLyS+GOpTe2TuuQYwDbmNHqEovl+71ma6GCesqQP5EirRa1wHR5QS+TA9wCd9U+12jyIumC/reGdY2QFsk6u6bn/grH1zflzKNWJwPbBEqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9510
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

On Mon, Nov 03, 2025 at 10:56:06AM -0800, Matthew Brost wrote:
>On Mon, Nov 03, 2025 at 12:28:50PM -0600, Lucas De Marchi wrote:
>> On Fri, Oct 31, 2025 at 09:54:15AM -0700, Matthew Brost wrote:
>> > Add xe_guc_pagefault layer (producer) which parses G2H fault messages
>> > messages into struct xe_pagefault, forwards them to the page fault layer
>> > (consumer) for servicing, and provides a vfunc to acknowledge faults to
>> > the GuC upon completion. Replace the old (and incorrect) GT page fault
>> > layer with this new layer throughout the driver.
>> >
>> > v2:
>> > - Include engine instance (Stuart)
>> >
>> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/Makefile           |  2 +-
>> > drivers/gpu/drm/xe/xe_gt.c            |  6 --
>> > drivers/gpu/drm/xe/xe_guc_ct.c        |  6 +-
>> > drivers/gpu/drm/xe/xe_guc_pagefault.c | 95 +++++++++++++++++++++++++++
>> > drivers/gpu/drm/xe/xe_guc_pagefault.h | 15 +++++
>> > drivers/gpu/drm/xe/xe_svm.c           |  3 +-
>> > drivers/gpu/drm/xe/xe_vm.c            |  1 -
>> > 7 files changed, 113 insertions(+), 15 deletions(-)
>> > create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.c
>> > create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.h
>> >
>> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> > index b35021e5b9eb..319f208eb19a 100644
>> > --- a/drivers/gpu/drm/xe/Makefile
>> > +++ b/drivers/gpu/drm/xe/Makefile
>> > @@ -58,7 +58,6 @@ xe-y += xe_bb.o \
>> > 	xe_gt_freq.o \
>> > 	xe_gt_idle.o \
>> > 	xe_gt_mcr.o \
>> > -	xe_gt_pagefault.o \
>> > 	xe_gt_sysfs.o \
>> > 	xe_gt_throttle.o \
>> > 	xe_gt_topology.o \
>> > @@ -73,6 +72,7 @@ xe-y += xe_bb.o \
>> > 	xe_guc_id_mgr.o \
>> > 	xe_guc_klv_helpers.o \
>> > 	xe_guc_log.o \
>> > +	xe_guc_pagefault.o \
>> > 	xe_guc_pc.o \
>> > 	xe_guc_submit.o \
>> > 	xe_guc_tlb_inval.o \
>> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> > index e4852c4c90cd..44ed3202dfd1 100644
>> > --- a/drivers/gpu/drm/xe/xe_gt.c
>> > +++ b/drivers/gpu/drm/xe/xe_gt.c
>> > @@ -32,7 +32,6 @@
>> > #include "xe_gt_freq.h"
>> > #include "xe_gt_idle.h"
>> > #include "xe_gt_mcr.h"
>> > -#include "xe_gt_pagefault.h"
>> > #include "xe_gt_printk.h"
>> > #include "xe_gt_sriov_pf.h"
>> > #include "xe_gt_sriov_vf.h"
>> > @@ -638,10 +637,6 @@ int xe_gt_init(struct xe_gt *gt)
>> > 	if (err)
>> > 		return err;
>> >
>> > -	err = xe_gt_pagefault_init(gt);
>> > -	if (err)
>> > -		return err;
>> > -
>> > 	err = xe_gt_idle_init(&gt->gtidle);
>> > 	if (err)
>> > 		return err;
>> > @@ -851,7 +846,6 @@ static int gt_reset(struct xe_gt *gt)
>> > 	xe_uc_gucrc_disable(&gt->uc);
>> > 	xe_uc_stop_prepare(&gt->uc);
>> > 	xe_pagefault_reset(gt_to_xe(gt), gt);
>> > -	xe_gt_pagefault_reset(gt);
>> >
>> > 	xe_uc_stop(&gt->uc);
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> > index e68953ef3a00..529d2b3bec21 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> > @@ -21,12 +21,12 @@
>> > #include "xe_devcoredump.h"
>> > #include "xe_device.h"
>> > #include "xe_gt.h"
>> > -#include "xe_gt_pagefault.h"
>> > #include "xe_gt_printk.h"
>> > #include "xe_gt_sriov_pf_control.h"
>> > #include "xe_gt_sriov_pf_monitor.h"
>> > #include "xe_guc.h"
>> > #include "xe_guc_log.h"
>> > +#include "xe_guc_pagefault.h"
>> > #include "xe_guc_relay.h"
>> > #include "xe_guc_submit.h"
>> > #include "xe_guc_tlb_inval.h"
>> > @@ -1545,10 +1545,6 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>> > 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
>> > 		ret = xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
>> > 		break;
>> > -	case XE_GUC_ACTION_ACCESS_COUNTER_NOTIFY:
>> > -		ret = xe_guc_access_counter_notify_handler(guc, payload,
>> > -							   adj_len);
>> > -		break;
>>
>> this doesn't seem to belong here. Should that be in the last patch?
>
>I think it is in this patch as xe_gt_pagefault.h was removed as include
>and xe_guc_pagefault.h was added. So I think this is probably correct.

humn... ok, now I see why, but it still looks weird. The justification
in the next patch for removal was "it's now dead code", but there's no
mention why we made it dead code in the first place.

>
>> Or a dedicated patch for acc removal?
>>
>> I started to look into this because we need to add support for the
>> prefetch bit for xe3p, and I think it makes sense to add it on top of
>> your series rather than conflicting with it.
>>
>
>Yes, adding it on top would be preferred from my point of view.

will do, thanks.

Lucas De Marchi

>
>Matt
>
>> Lucas De Marchi
