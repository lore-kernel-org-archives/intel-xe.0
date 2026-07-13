Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60309C43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 18:29:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2212B10E40B;
	Mon, 13 Jul 2026 18:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ji8KRMgT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19BA10E40B
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 18:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783967382; x=1815503382;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rEM02aA00ytyoVAdlMh+g121Ad17vGDsIJhn+ANoHuE=;
 b=Ji8KRMgT8kNhxsJ4kiDm3xDTIR5syU0GYI78bF7JiDvxe33ukOjR3HCA
 abNRwpfFYiJ9/qRBG9PBVyKy7P3hXxqBmAtrOOjWpJfBklk8+/Qf23mkP
 815evavAnsIxCerExilu+r/JHhqEZf0mjDDqdSMmPNiYbYt5CuV+mSZAO
 Mkh6umD6CGscVtLPU2MiDVGn2u1EQ2LyGYQ28Vn+1OvD3Hb+QenBSYt5x
 RhzTmqW+bURPut4TClu0X7yKJz+hWpMMJBMJuEug9xC6kwSjsoe49EiA0
 zsyg0jeuJqfUdEHkLc4AxH71RWMisCX+tXwRRJPgrndGHrBtkMwKM/sis w==;
X-CSE-ConnectionGUID: RZkP1RkzT2i7woFEmMgy9g==
X-CSE-MsgGUID: fs5nJ4fnRqGgmcA6oi6lRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107379394"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="107379394"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 11:29:41 -0700
X-CSE-ConnectionGUID: DlD01lkJSeufcq6H62OjKw==
X-CSE-MsgGUID: QzilniDYRxePBJlVA/LFwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="255123039"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 11:29:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 11:29:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 13 Jul 2026 11:29:41 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.56) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 11:29:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1/joRZXRRJmRa7qquXz2YMao7liEf0dZohCnPzbt/ACYqzVFSOU4Siz/Qx80gXYyI8jlLSBDXes8jfklN+6RYhHWncm+qUulzH3KnT+1HlF4IQ5V96vsffU5VDBtq4vmLTPgnWw4fH4P7+wwNqehg54S3//yrNGxxu+JThxArhPg4wIZHZP5dmrUFOc2x+zOVIrWHweEZ4k2AEadnLHLSBwd9IHfJHQicZsDEyFO0bmcJ4OeKxYxgSqfSqZ/h2LQa8VlWT6wlU2zjqwee+SAuRZ1HXyAcRDQygE8ZVYXw3sYTdUTxHkQLAX8Zdwy5JiVgfEzQSRfi41rOROXDkeCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZsgJcG6cJZQ7GfIzq3cdEJ2CaVP1Zpp0Qn2bp5YhoYI=;
 b=iMeLsj4MsWWQWwV749RKAsIJkEqjaDgVnAHo67iYf/wXRDCsUeO57NdSe4IrI9nRFb4LYm/AqIsyC7TIZoSRN0PsFmZKOUm69gGI7+oDOBsRLEIReqBuT/BPv2lEzENsBTMmI6H7PmJLDkjykAVQdqnoFV5dOHYhU5I6Pb58eaJpaCxBg63whTRWwXEEiJsNIR4q+xCx+B9JZ6BSooZiH5KgY2wK6Wt91bzetC4hs8ZOgqdOlsJMNLsGW0ZOC6Pl4TaNJZjtxwmV/yre8eSGcEb5VGlCaT81xEHrTwJ+owvvjiIrS4Fhq38wXVosOTlmStdZwr3jMahWBBCGgMFTYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6686.namprd11.prod.outlook.com (2603:10b6:806:259::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Mon, 13 Jul
 2026 18:29:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 18:29:28 +0000
Date: Mon, 13 Jul 2026 11:29:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/2] drm/xe/guc: Compress GuC log and CTB dump with zstd
Message-ID: <alUuhfmNIIU+2N2V@gsse-cloud1.jf.intel.com>
References: <20260629172239.2377117-1-zhanjun.dong@intel.com>
 <20260629172239.2377117-3-zhanjun.dong@intel.com>
 <akNG5Nv/dp6+m4mP@gsse-cloud1.jf.intel.com>
 <81ecaed7-47cf-4b13-9c0a-31e7bf189a54@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <81ecaed7-47cf-4b13-9c0a-31e7bf189a54@intel.com>
X-ClientProxiedBy: MW4PR04CA0332.namprd04.prod.outlook.com
 (2603:10b6:303:8a::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fb1f378-563e-44f1-8cf7-08dee10cac45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|56012099006|4143699003|11063799006|6133799003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: PllBQr01OpEVYFABWfxgceTNwYlWKa9KI98zyuhsEupw6AJsZnh/fyRS7VdscebQ1VazKQP7cVD50J5UWfbAnpwxCuqHDa4OFYXSSd8ASyqeJhAeuHM5ASilEPUzuJLS5s7Qg/0N8fPqDm31WRXtFyA8ahjPXdpPlem0/pukyazSTr9bejNi21HKZnKMCZtkHAYSjJlbbmVwmdVKmLlJNFtXdU7qjjaabP6cS+5gowe/8qbh4xngXS/dRQaPW7uztxqp428vthukup85yq0DplNp6we+4bwZY3qvyfZJV9cB9CwOpoCaYMHxyP+gDz1LjTTNTVZMaa8mpZuMXjmMEaFvSMX3HKak5P/3uUxwSSfk3PnDj3cBlENPWmYPsIEOuApGaYTtmPllFE8CUG3XU7yZ04K00CSqklOiUzU0zgm0iiFSkZilK7oLcgZ9frXN40YAksW8pRTr4J7Q0tKy+RxT8ZXeIL3FYCeIq6GoUmba2WJ+MUN5NNkBpIdKg/pY4+QaYD+XLLyQF4cyI3s9UF1CIVYrN32uDKR+d8l7RTI5zfOEgWCsIal5Xx+ZTTyWcO1m6A7SSN7Q6XAtafKkFZv707rMrVzwsBRgTFS1sMXFCetIdY7rFWCMp9JdKgN4F7qaMJdxLG3h89nCg5p5xq1u+Okzx96Wk2YxgXShBZE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(4143699003)(11063799006)(6133799003)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mFf00cg9QOr02cDSNhuHowXuxRjOOVb+sAzRa9GJSqaGm/PuhbEqs+tL9Vyn?=
 =?us-ascii?Q?l3/Er48uVKovB6IRA28JL0QH3II2lShD1gomncjY9gjefD6b2fC6mqvQXd6f?=
 =?us-ascii?Q?pzDPqk2yx1wcCQHwGUm7agLXKQ/D7MI2UTj2SwFs49vCyhmujUQcdF9kaC8U?=
 =?us-ascii?Q?G03KHDLnD4oCoeGP30tQwwrbqHnasXR4ncggo4OOQeJWkJfA3EABZzkfZ1Rx?=
 =?us-ascii?Q?h4BSyoMWjPNdBCREpCLsv/y851pj3V5Ys4QJesq6120W+kBwf6mb4ritJHZQ?=
 =?us-ascii?Q?yfq0GaRCny0/IyTQKIy9r8kE6gZamhmcpKymxrfwwy1Ap7c2sE5/dHefq6FV?=
 =?us-ascii?Q?WlIZyMIPy+mptq8Ptuev+U1XzeWtN+Nfz7bZJfHNndZM3oxFkVzZsQoV2T9E?=
 =?us-ascii?Q?6UGsuXk0EijJrPTNSx8KMf6DwF1d1RT5npbNLeD4M7APT6go1JWaP7eKfkiJ?=
 =?us-ascii?Q?MF1vpp6RYGlnb40Evq2v3HUG8UL/pjuNSgn+7zVVDTUUOpM/1DpvF/+u7Q8x?=
 =?us-ascii?Q?j4S0mRdJ3pb4WnAvEma0iSVfzHYTUwpbEzDnFuscWFc9Jt18qGC8BWJUtHB5?=
 =?us-ascii?Q?ihojhPwrB4jEhIrmbQ7Z2SJBjamVD9UjiutVfoPavC/oFpRS8DlLSZnk/wUs?=
 =?us-ascii?Q?FpgKic5XDf8SzmnpSNU59+5s0q6PUR5GYtzAFVZZPSVntdmILbd3bBlU8lNd?=
 =?us-ascii?Q?a1qoajMx+lky8EhX26RTnepiVzdRVylXRWV5GW/OLdJJlObg+Yq/N+59Cb58?=
 =?us-ascii?Q?vrHbVFxaE0XS3dACogETgFOG/qKdosAm4fDiwJvzXLgrwnMT0x1OmuGAUuTW?=
 =?us-ascii?Q?+qbsdldX7WeJYUiQ+TZJvtexBXOt6wyCqsFQzVC6rHidRTlnoygOzvb7XJ6e?=
 =?us-ascii?Q?FvKMff0VDewFT16HzFUIiBFEobRht4AzS44/2uolEv1I/JspyAQPac+6u+XM?=
 =?us-ascii?Q?AjaztVtO6SmrwNDygqwo6x+1gV3W7AUII8pX1GQXBDCpgSCT9uwUYabVTUIz?=
 =?us-ascii?Q?NaLUSP875S2rc4DX0TxPR1aHsS7iTqQXKlJNK2Ir0rbUwM3Pf/u3vB8pex7q?=
 =?us-ascii?Q?3mt5YI4yEQgGAFjsxB7nMVCXAHUiU3E9FLlO9sYWZUB7AMJWgV/lqIJY2qbY?=
 =?us-ascii?Q?TJTsZE95kMe1vGxoe7gB9cXn3V9sXe4XQ++gfBDMcV5+GKSHblyUoN6luXdr?=
 =?us-ascii?Q?wJD2vosEGH63m2i1vMP1/frZlfASCNkm/fOYcNFsIUHVdAEHCMNvF0XpA8p7?=
 =?us-ascii?Q?5WQRJXytdYkASOxIs044tUwbNSg1oS4adZWmzB2PMPLAP9xoo+oQOudALph3?=
 =?us-ascii?Q?ohWG27ag11e/a6JX7Qt5FyCkJzROiJI0mPYUNhpXWBiTCaQB0XU/oheUORYA?=
 =?us-ascii?Q?VXRQv1NlvuYoAB/25UZxLLKt2RsxR5kjbIcCtqvof4DNj9191Qvl9038GRbW?=
 =?us-ascii?Q?2I3j3refFbyd9NZVUNfz6qSmUXiC1NVv6wDwsCN3Ia1RaXEAL2bcS7rDu9ld?=
 =?us-ascii?Q?V2ZBoH2AJvhjjX94X/AA6c41eEZ/fSmzRXorzANqmuRotvev9CHyJM/Zivry?=
 =?us-ascii?Q?86o1tnSc9aD++J2zVlqQf0Voilys0AgPQMLkX8TpIeWq6q3wi+nAhIC9Wh5o?=
 =?us-ascii?Q?Xz5keZ6DDLyX+HIGYz6HLnHbEStKJ262aUHOxjqs2eaqHbSHZy34Q5KPNjmW?=
 =?us-ascii?Q?i6HSq5zQcjhnaDN5TEowEDQ7i9SfvDB8hBTs0Obb+jxuowaCrrb8BWbrOXeV?=
 =?us-ascii?Q?TXjy/EyPwDwtvgapLp2clWjAn+IYPos=3D?=
X-Exchange-RoutingPolicyChecked: cVoBS6GJHGdxVpYV2XnLFVQh4kr6hKU+fN9NWEhDCfJ8vA9M6RlgYA0937K2fumYYAnNNv6pIZfKC+QahQ/38Wp/wp/oPJIe99+1gaWnUnsU3ikwiuZQbc7fhJcSe/LNYKUORdjMIQXETyvBCTj5Qt8ywpnXPSuBZ/yKLeb4DR7EVOEY5BhjJP5ZRL0pQBWZEXjNDl/WVig9ZjrkB6E0mchX8G1+hBZQ6qw4EztZ25wGborL+krQe1+XrEqMpksmSEMJtX6D2/Rha0436pYMd/xFsK1OEQdMrJWu4FrFrN3zjWq/SD0ucm/VhiQZhCWPKSUiEP9jyd9YX3XU1fOw2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb1f378-563e-44f1-8cf7-08dee10cac45
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 18:29:28.0911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RfEu+ncji2PMQp0RJzclc5v8nGdrgrx0IDjrmXlCabNa3K8WnerrQJnb05yqa0YYzSfYAncv2inQnlHTJBQQ0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6686
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

On Tue, Jun 30, 2026 at 01:35:57PM -0400, Dong, Zhanjun wrote:
> Please see my inline comments below.
> 
> Regards,
> Zhanjun Dong
> 
> On 2026-06-30 12:32 a.m., Matthew Brost wrote:
> > On Mon, Jun 29, 2026 at 01:22:39PM -0400, Zhanjun Dong wrote:
> > > Replace the raw ascii85 dumps of GuC log snapshots with a
> > > zstd-compressed ascii85 stream and reuse the same helper for CTB
> > > snapshot output.
> > > 
> > > Use zstd streaming with default level-3 parameters and an estimated
> > > source size of 0 so the compression workspace stays bounded even for
> > > multi-megabyte logs.
> > > 
> > > Add a new Kconfig option DRM_XE_COMPRESS_DUMP to control whether
> > > GuC log and CTB dumps are compressed with ZSTD. This allows users to
> > > choose between reduced dump sizes or lower memory usage.
> > > 
> > 
> > What is the advantage of doing this the KMD vs. getting the dump and
> > compressing it in user space before sharing it?
> 1. Timing impact
> There are KMD runtime challenges about dump too many data:
> a. Skip unused data.
> Existing code dumps whole buffer, which also prints out area not used (Like
> lots of lines of "Z"). This patch only print valid range in buffer.
> b. Compessed size
> Test shown a typical 75% compression ratio about valid GuC log data.
> 
> Print out 10MB debug data in ascii85 take quiet a lot of time, especially
> when print out to dmesg. Too long print out might cause timing impact to

When do we printk to dmesg - we should never be doing that afiak or we
do, that should be removed as dmesg is not a mechanism for scalable
error logging.

> runtime, which is bad for debug purpose.

We always split the snap step from print step, so if a print takes a
little longer, I really don't see the issue. 

> With fewer data, this relifes KMD pressure when triggered.
> 
> 2. UMD utility required

cp /sys/class/drm/card0/device/devcoredump/data devcoredump.txt
gzip devcoredump.txt

?

> Do it in UMD requires an utility running in background and check/receive for
> data. If through debugfs, all above timing impact is not skipped.
> This add extra step for CI and user, in case of utility missing/offline, the
> valueable issue data would be lost
> 
> Meanwhile, there is discussion to have that kind of utility, will keep
> monitoring it.
> > 
> > > Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/Kconfig          |  16 +++
> > >   drivers/gpu/drm/xe/xe_devcoredump.c |   4 +-
> > >   drivers/gpu/drm/xe/xe_guc_ct.c      |  19 ++--
> > >   drivers/gpu/drm/xe/xe_guc_ct.h      |   4 +-
> > >   drivers/gpu/drm/xe/xe_guc_log.c     | 161 +++++++++++++++++++++++++---
> > >   drivers/gpu/drm/xe/xe_guc_log.h     |   9 +-
> > >   6 files changed, 184 insertions(+), 29 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> > > index 4d7dcaff2b91..3af15a0c14f7 100644
> > > --- a/drivers/gpu/drm/xe/Kconfig
> > > +++ b/drivers/gpu/drm/xe/Kconfig
> > > @@ -33,6 +33,8 @@ config DRM_XE
> > >   	select ACPI_WMI if X86 && ACPI
> > >   	select SYNC_FILE
> > >   	select CRC32
> > > +	select ZSTD_COMPRESS if DRM_XE_COMPRESS_DUMP
> > > +	select ZSTD_DECOMPRESS if DRM_XE_COMPRESS_DUMP
> > >   	select SND_HDA_I915 if SND_HDA_CORE
> > >   	select CEC_CORE if CEC_NOTIFIER
> > >   	select VMAP_PFN
> > > @@ -101,6 +103,20 @@ config DRM_XE_PAGEMAP
> > >   	  If in doubt say "Y".
> > > +config DRM_XE_COMPRESS_DUMP
> > > +	bool "Enable ZSTD compression for error dumps"
> > > +	depends on DRM_XE
> > > +	default y
> > 
> > Are tools to decode GuC logs updated to handle this mode?
> Current intel_dump_decode only support i915, we need more Xe debug support.>

That is not true. I have local repo with tools to decode GuC logs.

The answer must be yes, we have updated all internal tools, wikis before
we even considering merging this.
 
Matt

> > Matt
> > 
> > > +	help
> > > +	  Enable this option to compress GuC log and CTB dumps with ZSTD
> > > +	  compression. This can significantly reduce the size of error dumps
> > > +	  but requires additional memory for compression workspace.
> > > +
> > > +	  Disable this option if you want to save memory or prefer uncompressed
> > > +	  error dumps for debugging.
> > > +
> > > +	  If in doubt say "Y".
> > > +
> > >   config DRM_XE_FORCE_PROBE
> > >   	string "Force probe xe for selected Intel hardware IDs"
> > >   	depends on DRM_XE
> > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > index 5f2b90b18f97..27473c25aad2 100644
> > > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > @@ -115,9 +115,9 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
> > >   	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
> > >   	drm_puts(&p, "\n**** GuC Log ****\n");
> > > -	xe_guc_log_snapshot_print(ss->guc.log, &p);
> > > +	xe_guc_log_snapshot_print(ss->guc.log, &p, ss->gt);
> > >   	drm_puts(&p, "\n**** GuC CT ****\n");
> > > -	xe_guc_ct_snapshot_print(ss->guc.ct, &p);
> > > +	xe_guc_ct_snapshot_print(ss->guc.ct, &p, ss->gt);
> > >   	drm_puts(&p, "\n**** Contexts ****\n");
> > >   	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index 21e0dad9a481..4cedbcdb831e 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -2094,11 +2094,12 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct)
> > >    * xe_guc_ct_snapshot_print - Print out a given GuC CT snapshot.
> > >    * @snapshot: GuC CT snapshot object.
> > >    * @p: drm_printer where it will be printed out.
> > > + * @gt: GT structure for error reporting
> > >    *
> > >    * This function prints out a given GuC CT snapshot object.
> > >    */
> > >   void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> > > -			      struct drm_printer *p)
> > > +			      struct drm_printer *p, struct xe_gt *gt)
> > >   {
> > >   	if (!snapshot)
> > >   		return;
> > > @@ -2112,11 +2113,10 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> > >   		drm_printf(p, "\tg2h outstanding: %d\n",
> > >   			   snapshot->g2h_outstanding);
> > > -		if (snapshot->ctb) {
> > > -			drm_printf(p, "[CTB].length: 0x%zx\n", snapshot->ctb_size);
> > > -			xe_print_blob_ascii85(p, "[CTB].data", '\n',
> > > -					      snapshot->ctb, 0, snapshot->ctb_size);
> > > -		}
> > > +		if (snapshot->ctb)
> > > +			xe_guc_print_blob(gt, p, "[CTB]", "[CTB].data",
> > > +					  &snapshot->ctb, 1,
> > > +					  snapshot->ctb_size, snapshot->ctb_size);
> > >   	} else {
> > >   		drm_puts(p, "CT disabled\n");
> > >   	}
> > > @@ -2150,9 +2150,10 @@ void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
> > >   void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
> > >   {
> > >   	struct xe_guc_ct_snapshot *snapshot;
> > > +	struct xe_gt *gt = ct_to_gt(ct);
> > >   	snapshot = guc_ct_snapshot_capture(ct, false, want_ctb);
> > > -	xe_guc_ct_snapshot_print(snapshot, p);
> > > +	xe_guc_ct_snapshot_print(snapshot, p, gt);
> > >   	xe_guc_ct_snapshot_free(snapshot);
> > >   }
> > > @@ -2250,10 +2251,10 @@ static void ct_dead_print(struct xe_dead_ct *dead)
> > >   	drm_printf(&lp, "\tTile: %d\n", gt->tile->id);
> > >   	drm_puts(&lp, "**** GuC Log ****\n");
> > > -	xe_guc_log_snapshot_print(dead->snapshot_log, &lp);
> > > +	xe_guc_log_snapshot_print(dead->snapshot_log, &lp, gt);
> > >   	drm_puts(&lp, "**** GuC CT ****\n");
> > > -	xe_guc_ct_snapshot_print(dead->snapshot_ct, &lp);
> > > +	xe_guc_ct_snapshot_print(dead->snapshot_ct, &lp, gt);
> > >   	drm_puts(&lp, "Done.\n");
> > >   }
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > index 767365a33dee..2005d1a0cd6c 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > @@ -10,6 +10,7 @@
> > >   struct drm_printer;
> > >   struct xe_device;
> > > +struct xe_gt;
> > >   int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
> > >   int xe_guc_ct_init(struct xe_guc_ct *ct);
> > > @@ -24,7 +25,8 @@ void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
> > >   void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
> > >   struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct);
> > > -void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p);
> > > +void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p,
> > > +			      struct xe_gt *gt);
> > >   void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
> > >   void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> > > index 538d4df0f7aa..d20be1a064f1 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_log.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> > > @@ -6,6 +6,9 @@
> > >   #include "xe_guc_log.h"
> > >   #include <linux/fault-inject.h>
> > > +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
> > > +#include <linux/zstd.h>
> > > +#endif
> > >   #include <linux/utsname.h>
> > >   #include <drm/drm_managed.h>
> > > @@ -225,16 +228,148 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
> > >   	return snapshot;
> > >   }
> > > +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
> > > +static void xe_guc_print_blob_compressed(struct xe_gt *gt, struct drm_printer *p,
> > > +					 const char *length_label, const char *data_label,
> > > +					 void **chunks, int num_chunks,
> > > +					 size_t chunk_size, size_t total_size)
> > > +{
> > > +	zstd_parameters params;
> > > +	zstd_cstream *cstream;
> > > +	zstd_out_buffer outbuf;
> > > +	size_t wksp_size, dst_size;
> > > +	size_t remain, ret;
> > > +	void *wksp = NULL;
> > > +	char *dst = NULL;
> > > +	int i;
> > > +
> > > +	/*
> > > +	 * Pass 0 as estimated_src_size to use zstd level-3 defaults
> > > +	 * (windowLog=18, 256KB window). Passing the full total_size would
> > > +	 * cause zstd to inflate windowLog proportionally (e.g. windowLog=24
> > > +	 * for a 19MB log), making the workspace tens of MB.  With 0, the
> > > +	 * workspace stays ~1.5MB, well within kmalloc limits.
> > > +	 */
> > > +	params = zstd_get_params(3, 0);
> > > +
> > > +	wksp_size = zstd_cstream_workspace_bound(&params.cParams);
> > > +	wksp = kvzalloc(wksp_size, GFP_KERNEL);
> > > +	if (!wksp)
> > > +		goto err;
> > > +
> > > +	dst_size = zstd_compress_bound(total_size);
> > > +	dst = kvzalloc(dst_size, GFP_KERNEL);
> > > +	if (!dst)
> > > +		goto err;
> > > +
> > > +	cstream = zstd_init_cstream(&params, 0, wksp, wksp_size);
> > > +	if (!cstream) {
> > > +		xe_gt_err(gt, "failed to init zstd cstream\n");
> > > +		goto err;
> > > +	}
> > > +
> > > +	outbuf.dst = dst;
> > > +	outbuf.size = dst_size;
> > > +	outbuf.pos = 0;
> > > +
> > > +	remain = total_size;
> > > +	for (i = 0; i < num_chunks && remain; i++) {
> > > +		size_t size = min(chunk_size, remain);
> > > +		zstd_in_buffer inbuf = { .src = chunks[i], .size = size, .pos = 0 };
> > > +
> > > +		while (inbuf.pos < inbuf.size) {
> > > +			ret = zstd_compress_stream(cstream, &outbuf, &inbuf);
> > > +			if (zstd_is_error(ret)) {
> > > +				xe_gt_err(gt, "zstd_compress_stream failed: %s\n",
> > > +					  zstd_get_error_name(ret));
> > > +				goto err;
> > > +			}
> > > +		}
> > > +		remain -= size;
> > > +	}
> > > +
> > > +	do {
> > > +		ret = zstd_end_stream(cstream, &outbuf);
> > > +		if (zstd_is_error(ret)) {
> > > +			xe_gt_err(gt, "zstd_end_stream failed: %s\n",
> > > +				  zstd_get_error_name(ret));
> > > +			goto err;
> > > +		}
> > > +	} while (ret > 0 && outbuf.pos < outbuf.size);
> > > +
> > > +	drm_printf(p, "%s.length: 0x%zx -> 0x%zx Algo: ZSTD\n",
> > > +		   length_label, total_size, outbuf.pos);
> > > +	xe_print_blob_ascii85(p, data_label, '\n', dst, 0,
> > > +			      DIV_ROUND_UP(outbuf.pos, sizeof(u32)) * sizeof(u32));
> > > +	goto out;
> > > +
> > > +err:
> > > +	drm_printf(p, "%s.length: 0x%zx Algo: ERROR (compression failed)\n",
> > > +		   length_label, total_size);
> > > +out:
> > > +	kvfree(dst);
> > > +	kvfree(wksp);
> > > +}
> > > +#endif
> > > +
> > >   /**
> > > - * xe_guc_log_snapshot_print - dump a previously saved copy of the GuC log to some useful location
> > > - * @snapshot: a snapshot of the GuC log
> > > - * @p: the printer object to output to
> > > + * xe_guc_print_blob - Print binary data (compressed or uncompressed) as ascii85
> > > + * @gt: GT structure for error reporting
> > > + * @p: drm_printer for output
> > > + * @length_label: label prefix for the length/metadata line (e.g. "[LOG]" or "[CTB]")
> > > + * @data_label: label for the ascii85 blob (e.g. "[LOG].data" or "[CTB].data")
> > > + * @chunks: array of pointers to source data chunks
> > > + * @num_chunks: number of elements in @chunks
> > > + * @chunk_size: nominal size of each chunk; the last chunk may hold fewer valid bytes
> > > + * @total_size: total uncompressed byte count across all chunks
> > > + *
> > > + * If CONFIG_DRM_XE_COMPRESS_DUMP is enabled, compresses @total_size bytes using
> > > + * zstd level-3 streaming compression and prints the result via @p using ascii85
> > > + * encoding. Otherwise, directly prints the uncompressed data.
> > > + * On failure the function returns without printing the data blob.
> > >    */
> > > -void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p)
> > > +void xe_guc_print_blob(struct xe_gt *gt __maybe_unused, struct drm_printer *p,
> > > +		       const char *length_label, const char *data_label,
> > > +		       void **chunks, int num_chunks,
> > > +		       size_t chunk_size, size_t total_size)
> > >   {
> > > +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
> > > +	xe_guc_print_blob_compressed(gt, p, length_label, data_label,
> > > +				     chunks, num_chunks, chunk_size, total_size);
> > > +#else
> > > +	/* Compression disabled, output uncompressed data directly */
> > >   	size_t remain;
> > >   	int i;
> > > +	drm_printf(p, "%s.length: 0x%zx Algo: RAW\n", length_label, total_size);
> > > +
> > > +	/*
> > > +	 * Print each chunk directly without merging into a single buffer.
> > > +	 * xe_print_blob_ascii85() supports multiple calls - use suffix=0
> > > +	 * for all but the last chunk to omit the newline between chunks.
> > > +	 */
> > > +	remain = total_size;
> > > +	for (i = 0; i < num_chunks && remain; i++) {
> > > +		size_t size = min(chunk_size, remain);
> > > +		const char *prefix = i ? NULL : data_label;
> > > +		/* Add suffix only on the last chunk */
> > > +		char suffix = (remain == size) ? '\n' : 0;
> > > +
> > > +		xe_print_blob_ascii85(p, prefix, suffix, chunks[i], 0,
> > > +				      DIV_ROUND_UP(size, sizeof(u32)) * sizeof(u32));
> > > +		remain -= size;
> > > +	}
> > > +#endif
> > > +}
> > > +
> > > +/**
> > > + * xe_guc_log_snapshot_print - dump a previously saved copy of the GuC log to some useful location
> > > + * @snapshot: a snapshot of the GuC log
> > > + * @p: the printer object to output to
> > > + */
> > > +void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
> > > +			       struct xe_gt *gt)
> > > +{
> > >   	if (!snapshot) {
> > >   		drm_printf(p, "GuC log snapshot not allocated!\n");
> > >   		return;
> > > @@ -248,16 +383,9 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
> > >   	drm_printf(p, "GuC timestamp: 0x%08llX [%llu]\n", snapshot->stamp, snapshot->stamp);
> > >   	drm_printf(p, "Log level: %u\n", snapshot->level);
> > > -	drm_printf(p, "[LOG].length: 0x%zx\n", snapshot->size);
> > > -	remain = snapshot->size;
> > > -	for (i = 0; i < snapshot->num_chunks; i++) {
> > > -		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
> > > -		const char *prefix = i ? NULL : "[LOG].data";
> > > -		char suffix = i == snapshot->num_chunks - 1 ? '\n' : 0;
> > > -
> > > -		xe_print_blob_ascii85(p, prefix, suffix, snapshot->copy[i], 0, size);
> > > -		remain -= size;
> > > -	}
> > > +	xe_guc_print_blob(gt, p, "[LOG]", "[LOG].data",
> > > +			  snapshot->copy, snapshot->num_chunks,
> > > +			  GUC_LOG_CHUNK_SIZE, snapshot->size);
> > >   }
> > >   static inline void lfd_output_binary(struct drm_printer *p, char *buf, int buf_size)
> > > @@ -598,12 +726,13 @@ void xe_guc_log_print_dmesg(struct xe_guc_log *log)
> > >   void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
> > >   {
> > >   	struct xe_guc_log_snapshot *snapshot;
> > > +	struct xe_gt *gt = log_to_gt(log);
> > >   	drm_printf(p, "**** GuC Log ****\n");
> > >   	snapshot = xe_guc_log_snapshot_capture(log, false);
> > > -	drm_printf(p, "CS reference clock: %u\n", log_to_gt(log)->info.reference_clock);
> > > -	xe_guc_log_snapshot_print(snapshot, p);
> > > +	drm_printf(p, "CS reference clock: %u\n", gt->info.reference_clock);
> > > +	xe_guc_log_snapshot_print(snapshot, p, gt);
> > >   	xe_guc_log_snapshot_free(snapshot);
> > >   }
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
> > > index 4649a260755e..3e97647ee8b5 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_log.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_log.h
> > > @@ -11,6 +11,7 @@
> > >   struct drm_printer;
> > >   struct xe_device;
> > > +struct xe_gt;
> > >   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
> > >   #define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_16M
> > > @@ -59,7 +60,13 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
> > >   void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p);
> > >   void xe_guc_log_print_dmesg(struct xe_guc_log *log);
> > >   struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic);
> > > -void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);
> > > +
> > > +void xe_guc_print_blob(struct xe_gt *gt, struct drm_printer *p, const char *length_label,
> > > +		       const char *data_label, void **chunks, int num_chunks,
> > > +		       size_t chunk_size, size_t total_size);
> > > +
> > > +void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
> > > +			       struct xe_gt *gt);
> > >   void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot);
> > >   static inline u32
> > > -- 
> > > 2.34.1
> > > 
> 
