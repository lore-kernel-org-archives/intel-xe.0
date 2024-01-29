Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8D1C47DA9
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 21:16:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39051112B28;
	Mon, 29 Jan 2024 21:16:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D37112B28
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 21:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706563007; x=1738099007;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lWcbTuSzUOKX7rn8G0p9U4ArmZvRi8zFl/wjPP+70x4=;
 b=XojcH+7K/R++d256LmnETLFHxRIm7H3ckKkvlxJJISA9+pd+hUwP46ml
 lv2CAbSdfVOFoQeSf9BbLObJX4R5LhBE+4RP3kUD9K/EC0lR8jIVdbHJu
 hZARQOOz2Mk0VdYUu708Rl273unhTTfZ4YIYoQXHKXS1RPQIt22U00Kcb
 9Ll3U5HC8vQGkzBJcC+7d1CR1WdMBB8cA3b/doqwxQm1gyAqtiQUFiyNi
 ZQkrwTWzwHzNeFoYc39HuMtD6CSb29LqANrAUi/NBTxV9+n4kzD4sdnPS
 C6sQwV/P5lbE4HpW4iB3IlThN8cw4g0HZe5cFtnqO/fU0pd3VJwa+V5ld w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="401960107"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="401960107"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 13:16:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="3589602"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 13:16:47 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 13:16:46 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 13:16:45 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 13:16:45 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 13:16:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E4YXSaqHoBvK5Qlk2wncPK+ueRo0+WDXy5oaKyMYuT1sBf+t98OjvVlSRFKFdQoDa8c0/ouyfTMO23/yO8XySN7kvAwMOBNCbftecHmLrulf/kkg1nUFefal3Jdy9YizNBvYr0lA6gpowJGSZeFFUzcoZcxrGZqyxOMK0ePd2f4p8GO1K1CYRV/pDRlu0PBfa4gFne4BsEZaBLTMA3G/742O/3CTxydZYorfUV0NQsUL7C1XlPo1NWgEQ2QGh/1ZhdlCe7Uz1LDbll5RKMCgd84/tILUvEL8GNvn+zSnuu+aNkncOzSgA4kqq8HhnrC1oI0CC1knq3HWpF11iMlXhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rkxcFBXAMWBmMWpEdeI5NtW99FO3h6+DcTNUhFzHbDc=;
 b=KzbrXOTVWVdHxpNh4pVQFQFxwp5buErAkX51hb2mSrfGUbXRfI0uhN5sVQYzPKp3IcLS/bms3On2wHa4rxj2KZJBgHKOygpT3AAyVoT/p8xgTBQOHwhQ1aiVuLxIFQuWNsOt75u6u46mKXhDY4n7E6l8ds2SKo+S+jUxfRjSpPJeZ0NIj0W3OiTtDJikUlGzXYkUNme2PCIJKdWdT0m6d/BB72dGaInF3fPtstKUD0hvs7Psuq6Q//eHlfilYl9Ryo05kzxcuxmuH+p6uvPpUkWZJsRYr2wjc0DaFVVyRBjac3NrefoGEpbyvvQ7zWgV5XwA04jJae7CB9Rp371lKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB8450.namprd11.prod.outlook.com (2603:10b6:a03:578::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 21:16:42 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 21:16:42 +0000
Date: Mon, 29 Jan 2024 13:16:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH v3 3/6] drm/xe: Store xe_he_engine in xe_hw_engine_snapshot
Message-ID: <20240129211639.GL5506@mdroper-desk1.amr.corp.intel.com>
References: <20240129181742.183694-1-jose.souza@intel.com>
 <20240129181742.183694-3-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240129181742.183694-3-jose.souza@intel.com>
X-ClientProxiedBy: BYAPR21CA0015.namprd21.prod.outlook.com
 (2603:10b6:a03:114::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB8450:EE_
X-MS-Office365-Filtering-Correlation-Id: a1505661-0a2e-4804-6304-08dc210f96df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b+MKp2SfhazmjhgUDWL2tNdSed296DYFm3GD1dJ9K+GJ1Na4CCUJtIHExr7qDzIE8XfKeUjAjy7HDgd3CvYzXVHkY06xLRPs50QU0/RxnuWzGjdsk4yujprpw7HqGjYUPaoawhT4kE3Uhyy5jBpwYA4Xg/FkW8/KhMlNhr93CNrqgN56sd/H+XiFLJbYsYlAX8CrOza03gctllpKdoa+OoScuSiETL+S0JgRligzcDQFp2i1a9EhrygKq3Hrzn/wSSwWsLxITq3RVOibrRnSgSi3JtDswNjHT+lw3RU53IF7xak5pz7AFKH4qnsw7wd9sFKnmJvjghHQbtBTDcieN3pxWzV1VdG4reglh2iyT4fSrBoup1ac3zSDfzWyC98IEUJO4yxBXXvXdcMXs73cnZ4x2lYyQXqCeGV91JpofK8spZh8PtADGkfcj8y5pqBedP9qWUWr/qMYCkWG0hLy3mbFns/yuabDstlhKPPJ5+jbMKgh5otqCjfjsgNZ+SWXQgqDOeHqIs4brB5HHPTNzGot+HDtk/VFZ2JT1/k6hrv2Pu4itXTFy+2mpT9rOwf0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(86362001)(316002)(83380400001)(6512007)(6636002)(6506007)(66476007)(66556008)(66946007)(1076003)(8676002)(82960400001)(4326008)(6666004)(6486002)(26005)(107886003)(38100700002)(6862004)(8936002)(478600001)(2906002)(5660300002)(33656002)(66899024)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TI3CJ3MFV40I/6wBFM5IsUiBxd3KWpAbivcCRqcKB3RepYPGQoLBhoL1Ey?=
 =?iso-8859-1?Q?ovuLko2NMn1knimpJYO8cBYiVzwqGe43Q0NdgezTB8KD/3puLtZubZT16q?=
 =?iso-8859-1?Q?oq0zNCQbdiAaWl7wZj6N7poaXoUsAG3EBTXhiae2i56V7QMFPtzOXUAIhu?=
 =?iso-8859-1?Q?fV/iXNhLkG9J4D83tjST4NKA7Lz+Oq9/K6ql3mHU3pEQ5K6iE+ApEo5wNu?=
 =?iso-8859-1?Q?YXbytz5oZu2ipgV/FIYryF/5tnffWVNjTzehDr3mFAUkFHYQH4OP3VMexL?=
 =?iso-8859-1?Q?4AhRbjhDT20cILolXjpN1M4MAf5wt8EKs2Tieu2oJoNOrhAcjs9etqhZJS?=
 =?iso-8859-1?Q?IG7AGOk7xekGV3Rm6YmbG7lol9AfMziLhZfCFyJ6/Eboli5LRA79iA9Tbw?=
 =?iso-8859-1?Q?Pt4h+K7+gpkofi21Cl8EKSDbj0zIUDtRZOc/Av+wNODFKhDocIjikGs7MM?=
 =?iso-8859-1?Q?k05+h4eBgL84tIZJZJxiAJdx20Gzog/r+FFWsDtul65eG1rCNTswGe+Djs?=
 =?iso-8859-1?Q?SUJ600ISD9JZvlQI4VEF6k1j1QwBw10/55ZmuFsMO9gOgRl+UWZcxN5J29?=
 =?iso-8859-1?Q?pop+uXJVCT89bkhxuCCDvmtpvBNq8spOKLjvm0pVVWg0OX0qvCh0HNLDzB?=
 =?iso-8859-1?Q?afnQLDYOrVXIfDk9buFjuCKk/t2Um5SQuU4XXCAUi/ME8aqoSkkOJNTcZb?=
 =?iso-8859-1?Q?EFUavaVotfGzDWlj947bwN/sCVvooa74hunWunahT2giHUys43NZAQ89Ny?=
 =?iso-8859-1?Q?SMrLEM6GgnAqL8F27c658FncLAtt9nc1xPB6gUoeFQ1ZG5MeGRN/KGl1Mo?=
 =?iso-8859-1?Q?amA0UIg3aWObRck26Gx0Ioh7QziKFpcC6zgt53+cXMBvriTZtTlIOy202L?=
 =?iso-8859-1?Q?0800ipwxmuMjVoEyUST0gt3uVhWBmPmC83OtKIm7Ob9nIqgIMjuvr1uwKy?=
 =?iso-8859-1?Q?5FT3/40A+GcMuXmYYpE8POt5rh9TQH+Zi11i6iwYYcJMMxJOIoljoyhXT9?=
 =?iso-8859-1?Q?UklFR/FXh2b/sBbX6HfnedISLX3O3EJpLSQVYXS+uI631HuwRFI32+7qqn?=
 =?iso-8859-1?Q?sii8MkUy1+sVwQwJNpyVPcAUl7Zr6FBVZsMeJ4S5YeV/9dpu+8NzReR9qh?=
 =?iso-8859-1?Q?zWS14aRyZICrL+nrGt+0GOAP4x8tiTrsJFa40eBRf66jQGPFQBCodbFsYT?=
 =?iso-8859-1?Q?sHjKycrS6qIu8sc87rzvLJyR2lYKNDlcP3KpOH0Shixj4U8a7gD72sPTJM?=
 =?iso-8859-1?Q?0+18uJPG+sN9sn1dlEegj8blUOnTaR/+SzcFTjJVYao8KtTM+jjDSjKWHy?=
 =?iso-8859-1?Q?V18z+MKn6tlxDWoetmjeY/f+mi5KbcWAztz4RmvKdO9eQvuhFU1eil898Y?=
 =?iso-8859-1?Q?zXc6DV8KG6eCPuG0TLe7OxJEF5mo66Md2+jtu/yEtqZwqIQTtijLjWIngB?=
 =?iso-8859-1?Q?EkgT6bQ0+GtaNTe4KvIAtvzcodI8yFjEcml+909eRrgvrWly2qRqnQ/YKi?=
 =?iso-8859-1?Q?wkGRf7hkxaxxR2U5zvar876NRKdKr6koPXiZPjsvCGqpaF1Gt8bZNlD0eY?=
 =?iso-8859-1?Q?xeY6LZe0cQF5l6Ku3s5gngEJKPfEnp9u0LHj1kwXQFv0z0XF9fj4E3Dczs?=
 =?iso-8859-1?Q?ysnqP7kmHpEcNhNhEiqP67HWurjEQ8xhwNiydwCqw133AQ3A++pWME1A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1505661-0a2e-4804-6304-08dc210f96df
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 21:16:42.0196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sS/Ra4qZOSMagCF/xncx0BEr7DxKNsEuqOPGORMpktC0JOE0vG1EpmbiCMilr1MJgHwnWxnsSYutOK0pyGwCt3RYeZ7+pLCdpRr/mQsGJaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8450
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jan 29, 2024 at 10:17:39AM -0800, José Roberto de Souza wrote:
> A future patch will require gt and xe device structs, so here
> replacing class by hwe.

I thought this didn't work because in cases like a failure during probe
the the devcoredump can persist for a while after the xe_device (and
xe_gt, and xe_hw_engine) have all been kfree'd?

I.e., we can use the GT or HWE during the capture phase, but by the time
we get to the print phase they may already have been deallocated and we
can't touch anything except the data we've already stashed away locally?


Matt

> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c       | 6 +++---
>  drivers/gpu/drm/xe/xe_hw_engine_types.h | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 0d17e32d70c87..61b0c18d8b624 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -760,7 +760,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  		return NULL;
>  
>  	snapshot->name = kstrdup(hwe->name, GFP_ATOMIC);
> -	snapshot->class = hwe->class;
> +	snapshot->hwe = hwe;
>  	snapshot->logical_instance = hwe->logical_instance;
>  	snapshot->forcewake.domain = hwe->domain;
>  	snapshot->forcewake.ref = xe_force_wake_ref(gt_to_fw(hwe->gt),
> @@ -807,7 +807,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  	snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0));
>  	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
>  
> -	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
> +	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
>  		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
>  
>  	return snapshot;
> @@ -852,7 +852,7 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>  	drm_printf(p, "\tBBADDR: 0x%016llx\n", snapshot->reg.ring_bbaddr);
>  	drm_printf(p, "\tDMA_FADDR: 0x%016llx\n", snapshot->reg.ring_dma_fadd);
>  	drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
> -	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
> +	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
>  		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
>  			   snapshot->reg.rcu_mode);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index d7f828c76cc5f..27deaa31efd31 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -158,8 +158,8 @@ struct xe_hw_engine {
>  struct xe_hw_engine_snapshot {
>  	/** @name: name of the hw engine */
>  	char *name;
> -	/** @class: class of this hw engine */
> -	enum xe_engine_class class;
> +	/** @hwe: hw engine */
> +	struct xe_hw_engine *hwe;
>  	/** @logical_instance: logical instance of this hw engine */
>  	u16 logical_instance;
>  	/** @forcewake: Force Wake information snapshot */
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
