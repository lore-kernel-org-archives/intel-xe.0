Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE631CCD192
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 15:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE8F10E640;
	Tue, 14 Oct 2025 15:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GLL/kpu9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFDF10E645
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 15:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760454708; x=1791990708;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=sGMxzY08TPh5pWYabj8Mb/hLkU7dEi86gC3ymi38wus=;
 b=GLL/kpu9Fvqc9dEqIHCP8eWcepTebkuwsaVQgGEnlADJylAWP/wats8Y
 xO6AO8lpDFIZMEAgrKadVHjvlhxGGgGkULDH1HNduhHoW0AI7Mil/RJrA
 HRPIl3BRBvxYaWawHWEadKKw+j1huToCqesYtmk2yv3h055An1X2r/W1I
 HaVMSl1w7vLrJbLg6ctGBtVRZPk/2UC7EhuabvXDO9Nb2Lz3KhxsIS4nt
 vhBzPk6iPdPQ8dDiH/pU/mY2hc9Y2A9pMr0MDXcCbbVg2+H++MpfUWIG1
 7qSQYeQs+rJ5Bq/XjAzabSOk2coFmbqp06XOmzF/3GOlIqWZ8JCLtQ4TL A==;
X-CSE-ConnectionGUID: l4bBAseqToWogyMor2m+rQ==
X-CSE-MsgGUID: vRFI74oJSQKmYUt6oNjwXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="61652242"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="61652242"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 08:11:47 -0700
X-CSE-ConnectionGUID: tML5m/p0Tf+9bNSwfbaz1Q==
X-CSE-MsgGUID: EW4JpOKNQ4qtIJu7MDoF8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="219048350"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 08:11:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 08:11:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 08:11:46 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 08:11:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iumBN8rzzuSstOXPt6Zh4sP8N9PA7QBfr8fFvtNjTN1qDh/RtOzQznRblHi6BvNdzzGPH7mHl9Qtzec5qwedrtYeny2vpUc7KoH2HDAUt0I9Y82wWOCcgLOEU2E0CjGmA0BacHCa4DER+4BRxR1megKQ4mEWiC0pIvjDeQa4OV+MnuknpKxKQ1TLjwXIamQSPX3U8up/Ga4v1XnTwjRWp0QEFn8E+CPhLTCyGNTL59ep44arxZxAcLhdqd6lFkiP+t1ZU17gKln8FMQrKM+yaYBIelBgxfpRTxSf7bj1Rm3U8sDXesejGkPdtmuLJ3/SdAWT4e78J/w0Kr7ot+v48g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3BpiT4WREUT5RYB0TlRfKVZTHmgqwhqqQeEzan4lu8Q=;
 b=apYwQZ7aFJHNX9hjZ1HmSy4Ei8welnE5EFm+nQ6L8ZVVDJztmhA/ICJkNM1napigIxx+hc2gko8p0/MG63YnGW/czzSVIASCGBOGCo1IYQYaVVNZHGQoX7sLKVw7xnQ5OXmJGPqVBwTU9DEGoZxG98vTOg2PS7VPP+APHgNgZCmM1KJDo6i8gYyt2BPFfomsjjmBbDH145Z1K/O13cSJMLvaTPxCCBn/loOH3v4L4YQhfpA2BmT4+ZLjYMRwPycJrrilIF5h3ThUh4gMC1AvYo9G1C0Xok3jfSyRycDG+RpZ2ZkIhzoaV4Hi0aEl+wPuqH2R7dLlG56gtqMrYW1nIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS4PPF8B2A2E830.namprd11.prod.outlook.com (2603:10b6:f:fc02::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 14 Oct
 2025 15:10:27 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 15:10:27 +0000
Date: Tue, 14 Oct 2025 08:10:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZ1bGw6IHN1Y2Nl?= =?utf-8?Q?ss?= for
 Allow configfs to disable specific GT type(s) (rev5)
Message-ID: <20251014151024.GL5409@mdroper-desk1.amr.corp.intel.com>
References: <20251013200944.2499947-25-matthew.d.roper@intel.com>
 <176042933162.10163.18196535671738827803@97596180aaec>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176042933162.10163.18196535671738827803@97596180aaec>
X-ClientProxiedBy: BY5PR16CA0007.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::20) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS4PPF8B2A2E830:EE_
X-MS-Office365-Filtering-Correlation-Id: 58a3dc7a-dcc5-4033-f8ff-08de0b33ce62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+5+8EU5G3pHoFtmRpkUnST0MkQtjYK1479npoqGzI3DjXN4ftMfk8CYhDAsl?=
 =?us-ascii?Q?Z+2bwYBUwM7rwpCyT2TMAVdLaTd+er7hgvzCkwsUdJEF/YDUJyN16eGuplnX?=
 =?us-ascii?Q?fJj0KDZyaiBN8wrpYDd7eC0Ik66T5QNmSgcNngD+fBySv7lxCzyqqTmZm80v?=
 =?us-ascii?Q?Vm07fDI4y7wsENjV3T2HrGp74kzZYkEUpe5soPKzNg1oyn2cD5pTtLadDk5n?=
 =?us-ascii?Q?MrEV7JgH6KAVFAXCz6vOXe3G73QIBy72R/I7jwM8qbncJwf+AkowTvqpomkm?=
 =?us-ascii?Q?JIoolg90K9sYd9r8K5xcxtSzOAkzRhsN2lenOWophzBOWZ+iCt0q9F9BgmYV?=
 =?us-ascii?Q?JjwjQOAoKGnXe6iSKfjJKj02t7jgpNKt4mCAFxZVvKnjI3Vuv31vTh9Dk3uY?=
 =?us-ascii?Q?XioxTMdBHWk0JBYpc85Wxqbtb4eqN9ebbERwk5UBgj3kJ3CsKAoax2SESEER?=
 =?us-ascii?Q?CDTZ7sZbRHR3WWaWSRslE6ljEH5utLkwkMwwWxg1O6SuRiLmOR8PIPgd23bs?=
 =?us-ascii?Q?LpKMx72S3pZoAW8HvB9bI+rwBZM8Oz+4ZrMg+tFkqqAEUI4UchdTd8tMD5jG?=
 =?us-ascii?Q?K6tx0SmBrHFzHpBm5Qdw2XDz1r7+jr+TCy6ZztVmp+Rvhz37TCkiPRrZDUzf?=
 =?us-ascii?Q?aR7AeKxDpqlcnOYQEDMNcYJN6xKKyHEsNDfzR2+wk5buvMGbgYnClZ8dKZ5C?=
 =?us-ascii?Q?tz/mP2Q6znHPX9qY9aMSiOw3Pmp/iXIuxceOlJl0+70SPNA73h10wDOwLA41?=
 =?us-ascii?Q?hNVQyRCmYqaGlEud0NmD7sj55I5wevoDG1X3qpSNNLw+3uHvsioUQlOUAyms?=
 =?us-ascii?Q?Q4eNFlHv3gpfqvlF/9hOEUBK/Q8TREPhx8K2+EjvuEB/wXk5t40hLL7b0LEI?=
 =?us-ascii?Q?5QjfdVT8/os2wwMuEIf4AwjMgOI/AxUXk8pimDJzZ8SteosRkuJbHVgTN50w?=
 =?us-ascii?Q?J7lIxG/S/oN/lW2uEI5Jv4IxXlXm9Bgre5v4DEjFl78W+O4LrcdkrXJtbc5W?=
 =?us-ascii?Q?NwctGa3nPcNsgwOzhX5iht9ynrtJ1T8WU0LUQIqbKGKWZn2yCuCndVcVodzt?=
 =?us-ascii?Q?D5vP+RDegcrql43wu9c3sDuLygcnaSnctxUVscwFEkx1KM0MPcrusOcF1X0U?=
 =?us-ascii?Q?EpeOkpFaTT/knNSQEQKR7xAWQZZPsTf5PwDXWQnR7GKhp5rZEkeY3HhLvQV9?=
 =?us-ascii?Q?gpvnxdBo7qwJjd1w8AyiugYSEH3lUdnEmQVtiXN7RSBWXn6wXGP/HByLNB+h?=
 =?us-ascii?Q?7ykTWwl/bRda8CrhQHA0opPxW8RuXtyppRRnBvxyQ2ETF89+yeb/3hvn/FJa?=
 =?us-ascii?Q?zgsHvOAinqtNA1/UV+ZzbnPYM2zl7moQcHs1rsRnkhYzWIMpspBwD3T8EAir?=
 =?us-ascii?Q?aS6JYpHwDbt83X+e9lqzdIDExOLgQOUwQoP2pAgQ5ix6W9u0yA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BEDIf8huwS4WYNcJC4INgH/5AAGDYAV6YqKKU0Ptr4+Yx0WFX7R2f+wTvU3T?=
 =?us-ascii?Q?H3hQkq2hH6MAV/b4O/aXcwL0k/47ZzZ4VpjJXAUyFCkT/ZSm9jcLbTkLMHg8?=
 =?us-ascii?Q?L/0a1daACTKHvRJLJHOtjoN+mFGeD23k5aefzSoT8Iu7P3CA1vOnB135oFGW?=
 =?us-ascii?Q?AWLriUPz3ltD5XnW4euFauuZSaGDZDlgfHCygPty/5gHpZIawUZ4wSdIvWAQ?=
 =?us-ascii?Q?bPi7zejloMk6KYBl0VKy606NtvkzutwkxvyUjRhAF8npCw+4rMuEu+LAzzpL?=
 =?us-ascii?Q?y7MoJqC8f9ydk/aBs9Hv/jwoqCVAf2DoJnH2PS+OWu89zUZ9hMEP/2gXg/ij?=
 =?us-ascii?Q?WAXbaEjaS0DoDC3NG/MGa1mx7yjxKQYcr6XJEJxi3LD1/9haZyA1L0bLRZK9?=
 =?us-ascii?Q?5uDotGSj1fy1NazMxopBwC+ICthftpc5+fPRCMXLGvLq1k6v2xVfbV8AMm1t?=
 =?us-ascii?Q?rlSH4mE3FM5hFxIh9xJQrwV61nbCA4fWoLjsz/pdZGdzbCQHzpNwb4XyLFCr?=
 =?us-ascii?Q?65MFSjlzsb8Bhui1yJCNnv9hzISlQhVfLFjINCVn2ftBN7UT9sICrO4Utn+z?=
 =?us-ascii?Q?Ep/Pnc6xbK6F6YH3+MJnsuIXc8dXhXYy+OFrMoEEEJgfaKY0oOxht1SDQINg?=
 =?us-ascii?Q?G8nV6mVku9sXfGyV7s8QdOkszUzsFeQAVIf3tYNDX1z+WkEfA6uGBqHUQ0W4?=
 =?us-ascii?Q?ZUdk809kJYujUtDXyQtVQasggQdr58Zr2X0CtfLVqf+Lh5W9SOaVvctymLdh?=
 =?us-ascii?Q?qMfsLFO4z0WBaQntleig4fT6SieQIYRvfeB1cnHgZEGGpzesEwlNrwlh/TSz?=
 =?us-ascii?Q?GbSTauew6oMfGdztJGqJ0LURD861/fCXeHOT2fdzD+xo9W/F5GADt0McfdS+?=
 =?us-ascii?Q?5fNtCU9jCs7FgV7qd/Fm9E+gO1isybuaDV/vIehvGj+I1Xbf8oGZb5aDaFhY?=
 =?us-ascii?Q?z5vQ9cqUL1vlBmkwj7eu5CIzlbAazeVHrx8lNDNU74BX8xdWotEWC1i5AD5+?=
 =?us-ascii?Q?TOYbtVPRez3fvAq3Tw4lGVGWhxtVvi2Y8cB+VpoQs/+n9D8RVN//vDozqc+l?=
 =?us-ascii?Q?700WUJaXqS74OeWPjGljMBN3xpIbam5uJPZijS+WYyHgQRqlfVx1JDGcoWjy?=
 =?us-ascii?Q?hkwG+ZlbMRXHWWGCZXXIjPQnWaJ1wMGCHmmZyWtzbF+xVMWe4nI8zsbStKNF?=
 =?us-ascii?Q?r0IgILxDnxWjReucV/TW9aif2xhViY5qdBNDWTul0mef2ytgVxSstqZy0Gtb?=
 =?us-ascii?Q?QdKIV42HLtzuWL0GBdvoz/7PMUNynZTqRaEFAJzgUQiWmG3DHAyImHcN7dly?=
 =?us-ascii?Q?eq6c0osKQovs/pmTTUq7q+2EEQ1noPp5lzyPuyjidb6nR7fQpQ6nOHpgCOA2?=
 =?us-ascii?Q?gZs+YOHI+RQwECPhGj68m0RaY5TddUmj5NBEm3h/PeJcsxour06FpRaY4yKB?=
 =?us-ascii?Q?wJICSxa74iKMtNZqKFKU9UC8514KsqoofJbwK4NLHJEVcB3rWWK6jGZ1MqaH?=
 =?us-ascii?Q?R8kjhgSR+R3rXt/Ift4hkU0ZclACOj12tycPmON7U8RNrhkZ5I6yTxu59Zyz?=
 =?us-ascii?Q?p6ySvBamEp4U8MCAxxupCEQjWq0jGhFMiN1bYnNaDiZ8pXRfqlJUnc982Wqp?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a3dc7a-dcc5-4033-f8ff-08de0b33ce62
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 15:10:26.9729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGwskvQ98iaWUYEGJAmvpPuGe5D0hSucJqCmxImspDxuUQhzZqK8XJ8qmtlKJEDBQWidVxNBcQvhXnWdTrp/DSi7KcaV/yKl9ZNx7Q/IDCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF8B2A2E830
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

On Tue, Oct 14, 2025 at 08:08:51AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Allow configfs to disable specific GT type(s) (rev5)
> URL   : https://patchwork.freedesktop.org/series/154739/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada_FULL -> xe-pw-154739v5_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Series applied to drm-xe-next.  Thanks Lucas, Gustavo, Michal, and Tejas
for the reviews.


Matt

> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-154739v5_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [FAIL][1] ([Intel XE#3884]) +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#1407]) +2 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@kms_big_fb@linear-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][3] ([Intel XE#316]) +5 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-9/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#1477])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][5] ([Intel XE#4543]) +7 other tests dmesg-fail
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#610])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1124]) +1 other test skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1124]) +8 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>     - shard-bmg:          [PASS][10] -> [SKIP][11] ([Intel XE#2314] / [Intel XE#2894])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
>     - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#2191]) +2 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#367])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
>     - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#367])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#787]) +6 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-4.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#787]) +53 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-9/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2887]) +2 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#2907])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#2669]) +3 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#2907])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#455] / [Intel XE#787]) +35 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][24] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#306]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@kms_chamelium_color@ctm-negative.html
>     - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#306]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#373])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#373])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>     - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#373]) +8 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> 
>   * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][30] ([Intel XE#1178])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-5/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#307]) +1 other test skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-6/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1468])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-128x42:
>     - shard-adlp:         [PASS][33] -> [DMESG-WARN][34] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-adlp-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x32:
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1424]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@kms_cursor_crc@cursor-random-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][36] ([Intel XE#2953] / [Intel XE#4173])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-9/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#309]) +6 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#309])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][39] -> [SKIP][40] ([Intel XE#2291]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#323])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#4302])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>     - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#1340])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#3009])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_dp_link_training@uhbr-mst:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#4354])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@kms_dp_link_training@uhbr-mst.html
> 
>   * igt@kms_dp_link_training@uhbr-sst:
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#4356]) +1 other test skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-9/igt@kms_dp_link_training@uhbr-sst.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1135])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#310]) +4 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1421]) +1 other test skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-nonexisting-fb:
>     - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#2316]) +6 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
> 
>   * igt@kms_flip@basic-plain-flip@b-hdmi-a1:
>     - shard-adlp:         [PASS][54] -> [DMESG-WARN][55] ([Intel XE#4543]) +3 other tests dmesg-warn
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-adlp-1/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-6/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-dg2-set2:     [PASS][56] -> [FAIL][57] ([Intel XE#301]) +1 other test fail
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][58] ([Intel XE#4543]) +5 other tests dmesg-warn
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [PASS][59] -> [INCOMPLETE][60] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>     - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#455]) +25 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
>     - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1401]) +1 other test skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][64] ([Intel XE#4543] / [Intel XE#4921]) +3 other tests dmesg-fail
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:
>     - shard-adlp:         [PASS][65] -> [DMESG-FAIL][66] ([Intel XE#4543])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#651]) +1 other test skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#651]) +11 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#656]) +33 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#651]) +3 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
>     - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#653]) +14 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#653])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#656]) +6 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#3374] / [Intel XE#3544])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-bmg:          [PASS][75] -> [SKIP][76] ([Intel XE#1503])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-1/igt@kms_hdr@static-toggle-suspend.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#3012])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-9/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
>     - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#4329])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
> 
>   * igt@kms_plane_multiple@2x-tiling-none:
>     - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#4596])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-9/igt@kms_plane_multiple@2x-tiling-none.html
> 
>   * igt@kms_plane_multiple@2x-tiling-x:
>     - shard-bmg:          [PASS][80] -> [SKIP][81] ([Intel XE#4596])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-x.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#870])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1129])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-9/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1406] / [Intel XE#1489]) +6 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
>     - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1406] / [Intel XE#4608]) +1 other test skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
>     - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1406] / [Intel XE#2893])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#1122] / [Intel XE#1406] / [Intel XE#5580]) +1 other test skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-pr-cursor-plane-move:
>     - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1406]) +1 other test skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@kms_psr@fbc-pr-cursor-plane-move.html
> 
>   * igt@kms_psr@fbc-pr-sprite-render:
>     - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +10 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@kms_psr@fbc-pr-sprite-render.html
> 
>   * igt@kms_psr@pr-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-dg2-436/igt@kms_psr@pr-dpms.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1127])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#3414]) +3 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-9/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#330])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@kms_tv_load_detect@load-detect.html
>     - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#330])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@xe_ccs@suspend-resume:
>     - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#455] / [Intel XE#488] / [Intel XE#5607])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-6/igt@xe_ccs@suspend-resume.html
> 
>   * igt@xe_compute_preempt@compute-preempt:
>     - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#455] / [Intel XE#5632])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@xe_compute_preempt@compute-preempt.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfd:
>     - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#1123])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@xe_copy_basic@mem-copy-linear-0xfd.html
> 
>   * igt@xe_create@create-big-vram:
>     - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#1062])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-9/igt@xe_create@create-big-vram.html
> 
>   * igt@xe_eu_stall@blocking-re-enable:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#5626])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-dg2-436/igt@xe_eu_stall@blocking-re-enable.html
> 
>   * igt@xe_eudebug@basic-read-event:
>     - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#4837] / [Intel XE#5565]) +14 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@xe_eudebug@basic-read-event.html
> 
>   * igt@xe_eudebug@sysfs-toggle:
>     - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#4837]) +3 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@xe_eudebug@sysfs-toggle.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#261] / [Intel XE#5564]) +1 other test skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@xe_evict@evict-beng-large-multi-vm.html
> 
>   * igt@xe_evict@evict-beng-small-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-9/igt@xe_evict@evict-beng-small-multi-vm.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#261]) +5 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@xe_evict@evict-mixed-many-threads-small.html
>     - shard-bmg:          [PASS][107] -> [INCOMPLETE][108] ([Intel XE#6321])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
>     - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#688]) +1 other test skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
>     - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#688])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
>     - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#1392] / [Intel XE#5575]) +8 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
>     - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#1392]) +1 other test skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
>     - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#288] / [Intel XE#5561]) +25 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-basic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#288])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-basic.html
> 
>   * igt@xe_exec_system_allocator@process-many-execqueues-malloc-busy-nomemset:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#4915]) +13 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-dg2-436/igt@xe_exec_system_allocator@process-many-execqueues-malloc-busy-nomemset.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-mmap-file-mlock:
>     - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#4915]) +238 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-6/igt@xe_exec_system_allocator@process-many-large-mmap-file-mlock.html
> 
>   * igt@xe_exec_system_allocator@threads-many-large-mmap-huge:
>     - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#4943]) +5 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@xe_exec_system_allocator@threads-many-large-mmap-huge.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#4943])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][119] ([Intel XE#5466])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-dg2-436/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@xe_live_ktest@xe_bo.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#2229])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
> 
>   * igt@xe_mmap@pci-membarrier:
>     - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#5100])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@xe_mmap@pci-membarrier.html
>     - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#5100])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@xe_mmap@pci-membarrier.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#378] / [Intel XE#5612])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@xe_module_load@force-load.html
> 
>   * igt@xe_oa@mmio-triggered-reports-read:
>     - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#6032])
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-6/igt@xe_oa@mmio-triggered-reports-read.html
> 
>   * igt@xe_oa@syncs-syncobj-cfg:
>     - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#3573]) +5 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-6/igt@xe_oa@syncs-syncobj-cfg.html
> 
>   * igt@xe_pat@display-vs-wb-transient:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#1337])
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#977])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pm@d3cold-i2c:
>     - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#5694])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@xe_pm@d3cold-i2c.html
> 
>   * igt@xe_pm@d3cold-mmap-vram:
>     - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@xe_pm@d3cold-mmap-vram.html
> 
>   * igt@xe_pm@d3hot-mmap-vram:
>     - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#1948])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-9/igt@xe_pm@d3hot-mmap-vram.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#5611] / [Intel XE#579])
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_pmu@fn-engine-activity-load:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#4650])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-dg2-436/igt@xe_pmu@fn-engine-activity-load.html
> 
>   * igt@xe_pmu@gt-frequency:
>     - shard-dg2-set2:     [PASS][135] -> [FAIL][136] ([Intel XE#5166]) +1 other test fail
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-dg2-464/igt@xe_pmu@gt-frequency.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-dg2-436/igt@xe_pmu@gt-frequency.html
> 
>   * igt@xe_pxp@display-black-pxp-fb:
>     - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#4733])
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-9/igt@xe_pxp@display-black-pxp-fb.html
> 
>   * igt@xe_pxp@display-pxp-fb:
>     - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#4733])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-1/igt@xe_pxp@display-pxp-fb.html
> 
>   * igt@xe_pxp@pxp-stale-queue-post-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#4733] / [Intel XE#5594])
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@xe_pxp@pxp-stale-queue-post-suspend.html
> 
>   * igt@xe_query@multigpu-query-config:
>     - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#944])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@xe_query@multigpu-query-config.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#944]) +2 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-6/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   * igt@xe_render_copy@render-stress-2-copies:
>     - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#4814] / [Intel XE#5614]) +1 other test skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-9/igt@xe_render_copy@render-stress-2-copies.html
> 
>   * igt@xe_sriov_scheduling@equal-throughput:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][143] ([Intel XE#3868] / [Intel XE#5213] / [Intel XE#5545]) +1 other test dmesg-fail
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-2/igt@xe_sriov_scheduling@equal-throughput.html
>     - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#4351])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-2/igt@xe_sriov_scheduling@equal-throughput.html
> 
>   * igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:
>     - shard-adlp:         [PASS][145] -> [DMESG-FAIL][146] ([Intel XE#3868] / [Intel XE#5213] / [Intel XE#5545]) +1 other test dmesg-fail
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-adlp-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
>     - shard-lnl:          [FAIL][147] ([Intel XE#5993]) -> [PASS][148] +3 other tests pass
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [INCOMPLETE][149] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#6168]) -> [PASS][150] +1 other test pass
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][151] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [PASS][152]
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-bmg:          [SKIP][153] ([Intel XE#2291]) -> [PASS][154] +6 other tests pass
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst:
>     - shard-bmg:          [SKIP][155] ([Intel XE#4354]) -> [PASS][156]
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
>     - shard-bmg:          [SKIP][157] ([Intel XE#2316]) -> [PASS][158] +11 other tests pass
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [FAIL][159] ([Intel XE#301]) -> [PASS][160] +1 other test pass
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip@flip-vs-rmfb:
>     - shard-adlp:         [DMESG-WARN][161] ([Intel XE#4543] / [Intel XE#5208]) -> [PASS][162]
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-adlp-8/igt@kms_flip@flip-vs-rmfb.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-1/igt@kms_flip@flip-vs-rmfb.html
> 
>   * igt@kms_flip@flip-vs-rmfb@b-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][163] ([Intel XE#4543]) -> [PASS][164] +4 other tests pass
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-adlp-8/igt@kms_flip@flip-vs-rmfb@b-hdmi-a1.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-1/igt@kms_flip@flip-vs-rmfb@b-hdmi-a1.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-bmg:          [SKIP][165] ([Intel XE#1503]) -> [PASS][166]
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-1/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-bmg:          [SKIP][167] ([Intel XE#3012]) -> [PASS][168]
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@kms_plane_multiple@2x-tiling-4:
>     - shard-bmg:          [SKIP][169] ([Intel XE#4596]) -> [PASS][170] +1 other test pass
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-4.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>     - shard-bmg:          [SKIP][171] ([Intel XE#1435]) -> [PASS][172]
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> 
>   * {igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance1}:
>     - shard-bmg:          [DMESG-WARN][173] ([Intel XE#3876]) -> [PASS][174] +1 other test pass
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-6/igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance1.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-1/igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance1.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][175] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [INCOMPLETE][176] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345])
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-bmg:          [SKIP][177] ([Intel XE#2341]) -> [FAIL][178] ([Intel XE#1178])
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-bmg:          [FAIL][179] ([Intel XE#1178]) -> [SKIP][180] ([Intel XE#2341])
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-2/igt@kms_content_protection@legacy.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-4/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>     - shard-adlp:         [DMESG-FAIL][181] ([Intel XE#4543]) -> [FAIL][182] ([Intel XE#1874])
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][183] ([Intel XE#2311]) -> [SKIP][184] ([Intel XE#2312]) +18 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          [SKIP][185] ([Intel XE#2312]) -> [SKIP][186] ([Intel XE#5390]) +10 other tests skip
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>     - shard-bmg:          [SKIP][187] ([Intel XE#5390]) -> [SKIP][188] ([Intel XE#2312]) +3 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][189] ([Intel XE#2312]) -> [SKIP][190] ([Intel XE#2311]) +21 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-bmg:          [SKIP][191] ([Intel XE#2312]) -> [SKIP][192] ([Intel XE#2313]) +20 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][193] ([Intel XE#2313]) -> [SKIP][194] ([Intel XE#2312]) +14 other tests skip
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-bmg:          [SKIP][195] ([Intel XE#5021]) -> [SKIP][196] ([Intel XE#4596])
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [SKIP][197] ([Intel XE#2426]) -> [FAIL][198] ([Intel XE#1729])
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
>   [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
>   [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
>   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>   [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
>   [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>   [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
>   [Intel XE#5166]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5166
>   [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
>   [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
>   [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
>   [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
>   [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
>   [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
>   [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
>   [Intel XE#5580]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5580
>   [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
>   [Intel XE#5607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607
>   [Intel XE#5611]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5611
>   [Intel XE#5612]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612
>   [Intel XE#5614]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5614
>   [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
>   [Intel XE#5632]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5632
>   [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
>   [Intel XE#6011]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6011
>   [Intel XE#6032]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6320
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6326
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada -> xe-pw-154739v5
> 
>   IGT_8582: 8582
>   xe-3911-c917f7d11493984be9f381ca0a7667bd3e587ada: c917f7d11493984be9f381ca0a7667bd3e587ada
>   xe-pw-154739v5: 154739v5
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v5/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
