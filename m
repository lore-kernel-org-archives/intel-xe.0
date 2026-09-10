Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BECC88E41
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 22:30:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D9B10EF9F;
	Thu, 10 Sep 2026 22:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PqY3munG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9549210EF9F
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 22:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789079410; x=1820615410;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eIrlXjGm7nVGJOCsgCgt2qA8X0qfMFcGSGV+ZWOBKlQ=;
 b=PqY3munGLZVkfk5iuNLBZidgKKhubhDZTz7o/d7DMVTPWdxLYHNMuYMW
 9KR+3tN8uKWhrp6i1kETJ/nQUcUmRWlBAebPwdFNRobk0mQ5XJVgq3gNw
 RxFpJKFt5COaStYKt51Q5DnJ4NHN7IMRt4731SH3K5NQNx3Vi4Hz9lKPZ
 psBQjjgjRTJvrFfavs+fdJCl9TSMn5LV7CKDIhvOn2y/rZQu08Ua+p6sL
 BLVwEdMwAdFXH44B9q4WZs5sMEWzfdUCXw027bwzFD+s78kOxWtoJnYeI
 nz4P22lolv6SOpXHYKHK2jwZoSr8yYjTrmmt5KFGDncZLHgvEx6bm695W A==;
X-CSE-ConnectionGUID: ixl4DVgeQxWRQr83H2IQOQ==
X-CSE-MsgGUID: WI8f1MgFR96+P34GFiGH/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="107057777"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="107057777"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 15:30:07 -0700
X-CSE-ConnectionGUID: IZxX8jwoTCaC2wWI2repuw==
X-CSE-MsgGUID: kSWShODFRN2ykwJg8koWIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="310008716"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 15:30:06 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 15:30:06 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 15:30:06 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 15:30:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EnbqeIXuhclpCXQn95dqmBthrHizE0M9EqdDsM377evVTX2vbeQPfH4D9SnjLBd+OEXPvRJESsmaSFccw2O73mrdmzIvhtX1HtJR114I3abXnknqDaQ2quZfx1+68JzUbavl78+FD5nWPC7GEfrWyG4366jYdCpU5ioJRljcxjegDlXPQCtcUe3VlIiNyNcO8JGE2kLsToF6u5WF3v8EnvOWPhRBfdI5Uu+hEQdtJiEh3HrKX3KcwUat8xHfyRJdfXMJfEfLzuXkYVA34KXVUgUZdmpoWO4zRHGRwO4PPhB3EfqJHo09A0M13ES2KpdxSkkg1SgODEmSaZwtdvAEzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nwC5BPIcHfbd4bh9+KO6cp+V8nx/id8kLcVE4Jzu7I=;
 b=XKrNZiluDeo3BSZj3uQ2rNdysU72kn5OWd1pyDQahWKoES42MDxoli7Gt4XnmfgxzqhZ5lQ6j1g2YtjdTwO3gLclrxZaDqmzJkTj/OsOccnDLBkAUbXIACWvDHerIitF3iJJDsyUKu0PRzF07mU623YYwIImgXRFAqjHs+dZPw06EtD7H0I6N5vKyOXnJ1G7+4OjH3czBwws7gcuFD877d/g1YDJUhb/hXh9vOVErlAqfhNvwYugLeyaSp9fKV4BqVGlqcW/IINSt8QQ2m/ALLfpqyimkk6yTsL/qviS6p0gk51Zc0gWXOYWf0sNtIy8g0t0Tc0YhzAX2FQiYVSCpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by MN0PR11MB6279.namprd11.prod.outlook.com (2603:10b6:208:3c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 22:30:03 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 22:30:03 +0000
Date: Thu, 10 Sep 2026 18:29:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <daniele.ceraolospurio@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <michal.wajdeczko@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <arvind.yadav@intel.com>,
 <syed.abdul.muqthyar.ahmed@intel.com>, <nitin.r.gote@intel.com>
Subject: Re: [PATCH v3 07/12] drm/xe/cper: Log CPER records for aggregate
 counter retrival
Message-ID: <aqMvZQ79TYVpMe3M@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-21-badal.nilawar@intel.com>
 <aqJN4Gfv7cG8viB1@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aqJN4Gfv7cG8viB1@black.igk.intel.com>
X-ClientProxiedBy: BY5PR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::39) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|MN0PR11MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: dc0fbdd4-1729-470a-0fb7-08df0f8b0e82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|6133799003|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3iGOUXGelEPT1xHLVZzh9J7XylwZW3uEzwx5inrND9JmEk00uKeL5OedN6QwzIzDqTStY+q6ltwTMczdHv0Gy6aNGJQBDhd2qyDEdumVgdh68krLpqm6gNrbZ9EgIC5xIqPb7r+/R53J84zaA0rTSJhoNNmw4wbKYxxzSjfvt1fxdsTIzQwePefYR03bW3QSd9WYIpzOXWmxAp/beVHRuvR152No/42o6ryz303w4c3nh97ZqeAyo3Gb3T5ZmlVvtN6gbJm+QtbzWLOWQxoMVC2zrI5QjY50Z3t2Kxk9nd7X14ovJTzA+sJEX53ML1IJhkqsEENoqGbT+yxYjKGKIAtdB7X0nc2KjtucreKC9K8P9adDH/ln5i/c7baVTiw89Zg7qVe3oLiNOrUTq6LPh8dZ99MIqeE9u536NZHqQfyFcshKd6Jz2//342lgiXYBN0+aPH8u40I6gNqPxB10w/BXsScLVRi8KnlDN94pNPTK3P1n5MP2mLRX/ein0Pw/7Fek52ez7sZyljIhDgpreUvSF0jNXmSKFwJBVqIOkLA5i9Fjs37LZiFhsd/3bdPaGrKJvEusbsr8Sm4xo0Il8GExwJdC/R52ClziKMoh1cKxlUzeOS9ke3oXD1qUVedFBKUNeQDIiwvxcPL+nMq9Ypb4EIJVRSWxVwHHtdHjGn0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KNcG6ZCjlM33bANtARClqBZq5SQUGSNwu2CP0oJ6HrZG362iEKfyHgBM8MJT?=
 =?us-ascii?Q?HOxHgnavqm7y4cVG37eMlvu35/s3kTc3bSn+eZt/Dw85+Yw5lfa2/CBzA+Nh?=
 =?us-ascii?Q?HFI3fJbz86yBI4oKJcjiIdP5hUdnRd0y56ozgK9aXRf2bht9lcLmoOQcwaq3?=
 =?us-ascii?Q?YAt98i6mMzNLKQ5vmPHWXlo9NTblDc7f3zN6xAmwlIUuJIvjcrX4jw5sHwe3?=
 =?us-ascii?Q?poZOkva0r6z24P8cVzA9mptp1WqMUGA/NKdqhCqMauNZb3l+ClWM3FKMAbLK?=
 =?us-ascii?Q?FycB3xR3Dx2e/2BntrnrntGJJGUbAOtsXvtVt7sxabrQ2tNKDoJnra7SQ7cv?=
 =?us-ascii?Q?8h4igei588jNL9qrhFLHrPY4kttAdY5enU/6ec3eCDjhxAk/+CciYQ8yovrz?=
 =?us-ascii?Q?InAIAY8zk6dnmJH60geAJLk48PewTMP/lmOIq82qgl/NJzrLNBGifma3fZYm?=
 =?us-ascii?Q?79wkHCHFo1oHLBo1vC9/60bNcOEq/alaMS/hmz/wxVs78OX77RktmK5kTFox?=
 =?us-ascii?Q?AKxULwLEc7JhQIwfA20VTvyPShVHQ3MkcQFqd/tJke0mm+B1XzKlG7K4DkdT?=
 =?us-ascii?Q?2bQqaZSZCKM+O1tbP6Iv1Ys5b/Cz8k2QwCD5abVstjfJnjz1sEzP2FM5o6zf?=
 =?us-ascii?Q?8XFRM7q+pOzaTkuFxfPnAtMXeQj2d3ER7F1oP/8FL5xP7mXQeR6RwCprMxyy?=
 =?us-ascii?Q?b3MykAJyzRutHP6ykIop3GTmKwk24cLynjSUVX+6+hDe4jRdG+vJ1ZsSW4O6?=
 =?us-ascii?Q?F4ppr3N3A3g0VKaP94Ltw2BhE5/Vf/Lecdej3jCNQIy52o9+UWeirWUCvBrM?=
 =?us-ascii?Q?4Y1y5LOCd+MBuM7nou4hKZ2S+keC8YEcwraylvj/NoasNqOLHp+vFpNCu4WS?=
 =?us-ascii?Q?M3YI9sN8Cy9ZdXlvakmH1YwUIwsneTplgQ97Q/W2KgF7ihg4NQRiiSL7j/G1?=
 =?us-ascii?Q?vCkWGoCdlbgqd3TWmaf5kfmebsI4JgJadKKnEQJ3enpdh0zkAQqu6p5JOUTx?=
 =?us-ascii?Q?JoeTeDfRfagn5f8iwWVPsJ3EVTDqVgvgZEQg4JuKgXkt+yXn838rSJxm/DCz?=
 =?us-ascii?Q?/z2Z8XFXdNmbWePTN05p8nLuRHRHiu9xSTKUXkBu4iMrlz2ZJoqcUaZ2aHiD?=
 =?us-ascii?Q?YIf1aGt+VtluXrCTc9zlBkTVgLlre/dRCnqGB8+kTP3d0UZi38fQ5Riyjtz2?=
 =?us-ascii?Q?RXaUQx0MDQwDW1oQG+Ze2hpPG48H9GY/95GO+KeRmG8KgTwN8f2m5jfUe7vD?=
 =?us-ascii?Q?g8QQbdLCKW7Cz8cdcsac0Bbjyyx8FlYCCaCkeJMEFkKHyU1Jr2e52QnAjRo8?=
 =?us-ascii?Q?7nnIb9ZVIx9e7bugOR07eFv+081p+c8mLV9Ha8JPs8UNTd/WJ7yWefrofl03?=
 =?us-ascii?Q?vAHBxxm+ckS5S+SyR+DACgYb1CuTC2rvR7VKMUl40Q9bdSSXNLBNyPJSENiO?=
 =?us-ascii?Q?IEfTkv549an4HpNcSyunHVeI+kUAdGClOx+rINoBYLeMOUJ63uXeEzq88z/g?=
 =?us-ascii?Q?38HsJcBfica58/1tzYogNEOdLuuV9+/hC8iq96XUipRO40ciaBBFdrnIl9BA?=
 =?us-ascii?Q?LTiSYsZV/L/IUMa0pk9oWENOTxh8e9vJUUJzX0bvGXXLz8YrZKEcY6wXduu1?=
 =?us-ascii?Q?hsRfkN6u6jWrMkQAR8N81gtWMe4quBHAc5xPpL/9M3FSSmkNgnLHUGqKrC/q?=
 =?us-ascii?Q?OGbdjPq3JYDWQgJY6XkndCwLnA4U197zcGhxzKmIjLFU/xfAtYk27Um83KgF?=
 =?us-ascii?Q?ZQK+wjaIhg=3D=3D?=
X-Exchange-RoutingPolicyChecked: AQEEwVjCk0/IdQkmk8OtUv51CchwgaFQDYc0BQ0b5U8EwwRsJIrFD6t41z2VDzgDF/CiKLRByBQdXLR5lWRr8FmYeTf/bkJhmjOGbhlMHw2q7WFE3FuWtuLvhSX8ETyU4s/x/biplkmOj+2QkDnSvWR/aLqHsmFVhXCMe//1jtqptbBpp8yfpSQAjAUk1/a3qGayJySRAZWuHbFFhgBaM6PnPEy8ZA1GMgaX9WfxP7qyWi3MUIIWWdl82Z0h8+n6o8A1f+YOo/QL/eaTmQp4un5CMA7glSEWOeCmAqNHk1VPfA6yvlkKHknjK/Y9mhFK1pK3I/3WyVpMp60oS1sgFw==
X-MS-Exchange-CrossTenant-Network-Message-Id: dc0fbdd4-1729-470a-0fb7-08df0f8b0e82
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 22:30:03.0722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EeWvoS5ID58cZpKJq62hv7+WKJn3dZOSxlwSQsNbp4x0RvQ9PU1i5GZ/yNifLwf2cMNAQDhXun8NFhTJjz0FsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6279
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

On Thu, Sep 10, 2026 at 08:27:44AM +0200, Raag Jadav wrote:
> On Sun, Sep 06, 2026 at 10:56:12PM +0530, Badal Nilawar wrote:
> > Log CPER records for aggregate counter retrieval from userspace
> > when cper_on_query sysfs is enabled.
> > 
> > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_drm_ras_types.h |  3 +
> >  drivers/gpu/drm/xe/xe_ras.c           | 91 ++++++++++++++++++++++++++-
> >  2 files changed, 93 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h b/drivers/gpu/drm/xe/xe_drm_ras_types.h
> > index 0be218ba2db7..8fb5d6457c53 100644
> > --- a/drivers/gpu/drm/xe/xe_drm_ras_types.h
> > +++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
> > @@ -46,6 +46,9 @@ struct xe_drm_ras {
> >  
> >  	/** @disable_vram_page_offline: cached configfs policy, immutable after init */
> >  	bool disable_vram_page_offline;
> > +
> > +	/** @cper_on_query: emit a CPER record on each counter query */
> > +	bool cper_on_query;
> 
> Nack, cper is unrelated to drm_ras and should not be mixed here.
> This belongs to xe_device with its own state that is maintained
> as something like struct xe_cper.

agree

> 
> Same goes for disable_vram_page_offline, but that I think is upto
> the maintainers.

agree as well, at least until we don't get that mem page offline that Aravind is doing.

> 
> >  };
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> > index 7e3e62750448..288dbc0942f5 100644
> > --- a/drivers/gpu/drm/xe/xe_ras.c
> > +++ b/drivers/gpu/drm/xe/xe_ras.c
> > @@ -4,6 +4,7 @@
> >   */
> >  
> >  #include "xe_configfs.h"
> > +#include "xe_cper.h"
> >  #include "xe_debugfs.h"
> >  #include "xe_device.h"
> >  #include "xe_drm_ras.h"
> > @@ -199,6 +200,34 @@ static inline const char *comp_to_str(u8 component)
> >  	return xe_ras_components[component];
> >  }
> >  
> > +static u32 ras_comp_to_hw_sigid(u8 component)
> 
> All the switcheroos are above sev_to_str(), it'd be quite sad for these
> to be left alone here.
> 
> > +{
> > +	switch (component) {
> > +	case XE_RAS_COMP_DEVICE_MEMORY:
> > +		return XE_SIGID_DEVICE_MEMORY;
> > +	case XE_RAS_COMP_CORE_COMPUTE:
> > +		return XE_SIGID_CORE_COMPUTE;
> > +	case XE_RAS_COMP_PCIE:
> > +		return XE_SIGID_PCIE;
> > +	case XE_RAS_COMP_FABRIC:
> > +		return XE_SIGID_FABRIC;
> > +	case XE_RAS_COMP_SOC_INTERNAL:
> > +		return XE_SIGID_SOC_INTERNAL;
> > +	default:
> > +		return U32_MAX;
> > +	}
> > +}
> > +
> > +static u8 ras_sev_to_cper_sev(u8 ras_sev)
> 
> Ditto.
> 
> > +{
> > +	switch (ras_sev) {
> > +	case XE_RAS_SEV_CORRECTABLE:   return CPER_SEV_CORRECTED;
> > +	case XE_RAS_SEV_UNCORRECTABLE: return CPER_SEV_RECOVERABLE;
> > +	case XE_RAS_SEV_INFORMATIONAL: return CPER_SEV_INFORMATIONAL;
> > +	default:                       return CPER_SEV_RECOVERABLE;
> 
> I like this formatting but these should be consistent with similar existing
> switcheroos. So whatever your preference, please make all of them consistent.
> 
> > +	}
> > +}
> > +
> >  static struct pci_dev *find_usp_dev(struct pci_dev *pdev)
> >  {
> >  	struct pci_dev *vsp;
> > @@ -612,6 +641,7 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
> >   */
> >  int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *value)
> >  {
> > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> >  	struct xe_ras_error_class counter = {0};
> >  	struct xe_ras_get_counter_response response = {0};
> >  	int ret;
> > @@ -623,8 +653,13 @@ int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *val
> >  	ret = xe_ras_get_counter_response(xe, &counter, &response);
> >  	if (ret)
> >  		return ret;
> > -
> 
> Why?
> 
> >  	*value = response.value;
> > +
> > +	if (xe->ras.cper_on_query)
> > +		xe_emit_hardware_error_cper(pdev, ras_sev_to_cper_sev(counter.common.severity),
> > +					    ras_comp_to_hw_sigid(counter.common.component),
> > +					    (struct xe_ras_error_class *)&counter,
> > +					    (struct xe_ras_get_counter_response *)&response);
> 
> Why the casting? What changed?
> 
> >  	return 0;
> >  }
> >  
> > @@ -1069,6 +1104,56 @@ static const struct attribute_group gpu_health_group = {
> >  	.attrs = gpu_health_attrs,
> >  };
> >  
> > +static ssize_t cper_on_query_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +	struct xe_device *xe = kdev_to_xe_device(dev);
> > +
> > +	return sysfs_emit(buf, "%u\n", xe->ras.cper_on_query);
> > +}
> > +
> > +static ssize_t cper_on_query_store(struct device *dev, struct device_attribute *attr,
> > +				   const char *buf, size_t count)
> > +{
> > +	struct xe_device *xe = kdev_to_xe_device(dev);
> > +	bool enable;
> > +	int ret;
> > +
> > +	ret = kstrtobool(buf, &enable);
> > +	if (ret)
> > +		return ret;
> > +
> > +	xe->ras.cper_on_query = enable;
> > +
> > +	return count;
> > +}
> > +static DEVICE_ATTR_ADMIN_RW(cper_on_query);
> > +
> > +static struct attribute *cper_on_query_attrs[] = {
> > +	&dev_attr_cper_on_query.attr,
> > +	NULL
> > +};
> > +
> > +/**
> > + * DOC: CPER on query
> 
> Is this actually hooked to the docs?
> 
> > + *
> > + * On Intel Xe platforms that support the RAS error reporting interface,
> > + * the driver can emit a CPER (Common Platform Error Record) each time an
> > + * error counter is queried. This behaviour is controlled through the
> > + * following sysfs attribute::
> > + *
> > + *     /sys/bus/pci/devices/<device>/cper_on_query
> > + *
> > + * The attribute is a boolean (``0`` or ``1``). When set to ``1``, every
> > + * counter query emits a CPER record built from the associated info queue
> > + * data; when set to ``0`` (default) no record is emitted on query.
> > + *
> > + * Reading the attribute is available to all users and returns the current
> > + * setting, whereas writing is restricted to administrative users.
> > + */
> > +static const struct attribute_group cper_on_query_group = {
> > +	.attrs = cper_on_query_attrs,
> > +};
> > +
> >  /**
> >   * xe_ras_init - Initialize Xe RAS
> >   * @xe: xe device instance
> > @@ -1098,4 +1183,8 @@ void xe_ras_init(struct xe_device *xe)
> >  	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
> >  	if (ret)
> >  		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
> > +
> > +	ret = devm_device_add_group(xe->drm.dev, &cper_on_query_group);
> > +	if (ret)
> > +		xe_err(xe, "Failed to create cper_on_query sysfs, err=%d\n", ret);
> 
> I really dislike that we're ignoring error here. Same was done with
> gpu_health_group. I know they're non-fatal but it just makes them
> harder to root cause when something else breaks as a side-effect of
> this. But again, not my call.
> 
> Raag
> 
> >  }
> > -- 
> > 2.54.0
> > 
