Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460CCD5C0FB
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 16:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D2610E262;
	Fri,  8 Nov 2024 16:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dC5dmaQw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA6D10E111
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 16:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731082583; x=1762618583;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0U67Bg7D3kcRgQPKIT8Hyzgk81MFM/c81pQRiYSMveo=;
 b=dC5dmaQwWC7lPM4g6AKZcKEbfFF44oRos0Iatnis5ulBWrMzVtvTFhWL
 AHKf15v6t4u4lS33yLT1yVvH9a/z9U4/4VJkAYYaStQPCgpc6c157tvlH
 80nfYWrXdLu1ATOJehSFOkubFTg9jUwggEf0pMUPpfnUpSDYfxyrdZgZY
 stxr/OttcaGg8KYP+e3Kj8OM6fg7G3P2+kyDw3H41366UJj/bnfADbNoX
 VbatQOlg9ltJoKovoV8baK7pqdPLGD2mjXvNUExKBhS8YfM67l5JM0CvM
 inReaWooCK5oUiszRPnYxsXH81H7fspt6olHYytnJYm4Fwic0It8aOTy/ Q==;
X-CSE-ConnectionGUID: Q9gJvCy5SdKeJUdZoS/2mw==
X-CSE-MsgGUID: ulSSrANtTcapsHpr26xZJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41534732"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41534732"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 08:16:23 -0800
X-CSE-ConnectionGUID: y4PaoKcXQCSMH6OQeyba2A==
X-CSE-MsgGUID: ROhYiqLmSZqm/VHKpOCIYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="85242700"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 08:16:23 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 08:16:22 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 08:16:22 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 08:16:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UdQ2FdBE2Sise1eYC0jB7Uz1/PHyM164ZAjYok8mNeDGs/hTYjQCZMJRemaKs3PsLFxSsE+0gj6pxh+repzhqIr4Rist1uJUdhSMtm+7VCB+WSBRzRN4DPAu0//+81rqoiaEy50N77hEINuOFbUDZRfVe/kWTNXCpuVJPc7rZT2Bu1q8iOAJo4bDMLMr6e537VAvhLhZiSAbuLRfkFRqio/MJI70ntl9n+/5/9/ePMY5BrNAiRHO7xDrt2cxvlU3ZG4aS4TyBK94hvsL4Tk5cRDxFCJIcu8Ahw/yew0EiaJ1jxnUWVXHE15vvQnlSI+kyyAoFd/TAmCxOt9vVRw3Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3elzj00GaEl9HXkEKRwpAVXJ98hPujqv+8lCCl2tVJI=;
 b=hXXWN/zVLzLppXTwNSDPTuYMo5uy1JYl7ZIS7YGuSL+SxlfbD9wRSRIJl8leIRzFsyepteqLIP2Alg5aDP6WMnYAqMsZB9IcCFCb6GeQ5YmVScxrhns0F21F6I1/Er57zJKVEkeZQgZks0BUq7qtgqjZJftA5R9X7gPp1VCmnknS2dtigRNLoor5P0skS5AJHq2vLDxyInmQHSws4oVjmdtRHwxLKASYVPXn8fDB85Y+OESfaRMI2cOAPlNOCd7roziLy7uznH+VQW9cB9eNvtxBMHzinaUMkKA3qoTyUInxxLv7SMxMv9qWVBSdtb1IJuOTLUhYnEduTBPeSKNIdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6233.namprd11.prod.outlook.com (2603:10b6:930:26::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22; Fri, 8 Nov
 2024 16:16:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Fri, 8 Nov 2024
 16:16:17 +0000
Date: Fri, 8 Nov 2024 08:16:50 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC v1 1/1] drm/xe: Allow fault injection in vm create and vm
 bind IOCTLs
Message-ID: <Zy45chxLtJGTR7aA@lstrano-desk.jf.intel.com>
References: <20241108161307.1203967-1-francois.dugast@intel.com>
 <20241108161307.1203967-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241108161307.1203967-2-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR04CA0100.namprd04.prod.outlook.com
 (2603:10b6:303:83::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c0329d-d28d-4d19-e76f-08dd0010acd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VTOcooMc0bhFhWY85fhh+ibWGxU1EzWftkAMIizW8rjSoyeboXWOPv+o6vnC?=
 =?us-ascii?Q?hIPaY6xPuOZr7pEd/J9mvLrYh98ubmst3smhKEt6Lt3griVUU2HaHaByXVJI?=
 =?us-ascii?Q?rQm4QH5a4iaibGCKTo0zh6tvJcGt/UpohR0BC7iqtCGadv1iWfFaC9x1eUIX?=
 =?us-ascii?Q?DuwXu9wMR8Axk76+mDjgFGwJR80pIG93AygtR+K6oQ6F/sT0HPFYzqCxQ5tF?=
 =?us-ascii?Q?wvk46NiW/bSAt22heqZzxgR9ONukdMdbIue81yCKM/u4beQrdmQ7ejRFfHbv?=
 =?us-ascii?Q?AWJwPxQzV/87BwBurOYw6dsZLKB43xPPiVsX9mEp53ehk7DLpT+ZZyTrcN6y?=
 =?us-ascii?Q?m6RcBnld8kSellVT42kDLUDCYdoNBVhFXK0uzC4ZwqdsQpdPUED+FWcuZq+t?=
 =?us-ascii?Q?Kb9dJ0Gx/I3t/5JEecgsMsoC7m4qlvtvqT2L4PT+TMJR1c3iXsqpGuwqm399?=
 =?us-ascii?Q?zb6jACqVf10MUhKV8VCfgb4+FDlgXWgA/AnM2U8+nxznisrlIVt+iqYucc2l?=
 =?us-ascii?Q?NqEHMU72SO7mn5dSnKNof7cA67QReDjrLlCZLzR8iOzWp9N48Tb9xZuapozO?=
 =?us-ascii?Q?viQwiZ3IGv22TLmDm0vLggtSg5E7zUYlO+bthh2qY4DQ6BaH+SNzELGrK3iI?=
 =?us-ascii?Q?k8Mi4z9lMvdzrTQCo+7zMY9XCE0LJUKBMLw1ZJ0DXIHbKI8laL5zTUfPGwPp?=
 =?us-ascii?Q?1ssnirShWjEqNO2hksN+OWy7wTz7mogEP4CUHev1Zt1EDy9A7CCYZ0DPIQzx?=
 =?us-ascii?Q?wfXcHlTXebTlbxpi6q40uCh9l2n/zlnT8jzhKl3pMlewk6jyGRSnoEnDVLuE?=
 =?us-ascii?Q?5H0ND2hrLgshzN0hVB20WP+yOQOY8UGOvvK89fCNNk0QuvCqKudxuMyh04/4?=
 =?us-ascii?Q?DfTbD6DqcowFc0emGPbGdW9242X8AUnQW84bjZXqAKqhQJXjapfcSRSnuVLI?=
 =?us-ascii?Q?IdTNYlWFXtCsr/fGbSoshrPLqaarDERoaloJSjHDem3O4j5F/sAEo6sr5rn9?=
 =?us-ascii?Q?T4SUkKFmHqCm1mVtP3u/38J6T0Pi67HQ6xx/Pi3U0hHxK007GD38f2E4WXSW?=
 =?us-ascii?Q?aooFlXWWlZLHwYGfu7xMEXDPODr6DvX29BstpCq7bF+I30TlGca8h1tSfD4o?=
 =?us-ascii?Q?gk1Bg2v5CFaicR37JWuIHmgOhhKII4DqdO3mUl+fCiFThkrlfBfDyzNvhbTD?=
 =?us-ascii?Q?UBfwiGN7yVuU0TKuKNldUPuNAPw1qF+h5X1lobPuFoVFv/WQSUxp0UriVO86?=
 =?us-ascii?Q?WH+CiSvKJ9eG3nj9AEMV7aHDpbSTUqtl4TxNVEU9yxRJtBuQB0vaZxXrUdFj?=
 =?us-ascii?Q?L+qtiESd5WByIVbYJb6MFa92?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d5kEp/pNWKN8wiajfGCbCDK7MfKT/zEZ6B/EHqFpikrL8hAvPivAdNlrjRyi?=
 =?us-ascii?Q?JO8BFLO4/YP3F4vrvNv6zgyUdNd1KNyQ6FALfWtfj8GeAFY+tOg7DsmzyHIq?=
 =?us-ascii?Q?f9I7lrdrP8H30eaPoJqKdeAekkmU7Buw1cVPinwZMYEcNIP0BhYk4wEN3i14?=
 =?us-ascii?Q?VAvC4bonf/X3tL4FeE1XwWL0Zwao/DS5gwMOJFd1je5TFCkDRdsRSJZfcE5J?=
 =?us-ascii?Q?3Oey9dLYJUFUAq3hEeA0GQIcqTXgruVkeU8jm9vx4coLXZNTm97ezq42ymPF?=
 =?us-ascii?Q?mrMrr+aH5V98nFGicTSrpU39W9Sj0SCZObd1h2ctdA+DIRkRdyJuxpPwstG/?=
 =?us-ascii?Q?qMqpRX0OvmAS3eNq8UBVWQJE/Ste9LonMcV7hDdwAGM/8B6gNGxTsy6rbOlX?=
 =?us-ascii?Q?iVNnpWu5FYthvtL3+mhJc7bV/GBRcQfj9ZYggD3cwhMiH2pRi61njmlVfT5k?=
 =?us-ascii?Q?NK/+opCl6wj2GmWvsBB3lOfGmjXnhGNPMCDrl2GE8sQXV06TH9TRn08O+Cvm?=
 =?us-ascii?Q?NVuYBmZ6/VsBq8kvzlIOjUgxXPmnKMIlDdmsmmrDG8iF75mFypoYKX/I7yDh?=
 =?us-ascii?Q?q6ps3M5V88ouqb8pA0JyZpazGKGfcFBeC9jaLBVPVLtlJGnM2AD8JanOD+VE?=
 =?us-ascii?Q?nwm4qHMU1uARRmBUol6Qp/oKPnrkKy7BlAU/iPzdCDjsqJ2p+YrWu6+Ew0tC?=
 =?us-ascii?Q?E5/2EAPbsZGbRfhIhguSOBPSnspgRUnyw7xLJyf8bz0rRCDhl7O7g6WigzTp?=
 =?us-ascii?Q?VjyU0Ig5Q34xq8y7GnzBqQKiftiyehpMzN09cQ6AnyS02EI2NU2ksYV6pzCj?=
 =?us-ascii?Q?Kqw0czDBUeq3UdHqonNqwGdGXlQaf+Vn3hqU9D5yMeIAPtSvqet92lt8X/gO?=
 =?us-ascii?Q?j72QkgE69Bjv38frHI8STYBwax+OdzloGsk6kG35RgfHT0TUaf5FvfVT0kUN?=
 =?us-ascii?Q?4Vb7bN4g2HMFZJLGzBkBmHYOJoPVJBYkClVmB/N8UDl7SwESl2yyJejEGbsA?=
 =?us-ascii?Q?D4+KJMUfo78mgdHiHE/bLWDTvyyYH2mcCYI35+u/HxX4Mcj/H4SlGrx8N+Be?=
 =?us-ascii?Q?oQlVket4WGQCDbFVusD4+Hkm04TNKWiMNOd1A8FsVjQ6Y4Mj2OLRCXpYvoUq?=
 =?us-ascii?Q?NPbwiu/WegO1sn04iaT1mEOPMov95YLK3no0f+KHeU3U2LM4LeH/LDFNLkRN?=
 =?us-ascii?Q?hdURg6d4B0b3gZ7stbx7Dp6LOEC+21SksdEvKBgVbeyf24igO3+uECnoOIEX?=
 =?us-ascii?Q?mAAph4vxU8oCXTLui03XeDIhmIlkfv7NIdPCojpLCpI+CXmanvWEetdqsZGX?=
 =?us-ascii?Q?RFwEEr5SXUJD8nBDXAP4SaiwAaTc1VrXW9qWvuBh8mLZ/stX1QPYKMU2wkvz?=
 =?us-ascii?Q?n6YMo3RsvgjFm9ogTy8RVxzYBETeDLXIcINWY1mkOAtVuRW4+418YEq1pdkO?=
 =?us-ascii?Q?l+ejcpKmX2E1vpA+NnZNIbsmk4mnbOEq4BainY0dC4Df9S+T4zpXC3E2fLuT?=
 =?us-ascii?Q?gNzRqkf5PgvYei/fdLO2psVHikGf7AZe5fYE81W3ZqGQNPCFPmcStSAbk374?=
 =?us-ascii?Q?bNDA8Ayc6o7V4ZfsaYJRxpqPbjj3tYj9uVpjhIAxag3mKYvmVKR5qN9xXF5B?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c0329d-d28d-4d19-e76f-08dd0010acd4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 16:16:17.7202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g1C1uskl70WEz6HYdBNOgUNkiecwrw2RgGXwwDrpz+yyRSFkxmnzz4iwaWEVTMNcROaTUxpYAHhj317JlwUlBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6233
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

On Fri, Nov 08, 2024 at 05:11:56PM +0100, Francois Dugast wrote:
> Use fault injection infrastructure to allow specific functions to
> be configured over debugfs for failing during the execution of
> xe_vm_create_ioctl() and xe_vm_bind_ioctl(). This allows more
> thorough testing from user space by going through code paths for
> error handling and unwinding which cannot be reached by simply
> injecting errors in IOCTL arguments. This can help increase code
> robustness.
> 

Let also add xe_pt_update_ops_prepare and xe_pt_update_ops_run if possible.

Matt

> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 1 +
>  drivers/gpu/drm/xe/xe_pt.c         | 1 +
>  drivers/gpu/drm/xe/xe_vm.c         | 4 ++++
>  3 files changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index fd0f3b3c9101..b999db5f5c19 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -240,6 +240,7 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
>  
>  	return q;
>  }
> +ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
>  
>  void xe_exec_queue_destroy(struct kref *ref)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index f27f579f4d85..e111698abbd9 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -136,6 +136,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
>  	xe_pt_free(pt);
>  	return ERR_PTR(err);
>  }
> +ALLOW_ERROR_INJECTION(xe_pt_create, ERRNO);
>  
>  /**
>   * xe_pt_populate_empty() - Populate a page-table bo with scratch- or zero
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 624133fae5f5..2e67648ed512 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -740,6 +740,7 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
>  
>  	return 0;
>  }
> +ALLOW_ERROR_INJECTION(xe_vma_ops_alloc, ERRNO);
>  
>  static void xe_vma_ops_fini(struct xe_vma_ops *vops)
>  {
> @@ -1352,6 +1353,7 @@ static int xe_vm_create_scratch(struct xe_device *xe, struct xe_tile *tile,
>  
>  	return 0;
>  }
> +ALLOW_ERROR_INJECTION(xe_vm_create_scratch, ERRNO);
>  
>  static void xe_vm_free_scratch(struct xe_vm *vm)
>  {
> @@ -1978,6 +1980,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  
>  	return ops;
>  }
> +ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
>  
>  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>  			      u16 pat_index, unsigned int flags)
> @@ -2697,6 +2700,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>  	drm_exec_fini(&exec);
>  	return err;
>  }
> +ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
>  
>  #define SUPPORTED_FLAGS_STUB  \
>  	(DRM_XE_VM_BIND_FLAG_READONLY | \
> -- 
> 2.43.0
> 
