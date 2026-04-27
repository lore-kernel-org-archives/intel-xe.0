Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B977FF8867
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 22:11:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145BD10E963;
	Mon, 27 Apr 2026 22:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QKhoMd7N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4987410E963
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 22:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777327915; x=1808863915;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BCzlG+yzmif4mN4LfF3Pb/IeAeBuKIwlCfz/0r3tK8Q=;
 b=QKhoMd7NwvnDL5bsO/ft7W9q1dgqfWtHfnBv/REZqXYehpY0mgsl0hzE
 2LBFwgfAMg9fDprbsv6Qrxmr6mqJlc3AlUAnzxCazcbVl18iO/8OL/96Y
 DzO0zpYFQdNtpG8tDQv+BHpKuiwaW8Og9Y+bhV0Cwb6inZCgAFOnA1Ru/
 AGAalViM4pe/DaGWic0JHnzCNSoTdkiGiX1RXU0N6EeOv5IcPaf8n1rNH
 XJtAYGma6o1l5tmH1R4y/IDfYGHSgdaYbj3lFAiizeO5VI0ZXCe5BusEX
 3zwnLRbJsRpLv+WB406esB9HqQqZaVLKRYWcfMz4neZCYccUypbX5j45k g==;
X-CSE-ConnectionGUID: 02JwSYF5S8aCDrb6iXHFTg==
X-CSE-MsgGUID: TXOZSNiBS5WNKvBwPktW6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="82092968"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="82092968"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 15:11:55 -0700
X-CSE-ConnectionGUID: j4Or8W2GQhyv6fti5YlJ/A==
X-CSE-MsgGUID: Ew3Yx4HvTBSxs5YWYZtvLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="257301272"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 15:11:55 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 15:11:54 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 15:11:54 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.10)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 15:11:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRw5DoHR4oWLRj4Wj/9PqoLTMbRhp8u6N6fKvUfpSkRCh0A+EtM7Jbgcdiv5A7QpbdYqTz7mNHR2eTJCBFy43elksSatInGWTWe+BNgXV9h/vi2zst1WY/KdD1TZvEQB2RU2nHIdwhbCi9UbulDFJzP6EaE1Puh66v6vUcgy7bK9V7TidcuiEzVcN8oKfkLcV7BuzmNa6LNsbc2M+yL/FrD/wxm9KYdEaM1kMAcvlAJYzMCQ+jUPjJ4HaAo4x/mSkcLnvYZgWQso61DDsqP+sdmB+4vpvOEjK49oXmhpkCtYyKZhZ2xPCwVYExNXt/OfW3S5LGhetXtMFIphWsN7Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VX4Rn1CumrTBE5NINW4dN2g+i5YWc7KaBj2IPy08fNI=;
 b=DAkV24NeP/0wuGBM8a4CEYYgcN3gd058SGH7SfnphA+eWeR9dwRn/v0dj5D925hff5mJf7hccryl5+rwVyQTtVFZwUqjhSv0U+uKCT8cSD3czcn6goLYjt5mr7PaAYV72FBXdVSk2f68vVnc0EYP0XaedAhI6zSWpQyZSJ10AdLxPaQOha65AlujtKyDJi1uxmyNsdBwvx24M6ELnqapvThAUG1Am6XyksHw9TzhwTmkbI+weUjO6Mf/At2jSfYXjvizycy1ocQaKoqq8T8HEuPFqxvdBSCd4mCCxP/hIChC5fwVuOB9P6vSplUsrA/ffWsL3yIMzm70JFeWz4fQDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Mon, 27 Apr
 2026 22:11:42 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::79a1:7b0a:45ee:cdee]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::79a1:7b0a:45ee:cdee%5]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 22:11:42 +0000
Date: Mon, 27 Apr 2026 18:11:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <vinay.belgaumkar@intel.com>,
 <badal.nilawar@intel.com>, <sk.anirban@intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe/gt: Drop redundant forcewake
Message-ID: <ae_fG5yyH5jyXztd@intel.com>
References: <20260427092928.1181893-1-raag.jadav@intel.com>
 <20260427092928.1181893-4-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260427092928.1181893-4-raag.jadav@intel.com>
X-ClientProxiedBy: BYAPR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::26) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|LV3PR11MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d5f6843-6393-4432-172e-08dea4a9f673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: pS88aAqJg/C08TaOUlbSyP8tzOGNShS4yzpKev1xEH4hpvy+gGVBxoz8Gi6vXmjPLGVAcjGuGpX6hr2S2mTzPtCChtyvAJBhx/wkMaEjdGXjYqPxfSl9Lk7kB5kQWJ2O53747HDuG4TwEbLFFbABAv6avVjGaEY7zv/ZKPouGltEe+L2FCb5Iym1DmGzjT8VZn2lhnfPNNr/hJzdfj0KrE60seCeArYVzqRCvpGTTk09d+bQGzsmIua4CtRlj8+D2OPouwWsVtPDW8Su/tMRiVrcpv/9o/v4GDTurbWbIQFmulgPgkhYprRTbgoiEa/u18LIY+qcUKSy1p2Er2iBxT2GR/DeOlQsrOaVt5/P55xZ4y4WOz93w168UiP11OV7v3q17WY2o0gq2d+m289ZW0Yjl3uMyd5Har/E8XW6iFodKwzC5MlrJlP8MQmpsS6ZbxwKjTOmXT7MZeaZT/GhoHb02wdO7cgX3tqN0rsgp7jA3vNQahV0MUw20uMKiHYBBHV7ZNF5LajZZdiV8F2wyonDgvP/lfPilr1ryy2SDXeYJq6rZKzA1nmgHdZEjzRrNGIqF6tO/PNK44mHRn+9KvKgwQpBiZcKaY1uS0w0Wwy6l4lhhQXbR3lrYE1V1fv11bs3qfPp7t/LP3eXafBB1bY9MGwFExPN+HI9PZm71gZRlwSMgYUjhzPeI7YoZMvO/IHcxB2GuHkieM9FPXGdHniSaAccwvNHXelsOzzWW1I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8sfwin9FXiXOovmKQYXNfsRQ0SqytAZbSB67X1fZmsc7Pzr/0fTnDdaHqmo0?=
 =?us-ascii?Q?SktXWmaIHKcsMhm568/L5d3bO6Abav0SkGp/ikCEWdb7pIF2fFkKvcwa1M1U?=
 =?us-ascii?Q?S+vwVKw1p4T9SMbYv2oiVUnkcY2+C1O4HJakdnJ4vYuQg17aH2b8jAsx9yzY?=
 =?us-ascii?Q?1BUGkaXW+YUSXamhtBB3XC21N4Xd2pWx3N7ZUVldADqB72U3To656B4KUMpX?=
 =?us-ascii?Q?GNCSkvAG+gSTbggk78/EjOKsszhpaJm2eEBC1x9bAmKt8f306hnS37lLRA9P?=
 =?us-ascii?Q?1KuEIf68gABQtDYlXiXTx7cMF6sqp+zHLSB9JOMW5Su+GCzT01Qi87btwWgt?=
 =?us-ascii?Q?8mKUFV8DycipG8jiPVu4icmJx3GqtXQNDnhHCBA+dmGG9d6btO/+3/gMv4rf?=
 =?us-ascii?Q?jnrqxi4B1C7KTmGuoNwIhZVrKCMh/J2/sXwpf8Q3q+lh8yyOVRt4sZS+4gPj?=
 =?us-ascii?Q?b4Hqu1ddvkJfsD/+HqSem8uhm1HnNFzikgRAN+WUmYCxCW7Pk9WhS+nU/8op?=
 =?us-ascii?Q?NjTEzkeM1YgigvznEoQ2zNJMKthu7XtlOt8VjEUqqoXshLKrZTMwyWuxFni/?=
 =?us-ascii?Q?jAqN7VlGNh5m9sTfIZ0JAaXiAFkNtG4GVck7F9JHf1UXA4FAdNRUdnN4c6n8?=
 =?us-ascii?Q?+mNXTzAiSt0W//SZNnkVWsu/HSsFZUSpaJq3sH/fXeQ/A1tOmeEftELgS8sC?=
 =?us-ascii?Q?mQzveo5VzL1UPi9czgymyTj170vwvg/d1QyLF+966+evAWaVMcpSrgiCVoJg?=
 =?us-ascii?Q?xSsthAxUDGH9lVU8yVcTfYZQxaZlurJL1pMtaqDSi8FtZm/PgtUx5Zu9BUBn?=
 =?us-ascii?Q?hiibjSoUcHqVXIJxo4BQ3RQ3ffm5nIQHY71FO+LYuZhNx1y7a68s9B5rdVfr?=
 =?us-ascii?Q?6z0PwNe2tEdZosCEyCnHv4uBFovdem9DmpwnwtEetG8btckmytefNw9DZiWc?=
 =?us-ascii?Q?VmmTCGEjznKm56nFWjGazuw3yGbYYxTIiuomTPDcNPD4UHzRXzoAZY1bHbOT?=
 =?us-ascii?Q?GOD+81WJgyVwHXTSsvKfNapVkbICWYotDLmYMP4qjrodejpFFohOI5Wa42xx?=
 =?us-ascii?Q?Ziuz+PFAyGZHzemAPyBCZOF+Grp9rXKcGvQPd6AfsXqNxRCn+frbOLLmM/iQ?=
 =?us-ascii?Q?aahJkhjLBbArNJu/yANKryEn7QjTMbsX18MeuP43nNxkNbmX12Nce61rfOmj?=
 =?us-ascii?Q?H9JGOVCG68UD9T54POipl7BOeOJGAykjjXXzRzCjY48VPv4BgSuPtbhqnHzL?=
 =?us-ascii?Q?4xzcPxAYAZbYyNOMJNAdlcLsM/IMelIeSOK/D3X7rubzIECq83gjZiPJEuoU?=
 =?us-ascii?Q?DuQBH18uNA3xiIvuj/4aWxc7rI9l5SZEebQ3OXnx3D1kODhwDbk0B8+4vIPo?=
 =?us-ascii?Q?RZrHKrGLpOvA7zVkuUSghG9MrmcYr1oYsYuvwmvUzphj9PGrm8PASI4K4kkd?=
 =?us-ascii?Q?MMoKsFz7Vz+GVJzcajUhjS5/4Ixe23aN/ImnF2OEY2pvEImWTY7z2SmpERoR?=
 =?us-ascii?Q?su7zbWLYxIyAHY5gGG/csV7DdBQH/BKyTbVt5cKDo1OPUxYJJ307soag0PQD?=
 =?us-ascii?Q?tvqW8ucfeXfSJcY8wTdrCT1hMeKJIh6PN6PxERDYY1rLi4wA53orfhLjKN9R?=
 =?us-ascii?Q?UE3dOAdXXecpg06ZhBaeXE+h6LqzaNrrhyyn4OGcjAwFsSz7gp6We9QaeAEZ?=
 =?us-ascii?Q?gKPROaD5q2pjpRP5icT89NPOHu9n2fCa5LdZ72vO30rpOiH+sRpi3ZaKSSty?=
 =?us-ascii?Q?TxPXsJKEzQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: p0vvRD5AztcLlYy9jVDt6Jil2SWBuJdTTQNtsGh8Rey0dUwkKy57C2driQziBH94//sUCO+5Rbl7VQqC6FDH68G8a7+B6RSoEhSLecDw5Bn/ZJ3BtXQREXFIbRgKLahoTl9qvnEUFOgc8vBVpfJfgQ1UEQFCCocY9R7CVdqiRN07phhBddIrBatCmSl4PODErsaYJACd60b2MDDLrZbhoUv9zKz8ddPn1PCfKkg1hmO4DG1VfhFbbwk7ett3ckKP52rxpeOuvhFU/C91E84OAoI5QNieLb3L7irHO1Al+qiehVz+xujZXab7hIeznAa9L7x5zLuHvxuWfREnCxmhsw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5f6843-6393-4432-172e-08dea4a9f673
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 22:11:42.6944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SXgK8BwamXom5r5eTq2R7oELvf4vybNWHOCjjifgP2hH6l9snLOmqpEa5rM0LsSVUXUXYRv+alejRyam+57OIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8602
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

On Mon, Apr 27, 2026 at 02:59:28PM +0530, Raag Jadav wrote:
> xe_gt_suspend_prepare() doesn't perform any MMIO operation that requires
> forcewake in it's code path. Drop it.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

it makes sense... for a moment I thought that the gsc work would require it,
but it has its own forcewake if needed...

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>$

> ---
> v2: Expand commit message (Rodrigo)
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 3c031175f737..e5065f46c748 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -1027,7 +1027,6 @@ void xe_gt_reset_async(struct xe_gt *gt)
>  
>  void xe_gt_suspend_prepare(struct xe_gt *gt)
>  {
> -	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	xe_uc_suspend_prepare(&gt->uc);
>  }
>  
> -- 
> 2.43.0
> 
