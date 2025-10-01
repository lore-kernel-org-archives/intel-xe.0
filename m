Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C67CCA470
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 15:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456B210E0F7;
	Wed,  1 Oct 2025 15:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BNkpKjOF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0922110E0F7
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 15:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759333660; x=1790869660;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SnDGAy9N09DPQpnjODrCh+ssxT6ZlDgkxrtom1ZBbSQ=;
 b=BNkpKjOFMIatgY5fJ4tyiZ1z5Oge8FCVfwCm4dTzmx6g6mW5LukOLqSY
 worE6aGNuThBhZZLJllcvzwZsJMLciowWuffa56UwiWznsf7kPzc9QSsN
 01eP/JzHdFiOm/CmLnbqJGa37WwGV+fga+zJLLrStURG9ydi7PwusttQL
 +W9GrVIohc27gTnt4ZgAcuMMQR0CYXAXzOL1OirJjPLjuEoF4UKtq58jh
 UuzlGSQOQM2IyHP3A1h41hDA/7ni+NILt/UnGtkV4eET4gYsrKzdWcVfs
 5CTrkXE32JxDx8GxbA4d1CXwFneMI/Te0ocErVZ7Ml1A7UnHQze/ILgJ+ g==;
X-CSE-ConnectionGUID: ONF05imPSCGKtuAa6s2VaQ==
X-CSE-MsgGUID: 4K1hUmAjRNeHXuw1cqhg+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="84231579"
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="84231579"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 08:47:39 -0700
X-CSE-ConnectionGUID: bVCb53LJRLyJjeieiEpqhw==
X-CSE-MsgGUID: 1ReJ5Rj/S2mNcwFDtpGiUw==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 08:47:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 08:47:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 08:47:37 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 08:47:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPzbOJhr+zeyFcfYzivwcWrS1cqFhX3Jfa8XYANvTBGQ1KhyPsAoq9Bsl2rzrqQUWX2hDuZEq3xOv1JD0ZZtx4eK4r5ywAyNn8ktDgwjaewZImNTQNTAclCyULcNlgO+E+nfedA2XFKZaFCmXcR1K0PYGvTeOcecDqpwiZ0gckNtLOfV+J8qb8S1qjc+VrrO1xWhrEoWnYkkPEiN2uFGEserRc0vi+mDSSE40ip66Yf2eZzSwJJ7rMktyzAaN8jt77kdLqnUyDAhB8zwEo1jpxLLlrTzmkWR77gdBCx2PU9fRoQS5ReZ80IK6VgNrsk9K6TEsVPp/L5skg43a+nyqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yL07geK0NWCvr3RcdKR5Gu9WvAmQ+ANNMT+1v+d4d5Y=;
 b=LD5OMAi+HhCF4U8Oj9Rpbw3x8vBync8uKXUraRNskxin/WxpXcWRx0y5DBs6oc3qLAPNuGkjOKfRAVGpcFeANneWxWBiRn+cLBXZVUY9EwF1jKJ+s+jP683Wn55kqiSbdfHO9FREz5qmNkWtl6xTLkJLPx2NQULSzKlZac/c40dyjx8F4syuAflj7X9LbbF3BHjrNKRM/TG8sFSV6bzPTvvTXsw3pdc70V+i0FnzUkUHG8UjRvuAoKW8f/uzMqqQ+V5TLZnx6sz96ZvP/LnMkwPBhoynO/FLw35sb+9WIMk5JBG37wNt6wsPiIVL/iUPvyxuSwrzwnXZUHhCf+UvkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH0PR11MB5252.namprd11.prod.outlook.com (2603:10b6:610:e3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 15:47:30 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 15:47:29 +0000
Date: Wed, 1 Oct 2025 11:47:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH v12 02/13] drm/xe/xelp: Quiesce memory traffic before
 invalidating AuxCCS
Message-ID: <aN1NDy4Mfcs3A-eL@intel.com>
References: <20250923100812.88257-1-tvrtko.ursulin@igalia.com>
 <20250923100812.88257-3-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250923100812.88257-3-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR03CA0095.namprd03.prod.outlook.com
 (2603:10b6:a03:333::10) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH0PR11MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: b905186e-3296-4dcc-704c-08de0101d3fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NgVsXfmQMXBPjCNNH79v2/RYxwfSTEPASFpF8pSDI7Kn/SnwEY+Vtv4jBCaj?=
 =?us-ascii?Q?hWnkhDU6Ryh1CALsNXAMBOzKIpQB1Kl4///S+jgjNEMWUs5qy7k0B+RmxjpI?=
 =?us-ascii?Q?XVP//rkUIoK84/uvKdLz+VDMlEV9/f5KqRvDtQklS/Gynra4cUARjrigHqI6?=
 =?us-ascii?Q?jCjqiuVIOLAfiQqKhaSlKxi01H8S9wgsdIg2H5SlvO7UsLjBrmRgJKI5ytSU?=
 =?us-ascii?Q?Mocq6Vi/9VOT+pfwGxQdBTZRRHvZbEzD3aWpyhrjESplZKpLhqLTPre/I3k8?=
 =?us-ascii?Q?EE0F53jg2AAX3WsdOGTeURtwb01P8UJ0FR0j2lnNrhSf7/jDkIjZNUB6xOyq?=
 =?us-ascii?Q?G5Xd8SHvolstm/cfc96xRB5X4c3Ztnd1UNB1zxplSTuN5pSJukRZETy3rRrp?=
 =?us-ascii?Q?/VMq1/FtDW50jOQZrPyHDg22eVljB2hGfSI7D38+jw9yBkCMLm7uKrihUl3Y?=
 =?us-ascii?Q?M7NuVdbLY43Rr+f58WWZmIaj2G0IfuCFd0VeY2xMpG8PmF9Dr+F1Vt8aYdFg?=
 =?us-ascii?Q?ba4fS1K/kl/OSKg+n43/8Z+eE7DqXi9c2/1/iOGsljn6Ud+PoBCPIj7lgRaT?=
 =?us-ascii?Q?rWpK4ZbGpLq3wITAxsZ1DgIHBHNiyFXbK/Mrpl94VYEfEWNcLqKEHYucJ6VE?=
 =?us-ascii?Q?mmr6PKTMg+ox5r8i0LMRrrOpLsQvsOPcFoPT5w4Uc9FochplldRDVgjhqRMT?=
 =?us-ascii?Q?WRD/eHyiDxtz3gix3ontcrQc88DFMiAP31DaJmjLWNLteMZ1sTYQEYp5kg5i?=
 =?us-ascii?Q?5znOz5ZCeapAiOk42KJl8bOjc/0UZ8kMqoE/VVc9wMbx6UZmtdZw4BdF67We?=
 =?us-ascii?Q?03cveSC6G/gdiQfgNbcHUUh7qVS5DpN/h2fompZZ/vPfwUASWKq+EcAGM8ft?=
 =?us-ascii?Q?D8RsuVQff6uCJBzWNeppgUBA9GvMI/OOZfi6yd8AobjOkH1nXXbHXhZ8NsJ3?=
 =?us-ascii?Q?S4f10gx6l+oSiLjeD/+GTYfIUfqMG2jsUqHrbNafX2dBfjiT7wzqelZJfZ/j?=
 =?us-ascii?Q?OK14NNqo39expvsaZ4/IJKVswFp1sWiGOpd3vBPHdBi83p+Q4/z+ALbPhxka?=
 =?us-ascii?Q?UrCpeVaU9tzKLz3dktsRAmgwdRmw8KYdDIVBttSSKVQsDwK16FO1ZAgi005T?=
 =?us-ascii?Q?8Yc2AQLaQQnYq9wiZ5ZqN/2dLS0O4n/YV+aWxqIZITBBX6mnPIsepPfngNln?=
 =?us-ascii?Q?IszwllGOXsyadMhfv3BJHrQ+bA/44Y1RAvjbjTvrCRhpQwBDGA1I73WgwKR5?=
 =?us-ascii?Q?r2CwbmAer9TJKN+mdXNul6W5h7ePx3sVVjWXbvt7mRAh2W0R4L2ndopIAaLA?=
 =?us-ascii?Q?0Iei0WvI6XxJ+65yX+ax6QLETLtp6THBJYuMdPQwgQGhtQHxeYrrtXVCvco6?=
 =?us-ascii?Q?yLas7eW89wiiyR7ItwB5YyK1ZdWiSPq+qATXHITz8eITrX24x/QTVSu/8MEY?=
 =?us-ascii?Q?guZgk6VaoR7U7GIf0eVgAbsWbY7znOeK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nMZ4zJQ4D5WcwNN/Qzwihh66UUvYmPPrvs5Cy4yblaAdyWuIe7kAOkcs6HsH?=
 =?us-ascii?Q?hak0ySQDkMlL+ccKX0fzKHrMfGVBhSI/064uiSwEYnpOupyzo0ppVSUOVI0/?=
 =?us-ascii?Q?KDSKxGHE2YWMDJYgtZoES9Z+cyqbKDnby0w9tTC9QY/JNEmLCGNNHmDhoX5o?=
 =?us-ascii?Q?k67M3808juwtAsakzUbvfbgMcZyQijUym8vbdf69M6uKfRYiFZwhdmsT8N7X?=
 =?us-ascii?Q?DO8xf7NBxOKGZvYnRAufLLAWubEO13fRoY6QhcTpfRUBbmsqhns9O3o0pBuC?=
 =?us-ascii?Q?VkchJSaKrHwm7AomsHA2JnPpHcVxbq8/104sBpaaAM8cau8cLqupwA5v6twJ?=
 =?us-ascii?Q?IujfCQTdxKzqYwZjJMY1DBcXByfg5e3TAPzx24LmmwkSNTv+wbXFcElGUFUr?=
 =?us-ascii?Q?uWTsTOK3xuJliZn3jIL5wmTCWppvYZZD5u5QFDE1eLePBm7lKy5zdtkUydWX?=
 =?us-ascii?Q?uRSKOlhdRd0YCkjTdnUh+A+Q3g01Et3y9thKwGZGPrlJQJb8dqKpmNbFC3qU?=
 =?us-ascii?Q?Qshs+9a1EpG4HXOPkLua652wIDxq2FGchDm+cB5f1p4Kb4qVABcCspOAxEfx?=
 =?us-ascii?Q?y8PQHCj3uTdn/P/64kc6dzAoV0ESPDPuSdgCxwrefBZuXaA2M3jmSaI+84Fz?=
 =?us-ascii?Q?qASQiGW8r6bdKGNdoViaB7+tXMepoTS1GCc4JG2tadJnMkfRCl4v1frFLLX9?=
 =?us-ascii?Q?ohmVpPCMYlYNluinwapCO7NvqjIe9R9ce1j1O1v7r3nfeI9klMVODlQ6OlFt?=
 =?us-ascii?Q?ZxyxqtBCsH17qUSWzBc41EWSQRY+LlPS81R6X5Xqz1lmuMDkvQkvpPKUWZPu?=
 =?us-ascii?Q?8LjEzeFyyaOyoHBBinYHOUCQqNJ6X76SDbrD10i24GSBVEj122U6QrOpIFyS?=
 =?us-ascii?Q?vaOkd1nTqZBZd57WXbnv3lfyzxZYTPr5fGeHqS+gbSHsWthiffOmv8ph0QPz?=
 =?us-ascii?Q?bRlK+XOkFLspEkBcQkVuK4c0wfdfBtW5AUch6rDARZFHwdFzpyojxqsYo7Z8?=
 =?us-ascii?Q?ivwVwKrgpl2GxMBuHyTUAXbQcmcXbc/XmZWU1UJqWeStvqo5Wqzm8CYWBS9D?=
 =?us-ascii?Q?fP31ceXHSr22q07+TtsDlhb11Zh9vk93UCQ0F8Iq9oBcBvUkD7kcbrAbvCgY?=
 =?us-ascii?Q?eWaVhOuzsfQN6zyCtHjXEsgcQMBJA4lIUEn+g8BiJLpGt7cXgotzrmoMiIPM?=
 =?us-ascii?Q?+CpaDzoRmosF4A5TiMEq74OUBy/6/oIoGCNdBl3nELOKD9zA+u/kdETPoI+l?=
 =?us-ascii?Q?7LKzz3LlkyUxdvt5qwBlNxiEOvW5Dte3g8S9tDAmZ1GhGV6wvUzbUGn8VjUf?=
 =?us-ascii?Q?tmFuv7SdbHTvM/aq5vVqGe4gXHOquOGmOAQXKAwT0vlNFNGGjqmD7mmbeWUG?=
 =?us-ascii?Q?fA7NRlkGkapzDMYJXkGRlk0aum59sp3X2v8EsX3cDeNR5fiYxKSAKnpWLaMa?=
 =?us-ascii?Q?zy685D09ciayAPT2QPhUAsWBTHmydaLzZWZ4NAb1HUlkQIesbv+upF2PN+a7?=
 =?us-ascii?Q?P/kgsYQpvEfw1fXoZwMMQnQc8ZZPHs4V9bgVFLYUTqd5KUx7nc95SJA2SaLh?=
 =?us-ascii?Q?Nha/drqPgfOsvZyuoTVnVC/1WSKnO90e1Xii5j+X?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b905186e-3296-4dcc-704c-08de0101d3fb
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 15:47:29.8583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DwlJW3CE9hAn0tjlWfBrV/0Cg3bONN3rkIh3MCPoc/ffcx030wWsAL/89xNdRWx8SxXhQA55gTFk7JHwHT2jNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5252
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

On Tue, Sep 23, 2025 at 11:07:55AM +0100, Tvrtko Ursulin wrote:
> According to i915 commit
> ad8ebf12217e ("drm/i915/gt: Ensure memory quiesced before invalidation")
> quiescing of the memory traffic is required before invalidating the AuxCCS
> tables.
> 
> Add an extra pipe control flush to achieve that.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c       | 10 +++++++++-
>  drivers/gpu/drm/xe/xe_ring_ops_types.h |  2 +-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 25259b2784bc..af0141c6f809 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -358,10 +358,18 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  	struct xe_gt *gt = job->q->gt;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
> +	const bool aux_ccs = has_aux_ccs(xe);
>  	u32 mask_flags = 0;
>  
>  	i = emit_copy_timestamp(lrc, dw, i);
>  
> +	/*
> +	 * On AuxCCS platforms the invalidation of the Aux table requires
> +	 * quiescing the memory traffic beforehand.
> +	 */
> +	if (aux_ccs)
> +		i = emit_render_cache_flush(job, dw, i);
> +
>  	dw[i++] = preparser_disable(true);
>  	if (lacks_render)
>  		mask_flags = PIPE_CONTROL_3D_ARCH_FLAGS;
> @@ -372,7 +380,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  	i = emit_pipe_invalidate(mask_flags, job->ring_ops_flush_tlb, dw, i);
>  
>  	/* hsdes: 1809175790 */
> -	if (has_aux_ccs(xe))
> +	if (aux_ccs)
>  		i = emit_aux_table_inv(gt, CCS_AUX_INV, dw, i);
>  
>  	dw[i++] = preparser_disable(false);
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> index d7e3e150a9a5..477dc7defd72 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
> +++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> @@ -8,7 +8,7 @@
>  
>  struct xe_sched_job;
>  
> -#define MAX_JOB_SIZE_DW 58
> +#define MAX_JOB_SIZE_DW 70
>  #define MAX_JOB_SIZE_BYTES (MAX_JOB_SIZE_DW * 4)
>  
>  /**
> -- 
> 2.48.0
> 
