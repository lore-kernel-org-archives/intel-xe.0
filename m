Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7F1C677C4
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 22:04:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA4610E5BF;
	Tue, 10 Jun 2025 22:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l1BvIRLE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB53810E5D6
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 22:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749593073; x=1781129073;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=av/VXMfKXA/bZ/la8H4a+qSpqvHWwZzggGwEQu3FpuE=;
 b=l1BvIRLE/0x15ITpvo2wX4MWDELgHop51Y1y9TVTcWcgB3zAoEOCS7/J
 iTP3VsVB/14/Guugh2RZmE9e8n4d4Q/bZjHKlhH9c97YvqIjwgt+LpOeL
 tMaPkeNRRwlkSMwkVqI+JXqwuIInCQ8jMqxLMGnnT3V5gAW/jfAGS23Z1
 41yIuevxa/qJiNYs0D4EMWKEr+c7o216C/ZKVIMnz04ZjOs1ahPfGAI16
 zmSiCvaZpNkfTGFW9GXJ6r5qtVm5BI1ML9CdKecxf5pVcSFrpHz107Li7
 BrgzV4xVgcJWXVqjqHizZZzt2CKIrbV490mWoMNMBjuQkAZIi/LVO7oit g==;
X-CSE-ConnectionGUID: npY5c/AOStOoKjZugK6O/A==
X-CSE-MsgGUID: kMjjb9nTTi+2XgJ27ds4yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51822246"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; d="scan'208";a="51822246"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 15:04:32 -0700
X-CSE-ConnectionGUID: A3JKFbwxSAmmfW5e17CqJA==
X-CSE-MsgGUID: DjsY2O+oSgKBk+piSgVqtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; d="scan'208";a="177878387"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 15:04:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 15:04:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 15:04:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.89)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 15:04:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AnFk6yVQYJ9jZ56+v6+vJK6h4N01d0s3ynQmz4oVhsZZFGzTeZ4pA21Za1H/xD4ire0nFduj/+U2KgLHmC1GU+/nd+nACKPBfpGYM5KvWxyDe1FCg/H6cdGuQidrEYe/ugCmWuChsfWbbJFmyMd5+E1QDdtOfqqCGVlhVQMzKI7uEn0u8PKVOU33L0tOxA+U/B5hVmrebVw0dkWBxF38y/hBCIDxdCTTHso8jOwIETCk/BF8ZE77gRBVcH5SjWnN9+PBGw9RZwyQSrZ5L57ZBobQ1ZOxp8+0neKcbfiE4lPzyODKO1kJMYCYER+zgsAhkmv0kdAZhw3cNkevHZFLrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udpwYgSThzHAs1pjntqIYRRsOi76ylQeygMGA5i3jXI=;
 b=wdLL3dR6LUEYP6jzM9mn9QlDSPqbiS04tXJIsmIV5YTD/6tIEow0Ggd9bE1D83Oxzvxs28CfDjqq/e54zZEm8rzs59locoeipNtrMP9O4x9Mx3D0LTCx5j6KgbKexW2UHWGWa5TELYvAzR5C8BtyyQv+PJUsqAc7+cwhgP1gAP6+Mj0n5DU+2cHOkRBTQQy0fTW67iDL9C9imAo/vn/YJ9f1ClcuC/qHyZ3cVjKLL10tgPaXI5viJcGuREa57qDw6B55DKrRSmzeIB9gLwjZfGLfP2lNz2an0c5zVC7m5PiwcNbotk2FgpRycFs76zH6cLQWEOoYt1iR32qo5nKGCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB8501.namprd11.prod.outlook.com (2603:10b6:510:308::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Tue, 10 Jun
 2025 22:04:29 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 22:04:28 +0000
Date: Tue, 10 Jun 2025 15:04:25 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Levi, Ilia" <ilia.levi@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <koby.elbaz@intel.com>, <konstantin.sinyuk@intel.com>,
 <yaron.avizrat@intel.com>, <moti.haimovski@intel.com>,
 <didi.freiman@intel.com>, <shuicheng.lin@intel.com>
Subject: Re: [PATCH v2] drm/xe: Support for mmap-ing mmio regions
Message-ID: <20250610220425.GP6239@mdroper-desk1.amr.corp.intel.com>
References: <20250609095938.16782-1-ilia.levi@intel.com>
 <aEcByyaKe82P91RT@lstrano-desk.jf.intel.com>
 <20250609215820.GR5080@mdroper-desk1.amr.corp.intel.com>
 <f6fa6332-6cab-49d7-98e8-e60ab3121699@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f6fa6332-6cab-49d7-98e8-e60ab3121699@intel.com>
X-ClientProxiedBy: SJ0PR03CA0044.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB8501:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c488a55-7e67-4521-03ce-08dda86ac505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JJqdgIUnlNL34KXsR+twOij7vXdDM4XK5FJDC46q7b3ItTou4yB8qO+ecr5g?=
 =?us-ascii?Q?ovjQiROfobCvRtgaiwsMeNX5qpsnRFJeaNLPV28ATUg0guIH38D94BZHJPJq?=
 =?us-ascii?Q?P+L2qVUdVO2+c3d4qC3ahhFWXJ7A6E2DQf0tsPLf5ykaOb8h9zWSnYrZJ7VQ?=
 =?us-ascii?Q?4JAvHC0N4321h3q2MoYAwXBg0vEVpZFcD5q2pl9uhuFNo7kytPLkLR+C+yJh?=
 =?us-ascii?Q?dPomNaZY7Zg4sa3B7LmBYxc0vDnHrJPYfTrrdbXjJ9IAJrErgZhHAViepzbn?=
 =?us-ascii?Q?p6fnd8+jA9Bp9UPrXtFnmX7wY6OfTppXRXz/6XKHN4qlJE3aW+6P0jt5dxon?=
 =?us-ascii?Q?L15Et7RvAJzEOiLrEmLOzDOhMMCQrat8oMVdrrI7hDf3OQl3J+HDpIN9KbxU?=
 =?us-ascii?Q?jydAfb0JYhfLpOjxdhc6RYkfB2L/fN0la8Nf2Lo/7bgHxBFwfLir3rB953B9?=
 =?us-ascii?Q?iOhHMS9AqxzVG+OzgbmWIcqBWu1RKNG/NMY6twlFGxDGX1aXiblpW5/T6ZsJ?=
 =?us-ascii?Q?sbBs70Vyb0oWZ/bckyLiIxHhG5H1uBlrgmXzFhUUNTajfRmt5Ny6zlq8EeRP?=
 =?us-ascii?Q?vKzoAgbVYZWAt7XI8KrAt+60Ts+RefPvq1f4EGckNXo0/RY+1ti8C8k3G1Ik?=
 =?us-ascii?Q?JemfSQ2/HeQuBInC+Ln3NOesiF1HmhqS18n8hvuj63wWNftiEp5A53x2Hw2r?=
 =?us-ascii?Q?JPjaKWLuGp4Y5aeyks/7mdqf8eQJ8TcCqDYAdyAVl0ZogLQ0UTjkALiPuUYf?=
 =?us-ascii?Q?axiqc8SbZ7hqLzYSWnsVghqHZUbdxF3hllTSJiYXeUFvSweXlDa8+hEwd5N8?=
 =?us-ascii?Q?8kMnweCYWW0ZhTFpnhu0yoP0eHekZ4gSGJz8VyGqEacCQebmcPf8vgPUxOUx?=
 =?us-ascii?Q?9p7kSHy5IlpexXypynElq7+Rx3R+SHlfMB6sqLzZByZFdX5DECbYGaad+iXO?=
 =?us-ascii?Q?6TbBDyZh4qmPf1lpKVD5KoeGeMrmhzQW5FRedXGCYOYi3Qtoeocifho4/8Ei?=
 =?us-ascii?Q?oGzdDu+n9WqnDTTe3f0lZwvumYAfVdb1BCcMuJI+NxzGYDNGzqR7YOEuPODm?=
 =?us-ascii?Q?SJSq2wiep2g4Q6SeQg036Cw+G9gZzZ1Rq+ia7v3wOVvTWghjSCIB/0sqkQv4?=
 =?us-ascii?Q?v4mqgP74pjLOFhm9y8OhUA2Ut0R/4RByMgiKxNHCG1IH9EBggy/3CbU3Dibz?=
 =?us-ascii?Q?PBbBmXpnRPO7Im7/ELZUygUIwwCbp3uaXAuUDyFoK/RoG3ZO5uylXfxViGPm?=
 =?us-ascii?Q?VG3r1HcuGHun7RPd25aVshZ8Kel9wOkwKBNXLPiUG0HAhhhURYGAqf06t/+0?=
 =?us-ascii?Q?SMUBX0p0U4aoo7xAeyFn4OSvsYBqFBbS4IUBcDz434c7n4ZrjvlPoY46moqp?=
 =?us-ascii?Q?7jduK1WlmeMAz3l4vQ5LWaozoh+/4unwkt0O4A9dO+BQoRZO/+Jguz7rOqq1?=
 =?us-ascii?Q?GZSQ5AP5lKw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5WUgUmccL+igocGMP4+LJRHZ4QCzY1omGXDfVyfzts5aTr6yXBbHSKcdPyOf?=
 =?us-ascii?Q?E155z3NW2rMZ0cpQrEAUYW4qcaUhqVB5sb9NsSTxnpTTIl15hh67YT9Cj0Pq?=
 =?us-ascii?Q?7UTsvUMFdXJJeyPRSea6Mg4AByu6jJAm9zuURRG75xvhGmp6xZDCTM7pf/j0?=
 =?us-ascii?Q?O+MZ+lIEV/6xsx6U3ntVXjm1C+QsaMCgBel+fMBweS54e2u5w+tX6klkPSOe?=
 =?us-ascii?Q?PKXCS6Ay8t9Vt95ml2mu46pTPpwjX0HJYkFHa/EGyV4B+oQmDhn6IDAm/4pi?=
 =?us-ascii?Q?RkQ/+oJIk0SYdg4nZxahjQLlp1nl+g4G9oOXx1OBIvAN+e5FMlRA6RKJO+MC?=
 =?us-ascii?Q?a951TWy36RyfO96SJNw/+RYPhIt+WtpJebo57yMqnpeaNRsO3dQREBxLPWo2?=
 =?us-ascii?Q?b+wWZ6IaW4x707rIqHAVDhSbYCrTPQcuK7tXyjVqGJZHPiGijb7DkSym3sSE?=
 =?us-ascii?Q?hTVPL7FYiv0qt/0ROxGx0wR+J/2bM7rHj3+06jDN6VpkZrbA8jPff0HUEdae?=
 =?us-ascii?Q?r5iaKgUYnSZgVcisQwoFAWoHSZ/Wrjf8nVvkBh33wwZxUyuNbeLoA6QeVQEX?=
 =?us-ascii?Q?xAKtY+jVnwPs3rum/8EfuUNRMI0GGL8fkI74kMDNgsg2znmitW9gptl2KFO/?=
 =?us-ascii?Q?roH/J0infyWQVLlKeBVsYWkzkaVQJFpCOiHE7C39SG1rzh7p76/GTTUMOALT?=
 =?us-ascii?Q?BmTUB9wrP0gs0Ep9tq8se4TdCR2w5aNQagmwGtajeN1aopbnsSou538YdN2v?=
 =?us-ascii?Q?9aK/D5gezHCaTqftxC7BrGCpQeqePbiawJRT6vYGNsq5xpT7Tg5BEyKvsxV1?=
 =?us-ascii?Q?LelkiuxwbnHCrdo+tWILT8TZQXTkRCYGJDLZx7TOkQU9lVmqWxevemScRjYe?=
 =?us-ascii?Q?8r1wQrdMdUoYdKWkdj16sv7c8/dpTTkwmFQNXofBAoBd6z6mLw6eg4FaQalH?=
 =?us-ascii?Q?KHVYO+6+03e7UF3oumA/2Sa6fWJapWZr1G7ITowfv6jN1hXUGuNMQB2FpKB+?=
 =?us-ascii?Q?rC07EQAP7Ob4+k9oEYa8HFxGV5aly0HRuuZnRZNoLquJqVepzocmJlYcs2xx?=
 =?us-ascii?Q?AmkWKvAg5mv+qfAbf1gd81h+466T3OgGRqhR9R/a5FonuFhjK+Zc2aArz4Gt?=
 =?us-ascii?Q?2r+Y4k94OOTHQ+oAmO6Xa1BimStLT2GdOeB36XY8/8MubtucYVhbFMB/m2sT?=
 =?us-ascii?Q?Q45R7+g6TWvkdYGDoyBydMsO8J9kh2XyPeuvBPsTpcyRF6GZE1Xo7py+YUv6?=
 =?us-ascii?Q?JIguGaDledEn9rjlq6rUwk3PHPCTXBcuJ9ZlGgNoS8scYHO3dnj/PvmHNN+o?=
 =?us-ascii?Q?Ty0PDnE9YPT34b7s7anAByg31pLLZOk9u9VwmwqJ769KfyjDh0m2e2Mp2ibK?=
 =?us-ascii?Q?m8KPZaVkd++yFec/AVT+idWjOLTME+uawmNcB/ju/2mp5UzNdqrNQCsaZQRf?=
 =?us-ascii?Q?oZAMLjMc4sz0HmK72K14JsWtldaWlUN0S6CtKkQTfAp02ogWorOQYYK/A2ab?=
 =?us-ascii?Q?2MDwkqpErqvwIRRDbbUoeiW6rrpVvMoe2zJSEERqpTfjSwLOS0k8eBZN0BaE?=
 =?us-ascii?Q?dqc99lgH2fwXrAInzdXIYx0Up+PCzwgUJyDHG361NNcCmn5EuW4/vncZ1G8S?=
 =?us-ascii?Q?EA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c488a55-7e67-4521-03ce-08dda86ac505
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 22:04:28.4366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5HFJxQKgwtqew/XA6QdQZebOgBqy8REXfx5ju7RcCkqUjlaRr9M2yVW7gjJXDeAHN8byCD0kqmUq6noFK8IwN0PC/yUIPVsjEfp8ge/XVCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8501
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

On Tue, Jun 10, 2025 at 05:12:45PM +0300, Levi, Ilia wrote:
> On 10/06/2025 0:58, Matt Roper wrote:
> > On Mon, Jun 09, 2025 at 08:46:19AM -0700, Matthew Brost wrote:
> >> On Mon, Jun 09, 2025 at 12:59:38PM +0300, Ilia Levi wrote:
> >>> Allow the driver to expose hardware register spaces to userspace
> >>> through GEM objects with fake mmap offsets. This can be useful
> >>> for userspace-firmware communication, debugging, etc.
> >>>
> >>> v2: Minor doc fix (CI)
> >>>
> >>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> >>> ---
> >>>  drivers/gpu/drm/xe/xe_device_types.h |  14 +++
> >>>  drivers/gpu/drm/xe/xe_mmio.c         | 142 +++++++++++++++++++++++++++
> >>>  drivers/gpu/drm/xe/xe_mmio.h         |   4 +
> >>>  3 files changed, 160 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> >>> index ac27389ccb8b..78542de0d48d 100644
> >>> --- a/drivers/gpu/drm/xe/xe_device_types.h
> >>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> >>> @@ -10,6 +10,7 @@
> >>>  
> >>>  #include <drm/drm_device.h>
> >>>  #include <drm/drm_file.h>
> >>> +#include <drm/drm_gem.h>
> >>>  #include <drm/drm_pagemap.h>
> >>>  #include <drm/ttm/ttm_device.h>
> >>>  
> >>> @@ -161,6 +162,19 @@ struct xe_mmio {
> >>>  	u32 adj_offset;
> >>>  };
> >>>  
> >>> +/**
> >>> + * struct xe_mmio_gem - GEM wrapper for xe_mmio
> >>> + *
> >>> + * A GEM object for exposing xe_mmio instance to userspace via mmap.
> >>> + */
> >>> +struct xe_mmio_gem {
> >>> +	/** @base: GEM object base */
> >>> +	struct drm_gem_object base;
> >>> +
> >>> +	/** @mmio: The MMIO region to expose */
> >>> +	struct xe_mmio mmio;
> >> Any reason not this is not a pointer to xe_mmio?
> >>
> >>> +};
> >>> +
> >>>  /**
> >>>   * struct xe_tile - hardware tile structure
> >>>   *
> >>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> >>> index 7357458bc0d2..6bfa915a9602 100644
> >>> --- a/drivers/gpu/drm/xe/xe_mmio.c
> >>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> >>> @@ -408,3 +408,145 @@ int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 va
> >>>  {
> >>>  	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
> >>>  }
> >>> +
> >>> +/**
> >>> + * DOC: Exposing MMIO regions to userspace
> >>> + *
> >>> + * In certain cases, the driver may allow userspace to mmap a portion of the hardware registers.
> >>> + *
> >>> + * This can be done as follows:
> >>> + * 1. Define an xe_mmio instance that represents this portion.
> >>> + * 2. Call xe_mmio_gem_create() to create a GEM object with an mmap-able fake offset.
> >>> + * 3. Use drm_vma_node_offset_addr() on the created GEM object to retrieve the fake offset.
> >>> + * 4. Provide the fake offset to userspace.
> >>> + * 5. Userspace can call mmap with the fake offset. The length provided to mmap
> >>> + *    must match the size of the xe_mmio instance.
> >>> + * 6. When the region is no longer needed, call xe_mmio_gem_destroy() to release the GEM object.
> >>> + *
> >>> + * Limitations: The exposed xe_mmio must be page-aligned with regards to its BAR offset and size.
> >>> + *
> >>> + * WARNING: Exposing MMIO regions to userspace can have security and stability implications.
> >>> + * Make sure not to expose any sensitive registers.
> >> This is no secondary issue, it is a primary one. There is no way we can
> >> expose entire PCIe MMIO register space to a non-root user (a root user
> >> itself can just mmap the PCIe MMIO bar bypassing the XeKMD if it wants
> >> btw).
> >>
> >> What is the requirement for this patch? I know on other PCIe devices
> >> I've worked on we had similar issues where we needed to expose a subset
> >> of the PCIe MMIO register space to user space for kernel bypass
> >> submission - everything we needed to expose in that case was 4k aligned
> >> + tied to a single process via a KMD config before mapping to user
> >> space. I suspect to do anything safely here, somethine similar needs to
> >> be done.
> > I don't think it was the original intent of Ilia's patch, but I can
> > think of at least one feature expected on an upcoming platform where
> > there is a page or two of registers that the hardware team designed
> > under the assumption that they'd get mapped directly to userspace in a
> > read-only manner (i.e., information read-out only, no control of the
> > hardware).  I think some of the internal discussion was considering just
> > going our own direction and exposing the contents of that register block
> > via an xe_query instead since the contents likely wouldn't be changing
> > after boot, but if this infrastructure exists it might be a simpler and
> > more natural match for the hardware design.  +Cc Shuicheng since he
> > might find this interesting.
> >
> > But if we're allowing this to map registers to userspace in a read/write
> > manner (or map any special registers that have side effects on read)
> > then we probably need a bit more scrutiny of the specific use cases to
> > determine what kind of permissions are required, whether they're safe to
> > access in concurrent / racing manners, etc.
> >
> > And of course since this is new uapi, the regular graphics upstreaming
> > rules apply and we'll need an opensource userspace consumer fully
> > developed and reviewed before we can merge the kernel changes.
> >
> >
> > Matt
> 
> 
> So one use-case is direct submission in upcoming platforms. This would require write
> access. One thing (pointed out by Tejas) is that I probably should enforce that the user
> passed MAP_SHARED. Do you see any other gaps here?

I don't have any concerns with the high-level design; I haven't reviewed
the GEM and remapping flags in detail though.  There are other people
with more expertise in that area than me.

When I said that writable ranges require more scrutiny I mostly mean
investigation of the specific ranges of registers that eventually get
mapped to userspace.  We'll need to carefully look at all the registers
in those ranges and make sure there isn't anything within the range that
could be problematic if userspace accesses it in certain ways.  If the
range of registers was specifically intended to be mapped to untrusted
userspace as part of the hardware's design then hopefully everything
should be fine, but we still need to review it to be sure.  For
something like ring 3 submission to hardware, there may also need to be
consideration given to if/how direct access from userspace interacts
with other things being developed in the ecosystem (e.g., work on
cgroup-based GPU scheduling has been on the mailing list recently).

> 
> Why is this considered uAPI though? This is an infrastructure done as a preparation to expose
> certain MMIO regions in upcoming platforms. It will be uAPI only when someone will use it
> within the driver and returns the generated offset to userspace.

Yeah, good point.  I guess for now the framework is just sort of dead
code with no uapi impact of its own until real ranges show up that start
getting offsets assigned.


Matt

> 
> - Ilia
> 
> 
> >
> >> Matt
> >>
> >>> + */
> >>> +
> >>> +static void xe_mmio_gem_free(struct drm_gem_object *);
> >>> +static int xe_mmio_gem_mmap(struct drm_gem_object *, struct vm_area_struct *);
> >>> +
> >>> +static const struct vm_operations_struct vm_ops = {
> >>> +	.open = drm_gem_vm_open,
> >>> +	.close = drm_gem_vm_close,
> >>> +};
> >>> +
> >>> +static const struct drm_gem_object_funcs xe_mmio_gem_funcs = {
> >>> +	.free = xe_mmio_gem_free,
> >>> +	.mmap = xe_mmio_gem_mmap,
> >>> +	.vm_ops = &vm_ops,
> >>> +};
> >>> +
> >>> +static inline struct xe_mmio_gem *to_xe_mmio_gem(struct drm_gem_object *obj)
> >>> +{
> >>> +	return container_of(obj, struct xe_mmio_gem, base);
> >>> +}
> >>> +
> >>> +static inline phys_addr_t xe_mmio_phys_addr(struct xe_mmio *mmio)
> >>> +{
> >>> +	struct xe_device *xe = tile_to_xe(mmio->tile);
> >>> +
> >>> +	/*
> >>> +	 * All MMIO instances are currently on PCI BAR 0, so we can do the trick below.
> >>> +	 * In the future we may want to store the physical address in struct xe_mmio.
> >>> +	 */
> >>> +	return pci_resource_start(to_pci_dev(xe->drm.dev), GTTMMADR_BAR) +
> >>> +		(uintptr_t)(mmio->regs - xe->mmio.regs);
> >>> +}
> >>> +
> >>> +/**
> >>> + * xe_mmio_gem_create - Expose an MMIO region to userspace
> >>> + * @mmio: xe_mmio instance
> >>> + * @file: DRM file descriptor
> >>> + *
> >>> + * This function creates a GEM object with an mmap-able fake offset that wraps
> >>> + * the provided xe_mmio instance.
> >>> + *
> >>> + * See: "Exposing MMIO regions to userspace"
> >>> + */
> >>> +struct xe_mmio_gem *
> >>> +xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file)
> >>> +{
> >>> +	struct xe_device *xe = tile_to_xe(mmio->tile);
> >>> +	size_t size = mmio->regs_size;
> >>> +	struct xe_mmio_gem *obj;
> >>> +	struct drm_gem_object *base;
> >>> +	int err;
> >>> +
> >>> +	if ((xe_mmio_phys_addr(mmio) % PAGE_SIZE != 0) || (size % PAGE_SIZE != 0))
> >>> +		return ERR_PTR(-EINVAL);
> >>> +
> >>> +	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
> >>> +	if (!obj)
> >>> +		return ERR_PTR(-ENOMEM);
> >>> +
> >>> +	base = &obj->base;
> >>> +	base->funcs = &xe_mmio_gem_funcs;
> >>> +	obj->mmio = *mmio;
> >>> +
> >>> +	drm_gem_private_object_init(&xe->drm, base, size);
> >>> +
> >>> +	err = drm_gem_create_mmap_offset(base);
> >>> +	if (err)
> >>> +		goto free_gem;
> >>> +
> >>> +	err = drm_vma_node_allow(&base->vma_node, file);
> >>> +	if (err)
> >>> +		goto free_gem;
> >>> +
> >>> +	return obj;
> >>> +
> >>> +free_gem:
> >>> +	xe_mmio_gem_free(base);
> >>> +	return ERR_PTR(err);
> >>> +}
> >>> +
> >>> +static void xe_mmio_gem_free(struct drm_gem_object *base)
> >>> +{
> >>> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
> >>> +
> >>> +	drm_gem_object_release(base);
> >>> +	kfree(obj);
> >>> +}
> >>> +
> >>> +/**
> >>> + * xe_mmio_gem_destroy - Destroy the GEM object wrapping xe_mmio
> >>> + * @gem: the GEM object to destroy
> >>> + *
> >>> + * This function releases resources associated with the GEM object created by
> >>> + * xe_mmio_gem_create().
> >>> + *
> >>> + * See: "Exposing MMIO regions to userspace"
> >>> + */
> >>> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem)
> >>> +{
> >>> +	xe_mmio_gem_free(&gem->base);
> >>> +}
> >>> +
> >>> +static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *vma)
> >>> +{
> >>> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
> >>> +	struct xe_mmio *mmio = &obj->mmio;
> >>> +
> >>> +	if (vma->vm_end - vma->vm_start != base->size)
> >>> +		return -EINVAL;
> >>> +
> >>> +	/*
> >>> +	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map the
> >>> +	 * whole buffer from the start.
> >>> +	 */
> >>> +	vma->vm_pgoff = 0;
> >>> +	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> >>> +
> >>> +	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
> >>> +		     VM_DONTCOPY | VM_NORESERVE);
> >>> +
> >>> +	return remap_pfn_range(vma, vma->vm_start, xe_mmio_phys_addr(mmio) >> PAGE_SHIFT,
> >>> +			       base->size, vma->vm_page_prot);
> >>> +}
> >>> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> >>> index c151ba569003..2990bbcef24d 100644
> >>> --- a/drivers/gpu/drm/xe/xe_mmio.h
> >>> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> >>> @@ -8,6 +8,7 @@
> >>>  
> >>>  #include "xe_gt_types.h"
> >>>  
> >>> +struct drm_file;
> >>>  struct xe_device;
> >>>  struct xe_reg;
> >>>  
> >>> @@ -42,4 +43,7 @@ static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
> >>>  	return &xe->tiles[0].mmio;
> >>>  }
> >>>  
> >>> +struct xe_mmio_gem *xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file);
> >>> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem);
> >>> +
> >>>  #endif
> >>> -- 
> >>> 2.43.0
> >>>
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
