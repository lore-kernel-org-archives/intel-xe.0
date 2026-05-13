Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE14CD4851
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 12:59:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F11610E287;
	Wed, 13 May 2026 12:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mOy6F9v1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBA510E287
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 12:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778677152; x=1810213152;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7RVxIQyKkesAm81ryvAtt+XKuL08RPzcKIgH3IDUtWk=;
 b=mOy6F9v1YeN68648jRkMgy7xjBQL862FpXrOrI4kKL0gptYJQKaMh2T1
 dNkWtV59HBYXJnEO0GvP5hFWZxZd2q55iFOWzv4mVE6R5RHgeGXE8zuoh
 mP8IphYQNUSasEPvk2jSHjD+OtfNFCmjeJeD53h90Naa1PulfHpFP0DQI
 sfaDffiD7fV+7zCnPuyX9FFlgRRd1eIQH1+O0fNTp6+6UoZRbpJZEisCx
 opqpKRIFEwqVVdqvIy7GEBS9Hh90YoMPA3ZdDM9q5nUpMnZvmFGoXnD8X
 /zifo9cevfYuXWIvCXFVFMgCufE2yzhiqGxTFjP+a14OwVAa3td5eDLvW Q==;
X-CSE-ConnectionGUID: lYVpq9FZRNWAj4hfFVcyrQ==
X-CSE-MsgGUID: SQpSJH5NQMC2ypnrg14usw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83217747"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="83217747"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 05:59:11 -0700
X-CSE-ConnectionGUID: nXsoX7e8TkerBOg8Ltf9Lg==
X-CSE-MsgGUID: 7+UNpm7xREKDyDBwCbiVKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="233808298"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 05:59:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 05:59:10 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 05:59:10 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 05:59:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BkZpqSfHTJXKmpbAwV50hDHVzkaM0iJACdcjvwsNxsgRAhEIxk0pPRsDYN//hL8/nh0WZDXDfRsZlIkIJr9VLHclPoqeB8zBhqiYfgVveLP1IFKWmZolLz5bkLfp45Y5AFizI09/qBevWkc92jFFguLN1z1aThXhiU0/mdXYJ3ernkwzoSJ5QNOM6BTDlE5oswtbhozLt2ZTL+c6IFmc1yPKPmosbgLzlkWiOAbH9huqauZKfR/4Dc0nozvzQq0XeHOXPs3f15FLQK6n7J8EaFBWlNM0Dqhrg7c5Cu0JyAeNhktNzPoCvrf9yU+q2+oEHgfNUpkTrT+m7s+esUZKMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RbDhAD4Trx8xdqYzMOlrt5R3/gD5hp/5QVCQtkTrcTQ=;
 b=cEdbrCzTOM/QwFfIUqBf58PgrR352/Cz+TxI4YiseoV+0m3NRzcXIv3dSgZQFCUDgecOAb4qai5wYmzYrO6Rzn+aKhAad5Q/XaZZ7UhGyv2TaOGcsF3F9Vt6RGNx1DqVTs72sCD3NPodYXbMtEn2disC0zKnjW4X+5RkedmpRyFvA6tqNvB+pO0WdYVr7zdEtVQ7EkS28/s7MkghVwmtpkZihIByqEHUpO0inO4SA4DNxLR/YgruxxXCl3QX4C8FvGBB4MqUsgie3yZuLh1IJVAtzQlzU+ayrDX7922Z/EK2m9CmdtISNcK9IHFGZDkM6AX3N3gJUsFHh8xRaTXB/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH7PR11MB7121.namprd11.prod.outlook.com (2603:10b6:510:20c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 12:59:02 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 12:59:02 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 4/8] drm/xe/kunit: Add xe_kunit_helper_is_live_test()
In-Reply-To: <20260508-rtp-mcr-check-v2-4-9897b147a5d2@intel.com>
References: <20260508-rtp-mcr-check-v2-0-9897b147a5d2@intel.com>
 <20260508-rtp-mcr-check-v2-4-9897b147a5d2@intel.com>
Date: Wed, 13 May 2026 09:58:57 -0300
Message-ID: <87bjejcvou.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0165.namprd05.prod.outlook.com
 (2603:10b6:a03:339::20) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH7PR11MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: a85e0a83-2f59-493f-263d-08deb0ef681e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: 9SUdfUjOwbfosfwfiLuuAUzsP9O3X2pyQGVVkumr9kMqGVqqcFphnLzQw3YaPhbknFGf5inQRcCklSCN6KjHR5HnZCE4WHoqgfoXc9A5tlhslB479x+olLI1lkt9In0gRlrtftYCql3fiLZYwXDA1SLSo5icQ7tDYOUiDz9Jb8FXNbteKngSiEe6veQl+m7lV/HTnbU8VXB5LmgF4g4ioLYBFm7tUzHjsLCfgIiT6ArJjVxUK/xoSFrchJKggDAVJv4WqBlE8lDxSJMpLj+QsazYsdrv2RaONjDKbyzZBR5r45MdPTkRaYcD4coqCm13PlShQdNWpLGow6yl3ardY1wbQ6ag8UrS0Q/mojLcZA3njvncEwA9aRs7Yx4dMEH0T+TWbEt/q3A3p23UJFNgB2SOdROlZ+FCyfP6uEmSUpQIqQYZPur1QVMJFz6Ik3O1TfmYXrjk8JAPLeJ59aBMGxBpqJAk/4H6xQv/Fm9k/wn3FjMFl43F8bXxPsox5T+SBcoblBdSreasgNVgNx7HJxoeqnCNFDEu55Xr4pjUOP4k3Qm70o1qHgNQ0EfTCZtg8kjqPlGwoT9MvZMo42B69wZk3mKLUOutfITIqZfZkpzn2F3h4aB6/XkLcTarKlH9032+vzxGwK4gA5EZ821B23MEMvYF0f9f20Sv2s56z1Mij9lhrVVfHTiJ3teH+l5K
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TqVKKxLgNaLs8ROGryReEYsGJEXN22X8WX8C2ILkQPhf2reTsoXUZt1y4bIt?=
 =?us-ascii?Q?pYe4qpbwp080NINX1My4C3V1ttOKFsmZdTw2kt2IIKvaFK3/lQdWgPSB6IDe?=
 =?us-ascii?Q?GBe1eM0NaQ9hzvgJGVY1J9bCMwwwB/Or7at74aliicyKwW2MVYjO/kZHVz6J?=
 =?us-ascii?Q?gvUpXNXlbqSxPgn5iLNjRtbhMhBHAfteMSmSLK9rs9tnSkiO3O3fGBc8mj6c?=
 =?us-ascii?Q?xAKhl1f8lUANirGlv1hKr8EvDUEheOWVNKpDTTrBd8oBYMCvv7DPXImnWI1b?=
 =?us-ascii?Q?Q+FflvTwKk1cNCkAjAmKELlqViU1TIlWJGXKI9bJfe4r7D/nVz/5CyF56A1e?=
 =?us-ascii?Q?PRoOuHDflv36APYhnwLu1Ghkmn+cHJs22ufNXwkXPp3D3JHPG4I2MHjdms4x?=
 =?us-ascii?Q?avpZBY1umPPylgBzVEu/azCoLEA4U50ej8VpLfXgv54KJ2r7gJ0P4M3IKLau?=
 =?us-ascii?Q?U4n3pZ60P6uvfej9vE1lI6GdH1b7fVg3zE7K18VCOkPWqfa0O6Wof5NslA1h?=
 =?us-ascii?Q?toycpL2wNl0tQD2k28lm98jIsm5SNXYC9MpTbWWlsdJ4q1q/btwIvnrsdLGd?=
 =?us-ascii?Q?iwtNkOrVctN/o57MVkuJQ66cTZYXvloYt5OLlmQOOlaj63Nu1xsB2/s9hmCy?=
 =?us-ascii?Q?C9UzkxS7jexAAYiljm+TFEGPHCZbsaL8mw69r3NR0jFM216LN3hxPFX5GGbn?=
 =?us-ascii?Q?kQCYJCoehATaOR8yitdmHaBNNc2m/P7OQB6IY6UFE9j6ttXKq7eBjM8u3OC4?=
 =?us-ascii?Q?3dreHgSFn4PQN+raaZbAK2AQsF8XU+YZhnvgBZufjkJc28grsMH8FekOqpHb?=
 =?us-ascii?Q?8yjiHfalDeNKdx3td9sV2yjkyyfjgc2g/kxFq2L89qOav+jhzi6jil7WSipn?=
 =?us-ascii?Q?yCSh4vkzM8/OaLrp8rIt8ZZe9r3dQHEBcqnmLe534UStyLOYY5Ltoq9i46G6?=
 =?us-ascii?Q?X3EroE4XIjXQ1VNbNIlFlTighuyqOHE6CDg1KxSu5W6PAPd0Lq1G3WD7xVeL?=
 =?us-ascii?Q?g20X6VPmuhVTUodnuo4q0CTuogseM6///YbUMpJCq3nICHKFEfq+H+8rSkTH?=
 =?us-ascii?Q?0rU5Wu7mpNx1yuGx9l8Q3evXmjQOiXW4u6pNl8HalFeAYmMaWC8akzZe0OMp?=
 =?us-ascii?Q?gOaB1WXzkpzcNrPejufIn4fnPzNNMy+M4uDX0UVnzlGW/jiOU11Rxmo5gEPZ?=
 =?us-ascii?Q?3EmxbEOzNluQx1NoBOcYCLcyweM06P51WsXYBm7xvkRBAUORIWwPB0RWlsbK?=
 =?us-ascii?Q?2XJs95K6l38EN/DfLiXMwalhc8uqE19G+aLH90FlWdXyZiYXDjrY48gYcclX?=
 =?us-ascii?Q?uMiL9sdjd1/9kFt8qSRpUzLlrcGmVoltZbnAwdBY1TS1/NAo/KlsPVBXzGBE?=
 =?us-ascii?Q?8gb8pa6BV1sS54dc6k7z5eVSDXV1UUwiV7qxu1GKhW+v8dF/J4+YAZaP2Fo0?=
 =?us-ascii?Q?nk3mZMKdLMqkHmUSjI9Wo4RgJClWFaa3pNzqhkO8NOigghqE4Rp4ru5wofUD?=
 =?us-ascii?Q?m+5w2uHX+/f/tVdraBvTF/ZVqNSfiLt89vIOh2cogqpr08CY/jNeZhxbyI0C?=
 =?us-ascii?Q?nYGD+8QiIBb+CuYIW++yV8A0uX6pBRGtGzV1nGbM5YuDJGRP3zKKdi9AWouH?=
 =?us-ascii?Q?9h2ZEZ/vDzXBhV/zNBdJ5tJRhQG/GghWYoHnd1FIR/XwZGm1oRHMIbsJ1CZp?=
 =?us-ascii?Q?OdgwEfaDznsZ48WXtX3WlP+P0b+AS5L0a8rBDxPFlJPN36kd/IEPu9AastB1?=
 =?us-ascii?Q?sIBapFK6gA=3D=3D?=
X-Exchange-RoutingPolicyChecked: XS/5G0QFQ3RH2dprmN+3zSahBRlUwH9bvBcOPvLh4Tnyq8mSEGHHrNfkq1afxLB+5z2RdDfDUbP3L04tNIobQr0DMLvEDsUVjdnjjynYIUZS5DEiAD4/svPdzHSykQ6K65rQ8Qy2KPtq0bn4+wfBGVPZmssGONpaxx1kufARu1ZXvnEUv6g2TCPH4Er9KDG5ItB+nA9nV40WmM+K7VKg9jAlttTrzTP1fee/lO2hKwwMOZFrx/uxuK0Ax/8hQy1hPO/HnIfzun4nMO/UpmRrg55qHaVxrlNuB2x/ulQCXYlaOvreEPC6zQVTQeiJGGwBsXadRwds8Q0mFIRNn92Jpg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a85e0a83-2f59-493f-263d-08deb0ef681e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 12:59:02.5508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GaMjXjJgo9dEMRj1JNw99XnjcVyoW5oaNF6XAFih47P3g1JaghoU0mKhWNWwXiQlNZqGChSVtN6GUqd+e0+uBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7121
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

Gustavo Sousa <gustavo.sousa@intel.com> writes:

> In upcoming changes we will need to differentiate between regular and
> live KUnit tests.  Add the function xe_kunit_helper_is_live_test() for
> that purpose.

Just now I realized that this function is not needed by this series
anymore.  We can simply dismiss it.

--
Gustavo Sousa

>
> Note that this is implemented in a rather hackish way, by leveraging
> KUnit's static stubbing functionality.  A better approach would be to
> store a boolean somewhere in test->priv that would tell if a test is a
> live one, however that's not quite feasible today given the inconsistent
> usage of test->priv (there is not a single uniform type of data assigned
> to it across existing test).
>
> v2:
>   - s/xe_kunit_helper_is_live_test/xe_kunit_helper_is_live_test/
>     (Michal)
>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/tests/xe_kunit_helpers.h |  4 ++++
>  2 files changed, 30 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
> index bc5156966ce9..d2f654f53cc7 100644
> --- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
> @@ -16,6 +16,18 @@
>  #include "xe_device_types.h"
>  #include "xe_pm.h"
>  
> +/**
> + * xe_kunit_helper_is_live_test - Return true if @test is a live test.
> + * @test: the &kunit test
> + *
> + * Return: True for a live test and false otherwise.
> + */
> +bool xe_kunit_helper_is_live_test(struct kunit *test)
> +{
> +	KUNIT_STATIC_STUB_REDIRECT(xe_kunit_helper_is_live_test, test);
> +	return false;
> +}
> +
>  /**
>   * xe_kunit_helper_alloc_xe_device - Allocate a &xe_device for a KUnit test.
>   * @test: the &kunit where this &xe_device will be used
> @@ -93,6 +105,11 @@ EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_xe_device_test_init);
>  
>  KUNIT_DEFINE_ACTION_WRAPPER(put_xe_pm_runtime, xe_pm_runtime_put, struct xe_device *);
>  
> +static bool xe_kunit_is_live_test_indeed(struct kunit *test)
> +{
> +	return true;
> +}
> +
>  /**
>   * xe_kunit_helper_xe_device_live_test_init - Prepare a &xe_device for
>   *                                            use in a live KUnit test.
> @@ -116,6 +133,15 @@ int xe_kunit_helper_xe_device_live_test_init(struct kunit *test)
>  {
>  	struct xe_device *xe = xe_device_const_cast(test->param_value);
>  
> +	/*
> +	 * FIXME: This is a hack and a better solution is to have the "priv"
> +	 * member of tests have a boolean to tell if a test is a live one.
> +	 * Unfortunately that can't be done today because "priv" does not point
> +	 * to a single unified type across existing tests.
> +	 */
> +	kunit_activate_static_stub(test, xe_kunit_helper_is_live_test,
> +				   xe_kunit_is_live_test_indeed);
> +
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
>  	kunit_info(test, "running on %s device\n", xe->info.platform_name);
>  
> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
> index 83665f7b1254..71cfeb2d4efb 100644
> --- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
> @@ -6,10 +6,14 @@
>  #ifndef _XE_KUNIT_HELPERS_H_
>  #define _XE_KUNIT_HELPERS_H_
>  
> +#include <linux/types.h>
> +
>  struct device;
>  struct kunit;
>  struct xe_device;
>  
> +bool xe_kunit_helper_is_live_test(struct kunit *test);
> +
>  struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test,
>  						  struct device *dev);
>  int xe_kunit_helper_xe_device_test_init(struct kunit *test);
>
> -- 
> 2.53.0
