Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1C5EDE9AB
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:13:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C36510E8EB;
	Tue, 10 Sep 2024 18:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dvbkm3vQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236B610E8EC
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725992007; x=1757528007;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GXgK2dADTXOCvjCkqlnhDGjokFfwFmFs2LAvRgv/2fk=;
 b=Dvbkm3vQCD2sS9H/bsUBvLgBbWmo6WqjqqMecYrcNwYOzYY3NoExmp4P
 qNHk9rvIAJ6E81RQh6KglhjukVIT5qQ3uTNFHcYRmGmI88X5GXSlu3rCD
 qRzHFXs/eGMyfuugg2iLtobr6E/bkcai7hDz9ywr3EYPCChnVhavurQ/y
 sFr/HAe2vbHQgVHDYu80TR01m9hwoCQou81vvJBt5sRh+kqjIx3VKKutx
 uvSREjD1+qjZJ5lcCOgL3Xy0mb/m6EUAps/3ElQr5Y+Vq4qGzqYfUiXw/
 4s5llKl4RB6BgAWDtKJeAOZ8Hk/pGV5Uf1KBLMyOUMsma8SjxsZ2PRBae A==;
X-CSE-ConnectionGUID: KS4GUOdLTh6+SnolGmDQoA==
X-CSE-MsgGUID: KnbFIBtHRA2GdRjhr9GuXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="28539799"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="28539799"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:13:27 -0700
X-CSE-ConnectionGUID: bI0+eVcZR5iKsLWskZqIsA==
X-CSE-MsgGUID: mh0qyO8GSQqKEdzkm7OTyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="97944060"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:13:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:13:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:13:26 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:13:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UW73hPWyMQ72CndFKv9gi9T53icy/sd8jRAaDY5MA1QVLux8Io+FBsrACQ6jtSGI23tu1UpP6+vHQ91BWcSgki3X4WSNBHRCZlFW7zMRYbCoSnHSoS/GWHkXFFDNA1jEy3jXJ157JSf6P281Wm35EWtVoIxhzpvTr6jbT1vDqlrd0LE7d+Tmgxp8XtHSe6nhDAvLpLEIitgVNIThFOOx7WNcQ6dUqpNzF5BsVdkPmLfYVL4a/dfh/hDOs+36vuai9z4f9ksQQh8Vq27OB+JnY51OKycGG+hL1qI2M3jq2DMG7axnMgQVftfQFNZib1SYDD4IWWA5+adqS9WBsoZdgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hSCIRB3sNMp20/5mFa038m97gbldUJyXkSUTNXekEA=;
 b=OrI+raPnV6l/eU2sDPR0kOHgc1Y5Se9IDu1KC+4HVWTUbllm5uMqRtclpTeJT0QWYHC6r0HLt7yqV3V8Zno0m5nxDbojsHRw/aPzX/TpgTwPQNuD4UOaQW2tNvFJ7yJcJLaYeap8WvdJxlAUC06Qz3TgrMDwClulhZNIAXCJOA0NlbGYlPsGXf9KJ1CV0qNqPfDUuAVR4bFMTpzwx4gxrAALz1rjpY20PL4HEEsyrgHR1Iz8dtf5WrOskXJ6Nfo7/K4Wn1qkpi+1vT5ZFlZ9hHlLuYZR0b4FKcRzUT1uTNQwf6H6QvDpgKSgIPCK9JsQKs6g+NtR2NPapwCxGhfQVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DM4PR11MB7279.namprd11.prod.outlook.com (2603:10b6:8:109::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 10 Sep
 2024 18:13:23 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:13:23 +0000
Date: Tue, 10 Sep 2024 14:13:20 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 33/43] drm/xe/execlist: Convert register access to use
 xe_mmio
Message-ID: <ZuCMQMJl8JKYF8xx@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-78-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-78-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0295.namprd03.prod.outlook.com
 (2603:10b6:303:b5::30) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DM4PR11MB7279:EE_
X-MS-Office365-Filtering-Correlation-Id: fae9a8f2-b4cd-427b-dcf1-08dcd1c441e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2GjhqpLI4eogXLCZFgadGPIc1KuF7OkpEs96XcRGLs+ujls4gxA2M+rxu+a1?=
 =?us-ascii?Q?oRZunUu2LP6qbI2bHDGyt73o+AsWD6unxv7UzYr+YUbgixRX9+CCdvP4uwvz?=
 =?us-ascii?Q?v76FwXtu8d27FaFspPGDai6SzSn1shUxDKud3dsj0NFky3SFUvt9/YOhS9DN?=
 =?us-ascii?Q?Gb49HSs9G5LBIRpOPxF8j8pB5MszIATgizuxzLBLUi7y1r3BFpwfOwrwH56c?=
 =?us-ascii?Q?M3Q3UypBglhIx5c4Qi4omhL8/05Q0UE1inw4Ne0lUFqiy/pZhh5yjLm+Yg4U?=
 =?us-ascii?Q?2l8ToFH5NTpyyEzSvk4BpeD6ne53tuVOJlUfVa/v18Vs4pp++g95PZpBIx4N?=
 =?us-ascii?Q?YVsCxzkZkvpTD5c1ZjG4I+w3oCsFGwA5fzXi7q2HXFTQD4785f2xV4xyLFEa?=
 =?us-ascii?Q?h3ykTLFiRBakzbb8jQp691Ym9Kh4x8ldTc4ETo+PSIyFgl5vh/u2FJzoUzSu?=
 =?us-ascii?Q?5yh3Zd/pEgZ5qFV2VdIspVXVvZqes95bY+hqQ2QrWfnyhD8bodqrgp5oxIRV?=
 =?us-ascii?Q?9jWuEeTbAYpzJrtD4EdnIQVuK3X+RuYv8ngaaI/ug8QDFjsSoITWHzXWwzsR?=
 =?us-ascii?Q?weJRK9MhYVhAx8YyrIpz0/ovGXGv0Z70K6olJn0g4LNc73GK7EObetpKQfU1?=
 =?us-ascii?Q?k68PlEhBrCWHpmRWIL3fInIrlGRxBgHBAUAiaL7nSxryKc6beRP6uc8jizXq?=
 =?us-ascii?Q?I6w6n9Ys+Drz/vjB4Cy/CcP84Iq9hdh1VZa/pQmVO4wW8kSoYDGTnQZptmhf?=
 =?us-ascii?Q?nxZyqQTigrcNL/hdKIxw1RWGdhCqsGKad13LrKs3qIOWrjdcQJ4OyPLN8boi?=
 =?us-ascii?Q?cfw3NCeUJ7zTtSLv6qRa9h/8DunejgsRXoeW3axG3qM2FfhmiRl3MU9b247r?=
 =?us-ascii?Q?7+hlR5mCoIZs2yEQJryNG6wd6HEnc+DiqmeqnUUfHhy+Kycnn9aRzG9jI9GP?=
 =?us-ascii?Q?ismhjfgx5WmTYQ0D0GeWpIXja4IuzwFGs6NHqn05XwYyqvPytwqIvRLsER5w?=
 =?us-ascii?Q?a1A4nNJT95VB3emPWXvgERliB5KiSJMk60WQ02PNf6KtCaqq/JAUKgREHR80?=
 =?us-ascii?Q?Iti7CBUZIlY96USyIcsRqP0L45yJEBymvNUCoZ9yoXMI8jg3hFIzEHwu8WCV?=
 =?us-ascii?Q?K3kTs9u0IN1FCQn8f1J4/l+oxDwkPRyH940ZMW8fhihzdjNe6aYDSyOZg/cz?=
 =?us-ascii?Q?jVja4TQKYzMBkpFjU4QolqAdkVlIYoxLA8Lj7onh4FXdA80t+kJRJ3vLb4kL?=
 =?us-ascii?Q?EVvdZGbjdceBfBIafSb0vjTmDdJzFUoD2KNdzTl36Aoz8ReQVKVXVAn7wPfv?=
 =?us-ascii?Q?yLgn+zccZPuMFGAIeYhaSzDs4tXojdFDiO9lWMo70ayPaQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vrcJoRBrjUhZRQLGeB0AesVfZ5AokZvLTD3PTBxQS4bIwDa281rMJ5UOTpFU?=
 =?us-ascii?Q?RXcu9S2kifZ+ERYRcKWh/rR2h3VBGdnULWMm/ENe5CsEUJGOgOhDWpq0sWma?=
 =?us-ascii?Q?wSAJlX8DmYAYIOVYTZfcn+rF1PW7wa/iTuIdABGS/z7M0itcnfZzbDeLdcAJ?=
 =?us-ascii?Q?BmylhAdWO7Ls1Y4ykDKLNdgNVD0JprobEa1HvXhpuDvRN5W8lOMv+9mK5OOU?=
 =?us-ascii?Q?G5Ta7WnwkSRJowQXK76YObIK6RyPWXKuc8fmUdRvm4rinuaj5b5qKBhct0IP?=
 =?us-ascii?Q?oSyUzsNsEzNKookbnfxumflzVjisP01nQwQSqEtOpurIR6jDaCTojl2Pavhj?=
 =?us-ascii?Q?KsV4tE7e7kYxFl56VELZZqb+If/UGTLvLzU9GFnp5v/NemwlAyyYiRe4+iDK?=
 =?us-ascii?Q?+D2TzI7ved7BfX28i7pxxEpsSjeOAodM0+SbVBwCFt15kOYuJ3eZLOdTpQAJ?=
 =?us-ascii?Q?eZuzr4S/fJ0RmwpbHdgIpJuCOOf+ublQ4pIbR4JmwrZAYAzXdtM3P2KiUoFF?=
 =?us-ascii?Q?io59xRyibIyHL6BVV+tRTQmBAKQwQxf+5ZNmYUVTcHNRrEwIIm9PYU8B+Q+F?=
 =?us-ascii?Q?gKnxBYtGSgoq+Kazj5mbTNV0DWa3HfWga48v1Ni3kzUh4Qm0b0ODuwSTPkB1?=
 =?us-ascii?Q?PnFsfD0rC5Em35+PBKgQOohOdIdu9QWEhTiwlSNF3bsb8LDpSAIl/V23T+yG?=
 =?us-ascii?Q?kjU+lX9ffgR7i4hNbH1ZVuo35SFI4uZUoQMQ/Dz8a+rfutlfZNnrJCfBM5QH?=
 =?us-ascii?Q?nm06N8I3V37GsiMsZ6N30AWqBz0VgS1OGyN2uUETuRA/gqlG9oJgbIhyXox/?=
 =?us-ascii?Q?bAlo8BFCwOkQs6ycRiv+5De5kugoVBOSs7R6Z2By6Sj/GqtpS10PMJmKws24?=
 =?us-ascii?Q?QEHL+jiFQQxL2y26RbUshkZULyUBrcjHjb52FdlIo/3pIsLmLmvn3F0vz/ug?=
 =?us-ascii?Q?UJqAQHwcGUQDlSaRGpXRtv0oY8fdp11tQQ6Kj3J8cDEi4Q5g0i3Ycm5wMwYS?=
 =?us-ascii?Q?E7Vxwpb/q5p38eBX0YJob5TU0uXFmV+u2jIQcxVYjREmuEkeNGCnXPFiCsl1?=
 =?us-ascii?Q?qvwcCcDO/ODlnEQMRaEe6QEUg0vOCsctR1831PtQYhYg8W1d3cPvJrIIYJ7v?=
 =?us-ascii?Q?8cfHHGDrtvrN09vJJGX0V/lkWBY8LRxO6neBEaAnPcgq13xTGch6IQCD1Zj/?=
 =?us-ascii?Q?KFr32J7CvTuDk4cDKM6iFm1cP/5O/IKQ0Tr4lY1wjox4qagTvPfPPtljMECg?=
 =?us-ascii?Q?HU+kozTeo6jHN25naswZYMBtnjFwSnq+Zoio02QZjzIbjzvD0Q82SBRUkSp5?=
 =?us-ascii?Q?EClrSTQWX4FzpjNFrTfcXoGZ8i17O160FemDwgnDH6R/BuvSrxDJqyLlswa3?=
 =?us-ascii?Q?gmuklNWrW2cMw1DfjgRXniytqfX1pGgbGl6eUBFfiiT8TCC/w8VTiO/dnYKK?=
 =?us-ascii?Q?H3SF2pt7BzCiS2sZDAqgZnVuTsWbKXSPmS//BqrW2q/9JclHwW2oqkfrR9pk?=
 =?us-ascii?Q?0/Nv2sGK2rXRRmMEn4ioGy7eM3tz56PfqGgd8Z33oafcOvFS8ycOwPC0iXv5?=
 =?us-ascii?Q?fEjHfYzcNRpFJZQQ2Sn7tNlrc8xo9VPhTIM30z+TzfaZK9B4hRzh/xEGrZrn?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fae9a8f2-b4cd-427b-dcf1-08dcd1c441e2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:13:23.1606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: teLB63grJAG/H5V9DWnTiYNe0SVZmgfjSbdst1MY1U0Ks2ppw6CiiNJUvl1y8/sQUHqtix9uc4v0FaHa+OhviQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7279
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

On Fri, Sep 06, 2024 at 05:08:22PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_execlist.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index 6a59165b9569..f3b71fe7a96d 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -44,6 +44,7 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
>  			u32 ctx_id)
>  {
>  	struct xe_gt *gt = hwe->gt;
> +	struct xe_mmio *mmio = &gt->mmio;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u64 lrc_desc;
>  
> @@ -58,7 +59,7 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
>  	}
>  
>  	if (hwe->class == XE_ENGINE_CLASS_COMPUTE)
> -		xe_mmio_write32(hwe->gt, RCU_MODE,
> +		xe_mmio_write32(mmio, RCU_MODE,
>  				_MASKED_BIT_ENABLE(RCU_MODE_CCS_ENABLE));
>  
>  	xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
> @@ -76,17 +77,17 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
>  	 */
>  	wmb();
>  
> -	xe_mmio_write32(gt, RING_HWS_PGA(hwe->mmio_base),
> +	xe_mmio_write32(mmio, RING_HWS_PGA(hwe->mmio_base),
>  			xe_bo_ggtt_addr(hwe->hwsp));
> -	xe_mmio_read32(gt, RING_HWS_PGA(hwe->mmio_base));
> -	xe_mmio_write32(gt, RING_MODE(hwe->mmio_base),
> +	xe_mmio_read32(mmio, RING_HWS_PGA(hwe->mmio_base));
> +	xe_mmio_write32(mmio, RING_MODE(hwe->mmio_base),
>  			_MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE));
>  
> -	xe_mmio_write32(gt, RING_EXECLIST_SQ_CONTENTS_LO(hwe->mmio_base),
> +	xe_mmio_write32(mmio, RING_EXECLIST_SQ_CONTENTS_LO(hwe->mmio_base),
>  			lower_32_bits(lrc_desc));
> -	xe_mmio_write32(gt, RING_EXECLIST_SQ_CONTENTS_HI(hwe->mmio_base),
> +	xe_mmio_write32(mmio, RING_EXECLIST_SQ_CONTENTS_HI(hwe->mmio_base),
>  			upper_32_bits(lrc_desc));
> -	xe_mmio_write32(gt, RING_EXECLIST_CONTROL(hwe->mmio_base),
> +	xe_mmio_write32(mmio, RING_EXECLIST_CONTROL(hwe->mmio_base),
>  			EL_CTRL_LOAD);
>  }
>  
> @@ -168,8 +169,8 @@ static u64 read_execlist_status(struct xe_hw_engine *hwe)
>  	struct xe_gt *gt = hwe->gt;
>  	u32 hi, lo;
>  
> -	lo = xe_mmio_read32(gt, RING_EXECLIST_STATUS_LO(hwe->mmio_base));
> -	hi = xe_mmio_read32(gt, RING_EXECLIST_STATUS_HI(hwe->mmio_base));
> +	lo = xe_mmio_read32(&gt->mmio, RING_EXECLIST_STATUS_LO(hwe->mmio_base));
> +	hi = xe_mmio_read32(&gt->mmio, RING_EXECLIST_STATUS_HI(hwe->mmio_base));
>  
>  	return lo | (u64)hi << 32;
>  }
> -- 
> 2.45.2
> 
