Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542CECA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 16:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116CC10E984;
	Wed, 10 Sep 2025 16:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B5BYR4GY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08BB10E982
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 16:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757523129; x=1789059129;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=T2QfnmYmG4kriSkrdORhIdXsTgRwzUcMvtD9VzP/N6Q=;
 b=B5BYR4GYDYX2CcPXkt5bS2+t8ngXfpxefCHTS6hXGJIVqzpbJ18Igdna
 63iVUEHOTz1W0+/bv5t3ka6GRYS3qtFLMgNqRHsWNfnkkrEMPQ+Q7urcb
 b1rIqCVjxjOB01tjguk6oyyuDEE8DXRi+UwOdu9K65VbiB6kTVfRyAq8/
 XzxC4vArJoVV3FYHJsa8tWjdpjn7gMh4TbhWsli7zKtTt8hvuv4meoYXG
 58MiE3zpd+xhqL9f+uMhMZWT8qngY+/dwPCFDTaUmRusb+CiDr3IUstMC
 PdA/XglbjNR1SJ69WpZZ/IPeH9tHDjUmItcby9/pl/cncH1RoL3umMKuD Q==;
X-CSE-ConnectionGUID: JnzWeLVFS5CuBU3ojTiLKw==
X-CSE-MsgGUID: UliEm9TsQBSdJ/ctYrVN4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59534851"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="59534851"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 09:52:09 -0700
X-CSE-ConnectionGUID: P64wf4SmT1uaoyQWC7LOIw==
X-CSE-MsgGUID: xcJKEVdkSOWJhOwnrEIN0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="178643060"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 09:52:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 09:52:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 09:52:07 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.44) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 09:52:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSgMzg+bgsVgpKTYxrswbT1eQYrvHxp+uwksBAfENRufcH2dUBv1rxytjQ4FoU6ItPixqA31Iq7+Y/Dv/3dbNeU6dw0EMev2lUMS+MiUMCgog+AoRhZ56Poc9Hka000aTZ06AI3JAmxzVur5wNETiWVwu/R7Hhjk/V5z5iQ4T6FdnU4xcVmx+NS1NS7y6XNSG0/EsM96w/yJ0cL3MrAWND3wotKCyAq6GuHG975qPZsNVWnCJ9ZkxENXJLAoafq+ojaaw0AW2ZQo133DCYv0R/A0vx8un4u0kXkrCr2IVG3m3xVz8PnBU5RLT7kdFSZJBehB2uMRRrQa+KFL82xUdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fD1zKAB8+L2J6Di7p1EO+wtIydWiPiNbXrevPX76OxQ=;
 b=PqlMz14DCffY+Mbp0qKdTYZyqSq1oiDew8BbwnnR2ibuyk3FGBqydMS9LxiNPruuyTqcG12V9qvbCKvLqKwHzrQVuKYz3oiaT1bhdMCwkkatL2KrQoStBRwOUw9lO1Hs5Roayk+Ugg31QWSap2+zFdJ5f6tF2QEBntC9a4QecEFDv6wRyKEfiOB415NPMriXEduBWo9m9hHCXPxJqT3jkeAEDpmD6jBjv4pZf8gI1mZ/EZTfyvlzb3b8rJOlitMOeADdMsjEgXA1aZrDqj7mvMP5VUHuT82eeCPExwXs7yyd29a5XTw0Y+1zHBhwbR2xnV8ekbeDBXbhQGC44uf2nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 16:52:03 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 16:52:03 +0000
Date: Wed, 10 Sep 2025 12:51:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <daniele.ceraolospurio@intel.com>,
 <matthew.brost@intel.com>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 1/2] drm/xe/guc: Split xe_guc_ct_enable()
Message-ID: <aMGsrqDj2qUh3G7b@intel.com>
References: <20250904091439.2279352-1-raag.jadav@intel.com>
 <20250904091439.2279352-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250904091439.2279352-2-raag.jadav@intel.com>
X-ClientProxiedBy: BYAPR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:74::16) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MN0PR11MB6059:EE_
X-MS-Office365-Filtering-Correlation-Id: a9029a80-e411-4d5b-1e74-08ddf08a5e01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?izMAUzV6WzYyXqZBSJxcK2Sz0kcInE1HHu2D3ZZyOfdezoV8gI8sXzyWtOrQ?=
 =?us-ascii?Q?H26ORkR2fqZfvkbdC90WKDZ7g7Hk4k6Yqx+WWYQdO+8r+k8UXL3nY7BnwRfZ?=
 =?us-ascii?Q?BUq1aJuqvnJ4PrvdHX5KFyeEED+uMOrmG5KUqLuZIx3Z6kSN1X7k6YcFIccS?=
 =?us-ascii?Q?IKf7B7PUR3+7k/PGHBWVSkW60Hvf/ffcrQLKmpTXH10K0FGspXaw8v+9fPEn?=
 =?us-ascii?Q?bQXqsV5DKZbqaiTnaghOtqRvP9ufWkMCHVDqFxAbhoD/ery7tDsjrNFRh8Fh?=
 =?us-ascii?Q?PDgSz1y+umhMwCYTdmUlh+r8KEOaVTxxndG0aSXWLO/1jJ1BAYkXvQqaEuHa?=
 =?us-ascii?Q?SKkPROeQvBiZ5GlqkIGAVR7DxAbGVLiTaymPF+z/rNr/w3HMHv/3q9i+/C9/?=
 =?us-ascii?Q?rMZFhthIPOmyhjFfePQ/keADAGr1eFuSlKDEec0/cHH9XDb+O4Uuc37aowT1?=
 =?us-ascii?Q?pURDtMgIwhVSjSUDRS9it5APed5CaQuBrs940eIMtQP3bjn+h0EqRqYi6Yzt?=
 =?us-ascii?Q?63DVb6+gIL+FzSX59vtj2V6G/oAmGYdfhAe1VBsg+djTGYUZ0p8I7XTwNfG6?=
 =?us-ascii?Q?KD+oWBJnrcqjvrwfwfVu1oT7d9ymbLJvGuaB18ciTPpUxMhtuyZT+wiBolm8?=
 =?us-ascii?Q?xFI/FishlwNQ1eOVhPZB8hxZX5lXS0PeV/hKqeOtagPagkhWjXhMHRzVtr/H?=
 =?us-ascii?Q?+iGezQVtGDOVi88Kmx35MkTWQWdhxfkZEauoZlz/KSMIRRYRE5SvSZbl4Iuz?=
 =?us-ascii?Q?6qLYEUClbiBrypNOvRGMq6R1e5gDFapEcmizxpFziK1STvgkXn/VmxXhl2C1?=
 =?us-ascii?Q?AVem4Rg+nA+Wv1ZFFNG6YwpcU8O1Bcqz5hWgwuLGIiq4inb/lLRHeoEwbDp1?=
 =?us-ascii?Q?pZKJZPCP3mb7r2e5VzzyQkKsKSSiaO6LHUUlnlTKK206quhQmsXi5kMqgXEf?=
 =?us-ascii?Q?OFD390tuMUkP6N7TyQUqX6mX/DoaZmcEocCfrOxRuBViwvSs+9GG5Oq8zcnR?=
 =?us-ascii?Q?NRdKk6MX3Eyu+L4z9OfJhIsZi6giNbQ5pxZ6B0XytEZvWIexsj5VOgLSYuWt?=
 =?us-ascii?Q?ztaLm9dU4kN365Af2G5g3fJrf6KYZJD6aId6uE/Y1ZVnM/o027zMQu26xP0E?=
 =?us-ascii?Q?xg/y3+EH+4qWbTNM6IpGSS2D2u7UtGUDIg87iASvtlM1U4om672lB+N/yBKH?=
 =?us-ascii?Q?tC1LeQvZjedrZ7yhWhRqG7z8UGzlnpMCT3ea1sX3LTxHkMA8IRhxeLH0fEMX?=
 =?us-ascii?Q?upMc9jrGibDkh6uT7T8eJ6weHMOJIXG6PAaaSo084XxiMpR/rdvx12EKyssW?=
 =?us-ascii?Q?E3hJOAHlJU23G/vgzcWgMSBWwHDbnTlnsBikiDNpQWCc5jpVGAb+C6uY20QK?=
 =?us-ascii?Q?bnh6FvgtUeE4DySDMAZUeBGhsNdb57fOC1UDfraj66nuaksjkuqUrRqSwoXB?=
 =?us-ascii?Q?Af5snQwkjm8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5h5lzGBL2tF7a3kF4rz3oy8PI3rDwX0VYEf45XVLfLEq6xiG+e4zIoA1xy/y?=
 =?us-ascii?Q?Df8+ptWTQ9W4UiTK8+NrsrPgaze7ottXGcScuh50czm1nfB/EWyboWnPHdMf?=
 =?us-ascii?Q?VEImyUFX8LJEjsh5nWAieUjgs5L6yyM5vq99XQBTxiZVmgUsSf5ZGvooBtCQ?=
 =?us-ascii?Q?pJqm7A1/rkBjxsx7snS4IeB6ICHZBdlM9YXtrqaljLFS2Sec4CXqnosyOiJe?=
 =?us-ascii?Q?P2KwBj4BCeQrQE9jZvhAaLkfIRuTFt3mv6JJwr8q6eKqj9/f/i5YQ0DQD/DR?=
 =?us-ascii?Q?vC0qUor8h4+EjdIJlA9NUfASUVZYkSp+v8z/v1VNwHs3kG5GdIbAuIJGEVic?=
 =?us-ascii?Q?gfbe9MvJyE49+SSBmDyICUj9dvo1Nvsv02A/knhZW8DfB9LHMkxxY5niWzYX?=
 =?us-ascii?Q?U1j7sPTD4LGe0ndXbvjievevECEZIDiOh6H0rb3vnq3ZB7kZxPUkMbh1dVkU?=
 =?us-ascii?Q?8rBbKp625IJD3OaWq48V5MvupnBJEfLbuWmPL7VwsvtNB1renJNnVNebnQrt?=
 =?us-ascii?Q?83XZbgVVylHvdZ608VL/EQkjjI9IWuzjaZI/QrLi0y/EvIARAEPiN+i2BLAu?=
 =?us-ascii?Q?deiKjK3/t68RZNwXTP6WnbOZAg31Cu+YnmZdIK4RiP915uXpvb6I6Sv5VjSs?=
 =?us-ascii?Q?XumTE0z6GNyEP7XFgRuY1pqxeUh+QJQFaHxSOKHhUbjlaQ56ef8dGimI42Ll?=
 =?us-ascii?Q?LUn5ZbuJochkvaQ/OXXeBHwxUjgt9x1u1nkd0yAevzdEFnUhO24Vqwiz1Skk?=
 =?us-ascii?Q?V0wPHJs0HZX8RdqrMJTyxWiReNcpiF9geX9rzBhesEYtgWzVPaCw1xv10Zuu?=
 =?us-ascii?Q?KuW4NuzfPqXIOoKEt3d2dsIqCDNARcTDgNXKg2qe1p0nnz8CBoVlMOY9xAkC?=
 =?us-ascii?Q?DosQDhdJfqh5qrlGUG+IjPwUNcGQSXQdh4w2rEIOYuVodv1gdnf/xBsJyF2U?=
 =?us-ascii?Q?tSX8SWC+EgStB5bZo4llizeNVKnjzV9a5MQmjaWL8tRq23CTC8k3wTtpAVBd?=
 =?us-ascii?Q?9q0JcKLxMzkxGfUhmyfzEzUnyvvQRBN3mh+fcXPD36+XtQJuyQvXpaUCvPpn?=
 =?us-ascii?Q?qCYGPGiTuap1gBjixxXj22hKLBiOP0+QLCUNPOgYMFsyXi9UFF3Ew/57wtcc?=
 =?us-ascii?Q?Z7KeP3oomOLDsULRrfGqhiKb0d0/YtZPhoy4/EX2yR0G0pnK1dymthiRKnv6?=
 =?us-ascii?Q?5WkttDwBS6dDtQHNBIxFlpQGXCD2ka6qA4o/+5Vdf9KDZ+nVyCWOSsSs44n9?=
 =?us-ascii?Q?EG9rSAWGT4PWySIknAfuHCq21DgHP4viRWnme0hIaoOz+KwhcJRxjVXyu25a?=
 =?us-ascii?Q?A3lYcfAmwMMB2+RFgHX9k9G2Z6gvO4ZHuKEA+UxzDckCoP5pbaRj757RzngQ?=
 =?us-ascii?Q?gdSMM+dcAyOFg7yqMnmLJVTnhr6ct3lC1ABJDOsBK87NzdnHba0qBji8nat8?=
 =?us-ascii?Q?wKUu4zzbwGjqK4hja2uKkSu+TCQ/W6mNnWsZgwtUWBJ5DG3pyrk/hRn+3Fxm?=
 =?us-ascii?Q?7K2TepGbc5H2tomVjT70kRLIqqIjBbYvcT6WuFmDC2VjLudOUxSJdWqm8YJ5?=
 =?us-ascii?Q?91Kulcqse8leFKQzvM7nlHRKzg8Uhj+clvmGu+JNtypqoXVqWLEL2uoRtM0a?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9029a80-e411-4d5b-1e74-08ddf08a5e01
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 16:52:03.2175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8avep1jUZZPkaVD25VAl8jfT7tmCL8kILSomjUcUS6KuO2aG/Pz21Xwo/QuCotIeOI1WO9q8hdGTF7lmVHQZaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6059
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

On Thu, Sep 04, 2025 at 02:44:38PM +0530, Raag Jadav wrote:
> In preparation of usecases which require dynamically enabling GuC CT state,
> split xe_guc_ct_enable().
> 
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c    |  2 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c | 34 ++++++++++++++++++++++++++--------
>  drivers/gpu/drm/xe/xe_guc_ct.h |  3 ++-
>  3 files changed, 29 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index b3a6408a5760..fd82eef8f372 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1355,7 +1355,7 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>  		guc_enable_irq(guc);
>  	}
>  
> -	err = xe_guc_ct_enable(&guc->ct);
> +	err = xe_guc_ct_register(&guc->ct);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index e431ff73227c..f2b2db780e53 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -504,7 +504,31 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct)
>  		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
>  }
>  
> -int xe_guc_ct_enable(struct xe_guc_ct *ct)
> +/**
> + * xe_guc_ct_enable() - Enable GuC CT
> + * @ct: the &xe_guc_ct
> + *
> + * Set GuC CT to enabled state and ready to send/received new messages.
> + */
> +void xe_guc_ct_enable(struct xe_guc_ct *ct)
> +{
> +	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
> +
> +	smp_mb();
> +	wake_up_all(&ct->wq);
> +
> +	ct_enter_safe_mode(ct);

Where is the  if (ct_needs_safe_mode(ct)) ?
This change is not mentioned in the commit message and might have
implications specially on initialization and SRIOV flows?!

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>


> +}
> +
> +/**
> + * xe_guc_ct_register() - Register GuC CT
> + * @ct: the &xe_guc_ct
> + *
> + * Initialize and register H2G and G2H CTBs and enable GuC CT.
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_guc_ct_register(struct xe_guc_ct *ct)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
>  	struct xe_gt *gt = ct_to_gt(ct);
> @@ -528,13 +552,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  	if (err)
>  		goto err_out;
>  
> -	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
> -
> -	smp_mb();
> -	wake_up_all(&ct->wq);
> -
> -	if (ct_needs_safe_mode(ct))
> -		ct_enter_safe_mode(ct);
> +	xe_guc_ct_enable(ct);
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  	/*
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index cf41210ab30a..c821517e87d0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -14,8 +14,9 @@ struct xe_device;
>  int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
>  int xe_guc_ct_init(struct xe_guc_ct *ct);
>  int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
> -int xe_guc_ct_enable(struct xe_guc_ct *ct);
> +void xe_guc_ct_enable(struct xe_guc_ct *ct);
>  void xe_guc_ct_disable(struct xe_guc_ct *ct);
> +int xe_guc_ct_register(struct xe_guc_ct *ct);
>  void xe_guc_ct_stop(struct xe_guc_ct *ct);
>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>  
> -- 
> 2.34.1
> 
