Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716B4CCD184
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 02:28:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B57010E6D2;
	Wed, 15 Oct 2025 02:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UndN8JKa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB34510E6D2
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 02:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760495306; x=1792031306;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wo+sV1IT3TsGWKpB2JUcNRzXZvQ0r3ojOLBKhjT201U=;
 b=UndN8JKaBCi45MjA30bOY4P3ks4a0NVy5rNxkr8nfyCejLZtOtHKASOP
 C+YXPzpEnGy3YBAbASu6/vXfsPLhRanZsdM311ZmEo8l12RLv5hI9qPRl
 9mquxt5/cnD+VCu/u/YoCxuZXRVulhrYHZNJkMXqQUFfkBhNte1yArndB
 JfXlzurdEtRsv7NOcMnSQEBdRtRM82sF+LZbpQD0D6JcMRjLIsbGFJlUH
 Cle4Y9JCVFl59oWtiBVnur2WTuijtLKwAGxNnx0vYhBYYqnX8cZhkiRrx
 Y2SCdguTpYdYOaRabuwsal0j8W34EErkHIgH7pYEHKHP+suk83PN6NQsK w==;
X-CSE-ConnectionGUID: GxPzXoHtSNiFGLVoGggNjg==
X-CSE-MsgGUID: rkLMvsXwT5eV5f7PLdcMhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62572988"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62572988"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 19:28:26 -0700
X-CSE-ConnectionGUID: DjwBILLlSJy8CGgExwlG/A==
X-CSE-MsgGUID: imNte/mkTLSRb4x2UKrruQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="181254829"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 19:28:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 19:28:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 19:28:25 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 19:28:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQwCnLPpO5XtXRaJSRHlmZJ7Y+HXozRYTPOJbKJfMT4kb8NOjgoMYN96OLXjoyNojfCR2leIn1+SVl/18L0/khgmk8kuYfEqNZlbB2AeF1hkgZdfDNdT6/Mbp2hQttskbqBabsntz6eAqqEflTzB1P10WinhRYjxV4p+WvzGahGv3SVraXX+9lzFOYqq48pu70SACP194lY/TduPEJTYd3kXt/gk5na5NVg4wgCTGDVl5tBopEdoMYp1J/h4aeIHlktOdAzaSFcOB0Ev3HPSMgoxAYvperNwYIxm7JUTu3lcE8jbWHdE8tNkqKefY+gWWWNlYzuBvHsX2AFDtq40ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAwn51AmXvisukMEEraMF878fnKya9O8/4Sual656NM=;
 b=aQbfNxNz8b/FBGk0xIMHs9Tg6EhiCzdDOLoQKR6HwAUJgLtTxZsmtlY2rr0DCtjs0PT6dOXh2Iw5xRDyxOCfAGqJDRPiFGSI0GCUf5m4lKoAz3xehZTIkYzVl1FRMe8MSVVJ0nDDy8UM6oRk8Lu4E0rbwgJrJ3UbCVlgu51TwJjKQq/x4ZkEDiYwiNoIvVNNlKzioeI4+m2LlhLKPhW9LiMtHxFDvbHzaiHoKUwG1uiDpNytNRQEKZZcxdEs2Cs+cdrEge7xEyxfB+zfzLVw8QMMFy4qaBVBJIi86dKWCWrAhLSDWy6pnbHr8RArUn9mddbxcB2lW8NBuzkdz1DEoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ5PPF183C9380E.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::815) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 02:28:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 02:28:22 +0000
Date: Tue, 14 Oct 2025 21:28:19 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Brian Welty <brian.welty@intel.com>
Subject: Re: [PATCH 03/23] drm/xe/xe3p_lpm: Configure MAIN_GAMCTRL_QUEUE_SELECT
Message-ID: <jkedmz7ocmab6vs5wchwuazhpmysh4synxcd6hrs3a7v5g2vlf@suwamovrz6jb>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-3-bfb74f038215@intel.com>
 <20251014163403.GO5409@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251014163403.GO5409@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ5PPF183C9380E:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a05c76a-ce21-4cf7-a1e8-08de0b928277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oHTTeC/x3Ev37pvPOvdVLbG+QYOY4uILk12gy4G3trQOVsok6NRGa4E6jSZb?=
 =?us-ascii?Q?iRVJh1mM0dFFoFQO1XJIFQW0YPe9+6Wf9ZrlLTcpg2PKdkJnxxKYsR2Zu9SR?=
 =?us-ascii?Q?rTD/SMjOKBQ4EcyuH2DOZKqdx1zFPPnSolfbPtiBfFenD/NtE9Z5mCoznhxz?=
 =?us-ascii?Q?uB5I//7z7xfsKaLrC8Og05g+f484UmBblVmYZh59yCQbDBrw8jFpMsDqDJtb?=
 =?us-ascii?Q?CHIh2HJjue4wxCWwT5IUmj7bzFW4PvLgOwsFsUog+wTRGQVjhCH3AqO6j3UY?=
 =?us-ascii?Q?YAsuReDv5Rek4XF6Z5pHmaL9T++6Ay0lhPuRZYthFgexuzKbPH6LuLiAYjWM?=
 =?us-ascii?Q?++bFDNLa+HQzpr4uzTyHRIxbSNEh3KoNmLmNlpl7YeJVvfqqn61aPhnAM0cU?=
 =?us-ascii?Q?Zbt0Egf0o5CUSgb1v9vqwLeba0wdkhPeTphnk+u/gCOKGXAP7JMFzxheJxa4?=
 =?us-ascii?Q?D+J7bt1ful1x3pEwjpdppY31i6HohByWSceNOwK4JPyq4pXU7VqgoUnUdqNt?=
 =?us-ascii?Q?zzIGntn93vya5aa7YNLgWo2GDketIs0mlTmsCUkCLORuQ2DeZUJ2zhr4hSb0?=
 =?us-ascii?Q?T6z/q53Z/qQfc3z9MtEXemaMDSGp8HxpdKRqM9UshsUk0iMH1XNb1NWTaD+R?=
 =?us-ascii?Q?HNLYq2c1iLriTscl2C5p0YKUE7JPQ22pGhO8m6UbprvCQGbrdLDEb0EN0xNY?=
 =?us-ascii?Q?ky5ZS8KA9uLHSDxxwmNpsUnTW8B/YP35JdEffj710FOc2QKGrluldPftQM0g?=
 =?us-ascii?Q?h16apgxpybeJgDCHX/Sym+n0H0DVzW5VOe94zY9d8NvvmyK/3qboanPVoBJb?=
 =?us-ascii?Q?x3mr6ACdabe8/oUOcHRCK6AL6URfKfWuT+VWiwCmhnHbLAueXH2motbX7Rec?=
 =?us-ascii?Q?DrDwkS8LbN17LTQbZOOOZ+yiIOhsMxcKDXA9ftyNSgHmuf4JkY21dxuQfZ2Y?=
 =?us-ascii?Q?f+FjiTxGwpo5uVSoSbQ0We/gh2erWyECC+IBBhbWGDqHvhXiCNBhuJhqIynt?=
 =?us-ascii?Q?Vp5FSMSNtNIkBmrPOjEWbnM+m+64xNQzoIyYTyVjTGxw6xo5sAUS4Eg0UgIy?=
 =?us-ascii?Q?k1VxsWjK3PMvOeE7cGrpSmL1O9S0ncBrIdGT7+uZct03TBeDrtJKJM6gN5Oo?=
 =?us-ascii?Q?OqqvVBSqOtfXHT+KFdbo/JweoGjVca33RBOJZLvG8jhJtUilOtrtfr/CVNyL?=
 =?us-ascii?Q?kBu0INHC8lJOG7NCpTItJHhwvmrA+gyahiCgJDwWJEvG6HZI8A8NcFn8p/7A?=
 =?us-ascii?Q?8cttCqnSNQuNYS4DaEa8DAeChJYwo2N9QNjUq//IjiuSQ8fRZsBqhgDHrE81?=
 =?us-ascii?Q?p+KF9pvrtIPgchCSiCKIx3m33Uw7GrWIIa/W25sv/mTSpDw6jUOm8scch5Ju?=
 =?us-ascii?Q?VhMMOgJVw6SmtjEy+0SmZsZDygictNmwopF82haiJOY6zCSpciBrsWX/AJ+0?=
 =?us-ascii?Q?9DfDxX9lnDA6XqsDkQM10FlBvYZtkChw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PdkNVtD4Xo2AEAtTT1zfiCsaTeXTp4Rtn2g+Dg5NupICAqwsMF5+8/aUarov?=
 =?us-ascii?Q?B6yLH/3Bi3ux/Ai7b/9ALuybd9vSaFRRB9HSzzOZU20G7/s9mtUNWoNkEOJI?=
 =?us-ascii?Q?SvpQ5VKmoa07Wh5ZF6B14R5j/8Xpkwsgtby6+y6qpPpt2oV99n4Bgw1Mt4O6?=
 =?us-ascii?Q?zvSgJhT08aJOjxmUsqwZveH0mwRXM+vyGQf/beQ1szw35o+/OrqWwp6aypRl?=
 =?us-ascii?Q?mSTBSC7iWGcDvUtsIpVpGTmdyDcJpT31VUFQMqdC488vmcgmwVag9urfpk/I?=
 =?us-ascii?Q?iazs/B5eFkbhuVSJ4VIC3V/c3EkK5L3pD5FOvjV0K4jbFsSAjS4p4tv39bFe?=
 =?us-ascii?Q?O5akEu7AQujnLKablUh9t3h78cbAytojIP0p+i8fFQBsyfU056Sx7bSwBvm5?=
 =?us-ascii?Q?MSWavct3Xhkncx46iuQx/ldtVGLajW/hSArdNhpkCpagxUSYJ6AR5BIOX76i?=
 =?us-ascii?Q?sXj12Bz+PuGR4EImDFC46Y6WTvd5+e1sgFKkmBYk7FfzBJStOiC+/e1QhPCp?=
 =?us-ascii?Q?2dQ1oC1nOuKC6ox5ALLrTI31cq0B+rEw2+uz13d9If25zHkpQye31YYBOHSq?=
 =?us-ascii?Q?eeREgym6RRxFKcPCiGimzxLOblO7daq5xmE/CcXffRtek8rfSiFM05iua3/P?=
 =?us-ascii?Q?SG1/cE1DJcEcQCKGcN3uWGUc1OVqg0MSomdQgIeiArtq6RGRLkuw+OeLP8nC?=
 =?us-ascii?Q?MbzPMTT1O2DExUdj4KuL83+IrhH+OBfw/rsKVO+7G4KU49GoS3enimprhnf7?=
 =?us-ascii?Q?Y+TYAhe8u2+q+cRBWKT95n0irch4emzopMeitZxue3eFxcBv8roAwmSUEFp8?=
 =?us-ascii?Q?w5eKap7UZ2AfXTQueLBGyP7ViaM9sa4hZdHTi36ZEWjbbUjzCwF/o5P0GMVM?=
 =?us-ascii?Q?td++WndsKcn2sKOdfn68z+MoFBQ05hcpkPW9RI0cYGKKwUrQmf/UrE5yss7s?=
 =?us-ascii?Q?fhcrM5uKqixMvMsnruZQ+DMcA0V6uFUe3pGWwG/Im+x4guM6CDNdlg3HmxNq?=
 =?us-ascii?Q?sjQSIuWjAXueSEMBrSQNiox+PEoc1lAy7lImLe+RfUACMDm5nJLpT5Xas3e4?=
 =?us-ascii?Q?rfLfU0cwumxqWWJ0jBr7SiiTIwY9ZovF/qYqx6BzsTDQmIj/py1PoVbPY8ks?=
 =?us-ascii?Q?KMQNQycIgZKDt7PiKrgzcNnK9X4AyVTBsRXs+GrYRVoE3tSWtW3etcPkAXBq?=
 =?us-ascii?Q?jsHEiSFKvPfrk2wXuKTVU+QagIIyb1wIQTMqaSuYWnvr8s4b41eS8NhnohsK?=
 =?us-ascii?Q?BH/58Z7hsgWjJSOELeKirnnptMNPPhM0dY+ziL0HzQ+gbkFDzokcMPSugubt?=
 =?us-ascii?Q?Sb4fPfnvhJLVHUemdegIfHpwxlGUh4lq8yTWbL2ffPP5HfabULDzATOFEojD?=
 =?us-ascii?Q?JE51GFV0pvcbv/zqbccq4F2oYamGMq3zsyrtAzbyS/1bBhNENbNB4Id7O6PI?=
 =?us-ascii?Q?FnoWmzbNBiD+r6rbUURoX3jXXM4GtcYN21YYAMNCpwx06ke3Z1xhK2csZi4j?=
 =?us-ascii?Q?GvohqTxeQISUuf3YJTWNgNMEwb3o9En9IfrUxB/1U1q6HV7tW4ORwZ51L2B3?=
 =?us-ascii?Q?NDBpedpohDijzLhQkfM4t/v3aEJ9ehsHCq9el+vZaDhAXhmExMeJf4w6hk43?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a05c76a-ce21-4cf7-a1e8-08de0b928277
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 02:28:21.8429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nl5IWqFuWiE3ICFN1TjwYwka+glABGGeLVEZ7rd2jsU+Bs61tuNDsjEXsIyygNaFHmKOZuLwvCEcWOuyAywUNpXztLWpkO7+NUX6w02OOno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF183C9380E
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

On Tue, Oct 14, 2025 at 09:34:03AM -0700, Matt Roper wrote:
>On Mon, Oct 13, 2025 at 08:24:35PM -0700, Lucas De Marchi wrote:
>> From: Brian Welty <brian.welty@intel.com>
>>
>> Starting from Xe3p, there are two different copies of some of the GAM
>> registers:  the traditional MCR variant at their old locations, and a
>> new unicast copy known as "main_gamctrl."  The Xe driver doesn't use
>> these registers directly, but we need to instruct the GuC on which set
>> it should use.  Since the new, unicast registers are preferred (since
>> they avoid the need for unnecessary MCR synchronization), set a new GuC
>> feature flag, GUC_CTL_MAIN_GAMCTRL_QUEUES to convey this decision.  A
>> new helper function, xe_guc_using_main_gamctrl_queues(), is added for
>> use in the 3 independent places that need to handle configuration of the
>> new reporting queues.
>>
>> The mmio write to enable the main gamctl is only done during the general
>> GuC upload.  The gamctrl registers are not accessed by the GuC during
>> hwconfig load.
>>
>> Last, the ADS blob for communicating the queue addresses contains both a
>> DPA and GGTT offset. The GuC documentation states that DPA is now MBZ
>> when using the MAIN_GAMCTRL queues.
>>
>> Signed-off-by: Brian Welty <brian.welty@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
>>  drivers/gpu/drm/xe/xe_gt.h           |  6 ++++++
>>  drivers/gpu/drm/xe/xe_guc.c          | 27 +++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_guc.h          |  1 +
>>  drivers/gpu/drm/xe/xe_guc_ads.c      |  6 +++++-
>>  drivers/gpu/drm/xe/xe_guc_fwif.h     |  1 +
>>  6 files changed, 43 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 51f2a03847f9d..47e13a3fb9072 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -545,6 +545,9 @@
>>  #define SARB_CHICKEN1				XE_REG_MCR(0xe90c)
>>  #define   COMP_CKN_IN				REG_GENMASK(30, 29)
>>
>> +#define MAIN_GAMCTRL_MODE			XE_REG(0xef00)
>> +#define   MAIN_GAMCTRL_QUEUE_SELECT		REG_BIT(0)
>> +
>>  #define RCU_MODE				XE_REG(0x14800, XE_REG_OPTION_MASKED)
>>  #define   RCU_MODE_FIXED_SLICE_CCS_MODE		REG_BIT(1)
>>  #define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index 5df2ffe3ff838..9d710049da455 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -22,6 +22,12 @@
>>
>>  #define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
>>
>> +#define GT_VER(gt) ({ \
>> +	typeof(gt) gt_ = (gt); \
>> +	struct xe_device *xe = gt_to_xe(gt_); \
>> +	xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) : GRAPHICS_VER(xe); \
>> +})
>> +
>>  extern struct fault_attr gt_reset_failure;
>>  static inline bool xe_fault_inject_gt_reset(void)
>>  {
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index d94490979adc0..37e3735f34e63 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -91,6 +91,9 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>>  	if (xe_configfs_get_psmi_enabled(to_pci_dev(xe->drm.dev)))
>>  		flags |= GUC_CTL_ENABLE_PSMI_LOGGING;
>>
>> +	if (xe_guc_using_main_gamctrl_queues(guc))
>> +		flags |= GUC_CTL_MAIN_GAMCTRL_QUEUES;
>> +
>>  	return flags;
>>  }
>>
>> @@ -1255,8 +1258,13 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
>>
>>  int xe_guc_upload(struct xe_guc *guc)
>>  {
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +
>>  	xe_guc_ads_populate(&guc->ads);
>>
>> +	if (xe_guc_using_main_gamctrl_queues(guc))
>> +		xe_mmio_write32(&gt->mmio, MAIN_GAMCTRL_MODE, MAIN_GAMCTRL_QUEUE_SELECT);
>> +
>>  	return __xe_guc_upload(guc);
>>  }
>>
>> @@ -1657,6 +1665,25 @@ void xe_guc_declare_wedged(struct xe_guc *guc)
>>  	xe_guc_submit_wedge(guc);
>>  }
>>
>> +/**
>> + * xe_guc_using_main_gamctrl_queues() - Detect which reporting queues to use.
>> + * @guc: The GuC object
>> + *
>> + * For Xe3p and beyond, we want to program the hardware to use the
>> + * "Main GAMCTRL queue" rather than the legacy queue before we upload
>> + * the GuC firmware.  This will allow the GuC to use a new set of
>> + * registers for pagefault handling and avoid some unnecessary
>> + * complications with MCR register range handling.
>> + *
>> + * Return: true if can use new main gamctrl queues.
>> + */
>> +bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc)
>> +{
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +
>> +	return GT_VER(gt) >= 35;
>
>Revisiting the spec on this, I'm not sure whether using GT_VER() here is
>actually the right thing to do.  As far as I can see, the media GT does
>not actually have a "main gamctrl" register range at all (i.e., bspec
>76445 only lists MCR gamctrl ranges, and 0x38EF00-0x38EFFF falls within
>a reserved/unused block).  That means that registers like

true

>MAIN_GAMCTRL_MODE that we're trying to write during xe_guc_upload above

We do have MAIN_GAMCTRL_MODE for xe3p_lpm in bspec 73540.
The tagging is odd, but there is a reference to the register at
0x38EF00. It wouldn't make sense to have a 0x38xxxx register instance
for primary/graphics GT.

So either

1) we don't have it like you said
2) we have it and there's something missing in the MCR ranges

>don't actually exist for the media GT.  Furthermore, the tagging on the
>register detail page 73540 also seems to imply that this only applies to
>the primary/graphics GT.

so... in that case we'd need to check both the gt type and graphics ver,
so we load GuC with those different flags. I will take a shot at that
and check if anything breaks.

Bala, since you did the patch following this, do you remember of
anything related to this?

Lucas De Marchi

>
>
>Matt
>
>> +}
>> +
>>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>>  #include "tests/xe_guc_g2g_test.c"
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>> index 1cca05967e621..e2d4c5f44ae34 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>> @@ -52,6 +52,7 @@ void xe_guc_stop_prepare(struct xe_guc *guc);
>>  void xe_guc_stop(struct xe_guc *guc);
>>  int xe_guc_start(struct xe_guc *guc);
>>  void xe_guc_declare_wedged(struct xe_guc *guc);
>> +bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc);
>>
>>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>>  int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *payload, u32 len);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index 22ac2a8b74c80..bcb85a1bf26d9 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -820,16 +820,20 @@ static void guc_mmio_reg_state_init(struct xe_guc_ads *ads)
>>  static void guc_um_init_params(struct xe_guc_ads *ads)
>>  {
>>  	u32 um_queue_offset = guc_ads_um_queues_offset(ads);
>> +	struct xe_guc *guc = ads_to_guc(ads);
>>  	u64 base_dpa;
>>  	u32 base_ggtt;
>> +	bool with_dpa;
>>  	int i;
>>
>> +	with_dpa = !xe_guc_using_main_gamctrl_queues(guc);
>> +
>>  	base_ggtt = xe_bo_ggtt_addr(ads->bo) + um_queue_offset;
>>  	base_dpa = xe_bo_main_addr(ads->bo, PAGE_SIZE) + um_queue_offset;
>>
>>  	for (i = 0; i < GUC_UM_HW_QUEUE_MAX; ++i) {
>>  		ads_blob_write(ads, um_init_params.queue_params[i].base_dpa,
>> -			       base_dpa + (i * GUC_UM_QUEUE_SIZE));
>> +			       with_dpa ? (base_dpa + (i * GUC_UM_QUEUE_SIZE)) : 0);
>>  		ads_blob_write(ads, um_init_params.queue_params[i].base_ggtt_address,
>>  			       base_ggtt + (i * GUC_UM_QUEUE_SIZE));
>>  		ads_blob_write(ads, um_init_params.queue_params[i].size_in_bytes,
>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> index 50c4c2406132e..c90dd266e9cf9 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> @@ -113,6 +113,7 @@ struct guc_update_exec_queue_policy {
>>  #define   GUC_CTL_ENABLE_SLPC		BIT(2)
>>  #define   GUC_CTL_ENABLE_LITE_RESTORE	BIT(4)
>>  #define   GUC_CTL_ENABLE_PSMI_LOGGING	BIT(7)
>> +#define   GUC_CTL_MAIN_GAMCTRL_QUEUES	BIT(9)
>>  #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
>>
>>  #define GUC_CTL_DEBUG			3
>>
>> --
>> 2.51.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
