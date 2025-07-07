Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C69C71130
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 21:35:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9AF10E03B;
	Mon,  7 Jul 2025 21:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZTruMlC/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513F910E03B
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 21:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751924115; x=1783460115;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YTNkMGINRqoVjSlG5MpjJ1OyXNjQ8BJIdq5AJ/fs1Rs=;
 b=ZTruMlC/TlnJ9M7sr3ThbWqUkSaRR7clE3i4XWPiolBE/nRe4u8v+bEz
 vqWRjnCf1YIJtDnjELnQg2cGePGxqbCX8NbVFBsn5i+w5PTMAYOvd7Lrm
 IXyooG1XJ+5gujCsICtfxrx4qkteuDW36iDiW8eOzYDgBKijUfe7U+4kt
 bz7hphBa6x/nxw4OkGi4ZX30HzHZ8v4ShpOLpqZDrmRq2m1WyWAGY8TIa
 RtafxzZZ/F0AXmuE7Wf2tIpRLNa51ODKTpFybGmZ2v1I5m/xDHEBcOY0G
 JMsqYPhuymmaeDwDwAurI4qjXXPnEBcczRjUeo+6rOpqU9BEzXVS2PqRM A==;
X-CSE-ConnectionGUID: byl6w/6bTymw1xviO4SZqA==
X-CSE-MsgGUID: cbsFeHHsRXSAl5RoFGJDvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="64844969"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="64844969"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 14:35:15 -0700
X-CSE-ConnectionGUID: a6pTIEDdRc2L/RigOAEXWw==
X-CSE-MsgGUID: F12HY0rdR9SZe2TzCADSog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="186272089"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 14:35:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 14:35:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 14:35:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.82)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 14:35:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=By7G5LNplckH8EdycYRCOTVEYu8fSWw/12jEHkvKqcz5PdbVbWMUZa7ainl9whAhvrqao6rA9r53ISMIsAzeZ2sWlcNpjChVc2f6/j7MDUQvqNl3iYGVJZCG4+pwX4PmeT02UgFMslk+VsKIMsStN/Rjh9UDSiFmwaYlB3Jo2y264ajeiN6VVA3nbot2vsKAkYh2PQnfdABIUSQJFg1S0aDEy/dIHU7j0BNuRcR5oSxu6KKx87oNyMrePSMycpEkQiagVQ9EEPOmvX6aueLIhxcNXzCnipBO5SDgb1LcHft2o/JqZVTkzxCQqi5j78wWEeCZOzh1HUO5dq7GFZ5wJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0utC+s6Qk9gyyG+jl6DW4Yrlr3vSOmtprnZnhHwn7/k=;
 b=tjdgsaKv7ljqjpC39XZLd6WfWzDXco71czYyeWYlErGNHKBZvOHY8z8mffKqjG6boByNLDSyLOHyteKGmuKfz9g3p39TOLd5pZB7E1AG5lpQ5ORIXkNZQmjsHBNJKrvpR772yo4fGfAC6VAPOixfb5oO22MhrHI+u+d5qYFWNVUKNcJD5xI30o5aJe1x+rdWHELNiGHo4nBrgbysJPpQ0of88D1ms1eyH3GoZmunKHfdn9VqUpwn8yHOur8ex1u6QDA+GOCnE+fl0kfDxCl1YCjhksw+AUlf9JDMjKNrvjEmQN2NR8YsHqOiKpAxlSimOwa6kRkk55DxSoEareInOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Mon, 7 Jul
 2025 21:34:57 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8901.023; Mon, 7 Jul 2025
 21:34:57 +0000
Date: Mon, 7 Jul 2025 17:34:52 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/ptl: Drop force_probe requirement
Message-ID: <aGw9fMCuksw-pPoE@intel.com>
References: <20250707201959.319406-1-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250707201959.319406-1-matthew.s.atwood@intel.com>
X-ClientProxiedBy: SJ0PR03CA0090.namprd03.prod.outlook.com
 (2603:10b6:a03:331::35) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|LV3PR11MB8508:EE_
X-MS-Office365-Filtering-Correlation-Id: 996f5487-f307-4d92-261c-08ddbd9e1e7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G3RslA43i2SmXwAitw9TKbvSKuLiQSTofWQlK9ruWosWGfzchQpSf5RLMc4z?=
 =?us-ascii?Q?TwQJedjmJF+SjmBN03EdEYJe85NfxlQ+GsoInndAx+CkwAmhO53PdGrL0IqM?=
 =?us-ascii?Q?XEgIpv1HqMBTKf3foguBEoL1IX4Fk2gzxwGvaBEauKBs/OlUnf6NrH2pTWsj?=
 =?us-ascii?Q?IzAaTxbFL9BwTKrlXLdhuU4n9aQZi29r4UsYc0EFeEpeGqfBAKoMGaNyFNc6?=
 =?us-ascii?Q?j5EYFFZc7f+j8cLByeHuG9u+kvtA8qdvdR9bXMm4TtjHN6ZAuDRL1waTwS75?=
 =?us-ascii?Q?ZBpgqlgkx3tCmqtJtLzahqlTWUUo/0weMnkzTFZWp02MfOvNQQ+fwxCDEBbU?=
 =?us-ascii?Q?7TN2Qr7xt2GSssEP4SL4eHhwPEzs2OyrGBwA/7ECklISZ++S+X4ghI1rTxTC?=
 =?us-ascii?Q?TIH+bcqClhok+lDOhJN5Nhupe6/9/UCMcXZGk1mUW5mPS2dcBhpbwpCq6W7e?=
 =?us-ascii?Q?20izbjD8VBGoiTA+tTIACdBnqIVJH9OGJYb7Q6OUEY2mi6E/nGPPDSZZe0qN?=
 =?us-ascii?Q?IdsDmflL/VkUx+YjLbiJSLAckYP9enySoumCNlw0OzGCuiCe1n3rJVRJS2yZ?=
 =?us-ascii?Q?xlXKuebDL6SpK3aoI1hGZrYprJK7A+mX5M1jraEW+ge1z/j5rsCMH7oMaqQf?=
 =?us-ascii?Q?9Vp+29fwLc2k55l85V2ZCM+ajEnih0qF3eFASdhX7cUu3FQe+mCNQxGIHVoj?=
 =?us-ascii?Q?b8T+i4Boy8wa8p1npoDFBOcAoGH+JaTctqECfEvOsmB7xHO3/EE0tB4gjYKx?=
 =?us-ascii?Q?litKGL63SxCVpDAa0T50qtR6K5/PiCDR7OXGK4u1MJ4ydZLyEOHMpxMxobpG?=
 =?us-ascii?Q?jkdkJvBjBw6YSyhvFUbikqY4V+hqxsuSM748u9qwRimUjWNGVSIZ+GAtW4dG?=
 =?us-ascii?Q?pVxMwXH+5Eha4tj4sJB3qE39DvieycEYmDkYWOA4kmX2ajbH3FGMcVrAWWbL?=
 =?us-ascii?Q?0+Vngmku9h1jiFGwvj3Y4NbDlD0IRpGhlaEg7zvFWcz9Q4vxhV1VizuT9aiE?=
 =?us-ascii?Q?4UW2KhtWu9AEoDzAssWxeS31UwDnNHIQ/Ti1dYn8nuthf/tHlnCpsF2sR0zZ?=
 =?us-ascii?Q?8iUhb4zlgClE7FI3UIwAfskXC/5G3nftE2iUmFdYD3OOT6bSIw86hiEvDuPX?=
 =?us-ascii?Q?WNpU+EbQUCljEuro6Uj+x1aInOw+1K8qVgMYDmwqpBZZh4XKYOca7mg9Rik8?=
 =?us-ascii?Q?rWo0bQVR4R47E7VUf8SUHSrU4psymBwcMBviKknhuFNX1MVQogIutPClrSR2?=
 =?us-ascii?Q?254J12WW2X+V4F4J/L2466L4FrXbTIjNVDnpKdys93W1w7rAn00f2utK6QRQ?=
 =?us-ascii?Q?awbm1QdebTmqGnqrrCQE1ax/hToQ6IvLFLyC+Fv+rd+J4S0VP3EYrz7bpMK/?=
 =?us-ascii?Q?UdRZ7aaJavcDpxwL/VmsrXFedaiD1wp2/11pUaknpO2tDcxZ0uhUw+exm7SL?=
 =?us-ascii?Q?CxwX8VI/xjc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CdUJMSiXYL/uk38IkMm6ZaYbQPmz9IE4f50wH3nP1k+Kp2GlW/5EG8dOtMQ8?=
 =?us-ascii?Q?9aqsMT4ryv2odKIi1Iirg57f8Co78WpxGbFS9jaaz0DLcKFUsrz5kMiXsLkm?=
 =?us-ascii?Q?yQREmaA4l4pIsUpMeHz2GWD3nAnLetGrTnL8hAs4PV4Ycffn2U0UqM/cWS5v?=
 =?us-ascii?Q?/RrvWhLEPyKQxVgokCHT5SOA9TyzoXQ8XmdkDlmIaJwQ1KO/je+687YNXIXR?=
 =?us-ascii?Q?D21JLPsvLMfnL3mbYS/uTKExRh+mmY/9dm0Mqug0nvpbWybtQrwnK2zzZVev?=
 =?us-ascii?Q?DuMVhZQdoOO1wNQnRkQfoalLZ/g6nmk7JMm+BfOIdLmFL4y85yHEfoK/0jbr?=
 =?us-ascii?Q?X0kc65X6BejUnsUxchEObHH+RLFDsXRPu9tz80sqZowR+wuAtp1S2cXCMFgM?=
 =?us-ascii?Q?nHA0AQgIHBaL2pnq85C0FXoGfIZRKhERgNhzQNDoFybG6AZxilHI9I1DL6Tm?=
 =?us-ascii?Q?uxYM51q1dmq5TqadwqRk1Y/I6jKFp8oxHMyV3cnn1Lvrmk+9yzL2V56RyVR+?=
 =?us-ascii?Q?tsOTbabHzfFvvAUEIlB5uj0GeMGw4H7d5P8mJognCMh9w/9A0ViM8aDd+Zk0?=
 =?us-ascii?Q?I7FCZI0qmxhIjetVHWIEf0PAI0jzLNXEnGv6rDLlzCjqNXUluf87+5qUNOob?=
 =?us-ascii?Q?XDod0ugqmzM7eyoyqex/5rJjwyDZmWO44EK+IPlJgEoamUErVzz9pddvIol7?=
 =?us-ascii?Q?wRAnlAlrHUtlO7SP9Mt5uhN7GqLMnfoJsfesyNSjCCS5y+sTCZPOheVeLW0C?=
 =?us-ascii?Q?WmZC2ZAkLr9UNFr2kqXcT1DP6w9tBF6VMefR2Qm73QmfdYssG/Eh7BixZEDf?=
 =?us-ascii?Q?EZX2YfC1mX6h7oxAUz9P1c7kmzwUBxvFY11CJxhkc1Ijfn9a1UVtK/UMdg8M?=
 =?us-ascii?Q?aKZrzK19HHvRcu4aqaGjF34fc5DBLjs99votf296F5nljICEuaHVT50DFn0d?=
 =?us-ascii?Q?jAm4Ilqs4x2sJw1jJ4khDznjNiGyQnqtww/QCw/vxLYe5Eat096CRCzsVXPs?=
 =?us-ascii?Q?pADcHLUYGg5ZNAuak3sclw7Sd1MKSbLk/+pI4yrRI3mfvDFKkpONYxRYKK0v?=
 =?us-ascii?Q?WoA/9ktVr7B57WlS41AMZuLVYB8/KiPCI3TsH09Q+f3Hppg9CT1yF6hzQdiA?=
 =?us-ascii?Q?7WdGYLRuDDlnNeOOkul8Hc6JOZE6IzFMVX77+0FEGRrzVoSqx+Xs9N8uiwGD?=
 =?us-ascii?Q?VuODVZHZqLyT860eHqDhsXOugsmM/dRnw07FLKry41K7Y95E6ndlVN5Ko6yq?=
 =?us-ascii?Q?GIRZRORIuxcZmOhBLrM+0PXmQo05l7BNz89pFhprWomLsgl2mcvIVs+x+mH1?=
 =?us-ascii?Q?46WPS9nCau4EauqDuBGRQadUtVXRgITKOI4Fgqt3GeDrtiODhpmRHA0o3A1f?=
 =?us-ascii?Q?86yIZj0JUeP0ugTbNm1AMSh2iH8ju43D2b8bgfSqUAxbNewfg2+OFGVFFjzL?=
 =?us-ascii?Q?d0aIKu6EO1WzuUebX3vJDQjJO4NbZl8CAmG4Zhr3uyuZ9EzTzWzHsM9cKFqX?=
 =?us-ascii?Q?0axB/U14yBgwv8O4duUmp6C/JKZL/EPWY1sZKNt9YiCa+4F7ZVDr1HP57jIQ?=
 =?us-ascii?Q?3F+U1b+kyKf3OOGd9jCtYrGfO4/R+9BqQaVHd/T30nUrwiWzqR+u6QHNWGLb?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 996f5487-f307-4d92-261c-08ddbd9e1e7a
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 21:34:57.2604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I7AFzs7kljTnM3oQN7UlAS3sf8nmqktmZ1dAMXjUojuA5haXV61rv/KcZFKIUiF2up03Mc1VIcm81eXswBqjPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8508
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

On Mon, Jul 07, 2025 at 01:19:59PM -0700, Matt Atwood wrote:
> Panther Lake has proven to be stable through testing and use.
> 
> Remove the force_probe requirement and enable the platform by default.
> 
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
> Panther Lake is running internal CI for the moment, but running upstream
> branches. Tests show all greens and work in progress to get the machines
> approved for moving to the upstream CI.

I was happy with the internal CI views that I saw last Friday.
And I was almost acking this patch to move it through, but it
looks we got some regression there that is blocking fw loading.
So, let's keep the force_probe protection in place while the issue
is investigated and getting fixed.

> 
>  drivers/gpu/drm/xe/xe_pci.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index e9c5d3150efc..ffd6ad569b7c 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -341,7 +341,6 @@ static const struct xe_device_desc ptl_desc = {
>  	.has_display = true,
>  	.has_sriov = true,
>  	.max_gt_per_tile = 2,
> -	.require_force_probe = true,
>  	.needs_scratch = true,
>  };
>  
> -- 
> 2.49.0
> 
