Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885F8C47DA9
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 20:36:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A56B10EF1B;
	Mon, 29 Jan 2024 20:36:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DF510EF1B
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 20:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706560613; x=1738096613;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0jyktDWSm9RWJbllHyOGgAB5OF/ABO7igRz2iUMwPvY=;
 b=nREW1k27hIiCzjwuhKrnqfAJi2bgo0DtJ84DnTrmr5D5dX9oIC8xoYWG
 eEG1wQSa6/U/1S/u6rx+tiYjgELUlNLrAOqsPphdBPbpjA31S09P4W1QI
 P7ViyJZ4F8qplSXRez8T+ARgsfvrUKIW7iPH4a0AEhrvcy1j9cO+yBnuD
 AVqP8NaTbw4YC088TpLv/Ojo8EF6hBYGj0VvUj6xerTgAPsEnQxW4Jy6j
 YAu602Tqy8v+AHtWVohf7baTLnBg9JxOUQErlruSDHAJ12Q6GQh6sb60H
 iFDkJG9ZRQvThDQrROPfusxTc4cEe6H9OnM6UIOvMP+F/j1mMRmZRBe7c A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="16614408"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="16614408"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 12:36:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="931206779"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="931206779"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 12:36:52 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 12:36:51 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 12:36:51 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 12:36:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8QJUo81AVs6rZc+ifpnDhxy/TfmnLGtdExJwv+GwgmTEPQFANZsTR2kSmPD1ygXFYUH+HQ/K69oNMu3gLjHsz0vPPPLn8IUTrUxMeQZf+bh3XgVjFJJeMcOEtDv+/w/2aRuS7iNgKYb3O5jb24IV/nv4shiN7GK4QsLBdZOAIeHCgernsvPXXIG2PD8ZhBJs34GKaOC91keZgzF1WIa0hbfO1XYREpoiu+84HKLY6TmxFvLz+xmFFkL1XKP6MRKbLsA38krqaeMH8O5BsvB1jGU6QaSqgzX4DORqBYGHuEWjNK6Ar4FfqeZDaXxsQZU7CVQWLWSjf5vhx1TxjDziA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6T1PaAIsTqOlQfpzmbNp1wH4T7nZf4DT5a6BPUE8HI=;
 b=hhupcLQoOgjplSRvSwgup4vgPZOGw9IGEQe2hLdZlpFToUHUaCT2gM/IBApQK817x3FrrQf6gp+DqsGiNmGDYz/4j32kCqlfF0SyVlwxUzWnAZyW3wfrMc7/4KIir7hy1gIF6khhTN+jUpw2DktxSDiHrFK9Yw/OoTKj05sUgujvu/kNNd1hBngOC88NkSiCxn3o30e4fjpqHOPba6yas5KU81Anu8bD142g//eKVdvC+LNkkw2/Iow0xKQ9HU95hRxefIgj/VKAxFENx8gn405zqvnFarvW6MAMau6Y41Wy7uAOBM26e5zBsEwVelzkGObq4+bAs/by/qKRnDwJxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Mon, 29 Jan
 2024 20:36:49 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 20:36:49 +0000
Date: Mon, 29 Jan 2024 12:36:46 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Use functions to emit PIPE_CONTROL
Message-ID: <20240129203646.GJ5506@mdroper-desk1.amr.corp.intel.com>
References: <20240129194615.282624-1-jose.souza@intel.com>
 <20240129194615.282624-2-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240129194615.282624-2-jose.souza@intel.com>
X-ClientProxiedBy: SJ0PR05CA0117.namprd05.prod.outlook.com
 (2603:10b6:a03:334::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 517dc6a5-0326-4893-611c-08dc210a0482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7FkLMyNflp8yqO0tIhvaZl53yQ62IBNDuok3Yu5l5D7aujLiSQpK97wraqfvyxBf650Qsg90h/OTVhoLUc0qYYAot56C+EcNIUyx+Wue34EJf8IS2lIkhQrqiOqjR7Lf/rB46X10PzV0IOxz6fRfn3/xZzYLh5u5ZN8nM3CvuZ9W/m0HFBIJv9HN5OjrVkkWt9/pUq54QsMtFUE2B+cd0W350QGBTNwz3uUgl/RZwSZakFPhvJjL9CGyJNxX9R9b3DIUaJEBlansOnsteH1y9qQzjzZjkByN8JUZ+uFIcKDX4jn6espVGDVwUucTygyQPbrQ49yWdxaE+Ne52Xg05RzIAzeVLEZKSHWzaQ9BI/DDD7C/HiCr5NAo8cQj6yJehX6vrcIRqoF3usBq5ew/+Q/Tnq81/hew28x2MTIRZxPoIvXUa50K+7FuNWNrbxygKLJbnPDgvfPh5SzFb3tG9fWFESt+Uo/g9a8HSWAtT/lOKLSs9FsUgLuXucO+GC2BKcxB6Qet5xR84wBeHF07NvT49+4VcRPuNeq0GRZPJu3vg1gxwtPG3Ne9JNMttmoC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(376002)(39860400002)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(83380400001)(1076003)(26005)(6512007)(6506007)(6666004)(33656002)(86362001)(82960400001)(8936002)(8676002)(41300700001)(6862004)(4326008)(5660300002)(38100700002)(66946007)(66556008)(2906002)(6486002)(6636002)(316002)(478600001)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xoCJR1Uh9X/NrbgOppgz3N1VqL43qEZOAVwHwW03mSWkIoj8DD7FcMq3TH?=
 =?iso-8859-1?Q?RgT+V7XUmJSnrn9C3S4R6hu9Lqait19Fxao/bBXlqIUacOD4dUZCBcI1kk?=
 =?iso-8859-1?Q?Da/N2CFxMvUtrS5FVbCbcZpcVcUGgIBp9Wru6dPsZFt+DQQ0XiEvT2AF9G?=
 =?iso-8859-1?Q?0r65thb9ZPXtKH/GSVr32aLgGIQvkYUfHhEWID+Nn5vDTXGwuE5kQrbkju?=
 =?iso-8859-1?Q?U7t4XkMQKtpCNAd3vXY2E12ZL3bLkGlNN8v+2Rfvk4tXV5eNGM69nMx+XM?=
 =?iso-8859-1?Q?tmDRzC9Py7mWfP8qdtLivfwSQBrjjFzlxUiR02P2ALwqdg2Bt07ArYm3pU?=
 =?iso-8859-1?Q?PbB/b9a6CQsh70bt/779fCj1sQsl8B2EgVqRmKpZpBzGH55f5zbiz1PDme?=
 =?iso-8859-1?Q?hYCAWTOgPIdRgj0nFpa7WpijzMZegWXtdyr41u4H5PEuedWMM6g4T68HtZ?=
 =?iso-8859-1?Q?hmr4U2CeESRa+ZZYfM+yRxxB5nWDmO2qf5FugJKTGnwEbTUqwOl1tuWBAy?=
 =?iso-8859-1?Q?7a/q03XSnJzs+lzLZxHZLykrHoeb08eYxOxVHCW+z6Qdg/NnbhKNiwsu1G?=
 =?iso-8859-1?Q?6IhgmBEzGYRiNU6BJoLgDzVNjESAYz0iNFYLIdg5ubD08sFMILKdIYrp/y?=
 =?iso-8859-1?Q?JdU1QB03UiWXA5Wqks1r7MRkOAwaBgdOms3cQULl3QtrDrB+AKLhP40ajy?=
 =?iso-8859-1?Q?OjnZCxhOVdegFDvTJIdZ8FcVfy8Cmz93yBT9KO5f0p/d9OBywnEIePeEfS?=
 =?iso-8859-1?Q?owbD7EkrmliM9ULHkrPHsjkruBwdkNXfRVbGh3/nwRIIUPcjPZLeph9opl?=
 =?iso-8859-1?Q?+iMD2O/IywYwGTCKBO0LclnV5kAPMwaRKiM+VLNVHpZK3Nh97lLMm91Aa1?=
 =?iso-8859-1?Q?2Dgt9TNWOBqRr03Xz+fndxfASjQ5s0yaRMwSMdS1GVr+klSQCOuXOpj5N7?=
 =?iso-8859-1?Q?gNGr7na/MSjlHKx5alzYD6kcDN2qXXGgdEsnMVw7GpQ2PE+ofnCfQS6JsO?=
 =?iso-8859-1?Q?/FvmNwlXyTdR38FxmOO+KqAWOuls6sbKJZbUj9iQYkBj1a1XE24Vm5lRVl?=
 =?iso-8859-1?Q?/LTUvTPtIAc+33v/Z2yJo6YgSE29/FPnpPp2syXmiL2Rc8zXFwb9Bf3tPX?=
 =?iso-8859-1?Q?I4FDTiMMwnQ2ufHL90EoGHBdUSqucMy+EcXsFe+mFAwf0vg9al6j+0D0OG?=
 =?iso-8859-1?Q?wRQE/rWr+lwMN/prBhMokLtaWuZEXIVIEbVCH1dZbWaCf5Itm8wsmJvnJ6?=
 =?iso-8859-1?Q?gjhjfLsD2fh8ke7t2k1kbIcKyyLQKUM3zP+GaVEt7bultOXZh4YlmdUk3+?=
 =?iso-8859-1?Q?MXeq0R6EVhNAFHkwHaJCpmaqLp1XmBckyp+zbiGgATbO4PZReHSwVZZlTV?=
 =?iso-8859-1?Q?mjjMUXh35yIhHjGasyRaBMVeiLRdgnT4VpJs0LRCeNxkH6OKIuXzJS2sRE?=
 =?iso-8859-1?Q?2qAqiw7A4OrfM6wyPw43UgAqxDC2ePYyMso3kJ7Iy/WMnJsfet+pX0el7/?=
 =?iso-8859-1?Q?+rStEDKjRkp1XXkoLhOIG6DcM31xOrvNpRZV0xndwy9dcIuChhTk4OxeSE?=
 =?iso-8859-1?Q?afFgTjgk94QgIUlJ+qFt9zy1WSI3JQjlvd/QMZbquD98487eQvtG4X38Ce?=
 =?iso-8859-1?Q?H10zE51r2ZoRb+07KyNWffnl6gTcjzVM47AOBV4YQFYo+jhx3SjvupPQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 517dc6a5-0326-4893-611c-08dc210a0482
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 20:36:48.9847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xRxRinDohxBYiub8wa81OJ2buenu+4EHny9Gd1ZhIEOGqlJIYiIRY9xLK9nOuK2TVYoTUFKLlUvGQxhLJ6ucRbaENUt++SJACwaqMB/mxVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6796
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

On Mon, Jan 29, 2024 at 11:46:15AM -0800, José Roberto de Souza wrote:
> This reduces boring code duplicating in xe_ring_ops.
> 
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c | 60 ++++++++++++++------------------
>  1 file changed, 27 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 1e4c06eacd984..4eb8808656886 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -113,6 +113,23 @@ static int emit_flush_invalidate(u32 flag, u32 *dw, int i)
>  	return i;
>  }
>  
> +static int emit_pipe_control_full(u32 *dw, int i, u32 bit_group_0, u32 bit_group_1, u32 offset, u32 value)
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
> +static inline int emit_pipe_control(u32 *dw, int i, u32 bit_group_0, u32 bit_group_1)
> +{
> +	return emit_pipe_control_full(dw, i, bit_group_0, bit_group_1, 0, 0);

It might be worth adding an assert here that PIPE_CONTROL_QW_WRITE and
PIPE_CONTROL_LRI_POST_SYNC aren't set in bit_group_1 when calling this
function.

> +}
> +
>  static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
>  				int i)
>  {
> @@ -131,14 +148,7 @@ static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
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
> +	return emit_pipe_control_full(dw, i, 0, flags, LRC_PPHWSP_SCRATCH_ADDR, 0);
>  }
>  
>  static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
> @@ -174,14 +184,7 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
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
> +	return emit_pipe_control(dw, i, PIPE_CONTROL0_HDC_PIPELINE_FLUSH, flags);
>  }
>  
>  static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32 *dw, int i)
> @@ -189,14 +192,9 @@ static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32 *dw, int
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
> +		i = emit_pipe_control_full(dw, i, 0, PIPE_CONTROL_LRI_POST_SYNC,
> +					   RING_NOPID(hwe->mmio_base).addr, 0);
>  
>  	return i;
>  }
> @@ -204,16 +202,12 @@ static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32 *dw, int
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
> +	u32 flags = PIPE_CONTROL_CS_STALL;
>  
> -	return i;
> +	flags |= stall_only ? 0 : (PIPE_CONTROL_FLUSH_ENABLE |
> +				   PIPE_CONTROL_GLOBAL_GTT_IVB |
> +				   PIPE_CONTROL_QW_WRITE);

This winds up changing the logic; previously the
PIPE_CONTROL_GLOBAL_GTT_IVB | PIPE_CONTROL_QW_WRITE were included
unconditionally.

Also, it might be more readable to just make this an 'if' rather than a
ternary operator?


Matt

> +	return emit_pipe_control_full(dw, i, 0, flags, addr, value);
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
