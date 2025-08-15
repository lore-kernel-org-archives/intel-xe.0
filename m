Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E19CA0EE4
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 21:34:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF86310E0A1;
	Fri, 15 Aug 2025 21:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Drn+C1DO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DC010E0A1
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 21:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755293686; x=1786829686;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Tz0t3M6sxNY+YW5AxGu0OOYt5sjaJzWXMj6934Bt1Ko=;
 b=Drn+C1DOpkln372yPxAIvP14q3DzIHtoRxZUXOX6kOMCj+sI8Ryjf1cv
 rLFFiUhXCeVGatzLMmd2pVS5RL0EWURslJjQpz73uEfWIk7ixSbCnRaNh
 kINtxFMcEctbNtG6kfy+vJk9J6ZKUJaVnj6EnQ6VTNirFTVbylGNF+oOd
 9JWn0sVeEuRh/a3h2kPMk0p5E/y5ioph9mDISyY8wUD/d9RwsPV1wxYQ7
 dePud1qngHz4eRXDH/EoUP8a+dNT4H9o4VC4L4GBZ3B3dax87WPOjL4tX
 ydbuRED5qXqJV+pQeNlnCpy17ZQDtwmD2+TbhKszxYGoucH7lhRII7ALY A==;
X-CSE-ConnectionGUID: qCl7uC18Rg2xdtqkN3ObsQ==
X-CSE-MsgGUID: gCLZ8xILRV+ZrsLkXTPXcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="75184017"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="75184017"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 14:34:45 -0700
X-CSE-ConnectionGUID: A1HnV7gKQXG8DPKNyUm2pg==
X-CSE-MsgGUID: XCMPrOAtSb6K4BhUp/8bkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="204272212"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 14:34:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 14:34:44 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 14:34:44 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.51)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 14:34:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9r4igvPbaHpICl+RTANMU63IHnronTjNzXYX/OlXXGbRl5GCq3MyiTrUY+4DKSbHFQlNYo7bU32jTYARxpUa7gGl1uCOx2d3B6RjmAM+SUin3EgFydTWYtZoUotD162B5I9cHbxLR3yZW8R1b0nK34h7IEBUIlaDlRGmBQ1N7+73UkXBLETI4+4uFBEau7iip/Dv2kkg2ZLIbti2alAVppeolMA3CYeU1s1LUoKdfNmuNDbng/gETlze8xkNCAL2OvcojsfobVF8ZTIi+LxfaLVb3pfh9DsEH/YS/Xt/02FIfcUmhj5qpxkEYp3vWPZerT42milqhyqNEm8SxjVnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+h3P0cZznJiF9NFNUpznb5V2Kvny6TF4zGwMUwl8DUI=;
 b=gp1tkYOstOsFM/xGDpt/MxLzNjk9uOiY1Y50bEfb8E6qyCFs7gowFa3ekCzQwxaY3SIQGIaXYPt/nR/tTe+KMmEzsk1RE6gca71oevIHNvRp+td5cHkj3mW8UXVX8IgDoIgua7jOstK5DB1Cq0ZIKTu43PwCw4eq1YcJwXbBL1WgZS2Rpb/cH6WsoyDDc1XwPd8FSCr29nRvMFWUPYPKI6lV3P7KoG3J+NiwZrrtfWI8XGO1GgDO/u2RSAGABRgkEpw9yrimTYRifYb+NtRJvBayCOT0NqsbRV/VyXBTYK4IHEZOJU8VvRq/iEprc/uy7w4ZSFimNVePKbDIZl0oBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6291.namprd11.prod.outlook.com (2603:10b6:208:3e5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Fri, 15 Aug
 2025 21:34:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9031.018; Fri, 15 Aug 2025
 21:34:41 +0000
Date: Fri, 15 Aug 2025 16:34:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <prashanth.kumar@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, John Harrison
 <John.C.Harrison@intel.com>
Subject: Re: [PATCH v3 01/13] drm/xe/psmi: Add GuC flag to enable PSMI
Message-ID: <byhw6a5ttwnccj7acvog2nl4v3enw4ji3d5xhabau2bmoyxcdq@hxwphlx4bb7f>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
 <20250808-psmi-v3-1-a111e9f1e4b7@intel.com>
 <1749abbd-5b10-4684-b1fb-c340fe57a215@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <1749abbd-5b10-4684-b1fb-c340fe57a215@intel.com>
X-ClientProxiedBy: SJ0PR03CA0136.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6291:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d216554-efae-4b4d-b288-08dddc438b54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?He52Pzd7AtfbsCmjK8hENV88IXfsccx8mZB2HaP3qGikXqh5DcTsupVff0SR?=
 =?us-ascii?Q?ppdUsY2M5vfktZ19a1Zf77B+lm1+Nugqh4ewfebrX48T47QEOjzib0lWF8nm?=
 =?us-ascii?Q?D1NEDQ3JbtN9lHvPRkg7Vpe6kbplzCjgunfPEynvMxGDdRKJrJSeJdjgRaei?=
 =?us-ascii?Q?Jya/lBACVy9EJtzHR56ScXiMhnUHoDM58vKoxq4NpXMuHfkIggz1nOB3gg4y?=
 =?us-ascii?Q?SOa66kJAsjXeM0IuloBpgtgxF2K11yN7R3SqNKFF4YlblM9e/UBn6wJqxivm?=
 =?us-ascii?Q?bf2Lh9ZErUJRB6wQDhKC7xQR4WgRdRfTM4EnVQWPESloP1wp+iQqh3hvL8T1?=
 =?us-ascii?Q?OGAJC90oVro1olaIz+51gasSOlDsiHzYuf4SyQYUOAw2oT3eY7U94HGh9mEN?=
 =?us-ascii?Q?uBTNq2Jtt4UBFFkfoPZO72/UrM60/8FwOcsLS16x0c2khC+k+xicYAKlLGfw?=
 =?us-ascii?Q?Zxf3wiHdK4uJ3YK+JlqinKMPKdDnvocrJIY9CSzRImiBzN3Jl7L57VmBqoYY?=
 =?us-ascii?Q?EtiX9W6T2V8/uO6/cLgKEKgFqy1wGhX5HAzlWMfZNiy5JrxSTILggsbEWynD?=
 =?us-ascii?Q?u8sU/t87zO+7Y0ED9Vm2S6pBPlpgGyf9yqLvu8jL4Av+IODFDFQatZChx7kc?=
 =?us-ascii?Q?EJ0Ae2JMV0taT1gGhvXEiz/kYxtJE6e8mbHLuj4zA0hmcbiXFNEgHUCaWQvT?=
 =?us-ascii?Q?aCTsPPwIBAzZtOsqqHSHyKnvu36344SRtIhXjvwvdLL4M5nybONvYqa7a0fx?=
 =?us-ascii?Q?6sA7VABEmymDdqm2jUPYVyNXOrRbPbFEWD0h3sKaLlIK2B2L/NAo9xigsR8x?=
 =?us-ascii?Q?HvJrcbUJ0tSwGvUGbcPWZghhubWityTtjQUhn8MNXgU+xcilw5y7PXIrQZqq?=
 =?us-ascii?Q?1V+T1jLG/anG9q7HYo1UtTtjLEa32KG2Qje6Ro2Ws0x1CuAcWotZdx2prdnc?=
 =?us-ascii?Q?vTrfK+R7SjcIBEP/hEgflJp/2+ePsmcjx8NkL92He5zRkZYmw6OdP8m7EQSJ?=
 =?us-ascii?Q?e8Xylq5wedirchcxXP1IO4UH9hYBIu0faqIHzk1ABy2OQ7yg053bvwwnx5jg?=
 =?us-ascii?Q?anO1mBTg6FJO/1n5NsMuVn8G3tkv578s+XKJwVX1RYM4eArTU00iQO+92WUR?=
 =?us-ascii?Q?6Qo9LRuWvefINNqf5wahghIc+6xdqRxmzXXbsGNx3A8/J9IQ0LJvup1FWZJM?=
 =?us-ascii?Q?kcP82F+i83bZ9r/V09Q+T8mp3ASWiqa5YbrZd/yLqOvRdrDyJndu3qCljAUj?=
 =?us-ascii?Q?CPPr2bCJg+6Pvpq/yOXGJGxKCP4H/JQqzzIoOMm1l2FayNgyOMcxyyZip6Zd?=
 =?us-ascii?Q?w8W/7O4wNn7Ev1Chyg+enK2hE2V9G5gDfB2HEK1OwyYIjdw/vxhd5gie0m6A?=
 =?us-ascii?Q?WkFyXRZapfM67NftuON3cUVv/JMPffAKCooWsMXBTRiVQ0Ejsbwi49H1bUvE?=
 =?us-ascii?Q?VWijAWwrZdw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wCYwxm34t81a8UXztxQBsrGG7Qlly5Fqe8Npur9sKtbWV6ddJqyAOfXDk5IU?=
 =?us-ascii?Q?Om6+EdmDt4Ey727DUtHLG5UnzDatRjHKLd4YbjM3O57/xHHxZ0Q0DGEZOO2j?=
 =?us-ascii?Q?qPGRxUYxgSeBMOBuTNUnUXZ4XKU+9QJEt/4yDESaaxUi1VwgG5p2jIwuPJ91?=
 =?us-ascii?Q?BRmX10ImVs9rL8WXj8urAwedcjwiHjkg/RbY/jsrMyh+ccGXRhOfcfVk+a+8?=
 =?us-ascii?Q?t9H+dvswpASkPq6Ztn90ZKQiftSvv5Ww1mM2Qh28772n9Xq9ePrB8OVm+V7L?=
 =?us-ascii?Q?DGGrJ7Yvc8fhDEIvesLQz8d4smS26o7iziRPYKdjZTOhxa9tg/j0JgzpftsA?=
 =?us-ascii?Q?MJx72bVkyZcxznuubZffDqMadcsgveAwsgDSm8e/sUF15xsYwc4yuDrqMKuB?=
 =?us-ascii?Q?Xf9yLgi8ug6Z3TPpA7YRN8jzW5+P76ITA7nBN0Weun4wezwCuv00YgGrz0Jy?=
 =?us-ascii?Q?vhn/vPGFdig9WsrJ659u9mrQ1h418Q4KUue/OA3oLqC52xh8j9IIY1rut3j5?=
 =?us-ascii?Q?azU50d7LshCyZssn+PKVIRqueWHQSqNlqJ8beBDOn803sLfKGIx46Xw0UtUj?=
 =?us-ascii?Q?5Yd5CJbyWAQOFpy2Xktf/KWjBOg6+cQemlsDLWB/dKdxNbcQPtfy/UM/cJgC?=
 =?us-ascii?Q?JYlcfJsq+6xBEvYOuayyGeTF/prIAMe2QZl8kDOoiQ/N9MvCNFZjcq9DDefm?=
 =?us-ascii?Q?uLB+DdeAcMZ2OyHHSdWIp/uqkCxnnLKZhLWbL+yZ+oGYaU2UEupPJ639qH5u?=
 =?us-ascii?Q?m2dTMl8iHCHd1CI2Oh9wK5ivF2YslRr781t0YSpxlc6ukcSMGI+ogNFomwUy?=
 =?us-ascii?Q?Zt/+U8Dq6kYcyolBzQmHIJ38703rENlsHAQ9PvITm6EXy2a7ybWbDI8VQFNV?=
 =?us-ascii?Q?o0+WAZT2dZCrFcFD+/HV/tK0Rjki0jTYmeWGpcscL5PHpqix9/7Q7OlhLHnO?=
 =?us-ascii?Q?sMnLtOcvgR39J53FJLbaX9qSgRcNfH2tqZI4cChbdVuwOz5609KxztiJ7e27?=
 =?us-ascii?Q?GBNu45XlZcwzo8iDP2ery26Dh6TrKLFJsqtZ4Av0EVbPIDuJ81KTIQxXqT07?=
 =?us-ascii?Q?mvV7hdMQZIPHhxyZU56Hfjaxm7yoBWkOxATXKUTl1DppKWZMH4CUiDYZGNHj?=
 =?us-ascii?Q?i28zQcN6HVsAR/1Ioyh4V4VsAO9wjCPJKC1j+lTz5CiAwhHLWyqiiQUNvMFp?=
 =?us-ascii?Q?jJPqOq4MXyG8dyGQqBstjm8XZ82gYdUtnDHroZrWoPSyLG+Pdc/Eq6C0QUg9?=
 =?us-ascii?Q?xfXbtkzeAIpELyUcorQBBzd9z4dyVgZywXFWqQwWCVIHPoHq3UzATV8/LDvK?=
 =?us-ascii?Q?nq4mRJvtCR/5dchcyVw9x5/Ztfs/cpWZKbx2AEdF2pabqILDftKzBCpei5nC?=
 =?us-ascii?Q?7XWT/B3WRSvKwYAKYdCLEn/mUesWp5tyN1FN5tb/FTVLKVh6fOPfsk4ka+9Q?=
 =?us-ascii?Q?BMyvW7H3OR9OKeeBWP6KJJczMiqY3Z6MgNA6R44fL6Vvvcn0m/MyOj3UMKS6?=
 =?us-ascii?Q?kvXFcKmLDt+JYPU3hjyM4ZrcnBd9p3O+d4X24nVbpCciJmi8OgSN3J0RV/Hf?=
 =?us-ascii?Q?rc8DFwK9loNUfMlc5MOSgr+P1sjvVCYltM7H2VUJpk3G4G0pnkC2juhUKhys?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d216554-efae-4b4d-b288-08dddc438b54
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 21:34:41.7588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZGifn6zBksK9hqFhvr9SlNqnma06++VCJ3TQjYlyzVdIrqdnk9AQaP8VVQQGp+UQMRoJN/lypuZFif0Mfm0ZuBN9JVI89WMxfHj/mawLdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6291
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

On Tue, Aug 12, 2025 at 05:38:14PM -0700, Belgaumkar, Vinay wrote:
>
>On 8/8/2025 10:29 AM, Lucas De Marchi wrote:
>>PSMI allows to capture data from the GPU useful for early
>>validation. From the kernel side there isn't much to be done, just a few
>>things:
>>
>>	1) Toggle the feature support in GuC
>>	2) Enable some additional WAs
>>	3) Allocate buffers
>>
>>Here is the first step, with the next ones to follow. For now everything
>>is disabled through a check in configfs that is currently hardcoded to
>>disabled.
>>
>>Cc: Matt Roper <matthew.d.roper@intel.com>
>>Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>Cc: John Harrison <John.C.Harrison@Intel.com>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_configfs.h | 2 ++
>>  drivers/gpu/drm/xe/xe_guc.c      | 7 ++++++-
>>  drivers/gpu/drm/xe/xe_guc_fwif.h | 1 +
>>  3 files changed, 9 insertions(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>>index fb87640080896..c14588b86e833 100644
>>--- a/drivers/gpu/drm/xe/xe_configfs.h
>>+++ b/drivers/gpu/drm/xe/xe_configfs.h
>>@@ -16,12 +16,14 @@ void xe_configfs_exit(void);
>>  bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>>  void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
>>  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>>+static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
>>  #else
>>  static inline int xe_configfs_init(void) { return 0; }
>>  static inline void xe_configfs_exit(void) { }
>>  static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
>>  static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) { }
>>  static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
>>+static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
>>  #endif
>>  #endif
>>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>index 9e34401e4489f..cb757a53de856 100644
>>--- a/drivers/gpu/drm/xe/xe_guc.c
>>+++ b/drivers/gpu/drm/xe/xe_guc.c
>>@@ -16,6 +16,7 @@
>>  #include "regs/xe_guc_regs.h"
>>  #include "regs/xe_irq_regs.h"
>>  #include "xe_bo.h"
>>+#include "xe_configfs.h"
>>  #include "xe_device.h"
>>  #include "xe_force_wake.h"
>>  #include "xe_gt.h"
>>@@ -81,11 +82,15 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>>  static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>>  {
>>+	struct xe_device *xe = guc_to_xe(guc);
>>  	u32 flags = GUC_CTL_ENABLE_LITE_RESTORE;
>>-	if (!guc_to_xe(guc)->info.skip_guc_pc)
>>+	if (!xe->info.skip_guc_pc)
>>  		flags |= GUC_CTL_ENABLE_SLPC;
>>+	if (xe_configfs_get_psmi_enabled(to_pci_dev(xe->drm.dev)))
>>+		flags |= GUC_CTL_ENABLE_PSMI;
>>+
>>  	return flags;
>>  }
>>diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>index ca9f999d38d1e..4dc000c977faf 100644
>>--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>>+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>@@ -112,6 +112,7 @@ struct guc_update_exec_queue_policy {
>>  #define GUC_CTL_FEATURE			2
>>  #define   GUC_CTL_ENABLE_SLPC		BIT(2)
>>  #define   GUC_CTL_ENABLE_LITE_RESTORE	BIT(4)
>>+#define   GUC_CTL_ENABLE_PSMI		BIT(7)
>
>Should we have this as GUC_CTL_ENABLE_PSMI_LOGGING to match the GuC 
>nomenclature?

done, thanks.

Lucas De Marchi

>
>Thanks,
>
>Vinay.
>
>>  #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
>>  #define GUC_CTL_DEBUG			3
>>
