Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E74BCA9ED0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 00:53:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC0610E6D4;
	Tue, 13 Oct 2026 00:53:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBAC10E6D4
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 00:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791852821; x=1823388821;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=O29x2PKsTWhLwIgrzfKbwYMbPOi5byur/RA87PYVKXk=;
 b=Bjph/idQHtNVaOm1zsefp1C4dj9HANPyjERZzi69BNiyhgOqhwyw2YzL
 PxTSqCwXujs8V++CYDIhovj+q60OrrJaRitzAGgOG0Xvv5Sj8aMeHq18V
 CuKBrWzn6X0GrIgl/C2d5RbIhLq3334qPx2XIvNziEzPPkDDcKMQoItmC
 7QMn9ZcFkKXgHwg92hlUMk/FbBpjkV5sykWWE+L8oVUOmRdINCPyE69Rk
 PtZfBoEA0efSMmifvn3Oly0Pmmv5TWQuXSrmM5Wn0vQVT1j+peOTLcLlT
 IVc6C4fIFSHSwBmtD8CNVetxYmq+PWaor8EuujeBhKIyUSMq6K03q+sZd A==;
X-CSE-ConnectionGUID: 1wquknAqSz2XlUxqo/GVww==
X-CSE-MsgGUID: v9LDG6aESR21N4/Tcp/rrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="577622"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="577622"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 17:53:40 -0700
X-CSE-ConnectionGUID: Ixgy2lA8TKCX08IkbP7tDw==
X-CSE-MsgGUID: 0UryG4umRY2KpnVdUQC81g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1134426"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 17:53:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 17:53:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 17:53:39 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 17:53:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HtZtS804K18QzcffaDML4jIm+U1ejDKePSyEwKK6o0M7hLapiN0AiSbc1v4k/7Gten8viyAZfpfZhGm0CzoB+qg+N8EwKApo63sVtXjeWnMaMewSOZ1mTjiOvhA3jom4t1zy4SJpnIWxtV148wBViNt15Dy1F22oexxtHWKxCwB/jbeL5EYQ45O3bHDB3RdHbF6zW0TKj8sP8vrUDWvoSdWEpBJJVNdtMHFov/an0tOR/Ur6Xj480QhJ406iR4rmg06zzUvA2AUhIRVZZ/ij6dC+GnQkffH4rXEh5r+l8sMmrT9c/u4KjDLDeqhj9QjFq2hMfe7HdMo7xFfLrh8I0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edflrn6rJzqoc/b9kNy4QA0NOi2O1RvwvTdlUb2NwaU=;
 b=ONDswtaih/7d0pgRGhjy1PINRCoXabVtpl8FoWG+n6yy12M2Uqmz8SYf2P8/Rp7dnfsa81S8h5+Hr1D+8oQZMCgEaZqUDa9Pex4xh6By6W/C5HolPwFlEmdXFhRtgrDxgExU62IJIjkhaKUkpQ+GsTRJofES6GJNqr1ojAseeGIkQP4lvOHm6lO7GbDqwHTo6O6BsdGp5VOcztpJ8eH2czrdqOy0x+nIrWp6aWVw20tdqOL23g9DW3zVYYloMm4AN/ZItS2OzXODTqpXoRS/gqyMWJZEQzUei31rX6B/s9exVn+mQ/t/cfnJVujkzXvzmJDShW3Uubzjc8Sy2flBVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by BL3PR11MB6361.namprd11.prod.outlook.com (2603:10b6:208:3b4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 00:53:37 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.015; Tue, 13 Oct 2026
 00:53:37 +0000
Date: Mon, 12 Oct 2026 20:53:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v10 15/16] drm/xe: Validate thermal sensor count before
 reads
Message-ID: <as2BA7r5U__c-15x@intel.com>
References: <20261012130401.443473-1-karthik.poosa@intel.com>
 <20261012130401.443473-16-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261012130401.443473-16-karthik.poosa@intel.com>
X-ClientProxiedBy: SI2PR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::17) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|BL3PR11MB6361:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ad05349-8528-4251-b847-08df28c46a1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|22082099003|18002099003|10067099003|261009223027099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: MvGbI7zhL5mHPGGd0AdNDyl8rq8pj+VXKP9WRik1FVDW+2JjSSbXgdhV66pppN/HRIU1rEWOYWTVagbYwEH9MLPjihHv+mC0gIG3Vj7RD4fGB4gIGSjDsmssgiF12ajaMw47ybKutlR9swSXxt1cZb5K2r8+GW9SoL/ju2VvvRFyx1UQiiK9p5/WSMkYazpWLsHcBxovanhuk00BSza0tHqyb68bMJ5Slm8Az5a4qmN7hsFOJ0dLYnWsVdN6PhCStiNEfDunn+scrVhsVdG/wDD0YB4Jink7Fha3iq2p0pC3RI1LVuCor3t/4TYjMpLIi2WX3DHS8OgVb+alDUv4l6Y8jfs+7QPromTb/9E1hol2U8fpVen2ez1Hk6qVI0FHhZwCuIDSEvDBcvo7JDbwUDvHj/cWLCVZVEO5WlvWCfwhg/IF2JkpdHnMVH7iznECHyJDOR0Lh6D24mL7uCSt7yQRl8Rp5vnRzUxNOatBq4/ng/UMJZZDhLD94NQZ843L+T3GEPPZbW23XhSe3UltY+nRu9T+a1vs5dRum39NgpWpk1QAwYWzaAKFnr07R/vZE2JGLOBCr+Yi0ZpK10aNSVCVtO/qkBfGrPcftjjZrb6PQxkNJ0/tJT/apcCaIAr6JgPU8ioFLKC/DRF2XZlgm2bRyEhjY/3ERsqFyFmlTZk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(10067099003)(261009223027099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iMS9c+EXTTGGYbZR2TCXxu23yzLfu8LcN/wCcDu/Pv0/PCR/2layvUQ3H6YA?=
 =?us-ascii?Q?iBCRnKDRm7V3w+azka/t3BbpihsQh43j8C87TQl11hMbSniafJE2QnMScJfY?=
 =?us-ascii?Q?3WuGI8s8TgAP1EvMzcURIdKACCJsGZPYqmpKwq06JSiZ9bArvwVyU/v/sW6C?=
 =?us-ascii?Q?/UO0M7delrajWrMaQZx1APnKpztPyzxRygfDkXv0GGWViBRHHrXe+THkTpcV?=
 =?us-ascii?Q?pvehtGRt6BQeMiZ8aDBsQtWKRdDuzhNDdoN1id5k+VY134UZwt+b3oirbVYX?=
 =?us-ascii?Q?fH+1IkT/FXteJuib+dxaDGk8jxAC7SX4XTXicUuJljpmXrpnrYJYm0op+wZO?=
 =?us-ascii?Q?3OekpqmBTnh1BzD9n+4ZHtjKRRKDESBmtmOJIIz7za7vnwynN5f+P6hPGn57?=
 =?us-ascii?Q?imT4G+r2FU2rs+PeQcSm12l8LXIHgn/z/jl3s8YgORnvKqG+yl9Z7XFsAe6K?=
 =?us-ascii?Q?j7aaLkwSkRuJWEkYIBF7AL9vZcptfxXKDqoM7Q1oC8mZkZbvX7MyzjP6/uga?=
 =?us-ascii?Q?skKbLMyOl/F2xlgB4Vzqx0TwblEHL7cPC3BzqfG5lyvVC4JRQ5h555XhkdEi?=
 =?us-ascii?Q?2zV6SKUo2zKJWnJ7kPohbMMdmyXl9knLyYvMyRhXveTsXYrJ2MtPpi+ndymx?=
 =?us-ascii?Q?rkJKIm6LIaoX7jyOvLt2Lahc3Q++m/1IPXRtluWA5rHLz9JXOZ3ZTfohVS4U?=
 =?us-ascii?Q?Fj9XaM+FqLDYD/89epVH9gN7EeeG5vIwD3xDZMa2jp+2PEMKgklq9+auP55L?=
 =?us-ascii?Q?doKhdMn/7Fq3itLsvcnQE+vZzCMkTexajEOzp8jASZd2WWltyQcBXo3mJDZG?=
 =?us-ascii?Q?7EMUhdhMjnDXOREbQeJG1Z4riNKh4TR4l5OcZj/oTkUJEzY98xgT2mg2AHE/?=
 =?us-ascii?Q?qTzEwgWU8uHITBVavEjqKkBvsHbGq1bYop/w7WVKo4qw4yARFgnLaSVHaWbQ?=
 =?us-ascii?Q?EaycJZz2fJB/AxExlXr1M5Wi+zSV76+JyS0vJMrSNcddzmNFqEENhNGiU9/w?=
 =?us-ascii?Q?UvPVDS13TGO2IuI8Hv8inKffKhnSved54xJe7hEim+G+VufmQR/68YD1W66m?=
 =?us-ascii?Q?fZPUhsVbLx8ftX7n34bZm0CXk6MzFoTlMlQDZPDGbTd7//5PXUig/YReDiMX?=
 =?us-ascii?Q?+iO7tYFPHWZfKcHWGcere0Ip8reztyslGN44pNEm240L2qIzhluycb5DZCuP?=
 =?us-ascii?Q?/DdSaffUj7Iovl/37d3POzdrdE+tGnoeWqarnNeAHtAUbDlCfxL5qRrCWo3W?=
 =?us-ascii?Q?mtd1gIQJRI2l0clHeMy8K3fK2yjG32EU0xIVNHomcAKeKPMeub7gmDvq5gUs?=
 =?us-ascii?Q?J8jEhnvnC7HL3HVPfMXcvhwfTYlnW82DL52He6MDDrvmVUx/PlmUD3iE+UWK?=
 =?us-ascii?Q?xtFD5Ci3I8bSYU9bwR01uMRKpszZA4YJvbdYcSYsNAEK4L5KKSl/Jl8r9DaF?=
 =?us-ascii?Q?tWIVK1FLGlLTwICmmejhLyfKLcfQxk1/dtCByStnsCKnWR/3GUPHYBBs8JiU?=
 =?us-ascii?Q?mV9Qm/uGqmfygI5t4Gj6m9pdmdk9aBnvj2Q4lpmnMm6I4Ou4Tat9MgCUYBUx?=
 =?us-ascii?Q?JUYDrYTGdhsysC+6nsKJNxfA/GiKzcqoDnSzIq8LUqnr1PEO8aTZplrZc0za?=
 =?us-ascii?Q?+aJrTJ0epNGQ33js7XAf/seoOcoZwTrMrzYXTQc7Wi+y2+YQpvRpI5Po2oSG?=
 =?us-ascii?Q?nh+9fyRJ6n2abNUk8YU4YaAvxDEmUnCwXxTGHo8AY23j4DssNaAyacy2dRUt?=
 =?us-ascii?Q?8mi7YfKFoW0XVhhugPhu6Ow0BMoFJJk=3D?=
X-Exchange-RoutingPolicyChecked: Qh2wuUOM/rmHBmMneLqghc/dEea4gIgmIDqMI/q5oHEt8MdPIKSHdFUOUfmd+mgHTJnRrpgTAeLkPf8GXtkpDvUWSCojZWjNWb6qCXlONhZ9SBM8KkTjlU1mbIN7T2WqlSWRRCJu3saQ7EcfXLqUk6kadF7pqLYLt+OMAvmmmO/sz4yLVTy58twe7c7HnObzAMzdH5rJdu9hWi1S3loSCTZJ3boZWUywAy3m6iKc8AcOe9u4MDxSbpmfyNi1bnqwf1JB9gLqf2gPWfTNqaWD2v7zAz86DF6ryXRWgB5TnZjkEjzZNLzWOc9zgiJhwtLfxZF3q4G9RtS3XY/Z1B3RRw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad05349-8528-4251-b847-08df28c46a1d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 00:53:37.3823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dlHGaqA22B9BUvETnZAt1s9pCvoHzX3Qo4g3SeOK6PL14n9275frkNyFbMEKTdaCFnNag1gqm7busruCGB54uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6361
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

On Mon, Oct 12, 2026 at 06:34:01PM +0530, Karthik Poosa wrote:
> Check that READ_THERMAL_CONFIG reports enough thermal entries for the
> platform-specific MCTRL range and PCIe sensor index before reading
> READ_THERMAL_DATA.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushing soon
thanks for the patience

> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 7311f969f574..702c739c9bf0 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -920,6 +920,13 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>  		end = hwmon->temp.count - 1;
>  	}
>  
> +	if (end <= start || end > hwmon->temp.count) {
> +		drm_warn(&hwmon->xe->drm,
> +			 "memory controller range [%d, %d) is invalid for temperature count %d\n",
> +			 start, end, hwmon->temp.count);
> +		return -ENODATA;
> +	}
> +
>  	for (i = start / sizeof(u32); i < DIV_ROUND_UP(end, sizeof(u32)); i++) {
>  		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
>  				    &data, NULL);
> @@ -964,15 +971,24 @@ static int get_pcie_temp(const struct xe_hwmon *hwmon, long *val)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>  	u32 data = 0;
> +	int index;
>  	int ret;
>  
> +	index = xe_hwmon_pcie_temp_index(hwmon);
> +	if (hwmon->temp.count - 1 <  index) {
> +		drm_warn(&hwmon->xe->drm,
> +			 "PCIe temperature end index %d exceeds temperature count %d\n",
> +			 index, hwmon->temp.count);
> +		return -ENODATA;
> +	}
> +
>  	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA,
> -						  xe_hwmon_pcie_temp_index(hwmon) / sizeof(data)),
> +						  index / sizeof(data)),
>  						  &data, NULL);
>  	if (ret)
>  		return ret;
>  
> -	data >>= (xe_hwmon_pcie_temp_index(hwmon) % sizeof(data)) * BITS_PER_BYTE;
> +	data >>= (index % sizeof(data)) * BITS_PER_BYTE;
>  	data = REG_FIELD_GET(TEMP_MASK, data);
>  	if (!mbx_temp_valid(hwmon, data)) {
>  		drm_dbg(&hwmon->xe->drm, "PCIe temperature not available\n");
> -- 
> 2.25.1
> 
