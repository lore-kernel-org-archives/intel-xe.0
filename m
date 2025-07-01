Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7456DC7EE30
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 20:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1DF10E642;
	Tue,  1 Jul 2025 20:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WS0h5f51";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B0410E65A
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 20:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751401936; x=1782937936;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BrOtfRs1iTudaVhuJa6wU8GBgJOkjvZMeRWdYjIaUSg=;
 b=WS0h5f51HKpASB7O/GdDTGZJ96rArtFqcLE5SK2woQ+qkODo6A89SD3E
 QZM2NY4AdaipsOGIoXRSVdELdnisy/DmGv/G7rd6rH8rcpnDEpVqApZo6
 QJ2MM5qj8FJ/VOweW0IK9ya+G09OCmZU/twvFXEKprAOVQeggeTaxryLp
 /P/IwYMdAUVrv2BEb8e9L2aEkHLjDeM0WFerXy3iySh43qq2GuXSpwVWN
 bNY5/tqGJ3s8svkKYXSKr+8wtXlq0Vli/9rXwATEvdxAIGnfa2IXpuHMX
 fJHSnvCCuwQiSiLL/TUVP6Fq4B5kLzw5NKcC0RQHrT1aucr4wo7Tj4zZQ A==;
X-CSE-ConnectionGUID: TBZ4r8obT0qcrMzEKAIhyg==
X-CSE-MsgGUID: Wu78TB8aScSEQwVijCkAmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53826508"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53826508"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 13:32:16 -0700
X-CSE-ConnectionGUID: fDPNrZNBS+i3YsOpew/cZg==
X-CSE-MsgGUID: 9pLV2UnATO2DK5nH4J/tYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153338339"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 13:32:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 13:32:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 13:32:14 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 13:32:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+XPCuN2tRwHn8vSgf5ouyyYzuNb46JQ9VizCVch2Y/pWU/pCF6F87gv54aKO/WSDZ+nIJsQ9rxI+qNmQGVLlfmeO6/hCvtgcupwtm2NbYcSIiuMOQg0IhEh0RFb8SDrsOpL9CxRbwd+qU91nOeRUJawPH65bhW1NPHkKTkNL8zoqCVLawwU9HcXm0F9dJuFqgUNLxg73OSm78Xd3eILaoXrYZd30P1FXhG23wSEAzhwgxDVJzGxk+2+ypv94jMuudQPd7hX4b0AgJP1gYr+vwmxQgK6j8nZI9vdMaZTgToT2lH1Xsi1tuTFt2+ZFb2Xo1HHMimvVzAE+Q47rnHUKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G11f2jSbbR9O9wUoo/Zzd+Nflke8Rl2XwnoxodYhERY=;
 b=yVvgImTkY1BivwI9oYQrtJjU0ERG8157+NhLziItv7X79unlmtrPwCFgj+m1wLquzRnr1aqsfuXAMIUVIZDjj2tgjKfnktPeuuXKYz5ruJNOdsqKU6YBAvz/9DvMKoDPnzsH5RHj0282XAAJxmoMtzCGVjhLyjtson4hzya9gmsINhP9wmAFzwX325w9EfdVYIeBSMN5LJRz+apuYgMRVcLotpWdIhIfx22YEpimstlKGllEQtoSLL6C/6Zr3yIKg1gW0h1rDO5BOOBtg5IPkGJRdDDvY4df8KoUl0Km4O+iPJ8RNQOX5FO0kfP8+DlpJ7mSRJ1VH3z4L58GU9RA8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB6910.namprd11.prod.outlook.com (2603:10b6:303:225::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.37; Tue, 1 Jul
 2025 20:31:31 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8880.030; Tue, 1 Jul 2025
 20:31:30 +0000
Date: Tue, 1 Jul 2025 13:31:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <sk.anirban@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH] drm/xe/xe_pmu: Validate gt in event supported
Message-ID: <20250701203128.GL4868@mdroper-desk1.amr.corp.intel.com>
References: <20250630093741.2435281-1-riana.tauro@intel.com>
 <q7bmmb7s3v2wxjeamrcuhcpwm23tlju2l3uqobg3mo4y47dj5r@ndr2kbjfhhkc>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <q7bmmb7s3v2wxjeamrcuhcpwm23tlju2l3uqobg3mo4y47dj5r@ndr2kbjfhhkc>
X-ClientProxiedBy: BYAPR07CA0063.namprd07.prod.outlook.com
 (2603:10b6:a03:60::40) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB6910:EE_
X-MS-Office365-Filtering-Correlation-Id: 98b657e6-da3b-4549-2da5-08ddb8de4340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QUuMaYqxG2LyQFTJCbVCNGqeaHIR0o9nMRYK3CEpCguEaN0rOBZRgmjChA8m?=
 =?us-ascii?Q?b4FTt08Txv+RURgGOQg1B1haSikJXYhHlEMRsbFIbdossCsiBa3j0VuVrA6t?=
 =?us-ascii?Q?EpQoJBvk5WKNcF+5QI/1eNrnzeIevtsramhF+OTh6XARCuPWUmMU9usJxbbw?=
 =?us-ascii?Q?x/PyLWKZ9igr2AaqItDhvXvFe07K4VgSQjkglhFS//YaRPXRAi6vGFbVheXs?=
 =?us-ascii?Q?+hhXqhhteJpkMi55IpbmWSe7ntyeaOB4eXoV566gGgzEx0gUO6bYKS65zg8r?=
 =?us-ascii?Q?346r5UcMItrVi167nJhqWi8ytC51kLenqYn58bfxWkwY58yMbl0L410OKDoW?=
 =?us-ascii?Q?4mxRZwex0DVCQdadqtoBMLo6g7+aZa1kxqPUty6jM/DDQlidnXdmSKMdJt+Z?=
 =?us-ascii?Q?+QgJi+yFH9IL7mIQ7OEfxxy11sxDQUpfXlGmCtwXeWcvw+/WCIhO6Uoswsdy?=
 =?us-ascii?Q?ZsEnDb2zXmDH/UAzbQDnD0YmGKsDxwYrneeXvfpFmfHuVobRB7gzOP8m0iOh?=
 =?us-ascii?Q?17p9BD4oaIaAEfjlOAmv/b1gRlKvfIx7Y2WBAbfGjdQqeW6mwAj7+1YDhvav?=
 =?us-ascii?Q?UTbbeqJ7dC96pycMKy8LVQzV4CTehNmv8Iji2YzPnN06/C5GSyb1J1xKtI6e?=
 =?us-ascii?Q?tJEgPRK0xrDo0Z2oW9P1gJTrPxqyaZpkrhllw5G3DhYBubuhRVbOplQkshBl?=
 =?us-ascii?Q?60q6gwd91ioz7cCzGcvTPUZDPm87YBehFJLZHxuG1rngezPPb6pvLkVgkpSd?=
 =?us-ascii?Q?YuHggTQzKdmJ+C2XKsRZrYQ/d3VY5kaRP0/ZSVZUNPrVwn/WQ0arC7R1sx5R?=
 =?us-ascii?Q?0McWDhxnr+iY2lB6rBkXMneSsnGRRrJzDPBCpSf9xB5pYN/QoQwh7V9dhVIo?=
 =?us-ascii?Q?ltmaLywhjX0FdwKq1hgvq5AtfFtD0B3xeQwwIS9cUMk19m8bQmAO+frGtNnZ?=
 =?us-ascii?Q?AppPev4U/OqC3lQCCJ34mbSHL+RPQy8zh3ysduw16PHGBpkXaCGVYnMeBvUZ?=
 =?us-ascii?Q?+j3s9YAiuFvpGwLbUjShNoOEapCYklZC9YS0hd6ex7YzzxuI4awpT8Nygp2W?=
 =?us-ascii?Q?8Yf9sKG3Qf96z4Lz9gSCsMg8DLsXHmYp34qehjRDuBXcZtgcfr16Es118BG1?=
 =?us-ascii?Q?rKpTK+Il6QLAigB9nQNPwmUOSeWsWFUXvYuvjm2pZU4ofM84EzUQEI5+eVd2?=
 =?us-ascii?Q?a+bx5caI/bhO6KwWPkafsXCK3z1/Hs6XE3ba/3wwY0ImcGmmnJyyWvquu50+?=
 =?us-ascii?Q?qkqxQN8xRhgvMaH6jwyQOWB8a2Tk+Et5ar1kCtRdrWd7HkK9K8UxYSBwAH3T?=
 =?us-ascii?Q?ymvKVBUyExT7Z72lrkO/711CbJfz1jJpSvDZAyKNfb0fqFeK4RMkZHKpmgI7?=
 =?us-ascii?Q?nOH42vhFGjtrsujqs+1rpQoYO9LP5TuHLQwctf4/9XURz7Ivq8pIOKG/FB6x?=
 =?us-ascii?Q?6LgNLCsutf0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lg9dDbkEGHIgvUb8Is3b6ro/w6w0QUjfLA23tL2cLOZu4DgDK3uuPfl87JSI?=
 =?us-ascii?Q?jsbvdYRhEHioPG9yBEkKV43uVVIkRjK2OPKkN51dofvwIXTGiaQcflOxNKkW?=
 =?us-ascii?Q?g+6wXCkW7dr9n606+wgRhpbiOzjECFtg4xgk2joau/Yea+P8BfHTUAsIl9cC?=
 =?us-ascii?Q?1yBVk83HzzMGVuGpJX2vXQqQtrOU6dJRPgV+jZDSE10VSiCgGMIfY1zsnXcS?=
 =?us-ascii?Q?AIpZA0zByGte5dzD7Us2oGGSdON6bAeUK09fUcLhxMSEaWPpd5beCIsc3p7G?=
 =?us-ascii?Q?ccNIqFX0tJ5jkepSQgDXyN9YylJ40xBy3q/LUgE45ZHSMPEiEF4qmPqJn1bL?=
 =?us-ascii?Q?IVOwpYlScVQq5tipP1bmXjiNMUsJlHkIQFEpn26aKsxZsv5npM6QBahdDb+x?=
 =?us-ascii?Q?AIRNcWSQAm9ifkk3Yeoncq9KZuqbVi5T8Glrn/O2xfbSgQJyb8IlI8JxbW0a?=
 =?us-ascii?Q?RpHgiHfZUxHhhHK6yBTIMOhPvsILlqLxfUr8Gabe8KcyPweJ0HyFHVNg/3y7?=
 =?us-ascii?Q?yZe9pqYDwtp7QauxWZQ5Gt4+M+wCeCJsnhdYfgTCyFKQHuyX0/kFDcGDukUV?=
 =?us-ascii?Q?2X4nF2/zYSeYwrbqRNu4jK8JypiEvvd9DJC5s6mZ2VqNoJ1ATGWotA7rft/D?=
 =?us-ascii?Q?89qW4MXgXylbRX0swbqoYkpslhsbeKKGUp+06yUlpmZikKN6bCAfebIc+2QT?=
 =?us-ascii?Q?odiNOK+UCU/59dOFeM81Ba0EINYL+H76UCyO5OVITkogwl+iFCQru/vE7p5b?=
 =?us-ascii?Q?hWdDQ2ZnYYqpy+cISOZsZylHOrzBEMgIwvRl7vS1hYyrsA73/MpOC3RxA70N?=
 =?us-ascii?Q?EpX0K0wkHsb5gbOjsm227WVMqgbAJspKVqmJQ6+5wEknO8L4pWdcWz54loJ4?=
 =?us-ascii?Q?cPX7slry/FuZbvoCvkZPzyHpa7X2meYN7tqV0d3Wl9WczyV5Frk/Lqfg/37H?=
 =?us-ascii?Q?bTURFyQylwFNiyUNtZrpdvVPkTqK2JtfB1YFnX026wy+jK3WFyy04dRFnYF5?=
 =?us-ascii?Q?a0/SBwzGVEc42LqB85NoqhuxnoOqDWDSYBkm++kCIz3WObVv19q1mxPZH0wq?=
 =?us-ascii?Q?d3zfmlg/Z0/l3GbvTaqRlqqbACBWj+cvB6gl1oMSL6+CNX2i/0RSo25uD3Dn?=
 =?us-ascii?Q?viiD04virgjW0JCqwrBpPie63i4KPbExCRd0CVLyLcaZehwJ+kr+p9vXsoBU?=
 =?us-ascii?Q?UfV+o49lyX0oVR/NGKvGXW/Lm+AR3wpr3zrS6ZfFkQ3CapJv23a0VNuEbfGy?=
 =?us-ascii?Q?o7cyvXiJJJjuj3NE4Dne4ZDcW6vrbVvo8wnu6belBC0I2oD5qRJILbMSBTuQ?=
 =?us-ascii?Q?M8SFi3KvL0mR9ljc0BZIJzwER8VuIBadQnZd1euaJCPyQPutL1N/4r/ll45e?=
 =?us-ascii?Q?zvJTP+ANSTvevS3QGiJsCSN2gxZMH1dQ5ZQan4Asm91Iv4LrHC80GqGBilKX?=
 =?us-ascii?Q?jsSLuUUWHMU5ZbVkslJMk+2veBID6YIbG2eOek9kezI3YPIi9IlLm7y4XPZm?=
 =?us-ascii?Q?Yl/cErWxNSsqFwDkOYXUzA1YHOt+07IC99dImOg8NevQ9tq6lbqfBfXXbaD/?=
 =?us-ascii?Q?+zdhn0tfL9OQGA4esFW85rM8wkhgZxjSHq9MK8ZOyXPJNt/j3fpoj2PV73wc?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b657e6-da3b-4549-2da5-08ddb8de4340
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 20:31:30.8425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I96WNdiBa0EStJkmpx3mdBx5ofcXau2ONd7DnZp6iZfeGClR6x/n/KeZpNUtcI/ZiIQgRAMm6Rf3hL31QSsUudhXu54iUU5MGFzIJwS0ETo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6910
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

On Mon, Jun 30, 2025 at 05:28:53PM -0500, Lucas De Marchi wrote:
> On Mon, Jun 30, 2025 at 03:07:41PM +0530, Riana Tauro wrote:
> > Validate gt instead of checking gt_id is lesser
> > than max gts per tile
> 
> I prefer the series from Matt Roper that is refactoring this part well.

I think we want this change regardless.  My series is about refactoring
to future-proof the behavior in case we wind up with multi-tile+multi-GT
platforms in the future.  However Riana's patch here is fixing a real
bug in the code that exists for existing platforms like PVC (i.e., the
code currently lets "GT1" through as valid even on single-tile variants
of PVC).

So we should either land this patch first (which will remove a hunk from
one of my patches), or make this as a separate change on top of my
series.  In the latest version of my series (v4) I included a patch
identical to this one as patch #1 since I didn't notice that this patch
was exactly the same thing; if this one lands, then we can drop the
first one from v4 of my series.


Matt

> 
> Lucas De Marchi

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
