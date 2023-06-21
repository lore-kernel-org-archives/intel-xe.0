Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268B4EB64D8
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jun 2023 00:25:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C2D10E031;
	Wed, 21 Jun 2023 00:25:58 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98D010E031
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jun 2023 00:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687307156; x=1718843156;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yAVDizbvHy2R2TnrhBvIsexqEHqTdfQdD0EZoIVTESI=;
 b=kzIL0aUlFX8vs3o/IXmf6Nh4MYWGraaLc2zx0VRzlRDri6TFELcw7yzL
 HTN0m/YDDH4qMe13oAvbo3fjt8GYbXIhqoqUhb0Qp/fOO8y9DoS7LPJ9E
 5ip1Jx0vK6wjAXFGVMNAI4hHJYSaD3qkkxwcn82R31AkIk1yq7KHmQKXF
 M8wehdXK00Zs+G2EtR+TyLG880yl3MoqWFkaR51vPhbhT6JtCVKgkNHvS
 PO9onJD2ZFGBV1LHpcZrPTKnjnASAPMVrwZTxBTEqUr2UCa37/FVJG1Y9
 FqFCYPsc1hhMjRiXziIEHXB/EHkwDua9MMGylqGpIlgKosXRRkPxgl8r3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="423687136"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; d="scan'208";a="423687136"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 17:25:55 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="748361210"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; d="scan'208";a="748361210"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 20 Jun 2023 17:25:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 17:25:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 17:25:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 20 Jun 2023 17:25:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 20 Jun 2023 17:25:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9rsn3TKjvDbrCO3uGPtndGwDkH0SwB+OgUBNHyORx5uaMvFxQSq3/ExYe69yjSRgpq2eaLoBtqEGzVT80DBXbyyLLiDehp61WsUmL6o+UvkA1ndcCEJrhkwbHdNwCzTL7TKxFrIayEraQjJDRWxS17AaxOiXySYzbEIJ0xi3iO3baTDKehb7H9JJVvhrEixFSIleVxU4FPONBnAxlDSQt8SY7TQTuWAeLm1XrR6ucu50fP4j71q4JN21tTIa6Q7L1usAvvAb6iMRngC7JzCehOM093c2G19wzzB16nEo8PgRFSO9qTC3PVTXsWHSDnFJhU8YLLGwCBHyDZ0XTbrjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPonnW1ecDJv0pV8GIxiEj2ZJpLOUeBraVuZzCOrwPs=;
 b=VewxsLlbVb8nFVmmJdlNkxkRApNg5gdlc56xfhz+l6HJWg/9PSwt0cBR7lSnsECwZy/XGayA/tYcCLJbnL6jqVeDyPArIKV2AsOBU/NFXzo0EXZJse69hK27d7BkWizpLD+dJtwiv0pZp8Ci/Q3kazYk6icqL3YcMfMFaOUsZKF0iNbzzl9O3Sx9Tj+xbs4xhzF3xujlKrTxI37olQF96DHLMmEsX6rSGrSIarTCtPj9Nr+gyH0HDNyuAQa0jVe4q+mc7RNemKYqr5R5pgND5U2Xb/Fsqt4SuDSsCBlmiEgMuafzV3OxBxqLoyGnzmWvZidUv2pSCTrN9019DkZ0Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7296.namprd11.prod.outlook.com (2603:10b6:208:427::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 00:25:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 00:25:51 +0000
Date: Tue, 20 Jun 2023 17:25:49 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
Message-ID: <oekkd7ikdekbxmqaumvffxxxmgimawic232muweq4c2vgjpd7q@4fkzr5dpx55o>
References: <20230620193229.1698372-1-radhakrishna.sripada@intel.com>
 <20230620193229.1698372-3-radhakrishna.sripada@intel.com>
 <p7zjd7pktccivhdosyrteoixzrkqqiawzcjluhfujwo35qpisl@zol4cc6pxhjp>
 <DM4PR11MB5971ED74CBC0D05B16B0CD41875CA@DM4PR11MB5971.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <DM4PR11MB5971ED74CBC0D05B16B0CD41875CA@DM4PR11MB5971.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0269.namprd04.prod.outlook.com
 (2603:10b6:303:88::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7296:EE_
X-MS-Office365-Filtering-Correlation-Id: 24f16cdf-a187-4b2f-38de-08db71ee112a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d10N7hiHnpbpIPxiPpHyL/sUiRJRyYvuxAQaN19wfuEV88GnkkxqqMWqazBHe3Fyyo4+64KQ5wStHQYwaLecB+BY22nml94ndAxdKUNnH+3ub9kR9CEQuKgjRvjZogF/FbK5VBThqYwfjrC1pIqJqKLVvCQ1urs2DtxDXnqUWNuf5m29sNsQaX84MwkbIe5sHpEv/4NBmGnTyLnJD8mw/WBNpvRYN073/noycuPOvBea0oRQ0FUXQgElRrNkXUznnYOc3qKJ3VMlouNQE8dx7OCXFTGIwWmn6Uv50gfGUFqklKH2AD5kZrxyXvaWNK3FeAmiyH8e4EZeG/mAWsLrljUGkXM+8L5uUyWeMvyTuZunw7H+27JkgB6jUzceoeqNyBgZM4BvhiG8IXwnFugXkHdqu5nl3RqI7ndPuLXw5ogCUwpLGZHKctvE5RlDFS0g1FFVdEpfk//9XCAlEGMiwNq0JGD98FGm0j0oS41YRHmUV8U4mgs8DrCiVLdDovMqF1OAPBtqbXC2eH6K1oPcw7S4UTDGV4/BuZnqlbZRD5nA+nJHKIB+bvMu8pEtAYMO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199021)(186003)(8936002)(8676002)(66556008)(66476007)(5660300002)(6862004)(54906003)(4326008)(26005)(316002)(33716001)(66946007)(6486002)(478600001)(41300700001)(53546011)(6636002)(6512007)(38100700002)(9686003)(6506007)(30864003)(86362001)(83380400001)(2906002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2BkO4zgB6jewI0ghP+H5VljWiOGruUJ9wMhG4nob6poSgjRernicb09L2Z2s?=
 =?us-ascii?Q?n9Q6h/gpKDfLD9+FMWaBZ+1hges89VcYcW0Ef0b7HTPiD0vP7BqACalEfrk1?=
 =?us-ascii?Q?8H6V46cuK2yNcaIjnPDdtP0rGVQPOpdv7nKYFs5PQn5a6dreoPfYfN0UJa25?=
 =?us-ascii?Q?GBWg77zV6/EQepoDRn4KmEv5f8y/OYAlpqfgNFMgFVXs1zp7Y4RKWFxHc1OL?=
 =?us-ascii?Q?5C2EhfWPmpOn7oet9agI7uRr+xm7YyxIiH+EkgkYZxyF3CqYSVV5iM3l+6UV?=
 =?us-ascii?Q?hefkruoeKswK2brVI007GiPfm6r0BKr7WQCARE60c5PxTJCL0YNa71lqA9Qg?=
 =?us-ascii?Q?CKChNiWb9K8j3leXIu2ILNM7cE96NT/SpJL7SXEujJC5HzkAUseBR7mZKOiz?=
 =?us-ascii?Q?G1y/MO7100siy1UDYM3G1W9C/8VrEVVmDP3QGPE3b9J40oqj21+s1LGq011K?=
 =?us-ascii?Q?YR4AI5CldS/Z84uKlAmiNTlzi8ZfWANGIPXBP7QpvsvTHsiarltawsPHDiwg?=
 =?us-ascii?Q?HLKvTBqoSIKGAkd8BFNkhSGSNjXli2Bw26anvsyEEBEf+Z69E5m41e8yrSOP?=
 =?us-ascii?Q?2HhuY7WT8flMhP5KJZNA3yAiY6Hl68GUwV0dzrSz6iYuS7OFE/eo136pgg+1?=
 =?us-ascii?Q?YgbS7sTxBuWftZykK+tST09xcj63+J626VHNyiq7i0aVYv6hTiQLarPdt+mx?=
 =?us-ascii?Q?18M9WzVqedK5uTih0WGIzGGUcPb34zivqEaldN182k9NDh+QCvaJ+yyPYkXM?=
 =?us-ascii?Q?b9Wj1m1S5rVNQLzOdjZsf6Or5YZhteWYY7jkAIc1E72brNJp/Ug6CkwTi/9F?=
 =?us-ascii?Q?IUusF3YJULiFOIUBvdL7290zFU8oZl8goBQDPvHL3JmXuPnv7hyxgpBZXyvq?=
 =?us-ascii?Q?4F5+30OHSRyaURfVLqHZcwXruKln9LRpq37wO/H94WHMTbmq/1Zwv4FJkNMr?=
 =?us-ascii?Q?TbDoSZjPH3chDSrIt7IU3hVdQKTbtSOGVaYXo8fV12IEG+QzMuJQCyOB8S7n?=
 =?us-ascii?Q?8hjxWEv4oyPMK3Lc0B88dqy7qupbOTrt5GBOYXJP6x3LWgjx/oQESHT8XlCS?=
 =?us-ascii?Q?/0SON5IHfrwrCyHXisYlo3A1N4hZFVwjK2wnB8X2Qqm+ka2OSVcgYNmoXFMn?=
 =?us-ascii?Q?AjlqPLVzHMOnVZ0Lt44NNUlqtKSUQiLaVWySp/vTNGmng154m1Op9StxTxtQ?=
 =?us-ascii?Q?e+TXPBkFLMYt3zf0ScnbeGiaWP3+BYKZLFE6rcMYSD11OXHUH9BHOzfIlo2d?=
 =?us-ascii?Q?q+1f71mqCFAmHLkoJzhNNjTO2NIGb5tD1shPWMdv8XAVE/PrMI74+2zGKTjW?=
 =?us-ascii?Q?8eHQP1fpPYCJUdi5WCyVzEjgXyflpRGoHcOV3IGUlDnuJYaUjOJ8iSL+sZ0u?=
 =?us-ascii?Q?1wKJ0YNkWWz0QRdpmMPz8/Skvbv1o1oRomGg+rCLZyli9W5nyVmEUvaNryXC?=
 =?us-ascii?Q?Yuyc2wnGMLlJu0xhjwUs5cUuzDOZhGqvjsdw/LCOyS81ctfdAI56wVPnBBnM?=
 =?us-ascii?Q?PxF/R4UU4lpXLkkSGNdMNmnIXPkDv+8jk1RHAu/tgZSflwOz7eVlnH1ceGg0?=
 =?us-ascii?Q?fG1DZwUp70nVuDLSjGc+6TuAT6z8MgUbktY+pH/UjmKaUe53nILdBQybCgK4?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f16cdf-a187-4b2f-38de-08db71ee112a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 00:25:50.8926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: txbtAYkgC/3NMVcY3Z5zMNKmSyNb+bQoDsJXWkTS6xo+bvbx6JMzAHGl2c+MYfZrH5wOEeKM+HJNmBib2YfZlnCPS2RCrNDkToA5eQZWrJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7296
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jun 20, 2023 at 10:38:50PM +0000, Radhakrishna Sripada wrote:
>
>
>> -----Original Message-----
>> From: De Marchi, Lucas <lucas.demarchi@intel.com>
>> Sent: Tuesday, June 20, 2023 2:28 PM
>> To: Sripada, Radhakrishna <radhakrishna.sripada@intel.com>
>> Cc: intel-xe@lists.freedesktop.org; Roper, Matthew D
>> <matthew.d.roper@intel.com>
>> Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Add reg read/write trace
>>
>> On Tue, Jun 20, 2023 at 12:32:29PM -0700, Radhakrishna Sripada wrote:
>> >This will help debug register read/writes and provide
>> >a way to trace all the mmio transactions.
>> >
>> >In order to avoid spam from xe_mmio_wait32,
>> >xe_mmio_read32_notrace is introduced and used.
>>
>> feedback given before was to avoid the exported _notrace stuff. If there
>> was a justification for it somewhere I probably lost it. Could you
>> clarify? If I understand the above paragraph correctly, it's due to
>> the fact the xe_mmio_wait32() reads the register multiple times...
>> why would we want to avoid the "spam"? If we are reading it multiple
>> times, the trace should show it instead of hiding.  If we demonstrate
>> there is an actual impact, then xe_mmio_wait32() should be adjusted, not
>> the rest of the shim layer in intel_uncore.h
>Unless I missed some whaere earlier feedback I received was on the usage of inline in function definitions.
>Xe_mmio_wait32 I believe is loosely based out of __intel_wait_for_register(atleast based on compat-headers)
>Where during the actual check, no trace version of register read is used and just the final value is traced before
>Returning from the function. A similar kind of approach is adapted here.
>
>If it does not make much value like that then I believe we can use a traceable version
>But in case if developers want to have a stack trace for each tracee out put then the spam becomes even more
>messy.

there was a chat last week about that... maybe I misremembered and you
were not part of it.  The trace part should be pretty cheap to be kept
everywhere, particularly because it's not enabled by default it's
nothing more than a few nop instructions.

If we don't trace everything and hide some of them behind functions like
xe_mmio_wait32() or intel_uncore_read_fw(), with no indication in their
name that they won't trace, then when we are reading the trace we spend
a long time tracking back what exactly was happening.
When we have the complete trace, filtering should be pretty
easy. Eliminating random traces means we lose information that is not
possible to recover after the fact.

>
>>
>> >
>> >v2: Do not use inline for the function declarations.(MattR)
>> >
>> >Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> >Cc: Matt Roper <matthew.d.roper@intel.com>
>> >Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>> >---
>> > .../drm/xe/compat-i915-headers/intel_uncore.h |  8 +-
>> > drivers/gpu/drm/xe/xe_mmio.c                  | 80 ++++++++++++++++++-
>> > drivers/gpu/drm/xe/xe_mmio.h                  |  5 ++
>> > drivers/gpu/drm/xe/xe_trace.h                 | 26 ++++++
>> > 4 files changed, 111 insertions(+), 8 deletions(-)
>> >
>> >diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>> b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>> >index fae6213d26f1..036f3b963a84 100644
>> >--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>> >+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>> >@@ -113,7 +113,7 @@ static inline u32 intel_uncore_read_fw(struct
>> fake_uncore *uncore,
>> > {
>> > 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> >
>> >-	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
>> >+	return xe_mmio_read32_notrace(__fake_uncore_to_gt(uncore), reg);
>>
>> how would you even know that intel_uncore_read_fw() is non-traceable?
>> ditto for all the other functions in this header.
>In i915 intel_uncore_read_fw and other _fw functions translate to raw_uncore_read
>And its variants which do not include the GEN6 Header/footer which have the traces
>included and hence are the non-trace variants. Unless I am missing something.

I meant "as a user of the API". There's no clue whatsoever in
intel_uncore_read_fw() that it will not trace. I think the selective
trace/no-trace in random places in i915 was a mistake.

Lucas De Marchi

>
>--Radhakrishna(RK) Sripada
>>
>>
>> Lucas De Marchi
>>
>> > }
>> >
>> > static inline void intel_uncore_write_fw(struct fake_uncore *uncore,
>> >@@ -121,7 +121,7 @@ static inline void intel_uncore_write_fw(struct
>> fake_uncore *uncore,
>> > {
>> > 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> >
>> >-	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
>> >+	xe_mmio_write32_notrace(__fake_uncore_to_gt(uncore), reg, val);
>> > }
>> >
>> > static inline u32 intel_uncore_read_notrace(struct fake_uncore *uncore,
>> >@@ -129,7 +129,7 @@ static inline u32 intel_uncore_read_notrace(struct
>> fake_uncore *uncore,
>> > {
>> > 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> >
>> >-	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
>> >+	return xe_mmio_read32_notrace(__fake_uncore_to_gt(uncore), reg);
>> > }
>> >
>> > static inline void intel_uncore_write_notrace(struct fake_uncore *uncore,
>> >@@ -137,7 +137,7 @@ static inline void intel_uncore_write_notrace(struct
>> fake_uncore *uncore,
>> > {
>> > 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> >
>> >-	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
>> >+	xe_mmio_write32_notrace(__fake_uncore_to_gt(uncore), reg, val);
>> > }
>> >
>> > #endif /* __INTEL_UNCORE_H__ */
>> >diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> >index 78c7f839f783..ef2192a2d060 100644
>> >--- a/drivers/gpu/drm/xe/xe_mmio.c
>> >+++ b/drivers/gpu/drm/xe/xe_mmio.c
>> >@@ -19,6 +19,7 @@
>> > #include "xe_gt_mcr.h"
>> > #include "xe_macros.h"
>> > #include "xe_module.h"
>> >+#include "xe_trace.h"
>> >
>> > #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
>> > #define TILE_COUNT		REG_GENMASK(15, 8)
>> >@@ -429,7 +430,7 @@ static const struct xe_reg mmio_read_whitelist[] = {
>> > 	RING_TIMESTAMP(RENDER_RING_BASE),
>> > };
>> >
>> >-u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>> >+u8 xe_mmio_read8_notrace(struct xe_gt *gt, struct xe_reg reg)
>> > {
>> > 	struct xe_tile *tile = gt_to_tile(gt);
>> >
>> >@@ -439,6 +440,31 @@ u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg
>> reg)
>> > 	return readb(tile->mmio.regs + reg.addr);
>> > }
>> >
>> >+u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>> >+{
>> >+	struct xe_tile *tile = gt_to_tile(gt);
>> >+	u8 val;
>> >+
>> >+	if (reg.addr < gt->mmio.adj_limit)
>> >+		reg.addr += gt->mmio.adj_offset;
>> >+
>> >+	val = readb(tile->mmio.regs + reg.addr);
>> >+
>> >+	trace_xe_reg_rw(false, &reg, val, sizeof(val));
>> >+
>> >+	return val;
>> >+}
>> >+
>> >+void xe_mmio_write32_notrace(struct xe_gt *gt, struct xe_reg reg, u32 val)
>> >+{
>> >+	struct xe_tile *tile = gt_to_tile(gt);
>> >+
>> >+	if (reg.addr < gt->mmio.adj_limit)
>> >+		reg.addr += gt->mmio.adj_offset;
>> >+
>> >+	writel(val, tile->mmio.regs + reg.addr);
>> >+}
>> >+
>> > void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
>> > {
>> > 	struct xe_tile *tile = gt_to_tile(gt);
>> >@@ -446,10 +472,12 @@ void xe_mmio_write32(struct xe_gt *gt, struct
>> xe_reg reg, u32 val)
>> > 	if (reg.addr < gt->mmio.adj_limit)
>> > 		reg.addr += gt->mmio.adj_offset;
>> >
>> >+	trace_xe_reg_rw(true, &reg, val, sizeof(val));
>> >+
>> > 	writel(val, tile->mmio.regs + reg.addr);
>> > }
>> >
>> >-u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>> >+u32 xe_mmio_read32_notrace(struct xe_gt *gt, struct xe_reg reg)
>> > {
>> > 	struct xe_tile *tile = gt_to_tile(gt);
>> >
>> >@@ -459,6 +487,21 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg
>> reg)
>> > 	return readl(tile->mmio.regs + reg.addr);
>> > }
>> >
>> >+u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>> >+{
>> >+	struct xe_tile *tile = gt_to_tile(gt);
>> >+	u32 val;
>> >+
>> >+	if (reg.addr < gt->mmio.adj_limit)
>> >+		reg.addr += gt->mmio.adj_offset;
>> >+
>> >+	val = readl(tile->mmio.regs + reg.addr);
>> >+
>> >+	trace_xe_reg_rw(false, &reg, val, sizeof(val));
>> >+
>> >+	return val;
>> >+}
>> >+
>> > u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set)
>> > {
>> > 	u32 old, reg_val;
>> >@@ -470,6 +513,16 @@ u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg
>> reg, u32 clr, u32 set)
>> > 	return old;
>> > }
>> >
>> >+void xe_mmio_write64_notrace(struct xe_gt *gt, struct xe_reg reg, u64 val)
>> >+{
>> >+	struct xe_tile *tile = gt_to_tile(gt);
>> >+
>> >+	if (reg.addr < gt->mmio.adj_limit)
>> >+		reg.addr += gt->mmio.adj_offset;
>> >+
>> >+	writeq(val, tile->mmio.regs + reg.addr);
>> >+}
>> >+
>> > void xe_mmio_write64(struct xe_gt *gt, struct xe_reg reg, u64 val)
>> > {
>> > 	struct xe_tile *tile = gt_to_tile(gt);
>> >@@ -477,10 +530,12 @@ void xe_mmio_write64(struct xe_gt *gt, struct
>> xe_reg reg, u64 val)
>> > 	if (reg.addr < gt->mmio.adj_limit)
>> > 		reg.addr += gt->mmio.adj_offset;
>> >
>> >+	trace_xe_reg_rw(true, &reg, val, sizeof(val));
>> >+
>> > 	writeq(val, tile->mmio.regs + reg.addr);
>> > }
>> >
>> >-u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
>> >+u64 xe_mmio_read64_notrace(struct xe_gt *gt, struct xe_reg reg)
>> > {
>> > 	struct xe_tile *tile = gt_to_tile(gt);
>> >
>> >@@ -490,6 +545,21 @@ u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg
>> reg)
>> > 	return readq(tile->mmio.regs + reg.addr);
>> > }
>> >
>> >+u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
>> >+{
>> >+	struct xe_tile *tile = gt_to_tile(gt);
>> >+	u64 val;
>> >+
>> >+	if (reg.addr < gt->mmio.adj_limit)
>> >+		reg.addr += gt->mmio.adj_offset;
>> >+
>> >+	val = readq(tile->mmio.regs + reg.addr);
>> >+
>> >+	trace_xe_reg_rw(false, &reg, val, sizeof(val));
>> >+
>> >+	return val;
>> >+}
>> >+
>> > int xe_mmio_write32_and_verify(struct xe_gt *gt, struct xe_reg reg, u32 val,
>> > 			       u32 mask, u32 eval)
>> > {
>> >@@ -511,7 +581,7 @@ int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg
>> reg, u32 val, u32 mask,
>> > 	u32 read;
>> >
>> > 	for (;;) {
>> >-		read = xe_mmio_read32(gt, reg);
>> >+		read = xe_mmio_read32_notrace(gt, reg);
>> > 		if ((read & mask) == val) {
>> > 			ret = 0;
>> > 			break;
>> >@@ -531,6 +601,8 @@ int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg
>> reg, u32 val, u32 mask,
>> > 		wait <<= 1;
>> > 	}
>> >
>> >+	trace_xe_reg_rw(false, &reg, read, sizeof(read));
>> >+
>> > 	if (out_val)
>> > 		*out_val = read;
>> >
>> >diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>> >index c06fcac2cc5b..02364ba9dda2 100644
>> >--- a/drivers/gpu/drm/xe/xe_mmio.h
>> >+++ b/drivers/gpu/drm/xe/xe_mmio.h
>> >@@ -20,11 +20,16 @@ struct xe_device;
>> > #define GEN12_LMEM_BAR		2
>> >
>> > int xe_mmio_init(struct xe_device *xe);
>> >+u8 xe_mmio_read8_notrace(struct xe_gt *gt, struct xe_reg reg);
>> > u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg);
>> >+void xe_mmio_write32_notrace(struct xe_gt *gt, struct xe_reg reg, u32 val);
>> > void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
>> >+u32 xe_mmio_read32_notrace(struct xe_gt *gt, struct xe_reg reg);
>> > u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg);
>> > u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set);
>> >+void xe_mmio_write64_notrace(struct xe_gt *gt, struct xe_reg reg, u64 val);
>> > void xe_mmio_write64(struct xe_gt *gt, struct xe_reg reg, u64 val);
>> >+u64 xe_mmio_read64_notrace(struct xe_gt *gt, struct xe_reg reg);
>> > u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg);
>> > int xe_mmio_write32_and_verify(struct xe_gt *gt, struct xe_reg reg, u32 val,
>> > 			       u32 mask, u32 eval);
>> >diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>> >index 2f8eb7ebe9a7..a5d514c190a2 100644
>> >--- a/drivers/gpu/drm/xe/xe_trace.h
>> >+++ b/drivers/gpu/drm/xe/xe_trace.h
>> >@@ -12,6 +12,7 @@
>> > #include <linux/tracepoint.h>
>> > #include <linux/types.h>
>> >
>> >+#include "regs/xe_reg_defs.h"
>> > #include "xe_bo_types.h"
>> > #include "xe_engine_types.h"
>> > #include "xe_gt_tlb_invalidation_types.h"
>> >@@ -507,6 +508,31 @@ DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_exit,
>> > 	     TP_ARGS(vm)
>> > );
>> >
>> >+TRACE_EVENT(xe_reg_rw,
>> >+	    TP_PROTO(bool write, struct xe_reg *reg, u64 val, int len),
>> >+	    TP_ARGS(write, reg, val, len),
>> >+
>> >+	    TP_STRUCT__entry(
>> >+		    __field(u64, val)
>> >+		    __field(struct xe_reg *, reg)
>> >+		    __field(u16, write)
>> >+		    __field(u16, len)
>> >+		    ),
>> >+
>> >+	    TP_fast_assign(
>> >+		   __entry->val = (u64)val;
>> >+		   __entry->reg = reg;
>> >+		   __entry->write = write;
>> >+		   __entry->len = len;
>> >+		),
>> >+
>> >+	    TP_printk("%s reg=0x%x, len=%d, val=(0x%x, 0x%x)",
>> >+		      __entry->write ? "write" : "read",
>> >+		      __entry->reg->addr, __entry->len,
>> >+		      (u32)(__entry->val & 0xffffffff),
>> >+		      (u32)(__entry->val >> 32))
>> >+);
>> >+
>> > TRACE_EVENT(xe_guc_ct_h2g_flow_control,
>> > 	    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
>> > 	    TP_ARGS(_head, _tail, size, space, len),
>> >--
>> >2.34.1
>> >
