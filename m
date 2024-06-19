Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF1AC27C79
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 16:43:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8487610ED45;
	Wed, 19 Jun 2024 16:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b8WT2Z6h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9590F10ED45
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 16:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718815424; x=1750351424;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6wWGwgM51pvM3zP2yA5Ggq3IAel9pCmiE8IVjNt7O88=;
 b=b8WT2Z6h68JdOZlzLfPGiWcWCBGumuFN+RFgz3XsxJLexbrYSgRD3aAq
 UplWgxNuiePlp9KuAJic7iVVqamyeEd1eWaKdg9KS9/f0qMK5z9qGgbp2
 kh9/2yOwTqjdCmLdWm8coM9lygZPk4egSaubWKH1Z5lj76k5wuVnZZzR0
 u1RzkSaS68e6gwl9iT3slsv8o4kJ5b+p5/alXa3UCG+ZS8tNOfaySWR4N
 Nb9xtlUaxjk+eqt3Lg0WcBxVrq4Ex+IECurlw/5o+Phakgz9j9iC24NTX
 SyZhTtckuufrpRehyPeWqN51V1kNW0ZkCTR/o0ZgF0/Im2KsjRzgkvP4u w==;
X-CSE-ConnectionGUID: IqVa8XHrTIe4PxYPrqU8bw==
X-CSE-MsgGUID: HVaZHC/sTp2JeDpnGwJ1Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="33229449"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="33229449"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 09:43:44 -0700
X-CSE-ConnectionGUID: 7O/LWpn9TdKBXhML4yHwRg==
X-CSE-MsgGUID: tzTed7xoTMyZUlGqxOp48Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42441619"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 09:43:44 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 09:43:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 09:43:43 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 09:43:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VpQ4AjJA2LHD4YSDaeqz9EdyRUvRFX4NWOgivmfLSuOQmLQasZ0C5ft3kF0tNXpH5eLDf+3s8T6E/NhcUolhF+nySB89d0tBukD02qpE1uuhjAUUJY33+mir3SrIvrdv9aqaOKTp/LM8QqsiG38bLJUuDXr2v7OqBorm/nK3/+eUJERo4svrooScja5Xl54Fef8izESZl9BOsxhrI3wyLmttGv7anZ9yKMWwRA/ZzIg8Vt7sEwewxyUBSYBSwukfXT5dxA50Hy9eG5nCRv07ffqlg4YaUkK4HtLq5EqxFj6X/U9ecobF9uNf7GjsI7SKsOhe+q/9VA3JKL98z2rHIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VyyD4UWdSHGVd0Kl4P7GE+SGdW3yCXCJhjdR4u5bXo=;
 b=SpOWoBGNLbZkLuV/h/CtEvlWjqo+MLRChklTrrGnPBFUvQhqZxNRG/mUloT46NZbqUIqsTUs7GjcOsZOpiQTks3Bl1hQ53NmocYNUODNJRmgdmbgCSxqCUJK4GLE3sLzvwv+vhpROVoEBPGhenMu7ostzOB6Euk/w+n+cYlRhQoF7Bx2oa6lEbate3TXYwXz3x/z5C6UZLcrDCaVSFYXZaZonBnU8zM045sw47G4X8R3cnhOsovNUOTgJCgzVifd4GZZv7fYoNHu+9JJPiwK9150dbogjM43dbOz1sRR38VUu7+yWpbIUomzSU6hGxOk/CesyXouFgyfhFzAreF/hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6267.namprd11.prod.outlook.com (2603:10b6:208:3e5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 16:43:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7677.027; Wed, 19 Jun 2024
 16:43:40 +0000
Date: Wed, 19 Jun 2024 16:43:04 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Move ARAT interrupts enabling to the upload
 step
Message-ID: <ZnMKmN2A1HaQNaaN@DUT025-TGLU.fm.intel.com>
References: <20240619163413.817-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240619163413.817-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0173.namprd03.prod.outlook.com
 (2603:10b6:a03:338::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6267:EE_
X-MS-Office365-Filtering-Correlation-Id: bc4053f9-5495-42de-5d4a-08dc907ef95a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2T7OV3g4yhdCw2a9/SfS1birTV+NlAIAysdbZH6Sd4KJsK17llVv6nRJqTCg?=
 =?us-ascii?Q?huwRYRtKgMEvIMgYtmikmqz7Kt5mjFfH0EJUhPIeniEHRSrN99LKK7Ncz4+n?=
 =?us-ascii?Q?/pzdDTvJ3pGGKSvOlr4fBlowuULsjIl5yDwGKtwyZuiOXCwYeZzVouDH9rcz?=
 =?us-ascii?Q?lY/9ljZsSHN4JWvvXxllxO0Pky4+ewBr5lPRTr/ZKyJh98pNjqBfjuZNbW23?=
 =?us-ascii?Q?TNhjpBJp5WeQFpgyS5/hl7bx060w7J1/7kWIfZn9B7lwC83YfUWCX7kKBHo2?=
 =?us-ascii?Q?smsqZeX2iy75YCilC16TOguYn6zjcMAjQGglz0POHR9OwaAMJSx7tamhm//0?=
 =?us-ascii?Q?lzP427REwnB6CHHqagmNkDiwxhI7LN2m1J00aCcG9jQ4d54Y7S1bGctNKDpt?=
 =?us-ascii?Q?hpXHmQ1W/9IkAvE/EsS+c4tGMSuKM31O7jXIB1gRQ/nHbX9L8V2DaTDf9OgY?=
 =?us-ascii?Q?7jIKdgjyooBdjZbSVhqJ/1i7AaxKzcqBjOHUqg+Phq3FN4SktAlxx+bGlY5y?=
 =?us-ascii?Q?6UUbElDFvuAeWVDBQvsGP1tMK/MI3jYmZhwT1IfwxiMGUUNfcuYqsYdzTZwg?=
 =?us-ascii?Q?CBJErE/69dCHmKbPOalL9nF445g4aTUenXhAYskDmrM+ib88RqBiQhB6SpWk?=
 =?us-ascii?Q?wIUAkByehWEjRD7PFhWfSu0PYCBISD2Md0V9Kp5bI277WcnQ77diL1BKKF+l?=
 =?us-ascii?Q?hrvpYXcae/jSDoXkH6NJdyPdUWDPBVNOo0ywlAbLfzGjjyN5w6oHuD4o64L5?=
 =?us-ascii?Q?ywFGKLhbxS6vOFVWc+NTtaGC+6M+cHNrsAkmmshvi5wfHqjFYdd8PJl/+Cf3?=
 =?us-ascii?Q?IG6kgIXccuaPlL4VfvPBvt5NdjdaI1UyhI+f1eSFA4DGqTptD/aLS77pLvzP?=
 =?us-ascii?Q?6kJL6acgKsPxmHiysBTBsU0pDNs1wO02B0gNhTA06WOfGIh/g3tTlGnqFCGm?=
 =?us-ascii?Q?dyCd0iE1cifMktM9BJHPx9MvQAfdABmQzV4ooq88VJYzMPzgD/hYB84sFxjE?=
 =?us-ascii?Q?OIfMduKLKKw6JYZM24XRiEa7ePj8QeB/GCvPuu8DWWXKd/DBzzdhG3YK8KpK?=
 =?us-ascii?Q?S/jjsWnwyWuDWq+NvjMm9MtrG9I6FiSdo/nY45YvqfUPlJp96vSzfuF0kUgf?=
 =?us-ascii?Q?fJ7dIO37WKv8fjI8O4esbbGmLxMv/fRsr519KTHNx02/ZC2aIyZa7gvnn5+w?=
 =?us-ascii?Q?4JhWz8x0jnhFYyPfnuEsoFdj46nKKzO/y5o5gIpvVxJsBJprd4nDM7thjutQ?=
 =?us-ascii?Q?2aJi+Sn7ZkwDO6ag1mGALIMJlkXPIJ3CeNTeWHTjsp5umsT5kYYT+ji/+rcJ?=
 =?us-ascii?Q?861UwQIWqjZhE2n0Nyjy5abi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iEPtDZQoHKM7w6T/8I3Y18wLWRN7j3JU+kIf0Hpo9b8/aCq8dS8P4gpFK6vU?=
 =?us-ascii?Q?5ZkZupTgOf0wMToIQAaIkJ1edd5ze+L4SJN72C5oYNmC1VIhhLmZq/z1zsbS?=
 =?us-ascii?Q?uIpH5+2vWvF/or13WcccuPCzRfSEO4RcmnfDdPz9j+N/FHtU2/jWys7n96J0?=
 =?us-ascii?Q?RYU9TUtbRc/ynRAc9debmJ/S3vBBiIMsc8J5CuVHDHqNrjC21UZvl7RcJnsK?=
 =?us-ascii?Q?/D93zPyxcGAEJxXOgDlV2vkO0Am2OYDuxLnKHJ39KEwTmdEluFIvkFK3PRW2?=
 =?us-ascii?Q?xlP97qjGjogvI71R/yN0KFw6ULCiXEOOaer6UqA3wepjs8Wa+0RIxP/t6k/n?=
 =?us-ascii?Q?ZlOepnu3fSP6kpbVyIMcZILSWqIX5/GCqnSydrp9/0DzlEbNzKxxC179NDtc?=
 =?us-ascii?Q?mNctofO18omuq2Bp5Ss9cqQE3yxod47/pChgd9Via5+QtK3Ruyqy01TYT7Fj?=
 =?us-ascii?Q?gVUP7acvpfRmT+L7jbiQ72/ffYsRXjgexzJbtkgLsXRfvEnNJE9iVVN9k5y3?=
 =?us-ascii?Q?NUsMjE+MB/n+TBJxNZxlSS7PMHPpP/P/Kksx0pi6RBPksx0rudGaEfK833i1?=
 =?us-ascii?Q?DoKx36jpMCDw27+yPJtFQuz2pQRsuLKIfkIH/YZROUrV8s8BoAzryFB6tzQo?=
 =?us-ascii?Q?P/d6INOGwtm4Yd8HQtQ8DxvnNXh9teDfCAQi/NrdfX6gH1KhtWELVNI7n/vj?=
 =?us-ascii?Q?xFOAvCN8ZJkx9S/DqTiFHxqjY22MGJ1VvjiHqnSZiksMFfwWPgiTEvN6UHp2?=
 =?us-ascii?Q?tLdcoPt59nvboriCezjsBsqnbZgAvxXEdLvMGpSvvqfBc383iUZLYOfO6x2F?=
 =?us-ascii?Q?kqIZdpWObF0lgHWKb+HdNeILnIDdspKpfrtY+xsMEOT6xwUcWA+lwB8yQf+m?=
 =?us-ascii?Q?YncW6egClBW0I09nCpv2gtR3Fc7euNf3SVZkrCTC9gHRsqZ9iUDo5CXlVpOe?=
 =?us-ascii?Q?Y3E9zRy12tMXHEH3jADPoQX5q2B1ceekeTC4nO1GNl6xNNL7DS6wnD3adXD5?=
 =?us-ascii?Q?BrhNPDiqAGysQzaD9Mbdofg1KhhzRSypOAmvr8nCS5T/+7o1W1jhdMu20VZw?=
 =?us-ascii?Q?ffeVkQFBi7RB+ID1ZiDCMkR6J1FPjLGjQB25UVBD2KB4QY1hTONKi5F1J99L?=
 =?us-ascii?Q?Kqs22HXzYOQi9yuFU7GCuqnRvX2b50zWrNRx9+MWLKt8aCXjXcOMiOm3gzfM?=
 =?us-ascii?Q?TXbsFNu3h/TfsDhsbbHu1tnG2t7lt3dQoBadfpKjLwFQtFhzDjEy8QHhbWv+?=
 =?us-ascii?Q?o1JHptfv5yDyR6VNKgs2nDyvT2wpLsQgpu5DIHjjfHKxPsc6bmujZIYuZj/g?=
 =?us-ascii?Q?fDeDVX6keFb7ANyjvYwCxShwIisquFMWeAuxcKzkco3W8kcTk/a0dft54OTp?=
 =?us-ascii?Q?ghm3B9gAbe0f3wKMhgWXT90w0nSNBIbgcvT0UvEmKXu/nt8XZ2krb+1PIWl7?=
 =?us-ascii?Q?bxJOME7A3PP9zdehsDgNtGBTOG1Bz1JR4oym6yNHR9sH7ysqelXbZvisoKc4?=
 =?us-ascii?Q?BftYGdgdaqQJjQdZ6XyXohEmy7JBpLtVI+sl8JuXMtF9rueQdBZ9y/VSB93q?=
 =?us-ascii?Q?zaSS+AX7zb0CUfr7cLqmXJxnlTrKcrjtxsvX7aZAviSMCH4WEYGb4RP8Bw2V?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4053f9-5495-42de-5d4a-08dc907ef95a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 16:43:40.4426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gq7wlhjcjXyunAUjq2E8mfPBZCSkXX3wQudMo01y/EFD2mS1Drw9c9nm5f6x28XWSmhe1DK0543ZgNzGhxbk6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6267
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

On Wed, Jun 19, 2024 at 06:34:13PM +0200, Michal Wajdeczko wrote:
> Even though ARAT interrupts are enabled by default, we still want
> to keep the code that enables them. But instead doing that in the
> CTB enabling step, move this code to the upload step, where we
> already setup few other registers related to GuC.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 7ecb509c87d7..02c028d0e91b 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -476,6 +476,9 @@ static void guc_prepare_xfer(struct xe_guc *guc)
>  	xe_mmio_write32(gt, GUC_SHIM_CONTROL, shim_flags);
>  
>  	xe_mmio_write32(gt, GT_PM_CONFIG, GT_DOORBELL_ENABLE);
> +
> +	/* Make sure GuC receives ARAT interrupts */
> +	xe_mmio_rmw32(gt, PMINTRMSK, ARAT_EXPIRED_INTRMSK, 0);
>  }
>  
>  /*
> @@ -865,9 +868,6 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>  		guc_enable_irq(guc);
>  	}
>  
> -	xe_mmio_rmw32(guc_to_gt(guc), PMINTRMSK,
> -		      ARAT_EXPIRED_INTRMSK, 0);
> -
>  	err = xe_guc_ct_enable(&guc->ct);
>  	if (err)
>  		return err;
> -- 
> 2.43.0
> 
