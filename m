Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF0AC77B7F
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 02:54:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C349610E31F;
	Tue,  9 May 2023 02:54:29 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F9E10E31F
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 02:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683600868; x=1715136868;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gpTZS7CvVaYKmK/wjqatL9aHPxetCC6Q95v9j7PDfyk=;
 b=B6RG/EC4Kzh4ynycivI0BbIWYxMMeueRDmkvDIr8LKLnmRV8HRJt1d1+
 zvvWZyJCxnwjr9kbv54WPFuoBm5OqP/M5/sjhxtN2YW88RDpawF+ni6pO
 ijxiZIHmrpnQSkRNaO42Ic5LL3tZFiJFEqVSMyxGcokf/2hpcoIhDFn4d
 6ujymlrcZ+FOTrU9slxyVQ8x9xdOR9GyBxdbMn4ak76VOwCl8b3PPVywr
 /QnIUd4Ts2xS/ddfM9KY6cA9iJz00Euj9qbvhOE1mmpFM037DDi5StlJj
 tCTTLdvuAp0DSMH75in0DLzMUIiZ6D1VucU7vkamScd1AM3E3M7VQl4BV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="415362357"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="415362357"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 19:54:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="945100894"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="945100894"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 08 May 2023 19:54:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 19:54:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 19:54:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 19:54:26 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 19:54:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdz4KMBccMsTSp/kRIuniHevzvl5SOpTIILGWV5sZ5RmtGpG8S/ZxIO1ajSpZC7mUQqQJCsrw0ZEIuGslBwlksQyageW5PClZQYUFCs4b1SPLTNd0GS8Nlm0kOVVlhkGhb8LieFlt6UfmWAF5uw8fsz3EL7S8V+1I4B9YTsu+kjxr08f5GkD6H+ByeU8pqZ8Gb87ZeKhF2hNhK3WWTy+PnAAcg1Qsh66kBSj7LD4hd6CLgYFFuRytEq0DtO6GFgCPqMmOcCoSsOkMTmQQFktJrGgkXa69lO0EFZDeLiVegfDnqCMrQ2Z+KOPfnWfK0KTFDAmlPKzCDWgVI3gUD9lvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89jY6OvL0GsK6P71kppN/1rvujudQY4GLb7E4IKTzh0=;
 b=Vc6K1R8y9f4MOlZUCNDVD1AMrXnir8woDO75JcHjCg5g8SvfMlqYtHdPmaOKwr6quZf6rMlK40+EZ5GOa4HKsJk1AkQhBLt1dMslxaU4G8xat4lTrJN/FUaizrgjAmCkjoRNJfBcCzw/lOmvmJo/Ht0VWw9v/xiRW5cwa3WlxpE0jQAOD1H4Pk365JXX1jJ+k+/GpnzlwYDMgWPkHm4FuR5ckL/lBt7UKrkCVOc1rdzHQXxlJKVr3jdaPfaByn//L6x86m7BN/T4ay6hP+e1KjriYo/Yp+hVTlXDAroI941D/9IU+Wgl1xjWE47d8pkf/PwoMuWlvmwtpwE8856mtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB8248.namprd11.prod.outlook.com (2603:10b6:208:447::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.31; Tue, 9 May
 2023 02:54:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 02:54:18 +0000
Date: Tue, 9 May 2023 02:53:46 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZFm1ujn8dGg0D3IJ@DUT025-TGLU.fm.intel.com>
References: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
 <20230508210825.1405432-9-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230508210825.1405432-9-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0389.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f8b4a0a-512b-4cc2-c297-08db5038ae92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hr55ng7i/ZvjkCSjwann7lEM/zcPUAwhF+pKmNHmm/gaOHDgDz3QkoNpv4hG7gtBz+/b4IITnnQvCE72Uk5SWO2/2MOC7XJP2m9AV4hwnjc8boeg/h/SLowJHssF5iIjI6g8cx97k4o/+sBRL1EUzpc4ec3GsrGS/f4ombUtkm5iYYvFzaBUkkfpqR4+9lZRaxkudBRD4cosE8ZooWT2UuXXza9fYXU0M20FBVUYr8shlxRYUMVJ9lrGPlfQ4cOX1uN9Y3LdQeDiFMTS/zhSL5/u+SU5QTlVBU5lt2e6pVwI9FBvQucc2ezmijpbCIovB6hPxM9rZuL6ZbaPVNMKPulbr998rf4rJJq8wWKA6LjF+RoE43TZmE8EYscEshvR4yBoJHCYgydpSkPcK73d0bd6SlMytslQ5x5FdiZktXwzaTiaU4rGGXQAekgDg15kXnBPN3T3BuvfhTbkz3vulx1DoymRSTJSsfBIq20brN0lsgaWugmC7Tf/Apbhnd+kH9uR4Fwv1vCmqmma3zJUbbEJNqWuXmHlyuiuH2VaAI0lW7jjG4lnZn7m10TVojKo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(136003)(346002)(366004)(396003)(451199021)(2906002)(316002)(30864003)(478600001)(41300700001)(8936002)(8676002)(6862004)(44832011)(6666004)(66476007)(4326008)(5660300002)(6636002)(66946007)(66556008)(6486002)(6512007)(6506007)(26005)(82960400001)(186003)(83380400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yaEpkPfYJ+pF2YaNW6LLe2SXnqVr1l9uG49xKw05vUB+kLXpL2AfTPkU7kCo?=
 =?us-ascii?Q?g9u1E8tJ2KU/kPpA4zqpPpiHFLJQiEDZJM01+1mO8Ys7oWFFJvXB6u8OH0Gb?=
 =?us-ascii?Q?mQ8x1lXU7I9TywqkHueIZz8TYH/1AqDuID7yVzbKZXKFyaeAFofo70qBnpB9?=
 =?us-ascii?Q?6Zyp2Mpo0+wAVWyVlowVW7jc5WWL749G7QK4cGGlVszGVHRavHhT+EhDcpd/?=
 =?us-ascii?Q?YyXGBwgfvX0ApgHhIq3Huz4K+1TdwRXmZm7ZH9JaSdZZiSf2xxP5e8M0h55j?=
 =?us-ascii?Q?XF5GAswD04QTLatn6N2rcyS+ly1KACafhmG++bLO2HF6NIpkuKWasmXlxmSO?=
 =?us-ascii?Q?792oOnkU8N3RsOr4Ir7ghaT9TryFqY+CsItVkOhH3zL0++BiSoMB5l+B+LTM?=
 =?us-ascii?Q?0zgRS+WLgiC3iLzf8MEFpd1KJ8GeTo/m8CYlXs326pkBrGHJa0W2OKL2pf1h?=
 =?us-ascii?Q?TG+uEsYQCPv/5F8zM3MKowmEs/t3V0k9eOgMrbF5gv1Ltf/Ss6uV7a+2rsOO?=
 =?us-ascii?Q?g5T71LAUzwyJNti5+ZOVAc/wCbpoWS7TZkuequiR9mGRa7S0sFK67JJ4WB0b?=
 =?us-ascii?Q?qcmdgtLtZWE0kqC9KQOoz4M4FRK33N1Gw8FE4muqGglf0meP3dDeXwm1w897?=
 =?us-ascii?Q?GTpJJU3TizCaQaw9rK9x1CnG68eMtjl66TyAslHJy5BQQRPDZDNj3mVugOwP?=
 =?us-ascii?Q?ZReUaLj6Zl1KE1hfJ3emgs4aq8DW7u4LOJ0+rPMXv1qPwy/29IRcSQj9Mf7t?=
 =?us-ascii?Q?PwGun6/GRMkxfJ+0gMmrA9J21nueDwTVyREYX1JnmhTDq40crvnYSUu1Xsb5?=
 =?us-ascii?Q?fygIBKgHNOXxqmvyV5YXTNH2rMU5Y8DxtexUgnP27lYQ8U1HzZ9fpgCFRv5g?=
 =?us-ascii?Q?jroXtu2M2l0KuqkcmSE1iououbZqxe4nWcJ9+xieefmja4jlYSvJelSx4ldD?=
 =?us-ascii?Q?kG3i+irQbFm73rB+UNcTLBf8IVUrgkeVVRpdXZPEJgUFiR0JLhz+feMDUtT1?=
 =?us-ascii?Q?GvKrg1YRNwubBW0jMLTDrWNkfL3+kJfVW2uY6TPxrqLFcZby7eccjRJmKN0n?=
 =?us-ascii?Q?a1qgNkOzbkUzCPktPHEclGfFXNXQ7IAUhiSnotbw9B3MQOH3H0aiwtTIMyvt?=
 =?us-ascii?Q?gjMPtnlPwY24g8OTk3bk+JHjMgfN/jhuOEmRVccMj1q1wVk1Xq0OOJP20KM7?=
 =?us-ascii?Q?hRwk0tpcY8Ahh3AXln4kozygc+QEarE/pAfO1OjRZYXvbTeo4ZNxtB0TcJbW?=
 =?us-ascii?Q?LKq4cs90md7qJN6wbVZGxEHscAs5FPtcoTZMGphillzzkQp6ikhbGP7DLis8?=
 =?us-ascii?Q?lWINc3D52cs9XQHgs0RrGgjNSYZ47D4JrC5eitDXS3WM9AQVKlR435VCXuk6?=
 =?us-ascii?Q?5DNnx0VYRH2TVXhpxVFoF06Vj5IkFntIcZ9vRtJp5Rh3Ju8UyhDl69+pHaWu?=
 =?us-ascii?Q?QVJUBj2PcSRuVWWQ23oky3eWZWUhhg70YmkibrO06AYhPJt92l+yVpb7XQUP?=
 =?us-ascii?Q?c0ZNL1fX4GFg105+vU71utnWL51Gp3yzz950Ol6e/D79LLv0GRgOsShMyI0/?=
 =?us-ascii?Q?ysu75fgreGribYyHTPXs3Nb2qY7n0rBJoA2AZhDWzoHgwT7Q8uQve4Apk7c9?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8b4a0a-512b-4cc2-c297-08db5038ae92
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 02:54:18.3128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uWMV1vUoGGQf4TnhKqXTOBmQb+JD83GfcrlnJaKSclaEPcYuYsAIxyyyZhYnuvYCcNWPjosWo2ytb+fAXdUR7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8248
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 09/11] drm/xe: Convert Xe HW Engine print
 to snapshot capture and print.
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

On Mon, May 08, 2023 at 05:08:23PM -0400, Rodrigo Vivi wrote:
> The goal is to allow for a snapshot capture to be taken at the time
> of the crash, while the print out can happen at a later time through
> the exposed devcoredump virtual device.
> 
> v2: Addressing these Matthew comments:
>     - Handle memory allocation failures.
>     - Do not use GFP_ATOMIC on cases like debugfs prints.
>     - placement of @reg doc.
>     - identation issues.
> v3: checkpatch
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c      |   2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c      |   2 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c       | 225 ++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_hw_engine.h       |   9 +-
>  drivers/gpu/drm/xe/xe_hw_engine_types.h |  78 ++++++++
>  5 files changed, 255 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index c45486c2015a..13ca17f1ff6f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -42,7 +42,7 @@ static int hw_engines(struct seq_file *m, void *data)
>  	}
>  
>  	for_each_hw_engine(hwe, gt, id)
> -		xe_hw_engine_print_state(hwe, &p);
> +		xe_hw_engine_print(hwe, &p, false);
>  
>  	xe_device_mem_access_put(xe);
>  	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index b5ec1aa55451..1f1aaea99a13 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -752,7 +752,7 @@ static void simple_error_capture(struct xe_engine *e)
>  			if (hwe->class != e->hwe->class ||
>  			    !(BIT(hwe->logical_instance) & adj_logical_mask))
>  				continue;
> -			xe_hw_engine_print_state(hwe, &p);
> +			xe_hw_engine_print(hwe, &p, true);
>  		}
>  		xe_analyze_vm(&p, e->vm, e->gt->info.id);
>  		xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index a9adac0624f6..fc69aabd705c 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -569,77 +569,186 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
>  		xe_hw_fence_irq_run(hwe->fence_irq);
>  }
>  
> -void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p)
> +/**
> + * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
> + * @hwe: Xe HW Engine.
> + * @atomic: Boolean to indicate if this is called from atomic context like
> + * resets or from some regular path like debugfs.
> + *
> + * This can be printed out in a later stage like during dev_coredump
> + * analysis.
> + *
> + * Returns: a Xe HW Engine snapshot object that must be freed by the
> + * caller, using `xe_hw_engine_snapshot_free`.
> + */
> +struct xe_hw_engine_snapshot *
> +xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, bool atomic)
>  {
> +	struct xe_hw_engine_snapshot *snapshot;
> +	int len;
> +
>  	if (!xe_hw_engine_is_valid(hwe))
> +		return NULL;
> +
> +	snapshot = kzalloc(sizeof(*snapshot), atomic ? GFP_ATOMIC : GFP_KERNEL);
> +
> +	if (!snapshot)
> +		return NULL;
> +
> +	len = strlen(hwe->name) + 1;
> +	snapshot->name = kzalloc(len, atomic ? GFP_ATOMIC : GFP_KERNEL);
> +	if (snapshot->name)
> +		strscpy(snapshot->name, hwe->name, len);
> +
> +	snapshot->class = hwe->class;
> +	snapshot->logical_instance = hwe->logical_instance;
> +	snapshot->forcewake.domain = hwe->domain;
> +	snapshot->forcewake.ref = xe_force_wake_ref(gt_to_fw(hwe->gt),
> +						    hwe->domain);
> +	snapshot->mmio_base = hwe->mmio_base;
> +
> +	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe,
> +							  RING_HWSTAM(0).reg);
> +	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe,
> +							   RING_HWS_PGA(0).reg);
> +	snapshot->reg.ring_execlist_status_lo =
> +		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0).reg);
> +	snapshot->reg.ring_execlist_status_hi =
> +		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0).reg);
> +	snapshot->reg.ring_execlist_sq_contents_lo =
> +		hw_engine_mmio_read32(hwe,
> +				      RING_EXECLIST_SQ_CONTENTS_LO(0).reg);
> +	snapshot->reg.ring_execlist_sq_contents_hi =
> +		hw_engine_mmio_read32(hwe,
> +				      RING_EXECLIST_SQ_CONTENTS_HI(0).reg);
> +	snapshot->reg.ring_execlist_control =
> +		hw_engine_mmio_read32(hwe, RING_EXECLIST_CONTROL(0).reg);
> +	snapshot->reg.ring_start = hw_engine_mmio_read32(hwe,
> +							 RING_START(0).reg);
> +	snapshot->reg.ring_head =
> +		hw_engine_mmio_read32(hwe, RING_HEAD(0).reg) & HEAD_ADDR;
> +	snapshot->reg.ring_tail =
> +		hw_engine_mmio_read32(hwe, RING_TAIL(0).reg) & TAIL_ADDR;
> +	snapshot->reg.ring_ctl = hw_engine_mmio_read32(hwe, RING_CTL(0).reg);
> +	snapshot->reg.ring_mi_mode =
> +		hw_engine_mmio_read32(hwe, RING_MI_MODE(0).reg);
> +	snapshot->reg.ring_mode_gen7 =
> +		hw_engine_mmio_read32(hwe, RING_MODE(0).reg);
> +	snapshot->reg.ring_imr = hw_engine_mmio_read32(hwe, RING_IMR(0).reg);
> +	snapshot->reg.ring_esr = hw_engine_mmio_read32(hwe, RING_ESR(0).reg);
> +	snapshot->reg.ring_emr = hw_engine_mmio_read32(hwe, RING_EMR(0).reg);
> +	snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0).reg);
> +	snapshot->reg.ring_acthd_udw =
> +		hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0).reg);
> +	snapshot->reg.ring_acthd = hw_engine_mmio_read32(hwe,
> +							 RING_ACTHD(0).reg);
> +	snapshot->reg.ring_bbaddr_udw =
> +		hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0).reg);
> +	snapshot->reg.ring_bbaddr = hw_engine_mmio_read32(hwe,
> +							  RING_BBADDR(0).reg);
> +	snapshot->reg.ring_dma_fadd_udw =
> +		hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0).reg);
> +	snapshot->reg.ring_dma_fadd =
> +		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0).reg);
> +	snapshot->reg.ipeir = hw_engine_mmio_read32(hwe, IPEIR(0).reg);
> +	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, IPEHR(0).reg);
> +
> +	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
> +		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE.reg);
> +
> +	return snapshot;
> +}
> +
> +/**
> + * xe_hw_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
> + * @snapshot: Xe HW Engine snapshot object.
> + * @p: drm_printer where it will be printed out.
> + *
> + * This function prints out a given Xe HW Engine snapshot object.
> + */
> +void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
> +				 struct drm_printer *p)
> +{
> +	if (!snapshot)
>  		return;
>  
> -	drm_printf(p, "%s (physical), logical instance=%d\n", hwe->name,
> -		hwe->logical_instance);
> +	drm_printf(p, "%s (physical), logical instance=%d\n",
> +		   snapshot->name ? snapshot->name : "",
> +		   snapshot->logical_instance);
>  	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
> -		hwe->domain,
> -		xe_force_wake_ref(gt_to_fw(hwe->gt), hwe->domain));
> -	drm_printf(p, "\tMMIO base: 0x%08x\n", hwe->mmio_base);
> -
> -	drm_printf(p, "\tHWSTAM: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_HWSTAM(0).reg));
> -	drm_printf(p, "\tRING_HWS_PGA: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_HWS_PGA(0).reg));
> -
> +		   snapshot->forcewake.domain, snapshot->forcewake.ref);
> +	drm_printf(p, "\tMMIO base: 0x%08x\n", snapshot->mmio_base);
> +	drm_printf(p, "\tHWSTAM: 0x%08x\n", snapshot->reg.ring_hwstam);
> +	drm_printf(p, "\tRING_HWS_PGA: 0x%08x\n", snapshot->reg.ring_hws_pga);
>  	drm_printf(p, "\tRING_EXECLIST_STATUS_LO: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0).reg));
> +		   snapshot->reg.ring_execlist_status_lo);
>  	drm_printf(p, "\tRING_EXECLIST_STATUS_HI: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0).reg));
> +		   snapshot->reg.ring_execlist_status_hi);
>  	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_LO: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe,
> -					 RING_EXECLIST_SQ_CONTENTS_LO(0).reg));
> +		   snapshot->reg.ring_execlist_sq_contents_lo);
>  	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_HI: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe,
> -					 RING_EXECLIST_SQ_CONTENTS_HI(0).reg));
> +		   snapshot->reg.ring_execlist_sq_contents_hi);
>  	drm_printf(p, "\tRING_EXECLIST_CONTROL: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_EXECLIST_CONTROL(0).reg));
> -
> -	drm_printf(p, "\tRING_START: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_START(0).reg));
> -	drm_printf(p, "\tRING_HEAD:  0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_HEAD(0).reg) & HEAD_ADDR);
> -	drm_printf(p, "\tRING_TAIL:  0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_TAIL(0).reg) & TAIL_ADDR);
> -	drm_printf(p, "\tRING_CTL: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_CTL(0).reg));
> -	drm_printf(p, "\tRING_MODE: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_MI_MODE(0).reg));
> +		   snapshot->reg.ring_execlist_control);
> +	drm_printf(p, "\tRING_START: 0x%08x\n", snapshot->reg.ring_start);
> +	drm_printf(p, "\tRING_HEAD:  0x%08x\n", snapshot->reg.ring_head);
> +	drm_printf(p, "\tRING_TAIL:  0x%08x\n", snapshot->reg.ring_tail);
> +	drm_printf(p, "\tRING_CTL: 0x%08x\n", snapshot->reg.ring_ctl);
> +	drm_printf(p, "\tRING_MODE: 0x%08x\n", snapshot->reg.ring_mi_mode);
>  	drm_printf(p, "\tRING_MODE_GEN7: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_MODE(0).reg));
> -
> -	drm_printf(p, "\tRING_IMR:   0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_IMR(0).reg));
> -	drm_printf(p, "\tRING_ESR:   0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_ESR(0).reg));
> -	drm_printf(p, "\tRING_EMR:   0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_EMR(0).reg));
> -	drm_printf(p, "\tRING_EIR:   0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_EIR(0).reg));
> -
> -        drm_printf(p, "\tACTHD:  0x%08x_%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0).reg),
> -		hw_engine_mmio_read32(hwe, RING_ACTHD(0).reg));
> -        drm_printf(p, "\tBBADDR: 0x%08x_%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0).reg),
> -		hw_engine_mmio_read32(hwe, RING_BBADDR(0).reg));
> -        drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0).reg),
> -		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0).reg));
> -
> -	drm_printf(p, "\tIPEIR: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, IPEIR(0).reg));
> -	drm_printf(p, "\tIPEHR: 0x%08x\n\n",
> -		hw_engine_mmio_read32(hwe, IPEHR(0).reg));
> -
> -	if (hwe->class == XE_ENGINE_CLASS_COMPUTE)
> +		   snapshot->reg.ring_mode_gen7);
> +	drm_printf(p, "\tRING_IMR:   0x%08x\n", snapshot->reg.ring_imr);
> +	drm_printf(p, "\tRING_ESR:   0x%08x\n", snapshot->reg.ring_esr);
> +	drm_printf(p, "\tRING_EMR:   0x%08x\n", snapshot->reg.ring_emr);
> +	drm_printf(p, "\tRING_EIR:   0x%08x\n", snapshot->reg.ring_eir);
> +	drm_printf(p, "\tACTHD:  0x%08x_%08x\n", snapshot->reg.ring_acthd_udw,
> +		   snapshot->reg.ring_acthd);
> +	drm_printf(p, "\tBBADDR: 0x%08x_%08x\n", snapshot->reg.ring_bbaddr_udw,
> +		   snapshot->reg.ring_bbaddr);
> +	drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
> +		   snapshot->reg.ring_dma_fadd_udw,
> +		   snapshot->reg.ring_dma_fadd);
> +	drm_printf(p, "\tIPEIR: 0x%08x\n", snapshot->reg.ipeir);
> +	drm_printf(p, "\tIPEHR: 0x%08x\n\n", snapshot->reg.ipehr);
> +
> +	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
>  		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
> -			xe_mmio_read32(hwe->gt, RCU_MODE.reg));
> +			   snapshot->reg.rcu_mode);
> +}
> +
> +/**
> + * xe_hw_engine_snapshot_free - Free all allocated objects for a given snapshot.
> + * @snapshot: Xe HW Engine snapshot object.
> + *
> + * This function free all the memory that needed to be allocated at capture
> + * time.
> + */
> +void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
> +{
> +	if (!snapshot)
> +		return;
> +
> +	kfree(snapshot->name);
> +	kfree(snapshot);
> +}
> +
> +/**
> + * xe_hw_engine_print - Xe HW Engine Print.
> + * @hwe: Hardware Engine.
> + * @p: drm_printer.
> + * @atomic: Boolean to indicate if this is called from atomic context like
> + * resets or from some regular path like debugfs.
> + *
> + * This function quickly capture a snapshot and immediately print it out.
> + */
> +void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p,
> +			bool atomic)
> +{
> +	struct xe_hw_engine_snapshot *snapshot;
>  
> +	snapshot = xe_hw_engine_snapshot_capture(hwe, atomic);
> +	xe_hw_engine_snapshot_print(snapshot, p);
> +	xe_hw_engine_snapshot_free(snapshot);
>  }
>  
>  u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 013efcd6d8c5..f933fa5cd72d 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -14,9 +14,16 @@ int xe_hw_engines_init_early(struct xe_gt *gt);
>  int xe_hw_engines_init(struct xe_gt *gt);
>  void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
>  void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
> -void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p);
>  u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
>  				enum xe_engine_class engine_class);
> +
> +struct xe_hw_engine_snapshot *
> +xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, bool atomic);
> +void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot);
> +void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
> +				 struct drm_printer *p);
> +void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p,
> +			bool atomic);
>  void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
>  
>  bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 2c40384957da..d3d7ecb7f4d3 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -109,4 +109,82 @@ struct xe_hw_engine {
>  	enum xe_hw_engine_id engine_id;
>  };
>  
> +/**
> + * struct xe_hw_engine_snapshot - Hardware engine snapshot
> + *
> + * Contains the snapshot of useful hardware engine info and registers.
> + */
> +struct xe_hw_engine_snapshot {
> +	/** @name: name of the hw engine */
> +	char *name;
> +	/** @class: class of this hw engine */
> +	enum xe_engine_class class;
> +	/** @logical_instance: logical instance of this hw engine */
> +	u16 logical_instance;
> +	/** @forcewake: Force Wake information snapshot */
> +	struct {
> +		/** @domain: force wake domain of this hw engine */
> +		enum xe_force_wake_domains domain;
> +		/** @ref: Forcewake ref for the above domain */
> +		int ref;
> +	} forcewake;
> +	/** @mmio_base: MMIO base address of this hw engine*/
> +	u32 mmio_base;
> +	/** @reg: Useful MMIO register snapshot */
> +	struct {
> +		/** @ring_hwstam: RING_HWSTAM */
> +		u32 ring_hwstam;
> +		/** @ring_hws_pga: RING_HWS_PGA */
> +		u32 ring_hws_pga;
> +		/** @ring_execlist_status_lo: RING_EXECLIST_STATUS_LO */
> +		u32 ring_execlist_status_lo;
> +		/** @ring_execlist_status_hi: RING_EXECLIST_STATUS_HI */
> +		u32 ring_execlist_status_hi;
> +		/** @ring_execlist_sq_contents_lo: RING_EXECLIST_SQ_CONTENTS */
> +		u32 ring_execlist_sq_contents_lo;
> +		/** @ring_execlist_sq_contents_hi: RING_EXECLIST_SQ_CONTENTS + 4 */
> +		u32 ring_execlist_sq_contents_hi;
> +		/** @ring_execlist_control: RING_EXECLIST_CONTROL */
> +		u32 ring_execlist_control;
> +		/** @ring_start: RING_START */
> +		u32 ring_start;
> +		/** @ring_head: RING_HEAD */
> +		u32 ring_head;
> +		/** @ring_tail: RING_TAIL */
> +		u32 ring_tail;
> +		/** @ring_ctl: RING_CTL */
> +		u32 ring_ctl;
> +		/** @ring_mi_mode: RING_MI_MODE */
> +		u32 ring_mi_mode;
> +		/** @ring_mode_gen7: RING_MODE_GEN7 */
> +		u32 ring_mode_gen7;
> +		/** @ring_imr: RING_IMR */
> +		u32 ring_imr;
> +		/** @ring_esr: RING_ESR */
> +		u32 ring_esr;
> +		/** @ring_emr: RING_EMR */
> +		u32 ring_emr;
> +		/** @ring_eir: RING_EIR */
> +		u32 ring_eir;
> +		/** @ring_acthd_udw: RING_ACTHD_UDW */
> +		u32 ring_acthd_udw;
> +		/** @ring_acthd: RING_ACTHD */
> +		u32 ring_acthd;
> +		/** @ring_bbaddr_udw: RING_BBADDR_UDW */
> +		u32 ring_bbaddr_udw;
> +		/** @ring_bbaddr: RING_BBADDR */
> +		u32 ring_bbaddr;
> +		/** @ring_dma_fadd_udw: RING_DMA_FADD_UDW */
> +		u32 ring_dma_fadd_udw;
> +		/** @ring_dma_fadd: RING_DMA_FADD */
> +		u32 ring_dma_fadd;
> +		/** @ipeir: IPEIR */
> +		u32 ipeir;
> +		/** @ipehr: IPEHR */
> +		u32 ipehr;
> +		/** @rcu_mode: GEN12_RCU_MODE */
> +		u32 rcu_mode;
> +	} reg;
> +};
> +
>  #endif
> -- 
> 2.39.2
> 
