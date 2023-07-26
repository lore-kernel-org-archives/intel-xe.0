Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF95C0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 17:05:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C7210E02F;
	Wed, 26 Jul 2023 17:05:14 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0644610E02F
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 17:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690391113; x=1721927113;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QPoVIJncfWSbgRZ0llfvPFDqk9l6RqoMJNmqO78FM58=;
 b=FS+UU8FrfG1e3Vy5KXNHG7juCdf8X3pEIkf+JChq+H8qf8Kr60LCtkep
 AfAPhDjgqqnlwBZTV2EZA5qRWrujNcpJMsXsHNplm95DPyoaVt+48WwSz
 JfAREJPzSjJyiqzfJhV5ZneEjfo6hloD4/ZQYy+ylLsJNGY+pzEdKlq3/
 WMsZYFSx7k18wOEXu1bNiAnUC8snbT/cyRHhCSEdAMHBwg8z28C4rhkrl
 s3GagSaB5FlsULcFuvd6Gpew0xh6ny0O84CkMJBGOGpblQWmGDf0qfd9Q
 otC4uvYLqJLbl9LiQJ97P3Xq0uBG+CMkv+Tf2GK2bpqNRbCXBqdBozVJ3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="431877486"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="431877486"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 10:04:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="973199329"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="973199329"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 26 Jul 2023 10:04:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 10:04:09 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 10:04:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 10:04:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RXSNZuorcFjhKVDSEjgh3eMlk7YLogKTlH+syq+RP3RGGWMBmeu4lol0dYjmkHqqLT8+pZxaIuJDWgHZoS29aE62O/vGD1KJJWnwlXTlDBLmim6MzBJkFabLpULDwkSl+QEkFxP6PZCeAnDxX25NYCjnBik42mTmt4vJfNo5PTD/WHPfL6TOEZlURuXQWvEPfUq3SnMSTxAKiVM8MQ1zvyD72M7kkJpHzZkhBVdDLoHuo/OzVeLw4yJl57NJh7tQYpXSOeBTXyB1qmWAIKauJM8mErIJ0aszWLOJz5U6lq+UcEHl5t6LJ4flRf8dVEi8t4ZXb6bYSO2lPgGgL5k3jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KYcAo1P9hfxH/47I286HVe1EhIlQE98pNRVKL0r26s=;
 b=atyvml3/flJnUI32AAE+GgPbl8qQmm7pmtYTjgIU8DG/udS8Tp61PxWRFutoHJIyCrcwg0I5tzjhzCHybY18MHkNGrhXfujGjJumO1s5Rsje7nMJArdRZ/8CzfDJI+NMFCSFqeVcO1FlXODgmpG+b84jMukcVG2KyKtoorbQ7NzilzF/JW+YhCSiNb1ER4cSyZswxn4jJM9boeUBn4zo9B/iz4o3vqkZatTL70FHc/TX5XmKhLAFxEQil+nHo8AwUMUUdzMfzW0FuoUXeMyJx2biHEYZBNDADncWp7H33mdKF1DqCeW7x94e9gq2dnLhPhT2Soc7MLxzF8D7gJG+mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY8PR11MB7244.namprd11.prod.outlook.com (2603:10b6:930:97::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.29; Wed, 26 Jul 2023 17:04:07 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 17:04:07 +0000
Date: Wed, 26 Jul 2023 10:04:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230726170404.GR138014@mdroper-desk1.amr.corp.intel.com>
References: <20230726160708.3967790-1-lucas.demarchi@intel.com>
 <20230726160708.3967790-10-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726160708.3967790-10-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR07CA0089.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::30) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY8PR11MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: a62609e1-fb87-4cbe-7c58-08db8dfa52e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DJe8uqpuggH5oss4LrViiTio69dzA+oz4xXZ2BNISYHlaK+k0SZyBt7L7GAyz5IBih2SqM2RzXj8V5jPaoeLD18N9JD22FW+8whA5T1V/YHgDnO0u57SxhDm0dVjNvb8igQPL1OyKUSSANXCuFEKa1blPXRW7B99Y/T0smWT46PHUg61KHBxa0z/VrVcwFi2usSBFZI3suP5J5OmzDzRmpAy2DXVV3iPSoWt0u0zEODBSCJj5JSq+DqP2aPkLync85VXIN1ifpPj2WfTu6egfEZY3HfHF4gTzOwv4OMvUsUH6iBKBSJ3Cw0dFzIjBYWkvhdyX+kisvONQ6pa8lpsRgaKnz1oi7Mci2PKoy3BPR0bJIHGqHgZa9IF8OWmzrjL69qYnY9GHE2ZqwMXvYzPP39X59nYjVASj9qpeAjBIm0wEv0uVm9fQGOcV4ih+G6MP+pn+rBOFIG1A+M8ZdJ2EmBGfFP8f/r8HFsRjm0681ZAFYjYGYlWLf7j5Ii1CKoMgD4azgcmrvmtpPFwADDo7PJO21vB++2vvjy24E+VfdpmKRzli7MX3HnPBa+41adI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199021)(83380400001)(6506007)(1076003)(6862004)(33656002)(8936002)(26005)(186003)(8676002)(5660300002)(86362001)(6512007)(41300700001)(6666004)(82960400001)(478600001)(2906002)(6486002)(54906003)(38100700002)(316002)(6636002)(66556008)(66946007)(4326008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BN8ChYcJb1T3xF3zvy7KHtbFDhZnOmvKNE2Y71C43EIGCJRFMt5Stxev9r7h?=
 =?us-ascii?Q?E9YMJEy+OfSxvcKQoljCrMS7iYb05gyg6fMzXrk92ye1BK9r6St0a1CFe8Sm?=
 =?us-ascii?Q?ALYyOirutj6wq/H/mNDs7u5TyXSxBgB8Rjq19+BGxTD+LQJY9Kt+LaHBOWCy?=
 =?us-ascii?Q?LiS4B9PLZqZpU1fS023qCnhLtdFdD50l1Umzm28ftg1ByzrsceEG0HTNqqWh?=
 =?us-ascii?Q?vpbd06QuQy1W7opAFcqmSHyY1s08fhJ/b6B09tJDdtceICBqarfKOZVCfNKD?=
 =?us-ascii?Q?VNut1GMh6nAbGusI01B1joEOBPTk1a7n2WqEi92H4LbqDnxh3tVzTt9/qNwB?=
 =?us-ascii?Q?vUKat8HR907ijLusmQbKIy19M9ZSdDrHgvUMtsdux8d1sgS4u9Cqgluad7Ui?=
 =?us-ascii?Q?YaiuA58muQPBA16XMFZJ8xk4cZ7bP92Q7bHYSDQQXa07qplxSkdFAwr+VifR?=
 =?us-ascii?Q?oTOG2Apgx5JucsMaCdHLsp4a+jOBTfhrbLb8vE1noleihpvYq8UF5beHWJ5d?=
 =?us-ascii?Q?VVstfw1lSBuTWHk3qUOtejyHjFEDw4fVY1WIXIhDdsGd30UwXrkDwI/HcQD9?=
 =?us-ascii?Q?HwwXyJF9HbP001ACvJmNrqOTsEFcuO/xjChjDArXqBWBRrwUbu/7e4l1fNae?=
 =?us-ascii?Q?KrDO/jHKrgufyARFNWUFNbaC/jkhnZ0TUgskEzKEPZBGMTaUU7qtqWj2V8nW?=
 =?us-ascii?Q?xIoCugbpnVokhZwe7NTDFJ9v7I5wcWnXs+v13LXEcPTXnPvMbiv5A1j3DV4+?=
 =?us-ascii?Q?JB9v+QLr+X0LYp4Fa8y9PTczIdNzjIOB6EoMQbkcfD81B91UwwpACKtjhSnC?=
 =?us-ascii?Q?OO9u8IzDzOI3dJaOpjP9KPA4NSh7YMa22mtuVwN7u+Ff1TIoE5PmEoXLzjPc?=
 =?us-ascii?Q?rXNhl+wrtn5XL0zG+o8Z6IG3OmetYm8ciKYQyMAoRErBX9++cOfwO5vd+6qf?=
 =?us-ascii?Q?aL3Wzoz6HRXVFJK9/awVPIoM4qW9rTpjh3xN59HN9zLv+oM+SksHIqX8xo44?=
 =?us-ascii?Q?7CZznF/ybJaylhq/O7xvU5sEUPckvWJAaDBTOPm1+EYs0z3HJN7SY96XVl2E?=
 =?us-ascii?Q?xNV2SZhIaK/QJdvTSLyQ16DyjYBAsGxecbNtSLtRzTq03xyGykPs66rJHHPb?=
 =?us-ascii?Q?0XbUpGL4JTdWV46Evv9AgJ+yo+DoJ0jH5/AaOxgxef97WetRfRNaLeEA6LmM?=
 =?us-ascii?Q?TK45Rse8Pn1fNRkRG17Lbu92wAR30Cw4rMH/eisDTuw5PVzrP1C7XCCg2irR?=
 =?us-ascii?Q?QsC7zmVTzNev1XopaQvIpDO2s3UhssGu7gRMjeNR9RAuImMFmgbxrNP5DdYw?=
 =?us-ascii?Q?Bpehjj2PuNrCTXgS7ooNyzBhze0emQPyFNKUD0tScPR4oj4V+vMzBEHZQR/H?=
 =?us-ascii?Q?cqN1NITkWZkFMCx5/rqnIwIxyZauwluVlHH/3KwA2P9oXO4pxUpldTTXcy9b?=
 =?us-ascii?Q?HZ65JaBauQAtrP6MesjfYn2twmI8QGRV+GoHf2XKydS2hC6yzxinHgT9Kjkc?=
 =?us-ascii?Q?lDCjAyMwgQbplMtfZW6sRJIDcY+ZOxLLFUZlQnGax3WlJG2LD6hhPZiVIXub?=
 =?us-ascii?Q?D0xtGyX2/wlXGuX+ziWigK/VnIotbaanXA3p2bkTyo2faHaP5saB0NeXiFJ+?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a62609e1-fb87-4cbe-7c58-08db8dfa52e6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 17:04:07.7875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YY0waArcw0KNjeZfzSsyua0/CHKGzUwa+50HHb8gke6ZzsMXmmU4EDPJiIc9AbV58Sll1r/NLcAVwMPiyv5nUMHDBcF1Vmu/e6urtIORqwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7244
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 09/10] drm/xe: Carve out top of DSM as
 reserved
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 26, 2023 at 09:07:07AM -0700, Lucas De Marchi wrote:
> Top of DSM contains the WOPCM where kernel driver shouldn't access as
> it contains data from other HW agents. Carve it out from the stolen
> memory. On a MTL system, the output now matches the expected values:
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_regs.h      | 3 +++
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 8 +++++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index dbf572d11af0..315f6f8dadf3 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -84,4 +84,7 @@
>  #define DSMBASE					XE_REG(0x1080C0)
>  #define   BDSM_MASK				REG_GENMASK64(63, 20)
>  
> +#define STOLEN_RESERVED				XE_REG(0x1082c0)
> +#define   WOPCM_SIZE_MASK			REG_GENMASK64(8, 7)
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 271b3fba4129..7bba8fff5a5d 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -89,7 +89,7 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>  static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	u32 stolen_size;
> +	u32 stolen_size, wopcm_size;
>  	u32 ggc, gms;
>  
>  	ggc = xe_mmio_read32(xe_root_mmio_gt(xe), GGC);
> @@ -124,6 +124,12 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
>  		return 0;
>  	}
>  
> +	/* Carve out the top of DSM as it contains the reserved WOPCM region */
> +	wopcm_size = REG_FIELD_GET64(WOPCM_SIZE_MASK,
> +				     xe_mmio_read64(xe_root_mmio_gt(xe),
> +						    STOLEN_RESERVED));
> +	stolen_size -= (1U << wopcm_size) * SZ_1M;
> +
>  	if (drm_WARN_ON(&xe->drm, stolen_size + SZ_8M > pci_resource_len(pdev, 2)))
>  		return 0;
>  
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
