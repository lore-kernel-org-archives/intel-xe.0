Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73561C282EC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 19:07:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCD610E1D5;
	Tue, 11 Mar 2025 19:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ephbGcI9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2987E10E1D5
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 19:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741720032; x=1773256032;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Qfm5Kl/55qXOWQ1nzFeZgOsnBCHyZZaghjUsQE95Pes=;
 b=ephbGcI9Jhd3Oi4+IwSBw/Vmx8Pu5jYjyOyrWVMuYyyKxR3dYrMWwsRT
 U/b8hFw3Tpwteq2T6jA+pQ/E8w7KQbuVUK2zxJH95CF6SSAlh2NYQrM25
 WeiJzMtvxcyc3bWPIsk7i6Qhvi3QLxE1H2w2Uc0JAA5SBdbMbHjvNorw0
 v6JL7AnHI6oRRilUWmT2tFehJ7dd7XF8MIYPPgz3AUcmpCIAvP+MJ1rlk
 WeUlCMsN3/ZN60qQ68ldN2krsw91WxvJFaqwKWWAhdWytXmxAqDjJz4fk
 sJ5qqLSpGtzrJ/Xxs2QCRZFn+RrdtWERmcjF5hgmBY54DVA67t8MHQdYY Q==;
X-CSE-ConnectionGUID: ZuBihsUqRWeWqYooNnsGJA==
X-CSE-MsgGUID: 5rn/o+4jTbm02S5129SmWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="46688278"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="46688278"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 12:07:11 -0700
X-CSE-ConnectionGUID: IZgPjijKQ6iAtISNQ0jmJw==
X-CSE-MsgGUID: RIb7Jr2sT7aSJR/gMBUQOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="143604021"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2025 12:07:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Mar 2025 12:07:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 12:07:11 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 12:07:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vc0f1NcBtDWNw6uXBd8AC8BvhQUszAyBtB7455pRHklNzoqiRjqQuqvV9heCfA82SEndKR0XM7gDIK2/meULpVmW+fZDiBG8O8EJ6SvlKrc7+qXrQHU26OCuHxvVZYIuM95F/I+GEiBAxaI4qC8WZ9mblSjWL/66oe2B+ZhD5TJ8/dJUbmjWYcq41Rj481e2qC2kUxXlV9Q/N2f8NON+jtePvCV9iGah1iYt4/uvdLOEEIU8ZuWRXZEJ+lJrLZiXGshn2Ld97lCDicFxDkErWzDf+OeLcnfqVl7jr8B+XoXYqE0lUoMpOgAjIEtYx0ZWm2AfS24yECGyytE7agMJow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRAz1dS3ELgeaUDA5qtOMNb6tvRHqeNFYU83+ONDsbE=;
 b=oZl6C4wShAhhzOyPWGG9ACyzHmCN2yXQiBZPJJ6/rIfexvvSHY61WpQDxHpkrpQukxsC7M4x3Pp3JpiJzdJlOCikvlE2UKHlKVFDV9ZNftWsjrE0MAwWt90iUP0EyZp9gLxVT0mUT8r9N7KzKl1f2sMZy2SmyhQQN/d3sVFOQ0Utd5Hu9UcVNeDVCpN/EK99j4fyMIPwU7HM/3luNkm8K5dWMW0/r10FHFEE/UwD8VdkQEv/9Uyy/YtuL/SRUBw91duh0E2k9hWw+F1fpr/BtEwvZgdtLNZqeus7fCpPTFyq320xqp6putNatCgQ6t4UH1pDHJP7x2dW3Oal/viYzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB8245.namprd11.prod.outlook.com (2603:10b6:208:448::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 19:06:27 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 19:06:26 +0000
Date: Tue, 11 Mar 2025 12:06:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/vf: Don't check CTC_MODE[0] if VF
Message-ID: <20250311190624.GF3701377@mdroper-desk1.amr.corp.intel.com>
References: <20250311114042.1954-1-michal.wajdeczko@intel.com>
 <20250311114042.1954-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250311114042.1954-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0291.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB8245:EE_
X-MS-Office365-Filtering-Correlation-Id: 3234b161-371d-4262-4b69-08dd60cfd2ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ocI8YkCjD4f/+UWz6SYjEE9cVFYcGGKmlmPInYeVMYpdZsKgUXG5qgBDqBm4?=
 =?us-ascii?Q?uwJB1INQHIRxLrNBa5LAFIFiGDibMVEbXJWlvsl9q44tQCxWzQEYi6bqXk1e?=
 =?us-ascii?Q?v99Nkldwff/dEJGIBKXnXzACNo99g6zygWnNqMJQQFdBKmnAFqNf4VBaVeiu?=
 =?us-ascii?Q?0nJyl6W3uz8xEYnvAPkXLsaRheFAkvTJhA9780ZPbCmbl6L9E+ymnq0co2bG?=
 =?us-ascii?Q?nSL6GAxgPqP8AC9e47uXKfv8dhWwHkWnKB7tRrkHV7ymqrpljJ/kSES08bWK?=
 =?us-ascii?Q?66d633Q9vrX+ifmP5GnzCgjGjx6qhO2KSJlkhygxcI7cv3zIpSvYDYVMFCXs?=
 =?us-ascii?Q?ji1r3Z/JFGStarzXhoofIxycBsfxz5nqN97Dpk4zDiIcjPKngCfWDx1dc4wc?=
 =?us-ascii?Q?cw1kdD+YKbxiLNVbSdfkhTnfz6F5QwzKPPk1M6d2qGviwqsSsgJgzTva5ewx?=
 =?us-ascii?Q?n7hVdv0fXuWV7brlIZ8Gng/40teqPszRqrHcVjGEHOPL4cBYAcFcz/wfSYIS?=
 =?us-ascii?Q?WE+quYLZ2aDUD0wTMPiIMZe0eQrKijqwznmvq8bQK8lgOQR0fgyy/IR1lXkM?=
 =?us-ascii?Q?+rhCsPNOfQK+YhM9SQUtEhZSkvY04b+ae2ecGGGqvtCQxAEd5feO3WFozA5n?=
 =?us-ascii?Q?pQvaezIXq/df3n7c2deu7K4o+O5tv6tJsX4P4wP8iPIU28/G/rVHNPUhRQES?=
 =?us-ascii?Q?vwXvnyZ0qI/o59Iag0SD8Ni7woEF5usbVeG8SaKcvFkLWgjw8rKCCt7dtwRN?=
 =?us-ascii?Q?2lA7G6Re5W3jQH65pBtmpv0j2pJs1TiHXsDl9W+Z/YQXJmi/eTAosQy5zYni?=
 =?us-ascii?Q?YLnQEkVt35BMSJrIBAXoXNrl1FKHiIxuZk74YvevjFCw502EJlv5QKFbjny8?=
 =?us-ascii?Q?D4RkCXMYG5rMnFTk6ZU7BZJtKdXvOVi9IDgs56eHbQPm2/S1qe+9+MPZUYtF?=
 =?us-ascii?Q?s3nRTxGfS4M/ElzrymXM0gmGFAyP0GOa2AhqWc35Jsk+8XXbnGlnbzxNlAN0?=
 =?us-ascii?Q?kq8zVCBEG0pvEEj/z7tF6Gg1NtZQ0Pg8JPG3HI0pj/cuYvZurx7THDxZzXo0?=
 =?us-ascii?Q?kMoNpGNafFB5lixCIqW7TjZnsUSY0nIBTfLubMkskzr3HyktEAYGtondADVs?=
 =?us-ascii?Q?fOAaF9QdDr1vL722isofStC6zta76cW5rSX/gaUpA2ECrRiiD83QT2tc+4o3?=
 =?us-ascii?Q?1IxaHExXc12k8sZ+SFC7rKxDHYam4LfIt5AjjvW4o6MnJIQCT/SPdLeU4wl1?=
 =?us-ascii?Q?+u0ZoI8i+euPVpeRqaVPgsE4L2LE3pjejkX0wsnVirH6QUNMnoH8TdQK1Ft4?=
 =?us-ascii?Q?qgD4fVU5Q5UVLFV2f4SET1ZZwaAdozu31SBk+KGL1RjxxwHlQ+btORGg3iUZ?=
 =?us-ascii?Q?AVLTORZpkBxr2JpwxV4KNWzrFrtm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0FkAMjMQ1QajYQc6VBX1q03K8XBTLXGQnoLyX4c43u0l2hpBC0Aq5+RF/D6I?=
 =?us-ascii?Q?k1c88fW6qBiN0IBEVJpLo6a+8xj5dCrP3l2LXDJYRnd4e4zWjTUqYDBqbHQR?=
 =?us-ascii?Q?KGpCqrGGEBPdfSXSQDDDlacNv16tFHtSjMf+LIpNzqqLzkn65XUtoJOnRbhH?=
 =?us-ascii?Q?rl5v2je0Vvx/g8XTI99clNWgdskQ1kwFdshNB4746BJVgiHrQzunLCjQaTLg?=
 =?us-ascii?Q?HAOrrW6IQ6bufCrcgiBBknuT+Ef+jRFV7UcYwcrWDx6sS97tzVK+uFCceJZE?=
 =?us-ascii?Q?+4ROH28lTghUy+WplHp6ORNLWkxsioMcxr6D07OH6oc8BB8+HDZ1RToMUrGx?=
 =?us-ascii?Q?w81M0PbtkYHu3rd1kLi2PpROzdTyadB7to0iZnCnyZDAwcF4D18Rn62xhzKo?=
 =?us-ascii?Q?ni9a15S4Hi/kTu3aZGsa9IHw962XMBJRpbA/dY+VXvDSbC/hdVvdT5Uzl1BP?=
 =?us-ascii?Q?UqeT9YNP9Tx5pb4cyIcho8DjkpRja9qM9ST6D4AKh5Gv+s8GxGE7QnLNdw8m?=
 =?us-ascii?Q?liDWQ0E07zwS02SHd//ucn5gbvGoHtF2rvChuBPMO6EPU5Q+Ey9mA+tH2cIs?=
 =?us-ascii?Q?s+38iZ3syXqQQSFVgND5JBL9hzB/poDy8x/b/ahVgzChwD5rKHsygK94UH6p?=
 =?us-ascii?Q?n46MVsscUoW3dvjbVTtUxzhVtpATKzOL5jozUJ8V53Ev91RZ3KZ8iEIxQHKz?=
 =?us-ascii?Q?/XFnV170CNMVkyrQX3DBxJJIKSi9v/qmiUCqmOs4TjbmPMSnQR9VNo7+ycyX?=
 =?us-ascii?Q?U9VAu6u7x8qZzMmveap4aHQt9gdbaiEoNjo727poSb5GlTCE9z2nXhu0sPw9?=
 =?us-ascii?Q?t1nDY7M6ifNHcvCg0roQyJ4vfzmk6BFnLgSQse4LErtEJ3rYpWnX2yKsaFy1?=
 =?us-ascii?Q?+csyI4NTkIe6dI6SBYaCSJRS8dPU7JzpvILXDyc67raW19JyKPGwO0N6doj6?=
 =?us-ascii?Q?xrbuYkj/8CpY1WTjhjqdIE24dQQqcEGvJeKy4ope3T7G+GNucL8fGqkkHXF1?=
 =?us-ascii?Q?6To07xYyJgrGhqd31sEq7E2PPzPXS+EYtQput/45p+vZ0rCRqfKdYjpkKzcI?=
 =?us-ascii?Q?F8IUcc92Q1F+6GcemH4abaP5nRzRErNV436bYDoV7BO1ARGI2fhSC15g6Zbv?=
 =?us-ascii?Q?zEGnprcV5M6lOBP2wYKIaUJXtejxpUrbSLNQVuKK9BdfH1ThQZ2lAJ1XmsbO?=
 =?us-ascii?Q?cl087LmJRL+okhdtQfuJ8/QeVwKDisguPy0fEK5hoft7BiBfvKtFK6wkNNjb?=
 =?us-ascii?Q?y1MEx1ifZvh+ZsKBK0ypFvo+hOTEEOSK3n0zyTzB74ivpnmI+Dy3xUhrq2JL?=
 =?us-ascii?Q?bvZIVEcgHftDRECvAlCCVZmXnk141xAW4YGSj5Ma/s+SDZWA0QsIG+jRgRyR?=
 =?us-ascii?Q?gxprLw3sgYlV5fWFlJLCuqAL8zq+FU3e0PbK6TX/MoTqsYpH8ijK70tVIpDx?=
 =?us-ascii?Q?/15wuTCa0WaTtZKGGsI5c+7MogT+Wctv6cnp/QaJGfFKpMvbDsf9CB+vjapJ?=
 =?us-ascii?Q?1fr4Cv3P1ldQStJ/4KN8ng/LIDhRVKBi1HLR/6UBI4j0xyAIvHMpWxKe02ku?=
 =?us-ascii?Q?b3ywnIa04NrIZZ2Cxi5Ob46XpuyNnzJJA9/ySRZRLzAW1J5UT2KJ0E90giY9?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3234b161-371d-4262-4b69-08dd60cfd2ad
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 19:06:26.6673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I5IpgwWdZmIBh3vEdUi5MqyzkjHs3oR9KlD99BXrZ07P21uVRhFyyew2I/Cg4C+2T3FY6d84Pjom6gLiit1quJGdhjkarkFQ4Wd+W9CLVOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8245
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

On Tue, Mar 11, 2025 at 12:40:41PM +0100, Michal Wajdeczko wrote:
> Starting from commit 18778b5fdd01 ("drm/xe: Eliminate usage of
> TIMESTAMP_OVERRIDE") we access the CTC_MODE register only to warn
> if it has undocumented value.  There is no point in doing that on
> the VF driver.  While here, move this check to a helper function.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_clock.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> index 2a958c92d8ea..fca38738e610 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> @@ -40,11 +40,8 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
>  	}
>  }
>  
> -int xe_gt_clock_init(struct xe_gt *gt)
> +static void check_ctc_mode(struct xe_gt *gt)
>  {
> -	u32 c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
> -	u32 freq = 0;
> -
>  	/*
>  	 * CTC_MODE[0] = 1 is definitely not supported for Xe2 and later
>  	 * platforms.  In theory it could be a valid setting for pre-Xe2
> @@ -57,7 +54,17 @@ int xe_gt_clock_init(struct xe_gt *gt)
>  	 */
>  	if (xe_mmio_read32(&gt->mmio, CTC_MODE) & CTC_SOURCE_DIVIDE_LOGIC)
>  		xe_gt_warn(gt, "CTC_MODE[0] is set; this is unexpected and undocumented\n");
> +}
>  
> +int xe_gt_clock_init(struct xe_gt *gt)
> +{
> +	u32 freq;
> +	u32 c0;
> +
> +	if (!IS_SRIOV_VF(gt_to_xe(gt)))
> +		check_ctc_mode(gt);
> +
> +	c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>  	freq = get_crystal_clock_freq(c0);
>  
>  	/*
> -- 
> 2.47.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
