Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A20BC3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 23:57:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DF910E838;
	Thu, 25 Jul 2024 23:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IcorlXJR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8196B10E838
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 23:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721951877; x=1753487877;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GEMuiqTRrxgn/isjwSVPPKPmJBwlOKHkaN5GdSXZ+lQ=;
 b=IcorlXJRlLQS28x8EuIblYJwy4tJhuU3WaPPAGquXk8aV3CuLVib6k0K
 SjahN0dz5mQZaznYjK+N6FUVrzq3nD0tyP0vHusDd/skAMAceKGBeqbTo
 Xukixuzsk5QQqMaQlvTHUlEFfI/83NIODvc8yP1/HhLE/N2GNnUybSL9H
 n67fjh889KNtaxwe25tMTPSqTnSX+HItaC/u0qmRT/fO3RkYUyle16ADi
 O1SpQaWvoVjmHSP3RLR/Ip1Eugqys+t42CXeHILYQe8OrppgqJrb7XOrg
 ccoo8E3eMTrrbvn/m3IJHERh05riUhA3CY8tftLQMWKMXe+LPb9SdaWHV w==;
X-CSE-ConnectionGUID: UUnI5RkVQeSBADwEee0nBQ==
X-CSE-MsgGUID: UBuFjvN/QYCC3uzSGQkdYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19848958"
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="19848958"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 16:57:56 -0700
X-CSE-ConnectionGUID: jozlPPTiR5aUZj3e2PbxaA==
X-CSE-MsgGUID: DsXR+o5OTmulcR1/wd/9tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="76303495"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jul 2024 16:57:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 16:57:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 16:57:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 25 Jul 2024 16:57:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 25 Jul 2024 16:57:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DodPItITJzcTgakARlAgTiTLdwh2ktfLe2e9e/jQd0OxIXCcpagMpqzgM4SLufwheHY7K8yV3f6dEMPz0dJcOaj/ZyEwIEGyYkNILRiGEC6HDYAOfJYUkrwAjK1Idu9+d0ZWLn6reKOhNy+OJDUNE7CtMJxrYaj93ihlrnIFtPf87CDFOaYoGX/5/TFYJpdFPS7DxUWP9iNcJ2T9nJfIruwvspof0nK5WoLuUBieLGWZTyK8YtGGmI3iM18AmJpbbdfWIdCLbbIy0ta1Fyk87kT/Pgvxqm5ELCdk4Hq1vP4WiWRTxpdPjRPabzmyIuzySnw9H9VwQk+v5Evc1jBzkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJAVso4lRwQeINOEXrn12VspVaPNQtkVCCBXBvM0hY8=;
 b=T4QmWdMqPvHqw2iWMze8h6HxqJyySfqnqAGMnD6R4UQQRXvCH9GB0FTT3lBFddm9Zj+5J6+wSx8Pq60LxFfuFy2lP5jSmlsp7oquIDgjkENxqF3LTA/VGJMVEWpmgv85AQ81gBbDi5y4fO7mhHugESdHdYnnouigCf6EU2AL1NQKQUE6o14YM4PgqJBPwSfkrSRU80S3z1omYKMim7PwDNJHNlxRK0cZyrI1wdcZxjNB1OHo3OOHYvQZs3zbiSmkjnazROB77MBJJkOLezFmlya7LyO2nR3szkRRylZmfoQbg4UxoB0HEftymLKo2/TipYne3bGQryAkfHc3OFPiKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7411.namprd11.prod.outlook.com (2603:10b6:8:150::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 25 Jul
 2024 23:57:29 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7784.017; Thu, 25 Jul 2024
 23:57:29 +0000
Date: Thu, 25 Jul 2024 16:57:25 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: =?utf-8?B?4pyTIENJLkZVTEw6IHN1Y2Nlcw==?= =?utf-8?Q?s?= for
 drm/xe/mmio: Use single logic for waiting functions
Message-ID: <20240725235725.GQ2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240723120120.5443-2-gustavo.sousa@intel.com>
 <172174416976.360136.6629288998379142892@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172174416976.360136.6629288998379142892@2413ebb6fbb6>
X-ClientProxiedBy: BY3PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:217::24) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7411:EE_
X-MS-Office365-Filtering-Correlation-Id: 73723811-620b-4264-0ba7-08dcad058a56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IPjLV6Ygj+eaXFohMBI8eu+GHNhy5zbrAQsku7vPtJcxnsFACvrO0kLAZVI9?=
 =?us-ascii?Q?SFAq9SmlHJcs86tOklG9oQ3gs+ZwTZtYFnk/AL0CJIEOhZAFPDCnvoOIYlSi?=
 =?us-ascii?Q?qTAqpTLz4mGRneMZbmUwo+BSbWp98EHlTOMF1cj80ZbsIBUcnLCgXair3Lsn?=
 =?us-ascii?Q?/0n8dRpPCnp/7q6M9FDL3ilk/zNpmrL8s5pVinTCn6LVX1E9BxX230u6M4dm?=
 =?us-ascii?Q?AsjW4kbeibeZ8UPZ+/pPrLgAFBS1oelJTEtUOcPUMVnRqTM5lWce97VXiXs4?=
 =?us-ascii?Q?m7nR6SZLunVjROusVNnZmTGSWlkltcpuge9hehNyyVsHNsZe4usVw5YZoleN?=
 =?us-ascii?Q?N4jdBZ545jbvHRrVKza/9zeI0wQmAo1tf8AL8XYMlPK4vyzuVLeoP9QmqLxn?=
 =?us-ascii?Q?MQJZuyyNSdwf9CqIsXNz8ULHu3Pb3IIp5PqJWMJKQlVLiyWvHC/tNQkCHclI?=
 =?us-ascii?Q?seTMfz+g3u6fE9HPszCTGawScKgFQpg4c4kCuwB2rF/X8GauBerSgW6/HqCh?=
 =?us-ascii?Q?DKxa3j1BRyBc4scfwW/Y8v339xv5OZQp8OyWxdCfl788cM8pilzukMcQN6kq?=
 =?us-ascii?Q?/w61HZv4weKh9/fniveC9vec/KoqxxTOjv/I3gzJZBV6mWUJo3TvkrByhaSh?=
 =?us-ascii?Q?tYUiuNZjd5FgHfs3SWU3iN7PQCAzl/J/twriil99W93euIslDfy4mKiJCs0c?=
 =?us-ascii?Q?w0Yo/eWZcma51jDZfoKjZElSZ2naVye1odPeK0BmlAu8R8j3WkntGfYk28o1?=
 =?us-ascii?Q?i1f0eg/RonmQfaSR/Ggw63bWJD7Bur0H8xtDnVABB25OpTMsTpx/luXPC/wJ?=
 =?us-ascii?Q?RiUTmssKQk4gmmdLqhn5tHMr39rg8BkajLMP01Xjh0+LmMmur/9iylzG5FfB?=
 =?us-ascii?Q?dTOmDY83RC59IE2higubA1WCW5qT0F9dIJ4hjm94GkERxQubW69hyIpbNMjd?=
 =?us-ascii?Q?O2zUzTvGtYuLvgvnhykbtElittomDTDq+qBBfKF17rGSedxtT/jLppq/jCk7?=
 =?us-ascii?Q?cPfF9xfXx4lBH2STdEayFviW4vKhVRTXb+GhNjJpoSgKVcHhYQlu9eAGDjhb?=
 =?us-ascii?Q?SQma8tMe/0Cfk1I+KFIH0dLn3PV+8xy2lxGQ2YhysDBc9We1oP8jAWzkdXsk?=
 =?us-ascii?Q?u+fKMdfNoZGG+KpzKl4Jk8SpT5n0ChYhhwfCLl2heQJjc1ef3eZo2KEdtwNe?=
 =?us-ascii?Q?xSpJojL9Ppvvm+vr3e9a48ochds+R2z8+ywGG6W3aHYeXpEF50hv44mJ/d/i?=
 =?us-ascii?Q?0g8NUFViJ+zjJGuiCSid+A5o2hEdUngN5xovwU3+FYPVA02InETd4REOUnyE?=
 =?us-ascii?Q?xtc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zdSBtND/isnFkWQOUC9Y043frZmZsr1b4nbWr44UNwKDxcVMu2omr7/w5bi2?=
 =?us-ascii?Q?fHi1bSUFjffmoRNHPgTsNLrT97N2vhOPNeFBVQRS94IiPL5PM8gmLgKyss9o?=
 =?us-ascii?Q?Qkvlx0HmP4LPSW4YbmJF6odZS5J2UGWv2d3BEsEEaKq8RdGuDBjNQse3zGxH?=
 =?us-ascii?Q?B9qjE/4J27yngOH7xxZEyRYeekCHO1c0wkdxShzVC6MtyR/PdIRRcUSZq0zJ?=
 =?us-ascii?Q?j/LCtersuf+q57vEWlX4WxnnO3SR/jSxypC2thRf05qH5C3nVNcvZNKseya7?=
 =?us-ascii?Q?WzdLJq91a+3u7zImXAjGeOoax1Qxa014/VPvGyz13EvBXmwpQ447+cxfvvy7?=
 =?us-ascii?Q?TfE7Ub/yFJaxUOy8qW4C5pWeHO2B03YJUfdob5Gdn+ieIwHKYxU5gIcH3GFg?=
 =?us-ascii?Q?ZxCdKB3Op2d/dOFfyLbtX11o/OTCMV/7XnK6fwzNo5nVZbC4Lxbqtos1XAjY?=
 =?us-ascii?Q?J3vqR83tLfbOFau881LyAUtTFVS0smzbWxFgFrAtLZ5RL7PClqOg0C9JAm0g?=
 =?us-ascii?Q?6DmbuLusswmkpTeBfTEfZPlqYNeBukKGqPdnoNZVJHz+WDKrs46ar/xpbUII?=
 =?us-ascii?Q?/eCv0gO4D7gVq2fbYQKN0G3sp5TOXq5eUJigm2IamNQ08l9NZXaGjBEumdSG?=
 =?us-ascii?Q?F1lMDhKEuOJPakgNXzJu+OJ632z3P6g8Y2w6EvuYfFfW2T+V5736hCKiD7hr?=
 =?us-ascii?Q?B/YvMxk8bcVjq1KFuvihASEYsWdSu+W8W9Jyzxs26E+drQGAoydzrexzi0lC?=
 =?us-ascii?Q?KijdQlIN1/f7s6rGgMoNE+7mt17l6s83Q9HZC4WiZej1sFLGglZ6ZKqiKCZI?=
 =?us-ascii?Q?sVPyem74j0qXtzcBT4mMSpS7RXSJrVul1zouWVINiJtlMAAqUhdAFkCJzo/J?=
 =?us-ascii?Q?33WkHVFOs9xQb8V4bhaOsEmAM1ScRIZ7GVpyFAnL9/25WNDhNfQD6Mdbd+b7?=
 =?us-ascii?Q?uLdmgH8DpaPY/uoJbfvMb8IgYWJIjNLnZEPwG9BBMZeA7rtDJdWaNev7LXYw?=
 =?us-ascii?Q?odTVI0bO9XZZDZ0HtgT6VfwqQsT6bF6H0A/BQ3CiUXwqwVW+7zrtUxa3A3wx?=
 =?us-ascii?Q?JInI7pbWq5Ldk9OrtVU08E8ewyfQ55iQg16yAnBQRlvEyJCmSPaKJYYkvAGC?=
 =?us-ascii?Q?W256uHh7TqY9QcCnkadUgdX509cHmWRbgL9N1fTc8wbmWIQVhNcBbDg4w166?=
 =?us-ascii?Q?k2XacBZY4zYujxaZmNCMBZmLAxtLq8ZsCK005i5ZD9tGbTFKFiMmYlA0s4q6?=
 =?us-ascii?Q?tRS3u0BPwZHXSr8kNAHMyQPj/8mvMbXauGSNNg3lhBHsdJ7Tmk8+nLcS8F5h?=
 =?us-ascii?Q?dU/RF0mRS+TQG1WJkZtpTcAFDk92cryovHbvso+29eJsNMpaKG4TpFb1kXBc?=
 =?us-ascii?Q?rIug4I6CeYzwDG0krTWWDhhDUs6cxdRsp0SAC/BPBxNQWmxCh8FiKYqzGb/S?=
 =?us-ascii?Q?nzWwXK6oahIYlaQM9gIZIoe7IKZ98x2HCXHWownx3aJ03YMD02s/W8fUzeEA?=
 =?us-ascii?Q?2En1xYZxF8f8NzTYRyZrI/tRu5U58m8In+jPfgvKliaCvCpHEjC6QelGuGyG?=
 =?us-ascii?Q?XNeoHufpGbV1ivLHWuIJtCq+R/Mr9AyLy86mY4A3GUMV1OaUici2H/v04sip?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73723811-620b-4264-0ba7-08dcad058a56
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 23:57:28.9185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ljZ3TFN8cpfIfAlXsFrC+xQvWi8Ek6m9VTvZ9al64JgfVmBv7hgzBq06nZXo9IqgwGP/KmrWCr3NpuCGWSfhGUCnY7nAyCh85cg4VEmAo3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7411
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

On Tue, Jul 23, 2024 at 02:16:09PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/mmio: Use single logic for waiting functions
> URL   : https://patchwork.freedesktop.org/series/136384/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1651-049eae5224ed92f3cb723a492593b255654e0649_full -> xe-pw-136384v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next with the typos fixed as requested.  Thanks for
the patch and review.


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
>   Here are the changes found in xe-pw-136384v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:
>     - shard-adlp:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#1033])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][3] ([Intel XE#1201] / [Intel XE#873])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-463/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
>     - shard-lnl:          [PASS][4] -> [FAIL][5] ([Intel XE#1426]) +1 other test fail
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition:
>     - shard-adlp:         NOTRUN -> [FAIL][6] ([Intel XE#1426]) +1 other test fail
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-2/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          [PASS][8] -> [FAIL][9] ([Intel XE#1659])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-2/igt@kms_big_fb@linear-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:
>     - shard-dg2-set2:     [PASS][11] -> [INCOMPLETE][12] ([Intel XE#1195])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-435/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-466/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1407])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-3/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-adlp:         NOTRUN -> [FAIL][14] ([Intel XE#1874])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1124]) +1 other test skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#367])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1399])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#1252])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#787]) +17 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#787]) +6 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#373]) +2 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-3/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#373])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-463/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-1/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
> 
>   * igt@kms_cursor_crc@cursor-random-64x21:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1424]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-3/igt@kms_cursor_crc@cursor-random-64x21.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#308])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#309]) +2 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_dsc@dsc-with-formats:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-463/igt@kms_dsc@dsc-with-formats.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1137])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-3/igt@kms_feature_discovery@dp-mst.html
>     - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1137] / [Intel XE#1201])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-1/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1135] / [Intel XE#1201])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-2/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms:
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1421])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-3/igt@kms_flip@2x-flip-vs-dpms.html
>     - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#310]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-dpms.html
> 
>   * igt@kms_flip@bo-too-big-interruptible:
>     - shard-lnl:          NOTRUN -> [TIMEOUT][36] ([Intel XE#1504]) +1 other test timeout
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-3/igt@kms_flip@bo-too-big-interruptible.html
> 
>   * igt@kms_flip@wf_vblank-ts-check@b-edp1:
>     - shard-lnl:          [PASS][37] -> [FAIL][38] ([Intel XE#886]) +1 other test fail
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1397] / [Intel XE#1745])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1397])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1401] / [Intel XE#1745])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1401])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#455]) +12 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#656]) +14 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [FAIL][45] ([Intel XE#1861])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1469])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#651])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#651]) +4 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#653]) +6 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#656]) +5 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [PASS][53] -> [SKIP][54] ([Intel XE#1201] / [Intel XE#455])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-436/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][55] ([Intel XE#616])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-436/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#599]) +4 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-3/igt@kms_plane_lowres@tiling-4@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>     - shard-dg2-set2:     [PASS][57] -> [FAIL][58] ([Intel XE#361]) +2 other tests fail
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [FAIL][59] ([Intel XE#361]) +1 other test fail
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-1/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25:
>     - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#2318]) +3 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201]) +16 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#870])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-1/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1439])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
>     - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#836])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@kms_psr@fbc-pr-sprite-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-463/igt@kms_psr@fbc-pr-sprite-blt.html
> 
>   * igt@kms_psr@psr2-sprite-plane-onoff:
>     - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-1/igt@kms_psr@psr2-sprite-plane-onoff.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-adlp:         [PASS][68] -> [FAIL][69] ([Intel XE#771] / [Intel XE#899])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
>     - shard-dg2-set2:     [PASS][70] -> [FAIL][71] ([Intel XE#899])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
>     - shard-adlp:         [PASS][72] -> [FAIL][73] ([Intel XE#899])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#756])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-3/igt@kms_writeback@writeback-fb-id.html
>     - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#756])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-1/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#756])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-463/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>     - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1123] / [Intel XE#1201])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-2/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x369:
>     - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1126] / [Intel XE#1201])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0x369.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#1126] / [Intel XE#1201])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-large:
>     - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#688])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-3/igt@xe_evict@evict-beng-mixed-many-threads-large.html
> 
>   * igt@xe_evict@evict-beng-small-external-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-2/igt@xe_evict@evict-beng-small-external-cm.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-large:
>     - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#261]) +2 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-2/igt@xe_evict@evict-mixed-many-threads-large.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
>     - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#688])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
> 
>   * igt@xe_exec_basic@many-userptr-invalidate-race:
>     - shard-adlp:         [PASS][84] -> [INCOMPLETE][85] ([Intel XE#1195])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-adlp-9/igt@xe_exec_basic@many-userptr-invalidate-race.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-4/igt@xe_exec_basic@many-userptr-invalidate-race.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue:
>     - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1392]) +1 other test skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-3/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
> 
>   * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
>     - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#1392]) +3 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch:
>     - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#288]) +11 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-1/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#288])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-imm.html
> 
>   * igt@xe_exec_reset@parallel-close-fd:
>     - shard-adlp:         [PASS][90] -> [ABORT][91] ([Intel XE#2271] / [Intel XE#2309])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-adlp-1/igt@xe_exec_reset@parallel-close-fd.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-8/igt@xe_exec_reset@parallel-close-fd.html
> 
>   * igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][92] ([Intel XE#1727] / [Intel XE#2226]) +1 other test dmesg-warn
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-2/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
>     - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#2229])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-3/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
>     - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1201] / [Intel XE#2229] / [Intel XE#455])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1201] / [Intel XE#2229])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
> 
>   * igt@xe_module_load@load:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#1201] / [Intel XE#378])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-463/igt@xe_module_load@load.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#979])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-2/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@s3-d3hot-basic-exec:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][98] ([Intel XE#1191] / [Intel XE#1727] / [Intel XE#2226])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-2/igt@xe_pm@s3-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-lnl:          [PASS][99] -> [ABORT][100] ([Intel XE#1794])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-lnl-7/igt@xe_pm@s4-mocs.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-2/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-lnl:          [PASS][101] -> [ABORT][102] ([Intel XE#1358] / [Intel XE#1794])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-lnl:          [PASS][103] -> [FAIL][104] ([Intel XE#958])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
>     - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-1/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
>     - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#944])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
> 
>   * igt@xe_vm@large-split-misaligned-binds-1073741824:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][107] ([Intel XE#2226]) +8 other tests dmesg-warn
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-2/igt@xe_vm@large-split-misaligned-binds-1073741824.html
> 
>   * igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer:
>     - shard-lnl:          [PASS][108] -> [ABORT][109] ([Intel XE#2271])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-lnl-7/igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-7/igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer.html
> 
>   * igt@xe_vm@munmap-style-unbind-either-side-partial-hammer:
>     - shard-dg2-set2:     [PASS][110] -> [ABORT][111] ([Intel XE#2271])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-464/igt@xe_vm@munmap-style-unbind-either-side-partial-hammer.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-434/igt@xe_vm@munmap-style-unbind-either-side-partial-hammer.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][112] ([Intel XE#324]) -> [PASS][113] +1 other test pass
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:
>     - shard-adlp:         [DMESG-WARN][114] ([Intel XE#1033]) -> [PASS][115]
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][116] ([Intel XE#2338]) -> [PASS][117]
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [INCOMPLETE][118] ([Intel XE#1195]) -> [PASS][119] +1 other test pass
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-6.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-lnl:          [DMESG-WARN][120] ([Intel XE#2052]) -> [PASS][121] +1 other test pass
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-lnl-1/igt@kms_flip@flip-vs-suspend.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-8/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>     - shard-adlp:         [FAIL][122] ([Intel XE#1874]) -> [PASS][123] +1 other test pass
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
> 
>   * {igt@kms_plane@plane-position-covered@pipe-a-plane-4}:
>     - shard-lnl:          [DMESG-FAIL][124] ([Intel XE#324]) -> [PASS][125] +2 other tests pass
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-a-plane-4.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-a-plane-4.html
> 
>   * {igt@kms_plane@plane-position-covered@pipe-b-plane-2}:
>     - shard-lnl:          [DMESG-WARN][126] ([Intel XE#324]) -> [PASS][127]
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-2.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-2.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
>     - shard-adlp:         [DMESG-WARN][128] -> [PASS][129] +1 other test pass
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-adlp-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-9/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
> 
>   * igt@kms_pm_rpm@system-suspend-modeset:
>     - shard-lnl:          [DMESG-WARN][130] ([Intel XE#2042]) -> [PASS][131]
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-lnl-1/igt@kms_pm_rpm@system-suspend-modeset.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-8/igt@kms_pm_rpm@system-suspend-modeset.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][132] ([Intel XE#899]) -> [PASS][133] +2 other tests pass
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
> 
>   * igt@xe_gt_freq@freq_fixed_exec:
>     - shard-adlp:         [ABORT][134] ([Intel XE#2271]) -> [PASS][135]
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-adlp-1/igt@xe_gt_freq@freq_fixed_exec.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-4/igt@xe_gt_freq@freq_fixed_exec.html
> 
>   * igt@xe_gt_freq@freq_low_max:
>     - shard-lnl:          [FAIL][136] -> [PASS][137]
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-lnl-6/igt@xe_gt_freq@freq_low_max.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-4/igt@xe_gt_freq@freq_low_max.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-lnl:          [ABORT][138] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][139]
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-3/igt@xe_pm@s4-basic-exec.html
>     - shard-adlp:         [ABORT][140] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][141]
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-1/igt@xe_pm@s4-basic-exec.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:
>     - shard-dg2-set2:     [SKIP][142] ([Intel XE#1201] / [Intel XE#801]) -> [SKIP][143] ([Intel XE#801]) +23 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][144] ([Intel XE#316]) -> [SKIP][145] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][146] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][147] ([Intel XE#316]) +2 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [FAIL][148] ([Intel XE#1231]) -> [DMESG-FAIL][149] ([Intel XE#324])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [DMESG-FAIL][150] ([Intel XE#324]) -> [FAIL][151] ([Intel XE#1231]) +1 other test fail
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][152] ([Intel XE#607]) -> [SKIP][153] ([Intel XE#1201] / [Intel XE#607])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-dg2-set2:     [SKIP][154] ([Intel XE#1124]) -> [SKIP][155] ([Intel XE#1124] / [Intel XE#1201]) +6 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-dg2-set2:     [SKIP][156] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][157] ([Intel XE#1124]) +5 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][158] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][159] ([Intel XE#367]) +1 other test skip
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][160] ([Intel XE#367]) -> [SKIP][161] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][162] ([Intel XE#787]) -> [SKIP][163] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][164] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][165] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
>     - shard-dg2-set2:     [SKIP][166] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][167] ([Intel XE#787]) +55 other tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][168] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][169] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>     - shard-dg2-set2:     [SKIP][170] ([Intel XE#1152]) -> [SKIP][171] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-0-75:
>     - shard-dg2-set2:     [SKIP][172] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][173] ([Intel XE#306]) +1 other test skip
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-434/igt@kms_chamelium_color@ctm-0-75.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-dg2-set2:     [SKIP][174] ([Intel XE#306]) -> [SKIP][175] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@kms_chamelium_color@degamma.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-434/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd:
>     - shard-dg2-set2:     [SKIP][176] ([Intel XE#373]) -> [SKIP][177] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>     - shard-dg2-set2:     [SKIP][178] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][179] ([Intel XE#373]) +7 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-dg2-set2:     [SKIP][180] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][181] ([Intel XE#308]) +2 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [SKIP][182] ([Intel XE#323]) -> [SKIP][183] ([Intel XE#1201] / [Intel XE#323]) +2 other tests skip
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2-set2:     [SKIP][184] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][185] ([Intel XE#776])
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-dg2-set2:     [SKIP][186] ([Intel XE#1137]) -> [SKIP][187] ([Intel XE#1137] / [Intel XE#1201])
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - shard-dg2-set2:     [SKIP][188] ([Intel XE#1201] / [i915#5274]) -> [SKIP][189] ([i915#5274])
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     [SKIP][190] ([Intel XE#651]) -> [SKIP][191] ([Intel XE#1201] / [Intel XE#651]) +20 other tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][192] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][193] ([Intel XE#651]) +18 other tests skip
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-dg2-set2:     [SKIP][194] ([Intel XE#658]) -> [SKIP][195] ([Intel XE#1201] / [Intel XE#658]) +1 other test skip
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][196] ([Intel XE#653]) -> [SKIP][197] ([Intel XE#1201] / [Intel XE#653]) +22 other tests skip
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-slowdraw:
>     - shard-dg2-set2:     [SKIP][198] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][199] ([Intel XE#653]) +21 other tests skip
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-slowdraw.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-dg2-set2:     [SKIP][200] ([Intel XE#1201] / [Intel XE#605]) -> [SKIP][201] ([Intel XE#605])
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_plane@plane-position-covered:
>     - shard-lnl:          [DMESG-FAIL][202] ([Intel XE#324]) -> [DMESG-WARN][203] ([Intel XE#324])
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-lnl-4/igt@kms_plane@plane-position-covered.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-5/igt@kms_plane@plane-position-covered.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][204] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][205] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][206] -> [SKIP][207] ([Intel XE#1201]) +2 other tests skip
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][208] ([Intel XE#2318]) -> [SKIP][209] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][210] ([Intel XE#455]) -> [SKIP][211] ([Intel XE#1201] / [Intel XE#455]) +9 other tests skip
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-dg2-set2:     [SKIP][212] ([Intel XE#870]) -> [SKIP][213] ([Intel XE#1201] / [Intel XE#870])
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg2-set2:     [SKIP][214] ([Intel XE#1129]) -> [SKIP][215] ([Intel XE#1129] / [Intel XE#1201])
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-463/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-dg2-set2:     [SKIP][216] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][217] ([Intel XE#1129])
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-dg2-set2:     [SKIP][218] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][219] ([Intel XE#908])
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>     - shard-dg2-set2:     [SKIP][220] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][221] ([Intel XE#1489]) +2 other tests skip
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-433/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
>     - shard-dg2-set2:     [SKIP][222] ([Intel XE#1489]) -> [SKIP][223] ([Intel XE#1201] / [Intel XE#1489]) +3 other tests skip
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-463/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
>     - shard-dg2-set2:     [SKIP][224] ([Intel XE#929]) -> [SKIP][225] ([Intel XE#1201] / [Intel XE#929]) +10 other tests skip
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
> 
>   * igt@kms_psr@psr2-cursor-plane-onoff:
>     - shard-dg2-set2:     [SKIP][226] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][227] ([Intel XE#929]) +10 other tests skip
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-433/igt@kms_psr@psr2-cursor-plane-onoff.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-432/igt@kms_psr@psr2-cursor-plane-onoff.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-dg2-set2:     [SKIP][228] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][229] ([Intel XE#1149])
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-dg2-set2:     [SKIP][230] ([Intel XE#327]) -> [SKIP][231] ([Intel XE#1201] / [Intel XE#327])
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2-set2:     [SKIP][232] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][233] ([Intel XE#327]) +1 other test skip
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][234] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][235] ([Intel XE#1201] / [Intel XE#1500])
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-dg2-set2:     [SKIP][236] ([Intel XE#1201] / [Intel XE#330]) -> [SKIP][237] ([Intel XE#330])
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2-set2:     [SKIP][238] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][239] ([Intel XE#455]) +11 other tests skip
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-434/igt@kms_vrr@flipline.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-432/igt@kms_vrr@flipline.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-dg2-set2:     [SKIP][240] ([Intel XE#756]) -> [SKIP][241] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-463/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x369:
>     - shard-dg2-set2:     [SKIP][242] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][243] ([Intel XE#1126])
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x369.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
>     - shard-dg2-set2:     [SKIP][244] ([Intel XE#288]) -> [SKIP][245] ([Intel XE#1201] / [Intel XE#288]) +16 other tests skip
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:
>     - shard-dg2-set2:     [SKIP][246] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][247] ([Intel XE#288]) +15 other tests skip
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     [SKIP][248] ([Intel XE#1201] / [Intel XE#512]) -> [SKIP][249] ([Intel XE#512])
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-433/igt@xe_mmap@small-bar.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-432/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - shard-dg2-set2:     [SKIP][250] ([Intel XE#1201] / [Intel XE#977]) -> [SKIP][251] ([Intel XE#977])
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-433/igt@xe_pat@pat-index-xe2.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-432/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pm@d3cold-basic:
>     - shard-dg2-set2:     [SKIP][252] ([Intel XE#366]) -> [SKIP][253] ([Intel XE#1201] / [Intel XE#366])
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@xe_pm@d3cold-basic.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-434/igt@xe_pm@d3cold-basic.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-adlp:         [SKIP][254] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][255] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) +2 other tests skip
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-adlp-2/igt@xe_pm@d3cold-multiple-execs.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-8/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-dg2-set2:     [DMESG-WARN][256] ([Intel XE#1551] / [Intel XE#569]) -> [INCOMPLETE][257] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#1551] / [Intel XE#569])
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-466/igt@xe_pm@s3-basic-exec.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-435/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-lnl:          [SKIP][258] ([Intel XE#366]) -> [SKIP][259] ([Intel XE#2284] / [Intel XE#366]) +2 other tests skip
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-lnl-8/igt@xe_pm@s3-d3cold-basic-exec.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-8/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-engines:
>     - shard-dg2-set2:     [SKIP][260] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][261] ([Intel XE#944]) +2 other tests skip
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-434/igt@xe_query@multigpu-query-engines.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-432/igt@xe_query@multigpu-query-engines.html
> 
>   * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
>     - shard-dg2-set2:     [SKIP][262] ([Intel XE#944]) -> [SKIP][263] ([Intel XE#1201] / [Intel XE#944])
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-432/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-434/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-dg2-set2:     [DMESG-FAIL][264] ([Intel XE#1760]) -> [DMESG-WARN][265] ([Intel XE#1760])
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-dg2-435/igt@xe_wedged@wedged-at-any-timeout.html
>     - shard-lnl:          [DMESG-WARN][266] ([Intel XE#1760]) -> [DMESG-FAIL][267] ([Intel XE#1760])
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-lnl-1/igt@xe_wedged@wedged-at-any-timeout.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-lnl-3/igt@xe_wedged@wedged-at-any-timeout.html
>     - shard-adlp:         [DMESG-FAIL][268] ([Intel XE#1760]) -> [DMESG-WARN][269] ([Intel XE#1760])
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/shard-adlp-2/igt@xe_wedged@wedged-at-any-timeout.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/shard-adlp-8/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
>   [Intel XE#2052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207
>   [Intel XE#2226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2309
>   [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
>   [Intel XE#2338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2338
>   [Intel XE#2339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2339
>   [Intel XE#2343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1651-049eae5224ed92f3cb723a492593b255654e0649 -> xe-pw-136384v1
> 
>   IGT_7935: a85286b8cdfc8d2c902128946e90f8b17cecaa89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1651-049eae5224ed92f3cb723a492593b255654e0649: 049eae5224ed92f3cb723a492593b255654e0649
>   xe-pw-136384v1: 136384v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
