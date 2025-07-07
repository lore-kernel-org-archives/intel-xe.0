Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601A3C83F07
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 12:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2604910E460;
	Mon,  7 Jul 2025 12:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j4EoI4IH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC2F10E460
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 12:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751890353; x=1783426353;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IwmvXyJ1g0mWfPlXGuXmcGQ6FfW1V/8rh8eBK/FhwNc=;
 b=j4EoI4IHNGzmXbwTDex1NF81WDLuino/SwaLGUhkbOOn1PDV4WdtGHYz
 knaXjTaFAzZnBjQ1vD/tL/KtsXsHtW2bo0ShehgtmZeVuoump6Oenrf1H
 +VlhGnleul89F5QTXBqL+B5oOPDF0ZDzIGed/Lq212ZC5t5tYRR5KiLsl
 5AeljSsziUTzMzEI504+ZtGAxjo7j0ikI+mScWIOr7vZDsao/PH7dyjVa
 REpnGHD+mBGlCNFeHQwZ8hoxAxaEeoKw5+s56m+n/UONjBjoOJauT+TvS
 27lml9n80x3vMvVrLu4NSQRpshius/ZdDUMYsB/6oLpDQhlbdiXu4ITLe g==;
X-CSE-ConnectionGUID: Te4TEqRASVaKc5qT3M0seA==
X-CSE-MsgGUID: qSxqh5GJRzWrY/mtKvmuZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65173855"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="65173855"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 05:12:33 -0700
X-CSE-ConnectionGUID: t/gj/c1pQ0OgSzPAGmrQsw==
X-CSE-MsgGUID: /QU6ZWkmQ2u2zOXrG8BOYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="155785507"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 05:12:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 05:12:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 05:12:31 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.78)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 05:12:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlGewZXnQVAoP1u76uquMNDcCJkDR+sH0G7ArPXM8sEuZMPhxuw86eHYZZZvw75aMXIGA4oTdpUloHlb2p+cYRn1VoHnEk6H5f1qvM8wTApVAJ4TU+deDDWEL7FTZwCeNEGm0jwGPyO39ls39cKuYJNXR0dSYIctebpu2p8VT9LThA5lX7uHHBovkMdHRJ+ZXMvFA8XD7CzJzI4aBMU71ZGdxOSMYoQAjdmaBeVe9YnfudEGXJpsiA7k8gPSqgXfFYCfRuqqW512fUyFs0f07u7uEWcomtHgcCsf6Dzg7K2ZQfIF8lcte4lElu2sWUHWnNDBXYMKYsd8sNre2XFw0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbaoL0qpsZdlTPBVRvCpyCmhXw7mAAfenBm7MafVH+c=;
 b=L5COja2rdUdPhRzzG0QWyAydpe3WemVbHa2iSJk5VNhJUBKvGqeQbZVgPFol5DJQLqKYwG7xu75ZVuGqtZ2y0Wwy/7YaTxhbndBlN7FQqokihNtmvUV3k45r8+MOnzfVz0LD4HYrZpsYw8MjP/FS/gwMqWrXj67XztMstgSiDTPt1lyF3qtLGBalbGfZ6ALAuw5YeOOxDConyYZ6TvV0wmsALBhDld4WxwuRbK7fgIIwydENirZsFM0Ae1PWSW2iHnZvpOr3t33l0GL8T6ec0BTc7nZvUTP6cyhNzx+tetOxTC0zDG3J6AMJKPpiK2HhQ9w3IWPHhWFxthGo5eo80w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH3PPFD9B78DE02.namprd11.prod.outlook.com (2603:10b6:518:1::d53) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Mon, 7 Jul
 2025 12:12:16 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.8901.023; Mon, 7 Jul 2025
 12:12:15 +0000
Date: Mon, 7 Jul 2025 14:12:07 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>, Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH 1/2] drm/xe: Extract xe_bo_is_visible_vram
Message-ID: <aGu5lwW3H2D9RqeP@fdugast-desk>
References: <20250627151307.23001-4-dev@lankhorst.se>
 <20250627151307.23001-5-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250627151307.23001-5-dev@lankhorst.se>
Organization: Intel Corporation
X-ClientProxiedBy: LO4P123CA0048.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::17) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH3PPFD9B78DE02:EE_
X-MS-Office365-Filtering-Correlation-Id: ade4a55f-fa91-4c09-bc10-08ddbd4f82f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ASutst4fnmjVN2Vc8lEvElgvIN7FIIRB86nTzDNCf6koGkgAfIS8ibPc6WNu?=
 =?us-ascii?Q?IiLP9P4K+LQ9bereuKRPVHetAwv+qv8G5hydJJArpmII1Da84MVu+39Nn0ID?=
 =?us-ascii?Q?jerx7BjuTfrwmA8C3Y8yRYs9AwxO5wCNmoHt0lsAmYWtNpNsANgU8ROdmU+8?=
 =?us-ascii?Q?vC5VB33ZcXq7vqxjix9sgUOUsuTI+si/vl1TPtFkKE/2gmBtX3i5M8ACmp/e?=
 =?us-ascii?Q?cGmATffnOTqHyTtNaIklZ73K5FpPQL/16RIakzf8FkUqXGSF81Ivv5tMXi8E?=
 =?us-ascii?Q?S+92qYMQwuENSntE74iHCQjUkReKc+UewQmnJHB8TFscDL4LkUOlpZpp+Wr7?=
 =?us-ascii?Q?0yDVEiz6HUkiplxFBbFM5iJnxtUe83M0tEd1kMyk2sXlap+LTjQ2AS6x5K9L?=
 =?us-ascii?Q?9vHWI4s74lV1wWt4GRoobLjJpkOqc/0zZdUEGnJC4S4V7nSU1nOQvJcd0JBK?=
 =?us-ascii?Q?RYgogydt3yJRmu3rGqfq0omTnWoj51rWfGW5WOZjiqpM1mNXWX5t55BnTTIP?=
 =?us-ascii?Q?jOTC6dS1Q6rKbi2YpB27aaQfjTxBE8rTxpQBMChESQ0V87UxABsY5t9Fa17N?=
 =?us-ascii?Q?Kz4HvhHiWCiaUfTMpGqtMQrdYU3F2ybcWCJBdDvy+Npz3fG3cG8U62YX/b+r?=
 =?us-ascii?Q?mDGQDBKUUyzErorIk9Lk1jvDPoh1JFg4+4b4Cz1WPc2xbOhbcY4+fRCLIpqH?=
 =?us-ascii?Q?tNr46VfXtPZYPommuHU9tPCyvg4ED8oVU1/Y301joeVm9rySS64rOr/uArf7?=
 =?us-ascii?Q?60NpeSDqDuFEbW7fE7KnJADKXg+NgYShXlgIAeUELE93IWdvzb/5E3YX2rGW?=
 =?us-ascii?Q?HKLtGlL6ilN1uSQuPW5vmjrrhHtpkRh5dGogF8yoQe5vOYYgH6jdSQ/syQla?=
 =?us-ascii?Q?eAYWypnPqVpOGBGq4SsLByYPUw8y2Y0kgZA0J4rRYVLI8odowsUEWRJCkHrb?=
 =?us-ascii?Q?KwDxkTowlw9hp6WJAcXhB0D/ZphGcV7mU83MzvcJhHHuyXZPaRpsP2ASMxy4?=
 =?us-ascii?Q?qpcnNoRl/seOGxbsvmbdAPNhslxFdwrToPhk1ei4rDYKVIDtarp6lW6Dl9ln?=
 =?us-ascii?Q?E9DJIWI6dlsQZ5un9eBolBqQWPJlVb6dXWxz+eQc3Ij0J8iqO4lvX/Lmwv/P?=
 =?us-ascii?Q?JCCgirpjzIusyxgza6WJ1J0mgkC1/GnQq8TLkRCr1Z20EO20ZKaPp9PxHGY2?=
 =?us-ascii?Q?NC0cpxe/KX04sjuZFs+Ps+1HaskMjM1pZqyA3ujvS7HwG79QxHhFVhLELsZs?=
 =?us-ascii?Q?dhngiV3eAneIUngf6VF3QRNJXUn8VjsOvvlubeMtr+/xzWguydftbs0skvQ6?=
 =?us-ascii?Q?Adb1QbXGP4o56GPXokxA2sKytf3HbQcwwEThgJzVIWU/gmoYvQF9UvX3Au3N?=
 =?us-ascii?Q?2aacmVGgTHPtbYbZdCww2Q9n0DrQUCFcuP0BQ4SvgbzqMo/6wTOIq/DDZlVY?=
 =?us-ascii?Q?ghU7d3gRgzc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y08BpjdDI7XKqv4d6a45Kkd5NsaZ3GUtxXxCCUnXXuZz1Im7Cbsi0sJCUVM3?=
 =?us-ascii?Q?O4zkCWjSBmFx3pWupcGngpxmvmUvAh8uIyOCxMwRaMK1p5LFGydIgiSXUOF+?=
 =?us-ascii?Q?jBlHAQGgrVkdEAN7oPApV3sLz+ooL6Hu4zCALmgvdUOtqGCVRrB9AuDlkxS1?=
 =?us-ascii?Q?+XLRQDJ/UxD/As8pAc65ik9FdB8RYvwoaUZMsAWtCBpukoTYQfJxbx8RaJe1?=
 =?us-ascii?Q?N42jC8x3LLeNCwzIWgWl9EQSm86hdumqrS5Ulf7fXSHO4dWKaPvD6bReUf25?=
 =?us-ascii?Q?VLJ4q7Otl+Y43pFpVdcgxxpQ8uptA6HPc4KDNm6FZ0G8HF0jkRZ5RZ23lcUT?=
 =?us-ascii?Q?RK2SQeXNnSxHVEcQtA18WVSY9GIkvyv2YqFXJuC30ngNi5zl42iEuhSrk3kc?=
 =?us-ascii?Q?vVnbM/uRhrZVXAxRZzSXpJA9zhv/iepGamYc1+rtAUoRw0u7U541OeYw0ECz?=
 =?us-ascii?Q?m7z1/TRqJfJnx+nh/qj+GpHr1RcHW2U4ajrudc8cDAG/jPm5eW9Pi/FC/QRL?=
 =?us-ascii?Q?f2Auyv75dkPoZ+A4T7CM7nPal3qhI95PG1SYSVE0kWl6EIuk354ImRm6NAwo?=
 =?us-ascii?Q?iOJ+g1tFd1rghkH46B3YZWmx3iQhEwkMOfuF5BU/n/HdzVnwJB6w36XNWMdq?=
 =?us-ascii?Q?XajPGmYF2Yb8n2uewAXdDDxKrKB+kw8L8A9/9gTtWoYsrSrxh7VDDfKOyD5A?=
 =?us-ascii?Q?KCX++ehgH+wwqXvAGVpJzzlGwUc7PdCNDjEQy70KLBL2+X80GPYqB4Pw8I+8?=
 =?us-ascii?Q?AQ3v98M8d7OPvYu/IpAf8MHwp10fOH8/9fDnMeFIWIoBTlugXsWLHH2zGPjy?=
 =?us-ascii?Q?x2qluAuYcE3Ce3IPwtLL+ASREo2MNH07htpt/HfC8cvZlbZjKlNGrBhjBI12?=
 =?us-ascii?Q?aaAQRq1X+Wa6y8k3V5Fh27QKoP8v41hwW1j5aHazZgXiAmzhX+Gv2kDcGI57?=
 =?us-ascii?Q?X8m4g4Txshdbks0XJi+LtsZhmO6FDyQoapIz3OXzwY3L9MOfSKGRH8LQ5MXn?=
 =?us-ascii?Q?FO1n0sRkR3AAt4EK++yIaJ2eOo6UXfVQfND7iLJBufssCkXqwHhK5oVwiZrk?=
 =?us-ascii?Q?C/lnleAb9o9LIEipNNqSZjnAHfesJzLmQZ7ux2jgxY8cJ/6wVKLqH4Vb75TT?=
 =?us-ascii?Q?fnnn/3CbejGlnhYC9qfLD5iKA/SAqOwCr/pUs47z+Loo60mdov7a9ow+uOcQ?=
 =?us-ascii?Q?wCZRpZu4I4YTOyy+Yo1hqzdcZJgR5rMqp7+oZ91RDJY2v2cSYSoPTsmraS5R?=
 =?us-ascii?Q?xVndSLxV0FzBaWiE0jwWNA4vqZ0M2J05k3lupqWQXnAafSz1t8HFUubUUd/0?=
 =?us-ascii?Q?T+yWSx5pM50uByJlX+DH/1bwmmR4wC7PlAGCCMH46ezFfV1NuX3/fhAEWqdI?=
 =?us-ascii?Q?SNHmKzgXuRB4P3DGwDZ2iP8TVyfjAlaawQya9uzHOUoWXEuiIOMMIs7YVWd3?=
 =?us-ascii?Q?63BV0+1rAkNo+kVElR7rFBt2hqVcanQYzXks896fhAm6k31fmsm9vHalYvOu?=
 =?us-ascii?Q?JIa90NzBPyZUqxu51s0Fhf/978az1QwZkKik3nHkktX+Rp8zgVOdA/JOW8kM?=
 =?us-ascii?Q?MhwG9BO86oBL3ynDer/UwVHw4tV0mI9+d4Setz2le9qQ6aj/rZTJYWxWsD6M?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ade4a55f-fa91-4c09-bc10-08ddbd4f82f3
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 12:12:15.7419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rkde8QyrItENDZAC7H1fkBdKpGpV/GCHu7Hx4LylZGRONsNC+kJ6sQDZC/yqQqA4AomUWyPCWm41/cBssZ3WP/D0gRG1Sb/0ROlIgyVED0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD9B78DE02
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

On Fri, Jun 27, 2025 at 05:13:09PM +0200, Maarten Lankhorst wrote:
> This will make it possible to call from xe_display code.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c | 10 +++++++++-
>  drivers/gpu/drm/xe/xe_bo.h |  1 +
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 4e39188a021ab..af312bc70d0fe 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -557,6 +557,14 @@ static bool xe_ttm_resource_visible(struct ttm_resource *mem)
>  	return vres->used_visible_size == mem->size;
>  }
>  
> +bool xe_bo_is_visible_vram(struct xe_bo *bo)
> +{
> +	if (drm_WARN_ON(bo->ttm.base.dev, !xe_bo_is_vram(bo)))
> +		return false;
> +
> +	return xe_ttm_resource_visible(bo->ttm.resource);
> +}
> +
>  static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
>  				 struct ttm_resource *mem)
>  {
> @@ -1547,7 +1555,7 @@ static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
>  	if (!mem_type_is_vram(ttm_bo->resource->mem_type))
>  		return -EIO;
>  
> -	if (!xe_ttm_resource_visible(ttm_bo->resource) || len >= SZ_16K) {
> +	if (!xe_bo_is_visible_vram(bo) || len >= SZ_16K) {
>  		struct xe_migrate *migrate =
>  			mem_type_to_migrate(xe, ttm_bo->resource->mem_type);
>  
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 02ada1fb8a235..460cfc309eec2 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -265,6 +265,7 @@ int xe_bo_read(struct xe_bo *bo, u64 offset, void *dst, int size);
>  
>  bool mem_type_is_vram(u32 mem_type);
>  bool xe_bo_is_vram(struct xe_bo *bo);
> +bool xe_bo_is_visible_vram(struct xe_bo *bo);
>  bool xe_bo_is_stolen(struct xe_bo *bo);
>  bool xe_bo_is_stolen_devmem(struct xe_bo *bo);
>  bool xe_bo_is_vm_bound(struct xe_bo *bo);
> -- 
> 2.45.2
> 
