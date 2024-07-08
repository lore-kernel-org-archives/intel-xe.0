Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975C9C3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 22:19:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500D310E431;
	Mon,  8 Jul 2024 22:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BnnFHpRk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A00010E431
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 22:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720477197; x=1752013197;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BgerJAQRN4xcmvw7TYOFBCjD+kYHpHND3c+2Gwprn5w=;
 b=BnnFHpRkMiSZvRYXun3WDy4DouRqQkuY3sdXWPF72kBwtNxUh74uTx5d
 himhIRld9dfrpITUZjK3Ook1x+/hLjYoJfkj+TjHzISH40MJ+ziAW9lN0
 VO1LNMhqJzx71te0sAEjfkEOY9gH7lruh2aNBSxDwvY2Rw4dfB2iQ08YL
 SykNSxm65RANpTZgViqUlfsBh6aiiSEbBcg6zUYLmCXHIzNaVt8k9lqBP
 lqExlp0Abgx9UPq9LQoLxgY3UFTg475hNxMu0U3MNa+hRLtEEXNojapd1
 eDRWiWihyr1kdPNlG5NtVC5D4//Z67xmK13VW0l2pFdBomCeGSA7lrNsV g==;
X-CSE-ConnectionGUID: Co1MKtuzRYS9LXxWnNEaQA==
X-CSE-MsgGUID: 96eTi1ObQxmqayY5PTns0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17655649"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="17655649"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 15:19:57 -0700
X-CSE-ConnectionGUID: eAZ3eTLURgKJ4F8J9dCbgQ==
X-CSE-MsgGUID: KWRQpC+kR2CjC1EjZW3y8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="52586138"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 15:19:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 15:19:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 15:19:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 15:19:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nw1E46xK1EEDMmpxObcTIrSsLdd+44cBILrbW4oXQWbqdomRBK7N2ZJNaCkINFlIhFbin57/O5SgN4LsXS+r2nhRVrmvhlW9iV8gT/lbR4XvG2X4u2xmM8hjUjD5i/FXl8k6fEgDHpahrepuoGOKT+9iGF4PFwBGI+6F8KkeY5YkjGD31ygOUnt1zIc3vut6dKQe5KoTcBKFsHFzYWs05/ZcU2M2L4SuwsMljMZkezhg0jQOXFnzKarp5rhpGmVgwW2bZZvxHKhTxxEv5h17hnRlbEI9h8szSK849Xhs//0wPtunBkUPeyRe5KJQWUagaik8a6FrQXZfOlD9nI00Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Psi27HI2pMR/hI/Dzj1UYNJm/NaRi4R/1p+O+iQ/GQY=;
 b=Pfmu0sqb1wfwUCkdwB8XkFb0vJ1n9nXpM3Ga8fvB6wRR7VA1JCL3/czinFZdIEVTHoPgcqUbgvSYsraJU4jQsy/Vtyz2thdrLskWp/t5ijKhZmperkbipVwUa10wB1Ao1CLr/6GIlBi6Oy9ZbOkP57s3cN49DoxjQFWUcfOnkD5lrJVYJbgdsonBXXzi0F2KShSjT6qDKwCSfwTm0qz83B+PH3TU3Ekv18W49zysZCdeeoTyKXYMsQSOxVx8/cEeWTJCssGZXsUbWgzRmh96ZwKLgFD8EwsIRi1MoMdSZgRnzGutKvIqeeduK8dBgs22/JCOAh6CgWP9G5DtbJGlLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) by
 SN7PR11MB7538.namprd11.prod.outlook.com (2603:10b6:806:32b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 22:19:53 +0000
Received: from DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0]) by DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 22:19:53 +0000
Date: Mon, 8 Jul 2024 22:19:10 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/5] drm/xe: Add ref counting for xe_file
Message-ID: <Zoxl3lQ/xe9PBtd/@DUT025-TGLU.fm.intel.com>
References: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
 <20240708202103.3347869-3-umesh.nerlige.ramappa@intel.com>
 <ZoxYw1dsosvRTtkp@DUT025-TGLU.fm.intel.com>
 <ZoxlGMkXx5moSKvw@orsosgc001>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZoxlGMkXx5moSKvw@orsosgc001>
X-ClientProxiedBy: SJ0PR03CA0144.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::29) To DM4PR11MB6527.namprd11.prod.outlook.com
 (2603:10b6:8:8e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6527:EE_|SN7PR11MB7538:EE_
X-MS-Office365-Filtering-Correlation-Id: dc28e482-c120-4582-4039-08dc9f9c1712
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6SEM9KhDD/0YIE4tLRHBOEi5wdSLrzAJLCB1kQ4Ry50UTWsKwAGX3UJEypKz?=
 =?us-ascii?Q?6URu4M9nfpCckUMVQDI50MH5fj1NtPE4NjYIJqKXD1ihXO7OZWIBcJwxzgb+?=
 =?us-ascii?Q?rCv/dVeWqkU1gcyqYNt4s/5BmSUyDTh0ZWqYxqEeRB5MdSdxSl1wQ6UQGbcs?=
 =?us-ascii?Q?JkMQEGRsm8pobvl9wEUCcqpThXnOFszbsxz1MyBPrBhyTxNnRm8Nod7BSFzI?=
 =?us-ascii?Q?Nuh8ERggGlj69sz3XyxL2fLtfS74dE36gtHFvNdrvxXZV19ZnlzRQszx16gq?=
 =?us-ascii?Q?6xWpY5OQ8Zlx/pFhmnBThR8840HV8+QbXUC3SS8dFcquk1QQq9YquYZs2Sri?=
 =?us-ascii?Q?RYzHcAI0PtCQuNzZ5364GOWGb/Cuf6/yCUhA0dp6tRkTbEbvxhABQFYPCVu8?=
 =?us-ascii?Q?5cT3O+U3mYeyQaj6V4SNqcK6QYj2OzC6MjIPW4JR8RfM4ChesE/ENbIZ11F4?=
 =?us-ascii?Q?nyZUIRCsRJwvJk7tviSKZb0lR3q0MhjACJ+lkRvazxHWEwrMG/rX7Dt2TOPa?=
 =?us-ascii?Q?DdLGya4M8B7+Jr8zC6pYL6LDT6NHqlOXoVRkr2zQXJ7n+SqnRVhdqpea7rmz?=
 =?us-ascii?Q?SNUspDGen5SS0zvvMIVwQLn3RHPFjGCbhz/BAAktGhN9i+0YOOeWHyPVCqL2?=
 =?us-ascii?Q?byjawibYBk+XPa17NeCbSv21FviGDzHgZpQAdBgPCNsLTw4ufMLSNb6iUfIU?=
 =?us-ascii?Q?eBUif9UhXGQkJ6RdH+pSU0gMkEduxY8YAebAMjnAjg3KI22/whOpmWUdPi5w?=
 =?us-ascii?Q?MQfLi5+UqNcDgFQg8l0ktP9B+UNob4Hnh8HTYL+bHkQ1b1NeXqpkmdeRxdG3?=
 =?us-ascii?Q?Fm3PBBGKkPC8c/wzdYA2tKn1Wlc8F464s22+fvPEGu/daZZVeu1oPFhrStlN?=
 =?us-ascii?Q?AULN+F8W0MOLyzDWNb5Ntn4x4NcpoZCnnt2aywghrITtsJd3lKgeqMMLaY6f?=
 =?us-ascii?Q?WpLKlc1HxOjQKIf4hVUFXLn3vIkB4ItW4ZZSXnZZab1vL6vO6n2uxWI6aken?=
 =?us-ascii?Q?eiz030RmwOtor/ostxAtAO3EK9om0g3UaMuh1ELLOKioYZRsgMwiXY2hVjqF?=
 =?us-ascii?Q?t1OKdGT/uLBqsW8JXbS3N5uMOozQVZegzcfhl9VGII8lM22u+zG2s/uD+lsS?=
 =?us-ascii?Q?/KPZ+gOQOYIESxXEIgKvU8TTIwY7Weqi5+7mzgQcJSXaMs66LQMchDIS6Ohx?=
 =?us-ascii?Q?AcOXdaEiwBnaMgk7wPHwN8D7jXcT4BCgafT/giEhqQpYm1tSa9tXOsJbTuPT?=
 =?us-ascii?Q?nq7nXe4dYLyhGBxiX3hSa3w2IdyYO6GsT35Yks9ct3MUr2UJ02r38ICjc11E?=
 =?us-ascii?Q?0jSoRUbQ9hWVw85KGkFFp/ppbHJBvlAbaMumxWRUinlhzw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6527.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vlatx+KhERCAT819lB9REPYL+WflHuZtD+S8u9/TEHfmjpZ/R5wTYbTYa4aH?=
 =?us-ascii?Q?QnZNXZ4QZ43yPjJ8sTsIDfEDTYwCFvbIw8OJqzRrebdkDc0h3NJ6Pb81MmZo?=
 =?us-ascii?Q?J+a8GoA3laju0FugiN1pj52J1IZpUQ+wzjj0+qItdhRxSPXrrbDsCSWosi5M?=
 =?us-ascii?Q?WbEgtzWirQpnJPPCYymVt1MwS03LsZ1nBYjeoeGsSVJMAqEoyIsNQtI5P19E?=
 =?us-ascii?Q?22fZ/IF6HIBQNBj2753rWhJ/QTrGsbvxrgWef/80Kt1T04fdvg+xf+LQP+RC?=
 =?us-ascii?Q?1f/Z2MbIJdymPdOLN3Uwv7BVatYr2SufPlJwVVYYvVQpfVPqMF++rjYNYZy/?=
 =?us-ascii?Q?QHD+ZdGQop7Kdl3cnT734DwUOL6AOB5Rs+5EoyuhVaxvmUSNNco1OVIlcKbm?=
 =?us-ascii?Q?6UNC/Oy3tc5IFxgVBEi8iRFVK5fHgUpH/y+XGgmmHfnIfS0tOioEQ4bp5Ybl?=
 =?us-ascii?Q?ZTprU9/dRNw8/29bUtGnnQYLinmuYD6a/FG2UJH51Xj4fQFpIddEoWW9TGuJ?=
 =?us-ascii?Q?hWcAUchXCp15GZMPX2xAiWL5ueuIOn4bv6lnfcVxYMhA+aVPEjreBDSyhzYX?=
 =?us-ascii?Q?PGUk58TIkkgM3VGn7jbQLuUUBP3aI9SAQ4lmtAUTXbOjEfN1VpqmUq6yws+3?=
 =?us-ascii?Q?zCWbfccCqe9GanqVwZKtrhyB6dEJh8yVYLMxVYoQkrDoSPT9UTi5vc1YH7lI?=
 =?us-ascii?Q?NzQPeTE87P1lysNROVs84098FFXkxNc9ygcEO+Fh806kt3blX0yZ/8cg2xa1?=
 =?us-ascii?Q?EAfwTTBzqu88RswI5CpLDIyQaFzf8JEySOIL4wSbP2/ZWI2KsNG+ZjccSVxa?=
 =?us-ascii?Q?jc/OIbM4iuwS8/kHvThIy8nw/RPi5JpKEzOsOKaPun6N9rhDtxUNcnaX2aIH?=
 =?us-ascii?Q?U+ZXgmIv6c+brGfKfQ+zVn08Eb3MqjfSFocqKDlwy6KqtP0aEvP/PaCY9uqq?=
 =?us-ascii?Q?V9VU15ddrUiICZFWH7gemsa32UMhZfSRGfYnDP0rgx91oVbl39ijR7plmJFo?=
 =?us-ascii?Q?q7NVUiX+xDtwZ1elXgHfzUr8Pv6uHyjjikuTyQzkkcprFO5Qm5wZrNpCHaMU?=
 =?us-ascii?Q?CdfOWMSOaMM4Z6y96hMSR6rjycmw1Lywos5yjMUlWUPs7ZycrsOYT9i+XeCA?=
 =?us-ascii?Q?H+9GnwE79JNlPYQWxDHV+AiwBG34P9tkRVK8Ogc9fJXgKjc/9OXHYwHg3RrU?=
 =?us-ascii?Q?YX2l2d2sX2Wei9SKNuadIxevF1YX64aibSbScgHx3mcObDZZouHMcc/WG1RB?=
 =?us-ascii?Q?ykZjh+T6uKueCsXWCWuV3aeBdz3hBES8NuyepLlj96ixqtLbVW7aSB6l+KFL?=
 =?us-ascii?Q?mgpWn8NzlF0Vallc9gL+o9Q59gDjA4MAsyMIckQqA2M0ijm3TtP3AFG1togr?=
 =?us-ascii?Q?PeDsOH8NhDWPjamzoiuQRKhHOU6MQJEm7RtwboLdP9js6qmtme3+79NgCPUo?=
 =?us-ascii?Q?PMyiBSKbsjLQlmxnHVTnCj5qdBIOxdGgLyZYMoG2aReml4u66VgzY9SZgyqY?=
 =?us-ascii?Q?h7pM2rYLIrnXNNf1+KOaa6+u72zMWO6J8D+3z300BVlZxX1UfRJP5Ypqosjm?=
 =?us-ascii?Q?A3recy9jtj6xOG9XU3jGtxkl6wl5j5tNUDBJCrevuAbnTEUYv9XGBzaxJnBi?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc28e482-c120-4582-4039-08dc9f9c1712
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 22:19:53.1409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pH1Py8jzhzKiGzKHDbGWNxFtKmF/ha9Zr934IH3rlDCes7dnVz6N5Nl6oENt0HxI8KsgxVFdLSU2lMM94RgHyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7538
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

On Mon, Jul 08, 2024 at 03:15:52PM -0700, Umesh Nerlige Ramappa wrote:
> On Mon, Jul 08, 2024 at 09:23:15PM +0000, Matthew Brost wrote:
> > On Mon, Jul 08, 2024 at 01:21:00PM -0700, Umesh Nerlige Ramappa wrote:
> > > Add ref counting for xe_file.
> > > 
> > 
> > Patch LGTM, but a nit I'd make this first patch in the series.
> 
> First patch was just a refactor. This one depends on xe_file_destroy()
> defined in the first patch though, so cannot reorder. I could squash it
> instead if that helps.
> 

Fine with it as is if that is easier. No need to squash.

Matt

> Umesh
> > 
> > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device.c       |  7 +++++--
> > >  drivers/gpu/drm/xe/xe_device.h       | 12 ++++++++++++
> > >  drivers/gpu/drm/xe/xe_device_types.h |  3 +++
> > >  3 files changed, 20 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index babb697652d5..e6eacf1bcce0 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -87,11 +87,14 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
> > >  	spin_unlock(&xe->clients.lock);
> > > 
> > >  	file->driver_priv = xef;
> > > +	kref_init(&xef->refcount);
> > > +
> > >  	return 0;
> > >  }
> > > 
> > > -static void xe_file_destroy(struct xe_file *xef)
> > 
> > Kernel doc as this is exported.
> > 
> > > +void xe_file_destroy(struct kref *ref)
> > >  {
> > > +	struct xe_file *xef = container_of(ref, struct xe_file, refcount);
> > >  	struct xe_device *xe = xef->xe;
> > >  	struct xe_vm *vm;
> > >  	unsigned long idx;
> > > @@ -130,7 +133,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
> > >  		xe_exec_queue_put(q);
> > >  	}
> > > 
> > > -	xe_file_destroy(xef);
> > > +	xe_file_put(xef);
> > >  }
> > > 
> > >  static const struct drm_ioctl_desc xe_ioctls[] = {
> > > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > > index bb07f5669dbb..2a8b370b1fda 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.h
> > > +++ b/drivers/gpu/drm/xe/xe_device.h
> > > @@ -169,5 +169,17 @@ static inline bool xe_device_wedged(struct xe_device *xe)
> > >  }
> > > 
> > >  void xe_device_declare_wedged(struct xe_device *xe);
> > > +void xe_file_destroy(struct kref *ref);
> > > +
> > 
> > I forget if this is a hard rule, but public static inlines likely should
> > have kernl doc too.
> > 
> > Matt
> > 
> > > +static inline struct xe_file *xe_file_get(struct xe_file *xef)
> > > +{
> > > +	kref_get(&xef->refcount);
> > > +	return xef;
> > > +}
> > > +
> > > +static inline void xe_file_put(struct xe_file *xef)
> > > +{
> > > +	kref_put(&xef->refcount, xe_file_destroy);
> > > +}
> > > 
> > >  #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index c37be471d11c..ec2b0fb6afe1 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -566,6 +566,9 @@ struct xe_file {
> > > 
> > >  	/** @client: drm client */
> > >  	struct xe_drm_client *client;
> > > +
> > > +	/** @refcount: ref count of this xe file */
> > > +	struct kref refcount;
> > >  };
> > > 
> > >  #endif
> > > --
> > > 2.38.1
> > > 
