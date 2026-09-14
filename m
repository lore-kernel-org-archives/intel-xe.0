Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BFAC88E75
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 14:52:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C6710E2D1;
	Mon, 14 Sep 2026 14:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YDC9gw4l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1068C10E2D1
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Sep 2026 14:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789397563; x=1820933563;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=swyY9W0CTM5xZAnxeO5c6+x3JJHvlzv1MFpQ+4bmbjI=;
 b=YDC9gw4l7KxhApbzfRZF/DZMwbhLe2+7VHvaGzdh49T6VVnPIQrMceAq
 y29MQ++K6XrA1fnrv3HsjGoLVGD8is3GRX1dg7bkY5qxJQOb03Ao3GFjT
 /uAGPbhJqw3KX5uYmGVUcbLG3PJErBDNZXZnFwIss1JzyvCj1lkzegd3b
 FJ+hAqk0hSybaWyxDjBVPDOXRYRJu+ul4MisT9CdeENVlWi0cY1C9wCcc
 lJBRPgt71ULGfxG1BNiCDbmuG/vwzWrfcK+i7N/n/3iJsjbiTTqE3yW82
 mhcCfqe3W/RhLIEtPIic/BjivohiVlJmt7DhUO4dkv5D3hyRai+DEritt g==;
X-CSE-ConnectionGUID: tkfVXj0CQ5yGh9Ru+0R0+Q==
X-CSE-MsgGUID: EoTsS6j9Tpu38bFy+X/1/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89792608"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89792608"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 07:52:43 -0700
X-CSE-ConnectionGUID: 7Fpw+WWBRXSaL24DXPdbmQ==
X-CSE-MsgGUID: 8QGkWaVZT2qFeHPrevrBng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270854199"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 07:52:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 07:52:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 07:52:42 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 07:52:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iuArsBwm1/nSOR+3s6R3cL40/iD4tItcbcG7Oma04GY/ibbAPigsnfckqBpp+VsIbohipadrNicwgtjmV1khtJVm9wSyja8KMY5pCDBaJIXD9AKvRlK6EP1DD+dqRa50z3P+6jTNpxRu4DAfuJlNiDZ939C4SoU8T1v7CdxIGh4Pg7uEx6Msw2tUJKWOaYvSDvM0Set51uQ1T5KQSnMRCBjPAriguStc9lo9JPhqbhbdw81EpPNiLnB1/5mwkFfoy2OAp4DDwJCpxYlOJYu/eQjDKNTwT2ByZ2L4QDW3o6YaV0d63srLA3NuJ3tI+WJqdT4uvnDRlEGpuZXyhYIGTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6krpRrNMeeiQKm/B1KsoMVNPS5KSf3LSwtuCCZ6i/A=;
 b=mbmAFaqrNBIgZ7ZoTEXyHNKf/fg0Ddtf0zX/sEVF9BMfMOjd3FEv22Vaok7AfreT3fLXuIPmJ2UdgjQAp0S/a9YagImf9f76hWihI12b2di8kcYGfE3wlNxMAuPV20DPMrSK8kIFXMYUg/JhjH1K9T6e+WIQw/BuUhv9YrYiyiSzxBkbg9ozEmNOS0hDf9LnBMcwlitI3mv3MLpmeh16FfI2KlBJ06tnuMcJ15ybHJ9cR/TtoRp5Cwoj5Nnff/ZWSUO5eQawFuPAvZsFcLYHxl5EO27Tnc+0v1RZ1zHf5xE6k9o8892K+vzZU01mqkabd7FylKCiolrzto/d+kguxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB9774.namprd11.prod.outlook.com (2603:10b6:510:398::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Mon, 14 Sep
 2026 14:52:39 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 14:52:39 +0000
Date: Mon, 14 Sep 2026 07:52:37 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Raag Jadav <raag.jadav@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= success for
 drm/xe/i2c: Disable IRQ on unbind (rev2)
Message-ID: <20260914145237.GC730887@mdroper-desk1.amr.corp.intel.com>
References: <20260911121547.2407261-1-raag.jadav@intel.com>
 <178916071195.153190.10119393923868898710@61270ab9df2a>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <178916071195.153190.10119393923868898710@61270ab9df2a>
X-ClientProxiedBy: SJ0PR05CA0096.namprd05.prod.outlook.com
 (2603:10b6:a03:334::11) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB9774:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c78aa79-9d11-41bd-fd05-08df126fd1f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|4143699003|56012099006|18002099003|11063799006|5023799004|10067099003|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info: 0QX1pOvn0341R4XewGfM08ll37sd/Zlv0x04ICZcZ1vGT7C9ZPf2wQnZLLTwJF6WAiqPdLQ0t54mhlzii+MRFbglXJWUD2TOt2dMTiBWTrdQ4Ahfd/QFTIE1Oq1Ms34YRpu7zBu96jC+k+0CsbZoRByCOWYMXVPF7szlukZxDuOlQbGrZry7DTGAKu+cqml3MdW2XbDnzbfn07nJlePjq6tfHjISrGfQXE0ZzMTjlquPMo3S1GF3uVgamVnLNR4149bBVsltT7UvCG4rd7LdqtMFbqsoOMdSMe1j71pdk2oUoRO9QeFpHsXGpddw+DpHDCmDC/GySkmsIk7lXKRO1rVn/ke+68k3LLlBLRD1VzL459mOKFxp78aEwmHPUQMWL6YGLG5bdfmv1xj90irG9gbT7/HHAZGP++Tsz+0jxU5MRMaJhVEy0nH0h1ECV4VhBsLn3uq+F8dkwbHFxa9DK8QPpSIX1HwsuFEct4ZWKFEoM5e5XM80iZPBNI2G9HS7tYKF8pNS9Dkk1HX80OSBMSY+EJVwzpzIaX61hvw7axjCYubSrJucXDulVvzfiIOFegw9zyFZIBj1CGVggrzW2bqcsUuYGUPXQUCy82Dr6k5u72aF0c5lM77u1BWy4QeT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(4143699003)(56012099006)(18002099003)(11063799006)(5023799004)(10067099003)(3023799007)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tCngm4coGwC/ZJCRO9IlbjlJYuG2ekofGHEu966IrB8OKLziYGbIsIg4hIuU?=
 =?us-ascii?Q?tSmyfDq7LAJBHYy+y61VpMHF2QO67qZlMwCMJVj6TQJMAtl1zCKWFB0OFRwG?=
 =?us-ascii?Q?lzcCrma+ZkDloxYlCizwHQwfN4gitpGMmC2imby52J/n8DCuIpuGU1gxEbOY?=
 =?us-ascii?Q?Gzh2W+DQY4cwbUC99oUdg8S2kgCN6YnFcebDKlxWP5uD0gOo+4lfdh1JF/3W?=
 =?us-ascii?Q?4a3Vk3jFpAp9KiywgKzuPOAyEqiO9Ep+b6v+Wcneo8537OxOivm33PYIpchP?=
 =?us-ascii?Q?VvH3/qndY9Tg0d4Nffu0ErEAyHftgeMHg3b2E0QUN3rrGkSS58NqCGE3Xejx?=
 =?us-ascii?Q?4yMvXLmK04oaXkSFc7GQoW01WO0pqqjkDJxlCYnX/vlv6+zxQvWGlbBbohfj?=
 =?us-ascii?Q?v2aFiYJv+226kiwzzRxWMYLzYYYIB480FdybeBxm6NZdSSR1nKv8zVp/OFEj?=
 =?us-ascii?Q?DkjCICr2LswP+/7agSk1uu4zCjLRwfrhU8NZyf6zd84SDYzad45RxAg/Ckxv?=
 =?us-ascii?Q?/Q0nPNEDN9E4+noinkvMyTWNNHTbtQo0X+RKUIhX89yYadtjxzTa/28k225g?=
 =?us-ascii?Q?HzY9GwRlLXdEU5coTi8ka9SJQyNpX1ViNj0SPK/r8iWqxQjFfDOsKNdaB3te?=
 =?us-ascii?Q?mkxUj+ggsM98lZ7IR4FIO3+RJvkfZ5wacPnuec74083wJmpvbEByxHgonML0?=
 =?us-ascii?Q?haTCRj9vg4NqjAQWZAbLsSiSyiy1QymmvciF8HcyGF7oofmsPZcN7+s+0kT0?=
 =?us-ascii?Q?aymeT2l9sAjQcocDBhqhiSH7Uymul35C7cT4VA045HJUJ5NfS66dIBvWoRLU?=
 =?us-ascii?Q?ghLmth4aAdfED5U8F3GMOVU+A7TAllC3pHjToGHkZ5JXGoa+XGdhbW3np9FK?=
 =?us-ascii?Q?PLR7nb75ANtEb0BVG5/89oSm8N3ri/JzHRBpYNWxKlrZO7up9bRpXb/GZU34?=
 =?us-ascii?Q?o0yqgU9p0YVo53m17EE2EDN1HDyfMM8U9ERTL1StoPS2j0M9o7SwAPSl+IY9?=
 =?us-ascii?Q?ObH6PU6aSw5or2sDlkMPMIAcpDLxF8+Lly0rgDyYivdA/TuO5shzApskZZR7?=
 =?us-ascii?Q?jvDW8pbYxYLRptZpOo3H4Pm/rZ3jy3lySAQ0vSm3Rf+kKMCHYAGILIzHikxm?=
 =?us-ascii?Q?JfIEmA0EM5Q3Xv8c/UqVG6T099mal3hSMvJy9wl3Ymwtw2r2PUjD2vZ+ng3k?=
 =?us-ascii?Q?XBJskMRYlmdiz5bRQnJcogkMp3aa+2AmvM9JSDmOfTPQD/dv6letAXF5khMV?=
 =?us-ascii?Q?E6Sm+lhJl6a8uEdXue+i5HvLKTbkwCVQTMIbYcvdshC24upeST3kzVdwi7nX?=
 =?us-ascii?Q?KOKoKm5uPmVah8gtOAGzEBes+lF7zkle+/ltBZsinXZSyHyRTobPQCOjRJ1/?=
 =?us-ascii?Q?VYaOGSh3vF7URU8FC/VMEBD6BgAkT6BToZgzZlwprwEUxSttMabfIvUBkvIb?=
 =?us-ascii?Q?9fd0GcGhmYII6NTowfxv6icwUCgFOEaufnyr9N4jhK12On1+OJ6cd5xApUZp?=
 =?us-ascii?Q?Xw7bIti8mI2MydcIqEWVZ8kzZ0J1b0+c+50ZHKOQ55vNvs92C4NuDhlIDDlu?=
 =?us-ascii?Q?6qf1p0/kWT/DKKKs2AhSzb30ISTua1S+AkOOpANIWEPMOjy/o2wJE/EkMJlL?=
 =?us-ascii?Q?/0r3/QkBiV3f0Gt6dlctRvUfae9dyKKsIui0PqoooHvF0hnaOmQ5WK7E106e?=
 =?us-ascii?Q?CjqpjaxK8v+tW2vpW5Cl1Ilcze6GAP7JHXFEmLsex6NvPxFCm67j9cz9pJLY?=
 =?us-ascii?Q?nTm2mAKr9LH3MXBFuqpuZTHMa3hkKb0=3D?=
X-Exchange-RoutingPolicyChecked: Fd+R8wbw8qgmU33yKQRORuxD7FUQS2CbeRo/Zwi5aegvLPZ24UWoGQAN3bvys1luS12Liji/IxQXULxRAOFfPFAk4+pFd/GgnIOs2bOT5o6AMz5v2mNjK4s5DMGAN8BSb90/OO5MBqzitZf/sqCQ+XK+RhRkF8hsVHXGczP36W6OEqDwn/tDmfb2RBC2Qq60CoXk5f84p98iCUeK45LwSVYp+Of1a2U1fowzAnSmJsHTZtvO+RAvv/TqZTkh+9F5S4Q3hch5q6Rjy/sBS8VNd6HcCN6mi6swM1QtGr9vnL5cLEITiJ6J9NfP7/0oymYowSNXEA/aFjyi8jfph5BYXg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c78aa79-9d11-41bd-fd05-08df126fd1f9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 14:52:38.8729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0u+rSedkFpbBVC7jYnJCBsSuc9H/GJ1APoDgf+ceoY6OkYCFcZAtiFe9qQLTYnYis8bGFJM2Wgtm78d2fKRhY6nmb3X4dGvAJ+8qpj9kiEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9774
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

On Fri, Sep 11, 2026 at 09:05:11PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/i2c: Disable IRQ on unbind (rev2)
> URL   : https://patchwork.freedesktop.org/series/173827/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-5729-4feddc7851e5864772806fe62781a1937b78494c_FULL -> xe-pw-173827v2_FULL
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
>   Here are the changes found in xe-pw-173827v2_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-90:
>     - shard-lnl:          NOTRUN -> [SKIP][1] ([Intel XE#1407]) +1 other test skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-2/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#1124]) +2 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#1467] / [Intel XE#7367])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#1124]) +7 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#7679])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#367])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-target-2160x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#367])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-2/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2887]) +2 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#3432]) +2 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +7 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#7008])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#306] / [Intel XE#7358])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-2/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#7358])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#373]) +5 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2252]) +2 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#307] / [Intel XE#6974])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#6974])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-2/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
> 
>   * igt@kms_content_protection@lic-type-1:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#7642]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_content_protection@lic-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-256x85:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1424]) +2 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_cursor_crc@cursor-random-256x85.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>     - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#309] / [Intel XE#7343])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#9009])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_dsc@dsc-with-formats:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#8265]) +2 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-2/igt@kms_dsc@dsc-with-formats.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2373] / [Intel XE#7448])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_flip@2x-blocking-wf_vblank:
>     - shard-bmg:          [PASS][25] -> [FAIL][26] ([Intel XE#3098]) +3 other tests fail
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html
> 
>   * igt@kms_flip@2x-plain-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1421]) +5 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_flip@2x-plain-flip.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-bmg:          [PASS][28] -> [DMESG-FAIL][29] ([Intel XE#7774]) +1 other test dmesg-fail
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-9/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#7179])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#7178] / [Intel XE#7351]) +4 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
> 
>   * igt@kms_force_connector_basic@force-connector-state:
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#352])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-2/igt@kms_force_connector_basic@force-connector-state.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2311]) +11 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#6312] / [Intel XE#651]) +7 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#7061]) +6 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#4141])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#7061] / [Intel XE#7356])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-pri-indfb-multidraw:
>     - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#6312]) +12 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2313]) +11 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#7865]) +19 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#656] / [Intel XE#7905]) +27 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#7905]) +33 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#1503])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-10/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#6901])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-2/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_mst@mst-suspend-read-crc:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#8348])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_mst@mst-suspend-read-crc.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#7283]) +1 other test skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-2/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#7283])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#599])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#5021] / [Intel XE#7377])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#5020] / [Intel XE#7348])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_dc@dc5-psr-suspend-resume:
>     - shard-lnl:          NOTRUN -> [FAIL][55] ([Intel XE#8399])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-2/igt@kms_pm_dc@dc5-psr-suspend-resume.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) +2 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#1489])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#4608]) +2 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#4608] / [Intel XE#7304]) +2 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1.html
> 
>   * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
>     - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#2893] / [Intel XE#7304])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-pr-primary-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@kms_psr@fbc-pr-primary-blt.html
> 
>   * igt@kms_psr@pr-no-drrs:
>     - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1406]) +4 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_psr@pr-no-drrs.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2330] / [Intel XE#5813])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +3 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_setmode@invalid-clone-exclusive-crtc:
>     - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1435] / [Intel XE#9142])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html
> 
>   * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#6503])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#330] / [Intel XE#5857])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_vrr@lobf-dc3co:
>     - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#8397])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@kms_vrr@lobf-dc3co.html
> 
>   * igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:
>     - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#8866])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-2/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html
> 
>   * igt@xe_ccs@vm-bind-fault-mode-decompress:
>     - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#7644])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@xe_ccs@vm-bind-fault-mode-decompress.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many-vram:
>     - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#5191] / [Intel XE#7316] / [Intel XE#7346])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@xe_compute_preempt@compute-preempt-many-vram.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-small:
>     - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#6540] / [Intel XE#688]) +7 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-2/igt@xe_evict@evict-beng-cm-threads-small.html
> 
>   * igt@xe_evict@evict-small-multi-queue:
>     - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#8370])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@xe_evict@evict-small-multi-queue.html
> 
>   * igt@xe_exec_balancer@no-exec-cm-parallel-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#7482]) +13 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@xe_exec_balancer@no-exec-cm-parallel-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-userptr:
>     - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1392]) +4 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-userptr.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
>     - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2322] / [Intel XE#7372])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@atomic-many:
>     - shard-bmg:          [PASS][77] -> [FAIL][78] ([Intel XE#8578])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-9/igt@xe_exec_fault_mode@atomic-many.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-5/igt@xe_exec_fault_mode@atomic-many.html
> 
>   * igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#8374]) +1 other test skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:
>     - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#8374]) +10 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm.html
> 
>   * igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr:
>     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#9003])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr.html
> 
>   * igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:
>     - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#8364]) +5 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html
> 
>   * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr:
>     - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#8364]) +22 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr.html
> 
>   * igt@xe_exec_reset@multi-queue-cancel-on-secondary:
>     - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#8369])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-2/igt@xe_exec_reset@multi-queue-cancel-on-secondary.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma:
>     - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#6196])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset:
>     - shard-bmg:          [PASS][86] -> [SKIP][87] ([Intel XE#8589]) +91 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#8378]) +7 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-2/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#8378])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html
> 
>   * igt@xe_gpgpu_fill@offset-4x4:
>     - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#7954])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-2/igt@xe_gpgpu_fill@offset-4x4.html
> 
>   * igt@xe_madvise@atomic-cpu:
>     - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#7980])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@xe_madvise@atomic-cpu.html
> 
>   * igt@xe_mmap@pci-membarrier:
>     - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#5100] / [Intel XE#7322] / [Intel XE#7408])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@xe_mmap@pci-membarrier.html
> 
>   * igt@xe_multigpu_svm@mgpu-concurrent-access-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#6964]) +1 other test skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-2/igt@xe_multigpu_svm@mgpu-concurrent-access-basic.html
> 
>   * igt@xe_page_reclaim@pat-index-xd:
>     - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#7793])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@xe_page_reclaim@pat-index-xd.html
> 
>   * igt@xe_page_reclaim@prl-invalidate-full:
>     - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#7793])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@xe_page_reclaim@prl-invalidate-full.html
> 
>   * igt@xe_pat@l2-flush-opt-svm-pat-restrict:
>     - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#7590] / [Intel XE#7772])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2236] / [Intel XE#7590])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@d3cold-basic-exec:
>     - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370]) +1 other test skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@xe_pm@d3cold-basic-exec.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze@gt1:
>     - shard-bmg:          [PASS][99] -> [ABORT][100] ([Intel XE#9093]) +1 other test abort
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-10/igt@xe_pm_residency@gt-c6-freeze@gt1.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze@gt1.html
> 
>   * igt@xe_pmu@fn-engine-activity-sched-if-idle:
>     - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#4650] / [Intel XE#7347])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
>     - shard-bmg:          [PASS][102] -> [FAIL][103] ([Intel XE#7992])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-3/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
> 
>   * igt@xe_prefetch_fault@prefetch-fault-svm:
>     - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#7599])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-2/igt@xe_prefetch_fault@prefetch-fault-svm.html
> 
>   * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
> 
>   * igt@xe_query@multigpu-query-gt-list:
>     - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#944])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@xe_query@multigpu-query-gt-list.html
> 
>   * igt@xe_sriov_admin@sched-priority-vf-write-denied:
>     - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#7174])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@xe_sriov_admin@sched-priority-vf-write-denied.html
> 
>   * igt@xe_sriov_vram@vf-access-provisioned:
>     - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#6376] / [Intel XE#7330] / [Intel XE#7422]) +1 other test skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-7/igt@xe_sriov_vram@vf-access-provisioned.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@device_reset@unbind-reset-rebind:
>     - shard-bmg:          [ABORT][109] ([Intel XE#8007]) -> [PASS][110]
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-1/igt@device_reset@unbind-reset-rebind.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-2/igt@device_reset@unbind-reset-rebind.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-lnl:          [FAIL][111] -> [PASS][112]
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-lnl-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank:
>     - shard-bmg:          [FAIL][113] ([Intel XE#3098]) -> [PASS][114] +1 other test pass
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-7/igt@kms_flip@flip-vs-blocking-wf-vblank.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html
> 
>   * igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset:
>     - shard-bmg:          [FAIL][115] ([Intel XE#8058] / [Intel XE#8528]) -> [PASS][116]
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset.html
> 
>   * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
>     - shard-bmg:          [FAIL][117] ([Intel XE#9096]) -> [PASS][118]
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-7/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-10/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-bmg:          [SKIP][119] ([Intel XE#1124]) -> [SKIP][120] ([Intel XE#8589]) +1 other test skip
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
>     - shard-bmg:          [SKIP][121] ([Intel XE#2887]) -> [SKIP][122] ([Intel XE#8589]) +2 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-9/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-bmg:          [SKIP][123] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][124] ([Intel XE#8589])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-9/igt@kms_chamelium_color@ctm-blue-to-red.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-5/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-bmg:          [SKIP][125] ([Intel XE#2252]) -> [SKIP][126] ([Intel XE#8589])
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-9/igt@kms_chamelium_hpd@hdmi-hpd.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
>     - shard-bmg:          [SKIP][127] ([Intel XE#6974]) -> [SKIP][128] ([Intel XE#8589])
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-9/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:
>     - shard-bmg:          [SKIP][129] ([Intel XE#8265]) -> [SKIP][130] ([Intel XE#8589])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
>     - shard-bmg:          [SKIP][131] ([Intel XE#4141]) -> [SKIP][132] ([Intel XE#8589]) +2 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:
>     - shard-bmg:          [SKIP][133] ([Intel XE#2311]) -> [SKIP][134] ([Intel XE#8589]) +10 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
>     - shard-bmg:          [SKIP][135] ([Intel XE#2313]) -> [SKIP][136] ([Intel XE#8589]) +7 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
>     - shard-bmg:          [SKIP][137] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][138] ([Intel XE#8589])
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
>     - shard-bmg:          [SKIP][139] ([Intel XE#1489]) -> [SKIP][140] ([Intel XE#8589])
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-9/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr@psr-sprite-render:
>     - shard-bmg:          [SKIP][141] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][142] ([Intel XE#8589]) +1 other test skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-9/igt@kms_psr@psr-sprite-render.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-5/igt@kms_psr@psr-sprite-render.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [SKIP][143] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][144] ([Intel XE#1729] / [Intel XE#7424])
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][145] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][146] ([Intel XE#2509] / [Intel XE#7437])
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_evict@evict-small-external-multi-queue:
>     - shard-bmg:          [SKIP][147] ([Intel XE#8370]) -> [SKIP][148] ([Intel XE#8589])
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-9/igt@xe_evict@evict-small-external-multi-queue.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-5/igt@xe_evict@evict-small-external-multi-queue.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
>     - shard-bmg:          [SKIP][149] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][150] ([Intel XE#8589]) +1 other test skip
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-9/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind:
>     - shard-bmg:          [SKIP][151] ([Intel XE#8374]) -> [SKIP][152] ([Intel XE#8589]) +1 other test skip
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind.html
> 
>   * igt@xe_exec_multi_queue@max-queues-close-fd:
>     - shard-bmg:          [SKIP][153] ([Intel XE#8364]) -> [SKIP][154] ([Intel XE#8589]) +3 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-9/igt@xe_exec_multi_queue@max-queues-close-fd.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-5/igt@xe_exec_multi_queue@max-queues-close-fd.html
> 
>   * igt@xe_exec_reset@multi-queue-close-fd:
>     - shard-bmg:          [SKIP][155] ([Intel XE#8369]) -> [SKIP][156] ([Intel XE#8589])
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-9/igt@xe_exec_reset@multi-queue-close-fd.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-5/igt@xe_exec_reset@multi-queue-close-fd.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate:
>     - shard-bmg:          [SKIP][157] ([Intel XE#8378]) -> [SKIP][158] ([Intel XE#8589])
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-bmg:          [SKIP][159] ([Intel XE#2459] / [Intel XE#2596] / [Intel XE#7321] / [Intel XE#7453]) -> [SKIP][160] ([Intel XE#8589])
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-9/igt@xe_media_fill@media-fill.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-5/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_page_reclaim@many-vma-same-bo:
>     - shard-bmg:          [SKIP][161] ([Intel XE#7793]) -> [SKIP][162] ([Intel XE#8589])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-9/igt@xe_page_reclaim@many-vma-same-bo.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-5/igt@xe_page_reclaim@many-vma-same-bo.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
>     - shard-bmg:          [SKIP][163] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][164] ([Intel XE#8589])
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5729-4feddc7851e5864772806fe62781a1937b78494c/shard-bmg-9/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>   [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
>   [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
>   [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
>   [Intel XE#7008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7008
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
>   [Intel XE#7316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7316
>   [Intel XE#7321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321
>   [Intel XE#7322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322
>   [Intel XE#7330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330
>   [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
>   [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
>   [Intel XE#7346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7346
>   [Intel XE#7347]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7347
>   [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
>   [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
>   [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
>   [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
>   [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
>   [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
>   [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
>   [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
>   [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
>   [Intel XE#7453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453
>   [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
>   [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
>   [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
>   [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
>   [Intel XE#7644]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644
>   [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
>   [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
>   [Intel XE#7772]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7772
>   [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
>   [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
>   [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
>   [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
>   [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
>   [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
>   [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
>   [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
>   [Intel XE#8058]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8058
>   [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
>   [Intel XE#8348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348
>   [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
>   [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
>   [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
>   [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
>   [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
>   [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
>   [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
>   [Intel XE#8528]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8528
>   [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
>   [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#8866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8866
>   [Intel XE#9003]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9003
>   [Intel XE#9009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009
>   [Intel XE#9093]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9093
>   [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
>   [Intel XE#9142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-5729-4feddc7851e5864772806fe62781a1937b78494c -> xe-pw-173827v2
> 
>   IGT_9092: 9092
>   xe-5729-4feddc7851e5864772806fe62781a1937b78494c: 4feddc7851e5864772806fe62781a1937b78494c
>   xe-pw-173827v2: 173827v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173827v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
