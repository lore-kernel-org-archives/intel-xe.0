Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25DAC47DB3
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 21:36:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9005110E338;
	Mon, 29 Jan 2024 21:35:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B52810EA76
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 21:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706564158; x=1738100158;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=P+FgXhcePIcwKZfathUIGIlx2gsuxKyWLSz5fJ4asAs=;
 b=amH8Yj6Lu+Sr3qvxjq8JRZefZiwJRtlxnP6NzBma5YlKrzSDGU2biCjD
 Dntf1n12gzPmfUnjujfmen3Y3mu1w/pFUGXKflGi9lxFpp5cXNvZnuA0P
 SLai0Vj/TOCEdzDr8VwTuwmVCXK/YXJPsA1jqOQJ9Gc72667j+Xq599gm
 RS5Yudiq2nZJqGpHIva6BOto8GitzIYE/58nmh2zTCMf1Pus19pCF0+97
 eii9hwKigEakYvxIZ5oB3CdExOppNz2DBK1MbAEt0NgnQkNt4eX0VjfNw
 aSCWduo1urfbFs3NqGx8uQbsyQwxSgXF4/53N236Fh5u5t+GEsd/83FxV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="2971251"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="2971251"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 13:35:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="29934190"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 13:35:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 13:35:56 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 13:35:56 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 13:35:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSAxB6gc5VGwAX747fdbFyg4nbvsiMBwgJRcROqPSDXn8ACEoIBzjqq0WUkl/8EhmpsvtyxH67j2bEbMObo5RM1Pdyt2Wi0fG12drp1uBRQJ/4lxpCS8dxbIteIzxpRCL1QJNv+VwmW/9txIitArM5sXFtK3sw1E22AgNKXBwt+TF+tdnxxp8IHZ1zKuaoz7aF0JurtrjHYjX5q8vvuxnGNxb/3h7YajCaZ1KbmfPb1j4W53ngk5tGFA+qzJfgQP3oukSKxeVuhXRgsFwLs74irHqcsNbiBZtq5oOMK90kj9U3SNSpOhfc4yQvsHzpNG5GgsssKtMZ2WwtCI6/LUyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rh4b0c1kufgLavu0Z9vxjetgZSsD5/Gpv1Ue8DWpnI=;
 b=Al/66DBeTEMZ86FPC4KV9AkuMIUGzQ6jDfYSrj+WVOwq6Cf6X6U7qXHvs6WmIZmLwFBiZgHLLpeTMlUXYCATz7Ip0W6o+z1ErJ/M/bZ0tRZ58YbKNfCn/ehCRkCHRvFYT/FT8mAfXz5lFjmr1fJClbdhXpveh9aY1GdTVwUaoITqf3fGeLeDO+LMb1/q2SXSlkLDKE8dpmwbPhDuForgOrCINPVoSbe4a4vxGxX+2I13YYXfIv2X6IU6sdPReymwZ4yfddHRsg3Tw4vuZuyN5BlG3ylHYV+YH0mXA3QVL15V5cduamYYawstXg+M2eX1Cokj74lF1yLsgkqAMHdDrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.31; Mon, 29 Jan
 2024 21:35:51 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 21:35:50 +0000
Date: Mon, 29 Jan 2024 13:35:48 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH v2] drm/xe: Use function to emit PIPE_CONTROL
Message-ID: <20240129213548.GN5506@mdroper-desk1.amr.corp.intel.com>
References: <20240129211509.325973-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240129211509.325973-1-jose.souza@intel.com>
X-ClientProxiedBy: SJ0PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a9cdb7d-8e06-41c4-dfa4-08dc2112439e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: esYSQ5KRX8UFSVQR5+pmQgkhmnpk4OVI3iGxmjNypq9Fd55I1L8iIcsPeBqP2/3v8rUB8NrtxrJQ8KDUQO3v2uN+uQSgCNLdJga7Dx5eaPKCbVUm5vSjr8IbywQE6AMmpBNFVfQeaHSYEm2pH6rSibU5oOMRc/+IDpeofua9DkXjPTsEI2+m+iKuKhLGS/0vn/70gwwsU2qLG7h16dGA9jkMVRvtqW8DvQMbuWAE9V3PTFU5GjITe68CBVNfvppNrRdwMdTGCszVFpMO/GEzo8J0gRcCYXOFYbddfMnYqpuWKpojMv8SU6brzvZ/MF+l+ECSCGrzG5jnID96shZ0uIUpINf0cO6ehomBtwczXFZMLFhnG2cbHYCVMtJOpuaXbPePLNawir/Rw4GUB8xTifTNb9t4vGmctG16cuDVs4FaQzCFAzXDiPfgQsEB635XfGLGi2Px1XctKEaMisuKNFYEc4mqnwFRFIcEIsT+IPTVoh+18+hVvMS0tN3giyhMUurhnaZOGoB7V/HVsHojnlddsG9bl+osheckAvQoZRAQM4dOW/BJETxqzf+RJlCZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(39860400002)(136003)(396003)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(26005)(83380400001)(1076003)(6506007)(86362001)(33656002)(6512007)(82960400001)(4326008)(41300700001)(8676002)(8936002)(6862004)(5660300002)(38100700002)(478600001)(66946007)(6636002)(66476007)(6486002)(316002)(2906002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zUYXln9XGEGm0s3kd57J1LlViSEM1a0yoWRMEaI2iZdk3phmDzimkL4Edk?=
 =?iso-8859-1?Q?iOFuy1e8wTNr6wJYkPZNDGy/pfD/8nRN1EBlTZJev/N2pozNAVtFXpAqAV?=
 =?iso-8859-1?Q?DQ0QNPgR0y9VLKa1oskV/TUzdVK/4HgSv/9PYd0hp5NOYWSyEHOODH0G+Z?=
 =?iso-8859-1?Q?FyPosRKdkko2+nGaNMfs2xo10Oqw3/YjuL9/3xiX+oLu02ywTh3qX9ctZm?=
 =?iso-8859-1?Q?uE+iw0OMSVxMYcCqJWM4OV6vwck3siQtSuAEF3+s9t3FAneMtgNAa0iSCe?=
 =?iso-8859-1?Q?fK0y1JpESYLa+7Ws/RvRBL7xkcq0jCAxbAybwvW/2w1MfLrntLek6NT6bK?=
 =?iso-8859-1?Q?OeE1KX9ksBSxOfmPd0k0hZAMK2jM/RLCoxNnlaWNzlDfMnkTw0dqx0L8yd?=
 =?iso-8859-1?Q?6NoSWZcV1evYynIcf6XE3nTQ+F6O+Bp5yGJckVtMJjYWuYUrebhZE15jT3?=
 =?iso-8859-1?Q?plEg1AnefdEPxLXboAjMswROBaTLk/7g2XIl7XBEklIMt/t43uKR3pWRPh?=
 =?iso-8859-1?Q?NgfNdwW7IpyGAq5nViZHev8eAX4xJH/wS0NzkrK100HpuuiaRJfaUbjzAB?=
 =?iso-8859-1?Q?W219rm9f/yU0aTCXm/cDBOWlWutVwNFPsYhMq5cViwaYlbSEtvdSt4x9RM?=
 =?iso-8859-1?Q?q0ZgH3uv9p+k0GFe4teSZ8h1jxwFMwmas0P6cPjcGN6bHTvJbKQDynIFR9?=
 =?iso-8859-1?Q?F4ZauQ2bH+nUJ+d7nR6hcahXu8INVQjVOUBxkQQZBBRSRB/ocRHNmKj0tr?=
 =?iso-8859-1?Q?O/h+HbX8FipoRRnrvw4cEg0LWta62abQtMi67Oejl70GuI80RcrpWoX/dE?=
 =?iso-8859-1?Q?1T7oxEoIAadZjnMYV+/KHrygU5XwUnSxjZYjQT0wTHh24dfDk3WkD9D1Mr?=
 =?iso-8859-1?Q?wWnicwQEdWs9rPPEEGTEqoNuJq2KFUImleFMX4t4eaZl2ssEnwGlBG03x9?=
 =?iso-8859-1?Q?SCAi0y4XWeSLmbX1x1ovBlMj/sMBJLEL12l2x/6ONrYYy/Q6NO7Kbb2cyN?=
 =?iso-8859-1?Q?6a5Zu7bwzMPWdUfvQTvkl4pJMonOHQ2K5G5Y6NVqPL4B5zjL9mpTooOllw?=
 =?iso-8859-1?Q?bqbLRCy1qUG2HkATS0G01SLyW89ogu/Fo+ShjbrjA+GgD9p7ctIT/xkbRp?=
 =?iso-8859-1?Q?sMUh3d5lTuiAa01xJtevqk35wTPZtIJN16+Oz+C85+h5F6HdJthQfMK448?=
 =?iso-8859-1?Q?kFN/X3ZfdtRcDCesuxuXPr2Bkhw8BbQ93n63lRCP2vwpnWCdbAB9UmMK43?=
 =?iso-8859-1?Q?AS5SBdDItdpFrIlNSoq5NAF/4nTr8CxHd1U3sXWiMIy3NIAOsD0SaoZKZR?=
 =?iso-8859-1?Q?zYBbNSbMw2R/46w4Mvl4mKC/OCdRRqIo99vO59nlaE/A+gYzFyCOu58iYr?=
 =?iso-8859-1?Q?TsCVLUprryi/Dd5aINBXZU4wmCven00G92CTPKjo2FDM2fmyot2vxtSDxe?=
 =?iso-8859-1?Q?pjJU96bvRuzkxHpil/FuG7saqWYmqenIiwaGYSR/P9Mxn4wOCYrNTg0EhN?=
 =?iso-8859-1?Q?DU3xnJNt356KJXyYboTH/7WAy3DKxuUFpdnDrnPcvcARquNmaKu9pfJNuq?=
 =?iso-8859-1?Q?0NlIFDut8umXkJYhHSm7RNZN6b6iZVzFIAAIVVElGONZIQy6R5QVqk7+cY?=
 =?iso-8859-1?Q?zUW5O8M+ZOE8eKaxV+0ooLEzARf21x1rvLrU0YFThSekvlP0SKJ9U7Eg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a9cdb7d-8e06-41c4-dfa4-08dc2112439e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 21:35:50.8522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8f2cpXU/FuXRfHP69F5pFjBFw0QI8Bmm6aEMLKhrF8AGYVgOH+ynHe08wQxWYyI3EtKl8oWFINLgXwM3zDGm0gB0zuxwd1c2ckOmOvxVano=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7149
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jan 29, 2024 at 01:15:09PM -0800, José Roberto de Souza wrote:
> This reduces code duplication in xe_ring_ops.
> 
> v2:
> - fix flags of emit_pipe_imm_ggtt()
> - reduce to only one function
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c | 57 ++++++++++++++------------------
>  1 file changed, 24 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 1e4c06eacd984..be488d55325cc 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -113,6 +113,19 @@ static int emit_flush_invalidate(u32 flag, u32 *dw, int i)
>  	return i;
>  }
>  
> +static int
> +emit_pipe_control(u32 *dw, int i, u32 bit_group_0, u32 bit_group_1, u32 offset, u32 value)
> +{
> +	dw[i++] = GFX_OP_PIPE_CONTROL(6) | bit_group_0;
> +	dw[i++] = bit_group_1;
> +	dw[i++] = offset;
> +	dw[i++] = 0;
> +	dw[i++] = value;
> +	dw[i++] = 0;
> +
> +	return i;
> +}
> +
>  static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
>  				int i)
>  {
> @@ -131,14 +144,7 @@ static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
>  
>  	flags &= ~mask_flags;
>  
> -	dw[i++] = GFX_OP_PIPE_CONTROL(6);
> -	dw[i++] = flags;
> -	dw[i++] = LRC_PPHWSP_SCRATCH_ADDR;
> -	dw[i++] = 0;
> -	dw[i++] = 0;
> -	dw[i++] = 0;
> -
> -	return i;
> +	return emit_pipe_control(dw, i, 0, flags, LRC_PPHWSP_SCRATCH_ADDR, 0);
>  }
>  
>  static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
> @@ -174,14 +180,7 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
>  	else if (job->q->class == XE_ENGINE_CLASS_COMPUTE)
>  		flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>  
> -	dw[i++] = GFX_OP_PIPE_CONTROL(6) | PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
> -	dw[i++] = flags;
> -	dw[i++] = 0;
> -	dw[i++] = 0;
> -	dw[i++] = 0;
> -	dw[i++] = 0;
> -
> -	return i;
> +	return emit_pipe_control(dw, i, PIPE_CONTROL0_HDC_PIPELINE_FLUSH, flags, 0, 0);
>  }
>  
>  static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32 *dw, int i)
> @@ -189,14 +188,9 @@ static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32 *dw, int
>  	if (hwe->class != XE_ENGINE_CLASS_RENDER)
>  		return i;
>  
> -	if (XE_WA(hwe->gt, 16020292621)) {
> -		dw[i++] = GFX_OP_PIPE_CONTROL(6);
> -		dw[i++] = PIPE_CONTROL_LRI_POST_SYNC;
> -		dw[i++] = RING_NOPID(hwe->mmio_base).addr;
> -		dw[i++] = 0;
> -		dw[i++] = 0;
> -		dw[i++] = 0;
> -	}
> +	if (XE_WA(hwe->gt, 16020292621))
> +		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_LRI_POST_SYNC,
> +				      RING_NOPID(hwe->mmio_base).addr, 0);
>  
>  	return i;
>  }
> @@ -204,16 +198,13 @@ static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32 *dw, int
>  static int emit_pipe_imm_ggtt(u32 addr, u32 value, bool stall_only, u32 *dw,
>  			      int i)
>  {
> -	dw[i++] = GFX_OP_PIPE_CONTROL(6);
> -	dw[i++] = (stall_only ? PIPE_CONTROL_CS_STALL :
> -		   PIPE_CONTROL_FLUSH_ENABLE | PIPE_CONTROL_CS_STALL) |
> -		PIPE_CONTROL_GLOBAL_GTT_IVB | PIPE_CONTROL_QW_WRITE;
> -	dw[i++] = addr;
> -	dw[i++] = 0;
> -	dw[i++] = value;
> -	dw[i++] = 0; /* We're thrashing one extra dword. */
> +	u32 flags = PIPE_CONTROL_CS_STALL | PIPE_CONTROL_GLOBAL_GTT_IVB |
> +		    PIPE_CONTROL_QW_WRITE;
>  
> -	return i;
> +	if (stall_only)

I think this is supposed to be !stall_only, right?


I was going to suggest still adding assertions to catch "easy" mistakes
in emit_pipe_control() like not passing an address when a post-sync
operation is requested, but then I realized you don't have any kind of
gt/xe pointer in any of these functions, so plumbing that down to the
necessary level would be extra work.  Maybe we can do that in the future
(I think we'll have to plumb those down at some point soon for XE_WA()
matching), but we don't need to worry about it for this patch.

So aside from the stall_only condition inversion,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


> +		flags |= PIPE_CONTROL_FLUSH_ENABLE;
> +
> +	return emit_pipe_control(dw, i, 0, flags, addr, value);
>  }
>  
>  static u32 get_ppgtt_flag(struct xe_sched_job *job)
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
