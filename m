Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6895EC27C79
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 04:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8F410E777;
	Wed, 12 Jun 2024 04:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bSkgiwDu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F25510E779
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 04:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718165803; x=1749701803;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZpoNn+MlELDjkCkuYuB6ZcMi0INs8vN53aE+AqLNWPo=;
 b=bSkgiwDuhO+9ebsxggwB3VWRmixvpW1MpInPOKflffW3ZE8CSsPfqM9h
 zYKGrYlvt4fJfi4XLScgOoJekeR9VYxNwVd6ZIgC8eR9wZD0jdTy7sidA
 OFt8LWC4dqNusvyZ9B/tIrwyq18RaM2i6GUUcVA8ryWZCqlRdQ9D+hVgb
 vdy81rr17AdfeyYWXI+BoHuI0JbIrLd1MMWM5y+aWkZ81bGGbL3tTmGSa
 /Zac+QV3mL0SB40EZOh3Jf7pWyJW+6Y6IXB3WXeYmHnZ62zrjAzW0acrM
 BW3te5JFZWjlfhZ7fss0895aG8WOHY1jxR29Bb6PqrVG1eumxA2mX3vDK A==;
X-CSE-ConnectionGUID: yj2W9sw7R66rD0ObljFSHw==
X-CSE-MsgGUID: 1C60jDzwRvuGOM2sgaE9Kg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="26318965"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="26318965"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 21:16:43 -0700
X-CSE-ConnectionGUID: 6oRV1IxFSvC2Vwi44VkOhQ==
X-CSE-MsgGUID: SkwRvtLoR5GKELRPm00gIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="44567289"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jun 2024 21:16:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Jun 2024 21:16:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Jun 2024 21:16:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 11 Jun 2024 21:16:42 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 11 Jun 2024 21:16:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyIsh8peMikWo1M3SNhOZYK8R0Yf6GEkzz3yrW43abTgoPNOMBFkgOPJNehWU6jKwqlyhQr1oeQAGp3SYHIv8S6Ncfty/SIv6Wi+j+qsH9H+IFxnSgjQt1ptQevBtjeV51VRpK8sHZWO0gBMKqLaalweNbMV4bQAerQ35gGZNOn9QxL9cbD8D9NTZYAUqFYXBFQpR+Q/1H9ZkmmkyFW6KJ38Caxs0YokaW6VJZVslVJMQOPfvAlDE4+/TAMTFW86yLvANdDJQt14EvX8fvLYuC23L0pY1J3PRpbLPaXag6LzE3wlglLzwE+CVHD0MzWODUoyok8Kd5ix2hC9iUYrrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZ+TVDXv8dq8ednV+huEOqSYnvA7L+h+PQS1KtrimYs=;
 b=Pj/H2vmtnpRzRAT3xf8IJh170yG2my96dQdz1LIGFFpLW4GIgZh7NUViF1p8mCuIDThVsnKUp5nXnbyUi4c8MQBAxffyye7hTLiuchjNCXNy0jlsgJG6D3mvqi209mrwo8nYVtokHLykKOGjq26hvwjsz9S3hKl5Aoy1Vkbl4bWl7D81gSP8uMxvhGUAR1mdVrco+1R93p8EmIuwLIhIMVQLlOxWeFJWzuzZrf8PP3u5javOhLczw7eZd3C1sRcFtrVRAwkwLNHRn1kBmn1WQrtDaObJm/MCiFaTU+gr7TbKisYL2SjHxIpYSUU/7WVJIKnGVMq8gzPpqUHbvXibUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB8288.namprd11.prod.outlook.com (2603:10b6:510:1c8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 04:16:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 04:16:35 +0000
Date: Tue, 11 Jun 2024 23:16:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLkhvb2tzOiBmYWlsdXI=?= =?utf-8?Q?e?= for
 drm/i915/display: Update vtotal math to address 32b build
Message-ID: <35u4zmo6me5wmkzydee5tgpe32rth4rcdwbttnih4yemxafm2p@pgkegtyl53bx>
References: <20240611183208.159878-1-mitulkumar.ajitkumar.golani@intel.com>
 <171814233104.67160.6988680871809020321@a6498e030952>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <171814233104.67160.6988680871809020321@a6498e030952>
X-ClientProxiedBy: MW4PR04CA0209.namprd04.prod.outlook.com
 (2603:10b6:303:86::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB8288:EE_
X-MS-Office365-Filtering-Correlation-Id: dc9e0724-6a9f-4755-a6fb-08dc8a967261
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|376006|366008|1800799016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hHX2CBWJFuVkPAdyBEcpjhA9gH/MGfJp8UBoSNol7WvUO6ZuuL/Az3VjL1vH?=
 =?us-ascii?Q?fszrHny7Trw0k6cmorA5ksKE35rAQRwQYEGv3tB+4ixPf9p2vUhNKBlrPp0p?=
 =?us-ascii?Q?LufpOt1VCgWEK8f+26UxyzfFvnEMvdpSDQeC/J78t3LLFTNfGIUBjINYFmYN?=
 =?us-ascii?Q?FGHaDOXNglLaaADxVVl/lJ2ttJIm1O4yF0PdKSoq/I9vSNkqPTK+DFeqDJnV?=
 =?us-ascii?Q?uUkPE1h8zO6TJ3NGQ9zP5t58/OKxvcR/XhgggZ2+MIjK2LdujcvyUvV6ZH4N?=
 =?us-ascii?Q?zauQ4U7/mp0jBJP6uWlZPUQQL4UNHbLpqZJTWEnjoSLwBx5uKaNdbEeV4ON6?=
 =?us-ascii?Q?RxjEWna12+oDy6A8lVI/xYlp+7QsNRih6kj9q0T2lSDO2QLxDRguXwmubsal?=
 =?us-ascii?Q?KzSMiz28OWDQsYY0iJ0U/gWNTwWsocwkSBYmDaJpP+WjBq+6XR9dBS6PU3/Q?=
 =?us-ascii?Q?tMyW31POZnHaircO0LDeXJTk8d6R7ohhw3ctKiJwrAMDYh2aCfm7OCCDk7ZB?=
 =?us-ascii?Q?BBWJCcwysg8eF5eqGyb0+iBSsf4RZ10tGjQihz6i3/qE+6TaejPgHxPjpjJx?=
 =?us-ascii?Q?4vBXTxLkXlqkodqTAHOoKNkdRxDX5j2czQQr0YqCYNHxxWTlUkKJegCQVfOM?=
 =?us-ascii?Q?k+PwaxROUdk8WFprfG3hE2sTdxxIvcbQAdpPchXWNeMJ9fbL2D0x092zYjkd?=
 =?us-ascii?Q?4ZmcMnPauKefuxTYK8RhwSYT4xRDT9N8dj0dIp5e7Z1Jn+0W7WGKem6PSg07?=
 =?us-ascii?Q?cNppla0sVr9FCamtnmHVhSKlcW8wLNtd9SvV6JZtB+/chqnob8w0Y9vRcxAT?=
 =?us-ascii?Q?XmwY+1NWd6xxE3mU9RS+goXsUrkkqWvD4a2LnMHZCW1/mggWKvuUqOK3AHcz?=
 =?us-ascii?Q?nfNioqy0MfUGXBt1q5DPkyhzVR+ADjc9+y5sYpp7zbuN9Wtogxm7ws9TYHOv?=
 =?us-ascii?Q?IQZgBpT9w7uUDmNcmSWQne7DKYp1pJEaZxzkU2j1HLuwV5nqkAM8j8sKRAOo?=
 =?us-ascii?Q?SUFMhGNPvFn3dWDRooPq8Al2ueus3ndezalxmGLdWBjXAJdrzjQljESttq6H?=
 =?us-ascii?Q?8eaVSue0jlbIbGrvATCw5g4NG4XneiOduFaXeQuVsQL0C5Y5gXWFPPRDtEc/?=
 =?us-ascii?Q?N6BP8SYsBh7x/kfxeMA9agfQXu5ItKfiSgRKUL8XkQIulZRu8H9hP3TS8ycs?=
 =?us-ascii?Q?7PD30jug4DBQViQ3pNEVPRZpOrNBeUB85qxzbJkYKYkVD9NINJ3JHDGKKGat?=
 =?us-ascii?Q?wk+dhD+6Nomlt9qGmueH3FfcCMuYQfTWaalK8XCG8Ct8GwjPxyfgSHN+6gO1?=
 =?us-ascii?Q?E0Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(376006)(366008)(1800799016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vdvo8cZNdOE8x0Z7Gtu0B1P2gXuyQTIFIQO3S9YwEZf9AhWCawRMsKmyY6VI?=
 =?us-ascii?Q?qm7g4eRDFQ2++fb2fYtQwXuflaMMC0lZIu8HHG/+Ij29N0txuMlsBoq/lcv6?=
 =?us-ascii?Q?v1W09GsbJLmTjmVjRiZc1xPU1POdo2D+VnSUYHZtG/TwRETViorHoXL6HD11?=
 =?us-ascii?Q?R0D3p1PJCXy2tpCeTwTXHrmj/ccLWmXzrHZhxenCobkFURV1D2xeji1ADzKR?=
 =?us-ascii?Q?Jn+ibam/4kZnXApW6ggMNTz5ohHncUinNru9lpJswonpYMkwyWaZl0IWL9rX?=
 =?us-ascii?Q?tLua6RtvLWrj2+rXnBcOMNjDlkxmDun6XqgTouuTQDUvledk2D7BRvnhcst4?=
 =?us-ascii?Q?XmI3sgc/S4ihb14le4x7GzfNOxMXXHYxMISDMz9wan/ZeuDaIUU3K0mAmEqG?=
 =?us-ascii?Q?kdTCBqDe0ZeAneozjU2ryHqoHr54BtRemuYPnzQg9D2exRsKBDM/tB2zGgml?=
 =?us-ascii?Q?jJRMrHMfHfscweNagMx0Pz7rnIOsy5NmBx9gH15LGHH8ih9EPa9pw8nLomIl?=
 =?us-ascii?Q?H7vt5Z/vO66uSjZFoKCX6Ei5iRNwsto4qlHFM34U7q6BOHpdOCUmW7GrOPZZ?=
 =?us-ascii?Q?rKFdlfRqtjaTSRxkXHPo1me0vmzrlhzs1XduLaZZFSTl3BXD5xU/YzrnYRmS?=
 =?us-ascii?Q?y945kXhePGMytL/Ivj/jpTSmoOEpsBjyOl7l4fgbfgSbMrMw3AX9VXtxf5tw?=
 =?us-ascii?Q?wc8NfJCiRePu84FHkkoLVM+Djn2D9R9uSmlFox+E6eWNb75jgRS3GKMtKRsn?=
 =?us-ascii?Q?xZX8VZ65S2lZdvmH0/Mxh4gPHYGDcw1DBN44UjY4mpYRo3tLAA8AoL9bE4LH?=
 =?us-ascii?Q?hykoCtgl/KvvTYD3DjRdOwZ15ug1jFutSoHsI92hseEc9loFdfP3alxZO6Nu?=
 =?us-ascii?Q?DbOnp2l4sFP6eZFtyNxLmBz3V8zDgpg3rR/4sCxiZIo5I2XBNAv5k5roIA7l?=
 =?us-ascii?Q?jw7ZH9ZvAuhaept1YoAvDSNl1Or4Soxu9MyFWQuUKu9rgSCU/ILXTtrxhKfa?=
 =?us-ascii?Q?3p7kTIcOUNpLfPY4Z3QfqDLRyhzC3dDovuMJRIYK+0rnl/aJaTuMO6nZ1dpo?=
 =?us-ascii?Q?0PJYLGljUXDKFkvNMfPz94/SHLPw6+ZaV4bwGsmynYsaDHc7MmO1X6rxknZ6?=
 =?us-ascii?Q?dtW8TLtXviWJ2OMbYbADFmf98j+A7xaB2mw82tpf6LMiou3Pavttu5ToMACv?=
 =?us-ascii?Q?tAEyYlLlUG68dsPWjZ5HkKOkQ0hrlV5MpHA7TKSggpDqX9trbWuyx27uodZp?=
 =?us-ascii?Q?w0QYSU7eYEU/wHFzMwCoLlEQk4Q8y9bO/gkgp0LyyU2gJhR7KRZS3dTsIkcC?=
 =?us-ascii?Q?F2bbzlM2iiNOr9SoeaTiGHlU5BF4g+cUUkmvHxxbRTcbBk7Y828dd0jZCPVo?=
 =?us-ascii?Q?K5B+3EG9FjoseJOG/qeg+CtkQT4Jns2H4GS41hyqRR+9enblwr5bvriyW5Kl?=
 =?us-ascii?Q?p+usYDsiEm5+KSL7Zv+RMtSkp0gFFRiK3mtB9N+0lfhqovdpWq5i+++1B7kr?=
 =?us-ascii?Q?C97Xm7ySG4NR7f+t+P5uCC1UpdPtH1gTy9JfUFCjg5iF/zPCdjqpIRxJ0zyo?=
 =?us-ascii?Q?Ni+MKjj1r+rw2c0FBKMhxbMZiBA20QS0zqxAdTM9JntnZ2urFGuSqb4MAyi2?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc9e0724-6a9f-4755-a6fb-08dc8a967261
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 04:16:35.0532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2AHlW70L9MeNuXdKpgwoX3/lzbu91xx2VQhakK0TXg6nghjURx9SEExEm0qQXIqvMTaoMt/wJyrWAxSjMNuXozMFo3OEsnm4i4XoQhzXBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8288
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

On Tue, Jun 11, 2024 at 09:45:31PM GMT, Patchwork wrote:
>ERROR: modpost: "__udivdi3" [drivers/gpu/drm/xe/xe.ko] undefined!

still failing the build. We either had multiple regressions or something
is still missing in this patch.  I bisected between d8290595a1880e7c47cfacdda8a06423188065e9
and 261984b2468b it pointed to the commit you are fixing, and it indeed
fixed after applying a dummy fix on that commit.  We need to check if there are other issues
introduced recently.

Lucas De Marchi


>make[2]: *** [/workspace/kernel/scripts/Makefile.modpost:145: Module.symvers] Error 1
>make[1]: *** [/workspace/kernel/Makefile:1886: modpost] Error 2
>make: *** [/workspace/kernel/Makefile:240: __sub-make] Error 2
>run-parts: /workspace/ci/hooks/11-build-32b exited with return code 2
>
>
