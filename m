Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A712C88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 04:52:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60AD010E269;
	Wed, 16 Sep 2026 04:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ncdG8Mfa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B87E10E1A6;
 Wed, 16 Sep 2026 04:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789534321; x=1821070321;
 h=date:from:to:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DQJUwGtxqDFCwBCpXKHdHKWcTKo02w2d7r8H83RuD0Q=;
 b=ncdG8Mfartb5zqaLgHe5z20OJZ7JY574mUJx1gLdV95a3BChf0wB6gVr
 tstmgfjLj66S8WCux/V8Le0fwQQ15YiQrlX32uSd1a9z7i7kd19AJuTmJ
 s6rzmX02OuinAF+QcKojZ+OCHsghu+yNXLi0kHun8M2RNErQa658asTGl
 Fn0GVRrv/AH+pLDRYIxbbpwGs9dKB9UD70IDVnKcAfSmbTAnkQMJm+ZiO
 Wuv9vpWKF1N06dView3lNvpt/u29sd1lx5pBgOfrJS+TFdWAGZkMMAjzI
 bXYHV85CK7+8C/Nsyq0V5ejctIvrUYA+ikdDjgoVWdG0Vk4obYqMme7xC w==;
X-CSE-ConnectionGUID: fqpq/WUNRyW7ux6ap6Mq0Q==
X-CSE-MsgGUID: 7G8rnRJ+Qd+B8sgMBDvAbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93730422"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="93730422"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 21:51:49 -0700
X-CSE-ConnectionGUID: 6TF5WNUxT4SM771LH/xjRQ==
X-CSE-MsgGUID: R5a3SXZRTLKVB/2vTn2dfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="298282952"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 21:51:49 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 21:51:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 21:51:48 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 21:51:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5txGmpXeDBRHOz0zKqhvuhQbJxro2WssRjMmv/1jKTjJltaIGtXoXSoAPhdb0DWYOiFN0cSQJhgo0/J436YgK7szjruW8mb71++4f/GMVJr5terkBZcYl8xnl67Xer3EDRRjB5D/b6FHdCsH1fZk5MU9bBKXrRibItUTYT8k3TBvI8X79fSnqLdzWhan87ivjxOb/dn2Fu2UUtd+sbcVv6Z8G0GECiIWElEW7rHBZzrV1IRsDeZN5T5Bt3IhGTm87wkgawuaGsTQtwiprivHA80E3tkawBSuxN2jnwsjZ4uVOkybF8tVhoowhoztoSar1M+tYCHfHvZsfERTae+HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHScSVLuQdf/5ZeEJbK3DFWlypF2HpR1oYXKsK8gvaY=;
 b=wyU95AYeZbFyBsNL2WEdCuLSg4a0G7JJ9rYiKYuCuBtTvED7I0prlPY1DA91b7+yRhTY88uUHYaKd4qvdA+uvDPkAk2xVtFRmLd3Jvv0EaRaqyBPID42v6pyJ6/OriKH1UrlUh09j6oOh5lvtfy0zIOqTiZbuKRjAbdKL8kS7c9Px86SgYIxkEAKznt5T4lN2eHdxyZI3JCA41/kawBCr9XZTDwlkdpkG1IwrKqEMh2Gl2Ry3GnBLaBqa8D3LeL9DkM5vc+HWNYh1cMiE0q18qvfbAnc9h8Z2FHa580VJ+Iwy1Fm4fXNgMPidlTYwV46pZlLMY3N9T0YGOxotdVQFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by PH7PR11MB6377.namprd11.prod.outlook.com (2603:10b6:510:1fb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 04:51:44 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 04:51:43 +0000
Date: Wed, 16 Sep 2026 07:51:38 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/dp: use EXPORT_SYMBOL_IF_KUNIT() for kunit
 helpers
Message-ID: <aqogWoTeD5hCQgXq@ideak-desk.lan>
References: <20260915160620.779372-1-jani.nikula@intel.com>
 <aqmS6M-FARktEMow@ideak-desk.lan>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqmS6M-FARktEMow@ideak-desk.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-ClientProxiedBy: GVZP280CA0036.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:26f::13) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|PH7PR11MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: b59ce595-1ebb-4b00-2593-08df13ae3485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|11063799006|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: A9Fbq2Ij5hOxxaXy8pWe/LlY2x9msFKJUe12iJcP1wSkjmZZCYdWUaDmoFOh2vrzpdX9xbu3eazmC/cXPtvLXCR9P8D7/JUB1ZI9gKakqvaMetGfOMH88nqmiofJTeLAmVJ4FG7iAYXmCyYRjrd3AC4ObnXrXTEtfPDv8s8cE3VOSMlmm+2aC6WnywS87PWZ6V7JGjXgiT9cxTBUenoOumAhBlNxeraFnQOJGGJT5thVsfIcCFBYgdaVjfTVbvh4YBec2qGmlz4LPj0zde8x3oNZ3/vuR9sndIYult+Y/w0rcywt9C8dB91OX0eitteMUDhnJlPMKO7QWmazrObmRdXjyOdS27P99uEm3cdT3zk36utB4ok4aHCw3FPyTVnsORCS4yDsnK0evXn0Tv7ekh3TFC+dfbuItBnb6gD4FUdLfIEvmhzHYc71DFyeyc6wGcuTuyBjwib0jHHuyP8dHfpBlH0OagspsBKrr5ZqrmB5DLy4qdBYwamzDZT6VQzMN7016OPG0UTixY8PQDk3fu9+PHkWKkBALKRDgVK+fmWP3OM9Q4FWM9lKbSIaid7TuModiWvtW19eRT6aWriAUH6KNuxB7BKn1Zo9NVAXnOF50aQMPn+Huv78RN7+MHZ2OCQmp3Qv5dbGhwOZ6/DRyUTKT8o8UDCLMbiMc0qjT3E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(10067099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WzynZaQEKNqjPzwAP8nPv/0sivwQ/pA+lgvGLk0bylhlZwwCHL9HYfy03F?=
 =?iso-8859-1?Q?FmdEmkP+F8zCNce+6gFd9Mufuvg1uiUQE4FeRoPB+xClrgQBTahzX+oIno?=
 =?iso-8859-1?Q?qRhj/OHitaEPv5d7ZUMPwu7dCS/f48VQl8HlVS7MyR8KWmUIN3cjcQqLhr?=
 =?iso-8859-1?Q?3ZjxidAMFFOXzdrnbcXOEJnphdTH6VEMoSAqrgjMS0ZYsKf2NRQY/7noTi?=
 =?iso-8859-1?Q?S7XOLvakGA5RnXMDBVYyboS6Iur9b3UPQMLMW3KxVA7sS1QsJXLq1bZZvp?=
 =?iso-8859-1?Q?4J9yJm+zRW99U93K9a/hPx5u63LKhhu3IEd+WCFr99PA+Ly8/o6KTjGm69?=
 =?iso-8859-1?Q?hOrIY1Vrf0V+exFmG33pnViKvE7VpEsQZ1f+QKq4V3t0yryARQbDsYoQXu?=
 =?iso-8859-1?Q?2eO1CD9/noORdi3tVa8ZHxdZ1HSAwvsmSPM6mlL98BTEvNN482DqAYre3I?=
 =?iso-8859-1?Q?u2+KoV2Aw9c8KK+ORAF+JdpJF9Va6WQufltK0hMe0URDn0N9tISNmYeW7P?=
 =?iso-8859-1?Q?d0lMHAnbtV4YZNGmLTxoU9fyfK4jOt1BtNDVHJr8bhaIdgDl18MINiuFL1?=
 =?iso-8859-1?Q?2ZO8P7zyFq0cK2cAeTbMvBIJoOs15m46j6D+lPU6ynRktd5Sq4ldFRKCYt?=
 =?iso-8859-1?Q?a47F7XC272SD5TezTZSR3qkxI0upnq6agN96EcpvuIwnAYzDeiqU76mEQA?=
 =?iso-8859-1?Q?aIDZOZDXBTew+/H94uvRjtIIwz6Uy1kRhfwRHKlK4BKQbjebMbCxjBK9i0?=
 =?iso-8859-1?Q?5P1SOTNL+XQeAxIpl5wIW17C64RP1xyRivoGPlHG9Dka0sHpW9AZFQvLz6?=
 =?iso-8859-1?Q?SA1FU4lytnGFIMl5auoeaYrgLURIsFLeDChe7QmF62jAgHvdKhxOmv27qM?=
 =?iso-8859-1?Q?rkAep3d62vpH65ULZuTyWQOxPS7jn+Hevi/miPhbLsbKdrJ4JPB3kzAcrP?=
 =?iso-8859-1?Q?9IH1tJaE8uROUxCYIbrFjdNNq0PlFXpc980++4fSvz6H1OCbGgRwL95lmt?=
 =?iso-8859-1?Q?zV6zK/KDC6tRJFtREAl1o1dY/22GXgZ0UcPWZkcR+1KZhOciEVZQHkwqFF?=
 =?iso-8859-1?Q?v4pyGcbvnPtuDnHUCE1s6OXqc3Hnp8leZq23dfKtmIe5fs+e5xS1WxjT+8?=
 =?iso-8859-1?Q?Z7Ncb6k/27LTdbFH0B1L7flMILn7xGnnSqzGWpbPDwyTYLeVCSG8zkAFPS?=
 =?iso-8859-1?Q?JXdqXfaKwkY78sqWXrPuvT7XYBugwhT+SHTxzhjOxFZcSp6IK/g0ONWp7n?=
 =?iso-8859-1?Q?DCzLFq7aGC19ZIGEgH7AQd4ieY8cSpGk7UN0UUwWrO/RqYwSqZert826pJ?=
 =?iso-8859-1?Q?ytsccZGKWI5dcJndnF/HQR9Jp8cmIULYBqkZOUNClhWbIXXZsPFoiWfaAb?=
 =?iso-8859-1?Q?NCqSRbpvTfItAeS8PAp5F2FufQutjz7vGYIxd2CRVcsZGWUgGmq+H/V0nA?=
 =?iso-8859-1?Q?nBftHr5U1TN+UZG5BCuusWIw+M6skSEDJApB9iqtaKIgl3l6yiBOCNgOTm?=
 =?iso-8859-1?Q?o+jTblwoNN7zPYkL6myudw0PTTEWpyP74p4zC3phy67ITr5gO0rul0bnCX?=
 =?iso-8859-1?Q?oXQ3ZmBxj2tHKJecULEypWHEWeF03VLnB+qedF8SVufQLEboBEZ85tAolu?=
 =?iso-8859-1?Q?uznSgdJxNKjnkONAgm2O8EkQsRORGl1z4VyTiZMQ3wYEYHzpC7pXjT6CHH?=
 =?iso-8859-1?Q?5GyudwUfMvUENZWsBl2/NxYPMq8vf34MOHFQBBTvxbAQK3wKsn5ihpbdzW?=
 =?iso-8859-1?Q?gEYjA99uHDUj+3BIPpTqBhWA7gR40MKR4MwlsjdDMxOL5biSaJjUZp38qb?=
 =?iso-8859-1?Q?X31yyqsEaA=3D=3D?=
X-Exchange-RoutingPolicyChecked: VJIC6zXZTBOql76dEgaKUMYr/XDSd4So/QUSkJkqe2OC0Wbu3ZL/hhg9444WeDXuLJ9djHp0DiNiZdLOCm9blW692+jer1uA5o4E+/68unvnML1xatGRUXnYPyPQQ7OrON6YWljOyYvj6Wvnsud6DWVBnlRRHwCmWwc8mfVAHfvEfeMfGy5rjymNYMOMGggiS1p4eax80qXYWFyoNe43nQyDZUB/8vQZDfdR9alRREC+wpeOASNMZ98HPI4ZsInBsaDISlSOzHlNfP+iFSBNcTj3IuM9RFfutCu8KfSBfamkOLDFVbhNpl17pNI/z2MbaGuS7Tr2j/KgdSMzFIot0Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: b59ce595-1ebb-4b00-2593-08df13ae3485
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 04:51:43.8484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXcjR4FInKFpa3dAVPUf8kRyHlfQgBm+KfU234FiEW543RTCpgK9dJXUySMCvPfXtNk1DfJYm7Ih3VRPI1apwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6377
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
Reply-To: imre.deak@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 15, 2026 at 09:48:14PM +0300, Imre Deak wrote:
> On Tue, Sep 15, 2026 at 07:06:20PM +0300, Jani Nikula wrote:
> > Use EXPORT_SYMBOL_IF_KUNIT() instead of the regular EXPORT_SYMBOL() to
> > export the symbols to the kunit namespace. Otherwise, the symbols get
> > exported for all the kernel to see, and the corresponding
> > MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING") in the tests is
> > meaningless.
> 
> Yes, these symblols are only used by kunit, so no need to export them
> otherwise. Should've thought about it while typing the above
> MODULE_IMPORT_NS():
> 
> Reviewed-by: Imre Deak <imre.deak@intel.com>

Actually, the symbols are defined and exported only if KUNIT is enabled
without this patch already, as both of these are in an
IS_ENABLED(CONFIG_KUNIT) block.

> > Fixes: 2eb9982ff179 ("drm/i915/kunit: Export link training and caps funcs for testing")
> > Cc: Imre Deak <imre.deak@intel.com>
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp_link_caps.c     | 6 ++++--
> >  drivers/gpu/drm/i915/display/intel_dp_link_training.c | 4 ++--
> >  2 files changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> > index 98657aa4d3d5..abec3e2519ca 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> > @@ -3,6 +3,8 @@
> >   * Copyright © 2026 Intel Corporation
> >   */
> >  
> > +#include <kunit/visibility.h>
> > +
> >  #include <linux/bitops.h>
> >  #include <linux/debugfs.h>
> >  #include <linux/log2.h>
> > @@ -1302,14 +1304,14 @@ void intel_dp_link_caps_cleanup(struct intel_dp_link_caps *link_caps)
> >  const struct intel_dp_link_caps_test_ops i915_display_dp_link_caps_test_ops = {
> >  	INTEL_DP_LINK_CAPS_TEST_OPS_INIT
> >  };
> > -EXPORT_SYMBOL(i915_display_dp_link_caps_test_ops);
> > +EXPORT_SYMBOL_IF_KUNIT(i915_display_dp_link_caps_test_ops);
> >  
> >  #else
> >  
> >  const struct intel_dp_link_caps_test_ops intel_display_dp_link_caps_test_ops = {
> >  	INTEL_DP_LINK_CAPS_TEST_OPS_INIT
> >  };
> > -EXPORT_SYMBOL(intel_display_dp_link_caps_test_ops);
> > +EXPORT_SYMBOL_IF_KUNIT(intel_display_dp_link_caps_test_ops);
> >  
> >  #endif	/* I915 */
> >  
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > index cb92cff90614..9a692f4fdfee 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > @@ -2825,14 +2825,14 @@ void intel_dp_link_training_cleanup(struct intel_dp_link_training *link_training
> >  const struct intel_dp_link_training_test_ops i915_display_dp_link_training_test_ops = {
> >  	INTEL_DP_LINK_TRAINING_TEST_OPS_INIT
> >  };
> > -EXPORT_SYMBOL(i915_display_dp_link_training_test_ops);
> > +EXPORT_SYMBOL_IF_KUNIT(i915_display_dp_link_training_test_ops);
> >  
> >  #else
> >  
> >  const struct intel_dp_link_training_test_ops intel_display_dp_link_training_test_ops = {
> >  	INTEL_DP_LINK_TRAINING_TEST_OPS_INIT
> >  };
> > -EXPORT_SYMBOL(intel_display_dp_link_training_test_ops);
> > +EXPORT_SYMBOL_IF_KUNIT(intel_display_dp_link_training_test_ops);
> >  
> >  #endif	/* I915 */
> >  
> > -- 
> > 2.47.3
> > 
