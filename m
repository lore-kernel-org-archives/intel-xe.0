Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32CBC43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 18:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D69810E65D;
	Fri,  3 Jul 2026 18:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IpeGSpXP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49A110E65D
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 18:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783103523; x=1814639523;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Cf7RxDi+tknue4HOqvS93D+eqx32Kdo/Ulqai4IMcCY=;
 b=IpeGSpXPrrn3jaTd1VmzTcNMWVUz/l1OBou92RARQdgfIL6zs7zRu/gH
 5xLvjaig509HMGmPuTQ+R49ZQ9fDnCshIxk91BFpUHLGdl4rkU1Mwg5IO
 XNiNJg9Zc+DbPyyFysMd/ypyr9LfHkbkQSHS5QfXMwLHkOOYOoYInk6It
 tkDPMfnqB2r6f47sxlTq/zuirODrYggwI4npQvUafAXI6RSmBfPwKItSn
 7XD2Bzl5exq0yNtw5CruCyIZy52LpFXT20UzuQ8+VsHhdiRFVRQdjTbq4
 qID0QH1wlVOmR1xc8+8NsJhS7AThiFTkPUGKcoYQmt+HoaQz+3YXRhlTh g==;
X-CSE-ConnectionGUID: yoO1cDIuR3aMxK6DqeUC2A==
X-CSE-MsgGUID: cBroeO2ZQxyBNAHFX3YxSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83726677"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83726677"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 11:32:03 -0700
X-CSE-ConnectionGUID: yIUCnehcQD6WlNzaq2KcOA==
X-CSE-MsgGUID: kNIcSYHRQE6FUUqO579TyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="253830208"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 11:32:04 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 11:32:03 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 11:32:03 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.28) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 11:32:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INsxrn4A43USVunOIArVuwMrQ5bdomaNpBJ3GN3zHTcWcdUqFbykUV2hYQkqxFmWbUBlLQoQebBMKSQw8rGvEhMtTBbHujzejAjUtLVHUaXE+4RJPdpUy/3TPAtMgyASDTj5XwLRMHa6GyxyWLqprPKVlvwPeGO4b8jGcghrHzQiksghSXEXTCjCfVQu/gontpIERhpyASzPiyMwXy51ETJoMMa2BBQ2K7Z0vmtgQ+WaI3ZU4JKRect+jl1FqEaVghObfr/SUNJjJ0riiBv0Mnq6iqRZ7bZDQ2FPS+qTGTqkQk2xCjjWCGg6jPFkdCFSmiE38X0QaUsICfn1ZqzD0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YU6uykDcCyzfXNuJSGqmXbsIRa+7PG6qk0vleso7Efk=;
 b=JooXvQ82js1zRsjgvMP1QMXgXp7aRtHWMWbvB+z+irxkBw4nqboHSeQTRIQoET2xiYDbcdVctUxbRsvzGKnV2QEkU8jdDgzBemKCtf2nhIs6jUWnNokGLNJUR9BeHP0/IX7auX56XRTGvkI8funutamNAI1CtO+8DCqTKwfXrcF31fQJl1hGOpe3RIM+WYi+KwH13ZaKfBxhEbpeF33+cBasrGdIpkoYxOo00tMMvwiN+r+K1OVy5mWeyZR+9UpiOjTzncILk7NFL5IfzHHHLaAVMMsUIvNjmaQKz14tvL6hkTU0wq/Y2+HoBxpqr8IWsmnUm9YRkHTJYyN9rF7Yfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 18:32:01 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 18:32:01 +0000
Date: Fri, 3 Jul 2026 14:31:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1 1/2] drm/xe: Use IBC v3 on PTL
Message-ID: <akgAHRTrZepT1yb8@intel.com>
References: <20260702005614.2621735-1-vinay.belgaumkar@intel.com>
 <20260702005614.2621735-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260702005614.2621735-2-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0191.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::16) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|SJ2PR11MB7715:EE_
X-MS-Office365-Filtering-Correlation-Id: 029dff07-5405-464d-e369-08ded9315f44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: JLeGmfM48Cp4P+mMMHS/BL86FXfIO7uVMAJekNyiSj5ZkVghT3PW+zsFQdbw2mrzzSO+/iV3gLfv5oQZfPprrbRBlonG9OLgvrRocQwow8mwmmXsuZCHeKk+dHuXx/qjg1/vrEZin/ksxz1sULNrEGkJkON7FC4JGgbqYNrxHJ7QMctxmMpOX8/Dguw8gviUby4XAvNjacqYJbR+XtqIk0lT69Hk/88Eihy3py3huzOjeZsft3gKClrtRI/Q2XAkdtmwVeXo4Z8TSYfCiZU3LQmcCqVT5fVsSrWg3aLfIOGCionmvydBdqarRoN14jkNfSYC6vJrJfSBhjqc+L/o844krqimSS8wIZZppQyp91uIMyy6VRN6iKny+J7YsUCfLQFjEm7WlVBX5P8WSGCszrYgBEh4IDoWJVjE0rIsg4yBTrf+VI6GS/U9JsTADLtI2RmDJiXbLIV2ZB3e7+6ov/zOsBKhmT3SOsmhEGXOfAS7KRgyS4G8tx3rOuX+3THZlEiH37Qq+sjX9uMYnRaW9MmpppxQoSPD/SG/YQoOr+0DPj8HAQiNcpR5i8do8EG7OcQC4jMk+2EuwOTBpD7tz3fBQ7AbbYhqU25wLfLwVopVP0Z5JhrXq4SqA8uinEdEB3sHbbyVoFbR8cCKdkUd/OYjQaJ5zDTLfbcgo18WPes=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O9AlomAdEa8pjwoXb5H1oVvH/B2DKJ5RoJQrBelc4n6iDNk5F3QJWg580Akv?=
 =?us-ascii?Q?x1r4Q3uHcTsrxKchcPcKXWmtjp7seliiL/d8ASY+Yr8cFr+wHm4f+U3kTkU2?=
 =?us-ascii?Q?U1P6UcXw4iMrkRUHJnuAoXgpll5EhOhqAiIUhgwDuWoAP1e/9p+SFhXSoMcj?=
 =?us-ascii?Q?VqrLsH3Fjhib9BVCY6tg4avhQNvWvgYNQ/KSaOPzR/8cJiAp4L/AIDTQK/XP?=
 =?us-ascii?Q?DGyjvl1uyHbQ+ID+l4LQgO7aZhBJYUwG7ixuQDxuq/am0KU/2WKDRxbISp7T?=
 =?us-ascii?Q?C4BrCG96lvvxpIRw23By4iph5HzQJWh3SZteXAeV1WjBzkyKI6Q+5nZC8VER?=
 =?us-ascii?Q?Nk99EQfQMIUTH2h99pCZjiIv0ODCTP7u/nsBgdyeMwnFcdvlHwylAj8NRI89?=
 =?us-ascii?Q?MHivRDwqvPTBfIDZmZrMSD8tzn5ZVJwRFp89gL16Sztq+NG4NjWSsJko8Udc?=
 =?us-ascii?Q?DZgzjuV2Sh9qIoxnf1Rlzag9S+bx0w0q6cPXhswNG6tVGPTFP+RB6zAHH3rX?=
 =?us-ascii?Q?hkZitha3w/UHZ1dZDVf4qNiOihOUz2zF7dK0uBM7f5m4LXpHoOwRaezjon9T?=
 =?us-ascii?Q?9EUryFOnPDg9quCE8abonN0IpnwEzY1xdLbtcs51EUMxjdB7quxZ5uVN4WDH?=
 =?us-ascii?Q?e9eqeCgqOEu3F3KMxQLB30JRK7kdaYzGmNtnFg/lVI4yVkgaJMY6bmul+Xre?=
 =?us-ascii?Q?Q0Hmk37N/S35w0lTecdwIXGaZM0sIcFaCJ7fvLt8BI6ATzqW9imIBAjqmwrn?=
 =?us-ascii?Q?M8b3euLpx5uDPERzGZR2sM4pHMHB/9JuInvGXn6jkeQ34BsvNdk0ZfBs9jy5?=
 =?us-ascii?Q?MFVo45r78o5leIIL1/9unioNvB2CdcUrpyapCck35sGknMApBvTwxOFk0xHR?=
 =?us-ascii?Q?BIEn8mKOeYK8T2jvR/6lHBCXU1yjbbbXtLV1qXe5vK5f7+V1mbgmWoiCrDQ1?=
 =?us-ascii?Q?SolhH+VnpHqeSGyuR8o1sf2kS9BM5oVOroQ2w8H82XsYQNAM0dI1OMtbEVjp?=
 =?us-ascii?Q?zFBn4jKg7DJwkMcbJwq9tY4NSjkLwzba8IbEi64ApnYDWDUVQal3pQPN19Yp?=
 =?us-ascii?Q?Kk8B+s+1ORqG4X43JebW3b2Yu14KNIj5verFc/tDAU8rTPfUPf83ly26BaJR?=
 =?us-ascii?Q?G1lqG2uq8MX/B3iwwxp2ZXjRTAyNUGtVwKEtVAyQutaAtgB2UraQrYuM8uyg?=
 =?us-ascii?Q?5MUOUr4N36A+cO00wDWv9blFSdwohjP/ET/y82ozlt3byryCr//UnRqPN5k4?=
 =?us-ascii?Q?0aeZ5gaOZVhd3L2603kuCu2iiP8cRdN7OGo9vNqErOL8uPbHs5CWDTyMeO2C?=
 =?us-ascii?Q?0zL7EGAmMhNidBKqW39Q8hc1+hBLLKRQ1prRuKAPnF93QK0Wdl5DVazYb58e?=
 =?us-ascii?Q?shWY/jIChPcGkwmA0vf+fqR9l5P0v3JO+8AWRqBebFPPqa5s1cZpPwB+59CY?=
 =?us-ascii?Q?/GzbcY6hYX4blVrbe7RBffc4/3tqqDMsM9wDSpiyUcbC+PdeR3PzuqiXrBbq?=
 =?us-ascii?Q?p69nb58cotJDRXj4WJSqpZ4Z7R/e8cad6XAelW6FvVNL18KvmwP+8rMuTCY7?=
 =?us-ascii?Q?79Qo4me+DsQMZllJP26UeFrh5smvvvJdE5us6d0Cs0d235REmUeB/JWuFax7?=
 =?us-ascii?Q?scV7WJoMxGKDHh4TGek1x7jTHbTP20aBlQTy9YRyUvvnUee1ZDV2oprkXiP1?=
 =?us-ascii?Q?Psv5Fn6giVGJ5Y/39er2+5D3/L5wW6hn5+M2hJZfkptjZUCQy8tLA1D2E9+H?=
 =?us-ascii?Q?lp7v3bMqng=3D=3D?=
X-Exchange-RoutingPolicyChecked: Bkue2oxNm2GWrR/GakFZup2XxZw4qORZIDMR2tb0y/AnCboc0yyaXDrH3F+9tziImt51lSH869G2tQXiLmEZ/IbdLgDfqimJrP2YnbwllsLWPDWZcoNvbwbTiLFsrfMI/kFrP2nTbixHlQpBNFrFEFAwRHPZupGm0iiQ3wa0gT8fFipGhMlLUjBRwCzDVWZJtuKUs2MBF2PPOPahLaU61BrF8ZoHoLDUuybfuhWKd92cIy20HNcd1InZhC7TbxiKbrlU2sbv9XWUmCED51og1acqa+ELw9Orcg79WVP3lFgTWB6YNmjGz1VfbWRa0JhPGI1s6htO4E3VniVGBedDPA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 029dff07-5405-464d-e369-08ded9315f44
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 18:32:01.0281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 75v2kcqJjFA0JTgJ1z6KrQeRJVOxyDj2b/XKfkR+rDM5+5rbH4K/oE/p4kf97A933zK0h3wSZzIuL0aEXLLhig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7715
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

On Wed, Jul 01, 2026 at 05:56:13PM -0700, Vinay Belgaumkar wrote:
> Intelligent Bias Control (IBC) v3 algorithm in GuC has PTL specific
> optimizations. This version selection param is only available GuC 70.48.0
> onwards.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h | 1 +
>  drivers/gpu/drm/xe/xe_guc_pc.c                | 9 +++++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> index ce5c59517528..57baa68bcba4 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> @@ -119,6 +119,7 @@ enum slpc_param_id {
>  	SLPC_PARAM_STRATEGIES = 26,
>  	SLPC_PARAM_POWER_PROFILE = 27,
>  	SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY = 28,
> +	SLPC_PARAM_SET_IBC_VERSION = 29,
>  	SLPC_MAX_PARAM = 32,
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 59f2fa79ad42..0d55d6b00cd9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -1236,6 +1236,15 @@ static int pc_modify_defaults(struct xe_guc_pc *pc)
>  		ret = pc_action_set_dcc(pc, false);
>  		if (unlikely(ret))
>  			xe_gt_err(gt, "Failed to modify DCC default: %pe\n", ERR_PTR(ret));
> +
> +		if (xe_gt_is_main_type(gt) &&
> +		    GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 48, 0)) {
> +			ret = pc_action_set_param(pc,
> +						  SLPC_PARAM_SET_IBC_VERSION,
> +						  3);
> +			if (unlikely(ret))
> +				xe_gt_err(gt, "Failed to modify IBC version: %pe\n", ERR_PTR(ret));
> +		}
>  	}
>  
>  	return ret;
> -- 
> 2.38.1
> 
