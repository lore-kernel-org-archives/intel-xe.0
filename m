Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB52CCA0EDC
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 04:05:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5978B10E201;
	Thu, 14 Aug 2025 04:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NgFn99Re";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB6310E201
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 04:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755144352; x=1786680352;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZoxKcFsD63UrCjX0W+GVt/RcAGkq7A/cWVOaOmgtA0E=;
 b=NgFn99RezuMsjCjCceJH95fxzxdtshwHBt/nO1D8B9rzfV+1nrqXmap/
 gVqMpf/AbkritpPxversRV+JoqW38kwYnQ1bK7Ayj92Emq3MTGyUPJgJw
 7mY0GY73ZV4knKe6MhdHWW2rNGQROnCB/UxHFmzlcDRPatupVF3KdB96S
 CdtZ80uYru7f0Aw7+G5hy7Qw02NcBARRvS3qA1PidqXl/Tb0w6jPaNxdI
 rctTb03ec5tVpRB5QW482/zx+ha3SdGEhJ0J9d7+YQHIcYPFWRUOJNoth
 UjPcedqP/tl6KY9cM+scYGBZ2JwvwauqXR/3d9g/glAo7jbcVBpA3NlER Q==;
X-CSE-ConnectionGUID: mGa+LZQxSgqBJQFinIDFmQ==
X-CSE-MsgGUID: o5VjaeF0ShSDAcDP55AITw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68154399"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="68154399"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 21:05:42 -0700
X-CSE-ConnectionGUID: q8mVwIoLRZSFOhi1YNd8kA==
X-CSE-MsgGUID: N5kqaoBCR96f7pLQ4nvTpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="203838526"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 21:05:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 21:05:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 21:05:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.64)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 21:05:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WoKUbrtjSr7RpO856qmOssclbGYNU2MGhxNnXf/6Yw3z0R/5yOQyjFEnBwHjGckPDC11HJNtOCpoFqgBcu1CRnZlinaze19aQ2OFUGjPH8LSuAKXMzcex4DptyKoYMiB2MswRDYx2Nno1WszDvc7MvXOYCV7FWr9CeGgWFR6I+85jsm637wh6No+TJ2JFmxDdc9zIsyw7ABr/Ps7pk04k/1YG9NYIEnnpHYI6Zzs92lJAsrPbvMy/bKibu1I/5zAN9f8RkJxZRxVxxGbg65KtZyCjl2CmdKQxE/v+GYHm032ZfQ8JLdMsLEHCTrJqbmrC00cfT+M4IiMCfJVhuurAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R909xw5kj+dMZY1INLWgeAb0g9yCnhtzflLyfC1QltA=;
 b=DGW2gyr2nXKlPgHJmd+grwFNO1sByX+HXVNlvvTCsbTp2dOmBCFXWyrNZyHZcZra7fI6oxLpE/fjaXvWArkFGlyssZVUyKjSpmmoYli5W9kTN6m9YgIZdX4Bwf3ouDnRp4aEQsLp0YT7OBnGe+CFvH4ZW6HX9+5G9rRapT5p4q65mWa83Q1T4+OUyeM2W311+5vbzQSRWM+fc+1WgOlYV6i5G2aJbiR+gddN2FxBtHROlaWOiO0vK7GRAVTkk9hSpOPTSQ+TL139pYePbIc5fMkwXjgd8NxZrvoHmODMD0qj+72cQUw9gFabt63rH4nM9YBHhZPOfFsT5rlUU14KRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB9298.namprd11.prod.outlook.com (2603:10b6:208:564::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Thu, 14 Aug
 2025 04:05:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 04:05:32 +0000
Date: Wed, 13 Aug 2025 21:05:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH 13/15] drm/xe: Convert xe_bo_create_pin_map_at() for
 exhaustive eviction
Message-ID: <aJ1girRBD0ivhUvy@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-14-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813105121.5945-14-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0071.namprd05.prod.outlook.com
 (2603:10b6:a03:74::48) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB9298:EE_
X-MS-Office365-Filtering-Correlation-Id: 49ec4ff5-b509-4832-32c0-08dddae7d048
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?mXMVbhYp5p5Q6A+8qa4r9JUbc5PsM7CVjiz7EMiu6AxB+kODiIgGZcUpwV?=
 =?iso-8859-1?Q?X+SjrCfg5zR3Jx6W6KmDEDMm7bVwK/JcnJB/bin9hh2qT78XdCHNNCJVZb?=
 =?iso-8859-1?Q?JxgchAfZYoGVPWpD/cDt7pCjOS53vPXZFJ68RVfg/4Sx70ist7IrY2A+Dz?=
 =?iso-8859-1?Q?9S9G+MeAzlcOpjYXbEMZPH3zBicEooUSZubcWyIu3HU390uFuInBdIxjzw?=
 =?iso-8859-1?Q?OPt0PPkYqeCfxfJ2MzMOhM0AcAu8/EG6Je0EOXN8BkOXxoLckArDlTmybY?=
 =?iso-8859-1?Q?pzh1B4Tu+7NL3AgjKpeMzW8WAp5jF2yZbTdtnqKpmTRIcq6g+eSi2FqlOK?=
 =?iso-8859-1?Q?SqG3JYkSoef/HEe9fPbFe1SjxXFJWZp6xJzzDY7vHMCaoI+BCgqvZJ03GA?=
 =?iso-8859-1?Q?76myEnJ+xQyTEirXxpQaniNCCGip1vNTnrvLIlgHpaZQf5XKmuoADmR2ol?=
 =?iso-8859-1?Q?Crz7z94pd+f3ABL403M212PfbFxsu/CncXrGF+ctx2nxG7KcqODFbrrNoj?=
 =?iso-8859-1?Q?hdnP9xTHuNNo5uZc1wCjWYhVVk61auCmgM2D4V2F/0VEDZSh1z5cH6W1Ia?=
 =?iso-8859-1?Q?LHMPo8ck7yYFZqsuTp2j8d8M7HIL+yEH+ECq+evHBNKmimyhHvKMeQML4D?=
 =?iso-8859-1?Q?itGFMmAekXhq5yEosFEGuDyv2cPheWWWuHjBfDTZgi61EqIGxcn9pKSXwK?=
 =?iso-8859-1?Q?Akoe2peqGzlXB8BId2M1Iv8DbqflDIY1IgqgnHuhzKVl9xMj3tmkKRTE3q?=
 =?iso-8859-1?Q?Sz0HsxQ4V5g+RjV+QO9vsuMNttZ03T9LrjAP4MXp+J6I2xIlx3B3xWkVPs?=
 =?iso-8859-1?Q?ikVW4RYL3ULmuni5H5Pvkew5s/v5SGYpDBw83RUh9AEbdsDqBzuXKN8Jhu?=
 =?iso-8859-1?Q?7z8Eti35xtgTcrBB07knVLx3QVImEV52PjSCpUobNptWeo7C9Jil4QkZi3?=
 =?iso-8859-1?Q?YUralVfWQlP7Jq+4s/0rL+inwwhDAvq12aArovvShfyq2dDpSaQUTmbGzJ?=
 =?iso-8859-1?Q?cxgat1j+EjGrF0jY7W38MjBknSCkdkxGrtOjMHSHzd3EYaCv0QwnO+Vg/l?=
 =?iso-8859-1?Q?uhm/tPtpvMbsW+W1kqLI93c+hTwveVfbGLh2NjjmmE1bJNxTHpzraAWzJu?=
 =?iso-8859-1?Q?P4ghTdhlO1Q3H9ayercJauvSK85bkVpzW2xcf1YRT4egZDfjL1bKTRd+do?=
 =?iso-8859-1?Q?aoVSNKs+ts9Sm8iNED5Z/PuLwlJcMKLjD4h53RXspEgQjlk2S7Z+SWeOHK?=
 =?iso-8859-1?Q?Ac9E2d24Qh5Al8t/3zH1ijl19pIgEghlWft2nfT/k0AUIiof1HfE1Q4EQh?=
 =?iso-8859-1?Q?cMfJdFDto8a0IL1ZmkcuxooFIgqquMqF2lX5rcvVcLWc36378Mz+ZhU316?=
 =?iso-8859-1?Q?glPARnolhDAoOyqxP3WheQ/CkJwNEqSxJ5nLSGS4GkH7DyxbiRp5Qa2wdv?=
 =?iso-8859-1?Q?6iaOvKTHPi9mLs/aPIDBLWtfi7lNsCNL8lGXYg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BGcbCCU+5MB9gD8Zn+qyXeXixW8yBErWWxbmtVgYvyE/AvdRgkhuBDMAQy?=
 =?iso-8859-1?Q?qauYj8/AAIzORKJmiTFULZ/4ZShVWmUXdP5b6+q7jCMj3tpPcqRJXVmd4w?=
 =?iso-8859-1?Q?ZF4qQZhGXhI9ZDyqTY8lnnDgU1O6iKKuxFGZVG5k3i6QkkHqszpQdkIrbr?=
 =?iso-8859-1?Q?zS8Nnv9mM0duPE1nQkONWw+i3MtfOgLcNyaOek16mVR51Pt4pBx3ptubl/?=
 =?iso-8859-1?Q?TiDlV74F0cQcWTtC6k8zjtPW+6e51sLvjx47g6kpVjGLKrPm96Kx69WFOB?=
 =?iso-8859-1?Q?WhKgMIexGnGiv16duyDnk6E7zfOrcPZlhC0cEvxg/FQvU4Z1jG6yZpLGyY?=
 =?iso-8859-1?Q?GesOg5nXyTl5ioaoaFyt1zm6yMgPxqCT45wxzEmHMAYs8sv9iPiPl1jI49?=
 =?iso-8859-1?Q?WWztgr1RkdKuKPaOP2kGL/FIQl0uoWMS5PtosG5gbuxuRw+Jm76PcEH8Y6?=
 =?iso-8859-1?Q?blr8JETHK8odZTdwlADXrq8dvH6CNVCNrpstB+llB0Ka2D0BMACp+A0IvZ?=
 =?iso-8859-1?Q?Cz9jPluGQlQNr7loKTs9dZtLqM0297dpcPd9Gt7pI6yDJpoNwDaeeppaaV?=
 =?iso-8859-1?Q?v4glAuVj6gsM0JKYVGBF7xsB8aeszffPMFTt9V32cc8kpWFl1vgYWFRsLf?=
 =?iso-8859-1?Q?38VKQnvhg/9/+AnOyTQPZgMAeTSIXIR5mHOx7Whn1vZRXLpn2r5k3qlIVi?=
 =?iso-8859-1?Q?ra3fEdmFAXYu7dZYha0DpXZqGyPn7L2FM5tgDtTcw+bPXg91LJ6jCyvWx0?=
 =?iso-8859-1?Q?7q+mPEKiuOB0lxVnl6ZI46XV3pueS5hqWKHszLjYFlCxvd75jBamOLpMcA?=
 =?iso-8859-1?Q?ZtxhBJMUKZOducRqm6vE4QRiGE/jNGqYdgmnZl8Iys77u5iyIO9cD3MV5G?=
 =?iso-8859-1?Q?b0VFP+pvxiOs2RrAa9GujGp8Uh7Dya7thN/DrkClFH7Dcaa6OXyRu88rg0?=
 =?iso-8859-1?Q?8KndXmv1WVtWkkIqd4L8JO5oTBMB06PDLHDGzervKZMHX1FxMZMkMu8n3m?=
 =?iso-8859-1?Q?3BbKx7kuFlMDldvG5Mi01MmCLpHwu/n2zq+ibAW81+ClleccDlUX+OOTzf?=
 =?iso-8859-1?Q?IVS04+NZzM7B8/Oln3ROGN0YCN1rCtmm1ZW9HhnJGvEwuMH8S/3T10WZb7?=
 =?iso-8859-1?Q?3GLEwZrDSv7ww/zemkHfF7tV/WP8BwUY4RJFHGs8Sp9ecdmZnraou6CJST?=
 =?iso-8859-1?Q?aXItcVJID+n1bjbWc9SO27QxnKtm+f4Q84KSGGBla4WsopNKjOL5ao7hdH?=
 =?iso-8859-1?Q?wV0jB/8QyNddwLdsCLTBEef6KCadw1cDhO/MkRAd44MA581Ieb7BhmWmHX?=
 =?iso-8859-1?Q?X98enM1pNtAB44c6ulZeT0bowxCIgm4GGzWZxYhMu+qrVgzpEDJAH9GzPD?=
 =?iso-8859-1?Q?nAo8mDOcfAeQfV1jPL7E6Sul2UxxwqJt4MHCzMvWXSdmM7AqPLHMjWgsMw?=
 =?iso-8859-1?Q?zn5nwfbKbDVhyYDrquFz7eogvW37VOxyONc53enhPjMx3s5IwzLctgO59c?=
 =?iso-8859-1?Q?8WTG9e8RIaj2MYLitKpaXcWp7gd/uK/FQGeaFGiNad7BO0qHnXBbeSscpU?=
 =?iso-8859-1?Q?onSaA/h/mSK4RYUaIqlQ2UeNrJb+JnWfwhFLeJKVGVMKbdZl43SiFc7Cpe?=
 =?iso-8859-1?Q?b7xUdQQUEVtlwCMLNZ1XsRpAh2rWiQzBVOEsoRKNTlYgeadTEZgVfv7w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49ec4ff5-b509-4832-32c0-08dddae7d048
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 04:05:32.4619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1Au5woX5W4sEGpRp/os6IRCXQCn1iC/Me1pQbos8pwcwoE6JS6mpXjIY4w5KLOGDwmVEZBrrrk2bXvLTpV6cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9298
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

On Wed, Aug 13, 2025 at 12:51:19PM +0200, Thomas Hellström wrote:
> Most users of xe_bo_create_pin_map_at() and
> xe_bo_create_pin_map_at_aligned() are not using the vm parameter,
> and that simplifies conversion. Introduce an
> xe_bo_create_pin_map_at_novm() function and make the _aligned()
> version static. Use xe_validation_guard() for conversion.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  .../compat-i915-headers/gem/i915_gem_stolen.h | 24 ++----
>  drivers/gpu/drm/xe/display/xe_fb_pin.c        | 45 +++++-----
>  drivers/gpu/drm/xe/display/xe_plane_initial.c |  4 +-
>  drivers/gpu/drm/xe/xe_bo.c                    | 83 ++++++++++++++-----
>  drivers/gpu/drm/xe/xe_bo.h                    | 13 +--
>  drivers/gpu/drm/xe/xe_eu_stall.c              |  6 +-
>  6 files changed, 101 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
> index 1ce1e9da975b..ab48635ddffa 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
> @@ -21,9 +21,7 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
>  						       u32 size, u32 align,
>  						       u32 start, u32 end)
>  {
> -	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
>  	struct xe_bo *bo;
> -	int err;
>  	u32 flags = XE_BO_FLAG_PINNED | XE_BO_FLAG_STOLEN;
>  
>  	if (start < SZ_4K)
> @@ -34,25 +32,15 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
>  		start = ALIGN(start, align);
>  	}
>  
> -	bo = xe_bo_create_locked_range(xe, xe_device_get_root_tile(xe),
> -				       NULL, size, start, end,
> -				       ttm_bo_type_kernel, flags, 0, exec);
> -	if (IS_ERR(bo)) {
> -		err = PTR_ERR(bo);
> -		bo = NULL;
> -		return err;
> -	}
> -	err = xe_bo_pin(bo, exec);
> -	xe_bo_unlock_vm_held(bo);
> -
> -	if (err) {
> -		xe_bo_put(fb->bo);
> -		bo = NULL;
> -	}
> +	bo = xe_bo_create_pin_map_at_novm(xe, xe_device_get_root_tile(xe),
> +					  size, start, ttm_bo_type_kernel, flags,
> +					  false, 0, true);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
>  
>  	fb->bo = bo;
>  
> -	return err;
> +	return 0;
>  }
>  
>  static inline int i915_gem_stolen_insert_node(struct xe_device *xe,
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 43c45344ea26..d46ff7ebb0a1 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -102,29 +102,32 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>  				 XE_PAGE_SIZE);
>  
>  	if (IS_DGFX(xe))
> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
> -						      dpt_size, ~0ull,
> -						      ttm_bo_type_kernel,
> -						      XE_BO_FLAG_VRAM0 |
> -						      XE_BO_FLAG_GGTT |
> -						      XE_BO_FLAG_PAGETABLE,
> -						      alignment);
> +		dpt = xe_bo_create_pin_map_at_novm(xe, tile0,
> +						   dpt_size, ~0ull,
> +						   ttm_bo_type_kernel,
> +						   true,
> +						   XE_BO_FLAG_VRAM0 |
> +						   XE_BO_FLAG_GGTT |
> +						   XE_BO_FLAG_PAGETABLE,

The flags and vmap arguments are swapped.

> +						   alignment, false);
>  	else
> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
> -						      dpt_size,  ~0ull,
> -						      ttm_bo_type_kernel,
> -						      XE_BO_FLAG_STOLEN |
> -						      XE_BO_FLAG_GGTT |
> -						      XE_BO_FLAG_PAGETABLE,
> -						      alignment);
> +		dpt = xe_bo_create_pin_map_at_novm(xe, tile0,
> +						   dpt_size,  ~0ull,
> +						   ttm_bo_type_kernel,
> +						   true,
> +						   XE_BO_FLAG_STOLEN |
> +						   XE_BO_FLAG_GGTT |
> +						   XE_BO_FLAG_PAGETABLE,

The flags and vmap arguments are swapped.

Matt

> +						   alignment, false);
>  	if (IS_ERR(dpt))
> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
> -						      dpt_size,  ~0ull,
> -						      ttm_bo_type_kernel,
> -						      XE_BO_FLAG_SYSTEM |
> -						      XE_BO_FLAG_GGTT |
> -						      XE_BO_FLAG_PAGETABLE,
> -						      alignment);
> +		dpt = xe_bo_create_pin_map_at_novm(xe, tile0,
> +						   dpt_size,  ~0ull,
> +						   ttm_bo_type_kernel,
> +						   true,
> +						   XE_BO_FLAG_SYSTEM |
> +						   XE_BO_FLAG_GGTT |
> +						   XE_BO_FLAG_PAGETABLE,
> +						   alignment, false);
>  	if (IS_ERR(dpt))
>  		return PTR_ERR(dpt);
>  
> diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> index 826ac3d578b7..79d00127caf4 100644
> --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> @@ -140,8 +140,8 @@ initial_plane_bo(struct xe_device *xe,
>  			page_size);
>  	size -= base;
>  
> -	bo = xe_bo_create_pin_map_at(xe, tile0, NULL, size, phys_base,
> -				     ttm_bo_type_kernel, flags);
> +	bo = xe_bo_create_pin_map_at_novm(xe, tile0, size, phys_base,
> +					  ttm_bo_type_kernel, flags, true, 0, false);
>  	if (IS_ERR(bo)) {
>  		drm_dbg(&xe->drm,
>  			"Failed to create bo phys_base=%pa size %u with flags %x: %li\n",
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 23b28eeef59f..c9928d4ee5a0 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2253,29 +2253,20 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe,
>  	return bo;
>  }
>  
> -struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile,
> -				      struct xe_vm *vm,
> -				      size_t size, u64 offset,
> -				      enum ttm_bo_type type, u32 flags)
> -{
> -	return xe_bo_create_pin_map_at_aligned(xe, tile, vm, size, offset,
> -					       type, flags, 0);
> -}
> -
> -struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
> -					      struct xe_tile *tile,
> -					      struct xe_vm *vm,
> -					      size_t size, u64 offset,
> -					      enum ttm_bo_type type, u32 flags,
> -					      u64 alignment)
> +static struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
> +						     struct xe_tile *tile,
> +						     struct xe_vm *vm,
> +						     size_t size, u64 offset,
> +						     enum ttm_bo_type type, u32 flags,
> +						     bool vmap, u64 alignment,
> +						     struct drm_exec *exec)
>  {
>  	struct xe_bo *bo;
>  	int err;
>  	u64 start = offset == ~0ull ? 0 : offset;
>  	u64 end = offset == ~0ull ? offset : start + size;
> -	struct drm_exec *exec = vm ? xe_vm_validation_exec(vm) : XE_VALIDATION_UNIMPLEMENTED;
>  
> -	if (flags & XE_BO_FLAG_STOLEN &&
> +	if (flags & XE_BO_FLAG_STOLEN && vmap &&
>  	    xe_ttm_stolen_cpu_access_needs_ggtt(xe))
>  		flags |= XE_BO_FLAG_GGTT;
>  
> @@ -2289,9 +2280,11 @@ struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
>  	if (err)
>  		goto err_put;
>  
> -	err = xe_bo_vmap(bo);
> -	if (err)
> -		goto err_unpin;
> +	if (vmap) {
> +		err = xe_bo_vmap(bo);
> +		if (err)
> +			goto err_unpin;
> +	}
>  
>  	xe_bo_unlock_vm_held(bo);
>  
> @@ -2305,11 +2298,59 @@ struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
>  	return ERR_PTR(err);
>  }
>  
> +/**
> + * xe_bo_create_pin_map_at_novm() - Create pinned and mapped bo at optional VRAM offset
> + * @xe: The xe device.
> + * @tile: The tile to select for migration of this bo, and the tile used for
> + * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos.
> + * @size: The storage size to use for the bo.
> + * @offset: Optional VRAM offset or %0 for don't care.
> + * @type: The TTM buffer object type.
> + * @flags: XE_BO_FLAG_ flags.
> + * @vmap: Whether to create a buffer object map.
> + * @alignment: GGTT alignment.
> + * @intr: Whether to execut any waits for backing store interruptible.
> + *
> + * Create a pinned and optionally mapped bo with VRAM offset and GGTT alignment
> + * options. The bo will be external and not associated with a VM.
> + *
> + * Return: The buffer object on success. Negative error pointer on failure.
> + * In particular, the function may return ERR_PTR(%-EINTR) if @intr was set
> + * to true on entry.
> + */
> +struct xe_bo *
> +xe_bo_create_pin_map_at_novm(struct xe_device *xe, struct xe_tile *tile,
> +			     size_t size, u64 offset, enum ttm_bo_type type, u32 flags,
> +			     bool vmap, u64 alignment, bool intr)
> +{
> +	u32 drm_exec_flags = intr ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0;
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
> +	struct xe_bo *bo;
> +	int ret = 0;
> +
> +	xe_validation_guard(&ctx, &xe->val, &exec, drm_exec_flags, ret, false) {
> +		bo = xe_bo_create_pin_map_at_aligned(xe, tile, NULL, size, offset,
> +						     type, flags, vmap,
> +						     alignment, &exec);
> +		drm_exec_retry_on_contention(&exec);
> +		if (IS_ERR(bo)) {
> +			ret = PTR_ERR(bo);
> +			xe_validation_retry_on_oom(&ctx, &ret);
> +		}
> +	}
> +
> +	return ret ? ERR_PTR(ret) : bo;
> +}
> +
>  struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
>  				   struct xe_vm *vm, size_t size,
>  				   enum ttm_bo_type type, u32 flags)
>  {
> -	return xe_bo_create_pin_map_at(xe, tile, vm, size, ~0ull, type, flags);
> +	struct drm_exec *exec = vm ? xe_vm_validation_exec(vm) : XE_VALIDATION_UNIMPLEMENTED;
> +
> +	return xe_bo_create_pin_map_at_aligned(xe, tile, vm, size, ~0ull, type, flags,
> +					       true, 0, exec);
>  }
>  
>  static void __xe_bo_unpin_map_no_vm(void *arg)
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index a625806deeb6..d06266af9662 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -109,15 +109,10 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_vm *vm, size_t s
>  struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
>  				   struct xe_vm *vm, size_t size,
>  				   enum ttm_bo_type type, u32 flags);
> -struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile,
> -				      struct xe_vm *vm, size_t size, u64 offset,
> -				      enum ttm_bo_type type, u32 flags);
> -struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
> -					      struct xe_tile *tile,
> -					      struct xe_vm *vm,
> -					      size_t size, u64 offset,
> -					      enum ttm_bo_type type, u32 flags,
> -					      u64 alignment);
> +struct xe_bo *
> +xe_bo_create_pin_map_at_novm(struct xe_device *xe, struct xe_tile *tile,
> +			     size_t size, u64 offset, enum ttm_bo_type type,
> +			     u32 flags, bool vmap, u64 alignment, bool intr);
>  struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
>  					   size_t size, u32 flags);
>  struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
> diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> index fdd514fec5ef..afabfc125488 100644
> --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> @@ -617,9 +617,9 @@ static int xe_eu_stall_data_buf_alloc(struct xe_eu_stall_data_stream *stream,
>  
>  	size = stream->per_xecore_buf_size * last_xecore;
>  
> -	bo = xe_bo_create_pin_map_at_aligned(tile->xe, tile, NULL,
> -					     size, ~0ull, ttm_bo_type_kernel,
> -					     XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT, SZ_64);
> +	bo = xe_bo_create_pin_map_at_novm(tile->xe, tile, size, ~0ull, ttm_bo_type_kernel,
> +					  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT, true,
> +					  SZ_64, false);
>  	if (IS_ERR(bo)) {
>  		kfree(stream->xecore_buf);
>  		return PTR_ERR(bo);
> -- 
> 2.50.1
> 
