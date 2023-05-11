Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFA7C77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 20:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF2710E609;
	Thu, 11 May 2023 20:50:32 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3556D10E5FB
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 20:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683838231; x=1715374231;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=21LweQALfpTFWdYBCrAaJzeSNK07/QYC+hrO+u7yTIM=;
 b=Jp+yTWDAgUmbtpAMMDGU1pDGz3l4f94etzC6aYEH+lTdDY7JjOIF7fYy
 Gt9DuC1EDNP0dyqGx9wE64A/FzEXb2YO9uOtcEACrGMURX2mQB4coROD8
 Vi+xx7VR2d2Sopl6X6G1qOJ6Wgl0mwREsFzPXcy55dQyO1eQu8pT5YZrv
 1Ex9+aotnwYZFjmqwm3BDygfoej/Njo9X8h881eNAMDtLI6yNevLC+xV+
 2bwg2giYQlGQ/ph3kSB3uwDjxPtWdVUTbnUgkCeT5TpiCzKp47HT0dgOK
 JnRjPrN1/esA3zCGfkJSksjthUGUKiGcrjjDDeO7uArvXTU7y+qW2tRl5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="349470222"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="349470222"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 13:50:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="699894279"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="699894279"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 11 May 2023 13:50:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 13:50:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 13:50:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 13:50:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6imGKUoHGkEwnYJHM2oajESQKOLcxj3EnO4xgxw2CZLQd8wKqqQSvy4nmt2yQ3UsyPREICTNsmWYODpyg1pzU8mKh/1JBD/D9l4wWm96Ra5Zbj0nCrOhgJVxAeHoTBnu8fMHmCmEcVZMKlg0krDi5+JKjHj/g1J/sr1mYpWRm/H9cg/7pWB1w5cVl4/uhL+pQjdGjEJYG9cphoFN7x8Ferfxd4pPnYwO1bL5gXjcuUpLodAS1qEdR3tnPeWvS8SDkIlowXonGMYIyz5vA21n+vOd5VVAyOtSpvcrHyTVuHfqmjeyx5DRxUP/egti4XP8uXsKqQFElxvDW/yKaDmlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tP7uDdeNSDM71xcrkvkXSkpgkhXwbtivaxypcP0Q/es=;
 b=XCxdRjuFao6GNaT0Lu4Q6vPMDLNtPG7I6Penkx7WnX/BYHyvP6aPowDGhhmQf9tmrvkHKLnoqBqoOQT8FPnYVwOT/sqvrKoT6PKQe2KLNsuKWPyq12lOnyW/scLkK6NT9cR0M4pNz5yKx2sEDeQPES7n9E1lDgmJ4X4puWd8x7OBGRvnLy+0rv44f8Ufekh8pZLtFoGsk6G7FUEtR+fE+OGhodfUwcJxmBz+9A/kBroNEo3KsDLp5RQpyEDwJyuRJtdRq/knBCdPuoS5h72CAvOc2IcAh/EFcHOP6I4pZNOTwMrZfCWoXkpLaSI6DEWfvvUUUUjubL+97o2Ra7W/9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4239.namprd11.prod.outlook.com (2603:10b6:208:192::20)
 by DM6PR11MB4755.namprd11.prod.outlook.com (2603:10b6:5:2ae::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 20:50:09 +0000
Received: from MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::e585:1863:208d:7e7b]) by MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::e585:1863:208d:7e7b%4]) with mapi id 15.20.6387.019; Thu, 11 May 2023
 20:50:09 +0000
Date: Thu, 11 May 2023 13:50:04 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Message-ID: <ZF1U/HYieB/vrhd5@msatwood-mobl>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230511034722.1929038-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0075.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::20) To MN2PR11MB4239.namprd11.prod.outlook.com
 (2603:10b6:208:192::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4239:EE_|DM6PR11MB4755:EE_
X-MS-Office365-Filtering-Correlation-Id: 73675887-8c9f-4c57-e24d-08db52614ea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DJhFydjWGlCfUMU2giAlVf6Vtn/QnXyOeLSJXGeaMsOSr3EF+InzZ8O/4VGfFtYAXnpVFjZFa4FBD1K1nTcvTy/op+xjlUaBJJL7FM2uiqbU5HtYy39OgkgwkJ8kjAo5xctUqM4CP1SncTtWcqxhFGEn1UPK2yNQ+SvNmBiDPDQ38Noa55MUPhIBtMGleMWtXdwblbGP84Wrv0yC5TprZOBF7fJpbFp+nymuG6UZIk4EGOVcbPWKufyJnzRyvdwl9vB6Zi526mBmSy+1XkGVNsT9CB/VgrgXf8OfCD5Lq0axKlVfUhbfkDWCBeXOpFyDhsnfbm6ScwEuHjknVJjuZbM3nAI5HCl2YWhz55qRdYBaUWgaGgfWKAVZgKPgfESPhApJrkVT/PMeUKbCp4/nhXzDnh3UNKpRfO5D+QeUiKU3NUmwhdyrYdROwW3Pq7vdvno3TJnlC2snh7kXZT6Vma5DsBJZUP8emClhxd7Qr81s0rg7ADqbLaQqnx5A9Eyl6Br284M3wPMrIQ2ORPqAhUa/oOvvezEKJoNBZsAySqrh/nxuNKTt7vb19fwi4hWy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4239.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(346002)(39860400002)(376002)(366004)(136003)(451199021)(2906002)(9686003)(83380400001)(82960400001)(38100700002)(33716001)(66476007)(86362001)(66946007)(316002)(66556008)(4326008)(41300700001)(5660300002)(6666004)(6486002)(6512007)(8676002)(8936002)(478600001)(26005)(6506007)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEliNHl3NmUwdEVscURjQk5ibWRCek51TzJBZS9LcW9QRFcvSEJVS1BkTnAx?=
 =?utf-8?B?dDZPeW40UjJKOTVPNG5kd3l5amFBUGdCZW9saFRqRUhEZ0JCMHlpTW9zc01l?=
 =?utf-8?B?TVdGWk01ZXNNZU9EQUllLzB4NTZnazVXL3hwQ1d0RFNlR1FSbWZERjVnelFE?=
 =?utf-8?B?eVltNE5rNUlML00zMTVISk9JeXkwak1EMlRTLzJ0UjdaNWN4L0FnUlJrYmZY?=
 =?utf-8?B?SWF4MVRQVlJjQW9WdTgwamJUWFZvUmp6QlUyb05aa0NPVjd4b1lYd0dscGtu?=
 =?utf-8?B?ekFIcUFoVVdpNGhRNURJYVJYKzF5UWlpd1BFUktpMExvbE40N1YzaEwwVlVl?=
 =?utf-8?B?aTE3T2xMb2F2UHFQc2R0T2pBOFl3Qk1YdUczTi9KRi9lSTA5dHZlSzFyRnc4?=
 =?utf-8?B?S3VrOVJ5RUJyUmRQZ1FvYSs4a01TQXVXTHNJbkcwTXNnaElzYnpyLzZ2alZR?=
 =?utf-8?B?Ky9uTWt5Q2dSMjFOVHR2R2haMndlMmtvQ09xWXp1bmczSGJMSFJ6NnJCZisr?=
 =?utf-8?B?ek5KTjNvemhndDY1YTZnT0lhRkt3cEhtYVZuU3BsRmlTZEhrS05zZVptaVpL?=
 =?utf-8?B?ZkdCOGsvcUdMM0hlWUdnTDBtWVhROGhHMys0aGFyU01DUERTRnA5dys1cWZ3?=
 =?utf-8?B?UXNhNVRmNE9qNEZscjd4SjNramsrdmlJZmkwYTZydENIRGp6a3ZHQnY2TnQ5?=
 =?utf-8?B?bnJPeWhZNGxEby9PRVU1Q2tERFNuYnU1a1dyZ3NkczJRQ09ZVmVncVF3ODhM?=
 =?utf-8?B?aVhJNVpEV2xGV0htUXFXOEpHbnIyanZwV3RzSytIeVBwME1VU3N6WWd1R0pJ?=
 =?utf-8?B?VlhKMEZnOEdnSUE2RWN0VEljZlFQb0ZRb1FvRDg1RDhvbEZ0Mnk5ZCtpWWM2?=
 =?utf-8?B?RDR0eXVZdzZZaEJhVXJ1WmVDY1I4ZEJxNGUvSGM3WXdFZTdJR210Ukhkampq?=
 =?utf-8?B?VDhiU1FWVXBpdk1EbWRxVVZValFzcitHVWhYRWNta3lIczMxOXU3U1NscE5Z?=
 =?utf-8?B?M002L0M4dXdNb2ZGK1c3L213MUZhc3FTaHY4N3BPaDh1YklCU2F5Y0licTFp?=
 =?utf-8?B?R1pUeVBDRVR2aHNMdG50VDlXdHpCRVJHWDZKOXllKzdSSEVxMm1zZ0FrSTRh?=
 =?utf-8?B?eE5FVXg3VzNOOXozcmRydzU0dnV2bGFmOGk1RFBSV2VxbTdoMkVFbjhucVNl?=
 =?utf-8?B?Q0x6dlFGbDR3NG96M1BIRGV2R3ovdFpZaityZ2huZzVmNEgzVDJYaFpMeGJV?=
 =?utf-8?B?ZWVaT3pPOFdycXFpNURuMnBzZHFKR3F0UWg0MHhyM3BweVZaRndlVXF4Sm9i?=
 =?utf-8?B?VHgwd0hwajhDN1J2aHBocDQvY2I4K2tpWEVNT3NPTUJtOWVYYlR6eVlMeUVa?=
 =?utf-8?B?MU1mL1g2RTloNEpzV29DaUF3bXpxeEtCcU9Yd2l4T0IrcldXaEs0MlpLdTh4?=
 =?utf-8?B?RHpKYTl6b3FicitpMEVLaFNieEFhZ1pwelBRQW0rWmlmU0Q1aktycVF0cFVN?=
 =?utf-8?B?TEFDdFB2YmlOVTRMYy9zemthbUtzNnRTZk1zYVY4RTh3bFFyb0NJNkxrZjU5?=
 =?utf-8?B?T25EajcxcitPRytLTi9OQTN0T3UxTGloTXoxUUVabEpMZnhFTnVQWHoyYThH?=
 =?utf-8?B?YlFLblkwUVlNZG1SdnpPdGJzazBtRCt5YkQ5UFhWMTlEQW5ITlZlVUQ0N3NQ?=
 =?utf-8?B?Z255VFExOE04UExXdFJwR1NHckU1RWdYcnVqUngrYytPdWE4bkdBajR2Z2da?=
 =?utf-8?B?dlY5ZHprUUp3Y0hHM3A3WHZZdU50cWMyQjBEcGJrbk5FZzU4ZlRsc1VscFd4?=
 =?utf-8?B?bHFkQ3Z0V3A2OVpjclVCQzdxa2ZMbjV6a1BidjhSUkxQWEpMRUYzb1ZRakFa?=
 =?utf-8?B?aWcyVHFLZXA4N0UyYlVGYXh6bk9xSHlrM0NaRkJGbXVHcGJDTjl0Q1JrZXJ4?=
 =?utf-8?B?NEcxVFg1dSs3cUJGeWE0YzJkRVArWWMrVGo1UjlLSnBvT3MyaFcxWkFQMTZz?=
 =?utf-8?B?ZmtVV1NRa1NyZlpQQ1hlRnlMVS9DR2ZwdythUEJhVXM5ZkJ4VndIY1dwSllG?=
 =?utf-8?B?OGgwVjFIVkhTSVRFWHIxZDZUTUdKdmF6Mmp3T1JRSmlsVysybVc2bGZjL2Y0?=
 =?utf-8?B?THN1ZFZYRHVrWGdKWWNOVHNud1h4N1JEdzFONFpCcmwxMVVhbjUyNTI2K3l4?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73675887-8c9f-4c57-e24d-08db52614ea7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 20:50:09.5039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y2ccGOU8hiaofkuquNBMn1EiBuufniI1FMgPF7h0whCFr1VbLPjXjmfexeL6HFbKl3lq1fdh3tiEvufsKSRgNGxAergkzcm2YSl23qcWf9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4755
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 01/26] drm/xe/mtl: Disable media GT
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 10, 2023 at 08:46:57PM -0700, Matt Roper wrote:
> Xe incorrectly conflates the concept of 'tile' and 'GT.'  Since MTL's
> media support is not yet functioning properly, let's just disable it
> completely for now while we fix the fundamental driver design.  Support
> for media GTs on platforms like MTL will be re-added later.
> 
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c |  2 +-
>  drivers/gpu/drm/xe/xe_mmio.c   |  2 --
>  drivers/gpu/drm/xe/xe_pci.c    | 15 ++-------------
>  3 files changed, 3 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 3db550c85e32..be80fdc4b5a2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -293,7 +293,7 @@ void xe_gt_mcr_init(struct xe_gt *gt)
>  
>  	spin_lock_init(&gt->mcr_lock);
>  
> -	if (gt->info.type == XE_GT_TYPE_MEDIA) {
> +	if (xe_gt_is_media_type(gt)) {
>  		drm_WARN_ON(&xe->drm, MEDIA_VER(xe) < 13);
>  
>  		gt->steering[OADDRM].ranges = xelpmp_oaddrm_steering_table;
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index c7fbb1cc1f64..4804616a3c44 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -301,8 +301,6 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
>  	mtcfg = xe_mmio_read64(gt, XEHP_MTCFG_ADDR);
>  	adj_tile_count = xe->info.tile_count =
>  		REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
> -	if (xe->info.media_verx100 >= 1300)
> -		xe->info.tile_count *= 2;
>  
>  	drm_info(&xe->drm, "tile_count: %d, adj_tile_count %d\n",
>  		 xe->info.tile_count, adj_tile_count);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index a6858fc7fe8d..bf2c234c4f6e 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -19,6 +19,7 @@
>  #include "xe_device.h"
>  #include "xe_display.h"
>  #include "xe_drv.h"
> +#include "xe_gt.h"
>  #include "xe_macros.h"
>  #include "xe_module.h"
>  #include "xe_pci_types.h"
> @@ -271,20 +272,10 @@ static const struct xe_device_desc pvc_desc = {
>  	.extra_gts = pvc_gts,
>  };
>  
> -static const struct xe_gt_desc xelpmp_gts[] = {
> -	{
> -		.type = XE_GT_TYPE_MEDIA,
> -		.vram_id = 0,
> -		.mmio_adj_limit = 0x40000,
> -		.mmio_adj_offset = 0x380000,
> -	},
> -};
> -
>  static const struct xe_device_desc mtl_desc = {
>  	/* .graphics and .media determined via GMD_ID */
>  	.require_force_probe = true,
>  	PLATFORM(XE_METEORLAKE),
> -	.extra_gts = xelpmp_gts,
>  };
>  
>  #undef PLATFORM
> @@ -528,8 +519,6 @@ static int xe_info_init(struct xe_device *xe,
>  	 * treats it as the number of GTs rather than just the number of tiles.
>  	 */
>  	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
> -	if (MEDIA_VER(xe) >= 13)
> -		xe->info.tile_count++;
>  
>  	xe->info.subplatform = subplatform_desc ?
>  		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
> @@ -553,7 +542,7 @@ static int xe_info_init(struct xe_device *xe,
>  		} else {
>  			gt->info.type = desc->extra_gts[id - 1].type;
>  			gt->info.vram_id = desc->extra_gts[id - 1].vram_id;
> -			gt->info.__engine_mask = (gt->info.type == XE_GT_TYPE_MEDIA) ?
> +			gt->info.__engine_mask = xe_gt_is_media_type(gt) ?
>  				media_desc->hw_engine_mask :
>  				graphics_desc->hw_engine_mask;
>  			gt->mmio.adj_limit =
> -- 
> 2.40.0
> 
