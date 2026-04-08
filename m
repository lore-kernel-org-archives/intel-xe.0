Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0D4FD5F6C
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 05:04:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2127510E11A;
	Wed,  8 Apr 2026 05:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ln9wsnzT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7D910E11A
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 05:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775624695; x=1807160695;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gIiZZT8qcSHuj9x0N0bJexmMu79TjdrG+DXJwXDtfsE=;
 b=ln9wsnzTjWy+OsEcKLksC0my9gAfi2fCfrByOY1nngZbJYy+jkSVCoyd
 XJbUfB6ORWfxanywRTXK2JvpFfrtpW4wwbFmCbWyeXEGSaLNpQFa6xcm7
 PtsqcKwYWTObip8JxuybNR5teqSpAYQc/4FUQdZTXyHBpXCUU8/lCqvib
 r4E72u+1ASfCuYdD7UzydRFrDUtjt3n+qVl73Yas3urLrH2/LaJ6JS2P7
 eNZfnCsdgFXJM6VLLhlIQot9aYlq/RW4hIL4UBzLW/+V2VzKx4l43mNgY
 NmWzwjrpVkDYQZ3Vst/5zmhXt4oUfgOSQZO0grRul5d97zUyePJFgZSI7 w==;
X-CSE-ConnectionGUID: DN4QkU2HSE6chtMFwUySAg==
X-CSE-MsgGUID: PWvzoAKSSrOwaKdWnzsVmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="87982118"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="87982118"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 22:04:55 -0700
X-CSE-ConnectionGUID: bE5I8x3jSD+YPIclB64Mkw==
X-CSE-MsgGUID: M9oDDGEuRDK5ksLVv5KXxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="251688753"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 22:04:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 22:04:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 22:04:54 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 22:04:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DllKMuI4qabVPXyk8I0V+yUgV5Kr+QmeUt0QExLVngtpzIozGxMOO2U/z1ME5k+aXetYfX48u+esi7ZHv03LfhdWyGqfoQ9I2EYgNNS1QYjSz6QX33nn7alKFISlpbg/GiDdLFZxxHFA2CTpx2P9oQJS4nkaVDjFDTbhOCyfsjFIU+ywa3aE45/5cejeTvzsi3SznVRP+K9Acimo4WtJrahm0tr1mm5dggZes25rQfIBDvjj3zp+b5f7yw1UWYPdVmd671SVuLSJcv995O+E0NwuFjXor3NxHeIWho6l23bEafe5kGjjo52/0yx/GPBawUek+DRT+rqJg78WojQlYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7kjSSXNyIrpN4iMhLp3l5UXV1gk1eTTlPXKCntWvvY=;
 b=Cyhs60JNuQqHrmVw6OaT9HiFafTij59N84/uioWIEUW/cTIsI72vJ2ZEG7gdtFMDqBGBkRqV6cGjtraHNoYem/L2wnYzSa9EH6vwsJxAt/hgJCXCkSKMeCwihPyZt7T7jbkyULtP7aNdRFJIQ/INp/3kdducwxKv53zyg8JsHtAaUDes7sSQyLAnBNnavjZPJ1/TcbSCZD3PXeAYQoG+59Ct2VAzs9OhglZ3I6AIDzx0UxCc2SmFgZIMzAO5FWLPm/1KRF7e6VaQdp73ygIZCTsoNxTFqvGyf0KFrPRFZkjjcbOA/SavWp1CXjIu6GyFeq45zmtM8RaIZIpE+fW4Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH0PR11MB8087.namprd11.prod.outlook.com (2603:10b6:610:187::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 05:04:47 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 05:04:47 +0000
Date: Tue, 7 Apr 2026 22:04:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH 4/4] drm/xe: Fix dma-buf attachment leak in
 xe_gem_prime_import()
Message-ID: <adXh7FdAxseknVxX@gsse-cloud1.jf.intel.com>
References: <20260407201542.3396317-1-shuicheng.lin@intel.com>
 <20260407201542.3396317-5-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260407201542.3396317-5-shuicheng.lin@intel.com>
X-ClientProxiedBy: BY3PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:a03:254::6) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH0PR11MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b59d445-0719-4a0f-f46f-08de952c5af9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: tZGuDkAIW6YGbipMxhUYVNcqcSELVcViTWb4zK1yNHDbBTNqNRiS9VQy/vDwtAA3YyABhT6ky12PA4dT+lqLpcyR/cMcTmiEIc9gInFC0OiL36phW6bjgsCfDdXUdvmA7Qy44SugBUaNIKP3ZfYK3BUvA2kv120yPZq5AKylQroQUA4xWHqRgw6VKP4KX1qIlX66CEaDaVMq/s8BGKW1iRDGmgBz0ALgUTBVgmTXMiwUVxPyNuygZ0oGu+FnMmew/X10N2ld4a1couqz+J6OfrwqQUspR63MUBrH4p0CdI5ahZ6MvrCvAMQYaKd1I2HsFSnZDTZ36k0M/jE1wA0zQY8kObH4MLxG8wB+tIcWyHpLNkbOlyFHznZrskawufoN1sBR25H6PcaGdyUL0J4f+azk2J7socLJ7KM6xp8cARAal2h5MUcw9JRshz0lSmf8BX3GglVeILZWh8PsYwwLfXb/D8J3/EXI73GohAvmApt3JKQDUE9UoESg3JWJDiMxrX2DgkAEdHkTv5QZS3UMo3m1ebYHrPIWnAl5PagPTtEpVFyQYq6DGo5TLt3l1090IuhfvfNQqIhKuSiYvNZqSzYWjVtnUJ6FHY2RZ6AprtSb72Yd8BRNXqYDo//ebFkHySYpYuFSXKV4HacCxEwj3SufFkNhslYkVcp54nLIEQ1/LyXT5Kakc5mpXDm4em0S
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O+z6Bsh5kOQznlhVRhYJiHo0GKPz4BA0zCJsvgKKaiUQsbsRQwKZQ3PwZk3U?=
 =?us-ascii?Q?W1uriQwISSTyepOyfH+ZKT4CSax/n8gGHgh3fPX0XB7smZLkaTawdupdETsS?=
 =?us-ascii?Q?/cU6+l4lY8zytr95sGLtLR7YSo2ublXfi4dOoDn/0oxRkftwLULHV6ELR8pX?=
 =?us-ascii?Q?vY2GqwLQ/ryvsANzCDSG0UWzDnub11gXaZ2CKU9jvyG5Mw85aBleu8MA+iHc?=
 =?us-ascii?Q?Fsk+Lg3APXXIiXwFco1oF1r61nKGjlp0GtWRP+l3a+NmniBuJTh1gPGTyCAc?=
 =?us-ascii?Q?msbwvRq2G6J+Z5VVYAi5yULpBovWeoOrSJHCxeHXB8H/2k353V7G2lDqTppz?=
 =?us-ascii?Q?Ti8f3a/SMBSOXUpw0xVuxA577eH1CFRj7W6uVJ92xx+P92/k+EDqNQzuKE6E?=
 =?us-ascii?Q?xQZjMQzqX0thuKbnvc8JzwXK1bKbXJDoVtz5h0gREMUgz3xBexFNBwd7PFpe?=
 =?us-ascii?Q?oT6eczkjNyWNGQLCNdUVF/Gy4Sfr3FHrFh7rpnvA4PK3+Ze5QzH2qADf428K?=
 =?us-ascii?Q?uK3IpYFLbzTJMNBgktPLxnzZKykSIPbuSI3nCs1izcTBTucO5bhs4cHj0lfx?=
 =?us-ascii?Q?Q9Be3aOblY8CG30XJw8JghzBGnT3wOJbaCZfMhZ/iUQhO0GsQT75zveY4ULE?=
 =?us-ascii?Q?hibGhUH3dGBqRvNhc3htOA5KI5RRLqh3ZrAM/t1L+5+JvEWDeh7sZ1C/eAzN?=
 =?us-ascii?Q?4oxyX+TPlzA6BKArdo6GsDmmBNPCj97cve1AzffCbtK4U2x5vfH+bRdgI5Xs?=
 =?us-ascii?Q?8wf4oxQzfV3czjIa3FZNh/NoF5/usFzlPOsOTqxKcQDjs/nmIznfvRNefiC4?=
 =?us-ascii?Q?ZyprxiR+O+dfljmpxwj/aqxhZm3PTq3fyf4DYdf/pRBeHdFkvpBLwQXr5UA9?=
 =?us-ascii?Q?WYWeLUzrcAO19UnoYG4rrQFva+S+TVYMTKvT1/gr4A5/fuJZlJFDKZ5sXDdL?=
 =?us-ascii?Q?q0EZffhItwBVE6gpxjZv05n1sVBekolNxmiqkP6qIDntUvkuClsI9XZp/eNQ?=
 =?us-ascii?Q?QR4VDRQAe+e/q+b5bXL32h7PI3Ia9UzAwuLzTIXLufGP0KjOSZ+uJ1vJ9icB?=
 =?us-ascii?Q?ptT1a11asAP2H+K1+8yO2lIVX8c9+gFZdMu6w/3fi87FBrMoPXFBqjd4FB4i?=
 =?us-ascii?Q?gj96JKE33PMfbaCCOzP6khX/+s9YAJqJCFQZUjaYN9nIStUFQcs01vBjd/Mt?=
 =?us-ascii?Q?FpeaiXZqEcQsQCRAq+tZkXytHi0msm5CHwnw6/JMuCd8+Qx2aLDqrd7yAUUh?=
 =?us-ascii?Q?S49GIiYF+/YIO+RznA7AUS+M7B//X6VnVQmd8oqmG/dnzZLa/3hwaNGJLiPr?=
 =?us-ascii?Q?eEDNN2GjKnsbMqnp24pkaZtN7M7WFdMUn1S0/J6naUzFgmMvA/BAG+hFuhv4?=
 =?us-ascii?Q?mur37CxXJUmJd50QA2PLMfXHoGaTcdjn72u6Km4BjzyZBJr4fbxmWjlp10hT?=
 =?us-ascii?Q?qHqs8MqzsH+4uCUQIUHROLYp5eA01qbuXzjFDJJGg+L66Y8eMr1QWB4ijLZ2?=
 =?us-ascii?Q?3Q/epUirxQcs1O/kMy9aO1R4OwkmhVtn5YRFyaOOSIX7iz78x1hfch51tEQI?=
 =?us-ascii?Q?QwQwL+E1ttrimvPZ6P5AnvFjonRBkQsFXEDUYZA+IcQUXdMY9CjY2/3MIwUI?=
 =?us-ascii?Q?x4xXFQj1+OS+W65KIGCTXu153x4iHATTrelsvN/YS5yImMWmV6pWVgGpkIRG?=
 =?us-ascii?Q?EtwQ32GSh8tA9OdKuCYavDpN/NGsNTM5KmCBS2Lyv3ofQS4w9MXxcrAaUrOO?=
 =?us-ascii?Q?5xBC4BQ1MbyDTox4Ih3g/rR8wO2zgNQ=3D?=
X-Exchange-RoutingPolicyChecked: OWB7myG6hCnEJljil9Yk2dpseYmeJxv9folzG8EmJtl+4hoFDWmzNK21h6dte2YVMXHFO5sz+DmNpmKqNR+n1zErOZigmS2+19ulW8ztS+wvkCcFFjbf+6P1uPNzr74LwmBWGvXAjeV9Wtl+aTMr4mqbfQw07t7bMM2Wz3+7JPZ1qWhDNq7amsF7wuRdkuOO22ryTwh9I1wZWGOZYf0RoY/DfjTMTTRDp29o9V71dcU2snCUIHXT+vV4FeFNbAj7f1PacAWGBKDuxO+umcUkKUa5v0bu5kXVDfVQZSf7CeJ0nvHkjT+H+Aou+h2CZ3j/yzDCyUL7D5qNs8rMB01zJA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b59d445-0719-4a0f-f46f-08de952c5af9
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 05:04:47.2209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lFFRl9stBXEJ9DJrwWTLWcDZsXZq7+AcEyF89I8ktzt1QEOkQgOpH3kUw8fLk1FnEc3It2GsX3r1R/bn4ZflxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8087
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

On Tue, Apr 07, 2026 at 08:15:42PM +0000, Shuicheng Lin wrote:
> When xe_dma_buf_init_obj() fails, the attachment from
> dma_buf_dynamic_attach() is not detached. Add dma_buf_detach() before
> returning the error. Note: we cannot use goto out_err here because
> xe_dma_buf_init_obj() already frees bo on failure, and out_err would
> double-free it.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_dma_buf.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 24d9d82426b9..7702a6bdaae5 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -370,12 +370,15 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
>  		goto out_err;
>  	}
>  
> -	/* Errors here will take care of freeing the bo. */
> +	/*
> +	 * xe_dma_buf_init_obj() takes ownership of bo on both success
> +	 * and failure, so we must not touch bo after this call.
> +	 */
>  	obj = xe_dma_buf_init_obj(dev, bo, dma_buf);
> -	if (IS_ERR(obj))
> +	if (IS_ERR(obj)) {
> +		dma_buf_detach(dma_buf, attach);

Based on my feedback from the previous patch [1], I think we also want...

		xe_bo_free(bo);

Also unseen in this diff is this code:

365         attach = dma_buf_dynamic_attach(dma_buf, dev->dev, attach_ops, &bo->ttm.base);
366         if (IS_ERR(attach)) {
367                 obj = ERR_CAST(attach);
368                 goto out_err;
369         }

We also need a xe_bo_free(bo) in this failures if statement.

Matt

[1] https://patchwork.freedesktop.org/patch/716820/?series=164476&rev=1#comment_1319810

>  		return obj;
> -
> -
> +	}
>  	get_dma_buf(dma_buf);
>  	obj->import_attach = attach;
>  	return obj;
> -- 
> 2.43.0
> 
