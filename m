Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AB3C5B567
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 17:58:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E86710E959;
	Mon, 10 Aug 2026 17:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mLZ9tkFW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C24C10E959
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Aug 2026 17:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786384687; x=1817920687;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zRvoAz8HCZDehZqOKFxf238tm7EYF9XFgyZiDEKYBBY=;
 b=mLZ9tkFW3I98l/ttY5++ju7B/EBkWTAmqEtHBynDyx/bdv38MtbNIaD+
 ab+taHeIPS6kN5zgViEEwbA4tvkshxPxUMqvPZDDrr9/U12Umk+9bXaqD
 YNCcn1Vvxhhoj3HiUKEi/MgT1zU2UL+FbbOMqS2o8FcKAPVBoZJqZ3iWH
 6SJmPio/sQJU+dBgpZVEMsQGqZpfkInocyLiSRVxJbXvucilV9pGSwKu2
 Xgd5ABKmhr+tjCD9pmI5eF5UGIpMlDOuEbAtGbqjB2ZE0e0mRtyBvseV+
 0PQ6tJLcFXZe2tgzrEWJeCpuHQTo1i7StqHiaVX7ZjgItE9G//GhqgP61 Q==;
X-CSE-ConnectionGUID: K6q/kPtyT6SvVP9ctFSAxw==
X-CSE-MsgGUID: MULpiNGPRRa649TdBOq5CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86028287"
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; d="scan'208";a="86028287"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 10:58:07 -0700
X-CSE-ConnectionGUID: ekdOsLITQfmnOcn3F48ynw==
X-CSE-MsgGUID: sa2CvMTBQnyONs8f+WtgjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; d="scan'208";a="293029382"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 10:58:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 10:58:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 10:58:05 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 10:58:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a42r+2bb1JedDP7aeSnuCHKs9zzaYwESxk9ueW5j1Z44DuxhCjkM3pZOJOd4WlO3btRnyYiR0h3CSBM0LOA36xtOC8edGEbmXZB+ezZ+MUha6TYi3vIcTgLgvHGFdPeEq+RT35jueSGEZ80wHqc9n+fr+am28NYNplQhuaImU9lNQ5JXDArFRGKEFMh/3MPClWP9DQrrS+9vtmxGw7x9szILO+qyNBZXP1Ma7sVUktmd5bfxwB1V/sx2a2cq8u1wD31xGNTOh71Qj3EZ8A24Af6oUs5WpN1SdipWWk7THpRg+XJRnmTZ2dwxtmrl/04SHjSB06XciV1wroyEgRo6uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEQwljKB7ckMGmrOngnUKXJFBheFoHXdDrBYx9qOTqk=;
 b=nTCcHIcPU89yMJvdPN45plFJ2oIdNHOXl0EMPOdZEsiCQcCNCseOs9EZYo1YLt9CLFIG5W0A5lDCbbRc+D4r/W3flUIl6eUOQbU7bgdGy4ZfRsFC8iQWKfgjNngLkOUnQaWzKGowsfasYYq1MrvFOFSNqyONQcewYrSlGb5cNcNPCIz6JDeDiF/9u46jcF7VW8CGM+HGCsXJKvKd4ED1R6o1BXgY5xvJRu0n5b45zTGDyC9L1auLjLJEXTnIsD854/TQdrMplw2zc+vuZg16mk6h1dp9l2WVfemBnfplTfqeeCMy5fHpZiUPa33TOMIQEl0Lf/xwk5l1keJBr032GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB6620.namprd11.prod.outlook.com (2603:10b6:303:1ea::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 17:58:01 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 17:58:01 +0000
Date: Mon, 10 Aug 2026 10:57:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Raag Jadav <raag.jadav@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZVTEw6IHN1Y2Nl?=
 =?utf-8?Q?ss_for_drm=2Fxe=2Fdrm=5Fras?= =?utf-8?Q?=3A?= Move has_drm_ras
 check to drm_ras layer (rev3)
Message-ID: <20260810175755.GA681121@mdroper-desk1.amr.corp.intel.com>
References: <20260810124101.105832-1-raag.jadav@intel.com>
 <178638275155.35583.4015265382230283477@61270ab9df2a>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <178638275155.35583.4015265382230283477@61270ab9df2a>
X-ClientProxiedBy: SJ0PR03CA0090.namprd03.prod.outlook.com
 (2603:10b6:a03:331::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB6620:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f6829d9-0adb-41bf-0691-08def708eb1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: Inj4/1S5donZtzKy9qIXU/j7+AyzboUOrdcCIbXGgHWPezKQYtTSYJZFF+/iLl5oxBgyvJlcVAJTegnDznNUPEAMAwuPhDdGJmSI40twZy5LAqpsuL6KymjvQbIEjP6eD2/yez2+yGcYQEpb72iBwWu3tlsKqhsG9vpkS7FHEsaRliLar8Tjk77YZVbmV6NGzfgHRnr8OEYntYzvfSmHk4dTcg+AOYspyoPBV7HTEgBj7FTFIhrZ5tHCBGiJbeqv9UoSuPpqN6VTiJuNn9S2U/lvmE1qLuPeGxGJ8I4IvV5Zh0NXxcfXmbFNvoyDeT0cbInLszIPy2oqNQVJrTdMSJJuSse1silkgPVJC1XNewtDDNe+lYqIzJv2SUFliCpFbJ4oQ5cWowmqFbsfORztbSdbbjB2CUFUkHYyMSAZfCYsCyP2LdILC74WFbPVPMaZjCuV8IW1Ba+Tq51xyirJwRWePFpUWaEJWZayxW2Gz5jyxojatkBC1gr2VAQeyvypFlVe0YWljkJplZGOa37l7F5F4B91L36KUaWAqnfu4OnoUGFhuAz2hxwGdP1Q2XMKzZfC0mMRABdbfdseZWJovajfqeXPSfTeQbJSGVVrV8s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KpqxoraM2hqEyCmTw5JvqYFpDlGA/yevP6TvLGX8qdvLg73CX9ta5eZnnM0p?=
 =?us-ascii?Q?9MU3VwWVfXN5NGUHanKYQB73TMBbmc1jrrQ1ZKpNb3mKnSvVRPUhSoKBN70V?=
 =?us-ascii?Q?gBHE+L9xBtlxnUIfcyFhZ2HQoHAcCtq0WPbCvLrM6fDLIv/XJw9udvqXNfDO?=
 =?us-ascii?Q?9J18s2qunrL9KpmM79GnMYt35YhAN5kDm8kBWK6mybnrUmgIJm/6MuGeN5Yx?=
 =?us-ascii?Q?17et3xmGjlxCgjrPZZhKK0rxdbzoKBdnyGFAJHUeQ+zF8cjKNtSmP08ViEMV?=
 =?us-ascii?Q?MUhGfrHWWAH2nmo8J1HQBL+U8+0UWfimenxpIjv+tG67xi2zcWFhMA7PemL0?=
 =?us-ascii?Q?T3Bo6RMBhqu3DDdx9Q+NovDPy9jcHo/kTocWQBAMsv7DQICfUP5+naEss7MK?=
 =?us-ascii?Q?BhZeF90ZGeOIM0Tk78Yol/Gd9XGEdos1R6cnp4hMPdZcx94w9DvLLQ9IoEbu?=
 =?us-ascii?Q?9sRTEzRzSZBdw4jXr6TY3PCKOqPALRgVt2yvUcQUvYr2ImRZiJ6PVlpFDnh9?=
 =?us-ascii?Q?qjwikQRyF0SS3HAkXbSyFLBQdA3dbb1IMFkOqDKAaWFBgTrDnz6BuxZ9Vfna?=
 =?us-ascii?Q?qBK/e0Fc4Heu5l4raPgnFaTPdhChtwZCY1JvpPSyGon4e1jZwyYrTwB2TdXK?=
 =?us-ascii?Q?8jqB9s0RVY3aBVOmj0Aow9StZ3TSRu40Kzi8tuTHC2eCS0st0dDQNsBYZB+B?=
 =?us-ascii?Q?zSP0liA0oC1V+95OQ8IvwxkIKRoyIFkVvWbMZZrl+XTg5z58srKkRM/iSFe7?=
 =?us-ascii?Q?DMVaMT0DrSZ6fvlwnUiUont6YMIvdAhEYP2Qh2/7sPzz23vFogBPVEaIeKPw?=
 =?us-ascii?Q?G29PrSCSTaDvacfU6CTd5MSCsiy2D69PPHCszXDeRYHDpXLuJ32sIbOEJIXt?=
 =?us-ascii?Q?xBs7Rw+15oYTG12qESHfOLe7NBmWUHtdMC9tKDTtRLkT1xECdCO5fUWI9BCi?=
 =?us-ascii?Q?M8gw7V9HZkELuMF+l3mDF27Bwpl5dgESYfHquxZ7zSZYAK4s3OG+nztoHN+A?=
 =?us-ascii?Q?tXXFSL3MFDOM4y5QqgJ+D3KsvKXuwV0cy8BEfluJz6avSnUNfKvd8ewuGAso?=
 =?us-ascii?Q?wDzHjuxa8xX/u4hymZ/AfK49qqukVXEutOQAtJnjtPfAoBcPOpZhKuW0HWMb?=
 =?us-ascii?Q?Vy/nBQXqWErk0UbhpcMW9PQIVq0XUW5VkNLj1klEqZ9yOEY2nJcrdEe0QJx0?=
 =?us-ascii?Q?ALYWS3BVu8ILLMse1FXQPfL7dq/Zq8YU7fD2m2Ycxz57P1X8Ic5q42qiMN9K?=
 =?us-ascii?Q?HlUuLp4X3ubm3KgnKfJCDiwquJ/MpjA/kPaO9u+4DOKYMDn9t85O9J4I1NCo?=
 =?us-ascii?Q?mugqwT+g7M+8YAqPj0UfDUjBQhTFWq3ONZBCoQozNEN5Jqvt0hjAD/x+Zhaz?=
 =?us-ascii?Q?cj2yEVFxKGqYB5OxVlX+gk/upeC9i1gbPFDxZ7vxdcsD35vs5B4eNpkV56Qg?=
 =?us-ascii?Q?k+80llu4uQ4nmLJfxrtA6ZOdNP17F0Au+GhhhtKMfCxGGdRlb+iogZpra5bu?=
 =?us-ascii?Q?erd/urWJQDsyADUUxC8vgtYcpwubfP79s5BGS7oxgAJOZ+ct/s3xR9+tybpv?=
 =?us-ascii?Q?PnVoL9D4fLz+1mOKG2TyClKLGZATrKU/GWJPyeTl+9vKBISDnWHvM54fdv6H?=
 =?us-ascii?Q?Rh0nyHKoHho64XLiFwi/BV7hMPcRQZI1aHlnjyk49ed/JQSpA4mT79g6Cy8F?=
 =?us-ascii?Q?w9BLHFMBZmfdwJeAaNSIcZdrgqI15y0osSrazIaK0VuGFhHA9aRyAiqhSS+7?=
 =?us-ascii?Q?YaFSSn37dQ8FG0EqYPs7vvYMWphUYN4=3D?=
X-Exchange-RoutingPolicyChecked: a68+OWHMDeEcURNQCdMsGGo8mpVARJRROdltJLMhCzbPCnTynj35S1CaeC17p6EBVhB823tZDAKA6GF1iL+WY7N2P/YbDMwZlzIcdCmYkTwKxQRFLXlDwZy/27yT5s/ibl599yw2EVehMaiFUKnyhrpV3mihOUZkhrRm9GHGA3odabf1SBVw/i+7sbVb6Ym5jk5HNr1Tnj0+NSnd9LrgmdXZrqHwVk7SriGLkdqgUTyFYE8fNh+CWTBlX808zRUTv9qvNLMpbzUhRVuoMQlmI3VE4GJhVs7DuJNiwSAgClJFsJASj9xPHQmzw/x1BPT0dr3k/GtzPSQqOiH2Vtf4qw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f6829d9-0adb-41bf-0691-08def708eb1c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 17:58:01.1369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7w3Iq/d0qC7Yh6CM3vPa1yt3fIC6w1AhgCBYirY7EJemgY5Ggbv080oFPZhGPXNUzoUv2bD3CUGMUnZPsGcL8RZ1mITo/kRHgswHEwZhC9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6620
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

On Mon, Aug 10, 2026 at 05:25:51PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/drm_ras: Move has_drm_ras check to drm_ras layer (rev3)
> URL   : https://patchwork.freedesktop.org/series/171492/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79_FULL -> xe-pw-171492v3_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks for the patch and review!


Matt

> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-171492v3_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic:
>     - shard-bmg:          [PASS][1] -> [FAIL][2] ([Intel XE#3718] / [Intel XE#6078])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:
>     - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#6078]) +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html
> 
>   * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing:
>     - shard-bmg:          [PASS][5] -> [INCOMPLETE][6] ([Intel XE#6819] / [Intel XE#8174]) +1 other test incomplete
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-5/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-3/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#7059] / [Intel XE#7085])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2327]) +1 other test skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-4/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +3 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#607] / [Intel XE#7361])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#367])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2887]) +5 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][13] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2652]) +8 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#7358]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
> 
>   * igt@kms_chamelium_frames@hdmi-aspect-ratio:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2252])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
> 
>   * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][17] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x10:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2320]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-32x10.html
> 
>   * igt@kms_dsc@dsc-basic-bigjoiner:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#8265]) +1 other test skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-4/igt@kms_dsc@dsc-basic-bigjoiner.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#4422] / [Intel XE#7442])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#8680])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2374] / [Intel XE#6128])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>     - shard-lnl:          [PASS][23] -> [FAIL][24] ([Intel XE#301])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>     - shard-lnl:          [PASS][25] -> [FAIL][26] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7178] / [Intel XE#7349])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7061])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#4141]) +8 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2311]) +19 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-onoff:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2313]) +24 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-1/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_joiner@basic-force-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#6911] / [Intel XE#7466])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2486])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#8303]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#7283]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-1/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2505] / [Intel XE#7447])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#1489]) +5 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@psr2-primary-render:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2234])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-1/igt@kms_psr@psr2-primary-render.html
> 
>   * igt@kms_psr@psr2-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@kms_psr@psr2-suspend.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#3904] / [Intel XE#7342]) +2 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_sharpness_filter@filter-scaler-downscale:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#6503])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@kms_sharpness_filter@filter-scaler-downscale.html
> 
>   * igt@kms_vrr@max-min:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#1499])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-1/igt@kms_vrr@max-min.html
> 
>   * igt@xe_evict@evict-small-external-multi-queue-cm:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#8370]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@xe_evict@evict-small-external-multi-queue-cm.html
> 
>   * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2322] / [Intel XE#7372]) +3 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#8374]) +3 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-1/igt@xe_exec_fault_mode@twice-multi-queue.html
> 
>   * igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#8364]) +12 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-1/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#8378]) +3 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html
> 
>   * igt@xe_module_load@load:
>     - shard-bmg:          ([PASS][51], [PASS][52], [PASS][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75]) -> ([PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [SKIP][99], [PASS][100], [PASS][101]) ([Intel XE#2457] / [Intel XE#7405])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-2/igt@xe_module_load@load.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-9/igt@xe_module_load@load.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-9/igt@xe_module_load@load.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-4/igt@xe_module_load@load.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-2/igt@xe_module_load@load.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-2/igt@xe_module_load@load.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-8/igt@xe_module_load@load.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-8/igt@xe_module_load@load.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-8/igt@xe_module_load@load.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-3/igt@xe_module_load@load.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-3/igt@xe_module_load@load.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-6/igt@xe_module_load@load.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-6/igt@xe_module_load@load.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-6/igt@xe_module_load@load.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-4/igt@xe_module_load@load.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-7/igt@xe_module_load@load.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-7/igt@xe_module_load@load.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-10/igt@xe_module_load@load.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-5/igt@xe_module_load@load.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-10/igt@xe_module_load@load.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-5/igt@xe_module_load@load.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-5/igt@xe_module_load@load.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-1/igt@xe_module_load@load.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-1/igt@xe_module_load@load.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-1/igt@xe_module_load@load.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-9/igt@xe_module_load@load.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-9/igt@xe_module_load@load.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-5/igt@xe_module_load@load.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-5/igt@xe_module_load@load.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-6/igt@xe_module_load@load.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-2/igt@xe_module_load@load.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-10/igt@xe_module_load@load.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-7/igt@xe_module_load@load.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-6/igt@xe_module_load@load.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-6/igt@xe_module_load@load.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-4/igt@xe_module_load@load.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-4/igt@xe_module_load@load.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-3/igt@xe_module_load@load.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@xe_module_load@load.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-5/igt@xe_module_load@load.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-4/igt@xe_module_load@load.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-1/igt@xe_module_load@load.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-1/igt@xe_module_load@load.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-1/igt@xe_module_load@load.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-7/igt@xe_module_load@load.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-2/igt@xe_module_load@load.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-10/igt@xe_module_load@load.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-2/igt@xe_module_load@load.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-1/igt@xe_module_load@load.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@xe_module_load@load.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@xe_module_load@load.html
> 
>   * igt@xe_module_load@reload:
>     - shard-bmg:          [PASS][102] -> [ABORT][103] ([Intel XE#8007]) +1 other test abort
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-1/igt@xe_module_load@reload.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-7/igt@xe_module_load@reload.html
> 
>   * igt@xe_multigpu_svm@mgpu-migration-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#6964]) +1 other test skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@xe_multigpu_svm@mgpu-migration-basic.html
> 
>   * igt@xe_pat@pat-sw-hw-compare:
>     - shard-bmg:          NOTRUN -> [FAIL][105] ([Intel XE#7695])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@xe_pat@pat-sw-hw-compare.html
> 
>   * igt@xe_prefetch_fault@prefetch-fault:
>     - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#7599])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@xe_prefetch_fault@prefetch-fault.html
> 
>   * igt@xe_query@multigpu-query-invalid-cs-cycles:
>     - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#944])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-8/igt@xe_query@multigpu-query-invalid-cs-cycles.html
> 
>   * igt@xe_sriov_flr@flr-each-isolation:
>     - shard-bmg:          NOTRUN -> [FAIL][108] ([Intel XE#7992])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-bmg:          [FAIL][109] ([Intel XE#3321]) -> [PASS][110] +1 other test pass
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-bmg:          [INCOMPLETE][111] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][112]
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_exec_fault_mode@atomic-many:
>     - shard-bmg:          [FAIL][113] ([Intel XE#8578]) -> [PASS][114]
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-2/igt@xe_exec_fault_mode@atomic-many.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode:
>     - shard-bmg:          [ABORT][115] ([Intel XE#8007]) -> [PASS][116] +2 other tests pass
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>     - shard-lnl:          [SKIP][117] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][118] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][119] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][120] ([Intel XE#3544])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][121] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][122] ([Intel XE#2509] / [Intel XE#7437])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:
>     - shard-bmg:          [ABORT][123] ([Intel XE#8868]) -> [ABORT][124] ([Intel XE#8007] / [Intel XE#8868])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79/shard-bmg-6/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/shard-bmg-9/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>   [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>   [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
>   [Intel XE#6128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
>   [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
>   [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
>   [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
>   [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
>   [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
>   [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
>   [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
>   [Intel XE#7447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447
>   [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
>   [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
>   [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
>   [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
>   [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
>   [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
>   [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
>   [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
>   [Intel XE#8174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8174
>   [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
>   [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
>   [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
>   [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
>   [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
>   [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
>   [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
>   [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
>   [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79 -> xe-pw-171492v3
> 
>   IGT_9047: 9047
>   xe-5571-b241fb2563d63b4781896701a88b25cbc21c6c79: b241fb2563d63b4781896701a88b25cbc21c6c79
>   xe-pw-171492v3: 171492v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171492v3/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
