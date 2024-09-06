Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC14E6FE49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 21:51:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE8B10EAFE;
	Fri,  6 Sep 2024 21:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tzf64yZp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A1710EAFE
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 21:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725659510; x=1757195510;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MX7MYqoM57UMrLPZ4A2ug1OW/TEIUTxsjE+GW0lZxrU=;
 b=Tzf64yZpcFBl4q6hQLwJ2GGQZr6UepBvsmog1IhszV54U6ru8pfvpF3J
 D0XQvGIzsB0YQdJqdL4LDkGQIK8wFYWN0saqH0zYyQMAxhPnxBCWhhLEj
 voSjaQ2ZXv0YkXuYlaDwhs7LiemnZSs8/kohvpj0gY8pRm1qzHjYBTkh2
 X8b58OYeQHb20XJHDwJxB7dP9hcrMhUQ6Fzl3A8JEy2tkQ8C2w52qCEH0
 MI38zZ0+OMKEM2Pn76gkANOO+SHwugcpjl9TTJ9thOPgsj55VMjiau1i3
 4CcZ+AGHWQMl7BkB8dmu3i0zl11UyRPdY0JvYImmAjcZlaZcCdeTKQ4c5 w==;
X-CSE-ConnectionGUID: /PEg/foGSUurMbtIq7qkCw==
X-CSE-MsgGUID: GirXZvOKTw6ockC76W0uEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24580541"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="24580541"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:51:50 -0700
X-CSE-ConnectionGUID: Hkq9AbpRQvu4m+pPvYuB3g==
X-CSE-MsgGUID: 85XPCwpzRcmtmlopKlBcQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="70656264"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 14:51:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 14:51:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 14:51:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 14:51:48 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 14:51:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sx9iqsbso25XrAQUy71DBfF4Oj3imnHESDn97gicquWNuGB/HPrgdOkmvdhbSFIz17q1qnLUHEOa0z58WNV5cqoQRjrQotWEOkEU4Q71jaLS38wUktdFNPdAA0Q93L2EGfs4Q4ow03enuc7niUCImvS2GX2jvtrOyrN9BkBrBhgth9A3zjNoPtFOXUsDx9u7jJPegNNGfPuyPhd/bYOPft6XcG56UpVJ+mQhhe0fkCRZnI3z2lVm1LDEqyFudTMQvTPgX+V6jqYkbgJtj3Eo/+IZu4k+vzKlQWuWOMnFC/y0oUVbUQWdKMONfALzCpZ+7hxoHRhDKJqQgW982XTRTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OB5dWqHMZ4KIOAL4AoBBJSK+TZBLYi0/OeLCWTusw0E=;
 b=LEJ4Xhxq22SqNTJX8iexP+JvKkSPkQLmulppUmd592s2QlnJFLFf/r37Mb/P9dFHTd1DkwBM4VJJDdxZkngxI6zful+2aQ/PZIRHiVkw0Up1oKmn2ZrpHuGDBzWr2xmV+6ydVzdp9EVA/FNhzJ+7Y3ULdTISt4inACoYvErtc/3P8h9uc4IaG/g/WFAsnpnmRedS0rAG7T5MPmi+aF/IPtR9DDLOIH/6FQpUsbjA0bUMpcbwDq1ulMVAAv/+PiZbLTCZ3bm3OXDrHwOwbEHS8A23pZR3SVZZJzhcsbokGxeU+Ao/6bC/7XkitcANKnY3xfKazdb2cAsbQR4t3PjcxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5193.namprd11.prod.outlook.com (2603:10b6:806:fa::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 21:51:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 21:51:45 +0000
Date: Fri, 6 Sep 2024 16:51:45 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 14/43] drm/xe/compat-i915: Convert register access to use
 xe_mmio
Message-ID: <glqsszabgf5tew74yruts5sb2z5kpps6pkzmbap3jn5ooufgma@7ursa2x7hriw>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
 <20240904002100.2023834-59-matthew.d.roper@intel.com>
 <87cylhnoj2.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87cylhnoj2.fsf@intel.com>
X-ClientProxiedBy: MW4PR03CA0239.namprd03.prod.outlook.com
 (2603:10b6:303:b9::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5193:EE_
X-MS-Office365-Filtering-Correlation-Id: f34772df-14b2-485b-eb61-08dccebe1a16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kpdoo8LNUyuDj2AxD6vlhc5C0MPCpwV7HAyJL0yBaTXutj+VgVveXKNRu0pr?=
 =?us-ascii?Q?Tp0+jk4SezYFnDgVFkA638zoBJQO8Coi/I8Mv+98cKX40u6Y6ddDO26hQ1AQ?=
 =?us-ascii?Q?/SF/uW647z6voZ6dy0ih1WOHlR8taXMOQ6n4PkX6iGkw9roWgP2IDZhPgR6z?=
 =?us-ascii?Q?6RJnH1kO+okL3/i5GrKEey/iugqz79r7Z5mdY1/ZLj3b4t/Ae/wwE1bld3Ol?=
 =?us-ascii?Q?cw9P4EjhG2HVX6w2HfBD9ptgTJjp9wpPLgrlRSVWB1v0tes3LXkSTaqGel0b?=
 =?us-ascii?Q?wQ9tszM7OlaVIjo9vRfR/9JT34+Y8+jQDSgBlAH0DfwH/SC3Jcg9wH5Rb/oY?=
 =?us-ascii?Q?jAHMQLIC3edul6WiH1D7FiAYeGthny67hHX4JXwIH20fxu4+VjimsFQqV8Ud?=
 =?us-ascii?Q?pcBIXqZ/LZf8bDIXvV752UqGIGK1iIw698wlR289yCgUpcQDyoH5eGq+0S6W?=
 =?us-ascii?Q?Svmm9OGo/npWEfM5Dq/oSsxs+VKGOChlsEvWy4hm/kKxwpskoHgMY7AfEEUD?=
 =?us-ascii?Q?NWn5EmuI8aIw67PYvulzmpHo5L20a4bYjpVkr/2VCiXe7fheu1EAtafudzdB?=
 =?us-ascii?Q?HvwQ8miNMRNCyo0ukxMJa9q1HmiCkribUPrZJ7oin7wMYrPZQDsVcyagafhx?=
 =?us-ascii?Q?JC/wb4BTO5mAvTouDCBrcs36YM0S/AmsmV9h9zgyJy/yH+NDKWcuxQQL5AOA?=
 =?us-ascii?Q?cGaTjqzXb0tVuxFtqe/0ZJKe851BkYddiHDgZm9fBz6BOMrBl+08ZpXe3jvz?=
 =?us-ascii?Q?ZLEAzlFuV0r91BVr1CwmjiwrQQlolhTmCcbWCI1gdiBELZV6qQiUqLPpnqYA?=
 =?us-ascii?Q?POkR59FzNRAAQiLtxkAU6A/WXHcdOCw/tVNAVuPQFsNPQI7Mg4Ga5txbUXma?=
 =?us-ascii?Q?Ot3vx7Xq5TKNRxFDUUQSDlI3S4ZRpkn2sQuKm6qytc67bp7Ts4fmAXXlHaop?=
 =?us-ascii?Q?rfK87dyMw2FcBVPeAtdlT/WH42pK2NBM+DG8AvL+QSzgXE5MEmIbJ2sSZK9W?=
 =?us-ascii?Q?phC6UgyKYDyNFxmZc47l5ZltlrtmZnZgPINxpmT4Ru+VisCGQ55aufczyDrn?=
 =?us-ascii?Q?1MVkmHQsDJeplWrdRHSAxHNi/cAD7b7F4LqgdFZcbOLbtOWC1xTFBcXueM4W?=
 =?us-ascii?Q?YbVBrL9aXhj+HXfpE+RxWVY/demBYslw8jUYsr9zxvEuJPpaS36jpK76Y66B?=
 =?us-ascii?Q?fyM8KhwX5a76DTAFLH88ERpKW/ukxyiV/ONbklQN1pXoOXdC8kIX7oelUxfl?=
 =?us-ascii?Q?62bSchD9vC0FVyL0feLr14/tI9Us9E286xp3X5JywTneh9ZUzwkg5ALxOi6e?=
 =?us-ascii?Q?/pXdBQp/aXF6YJLrg1pgNx/PHDiu73rfXPXoB/rfBfDgjA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NeUzBGZn09BNJKD0Co/fA89WxE5+R/mzehRTE7kD0U9AHoUk2UnIjVtOrBqG?=
 =?us-ascii?Q?4qdtbDNm2e5ohFgyYEpV1Wpo/JJDvPKxwxo2iYWZ8iOZPJvhyZ1xp5wNO71t?=
 =?us-ascii?Q?IAhaYu0QU3A+y6XBB6gBvTPCHs4w8XbQEuuPy0D87zZEsT+aF3qV8iUr30CQ?=
 =?us-ascii?Q?ezBXXtxnyFLkiVh+FIyDR6gwUblA2y70rjseziY5T2XXtvrG7Myy7+pEvXba?=
 =?us-ascii?Q?prWJdeHdgyI7cZENtjdYlYCT/gkktnv1Pqx7sMM7qUBkM2p7VOk3u/RvrPHS?=
 =?us-ascii?Q?aRr6gfbk7Xf/Mz23FIzx1lQ9zP9/ydIL+O7TeUUcGm05LektBYAphmAPH3Hs?=
 =?us-ascii?Q?Cu//Hg+faCsG5cbYrPurAR1Hvvh8KRZH3pVVjGsll2OjRxORW2Kt9k5YBWOs?=
 =?us-ascii?Q?hSWPfXSzJLvQRZM/1NMJZsukwN04D1Fx7om3gqPvkGkVhrsamGnAhhSKn5cE?=
 =?us-ascii?Q?skiNW0pnFVNFX+YL+ZVoGwpB5EpD/wybeesbOXiv9R7Bq1RfpcB4RHHaCb07?=
 =?us-ascii?Q?xRp8Q8a4xw0qaj1IfUl0LUT0bZ3iFm1GcIpyoBQMyjBwHjKDV5fRsKlOzVbT?=
 =?us-ascii?Q?ZD6j8HtCTM2+hjG5OzLubyNZhQxN0Cf1pm68+WixOkKU73TifpTDb0JUygKE?=
 =?us-ascii?Q?3sV7bhD/7s2rW957HKsR5VM5nybAVhPp6Ga0WJmU4WhijruNCnRTgY+atKKC?=
 =?us-ascii?Q?cN/Ep9T4RgP/GBZTTgzQn6iJbpxDqOvj9XfyPgOm/gJRJXfD6iHA+C8NKIfS?=
 =?us-ascii?Q?AzjyBc/fqm6fdZ9bODxyyCMqkh/DDUZZfl7cB12R9WE8dCS0TE94ygY7mUif?=
 =?us-ascii?Q?KK0C6Ho8Fe4u+lk0vdR+UnD0gOT9gMc8KYY4EHgZacjQ9UrHgWw0br111HyU?=
 =?us-ascii?Q?CFNvJSmgmpHuSkxfh5h5cEz1cor+sKfI0sdis7lyRgkKy7ZdVdfk6lv+5tmm?=
 =?us-ascii?Q?FJTSVHa/hBD38bK6CyCw5o1diHPitTpjbYg1hwb3J3DJCy6pLwgVMmc/aa1E?=
 =?us-ascii?Q?ut9drnfXmV+HohEBcztt18Uahfjnlbc4ndb0i7FOLdhRHmBgwG06zOk59i69?=
 =?us-ascii?Q?qhuR+e5QSMiSmyzJpcEwseWgtUxJsmXy2Dhb/uuNmmCdDyqP/PZZsbB3sx1i?=
 =?us-ascii?Q?UScD5BvnQQufVC3VSt9TX+hCR51HhMR1EywIqnur1tGr+sqFOD7USRwGM7Sv?=
 =?us-ascii?Q?C5BvDAdBJRLUkXpHwngqC22jfBbhL06Di4qG9xQ4y/+twDMHZTvgclCj0ajQ?=
 =?us-ascii?Q?Y8b0rcrOKYBigIZQyiCCJn44z6LKLzOXD+Ph7+BtRzZ4j40LwYP20PLorBgk?=
 =?us-ascii?Q?5hm0XK4Bs1YRfGXG0aloxmQ76hZd3pS13nfKCbIuxSLhTXYrtDYgrrEH0F3J?=
 =?us-ascii?Q?+BQZavtCFXc2FsGii4aT3HpyHkumM2bb1yMc9v4KopCNsCtt1M1cxm1zK0qS?=
 =?us-ascii?Q?oS2kq1RW8Orw23CpJiw+983qi4GtTE7ygDIt3JHvll3F5c4TNQ8VpfjlEjIc?=
 =?us-ascii?Q?/kxhvN2DbIP6k3Ezxi+Ut+uF7TGXmdiNUhkwZX/dHdVdVFPeviwk6Z9Z8ZBi?=
 =?us-ascii?Q?d28ZinTbln98ihbdeJGPXGPb/IHfZq8ZMQDExFhtOzfUThVhOSsHCN3mc9KN?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f34772df-14b2-485b-eb61-08dccebe1a16
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 21:51:45.8369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JhmHiC+a8oUxetUILRShlKP7ZW+I1VLLqBcwzfWeFtnAacQYB9tg9zy0eQOXTGYmuZdBg/ZSkp/dLVSDF/nEbixkVQANWPAltTV2U/3Jfug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5193
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

On Fri, Sep 06, 2024 at 12:02:09PM GMT, Jani Nikula wrote:
>On Tue, 03 Sep 2024, Matt Roper <matthew.d.roper@intel.com> wrote:
>> Stop using GT pointers for register access.
>>
>> Since display (via compat-i915) was the only part of the driver doing
>> 8-bit and 16-bit register reads, this also allows us to drop the
>> _Generic wrapper macro on these two functions.
>>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>  .../drm/xe/compat-i915-headers/intel_uncore.h | 36 +++++++++----------
>>  drivers/gpu/drm/xe/xe_mmio.c                  |  4 +--
>>  drivers/gpu/drm/xe/xe_mmio.h                  |  7 ++--
>>  3 files changed, 22 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>> index eb5b5f0e4bd9..ee3469d4ae73 100644
>> --- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>> +++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>> @@ -10,11 +10,11 @@
>>  #include "xe_device_types.h"
>>  #include "xe_mmio.h"
>>
>> -static inline struct xe_gt *__compat_uncore_to_gt(struct intel_uncore *uncore)
>> +static inline struct xe_mmio *__compat_uncore_to_mmio(struct intel_uncore *uncore)
>>  {
>>  	struct xe_device *xe = container_of(uncore, struct xe_device, uncore);
>>
>> -	return xe_root_mmio_gt(xe);
>> +	return xe_root_tile_mmio(xe);
>>  }
>
>Side note, I'd be really interested in ideas getting from the intel_de.h
>struct intel_display based interfaces to both i915 struct intel_uncore
>and xe struct xe_mmio based interfaces.

shouldn't we have an equivalent of xe_mmio for the display engine?
intel_de is kind of that already, but without the protection about the
range it's writting/reading to/from.

Lucas De Marchi

>
>Is the easiest common denominator actually a struct drm_device based
>interface? At the calling side, we shouldn't use or have any idea about
>i915 or xe specifics, like struct drm_i915_private, struct xe_device,
>struct intel_uncore, struct xe_mmio, struct intel_gt or struct xe_gt,
>etc.
>
>BR,
>Jani.
>
>
>>
>>  static inline struct xe_tile *__compat_uncore_to_tile(struct intel_uncore *uncore)
>> @@ -29,7 +29,7 @@ static inline u32 intel_uncore_read(struct intel_uncore *uncore,
>>  {
>>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>>
>> -	return xe_mmio_read32(__compat_uncore_to_gt(uncore), reg);
>> +	return xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
>>  }
>>
>>  static inline u8 intel_uncore_read8(struct intel_uncore *uncore,
>> @@ -37,7 +37,7 @@ static inline u8 intel_uncore_read8(struct intel_uncore *uncore,
>>  {
>>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>>
>> -	return xe_mmio_read8(__compat_uncore_to_gt(uncore), reg);
>> +	return xe_mmio_read8(__compat_uncore_to_mmio(uncore), reg);
>>  }
>>
>>  static inline u16 intel_uncore_read16(struct intel_uncore *uncore,
>> @@ -45,7 +45,7 @@ static inline u16 intel_uncore_read16(struct intel_uncore *uncore,
>>  {
>>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>>
>> -	return xe_mmio_read16(__compat_uncore_to_gt(uncore), reg);
>> +	return xe_mmio_read16(__compat_uncore_to_mmio(uncore), reg);
>>  }
>>
>>  static inline u64
>> @@ -57,11 +57,11 @@ intel_uncore_read64_2x32(struct intel_uncore *uncore,
>>  	u32 upper, lower, old_upper;
>>  	int loop = 0;
>>
>> -	upper = xe_mmio_read32(__compat_uncore_to_gt(uncore), upper_reg);
>> +	upper = xe_mmio_read32(__compat_uncore_to_mmio(uncore), upper_reg);
>>  	do {
>>  		old_upper = upper;
>> -		lower = xe_mmio_read32(__compat_uncore_to_gt(uncore), lower_reg);
>> -		upper = xe_mmio_read32(__compat_uncore_to_gt(uncore), upper_reg);
>> +		lower = xe_mmio_read32(__compat_uncore_to_mmio(uncore), lower_reg);
>> +		upper = xe_mmio_read32(__compat_uncore_to_mmio(uncore), upper_reg);
>>  	} while (upper != old_upper && loop++ < 2);
>>
>>  	return (u64)upper << 32 | lower;
>> @@ -72,7 +72,7 @@ static inline void intel_uncore_posting_read(struct intel_uncore *uncore,
>>  {
>>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>>
>> -	xe_mmio_read32(__compat_uncore_to_gt(uncore), reg);
>> +	xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
>>  }
>>
>>  static inline void intel_uncore_write(struct intel_uncore *uncore,
>> @@ -80,7 +80,7 @@ static inline void intel_uncore_write(struct intel_uncore *uncore,
>>  {
>>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>>
>> -	xe_mmio_write32(__compat_uncore_to_gt(uncore), reg, val);
>> +	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
>>  }
>>
>>  static inline u32 intel_uncore_rmw(struct intel_uncore *uncore,
>> @@ -88,7 +88,7 @@ static inline u32 intel_uncore_rmw(struct intel_uncore *uncore,
>>  {
>>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>>
>> -	return xe_mmio_rmw32(__compat_uncore_to_gt(uncore), reg, clear, set);
>> +	return xe_mmio_rmw32(__compat_uncore_to_mmio(uncore), reg, clear, set);
>>  }
>>
>>  static inline int intel_wait_for_register(struct intel_uncore *uncore,
>> @@ -97,7 +97,7 @@ static inline int intel_wait_for_register(struct intel_uncore *uncore,
>>  {
>>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>>
>> -	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, mask, value,
>> +	return xe_mmio_wait32(__compat_uncore_to_mmio(uncore), reg, mask, value,
>>  			      timeout * USEC_PER_MSEC, NULL, false);
>>  }
>>
>> @@ -107,7 +107,7 @@ static inline int intel_wait_for_register_fw(struct intel_uncore *uncore,
>>  {
>>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>>
>> -	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, mask, value,
>> +	return xe_mmio_wait32(__compat_uncore_to_mmio(uncore), reg, mask, value,
>>  			      timeout * USEC_PER_MSEC, NULL, false);
>>  }
>>
>> @@ -118,7 +118,7 @@ __intel_wait_for_register(struct intel_uncore *uncore, i915_reg_t i915_reg,
>>  {
>>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>>
>> -	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, mask, value,
>> +	return xe_mmio_wait32(__compat_uncore_to_mmio(uncore), reg, mask, value,
>>  			      fast_timeout_us + 1000 * slow_timeout_ms,
>>  			      out_value, false);
>>  }
>> @@ -128,7 +128,7 @@ static inline u32 intel_uncore_read_fw(struct intel_uncore *uncore,
>>  {
>>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>>
>> -	return xe_mmio_read32(__compat_uncore_to_gt(uncore), reg);
>> +	return xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
>>  }
>>
>>  static inline void intel_uncore_write_fw(struct intel_uncore *uncore,
>> @@ -136,7 +136,7 @@ static inline void intel_uncore_write_fw(struct intel_uncore *uncore,
>>  {
>>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>>
>> -	xe_mmio_write32(__compat_uncore_to_gt(uncore), reg, val);
>> +	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
>>  }
>>
>>  static inline u32 intel_uncore_read_notrace(struct intel_uncore *uncore,
>> @@ -144,7 +144,7 @@ static inline u32 intel_uncore_read_notrace(struct intel_uncore *uncore,
>>  {
>>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>>
>> -	return xe_mmio_read32(__compat_uncore_to_gt(uncore), reg);
>> +	return xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
>>  }
>>
>>  static inline void intel_uncore_write_notrace(struct intel_uncore *uncore,
>> @@ -152,7 +152,7 @@ static inline void intel_uncore_write_notrace(struct intel_uncore *uncore,
>>  {
>>  	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>>
>> -	xe_mmio_write32(__compat_uncore_to_gt(uncore), reg, val);
>> +	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
>>  }
>>
>>  static inline void __iomem *intel_uncore_regs(struct intel_uncore *uncore)
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index 92f0bda0ae30..dbede6056bee 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -200,7 +200,7 @@ static void mmio_flush_pending_writes(struct xe_mmio *mmio)
>>  		writel(0, mmio->regs + DUMMY_REG_OFFSET);
>>  }
>>
>> -u8 __xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
>> +u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
>>  {
>>  	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>>  	u8 val;
>> @@ -214,7 +214,7 @@ u8 __xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
>>  	return val;
>>  }
>>
>> -u16 __xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
>> +u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
>>  {
>>  	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>>  	u16 val;
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>> index ac6846447c52..99e3b58c9bb2 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.h
>> +++ b/drivers/gpu/drm/xe/xe_mmio.h
>> @@ -27,11 +27,8 @@ int xe_mmio_probe_tiles(struct xe_device *xe);
>>  		 const struct xe_mmio *: (ptr), \
>>  		 struct xe_mmio *: (ptr))
>>
>> -u8 __xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg);
>> -#define xe_mmio_read8(p, reg) __xe_mmio_read8(__to_xe_mmio(p), reg)
>> -
>> -u16 __xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg);
>> -#define xe_mmio_read16(p, reg) __xe_mmio_read16(__to_xe_mmio(p), reg)
>> +u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg);
>> +u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg);
>>
>>  void __xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val);
>>  #define xe_mmio_write32(p, reg, val) __xe_mmio_write32(__to_xe_mmio(p), reg, val)
>
>-- 
>Jani Nikula, Intel
