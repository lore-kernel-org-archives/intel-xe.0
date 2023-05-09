Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD94EC7EE22
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 02:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6263910E325;
	Tue,  9 May 2023 02:52:37 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08AAB10E325
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 02:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683600755; x=1715136755;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cSmQPJP4t0IwsIkk2WneHRYb+rxmrcWz59HIRq8WfTY=;
 b=NUWcoFYAj5+1XZFcrgPu+Ik7r+gfc3yUt6jFlsTNA64ZFmGUZ6f7dKkn
 pL+dmxrxeM7QIIY3r32k7RMElqwRmcR9MqU60y1iEiiBDpz+dsnXZwvqZ
 FQOs6ciXOGnjoAZTMWTyzARK2Ic5dj33z3w33O0ipSeWrJjFlVs2AAQwh
 Xhjr5soOe6vNR5tNcBI4YlMfyX+LXJJXkOAUg7dpspXqrvykYqDffeGls
 paiKYJFvolgZq2pGfPIQjkmMHFZg9vzjHImRGjgHGAy180XiPKpXi0usP
 AyepWw/cGRycbF8NVjaiCG1VaeEkbR6EECRHk1QQ60qNS9reSrhJI4lSq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="413067271"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="413067271"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 19:51:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="822900818"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="822900818"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 08 May 2023 19:51:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 19:51:56 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 19:51:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 19:51:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EH+sibjyvIYR6r2c78WH6v6jedjqK+U8Acrnrlw3dtCTQBS890wCkepmYbTx4ywJHiWKmZwnxuwDZ63mNy24mlfozoek0fqmMgoKAO29iVCeOo9PQsDN/ScnNBLxl7FesE+mnKwts3lXTAtzwc0QAcvDj6G7qpO2UZsaYMe6SNKLyH+mApJuhT2BWB2F1e2wKMMT3jxFK/sXyG2zIWY2KusThqw9akVWvzbWWpMFXcKQCE3a3Wo/cXmFvQwIN8UQ88B0TW9fr1nvrrwsQKTSn1hGzbNLOX8mnwrddeN1srD+yJtDZsTccHLUYlao9O7hfNoahleMfimEx8HKrmQuMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ci4o0GeR8BF5aNwaY32KEssLn0OWVP1T5rW9hTSbFMI=;
 b=DXIjfSoo+M6hx2lqIHTUqqXWGjcoxp7sK2GFXiJbG3Zk0kFRDDiGNz7cMCzbd+sAwEMUK0Puc+lZLMGj7f9OF8EIg2FmCHgMgh8AKNJSY7CegMirLE8qIiLWjEp1ICHz1cdg533tvFTiQbq7fx7/35Alyfjyo6KdjNS4QV5sqk/vAFW4rKtVCAWu5Xakt/o1iuaa0rE72z7KKabqZagk80tyrxYAfJsLr4IvgjckER3cknewNNXlgRijnXOIP1o3a8/1LdlQrV6D1DJKxUqqG/OPkJl+zCVHeD3+g9TlB994gg4MAqwFdQHvY6+8xko4vJ1WRw1cm77LsSDUmKcJ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4818.namprd11.prod.outlook.com (2603:10b6:303:93::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 02:51:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 02:51:53 +0000
Date: Tue, 9 May 2023 02:51:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZFm1KV4Ulw7cmHeK@DUT025-TGLU.fm.intel.com>
References: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
 <20230508210825.1405432-7-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230508210825.1405432-7-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR02CA0050.namprd02.prod.outlook.com
 (2603:10b6:a03:54::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4818:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fcaf994-deb3-467f-a448-08db50385816
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wA1b59jbS/0L1L3l4Y9/m6/apsV8FdZo47zxi4BlqLEyz4uheaOnlIEL5b2+oCsT8VmL8w4H9w0Ziu7O4/m3+joMlrxPoICvsJXLWrRYmAULDhD600hvhF1RdgpJwG6SnmkDMlEiau71Fr5L80+3DtFoiBryfb/1er7dff/9QRV2DfYhFMp+MhfMt5b6ahPNY0gfi8BvlymIjCyqi62T01JLd8THF4hGK6qP2oK/wnXxeGwSbi0i4z+MBMZGPdStkbXaeGX2/eNNoAdjSIgM+0fQ2CSWZ8F4XJVMvJ37JUIbfojy6CP1jN0snHBUVPtDB2McKnnNfsGG4b0hAwZGb1loZKTVRZBkjfUw6xzlxZyfj1W8mPLZgyM2zRauTCYfQmFuk2yJcnvYbn+Wslw6dhWNfZ3eOndHl/5DHqfu+mEsa9sRni4bQlVCvi9lESTGAXhZPuk/aB0nNZ7gFTZ8wxHoXEsjLBUXc0gGK89G6SpE3niUk9+bg/BMlaJBBlWgUDHkgTZ5tzUlGWe8HSRHROeDQbc7kB50lbGC+Ns7TVGjd8G1fUKZ5a8amT9apiWf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(376002)(39860400002)(396003)(136003)(451199021)(82960400001)(26005)(6506007)(6512007)(38100700002)(6486002)(6666004)(83380400001)(186003)(44832011)(2906002)(30864003)(86362001)(66556008)(66946007)(66476007)(45080400002)(478600001)(41300700001)(8936002)(5660300002)(6862004)(8676002)(316002)(4326008)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GnizU7nPy97f2re6POSSRzBSlj66JVK6HwoY0ZqbomJ3AvOQTRF8ELvXzaWO?=
 =?us-ascii?Q?ByhkK3aEqRcd/nBM8xzGCut5ry2raIt7XFcehJglxS3IcQ3vAib47ELcrSqn?=
 =?us-ascii?Q?pc2KKG1KHo256u5zvvIhZ0L+Juugj4/F2RET7x2E4coFVvh3hDwqx5LllG30?=
 =?us-ascii?Q?7UcGdkwRkCMMoHQL/B9dzyruz+JVgGm6W280inYE6M5bkg8v1O5UrmXGO8N1?=
 =?us-ascii?Q?CXYmkAEkLaSveK4kCcEg7L3nwQ7ZNuErEKL13njcQ3Yh0jsiV5g7eJbGP5Gj?=
 =?us-ascii?Q?y55MfH9BWo3lkkufnaG9yx+pPNUzTg1DkWp3PEeZpqTLX8oBkifMB1oiHuxI?=
 =?us-ascii?Q?ike60hAOJZ+iHyWUHnTF31sln9cPVS8YNtWUhDhzJRNkUqLw9fkxKLzjWqnJ?=
 =?us-ascii?Q?0nRnrZM4B9L9iPypXi8YnW+hLQRoWI1+U/fiTe1PvHxOSdf/MUOwOe6VmhOh?=
 =?us-ascii?Q?i7yAyuQMZqTWyzFxLazK7T8L+E/tdXAvdD8RdkLzn77QauxEA3GfQU7FqFUF?=
 =?us-ascii?Q?tX1MqD7qUcmYwA50xwadTYp+IWWlPAOkRLpxoXqK8ICcKuCAw1+Zn+dMY2p4?=
 =?us-ascii?Q?IxqePHVqOPl4RMOwxZufbJhuzFjA8rJafs81nAIJKajy+GmEjv4deWtUbp7+?=
 =?us-ascii?Q?t1OYOjXTcuGuYTBzvFxHKLbUsMt7vgyQn3a9esjntyG74On02lDFkW6q/y8d?=
 =?us-ascii?Q?Nzz2IWN9Jg/1QVOv0YWndSctu6QDIAt/Cck4hdxv6xkI5qAJ+1GUvYxN+7Ov?=
 =?us-ascii?Q?nUg3cvB79lkLBNrAIQ0qFwOYGyvLXepYmrf2J8BewZdComnHkQl0IwNabLzS?=
 =?us-ascii?Q?xnR09x044UHNuwvnZYAKK+WqjAupSwYfs47uCTJsSJMiORLpvoxqNxB4KhkA?=
 =?us-ascii?Q?EgHPIGS1sdhSxxo2/2lQwpLz3V3agwyzTLoHToAeQEKOQTQ+QLQiR+WBsRmJ?=
 =?us-ascii?Q?GO/loXsJbKXMOk4k6GGLwKTC6tyh2xk6NapxtdjICAy5eJhY8LFcF69mfc/n?=
 =?us-ascii?Q?Bf2fkoXKBrAj7/ou6MGCwxTVkFRlnl9d15zmsnsp/e+QdDgwwkmF56qEfBpE?=
 =?us-ascii?Q?F6RkR1auMCHFDQyzmxc95mCBcjM/yQBvq1UN23h1ottNJ6mmNBvPwl1aIs0W?=
 =?us-ascii?Q?z8Xqs/ErmgCkqmtwwCP5nHHO9U2YcDWDS+X3PVWeSK4M46uRFoqcZA49Re9a?=
 =?us-ascii?Q?3o+90MBC6CyQ6lvBqTeDPG4RPhhP72iOfAPPiMaF5ReUE82cKaALm+xpKCON?=
 =?us-ascii?Q?kUa07O3Lyp25xiyPini1b/snCu7X5YdbkGQPkfXsK3VEfrLmpArh/qkMpy/y?=
 =?us-ascii?Q?BOvXLMwTAyndUk+xUAgUZFp+U7d0So8QEozmWrYVdqFYcKH/vTNQx4aogCJN?=
 =?us-ascii?Q?k4KJKnaf4iiitnjdtop+bMpTBl424KBdX54PYAg4cOQUTeBlER8w39uZQqHK?=
 =?us-ascii?Q?d29bnK8P0qxAUFKFmrpFOn+nv0xWtvaHYlZ9NRIy0fSCZimhiMaxDPKozvzq?=
 =?us-ascii?Q?WK/0tU+aOR83rMZZSq9SvzpSpXwHFfu89tzxhHYdT+Ke+IpAfkWWFTHTPWex?=
 =?us-ascii?Q?ClNK8l4XvDXCoIFi6uQ0nXzV+j/BiLvkE0NzJ8Bar10b7/kNbLMpIsN4EyyK?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fcaf994-deb3-467f-a448-08db50385816
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 02:51:53.1339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjvzTRRzwMr0fL2MEttQ7R//xNPjpR/loM8/BYoiz83gFH/gyQpwLHCCwTlk3d1yG233ihlN8GRpEpGk6N42nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4818
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 07/11] drm/xe: Convert GuC Engine print to
 snapshot capture and print.
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

On Mon, May 08, 2023 at 05:08:21PM -0400, Rodrigo Vivi wrote:
> The goal is to allow for a snapshot capture to be taken at the time
> of the crash, while the print out can happen at a later time through
> the exposed devcoredump virtual device.
> 
> v2: Handle memory allocation failures. (Matthew)
> Do not use GFP_ATOMIC on cases like debugfs prints. (Matthew)
> v3: checkpatch
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c              |   2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 251 +++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_guc_submit.h       |  11 +-
>  drivers/gpu/drm/xe/xe_guc_submit_types.h |  91 ++++++++
>  4 files changed, 310 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 985f6e901ee4..dc891ad1d367 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -857,5 +857,5 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  
>  	xe_guc_ct_print(&guc->ct, p, false);
> -	xe_guc_submit_print(guc, p);
> +	xe_guc_submit_print(guc, p, false);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 250e56ee2e75..b5ec1aa55451 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -718,7 +718,8 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>  		       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
>  }
>  
> -static void guc_engine_print(struct xe_engine *e, struct drm_printer *p);
> +static void guc_engine_print(struct xe_engine *e, struct drm_printer *p,
> +			     bool atomic);
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE)
>  static void simple_error_capture(struct xe_engine *e)
> @@ -746,7 +747,7 @@ static void simple_error_capture(struct xe_engine *e)
>  
>  		xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
>  		xe_guc_ct_print(&guc->ct, &p, true);
> -		guc_engine_print(e, &p);
> +		guc_engine_print(e, &p, true);
>  		for_each_hw_engine(hwe, guc_to_gt(guc), id) {
>  			if (hwe->class != e->hwe->class ||
>  			    !(BIT(hwe->logical_instance) & adj_logical_mask))
> @@ -1596,76 +1597,240 @@ int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	return 0;
>  }
>  
> -static void guc_engine_wq_print(struct xe_engine *e, struct drm_printer *p)
> +static void
> +guc_engine_wq_snapshot_capture(struct xe_engine *e,
> +			       struct xe_guc_submit_engine_snapshot *snapshot)
>  {
>  	struct xe_guc *guc = engine_to_guc(e);
>  	struct xe_device *xe = guc_to_xe(guc);
>  	struct iosys_map map = xe_lrc_parallel_map(e->lrc);
>  	int i;
>  
> +	snapshot->guc.wqi_head = e->guc->wqi_head;
> +	snapshot->guc.wqi_tail = e->guc->wqi_tail;
> +	snapshot->parallel.wq_desc.head = parallel_read(xe, map, wq_desc.head);
> +	snapshot->parallel.wq_desc.tail = parallel_read(xe, map, wq_desc.tail);
> +	snapshot->parallel.wq_desc.status = parallel_read(xe, map,
> +							  wq_desc.wq_status);
> +
> +	if (snapshot->parallel.wq_desc.head !=
> +	    snapshot->parallel.wq_desc.tail) {
> +		for (i = snapshot->parallel.wq_desc.head;
> +		     i != snapshot->parallel.wq_desc.tail;
> +		     i = (i + sizeof(u32)) % WQ_SIZE)
> +			snapshot->parallel.wq[i / sizeof(u32)] =
> +				parallel_read(xe, map, wq[i / sizeof(u32)]);
> +	}
> +}
> +
> +static void
> +guc_engine_wq_snapshot_print(struct xe_guc_submit_engine_snapshot *snapshot,
> +			     struct drm_printer *p)
> +{
> +	int i;
> +
>  	drm_printf(p, "\tWQ head: %u (internal), %d (memory)\n",
> -		   e->guc->wqi_head, parallel_read(xe, map, wq_desc.head));
> +		   snapshot->guc.wqi_head, snapshot->parallel.wq_desc.head);
>  	drm_printf(p, "\tWQ tail: %u (internal), %d (memory)\n",
> -		   e->guc->wqi_tail, parallel_read(xe, map, wq_desc.tail));
> -	drm_printf(p, "\tWQ status: %u\n",
> -		   parallel_read(xe, map, wq_desc.wq_status));
> -	if (parallel_read(xe, map, wq_desc.head) !=
> -	    parallel_read(xe, map, wq_desc.tail)) {
> -		for (i = parallel_read(xe, map, wq_desc.head);
> -		     i != parallel_read(xe, map, wq_desc.tail);
> +		   snapshot->guc.wqi_tail, snapshot->parallel.wq_desc.tail);
> +	drm_printf(p, "\tWQ status: %u\n", snapshot->parallel.wq_desc.status);
> +
> +	if (snapshot->parallel.wq_desc.head !=
> +	    snapshot->parallel.wq_desc.tail) {
> +		for (i = snapshot->parallel.wq_desc.head;
> +		     i != snapshot->parallel.wq_desc.tail;
>  		     i = (i + sizeof(u32)) % WQ_SIZE)
>  			drm_printf(p, "\tWQ[%zu]: 0x%08x\n", i / sizeof(u32),
> -				   parallel_read(xe, map, wq[i / sizeof(u32)]));
> +				   snapshot->parallel.wq[i / sizeof(u32)]);
>  	}
>  }
>  
> -static void guc_engine_print(struct xe_engine *e, struct drm_printer *p)
> +/**
> + * xe_guc_engine_snapshot_capture - Take a quick snapshot of the GuC Engine.
> + * @e: Xe Engine.
> + * @atomic: Boolean to indicate if this is called from atomic context like
> + * reset or from some regular path like debugfs.
> + *
> + * This can be printed out in a later stage like during dev_coredump
> + * analysis.
> + *
> + * Returns: a GuC Submit Engine snapshot object that must be freed by the
> + * caller, using `xe_guc_engine_snapshot_free`.
> + */
> +struct xe_guc_submit_engine_snapshot *
> +xe_guc_engine_snapshot_capture(struct xe_engine *e, bool atomic)
>  {
> +	struct xe_guc *guc = engine_to_guc(e);
> +	struct xe_device *xe = guc_to_xe(guc);
>  	struct drm_gpu_scheduler *sched = &e->guc->sched;
>  	struct xe_sched_job *job;
> +	struct xe_guc_submit_engine_snapshot *snapshot;
> +	int i;
> +
> +	snapshot = kzalloc(sizeof(*snapshot), atomic ? GFP_ATOMIC : GFP_KERNEL);
> +
> +	if (!snapshot) {
> +		drm_err(&xe->drm, "Skipping GuC Engine snapshot entirely.\n");
> +		return NULL;
> +	}
> +
> +	snapshot->guc.id = e->guc->id;
> +	memcpy(&snapshot->name, &e->name, sizeof(snapshot->name));
> +	snapshot->class = e->class;
> +	snapshot->logical_mask = e->logical_mask;
> +	snapshot->width = e->width;
> +	snapshot->refcount = kref_read(&e->refcount);
> +	snapshot->sched_timeout = sched->timeout;
> +	snapshot->sched_props.timeslice_us = e->sched_props.timeslice_us;
> +	snapshot->sched_props.preempt_timeout_us =
> +		e->sched_props.preempt_timeout_us;
> +
> +	snapshot->lrc = kmalloc_array(e->width, sizeof(struct lrc_snapshot),
> +				      atomic ? GFP_ATOMIC : GFP_KERNEL);
> +
> +	if (!snapshot->lrc) {
> +		drm_err(&xe->drm, "Skipping GuC Engine LRC snapshot.\n");
> +	} else {
> +		for (i = 0; i < e->width; ++i) {
> +			struct xe_lrc *lrc = e->lrc + i;
> +
> +			snapshot->lrc[i].context_desc =
> +				lower_32_bits(xe_lrc_ggtt_addr(lrc));
> +			snapshot->lrc[i].head = xe_lrc_ring_head(lrc);
> +			snapshot->lrc[i].tail.internal = lrc->ring.tail;
> +			snapshot->lrc[i].tail.memory =
> +				xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL);
> +			snapshot->lrc[i].start_seqno = xe_lrc_start_seqno(lrc);
> +			snapshot->lrc[i].seqno = xe_lrc_seqno(lrc);
> +		}
> +	}
> +
> +	snapshot->schedule_state = atomic_read(&e->guc->state);
> +	snapshot->engine_flags = e->flags;
> +
> +	snapshot->parallel_execution = xe_engine_is_parallel(e);
> +	if (snapshot->parallel_execution)
> +		guc_engine_wq_snapshot_capture(e, snapshot);
> +
> +	spin_lock(&sched->job_list_lock);
> +	snapshot->pending_list_size = list_count_nodes(&sched->pending_list);
> +	snapshot->pending_list = kmalloc_array(snapshot->pending_list_size,
> +					       sizeof(struct pending_list_snapshot),
> +					       atomic ? GFP_ATOMIC : GFP_KERNEL);

This allocation is under a spin lock, it has to be GFP_ATOMIC. Use
should get a splat do the following command:

cat /sys/kernel/debug/dri/0/gt0/uc/guc_info

Can you make sure this works in the next rev?

Other than that LGTM.

Matt

> +
> +	if (!snapshot->pending_list) {
> +		drm_err(&xe->drm, "Skipping GuC Engine pending_list snapshot.\n");
> +	} else {
> +		i = 0;
> +		list_for_each_entry(job, &sched->pending_list, drm.list) {
> +			snapshot->pending_list[i].seqno =
> +				xe_sched_job_seqno(job);
> +			snapshot->pending_list[i].fence =
> +				dma_fence_is_signaled(job->fence) ? 1 : 0;
> +			snapshot->pending_list[i].finished =
> +				dma_fence_is_signaled(&job->drm.s_fence->finished)
> +				? 1 : 0;
> +			i++;
> +		}
> +	}
> +
> +	spin_unlock(&sched->job_list_lock);
> +
> +	return snapshot;
> +}
> +
> +/**
> + * xe_guc_engine_snapshot_print - Print out a given GuC Engine snapshot.
> + * @snapshot: GuC Submit Engine snapshot object.
> + * @p: drm_printer where it will be printed out.
> + *
> + * This function prints out a given GuC Submit Engine snapshot object.
> + */
> +void
> +xe_guc_engine_snapshot_print(struct xe_guc_submit_engine_snapshot *snapshot,
> +			     struct drm_printer *p)
> +{
>  	int i;
>  
> -	drm_printf(p, "\nGuC ID: %d\n", e->guc->id);
> -	drm_printf(p, "\tName: %s\n", e->name);
> -	drm_printf(p, "\tClass: %d\n", e->class);
> -	drm_printf(p, "\tLogical mask: 0x%x\n", e->logical_mask);
> -	drm_printf(p, "\tWidth: %d\n", e->width);
> -	drm_printf(p, "\tRef: %d\n", kref_read(&e->refcount));
> -	drm_printf(p, "\tTimeout: %ld (ms)\n", sched->timeout);
> -	drm_printf(p, "\tTimeslice: %u (us)\n", e->sched_props.timeslice_us);
> +	if (!snapshot)
> +		return;
> +
> +	drm_printf(p, "\nGuC ID: %d\n", snapshot->guc.id);
> +	drm_printf(p, "\tName: %s\n", snapshot->name);
> +	drm_printf(p, "\tClass: %d\n", snapshot->class);
> +	drm_printf(p, "\tLogical mask: 0x%x\n", snapshot->logical_mask);
> +	drm_printf(p, "\tWidth: %d\n", snapshot->width);
> +	drm_printf(p, "\tRef: %d\n", snapshot->refcount);
> +	drm_printf(p, "\tTimeout: %ld (ms)\n", snapshot->sched_timeout);
> +	drm_printf(p, "\tTimeslice: %u (us)\n",
> +		   snapshot->sched_props.timeslice_us);
>  	drm_printf(p, "\tPreempt timeout: %u (us)\n",
> -		   e->sched_props.preempt_timeout_us);
> -	for (i = 0; i < e->width; ++i ) {
> -		struct xe_lrc *lrc = e->lrc + i;
> +		   snapshot->sched_props.preempt_timeout_us);
>  
> +	for (i = 0; snapshot->lrc && i < snapshot->width; ++i) {
>  		drm_printf(p, "\tHW Context Desc: 0x%08x\n",
> -			   lower_32_bits(xe_lrc_ggtt_addr(lrc)));
> +			   snapshot->lrc[i].context_desc);
>  		drm_printf(p, "\tLRC Head: (memory) %u\n",
> -			   xe_lrc_ring_head(lrc));
> +			   snapshot->lrc[i].head);
>  		drm_printf(p, "\tLRC Tail: (internal) %u, (memory) %u\n",
> -			   lrc->ring.tail,
> -			   xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL));
> +			   snapshot->lrc[i].tail.internal,
> +			   snapshot->lrc[i].tail.memory);
>  		drm_printf(p, "\tStart seqno: (memory) %d\n",
> -			   xe_lrc_start_seqno(lrc));
> -		drm_printf(p, "\tSeqno: (memory) %d\n", xe_lrc_seqno(lrc));
> +			   snapshot->lrc[i].start_seqno);
> +		drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->lrc[i].seqno);
>  	}
> -	drm_printf(p, "\tSchedule State: 0x%x\n", atomic_read(&e->guc->state));
> -	drm_printf(p, "\tFlags: 0x%lx\n", e->flags);
> -	if (xe_engine_is_parallel(e))
> -		guc_engine_wq_print(e, p);
> +	drm_printf(p, "\tSchedule State: 0x%x\n", snapshot->schedule_state);
> +	drm_printf(p, "\tFlags: 0x%lx\n", snapshot->engine_flags);
>  
> -	spin_lock(&sched->job_list_lock);
> +	if (snapshot->parallel_execution)
> +		guc_engine_wq_snapshot_print(snapshot, p);
>  
> -	list_for_each_entry(job, &sched->pending_list, drm.list)
> +	for (i = 0; snapshot->pending_list && i < snapshot->pending_list_size;
> +	     i++)
>  		drm_printf(p, "\tJob: seqno=%d, fence=%d, finished=%d\n",
> -			   xe_sched_job_seqno(job),
> -			   dma_fence_is_signaled(job->fence) ? 1 : 0,
> -			   dma_fence_is_signaled(&job->drm.s_fence->finished) ?
> -			   1 : 0);
> -	spin_unlock(&sched->job_list_lock);
> +			   snapshot->pending_list[i].seqno,
> +			   snapshot->pending_list[i].fence,
> +			   snapshot->pending_list[i].finished);
> +}
> +
> +/**
> + * xe_guc_engine_snapshot_free - Free all allocated objects for a given
> + * snapshot.
> + * @snapshot: GuC Submit Engine snapshot object.
> + *
> + * This function free all the memory that needed to be allocated at capture
> + * time.
> + */
> +void xe_guc_engine_snapshot_free(struct xe_guc_submit_engine_snapshot *snapshot)
> +{
> +	if (!snapshot)
> +		return;
> +
> +	kfree(snapshot->lrc);
> +	kfree(snapshot->pending_list);
> +	kfree(snapshot);
> +}
> +
> +static void guc_engine_print(struct xe_engine *e, struct drm_printer *p,
> +			     bool atomic)
> +{
> +	struct xe_guc_submit_engine_snapshot *snapshot;
> +
> +	snapshot = xe_guc_engine_snapshot_capture(e, atomic);
> +	xe_guc_engine_snapshot_print(snapshot, p);
> +	xe_guc_engine_snapshot_free(snapshot);
>  }
>  
> -void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
> +/**
> + * xe_guc_submit_print - GuC Submit Print.
> + * @guc: GuC.
> + * @p: drm_printer where it will be printed out.
> + * @atomic: Boolean to indicate if this is called from atomic context like
> + * reset or from some regular path like debugfs.
> + *
> + * This function capture and prints snapshots of **all** GuC Engines.
> + */
> +void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p, bool atomic)
>  {
>  	struct xe_engine *e;
>  	unsigned long index;
> @@ -1675,6 +1840,6 @@ void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
>  
>  	mutex_lock(&guc->submission_state.lock);
>  	xa_for_each(&guc->submission_state.engine_lookup, index, e)
> -		guc_engine_print(e, p);
> +		guc_engine_print(e, p, atomic);
>  	mutex_unlock(&guc->submission_state.lock);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 8002734d6f24..0ac50702f600 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -13,7 +13,6 @@ struct xe_engine;
>  struct xe_guc;
>  
>  int xe_guc_submit_init(struct xe_guc *guc);
> -void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
>  
>  int xe_guc_submit_reset_prepare(struct xe_guc *guc);
>  void xe_guc_submit_reset_wait(struct xe_guc *guc);
> @@ -27,4 +26,14 @@ int xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  					   u32 len);
>  int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  
> +struct xe_guc_submit_engine_snapshot *
> +xe_guc_engine_snapshot_capture(struct xe_engine *e, bool atomic);
> +void
> +xe_guc_engine_snapshot_print(struct xe_guc_submit_engine_snapshot *snapshot,
> +			     struct drm_printer *p);
> +void
> +xe_guc_engine_snapshot_free(struct xe_guc_submit_engine_snapshot *snapshot);
> +void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p,
> +			 bool atomic);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
> index d23759959be9..88e855dae056 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
> @@ -61,4 +61,95 @@ struct guc_submit_parallel_scratch {
>  	u32 wq[WQ_SIZE / sizeof(u32)];
>  };
>  
> +struct lrc_snapshot {
> +	u32 context_desc;
> +	u32 head;
> +	struct {
> +		u32 internal;
> +		u32 memory;
> +	} tail;
> +	u32 start_seqno;
> +	u32 seqno;
> +};
> +
> +struct pending_list_snapshot {
> +	u32 seqno;
> +	bool fence;
> +	bool finished;
> +};
> +
> +/**
> + * struct xe_guc_submit_engine_snapshot - Snapshot for devcoredump
> + */
> +struct xe_guc_submit_engine_snapshot {
> +	/** @name: name of this engine */
> +	char name[MAX_FENCE_NAME_LEN];
> +	/** @class: class of this engine */
> +	enum xe_engine_class class;
> +	/**
> +	 * @logical_mask: logical mask of where job submitted to engine can run
> +	 */
> +	u32 logical_mask;
> +	/** @width: width (number BB submitted per exec) of this engine */
> +	u16 width;
> +	/** @refcount: ref count of this engine */
> +	u32 refcount;
> +	/**
> +	 * @sched_timeout: the time after which a job is removed from the
> +	 * scheduler.
> +	 */
> +	long sched_timeout;
> +
> +	/** @sched_props: scheduling properties */
> +	struct {
> +		/** @timeslice_us: timeslice period in micro-seconds */
> +		u32 timeslice_us;
> +		/** @preempt_timeout_us: preemption timeout in micro-seconds */
> +		u32 preempt_timeout_us;
> +	} sched_props;
> +
> +	/** @lrc: LRC Snapshot */
> +	struct lrc_snapshot *lrc;
> +
> +	/** @schedule_state: Schedule State at the moment of Crash */
> +	u32 schedule_state;
> +	/** @engine_flags: Flags of the faulty engine */
> +	unsigned long engine_flags;
> +
> +	/** @guc: GuC Engine Snapshot */
> +	struct {
> +		/** @wqi_head: work queue item head */
> +		u32 wqi_head;
> +		/** @wqi_tail: work queue item tail */
> +		u32 wqi_tail;
> +		/** @id: GuC id for this xe_engine */
> +		u16 id;
> +	} guc;
> +
> +	/**
> +	 * @parallel_execution: Indication if the failure was during parallel
> +	 * execution
> +	 */
> +	bool parallel_execution;
> +	/** @parallel: snapshot of the useful parallel scratch */
> +	struct {
> +		/** @wq_desc: Workqueue description */
> +		struct {
> +			/** @head: Workqueue Head */
> +			u32 head;
> +			/** @tail: Workqueue Tail */
> +			u32 tail;
> +			/** @status: Workqueue Status */
> +			u32 status;
> +		} wq_desc;
> +		/** @wq: Workqueue Items */
> +		u32 wq[WQ_SIZE / sizeof(u32)];
> +	} parallel;
> +
> +	/** @pending_list_size: Size of the pending list snapshot array */
> +	int pending_list_size;
> +	/** @pending_list: snapshot of the pending list info */
> +	struct pending_list_snapshot *pending_list;
> +};
> +
>  #endif
> -- 
> 2.39.2
> 
