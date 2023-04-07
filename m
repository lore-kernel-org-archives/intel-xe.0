Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDB5C6FD1D
	for <intel-xe@archiver.kernel.org>; Fri,  7 Apr 2023 18:10:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B5210ED43;
	Fri,  7 Apr 2023 18:10:20 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5C910ED43
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Apr 2023 18:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680891018; x=1712427018;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dpN0B4vPkEhMfpDVs5ZBplfYfpVW9KvEOx5deUo2MmA=;
 b=MESd78LuwV9ksFW5VoLTrQyx23PkyXy0h5ImEhUHhAI+Epf9MdBeI/sK
 4A5Icsa3AXF/lSsWsOTN+9HX3Gkgj7RQyp5lNWZ2GI4DSGGvRYjEZXrAN
 tp7C7mw3PjguK4Jizoqru9YXdtUXF4X87vIvwIT95V9/xqtFqoh5itG1D
 AeZjjfh572aHTELb/yhPWYWgUNxyEQrdWn/gzFjRgc2hyjnJHxMlwg/7e
 YIWGUQ4ODT6D6WaO/QQueJDokiMHema4xBWD92TSWkHjV1BDdQVxh30yy
 AbUCnsQrkLPP74nXr4xEDVYvXFvB59niFXBm0Y8HIVOyEpaj8yOl/Tzlz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="370877243"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; d="scan'208";a="370877243"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2023 11:10:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="637786360"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; d="scan'208";a="637786360"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 07 Apr 2023 11:10:16 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 7 Apr 2023 11:10:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 7 Apr 2023 11:10:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 7 Apr 2023 11:10:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgaEtNZ46VoQTEoBHH6Z2ZoKwtyZvK4oCkkUhRtvoEhTFl4e09i1D4nNUHYzvlh8bte/NnikF58+o/sBbLTmBwi13D1HhaNMVAQO/i9oucgRY6QyZZ8ZvkmmSmihX9QIDrvvHTx0g2vxXxFWdx94vvuYhskbCsQjJ298maKtYMcGDOrst5JP3pCoiViuxor6gm9puw65wN9PR1N2zEGa0QkojgiVuF+xzDyCOedVrzyWxWVlGiYoKAkTrM7Esa6GFHlYaZ2QZ/2uIWcNphiJQ0xObjTuW7NLMJJOvyPzzqsjq7Pyo1AZThd2vSQbQApcbjR5p0YAt/XDws3JfFwDFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhNXpy2Iji5hW7Sd+eR5NDdUhV+dWbx0iGBQTVe/yPI=;
 b=Mzlu/5V/GqoJtMYl0EAXhBSnIcZASTSxXN0zsQCahq/rUtUg1megeESI8aKNS/3jaMrYuCemSKYJ9tREJFw2cUrDP3X5AAt283DKBUuHxtclHNQp0Xw/0SfVqGagYwDHXYLUKYuOPomHdmfXNPA3GhoSIsesrr86rsp9jlL/mQ6/pAPi7S4roLuS1wHIez6B5nMuox64I4E5rItQ7T2+8GsPGQTcAnft6mLscl5UpzMhDRtis36V7LIliB+3DoW+/wbU/dhKwqgx9r2MMr7bVlWpddu7EZRf/QK0MoEUhHvdhSFD1wvuApiR7jpcvrDX7nWCl7KjLk/Ic5I2JawZVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH0PR11MB5830.namprd11.prod.outlook.com (2603:10b6:510:129::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Fri, 7 Apr
 2023 18:10:12 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6277.033; Fri, 7 Apr 2023
 18:10:11 +0000
Date: Fri, 7 Apr 2023 11:10:08 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <20230407181008.GR4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230406175812.2294116-1-anusha.srivatsa@intel.com>
 <20230406175812.2294116-2-anusha.srivatsa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230406175812.2294116-2-anusha.srivatsa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0074.namprd05.prod.outlook.com
 (2603:10b6:a03:332::19) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH0PR11MB5830:EE_
X-MS-Office365-Filtering-Correlation-Id: cbd4045f-8926-49c5-c974-08db37935438
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z1jDqKMwIyJdY0n0lV7RuuCY44E0RghEYBOsIx8+2vxEBzgJfYwfsjGFvWM3qSJeSHZwno9HSNEv51jN15Sm85ECYxEEzLe6hFWQ2pxcihbwKqgAzl+gDFzVvLdOEbsgsYkNXjm4Nt5xtrNZ4EXcDsfhIYTwb7jlGhrbNxv6DCG5bmTLsCDL/QzNTeCDRQ/4XoP1QH6aQM+VjL03DtQMbqXRsi1U9KI0YKwqkmYQHOLboKzkrWHa4FKXlVlFCVhPPiO8BrTqOwjEHy67FDYvml/Riot1jVYgXB0PQYcJy233LvNULkXkGKTQuOSNR2c4avJcIeUUYiTUYYU4ib2QURE9UBJ0OvmcNL18A091AtjkSpY4gPnAfYil3yp3qcx2qhsv3l81BOhDPgIkp1RBo9ukCGA+tkkqKNCzJ0tZ6dPKM2GQBSu3YyfkjT2mopQInyxX8mw5cep5NqjDk92dub5rJCH7akrjkJFpvcEqkGO0Lgxl5yNPVkAVsr8N6dumlbu887VBCNEgXSqS4vEpIAq0J/ben8u4GL38nDurhmMhYoiAfrJOexNAD79vgsSv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(136003)(396003)(39860400002)(346002)(451199021)(66899021)(316002)(38100700002)(33656002)(5660300002)(2906002)(4326008)(66476007)(8936002)(8676002)(86362001)(82960400001)(66556008)(41300700001)(66946007)(6862004)(6636002)(107886003)(6486002)(6666004)(186003)(6512007)(1076003)(6506007)(26005)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3hkDHFHYUti6HyZU/TdzVVM6axVCaZw7fzsGDrpVi725js/geYqaSkExdaSs?=
 =?us-ascii?Q?GQnuUJzD1Ogo3BBxHzVh1cIZhVg8CW8G6pAhmkL33LKkplvbJZrIuzYiPsp7?=
 =?us-ascii?Q?k94pE9fdWwqbCxiG5+BVl3iT+BlTdyOoz8R+zWdV4HyAM83cwWbk3b/HiG/j?=
 =?us-ascii?Q?UJiACIo8PO9fZyZyqeYG7AaNz0j/6I1IZDTGRLAsWbbV1+PCsQqJLPO9MpOF?=
 =?us-ascii?Q?axWIV15/PYpUoiBn4Np60n+m41VqD7xbWOUEW4hgo1RmIuuTq9qnnhqXcoAY?=
 =?us-ascii?Q?KjCrg30Rj6EsR6WLrJretIU0JnqVEtYbH9LQj8O8dcbT4CRskIs2REwQeqd9?=
 =?us-ascii?Q?DU8bPuL7JV+qG3p6fNy74Iodmzv4BCwRqaOMdUHD3sHSNZj3HFA77GHLAhI6?=
 =?us-ascii?Q?gwDgCzB2VvD3UESOY7swQPJrAoQSNsD4JFDpzWDmUt4bthBMIVApy2OpLqKL?=
 =?us-ascii?Q?4LXVKjfDN2HMexYv2njhAVePP5gMbHIYhXZGpxYYRofvadTa9+s/dHKU/+tE?=
 =?us-ascii?Q?ZupOhvNSmuGaBp7/UYV3Y5Ja8scMdo+RCmRMITbxeHeDeLu1Ea9ofk1KvPNg?=
 =?us-ascii?Q?JlqDPi3LPA+h0PIrhaAFbZnsXFkNx7wZYMosy/WwukVxngqUyWWNQ3XnXv0E?=
 =?us-ascii?Q?udbG9raIcLmXgrqA0U/yazyZBTaBu4F1WGB9CxnhvH5s5I05QbqvG3q0eqZo?=
 =?us-ascii?Q?3Zcfdq9+m5HO9LyHa9zBRyqmYNAStynozI7hzGY9V5dXPpvs1voCO+nEvDp9?=
 =?us-ascii?Q?Gru64xsmrEaeYyAGaPFsY1SQ27omKtg1ES2IVtwMHm5g7Eosn7ZmZkm1iAAe?=
 =?us-ascii?Q?V+U8TyrvGVbRQ/sIsvCFXMLcnuB6/CbZ9uuruUqUbnUysD/pUue4XGyM9BfS?=
 =?us-ascii?Q?ASn3VIjbwpn/J3NYx2PKhVIjZftbx+CCazDwPFH/Pr/hde+2nqKbE2gJ+JHP?=
 =?us-ascii?Q?jyFOGEmzbaNfenjwzZifVFfmICtqN57l6cU0VdMbz9ehoO3OPqebEQGa9oF4?=
 =?us-ascii?Q?vtBYcl72tm2Vu0faOPmvVlxfdPLnyorwdctc7juzs1BhTiH3wpR8NZC+4aBs?=
 =?us-ascii?Q?rxJi4ZaSKHofSfW6ZvAk8jZOixa9IyR8GTCDoBDNmVT12imRDsLvorH34EoP?=
 =?us-ascii?Q?2dAvpRziKyZ6qeDyyebKBTEvfcfI0VpJJr+Bj9HrSil7Pz+L8DB2MZzCo5ac?=
 =?us-ascii?Q?pcWscR33586ipEEwQLfDkHCZ5m8WUXbtmucPY45ti63u2JSmIaEvsvpiWw5r?=
 =?us-ascii?Q?wXlruXyWrVbbtAAveEeRnaec64oo8JSUiJ48WHdMzijWY+GWrdeWhWq2+m+F?=
 =?us-ascii?Q?ffqcLtEnrAllFczXGObI++F40psPhgDbpeLFRXu4LDEoMYuUWEJVm7WnghRf?=
 =?us-ascii?Q?+ZEqM5Fiii99iwyMgXjH1O5fEPlSC39IG7I3EWWNpj2rtVHI65qHO2hO0cmr?=
 =?us-ascii?Q?M7GFArr3es/UeSjZxrvd4qe0LS/g7njCSTXWF8hjpNG5VORQNhSFsZCoG6In?=
 =?us-ascii?Q?89ZIGV6SftI1leev9owiq/A6huI+HIOjq5eV+pP5rEoEMSIlk37AcBpyJhoM?=
 =?us-ascii?Q?cH6p3sA0ecpPNS+TaZSeU85Z07365wcYlzCDdiwNEcOqtGHAPirTmsf59oVb?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd4045f-8926-49c5-c974-08db37935438
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2023 18:10:11.7265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MSfrazTdH6UdSFVuI9eDY2XbZ5v+MeSn67hY5q8VooCR/RSqyy8yYBSwQdlSUrQxTz/K/KOfy4A6ozs1DjBck57ZmceZJKVgxk8H8nux0ds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5830
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Add Rocketlake device info
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Apr 06, 2023 at 10:58:12AM -0700, Anusha Srivatsa wrote:
> Add missing device info for Rocketlake.
> 
> v2: Also add abox_mask to the device info(lucas)
> 
> Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_display.c | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_pci.c     |  9 +++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> index 5fab5b9fbde0..44697c0f7fb5 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -488,6 +488,17 @@ void xe_display_info_init(struct xe_device *xe)
>  	case XE_DG1:
>  		xe->info.display = (struct xe_device_display_info) { GEN12_DISPLAY };
>  		break;
> +	case XE_ROCKETLAKE:
> +		xe->info.display = (struct xe_device_display_info) {
> +			GEN12_DISPLAY,
> +			.abox_mask = BIT(0),
> +			.has_hti = 1,
> +			.has_psr_hw_tracking = 0,
> +			.cpu_transcoder_mask =
> +				BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
> +				BIT(TRANSCODER_C),
> +		};
> +		break;
>  	case XE_ALDERLAKE_S:
>  		xe->info.display = (struct xe_device_display_info) {
>  			GEN12_DISPLAY,
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 20be113544fa..9fcaf2255a28 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -103,6 +103,14 @@ static const struct xe_device_desc tgl_desc = {
>  		BIT(XE_HW_ENGINE_VCS2),
>  };
>  
> +static const struct xe_device_desc rkl_desc = {
> +	GEN12_FEATURES,
> +	PLATFORM(XE_ROCKETLAKE),
> +	.platform_engine_mask =
> +		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
> +		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VCS0),
> +};
> +

It doesn't look like you've pushed this patch yet.  This is going to
need a rebase now to deal with some other restructuring that just
landed.


Matt

>  static const struct xe_device_desc adl_s_desc = {
>  	GEN12_FEATURES,
>  	PLATFORM(XE_ALDERLAKE_S),
> @@ -286,6 +294,7 @@ __diag_pop();
>   */
>  static const struct pci_device_id pciidlist[] = {
>  	XE_TGL_IDS(INTEL_VGA_DEVICE, &tgl_desc),
> +	XE_RKL_IDS(INTEL_VGA_DEVICE, &rkl_desc),
>  	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
>  	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
>  	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
