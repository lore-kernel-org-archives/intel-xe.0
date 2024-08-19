Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF2FC3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 21:39:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D07810E00F;
	Mon, 19 Aug 2024 21:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HmhnzF2N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E5D10E00F
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 21:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724103541; x=1755639541;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rszVQxa2kqADHW9gRFc8W5grU5HRGwbjh7QR8LNkyRA=;
 b=HmhnzF2N79FoItGceZJHzJXtWf2iRaDIbGdHOPcq8q2vWlmdoQXxBku6
 Hz/r+BH+JbDQEws9KftZ30pCnWxixLC4C82xXgEoZpDp8slP7+d+yamqK
 airMRzv3JViqGxZNcP9KorG1XSCxtxFolo2axnAvwatOfW1BJFWulEvuo
 E9TAq8rwaISSQYhY1715QxtWJKnkRD5WqBgu2aeFNTmnDdPg4P+3RLhzL
 2etebT4PBRo8HGhIG9dKx9Z+x9MOAwP7diGRZAMHSFBYN+vQHUXkEg1Pf
 Jd8B2d+kunEwTNAoveYMcygAPJ1OwVjLLAWl+01U4GzkUKlrtx8x33SO9 g==;
X-CSE-ConnectionGUID: 929XGC48TuGPjW9A4J7UGQ==
X-CSE-MsgGUID: zaZMGgRqQmuXMg5WnZSSDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26238280"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="26238280"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 14:39:00 -0700
X-CSE-ConnectionGUID: 6+R4uId5TC6bITthepd0Hg==
X-CSE-MsgGUID: KC7fQhVlTK2MV3D/CmlytA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="61276069"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Aug 2024 14:39:00 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 14:38:59 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 14:38:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 14:38:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 14:38:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+QrvQuUE9fOzErqe1vpdaYGcddOa6VqU4SQUCY15tmg3S6K+m6bHJMrsJNZr4hBssIuFDwixz0si0bGEFiVpOigAbSh+0vxkUnYlvzNl0hmo4yu5IAKxO3TK/Dk76Yv2ymgkqgToEEMa48jzjFtDAQ6doa1s0iW2xKx3Sa1dwDMEvG6jMWfcFL2tS+WVYZu7G0LzjGrACtDoeutiE3nctfmYtzLbQIRN0MmlaL1czxqrO4ZyO2FB6xfXV0l7YZS9TMT+TzZbJxKX7jAgDY0BJcwq+bkqRQyzttEj5S2oj75U8RAQWdNC8083l47VzhuuM8pTQvxVHQrDIHy86tTRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tw8pWFQGM4zDOWyg12I5GbbaoqoiclKkMY7AKiZGTnw=;
 b=gaClu+JaARMLbDDG/bH0buGQgpl4+h5JRFzgNgFmUCxHbFxMFJJ7v42WA5jFFwFS8OR2h2bXsLGpw/Ee2GLgMyc2rrSwlQSEB7YjR3kgBek7jX5Nc4Mbp60VBHE6/UxoqOIyFYKdxFfSJQtuOTGinG5cqwpSG6zv8R/KaJontBUT4fQAkdPFuOUCsHYdu2CynJ4mvo6eTZNI/pP0jntO+QK3cj0oTV6lnKVePugJoXpY5zh8cwTShaGb9Zomb6U31GBFTuGhZQ8Iu2WZhKHFxlS2S3v62Duvv/iFa8yUrH9FraZzzWL5k7a37R8yNYEijaIKjGBgFNdAeZvmQn/yHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB6423.namprd11.prod.outlook.com (2603:10b6:8:c5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 21:38:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 21:38:56 +0000
Date: Mon, 19 Aug 2024 16:38:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 05/12] drm/xe/tests: Allow deferred function call during
 KUnit test
Message-ID: <7x7kzxucmjabvmoxb2x33qcp7gzrvn7ga2gg5vtlrpipntq5rr@pdahgmswbk3w>
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
 <20240809165159.662-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240809165159.662-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:303:16d::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB6423:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d9a39e6-d0f0-46c6-85b8-08dcc0975449
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Eb3rdCXHyo/VqIkEPax/fQpB+fzNW7ebVXO7CCEl3pDZEYYdDz7GrclYlNL2?=
 =?us-ascii?Q?Y93aZ0x0EWk5uXzeH+lNyTxle2XVo9ubUsbHC/KFUVblAZqHQuOLxTR5Wdeg?=
 =?us-ascii?Q?Efb/ZNaxwhiJXAASdBrnssDSaJvshgA3NusGWgzcUTXO5pGH3MwCs+EAyU7E?=
 =?us-ascii?Q?FXDoYD8+SOzschk4B90EFhXgh6JhtG/aEK+AVV08wqFByYJbBTA1LUZhHxqm?=
 =?us-ascii?Q?oAm96CZkGHGVufHRHaMnkNzBDDRBFUMCzwFGOumHmyPuLaUKBY5PI9Lu9wHV?=
 =?us-ascii?Q?oiUwctejAPevXnmZO7IgkcQ/4qrgdPseFBTMww7SXAXYJLOb0IjFeuyCm5sR?=
 =?us-ascii?Q?eoqsDGfCymo8TRp8rR5i1Q/J6MznfpKionmlkcPfPE/SbyokTmDZuS9H2Odz?=
 =?us-ascii?Q?k+MTKeGCJ9Uy0XUSpEprWPiNj3vnh9giluzMaONgv8XQNkzpEPq1gMAnCdbl?=
 =?us-ascii?Q?3GaGXhXnDWjdwGXpWZ0vKIOEOhOTYw9bL2PzVuphWg7nDcGLaCwWz/WGkKAd?=
 =?us-ascii?Q?smwasJIfaDQbv8XTduuS38OrHcc1MKODaAXxUywQs+qmIPGxacu7yFJfcQeJ?=
 =?us-ascii?Q?pbDLXBYZddiPOmgdS466V7Qw3VV0gfS65lR0u1DAXfuprOPECtD5d4/aOC76?=
 =?us-ascii?Q?7mfkGrLBIkjD26YKDEIiYuXLx0WTT55i/UEAtLWOEZdP+wFFLboEJ3FoRmNh?=
 =?us-ascii?Q?xYegrj3eEUwldC402dKYU0Vk8XxoT7xMg7UMNls5YGmWDtMeSlPQCljoEde8?=
 =?us-ascii?Q?QUh0sRkzOEAQzTHToyd+d0x4Jz6ceNs2WlEgn7Z9t2VHQ9FX4Sr3H4EPZ9On?=
 =?us-ascii?Q?ZcUqwckzyQCkhCG8T4ZN9pDwvQ18jJ+4UAuLD6wvc2xyvz6IWQ6d5iOrCfeZ?=
 =?us-ascii?Q?rdCJ0+XJ/GSTI9IqGgIKRyYSIgAk/mqWI/6DQ2wjbgrPjgRGrVzxp62FaAJ9?=
 =?us-ascii?Q?6iUMOPGL4L6eNdGPFy9iNg3W8YSa9ZBOEIMD+G5m5e0MDTWmwxJK8/+oM/M4?=
 =?us-ascii?Q?8+hfrG7+jSriD0zRpFBRngrLHxsXFL7bhGuPAGGmSANMlqJp9n6uPC8occSh?=
 =?us-ascii?Q?1lIVUPcBp8C8/VPf8BG4tIAgcJUlb3rmRj3fPKneXi/pjBgeYyuSZYxrHmED?=
 =?us-ascii?Q?HkZ4ASxIl1H/WZ9tlGlf3fxWZQZ2PWVlugKCOabUhfy6xAZx7VqoCnW6Aluh?=
 =?us-ascii?Q?QHu6n6qMNs+uvIguZjKjsi2Laj9rPh3I9yGgKyGgMUiL0DuRybFl+J4DbaKa?=
 =?us-ascii?Q?5TULxZvNbWHLki9HYZt4DLw1VnIIhHbjtpyu6NuKfYhaYE/AVhgrwz6fZpQk?=
 =?us-ascii?Q?bsVvCOjw/Td+MEW76YfUGEQfE3pOKcW23Q0BYhJ7pJzmtA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vApgnrxODJu834KCvmxSTYvVhlUJfMX3Ci2/690qczwMIYyWv9QYVf9dBNE4?=
 =?us-ascii?Q?5pZW+uz9uoHpVuM9F4jvnUYNtHtUXc4tqNujvi66n227bX4UnKF6TSdXX2ta?=
 =?us-ascii?Q?dvhL3K6uRk62eN7ppCCTwh7VwSqP4wgqT2sOoNAlxSi8R6RlHxmFBO/gNpmp?=
 =?us-ascii?Q?YI1PMeXMc0f9yA47hR7oshrpeFKv/Vh7f/2I6Jw4IeWDSidxZK5Wai0HhNBy?=
 =?us-ascii?Q?Fs2IOhAy1UC7GoxcwDQU4cuiDP6iKHl9H2Q2kFM/PfhLrbCAo5o8NdNr1fdX?=
 =?us-ascii?Q?x4s0Nr0dudvtdC3lA9q4DFUw7MDlQKNTsmwzZK6PEpHaWyQ3zZlMBfuOcvHO?=
 =?us-ascii?Q?0FfktUG7KEwiwe1VePO1SB+6IJrviiNHxtKrkcNbL5PcckOneK6Ki2SyprHE?=
 =?us-ascii?Q?dw7E47DrXVWReFZcypA8j1uHqZZ+M53mlaqCowjH7aIom72SSvag7TV+w/Al?=
 =?us-ascii?Q?13ZFIXt2FnVQRTxsaOa+IBcicpqcPr+2D7uZd/XTwO10x+zH3337lKrAqETi?=
 =?us-ascii?Q?41Jigq79w2+LkLYcd+dL0XccjW5QXtKW5I6kBF130QFkHJQX0FxpZhVpLpT+?=
 =?us-ascii?Q?MLm89uw2ZHJe9H5++SrIJZErCvvp4GHKnFG+QoKv9VhVJr2hE7RJnFYR6d/5?=
 =?us-ascii?Q?sKSettQ+u7c9lRSoav8tfIBlPQypNfetug8tnwZS6bisnmFHUYGgXmah/Jb0?=
 =?us-ascii?Q?1aJARYjvsuh8+7SKKaZknvYPver3Sif6aidfOrol+DbZVidpWVWuchjIAHy3?=
 =?us-ascii?Q?wNwkx0cz3PB6tHIi6RN5ceLfrjZVaoXAeKbP+qXGsFdUtHSgRS81XbZZMSjT?=
 =?us-ascii?Q?wxAXwz8sIaVX6SN1zlqFG3hJ/znaleU+p7L0tITcLlKLezfamvRYZJlXNxsZ?=
 =?us-ascii?Q?yc92DnFvv9T2Fxuy3pgxog5CE5UNQzQ8J/2w/129NCA/IzaGR1evyR6TeHf+?=
 =?us-ascii?Q?vaub5UZOXfmzv5pAGFYCkaI/Nxzjj0ss553O81xu1TK8Ewl7z30yG3KLKiFM?=
 =?us-ascii?Q?MtKrEFN4ysQVhANU2y4MEP3/UHaw605ihep2shjiAG2sCd9i33MEZn55FXde?=
 =?us-ascii?Q?IhIp/q+/JM0Y+epIEEaB0eFl64S4JkAw1UZGFxdU1fgBXM5URgA3UKtxyN5y?=
 =?us-ascii?Q?eymy5+54w3bwhOtQW+m0dEfIkn1m+fg/q30Td35f7sJbxJuePDCEtIKbVEfQ?=
 =?us-ascii?Q?3DXwA1NoH2ybPr8uqxyYCPXe2/GdFKXeQwrktnRbg6kJPALGxRKbsnnJfjqJ?=
 =?us-ascii?Q?B5Cyi+WsmzkOXTrBuriPqPnbHYz4JR1CXWleHI4U6kRpG77UnCMRvDUxwvgt?=
 =?us-ascii?Q?8C2kaPXT2IIWKoXfo8fq1r7gRekZfeXpR7UOhJlr16kytl70KvGAEdp62Mgi?=
 =?us-ascii?Q?Nf39Q+gzLRFARjYwRepw71vFrxTsrGJ0+B9SFMAc5h1NgRI/FO70MMhzuW0G?=
 =?us-ascii?Q?uQ5m/4uqsd3HYet957Sme8oyE8UmDi9/0mh9hcXBKxqNCotLDe1OH50kJji9?=
 =?us-ascii?Q?zeg40Vxrm29oXOnecXuhuYup1CdSUm9/4LFOF4vPN/hhCpUneoi4+D1vwYRD?=
 =?us-ascii?Q?fd+KUXte5S2nHQR+ejRTTk2k/SeinGnJDkRM8d/rgg0I0+B5uh6pb9zrYt+0?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9a39e6-d0f0-46c6-85b8-08dcc0975449
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 21:38:56.7913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /NR+YnDXg2QxHAxkCggF/O6iDPvHMyZirzZJbtmh3NGHDuYH7hUQAd0lRDmPckcjn+tUiddNiLVqgv6WCTLT4mA4RknL2nY0vmYyR2AIHHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6423
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

On Fri, Aug 09, 2024 at 06:51:52PM GMT, Michal Wajdeczko wrote:
>For some advanced test cases we might want to simulate external
>activity that will stimulate function under test. Add set of
>helper functions to implement such requirement. Usage example:
>
>  static void foo(struct xe_device *xe)
>  {
>      WRITE_ONCE(xe->foo, 1);
>  }
>
>  static void foo_test(struct kunit *test)
>  {
>      struct xe_device *xe = test->priv;
>
>      xe_kunit_helper_delayed_call(test, HZ / 2, foo, xe);
>
>      KUNIT_EXPECT_EQ(test, 0, READ_ONCE(xe->foo));
>      schedule_timeout_uninterruptible(HZ);
>      KUNIT_EXPECT_EQ(test, 1, READ_ONCE(xe->foo));
>  }
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 148 ++++++++++++++++++++
> drivers/gpu/drm/xe/tests/xe_kunit_helpers.h |  38 +++++
> 2 files changed, 186 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>index bc5156966ce9..8fe1a0918b32 100644
>--- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>@@ -127,3 +127,151 @@ int xe_kunit_helper_xe_device_live_test_init(struct kunit *test)
> 	return 0;
> }
> EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_xe_device_live_test_init);
>+
>+struct xe_kunit_call {
>+	struct delayed_work work;
>+	struct kunit *test;
>+	struct {
>+		int (*int_gt)(struct xe_gt *gt);
>+		int (*int_gt_uint)(struct xe_gt *gt, unsigned int n);
>+		void (*void_gt)(struct xe_gt *gt);
>+		void (*void_gt_uint)(struct xe_gt *gt, unsigned int n);
>+		void (*void_xe)(struct xe_device *xe);

I think the only reason why you're adding this in xe is because you are
using xe-specific types. This could rather be done generically by
always using int delayed_func(void *data). Then you can simply add it to
kunit and get it reviewed there.

Also thinking that the example you added in the commit message is likely
suggesting the wrong type of test, that a) sleep too much and b) tend to
be noisy

Lucas De Marchi

>+	} func;
>+	struct {
>+		struct xe_device *xe;
>+		struct xe_gt *gt;
>+		unsigned int n;
>+	} args;
>+};
>+
>+static void call_work_func(struct work_struct *work)
>+{
>+	struct xe_kunit_call *call = container_of(work, typeof(*call), work.work);
>+
>+	if (call->func.void_xe) {
>+		kunit_info(call->test, "calling %ps(xe)\n", call->func.void_xe);
>+		call->func.void_xe(call->args.xe);
>+		kunit_info(call->test, "%ps(xe) completed\n", call->func.void_xe);
>+	} else if (call->func.void_gt) {
>+		kunit_info(call->test, "%ps(gt)\n", call->func.void_gt);
>+		call->func.void_gt(call->args.gt);
>+		kunit_info(call->test, "%ps(gt) completed\n", call->func.void_gt);
>+	} else if (call->func.int_gt_uint) {
>+		int ret;
>+
>+		kunit_info(call->test, "calling %ps(gt,%u)\n",
>+			   call->func.int_gt_uint, call->args.n);
>+		ret = call->func.int_gt_uint(call->args.gt, call->args.n);
>+		if (ret < 0) {
>+			kunit_info(call->test, "%ps(gt,%u) reported error %pe\n",
>+				   call->func.int_gt_uint, call->args.n, ERR_PTR(ret));
>+		} else {
>+			kunit_info(call->test, "%ps(gt,%u) returned %d\n",
>+				   call->func.int_gt_uint, call->args.n, ret);
>+		}
>+	}
>+}
>+
>+static struct xe_kunit_call *prepare_call(struct kunit *test)
>+{
>+	struct xe_kunit_call *call;
>+
>+	call = kunit_kzalloc(test, sizeof(*call), GFP_KERNEL);
>+	KUNIT_ASSERT_NOT_NULL(test, call);
>+
>+	INIT_DELAYED_WORK(&call->work, call_work_func);
>+	call->test = test;
>+
>+	return call;
>+}
>+
>+KUNIT_DEFINE_ACTION_WRAPPER(cancel_call, cancel_delayed_work_sync, struct delayed_work *);
>+
>+static void queue_call(struct kunit *test, struct xe_kunit_call *call, unsigned long delay)
>+{
>+	queue_delayed_work(system_wq, &call->work, delay);
>+	KUNIT_ASSERT_EQ(test, 0, kunit_add_action_or_reset(test, cancel_call, &call->work));
>+}
>+
>+/**
>+ * xe_kunit_helper_delayed_call_void_xe_device - Queue a function call during KUnit test
>+ * @test: the &kunit test case
>+ * @delay: number of jiffies to wait before queueing
>+ * @func: the &xe_device function to call
>+ * @xe: the &xe_device argument
>+ *
>+ * This function uses KUNIT_ASSERT to detect any failures.
>+ */
>+void xe_kunit_helper_delayed_call_void_xe_device(struct kunit *test,
>+						 unsigned long delay,
>+						 void (*func)(struct xe_device *xe),
>+						 struct xe_device *xe)
>+{
>+	struct xe_kunit_call *call = prepare_call(test);
>+
>+	KUNIT_ASSERT_NOT_NULL(test, func);
>+	KUNIT_ASSERT_NOT_NULL(test, xe);
>+
>+	call->func.void_xe = func;
>+	call->args.xe = xe;
>+
>+	return queue_call(test, call, delay);
>+}
>+EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_delayed_call_void_xe_device);
>+
>+/**
>+ * xe_kunit_helper_delayed_call_void_xe_gt - Queue a function call during KUnit test
>+ * @test: the &kunit test case
>+ * @delay: number of jiffies to wait before queueing
>+ * @func: the &xe_gt function to call
>+ * @gt: the &xe_gt function argument
>+ *
>+ * This function uses KUNIT_ASSERT to detect any failures.
>+ */
>+void xe_kunit_helper_delayed_call_void_xe_gt(struct kunit *test,
>+					     unsigned long delay,
>+					     void (*func)(struct xe_gt *gt),
>+					     struct xe_gt *gt)
>+{
>+	struct xe_kunit_call *call = prepare_call(test);
>+
>+	KUNIT_ASSERT_NOT_NULL(test, func);
>+	KUNIT_ASSERT_NOT_NULL(test, gt);
>+
>+	call->func.void_gt = func;
>+	call->args.gt = gt;
>+
>+	return queue_call(test, call, delay);
>+}
>+EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_delayed_call_void_xe_gt);
>+
>+/**
>+ * xe_kunit_helper_delayed_call_int_xe_gt_uint - Queue a function call during KUnit test
>+ * @test: the &kunit test case
>+ * @delay: number of jiffies to wait before queueing
>+ * @func: the &xe_gt function to call
>+ * @gt: the &xe_gt function argument
>+ * @n: the function argument
>+ *
>+ * This function uses KUNIT_ASSERT to detect any failures.
>+ */
>+void xe_kunit_helper_delayed_call_int_xe_gt_uint(struct kunit *test,
>+						 unsigned long delay,
>+						 int (*func)(struct xe_gt *gt,
>+							     unsigned int vfid),
>+						 struct xe_gt *gt,
>+						 unsigned int n)
>+{
>+	struct xe_kunit_call *call = prepare_call(test);
>+
>+	KUNIT_ASSERT_NOT_NULL(test, func);
>+	KUNIT_ASSERT_NOT_NULL(test, gt);
>+
>+	call->func.int_gt_uint = func;
>+	call->args.gt = gt;
>+	call->args.n = n;
>+
>+	return queue_call(test, call, delay);
>+}
>+EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_delayed_call_int_xe_gt_uint);
>diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>index 83665f7b1254..ec5287947ee4 100644
>--- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>@@ -9,6 +9,7 @@
> struct device;
> struct kunit;
> struct xe_device;
>+struct xe_gt;
>
> struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test,
> 						  struct device *dev);
>@@ -16,4 +17,41 @@ int xe_kunit_helper_xe_device_test_init(struct kunit *test);
>
> int xe_kunit_helper_xe_device_live_test_init(struct kunit *test);
>
>+void xe_kunit_helper_delayed_call_void_xe_device(struct kunit *test,
>+						 unsigned long delay,
>+						 void (*func)(struct xe_device *xe),
>+						 struct xe_device *xe);
>+
>+void xe_kunit_helper_delayed_call_void_xe_gt(struct kunit *test,
>+					     unsigned long delay,
>+					     void (*func)(struct xe_gt *gt),
>+					     struct xe_gt *gt);
>+
>+void xe_kunit_helper_delayed_call_int_xe_gt_uint(struct kunit *test,
>+						 unsigned long delay,
>+						 int (*func)(struct xe_gt *gt,
>+							     unsigned int vfid),
>+						 struct xe_gt *gt,
>+						 unsigned int n);
>+
>+/**
>+ * xe_kunit_helper_delayed_call - Queue a function call during KUnit test
>+ * @test: the &kunit test case
>+ * @delay: number of jiffies to wait before queueing
>+ * @func: the &xe_device or &xe_gt function to call
>+ * @args: the &xe_device or &xe_gt and other function arguments
>+ *
>+ * This is a helper macro that compiles into dedicated function call based on
>+ * the provided argument types.
>+ */
>+#define xe_kunit_helper_delayed_call(test, delay, func, args...)	\
>+	_Generic(func,							\
>+		 void (*)(struct xe_device *) :				\
>+			xe_kunit_helper_delayed_call_void_xe_device,	\
>+		 void (*)(struct xe_gt *) :				\
>+			xe_kunit_helper_delayed_call_void_xe_gt,	\
>+		 int (*)(struct xe_gt *, unsigned int) :		\
>+			xe_kunit_helper_delayed_call_int_xe_gt_uint	\
>+	)(test, delay, func, args)
>+
> #endif
>-- 
>2.43.0
>
