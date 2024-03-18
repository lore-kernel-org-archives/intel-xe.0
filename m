Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA04DC54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 22:03:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7011010E30F;
	Mon, 18 Mar 2024 22:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jhkKEHda";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137D610E30F
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 22:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710799393; x=1742335393;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xigflb09IzwQCvrW6q+4HXYjC7w02eoHfhB3d/HaVtM=;
 b=jhkKEHdaB9CDiebwqMlc93atwmqZLaa55BM4u6r+HT2y429SuW+YhU+8
 XulxLq48dieSkl0sK2UvxLH5tsHfOvWagfRsV5j1LWR57dnNwrJhREK0q
 nMv2Qm8nXUC0JIa2aWCfPTooc5OhAXwImbo+s7jiqC8rEYuow+jsvnGeB
 aAKBPJ2ij0BFBi63gdSH6l8ysjNn5l6GeyrGOccMHergLnRnW6VdNzsTN
 oJrxZzEZAwF7Ln42qzFRJfGHr75WwcNms41WU/d/1Dff/OGQp7BkawJxG
 iLVbC4dyHaXh4BZWkNzxdFE+RFulgKzgPdlMcV7fCG8l5mMRiz4N6upyn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5518467"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="5518467"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 15:03:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="18292678"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 15:03:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 15:03:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 15:03:12 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 15:03:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQ6Ndaj4zG5y/6DmqBonFlVNbPjn48058Tmf3pZpbNqF4IeRCq2tbVDCQU9ZXCDar78ZrNZ2E+B1mT5LJuIZBmzYnH+UdOYw3HxHjNjEYHgnhlcSAdrBpqmVoa7yinloumzl+TBLNozD2EWBgFU67TRFKpSejYM5L1VKYLX/2mF/OztHk+jrL8apPo3Olu+iUSx4LwTFNCRMr+qXeFTi3NIe6agYy3JFDfgc9n5yz3jzEIZfV9ySEfC+Xlc8gdujIzhSAaTxF0z6dzS+3TUcoEoT2q/eO+nKm2OhJZkIGV9vXxH9gt9fUAAE0HflUbsPPEX1CRTk4aZ+W9Vj9hShFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMae0EbyuvNNJIyByEkdUR3oDdycb+XZp4hKMWD/aTc=;
 b=TArcjk/197M9TJc4ZyhfeY5hU7sk7ZWubXAd8DhN6Twpuw2NZrzII2C3mWwr/2SNTnaTyXFGZHOC/ruTnN8L++yIpH2U+h+KLSx91VOhGutiR1rSst95uMIFbrkeS/pGnKqv1NwU8Hy1LetvEHecSUiBPNVwof/uqh5EHqQGtLEI84O6ZQNWsOASCz7RD2j1iV0Y+FfxJwD2FgqVHaSDKhnSL3C+qOGHq/Dqp3VYR86AO6VhQsC9fujk+k/TdwVy4TeiszEhUn2tfFeMo1TEyyCaeD7PzFWQTGFV4qsf1bL70yX9XHs8Lyn7A8IYf0CQFUGbgPR9lPm1ZOwX/q7eWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB7090.namprd11.prod.outlook.com (2603:10b6:806:299::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.10; Mon, 18 Mar
 2024 22:03:10 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 22:03:10 +0000
Date: Mon, 18 Mar 2024 15:03:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/xelpg: Add Wa_14020495402
Message-ID: <20240318220307.GM2837363@mdroper-desk1.amr.corp.intel.com>
References: <20240318210120.564692-1-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240318210120.564692-1-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: BYAPR06CA0047.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::24) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB7090:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oeMtYWQXDf9Ukautt86QmFxS852f8J42sVU/+wDc+Jbs08QarGQTfOu8iEMIc1cy/tyJjX0VqUMw9xMAF/o+EEp0a+nweVR0UFc20I7CzugxlbZH7Ko6NP1scaFhwp7h/ICw/PjdS49mP/cj+g/2m9zsTCeFURs7bTMU4NN0AWge9DrAI+sgBNIjrf0lBrymhX5UBgYcax4vHOY/owgm2ZNikBz5XlEZ8/nbFV6+ns5kw/MFYJAEuYkkTDWKS84uTktAuxQvHIkR31l9zRk7G+DCNrYYGDuMqVXIKF4fCNGMeWx/BoHRAJ3q/jdHta57dXRZ3aYOkwDhuTZaBSYqVXynATD01oEzhL8oDt5CnOxYHjGmns1rrok1VOvLPtrMw0Ts2DpbPvsM1YWdNdaMSjrw5NOCUq37OPkhlcJOoN4dJj8ynH4skmb2EArpGwmpmjABLyFNYeXxMX7s0lob8y/xn8JF7iBHtou4G4crzoZacbfZ3pdZS6GUUMAwp4lO+s0IUO+pjhdEyDQl/dkmkqBvOniQzMUtMN79x9LVapg7zL8H+IUMhCJZQBjjYeTsFiGlfwBW/62jgHRfXnKhoGItuorD67sknGff189QGEIlFQ4xxauVmVhE5vlEo4A1PDU7Y5TD5T7a0XT4pvedaswVVJ1im1CofL2u66vYZdo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jq4uAoLl92GvQa3k6zcOxHeyLD1MUII+5YkwYbm61XT0jlmXN1qtqWLihY+E?=
 =?us-ascii?Q?aH+wKmkl8ZrWFrGciqqth9dWhzzfJLnB0JcPPpGpFAMdK4jlZg3NWJpKQ7d9?=
 =?us-ascii?Q?gDAUgPm/xlvnbHcQoDcQgxvZ5gTNVv/LOK5xQo+iVvBAc+DE8rurajk0QLz+?=
 =?us-ascii?Q?UpXOSzXNYKxqIHveaDv9kKr5c+l0S8o2jO5UXjzWumL23drIW8uSg3XRvrD0?=
 =?us-ascii?Q?43yMCV7BQDrfe4pi35orreBOYF11S3RE0VzCzx6xyDpz/IZ1XuuNIhbrcjQb?=
 =?us-ascii?Q?YC4bu/0dsMInCzK9ucMHzgoiafYz3qXbve7dXuK5FuROzmRTCF605R4+4CfQ?=
 =?us-ascii?Q?qQDc7759dWfioWLSwh/4Fabtz14DpaDsrSf3WSV52G6h0rmETtkLIV21HPpL?=
 =?us-ascii?Q?X/FB+2OjxX+uX7RXO3GhJcmd+FjdrkgXaDkZbO1dYQMRW2cEYR9ZVZidZO9J?=
 =?us-ascii?Q?lPdoVQnn8LZWQ4TJU/nPPq1DwEJdv3mqVG9dAe1xTHWZjN/X4TDVUOUvGX/3?=
 =?us-ascii?Q?HMbT1aoPgjs7gvzuXF4+ciXceuJVuJBuAPGuCs8cs9c+bAxFBPHasMuss3fS?=
 =?us-ascii?Q?JDV5OBgSy377Q0XKG0GQi6sdC/XhXsVspzq2wIK+HPMRY7WmmL4KwnW7lOpa?=
 =?us-ascii?Q?y5mCdbhCvTEO+5FZHnntfwMykJEG36MZnZBSCvjr44nVEHSXodwj0tu5PA1Z?=
 =?us-ascii?Q?lbno1HqJOL3QHYWH+6Xd/JtmauiVRgSuEj7fbaN1nWODaxczrNdXRFhQ9meK?=
 =?us-ascii?Q?ascJtbkAJZPMIrPpC96HntYN/HfKrafW0p2anh3e0qs4rgXz6Eur8IooHMLM?=
 =?us-ascii?Q?MwnsfRJ6s1oiwJWUwWvyIGJclvOU+Yty4gYy/zlSJuAIU6EYevTPDstrXTef?=
 =?us-ascii?Q?qzERIKOsuyyx5jF44FqXXLdNqi9BVnti7cndoOw0wQGDaWxhZ9pgpUvlswoD?=
 =?us-ascii?Q?xiW0W6nkEL479Tkl/Q/F/CMXjsBnBGBOGuzj2rC77OKjqNfERfUaMggjXyT9?=
 =?us-ascii?Q?s01k9YdJoaYT+TPGSVM/8VSqK5ALhLU/gyXI70gjDByrK07uiX2yB2qC6oLy?=
 =?us-ascii?Q?kADoNObcDj4g/DNDXclQDE7wsqhyEe1kx+dp3bcsnoOqMrn2KuIMEQoH13IB?=
 =?us-ascii?Q?EKuNN29LgbJog0fqhJ9tlDlUQ5+HxlQ9y32Mr+rXXwT72YF1R7N34AhUNvbm?=
 =?us-ascii?Q?qnXxIlzalAa9Uw8bGBG6xAQZAJ0WjrPNVkscaK3yuz8Xu/xJtRzxjr+yd0uZ?=
 =?us-ascii?Q?8c7uzvAqCA6u/MWUVW4mnaDN/ryIamQp6fFrs29W5uCxbKxt9HDOko57d+JI?=
 =?us-ascii?Q?1krpgEWv/M/7lYrQiIEA5kDHbARdeB51aEidvxM2hcsrKdhQeKyCNhe1nE1J?=
 =?us-ascii?Q?hNbgt97HI4GSGri2sNP1KMH3imPk1VB6QOV0LRzA2+XmC99WzYx2eqwXW95E?=
 =?us-ascii?Q?EI2NbEVJ+I82myMCSrPjey7ZRfliNehvgRvSZ1g6y+PW47sY8VbYkGQJ964n?=
 =?us-ascii?Q?f5MMEy7KOo1SpyBQFS5fDbyIMV2sbxqoojnUeiwZPai792jvJSTp6RWmCTqt?=
 =?us-ascii?Q?zDOGX4iEqWp+0EMtyHIMBweH3Ba3Vt3MD09aQf1W2mpjaeoCdK2aIoU3Zojs?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 132d7be9-7f7d-45ce-6fb7-08dc479732de
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 22:03:10.0212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dC4Ynxd629pq0bKX02Arsaa/wLyUYk44zdkRdNOF9NHb3H+q22scEYIAjqFcsgfMxixlXT/lerTS1BkTM0Pm4DGaEXR6xr2O/19dmnlX1dI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7090
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

On Mon, Mar 18, 2024 at 02:01:20PM -0700, Radhakrishna Sripada wrote:
> Disable clockgating for TDL SVHS fub.
> 
> v2: Extend the Wa to 1274(MattR)
> 
> Bspec: 46045
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_wa.c           | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 15ac2d284d48..acf7bbe8cc8d 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -364,6 +364,7 @@
>  #define   DISABLE_EARLY_READ			REG_BIT(14)
>  #define   ENABLE_LARGE_GRF_MODE			REG_BIT(12)
>  #define   PUSH_CONST_DEREF_HOLD_DIS		REG_BIT(8)
> +#define   DISABLE_TDL_SVHS_GATING		REG_BIT(1)
>  #define   DISABLE_DOP_GATING			REG_BIT(0)
>  
>  #define RT_CTRL					XE_REG_MCR(0xe530)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 2460c570e628..a8d0e7534aac 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -396,6 +396,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_ACTIONS(SET(XEHP_HDC_CHICKEN0, DIS_ATOMIC_CHAINING_TYPED_WRITES,
>  			     XE_RTP_NOCHECK))
>  	},
> +	{ XE_RTP_NAME("14020495402"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, DISABLE_TDL_SVHS_GATING))
> +	},
>  
>  	/* Xe2_LPG */
>  
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
