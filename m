Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22131C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 22:35:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3A5113E5A;
	Wed, 24 Apr 2024 22:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VHhOAlSS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64AC7113E5A
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 22:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713998116; x=1745534116;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=h0BOnFZGLf0BHfqaVxW+1xgqG+bDoVC6xdnESwJr94o=;
 b=VHhOAlSSQmfI3M/suuGx6iLNQxr0EiK58C9IJeX6X6Ckqb4PdABnPdI+
 q3F04ngQ/L0ocohQ0Vifr7snQWnwlhBy9MmYqpXAZIOw3LL9gVbldG761
 DkAtCw2nftWf5/eRUy1yDXmYCmY08+rg6eFslmSv5tzyGQ5IPn7qDmxj7
 xzExsUZlkvbPpux+IokzCLzr9fShLL0hyCzGDMQM2wJHRZ20DeSeawGOs
 irlThJAyY0UKh47W2ymGdu4vPlWWPn0aTwnZxT1ez4Uaq4t4hCH4egovc
 OINlOcvPvzOIkC+PR76HuXkjJLQpurWwWghULOxEjeOf4qOnZaZKZB81l w==;
X-CSE-ConnectionGUID: QqacPrKES2y5VdPwNtzqGQ==
X-CSE-MsgGUID: l6+QlvVRQHOCSr7D6f0lvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="13443545"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="13443545"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 15:35:15 -0700
X-CSE-ConnectionGUID: rkWZmvMzSiStiPYC54G/+Q==
X-CSE-MsgGUID: NguB4KysTlGH2GpILzdBBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="24869991"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 15:35:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 15:35:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 15:35:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 15:35:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 15:35:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKTCfreGjDJTLLWmlzRnuV+D6Gr5YAIfxY7ODuYnlMXnWMOq2zS/cE6lt4tkzKzGfudQstu8D+xlmeP5Qn3bVy+Tsq/c4TTimFr3lFdgm/rbTYT8Tx/h8CpSHnwIQnE03zS1Cqx8at8h0GIoLzP7IDZpxfXcMdyWMUaBJQNwiNJU0/NT69pNKeOhGgA1DxlMSWMh3byPiPgmXV+IWSU4riXSv6pmcmcTs/1LJ0mimEJI63MS1DmkypUOZghMTqmTmAyA3MeHrYioKBaN4U8NMK/LDJ+Xvp2TlN0L9px19OVsd3wV2U0ipw+B7t3gbjxAobcUrFvfb1mmUISvnIaYlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFEuAz3o52W43CRsEe+dt4HfzCI+kwsk5As8RLSuFBA=;
 b=WWTjYv0Bt63pwH1ZKNbFe97sf35CtGB2g8LoTeroqE05vyvQkF0WmAOsnl4+T/PMzpuiMfxreLGlFjYGvwcwKa3Iy5OXwYWax4l4wYKs25OJgedxMDMIovynVMvJ90jTRMABWpj8ycqlhho7dvjl2AHBL7y/Hxp5NCJVHw1JYOsWCM45wMYG2GTzuXexO7cs0KVsLQ0oWYLXTmwAqnFlhZCvgTXaYiGc+3XYQp+owq4DM+KIqCDw+jpU7IgHeYlFCm2wm61NmdLWW/ph8BYUWxmBh0XrYTMkSQu8ZIcFr+yTZU0YzMC2JFgjNNh5N5tiMPmGJGDkQq0ko7gGQvEgbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8133.namprd11.prod.outlook.com (2603:10b6:8:15b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 22:35:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.020; Wed, 24 Apr 2024
 22:35:11 +0000
Date: Wed, 24 Apr 2024 17:35:08 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH V3] drm/xe/xe2: Add workaround 14021567978
Message-ID: <7krndpxenpnvb7i5jnjdejyteb2oltmucddmtfjvimtda2fc25@6wbwq7it3tgw>
References: <20240410064640.1010098-1-tejas.upadhyay@intel.com>
 <20240424151810.GA7068@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240424151810.GA7068@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: b5496acd-b33f-4385-fb16-08dc64aecd11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UMxW3TY0yzbD+LAlEZlTTS9NzLTccKB6tDAOQ12nt3UvZt5g10sAUOJsaP9M?=
 =?us-ascii?Q?hruJPLmpUBPoU0OKTUs1bEJtUjENkumcM+UJe1bJi01bdZxpp9URMlGAYTX9?=
 =?us-ascii?Q?xzeE7keAXQgDpK+O00EJuZCCwHAO3Z0ZS6q+cQRVoS/yotoFg4IZe6UfGQUy?=
 =?us-ascii?Q?A2iAUU6piAfD9+BR9p+6gaYNkYPYb0yJ0+dUSdf8XW5WnS9NuPhADYb8mMWL?=
 =?us-ascii?Q?e0pnxPZwTJ6SjrrFNmY16EpYrhVR+whkjrSMr18Wg3X3qOzCya6FaGj7sXIZ?=
 =?us-ascii?Q?ahPASv2AA0YQ7+ReHZFawaQBM2epAYkNQk4bR9rDqJ8DtMY9KqOIsm/T/7tK?=
 =?us-ascii?Q?MMgIdVZLU2MaO9TXnKYcbddBzFs/6+0WCpEbKFHdl37sEDg2efjiTpykiGeD?=
 =?us-ascii?Q?JfIcXVb0Rgx+VIITr85hxd7FDpNcLAqZwdJPvJXzXexg4RuMvsBwsVO4H1m6?=
 =?us-ascii?Q?/1EFtJZXRvJRGpMib5PuPTDFd0o6h2keltOBvdIH/h4cVSfn0o78Di62GHWQ?=
 =?us-ascii?Q?FICRnLKXwoLOGTIDfWJbsQzDXpohij5dmZQCGoRUsuuOBn924u7xgaaKMNQP?=
 =?us-ascii?Q?d3nnW/D5EdFYk4FU64Ti6V7BsUTTEjZKeEPPZxQ4sKcTAJkt79G+ewhmf6Gw?=
 =?us-ascii?Q?Zu6nZ75VAzJu7Cot1uCFEEJMhtPPmefjd78Y6bbs3AVcVmrmpDEFMe2zxSWr?=
 =?us-ascii?Q?HIAHJAAiB6r416WyGnEh/ODgDhrgiZ58nGVsYeekSJYCUGAuix8iJMxYnZcZ?=
 =?us-ascii?Q?cRWmVnztDIVUbEnHxe2Y0OYu2HtdWZjbk4D2dPMMuTD5r441hIHVokPPcaYb?=
 =?us-ascii?Q?bw3tklWy55J6KLd/NI3n5hxRPdNS6NbuLv40e42EDrReoLUG9dgZB3hQcyJm?=
 =?us-ascii?Q?9Gk0YgGCOryD80lhnNO9gmIrHFL45aASug6g1xyP4sFNbBdoOOlpawxt9aid?=
 =?us-ascii?Q?NQ0nWj4Var2oviAHBqmknnXQwR1kOtPHzvgQtU3Yed+jgoWkvVcoWfG6PYzh?=
 =?us-ascii?Q?cKtB80F2PGmHT6XS4IZZVrckSzn/a5HJP8Ci7/FQxne+OvJaMJftToTjxtrn?=
 =?us-ascii?Q?9vdrq0qN633GXNXwDjPtfQdLypmwuYkb3dOjT9sjwx1mQX71/CGV/52KLHb/?=
 =?us-ascii?Q?PXBYmCw25I+k1p+wGkEmFQIUrtwM87vRvyYo/Hu0i+0pDWbfMrxDnrQ1GkE/?=
 =?us-ascii?Q?rCGPsTc4yWnCxrfQLEYbVhqzZL80YnyHY9Dd5NTka3DgKDeGkoZPUxquTm76?=
 =?us-ascii?Q?QMS3U9LV8yhSRmiLRz+XOrSXSgA8E0bMYXzCPnJD2A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OrUrjyxQ/uK7rqntgAFRBDebdXT+D6g/tdQ4vINaM6imvOS0QHv/OFuxxW8E?=
 =?us-ascii?Q?VnoBACwds6jXfKXt3S/8vse/Fi69Wtx/fQWZBmspe74et/bGtCDlxLD9QjhJ?=
 =?us-ascii?Q?UUJW+IkPemAqYV2y/2/N8r8L8DkQipVLi15yICVG4YFPSeZqH2Es3eaEvHho?=
 =?us-ascii?Q?sPc42kPSetdgUm7QRquod3PS8GhUjgYmBg4Brsw/tNoMpdiA6jm7tzmCq1I8?=
 =?us-ascii?Q?2w3emWFwgJUuCLGXSocMECBZc4hCw4r2zjlU2f+XUjMZsNGEUzDK39AYMe4G?=
 =?us-ascii?Q?sAlWK3pYulwSRqrjTiJBx4W+ca2k0Qyu5zR9HW1t165jFWm3ZRb3Nn3/uwiN?=
 =?us-ascii?Q?llvHR1U5nOwZBmYLrTuCjj19R0HftI8Ag+OqaPrq/dDp60L5IzWCEaFCRgvf?=
 =?us-ascii?Q?KuePq7nOjojAnMiehwHDwrTs2HxJI5vp5j+XRAhLR7wsWUWoAQs+OW7kpJ5j?=
 =?us-ascii?Q?PhbXiL05s3HckQEke0p8dBxTResoLzysYV7jD711ZTSYq9yRl8kQ9ZHoPHmH?=
 =?us-ascii?Q?Sj4AX1mwBPMKnT7uLhxxrWBiGxcdY2SPnd/nFANDMBXG3cp0XHYBKRbSryFw?=
 =?us-ascii?Q?l04aPcZIouugZAS4icb1VLzHv9MxO4q6tpEJPFcAbU/CB/12gOQpWUJyIo/s?=
 =?us-ascii?Q?oE7QjXXMh6PCh8u8noEG0jMVP0pkSHp26Di9WjEdS4yvyBkxGSjc1YKBe73e?=
 =?us-ascii?Q?rEjaYr6AUdWkdksSlYryE5yTRH/jZ8AHnZBtzD6ONv0n3S5em+Vv2B38+3kE?=
 =?us-ascii?Q?PVxVwtb+OlWmJenIF18wtU5ajBUtB9jGqf0XInH5igzjzojFCAEJQD1T1Oea?=
 =?us-ascii?Q?BXoY0s1u3CI61FMRKsZPqvANO+kwn0mVxeQjK11jiXPDC6QGxshklznJ4sTq?=
 =?us-ascii?Q?sIo7R4W53ma7DgTIamNdDgp/HK95RdjYncaz0F++tWSIEZeiz5zowE3QAKeE?=
 =?us-ascii?Q?5Pi3d5He2rnwoMeR+SvPUaJ2ZaStrtwUh19vRvPfinLtzjPFiFpmblHCkC+B?=
 =?us-ascii?Q?3/c4iiiM/cRumpreOiJzuGInFcqoYI3724KEhLREMfX7Q4gB00Ess+uqpkKZ?=
 =?us-ascii?Q?Ey7AZBZaIdjvtJqGx0xpfpueWyx/jLnQaTx2RDfQ2e6VIUWA+1Uo8LatQtCH?=
 =?us-ascii?Q?QbY9IhEruH5HSUToQVGgCPFfTX90tZZFk1Oy0E7HE48x9dlgtfASRaegCCuq?=
 =?us-ascii?Q?KxarHsKgK2gEpBITs9A3jnCrf2HN5Xz7gCd36Bio5r5KumIvnCLEvDkxafgY?=
 =?us-ascii?Q?Ub601ab3xcBZdGtX9V+ypXxzcB9B0u9So4svjWXx1fmoM8mrRDZ45q6b2D67?=
 =?us-ascii?Q?LUEucnC18hX4WnIX4igyYkTv8hL3lxlZWfX8FUudXMBZJoER80fXmaV2m7gi?=
 =?us-ascii?Q?grIiMIB+1+WGRHDODiKbihXoCDv+2EBGRBjY1nJwlSyvqlbCZ4volPLuGWXY?=
 =?us-ascii?Q?FPcUd3ToKxWQb3SaXjVvquCOBy3VJxjTiJ0+0WeWUzTzNUZ1QmsQtGDCRMHl?=
 =?us-ascii?Q?lx1kSp0NsSxM7NDQC1gv7JFAnb9RqLgtSZzzKIrfPHLzRUpzVyEJJpXYgrbm?=
 =?us-ascii?Q?VEKMty+Wm9aUaYh3kEtavuGGGdvrJDnDkBWF2XNnTvM3yGGoqNNGLxALqLQu?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5496acd-b33f-4385-fb16-08dc64aecd11
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 22:35:10.9360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DdpgnxuVuVMFf3NmwrXFH5YobxchHjiIV6IN+gXY/N6oBT0/fguhn91olU+FZGw5Xv8V1x1p3/s3O8WJH7qTkdJuw2xM04O3+oX8TwmBA0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8133
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

On Wed, Apr 24, 2024 at 08:18:10AM GMT, Matt Roper wrote:
>On Wed, Apr 10, 2024 at 12:16:40PM +0530, Tejas Upadhyay wrote:
>> Workaround 14021567978 applies to RenderCS xe2
>>
>> V3:
>>   - Cover xe2_hpg as its landed upstream now
>> V2(MattR):
>>   - Move tuning to wa and apply to xe2
>>
>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Applied to drm-xe-next, thanks!

[1/1] drm/xe/xe2: Add workaround 14021567978
       commit: b5ef80879dfec1c8e2a992dc186196687293e1fe

Lucas De Marchi

>
>> ---
>>  drivers/gpu/drm/xe/xe_wa.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index 632bd9066f8d..56bd23e79fdb 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -669,6 +669,11 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),
>>  	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
>>  	},
>> +	{ XE_RTP_NAME("14021567978"),
>> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED),
>> +		       ENGINE_CLASS(RENDER)),
>> +	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP))
>> +	},
>>
>>  	/* Xe2_HPG */
>>  	{ XE_RTP_NAME("15010599737"),
>> --
>> 2.25.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
