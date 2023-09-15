Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12957CD37AD
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 22:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D660310E6A8;
	Fri, 15 Sep 2023 22:25:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2763910E6A8
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 22:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694816745; x=1726352745;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4HYgUJiW2qrx7qPBdUSslcKMmqqf/FA4K3RVka19Jl0=;
 b=VNV8nlOeBLm0s3V4p2pjcQCbxLZ9ctENhbM5r2XJtEtBmFc/qEFWj2De
 uuel5HkyftVbprjOtplfXp+H6Rxl/b12ANc3vb/dUR2Fpr70MfsYAP+vO
 ma0hMA4dpuh2YwTjiaHs52QS6X1FEekggPdcebF56UF4U3VlSoD9KrflF
 bE9yJ9RnwTLCbfKQZolhA9EIgBg53d/9BZKt64D34qVHexFqjoFvfD1hi
 BWhQGp46lGFGHJCkH4xD+4ytPIXogbyASM2R5PjGnZUqfPYkMgTX+d5bO
 BSUz1zi1RDtPXhCcVDtAABXTY5EaMte7QftW/uUd4YstISLCS2bjW02yD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="465715007"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="465715007"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 15:25:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="860324802"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="860324802"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Sep 2023 15:25:44 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 15 Sep 2023 15:25:44 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 15 Sep 2023 15:25:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 15 Sep 2023 15:25:43 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 15 Sep 2023 15:25:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSj8ufVxc0ye6PORi/yyrw9NGwI6BcbAAqMxAN6fpVkoLbg+zakgfa+yV40ezT9iCuUCBjRDJo/Oh3xkc79eJ5HlZZ2l75Z1OpNFf0YBml0RVs/P6C+rnHrUMMGNMU9L8MrbUldq7gN5BxGxhiWhGIb8xRZi+CI0AvMkJzHazxZQ9aW6GwanQUjWAzfnJ96fOJ95A2KXxdL32ALUyjK0KmXOVYFXEufku3pc8cOJ+yGImH9DJ231ay7fbxM0YMzMgz7zrAN75woYR+yl/i+KYrFPWIkGUZQxhJp+JdtBzIMStlWH129YWvR7+VU8vPacHtlammHZBaVeKbuhnHwp/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMlygax4HiGRqahtrKNz8m1cy80JKWjKSOmYRi0MJnQ=;
 b=jHQ/b5qXJLZExt/4tI3/3tiU2TaK7gI1pvytPH7dhnbLWY6LdYXyXLF+cLglg+Iw1P9D9nJ7sQ2tfgj/dwOdhFWEcp18lsg7Srx2S6CF3fFhSkD7ZjBY9u4C2JYHXS33BzFW/H2h6zP4K99hZ9hIFbQUH6EaY6Z4RD8v3o5Cer4G/6Ga1uAjj0FUBC3M6lwTEaNKd3FJv/T+tI8LpLyYzVT8W347Zbg5VwHnRO23Vk4yDkP6uvhnSGrVfFuPIR5nFdirCMvII+CETA5alqbzGz4n+mgHioAvW+9c8I5iAVuxQkzFps2GA/AGkE/nYfEN1MqM/iacu1J2bNx7xzggHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 LV8PR11MB8698.namprd11.prod.outlook.com (2603:10b6:408:205::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.33; Fri, 15 Sep
 2023 22:25:35 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Fri, 15 Sep 2023
 22:25:35 +0000
Date: Fri, 15 Sep 2023 15:25:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <20230915222532.GL2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230915220233.59736-1-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230915220233.59736-1-gustavo.sousa@intel.com>
X-ClientProxiedBy: BYAPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::36) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|LV8PR11MB8698:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a87766b-a910-4adf-b136-08dbb63aae51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t32RqjtZhfArmjcDnb5geWWU3W41dQcVqa4arc1CogsibagfZnHjhZfcSMY/Ka1VBv6AvWJFlZoIIwKzEAeGIQQIHvhIeQkyhA7uxEPqBzgkyfhQetaYMkFruTWVgzM4TvLqIIBduuwJ39UfNrJp6ciEjShOFXg10KT3c97qynjZpTo7jZVhIqFWDY/9qGjYlSIwDP/E9yNe0NXlCnnsBSaUkXYWQMxeKwrWhN6j4yJqqcEdj5F3keGfPuIwlXc4QY+ohvNd9aGBFNOaoqDwLWQudv0JT26cOCxK4FlEPnd9aTIpkke/UK6SnuXvkOMH0ABYH7EPWjqYsQh6hGPeCgw9JBIRDBmmk+oFmtu75mUyRJxIkaOg16/VvvNJpn5WgS3fc5JSW1MnP9kz7FOziFQNDH/eLnNoEVE+z4BN2T02Q9FCMonHG0UKSsIz+HBpoX71jTvuJ94y9uWHcMsSoHcjmRMIQzWTGJSU6MCXnVlIbxVqUdO/Lt4kpji4s4wQnWmAXCC2fV7HJPFFObR7Jf7+MIserHdGGKydcxMZ+BjmYmhbVfiskIDTW4Uu2a4K
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(136003)(376002)(366004)(346002)(1800799009)(186009)(451199024)(8936002)(316002)(41300700001)(8676002)(6636002)(26005)(1076003)(66556008)(66946007)(6862004)(2906002)(66476007)(5660300002)(4326008)(478600001)(6486002)(6666004)(6506007)(6512007)(86362001)(38100700002)(83380400001)(33656002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Uul1vO64jPIpDKQ+ZnZ2k9ZiBX5gLp0kj3aK/oN5VnakBFjtfrPuLL6VPMwR?=
 =?us-ascii?Q?54bDQW0Pg4Jnbw28ceKezrZ4ithz09PRCn9Du7kAXRcDnA6PpvfPL3v0PiUD?=
 =?us-ascii?Q?W4MI3s6U16pe/VJ+w8C2VJOg3zOPq0Ky+n7lZFO83sCD0prxTojr2R3pQFH8?=
 =?us-ascii?Q?eaS2fohAPUg5i5+IyJYoUFWp67MUGudcM7EnDsAlBsPo1BWQuVJSn6BZTmH+?=
 =?us-ascii?Q?JBOFT9rvFClBqcUI47lfBlpCPSBlG3gXQTRfCO2hM+7/nafKVrkfLdMMElAz?=
 =?us-ascii?Q?SSNewKbiY9D7K1UVjBZ98OH2Q/2yKGTAxwzJbmxoyabBDIywzYcNPmNbX4rs?=
 =?us-ascii?Q?VuiHSuMqGtDwzsSGDFnduA21FbPAKe7FftoKYnWENTS884GSI7QxUYIz85RA?=
 =?us-ascii?Q?Ceid58pxPlpSpccGvd0Up/jJobfQ8kmh+l2BMdxPzCiKf8b8iJ1r52BnPloI?=
 =?us-ascii?Q?76CFBcu2z67lrHne7KbMFpB40dBfa3rYqAuJRv3KlyRFFE6jJrOdgoYK4LZk?=
 =?us-ascii?Q?yQOKnTTZr2MLg1dB/D5F8W2mfNDyy1/icozr574HeKBIRs9Acv8ozuv1Qy5a?=
 =?us-ascii?Q?bil+ZdHyIx0Vz6xYtT+78ZZe0p4Kn6IrWFSnxx0bIBYyC5ZbBkdhS46na70j?=
 =?us-ascii?Q?Q9rYqBSMWVOLxAuZugAIhrl/VdzB1lGMOie8ZcbQtXUKobof+qGIIytASH99?=
 =?us-ascii?Q?oL/g4NzSu6UoV+D7tjkH6QqOBGEUS8yqSJ6WareGR5f18Z7fbzj6NBrQFRtp?=
 =?us-ascii?Q?iwJBUGsnxyctCFQxtbdZt+V/N/cwI5PEZ6RqiBmawX/RQkrv/8tQRkDEO3Yb?=
 =?us-ascii?Q?vMjdEXRrEIODjnxpn2vUNA1Jmh1xr9iK7294cHASy2T1yGbVk/Z+xYmoTpAE?=
 =?us-ascii?Q?qK8/frParcgaWnukNZm5tUFcqBxJ4nUmTQ1Ale/xyODBzslGdcX+jCkTJ7zO?=
 =?us-ascii?Q?pbiCM3P1a81Cgfsk9XXn4GpsighQ84Cr/ekh5Hw+7MAdhE0rknk01sNsjgYE?=
 =?us-ascii?Q?VeBYAVNxzAHZR2SYfPGXHEze3DE0MHFw7wfX3jHr1MKw2Il79rzn908fJpHM?=
 =?us-ascii?Q?N6hOzZa5RgDMzkH8yHm2Gt3GUzAcUdbixi8LK+YFQmT8IGS80XltJzs0nvmy?=
 =?us-ascii?Q?9HQb5/Z5omPTfSQZNBf6H45rfHnBY7qzMe/jQoD1eL6VDo8Hx8MqNFtR/AUg?=
 =?us-ascii?Q?nR/cRLotUMj7qMe6715eXMLqX2XRLbo2iAv0vOiMGKJViOy0LOrc5nBGbxF0?=
 =?us-ascii?Q?/5ETCKIMR5xy9cV6OxAwyIaUrVuk6zw0guBCdup20fKfX/Rh+JuwYq6AR9M+?=
 =?us-ascii?Q?EbPe0xh1hOaq/9FvUIrMQ5Mx4sNDf6clXC+6czBlX4Aq5umewut4blGOOykW?=
 =?us-ascii?Q?Kb4jw136QdDsK7y6n/4HuYzYooO6nBk4nGWzEyWeFiREjfNyA7Jt/RyJrDg+?=
 =?us-ascii?Q?DfWNwkEWpdJBfhyyyyjAxUT76OjROU6UleshxfZmef6JvyYPH/j1xBfDJ2vO?=
 =?us-ascii?Q?ENS/4QNf+ULTyNCIBSePWC3JVSx09msnE2cE8naDIjBghexayM9pf5Fh+A9I?=
 =?us-ascii?Q?gmLgGfw7dWBRWWtsfxwpPT/VtkAbmWi9BIHb6mOQdKkEjRfErpxrFR4OHp03?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a87766b-a910-4adf-b136-08dbb63aae51
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 22:25:35.4564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bbMgO3ddWgF39/p/KNTPahzWnrWw3U/XU8PAwps6jiCAFzZhS4my4OUsSr7FWoJznUprbQ4jSlpgkY1UGRRXnnb8uV4/wd/4B9tHP7yZgGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8698
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Simplify final return from
 xe_irq_install()
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 15, 2023 at 07:02:33PM -0300, Gustavo Sousa wrote:
> At the end of the function, we will always return err no matter it's
> value. Simplify this by just returning the result of
> drmm_add_action_or_reset().
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_irq.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 3f34c507ff59..ccb934f8fa34 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -603,11 +603,7 @@ int xe_irq_install(struct xe_device *xe)
>  
>  	xe_irq_postinstall(xe);
>  
> -	err = drmm_add_action_or_reset(&xe->drm, irq_uninstall, xe);
> -	if (err)
> -		return err;
> -
> -	return err;
> +	return drmm_add_action_or_reset(&xe->drm, irq_uninstall, xe);
>  }
>  
>  void xe_irq_shutdown(struct xe_device *xe)
> -- 
> 2.42.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
