Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B554C25B10
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 22:55:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB56F10F0D2;
	Mon,  6 May 2024 22:55:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rh/tKgse";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5034110F0D2
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 22:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715036101; x=1746572101;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+QWt25G21EfNgVMe88vYslfBdwzQ5J0yfcR+tEOm5pk=;
 b=Rh/tKgse6SbI18aFmyeh0Cv9zDu8oRxvMn/Ee3GUA31rcSH+fX3a2hkY
 b+65UxWm1m2HHyANVVJBR1zdveQ2sgsXdCSXGdgCcVZFgQeYKl6GwSG8a
 QfkTmWPEdMCEHkegKVneat/5LJGDrwOLbfYkc+6Fm6bkvm+BWGSVbCYfT
 DeFAUkUHWuPsdvl3e6dDivIQ8+bj31OutGGazPwwvWqj3k7g60/nsbfnP
 1dP5i8YN9sVJHK9O1M97AdwH1he4cDgPDVOvcQG/NrUfK6Dx55TEuLUE6
 QTolYbzBm0dGE7H2vg/YJZrHDPGIU5i/BKYOzELSkglIBzdzT04G2ExKe w==;
X-CSE-ConnectionGUID: pReJQu1cT2SoL+xlS9VbAA==
X-CSE-MsgGUID: AweNmqqDSxetlxW4upAO+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10687775"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="10687775"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 15:55:01 -0700
X-CSE-ConnectionGUID: Q7aS++7AQzW4BETPI39ckQ==
X-CSE-MsgGUID: zIU7TO11RE2avO4tHkxGIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="28196846"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 May 2024 15:55:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 15:55:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 15:55:00 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 15:54:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYBfkduLN2P/QuvJNidcUl6qVUDCI/y+Ro5nZJDN22QPOJw7u5IihP0/NokLkp3ebs6nyBCeDNQFIzsfvTTop6wudA/gorRP/l1s7CJxa0+zuKQYc+F4zlqmABK4Tocd6CIowpDVNPXHN7tTufkaej0wWkRNO1RpfUKnwk4xSaw8ihL6JGanX+ZapADpUsYIJ0W+7YxKMP7xefHJJTjCUoUGw4Cv6oMwzJrYPtmYRYc820IxUJLR5KT1BnMhTn+N2/nSh06SCUYMNvvhMRrGWAmEwF2OSdeL9KeEBXvwOZoeO5WNyrkNqDvONDQKsolxnj2TZlSFlyj/+uTjQn6O6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAnjuZ9Bh3VDa1TIkiCWJdvZoUz9VzrVV/ClkfQaK2M=;
 b=oNwWxeVwNPWVqXPwnSc8WGpEiquya3gwGBfsRWcHulx8/XSknKFmO87RqvaepsXSmwkmd4ncFxtGFfACGBXcP84yOrW9ThyxRGofqZAQ7lnU0X1kEFeVALBwuIrQ9qe91gpfTYJnUpUm3IpMZTKRB74avZa36eihnQqLSl4lZcQPpRkomi3v2nO8v+UTDMelPrM687OSUVWCFRGwaBSfzNXiXfZ/goXcrfQJxjcn3wLJuLvW6LOHHG3gri4cRBdRrGwFOe2S8Ezu+NkdUzTXc+nw6fRXKeqs5GPiuhgneKRZNw3mErEjgVusTCrDKh8Xyn0SjFIm0u7mY7FPTXSv2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7214.namprd11.prod.outlook.com (2603:10b6:8:139::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Mon, 6 May
 2024 22:54:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 22:54:57 +0000
Date: Mon, 6 May 2024 22:54:46 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, kernel test robot <lkp@intel.com>,
 "Julia Lawall" <julia.lawall@inria.fr>
Subject: Re: [PATCH] drm/xe/ads: Use flexible-array
Message-ID: <ZjlftiglCRrgqArD@DUT025-TGLU.fm.intel.com>
References: <20240506141917.205714-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240506141917.205714-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0215.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: 4adedebd-822d-4283-ca4c-08dc6e1f8d5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2Kprr+yguq6yuRapa5kG2/thK6HtS+ZTwSjDbpYASxoZGxREIMQVFiXwvgbL?=
 =?us-ascii?Q?ZzRVvO2ISYmUDBiC9WIvQvFI7FOH+4Xq0djdGkmwQ2k1fYmH/XJirpy+asDl?=
 =?us-ascii?Q?JluHUNDR4WQf5Q8Ezb8H23frVHOaU5Sfx8YUgo6lRGDW42aP17I9eXNvbr3u?=
 =?us-ascii?Q?D4iwnOnyevvLNq+UW6mGvIqe+iiGVLc/l66yMyCxkMJoLwY8n/wp6a3dj8C/?=
 =?us-ascii?Q?Mfb7gnvbRd5c9RJTqVUp2ZEBs0NXr60r0X9tBz7VN1O+H0kuafXL3oH4rZfK?=
 =?us-ascii?Q?qQchFw6L1UYjzksdMCHe7mrDzNUYZmMVhc01mnqeves1/Ajsl8CbXgDUO55C?=
 =?us-ascii?Q?sOH+pQHPgTQbMo6ejdsKZ9ib2KLTFT/CGQhpvkf0hhJLKHqJ0WFrovC7S/fS?=
 =?us-ascii?Q?ecQPexA7L5mLz3lvSqy/oy/uALhiEpy0sA/L+r9nufq74pogzWYD8jaiVHHU?=
 =?us-ascii?Q?el/wcAbC1g9WPZt9hZN812TVUBhQkxZT1sp9ZOuHxQdI+iseD7LAdcHP0ufI?=
 =?us-ascii?Q?Tr+rYoUcOEe1w/WbrWna0s0NDUK6xv/b7EIFInjyF+0S0UdLX26SpeF9jEzU?=
 =?us-ascii?Q?MMaCwbiPmOf8Fj0baRfS9Lyg98iA+NDGtsZVRDLlOWvNEvskUo+B+VctfNV8?=
 =?us-ascii?Q?9T6gntrn6d2glB+pKHHvf3yE15mzfVM037Aeu6xMK+nbJAnDX0d1iiwoKl8V?=
 =?us-ascii?Q?kqV6uk7p+rmAVqif7ouBiSHOR/FczqxAAIEVLlr8aI1SPgKgqQZLOeil59Jc?=
 =?us-ascii?Q?nIPD+Kr2LDHBPWRZ7eRVNoM7xH/U3WOjSSdLpDPc2/+N89QJBzt02eNUeQCd?=
 =?us-ascii?Q?KMlJFnBad6RnhlzhAPv8kKCCxPkfFwEqdYTum/p3ikvI6KeucnXeV530klab?=
 =?us-ascii?Q?L+Dwo9TOfLQCLLYVcywF68iLLN3kQU9j9+dGc5zPbReb9OIqK/RXbVPI0ojz?=
 =?us-ascii?Q?aWGtA8yqKXIDKF5No9CZdh825I9KCAYpjzIwBOcvwi7l0gQXMl322Of9tuVT?=
 =?us-ascii?Q?9hpGRaH1sh0vSThAXojef8+YkbPdQo5LvttmfOG6I7AkR1kbgxKZwE7C4dB9?=
 =?us-ascii?Q?U1d1kRIPlkWhrtfLCcwmSRJPyGVsA/Zgy1mqJmBmTdWauIthZQc1hvWXapMv?=
 =?us-ascii?Q?XVDR1ugIgsC4gAs3SK57IgcoODz7Z8XCI4oFkqQ9G8Wihv1rtepW2kOXnO8v?=
 =?us-ascii?Q?IjsYJd5by+xixU2geLCnaKWtJUbkawbf4JwTGCqGkSVCFIKpYaDmVbUPBPE?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nL++LnWKu09Z55cug+9uVj556vqRk/6YhbnSqyhxKP7X5Wbw0FbalKUlDy73?=
 =?us-ascii?Q?iLfEnedDwSn7NvFynvGpS96ijTAnnQBGIdvQ+e4P4MxhWLYlPZ3sF4bGg082?=
 =?us-ascii?Q?bxD1UGldsITCqlOiuiLqxx5PNLqJ/voeQsYZgMiodU/+5VpHRXG85sItSr/X?=
 =?us-ascii?Q?pdvAm60R1+egzWewqNTfB7msbL40l81L8F2VhJHCxAbslyGANdZ0d4f8yOGv?=
 =?us-ascii?Q?rbl03dOS2V4w7xOAiTsQ+uVsDP2Ny8NZxXBZTogW+LDE4uLM1jkLZsDdLEKf?=
 =?us-ascii?Q?PDrNXqrb4kzTvRYq3h2aTlXrts8Vg1rPPbjaAuSf9GyFAiDrHDwcrxS2Kvko?=
 =?us-ascii?Q?UYokhKb44I7VrDDpX+vRiP9tLfkH+V1yDuEV5XCitiqv6acm41o7ID1F81S6?=
 =?us-ascii?Q?GN3EJbL5zBgn/yneNcuEoQV2tGAiHRtL3bqS7Z8XJMJ3hm9YubmU5YBGmh67?=
 =?us-ascii?Q?Z8jjnPDS3Di/Nei3pYvefDNUC2Z+Des6yMluAZbNiXK+NaMiE5FAnp1EsrIB?=
 =?us-ascii?Q?TsU/5sz0HQAVvBrw7axOIya4dKE8bxdXTgKMSRprUDljumW9IvpkiLB6/oQG?=
 =?us-ascii?Q?J/oHww604o82ZUHKqN/MgV+jMx1houdo4oi3V0JqNlMr9k/fccUZi+11F0H/?=
 =?us-ascii?Q?xs+PCQlkJe2uQRfhKp6gSpZ4PbvNJ5SZ2N81lAznwpPY+XW7agRzENsV2PUU?=
 =?us-ascii?Q?1d0Un3lIqlYXL23mdjHwbaZFmE4pOpvpeLryQCfln4Ra/0fKrNp54e97bO5g?=
 =?us-ascii?Q?AP9LYOjX4zkEXEv65er6SnLklz494mZ1v8nzCzYPfcq7/ER0jynrteh+moqs?=
 =?us-ascii?Q?yVCnIbXv9h/7qYI6GixWiIrTzqzxc7K4EwaoEac+ztpqmAQoJvdYq6ivN7Ua?=
 =?us-ascii?Q?ZEPEOjs1z4Un5WG4jaAu5l4lBzBIM86Hzg5kHETIifgyv5ejaiifKegDLvBA?=
 =?us-ascii?Q?gDX4zBg15DDHjpexHOBFs2mUsy2w+7SObwMnBImJTh8vQ0G1AdEPiAW3TdOg?=
 =?us-ascii?Q?nguZi8ZY458q423Wvo5Fy2egBNPCJj1l4TPokV5jbDmNdDUweHoLwbxrgbxo?=
 =?us-ascii?Q?iMGzMUFBQ/YXDoLgDKqd763bg2hNqrvaMeeuBj/P7cK0jpGRzScseMfbCPNE?=
 =?us-ascii?Q?tdu+YYJp5hbQ9TsJ8hC7bnL5XfNR7st9w/tH80Il8ohNWdVPh06dFFqVZub1?=
 =?us-ascii?Q?xIceNzbur4s7PAQsvjzZBn0ROvPFENnkY5rzj3z0evSfOjRoV9NKgC/yd0t0?=
 =?us-ascii?Q?hd9355VMfYWso1pYMG31wGXG2UxrZLaBt7nLzT4IfRv1CdutRPsAjxvGpVmM?=
 =?us-ascii?Q?ZjtQ+ZRD+4CQ43wyHjIhBiPjWIylfDb+XzgS0fObRpxBE1F1L2fF4tJs0DpK?=
 =?us-ascii?Q?CSp6GNjysq2r4w0Ox0zZrPCN0aBJjG7iNOFwk3H9LFG9zTkqlqF4nNpfp4WZ?=
 =?us-ascii?Q?3z82T3DoH4xxDMx8SaQbrWdX+2I++z/9gQ33xuy2rSctVkdctnw0li1AlVW8?=
 =?us-ascii?Q?RNlhnVCPdnPbCGuejZXjPaBEsjmHDTQqSvEQUvTREmjLekUMBrvo9J3dyORa?=
 =?us-ascii?Q?pbZHLuvp9PSYA18pk6gCVT6JjLrq6p+2CLAsVQXxansg4Wb2Xw2sHsGUyD1V?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4adedebd-822d-4283-ca4c-08dc6e1f8d5f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 22:54:57.6179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OP2Uhi0tKQ+YfZV8ADETHxEQ2AS4Ak2aWurEezx1M7oEFSAyTKcGDeATy1pO4aGFrPUKkSWN/A6kAtzpoChYtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7214
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

On Mon, May 06, 2024 at 07:19:17AM -0700, Lucas De Marchi wrote:
> Zero-length arrays are deprecated and flexible arrays should be used
> instead: https://www.kernel.org/doc/html/v6.9-rc7/process/deprecated.html#zero-length-and-one-element-arrays
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Closes: https://lore.kernel.org/r/202405051824.AmjAI5Pg-lkp@intel.com/
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ads.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 6a5eb21748b1..b48639cfe955 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -109,7 +109,7 @@ struct __guc_ads_blob {
>  	struct guc_engine_usage engine_usage;
>  	struct guc_um_init_params um_init_params;
>  	/* From here on, location is dynamic! Refer to above diagram. */
> -	struct guc_mmio_reg regset[0];
> +	struct guc_mmio_reg regset[];
>  } __packed;
>  
>  #define ads_blob_read(ads_, field_) \
> -- 
> 2.43.0
> 
