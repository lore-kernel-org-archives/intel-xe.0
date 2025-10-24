Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FB3CCD1BF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 19:18:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1522A10E224;
	Fri, 24 Oct 2025 19:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUqRvTcD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F42310E224
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 19:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761333490; x=1792869490;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BV1mnqVwrj3w86TMtmBYUAgFsHSdn0y/hI5X/6aoaiY=;
 b=dUqRvTcDuDa4cNmlr5T+h6q0VIyg7/WpieWR5CwLVINHnaMQHC2oywt1
 Y66wN099qOBPeymCx82d4eUhbwwqT9GB4BEvd2knxrMIZK2TQZHIldiuE
 3yFp3u/6ncsluO3Q4U6OBomaQ8M54GstQ6Q/KnIJt/ZTDWypwBJSepn7U
 Md6KXZm38wSG5AG4AsSRzQksAgDj/NvklA8SILxrk0hHMsk6MRdzX9xaS
 IZoRygdW8QtX7MAOXrQXc4+vFCrXZT3jfnqWQzW98gFQCLswnp7U8IMfq
 sDZQ5c27mDxb/jciGYTVgRqzMdNWx7+sBK/3OP2chv5Hg/prH2lClRQ3a A==;
X-CSE-ConnectionGUID: Bz4iQ9gxRCyAoQD/jHhX0A==
X-CSE-MsgGUID: iSRZOs51QeKmCZlvMX+skA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86150291"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="86150291"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 12:18:09 -0700
X-CSE-ConnectionGUID: FivVVqo9R9+va9u666BLfQ==
X-CSE-MsgGUID: 6q8dPhRIQeyO4KZ3T9/LcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="188565418"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 12:18:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 12:18:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 12:18:08 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.13)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 12:18:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YZGeZQytSmnXG4QJmRMUTW9wdakRk64hr6fmFxAzd6zjHHbT+vhnvE3hbt1XG4Ho1gKk03TFIFsQ7iOw+rm7s2vyN0E33UkzWEJds27q02GUaWuHGRBAifGGR4bT55QjOlUrqB9kKHmBeG+k75ch02eqtnlZN+knKr+kVSmc9rI1CLOw3k5s1/Ut8SJmTNU7YPSh2NVf8ZPt14A00jirRiQZybiBzUrmS/E/iNtVn/gxKAjRsR9wq+MH+1lURwj9TXmh6azfDMZG6vRRYnHcaMiJCp1faD0l0dkGH/IsTnLs7w/xL27ayYDNqVawD63H6HtIfSMNK0e33of6bjVW7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTbDhVyX93Imscn8uIypkJ0a3NDShZZwB1Tdp0BCNiA=;
 b=A7AZRobHPd5TmrZI7dlhhYaKZSOxNq431xf1uJoTNS3sH3AxuoJEoGgn0oHsXXMP4S68UgIrC25ATD1VgbSxEKffObvbR5UqfvkamU4b+AoI9WEMcjrWcSLaAvcxIsYBPW3GLHmJSyzAOCFY4gun3Gl0D6CO3z9jmKExe7qoZLQbDyNCizAtrNkjG6xEnyqFMXoz4/486g6fzZ6e6yx5pqGIpyUbulMwkdgrU672+GxxECU40bl+9iXSceISrIeFVWis0kfQt2gBD9IRUV0qZsczyyF34zsVMm8KA43K8yha2pE+Q4aB4PjzzUMRdSaoCA461ZKLniiYTvjXZ/aWcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5240.namprd11.prod.outlook.com (2603:10b6:208:30a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 19:18:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 19:18:06 +0000
Date: Fri, 24 Oct 2025 12:18:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Subject: Re: [PATCH v2 2/7] drm/xe: Implement xe_pagefault_init
Message-ID: <aPvQ6y+/Hhh1WpiY@lstrano-desk.jf.intel.com>
References: <20251024180414.1379284-1-matthew.brost@intel.com>
 <20251024180414.1379284-3-matthew.brost@intel.com>
 <d9b8836901d89e7eaf1026ada6dd4e5c8e83a57d.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9b8836901d89e7eaf1026ada6dd4e5c8e83a57d.camel@intel.com>
X-ClientProxiedBy: MW3PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:303:2b::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5240:EE_
X-MS-Office365-Filtering-Correlation-Id: 9caf5a02-244f-4883-bec8-08de13320f5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?p5/EZHaXoC9SMhrtQ3Cv+NtwbbCet5cctjA4pnvSC1E5Kjj4TiAYvfXq1W?=
 =?iso-8859-1?Q?1bUbYgHjb9m9TJDRyxoQpeRmxv724MASTx/hv0mWv8EdCNuUQOOxd+uXTK?=
 =?iso-8859-1?Q?sUdK2MCzcKHBwSe9ZgrTq21FBmyWxtH/1LMNaYYbBBHxxWwYPgcuN5JioT?=
 =?iso-8859-1?Q?lJ0HRqfIfQ1ervz7dOxc1PLiGNNnFqEozTLeBTwrb1k2ja/xl2pBz3eHqr?=
 =?iso-8859-1?Q?7qUFSdwJt7Eh7aaEZUmxzlO8kEACuZjtIbp7K9tSIxXLZPike3kLSNrVx7?=
 =?iso-8859-1?Q?v2vHyvRKJRt2jOQdHD0JsEWavDGLX8kBaLoxi2Bz+flrDFDeyRZoF62ec0?=
 =?iso-8859-1?Q?vPVS3nhgFXFGq3GPi88gcgGBGXNV2w2bGtL69HD0lssi7pLF4L/NoDYlzn?=
 =?iso-8859-1?Q?Fi0otfhoVeU4nGeqZ62efqJzAkdZ9YU/R5/NUbKdEQh+NDK2/yCvT/PzI3?=
 =?iso-8859-1?Q?myy4qMwBEreN873xSW4plgIRzYgF4pkTSt1J5eWW5IJzH/roFy+2K5sURG?=
 =?iso-8859-1?Q?8FuNrLmYS3a5jiHrSdrxgf1+Y2VAype8htv9HVtdPEtANKVdBNGfGkn5am?=
 =?iso-8859-1?Q?4JkkR5sq/yrSrYVG3L2OLlkLTjlUrWxhc2ImVDWdz8re8QZrWTzQRVSZa8?=
 =?iso-8859-1?Q?ndPyN/sxd+06wNzG6/2XxB9igke5P31pXqSsDFnoCFtolCbs7QzXmoGRj2?=
 =?iso-8859-1?Q?67PzXv7TjVCfloprB7o3EkAvQ8uU3b6Ywrnd3zfxt9DkWeZldyBStk1jP/?=
 =?iso-8859-1?Q?vGpLZd432TxoQGviKW2IYt9ra3ZanRUcuPQix8jUnysCNv0UlQp0RMGsla?=
 =?iso-8859-1?Q?s7NaIK+d8RNOI3EqAIWffRLzXP7XZfITEPxB3RUPeq+r2ZDxjkF+0X+SEz?=
 =?iso-8859-1?Q?5bCMi7+mEJyy83rDtVNSzLuJ1JfGq38NOgy/lrUDCYtSAAPK+k5GWz8ofg?=
 =?iso-8859-1?Q?15t1D2qE3PQ/yJLkkTheMMbaaGQehcdjNclpKwALdMrsGnBEobTIN9S7hq?=
 =?iso-8859-1?Q?KCJcmgfF8cEH3mcDMkaoBff+K5lkfrNpW4gh89xI2X/gSFJVuh4oq8mqoJ?=
 =?iso-8859-1?Q?PKAlGHvDFEFvaTi+BrwcGlHraQab4HaBgGhwji3iL6vTY31ufuwA1ywCcW?=
 =?iso-8859-1?Q?T/dAEi0sSgQjiBUlXOi3rsqiVhbKowETvjQdEMPZZaq64UGVTrlGs3+KhX?=
 =?iso-8859-1?Q?5OwsIrZzi9wzGXUn+F3wp2enPqKJ1hXpYukaM915iTLnQTYOn6ZpwpnBk1?=
 =?iso-8859-1?Q?tSbSnX/M/TU69ZmcrARqOvxuVEjAQIlfs15Wl2/aT3iVYQpkzw3gmZfpH5?=
 =?iso-8859-1?Q?r0IpLZfaSGpfoQ3I+tnaINKxnSVXanE3wUB9ROFnQCIvJ2RW5JT+0FVt+d?=
 =?iso-8859-1?Q?d91FM8X0pDfLqZw2NtfZQyHn36oOZotOqctah1ef3JNhOwZlqHUUxqJiHK?=
 =?iso-8859-1?Q?Tnzt9w36Qdyk8o9Cn6nWmC268EVvy3GGTv1A7KS+y3fKMzbFS/qrIkrIV5?=
 =?iso-8859-1?Q?x6gxKaHpJNC66ubeeTM0U8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OA7W0uRAZm262AYI2kn6/7Nm0TCuxnHhinmP3uXYVJ5OyVLnny0rPBEVOZ?=
 =?iso-8859-1?Q?zc0Wnns07zReW5ZKoeEXDXKPNceMnXF7W8uePzyFwypKucpFWejDTXXOCR?=
 =?iso-8859-1?Q?WMCqCI5V+v92jEIWNwntiBt5Hb8aVguWDHJpIG4YXf7atNZ6VRJQiVClLi?=
 =?iso-8859-1?Q?e/opfQ66itjpEiun5R11lSmZiNsHK2PktSyCvSMwk5+clpPkjMHowBwy5I?=
 =?iso-8859-1?Q?tl4H771nU2KTtoc+CXqf9pn7Q9wt+3hBWK+cRO5zTyq2bz+T3DgrHc87v6?=
 =?iso-8859-1?Q?bRpUm8SG3ijumzcI9J+o37YzOmesely5mvci/Ki1L+mh8IrrRQGJg/4jS6?=
 =?iso-8859-1?Q?E6Uoc+4NIdl/6nSV6p9n8ewz4aCZDqFLKvcLcNo0aX7SEqiTR2YVbYhI9w?=
 =?iso-8859-1?Q?ojd36QdhtWxjFTHarCeYtwUOSiMWfxfqhEPwIk4cDJ93oGUfLMk+LpeGy1?=
 =?iso-8859-1?Q?De4xpx91RU0pEdw9MdnwPby17AANhKjIGUIJ+89glLwevm0/4EPwIedx32?=
 =?iso-8859-1?Q?+nsu0fFAufoFkIt8whESqYsVOfiad+8d3+G0HRCquxUH6x1lnnhOpJ6JRu?=
 =?iso-8859-1?Q?itFPnqQSnRpZTQKUpP7HHplj4xjyavqHfSgxRvk8RmBgsaIg1NeEZ/EvyY?=
 =?iso-8859-1?Q?RVCqimmfXbfM7qPoDibSsojx3bFcGCVyDlkKl0iIdPBUg1wqkLKCyCiuq6?=
 =?iso-8859-1?Q?15O6Ckgys9GwQ3DWdu9/9NcgFl+RDWtpyscvX+AwpX/yahCdp2HpqBtaP7?=
 =?iso-8859-1?Q?iuErYwWlEU9pc/ZbPKnOIQoN17JPbPoUF1G9AiUFPAWAt+13degxhNOXFT?=
 =?iso-8859-1?Q?2011Nb0g2TUlv+fimJZ0beJmQjE15hp5BYCX/WbmleqYVYltWqPZMm+BEr?=
 =?iso-8859-1?Q?EU0yqxrf6AI7XbvJa5EV2n+wZvmUoBEUTdIJfYMKlW4V9ytmxeYgoLd34+?=
 =?iso-8859-1?Q?jyHoEymrZq3rupMP97tNYfZxharrro+PZhwxIpEy0A484ztsDBMfLpnWY3?=
 =?iso-8859-1?Q?yj6DY0Di09jIkt0SEx/D6aEaEwuNOLiufjZuNOMd2m00JIugbrp6gbKY8C?=
 =?iso-8859-1?Q?1zM/rLq35pUtkqUtl6EF8lb1HuYmcTFpRz/lu8xLRwNHB+6xjn4KGFWFsY?=
 =?iso-8859-1?Q?JPyIexvRKZDH+VhfVG9GMcEofjGZuS5uSLBGrp4g3Whv+wpwpv0q5PjU1m?=
 =?iso-8859-1?Q?J/Il+1MFscjUoqDWKNjzxs0NXd7ObNzFyEzxj0jqM9vTSEwO1IHfsTflQQ?=
 =?iso-8859-1?Q?NSeSnWApDPi/Btn8dmfPP0aQQLQeqbXHuJiqkS4Hn3fOMoP6E9U8dybumt?=
 =?iso-8859-1?Q?/HNTd3M47JDdWMQdZMGWUtAG/k2nJ1xxwCRX+asOxsxy+qYUHUMia1Q5Cp?=
 =?iso-8859-1?Q?ABpq8Ed9pGJgqxVyNbiEP09c9P8naBHfAhZ6OOCgUG2vCtF4RL/2+woZKg?=
 =?iso-8859-1?Q?wsc0Zu2ziQfe7C75QKzPPKL3PNJqyv+goRpXv7q2nkrg6AN+SON6jqIykX?=
 =?iso-8859-1?Q?8e6CzG0q10AZtwoPQaKcwuN6QkdrfJDDDkA5f+0PKoUjSmnYl3Gs9Ok5md?=
 =?iso-8859-1?Q?W/k9S7QFc4DuEJ4r7vgxjrIZak52zOQCL7JOlxxutHdvN0ZNEIowlftlBU?=
 =?iso-8859-1?Q?GzgO9/PNOyTRWWeFLU/AKugXB06KWKrYSN5cK+qOxWpj6RlYIICpS5cg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9caf5a02-244f-4883-bec8-08de13320f5c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 19:18:06.2051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MgLxnAYg9PR4AK6mTaioSKWX0whKcRxXfOGl3aUA0x43wTrnGc4RFb4XBz8kmKB3WJYkNl9xHpzhhEB9ENVGBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5240
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

On Fri, Oct 24, 2025 at 12:55:23PM -0600, Summers, Stuart wrote:
> On Fri, 2025-10-24 at 11:04 -0700, Matthew Brost wrote:
> > Create pagefault queues and initialize them.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > ---
> > v2:
> >  - Fix kernel doc + add comment for number PF queue (Francois)
> > ---
> >  drivers/gpu/drm/xe/xe_device.c       |  5 ++
> >  drivers/gpu/drm/xe/xe_device_types.h | 11 ++++
> >  drivers/gpu/drm/xe/xe_pagefault.c    | 93
> > +++++++++++++++++++++++++++-
> >  3 files changed, 107 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > b/drivers/gpu/drm/xe/xe_device.c
> > index 5f6a412b571c..f4261a461ddb 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -52,6 +52,7 @@
> >  #include "xe_nvm.h"
> >  #include "xe_oa.h"
> >  #include "xe_observation.h"
> > +#include "xe_pagefault.h"
> >  #include "xe_pat.h"
> >  #include "xe_pcode.h"
> >  #include "xe_pm.h"
> > @@ -904,6 +905,10 @@ int xe_device_probe(struct xe_device *xe)
> >         if (err)
> >                 return err;
> >  
> > +       err = xe_pagefault_init(xe);
> 
> Before we were calling this with the GT init. Should we move this above
> there? Or otherwise why is this later?
> 

I'd think this matters as it is a software init.

> > +       if (err)
> > +               return err;
> > +
> >         xe_nvm_init(xe);
> >  
> >         err = xe_heci_gsc_init(xe);
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > b/drivers/gpu/drm/xe/xe_device_types.h
> > index 6a62b520f5b5..a578781cc28b 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -18,6 +18,7 @@
> >  #include "xe_lmtt_types.h"
> >  #include "xe_memirq_types.h"
> >  #include "xe_oa_types.h"
> > +#include "xe_pagefault_types.h"
> >  #include "xe_platform_types.h"
> >  #include "xe_pmu_types.h"
> >  #include "xe_pt_types.h"
> > @@ -418,6 +419,16 @@ struct xe_device {
> >                 u32 next_asid;
> >                 /** @usm.lock: protects UM state */
> >                 struct rw_semaphore lock;
> > +               /** @usm.pf_wq: page fault work queue, unbound, high
> > priority */
> > +               struct workqueue_struct *pf_wq;
> > +               /*
> > +                * We pick 4 here because, in the current
> > implementation, it
> > +                * yields the best bandwidth utilization of the
> > kernel paging
> > +                * engine.
> > +                */
> > +#define XE_PAGEFAULT_QUEUE_COUNT       4
> > +               /** @usm.pf_queue: Page fault queues */
> > +               struct xe_pagefault_queue
> > pf_queue[XE_PAGEFAULT_QUEUE_COUNT];
> >         } usm;
> >  
> >         /** @pinned: pinned BO state */
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c
> > b/drivers/gpu/drm/xe/xe_pagefault.c
> > index d509a80cb1f3..ea3813704242 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -3,6 +3,10 @@
> >   * Copyright © 2025 Intel Corporation
> >   */
> >  
> > +#include <drm/drm_managed.h>
> > +
> > +#include "xe_device.h"
> > +#include "xe_gt_types.h"
> >  #include "xe_pagefault.h"
> >  #include "xe_pagefault_types.h"
> >  
> > @@ -21,6 +25,71 @@
> >   * xe_pagefault.c implements the consumer layer.
> >   */
> >  
> > +static int xe_pagefault_entry_size(void)
> > +{
> > +       return roundup_pow_of_two(sizeof(struct xe_pagefault));
> > +}
> > +
> > +static void xe_pagefault_queue_work(struct work_struct *w)
> > +{
> > +       /* TODO: Implement */
> > +}
> > +
> > +static int xe_pagefault_queue_init(struct xe_device *xe,
> > +                                  struct xe_pagefault_queue
> > *pf_queue)
> > +{
> > +       struct xe_gt *gt;
> > +       int total_num_eus = 0;
> > +       u8 id;
> > +
> > +       for_each_gt(gt, xe, id) {
> > +               xe_dss_mask_t all_dss;
> > +               int num_dss, num_eus;
> > +
> > +               bitmap_or(all_dss, gt->fuse_topo.g_dss_mask,
> > +                         gt->fuse_topo.c_dss_mask,
> > XE_MAX_DSS_FUSE_BITS);
> > +
> > +               num_dss = bitmap_weight(all_dss,
> > XE_MAX_DSS_FUSE_BITS);
> > +               num_eus = bitmap_weight(gt-
> > >fuse_topo.eu_mask_per_dss,
> > +                                       XE_MAX_EU_FUSE_BITS) *
> > num_dss;
> > +
> > +               total_num_eus += num_eus;
> > +       }
> > +
> > +       xe_assert(xe, total_num_eus);
> > +
> > +       /*
> > +        * user can issue separate page faults per EU and per CS
> > +        *
> > +        * XXX: Multiplier required as compute UMD are getting PF
> > queue errors
> > +        * without it. Follow on why this multiplier is required.
> > +        */
> > +#define PF_MULTIPLIER  8
> > +       pf_queue->size = (total_num_eus + XE_NUM_HW_ENGINES) *
> > +               xe_pagefault_entry_size() * PF_MULTIPLIER;
> > +       pf_queue->size = roundup_pow_of_two(pf_queue->size);
> > +#undef PF_MULTIPLIER
> > +
> > +       drm_dbg(&xe->drm, "xe_pagefault_entry_size=%d,
> > total_num_eus=%d, pf_queue->size=%u",
> > +               xe_pagefault_entry_size(), total_num_eus, pf_queue-
> > >size);
> > +
> > +       pf_queue->data = devm_kzalloc(xe->drm.dev, pf_queue->size,
> > GFP_KERNEL);
> 
> Why devm here instead of drmm? I see we're using drmm for things like
> the mutex init in xe_devcoredump_init() which happens before this.
> 

Yes, this should be drmm.

Matt

> Thanks,
> Stuart
> 
> > +       if (!pf_queue->data)
> > +               return -ENOMEM;
> > +
> > +       spin_lock_init(&pf_queue->lock);
> > +       INIT_WORK(&pf_queue->worker, xe_pagefault_queue_work);
> > +
> > +       return 0;
> > +}
> > +
> > +static void xe_pagefault_fini(void *arg)
> > +{
> > +       struct xe_device *xe = arg;
> > +
> > +       destroy_workqueue(xe->usm.pf_wq);
> > +}
> > +
> >  /**
> >   * xe_pagefault_init() - Page fault init
> >   * @xe: xe device instance
> > @@ -31,8 +100,28 @@
> >   */
> >  int xe_pagefault_init(struct xe_device *xe)
> >  {
> > -       /* TODO - implement */
> > -       return 0;
> > +       int err, i;
> > +
> > +       if (!xe->info.has_usm)
> > +               return 0;
> > +
> > +       xe->usm.pf_wq = alloc_workqueue("xe_page_fault_work_queue",
> > +                                       WQ_UNBOUND | WQ_HIGHPRI,
> > +                                       XE_PAGEFAULT_QUEUE_COUNT);
> > +       if (!xe->usm.pf_wq)
> > +               return -ENOMEM;
> > +
> > +       for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i) {
> > +               err = xe_pagefault_queue_init(xe, xe->usm.pf_queue +
> > i);
> > +               if (err)
> > +                       goto err_out;
> > +       }
> > +
> > +       return devm_add_action_or_reset(xe->drm.dev,
> > xe_pagefault_fini, xe);
> > +
> > +err_out:
> > +       destroy_workqueue(xe->usm.pf_wq);
> > +       return err;
> >  }
> >  
> >  /**
> 
