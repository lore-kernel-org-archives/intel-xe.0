Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAA8C54E71
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 16:21:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572B21125A0;
	Fri, 22 Mar 2024 16:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g6gJLG/4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B14D1125A0
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 16:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711124479; x=1742660479;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tCAkuxEqahrKHUYQlb0oOpGiGENtNNF6R/ZreuBiCbA=;
 b=g6gJLG/4en1q6S5x90nE3yGhYEGZbCR5iOzcjxtWIm3YQzUCUF1OQF1L
 NTYLcUQVikfKymkSGlVC/bAib2oEchTD4LjDTx8FzncRYdlBrp+cVKooe
 5GNn35fZR0g4GAPbrMmNOup/FvM/ZFnE+z5biXqXwL/z+Z9qtTK7KfrVz
 /XIrKjaOEKOWvNj1+3erxK4JDMvDBMEGxJVaz0UFIkqdLKKxdxUsOVJaH
 SCFyZKls6Y2nvLkB45ckMqWTGJzJoNVDMcrbfBLxV863Dp41vv2aHjkNE
 xxrGOFDGhXYGpY9nMf1B8Ria97vk9rqRKWHcUGbKvSDPdWce1QaQymDHr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6292689"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="6292689"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 09:21:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="15363595"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 09:21:18 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 09:21:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 09:21:18 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 09:21:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOEeRX9T4VvzVDha4FSCWoyYQPgKKzLMWBXb5B+pVm7CMF6XGxgoLNt+j6I4A6CFvIE+Fw57CCmHLPB08xKdJyPyCGOo5rlIvfGdKQCJXEw0LxhVsK2NNIoG2iUUeRsnfNzEn4+VR6S/zDNal4oGimrB3rO4lNDxNuck9DzW7tx5gvPtCRcQhmmvFa51ropsJfyCspg90cfcl5MZCvKlFYsr+bByGo03LHKzQOHmWiBQdCaXSsQoHMM97iFlQ1okPWVLw4ZEkvf+vGjIRyXx0S2BGIoBlcfIWSNjMTzs9Ju0LvbZ/p8cCnihkKSJYP1b4jFxpFPF82Ph8pK8aDi4NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCAkuxEqahrKHUYQlb0oOpGiGENtNNF6R/ZreuBiCbA=;
 b=JEq51OlY/QHKVMTwDS3ewgmhyBkygYdzFqO5LfdUdwt6G4OikXShplm5CoctbSW+Fz0aNcb+1wSADfLNxDPOfCICne0GT+eJSxvdmvzgEdyvminCGFXMITM/zmFgeddJhWYD/vnimTovGU71MV8bTjl5AiVMgZK7MQ6zcamLeemcWr4D2Fl42JJ87oZSzFkulJYXeWRBUWz2/lC3tSLfnn0lxZ20TyuLNkdE4YoThJnVjfklNBXSslKpsN65G13k77QG8CcyP7sfLQbc6tskYz1xuz2sgp28atO6Surx2kYxEFKhGO+WQY9aClcerQ638mPParfG2Uy28oysFuWTuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB7055.namprd11.prod.outlook.com (2603:10b6:303:22b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.23; Fri, 22 Mar
 2024 16:21:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 16:21:14 +0000
Date: Fri, 22 Mar 2024 11:21:05 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Robert Krzemien <robert.krzemien@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Zhanjun Dong <zhanjun.dong@intel.com>
Subject: Re: [PATCH v4 2/2] drm/xe/uapi: Add L3 bank mask to topology query
Message-ID: <azsoakv3xpzq7ogbilm3dohpymt6qu5mlojksk37indq6bht4x@fd2ws5gqu2sl>
References: <20240321142521.7-1-francois.dugast@intel.com>
 <20240321142521.7-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240321142521.7-2-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR08CA0026.namprd08.prod.outlook.com
 (2603:10b6:a03:100::39) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB7055:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c1e5590-ba70-43f3-1e62-08dc4a8c181c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l4zEqW9GDSwO8jaM6vQMKb3g5uViyTQE/kdkVz9U5nMrGCf6+oLPkMUPSGI7zOWfviV45mdYYX7GZaYNSaPNdCYDHtud1XXrly0Ud8e+m5pnpT9surNLVyp2RY+gdcTHM6V4RSJy3cZt1kNv2/85MXTPLGP+uFZuRdo8HJJTY2rfue+PeIMR06YSnf9KXXtUdnOaQZN9gqRCCOnhFAev6dUpUsLWI41RpIK9r+xh4Ju7Tr+0ZU9e9KYVxJxUJ9evd8X0ZNrwnXSJTj3tjxR3gzhwcJGA8Lxh5RrJhgKgfKx3yK9FbDmpDNvkQPTQBp3n9FZoz1hGUOAGIBVqyfxcfWmcMueOUgUHhlZHFJIyVIrhHtGJ+DSFebeQvK/TzAeeQKhKWS25OJWuzFQqdKYrKfzdupU4L7WQnqizLHcUI+e4O2RYs84e4w4MeAjjICf4cxxFY+WE5rhcOTi9zvhf2AIZdfpVVy4T8C7Wb1vqGQ4uerQWoYuBVXqKYuC8UWjJmT675xpRRgCkC4+MjEyKC8beMDeYRWj63IfIbtydzMQPKS2CnE/naDWaENHW4oqZLijUA6wnlCD7pfLiMcYpYv8ke1capqeNe3JcBegmN3OuAmeQbWek+apipyHhxP6rLaB3hTYeReQk76KXcMHNBSZ3qycmYgPHv1WJVxdthNw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vPagyQnt7uCxWEZVZ6CO3PJ9ge6P/RY1cQOfU1z9P23kgrywFBhs070uvZCe?=
 =?us-ascii?Q?Y0UXUrev1Ye4tXAmbn4MgrmbMzkoBHfmfCpEWR2rbIAnaszkiaHsG2sLtuT6?=
 =?us-ascii?Q?qQ/abAj77wdd2Bgeh/k5VoOheuoM7jy2PsfT4yEtkcfeqpW5h8G9eUrekmVi?=
 =?us-ascii?Q?8NCqbzCQaF7vlpbzs+7EOcvCqH61by+CvL04FROVtuwSetSLumVM6WsYjCZH?=
 =?us-ascii?Q?5QmQikn0KR3b1sOefK8HZu2azXmFDp9fLue/7ZHq7jkcziEs7L3bLr9bETdv?=
 =?us-ascii?Q?MaQ0JUZ7W/xF6NI/fWRa5AK5BBoFUxFoj5Te6MTHn8uI39EF3eOp0fnPvIbo?=
 =?us-ascii?Q?X/g1ozwtcisEH7M7Y34PO+let538HG8Sx7Y504ilJX4gxN3kocyG8ijJmaWw?=
 =?us-ascii?Q?UWCL5qWO+dKiWC+9WsJUERLHKjnVAVx9l+OXz7RX+hUbGjBxMSyi4Eqy10Is?=
 =?us-ascii?Q?cG/x/dw/NlI40RS6Yt/skln28tNdVsmFPIhPW9lc9ujDeEbmeflg7QxTHDHJ?=
 =?us-ascii?Q?H7iZAHDIR1EEkUpfeq/hOBygnJkbER+p2BawUuPl0X9fRbjmpTf3khgx/ifS?=
 =?us-ascii?Q?safMCeBHmIaXxxghgZeYnilo8nMu5DPNfmhIzWNvBAPpx34ElaTgSdrRSPJ7?=
 =?us-ascii?Q?Kny/LKx8W6Ok94QAMw1S9aHbRB+hZW9AlN3DpmobUvLXRaRoZ/gPy9f7SW+E?=
 =?us-ascii?Q?a0bIyojYfuh7BJfL81gmMHovIi/OP/X1nrGL+bDBxS9yHpL6xOOKFIypnh9u?=
 =?us-ascii?Q?xv1RuIVN/fvMt7iutX8GZ/HCoBxbqS1qR5O/Wbxokm5zLxZCO5YRY/m9Ggx8?=
 =?us-ascii?Q?SIxyHj+tgMglSUqLXRVpjAz6+MvS5dDtnWw/hAtrKgb+Krg9MwYXJILJ7I9v?=
 =?us-ascii?Q?Wp3F5Vh7SSSJVB5rUaMOIc58MyKfBd/dDp9Ypc7WYFSg+zgS2DUhooNYVa5z?=
 =?us-ascii?Q?DJ/MNb2v+cl4pLDxB/Gli+gGrFbHUrGwO4bIuWEygeNtWL2MNssKbw1+quye?=
 =?us-ascii?Q?eKUO9s/HrRWtV0xSA5XJLlTvAh2iTHUnR+nJKs/hu7Gc/sTot9LTzDLSXJKN?=
 =?us-ascii?Q?ZyC7RJ8h1wtdcsGwDdRbjUGmBC32z2V/Fy20x/3J2mhsCQa5Y/Z3CruYHqNw?=
 =?us-ascii?Q?3UVHJ6nJZtxfglXJBv4LTA7ovmfsFEirKXXwmRTOoNC74LuNthNcMN4/0d7w?=
 =?us-ascii?Q?V3HomT2N5W62aDmbTDhOSQUytnCbQaDtKBiz2a3GtnSDW2FhaThP/ZPFcWCj?=
 =?us-ascii?Q?omuRqhS7RW9ghc21pCjdS+GOkFBqcXjWOnTZy/9FhP0ysEhHuXd7YzjkF7Rl?=
 =?us-ascii?Q?MJ2A06KrH5VXmyNftvffTMI298xEk9+44PpahRLreZ+HRnnPESzzTU0ruy2m?=
 =?us-ascii?Q?kKjs4XQNBisUnB+aD1zSZKsD9ghv3PNj+c0dWjVUvvxJJraQaZo16Ov6W0n4?=
 =?us-ascii?Q?8hjlJ8fFII7tV83PHR1t09slxRWZ2Pvg4/HZs8t7hLPuHzfMfFxgSC/3odSa?=
 =?us-ascii?Q?DfJ5QJA26Wv4GQJRfiqUanF3cy5pAtJWRu6XYfjLloLDPckjba+20hVjPIr8?=
 =?us-ascii?Q?T36Yo9VTS6pG7AxAZQGcgRuXNQS6p9QJ/cebIgZetuAREu5Fp0nvTk+e8RYd?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c1e5590-ba70-43f3-1e62-08dc4a8c181c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 16:21:14.1999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MfCjwjhYzZ2HmUEq+Bn+adbrR7Hz1BNZe8aPs5HNXVrLcDWU0xXxqk3V3Z8fPAHvQUo8LC9UR6Q16tD4/S3oXE+CvkTPbtr9EFGZvMcQQok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7055
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

On Thu, Mar 21, 2024 at 02:25:21PM +0000, Francois Dugast wrote:
>Extend the existing topology uAPI to expose the masks of L3 banks
>to user space. L3 count is not sufficient because in some configuration
>not all banks are enabled. User space needs to know which ones are
>enabled, in the context of OA.

can we exand on *why* it needs to know the L3 bank configuration?
and since this is an uapi addition, please point out to the userspace
consumer.

Lucas De Marchi
