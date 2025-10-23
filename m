Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38239CCD1BC
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 14:42:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8F610E90E;
	Thu, 23 Oct 2025 14:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NuxIKsU/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E906010E90E
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 14:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761230572; x=1792766572;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rKhW8fL99DB0ky1La0heSeyHXDSH1KV+taluVk0LfQI=;
 b=NuxIKsU/qNDuaHoWuwdKv0leyeANwawDn4r2Mdtyg5pL8xMhZy/CQlr0
 mvTWx9K1opFvohX10X8pLYBH/nUJaeTPBtB9a+/qB/Kyggy0L13g9UkmQ
 ew3NYafaWtC7PCR8YSyXIAbtGPYR4+ZDCcO2Mx7tTW930LHHpyOnpBI22
 qz580U1wvx+4jO4BukNEdnJxoSppg8fY7hsETcBTvpZ1fm7DjxCWrSrHH
 sVeSpatW4yzbmlqmzvdg9VeOyQBA0blvArQOP4Q0hsCiDvLxNY85jNjqo
 lZIZsvxQ2gxAs+gaCWq8Uaqz/eO1wF1WueJ/44Zli7NRQbTzF8WxQzPO+ A==;
X-CSE-ConnectionGUID: iG1Z/+3YRIaTA9+qZCQt9g==
X-CSE-MsgGUID: 62y/qm5mSvqZCC4YIWk02g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63105377"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="63105377"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 07:42:52 -0700
X-CSE-ConnectionGUID: A+NOId3DTt+d2Mpvdo1Q1Q==
X-CSE-MsgGUID: DhOjAybqRcqmL2/NUyJYjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="184947128"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 07:42:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 07:42:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 07:42:50 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.21)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 07:42:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2MC1dKf1afDGMk4fn03ehFoMEU/ypUURnbIvdqVL6F6yJJ14rM2B7o5DMiU839xQ5ErQOPT0KnvWh2jyJ2mgq6l0zbdwn0/Rkgu9R/wmh63RoKf2zvNyWw95B6/+9MqtPX3ptkK9GkbgrGKDbn9BYFNFY3Efo4fnx8ERMB0C6ZKEgbOCZWD4s4WIvoemV1je8Xl6aYTStmCI1DEgZ4WmI9W9TWS3sLYAHXFgCKuYj6W4e/klShmqzIBfF/MBsRDtkVyhNbtXX3BiA0/6oQMSwkR3kpYkPUUpzo9DAAMs5WGsYRz6DdOnzXAr6iyxlfD/oxqGDd2lfnmaaBVR/P+Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yx6Pziu/Z858CcXJ7IQCQ+or6H6PPKyJWjo3O5QZkaQ=;
 b=HOdcaWVh57blex9ZQE3nYUncRrPbTiHQDhQamH4TRjX1YMHj8g3pZvct2J0T0oZHc9j79eQdVJ/G9hSkw49SpHJArRBiKUHGZ+oTBab2AzzBxPnn6+XxmdQacB9oclyAn6eYX2LJJ1p+v3WjU/yQAoroW6PMHB6D2cvParzDBF0v31MzKhy/M41H7XbwpNpM3ppHYpPKuRwI3TSmUnrMgGzLRvh0yjV36DGoco/E2mld8RExjRHHdk9Z2JU80QmwwpCwUSVgqNrJbEhA1SFi2hK03mINtsAatSpmn0rKhumchgrYiGrD1nikAy+wjmF+dCzhjZlh4jiz9/7+o0c67A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB6229.namprd11.prod.outlook.com (2603:10b6:208:3c6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 14:42:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 14:42:41 +0000
Date: Thu, 23 Oct 2025 09:42:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH 10/12] drm/xe: Handle MERT interrupts
Message-ID: <r4kyzbn3wh2w7zqp6h7oo764wm6gzfrl2t2lrf6t7bycxecgmx@wbyxazq5q4ym>
References: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
 <20251021-cri-v1-10-bf11e61d9f49@intel.com>
 <20251022231912.GZ5409@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251022231912.GZ5409@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0219.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bf41712-3107-4b65-4887-08de12426ba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IIo140eHiY34eK/wyXavyaLW9gvYsETupd0uj8bNEEtm8ljhR9GQ19IQ8F5g?=
 =?us-ascii?Q?BCp2EonOZKjvsInjlqmt6KGFaCR4p+oKG38mbY84TsJ9m9VuYEkKV710QttL?=
 =?us-ascii?Q?zWzul8UpHxIyK+As0GainH9u7BlT0WfLLgA7RDHqEkwDN6rn3Gg3oGuX67bk?=
 =?us-ascii?Q?HcMrG5FdHy4LhIqVbWhdDAvH4LMo0WIcIWGccL8RuR0lAiZS0hJ4tiaoqhcv?=
 =?us-ascii?Q?wcqHNIQ2M3rOUd5ko07VD1zRKhAepx1U6gqwsGjkuZ5pzEj+HUCLMUJxO+Ea?=
 =?us-ascii?Q?FcKfRE0wC6WVKe0HC2pqswS0IdXWK66PJU0eVfVOWJWySypu9Z2IgoXafX9x?=
 =?us-ascii?Q?FrB4dVM4MG1zz/Z2FVFUDwY9eey1bd4pVv9jiQvRpEdIM3DT/xRp7ygHfJcX?=
 =?us-ascii?Q?U40IEmAha8k+pFAtn5rsCRgtzVUZmrWq26q2uMIxjKY6JfAzDEtw91F6V+EG?=
 =?us-ascii?Q?J0lCf1RtRhx3ZkQ1Iaf5f0Bo0kxk2jDiAc0XisBGWpeFmbuj0N4kK+qq0xQQ?=
 =?us-ascii?Q?3GrbKUBUlo+35CJYLGnqfx216cElnIZLtx1AzdDGy47RK+RxsF0VNYHEisUb?=
 =?us-ascii?Q?MutknMK7ZKkgLXM4i+F4xVtf8GGnzR8A5FSq9003PpVZu3pU0excXTH3SXA3?=
 =?us-ascii?Q?JIsVbr6cgcxvgNpqdxunLcLaSkWJla/NPYiBDCChZ2yUpYVuFUv9BYHV/HpM?=
 =?us-ascii?Q?WuxWzl/rznbYdpDMB0sFeesyvI2zXJX9H/KMMB+CUjBZHE9pdX2w0/nFg1TJ?=
 =?us-ascii?Q?+HQ4wPByPB0vcMfRSoWA1g0yxHJUdmEnvm0vPzuUX9Rup8mQPsAmUd4v6W2m?=
 =?us-ascii?Q?45kP4GR9z03ywAFAFhZrEdkLBYjVp04iG6GExrpfVFAjpn3nB/mQcxxmcN0G?=
 =?us-ascii?Q?6ewPyVB71xrnlkC4CDrd7Np6FPm8lUmiWqDeA/tO4K20sH0lCHelXPjgHujv?=
 =?us-ascii?Q?AVAqm1lLcrezqZmlxO5cnHDZdVw7QIewbnKyYcDD8WjI9vqCBL8fxx//oXEN?=
 =?us-ascii?Q?sE1f3kvfx6pzIczo0RAgGBaDUtvu62T5pzDauLaeBjB3eEFT0BssLA3NhICx?=
 =?us-ascii?Q?RPvF2j6xzHa/YoTNk2iIeAxdHH4BcVtUICrn2VlPRNIc3bw3MAH070kr0Hr6?=
 =?us-ascii?Q?CSdwOnlHRI+G4xz4pxL1h3egIK2hOXpyORJfQZD4SR8+Jqh44jZsJ5zRAO5x?=
 =?us-ascii?Q?LJlg8Z8iYzuWZ9dK01yLDeGRPjqy64MH9ra4J+wrvk/QpWXYdOArVycZlTQe?=
 =?us-ascii?Q?Rl52drwHcbb6v3IRxlB/Zbgr5jstvnd+Di8iY9fVf+cQOj1/qTaqBuNz/rMc?=
 =?us-ascii?Q?qLy5PfGkFF5sWRDuZPrU8iSwu0x3vDlYU8pHuojswBCqD7LVLrCsQ6L8Nvw4?=
 =?us-ascii?Q?xomjVsJXuNC4nl1Vz8O3ijsaiAUiIwjvC4RvkJp1Ep5a39Z4GKyuvk7CjF3U?=
 =?us-ascii?Q?mNYXi2nEKQ0YxtoCiJpN0ISRdpKoFPjZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bxBmarZ5aC/fKOnOcTN/9w8Ui7HyXAee0ziZgag9kzjOusFSWc1zEx61xVGl?=
 =?us-ascii?Q?scNYCdMGTyPbF8EXa+LMGAo32goTOI+aTuvEa1Iv7WvHx2K//DWxopINNiFI?=
 =?us-ascii?Q?53e4H7Yq+igww9fOejs6LJIrmtRbPcVJ0KzIn9bTW+D1fePOjHmKFdm4Ik4Y?=
 =?us-ascii?Q?zxqzAZh1kzYSSWRjsMcXIjDAWHRmcgtgaTGxcJuEydRGSNeMrBxBrivbU87f?=
 =?us-ascii?Q?dO6ui2Qgfu3LFKwaY0TOQSbo51fjzCDEbdgX+1eEGaEP8tO6bxWU/AjynWDb?=
 =?us-ascii?Q?9DdUcFmgpNE+vknJ6a3m69E80KCEJ3VJcIk1dQ4Ncf42Dm1oGm6m2vPRR3X6?=
 =?us-ascii?Q?t7PZzxpyDspGd1oP1IXozTPwZMFrK3HG58cQBUszIM9pvDCL+QPp4GhyAKPU?=
 =?us-ascii?Q?b8tAuPrnLSLpU9QGf6XevdWSj5O9tU2nwACPUx07ADgQfyfguiaW7oOdB5+o?=
 =?us-ascii?Q?x0CjDxiJzTlbIaz2Zq/gkcJ/ErEocFYIEdqCEGNDbnx0j1Ut8HBKTKqbyvAY?=
 =?us-ascii?Q?+rl5coYC/BSwyVeV+eAEQFFrOzV6NlfF6DxXFrWHsR6IhbZaoTfbNrAKd8Vy?=
 =?us-ascii?Q?suUhTnZH2JKJ4UaE6h5Y8y4HhZKgtrAsrDeMNy+6RAK9FagTmd+U3173zidV?=
 =?us-ascii?Q?Mmdhd3dQEVCNo9+dxXpxWPB0Sw39XWnfO7u6G0qQQaRYTFONq89/bJv4gakL?=
 =?us-ascii?Q?btZYEedSP4pDuXSCxDDpZP+4BbZKTYP41VY61tKgsV6ZPZYO2vxsKST/vjcG?=
 =?us-ascii?Q?gchWxJLiC7kK8cqWXS0f3+/S89R3fjyyNjuyWW16oGXd40cT+PkE5u2wUHiF?=
 =?us-ascii?Q?JyFVzT07Gw/ZOgBiGbzDDToVrRr0vZEFO68klGM8QT9e5/uSKi2b2eO/LOew?=
 =?us-ascii?Q?bM2/n62kiUccP/r0sf4butNgyMO9S8I9IhFJQ8CDKkz3mPMwqYeZUnTvw0WG?=
 =?us-ascii?Q?YRuGxktMM8PF/NqzOJB99/S1RrCUdyfv5s5hwJynDESur1nmiEPcpx5XaW7T?=
 =?us-ascii?Q?XtX77EYcgx4iB/SUpDEmZrgPMx6/qokiRx/xjcWYcJq23mVux3ycMw8FeoqQ?=
 =?us-ascii?Q?LtfVFwoWxNkQaTOO0rjCrY+OmF+6RCADQD7J+05nAeLv8hoSITNzYQu5x6Q9?=
 =?us-ascii?Q?MMkEsRYmaPipm955Wnr6oGI0fQLYLfeWRSEJVM9K+eeTfExg5bvuO2xbkxA3?=
 =?us-ascii?Q?exEttIlADHp58tffmAdS2UxKC94XwczH1JERBO+v4IFqz4xmozPFJJ5N/W5i?=
 =?us-ascii?Q?R6En9i4+twJ/ESHlLkYllXJ7B+JdTPCluuiH6YGbOi1+3rBbivARbyDESDBk?=
 =?us-ascii?Q?FGIlmiEl7xzROVYqp1EPLQ2tUGGHaFLMDOpeXHUKlMKyqPflRWi/fMqsxmyI?=
 =?us-ascii?Q?jUEepBcKbgnvwgK6mcbZ98vv3B6RmtAWqwBopps1/QSSrSL0d10CohQVDp9/?=
 =?us-ascii?Q?WfcddqUOssOIsLuddQ3vxtuEK+qSov6Q/sS+hz+qw0KAxPLp0kXJvcz9kyQm?=
 =?us-ascii?Q?xubwlsKh3XIFvla8cIf4AgzNyvWKdm9JobLdpqgBsSLAMoGIbfBabFmYjYbw?=
 =?us-ascii?Q?HWWjSFvAvdiWIrmNUswGEPs9kT3mb29Vp7pG7lbIMbgLUh3JprfIyZrhjD/k?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf41712-3107-4b65-4887-08de12426ba0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 14:42:41.7442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yiQxm0kh1oM7zGv4q6FUrUY8UI2aDs4Vi+KRvdGjXFPW+Yk88r71IXigbV8lMjCYCT4pzhwhtgWVqoQ+454kuH5hSteMX2RUZ4Xgpw/CA2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6229
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

On Wed, Oct 22, 2025 at 04:19:12PM -0700, Matt Roper wrote:
>On Tue, Oct 21, 2025 at 10:17:42PM -0700, Lucas De Marchi wrote:
>> From: Lukasz Laguna <lukasz.laguna@intel.com>
>>
>> The MERT interrupts are indicated via bit 13 in the GFX master interrupt
>> register. Detect these interrupts and start supporting them.
>
>This patch doesn't actually do anything yet; I don't think it needs to
>exist on its own.  Can we just squash it into patch #12 where the
>interrupt starts being handled?

yeah... while reviewing this before sending I checked "is this an
interrupt we are actually doing nothing?". Then I noticed the patches on
top build on it and accepted that as separate. But indeed, both are
small enough that could just be one thing.

thanks
Lucas De Marchi
