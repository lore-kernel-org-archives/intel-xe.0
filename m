Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1FFEE4996
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 05:54:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C177310E2D6;
	Tue, 22 Aug 2023 05:54:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2844910E2D6
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 05:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692683683; x=1724219683;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WBHGgTK6flgyqaeIOpZTHhSj5M7xEDmvrCjyKwfDZik=;
 b=FusSFQcMwwBK59lIQPXC1jCQ2+ia13aS+Xf6TrC1vweysIhfESzDLK6Y
 4S5fZmlfZNxM0HE13wx7dHw69t05m6xTTQvAEh4YoPGGGcZNTRXuA1IQ7
 gXVZX65F17pJ8pOGnr2YYmZHLR3p6pc7DNroCrRV4TIR0aBoXNdM0O+9J
 wnR3BG8oOb6SfrJWINfcPVd5GNIPfwleGiljoe8Ke6OsNPBWoSBqG+ixC
 YULHrC59G0ZtMHDqb2UfHP/5t75BIDxkdCabTIpIYjwawfqTSl5hg6xKM
 hi6zRKLTqdcpGuOTsE6RzTN1OiFAGkiUq2ZJUledVcgVfDgJyvWGggaCQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="460152312"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="460152312"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 22:54:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="1066910519"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="1066910519"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 21 Aug 2023 22:54:42 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 22:54:42 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 22:54:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 22:54:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 22:54:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/5VTxQeIkciqhoZa483CbQ2noP0G0JKbHCOj4d8fED+s3SNqxrYIm+yJDchpkr+Tv9jK7WkzXGGmZH+h2LBTzZ1GMni7kqv6oD9x3Ex6JiGbp9siT8fQWfYlLpvBSSPBpDj9503kVr1ZqTeeHFFqDwzUZSPf9zgql+7JzlOhNpVGTNZozfBnQEJGPdO0Y95gvO7xDXf4SfXEUIUjfjohXYr4KkJcClTNtuH1mDMzmTXjDGa0bwighBsespCOgaFRLNArSqMGJPVrO0C+AIAfXeIUxyapRG/sPJF00FBnb8/b9LWF6/ND3ZgqHqD2hkY1vUoHpkW766xzK0/HGM+Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nz+FF7P2eJKc5Fgb3ewLAvid9gtgwoCV8ftSFWOOrco=;
 b=PO+UAPOPHjDvGod2x9+/o5RNZCm7A0bqXI37gGCoX+ezNsiulOTkDu3ZmPVWHX8CBSTBVe0mXOnDUiDTRZXfgTWgSnvBc+aJkL//mIdUaLtIx8WDnWYlSvh46EFzkz4kvCJFpXYS7RFI74Fha4BPyB/j/qVE29Nwlr3o/ts7jh8SvPpBonh6xoS5wJu9RQ45rQ/0tuWMmhRBtV0PRjXTOVjoEd0pAlrPWUe4xzeKWYFke3IUp1RA6RMsFX0AgwBCFUbGJzMv3DdpFbNkFhaCyTapEzotllww8Sc7PDaQ6qOF7AFB5Gu2oIuyLr8RQcUHId4HHNM3yQ3biIcHi24qeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by BN9PR11MB5481.namprd11.prod.outlook.com (2603:10b6:408:102::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 05:54:33 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 05:54:32 +0000
Date: Tue, 22 Aug 2023 11:24:22 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZORNjghEvtzgjc4P@bvivekan-mobl>
References: <20230818220824.700519-1-lucas.demarchi@intel.com>
 <20230818220824.700519-11-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230818220824.700519-11-lucas.demarchi@intel.com>
X-ClientProxiedBy: PN3PR01CA0187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::10) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|BN9PR11MB5481:EE_
X-MS-Office365-Filtering-Correlation-Id: 19c78a22-1271-4e69-07a7-08dba2d441ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +3keOQssUgjI8HULrb2v9VHeHcmo0WMUHV0M6/k1uJDvZFMEoHkmBR7cNXiUl7hvo4Y32fM7z4bRYvhJBcHPVnOBIlNx+RdYFxlELsem9cdVIypVybIUplpq4HhINTVcIi3IALnEgSfR5K5sJ6C2sawamUVpWwOtGUQ6GNV1IcyvC73RLRQauunkVerpkyFNSE14dVTQQFsKlaicC6CNErFvf/8og+qSdDRK26YRVvh/WWqX+u85nTX4kK/kJrCSLCaO2XYpeq813R7TfbvjXSpqAWnHU/HbTF4sXhs/ir+D0gF/cc9TUQ5CPMdpo7Mw6xS6ih923mJyZhbqJjR7cAYRWeit857P4ZwGvO9Qr+TLmF8/JmMTRizJ6ngu/LVaJt5WNEeEmsD7vJkC2y34rmzENhJwHkYx+/yoPkLlNUDVQorpUAC5a8lqX9+zARY9RInEyBvcG6DjSH0nufYn3NX1SV8gyyZmUozPcvp4xcuTHyeUrKkoczU6gMh+pEpG23IOCggfAp36pIwo7DLGxvS23APefXJTmguzkHZzkN3BSI6C9qZn+mhwyhEUvPWn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(39860400002)(396003)(366004)(346002)(376002)(186009)(1800799009)(451199024)(66476007)(66556008)(316002)(6512007)(66946007)(9686003)(82960400001)(8676002)(8936002)(107886003)(4326008)(33716001)(41300700001)(478600001)(6666004)(38100700002)(53546011)(6506007)(6486002)(83380400001)(2906002)(86362001)(44832011)(5660300002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2hBTzJRV1c0ZVZVeWlVaSs2MDFTQXJMUk9FWERHQXY4cUxqckJWVS8ycjkz?=
 =?utf-8?B?RG52QkFlRU1kakVNQzU3bjVuSnBXWXVVMVNZcHkvMWVTUXgzTUFGK2ZXOTdi?=
 =?utf-8?B?Z1dDMWI3M2hoN205cWZKa0JVZ09MeFRNUTlYOG1QWFJVU1grNXNlTkM5WmdH?=
 =?utf-8?B?VU9pNHV6VlhZQUhIZFZCN1J0cmFQWnVJV2lIVjZGN2J0VUdLSmp0ZWhTYUxz?=
 =?utf-8?B?YjdDeWhTVlBTMjJoVTNCc1lVdDd6S0dHT0dKdXAyM2p6eGhwTW9jWGlJcC9M?=
 =?utf-8?B?K0N5L2FjbHplL00wN0I1TEJSWFFwanIrZWxpN1lpSmlqMThLYXkwbWI1ZDBl?=
 =?utf-8?B?K2pRQ2NGRGlEeSsrVDV0ZVRVS2VSNXk4LzMzeXBBc1lSNTZZZWJhTE82UUNR?=
 =?utf-8?B?blZXWFIvZGh3eHA3Y2xYS2JzQmlBNHlWcnVPWEx4aHRDL21wN0pEeDVJb2ZF?=
 =?utf-8?B?dFN1RE00Ym05R1Bsa3lHUnN3Uk4zUjZLTW5uUHN3eGJVdStpbmY3WnRKNkFT?=
 =?utf-8?B?YmxDR0tDNUtoMEpLS1JBY0l6dk5GNUJOeFBqT3FvcitSb21xSDdWcThGQnVF?=
 =?utf-8?B?aDI1a3pMaDV6VDcyaVd2R1JGam9iYnVOa2N4elEyV251WXdvcnBQTlN4QzAr?=
 =?utf-8?B?WWNOY2N4dmFLMmFpMXhJOXc4QXIzNklnMEJ3VjBWR0ovOEJOWEkxTWVrcnBp?=
 =?utf-8?B?V0x3N2RaYmFzOUZ6VE1IeEJFYkhZcEJHNnNxVkpkKzlHMERaYTh5WnQ5NnMx?=
 =?utf-8?B?SGhHQkxHbzRoeUFacS9tRUhrZTkvaGNvNEI1dVhGTlZGOFY5bDNwK0lSa3BQ?=
 =?utf-8?B?Z2t4Z0FvSG5CMUJvUFdJeGVJQnprVXhwOWNkYkYwSWljOGg0ZGhlTTlBTE05?=
 =?utf-8?B?QTVocWRGbUtjK3RNMTBueVE1aGllV295aDB2WGViSHRySVYrSHFjOTZ2dXNG?=
 =?utf-8?B?ZGxDdVdZU21lYThoOVM1dE13eGxxdEhkdGpoTTFjWHhMTFNxZzUyZEdRZkg1?=
 =?utf-8?B?L2pjSDRuZkdENXArK0JUUWxrYUNwL1NJd01aSEJPZ0ExWVAxK0J1czVucENL?=
 =?utf-8?B?Tno3MjZnRG5salBMU0RGbGJwYndyTTV2V0xyMDdPNEo4dUQvQ3RyZ0JzVHY3?=
 =?utf-8?B?c1MwbTMxSGVVQ01mK0s5ZTJvMWljK2JJcllNRTNXVldHM3BaaFJGSjFrcVJR?=
 =?utf-8?B?OUhMYURLcVhnR2VZMEpDNGdXc3VqOUJ0VEJMUFNSc2UrNHR3UTBWeG02R1FO?=
 =?utf-8?B?VjhNdjdmVnRRZzFtNGtsWVVhY3YzcFd1dHEwSTZ4MC9OZU1Bbi9kRmRZUDgr?=
 =?utf-8?B?Y0xNR2h2MzNqSHJET3ZNdGJBbGpYeFRzVC95d0VzQTF2YzdnbUp1VnVaak0v?=
 =?utf-8?B?ejdwU2VCYUlBZ1MvN1F5c2YwcWxrMzdGRDVMbHB0ZGQ1alo1akJ0NWZIOGJm?=
 =?utf-8?B?NVU1VkVKYzE2dldMOXczMUdDeEE0YnFkMHFGNjJnRWJsVDhxMnQrSWdtNFVn?=
 =?utf-8?B?QzN4elJyODZ0allFRGtSekF4cklsL0RQdlhJSEFwUGR6RUpKejRwZDc3eVdY?=
 =?utf-8?B?NW45OFhhV2ZNejBGU0laTkRSNytYWmRnZDhBZmFta05JSTg3NzBSMWRIUGZz?=
 =?utf-8?B?N1RLWDNkOGpJZTdrSGV0OVgyajBPeUMwR2VhYzNvdWgwZ3MxcjMvOUk4Qkdj?=
 =?utf-8?B?Vno0VmtPLytjY1BJV3doVGJudEZDSm5OOW52RHhocnp5L1g0K0tTbDROMGdP?=
 =?utf-8?B?bUlrdEIyZEtNbHFqem9LamNYbzlrQTFOUXBJVlhhUUNZR0g0MndwNjVjbkRs?=
 =?utf-8?B?M2tUV2l3ZERWUEpmbFJhbVBRMENiaGh2NytQdTk5b21EbDBRWURuSTVwdURz?=
 =?utf-8?B?ZWZWVUJvckRiUEtuTHVzUlBVb0gzT1Z5aDZLS2Y2UlR0dDhnYU1vYWhQelRi?=
 =?utf-8?B?QnlMdCs0ZHRBVTN6THJuNzd0OGt6R1hoWkVzbWZ1RjMyQlBSUkttRUs1bm1o?=
 =?utf-8?B?bnJlY2gwNk9GQ3BNa3VPMmlHMU1CcGxGL2I1SFNxZ0YrOEpqdE9JQk0ya1U0?=
 =?utf-8?B?K25DYnkycUliMXc3SytpdDA1Y05NN0JSQWdleEExOFRCSyt4M1Y1UTgzUDMz?=
 =?utf-8?B?OGJUZGk3c0NRdjdTcm0wNkl2UVZBekR0SVdlVUU3VWRla21EWXkrZkg2aXo2?=
 =?utf-8?Q?AuwPO8Ny4MMkVTcVt73xOnE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c78a22-1271-4e69-07a7-08dba2d441ce
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 05:54:32.7223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4wPtXkNpunfuMr5qED0PmYFo+PN7bcm91E46R93K/2jVkDvFszoeiZrOgA4Q/8KdOPb9h5FOc5Vn3sZI0Ey5G8IVtuSyU9xwoCeGmkf99C8dbql5Xz6WAlHnZ7d037Gi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5481
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 10/15] drm/xe/xe2: Track VA bits
 independently of max page table level
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 18.08.2023 15:08, Lucas De Marchi wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Starting with Xe2, a 5-level page table is always used, regardless of
> the actual virtual address range supported by the platform.  The two
> values need to be tracked separately in the device descriptor since Xe2
> platforms only have a 48 bit virtual address range.
> 
> Bspec: 59505, 65637, 70817
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>  drivers/gpu/drm/xe/xe_pci.c          | 6 ++++++
>  drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
>  drivers/gpu/drm/xe/xe_query.c        | 3 +--
>  drivers/gpu/drm/xe/xe_vm.c           | 2 +-
>  5 files changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 303447c093c5..18292aad87e9 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -216,6 +216,8 @@ struct xe_device {
>  		u8 gt_count;
>  		/** @vm_max_level: Max VM level */
>  		u8 vm_max_level;
> +		/** @va_bits: Maximum bits of a virtual address */
> +		u8 va_bits;
>  
>  		/** @is_dgfx: is discrete device */
>  		u8 is_dgfx:1;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index fdd2eba1b91f..70d5f25c0d20 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -106,6 +106,7 @@ static const struct xe_graphics_desc graphics_xelp = {
>  	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
>  
>  	.dma_mask_size = 39,
> +	.va_bits = 48,
>  	.vm_max_level = 3,
>  };
>  
> @@ -117,6 +118,7 @@ static const struct xe_graphics_desc graphics_xelpp = {
>  	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
>  
>  	.dma_mask_size = 39,
> +	.va_bits = 48,
>  	.vm_max_level = 3,
>  };
>  
> @@ -124,6 +126,7 @@ static const struct xe_graphics_desc graphics_xelpp = {
>  	.has_range_tlb_invalidation = true, \
>  	.has_flat_ccs = true, \
>  	.dma_mask_size = 46, \
> +	.va_bits = 48, \
>  	.vm_max_level = 3
>  
>  static const struct xe_graphics_desc graphics_xehpg = {
> @@ -157,6 +160,7 @@ static const struct xe_graphics_desc graphics_xehpc = {
>  	XE_HP_FEATURES,
>  	.dma_mask_size = 52,
>  	.max_remote_tiles = 1,
> +	.va_bits = 57,
>  	.vm_max_level = 4,
>  	.vram_flags = XE_VRAM_FLAGS_NEED64K,
>  
> @@ -182,6 +186,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
>  	.has_flat_ccs = 0 /* FIXME: implementation missing */, \
>  	.has_range_tlb_invalidation = 1, \
>  	.supports_usm = 0 /* FIXME: implementation missing */, \
> +	.va_bits = 48, \
>  	.vm_max_level = 4, \
>  	.hw_engine_mask = \
>  		BIT(XE_HW_ENGINE_RCS0) | \
> @@ -587,6 +592,7 @@ static int xe_info_init(struct xe_device *xe,
>  
>  	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
>  	xe->info.vram_flags = graphics_desc->vram_flags;
> +	xe->info.va_bits = graphics_desc->va_bits;
>  	xe->info.vm_max_level = graphics_desc->vm_max_level;
>  	xe->info.supports_usm = graphics_desc->supports_usm;
>  	xe->info.has_asid = graphics_desc->has_asid;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index ba31b933eb8e..df6ddbc52d7f 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -14,6 +14,7 @@ struct xe_graphics_desc {
>  	u8 rel;
>  
>  	u8 dma_mask_size;	/* available DMA address bits */
> +	u8 va_bits;
>  	u8 vm_max_level;
>  	u8 vram_flags;
>  
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 7ea235c71385..1db77a7c9039 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -197,8 +197,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  			XE_QUERY_CONFIG_FLAGS_HAS_VRAM;
>  	config->info[XE_QUERY_CONFIG_MIN_ALIGNEMENT] =
>  		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
> -	config->info[XE_QUERY_CONFIG_VA_BITS] = 12 +
> -		(9 * (xe->info.vm_max_level + 1));
> +	config->info[XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
>  	config->info[XE_QUERY_CONFIG_GT_COUNT] = xe->info.gt_count;
>  	config->info[XE_QUERY_CONFIG_MEM_REGION_COUNT] =
>  		hweight_long(xe->info.mem_region_mask);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2e99f865d7ec..389ac5ba8ddf 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1207,7 +1207,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  	kref_init(&vm->refcount);
>  	dma_resv_init(&vm->resv);
>  
> -	vm->size = 1ull << xe_pt_shift(xe->info.vm_max_level + 1);
> +	vm->size = 1ull << xe->info.va_bits;
>  
>  	vm->flags = flags;
>  
> -- 
> 2.40.1
> 
