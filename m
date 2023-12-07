Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DD9C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 00:25:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E3010E060;
	Thu,  7 Dec 2023 00:25:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A246B10E060
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 00:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701908711; x=1733444711;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZNYY8aXLtH21pCZe/7lM++1SLF0qpyUki/th0bCWjmU=;
 b=N1PIT+rRHe5Uujre+3DrogCia9CBuh9F5VWDOglskHRSWbroxYtqcBVn
 ZuxOrGSIAgVpLQ3FHgmJCkaPFEGkPeS7ODjVqUux3DgY3bxJcdCnyuArX
 SZFM5IBL30cmq3aYz37qTMsZotZYSDQ8I9OUu2FwjipzkLqBz+1zTGf4W
 EXcQqrc05uuy1BOJgHGxw/d1aPT8FuG1AtxmB6LzJn7spmwG3NsUXDfr0
 s8LYs9pi2hXdNlhQIDI9wguc9/JfXh8gFOPGfm/dG5W8PpAcijnz4tyB8
 sKWclQJmmST9JIYpCO9F3X1fsZiC4yixjM5cfqKpPys5u+FFDJCLeQXr5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="12862772"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="12862772"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 16:25:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1103008444"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="1103008444"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 16:24:53 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 16:24:53 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 16:24:53 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 16:24:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URFVNy4go8uUsxFA3k4xDs1FR2OyqFR+g77U0R1fFTSdgDo6PUNVCniDjT9Re7XseJ18SjJv8ifDj1sumptOG5kD0KWRBUZtrxlno9FH8Rn5fSBYY+q9LVsFWkfQc/cVh+U8iSXhXFArnh2rfzvBfeit/h7ZOtISlKdJgOtAImruIbq9G1CY6XHrmh7THe/az5iBUZoHcBGrTs33tdak53fg0Hxp7MzBCmxzEtbPloeai9ix1+P28xONNYe3ythvC49yVShSGsrDn2rXMKSglVm16wS/lMpdYwvqED51KQS6+7VVnJnTDK779BYFAPP5KVvLijqv6VYPEE8I2zH91A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxsFrXRni0X+keSWXU3ok1ftsmKNs2DZZp+v6Y8nJoY=;
 b=l2MNNNXYF1XeB1BoMsK3dreBkjrQA7uaD0valIKfm98Iul4Hkol2kIO2MIDuqP1uw3RkfGJuOg5ozvTv1muCj1lk0Y87oB2ngHk9wgOMsktyPMCAZJUF8Sy8vFDOyzIyHcM8lEJej+AfIOOJVMwowQQrQ78vnoCkI9VAdFgXOjGeTpBYzOzxwWVzyNpD0PeNp1hu69R9J5L99UdTqlT3gTeVMAwH4pJP9MBRtMU64gEXOVenE+Tg19i0cTOqtcWB3wvGCn89PF++tm2AqVze1z4gZNH0wiMsLj5fkQ+Gt2U65wYoXaBn4xtHkNYPWiX70rsBH/P1R0PG4lFVG362HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5365.namprd11.prod.outlook.com (2603:10b6:208:308::18)
 by BN9PR11MB5226.namprd11.prod.outlook.com (2603:10b6:408:133::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 00:24:33 +0000
Received: from BL1PR11MB5365.namprd11.prod.outlook.com
 ([fe80::a5ce:4516:92b4:43ae]) by BL1PR11MB5365.namprd11.prod.outlook.com
 ([fe80::a5ce:4516:92b4:43ae%6]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 00:24:33 +0000
Date: Thu, 7 Dec 2023 01:24:30 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <dza72vsdq7w7nvv3ddtab5hnuv27lz733wwi2your6k6pophhm@aygpfxwkjd7v>
References: <20231128151507.1015-1-michal.wajdeczko@intel.com>
 <20231128151507.1015-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231128151507.1015-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: WA2P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::24) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5365:EE_|BN9PR11MB5226:EE_
X-MS-Office365-Filtering-Correlation-Id: ee0a8dee-3337-4884-2ba8-08dbf6bae253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aW8fVI0Lyvl1KWgokvgnsqpw75oCdl86TzrdlyfKVSLJmQqDJX0rvnJ2RTTVN3hcjQoQfYWekGuEuKRMcdwyc9gNd5E85nAqCcPuk2+mXfbFqXDvTUKUDoXmBHsVeq5HmROOLhOhWZYi41gwzf8xLXX3qnKMf6C21bMB1A4OMjyd6kgqtDqUnXpPTQa3h+fZv71OWDOJh71GfxHNBh7lSr7pRRdW8FUKrDzKyyFCw37uvGdguIl4TOy8MOiV90qg2RGdFtEL1wiO23U21NHp3sK+XbiE/6fQf+gY04UltyJ5tN8Ex0ZROOAYjSs4Lug0khG+YN7dEvuM5NakU4KROf25KINsP/6LbYarfsQujGTycCQT2bRFK3fw/TiCzYirrfEXh5fON6yA8C1P2N79EY5taqVTmx+cihVUCzS7/TGdrBEs/Al4NmQ+NO7XVgZ/jFjZMwup7z0p4urpOA4TO+BDAuiZmA+7soWal16zEA9sPkoyZpfWLPcQLUb02hjWHRPVVXnYlhYKYPp5icnQV+X2kUNJgTabWeWYkVVdtrF3k3hXCR4qj84zKwGPYyLLL70j+JGN2GGB+nGoiOykdo250b19rHGAn57cmiQ1m9Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5365.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(366004)(346002)(39860400002)(376002)(396003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(38100700002)(2906002)(33716001)(4744005)(26005)(83380400001)(86362001)(82960400001)(5660300002)(6512007)(6506007)(8676002)(6862004)(8936002)(4326008)(9686003)(41300700001)(316002)(6636002)(66946007)(478600001)(66556008)(66476007)(6486002)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnNKUERuSVRBSGpSUCtFVFhGcUNiWkpuYnBGanFIZnYvUDVNQ0RKd1owVmx2?=
 =?utf-8?B?NFNTODZhb0EwTm1pbTN4N2hxQlpmUUlHRmxPUUpLNEFXNU8ybnJLbXh2d1FK?=
 =?utf-8?B?bmY2ZjZ6aytUUCtQalp1UXlCanlGa0pqWXoreXhaTUlJb2ZRRllqU04velNP?=
 =?utf-8?B?SmJzenlKS0Y5Q2VWYWdzeDF4KzU4cklEUHZpR0pibTBzNGNvSVllVU91dVE0?=
 =?utf-8?B?ZkVaMEM3MHE4VndUWjNQbkhaMWs3MnZWak1ZNFBFUkFhWWxSWTJNYm40bG00?=
 =?utf-8?B?NnN4amZyZno4emhkY1JHTndsdTVubEp3NTYwdTZsOHJnK09TUWdGeGxkMFF2?=
 =?utf-8?B?K2dXS2xyQmVuQVNreE5naDI4OCtoK3dlUnZLdm1CazRXWUN2aU5EZlVRcWMz?=
 =?utf-8?B?MnFrQmgwU3VtM0EzMEdSaXRoM2JaYUZWKzRhZE9UNC9odVBPNTZxdE81Mllw?=
 =?utf-8?B?dEtSQkxRMHRmRFpQdGlzRWQ1WVlmNTlIdmd3NWQxVDNubXZMTkV4UmNzTWE0?=
 =?utf-8?B?c0RZUjh3Nzgvc3VWa0VxYzB5SlQ4K1RtNlBYblYxcjFERno5aFVDZmhFUW8w?=
 =?utf-8?B?bU5uVGR4MHp1NjBobktIQ1N6KzJMbFVnRkUwalFHenVCNkV2dUN0S054L3Bi?=
 =?utf-8?B?YzNXNUdwVis5RmtRUm9FR1NIZ0dCQ0cvMklwZ1BXdzA0c2JJd280NjE0OS9P?=
 =?utf-8?B?UnpLUVk5ZkkveXpURTZKRlNpU0VwNE1lL2RlL05RTnpCNVdBVGZEUkQ5NE5B?=
 =?utf-8?B?RnF6VWk2MzNtRVhXU29mOG9PS0VramNlNitiTXBqTUMyZ1JYTXcySEpkZjND?=
 =?utf-8?B?cTFiblNmNm5rZmljeEJjTW9lN0s4bk9uVDdJZmlET3ZrQjlINlZqTndqWDhK?=
 =?utf-8?B?RXRoYW02SlIwVTdyTWRlV1luM2NJZTJKbzNTUlNHTy9tMm5IRE9PVm1UVDRC?=
 =?utf-8?B?ek1uUXdRenoxOEhuWXRBQlloU1NyNWRySUQwSjRIYlZwUjNNY1RkSk0xVWxs?=
 =?utf-8?B?NFlhczcrTnJScWx5MHZ0bjNrWko1WDk0T1I1WDh1TzdCVHJic3E0ajVzdENO?=
 =?utf-8?B?a0RrZ1d6SEF6RGRiYy9xc3BOclRCak8xSkVPWG5PSjdLTXN4OUN2MWduSmVx?=
 =?utf-8?B?a3QycmVucy9JT1d5bnVEUkE2YUQ1ZENnclhNYTZ3UWJXOHVyc250dldXaWxa?=
 =?utf-8?B?OXZXOGlhcUUxZUlJbUZYd3o1ekN6b3VUYTlCc2J5QU8zS3EzRXo5MFNNTVQ3?=
 =?utf-8?B?bzVUK3ZnRFlSSDVsVk43ZzgwbTUvQ0FDY1RUYVVDRzVqR2JiZzZIWUljdXNp?=
 =?utf-8?B?NDFsUGRndlRBbDlNMmdvR3VEaDRwUEtKM0gvQS9XR0E5VlhqekVhaFByekk3?=
 =?utf-8?B?SmpsSkZQQkRkbHJRYSswb0hESm8zb1NPYk84WXdXZ091MUdlaXRTQjlMT1JP?=
 =?utf-8?B?MVFSNTlUR1VRVzNFdmxPSzA2Y0lOZE1UZHo1elFjZTJHOENadmhkUlZURm5H?=
 =?utf-8?B?RU9DaVhkMDMrWU5Fb2xZcjZqRlgwNDFGOXdyT3NTUEZ1ZFIwZFpRSXMwaUp1?=
 =?utf-8?B?aE9UZzRRbEdEZ1RZdVRyTmlFZ1lCODU0TmRqazBnNFdHY29DcWhTNTZZVzBE?=
 =?utf-8?B?NDlGWTIzd0EzRTZQZFJ3VmxVNm12VHd0UDhad0VWM2dVc29OY2dja2JrcFpU?=
 =?utf-8?B?UFRudE1RWDJVcUY3OUNjYjRsQ09adFVPUVhzR0hIdndQL29ncmxzYk9aRnlM?=
 =?utf-8?B?MXQ1d1JzUVEyRzByU0xUcWRDUnh0QVIrbzFlVVZyQzE4R0NhZFRiM3QvU1Mz?=
 =?utf-8?B?VVdLM0dyamYrRFQxM2hWYllnNjdYcU5icW5jbkI3WHJRT09zeFRnN2VMSU5K?=
 =?utf-8?B?S2IzVkNOcEc1OUUyeWR5eE9lR0M4NmlxV0hNN0VSUFVhWmpCVXZKWENWWXAx?=
 =?utf-8?B?Z2Y0ZFJCSFp5RTB0dWFMNi9PTEZQRmlqTkR1TmFaaitFYXdxSDVuMU5WZXkv?=
 =?utf-8?B?RGlrdzY1NWs0QmtZQjBOSVgwekRsc1I5MkFUbG5WdUNoZTgvakdRdDZjQTls?=
 =?utf-8?B?MGxJMW85d0NzU0hzbU5pOGRERURjTzJxQlI5bUV3RWJrZ29Ccmd6Z1hyaGR5?=
 =?utf-8?B?aEpxWll1QWYvMElMUk1odTBESElOMmE0czdSU2Z4UUJjTzZNU3BKbnEySmpF?=
 =?utf-8?B?NGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee0a8dee-3337-4884-2ba8-08dbf6bae253
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 00:24:33.1860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KusaVRh7hk8uvwUA3pcLgTmjjeEM6G6CGcfvL7uFJYnhVURZA+3XK09nQKtkibXXjWN0a+oGK0KDtaCYrxCX1t4or8cEbe3oB9aEwSzIHVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5226
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/5] drm/xe/kunit: Enable CONFIG_PCI_IOV in
 .kunitconfig
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

On Tue, Nov 28, 2023 at 04:15:06PM +0100, Michal Wajdeczko wrote:
> We will add kunit tests for the PF specific code that is by default
> enabled only under CONFIG_PCI_IOV. Update our .kunitconfig to allow
> running those test cases by our CI.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

-Michał

> ---
>  drivers/gpu/drm/xe/.kunitconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/.kunitconfig b/drivers/gpu/drm/xe/.kunitconfig
> index 3769af94e391..9590eac91af3 100644
> --- a/drivers/gpu/drm/xe/.kunitconfig
> +++ b/drivers/gpu/drm/xe/.kunitconfig
> @@ -1,6 +1,7 @@
>  # xe dependencies
>  CONFIG_KUNIT=y
>  CONFIG_PCI=y
> +CONFIG_PCI_IOV=y
>  CONFIG_DEBUG_FS=y
>  CONFIG_DRM=y
>  CONFIG_DRM_FBDEV_EMULATION=y
> -- 
> 2.25.1
> 
