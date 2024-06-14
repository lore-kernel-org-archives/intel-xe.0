Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5489FC27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 16:15:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A8F10EDC7;
	Fri, 14 Jun 2024 16:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hJNfgXwi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06A210EDDE
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 16:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718381713; x=1749917713;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eavrCh4nShM33Ib0FpCvO9aLnb3X4ybeoOdUOg5N0ZE=;
 b=hJNfgXwi621mwlYfWbGRCBkAy8cL2NqRwhpvMBU54X9FqZ55GmdmqQ5/
 A3fwBlrKu2hZWOvsu+Vn1o8lteABe3e19iWwXCLKMthR7Jm+Pwgq7KJYX
 dHbzzI4FvvvrQC4kFDgguA7WFkQ3eiKz6ywg8+ERl2ERa/wIBZeLM/3lP
 +oQxmiYgff73tYyjav5T+qTnJJ4RkH6IXz3oYicBdntSYJFGlG6K2dayy
 af66fry7DGgzCD0E7ybSgqOkb0YR1oYpHfNCDxxhMTFa+QKlXm6g1YZM3
 IrAJxJCQ6jOLtue4jz+Qfz4hSmYbYTv1O1+4A1/XJ0sayyUD2lyQ34d1o g==;
X-CSE-ConnectionGUID: ubeYez87SYS/qWzkk2M8Xg==
X-CSE-MsgGUID: irlBWMBiROCy2Q/UhLd8lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15424974"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="15424974"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 09:15:11 -0700
X-CSE-ConnectionGUID: xzUzV9DeTWWySSIn02d9Ew==
X-CSE-MsgGUID: HtrUiukLSiaLOmbg4FXUig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="78029106"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jun 2024 09:15:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 09:15:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 14 Jun 2024 09:15:10 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 09:15:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TT0hXhq7oBlqRhEizihh/FjYuBHByLB+UpIfVwtNYQ7oM9+PxVEey8hGM3GqzEaJyG3JgZlHA/JFvocyZhRf7GvqGsPzQCiccGV0aeEOl+aY5TWvAD0E46n6VwUK1QEXtr1Aic0cwPnblH8SSg5tQvLijPbS09UoY69PSevZvm5yZAbQxhJl+oBjiz4BdsfAWwkmZZUDZPzMdovt3zI/+1dMoRwcyPbmI7WnXGzY6WTiy2uewBNVsHd+3QdudbBQ2cJRedz9MbEislh+chT+MB51IsGlSiBi12RDCzkQoNf/YHNHoNNPLth7j9ZE61+vUMWWQb05RK7HhZ1X26PdAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ya6t5S1JzBu245m0TW/ilEEQ+BajHxQFBHJ1BFzbdjo=;
 b=Hg1pRnowEMpOrIJAxf9vIH8r5BrouEDBkrXOJV/n3lVPqFcsWx5JKp1xDgMXDI4XXM6NO3qadwroGk2z0TauoJPWunzmKTGwlybEEYQFozqCbhb04dRTZ4nJl4EsNd325SfSxGu3i0Dl+KsimRSOOICzJwyhlSPKQI2b6hdRYb4zDrQpbYcfhzr3E5XMr68e9M7O8pljJ9MrhQn0AvUYphId+H/ozjeePVDoI+hGG8Qj/7om91ucoKCp+IJGdwUvYJNaJFEcI1vxFshwOFl4+B3SiIx/UKnbURepQcnQvll43iu3rRebNT51iJjysmF975/k3TcAxFHKzE+wVDZ+Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB8225.namprd11.prod.outlook.com (2603:10b6:8:188::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Fri, 14 Jun
 2024 16:15:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 16:15:06 +0000
Date: Fri, 14 Jun 2024 11:15:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <ashutosh.dixit@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <krishnaiah.bommu@intel.com>, <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH v9 2/2] drm/xe/pmu: Enable PMU interface
Message-ID: <jldfwuyzm6pxms7qt2yqj57bb75lquvn27socbcxrfcevvt2s2@nllraaafjqpq>
References: <20240613100411.1579218-1-riana.tauro@intel.com>
 <20240613100411.1579218-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240613100411.1579218-3-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:303:dc::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a1699c7-ba48-45e1-b843-08dc8c8d279a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011|27256014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5og0OQPOA9PF45IkIVPzj6DUr+c5HNQ+icsqh0NGis9YyFBuBnXmd+yGR9?=
 =?iso-8859-1?Q?miA/hJu7Mxdw1vs75f5l77lJezLKqZOe5Icjf9ekOOu4QPlBpoUsmstAP6?=
 =?iso-8859-1?Q?ar3LHS03OWdugOpOUUnKIq9+hcLDpmPE9zFuMkuhyLN8Z8U7lqG2WiKZFg?=
 =?iso-8859-1?Q?zLhtYt7KVNLSm4MK9B5eJfPpM9Z0Z/QImI9bs/Oia+mumzEqmm/2mvnti2?=
 =?iso-8859-1?Q?4S+u4EmJGNHKOXXpO3CmgQG+v/M3ChubI4n03D46gEIhvKoQfFSnoM1TxA?=
 =?iso-8859-1?Q?4an+GDwRG4iknlKfqz69DjhbgljeZePGX67Hapv0DR/fWMJ3/MSkR/ysxF?=
 =?iso-8859-1?Q?alerZTHLlDDVTtcbvF4b2xX6ykOl0l4nbGfyy57nj/hRiWUGjr4dJjweuJ?=
 =?iso-8859-1?Q?bO8YSgo1j+1g7K/HbNdiDKIhYLV9ftDBRb9Kf59zcKMt9OmKwzMfbMQG5S?=
 =?iso-8859-1?Q?M033mVJJKAbPCjfOwd6uUJlHVr4cwrkuyQ/OORxpNiPjIM29QQVGmcHE/O?=
 =?iso-8859-1?Q?o6N9Ufie2B/WCnVAbqLNIV643jf/ucVmL0QGEcB/vozzeROU/HEzr5Vwce?=
 =?iso-8859-1?Q?RXLjU3b0qJz9ib7OBx9qcgDD808fX+dtx2jyhAoyyouulxf1ibh5hBOA5Y?=
 =?iso-8859-1?Q?7RxWD3tLPYdphNHdAfDxaF+VtwhJ2LFb2UljmTKdZulRk9FkgCj+UKCgHC?=
 =?iso-8859-1?Q?wZNvszzRzVW8MyFdBuFxbJvxkFKqG+Vyfc+zsIuGufB5TZZYoI+Wb31cGY?=
 =?iso-8859-1?Q?a38xlaAmbE4IbARFFXXGhjICaCVYLOWcPbG50BZXlWrhgtL5HOnpxRyyGn?=
 =?iso-8859-1?Q?xnqgeF8RzoJKQiGTOrUjNuFzQ1lRBod/sLJfD7v7aboEwPRuiRUGiDBc0G?=
 =?iso-8859-1?Q?PFnTrxewz5u71j4fP8QuI7ibRy0P9Vg8mv2JAjQsNFelrVC3p/+VNqAXJk?=
 =?iso-8859-1?Q?ahA3twQBc2lE55oWlTs3KOliAhOlrHsKhHRAlbpqZpKNeX+bXvmH8jLBQl?=
 =?iso-8859-1?Q?ZCYHCMXPOgZVvYZE/Z1ssgjcQ2P0AFdCk0xAC79WriuKiRn5PxU03roBCf?=
 =?iso-8859-1?Q?rw90vqED4E1tuKwhxpO8Z+3HRcBdw/ofjcm3mBwAEJxVsaurGWvYcARnmr?=
 =?iso-8859-1?Q?uKp0dWyof65EiwsWHy9t41nCBcH48p8H2TES0jKM7IHXPALC1nWRqyraeY?=
 =?iso-8859-1?Q?hfUmD/qq479k79+4Eell2ZnvUqDG1K5e9Wh1N5nU4o/E7vjF6VdMWwVDpF?=
 =?iso-8859-1?Q?6ZDJ3O23VsfiAdGPRKYoXDR9K+6Ek9NMsNRC+yJJVEu63lIGBoAsn2XRqL?=
 =?iso-8859-1?Q?c6Fakt674vyhejVmihkXWek/emZi31Npbqmzm3mTMvXw2MKeyQAboD5Axk?=
 =?iso-8859-1?Q?NtGGZ8ey1L?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011)(27256014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?bPvWLJl+GM1SsVUIHgLpP4uEAMBZxEecFkTwX3vWwLJKcn1WualHxQhcdO?=
 =?iso-8859-1?Q?f4wKJh1JZIsZ755xBGe7Daur2mhY6mZYcNPv1/SOYf7DfekyM42ppVDvQx?=
 =?iso-8859-1?Q?XNd5/ljec0+wkKUCRQujcr0LsIUHBbuX+98gVd44tSnBT+bqh8woneE/yJ?=
 =?iso-8859-1?Q?c4rRZHymTLhyibif3bB7lF+pnYvRxWBS/BzriwAbpGF79zuatAyugebgI7?=
 =?iso-8859-1?Q?UxBHSz39sXcyCpvOHKAcVMkA76VFDI2NOAJau7Mmx0eDBznyLtmsuj3mYQ?=
 =?iso-8859-1?Q?/icC9x+YjBsJLPMq0+Q62zk1r6293vYwulVc9HhhOpDWFLAnoxCOJGnYtD?=
 =?iso-8859-1?Q?banzdHsxk1+VnanT4qjF2j4/HNRAmfDLSwS2XYgZ+OrI5OSQJ4MDkJmSiP?=
 =?iso-8859-1?Q?f4oIyL+zsU1FndReT58P8ZaZnob/mem6Z+gxx28ahftIi88cMQudyVdZ9A?=
 =?iso-8859-1?Q?RTEzDHnNQsDR4CIuK0zKnCEVgJi2S10vU3BSo3q87bpWhFk13wysBmVjdn?=
 =?iso-8859-1?Q?9bXkj80SxkqRkd8F3OiXk31XGC7zUC7F1EUSgUMqxbbjPH4GC3EvMBXtRD?=
 =?iso-8859-1?Q?urwCKdg2r5rdhta+3DntfKrxsiuOdzEIUu0gLC8aqBShrDx77R+60fM1E/?=
 =?iso-8859-1?Q?X/QJNoO6oGapgV7qbTwUsmF3OMYvaW3K/E7bD4pRkjMoLISfJdEkpwx34O?=
 =?iso-8859-1?Q?pdjAhUiOMblWTZ2yXhtB3Uls6qQW5tvrAExaLRU8tsDzXmeC8AiwkWc3jV?=
 =?iso-8859-1?Q?x1gQIJWzIJRs+hCiDH2jX+peu7DxchtcvOJf+iuyjijltFvuZoAh5VrLKU?=
 =?iso-8859-1?Q?xXPES1Cbstb0RzgF7mPQrUsGfqbL3gRJjONEx9+UQ62pJqMLxYr4+b0Tth?=
 =?iso-8859-1?Q?xXwrJUn+qTKRCGbrXtC6n9oIrA7rKqP7sCJMJCQ9vZp36wnpSo4OOOquFg?=
 =?iso-8859-1?Q?m3KHqNIGAOEnU39DHhhMWe8dqy/eVYWsuowfujBNw2uqowtGJjz9Yjk+Tm?=
 =?iso-8859-1?Q?xr2WS32w5N1MWYwPTD+a3DhJDUpGVz2/2xM7q6x8vtka2e+ikG3Iijl6AY?=
 =?iso-8859-1?Q?k52vDfdJXKQICrGpx1b/S/+G4SGKu2km8WWK1FDDKWXtzQtR3zQwgPTKEX?=
 =?iso-8859-1?Q?266nT1Y0GbkQRlYPSNYGS+vZ32dAGvkMWaQj6832wlEnHCHbeusv1Y12jy?=
 =?iso-8859-1?Q?8dI7T6ua7bCuDtDuRf8TOLGKg3BXeE2lPTYGSMOJ577Lc2A5Vcjyh/S0tU?=
 =?iso-8859-1?Q?BjcsaDT7xDBcaDOv+D9SYYDdFuyhayQvn3PMc2xMfuKVwOpVRLvE/rfZHd?=
 =?iso-8859-1?Q?3Ti7U6JxpgbbTKbhSTsT53VZrncPHSa2XW2JsF6/FIOJsVuMqlT+AbSutL?=
 =?iso-8859-1?Q?3a+lcu6TXQRd+MQZCosOxmW1f0MC7ECgkX4Wwz0HcaBnDPwxgWxPsM86gE?=
 =?iso-8859-1?Q?W2EHuJMc+9gNVuO1Tkm+BqTVSfORMI+Zkzi8Tv/0z3k8r6Lf99ry92eILR?=
 =?iso-8859-1?Q?nLxkjVPSuxJ6zDW7yPaddMsxZ4nwK4N356IrOFRreWgqRHFihEtsjVCUfU?=
 =?iso-8859-1?Q?EGGrvdITrSFn3jukAdSHVemESzMtwiIZDyX0ZIL/TvSM5zG2YUgYTOBqkd?=
 =?iso-8859-1?Q?I0gcYGgNEBwDq9J0IMumayoE8MwB4w81of8mx/BvdMJP2KRpD1laVgSA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a1699c7-ba48-45e1-b843-08dc8c8d279a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 16:15:06.5736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: umKanTTD358JlrPXIGxqiVADOK5GuCYvOOQDOaQFmR2ge3S2N04qcQvtA3wfrVxi/sFUC649Ej/NQzOhsTyYLdv8Yk+JH4e7vfdL0sn9XME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8225
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

On Thu, Jun 13, 2024 at 03:34:11PM GMT, Riana Tauro wrote:
>From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>
>There are a set of engine group busyness counters provided by HW which are
>perfect fit to be exposed via PMU perf events.
>
>BSPEC: 46559, 46560, 46722, 46729, 52071, 71028
>
>events can be listed using:
>perf list
>  xe_0000_03_00.0/any-engine-group-busy-gt0/         [Kernel PMU event]
>  xe_0000_03_00.0/copy-group-busy-gt0/               [Kernel PMU event]
>  xe_0000_03_00.0/media-group-busy-gt0/              [Kernel PMU event]
>  xe_0000_03_00.0/render-group-busy-gt0/             [Kernel PMU event]
>
>and can be read using:
>
>perf stat -e "xe_0000_8c_00.0/render-group-busy-gt0/" -I 1000
>           time        counts unit events
>     1.001139062            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>     2.003294678            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>     3.005199582            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>     4.007076497            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>     5.008553068            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>     6.010531563        43520 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>     7.012468029        44800 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>     8.013463515            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>     9.015300183            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>    10.017233010            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>    10.971934120            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>
>The pmu base implementation is taken from i915.
>
>v2:
>Store last known value when device is awake return that while the GT is
>suspended and then update the driver copy when read during awake.
>
>v3:
>1. drop init_samples, as storing counters before going to suspend should
>be sufficient.
>2. ported the "drm/i915/pmu: Make PMU sample array two-dimensional" and
>dropped helpers to store and read samples.
>3. use xe_device_mem_access_get_if_ongoing to check if device is active
>before reading the OA registers.
>4. dropped format attr as no longer needed
>5. introduce xe_pmu_suspend to call engine_group_busyness_store
>6. few other nits.
>
>v4: minor nits.
>
>v5: take forcewake when accessing the OAG registers
>
>v6:
>1. drop engine_busyness_sample_type
>2. update UAPI documentation
>
>v7:
>1. update UAPI documentation
>2. drop MEDIA_GT specific change for media busyness counter.
>
>v8:
>1. rebase
>2. replace mem_access_if_ongoing with xe_pm_runtime_get_if_active
>3. remove interrupts pmu event
>
>v9: replace drmm_add_action_or_reset with devm (Matthew Auld)
>
>Co-developed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>

first s-o-b should match the author in the patch. According to the
"From" above, author is set to Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>

I wil leave some nits about the implementation and focus on the main
concept being added here.

...

>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>new file mode 100644
>index 000000000000..64960a358af2
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>@@ -0,0 +1,631 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ */
>+
>+#include <drm/drm_drv.h>
>+#include <drm/drm_managed.h>
>+#include <drm/xe_drm.h>
>+
>+#include "regs/xe_gt_regs.h"
>+#include "xe_device.h"
>+#include "xe_force_wake.h"
>+#include "xe_gt_clock.h"
>+#include "xe_mmio.h"
>+#include "xe_macros.h"
>+#include "xe_pm.h"
>+
>+static cpumask_t xe_pmu_cpumask;
>+static unsigned int xe_pmu_target_cpu = -1;
>+
>+static unsigned int config_gt_id(const u64 config)
>+{
>+	return config >> __XE_PMU_GT_SHIFT;
>+}
>+
>+static u64 config_counter(const u64 config)
>+{
>+	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>+}
>+
>+static void xe_pmu_event_destroy(struct perf_event *event)
>+{
>+	struct xe_device *xe =
>+		container_of(event->pmu, typeof(*xe), pmu.base);
>+
>+	drm_WARN_ON(&xe->drm, event->parent);
>+
>+	drm_dev_put(&xe->drm);
>+}
>+
>+static u64 __engine_group_busyness_read(struct xe_gt *gt, int sample_type)
>+{
>+	u64 val;
>+
>+	switch (sample_type) {
>+	case __XE_SAMPLE_RENDER_GROUP_BUSY:
>+		val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
>+		break;
>+	case __XE_SAMPLE_COPY_GROUP_BUSY:
>+		val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
>+		break;
>+	case __XE_SAMPLE_MEDIA_GROUP_BUSY:
>+		val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
>+		break;
>+	case __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY:
>+		val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
>+		break;
>+	default:
>+		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>+	}
>+
>+	return xe_gt_clock_cycles_to_ns(gt, val * 16);
>+}
>+
>+static u64 engine_group_busyness_read(struct xe_gt *gt, u64 config)
>+{
>+	int sample_type = config_counter(config);
>+	const unsigned int gt_id = gt->info.id;
>+	struct xe_device *xe = gt->tile->xe;
>+	struct xe_pmu *pmu = &xe->pmu;
>+	unsigned long flags;
>+	bool device_awake;
>+	u64 val;
>+
>+	device_awake = xe_pm_runtime_get_if_active(xe);
>+	if (device_awake) {
>+		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>+		val = __engine_group_busyness_read(gt, sample_type);
>+		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>+		xe_pm_runtime_put(xe);
>+	}
>+
>+	spin_lock_irqsave(&pmu->lock, flags);
>+
>+	if (device_awake)
>+		pmu->sample[gt_id][sample_type] = val;
>+	else
>+		val = pmu->sample[gt_id][sample_type];
>+
>+	spin_unlock_irqrestore(&pmu->lock, flags);
>+
>+	return val;
>+}
>+
>+static void engine_group_busyness_store(struct xe_gt *gt)
>+{
>+	struct xe_pmu *pmu = &gt->tile->xe->pmu;
>+	unsigned int gt_id = gt->info.id;
>+	unsigned long flags;
>+	int i;
>+
>+	spin_lock_irqsave(&pmu->lock, flags);
>+
>+	for (i = __XE_SAMPLE_RENDER_GROUP_BUSY; i <= __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY; i++)
>+		pmu->sample[gt_id][i] = __engine_group_busyness_read(gt, i);
>+
>+	spin_unlock_irqrestore(&pmu->lock, flags);
>+}
>+
>+static int
>+config_status(struct xe_device *xe, u64 config)
>+{
>+	unsigned int gt_id = config_gt_id(config);
>+	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>+
>+	if (gt_id >= XE_PMU_MAX_GT)
>+		return -ENOENT;
>+
>+	switch (config_counter(config)) {
>+	case XE_PMU_RENDER_GROUP_BUSY(0):
>+	case XE_PMU_COPY_GROUP_BUSY(0):
>+	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>+		if (gt->info.type == XE_GT_TYPE_MEDIA)
>+			return -ENOENT;
>+		break;
>+	case XE_PMU_MEDIA_GROUP_BUSY(0):
>+		if (!(gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0))))
>+			return -ENOENT;
>+		break;
>+	default:
>+		return -ENOENT;
>+	}
>+
>+	return 0;
>+}
>+
>+static int xe_pmu_event_init(struct perf_event *event)
>+{
>+	struct xe_device *xe =
>+		container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_pmu *pmu = &xe->pmu;
>+	int ret;
>+
>+	if (pmu->closed)
>+		return -ENODEV;
>+
>+	if (event->attr.type != event->pmu->type)
>+		return -ENOENT;
>+
>+	/* unsupported modes and filters */
>+	if (event->attr.sample_period) /* no sampling */
>+		return -EINVAL;
>+
>+	if (has_branch_stack(event))
>+		return -EOPNOTSUPP;
>+
>+	if (event->cpu < 0)
>+		return -EINVAL;
>+
>+	/* only allow running on one cpu at a time */
>+	if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
>+		return -EINVAL;
>+
>+	ret = config_status(xe, event->attr.config);
>+	if (ret)
>+		return ret;
>+
>+	if (!event->parent) {
>+		drm_dev_get(&xe->drm);
>+		event->destroy = xe_pmu_event_destroy;
>+	}
>+
>+	return 0;
>+}
>+
>+static u64 __xe_pmu_event_read(struct perf_event *event)
>+{
>+	struct xe_device *xe =
>+		container_of(event->pmu, typeof(*xe), pmu.base);
>+	const unsigned int gt_id = config_gt_id(event->attr.config);
>+	const u64 config = event->attr.config;
>+	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>+	u64 val;
>+
>+	switch (config_counter(config)) {
>+	case XE_PMU_RENDER_GROUP_BUSY(0):
>+	case XE_PMU_COPY_GROUP_BUSY(0):
>+	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>+	case XE_PMU_MEDIA_GROUP_BUSY(0):
>+		val = engine_group_busyness_read(gt, config);
>+		break;
>+	default:
>+		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>+	}
>+
>+	return val;
>+}
>+
>+static void xe_pmu_event_read(struct perf_event *event)
>+{
>+	struct xe_device *xe =
>+		container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct hw_perf_event *hwc = &event->hw;
>+	struct xe_pmu *pmu = &xe->pmu;
>+	u64 prev, new;
>+
>+	if (pmu->closed) {
>+		event->hw.state = PERF_HES_STOPPED;
>+		return;
>+	}
>+again:
>+	prev = local64_read(&hwc->prev_count);
>+	new = __xe_pmu_event_read(event);


so... when we enable a perf counter with the example in the cover
letter:

	perf stat -e "xe_0000_8c_00.0/render-group-busy-gt0/" -I 1000

then we will have the following call chain:

xe_pmu_event_read()
   __xe_pmu_event_read()
     engine_group_busyness_read()
       engine_group_busyness_read()
         __engine_group_busyness_read()
	  xe_mmio_read32()

At a frequency up to sysctl kernel.perf_event_max_sample_rate  (~50kHz
in my distro). The event itself is recorded to the ring buffer if it
changed.

The HW interface we are using is to simply read XE_OAG_*_BUSY_FREE.
At the same time we are trying to add new uapi called xe_perf (that has
nothing to do with perf, sigh) that exposes OA as streams with ioctl.

Also, at the same time we already do per-client engine utilization and
with the usual very few clients, why couldn't userspace just aggregate
the values per engine?  Is it really useful to expose this HW counter to
userspace? From a quick look, it doesn't seem that much more accurate
to use the global (per-engine-class) counter.  The bad non-performant
part IMO of the per-client side is the client-discovery via /proc

Also not clear to me why we need the percpu part if we are collecting
the GPU counters. It's more than 10 years I last played with the
implementation side of perf counters, so I'm needing a refresh while
looking at this.

FYI I started to look to thi series because of the problem reported in
i915 wrt perf counters while unbinding the device:

https://lore.kernel.org/lkml/20240115170120.662220-1-tvrtko.ursulin@linux.intel.com/T/#me72abfa2771e6fc94b167ce47efdbf391cc313ab

and

https://lore.kernel.org/all/20240213180302.47266-1-umesh.nerlige.ramappa@intel.com/

Tvrtko, any additional feedback you got from the perf/core side for that
series?

Lucas De Marchi
