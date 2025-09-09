Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B94CAC583
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 14:24:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4686897F6;
	Tue,  9 Sep 2025 14:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jYAbjp/R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36509897F6
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 14:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757427876; x=1788963876;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8ubWL8oEi5T/gqqvKBVvQ0eIgLYdFeS2AQvOkiy94y4=;
 b=jYAbjp/RyrCiBuekfmaJQ8PMFAgaRadNfnXqB27w8IHDc1pWYaLeKC8T
 I/XfMn6jP4eJqhAIFjK9idtFCQRNv0N0ExeLgqcqPHCgfeueTbtzwh6Xy
 7t3pihvt09IgUpgxWtp0aTbaMWYHAJ743hDTAL2K8dcFpy2jBeu8NafKw
 pgl3qJ74o1HjgFU4ruS/4lBfIdp6KP1st7PrkVTyHofJuEOIszX3g1+Hx
 HYzX6x9tJTweK6iEqF0LkHwtt0OQLxrurxYh7uWAFpCBoLZsDM4Mpd73Q
 sQHD0yTBL774Nyg9TNbh9jS9j1XeAmPo3+ip3QEpXrAKHoN4Bvi4BfNZj Q==;
X-CSE-ConnectionGUID: 2eKKrQBiTgOGDP7FQ755pw==
X-CSE-MsgGUID: QN/U6ecNS9G238qxAqa6iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="58755345"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="58755345"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 07:24:36 -0700
X-CSE-ConnectionGUID: 9L1UlGFlQfy5rQzUWiu0GA==
X-CSE-MsgGUID: MQbVdwJWRk6CAVpCCM1TGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="177390431"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 07:24:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 07:24:34 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 07:24:34 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.77)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 07:24:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wdesYRiKL1JWdRY8YjrjlYrbPO4WNKoCXktI3uy84EyFTKMAl5WP4N3aU4PLF5XPN8puRfoAwkpuSZ4ZDvF1yLFKHfURCK2KqKf042p4O1ptD44o7PWLZINeV5LmLiAFPIT6wNf4PxLYA5slokuED+SNiZVDSB+dJysEDhrupV8nynWGcS/8MWdyf+Y9a+Dag2k/1vkiL1nQZo17NiH7HG3U534Cp0UmGmBnksxQiiJxCJpCGek79RaRY3qAAHSJ1HyYRjQCic7Q7W7r/0ordItxGWNeJ6Awhy46oNldZPIHYV+m7lLnU912ln9+n4+TWy37odE54v1+kpf+Mne0Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Wl1asLVB56iix/LBmkT6yLZAoVoKRmLstx8UVNMWZw=;
 b=tafWL+akavvSZrPZTUcnqsRUxCPyUl6/qZ5DoPF2MoeJ1+pWgFXa/nVvj0hZVOx3t1uCHiKk/GK7xT+qFwTVd3xKUagkJQ5/yAaHf6Bi1A9IzkqbP2gGaZxS9LuWyiGLkY99mkBQfPwjf0prISqG29H5GA2cd0L7S2AYn6tURoHrn5T4EjoRw7WN+sGkN3zn1mmA6vsELAhZBQ+kPyyIEDiVYAe4mgKJAVJtuvATRwzzhccLpKMCLKP1GY9jzJJdJVc7hX+d1dpBrpDx1eYBHchxAs8rqKPBQfPlV6m1ZTwP5txv2C32rpNtHkDaRM6QBjLGxbxCHLeWyqwUOnvBCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SN7PR11MB8041.namprd11.prod.outlook.com (2603:10b6:806:2ec::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 14:24:32 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 14:24:32 +0000
Date: Tue, 9 Sep 2025 10:24:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jeevaka.badrappan@intel.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU frequency tracepoint at DRM level
Message-ID: <aMA4nSKHJ8fJQ1yY@intel.com>
References: <20250908125633.2680617-1-s.sebinraj@intel.com>
 <20250908125633.2680617-2-s.sebinraj@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250908125633.2680617-2-s.sebinraj@intel.com>
X-ClientProxiedBy: BY3PR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::28) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SN7PR11MB8041:EE_
X-MS-Office365-Filtering-Correlation-Id: ebdc7cc3-9101-4feb-9218-08ddefac981e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Jx5LyYV70FBl2jFb372pzNZ0g9Fqs6NcBEnln4w8RfJPGPz7cVIGxj8faL1/?=
 =?us-ascii?Q?48ffSeqJyrvS6XCuoKruMwv8p/wRYNrGtOHk/3OJf3PV8ectrb382wdM80s/?=
 =?us-ascii?Q?BHMqYl9FLLfHIe1TIyX5ycXIxuivPbnf2z/BpoJSzh72E0cimbOevDcIb7XS?=
 =?us-ascii?Q?9vYBX2F5IBDQyIHqGMtAdGYKf5rSU+tHyC0IFnlwOM86wo8gsVd3V9wYPZvZ?=
 =?us-ascii?Q?mIkn9yidr8dYYqG/AglWDTtveIYDgXn0IIm1u/Oa9WzYBgOFE6lD9l2F0k02?=
 =?us-ascii?Q?kR51YZKmghCFu3aMpn0cnT18jOJbDYDFb/a/uvavbHEdBAzOQmrGxvugFYE4?=
 =?us-ascii?Q?aW8Nmt7hnYZ76VyR3URLTfNYT+6b+ycG8L5BK1isYjA4Ns4rqMgcGrmdgNcf?=
 =?us-ascii?Q?0c+L8cZ0kHY4fkHP6MFSrKdy9IdjYIKXc3pfpijr1mmT024SO7TH1hs7S21R?=
 =?us-ascii?Q?1ZDh5NZnKWANuLk9kZsMwGYGVHPFSZChn2p6nQBXhnLVoxWwrImQJ4+9Gq7z?=
 =?us-ascii?Q?YeySOZWMmxIhYgUTYE3sCdKKmwv/ixSLfy0SPG0rZHf1LJ/bZGMHfemM6wLb?=
 =?us-ascii?Q?plToJjpQMp2yLt0VS/ZS0i7Ut5LkQ3ASUzRCQhFJ+dcTo3+AIefkpH96SjlA?=
 =?us-ascii?Q?8HwX9atSMCRrVTa/V1B3X5ncW9PeoGnjRg1jznNSSh4M/Cn2xraed6juBDfB?=
 =?us-ascii?Q?YwLfYN7H/ik9BTrjC1ZB8ykdU6uQkT6cSXQO4ZsXLtcPJpvacwfLVP21aB05?=
 =?us-ascii?Q?NJ7tZAcDBXYNQbyoPcsQ70DMTei4yzM9sc5bd1bolfvDHdybW9QrJmt7qcne?=
 =?us-ascii?Q?bbL23eXTG7YatGUUUnzcGJoRSYV6JsvTtvJ7J4B/KNmL/JaTgG3s4oto1Flj?=
 =?us-ascii?Q?c9Dx1iN9HBf/mMerAj4cH1lEr2dliKV7hW7zF9mdWx3/yW6RJUIGiSBjZYXM?=
 =?us-ascii?Q?iyNlcaejoBbRlmubX3Hs6o9MbUZlnjg9XDNsxAKirKIV2UpECP8kzOdcLBVf?=
 =?us-ascii?Q?687S0JJcvxt2Fa40vM/XEh1FxodSJOG9So8cjVAaXsj7iNFZbYkQjTKS5Wtj?=
 =?us-ascii?Q?s3LJA60p5G4QmBdokiWJ2dyc70Rv+RrOmOZY1V9vCmOXagCYR8icMHnqVWam?=
 =?us-ascii?Q?wvVrHTRcRXcWE0c7U8LimdO0sX/UdYhtML/LAMutShWLqn+yUFcfCXDP8cd1?=
 =?us-ascii?Q?cUHKlElbYr2WwpFOYlE1VFI2rP0/O/0JZn+etaXoNxn4NfSwLJ3TIY196MKE?=
 =?us-ascii?Q?XAeCV+B3wnYjfHRylpBx0jd5BjxbKwPfcL3+wFjLpoj+QVRi5HNNqG1GeUU7?=
 =?us-ascii?Q?VFeA09Yvn2pC7621m1o3sNxk1VPu77jZqoTY7Fe8dk2BMWsA/7aLeJz9y/vn?=
 =?us-ascii?Q?Dtp1O3sNSVNG/w24nrl4h1iENopIsZvaRL2OKtHVj4nQLNaYA4voHN79/C8m?=
 =?us-ascii?Q?19VGNTg7At0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?foWvWfzP9nVRD19Xd3ynGiJnsdm5ZztfahY8zlmqDXRfbiz9tfseb29f9s5a?=
 =?us-ascii?Q?/FSo5P5wcFYiu0amJgDYeR3/PSMabeWGCOEr8sv3AAffQGLxbYU+6m2OyD2r?=
 =?us-ascii?Q?jonv01zC1kquH1QSiDf2Iiu6a8nlZffI49mtqkhs1Y56BKGZPi92kVpQ+gRK?=
 =?us-ascii?Q?x/r3HOob8vT4WXHKln7m2QO4rDc7cpFpqn7NaXVRSy4OjKZWNht4x045gznR?=
 =?us-ascii?Q?qDZ1tIpki0+obmu8RGy1FCs01V2OTMKf633hqci9qoiliNyPuq2DxvkH6IvH?=
 =?us-ascii?Q?eeD2n09ZncAEq6rKuWlEdarmIcVlzDIIvUUaT7in/5GoeylQR8ixGVHVCkrX?=
 =?us-ascii?Q?+dLDU4YuMyzyugJYoZs18qgQPcwX2ZWxSop4fnYjGp4AxUwNoH6jpoCKLH7S?=
 =?us-ascii?Q?Q+DEPpJgOVpKEoabJn81AZoQVz33HgHhCgf2F0ExhSmVhU7C3HWCvFSiJJeO?=
 =?us-ascii?Q?ZPdXyhgPdzwTTXQC7JfD8yz0KfjpQdPSt10mLVgeZ1mB4QOJbozS9Beyl9Mt?=
 =?us-ascii?Q?kccg4aVbcYj88MrZl6k9WLr+xJ2dE2cSVDJB0ypqKsTn61PbmjtVfOqbGqWr?=
 =?us-ascii?Q?sv68/3mRYpiMzBR8AG+kVLX3GTZAgL3Dvg8GsOBq5fcLEuZY1hcwCZxx9DyC?=
 =?us-ascii?Q?mi7JGbMS1bJh0SYBljiFgRteYnPmL0mx7TW2PCmwmJL40MQQ6dCB3IkWB+Je?=
 =?us-ascii?Q?OMB4mmB1xUHNsefIXbDEYlupFidyCEfk/LFn5g3uG+MTA0xLlZgxELMPybD8?=
 =?us-ascii?Q?n9aFHT95dYGHkDyoeiNo3sZ00s1vu1ShngKvMmxdfnHBnh7iA8ZLgwBsjmqF?=
 =?us-ascii?Q?6rhVQSHVWo1O4ywq5bYGGMmXUJVKYJYMsQn89kNywgbVP4sKFd/E/f2KGAkx?=
 =?us-ascii?Q?HbEOEtRstdB5Jx5W1yttoD19ZHMgHA5m0FLEsL9uviI9eDU1YCmOXRT5PPEG?=
 =?us-ascii?Q?asbOMlXEVh/3rDcvj0Sr9sR7r4wciO6xjMVbEZ/vFpCa/1vlVgGpuwOz34tQ?=
 =?us-ascii?Q?VuXBHXuEIeM8jmLOIfRPWIw3tjFjCVtyXYRmsWhLUgmFiH6anpqWiADIvquJ?=
 =?us-ascii?Q?EPm08/pyVs6cpqA6BMr1l5y1F3o7R5MJKcuXYd4yJ46mmsq1goZc9R8MTUIh?=
 =?us-ascii?Q?hGwr9ljPu47xLd8e0UiHkwgOpw+fu4XF3Exx5MWAtUTvb1CqeGrnMAf6usE8?=
 =?us-ascii?Q?Xsgw75jgZIMT2QV56+5qMJGuOliJGVZYpUgi7Fa/Y/65XnZXZ0041iqo/F1n?=
 =?us-ascii?Q?UgIwvLX6aIGJDC+aQYqJCJvPV40cAalUJR/nsa8GtYdI9Q9I6YY3wNkwihd7?=
 =?us-ascii?Q?k/yG2Vo6Qh70Uz//pnMnZr+7vE4nocUmC3muOid83yDjWKQKeW3u5rDcxBwJ?=
 =?us-ascii?Q?wrVkVGaQai0R5jWdN/FTmeHvEIA3BAzHLukSH+s8KN3enECdw9qgvHtx3AMz?=
 =?us-ascii?Q?ljo5X0R9NvTNmfqQs4K4QTcC20LrlURXpdN2y5fGdltaTmFLNp3+qYgQzCcB?=
 =?us-ascii?Q?vs0uzNBBHcCnICAM4CuwGlrUo3BondfaDlgdhBSTl2US9y8j9KeebORSUSg1?=
 =?us-ascii?Q?7RcGDGd+0mnINbvWq7gqW1QYQgsuWnjgIxhfua+VPmVI3k7rJ1rhLmgWtwa3?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebdc7cc3-9101-4feb-9218-08ddefac981e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 14:24:32.4963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLF6S0Gi4dHCL/Ul9WKFCKlGqTINmoH0ABSBoVVgOJ8a8Nae+/h5iOy1gq+uZcCNhtiys84vkRuzKX68XFGoFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8041
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

On Mon, Sep 08, 2025 at 06:26:32PM +0530, S Sebinraj wrote:
> Add a GPU frequency tracepoint at the DRM subsystem level
> 
> The implementation includes:
> - DRM-level tracepoint exposed at /sys/kernel/debug/tracing/events/power/gpu_frequency/
> - CONFIG_DRM_GPU_FREQUENCY_TRACE Kconfig option (default=n)
> 
> The tracepoint follows kernel tracing and provides kHz frequency
> values with GPU identification for power analysis and
> performance monitoring tools.
> 
> The tracepoint is only active when CONFIG_DRM_GPU_FREQUENCY_TRACE=y
> and can be integrated by GPU drivers for frequency reporting.

This needs to be sent to dri-devel@lists.freedesktop.org with
drm maintainers in cc.

> 
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  drivers/gpu/drm/Kconfig                   | 11 ++++++
>  drivers/gpu/drm/Makefile                  |  1 +
>  drivers/gpu/drm/drm_gpu_frequency_trace.c | 16 ++++++++
>  drivers/gpu/drm/drm_gpu_frequency_trace.h | 47 +++++++++++++++++++++++
>  4 files changed, 75 insertions(+)
>  create mode 100644 drivers/gpu/drm/drm_gpu_frequency_trace.c
>  create mode 100644 drivers/gpu/drm/drm_gpu_frequency_trace.h
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index f7ea8e895c0c..975cc7b2581d 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -53,6 +53,17 @@ config DRM_DRAW
>  	bool
>  	depends on DRM
>  
> +config DRM_GPU_FREQUENCY_TRACE
> +	bool "Enable GPU frequency tracepoints"
> +	depends on DRM && TRACEPOINTS
> +	default n
> +	help
> +	  Enable GPU frequency tracepoints in the power trace subsystem.
> +	  This provides kernel tracing support for GPU frequency changes
> +	  that will be exposed at /sys/kernel/debug/tracing/events/power/gpu_frequency/.
> +
> +	  If unsure, say N.
> +
>  config DRM_PANIC
>  	bool "Display a user-friendly message when a kernel panic occurs"
>  	depends on DRM
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 4dafbdc8f86a..12c81b6a750d 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -77,6 +77,7 @@ drm-$(CONFIG_DRM_CLIENT) += \
>  	drm_client.o \
>  	drm_client_event.o \
>  	drm_client_modeset.o
> +drm-$(CONFIG_DRM_GPU_FREQUENCY_TRACE) += drm_gpu_frequency_trace.o
>  drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
>  drm-$(CONFIG_COMPAT) += drm_ioc32.o
>  drm-$(CONFIG_DRM_PANEL) += drm_panel.o
> diff --git a/drivers/gpu/drm/drm_gpu_frequency_trace.c b/drivers/gpu/drm/drm_gpu_frequency_trace.c
> new file mode 100644
> index 000000000000..b5fa5134226d
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_gpu_frequency_trace.c
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * GPU frequency trace points for DRM subsystem
> + *
> + * This provides GPU frequency tracing support that will be exposed at:
> + * /sys/kernel/debug/tracing/events/power/gpu_frequency/
> + */
> +
> +#ifdef CONFIG_DRM_GPU_FREQUENCY_TRACE
> +
> +#define CREATE_TRACE_POINTS
> +#include "drm_gpu_frequency_trace.h"
> +
> +EXPORT_TRACEPOINT_SYMBOL_GPL(gpu_frequency);
> +
> +#endif /* CONFIG_DRM_GPU_FREQUENCY_TRACE */
> diff --git a/drivers/gpu/drm/drm_gpu_frequency_trace.h b/drivers/gpu/drm/drm_gpu_frequency_trace.h
> new file mode 100644
> index 000000000000..cf6337847b3a
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_gpu_frequency_trace.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#if !defined(_GPU_FREQUENCY_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _GPU_FREQUENCY_TRACE_H
> +
> +#include <linux/tracepoint.h>
> +
> +#ifdef CONFIG_DRM_GPU_FREQUENCY_TRACE
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM power
> +#define TRACE_INCLUDE_FILE drm_gpu_frequency_trace
> +
> +/*
> + * Tracepoint for GPU frequency changes
> + * This tracepoint is exposed at /sys/kernel/debug/tracing/events/power/gpu_frequency
> + *
> + * location: /sys/kernel/debug/tracing/events/power/gpu_frequency
> + * format: {unsigned int state, unsigned int gpu_id}
> + * where state holds the frequency(in KHz) and the gpu_id holds the GPU clock domain.
> + */
> +TRACE_EVENT(gpu_frequency,
> +	    TP_PROTO(unsigned int state, unsigned int gpu_id),
> +	    TP_ARGS(state, gpu_id),
> +	    TP_STRUCT__entry(
> +		    __field(unsigned int, state)
> +		    __field(unsigned int, gpu_id)
> +		    ),
> +	    TP_fast_assign(
> +		    __entry->state = state;
> +		    __entry->gpu_id = gpu_id;
> +		    ),
> +	    TP_printk("state=%u gpu_id=%u", __entry->state, __entry->gpu_id)
> +);
> +
> +#else /* !CONFIG_DRM_GPU_FREQUENCY_TRACE */
> +
> +static inline void trace_gpu_frequency(unsigned int state, unsigned int gpu_id) { }
> +
> +#endif /* CONFIG_DRM_GPU_FREQUENCY_TRACE */
> +
> +#endif /* _GPU_FREQUENCY_TRACE_H */
> +
> +#ifdef CONFIG_DRM_GPU_FREQUENCY_TRACE
> +#undef TRACE_INCLUDE_PATH
> +#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm
> +#include <trace/define_trace.h>
> +#endif
> -- 
> 2.34.1
> 
