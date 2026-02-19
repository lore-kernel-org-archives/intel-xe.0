Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3B8C531EA
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 23:42:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8771010E762;
	Thu, 19 Feb 2026 23:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NOr7w4cc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C0710E08F
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 23:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771544578; x=1803080578;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fF2+ZQdSISRdJQJx6htfR5lQulXuZvjR8kA3OTnigNQ=;
 b=NOr7w4ccQUwP35yO1VuJncZEmU4OX9jU6voHFqr4VZ/03/QuxD9TyITt
 VEdW8dx86zNnc9Yi+0Fkb8KsFv3qdfQ45YUfBDdexsEECsdzGK4wSMR5N
 GuMHLAf4D4FjdguxXwLIV6zn723bZTFVDN0l0AN8gob4RYdxlvPPtwp1v
 DKHyeGqB7/8lZ1VWk68Q0JSpJCsC8ST4z5xXkNnD4jVQMLQPa4jYGcEcS
 ZSS8mpsd7poA58YpE7ANByZ2rMrVqX/uuQHSh4KOirGZwCAU6sHZ8z4MB
 QrCWoHrFE0wiVCSMyKjIbJk43mL3sDiwKMVvy+vOYvhY6jtkNfLrYPfZQ Q==;
X-CSE-ConnectionGUID: mJH+HvfTQDymHK6w6BP9vA==
X-CSE-MsgGUID: Fh/VezwhQT+uIQYtmdbNLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="83267776"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="83267776"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 15:42:57 -0800
X-CSE-ConnectionGUID: HwIg5SkOQamqesxOOm3bRw==
X-CSE-MsgGUID: WMsR3EmUTuq0WwxebqK7ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="212867599"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 15:42:57 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 15:42:57 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 15:42:57 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 15:42:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Afzp2mcuIu6YSVlCFr4XUxS5GtsyECxApROBieTylR7ZJx8BmoDaNvHDN0Y8jF4jaDSydmr15yVQK7cEHGwCCqMf1TxaVs6EB2JS3CyWbuEHDOHWpE8yjDYRsuR5oF/Egs9U4rqveu3F8gR35BytKI/HvPyUDGGDsARZ6to0KxYt0aWJSoDlw6TR5FSPFutrjZU0jUl4LQXcuQZnJFx57aVi6uA8glVvxGRxcaQ9KAPSQWx3Zrk/AL25l65jAN2qc3Irf+mhMeAnoZ4vh2USuYcjPpLw1KwCuDgIv+S2jqOQJ0htKdsns/0fOfD7QIzCwtXeTFTixiaspRUGRbmlHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4S8Sa1ydvX79Q1ep2MeNjxeD33J06jiXvnkk9YkeqM4=;
 b=AxXi0LZy0NupQnnDQum6qIXiwjetswoS4LZ1r1Buba1Yfl3nrA48UpNsQBMlh1yH58CJxtj9CdvgvchB8N57dNJshubi+pYpUIhhhH22Cg90dtRd5HFoxl3JvDZpG4FVY9KcFrsb5xe+Y45Ni5XRLdhqLdiwJ/71cqTCs+QOoyv+Tp5FEm/QL2ykjFs7TmsBaVmMNR70WeBVJzK+cPj4CjJ3ruHwDC5YP930CUFzMtKS3EoZzmqn6K2DtxGZMoMVyEjKf4nkfHb30f+cKRUcaq3l4tnilAxBXp+kAeIGoE11itOa9Pk5pu4pBEs+erKr8wXGeFIAfd/MDm9lc6PvzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7243.namprd11.prod.outlook.com (2603:10b6:930:96::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 23:42:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.015; Thu, 19 Feb 2026
 23:42:54 +0000
Date: Thu, 19 Feb 2026 15:42:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/sync: Cleanup partially initialized sync on
 parse failure
Message-ID: <aZef/F32bR+LUDAW@lstrano-desk.jf.intel.com>
References: <20260219233516.2938172-4-shuicheng.lin@intel.com>
 <20260219233516.2938172-5-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260219233516.2938172-5-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: df0d6296-8dcd-48f9-772a-08de70109a49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O+GcNLk1ssYDgdlc7LHQQTh9c+xQrgcAEdflLzs1bLgavMDwKTArbGrzteHf?=
 =?us-ascii?Q?97p0s/x5X/vej50H7jPZactL1t1OpED6G44NZOCclD6ajBgMmiTYT9caREY7?=
 =?us-ascii?Q?fGkN+3cF9mykYyo9Tr5vAgAnVE2Kz6XWxzfQ7Xbgin9Rk8EUTV7V0rufVUVA?=
 =?us-ascii?Q?CZ72Vy94MURtSLnTAAswPWjJ+sfKWWX+NTj54ZWj+VjmRFMIHwjsfQGMWOLb?=
 =?us-ascii?Q?nsVWUY8qyPPEf6kq3cqaTk6fXXUvOwsgjBwcT8QMAU+Cuhj6c7akKLiyzjnp?=
 =?us-ascii?Q?19z0WWdegJQy+3rIlorjZLnwktq1NsO7eZVjExCns3SVBan98vVORaI5I3us?=
 =?us-ascii?Q?BFB1bpSTmUKTR6ua6+hLO+zDqVWLg1ZupBPrQk8FFmTdZ/nBgjEgpCzQ0UoN?=
 =?us-ascii?Q?Ve+Sz/NirOr7WEbew9gAC6YP3azi2Yfasgj5dBIRijRp/TaJwe6Zz5m1Du30?=
 =?us-ascii?Q?ZCbRWFc/Sa0h8ZmkUEqz7o75ZxhHI+GSPt7n+MDVPthzthzMycOXE3aoofDa?=
 =?us-ascii?Q?PmE6/RqctBsQkU+OJjlLkHprSnTTmcJfz4jIoPWze9GcUXjiNNK7m4npXbSN?=
 =?us-ascii?Q?QM6CWUJxk+ljLqi83S6YfoFDBWmj+ibQ0x2DGhFb6ju6fCQutaK3IpQt2igv?=
 =?us-ascii?Q?uFf4es1DHjsEvgq1v2vHbqC3yAYGaRJTqzmsPnXeNPy7dqfh461zDFmiH1de?=
 =?us-ascii?Q?u7WG5PrTDumKuz5h6sUv9zt4WsmyvFM/UUqnUJy96ogeUwuHDxfGInOR1fyt?=
 =?us-ascii?Q?E4BGbieBWrEoZ5I7L8CtDWOi2MnURDwAuE6dxMHI4TfpRblBGtNi+C/Mw6pq?=
 =?us-ascii?Q?dNJcRtpVhujvDqwrueIeApAO0P38fC945mLQgUbaelT25OLmojAmNT8B9ZBK?=
 =?us-ascii?Q?iqjWfCZZ1TUFjGZiRhof4ig6CYzcaG+h1vu6aE+jvGqzsQrk25f3N1ihsbUh?=
 =?us-ascii?Q?QLrkSzmHsGA4+/fHQP0B7o5n1dmFUpKwl2cHn/dt+86kkZrhkz6eo8jj65qM?=
 =?us-ascii?Q?EJk1+hqD/jQJo3I18+3WSgK03O94fw/tIE5jvUCeUD/tgRuTf8dHjJbtbiIj?=
 =?us-ascii?Q?IJt5qdB9UNwX4y5SkYUXgF52Ile6YJShF44R66RI5BYc02tKEusIF2sToUTa?=
 =?us-ascii?Q?OwDDqY094Gnc8zyv9xpD2UihnTcsmXqgX4rfQUkghsKn0Fxdsnps8VcNNQ/X?=
 =?us-ascii?Q?XSyet7bbE65ziJSe+6ZlbcSzH/hbZFJzlg3CYKfjAOaa1XyLbi7FIOZO3Smi?=
 =?us-ascii?Q?PbSErehK1hk3qaI4EjMpR1yXmlRzWW1Cyn28QXXiGN4fO8NGH+DXy+6Dwj2H?=
 =?us-ascii?Q?/4F+3F4qXjTYQczmTkaOdcKyCOXJW9Sxgb69ho+cSnl8uBUsvKUal2PxBIl8?=
 =?us-ascii?Q?ko7sUf/BwWQQPGJ5E/qhHkua7RA7dBcGGaHZyLvJ2Wgrk0avYuGlbUm+Ik/m?=
 =?us-ascii?Q?a5kigxjy7J70qwjsrl/ekcFmPtI4Q/sry+MSBNkGgiJbJM/JoLBOnQUOQ7Ts?=
 =?us-ascii?Q?VNJmVarT070oMY9lj9bEfoXPT21Z2725pQ/UpT9w5MOmTYId4XX4Eh2DY111?=
 =?us-ascii?Q?JKThFZlGYznnhNGEGds=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x+80kzZ0IXHxBJ3r9c8Hka972huXi631VxWL6DmTwI76a+ctaRMYP4pzqaJC?=
 =?us-ascii?Q?whFJu2UVp3fLgqYH4dVF9f4pALGFIRwrBqE4GldbxnoNmuD3a21pS5sRQheT?=
 =?us-ascii?Q?IyuyADC+VcOIcSZWbB+NjeR5y/MegnBhF4uBMCy03yw+U+BKJXUpKg4AEE/9?=
 =?us-ascii?Q?0emzWzX9AV0NBxcvIZ1tgp468VfDiscFX8REoWNyXS2jlXH1Jjr1r+LHZ2IF?=
 =?us-ascii?Q?RCibb71KDpuGvhm5WuW2a5+rSffrh6VxQPHHORwEzJgHowMwxA2hNlMjkVBf?=
 =?us-ascii?Q?XSPGPjWanpYU7ejH7RJm6snOILPJw/ILVCQrKsRwksaN+PIREB2BQvJgNaol?=
 =?us-ascii?Q?kBU5KYWiFpeVMQRIP0IV5ff3d1q3/cYBXOJN4r8SuoVypTXaEfjJyzOR8imf?=
 =?us-ascii?Q?QSa+jMOif7/NA5fMLp1HcdZ748+p5fC4w1txtbTnCjs/XL00h0nUOffrxx2y?=
 =?us-ascii?Q?T2OsN/1/uAbev+Kl1bSIzfPH1fc0N/fI+VDsfUcdSzDz393xA5EmW4tGJ6AW?=
 =?us-ascii?Q?BqgET3Ozo3VppAGd3aG640/nqT0HlZzKqm+l0Rw6nixh1ZDFO2+Ass18l7X8?=
 =?us-ascii?Q?ur1dpO+dTjvhLBRM/o7ZtcKpT/aSDeTPGWmTzEoUCuacTG5zmZkLC/Gkoe/L?=
 =?us-ascii?Q?bZlWU5YpVZeKDD1cZmx7NsjY+Bvfk3iXaY+PBgZSxWjkvE21wg0TNdFUN35G?=
 =?us-ascii?Q?6D0AbNwHk4GhNYKVQGa4gebBd6tHJZTyplAehAFH2rr8ReSd52pM9EF0F9DO?=
 =?us-ascii?Q?y7JbXnmBHswXpoV15Q4xnhKA2Vcnnzf0mVHhucPSUzCVbjS07lMnSh/uqoSX?=
 =?us-ascii?Q?lDk/QiCQtAyz/nDK6qp1/DR05jENYXOcn0ISzo9kdo/QOJGQlKlr3UNldMmP?=
 =?us-ascii?Q?ntdhnPt04FGh+y1rKNKkNGMb96CJz7N/J/qqNCds0GE6EsTcOEgRwqndpjBg?=
 =?us-ascii?Q?RiXOkjhjFDPGGFy6+602+0CsrI6DSsa0f4gdXs2W+R0HKA30t7Fj7sQ7FO9/?=
 =?us-ascii?Q?YOuiEbf20FHA9c4fC5dbYK7gmpGeBeflnYKfrBADPN9dHVg08gCGjMsSNf7i?=
 =?us-ascii?Q?FZfW2OBKqZ4DIsm2U2wgKkynjdRHGMmXDXBi0kSUgQV9RHQe5REeG64n7OWq?=
 =?us-ascii?Q?wXCIeKdOH30YHdA35qL/jp4S/VJTvBnE68+Ow5vxVY1+Fe+SdPHufdjKFdut?=
 =?us-ascii?Q?YolMIEfGqJfBOmWvrPU+ImNu4uKY0YIkciHCVhN3xHE286cJOEQKS7LqgdxG?=
 =?us-ascii?Q?/PaFYJAHM7yBVac5zgbmeNzj7/AgEoNC3E/pwKiXWF6zdeh0ct5wHoD/YVRr?=
 =?us-ascii?Q?l2UuZnsSMaoE1xU1vlmleeo2UrKZ9llj/+L/A8qyPeqzzHuFnjNq9vyg7r0Y?=
 =?us-ascii?Q?1rgMaXjz1F4c443tegI0usAKFTOuWNkFiKTrChngpLhEYXxR/5NXW7avuqo+?=
 =?us-ascii?Q?9yh8G3P7mQqI10zaX2/ezql/ijp/WqYLyRCN8NT5BRr22tqtGa8x//b0U1ec?=
 =?us-ascii?Q?dcdOFj3LsoyzcHmaJPRnCl0Vbyof1sXW1h07pB4VQmWuUZsKAbt/lAbFyP29?=
 =?us-ascii?Q?JMOk9ogm37xNzOlNDmx5xmC73uve+wYctHDel47EjCQRvU/06T6M7ymexH/d?=
 =?us-ascii?Q?3Q2Iyk6N3b1qqBpkbfnxRxp6SOLxRxi5/vuq1Ts+zfMyGSBspCetyMgWyzSr?=
 =?us-ascii?Q?0yvW3HbzTPPbJxyd+FV79qUrEQP8Si6naj10Jj6o+oCq51xgLAgw2ERS1eo4?=
 =?us-ascii?Q?Kb/v7BKApnhL2fu8XVLmiL4QpeKlNi8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df0d6296-8dcd-48f9-772a-08de70109a49
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 23:42:54.4900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQUKCdsUUY/EHhRT/yiLzj3+mJGlzLkDTj2vhsVToitJpPDj/DY1fX+rpHnY3A6qd6zDAY+dFgR3ZTwL8dKFoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7243
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

On Thu, Feb 19, 2026 at 11:35:18PM +0000, Shuicheng Lin wrote:
> xe_sync_entry_parse() can allocate references (syncobj, fence, chain fence,
> or user fence) before hitting a later failure path. Several of those paths
> returned directly, leaving partially initialized state and leaking refs.
> 
> Route these error paths through a common free_sync label and call
> xe_sync_entry_cleanup(sync) before returning the error.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sync.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index c8fdcdbd6ae7..f03ab2e27284 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -146,8 +146,10 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  
>  		if (!signal) {
>  			sync->fence = drm_syncobj_fence_get(sync->syncobj);
> -			if (XE_IOCTL_DBG(xe, !sync->fence))
> -				return -EINVAL;
> +			if (XE_IOCTL_DBG(xe, !sync->fence)) {
> +				err = -EINVAL;
> +				goto free_sync;
> +			}
>  		}
>  		break;
>  
> @@ -167,17 +169,21 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  
>  		if (signal) {
>  			sync->chain_fence = dma_fence_chain_alloc();
> -			if (!sync->chain_fence)
> -				return -ENOMEM;
> +			if (!sync->chain_fence) {
> +				err = -ENOMEM;
> +				goto free_sync;
> +			}
>  		} else {
>  			sync->fence = drm_syncobj_fence_get(sync->syncobj);
> -			if (XE_IOCTL_DBG(xe, !sync->fence))
> -				return -EINVAL;
> +			if (XE_IOCTL_DBG(xe, !sync->fence)) {
> +				err = -EINVAL;
> +				goto free_sync;
> +			}
>  
>  			err = dma_fence_chain_find_seqno(&sync->fence,
>  							 sync_in.timeline_value);
>  			if (err)
> -				return err;
> +				goto free_sync;
>  		}
>  		break;
>  
> @@ -216,6 +222,10 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  	sync->timeline_value = sync_in.timeline_value;
>  
>  	return 0;
> +
> +free_sync:
> +	xe_sync_entry_cleanup(sync);
> +	return err;
>  }
>  ALLOW_ERROR_INJECTION(xe_sync_entry_parse, ERRNO);
>  
> -- 
> 2.50.1
> 
