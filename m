Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AE3D116F6
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 20:27:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC3010E48C;
	Mon,  1 Dec 2025 20:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFGvDJf3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E206310E48C
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 20:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764620835; x=1796156835;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tvHLSAC9OT3v/ViBGiC9KwzawA0aZIVr6NHscCLR9mA=;
 b=HFGvDJf3rhmdKznyU74KnZX7yCBquxri7gF/APRvz/5kL3wGLBqn1y+y
 4objmG5W0zHsFaiG+LzRbzb1xOFa1uhjg9m5VEx5Q3QoAYW37wi3KxySp
 2ryM10vh6SlNZ+iWirj+iyVC6KKOiadIGRotBFj7x9Ln2oKBd/zplbFl/
 pWgbXfGMBJgt2yxsqzb09/P2jkD3kibkeyC53ZXdB2bnHC5SXFJWxwoZQ
 mevPcPB8OCgt+BPp+ohWjgl2PeXQFAJLhd8Khw9s1sbMsdGwgK0VoPdJI
 EtUPW0ThphYiT5B5HJIWdrWFhx3/kJF6q0mVY37oeql3KH7qS0HycEOy+ A==;
X-CSE-ConnectionGUID: TOacrozjTG+0jZzpGOPIFQ==
X-CSE-MsgGUID: Sud9rYqFRru4yv3/VoRnHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="92050792"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="92050792"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 12:27:14 -0800
X-CSE-ConnectionGUID: 5ztcoUP+T1aD0CQmCDWOwA==
X-CSE-MsgGUID: tSExbJfNR8uUi/WBgva5Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194003527"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 12:27:14 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 12:27:13 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 12:27:13 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 12:27:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O8AASMyECmf5nj7/laGQV8Y0ryxdm6fk4aLz9UGSeLHeknHHKez79JGhsnhKE8IjBj7vZCCueTt+UEXeuU23abRY5A72ZRUBbyWbDCpQDyaM6T9Z75lzfNejfLqV7d64VMRkQukgS7G2IFbHw02mvRoWo8WdXgfGfcFaVH7aK6LXCEyKlt3Ox3zjXNVLSMlPTOn3RNh17zGcttWOVNjhJ06TQci2QCo8e6oc8ZLB1UlYAAc7fEdXasxMK2x1kWU2zitQ+uQHRI4Lzy8A0HwXZvdRdLvXM/GOeH8UHB0H6cqhmP6VWwKWetQ3itfzjA4yTrPf+UJhxDDlqhFUoyP4kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yn/YWlLxvpOS0s0A9MBOR6AyM+jOmgXTboOZMIC+ULM=;
 b=CE1yqbflA+i9li1rN31hobjmkcrk88cRajspW//VzOYUuK+I+mzJa62Cdo4LM4+EUQjxOGs33L4os/ziJjqCt2t/wht9VZPUKlPXOmsFHRtFnwIj8kZUCNObyrbmXPgtoUIsxfJoPb6BjxM3Rlj2C5C7vuTxnXVowb+nUa2bq+DnCJ7OI0qv7tWYegVt/UKVsY+k5HvAnyaILjByBCCzjrG3F/Q6PeiqvgaqKGttO6DhlLdS8JjtfL5HWH+sTeOJL7qJtfZf8H4kLuXgs/xObWmbzV0YAvjyZU+v9Ny8/qWuLqMbU2IEoPLTShzRnNnSZbrumu44t4Vn+SC+GoGwIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB7847.namprd11.prod.outlook.com (2603:10b6:930:7c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 20:27:11 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 20:27:11 +0000
Date: Mon, 1 Dec 2025 15:27:07 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <heikki.krogerus@linux.intel.com>,
 <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v1] drm/xe/cri: Enable I2C controller
Message-ID: <aS36G51_xMA1nvBo@intel.com>
References: <20251128084414.306265-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251128084414.306265-1-raag.jadav@intel.com>
X-ClientProxiedBy: BY3PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::27) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB7847:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e972644-31de-49fa-6c4f-08de31180182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fKy+Yf7nJO+tXWgc6mi79grr0vyC3g3iCQqyGhH9F+lm79WUv0EQ9fya2Nue?=
 =?us-ascii?Q?YuKSdTKtZpUUf/lVybxQ+jNbd2UKAgfnvvgA3z1YO24cKmURR6tEA/QXvMYi?=
 =?us-ascii?Q?x9zo/UfqfRbgvKKiEHtFGqHcRORjdSeCbLNRqCaGJV/U1P8iASf8XSpCaK3p?=
 =?us-ascii?Q?FWjRYnl3di2wIbMSFrRyOezQz2QsbmljWgR5MQ/trJFIrJgJJSSrqhU/bB83?=
 =?us-ascii?Q?7cwjd/xF8uLdnCen8smTvk8vlUtftqeRwq+0aKdqSicrT9htFZWyfKa8Z8xI?=
 =?us-ascii?Q?hQirwDETdbt64byaj1TfH07440Om1vTQ+IgWbuo9vryGUsRbjOpRFjZHdS8u?=
 =?us-ascii?Q?XKznq+ZsenEsbgXjyz/lwSky3qELsA9TjdIXCdnHiDi6s+v5tP8e7pCJwJZ6?=
 =?us-ascii?Q?7FEkSH+gdnoYe/rA/5ysXl0WYxUHffli3TlxJr9Gt3m5oXPjVWPVr5LKjyS6?=
 =?us-ascii?Q?HjhKyqAEQfie4erEiadRdy15rJI9Z40Oamv8qacstW8GGTZ5x6yuf1RIoLVF?=
 =?us-ascii?Q?1XMzj7PXNkjdaSkBFS9qbxLnAlYWc4lTiztnbKFn8iykyKDps0VeJMV0hO0m?=
 =?us-ascii?Q?hZHiWiJCGj3/ha4GF2xM9fzy+SsrNxhkCs0vDUuCdFPSZhcapEGqok0CCzo1?=
 =?us-ascii?Q?hCF0dcUtZSkYjBv9S/29Ib9s1SkOrcR4gSpKe/Zjga3Gv/T7jyTP9oOQsF7L?=
 =?us-ascii?Q?W0iDBhGCO2iS9F3R+4K6/wPwAOt/Ux6jF6pgfb9X90hymvda9flTSOkJY1lb?=
 =?us-ascii?Q?Xh/dfa/r9kudHUznvJpwOHIJyn6A8PZCQKmRE+BVISRKolE8Gsmk8PkPmCEF?=
 =?us-ascii?Q?vBNdbaL8Gm8Kxm3zP6p89wVbu1xslefwtI+UultoRcNTny4i76Vy9dNGntmn?=
 =?us-ascii?Q?oBvPGI4AuHvCoyWuCG9rUEKHDWZASmNG3bxlar85+1Yj/bkbVTXw/ovybJd9?=
 =?us-ascii?Q?cfEqfxHZC375jrbBtQVlbktYGBOLzWm+QWm2isKVp8sCo20bebPXuGUYC9IT?=
 =?us-ascii?Q?RfC2iIB35/UXd3Bw+ueMO5R55E37y9jA94+FLvQq3/JGkNqoJalqXB3J2cpx?=
 =?us-ascii?Q?xUxjxAR7qQ1FwsLARRM9Bbd2lF2EhHZFqIAcQBD3zPjwWzhyH/xwnb2abIi5?=
 =?us-ascii?Q?/vaAG40Q9R/bA3Zzq75iJp6YuYMkwfHYzWhltayKx7q3xlGeNZERxM/2Jq1J?=
 =?us-ascii?Q?emMri6flhygnF0tvqIwKfQxEaVlw3YbH1Iyn2DcE/3opQ0TpyNd9fa0b1xXY?=
 =?us-ascii?Q?2iMN1Q5EuRZYsdFjeCrAsmymbrCXmDNe3ZUvFIXBnOZcsolWVaW8dwTVRa7T?=
 =?us-ascii?Q?CYyAV1mZ9TuhaEQlbJjzZZrWn/JbzbGRuqUTd0GalRnQM6tAB+QTcceMF8+f?=
 =?us-ascii?Q?IXP03+X5efWU2lACZ8rJ2lbAboAGC+SWKx87Xe4HiHvUP1nqoj7x4vm72VLc?=
 =?us-ascii?Q?bXiWOQkrMPY606F55xoMEuVM6gtIUDp7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0sMlexJZwFuR1bXO1Ejy0pXsjx0jD2rR7ShKEcmKLKCTPtCnjxr/NQ2CrtUM?=
 =?us-ascii?Q?KKdzOvuDlTaxMPN3IMVe5vwu5yzsrbPvYXhGTfGP9do2pSqej+QDdnuM7vBH?=
 =?us-ascii?Q?LJl+3eUdBhFgV5JDf7V2WgMNnnYVPmSDsa3tYWIZyeSdW8TF7eB+aDYPd64v?=
 =?us-ascii?Q?LxB578e8tANhqtYA9WXmsIjOBgvpb4o1C50sCA3KQg4MvzGxNGE/gNh6yZO0?=
 =?us-ascii?Q?ztgAX1DyNEuqSFj7QoFBxHDFmZtj0T+FIF8Jmstj+TZQkFgwqziGAFnfbiJA?=
 =?us-ascii?Q?2keHbc8duaVUAcqjdFFfBcH8feP/iG6I/q+dTkWyQfZvOWDsVg0WVGwS36Cc?=
 =?us-ascii?Q?mlZTf+rrDvKG7UkhTdUs6BQ7mJjiKcRI97wufNgTA0yF6YwaiPgGZ12Gb07h?=
 =?us-ascii?Q?kPkfiSHtF0DQIps9CxynRMdip8cMj8+l9gCpUsucTwSJ10rZaaNNdxowfIgg?=
 =?us-ascii?Q?1wDy6Hwy+ob0RJ6cwQVTab85rTiMOO5zjHGOHDHNPBjgAGpUpNxHf5NZKhWS?=
 =?us-ascii?Q?6l9uJayh6b8GYa+DBAOaBYKY+df5yye0lB697dfw9uWRvwaq6IK90Gkh6Txz?=
 =?us-ascii?Q?C7PmMzQdaMQQd0q4Wq4e2/qVzxb833y6v36rCs7GzG/Dn8mUdFUQxDUZqKOS?=
 =?us-ascii?Q?dxrqLc3copCI2LSNhiZhcIQaE7DdA1TPoGWM81EUhVmjCGuzFzoS5LLxzA8T?=
 =?us-ascii?Q?oHWKiBcVRs7/ZZsW7zV5FyGUPkUj59YB/j2vxr7kQRT7o2xPkHT2YsT4X/hK?=
 =?us-ascii?Q?Ea3w63WstutYtCnMWhZW3+XtBOSMgfvqxXhbhaUTNniRHEdB0ybVUbW59GP4?=
 =?us-ascii?Q?vMKCXz5heDq34bKEcAtJ7sMDwYdmnbI39ivxY8Iz6ZTv0RK59L0XbXhXGIu5?=
 =?us-ascii?Q?i8pWF/YdkEy+dp78HzjxgJNwl+kaNl1DBdpUOzgZ2ADwOtHzdupiXYSRYzK+?=
 =?us-ascii?Q?PWOXDPr4moeIbeJkO52RzZyHQJ62TOef++lqpiMINSo3ncN1x97SWpS9Po01?=
 =?us-ascii?Q?3avnU73ut8ggA5YLXHvNeRcdMHC76KMQrCzsTtH1394YezMSX4DwPSUs/yUJ?=
 =?us-ascii?Q?FX1gv2iIqqZQWL+ZLdAcI++UL5cUow3JD8nySg7+RDikxc/LlokmjJKldGUR?=
 =?us-ascii?Q?euym77KpQU8fGMK3vnY6IsnG+YtTPO9ycFeyaW+/aWDH2hM+CeIsKX759OY1?=
 =?us-ascii?Q?7WO/vsX4Pk/KFOYWIzEw3mYgUINENR+I2cSWCRoSB8IXLqo9AgzUU+g8x/5Q?=
 =?us-ascii?Q?S04ok/Kr3T8+G9IibqWnae13cSch4yxHYeSUNtl63My+oPPcFmuZl/j0ByoV?=
 =?us-ascii?Q?e7s/E127PifaVpW6cnjgY3O4r8dgFf75GogOcdOHJslCoOR4K77ZntCxL6pQ?=
 =?us-ascii?Q?9FR+Sw5cuzvkujKEySdxNbtokjWCzN70Khd+bLvlcHtrFdQAPtZXwE/hApAI?=
 =?us-ascii?Q?jmolFuV3b8Ojpy0beOBJDoU4/C1W3/mTkXhrdLRp31ksuMra9h/d/B7kaXK9?=
 =?us-ascii?Q?geNXUfGNbTEQW3L9WQXk3cn3PiMVGhflXSOv+RgdRjvNldOt0GmVqQbtnwQy?=
 =?us-ascii?Q?R417YmCx6qnfDDmnt3pIBNEJKS2Q/PFXC465S8V3fz4T0Cin9VvDlT9S9KsF?=
 =?us-ascii?Q?ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e972644-31de-49fa-6c4f-08de31180182
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 20:27:10.9439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Xzo8dd8HynbRp86xNhd4CVG741S3SCFvaAvQ9fHgvRL5uJUCd+Cg0m5K9rjJs41VWIFgrZCIQwstXB4bSWeqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7847
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

On Fri, Nov 28, 2025 at 02:14:14PM +0530, Raag Jadav wrote:
> Enable I2C controller for Crescent Island and while at it, rely on
> has_i2c flag instead of manual platform checks.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>  drivers/gpu/drm/xe/xe_i2c.c          | 2 +-
>  drivers/gpu/drm/xe/xe_pci.c          | 3 +++
>  drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
>  4 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 9a9a8eb84a78..e23c50273c28 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -299,6 +299,8 @@ struct xe_device {
>  		u8 has_heci_cscfi:1;
>  		/** @info.has_heci_gscfi: device has heci gscfi */
>  		u8 has_heci_gscfi:1;
> +		/** @info.has_i2c: Device has I2C controller */
> +		u8 has_i2c:1;
>  		/** @info.has_late_bind: Device has firmware late binding support */
>  		u8 has_late_bind:1;
>  		/** @info.has_llc: Device has a shared CPU+GPU last level cache */
> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index 0b5452be0c87..8eccbae05705 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -319,7 +319,7 @@ int xe_i2c_probe(struct xe_device *xe)
>  	struct xe_i2c *i2c;
>  	int ret;
>  
> -	if (xe->info.platform != XE_BATTLEMAGE)
> +	if (!xe->info.has_i2c)
>  		return 0;
>  
>  	if (IS_SRIOV_VF(xe))
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 763f588521d0..2e2e9158d621 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -366,6 +366,7 @@ static const struct xe_device_desc bmg_desc = {
>  	.has_mbx_power_limits = true,
>  	.has_gsc_nvm = 1,
>  	.has_heci_cscfi = 1,
> +	.has_i2c = true,
>  	.has_late_bind = true,
>  	.has_sriov = true,
>  	.has_mem_copy_instr = true,
> @@ -411,6 +412,7 @@ static const struct xe_device_desc cri_desc = {
>  	.dma_mask_size = 52,
>  	.has_display = false,
>  	.has_flat_ccs = false,
> +	.has_i2c = true,
>  	.has_mbx_power_limits = true,
>  	.has_mert = true,
>  	.has_sriov = true,
> @@ -676,6 +678,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
>  	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>  	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
> +	xe->info.has_i2c = desc->has_i2c;
>  	xe->info.has_late_bind = desc->has_late_bind;
>  	xe->info.has_llc = desc->has_llc;
>  	xe->info.has_mert = desc->has_mert;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index f19f35359696..6de23ddf6f68 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -44,6 +44,7 @@ struct xe_device_desc {
>  	u8 has_gsc_nvm:1;
>  	u8 has_heci_gscfi:1;
>  	u8 has_heci_cscfi:1;
> +	u8 has_i2c:1;
>  	u8 has_late_bind:1;
>  	u8 has_llc:1;
>  	u8 has_mbx_power_limits:1;
> -- 
> 2.43.0
> 
