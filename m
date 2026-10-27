Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07E2606A327
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 19:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cbgJrebB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E93210E46A;
	Tue, 27 Oct 2026 19:44:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3507210E46A
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 19:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793130291; x=1824666291;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LnViXwT52EY5PKNtGvFJiviy4q9uVu5nkDSrlnGG0+E=;
 b=cbgJrebB+dutWrnp01TCtQuWKCSDmB+cY5to/5pbk0O5lZebs+RdUN3o
 w1pllXIqduZB3iDRWOygbQmNyOmoQCuZN+P4w9Oj/CCp0ra3983HnOj7J
 iEPNTX+alIjvFYXuc1ckXHQ0oVo5pJxgy4I0dh8IX7yx+f3aI37R3M2LZ
 3npPEgTo7G5Ysz6G6ELyfDsjwO57tMpVHgW/456AMxCAjx6AsEEX1pvaS
 767bb8TBNN6+Vpv2PRZAkRVboPzWKBtfFkkkI8axR51vkMJ5HmB20FIte
 PyASpQkkU4ER0d1Q8OhGARC+9BljE2NgZ66WsFrEdX3gzJ+TeXPdCpiX9 Q==;
X-CSE-ConnectionGUID: LwZoZbphSdWc4L9n+hmKkw==
X-CSE-MsgGUID: fP4gE7B8QYKXH1AnRZ8qkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1750072"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1750072"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 12:44:51 -0700
X-CSE-ConnectionGUID: gKTbxvCZQ0GgoR1EEtkzrg==
X-CSE-MsgGUID: 5vIJKqE1QY6n64LXHYSzrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="5157179"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 12:44:51 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 12:44:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 12:44:50 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 12:44:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LpfQOg++PNkpro25ZK0ibFKFtr96knKpZKI9+BjID2mA7KlsBAXlp1uTTQpqeA4NPiH163iPM3rg/9Sskr4tkjhoVqCO3bIVSOCJVjDg83rOzSXMSE7pcs4zExitZyhVhX9wj93CSdlU7/SzNpzrmZe1mTilYtWljcDksBUmv31gmqi7phGXNw3jWWUS5QXB3PGvQatCBG1P5XfOL2jZGDkf0MfacPNTxWKth2T8Sk7VQG0p7hgWZoKbqikCfj31WfRRIPjUenr3KlSUGZ4ya/ayIGYbibl4/XdUAroQIOtTYjD0WlHYlJvKJe/8Au3nhbrvznZ1INmsmcd4ZN1GqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjsMJ9Ze0dbk1ktxnLhWZAzeG9tMqRewlddS2eR54h0=;
 b=iUhMNBTTzVBeCXjwWgiSGHNd/Yx6gqxi5mMmiAeMWImgT2M7MwvQJpMzr/XYkkB8rsxa3byt2OUprFye8uNEDsUBaf19/tv5WFkZqh7ntgxXEui0gqUQIgJhNQ48ltNuY9aMXMzDRwJ+Khaq1iqrTugFxGvKxPayXfG2jH3GE7VC+hhUxFKMwcfO1zbR8dl7YRgSuD6ks5c9xAx2xlOt1hpL7NfwM89iWOgVxlvkds5t6dArWp87PU6IFCc89ZNA0Ki9MGk5LpLOxqLmWbbe23xrlfuJ419vEminJXL6nVEq0JvcGlXpBipGkgTqY9RdUfHmN5qHyMD2lfrcNSL8NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by LV8PR11MB8463.namprd11.prod.outlook.com
 (2603:10b6:408:1ed::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 19:44:14 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07%2]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 19:44:14 +0000
Date: Tue, 27 Oct 2026 12:44:11 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 10/10] drm/xe: Implement Wa_16031259911
Message-ID: <20261027194411.GI203565@msatwood-mobl>
References: <20261023-wa_16031259911-v1-0-b0453f79c4e1@intel.com>
 <20261023-wa_16031259911-v1-10-b0453f79c4e1@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261023-wa_16031259911-v1-10-b0453f79c4e1@intel.com>
X-ClientProxiedBy: SJ0P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::30) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|LV8PR11MB8463:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de6cce8-f46e-4c32-bf25-08df3462ae0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10070799003|261021123027099003|261009223027099003|261021121427099003|260925021911599003|260925022911599003|10067099003|260925021311599003|56012099006|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: M0TW7OMhezuKEw3DrfcN0xIJ4Q7afg09hQSokppQBd2xNvmftEgsxGO2mJv+AzIAxU6iDOsUQ9G5/+hPwxgeL2t0LeoLyt8WW8rGn7uqcL60EXZWzhPAuGHddRTa7xXSOEulI59skd4sS8EKq1G0Sl/7Idr9dCXBguMFwD8PKIoh+CNF8YlhHBEf8Nn/FFAyoobnvOAsVAeoHr1COBT++wjgg8eLwJSSEYzE4/yqvE1sX32Nnr46zFg47/d/A/Mi0ZCb79uAYJvTjr++IwYshgrXMdqZFiiAIO2P+ihJtOEvABHCao852T41FbXhckXjC5xhA9xvdumNAplALD1LmA4opGaInhP95A4shKrTLy5WuOGwP+n9JHs9Em1VZXhfTqDoRgGfj4K5mPNFFwZ0SiMSD/bULE2ufC/nHkeeFgaTEFqJyE15TnahQHa54cQosU6Jjow6k0P4o0l7SuPQbQP0X+y7qDqvNgHXbwvC2bG79XwjrhZOGFIpdbXqcmxO2McHhpuPjLCpaxu7V3FAAMkvmNY4l2oZNge2xB1PuPF5prIHIg8xTnEB/WBJDU5a9TfzQau3u4+A0czYRc68ky0Ab/a2qQTg2jiWyIrWajJcUNIAGrv5bgH5baqg7J9GootnLdfvwQ8urb1/oCIQu90iUD2UJXUFKc+R8DCMpZw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10070799003)(261021123027099003)(261009223027099003)(261021121427099003)(260925021911599003)(260925022911599003)(10067099003)(260925021311599003)(56012099006)(22082099003)(18002099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IpWt664VwCVbKbBGjSycdThjbybYw9hAbW8V14x+dk+lsAusM2Du58vJkOQt?=
 =?us-ascii?Q?jZtclaCNFdY7Q8Ru6VB4S0Xx8RjJQ6VItaUvNpkbbM0QOnABfYt+2Im6q3ud?=
 =?us-ascii?Q?gBVES1SQ539ZgVMqlcvRTkutNuJ6bUVkrhq7hU2wz1NGOM3FEAnaohhWizIZ?=
 =?us-ascii?Q?PvokwcdRm1uUnlIwiUVfoxM/YrPw8tv3svBvYqU5TlM5gO3zUVw8GwOl5413?=
 =?us-ascii?Q?e+KsrDY055qTiAhW6qsceOlpFD54QzJN1j/7R3CLkFeeIP6xYeB58uUzw0Rr?=
 =?us-ascii?Q?FaRQtLMfrZLqp9xRhGX8NzZ2cZMbjTRfWFG/LA9rniNOE41Bjr/rbnYbvXUF?=
 =?us-ascii?Q?yKd9sA5jqOeGIWaPmc+0pF7GCLrz+Vh1+I/JvtGplSAGLy2s4Lo89uT5+96v?=
 =?us-ascii?Q?GOpxW+GuBfdoFV6n/h7j9VLT2wdV+bDOMl3HHMguF/v0RaDtiMLdlymg3ER8?=
 =?us-ascii?Q?rw9VvMqVdqMO4sHJUMQbc+5oVg6pStoM15K8bZW30VfKicAWqEUMyGRaA1ME?=
 =?us-ascii?Q?DPWkgWTUbYZDvm/zTeHvscN9xcQpF58+t4Lk145WMlFLg1Q8U3X5FP90JPoF?=
 =?us-ascii?Q?NZ0HNKFwXDUAwH8jzSjebjHz44nU18FNkrGTnIG4neGZx+2e1HRAWfDT4VsS?=
 =?us-ascii?Q?puUkWVsIwcvNg8jzuANaimjcwCrecvmddy0PzqshSUeoKTiZZMEndUwgNek0?=
 =?us-ascii?Q?XD7knyFpG5UhDs4oBOdwZ59PG02o1PhhI3l66HSpOFzSfs/MLB+pGlsNM/V+?=
 =?us-ascii?Q?Dr8UD+EYpOhta5T2lRh1i4sHP2XYVd+ubMPVwz2hDCJjOddOMhmX1b5ZCpE7?=
 =?us-ascii?Q?blTLwdMQiRxBUKR2X7FvMQT8Ncrge95xArfls4sX34QOLZzZQuYjWlxOcXk7?=
 =?us-ascii?Q?nSZAc+ioT8j/2y2ZbRsNRJmlzD/O4ICkZrX/mdNog8w0SNlCeFyJxPEXHD2x?=
 =?us-ascii?Q?efKa080+LE3lSQQJ97vYb55joPX/WnC2Wl6Kfb/1EMeNREYMO9kvbBOwgHSe?=
 =?us-ascii?Q?IlDCWRu2TKEviuU7pL6bkJZai6fWjTZOtxuokT3qkYCu50YMrKXk3L+YAVqm?=
 =?us-ascii?Q?ynyFUEK8eMXEyzy15eso3xHBPE+VnUcb/mG8NlMZuv/nEKstcOgGzdcjDCZA?=
 =?us-ascii?Q?igpCJvh2FETrILZ6nCGxS0WI1QkN9nZXX2sX21tixVCXXuH0hjYQyr/49G66?=
 =?us-ascii?Q?BQqvsE6Rguvi/EGGnMtBkicmba+Rwc7rh/clDwCSoAj5dQv8gJj6OxrwlZyz?=
 =?us-ascii?Q?3WZgjqWm9QKxu9CMTeGdhCY+yLwZbz845MEqwFAqwGDTGyJHsvIZmDmrLff4?=
 =?us-ascii?Q?Y5Wr7sPw7XT5CAwNh2qnFtrWUXcBr6l0bgJScHfa4+jp28ucUhswKqs7wehc?=
 =?us-ascii?Q?WVigIEoXkuB17ZbqZhYHsAUcwYbfP+4wkqqJHvilAz6pVyMRl+EN+2rGYEaS?=
 =?us-ascii?Q?Wnsb/ifXc8ELT0Kes3vJQWpWDU+jP0uTaiE4Rc4BW5tBJ3ImXHf/VD7iz2OB?=
 =?us-ascii?Q?LzgIK3+0KSwZ/17ev9LR04GRKENzyFqhSUQ0tuCNotX3gjdOJUQBxbWo2Zyb?=
 =?us-ascii?Q?MLJ2XyllibbGxy6AcssH154sxcmm0XZLdpZvaA8xm1zvsw2jr8EjWghZL82s?=
 =?us-ascii?Q?NKUdH/LmiTTXSbJAoQ5J7+dTS1AgwZvFD2ntVG3SmvEJwRIM6SjB7vQRetlG?=
 =?us-ascii?Q?Grqj2p/zPyVUckMZxUquQxaWzoUhaWeinWFSw/Nnx+MSB1d7U4w+GrD/hit0?=
 =?us-ascii?Q?Rlz840ABMYI8nwurVOLUKMuH97KajdZX2VySN+XhOX0xfpbRTy4VKpw5oZGy?=
X-MS-Exchange-AntiSpam-MessageData-1: pfpnvz8vjMJ2ilzVKBiTtzlj3pvLtct4R2s=
X-Exchange-RoutingPolicyChecked: NIWHGdijdbKbm4d2L07XrD02TtP1sF5VgPbB+xs4uz2Cghrn5aIwIDgRGqRc5VBOyVMTG2DPzEBZdFOLB1rNwbPREHJ5MA0A3YwDIWQH8EnDtxFdAkOdePkV2KoOh0ZVE6WNFA1WJ12eoIxvNMdnDZPeBcKgF5ZRQew8bNSkM5ZZJwIF+XbrrtWjFyRCFEMV53w4G6R7szXcqr4ncQhaLdEH075oCgPwrSMXIeFARlD2kndwxMperdyPWIuOkR8Hiev+Fc35zgVeu0osvvXW/Og64nMdmBdX2ehBbgspZeRuwCluq6KK5unLGjdvGpyBTdVvbewje5XgtSWp/d83mA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de6cce8-f46e-4c32-bf25-08df3462ae0b
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 19:44:14.2578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11TkpazGhMJyR7l7lCMKC7bLh8dJqG5lYyptROhuFZ8HJ3dcVrZVH42rJk8+IRkEEgrDFla3JsvTfjfKKiHA4mbCuVHu3ez2Gvib22MIsmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8463
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 06:09:38PM -0300, Gustavo Sousa wrote:
> Implement Wa_16031259911, which applies to graphics version 35.10 and
> 35.11.  The workaround definition instructs us to set the minimum idle
> delay value to 2 times the memory read delay, and tells that using 1
> unit of the IDLE_DELAY field covers that minimum.
> 
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ads.c    | 6 ++++--
>  drivers/gpu/drm/xe/xe_hw_engine.c  | 3 +++
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
>  3 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 2e738d205738..7f830122ae16 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -227,7 +227,8 @@ static size_t calculate_regset_size(struct xe_gt *gt)
>  		if (XE_GT_WA(gt, 1607983814) && hwe->class == XE_ENGINE_CLASS_RENDER)
>  			count += LNCFCMOCS_REG_COUNT;
>  
> -		if (XE_GT_WA(hwe->gt, 16023105232) || XE_GT_WA(hwe->gt, 14025941587))
> +		if (XE_GT_WA(hwe->gt, 16023105232) || XE_GT_WA(hwe->gt, 14025941587) ||
> +		    (XE_GT_WA(hwe->gt, 16031259911) && xe_gt_supports_multi_queue(hwe->gt, hwe->class)))
>  			count++; /* RING_IDLEDLY */
>  	}
>  
> @@ -875,7 +876,8 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>  		}
>  	}
>  
> -	if (XE_GT_WA(hwe->gt, 16023105232) || XE_GT_WA(hwe->gt, 14025941587))
> +	if (XE_GT_WA(hwe->gt, 16023105232) || XE_GT_WA(hwe->gt, 14025941587) ||
> +	    (XE_GT_WA(hwe->gt, 16031259911) && xe_gt_supports_multi_queue(hwe->gt, hwe->class)))
>  		guc_mmio_regset_write_one(ads, regset_map,
>  					  RING_IDLEDLY(hwe->mmio_base),
>  					  count++);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 18c8f88739d5..96741d3050c5 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -618,6 +618,9 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>  	if (XE_GT_WA(gt, 14025941587))
>  		min_idledly_ps = max(min_idledly_ps, 5000000);
>  
> +	if (XE_GT_WA(gt, 16031259911) && xe_gt_supports_multi_queue(gt, hwe->class))
> +		min_idledly_ps = max(min_idledly_ps, idledly_units_ps);
> +
>  	if (XE_GT_WA(gt, 16023105232)) {
>  		u32 maxcnt_units_ps = 640000;
>  		u32 maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 9be392bce969..a28552c09019 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -77,3 +77,4 @@
>  14025941587	GRAPHICS_VERSION_RANGE(2001, 3511)
>  		MEDIA_VERSION_RANGE(1301, 3503)
>  16030224309	GRAPHICS_VERSION(3510)
> +16031259911	GRAPHICS_VERSION_RANGE(3510, 3511)
> 
> -- 
> 2.56.0
> 
