Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E895EC54EAA
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jan 2023 17:16:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90C110E090;
	Mon, 30 Jan 2023 17:16:13 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EBC10E064
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jan 2023 17:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675098972; x=1706634972;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hPtZxsZy89p2mM5Ewzz8Z7jYfNlZpEDKkLBp+oS3lkM=;
 b=F71Ae2RMli3CJSC/hFGh09GWLIxRx6NprC3dmAAVc4TiAVvNdf6Hn/FR
 diND6RsFa9xWmCV5fN3Os8DSc+eSjK3RwkxkEXp8cnuRB9mArU4eLoAwj
 ZJYnHpHc838jwSeaXRhVliXwZ8IYGt2ImFHFeOOrcWjSoCZqLOBWkWjQu
 ZXZsGf0eSi7qlTnDcP1Flz7SVoq9IXhwsi5PRTOOQofnzgULC21Em4F6S
 bcb8Tv0csKPHg1O0E/FWyCLmrFnG+ZYtE56cYBS5CA0OFfwl58XBEE5PQ
 RSNTYgcedrHCsHLgGAEsqXI0ErhcOK55tBCTS0yDTl5o6J5ANd20NyLM0 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="329729333"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="329729333"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 09:15:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="641620192"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="641620192"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 30 Jan 2023 09:15:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 30 Jan 2023 09:15:44 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 30 Jan 2023 09:15:44 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 30 Jan 2023 09:15:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6RN0Te88OTXBLFsIhWqHcDKjv06+SD31ZEB9rPTEfSXJ3h0zJZphi6YIih/bycvMKS47CXS7RKgm57FAXq1ToisItCotDtFFHq7lTUEULTQyIdzqJzxMvYKQdPd5O4gmLoNJi0uKg69B299gu9OiX0H+DFBotKBxlkQtahnuAfh4RM4cuK0W4XnklnB9fp2w/mZjTqOtFRLBy7ESG88uTrG92nExWv9w5/WJnBHASobLR4aQom6TM1zOF0QMcDKStxmjZsSfIFQiAUswKc9EaIUVCOufVB29Q4z/O9+a8H6SfaeLeS0wiW8nSX5pGLDCCApWJ7nmH3k5lDAZBi5Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTBSNKNBZcjrA02JH4lNjUwhaK40lUp5y++mUPBtxPU=;
 b=cBYuZlnVMD1/Z/4a5QzIaiid6EIKPMzGqY+7Ca+zyibFSxWByXkERXeVpT9Bw03f6LS8JEWVqGDmFyhIy9pjBluZ0giUw5onTmFQ+7e74J84cc62fidA5/lrwFJmsEX+mGiswIOPz4lhAxdEYY8g+3FUTgRBZoEXJ2Z4PslPt5z2CBpA/pS9eisEFBsL9n+mkXoOfZK+Tm4EkhXUlXknVZ+ipmoJkzy58TuXLpPw+AfUfB+zUytHAWvrylXY0Om6IkG6uuBhwHmDHs5AjUv1dWZdmRY7pzg1xh79FdlXvj6PBecPgCt4FlMPnHEY2H3EMdhKmAR3vbOgo5KtynSjFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB8009.namprd11.prod.outlook.com (2603:10b6:510:248::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.25; Mon, 30 Jan
 2023 17:15:42 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e%5]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 17:15:42 +0000
Date: Mon, 30 Jan 2023 09:15:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <Y9f7O86ki5W4Qv1C@mdroper-desk1.amr.corp.intel.com>
References: <20230130161723.42602-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230130161723.42602-1-jose.souza@intel.com>
X-ClientProxiedBy: SJ0PR05CA0200.namprd05.prod.outlook.com
 (2603:10b6:a03:330::25) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: 61a5dead-9a90-44cb-41a3-08db02e59da3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BsGsfPn3TtJ9NYIj/WitLWXZACbF9Q3KY/Lkccfk45cexF5UI4B8ub5Lw6+XeAQNfDu29FlgvmwExfptSpEa5JHxn0q1cZ35sWwgb+1yVo1g6RRyIzypDfNfD/VrFVHxQTlsKNhuqRP2MNuHiKjd84ZnbBDaO4S+vRahKrFMncP0jJCqTK0A/q5nrHkvx49w2ka6zEhwtmXJLZAMDFp6pfXjhUi6f+eNi9Db/7FWdiI/VM8lZQ1wbjAAGOdQZYw0AhS3V/sCphbSuEEpLPA5Cms2MuzhvFOqJIlKFZ04jBXVr0tA+AILpQaIXzPUSYz31TiXnta4swy9eHXDtt7n6VXONmmrSw3OpAQjSQXK6UL2rz/nB1ZWLjnTsmg/kKx1BHRRF6GzxAEh9oPvkOrLisrj3R5//Xaxl8MtVzUqXPyQ6dl4uvhm3/NcbF6FA5jcIkpo9QPq04fHsFPjkKD5SYrfsVCDzigYmXuRLWxzjlo2davEFRUlZ1nM+3UFdXmWu2R3F8yBvsk8uf0fG74RUzCOUQMGzWfTRFZaK7V7DrAZhEF1OiG5hIjP4uy/2Jx6/WxUWwB1/8lbjbm7i5/V7kX7M4ZQrLbwJojj2zPcB45b+VSQKuJKaEFC4DZrfEhFZwCm3ZWErPNxGXx1LvUR/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(376002)(366004)(346002)(136003)(396003)(451199018)(6512007)(41300700001)(316002)(8936002)(6506007)(186003)(2906002)(8676002)(26005)(66946007)(66476007)(6666004)(66556008)(6862004)(83380400001)(4326008)(5660300002)(107886003)(6636002)(478600001)(82960400001)(6486002)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ycGjDYu39uyaEY5MSnaWOmRWOY8CTaKdVIh5Zwke5dmjeSUoxY3b/YfU62?=
 =?iso-8859-1?Q?K+O0/RRj/XG+JXUDY3+D+os9d5k2s27lHc6RWbFGeJPeV2L5SE1VjzZM8C?=
 =?iso-8859-1?Q?Pqu1L6RyopEbGxdz78NQPICOwn5lNCFpHDKt9N0kKRVoAeD7r2cuzqV6eT?=
 =?iso-8859-1?Q?dQMLTzhxxt3YFQzMU+cgKIt7JKSrzKiXv9bwf/jotqzZ9g3fuDMFU9WMO+?=
 =?iso-8859-1?Q?0F7zhOG1AD1Z6UX3aCZA/mlSyS+cxAioTrrCyOhppLZd4DZtmXEwpaeuSq?=
 =?iso-8859-1?Q?26ptrc6X4mpWYISRJG/xKNZv+fHHVbomxybYfcpyum2BPbimFp9Fuv8f8J?=
 =?iso-8859-1?Q?jlhUo91QC3MCN2SjEFn4qTsrvHO+tq43aPy53EM6nwcCbeRisQpCG5W988?=
 =?iso-8859-1?Q?iL5YRA11x32lpjblatMGKBLYkgikM92dwNSph5f9nZ80xLQmS83SjPucmh?=
 =?iso-8859-1?Q?1MmY+nhrv3VNTmKsdBLNWRcea+SM5cQgAekZPTGw26V9sQY9281IKxTR7I?=
 =?iso-8859-1?Q?ix/+CLRuY3s4cNDCquuNo88vH1+LDD6SUGTMnelcQit7pGXrToB5sLuLmL?=
 =?iso-8859-1?Q?dEd7trL0aRQTsFFafJSqb0mMD32xCGtR5C55SkeQcolXikDYBRxemvYr/1?=
 =?iso-8859-1?Q?V1f3JJFKdKls2MGWo4F0+Q9oozZAdpSp8+YxceJlDHLNM2+IeHDZotHIxD?=
 =?iso-8859-1?Q?fCXHFgQVJ45jj12bkdllzxgctLXNUmH/6GCBji+CnjuGUgtV5JkLQNUiwi?=
 =?iso-8859-1?Q?AUciQZmxSSfLcUF8ns6m+bs/iG+kOKVi76jckdUV5G4kEn7YFUMJAVsj83?=
 =?iso-8859-1?Q?6wnM2/gh0to8pTzvIX3y6e7FkGuXpkQTPwPXpvPPwXXGr0Gvg5on9ycSEF?=
 =?iso-8859-1?Q?Haxbwkosfsh6Yn+rutJYSbx2JfpuS4Shwc3ErL6D1F7ewsq62zMgoczbZu?=
 =?iso-8859-1?Q?u6aiyh74/R7+VT5YYwatMSRVUcpV1TQ1FcL5O6Dp2Invwt7jFclDEnmIuh?=
 =?iso-8859-1?Q?sb8Wux+KF1x30I+IvpYiInzO+9w6+HdQqD6MVZmQ+cvI9bwwtVDoe9CXlc?=
 =?iso-8859-1?Q?2QnBuBdNvFZMc7IQ2t9wEAmOwik0OP+3zJQFoz4MlpvySWlbic5b6u86Ha?=
 =?iso-8859-1?Q?V7y5c8LH1r9lQtMLNPYASxI9rgUzROgcIUvyR6p5VTdw91C1061y1lQa/R?=
 =?iso-8859-1?Q?ULiBtt8rp8jyed5pOR4hmkoVTYLa/RfZue+Eva2GGgxKO6xhqEXT50MPPu?=
 =?iso-8859-1?Q?xeigdtYdXkee6+WfJmi5PNkufzX6m9NYkyWhusOvZJkp6q+y+OalUIE7rw?=
 =?iso-8859-1?Q?vspyMMJHD4KqDUCMZa2x32Nt7Yy6ONNqXru+eqJAC65i9V1+F7QajIdoAD?=
 =?iso-8859-1?Q?ydz1emdFYkV79NCqHcaim+tvdXUSlE/vOMX3ac0Ns0ZI+opkInyEFvPEVU?=
 =?iso-8859-1?Q?vbEG8jpe3a7NgbsgGcK+O6TXaz/t0kjETmUpg5wGBo4ls07Ed02CX47fcV?=
 =?iso-8859-1?Q?2Gl8PETZd7/+899omMO3zkdz2P8dIytbDa7hLSbpHNBbIUgI6W23kc+HqR?=
 =?iso-8859-1?Q?JQD96P8YYmLME9nd0AHKVx9WsEIDE5wDngwpmFU21FxmCleIhBcQPbYCZ9?=
 =?iso-8859-1?Q?d4IgKpQ9eFn9I4eKi1n8spcrQw4XVpU7KBgDkjalga58UPZqXYBJJq+g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61a5dead-9a90-44cb-41a3-08db02e59da3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 17:15:42.0264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rd76ALkD1tpectOzYt1ZonR4MBfIXbVMneiJJ8IhdhASSq084PkJmMKcJMfWdzIFd/sWsIZo0qErct8zVxDRpMWBLdPP4t4cmD2ArCc8Dak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8009
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Add fake workaround to maintain
 backward compatible in MI_BATCH_BUFFER_START
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jan 30, 2023 at 08:17:23AM -0800, José Roberto de Souza wrote:
> i915 has the same fake workaround to return MI_BATCH_BUFFER_START
> nested batch buffer behavior in DG2 and newer platforms to the same
> behavior as older platforms.
> 
> So here cleaning up TGL_NESTED_BB_EN in MI_MODE to disable third level
> chained batch buffer level.

I was kind of assuming we'd just drop this setting for the Xe driver.  I
believe hardware will be removing the option to turn off nested
batchbuffers in an upcoming platform, so userspace is going to have to
adapt to the new behavior soon anyway; doing it while moving to a new
KMD seems like the easiest time to make that happen since the UMDs are
already updating their programming models.


Matt

> 
> v2:
> - replace IP_VERSION_FOREVER by XE_RTP_END_VERSION_UNDEFINED
> - move fake workaround to lrc_additional_programming table
> 
> Bspec: 45974, 45718
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c |  1 +
>  drivers/gpu/drm/xe/xe_wa.c | 28 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wa.h |  1 +
>  3 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 84a73eeccd297..5d07e1e7bd506 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -311,6 +311,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  
>  		xe_reg_sr_init(&hwe->reg_lrc, "LRC", xe);
>  		xe_wa_process_lrc(hwe);
> +		xe_wa_process_lrc_additional_programming(hwe);
>  
>  		default_lrc = drmm_kzalloc(&xe->drm,
>  					   xe_lrc_size(xe, hwe->class),
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 3325de3edf691..744b7d0982683 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -288,6 +288,21 @@ static const struct xe_rtp_entry lrc_was[] = {
>  	{}
>  };
>  
> +static const struct xe_rtp_entry lrc_additional_programming[] = {
> +	{ XE_RTP_NAME("FakeWaDisableNestedBBMode"),
> +	  /*
> +	   * This is a "fake" workaround defined by software to ensure we
> +	   * maintain reliable, backward-compatible behavior for userspace with
> +	   * regards to how nested MI_BATCH_BUFFER_START commands are handled.
> +	   */
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1255, XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_CLR(RING_MI_MODE(0),
> +		     TGL_NESTED_BB_EN,
> +		     XE_RTP_FLAG(MASKED_REG, ENGINE_BASE))
> +	},
> +	{}
> +};
> +
>  static const struct xe_rtp_entry register_whitelist[] = {
>  	{ XE_RTP_NAME("WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> @@ -362,6 +377,19 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
>  	xe_rtp_process(lrc_was, &hwe->reg_lrc, hwe->gt, hwe);
>  }
>  
> +/**
> + * xe_wa_process_lrc_additional_programming - process additional LRC programming
> + * table
> + * @hwe: engine instance to process workarounds for
> + *
> + * Process additional context programming table for this platform, saving in
> + * @hwe all the registers changes that need to be applied on context restore.
> + */
> +void xe_wa_process_lrc_additional_programming(struct xe_hw_engine *hwe)
> +{
> +	xe_rtp_process(lrc_additional_programming, &hwe->reg_lrc, hwe->gt, hwe);
> +}
> +
>  /**
>   * xe_reg_whitelist_process_engine - process table of registers to whitelist
>   * @hwe: engine instance to process whitelist for
> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> index 1a0659690a320..872f3e4ddc73c 100644
> --- a/drivers/gpu/drm/xe/xe_wa.h
> +++ b/drivers/gpu/drm/xe/xe_wa.h
> @@ -12,6 +12,7 @@ struct xe_hw_engine;
>  void xe_wa_process_gt(struct xe_gt *gt);
>  void xe_wa_process_engine(struct xe_hw_engine *hwe);
>  void xe_wa_process_lrc(struct xe_hw_engine *hwe);
> +void xe_wa_process_lrc_additional_programming(struct xe_hw_engine *hwe);
>  
>  void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
>  void xe_reg_whitelist_apply(struct xe_hw_engine *hwe);
> -- 
> 2.39.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
