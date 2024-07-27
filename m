Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE4DC3DA4A
	for <intel-xe@archiver.kernel.org>; Sat, 27 Jul 2024 05:46:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D1F10E0CC;
	Sat, 27 Jul 2024 05:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xj933UXU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0FA10E0CC
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Jul 2024 05:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722059207; x=1753595207;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aV24mxh2nkaqOrmBMhnmIEumsxEwM4fdum6QIhqH2es=;
 b=Xj933UXUKVKPph3h9L2xaqn1SKKyqZawWLqS0HfWsaA0pjKT8tLsgEbw
 qmhybMgMQXFVLzsD30DMNWLuqBAheClkH1ziODsgb9EOSS8gXDIwD4B/o
 qfZ0meIAaAgbQvwQb5SLMEc998Yg3jh91K0ZIK11Pref1qzSGkT8P4Dsk
 xwJnJp36xM97RPxw8udDRcMrt7y+4PpVIvqPQ3pKbQgKcNYfi1mIYlj9G
 ZtJjKuczPWgzk+giB7DNlcAsQkYS6DlsnVvP0cl76enk1kVeudhrhWjUi
 nyQhu1JBkwohDMMpPY0HeuTv8WaVbQmum3YXl9PnaSPmEslISs3nFt4J+ g==;
X-CSE-ConnectionGUID: jDiwYioyQA265c4cx3PGlg==
X-CSE-MsgGUID: oNh+15sqR5+uqkjs80Op2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="23663750"
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="23663750"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 22:46:46 -0700
X-CSE-ConnectionGUID: xByVQEGVTymbJgML2ZArGA==
X-CSE-MsgGUID: MZ3bxqKsQveF5FeuI4kmXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="90916784"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 22:46:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 22:46:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 22:46:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 22:46:44 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 22:46:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMxo0I0xLow9r1XsuYJERajFHFyDSsWk5UDLl2+jdwoYJbRwBftgbWzmACTk+mgPt8ANJ194GdF1pizsKEDmTjX3x/EaIoeAexue2ybz+ypGTWTsK24S6c/DFgxgbhZ6ufuywlWH7GTiWOGI9CYrlsY+//VfLvz8CNMdGaXhi2rFenWdk5PJwgHVRWouXnx8ERbBbL+H2xJamn3w7cPMiBGvRDHYXC7BdkAvBo0uo+EYNcZTMyOFPz74FRvFEEX5ULOUb3QTlboEghW51GhB/EXCNe2+kWgjH2qA5HtRZcigNfgrv129YWT1cJ30j3tW/1xtuRDEicYubz6qcEH4GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a351CglDAwxbnDmckR2t1muqXuwrEJ8xe2Eo37fW4Os=;
 b=RbwFA4HWAuP/xUGn4JyaDRhn9r/vez8b8hQSiSqdMHEoqb8m9Pck6EtxMvUiIl9uEf22BvcqGu8q4WY3/4rphuOkYyqiVnYvZn0zoX3MULRedWm9/4zbVm3L3yVEWFG8FcfgNEGtL12UdvQY+m6PGeBrPZBx1Ly30ypI7//uhhBSp0+wkh2GzSzAfe0QT6UjRAQBA/tTcHEHHj+szQnEDD0IuIOJ9UX4L2FVyq3QKNQNiwk9/hM7lUpabORpc421e+thjL0+DQhinLJAQ8DWM0AuhsEina5Y4ABLuBRK1XbYrqU+/0b8dagPh0hh6IAyp9WwA+zPZ9BG2tPLGEJPvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6066.namprd11.prod.outlook.com (2603:10b6:8:62::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Sat, 27 Jul
 2024 05:46:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7784.020; Sat, 27 Jul 2024
 05:46:42 +0000
Date: Sat, 27 Jul 2024 05:45:51 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Dominik Grzegorzek
 <dominik.grzegorzek@intel.com>
Subject: Re: [PATCH 01/21] drm/xe: Export xe_hw_engine's mmio accessors
Message-ID: <ZqSJj3vceTjEXARK@DUT025-TGLU.fm.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-2-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240726140818.54304-2-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: SJ2PR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:a03:505::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6066:EE_
X-MS-Office365-Filtering-Correlation-Id: 3194c6cd-94b7-4c78-ff8f-08dcadff7e22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8LbYPD+hxTB7CrC8tJ3GaEmKHhdN0dyDDWIMuQBBgG9rteW7FJo5yWjHJW12?=
 =?us-ascii?Q?3NbbjKr0xkwgiSdoPVKth8M+QBkvBHHnMlDalRaTF1SYBytDe0V1ikkX5Wge?=
 =?us-ascii?Q?IFM/qtdNJu9D7PUtA04+nOvl/8yhjOuWCWuEDLe4apSQXJ1u2CfB/ea6JGfe?=
 =?us-ascii?Q?zq4KuDTVmnI8+RPIOYFLM5ue6Lew45efhHZYfxbNDvTTW9wp0Ngb8ZJdNPbO?=
 =?us-ascii?Q?hDTu17tJPPinROAlcFCncSrjXl6QfC52N+hrYotCMf7SlO/6I9WTljiX1dmi?=
 =?us-ascii?Q?M9GiBsi/K+avZ1gY/IPRqNQ0XU8I2V01Pn8IevtZrsvIUz9AevvK00RvrDCA?=
 =?us-ascii?Q?Ry8AL3xB5qC7cxTC3VWo3/ftylQ37U63+RIhFAPpVTUIAFEZI6X+Sy6WvYqV?=
 =?us-ascii?Q?fAlgY4I0cUcXHSduZX6Vat9m+2qcZGUNnmrJKPpV/A0lIDbZWeW+UlmjtJmJ?=
 =?us-ascii?Q?SV5dDsHxLLtwaHudPnEw54fj8Uhoz9LdbILrJ9f5zBcJefY6J80HQ7pD5lTt?=
 =?us-ascii?Q?Zvan1nPe67071LiEoRTVu+LtwmS7Sy2A98yIu3Sag/qzyNYKJJMYXBsYzPEU?=
 =?us-ascii?Q?ZIFdeoJRtgG4Oh9llmBtNvbpRoiwb6xFytp17GRPlhygeDoFHPpHh7BP7Ewv?=
 =?us-ascii?Q?getdUukHCAm90D/V/m8HHXLjmZZk5qckpHyBCrJwtyeZjU3YN2anixBXpKnq?=
 =?us-ascii?Q?yeSnpP6zdiV7HAr39CXIZyk0haZhlOqMdR4xB6X+O01u17CQcRy2kKsZEp/G?=
 =?us-ascii?Q?QP1fuWKNi7jSgppbO9VkhBJdq0LKTWnP4WMIYasAn3UCXmm5Sup6IQEVTvd/?=
 =?us-ascii?Q?JsQhZk4mb+ebtImLoo0VR7gPLcl+mq2jhbqy3FQ4RJxFH0elBhXbh5B7jrkv?=
 =?us-ascii?Q?GpDJMspgsccUcxDlaxItY/3TdLyuVAya7pKraUvNtsxaC2yiQIA75+o3Aiek?=
 =?us-ascii?Q?kdMkKWxJnqUZSEtXSM4UfmVXo3t8bFggf8jlL6j6jhp8j77ZJYBLSuK9t/hh?=
 =?us-ascii?Q?xlwr+RUb1mnBR8RKlQrSMMhbWsrUIOSSWoQHHBoRv3X4T2dDYOMFobvRWBsk?=
 =?us-ascii?Q?F7oocHaEOFw2k8FHQeOfVcu58QwVxpo4bhC+KGaN5P8Eqlo7KyhLYv4Tvbkd?=
 =?us-ascii?Q?2itOKXk7iyEg+QeuLZkPTMQFqi13sMXjqRvqmf7kf2MUC109EP8aYYMYdzUN?=
 =?us-ascii?Q?q/ZqF8F15HE0GvvpJ6bjBPe0B+rxbKwlSahFNtXOVoXhmJBqEp2eBepo9HnR?=
 =?us-ascii?Q?UzR+YpABP4MsGAHExgcWiruQGh7IdEp82WH9e5xzvNwnwziy3vmFKhnnTRYj?=
 =?us-ascii?Q?l3uQtLOVbKgsXrJGcqO6zG9WuvXEk0sfDYsN2LiXvynmqA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/qUJ2BXCGdFmsUQ0XTcmeKyYnTQqgVglpf9UuXYlJB6DDPqgJ7P8h02IzFjh?=
 =?us-ascii?Q?UK2AIumBfEP3OVN0lI/MbWrwDBWn3H0lUERyFn5t/gIlXZiFiDTOzMUVJBrY?=
 =?us-ascii?Q?nvubEaMr43SdUP6V7ip9vl8s/w/36ehGTKqdx29PT9IiOGkDBFwz4/7QZGp4?=
 =?us-ascii?Q?QF8kReeyFjZ2DVe6pOnBFePHyCcUjZwapcoxo6xQ0HgRUZtJdzJ1dl9rdiKo?=
 =?us-ascii?Q?jIXrUjIxr/02bUxIFf+uu8ZexRzrkjpvbZGHnXsoytzxSuSX/+zyAuazA13z?=
 =?us-ascii?Q?GmBfsl/QG3hVjStJPFRxwz/58p5nWti4IHY4qi6O5DA2LkbmOwSMD/FleGme?=
 =?us-ascii?Q?Kwm+S5xQEvo9EaX1aFnQLaazkSbZzBvl4gpd9RHJTAEKxc6KZCdgymD5CHEB?=
 =?us-ascii?Q?CyMzxeGo43HGnCEvfnf70NysRWVCUutByhivWEa36WUw3HnmeOYHuGjFvEuh?=
 =?us-ascii?Q?WtZSA8ialsS6i6i8SuL5UdHR0tbPDu96lc3IDREqtjiS8b0YFcJgEoJa2cn2?=
 =?us-ascii?Q?2rZM7PBBZaWI0LirrXxU1LFWW7xnoig7YaFhY9k/RjkuhRp26ebM8bOJ63AL?=
 =?us-ascii?Q?eoVn8Quqzroe3uYmuBQFTKraTmPYGeygQzRbUDL7yInDXCbLuU/eUSMPGOl/?=
 =?us-ascii?Q?wcdgltFvMdJOEZ94KqtfqTYKAObdWFIlFqtU09TSigxAKFV/mqmBtn28dvdC?=
 =?us-ascii?Q?3qJ+foWWmP2GoZ4J6fctgYNtSzSo9nqW8u5mbmnmNNx6OZA5bUGDXHdqgUj0?=
 =?us-ascii?Q?IajAvqjkG0c/QqjFXdGZVyW58Wg0Z/Q3VZwMfJ1ZoS0k+9tdHPnvRE2sEUWd?=
 =?us-ascii?Q?ZK3a2yeBZvJtxPtloiNC7exrIgBisjErExRDbI0NtdiCOAijQ32MlAaXwH20?=
 =?us-ascii?Q?Y5yfMWJzY3cqQiVcppASsFPaK31cRmRUh31387qkvB5x8z6C8uiaREJTkon1?=
 =?us-ascii?Q?LuSiwt0S6JR6wm59YubLC6UQD4gQO5BAZgps3cLrovRS+xw2v2lQfkVw8GUt?=
 =?us-ascii?Q?9ALqW4nCLHZzlCHb7SVZXGANque1DFV03oMmItDVK9ZlOAmGO2WuuCc3ND2H?=
 =?us-ascii?Q?0DlTKu4hMZOJGyItuNMqtzue77fFIYcxzb3Z54fPnQ86Losw5I09FpRWCd/v?=
 =?us-ascii?Q?I6PDQkG7gY9UXtMVleLiCQlkbPIUP5ABiuh3qwPJXvahrRl0uLqqzvfQX4JH?=
 =?us-ascii?Q?7FcwSkMFkbho14+ijOtzQT6rbpUyhTpBUZaI9HNpKXqsE+UvA3Mod6j5aao5?=
 =?us-ascii?Q?VhP863IC5Oh19RXGj7NBSyBHhi9oPoSGojbQAaJliVR4h9Xrogh6PB34BqHQ?=
 =?us-ascii?Q?ohMLsMuCzU2X138A4J9wJwL7hR3MY1wa831TenRpuBeBv3N74Mw0h0fpuS0F?=
 =?us-ascii?Q?faYPOwcG6CqBVJvUy/oXmiQ3OOGdUyAES4tEspfhCnwyfh5AH36197dGZXj5?=
 =?us-ascii?Q?JahjqBjt3eQZgOFplv73n8vQc/gEuW7W68mR7XMkhapSVck/WU6sfal0U46D?=
 =?us-ascii?Q?ieT6iP1+RJQkCxWu2BZHc0p34VTh5oGXWctojIJr28KseygNV+kbEdNLicbc?=
 =?us-ascii?Q?LrTqVoam4ZX0Kv72bRvM3RFYxWaelOvL4v6STbvLpNzoWohaucDxI8EvR/hh?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3194c6cd-94b7-4c78-ff8f-08dcadff7e22
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2024 05:46:42.5112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OqmNhZLjRqCEOoNtS6u/Tz/dgS+lSR4cjh52iQHDgkV0yrBj8C0iWBB3CHU5ih5pv5E2GBdCIevhjH8Sb2bKvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6066
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

On Fri, Jul 26, 2024 at 05:07:58PM +0300, Mika Kuoppala wrote:
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> 
> Declare hw engine's mmio accessors in header file.
> This is in preparation to use these from eudebug code.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 5 ++---
>  drivers/gpu/drm/xe/xe_hw_engine.h | 5 +++++
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 07ed9fd28f19..b8c0cfbf8b49 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -274,8 +274,7 @@ static void hw_engine_fini(struct drm_device *drm, void *arg)
>  	hwe->gt = NULL;
>  }
>  
> -static void hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg,
> -				   u32 val)
> +void hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val)

Rename this xe_hw_engine_mmio_write32.

>  {
>  	xe_gt_assert(hwe->gt, !(reg.addr & hwe->mmio_base));
>  	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
> @@ -285,7 +284,7 @@ static void hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg,
>  	xe_mmio_write32(hwe->gt, reg, val);
>  }
>  
> -static u32 hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
> +u32 hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)

Rename this xe_hw_engine_mmio_read32.

Matt

>  {
>  	xe_gt_assert(hwe->gt, !(reg.addr & hwe->mmio_base));
>  	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 900c8c991430..08c3a9df7154 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -62,6 +62,11 @@ void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);
>  void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
>  
>  bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe);
> +
> +void hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val);
> +
> +u32 hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg);
> +
>  static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
>  {
>  	return hwe->name;
> -- 
> 2.34.1
> 
