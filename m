Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D93C02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 02:09:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2840A10E036;
	Tue,  4 Feb 2025 02:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c7QHhMQM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299C210E036
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 02:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738634971; x=1770170971;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DXJbMA8uzyG2lx9/4dajI/bh/fohK6aRS8MjAW2/8Dc=;
 b=c7QHhMQM5CLPgJ1h8ivghm5vCYBgTJb6FTI18DpyFYAMQoSeLHi9Hp8a
 r7K6+EanJYbrxyScB0NDyFspgWlbQWL0uMmtJ+fvffckMwTUjhzTGLFnV
 zLCrwozp1WtEuBJ9TQFkJCj/RCrVrMieo3MtU0jW2E++X82be1NG6z7gv
 IQlrv7abB8XEgy5v9CHVSfv6v7IMvXrltDCaSsFjtDk9qxfPkvWlSRD8T
 XAKqRFzLZKP61qPtBe05rwXyGZ/ovMsCaLlxqrmmzSiUroOAneGTOxgFd
 iL+oJVf5GukmFvYut0UibtSBs6RrwlwgtSpHD9oRNkUhoHv8fGYp2BIdl g==;
X-CSE-ConnectionGUID: VdazjsY1RNu8yEUwR4Ek4A==
X-CSE-MsgGUID: p7IZBbqfR1ynjyAYuW7wYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="26749873"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; d="scan'208";a="26749873"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 18:09:31 -0800
X-CSE-ConnectionGUID: FNohgxzdTqO6TsBzOjJP4g==
X-CSE-MsgGUID: ovBeKbSKRYKHJ5/zHNRjdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110923124"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 18:09:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 18:09:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 18:09:29 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 18:09:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmymhRq7UQdE7HfUTLg+GOFNVo+8SoBHAjev1Ld10PvWM942Kfxe7OTsPpuWWsgG/aTx8N6/UHCxisErvIX9rP8dk4TV4sHwTFFU4NPUlbFXUrf+jFuqFcZ1gZ78v20Nn/tUe9Nhsr0Ri4Tj+JOFgyS+dAfjVCLdSOACIACGxJLBDdgn07+2fmsiSh6IhwxJjj0PWPIGCRLnx6Y+LeZZMAT4A2q23pSgkSHhAMLuUhi95hWr6b9LUMx3Y/K1FFNpelsmjwbpa5shb4bdSO1hw7nMR9OtUcB9AvAXh9WETs7iHtrB2G2pe086bL+XhLOoO4MtsGqSs1iqjjCS+BRYgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtZdXWL/yYznM1pAasT0rbjP64DjDJuIg1JmpRNHeXk=;
 b=ninuCDsmyDscF32D10Fdtr8W/Kr6EM3XqOJkSrcguXVN3MDk6uRcePVPRTWTeverAzjZS1UAbx14WpBasuZarJT3g+U9QKoiphMR/Ts6idzG5mXzTO6sbo1d7Z/cWNER8doWkf2vMufV51fiQ4UpRTaaI+zrU6hXM+lmD3SzbHyKyK/w7ccyB9GkaZ5IJEbivROrATIw7YL+emFWt/4mHzvftJRvZHYPUifgyGx23kPLNRqHJcyRFn+EKD5bqsCvP1F61fYqwYHgxv+DKKm0emxCH4aSFLMnpdrE5ZzZLp3nO3U43XX2iFoEhutHcBsR18c3KVVAB6Q3vwq1B7Xhfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6732.namprd11.prod.outlook.com (2603:10b6:510:1c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 02:08:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 02:08:47 +0000
Date: Mon, 3 Feb 2025 20:08:44 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH] drm/xe/pxp: Fail the load if PXP fails to initialize
Message-ID: <6lbx2mzqn5m364zeduv5jym5ciiac2afmcizyno2dnhhn4xraz@i23dqapak2ag>
References: <20250203234857.1419637-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250203234857.1419637-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: MW4P222CA0028.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6732:EE_
X-MS-Office365-Filtering-Correlation-Id: 0babe88e-7417-445a-0f78-08dd44c0dbc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3jgBCrY8NYBbTNy0hdDgcjuYkUc8Mg9oKlrMqVI9tdht0cD0QgGaB7PwAcuA?=
 =?us-ascii?Q?f6M5AxuQC2bszRXJolEU/blLzNnkydM1zL0J5eshpWBBoEPPHbC7QJhsxQna?=
 =?us-ascii?Q?426Yum0BwmrKKHWiY2dFBq7MgZ3zF7h1V8sWay/zNa3rc3hitoyWpJjzXZWn?=
 =?us-ascii?Q?MjH6yQovridENGVdifX9xX0JknbyuAFbtxJia7MedAjNZh48MK1i9G7Bl/S3?=
 =?us-ascii?Q?GTb+2BVUk5tY7pPKWEPFxgV0A4meVWv+gOMb8YybO13yedCYTWHegcYOrM2P?=
 =?us-ascii?Q?2DjPfqSLzWH4sNBwqYUJTXihWqjWIfHwjAEiwevimeilmSZeq2B+BwkmlbOB?=
 =?us-ascii?Q?mFjwJwwGyHiL2NEfNZjObRTqMskl464L5Xs9SXxpYyL+gWG0IDEnv4rw8a5b?=
 =?us-ascii?Q?pvTJmxTNfSUAUXZR23xyArfsT5b/jnny8ThVTowYRLybG2Wz2CqBWVx9CSDP?=
 =?us-ascii?Q?CuG88Ev8x2VWICiZMVhknz1gTR+N/CWdg3+ffC2TV7KE4yq8+3Hq9hu8ZFvl?=
 =?us-ascii?Q?4H/y4L/nv4CYKqEG21vOH0OKGoKB+e/G+gT0X2x7u4y7cHc9RHJD9h9v6q+p?=
 =?us-ascii?Q?gud1sMcosx/jYBVThCMQQ3f9mY6jQGB335iGYbzFECGOJXxe3xt47XQD4atR?=
 =?us-ascii?Q?s88mh9ekImIH7S8L/EDdbBJWRa4NYzivVSD2i8hFbT/PCNup9zLZGEsVO/8h?=
 =?us-ascii?Q?13mSTfc91PDWejurowDPY3dzjYIhi6YOEKQ74hpq76kz9U5VhUnKBf/AvIkO?=
 =?us-ascii?Q?fbrv9qpPlUVASH6Ch7YbgvWzBIcX7KwaOL99XqWOggb++4C715zU6734LBm+?=
 =?us-ascii?Q?PLMx04wRC748eN685niO1oPoFYjSo0SmuI/db5zTHQmxGiWyxuTlgeqpsKem?=
 =?us-ascii?Q?gn8vRnPuy6dDVUSRbkPgw1fZ6EpzSTwHYXl+b4N/K+3raPeOslsRDwZHj6Rn?=
 =?us-ascii?Q?Esd5xFN1oVSK73LFf7N2EhdNOIA/0wplptq5w2VlBJwMnOL5tQq6xkOgrA3t?=
 =?us-ascii?Q?kCVods6TB7B4iaHNUfR9KTYicP/Unkt4fiebT8Oi/myau81u1pkNggc06Esf?=
 =?us-ascii?Q?kyNqf5nb3+h+J4neUarK9kbmK3tuFdXSBsGnLAcZO4PSKCMZajGOHSG7aa2K?=
 =?us-ascii?Q?kGrvc8ZFZvKUbv8pQNlcIqPu6fF5ZHTAs99w2n+rYc6WzUuMecybQGqNlzb+?=
 =?us-ascii?Q?Db4/NXvwHxSs7CfzlPRTchOQdsWsk/e8rcD4LFtfeBLD374jWvVBB4d2cBN9?=
 =?us-ascii?Q?Zv2Ix3LoqwcIFOoEoLhBL1qA3gVRwfsAxWUDNcKMyYzsfthvkA8NMNy1toxK?=
 =?us-ascii?Q?Y3nAuKmp79UdWCsDeEJzXadE37rGBXFGjB/WLr4JgRqPuXmtATOgcVca+p7v?=
 =?us-ascii?Q?HlKZPGBI3vDowpSdBGWlh37aLWTS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vGIuJPC6wmPh0FebmLfeGQr+GoIwMMOpu/VS6eiJopAZxnd56cmqZNdbVY5j?=
 =?us-ascii?Q?Fu5+YKlxChB9Mwwz3N02d3JyMtP+8YSnP3M2O723Jk7tkCzKQ6tKuhWLSiH7?=
 =?us-ascii?Q?QwuiFejr8rNn9MNl2MMCfN02J0RDWr8SK5y63Eoa8TPyNVkV/c1BKx68IK1+?=
 =?us-ascii?Q?PG6RhdMSLdYj6zazGektrpGVxE7VocCsqVSkZh1kikoH/55Z69Rvc5Px9YRm?=
 =?us-ascii?Q?CGCBqCcMLD2iXo4gPv9s9tcEJ0XNf2iKBOsBfKOdaekXm4Vtpdv2hhQJv8ki?=
 =?us-ascii?Q?lL6+9cBUJqX9cn5UpppyeLr2ROsnADhdPsUr4HpeX50LgVOP81OjGI6PDk78?=
 =?us-ascii?Q?af/YVEPUSMla8gykvOyGoKOKcYtaHZ6gWRnM0LvqUoG37X/I4Ru/NrwRInN9?=
 =?us-ascii?Q?l2ikb0taM/fnI/DRHBPguiMVvQiByAbGnMbVms0O/Wblp/ODFZkwAzlVD/Xt?=
 =?us-ascii?Q?eH8P+EwRvPOVy68+Pc10mxoKFIZOyNEgjFcaJqinBDsI3aHKhfoLXM5sobhP?=
 =?us-ascii?Q?ILpxAOh78ZMQxRVTsItn5VV/xdqwO6cWV8d/DdZ9v7d2R7yTCZOlVCqg9OZF?=
 =?us-ascii?Q?45PjU71tI4U8H3QD2/ZMpe0yS1Z31+NwaIllJXCn3vC5bq1XHXadaeKOy2jv?=
 =?us-ascii?Q?fhuHUiDDRUu+EIAoaTo9YpFlneDJ9aDwVNjFAk/CRfoYwQBxJeCJVF3nektY?=
 =?us-ascii?Q?bm6GT262xK8uSisOCd37DYQeQFkqS48w4JLKsxn2W2Pe9DopjvXQ0aMdfXhf?=
 =?us-ascii?Q?Yxk7DqNM6Nt5FlW2BPlNNd4J3irV5oNps2RnDKe7TxGAwM5HGntao9lwBmiJ?=
 =?us-ascii?Q?z1bOj3fMEaFAZGrL0DnHl+a9mkUnMaKSEMVF5gd6OrAB+gZLutzouckocy4d?=
 =?us-ascii?Q?DVOJ57n9berk8u28QxWEpdQnYNmMNC73hpUR0ka2qYK+WUFKpWLm9ET6Yhai?=
 =?us-ascii?Q?Sxv+fKloI0tKFzASPvIbEmpxY3PLepXI5fuVsl5MRuzMWX2QmGqR862wBLRU?=
 =?us-ascii?Q?Yo75uop+EoopwNeK3YM00m1y6dH0d3/fEEXd7NF9grNDo2AIGU7+iJ9+MEjf?=
 =?us-ascii?Q?Fwi7I0U6Wt0yfU3oozWlB0fdsaXf5XV7gH5uV55jGL6QistCycbFQGnb3H7J?=
 =?us-ascii?Q?FTmACcIj24XbwM8mdPmKl1GQOvgfXHnE9wFj6hmb7pIl6SHhw+4f4ns6XKN6?=
 =?us-ascii?Q?DKTwxV4BJdC25BmHAZ/F9nfASr+02YEmvN9YvqTHHaqbOQ8kx8rblMAVsfzv?=
 =?us-ascii?Q?9GQH+IxBipAjwGobyGRfvUn0xTeJcFRflOFqSdH1nQAYaiJt1P4HyfME623y?=
 =?us-ascii?Q?1mfjdhdx2znxTSQbLqKmy8nqOkIsUZzkHMKMCpGi6NnB1oK/z7MIWm88UOrP?=
 =?us-ascii?Q?whAOaXaWaI9WxsZEIeexXCN21VmXxMDlMRvH7Kb/FtVosvNh+4mJiy5Ad5Y7?=
 =?us-ascii?Q?ovPI8i41RxZvLoW7l3HLM4UJZcE2K66JKVU3qRONql9EJ2zc91CLTA316GgI?=
 =?us-ascii?Q?DBm/1OnyUrL17hk7+wN+jgBCv4WJ/wjgjzChxTi7WiVr8w0wN826UZilAyK0?=
 =?us-ascii?Q?sISF4ZC2u1mgsJcUPrT/RGbUimD4UtZPdekAUDvMaNtFF0LKfBSGs9CPjGZ+?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0babe88e-7417-445a-0f78-08dd44c0dbc7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 02:08:46.9911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D+Fh4s4hCc+mNzYaeIB6KROHob7whK0dFQL8jVTrrnqw85isbq1aw4WSbOhnaLccgQOTcfQYFqnB3HqWLpT9V0WYBHcmoaQ3A/V+g/0B6C4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6732
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

On Mon, Feb 03, 2025 at 03:48:57PM -0800, Daniele Ceraolo Spurio wrote:
>The PXP implementation mimics the i915 approach of allowing the load
>to continue even if PXP init has failed. On Xe however we're taking an
>harder stance on boot error and only allowing the load to complete if
>everything is working, so update the code to fail if anything goes wrong
>during PXP init.
>
>While at it, update the return code in case of PXP not supported to be 0
>instead of EOPNOTSUPP, to follow the standard of functions called by
>xe_device_probe where every non-zero value means failure.
>
>Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: John Harrison <John.C.Harrison@Intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_device.c |  4 ++--
> drivers/gpu/drm/xe/xe_pxp.c    | 20 ++++++++++++--------
> 2 files changed, 14 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 90f6bcc03037..36d7ffb3b4d9 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -864,8 +864,8 @@ int xe_device_probe(struct xe_device *xe)
>
> 	/* A PXP init failure is not fatal */
> 	err = xe_pxp_init(xe);
>-	if (err && err != -EOPNOTSUPP)
>-		drm_err(&xe->drm, "PXP initialization failed: %pe\n", ERR_PTR(err));
>+	if (err)
>+		goto err_fini_display;
>
> 	err = drm_dev_register(&xe->drm, 0);
> 	if (err)
>diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
>index 5e7a1688a771..3cd3f83e86b0 100644
>--- a/drivers/gpu/drm/xe/xe_pxp.c
>+++ b/drivers/gpu/drm/xe/xe_pxp.c
>@@ -372,8 +372,8 @@ static void pxp_fini(void *arg)
>  * are performed asynchronously as part of the GSC init. PXP can only be used
>  * after both this function and the async worker have completed.
>  *
>- * Returns -EOPNOTSUPP if PXP is not supported, 0 if PXP initialization is
>- * successful, other errno value if there is an error during the init.
>+ * Returns 0 if PXP is not supported or if PXP initialization is successful,
>+ * other errno value if there is an error during the init.
>  */
> int xe_pxp_init(struct xe_device *xe)
> {
>@@ -382,26 +382,28 @@ int xe_pxp_init(struct xe_device *xe)
> 	int err;
>
> 	if (!xe_pxp_is_supported(xe))
>-		return -EOPNOTSUPP;
>+		return 0;
>
> 	/* we only support PXP on single tile devices with a media GT */
> 	if (xe->info.tile_count > 1 || !gt)
>-		return -EOPNOTSUPP;
>+		return 0;
>
> 	/* The GSCCS is required for submissions to the GSC FW */
> 	if (!(gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0)))
>-		return -EOPNOTSUPP;
>+		return 0;
>
> 	/* PXP requires both GSC and HuC firmwares to be available */
> 	if (!xe_uc_fw_is_loadable(&gt->uc.gsc.fw) ||
> 	    !xe_uc_fw_is_loadable(&gt->uc.huc.fw)) {
> 		drm_info(&xe->drm, "skipping PXP init due to missing FW dependencies");
>-		return -EOPNOTSUPP;
>+		return 0;
> 	}
>
> 	pxp = drmm_kzalloc(&xe->drm, sizeof(struct xe_pxp), GFP_KERNEL);
>-	if (!pxp)
>-		return -ENOMEM;
>+	if (!pxp) {
>+		err = -ENOMEM;
>+		goto out;
>+	}
>
> 	INIT_LIST_HEAD(&pxp->queues.list);
> 	spin_lock_init(&pxp->queues.lock);
>@@ -448,6 +450,8 @@ int xe_pxp_init(struct xe_device *xe)
> 	destroy_workqueue(pxp->irq.wq);
> out_free:
> 	drmm_kfree(&xe->drm, pxp);
>+out:
>+	drm_err(&xe->drm, "PXP initialization failed: %pe\n", ERR_PTR(err));
> 	return err;
> }
>
>-- 
>2.43.0
>
