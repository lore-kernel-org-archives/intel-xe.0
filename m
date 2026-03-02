Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76162E9B37E
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 16:56:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A9A10E1B9;
	Mon,  2 Mar 2026 16:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gQBLCdFN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EB810E1B9
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 16:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772470590; x=1804006590;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FNS79f1D1Xsq3jIPFqdq37Y1qlOsN7vpDpnyqo1/2Q4=;
 b=gQBLCdFNaeZtEzVMW+1KguOgWa8XyxSa307oyWeLsDHjHCOLPa4FkeDo
 n7Yq67Y3Te9UBFH+R/WGDkQbsA8ZqxHi7+edFcQnqtuFAmWBmoLtTcJoB
 hFgvSBDbWFzdkeFYgHKMN1e5Ob2y8eYGuV0upSoqlZx6houAHzd/V4sFL
 Hh5LJUS2B4CCyBIgUkCyOpqa+4zlHzLYc4CKTV21k8oopZm22l9Q8z9FH
 ZURaVGqI6ZlcWjF+cAcDLbsxnfHTkTCde/MT18PsqBhm/5MYkqGCud/m8
 aQUT1alUz3Clx11Syu8j+GnnF8dQNo9xlVx8IsQ9tA3vHcG+/zAulJRr7 Q==;
X-CSE-ConnectionGUID: OIPkjCWmRJ6vbDjGHOk3xA==
X-CSE-MsgGUID: /RjxNuAsTwKfGkO78Ay1JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="76088788"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="76088788"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 08:56:29 -0800
X-CSE-ConnectionGUID: Ulgku0cQRcyDu6tJgMpT3w==
X-CSE-MsgGUID: GJfIRCs/SPODUakWmmERKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="216949537"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 08:56:29 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 08:56:29 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 08:56:29 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.45)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 08:56:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=drk0muESM2OV63sGdXH4wHEhZe4gLAn356RVKOZe3W/stktIAGR7QGLyI0WwTEhl34gm9MYjmV/oNDOsViEoYD7vGZ/uCK45q7RsQ5e5+6OQLfke7OSTl1rhkhx5Hi4jvTAGJOS42xLmwBJEak/SUvHWjzEf1cxbbtzLiBnuFEtZf3Dk5BmFRMnBWG+S7Zcb5xpAMF4/5Xg7vYe7qnGTS9qsFiHjmRfUmf/lqzEB+NupOWl3b5Y1LjejNcmXZZ5SjOVP9ProPwM1T5JYOoDsiYyX5Mh1Q+Vrueg804ojgeKbuCwYU8bksAx9Wow0I/QrwEPl9p8UxpG7TWBBgdEWrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwljW43KyMfK9CSXGAxBhKt18/wSDAxUUmb8YIGpC+c=;
 b=SyOl5UEkhKFVoWE2FoinPP2d+VPxogdrLrzqnEOAgH4oIX1qKoCIDEyOUJdsTw37h7QZWWLDHFxP2j85rJe19c0P7MrBu/jBJPjDihg1q5dVn88nhwaK4BoW8QB38OmQMMToELAXXnn6JDZ+LBnY0cGg6QTu4UCeMTscHiz/XsVC63R9Hj1+Ag7toE2sGiNTQQ8Bn9IXW0/gaVjTavn6XHOfHbbgwhlR8w2pTwC9aifqhnNHvC8GdL+CjT5UPoOCU6HKj66Hmu2pgCxV7baFWT9oyRGGVF1iIJLTVtLvlKvfjtG9mujjhZWVOJajCLrUxiArolLRSjUy9QrNhLXrPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB8862.namprd11.prod.outlook.com (2603:10b6:208:59b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Mon, 2 Mar
 2026 16:56:26 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 16:56:25 +0000
Date: Mon, 2 Mar 2026 11:56:21 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <lukasz.laguna@intel.com>
Subject: Re: [PATCH v2] drm/xe: Send 'none' recovery method for
 XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET
Message-ID: <aaXBNYrr9wWUuvSq@intel.com>
References: <20260228075454.3434460-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260228075454.3434460-1-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR03CA0249.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::14) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB8862:EE_
X-MS-Office365-Filtering-Correlation-Id: 7534c79d-1aef-4f63-8418-08de787ca3e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: ekX2YpNX7TwPGLfVH+sIa+9DFJeT4cYfOrYLzUuo47Omxx6kFrgEBfhhGtayX7G+IO0ra8ZD48aahN2kA/0SoQC1fPKwQdmC+hQDb+Ftt4Wrd0fHEseTdOV64bhVQ4FxRQg9RSwRKeWSM3bFKYETvVIIVn1cW1zEZOa9T3LE0n7iBps59ssu+Qz5y/A9/jzPWo/oATwCnh6khDECjS80Jvl4wxyV2MRUH9ji5zSKZoMjWtfRU1wa1IxLaTbKAP+EnbbktpIwJnLwX1O0uIdbD++ZTU8Bd5QilcIuQVPBB0TL0CdJovb61X6LUyUDTIoJ6FwNKW5T59ullQKFyprSZVD/6+O1zJKGabF9MwwSwBdVPL0nUQz+/fH4hz1To3kXduzIvNOrfI8HTi9h44a01e9mzMyFONkKKdELHb9YB7GVoBFNUTopq7tbmlN/Hcu42Kp9YflC9wlBoVi0tGFzoUEEuU6ferTohDO9+eCysznhoL1144vNtIZc8ystZWbW7IO9rV9uGK8tqIiLasqO+yVkL128xk+Z2TdAG4cY7cJ3UuFm3WYa222ReN+NwIac9iy7OoeB2W5nyL3dEqw/hQY2koKVaus2Ca4Z9eW6FWxNpe5wDPI29z4dI14aOxsHJPVAwOtJY7doHU5HZKMcmHsD2JdGIyCh6bUzHQpWS7EkQNNutNRx+oN5GWzfRKxnCwR7QCDJxZCMyS7G6pXDUXB5bK1vDDXKaOfqGbQZuKk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e/NplUKSTkUlwA+/ANa5idr10Tl7DpwD+SAGgd1OH8WNlNERiKLY0bru2Zqa?=
 =?us-ascii?Q?xRIRjLEzKQRr2o0keRgsxBGl0zKbEeRoMJxdnfqUHzXUg58ApxtK29812VPA?=
 =?us-ascii?Q?48w+b7wTLBLEv8sUfVTm9z6uqlt+K2xAWNF3gBvA07ovMSpvt2ryQWJuJTh3?=
 =?us-ascii?Q?wZnlEtI7/No71Wfx9AqKcXkU37udKOzHWTZEjE+3IFwPrSnuX/HR5JHLHoZE?=
 =?us-ascii?Q?QV0gR3qitqIcFC2P1x0pzPGNUZ9nuefAQ6EE9vQVcn8Jn8r9XtDr44DxpVSH?=
 =?us-ascii?Q?imjavPwPg43qqR4vQCQB6CDDzox6jBAZDZHwhRbSphV5Ksu9D8nB+rkhuh26?=
 =?us-ascii?Q?cMQRiu1mDEd1SLqaEEW5NzTE7uCNAqDsgRVkIixxtDj7tmfMl7huIYad7nNo?=
 =?us-ascii?Q?/2KEBEQlPDVp0V8xiM8otCC5eDd0YOpTLjPMgoD0NdFCOtZ7dJUoa8UzVaSt?=
 =?us-ascii?Q?aJkW8veX5ltTNte+8O3eB35T755TZgPAQkIHkezQfN7qO8IhriqbJ5KI7odu?=
 =?us-ascii?Q?OdK9LawO9GCB7CL2PcirVyhr+CsoVcScToGK7essfDANlsrdEK3q0ZujaLvd?=
 =?us-ascii?Q?t4IEuiPB4bzUWyjBuMYCLHEd0fGmxq4HYDsgaKsOXFseWpwsnEzUZwF3UH8V?=
 =?us-ascii?Q?/eY2OLeus1CR0QUpgcAfl+ar8GUYagRy9SpWmwfMCjntw01N51R3bop+Kn7i?=
 =?us-ascii?Q?KatcQvqgjOAVrpr897tq6DxvZfnuXHxZP1krQxvojVsAAmJPW/C1knlrK9Gb?=
 =?us-ascii?Q?feh9CasL3BEtrH1IIVmOUP7orchOJ5Yqg5eEF2ZmAczLNNxYz6FmOnHX0sv5?=
 =?us-ascii?Q?UIUIuexxCYjUQQz599psatG+JLOJkqz9CjYhi8MiuoTfVG7EiKs/rbQuUQDL?=
 =?us-ascii?Q?+ndJrduAYASIDM1x90JnZ7NVntoAEGocxv1J1KaNyrg8PDMfk+bo4wHrhPIX?=
 =?us-ascii?Q?ufnEDPlY1hN+gqgLfjyNfsKjl4AISdKicwPbV6X5Cp70nhXcjKWEGzrRIjYC?=
 =?us-ascii?Q?E9ZSyAH+rV8UE+6zgEd0ZzZAmd8MCZJxz4DyB74cqc+UDhUEmAXrJYfZ1ruc?=
 =?us-ascii?Q?vD1j47yHrM8kYKwiyHkFBpRKRlNWE/dLmGrG+qzQFcRlyBsStYpmLSmK1klB?=
 =?us-ascii?Q?raNHPU1xWvCtvBjv/aKL1LXVGVknqk4x1Jt6MVbOl4x64uljdec57i//SUQy?=
 =?us-ascii?Q?+4J1QHYZJCJgoRFntkteXsAPn/cuTvkZg4Amjvp5g2uKrPgJJdk/m9i1sN4r?=
 =?us-ascii?Q?wbIvVErAz7GLPE3fYw3ligHRbfT2GIMyAxMW/TMpSJej9zyiKV83qCEZCduS?=
 =?us-ascii?Q?RZCl+HJ9cttero3UoMPuvoC52+gLftru/+wirxd7Ftmuy8dQHvdxmxWnykMZ?=
 =?us-ascii?Q?ZreB0Z2RC3paRyAe5yyuxqki/hLuRecH58trRxgEHUb4gZTqtBdtuKVvwbmr?=
 =?us-ascii?Q?JpOCpPZ5fLMU39w1U6nbM5vvXm9L/tYJMXsEYLUTU4ubJYcc/Sz96yaMPeaa?=
 =?us-ascii?Q?pNV43fNp+GH0fJcBpyMMzimUU78SQqII13BolTJXsv/KfZP11XreYrMKYpuk?=
 =?us-ascii?Q?LZ1DYTx9PiTYJE1oAAdaaXUEs8H23kzG12utJl/+sgS/mUPIg7qw4Rvj0HKu?=
 =?us-ascii?Q?4TEmlZSBX3sn1MWfRPVh2cqg0+czv33B4InJkGC2ZlVUZlPWXqL3PRukXPx+?=
 =?us-ascii?Q?b/JCCEfj+c3Z85ZWS52yGFjvDaBnM6JBMcpzK5VtTrQyfMgW7ULg8c4PHBi9?=
 =?us-ascii?Q?NaRfVjTc0w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7534c79d-1aef-4f63-8418-08de787ca3e1
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 16:56:25.8151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZ7u0Wx/60P14WCDDXpCUCPW8HP4w3lerLpXYFfFh7CWI15rFYYn8j7cv48oxXR7EccECJKNRguE/vG0f4V8qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8862
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

On Sat, Feb 28, 2026 at 01:21:17PM +0530, Raag Jadav wrote:
> XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging hangs,
> so wedge the device with 'none' recovery method and have it available
> to the user for debugging.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> v2: Use 'none' instead of 'unknown' recovery method (Rodrigo)
> ---
>  drivers/gpu/drm/xe/xe_device.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4b68a2d55651..7f74bbbc7d2c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1318,8 +1318,15 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  		xe_gt_declare_wedged(gt);
>  
>  	if (xe_device_wedged(xe)) {
> +		/*
> +		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> +		 * hangs, so wedge the device with 'none' recovery method and have
> +		 * it available to the user for debugging.
> +		 */
> +		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> +			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);

Don't we need to update that documentation you pointed out, now that none is not
a special amd case anymore, but rather meaning 'none action needed' ?!

Then we would probably trigger the right discussion I believe

>  		/* If no wedge recovery method is set, use default */
> -		if (!xe->wedged.method)
> +		else if (!xe->wedged.method)
>  			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
>  						    DRM_WEDGE_RECOVERY_BUS_RESET);
>  
> -- 
> 2.43.0
> 
