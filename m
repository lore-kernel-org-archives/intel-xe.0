Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6D7CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 17:16:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A481D10E4B4;
	Thu, 12 Oct 2023 17:16:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD8D10E4B4
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 17:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697130996; x=1728666996;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZggMogszm6T+SMeEmn6Mra6L/BCS/kgTxADQwHVmW9A=;
 b=g92K9/KlXO4rG2Z8kdjtfYz7r1OIOugV/7PMm9Lwbj+Ofc+HgdkdPWzQ
 Nm3uTNjR5cwaUnCmkLMI+fbUaLphYOab8m1I6aF6GcnawUH56vHbjhPOC
 Rhp3vX2TAzbISuRjHh4SZpMiq44C605afZWAOdT86HB4rl3Y6vKfYHOSZ
 0Vk0ywNyoRJ0iX+p7fQE6CXrmVbQsHGyNrqgvCwN1U8F2N1qI0QVtyiB/
 IIPw8r6bM2gfkZY/v8GPzim3Fjc/SWePwQZSTKZkmU2tq1cSg+HExJd96
 ryr3Pl/LZ+KCRNBCU8d3+JW9OyPh1JI3dql+khBIxcyGsiLespj7ttENF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="365245836"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="365245836"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 10:16:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="870675922"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="870675922"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 10:16:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 10:16:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 10:16:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 10:16:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 10:16:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOP0ulZa88xxVFovXlVDszCm1ubBK5956pF6o2M0ErcV/Stnr2mkXbxjhmYNnTY7b5Hon92X9bUwFdKO5X1Htpbb2UYUPQ9yw+lGAvLtYGI5sfGJxARiTW1YJZdi8Uxm7EFxeQmgYo3Mikb6lj2d45bEVNcAU82r3D06f6B08zraK/Sn6xTP18BeGY+/m6TxrL40djiVq1kNcKpdWkHwB0CaRLrYz2E5YuXZHb8loICnPPE6ye6Vr02n21fI+pJXfnHcsjJ1torARja9J/M7eKjWmkfVkazH8JNWGTTOk61aHl4neNZh655IRbwUR42S1Ymjgd+SGElY8m0PRr3A7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFxo3993LXxf1ZCd9RKplAy0yEYxhISRHnHweXPye2g=;
 b=AHOoqkL7FPKp+D3/RhKc3bU8a2fcFOnFX6IB2kkxGm+QVk0VRiKjXyZSRIEsHzHfwa6w8eQafX8auUhg68PT5rRHjyh/Oo9GtshLaPBz8TKmkI6xYsYwDcqmSx0vSwH3Q/AWI0o0cTVhQWtJvLvfgnvBmLINkuZ948z+h3Zo6xmznTDRi1QuOHbPonQj4nOYCbQBpT4vKzV/I84FP89O8owbaW3TBXehD1QAsKclscy+UummYOv+Ikqu4E4LHbZy2pEVq1bBde8O/IkjlH+eRBS6S6+l2gKjcouagL5iyjvjOGn5WrHBzVWlMVLhrernO3xTH7M9RQmAhl6Lh+kc/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MN2PR11MB4758.namprd11.prod.outlook.com (2603:10b6:208:260::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 17:16:31 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db%3]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 17:16:31 +0000
Date: Thu, 12 Oct 2023 10:16:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <20231012171628.GH21382@mdroper-desk1.amr.corp.intel.com>
References: <20231010184151.91195-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231010184151.91195-1-jose.souza@intel.com>
X-ClientProxiedBy: BYAPR07CA0095.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::36) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MN2PR11MB4758:EE_
X-MS-Office365-Filtering-Correlation-Id: 05cb36de-29a0-40c8-f1e2-08dbcb46fa20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r3jH/5sLYFlZaXLzB6lo+RcXFIqUhTf1aR7SYsl5py+qALDPqoHz7gIPT4amjYul7Lzs/EjVLPyPPIs/88N9yn8nuISrw+b3xlQ7BkU+do5YFat/AVMvwGJ+ZCO5odaf2zp5aVyy+3fxwJLOtWL8Z5RPg1X8nFNOqYjgUdJGWhbLVbJDZk7WLJnNYvZxTF5emSwBuHWE8HnyPKxq50S7pm/j/YJ0u/tBA7UEvh11BlX9H/XyQbyIekPHaf/mE7aVxrPRmcc6nejLrPeurQ1JHEMLxzy1SARUh6h448MXFCx4e06FWVuXIPMbJ+HsAx/DU+XXMjgBvm6r0TaCI8Ftuhts1Uh+biKzaORhK/MJelJbFIfKbC4WPnWsOPJdr7b9tNVUlYf4ZQaGx9G8DbdlSv97xlCt862bNhrpfUAS09zQxVlGJFcPCzhCD4BUO0RdUcDeYtfsMbcEqZtQ08sa0fDkO6vGGDkN1Q/FPNnNnL61v1CI2kb01uTVluvrPW344KDH+omjZSLDP3Bzj8R7PhwAdqJAC93Pn4Zx3QDrnjxLrKThH5kNTYsqKOOnw9Is
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(346002)(376002)(396003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(6512007)(38100700002)(26005)(82960400001)(1076003)(107886003)(478600001)(6862004)(6486002)(8936002)(5660300002)(8676002)(4326008)(86362001)(33656002)(2906002)(316002)(6636002)(41300700001)(66476007)(66946007)(66556008)(6666004)(6506007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ygG+1WrHcWO7jwLgo0x+GmxtBf+7MnPgWsQ+def2f6WDaaPhEmCrkc0Org?=
 =?iso-8859-1?Q?W2OmRN4eWqjLDiVmZBfC/J1AqRf9TqNRbgogDPjy0s0QLITw7YPNgKPkEg?=
 =?iso-8859-1?Q?NVNkAEqvuNwfS/89nPaZDBm/FaI+05J6dJktWv4kzKtfQmdcu7PEjm7Ysr?=
 =?iso-8859-1?Q?kH81GBMVNXM6kEScGjOELtdoph/IGQuwhIAH2T60CwPuChWbhBsiorzE6Z?=
 =?iso-8859-1?Q?QGLFqgLDLf5R7jyAfNYLXeXYhCQnPb2byJBrVxYaOOZLYwZA4a6o0xm72J?=
 =?iso-8859-1?Q?3iLT+CgVDHg/9211PWljCvTBNZnY3IqHHkOHIxLdmDKoowzwFs/U36hcUx?=
 =?iso-8859-1?Q?4o/+jzITfJXI2CEyaR1223/JkVedrQxN71+68WbfqyIVmhfIpblthsriTz?=
 =?iso-8859-1?Q?Q3OKaj+iVwqO/FnPN9CHB9idX5VT+Be6T9eakWuguem9Y2iAG6JDzitVdd?=
 =?iso-8859-1?Q?MPnNknJF5jDOobqIdUzGiley+hp8AlnBCu4nICxGUTNMQw3SSbWyefWMP/?=
 =?iso-8859-1?Q?Yp30PKyXv2kFC+DSLl7ViZwJcNXTEGjIqPvKmMBnJxoJxGZhRLKCG7w9dl?=
 =?iso-8859-1?Q?UO2ImY/4G3tbylo4Ys+RIXtBEI/OtvFcDSNvUxq8hiqJfLQTrEWL5dgWV6?=
 =?iso-8859-1?Q?RMWc2aG9+Yr2+TGCPyB4NMhyHEPSRKSaUubq6bdXodw2sDsdZs1tmt4/iH?=
 =?iso-8859-1?Q?RACIWm7l+fPtiEhSy5IBn8rHUFQ0Z2wdMthSjAAm2yQq7hqVCpvw9siR1Z?=
 =?iso-8859-1?Q?N6uAUNlLTm8mhJ7dSJ+pLCwUQv4rQkPM2yYiIBxkuNYa5e32D5ZpJ+hBc0?=
 =?iso-8859-1?Q?sEEom4N0tz2us3DegxdN8lXczYpdqpaC4rMjQlSShekX/vEU8PyJTNIIJ5?=
 =?iso-8859-1?Q?02w2d4UDCk6XMFbdocwVl0tBaEHQs5Ds2RYYngmf9s+p4uYNvdeZNUTnsO?=
 =?iso-8859-1?Q?mmqq+EqsnIULgqyKq+8jtgKfF0KmApf2QgGggGjtN2Z5OEFl6Iiagy5vYb?=
 =?iso-8859-1?Q?RZbPb48teZXr6NVOaUlBgtHlUZ5cTNIJyOTxbQzx23crGFBx4V2nsl/z3H?=
 =?iso-8859-1?Q?XntiKMmyZu2j8FDNkWoS/HwjzA1u+3Ih2WgThYlPt5Tor+kvDAWL8WKlx/?=
 =?iso-8859-1?Q?azq8kiVLcQ2Hoj+YweqXoeu04KE4EnsuV6xM/vlYgpbmhxYE55KdnnH55Y?=
 =?iso-8859-1?Q?0kJLf+b8RLnuW3nCvzG2LVoQ/U1qJ/pQkBnt5bA09mHrdWvABJHc4IzF85?=
 =?iso-8859-1?Q?AnGFz5x3z5OOmlQ32Jkj6A52Q48FvwbmpzUupkz5+depZs5evgQ+pI4gi7?=
 =?iso-8859-1?Q?EgN0dXBKm9pQcW1szR2T5I1hubl2AI7qvz+qJnZSPNH1To3vPCzVVv396L?=
 =?iso-8859-1?Q?NW2QMglJhGXrGsmE7Rd2pdgNr2P7slD9dfqwUtEShsJ5mQs734ELEBwgwa?=
 =?iso-8859-1?Q?BVjo/Dt/j/BdiQyHr5koms5aY2DZsAj/CzaDOWrUW6l/kaGItRiRp7M1HK?=
 =?iso-8859-1?Q?HZ6qCdIEqE/KMRY9rk8s/mh8YWseK+Rv3SU5Gl/jnOwth3wMKdnjYxP3ay?=
 =?iso-8859-1?Q?wkXbIVlfzavT9hhc4MnLd5OAwR7YaCKbCNi869D+BMX/aFgHQuqXsswZgk?=
 =?iso-8859-1?Q?9orSe+Y+7ra+ULJqVbhyJg1Yf+/T1xW9sxcheQ15Iq9TFLdqAKzJfgsg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05cb36de-29a0-40c8-f1e2-08dbcb46fa20
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 17:16:30.9595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4FJFfWQaFZtCzzSAra2oODmoESdXKRidEy1AzHeGQeI/GMAwpqA2lXe8zMiq0TJTkpkegWXrs2B/2zFbiWJRJ75GvCDP4Dp87Mk2OyaC9f0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4758
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 1/3] drm/xe: Store xe_he_engine in
 xe_hw_engine_snapshot
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

On Tue, Oct 10, 2023 at 11:41:49AM -0700, José Roberto de Souza wrote:
> A future patch will require gt and xe device structs, so here
> replacing class by hwe.
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
> index b5b0845908887..37b3ee1268090 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -684,7 +684,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  	if (snapshot->name)
>  		strscpy(snapshot->name, hwe->name, len);
>  
> -	snapshot->class = hwe->class;
> +	snapshot->hwe = hwe;

I haven't really looked into the devcoredump stuff much, but it's not
clear to me from a really quick skim whether it's safe to save away the
hwe like this.  Is there ever a case where the snapshot can persist
after the engine itself has been destroyed (e.g., if we capture an error
encountered during a device probe that results in the device being torn
back down)?  If so, then you'd probably need to make sure that the hwe
field here only gets used during the capture, and the 'print' routine
would still need a cached snapshot->class to avoid use-after-free
errors.

Rodrigo probably has better insight as to whether that's something that
we need to worry about.


Matt

>  	snapshot->logical_instance = hwe->logical_instance;
>  	snapshot->forcewake.domain = hwe->domain;
>  	snapshot->forcewake.ref = xe_force_wake_ref(gt_to_fw(hwe->gt),
> @@ -731,7 +731,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
>  	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
>  
> -	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
> +	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
>  		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
>  
>  	return snapshot;
> @@ -786,7 +786,7 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>  		   snapshot->reg.ring_dma_fadd_udw,
>  		   snapshot->reg.ring_dma_fadd);
>  	drm_printf(p, "\tIPEHR: 0x%08x\n\n", snapshot->reg.ipehr);
> -	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
> +	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
>  		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
>  			   snapshot->reg.rcu_mode);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 5d4ee29042407..71c0a0169e62a 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -156,8 +156,8 @@ struct xe_hw_engine {
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
> 2.42.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
