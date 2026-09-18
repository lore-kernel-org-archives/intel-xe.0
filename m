Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C324C982D8
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 12:54:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60E010E0E4;
	Fri, 18 Sep 2026 12:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M37Mz7/N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C1610E0E4
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 12:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789736068; x=1821272068;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JtwGH6cOnQ9ELl7TQxVxR//7Q3hPTx1WEIRh106o3oA=;
 b=M37Mz7/NEwbfZk9yfJ9wbbVhkHHWHWRq7PVz78HoiLbwfWkqMrjIXJgD
 Hy/jnwg7gFQLpELQvNLaIaFGVAP2B8npBUxiOhJ71TrhyWqsiibE/sbpf
 /uPH1qvSByQTwArpT03Gil9wt3dU5YsTdVl5xv5dvEP+ZZPSu5xwQnaqk
 XZFEtL2YG33o7tVLT4MJKEFWZ4ilO0wGGNE1BP+h9DFCYcboCBlUNUzJ7
 YJXdjdHGDX1dOaVTBxcDnImA0r6w+EpG2FMHakoxakT0baep9jJ9UeDqP
 ksaXOVZV9RmkycYM3Nnj0zed4He/q7MzYS32fFKowb1itMD/JNb0yvOKN g==;
X-CSE-ConnectionGUID: GBKTaH6eQwWacBNEuMYm8Q==
X-CSE-MsgGUID: PgKHoQowQ/yHleGZeBXPUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="100835582"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; d="scan'208";a="100835582"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 05:54:27 -0700
X-CSE-ConnectionGUID: D3kRXZNfQL+7RXVfoPepBA==
X-CSE-MsgGUID: OouRBUF4RtWsIvKa7+1M+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; d="scan'208";a="270702511"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 05:54:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 05:54:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 05:54:26 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.38) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 05:54:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iva57/erT74SUtuP2m0VlcpIkWgmO5ApdWFrDdDzEqqUHmgKaC9qr3VOGAlZfQzLZsJSCqiYYd2ZszolK37CSZb66EtPvGehryppgaI9QQs+/4txA6ru/gRsaEBwVT7y31/eRLFH6LN/pEtbkWLULLnXw/cMGupLDrTLe8msUQXTNCAOx7LF+vtsW8Rodex6PdVapHUvrbA3bOt8KY92orfTzdMMdw98S2GhbGXB/eYaOGe0dDo42md1byhlo7z1lYor+M8FX6DAyTFVYWnvnT/OOmQ/9TNzjw1UGOJYJMuc0RMxmzi8eOTbLd3WU3iREybYOOJsE/wi0J75JG0MbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1+iFTf3FtH/cr91YB+rr7v+GBKCHfOanhCJ6RPecEw=;
 b=QhlZ8tT2PpiQDlDLCITjIO3Sk9VElzVskYCifU6QJ1AANJYuhw/G8gP8+Y2y1DEUTuRCvBYmVtHO7WH9hPm18giL5YkxLbg8vmOprBJ8tB38uKz/T9/eA/VX0raJrlK7N8WoAMkhVjy4HI4xbtPB4Wf43fj81cZnwv2wEVC9ScAyeKonLNiBBZ5Jg9Zl7GXX5qn3O+R2fWbpgAe1AutvVzUI0bIjQk373ccbvbwlJFt4OJoCQiaq7PoQE6R0yNGOBj2ZGPu2m3zsWLzlnaPsLbrlb1HeKzowyjkR8uJOvQkj0VIx4Dt6LSrvbyPrgtsRZij4cGNuOk0RQbxDNkKXug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SN7PR11MB7420.namprd11.prod.outlook.com (2603:10b6:806:328::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 12:54:06 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 12:54:06 +0000
Date: Fri, 18 Sep 2026 08:53:52 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Varun Gupta <varun.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <zhanjun.dong@intel.com>,
 <daniele.ceraolospurio@intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Demote uncorrectable local error log to info
Message-ID: <aq00YEXsjHSSU3Gh@intel.com>
References: <20260917135121.3590045-2-varun.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260917135121.3590045-2-varun.gupta@intel.com>
X-ClientProxiedBy: SI3PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::6) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SN7PR11MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: 04ab3d68-00eb-4ae7-dae2-08df1583ec36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|56012099006|10067099003|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 4YI1PByGaoNAsqnk8KeL8ZVHObT4cQt02al9RESbVhEq5Cp4UHji97nhQp3vDeJ+kYyXkPJHgrVcOnBtz1ozQ7OKjwUd/ta15NEon4oYcQzDw0Un64+c3Znd1FjwQ3a1R71M1aktUCoJ1Yuhnxph5dvjLtB9p3HpC8sMbmMQFbnvNtlO2Rt1FpgV6rFQHBtBsYCoPmgoeQFvgSKqpbafwsKiw7P4MpaAdIRqPxCOGGuiQ5z4noB3llcoNzL3HDowBKUul6aX1j6n7Fl6/aSgC8BTUHrbUDfieffvMuWigkCWXRf3um8509LMrffoCJNhEifQGpV/d7y/315dkebsbN21yfCD4ErEhBoZSvK+OpVCRrmhZqv/2ymZAQitOAVq74+LpnL/StgyEYXD7jgWjYNZs6/VPjxyjoIF8prL8oe+u9+rmnrDdeUSbqGFklBgSErjzjAAW/M7CV1PuEtqZdxM935PaiSLQoVgdNATK3l0gLfGDgxrAd8ZOssw7VFgOSSEEThkJgOdqd7KobtnVh+24aO8lI4ogBTCACLkevdtJlgwe8G5HVfSlI1QPMLD3sMSQJhFwdeioFzdSC9JUX9JH8xxr3ddvrE3i4H+wL4VY3cpnUJKM3L43JhGTCsn4Brov1u0ZiEEup2Wf3DTzXuwpj0I3S4IdmU1KJkxxV8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(10067099003)(6133799003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sw+vCEptbnlC/xgRSHmytSCYWg72XSkcot1rsnzreYAlCs6gqWOGXuBMa6OY?=
 =?us-ascii?Q?u2BHwy1O7syoDB2j/hW9xAGLOz6BqgiibZ8fu6agXBFT6miwTBvLc3EWMcHp?=
 =?us-ascii?Q?q0rn+/UH00SYaSoN8BqWL6L/4W0PZkjYZb54nzYTFBhYgmL19+vS8cHCdxsY?=
 =?us-ascii?Q?KQjwGv7Ht+Ang/PZbElMShRek95G1sO2P4NxeKZzHR4PVBf04jNuy1aqk3/0?=
 =?us-ascii?Q?6Z9+k7et2amiT2hJZ1gD75Zyg/ppB2bwAnYl3KIYYbjiFwRsP9Ole8EjjvQ0?=
 =?us-ascii?Q?TGNBPimdqs3SBaWS5Mw5E4kpgJ1oc8AV6xe04BZ+B9w+0V8wSq+2PyJYZ4OW?=
 =?us-ascii?Q?qBEYeYAu1gFJ4fJTH82F1X3gBuoAKrMBi7pmShRq8bQpupIvWTvR80SGSHEr?=
 =?us-ascii?Q?V7BzfBAs9Z1OjkFEpgToyetKl3Z9p5YQv+Axg/cuMddvgzIOjcq+PS7XuuFW?=
 =?us-ascii?Q?c6S0Aa6j5mW+OlxrG2dymHfFl34KwTVfD8iF3/cYMDTKj0jK84jit9p5yw/E?=
 =?us-ascii?Q?k2oaDlvgbT7nDOmOIDyuDQu04xvv7WS0AnQiYMCSRH7LLhLzh6rGMJurbXE7?=
 =?us-ascii?Q?Z/EcU+rwpOtLeYBXjHqLuoWv0v99HqhZWMtn4kBl6mQlA0VvAInqyMa8dCRX?=
 =?us-ascii?Q?+o+/ooCbn4pHJNewDGmdDbCYV8BEOugQyHbNhm1v+3VLU9eFXil+KJWvAWoI?=
 =?us-ascii?Q?qiBCuuEyiZuYsXcRdMAQxox9wTZ5I/WQ6LJ6nbHJOj9rIPjreoyVMk94tTTO?=
 =?us-ascii?Q?npvFJ3/hFy1cofzqV5CCf34Q9+jZHC+gDD7j0nTGF0Ai/qCK8uA02SOOtfuV?=
 =?us-ascii?Q?roTm3AanT7SUUny+GwWAw/gXvqB/5jdAIu6kc8BAMdghiQYBUez5DkXAIwns?=
 =?us-ascii?Q?iPC3+0byv6NvkQOjOwa9Br3EGwt0Px0ttcL3lR0dm+gZl3qlI0e0fwByg/Ve?=
 =?us-ascii?Q?t4YwH8k9Y31OKK6A6L7MppEgfEpUGQAJchwuuQ1IMMGQ7tozlIimDyGMil2S?=
 =?us-ascii?Q?iQlpkhSU0lgL46aYsUxiYnCF4JH7+JFRVXaDM0HRLJMeaE7AB4H+n5DaU+tn?=
 =?us-ascii?Q?lNhntTKYxqiW6+xvJO0eGCcsDNigEffsQonIBoHImgdIh7QpekI2QZ7DRfPC?=
 =?us-ascii?Q?0RmzOik+ewaFFMkuKocd0PtBLdoKs56qI8Wd2xoYFlDiHnroTpFL5xZ5YrFJ?=
 =?us-ascii?Q?ynI8fBSabZ9IIyFETC/slf3wVZByur2b13DRJLYbrHm0TFoIHAFvztcEtQ50?=
 =?us-ascii?Q?ClOyi1rJPUV7z1g62YEmTJrNKqhNCArp2hgD4G0C2/yvaKYpZY8szN5zZtms?=
 =?us-ascii?Q?VUfIMVnlSHwajJ+t2+4uY6F2EX+aIuZOz2QoO8c4tGUUb1LTKrqAYr7x5pPc?=
 =?us-ascii?Q?2qC0soLIGfifHTXR37MXar2jf6ORWNCDeWJ4ORM7gefPxmhjLeYbJo4caw4i?=
 =?us-ascii?Q?xhVJMYPbshxPk215Jpy6fS4qLJSNvegjc/5KncvjG1NQJlFzFUNg8UEAJLZ3?=
 =?us-ascii?Q?NnTwunyyo5u4wMU6Yifb5QYJLu3maldX/J5De3NieY3SVYQ7Oofn6Rh3pa+J?=
 =?us-ascii?Q?mw6gAYynCY+Mzf/pswy4iq2oLQQ1+xDh8aMGlT/AGzesO4rkizFBeGEAfwyE?=
 =?us-ascii?Q?bvlEVBbozz/crUAklo8L7ns+VTop4nglxKK4X9CEWvkyBfVm4+lVRavGw1Jz?=
 =?us-ascii?Q?fyO2MuCYE0rIZarAow5kFXA030ASZRta27jyRO3/tRt5ch/EPsZu9z0A7+EU?=
 =?us-ascii?Q?HqOpzITIyw=3D=3D?=
X-Exchange-RoutingPolicyChecked: UgYwYjwze/33vfQW/kqL7QpgwCAngI+tK3i9PUPfdkqQbt7PNDpsFEq3s+g2PiDEDXRiKHtTqGD7KmWA++yFVWjAFouHNScm0kyiO19AQegRtKqdXuH7QpYC6FO1k/cHCLMc8FTrrKPuoehAJB27FBwTN0GRM3A9GiK+dOrnVn0q1YKnfWKy2fJV8n4+Z8Htg53NF2e6Nc8M+3coMUi40zJk3tUFKrb1pHs1KuWjK6vHLLjh2K5RveJkl/2/XPPJM5jpf2zz4daLkQdMIOLzr4nREWIWSlMrCJg5RKWYVbllKa6xpM/EpYUmDC/MRcrrrdY9cspyD2s5R8ReWqkYrQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ab3d68-00eb-4ae7-dae2-08df1583ec36
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 12:54:06.3315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZpiTtEtve+4ZxZ+J7Y0HNOrQVaQCXSDPlj5gPT+nZ++n1kwAeCetOmdd4d2S+0sqj6YaY6L0Cov+KsAObqdLzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7420
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

On Thu, Sep 17, 2026 at 07:21:22PM +0530, Varun Gupta wrote:
> The UNCORRECTABLE_LOCAL_ERROR notification sent by the GuC indicates a
> local, queue-level context termination rather than a global device or
> driver failure. This can be triggered as part of expected recovery flows,
> including intentional fault-injection tests.
> 
> Printing this at ERROR level is too noisy and causes false-positive
> dmesg-warn failures in CI. Switch the log level to INFO, matching the
> adjacent CAT error handler.

wait what?!

If it is fault injection case it is an actual error.
Add instrumentation in the test tool or CI to deal with it.

> 
> Fixes: 4e57574fa3a3 ("drm/xe/guc: Handle GuC local uncorrectable error notifications")
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index f3ba8abfc228..23ccec0adc8c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3495,7 +3495,7 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	if (unlikely(!q))
>  		return -EPROTO;
>  
> -	xe_gt_err(gt,
> +	xe_gt_info(gt,
> 		   "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
> 		   guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
>  
> -- 
> 2.43.0
> 
