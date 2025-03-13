Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73234C282DE
	for <intel-xe@archiver.kernel.org>; Thu, 13 Mar 2025 21:45:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A01810E16C;
	Thu, 13 Mar 2025 21:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nwi2t6DB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936E510E16C
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Mar 2025 21:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741902333; x=1773438333;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=djWIk2Y7jieY0TjzQdRVoP3Uocoqh9b1NHwfs7ANvLg=;
 b=nwi2t6DB2Lguieq21HEpUre2olpnb3+QoHVBmsKB+RQUYgbINAugFPxq
 WlCN9XOBxLw5sKMQv0/KBUAm67BIsje7GkQDGioOb2AmjeoAvOlbnFipL
 rwBOQVtzlX6WkLs+kHIZ/DvYugAOeQIaGVOlNzl8Cjb5TYfjRTBY+unjI
 RUJcqhUP32+2TafFlc9pAOeBx+W2bHx3gyJPuXhIxgeP0hPsGABRzUrCG
 SrT9wgx+pQt02B5vDonQELeZWcevMf8yhpVKI8fMq6xhh6lmSBwtNkSeQ
 yrDYlJwlmsN7Ctgj0Cheqz+VIgNDNwfxO/2QnwUIpKgwYj/dJKwBPGS2x w==;
X-CSE-ConnectionGUID: 4+A2jAX8QGOb8b4WiHpe2A==
X-CSE-MsgGUID: 14CgMYklS/a5+uW1JL58aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68406995"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="68406995"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 14:45:31 -0700
X-CSE-ConnectionGUID: Jl8b7P6LSGeCAERcHSyndA==
X-CSE-MsgGUID: TBbONjfYSk6HLki2lVATSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="121783512"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 14:45:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 13 Mar 2025 14:45:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Mar 2025 14:45:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Mar 2025 14:45:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tusZRYOqDhNgMvwvMpPDehTdMWGlWR77NnaYphqaOvwJ6clydtB+Fh2pyTqjVAvGVzuBKEU1ulXl9F9T8xVHXivBrnhxXI2Ss8t9i8CecdQKu2pO0BSoc0PtwCwFIcg/PNRFYsw15aQWhxgSM5+FeIpdOsyu8e520DJzM9Qm2MdX4V7Zx1oofBG0o02ZtaAMqnQ4BbK0Osk9EorvQMFHOesK1KciTCx8fPKmiiqvN6Nzvhx+IOlfQQNAfNsS3vpEFOl++SH53ovpZSB1vr7kay9xj+wVPLRtnw5swfiDRkHQsigXbqI7rQ4ORLHsMyWdwRJOwlFitaiGShigxd4NoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8NF9m42d1HSOW6QyvpOhabNiOqb26tMaml4YMi1WyM=;
 b=b+1TlfDaI3tsN4vF2BmMC0v3m8ZfunFBviYTSWH5HDz1ax4NOPqd6W+9PUD3ARy/yC7Hs9TBDTyRbzA8EAbKQvr3DZ+GBpgQZ5Lw8kRtRky4J8Q33q7AOR9wtrjT3N72qMxZVuESjdLFfntMiHD8fXLCrexQ1erUrA/xWb+7DM0Uq/cnGTOMKbsPUDBYQDfp9A75anhpk0L2fTizC+rtq6QHeviJzcXgqSo0wuI8y7t6tqs9kEgdH1t9AhiZ9QauW9KTiHZuFoB1BfTGUIBzDexwqs8m3b7vTfcxu9E7IUM0PVJxt3v8DeT9kKE88rx1p1/BcCVrH171sUyhKhSH4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6966.namprd11.prod.outlook.com (2603:10b6:806:2bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 21:45:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.027; Thu, 13 Mar 2025
 21:45:13 +0000
Date: Thu, 13 Mar 2025 16:45:09 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3] drm/xe/pmu: Add GT frequency events
Message-ID: <vx26ng5q4asspsg6lktrj5ok73gbiy3bfg7icu4fybekyt4zad@5h4bsek2mukm>
X-Patchwork-Hint: comment
References: <20250312001408.804125-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250312001408.804125-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4P223CA0016.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 5287c88b-8d5e-4ba6-111a-08dd627855d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o9W5Qvb+8LDqBWdNDygq3yJ2+qs5BVRQoH+sjT8Z8LOXRnDXe8yd0wvfZKvb?=
 =?us-ascii?Q?SnNNbvGYZHW72OOxVhKt4jSryLMc5GzsfHzIYYgTfHiq0BvQ6DGAhKDVyoTD?=
 =?us-ascii?Q?T9dFWxIl6qpF1B21ZH8uwTNESUTNUNOnMf+GZvWWs/pK74L2Fc4J9UcCoFUC?=
 =?us-ascii?Q?obSlQWr/13bNh1Dg436evhI5Rz+c+hc/fT7ZJSiHogdhxO9x2uUV8nFJf0zs?=
 =?us-ascii?Q?aNc8VVGljWic/kAZQw9LLAlTA+f2UlXHcmlCpEzyACOgEpS1aAvkK/1styg7?=
 =?us-ascii?Q?EX0Boj3egf8K+FG3hNrHYYJ9WetDnjyrvPvQUDNl6EoNFHJxOa7AyFsjdpva?=
 =?us-ascii?Q?PKvJBxkTFb3hC3PhmMfjF+m3Dd+KuqHXzwhGnZ+hn/n1xolKXXKold/P3W1n?=
 =?us-ascii?Q?VrheF6CwTB700vt0H1RURed/olOE8b8vKKEnvyMns/Q9V5fhMu10CvDxA/Pz?=
 =?us-ascii?Q?a2vne0R6W9O2lrNFpIwmGwSv2WKdg0pezumVUJ95iOGccJMhkBBSr3/hvhRv?=
 =?us-ascii?Q?VHfJpags8OsyjrAO6eit48qiru8VC38uZHSFbwsrLs3blko4atkPMEKBQK93?=
 =?us-ascii?Q?WcZ26hDdH67je619J3y7UyDPzzFyeQ/J6X+zEEBk03C+yF2eIg6FLe2NosoE?=
 =?us-ascii?Q?h/WaJW8OHpO8Iadd4pIl1IHbQN5pok3a0d++o3mFi+WaLVAVpO7AG4/Q53AZ?=
 =?us-ascii?Q?cQnRDBT2LDT4h/BKpi9KJnW/txHbWGd/qW5wIMm9v70eyTwHBKIw/eCTwiMv?=
 =?us-ascii?Q?g8jb/zg75DwapeLesQsY3aKNH5Bz7HOZo0p00KgIzpyxQ9RNQ9BMss8msUL9?=
 =?us-ascii?Q?Tzk3i3DphpZItm4Xh04/aHqyq+cRyJ/9+4Jkdg5MAA4QRCCpC96faUHM6s9Z?=
 =?us-ascii?Q?1fF6ZdZSCPbc6ip2uJ29W/+M4rzcI8L0xOZBVlIKTbhPsA62BI37Dd+mNLQq?=
 =?us-ascii?Q?MO6AM2s2DjISzv4Llz8nFAApBrwIrRsef6TjR81erl8zhYIGmypcBlxHl9pq?=
 =?us-ascii?Q?3YKXOx/ooscYrftFHKKQVXSTxZxWeXn7yvZmmVCWVBG/xUrhsdPYGKzvbUmg?=
 =?us-ascii?Q?ykXdt7FqG5kuZ0hGrdU8udEawvLojtttfZK+8yyxhm8gATHUozBB5DA+suZy?=
 =?us-ascii?Q?vFWGmXGqCRFJqs1TZoscOTWon/vceWgPkZvXpwYFlD8HujyV9ZblV3uH0/+d?=
 =?us-ascii?Q?BcvOJLehmOnly8ZwNK8SJCIsDgGnjI+2S06Ho8CVBsDSDEEyKHXizycGEZNO?=
 =?us-ascii?Q?/50D//Ny4SghzslgnYwXvonEHzwRTv3a8sEpLaVDzUbeq8KL3CPjWV89swx8?=
 =?us-ascii?Q?QNjFxvNR4qMbQvB5+n5GEuV8YL7Y7Kb1GKjJ//zwW8CVZnm7iusy2uDgaCVQ?=
 =?us-ascii?Q?h09doiRYxNGidGBFuAfJQimIXTy8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RpHmlReuk0ABiJmhvEax5L+AdtretckHnPGCYG1D9T/roKvMJdsrBNmyuok7?=
 =?us-ascii?Q?lKhONuj9nbNdwHhiEvUMXgk1/D1XmdrI6k+/XDQhaFv8MZZ89vqniKbOMgVh?=
 =?us-ascii?Q?ehWKZ3cyXVzxCodMfedu0dk1wBOYcwHh8FFoQ2HWPRoECSkWPyEjwh+2/gmf?=
 =?us-ascii?Q?eseqTTrNPNYFR9yMjUM0sUAQ30gmO1FXVfU2v1F9e0PT+8ZSmD762AuQVyBK?=
 =?us-ascii?Q?+DxND9uIhUNOG3YB+WxqDO9mWCeHrV0TzgOjQel208lmEzVuW6OG9XE3zEfw?=
 =?us-ascii?Q?2NOE3Tv7Kwp+aZomopOkM0P8ukGNVLZvLhuP1VAu57OCYVAWzfSfJ9tL40Ve?=
 =?us-ascii?Q?YB0fq+Li5NQakO4BBaMUEoSHc+OmZvsD25dKrVk3SebvJjdjcMKqVdPAE1Aa?=
 =?us-ascii?Q?ZsrrITGTeaaa5aszvT1MO+fGaaZFwTwWip1Hid8rdsB18Cfj/24/KFibhd9e?=
 =?us-ascii?Q?QxJZRPud1cLzn7GaVWf3Ev2WmIrUufb7Y5wOSOfDa/Dp59asJe/I6xtIXeFz?=
 =?us-ascii?Q?/maGlf9kdrAeOYDcEdxFJwmM52M4m2/Xg9UuX6kg5/lz5q64lKukuWWGjsWh?=
 =?us-ascii?Q?HWT3/o9bDD4/5GID8H+3IbyRKVuNhhIb0pERTodk1SFnRhFoPF1qZN9tlD1d?=
 =?us-ascii?Q?CgyYdP1dR/PEdihIBV7RtjGQ4RJD9jSFjFq5Hzs0ADzAcnLqr9EK4nBONOMD?=
 =?us-ascii?Q?sDj5qbB8j2dv2EtTCOsIsvcDMOh7RIV7rX498XY7WLdsWeVxKWE6gXTXGBrx?=
 =?us-ascii?Q?fh36Pyr2s+YRCgkuoFdOuq1KkcEBG+2FcFpZ1HNDt8F7Ra2+Vy5Zw0RzCBjq?=
 =?us-ascii?Q?K1n5bGkgr+Wpof13ElCukMyV7ZpPatF7metu4I1p3hFHqQlsZJMaqASNeiwM?=
 =?us-ascii?Q?qgd2aMZMXwU7l4Ov1Td6yswVaJdCFe+iNFUlPK0x51noE0BZ4AfvDgEu8/dH?=
 =?us-ascii?Q?MaY9XlLay2BUMTKAjKAXPObi0+n4WHH3t9Zry6Y4K75g/esgSz+6rm7jynoL?=
 =?us-ascii?Q?qQZhJ8SafymecH62y556F0RQKHYAeFsBdL4QmlJb19lpWKTgCd/Wt+xHf1vL?=
 =?us-ascii?Q?ywzetLsoh1m2IS6BeeUoqGx6gqyPRTvjPkJjTRvamnRJjtXo4hvfQ+lLhkfj?=
 =?us-ascii?Q?FM40NSyXg5HePOnX33H1H23/mk3WOr8ykfm7iExg0lorHJ+lAhe9mS8q7kj8?=
 =?us-ascii?Q?jI/3G+LaYeIXk+TEyCATkRudWZZFlo4OpkNG+YOUJ+czyUtAKUSmcixfF8/T?=
 =?us-ascii?Q?UhLPKGSFlN2YwZ7mMfL1SzhPgGXOcu7ArotePGMR2NrX3iCU8M249UjureaJ?=
 =?us-ascii?Q?jqQMIlt1jFKUqH7BLVqM+F+GCZpcvp5Ye40Qlz1xI1Usl1rFRo2N3KB7G9MD?=
 =?us-ascii?Q?EPucrIo+2mid9iP8ks2Gr2+hgxWFxRWsCY6vpn2MoQfStl6EaqAj1TiHtJkH?=
 =?us-ascii?Q?br/9umNJoNoLSHJcAyZhZ6nQ1x8zusp4vaLMoYUyWVTwQQ1H9wbOs3nLaqZB?=
 =?us-ascii?Q?ndPXV0MCbJUYJKAodF6RUN/AJt/MBPeZ60H4XNQJtxbHXPmTPuSa92Ii8FMT?=
 =?us-ascii?Q?bSJtLUWml7Vn2220yOeZvfsNZDooXS4H9Zp4pyaeRYTgwPOZmqarSRJrsr9d?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5287c88b-8d5e-4ba6-111a-08dd627855d6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 21:45:13.4307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tD2r0mkLaf1PzzLYSkE4jTBDUEMaYU8JJyslzsgMPEAipkl2qzNeglQu99qw+ms3jvLxBiZ6wMC8avwP3Ur0+5XJKid02wrg/YftvZ61VQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6966
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

On Tue, Mar 11, 2025 at 05:14:08PM -0700, Vinay Belgaumkar wrote:
>Define PMU events for GT frequency (actual and requested). This is
>a port from the i915 driver implementation, where an internal timer
>is used to aggregate GT frequencies over certain fixed interval.
>Following PMU events are being added-
				     ^
why do you use "-"  instead of ":"?

>
>  xe_0000_00_02.0/gt-actual-frequency/              [Kernel PMU event]
>  xe_0000_00_02.0/gt-requested-frequency/           [Kernel PMU event]
>
>Standard perf commands can be used to monitor GT frequency-
>  $ perf stat -e xe_0000_00_02.0/gt-requested-frequency,gt=0/ -I1000
>
>     1.001175175                700 M    xe/gt-requested-frequency,gt=0/
>     2.005891881                703 M    xe/gt-requested-frequency,gt=0/
>     3.007318169                700 M    xe/gt-requested-frequency,gt=0/
>
>Actual frequencies will be reported as 0 when GT is in C6.


I think we need to document somewhere, but at the very least in the
commit message what the event count actually is. Let me see if I get
this right:  if userspace is sampling every 1sec, and assuming the gpu
is at 700MHz for the first 0.5sec and at 1.4 GHz, userspace should
expect to see ~1050 as the value. Correct?  I find this frequency
handling very different from anything else reported via perf. Other
than i915, are there any other cases you know of?

>
>v2: Use locks while storing/reading samples, keep track of multiple
>clients (Lucas) and other general cleanup.
>v3: Review comments (Lucas) and use event counts instead of mask for
>active events.
>
>Cc: Riana Tauro <riana.tauro@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>---
> drivers/gpu/drm/xe/xe_pmu.c       | 178 ++++++++++++++++++++++++++++--
> drivers/gpu/drm/xe/xe_pmu_types.h |  29 +++++
> 2 files changed, 197 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>index 4f62a6e515d6..d4c639369709 100644
>--- a/drivers/gpu/drm/xe/xe_pmu.c
>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>@@ -10,7 +10,9 @@
> #include "xe_force_wake.h"
> #include "xe_gt_idle.h"
> #include "xe_guc_engine_activity.h"
>+#include "xe_guc_pc.h"
> #include "xe_hw_engine.h"
>+#include "xe_macros.h"
> #include "xe_pm.h"
> #include "xe_pmu.h"
>
>@@ -52,6 +54,7 @@
> #define XE_PMU_EVENT_ENGINE_CLASS_MASK		GENMASK_ULL(27, 20)
> #define XE_PMU_EVENT_ENGINE_INSTANCE_MASK	GENMASK_ULL(19, 12)
> #define XE_PMU_EVENT_ID_MASK			GENMASK_ULL(11, 0)
>+#define XE_HRTIMER_INTERVAL_NS		5000000
>
> static unsigned int config_to_event_id(u64 config)
> {
>@@ -76,10 +79,12 @@ static unsigned int config_to_gt_id(u64 config)
> #define XE_PMU_EVENT_GT_C6_RESIDENCY		0x01
> #define XE_PMU_EVENT_ENGINE_ACTIVE_TICKS	0x02
> #define XE_PMU_EVENT_ENGINE_TOTAL_TICKS		0x03
>+#define XE_PMU_EVENT_GT_ACTUAL_FREQUENCY	0x04
>+#define XE_PMU_EVENT_GT_REQUESTED_FREQUENCY	0x05
>
> static struct xe_gt *event_to_gt(struct perf_event *event)
> {
>-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_device *xe = container_of(event->pmu, typeof(struct xe_device), pmu.base);
> 	u64 gt = config_to_gt_id(event->attr.config);
>
> 	return xe_device_get_gt(xe, gt);
>@@ -179,7 +184,7 @@ static bool event_param_valid(struct perf_event *event)
>
> static void xe_pmu_event_destroy(struct perf_event *event)
> {
>-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_device *xe = container_of(event->pmu, typeof(struct xe_device), pmu.base);
> 	struct xe_gt *gt;
> 	unsigned int *fw_ref = event->pmu_private;
>
>@@ -197,7 +202,7 @@ static void xe_pmu_event_destroy(struct perf_event *event)
>
> static int xe_pmu_event_init(struct perf_event *event)
> {
>-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_device *xe = container_of(event->pmu, typeof(struct xe_device), pmu.base);

3 cases above: please stop changing unrelated lines. They were fine
the way they were.

> 	struct xe_pmu *pmu = &xe->pmu;
> 	unsigned int id, gt;
>
>@@ -219,6 +224,9 @@ static int xe_pmu_event_init(struct perf_event *event)
> 	if (!event_supported(pmu, gt, id))
> 		return -ENOENT;
>
>+	if (XE_WARN_ON(id >= XE_PMU_MAX_EVENT_TYPES))
>+		return -EINVAL;
>+
> 	if (has_branch_stack(event))
> 		return -EOPNOTSUPP;
>
>@@ -239,6 +247,30 @@ static int xe_pmu_event_init(struct perf_event *event)
> 	return 0;
> }
>
>+static u64
>+xe_get_pmu_sample(struct xe_pmu *pmu, unsigned int gt_id, uint32_t id)
>+{
>+	unsigned long flags;
>+	u64 val;
>+
>+	raw_spin_lock_irqsave(&pmu->lock, flags);
>+	val = pmu->event_sample[gt_id][id];
>+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
>+
>+	return val;
>+}
>+
>+static void
>+xe_store_pmu_sample(struct xe_pmu *pmu, uint32_t gt_id, uint32_t id,
>+		    uint32_t val, uint32_t period)
>+{
>+	unsigned long flags;
>+
>+	raw_spin_lock_irqsave(&pmu->lock, flags);
>+	pmu->event_sample[gt_id][id] += mul_u32_u32(val, period);
>+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
>+}
>+
> static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event)
> {
> 	struct xe_hw_engine *hwe;
>@@ -256,16 +288,23 @@ static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event)
> static u64 __xe_pmu_event_read(struct perf_event *event)
> {
> 	struct xe_gt *gt = event_to_gt(event);
>+	struct xe_pmu *pmu = container_of(event->pmu, typeof(struct xe_pmu), base);

	struct xe_pmu *pmu = container_of(event->pmu, typeof(*pmu), base);

typeof(type) is odd.

>+	unsigned long id;
>
> 	if (!gt)
> 		return 0;
>
>-	switch (config_to_event_id(event->attr.config)) {
>+	id = config_to_event_id(event->attr.config);
>+
>+	switch (id) {
> 	case XE_PMU_EVENT_GT_C6_RESIDENCY:
> 		return xe_gt_idle_residency_msec(&gt->gtidle);
> 	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
> 	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
> 		return read_engine_events(gt, event);
>+	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
>+	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
>+		return div_u64(xe_get_pmu_sample(pmu, gt->info.id, id), NSEC_PER_SEC);
> 	}
>
> 	return 0;
>@@ -286,7 +325,7 @@ static void xe_pmu_event_update(struct perf_event *event)
>
> static void xe_pmu_event_read(struct perf_event *event)
> {
>-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_device *xe = container_of(event->pmu, typeof(struct xe_device), pmu.base);

ditto.

> 	struct xe_pmu *pmu = &xe->pmu;
>
> 	if (!pmu->registered) {
>@@ -297,8 +336,89 @@ static void xe_pmu_event_read(struct perf_event *event)
> 	xe_pmu_event_update(event);
> }
>
>+static void xe_pmu_start_timer(struct xe_pmu *pmu)
>+{
>+	/* Timer is per device */
>+	if (!pmu->timer_enabled) {
>+		pmu->timer_enabled = true;
>+		pmu->timer_last = ktime_get();
>+		hrtimer_start_range_ns(&pmu->timer,
>+				       ns_to_ktime(XE_HRTIMER_INTERVAL_NS), 0,
>+				       HRTIMER_MODE_REL_PINNED);
>+	}
>+}
>+
>+static void
>+xe_sample_gt_frequency(struct xe_pmu *pmu, uint32_t period_ns)
>+{
>+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>+	struct xe_gt *gt;
>+	uint32_t act_freq, cur_freq;
>+	int ret;
>+	int i;
>+
>+	/* Sample each event type once */
>+	for_each_gt(gt, xe, i) {
>+		if (pmu->active_count[i][XE_PMU_EVENT_GT_ACTUAL_FREQUENCY]) {
>+			/* Actual freq will be 0 when GT is in C6 */
>+			act_freq = xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
>+			xe_store_pmu_sample(pmu, i, XE_PMU_EVENT_GT_ACTUAL_FREQUENCY,
>+					    act_freq, period_ns);
>+		}
>+
>+		if (pmu->active_count[i][XE_PMU_EVENT_GT_REQUESTED_FREQUENCY]) {
>+			ret = xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_freq);
>+			if (!ret)
>+				xe_store_pmu_sample(pmu, i, XE_PMU_EVENT_GT_REQUESTED_FREQUENCY,
>+						    cur_freq, period_ns);
>+		}
>+	}
>+}
>+
>+static enum hrtimer_restart xe_sample(struct hrtimer *hrtimer)
>+{
>+	struct xe_pmu *pmu = container_of(hrtimer, struct xe_pmu, timer);
>+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>+	u64 time_diff_ns;
>+	ktime_t now;
>+
>+	if (!READ_ONCE(pmu->timer_enabled))
>+		return HRTIMER_NORESTART;
>+
>+	now = ktime_get();
>+	time_diff_ns = ktime_to_ns(ktime_sub(now, pmu->timer_last));
>+	pmu->timer_last = now;
>+
>+	xe_sample_gt_frequency(pmu, time_diff_ns);
>+
>+	hrtimer_forward(hrtimer, now, ns_to_ktime(XE_HRTIMER_INTERVAL_NS));
>+
>+	return HRTIMER_RESTART;
>+}
>+
>+static bool is_gt_frequency_event(uint32_t id)
>+{
>+	return (id == XE_PMU_EVENT_GT_ACTUAL_FREQUENCY) ||
>+	       (id == XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
>+}
>+
> static void xe_pmu_enable(struct perf_event *event)
> {
>+	struct xe_gt *gt = event_to_gt(event);
>+	struct xe_pmu *pmu = container_of(event->pmu, typeof(struct xe_pmu), base);
>+	uint32_t id = config_to_event_id(event->attr.config);
>+	unsigned long flags;
>+
>+	raw_spin_lock_irqsave(&pmu->lock, flags);
>+
>+	if (is_gt_frequency_event(id)) {
>+		pmu->active_count[gt->info.id][id]++;
>+		/* Start a timer, if needed, to collect samples */
>+		if (pmu->n_active++ == 0)
>+			xe_pmu_start_timer(pmu);

with my suggestion to drop the timer_enabled
this would be:

xe_pmu_start_timer(pmu)
{
	if (pmu->n_active++ == 0) {
		...
	}
}

if (is_gt_frequency_event(id)) {
	pmu->active_count[gt->info.id][id]++;
	xe_pmu_start_timer(pmu);
}


>+	}
>+
>+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
> 	/*
> 	 * Store the current counter value so we can report the correct delta
> 	 * for all listeners. Even when the event was already enabled and has
>@@ -309,7 +429,7 @@ static void xe_pmu_enable(struct perf_event *event)
>
> static void xe_pmu_event_start(struct perf_event *event, int flags)
> {
>-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_device *xe = container_of(event->pmu, typeof(struct xe_device), pmu.base);

ditto

> 	struct xe_pmu *pmu = &xe->pmu;
>
> 	if (!pmu->registered)
>@@ -319,21 +439,43 @@ static void xe_pmu_event_start(struct perf_event *event, int flags)
> 	event->hw.state = 0;
> }
>
>+static void xe_pmu_disable(struct perf_event *event)
>+{
>+	struct xe_device *xe = container_of(event->pmu, typeof(struct xe_device), pmu.base);
>+	struct xe_gt *gt = event_to_gt(event);
>+	struct xe_pmu *pmu = &xe->pmu;
>+	uint32_t id = config_to_event_id(event->attr.config);
>+	unsigned long flags;
>+
>+	raw_spin_lock_irqsave(&pmu->lock, flags);
>+
>+	if (is_gt_frequency_event(id)) {
>+		pmu->active_count[gt->info.id][id]--;
>+		if (--pmu->n_active == 0)
>+			pmu->timer_enabled = false;

rather call hrtimer_cancel() here?

>+	}
>+
>+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
>+}
>+
> static void xe_pmu_event_stop(struct perf_event *event, int flags)
> {
>-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_device *xe = container_of(event->pmu, typeof(struct xe_device), pmu.base);
> 	struct xe_pmu *pmu = &xe->pmu;
>
>-	if (pmu->registered)
>+	if (pmu->registered) {
> 		if (flags & PERF_EF_UPDATE)
> 			xe_pmu_event_update(event);
>
>+		xe_pmu_disable(event);
>+	}
>+
> 	event->hw.state = PERF_HES_STOPPED;
> }
>
> static int xe_pmu_event_add(struct perf_event *event, int flags)
> {
>-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_device *xe = container_of(event->pmu, typeof(struct xe_device), pmu.base);
> 	struct xe_pmu *pmu = &xe->pmu;
>
> 	if (!pmu->registered)
>@@ -419,6 +561,10 @@ static ssize_t event_attr_show(struct device *dev,
> XE_EVENT_ATTR_SIMPLE(gt-c6-residency, gt_c6_residency, XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
> XE_EVENT_ATTR_NOUNIT(engine-active-ticks, engine_active_ticks, XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
> XE_EVENT_ATTR_NOUNIT(engine-total-ticks, engine_total_ticks, XE_PMU_EVENT_ENGINE_TOTAL_TICKS);
>+XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
>+		     XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, "Mhz");
>+XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
>+		     XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, "Mhz");
>
> static struct attribute *pmu_empty_event_attrs[] = {
> 	/* Empty - all events are added as groups with .attr_update() */
>@@ -434,6 +580,8 @@ static const struct attribute_group *pmu_events_attr_update[] = {
> 	&pmu_group_gt_c6_residency,
> 	&pmu_group_engine_active_ticks,
> 	&pmu_group_engine_total_ticks,
>+	&pmu_group_gt_actual_frequency,
>+	&pmu_group_gt_requested_frequency,
> 	NULL,
> };
>
>@@ -442,8 +590,11 @@ static void set_supported_events(struct xe_pmu *pmu)
> 	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> 	struct xe_gt *gt = xe_device_get_gt(xe, 0);
>
>-	if (!xe->info.skip_guc_pc)
>+	if (!xe->info.skip_guc_pc) {
> 		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
>+		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_ACTUAL_FREQUENCY);
>+		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
>+	}
>
> 	if (xe_guc_engine_activity_supported(&gt->uc.guc)) {
> 		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>@@ -463,6 +614,8 @@ static void xe_pmu_unregister(void *arg)
> 	if (!pmu->registered)
> 		return;
>
>+	hrtimer_cancel(&pmu->timer);
>+
> 	pmu->registered = false;
>
> 	perf_pmu_unregister(&pmu->base);
>@@ -491,6 +644,11 @@ int xe_pmu_register(struct xe_pmu *pmu)
> 	if (IS_SRIOV_VF(xe))
> 		return 0;
>
>+	raw_spin_lock_init(&pmu->lock);
>+
>+	hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>+	pmu->timer.function = xe_sample;
>+
> 	name = kasprintf(GFP_KERNEL, "xe_%s",
> 			 dev_name(xe->drm.dev));
> 	if (!name)
>diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>index f5ba4d56622c..59ed9d8b4ed8 100644
>--- a/drivers/gpu/drm/xe/xe_pmu_types.h
>+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>@@ -10,6 +10,7 @@
> #include <linux/spinlock_types.h>
>
> #define XE_PMU_MAX_GT 2
>+#define XE_PMU_MAX_EVENT_TYPES 64
>
> /**
>  * struct xe_pmu - PMU related data per Xe device
>@@ -34,6 +35,34 @@ struct xe_pmu {
> 	 * @supported_events: Bitmap of supported events, indexed by event id
> 	 */
> 	u64 supported_events;
>+	/**
>+	 * @lock: Lock protecting enable counts and sampling.
>+	 */
>+	raw_spinlock_t lock;

Lock protecting hw state

	
struct {
	struct hrtimer hrtimer;
	ktime_t last_stamp;
	unsigned int active;
	unsigned long active_count[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES];
	u64 event_sample[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES];
} timer;

 From your code above it doesn't think you need both "timer_enabled" and
"n_active". Calling it active would be better. == 0 means "no".

Also group them in a substruct like above, because  "n_active" doesn't
give any hint this is only about the very few events that use a timer.

Lucas De Marchi

>+	/**
>+	 * @n_active: Total number of active events that need timer.
>+	 */
>+	unsigned int n_active;
>+	/**
>+	 * @active_count: Counts per GT/type of event that need timer.
>+	 */
>+	unsigned long active_count[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES];
>+	/**
>+	 * @timer: Timer for sampling GT frequency.
>+	 */
>+	struct hrtimer timer;
>+	/**
>+	 * @timer_last: Timestmap of the previous timer invocation.
>+	 */
>+	ktime_t timer_last;
>+	/**
>+	 * @timer_enabled: Should the internal sampling timer be running.
>+	 */
>+	bool timer_enabled;
>+	/**
>+	 * @event_sample: Store freq related counters.
>+	 */
>+	u64 event_sample[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES];
> };
>
> #endif
>-- 
>2.38.1
>
