Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC52C3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 16:39:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E8C10E2FB;
	Wed, 17 Jul 2024 16:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nRyxrsdh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F0E10E2FB
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 16:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721234377; x=1752770377;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gBA4M+oxxBPmCMIvMpfPTq5j3uzVvyv2noaKJzU7XGk=;
 b=nRyxrsdhPfp2QRQSTQwoRZHr7XssCbDSVaA3U3OXtWyemUK7nmeLHxY1
 nkn3xUycLhw7ir4EknoIl1eIkv7BOErAusBFs6F3/U89rtzMBYA7JJIMh
 kBhSb1Az8EPSF0SXucuW/YN9vsTvPmnv09ex+mJNCpDJz6O8SnzIGzG04
 X2a4ZJqJJ6MpQ/o0gU4ncHEq5U15BwDhQfe8EQSGY+X2O5PMLjeNt09KI
 oyXgrth8eiMmBW8BPRqkhCSy2bN0g+WI6YrWq4P7VAY59EMgpnuHuyarj
 r/QVWMN6RdPxbUL7H0p4iIs48psI+v0PAjcPUoHlUAX6D9CxfOtkV8evz A==;
X-CSE-ConnectionGUID: liF1r9aWS0aV8JlA3+aong==
X-CSE-MsgGUID: 0FHFNsk2S5O7g5npIdGaVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="22563892"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="22563892"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 09:39:16 -0700
X-CSE-ConnectionGUID: vPUl7Ir0T2e9AoFnRO9qdA==
X-CSE-MsgGUID: +r/JH6dpQHuLQBosvi7i4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="55597622"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 09:39:16 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 09:39:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 09:39:15 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 09:39:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+sx8EV4r3UdwnUWsNPhSRqiOKeURp0zxe3zaT8TwPsZ7qkze0HzMGa8rW3tWrR2Ymv5Nu7WgPCXaZdnp02LBd6HRxAFPsdx1E0iXFW8PI9jVd4CZcVqdQnlzDWlvHtv0V63OVJvv+XONeHVTML84XAOowDkTWYqvnHuW4mU+pyUlUv63A07ohbeLDnJBxcu+y+B6pWNdT7by+VRV1NXcC0XxwA4ilJQ1J9oEC0vvpgPrSKeZInIVXPRucvCQNgt/I6UvZeC3fPmc0ze9XAcwGZ9bCx87Bu1oE41u4A4tplUJKenUrBDfCi96Yko4VbpBy2DZoiDUxAF96hIbG6gNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jKnb2SYmGbizswYJoRH8rCG0LIx0l/V20sGGjeSPzY=;
 b=iNhrNDPFqbV0bzmOzPT0gF0D8zK8XUn8/Gc9JWWP48VrR6MOE0HPqHp9SnU+Y2tYZUcbED/JoNinoYKRxOBmcYxVA/95qigrbD33qDYqQZqPYr3jzKSrM7hEbLMEjshJSegpK/gim8hqT5kuuJYA26iGCfjiTEd5Pe++yDwJ4LEPRU6njWLMrUAXVJJoVFsowtuwhpLMu4WRktK0G9rnFHpcqj/QjaiuEgCgtMYaoSTg2KuMsFTNEMGXLRE6rNmVZIIqvWMqLD2gmxAzNaACVijhygWFqHk3//WXupTYhS+8j8Ezh+ceKIrLTujKYHHYhvGorBiPDxlHz1XuZWOdQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7590.namprd11.prod.outlook.com (2603:10b6:806:348::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Wed, 17 Jul
 2024 16:39:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.013; Wed, 17 Jul 2024
 16:39:13 +0000
Date: Wed, 17 Jul 2024 11:39:10 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper, 
 Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/xe2: Use XE_WA() check
Message-ID: <p25fk53us727rqktnpcib5bx2ptrmqqnocichdatnxzplna7y5@yzpinszsi6f7>
References: <20240716094635.3427833-1-tejas.upadhyay@intel.com>
 <cm2vbsok4yidxxslztwg2c6v6i67s6lh4trjeznzx35l5uwkty@ykgepq6ispdr>
 <SJ1PR11MB620439B3B9049981E888F9CC81A32@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB620439B3B9049981E888F9CC81A32@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0232.namprd03.prod.outlook.com
 (2603:10b6:303:b9::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7590:EE_
X-MS-Office365-Filtering-Correlation-Id: e74c5ae5-a11c-4379-09f7-08dca67efd7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w1+9Sjha0S0Q9SCqp1HPji/Fus/2y/O211/TLrzOJrqbUioH4MmZeEKdxIlI?=
 =?us-ascii?Q?O3Fkr6mXT5SGPvnaBEDXuiCOIcfWBfX0b43IIPKuSqucd+h5hOPucjUDN7vV?=
 =?us-ascii?Q?FEYVZRR8lZMVuU9smXAqmqoVGsrvtGmIkfR2AG1MtLwGy8TK6eWulFOa7PLk?=
 =?us-ascii?Q?wY03ENRpWKr4dnxTtwRrM7ypDVZgSvd4VbTtUTG/FyFs3lm8M3DB9vtF4fmt?=
 =?us-ascii?Q?43eR/JNZ4DQy322dNOF9oFG70k/1SjZNuWt43xzIcxGF0d806QD+p5YRXPOk?=
 =?us-ascii?Q?//eCrFjCNNzTCjTwb1UJo/K6wzuBI7U7hwoWFJrzvWwNwaRWlXZTaE5Bj9ps?=
 =?us-ascii?Q?9RDUl1X9sg+zjBQWO5+lVAB/WmXhkLhviUnANmQz0ol2R+U/sOhwj7rDmPMv?=
 =?us-ascii?Q?frgxYh4XfDFjV8Xe0JwBl+W74QR7FyGJWUGWrT0Tkckcvy2gq5PoDCnXVwiw?=
 =?us-ascii?Q?gQM/1HNJRUsx7NaN6kW1f9DUvb/vqOSN8z5iDPPp7ud2DNGT4WLnrAoxQbhK?=
 =?us-ascii?Q?Qc8gLkae1d8Oj/TK2bPRgfztWB5Nlgq1vSMTX6z5BDp/S0YvRG8wlumB6ZG/?=
 =?us-ascii?Q?o7aOC9quMJWY8chcsUESV3RF65z/M9HiEU/PRh5+nPWtGQyoPMoky+dYA8n5?=
 =?us-ascii?Q?f5NhjdUrwpJZaYa0UZuO9oWvP4aI6a26pOFNtGbvDXWubr0kdfAdG18YOU/6?=
 =?us-ascii?Q?Mq5FA0B6Kk6if4cMX0+n1QUxJbTXbNcp4TbYwwu9JxIEGjiXe/D7/tnhsFen?=
 =?us-ascii?Q?awRpZXfiZePOPFOWAZAqLkQdH6+R8BN6M8t9mW/+f4hRGQpmoJcJr5idUYal?=
 =?us-ascii?Q?Ko3DNeuR3M1M+DBdilB1BYqOAQCP0/T6ClCIeRCVi9UPA/Gqc5lrTgEQKbAd?=
 =?us-ascii?Q?vcdAc6NSIAgv6YnSe/7nbWhjY7Jz9xFrXF9kyxfytwkeMhQ2vgoFnEyJ/Nsl?=
 =?us-ascii?Q?ZLsSejwZdkR46HHeqrxZSUKyBU+vrwrKEDoRsr6XSo+6SIj3iBEGHQ/RRgv3?=
 =?us-ascii?Q?WPRscWvOVPMhxfIBi8jGfzmBeCnGWvQnPtwyOoqblPJdOkcZUSyEVol6Fsm4?=
 =?us-ascii?Q?VwYnjb7WGe2727P2cmuFtLFikJPk6riyIEoMXNESd1RdncRWHhtS68ejl4KK?=
 =?us-ascii?Q?zkIVg9CEPijxMZ+j3st/xrs0FWLxqU098udilovtzz4bqx8wzlpOa75i/8yM?=
 =?us-ascii?Q?Pajc4cmefbDLv2eyxQ0nw4ggbqEqWGroj8aV4IZ8CBIHzkn5BUwMjB2kcXqb?=
 =?us-ascii?Q?sgkt+6F8OwVzykEkAfkkMqXQJShXctO+u6mr1OaH4si94O8xDuWqj8PHUI8O?=
 =?us-ascii?Q?w5I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?43X9x770zHnvjyq97853OFzMfKpnzD0uAA2C+4Yf33IyuCGm52NidF1yOhDC?=
 =?us-ascii?Q?oij9q0QX/i+xVquzfEsFVVyhbED+bo5TyrwQTOfH4gzXK+9tbFqY+OQofceN?=
 =?us-ascii?Q?iPUAHmGZrT7MP/Pt/y6J/tAFTMmnX8CWCqECCLnNtfDZ21dyRkcQk4bWVUx6?=
 =?us-ascii?Q?yY6MwDh5IGmH6z6iO9AGBFFGBfv/bxu493MHCLTKq6+HgrY8Ywd5GxWiJQHy?=
 =?us-ascii?Q?fmyKHto4P08hp56eo8SAmdsbThoSF3spvtquvKMc5DMbzCP+/JPcqmxUM5f6?=
 =?us-ascii?Q?c1BJa6Awn+LBdYeOfCvIhK1pp2dXSCVbxkyZH0AdnBg0BEFl41CQZDJZuYYP?=
 =?us-ascii?Q?Vppb/crUQHIK0XXgOAHaws2oa7NnfLHd8hXR3ZWGSxg4wpQ37dI5sgZC4LtA?=
 =?us-ascii?Q?PCPk5B8AQ07aDy7Wus2OmzZ3yE4DV14t29rX/1Z3TNN3g+r0KA2KBmLeJqNl?=
 =?us-ascii?Q?kM3eJDHtvWzCOZGdFZzShbqxlK3KlsfAnLpIpV5OS7zWKt/I+5Kaz2Qoh82A?=
 =?us-ascii?Q?NRuKy3LMckZQu5vZY30MpsoqFfJ7B8zzkRaWgfW6R3w7ySO+WTNkn8s5h/dz?=
 =?us-ascii?Q?rmsqel5v3vMvvI2lTdVoj/2Xn8FQIqTB2ruqaFQJ0ismWqnVEciMkcV8C16X?=
 =?us-ascii?Q?vNZ6ch40ZHLKCFA/QGtIpMUmuDfraFriwlJfjC+Yh1MiKzqPY6PC7CyfHSsV?=
 =?us-ascii?Q?0j9Jq3xtdIjny340R7Uwn1jPxlM5Ee0qmh0tRtKL8bfygvRrwV49FydiGA4Z?=
 =?us-ascii?Q?1MZiZHBl0K4npIIaHNV2LLBeeslvkTvvGzO1iJ21WKyBJ5DnjM4Babv02Lgh?=
 =?us-ascii?Q?/2bdD+y4NUbgb/xEAUO7iyH+IyHaC4BQnpPwbdMsP8k/XHE1eO4zg1u9WtkZ?=
 =?us-ascii?Q?BGh4Eu/JrnkcZxJTEQgCWRmcRVTbRyKQN0GbksEyr3F2D3MWP1R7WAUv7Vwf?=
 =?us-ascii?Q?PaChmBQQ+wdEK4nAArK/e92vwrkR4vWI8vKit2++djw9vvoN7NSqvWt3x3iH?=
 =?us-ascii?Q?GBAr8Gnv13SjybvEJ6P1/UphWcyh2xB6swY6yLwC9UcKqqmc9LZbWNenRJVs?=
 =?us-ascii?Q?XQs5UlyIWQfwMV250tbA7f2YinTZUEmvHHddyX4MsjewfPvxbV5lTUgJeoT4?=
 =?us-ascii?Q?fnE52cy17No5X2w2URYaJJvxl/wG4WPWIrKPFzuxZUmRjY2I8j9OgCogwnyA?=
 =?us-ascii?Q?4W4RXL20iNwm5J8xsSA5rmx+asFRm6poAtyfJ+EOI+Z9g5XiWOWDCW1N61Ei?=
 =?us-ascii?Q?0g83I6QuV9ErBINHymHlc5NQNMTbhn2p/PwnQ+COZYlADNK13JMnuFGEulN3?=
 =?us-ascii?Q?c6+7yeE4qEbWi0nv8ojLjhEJUfsK3i4VUeVcbgrwn81SPaVOsmHQrGpFjxvD?=
 =?us-ascii?Q?ylHUTH/w9xwfpIy2o2F3OKxhluH+ATy0s6MyOnk+abkptoii9BXqXBc3VLKQ?=
 =?us-ascii?Q?0jiVahcJ8xLssblPP/oPdCJFgYKASnWv5TOpDBJqHs3TpDoM5FfH0c93Pa6m?=
 =?us-ascii?Q?DFAW7XZTFbZA7YMTafH4qNJzY4oGA7HfnH/JP9J9RSrCgF92REh4RKqy+JpF?=
 =?us-ascii?Q?Nu+xtSXjfmpPtxDA173tyA0qoP28HZEokDhYsfrn5DuyJOcZJXGe8/xqymcR?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e74c5ae5-a11c-4379-09f7-08dca67efd7d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 16:39:13.0495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jVWTOpBham53Dv8EgYx8vdVcl+lems56mLXWoXCH9R6HTF804aY+9oBykUKK7QBTwRKIR3tHXUU3ea/UPyO6o8Rjgk5Fr4I2pGlmLzWMDEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7590
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

On Wed, Jul 17, 2024 at 08:11:17AM GMT, Upadhyay, Tejas wrote:
>
>
>> -----Original Message-----
>> From: De Marchi, Lucas <lucas.demarchi@intel.com>
>> Sent: Tuesday, July 16, 2024 8:52 PM
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
>> Cc: intel-xe@lists.freedesktop.org; Roper, Matthew D
>> <matthew.d.roper@intel.com>
>> Subject: Re: [PATCH] drm/xe/xe2: Use XE_WA() check
>>
>> On Tue, Jul 16, 2024 at 03:16:35PM GMT, Tejas Upadhyay wrote:
>> >Use XE_WA as used elsewhere.
>> >
>> >Fixes: 86c5b70a9c0c ("drm/xe/xe2: Add Wa_15015404425")
>> >Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> >---
>> > drivers/gpu/drm/xe/xe_mmio.c       | 5 ++++-
>> > drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
>> > 2 files changed, 5 insertions(+), 1 deletion(-)
>> >
>> >diff --git a/drivers/gpu/drm/xe/xe_mmio.c
>> >b/drivers/gpu/drm/xe/xe_mmio.c index ea3c37d3e13f..1138934cf969
>> 100644
>> >--- a/drivers/gpu/drm/xe/xe_mmio.c
>> >+++ b/drivers/gpu/drm/xe/xe_mmio.c
>> >@@ -13,6 +13,8 @@
>> > #include <drm/drm_managed.h>
>> > #include <drm/drm_print.h>
>> >
>> >+#include <generated/xe_wa_oob.h>
>> >+
>> > #include "regs/xe_bars.h"
>> > #include "regs/xe_regs.h"
>> > #include "xe_device.h"
>> >@@ -22,6 +24,7 @@
>> > #include "xe_macros.h"
>> > #include "xe_sriov.h"
>> > #include "xe_trace.h"
>> >+#include "xe_wa.h"
>> >
>> > static void tiles_fini(void *arg)
>> > {
>> >@@ -127,7 +130,7 @@ static void mmio_flush_pending_writes(struct xe_gt
>> *gt)
>> > 	struct xe_tile *tile = gt_to_tile(gt);
>> > 	int i;
>> >
>> >-	if (tile->xe->info.platform != XE_LUNARLAKE)
>> >+	if (!XE_WA(gt, 15015404425))
>>
>> I'm not sure we can actually call it that early as we have the following call
>> chain on init:
>>
>> xe_device_probe_early()
>>    xe_mmio_init()
>> ...
>> xe_device_probe()
>>    xe_sriov_init()
>>    xe_mmio_probe_tiles() <<<<
>>    xe_gt_init_early()
>>      xe_wa_process_oob()
>>
>> xe_mmio_probe_tiles() does call xe_mmio_read64_2x32() on
>> xe_root_mmio_gt(). From a quick grep I'm not sure there are other cases.
>> Can you rebase on https://patchwork.freedesktop.org/series/136146/
>> to make sure the assert doesn't trigger?
>>
>> So... although xe_wa_process_oob() is called very early on gt init, there are
>> still cases in which it may not be safe. At least for that mtcfg reg read, I think
>> it's odd to call xe_mmio_* before actually setting up the mmio regs per tile.
>>
>> And just after writting the above I noticed the
>>
>> 	if (tile_count == 1)
>> 		goto add_mmio_ext;
>>
>> uggh, that neeeds to be properly refactored, although doesn't invalidate the
>> reasoning above.
>
>I got this, better to have check for future as well. With rebase do we want to get your patch merged first and then mine. Or you want me to send both as 1 series after rebase?

I did that patch because I was not sure if it was fine to call XE_WA()
where you're calling. So first thing is to rebase this patch on top of
that check and test to make sure it's safe. If it's safe, then we can
merge both, otherwise I think we need to postpone it until we figure out
a way to move the oob wa initialization earlier.

Lucas De Marchi

>
>Thanks,
>Tejas
>>
>> Lucas De Marchi
>>
>> > 		return;
>> >
>> > 	/* 4 dummy writes */
>> >diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> >b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> >index 08f7336881e3..3d0e0779a833 100644
>> >--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> >+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> >@@ -30,3 +30,4 @@
>> > 22019338487	MEDIA_VERSION(2000)
>> > 		GRAPHICS_VERSION(2001)
>> > 16023588340	GRAPHICS_VERSION(2001)
>> >+15015404425	GRAPHICS_VERSION(2004)
>> >--
>> >2.25.1
>> >
