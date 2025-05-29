Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54309C54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 20:55:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1256910E785;
	Thu, 29 May 2025 20:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V9h8SFpN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6070510E761
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 20:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748552156; x=1780088156;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UDM0CKbbYwtf0QVW9wH6+jPqVpBJ2mQDAleQshovSpE=;
 b=V9h8SFpNytq5+gCTpRF/SyNXua9s/dViVuLRQdWSbXDGGXWsadvMH3Lh
 e5qGqb4svH//CaopszZEuNkdtV7i7rPh1vaKvPdaKCJgSYikUX5RA3nl0
 6WDAeZ08TlVwROLkChw5QJdqCJUJGxS0q7V2NaaSgX8zVPwoHxHo4d6Ze
 uNO21XamQE+KNaHw7c/pX9B9OfjCa9YkUFeLa53pSUrNw1yH0NvtMr5s5
 J/r5Sq+YITNk9n0pLMGZCf+JLc8HQlWGc0KT14O6Kaq0GcYQ62bI1YAtK
 aWYIph1c5hd8gp6L3SxupO5PsiqzAtEA0BqyTqUGM38a3vbKyNvbzxza2 w==;
X-CSE-ConnectionGUID: 7m5GBIIMTOWim6/mZNfaNA==
X-CSE-MsgGUID: TO2BoWd3SWOosMSkv9O+dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="73166622"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="73166622"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 13:55:55 -0700
X-CSE-ConnectionGUID: t6vuk7YLQCOz5WeL9OtH1w==
X-CSE-MsgGUID: SDianP7eT6mbkPK6z0PIgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="144008456"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 13:55:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 13:55:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 13:55:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.62)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 13:55:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x1r4VNnFceOkJcfgnjF6GIoKPzdDoePuoNUU2VUYFBRSm7FXhOgi27AGDuzNwpnL2ZoFIlfRqEa3NEbq6Tf3a07gIA9IRcUG+H+nEY0ldCi12VcwV0C0gq0G5Lo3kBKNX5+lYYWM0YBgaNuEGdydSdEcZeTFp0581v5TwVLNfqEimYhr0hseRraON5G4WWvfVgLiDKDoOufRu3jPC+jt8hLXf98cX828ltaG0fzMGdSXRcjrOjxO9vxDETpIyx4lfy4pK+ojjxc4Xonc8jvkY5IFYkTQPHCzS3wDlmywPkBY+qrjbni35ePS8zk3aQEmuLKOi8UUgVhwnG1Po9HYlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ll43WmEb+U4e8iXqzabbWZEGFRzaXSpLDqp+mDRKexs=;
 b=Cyufvw6gH7DJo/za0zQWF6GKsIUh4hz2T+3pArioLmPmkE9R3rUkvzaz9AqfI/BhBxy1YyPxnHHrHUSqPEhlZietAMhldKrE4DxL8bFFqERQq0Ath8RCNvOr3l51Rd4wO4Gdq9Thjq4AmQMhwY6DUm7VRqIbsga4UTmqwceGZPRv0eEH8JmmeX5HIh7W8hrlBVaqUdA44o4gT+xJI0ilD79N9k02vKe0MfKQJ+m+DPuJwjtB2RPBuwBO+M+7LYqsi0Yr3F0i3tZaRicAWcvHYB2X9zbmOEa5FFZfGe4159ytNcCYPQfkuYhNY0brV/DuN4clJMPJv9Tff9+htI2rUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB4960.namprd11.prod.outlook.com (2603:10b6:a03:2ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 29 May
 2025 20:55:51 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 20:55:51 +0000
Date: Thu, 29 May 2025 13:55:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/xe2_hpg: Add set of workarounds
Message-ID: <20250529205548.GW5080@mdroper-desk1.amr.corp.intel.com>
References: <20250529120534.531237-1-dnyaneshwar.bhadane@intel.com>
 <20250529120534.531237-2-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250529120534.531237-2-dnyaneshwar.bhadane@intel.com>
X-ClientProxiedBy: SJ0PR03CA0032.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::7) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB4960:EE_
X-MS-Office365-Filtering-Correlation-Id: f4cfaf85-d1c7-4e2d-9104-08dd9ef33237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J0T0OQ5XIqlU00grjBuYsDkcGOcsUsNsh5opQfsSihjZeoQTprH98dF8H/2K?=
 =?us-ascii?Q?pA3LcEG+VCK5dL1o7v1cAImnMrBklUAEv4FQpW/RNIEWKXP2zOUdModV1pUK?=
 =?us-ascii?Q?/v/7vsrCu8koC2KKxdkYt7VE9IIVonCJFUeZxogRKpI+V3qWMjFtIVC7ivW8?=
 =?us-ascii?Q?lq+rBu8T6aeXBVNnsSzg2ZTpRbo1TSUe9pgO1E9LiH+dJqtC8gya1PtcSBBx?=
 =?us-ascii?Q?TnBUgzj4rkMxy3U6/AT27/7fIDQW6pCU16G3VsjSB/OZH/BJos8WB6lEklDw?=
 =?us-ascii?Q?w7nU5zEXN4M8ptmS+RDQ2I8UOy484DO4YvKxZpyB1ZfHjYF1UX1g4iJCX9Hy?=
 =?us-ascii?Q?6HClSOU7HNati5La48Mon/Ndw5jRnKwXlR+HLUrdbbnTSivMs7I8q5O7qogF?=
 =?us-ascii?Q?WtI+oA7ZMABPtSAX8YRidZ2nFSPX0MhbaRGnPmr7rIY4NesrS9OB24Ww/zx0?=
 =?us-ascii?Q?0wSEsMG2S6IRnquiM4ze+Zj3UPJr6S/mx6cPXbS+mK021Iu0bLFRSBqUBXnF?=
 =?us-ascii?Q?/dYU8528YEjROkmiiDMNX/N2gn7ARvYoHZ/XLCk6ChESGFdlkyHd+ROCqATY?=
 =?us-ascii?Q?xQyBOl5pJlndayVI6CHIgO9nq8t6AJ/Kzd4BQLihXerY4K49/Xy0fpEsAavn?=
 =?us-ascii?Q?oQZtVcXtPJrQJFw+qXiRhdCppWcfXc5lIBL2xl1VqP6XGMcLquoiht/FiWCg?=
 =?us-ascii?Q?ozoCMMUWt41BfFxd0dQ4adgwAV113SGKsgip6O1d9oHT108oW8O1PDBL6Ai5?=
 =?us-ascii?Q?1NPlax35/ueAzSW/YFns7AKWVCltgS+5LeNRPn/KfBbSaYolZXKXjJRQ/wGH?=
 =?us-ascii?Q?8SjZXpc0AuzKy9PZHJVvbZ3+kXVz4UaT8NAbEpTlX2DdpDY4rndnlKtGjYCA?=
 =?us-ascii?Q?IpNig9Vnb+IiFKjVfvitIyZaWeqmdz3cagE5mWut5/ahxd3kEFapNJ5Q2kko?=
 =?us-ascii?Q?bSmawEG/dzQEe6p7pjpQayGiu4e2Zqx1HODZYLJ103Bj75S4/zG9J6IxUAL9?=
 =?us-ascii?Q?JVnXdUzBvIeL2W5eS189f1haehsMpT+N2JuorbE5XLP78ogbLcvkusBHw70P?=
 =?us-ascii?Q?OMZ4Lx1LL5wEFSlTbqa7meCjHzIm1CQOCixePOqD10FB6AJBYhEK6Nmi4hsk?=
 =?us-ascii?Q?RwQ8Oj+E/B5cygio4AForjBKXbMzO0PpBo1+QUurAsS+ifMaLgP92oz2oXLA?=
 =?us-ascii?Q?8OmnoRR8DE4uCQ0BNktGaVCN5XRMQld+jycTe7gsYQglfqa0rwRUOp+hhPrc?=
 =?us-ascii?Q?mAhoTQhMIoMqRxQ0KeYVEvysXmz1keJ9XiOUKIkIFY3LDMK+pEhTlxqh89Bw?=
 =?us-ascii?Q?XhS4wvQB0q89K5wTdlTUw5ALxakY06MxGRM+ra98kLHxoaDpo7IKiPJOy6iJ?=
 =?us-ascii?Q?wLh8+krIjUg8mzEH/el5cTAZJsHvqrEUw7seMdPeY/Pz3Bqigaabd8CMohiq?=
 =?us-ascii?Q?ko3+Z3EbfVs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F8Uvj6QSGWvN6aQP3czFAG7nmJ+nmf5cpe326S8TSE/Xmtvlh9oOBkr13TS3?=
 =?us-ascii?Q?wF2t27rUIeEMCBd8EMNlmSV7H9mxGdAmBzcaDcsNLOSiQMN/1vinxnFpHNOt?=
 =?us-ascii?Q?n01rC+ZWYkzoOY1A63eTteFoyo/+qD17ZM7RLOejQ5JN8B+41i7LjZ0dKOxR?=
 =?us-ascii?Q?EUjlWLreF2pNBkjPhw8k1nNVxojbR7KeOA3i7GeYAcXKmYgZrUY9/XcKi7Ys?=
 =?us-ascii?Q?qih5vtwXj4uvRY8sAp7hRu8cOq3yb0bW6MNnytgkm8hxFR8IkZVpIbswIN+q?=
 =?us-ascii?Q?RUJhYp0f+3GFKLUWp8DLGAchyYoxx/IiPPpOX4mMKzN81A7N4lv2CgtOQgBm?=
 =?us-ascii?Q?3aFzN/dacFCz908mhoSu2U2ILdtcr1wVnfSwgI/rxpoPABLYEDli/AddmUJv?=
 =?us-ascii?Q?STY65WK6ciCOZnfXn8N5G8pC8wax42bofkE4giwvDV/l7SfM1nu8d72gXo6t?=
 =?us-ascii?Q?z43bUoyqabyqCm6JY/a6L3n/EZ1hBZevCjw6gxLlwFgseGbVkv8CBr+KknF4?=
 =?us-ascii?Q?ZNOkfRRBq5vpvG7+oPtBhjFmfiDBKeA9k9XWzXVGH5ZhXHX3Vl+TjGHAFGV7?=
 =?us-ascii?Q?rRr6dC4kGrgpaEznce4/LBilCu3y+mWcHjURByifqhAIaR9b7oQpgO97Fre+?=
 =?us-ascii?Q?YqT5xtpYr96pKTwey7+lNJGrJdqWuCs3XxJPB81E/fevB3LsW1UXSvFSmRmo?=
 =?us-ascii?Q?gUc7Sig151xKuCW6GNGzHOt1rK4xenlHOa5OVgOVo9oOpCsAHOb7yNuTpZRF?=
 =?us-ascii?Q?o1zJXl9BSSydy1rYjJPBk5wWBKmYJbi9X67T8iOjJoQnc1bck/qd6YunXuzW?=
 =?us-ascii?Q?Pqfg7GoURuXz+tkxMFeNEwcMihudmvyp9+o5mkhSx3wvVdjzx1IxtZPrb5Ov?=
 =?us-ascii?Q?kunPx8F8+AsmMeIVspfi5dpkNYSmaMs5M5x0BPkpww236ycR0u0yGd5lYhCc?=
 =?us-ascii?Q?ookXjPoRFwrHoOtNoxxcR68N9vvBIBgKOMz/PhrKxEDdHIvZS4GHEWcDAf4D?=
 =?us-ascii?Q?dNLBjbGxlKujr7QXlmE3Mn342zK3Y+CI77aEaAE8DFL0KSOhbVZelqeX6weu?=
 =?us-ascii?Q?nKp8c2zwfGRj6y685wWpIWzEz78nDIPeKLEpKcuQI5kwfliGONuEZg7by40R?=
 =?us-ascii?Q?b+xSfCjurSxVfB05VM/xBi0dGXIKmCgvE78tqB4p64JxVqC7GHe4FrXXG7IH?=
 =?us-ascii?Q?Hmf89jI2SOlzCzpi8PyUkduZjh71Wup2quhv7NEuJVjW4A+gLk0sSACqJ0jW?=
 =?us-ascii?Q?raLfI6SHMXXTO+V8e4e/jjG80+yMwtmqlrswlxnRzEhWDqGyWoekiwY8sYmv?=
 =?us-ascii?Q?B3JIVa1BpYbIo1/he+Zg6AcD9cpgeCyYTgCujA4MLSanCeeRkDz8QDbST6xL?=
 =?us-ascii?Q?tXifLF32lzh5eBMYcN0txHFi8SVPJBGXwkAi0E2L3cVBm990CecsNaG9KZaA?=
 =?us-ascii?Q?F4fFj9I2uBM4EgKddzFOSgVD8wVpQFk0EpuMf7gweG6VcU27v0ie8ASiRws6?=
 =?us-ascii?Q?4WDUoYXsct2lzUduwNcguJIDBM9BQE13QevW7Q9M3ui90snfbenmahf158LC?=
 =?us-ascii?Q?mU5+d8fOvUGrXKifNr4dWyBivg+9IQqlQ4GjrEuvscmyQoNNAaFsHxZOsITv?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4cfaf85-d1c7-4e2d-9104-08dd9ef33237
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 20:55:51.5930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O0wwZvOOS/gTFPqd7UEOFdavzXMdOm8FC/7TF0Af6FIcYZsPZkECNURx5zlLIhno7SG1JVTdCi4Bypx7wmFxZzXOZcppti9cIwykRc0H4Ms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4960
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

On Thu, May 29, 2025 at 05:35:32PM +0530, Dnyaneshwar Bhadane wrote:
> From: Shekhar Chauhan <shekhar.chauhan@intel.com>
> 
> Add set of workarounds for xe2_hpg.
> 
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c         | 56 +++++++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  5 +--
>  2 files changed, 42 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 67196baa4249..11c1fe3b2ea4 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -489,8 +489,8 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
>  	},
> -	{ XE_RTP_NAME("18034896535, 16021540221"), /* 16021540221: GRAPHICS_STEP(A0, B0) */
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
> +	{ XE_RTP_NAME("16021540221"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),

I see we broke out the Xe2_HPG handling of Wa_18034896535 into a
separate rule, but we seem to have lost some of the 20.04 handling in
the process.  Although Wa_16021540221 only applies to A-step of 20.04,
Wa_18034896535 still applies to all steppings.

>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
>  	},
> @@ -533,31 +533,38 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	/* Xe2_HPG */
>  
>  	{ XE_RTP_NAME("16018712365"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS))
>  	},
>  	{ XE_RTP_NAME("16018737384"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2001),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),

It looks like this diff was just line wrapping with no function change.
However looking at the workaround itself, this is one of the rare ones
that the hardware team classifies as "driver change required" rather
than "workaround."  I.e., it means they've decided to make the
suggestion "permanent" not just for one specific platform, but also for
all future platforms as well (and it won't show up separately in the
workaround database for those future platforms).

So this should probably turn into
GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED) so that it
continues on forever.  So that will make sure it properly covers 20.01,
20.02, 20.04, 30.xx, and anything else that comes after.

If you want, this could be an independent patch since it's technically
not specific to the 20.02 version as the other changes in this patch
are.

>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
>  	},
>  	{ XE_RTP_NAME("14019988906"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
>  	},
>  	{ XE_RTP_NAME("14019877138"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
>  	},
>  	{ XE_RTP_NAME("14020338487"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2001),

It looks like this one should apply to 20.02 as well.

> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
>  	},
>  	{ XE_RTP_NAME("18032247524"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, SEQUENTIAL_ACCESS_UPGRADE_DISABLE))
>  	},
>  	{ XE_RTP_NAME("14018471104"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, ENABLE_SMP_LD_RENDER_SURFACE_CONTROL))
>  	},
>  	/*
> @@ -566,7 +573,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	 * apply this to all engines for simplicity.
>  	 */
>  	{ XE_RTP_NAME("16021639441"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002)),
>  	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
>  			     GHWSP_CSB_REPORT_DIS |
>  			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
> @@ -578,13 +585,24 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, WR_REQ_CHAINING_DIS))
>  	},
>  	{ XE_RTP_NAME("14021402888"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
>  	},
> -	{ XE_RTP_NAME("14021821874"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	{ XE_RTP_NAME("14021821874, 14022954250"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, STK_ID_RESTRICT))
>  	},
> +	{ XE_RTP_NAME("14019322943"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2002), GRAPHICS_STEP(A0, B0),

I see this one as only applying to 20.04 A-step in the database, not 20.02.

> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, TGM_WRITE_EOM_FORCE))
> +	},
> +	{ XE_RTP_NAME("18034896535"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
> +	},
>  
>  	/* Xe2_LPM */
>  
> @@ -774,7 +792,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_ACTIONS(SET(INSTPM(RENDER_RING_BASE), ENABLE_SEMAPHORE_POLL_BIT))
>  	},
>  	{ XE_RTP_NAME("18033852989"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
>  	},
>  	{ XE_RTP_NAME("14021567978"),
> @@ -807,7 +825,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN))
>  	},
>  	{ XE_RTP_NAME("14019386621"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(VF_SCRATCHPAD, XE2_VFG_TED_CREDIT_INTERFACE_DISABLE))
>  	},
>  	{ XE_RTP_NAME("14020756599"),
> @@ -824,13 +842,17 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  			     DIS_AUTOSTRIP))
>  	},
>  	{ XE_RTP_NAME("15016589081"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
>  	},
>  	{ XE_RTP_NAME("22021007897"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
>  	},
> +	{ XE_RTP_NAME("18033852989"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
> +	},
>  
>  	/* Xe3_LPG */
>  	{ XE_RTP_NAME("14021490052"),
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 9efc5accd43d..efdeb55cd6a8 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -30,10 +30,11 @@
>  		GRAPHICS_VERSION(2004)
>  13011645652	GRAPHICS_VERSION(2004)
>  		GRAPHICS_VERSION(3001)
> -14022293748	GRAPHICS_VERSION(2001)
> +14022293748	GRAPHICS_VERSION_RANGE(2001, 2002)
>  		GRAPHICS_VERSION(2004)
>  		GRAPHICS_VERSION_RANGE(3000, 3001)
> -22019794406	GRAPHICS_VERSION(2001)
> +		GRAPHICS_VERSION(3003)

While correct, I think the 30.03 change here might have belonged in a
different patch, not the Xe2_HPG patch here.



Matt

> +22019794406	GRAPHICS_VERSION_RANGE(2001, 2002)
>  		GRAPHICS_VERSION(2004)
>  		GRAPHICS_VERSION_RANGE(3000, 3001)
>  22019338487	MEDIA_VERSION(2000)
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
