Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38D0C021AA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Feb 2025 15:23:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA2610E856;
	Wed, 19 Feb 2025 15:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PFv2NKxG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C3510E837
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Feb 2025 15:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739978587; x=1771514587;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=YvLHNgWzgmX5Ou4VgFMjYQrw0md8ciut4Y8+O9MYY+w=;
 b=PFv2NKxGVC9ZK3pAVhIz2RHmxSc/DehmywzyhXSovgOrM/sgVmGJ70BZ
 PKLO1V7S96rS8wAdZHhR0dkhN58JGqPDxV8VowHP5LVORgiOtpQ/D1Asz
 FCrp2ZeUUV79P08WFMQr17RbcTyEZax7hXuf17Hh7ZPrtK2X1kBwZt3FL
 lZ/SXx7h9s0ISXA3eZ+4LnVlxbV/xofKqkwIGuKM6RLWbAK4ZYB1XzpmX
 0jBGVLQ+Of3d4GyqP/mg7Tl9oI8Nc7VAfhlSsVNjmR0MzjfqF5WGA/SYM
 bMkkoiqQEPVotE9BKJnVA3+ypgIR+CbA/w2of6IvzCRmCjH56n2/f1Sm/ Q==;
X-CSE-ConnectionGUID: aRrI/5m/RteoRDN4vQLGZQ==
X-CSE-MsgGUID: n3vMpc3RSIyWztJdORz5+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="50936871"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="50936871"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 07:23:06 -0800
X-CSE-ConnectionGUID: wZfRG/2mRiybFFoy2W3LpA==
X-CSE-MsgGUID: ww+FI68FSlCLmShrdxP02w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="114598296"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 07:23:06 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 19 Feb 2025 07:23:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Feb 2025 07:23:05 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Feb 2025 07:23:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UAZ6lputeb802Kuof7N8kCrQEKLKHhlnkK8TcHSznYIC2dU1KxS8MQc2j6EEh8kpkgOSJawJ6j4ucXBdK/JzFgmkm//LlEAdAnAhrLFx71CnD35XVZDQay3HmyS2/gb2AZfES2EZW1dOA7RUMVcAq8JgkOh8gbpUrZC2QbiPESxvD5oQJNnIWSmmKAkynwotOYBAqLgPdrMERFsJOFrDL3zCo750kuuw4TDKT+4SvsNl3NYAB089hboUzAcpcgIILYHSwdv+UMSuqW8iD8fupPSyJUTs9DV5kFuucXPID/BvALIuctvhNnzKd/2ezcB61M+7a4J5zO/BANyEg0T0AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCydSJj9vbjI+u572ppJw/j/kIQgWoib6WduZu9Kj+E=;
 b=LJn3fZjgKAFmSxleLBVO3s24EbZM4KZvcTiC9VLAToknIwnXq2N8Ot+SGtzpxTX5qMWX5yjLKHwKlpU6TUdMee9gD3Vp+3vBVP05Dbp3KJDk+iWHFRiwe0qnSmXFUloYAm9m3BO4tY3aN1ZVC7lAknESkg+tfBCEFLjXnF8AshYwIHbFGF/aL3RzsaXyOWayz8c8xenSFaFXvLfPaJpZg2OoUe9ZJA7FViIg1bV+KVIJ8dBy2CRlOTSY+SKWX1DbH+dLuQI92fViB/LK4VSUben3TmepvRfhoVE6JRPoQrOq7cyY1J26brJglKmwTkAq2LxCrqSxGjizohL0PrJ3gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB8082.namprd11.prod.outlook.com (2603:10b6:8:157::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Wed, 19 Feb
 2025 15:22:27 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 15:22:27 +0000
Date: Wed, 19 Feb 2025 07:22:24 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?=
 =?utf-8?Q?re_for_drm=2Fxe?= =?utf-8?Q?=3A?= Drop unnecessary GT lookup in
 xe_exec_queue_create_ioctl()
Message-ID: <20250219152224.GX5109@mdroper-desk1.amr.corp.intel.com>
References: <20250218200511.4050060-2-matthew.d.roper@intel.com>
 <173997667782.3999490.16851402689190696588@b555e5b46a47>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <173997667782.3999490.16851402689190696588@b555e5b46a47>
X-ClientProxiedBy: SJ0PR05CA0167.namprd05.prod.outlook.com
 (2603:10b6:a03:339::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB8082:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e0795ed-b3e4-435c-b2ec-08dd50f937c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Bav9zYmWr1BQnuwD+NHUoOdJT2oDHBS2TA2hRQJVxRlLTZe001JQLcspaHqt?=
 =?us-ascii?Q?utLd4kjcTzX91v9GhunM2p+DfjRhRbz9kjsL5z6Ble5/LXCstUt1SSoaGl3i?=
 =?us-ascii?Q?sBwhWIEYvuq6iVjbNlGur/YmjitH1mzi3Lkyd5mX+ySJmUkykeuWYcI5q/Om?=
 =?us-ascii?Q?N6FWX2STbsBgslgYznR+qGEc20BrN6TLwSLU4QJuDuL7gNJXurpiF6l9FIHx?=
 =?us-ascii?Q?ixNL6O2BVVvOlmeHU33fuQcD3DFG8hcds/Mi5gWY5TDRXfJT/ZB+QiQT8bnd?=
 =?us-ascii?Q?/gcJztuoqYFEnPP3OdEsCc59cO28EGSVLdFf0C1fZhsb08qe3g5EU3EbTvFm?=
 =?us-ascii?Q?20Ht0oqJvr25PqtvSOLYmRPfI179IHhAKZwyeccEUPcR+onPbF9iEcMraSll?=
 =?us-ascii?Q?847+zbcJcfofGoXVfJQ1BdiTqePTjIJLy6nDWb8IFkboamkhvRVxCehCYLff?=
 =?us-ascii?Q?r6IGQQAIjEJMtXtZrbzeedDZ7sjN4Ik3VW5yu5lNhcerWaaWNlRCwcYiQA6n?=
 =?us-ascii?Q?9xZ3MuyvYkJfparRvm2teNeZb5OXxZsIxIjUOvDiAPTWIs/qIA3KlxQxJyvO?=
 =?us-ascii?Q?AHhGfbM7LGcuYpXLfC+aTTK9orLQwEcjeaezarwXlYnqAibK+81VfOQECEnK?=
 =?us-ascii?Q?LpsegrPREas1hvIxE3TC0YIpuSrODZxvakkZEpsN0vLGfWsNaAlVGvo4dKSF?=
 =?us-ascii?Q?lXKn4V+S998cnDqLm0WXoY3Djodabx072gikM6MKiM1cCUD99Yia0B9bPw5N?=
 =?us-ascii?Q?+NuOswwwXe0RwD080FVQOhLWs0nENDm5/f+NZrSpSQ5/lkgU46+W5FayATXD?=
 =?us-ascii?Q?QSXu0Zyo6umhf2zXwE3xCw0lYQhyfGGpHjKX1kmwbMPZ0cGT6bd6a6eSxeK4?=
 =?us-ascii?Q?MCKvikqYMfHhMO2RMpAsoTNPEYpIjxXUHc03obeETfSAh0KrsEppFQNrUXBG?=
 =?us-ascii?Q?ZpYbh8b7dM6PTmXPMlFZgewUcZMI8SD7//S7JvvnIyq3NGw/qUT2rLSAzRoI?=
 =?us-ascii?Q?L/CMyA/4jFCQhYJbN7DKrlPw84O1lRt7AtABex1U7xllkN6Rb4UP5IBk4dHL?=
 =?us-ascii?Q?vk+FpC99tvDZUF+pX26xH10iqBTfauR9xDXygnaNRCGQRR3PwkXO+EMoPq0J?=
 =?us-ascii?Q?cGcFVDfoO2GBumbXnLgpG4S7BiPhGuURru8sN58qi3VEF8FAqd2LmZ50zexm?=
 =?us-ascii?Q?dyJf0RXdzCy1H0FYtMgBTpe78z+32H29e0+n4yDXzbI0dkmTOOb7J8ngxXQS?=
 =?us-ascii?Q?SXbgRxJqdYuQa8iUbcYsOykkCyHsIH2paVJDPxhdUjFWRiPQvRAasye/xqvm?=
 =?us-ascii?Q?Rj8G1EsF0LiVvvU80NvPXm5W?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RsPx7f71qeF2SVQU+iM2S6x2p1e+YzPTne+IPP3HUpDmaq2NjY7AxYVUsq67?=
 =?us-ascii?Q?VKrJK4q8ATdmEZwFhhPw6rwGWWAHMHp/a+gjxHDXJjjIyqGncZfPgbr/tW3E?=
 =?us-ascii?Q?3A6CO1oFXYnSSPm9v0YZpKYTfmtbLFvkBUPl4SHLBXTwBylbbbxe9W2CRiJ7?=
 =?us-ascii?Q?3RS+gowIRqKzq6LsEOD5spFzwOdsdOr66O0VY0Jp7iYtD0gr0HYFm1QvJPfq?=
 =?us-ascii?Q?NC5N0zMqqrl6aDFenYzCp1vjiaJWxihAud5ML3xMbmzdRjTTclF4aa7e34mx?=
 =?us-ascii?Q?X+Dc6q92yZGKE6lO2Grrucejqj926Hc9whsFkJSxIdMhBWfc4P67NpspLam4?=
 =?us-ascii?Q?OTfDyxXatznOPUbb+bRJD2mpaw0HajhAue8hQ181+RuRWLfNIn3KTOdjw5ko?=
 =?us-ascii?Q?lXQj950i+0eOpW05r9lrDvndcPhi/adL+glXNp9FMnDbq9hEUTfE7cFEmyiL?=
 =?us-ascii?Q?/yoNhKBSHlMSIUKInBQipy16Bs8svdVowulgGWov/6Kiu+iOylMWbljoC8FG?=
 =?us-ascii?Q?1M8rh9P408WeqZkngokZ60sn2aOnY1q2VjDYZIYOA+jukNAg2jnspiqOGVih?=
 =?us-ascii?Q?0dyxN07lfbGSZT8Se1/fDJWlqcq4fKZNCSURW2xCKe8eG/zkU37IDwzgPgE0?=
 =?us-ascii?Q?Ic7lBgQzrhxIrDpowAHl2htNZ8plT848kMXfUQBqPIo9enUgjrCJOcnSRY1w?=
 =?us-ascii?Q?7CzF3wQ/Y2Yb1qTvsxh7ScLHuOzWk1XUX3TCvIToq+PEOMsOod8nBnfxjZ+X?=
 =?us-ascii?Q?ouFJuz8pNF4LP0zYjYafe7h2O+MV31eA/2IztpTCfta3Ugpv2QWb/4WPOiIV?=
 =?us-ascii?Q?8N+QS+s0g+3fs8euVnekzRuEWJ8sXYyMAQ+e5BzfjdWT4IJeuS/Ta/rBjaIg?=
 =?us-ascii?Q?FAjAD/5v/POG3dnltzZ4I4SfDY9u1N6WCVPl4HomTfMb0X9VxsxvF+NIXVzU?=
 =?us-ascii?Q?X52qU/PYpnoBz693c/9dMJHbfAlanumsCvZscdTl7hXBvA+xwIozQHzzQmta?=
 =?us-ascii?Q?/j48F4My4Hsibg7XwxSUxLOwyB1esCXG4ThxQhRKPdkPf5z3lpPOt+ngsCfI?=
 =?us-ascii?Q?bQeAy1dTOBoft8nmBiJtRV0EyFzSvtLi3j1uhPx0+xSh0dpW7ZFXGOkVqTQm?=
 =?us-ascii?Q?tssIU2wwkgk9P6066I9/dZPB9RjRnsoHw9w033xr82WiRSTmG5zo4/EhoPF9?=
 =?us-ascii?Q?MDFaQBdi7a/3tz1CLsaJqHaWdoJ/0jOxY8GQNQy3TaemYmquvf1xy+XqbAwc?=
 =?us-ascii?Q?BKysjayLdQ4KmI30nHfwSYEIfbmePrNzLIqcEnRTlYIrSCG6iUAkS92/NHmE?=
 =?us-ascii?Q?bNG0HyGwBsikFn7gJYexfTSnN6rx3T/KDV8Inl+LVAyum9OX1gdogAB67yJW?=
 =?us-ascii?Q?8bLMvOIGML6OOcxmJGp00nQ7tbNDVyA6Ki/9m9b0IGsUEsQim9m5X/2P8sR4?=
 =?us-ascii?Q?jh44+GsLZkm02YXNExmOlaUvdThzaWNMoiKZCd34YVMOSjDrJlqXEgCoRdzY?=
 =?us-ascii?Q?UYA3LGxgkXaGe52UQBWt1+qOtBAhNTqiOva7FkHMs3Wyrsaq5lcno/96BRDA?=
 =?us-ascii?Q?f3B1TG58rsOjFFrZULJ+v/u080wb0IK+wgnfOHfjWEUsEi/9L8JA4gK0cPXM?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e0795ed-b3e4-435c-b2ec-08dd50f937c5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 15:22:27.1200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J++DzbnCLqkYPDjDorjYuj70tzSFWI3KaSV+TRnMW2572xu79qmOXOKXN8c7a5Vq/hcV+4frb0Oi+yp0YDusgGRPgRMI2dzcXrmPJz1axE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8082
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

On Wed, Feb 19, 2025 at 02:51:17PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Drop unnecessary GT lookup in xe_exec_queue_create_ioctl()
> URL   : https://patchwork.freedesktop.org/series/145039/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074_full -> xe-pw-145039v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-145039v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-145039v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-145039v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-463/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-434/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6.html

Unexpected incomplete on a display test, possibly during suspend/resume.
Not related to the changes here.

> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][3] +1 other test incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

Another unexpected incomplete; no related to this patch.

> 
>   * igt@xe_live_ktest@xe_migrate:
>     - shard-bmg:          NOTRUN -> [SKIP][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@xe_live_ktest@xe_migrate.html

Kernel already tainted by a previous test, so ktest did not execute.
Not caused by this patch.

> 
>   * igt@xe_pm@d3hot-mocs:
>     - shard-adlp:         [PASS][5] -> [DMESG-WARN][6] +2 other tests dmesg-warn
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-adlp-3/igt@xe_pm@d3hot-mocs.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-adlp-6/igt@xe_pm@d3hot-mocs.html

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4173

> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@async-flip-suspend-resume:
>     - shard-dg2-set2:     [DMESG-WARN][7] ([Intel XE#4330]) -> [INCOMPLETE][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-463/igt@kms_async_flips@async-flip-suspend-resume.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-434/igt@kms_async_flips@async-flip-suspend-resume.html

Already listed above.


Patch applied to drm-xe-next.  Thanks for the reviews.


Matt

> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074_full and xe-pw-145039v1_full:
> 
> ### New IGT tests (2) ###
> 
>   * igt@kms_cursor_edge_walk@128x128-left-edge@pipe-a-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.32] s
> 
>   * igt@kms_cursor_edge_walk@128x128-left-edge@pipe-d-hdmi-a-3:
>     - Statuses : 1 dmesg-warn(s)
>     - Exec time: [3.28] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-145039v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2327]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +2 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#607])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1124])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2314] / [Intel XE#2894])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>     - shard-bmg:          [PASS][14] -> [SKIP][15] ([Intel XE#2314] / [Intel XE#2894])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
>     - shard-dg2-set2:     [PASS][16] -> [SKIP][17] ([Intel XE#2191])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#367])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-433/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2652] / [Intel XE#787]) +4 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#787]) +26 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#3432])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2887]) +4 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio-edid:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2252]) +3 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@kms_chamelium_audio@hdmi-audio-edid.html
> 
>   * igt@kms_chamelium_edid@dp-mode-timings:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#373])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-464/igt@kms_chamelium_edid@dp-mode-timings.html
> 
>   * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3:
>     - shard-bmg:          [PASS][26] -> [DMESG-WARN][27] ([Intel XE#877])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-3/igt@kms_color@ctm-signed@pipe-c-hdmi-a-3.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-7/igt@kms_color@ctm-signed@pipe-c-hdmi-a-3.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#455])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-464/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@legacy@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][29] ([Intel XE#1178])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-433/igt@kms_content_protection@legacy@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x32:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2320]) +2 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@kms_cursor_crc@cursor-random-32x32.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-bmg:          [PASS][31] -> [SKIP][32] ([Intel XE#2291]) +2 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2286]) +1 other test skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>     - shard-dg2-set2:     [PASS][34] -> [SKIP][35] ([Intel XE#309]) +3 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-dg2-set2:     [PASS][36] -> [SKIP][37] ([Intel XE#3009])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-434/igt@kms_dp_aux_dev.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-464/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-dg2-set2:     [PASS][38] -> [SKIP][39] ([Intel XE#4331])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-434/igt@kms_dp_linktrain_fallback@dp-fallback.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_dp_linktrain_fallback@dsc-fallback:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#4331])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     [PASS][41] -> [FAIL][42] ([Intel XE#301] / [Intel XE#3321]) +1 other test fail
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][43] -> [FAIL][44] ([Intel XE#3321])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][45] ([Intel XE#2049] / [Intel XE#2597])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check:
>     - shard-dg2-set2:     [PASS][46] -> [SKIP][47] ([Intel XE#310])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-434/igt@kms_flip@2x-plain-flip-ts-check.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check.html
> 
>   * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
>     - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#2316]) +4 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-5/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2316]) +3 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - shard-lnl:          [PASS][51] -> [FAIL][52] ([Intel XE#886]) +3 other tests fail
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-dg2-set2:     [PASS][53] -> [FAIL][54] ([Intel XE#301]) +3 other tests fail
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [PASS][55] -> [FAIL][56] ([Intel XE#301])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-adlp:         [PASS][57] -> [DMESG-WARN][58] ([Intel XE#2953])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-adlp-3/igt@kms_flip@flip-vs-suspend.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html
>     - shard-bmg:          [PASS][59] -> [INCOMPLETE][60] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2:
>     - shard-bmg:          [PASS][61] -> [FAIL][62] ([Intel XE#2882]) +2 other tests fail
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-4/igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-3/igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2293] / [Intel XE#2380])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2293])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
>     - shard-adlp:         [PASS][65] -> [DMESG-WARN][66] ([Intel XE#4173]) +4 other tests dmesg-warn
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
>     - shard-adlp:         [PASS][67] -> [DMESG-FAIL][68] ([Intel XE#4330])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2311]) +5 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2312]) +8 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#4141])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#656]) +2 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
>     - shard-dg2-set2:     [PASS][73] -> [SKIP][74] ([Intel XE#656]) +4 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#651]) +2 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#653]) +1 other test skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2313]) +4 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [PASS][78] -> [SKIP][79] ([Intel XE#455]) +2 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-434/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_lease@lease-unleased-connector@pipe-c-dp-4:
>     - shard-dg2-set2:     [PASS][80] -> [DMESG-WARN][81] ([Intel XE#4330]) +7 other tests dmesg-warn
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-433/igt@kms_lease@lease-unleased-connector@pipe-c-dp-4.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-466/igt@kms_lease@lease-unleased-connector@pipe-c-dp-4.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][82] ([Intel XE#2705] / [Intel XE#4212])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][83] ([Intel XE#4212])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
>     - shard-bmg:          [PASS][84] -> [DMESG-WARN][85] ([Intel XE#2566] / [Intel XE#4330])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
>     - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2763]) +4 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#1489])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#1489])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2387])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@psr-sprite-plane-move:
>     - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@kms_psr@psr-sprite-plane-move.html
> 
>   * igt@kms_psr@psr2-cursor-plane-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#2850] / [Intel XE#929])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-464/igt@kms_psr@psr2-cursor-plane-move.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2414])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>     - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#3414] / [Intel XE#3904])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> 
>   * igt@kms_setmode@basic:
>     - shard-bmg:          [PASS][94] -> [FAIL][95] ([Intel XE#2883]) +3 other tests fail
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-8/igt@kms_setmode@basic.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-5/igt@kms_setmode@basic.html
> 
>   * igt@kms_setmode@basic@pipe-b-edp-1:
>     - shard-lnl:          [PASS][96] -> [FAIL][97] ([Intel XE#2883]) +2 other tests fail
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html
> 
>   * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-2:
>     - shard-bmg:          [PASS][98] -> [DMESG-WARN][99] ([Intel XE#4330]) +2 other tests dmesg-warn
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-3/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-2.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-7/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-2.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#1499])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@kms_vrr@flip-suspend.html
> 
>   * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
>     - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#3889])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
> 
>   * igt@xe_eudebug_online@single-step-one:
>     - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2905]) +1 other test skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@xe_eudebug_online@single-step-one.html
> 
>   * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#2905])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-464/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2322]) +2 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#288]) +2 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_pm@s3-exec-after:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][106] ([Intel XE#4330] / [Intel XE#569])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@xe_pm@s3-exec-after.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-bmg:          NOTRUN -> [ABORT][107] ([Intel XE#4268])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-4/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][108] ([Intel XE#4330]) +22 other tests dmesg-warn
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   * igt@xe_query@multigpu-query-invalid-query:
>     - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#944])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@xe_query@multigpu-query-invalid-query.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][110] ([Intel XE#3862]) -> [PASS][111] +1 other test pass
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_color@degamma@pipe-c-hdmi-a-3:
>     - shard-bmg:          [DMESG-WARN][112] ([Intel XE#877]) -> [PASS][113] +3 other tests pass
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-1/igt@kms_color@degamma@pipe-c-hdmi-a-3.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-8/igt@kms_color@degamma@pipe-c-hdmi-a-3.html
> 
>   * igt@kms_cursor_crc@cursor-dpms@pipe-a-dp-2:
>     - shard-bmg:          [INCOMPLETE][114] ([Intel XE#4148]) -> [PASS][115] +1 other test pass
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-7/igt@kms_cursor_crc@cursor-dpms@pipe-a-dp-2.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-4/igt@kms_cursor_crc@cursor-dpms@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>     - shard-dg2-set2:     [SKIP][116] ([Intel XE#309]) -> [PASS][117] +2 other tests pass
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-433/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
>     - shard-bmg:          [SKIP][118] ([Intel XE#2291]) -> [PASS][119] +4 other tests pass
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-bmg:          [SKIP][120] ([Intel XE#4302]) -> [PASS][121]
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-bmg:          [SKIP][122] ([Intel XE#3009]) -> [PASS][123]
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-6/igt@kms_dp_aux_dev.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-3/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
>     - shard-dg2-set2:     [SKIP][124] ([Intel XE#310]) -> [PASS][125] +1 other test pass
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-433/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
>     - shard-bmg:          [FAIL][126] ([Intel XE#3321]) -> [PASS][127] +1 other test pass
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>     - shard-bmg:          [SKIP][128] ([Intel XE#2316]) -> [PASS][129] +4 other tests pass
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend@bd-hdmi-a6-dp4:
>     - shard-dg2-set2:     [INCOMPLETE][130] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][131]
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend@bd-hdmi-a6-dp4.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend@bd-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-nonexisting-fb:
>     - shard-bmg:          [DMESG-WARN][132] ([Intel XE#4330]) -> [PASS][133] +10 other tests pass
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
>     - shard-dg2-set2:     [FAIL][134] ([Intel XE#301]) -> [PASS][135]
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html
> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible:
>     - shard-lnl:          [FAIL][136] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][137]
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html
> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1:
>     - shard-lnl:          [FAIL][138] ([Intel XE#886]) -> [PASS][139] +2 other tests pass
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:
>     - shard-adlp:         [DMESG-FAIL][140] ([Intel XE#4330]) -> [PASS][141]
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
>     - shard-dg2-set2:     [SKIP][142] ([Intel XE#656]) -> [PASS][143] +7 other tests pass
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [SKIP][144] ([Intel XE#1503]) -> [PASS][145]
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_joiner@basic-force-big-joiner:
>     - shard-dg2-set2:     [SKIP][146] ([Intel XE#4328]) -> [PASS][147]
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-433/igt@kms_joiner@basic-force-big-joiner.html
> 
>   * igt@kms_plane_cursor@primary:
>     - shard-bmg:          [INCOMPLETE][148] ([Intel XE#3966]) -> [PASS][149] +1 other test pass
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-4/igt@kms_plane_cursor@primary.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-4/igt@kms_plane_cursor@primary.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-dg2-set2:     [SKIP][150] ([Intel XE#836]) -> [PASS][151]
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-433/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@kms_vblank@query-idle-hang:
>     - shard-adlp:         [DMESG-WARN][152] -> [PASS][153]
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-adlp-8/igt@kms_vblank@query-idle-hang.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-adlp-8/igt@kms_vblank@query-idle-hang.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-adlp:         [DMESG-WARN][154] ([Intel XE#2953]) -> [PASS][155] +1 other test pass
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@xe_exec_threads@threads-shared-vm-rebind-bindexecqueue:
>     - shard-dg2-set2:     [DMESG-WARN][156] ([Intel XE#4330]) -> [PASS][157] +4 other tests pass
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-433/igt@xe_exec_threads@threads-shared-vm-rebind-bindexecqueue.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-466/igt@xe_exec_threads@threads-shared-vm-rebind-bindexecqueue.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][158] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][159] ([Intel XE#787]) +6 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][160] ([Intel XE#787]) -> [SKIP][161] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg2-set2:     [FAIL][162] -> [SKIP][163] ([Intel XE#314])
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_color@ctm-signed:
>     - shard-bmg:          [DMESG-WARN][164] ([Intel XE#4330]) -> [DMESG-WARN][165] ([Intel XE#4330] / [Intel XE#877])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-3/igt@kms_color@ctm-signed.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-7/igt@kms_color@ctm-signed.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-dg2-set2:     [SKIP][166] ([Intel XE#455]) -> [FAIL][167] ([Intel XE#1178])
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-464/igt@kms_content_protection@legacy.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-433/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-bmg:          [FAIL][168] ([Intel XE#1178]) -> [SKIP][169] ([Intel XE#2341])
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-5/igt@kms_content_protection@srm.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@kms_content_protection@srm.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-dg2-set2:     [DMESG-FAIL][170] ([Intel XE#4330]) -> [SKIP][171] ([Intel XE#310])
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@d-dp4:
>     - shard-dg2-set2:     [DMESG-WARN][172] ([Intel XE#4330]) -> [DMESG-FAIL][173] ([Intel XE#4330])
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
>     - shard-bmg:          [SKIP][174] ([Intel XE#2311]) -> [SKIP][175] ([Intel XE#2312]) +8 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
>     - shard-bmg:          [SKIP][176] ([Intel XE#2312]) -> [SKIP][177] ([Intel XE#2311]) +12 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
>     - shard-bmg:          [SKIP][178] ([Intel XE#4141]) -> [SKIP][179] ([Intel XE#2312]) +3 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][180] ([Intel XE#2312]) -> [SKIP][181] ([Intel XE#4141]) +6 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][182] ([Intel XE#651]) -> [SKIP][183] ([Intel XE#656]) +10 other tests skip
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-dg2-set2:     [SKIP][184] ([Intel XE#656]) -> [SKIP][185] ([Intel XE#651]) +10 other tests skip
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][186] ([Intel XE#656]) -> [SKIP][187] ([Intel XE#653]) +9 other tests skip
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-bmg:          [SKIP][188] ([Intel XE#2313]) -> [SKIP][189] ([Intel XE#2312]) +8 other tests skip
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
>     - shard-bmg:          [SKIP][190] ([Intel XE#2312]) -> [SKIP][191] ([Intel XE#2313]) +14 other tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
>     - shard-dg2-set2:     [SKIP][192] ([Intel XE#653]) -> [SKIP][193] ([Intel XE#656]) +9 other tests skip
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][194] ([Intel XE#3544]) -> [SKIP][195] ([Intel XE#3374] / [Intel XE#3544])
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [SKIP][196] ([Intel XE#2426]) -> [FAIL][197] ([Intel XE#1729])
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@xe_live_ktest@xe_eudebug:
>     - shard-bmg:          [SKIP][198] -> [SKIP][199] ([Intel XE#2833])
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074/shard-bmg-6/igt@xe_live_ktest@xe_eudebug.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/shard-bmg-1/igt@xe_live_ktest@xe_eudebug.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>   [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>   [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#3966]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3966
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4148]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4148
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>   [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
>   [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
>   [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
>   [Intel XE#4330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330
>   [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074 -> xe-pw-145039v1
> 
>   IGT_8236: 8236
>   xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074: adeeb34d0f0e6463bea93984a56eed4e3ee0f074
>   xe-pw-145039v1: 145039v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145039v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
