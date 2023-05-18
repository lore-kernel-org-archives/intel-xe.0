Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C23EC77B73
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 23:20:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C4210E580;
	Thu, 18 May 2023 23:20:23 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24F410E580
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 23:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684452020; x=1715988020;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eO8XZY6pf79iPcmi9/MzZsDEgSPBwrKyURcxrNzsxCc=;
 b=J3Qc4KLyeeFge0naEWbcd1ngMH9cC8hkxAwN/u6s0dpDnnP7jlbGgi62
 09YKRATT3xxcLDcz6SnFnKTOpEmgJv4Ji5Rgq3UP/Ns2FQojPCX4rdObr
 q+ePGZojKkeFS0BezznU0LbYM0Jn8FMV6dkfmqB7sRlyu9YuWmI1EiDaf
 C5t1/eBL6x3XHpCLXKtlH+GnvVYRKDsDT9+SPYK8XIGMhs13g8y2ebYna
 x24OTvNGXMIbuagTcvaEDN1JU1eYKM1RZ45XzYm+NyZyRDhgS2SicHzLv
 52/SynOR7+JKBWBssakL7tlza11mCJDgxJvoj6QffxWinoaFtt1xeC/0a g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="354567629"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="354567629"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 16:20:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="1032378177"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="1032378177"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 18 May 2023 16:20:19 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 16:20:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 18 May 2023 16:20:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 18 May 2023 16:20:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIO5984lJRZiGGIdf3r1wJAfjWTD+b0yJMbkOGbVPhs6NP2jmNQKvL2ipZtKKQLV/x3AnnnQgy85nUOpds80KLn6Uhuk+6gFHogstm/0n31/i9Ikg5lgL+OComJNEMWkednFTFD+TivDoe4eVoNLSRIZN0f2ngm44wyz5zZmw04XbEModIXWjrdCru7GF975TBEO5kDP80cUXEXKPKowIonTjD/2p/AkBD5gFzHK5Dabbp+kbv2VOIYca43CrZbrUSpH6cdKkFZyDFMvKCAuO1ife5S/d2ZVKMxflHLibEpJF/6ikaFhxU4KSzC45dtytjNnfzq+vKI8Txp4PCFK3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4ug8/6z32M+YlKSZ/GShqLVjD8WDfcpTF8KnF7rVH0=;
 b=nqTO1hmnccDsVGEPi/vRjkm6a2F9Q/Bes1lCMAFK2yBWhrLNmOinsWAgw73eclc4FNvkovNa0tGQvZhJRyfMVSaodqIneCld0Myr/sgbuJelLn2ys7nWrLO6drUV/vN6HTNA6bCv++d3Pg6ain6/uNebq3aRUu//7pPjGti6fxdnNwacV2FUGwe2VOeBNSefM9x1ang4RSrLa2K3WFE6L6urDMOmUoI2PnBzPOzxH7F6U6U9b3AEL0d376grat2mJ0mr6iiBVT8TIb8i8Y2OYWdzfgszyDNRbqrkBLTJc0B4Sax1+WeWkgbUNSU1gjA4cGvmiqXGBeGfWgWaFpj68g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA1PR11MB7812.namprd11.prod.outlook.com (2603:10b6:208:3f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 23:20:16 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 23:20:16 +0000
Date: Thu, 18 May 2023 16:20:13 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230518232013.GZ6250@mdroper-desk1.amr.corp.intel.com>
References: <20230518223937.GX6250@mdroper-desk1.amr.corp.intel.com>
 <20230518230221.3571188-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230518230221.3571188-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::13) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA1PR11MB7812:EE_
X-MS-Office365-Filtering-Correlation-Id: b376bab1-06ce-4cc8-2849-08db57f67018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qc1aiYBrRbatX8vN0RnsiHP9DtAtNQ+DsuyF41IVYkUL+y0q2IMRvtA77/w6lENUMGmZal0Hap1R+e+9EidYdey8/jq/6iQMSdjyoT03sGIR/tCzMXwO4Xn8q5QFmRwPdKl1GK2mn2OSenFdqBrO2Z122V1knVT5KQNaFwrmw61SH1/jCILSgcJ1mwCLc2oBJSDzrbvRFBOQDTNNehDMM94h7FNadyP6hLgXv6awfXPaLfpv5aLgIjsUP6Rm/L0kfHIlwA9DEjRjy5C/6epvbVKGmoLpj8B3b+LK5UwekfBZcnBRJ96iilbB1nYx9kHw2mrXJ3Z6kKyEKojg1R0c4UroYQpyHZ/71iR2UqUNNi514rkHI1p9EEu7bFZZmb+lWLtwNWHckADGfPYSE7Y5+Z8/0iyX/Hz/Jt7qI3f9AxFH3ofdAFvu8QPaoyMDk5SoPmbTdtQnMG3NEtToJL5wVTNS50bQK8kwr4LN2JIPsMn/vMetPKBJXBbX3hrbzSfLJFp17559JDPWEJ8PFglWZ9de6daPuA1D99U+T/6HTQRX1Ue+46NKZYh6tuuhC58H
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199021)(26005)(6512007)(6506007)(1076003)(83380400001)(33656002)(86362001)(186003)(38100700002)(82960400001)(6486002)(478600001)(6636002)(316002)(2906002)(4326008)(6862004)(8936002)(8676002)(41300700001)(5660300002)(66476007)(66946007)(66556008)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pO1uXgPj/YAGDcQVGiLtdyvTCwRqOzVHITeaUllbsBbhULCKJE1d2PfXDLt1?=
 =?us-ascii?Q?wwKXWL4mM2sLMiBl6I+XuioTNFDI808hU/ksL6amN6u1DyNZYzBiL22lHoqn?=
 =?us-ascii?Q?CiDRUxVLdB+UTI9lO8K6eV096W3bOy4nfYIVOzhtuFKOpy2rPuoE55ph3X/e?=
 =?us-ascii?Q?LrzwzxTC6K/jzQeW4zKJ7ece1bLf4qftdCPpwa1RP0rK24wQvYXFf2FfYs2b?=
 =?us-ascii?Q?FICsAUm1M1Pku+JfG0UU045VSiq8jU/KrPcrMgCvxcK18fUaaW9gXdLbE4HN?=
 =?us-ascii?Q?zgjxWtoCA0BVOLwndCr1WNQtd3qtVHwa5HwbVQux/IEwr38CzNvjlY8VVz4n?=
 =?us-ascii?Q?uYVU7Yp/Z1Ysdo6u1YteZ88ld4goqjqg9R7Rw1zChYuEdzZfPBiaprjbvtCY?=
 =?us-ascii?Q?u0J9aKTtORyALfn1Utff47nTuTbuyPDD23AzqPJ9OlHsJf25bPrlSu+iJLhZ?=
 =?us-ascii?Q?mmxzCyYMQUsBl3wjPI/HFAfe8TEZPMCuFL3rrjMRqSSMp7Eh+0ixWKz+E8TZ?=
 =?us-ascii?Q?7f8WTRPSypE5kDwhN4UTJYmRH0Wub0vLSYo3t8R9wV1uyfHErRmTxVDYzlgg?=
 =?us-ascii?Q?3AkKnE2qNiDSI3HOZrvT04roXdyMa5/D2t135JqRz7yZwLrfasg13lq5c6Ur?=
 =?us-ascii?Q?FD7Kgm540UjadpihDFaVLlemLNhmfKvuzoYxOYHgi9obdvJT6ANbu0j9tJPO?=
 =?us-ascii?Q?QLeXVhF3dUjvQjoILFyKIMn79t122shlHgV0uRTkSRfsPSSpq+5v9+CDkSh8?=
 =?us-ascii?Q?bmBHUSW1JYqWK8KEjOji/drLj9GKEqwtBpw+TktRlfjGWzlhY5fUSe3UtCrk?=
 =?us-ascii?Q?1i7D2v7OCrqRxYzou3KUWraPxb7uuR+P2TGj82iBR0Ow/1bc9K4RnCALkXsP?=
 =?us-ascii?Q?ijtRMY26AKHVK+vpJDbOIN6DpbSEcmTdiW3kA3xZx9V1zK6N7UnYcWxwMOkA?=
 =?us-ascii?Q?2jt/AccZsl2FRawVF3TwzRuAqnB5QEqtTqv3uTvWFaIwwjEPRein5Eo/Z0di?=
 =?us-ascii?Q?/TcM4ec4Y3ihRhAnSSXFO64HHWvs0B22WUe0xFcblvNmRz9Ga9L17L13dBaA?=
 =?us-ascii?Q?m1eMtO8qgevAik0bBNMl/ieXldk1OpfAGN1BxQZP4XfXO7XmNUozWEFUJHFX?=
 =?us-ascii?Q?SHK2iFrRm6tK5kqtYBnqBPvhufuHwxODOhc1Q5MugIO/BCNebheKDzEqEf1N?=
 =?us-ascii?Q?cC6/2PwQdnT6DAP2ef7VYVnJiAAGOTyMjYQQ5Trsh60BMhJefLRBpu9v3Glv?=
 =?us-ascii?Q?roZyE61N3MUo+YluWju/albqM9yqt5CnYK3obG94qz7YUmXuUoIUDahuF9mv?=
 =?us-ascii?Q?IiZZ+7Y7xLZtzicFSOPHbwX5h7K8QqniEbpkFwrgsb27kV7api2Tt5Pz+G1M?=
 =?us-ascii?Q?HVbyczNTyJ29afPOxsJkdEz3q0KoqQOcNLPwSsWc9TGfO/HMdbCxNgwku3yj?=
 =?us-ascii?Q?lKDsp6v0CHh05xbVdZdrBxxrn/GeiVWwD55mLtdJ88HZEKOsK2kPgwWmB/V2?=
 =?us-ascii?Q?S+/fOFirQmh78HbP/3dXFa3MpbqTVc9C9m7ehxRrzSq3cyiP/xhf2t4jLQZm?=
 =?us-ascii?Q?ad3/8nBAKr2GpmVcflGfQXEoAarY2FM0+mEoM4OZn6c8fWJDtL8JKKLKMmI4?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b376bab1-06ce-4cc8-2849-08db57f67018
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 23:20:16.3006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KyZrQi/Mn+XtfK+14eIMcUfuwQTYWU6ksPb9lTSqi6GrSS+R+Vy39ue9dZ4fABz0X3iMBFnOA4RF/L9K8yMQpXcOUQ1MLOGvK9CMO634yJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7812
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] fixup! drm/xe/rtp: Improve magic macros
 for RTP tables
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 18, 2023 at 04:02:22PM -0700, Lucas De Marchi wrote:
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_rtp.h | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index 8bc946694bfc..8a89ad45589a 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -262,11 +262,10 @@ struct xe_reg_sr;
>  
>  /**
>   * XE_RTP_ENTRY_FLAG - Helper to add multiple flags to a struct xe_rtp_entry
> - * @f1_: Last part of a ``XE_RTP_ENTRY_FLAG_*``
> - * @...: Additional flags, defined like @f1_
> + * @...: Entry flags, without the ``XE_RTP_ENTRY_FLAG_`` prefix
>   *
> - * Helper to automatically add a ``XE_RTP_ENTRY_FLAG_`` prefix to @f1_ so it can
> - * be easily used to define struct xe_rtp_action entries. Example:
> + * Helper to automatically add a ``XE_RTP_ENTRY_FLAG_`` prefix to the flags
> + * when defining struct xe_rtp_entry entries. Example:
>   *
>   * .. code-block:: c
>   *
> @@ -285,11 +284,10 @@ struct xe_reg_sr;
>  
>  /**
>   * XE_RTP_ACTION_FLAG - Helper to add multiple flags to a struct xe_rtp_action
> - * @f1_: Last part of a ``XE_RTP_ENTRY_*``
> - * @...: Additional flags, defined like @f1_
> + * @...: Action flags, without the ``XE_RTP_ACTION_FLAG_`` prefix
>   *
> - * Helper to automatically add a ``XE_RTP_ACTION_FLAG_`` prefix to @f1_ so it
> - * can be easily used to define struct xe_rtp_action entries. Example:
> + * Helper to automatically add a ``XE_RTP_ACTION_FLAG_`` prefix to the flags
> + * when defining struct xe_rtp_action entries. Example:
>   *
>   * .. code-block:: c
>   *
> @@ -308,8 +306,7 @@ struct xe_reg_sr;
>  
>  /**
>   * XE_RTP_RULES - Helper to set multiple rules to a struct xe_rtp_entry entry
> - * @r1: Last part of XE_RTP_MATCH_*
> - * @...: Additional rules, defined like @r1
> + * @...: Rules
>   *
>   * At least one rule is needed and up to 4 are supported. Multiple rules are
>   * AND'ed together, i.e. all the rules must evaluate to true for the entry to
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
