Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD89FF887E
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 02:53:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86D310E002;
	Thu, 30 Apr 2026 02:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vv1CMuKz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD3E10E002
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 02:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777517632; x=1809053632;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=x3ZFPGqiqmXjIEJvNAkN5K/iuaJ05m7pNRFtEH8qZ4k=;
 b=Vv1CMuKzyG7XVcy7/vFL3ic2XxSEgrGO6eBDQVJHQW5OVKuH16PtDKAs
 I9c7uldbfzHLXpRkj9qHIgJNp/mIEYBqv3yjrhJ5ASpvbSyZYnaXUuZrC
 f9CEimxMcLw+Yjxj1pd8jaOr8MG5DrsPSkblZkK4PLAYqS0rVzh9mejd0
 YK9O32c5w3VZDxcZZdYu9WOAou/aZMrYvuSJalifOLBizBh8hjq4s/Ji2
 c+W2pWscT76Eoh7wpceklrovFLeWslT75rIBz5W1oFAmM6qlmi73zsfaH
 umWrBTooeF7wR+WYCCmooDaysEOJ+zON0lo4DLuTFOl8/9utZ25qixtvt w==;
X-CSE-ConnectionGUID: JRpXQQQ5TSSiTmlPMZHgCQ==
X-CSE-MsgGUID: nUAndPdJS0iejWoiezIHtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78447873"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="78447873"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 19:53:52 -0700
X-CSE-ConnectionGUID: aIKWq2NORuCIESQBljSb7g==
X-CSE-MsgGUID: EFO4aAPzStOlDPuJ/TUTAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="231811193"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 19:53:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 19:53:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 19:53:51 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 19:53:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ep6psRvQVCgVamfeqLcQXomx6SgJ0XB+jkVgUtl0gHWbbIfxhTMxR7HHNreOzZCQ3SlMOn4Pg7w9j1oqnLb7JKnoJzVM765l/T+QZiPsGE4ErmffJV/+3VnWZoO+Q2i10I6e7scigtwtOKmxG5K8H6KRrs0tCKDnDgK1ahtPHZ9AGwZ5wbFMG2P0iVgmUEf5zf+VRVgWaqY04XViHrX1kqNJnPbZQetLhzH5/wFhRW7NSHsHoPVRz086KqFiT4fmJwdnpkr/sh87Jh5e1mCHtSPxZ395wuo7jlI6HexZEThEbD22zevl8DxVWMs1IvDKzMExeQa/6iD1FjJJqsDF/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJirMONaaHsahOhoBiGojCkbknQApcAefqjGqxzRivo=;
 b=YsP3+MxD4hU9lQrDhAs7LhAIOPWA5m9tRl5xzpqUmMSh2SU/w1yEYgfGcdDW1RKQFZbrU2WkJZPf45RFuH4le1Jxcy61DCu1edWP9Uw8IIFG9kxjXCWOHFs1cPsNpsxsXrJp0/m/Vv8SViO6ig/COqGAyfREKPTWkcNFzU7ML6ZPQ9IlYNN0F1vLyo+QZmsdXg1q9tF2550KH8T0OfXqEIyEJqRT3LIPdOkmAFwcHbSqgw/WLRQgU1Sr8KlNnH5B0WUl/HZbPh8cnmrFUvVqnFRa0XmFUrVDvSvAoE5/Old4PBZ3wSsLGQKkqDiScv0pax/cBLUDinGiyIGDMJ/5Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7876.namprd11.prod.outlook.com (2603:10b6:930:7d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Thu, 30 Apr
 2026 02:53:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%7]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 02:53:43 +0000
Date: Wed, 29 Apr 2026 19:53:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe: Use drmm_mutex_init for VRAM manager lock
Message-ID: <afLENIUh3fpDj9KF@gsse-cloud1.jf.intel.com>
References: <20260429093138.3899280-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260429093138.3899280-2-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4PR04CA0283.namprd04.prod.outlook.com
 (2603:10b6:303:89::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7876:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e95b897-8023-4dd9-1591-08dea663b08d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: OghD3lwvMGALv00xcQm2rWE7VmkOJ3FksnCSm0yn6j3mT4F5MYT82h921DaMWKcZ5FPY3vXAS48fr80reGHbQ/SVJdY399R9OuhoYgOwAcod3EZT1fViXQQ/+A5GKYF5uqqFr1W3F8l/Hml1nmzmtEelzeBNs0yYaXUO4q06oJM53WLHQPtRLoOiJR8zOB3etNDZzVm5l2M4wntvYUg5j/EhwhQ20DkGJDJvuR6yvDl7JuCHF6vEwoljBKpL/gJ49ZjP8yTL29gU85VJjdl1600G89K5WEAve/KdyqXDDaBXkPdGt2uf/SNyMCbVSyj0noOMmKldy0eHoGiy0AFyqTaEOOMGQHEKb296GP6lzKSG3NfIcM35SB2yJbH04CxtkK//afwmX5Vm3atB+9oPdUV4zYPFl+R6pILQADCFmAU3sU2IZwyBIQFK+3AQB6vmJUnDjkUG8yFNjIfCMWC0aGUzAySflDtQ8ZEDP2hVlkEB/qVQ1dftRjD8kK/tt/+PouBe3N3bKpYLyXocBzXCkXLqHX/DollH4Wm55Ve+edMrBmAnROjmFmKl+gcd6fqOuV0MDz9MAdknCuSXfno//JrwLtSG3BIbCk2/F4Hq+9zfV0fEfYV0dBNcSxrt9xl+tKo6ZyPEF12c1sDAoyiToaK0YoYR2ROm5JEyeSmJ7BnyuXtJ02ykBniLBECMNAVnUXhuBiKQgaS9dhio5meNcI0IFK9RGzKeUJ5CpYNRKgQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hLjv2wBx6cqR6lw9WzgQyDtTCghjwt5vLMsZGXsVzxrmvn3AK7P1Dn74l5Ge?=
 =?us-ascii?Q?bE0M/5Prqb92g5NeupIj5AMpgX/RVQHsnmoiJjt33EqcyZBYVktKrrNgfoNt?=
 =?us-ascii?Q?vnifbCEoDmXbXavQgmI+AwmWdvRUBB4ywrP5Qf0gYF1gEybbIQVEXaZBsW3U?=
 =?us-ascii?Q?HKZJFA/99Ps4XVss04JDbJKfNgUhX1cLB2TD3eRcM4RzQc4ycHqkbIEbErr1?=
 =?us-ascii?Q?5fAP5lrZW3A06t+hrGVk+rXIdDpkPd+/MZu+m5fH/1JmUEpaDNhGia37NB1m?=
 =?us-ascii?Q?SEQ+ZpojWCeNmX7hEk0MLSMmr/TP/9DhKBVKrfdH3F+9clyUrlvgMlgRDJfb?=
 =?us-ascii?Q?gP/aYaSkUXub/CR7fc1aBt4VeGzLdh8/xgDU2v7s2mbaEVTXIGujteEJetZl?=
 =?us-ascii?Q?9x5OQi0RzfkPbJ+uU7WGpvl9JFcB8wfUfQusP0UQ6ifM1Q69lJiTcZQKvzut?=
 =?us-ascii?Q?JA1Xn4XlALyy6NAWYcb0p7SzwnLZY7bAXLHyRas2+Ejj7GjuBaLJTjmcRw2H?=
 =?us-ascii?Q?DLOmyPTsyHSxoLDqchh77/XfF274Yzf9616lVYSoESX0ugXbHXIQ/M05KylX?=
 =?us-ascii?Q?FDdhMt9LUvJXl+33DKHCNCZ6H181kwH6J9qXN4Ym9A2Bbld800zH9S00j2Ik?=
 =?us-ascii?Q?VYUatgdND7zpfX13T/EYHkDmYMgGSv36EX6l5AbH5ZjCkrkk+qkflPsfKROr?=
 =?us-ascii?Q?LsGDS4/uLrG5rHiZ2/ToR7yJjW0r/QNo8wsfZXVzbYR4BxSr1m6DKGgPwAIM?=
 =?us-ascii?Q?wba7zZWIrUcWim3q4r/ruDZoRqSIhJTjAK7TiL4X5afDHDVuxTvlfoah3cox?=
 =?us-ascii?Q?LVFQYL2+u/7PhYMJat9CrpGxFBY7USh6DgqvEYGOIDi4eF4IreO5IIYk8ICh?=
 =?us-ascii?Q?2D0c3NAYKyeNV0bCuUEJDXeLqtWnUS0ciDxXxzofbbH3rZ6lLh0mLSYCKmUP?=
 =?us-ascii?Q?zUFSiObUt66XGLxYny1LEoSS8Ek9DkZ17o4+6GWszyHYbMrDc8Ttrbv6RP5M?=
 =?us-ascii?Q?uRgvb9dyjbH0nqCeysEai9kKFe8AboJxwcCrFh6oYiD1N8AXE4/oKCogdC3G?=
 =?us-ascii?Q?kwkD86VljC1cHFf+PZysIpr/hVjXbldl9fE/WRKt7BBoXsHBaKgNZuceYGNU?=
 =?us-ascii?Q?vyOTmPhQQHiDCRJyzMxIVW6efFmh+5Fv5h3uSna4XoUO89xIBz2QBSn47BLY?=
 =?us-ascii?Q?59AfAAo68CCG+1BAMouSYVpFb343m/Qg5Pi8xJbc3KSQtaYc7ntIvEPuBAcy?=
 =?us-ascii?Q?wcxDuNeI8Nvnatpj+zGhxwNuIE8GyduVx4eIqFMi/UhYtR/thibSW295Fner?=
 =?us-ascii?Q?VsriJ2rKhdlORTKpMhGrMZj7xjJoO+FxZVtmH+CFYq4ZJjP4PgE/tUISLr0R?=
 =?us-ascii?Q?ocMQzNchdBBozsoJ86pFPkzWGacwe6CZP8zERZvVuamqvIzLDrQYP2/CpKCI?=
 =?us-ascii?Q?hEh3Vfvp9iV8d2j4h7bJspQqbCY3WrtK7GNJAh9xa6EjqMPLx/GGZTQwyn4a?=
 =?us-ascii?Q?DxwhumkEZknlfnwhukKzdXj/miNOIHOK57W+sE226wo0JapHWMcAk4lonauF?=
 =?us-ascii?Q?v9zqtSBMA3DnA/SvEqasjkFLQwFj2MCFSRRtbGhWLa/OTGz3/iMjBSzHbf+t?=
 =?us-ascii?Q?xbBbyfepsBkYMp84JWDe8elULsZs7YWhG5bjvWPdXXnxOT92FF48xGJxTNsU?=
 =?us-ascii?Q?TfDKNgYiUq/G3qDVEAZbQ7HJ9PlUns4bmuJxyO520fB5jYyUBVOMQOYbUrqv?=
 =?us-ascii?Q?C4ftHgSnnQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: O9OnUAVDKIbpPmX3iWF/6eJACTj2WkGNhd5UFZE7fXK/CtqL0hRrI+f+i3fIX2C80PJY7BgAFKC2auV/j5N24Pf0MEtbMdsrwBT/9NflhLugY4ah/SObTuJqsk9JMt+3pC3bxvfaSOOTtWGqcVUM2hTfaE9Rvg5MPjr3qoWQiWgve7WlE/WDeqH7vao8aZQNv2cfOYL4VhaPrp0dpZSm/OHkRk1yFkJgj8TpqWzoPksKTratk/0fBebj9yO8ylocwNgFXfQfx2KxOEnE9mBcplCHPWvMy+7VTuSSR4dN5/o4ab1uqttNSsxQEFvahPIT9mmS6gwRaRog7bpk8d6Ghw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e95b897-8023-4dd9-1591-08dea663b08d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 02:53:42.8644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBTQ8/HudgV+TSoEdAh8lvfsVo1tahkBXeUsiGqn2Fiqlzdqb7b+vOYd3PfRhDRKjlAFeOW32I9jFMXEp+UcJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7876
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

On Wed, Apr 29, 2026 at 03:01:39PM +0530, Tejas Upadhyay wrote:
> Replace mutex_init()/mutex_destroy() with drmm_mutex_init() for the
> VRAM manager lock. This leverages DRM managed infrastructure to
> automatically destroy the mutex during device teardown, eliminating
> manual mutex_destroy() calls in both the normal fini path and the
> gpu_buddy_init() error path.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 5fd0d5506a7e..6ba47996bc7c 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -292,8 +292,6 @@ static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
>  	ttm_resource_manager_cleanup(&mgr->manager);
>  
>  	ttm_set_driver_manager(&xe->ttm, mgr->mem_type, NULL);
> -
> -	mutex_destroy(&mgr->lock);
>  }
>  
>  int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
> @@ -312,7 +310,9 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
>  
>  	man->func = &xe_ttm_vram_mgr_func;
>  	mgr->mem_type = mem_type;
> -	mutex_init(&mgr->lock);
> +	err = drmm_mutex_init(&xe->drm, &mgr->lock);
> +	if (err)
> +		return err;
>  	mgr->default_page_size = default_page_size;
>  	mgr->visible_size = io_size;
>  	mgr->visible_avail = io_size;
> -- 
> 2.52.0
> 
