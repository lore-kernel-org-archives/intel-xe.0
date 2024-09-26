Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF837CDE032
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 19:02:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7137010EA74;
	Thu, 26 Sep 2024 19:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XDT84NMj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5298610EA74
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 19:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727377320; x=1758913320;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F47YuUd3uO0Bm5l+CQUTMOjONuDrk1qxfDDddkqBSNU=;
 b=XDT84NMj8KtHraa/X8BsXeDhDy09Y0PzwKSv/QSIoFRsX6wx/APVJTqu
 52eF91xatrawDpCJidPSNznw9nEyruwECVxSXEbYbymbhO/stgn/M3a+Y
 nuIkeJXjOnWMcv6byjgwjXiMw5ZGh6nvsNHTPUpUryGJrQzInoX/RZXMp
 05RVIPoAqYNAVTJLrwLUlavJvg8QXGhIvXGzcOdGDrIc42+c9t+9LyaTG
 d+7/slAKzpIrQyXLjtZPFAEJy3dIXGeej2AbMXdw+PyktSOr09o8EWLHt
 P3CBiIpNurU5zEBeP15l/K2N8Kfwz8Ye2ZhHjgkpUVna5rO6cxZguJ7+d w==;
X-CSE-ConnectionGUID: xFx9wuZNR52irgf0cg1/4g==
X-CSE-MsgGUID: 7TKwBzcpR5q5Ov0fJNUnSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="49031875"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="49031875"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 12:01:59 -0700
X-CSE-ConnectionGUID: KKXGKav8S+6WhB72+GCasw==
X-CSE-MsgGUID: VJPe6EBfQneN6o/wEIkwzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="72266620"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 12:01:58 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 12:01:57 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 12:01:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 12:01:57 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 12:01:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X0qn3IaDW+fI9WbWBYCGleznkBsng5KKGmvM+OEDRnbJQVeaOm/SyF4uIPmMV4QPonv/s834TrwStE6ly7fANogGUXpQwJM01XwnxWikORvM0UQH7xS5BKmvLjrZEY38ZYQQb9nKy/FRhc5RvdZODDmXpJ2ZS5eGJD0zJjZ6GPCQWa8lcEgPr7B314Mxx8mnCdgXWfX6PRDKIX2qPV1bDGBs3RQ+ZhYkbVSsGTy5tvBBqegqLjs5d1DpnTQPX8rWArWUapLVbv7EBWXaJ1/dEqWpyRRrJDZtEX/4D11G+d/OrCUg96LilhiwY06A+kg1FohWA5zFS5IYw++vk9Ni7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CeMzi0HOyZSHA+mXen2s+2NV0CB/n1JdLd7hAhM1Nxc=;
 b=w1TDDkzzYiR/2yKG9HZIPs6eXrZq11JCGuWXJn54bzsYb4/uQ/l2M+A9RFsogGNTsKUQkqmldSFn84npGlvvxfMN3kKjg9q+btBQZyR8VUWeja5ME9eXFjHUYNVAY+MQF4kAln3S8PexLWEQD8Yz/cj9ZpO3tBm48h45z1fUOWJmwalbTFtLtoj7yQpDirR11+wLhMbZPevnX9M0UzrNYwS8LJUT2V/vu0xZsJdj1bmTpv8kaMOk2THZ0QJB/Icid/c6IhuqVGKeQ2HVUYwj3R0eGGMAq5ipMzpVZo8RLdDkOp0WAFTTNKNB+x5a4TK7wmYnv+xfSKj6KqWQzICkRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH0PR11MB4917.namprd11.prod.outlook.com (2603:10b6:510:32::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Thu, 26 Sep
 2024 19:01:53 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7962.022; Thu, 26 Sep 2024
 19:01:53 +0000
Date: Thu, 26 Sep 2024 15:01:49 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Restore GT freq on GSC load error
Message-ID: <ZvWvnZELySq67NR6@intel.com>
References: <20240925204918.1989574-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240925204918.1989574-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4P222CA0024.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::29) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH0PR11MB4917:EE_
X-MS-Office365-Filtering-Correlation-Id: f580c515-8e84-4877-2d2f-08dcde5daf44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/li/hqAsPrXxFi+aAYEi2X7ipLV37zQpDoJCYeJFkh74TTWKLKVsbU0k3npG?=
 =?us-ascii?Q?w4gwiYRv3qFk3MmdBUxYXMgkjKeoRFZ4FjciD3YFMAEAwjkfbpzhRvsCsjRH?=
 =?us-ascii?Q?qNzZRchcA67+fQNEAJflFuQmVCHXtGf8U53c20WUVQW8UcnIhm7E1YIv16iD?=
 =?us-ascii?Q?w565fPGczHyyQRiajpXaaiDf65YaDibPtQmhUI/jvt1lCTjpCAW86ajNbAXZ?=
 =?us-ascii?Q?XRWswDirxaYGtA4h7WKD69OJ3dEE25CNzUSIm/TGPI4yKOY8fk1BmL1vBbJQ?=
 =?us-ascii?Q?LFflrRAv/NXEbmZX/ri3Efsmi6OUN5iUmUAnvEQR1HTkZzP224gHaNPwzOqL?=
 =?us-ascii?Q?e4KcxBW37+0ZXH9ObtXcGr631QxDvBwEdKNg02X1RZBQdZGURFzfdy/+Wihp?=
 =?us-ascii?Q?Tw4OJlbybK6kuW6Awk0uBZhtuULp0NUx4OKPKh9aK/NQ0xSOVHsPOt91RLSB?=
 =?us-ascii?Q?T7z4rKud6BIjX9syY7lpSBF5Me+scI/ihZfPKpo9IaINruU8kJeVM/pC+dNh?=
 =?us-ascii?Q?JjB1f1K/YOAMwSZitRWa+55ItzeWFIWGoB2wzS35wpa40lWnOsaS5mYnEXTd?=
 =?us-ascii?Q?3UgsgMKcEV0XRntbYUZil3uUX9+bQnny2CrKGgqP+9hZtxIyNETUh+bZ3nlZ?=
 =?us-ascii?Q?s8dS+zK+F3orhp9Dl65l3250a4O4m4pnUHAzbEBhNWoBKst4m9zYGfftUQA5?=
 =?us-ascii?Q?bIEGGr0Ff5e8DjjxdK0J0MNcDXT4CBy35vAKQjnyEsJa62siUqNjq6Stgqcq?=
 =?us-ascii?Q?1D2M08CKotZIIiZsj//fm1Rh76HfPOdfgHrVdlKj/qjK1d0QaMzNhNQAIFMT?=
 =?us-ascii?Q?odFn84mlPxxCh0xbOTb/5Pcek9eFq+iFT/LOtKYXQAzonySSYybLv4NQN0Xb?=
 =?us-ascii?Q?2OPP5G6QoWAK2VhNP2jHvuXdnufzm12FEC5ZnW5K4EeG4rP23cxyoz8ehGNR?=
 =?us-ascii?Q?6PP4tKnqNZCETUErRwCzwnRlqmRb/ihQ23O/O2pu7P7+tz7MFcujdAC058OT?=
 =?us-ascii?Q?nZFTYYygA9KcNqvfovlewS4YB/ITBBp9naGn+DE+qb0E32uYznvA8thMuK71?=
 =?us-ascii?Q?xX5Lj+p/Qm1aXM9ELjUUDOmB3gGEfv4SYgrcgJJ6cLkxx1kDq4PayIkN8Agj?=
 =?us-ascii?Q?Y3PCFzNJsTnsJJng88Gmex7JfPqeIhOUKwqDDfkeYg6efHciaPL83KBWtaRM?=
 =?us-ascii?Q?+La3Crf7j5KPzyzMpnVJ61tErVFhTOLiFOJOj9KciAoLgCmAbYQIkvKzmnJb?=
 =?us-ascii?Q?Uq7hG3qnja50JCJqNW2/Ln9i8M7OuetG9QDzT3tX/A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3/afLbRZL3DeS/sGTeB2EKX82MQXrw9VF+bg+JtCyiHujkrsfVRv22BPzSdh?=
 =?us-ascii?Q?Aoe0pW16UKtJ4tyM2kvfQmHbbxCjihRs4wSwaVWG+I09Bjst3tnrEWgh0N5c?=
 =?us-ascii?Q?mrXToJObtxfTQsxWAht65vh4C9YVV8FfQ5KeTINTRNTvdhIepqaQFNP+wTQQ?=
 =?us-ascii?Q?kKYqzOre9c/XthB80G8v+vYMtxdmIDyX8/QWYX2bP0jTqAg4AY2eVEAeUrcs?=
 =?us-ascii?Q?LYT2Lt9pycfOqsPAzpZkV5W1VG5m0dkbgKc/tv9+U6Ac4cTEv4BzTf8zj+2V?=
 =?us-ascii?Q?m9A5I2sFaEl93EtOArHUynUU3Fj6yqaX1IxE+ZwdhGpYaRxc6u1zJdNUzW80?=
 =?us-ascii?Q?Ls/sBjNsy+8ZqBH34tIhGFE3ot/Jr1zMxWxHpk5XGTctebs3Xozdv3gOp37X?=
 =?us-ascii?Q?PUJfhbk7WjI0cPODbh3AF8DN9X1xGcI9/YL8sjVkSSY+kBtfn2OLXjPzvBA8?=
 =?us-ascii?Q?F6EPh8JlOECxEheKB7t1cC/2g3S7Z/vJ1Yr0+Dn4Tv/aIXoawkzTRx5joJ73?=
 =?us-ascii?Q?ryIguLjgqieq3MEhYJwULCaTVKubWNa0C2g1upXfzssUTMjUV5amTifnHGnj?=
 =?us-ascii?Q?wlJ89FmHZw9lrZPgOp1YX4FZ6BWpqllBi2s+lZagT8RQKSiasJSaniEXvhnk?=
 =?us-ascii?Q?h6aukvTImRCsj2pTSzkzF3yXznKZ5szZcKgdGmfTMg22AOsKvANm/HfbpgrY?=
 =?us-ascii?Q?F0JJLyzc/oOz2Ypror3/FLuB/KK2eDWiC/PJXY/hYXs39px+DlltUVC+8r+F?=
 =?us-ascii?Q?lGVIqc9CV38iwLp0zPUms24WPtTKQOa9WzLw0eCIBKr0YnVwoUFJql2UW7VM?=
 =?us-ascii?Q?YqiNE/n8cQTi50RBRGHjkmylgOBPbQhMobOlC1rcTgahyFXo2DD76g1mQEjQ?=
 =?us-ascii?Q?90NAocmv48IPveBSna6tcUH1KMv7QnMoEarGkDJNCWpDQYuA+LII07F1q+vW?=
 =?us-ascii?Q?0c8M9vfQE/j+FgcU3cT3XwwtIISty6+2ij92HxtkBItVgcCPvYctCl/STx8t?=
 =?us-ascii?Q?eszL5p8p88OEP1qJcopADFXaKskMWNr39jrcbHFNCBFkFa8FtL9Hz5z+cULF?=
 =?us-ascii?Q?J/02YefMBCXG4VQ+oL3WNNZnnU+H+wPV9HNA6fzv0+oLdmslaXbqTNH2W9tw?=
 =?us-ascii?Q?2Cf3cVIjZYv2/K1FZTFLvmZNTeR2y48RQF4bcfqrm27RrcOyeZUdiLRxl0iL?=
 =?us-ascii?Q?qszN8+xCuUbanIZB99YR7RBp5qZfdHgvNfo2UvmyzKE/dQO+hi0J+8cOO6wb?=
 =?us-ascii?Q?DhVXiADkoo2+fVcDQ6LXtaR4EHm2eoG1rDQ1T17FewVy7zlSp+WOtqoBu7Xu?=
 =?us-ascii?Q?uAHyvVqxl4vp3PI9J4jrgl/rQlcfQMi2UUMLNCROCDq0ob0v1nKrglOJeLr+?=
 =?us-ascii?Q?JLJbDPsitlBxpMpO8a+yT2paDcdQaFKNDRh0Olif1nnGX0pRXnEAXyQcHPNH?=
 =?us-ascii?Q?bVtzV2VJSnKylHCYkSKVCytmuCrxQKJh/bJ7TZ3LiQUu2Odwp09Lvxoh/EMT?=
 =?us-ascii?Q?CnCZl4TtROkgghZQEYJqHOc92q28c4ba+fBnE8Vjiru7ccUd61hn1hP5Rljp?=
 =?us-ascii?Q?cMZr5L6Swc7yp6WLIxqYxEtLE0dSuBs8rV9QtirXi4DL4BEEyd0jvZ36aGE9?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f580c515-8e84-4877-2d2f-08dcde5daf44
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 19:01:53.8492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rANsdMCQMS3Rjwl3bKkYcMf5Ig9RODKWpYQfW1HIlh/BlmZ8nnZmgrn9QtW2XZpCPuvDudIlHyVumQq6yiewbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4917
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

On Wed, Sep 25, 2024 at 01:49:18PM -0700, Vinay Belgaumkar wrote:
> As part of a Wa_22019338487, ensure that GT freq is restored
> even when GSC reload is not successful.
> 
> Fixes: 3b1592fb7835 ("drm/xe/lnl: Apply Wa_22019338487")
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 796b330ffd62..a5083ffc59f4 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -908,7 +908,9 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
>  	int ret = 0;
>  
>  	if ((!xe_uc_fw_is_available(&gt->uc.gsc.fw) ||
> -	     xe_uc_fw_is_loaded(&gt->uc.gsc.fw)) && XE_WA(gt, 22019338487))
> +	     xe_uc_fw_is_loaded(&gt->uc.gsc.fw) ||
> +	     xe_uc_fw_is_in_error_state(&gt->uc.gsc.fw)) &&
> +	    XE_WA(gt, 22019338487))
>  		ret = xe_guc_pc_restore_stashed_freq(&gt->uc.guc.pc);
>  
>  	return ret;
> -- 
> 2.38.1
> 
