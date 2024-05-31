Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A259C25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 21:09:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69FC10E02C;
	Fri, 31 May 2024 21:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QIJC5791";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D051810E02C
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 21:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717189786; x=1748725786;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eqzoPMxs77wxjCRh7gk6vffetmOQyPXJlAbob/f7UP4=;
 b=QIJC57913i5haxDq/3Kv3+fnWlzQESs9qr2uiBrMoBszW0MQlTXx8DNy
 UD2o0vTJCiMYpQKMSuPu7DiK+nkUU1bfGyHYxE1ZAX6PxxoW4BIX2x37w
 w5hyszX3Tu8l1/MldyRc/zRfi0WYHOBy79aAJxUWKe7ksOBM8QvEEo7Jj
 iZiOrK+viL+ec63ceLK/XVA15SgLAQ6e1yEuwssEURkxfXOY3dljEguUK
 HqoxSoJyGhnQVEvwMH9akS17ajwF06rfq9pbcMS/4VnYVr4n+BgS9Gnv7
 wIziswZpl4/5Cv2XhDFOse7w9Ll4pKB8+puPJeQ0RYOzqdliFtf+5E41a Q==;
X-CSE-ConnectionGUID: 1fM5sIQpQRmnILJCYXF6Sw==
X-CSE-MsgGUID: syD0hUvCQDSjbipbvvTtwQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="17548653"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="17548653"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 14:09:45 -0700
X-CSE-ConnectionGUID: RQUVJR//S5mOg3EcVkYeiw==
X-CSE-MsgGUID: gQsOmzdPQ+GUXcyg0C/asQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="36368283"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 14:09:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 14:09:44 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 14:09:44 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 14:09:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 14:09:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMYzTY1bR1YH0NFNxBoZVSbesP/DCClHe415afhmCt/rV/7TBa6SvA0xAqaLS8taSn96QoxpPWDdhcTW/RWTXg3pS/0XIyrB9fUGOyvg1BG8ETIAQ5+mNjt911IGEZ3nevtG/H+y0U+D/QV41tY9YpVUc0gjxPoBlGyhtkSvZEOVR70Sn4kNnAB/CIyN39eUjXgJFC28IkoQELwUuasy6c5pq/kM49T/co5WjgCWffdtMyr9l1BnAqWfLSrG7UP2oYwoPcxGTdPkNodZ9fUvw0I97fhUBze/aWtSs4M1QMjFrf6PWjlx7iBd/htYPDMzpOjJmuqYo105W5k5zaPZHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEtHzKpNo6SQkhi319tXuT1F9Hk/HnWs/DYXvosfwhE=;
 b=ZDNJAM119jhEmz0QE9DmfhY5q6Oyvfo6Rx7sVzTAwsLqjmVI/mY+yQyKf3Z3kFxC6vDeUYE+8ZbnZUnSs8IQwtx5/LaRpKwl5tUhUgmIdTh+BRtaXrQYY2/kPznGbcCg0WbbrGzlQnsqjrCbHT7+eHa/8qsTZUF65cxeOQT/RUXGqQa/F89j+KRt1iqxPsG8sxQt07IKd0pTsF9roj4JH1NFLJAjQO2kt2EWjq8/3xnGAUwCIx+h7indL2kL20viCoFRAjknZXqEqL+wWTczFNOwRyoihbg79pxRosDrTyFa968JP9kJVgD5gIBGvkABXdeL6tMG1y7GCbfqhfaa4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7171.namprd11.prod.outlook.com (2603:10b6:930:92::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Fri, 31 May
 2024 21:09:42 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 21:09:42 +0000
Date: Fri, 31 May 2024 14:09:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Mishra, Pallavi" <pallavi.mishra@intel.com>
Subject: Re: [PATCH v2] drm/xe/xe2: Enable Priority Mem Read
Message-ID: <20240531210939.GX4990@mdroper-desk1.amr.corp.intel.com>
References: <20240530062509.1529357-1-pallavi.mishra@intel.com>
 <ce9f3893305f99323f79f0ee39f179543f11483f.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ce9f3893305f99323f79f0ee39f179543f11483f.camel@intel.com>
X-ClientProxiedBy: SJ0PR13CA0179.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: b06dafa8-601f-4ec8-3292-08dc81b5fd09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K7+oj2lM7HBdHVy+V6gfZN+Pvp6BH+siJEQvlC5FbduuOl05SsdQnpV8bM23?=
 =?us-ascii?Q?neOGqRGesEAuvVPITuZmY3wgnSAV+YVA4cgk8mESU8d6Semvlvoflh2bA0i0?=
 =?us-ascii?Q?dHvb5S0hr8/j/62Q3/eHzVMmv4JnNo2N2N6nVA0IlmnUFCxyoZbkYbIFIgob?=
 =?us-ascii?Q?qltS1/O6sUghcelllxnG7+4IDbOyOuL0jvlZzMRufNfm/97i2Lng3fdrmGIs?=
 =?us-ascii?Q?ZPap3tVUg/4dt7pN3ZS+Vos8MOe003Wi0g3250DTHc1qhIS8ELG0SRvqIWOm?=
 =?us-ascii?Q?gOtXdtgP8vB7FxH60zTQxx01hna1oBy+vHXZSIZi8RgHlatpXPqvBrBysktU?=
 =?us-ascii?Q?EPE/CCVfSR3yCe8Ve8cXGqnAmfLwvoY2u+qRSh2CGql9EZQlLPdOjfqUrSiO?=
 =?us-ascii?Q?wmerHCE8rtOQouTVjB1cTVQLWKnnStPb47u82pRFdafvgHzPx0kPQJ7PHxwS?=
 =?us-ascii?Q?nDJbmiXzemB9OHIlnp/ONq+F8wJ2kowXPJDpihOELUKYn1oz9H1wnnXyV+Ep?=
 =?us-ascii?Q?CoA5tB+XyGQSNX+XRRMFFdd/YdRZ4knVEguXoWG29kiX9MJ9OWM2KG8cMDGp?=
 =?us-ascii?Q?NmvTSK+VXCrYna252i/JtNfHX0qc/IViT46cqSvvuVUAJy2yuxigbyGNzFdd?=
 =?us-ascii?Q?fEYG0oaoFq9vTd8psINS6aPbFGWVeDXBOyuCxbHBo+eCXLDVJSY/HG3mMGCX?=
 =?us-ascii?Q?LmQaOCMvgCh0FFfxFDSA5kGr7+Ck6T6KGCzUcenClOB9MAD8tlLGUl/d7Y/h?=
 =?us-ascii?Q?j01OHPo3Nn7dC2dEfmlcmjQD1LUAwKXNFKo7B/yqI56SCJDAHiQWMxFtUvA4?=
 =?us-ascii?Q?JZti3DKobYGpyJwNJGdDzoFtRdwLuXFR0gVpJ9/EEerO7MhifbxUk3y2nt8D?=
 =?us-ascii?Q?fPwv9Kc6LnLHwSChe+n4JOSJ0Z1fTzqdRWr6lU51G6JvI7y4MfI/iW14qAH+?=
 =?us-ascii?Q?o0L8J+Ewczu8R//dkyf0/DXC7NHjDVYdVK9WNk8Z+K/lG99gBYIT2RRZcQ7U?=
 =?us-ascii?Q?ogw2HJZTtghBT+z7PzSaGpQYWVj+umLEuFtcMY3T1C8VfW4AAllsgN0ih0Sg?=
 =?us-ascii?Q?9JDdGTvFl6jke+tE5GRoJB2mOOQs4J+maSx80Sp4hH+H1Nv47/HJ/ERJZ0ez?=
 =?us-ascii?Q?CPIU2pUGvnM94mY3dtbBqyEtxeSUzb1TP6udYFT3LHty1ziO9j4Zxn3jBtFE?=
 =?us-ascii?Q?1Zb/vvlXXa1jgChP8rSFw8EVHExW20pspFZqMmaB2ROpaa1WQiS4iDgoNyd9?=
 =?us-ascii?Q?zLn/TRZhzK5egJqCiNPX8lkALNhwRiCgIsAfeKp1UA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BCW8txhFtNIFz3+cmrogBA8PpKlD1ohUmBnMb79WRYyJ8iDn7Aj5FnPZ2P+Z?=
 =?us-ascii?Q?zuu0oBkdsvDgY2McY9p4QIN+ZMeMULb/k7baJqJMKf/r6oQx/mVyba6D6nOk?=
 =?us-ascii?Q?mIc3lH/FPyFqLGvs/zsxusKudoaVHm22gRa789LB0ZqG6W9xTKdcClvznJo9?=
 =?us-ascii?Q?dEfiGOlRSX04MeP8+sWJ0a1vvh/zE24ZH9dzz8Q7fYrYeIM/B/7KSJuW2mdK?=
 =?us-ascii?Q?MQBLLKt9D34mmZYDjCdmQNPpB0Dk93caL7YDc7f/onkUJ+TAxN5gsXZnw3kk?=
 =?us-ascii?Q?X61BLr8zkHmuJ9FB4F1jVo9yJmT2MzjD6RT62taPSyxa0yZTta6Ar2ncQ/CK?=
 =?us-ascii?Q?fET5siUWa4mJiZac0xkNNlDoipcipeizHl1WijBsjlq9acHDyqFXgGpOdczZ?=
 =?us-ascii?Q?rCGkQX0OQeS+HSgNnttu100u/VaHicCHl5VLXH21ZOzyLXxGZyAnFXOSMLok?=
 =?us-ascii?Q?kLBzYaGQnGthzi3Eebqk2wuXXTWXHmXxJrcQdxZGvOEkLUYo24FauDnX9n6i?=
 =?us-ascii?Q?1NOjLEP7YR6cj3KFVVWSQpFxCBB06W+KC+lySYG4J3WLKs+BQyKOWRr99Hhn?=
 =?us-ascii?Q?Cc3X3TM/e6QhEWe4ch8fs0qIokzorSbKH1hRA/SvCs/PAtvy0G0SfOo45rpS?=
 =?us-ascii?Q?IkMcOs1Ju0pCGTILs4FncpbuO9uHdCcm15L9qEkwfXzSMd9Uon16imLfyX13?=
 =?us-ascii?Q?wkpDN81S7Fm2adlVhfhl9bzHL44xuNbDAHACG2oKjpmajCBsZaYeE5JeIt8u?=
 =?us-ascii?Q?ycJye5mPl2MtPhz2TtrlC/upIJhX5qugVjSx93BOxUPhVG8qjq/l5ygFC86H?=
 =?us-ascii?Q?E40VBTmPNts2lSnAmarLonUuOm30e+xyQI6B7ywNXpT3bvoyd9gSXHBB9dX4?=
 =?us-ascii?Q?p9F2+tE4TcbbKdJaTqdJlk2eKI3xfVog/+H53nnaeocWDJknslmzZnM8s9XA?=
 =?us-ascii?Q?AEbd/tHWc6dOmCTi7YW6aBF0QRZaMGsmS8wxA/5wkCBoobI14bso/2IeKgTX?=
 =?us-ascii?Q?rQQGEnHZOHRdobwlBAUcR7s0q+fdnDgDlwQYmDNzA0V/SY3kz2ovIxHgqaMY?=
 =?us-ascii?Q?6WNygqL5F8jCy8NwxslAlnZH/aucLmQPRXWfqeza8BMX2KyvTy9u8BEZ6PTD?=
 =?us-ascii?Q?LCkj9LKNe7DwSed5Am3T07DNw1QdY8HIC7UC1QkO7tT9GHsZ6RtThMX2Lf5k?=
 =?us-ascii?Q?8JbP0gp4JpyFd52K2+Of7Jgp97tiKQOyM/fbHg4FvmHH1VkT6oRj8EnlGyJs?=
 =?us-ascii?Q?kQEksGHIAZc1Of3K5eW1MOytB2k9kRX9oPiVRyFFws55vl0mu23RNAzuD32r?=
 =?us-ascii?Q?dcWowQXH3y7BZCNEReY/FANnU0qKRZlVJMGjX8zMXiTKWKTvEtYTs6LvMAsV?=
 =?us-ascii?Q?bYRsQaoHDFvPEy3FhzL+Gd+HKi4gZd6bURA/1Es/D72oP+T3mLoHgNsXz+8d?=
 =?us-ascii?Q?vg0M1gYh5xtc8ZkYsY6WeNQxzt7xpS6KTpNE+WcaIgzCLNVgqxYp80H9dnBf?=
 =?us-ascii?Q?Djw2pHwSDq6yKaRp7QumChmRwASXeuUcw4owYskVxGQlsPgex9EA5EQfh9t0?=
 =?us-ascii?Q?jSHK2z3yy7dvzuNRml4Ivd5KDhPAbPr2hS884mpF9MiyiH6TDDTyEI1OkR5H?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b06dafa8-601f-4ec8-3292-08dc81b5fd09
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 21:09:41.5212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zmIfbErR5aWY4S6bCtNAXPziSHdjEHs0HfK0oF6Fw/bW8t8QohVzfSCP/MlUiTHKwanxZcPlusziHndGzeHot0lfmHFXHglxdfaSzdoJpSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7171
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

On Thu, May 30, 2024 at 10:00:36AM -0700, Souza, Jose wrote:
> On Thu, 2024-05-30 at 11:55 +0530, Pallavi Mishra wrote:
> > Enable feature to allow memory reads to take a
> > priority memory path. This will reduce latency
> > on the read path, but may introduce read after
> > write (RAW) hazards as read and writes will no
> > longer be ordered.
> > 
> > To avoid RAW hazards, SW can use the MI_MEM_FENCE
> > command or any other MI command that generates
> > non posted memory writes. This will ensure data
> > is coherent in memory prior to execution of
> > commands which read data from memory.
> 
> This has the potential to cause issues in UMDs, Mesa for example don't have any MI_MEM_FENCE instruction in the code base.
> 
> So please before merging this sync with all UMDs or merge it behind a run-time or build time parameter with it disabled by default.

Wouldn't it be better to make this the default ASAP so that we can start
uncovering any hidden userspace bugs right away?  Once force_probe gets
lifted and the platform becomes generally usable, it will be too late to
fix since at that point any failures will need to be treated as kernel
regressions, even if the mistake itself lies in userspace.  I don't see
much benefit in artificially hiding problems when we don't have much
time left to discover and fix them.


Matt

> 
> > 
> > No pattern identified in KMD that could lead to a
> > hazard.
> > 
> > v2: Modify commit message, enable priority mem
> > read feature for media, modify version range,
> > modify bspec detail (Matt Roper)
> > 
> > Bspec: 60298, 60237, 60187, 60188
> > 
> > Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
> >  drivers/gpu/drm/xe/xe_hw_engine.c        | 11 +++++++++++
> >  2 files changed, 12 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > index 263ffc7bc2ef..4e8f9a61f0bf 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > @@ -104,6 +104,7 @@
> >  #define CSFE_CHICKEN1(base)			XE_REG((base) + 0xd4, XE_REG_OPTION_MASKED)
> >  #define   GHWSP_CSB_REPORT_DIS			REG_BIT(15)
> >  #define   PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS	REG_BIT(14)
> > +#define   CS_PRIORITY_MEM_READ			REG_BIT(7)
> >  
> >  #define FF_SLICE_CS_CHICKEN1(base)		XE_REG((base) + 0xe0, XE_REG_OPTION_MASKED)
> >  #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index 9eef789be897..f03e5cc9063e 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -424,6 +424,17 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
> >  					   0xA,
> >  					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> >  		},
> > +		/* Enable Priority Mem Read */
> > +		{ XE_RTP_NAME("Priority_Mem_Read"),
> > +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
> > +		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
> > +				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> > +		},
> > +		{ XE_RTP_NAME("Priority_Mem_Read_For_Media"),
> > +		  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, XE_RTP_END_VERSION_UNDEFINED)),
> > +		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
> > +				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> > +		},
> >  		{}
> >  	};
> >  
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
