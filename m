Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887CFC47258
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 21:55:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D98110EF37;
	Wed, 31 Jan 2024 21:55:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259C710EF37
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jan 2024 21:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706738121; x=1738274121;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8iwP+OkJZKEzLSDjf9r7JcMOb7dVzRBN6r63kfbv3og=;
 b=hSkAVtm374vd0+S5ETlUXapeer4bOEGpdwRA9SohtHZq/fhTD95QodMo
 5Gdzigg5yswbLDrlGaf69bKBgMqL6PoEin8+h0B0fqMDl30w9TKo0PuaU
 u7EGO567Tyr7pkaU4+oFVevzP67xGy6xsOfftnqaYZQiZL47PSTT1AddK
 gvR1Dt5hqc/uvem6H5tZnrHpfpYryWJfPpa0VGiCbgbNFCE3UwBxidE2h
 dVn/0Y2XxLyBWlEjAJe6CYrvkzIh4m7NiJcBZnuJuaHQNxcEaH1w042os
 ZTruaA5LoXexLwYQAqbewxquyYfpA802gLyS4C/ACP13BGRugn6VTTpx4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="11116482"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="11116482"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 13:55:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="858951635"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="858951635"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2024 13:55:20 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 13:55:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 13:55:19 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 13:55:19 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 31 Jan 2024 13:55:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tm/WQS69luUeRvJaMJa0ZErwOSPlDFezQdU8nm9p5oBravCbhrk6Kyc2evzBmdaUKs5mN0QbfXO+pul+2PrtFX/nE26zpdbmJ6y1WbnoMYEiNB/F9k8H9gNHZ6I+I+iwbI7V11xevhvgEFusjuiosHnn2dt6kTJ8vLr3mLm/71GebRdz6a6eJP0LbobJqR7l5azpN5SJ7+5zbxd+1cTR+Cpi5a66+ZC4dcBBGxsXjnNQefe3uQs3EQ26dYrKwykiQptwxLj8dv/5L1JSri7uqW36OyNF+IQ9hjXLuIWTFIFSi1cUCjb0vJe3zI7oW7d1cEC3W4eWPgcpv6Ws98wV3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ek8bQz/GLiaWz9slxVMkoW/vXz90bLNq5qhL2j+4QSs=;
 b=Hww6t48NLVOW+f04o7yedvvAHqTS5uC/yByvsqju2pOi/+oAvwFwBhcvAyB0Tq4jmcH/Y4nygZ2rilRH4rpsB0+Me0mtgOevWdRbd/gjDLu1vw63KDY1CdAH4qrCl+Ujomi+v4fWDoFJrc3/e8fvB1hw6EL+F3f318h0fSKiw0NJS5LLR38hmiuaiTeoux0CyBY8C035dNgfPzNuXjJZH7ZHj6+4RzjXXeC3M/cYuv69+n6QIW6pF7MHwpskeup84oJI7cSVGfj76OK3bUt7HR3wmFgc2K2DLBZ7AQ5DmYHegvMiLJaVkzIAr54Kt9u9zyjNeXSTYRQZbt/QohSMiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB8037.namprd11.prod.outlook.com (2603:10b6:510:25d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 21:55:17 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 21:55:17 +0000
Date: Wed, 31 Jan 2024 16:55:12 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [RFC PATCH] drm/xe/uapi: Remove support for persistent exec_queues
Message-ID: <ZbrBwCCUnkgX7Yp_@intel.com>
References: <20240130125220.5517-1-thomas.hellstrom@linux.intel.com>
 <CAPM=9tx_9S3yD3A46rP_NOO_FaPHwWaPMeX2wkx8Rh4iqO8cvQ@mail.gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPM=9tx_9S3yD3A46rP_NOO_FaPHwWaPMeX2wkx8Rh4iqO8cvQ@mail.gmail.com>
X-ClientProxiedBy: SJ0PR05CA0145.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: 197682f4-63d7-4169-76dd-08dc22a74f86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HQXUtXKm/46ULueiV71zZwqfD/wAA6P18pab/++RqIopTCjZY0qgqOTG9wGNtwNMq1gaMAeqh/8XdaZpucDYEdnFHvelUdhAiD6/6nLyJuoquVj+Y9YuZ4n/6HHmhWpR1zyQvxmEVm/mz14fYp1A7KQJ34Axg/MnLysadH78DrBbCflpGZrOqtAH8cppyVAg+9AeTHEvWO1fXrdAOSfZ3erTJlf1C7vrTYDWNdstcK4gT2i+mWRFCXU7LQVb7fKqubDZHRtJex1l/bmZEpLBSsOTkHuhN2XMmK/vg2UfXKgA+4FgmGlsnkC+DlSjAfYeKvEc7syRywvbfKVAwU0Z0XkRnN+pQe+xAr0E/f0/ucuiddKmfOrbFFRHC4dkREnQYUSYNfVlwuESnCTfHt54Ix7YzM9WVXblmEMdrIPHbHpDkNPzv0S9vwL+h9uRZe5cd/ZzOIvnNCW46PN2/Efm91Qy5QZx89Rv92G14PIld+a5YqUHSf9EDr6yMcKvZWhDBesv1DgyaxKKMn/VXorCX3YuqAR71EEsHFJC0voIz5BXLuOJ+k5LblzNIgYjGCPp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(316002)(44832011)(82960400001)(6916009)(66946007)(66476007)(66556008)(2906002)(54906003)(6512007)(8936002)(4326008)(8676002)(36756003)(86362001)(38100700002)(5660300002)(26005)(2616005)(6666004)(66899024)(6486002)(6506007)(41300700001)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mqtdA4N/cGBDBQ2kV2wS0BkQh5/WKn0ZZCUmB/IoH7KebE2VEWhGnPkYUj?=
 =?iso-8859-1?Q?lCNFwns5aZ7QxUZpgXUyBoPdcDs1VvGF/FVlKExifjXDbWMwwQ2MZZSxFD?=
 =?iso-8859-1?Q?vUUmxSR2PWEIrC4EJYlxmxB205w5XmeIlMSXVwdhhwKBY/UDBurBwK8pBu?=
 =?iso-8859-1?Q?YapT9Sqi2KKSwf29fn3PXueJtfsih4ffpEXCsRpRPPMTqYkUjHFlMtdpb1?=
 =?iso-8859-1?Q?dsXR2Ju6SBPcX4PVhvYwSxXdou9rWFP7F0VAVDAgxMLAxi7h8UNoCxSuWK?=
 =?iso-8859-1?Q?QmFXgPSRVgqdy4fzP30Rr7Psn5Avl6dcP/9oiZBL/QTUgBgL0jtRXwImRR?=
 =?iso-8859-1?Q?ENDewJykh/0mtk/sDNnd4ghczTpByDXsRZGb/5DVW+WLggN6StVh4xCXNL?=
 =?iso-8859-1?Q?bzEMjQOE0qg/egO0UTjNbrLpZp4uQ/SO/e0a2WCsob0Q2tFqp9azhGov9j?=
 =?iso-8859-1?Q?LHzEXc3ZlbIPjuOXjG8jIxJjJB6rBDDfjy6nRBTL9aidFJkvQPe/yUPc1D?=
 =?iso-8859-1?Q?AtnoAb/xOhhmHID7wziVDHEd2v0dpp12m+Gu4FuZqt/50ovJJVSmo0kVwK?=
 =?iso-8859-1?Q?5Pm7csuPRxK7GLna1JdzXMuNbvS3+TZviZvuunYwPxlXVhGrmXspJAPqDA?=
 =?iso-8859-1?Q?O7UIX+eamg5eJ4C7B4mTyDn8k8fIjCSi1edWV5VMLDXCD29Cv5OhEFOTmn?=
 =?iso-8859-1?Q?ysLR0T2JYvzMbJWhMyDEg06MP+S2BnEK589TpeXubbZ0a3Y8WLDnAsK64T?=
 =?iso-8859-1?Q?bhOld11Ur2Cv5mwgQDmEyWo+DDgbDl5IvqAQOfqcFRlFAucKJd7jlk7X+F?=
 =?iso-8859-1?Q?f4az1ETtY4qVrUz65m9wq0FF4B+fSo8yEGJL8mMqTvZCh/nvCm248iOVV5?=
 =?iso-8859-1?Q?WQuTL2uHiKZiRnk9qFX8kQQkzgFaIYIWdlcOwyI3VmujT/lJ9zlHTGIJH3?=
 =?iso-8859-1?Q?PMNK6vuai7gwepfFl8oSg3TwlsXKWUXrdW8VRda/CgvgEaNeEmbOm8dMLN?=
 =?iso-8859-1?Q?85wsepebS0bJBaO8m5E2f2UeZbjHiS9IHzSK2Dcc6f8I+cE6SfJHNCjvAe?=
 =?iso-8859-1?Q?+01p0h7lfSzoPjtJDHx+7BYFCVX6689zg+E2/DMN9r099MPuRwhU7N51Cc?=
 =?iso-8859-1?Q?ReLrZb6G7z84dZWWTzRKbT0ZEe05sQkzot1WoJi+Ln9wJBlepnFhA6pxLB?=
 =?iso-8859-1?Q?2dKS5ytDHSsgy0lVh6MjPKojear9RxKwUqswN3YHb0Iyb+BQfeEmvxS7os?=
 =?iso-8859-1?Q?8tD5MX67HiPtR17l2prUrdLHV93Gb7vibVpSsGM0471xda6fMvDEzjDd6d?=
 =?iso-8859-1?Q?e5Wda7iWrxvIrAb0LQL+dPTfVyDxUw+eIqMj+fS7hQXvsMqVZKk4uGMVnF?=
 =?iso-8859-1?Q?71Hj4iUHSinLLvVONNhSGpKwVg6r5d8aPmw5cB4/2LwR7dexVIms6dULK8?=
 =?iso-8859-1?Q?cWtpka4p2Kfum+LcPGP14BkvrLIRuNpK0kxc9Ud96HUGJWbxC8XXIidUVu?=
 =?iso-8859-1?Q?OfoC44clX1BsTRKpuOjUcbHki/RIujNTc3uvu63cPACUSiqEApzphjERqT?=
 =?iso-8859-1?Q?mGK+Q8CcNDbbSkfe4Gz2PNfCSs2fMtce4qGlRdjSj/e7Sqk1ZNjsMjIP4W?=
 =?iso-8859-1?Q?stIWwiezE9fwu0KumC9rCf1LoT68v/cnumKfTSD3tw0btmaS6UT8zzWA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 197682f4-63d7-4169-76dd-08dc22a74f86
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 21:55:17.1206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ugS2OwyM0gabHAezoYZthFt2mbbOygNIrN9o1Tr45U8BgOP94a2i0eTeEr6sP8VaNEG4+Ct/PkyxNiVz8W9RGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8037
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Feb 01, 2024 at 05:41:27AM +1000, Dave Airlie wrote:
> On Tue, 30 Jan 2024 at 22:52, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
> >
> > Persistent exec_queues delays explicit destruction of exec_queues
> > until they are done executing, but destruction on process exit
> > is still immediate. It turns out no UMD is relying on this
> > functionality, so remove it. If there turns out to be a use-case
> > in the future, let's re-add.
> >
> > Persistent exec_queues were never used for LR VMs
> >
> > Open: Should we renumber the exec_queue properties, or leave a hole
> > as in this patch.
> 
> 
> So can we have a bit of insight into how this happened? Like we just
> merged xe and it already has uapi that had no userspace?

I'm really sorry about that Dave.
In the past months I personally run an uapi clean-up removing everything
that was not used and this was a miss.

> 
> Like seriously? I'm sorry Intel has all these crazy silos with
> compute, video, graphics and kernel teams, but that should be Intel's
> internal problem, can we stop exposing your org chart outside the
> company?
> 
> If you can't get someone from the compute team to work in the kernel
> driver space when a new uAPI is needed, and instead powerpoint up
> uAPIs without commitments, then xe is going to end up being in the
> same hole as i915.

I guarantee to you that this this time, it was not the case. No uapi that
we have in Xe came from powerpoints. And it shouldn't had come from
internal branches as well.

I'm afraid that Xe stayed for too long out of the tree without a proper
scrutiny on the uapi, favoring fast moves to get it working.

Anyway, in this very specific case, this was a poor copy of the internal-i915.
While it shouldn't.

And it shouldn't be there in i915-internal anyway as well.
The I915_CONTEXT_PARAM_PERSISTENCE shouldn't even be part of the
i915-internal/DII's include/uapi/drm/i915_drm.h to start with.
What ever non-upstream uapi in that internal i915 should be part of a separate
header: i915_drm_prelim.h.

It was a escape there, wrongly ported over Xe
without scrutiny and then my personal escape while cleaning things up
before getting it merged.

Sorry,
Rodrigo.

>
> Dave.
