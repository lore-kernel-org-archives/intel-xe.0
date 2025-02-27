Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE555C021BE
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 10:56:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2AC10EA8D;
	Thu, 27 Feb 2025 10:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T4xPVW6Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCFF10EA8D
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 10:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740653789; x=1772189789;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vS5keHzvype04Rrv5zvIKL7DIfAEFOXnzZBxUiTZZnM=;
 b=T4xPVW6YTl2otK6ZhmzxBHDUHL7QvCEAGGwEKfj42EGU1Uxo/F1VDEUg
 QjhFE+sNcKSLjLKXLrwa2Ll9LiecKUUtktVtL/UM69e2AqqX4OKgAMHEA
 wsQ3MF79t6RqKT6LXDFPdGBbgFT/4knRrmqVVpbV16Yxo5SosQn6swEyZ
 Ut25tQ+cUqr7Nx5j8Vs8vkBlXfMU5fO1if7uktWdABllFmDZJqEdete9L
 GI4L2gPVRqBzxfIrXPEZlUa8MdDHAEo3wFk8RLyyL57ue2BchCdHMXUii
 wdW1lpdOHJnZfjwhO/uEVgQhmyS3yELlGF/15kfVVk9/fh1MJKfbcq3mG A==;
X-CSE-ConnectionGUID: EhQHqpPkTK6s64b+tYzcJQ==
X-CSE-MsgGUID: +2hIuolwT3KuSZ+O2Kl6+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41419910"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="41419910"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 02:56:29 -0800
X-CSE-ConnectionGUID: FEek6BkdTj+DdkGHrA9WwA==
X-CSE-MsgGUID: QODAsjlwSLqrJrKaXhG5OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="117016777"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2025 02:56:29 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Feb 2025 02:56:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 27 Feb 2025 02:56:28 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 02:56:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=URXt/E9hhgiWnoOBA9hB6ZAQgraF8d10D1MUIMZFhEK0ucEnHmI1y/fHB4x5luSq1H7NeOEWopEey3sIX5byMFwyBRuMSr6h36V0YL/ryRsFJq3QcAH5vz3jtdXLlSD5drxbcPi1JWViogltrYkPFE5jmVNmD3Z63WOYjXsxsM0mqO/Ns0DL2CfmhQ0rSXhABWr9oVg5gjFXXWFZvZKejyPJQG1Qjr3m5RuuErmXr6dDcj0ldqyaVQkbvGEVN3SB8D1E/7WwZL6DyFsBDdzVEgpVRqd2x5QltWKXq9AwNFJsJBpweoTQja35vzFbx8rQSBTMie7fP2PshMnzV67KlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyZF4gdPntRnvFVmtQFW4Qah9KaKUC+WYWLWOR5TVDw=;
 b=s+IxLtOF2HGDRSeCLM4Rozlwqt/MRs1JFkfOx7Tc8GLcXAekXvT8Zkhc8VK7suAsbRPhGCQDG/RimxrJgBKZoCBEYLIav5gTGJkNKJpFWlEHBFx22y5GV2ulQkrGPt4jfyh0BgiTtiYvrkDrubJHZf8IzZcI7hHvP8XSZwXnlZssMWJuBC2SZ4wJGZSwfSJPDBPbA30f5kAAbvpP7Y55nV8870GZB8QdBO3c3QUkS4CRLTo6kWQoaGN1bLOHpqe0z3dl26g7vyatxE20NvZ6EekTwLLQKCPsoODszlq9MDxH6/srwDqL0oj6vR7i8EGE7xnTFDQLWI5JWHQxCVFdgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB8857.namprd11.prod.outlook.com (2603:10b6:806:46b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Thu, 27 Feb
 2025 10:56:25 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 10:56:25 +0000
Date: Thu, 27 Feb 2025 11:56:10 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: <nakshtra.goyal@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ramadevi.gandi@intel.com>
Subject: Re: [PATCH] drm/xe: Add fault injection for xe_oa_alloc_regs
Message-ID: <Z8BEytTlT5KR0dZt@fdugast-desk>
References: <20250227102339.2859726-1-nakshtra.goyal@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250227102339.2859726-1-nakshtra.goyal@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: VI1PR04CA0121.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::19) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB8857:EE_
X-MS-Office365-Filtering-Correlation-Id: 04bbacaf-75fc-45bd-2149-08dd571d616d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vnPgI7DHkhEhev6N5bFwj4VMF6JX2ymwYpCaaTI/CeriHFoXGZNfNW2DeOuw?=
 =?us-ascii?Q?FUOBx5aO0GJMj1mJJ3KbSo0cRwKVBNw8Vvp9bx8pRpXRSF86KXv11fpD0ppB?=
 =?us-ascii?Q?6SZ5ZKl4/doSLlNzq1UIKXng3srjzKgq7k9dO4bwaUPCqyxO7vRtHaKSwoGA?=
 =?us-ascii?Q?B70Gy2oFAMsIK21XX/RZO1S2xmiTRZlWiino6sUH+pzcGQrpvrgXGe/qUs9z?=
 =?us-ascii?Q?ML/QgfxjDCS2Lb0A2UMPuFbRWQv7a8nGV0FudTBCrmHx7/DKRiocbZTI+vr3?=
 =?us-ascii?Q?Nx6hUcviasGgR8USx4rx520HraOsUOcXrkirRA9Noz+FmVHvflaIojsiCLRQ?=
 =?us-ascii?Q?Rdwy3sR5Regr4hgHJJO2E6OYHBTF9/UDvQWCi0oglBInPwd4BY06M0PceBOF?=
 =?us-ascii?Q?SI94mlGignqyq6MNtDQHslKv88oGr4wRZl50o1pMF2krxU+hOHnKRX/F6rBF?=
 =?us-ascii?Q?E7XaVQy8BOoO8iOD0IREj73PlRLxpK3sfTBSvewfEpr105uarciyOpiZf+V8?=
 =?us-ascii?Q?JXBytp8y6DvUG/GW961SyYWacUyqyu89JM6MyxE5wZUyKmB/eQQsVG6k1E0m?=
 =?us-ascii?Q?d+4wnRVToxBuwcqYgEr9vONXMiedl5m1S2N88RSHEcL10zGxE0DSuq2JGVw5?=
 =?us-ascii?Q?Mfp+RhiuCk8EFAbMc2HrcSGOaz9OGDBdCz2obBWulZF7FcJGHSYaGZAWtqUp?=
 =?us-ascii?Q?txR1MoU4Bsp/OzRiTXaaNTZUdOt8Hzkk3e3ZI0bpv2ds6adXGDkrMYiZcB8c?=
 =?us-ascii?Q?ZvGfHrYaz14uDKQIWUakj+k5VGE1VCVVYb87RsDOvumkQihD/gg6uUmsG4NQ?=
 =?us-ascii?Q?u23EZ/1KstrS0KABXogtu8JavRGq61O6U4eIpB0RJiHkS6YiZP7ZQNnYNfny?=
 =?us-ascii?Q?6snVQW5I+RM2GKp/ar5qJa2VgeDe48WxTbnSuwfln9dkxsSBMms/D/YQC4yg?=
 =?us-ascii?Q?zHhaa1v8mTLypPLLJwv8BH9sA5xhSIoX929J5+1HGnMKL3ZRrHeQORiB/c5l?=
 =?us-ascii?Q?tPwnpP2y72Ee6IR6rMdMDv9sBz3H3IFfe6mNr5inkOCUDEcq9HmpsBH64TG5?=
 =?us-ascii?Q?LrmosKHWRlSt5qhsb+1yI/Iic8K6x0ZtanoGvmqac/9o6dMRrLXdul2znJPH?=
 =?us-ascii?Q?vJMKlV+wJPNzLjRzR//jQYu5iCSuG0az9ZZc838qEa/G08VK0uDjoGj1+xUP?=
 =?us-ascii?Q?KQdlBabrJfrKufzjdHbG/qq3pwJ2k5MMUnC+ERbJHZ845u7cgtBAD1RLBCxP?=
 =?us-ascii?Q?ygeN7VyvEKIaHVBpTDE28sunMSVfI/LwHvJDgR9wxKOBc4N7iOGrbpZHtn+0?=
 =?us-ascii?Q?B6RiSo3kwOqXgVFUd42HWOZ7txiLSOI38+dRF3+z2bXs5PbWb+NudhAfaNJ4?=
 =?us-ascii?Q?2jSyvwVKRfwoYylmIuEuF1GxiJbC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7xBzjLu1neSudNmUq6x6vOEMXRezzzxofkn6ZtJr43MkXll4dRzovPfRLjEn?=
 =?us-ascii?Q?KvEV56+ZSAy7IOwhdZ916G+sTq57b9vQCgf5sNZ5qOIEHal8vqV3BqbkyNGm?=
 =?us-ascii?Q?h2O3Ed3GM10a8JsC9oRLrjossu2YtE+MCT6YUpQ5Qq6E7GWqOggYIr8rxk3T?=
 =?us-ascii?Q?5ga1rhVwNUpdE7AUjoSKbuHRjie0YFJthPMvXsyN9B92I+UTSwxUv38YfXV6?=
 =?us-ascii?Q?r4+zXCEzRDR5K168rJ8bTr2+rw33Bwp50DmkmN6M9cBO8qJfIwOroPz5Rjsh?=
 =?us-ascii?Q?1g+LzOMSr9CZ86q9UROUV/wnfYmVUxdO3MPVE+kpkm8GXSz1mkula9Gms57T?=
 =?us-ascii?Q?c5VxjHMIDVRh/EYTsEAAkQ2sXjUyv+Iu2ygH4BJauxTd/K2wsk6SjmQZnq9R?=
 =?us-ascii?Q?1HAVMYwzuKzyggSit5cuJLCZpYBEco3NIaOE6Uw0mLm68l8xhG9U/PXefEFj?=
 =?us-ascii?Q?WBPaVwblISCKw4xrm4/xpYYGXI/HepfHRpDH2G3MRTG2Qyjl+Ig0TNjngwmc?=
 =?us-ascii?Q?cOpegtt1Mrc66B4bhY0RTq0mnZVsD5KN8f3GJal7YXVc7ESJpgvOeEVO2TmH?=
 =?us-ascii?Q?LW4tyK4rCBZL8rQRv0t3yapJrfbfisa0oNUXdXC5hC0YBkrUyB66fNI7UHXz?=
 =?us-ascii?Q?g7Tk3RjfN3qqU9kIWwfnNIzeK0xo++4/hSXuWi1dSF2MaPC4nCfrkk3vWvxj?=
 =?us-ascii?Q?fPx0pJBbWyYI+++CCG1AkNvfeAbqzUXBVmfk2vpnoO1iVvKEzhOGmbu1LKdJ?=
 =?us-ascii?Q?TaJlaBoJdf2yypP8ACdsWaARGLkWpq3uNMcgjsbkoSMSsN2t8lSevJQuEvTi?=
 =?us-ascii?Q?xGypVORJBHz+AicGKfTV0fT4+l7IqYosObiW+CtBsTE7DDX9OMNE7OuxP55X?=
 =?us-ascii?Q?9Xm44tAIKrYlXKgwh4HPaVIxtu6cjTE/JPhRkfdPMrKiz8rptq/bK6rmsCRa?=
 =?us-ascii?Q?cEB/EjglcYll4bhpK92FWoHTLzs3YeoYat8kPis53WEVbb+TcHN6y1eCl1aP?=
 =?us-ascii?Q?yMwhfAWlQnBQM0WDMMeZFiaChafgvrbkgITnGy6RQj59ZyKl7JgJZXW71rXd?=
 =?us-ascii?Q?yQqT88Dd/qGOZ9aXYATdwoy7w8ixPxq1cBpFuJg2UAS08T5p175l3fOFM1XK?=
 =?us-ascii?Q?izqBpVcFHm5V0fKhuAmczLJ0xkZU7UqF7Fr9WbEpz9S2L1USjFK4wsu6j9Eo?=
 =?us-ascii?Q?0pGhSHIMEZscr1JXn9aXosV750abYq3/eMJxJAcJF7FECNvkAWzP4gtQ1BYi?=
 =?us-ascii?Q?TfLg/aOmoGCVW1KhM1bMtkWN0MAGRImOuiC1dmj7+/7V/eOUymom706prBpW?=
 =?us-ascii?Q?FX6vs1KBOBwRy2UFTlO7HSwh+rpBeiiRt3LNMQUTVqqIKpYrkfoMyl2zK9xV?=
 =?us-ascii?Q?pwT42QM3OpT0deEZ0660Afdd9qHW4y0DAD+ozqNN3nsqfznB1uHjwfQSEFFZ?=
 =?us-ascii?Q?83T3hH5FSnJjjU0z79cPtlFpkuYfwb1er8IHQ4h4JAvU6hdRFc15S8mDgLAU?=
 =?us-ascii?Q?i5demc+r33M3uDxe3o6kBM5GuI3zzO3BabMomzSdph6w4GLFUp+MPnektAxU?=
 =?us-ascii?Q?ogLfO1FdCz/9K5MZtKBPCIGiBEywFtqzolVrE5dl6mlF2J4Mhe4xOWt4uC7j?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04bbacaf-75fc-45bd-2149-08dd571d616d
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 10:56:25.7745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1L2rMrn1UO+6AvFBh0FF0tBiI4mxiATLjeBihUUpcS6ZkA9iWJXYIB2Ga+PZyvPq2+hi5RFjLQo9YABf/KklNmCSNsWTa27rrIf/2rfyATw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8857
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

On Thu, Feb 27, 2025 at 03:53:39PM +0530, nakshtra.goyal@intel.com wrote:
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
> 
> Add fault injection for xe_oa_alloc_regs to allow it to fail while
> executing xe_oa_add_config_ioctl().
> This need to be added as it cannot be reached by injecting error through
> IOCTL arguments.
> 
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_oa.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index d89e6cabf5a5..b8704360f998 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -2231,6 +2231,7 @@ xe_oa_alloc_regs(struct xe_oa *oa, bool (*is_valid)(struct xe_oa *oa, u32 addr),
>  	kfree(oa_regs);
>  	return ERR_PTR(err);
>  }
> +ALLOW_ERROR_INJECTION(xe_oa_alloc_regs, ERRNO);
>  
>  static ssize_t show_dynamic_id(struct kobject *kobj,
>  			       struct kobj_attribute *attr,
> -- 
> 2.34.1
> 
