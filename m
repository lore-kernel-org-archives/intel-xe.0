Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9683DC44501
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 15:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF0B10EDCC;
	Tue, 14 Jul 2026 15:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lSqBSX8w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B84110EDCC
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 15:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784043534; x=1815579534;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zTBMF2d+ZW85AYkzJrncwwUkXoBqnlZiUH5nKdbI3fE=;
 b=lSqBSX8wvybqc24Mte0Udi9be5Yv8s8+rxeiegTluDUtQonibozpSkR+
 lSCGllEApGzRXoGClKMxF++noVTm8UcHuO8jzyglUsjduze+zmv1qCG44
 JYWW86f01BoNX0L4lT0zdJ8oaSHPYH0rau9Om68znErYJ0LEU++cOBj3R
 MDdr2BTxVE3KaL2X3xj3tcrcpkuNESPDSBYe/W0Zh9DVSa9zpnxMJrLZ5
 MeTXS7VQyT7fz60DDpMmm73sQK55kY7uOdSneuWBcKScuwA0CIYtQCH+I
 xle1vYTfcIxC+dsbVrr4+EoyCsofHlen7P2W75jCazDpvFR43ZuDhPmOv Q==;
X-CSE-ConnectionGUID: es+HU0qeTZmynVBa2jrSvg==
X-CSE-MsgGUID: L4kMx2fwQUOTxng+fhK3kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84689469"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="84689469"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 08:38:53 -0700
X-CSE-ConnectionGUID: hEAiSqgbSE+ROcOMZ0/YwA==
X-CSE-MsgGUID: Alg+aGqmQ9mFm9HzDfnmaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="257846841"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 08:38:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 08:38:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 08:38:52 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 08:38:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iu82bDPKvI/kAEntD+qUyAar8zF8WHyAiH3q+DxRJslfgTAbnFGdxU0tVrgz2U6NZQonhAfPBvD6xHZ22wRqTcQoyQj1hmCugykAZYCVrfIc8Yk1X8DGXc3p+uP4vpGMf3hdUggbcz1J4OhgMXgQaQYeScZRoUHTsfQYI1BJF7eqSRyNpi0eKZAWUq6qJM8vB0dM/Td56aU+QvcHFQQHgaexDmcJ5kx1kmSCkeULRV9DL2j4UnySQwAghJO+sUcat9xMDT8uIdR25eKv/vI42TY5yjmLoixZTrftBU4V+UqRt+EfbvfQFx0iF+XWV64+xkgiCFgE/F1aY1ZKAninJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IawieLJ2OE5CT5NoL3xw+WfQzMWGZRB+P0XmZKSgjM=;
 b=n/Nq7DvrvmY3PZsPRWAX55diWxr4FgbzCn4U+5uz2KO2ceeNbO77F8Ot9e3dd8j3LEVH47IDDDTpsmavQ76MRRGCFGVAvXIiN5lj2bjcXAQ1Gzj1GIa+y251WXgeNWt3xaWPmMoEvpnRnforW84VBDx84PnojUtxhknaeqyzHf9tkfFIazlnGDKtVM6j9Aic4zwcjDsiUM5a0e53zEIU1yuFkKtziee/EEOWHfYoUhslCHLw3DgloNIfExMtmJ4TIDJ64dpWsg2lbdAjXf/Pp4Ba7M6bFtgVpBNZ10xkER7KzfMdMh8LlQSLOHC54VX/8qv0a/OyxVPMvBgy4ZgtIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by MW3PR11MB4650.namprd11.prod.outlook.com (2603:10b6:303:54::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Tue, 14 Jul
 2026 15:38:49 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0223.008; Tue, 14 Jul 2026
 15:38:49 +0000
Date: Tue, 14 Jul 2026 11:38:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/2] drm/xe: Use IBC v3 on PTL
Message-ID: <alZYBsXvGMYg3Pw9@intel.com>
References: <20260714004359.3905038-1-vinay.belgaumkar@intel.com>
 <20260714004359.3905038-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260714004359.3905038-2-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0334.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::9) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|MW3PR11MB4650:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e189157-3732-4fa7-e352-08dee1be0017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: b76qdRROHvayv+UbehJaeQhvf8rZ5cfciKt7v4qVzWR+0J1lyviS9VrJGO4hsGqUYYDT/tAqSfq+lOnPgT2rgKxZvrBCdsd+e1npnYeZHNObE58AIY7AopGsrf4+NYaCb3ijlPHXIxonEItgX7S+aMjX60ZgxSRq4RgsFxw8PZEoucn5oowk8ANCHU1gd1e0N7wLNk7q3jIUnglgLVhLbAZTkIGEAQmtDF+IGQfgVFVYuOKmUnHUnqZ1dBh85qxktDEnXS26VSQsWbB8j7Pf0n+eXuC9cJQTRyWFtHUtmcHMb1nHPenPU4EsjmnPv0XIqbvEATUjzVxXF6nNcF8wz+vvaH8DFQFvBYiWtrT0Hg1FQ2LAeJBry8uSQg4vVYl02VqIRFAVKO/wplRdq8l65vdn0Jn92IdUU04rmMdf/CgIxVlTECp7LvVRgrhkKsrMgIOLbOqN25vhl0Yv9kDvICJod64ZXUyekdE5PBr5x6dVGSPfSKVxojFABAy5Pd95oIS7vhCAj/CedGyONmAeIRcEK5hOSLh2E4RHuifW0pVFV7a77buwF0U/ktZLnxMxAVs0aOyqjG1aa6kFVA6tyNl80q1jm1dh78cTOK8F2s0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?92tpNIGt/eEBUaSuH1me27uiquHnqkdZDuDbBU0+us+4o/d7zdW7jj8pFwhI?=
 =?us-ascii?Q?aIzYEyoftq5Xr4NmcUT3fyUJny+9vZ93ynSL2+2ixDKMfY4oKJ9fQg+bYpGW?=
 =?us-ascii?Q?27s89uR8IYJXOGLA2DdEKllgf40EaP3/DnX7a5GDAdPK3LezFIKwNHCT/Xci?=
 =?us-ascii?Q?a+IZ1d86QUlOQph0Arql4INs7LGOsrGf16YMyGCWh//4q31XvIq3L9/ZIwwD?=
 =?us-ascii?Q?1cFgWKH/g8iEPKjitNb3wHrsQV+RNP/UfaXWhJ/C0ClB7DBZqgDe4BdlRP04?=
 =?us-ascii?Q?kYaEbvhaFvIAKAjmLU8AbrnFTT6qPJSthsXueuBC4kqHC/N9OwZouiboMvC5?=
 =?us-ascii?Q?0g/OiiVq4O1TCdxFnjUwb3kUbrc1ZzOc///gRALo/083thmpE1gXCGA0KDOB?=
 =?us-ascii?Q?h+ZTx9OrI/ibWuHinsYlI+SUguEiFYJGAbmq1nckV4PwtOUKNNdORxa09anc?=
 =?us-ascii?Q?VfQ3VEmxp0C0j/ALhJoBL5FFPZMiQPSsMH+yoVASQxUQ7RKD/DY9gu4pHM9m?=
 =?us-ascii?Q?bj4tjkOQOjcFrBJLguhEqFTXpip+GcmDEjSBoqxC8qytx/HfK0PW1K7FiMnA?=
 =?us-ascii?Q?5iuUaMr/nWF/XMQoQEQbG7BRCYUH4qZQpUuYJWlevL1aXVVENBsuLFcXwjKh?=
 =?us-ascii?Q?osaxHs40mD0gL4h6r2iuVHYMZEedsqC+ararzraY16wKXXpMGpBqAheThL77?=
 =?us-ascii?Q?J2DYvr4WG6Hk0BPAZvVV6ME1VBjh63zE/XJrmIkwa0RVeyI8F0A2qEoCWbIF?=
 =?us-ascii?Q?cpxvd/sjpDBhtACsO+4FSrYPeVSMqY23dbp5d+MYBOZlKik1cwZH00JqECeW?=
 =?us-ascii?Q?VBIaQ5Y0YhxSZ7bWT0R+0nfyc45duOhTJE0sWnDMB15xfe+l0Pp/QSVcQ1xI?=
 =?us-ascii?Q?7He2NCn+eLIca/1JwJHA07G+vkOftxIZqiJAa/QT8J9ZQ3OJQZJ+gUWD40v4?=
 =?us-ascii?Q?RjE5Y/3VBjazHaSH/7WYmBOruORIgpqPccBoFjTYveEo59kRgd5SJTlZdGyR?=
 =?us-ascii?Q?k6dY8Ks6wynh8scsGB3wTvGmX2PBJ9zvEZ/vSqW0gURuK0M49qfTQGNALxeG?=
 =?us-ascii?Q?BYN3yBQHkeWaKEkE3vbRWTDgU6B7IMbton5WwpqaqaB46aE3SmHJBZxyV1tx?=
 =?us-ascii?Q?C3Tz9p4NqX+syRmHCZkVa0orCY7suqEKlpl7Dyp8jmDgYNhISPva8hfwOrTq?=
 =?us-ascii?Q?oUq2Imk4Fym/7DlFzPJm5l3hyBTNXy89rOK4iicWF2iLH38jrWmAZBCMTOc/?=
 =?us-ascii?Q?j5RXcNNxgdnUWIrAM8Nn1jsHMrPNfO2g7qsd4jR/DUcjMiztZiNcYTuv7pFO?=
 =?us-ascii?Q?b6gZy7cszg3Y+XasifIcBsV/0C0x7ApswytjRLxrlUHIbeVvdsO5z8FjTemo?=
 =?us-ascii?Q?nymMys+xUkGiY8yi3Duhn1Ll+/TImu0XkskPkvhF+rHg2TNhXO0thAPY+Bsd?=
 =?us-ascii?Q?9/EgHCOx4vMFZp6SSHXdaUD/yrMX/3Jw3RkRxCsGEeFY0CTFvPXj1vlxO0bN?=
 =?us-ascii?Q?sfD4VqGnZsqvDj10kJBWfwX9+8FJ1uFpLxuWoG9eTxdtQCvCRZYHSsjEPqvP?=
 =?us-ascii?Q?B+Kry68I9SuvR1niCp/MPtNpXeC2Fbk2Ri8hnjhO7ryuHKrOdAmmxzfwW6ov?=
 =?us-ascii?Q?hJfvVFw6fNKcnPuwwfDm/Ex83NaO4n6BVZx+a2TnGlXQ3QT+FW6FcBfI0Svt?=
 =?us-ascii?Q?rUmfxotNjoX5YWRSMExxn0WE+b1/0U1FXjTwjIaKUc0hdbnHDsnlm4GShaky?=
 =?us-ascii?Q?EK0b3C/+iQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: oY18apF6ejaU0TG49LFaPwaUh3IjLFBdCZPH7tJi27HcuD0sl0DuVNRtOQi8d6/1BwGYlzch/2+QFLkOsrTx0avQoWyNYrXmTT+w92kl0Vdu6s0cO2jFZe2cMG+ut1Hcp3R65Z82SerlzSUhh0M12bzjwcpakubIuQYOtN4LictyyZXJsizdM0FmGuXmpF4ciWV+peQ0F/mblfg6lP4JnAwi3pYVlAQtUdfj8PHBPsBxAAX+7RK+bI6sQAowuBEUi4BLafmU0zI6Ab1TLCU051zaqNdguMZynckELJFNPJ2R1IlmrS4zLvMhE1IqYz2Q1Ei3tMxedGVPEtLm9ehTBA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e189157-3732-4fa7-e352-08dee1be0017
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 15:38:49.8160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEQd7yIJruHGjJFTElpVXr5KgSNqP/RfM/L9+TDsve1OErjrVjQt8lQIzpc+oykefPSoICFEVAKQi2W9Un/+fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4650
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

On Mon, Jul 13, 2026 at 05:43:58PM -0700, Vinay Belgaumkar wrote:
> Intelligent Bias Control (IBC) v3 algorithm in GuC has PTL specific
> optimizations. This version selection param is only available GuC 70.48.0
> onwards.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
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

ops, it looks that we missed that this ret will be overwritten and ignored.
Kudos to Shikoku:
https://sashiko.dev/#/patchset/20260714004359.3905038-1-vinay.belgaumkar%40intel.com

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
