Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7419DC77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 20:54:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F7910E12F;
	Tue, 24 Jun 2025 20:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BqLancKT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B570C10E12F
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 20:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750798466; x=1782334466;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TsFixpK9VBXYDqK9V5Qs8YMyccYuMcnJ76Tu+BMiwoY=;
 b=BqLancKTtTfMfLvi6/cD+OqM1jT3nejXMXOxABxTZW9vVQtymzVkDUIP
 1GMwPuCFcOj1jzBqsH/0HzALBj0v8UyBvhkdbBlq0baULsJA2Io/z1Txg
 plqA0L3kBtuUwrv/w8tNG3gB17ipHY94yNDHywDPAtgUVPMrWiuWdohTP
 VU8vzizz61uJD7z8rNrRuAdVPKrwTediAb/+4NVHCtn1rqezSSszDvlBn
 kGpqfTJxfUqH6XnXirQfIeRLezgDMJlqQOiQ2mqcPFqVlzZeCXHkrmXRo
 2rbq1b2/YuLtIFSOJdu/+V/UxIMlw4nxaVI+kTYKYkbynI1XwIXY0lwPv g==;
X-CSE-ConnectionGUID: JLQFoj0QSMeGNGVebIzraw==
X-CSE-MsgGUID: 2yq5+viKS9GgyzkBDFO+bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56730877"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="56730877"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 13:54:25 -0700
X-CSE-ConnectionGUID: 4UE7X1UgSWyuWBvZtZ24qg==
X-CSE-MsgGUID: 3IjOtosSTDWFvClD57eKYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="156051752"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 13:54:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 13:54:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 13:54:24 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 13:54:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XlPQOUDDAOR2J2gZozw7yHnEyoiP/Dp1DEORBBW8YIBL/gtmxjBKXbluogVsCW96uqgKhuUPJJv2bGmVvADbhR6PsTp8AZocgvWmuVf1a3p18E9wzA9W+uXyEOpZ7qk6TlJJwA4z0TfF886gosCv97gJlqnuJQqrt4bj3ccpfjj3DaHp89IHU5HQlnlb5Yfgcko6DKL+KHbILruKHwX/MnJ2JHyV9Osb07bK7/yxgCQyoZas5MoRV8uraxd6aGOKwEGiXkADWq7L0YsNLRTvezKjpeQI8CCWh9wcC24rIepBFrGn9sxu6Gye+zXIxJDES95mfs7VIlyqF/Tg1rTlzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oPC79JShbUJY/CTuSdArgLzx2J431RTtGTT0Q2BL8Y=;
 b=S/1GThbSEZuXzeFGlVQEwqWwXPZFgN6jbRnrc5X7nY7i7drILj8be2hZLZuY/ICagrNb+gYUHHuSnmrFTfvU/cHifnLmMEbAPArnB57Umv/rj/ePfqtfnWwucW3fyprSxB/Su66h5eQr8yj7g2sDlGLJBIdc0BqDNysUQNFWTDi3/zppwUHqfMuixoSvG9VkZUm+cyJONZqHYKc+8V7ryo67E7ljZMhptnU+3vmuJ/5GRDvxpmTtAbcyEa1qQiVAiGGKgIuEvW7Xj+OBo6knW3g/aMRZks8Y0F9e3+zNjbiNzPqL2HjpQ2FE3IHTRWyWURXmFxHp9nQQlkpOm+bXkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB6513.namprd11.prod.outlook.com (2603:10b6:208:3a3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 20:54:22 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 20:54:22 +0000
Date: Tue, 24 Jun 2025 16:54:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH] drm/xe: Do not wedge device on killed exec queues
Message-ID: <aFsQegvdaBkcIZ8n@intel.com>
References: <20250624174103.2707941-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250624174103.2707941-1-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR05CA0207.namprd05.prod.outlook.com
 (2603:10b6:a03:330::32) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB6513:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c0107b0-724b-481c-34c1-08ddb3614bb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SS/FQwB+ZovhHfrW+EqTmaOZWWNvAsv1ysy/pGgFA8XDMlr8oywo1b7bt2f9?=
 =?us-ascii?Q?/6anVmXz8u4oQ+0O1rIzQzGaYe2/qKWh018nHKBB4iOu7aagcCoN2SbnGQV5?=
 =?us-ascii?Q?1DRzWtwCZLElv0rB9UnwLyOecuVbmfs99rbSvmBRNv/WLdx8RGRIiuvrKduT?=
 =?us-ascii?Q?EewyoTa11m2OncPJQepx4ur6w8PYJpqC3gmqujdK+dOrE6x1aOpx47TXF8I8?=
 =?us-ascii?Q?uPjVG7jfEF9oKkZj6fLVkxKiCwiVDucpupm0+G5yPXp1V0PO3z1ftgYYYUKd?=
 =?us-ascii?Q?zXVddhDYqA1zMlWe1YAVJzk0oPTxbuWuyr71zxFq+8AWT9kmcTrUo+IQivRk?=
 =?us-ascii?Q?4pH0FxCmO4HN+VXifY/43nrrOJ8vgpfVvMHEgz1ZL4J3sHI1nDxf9cFFDPd8?=
 =?us-ascii?Q?tx7fyw0TnWkpygGxIqtc6feVlAk9l+Y5z5CT51X3lQ65q2ymHy1lF8o9WxWS?=
 =?us-ascii?Q?cHceatAAu7HUo2qziTp3IB4OKJazNAleykZbN6vS04URyok6GGf9KL05Iej6?=
 =?us-ascii?Q?yD7DK2C4QnWQ6XCaVMFQTHwLh0fTxlq7/6Rdj6MZdqiQTRTqnUiphEmgI5dM?=
 =?us-ascii?Q?g2ZV+/Z1pdUEIZtHuItGAkPMutCiyFrvkW1YLHM98K71xSdsEtQleAxDjnDg?=
 =?us-ascii?Q?ktjqGOzbum4PvbSj2kOWBuKC560YaWh8WbIgq2bOWttbmg8yJfZddhw3XHix?=
 =?us-ascii?Q?v7r/56nMCCQejd+n4soyMnxym5i3PnvZu55gQYFGkwTlllR1+mzEpwUHr/PF?=
 =?us-ascii?Q?9OqNTyP8KBVE5H2nSx+STnUlRsLeGFW4rAcVY1rZYCZDFU1twxUgnsD9Zyis?=
 =?us-ascii?Q?nqVEc397qAdxaPoAlnyU+B3EuOT4cLDs5NzGzQyLNqI6Z9R74VdQgSQdfY4M?=
 =?us-ascii?Q?nnw+XGf7jbLl980rvQdgS5KaNxJu1mycxjBxW4gFs4XCdWIvQgQLVFOyXzOe?=
 =?us-ascii?Q?G9rohlwi0bobLmAAUJGfZgmhHwskLC+nS6KsleLvMhSqRdsWxXhr7++TZdOb?=
 =?us-ascii?Q?M2Iu1NgbnzyskzZqdn01xKjqwm0BSYm47nrAtC4SBuhEQdWaoeGcBqShvTHF?=
 =?us-ascii?Q?wms36jEF9p9AxaB0MRIyOK4X+IeHbiMZ/3N5o8+QLUcpOZxUnURDhZDkBWiK?=
 =?us-ascii?Q?Ql4lfFn92d+YWCdsMZKaxaY0rH03fwsGIn96rrN4IzOZ7FeeYDhFL1HNpoT9?=
 =?us-ascii?Q?Exe54FXW5SbOo4UISdwIQATibnh652rIaYTtqv7Pb3o4nzCuJHGKlL+pPak9?=
 =?us-ascii?Q?ULFcvw6hJf3yUvvSler8pt5E1/ZHE7ZIiC8aAGGIeKiI4n6vplvmIjPlq9Cd?=
 =?us-ascii?Q?kginSOxBadAGumcxKyAy7Bdqry7CPg6J6vSPPbQeF6SMRADNcAieXmSsmOvJ?=
 =?us-ascii?Q?sR9NrNaZ+p1SzJVRRVRIO5cd9Zzi+6hf5sj7afHXTwkFDcy6zg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4jGvLJj8GbMqcYUccV8B3mG2iPjm4iNojSDSgcQq7ceHsLotC2Evsa3CYfa1?=
 =?us-ascii?Q?sAVJt5NVFgK9IY4KyXBYvvMiGfQZ/4BIQJbjbqYl16hqP/PRzLS9+iMNC/RC?=
 =?us-ascii?Q?b4CKR9OtriSpeNzz/0ddSY2fvgMdG9IrAXMHFy4rfpzxq7OGzVKNQVtBEFHk?=
 =?us-ascii?Q?wGQC2H1jQH+67cnRS4/q81Wqhay1YvJOyFosl949APKEf8N21UXt06AOlD8/?=
 =?us-ascii?Q?0iFxwgGlIvNixg3I0BTZDiK1F9RCZyJ791YF7I9uT42+3yt2tqSbcIvmUNF7?=
 =?us-ascii?Q?mYXtLF/7rNnpdvKCRwJ8UB4xEfEZQWMfl+fZe1y7p5+Iu1CcmoNiFtaR5voY?=
 =?us-ascii?Q?8aSeTFJUwBUKt1G39uFGfoBu/TdOJD1H67M5bdmnmVyBiySLU9swO5cBLTB3?=
 =?us-ascii?Q?d4znuokrZPVICHHIYvA3E4ew+b87FE1HAtW3JuihKQ3Pph5yyN75AvC8Dozr?=
 =?us-ascii?Q?030EjTkdPFHa8+wdzZATdsHDZzUY2UHm10pd5qozJ+Y32mlv2Tm0RChd/r9y?=
 =?us-ascii?Q?6NZl1MkbE1Bd7PEVzpVV9Nk2upBZdxV4jT3pnM4nT8MW/tBF0oc2uytmHu8x?=
 =?us-ascii?Q?NLo0g5AysqkfG6m13Hq7iIQasNXIrx3lA2NyEpZgyW/cu5dtShA/xkBD/muv?=
 =?us-ascii?Q?ymKo52pxIHrVYyFFAntB6CiKrjPAwo0clwpuPG3T2Z+ER14I0Ly/hy6ENkgt?=
 =?us-ascii?Q?Uh81E6LcMiMrTND6nUgMqyKHKWhWPzW+4cKwtKiGZUvvI7HSr83qnbO0KMgS?=
 =?us-ascii?Q?8iIYBHZ/F21JhlsxLk6QNXFgjS9rK0htDpSPrVUFe6FmlSUx4SeU4A46kUtB?=
 =?us-ascii?Q?PjeBEvypkjIBfVpUDnS9TOvsbx7p7cKCupvRs27dOsLCZxK5ks8K8d0Q+x60?=
 =?us-ascii?Q?2J4w6RbsBG2/Ikgb2uWe5D/spQLIQIKKLfBOLBhE2tlEkcTrbmyANBOLGiCm?=
 =?us-ascii?Q?KJUd02zAB+jVo5q2hKNOZB1szveC+XxKpPF4US4h6GYIhpKrnD/NP1ii5o3H?=
 =?us-ascii?Q?FyKOf3P03OaArW7jKA4JAYs56h0A50z9NXUaxym8Fh7iMwdhR7ZLvR/Ou1/d?=
 =?us-ascii?Q?dB6EpnmT1cUCduDrqqc+WfMdHypISYdX535aqG4+JH8D6Apv5rNWri4nFQ6c?=
 =?us-ascii?Q?kcSD8jp7UBtJeNBtOhJbvfZ5JPll+1khKYukq5we29T4dZOXamNzhgVhZZkB?=
 =?us-ascii?Q?o+w2mI8zGkN68YAmJjqrJL+EK8JkoGDD460sOsGRTm2DhHvISXpYRqvAmftW?=
 =?us-ascii?Q?FbwDtODgapuLlB6pE2uv5d/+omDgS0kOBBDLLjf+3VGhKREAjIUKr8vKlnpj?=
 =?us-ascii?Q?IWqpMQSxsQmu40ppcoIZ/tbQKtFkVk+rVTCQk7Ck/wFyT5N3S5vSZtXCW+Ft?=
 =?us-ascii?Q?ScD2IbLmf5+/+kcvHuqk7os59pJ/6dRpkb3cP+/bnEze8pHgaC1/hcRnm4fx?=
 =?us-ascii?Q?2Dlf6tRS3Llfnw6tYvpzB8Ms+VQheQCyMWkefHpNdprfaxa7VDEtHSYDb1x7?=
 =?us-ascii?Q?/2ILUFE9F/gwl3fs7DwQ4VKY88LlYBh6IP3ErWlLF9DGP33uPThvwFr/AZs9?=
 =?us-ascii?Q?pMvobFavtIXLheAz6PTw24jCK4yPT+4eK7XdEOq2WatNwD5npSzdFBeMYZ/U?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0107b0-724b-481c-34c1-08ddb3614bb1
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 20:54:22.1049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSndlkAMzuiKfFMqh2BIAHn1KJmkRdosvAPOkywIqRw9Ofbpvtii/FLl8s8+myPSXlIh7U8aEWLXgKuwoi7MUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6513
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

On Tue, Jun 24, 2025 at 10:41:03AM -0700, Matthew Brost wrote:
> When a user closes an exec queue or interrupts an app with Ctrl-C,
> this does not warrant wedging the device in mode 2.
> 
> Avoid this by skipping the wedge check for killed exec queues in
> the TDR and LR exec queue cleanup worker.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index df7a5a4eec74..72477ccc5c5e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -908,12 +908,13 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  	struct xe_exec_queue *q = ge->q;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
>  	struct xe_gpu_scheduler *sched = &ge->sched;
> -	bool wedged;
> +	bool wedged = false;
>  
>  	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
>  	trace_xe_exec_queue_lr_cleanup(q);
>  
> -	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
> +	if (!exec_queue_killed(q))
> +		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>  
>  	/* Kill the run_job / process_msg entry points */
>  	xe_sched_submission_stop(sched);
> @@ -1084,7 +1085,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	int err = -ETIME;
>  	pid_t pid = -1;
>  	int i = 0;
> -	bool wedged, skip_timeout_check;
> +	bool wedged = false, skip_timeout_check;
>  
>  	/*
>  	 * TDR has fired before free job worker. Common if exec queue
> @@ -1130,7 +1131,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 * doesn't work for SRIOV. For now assuming timeouts in wedged mode are
>  	 * genuine timeouts.
>  	 */
> -	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
> +	if (!exec_queue_killed(q))
> +		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>  
>  	/* Engine state now stable, disable scheduling to check timestamp */
>  	if (!wedged && exec_queue_registered(q)) {
> -- 
> 2.34.1
> 
