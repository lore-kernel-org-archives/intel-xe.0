Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB39D3C53F
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 02:52:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218C110E0D8;
	Fri, 18 Oct 2024 02:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SPt4yeJC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3107210E0D8
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 02:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729219919; x=1760755919;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6m/fFiLOgSkNr45dchf7c/87vcgzF5mpjQyMoEAx3zk=;
 b=SPt4yeJCRKTTfqnE8Kgzm5VX39fhjADdhzhtNQXuEaEYknhGTVpBw36K
 hB+ic+4RwltltxiHM9kwWjWEllmHMA/welxaGPv/vwTe0g6fUvcgkyEo1
 Usnj/uHQLzbzUnV2C0EStXl5um2RU2zEYC/1g25Nk6dceBevtkvd+KYjQ
 0rOMvU3FCIV14wigHvSav0sjZgJM6PnoiiwWPDCR+3sg34dzOc+sWmz5f
 2/w39hfEG72lyMxgTnNv3r8aUgsYb7q+tjRq5ALWLN3jA87tkxp8gJmQi
 ggQ+Ku0VTgj2YGH7zlomUujiWieaCifoEXWePinPw5C7dPKH4Zt/CV8IP w==;
X-CSE-ConnectionGUID: x6TiRrFES7K4r6su+uWLqw==
X-CSE-MsgGUID: WWocrbrfQ+CWZkewDktzFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28870628"
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="28870628"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 19:51:58 -0700
X-CSE-ConnectionGUID: BPT/6ui9RDeETh6Lv/xo7A==
X-CSE-MsgGUID: jE3d2GPKSV+qOR+QIpSr/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="79086596"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 19:51:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 19:51:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 19:51:55 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 19:51:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lPCa48QAdyq1V9Cs88QepU1HKOM3XWc/G9XzhqMH291jkqb2+pHgY6y6lVGPeexIoqqghpJu5h+j3qWninv2Rza1q6EavVgOjdOkuGrMMdLOPIchDyUusdJBrsBhM4xx6tHvfkD2MfqWDYjwxTU1XAdI+1fgTYJ8jqS36273qo955qPJ0vKuba+3IeDnWUOC+u4Yzd7n9rECA9h5fhWvPtnmX8zNSjiX/8fWcywYS3isrCNWB8xGdKJMGpivYmZ4gbRjz63In7oW1X/oFjKQL9fm9ZU26g+pnUag8GTuEtfXVKff0Jfcw6bUnRsXWtnARVSbHDf1CO8uc5HBuQr99g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93LLp0ErKiNaxAWkx8XY0HZGeljBvbCDhTgS5cb6U4M=;
 b=rfllidL6GmQfhrUvLluXUzeCQ8cyCjzGL2AVhmqUK2IM1V/K8t87AELDG45ryit/D5duBQhffSYAI0FVswunR0EHGgZgbvm2jmu9dVwAZH2kfOBpesA6R6Fugr8suCs/7/7K5900WXXvnNNig10/uoYr/jnxtwm3oZ8Uc5PN+gDhtOsTUw3Ae4OkL/xDSh3a1HoLtGEQSdYF319+99+K6EUFeUsiBEQu9kVITSXeokXPodJY2v8iK1omfBfstscHgGmWLYiPcVjx6wKH1l8sCCC1MFRe0SB0nYUrsCL7QWSAD5/br+aq2tQWg55cuICTdEmboNm8s2bFoAz+D5EDCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7644.namprd11.prod.outlook.com (2603:10b6:510:26a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20; Fri, 18 Oct
 2024 02:51:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 02:51:52 +0000
Date: Fri, 18 Oct 2024 02:51:04 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Francois Dugast
 <francois.dugast@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/ufence: Prefetch ufence addr to catch
 bogus address
Message-ID: <ZxHNGEnSLoZGsUm1@DUT025-TGLU.fm.intel.com>
References: <20241016082304.66009-1-nirmoy.das@intel.com>
 <20241016082304.66009-2-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241016082304.66009-2-nirmoy.das@intel.com>
X-ClientProxiedBy: BYAPR07CA0062.namprd07.prod.outlook.com
 (2603:10b6:a03:60::39) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: c20f7526-5b27-498d-4aa2-08dcef1fd1f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Bs6KrauwtoTlLbf/hGEMp1nNE8cah9WGlDSwvC79Sct/hv4n+IzDm+v9H/bj?=
 =?us-ascii?Q?Zy04b1w2vhC9raR+wSYFytAiD/aQcUAKa1kTe1l3GWW8fh/aU9SLkqVgi7Ab?=
 =?us-ascii?Q?wCwRn9n2r3plZ9Dn6Hxvns7JyD0QUWLInkz5eesDsogsQpCtXScuiQmA6N0w?=
 =?us-ascii?Q?1lZqiKAEovfALGDX9UgXejgch9LNgvEIwBUnDWx5Pp/sBuaAb61Fcldb3AsL?=
 =?us-ascii?Q?4b5nf2WqpsE/BsUWTzzS4/tPdNV8qr8mMfKf7MhirOv7+HOMGV/YLWez8rJR?=
 =?us-ascii?Q?aCpQQHBvj00sIjwzlRCVRPs9Uqbenx33foh01RUKH794y8TP7mpBv7J4spAx?=
 =?us-ascii?Q?vYV3zNjrYfdQ0iArnpK+y6iFdz4iLcmsbCJAyIibAcVnb3S8E3DKTvJYCvmx?=
 =?us-ascii?Q?DZtMvdAawumqiIZl8awWDX8Hmdq859rW7uR9k2t1M8FA8uU2s+gYvqszTSfM?=
 =?us-ascii?Q?gpdTC1kb49T7s0M6aiFjiKCn02v1ynrkSqTRITvAvTJx2M9dbWMclk0EEQFV?=
 =?us-ascii?Q?56G0jrGixxwGWJ3598zC5UcFa1U1OuyE7krsA6AfORud1jj1ZWqXIltXOff2?=
 =?us-ascii?Q?D7Qs5mvrNlaXgP5QXsFjuFZUWDuGOOwkX6B8N6eJKS2Zwgg1gudDAbxAm+zF?=
 =?us-ascii?Q?qTRvqjeAAjjCJnhy/1YY9Aadbw3xwWvM8aUH/FZnep9FSxEarSlWPCoQwMyp?=
 =?us-ascii?Q?xCs5yEPU0rRyhosRIFri9jycZpiAwbv7a6SOlEzvRrzIA3OORmanNTNisKHE?=
 =?us-ascii?Q?xPnjIX0sXYk/Zu6Yn+bXLaPf4ytgrbA3qY+MKKlKMuhKMPGLae0Cq+bs3oCL?=
 =?us-ascii?Q?g3/zlm+zeveoVLRhvtCBM99MNeGclF/y1wDGtVpjST+bU8xtIy3g+yIJcWNb?=
 =?us-ascii?Q?tKW1N8SgfPh2YB1xDP8lJiGGMu/eCOCdL+TyzAYGTFa3Kw5BDVdoPgkYUoWd?=
 =?us-ascii?Q?kQKCiL4OXzng4t8MfjnTXDsXwRifgAqzYx8aFK9gUGpYogmzFD/moMmqvxzR?=
 =?us-ascii?Q?TOF9iPTvZfPwEC3fkqjTabnwC+VCFpGt/3JxV7RJsGRDLWVBgMrtcuHlmXgf?=
 =?us-ascii?Q?pMQssxQqZ81kyL7J0wvt1CH1YbkInetlc1sUGSfBIH95D1mROuIoo8oA5/VL?=
 =?us-ascii?Q?2PqfYXS4AK8rQq/T0XK8cDUC0VCm0JrCLs1Jluw/9mx6w2W/s6l7ggNNTADd?=
 =?us-ascii?Q?SMqUjOMOBZuifR8BZqX/qKEBii+S2xPxdSGHFpv3kkDbILBrkTDAGC1ehOD3?=
 =?us-ascii?Q?k9mv85B/35xokjE/jsRC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+EmBT5RUBVVaDijtBTtOlHaf40cH1UuWxP3fi0IerTh6CUKm4yiOq/MwFQU1?=
 =?us-ascii?Q?BT4jblR+i+OzD0AsP84i80CdmoF60i3T6nFx3ddh/K2TR/AmPUbFWSt2JZTS?=
 =?us-ascii?Q?sED8c4xoY2DQrTZUjlc0SjaFem+vkhuAFucVsCSgvskf1i0s6BS4vwsDfmU3?=
 =?us-ascii?Q?WYUf9qPDk6PD8MLz9ZzB50o+lQG+8jx1gXPAWIODGkPQUkGjx/TqKCq+0Hnz?=
 =?us-ascii?Q?4VPDMRQup2r5A2fFYVY3Ad6eN8BtEccTsWIes/rxX1IVpuO6+qYfpgAv04X5?=
 =?us-ascii?Q?/hH5vCoj7zXxPQ3ve6ykprHlKK3Drl87X1QO6qshukUThedV2NU/CXBXNoou?=
 =?us-ascii?Q?l3FJjdq50ASKhfpoUIRpq5TTinAPV9i/q5WYu+JyAFJfnhTkvJ4NmrCrEGCC?=
 =?us-ascii?Q?AHn7Gctm6SZCEjD8bIWBvUfw/lcjsQ/T5CtohYU6oGyGhvmfDJdWa7pltdN2?=
 =?us-ascii?Q?fcbQ5/W36scLcIJJXYvJ8GuMu3x/yiVSTODzGwsUa2p24Wr4a82NEBEIuR/U?=
 =?us-ascii?Q?BAssHFxv6aeB9fM4KNxI1pjyZINUKGi0RIwIRoXwMcT7nlk5A9PSOJZ2HI3E?=
 =?us-ascii?Q?kepByqOByu/XxejRTFaeXUHAdwDZ27MWecgk+m9U8M+ucVJGGk9rxh9Zliw+?=
 =?us-ascii?Q?hpaiFdI4gpDhy4i4b0Ke6jefgomuNaM2iIG0tTtZEFA6CbSlKcn6vG56l/4j?=
 =?us-ascii?Q?8JJG5M74NMuIx2lGUcwSD3zo4e0JpNHFzJVZWRJbNnwmeBAAPkDJQcILF/XG?=
 =?us-ascii?Q?QfLcIIxenU84vmJtqMeW2rKOrZaCEvAYyQwFqi9oI2VYGM3wHyX0WE1HL7UG?=
 =?us-ascii?Q?6Z0OBK4DVEnpt2GDOAvbS0mRFh/uVdzSCeW43DB2oIm1bat1DnQQYejeGPrC?=
 =?us-ascii?Q?eYnkjykR1DsPnY+uZBcWO/0ljurf6ezWwzsq2hLXlXFQC+MtgrVzxerRxdcN?=
 =?us-ascii?Q?FLOlCYvqo0fCN99zzdSxyxgcOD+Qx5PEmr20xlwhBrK+Hxkq1ZvgWthR/AKg?=
 =?us-ascii?Q?jqgUzW6PdYxJToTHM5yPyro87GxhDNf+Qub5+HJ5h+qV034A4/ejSK+wF76Q?=
 =?us-ascii?Q?b3BnZqdNEzRV20hmCCS3Njq10kdT3l+6kao4R5Ainru0HsLtPFWpkWZEWll3?=
 =?us-ascii?Q?MxfucWdP3khs1agEngiQq99MM2zNHuGr4/E/AfsfPO+d7u0EQk78Tb1zbGBi?=
 =?us-ascii?Q?GMKMvTCv1WZ/+6CqEui2XT2rLoQvVNx9wcn057kOPAIRYpDxfRZKmZDjJ7Jo?=
 =?us-ascii?Q?x/N+0lTnKqHYACzcEcjVHV0nC3k5KeUYl4FGqrHEn8SBti4KMmhN4Q6qouFx?=
 =?us-ascii?Q?4nGwAyBkRjAja8r6vqmEM3A81Jtp0j+toIf5upuhog+lQ4u/eLkxDrlt1Gmc?=
 =?us-ascii?Q?8x5Iv7MelgMuMtA2ErVXUYjd/S+6ThONPCI4qYyHy/LkPE0kLpV2ZOVCYi6z?=
 =?us-ascii?Q?ovoCgrGO8DUc+4e0ukr2QPyCDbGie3XcwObGjvjXSmFfccK1zNHECImcwzNS?=
 =?us-ascii?Q?VSF9dZ+npHl9n3nkQiX6HpmpdkHQl9NEUI7dVmS2TfiIfhNEXGiM8VgoiO5T?=
 =?us-ascii?Q?yUHmjgzmbsYIOI8xaAuExfGuS9b0+VFn/xn8q7WLaMZrynkFLjHWcYPr4CE0?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c20f7526-5b27-498d-4aa2-08dcef1fd1f5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 02:51:52.6971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BRDjXAhsofSmMvougw4uSUA40QNmKtAr1CMMh4tHhkpCDthL+Jmi0DChq9i1fOxyFXzmHcGIruI/w2DJdwIP0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7644
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

On Wed, Oct 16, 2024 at 10:23:03AM +0200, Nirmoy Das wrote:
> access_ok() only checks for addr overflow so also try to read the addr
> to catch invalid addr sent from userspace.
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sync.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index c6cf227ead40..2e72c06fd40d 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -54,8 +54,9 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
>  {
>  	struct xe_user_fence *ufence;
>  	u64 __user *ptr = u64_to_user_ptr(addr);
> +	u64 __maybe_unused prefetch_val;
>  
> -	if (!access_ok(ptr, sizeof(*ptr)))
> +	if (get_user(prefetch_val, ptr))
>  		return ERR_PTR(-EFAULT);
>  
>  	ufence = kzalloc(sizeof(*ufence), GFP_KERNEL);
> -- 
> 2.46.0
> 
