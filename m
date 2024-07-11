Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34FAC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 20:14:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0D010E2AC;
	Thu, 11 Jul 2024 20:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nU8Ss8CX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FB810E2AC
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 20:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720728890; x=1752264890;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3vODItyUgAeg1M0We8ctHwX+LUQNQkO75ATbIynkOCI=;
 b=nU8Ss8CXOhs10SyvBRE19qquinaiQKV2wAueplYcG6mrQx9uXqZdQi4U
 1FN2kOyAucKkiuWbcYSuvTXj+7Afj0lt3VQ3uPs/l/2z+RW29Gpn3szRR
 Ltt4tfmbXGbZgKFh0VF9k5wy7qqqmFnBN+pRXl1Ju0W6Q2uwVLnbI4NU2
 l4gTAXS7IQaVoxnrV0WhdHeMZVnWdzCHBFisc3BChuM0L7Mze8WTqmX4G
 UTSv2gsnEAcQtZEfPotCf8cDblcEJFmV7e3e2JnK/sglAqNzddjWig+pz
 BLaxJiUEaAsMe6vQJoC/+qtPNZeAh9Wt9ELlaa5L4rvg/Qhk1Tx1rvAAd g==;
X-CSE-ConnectionGUID: Gh60t0hNQ9aeXfNhnlXmrQ==
X-CSE-MsgGUID: 2Drr3ZS9SSC4DJ/ihrfjgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="43559207"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="43559207"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 13:14:50 -0700
X-CSE-ConnectionGUID: jUuEcMbqTIC+nZS3COvXfQ==
X-CSE-MsgGUID: YzGRlkhPRK6sr35dpRiGxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="48579097"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 13:14:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 13:14:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 13:14:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 13:14:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 13:14:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbzE1eCfHaratU96QM82bsi/IZxcfqJI1AM7qpU+3ZGEvxIychV9ogP07wHph1nT7zrfFsPacBcVjBIiBmShX1Y/A63wS7DiqEEmborAeA0yDtaZxb9NQG/JIB81iMrl//8RakGNpKRqqh+gho2MzHzbd5lijqp7Q8RDEc+tSKv+ixXuofwKmofXjfjnn2QhNysN4TTcHhPRxm1y/n6V3ETcYpUDguGLWJkuJ4jYVg0nYKW66qezXPMDwZkQJbY+FqGCxYIvucZnXyAwvZx16N3F/f/BwgHZGB0jpNu4YMMq/K5grslk42ttubKbGlTD7ZrST1boT5zRx4Arfq10xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7sx7odX0sn0+rCQSRZq1G4dUXqD7j9T2v96xoDDhKAM=;
 b=U0yTJ1BNb/LMLpJstpqB4Z2DuWPYdvUJ//DU8trS6ysRUvbJI35td3wKQJu2xOHKP5r9Wkv6X9HAteixn/fkJxjzrcklv0gKpZRGJAis1DGwCBmpQWvSL8dUngO50i0FvnHAQmOArR5pVz9DaCM9TJG5974juFez2l4Wx6fACnXMOrV0HSKmexIlZe+Q4lLZFFjFjZs1xrtN2Zd51cB12Ah/Ag5jEaI4l4hkYsHJwC9TYuHJM6XE83F2hqL2VPjDbPfYK3LN48Izb4N3WFTHGmSOM/mjPP5ZGuAzf9X7lS9v8gzH8lyEwwY8pTyKHjYU2EL439YKBCHOpQclgyqmyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.22; Thu, 11 Jul 2024 20:14:46 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 20:14:46 +0000
Date: Thu, 11 Jul 2024 16:14:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Use xe_pm_runtime_get() in xe_ggtt_remove_node()
Message-ID: <ZpA9M3dz2Kfj5yNM@intel.com>
References: <20240711200031.49798-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240711200031.49798-1-jose.souza@intel.com>
X-ClientProxiedBy: SJ0PR13CA0181.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::6) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|CO1PR11MB5154:EE_
X-MS-Office365-Filtering-Correlation-Id: ccb046c9-69f5-4bd7-aa0b-08dca1e61be5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?K7Ma4ScXNk6CKLq92HEC2jyhEiXTRh64pyqSqpnlAnxyu9s9wdy4hZqEzL?=
 =?iso-8859-1?Q?rrCleFSsCUmu4QpZcgW8WSlB5UJj8yr9Ea4fQsGFixWWaKMSIIDDv5yzXg?=
 =?iso-8859-1?Q?Vc54kY/l4P1hJaLpUZkNW+i8fsGguMVDKZE5efmYYexzHiNQZHQUyTwFJu?=
 =?iso-8859-1?Q?vkoxBV2xTPxxMaS28dNmiAC0KRUn6rKYopqvRK8t5/XllR5SD/4cBzazNC?=
 =?iso-8859-1?Q?6Q3qqOdqca+J1sKVKhK0ouSZVB82cbsaq8P4177hyR+Sf/IuoSZpnTPZQj?=
 =?iso-8859-1?Q?BM9K0rt8vf6kUyppXspWl4HTDSDo3QXSfE1fC7R8T5NY4gHBQgY+HNwoTp?=
 =?iso-8859-1?Q?csJMNZYFI6KAgJWsYDHu9CPQcB3v2Yalx7weaZtPRcr54rM1SYzXxATay7?=
 =?iso-8859-1?Q?Ylmqd65dD/boYA0GhLluEfI5sw1LUHmjLbWTznomJVv1oGdaH3SoKbHHNO?=
 =?iso-8859-1?Q?Tc6nWNIFmJTKD1fe5UMwgkmIiGfdABwJOraE8WGyRWyUvLHCDa6OZJRYkL?=
 =?iso-8859-1?Q?8i03+uBI8e4cX4YMbqVaY6lOLIfSPRzJzm+/xE33zGSm/Jtvd6rq0z220v?=
 =?iso-8859-1?Q?2naHDSTZQSamzLn/Ho/cRdNmCqwosMcVkLoteQWVOGPddW5kthwWrKdMPu?=
 =?iso-8859-1?Q?SGyHM9ggrEtcpLWkszQkWWnZ8sZp4OgxswvOO8/HWug6uBFKU/fzO13+Bz?=
 =?iso-8859-1?Q?xcDyaj792fRDNC9XpZsekc8vlkKJzZE94ytLOaoWc3NCeXMU2dGqYGWIKU?=
 =?iso-8859-1?Q?C1JU8es3XpC1yXCV390WazhGZOtQmmczQ0+Z2MOaHy6cxGwZujO/9F6O8i?=
 =?iso-8859-1?Q?6bShtA0k7TOogPF/v2ug5VDBxmxgsqUyUEXPaSJTSttY8iHr38leNc7yRa?=
 =?iso-8859-1?Q?PigXchmGU1T+B/Y0/b2E+kGtcnS7+bfIVPwrKtGtIp8Z0a6Pd8H+Otom5+?=
 =?iso-8859-1?Q?uqfSLBB8ls5y4VWmQ82Y2E4y6G6P8m5sI5Vzk4MLJ5ZY2CfAR9oq8I0Sjr?=
 =?iso-8859-1?Q?HGVnUcjRaSS/QlBCIBbg/i/tMCOiLrpA0I+T/NmJmeoEMhtQ97AkITDoYK?=
 =?iso-8859-1?Q?adLUrF8wO8B7Ao6ZXECSxUv1gzq1JjXy8Xn9ZrS+d4jYSiVHffHsyJ0Yda?=
 =?iso-8859-1?Q?bvQs+JCmaUo2FSIGg8UTWFGFaJ76cCzM7PGi28q3sxvLLOl8Xgcik7hn6Q?=
 =?iso-8859-1?Q?/oO9XjV8WfKJrRwb67QH5W0jSwPafGgqpLZZKcNKPv7pv/toYJkXxMeRiU?=
 =?iso-8859-1?Q?aQepGU3kTedSC7+rLB3q/n7ZQlw1gDEjOqxgdNrQivAl+JrhJmlVFs7C+e?=
 =?iso-8859-1?Q?Gw8ISm23Yz57KfcsqKoLIxFw8GVygay8M4FZNOOEhFc3UYg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1w0aJkUz1CXWtw9MX0QS3h4wUkcGMMz67qjR1biZdzulyIDkpfgE8J1SEJ?=
 =?iso-8859-1?Q?Pw2eouzTN0oJXD+CfA6UIB9xpVIqzEd6nRyAvUkyIgHfqqn6kjYCCj0jrV?=
 =?iso-8859-1?Q?2BJESEKO4UZiBoA+8StKZi98D3jkLKmy3brP+Z1UJ9Jaj1SRrGjKmKVerg?=
 =?iso-8859-1?Q?00CKIb50otV/PNFrCpQZ37weYgEJ+NPhbzCff1+cyg3DT+L8DCZJoiWyH0?=
 =?iso-8859-1?Q?yfN1vR3Nukr+xR4YM7LWgbYx/3n8TqQ2a6cau4lmloFBq29kUilbnJQNH4?=
 =?iso-8859-1?Q?w2BgkjNwdw94uqi/CBiBW/LxPZimdlsa82Ne0hOrZlCa5TnFff2jGH86h/?=
 =?iso-8859-1?Q?WdSdTjdpyIB1BBfoei55+pZIWaa8xA+eDNUBl/p1OgAar9FG+2yw9LmD8H?=
 =?iso-8859-1?Q?IxatjP9cxmL2ze2k2Q4HocCyGJBVLWkZ7YN88QUgaxc734dSVkiEn6VJxO?=
 =?iso-8859-1?Q?MIL4Xm+4VLaFQdIShh/0Vl1lS+zqIRpWPGfG3T1Zuj2HRFDrqgLvwPNKNb?=
 =?iso-8859-1?Q?OLu+GQBeKlxCK9YJ5+tyoVvut5Eyh6qgZfsRR4RUOGO+oveiyb4rC093xo?=
 =?iso-8859-1?Q?v75qXAS/VezwhedMyXjqroGpBIZ5ofkbcE8yWuRBFwcjB+BKvRH4nihafF?=
 =?iso-8859-1?Q?mMcW8V874AuAQ52Wg6voLV9vPsMgBX8GMbiS17vfIxvB0UJjnNjZcHEATX?=
 =?iso-8859-1?Q?cBlNcKzT9OzmS3jc9q6lKeQgOKQxms8TkyiYz0YJ8Cnqn16Ikc4xrQerzP?=
 =?iso-8859-1?Q?LOHg22Kjl+87KLqHNJbSGgimL8xzpDq7hTu6NDoo/f3AyHn5MPVNuSOpbU?=
 =?iso-8859-1?Q?vaLX7LL2LBwnrZR5+nOe2N8eanZyhujQGEm8CWz5nsaulsKSfMxweNjnbB?=
 =?iso-8859-1?Q?0yppVwHOzWu2ogr2T/BCDwsgaipRXjPHYuCmQShOwjAgCsd0sTDxMVWBp9?=
 =?iso-8859-1?Q?Jv7VWrDjONdnp7YVzwn2eWwmyfVEwoPrFHYcX15A6z0kyWR3DYPj3m3zQG?=
 =?iso-8859-1?Q?BujYF0K2KtWaJUbsfT4RC/eiRT5+I69uW3fysUVx91rDD7Cd7GvNP9nMaO?=
 =?iso-8859-1?Q?nYskiFWrjz41vf8VTTtHcBHzuoog5O2LNuDE0hNbtK4xdmsyYy0U4qXjVf?=
 =?iso-8859-1?Q?U3b9S1Af+JdvuhPVi1VRI61fyFeZYg1IOD8FMMRv0dKJ+PFmWYvYniVKWh?=
 =?iso-8859-1?Q?sic/aFSIjGZDCeBhTko+RkyhHrbrz/7ezP1CaHJmIleABHpnQg4akbLEU3?=
 =?iso-8859-1?Q?MrQBehseWxbhfLFsx9HrM4FUxiOJblNSHNJR7INV8kwRoWAxAikahieXoc?=
 =?iso-8859-1?Q?FMJd39tmA8jHskoHJfL0M9sCV50b53VwGip5mFqGSP4etGuavpxmWGPR0N?=
 =?iso-8859-1?Q?Vb8HJ9HhX2bh0jSc4f89PiqVrQvyBo0wPibcTE72BcyEAOS5pRe28MNqWw?=
 =?iso-8859-1?Q?Myg2TUS6J5s069zNsT7ONpT/8uBV7cIDvPC4/P5flt93Dnh9wlbxBNr95a?=
 =?iso-8859-1?Q?ntJSuQstwOsgDvzEzLCNIO+0Zr3R77V2rtCoIVogGCS5NC11W3WO5jCPbw?=
 =?iso-8859-1?Q?lKH7aWb/OeDYtO8oZ2Iw3UJReOVMZmGlgHjaZgFRL8/DKk8Ze6ufMo8L7V?=
 =?iso-8859-1?Q?WjC7+4k57JI9Mtz6etllmiWOHpSXPot84INCRtYWBCPCS3nRCuusYU7w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccb046c9-69f5-4bd7-aa0b-08dca1e61be5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 20:14:46.5422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lbjq4upzjR4vaOYhkGZ/tu/FvaM2hIW5vJQY9vBjtf94KaSALOU9MlDr6hn520Hb/BZx5kRBHg7JhGhTlrioEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5154
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

On Thu, Jul 11, 2024 at 01:00:31PM -0700, Jos=E9 Roberto de Souza wrote:
> I don't see a relationship between drm_dev_enter() and pm_runtime.
> A plugged device could still no one holding a PM refcount.
>=20
> And this is being triggered from ttm_bo_delayed_delete() and I can't
> see no one in the call chain getting a runtime pm before
> xe_ggtt_remove_node(), so here replacing xe_pm_runtime_get_noresume()
> by xe_pm_runtime_get().
>=20
> This change probably will fix the kernel OOPS below:

It will remove this and create a lockdep splat.

The right solution is this series:

https://lore.kernel.org/intel-xe/20240711171155.173717-12-rodrigo.vivi@inte=
l.com/T/#u

Please help with review there.

>=20
> ------------[ cut here ]------------
> xe 0000:4d:00.0: [drm] Missing outer runtime PM protection
> WARNING: CPU: 100 PID: 3524 at drivers/gpu/drm/xe/xe_pm.c:551 xe_pm_runti=
me_get_noresume+0x48/0x60 [xe]
> Modules linked in: snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hwdep=
 snd_hda_core snd_pcm snd_timer snd soundcore mei_gsc xe drm_gpuvm video dr=
m_ttm_helper ttm gpu_sched drm_suballoc_helper drm_exec drm_display_helper =
drm_kunit_helpers kunit drm_buddy intel_rapl_msr intel_rapl_common cmdlinep=
art spi_nor mtd intel_uncore_frequency intel_uncore_frequency_common i10nm_=
edac nls_iso8859_1 nfit x86_pkg_temp_thermal intel_powerclamp coretemp kvm_=
intel kvm crct10dif_pclmul crc32_pclmul polyval_clmulni polyval_generic gha=
sh_clmulni_intel sha512_ssse3 sha256_ssse3 sha1_ssse3 aesni_intel crypto_si=
md cryptd rndis_host ast cdc_ether i2c_algo_bit dm_multipath dax_hmem i40e =
ixgbe scsi_dh_rdac drm_shmem_helper usbnet mei_me cxl_acpi scsi_dh_emc rapl=
 scsi_dh_alua mii drm_kms_helper intel_cstate mdio cxl_core e1000e libie ef=
i_pstore i2c_i801 intel_pch_thermal spi_intel_pci mei isst_if_mbox_pci i2c_=
smbus isst_if_mmio spi_intel isst_if_common intel_th_gth intel_th_pci ipmi_=
ssif ioatdma intel_vsec intel_th dca wmi ipmi_si
>  acpi_power_meter acpi_ipmi ipmi_devintf acpi_pad ipmi_msghandler mac_hid=
 sch_fq_codel msr parport_pc ppdev lp parport drm ip_tables x_tables autofs=
4
> CPU: 100 PID: 3524 Comm: kworker/u580:4 Not tainted 6.10.0-rc5-xe #1
> Hardware name: Intel Corporation WHITLEY/WHITLEY, BIOS SE5C6200.86B.0027.=
P15.2205121306 05/12/2022
> Workqueue: ttm ttm_bo_delayed_delete [ttm]
> RIP: 0010:xe_pm_runtime_get_noresume+0x48/0x60 [xe]
> Code: cc cc cc 48 8b 7b 08 4c 8b 67 50 4d 85 e4 75 03 4c 8b 27 e8 aa bd f=
4 e0 4c 89 e2 48 c7 c7 d8 1a 03 a1 48 89 c6 e8 08 b7 32 e0 <0f> 0b 48 8b 43=
 08 f0 ff 80 f8 02 00 00 5b 41 5c 5d c3 cc cc cc cc
> RSP: 0000:ffa00000225afc00 EFLAGS: 00010282
> RAX: 0000000000000000 RBX: ff1100014c510000 RCX: 0000000000000027
> RDX: 0000000000000027 RSI: 0000000000000000 RDI: ff1100103fe31a48
> RBP: ffa00000225afc10 R08: 0000000000000001 R09: 0000000000000000
> R10: 0000000000000001 R11: 632da25ec9e647d2 R12: ff1100011d93b710
> R13: ff1100016cf6c448 R14: 0000000000000001 R15: ff1100014c510000
> FS:  0000000000000000(0000) GS:ff1100103fe00000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f4d34e18198 CR3: 000000000aa54006 CR4: 0000000000771ef0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  ? show_regs+0x67/0x70
>  ? __warn+0x94/0x1b0
>  ? xe_pm_runtime_get_noresume+0x48/0x60 [xe]
>  ? report_bug+0x1b7/0x1d0
>  ? handle_bug+0x46/0x80
>  ? exc_invalid_op+0x19/0x70
>  ? asm_exc_invalid_op+0x1b/0x20
>  ? xe_pm_runtime_get_noresume+0x48/0x60 [xe]
>  xe_ggtt_remove_node+0x99/0x110 [xe]
>  xe_ggtt_remove_bo+0x59/0x1d0 [xe]
>  ? _raw_write_unlock+0x23/0x50
>  ? drm_vma_offset_remove+0x66/0x80 [drm]
>  xe_ttm_bo_destroy+0x135/0x230 [xe]
>  ttm_bo_release+0x6e/0x320 [ttm]
>  ttm_bo_delayed_delete+0x82/0xa0 [ttm]
>  process_scheduled_works+0x3aa/0x750
>  worker_thread+0x14f/0x2f0
>  ? __pfx_worker_thread+0x10/0x10
>  kthread+0xf5/0x130
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork+0x39/0x60
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork_asm+0x1a/0x30
>  </TASK>
> irq event stamp: 26249
> hardirqs last  enabled at (26255): [<ffffffff811b8f51>] vprintk_emit+0x35=
1/0x360
> hardirqs last disabled at (26260): [<ffffffff811b8f33>] vprintk_emit+0x33=
3/0x360
> softirqs last  enabled at (25326): [<ffffffff810f04bf>] handle_softirqs+0=
x30f/0x430
> softirqs last disabled at (25319): [<ffffffff810f0e09>] irq_exit_rcu+0x89=
/0xb0
> ---[ end trace 0000000000000000 ]---
>=20
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 0cdbc1296e885..13ce0f51f517a 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -489,7 +489,7 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct=
 drm_mm_node *node,
> =20
>  	bound =3D drm_dev_enter(&xe->drm, &idx);
>  	if (bound)
> -		xe_pm_runtime_get_noresume(xe);
> +		xe_pm_runtime_get(xe);
> =20
>  	mutex_lock(&ggtt->lock);
>  	if (bound)
> --=20
> 2.45.2
>=20
