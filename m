Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB5ACCF9E0
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 23:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 901AE10E0B8;
	Fri, 24 Oct 2025 23:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h548sy76";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F5F10E0B8
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 23:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761349974; x=1792885974;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3dAQjEQzTs5zfLAJBvNeSi7EkEMLxJU8L8sWyJ4KyuI=;
 b=h548sy76mGp8XKKlKndphrlEitFTjltWq4eqDjUip23w/3iBsNaXo8zC
 ne1dQ4QO/9fnUXSvioEMCrC8gfKLh24Yb/xV8uAMpQ9lxbUKem/mGLv/N
 swlFzUCkqa1MmplZm+dAbTkMja6qNtSFnWwjpM6slKwUW6cWsstFG3eoM
 1qP3ReguxDVMftpx0nqXV6mw92lcfguQgS4qTPxt8w3ndT/ds2Bm4LYe4
 DZuxsaFRFDAiM+sMW6yKhx0fZHFLlT9RF/E6jjb9+6p/tgj9RifGZpKMH
 MUEB0N5HgI3SSva6vSrbv3bf6VMoRcqTVgNcPZSvmaM2Vsd+xH7ZWxH7U Q==;
X-CSE-ConnectionGUID: HovwuIQJRumqJj46uS/TsA==
X-CSE-MsgGUID: omZIZjiPTPCQxycx/e5Fyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66147428"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="66147428"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 16:52:53 -0700
X-CSE-ConnectionGUID: X31f0gX0RJqFCW6f8wdmYw==
X-CSE-MsgGUID: 23Xes+iwQsiREX9H5ETTsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="184915624"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 16:52:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 16:52:53 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 16:52:53 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 16:52:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8OjIySe3nRt44uVRzLejwusRxCRz2D7oG9ixCTxKrIW6C1hUsMdGUcsEySK88EwhgCAJKPMfNkL6knAF5oGG0FaOZHJSiZvxwEDALcJ2d6dAbFo8ATvaDGbYIdn1HNX4/ilta4yIWm1xoqX5zLUULtHiiUjfX7BTzt4teGNr+HO04IuEUv97eiluthEkMtBZoH4OixtihJyjjcAMwM/8ZcABi4I1Zp3tja/3/NILskY1Q8dWoQfrdbS74MdgV9dhAE0SZSQEJkknMU83fq+orlcXEpDHXzXK4IgnbSzxTwFjTctJMeiKmrGM8eB7RoKLuSlwCOJsPJxv/z6Y531rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muNLtvIP9YSmOJnU/ZJn983OF5ltU79/1vlbCvC4WKw=;
 b=fEYSwYbSua2TfD2B4FLTNK42yZLp6QuzJwxS5qxgwPwx8crG59DlQ5UbyxyoqVVGKiXJOtEuqZz1pSdsPdKvzeue8gn3KCvZKF9p77c+2GdkeZddl5gmJ2mtul78gpgQamMv6WchV4b5TLDGbQVt7jZE//RZ8piFjLp4H0D92ltXBFw+OBuaI6MbtOd5nQfgW58O1/yOWDcb+F++ox61byHoeEzXA2pJUOxV5fC7jFICt0frvYIavomLrIgRumpFI6c3n2BqAMeno1juC0OPaHdV7SFvNY9Z/rImHcQOtPKzFHUZoqTH7scZ6CsY2UW1qe51yY6nuYldpcjHL7cd4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA0PR11MB4685.namprd11.prod.outlook.com (2603:10b6:806:9e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Fri, 24 Oct
 2025 23:52:50 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 23:52:50 +0000
Date: Fri, 24 Oct 2025 16:52:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tapani =?iso-8859-1?Q?P=E4lli?= <tapani.palli@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tilak.tirumalesh.tangudu@intel.com>
Subject: Re: [PATCH] drm/xe/xe3: Apply wa_14024997852
Message-ID: <20251024235248.GN1207432@mdroper-desk1.amr.corp.intel.com>
References: <20251023044041.13731-1-tapani.palli@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251023044041.13731-1-tapani.palli@intel.com>
X-ClientProxiedBy: SJ0PR03CA0215.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::10) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA0PR11MB4685:EE_
X-MS-Office365-Filtering-Correlation-Id: c06719bc-de0c-4729-e1a0-08de135870f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?/7rqZU9EuxmI/3WOO+r9EaSt+DYeSGZt3a51/I7vWgQv3I3r7Ood84hj3W?=
 =?iso-8859-1?Q?YzxQTISW4xglwZKTWrLT9n8VO11n61nN0nSsx0qSPAqBgd9O6K8d668Eif?=
 =?iso-8859-1?Q?w5G334n2fTZeNhOHf5Teq+RYIIM/102tfSzikdMjiwkZY8w84XQO5HFbrX?=
 =?iso-8859-1?Q?4TJ/zoAeUVggWb47VX1F4nlG/OkE142wpa4kEXYUfvIrhAiakbSVUT6WUs?=
 =?iso-8859-1?Q?B1tcAz4Ahj6QuWOzzcUFUxrjEoZR33C1q/M94Otan59+CNRz4T3/Be+T0P?=
 =?iso-8859-1?Q?wHHf17eNDTYwCJB6Nk4EXmCHLaWYhuX76vhsWAS++n/xU2S4evjtRg4uFO?=
 =?iso-8859-1?Q?UvQYv+Af4KTbe665hRasxzbtFRVk9FwHiqAauu0rc97Cpl4kU+b2jVX0yY?=
 =?iso-8859-1?Q?sHDEMgq6DEfbX3dk7D+OPMiqWvTL5bqLQnjmSCfyyCVn7xoz3+hUDNqHny?=
 =?iso-8859-1?Q?JFT6TSMDZT+ZmViJZ++W9XsV1efYocLHc7sUwSVG7Tk9Px/14SfNO//BOw?=
 =?iso-8859-1?Q?FBEJ+KXqacD4RkeIa+r1kPKd7yR68ulm8dozEhbs1OJOk2M5ZbnMnYlJnZ?=
 =?iso-8859-1?Q?9vvFHzQZyOd2u22mNwPjD496CCv2c/CoieObpugZ9FrPe5AI677gBwa9bw?=
 =?iso-8859-1?Q?ipoO0l9i2ZuICB0bwI4h0qegYbIXaM3/L0VzQ4eEcgedQV2WKguUfMGvnO?=
 =?iso-8859-1?Q?ftEjSFGJ4Z4zcJFAKV4sRXsi19VTfMCauWmN7TXrteqGFiXBC2+1WcAo62?=
 =?iso-8859-1?Q?Ze0ATs9E9Y+/9ChfTqJ4zqPHgM+j4Z1/YTN1tod44mqk5Llw6ZqTO8SwqM?=
 =?iso-8859-1?Q?7XuZ/fFTfW7Ycv7q46NRr36wzXNTcQh2+C+QB59t2gpvz+R9owHlvdvgQt?=
 =?iso-8859-1?Q?h/Y1lYN2IaPj8fR9aK7X/MrKCAeUW5MrInE8DzNJth3CI8x/OXx0FwZhsN?=
 =?iso-8859-1?Q?NJCo8Gclj3GeWM8XYq2pm9lPSNNHu7IYqd2WAbB2OETu7xbHt2u4s/fsFS?=
 =?iso-8859-1?Q?l0waA6S1jArVsDzP1HfZV4UjrqERP/Mk8SQ0mkTZNXKXs6FdUAutACu8qC?=
 =?iso-8859-1?Q?ItloAilTXw983Stc3FdfKAsmxX+zsL44VBXyBr5eAwvXVv2lHd+TID2u6F?=
 =?iso-8859-1?Q?SGGTjWUsbIUwkWYt/dSaWAPwEfGM7YcDLheOgGnWIXVKN2JRQkOy036Xie?=
 =?iso-8859-1?Q?VPhc664e2le7oKfCMY30drswm0NMqBsCP2ILaENnPSpJgn5xBmB+myhYoP?=
 =?iso-8859-1?Q?K76u28bKbUT7oqPrtn0931gHsUU1r6vxYYdO6uoHC1aU+OVJvXVoi+dI91?=
 =?iso-8859-1?Q?LdB1zHnubCJY4ODd5LixhvttZsrpGH2Hz/Sm4+zeGh0rH1moAYh+KCEsBo?=
 =?iso-8859-1?Q?2qEzNLK3wr8zZuEOT7SrQVOTauTV+XdTBUSM5hVKQMkue3VbSxid7EBNQs?=
 =?iso-8859-1?Q?yBOT4RWYpxM+fkEfk5VS5kQWwww5sw0mZR5/ABJ8hyGWJYeyaiOWOV3Yiz?=
 =?iso-8859-1?Q?PmTAbLEA+NoCbM+vaI1qVO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?d4p0HJg8OUutWEif7o8BbPFmelQ5q+tFFG2uWnXR+t7iYeLx9yrkDoNmoK?=
 =?iso-8859-1?Q?oxMpbMzKasfDSLSMU+zdnqKH+yoyhlP324KqCWvsOqkaFIWbBtgqXmglOR?=
 =?iso-8859-1?Q?i9LUFdqH3KXE6WUtSyh4NeBvvOXlC8iyf7Ak7YCPxor6kUxHVmcM+Q8TZf?=
 =?iso-8859-1?Q?eBDw0+CBHMJasQmt1P6LTjkPHrXwkM1PbbnuUJ2vBvgbCPaUnID5EtAGF8?=
 =?iso-8859-1?Q?vyCMl05JDn1U2gR7WNaKvE6T0EsJMQMa2HzlQNRvR3P0Pu+E76j4yO1SFE?=
 =?iso-8859-1?Q?3FG2J9biTM7uKWs9nxpe/AE5sSt/z/e2mwXvS+Bw5hjttTDKAAWPWG5bQi?=
 =?iso-8859-1?Q?Y1Bv4IZEUioFoZ60LJ2FwlIX/c/12w0ftz03Hr2Sm8c7vLrBvbx5vuQuOi?=
 =?iso-8859-1?Q?3NJFM20EIyrufVPIHfvnobGfPnorXh4Zoz9hHdOhh2hrhG+wBu+f0u1fyu?=
 =?iso-8859-1?Q?i0J3vzkTe30vDVbNwNKclxZW3/PL0+xVO2Iepmz8sx98m5EkXVVQ6jKPPy?=
 =?iso-8859-1?Q?aNkxTjpievtEOfTVXo5eFsXFrAOHNYqUqmjUeJgz3rdV2dJhHEDPCGSJ9W?=
 =?iso-8859-1?Q?RamYesiSFgahej3UxETY3QByLBbdt41m+uOnSgUkj7igUr9s09/rSndOnY?=
 =?iso-8859-1?Q?XS2+6hrKwXjR5rNNtkxw0OQoDYYOmZG4gcvV/pzMvsQ+6H2i6x8sUshOHo?=
 =?iso-8859-1?Q?uMqMr+JazuKCjuzlDTWdY78jcmIPJrqqG+qEtxh/ACKzopGeq5aweTV4P6?=
 =?iso-8859-1?Q?TcTVomrGUKu8HBHUlWJ9yNQtuzkWeLa9pRrl1cZVg1C2reXnMdPKalYj3n?=
 =?iso-8859-1?Q?HxvuZn4eWOT1qthyeW9vnYxC/32vak+77b1vvb1rrHahHyWEb0hofbnTq8?=
 =?iso-8859-1?Q?096wNWrwQzQBH2vlpWzns8ESwQn2Rk7r+/TXsaxNFhd0koK6l2NjMWaNfg?=
 =?iso-8859-1?Q?nwuD2ZG4LA9d/xe0moiDNk803rYMrGUm/Pkw+2ifJa6lge+Ofil+pQrsPh?=
 =?iso-8859-1?Q?H8chYFkkC6nDtEhrRCwhXn9pEKxqpuS7CPkULT+nfPvVvKO/nGYhmml/EX?=
 =?iso-8859-1?Q?xv0rszbDUPlR2OEDJF3k//XTsKJS4kwrzAU4wJH4XF0OIMCOGhWTzbIRfC?=
 =?iso-8859-1?Q?K0AfpOXvhJ2EY7mdYPOQOcIV7Je7o2I4dPMXEsGi9zesxR+AN0YrgeH8k4?=
 =?iso-8859-1?Q?E6TdLNVKLhqhIWpzAGfGUgBeCPOXBfEqirz8OOy+hA2bZm0ii1SUAhYiRH?=
 =?iso-8859-1?Q?oY6uQuFv2Zwq7JQzjOyxHfrXnd4913Tj0an3uGLn+ObJ2wCWBhqN+dTtRC?=
 =?iso-8859-1?Q?MkWmin1xy8K4qcsZDE1bPCL8iah51c+LMLHmbIq20w5pBlc2wHW9REm1dG?=
 =?iso-8859-1?Q?DCzbuNh35IPZ0lhMr8mvc3GF0jmXuWR6auOFN31sYb253PiWqlBgjIRlAi?=
 =?iso-8859-1?Q?CF8GO/qH+PFSE4TvG1J0wtzArxMaQlO8di8uZDtm+lvCIdpaLGvTNh73JB?=
 =?iso-8859-1?Q?lkZmKZi0x6nYh/p0PRFHS0TbXbx9K1sfUEk0ti4CxOLjm7p9rE4iwuLN9q?=
 =?iso-8859-1?Q?+OJm4qwqmbF5E9ZtUSYMFtkEHD0rrf50RljU5gAwHF9TFi7sH3veyTtV1P?=
 =?iso-8859-1?Q?W6QH8iyn8ZRokLyqQ2LrFP6xPjajvHsekhR3hcWiKUiv/brROD+48SjA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c06719bc-de0c-4729-e1a0-08de135870f5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 23:52:50.7884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQn5NrscEXj7K3X4zV+kpGmXjM6CboihJK67hPReEKipbPk+euFPo6HMYnqCldDj8HFclCR3qOPkSnPoQoswR8H/xtIwlpYAFiIq27r9K3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4685
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

On Thu, Oct 23, 2025 at 07:40:41AM +0300, Tapani Pälli wrote:
> Whitelist registers needed for userspace to control autostrip on xe3.
> 
> Signed-off-by: Tapani Pälli <tapani.palli@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_reg_whitelist.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index 690bc327a363..fab56673153b 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -89,6 +89,13 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>  				   RING_FORCE_TO_NONPRIV_ACCESS_RD |
>  				   RING_FORCE_TO_NONPRIV_RANGE_4))
>  	},
> +	{ XE_RTP_NAME("14024997852"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(3500), ENGINE_CLASS(RENDER)),

We don't have any platforms with an IP version of exactly 35.00.  If you
were trying to whitelist this for everything Xe3p and beyond, you could
use GRAPHICS_VERSION_RANGE with an undefined upper bound, but generally
we avoid doing that for whitelists because future platforms/IPs might
not need this workaround anymore, but some new setting with security
implications could get added to the register in the future and we
wouldn't want to accidentally give userspace access on those future
platforms due to an unbounded range on the whitelist entry.

The only Xe3p platform we have on drm-tip at the moment is Xe3p_XPC
(version 35.11), but as far as I can see, Wa_14024997852 doesn't apply
there (and in fact that IP doesn't even have a render engine).  This
workaround _does_ apply to various Xe3 platform though (with versions
ranging from 30.00 to 30.05) and we don't seem to have those whitelisted
in the KMD yet.  Your patch here has an "xe3" prefix, so are those the
versions you actually intended to target?


Matt

> +	  XE_RTP_ACTIONS(WHITELIST(FF_MODE,
> +				   RING_FORCE_TO_NONPRIV_ACCESS_RW),
> +			 WHITELIST(VFLSKPD,
> +				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
> +	},
>  };
>  
>  static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
