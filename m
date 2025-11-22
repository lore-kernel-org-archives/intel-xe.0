Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B45BCFD2F9
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 22:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4122410E011;
	Sat, 22 Nov 2025 22:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hdE3ioL3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D59F10E011
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 22:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763848960; x=1795384960;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6hYrc0wGkQOWJsyWTQbyRF7wXGKSzDC/BB8CpnBGa0M=;
 b=hdE3ioL33MC2XjbHn7bWXKldvwZpwv5hVn72eKfU03Kuu13Ycltcoljs
 I8bBh9FjdiXHbJgV/8onbX28gjeanLWeAZt4jUW9eqNpd8JZkLRNxsd9W
 laaCXYGsHVz0GG+AjQbSsMcJ5lu/QJ0GpkCmuBJPCQcIv42AZM+HAerIm
 c4pUkvrLIElnFW0RzaEbYEenK8xOGaKyEOJTh/AqitUgP9ZNXJBVUO0qv
 WYw4MDnV1uFqfJIheT64zcy2rOZJAhG9SxHAFEDum9LubslVOnibW4Kro
 WfMtreV3dDvqy3rpRO95hICnzYwCHAF1xzUw9WD2kjqRDosRfIzYBdUEy Q==;
X-CSE-ConnectionGUID: AS//5ZlmSgqYgNrEp6yNQw==
X-CSE-MsgGUID: j49jIxUcRdOfSgtBEsK3iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="83293931"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="83293931"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 14:02:40 -0800
X-CSE-ConnectionGUID: mkVjBQjWTciThGU5jRy3Mw==
X-CSE-MsgGUID: roHMgm6HSmGoY5dEMQt8QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="191169357"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 14:02:40 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 14:02:38 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 14:02:38 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 14:02:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itXWsT6WcBCZXgXouOaxY8Zaf0lGrDnA+ktaM3dbUSdtPiVKDsA/LBVgxGAlCBroxa7js5G2vNBC0H19ltPqwjx1WX/esOeDs26GgZGlgXJDmf514ZDZXy2qx0pQxfRzq5chIWAC4t0BRMvLUkn0mc2nauwSB3Bn/7ICiNjrmRiiWni+oVwlVN5a5vIrg5dqaMP1qPzS+5nQuYWGjFq0OxDtCDL/1thaws6UsgRBq3+DUMkooaMxIdqjCi2AbFmy7EJacI/CA8LY15QCN3FR3t9L37rGOwpm+2SYtVLGztwBrSu507A4NM+sSYj1uGeCCIL9vROlLsHioIIaN42Pgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOz6U6do/+eGkf25clOtrMOW8hrbmATB55iS/v39yS4=;
 b=WwFyV2i1dIq3igFO9r7EeDHVCwdkDDpDIY0xSIVDWVK0K7b9EjXKV1mWTUDo5uTf+540nowuQuneyUDRhnpW/Ft/Dzjaip5kYU4sENMW2bdsn8D3RweWALCoOQs8aztemGJsYlvLA2EcMvebo41WFy2fUuqkSsJL75lPrtILDmDpiEgT0l3MsMo2MKYyGrfMi3OD/SmujzT3kjOAty1BbgcrEJjdjz8P6S4KIFiMUMrV4EaBXknVmbKwYKQ6Xd97ezg/fD53RqKc38YmNqPLyl0QoixFNfzOf/YU0ndbQerPYzuSqA+G5X350GxgbaYiFdtGvcTMBXTj3n33wuOLSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB8889.namprd11.prod.outlook.com (2603:10b6:208:565::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Sat, 22 Nov
 2025 22:02:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 22:02:29 +0000
Date: Sat, 22 Nov 2025 14:02:26 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 5/5] drm/xe/vm: Skip ufence association for CPU
 address mirror VMA during MAP
Message-ID: <aSIy8timSg3WkRJm@lstrano-desk.jf.intel.com>
References: <20251103060957.957760-1-himal.prasad.ghimiray@intel.com>
 <20251103060957.957760-6-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251103060957.957760-6-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0193.namprd04.prod.outlook.com
 (2603:10b6:303:86::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: 89e9bd44-3815-42a6-41dd-08de2a12d433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?LUkcWqwy0IPjYvogEijP3A/okackf+kRmLMEXzQw4OpPPTzxMEUCIPzq9V?=
 =?iso-8859-1?Q?ji3hr84KWl3yBo67qf0xadkOL+GUAucaiLGpJcsvyAiHMWefPS0sW9xl16?=
 =?iso-8859-1?Q?u3w/SuAhSagb3D0HDQBGkTUOTFHB1PLdt1AMl7sDVe2e6fEKVJDUj6cg0B?=
 =?iso-8859-1?Q?dlxKqHEYu/5Tc6ZRe5fp+taKmPRRsWxmssv3KnYv2ebbl6HkOmsTeT34eE?=
 =?iso-8859-1?Q?u9BDEAPWbUrYwpCstMGQTV4Ja87WbBPnWb6j/0JST6rePlq0z4FMBDiogR?=
 =?iso-8859-1?Q?GOfgthwLgHw7H5BeGLKsf8OjOFRQg6KH2uxT360wF7Iiy5pOtMHDVW8XpL?=
 =?iso-8859-1?Q?TvxSzdTaJPlacPb+CYAM0vTA3Wt//4M8tz2kPFl920E8u+UKWsW39hjZ7X?=
 =?iso-8859-1?Q?Fm+XtiYiUD2vSGqFrnlOTiAcUpCLQhCRruA64P6y7r8wpmI5kzC1PtevLH?=
 =?iso-8859-1?Q?HhqQ96CO66St4JjtmUqULk0U26CEDgCK4e9ytWVuRVcEQ6pC2VGXyQqvby?=
 =?iso-8859-1?Q?nmLpO5hVXbvk2tD/eYkeEHUptCEeoasi2Mz6IyBNhTEeYl9pGg7H2t2CMy?=
 =?iso-8859-1?Q?56A32zxdzlRUe/1cOY0EhRaFVj1W5fGErvyLYlWPUMkm46PNZapdbY4qCE?=
 =?iso-8859-1?Q?jUmMT4bo0R7oqc4B5aQpnog0/VEY83otqleEw70udbpiWgXwQG9GbYTHqT?=
 =?iso-8859-1?Q?L6XwZlU+lPa2FTVbacmyzI1KDzf3yyLQ7iP1yYfIrTsdZzTbnNv8yRZoVl?=
 =?iso-8859-1?Q?FdSK43WiSwxq7C3iI8Akz9fqUKcRmOWskQi3C57LcVmRnX7me7ELGX/py9?=
 =?iso-8859-1?Q?hemWeW5nbCxq+h8UI7hDseFoUjipgG2qv35mtqesfdz8DSzKideC2vQ2Hm?=
 =?iso-8859-1?Q?86Bn2Tmct6G1cfWd1mylFX8ExP4OAnCbbCkvCDunUI8cdApVg3okKDZtEP?=
 =?iso-8859-1?Q?uWzSNQzhH2glUW9OWmxg88YRcgCKcNTriYsYn1L41Dh9I9jSXSBXEQnV0K?=
 =?iso-8859-1?Q?aSVvxWBVEg6QG71gVXvYoCxnpgRy9fAIqSvhLnvVMzsvt8gTKSqn66Ol8u?=
 =?iso-8859-1?Q?aFJ9rBRrxL0IzRIw1YIsVVYlMqN12Qmke1FHU8uJpHAYOXoaSjZXy76+K3?=
 =?iso-8859-1?Q?i7952wtx+pOjnA2tuZo895DWfhRS6LZQL10ZfBqtHMEET1CpEzILwpgDFg?=
 =?iso-8859-1?Q?aj7zxf4JkH+HF+tgUW1bzfV7b/Ed5phWLwJnSNYqaUSXIRDCCQq6/QPI/t?=
 =?iso-8859-1?Q?A9rxnosOwmK5ZIoLnKToYSIQ1FLf2DoVHPovD344gz5Xngthql8hL6OhFV?=
 =?iso-8859-1?Q?DWKqcUEDLM4bcnxhSjaU8I2pwyXLB8fMvXKO098IrNbIXEjly2J3Qi72mn?=
 =?iso-8859-1?Q?oxQkZWzpHxk7ECT1oaZ51KF969gn3EbgiV1lUmmoYVoXYtL9I6i9R8LhJW?=
 =?iso-8859-1?Q?eE02eez7mMJSuPaQoMqaMm/NRmDVrF3AgcbnbBfDPryiQ2wLNvYbMTcGn+?=
 =?iso-8859-1?Q?rB0I1HwPqwDbHNmhkM0peN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LYP83bgcGe1ACTsy7bDAnf80S8qGYG4AUR8vWxdKgewn05Rr5IbLMMQqnA?=
 =?iso-8859-1?Q?3JJwBQxFWv/X1y/CqyIRR/cgsDAGC4/8f6McK6zAb8wZjwaSDb9Ricv6Fs?=
 =?iso-8859-1?Q?m+FSW1UNZHg/gYiyqMRvqr+c2ZrmOkvPGSxrUbI2zRYoGewyHTcT7KwdKI?=
 =?iso-8859-1?Q?pgHbCdgIGUn+mgOGjCUxPOl7d855YRangRdCpJ8Jeul1lnYJHZdVJdeNZA?=
 =?iso-8859-1?Q?PxUVKZs14t2OrB2WP6e/ARZntgPgebJuiF1jeSCOkM4Cz8JkD8q+adPWbG?=
 =?iso-8859-1?Q?rm8WssG1fJuvAttCa4tBmtlf+jbS2RvUgzq4BEny6Mu60c5DQ0hy2ZRNiz?=
 =?iso-8859-1?Q?PwRzPK7cT8UfAdmWe04YMSPQo9GOMawIRX/bHch0bDlB86pL0ir3AlDrhG?=
 =?iso-8859-1?Q?t3mc+ldLfU+9fmd6p1O0DIPfzjOpoBDAVIAjm3rBkmyRdKZVuVkfHsLeWg?=
 =?iso-8859-1?Q?/s4+10MZQLyG/7/I1uJN1MFPXRE7ALpYllR+tDEZHkcwJOSC0SxpkPi66B?=
 =?iso-8859-1?Q?7I13ABbSQgO/QZ/k/yBHMr98U1j/nTZuQ0mjeVplfccmGCzVEfcPzfikDO?=
 =?iso-8859-1?Q?16dy0evTO4vFqu+DB86QdSF9r5ndpETbMhEVCf8vOlxH2xDWNI+gR7Dp+l?=
 =?iso-8859-1?Q?1+VoZdKt80YGfJI5Iep1r2VPCyWp0+oO33QqKvELcmYqOXI/2PFLcy8TXn?=
 =?iso-8859-1?Q?FZNfyEVVYlXG1FrO6WfHeqXVzr3phSUT+7NPrgS5OUVGN7SuylPWD74aAb?=
 =?iso-8859-1?Q?B/5O+IS8kEq2SuJi0/eKP4Pnv1/V7U439kySG99vqXethdi7ITKHkgpB7O?=
 =?iso-8859-1?Q?OcQhuYVP4STwETODGmriN8UfimDFX1W1x8ukb8O29RHM6mI01D0nNiJDad?=
 =?iso-8859-1?Q?aoxQeDLBik03s8SsntKFgpeT4cmJLaF4KwsfaoYXzVGQsB3V07A53d04Vr?=
 =?iso-8859-1?Q?2uIqbeFSjSDlAN8FtE1fs0yozmIXCeJd7If5RW9RXoe9FowYxgIMaNx0Qx?=
 =?iso-8859-1?Q?cxfp/Uiye3az8hvKLmFW3V6zitoVdcX3vafB5GWfaGGCWKCslMa1n+Y6Yj?=
 =?iso-8859-1?Q?OO/OCky/9OT9kPzqh7JGUB3unu/XvZirLQNTocBq6w0sISJyBz9Y69eYdq?=
 =?iso-8859-1?Q?7Udk7iEpDroivlZ6CJ8S5gpHisdAOAAo6YnN64z3pjl+cz5sgabJ9hEF0A?=
 =?iso-8859-1?Q?NFTgDTa4RXoAJQGkpEZ+oXuN+oZbhgnCirdblMXu0llfYRMDunW4nq7zOt?=
 =?iso-8859-1?Q?GjXYNfMc55Gr3z4EHiBcx0tAVwM6jpEem7sSQP1InJU1a7Ph46WTO3zsGb?=
 =?iso-8859-1?Q?NzHBKOxb2JLhER9uwvX9QZvgu1m9+fmtDB5agsLDN8JtmeAUl7uTMsOizr?=
 =?iso-8859-1?Q?WETbqhXRs1D4vHNsKYSMRyoLmU4TOBGZTba65N+e/+YGshttWwi4c4SDi7?=
 =?iso-8859-1?Q?TB8zsuIUfkWtOsRpBdAxEoGFhJN7F3slF8sTNpKzqKHBPRD9G1OoPJKnJE?=
 =?iso-8859-1?Q?Wy0xuiO3PqJUgI0UUUg8RgI06wsvIc6mob6mVrxgZHhe7WH2frv6mab8Ke?=
 =?iso-8859-1?Q?o3XGRIIOTSuJigDCUsAjg5un/3t3Yft9VsKlSroePgAAz9ZW3C8Rb2cj1b?=
 =?iso-8859-1?Q?VZvaG7+cNjg4O/uSZe15BlnkLBzOZlEd4DG964W2p/jHV1rZN7WOSimg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e9bd44-3815-42a6-41dd-08de2a12d433
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 22:02:29.2718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yfB0QdV87dIRUjH/NKSdOoHaOX+JyBI9bt8aaPXHzoQIYKhqlI7ibq7cqPUG36vGVPZawFZzEqyOSKU1nm9Llw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8889
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

On Mon, Nov 03, 2025 at 11:39:57AM +0530, Himal Prasad Ghimiray wrote:
> The MAP operation for a CPU address mirror VMA does not require ufence
> association because such mappings are not GPU-synchronized and do not
> participate in GPU job completion signaling.
> 
> Remove the unnecessary ufence addition for this case to avoid -EBUSY
> failure in check_ufence of unbind ops.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 12354e03c3e2..79c7383bf247 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3202,7 +3202,8 @@ static void op_add_ufence(struct xe_vm *vm, struct xe_vma_op *op,
>  {
>  	switch (op->base.op) {
>  	case DRM_GPUVA_OP_MAP:
> -		vma_add_ufence(op->map.vma, ufence);
> +		if (!xe_vma_is_cpu_addr_mirror(op->map.vma))
> +			vma_add_ufence(op->map.vma, ufence);
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
>  		if (op->remap.prev)
> -- 
> 2.34.1
> 
