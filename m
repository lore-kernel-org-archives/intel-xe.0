Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAB6CCFA03
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 19:15:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6653210E459;
	Mon,  3 Nov 2025 19:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gdrHetJZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A08910E459
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 19:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762197342; x=1793733342;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7UEEkGKTZ13rEKqh0edcbdmQ0FLcis009FIaNNAFSCQ=;
 b=gdrHetJZyrsuL3jZH9PrHI8kRhWE//IDk5ZeckPmJJzxcLMvV/NKciaf
 n1xXntYIDwTqCMo6uU/IJG/1PLY0j5zJInqdYsL0YdeVot6FfOuCKvcpL
 eokvryZi51n8X8XSdFNWIu2XczbrKixizuIDmfAPsHdjdRBjV6Zh6SIIH
 NTkQjU9XJ73ZH7t38DAxTsRBlkOy9qDWaPMQOFiEQ802LszZZXsEzxu3D
 HG7Rs4z8gy6u2U0STugLnNAo74t0iqNIeGFzS/zq6RnBN+ai6BscZBTbO
 0Ti9Jd1L/QtzkZbH44yqxvcfT9PQukY819TzcdfaTP2GOxXaA894zsIG7 w==;
X-CSE-ConnectionGUID: c07q2JCHQZy65Hm16uC9rg==
X-CSE-MsgGUID: 6kdc/4hZT4e6CTkjxacUhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64201441"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="64201441"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 11:15:41 -0800
X-CSE-ConnectionGUID: JrD5VnAsTzi5ITBkqMyDbQ==
X-CSE-MsgGUID: 95mDANxQSjGBtMVrl+/+mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="210463976"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 11:15:41 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 11:15:40 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 11:15:40 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 11:15:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNAcIO+MfVdBJkPtHTdk0ZVO0Ragm4UP2IfuX+Y8rhZP6gDuimg4UtdLOVKp8G77zubLGYHMmRFwHkHSfbmR/yB7det0aZFlfmKPre/yEJtySJ+XgadF4DKHL4K9mdaaWVgIYhdxdV3XUjwXyYntAT5AbV2ZCZrjmsaYwZONCptiLnO/4BvaSIB0Swz5hh9jTMJ4cYXdvl/1aWIsXdJBjRbTGX6EgChecY8Pg4XUqEvynb4Mv7j0LhtnTnUw0f/yMV7R6cVAQtZE7YhZZXOhmZH9csBxJvWeFYfnVn08Z6yubFA7UNNYWb6dwLHrKnXD40bX/z2slq51rLCZoIb3zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEt1dAp+A7sH8/xELavmhq96hylghbxmLSLm8mHg+3k=;
 b=vkQJNHwgIS5T0g1kuNYn8tBJV6ppEMW48b4Bu+0pG1XFJHLoe6qEUdSS/eWZQqpXM/id8/Ep33ajgS/qBtRsDo1pjKG9wvNpvJYUGO622jPCuL21k3u/szqAPeLbzzOnAmE7BfXfy93iWlcRvDV1iggXsDQw4QWWOG5ZJdZlh1WkYgOTGfDYrp+CjiY2rZO5BPV54FKXiQWa+yaPvFy7ZwfMxsRDOEsMEYKLzx4G6ZbxE/Sr3M8WfxsWvgO1Gre744uRWwAyrmHHGslMvv2DgIgrzVCSojxeJPdUA1tF+tz++BRjYrLCrNWcbEogdSssn76qbi/HeXW0TJ5ce3T30Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6554.namprd11.prod.outlook.com (2603:10b6:510:1a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Mon, 3 Nov
 2025 19:15:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 19:15:37 +0000
Date: Mon, 3 Nov 2025 11:15:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <francois.dugast@intel.com>
Subject: Re: [PATCH v4 6/7] drm/xe: Add xe_guc_pagefault layer
Message-ID: <aQj/V5ZuHLft6d8L@lstrano-desk.jf.intel.com>
References: <20251031165416.2871503-1-matthew.brost@intel.com>
 <20251031165416.2871503-7-matthew.brost@intel.com>
 <sfcg7e3k33utodthmvswkqyav66z3toqn6seiipgnkz5gmxzdc@7f37xxkdfspn>
 <aQj6xi3HUTHcBoD4@lstrano-desk.jf.intel.com>
 <n5hncgadbxnnyxqz2rqz7klrytupp2zvwxrnxyc5ysmuky46hb@nsn5invv6hvr>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <n5hncgadbxnnyxqz2rqz7klrytupp2zvwxrnxyc5ysmuky46hb@nsn5invv6hvr>
X-ClientProxiedBy: BY3PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6554:EE_
X-MS-Office365-Filtering-Correlation-Id: 1436d80d-de1a-4810-a041-08de1b0d5efc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i1jmAPh/f7stOPcBHDjqkrzQjFYxciA80XwZcJCWH5c5dnQQCdm0dCBrfMLh?=
 =?us-ascii?Q?448mn7Mx7rnUfpA6iQyiyYjjuev2W2drJYT29wX+SF7Tr4+SXB78/C24if6r?=
 =?us-ascii?Q?hNf17cBsmL5fCMA64DtEp2JAA0qtfYKXTxRrTPeUJh3FpJnQpQfxb6fI0v8y?=
 =?us-ascii?Q?2AKcFsTpd2Jzt1G/45mqAJHWtwbA8O3mHN/XAZrDpn8fO+uVTyoW8QlPM/gy?=
 =?us-ascii?Q?+IX2/7mP92j3SaHyhDn1uA3tkQZii190t+l/UBw8UhKs7VAO2RFSwBAsbfr/?=
 =?us-ascii?Q?ktTngyvwtcjfmF7sR5OUGCrfr4TdOjKxpr8LgrVcXAI0XsgorTRyGy5NcXCA?=
 =?us-ascii?Q?+a0bvSxvDGpWKahg37WU/tZ22FJsBvrhP2kySJP2Dr6B3DKTpWKhDFdiRss2?=
 =?us-ascii?Q?7bzZxI/mslZjy8kTFmkikcsGk15WivlQxOo9/BpHbrKRNOfSHr0oBqqzbqNI?=
 =?us-ascii?Q?eo4wFN7C3sJ3D44v7yGsMEzJfFsvQKclqkzLG+I2h+rUbqeNsCgfQSCcCLus?=
 =?us-ascii?Q?1+UOPM1Izf8nq7AJGLyzRpu/3Abz8zPcUj78Fr2KTOOPQ6VukJSP2Hulhped?=
 =?us-ascii?Q?ytbYCRQoMdw0IFvvWqWFZOhAFixHd7Tp9CKx3Cvmq9wlS6FH9p5G2uOm9p8q?=
 =?us-ascii?Q?Hx2FGKrQJjJVIMpxunLNlw9FnKMpeN86GkG1N2RvlYaEYZITa2GA0y+4EaQ8?=
 =?us-ascii?Q?rPiFZG4FK1DBUDf7I6veGPHLt31NcRBnTxQNG00/8+ns06Ym1h+EKYzViMeh?=
 =?us-ascii?Q?7ESKStI/XrMcDfEyaAAjDMUsPcNVBV+KYCtVi6IQcXHB+Is9Hqm0uXev66mm?=
 =?us-ascii?Q?Qt8eFxDw+BKw5VJPjkZ5uhoorJ3tZRc6zXt6ZpB+2zS2V4FoElTlKPi0aDnw?=
 =?us-ascii?Q?Ajo7Y/KNQ08OAHRrgIzQI4kOfE2fGySb6PfO4qpj42HK3xPAC/ZCTJVHljzQ?=
 =?us-ascii?Q?bw/qQqjDqYN3fpSOnvLzBIdumNQwTgJpVQESFzNyavRm8iypjHrzSOBY/bIr?=
 =?us-ascii?Q?1YfoAhIJWX/d0Hh0X27au5F9t55BfNcl/3Blks8kR4+viJ48RS7K9SpQqcsd?=
 =?us-ascii?Q?j0WxbxdaJmnKsXfs8rID0/ssKRy8TkHWxRvkq/rUmXzkFnS5hZ/GjSe7M5gc?=
 =?us-ascii?Q?S90lQEKKU6d3eruDrNkEKNR8YI03G2aCmUicH3JIcMn8C3R0uzAnT88kShsB?=
 =?us-ascii?Q?J4dKBIMGo2QO0AkG60OIUobQ7BR0xxXmOODw2hvQ1yv/YcAzbdy2DOTBdWbj?=
 =?us-ascii?Q?50adfmWhIzb+H4oF1CqDhOblKZBg3FlYdT4Jd4QsXsJL73PHNeJZqQEwmoU4?=
 =?us-ascii?Q?avKQN3A7CZIihUImiLAt2QrqeVeJ4/LxEFH6dXmJZP6gilKwPVUnRJIxHkvo?=
 =?us-ascii?Q?59NaFvwSapj0MBei7ke3xe5Q3C9hv65b22N+w3YIvrQQcyQ99IP3nssEwdOx?=
 =?us-ascii?Q?4T1z9hLjc7t59p/AnsKw08RN/PiiN/yE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2lRoyccd3sEIja1Ddj5jAwJr7ScL1OlZaDBUEsVoZUHVK6SwHJToXfQQCx6e?=
 =?us-ascii?Q?JOdSvUT8FlBbso5dbGHjyAIFtrFPkM9un2eZP0zA94cwpR3pm0L8zowuM3YA?=
 =?us-ascii?Q?gNYSXQyp+9+wFe/DQPH2vFgzuKAvrDFgR/T6ZxFM3gmYwWQQngO2ox47MveM?=
 =?us-ascii?Q?n71p86znCgyFylVdbl0S9ScuN+o3tTu4+6xwVXbNkyLMHx4OG0v34fUQ8tjT?=
 =?us-ascii?Q?nKRRs/B+BkD3VEN2UpD5q7GejPuVcqjJVPgg/zKZRgT+y6ZRKU4yOcbde/8/?=
 =?us-ascii?Q?AfM4j2wXdqG8pGBhuRNQ5LQFqOumNZ3CFJVDf4FoLoOS4fH7dFj9tYZ8SbV4?=
 =?us-ascii?Q?PZIdv0J+pmmb2Hq4PSo/3seEA+mJxmdZE5hV+HIh6poCDHYyLchCxAbjOIQN?=
 =?us-ascii?Q?zTaIPrQaAxmqfx6FrRGICIDjtf1fURAV/KAu+/fwdXD5edqoZ7jAdQ9mJ4Zk?=
 =?us-ascii?Q?Xysy/kF+U2ESO57nd4Psz99jKv4PsVbnAHrvHMWmLcfRzKPUvu/FbrQ8bhjJ?=
 =?us-ascii?Q?xS7ts40gTG076WdTFtFip0dWMlP6GdCpLwqUMDd5t1cuUEJagDPlXnw+54+X?=
 =?us-ascii?Q?yesarooVqqDqM49s3qe3Kz7NfyIyn07fqsjWAFHH0wIUvcuPuAD+zeIlxDsG?=
 =?us-ascii?Q?WaEztUbMIoCWLtcNWfTSdgg4TkWGdy+c9cBNImoxBUUUrNFMbqkOVhUCEP/B?=
 =?us-ascii?Q?KQeWJqtwgOhug33B3YbaOcN0lKDo567UJ99Zwu/QdhjKDELJmFUJXCTzepe+?=
 =?us-ascii?Q?HceKmV65tAjjwfTDYKwG/dp++vBJIYPBLAFZFZcg5LLhykIlJdDSds5DRgCI?=
 =?us-ascii?Q?V2ocKa/ByJ9ZLlpCtMeeEEjv418f3O10zR7qYnC5he7UiV0i3lYe3AZXIBiW?=
 =?us-ascii?Q?ayve92nhk5vd4UV3Hzs+6vo+uH5ZgjVFkAA/Vz59fj1MQ2Z3Rxh3L1GoSOuJ?=
 =?us-ascii?Q?dJL4AjY6HOK7qr9XtrJiYycPT53NzSpS/h0QEUgdwYy8awopYu7bCWzEi/7J?=
 =?us-ascii?Q?nR+F3seLmhW7xw60tKtWfGEA6tDijgf0xAygQ4hi27FkzHE8X+lLDZWUg83o?=
 =?us-ascii?Q?huAmNQubyI6Nb+Aq4/V6XPhrKo+MRPhj6YYMGLNIMOfdOI4BwtrR06bkvrKD?=
 =?us-ascii?Q?B6rUXDIsuNEpXJypckE1d00x6gQpyQ+B7LPWJedOR4Cti1UVbSumYUX3+vZq?=
 =?us-ascii?Q?kuG9BccI0xKFi/lKXPUe4qepYIwjkiJbqzZCNYOMxCFSQB4z9XG2MjJ1bs3x?=
 =?us-ascii?Q?9a+odhB8FZaIXzpZhCNnJkZbubagFTqkShu0VY3Y54iKI1ZriNIxkR6rxp5u?=
 =?us-ascii?Q?Yby88UeHVFhWHwFilIPGx1i9rL94TAIrQr+Pt1zuB+UxNsaO+dduHsnl23oW?=
 =?us-ascii?Q?l+cn/4CPg++wxvKt5CurUbvuoU5gTnOrpyI62TtI9aTt7gYEKkr4NAEtYoHa?=
 =?us-ascii?Q?V0z9/G2QFxj2NWPQJyaffnXWBPu7FFruZqQcXHC+pC3pCSSRXxQPjyM2iv6W?=
 =?us-ascii?Q?qv4jJDGQH7R/usJ+JHgVVRSmV02FHGj7ErA4ch4fS90smD86KJMGYwUv9yt+?=
 =?us-ascii?Q?6DdrGa3X6TA5ww93OjgL0kBf8js+ZlKoo/wzTVlxCyBh5vmkJy+07roeXtME?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1436d80d-de1a-4810-a041-08de1b0d5efc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 19:15:37.7291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: thczKF60awlRGcIgd0eF7S2A51+nxnRm6qRv+LkESFGKpIxvRPxiifGQz7RlUDi6XhdEfYYhAdsRYZbo6xwIsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6554
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

On Mon, Nov 03, 2025 at 01:11:34PM -0600, Lucas De Marchi wrote:
> On Mon, Nov 03, 2025 at 10:56:06AM -0800, Matthew Brost wrote:
> > On Mon, Nov 03, 2025 at 12:28:50PM -0600, Lucas De Marchi wrote:
> > > On Fri, Oct 31, 2025 at 09:54:15AM -0700, Matthew Brost wrote:
> > > > Add xe_guc_pagefault layer (producer) which parses G2H fault messages
> > > > messages into struct xe_pagefault, forwards them to the page fault layer
> > > > (consumer) for servicing, and provides a vfunc to acknowledge faults to
> > > > the GuC upon completion. Replace the old (and incorrect) GT page fault
> > > > layer with this new layer throughout the driver.
> > > >
> > > > v2:
> > > > - Include engine instance (Stuart)
> > > >
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/Makefile           |  2 +-
> > > > drivers/gpu/drm/xe/xe_gt.c            |  6 --
> > > > drivers/gpu/drm/xe/xe_guc_ct.c        |  6 +-
> > > > drivers/gpu/drm/xe/xe_guc_pagefault.c | 95 +++++++++++++++++++++++++++
> > > > drivers/gpu/drm/xe/xe_guc_pagefault.h | 15 +++++
> > > > drivers/gpu/drm/xe/xe_svm.c           |  3 +-
> > > > drivers/gpu/drm/xe/xe_vm.c            |  1 -
> > > > 7 files changed, 113 insertions(+), 15 deletions(-)
> > > > create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.c
> > > > create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.h
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > > index b35021e5b9eb..319f208eb19a 100644
> > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > @@ -58,7 +58,6 @@ xe-y += xe_bb.o \
> > > > 	xe_gt_freq.o \
> > > > 	xe_gt_idle.o \
> > > > 	xe_gt_mcr.o \
> > > > -	xe_gt_pagefault.o \
> > > > 	xe_gt_sysfs.o \
> > > > 	xe_gt_throttle.o \
> > > > 	xe_gt_topology.o \
> > > > @@ -73,6 +72,7 @@ xe-y += xe_bb.o \
> > > > 	xe_guc_id_mgr.o \
> > > > 	xe_guc_klv_helpers.o \
> > > > 	xe_guc_log.o \
> > > > +	xe_guc_pagefault.o \
> > > > 	xe_guc_pc.o \
> > > > 	xe_guc_submit.o \
> > > > 	xe_guc_tlb_inval.o \
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > > index e4852c4c90cd..44ed3202dfd1 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > @@ -32,7 +32,6 @@
> > > > #include "xe_gt_freq.h"
> > > > #include "xe_gt_idle.h"
> > > > #include "xe_gt_mcr.h"
> > > > -#include "xe_gt_pagefault.h"
> > > > #include "xe_gt_printk.h"
> > > > #include "xe_gt_sriov_pf.h"
> > > > #include "xe_gt_sriov_vf.h"
> > > > @@ -638,10 +637,6 @@ int xe_gt_init(struct xe_gt *gt)
> > > > 	if (err)
> > > > 		return err;
> > > >
> > > > -	err = xe_gt_pagefault_init(gt);
> > > > -	if (err)
> > > > -		return err;
> > > > -
> > > > 	err = xe_gt_idle_init(&gt->gtidle);
> > > > 	if (err)
> > > > 		return err;
> > > > @@ -851,7 +846,6 @@ static int gt_reset(struct xe_gt *gt)
> > > > 	xe_uc_gucrc_disable(&gt->uc);
> > > > 	xe_uc_stop_prepare(&gt->uc);
> > > > 	xe_pagefault_reset(gt_to_xe(gt), gt);
> > > > -	xe_gt_pagefault_reset(gt);
> > > >
> > > > 	xe_uc_stop(&gt->uc);
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > index e68953ef3a00..529d2b3bec21 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > @@ -21,12 +21,12 @@
> > > > #include "xe_devcoredump.h"
> > > > #include "xe_device.h"
> > > > #include "xe_gt.h"
> > > > -#include "xe_gt_pagefault.h"
> > > > #include "xe_gt_printk.h"
> > > > #include "xe_gt_sriov_pf_control.h"
> > > > #include "xe_gt_sriov_pf_monitor.h"
> > > > #include "xe_guc.h"
> > > > #include "xe_guc_log.h"
> > > > +#include "xe_guc_pagefault.h"
> > > > #include "xe_guc_relay.h"
> > > > #include "xe_guc_submit.h"
> > > > #include "xe_guc_tlb_inval.h"
> > > > @@ -1545,10 +1545,6 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
> > > > 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> > > > 		ret = xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
> > > > 		break;
> > > > -	case XE_GUC_ACTION_ACCESS_COUNTER_NOTIFY:
> > > > -		ret = xe_guc_access_counter_notify_handler(guc, payload,
> > > > -							   adj_len);
> > > > -		break;
> > > 
> > > this doesn't seem to belong here. Should that be in the last patch?
> > 
> > I think it is in this patch as xe_gt_pagefault.h was removed as include
> > and xe_guc_pagefault.h was added. So I think this is probably correct.
> 
> humn... ok, now I see why, but it still looks weird. The justification
> in the next patch for removal was "it's now dead code", but there's no
> mention why we made it dead code in the first place.
> 

Let me adjust the comment in the follow patch.

Matt

> > 
> > > Or a dedicated patch for acc removal?
> > > 
> > > I started to look into this because we need to add support for the
> > > prefetch bit for xe3p, and I think it makes sense to add it on top of
> > > your series rather than conflicting with it.
> > > 
> > 
> > Yes, adding it on top would be preferred from my point of view.
> 
> will do, thanks.
> 
> Lucas De Marchi
> 
> > 
> > Matt
> > 
> > > Lucas De Marchi
