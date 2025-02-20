Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDC9C021B2
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 21:11:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4027510E9E6;
	Thu, 20 Feb 2025 21:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ahrMydBN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CBE10E9E2
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 21:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740085870; x=1771621870;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7zNC4I7DPQmvoQqhsvSvnd/FLelUJrz1jJUjxZcbqd0=;
 b=ahrMydBNVtpGYNsLqewCwDBXg6QxQuMvnaThl3o1YFMkPQdpNGsJrwDA
 JaTRD1BN2AGLyOAbiyvSkm90BADWv4TDXANKrZ6Z6qoS/fAG5e+7QaD84
 8B34epsxKRCgrX2iJOnhAj01ekISJsI5KMvVy/EK10nyNIM0DZ8hx5zHW
 6r4IN3FbUNcQQ/h7p0+0fQbCTmH78JwdiIwxkTeqgFi9d3EfQRItI00Qt
 tip8aT09zuyGOT9JLMz6Z8S9qztq9vgiMNXChMMnpKStYHsWCcV/oMvCH
 ChZUAzz5bLmcQyg/FrDjmFgrXGaWLJw2WT/8OFSH3Tj47R8pu/JBlyW1f g==;
X-CSE-ConnectionGUID: oytYBpjcRiqSX6GVRNcDDg==
X-CSE-MsgGUID: qsK3IWJ/SkarQiJ/HEhYOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44805552"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="44805552"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 13:11:10 -0800
X-CSE-ConnectionGUID: c+CEnp+OR1qekVMoDUUKWg==
X-CSE-MsgGUID: SNY8iEWpTXSYefjrc+EnSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119275827"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2025 13:11:10 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Feb 2025 13:11:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 13:11:09 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 13:11:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kcfr5Oy5Lo+1IXH1FVIwhjkeDnuwIBA9dkgACK7TB9VVK0w27lOoR7+47vBg7JyyS+fOzeoQCOLumdgEiRsPTKUjAhbYiu/MqvCYU1nVTFtDV0xQ9x+UxRVdLNDFEvzQ/s5PZQI/7bju9PYuB+xj/hCNga+H3Sq2sXZo7cncR/227vV/VPn73e7Ktki5lfdWVHAedwE8aM+JaxrHe16qVNE6M2q7Q060ceD0lTtAt5ZpeeL7VJv0v21OwimvI6h+IOPpimXhokTw9QETUVZohSP4kqzgWcvi3cMUrtb9Ohkoy6MjX0Lt5EzaTOIcKES4fx96Mglm+kuAMH7fzXBFnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYOht3UmwoChsv/14eMopMpS1dOQCfOECNlWRoufZng=;
 b=YO+0QW+4UanRovtE6J5rU+O95kqtQ8rVY7ivzCx3fdBayEXO4N4pB9/0wKAYUkqO2J4WpI/sqh9CPJOvq3Z6jQIrpa3DMYMe1nLeIm0ZITLgnQs38e1SdMwNMJfJT9tvDQktiULoifY1vcXH8eeV80fzWQ1WZZxOzlztY9THYImuJ7TF20clIOsbuSpsDfFIO89xeQCJYeS3B1WBAZdQkZAcit8yozFYw9Nk7ISu5OZJ/8jgNT/ch/LN4XnzGdX3/1SY25lB+sxDbZ0fCsOFlE976ywWbNO4Nyvolr009jvjLgEUjbV2Op+6GtnTpl9Vpi/vvkudD9zwehjB/50F0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7060.namprd11.prod.outlook.com (2603:10b6:930:50::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 21:10:52 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.013; Thu, 20 Feb 2025
 21:10:52 +0000
Date: Thu, 20 Feb 2025 13:10:50 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] drm/xe: Convert pre-GMDID IPs to struct xe_ip
Message-ID: <20250220211050.GX4460@mdroper-desk1.amr.corp.intel.com>
References: <20250220172532.66613-1-gustavo.sousa@intel.com>
 <20250220172532.66613-5-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250220172532.66613-5-gustavo.sousa@intel.com>
X-ClientProxiedBy: BY1P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::8) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7060:EE_
X-MS-Office365-Filtering-Correlation-Id: 41c30344-2a0e-4668-98cb-08dd51f30ebc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/AGdm9boiPv7E0qjKGFSLAQKAHhQha2hkkdPF8pB0ggrhng5/KV7wYkEd++Y?=
 =?us-ascii?Q?zAzDaoXbLv/kXfe4PAaCZyz2kPfyalCgdf5RboTXmEedp2vK/Fvgf6rpUvHr?=
 =?us-ascii?Q?i5KZ6ZyDvV6cLNBCh4cNE+GtcYOIXjpJyBBPO822/MGX5JgqEyguMn4Oc+s0?=
 =?us-ascii?Q?F5Z2DEhoWE5dlHnJmEzoM2I+tZOo3JuB5GAum6j9vnFNjE7WYGYLBVRRO/sJ?=
 =?us-ascii?Q?+aqKdNvlrTWfFkwMUMk3PeNaN3XdYz+i22/wngre8DZefiyK6cGoltSmMngj?=
 =?us-ascii?Q?8E+Z5pypwa1RIojm/SL6D3GOEihVcjg3TV0cBbIWo9OTFt41c7WeSrhEetCe?=
 =?us-ascii?Q?rXHYGHOXSgRdl0jtYXxwXPJHChTuQbK/o4Nli2IkdZbsPpv+/ugA94iSzfvy?=
 =?us-ascii?Q?vx1OyxexpoJX6pr1vSXhXIygq/LMz9VGWDKgbP6QVYvv98bJn+aqZexMHj6e?=
 =?us-ascii?Q?jE8wZP6qHXDeVeSVyKWEEzYw8PXRy/o5iOODe+skc7/JHd1uaYzBf+ocki1l?=
 =?us-ascii?Q?fUzXaz93iCaxTLPAdGUDeIqzL+XnCK20nnIu+aSgvvpLHJw+45C4rgyGuJEs?=
 =?us-ascii?Q?jQyCI01jDcnfpoWGMbYg1ihU2MsSm0ZmISa16Cslrn19jsTLo1jL72zIiFMh?=
 =?us-ascii?Q?TCns1QdywkqHB7NrH2YSYECop0vILgRG0aYJkojbGOamAN70W10d+6+3OPGU?=
 =?us-ascii?Q?XScCMeciO4IMVeyArp8RcnB+Qcn8/aOWtovRr1yyJbe/vnQNFTTtCBv3zP3j?=
 =?us-ascii?Q?d4gs58TdXmj+Ugjd3A+juoT5g0EA1ZAqKmuLnex/HKyz6CibrYy3eZFcwgCb?=
 =?us-ascii?Q?VRibT6c6iU+RJtuOMiFwESPEVBhhak+8AIoI5KqnyLRst7kTQNcLoRon1AD2?=
 =?us-ascii?Q?cXOuDkAbZAAt4oH5D1t3i4XWR+QeqYDDGqeGaUmLNMuk3k6x9sJI22qiEU23?=
 =?us-ascii?Q?pul4/Q7MjTTNudBPBjPhkFZnfZqXfGEe9gjsPNyn2MD7yL2j+Stfv8w8+jTn?=
 =?us-ascii?Q?IMof50KBTZQaYPMAmgqkAYGMFNWIqwl2+4LTbbf31J7zwBBpQA+HhDPd8sht?=
 =?us-ascii?Q?8FSalhIzZLzJ/EMqaSUyHQdHpCwinFG6zRC8JnKX3gKMZQQt533mAyghV6PH?=
 =?us-ascii?Q?n8JNHj93T6GVgRa3s82UyiT8pgmsRuxc85hISVb2TudLRyD5ELE1DH21LSFl?=
 =?us-ascii?Q?irC9XByprjt4NkZ04wTyePB6eYeyHAPeIhYMV85uyYrT5YcKRGLiZ5PCstIn?=
 =?us-ascii?Q?mk4hoAPY+49EuTERnr9u27xrpsc5HAzdikYhlPvNuyYOf7A/dtLOjCenAujQ?=
 =?us-ascii?Q?QFcNIzYKivsTqcDzOE/Vnq9sM+p9WvjyYIukmX44wWhXscAdqdEonB78AgpN?=
 =?us-ascii?Q?oclwQnhUm35aO/X0SEjkGz18ziwC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kH3pIE5qK6nNb4uMsVCIK2nhgHbU0FnLgOitrqv8FHqvQKfAgSIp+Abm5Wx2?=
 =?us-ascii?Q?UjetBBkYWuSi3UlbOLMeYPFj/E1bhUA0wF/n0aG4VWlrl7nlQK7m9OIG1gqQ?=
 =?us-ascii?Q?3/jvkBhR401ZoWRExI/qz9xxuJwmm6YtDgIrXEv6YHjDTZRiXG7ZC0F6Y5ub?=
 =?us-ascii?Q?519z0bycFsrCV4AHcJ8MvG1NbBaWsGWqUq8TI65tTK+pVkPh7EDa2FYNlAAw?=
 =?us-ascii?Q?Kd5fy3B1ZJDfLGPDgD0KJOYAuO459Hzos1RWPEAbI3/CNH0MA0H2Fym8maSM?=
 =?us-ascii?Q?JY38SX5dUSP0HgNZ5vugjJloromDJj4ESk+wNnWW6nCk7vDny3sCqYlqbOuY?=
 =?us-ascii?Q?QWobsBSxC99llw96YpaR9WtAb01t7CrUEjKLh4Vuzn5fA995UjbqSG5Tej2U?=
 =?us-ascii?Q?3rCDr7nRE62xAQdJoNVXtHnYUMY/LxIwXk27vnxnFTRrIsYPOJmfq9XnTC5x?=
 =?us-ascii?Q?EFUnahao5WQopx8NaFTLrHiEXWxo4G9Qz0SFn6Blgk6ZivaMQTASdXaDKgWz?=
 =?us-ascii?Q?mvTob44jeT4Ddit/y5ZJ8Vy9bFG3TZ3k9TXyFGLIeNu3FRXXSLCwolVL/Wl6?=
 =?us-ascii?Q?344Hu1EFhl119bB7BB5MRa5h4Z64b7YH/Aa1nCSo2jV9UWUdx4n4UeZWf/9O?=
 =?us-ascii?Q?9c6S9JQm9iWIMU1aQDuNjHXkw1susknAmXSu4tnLQEaV79Qv5dJ/pffrBfEp?=
 =?us-ascii?Q?waTqpD+qkfMwWnT+UGDlK6k7dsKFL8IFE8okON/S5YZ8xs9xiPgNLf8Jgy+A?=
 =?us-ascii?Q?KqsWY4Oa2RAXzO6no2DY9JqAZFFN4aS7R+NgVFLyD8TEQ6MEL0U6OcXQkkCr?=
 =?us-ascii?Q?MtSIwGhEbHKZkAy1aENUrGlWlTuzG7tinFn8KN2gPrkdh7Doj22Hm4rqdIQ2?=
 =?us-ascii?Q?onhSTCb5Wn1S5abjfryX75txH8nDjBXGnwNAoyYdX8XXHJHgD1np7/+2Nj0Q?=
 =?us-ascii?Q?5CqColKHTe6/1Qo2tgVvvT070MZX8ajGhdYEOOjQIoDWz14LBPhZ7e4iDcPE?=
 =?us-ascii?Q?dc6lUmnWeRtSYigLSHpjY3P5GW/XTK98G+c8UGUwq9qX1wQSqtzQwC/gWAny?=
 =?us-ascii?Q?enzqsaVjCcXD+TanXzLNdVFXM8npwmAun5RYgoyR5gZ3GcrADbWKAPe2ebB+?=
 =?us-ascii?Q?uso4qaYfUTDJv+wI06/C1Rv8GQMbjnG+c231fdoZ6U1dNerJLrB4K8ja9l6c?=
 =?us-ascii?Q?yvGeQXqh3VpGlaVNp/lP306Te7uFPWcSVKu8jwDQEXW8o0gr7Khuh+mhAmuO?=
 =?us-ascii?Q?Uvo4HwLUgLVR/UbJzUj1gfjx6X3Ii0CMPHkFOFIWhLbiyRa/IL7pLImGgjSn?=
 =?us-ascii?Q?/FXZPVEVYcLJdyAzKhMU+2eFDAuBsao1k9yMRKgNjNT2N+Ob1qw+eFlNQt1t?=
 =?us-ascii?Q?cXcbYT03DhxlXK9UYocQlkZpBzB5+W8Ag7SyHVJM6rzn1VORyd1zmI5R2yO0?=
 =?us-ascii?Q?MxvMiLmRtk74flK3WQ1DyMAVXsrNj1NUSKPq1XpVJLldKoJ9gbNtncwSolSL?=
 =?us-ascii?Q?eowUn/p/dyBtOoOoF9h1xap/ndNY60JQlBO+6yQvHEiS6zrfgRBxqEM2GhY5?=
 =?us-ascii?Q?QGq90rxXa3dhR29MTAew70I82sOeShrhXYExx3kGjHAW1W+6X6OJrJ3/b+/2?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41c30344-2a0e-4668-98cb-08dd51f30ebc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 21:10:52.4647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5a8SnQ2j/sPhyVi2tzrSgH6fZvswCohxYyj2NRkEmxCMK6o8E0us9zRJ4RaOzD3P4xTT1z2eBDLh+itH7LzVNd9in9eO5KLYO+XvOMifVj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7060
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

On Thu, Feb 20, 2025 at 02:25:11PM -0300, Gustavo Sousa wrote:
> We have now a struct xe_ip to fully describe an IP, but we are only
> using that for GMDID-based IPs.
> 
> For pre-GMDID IPs, we still describe release info (version and name) via
> feature descriptors (struct xe_{graphics,media}_desc). Let's convert
> those to use struct xe_ip.
> 
> With this, we have a uniform way of describing IPs in the xe driver
> instead of having different approaches based on whether the IPs use
> GMDIDs or not.
> 
> A nice side-effect of this change is that now we have an easy way to
> lookup, in the source code, mappings between versions, names and
> features for all supported IPs.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c       | 60 ++++++++++++++++---------------
>  drivers/gpu/drm/xe/xe_pci_types.h |  8 -----
>  2 files changed, 32 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 8b8111e954c1..c88c2da1e731 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -82,10 +82,6 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>  #define NOP(x)	x
>  
>  static const struct xe_graphics_desc graphics_xelp = {
> -	.name = "Xe_LP",
> -	.ver = 12,
> -	.rel = 0,
> -
>  	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
>  
>  	.va_bits = 48,
> @@ -93,10 +89,6 @@ static const struct xe_graphics_desc graphics_xelp = {
>  };
>  
>  static const struct xe_graphics_desc graphics_xelpp = {
> -	.name = "Xe_LP+",
> -	.ver = 12,
> -	.rel = 10,
> -
>  	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
>  
>  	.va_bits = 48,
> @@ -109,10 +101,6 @@ static const struct xe_graphics_desc graphics_xelpp = {
>  	.vm_max_level = 3
>  
>  static const struct xe_graphics_desc graphics_xehpg = {
> -	.name = "Xe_HPG",
> -	.ver = 12,
> -	.rel = 55,
> -
>  	.hw_engine_mask =
>  		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
>  		BIT(XE_HW_ENGINE_CCS0) | BIT(XE_HW_ENGINE_CCS1) |
> @@ -125,10 +113,6 @@ static const struct xe_graphics_desc graphics_xehpg = {
>  };
>  
>  static const struct xe_graphics_desc graphics_xehpc = {
> -	.name = "Xe_HPC",
> -	.ver = 12,
> -	.rel = 60,
> -
>  	.hw_engine_mask =
>  		BIT(XE_HW_ENGINE_BCS0) | BIT(XE_HW_ENGINE_BCS1) |
>  		BIT(XE_HW_ENGINE_BCS2) | BIT(XE_HW_ENGINE_BCS3) |
> @@ -175,20 +159,12 @@ static const struct xe_graphics_desc graphics_xe2 = {
>  };
>  
>  static const struct xe_media_desc media_xem = {
> -	.name = "Xe_M",
> -	.ver = 12,
> -	.rel = 0,
> -
>  	.hw_engine_mask =
>  		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>  		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
>  };
>  
>  static const struct xe_media_desc media_xehpm = {
> -	.name = "Xe_HPM",
> -	.ver = 12,
> -	.rel = 55,
> -
>  	.hw_engine_mask =
>  		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>  		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
> @@ -369,6 +345,13 @@ static const struct xe_device_desc ptl_desc = {
>  #undef PLATFORM
>  __diag_pop();
>  
> +static const struct xe_ip pre_gmdid_ips[] = {
> +	{ 1200, "Xe_LP", &graphics_xelp },
> +	{ 1210, "Xe_LP+", &graphics_xelpp },
> +	{ 1255, "Xe_HPG", &graphics_xehpg },
> +	{ 1260, "Xe_HPC", &graphics_xehpc },
> +};
> +
>  /* GMDID-based Graphics IPs */
>  static const struct xe_ip graphics_ips[] = {
>  	{ 1270, "Xe_LPG", &graphics_xelpg },
> @@ -380,6 +363,11 @@ static const struct xe_ip graphics_ips[] = {
>  	{ 3001, "Xe3_LPG", &graphics_xe2 },
>  };
>  
> +static const struct xe_ip pre_gmdid_media_ips[] = {
> +	{ 1200, "Xe_M", &media_xem },
> +	{ 1255, "Xe_HPM", &media_xehpm },
> +};
> +
>  /* GMDID-based Media IPs */
>  static const struct xe_ip media_ips[] = {
>  	{ 1300, "Xe_LPM+", &media_xelpmp },
> @@ -558,12 +546,28 @@ static void handle_pre_gmdid(struct xe_device *xe,
>  			     const struct xe_graphics_desc *graphics,
>  			     const struct xe_media_desc *media)
>  {
> -	xe->info.graphics_verx100 = graphics->ver * 100 + graphics->rel;
> -	xe->info.graphics_name = graphics->name;
> +	for (int i = 0; i < ARRAY_SIZE(pre_gmdid_ips); i++) {
> +		if (pre_gmdid_ips[i].desc == graphics) {

Unfortunately it doesn't appear that we can consolidate now-identical
structures (e.g., graphics_xelp and graphics_xelpp) since doing so would
always match the first entry in the table an incorrect assign a version
of 12.00 instead of 12.10.  I guess that's not really any worse than the
current situation of having near-identical structures that only vary in
version though.

We might want to add a ktest to ensure that we never try to point
multiple versions at the same structure for pre-GMD_ID IPs.

Anyway,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


> +			xe->info.graphics_verx100 = pre_gmdid_ips[i].verx100;
> +			xe->info.graphics_name = pre_gmdid_ips[i].name;
> +
> +			break;
> +		}
> +	}
> +
> +	xe_assert(xe, xe->info.graphics_verx100);
>  
>  	if (media) {
> -		xe->info.media_verx100 = media->ver * 100 + media->rel;
> -		xe->info.media_name = media->name;
> +		for (int i = 0; i < ARRAY_SIZE(pre_gmdid_media_ips); i++) {
> +			if (pre_gmdid_media_ips[i].desc == media) {
> +				xe->info.media_verx100 = pre_gmdid_media_ips[i].verx100;
> +				xe->info.media_name = pre_gmdid_media_ips[i].name;
> +
> +				break;
> +			}
> +		}
> +
> +		xe_assert(xe, xe->info.media_verx100);
>  	} else {
>  		xe->info.media_name = "none";
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index f46426ef8ed8..e9b9bbc138d3 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -9,10 +9,6 @@
>  #include <linux/types.h>
>  
>  struct xe_graphics_desc {
> -	const char *name;
> -	u8 ver;
> -	u8 rel;
> -
>  	u8 va_bits;
>  	u8 vm_max_level;
>  	u8 vram_flags;
> @@ -28,10 +24,6 @@ struct xe_graphics_desc {
>  };
>  
>  struct xe_media_desc {
> -	const char *name;
> -	u8 ver;
> -	u8 rel;
> -
>  	u64 hw_engine_mask;	/* hardware engines provided by media IP */
>  
>  	u8 has_indirect_ring_state:1;
> -- 
> 2.48.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
