Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94133CCD184
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 00:59:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407F810E254;
	Wed, 15 Oct 2025 00:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zwhk3Oip";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE1F10E254
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 00:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760489955; x=1792025955;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xVPXAaPpF6y/sH7YVDcqzdguf38tMu2umCjRfLr/nvE=;
 b=Zwhk3Oipjfw4t3VNICep/F34VQDB1J8NhcmWlezGzrFuCQyKYeJrF0jQ
 fLfZzJZMttGZbTl65IEfQj7NoRQqmM1CFd1/czdESeqd1ok5MCy+ZYQwm
 PTz11x6SM7TJRLffBbfwZTiAas1+TG9ensjG8C/TyolDhfPw/wnRDrp4c
 e7/ILFD7gC0sLTxT2ME8KhBsSauVZvHAKzy8oXjTCa8RolhgaxRrXjKcx
 KJBCCdZiU1neZbM0+rSFUubXOJvmwLdYkgIyo0sqJ9gcIliU8Vu8KlotY
 uKjg967yKOTWPaKccqN3NgHiLKAKHgbRXLTVuYpQvVOfsV6Tx0IO66LVC Q==;
X-CSE-ConnectionGUID: /DMz0m1gR+29a+qddiJERQ==
X-CSE-MsgGUID: iu6WphXjSOm4UGeMhnk5qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="66518790"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="66518790"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 17:59:14 -0700
X-CSE-ConnectionGUID: Kl4sqg9pQxKY8R7XCKq0hQ==
X-CSE-MsgGUID: vGP19tdpTqi4okH1nCKYVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="212637804"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 17:59:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 17:59:13 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 17:59:13 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.4) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 17:59:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KjYHvQQMS4y3FHAZAnFe9NmgWv2PUBGCTD30/J911Z9YYkmEiJMN78YAWMQRwgOAKsqhjGDqKuubcbhF1/54atJfj5ULfQEq5hcqg+eGYOy506rkX0lvTdOv1l9lfEt9ToeOsulJgNDFSIXcBaOU+mx5caCloJaFGT1369cs2AbKv5FjV0A5n2VN+93By6lDk+/OsUt0JTZqdcHKWLkqGS6JfZPXDusE92MRUSBmBY9IvG6DTA5r6lq5aDMCxk7gxU8UniVodOWbjoEDYzXsHiNlqNSnYbrUx5Bhsxr3Ic4auI0dPxXgl2F30dztBEB9upjkZU1kz5C+tw4tz+lXHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLKwc7lt/MM4dmIlL0qOkE475VR9eMTg+DvE+WQwA6Y=;
 b=SOaQyEW+PQ+i9oPNFzV4rFRA87eYi5Y/uSkBiHINhWlrq8hdx4QjJSx46ejL45QwcDZI2LBbbiI5tD2W4ALjRqeZDldXdVqo/KpaZGMoRC/uynXTMXyDdZT/auswKX9PCZss5491kj6znxN4NATfYYZWvobpZDDbMYfGgQoMMnUwPa84otqHLZUgl4N1LwWrk15CEuZFfoa5CRnOTxARxlUH+3XSnIh3NX5hd4IPcvhceSRFUurrh2sc3x1fu7jsCWfWd83lUaF5YsffC/dqFkfc/fTZtVUl74XEnFqPfAmu7MBn64tJ+q0Qp/Iai5x+wC/mHXz7IxZnqfvSQ1rs4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8553.namprd11.prod.outlook.com (2603:10b6:408:1b8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 00:59:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 00:59:09 +0000
Date: Tue, 14 Oct 2025 17:59:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/6] drm/xe: Correct migration VM teardown order
Message-ID: <aO7x2n5BKTY1toLJ@lstrano-desk.jf.intel.com>
References: <20251014180927.105077-1-stuart.summers@intel.com>
 <20251014180927.105077-6-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251014180927.105077-6-stuart.summers@intel.com>
X-ClientProxiedBy: MW4PR04CA0388.namprd04.prod.outlook.com
 (2603:10b6:303:81::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8553:EE_
X-MS-Office365-Filtering-Correlation-Id: 97bfdf37-dff8-4944-6469-08de0b860c31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AKbeyde04Mh5nN4gpOuHnJN2rnqRFIIKv2lT8HPxW6p9jMAc0DTIBu54SENS?=
 =?us-ascii?Q?1eZDfYtz6Bze9z74eLFSvK87TXJb2iM0K92ha9VzDfh6p8d966vdGsry1U07?=
 =?us-ascii?Q?Mgqdbs76t4U5j8UYuoJWh7HG2aUtffcjgLFEdTQl7veN74QQJYZL8EoutDt2?=
 =?us-ascii?Q?wKF8wKL662yUruWF2G2CV8TtfzHVgErDS3BQS2Fg1fzPw1XA2HmpEvocViuy?=
 =?us-ascii?Q?fZOnLuyLZdB4Ubx6KoP/ECslMbOfq6N4aOt/97/aqEZmLPlFnsDGrGtx0CQw?=
 =?us-ascii?Q?JAm04SV8GMT+7Jznd48ipYf5aXYTJ0m982mpT332AlMHzx9+Cr5jniWsH47r?=
 =?us-ascii?Q?7bvwcUKy8EfwLsurd4aoahOQXrlQJQhMmHwgELlhWnWkcc0Xx0tL0IcXStW0?=
 =?us-ascii?Q?MXUo+sTGPpDLpLbqCiite07iTOwnQXOUl9lJUBXWxn8fj5OLoswzBUyR7Irq?=
 =?us-ascii?Q?cKsVXEhbCpLIVIL2Yir4CdI+yMCD5R2niwTj49fQg38gMANEUzJfzussJD8f?=
 =?us-ascii?Q?dmzrM7z/9UvxTPCdGW+P4eYZA9OiWf1r3LIJni7vttf74ou6q5oQTj+DZSh8?=
 =?us-ascii?Q?U+UTDrD4zszIsjnoQbdjmPGvBlwhwlo3ZjywuLZ72nttLHrz6BESg87aC4a3?=
 =?us-ascii?Q?q5AZNYpJaPi2aUsGtldbEe9vHbvwPZtaY6XiPNHM90DwvRn2VVkWMmeAw+MA?=
 =?us-ascii?Q?jdnGobbENNINuNaN6b/lWUSges1WhL+D90UpaST2EiHuwY6F1tA2eRY0PwZS?=
 =?us-ascii?Q?jlndBzHxudTKfaydaat53LQlPuFTH9JQg/UlctGtscxTcRFaWDA5Z7tlEleA?=
 =?us-ascii?Q?/sldGuG5CzTpTLYL5Jc8b0rU+zO1quyQmauNxWhVXd9fqChlbzdPmEiXG5Sb?=
 =?us-ascii?Q?ZdtikY8ijUKIgFydzJv7uP+NrIQcC3w1p8XU4zQiHcQj7h7BIHIIz2omPO/p?=
 =?us-ascii?Q?VpBJzRhQ+6VBMEDhXel0OfDQKCvGwXdDS3ykVgDZeHUcEOyzq2SnsZTq2ORr?=
 =?us-ascii?Q?qAu9u0UHlx/mnEpo7lQXMIbg07gm1pIbVUPymWR2Xl2wBBYd9utbnyMa6nKn?=
 =?us-ascii?Q?KvsAPXwNMFkTjyBi5CAFig9v4gBW5ThHb09SNO5ECjXHr9f15aBXdfh+7fhr?=
 =?us-ascii?Q?v/2AKOqdp+dmyFqIA/fgKs+v/cOOTVaUfhaiWfitkS8Z0FPila8O4vTuVoYd?=
 =?us-ascii?Q?lpEIputDT20dFI/S1P7LjaQEO9y5boyZ1Bl20Y8SyCMBZZMPprWoiBur18qf?=
 =?us-ascii?Q?0e5NOWjAzYH9E4UazJTfQpoNPb0uf1DJw3DWEbg1YPq/oZKlgj10jl6jPTi9?=
 =?us-ascii?Q?3YkzOr3tWziCVwUJlIdhHqOGR5JWv6un+edTDzeXXSgOhYlOj/KVlVNGtQ+g?=
 =?us-ascii?Q?b60XmQv4hkBUNcFot41x/blNMuYDUtGwSJ9Snz3Ru8xrTiR4dGmIFUcvnxk4?=
 =?us-ascii?Q?WgzQin7kf4uEK1x/jom1vW4o3I1Gibxj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3N5r5Tus0f+MC7zQEVSgZGxtq51b1HBrnMNQ/1z9GMqRfKsIqmT0c85ZqAYr?=
 =?us-ascii?Q?icNjtbhR7UKGNx44cVFMkHA19GRIsb4ozD4SaluI8Xq64Y9L2IBv32kxKKzL?=
 =?us-ascii?Q?FJTLcc4QFW8BS5yLca7Bim7eEbwwPw0BCGwmHN8XXd8GKcwSQ0tMjXupjhTP?=
 =?us-ascii?Q?EkT2E9YEkTFNZ8+saCzK15sRBoWFdP7wMO7gpqpTNbXBR21iHpEU8lnUl2xu?=
 =?us-ascii?Q?5CjoVrN9dSOPnhsaeHLHNoxlDjcoRqT+AafH01lOkU7xFfTTSr1h6RwZUlSP?=
 =?us-ascii?Q?0TeBg4tELfVBJOvVL1fzUQqT0vhC/VHa9TBKGd4n2mrt8XiHN5YxLaFx+dmc?=
 =?us-ascii?Q?kMGwqUCVZsC4tfOfJD0z9NUsYgWifhW5F8gtBReBczDw1xItj0YdFGi0inIR?=
 =?us-ascii?Q?FKgHyiyRGm2Jj9vnU0dmL5Rrl0YiNa1i2lkzsqCAR0p6DdvEBIhRNbog+5JD?=
 =?us-ascii?Q?auPsf8U5ChraZvqUCf4DwPfxk0yx7Zn14B3Vpyuj57Bsa865rV/cEzoYf0t7?=
 =?us-ascii?Q?fIvPvqjfnjlbDMQEgA1vbtxoJaqv7sGq9QkY5qyO5s3HjX3j/BBHebbL6N0p?=
 =?us-ascii?Q?7E+gpUK7WZfHuNtxy0vDTWUa4uLTrPCqrt02H5RWOLzWIuEUqlWBeizzCxNU?=
 =?us-ascii?Q?VfY84D7TWWgArFa3GOyknt70gVbEai44yg0L4uQrWw23qmcvf/w8HKND3LMK?=
 =?us-ascii?Q?+uXDTMX78mZ1W+JXz6+9V6xnnUjs7JeSWr6Q23HCLyCsgBrh8yaivHJPkRGu?=
 =?us-ascii?Q?dJlwDSOdSgNEOxnY73vsOmtf38BimNTBY5BfwSH12lO//Uepxi2V9jTGaQlT?=
 =?us-ascii?Q?n0DfbOAcOQxGweqaGRYsTCO+wUKnLFiy8FdL/f9DK6Y/8picpQScO/XzAWqf?=
 =?us-ascii?Q?opCvJftI6M9a7k2b59boz0AVARaSB0sp8b+ya7JqZuBUdfZuh3nUqzUKISb+?=
 =?us-ascii?Q?EfbI5JKVQ4B++GXFP6KyzlHZG144YI2N0sG2ekfmIBZ58WebGqQvhD8EupVp?=
 =?us-ascii?Q?Tc4j+YRjXGOJUaQdbuBKinPjeSZ1k2Fu83NGCbfNMqYuRIm3ZDLhyv2IQhRw?=
 =?us-ascii?Q?4FpcnYZTDrSZcxqQuYtDnPS+gL0lSlDJ3bfzkCaRqgrB9JqNBaUCazvqVdMF?=
 =?us-ascii?Q?w7FceYzBdUkHiemx6bKT9c9JQVLnzGy7xwK9EIBDs7XONOSjl8yA53Iuw8xH?=
 =?us-ascii?Q?CIwbsUKzMwCUuCJmaXz5cw50Dt8jh48bXKrLbbABMafwLpPtn3LVlVNWd/3w?=
 =?us-ascii?Q?jsBl8H5U9kVRR6kYmd99bgjJoscEEoVEr83OCLSImC5GwuFYV+wkTMVHGaRL?=
 =?us-ascii?Q?x2nF8hwwklZy/u0PAt9Ukq340IztjlhhKivoDmVy5T+ZadUSHuhQqxh+ynvf?=
 =?us-ascii?Q?g79SHtZ7oS6DoVxnIjB+/BqXFvVtX+RmaLHQOjG2akLzOV8KU6W7zh1V+rJu?=
 =?us-ascii?Q?XCi5R0SUew6N76XVDoMweyC+nFzBvbsBr4jKnYF4WpDBCxoKA4WifCxKIj4b?=
 =?us-ascii?Q?yQDTXnYss2QynHbqVW9YELvYQ9EnviIbzzNiTKiHobS1ssGuGLirf8pDDOrt?=
 =?us-ascii?Q?JYZOTVZgf7FFfz/4TXuj5XykyE61e7jA5aP6AIiVAlV0funuq5xPA/bUfWCP?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97bfdf37-dff8-4944-6469-08de0b860c31
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 00:59:09.3007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yOaIVSA/w/JhafwKVB09MiCo9zX3ZeUxXAMoahZia9dFoKE6zYg+Uezjl779G2kiOqXtiTPREr/ZGv8x3csnfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8553
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

On Tue, Oct 14, 2025 at 06:09:26PM +0000, Stuart Summers wrote:
> Adjust the sequence of the migration teardown to match what
> is happening in the init() function.
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 7345a5b65169..b1747e442a7b 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -100,8 +100,8 @@ static void xe_migrate_fini(void *arg)
>  	xe_bo_put(m->pt_bo);
>  	drm_suballoc_manager_fini(&m->vm_update_sa);
>  	mutex_destroy(&m->job_mutex);
> -	xe_vm_close_and_put(m->q->vm);
>  	xe_exec_queue_put(m->q);
> +	xe_vm_close_and_put(m->q->vm);

You have UAF here as m->q can be destroyed by xe_exec_queue_put.

If you want to switch up this ordering that is fine but m->q->vm needs
to stored on the stack before xe_exec_queue_put.

Matt

>  }
>  
>  static u64 xe_migrate_vm_addr(u64 slot, u32 level)
> -- 
> 2.34.1
> 
