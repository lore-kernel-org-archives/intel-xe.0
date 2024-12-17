Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB50E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 01:26:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B7910E1DB;
	Tue, 17 Dec 2024 01:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fv0Bh6v2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0157310E1DB
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Dec 2024 01:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734398782; x=1765934782;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sGpQCfP/nN9qa2Mb8Ri0OHXCJ9Gn0F0Hu65DipVbSdw=;
 b=fv0Bh6v2AWNJ6W/FUOhuthQtX39BmzdlIAfa9cOmvC+zF6Boe1Fvxy+X
 RHP+XkZYc9oheFSVvurmdJYoyiK5qdySOBdIB4psTfgIDDyUSUL5FzB//
 +wlK+4pcekwVyOPI4XHPmMvYx9Pd9gJMRX4vGqXIxiKJxQxCjHFJyvOVq
 zDRuDmbkoOmFj97kx2RN0MOPx/TGtiknJS1m+2D8SDpJ0RViOCIdZ4IRP
 4/mOT5nemKuDtrG0FDWGFnif3xwdslNqdscWPzTZ5PgbM9cfpDWkLxNMf
 HhZLRPp3fzEmy9iIJydtUxmKezcB5+CsKDIyRzMAcd9tGZ7N/GFsWgxJp w==;
X-CSE-ConnectionGUID: eV4fCGL/Q1Wndu5nYt6+3w==
X-CSE-MsgGUID: sB8NuTzZTuWeBZxJQ4AYFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="52331726"
X-IronPort-AV: E=Sophos;i="6.12,240,1728975600"; d="scan'208";a="52331726"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 17:26:18 -0800
X-CSE-ConnectionGUID: eYqp8/ciRAqvADgJeg5Dfw==
X-CSE-MsgGUID: cI1hvhyQQxSx6p0sljIQsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,240,1728975600"; d="scan'208";a="97158840"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Dec 2024 17:26:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 16 Dec 2024 17:26:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 16 Dec 2024 17:26:16 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 16 Dec 2024 17:26:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HbivDSDusQwORRLdPxA5xggoZIycnYfgWP6ICRidWrFTvuK0p8TbUhq4ZTyHncaE3yJtYVzbJHdOrajBWbsPwtfiFqsgUXI8MFbgIJeam+5FX0xANM5gCDLYmp37aP0OArpapyUdaPY67AyOsYMXcuRhaFHkphRkQsw2A7zYPjt0Clv4vxQBx3HBrqoSdMctnNXr85gwkBlRbW8Uq8mBmwCy4OoiAzL6+12S2d2dHsDHaDIQrJJ6tF3hEpQxxtiS1kAaPDaufiynkEqCPmNWsFIUY1IpGcE32ANaZMcOfBJ7kv5ku9rjBY1QlliFuE4koZlJfr97iLzSf4KXaZOcOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JeLQEPYtJS5Hwv9zhOjkTF+K2zpYZv0v7bGVi/G0Or4=;
 b=Cn5MSe07W4rIIoapuUJEhVANWfL1225NLaJeYIbHx+0Pf2JsU9D9OPBPC5WNswXdJeySvvobMgScP/a1Xv0VMZPzMlvO2oOVeEeKLx9x5T8ktNHB112xWvZRMoNE7Cs3UKjm1BlCu2cl4cWkS56JHo05s8tWPNiyQk2LXbjlxfmQnvvGuEI5juLstgMshUdmkxdiah8ZZTPfItwIk/M0fSxlk9DR6fM2SdbHyNceItpxiqDQtmq5vnCrWBf+STylF6RFyhnSobu5DdfYAFCtHvuHRTrzVXuAsZ4850Sg1KuZtcrctjkR7Bvj9HWwh4fkqVfXibm+oTm5POgG0l5KQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8317.namprd11.prod.outlook.com (2603:10b6:806:38d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 01:25:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 01:25:59 +0000
Date: Mon, 16 Dec 2024 17:26:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: Ashutosh Dixit <ashutosh.dixit@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] xe/oa: Use MI_LOAD_REGISTER_IMMEDIATE to enable
 OAR/OAC
Message-ID: <Z2DTUsppKuBJoNIE@lstrano-desk.jf.intel.com>
References: <20241217005818.25205-1-umesh.nerlige.ramappa@intel.com>
 <20241217005818.25205-3-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241217005818.25205-3-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:303:b7::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: b46942d8-f935-4048-37fc-08dd1e39c2e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1I0Ute9K3ZnnnSJ3CPO4/7Gc1mFSrTy2BlGI8R+MtVgEd914DWsBAOcU9q00?=
 =?us-ascii?Q?i8ZqlEw5zn5SzWe8gA4xZsLKJlht2MddYVmuepA3ZBWZQCh+YNFrYXZHvjhY?=
 =?us-ascii?Q?zrGhLZv2bSNhtMPncfhFPvIp/JDo2RrdD8ImGNSa1CEWxkfigsXsAt7U9BBY?=
 =?us-ascii?Q?F8MQ6zppuDBRVpnBQqdQNomc7Npr6gA6da2VHYWl7t7EWmdSdsox/GH7DgJo?=
 =?us-ascii?Q?jpwgEPBFFoDjKWNqWtAIQw/xsr6xy/D1ERiHmIHxQAwf9+UIzGVC8vcfPcbx?=
 =?us-ascii?Q?T8x6Y7ih6vnWT+iiZoi9subKQe9k5TiAHs1nvBXEZw6c9ttVpR1Mmnlw68R/?=
 =?us-ascii?Q?d+vW0ZB9OHtrTPp5bHAGM4vXVhmQV8/H4lNj/6P7BpWWpy151R+wbw1+uud2?=
 =?us-ascii?Q?zO1YNBkF6ukl73FCe70rBBjiphOnACutKxpf2XlvB14+jE6THw7m1igrWz65?=
 =?us-ascii?Q?CQMddO3kfXuwDOcZy1NznjApn1qtnDayQkyfF7ZPVXgxWUKw/DTYTEquzSyF?=
 =?us-ascii?Q?13uWa2Nnz6Wx4fYx6T91gL5vN0hpwdFyx1s+VMy8A1WqWCsiQ3GqRSDWPbZW?=
 =?us-ascii?Q?zZwDr894swESYhfigzBxno+tEXzJ7cyj/B8SOHKoAC21NSY3pyA4akukg3WN?=
 =?us-ascii?Q?M7a1ItQzw2swXpJqX8oY2TVWJcmAfu6pu5FmvFHXJMLFNdO7RNDG+OxyOQpS?=
 =?us-ascii?Q?Ns7EPGt4GiLieerhonzWiNGjo2Bsc8kYQ/bZNdIyJZgDTbdylDzZkt9HdD6y?=
 =?us-ascii?Q?O0DPshQlsxX8JXx4y67IvJg9u7F3Usxt/DeUmyT0IeiODBMUeTzj+UImpnKD?=
 =?us-ascii?Q?eXN1+0Vyz2wZcL6O3ZBjQgxIu5D6n0OW+4+cbYqVuL6SR/gsTAh2zIi6I1YU?=
 =?us-ascii?Q?EqR3C3KY3PNpRQvPiAbFB8DlA7TaUCUPJMbw6izRJGYcOpikyNmBffcPyQlV?=
 =?us-ascii?Q?oWnVLwycaunNY5uqq+/qxPaUfuP2U8herpQJ4QKdJn8O0MuyKo2OCIMwsM2K?=
 =?us-ascii?Q?4DG+1+NQodUmCoUMU6ypChNqDiBGurXv180fK7oTJMEHMCF13Gh46fa1gt6L?=
 =?us-ascii?Q?kKkh8pE48ilnoJP7BzodAJeUnylhxI1a/9E46EG8BeualKxpNzTTkDZL6EKj?=
 =?us-ascii?Q?IRItne4tPM6AmXGlwWcDTSps/ZbIFpcoeRlsSra4K0TGeXFJjnCc5q2f7YPQ?=
 =?us-ascii?Q?Mu6WRsr9rvAXv5w3pEPGAlBQRhMcpwPi2V6PcuptNoH/viFS8luULQHopctA?=
 =?us-ascii?Q?rHy/o+1zadQUy8BBg7W5GCQWOHgv4QnfdqHmO0YFHsbIdASD668df/6Ap9BC?=
 =?us-ascii?Q?0z4f86umqtnXBk45GrW2H0Uo0ypiZNe33HCIhXIpJQ4i+C/JGx6CHrqffopu?=
 =?us-ascii?Q?6z+wmtacJI0enilM7VGUOI9BNojA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B2bRCCyOLABlZ0UsgNabF3+6EZoXrV0bo7I+zHGiKZGqh24yNr9XjMOhVJ3R?=
 =?us-ascii?Q?yNmDThAYM7MLw99RlTwoEXq8euqrUAbo+hGqMv4oByVA7Oh3GMjygox7EEE9?=
 =?us-ascii?Q?oev0WG2Ls1u0yaCTSOI3sSfh6kPM7Lg77Yqj+44CNM2IlXcN/tN84oZAJoSN?=
 =?us-ascii?Q?hUATUlcjhq8kqkt8NFME4S/NSaFmgl7nFM6p3vblocCCdNxzizwelumhM+CL?=
 =?us-ascii?Q?Z+CkqidqrdlpbkQyGC18Z/xg46mRwYadhGevp4pTE1KqQ8KMlggkQvp/cIaQ?=
 =?us-ascii?Q?Z23fOUnwnFGt94yqSAw4J4NA8aVbx2y/1A+fK1jTUzwEM+xu5EPvzLYmQUjr?=
 =?us-ascii?Q?AVJoXxv0sIbXLwec208FfUh4Idwe/PD4CwNK/YYkA4eUUei0WG27gm5godWd?=
 =?us-ascii?Q?dtSQgGWQ3X/Jn4XpZCmh8Xx/TUmi17YnEGiJZCyX6OO1tXA7bPjWSHar9f4r?=
 =?us-ascii?Q?3DElghEOXTrHBUvxNueH1FKauEIYsXjeqVetT+Hk3v3ZaQ+Gj/ZEuNU4kMWm?=
 =?us-ascii?Q?8iciSTqgsdpXDUmTCS7WwXSyIi76S73MbE/5cVH+NSjlL2LlD8PGKBkb8yDN?=
 =?us-ascii?Q?BwMedoZ7y+hFa1Cy6Zy4hdEYzuZkaWHMLP+NdxOZoTr71VdmevKi9u50BwDX?=
 =?us-ascii?Q?q31JTyzhzGpV5QMZxdjEhGTYaELUMBIHwU+BMAM12TbNOP7W0hnAToRIcJo9?=
 =?us-ascii?Q?H58uVzNE11JfbkaVhCPWwMbjvvYXuLvZ8eOPLYdaBD7jGitFAH7iBCS8q94h?=
 =?us-ascii?Q?yHJ8KJ/RIBmGNtd9xNbGRtqEY/QtOPyvpLCnACk0Wkn6sx84JC+BdfKyf4/e?=
 =?us-ascii?Q?xwHwmQpmm1dwnj0RjyPL9Pr7PkagsT+XKeXcNa428sxEgixMFhK2me8smY9W?=
 =?us-ascii?Q?TX7ZnvzwqiLM5Oxrhonvp7cXe7NQJs7ivbX2nCfxzbnfSTYi7NossysUl5jH?=
 =?us-ascii?Q?N4s29F4g1qTfxHZ6hxJcNN7qz+TzAgsNAv/7m+UhIYYL1/WNjAUOfkEuWAJO?=
 =?us-ascii?Q?AKJtI/VYI2U8L+p0F7yGyqhz5TDPLP/IBX+4uh/btzWsAGnNvHMXa4uwiXBv?=
 =?us-ascii?Q?fe3LAL8aJZsNXguYNlGLiAYwuG9aBuBuo21tBNFGxmOnppjugT1KX5y4g/gr?=
 =?us-ascii?Q?+fBKHxCzHW6HicKlIR9D1A5WhQNzMvSXTSfnmgthtYgYWDMrXdxiCPcDXrgL?=
 =?us-ascii?Q?nJe3zfCSO82CYykz4V8WLUzWecO0EJgfDjd3DY7IESBE3nznU3m+YA8n3Rji?=
 =?us-ascii?Q?w6n+ebQo9Y6VQ6L/z9D8JVvmv9IRAdmWSs2FpuIpEjZ0HVgomL4ljyaFwg0x?=
 =?us-ascii?Q?gGHpd67a+Vwy4gc2wD8V5bkSd04HVna3sjlY7R66IQAly+ayIti6hYG31mfr?=
 =?us-ascii?Q?tJw23v7AyOpEMm2ajB4bm/2EOnlLeQ2ATsT0c4ye27aqMLJy0YKjgdQ0xmkZ?=
 =?us-ascii?Q?RxTLA8XW+h/H718CBjethyjyK0eZCjC6xghCifGY9My/YbkUCaPpcwDHyQ/v?=
 =?us-ascii?Q?2jlfNhg2Feoc+Mc4Sh2T/QPoqfrmndfoMv8OXPCgWuLd/j1KeDJoBpQvt+1z?=
 =?us-ascii?Q?tAo+BNjKI5ZsDEC6q7H08oo337U1FRdLHXFppjiv+zZTj7pbqmq1x6AEDUKA?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b46942d8-f935-4048-37fc-08dd1e39c2e2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 01:25:58.9741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XYwuHn78umjzFCSWingIL1L/VcFxAfXEF/EMdqRitz2rcbGKEtonUichmp9H97yjvl82m5W4zDpC3G22h3Tf4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8317
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

On Mon, Dec 16, 2024 at 04:58:18PM -0800, Umesh Nerlige Ramappa wrote:
> To enable OAR/OAC, a bit in RING_CONTEXT_CONTROL needs to be set.
> Setting this bit cause the context image size to change and if not done
> correct, can cause undesired hangs.
> 
> Current code uses a separate exec_queue to modify this bit and is
> error-prone. As per HW recommendation, submit MI_LOAD_REGISTER_IMM to
> the target hardware context to modify the relevant bit.
> 
> In v2 version, an attempt to submit everything to the user-queue was
> made, but it failed the unprivileged-single-ctx-counters test. It
> appears that the OACTXCONTROL must be modified from a remote context.
> 
> In summary,
> - the OACTXCONTROL is always modified from the k_exec_q
> - the LRI registers are always modified from the user-queue
> - emit_oa_config picks user-queue if available, else it uses k_exec_q.
> 
> v2:
> (Matt)
> - set job->ggtt to true if create job is successful
> - unlock vm on job error
> 

The job creation / usage looks correct.

For that part:
Acked-by: Matthew Brost <matthew.brost@intel.com>

> (Ashutosh)
> - don't wait on job submission
> - use kernel exec queue where possible
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c | 71 +++++++++++++++++++++++++++-----------
>  1 file changed, 51 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 8dd55798ab31..d6298c6fa78b 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -596,19 +596,39 @@ static __poll_t xe_oa_poll(struct file *file, poll_table *wait)
>  	return ret;
>  }
>  
> -static struct dma_fence *xe_oa_submit_bb(struct xe_oa_stream *stream, enum xe_oa_submit_deps deps,
> +static void xe_oa_lock_vma(struct xe_exec_queue *q)
> +{
> +	if (q->vm) {
> +		down_read(&q->vm->lock);
> +		xe_vm_lock(q->vm, false);
> +	}
> +}
> +
> +static void xe_oa_unlock_vma(struct xe_exec_queue *q)
> +{
> +	if (q->vm) {
> +		xe_vm_unlock(q->vm);
> +		up_read(&q->vm->lock);
> +	}
> +}
> +
> +static struct dma_fence *xe_oa_submit_bb(struct xe_oa_stream *stream,
> +					 struct xe_exec_queue *q,
> +					 enum xe_oa_submit_deps deps,
>  					 struct xe_bb *bb)
>  {
>  	struct xe_sched_job *job;
>  	struct dma_fence *fence;
>  	int err = 0;
>  
> -	/* Kernel configuration is issued on stream->k_exec_q, not stream->exec_q */
> -	job = xe_bb_create_job(stream->k_exec_q, bb);
> +	xe_oa_lock_vma(q);
> +
> +	job = xe_bb_create_job(q, bb);
>  	if (IS_ERR(job)) {
>  		err = PTR_ERR(job);
>  		goto exit;
>  	}
> +	job->ggtt = true;
>  
>  	if (deps == XE_OA_SUBMIT_ADD_DEPS) {
>  		for (int i = 0; i < stream->num_syncs && !err; i++)
> @@ -623,10 +643,14 @@ static struct dma_fence *xe_oa_submit_bb(struct xe_oa_stream *stream, enum xe_oa
>  	fence = dma_fence_get(&job->drm.s_fence->finished);
>  	xe_sched_job_push(job);
>  
> +	xe_oa_unlock_vma(q);
> +
>  	return fence;
>  err_put_job:
>  	xe_sched_job_put(job);
>  exit:
> +	xe_oa_unlock_vma(q);
> +
>  	return ERR_PTR(err);
>  }
>  
> @@ -692,6 +716,7 @@ static void xe_oa_store_flex(struct xe_oa_stream *stream, struct xe_lrc *lrc,
>  static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lrc,
>  				  const struct flex *flex, u32 count)
>  {
> +	struct xe_exec_queue *q = stream->k_exec_q;
>  	struct dma_fence *fence;
>  	struct xe_bb *bb;
>  	int err;
> @@ -704,7 +729,7 @@ static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lr
>  
>  	xe_oa_store_flex(stream, lrc, bb, flex, count);
>  
> -	fence = xe_oa_submit_bb(stream, XE_OA_SUBMIT_NO_DEPS, bb);
> +	fence = xe_oa_submit_bb(stream, q, XE_OA_SUBMIT_NO_DEPS, bb);
>  	if (IS_ERR(fence)) {
>  		err = PTR_ERR(fence);
>  		goto free_bb;
> @@ -719,21 +744,22 @@ static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lr
>  	return err;
>  }
>  
> -static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *reg_lri)
> +static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *reg_lri, u32 count)
>  {
> +	struct xe_exec_queue *q = stream->exec_q;
>  	struct dma_fence *fence;
>  	struct xe_bb *bb;
>  	int err;
>  
> -	bb = xe_bb_new(stream->gt, 3, false);
> +	bb = xe_bb_new(stream->gt, 2 * count + 1, false);
>  	if (IS_ERR(bb)) {
>  		err = PTR_ERR(bb);
>  		goto exit;
>  	}
>  
> -	write_cs_mi_lri(bb, reg_lri, 1);
> +	write_cs_mi_lri(bb, reg_lri, count);
>  
> -	fence = xe_oa_submit_bb(stream, XE_OA_SUBMIT_NO_DEPS, bb);
> +	fence = xe_oa_submit_bb(stream, q, XE_OA_SUBMIT_NO_DEPS, bb);
>  	if (IS_ERR(fence)) {
>  		err = PTR_ERR(fence);
>  		goto free_bb;
> @@ -751,8 +777,6 @@ static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *re
>  static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
>  {
>  	const struct xe_oa_format *format = stream->oa_buffer.format;
> -	struct xe_lrc *lrc = stream->exec_q->lrc[0];
> -	u32 regs_offset = xe_lrc_regs_offset(lrc) / sizeof(u32);
>  	u32 oacontrol = __format_to_oactrl(format, OAR_OACONTROL_COUNTER_SEL_MASK) |
>  		(enable ? OAR_OACONTROL_COUNTER_ENABLE : 0);
>  
> @@ -762,13 +786,17 @@ static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
>  			stream->oa->ctx_oactxctrl_offset[stream->hwe->class] + 1,
>  			enable ? OA_COUNTER_RESUME : 0,
>  		},
> +	};
> +	struct xe_oa_reg reg_lri[] = {
> +		{
> +			OAR_OACONTROL,
> +			oacontrol,
> +		},
>  		{
>  			RING_CONTEXT_CONTROL(stream->hwe->mmio_base),
> -			regs_offset + CTX_CONTEXT_CONTROL,
>  			_MASKED_BIT_ENABLE(CTX_CTRL_OAC_CONTEXT_ENABLE),
>  		},
>  	};
> -	struct xe_oa_reg reg_lri = { OAR_OACONTROL, oacontrol };
>  	int err;
>  
>  	/* Modify stream hwe context image with regs_context */
> @@ -778,14 +806,12 @@ static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
>  		return err;
>  
>  	/* Apply reg_lri using LRI */
> -	return xe_oa_load_with_lri(stream, &reg_lri);
> +	return xe_oa_load_with_lri(stream, reg_lri, ARRAY_SIZE(reg_lri));
>  }
>  
>  static int xe_oa_configure_oac_context(struct xe_oa_stream *stream, bool enable)
>  {
>  	const struct xe_oa_format *format = stream->oa_buffer.format;
> -	struct xe_lrc *lrc = stream->exec_q->lrc[0];
> -	u32 regs_offset = xe_lrc_regs_offset(lrc) / sizeof(u32);
>  	u32 oacontrol = __format_to_oactrl(format, OAR_OACONTROL_COUNTER_SEL_MASK) |
>  		(enable ? OAR_OACONTROL_COUNTER_ENABLE : 0);
>  	struct flex regs_context[] = {
> @@ -794,14 +820,18 @@ static int xe_oa_configure_oac_context(struct xe_oa_stream *stream, bool enable)
>  			stream->oa->ctx_oactxctrl_offset[stream->hwe->class] + 1,
>  			enable ? OA_COUNTER_RESUME : 0,
>  		},
> +	};
> +	struct xe_oa_reg reg_lri[] = {
> +		{
> +			OAC_OACONTROL,
> +			oacontrol
> +		},
>  		{
>  			RING_CONTEXT_CONTROL(stream->hwe->mmio_base),
> -			regs_offset + CTX_CONTEXT_CONTROL,
>  			_MASKED_BIT_ENABLE(CTX_CTRL_OAC_CONTEXT_ENABLE) |
>  			_MASKED_FIELD(CTX_CTRL_RUN_ALONE, enable ? CTX_CTRL_RUN_ALONE : 0),
>  		},
> -	};
> -	struct xe_oa_reg reg_lri = { OAC_OACONTROL, oacontrol };
> +       	};
>  	int err;
>  
>  	/* Set ccs select to enable programming of OAC_OACONTROL */
> @@ -815,7 +845,7 @@ static int xe_oa_configure_oac_context(struct xe_oa_stream *stream, bool enable)
>  		return err;
>  
>  	/* Apply reg_lri using LRI */
> -	return xe_oa_load_with_lri(stream, &reg_lri);
> +	return xe_oa_load_with_lri(stream, reg_lri, ARRAY_SIZE(reg_lri));
>  }
>  
>  static int xe_oa_configure_oa_context(struct xe_oa_stream *stream, bool enable)
> @@ -1015,6 +1045,7 @@ static const struct dma_fence_ops xe_oa_fence_ops = {
>  static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config *config)
>  {
>  #define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
> +	struct xe_exec_queue *q = stream->exec_q ? : stream->k_exec_q;
>  	struct xe_oa_config_bo *oa_bo;
>  	struct xe_oa_fence *ofence;
>  	int i, err, num_signal = 0;
> @@ -1033,7 +1064,7 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
>  	}
>  
>  	/* Emit OA configuration batch */
> -	fence = xe_oa_submit_bb(stream, XE_OA_SUBMIT_ADD_DEPS, oa_bo->bb);
> +	fence = xe_oa_submit_bb(stream, q, XE_OA_SUBMIT_ADD_DEPS, oa_bo->bb);
>  	if (IS_ERR(fence)) {
>  		err = PTR_ERR(fence);
>  		goto exit;
> -- 
> 2.34.1
> 
