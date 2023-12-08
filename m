Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFDFC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 20:45:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D59910EB2D;
	Fri,  8 Dec 2023 20:45:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5C810EB2D
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 20:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702068342; x=1733604342;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Xm9bc0TwsPa68tw59k0E1gRT1MyGWYtBbmN6qiCu4lA=;
 b=J9iYIwmAzfq6SMXj950mgS91zaeDRuku81yeZa7Yv2MggIhH0K4qp0aF
 ZBdTLq/+YaW1+sSGOS383K7kMzMl6Ojj0jmWUx0P594cueUwjxCd48CHm
 y9TtvwkNBD/jbdslLlDHnEdBZxRpID51ZEEU3HaJECHc9lVvYTsH2Fb3W
 uZ/Q7ntAzxUoxoIM6zPrqBiuj4tPorc3ZQGhwoF/UF2pSoooWcJ1aMiCQ
 UZTm52x6sG9aJ5+Z9lu9/xN2Aj6C4HP2H2CX0R57a96S3QGPk/dQGLyKV
 lYETKv9NV2+384bW4EFcqVShYUu+X5J/IcA3Jzn9hbMpKIn7Ro+KsMyEm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1281270"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="1281270"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 12:45:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="806523204"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="806523204"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 12:45:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 12:45:40 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 12:45:40 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 12:45:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oK8FB15drvoDVMD3cXPRmmuIvWZ4dKZAQ7ENGEoCR7IBJRCzoBdx/8XSxheFYl4NLZOOs4979JDziOrk4Av/hxk2CZOV0AhYdavQGbZzA3s2bK2rAQ3cjhjB/EiKbLewRNWKoILdMR/Ho+6ztvaaWmbdmbqziW3G0Nt/Az6vjvAjcaN0QdCPdHXgj6PHqKj99okJ7bL38/yED/BkvZTfuA/AnxacxovDbsj8cBoUU7bt8Sr2yH7e7R0lUae1ITRSK+h7g2SmUwmoAR/3FHAk4O7KTXuWm5Kdfiwmtk0ANOTGTauykhRjvFcYW4CF+7uPA551eUXkaukPQQpf6cNc4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZIgG8XvGZWgLGJtw+LUSZV9YoZj2QifX1kf9pU9xPc=;
 b=Jc0vowWlPzrN45dMIBBdjQoj1MnjBZ+I9qtu8SYMj14Fqe/+RsHNP04qPX3SGlZvkrmdrVhuGvyUT96goVtAq3Zn3GKd75pLWgJvhW9MKo9GNPjPHinCKdxqdkS0L9jN3tuTz8icOC5OIyZnYOBCSQ65yo5EhQdppzh5Gc3J8/jwDUBBd9cGgP+XO31kYGZjzCop/EifqsikweI+5IvaPUMU4tCO9goX+sJfTm6kAxsww55Ys1iXQu3znTvN5El+dSsdj6N8Nw9M1qBplavGCygc0TRI12gIpeEERUA/+mGCzLpisZ+y3Wb/rSnc+KhE65blrp4vLSye3ddftPIVFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by MN0PR11MB6136.namprd11.prod.outlook.com (2603:10b6:208:3c8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Fri, 8 Dec
 2023 20:45:36 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::787c:c5fe:c197:443c]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::787c:c5fe:c197:443c%7]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 20:45:36 +0000
Date: Fri, 8 Dec 2023 12:45:30 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-xe] [PATCH v3 1/3] drm/xe: Enable Fixed CCS mode setting
Message-ID: <ZXOAatkVkKnisJZ+@nvishwa1-DESK>
References: <20231204053709.30013-1-niranjana.vishwanathapura@intel.com>
 <20231204053709.30013-2-niranjana.vishwanathapura@intel.com>
 <45n43e2hfpiinnbhucv7xjihvp7f3o4p4guc3ynzmw3im5f5kz@cupbbfu54sqm>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45n43e2hfpiinnbhucv7xjihvp7f3o4p4guc3ynzmw3im5f5kz@cupbbfu54sqm>
X-ClientProxiedBy: SJ0PR03CA0176.namprd03.prod.outlook.com
 (2603:10b6:a03:338::31) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|MN0PR11MB6136:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f81d4a-504d-4490-603c-08dbf82ea17b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fKTYaQ9xciDJCj/MjpDvF3vrykK2VFG9aFzk89IbEVxbapCHum8XlkfGkCNZvJiI0R2XBa0ZR8d+l0uXROtmBlRI3qaODp+5hrgmlbil8iXfoQYHWtZxw4XLkI3Wh2esxUmB1uRFaykfYrJ6ZOSOBORhdUZQNafXVMDlR9E3jI6b5ojxyCLQyTe5SPV1r26RTQqZ5jV1T5uVYS9n/HF2rI3bHoyy/4n4pm/K74bUFj0DiOJ7daAyXi66a762sorK5wlYvZ4qHyeBUdDvQwjd8PegaGA1Oxw74jsWc9XWTe/wXPGFWJJHVjXqD2Xyag1V5dQjP+K4TURJ4PdTrAnMLT2deZkVBMr4t3RnLdyH6Hb7ceA9wWJHMu9L6ekOVrdP+z26A1kuIAYf+kyFYthanl63nDYaVfFGDBSxjKB5SixYPYL83PUQDh/frqfsOVxouhUCH/XvRUgLomcy+EsZdlu3J9pAhTNkt/XLlDVvU8ZlulCphyOsPZZdG81i9usot4QHwyNqGu7AU/TZHWur93yDfTB8xaypX9PGv2m038t58lrFC5AcX1Dm4OvOgXRP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(396003)(39860400002)(346002)(366004)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(8676002)(4326008)(9686003)(6512007)(6506007)(8936002)(83380400001)(82960400001)(6862004)(26005)(478600001)(6666004)(66946007)(66476007)(66556008)(316002)(6486002)(38100700002)(6636002)(2906002)(33716001)(41300700001)(44832011)(86362001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?oiGkfB8O3R7CPrWVVD42DrE9u390N2KC9CDNfH4isAh6xD0vLLWDgIucoZ?=
 =?iso-8859-1?Q?VMhP9fcXfCTokJ6rfjJZjiINUNuega2hen8kn1EQbgEun48QLqWTe4BHpl?=
 =?iso-8859-1?Q?SvwSLb3B0t2rNdEOvYrnkNwRBwcN6Fbo/QnIiIxcX8W9upS5/ourr8MPRC?=
 =?iso-8859-1?Q?aIBUUT2XDCK1dJIyQcB1F2MyPZy47/bxAWAELDNeR+bsQURNlxQnQ13Pzt?=
 =?iso-8859-1?Q?Xxf8cjV+P74RJr866dBeehZr+bj+JMH6/CmFc+36zqRl3j0eSA7+bt0qLm?=
 =?iso-8859-1?Q?Hqk+t7vOTlKx0nH2MN/n2+4usTGJPU/06mJSWBeS26W0CwsUX5PMTmhKi0?=
 =?iso-8859-1?Q?zweIoqftOdjAhX7ULnpyQglXZSzWFaEAB6JxUUP7WtRMQ4uFMpDpWRe52D?=
 =?iso-8859-1?Q?WK2epkKdDcbZQBTrf+K1MUjPSEefSVZgiDHLFEGuBG3uzUNfD5uEM1laW+?=
 =?iso-8859-1?Q?24Sa7jK5W+4VmJdvaqqFs7zMC7l4s9Ro+dcApIvYgHRnE1O7XiJXiFBcWj?=
 =?iso-8859-1?Q?hhuEdbcpp+xKt3QihmtbDTUsH3jun9toEep07s5bNVbz53DzLWI+1iyo1N?=
 =?iso-8859-1?Q?sW9uJp2eVomYj0Rd5wIdwQqkeCNteLHiMRUtRgU8B04LUoBb7JeDMQZbqE?=
 =?iso-8859-1?Q?E6BnLfevtSs0yWN+Ro2RpAzBfCNC5oTYPbMmHI+VPY/b+kiOBod66pdf3n?=
 =?iso-8859-1?Q?Ry/2FxljQUpaAg+xJhl3Sf15KYw2RObe0PbkAwALcTWaaQSok0uz1aqcJ1?=
 =?iso-8859-1?Q?Y8H4qNUXls3Rlg6i+VKx9H4NiKB5LaR3JZCR4Qz0PFAyy9814qsayzu2EY?=
 =?iso-8859-1?Q?XDwAR7Dvfc19fNqrmaAlqGiDgcT6JJORlQiIUUDm9OSUtSEBvmS2eW1iEy?=
 =?iso-8859-1?Q?F7Gu6L+K7MGtoc1fujoA0JZfsOBrJBbe0SDcxqwJR9dDItpkBV4qoRgYxa?=
 =?iso-8859-1?Q?OWU6lEnzCoKk3r9OurJ8zH9pXZm9rDIjaz3CLIlVSGWyS6JACSnajdIkKY?=
 =?iso-8859-1?Q?+Qmvl7C3YG0EWaCcvOKJYc3SbGU86ezQu4zkgClkfoGnn0FUyYxAMuHyEO?=
 =?iso-8859-1?Q?++ilHFFDp3je7uSm/szwpljyD+GS1LYFN3sC5khqZSd5cbvsjxOENL67l3?=
 =?iso-8859-1?Q?cSKvZj29AdB8PvtcxWsTkVWM6z8aMFIeNZkppEKDclP9yxo/S8Ne7Gxt5I?=
 =?iso-8859-1?Q?3Ko0zU9M7N8Zj+p11nwNhtTVvQXC2m+65X5gtPcrzQ7X8mzhoKYxziLbnU?=
 =?iso-8859-1?Q?PocSCADKw4tBUctxutYtU2ZuN74XMpv7fN/TJDpycn06STn+WzqcXnfKs1?=
 =?iso-8859-1?Q?eU1Os8Wy+bDEnKbcsHWSfNJnkwnqYqWBKj8GXjAru22ZuvLCdIe5yiCV7d?=
 =?iso-8859-1?Q?BLSbJ7RbXTP2znnElBOAx3w2jAPv8wNQCla0FFrmlOLq9HwJARrCeEhpLR?=
 =?iso-8859-1?Q?4YkQASaEJpRB4F1jVCfF9YK6w+EPBKRLV9SgVaY+Fn5jrelBJ84d58iYHf?=
 =?iso-8859-1?Q?DBzokogPUih/JxWEKNoju9mNAlNKGyvfp6ALJXDTYo1HgOzddUd+YhJuE/?=
 =?iso-8859-1?Q?8DgEZyA9ryQZFjCVVjzgzRFjDkRXtLsnL6nJR5PTL/ziAvjKwcXeHHD/dP?=
 =?iso-8859-1?Q?m68yDPbXmLSU3Op0eNeHOQ+U5YPpchQqABvz6ePU8/hvY2ke7yxSB/WHF9?=
 =?iso-8859-1?Q?SIjVnwufFgEw5Z77G5I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f81d4a-504d-4490-603c-08dbf82ea17b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 20:45:36.5716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hVRN57eXEzzz/fyHrqUZub0F8PzQIpj53rUAn5LYrrrgV3xVuldHZXIcf9kTrDb+K2tXYMIThmqqnAkOJ+5bGewy7mcWpR4sSI1PvipWcArbWraBApfeVMYsrSjw/PsR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6136
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 03:45:19PM -0600, Lucas De Marchi wrote:
>I see this is merged, just giving some after-the-fact comments.
>
>On Sun, Dec 03, 2023 at 09:37:07PM -0800, Niranjana Vishwanathapura wrote:
>>Disable dynamic HW load balancing of compute resource assignment
>>to engines and instead enabled fixed mode of mapping compute
>>resources to engines on all platforms with more than one compute
>>engine.
>>
>>By default enable only one CCS engine with all compute slices
>>assigned to it. This is the desired configuration for common
>>workloads.
>>
>>PVC platform supports only the fixed CCS mode (workaround 16016805146).
>>
>>v2: Rebase, make it platform agnostic
>>v3: Minor code refactoring
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>---
>>drivers/gpu/drm/xe/Makefile          |  1 +
>>drivers/gpu/drm/xe/regs/xe_gt_regs.h | 14 +++++
>>drivers/gpu/drm/xe/xe_gt.c           | 10 ++++
>>drivers/gpu/drm/xe/xe_gt.h           |  2 +
>>drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 78 ++++++++++++++++++++++++++++
>>drivers/gpu/drm/xe/xe_gt_ccs_mode.h  | 23 ++++++++
>>drivers/gpu/drm/xe/xe_gt_types.h     |  8 +++
>>drivers/gpu/drm/xe/xe_guc_ads.c      |  3 ++
>>drivers/gpu/drm/xe/xe_hw_engine.c    | 20 +++++++
>>9 files changed, 159 insertions(+)
>>create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>>
>>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>index 87f3fca0c0ee..86691f3b9077 100644
>>--- a/drivers/gpu/drm/xe/Makefile
>>+++ b/drivers/gpu/drm/xe/Makefile
>>@@ -70,6 +70,7 @@ xe-y += xe_bb.o \
>>	xe_gsc.o \
>>	xe_gsc_submit.o \
>>	xe_gt.o \
>>+	xe_gt_ccs_mode.o \
>>	xe_gt_clock.o \
>>	xe_gt_debugfs.o \
>>	xe_gt_idle.o \
>>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>index d318ec0efd7d..f4f2cf8d9022 100644
>>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>@@ -401,8 +401,22 @@
>>#define   COMP_CKN_IN				REG_GENMASK(30, 29)
>>
>>#define RCU_MODE				XE_REG(0x14800, XE_REG_OPTION_MASKED)
>>+#define   RCU_MODE_FIXED_SLICE_CCS_MODE		REG_BIT(1)
>>#define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
>>
>>+/*
>>+ * Total of 4 cslices, where each cslice is in the form:
>>+ *   [0-3]     CCS ID
>>+ *   [4-6]     RSVD
>>+ *   [7]       Disabled
>>+ */
>
>we don't document fields like this. This should come verbatim from the
>bspec. Eventually we want to autogen this header.
>

Thanks Lucas for the comments.
Ok, will remove it.

>>+#define CCS_MODE				XE_REG(0x14804)
>>+#define   CCS_MODE_CSLICE_0_3_MASK		REG_GENMASK(11, 0) /* 3 bits per cslice */
>>+#define   CCS_MODE_CSLICE_MASK			0x7 /* CCS0-3 + rsvd */
>
>these names are odd... aren't then inverted? I.e., should be
>
>+#define   CCS_MODE_CSLICE_MASK			REG_GENMASK(11, 0)
>+#define   CCS_MODE_CSLICE_0_3_MASK		0x7
>

No. CCS_MODE_CSLCE_MASK is the mask is the mask for cslice 0, whereas
CCS_MODE_CSLICE_0_3_MASK is the mask of all 4 slices.
I will define them as below.

#define   CCS_MODE_CSLICE_0_3_MASK     REG_GENMASK(11, 0)
#define   CCS_MODE_CSLICE_0_MASK       REG_GENMASK(2, 0)

>>+#define   CCS_MODE_CSLICE_WIDTH			ilog2(CCS_MODE_CSLICE_MASK + 1)
>>+#define   CCS_MODE_CSLICE(cslice, ccs) \
>>+	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
>
>I don't think we need these calculations here. Prefer using the REG_FIELD
>macros instead
>

Ok, will move them to .c file.
Can't use REG_FIELD macros, more on this below.

>>+
>>#define FORCEWAKE_ACK_GT			XE_REG(0x130044)
>>#define   FORCEWAKE_KERNEL			BIT(0)
>>#define   FORCEWAKE_USER			BIT(1)
>>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>index 8a6fb9641cd6..dc05c7780848 100644
>>--- a/drivers/gpu/drm/xe/xe_gt.c
>>+++ b/drivers/gpu/drm/xe/xe_gt.c
>>@@ -22,6 +22,7 @@
>>#include "xe_force_wake.h"
>>#include "xe_ggtt.h"
>>#include "xe_gsc.h"
>>+#include "xe_gt_ccs_mode.h"
>>#include "xe_gt_clock.h"
>>#include "xe_gt_idle.h"
>>#include "xe_gt_mcr.h"
>>@@ -452,6 +453,12 @@ static int all_fw_domain_init(struct xe_gt *gt)
>>	if (err)
>>		goto err_force_wake;
>>
>>+	/* Configure default CCS mode of 1 engine with all resources */
>>+	if (xe_gt_ccs_mode_enabled(gt)) {
>>+		gt->ccs_mode = 1;
>
>mode? or count?

ccs_mode is defined as,
"@ccs_mode: Number of compute engines enabled."

Here ccs_mode can be 1/2/4.
I preferred the name ccs_mode as that is how it is commonly referred to as.

>
>>+		xe_gt_apply_ccs_mode(gt);
>>+	}
>>+
>>	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>	XE_WARN_ON(err);
>>	xe_device_mem_access_put(gt_to_xe(gt));
>>@@ -558,6 +565,9 @@ static int do_gt_restart(struct xe_gt *gt)
>>		xe_reg_sr_apply_whitelist(hwe);
>>	}
>>
>>+	/* Get CCS mode in sync between sw/hw */
>>+	xe_gt_apply_ccs_mode(gt);
>>+
>>	return 0;
>>}
>>
>>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>>index caded203a8a0..a818cc9c8fd0 100644
>>--- a/drivers/gpu/drm/xe/xe_gt.h
>>+++ b/drivers/gpu/drm/xe/xe_gt.h
>>@@ -17,6 +17,8 @@
>>		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
>>			  xe_hw_engine_is_valid((hwe__)))
>>
>>+#define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
>
>this define seems out of place in this header
>

Ok, will move it to xe_gt_ccs_mode.h file.

>>+
>>#ifdef CONFIG_FAULT_INJECTION
>>extern struct fault_attr gt_reset_failure;
>>static inline bool xe_fault_inject_gt_reset(void)
>>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>new file mode 100644
>>index 000000000000..541c44c70a84
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>@@ -0,0 +1,78 @@
>>+// SPDX-License-Identifier: MIT
>>+/*
>>+ * Copyright © 2023 Intel Corporation
>>+ */
>>+
>>+#include "regs/xe_gt_regs.h"
>>+#include "xe_assert.h"
>>+#include "xe_gt.h"
>>+#include "xe_gt_ccs_mode.h"
>>+#include "xe_mmio.h"
>>+
>>+static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>>+{
>>+	u32 mode = CCS_MODE_CSLICE_0_3_MASK; /* disable all by default */
>>+	int num_slices = hweight32(CCS_MASK(gt));
>>+	struct xe_device *xe = gt_to_xe(gt);
>>+	int width, cslice = 0;
>>+	u32 config = 0;
>>+
>>+	xe_assert(xe, xe_gt_ccs_mode_enabled(gt));
>>+
>>+	xe_assert(xe, num_engines && num_engines <= num_slices);
>>+	xe_assert(xe, !(num_slices % num_engines));
>>+
>>+	/*
>>+	 * Loop over all available slices and assign each a user engine.
>>+	 * For example, if there are four compute slices available, the
>>+	 * assignment of compute slices to compute engines would be,
>>+	 *
>>+	 * With 1 engine (ccs0):
>>+	 *   slice 0, 1, 2, 3: ccs0
>>+	 *
>>+	 * With 2 engines (ccs0, ccs1):
>>+	 *   slice 0, 2: ccs0
>>+	 *   slice 1, 3: ccs1
>>+	 *
>>+	 * With 4 engines (ccs0, ccs1, ccs2, ccs3):
>>+	 *   slice 0: ccs0
>>+	 *   slice 1: ccs1
>>+	 *   slice 2: ccs2
>>+	 *   slice 3: ccs3
>>+	 */
>>+	for (width = num_slices / num_engines; width; width--) {
>>+		struct xe_hw_engine *hwe;
>>+		enum xe_hw_engine_id id;
>>+
>>+		for_each_hw_engine(hwe, gt, id) {
>>+			if (hwe->class != XE_ENGINE_CLASS_COMPUTE)
>>+				continue;
>>+
>>+			if (hwe->logical_instance >= num_engines)
>>+				break;
>>+
>>+			config |= BIT(hwe->instance) << XE_HW_ENGINE_CCS0;
>>+
>>+			/* If a slice is fused off, leave disabled */
>>+			while ((CCS_MASK(gt) & BIT(cslice)) == 0)
>>+				cslice++;
>>+
>>+			mode &= ~CCS_MODE_CSLICE(cslice, CCS_MODE_CSLICE_MASK);
>>+			mode |= CCS_MODE_CSLICE(cslice, hwe->instance);
>
>REG_FIELD_SET() would be more appropriate.
>

Can't use REG_FIELD_PREP() here as it expects __mask to be a constant, etc.
CCS_MODE register has 3 bits for each compute slice. So defining a mask
for each of them and using it cumbersome and not scalable.

>>+			cslice++;
>>+		}
>>+	}
>>+
>>+	xe_mmio_write32(gt, CCS_MODE, mode);
>>+
>>+	xe_gt_info(gt, "CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",
>>+		   mode, config, num_engines, num_slices);
>>+}
>>+
>>+void xe_gt_apply_ccs_mode(struct xe_gt *gt)
>
>in xe we try to keep things into namespaces defined by the header, so
>this should had been xe_gt_ccs_mode_apply()
>

Ok, will fix.

>>+{
>>+	if (!gt->ccs_mode)
>>+		return;
>>+
>>+	__xe_gt_apply_ccs_mode(gt, gt->ccs_mode);
>
>what's the point of the split between xe_gt_apply_ccs_mode() and
>__xe_gt_apply_ccs_mode()? At most it would have been called
>apply_ccs_mode() rather than __xe_gt_apply_ccs_mode(). But it could as
>well just had been 1 function as there are no other callers and no
>clear role split between one and the other. Bothw of them operate on "gt"
>

Well, it is partly left over from previous design, but I kept it as
during gt reset this function gets called for all platforms and we
only want to configure ccs_mode if gt->ccs_mode is set (which currently
is only on PVC).
But I see this is not correct interface anymore and I will get rid of
this wrapper.

>
>>+}
>>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>>new file mode 100644
>>index 000000000000..e8766879f6ec
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>>@@ -0,0 +1,23 @@
>>+/* SPDX-License-Identifier: MIT */
>>+/*
>>+ * Copyright © 2023 Intel Corporation
>>+ */
>>+
>>+#ifndef _XE_GT_CCS_MODE_H_
>>+#define _XE_GT_CCS_MODE_H_
>>+
>>+#include "xe_device_types.h"
>>+#include "xe_gt.h"
>>+#include "xe_gt_types.h"
>>+#include "xe_platform_types.h"
>
>why do you need all these headers?
>

left over from a previous design, will remove.

Niranjana

>Lucas De Marchi
