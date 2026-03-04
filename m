Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B8EEF8FEA
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 13:55:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54A110EA39;
	Wed,  4 Mar 2026 13:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WzpWzedm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A716E10EA35
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 13:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772632519; x=1804168519;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YOkd6yZ5LFX4q4lX5UV2DikMjrx5fGv0+X8LSTvf4T4=;
 b=WzpWzedmsHzDxtI3XJoSQ+8UwpCid61XozLBxXQFZ/GAangsl6cNE31y
 6Wzwe78zxzON+A2ylroN+w4t0ZO2O4as/k+H3rpFuxdGucIoPinBxplAW
 nryE0QyqjXdD3RUxQtEIYPEq0NOc9RrCwdDdFA34rix3R7uHjBNq62VYo
 bPyO2AGMc128W8JW1q9WCSXrbGmD0sHeMrLEWIvdbZ9yQP8pmq7f6LVhv
 CaoGncX0tIgtpNbiAMVZBcHPlpxg41Yeu1LdwSbOTUcqywAW27XadZPaX
 iw3jlTXtqUJaAXE9ue6dd+Apw5rcHIpnmaQL+xMw16sp00wdnPyTp/Ofz g==;
X-CSE-ConnectionGUID: ILWgPy1RRSiV4xG23QZC9Q==
X-CSE-MsgGUID: 3q5kYvEaQNa7EGHVqNQ71w==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73656472"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="73656472"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 05:55:18 -0800
X-CSE-ConnectionGUID: 0/SSFL9BSWSh16Qc+WMItg==
X-CSE-MsgGUID: EKQKAwkLSsGLhLOdzxuAEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="215291067"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 05:55:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 05:55:17 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 05:55:17 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 05:55:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJY/0Wu5WZS18gHvYtE7i3trLZoeTJjdNzs9U+OFMvBC4zmN+M54NyVNIM2BssiU2md182dUN0knLaRqT4TlotuttvNzmx4jIk+Uhgz1Bzzje2kykNS1QrdM9tUJYJ7g+QVFQP2nvbnhdaQyM2v0twrmEwLvYPvNBGFFnOwS1CufSSVSOGAKJO9N/3WWw7Ti9Wqc8zsvZQhtgkuYoLZvjcnRx+uZs24VSKgvlLoAr/WtY/0jSi+G7Qw+A8l1Tre9LLsHlNl0/rkl8GAacqTTwdX7ZWNwgDbaFLNOtW0+n8ZO4NCR20CWAr41DftbGyEpUlFtaG8hlEjuuJzMrjB9OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6jYJaFLdodT3d2s1HLYt3tZifOAGnlRn9KGOlDIbSA=;
 b=ItCgt4KNIFur0WFGHLWdWpM1I5bseJThcuKc3GxCfpDetDlhXkfONhYk4ea32I0Px0FJrxfjocPYxQpzOlcfqhGMZaQ8S23IPpq7YqnVKxC0XK5jG45G9xMTgeH1C1BNMCEZRSaV2/zcvT3W/JQcVeVmPCnOca1kftgdmj2yrMEOHrov7h80T3S6Kum4y2GDbYZd+dVZbsTZNVVTQsePlkGP1l1yN1ijBTxAb1QCMDjmufuiIIMcNcKdC7wLUZGQL0Bd4sWAsEPYHdaeZATZ/lnC3PZu/c+ci/tu6d1aHecXFtskYKcxKjOaGQHeursBqizJikTpl4NsYuxACtRxng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA2PR11MB5035.namprd11.prod.outlook.com (2603:10b6:806:116::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 4 Mar
 2026 13:55:15 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 13:55:15 +0000
Date: Wed, 4 Mar 2026 08:55:11 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Jani Nikula
 <jani.nikula@intel.com>, =?iso-8859-1?Q?Jos=E9?= Roberto de Souza
 <jose.souza@intel.com>, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: Re: [PATCH v18 9/9] drm/xe/xelp: Expose AuxCCS frame buffer
 modifiers on Alderlake-P
Message-ID: <aag5vwes6-qRqEoJ@intel.com>
References: <20260304130314.6084-1-tvrtko.ursulin@igalia.com>
 <20260304130314.6084-10-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304130314.6084-10-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: BY5PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:a03:180::18) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA2PR11MB5035:EE_
X-MS-Office365-Filtering-Correlation-Id: ec94a92e-4a1e-41fc-2f71-08de79f5a985
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: xUvlOJJrh0nOnC5rkj7kYsavC02tfwrRLUvij4fauS8LuO/S+PsMcuX+o8XbpEI2Wq4HaFtvl7asz1XZ3SpBtkN0aBUXyHml/Z6SR/G2CLE+L3df9QIxb3FPCwu2e/ooxUS259nwfxh8ko10LqxlxxtJimCnn1lSViemdXiHsdUj8Xnkab9r08+mmoLTubbeowgzk63XUaDOS8j7jwFp8N7mUSQLrr2NsJCfLafy8PAwN1/DDvd+JAlCU/ifXoSNXXpT8jEaCsH0XBXgrWQqzzPBx8pmapvcY77nhd7/91rU45d0R4c9FXQxZW9Zkfn1Ic7c1qTU9qXPF0xDdY85kQnTHQO9dRHlHh29tMksJ9kSuDVzFZ2Y8YnP1YCXaLcpwJOsV78vi1HBg3UvRC+2kdiErMTJ4htx7QsJ0cpulP0Lb5tIQd2CQB/LU8OA23ZIo9N1L7zU7NAb3Sa0EzIcWjoAo3voCYgVTkaNZgk5auxp1i4s+UkHT3M50nygPKbhUDS63o782XJu1hvKcQRhuIaoJGG/FZIO2w4BXt3eyF4DWuI92yP2cE0CqfthcSOLSiaYe3EAEKgf00/McFIz5x3C2yhr3IFo5UplagiCCDDP1nY88UNDqMvszf/zKwHclouv+xauVnEXZH+yX9SSAhkxxNo23yF/fpmWfNZJVCSZL8j0f7kYMfmmOZ7nG4kOTTpS4ju3P6B17Tc2DwYND1Dti/1aMkJV7A8nAdsV1AQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GaTJyrdm8vcMeNZfD3JAnYUTiFPlyDx+jCrguV73XRojkwTlCyXiD4IbWd?=
 =?iso-8859-1?Q?+mhGe+P/dWCUPAk9jcMvA9qRN3PhJwAZM7Qb5k5wCwyzSMX4nxfOchFyHp?=
 =?iso-8859-1?Q?Bvg9c+BwDTvcskXeU3KlDSpuJ1c+pvI4/yRbNITakNHURDkik5giOJkAT9?=
 =?iso-8859-1?Q?yAPyGPZpc9wziW5sw7rz7ndH5ixvnOoqJFrn4YJa7AVpPpYFyB/RUZK+yA?=
 =?iso-8859-1?Q?NmrL/EAtn83yl/t8uOk7qG9mH440TBDxByOCOAEKLPc9JJSCP++CyKAxn0?=
 =?iso-8859-1?Q?Eku6lGyJKLTjh+chio1zkMr0qcglfEcLLUEdMQyUF7/OGXsAgk4sgyL8ro?=
 =?iso-8859-1?Q?pcSgn3AkYyIrx0crgo6btrDONyaI7rwXuvI3cvqCnvdC8xXyqg47GZtY+3?=
 =?iso-8859-1?Q?TvDok1gBwTflVZzQeJH5UQDACXZbY8WEBFubMogEVELsV2ilBTIWohWL/b?=
 =?iso-8859-1?Q?KVW0ekjqapKvilQVzcn2EBgP3hrCHJ4pmSrFR9r9lKH/CiOQN9/0/c7mLW?=
 =?iso-8859-1?Q?pSrt9cEENRK/6B6iRWlIg3sD6xGu0wQT6FmsNPTOkN1QwvG99iHUapnRbJ?=
 =?iso-8859-1?Q?c2wL2N7pr0FAmMZ/mzr3Rgfog4YjDUAIpFYW0u42uAVW0PE4yKHXjterOA?=
 =?iso-8859-1?Q?6FQPXTsShz4QXRYQHEWBHZqiWhx0dblqY6Z5zVHY0qJDp7RBoA3t+t3mQo?=
 =?iso-8859-1?Q?gn9bfNSzdt24gj5PdbcoZoS29dp6ZX2FDA+bPOssbXXm0OSyPfUPqBqQun?=
 =?iso-8859-1?Q?h5SH8GpNa33Hi9vc0mmCw8653vtfObhE7T8KkJYZoPrGdzjwCpUDJAKCXm?=
 =?iso-8859-1?Q?p4MFR1vGjEoITkOo8eU6kjlkBcWDWL4RkDqCWGd7D/gzEGtQvmNuKju/Jv?=
 =?iso-8859-1?Q?v5ACxFdJ1GQF7BRBa4XpNUSd6AWETCAU1v8reu3kNlinFkmRfA1TxbpEeq?=
 =?iso-8859-1?Q?n8ArpjT54f0MU/wCub2r2tsgig8M33PnmaVc6jvqrKxqr3Wzh9oZCfWFqK?=
 =?iso-8859-1?Q?yAEOZ7M4VvRSxA5m+CvvziigsMoetP7BDr2ywHYhEQJDvqJ35GE96Pjzk+?=
 =?iso-8859-1?Q?lqxqt6i0f6QjFSUWwTFxB+Dy+krIUpiO/IlxC41oIRpstVTO+9fFOLneBE?=
 =?iso-8859-1?Q?NZbWYEFIBkRJTK9PrMg5JF1qw62oGWij2rglVletElVHzGgJoHDJ8PyjsI?=
 =?iso-8859-1?Q?nUiIX91fCEofa8SwRVX+UqvnfqQ0r0MOyZKtJydZLl3bCDf/IEZxRjiBoR?=
 =?iso-8859-1?Q?Og4XrFrhSrAEupQeUexMQa5JC9VHQ93Fk3CqqchwuHCHKC8RTa9HgLnGqb?=
 =?iso-8859-1?Q?E47d6FxTjwxdeRbtbR6m3ElvBB1aFXxwERypisXmffsNyxTd31HR/rPDzB?=
 =?iso-8859-1?Q?ozi8bsyC7pt92nOYubz0Zswacgwof259/Zt5yMa9i4mCFE2PiQ5votus+6?=
 =?iso-8859-1?Q?cfIuAp23jKGd880fh7WiWeZD9VovUHnTegvGf6FDJWe0l6MxGt+aatvdWK?=
 =?iso-8859-1?Q?C0JiW3+tdhtKIH6y/fYC6svIesJnmgYBq9le4toIXaKC85ObYl5hU7ZNlw?=
 =?iso-8859-1?Q?e+jUQ9eaytyIRT2drC6wPNpslHee6x/P9tXntBE6NRGWEsKpdAdbjbhK+v?=
 =?iso-8859-1?Q?Z+dg7SWQ18ZUgrLqB/tq8ZOyHTNrBgjVjrfrnonId88/VU/Y1/xG1wTqTs?=
 =?iso-8859-1?Q?KZ3J5F3xyw7DzZgQau9MFrspDNKlk5ZYagD+o+b0vZpTCmiFaFMGujuPWw?=
 =?iso-8859-1?Q?7DFGtz1qJHA4gzkSq7vsbds1WbD+TfSBRg1T5MRgyarf93fBDIHZG2iO0I?=
 =?iso-8859-1?Q?bx3hLwgnHQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec94a92e-4a1e-41fc-2f71-08de79f5a985
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 13:55:15.3599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DO7hh5nRyhhv3dPzY0qWwhM2UzQAqDx9J0x/7C0ymRiGwkCxeGFscZ5dRB6kYW/NSKhXtvtY3STNRxTaqAXJNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5035
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

On Wed, Mar 04, 2026 at 01:03:14PM +0000, Tvrtko Ursulin wrote:
> Now that we have implemented all the related missing bits we can enable
> the AuxCCS compressed modifiers which were disabled in
> cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe").
> 
> Tested with KDE Wayland, on Lenovo Carbon X1 ADL-P:
> 
>         [PLANE:32:plane 1A]: type=PRI
>                 uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=28
>                 hw: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=yes, src=2880.000
> 
> Display is working fine - no artefacts, no DMAR/PIPE faults.
> 
> v2:
>  * Adjust patch title. (Rodrigo)
> 
> v3:
>  * Complete rewrite based on the display parent interface.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> References: cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # v2
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index c8dd3faa9b97..5180de285295 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -539,6 +539,13 @@ static const struct intel_display_irq_interface xe_display_irq_interface = {
>  	.synchronize = irq_synchronize,
>  };
>  
> +static bool has_auxccs(struct drm_device *drm)
> +{
> +	struct xe_device *xe = to_xe_device(drm);
> +
> +	return xe->info.platform == XE_ALDERLAKE_P;
> +}
> +
>  static const struct intel_display_parent_interface parent = {
>  	.dsb = &xe_display_dsb_interface,
>  	.hdcp = &xe_display_hdcp_interface,
> @@ -548,6 +555,7 @@ static const struct intel_display_parent_interface parent = {
>  	.pcode = &xe_display_pcode_interface,
>  	.rpm = &xe_display_rpm_interface,
>  	.stolen = &xe_display_stolen_interface,
> +	.has_auxccs = has_auxccs,
>  };
>  
>  /**
> -- 
> 2.52.0
> 
