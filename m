Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCB010FCAE8
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 22:34:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB63310EE58;
	Wed,  1 Apr 2026 22:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IzGE0wgo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B192F10EDFF
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 22:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775082848; x=1806618848;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=y+shYGwqrFKQ31CffWpdWPuufTC7StlLC2zbmeOzHm0=;
 b=IzGE0wgoql6jiWhvicVySOC63IEKFwx9CvwBbLAc5tGZwlU7l13S6FkU
 EWagSbOcPOhZNRAv6JriFpTFndeKZUGZI1KBRU5am20Yw2gv8hn6ZnWE0
 Y8jkoD+zbtiJcPPZwYpclSztncmEiLSuUkgR8nlhqTt6bbhC/JnJ5/bCr
 lKZT8nPGAwcuphfje+RUjeblWXsXFQ97ox7QhdGXnY8TYhI+KKuqjc3GR
 t5d/OSI/EHUAbz81LlM1ImJbkM82XkziUpg5ltk5TXfzGyQbDn6GZzzr+
 FtvamSdD/GqxhIVcV9pIyBlIVF1JiUwObZMNAtU0/uK0TVJoJfN6+p4th Q==;
X-CSE-ConnectionGUID: xyJfHbAWRKmTB4yfTPTQwQ==
X-CSE-MsgGUID: xdatb3B4SKShQNZlcXumlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="98750215"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="98750215"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 15:34:08 -0700
X-CSE-ConnectionGUID: NF5wnAvFSP+x1wRBhMYgPg==
X-CSE-MsgGUID: N2zK+Y3fRxuXbV4R7F7yNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="221957716"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 15:34:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 15:34:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 15:34:06 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 15:34:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gmvAC13HZxvkanhSYwSqxM8TT4061N8nyNQYqLeKTitsunh2hgTDpVXgqy8I6yU3CsrpRIqk6hSp4bRh7Gbd7C3yqvXfLOkIK2LH4wUl2DOM0DaLWbbq4hMQGwRA6uiPQ3ttbmb+kYZ+A83+awMcIbPVq5ciIk0GdbZiLvjRyhBaptY+YPn9PoUJoiOWG7YK0EvlrtsHFYR9TRfpLoVjJW0j1Vk5gWy+HcT5h6QGDhqBs3tXrk4mq4aFVo8+o6/ClpAhc8TVbko6W464MvbZdIK97cRdh4UucWB06LO676Vf++WiUzGE9Bf33I2+jsREYa9zPl5/tajfxHfcJrG0Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pzOdt84SOxvv2+wv+99fdGAFyB6QIRo4XJVF681dei0=;
 b=QIxBm/H0VODZ+IUExKk9880tGBCfgn4ablVbkp//lFbzHENiFYgelPdYZRMwEJzAE/KtannYi1scQqyfGHaZ8wb5JU/t3UgDqLMw/QxCvyaOoObYK5mlX6MAO71FyPWNtoF10ZnoXMEaTPbgaf8JnNmHnjV0hyJOODg3pcU3sF0ahYzsF4Y6uGAHcc+v7+7sqkWi1b4cPIC9t5+IIb/K3kWdHJd18UZA/3cqGm06JItkzAB6pD2i/x6DzDwJ9ehOof+thzZrR18UIIQ+YqwyMIJiku6zuVRjXlJP/vPsuHnvBialyBTHhuXh/YXw76EwfissrXUpK6cC9it12ALCEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB5869.namprd11.prod.outlook.com (2603:10b6:303:168::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 22:34:04 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 22:34:03 +0000
Date: Wed, 1 Apr 2026 15:34:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe3p_lpg: Add missing indirect ring state feature
 flag
Message-ID: <20260401223401.GH183713@mdroper-desk1.amr.corp.intel.com>
References: <20260401-xe3p_lpg-indirect-ring-state-v1-1-0e4b5edf6898@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260401-xe3p_lpg-indirect-ring-state-v1-1-0e4b5edf6898@intel.com>
X-ClientProxiedBy: SJ0PR13CA0184.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: 5050d7d6-4324-4f1a-8c10-08de903ec743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 3ojAVun/eA+PlG7dMuS8oVz/N9ibnOuR7w/Ec4ejE1BTEODQpsccF34UubUwm8VlZekCdws0s87ZohQ2QjITog5u9T27wGQQa9k9tcLpiQcbTAbOan7/xq5YWVyqUbeyIJiMEf3fmN5zvsnOQ124W1R6yEC8b2Xofmt7RoM2AOddDWgLTxAzwwb5HuDcIF4W/TllydFTooM60ZqBN3FnsD3w2GTRhZeVwarVDN3PpZWFL7R/qE24/gDV5YJ2bibVEfhQyjlUtXfU4z2o89Vxp1WxlHcGNjLeL344tT9lrXhlx87hFaqRfzr+SF6HLKDiT0x1jgH0ow4tOPY9dkoMHZGtbe2PLp1x1yeiDup6pZhMx262I+60AVRv4R9R9pG51lFhUPoROw4zC/1NUImVqIkcnxBZSSR3n20R5MpoxFn6gfbDQbK+zVFnW8NJWIFpM7Wq0IDU7W1yfHlp9EaG8VYJvLFP0BR+T8Zis17Wzny8wX3uxOR9AJknTOHdSG2abi/sa4n0qbbCHPAnfcZOU26rk0eKBLFzlB5wDfmDzZm3r1qVX8E/7gMMRjPH6dS0cROry+fNYE/tQhFVrNcxAQQOuoow9s1ZP6GG08eMBOAjv+8TvkYAzIdtZmnJh0+uU0UiMYNr8AO/QZTjiekgyuAXHojvbxyn3GFQzM310y58rndhDEzMaKUQtg95D//syFyXHnMH6+JJnCHiRYZusFzju7nxy/9FheimyzPVAIE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gu977IdpcFhK0ywoQLjenM0nuaLHkcU2/EexeQ4MG1fMTPHmP0eTtgE0EnyR?=
 =?us-ascii?Q?Dr5GqCf2M0aV9noIOfroxDk26Nx2alG4Qtpa9pH2n2RxFE2zHi3N6c0sMV8u?=
 =?us-ascii?Q?L/s/A/qSn/hvRx1vK8ADR1W2hNVQp6h8PCPjUG6QKK5OMwZYKVfbYpptBBMa?=
 =?us-ascii?Q?9Xbv1jbCd9jcA8O2K4IBLcA7vf2KBq+jobJd4yRNWYcHQx+qZffb3TXsVMD0?=
 =?us-ascii?Q?BkL6j15C1Ei5xE0J3y4n1HuXg+mwbzRN9oNxN6g6d4rHJlIuXl26Al0Gc//v?=
 =?us-ascii?Q?DHWB+L03RTcNV/yyX59FUdZguFxMqWSwE83Lh7pCxMQt9YSafYSUpblZTltu?=
 =?us-ascii?Q?sSZ2qhB/1VDbAMOk/5Axo7PKnhj0q4vEfu/Bco+OicHaywNZogzmUscZBEqU?=
 =?us-ascii?Q?W43msCMJrlszsgwGTP0Tqmf3RO0UPLsAopwnXPdAeiFVDdyQdioYHquQyRDQ?=
 =?us-ascii?Q?kEPEiodIzPFWzbbFCP/5tBtUL5CbyBUCTUoIt0UM6rjPexT1Gj/R93CS5mpQ?=
 =?us-ascii?Q?3Z9cWdHIs4bspCEJHmREZ0S8xrOxXtic100ygFrWuVu5p/S+aottb89NyrLy?=
 =?us-ascii?Q?5/Ck58443g+B7A9rI6N5IuSzJGJXWEglt32sOby5vW1oeIfHa1OQnNfaDj6Z?=
 =?us-ascii?Q?xigw+a/Ufuwsxj41VF7PxVS2BV/2o7nfjTzBSu+Ws2c1o9/fH95jR/FgE30J?=
 =?us-ascii?Q?CyjMuzMuw32nvNhClsqYFgxPHsSnsWTa1JHZBssqbu48bT6a8yAMLNfE88uR?=
 =?us-ascii?Q?GdLueRjZy/I3LmKS5k+Ed2vR87dWcftt6xh+mgAE6kKGVJFrNaqmRkfb3ouB?=
 =?us-ascii?Q?OPimdzMmaSSqVBpeD6CAbt0JXwN1QcYSSRmuGxouwKFjOc2JlA8wRDXExDdz?=
 =?us-ascii?Q?9HD3gOlqwkTLkJf1cQlr5Rz0lDh3ve0MWmyOG3AaFRcePAf/ar6YhAnsKsRW?=
 =?us-ascii?Q?Ggzpo0YdP6Z3N3bXAghhht3oBri8nSuBYNAQKyZCCEzGzHEmInGjkP64dBuL?=
 =?us-ascii?Q?9DVZIAxHG7oqQMkVZ2q0Qyi1Yyn1qznRQJnpPDbz6KEVWs+dSlkASpqwokyC?=
 =?us-ascii?Q?sneJPzDs+jI0cXa1bliZC8k2+i3NfOWgPEq+p8uXaPWrg9Y4Px1OJafcnIMR?=
 =?us-ascii?Q?PkwDi2q0Xw2UXqRCc7KKHOfxpuq5qfKtrwM8bZb36lHYj0Yt5I2IaPC7Hx52?=
 =?us-ascii?Q?9iHN+RQwtS5GLDsblbIAKGosDM/6jUfE+o5oGDizktszn01K2PwrJOcshRWr?=
 =?us-ascii?Q?ox2CsIVFgvbqz7K6dJ5oKCm21ntrIJUPjbRg36ldQhPWJUb2kYHeSLLCUpXT?=
 =?us-ascii?Q?wQGI5ztrHsapyOEzhxffOS0UAxd6MYQ7HkevBQKcZqPvSWEE0SYmLkh2GyRq?=
 =?us-ascii?Q?Jx1m9uTEY3dTwjCqAEZB6nsy6UzaSicfRe9kDPTV8nZolHcKN3rOJN3vW86R?=
 =?us-ascii?Q?V3EOD/Ad9afGdQNBfa9NZYYeSSkH54TF8Y4OdwYYvwoMZMjsC8hJgBZlRw9Q?=
 =?us-ascii?Q?tyCzS8TGLjhQCUFAWY/Fog20l9xWZdbdFHI2jDCCiDsD5JQmoqxLFXCB9hQy?=
 =?us-ascii?Q?0dsHApleOMTSt1xd7tq1bnHod/A87Btr2XHXsh4VmyQx2eN7mN6ykujaptxp?=
 =?us-ascii?Q?yALQkuSxGwakLYG0S4jmhGyMZmQWywHnFVcV8dePMBowMniCmLcOr9KcBxUD?=
 =?us-ascii?Q?9Ar0t6fGXE1zIF2y9b5Yy0vi/szlHJWEkC1ygRTgPaoq6PjSRO41j0q72hUU?=
 =?us-ascii?Q?UV5IAJ1SGUep0+ZOuEPvUu2Esc7O9IY=3D?=
X-Exchange-RoutingPolicyChecked: ONoLOr0krNfwXRpQ6SNjGjucmHoUBIeotbBeuvLzKMhXhsDHQ+jfQ1IiK2gfup+s3ZP7HXit8bp5n+qUiIEEdPfvibY06DqaGzp9MiogtsuA4W0CeLtOP/RuxIvph4pjTAs/RVVnaLqHSduxFplkaBBaxZHtA6flPfUVmwSeIn30C0UYeptPRacSP2/fusZExpG1jP6IpmQhiO4fjJEoH6pVuOZdi+qDj3t5VwUhoMbMoKI9BOX4vno8zgmlOGDr1+NEKFlPTNGsmr7cZfH/qjofyY6S+XB27rQQXDWt00zBe20qPyysAufkmbBS2NlvydhMnCDoJADYkVKX8rWCeg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5050d7d6-4324-4f1a-8c10-08de903ec743
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 22:34:03.9596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eMqMS+KjNxyZeWfbizB1gvKFF3R5qGaBpIhdZsj+reNVDMLTGCWvdXd14Ebt7EdUyYHqKKupTgZVC6XNno5nzxkVxKfTQ7LgLeysds9MgyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5869
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

On Wed, Apr 01, 2026 at 07:10:51PM -0300, Gustavo Sousa wrote:
> Even though commit 8fcb7dfb8bbf ("drm/xe/xe3p_lpg: Add support for
> graphics IP 35.10") mentions that the support for Indirect Ring State
> exists for Xe3p_LPG, it missed actually setting the feature flag in
> graphics_xe3p_lpg.  Fix that by adding the missing member.
> 
> Fixes: 8fcb7dfb8bbf ("drm/xe/xe3p_lpg: Add support for graphics IP 35.10")
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 1df3f08e2e1c..6e560ef84a97 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -118,6 +118,7 @@ static const struct xe_graphics_desc graphics_xe2 = {
>  
>  static const struct xe_graphics_desc graphics_xe3p_lpg = {
>  	XE2_GFX_FEATURES,
> +	.has_indirect_ring_state = 1,
>  	.multi_queue_engine_class_mask = BIT(XE_ENGINE_CLASS_COPY) | BIT(XE_ENGINE_CLASS_COMPUTE),
>  	.num_geometry_xecore_fuse_regs = 3,
>  	.num_compute_xecore_fuse_regs = 3,
> 
> ---
> base-commit: 40f5b5bc2d3df4c7c2d4e27b35b2d8179ac3f10b
> change-id: 20260401-xe3p_lpg-indirect-ring-state-6220d15b2322
> 
> Best regards,
> --  
> Gustavo Sousa <gustavo.sousa@intel.com>
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
