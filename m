Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E0CCCFA03
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 17:07:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF2A10E1FC;
	Mon,  3 Nov 2025 17:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vdcr9gAp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC7410E1FC
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 17:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762189649; x=1793725649;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=owOEqAw+vYEJ+L03hvDeLC8ueaojZwqXB8OGvzWTlzg=;
 b=Vdcr9gApqKqHiluATbzTF5tgQKO3VLzVeuG4aIFdquFwrkJQh6adc655
 IRrWbhRlf4WkN1Kgn03TVhvnAEGyjugXDRfgNxeOHsZ5LEZYB5OlBh100
 J0QPqbHypIFWd3yhM3G/2YIwHpap0/5SW8vsAHC0bzUfvBzeMIOBr3r8Z
 RgjptCBQgx8+cELQS0Rnn43avgg16gsZJuV84xCDpJ+qJ1NneNS1ZtENW
 92azqQUOoSt38YF1b8Rmx96nxovr1CkY1/6yh9S7wQuGkvEk5ECM2s3CV
 7Hmusuu8rkJOq+R7OtFUTMNr8a7xmiWiThBp+6i94+45bzBpI4eo7a2Ec w==;
X-CSE-ConnectionGUID: DZ9ztTSSTUmaBeo5fgp9Sw==
X-CSE-MsgGUID: UaJRvuTURC6huLNiaqx3iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="51841012"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="51841012"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 09:07:29 -0800
X-CSE-ConnectionGUID: FJQ1U5rjRqmVSlByeXM6Ow==
X-CSE-MsgGUID: ckPduJTJTX6Y7ru+pukyhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="191240415"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 09:07:29 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 09:07:28 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 09:07:28 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.28) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 09:07:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PlBZu1OJxOrWVjHK+7VJrxUHCMrKTYspsXmpU/VwAGDGwVUAizvFsx8QNDnejcsG+l9wza/YTxYgn0Bjg3XyUwzHSXKRTEu+CM0yd4evfzdbdM1i/VabbLG059/sLaIOPolqtG8I+mV5BVlshwRbF4pPMsCeB9RXuSJB1+/HDOLXWldf/7H61VISzOJ3qSabmcXzUtT3YjO3CBxnzcn3K2ryzIX523PP/wygSsZ6jOr3m8ChCcSwUZmj7XfOfEm4cu3CVBb5a7TzdJyAxDGeFr6QYsWRBFmLuOcROYmTJmaeu9o+Bcmxi3gH6RNeIGy/WT7Wq4Q5I1MQWo0okWSLbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2yA71vuLd40oirFAmkOGdcvVQZDk3gmEJM5tz2x0U0=;
 b=Yeo9/2ZPUaLdTg49lhqS/LS1AxZKG5Y4WEv3qQXGWEzX4sBJqFll4FgzAdRtYfvbGiD5NvYd2ePJxP1MmwAKiNPj2E85B3eBmd9HFljbvDpiUVzZpPZnY6CMiOKW1xTgZJM4Uoi8P/RWHM1YcJlemuiKCl9vzlm/Ecw32gXP0QNLZooskaaRSgnodDdLBR6y9nDT9S/bXo5xuJIHkmk0j7GfkhzdxvadFY2Wv1dcFQjUFpW7MEgHxt5HlM4aiv9KcAY+WcZhl+0L9nLj8nzOXpGFpznv7dGjqPESyXeytZt8EF1HJddEqPrcB8U8HLwtTUxlU0S/+ID8Igp/6OnQ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4997.namprd11.prod.outlook.com (2603:10b6:510:31::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Mon, 3 Nov
 2025 17:07:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 17:07:25 +0000
Date: Mon, 3 Nov 2025 09:07:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>
Subject: Re: [PATCH v4 2/7] drm/xe: Implement xe_pagefault_init
Message-ID: <aQjhS8hq4FQRBWre@lstrano-desk.jf.intel.com>
References: <20251031165416.2871503-1-matthew.brost@intel.com>
 <20251031165416.2871503-3-matthew.brost@intel.com>
 <aQisqd3ftphQdkjY@fdugast-desk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQisqd3ftphQdkjY@fdugast-desk>
X-ClientProxiedBy: BY5PR20CA0018.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4997:EE_
X-MS-Office365-Filtering-Correlation-Id: 86eb9a00-e325-4ea4-1c1d-08de1afb7628
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?I0XWriuUxntG46YbhzSTX3czqduU9f+eprWcJYf7V9rR9zL0/T//poW4Dn?=
 =?iso-8859-1?Q?prKNeMjx+Dv9nL74fyxTJz1DvCqzymksVx8GwccPyn4P5D7aJ3k5CCB9NR?=
 =?iso-8859-1?Q?WuIJ0ct3wMJvkCHJwGPWkmhZpvCb86+rj8IOHUyJkmGt9cf5Qe8FUgEDWH?=
 =?iso-8859-1?Q?rWWfODWkwgDAaKQoa/tdspJDaMSOGkllI51bmrQJQpBVOPO5Ke3xtok+/g?=
 =?iso-8859-1?Q?25o/Lsw4hPm7o1M7QN+N65PvielASDjoRHYoYMBYWzXeGGTcXTi7hSJCsJ?=
 =?iso-8859-1?Q?0gPaa66bl0rH+Xk9Y6Y/D+RtHBTW50aRMkIF46kGe1y0upQLI4lQ094/AT?=
 =?iso-8859-1?Q?5khx0yX8cTxsjCFqWp2j0wJoNw/iNuVlkwLQ0SXj9/WP7gDGv8j4h5zrWU?=
 =?iso-8859-1?Q?9QVV6hgLch0Sqy4xjbjxjVdNS8F8T97kku0lDaOhIepYSMiZkKtYRfcR8X?=
 =?iso-8859-1?Q?cPxjHUoAp7XMAG42hn9bJbUbAG+WuJUKY3w+fICtMU+PS18YkD2+ypgJfv?=
 =?iso-8859-1?Q?FGYj0C9pnuLmDy0AbTdRoGbtJUyPt0kCdesZY7TMaxAtQC7gXyuGKSTaLz?=
 =?iso-8859-1?Q?/4J/xl5qor+HLG6NZ8Nbuzdi5f4jsxrvrkiXaIm8Fgu8sCHHWsT54zDw7K?=
 =?iso-8859-1?Q?QeLKTK06zWm26Vi1fBrvcPyubSpzZ3gDBvAB4isLW5/3jKXdKdX1+1uwnX?=
 =?iso-8859-1?Q?EVQINiit4Fgrw2dnlIyTKwVWVxnowKyJEhSKhPAR8zQMrVnyocVE0VRqWP?=
 =?iso-8859-1?Q?hyFWfEXcVDTtNYe2zI9Y7sHRHxhvrFIHK905LZYDglomOXOPzfTUdl/N/3?=
 =?iso-8859-1?Q?c3XeevbA0LplDdM+2IBzQm9f1GVSDhb7M+Q3RaG0sVCLY5Jmkeu0UoqKOm?=
 =?iso-8859-1?Q?my7J1RhaYv2XLFuHf7bXD/0c+RpCl37u9a/gVHrgad4+cYhDY8ykjg3qDq?=
 =?iso-8859-1?Q?MlFaYebzWDgfaZxBPtIavXNUlW/zRwT8AHHvbPWnidcElXGikX07OPDuiQ?=
 =?iso-8859-1?Q?LWvWf1t6c7Hbcjktu2y7lfOHqueLsAFuBmSXBPa7MRSGCnyTeQD0hyy40j?=
 =?iso-8859-1?Q?JfVWT/Tnw0RBv6SqF6YIPbmS33b0sRuFPz9lQMQcC0GoDd0JW0sGJWX803?=
 =?iso-8859-1?Q?l+bpmnKfdzY276VcYKA3CZgzMqOt+5xRePgnbtwGn5eOevnavFuL6apraw?=
 =?iso-8859-1?Q?qlqhBEG1uPvqFVDID5hSD1p/1RkQ32PiDTTB3I7pI7vSgwPpQSaW42f/sA?=
 =?iso-8859-1?Q?735Wn1k3DnqtLoXyKmjB4SzhUucmqwLXepwlG3T7R5qvYTV7C1ckJyv9Wr?=
 =?iso-8859-1?Q?wpCQA93+grbwle25mc/blmb1UvXqj85eFvySXhysZT6IzuSVyWjPNmkhS0?=
 =?iso-8859-1?Q?ul7KgSCdXMGlLzRCe1zgPYi5p7VnrdhAq8N1flnECN/JPdNt8xY0suapah?=
 =?iso-8859-1?Q?QUQQEjBv4iLQhEq2pF9gpSMS5+m0irPn/O7kgg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4KpZoCwHydCG/QvgIIETXOIZ1r7Liu54cXlcZRhthdPF2klQAzTRbmA+zh?=
 =?iso-8859-1?Q?WmEZXSoty1Pd5niQdJaELSPoJLYAE5xCofp0ckN4/phuDZhZXYr853PlhF?=
 =?iso-8859-1?Q?QcksnUdP0gbyS1LzlzZiSbn2RZanyjU8RPONBkDXKQwJsBJye8YjBxxhaI?=
 =?iso-8859-1?Q?EapERFlIkrfUnAcE6My7cT6wnMgeFMdxg9yeWMfiigYIw/ZHpUEBt7IuJr?=
 =?iso-8859-1?Q?94S8zuEQ/nZ5ziJiFVGLstx7SwNSdMG077jtI+8w6ExDAjs/28v+Sn7g6a?=
 =?iso-8859-1?Q?nmg/zlPSQJreUGbSRHlDDuRY++yBjhdPhCTpiZ3VgqrwskBdmACfJVcyOK?=
 =?iso-8859-1?Q?XZXiXebpOraR8cS6Sp6buTzXJ72yFTcAAAlAFPcOPxs9+N/s0dpuBh6cma?=
 =?iso-8859-1?Q?5sq0kB9+u+df8XAScxN5ABQ72BnbmwLgPMd0PNIjIaq6xmoCKEY316pV3E?=
 =?iso-8859-1?Q?4ISVhGt9dWg35Oy+HUm6MV/CaJHSHDFMDRomQDdEQIuNE/ksV2iztUJkAD?=
 =?iso-8859-1?Q?736IQE9Jk5PQi1vikOhSQ7rjDcdjJ16JLvL5VdvVRrNgJbwSc6vKVPi/pO?=
 =?iso-8859-1?Q?H+T2mMM2TGqq/Mj4gsIHePscoHXQKILidVUVkpn6SXkIsAYuyT4pci50Lv?=
 =?iso-8859-1?Q?jJyXNF20Z+NFbL4W9bIdx4GFZTr4lb82yJC90I/0KdilBDxo1sEXKHN5ys?=
 =?iso-8859-1?Q?q13hFoC62csj3sRLCy+cG5v2uAq9KVsdAFG/ecTuVVNUSumcQ4MX7sDL1/?=
 =?iso-8859-1?Q?6wO58mktTcYagb2v6oFVYUztgDI5F/bbF+UCqsthXVhPsES2NlINUI4VV3?=
 =?iso-8859-1?Q?gSv2puNImb9Z5zL718RXjojb7UfUKqy+BZnWW1UAT2ald/4Pp+zmilYnO3?=
 =?iso-8859-1?Q?znSfae5GEG8328COosm2abDyup62XgsASLcES5Ka77ShS/sfg02xOLGQkw?=
 =?iso-8859-1?Q?xAumyMQ2SIS9gC00FeaqGvSzgsA7p/fIWk7Ki0eKw9fMCd1p2dD5AlrzVW?=
 =?iso-8859-1?Q?XgGXfbkAyd+KdtmQJ3Q0Fj7C15xG185DFykHx9je05huw4xnmyknHrfXmc?=
 =?iso-8859-1?Q?BToY1+z68qs04eYVlUvFK0cKFlY6IpBg+ggARYFnP9UsaXbT30lOw6pr6R?=
 =?iso-8859-1?Q?Ixr4oKEE+GGY0ANJtfbO9oKtt6T3Pt/iv7Qe0JSS0xfA1eX6cmzpQFb1AG?=
 =?iso-8859-1?Q?OTTVf/i74B8rZ9hszpZhfLNVhFRzsD4yNba6LGe5/yBVPgZqFHpLTQpDFO?=
 =?iso-8859-1?Q?xBCpRUZW4mAsXJGJOTb5orcgnpxAKZMcGOOBblGG/k8VtTyk8ANOlFWY3U?=
 =?iso-8859-1?Q?hXH5n8PRXbbMUHehyf50yX+g9DCQ7Jtj/XBxs0QK/ejGPpk4jXulV2iyQv?=
 =?iso-8859-1?Q?jqpv6pZFk1mBHrGHdJi+YChtAVi0U9qEkZYjO133HQNp8TzFwKdMs+7w98?=
 =?iso-8859-1?Q?PTFk3lpJG2ih7ZPTInjdLDv3r3bbuZ/zW+2cyh104GSDgMJ8zPvKrXK8WE?=
 =?iso-8859-1?Q?u8telIFfd4L/sgU+yfdOk4DBv3po43fgONGxRmqbFwx14Zh0WM6COseqKn?=
 =?iso-8859-1?Q?oA+4/cW69te6z3gvp2j9BkxW1iAAKNK76Ls1HIGGfZA/IYTOaos+x2s4b2?=
 =?iso-8859-1?Q?N1uScECuDISu606cW5MsJlOxHgUgAtq6UOMzNjqHzdqX4CV5g8CRSqYA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86eb9a00-e325-4ea4-1c1d-08de1afb7628
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 17:07:25.6338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wyE9seOHvZfpjq2juYZ1tCE8adnugBYJcEgUAP3hOcdImO/Bhp38U+hblYWYHeDL/sGHMDW3CeZ9ggjJyNcH/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4997
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

On Mon, Nov 03, 2025 at 02:22:49PM +0100, Francois Dugast wrote:
> On Fri, Oct 31, 2025 at 09:54:11AM -0700, Matthew Brost wrote:
> > Create pagefault queues and initialize them.
> > 
> > v2:
> >  - Fix kernel doc + add comment for number PF queue (Francois)
> > v4:
> >  - Move init after GT init (CI, Francois)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c       |  5 ++
> >  drivers/gpu/drm/xe/xe_device_types.h | 11 ++++
> >  drivers/gpu/drm/xe/xe_pagefault.c    | 93 +++++++++++++++++++++++++++-
> >  3 files changed, 107 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 47f5391ad8e9..4238ba28fac7 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -52,6 +52,7 @@
> >  #include "xe_nvm.h"
> >  #include "xe_oa.h"
> >  #include "xe_observation.h"
> > +#include "xe_pagefault.h"
> >  #include "xe_pat.h"
> >  #include "xe_pcode.h"
> >  #include "xe_pm.h"
> > @@ -896,6 +897,10 @@ int xe_device_probe(struct xe_device *xe)
> >  			return err;
> >  	}
> >  
> > +	err = xe_pagefault_init(xe);
> > +	if (err)
> > +		return err;
> > +
> >  	if (xe->tiles->media_gt &&
> >  	    XE_GT_WA(xe->tiles->media_gt, 15015404425_disable))
> >  		XE_DEVICE_WA_DISABLE(xe, 15015404425);
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index af0ce275b032..7baf15f51575 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -18,6 +18,7 @@
> >  #include "xe_lmtt_types.h"
> >  #include "xe_memirq_types.h"
> >  #include "xe_oa_types.h"
> > +#include "xe_pagefault_types.h"
> >  #include "xe_platform_types.h"
> >  #include "xe_pmu_types.h"
> >  #include "xe_pt_types.h"
> > @@ -418,6 +419,16 @@ struct xe_device {
> >  		u32 next_asid;
> >  		/** @usm.lock: protects UM state */
> >  		struct rw_semaphore lock;
> > +		/** @usm.pf_wq: page fault work queue, unbound, high priority */
> > +		struct workqueue_struct *pf_wq;
> > +		/*
> > +		 * We pick 4 here because, in the current implementation, it
> > +		 * yields the best bandwidth utilization of the kernel paging
> > +		 * engine.
> > +		 */
> > +#define XE_PAGEFAULT_QUEUE_COUNT	4
> > +		/** @usm.pf_queue: Page fault queues */
> > +		struct xe_pagefault_queue pf_queue[XE_PAGEFAULT_QUEUE_COUNT];
> >  	} usm;
> >  
> >  	/** @pinned: pinned BO state */
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> > index d509a80cb1f3..43b26e7d090a 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -3,6 +3,10 @@
> >   * Copyright © 2025 Intel Corporation
> >   */
> >  
> > +#include <drm/drm_managed.h>
> > +
> > +#include "xe_device.h"
> > +#include "xe_gt_types.h"
> >  #include "xe_pagefault.h"
> >  #include "xe_pagefault_types.h"
> >  
> > @@ -21,6 +25,71 @@
> >   * xe_pagefault.c implements the consumer layer.
> >   */
> >  
> > +static int xe_pagefault_entry_size(void)
> > +{
> > +	return roundup_pow_of_two(sizeof(struct xe_pagefault));
> 
> It seems this is missing:
> https://patchwork.freedesktop.org/patch/667318/?series=152565&rev=1#comment_1230914
> 

Ah, yes. Will add:

/*
 * Power of two alignment is not a hardware requirement, rather a
 * software restriction which makes the math for page fault queue
 * management simplier.
 */

> With that:
> 	Reviewed-by: Francois Dugast <francois.dugast@intel.com>

Thanks - Matt

> 
> > +}
> > +
> > +static void xe_pagefault_queue_work(struct work_struct *w)
> > +{
> > +	/* TODO: Implement */
> > +}
> > +
> > +static int xe_pagefault_queue_init(struct xe_device *xe,
> > +				   struct xe_pagefault_queue *pf_queue)
> > +{
> > +	struct xe_gt *gt;
> > +	int total_num_eus = 0;
> > +	u8 id;
> > +
> > +	for_each_gt(gt, xe, id) {
> > +		xe_dss_mask_t all_dss;
> > +		int num_dss, num_eus;
> > +
> > +		bitmap_or(all_dss, gt->fuse_topo.g_dss_mask,
> > +			  gt->fuse_topo.c_dss_mask, XE_MAX_DSS_FUSE_BITS);
> > +
> > +		num_dss = bitmap_weight(all_dss, XE_MAX_DSS_FUSE_BITS);
> > +		num_eus = bitmap_weight(gt->fuse_topo.eu_mask_per_dss,
> > +					XE_MAX_EU_FUSE_BITS) * num_dss;
> > +
> > +		total_num_eus += num_eus;
> > +	}
> > +
> > +	xe_assert(xe, total_num_eus);
> > +
> > +	/*
> > +	 * user can issue separate page faults per EU and per CS
> > +	 *
> > +	 * XXX: Multiplier required as compute UMD are getting PF queue errors
> > +	 * without it. Follow on why this multiplier is required.
> > +	 */
> > +#define PF_MULTIPLIER	8
> > +	pf_queue->size = (total_num_eus + XE_NUM_HW_ENGINES) *
> > +		xe_pagefault_entry_size() * PF_MULTIPLIER;
> > +	pf_queue->size = roundup_pow_of_two(pf_queue->size);
> > +#undef PF_MULTIPLIER
> > +
> > +	drm_dbg(&xe->drm, "xe_pagefault_entry_size=%d, total_num_eus=%d, pf_queue->size=%u",
> > +		xe_pagefault_entry_size(), total_num_eus, pf_queue->size);
> > +
> > +	spin_lock_init(&pf_queue->lock);
> > +	INIT_WORK(&pf_queue->worker, xe_pagefault_queue_work);
> > +
> > +	pf_queue->data = drmm_kzalloc(&xe->drm, pf_queue->size, GFP_KERNEL);
> > +	if (!pf_queue->data)
> > +		return -ENOMEM;
> > +
> > +	return 0;
> > +}
> > +
> > +static void xe_pagefault_fini(void *arg)
> > +{
> > +	struct xe_device *xe = arg;
> > +
> > +	destroy_workqueue(xe->usm.pf_wq);
> > +}
> > +
> >  /**
> >   * xe_pagefault_init() - Page fault init
> >   * @xe: xe device instance
> > @@ -31,8 +100,28 @@
> >   */
> >  int xe_pagefault_init(struct xe_device *xe)
> >  {
> > -	/* TODO - implement */
> > -	return 0;
> > +	int err, i;
> > +
> > +	if (!xe->info.has_usm)
> > +		return 0;
> > +
> > +	xe->usm.pf_wq = alloc_workqueue("xe_page_fault_work_queue",
> > +					WQ_UNBOUND | WQ_HIGHPRI,
> > +					XE_PAGEFAULT_QUEUE_COUNT);
> > +	if (!xe->usm.pf_wq)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i) {
> > +		err = xe_pagefault_queue_init(xe, xe->usm.pf_queue + i);
> > +		if (err)
> > +			goto err_out;
> > +	}
> > +
> > +	return devm_add_action_or_reset(xe->drm.dev, xe_pagefault_fini, xe);
> > +
> > +err_out:
> > +	destroy_workqueue(xe->usm.pf_wq);
> > +	return err;
> >  }
> >  
> >  /**
> > -- 
> > 2.34.1
> > 
