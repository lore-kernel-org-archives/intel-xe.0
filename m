Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECE2C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 23:21:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C4410E069;
	Tue, 14 Mar 2023 23:21:52 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E3F10E069
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 23:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678836110; x=1710372110;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Rr5emy55ZxvU0pETCW4EYbn73VibJmMo2SUk9zKy5XU=;
 b=TRr+O7KU8b3uRjKiijV0OxUDebjAyYVFL34KLI1EsXaAHrXBF90X/kzC
 QrYIRJkkg2XDQu87xiOokjH/Q8yR2LTZO1dx7FZh5w5kFvAQ0rDU1iyg8
 iqp0OvJIdo8/Ivq+FXo/vsIIoY+AjFq6mgP0hPILJhvA7F/sUJ2Mqa8Yt
 bRJ5KYKRc2XYAadHfpwp2GCr/iL5cYs4kuLRz1aq0jPOrPt3X93Y9kSo4
 bNN0lweLyrSNUlacH5p0qna2Z38BXTEnTkZkwUbAM8i2YcT0VgGwdtnaY
 j/d+FECHz0oPd0ngWIj2MhmLBHpNhNeT+rTCeC/l0fT+8GIxVJq7CvL+t w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="317960782"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; d="scan'208";a="317960782"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 16:21:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="768288651"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; d="scan'208";a="768288651"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Mar 2023 16:21:50 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 16:21:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 14 Mar 2023 16:21:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 14 Mar 2023 16:21:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Covt9Yb2uFYSkO+FskbwRfx0ZRpgeJmBnqnr1hKu1iOWDCNW1JC51gMEsiwd26481+/QJhnGpjK3KHbUyuw/NpnbsvNTtCrkD4PcHSAFnLsHsevkxdiv/2hANYMBXTd1fVmUAW2My1u3K6HBYmzXsoAv5Lwd6LaqihImZif4zssKkbki840mszdMK+ywmnJeeivQOOGLfAEPezUsibquWUUDSnJk51RXX7HQc7sJN/aqcTK25OirsCGS3knf93rKiWCumVJUcfyS74COMf34dXMJPOV4xEbSGzVjgo5LXAxExbsuRZM7OdYoljPZ9Co42TViN4FT+WqbyRDVqifWvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkurdIMXX8JCk/C9PUKhHRLmGtXBQWzB76I/kD5kDo8=;
 b=KAKfazRuGBP6xrC0KxLpGddAVGY9HUrDY7OQX42Ft7/uMFR5GZOV1QtuAU7qoLvYnqPZDLCb9bx/j/vPfWSSVNqnCDzaEY966fQF1CIoTKzXJBz85zmi1mRYG2EW5rtcWVr6iaKUt8htsyESHaxNRSD1aBHibUsH9BryvAMCk8y6Dq66ovndw5T3h/L76vPXy6cJTvpDQBed4mT0KkQ/+4TVmjb0uNhxuxyI6d/jlFoUSKtLxKipbZ9bXurYSxBdr9usd1Xy7QeRxO6DnOytAYobwFWb23156gSTB/CyoEPXSsZFALuCUvk5SAD2qifnDVjDjXNfJ5/I55DBknge0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SN7PR11MB7465.namprd11.prod.outlook.com (2603:10b6:806:34e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 23:21:47 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%7]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 23:21:47 +0000
Date: Tue, 14 Mar 2023 16:21:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230314232143.GA4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230314003012.2600353-1-lucas.demarchi@intel.com>
 <20230314003012.2600353-13-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230314003012.2600353-13-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR05CA0088.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::29) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SN7PR11MB7465:EE_
X-MS-Office365-Filtering-Correlation-Id: 63ddd3d0-85f8-4516-f879-08db24e2e14a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9aA4EHedpyHY+mV5qgHTj53Nx+Y+i0P++sm435npKMdZ5WMhIDST50vruTC4RAAxkhoj4urYSMKcU/QgSZuKy4Dq2a4PiXsH66CcLUCVehlZrIyZvCsPWB69mQ3Ld/aMWxc9cgAVnXGAJqTNhjiaqwsLiu1eQfXEGollLlKp+hA/YM3ReeQBQ+Svq5qXeZ1Fk2H0eol1NlkGhWdk4VqZKsI9HdqesF39F5aCM/HXu62yQH7JWGZaLQTpbxm6P0kWj6OQg0TNHgHmn2Vlqou6vEIG5bBSPqYxUOum5cIbyPYjwhm56M1PDX9QA9TC7da/q7R50FiwD8lo66OobnrR/ch6PUab3iFVNWRKzZBD9tzHzXHTpFnRtO5WcG8vv5gSJfi5zEFgUjJXzscoV+TO38RBiuNFgInc8kt02ycKJ+DbFFkwAp7c2W2SU9/A2/nvZxuqLHIkZOo589d3KU7kiIdfNXXlnfF0qiVKE+lT5fNJqz+908sPX9zDt/xH7j6RR7w85/F0bSVFZtlrZZTmSFM/aEo+doFwvjlq4h1dLznpTv24buiH0t7TeOo/w555CkxnNbQkgGnykiXHMXPdTq8wj+d+5BwmGnb0LnNlneCIHGaaUh7pQGPUtIQ0PRTkVDqrtWpR3dq1L4EPhBGmpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199018)(2906002)(82960400001)(5660300002)(86362001)(41300700001)(66556008)(8936002)(8676002)(66946007)(6862004)(66476007)(4326008)(38100700002)(316002)(6636002)(186003)(33656002)(6512007)(478600001)(26005)(6486002)(6666004)(1076003)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ypKeByOyHL4xF8FaCIYkrA+zdzLhz42dKybtThr4iKH4Hs43y7jg3P/qZLOy?=
 =?us-ascii?Q?ihXDASlDSH7Pbo09f8xucHu0mjteI7NahfQU13BsnmxfRsXQNYM/t/5SmMgM?=
 =?us-ascii?Q?iCYV5CuyRPBp1LhhkCV2WE1nxNCegMsTLyEpuXok7D/9xjUS7Z+8ouW+ySgB?=
 =?us-ascii?Q?Ze03fUm9O1ULLLGOZcLbcQ8EsnsB6STgUTPkIYE8Pii4Ys1aKErN50fT/Qph?=
 =?us-ascii?Q?qw+qmzpFuR5oj6sGchUT3qtXGKw6rSd2jNHSqMzliNzdtqoZjsBMN+w9VPBf?=
 =?us-ascii?Q?VqKrgdKUdzXFCdmGBFfDTCsayY/PkfMn3IlNRaFdjfDZBKzOKdIkc1nPw8Bw?=
 =?us-ascii?Q?l7axnbXZbyIZHpux6P3TafvfFrG/TesCF9/pYxFIRLRLjakurIqcSmr9IZ/u?=
 =?us-ascii?Q?yiB7PjsZdOJ4ydCtiGCdvC3NdejFg/mGi67txJ2lknFqHQ+vD8OKgICQfV+0?=
 =?us-ascii?Q?nBxwqdiaDF/Jz0v7r674BkE57VmdBfNHrfoZe9gw1gaCdef1dNRvrrmLJqIh?=
 =?us-ascii?Q?4Q7wTIDDv2wjL0SE2vHcltBLDoaepqrnoe5Uxpuxp4vqBARqRHCqk2okVVRr?=
 =?us-ascii?Q?QkJRRfd+d1iqLStfGNuP4CqUyf7KJRe8u4XfYoDpobSUGAHQui2XRsgIjORz?=
 =?us-ascii?Q?7api6tW2j/ZUoVN5oVSz6lcHP5UpoVYJxdCinMnJHe+jq9uK802qg1hZtZzA?=
 =?us-ascii?Q?BQ0fP25CpN1C9yWaFvqzn3j/+JP1MxkhwnRT9NwLGd1wVgpEhzYf4Et7kGnK?=
 =?us-ascii?Q?LOEli4/x7F8cEz5KZve7l65VFrsogp2Kw09/oCmu5Xy7bAHwgDwTfxTEhz8Y?=
 =?us-ascii?Q?HNdW8JhCTjrCfqJFZdHQalVFYuHjBVertf1mby1RCpXvojvKeDhuFsM3aDaB?=
 =?us-ascii?Q?wwv9LAXcJmlqKvplkRiM53e47dxd1qVvjfU1PWJl5cv9X4etzQOVzKN+oQgL?=
 =?us-ascii?Q?FmqWAodNv+jLJppYy8OBrGoR5TXO1/1br3+hD52SYYG5ssk7JecM+b9bSyCF?=
 =?us-ascii?Q?XsY0D1XOYhY/OmW0nMiSIORK4kuc9aLT8Y5xvRXPXXmonAQA/L9X0QSAgUKg?=
 =?us-ascii?Q?w9OE+5PBIZimyYZkzrUIRi2c1yILKV3yQTYLq2c5yARSUF62YqboV2fjvtgN?=
 =?us-ascii?Q?83HmANK9uWgV7vgYM4lKKqTq6LLx3cINU57n/4hPl9ZtLGtmb0KbD/vkIBm7?=
 =?us-ascii?Q?/E62XSP24TF0cGM14/KuTKsL21yyOFk1vUf1R/orRENMFzpFwZcq2Nc2Tn0D?=
 =?us-ascii?Q?3ie4gLMM6nHwAiaMb5/9o/sHoi/nkZ4jeUNqEW3xB9vOE1yYy4VXRR2kYxLi?=
 =?us-ascii?Q?ihRQPrZ/h6gd3mAZz/7Ymd2yzhU5puu07O/WUFlOLdUUYQQCSz1YTW9Ctuke?=
 =?us-ascii?Q?7/Xuo3l619dtDpP0DarcrCvaTT5ZEIdzbVoIeeh6Nrgmm4JUZhg6nqrIDWBn?=
 =?us-ascii?Q?1bp0ZaICIQ5+8tCwXrSx+2DvTVX2jrveekDQXI/bQDET6opc6LsRaoPUrF2I?=
 =?us-ascii?Q?5Rn+jbDShveMFsJ8HrDL8YENjc+1FDFrJizK5x072mCQie2ByhCSy1mxwbjg?=
 =?us-ascii?Q?P4w9By0hJV1C44rHKSCNuNeQDsGOYJ+gW0ddTCuo4BEUCItwlfmJ/VBgIfEg?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ddd3d0-85f8-4516-f879-08db24e2e14a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 23:21:46.6396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xMSA6Yq393qIC1PPbXua6XD9PW2TTp6cGHiSpimQrenw42FIptsJH5kbqwsXoBRaHbVNiOiyc54tLIUerYvEPzFcrhXlOHAdTG7UK6XHP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7465
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 12/14] drm/xe: Add missing ADL-P engine
 workaround
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

On Mon, Mar 13, 2023 at 05:30:10PM -0700, Lucas De Marchi wrote:
> Add the one missing workaround for ADL-P when comparing to i915 up to
> commit 7cdae9e9ee5e ("drm/i915: Move DG2 tuning to the right function").
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wa.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 0621706f46e6..e21c7ec53b2f 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -299,6 +299,16 @@ static const struct xe_rtp_entry engine_was[] = {
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
>  
> +	/* ADL-P */
> +
> +	{ XE_RTP_NAME("1607297627, 1607030317, 1607186500"),
> +	  XE_RTP_RULES(PLATFORM(ALDERLAKE_P), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(RENDER_RING_BASE),
> +			     GEN12_WAIT_FOR_EVENT_POWER_DOWN_DISABLE |
> +			     GEN8_RC_SEMA_IDLE_MSG_DISABLE,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +
>  	/* DG2 */
>  
>  	{ XE_RTP_NAME("22013037850"),
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
