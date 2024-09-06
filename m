Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAC8E6FE49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 23:34:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31EC210EA5C;
	Fri,  6 Sep 2024 23:34:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UgdT4KcV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFD410EA5C
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 23:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725665668; x=1757201668;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9vuGAeg48jXlRw74I2xlL43f/ZiO9HkoN+CI/TUQNC8=;
 b=UgdT4KcVSAKWypvspJCprVl/vjE2fYj4vwWsSS2+aiphjcQzo19V+nBI
 3BnFaqTXIKJafcJRvt8WVi/e7RgNYGkI8LdflS3fL77bmZy7WS1LBMZOW
 1lQZ1i5bq8lPrDrmuKpOJv8LVd1LLMNZPXwTT8AzktveDnknSbs41UFeG
 3oWEfGHQMFqNX6xiF8eTQXms/4TpwZFFHi5OflbyUn3HwWaPb2FSlcbQf
 b355tK1K4SqycHMNyJDl6GNaRyOfI0SzGMdUbi1ExGdBgtV8ZI/mO2mZC
 2OcghDsb5DIa6sWC9wF5bH6i1J7LGH/qHxBTQc2kB6UM7PS0xMyc0bPLg A==;
X-CSE-ConnectionGUID: 2b+SwTkzSre8EG9d6B0TIQ==
X-CSE-MsgGUID: lYEevMrQRn2EepwsoZtLlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24592021"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="24592021"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 16:34:28 -0700
X-CSE-ConnectionGUID: /Hwmo351RuKeAwxdvDdCLw==
X-CSE-MsgGUID: OQrgFLomTBufhE4m2tHNvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="71056890"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 16:34:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 16:34:27 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 16:34:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 16:34:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 16:34:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PqAXyU8UKzzEYF/YjhKSefQQVp3SEXL2n9HrGG6gn9hI0f5AwMQAu3BGsCZQN2ZqVjut1HTcKsXKZrSpP5uirlbWa87hJUdIUqdwm2+l+HvaB3graBhSKnNF/TjYlIn1XOarVRjyAzIpB4C4pTuengA72r89D/1ruOnZ4QW0MA17nGwB/2fDwCxB7MpaDI3vTl4cj2PWttcp4xURB2TLecRIV+qXksyzPcE5Az4zR5vFxeqQrfVMzQW7Vfdp6nhAoJDxfn6T3CZnQ3VdeyPdmXua9mLDulYDABBaWMI21Ci8rYDqciCueVYZUlfNxFnFcnP3q7kWj6i3DMizhXESZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhkR4HHP1GTl03DS08HrL/GosQX+aGSDuWv0Earrnz0=;
 b=MYILvzBaeb3hWcul4QiZleOeN4Um3iXIWQvekfxNGs1d7K+T22yUG6XbBYOem7x5tt6O90J1qIy7NqMe2G8XUWaNXlTCKkzShjxTxVsQq/Zd/26QTv1w1ApbrnEpgH3rXxuEFomMOpNwoFGZ1z1ukvkWMFMFhXQPUF0qunO4Fh3QAk2/clNcoD4TBkwZOaYBG3bUlFbpbZYXZ3WodAmaUm+pgXiKyzk5h6hyVTC+TBYjuuI1/y4d/86Bxc5QWSGPPdaQDMiK8UDIolRU0EJA4jmgl7M/V7Rh6d10CAkWl1FN1MGhHS06zqVYblg3sg4qJEIsTj6IJvhBRuajzO783Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6480.namprd11.prod.outlook.com (2603:10b6:8:8d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 23:34:23 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 23:34:22 +0000
Date: Fri, 6 Sep 2024 16:34:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Haridhar Kalvala
 <haridhar.kalvala@intel.com>
Subject: Re: [PATCH 2/9] drm/xe/xe3: Define Xe3 feature flags
Message-ID: <20240906233417.GX5774@mdroper-desk1.amr.corp.intel.com>
References: <20240906215153.31210-1-matthew.s.atwood@intel.com>
 <20240906215153.31210-3-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240906215153.31210-3-matthew.s.atwood@intel.com>
X-ClientProxiedBy: BYAPR11CA0085.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6480:EE_
X-MS-Office365-Filtering-Correlation-Id: 41214cd7-dfba-4039-e1ba-08dccecc6fb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oSTMrshBNZmfim6Z2lJgO/j10HRx6aBvHGkvmsUZsHFtwjAku+/tHXlsbIY9?=
 =?us-ascii?Q?XKdJ/1aJrJ6pc8NKgXZw7Xhrg2RSDK33NtjRvt6dUzEs1Ce6RposHyFlIzd7?=
 =?us-ascii?Q?ohSSjkUFW2AwjfbAnQ/LviOKqLKklfPXjZeaLQdFOE5utWOC1SZwrYbmZBLV?=
 =?us-ascii?Q?hB8Bkp6WoGtA6Vb+aotaEUKZQLZFZuYonR6ar1LyZZu+RVzLzB1Ufy33zmt5?=
 =?us-ascii?Q?bSDmapWnORoD9iE7PL7f7ceQ7Ta9STr+4zzEEcLh30rZsDvmEHLwunKlx9cq?=
 =?us-ascii?Q?QgFv7ZnSgPxCKP5hKqisNGY6jcFXISx4XRFxio/NVl092LeJ0Kka+cEOmkRS?=
 =?us-ascii?Q?/DmAnOqrc5l2PBBHLUC7R2oNK6gdKVLJQAK0jdAyK7ogOTJlu4HesHhe+qYZ?=
 =?us-ascii?Q?CtFdKMOXMxZTdEKfvEyW7pyMRccg3CfT4IhgkaMOBXrtZuooi7hVe/zibkea?=
 =?us-ascii?Q?3ugHRbgll6rtP/EIK17D2bQ/r17Rm0VCeglTYTHTRtLIkBcZuD3ZeXl3ELVH?=
 =?us-ascii?Q?Dtu5r7EIlZ8tNszgmN4lsuP2oUs3rjBNaBzSSYyRLRu46RkYI/+9vp5HjPiP?=
 =?us-ascii?Q?0iXBFrhOLGqbpbnbk7x3ilnQiU9YR+oRFq5nc3Ysbot/HczayVVfR3JidU3g?=
 =?us-ascii?Q?iNoLey6iNXcFcBz2fCx+agbKCPqfP9jmcLfTlfLABbDIrztRFWzfshP0jCl7?=
 =?us-ascii?Q?yOoGu9ZwJgRdpk0iSrqwWx097lbFw34hjVRNrC0k0xYuMcmu7DLFuZFP1FuO?=
 =?us-ascii?Q?BR7a8NXxox0UC8/VqVzMJ17D91GtV8HFAS+6UbP+zbK7mS6NCO4AE/9hviMy?=
 =?us-ascii?Q?5SRdgHhjo+TKDitsKdt9WPUBmGxY39pw1Rnr4MLDgpSbZ1wjvt/l4aWYSLJ8?=
 =?us-ascii?Q?3MC2hgrULcKaBRGFPIZErg6jdVlKbO2W6BGYmfX2T/L2sMDW2kUPpSMrnxhB?=
 =?us-ascii?Q?33Am8O2HBVLOIlF7Tp6ZC29nw/qKU+eo0Ku9VNXLWkWYzAEie4uZlWKas6VP?=
 =?us-ascii?Q?+M9pXdMSWK/gTtmxnCdf/yOy2M9yNhDLuuSrTfasWp66bAgIJ7eT6srfaQsh?=
 =?us-ascii?Q?vxlkvGZfRlthu0JkAJdO54OnJP+xlil57IKCD6ZIL8py0E85DtA812a+VS47?=
 =?us-ascii?Q?A5WJ3Efcm6V4ykBuDe2OmhWM+3R99n2gkInhjQLkKDem5vl0Dn7id3QshzrY?=
 =?us-ascii?Q?5S4SHN+WIfXVusIOC5N4ewkvBDu5b3hfd6VDSkdD2zB+mwuQPLfJuIShjOE0?=
 =?us-ascii?Q?i/Zo9mBPjvi5nleYGgiEZV9w/NlKwC6weoSA7cGznRzJF5h01R4+VB1ot8OJ?=
 =?us-ascii?Q?r0uI6TLa+Sh/X7SkHIw+LQ8Ey2MFY16Vyb8d6TBbcgHuzg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XZqCxUguTnNAHfigZt58D7tePQ4x9lCFSliXYMRg/YFS4ZUDMa/c+wet5gRv?=
 =?us-ascii?Q?EfxkFkdYHNhESPdcWBEyF9JnFWyo7qBDZiw+pg29YIrcJ4HaV+qlvrhntWZ7?=
 =?us-ascii?Q?fnnofxjUUyTQAJVqN4yFW0USFRbqSRinRv/w+pEpa6DFvLi0GxQ9+70EurRt?=
 =?us-ascii?Q?5FtM+fFg0PVhy9hJWv8bBa9VGxnKPUtbHMv9MUY15awatsBAWhrOC00kr+3F?=
 =?us-ascii?Q?f0vq2OsJtSbAOvd3RYWXxdg1LZSTKQOhf8Y301YDxfnn5bsyPpPa8XYc5hGF?=
 =?us-ascii?Q?lYylXlGWXWrORcB2VI4y07907nTJTNZYieP9cTKCjtME1+dgZvkkdzBLiLv5?=
 =?us-ascii?Q?mCMpjguKfj3U8gvxebY4eHHhhl8lsxwCg+kR0HT3FpD7yUl8bDzMk0RWYYco?=
 =?us-ascii?Q?ilBpfelGmIme+eMeVgnks+QTqJm4dJu0LYD0vx0kLq4VyXcSuxM9hMx92ATF?=
 =?us-ascii?Q?bssz0Rj0zpH+TO6WT6iOgoo0voLN/5XJ6zETp+DFUyGaNpdEXakOMfbAQVzO?=
 =?us-ascii?Q?I0/I7E8BVloNRQGq4N21Xqj7o8wl9Dzu8vTcWVWG4gzK6nZn0zJz8NRyKdcw?=
 =?us-ascii?Q?pD6WnkX/mlHCASTKofQLEE0odDl9j+13Qy47saOzhqDSr4Vna37jzVAEoDdd?=
 =?us-ascii?Q?cHBmQ0Gz8h+tX2494LMCHKbOK+l4uVdb9+thlZTVmcsCkv6KqIx+jBpOb2PQ?=
 =?us-ascii?Q?NWlIWTN144eeZ2PZMSns4cu/hSu9esq8r1mllcZPWP9kImuqjtmlbCPmjj0o?=
 =?us-ascii?Q?mxrWFzEbFDUDp+fMq3c40cROKkqIhnYiqwUtNGp7WCoLAPtIPLyezwX6k3MG?=
 =?us-ascii?Q?VCWLsfcf17ZvM+pgJbpYDfa6h090uiprf5viz/HIGscXtpODORoVpoP30B++?=
 =?us-ascii?Q?CgDM6mV+zp9TYYRNV9oub+TsDbXkzM0NSYp+BvvKD7t00OInuF37c+0pEql3?=
 =?us-ascii?Q?57zt7eMaL+FOMGexl+zqwn5UTdA9a0KdT/ygB65XmgJ/mDbG6QRq2arHDiqH?=
 =?us-ascii?Q?jC02lpWsbIyPD1ujmnqhO+fbcP4SmtyjidMhutyJx3Cjehv4ofHhbZO3TsIZ?=
 =?us-ascii?Q?q4788sDS+E4p0xa9ZY7NyO7moVmqBEf6dY1vORkcwx/yeR8xvNe9DNlFgYxP?=
 =?us-ascii?Q?ATnVoKzG3I01ulKeZNdCtp81N7+TTOZs3EoQ4FamQkVlvtDAUove/d7evQ0D?=
 =?us-ascii?Q?cjLfB7DlZUCGb4QPZ2Iih7gmnvt+VjcRx/u+TKOZsKLXzyG1CLqIk6VFLuBa?=
 =?us-ascii?Q?W8HGzk4R2kAw/2J6GxGsJXLBp/3a4UV8DlFIbOibsWNkkw/AKMSSD7xPUsLF?=
 =?us-ascii?Q?g+ZDhiPrqn0As6geJRGdCFx0SX4QJ6U2WRVGHPzB+DNTg3+X6qESNDNRIoxX?=
 =?us-ascii?Q?zUTG3OZWo2mJVUNW2PpiBiFI5HfGzadMTh8tIyJe7gfQnF8cZ17tMu0M6jdp?=
 =?us-ascii?Q?2j6ocu8BqMNZZUrIPBHGovqy5+1bV2ewFQsfRuqaQ4ICnrVQtXsNvzQzXsLi?=
 =?us-ascii?Q?TWauedDdn+sBkH4LlUYLqwwP8Fr2YrZPc4pDVyqJm13rjmzZpZBOheloe8HI?=
 =?us-ascii?Q?qu0YsEVzNYRnFgcqbxyFvN1vL98esXvz8gEvkyOEkQGiYQOzmQtfysClIS2L?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41214cd7-dfba-4039-e1ba-08dccecc6fb8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 23:34:22.3879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3U27h1uF6FzKZM8owZQxD6wJQGJBbBkjer4eRdO4ChAVf2FNFbRw2YwVm7V5JTfOfQ6qVRo0Q72ams0ihDb9gaY9QQRdLZnANBefIw7sV/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6480
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

On Fri, Sep 06, 2024 at 02:51:46PM -0700, Matt Atwood wrote:
> From: Haridhar Kalvala <haridhar.kalvala@intel.com>
> 
> Define a common set of Xe3 feature flags
> and definitions that will be used for all
> platforms in this family.

Nitpick:  this commit message seems to be using very cramped line
wrapping for some reason.

> 
> The feature flags are inherited unchanged from
> Xe2 (XE2_FEATURES) platform.
> 
> Following B-spec details inherited from Xe2 feature
> flag definition commit.
> 
> Bspec: 58695
>  - dma_mask_size remains 46   (not documented in bspec)
>  - supports_usm=1             (Bspec 59651)
>  - has_flatccs=1              (Bspec 58797)
>  - has_4tile=1                (Bspec 58788)
>  - has_asid=1                 (Bspec 59654, 59265, 60288)
>  - has_range_tlb_invalidate=1 (Bspec 71126)
>  - five-level page table      (Bspec 59505)
>  - 1 VD + 1 VE + 1 SFC        (Bspec 67103, 70819)
>  - platform engine mask       (Bspec 60149)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index c05ca61787be..b30d09508a38 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -180,6 +180,25 @@ static const struct xe_graphics_desc graphics_xe2 = {
>  	XE2_GFX_FEATURES,
>  };
>  
> +#define XE3_GFX_FEATURES \
> +	.dma_mask_size = 46, \
> +	.has_asid = true, \

The convention we've been using elsewhere is to use '1' instead of
'true' for these 1-bit fields.  We should probably be consistent here.

> +	.has_atomic_enable_pte_bit = 1, \
> +	.has_flat_ccs = true, \
> +	.has_range_tlb_invalidation = true, \
> +	.has_usm = true, \

Ditto on these two.

> +	.va_bits = 48, \
> +	.vm_max_level = 4, \
> +	.hw_engine_mask = \
> +		BIT(XE_HW_ENGINE_RCS0) | \
> +		BIT(XE_HW_ENGINE_BCS8) | BIT(XE_HW_ENGINE_BCS0) | \
> +		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0)

I think we should have "has_indirect_ring_state = 1" included as well.

> +
> +static const struct xe_graphics_desc graphics_xe3 = {
> +	.name = "Xe3_LPG",
> +	XE3_GFX_FEATURES,
> +};

It doesn't look like there's actually any (intended) difference between
the Xe2 and Xe3 graphics feature flags for now.  Can't we just re-use
the graphics_xe2 structure (and XE2_GFX_FEATURES) until/unless a new
feature shows up that requires distinct handling?  That's already what
we're doing in this same patch for media down below...


Matt

> +
>  static const struct xe_media_desc media_xem = {
>  	.name = "Xe_M",
>  	.ver = 12,
> @@ -209,7 +228,7 @@ static const struct xe_media_desc media_xelpmp = {
>  };
>  
>  static const struct xe_media_desc media_xe2 = {
> -	.name = "Xe2_LPM / Xe2_HPM",
> +	.name = "Xe2_LPM / Xe2_HPM / Xe3_LPM",
>  	.hw_engine_mask =
>  		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>  		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
> @@ -361,6 +380,8 @@ static const struct gmdid_map graphics_ip_map[] = {
>  	{ 1274, &graphics_xelpg },	/* Xe_LPG+ */
>  	{ 2001, &graphics_xe2 },
>  	{ 2004, &graphics_xe2 },
> +	{ 3000, &graphics_xe3 },
> +	{ 3001, &graphics_xe3 },
>  };
>  
>  /* Map of GMD_ID values to media IP */
> @@ -368,6 +389,7 @@ static const struct gmdid_map media_ip_map[] = {
>  	{ 1300, &media_xelpmp },
>  	{ 1301, &media_xe2 },
>  	{ 2000, &media_xe2 },
> +	{ 3000, &media_xe2 },
>  };
>  
>  #define INTEL_VGA_DEVICE(id, info) {			\
> -- 
> 2.44.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
