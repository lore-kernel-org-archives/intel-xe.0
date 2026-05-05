Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C71DCD3427
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 14:12:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19B010EAAB;
	Tue,  5 May 2026 14:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZyDOPW2a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544A710EB02
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 14:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777990375; x=1809526375;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ZbF4O4IK49q8j0XkWoxRTS+3+4BbrwOqZWrjJ4UhBIU=;
 b=ZyDOPW2atvFfCj8/AukAqnOwwahh38bzzwMZ6K5cYXP5nfdxPkvL/AuB
 28KKh5VKFngOZIExP7Dx7paHQD9Gb5UIz5eFPmGkT1wxRVcnkoFsPVovS
 pSnhvWd75ivzeB0w+4N+2UDKa3zX+gPFkJ61VnEKgeWZf7n0u/zRXPRZY
 NG87txeg32/ZNgQ6/ygmf9+q02XBBEyOupoeTrDbM8Voh5F1O0X3PLXrA
 4lb43MaczOWQ6jDaQyw56xoqcKbTip7rJqZ4H9HFtbUXji96U4jMSE8x9
 E4WTr5IaIPOgqppQLDfDlCxm8XgIlnUJLHmWEOMsBP+Jyyhr6YgzBiIf6 A==;
X-CSE-ConnectionGUID: dI7Y8o0rRyS/ia1Q0Uoj7g==
X-CSE-MsgGUID: 8CaPtPC5SuGkPvAhzOC0lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="96287839"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="96287839"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 07:12:55 -0700
X-CSE-ConnectionGUID: qjhb+t/xS+WLOd8p0C7G5g==
X-CSE-MsgGUID: 7rUYt1LiSbKoDdVIULbQ4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="235693176"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 07:12:55 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 07:12:54 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 07:12:54 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.17) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 07:12:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8+Avh7hPAHq5cdAyNwzhfthCFnNwbIMygj1qldwDa5hWwrkFDCs6brP1J06icY9ZxVv/h1+YUaPAjgncPF2kmBkVgCpbIf7QM5CG9o4JdaDfcztq56v1eI23fHPyILC74P7p9mLghPqpfWpBw3Zv1UJ9sS2L6aW9SYoeJ6/GaxJbSlvft/EB3xBnPaqDy0ZPpoXD1YjWdbvEPELkp7F0SlmprA+LDQ+033CZbA/KOOmEzhzBrX++LkHlVFHyktsZgZikupaC2G6ldRX4JJJTy2gFxjL85vPx69kVLKdkm52rshX6sORw5nov8QMU04fjJW0Jr15vcRrKhj0M1hzPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wp7F1iO7qLaWISNgPOL3Z8fIrlAHK9dibDguCB4KG0k=;
 b=gK1Bdfh9hW7lt2/xaxo+qJmDf0mcFKjjmIEWysulq+ZncEro+7iPz4+ELm5QQMPCNTx6wA8A1n0uLYrjnmxDwWCWmyVXFkBsB/YEpwM+xl2xjVgGVoaU1ZAmg+9QfMm53iof0WkPTXbMNzBHwEyAkPhAw32uFqMkgaiSOlrGD/VvWgE/q2zGm7nyzMD819C1RJTNtpKx1H3pXaf8ckhfM65IwknTNLQkgCsY3CmWWP92d2eKc2obuAxcCu3uPnXb9vv5I8qBLCUvH2Z+/rmrextWPBgIHuDlAGofvJ/NBtPwpsEPv4IQ6NhocRTpBw4aj6IDZXPiDciLlwCbT+J1qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA2PR11MB5210.namprd11.prod.outlook.com (2603:10b6:806:fa::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 14:12:51 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 14:12:50 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH] drm/xe/cri: Add new PCI IDs
In-Reply-To: <20260505074855.3813063-2-balasubramani.vivekanandan@intel.com>
References: <20260505074855.3813063-2-balasubramani.vivekanandan@intel.com>
Date: Tue, 5 May 2026 11:12:46 -0300
Message-ID: <87tssmx7vl.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0092.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::33) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA2PR11MB5210:EE_
X-MS-Office365-Filtering-Correlation-Id: fe04c6ca-7248-4490-9ccb-08deaab06457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: o8n7FHBaQl3XLnVVCkBNwFhCC3vHf0bzRVfv/QHDJCfXIz5BGlRqnoXV4txMpxGLmFTkoNqUkrRWnaGZ2gu3dqnJlRjOUM3Z6srcF1qk7J+JGsElzfJgklhOhsQrDyFUhnwBj1UtvR/ugVyR5mGGfbm1uWSeRZtjRY9crzaz7GyBj52oBmLw4SV6w+ftuYn5y0fxi2qbjIyUMWCpFSBAdYl08BI3y18pDn7O4McWn+JGVHOoHLWdSkTlYS5BTHUwJjWZW+0nd16wRrnKHCm2uwvDvycDngZvcPCQBlGiBdlDEKDxQKMOlkleZqHXey5iTkZ1XREaH7RZ0KgMfYJz4ONcbrKsU+qya+YrStowMoRqkNBbvqJDOKHTBgOxXF+M10N1+VaTgOX/nUFMCqe4Fhv6ER3vnEemKWwt2kNm/22A1z7iW3d9HPvLQcGHHWeIy0WbmX6znCRujezfEIznhLFmfnhMtDwa8uvJbD16PhbsJOeqn6pdU8gZSsiQuOkXHjoSs4OqfL177DMyB69D6uVuew2c23TxZiDM+mG7z56EtU2vnqcqRPPYNS6WBp5FkUV13G5uRJoEWUoKHW436t5KHIQG2BPrWvIspx2QbTvj5sroM9/kXpoYUtftAiTJgbV2GpQ4q1Z8h/DiiIqWz10MwWRvWv3WdNmIYh6dsnv2taaYnBACtEZnZKhDVhhJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/msWBMd20PvjhAkG4WW1fZe50aLvgk8oqoAbkkjcCCYemnLw2Tl8eUhtTCGz?=
 =?us-ascii?Q?G9olinI8xJCmFSLg1rbPZn0F3tQOrmE0KxE5BSl/g88bkaXc5iXuPyaecAFe?=
 =?us-ascii?Q?omGWxLd9+guC1Vwrtm4QokJ7+2RTpHgeaRbwONAV6Df5sCuV8mZQhNxSDmw6?=
 =?us-ascii?Q?Gygcjr15UBEaiDpQ6M/w0ZFaFFNWauKEcmR46o11HPc4kDwPDs3LUl2BQ8zo?=
 =?us-ascii?Q?I6rh9Ih47ogeEZzZhXEvOr9Swej3BVIXQ87ffVLZ+HiaMhaVooyjPBS+QoGr?=
 =?us-ascii?Q?ziNVK+gr3+RU2M7qUupb6Ay1/LMK4Bu6zbLvf5RMMObu3wRsUvY8P9S4kLHF?=
 =?us-ascii?Q?hI0iqG/LcI2AMEuNyt7oMAcx5MPmsR54lwcaq54+pw91wNiXNk6cHweoDA0z?=
 =?us-ascii?Q?tN4tM6FafKMjpRY/t95+DFaBCcpH2HD/O8F7THm+nZIdMc+wD3ZQjoD5vCmg?=
 =?us-ascii?Q?xH+SAq+iijU+8VtQtIRoRBHPZ8q1LcOFd3LnwfdKedizx5gkruqYJIviL1o+?=
 =?us-ascii?Q?4JB6dRgZQd8NPE1eCPMyFWmLbG9qlHlK4kZQ6ToN26hMd7y9flVIDeRUbiZg?=
 =?us-ascii?Q?hYFjtueElrA979hWRzEipPZ1PHsHmgjWDNzJrOCcAhFUpyU0bEzWAryyf0hf?=
 =?us-ascii?Q?XAnf5ecH1Y1dMCOe+QzPbxsyM/Py2LXZpgkCv3/7D1PmYp+EPCfSBp3s4S1N?=
 =?us-ascii?Q?01dJjJO5ETCdb/TdHaF9VHmnyQhNPxSlaCnFOJqYmiuBXo03eveCvESn4ahN?=
 =?us-ascii?Q?ckFDTmMUoUEjLCi0lmnirIerECkNwrQxKPkHvozSpJ0gnboCS9eG+ZkMiw5y?=
 =?us-ascii?Q?RjVhWI/dzJcHazIowIZpC66uCvpfGp+CekZkwM6P+AhBAzDYouQod3IjWbyT?=
 =?us-ascii?Q?kM6GGEUTfS2+jGwDLWIw2xtYo27gr7WhT59ihTzXznB2Avxg0Mr3n8P2MrOL?=
 =?us-ascii?Q?cwNMV/mbFFS9pHao3QKT/OSTGiXUYcZwM1NFqZ9t71AqFVvi3W2C9btcFW4Z?=
 =?us-ascii?Q?C+6mZwOL+hrm8ofU8sGipsRInE/YFTi8p67vpHZSPvHxs9qL1qPKJDTEC+08?=
 =?us-ascii?Q?ZDdao6Pv8tLA4FjDT8JRQY+sQ3bVITSdzF/2Em3b4qOJZJcXk5sBQDllDC0L?=
 =?us-ascii?Q?lfjw7iQB1jywwLL4pVQllLGBdLWsFm37baKKAZRktzfo62b16AXHe3UgSqoS?=
 =?us-ascii?Q?66MtjSV9JOAC6LZHL97grmOpzZ0cdiYt2suV/8INWwOGM4wPsKPANTbjG86R?=
 =?us-ascii?Q?wt5QyyYi3RgM8EcYi63pbIzTr0HEcB4HqZtCtmX2Y/SlP2ez4TLzqXPnibjS?=
 =?us-ascii?Q?fUWH8WxgZajySCv8/Dih7teKzZ8PuZDGQM16YZ/C0LVRxkemMxFntR4ohAmr?=
 =?us-ascii?Q?u6snOiaSlwmYN+sFxeTsqk2SsBtI9tKCsPUUWKb1KPaFrDBq4YodyaXpmAli?=
 =?us-ascii?Q?Ai1ljQqmWMh2+tBHyYNw6TsWHYCSUV5z41E0tt+4rEclnZ74HdIXEa+Hx4a/?=
 =?us-ascii?Q?lWETuQaJAC6Dv4U+z7Qy6vP24QT4syxKpo4yYWHZBaEZub0cyGeT3AuwVZ46?=
 =?us-ascii?Q?bKDQDV5dKex0d4V33PnVrztScwwmB211hVuZXxa5kS/q6IXLBSYvUeDJJtve?=
 =?us-ascii?Q?QwHIxNx249lZV43SHWivojSdqPRB+64qRoWjxgBSFAFpGaUp+nP0w7r/8xgk?=
 =?us-ascii?Q?Nr5+ttlGtFuOjlgsd63Q1ZCJA8XcQb7mbDXGSB41FY0cE0sqy4rXePmDBbQJ?=
 =?us-ascii?Q?gdosN0gypw=3D=3D?=
X-Exchange-RoutingPolicyChecked: r2T9X/rkuWcZNvD2ST9ut7m5mVvMBXC++XIuL9DaPD3HcqqZqCXQfrtZ2GHC3JFl6QQ3am76CHRMBy0tIGKVsauuMPtBvnsyfVMyX3X4OOldcL8bMas+a0ONLk0Q3LXfxeHP6kgGIXZ3qj+5WiMtwuyYX737UzFxBjSGi15KZ26hoEXgnR7Ndtp3+Bcw5Bkw27QXM1O4xGm01xYRXFjYGiOLrNpUducPJ129HCYY7sNqeBCuQG9KJ/01Lx8tvXSn5aJRv7FZdevTAkKzkwUCFTgnr8RIgmIoDiYf40B2j6azWQ9mnz7HkCpOhUOQDzRVG4ZbTA++CM8zXEopUAzR/Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: fe04c6ca-7248-4490-9ccb-08deaab06457
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 14:12:50.8803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHnT4NCX1Vpj1mp1SzEmfpr2UKmlM3MOATTlQSCqtOwKEg+AkDSJ/xeZfKtAZ5hZyH93oyHPvIG7eselGq7Pxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5210
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

Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
writes:

> Add support for new CRI PCI IDs.
>

Bspec: 77979

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  include/drm/intel/pciids.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
> index 33b91cb2e684..e32ef763427c 100644
> --- a/include/drm/intel/pciids.h
> +++ b/include/drm/intel/pciids.h
> @@ -898,7 +898,11 @@
>  
>  /* CRI */
>  #define INTEL_CRI_IDS(MACRO__, ...) \
> -	MACRO__(0x674C, ## __VA_ARGS__)
> +	MACRO__(0x674C, ## __VA_ARGS__), \
> +	MACRO__(0x674D, ## __VA_ARGS__), \
> +	MACRO__(0x674E, ## __VA_ARGS__), \
> +	MACRO__(0x674F, ## __VA_ARGS__), \
> +	MACRO__(0x6750, ## __VA_ARGS__)
>  
>  /* NVL-P */
>  #define INTEL_NVLP_IDS(MACRO__, ...) \
> -- 
> 2.43.0
