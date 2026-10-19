Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2285C606A319
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 21:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f4K2sQUf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF1710EB49;
	Mon, 19 Oct 2026 21:58:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27C210EB49
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 21:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792447122; x=1823983122;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FbV4dY0Vbc9+6TJWSjF5mDNjZKrOmh7N+Oj9R0SDf2M=;
 b=f4K2sQUfkddoEgytWBeWj7msW0ac9Z4L7vln/3/24t4LaBzkASm+Lx1S
 aCZMnVT9QPho3knBWg0RzZBdCBFSqkTiq89a4sSR+QtqGDHoLzS5lnbp3
 0IUzreqRW7ZVZXJ6WWEyHBYedOWrluxymghrMgHfCfx/jKlO8qjM9uy/0
 75dNdJ8xQwo6oQqTI7dEiA0z4tnZxe9v+28iog4lp0F0dp5Ihkk2NkXMw
 08kDsRaeV/TffEGEC9dzjpuhsnFPBFC6TbqNSSkbvUC3X/SqDeJPdpFPK
 VbbXrSWe9y1hxxrFDDOhA4+OuWUvvep123mOCL65emsYVXITEO3T58gk1 A==;
X-CSE-ConnectionGUID: 12WyjrfVSXelsrsTnistfQ==
X-CSE-MsgGUID: FagtvqdfRnWt7KHBhMyNyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1024065"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1024065"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 14:58:41 -0700
X-CSE-ConnectionGUID: wvNATH9kTR2kPhMVTaEEbw==
X-CSE-MsgGUID: 6zcAgZYOTlmF3ydUkQeHZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2609186"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 14:58:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 14:58:40 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 19 Oct 2026 14:58:40 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 14:58:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ac5pLo2iozZP5mcPntPyCBLHfvPQse4wOCo4Va3tdDhYZH8zCTn+rHsQts2S6zrf4375e1u9Kiix9M+fV/ibRQXHdQF5QHwHdWUUqpNRjfRvgCZ+ZQkWmes0aDJ4zYjf20FbOglbZgm0xUAeSMkrtBZ7jQku0Z2b7GM0kC19UNrE8e9edY3cAjqEA1Pg6XenHmWkN6o/Cl0TYsYDkUxJ2F72x71AkqfEclY/Pw3+ENRoH7gI+CnKGKSZkzoMOtujY8hpljbGJIMwGlsFjL8TnuyhZOBo9clLD3q2jHG05hMU2XoUeTdgmSHc+YrhI9ve3G14THVeviyOtHMJrpclPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jenKh/kdUEaO+p4Stil+tGOFStJfB+EnK6pG0x9fbU8=;
 b=ZVwdHOCc8CasoypEAbmpzLydAE3t4nmHcyQswgPK2+0TXPP41bP0sjR548c3XEC4rDmaaNK71xk+YYpDreXznG37pWMqBJ2KEFPgf80aWNf22GfGnaToV53USg41HKtCosIi9ItSLPWl4I26c9TwJwoE3vYAjGeTjvN/hNOUy/PjuQzg2jvaaXB3ez8X2sWcT8JvbVTR9zx4x82FdgMg6mFrx/RaX+yOLQ6Y2a5DNnI8iJCYVVAEPK4xFmiqy0Gu+NA2H3k8Xk+UtskXlGtAuxW5l0K0r+LudWn5aoaIwrm7c5PBjmj0m5EEJXAioG4BBV9maGNUDjqCdF7CQLuNLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by IA4PR11MB9229.namprd11.prod.outlook.com (2603:10b6:208:563::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 21:58:38 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 21:58:38 +0000
Date: Mon, 19 Oct 2026 17:58:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/xe: Fix build with DRM_XE=y and CONFIGFS_FS=m
Message-ID: <ataSilyCrYkPXVFL@intel.com>
References: <20261016191838.GH578251@mdroper-desk1>
 <20261016193254.3042071-2-rodrigo.vivi@intel.com>
 <9411b525240f8b79c2d828a887d1679518374689@intel.com>
 <20261019152559.GE1329272@mdroper-desk1>
 <4810b908f782874431348ea1509975a7a30f5148@intel.com>
 <20261019170621.GF1329272@mdroper-desk1>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261019170621.GF1329272@mdroper-desk1>
X-ClientProxiedBy: SJ0PR13CA0125.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::10) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|IA4PR11MB9229:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f51d900-ceda-415a-0066-08df2e2c20f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|6133799003|22082099003|18002099003|10067099003|4143699003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: pk27K3DohJEDUGSk9Y1Pzh3yOCa9TkZXA0NFWurusKZaZojtoQD8UKMGIK/dXJdz6nN4jMNh1biX0KuH12iKWH27jZSwC5sCG+xyebrMKm6DWWU14E5HxNAB4UD0A45uqOXyDKToET4brzImSlmJ6kNKg/CWmONtc7LAWBd3CQjvOWovNTwkDZA1KJ12YteGklwPKiRr7E+z4CTi5Vvvw4ziHlzAJsMFQVn38JvPsPJhgcXt5Krr5p1OtdOjBPsas0Ndsn3m7/p7aPgTdAmqr1qMSNsigxts1HFzgsh47D1qOcN9NNcmIiLLXqfNSVxoF10CAA/3p20PgmC/xSiaM6vgT97r7KZ7cV+uwlTJ8eIYbWWsppH/Io1aDKe9W+H5uXcN8C4aZpjc/9dA0o729jj2DMMBNGKRfE7Yr5wJlF6mX7vkNSwWdXyjwoxjn589racANsl4DuFnRVgwLicZSrXXiTWFJFFf76RE6HdaIU8TckZqiMNv7qQoN8pUn2sCvhOdf1D1/tU+owp4WnDi9Bs1dFeXmOmr0QbcmbHel4jurVh6JNg4HAYoFuCQttPcd6E231cUGlSXqNGxVNwPyyHp4ZuC1lMDCSxmKu//phaMgpJcNuJP+70azNldSz2j0rTgYeGKIxray0Q86RePBJDzYRIwMqohEKkVt/xZJxw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(10067099003)(4143699003)(5023799004)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RCkUgaTz+ti94CY/4ujMIgucvs5WM/T7cDV3I3GtduUPWOQL1f8g+c6X9gpJ?=
 =?us-ascii?Q?6G4cGXwbAoM2uJTdtQQvY/hYrnRp38jDlaT9bQKD1AhXsz9CHiPXkKn5XCwP?=
 =?us-ascii?Q?ohxMKiv92wcpN0taiaNnM/HU+DOU9LYrh6CsEXjUWztWzfnnq5fHDIZniPRn?=
 =?us-ascii?Q?HpFTrXNgK8meDJQXmtZJhqhgFXN11i74p44gvAFWEXNpGBSXkWcdOOf/e6Bf?=
 =?us-ascii?Q?FoiVcOqDw16pbGqxKNRijUoZK5tcF7WvtKyghRVnSB/FQ2YVsn8/POJqSWdi?=
 =?us-ascii?Q?QIkYqu5XRNH0pkQiC2PrPGoSfOXEw4I51f+HVznoXMNY4owoNXpBQ2O31rbE?=
 =?us-ascii?Q?nCM9++b3bFnszs+abXKSkEehNYGVNqeWLz/W6KnwNIxOtgpxr7c+0pAIs3gN?=
 =?us-ascii?Q?X5BH46cEm80rvWbTG+FeLWvUf1Sv/s6HK63xbOESNBjqlMOZ52OfGERv0jT4?=
 =?us-ascii?Q?LPNIcxi5YFUFMgIcPyxJN+L6iJy1zjlzT2l+wInTq4CpjxqQ1o9Cktfg79SG?=
 =?us-ascii?Q?4v1CwasxY2lAZyVEh7Q6V5J4Ywu5CzBDB8lAMIIAPu9H/saT6y1O3H5HXoZJ?=
 =?us-ascii?Q?GjhEKDpUCj+7npDjPdsqklxmbL6add7z/VKNNI55lyFltGrJJTcOoLobAPYM?=
 =?us-ascii?Q?hzO+mynYIbIDF//T7T3ijCFXTmNyeBjw492VMGMeHCy0Z2wHcLH0wg8XP7T3?=
 =?us-ascii?Q?12msBUa2h/eQf7Yrp12gm4VfBh7puNTsiymcI/H0YAmMhBFgZorEE9wzDSXQ?=
 =?us-ascii?Q?RBj3tzc5wqqIfkPzJXBZnB7HthiUPpPs9FRa6Lh+kL3S23gPujHLqCU2VpNh?=
 =?us-ascii?Q?d5ULAC+IQpWgifQ09Nu26q/867Po4bPhNVx6piAJ1eDuPc2/90eFiOvxZLtA?=
 =?us-ascii?Q?0tIFaP41+ZvI2EBc3kKdlqialE/bXm8I/+UlLZpWijpW8wQbHCEzu5idRTDE?=
 =?us-ascii?Q?DoNFu2wYtoZ/3OT9mTNup35kKQxBWAQlRzi8UlzI988ZLrPFh78eH4lUvPdG?=
 =?us-ascii?Q?9JOJGxYJf8osshHM7M/46qttSPfv6vvDuAkXfk5gjEx6dRdgu3SZop52EWLM?=
 =?us-ascii?Q?0dNCHNFtMwTqIgt82GU/Q9A5x9VqWkR+T8fP4IDIk+ncN7kWlQBV7niMt9ua?=
 =?us-ascii?Q?nqaUZUnnzSdObscl7Dbs40dfbccFE//tNP7Ct7naWfUTMK56RslwanH/Twpv?=
 =?us-ascii?Q?iMKfaqTR0b37up5syZ26M6cySIRCrpJU3cznwhDmHg371OHQhieCOMapSKwH?=
 =?us-ascii?Q?ysico5CNoAoyH11a9yCMzbdTQ4/EEz/TedrSFbWJ8maLQKvmUauCA62sWO+X?=
 =?us-ascii?Q?+PRmVBzRQRxbAn8R3/HQ7mdvZF2zRBHZipWymdqW7YcFq6M1R8vwWDWUzFux?=
 =?us-ascii?Q?kXJnLB/gx9DYHEaY9UHGEq/WQB4O9RilmYJuksAB5bgbHNSA+qUI7Xi5/1ln?=
 =?us-ascii?Q?9obS8urkiGK2/UbyopRH2GLBAQMzn7IZhcYxac1r3/qU3kfBDeDsillo33qI?=
 =?us-ascii?Q?9buJIVHiIpjGnOmi40CJYdzSo/8jDQ0fPIV009hvLMnr3gB6DMCPOx/r0IuN?=
 =?us-ascii?Q?UkxNGv2CIGuASc+SkIcPlz+/aN4fxlxjmSjOYYE1kFRbHks8ggCs6bDnHaDF?=
 =?us-ascii?Q?1Pl4j5oLT+kerFCIJfHyEYdrJKOatxvai3PycvuzDfBw/1NR3YvbXWFxOBLD?=
 =?us-ascii?Q?IQjkMAfSviopCYpahrhIKqJ8BCOdHZMgWH/VOqFZMhzdT+z8U+bUpqXOz1Fs?=
 =?us-ascii?Q?4TlGi+RGTA=3D=3D?=
X-Exchange-RoutingPolicyChecked: qNx8Bws+4SEjPVEzwBeusQDB0j9tbTqd3eQu5xjA378wihfGEH3OwMAI9NQUlD0o7+7KVo2Rf/5a2pgcWhvbAzrKW1LGwCwg36ESI3HYiFRLzk9cl0j7oiMkmXaUXUNPoDbTs5DlaHwImh0fQdb6XzJIrsKvPGXVe0DFh3lfukSw90+oN9ewlRX5ry2i4pqxdgwY8c1IZET71ziqEwDzZu6VIwoPC0BIbU68mzuLuCdjQR+NBrKK7vRz9J2NzwFJRpkGEH1iZiSd6O3uhdboua53T1B59+pWAqEPYw0aYfWMmtQnzTA2ym4ysDi5xS7eS2UOAI5c8pxqdzaQx6VUyg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f51d900-ceda-415a-0066-08df2e2c20f1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 21:58:38.0556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0LYhaFy4LxARosOwwqpsScL98YnJHe3WxW6+UMt2NdOmVGin+xbz4OYE6DP05d/VcgMa65iUnIsuzP4/ZudWtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9229
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 10:06:21AM -0700, Matt Roper wrote:
> On Mon, Oct 19, 2026 at 07:53:31PM +0300, Jani Nikula wrote:
> > On Mon, 19 Oct 2026, Matt Roper <matthew.d.roper@intel.com> wrote:
> > > On Mon, Oct 19, 2026 at 06:21:29PM +0300, Jani Nikula wrote:
> > >> On Fri, 16 Oct 2026, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> > >> > When xe is built-in but configfs is a module, xe_configfs.o is not
> > >> > linked into xe, while IS_ENABLED(CONFIG_CONFIGFS_FS) in xe_configfs.h
> > >> > still exposes the real declarations, leading to undefined references.
> > >> >
> > >> > Use IS_REACHABLE() so this case falls back to the stubs, the same as
> > >> > CONFIGFS_FS=n.
> > >> 
> > >> I think using IS_REACHABLE() is almost always a mistake. It's a hack to
> > >> avoid link errors when something in a module needs something that is
> > >> built-in. It's a combo that should be handled at Kconfig level, not at
> > >> build level.
> > >
> > > But isn't this situation exactly the case that it's intended for?  Xe
> > > doesn't "need" configfs, but will use it if it's present and usable.  In
> > > cases where configfs is built as a module, then it will not be usable by
> > > any built-in driver (including Xe), and that's perfectly fine; we just
> > > treat that the same as the 'n' case.
> > 
> > Yeah, but there's zero discoverability for the user, or the developer
> > looking at a future bug report, with IS_REACHABLE().
> > 
> > The user enables two configs, the Kconfig doesn't enforce a relationship
> > between the two, but they still fail to work together. How is the user
> > supposed to know?
> > 
> > With the proxy kconfig option you at least get a hint at what's
> > required. And you could make it more comprehensible with e.g. something
> > like this:
> > 
> > config DRM_XE_CONFIGFS
> > 	def_bool y
> > 	depends on DRM_XE && CONFIGFS_FS
> > 	depends on CONFIGFS_FS=y || DRM_XE=m
> > 
> > Anyway, that's just my opinion. Obviously using IS_REACHABLE() is
> > "simpler" from Kconfig perspective, but I think explicit is better than
> > implicit.
> 
> If we're worried about bug report clarity, wouldn't it be more obvious
> if just add a print during init?  Something like:
> 
>     if (IS_ENABLED(CONFIG_CONFIGFS_FS) &&
>         !IS_REACHABLE(CONFIG_CONFIGFS_FS))
>             xe_notice(xe, "ConfigFS as module not reachable from built-in Xe.\n");
> 
> which provides immediate information to the end user, but doesn't imply
> that they need to change their config if they don't care about using
> Xe's configfs support and only want it for use with other modules.  I
> don't think most end users would understand how/why a proxy option like
> DRM_XE_CONFIGFS isn't getting set, and even to kernel developers the
> kconfig dependency stuff is always super clear.

I honestly don't have any strong opinion here. But I don't like this approach
of the notice...
We either use IS_REACHABLE as it was designed for or we go with the config.

> 
> 
> Matt
> 
> > 
> > 
> > BR,
> > Jani.
> > 
> > 
> > -- 
> > Jani Nikula, Intel
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
