Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C635BC4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 17:19:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8C110E7FD;
	Wed,  8 Nov 2023 17:19:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46AA310E7FC
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 17:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699463961; x=1730999961;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rWSSJPbVD+bFpOFjYJKDCw5I4J494tDB1OL26opESaQ=;
 b=iLMRwbaz9CqMpiZLhGi/CwEtF36bE3Skd3uhtVmJyVvVFpz1qOTW2zXJ
 8klxrM2DuJUaYG3ndLhK3ZTPZugR+r32IN2Koc5ha7qVYsJCJJ2x9Z8Bn
 57E4piO84/8bTj8RmYgA/LF7DQ9Y9/fV7zf5DeVRgpZ41yogE5Opo95Da
 20MOU73EWmwYLwvJMRLyYUzFru+CbXEUyBVxxIQ0ChCCUDC976PK3gQnT
 l2IKVQrwtWNponC4tQKfnL7rRx/frQMEKEDyTXiPBXderWZgXIQOFMfW+
 UF2ZNCX7CFx24Rld48Ho3iUDTEeitrkbL9WypXAu+mu+tvGyeUIkXMix1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="454115543"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="454115543"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 09:19:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="4250870"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 09:19:21 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 09:19:20 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 09:19:20 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 09:19:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kos/FyitHxR8lxMthMyN0imewaJ5bJAeBGMPyXW1lF4Qt2jv67jg3ZRG0xwoLkirxHZXYu7UvT6NAua9UhgsDKAbXMKIjC8CKfMMQcu7ZrCiQbQqnawW5F/pJ71/0zFv1bi2rMCB45Pk4f5WLDsVoc9hxgwLhmHeNu4NQvZ5Ly7/ea840x77ffsgF/+kXsAnfDMhauncP995vSBTZQUzlDFhjtXmrJGNTBXrkwZiws3Hl5bZAAaBrNlrDXfcqbvY3u4Df9of08xaRAUqzaopRYif73GNn08EGcq2dKn8zTqP1mDtCMQE3KDhRI9wJ6MfhLD+aXwoOJmPs9E1KbLYng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61QiUvQhNw6n29Wy1+CCcOUwpObjgK4NXgNTVz0tOGA=;
 b=gM16SRVyoDpCpIIRXKdAgeW4LYcfzp/fT8JKGGME2DANTh5N642q+Bg4MfSZxLzVMBMcB6Xoe3grKlefrunJSEHX1k0rXKhpWpq+HlayBv8qFhWhL2ImPG+FPK7Sa1+NrLQFWfqXCTCfelnGBG/kaxSd6kSxX1fk4HQLj4qqpVGKc//LudSfqNVtjC2K+CekBUxVbGjR5Sl30askgLvmtvXXxiYCAU0v2YlLFY1gy1EBPUxIost1wNmZo+rDAy0tyzm9nflzj4uCKGGxTLq9Xph31nJJ61m+3zfYEXFuuCjA7ZtpRm5I2Sy6wfRf6JObelLhboHCtnLoaG11u2N70Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4967.namprd11.prod.outlook.com (2603:10b6:510:41::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 17:19:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 17:19:18 +0000
Date: Wed, 8 Nov 2023 10:18:29 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <ZUtgdZRR9Rl162BQ@DUT025-TGLU.fm.intel.com>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
 <20231108003344.1169016-8-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231108003344.1169016-8-michal.winiarski@intel.com>
X-ClientProxiedBy: BYAPR07CA0057.namprd07.prod.outlook.com
 (2603:10b6:a03:60::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4967:EE_
X-MS-Office365-Filtering-Correlation-Id: 093b462b-e194-4a55-7acd-08dbe07ed6f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8I++/fN6tPUV4r+MEGaMNu275giu6agp2wae8+pkUgUbRTkmU2S1zT0d1Y/T+ckEegEch31h9xZJxfSXC39ERJH+FAl27dGfytSSQi95GP8FB0liDRxhidBPtHaMP3qyqZhFEm0WQnRu5v6nazgGBAC2NYXnnOU/TWjpbi2DGD7PNksfA4UiV0J1msQ7oT97kDz3ijZFSd68EK50QYpTkqX6lnPnfVROpk2bmOt1HZcX+NcSVbQ0uqcQruIR5XPKgFrDuYp8ixu96SyqolJSUJM8xpZnikpZHbBWEHgd7cRXY3x+wtaWDk2Wg/8l93gqr1BX4euHnIRSg1B/vqy6tqxjXgvR3YV58Dgyh5ClvYp35vlAOQYjAka5bqaUjWq53tgGTGkKORLYwkKDYBduSwBPMIMK9x34gKYFqC4eBxTyuy8xOfr9X7atc7f4KGgivfFgTr3+jPCQZsRLtUda1bVLJGiYVAUui3x205FajriyEWmMouVfEwOSp6bC22UG+ZfnUpejf00Bj1PPFPNbB4WxONEuTUY0YjvDRbwNj2BQxnW/T0LKjfCkkyLEdRqW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(346002)(376002)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(8676002)(6862004)(8936002)(2906002)(4326008)(38100700002)(5660300002)(41300700001)(6486002)(66556008)(66476007)(6512007)(6636002)(44832011)(86362001)(66946007)(83380400001)(26005)(82960400001)(316002)(6666004)(478600001)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXJyUGhGTU1WWmtjWThxMnl5SmVXUVVuTWZSbDF1TXpodnVTNkFWQjh2SC9a?=
 =?utf-8?B?T3lDcWk2cEM4Y0RWeDRHd1YrdERYL2N1aVN6T3dUT0NHZDZTbnpRYW5XRmRn?=
 =?utf-8?B?eG5lMUUxZnUzOTRMQUpRUFplMFkzMUVTL01mSkNiSXUzdEhIMURhZVVZWXVT?=
 =?utf-8?B?SjVveGVWcXVJK3kwYUNsYjl6YU00UGVybWZFMW1YUU5XK3YzVzNCZXNWMWpE?=
 =?utf-8?B?eEdkRmxCRXM2czRkZC9peldKMlpqek05S3VmU1ZBMnZDQ3NDTGtzSU0yZHZZ?=
 =?utf-8?B?OWh4UlYvVmRKekhnWUhhWEM3VVBJaWcyVVdvZ1YrcGtwNndudVptNDMwcVhr?=
 =?utf-8?B?cEJOcG9mN0NldFlHbnRYYnVsZUhPWkx5SjcvOVJWWEpNSFk5dzlWWEFEQ2VC?=
 =?utf-8?B?VCtsbDlYRkVGYUVqUWJTMTVnaWhOdURxWlJ5Yy91YTlzYXZDa1ZtbzErU1ZD?=
 =?utf-8?B?UlRTNmltdkY3K0FkTW1WUTc2SlRnQ00yajN6TlltSHBXV0VrV2M1aE1rRkpL?=
 =?utf-8?B?bVdlTWxvZ1JESlZYS1h2L3QzdFlMQkRxNjBFNzM0ekkzaS9OL2Iwa3pBNlFh?=
 =?utf-8?B?V3hrNFRGWUVoYjhVb3piWFl2L0xYV3JuQW9MczNwQXFDaWpCc1BlMkdFYWtr?=
 =?utf-8?B?bkxHd040MkZkU1htOGZEU0FNQ2tlYkhaUXEwQ3VtajRMWHNxZXE5dnZJYnpm?=
 =?utf-8?B?T0R5VG9LY0dLSnhCVWoxREtvOTRONHdmbW5rVldNMnZDaVJuWHp6VmN6bU9H?=
 =?utf-8?B?OXg3OTNxZDFsRld5cEFLYVd2N0F0ekpXbXhnN25QQXQ0UDhWYmIyT1NwdzBR?=
 =?utf-8?B?QS9JV1hvZVZzMUNIYVhCOXZNd0hPeGd3WGc5VjZWa204OWJKU21XMllPNWxl?=
 =?utf-8?B?ODlGWURyZjIrdEtLUUZ0WVJqN2Y5TWlVUVVFRHVVc2NEd2ZPcWxjMng5N3lB?=
 =?utf-8?B?NXhWNHJ1NGh6UWJhYk1iRDNPMW9LZWhRYVZkTk0rRzRLUVEvL1hsSXFZbUJ3?=
 =?utf-8?B?WkMrV2dZRTIvWDdkNEhOLytWbDNzak00djZXM20wR2ZsUWxlWDVvTktJWnRC?=
 =?utf-8?B?eUNPSWtqWnFQemp2ZEc5MTBTZWhXZjJVL3dpWkhWazBidVNKUnpvOUtDclQ4?=
 =?utf-8?B?QVFFMkx1blNtdng5ZTZybUVGVWx6TFBuZTBDQ0pTMklyRllsbFk0a1VCcU94?=
 =?utf-8?B?eUFONjIwUUl2RGhXZ0pBVUFidG1YZnU5WEFDbHc1aTBZL2tYS1drZlo1ZE5W?=
 =?utf-8?B?aHBGTFcydXFRZjlRTDNpazRnYy9OM29DbEtIL05RTFBQY1Y3cmk2WFRTenZu?=
 =?utf-8?B?RnNRWjh1UjNmbkZJRGQ2ZzRNN3dSQ1FQSm80dVN0a3Z1L0RZaEt2WVgxYUFo?=
 =?utf-8?B?ZHE4ZUcxc3lvOVhJdTNUNGgza0tVcmtvd1dxanBVMGx0YU04b0dSMEZ5em1i?=
 =?utf-8?B?bEE5Z2FUemxoY2JzeWQ2SW1TeHRUdm5MQ3pqQzdjUTlSQVgzcElydVI5ZnpN?=
 =?utf-8?B?K3QycUJsOVRoT1lwSVB1VXdtaThoeW16U3VzVWpJbTdDSWhJV25aT3N0dTR0?=
 =?utf-8?B?WlZ5VzVFQlU3cHI0Zks0Z0N2NzAzV2hBRUdBQ2xsSGNKY0g4VGY2Y2k3Zk9l?=
 =?utf-8?B?MGUza0s1UW1YVlN0S0MxbXhWaHIyaFgyUnFVcExNcjlGQkxiQnBqd3FpUGpk?=
 =?utf-8?B?UyttdHFxK2Yrci8yVE5QSlVmMEJoQzI2bkp1N2h2WjVrMmdKbzZEa0dISVlO?=
 =?utf-8?B?MGhXbUpRVDZzNzNzRXg2bUNLV0pPN0F3TEJQU3RWZWFleVZXR3BPb0xVNFQ4?=
 =?utf-8?B?WHRtb2VGbDVaRGRCajZpalRhRGRrVnN6SXM5eUU4VlFLa1l6N2RoQVIybzNS?=
 =?utf-8?B?TlRFK1VKR3duSWxTbStJWGlzdGpoVkZwa3V2S2UxOXJHbmIrZWtQZ213M3Fw?=
 =?utf-8?B?bzJxT09QVjRRN2ZzcDRjYXc1VTFNSGNuNEwrWGppY2svZUkxWHlsYmF3bjQr?=
 =?utf-8?B?VXhhWFF2ZUVYZE1nOEpEMllNV0d3dk4rbkhhUkJlU1l0dDd2blRLTGxRMU1F?=
 =?utf-8?B?dm9iSEhFd2w3d2VSZXIwaDVaWnhsWG5KN2hqc1B5b1FOMzNIVDIxQWdGUW5P?=
 =?utf-8?B?K0lybW01VjhrdHpHVVc0QWVVWlRTL2EzWjhOZTQrdjlrR0VlZDFqcDBiS25Z?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 093b462b-e194-4a55-7acd-08dbe07ed6f0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 17:19:18.1546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WLGvIym19/svksjuAoGZViocTEyiN41MszUvkbfAp3i2KJwnfKRw3w0XyzxTtIlHCetytRDQUpaiYoJsCBZlyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4967
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 07/12] drm/xe: Move xe_mmio_probe_tiles
 outside of MMIO setup
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

On Wed, Nov 08, 2023 at 01:33:39AM +0100, Michał Winiarski wrote:
> MMIO is going to be setup earlier during probe. Move xe_mmio_probe_tiles
> outside of MMIO setup.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 2 ++
>  drivers/gpu/drm/xe/xe_mmio.c   | 4 +---
>  drivers/gpu/drm/xe/xe_mmio.h   | 1 +
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 3bcda5626493a..53be4f0424c21 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -392,6 +392,8 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	xe_mmio_probe_tiles(xe);
> +
>  	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 7329ca73e64ad..ff968ef611cac 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -306,7 +306,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>  	return 0;
>  }
>  
> -static void xe_mmio_probe_tiles(struct xe_device *xe)
> +void xe_mmio_probe_tiles(struct xe_device *xe)
>  {
>  	size_t tile_mmio_size = SZ_16M, tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
>  	u8 id, tile_count = xe->info.tile_count;
> @@ -398,8 +398,6 @@ int xe_mmio_init(struct xe_device *xe)
>  	root_tile->mmio.size = xe->mmio.size;
>  	root_tile->mmio.regs = xe->mmio.regs;
>  
> -	xe_mmio_probe_tiles(xe);
> -
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index ae09f777d711d..9f1a25cfd2cf0 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -21,6 +21,7 @@ struct xe_device;
>  #define GEN12_LMEM_BAR		2
>  
>  int xe_mmio_init(struct xe_device *xe);
> +void xe_mmio_probe_tiles(struct xe_device *xe);
>  
>  static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>  {
> -- 
> 2.42.0
> 
