Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4824EC64EC4
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 21:45:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC5710E044;
	Wed,  8 Mar 2023 21:45:51 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18A310E044
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 21:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678311948; x=1709847948;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/2kUD2mVQQDoL4U2Ujp27G5tJAIghuEPyDWTG1ku30s=;
 b=DHLXm21FPPkVY3D0ImC6SVPOG5g6CB9R/48uNVhhNHIewMWUnH9WpgmG
 L1dN4ne+N/UnF8tKwzcJDuVKYsb/tFidFAh6sTUeTdwF8uzY58hrmxZ6e
 eJAUYZ9VIYkuXqSVpWJ3n7iT09uXxDplGr+R/GqNUD5jmDKmGjZkHc4wt
 0RVVyauNs97hvIHUIDnizRTwLby9faOLXutgd3sB3LjcfC094GPAGa1wF
 G3aXk6A5S5JpsOpSvdrKFvWmILsWidfGe7OcMZVZodI2AqrQt8M4AX8uv
 1/HRvxVtxQCtIIjDxRbhn5YO1m0UAGpYUnacpGdYJ941nuURTMRQfkcto w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="316674902"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="316674902"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 13:45:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="851276419"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="851276419"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 08 Mar 2023 13:45:47 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 13:45:47 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 13:45:46 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 13:45:46 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 13:45:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYNUNpCX/ey+4dBhuGyFGmSgu/zNJw5hisIbqv/5xn8nyB3/n7GdUQWRTuT4z7ornl3iiPd13/kBb+ffrt3Zr9kvTpdww+4dLI5JgHI3+LNIDteOzRxMPY0cH1T//x5S2tUmLiWXMGvyjqFU8Q4zvNCj4V39yMOGAN9fXbM8OV0SvIUL4QKskOBTBwLQSZ/u1eki2NgKGnDmsOXA5FnQv1ZpfK/WrxaBHSgBMec/Rxcw7G21QD5kF8isK21zaPrXcPXKvoesVPDxMtwrz0+VF8jCjS0V0TTeOfkBJIh2bYPG4Ho5bW5Z7wzMyjSf3bZnth5l5iN3zFAIMyDjnwg/6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2KXn9zwzxqYcOx4kI8FOJ2m3cGNJbT0NTQvKIXEYSk=;
 b=geIjZNQBN2JuocJhqj3VRizBTPIWlS5ty8pMzbhNDzncWqqpWHOpysCSBc2pgTU8gBX9/hN6lJCxEBmuZ3rr0tFBl1GYJfMidWz+L8UBBBW3KS7LMKNu9pF+6HqgZpzGaaFfSJQV4w4fgRE5VLdgL6v8HZzr/rCdLMvA+l8jt2hvYMwHLsOgGLrrpqrCDZ8XH0iSaRDSECJkQOJsfppzgt8clKwzat72v3EEvjE+FjdRy3D1RoJE6kwep5/lBlv6e4JmajR5bhf9dMXj8cI6AOP1TiIBd8klUXkJZSFb2qvjCdNiD+8AvgWp1336Xqkeq7OBi88LdaRt9UdZLBTeWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MN0PR11MB6133.namprd11.prod.outlook.com (2603:10b6:208:3cb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 21:45:39 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%5]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 21:45:39 +0000
Date: Wed, 8 Mar 2023 13:45:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230308214536.GV1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230307092446.1263266-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0209.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::34) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MN0PR11MB6133:EE_
X-MS-Office365-Filtering-Correlation-Id: 8145b0a7-9e2c-4ebe-10ce-08db201e753e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SG9rJjPKprfSIn4tY8XJu/kp5rxuo4jb0YgX1I8oc1pCVfqOliLCv5l6ECg4JfpXgIex6FRFP/BeUVw+/HmXnSfiUXe5dGDIL64wKeYVfNIDjOvW4aZXfwH1mgU+xCCrGfWYVO7pmVEmiPJkszjY/OTMPj6bizvQrgrL/0at2iTqgdrmb/Bo8ShYAXe9h+kPouHx259hqxnK23tA73NhIjhDwHkTbqFcOzG4kfRbs5OonDXp8xo8MyczqYEw/bzD2uD6hFtRZyX8gYuwbOQUAO3XG0LXTwt2XFT4ix4fBuI8N7YFyuqg44kR8Mh0rX+06Tzp1EbWN/oSDWVTBEGGgg2DLoT2XCLO6JvXdOtmTcRrRVDIPSlxTzzUcE/ZbTHTPOWB7My8nTvZN8K++sob/ZEH99Z/9o9ucTiixOgT17QASnL4WVPJQTNMKcdopTsXcVEvyv3AhS7OCdGY9F42q/YiP7qLVsHKL149vZ2MXz6P86m/RXJs6j+WHx7zqOWsHAW7Ts9wo7wLCJDdQCSHmVzP9YPmKK8dRbJS9Kc1lwnz07ToVkXFQpBD8Ckdrcx9eZ4pPNdaq0a7Gn9OErepmGEZUyVVNXMQSi7mfo9JSCDptgVnYI9+aqi91iu0nIVl7jRIOcuQKW6gDjCrmFpeNDqhctw2udYJMBplGUj05pueu7HODEYRsf978964ouUe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(346002)(39860400002)(366004)(136003)(451199018)(33656002)(6636002)(316002)(8936002)(478600001)(6862004)(6486002)(5660300002)(66556008)(4326008)(8676002)(66476007)(66946007)(2906002)(41300700001)(82960400001)(38100700002)(6506007)(1076003)(86362001)(26005)(186003)(6512007)(83380400001)(6666004)(32563001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?03wV2hzg+J7LB2PgSBgeCpqzeuaX45yWJa01r5Isuvc+zscd36TIkzJV2W2k?=
 =?us-ascii?Q?So3+Xvto8bCfmT7bZZiygHsOsxM7PrUdvS62nMVOJrybqb0RQTSdm11EKE8M?=
 =?us-ascii?Q?AVnPm6ZhcUyYJOfWqgw6X1QgaKMB9opL3EEm5NOvAeO4o9XzWEKhiUpIk/i6?=
 =?us-ascii?Q?2/DfQq8E00brmFnCyHEeEZl38FhRew1XSHxjvm9/pcZ76GqVfYS7OyyVVEGX?=
 =?us-ascii?Q?vV/8B1s/3t0DZZQhc5UYFX+6LPbrXrJuzJxvpVf5oFkNjXBClYzBpp3ls/hv?=
 =?us-ascii?Q?JAJJL9mWsriU7/HkMHDmN+UGfOTiaHGtHUWbvci4qMPJl+/X9AwllUwPIKQs?=
 =?us-ascii?Q?hWOb8kNAh+iShdzsrTBu5eNgMA6X//dfqFJhpQdFgmhTzM2UPNtG4gzjuvRf?=
 =?us-ascii?Q?HUVCz7Wkv+rpeeFPMMDnb9TGnRqCUtYCe/7MoC9ul4UirPgU4z5m1FmbA+Ry?=
 =?us-ascii?Q?r9tWKMhcrXunT6RAGsBn/qmThyIlR129mzPM+RkkVpVkIgQndY4JBO511oqK?=
 =?us-ascii?Q?f2FEeRGCTt9Za1pRNI80WSlHCKof9mHACZgdeBIWfqhxdSlaIUrgF3UefaB2?=
 =?us-ascii?Q?/AGee5L37lUQcTX+V45l7kBrMu/nmWR7hV4wOA+FiIiU6RQDFUV5CeG7wfFs?=
 =?us-ascii?Q?hBPidiWS5LUdkxfToQZzdQtniPObhIsXNqlWnNK3vFebt8fiiz8T20nYkS9z?=
 =?us-ascii?Q?NOYeRZ8wq8m3iZs2gKdGXJkZ69LLTLWfZgPZxpU7Xn/7ciqmZ6t3nXOoHexf?=
 =?us-ascii?Q?/Ht6x40uv/tUJ2UmQV2+Wcdb8g11UT3N27m/xrmY8duYDgiiICSDm/Hk9675?=
 =?us-ascii?Q?tTUIbRgz8G6Lwe4zeKgpLJwO5BqV9UDeG5JPKUN73ZpoPOA6wV2zzx0/K6es?=
 =?us-ascii?Q?qPNjAMuyNhxXhn07A5W2w7DGO0ZvkRo4edFjmBRaX3kWib7u6c2SP/P+JZhZ?=
 =?us-ascii?Q?iyBz/IACFngS21ILMnsmY2xYvwSkiHOZAj0gSaJgV6M94mdfhooPLmJ/+O4/?=
 =?us-ascii?Q?mWj2Va3arL9jhpxpQPQ/17v6Dlmg3vXIjtJ8MAUaC708ymxVyV7k5W7LTOT6?=
 =?us-ascii?Q?Ky+72LQvVCVXRLTf/SHG+WpZ36iO3Qeu1x22VbFaipZpiVYNF1QdPBv7p713?=
 =?us-ascii?Q?Fm5dZyaGRa8ILPf3s7wVmKB+xLySfuFW4+xsJjKiDeOWV9GBL6c+OPSK9K7y?=
 =?us-ascii?Q?X1bCBl4c40I4Sa7AkploO2AlXLOHQtth0wEhKrL/U1JGtRPJ8cR5d3Dnlf9f?=
 =?us-ascii?Q?XBZEGLhrB7J7L22oLPOr+KZBwi9PjFCxVwwQ6kIEMctzhLERVB1R0twJBcWm?=
 =?us-ascii?Q?0LIKQ+FsVL9uQz1L0vmwLMbCPfRYk/w4fPYAeEnynb2SSZI1ATx2cv6S60J5?=
 =?us-ascii?Q?n6OJRQK7XYwaD5N41CaDC6ltiUVgHVyABMI8Jp6W7Qe+//I0F/nvJ0Q93vEj?=
 =?us-ascii?Q?5ilIvq+OpZNQbn8KBlzVCcWKdDA/WIWGjAF9J6LAhXHqdLw1w9czu49LQ2OA?=
 =?us-ascii?Q?vvYSK2laroMdUds95TQYuAovMQOb8IDa8Cz3YJyJpWwB8V0V9yAnltDMX30R?=
 =?us-ascii?Q?KtibvQth2XjhyY4MLJlv1SradvpOb5PKj2UFht8yZTn8NebCCHkoHrH6O/ey?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8145b0a7-9e2c-4ebe-10ce-08db201e753e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 21:45:39.3354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 27y2PiSlvvQu054q5J6jyS9pAraFsZUZjc+SjiZwAToAlcesxYxfv0Gg5A8Vvt7ERr/YbMZ+8zxlcW/3aa+Jpp57r26l21hmla3ZZ8Rb2Ww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6133
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 01/19] drm/xe/mcr: Add L3BANK steering for DG2
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

On Tue, Mar 07, 2023 at 01:24:28AM -0800, Lucas De Marchi wrote:
> Some register ranges with replication type L3BANK were missing from the
> driver table. The following warning was triggering when adding a
> workaround touching the register 0xb188:
> 
> 	xe 0000:03:00.0: Did not find MCR register 0xb188 in any MCR steering table
> 
> Add the L3BANK ranges according to the spec.
> 
> Bspec: 66534
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 10eff02cc7db..a42061c4b9d2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -47,6 +47,12 @@ static const struct xe_mmio_range xelp_l3bank_steering_table[] = {
>  	{},
>  };
>  
> +static const struct xe_mmio_range xehp_l3bank_steering_table[] = {
> +	{ 0x008C80, 0x00BCFF },

I noted this on the other thread, but there's a typo on the upper bound
here.

Also, the logic to select a non-terminated instance needs to be added
since it's slightly different than other platforms with L3BANK ranges.


Matt

> +	{ 0x00B100, 0x00B3FF },
> +	{},
> +};
> +
>  /*
>   * Although the bspec lists more "MSLICE" ranges than shown here, some of those
>   * are of a "GAM" subclass that has special rules and doesn't need to be
> @@ -277,6 +283,7 @@ void xe_gt_mcr_init(struct xe_gt *gt)
>  		gt->steering[INSTANCE0].ranges = xehpc_instance0_steering_table;
>  		gt->steering[DSS].ranges = xehpc_dss_steering_table;
>  	} else if (xe->info.platform == XE_DG2) {
> +		gt->steering[L3BANK].ranges = xehp_l3bank_steering_table;
>  		gt->steering[MSLICE].ranges = xehp_mslice_steering_table;
>  		gt->steering[LNCF].ranges = xehp_lncf_steering_table;
>  		gt->steering[DSS].ranges = xehp_dss_steering_table;
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
