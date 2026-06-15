Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27534CD98CF
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 19:11:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB45E10E5ED;
	Mon, 15 Jun 2026 19:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JdTDNGbb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977D710E5E3
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jun 2026 19:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781550685; x=1813086685;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+gMBKyYqIhPqprToWZL6+cV2r8oiF/4zBjm7+eq1Cos=;
 b=JdTDNGbb0ryZz8w2uU5IQzW97Pg2c3bsBcscmpg//Juq7SV2k9jfDMCq
 nf43r8NyMZdN8hiQPYlftoIBBQQ/+uFxuTzZscVXvFRoXMhq15urqnLp/
 CPIMyAIEl4rZL9NDUbH2k8qbwIo4b/RbCgmNKaO19byhljs7ESqLgWuYr
 GHvJRKNpAKXA0ddflhNMMjTI2Xnv/Tek91M8AvZ0oINX+7M42qurqfPZ6
 rpSSBtYzaq4Xa/0JU+gy0gUgC08VjbXHzgFZYffsK87aGJ5RP8Y1PMG5U
 c7F99SUkykELGmUjuO/Q46NTO+/aVanGQZr0zGTwS5aMMk9JCL/+8gstE w==;
X-CSE-ConnectionGUID: eDns7SYRS3Wi45TMibL8YA==
X-CSE-MsgGUID: NxVRB3C4Q72nKR1rszy7Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="107732315"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="107732315"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 12:11:24 -0700
X-CSE-ConnectionGUID: yKR5qiBkQdWznRxPEnMrVg==
X-CSE-MsgGUID: gkpJ7JLMRQycAYs5EObthg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="246657607"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 12:11:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 12:11:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 15 Jun 2026 12:11:23 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 12:11:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FtRh2nnAK/Ii3KL0NTDr9SQZY85DdP3FhgvskwEwutbmopAKELw+V8VnJ+0oqBbJJ9laa6KrSYVk41K+c3IlshT4vRoO+XI3uDsUb24D+qi6LsQo3dN0WuInwzDk80eM0C9IloydGjWChsGNHcD77NYhDd7hX14zNhhTTH/NFR68lQOWldD+9ttBoKGBCMnqFwySTcii5lwtcRgZbfHvqMt1YFd3tX96QoELlhM97Qd8BObGJmU3AkaJ5JXSa7uEhn8ndWelyFVGzneGAUxlPANIWfwFEs/NNnERbxnOz/38EFcZgmWlaE7kurNACYTfAThYAUULvXkovNOVxyi2QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KyJICFFlM2rD08+4O85ms+65qQfT2g+Xqoe99HEjGRo=;
 b=Jfcy6QVmfI0zIymslJRAK1FoJSTACJUkwJZiih1UurcBYyS1TB72Vw+tbClsFNuibHIk9FjPZvCdxcc3W9dGkARRBNFSRclsDT+PLQ7CfNJhGKcJYPMB7hLULj5F3hG1Xl4WLkZLRUE3uZaj0ZMYvdyDKE5/UuIHekGray8wtNVfpeycRIywtsnv+2+25PvfylYDqI5Glq2+8xmr1LMFW0PDGD4SiW2i4/vAnCAyjfaVtpGNGMuNUErYwuoweViHrYvGwWTtKePtHssS0uubGt0f8LIjZp/oPjpQwg6l+pSfKWl0ix6P+D/qmeI5brJfYkz5bbeaGzTiz6rL+jqH6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ0PR11MB5197.namprd11.prod.outlook.com (2603:10b6:a03:2d1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 19:11:20 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%4]) with mapi id 15.21.0113.014; Mon, 15 Jun 2026
 19:11:20 +0000
Date: Mon, 15 Jun 2026 21:11:13 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/pt: Fix NULL pointer dereference in
 xe_pt_zap_ptes_entry()
Message-ID: <ajBORuKifZevsDgd@fdugast-desk>
References: <20260615091904.165762-1-francois.dugast@intel.com>
 <ajA/Yy/py1Fs+vUz@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ajA/Yy/py1Fs+vUz@gsse-cloud1.jf.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZP191CA0054.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::27) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ0PR11MB5197:EE_
X-MS-Office365-Filtering-Correlation-Id: a26eb596-656e-4267-3148-08decb11e241
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: xSZZ959/s9YEhZqjCfOQonWRDGlF6PqSkj9mapB7DlKm9jMj2QCrEoeQHz742VTO9ghMoJOj7GRRd7M13f2t0hFqxipgR6yL4/3CAT7IH+IbbfzGcisqc2dH/42NK0btMxuyFRybwyKZ1CVJzwrwV82NVXhN/b4zpY1bfEeW7l4WImUVYRjIhPmO7KrbL3OotAFhusCaOc6Rq9m5UVFYDwgcmYyjN2QV1nySTJ7ulT7/I/Ca32/uxT2vR1LpjuD8HHkrcRMd5HDzHIGuUagIVhNmEsIGpgwJC/LHEaO4LqcGwc4awTJDke5XzSTip0GLcsoy7hxjqhTgGbv/fBTYjGtpk0jgcKvAvjkyBoUh5xOSbZCqVUfDjWuVDXWER44FO2WDEMRjoVS0+XPq9Igks0Pqg38RZz3zUChMRTFHQJpI7OARLhAMxfwkn1BhPWC1wEOzEcP3DhXResEFNvX6t4XsZKp/xah8hiHIS5/Mx7cH3W5Fz96Bo8BdefNSJYfdBoml3gLD2yFOYVxlQCvTZK9FdL+Q1sLuTcjr8Zbpr6iqw6Ksbo2VgfolM7EDFLpyDVn7QI4EPelTPRSoYrEqtTqSkfW2FQW86NhKnS2L0CwB2rHonYDjb6XY2v7rN+x5hs0kdvShXT3QIApnKkH0ZBSs3dgzIzSuV9BSSSKRWJE37wBo0P8QD3LzpCMNEVmZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PbQ+AKuIr/A+4FwNKPv74Mb/cUNea5SNtc4hhnmKBSJJFRBbQdLCon0Cy9?=
 =?iso-8859-1?Q?z2gWlyOBhYOLfTJiGwbGYJq18XwjX+ZcbX7dKVJyq3/7MDedrCj0nm+RuD?=
 =?iso-8859-1?Q?Jvxz/hOnjq9rsBvbcs81HzzmGQ6RF9aGD/7YymsQDGb6xCz06YhHTgN/TL?=
 =?iso-8859-1?Q?V7mOixSiEyvvpwFy2xkziSUzCfNUbjTDndcwc8kl5XB+R4bT/+CfMnos7Z?=
 =?iso-8859-1?Q?xQ6JofXWnYV0XWFs7V2y4SPuanFicZ8ywHctYz8TurT3lM+fWsZp1QmlyE?=
 =?iso-8859-1?Q?MM5yM2utWTkyV4XbhEV9+AfBtlu8AN7giNSzIf/yNZd3tyicdqlOkEXnXb?=
 =?iso-8859-1?Q?UaInHX5tdeunFu2bw2f5EK3tECg3REiZuatNcc0SQ9QQvzgbWVDXxdO3ko?=
 =?iso-8859-1?Q?7qhWqzzh022bybF2Hfl40FA61u33BEEWlxOLJqSvCXqYp417AKCK5kMU6j?=
 =?iso-8859-1?Q?MB5uGcu2LGEk6SX2GKsOdjv6YUOXnMUPOHjudJgHaUD9zJ4gPG73zBSpVu?=
 =?iso-8859-1?Q?H8Ojbrf/LUy/d4F/Yr8WxcpDnwVzjoNPaAUZzOGJRJbChou6IxZjh2HvP8?=
 =?iso-8859-1?Q?xgLGUvNB9+ODwKBOj6h3xtsVd+TJy3XQsWtAcUlOXZ//zqQub+Lv9YfTgB?=
 =?iso-8859-1?Q?4iwUj/XLTSW1jtxDiMC8O3Uxz/vGg8/I3zL+ib6z2UlrqE/DLJZPSiW4Q6?=
 =?iso-8859-1?Q?4CrVcJcZVUNGBXc80i9bsdFQqMMia/fA4SMjXfNLaDCho1gHeWhsihJs4S?=
 =?iso-8859-1?Q?3eEBkBPL4hvTPuJLxKbRipZK0xX8yHJNDHWE+KwVidHikNHJPyxgBBkQCP?=
 =?iso-8859-1?Q?e3UyBX6jc9Wqxvehdmvxkxsv/TQeEDI51/+B5CCeQm8qicjrCR+Nk5Y0kh?=
 =?iso-8859-1?Q?uKdRuKsYcgewpAsIxPYDAgSYaIiJGW7nspuEzOwfBzwuoayAiv3EwO9OHA?=
 =?iso-8859-1?Q?iQFrzAFz7Lah7Lr9yQofuyfO8fJsKhoAh9G2mkbTcjjQH8Ulsb+TDYOooZ?=
 =?iso-8859-1?Q?ZL9IIH0L4lxqwEkiCJSR8LE4mj+cGShRYZKVnw2wblHejskYE8RDAqqN1G?=
 =?iso-8859-1?Q?omlVjUItC/9SEPraojoEJ+VFvjPy9+BNbiS1yhsDso25aPEcnupsKBpeOL?=
 =?iso-8859-1?Q?OdREcLKxyBTN/hzYAIqeswC68ote1FnN+udmALkRjioTn5mPdOF2EpxSa0?=
 =?iso-8859-1?Q?Cy4HXJWEcLmb++kH7pLkPJAEAT0LZqGDAQ/X0JYf2TFANeFR4NIL/Q9Hbq?=
 =?iso-8859-1?Q?1jL2KikgHleWkxpTk3krjaITidciclFJSwoow9SerqZxlqI0fes4GHZF3x?=
 =?iso-8859-1?Q?ZOSDg1fTjNUVMTM3rdd6KJvd4tepTC7hx7WIXnIGal/i74gOfc+IYFi4Ht?=
 =?iso-8859-1?Q?OyAVX26JXIYyXsskEc1fZMfSxWXjLZMnlSw8t8x/k+bNx/O9A843Dvzhti?=
 =?iso-8859-1?Q?Vg6W7c2ECJB4Uu0zafRJ1vUQYO5vGy7mzRbPR6U2Pfq8BJsyyBzWccu0A/?=
 =?iso-8859-1?Q?k5wRCYQQ7pUdYRhSDU9Ye08h/iVlBWbZJ5esi5yiBZOGZGPIiOBTK2/BAp?=
 =?iso-8859-1?Q?eLCb6ep4vHF4VVyx67Mbv/7cypDUuqqr7JvZ29KB4i4904oYZ4AiGHW2DB?=
 =?iso-8859-1?Q?2o6yGxxH22QiX6uqHQqQKvhPvxQexzc4aDsgzzh1MgvvFhgGL08Z09uno+?=
 =?iso-8859-1?Q?ZHUugsF9YJ7sDWzVrvshxs1zKQjNHZ2MuYcog1ekz6huhm6ln1SjeCfuCn?=
 =?iso-8859-1?Q?oG2fNWULsRKZI2S1m/CU7KuZTwu9mSMed+7UuklxmvIz7WL4um44F6zfn3?=
 =?iso-8859-1?Q?TUkPmEp9aiGWBtsGYbEcfdxB74XiveQ=3D?=
X-Exchange-RoutingPolicyChecked: XgQ2iehclTVpc5aNBp9aCWaJXn4fDqk36NZozvUYPrVYMSCv5mFiS4aLnkTacDmyR6kwmTGyPN5gTux2O+sYU5M5dNJpl7RUNsHRypYu8Y8W/BCscG/u8kPiIIg90hRJ5p2bSFz1zhT/vBeYtzQRMndWlgNFcTVJeWmuB7zT5Bg2BjBIMUiQD3buUluN1BV5retaesdEv5Sx+M5yUzLD+Z8tHKCA1KWGFygZfxLjvdxSsHZKlKe08GelmGJ3t2gqv55iJDwMDnJ42RwXktkNRLzoU+9sJm8sB8gK1oJM6LrKrI7UnjTkwRxsmz6tXWurMdf78xZ1JbrRl9SaVlFIAg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a26eb596-656e-4267-3148-08decb11e241
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 19:11:20.5506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: caqfp8dtGGWFdsvBz99LOAwgXlekSpHAhIIpJP/YJ+eE+dZJQdHMuWdG2kTGf2l8FJHFA+obEZA/jKLixCl9y80HFV4r7vh5INKJx3V2dMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5197
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

On Mon, Jun 15, 2026 at 11:07:31AM -0700, Matthew Brost wrote:
> On Mon, Jun 15, 2026 at 11:19:04AM +0200, Francois Dugast wrote:
> > The page-table walk framework may pass a NULL *child pointer for
> > unpopulated entries. xe_pt_zap_ptes_entry() called container_of(*child)
> > before checking for NULL, then dereferenced the result, causing a crash.
> > 
> 
> Can you explain when this occurs?

This occurs when running specific workloads for extended periods of time
but I have not been able to identify the root cause yet. But in any case
it seems like a bug to first dereference then check for NULL, it should
be the other way around, which is what this patch is attempting to do.

> 
> > Move the container_of() call after a NULL guard, so the function
> > returns early instead of proceeding with an invalid pointer. Return 0
> > rather than an error code so that the walk continues to process
> > remaining entries.
> > 
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pt.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 15ce77ce7793..123f97b9ee42 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -885,11 +885,14 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
> >  {
> >  	struct xe_pt_zap_ptes_walk *xe_walk =
> >  		container_of(walk, typeof(*xe_walk), base);
> > -	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
> > +	struct xe_pt *xe_child;
> >  	pgoff_t end_offset;
> >  
> > -	XE_WARN_ON(!*child);
> >  	XE_WARN_ON(!level);
> > +	if (XE_WARN_ON(!*child))
> 
> If this can happen in regular operation then likely drop the warn on.
> 
> Typcially warn_on means this shouldn't be possible unless somewhere else
> in the stack has a bug.

As per my comment above, it is not clear to me at this point if this counts
regular operation but exiting more gracefully when *child is NULL seems like
an improvement.

If you think this is preferable, we could also return -EINVAL to interrupt
the walk instead of potentially hiding a deeper issue, while still improve
robustness by handling NULL.

Francois

> 
> Matt
> 
> > +		return 0;
> > +
> > +	xe_child = container_of(*child, typeof(*xe_child), base);
> >  
> >  	/*
> >  	 * Note that we're called from an entry callback, and we're dealing
> > -- 
> > 2.43.0
> > 
