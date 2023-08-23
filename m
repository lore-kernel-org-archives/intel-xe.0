Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D399CEE49A3
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 15:21:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14CA10E02E;
	Wed, 23 Aug 2023 15:21:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4407610E084
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 15:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692804060; x=1724340060;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=bxIgs1TqR+T5ly5yRRZL9rJ1cAi0TaDb8XZq7b/rIJg=;
 b=FaN34yxnyIZiAczF+5LVKLQfQgAlOnF+Tm/Gmre2IV19AwOcmYSl/74X
 D2ifVWrkEGxtKTqXhKe//dVWtgEcvxvUJH4rKGib6A+ULIj8N9qaqjStY
 VkOnOOvD34zSIxxXjZ7lYbLKbKzQdHYmVEsYPrxQxFNBUrmDxErXZVZTe
 NB104zBsy3Ruheop5VwSHECIorBDsbIjeVaxQUGUWbstc8jb+v62c53+G
 AOVlvq00UvZQ2tRtqdMoPtnyTcvecvraM2qR1RT8SKksV/2KymVOTpbSO
 Dn7f6TTXAVWGjUForbmuftY+OMI8QMlZ7EU6ueJvrA7hVvnIZbGclglCj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="377947150"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="377947150"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 08:21:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="771764760"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="771764760"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 23 Aug 2023 08:21:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 08:20:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 23 Aug 2023 08:20:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 23 Aug 2023 08:20:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZlRPDILil8qtsLB1JWzl9r2EL+EXKL+4wu+RdkT8dmLAyqG9vnAXBD+biP5ezJUbiBNZ4iiUDXEiOT1bqlZytmmS9NOYkK89PjMupUILhKFz4Ev+oVrogCzzPLgZYUXjdDPcW79k1sR/+r8YAa9/vPHG+cl7JujpqnbKcypnlfDAqJ5fA5BlFECr5RgDqdgnYxn3ONqjvOIOOxS1MxYqApdEE5XR6ad1sFzjUqxPppplwvCbtaMF2Vq7u14UPP0WuWQqCB3eCrqAPVU+B61q08DtMfhDasTNVjrJVk/1bBG4Jf4doIcOxxzoZtrBFFYIHl7MFuQOnLVuMq7/j/g+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAJIAP+7n318VDTX2kD7aErOF0mI2lYvJOW71R5Eefw=;
 b=Uo9gSlOF8XqAuGaOklPYu2kvqAxZHTyzEfiJgmGbc/6gQFEqivMyDCDqBpijDjNZ0SJbaL1lrriM2sluRywMWUtl/6tAFxRwvWs9G6N61MFu/AMVq7C14S50+0cHC2vk/7KDfLH0xX6t4BLRSIyYvnQGaNmuOtbfJ+9u0sRMNtfyTv6YnUg4p1balNQeEP4MMse/Dtx3YLkKP9tIOkk+0zUo726zry/KEEa2O53hZx6Hm6rH3EOw/qJCMScOppJZJC/plsuMgR+hkN7SCCb8gg1FO/4JmRVAihbfWUf1oEjasWHMO6waBWzQ46DyaHVxVfUJT+ug10E+yCvDPfJPXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SN7PR11MB8263.namprd11.prod.outlook.com (2603:10b6:806:26d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 15:20:58 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6699.025; Wed, 23 Aug 2023
 15:20:58 +0000
Date: Wed, 23 Aug 2023 08:20:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <20230823152055.GD5554@mdroper-desk1.amr.corp.intel.com>
References: <20230823003312.1356779-3-matthew.d.roper@intel.com>
 <169275288154.16624.12838852850751834813@emeril.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <169275288154.16624.12838852850751834813@emeril.freedesktop.org>
X-ClientProxiedBy: BYAPR01CA0063.prod.exchangelabs.com (2603:10b6:a03:94::40)
 To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SN7PR11MB8263:EE_
X-MS-Office365-Filtering-Correlation-Id: cde77343-4fc3-4e2c-355f-08dba3ec8d21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 275G9TpNuS2iYSv3DVwgxAqORqEhiFI15bdbCeWAnrN1cOOgkBS8i3UhCdxTmdE8hy5zHI2U57vhLOvj3axBF0bCGb030c0Aq3hZxmy2Qxlvfkh+vHbvcbZ0LV74eTYuxj1JsEC7q2OL3TgcJFrh6MsWzFzOwUwovqMD83zXCM1LJ4y/oHQrweT4JWYk2tv71bZW2RzqNPj99wSgNs4BPcyFIf5Vu+WmzhZ2MWR4QNACGi5lyxmJL4rURtoQgnn3GsjiN1MGUy4SeFniK7pVzaXiCfFXhz/bSyDUq9X6LG2jDB/AyiowOj9VM/GcyWsGXTySMtLc4k0ekuACi+wublXh8HSOw1CEhD8ZoCtZWGn5EtLTMIzCdodx4Gfgo6Ctpnj7wDR5uOq5ElS4jxwGQPbOn7Kd7ZtG2AVJWmSCrmvmkCpWhT/RD+yKAaXcLFxZumlHjgUZTvyMwkwPyK4s2xU0legHwh0kF1wi5ZL8mVfpg8v10vE8AmN4HGDKENzcyvoUZ0qFK6fkPtzrBVNBTvZYJvYFQNuHcwmzP53Ec1gKFLGjV9ait9D2PrzgMroWIoG6X5yrPgmCDOoVc6kO6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(366004)(136003)(39860400002)(1800799009)(451199024)(186009)(38100700002)(82960400001)(66556008)(66476007)(66946007)(1076003)(6512007)(33656002)(478600001)(6666004)(6486002)(6506007)(966005)(86362001)(26005)(8936002)(5660300002)(41300700001)(2906002)(316002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ktGAkj7sNGeeeI9WuO5H7Rjbxg9X2M/3Ty/3VKHFpOvnp7DEDTVokNyxXgQs?=
 =?us-ascii?Q?+2sK1JTYY7tgpfFLw8NuP1UyOWPfmGIIz+/sz4dDVqQigVV+ruGT+GpWVvjb?=
 =?us-ascii?Q?YMhuCe6B4haHAqA7zZzICu6WUYQaqfuPhSCc0DxUYCaZNZ7u4aSp39P6c2C+?=
 =?us-ascii?Q?vC3KlMXgaUmqTKAPRbITayo2oal/UKZo19KFqf8H6zwd9xRPVJ5DGjNYQCvY?=
 =?us-ascii?Q?7Q7fsWbJM4KrK2OZxdjTqLlu241WDrJoTKO+/+H7RktDytQC4I6n6U4j+9V9?=
 =?us-ascii?Q?meDaKANiJYQoGtppHW4r8AYTjHW5PfqZ9yl4QRtFrqdElQ5Bc/iC5972aoFW?=
 =?us-ascii?Q?ZhDAp33k+/hqklGSX1GXt/FTLvf6ObDE4s5NmSdPNkOzGwqGJGBzottpzk0V?=
 =?us-ascii?Q?WzvWesOy+VK2Qww9YzRXgMOEfToMLmV7ssKRYaFhz+VRvX4bcYBeB18y6HMY?=
 =?us-ascii?Q?J+JxuxUvPVcvNNzWA4a2W4Lo6F5YrouhSBhreZY4uUgPjyKJUTsibP1Xa05t?=
 =?us-ascii?Q?xPLXNlq7X+RaFsXJpTsituFaHdoNYYe3m7ozLPJqdmIHGWJTM4P8OBMhlqhi?=
 =?us-ascii?Q?CpJyxdLOgiECNJRGIDCg5avdbx7XH5+LTZkLrkGoXVPHbJQV9wfs9Ov9V16a?=
 =?us-ascii?Q?/zUi3OT/CdUQnb2tYwpiLSPDyLj9R2tRamKZ9FDpCf1DN0/r/zpHPGL2/zSS?=
 =?us-ascii?Q?88cFcWj/5WpPuAZCZKAIfK82h2QgC0rYkturDxcJG3f0bDv8jSme5VHMYQWF?=
 =?us-ascii?Q?3sQlvSU6VCghq33OrQ79YRP+SXkJeFo3cM9Z5OlB9dNkThpQjruKdQVdpfYq?=
 =?us-ascii?Q?kHYEUBDVJBqqe5f6CRI99au0s7aJq6cS3MTf9Z2t1S/rzGpHWISkDJaut8Xd?=
 =?us-ascii?Q?kStReduMGWtAAJOmwI+sWD1k6Pc+wjW1zq3E+VmuPYrumC7/PInMe2CJPPTf?=
 =?us-ascii?Q?QJJ9emzEjKZlhGnpeHIG6d2E1GReNGF4/oURXLhIb7PptL2x6x/u7xf7zJVx?=
 =?us-ascii?Q?t3VwlK+7ZzkzPfc9wu2SOxoHonBZsU4v/CTd3vc12SNUuVknrhHX6OKAxn8t?=
 =?us-ascii?Q?ooDekG2QljMnZ6csmB81137hNDUp/aHV/eIJFOi9ch6tU2Hy5kD3Mnn2Fc5C?=
 =?us-ascii?Q?cHBHgGGUQIpv7bFFj7VhClNJailwF08SKQwfr9tOjdqIKd4k87Jq2yPiutG4?=
 =?us-ascii?Q?vKLT17ijhBr31Qt/eC0qkcX2cwlcHG+YKXTbSyOAzxS0rgv6LmodDebDSkRG?=
 =?us-ascii?Q?CfnZB7twCXfATWCLYBU4WtjpHETC28FPIkly34Xf2Jq1jJ124ofFgkW9Eu38?=
 =?us-ascii?Q?vnFSOqO5t7NXqrUKy7/tDpU5eJxJH/h3La0JEXrOSIu96ydvk8ZqdKgM0nBT?=
 =?us-ascii?Q?sumS/2FutU8zsDTnmMns7lnB/vPtuonWnc5cRDigDMxu53xQhjhOpe6ZAtBu?=
 =?us-ascii?Q?cWVFV1pVkPDWYGZjfzgnJvLtPi7WtPs8U2kRRqHLL2u0F0LJ/Lg8IZaxWzC4?=
 =?us-ascii?Q?lPkDKg3OtSXYG3jINgfcJyTpaypUL2cL6Xo9WL5rKZJfffD1rF/7Xd8/WsSZ?=
 =?us-ascii?Q?FMapkKyzCzU4pmVtUB4e72vlAteTPmCa20U3/LuSVHG1mJHOk+wVZnBlf2TV?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cde77343-4fc3-4e2c-355f-08dba3ec8d21
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 15:20:58.0445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4WsfXZTILJokrLKoDP0qbjDC8AAZkOoiFvpt7vfqxwzwlYVwCPjxRHc3lvNCSlo50tCw8AuFvtQXJ2PvQiOo8sEQfKN0W9lqMTnG6wfB5IQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8263
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_st?=
 =?utf-8?q?arting_with_=5Bv2=2C1/2=5D_drm/xe=3A_Avoid_64-bit_register_read?=
 =?utf-8?q?s?=
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

On Wed, Aug 23, 2023 at 01:08:01AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [v2,1/2] drm/xe: Avoid 64-bit register reads
> URL   : https://patchwork.freedesktop.org/series/122770/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-330-3a964d06598874329aab6f8db7fd52840135d568_BAT -> xe-pw-122770v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks Lucas & Jose for the reviews.


Matt

> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-122770v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
>     - bat-adlp-7:         [FAIL][1] ([Intel XE#480]) -> [PASS][2] +1 similar issue
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-330-3a964d06598874329aab6f8db7fd52840135d568/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122770v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
> 
>   
>   [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7450 -> IGT_7451
>   * Linux: xe-330-3a964d06598874329aab6f8db7fd52840135d568 -> xe-pw-122770v1
> 
>   IGT_7450: 7450
>   IGT_7451: 5d48d1fb231f449fe2f80cda14ea7a1ecfda59fa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-330-3a964d06598874329aab6f8db7fd52840135d568: 3a964d06598874329aab6f8db7fd52840135d568
>   xe-pw-122770v1: 122770v1
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
