Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43B8CAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 02:21:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8816110E120;
	Wed, 24 Sep 2025 02:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jvFsd29u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8DB10E120
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 02:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758680512; x=1790216512;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4IzSNJ0j0KA9Jct5xP4BTUlvE9uROHl+Ot5zpfRbLDc=;
 b=jvFsd29u+FNRJd6pPjeskOd7cDe00n+JOxIjHKxxlBKHkdohVhTLt9yo
 vtNvTX/40lTyfXbYLuqW8leHjx3mrq/wR0ETtKOyo2j2XnUPJZD+kanJ6
 sWib3437M3Co9f8XpV3L+PJQxNr2ZUPcIPP5HnsTOAAkB5FsSNmiVFPKZ
 pdqSpNp+pE8mHsPgCPlkwOAzYksU5VMowVOK5CaZyasdwMtkYZhIk61M+
 X2zQWOJeVsz4WUqCppzyKhhwHGOv6a39LXqMTGVeHXtRrS34Usow1/fJZ
 3M7cVnJv5ze7Q1ytzt/T0uPdfpQQIRDTonZIOmEV2f8DpEQiiLP4Wd8OZ g==;
X-CSE-ConnectionGUID: 1MAXOt2KSNmkPI+VnaMbjw==
X-CSE-MsgGUID: vrahbQwOSPiIrAvu8uZftw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61027586"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="61027586"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 19:21:52 -0700
X-CSE-ConnectionGUID: 5p17/XnpTYSctRrmKuhoSw==
X-CSE-MsgGUID: /L3e5HLuQSuCWB0h8GIFvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="182184502"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 19:21:51 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 19:21:50 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 23 Sep 2025 19:21:50 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 19:21:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIpxXJ5Sx3arWcS5/2G8U9T7aqRXgCpduAfe6zDKVgRXHk2W7AOg/dw8ZeLZEXKmsEMzdDYyu2lsOPnwoDTIiBGqA7BFivbTLxH4915vb3Wgq2rtpODjYslrfvqI0O8nnDaRJ0SPX2JHoKVGWFX7IsZafrRvvq0xN1a5ObHr7Zf/49m1zZ3RF5A9kAw784AeUT1+r6+wCLa8FH2fKiopXcRhS4RfhzhHDnOXkS6W/jLCxFO863qNLKbBHbqLA/8GiToZl8r4hqQUDUZozfqKoZ3f88DW8++0fXGbcZz1+trWX82yVTMT2Ji/m7JdvrcZjHVU/OZ8sakXlKqRfVf+7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNLN4DfVkGDV32evvLN9xC8F2JXTn8UfOuTFCnjPWxU=;
 b=mTF1pGHBDU65H0pZ+7OQkIW27BCztisNy/VX0mRn9xQX5Y81A7BSplxA/JPUHdR1lC9mDVKxUWPcHQe/1PZSD46nHb+YygTOS9QOTcA5DLu/59IMyapiCsnUJuLlTGBWZ+UrZCVQpBs80r5bvFW5a0n4NP5lZ5zYYk55cTSIW1pm5ny+8ypdkY0vCBSI++ZImuQcWFsUSiAwW5jsYH/sjIi8NVoIaw7IWb0tfrdgam1Te2dgyvfJa1Ap9mwusUGfEUZ13zRUf4gA1hm9goSgCqakpRB7nxzP2bN/bbvXW2STQLINDKpsIQUJkNM5Jvp5q7yCFhuC3DWdQNTkVmJuOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB8159.namprd11.prod.outlook.com (2603:10b6:8:17d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 02:21:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 02:21:48 +0000
Date: Tue, 23 Sep 2025 19:21:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 3/4] drm/xe/svm: Extend MAP range to reduce vma
 fragmentation
Message-ID: <aNNVuWBKBTXpmZ0Y@lstrano-desk.jf.intel.com>
References: <20250922104316.263995-1-himal.prasad.ghimiray@intel.com>
 <20250922104316.263995-4-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250922104316.263995-4-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:303:8e::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB8159:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b3d89d0-f4db-4ed8-53bc-08ddfb111d44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?9/tXCObVffq16lGSSv/O+7EwQlLoXEWrzOgnIdU/j35+o/VlI6FWF9G0q+?=
 =?iso-8859-1?Q?ClnygwY20hfFJYKP8yoK1Zu1D22mFqDHq5zL2TuNsqMMHG5B/xBizwtnJ0?=
 =?iso-8859-1?Q?ORGZ81j76R6+/bUsbRGOH5upyxurL+OIx7kj7eRW4ErnYfXx0/RUF5j8vy?=
 =?iso-8859-1?Q?5tGVDssGeUbj4qkNgpTVXjUTQ0pWWqbMbU6PuqwdUOjv7s22SAEBCM/Zo+?=
 =?iso-8859-1?Q?bJvT2RmMJgyiNWx7Qg1dXATy1SpOs+QR1z/FG2sbeXyOOuKoioc+BbkO7m?=
 =?iso-8859-1?Q?cqkvpCjpoGQ7+/gFaCmKmlj5GXt70Und7SD0dF6c0XI/yOVXu7KkFMGdjH?=
 =?iso-8859-1?Q?PTKkDiYSBTZoZQhZHU4O1PwvFw47rFtbeyqrdR5XdayxsAeyl5enqLQYvs?=
 =?iso-8859-1?Q?XUH7+ldp+gld5Gbe75VZTOuQGVRthOFOALY9Adx8ZVkazkCVIjoOyfQFPa?=
 =?iso-8859-1?Q?WwGvSE1JbqG5Fm2bONPQP6UKUQ4/ACBvmtLFe1Rtt+8dkfFUh2BGppevQn?=
 =?iso-8859-1?Q?zqu8flMPFMj26lDMhCezsfNy+jFCwRY0vi9qcCEOMWb1cWYNU+GtV7x6YQ?=
 =?iso-8859-1?Q?vlW5Pw3xvM8/thCajtu9ufngW5ET+e+XsQONKq1Xr0u57k3ZRXDG6jKvyj?=
 =?iso-8859-1?Q?t+7LdU/Y1uvQsLk1cXs8JUktwnmYpiwd69g9uv7+PHcaD97n3TP90Chr0J?=
 =?iso-8859-1?Q?wis7XLiO+NZLcwhAQQWLIAL6uOYOeeghBMoieDtjgvYqbdCP+zdyvkkm2N?=
 =?iso-8859-1?Q?xzFxGGuQALwx19EIK/0utb/kFJam6SsFCGfYwlZkkeCnR2DYg5AGLuKrvZ?=
 =?iso-8859-1?Q?Vf79sO9BuYFPqBaGZ3APimssQpvpNVmyIZ8Nmoimz1UeA5XDnfLgo4ZCbC?=
 =?iso-8859-1?Q?kgc4tqTJJ1eDzTSPjazmphQEgT3sld3iVEU23rLYROqKduRos4wDLaldsd?=
 =?iso-8859-1?Q?xPF2YIi3f4Yvbufc5yr33o+kCwganT3gJMga6P7Dy8JTRXraWHGadRinCw?=
 =?iso-8859-1?Q?RB0iLJmkPqSUWE+8DLJmSU/I5GjZMt8loWYLVXAAvivyQRQ3odGwPiPLhn?=
 =?iso-8859-1?Q?8+HrYE/ZOTNsuD0x6fq8kNW4/dlII0VWY2m1szhqkIEO4NPcdauPMjyVXg?=
 =?iso-8859-1?Q?v+jXIW3aHx4yfyHLC79HyWzn32ocdzL31+Cc638Kz7ig/mz4zxoPqYRLi1?=
 =?iso-8859-1?Q?WwPrVZ2g8VSsn/TjkGL/Ns0llfm9P3Z55WwoG5RNCwbNgsC30KW0vi86T4?=
 =?iso-8859-1?Q?QXtgAqkmNoSb55BXqrIe3fMxNzmIDYRH1avtwnDtc2IV0VjTxvKyusLnMa?=
 =?iso-8859-1?Q?+Fi+dKNQZVfbyVgPuWe0/dU4zj5n6XbjV6gPIET57srbk7gfyRsSsnBzw9?=
 =?iso-8859-1?Q?cTTNEZEKq2bsIus0u2Uk5assM0JEVJpePjTtmJLUtJYGtkYZumiCMdOb//?=
 =?iso-8859-1?Q?LWCYfqlfSlfeG8K0RV3ORKNTGpIiYC8eo7qFuw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IKbg5LOgWpCopU8GFRJ+CooCLxmPLMPVL2oJQrfjeMncXmxBMKFXbbUAIo?=
 =?iso-8859-1?Q?cNVBH38Cvf5tObOM1HVtWVR4XIutsife1vdQ4wu9mYxOWrcYlQVuAjsRWq?=
 =?iso-8859-1?Q?UjeDy0KzwfHo/9sb8ISLaAiv4+lKsJddtaM6XjP6hTK5zNp7P446FRxruJ?=
 =?iso-8859-1?Q?Dd8T4fxj9kRA5EKvxKWT55/iHwWv7lUiZglMwt+SifWiXNppZltRZiPtxi?=
 =?iso-8859-1?Q?p2S81jPfTtB6yewdZ37BusaYrXNtL3NA3SdMsMmhO/7NxIOPSlFcO9+zEi?=
 =?iso-8859-1?Q?VlzPxRIESIqwvnmU9mfiGQAa6FOuN1DlSVcLCbYNTvKpQKE7HxcyrPgeZA?=
 =?iso-8859-1?Q?CRRaATCSZZq+9ISm/IvsNwNz0IZA26VHjGK/v1OmaDILikRjB6+NGxqX1D?=
 =?iso-8859-1?Q?QO86gzsh+ugCM6qgOVjwWoCs72eA2BiRaPBDpydaaoufN77Twy54Ta3TsA?=
 =?iso-8859-1?Q?yu/QbZHWs+SVx9iGWNU5lLpAnMxxLobOXliHa4y5tB4+k4nNHhqDZWiLQJ?=
 =?iso-8859-1?Q?Ewd7RYOLOkqzQIjdhfd/Vrv7jxENqb2aEi9nc7FFsiF7tgqMrl5fxA1PjT?=
 =?iso-8859-1?Q?Q88SUDZl82jTLeceX1s4m4Z7Knnfbo73a6Cqht3QaQBx2UZJJnkzeaVJGR?=
 =?iso-8859-1?Q?iiX0kBMp8VTyhWThym1lRG6FhUvmdx6AKLmrLZzC2QTiPMuvKNImfZaBbB?=
 =?iso-8859-1?Q?xRUUGyxPsvlm3PLnQAJ/UYPxo4PaB2Z4Vqo+jeQcIomdGPPjKRIRcmf28P?=
 =?iso-8859-1?Q?v+9pCOgQkplcMh46cR1wZtvFRGxBB6gRQoWlvqqLmRpK6NzGtNLlfaR6yG?=
 =?iso-8859-1?Q?0mK+VBkwnNbItzyjYnX2oNdZo0AsvprcHwwkIe6RdkGzvwSi1U7MAKKLaB?=
 =?iso-8859-1?Q?pAAUKH0/JaedT1hUvsfymYAGyOu7Yi0/8LzWRT0e1UFHVqtN9mIyrgWfD/?=
 =?iso-8859-1?Q?VsvsP2LoI9muQlQa8IExiUoni+mmTw+mJUkv9xKlL4GW3zcURuQFxliNDL?=
 =?iso-8859-1?Q?cVLc0BWy+08uP7bDiHnK4lTehsVpX84xwnwF2k6+969GsVBxdVSxWbwBKR?=
 =?iso-8859-1?Q?N9sjNA35AgNgNSYQaDAXPxHEEI9II95W3Gv1lbe1VkJGgi8kxdXqnj8yJo?=
 =?iso-8859-1?Q?OXWmDK84OaBv5jZAgiNktadtxjjspmbligGENH3O33sxWvePejk8V+OwHB?=
 =?iso-8859-1?Q?cN1BYt0ghISNnJpoUtlMQXHLzTg/OKCHpRwnkApc1QmD7FOeADvIhuarNG?=
 =?iso-8859-1?Q?NcqnfRHLfPW+Mssh9zYUWCBVJ6KoAlUlgFszocc+hhhF1KmjMaWv8HEQXs?=
 =?iso-8859-1?Q?NF4jfFsqbZQ4/tlsOhDlnd+mdFGkwfOSviyjL/2KGeEAOT8vlIHLaW10AB?=
 =?iso-8859-1?Q?660bVuCIR2iD8+ftHoEJEPyDEIWDJ9fUIETrG3qzgfXgHnVVBMPfSCSbd+?=
 =?iso-8859-1?Q?urF9G9H6h+6PmvDitvguGsahH7YoyJ4e469yCV8p91LFrmwWQdqDiX6Js/?=
 =?iso-8859-1?Q?RDQqtv5JJIDWpoaLZ2VqlES2wVwqCmtG9aVGl+HX0C2Lo424+txaTSQgj/?=
 =?iso-8859-1?Q?JbVebq7uHiphnEVjmoWPkH3kmzYmlb+2sj/ekDzrR0+dPmjV5bfFe2As8S?=
 =?iso-8859-1?Q?fmAXgUstQqMkxvwH9ZyNZ0/MVFo7w/+0QAjqTxNl1gAwGtH3g0c2uLJQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b3d89d0-f4db-4ed8-53bc-08ddfb111d44
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 02:21:48.3741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6YIqvOZYUyytRCA8o3NPl49n9ycm9JIQ1eO6VI0OAPdiOX9bjAhb3gW36G3THj+vnimUMOAzg1hqs6Mu9UcUZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8159
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

On Mon, Sep 22, 2025 at 04:13:15PM +0530, Himal Prasad Ghimiray wrote:
> When DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR is set during VM_BIND_OP_MAP,
> the mapping logic now checks adjacent cpu_addr_mirror VMAs with default
> attributes and expands the mapping range accordingly. This ensures that
> `bo_unmap` operations ideally target the same area and helps reduce
> fragmentation by coalescing nearby compatible VMAs into a single mapping.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 246bff91fa43..198130f71e0f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2213,6 +2213,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  	struct drm_gpuva_ops *ops;
>  	struct drm_gpuva_op *__op;
>  	struct drm_gpuvm_bo *vm_bo;
> +	u64 range_start = addr;
>  	u64 range_end = addr + range;
>  	int err;
>  
> @@ -2225,10 +2226,14 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  
>  	switch (operation) {
>  	case DRM_XE_VM_BIND_OP_MAP:
> +		if (flags & DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR)
> +			xe_vm_find_cpu_addr_mirror_vma_range(vm, &range_start, &range_end);
> +
> +		fallthrough;
>  	case DRM_XE_VM_BIND_OP_MAP_USERPTR: {
>  		struct drm_gpuvm_map_req map_req = {
> -			.map.va.addr = addr,
> -			.map.va.range = range,
> +			.map.va.addr = range_start,
> +			.map.va.range = range_end - range_start,
>  			.map.gem.obj = obj,
>  			.map.gem.offset = bo_offset_or_userptr,
>  		};
> -- 
> 2.34.1
> 
