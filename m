Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F60FEB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 21:05:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB4E10E117;
	Fri, 28 Jul 2023 21:05:33 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D3910E117
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 21:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690578332; x=1722114332;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iUbaHycRzNK0in+nmh8DMXP3m45nJexR5QtPK1Sc01M=;
 b=Tx+oIie76qe58ApJFrtY8LQRicBFAJNCpMf0KqVufgVlURBTRFW2LlDr
 d+/CJZ1xBE/b4Ah/nZOzp7YmRP0yYXUL1oVsOiCcNHag9Tqbp8KMYyGG4
 LUEmbtFchSjGOTPo5ZjbLAERHLQpceB7t9RT3gDKccq2w8nZZT2Dwl5QW
 ur80dbn7iAdUw7t3QpPuLVxIrbiYvjbV1liOZbfTepIJaHd7txeiDMN25
 mLfZesvjJ1Vp6C7T9khsAmkOmV5R11UaTg9DDyzd/R6HkWSdRBo7ioqor
 9/vypVaEiRKi2G+Rwq09P0N7xF9tjgFXL9OCUefsDjMIG4Qv+2TBznVWv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="367567315"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="367567315"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 14:05:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="757328276"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="757328276"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 28 Jul 2023 14:05:31 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 14:05:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 28 Jul 2023 14:05:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 28 Jul 2023 14:05:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+l3vgb5L/dk+oO46Hj0Rx0ZCEdwyQRd3T7Uo6/fMegAhKOkB15UheebW91EIgBVennPzeTcZ/LXYHZtQJu1McA2uxYQ5NJ5CQOpsWqgyiwpqhtvM/wwJj6axvP/sQqReARoatlZnRIf88+PPa9ct/i57cwSxHSKmX5zfHxeaqzL6r1cqWqLmZdRkxPKZuvOgY51aheben+ijRksQIYO9mdnUhrcutUiQ0C/aBj+Aj/HiwY5lAXRweskgKP74Cez+0Kimh7PQd+BxyHpDF9hakkNAGleb12OigoGrV6p2WnyqdRa9wPJGNW8gQjPfKS9PRGuoFl+D3SIE2RriSIlJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIPZ2krRjtjQhcFapcc+oLl4HqFRZQYcWepKSL7kC44=;
 b=IZo4uYeGtLR+so05A3I6gLpOc7+nObLnobQN2xRM6xfaIpLkwFZy/S9jpP7cZweccxRxmoVIIlMOOGlkK0bRgz6YSYc1I4PlWGQ+CaFgShiN4fJPysPdZm5hcNNk7lybNZwAQIPSFe7TEJS5P+YwHswHSoNTmGnh37CcuG9EM6RdAMnuYgyfGKKbpf0ZmiQEcI2DZ4nQYpQ8Z07Sb/QY2je2aBC9imBMgoSO0Y6KZ62XcTawLJPEZwrF8srjN/XgilvMVZrmuFFhhdJey7oxc9s0MFolXWUldSQuYh/MrLEzldmFBeSs1uXC/cAs1nvUeb/za9S7PxnWcGw/3FFEvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 LV8PR11MB8698.namprd11.prod.outlook.com (2603:10b6:408:205::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 21:05:28 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 21:05:28 +0000
Date: Fri, 28 Jul 2023 14:05:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20230728210524.GL138014@mdroper-desk1.amr.corp.intel.com>
References: <20230719083801.182123-12-matthew.auld@intel.com>
 <20230719083801.182123-17-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230719083801.182123-17-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0064.namprd03.prod.outlook.com
 (2603:10b6:a03:331::9) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|LV8PR11MB8698:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f502590-4771-4b1a-2c49-08db8fae5e87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lCR6SMKB9Jg5EeUichCmTVWiNX9ZYJ8tV6U1uQZXsf1Du/JC6yPIhplQJljT3FLAmRYkZ1IsQz8sHvAFb+nk6XjMTBKJPu1E+j+F35UsRM4vhczSBYxOkt/a1Jl0jJQZ3CCyUfPv5i2iYnRxtd2wp275CD+2qu2FNAirb6ya9LX5GLNYrSG6M0zLanEimy7xOUoJxKcoe8CXU6d2eXDHEl+mASMUR/G1ohB9uaIMK6FwZ7wuQDM1hvxqzwz1SI4Ea61EwajTm1/lKuwQSptVuqO+8A5x3MsineEA4ncf2CWzyYdy0AIp+RcGb5BqO8PgQGnwEyX91NXO4BvUOL1zD7ZXNcbUODq9te/mVoshoOAt51u49BKWjkNDb+nD8sdGdoU8EEfZQ2QXNES+vSUoObWd0uFE8AM5ps3Qa3tppLm/RZQuFekpdownGsWsUCr8LBD/v+MGAplFanT4bMB9NSrgzi2o5JGgLWLRRzk/WwHaN6+MkXxPpFeqx/U4qu8DfssK8EfYpCmNKNAiM/xCHcbXBRvUjjjZHU4oBmdk1+42MsyR3+wIkDouC7XJW7g9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(396003)(136003)(376002)(39860400002)(451199021)(6506007)(1076003)(54906003)(26005)(478600001)(82960400001)(107886003)(186003)(6512007)(6486002)(6666004)(66476007)(66556008)(4326008)(6636002)(83380400001)(38100700002)(66946007)(5660300002)(33656002)(41300700001)(66899021)(2906002)(316002)(8936002)(8676002)(6862004)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oAQuWu9xMGNoEpMKoBtL27bxuq5+C6B7cYXbK9vBrRQsjt7EOcSRflhjDO2P?=
 =?us-ascii?Q?CPFEoaEOCLTsmTPoRv1iS0r+lZzHEQWt5aU+24LRU7MbWX6Cw23CB353fxyv?=
 =?us-ascii?Q?mG1wGxwhW+5JKRHHamjz1inlzowr9svw+RKDMFS57ALVI3dX1ZY6PfpxRg2Z?=
 =?us-ascii?Q?iQjFou5M581msOus81z27A4+GuydjITIOLQ0wZ4ePyM9YDVQLVAVXGmQENy+?=
 =?us-ascii?Q?/F8BNe3wh4chgg0MSgZX0tPeD7JP0CE1xC1mT3B2B5oSM1qs5jJ04srM9YBL?=
 =?us-ascii?Q?vTFwARfiQxZoH54pLsYUDjO4w0cX76Z5xkPBq7dCHPtylVAOmosxV68maIsp?=
 =?us-ascii?Q?xJN7feveP102zLN0Ej8PdvuePNYV1+b+acCD3zK5VfRnUGF5sUP6Q2qzQ5Zq?=
 =?us-ascii?Q?iOMP+xpWdOVaJ2hmR5u51CTNtQ+PC0UOg9TM9xKCzxt4FOy13flUsTNI91rK?=
 =?us-ascii?Q?xD7xP2QOlGrIXC9LE6F9XesqI/9dNuxV/rv33f3hQbAvc23rm0crsBM63O5e?=
 =?us-ascii?Q?cbd4iRcJ/1pxjdGX1D7Um5shNlLVoLxrEbcHK0Jm5Qd4OKnv8uHoWtn2hk0l?=
 =?us-ascii?Q?F7u28KdYzRu8eZi0+hMTiN47VUrXI9+vM6Df1SZ1Bj55HH4gQTuNBTXWl2P8?=
 =?us-ascii?Q?TCdp0aqh5yajuH6IL0kspFcMXGUj77i0k4rTBQCfmeU7BfyBlmLoQsB/7bJT?=
 =?us-ascii?Q?VmmjknNXF69FR1CIRLyjhSI2F1DJV1f8uWtc0IqhYdLramas2lV1YzFStfFS?=
 =?us-ascii?Q?6CalXwgZoPr+wYreNjJDQQA8y5xnBdp/873WF+fJ/P1NNdSB+pR4rpI0tG8q?=
 =?us-ascii?Q?XjygiPCT7fBfxuF5BOLlyr0K2WiSFrnBQgsBu5STGVyhF+mZ3BwEz+lQJ38t?=
 =?us-ascii?Q?ojfUnJffzwbM1852pAx3YwNTfXjvqvrkCjhugN/Q4q6tpOJis3ib46V/p+BR?=
 =?us-ascii?Q?Pe/maPosaBS6Bpfm90O7AUTG1iEP52rORTt78lNERsZSPQFzzpG0cj68jj/A?=
 =?us-ascii?Q?blmiiAEqlUsgbWCHdbcXmYwhBlTUFvbSQNd8YGhbJGiSZLMBAqQ8n7bDMumM?=
 =?us-ascii?Q?7AmQW/YT6gdKMe1mp45EXFvmUXecENmRShtj/v1G9fWAy31Me5YRo+dhghHI?=
 =?us-ascii?Q?eQc9BYIqpLP1qEORy/n5w5CR1cEddZEXAgr7F+S191Oelf5so2cVfXUwDu9d?=
 =?us-ascii?Q?MF2f5H7CGzGBL9pOyKj99ybL92Y49pi/0VSdUMEtqcKojbIZn49LXQcb8uBh?=
 =?us-ascii?Q?kwhChBbsTpTAz3eajEJjTiksTYWUcJBMgNFwNPaoQgNeaSvau9PAfVUfLXT/?=
 =?us-ascii?Q?1l88FZ9Lv+mPGPHpoWWhS60UCskMlsAcGodGTrNH9Z3SH7Nqg+x/JGG1Q2PZ?=
 =?us-ascii?Q?1BxpWGuBexCn1avGNrTHtvkWFrBDDwGonLkOd8P0Ego6FVOGOFbEEDTLi18y?=
 =?us-ascii?Q?2LZvfBPvDrk6lFYCdBWoaCIxF+lbn/QZ6OWAyRi0GfhKT/ciqVhq1OnOQufy?=
 =?us-ascii?Q?eqiFfQht05QxBKBJx5cJAmuPR6Vp/JMOuQc/0TM5I9Iorm3cm4jBn5XYpdpQ?=
 =?us-ascii?Q?R0eOt6q/HCFQTmiR+kyoKueZHxWTs0MaxaId9XXcKaLYy5l0H8Ra+ClZeqVu?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f502590-4771-4b1a-2c49-08db8fae5e87
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 21:05:27.8118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mEq+ILPh/4oXrRX9GxXiNMXIyRh7yLogfso7o+u7gizu3KzdjuaqdsbHVXGc9+o7fZ7meFg00jxRTABGrYHxBvQW9esKTUd31CpYpWwiWfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8698
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v15 05/10] drm/xe/mmio: grab mem_access in
 xe_mmio_ioctl
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 19, 2023 at 09:38:07AM +0100, Matthew Auld wrote:
> Any kind of device memory access should first ensure the device is not
> suspended, mmio included.

I know things already went off track quite a while back, but it sounds
like this is taking us even farther down the wrong path.
xe_device_mem_access_get was intended as a place to hook in things like
the ugly workarounds that we used to have on early PVC steppings where
we need special care when the CPU might access VRAM.  Although we need
to be out of D3 to access VRAM, we shouldn't be using
xe_device_mem_access for general D3 management that's unrelated to VRAM
access; we should be using actual runtime PM for that (and then
xe_device_mem_access_get should either have an assertion to ensure that
runtime PM was already grabbed at a higher level, or it should grab its
own wakeref).

As far as I know, we don't actually have anything that needs
xe_device_mem_access right now (since we're not supporting old
pre-production workarounds for PVC).  In theory we should be able to
just rip it out of the driver completely with no impact as long we're
handling device-level runtime PM and GT-level forcewake properly
everywhere.

If we're too far down this path to fix things now and want to just
repurpose xe_device_mem_access as an alternate reference counting layer
over top of runtime PM, then we should probably rename it to something
that more accurately reflects what we're using it for now.  And then we
can re-add an actual memory access layer independently if/when it
becomes necessary to deal with future hardware ugliness.


Matt

> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 448b874c7a3c..8d0f07261bfd 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -483,6 +483,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>  	 */
>  	reg = XE_REG(args->addr);
>  
> +	xe_device_mem_access_get(xe);
>  	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  
>  	if (args->flags & DRM_XE_MMIO_WRITE) {
> @@ -526,6 +527,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>  
>  exit:
>  	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	xe_device_mem_access_put(xe);
>  
>  	return ret;
>  }
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
