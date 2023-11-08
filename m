Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F38DC4167B
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 16:39:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0BFF10E7E4;
	Wed,  8 Nov 2023 16:39:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0885010E7E4
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 16:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699461560; x=1730997560;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PoNs4ov7TgW7LOt5SF11LR3flUmb/f3Gr7uGNU38ZVw=;
 b=HXnYNvunCHb9ecGKJFPzAoyS0F/sdr0cibMQ0VlS4p/HxfssL2nYIcLq
 FE/EaLpPKB+kkhoyWdHW0iu3GdKZ31IdZz/IlIMUTysS0xAlmN5ug5xYP
 vRDDkg70A5Ps10kPhK53y+0H2p+9diQxscT3NTZOrg9qbCTUOqEaSVCTY
 jTsxgw0QNi6YHEB9/3QLhAVPs/0ohFwlo9l351jk2rxPkDQf4KvHzcgwz
 aA63D6rELwnrwuCM9NnoexoPn+1f4lDnk5QGUx5Pv+usB49LAgThWm+Mv
 I7k512Q5R6DMrBWlkUNLxhYVq2sxRQUGXEGbyUXfICC2Wd9qLoMrbQ6W3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="456297739"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="456297739"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 08:39:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="1010310046"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="1010310046"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 08:39:18 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 08:39:17 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 08:39:17 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 08:39:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edfuCa3J63mjUuAuMaZM1tC8NOsY13WUS6J2QP0REhNC+HUdB0PLAxzRL7jXwiTOEuQWcTyw1EYdLz9OUfiGYHkxmpFRp/HdRG/lahjlM2KeBeLcHa3im5Ywxk0A1sP/E8whQMGoXuGFi4VbyxikMQHsbBz7C/HoxOpTVgUdIj9/5XoDBcGj5O/cF7aNEIZbaK+v2W5bkOxMOjhzvAX/+/d0T960eNFkzclc6/RzSfJWAVd56fY2VIz0pa8WDAOPjwPog3yqC2s3EUOdW+sD4iiDhTL2/GKlbRsqXvS8yRdG2B0SdN8esx2Ovnb5LbWL5HDiddPUKfQrl8PDYi2B/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fWK9MlC60DhPM/r82tTGeT1IV58M7qzi618EUDGmL4=;
 b=iQ2bVWLq1MZGmMV6icovQ+4xIwVVTB7gzgabMOipAo8GawyV2EMxy0S1FoSP4S6Qk693uA4HubLDjE5BHTG1TDoBIJew+zJlvubjqYqi6Pd90zlWtWGRUt8wuRp/lrhsZSWgpnR9Oxq7b7m+1UO336wPQyvEoBYVLxTk/QqFpzaKDfOlzUEtjcwKikEcVNC+mmwlKOc4rSX+637GzYT+hnigISuhduNF4Dx2sX/JLnbrDW7y/FqGQJaK8nZ7zTjVoMqZic4WbgHsEN4lHBtTgULSaxhpvmQW+gNwbeMIOUZDFj5qFYrewrYjxXba2QI2fGfJng5VP3x5LSZcSH+YdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8550.namprd11.prod.outlook.com (2603:10b6:510:30c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 16:39:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 16:39:12 +0000
Date: Wed, 8 Nov 2023 09:38:24 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <ZUtXEGkV/t0K8dWR@DUT025-TGLU.fm.intel.com>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
 <20231108003344.1169016-6-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231108003344.1169016-6-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR13CA0077.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8550:EE_
X-MS-Office365-Filtering-Correlation-Id: 6064cb9c-2f09-49b7-5ed9-08dbe0793d0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mqMl+4jy0NzNRunb/i51R5g65n1Au9dGPfB/HVDATpgt1bVlHdkqkr0nrggeMXYjs8ftCAFt2UslhKSk97HD3YR/N4Q9OzpQCinf6+2W784EEofFUt3T/64LGHQgYllUXeCYRz8dP+J/qB82hxLt9Opz3rLIq6r7qKKms48OmGttMnYztmjclLsFD/Ndv/d8ysGiofSk2Ss/TRaQ/tqikMcw66xgEBDZvt6i37UrDkAt2mqOd67ozup6hPQQCpsicJ/AvbZv3gz2fp+VH/EZkeD6rb09LCQR6u0udQcK9xAgl/oosbnNYb/7sVnSlTFwIwHntTRfEHGzchLOHCjXXkwKFFNeMfsXwp3FOMEOjQhxb6Idqo+b8W/jkK5yaxOaBmxMl8JUpY9zOzPhJjWo+mE8N3njoFq9fnsq51sou5MNkzs91XC6/SsLtZXSx3nP6rUWUuUOMfBY8yQboDOPidP9ko2lWZYnrQ1Ef7T2feOjZQO5QWHDhUXn6uNOSjKsEFdVQ6PXkxPSmQS920s9XNIUONEvTyCxt+SCBwwIgqweGEAM8Uzg34jg35rQJ4JI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(366004)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(8936002)(44832011)(4326008)(6862004)(2906002)(8676002)(478600001)(6506007)(6486002)(5660300002)(41300700001)(66556008)(66946007)(66476007)(86362001)(6636002)(26005)(6512007)(82960400001)(38100700002)(83380400001)(6666004)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUtua2dFK2ZEOHVEUWdhR0dpcENTSnBrZ0dYOUdBZno0eGQ5MERuVkIwamtP?=
 =?utf-8?B?TDlhRlVqandNZ1hCZFRNVDAzaGxCb3NUYzRzei9XY0ZoVjVWbnFmNjFuT3V4?=
 =?utf-8?B?YjhqU3NOYy90cGFmQnp5MDlVYmV0NXROUDBET28va2JNenVUbG5RZHUxVkQw?=
 =?utf-8?B?Q1RETERGUlpxeHNLNUx0cnJDNVpBWHVBM1J2VndzalhBdXdMUDk5RjRIMmxT?=
 =?utf-8?B?K2RhSCtFbVptb1VMZ2s4SUxJVENYSExEMnlyRDIxSzBDZzVvQXJQaENXbk5K?=
 =?utf-8?B?UURtL1I1anZFdjRQMWdRTUJ3c2lUM0s3Y2RYWFpRbWxDMW5hVmVDcGQ5Q0hG?=
 =?utf-8?B?Rm5FWlRaM3Y1RlV6TDlWK2Naa0ZpYkxBanBPRzRsemMvZmJUMWF0VTlFRjdU?=
 =?utf-8?B?YklvSFRCaFladHdvNkxmQTR3cytHZUJ5Q3I0T2Zja1lnWG44cW0wTTJ6Tzhm?=
 =?utf-8?B?Rkt1MjR6aHZiMTlnbUpwS3ZiRVQ1OGplSGZILzE0eHZOOWJ5Ump4SEhCQVpG?=
 =?utf-8?B?SU96MkJrMFFJcXMyL1pSVlJoaGpQM1Q2SWV0eVh6NDdHNzBLOTFCbktTN05z?=
 =?utf-8?B?NVptaWdob2hIWkFjK2lzSFdMZUxnUVErNXkzSWJwZUYzdmw0eUY5RE55bity?=
 =?utf-8?B?d21ZdGdpRVV5VWs2RG82aVRIZHlYcEkwbnVxYTl6VktzWmgvVVBnbGUwZ2Qz?=
 =?utf-8?B?VHdZRmxTNGNSZE50dS92L3JBYU5BSGN0YmpETnBJNHFSRExqbTNrcGpFV2JV?=
 =?utf-8?B?VVExUkozM2dUOXZhZFFRaGN1SWNXNEV4aEhZNjc0VlpwMUtnSTJPK2hFeFBX?=
 =?utf-8?B?Z0NuSE1TM2N5MEgxdkw0ZWdlbDRqV3dWbzJzdmR0cG12RlhqYkoyeUVXV1BS?=
 =?utf-8?B?QzNxNFU1T3R4SG51Z29Tbmh5QWNlSzdxUDREZEU3RjN3SUpWZjZSaGRUQUlO?=
 =?utf-8?B?Yk9QOTA5d2Q3S3VSa1pFVWROQ1hHdzVsRkRReFh6bi84Nk5tckkrMWV3bTF1?=
 =?utf-8?B?alMydlp0OE1nbkpjbHV0NWxxdzg4QWNXVG5uamtQaWR6cmxXRnI5UzdUNGtZ?=
 =?utf-8?B?L3VibnVxbHllZ0pZMTljNmRrdklOdEhrU001Q3JvM3gxMjhnakFWeE9UQTVB?=
 =?utf-8?B?U3BuTHhFNk92eFZTS3kzS1dYYjNGVGJCb0JQaGcrdkhNVTdCNkliVUFjQ0dx?=
 =?utf-8?B?bjY1TXE1MnB1N3ZaY1kwSlJHbmZFa1E5d1oxaHR1VFN3dlVISXpOUXljRWY3?=
 =?utf-8?B?OVdsZWNzVUtZRS9ZY2hnMFRpcVJ3aHJWZXdGbm4wTW4rSDk0MEJNR2krVTR6?=
 =?utf-8?B?OTcxSGFBWGRJZXZnNkN0V0ZZanhaU2VzY2s5dUlkSVgwZ2ZvUzNCTVFyNXlG?=
 =?utf-8?B?WDdjOHNleVdubTFYNFRFbXZ1eWZGNU55WHBMcHF6RW9UVXpYamhGU3hWbTJq?=
 =?utf-8?B?NGR2U0swTWhXdW1rMWt2K2pDakMvb3RDTDdZSWZLaXEzVmtxendLRUJkQk5C?=
 =?utf-8?B?R0VGL2M0aHIxUi9kcTd3RWVQbWp5QXBuQnczdWpOQTZUNkV5THZITEV4cWNL?=
 =?utf-8?B?cW5wMmhkMnczRGtaUHlzalNiTkI2QTNnYzlUWVFLdGVsbUpidGwwb3hQRFhI?=
 =?utf-8?B?N1RDcmRqVXdDS2NxdDBxNTF4NjdDRUk2blJSckVWdEpKSkNLVFdseUhFd2FQ?=
 =?utf-8?B?RTk4ZVhOTFoyK09EcEt1TzVyUm1xL3dDUDYzODJlWXA4TnY4TG1nMC96SDlQ?=
 =?utf-8?B?bWl0ZFhoVXA5dXRYZjM2VzMyclVETjJiY0t0dTNhRmEvNVl4NUJoNUlqcllQ?=
 =?utf-8?B?VldzMGk2d0ZNWTJGMUJjY1RKTWRrN0F4RmRsZlNQV24zWEduMlpRQm94YUFU?=
 =?utf-8?B?S2g4cEhWenBoeWJaemJ0UE1wVVl4M1JtaUx2QVlqOHhlMWZQTWQ4YUUzOHRI?=
 =?utf-8?B?T2dEdFE2RFg4S01ESFZUSGhrUFYvUDVTelIrMnJQcW5IR2JOSWQzRTZpVlpn?=
 =?utf-8?B?cEZtbk1rOFRqZEdDbjdISE1QWVkvMlBzdkNRZCtkbEFVZ3JkYVg2cmQ3OUtY?=
 =?utf-8?B?NlVnODF0RzJPMi9vV1A5SG9FY3RuQm8yaWVNT01PQ1Q5QndEZzRqU08xVmxD?=
 =?utf-8?B?cEVPcmFVc1JQek9pTnhKRjNibTdJcnZqRDNBc1BTUmw3dnFOS0pmcjVCcXZr?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6064cb9c-2f09-49b7-5ed9-08dbe0793d0f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 16:39:12.4445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hxl4/hP7VmQJKtzsHFmKu542tq5JR0YpQnls5qF3mmpr6kd7cRWc/nMHSewiY/wpfh+H3YYQTGVpxhQmrzHqPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8550
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 05/12] drm/xe/mmio: Move memory training
 check to probe vram
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

On Wed, Nov 08, 2023 at 01:33:37AM +0100, Michał Winiarski wrote:
> The check doesn't have anything to do with initial MMIO setup. Move it
> to the place where it belongs.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 0da4f75c07bf6..f4cddf2dfa3a3 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -254,6 +254,18 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>  
>  	/* Get the size of the root tile's vram for later accessibility comparison */
>  	tile = xe_device_get_root_tile(xe);
> +
> +	/*
> +	 * The boot firmware initializes local memory and assesses its health.
> +	 * If memory training fails, the punit will have been instructed to
> +	 * keep the GT powered down; we won't be able to communicate with it
> +	 * and we should not continue with driver initialization.
> +	 */
> +	if (IS_DGFX(xe) && !(xe_mmio_read32(xe_root_mmio_gt(xe), GU_CNTL) & LMEM_INIT)) {
> +		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
> +		return -ENODEV;
> +	}
> +
>  	err = xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
>  	if (err)
>  		return err;
> @@ -384,7 +396,6 @@ static void mmio_fini(struct drm_device *drm, void *arg)
>  int xe_mmio_init(struct xe_device *xe)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> -	struct xe_gt *gt = xe_root_mmio_gt(xe);
>  	const int mmio_bar = 0;
>  	int err;
>  
> @@ -409,17 +420,6 @@ int xe_mmio_init(struct xe_device *xe)
>  	root_tile->mmio.size = xe->mmio.size;
>  	root_tile->mmio.regs = xe->mmio.regs;
>  
> -	/*
> -	 * The boot firmware initializes local memory and assesses its health.
> -	 * If memory training fails, the punit will have been instructed to
> -	 * keep the GT powered down; we won't be able to communicate with it
> -	 * and we should not continue with driver initialization.
> -	 */
> -	if (IS_DGFX(xe) && !(xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT)) {
> -		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
> -		return -ENODEV;
> -	}
> -
>  	err = xe_set_dma_info(xe);
>  	if (err)
>  		return err;
> -- 
> 2.42.0
> 
