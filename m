Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC234C3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 21:09:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9536910E745;
	Wed, 14 May 2025 21:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5EdTeyX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EEE010E745
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 21:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747256975; x=1778792975;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8eLUrUkSU1umEA61WOaFTAg4Y/qWInlNYFLSmptU0P8=;
 b=f5EdTeyXCSNLwtIQituK+Hxx4WPrJXymn0jbF3fHZ2NV33KcpV0tZFTo
 lo+KMf8RTprbvIt4rZ0doJUrIVqxuB7lSB5PF/y8dv+FFBc0kTgI8+kft
 6YkjqvNfkxS2BU+iKccZetR7k2ukk7U1haRbXtK4S4X1YXD8XAoASIbdM
 rjPDrZ+PZk0i3JUC8Ue9egIGt8AKLxF04MB1Y5PJE6J2tUCl4rRHy+jRo
 6uzaHzlZtfjPIRTBVX60XXH91HgGtLfyJ0cJFQWOdCO4Mkgvm4P/jVKO5
 AeoGC46PzUbEoSw7LcF0Rumnn9sROapPIdpQQ3CLuOE9D8HspuoTSdPbV Q==;
X-CSE-ConnectionGUID: ywC3wxvIThKLtyycgkCVFw==
X-CSE-MsgGUID: IugZ8smYQEmLW9FsXROTgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="74574461"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="74574461"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 14:09:32 -0700
X-CSE-ConnectionGUID: f6GEr/66QuyiB62XIh2CSA==
X-CSE-MsgGUID: CPEZ7/fhQ/6l3BXh4UFseg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="142179903"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 14:09:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 14:09:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 14:09:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 14:09:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwk2/7HDCVGinBoVp+Tn2zq3NMEYDvUO92T6heI3yNE2jjMpg0l1IJ9M6D+mufExmIwL4HkGRfn3vDWL+zfib5W6qNH4H668qjBQHI1iETThkQswFkHd1k2oPizgw/JeyiZhnHx8+wvjHJblkqcy2I2x9ru2jKzHzNrpM5yq6GVad2byHnRpnj+ak0c8tKuhfcvzTBxFPHVnESgoRDhRE0dk/v8GTqzy+IQrm/7T/+zkqxMgoBrtilyuGZVFjcj2Vi7BgClJFEGOcuIENaBBFzHfYp/8sWXdtnW1iIKKE3OwSJcpnmORo9vkBHh2vSaPpWbQDT2WvTWM137x/XSeCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lgor5pqsBeHokuWZ+XJZtV50a+LbQJ9TOrdOpCyw3uw=;
 b=uRtqdHAONSrq+dhfkioVeIvemPJwRsmJvC4fOA+95jl0aW6nPE4rdIXAb5JIqAYffwuUNxV+DdTljUuWBx1v5QjAQa59IQ6xa1gybNfzXeoWuJdblnurlDEAX2OynRRlqulqik6s3A8v0t4+EheXv9K2dWaF6orufgiJPPR17DZbmSmsYTxb8FzY/8xnv4u6R2Qjm8vvgyVgTwCgEgpScGj1TsgejDBqQm4TR6F5ynS7XS5qFoQntNmQbNVmf0uD5phtQE5Ly3w69wP2NjWdH6BDMeymA44SUZDMLMImmgsv0iYUqtGLEgoYR8l2Wc9zpg8a9NlihBD8wacmZ1Q87A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4899.namprd11.prod.outlook.com (2603:10b6:303:6e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 14 May
 2025 21:09:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Wed, 14 May 2025
 21:09:09 +0000
Date: Wed, 14 May 2025 14:10:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 31/32] drm/xe/bo: Add attributes field to xe_bo
Message-ID: <aCUGzEqIeDAhX11o@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-32-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-32-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0170.namprd04.prod.outlook.com
 (2603:10b6:303:85::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4899:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e50e1c3-bc55-4dc7-a8df-08dd932b91aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E2SU2eoYUFq1Dl8mgroMRRV/BwDTB9ntLCazq39EYd/SNZ7gRgPk94CmF/cS?=
 =?us-ascii?Q?Dki4+DdjO5ZES45cOyUhCE7H6YE5ms7XbIXzdgs1XPPZ78ggm8HxoQV2EYAP?=
 =?us-ascii?Q?fL6yMyfToPq2PyXgpyIWwC6gPjLaY/6ihXdeZd3CmzfD0G8Lna++R2fLAmiZ?=
 =?us-ascii?Q?ojbw4T2D3CjQgB89vxHukdrgb1lalOLdavtby4QbrPJrHKsHmf1iGpjeVv4i?=
 =?us-ascii?Q?rv4GkAw4Pkg04LBH9eMkeGZjEDdmns+V90ZpEK9I1tPaMq6oU0At5K9NAhAL?=
 =?us-ascii?Q?peIHemDKdnuQ0uX4GafjOgx5wDtfPOY3ekk2dlRkmhtGQz4O+YuHEdITmA8T?=
 =?us-ascii?Q?Ik+EgdEBiAhM0uPVSm3jMrC0+2qrL9ix8J4ez1RWY1WuoJlVQDFv/mOOunUc?=
 =?us-ascii?Q?KgPZi4uWKdn3RPAjj/thRRSkilz9Q/6touayCQLB5lOY7ChJNp+L/99xXM1i?=
 =?us-ascii?Q?3umW3e0MEWfyfGBy9bqWY+CnIBhsas04+VePfBJBmTbFngTPaiR7ny0sfB0Z?=
 =?us-ascii?Q?18mG0GdBYibQySLb35Tp6+6WFi/ysrXCaL/I7fBlIdwW/hQyOi7IghKEpvYM?=
 =?us-ascii?Q?eJ4uI6zquX0jnFd+QozliIl+O6LteX4NtflsbBgXsm9sLzeobyNBt3M5PLTi?=
 =?us-ascii?Q?Vn0nzsm5lTI2oSm63ACsWAYNtIvrNvRQC4xr7xHQBfkQ+nilgPVOr2Y5I08T?=
 =?us-ascii?Q?rQnfttZdIzXRdINaPY5Q728qUDn9pkf3pHRBYiC7EBHlYE07qBOtPnz3arzC?=
 =?us-ascii?Q?SkkoaS94so1ju5cHoMjUujC4HmOkRysfUzkWpTyfTsAbKygM6Y3Oy7gmcVyM?=
 =?us-ascii?Q?XoEBlt05CNeyxoTR/Z6LZ6GeRw9M0PXjeFb1YDgdX5vHrX9fD58nQ3q48/XP?=
 =?us-ascii?Q?GbwNgT7dm0hi1El+egUYhGUs9qM42SZwUv2a+gywISqOZ0PjowMy7hGBdcEm?=
 =?us-ascii?Q?Z2kv6qhkxdcp/YZAejfEdsV2O63m5OpoVBZo0+gT4C1DMHSx+/gGUi1WgYu6?=
 =?us-ascii?Q?4ELTpaLjlLL22R4+6K8583UfrgJ8pdHlVGnRNqtUBqd6lM3uI8MROrXzI3/B?=
 =?us-ascii?Q?DSM4Oo658EzdrZfm8SExg4ATpqxYaBQ1RfB8ypq46xlB8DwaOAGcAc+2M/U4?=
 =?us-ascii?Q?7PXblfjYzX8iY0APc6jZkZ/EuP2xq9a5aCvifdFHJwlc4sAFfkSHfyV9s8Er?=
 =?us-ascii?Q?PIwB2TvrF8oQTOknulVmd+2T0EvRY4YWjEjqEbgZj73U1lP5eEHGtUHgiYZn?=
 =?us-ascii?Q?NIOejIgvefUlWXNfvnPhOPcKK4M7HI+v8o9u4cqRCAgBbrGwsBmtBaPfRYnz?=
 =?us-ascii?Q?d24Hw7Zb2PNtACW1k1D5F0Eb8tYXT45L2H6zXhHpdujuSorzY/48Zh0UWVmu?=
 =?us-ascii?Q?4MkD5MTtef/gKuDzFQmMniBveU4LKRCsbsqEORuVfNypbgLyaoNR3z7LkQdz?=
 =?us-ascii?Q?mPA52Mh9KN4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bP9C08z98l3Z6qf8R+fICLUIgv3Mu6SKWlQdDNGOHCgCFN+0RWvVdgsZkl/t?=
 =?us-ascii?Q?GkvY6nXfKGpJ/g4IRYQnYXD1r1g4io3ww+uCidklAnLHh9IXv+DddjcNb22b?=
 =?us-ascii?Q?7wK198HHIxI0OUNxse9EA5N3GTO+whi9r4s7XLFaJjixcwmmNKpVIPhqV9eG?=
 =?us-ascii?Q?ZXhY1IG8Jb6GQ6RP47lz3+3Fx/k1m09cNWRrkRLNRpjhRqR5c3rV9x8XRLgX?=
 =?us-ascii?Q?pMMp8f35PhI3U9qRuPrMNtrxpDVTeEgzZ/HHh/oNITj2pCzRUBknnokB0g3k?=
 =?us-ascii?Q?Z5paOEcOYo1BTQdNqhILLVlnkJmXVnaIH4xfbH3gph1Ld/s3cvHrK/tPslF5?=
 =?us-ascii?Q?k6DyMxq7HfwYzn8xByt8YbwI+L1pdihDFCTzszmW5KqVI7CmUs1ZplFbzqF9?=
 =?us-ascii?Q?sGAKTd+qMuMHR7IYbAAxK/jllp7Vp58qxDQV9iwnlU8O4CBbCoQXImrNVPWb?=
 =?us-ascii?Q?TykC7ktAiFtJYCsKW6KIrB/A8KMd9XvfvfIQQ+6BwmpvR6S1NdW1iRRW9JWB?=
 =?us-ascii?Q?FBs7CbGgOyaf6gPMcYtpwVqp65WMRveFFIUJpX8BhP5sMzsOnmzvJsxQRBF1?=
 =?us-ascii?Q?e0cqGD/4EwGBduFQ6rxY+t1ezhYnPTcM8vGDhiBHP/Ao357TqDGYqfvC+vQf?=
 =?us-ascii?Q?Csf6UNDsbIwqfG7BITpXTeiw9pDzQacChkLCTB6j8ArOOiP5cvFJShkha64L?=
 =?us-ascii?Q?SEWrLB9klBz8ggN85wnPQzjfXQ2wQeFO1MjdCvlBsFhlr7ZTnvlnGMWvdGwx?=
 =?us-ascii?Q?sgbyMnBjiLeDObbd8ZWotLa+rlWLtYWxlfjGu22SPEG92wsmRMT9qjIld91P?=
 =?us-ascii?Q?tq+Vl+cje+4dkb3NtrXLvhDoUrePzzKPQBlu9pDAPYmj6tAsx1oNyzBS45Tz?=
 =?us-ascii?Q?ThryhvFlZ1R/Qp4cxTbV3CIHwcAO6+qqv+XhtJJDXoHmUIWZ28crKFTLhuhE?=
 =?us-ascii?Q?4eiQFabVSax5QEFTo68r8zS6VXRrlq9m08ieWuOTpXqcope/fnrcfxnovK3N?=
 =?us-ascii?Q?/f6GxIScn284d0NWG0sR+IeP+RYfFQ+kf5Qu3BCXRDOOYiPReAmqyJrIEsie?=
 =?us-ascii?Q?UqgPOhshUMrBrLtVAdgWE5kr6CyqTO9h8Z8wy/SDUFXpTij3ldmaPvR9Mzwl?=
 =?us-ascii?Q?gUvajbVAY019bWfuSNRAEGcQaAXv8jphQEcnhpXTB8SDvwLjsQPgeGajprKz?=
 =?us-ascii?Q?RCmjGmuk0uzJMe/N03CkNp34TyV+1Q/Mj6hf1LyFIhYd2zKLIjBizVgB26ax?=
 =?us-ascii?Q?ZqXe2Qd2bS4B3diHw4Hv6F9rSr/B/Y+PtganDpT3929D9RdAaCO4xXfla9qH?=
 =?us-ascii?Q?N7H9Eh2p/2B0+URs5PLTgx28QlFVHhQxPbotZHSPe2tS9DeZ5NLwmc+oHFR1?=
 =?us-ascii?Q?jz6Na8aSl5ef+pbpCr0xhyerSK4WE4BWpKs0725V+jDUyoNVL2F3uyWiU71A?=
 =?us-ascii?Q?NKHLQ3nCcoBo8/74XqFyOq7pz7rvvS3oGOyQU/HojvSxfpZ1gCMhCe09ikEi?=
 =?us-ascii?Q?cYLk/JWbZSR4y0RIDg0+8IBwk4QQAcSNP+fAKfSPHziDMa5ZtOPbZ8abS+Uu?=
 =?us-ascii?Q?tQ4A0M8a4XxafN5uQ/Xkh+zk8EsMtL34kIa0Tl1RDFMkZ2o2FH7ybVGXJJjf?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e50e1c3-bc55-4dc7-a8df-08dd932b91aa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 21:09:09.5153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Nrvc9N6syA/KRb+WKwaA6T5oA7p3zULO7opCi4SCJ+VqN0jIwJCLKZnZ3LbCA//pofZaiEjErrBt9rvLOER5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4899
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

On Mon, Apr 07, 2025 at 03:47:18PM +0530, Himal Prasad Ghimiray wrote:
> A single BO can be linked to multiple VMAs, making VMA attributes
> insufficient for determining the placement and PTE update attributes
> of the BO. To address this, an attributes field has been added to the
> BO.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Replied to wrong version eariler...

Anyways:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo_types.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 81396181aaea..5340127e67ae 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -60,6 +60,11 @@ struct xe_bo {
>  	 */
>  	struct list_head client_link;
>  #endif
> +	/** @attr: User controlled attributes for bo */
> +	struct {
> +		/** @atomic_access: type of atomic access bo needs */
> +		u32 atomic_access;
> +	} attr;
>  	/**
>  	 * @pxp_key_instance: PXP key instance this BO was created against. A
>  	 * 0 in this variable indicates that the BO does not use PXP encryption.
> -- 
> 2.34.1
> 
