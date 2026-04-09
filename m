Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326E1F364CD
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 22:59:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D642010E873;
	Thu,  9 Apr 2026 22:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bwDTlJHS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A02510E873
 for <Intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 22:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775775544; x=1807311544;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=04qLmOkM+KRb63R33R7z+YoO0RnCfNyruoIl8Vhha3c=;
 b=bwDTlJHS2UDwab9519SDR/m+L6Z9js+DOzXSYi8aw8tKfgxzxPxrLEyI
 N04dqefmzSJYJRw73zAjTwPf3ghlFkE/Gq3pikWkszP0TW7+fAT8uB5bD
 rY67MVnKuGqirc0NoEK0gGoUP30Ov9f6iExjcNCfo2vtJLteAfcOLcYvu
 r0Q9mKTmK/4mWSwSchvrVWr6Aw+S/86CNLE5Q2T6hV174McDUqYb4ulA0
 S4R/PYkpj8tSbuq+I5cSct/Aw2nzZOCEheJo7zFXJE6ewS0V2vOi8IlrI
 H1H8VKgDATfhD79xLEqBx/E4T11c9zmeNCf+b9/K9fsUPs7zlUyqVwAwx A==;
X-CSE-ConnectionGUID: 43/1sMRWTjS3RwkyGi5vlQ==
X-CSE-MsgGUID: 0GFWlW25QnCsyeVnGrhdfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87867306"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="87867306"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 15:59:03 -0700
X-CSE-ConnectionGUID: olTw+fiQRMSUgizUchd3MA==
X-CSE-MsgGUID: 9f3qo3b5SNaWNA2tCRPbgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="228799952"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 15:59:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 15:59:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 15:59:02 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.54) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 15:59:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qck+/dRA5UKgB6I0T+QX3vIt2YW9eAE2HdMJI12IJw791jMsg4XNH1hqNbn+WV5CvK5F5O7dBppdSB8NHuYutyuLpC207EismRZrzhd9sFXR6YRUIYsysSLp7UwcOQOB76v6vis7iv673HEQx66TRy2jsxq/5qOMZfUFJkN+jr9GCOppbNiK/eeJ47sKnjQPs1i77Z+bpzelFnTPmN/WYXCUccr9AHk34pH6x4mSDG+qJN7zvsLq/O93xIZksDN3o2A+dPv47SSnKUc4V8bUNnb6blDxZzgKOTeQv6gPPP9AmdSYMuVwxccLyzbsHySQl9c+G+YtSdr3hJfEaxDwGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDrAgZI4R5g2qjjoWrbq0KiQoca+nH3owg0HxrmSbzg=;
 b=X5VSzBt2UXJoLeHZgpQ7MMP9hwFzh0flN4KC29e7A4pgfQF3k3lppvjPg8sAJQFCnn8P5oM09ch7aeJV58YdeAEj8KqTPHrkzVirr5xcH4vPZomARucLVtQU43IJQaBmZqCI/xUMqNkaOJlV38eVpfeKxkcL6u/Wo1/qMyhpsP5v8H469xlnVs0X5ZGvZn7H2dH7NeJLtRs4/4Aa0rVNRF31pySDf2qfY+ScwfJiVi6/ZWFatvm0DHuve6WqV0JzGzURTCM7ISirlk8DYtyVhaG4XoNrmNEZo7kEEn+GkvfKNwhtZXx8GitbioIBGG6h6V8qCteZkbpPcx4CjNCfgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH3PPF3DE9570BE.namprd11.prod.outlook.com (2603:10b6:518:1::d18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 9 Apr
 2026 22:59:00 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9769.041; Thu, 9 Apr 2026
 22:58:59 +0000
Date: Thu, 9 Apr 2026 15:58:57 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Clint Taylor <clinton.a.taylor@intel.com>
CC: <Intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Apply WA_14026810691 to engine
Message-ID: <20260409225857.GA6301@mdroper-desk1.amr.corp.intel.com>
References: <20260409215705.1456888-1-clinton.a.taylor@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260409215705.1456888-1-clinton.a.taylor@intel.com>
X-ClientProxiedBy: SJ0P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH3PPF3DE9570BE:EE_
X-MS-Office365-Filtering-Correlation-Id: d9923f64-9362-4b04-727f-08de968b95f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: B7lwvpmEHVQdZ2nh8NwQ4MXlmNgonj1LiSi1fX7F4gNhSicHrf+ph8/6ejbux6KU17hwzgcnDgnqcCzkkTgFmFE/8eNmA0kXeSgqWhp87yBpRfutiHV5J15tvneDmsxXJnYG++bt53eofGfK0yJqYZKQjxg9CCxQupLNTfB+voC/nEUq7pVGKwiuRuSjCDwv4ccYnFG3iM7Pc+FylP/qAEeU7GhOyDAgOoLZcKjHmOsZ+b7By+iw5MRKAr5RwSxzeHaExpcB0wKkUamJiluyCvhMFN4am630376e2dEIadz3Ur3REFqL4nFUvMHHq+qIR2C4y2nXUZ/+3jD22hcznih2fhL2bp+mwaXpgfrRIRlOQV4EGhD2T1TtGdkRwhRbDu1P2apa4al5ZvTAvLI9/8eEFe9eHIc/7a8h+AOwdyI45zX12B1Hw9xzTjjPDbhjcmKVWVXtGdheZ2Gkv7Ho/YL20OJrxdenxEoNPQ+Tl8faAvN1VXXGJ22p/6wRd+sLQb+XNzOjtY8rzDYigzJO/uNPc4+E96A/054wJ2RXRfDr8+o/xg1O811jK00Ee9IJhooWO5yvdLTa29tyb412ulodd+g2XLgYwIJ5K1dHZEYok0AFB7UYG+Mmf76PRsR92/uxgd+yFJL0vsUbEWmAeKhCYty5GNNOjOJQJfkQU3JIVkBpCiHt9yH0kSzNlWli3e79QD2waNPhl2oiOJsRFUj+r1IS2Zt4lhOGui5xuho=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AqOCvxzPLC1pNhu/0SIgdV+qBJhGddu1Maon6P2fQPrfQ+KppS5S+4ci1yiu?=
 =?us-ascii?Q?uAhMchljOhc+LNgxeDBihbs/bL5dnWFyab1OMT86duhJVQAFeENUl7Xbzbpp?=
 =?us-ascii?Q?ELgtUUKGbOTgjfjAyPT0XeVkbkgatXD1wgvqTHvAZ4GPQrTS6kl5k4vB62zU?=
 =?us-ascii?Q?dawN2HVIqdxGHaCYyW+YpvzWLl3FRTFW00uAV1czZt3LSiWnWBezkyPIoF0I?=
 =?us-ascii?Q?huprXnrX6Wz0AQ74LMTuCZzsT1zfzYAP/SDuFpJx1xROXH+xThNr4gczmrZb?=
 =?us-ascii?Q?9AjN96g4ytEmzv4nXO66VhUp6oIqRTx+h+FDwozT5jCg+PgZQ1NXgFKe3ELb?=
 =?us-ascii?Q?OSCCl5a9VVBcJqNjWFatUEj/62rYZFvdEnE/XR3Wodv0S8uBdWzlp5ThwS/R?=
 =?us-ascii?Q?F8lQHw/aiAnd2EnDw1fa0y1w/xoHEjKuLAbtS3Y17Nf+DWbHAOKPU62ohRZ3?=
 =?us-ascii?Q?huNPAPgSw6JE+yg+3MzPBEfPn1A2aLt7c1Jvez/IuQQ51hnMUmfRfRAjHb4O?=
 =?us-ascii?Q?kY0WkBkMAQuv/4yxK2Ip+ChIpmQkm70ke513nTvPpqBGhXZbS/UatJTMA7j7?=
 =?us-ascii?Q?D7vxFluFxd20dRfXAkYtZe5Xn9ceH7Fv3SoAp6ub2Dy4Qg2FFMK3H+CgoKu9?=
 =?us-ascii?Q?wv7KDp9OgzsseueEK+hwNvDI6s9tD8d+I00VVca5TJaS6FA54g47ZBOzpB7E?=
 =?us-ascii?Q?KO4kZJ67zjmGqxw97IV/QuOalt1qPvqLPmq4jHGV6DjC8UcjKmP+id8vxtQE?=
 =?us-ascii?Q?yY5a9ywNLtNXqOyB4KJizs6zVe0Jiwaw21Q9YNzxWF4EiPtjJlYdzlsDB7bv?=
 =?us-ascii?Q?yGh4m2+gH/V3AaY+0D4smz/y5b0VxeM4iEhzHf3y6OqmW6EcKGSJ896B8bho?=
 =?us-ascii?Q?Z6si4YgMF3MUQMSOOm0z+hR32B9XNtIhVVohFm09R7OFocDZ6uCXpSKrPZ1W?=
 =?us-ascii?Q?pu902qZlZs/xsPl3WDejkEF9Y2OE3sNAaYBipQc9FIhD2ug1D0iqT7GDVgv/?=
 =?us-ascii?Q?O/z2IwJkw3pCxr8sGH8MTUEkkeMpuSGYsV3sZ2/5aTBN0hMQ7q0eXmEDQXtX?=
 =?us-ascii?Q?WiqjU10961BKcYIoqmp2x4y3cFLDeQArkSdKYGUnnJ74N9hzcrBbtkMMEZ74?=
 =?us-ascii?Q?TBNUVAE83quWKFeFZ5dlWT4yoBCEi/DhS2HKbD+FvvaN5FuIn4qmoMQlUTUP?=
 =?us-ascii?Q?w0PSxHmdsYeVWD6RLG7VqkEpNL6wWCVQxzwoqYn68WglABghL/64aqkD4kGt?=
 =?us-ascii?Q?vR4ZMlZjzQiKaNcP2f/AC6wSceJ7/fQ1g/Fh9XcaWT6g0wpNfl2pyVwAeJMs?=
 =?us-ascii?Q?MtYznlqJCQC3u4VzF9wBNXHRilLPVC8UKb0k7Ghf+CpvVkSYzNuNyIvjeX6Q?=
 =?us-ascii?Q?DhCKsJVKy6ynV796nBLsFjXBY2XiQMSJnqcXa82a77SRx1Vm799SfnGG01DH?=
 =?us-ascii?Q?h81vRdUI15X8T1NLLTl1/E0pT7vWfvI/lItBooehUUKrkW03AiGW5Kr5hBqc?=
 =?us-ascii?Q?Zv//m6nRq4Ms4gYr9pW1mjO7/yjA8NT87ipdEQx3ALbQV1wTls9LfBtgbJLD?=
 =?us-ascii?Q?68l6Tlan1h5mL5qSgtzFCJ7I9tkIIfk0cLaV4BrioJn7KR/4nuxtbeXG/Xek?=
 =?us-ascii?Q?v8JGiSK28IUSf4U2MOoOt3SkoDPNI5pEfxu2Znnq5JkKN+VBnhHalpCfyrFg?=
 =?us-ascii?Q?mHFNPwX7ZnksdHaUL1/OpyHKbNfxOthxQoKsYQtLLwx0p8BqW3ahV/51voxS?=
 =?us-ascii?Q?+UIRdjJVwIbLZpODrtsW4dDJq0ZEF48=3D?=
X-Exchange-RoutingPolicyChecked: Mn9tt70/kYV2GmrW5TS/Pej7vCiuVSEDHFOzDANOjLXiSIDjT383WfGJGxHybItavUYpWX/9bbAG6pCqf1ACZ/K+LEhwv6m7L7lCFPe66iSd7SqHa0FDWj5xhypg58KzgU/5OZ2aj8gD9bxAYN+hYKNcqTV7AcAvSsUyyyjBgIP5vIyDer9soR35sIH4iiooRs55pxPvszn+Gn+GHrbkh5vVmkd8Vzt45QXi6c7dJ3MeDdZWpP2eGGG0MTLSQ4wXfsrorpCMVgA3De8jiM5uhEgbZr157+DVsPPix2X3fgiFaiOGQ9YHUlH5gvG3GRv9zo3mIF6L/0DYeHR8UVw3Pw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d9923f64-9362-4b04-727f-08de968b95f8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 22:58:59.6952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wmfvqNveuQi+powWb062ve8tbhpxbEyhLImjHecj9lKFOzBBoqeu/agkJ4Q5UYv/vRr4T4Z/YN9tZu1+UtITI4dkZTJSKhokTEgOUGOwi0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF3DE9570BE
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

On Thu, Apr 09, 2026 at 02:57:05PM -0700, Clint Taylor wrote:
> Apply WA_14026810691 to following IPs:
> Xe3p_LPG
> Xe3p_XPC
> 
> Signed-off-by: Clint Taylor <clinton.a.taylor@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
>  drivers/gpu/drm/xe/xe_wa.c           | 6 ++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index aa267c2f6162..6a16ac1aca96 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -536,6 +536,9 @@
>  #define   SLM_WMTP_RESTORE			REG_BIT(11)
>  #define   RES_CHK_SPR_DIS			REG_BIT(6)
>  
> +#define TDL_TSL_CHICKEN2			XE_REG_MCR(0xe4cc, XE_REG_OPTION_MASKED)
> +#define   TILEY_LOCALID				REG_BIT(2)
> +
>  #define ROW_CHICKEN				XE_REG_MCR(0xe4f0, XE_REG_OPTION_MASKED)
>  #define   UGM_BACKUP_MODE			REG_BIT(13)
>  #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 2ec70be78bf9..30dd1687cc8d 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -609,6 +609,12 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, DIS_EU_GRF_POISON_TO_LSC))
>  	},
> +	{ XE_RTP_NAME("14026810691"),

There doesn't appear to be any record for this in the workaround
database.  Looking closer, this appears to be a general (non-workaround)
software programming guidance, currently documented in a programming
note on bspec page 73720:

        "SW to set the value to TILEY_2X2 walk pattern"

and also the tuning guide on bspec page 72161:

        "Program bit 2 to 1 for all clients to have TileY generated as
        2x2 walk pattern"

Since this is a tuning setting rather than a workaround, we should move
the implementation over to the engine_tunings[] table of xe_tuning.c
(and give it a descriptive name like "Tuning: TileY 2x2 Walk" rather
than a number).  Also for now this appears to be an open-ended
recommendation that should carry forward to future IP versions as well,
so we can change the range to (3510, XE_RTP_END_VERSION_UNDEFINED) to
match that. If/when the hardware teams eventually change the hardware's
default setting on some future platform down the road, we'll come back
and add a specific upper bound.


Matt

> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3510, 3511),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN2, TILEY_LOCALID))
> +	},
> +
>  };
>  
>  static const struct xe_rtp_entry_sr lrc_was[] = {
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
