Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7313ECAC59A
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 16:34:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302E810E1D4;
	Wed, 17 Sep 2025 16:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lp0/cMOq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B836310E1D4
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 16:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758126843; x=1789662843;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rQELKUYb0te5XLKd1ovrMuoeDesb51y48rL+e9XGD2A=;
 b=lp0/cMOqc+Yuufyv5ZWksUuFGPuDh9AbVb4CZ1Z8xJI1y3H1oRXhlRwM
 vcI1XI4we0fywhadWcQ+EBiCwNrwIIyTprolVf/peprZ2kzlWzn3o4RjQ
 XXZYFbUdQOmqfRhee0ROXQDS1BUsrL94E9S9a5bFG7SfBK4ZhW2fQ1IlJ
 kYoScPtu2tqZKclIQEjTAm/0Sz+o9stnwEdpd5VAW5O3xDRwmzumu4Dy5
 puRL38nR5ZgF5+ffS/oLCOaZfVsmFtvDoxBw2c0i4oU52tTvvU9ZetNR0
 x0OR0/OgBa5Xh7rUS4STXSJJraOZ65KXRayMDjhqkOtnkCZYLgbIo0D+1 w==;
X-CSE-ConnectionGUID: Mz0Q4CsSSeKrElT6oIDFPg==
X-CSE-MsgGUID: K0ePlCC5Sw+IcEt7iUpdVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60498486"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60498486"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 09:34:03 -0700
X-CSE-ConnectionGUID: MuBsOSdgTkSuvRQmV7MQCQ==
X-CSE-MsgGUID: Pd2gWnpKRIiwBnZph977iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="180565824"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 09:34:01 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 09:34:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 09:34:01 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.39) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 09:34:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iuWZqYM+4XIxOtXOSx5M9pvBpMky0PK3mrxWgIiIX/p4KUw553wSoWaBNejm3xGM65guu9Ko82EC2rcXy42IuxT2Lsy/EtZDI4zkc01cgDfjp/UQMVe/I4Mtr/dafpyxOZPLMCncDIbqF/OLCyFTVNJlvCRMgHRapTO6NUk8lTtuuNKiCMeC0khlzyx2qRkgwHIq4OGVcqb+AGVXA6vnMe08qyuh/R96XIY5HhieYzUIS5XOewxidLNx2oDkkI+E1Sgqj3k60oW1W86huwRGGLz2XDFuhDRCHPgSRhBbkHrhHdEaQsj9ZLRj96PfaUSbwdUiQnO4Vy50S9c3mnnNMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arGluqyXFFsKf0rP7ONdG6GMJ0gve1izJid5e9KhKzA=;
 b=gAXQJxHf/T8PpU+yXAHWSA7FoQWSzipyUjcgaLBlYyfNTk9qNi5oDY+3SzR/jTnDFtHnMjSr1Zmr+4TXNtp02EiWqLfOeVrfFiR5P+RuTLPzUmFe9Pg6a5Zc7yppA6Q70QZiOTHj5psMXSxHwb1mN+jop2ymc2ce3F/WsB0keLeemhz2WBde08O+zB03Qb5qTAgZkEs+cBnKo01aQkzmT+XFJQ6q1LSkNpMQw5SP6YmjC4PdedqsASB0fh0iK3r6bVPwORdS6CCaOCylaYS0rf2vSk26zYuyB2Ex9l4Hx0ZXjyTh6ojzt5lQ31hXnQuZCgaAeW66Fgo+21pnvTmwHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by LV8PR11MB8583.namprd11.prod.outlook.com (2603:10b6:408:1ec::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 16:32:54 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 16:32:53 +0000
Date: Wed, 17 Sep 2025 12:32:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers
 <stuart.summers@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Riana
 Tauro" <riana.tauro@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v5 3/7] drm/xe/lrc: Allow to add user commands on context
 switch
Message-ID: <aMrirrRhhouFuW2Y@intel.com>
References: <20250916-wa-bb-cmds-v5-0-306bddbc15da@intel.com>
 <20250916-wa-bb-cmds-v5-3-306bddbc15da@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250916-wa-bb-cmds-v5-3-306bddbc15da@intel.com>
X-ClientProxiedBy: BY5PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::17) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|LV8PR11MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: 91fa4efb-2316-4dd3-ef16-08ddf607d8fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zux5Bil9w3fUCbwmxWqyB7tU3Zo1kKZewUBQIVADdxjjRRdevIVdvfe8itwb?=
 =?us-ascii?Q?WkY3lBAPSHO8rtXk2SEj9FXQz6ZhZS0KTSuZw5X5jJG0vuz7is6qAgFwTpj6?=
 =?us-ascii?Q?rLW5gJBQjGxaijslPKL7xbKOsC8jjlxrOJ5jDgyUPIfdVrCoQB7W7APAYbeF?=
 =?us-ascii?Q?KrjdSkLWvxp273C4ZDDzTp6aoEsfZFGvK5+5TSCWfWi0SuSisDxcBJRi8RuA?=
 =?us-ascii?Q?AMlmxuo/HSeAM4Pj40DetzeKWRzJMZD88GBoAWa5VtEpeFT95o3vLpi8mJ3O?=
 =?us-ascii?Q?76rfKqE323c0sw5REVTQuw0HRwWHKVRaQx4/1HnT6bbeykgV1Xl9KP2HQ1um?=
 =?us-ascii?Q?Sc8ZzvQixz/aI6IBScu4m9xC/J1QK1sd2ZGqwk6szeWBlQjXe63z4P3q5bcR?=
 =?us-ascii?Q?UsB9C1ut9t/6H6repTz/u6tBOj8K40LW3py5LyvjlGK4YLSwdOfchul9tIOW?=
 =?us-ascii?Q?28l2vKkfZx39/jLJSA0ZebiuZIRhsXvoisx59HydPE5+uSigzIsGroL5Edq0?=
 =?us-ascii?Q?rZ27W9Vc75oh8eAepUVLujbaYzohS7Sa5djjRI94qxFpWJJxaXSj9dr4ODi5?=
 =?us-ascii?Q?bu5K5aKl1QhO7a3uT2nlF2QoyE97aMyKjpO6lAcFqJ7tYAvlX10UpC7wuMhj?=
 =?us-ascii?Q?GzMiTQs7nKGn5YdTCKRsaBaW8yLcjHJkYxkG0iEIQ5Q/Imll/5AYzt0kdI5F?=
 =?us-ascii?Q?ZxknqVU5tAjqm5Hx+BWZIyx7KcuUSrhytTnXnAPRB64sCznTscM/QzEAOOCo?=
 =?us-ascii?Q?o3u3giKCiAfj9WvNs+0azV9q1yzPez5NjkKvATVKYw65pbwFMycPWPkFuCTc?=
 =?us-ascii?Q?97HPR1TqS8r8l70NgQBCAzscg0zahvZle2dFKKgkS2uEr9zbNWGWYiWtMR/g?=
 =?us-ascii?Q?Hd7srwLGn/Fvclz34oTEnMtQO9ddri9XnVZ3VtF6XZHDWHNZPkM/8zIribHt?=
 =?us-ascii?Q?1lEF5r7POciqmZAJxLkMBcteexNItZ685Vbl6hGQuDgKkwDwkvHNzRjTP1zr?=
 =?us-ascii?Q?C64AUQbcYWQjfT8WfB1nnUr8qIBT6QeVfsneRrv1Ju/BEqWuK4oTl2csrYj/?=
 =?us-ascii?Q?Lu9Q5oQ+8iVVwhvDZ4vVUQCC819apkg0woxkWYERbZKYAbW1v///5//pX+Cd?=
 =?us-ascii?Q?PeoLSEgNuejjbNcGdFzxopoyAnuVmPl3vX994xnz8fvEkMwuHQ1sq5pfYZcM?=
 =?us-ascii?Q?RKJSiiT08gI8iOttLqI/dNjfM4aki1/E8luoNlVUgSi/STvjbKYoRfJBlKCE?=
 =?us-ascii?Q?dRd+prp5IqLOcA6YTL5mKIa5jpo0b/XeZlLzm3nA3c9Ze+oIgRGyyS270YMs?=
 =?us-ascii?Q?Z8vBsDA3Ydrll6an5puHH9t8ks8NGicD/e2vFvkfNWSOMJXdFC9QJWkRxX6t?=
 =?us-ascii?Q?kkmg3wbCZ5Cf5/3dCINFROphDgzOzUvzQEpqj04flnBPx35+RlEoRpsD5/V4?=
 =?us-ascii?Q?Qq31cWmFNPg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?buUnnTzV2//jGmw9Hp8D90oYmkHYXYcuFfNm/gycrJqLx4ZOaOy1yJ0elPA2?=
 =?us-ascii?Q?N1fMaDN6PH1eF0BTETLdGyjVca7OuyGMpkJBI6RtZRV1PYxmCuhAKNgRBEdQ?=
 =?us-ascii?Q?+oiSELERv/UVIQOoPWpQntJaD5UlSwQow+ylGqvyoogTnKsUZmrOhfO+zXsy?=
 =?us-ascii?Q?/UCmCET3Mko8AfAc8mCwtZk3Oi4j4TGfTDOizy7neeQIV/O94/mgXjronvyg?=
 =?us-ascii?Q?rZEyBHuxa/zC7pOuU8xBW3O0iuDdvroTzr6esMCKoUbStMSHGDQIo7ks45AC?=
 =?us-ascii?Q?4uUBjYMk/fVJeAusakxrs5FGKXDdU6wG86giUEQtoG1Tzcst1elEJxN8J6qg?=
 =?us-ascii?Q?uwOGcDjZ9eeJEON7YFv4R7wbRcNcn4JYz3y+m4h+eOe0yfx5vZ/upEqs09XS?=
 =?us-ascii?Q?CMsZvoo8jFG4+URQ1Q5OcoC+d7XqOfx2+rpgqWFfYg3hTYeQKYl80xZedDYf?=
 =?us-ascii?Q?+kwqMefUOGSp067nBxORY4b9m45dE+iL/S1uEekPyTtWRcRGQDhLtMBsE3mz?=
 =?us-ascii?Q?jhbnSKqmAR3A8uwFH3z+RnGaYDTkzPhUXC+Sm8SEZpYdgm/Roo1I6mdlZ4lo?=
 =?us-ascii?Q?w1NMoq3ajQ/D47YF83POvf9592oqBPuHjpcR97l+KVLyH2fzX4SacjIZvNNw?=
 =?us-ascii?Q?8k8fW9A6QhaOUAxdchPlD7rk/3b1faM0cLimqLZTdy9zSuR7QyqvKLUFCRjJ?=
 =?us-ascii?Q?6eU6BvgxpGjWZuLcnN2Vd3fRAhhF3V/4eCi1wA14OJHWmfpOB57pkR2apHqW?=
 =?us-ascii?Q?B3snjtLeAC8e9GoaKAMOC0lTg6kN3ZnrwoJ5xBPKKNc5aANZIJzY58ZP6eZq?=
 =?us-ascii?Q?ZZUkBquyzy9a6omKnQrvbQeqVhq4s0tlTv5DvMtKv1zQbTT/aRAQxVmTUvq8?=
 =?us-ascii?Q?myene1ozIxzPnoU0/6VObX8resABD4/XdKh9bagHiy6o9O2I+McHr5uSOayU?=
 =?us-ascii?Q?P7U+N07XPdJi8YEKTY4zb0sEP79M70hGMkryT8NdlEIVco17gpl5wIpJds9S?=
 =?us-ascii?Q?vEDToPW5b5mNFuyPSZX1B8TyZKvl2/oaowJMrfNLiWY98+I4b/vyo8eFS2a+?=
 =?us-ascii?Q?SSSHHt940fvxu1UtrY3Fibu//SJ/rP13C6v5CVeBJK2a5ODXmuiAjuLjktuz?=
 =?us-ascii?Q?wVgSme305AnY0kGM9VDgm+t5v1z6k2wlO138bn1ZzwmqgWZLR734g4SURiOl?=
 =?us-ascii?Q?WA4DjeJ9tDcUm5gX7cS48gCsuo2xjEVW3BhahNLZ410Jj/uPqeOhTvblBbi+?=
 =?us-ascii?Q?4qNuD4TubDeOeX8D6P7knYig7WCbBR4dS+52IREkzdh3Wn544/lyGCrW7RMb?=
 =?us-ascii?Q?NJV0FwJp2Okaz/eLEXIuo5OfxlUc8fNnoXZ7a0Hw1ndgCYdKbqiQvY7yaneV?=
 =?us-ascii?Q?snk0O0rvB3FuQGBNcqXCQikg7wP9m7F70iNRI2AvuWdasOUKKmSxsPYw4WuC?=
 =?us-ascii?Q?xlnjHomw9Z268j/7ER6OsO037B0/v91pigI7AleaF1jK23dk0nN62kg75Ipd?=
 =?us-ascii?Q?XvvixoRRwGWVcq8isXij3hZvJMc0g/W42lV0Q1fWZLsVUgdtIiZlrv90s0zJ?=
 =?us-ascii?Q?+OQPUGIglHPRRK4YsrCCROkmpfBetti2GePO9Pan4UeqDnOgSQbuCUcp0yty?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91fa4efb-2316-4dd3-ef16-08ddf607d8fd
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 16:32:52.5663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3r8ou7obPfavdwEb+9PtELood1dcs2hnlAjG+h2FUWRzqyzHgOzZLNpFcSqXjp5lAn/ga4tPEyGFloApYEbfIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8583
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

On Tue, Sep 16, 2025 at 02:15:40PM -0700, Lucas De Marchi wrote:
> During validation it's useful to allows additional commands to be
> executed on context switch. Fetch the commands from configfs (to be
> added) and add them to the WA BB.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> v2: Fix warning when building without configfs
> v3: Move taint to this patch from the configfs implementation

Better indeed

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_configfs.h |  6 ++++++
>  drivers/gpu/drm/xe/xe_lrc.c      | 32 ++++++++++++++++++++++++++++++++
>  3 files changed, 51 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 45fdb6cf26b5d..d86c75af03278 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -633,6 +633,19 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
>  	return ret;
>  }
>  
> +/**
> + * xe_configfs_get_ctx_restore_post_bb - get configfs ctx_restore_post_bb setting
> + * @pdev: pci device
> + *
> + * Return: post_ctx_restore setting in configfs
> + */
> +u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> +					enum xe_engine_class class,
> +					const u32 **cs)
> +{
> +	return 0;
> +}
> +
>  int __init xe_configfs_init(void)
>  {
>  	int ret;
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index 1402e863b71c0..eff2645b5f593 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -8,6 +8,8 @@
>  #include <linux/limits.h>
>  #include <linux/types.h>
>  
> +#include <xe_hw_engine_types.h>
> +
>  struct pci_dev;
>  
>  #if IS_ENABLED(CONFIG_CONFIGFS_FS)
> @@ -17,6 +19,8 @@ void xe_configfs_check_device(struct pci_dev *pdev);
>  bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>  bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> +u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
> +					const u32 **cs);
>  #else
>  static inline int xe_configfs_init(void) { return 0; }
>  static inline void xe_configfs_exit(void) { }
> @@ -24,6 +28,8 @@ static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
>  static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
>  static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
>  static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
> +static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
> +						      const u32 **cs) { return 0; }
>  #endif
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 6d52e0eb97f54..c706585611d55 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -8,6 +8,7 @@
>  #include <generated/xe_wa_oob.h>
>  
>  #include <linux/ascii85.h>
> +#include <linux/panic.h>
>  
>  #include "instructions/xe_mi_commands.h"
>  #include "instructions/xe_gfxpipe_commands.h"
> @@ -16,6 +17,7 @@
>  #include "regs/xe_lrc_layout.h"
>  #include "xe_bb.h"
>  #include "xe_bo.h"
> +#include "xe_configfs.h"
>  #include "xe_device.h"
>  #include "xe_drm_client.h"
>  #include "xe_exec_queue_types.h"
> @@ -1102,6 +1104,35 @@ static ssize_t setup_timestamp_wa(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	return cmd - batch;
>  }
>  
> +static ssize_t setup_configfs_post_ctx_restore_bb(struct xe_lrc *lrc,
> +						  struct xe_hw_engine *hwe,
> +						  u32 *batch, size_t max_len)
> +{
> +	struct xe_device *xe = gt_to_xe(lrc->gt);
> +	const u32 *user_batch;
> +	u32 *cmd = batch;
> +	u32 count;
> +
> +	count = xe_configfs_get_ctx_restore_post_bb(to_pci_dev(xe->drm.dev),
> +						    hwe->class, &user_batch);
> +	if (!count)
> +		return 0;
> +
> +	if (count > max_len)
> +		return -ENOSPC;
> +
> +	/*
> +	 * This should be used only for tests and validation. Taint the kernel
> +	 * as anything could be submitted directly in context switches
> +	 */
> +	add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
> +
> +	memcpy(cmd, user_batch, count * sizeof(u32));
> +	cmd += count;
> +
> +	return cmd - batch;
> +}
> +
>  static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
>  					       struct xe_hw_engine *hwe,
>  					       u32 *batch, size_t max_len)
> @@ -1203,6 +1234,7 @@ int xe_lrc_setup_wa_bb_with_scratch(struct xe_lrc *lrc, struct xe_hw_engine *hwe
>  		{ .setup = setup_timestamp_wa },
>  		{ .setup = setup_invalidate_state_cache_wa },
>  		{ .setup = setup_utilization_wa },
> +		{ .setup = setup_configfs_post_ctx_restore_bb },
>  	};
>  	struct bo_setup_state state = {
>  		.lrc = lrc,
> 
> -- 
> 2.50.1
> 
