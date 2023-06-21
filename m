Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAC0EB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jun 2023 22:57:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5240810E36A;
	Wed, 21 Jun 2023 22:57:56 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BF710E36A
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jun 2023 22:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687388273; x=1718924273;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=utMflftCjtCYE3ek32+M2FZgydalK48ElmUxsHEGup4=;
 b=V1ACCNFeqCffUdwu7mGBGFoYmGXfi6YOETRB0tC5Hrc7Hm5Xxiczrdr5
 Ejxr12+CGWCruK9IMOWvyPC1hNjAE4dLhUaFnCQ6K1Z56XUDZQyoDpuTd
 ooqsSf/rq6DeoEqCzrKGFL/SaKohiTMKSUQ3xZvqLGSxCWK2w+M/bVqWk
 fRQlBgaIKVsICB0Z+XUCiWNhMX9Qv1eYSckAHSw7KqA2bLezxfYsD+8fC
 DxK5vlpQdTZzFHWTKhUy0gKZGvROy1/4bTcS9hkvUTvtAE88QJTBRZzBp
 vVcKhCTkq9D/IVWlM2iABQAt0gYgO+j7x8ImklDeQdGM1B7Op+2lFUe8S A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="357825216"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; d="scan'208";a="357825216"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 15:57:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="961372578"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; d="scan'208";a="961372578"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 21 Jun 2023 15:57:52 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 21 Jun 2023 15:57:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 21 Jun 2023 15:57:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 21 Jun 2023 15:57:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBdb/qXBwms6GBmEHapPKkuHva5xq38hnECTaNeJac382K0xi91HsMKUGF9EZt99SI+Gld9i/OxT0ET1N7/Mq0i18yWCA2qTGrqAocfyaPDDUf9MLcwTWN106mOMGVf1quNxZqOGPAYymOk64aSmCKO209PCO+ClMmdOfOPoWCw5HnZXSkhz4Ra6vETeqB6DQ7ADbMwfEIP2y7E48ihGIsfBAZspuGd+A9cLo3TaHm2l+mwk0Uq/Fn7iHlscHKMjs1KjFLO7KOzwJf+b9BlZTRd63AJ61dxgzl9OIhlqb1yotoVkvUUS1JhP2EtuSvLl97+z//S3EdO8izDTAVNv1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4WHvHYqRmAIpfsy+1pfihOUQs00MGfFDvRQi7tg7PQ=;
 b=Wmz97f5tJHmzQV0UtLS9yBw9vplZ8Fk4GXrWj0V8F8lsQ4f323lfQDHAakjN+h7ohwG62kgY4jdsnXzogy6j2G7vdMptP6Mu9zsm5NqgfkKcvL67GM/XjUdVKVZPTqCsumhKw/HXZrrSJa9FFu5DHr8kEFVHzUKfzC5yFCR3eq5nAn2Hujp2lKQoQU4bJ3HVX3vURhbQ9E5pk+IW1Ij6G4u1GktxJXVTTmioGb0GDAhb5URNMUwj9c5H9Ojc/5Tq/ptg2CpfQKg7MAkQxQX/U64BGDtMLwWvOTEkvPjZbPfaz6s1HWuEylCVCPzR2/W6sfJLKT9FCtHjuNght5fUEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5372.namprd11.prod.outlook.com (2603:10b6:408:105::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 22:57:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 22:57:49 +0000
Date: Wed, 21 Jun 2023 15:57:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <l5cru7upg7xhoyjfzjn4vkkstelvt3or34i255u7rcygxvfuo7@mekxbs6kw47t>
References: <20230620193229.1698372-1-radhakrishna.sripada@intel.com>
 <20230620193229.1698372-3-radhakrishna.sripada@intel.com>
 <p7zjd7pktccivhdosyrteoixzrkqqiawzcjluhfujwo35qpisl@zol4cc6pxhjp>
 <DM4PR11MB5971ED74CBC0D05B16B0CD41875CA@DM4PR11MB5971.namprd11.prod.outlook.com>
 <oekkd7ikdekbxmqaumvffxxxmgimawic232muweq4c2vgjpd7q@4fkzr5dpx55o>
 <20230621021043.GC5433@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230621021043.GC5433@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR03CA0229.namprd03.prod.outlook.com
 (2603:10b6:303:b9::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5372:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d35a60a-e7b5-46d4-04a6-08db72aaef69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j8x/NiCX7eU0SvKaKE+864sDGn5HFom2lxU/skVL93BCkt8TCRTounPjL5/07dbnfNuIZ4kWsot68f7hRRdaMD54rZGzhWhcXPwlCPiCEht9gM69kkf04hiyI+mZmNsRsdtUhkii4Y5iyFxAHajxvuQfR7hMvIWN0bL2lSUOMQUV1Gj8YrNyKV9Ca/ZntCwwqg6YTjG4ltclS2RVM8KlO1nY3t2+D3+mqmM1YLeW3gJa1hJNDeKsyMvMt2L8ftcAGAtzkuKxBPtVhwaCnffCAjRO2g2SbZs8ifzJZReAO8YhGkMDWWeRzCOWz0oerYnMG/aJ73u+yI1yo1Ea3IsHH3HAF5x9dABke/uUC2nHaJiCOHTF+0gYh86xg5XxAJS1TXkOT7pBdd/ZjSO9zCiYEgu4ycLTPefGTkeVfZIbPQR+tRCuH/Wd2EH3xE3z4oogtgObRChSj0wjKrCQ/IDTEaVm29eT0/5lliw9uauzbv0aPTMuFEqs0zRTY3EcgY10mMMXRMbEth7xWPXMgv/v8db1fNKyFUVhEg26qieFOQ+XWQgGuensXnqQROQHEKuj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(376002)(136003)(396003)(346002)(366004)(451199021)(2906002)(83380400001)(30864003)(186003)(6512007)(66556008)(9686003)(66476007)(66946007)(316002)(4326008)(6636002)(26005)(478600001)(8936002)(53546011)(6506007)(5660300002)(41300700001)(8676002)(6862004)(6486002)(38100700002)(82960400001)(33716001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tHW9Xbgt5E4bFDGg+YsEZRWT7BwnoK7pMmIKTcVofFkw+HVJuTCLVe1cGZ8v?=
 =?us-ascii?Q?PNJ2b4kug4wT6FuUXq4No1Mirn3gHfnaF55w1rJMeCP4hJHRatNAYb79mt3S?=
 =?us-ascii?Q?qscv7oUu2eksjl5huGHrzMrj384P2vUiSmeSIIEZdzNUZ6ibICEmiZY+wAC5?=
 =?us-ascii?Q?OMRH+ELOnlO7HSs7EKHkin+Iki+8YYyKYquXHQnsya6A4/aMxX5IJ5FcWY0y?=
 =?us-ascii?Q?/92tT59b/Pm9y7mRg3qxWIOdOCYamLBMqB5Yo43+rawGMafdWlcMH0pMUpsl?=
 =?us-ascii?Q?wI7gmDV6jpHIRQ/Wx59zlEsvtugZGVzUSVb/eHZWi2RehbuPqj/RrDwAgL5d?=
 =?us-ascii?Q?F9dZnI3BaKabsP1ZBQ6pRvM/W3sZu8Logng9/5NBqYbhbBga9BaXTVZBMTlG?=
 =?us-ascii?Q?6C2eps8tyLn3sRNTPMag64u+TEZA66zIqCkcSnVDyL8/ENOQgWlG/MIIQQI2?=
 =?us-ascii?Q?Ptd/ymDAm6hFK/NVv8waRcRMBETkyYGBWDzw2dSPyIibE9rSIaGVxkX93HpM?=
 =?us-ascii?Q?wkOHYfkgNmUi143TlNEZCjpEaEqU4cog7/vh1ba7rVOAVGLxZhBpknxTp30H?=
 =?us-ascii?Q?TL+iR8Z4dYG19QMtNaYN+xEABgFZHXRpkxMRi/k7mAqPNLxkCw5s3e54K5Nt?=
 =?us-ascii?Q?GsNmqVhbkWlim+DMc3QXClMsCRYOFtG//oteqcklfY+CpNsvPLmDS9z+QsAA?=
 =?us-ascii?Q?RMfhGFMG+Kn6qbuJo0toUz83SdDTnIrA/5MpAYLejWxQh6dPldPD2ZBoNxfp?=
 =?us-ascii?Q?tbbubJL0o3QHDyhs2CXFOcwhw5FCbPKzMm/IKaaAqVShuaCuP9CSbV23ZyY8?=
 =?us-ascii?Q?bt8WXTTFh8E7EtgzPxkgDLsqiGclA+l7izgmj3O6SoGa3Nz5QNb9i5fN0YY2?=
 =?us-ascii?Q?vLB31bOUhwKvcIg1PAyfIaDK65aua2nVph4xEWjBPdlwOvJBPWyXOmsHl7qx?=
 =?us-ascii?Q?O8FocnVfmBwoGe9xs+whu0pviGUfpvWh+U/8k6R6nkTxqhdVBGJv8RSt8yzO?=
 =?us-ascii?Q?t4MPVBlZGOouQENWS0uCM7r508604idu6VAHL0YbIyhod7Ps4a0BvOmPDcYq?=
 =?us-ascii?Q?Z1hE8lksxroeMrqhx0GecXphYr8GnVFSxe9WLHr+1YlJ9+97ap2tes+RKVOE?=
 =?us-ascii?Q?H2aPEcZ4uW41Jiu5ZzRFmY6BMKbXpuL4Uq0qjtHhSIiB3dLUOat2mTFM7X8X?=
 =?us-ascii?Q?a1m3xVEVL8Yz5lHuF6WWwhD1n6au+gRyUupVbgXk63238P4pi9cSlcqHT3Z7?=
 =?us-ascii?Q?DuoyEOWCul82jVfsJ42OUFaU7GkZ7NGpaCcMpe98p+VLSLnFHxuLIiRR04fw?=
 =?us-ascii?Q?A30vQO3jfzZC183PkAQsyugTv9s5uubfrUxeG94xm7KbPgJbm+vIRY9z/hzX?=
 =?us-ascii?Q?AXLoUZevhdKSJzLsoFRAVib96AMEWookER5yqrZB8PVWl7GYcK4j6qZKIzXy?=
 =?us-ascii?Q?4PygGcQA1l92GZI1r6r/hCbXBSc1AHBbgtG1sU+h4WKVNxCADVKxUcW5NErT?=
 =?us-ascii?Q?rcSkJkTKojniOJTtJzGQ5erTP84m8P/NT1Keb7vtbFnIaRzpTPws4N4OalyJ?=
 =?us-ascii?Q?TKKBrfJI/obQN5jV9SJHfwUGbujdY5UL1GIIVQOE+HpGQGw/MXStLouNA/oW?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d35a60a-e7b5-46d4-04a6-08db72aaef69
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 22:57:49.2296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eTeXs5kzFZvRoyT/GjmavIcDiyu+CzvyakowjM1UFcZmxja2h8C/V6pL0XkIdifFp5o/MHCTh7NEyX4+xJZlgYGP79FvUgynXn9uXASW6jI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5372
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Add reg read/write trace
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jun 20, 2023 at 07:10:43PM -0700, Matt Roper wrote:
>On Tue, Jun 20, 2023 at 05:25:49PM -0700, Lucas De Marchi wrote:
>> On Tue, Jun 20, 2023 at 10:38:50PM +0000, Radhakrishna Sripada wrote:
>> >
>> >
>> > > -----Original Message-----
>> > > From: De Marchi, Lucas <lucas.demarchi@intel.com>
>> > > Sent: Tuesday, June 20, 2023 2:28 PM
>> > > To: Sripada, Radhakrishna <radhakrishna.sripada@intel.com>
>> > > Cc: intel-xe@lists.freedesktop.org; Roper, Matthew D
>> > > <matthew.d.roper@intel.com>
>> > > Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Add reg read/write trace
>> > >
>> > > On Tue, Jun 20, 2023 at 12:32:29PM -0700, Radhakrishna Sripada wrote:
>> > > >This will help debug register read/writes and provide
>> > > >a way to trace all the mmio transactions.
>> > > >
>> > > >In order to avoid spam from xe_mmio_wait32,
>> > > >xe_mmio_read32_notrace is introduced and used.
>> > >
>> > > feedback given before was to avoid the exported _notrace stuff. If there
>> > > was a justification for it somewhere I probably lost it. Could you
>> > > clarify? If I understand the above paragraph correctly, it's due to
>> > > the fact the xe_mmio_wait32() reads the register multiple times...
>> > > why would we want to avoid the "spam"? If we are reading it multiple
>> > > times, the trace should show it instead of hiding.  If we demonstrate
>> > > there is an actual impact, then xe_mmio_wait32() should be adjusted, not
>> > > the rest of the shim layer in intel_uncore.h
>> > Unless I missed some whaere earlier feedback I received was on the usage of inline in function definitions.
>> > Xe_mmio_wait32 I believe is loosely based out of __intel_wait_for_register(atleast based on compat-headers)
>> > Where during the actual check, no trace version of register read is used and just the final value is traced before
>> > Returning from the function. A similar kind of approach is adapted here.
>> >
>> > If it does not make much value like that then I believe we can use a traceable version
>> > But in case if developers want to have a stack trace for each tracee out put then the spam becomes even more
>> > messy.
>>
>> there was a chat last week about that... maybe I misremembered and you
>> were not part of it.  The trace part should be pretty cheap to be kept
>> everywhere, particularly because it's not enabled by default it's
>> nothing more than a few nop instructions.
>>
>> If we don't trace everything and hide some of them behind functions like
>> xe_mmio_wait32() or intel_uncore_read_fw(), with no indication in their
>> name that they won't trace, then when we are reading the trace we spend
>> a long time tracking back what exactly was happening.
>> When we have the complete trace, filtering should be pretty
>> easy. Eliminating random traces means we lose information that is not
>> possible to recover after the fact.
>
>I could see an argument for avoiding tracepoint i915:i915_reg_rw within
>xe_mmio_wait32() if that function utilized separate tracepoints like
>i915:i915_reg_wait_start and i915:i915_reg_wait_end instead.  That could
>potentially consolidate the repeated trace output down to just two lines
>without losing any information.  We don't have tracepoints like those
>today though.

you mean xe:xe_mmio_wait_start/xe:xe_mmio_wait_end, right?
Yes, that would be good and the non-tracing functions would be local to
xe_mmio rather than exported for everybody to shoot their own foot.

Lucas De Marchi

>
>
>Matt
>
>>
>> >
>> > >
>> > > >
>> > > >v2: Do not use inline for the function declarations.(MattR)
>> > > >
>> > > >Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > >Cc: Matt Roper <matthew.d.roper@intel.com>
>> > > >Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>> > > >---
>> > > > .../drm/xe/compat-i915-headers/intel_uncore.h |  8 +-
>> > > > drivers/gpu/drm/xe/xe_mmio.c                  | 80 ++++++++++++++++++-
>> > > > drivers/gpu/drm/xe/xe_mmio.h                  |  5 ++
>> > > > drivers/gpu/drm/xe/xe_trace.h                 | 26 ++++++
>> > > > 4 files changed, 111 insertions(+), 8 deletions(-)
>> > > >
>> > > >diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>> > > b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>> > > >index fae6213d26f1..036f3b963a84 100644
>> > > >--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>> > > >+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>> > > >@@ -113,7 +113,7 @@ static inline u32 intel_uncore_read_fw(struct
>> > > fake_uncore *uncore,
>> > > > {
>> > > > 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> > > >
>> > > >-	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
>> > > >+	return xe_mmio_read32_notrace(__fake_uncore_to_gt(uncore), reg);
>> > >
>> > > how would you even know that intel_uncore_read_fw() is non-traceable?
>> > > ditto for all the other functions in this header.
>> > In i915 intel_uncore_read_fw and other _fw functions translate to raw_uncore_read
>> > And its variants which do not include the GEN6 Header/footer which have the traces
>> > included and hence are the non-trace variants. Unless I am missing something.
>>
>> I meant "as a user of the API". There's no clue whatsoever in
>> intel_uncore_read_fw() that it will not trace. I think the selective
>> trace/no-trace in random places in i915 was a mistake.
>>
>> Lucas De Marchi
>>
>> >
>> > --Radhakrishna(RK) Sripada
>> > >
>> > >
>> > > Lucas De Marchi
>> > >
>> > > > }
>> > > >
>> > > > static inline void intel_uncore_write_fw(struct fake_uncore *uncore,
>> > > >@@ -121,7 +121,7 @@ static inline void intel_uncore_write_fw(struct
>> > > fake_uncore *uncore,
>> > > > {
>> > > > 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> > > >
>> > > >-	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
>> > > >+	xe_mmio_write32_notrace(__fake_uncore_to_gt(uncore), reg, val);
>> > > > }
>> > > >
>> > > > static inline u32 intel_uncore_read_notrace(struct fake_uncore *uncore,
>> > > >@@ -129,7 +129,7 @@ static inline u32 intel_uncore_read_notrace(struct
>> > > fake_uncore *uncore,
>> > > > {
>> > > > 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> > > >
>> > > >-	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
>> > > >+	return xe_mmio_read32_notrace(__fake_uncore_to_gt(uncore), reg);
>> > > > }
>> > > >
>> > > > static inline void intel_uncore_write_notrace(struct fake_uncore *uncore,
>> > > >@@ -137,7 +137,7 @@ static inline void intel_uncore_write_notrace(struct
>> > > fake_uncore *uncore,
>> > > > {
>> > > > 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> > > >
>> > > >-	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
>> > > >+	xe_mmio_write32_notrace(__fake_uncore_to_gt(uncore), reg, val);
>> > > > }
>> > > >
>> > > > #endif /* __INTEL_UNCORE_H__ */
>> > > >diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> > > >index 78c7f839f783..ef2192a2d060 100644
>> > > >--- a/drivers/gpu/drm/xe/xe_mmio.c
>> > > >+++ b/drivers/gpu/drm/xe/xe_mmio.c
>> > > >@@ -19,6 +19,7 @@
>> > > > #include "xe_gt_mcr.h"
>> > > > #include "xe_macros.h"
>> > > > #include "xe_module.h"
>> > > >+#include "xe_trace.h"
>> > > >
>> > > > #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
>> > > > #define TILE_COUNT		REG_GENMASK(15, 8)
>> > > >@@ -429,7 +430,7 @@ static const struct xe_reg mmio_read_whitelist[] = {
>> > > > 	RING_TIMESTAMP(RENDER_RING_BASE),
>> > > > };
>> > > >
>> > > >-u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>> > > >+u8 xe_mmio_read8_notrace(struct xe_gt *gt, struct xe_reg reg)
>> > > > {
>> > > > 	struct xe_tile *tile = gt_to_tile(gt);
>> > > >
>> > > >@@ -439,6 +440,31 @@ u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg
>> > > reg)
>> > > > 	return readb(tile->mmio.regs + reg.addr);
>> > > > }
>> > > >
>> > > >+u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>> > > >+{
>> > > >+	struct xe_tile *tile = gt_to_tile(gt);
>> > > >+	u8 val;
>> > > >+
>> > > >+	if (reg.addr < gt->mmio.adj_limit)
>> > > >+		reg.addr += gt->mmio.adj_offset;
>> > > >+
>> > > >+	val = readb(tile->mmio.regs + reg.addr);
>> > > >+
>> > > >+	trace_xe_reg_rw(false, &reg, val, sizeof(val));
>> > > >+
>> > > >+	return val;
>> > > >+}
>> > > >+
>> > > >+void xe_mmio_write32_notrace(struct xe_gt *gt, struct xe_reg reg, u32 val)
>> > > >+{
>> > > >+	struct xe_tile *tile = gt_to_tile(gt);
>> > > >+
>> > > >+	if (reg.addr < gt->mmio.adj_limit)
>> > > >+		reg.addr += gt->mmio.adj_offset;
>> > > >+
>> > > >+	writel(val, tile->mmio.regs + reg.addr);
>> > > >+}
>> > > >+
>> > > > void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
>> > > > {
>> > > > 	struct xe_tile *tile = gt_to_tile(gt);
>> > > >@@ -446,10 +472,12 @@ void xe_mmio_write32(struct xe_gt *gt, struct
>> > > xe_reg reg, u32 val)
>> > > > 	if (reg.addr < gt->mmio.adj_limit)
>> > > > 		reg.addr += gt->mmio.adj_offset;
>> > > >
>> > > >+	trace_xe_reg_rw(true, &reg, val, sizeof(val));
>> > > >+
>> > > > 	writel(val, tile->mmio.regs + reg.addr);
>> > > > }
>> > > >
>> > > >-u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>> > > >+u32 xe_mmio_read32_notrace(struct xe_gt *gt, struct xe_reg reg)
>> > > > {
>> > > > 	struct xe_tile *tile = gt_to_tile(gt);
>> > > >
>> > > >@@ -459,6 +487,21 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg
>> > > reg)
>> > > > 	return readl(tile->mmio.regs + reg.addr);
>> > > > }
>> > > >
>> > > >+u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>> > > >+{
>> > > >+	struct xe_tile *tile = gt_to_tile(gt);
>> > > >+	u32 val;
>> > > >+
>> > > >+	if (reg.addr < gt->mmio.adj_limit)
>> > > >+		reg.addr += gt->mmio.adj_offset;
>> > > >+
>> > > >+	val = readl(tile->mmio.regs + reg.addr);
>> > > >+
>> > > >+	trace_xe_reg_rw(false, &reg, val, sizeof(val));
>> > > >+
>> > > >+	return val;
>> > > >+}
>> > > >+
>> > > > u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set)
>> > > > {
>> > > > 	u32 old, reg_val;
>> > > >@@ -470,6 +513,16 @@ u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg
>> > > reg, u32 clr, u32 set)
>> > > > 	return old;
>> > > > }
>> > > >
>> > > >+void xe_mmio_write64_notrace(struct xe_gt *gt, struct xe_reg reg, u64 val)
>> > > >+{
>> > > >+	struct xe_tile *tile = gt_to_tile(gt);
>> > > >+
>> > > >+	if (reg.addr < gt->mmio.adj_limit)
>> > > >+		reg.addr += gt->mmio.adj_offset;
>> > > >+
>> > > >+	writeq(val, tile->mmio.regs + reg.addr);
>> > > >+}
>> > > >+
>> > > > void xe_mmio_write64(struct xe_gt *gt, struct xe_reg reg, u64 val)
>> > > > {
>> > > > 	struct xe_tile *tile = gt_to_tile(gt);
>> > > >@@ -477,10 +530,12 @@ void xe_mmio_write64(struct xe_gt *gt, struct
>> > > xe_reg reg, u64 val)
>> > > > 	if (reg.addr < gt->mmio.adj_limit)
>> > > > 		reg.addr += gt->mmio.adj_offset;
>> > > >
>> > > >+	trace_xe_reg_rw(true, &reg, val, sizeof(val));
>> > > >+
>> > > > 	writeq(val, tile->mmio.regs + reg.addr);
>> > > > }
>> > > >
>> > > >-u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
>> > > >+u64 xe_mmio_read64_notrace(struct xe_gt *gt, struct xe_reg reg)
>> > > > {
>> > > > 	struct xe_tile *tile = gt_to_tile(gt);
>> > > >
>> > > >@@ -490,6 +545,21 @@ u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg
>> > > reg)
>> > > > 	return readq(tile->mmio.regs + reg.addr);
>> > > > }
>> > > >
>> > > >+u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
>> > > >+{
>> > > >+	struct xe_tile *tile = gt_to_tile(gt);
>> > > >+	u64 val;
>> > > >+
>> > > >+	if (reg.addr < gt->mmio.adj_limit)
>> > > >+		reg.addr += gt->mmio.adj_offset;
>> > > >+
>> > > >+	val = readq(tile->mmio.regs + reg.addr);
>> > > >+
>> > > >+	trace_xe_reg_rw(false, &reg, val, sizeof(val));
>> > > >+
>> > > >+	return val;
>> > > >+}
>> > > >+
>> > > > int xe_mmio_write32_and_verify(struct xe_gt *gt, struct xe_reg reg, u32 val,
>> > > > 			       u32 mask, u32 eval)
>> > > > {
>> > > >@@ -511,7 +581,7 @@ int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg
>> > > reg, u32 val, u32 mask,
>> > > > 	u32 read;
>> > > >
>> > > > 	for (;;) {
>> > > >-		read = xe_mmio_read32(gt, reg);
>> > > >+		read = xe_mmio_read32_notrace(gt, reg);
>> > > > 		if ((read & mask) == val) {
>> > > > 			ret = 0;
>> > > > 			break;
>> > > >@@ -531,6 +601,8 @@ int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg
>> > > reg, u32 val, u32 mask,
>> > > > 		wait <<= 1;
>> > > > 	}
>> > > >
>> > > >+	trace_xe_reg_rw(false, &reg, read, sizeof(read));
>> > > >+
>> > > > 	if (out_val)
>> > > > 		*out_val = read;
>> > > >
>> > > >diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>> > > >index c06fcac2cc5b..02364ba9dda2 100644
>> > > >--- a/drivers/gpu/drm/xe/xe_mmio.h
>> > > >+++ b/drivers/gpu/drm/xe/xe_mmio.h
>> > > >@@ -20,11 +20,16 @@ struct xe_device;
>> > > > #define GEN12_LMEM_BAR		2
>> > > >
>> > > > int xe_mmio_init(struct xe_device *xe);
>> > > >+u8 xe_mmio_read8_notrace(struct xe_gt *gt, struct xe_reg reg);
>> > > > u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg);
>> > > >+void xe_mmio_write32_notrace(struct xe_gt *gt, struct xe_reg reg, u32 val);
>> > > > void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
>> > > >+u32 xe_mmio_read32_notrace(struct xe_gt *gt, struct xe_reg reg);
>> > > > u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg);
>> > > > u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set);
>> > > >+void xe_mmio_write64_notrace(struct xe_gt *gt, struct xe_reg reg, u64 val);
>> > > > void xe_mmio_write64(struct xe_gt *gt, struct xe_reg reg, u64 val);
>> > > >+u64 xe_mmio_read64_notrace(struct xe_gt *gt, struct xe_reg reg);
>> > > > u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg);
>> > > > int xe_mmio_write32_and_verify(struct xe_gt *gt, struct xe_reg reg, u32 val,
>> > > > 			       u32 mask, u32 eval);
>> > > >diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>> > > >index 2f8eb7ebe9a7..a5d514c190a2 100644
>> > > >--- a/drivers/gpu/drm/xe/xe_trace.h
>> > > >+++ b/drivers/gpu/drm/xe/xe_trace.h
>> > > >@@ -12,6 +12,7 @@
>> > > > #include <linux/tracepoint.h>
>> > > > #include <linux/types.h>
>> > > >
>> > > >+#include "regs/xe_reg_defs.h"
>> > > > #include "xe_bo_types.h"
>> > > > #include "xe_engine_types.h"
>> > > > #include "xe_gt_tlb_invalidation_types.h"
>> > > >@@ -507,6 +508,31 @@ DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_exit,
>> > > > 	     TP_ARGS(vm)
>> > > > );
>> > > >
>> > > >+TRACE_EVENT(xe_reg_rw,
>> > > >+	    TP_PROTO(bool write, struct xe_reg *reg, u64 val, int len),
>> > > >+	    TP_ARGS(write, reg, val, len),
>> > > >+
>> > > >+	    TP_STRUCT__entry(
>> > > >+		    __field(u64, val)
>> > > >+		    __field(struct xe_reg *, reg)
>> > > >+		    __field(u16, write)
>> > > >+		    __field(u16, len)
>> > > >+		    ),
>> > > >+
>> > > >+	    TP_fast_assign(
>> > > >+		   __entry->val = (u64)val;
>> > > >+		   __entry->reg = reg;
>> > > >+		   __entry->write = write;
>> > > >+		   __entry->len = len;
>> > > >+		),
>> > > >+
>> > > >+	    TP_printk("%s reg=0x%x, len=%d, val=(0x%x, 0x%x)",
>> > > >+		      __entry->write ? "write" : "read",
>> > > >+		      __entry->reg->addr, __entry->len,
>> > > >+		      (u32)(__entry->val & 0xffffffff),
>> > > >+		      (u32)(__entry->val >> 32))
>> > > >+);
>> > > >+
>> > > > TRACE_EVENT(xe_guc_ct_h2g_flow_control,
>> > > > 	    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
>> > > > 	    TP_ARGS(_head, _tail, size, space, len),
>> > > >--
>> > > >2.34.1
>> > > >
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
