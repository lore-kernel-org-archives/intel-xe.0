Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C287C02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 14:50:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3DD10E669;
	Tue,  4 Feb 2025 14:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jeJdq2ta";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B13810E669
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 14:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738680649; x=1770216649;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+iaMJbw/9nj4ecrixiavBaQfbGDMUkdhNDT2LYuIbYU=;
 b=jeJdq2taO7emRIQ/RjtzySGNwx8wuacnp7wqnYR96YfQcfuCbc738mgK
 GxPREdFqFDrc1GV1R+2v9kVCU3sWgXRQuB1/OFPgQ4xnC3j9v/PacekCV
 urj8vw52lVpu7/Kbw9PdmHBrhFKkaqPhuKxjkuHjEcQ8OqtGkshFr7M0v
 xqreQTGaynPQWjSP3/okmgmH5a/MP1Y5R9A5XfqoNOf73V/0P8WGyH4cA
 LZXzr9f8kjIvzmcsnbbfe+ar9AJrYoiEIp276w8c5Dd72Rrxtr2MkM0Pp
 HFiKdb6Fbi+MdrLEOC9p++EqoXfZQYhOuPEh4URfLW2pCiiXqImL7G5ix Q==;
X-CSE-ConnectionGUID: JBqL5NSyRRaaZknuvz7LSw==
X-CSE-MsgGUID: 8Qs/4P/cSJeq15BfDY5/Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50203775"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="50203775"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 06:50:48 -0800
X-CSE-ConnectionGUID: ezAlWrjlQ5uIzbrddSEqvg==
X-CSE-MsgGUID: yW6EgbMkQxWRf6n7YJqnwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="110788870"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 06:50:47 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 06:50:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 06:50:46 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 06:50:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CKjvzT5++zvLcT0heswPXYRoELd5k/00oRoe4JcybZAaV/5SeiyAjMStFFDeoy//BodyvAg0MHlIR4pMnXhCGdwiCg8Pa44U/Q5yjfoO/whlx+pDwLanrxw2rStpXONCQt6oP/y8MvgPv57tYXiUkkX1mQ7P4Wo1NpTvXErN+V6scjVmecjYerd30N8CHo2uvjNKn4cJ5H0CgcLKS/fAiStOsUdMUreBfiE1CMPlaTgaFtXIbsv2ZDMZfX19O3TAV5TCHB3G0lrKIXBQIKaAn5t/KYWa97A0vNeThPXkKUZRgtyQS8+w0wggp0p/WslriJLqSLVism9P3wwGLIGN3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnTNL2WNBAfQ/U/m0iEmpyjhvJ+iRA/FZ5VHoPRe7Xw=;
 b=AMk2vBVTelJJJHtOCHJc6XpPHDpYs83LDx/Pza1Cyz0lGWOLk8KIfSXdYks5FDJcHeSkF17AdMyKR3gEcpxzlsNFct1HCl6Dmpz1MIm1TTul+uv3VAIGvwNqLpKV8y2BcQGkPFMSqTyqNer3af3HSz+K4Uwtv97sydu0zAQei8yzpgKB1jxF2FbMP9hVyBI8KXcOar+FZV4iocP+6XVFcqm6LCJMb3mcSz2UhJaGT/2+NGyXQb21306u0LRgDn8St1trchbZJG33D6Mzk9/kviHK/gqItQuQJcueAzGQEDzJXCkotYlCcKngHciy1yx9W9nSrbtAlxqi8wZhrKg92A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7959.namprd11.prod.outlook.com (2603:10b6:8:fd::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.25; Tue, 4 Feb 2025 14:50:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 14:50:28 +0000
Date: Tue, 4 Feb 2025 08:50:24 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH 0/7] Cleanup error handling on probe
Message-ID: <juvslcazrixq4cy3ebiddbw7zwnpfah3mmaqu5qyclaonmupg3@x5l5kv4nuwg5>
References: <20250131223140.4144292-1-lucas.demarchi@intel.com>
 <37e94776-ea74-4fb7-ae50-ab999324df7f@ursulin.net>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <37e94776-ea74-4fb7-ae50-ab999324df7f@ursulin.net>
X-ClientProxiedBy: MW4PR04CA0280.namprd04.prod.outlook.com
 (2603:10b6:303:89::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7959:EE_
X-MS-Office365-Filtering-Correlation-Id: 68a40beb-da46-4eee-197e-08dd452b43c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PvBr0XEo1BcnwGlawPrqDY4HKAYwHz0byDHPd9n7cZY+nhomkz+11uJSCUGh?=
 =?us-ascii?Q?hLdgiN2mcvlZBgEo/mU2ZQPuMQbi6Sv6ygcUjf4u3nszQgd4k8tbOvBslJKZ?=
 =?us-ascii?Q?xhwiifmzVBYaeeNKnqjwwClCFWTs3oZN86D7ZoAMg2Hok3TElhW7X9j64c+q?=
 =?us-ascii?Q?tV2AEzbKjBzKPTpJHgLutTJinnWd5hJtXB9Bninot5Tney3rICvfSJyN4Yxw?=
 =?us-ascii?Q?qny4f/7DATqUpSqCbrGsvjFJLN/dlmN1t8VIwwFTD2ShbE6l3zti2MN8HuVJ?=
 =?us-ascii?Q?+FL06br/Zg1twGxEFQvrqqqvu3eeNuRR25f6MOwUXH8IWmDedjLUayK1Y5Uf?=
 =?us-ascii?Q?Lm85U3GnUFH7yQsvOAv41XyLTtU93pnC/tmqZjLx7x9UbiWvJPtVhrsIuCIE?=
 =?us-ascii?Q?PTOrE1uPkvn+1spBezTjxbf5rfqlKCw4P0E+rESjq1cYQQRmtxrQhcwE2Y1c?=
 =?us-ascii?Q?vOsuhB/nFmY/Gm6mSuq7ZHz+mZDn3CZ82IWW89tRp8+3xYxWgWoMsaB+3CSF?=
 =?us-ascii?Q?nnTxy9QD9MlNbWE7exZJTj85Uz4+CI688veUgc67ZfljXC4MWoWLSBevfQJF?=
 =?us-ascii?Q?u0Rrl7PP1rf4djrJ6H0gz1gq9IXxuRG5QvdrqT7neUmMvv5VHRbufEuohUQi?=
 =?us-ascii?Q?enA79MVT+tsQIRvN8iqLXfCnj5oO+uQAW3QJvL0SWySfjKyxiGUCzPQtmYYb?=
 =?us-ascii?Q?ujB50PRsxvGLEhHS2kHtgJ/jyRYnlxMsRSC7wwzRq/E50qj75UCL9HpMRVJp?=
 =?us-ascii?Q?+pnqHkUF5VlgC46dGFbeeVXxJaTVhnecWgRkxV0D+D2MzhqBoz9wjZYBN/8f?=
 =?us-ascii?Q?bPp2JdikmIV0YRjCv9VDhoWw4taXgRmrci9RIRdZ4nlkiH+vhqU+4wlj7yj8?=
 =?us-ascii?Q?ugoBzH0mQtsezFcWtB1AiefOSO8uMD22iJphQBRvmiuKRm79O8Som8qpnJNH?=
 =?us-ascii?Q?P0sgQ0zwxp2d6bEDSy1rcXJkM8lg8FolhWolomKpd/KCHEmXOhj9sr3cLsi6?=
 =?us-ascii?Q?/UiGfpRShjqx38L1xyzAzECujEH5ZKvy3Xn6i2zdxN6iBxWI5VKbwLJXkyhp?=
 =?us-ascii?Q?XIKXRQmlVmhI/iVVqdwdhwVBhvAgSGCCQXVPCQMkwEr5g4BeXd9A5jYyDLCf?=
 =?us-ascii?Q?ZdAcEmjAjiVgOP72tlBcDrcOl6ZnHQ2SGS4FKk9cwo9ZpoUCe4Vsb8jirbOF?=
 =?us-ascii?Q?sTfKXHoUUTKt73Z0t+tfLnEIGsnOnILmq8A/MflREWTWcB64u0jnsOR5ETeM?=
 =?us-ascii?Q?ioIO7eKVJ2a/nzXpSRsh42aLkwak3NkVbv3BUZPLjX424ErvXGf3rd+F2fdN?=
 =?us-ascii?Q?Ejwb9uGBdHFu+4uk4UT6krLebt7Xc94ZbqPHg9a2gndSngEySMfZe9iuSeOF?=
 =?us-ascii?Q?D7+299YAZ+kCNv5Npp9RFrU5jZi0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9042PDQVYoh8+t01zOVBF19kHj686jsgPUabq0OxP2WAXgs+PbBsge4DfVxs?=
 =?us-ascii?Q?T3A7WUXA8YGAZwAD9XHvE8Q4fcBRBweJkDpybCdXmIgmFCQIaoWy7OEVIxM+?=
 =?us-ascii?Q?YUyLgpSpvvVqjzNv+HKewurTJFwFcePSwgTjpl21lBeSHDLDYq3t5E9FvXa9?=
 =?us-ascii?Q?dG9aMHdBeSxVrcQBBoZm8QPZCLy3b2nbHyk/vSktHA4nZxBdDg6ilhyeXnCY?=
 =?us-ascii?Q?FadFzxg+Lfd7Y42xyuIooDrigtUXpfCZY9vNMdRRXEeJp8t/MFvht9HrqM9J?=
 =?us-ascii?Q?AvsRmT/oOWJhMqNW+bsCaIbpzKhDkaj1wOnaQCLY1GygGD7eAxNWKAarLQTw?=
 =?us-ascii?Q?Ht1xHsQnY2U6Wby6btlmcqUdXJzcrnT2ZOmaT0aRPT/pFp7wKKLmUAvzyqoc?=
 =?us-ascii?Q?8IWITLwI5xhv8Glcvcu54xmrWF+fzlgcc6Y7fLB8S7uny2Q8iuT+tuf0PV0j?=
 =?us-ascii?Q?HGLyBSVdf+ohrQ6SDhn7nW2VqKdv5tbhwHmCOO3qXa52WnNVpejVaIo8JMDK?=
 =?us-ascii?Q?osN3xYum5cEWglhPBNzgGa1rYQmCPXk3vlVA8oz0AHtawqADU/gVe93pHe5C?=
 =?us-ascii?Q?R/AUPBNskrMZw9Scd9LqF1EEcNvHg0oxbmVYYQu3vpOHEObKpQpCcuJFLITt?=
 =?us-ascii?Q?jUVhTAunCgdAAlLDUKfXOBeNxW70CDul5SLjZ4MoXlIo3LW1GZzjKgYbGSrB?=
 =?us-ascii?Q?oX8fAo6YOHhRjpw5tQ11BYN6reBH5yGttevE5WACVs0D8/UK9Ue7PGECi2p1?=
 =?us-ascii?Q?0NJnpaxdakcGIYfTunyuAx/k+6KS8E/0VfTwoH/JFtFW4IivS734sW9L3HqX?=
 =?us-ascii?Q?4hr3I78wim+GMeDlWNiGDZLYmJAZhHSPMrFfBW8sJPOLsqiY0w4dlFOx/jVw?=
 =?us-ascii?Q?Ikg/6E2fw+wCjWjDkCnLVYEQ7k+BMqimaBO4Xl23qmtKya0h5R4sglLEqVbB?=
 =?us-ascii?Q?XY2kWcYIGFvLq3nNrAqam9octfftVotAsWKlxj8BE7tkn1p7WQzbxOTFvsJs?=
 =?us-ascii?Q?pxO20JUMo/6z+uVBY16b3UeM7Ofilo31Ir22MX+aP4ufNu9g+LOx9wHx75pO?=
 =?us-ascii?Q?HNY8wH0jd8ZPGOZoGH4NyMHap3jBz0db1CnOMUedF0bdZ6w75lXQMpFWb9mw?=
 =?us-ascii?Q?qumVusq3IoguDA+ZfXB7d6l4kdAo8MyNKVZ6DvBbd/H/SYC7hBXPWZkap0Lq?=
 =?us-ascii?Q?Z3r7+H2kld/bvpKMljQt9aGAkDLFka1PwPcimdvv44PP6uwIKyA1PkKLoiSf?=
 =?us-ascii?Q?lXVbRJoFF5J2+aHY5bCyt5aNbr/++v/Yq6PEyu1wdQr4386bpSKqQUflAQBH?=
 =?us-ascii?Q?iVNWhp1/ghnh8Geh3VWlcJEUZZUhsquhYgKsQin1I4LDHmcO75xCnZ0Z3A+M?=
 =?us-ascii?Q?TcBqzyc0wOfOLhh+Dt+dgAAfe9Aa/Yy8H761LwrZd7sxKoSemFxZ8eh3uIwL?=
 =?us-ascii?Q?Z1ER4PsQPnYQ2PXcG76seq00/2wxG2srlsE7u4nOYjuBXgtiACJCZs0BPiD5?=
 =?us-ascii?Q?EffG+1XrAd3s4RoMBqgxLl8OYtLZqHGRGPAmibGyxQ4EfKHCOREZVA5bbBGZ?=
 =?us-ascii?Q?RdE7JhR0U7cOicCDCEy6SX2e3R6qjxy64Ddx7J2Bfy9SNfZiWWGgJRpssszC?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a40beb-da46-4eee-197e-08dd452b43c5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 14:50:28.1352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aXhAZW5cJl8IN4NCFSrS9F/R3QXx5V9rF+Uc7dLw8qzuVXwggYldfX/MY+fNHkUZBjW7K5pAadn5FJOO0opwwF3MulxS9JSEdwdr61cQSC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7959
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

On Tue, Feb 04, 2025 at 08:58:37AM +0000, Tvrtko Ursulin wrote:
>
>On 31/01/2025 22:31, Lucas De Marchi wrote:
>>Mixing style with goto and devm_add_action_or_reset() is very confusing
>>and error prone. Clean that up. The only missing one is one of the
>>display calls, but that can be done in parallel to the review of these
>>first patches.
>>
>>This received limited load/unload tests on LNL and may very well not be
>>100%.
>
>Is this series hinting you are looking into making heavier 
>refactorings in the init code? Triggered by me recently discovering 

yes, I still need to move more display init around and some other gt
parts.

>GT-per-engine workarounds are not working?

it was not what triggered this - it was rather my review of the pmu
integration in xe when I noticed we were just continuing on a failed pmu
registration:

https://lore.kernel.org/intel-xe/lnvrm7guru3ujx7kt4irhvjb3wc3vcfzzhko3h5zkvgdig6znm@xb56nnaemwi5/

what's the state of your patch to fix engine registers in GT WAs?
Did you find a suitable place for that fix?

Lucas De Marchi

>
>Regards,
>
>Tvrtko
>
>>Lucas De Marchi (7):
>>   drm/xe: Fix xe_display_fini() calls
>>   drm/xe: Fix error handling in xe_irq_install()
>>   drm/xe: Fix xe_tile_init_noalloc() error propagation
>>   drm/xe: Stop ignoring errors from xe_ttm_stolen_mgr_init()
>>   drm/xe: Cleanup unwind of gt initialization
>>   drm/xe: Cleanup extra calls to  xe_hw_fence_irq_finish()
>>   drm/xe: Move oa fini to xe_oa
>>
>>  drivers/gpu/drm/xe/display/xe_display.c | 22 +++++-----
>>  drivers/gpu/drm/xe/display/xe_display.h |  2 -
>>  drivers/gpu/drm/xe/xe_device.c          | 53 ++++++++-----------------
>>  drivers/gpu/drm/xe/xe_gt.c              | 52 ++++++++++--------------
>>  drivers/gpu/drm/xe/xe_gt.h              |  1 -
>>  drivers/gpu/drm/xe/xe_irq.c             | 14 +------
>>  drivers/gpu/drm/xe/xe_oa.c              | 48 +++++++++++-----------
>>  drivers/gpu/drm/xe/xe_oa.h              |  1 -
>>  drivers/gpu/drm/xe/xe_tile.c            |  4 +-
>>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c  | 17 ++++----
>>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h  |  2 +-
>>  11 files changed, 86 insertions(+), 130 deletions(-)
>>
