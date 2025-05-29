Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFE3C54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 17:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559D510E032;
	Thu, 29 May 2025 17:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQvrjEF9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9312910E032
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 17:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748539595; x=1780075595;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6LmADvkJCSFdOV/0nlqCZaocSH935cgJ8Z3CH1396k0=;
 b=AQvrjEF9taDdmoKXk/6Uc/YMFaweYIFJsdmdFYEFsXfgPqJlv7ncOy7j
 tg/j1tJJSmhmlo1f96INu/vCNUfVjktg5jeOo5blHLceJ84zL0h+/a0Gm
 +lF0atxrEc9oOKl4sfM+ds8jtBCRMS9x5zrD5MX275jlvL2NuB2xTCB0A
 Cr0UDemgOHYsHL14Nt3ydCgv1raraPo7IiBcmqyNLvUy/u/mXZz2T/kkj
 jBhrl60XqjRQWPyJLtP6mej08pSKJHN+SKJTUxhGeKD0/rv1tOv3chBL/
 x9bsfLGjAuxxTBXQn0mpcv6iZVc0Y5BGUsEM7L1trOTdrw007kaV5gXhh w==;
X-CSE-ConnectionGUID: A9KH3jY9QY6mQZLQd/Z3Kw==
X-CSE-MsgGUID: RvpM7XJ/R4msQ6g5pMF/cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50501594"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="50501594"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 10:26:34 -0700
X-CSE-ConnectionGUID: M944Be/BSfqdNxP1xC4iaQ==
X-CSE-MsgGUID: aFMJMHvTSOKr2VXsS9+bVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="143455603"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 10:26:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 10:26:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 10:26:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.68)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 10:26:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQnP6lEeGs+KMHzIlObdl7ypPKou2xlPM5BV/Gtw04q5pgtM/IwxF2Hm8Ss9dS0ySeJa6qgelkp3ykgsuWqXsetKbsl5FAHUmDCXb1MzjukjN67oZwit3VImKosBxz5yJAvBaX4ObhPu3OLK4KH4+SiUCe6p9AkKLaIjTxe/kP4bWznd8Hsmz/0xnI4k3xZztg3uzH0ddsiYcE6PUtd5wsObMKoOlkkOKeGTuT5KllZ8+xgEdRYqQ6G/Z4bR8vdF8hW/4ylfBSCF4kF1dqsu8xb5TNz4lLIkUfvrkRV0XVXpT4E41HdgAydsn2HGVmYBMN2YRgk2Bg7jKqAd2FSgFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bm/0e/3sSxmXfBM9YdNVDY90p7La2euQxYBRgN8mUQM=;
 b=dg7R0nYQbMTI6ijqAQVoaoOeEJaQQRBryC8PYWc7y7Cw1kCExRmdWz/DD0X+xz9acP2zCqIBUULJRYZeK7bXozzjRcF8nZRAUKe0w2PFBPszutGRf69kOghig+v5x0yN+VcOnaRpajgTieX20a8VhLyI+8uL3asbnkPc01D2oFS3C7OBvtWFHzv3LeuAQ+bRA6UhEaEDyC4SCF+9yTc40Fmm/x9bDqFFD6LpF7z49dZd3qd/LC312li3vDhjB1JLJ5GjGZdzVNFwyGqjfThEUrU/MutagmI94gar9idjDr21tS7t9BkItCZ1qQNQb5HUTuhpMMMx8g3Y3KnxshAgbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA3PR11MB8940.namprd11.prod.outlook.com (2603:10b6:208:57e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Thu, 29 May
 2025 17:26:31 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%7]) with mapi id 15.20.8769.022; Thu, 29 May 2025
 17:26:31 +0000
Date: Thu, 29 May 2025 13:26:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe: Do not warn on SVM migration failing because of
 64k requirements
Message-ID: <aDiYxAzsVd_IeOEb@intel.com>
References: <20250529164338.1745515-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250529164338.1745515-1-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR05CA0161.namprd05.prod.outlook.com
 (2603:10b6:a03:339::16) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA3PR11MB8940:EE_
X-MS-Office365-Filtering-Correlation-Id: 8392ba81-ffe5-4d40-91f8-08dd9ed5f3a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W8c4aTaV2dA0u16fOw49WlDvT0HZ699zHZkg52mXuOi1n/USvrGNQ6SaAWCx?=
 =?us-ascii?Q?g3d8oq4na78y0bhuL1KO8bSEQAlCj95n/92ukvqwFhSDXHOfHNt1CruA69Df?=
 =?us-ascii?Q?VkACWnVEAHaeUGserG6z7qL4EbQF9kEsQnpECUvLPxpuLMfch+lCTeQq41ez?=
 =?us-ascii?Q?9aW5mjOzelmW4r8qFkNQmMdW59HsvMpw/1MHcWIVGGFAC/m/06SQYbVVw5kN?=
 =?us-ascii?Q?8+UqUEzoVgcaVjeynuFnv3nXIxyaBWJyaz+Ie5BFUBzt65G8Mtntk5zxdF/v?=
 =?us-ascii?Q?iK2nMiT+RlQv1EDHfwQK7OKakBfoIPPOUCWXtwqYz59WfE+pgt18ICcGL7w/?=
 =?us-ascii?Q?Cog5Qt6XaDQolf0lVxGVjdaDvhwXdv/Ir1M1eNw2KxxtHIFG02Nzz12CI4dA?=
 =?us-ascii?Q?AUCvLXAEPP+IaPN2mhkp3je5LUGimwNB9jbMGOlOJM1MU1JDhHxHn7TMusz5?=
 =?us-ascii?Q?ZWrSw4+iNM1VLSxHfKMh4/t6agOtkxxM46YIowfiHkBcLLQKaI2E2971+AV6?=
 =?us-ascii?Q?DZ58R+WrbUXiDCPXHj8BzWfuxXZFEJWyxVrfCMY6xOfV3x5ZW2I/4LLPMheS?=
 =?us-ascii?Q?QZdFgsBI8vPxnWALB6TYBuU8vkb6dzBKGWQUSvxRtQHnVpX/gZe6jl5AyGWb?=
 =?us-ascii?Q?U5SiLIDLl4dS3C8CxlUuoMEYAL20mcdDh2gjA4PX7x8yxSR5RQ3VLh7/UuOp?=
 =?us-ascii?Q?xcYvvIvWdBJ0IJcuWig1Wk3vT5RGfR5FSflOqHdxtVSxs7I2klt42QkXzE32?=
 =?us-ascii?Q?NdOe3BN/x+FmSOdxlUPfvYoPaZloLcDmAR95xcT5NKrNvdvbaye2oS+hPycC?=
 =?us-ascii?Q?fpVQjrLq/F8ydLSk9K1paQY3Ryh5iwGK7BcXMvg/ilLk6kFC1+CpOoHJRox/?=
 =?us-ascii?Q?BiZr7J5J22cIOCYEYb3UDuZPtjdTwDCbaMD4fOMATbQJBKP6g32ZSYZKmC7i?=
 =?us-ascii?Q?GWLznvvF/TFfSlkn5wEY3EHyKu8QWxw5c0xuqpaB8SDljsRKZs8wVCDQ5J9r?=
 =?us-ascii?Q?o4qXAhME3IFfHLsL+AesU5s0xbUTM4ZZbnzburwAr5E4AtlqO7D+yJt6yBMG?=
 =?us-ascii?Q?gTZF3Lbl7ipJzTx9a0E1xHqm9DiRulelX2VOqt//3visPp26mwfaFXS2af3m?=
 =?us-ascii?Q?IeEnyfecaqVAk91KgurZ5cJgbh4wrrConY4WjmmDqJPFdptnMbnq5fhwj/Bi?=
 =?us-ascii?Q?emRJpiPGED7OVLJi25CWLteFmTEjueQiTFV0nzKBuQfYeZasU8Wa7RxSRt+D?=
 =?us-ascii?Q?s46t7n64uxHZEpB3HVwfO4IpavODXCSqh10adu60J9qJIVnpXONAqBFNNlkX?=
 =?us-ascii?Q?uvUkuCjUvmlWg8xy46t8yijMWkZz4b7mfubnm8Cp4s0gu6bO6aXPO/9aAD/K?=
 =?us-ascii?Q?PfJ1D15MHLoyDqwcABBt1S8nzuv1OX3KkqoydVbKOsPY1MJ4eTq8Q7TEkI2y?=
 =?us-ascii?Q?SQrIjkMxSoI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uK7RRic9puM/D0lzyPgZaOymd9wSCU5o46ovwPqlpM1yJQ06GlVIEird7LO1?=
 =?us-ascii?Q?wq7xgYItRvEl7UeocN9eEebchPqol4s4s6k+0HW9Z9nELEYjUtNZLEoVAR53?=
 =?us-ascii?Q?Jftc/BRVRjoJEpYXMYBkv4TChvRy1lXzhsnDHoQWSWR+MXmTQ0R/CyX9q5es?=
 =?us-ascii?Q?p7pcOqH6+HUC87+v8ob0+hP/WW2ps3w7tDOF+232U2dBQcL6DRxgAZVgDnIV?=
 =?us-ascii?Q?fjkOCOuHXZXjy240Rm3qdwk/63ejDx+EiZMeROKqTxn+cK6jMahNslFIYw4m?=
 =?us-ascii?Q?PLYAfLn6wI/JTIhKLChnW2FPVFyzKnWlIjMYpiZI2XjGqFcHP7UEZ9XiZ7bg?=
 =?us-ascii?Q?xUs3iP9dsFj/0h9J7s6u3lKIu1QfSTaKR11wp+0ivVO1zuFZHS/1RMh/eb7w?=
 =?us-ascii?Q?v3MA1es2tGpoKSabDuFuj7YUrC8bLjl+skHx62smErmsLQ1QK107poJ4lxqq?=
 =?us-ascii?Q?EUk8KdsbmQfIRs6sdST/VGGuhAxxWhPimThEyT5zmakotg16JyCudFMKHU45?=
 =?us-ascii?Q?x6PVKn9QzewNFzNS7lfDRbAfa1E6UUgzPtAdHFXXOFOKWnICxFFjrACwulKg?=
 =?us-ascii?Q?ofEQ97KE/po12nxecbJi1qTE15X4kb6hdqyBoSEYC4qtS+a+uSXrgGqUIyhx?=
 =?us-ascii?Q?zSs3ce5ak06kJQWE/nPNm6FM1SXL+Soqd6tCrzS7tRJxhXQUYB/G2dFFEDLA?=
 =?us-ascii?Q?Hqhvlhv3GrSn82EMrm4t6+2hQscA9XczD+pn+4rT4eebNWn6kATlNCp5ABN7?=
 =?us-ascii?Q?BsRcazTL3XuYbICAviLO0AK5aWPzeqD6fbAy3vrebBVzlXWGhodEMCRGgBGP?=
 =?us-ascii?Q?XdmDypBzo7w5bisl4F2oie3p9AibGfMhQOW/Wf47WC1rSdu99QZWAhBN4xgQ?=
 =?us-ascii?Q?e8EOGD1jghzDvot5LX2dy6pEgGq8bwpF3yJV7XMA941fk/ChIC4NqsmrmYRy?=
 =?us-ascii?Q?9ncj64Y4MZlFYcez7H5fzeBZJ5I6bCcncP34liTi1MZdoaB7FsXcnWa4EGyY?=
 =?us-ascii?Q?lvfLr2yMJiz/lke2tyczYi7gqBRSf5fdfHXkMTYGP/m8qdSXwzgoi0s5r/8R?=
 =?us-ascii?Q?L6MJtnCA6znRryMjbtZ0chWfuwuph4mfJ3OD+mVLhb8uTJ+9DrrVsO9Diz/U?=
 =?us-ascii?Q?UBSC+YA0cVuPmhsBzBc4Dz34VlxBoHJb3/gdF53NGZH19/cV5hAEKE7UGbeA?=
 =?us-ascii?Q?EBk+Ju/WlXF1GPzj6kuHNVxr0FqxDKYZXeuWgGOWykz/uM+EcDfMZG9vmhwW?=
 =?us-ascii?Q?vh1up77XfM5RiSA/lDe1v6er4Ao6andFwmCLSOqfucnaODCmSCV+PGwfs/uW?=
 =?us-ascii?Q?XbuwJtf93wzw2xaAwbIKo80jJEtN9HkUahgopRd1CFv2z9hzHz4yekH1F2dl?=
 =?us-ascii?Q?9gHI6wwyuwPOUwgIvsf6D/T4afEAqMlPLhugPX/FeBeXJZFNd8R+eBB13j1i?=
 =?us-ascii?Q?05voBw/JRzGwlBzXNOWVoweamGQDANzT3UhsmF6/vZBHz4mC6mV/fdI2GmOD?=
 =?us-ascii?Q?v2xZzNDMmj5V25qtYca9hrCrVQ3t5/6SdVsQ4ZOJhHMmO6y3d6UHDEZOrOgO?=
 =?us-ascii?Q?6+nZFknxCyoNZgpJ8ycCzyl23Vj9e8THT242828GxRAUBmyccPoYdZ4G/Cab?=
 =?us-ascii?Q?GQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8392ba81-ffe5-4d40-91f8-08dd9ed5f3a0
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 17:26:31.1271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEwnOxhfnzw0x26Yk/7mjmaaOmbFZTkAfFeQLALskQKSu9arqVyua5ah3NkpqL/WgbMwwbcGOpOW/Xl1MYYSRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8940
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

On Thu, May 29, 2025 at 09:43:38AM -0700, Matthew Brost wrote:
> On platforms which only support 64k VRAM pages, it is expected that 4k
> faults will not migrate. Do not warn on this, rather print a debug
> message.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_svm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 871ac81bb04a..f27fb9b588de 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -821,7 +821,7 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
>  	}
>  
>  	if (preferred_region_is_vram && range_size <= SZ_64K && !supports_4K_migration(vm->xe)) {
> -		drm_warn(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n");
> +		drm_dbg(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n");
>  		return false;
>  	}
>  
> -- 
> 2.34.1
> 
