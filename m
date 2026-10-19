Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D66606A319
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 22:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kP19skXI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA69F10EB56;
	Mon, 19 Oct 2026 22:55:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780A010EB56
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 22:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792450523; x=1823986523;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iYNViwWisEA3YaClnvLgXhLBsnTcbOJgYgFMeJL3og4=;
 b=kP19skXI0L7VnrGcqlqfNpdV7SFfDRo7lzcc5emY2uSOZjlDsGNFraeE
 abnWoTLCslTqBwlsmSzz7Dm2tsO/tTt1rwEM7jZK/C2hfOeOL+Qm9xQ5R
 H9N6IU8TQfPKDZEm8NPKzzE4c8z7Pkv2MFpWX/5iadrJc9sHCUDJBkWqn
 hTHMqoZsJJMENiEj/OjT3iOe2uit+/vyJYhy6oa1V4f3gM7an8nVTsvKV
 tlzGRHt7Y9/0VotvtkQS9+AYfIKOnzp2D+PlpNskf04tY8Nb1XHzVOfVc
 qblhA0x2cGQlrhX0k2QRlDlh9hpouJIDzlbXXV2TWXaYg6nGwFe4cobYw Q==;
X-CSE-ConnectionGUID: YM+BzRdvQWebgGAmkDgt4A==
X-CSE-MsgGUID: pSe4iarzSjOXP+J9y+0rEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1158765"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1158765"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 15:55:22 -0700
X-CSE-ConnectionGUID: QtW0kRsZQ7OyVgjYzapUOg==
X-CSE-MsgGUID: jSiXK1UMTde3JuHh+B6ksw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2621846"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 15:55:23 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 15:55:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 19 Oct 2026 15:55:21 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.38) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 15:55:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/l/GOeK0bqFCF31p+AbehpmKtOPtdZiEQ216jcQoz7FOCVJ8QWGeuzZnWt1CDh3k9uJ6CEbBLLzIn4jUVxISv53hSOCBa4FO45BVa0DW7+9iniL6oXTct9N+8b7a4V1/HVs6Ya39UkRYOypiyQCK528bF4uWwkJ8sY/WlB07yU76RM4VuxIuXgEUODY1lG9vcQOqmWMiGadPI791/NKdmiOA2i3FzULZUAVm3ccSEb4PnpsU89oqcn+ueGOah1c27gs0D0Xf/KHu0AOaQXR1B7bbTCPq+d1e2guoF9kN0dAsSca+/3uu2+Edmz6jd4XDjDMgoBheEY7oNS2sKMgsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5JfObzhgSiQ28npQbGk07G22VaYyelg6z4DHmK8hLA=;
 b=Vycdcqh060q9OfNE32JKcMCdz0jX41ZtzWhrHkpuCZClsv+K45+OpGY24LgptOkdO0XLlYLkQWq46Y/Fevgz5UrlO74xAaIEtodQa6gR7fOH1kxOdMW+gBTVrDZnOyNA3a+n5Ea0F0lRu+dHcgKkkleA6cFh9viGfw8cy4KLcMgO3V6BdoFwNdC3sjq5KDb55gBQXq58JfKhyUNrGhZfY+QF/ZrOzE1AX2E4/Ecdoolr1YcOJ1yUGY+eAlx+5WCnwWyJtlKvCDsEJe1VTXG962FBWuhDz2x8uCkWeKhveDHmnS98n8uHvD6HQiHgpdElTfMtSLB6/2UU6T1zwFDJyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ5PPF0FD67B0BC.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::80f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 22:55:19 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 22:55:19 +0000
Date: Mon, 19 Oct 2026 15:55:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/xe: Fix build with DRM_XE=y and CONFIGFS_FS=m
Message-ID: <20261019225517.GG1329272@mdroper-desk1>
References: <20261016191838.GH578251@mdroper-desk1>
 <20261016193254.3042071-2-rodrigo.vivi@intel.com>
 <9411b525240f8b79c2d828a887d1679518374689@intel.com>
 <20261019152559.GE1329272@mdroper-desk1>
 <4810b908f782874431348ea1509975a7a30f5148@intel.com>
 <20261019170621.GF1329272@mdroper-desk1>
 <ataSilyCrYkPXVFL@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ataSilyCrYkPXVFL@intel.com>
X-ClientProxiedBy: SJ0PR13CA0178.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ5PPF0FD67B0BC:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a0c4037-ca0a-45aa-e4fb-08df2e340c83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|22082099003|18002099003|4143699003|11063799006|5023799004|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: CdqUoXgUPfRXCdeoOL2rrp8vorSFoFYSAuTCK1lbSObXuB5U9qayIK6KybaLnR8yegn9aLFl4iNmWyBRxpQNEY+QZUOT6nZfLYWpXNm/C2sD/18+ukmUu6vDOc5eV1uZCxyz1qEW/8ldO1zUvy+vFw3RuiroIcCRZMRoxZoZxMfHh7P6BNPl4rffXy2s2oi1bmUFMeY5Ar0pCXhspKtLj/uHpcLUbUq/VI8SiZ1AisYteJ5cvAD8dNfDUhOLW5ez/ikYevLpCgomZRmD7xHMyRi8jnE5ZnLY82i7y+xC7S9EI0CeOjRtPXBNxxn1rQL/g8rB1kMyGX234dI9ddn61c8wJ8zMjiWkw6zy6YqGuacuMunFchmtbrNPGYV1jAnnaFAk3/VwaX3XO4gfkAUEwYJ0p0oqGyrdYZLyNGJ3pnH7xyCM1HlPeutiF22aOKx1ZP9EZFBJu80hq00oTSbkBuN11x2fx9h6fQFEd3ve+qih+dFMC/uNsLF4CY6i1ZKa7YC8eOPTzYNIYWVllDRG5dbpi6OrdZn4ViYUe9Jlsx72NezMtpRTs/g7fbjPliCYW+7Q5mwpodIZiS0kI0ntyqAYJ5Pl+0XJvcoq0Rupm3zYZ5z9dC5+GH7erLrOcq8X4TU3pYfGNt/XVbgvQsXqiMDhheA2StGqqTp8gVnD7/Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(5023799004)(10067099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WPjpaJc76BNcNYFFfsc8fjt9LLhm0sRryZLtkCD7HESJKD+93wsHCwQ8x3AQ?=
 =?us-ascii?Q?zuDJxDuqzYJVeiq2Y9d7PFM+4Ic9j1doNR5mLT77CJ8WPn89/eyXPS03nRP4?=
 =?us-ascii?Q?ZrVKmGiCn9sctBKJeaPQSQn3qSk+DXWZ3ad5iKeHZIX0T+3N/VacGJ7x3fG+?=
 =?us-ascii?Q?elxqSKPx4hYrUr/SvbWIBXParwatcIXZaeHFgdx7lpsWuWqnfdmYruy8l2rt?=
 =?us-ascii?Q?lsROZX4k6QGnNdKOSnEq9QgJ0kZ7R0EvvsxJi8lszp34qejtaqUHU5EqEAzo?=
 =?us-ascii?Q?xbDQ50j5UfIBoAM1DczFVi8z9dm/+DbQKxmDpUzOipDXErCVI0Tbqo9QOPOF?=
 =?us-ascii?Q?tYx8WVVqH9DPt6kpnl0hcb4eEN0We9ExDbmcPh1pbT0YwRo1CcTsJQyq6CQj?=
 =?us-ascii?Q?tFjPuC7yBbS0RAuOsjvTlSjBnurmKVh7FdOo5r0t9MiVn0ZY7N8p+gSksivT?=
 =?us-ascii?Q?hTeNwca3iIr3EvQaUOcQtK47rbRVh0mR6ygNpIXnWokC9jBklhAGSWozjclx?=
 =?us-ascii?Q?pvZ21ZEtLUTfsyXIah/O8moAPnUWrySNGJe1NFFKBYHrCUWfywm59cK+vp3o?=
 =?us-ascii?Q?u3UefkFAf1jmuz/7b9foIKGyJ5orQnFEqcJiNHRHeoD1KXPnAgGp1KYfjPYS?=
 =?us-ascii?Q?p7td5etI8wVcyokNhGJZLGHMzkSafIPgFpbFf1tgc1ukgE5/9bxQUaWqzOHV?=
 =?us-ascii?Q?4iT/K9lqyf2K/bKlX6U1AkNu20XKWtYxACdbM9e2i7D98qHp7vYAhtOwq+M0?=
 =?us-ascii?Q?3HY9so+YFC8CM7z1PIMCOgoHkKDRDtlxaObIREX9LL2NJY3I2xfjbJMg6TUE?=
 =?us-ascii?Q?vsa4Pvib8PWA9GYwF43rqqu67ipfSWTTpAie3eReDrseM/zFQQb3KXcsWo4K?=
 =?us-ascii?Q?MwDhUXWeyj1ZKG/Z74QKqCrhR1vrNHPyd+FL4k8An+kXX+Ib32259f5UMsRX?=
 =?us-ascii?Q?2GsTaeIvReDGlIw3Uxaqi20gnEvbvUII4+WkQ5oMVjUA8oHUQdFctRUshzBv?=
 =?us-ascii?Q?Evhii9OLdttrph1JgZcS4P6fVx7Olu2ARUJ6oUb9+9RfFyIITlnXZX2qDT63?=
 =?us-ascii?Q?eP6JlvKZ9axXQi0W80W4VudTDuv8M0uEzc4gKBc4OhWLJ+WivELnudtpNlUo?=
 =?us-ascii?Q?H4hQ01kgLjQzfkz4WHUFS2pT/JRc3f/rjZJw2c2P0Okzu+VVNaR6iKrUmh64?=
 =?us-ascii?Q?0ikK1biOvE0/GE/6zhoetkCX+M0Q4VhzxhsZBNu3YZ68baU4FQFG9+6npdVi?=
 =?us-ascii?Q?oaZ0RY46fAgkd/EN91UDgnrAyWhquU7F4KVHR7MnYqKK+LPVvTb+omJcZKIJ?=
 =?us-ascii?Q?VjAnvk9bW+S+eXn+fPEAUMmty/PYVuUTriahF8d9+H4/cBs6FBdzaLd27BL0?=
 =?us-ascii?Q?vYQ8Qyo5/8opk3m9zSpVKW0zmt06biVuMh/oCj3IgXZhjmEMXKvUdkcoOLHb?=
 =?us-ascii?Q?on2z0ifcEUKBO/kg6F5hZRFwcoikSioGVsaRMu7IaDsZwkhf9RU9q08YxVd+?=
 =?us-ascii?Q?pLTgVDErwK9yGF9WeDDzIzwYqs7qYIieQEJXvV2ncaqCCw7fhg28sBwEQdd0?=
 =?us-ascii?Q?c4Jewys/+RHpdx+zHzu807IqmOybEEN8HSpgOgvRGTsFKM1BICEiHtACacf+?=
 =?us-ascii?Q?wmBdIsYa0ah1CQr30pd4c+mLIs0OjDO7S/LEOLo2zQLMkx3mjd8yY7S+k4NC?=
 =?us-ascii?Q?m9JpawZrsM094eBZFj6l9x46bPdEEpnPX40A9ykQJLlOCeyXrfWkQlE0xsHL?=
 =?us-ascii?Q?A0d8y4O9F2M5XRPUOyHG+gwJdqMxNZY=3D?=
X-Exchange-RoutingPolicyChecked: wUa5Vsrm/rioXUC+oGWwBoUCiq7mgKsMjdSX23GKzfl3lA1IrGrVDF+eAlBGqBwm3s+4RevsSP2XRRnvdavhU4vQUMWQI43zPqEJUHls7Nfq8WqmYCLZQpJkEqC1zN24W+PMWyFq0QQUDpM/glnptd3xMu2HFP8PtFb+nc0Q99JAXXaLgZsCcWsYiqtucHRu1+JNEUUGzGYwS/kvuLIQ2Wu6RUXe8ghMX+yI+WXpd5MZBg79VhW0lV68S+QX+A/yRdPylVPTSlOJ1B5lHgkC0EQBjw7pJoK3sRQU1knvc9QXSMGs4uMmPvt1HeL4Y8+DHKoxUnmZElW94+Lsietplg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a0c4037-ca0a-45aa-e4fb-08df2e340c83
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 22:55:19.4555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VEWyRoFolnKg2u+7zOtAvRKvoY2RJpCsXnlXrumwy4ePqtLZMTpOMro83mwIcJ+rXoGxvOVLmHJW5S44URChfnUtetrkdQNwaoJ6pmlKqS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0FD67B0BC
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 05:58:34PM -0400, Rodrigo Vivi wrote:
> On Mon, Oct 19, 2026 at 10:06:21AM -0700, Matt Roper wrote:
> > On Mon, Oct 19, 2026 at 07:53:31PM +0300, Jani Nikula wrote:
> > > On Mon, 19 Oct 2026, Matt Roper <matthew.d.roper@intel.com> wrote:
> > > > On Mon, Oct 19, 2026 at 06:21:29PM +0300, Jani Nikula wrote:
> > > >> On Fri, 16 Oct 2026, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> > > >> > When xe is built-in but configfs is a module, xe_configfs.o is not
> > > >> > linked into xe, while IS_ENABLED(CONFIG_CONFIGFS_FS) in xe_configfs.h
> > > >> > still exposes the real declarations, leading to undefined references.
> > > >> >
> > > >> > Use IS_REACHABLE() so this case falls back to the stubs, the same as
> > > >> > CONFIGFS_FS=n.
> > > >> 
> > > >> I think using IS_REACHABLE() is almost always a mistake. It's a hack to
> > > >> avoid link errors when something in a module needs something that is
> > > >> built-in. It's a combo that should be handled at Kconfig level, not at
> > > >> build level.
> > > >
> > > > But isn't this situation exactly the case that it's intended for?  Xe
> > > > doesn't "need" configfs, but will use it if it's present and usable.  In
> > > > cases where configfs is built as a module, then it will not be usable by
> > > > any built-in driver (including Xe), and that's perfectly fine; we just
> > > > treat that the same as the 'n' case.
> > > 
> > > Yeah, but there's zero discoverability for the user, or the developer
> > > looking at a future bug report, with IS_REACHABLE().
> > > 
> > > The user enables two configs, the Kconfig doesn't enforce a relationship
> > > between the two, but they still fail to work together. How is the user
> > > supposed to know?
> > > 
> > > With the proxy kconfig option you at least get a hint at what's
> > > required. And you could make it more comprehensible with e.g. something
> > > like this:
> > > 
> > > config DRM_XE_CONFIGFS
> > > 	def_bool y
> > > 	depends on DRM_XE && CONFIGFS_FS
> > > 	depends on CONFIGFS_FS=y || DRM_XE=m
> > > 
> > > Anyway, that's just my opinion. Obviously using IS_REACHABLE() is
> > > "simpler" from Kconfig perspective, but I think explicit is better than
> > > implicit.
> > 
> > If we're worried about bug report clarity, wouldn't it be more obvious
> > if just add a print during init?  Something like:
> > 
> >     if (IS_ENABLED(CONFIG_CONFIGFS_FS) &&
> >         !IS_REACHABLE(CONFIG_CONFIGFS_FS))
> >             xe_notice(xe, "ConfigFS as module not reachable from built-in Xe.\n");
> > 
> > which provides immediate information to the end user, but doesn't imply
> > that they need to change their config if they don't care about using
> > Xe's configfs support and only want it for use with other modules.  I
> > don't think most end users would understand how/why a proxy option like
> > DRM_XE_CONFIGFS isn't getting set, and even to kernel developers the
> > kconfig dependency stuff is always super clear.
> 
> I honestly don't have any strong opinion here. But I don't like this approach
> of the notice...
> We either use IS_REACHABLE as it was designed for or we go with the config.

Well,

      Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

on the IS_REACHABLE form from me, but if others feel strongly about
using using kconfig hacks, I guess that's fine too.  I just find trying
to work around this with kconfig to be a lot harder to understand and
debug.


Matt

> 
> > 
> > 
> > Matt
> > 
> > > 
> > > 
> > > BR,
> > > Jani.
> > > 
> > > 
> > > -- 
> > > Jani Nikula, Intel
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
