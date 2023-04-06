Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6793C7618D
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 06:22:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AAD310EAEC;
	Thu,  6 Apr 2023 06:22:54 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1188510EAEC
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 06:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680762173; x=1712298173;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oIg+vQNpy/aMmX4CJHL44+b77opPW7ijcUo53sVAlZM=;
 b=LAmE+4apBSphO18hZ6FyROT4hd/CipQJK0sLl911wMhICSsBjdwgyv4U
 0YCWRvthJboGyz6/XaDIczptVPEnp/2n/eAgem9PLiGKZmujvuy28Snij
 NUcY8gEZ9EqR7weq+jftxxaXo2dnUB/lQI0CiVHLm1edyJNfPG4cgSuG6
 ikF0qDTsDkNpGP4zwAcFkeikNX261EC2AIqSuM/YydIdGjUoWE2yCy+0v
 RvQbaMf+ZgnMWpb9dRsTW0DXrH0DHPDuul5OUfNftolQeJRBEkxFjN3UP
 Ygc8kpEWQr8BqYFQqGHLsY1C0vIn1kYzwFe6kKBU57h/oa+Fga8wfQYXQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="326694269"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="326694269"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 23:22:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="756257955"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="756257955"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 05 Apr 2023 23:22:51 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 23:22:51 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 23:22:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 23:22:50 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 23:22:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ihZvSO5pHdtpHSmAcZ7l6QjH3e7LakL1XIhVaaHrwpZSva0sIi5vGSO1dOn6MgHRdrDCQLK6tXMQZdtcTGtfrUOdMfKFOmsIUsN6WkxtYDlDQX6NbBX6EI2dM7YtrA/7Jgn5iI9Hmhy2gzhSBztCiNQ9uzQ47D/FiSxgVVa3S+zJFi0g9KSFdbNDm0DZipSfEihf+4SHk2S3SKJWzcLgUbfAWKqCZOJe7KI/UPlcB4/EBKpnOj4EP1APPD2vRjx7Vh73TTUNB8rdjdE6/9Avzs0G6HHjP+DxfuJ5aUvhb/3q00XFCzICu6Q4+XBDWWeDnXclnhVVFgRCQxrxv3GQAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0v7P9nEMiQSBZcUIF0huJZKPXCrx3C47ufMPEqYFXs0=;
 b=mwt8pT6K/uWRvevzAfJm0ANcQQ9FSlj3u3/sGVLrZlvTxliEkckIcWmY8DnEzH39LkkD5288AQRCdpvP0lSS197+aZBGEDKDatMiPhsaa02LvrCbyBm0rennI50F5qTEcf/NiQQiCE6uKU67e4bZw12iEmNYfwsu/mYag+3keyi/VtECu3MoFOs/RQBKS/PlLTSjIwnNZbOilcT4Fc102Fyb+D75D+psWwH0U2YSsHMP9X7icETODO3Qgq0GjeNuub+c6YWAC8LeIYv+T1cCQFs4hzReUld59UtpcbRFhKr/sJGJgROzCBldQ4xI78q5ZV3MfvJHkxMHxPcZRDYEkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4604.namprd11.prod.outlook.com (2603:10b6:303:2f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Thu, 6 Apr
 2023 06:22:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6254.033; Thu, 6 Apr 2023
 06:22:48 +0000
Date: Thu, 6 Apr 2023 06:22:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZC5lM8z53eezxakJ@DUT025-TGLU.fm.intel.com>
References: <20230405224725.1993719-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230405224725.1993719-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0213.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4604:EE_
X-MS-Office365-Filtering-Correlation-Id: 76c06737-489d-4076-3f4d-08db36675751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fcglXIqbaKCYb8mFkHgJtwGMqaXlg6paojxBj/RZk8/amKWk++/bYqHspHpggABENbL6p5lLDvFGA//xKWgYunuRK0AuRATm4vIQ/INuxDb6Ty82q0ITboJ/UlqKS/9h4Sdbx38HMhlDcC62nFDsS+2k7L68BSSvKKidr5RzgE+luTt1/jqfNPG+wAQHLnlSCCxqMixsuxE/i0taSwQ7dpjK6f9tpRcHFg96Fd+14LAO15hrZ1WTykM8mvIFpmY6klN9v6ki0MknErS/PAtVirRtrBmflFXuWsLYapU3F50EOcQiM/pIH4FWfRfnXDaZvqUIGloNn6AcRkjOhPaRVN2cBFoBbJFuD3IMPHr9JWw1bnwu+5/pn4VPBJKCs/i15QlaBONYDz4xv2a0g08Lhna/+sEtKawbs+ID4eYtwR234NnoSN3YCSHQ+3mGW6eOdcIxmE6/LHgePDiXBZjXIkGBsYTK15T+4WU7BFN4ZJ/6pVd5dR1oO45YniNdWq2d0Qh9c2EmpumQRaGViSBgbkphkWTyIm69wAKcp02SuI5xKW0owFYOp7UEHyPtZXt2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(366004)(396003)(346002)(376002)(451199021)(6512007)(186003)(6506007)(38100700002)(41300700001)(6666004)(26005)(6486002)(66946007)(478600001)(316002)(6636002)(86362001)(44832011)(82960400001)(2906002)(66556008)(66476007)(8676002)(4326008)(5660300002)(6862004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yjYcru82t4qI+EvzFJn3Q/s61NB/qtMTDLyMKgxqQUUpM5Ut9pJFpc4xOtbI?=
 =?us-ascii?Q?u0WLc8QSQ8hrI7yljSk0AGnRttOOWD9nujUvVtOD23zBDS+3xVdXv20lY7s2?=
 =?us-ascii?Q?irzipWqWQUe8K5D0HHDRgSFzFFVLHRTRb8FVjiEhY5Mlx6SEQwtm2CvIkTt8?=
 =?us-ascii?Q?NKXZx/q59u561oA8qbHne192pYpWxiRkhkLT9VLmEgD42ARbMLGoonsCotbm?=
 =?us-ascii?Q?XbZ8+9z/xfoNecpXktvImFr6uvI8UucHO4n3HWsy2IoBxRCk+xiYU55kCeVr?=
 =?us-ascii?Q?y9+ZAlhwFmQ7nLK9dmB1BySdulgIoHJH8R2/iwT5vM56njiSCePs/GaL6pqP?=
 =?us-ascii?Q?cpsY6v/8rzu3HsR/n/HusqX7qfxsMzfE59bAvlf5rFGFQr7w1mf9SPZxcUMt?=
 =?us-ascii?Q?d95BO0NsiZ13wIVYklwuRtXitDtZN/5eO9d/xi8UNdklUynNcs0JXsRudAvy?=
 =?us-ascii?Q?4kYxrtP1zr75v6DeXA7PwylZxRobtw4/+GJYiPu8ab7v/c4Usc4Nc3kjpi1l?=
 =?us-ascii?Q?KPJwl3zItT8GKxFnaZHJbLHRA4/gcjp+40OSQo760/ubJ2SnSFH1f5rCjRUZ?=
 =?us-ascii?Q?b7NoMIKVnbAU8hyBJLwBUkiio/dgY0LOI9ihMF0OKevbP+/RJrPWicjHrjE/?=
 =?us-ascii?Q?hr0xPQidCji6ryWHyT+Dp7ZyJ0MQJaQpwqHFW/jkjS/dYGPC6zXHQrNAkuPD?=
 =?us-ascii?Q?uHAHMOrMct38kb4+XSU2dlcnxRQ2ZJIUfV+m+TwqFOFwnt1oorqpJhdtHbWx?=
 =?us-ascii?Q?7AtVs9AmWmC7XypmpIv4c3WiYN0J7OsrPmX1Gwv/eiVGgXSJkr+rzHaiDqwi?=
 =?us-ascii?Q?E9nzShESa85PMb8eahapk94M6JGiuW2vMRHjXgVCZGboWov6aOxwYl+1lUwR?=
 =?us-ascii?Q?9pbjR0Kk3JZr7don49TpRewY5gYIn4qTR4d5kHzEzHgNJvwXReICYNvtIaOf?=
 =?us-ascii?Q?KFihqq3GOutKQ0s26yohz7Pzg0QBsF8vkc0ijpR3LodH5NlYsIhYcYzNduNW?=
 =?us-ascii?Q?FrF/8n5TGYLj3ofY75mjvkU8tiiJYzaMPV2RrsWFOBH0XKJJk2knIHO6WS44?=
 =?us-ascii?Q?2yrnRQN9woyFD9nTGY/Osxc0vcuRYzIK7E6rI2AlAJszI5SRwBBIr5yQ+lwd?=
 =?us-ascii?Q?qVNJlhPChgXrI8h0I2KL9NDqBGdYnJj47TL7QNV3+h48JnAm8lHCwIygllbL?=
 =?us-ascii?Q?LP8gmGp4zAGT99gXMdos+YBOmENp/9Q0I91SpOMQgXcSElmQcG8lXIrTE1xq?=
 =?us-ascii?Q?emUAH2a0Zl5CxAieeQiP4xy2ggc5+8MPOhRnHTliuRMG3S3N7gXKclLO7J6w?=
 =?us-ascii?Q?W87yJrYlVyMnFzBUHyd1kJ3NaZKQJtTZycGE/GALFuMRcgbbdkuUaC/+gQzg?=
 =?us-ascii?Q?uwIRTa8Yw8twafIdNiC55k0yXtzmYoBzFzFztqMSTIv1kA9bK3DpgmRxPB8n?=
 =?us-ascii?Q?ZPACD3yxT7sihvWPbJTVXltcfhJ/iIMDxz2AyE0O6RFyMPUE83TL2ysb9xpZ?=
 =?us-ascii?Q?p3egtVoOKzkoyEqG00HOyhdlkit8bpQZOc9xrxJYOnLRoRhlKpKq1B4DRCdC?=
 =?us-ascii?Q?7Xa05XBLGWIsg0O7eyBgpo1JgCSEbreA3512IZLFvgro3NXUwNsskbViPOq9?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c06737-489d-4076-3f4d-08db36675751
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 06:22:47.9541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5rx8X2ybTgoOX7I2IbrhI9BOjwo2zw8CkMKreDvK+/7EuJmNTzdEYuD1kle649XabZS4ftukV5eMM8V4Vru10Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4604
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Always log GuC/HuC firmware versions
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 03:47:25PM -0700, Lucas De Marchi wrote:
> When debugging issues related to GuC/HuC, it's important to know what is
> the firmware version being used. The version from the filename can't be
> relied upon, also because it normally only contains the major version
> (except for the ones under experimental support).
> 
> Log the version from the blob after reading the CSS header. Example:
> 
> 	xe 0000:03:00.0: [drm] Using GuC firmware (70.5) from i915/dg2_guc_70.bin
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index cd3cbc8981a2..1590c9822f91 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -395,6 +395,11 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>  	uc_fw->minor_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>  					   css->sw_version);
>  
> +	drm_info(&xe->drm, "Using %s firmware (%u.%u) from %s\n",
> +		 xe_uc_fw_type_repr(uc_fw->type),
> +		 uc_fw->major_ver_found, uc_fw->minor_ver_found,
> +		 uc_fw->path);
> +
>  	err = uc_fw_check_version_requirements(uc_fw);
>  	if (err)
>  		goto fail;
> -- 
> 2.39.0
> 
