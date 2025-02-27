Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50785C197BF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 23:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6EE10EBB0;
	Thu, 27 Feb 2025 23:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AHXWMCDX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45EC010EBB0
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 23:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740698714; x=1772234714;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9+5p7SyMYRmTg6BTxUj2VDz8kPQTjDSwsmS+Lb2Ed6s=;
 b=AHXWMCDXdXXe1lro5sTXIA2ziUbXdGTC6Ew723CFOi2wHfJzO7ieNKDv
 5CRywI4iGXlFGzGhCHtkWMaIX1So4Orj81SxFA0eYjwUmbxcAHN2AkCL4
 qC5+DBKnHPbnvjjxIMEzN74K2f+xp2jimlwZyTIqFhmdhzU61Ux0SC5QF
 pkC2Tu3o5xWDMM6vJ+HYWPMtx7pS5/GuL44zycF3GoPk8mCFfWXHTXyne
 mhad6pZfAyjN5Q2FFvmHyfc7pFFEOa6Jxdv+NQCU32i2c3/89buxwRC7i
 HJh6ChzINfXhDNHWUGCETJ74Ve3kNhI6XltKDqf93bPybYQ8+e6SFx5hX Q==;
X-CSE-ConnectionGUID: AxMe2/cMSES3+WPvgPEOKg==
X-CSE-MsgGUID: 2b+lVxQnSYytrNBHqk6EDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41316838"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="41316838"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 15:25:11 -0800
X-CSE-ConnectionGUID: vtzjycFBQbeRHsA/NU6A5w==
X-CSE-MsgGUID: zPdbwwDPTfKxqVE/JQ2/eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="117352602"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 15:25:05 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 27 Feb 2025 15:25:04 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 27 Feb 2025 15:25:04 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 15:25:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fehx/3+ScXIcXs12rBjPoPQFbtoZY6Urq1PFcLdGwQ377JZd5juK+3chmUnHMLoOkUpXifnplBhXqCQTICWQ+kjhTubDtt4LiFDqDj465SlAjbhLCCuthEDYhgsm4s4c+zeP6O4wPn0ctfIrsW4te3SYhKIzXAbqBsuP7MQGTi+8RQO6ScWEkDC20L0zuYgV1pANcGvgIIZuWFrfWlBr28hjWMmXm4P5Sami0aPW6K9OtpYdJdfksll4t6Hn+qTsQDx1Krzm+97W2rbYa3lVNRdpqKMCTrYmfeDzhwgYCmQFmgtf1Qwd83R9Nhee0R1mzBC61pCqEOFCYUJ+PDGyBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDnW4Vs1VtKO7ttV+4GP7fQ+2WO69tayJ3sTj4CnryM=;
 b=XbfG4Vwu2Ml6ICRlMabit3hibAas9kJCmhn3UXgry/rIxl6jGvt/sneXf7c0NKOcz/ZykqhGIZLUboAZb4ssJ28oHMylsrnFIEixEMND0GImRSghXaKB5X0ja6jI3U9bgcD/uPmivQ5NWLmLF7RA3l1yBfKDBqGctJ8HuCVHdytQ8LLafX3l/lPLPT4p4gOozGJnNATaVE7WOFgM5xikh+gEmUvU5P7vIgHSxdjrTKB7xLtY0njukDLX3iFBKBYNUoOQh4rNse2fKZcATjcMa9VcGJHwRBksI5Ybzipy0E7+mRsJuVR85bdYpXYwQyTJZhpKghcnBgSVdKTtxMdEYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7409.namprd11.prod.outlook.com (2603:10b6:8:153::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 23:24:57 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 23:24:57 +0000
Date: Thu, 27 Feb 2025 15:24:54 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH 01/12] drm/xe: Fix MOCS debugfs LNCF readout
Message-ID: <20250227232454.GK5109@mdroper-desk1.amr.corp.intel.com>
References: <20250221101736.78986-1-tvrtko.ursulin@igalia.com>
 <20250221101736.78986-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250221101736.78986-2-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: BYAPR02CA0003.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::16) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7409:EE_
X-MS-Office365-Filtering-Correlation-Id: efdccc9f-3953-4ec0-9fcf-08dd5785f285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O//hfk/dDXR4dBOgEzR5bhWpYui0OTqx5563MM9pV6iZDGRPKnh7pmFlM6o5?=
 =?us-ascii?Q?Kx7aBMXoJzUQYwWagqlfxB5dbfwT3VTX+GiJDC+EaMEc9hfi3iIAnb/Zjfg7?=
 =?us-ascii?Q?4lJkWBOaqaD9M1IZzgLS5AbQUK1n+jkFUEz22k+kaKkOAQPb0sZdyWHG6S6x?=
 =?us-ascii?Q?0srEjGkfEExc8sUUcCBAj5lKMq+BCu/JeFtWfwviBztDBlLc+xp/N9X9/Q9p?=
 =?us-ascii?Q?OJqtIHTEx+4bQG+z8AEdNr9mH9ScP7JBwMrBIEM3l36ozzGlai4tSe43SiR4?=
 =?us-ascii?Q?cUuVcpKiS5VTdTDWMc48MkT2dlUxMPureoMKPWgN1xYZ7UghLx8ZJ8pwfpi3?=
 =?us-ascii?Q?Ol4FSAsL1WJSfRv7bDk+j5ZBfKurRxCu5u0/7BydeDkVZ0M4WPizQeUazGxo?=
 =?us-ascii?Q?w6W2Kf4D/acxQaB7nvo2UMeNIGYsTocn8e/YozCpQ4jr8s2Xv3bAORKwXjQw?=
 =?us-ascii?Q?CHD7T7h5xoNXAOhQylfR33mLTugIguZ/dZlLA4MTWqJJAJSvAZsz4quLV4uI?=
 =?us-ascii?Q?14EE2YqisOnbEOxSgDMLDHEjXbKXLlDSRZXupmoQPW1YNeyoCbsr7tD2gyow?=
 =?us-ascii?Q?Lb2Svn4zDyGqcnx8M5Sl+3aKdqYbo6RZ/vWmf4eMxb/Y5wWBjS68zeFZssUv?=
 =?us-ascii?Q?Bhvg0Lr9KM1q0BDJbmhXvsWUq8rqodAwe/hdod5teFSJOMsw1HfJDEKG7C6P?=
 =?us-ascii?Q?PSVKD0Ph1XCZdUAspaEr0VD3nVQSkXHCL2YX5M1rwFzb69KHeE4/kfkZ+wxP?=
 =?us-ascii?Q?C2iKq0sHQTC+O+VyQRSmHuokbokwDW7AN5xbe/4xCRWI7eeOkuP9lrqVfkOg?=
 =?us-ascii?Q?UXIaelp4UH8jYBOLltp4Q6LWHdLpFBZJTXsZ7j849VMMu7fqF55v6QTk9PN2?=
 =?us-ascii?Q?jkTMK62djgaiRlI29Ny++vZXCyl1yRefa20zhqeyuaYXU+MNrIoXymTpnutI?=
 =?us-ascii?Q?t7esbiLEqzismeNA6io3ueHbvh5LASdFggVCqjGvWPM9Q8w++xMODAp3ps7k?=
 =?us-ascii?Q?W2LeqmWaUVDLPkY6JzolrPmfZNpb58zVLXJ1vTOsH7drc9RT1MPulFUbznFr?=
 =?us-ascii?Q?airdyzBuT3L99Vt4WptqH8/fxOwY/xR/2M3raTnHyfdUASVPljE5CvCUxtqS?=
 =?us-ascii?Q?FqHGPcQ/LsZqMrlKZwcYi7jCpSLlK9VMO3SL/No0tZ+9G0GEmsCwitjxCpgG?=
 =?us-ascii?Q?ZFKOn4nWAF3dISstwxxHHEMzOGjso7b2ioL5WwvzOc7kj7g92QR0gNpyOjox?=
 =?us-ascii?Q?eeCqgg8D3I2zt1nh67RqmUIWq1IoaDTApyJZoIasCd0Oo8UO/TSulYD28QAg?=
 =?us-ascii?Q?ysWp+AzbQj2+cL8n/LGjdBn2vIHGmAK8X9XKHBoMEuc4THV/ac4RH3OeIGuc?=
 =?us-ascii?Q?kRYyN6h89HGgV//OiYQ08NR3hEyp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jwxZR1qjAjmsBgC/CQnG78+f56utZDJS2NXW414cxJwACZBNvx9EkvAscrcL?=
 =?us-ascii?Q?Dxg7+sIBvp4bXs45IwBkH/jnZd671Fgadkt0QEL7x1yGSQMuNbJ+boGmdfmX?=
 =?us-ascii?Q?x7DwPEbrD6BsLFItaEuW+TYuon08WqyCG6zifBO3tLTNXSVCLWhaZSPbD3b/?=
 =?us-ascii?Q?uzj+97yAkMn7wJO8E9wDvcbzLZW/E7JcHjbYYBANSR1Sy8Sy9MTZwKB/dcb6?=
 =?us-ascii?Q?5Y2dyuDh+iARcMqM2LDSVOGh6W7Wzs4t41jmXImqYqCf+HgBaL2MlZFp2XC4?=
 =?us-ascii?Q?Em88LrVNLch8ZEBliZ1WR94nxzvjj20+vOUs4IzFwLpM8Vs9I7IynYRvgA2o?=
 =?us-ascii?Q?bFV/ZN3n6uEzwwhxcP8n4Gi4vW+8DXAYEImQbIeZhgoPbcJYK6Mv5Vo7NHNM?=
 =?us-ascii?Q?N3gQvBmPB8hUoj59SyoiD6VYf7W1Ob+2Sq8FviftpDjp0IZRZd1fAEY/iIdG?=
 =?us-ascii?Q?ie3UCxClXgieXgT1h93eflgRSRJC0aKqb5tFXK6fJaVLMzgBGlBpyWNGlkeE?=
 =?us-ascii?Q?cJBZ+tb6URrI23tNp6PvCXYfUBz3iKWaawKvZORsYbAUeuGb/WiyA8zt/rhb?=
 =?us-ascii?Q?29nU2HrRL8ol5mycNaSgdFWC4dSH7uDyfxTSN6SOKyqQ2Y9jsvJg3Ftqfhry?=
 =?us-ascii?Q?C4OvuppmxCUevVrEOHKOyxDnH48uZLz3uV9GCCqE3BMm3p9oc8wNx7GfxIaJ?=
 =?us-ascii?Q?Uc7voGMt9YnMGe1zsxiopL2dHfmXEQOxIP9XP+TivA7QY6zc5n08DLY1KxeC?=
 =?us-ascii?Q?BpK3v3y6K7yQiOz5F2l3gkTUEgBBmg8RPpE+O9q/B2Jj6vtHaeRQJEUGbHzY?=
 =?us-ascii?Q?fobRt9h9SY9CnOuqVT4yoL8gWWHrWBuzU/3LNFe/+qFO3qBGUIv5u12cSDUW?=
 =?us-ascii?Q?QQDCtfYl4W2p7wGWBW1vwhcgT4357aAYlYUPuVpJBaVupntKL9yCAL3UUCvf?=
 =?us-ascii?Q?bDMlUVcMXLnkb/QFCZgsy7RAo7sxpb+51cB2lNqSNffc3TU0NwFZFFSdlwcB?=
 =?us-ascii?Q?U7coPFqIW0vigJvIBj1pWcRnyivRrwn4c+PZQs1c3ZCu8mHqjEYBt+zgIHNx?=
 =?us-ascii?Q?2oaXkInDrM1+kssCt01VXIORoQSKC9TojAUeA1Q/nHW+2tvN7olXdjEIk+B3?=
 =?us-ascii?Q?kickCOB3k8JvBNjglPctlEtXGSDKwYYxaHtD6dfp8kiX4AyX2bOUUmCTeYWY?=
 =?us-ascii?Q?ghZQ3ag1erYrPuTtAwgVpHsHhWAuqaBcnuGJU+OjOrRjDdW5sXIRiPB2suEj?=
 =?us-ascii?Q?18V09D11cCsZms0eNBBuucO3qir36h2g8e24qaZjtiNAR2Zm08+b69SZQT22?=
 =?us-ascii?Q?impiB+yEHkycoavUHk+cvRoD8KkhIHqUh3zDN+tovcqvzuFx0LYSoYFx7J/x?=
 =?us-ascii?Q?xEPG7G1dQRqsKkHc1iVtYq0HjePWCfOMFv2iwvcl0VxHH1K5ARJu8czKq47v?=
 =?us-ascii?Q?hMEiezLEz0WSwe3A/nmBrNR4EO2ghfpMAny/j3ZbVja8fhOoWMVJ8bdfLR08?=
 =?us-ascii?Q?AJD7EoF3d3l8dhsWLJqCvTlOURO2cjUyJgaTGF/1unvSUBujEeYdJeRPiZwU?=
 =?us-ascii?Q?adnSKAeP6IdF+vEOl8ACZqm4INibYv0N51FUjQdyPdF6PBTsciRxQvqcgzYx?=
 =?us-ascii?Q?Gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efdccc9f-3953-4ec0-9fcf-08dd5785f285
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 23:24:56.9156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/WUjoQpMYMmX7L205EeuNW031MAM04Iz+9ES+YM1gPYd9j8sx8Mv4PcWNX219TaBBoIHCzpQAkvBHNzI6tE0t4RYSBQ93SN4UdZwhf4fRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7409
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

On Fri, Feb 21, 2025 at 10:17:20AM +0000, Tvrtko Ursulin wrote:
> With only XE_FW_GT taken LNCF registers read back as all zeroes, leading
> to a wild goose chase trying to figure out why is register programming
> incorrect.
> 
> Fix it by grabbing XE_FORCEWAKE_ALL for affected platforms.

LNCF MOCS registers were only in the render power domain on the old
Xe_LP platforms.  From Xe_HP onward they moved into the GT power domain
(and then in Xe2 they were removed completely).


Matt

> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  drivers/gpu/drm/xe/xe_mocs.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 54d199b5cfb2..31dade91a089 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -781,7 +781,9 @@ void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
>  	flags = get_mocs_settings(xe, &table);
>  
>  	xe_pm_runtime_get_noresume(xe);
> -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt),
> +				   flags & HAS_LNCF_MOCS ?
> +				   XE_FORCEWAKE_ALL : XE_FW_GT);
>  	if (!fw_ref)
>  		goto err_fw;
>  
> -- 
> 2.48.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
