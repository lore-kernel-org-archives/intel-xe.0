Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A56D3176A
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 01:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A4510E11A;
	Wed,  6 Nov 2024 01:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jgat8yiM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390CB10E11A
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Nov 2024 01:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730856269; x=1762392269;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HaIkORRxUwcl7KFuUJ1PT+5AutpPU2o4bFCW3v1p7XU=;
 b=Jgat8yiMxI3NEMA/ifNtW5lWJ9VtY5P2DGgnKJyPb0vgRynVJFAPlPyR
 S/4P2vGscAfM9fRMpxHJKeO1WStz9fkzg1EXP0DRGNZTh0aRh8/dd6qs8
 5KpDaeuDTfVcExgLvaTWFy8QkY5wsULQ3Ge3Lsh+7sJSC60aQ2sBRJuS1
 fjQ3F9KdMSBYMl3xkTfhSejxFWTi3R9c1RBh50YzV/EF/tV/uHMiTr0Ya
 6rc1yMhQbSpXzoDuDYSmsUFVnEddrgmPIhXVeq9c6W5PJb9XZvrcufFfs
 sDf7VjspUKZYrjPmyK+yiTGOHrJY4Qc0wBRWQT2Brmb5kAmQFxN+w4Psl A==;
X-CSE-ConnectionGUID: enEGZDdCTr+TNjHq3I8+mQ==
X-CSE-MsgGUID: r8nOPHIFROeMIsNWCl/RVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30797084"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30797084"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 17:24:28 -0800
X-CSE-ConnectionGUID: XDQ4q3b4TeS0vDECjNfM3A==
X-CSE-MsgGUID: 2uiL/7hLRJyLBLozhf2Ehg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="89067695"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 17:24:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 17:24:28 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 17:24:28 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 17:24:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDUPXYG6x3qIyMN8CiyPdIYov1HQfGZrhAeMinPF8kRQN+nm+aGOhmlRvjbXnpHmxICIyt3xvmUe1/Bv/GOuOuqHnCQvnNyLhe/KRdjQ/RfboCYomdGskfl3zux9XoBLdw1TR18hp45lHesrG2jNwbSJ5xwgsHvY9cwz7cIINEB6ahjQN87nvbK3oll8rRG9CoVMfV5ksCqJH6dkhN2fuESHU0i2Gim01jGA8zQo7y1BttLWRj8fu+gt6soSFDfHguJPS+4Iq2j6KqJi5nfwMr1EAH5/Gav19qzRW7W/GL1SBRZiFGnf0xeQKRqXiWHCim24nyqcj8g/pSBf0Cq3xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cp5zA85jfU3rsJbP26O+TYcbNsZpZ+IRjelSUIDGYc=;
 b=GGIDyQxtZA6EOahen4wF0BZ0wRkEZ7anNaap1y5b6z9b0Bj8yinjqecrXCR69IGBZdCaeFqKZGPqfMnSyIYyJxUBYOlZCcxIRdfWVWFMTwW/azMon+AbknO2oEmjvj7A4OtpS+rr2hcWgxyauZg+/1/e/AILbAsveenyZHAKEfZyuMjj4NOnwe2zdOVhjl1vcs3KRQI3azcelNKkAYeeTDa+YRitXiI4tmjEZ/QM2kg+4exIUd/vavYETiwu9jU4Do1GWF001ZDC5NhoOdl0cPwoFVF9L0JFDCKQ0yIbXJcjG7ThDXuUeH3rsYqB2esr5x45LOHTnkGz3j4Z1BTDdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4583.namprd11.prod.outlook.com (2603:10b6:208:26a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 01:24:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 01:24:25 +0000
Date: Tue, 5 Nov 2024 17:24:57 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/4] drm/xe/guc: Don't treat GuC generic CAT error as
 protocol error
Message-ID: <ZyrFaSYNzva2mZVp@lstrano-desk.jf.intel.com>
References: <20241105173032.1947-5-michal.wajdeczko@intel.com>
 <20241105204557.1991-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241105204557.1991-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0074.namprd03.prod.outlook.com
 (2603:10b6:a03:331::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4583:EE_
X-MS-Office365-Filtering-Correlation-Id: 10e8e56d-cf31-4eb8-eac8-08dcfe01c03d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q47NLQgg9zJQVLwuYA9IGBzBVIkbFVAYpR5V1lH/6O1HM4ywB1pWTj7Vtg/W?=
 =?us-ascii?Q?wZhdG858RhaUBXlxmb/athJLSmPNXUETjyBjD7viHmxPcaDz1o7gHFnUv93k?=
 =?us-ascii?Q?Q49A4Qt/fS3Vt2q7mjYmkUiAf57PY5Vg/F5VLKTECMPYIMgqlLZr/rTXuvTl?=
 =?us-ascii?Q?/rBnVp5wtbGaZdCLs2DgWDhuBDC0ub5He7+DET0Mmee682A8gsoIARppWHRY?=
 =?us-ascii?Q?VvmtKU1C86dhUuht0dshQsYCS0PWDxFhGGoA9g1PoMYihVgoO5b2vbsXpveD?=
 =?us-ascii?Q?cFnHtWxxT1HlaQ3S9Q4pmzBOcFTYKQMVvgxpClcvgyxF8oV92/FjE0pkFrv8?=
 =?us-ascii?Q?ZMN1ClrwrYzir5d8X1x1thxy6uvBx83C+nN5pkQnjRLo11tTHkLuVEP/mZAn?=
 =?us-ascii?Q?fKE5IZK9abtg/S9buDvXMUrxDalw47uT6ByDhDNsbeCYyN+i0HEXTUhfjC0l?=
 =?us-ascii?Q?uKQwChB0s34L+3wDZea/u2qcYrofkcJna7KkJQ5Lmu1fEwtFLN/F8RJ0t+3k?=
 =?us-ascii?Q?KPJEcvCcIrSOmFACaCKUz0u1//aGunZd3m8lt3/Wg+cnvy0GTGjqVN14EEeR?=
 =?us-ascii?Q?bweF0CMpoNtMB5zT8I45NMQ/znPCoyMUCBG9qfCF6OJf+GTujoDtZNwn1Egl?=
 =?us-ascii?Q?TOa52w4d5tzekipG/pWi+W4V63GH79kLRCDGSwsT4fIEbUXUU3spR+mVFTXG?=
 =?us-ascii?Q?HlvLBHpieKniklmFTvmdBnqLfo3Pb1v/E19o/ZktnLXiVgZBeZeerh76kW6I?=
 =?us-ascii?Q?zwtTF8ib6qYQUL0fkQUblqy64whGyG1DS2PFryJEDvdBgh5hly2ZNJ8hfdwB?=
 =?us-ascii?Q?etf2kBwFd5UEk34ih8gsBr4SQcjucGq28cEj9ZK/OJS6vmDKg+WTX2BfPJ2q?=
 =?us-ascii?Q?SEC77FaIxGdlCQcntIohli7qvYR3CohV5oNLKuiCnLQls9YLH16Or0FtKoqn?=
 =?us-ascii?Q?/MdJvd6TBqmkm1tcPznwFyc7KhLTWtTIR1abQlf2lcbLgHze8DMznLDy+BN6?=
 =?us-ascii?Q?9+S2fB1LJ47w1u/77Hl1qbpeRHp9Ya0roH/GM4JOcRB7MYf0a5pUxV9crta9?=
 =?us-ascii?Q?2NqJosAx94eeOLeU+sOELE2PbRrXLAHghaTNIxtpzBpVv3LpUsvBXWOvKQGq?=
 =?us-ascii?Q?eqmcBAljrtFgSmF++EsEsXn2CJjKcY9X72FWRZfaRU1DmQeRqxf7NggzTV5O?=
 =?us-ascii?Q?Soj2vwxWWexTgMm7+pJ+loL0pMxT9idnCdIMYIzD57MhX2U3RQR+qUrjHeEk?=
 =?us-ascii?Q?4mQzJxzh6n9PBNOnJcsw18BXcoLfyqCHYjsI/0PnGLsWopNiCUTx6R3OBjth?=
 =?us-ascii?Q?0f5ye3TyiwlsN/pLmqDdXo8R?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T+49JU9vIIBLL2auhlbYqFbBoirxWXaU8fLmMNkNskHQJGt8uuxX3XBpD1Ar?=
 =?us-ascii?Q?75+XW3Bid9UUIGLbkLct+2dtw5LcvZn603Go+O05RA4L7JasZtMO6QYvhHzP?=
 =?us-ascii?Q?yYAic4t2BLIoFX+s6C2XZ1xcWA8SzyQv7RCrp4xbp3VZ028A8mFZE6fiNhpi?=
 =?us-ascii?Q?ndcZRQ9rswV3WKMlOqD0DIU5j7eU21jaoJCpy4OJElD6wfmDvrkELzegMJ06?=
 =?us-ascii?Q?ohy0wOcqmFnt9zETIA90N2S2EEjRiTi5fmpdEgmUO5WVnvuRYugJZ7RGtMyb?=
 =?us-ascii?Q?RkZkEl9ilWuxVd5XZq57PNpSLMa1i7SfgiDxn504WiF1BtBKcyLT7V6PKzpR?=
 =?us-ascii?Q?foHHU8ZcWX0ID78T/7H2oVxCBZ+3TUPYA+V4kqx0Oo4eYLj6DYnTbnseGBZd?=
 =?us-ascii?Q?lfJ0ySMjQOF7BIw7eehRIV/zK+WfC92CkT+w6OwSrTKMjxRcTY19tPS9QNsy?=
 =?us-ascii?Q?09sflRSrnZtfsPV2n6UDrDoeUhWQuYem2Ni/oHkDnaVYVbMUW8qL1tK2spWB?=
 =?us-ascii?Q?Dzrx8sN+Pn3bZ51vkdZiHq4H/j+sTpdzXdMwXkKcVfg4doAmzHllJmC8RI2u?=
 =?us-ascii?Q?f21sPAQBE3zpntaKh4w2wE2aArOCJDMwWP45eLr6tsgGzo+JycEQgTy8KlTV?=
 =?us-ascii?Q?/1jxpzdVF5wdYOJNK+FOFOjRq5VY3vYjj4je1kozd3eNU4Hs9Fh67CS7K42w?=
 =?us-ascii?Q?fpaeygAVB0aP/Bl4xC07oaNy8waYHX3x5BppZyrDKXs4fnArH0qNS+Yobfvl?=
 =?us-ascii?Q?8TdZRUhRIqJyD0SlrLnQUgGhm7K0prTWpjyPxoxCzwz6JY/Fg3GMK9rXTXop?=
 =?us-ascii?Q?a8Be9UkmZFcB8jXo29zTy8j7Ud446rBrWUfMlAbtSA2n/KIGx6a8hb+klq8z?=
 =?us-ascii?Q?GnMHQVbiLtkHKR+VxwsqzMgVassHDTHHDBEtREuLPrvojk/6t/hmY5Z3D0xB?=
 =?us-ascii?Q?s8vXZAQ5uvx7ZvVqIi2P78GCyTkZh2ryTIKt6g7ijgL1CQ9wuAolypPhlHdu?=
 =?us-ascii?Q?mu84RA91OzWM+N7sPRDDLbyRBPhEXMln0JWZlw3LYNfBBUQ7ExkiVuIIDwnr?=
 =?us-ascii?Q?JnCOZayUT3raPfnn8DtDgOhKM6kpA3fkOMrodd+LUsggzW/XByqFnYdMegXj?=
 =?us-ascii?Q?2JxYPF/H4N2bY25vggNU3t0rg4E0XRarfhqUOI2kubxi+B7xh+jVfh4FSpj5?=
 =?us-ascii?Q?dNwXBlWRuSVM3C663ks0mqL6Cnnk+5SpfhF9XXxy3F29PE6jmMWrnxaCRI3h?=
 =?us-ascii?Q?qAs8z8U5hUWkt/17RIPIG+7EC6hp7E8VdsEvMXpBb4G9tdhuaOjMEB3Mt2P6?=
 =?us-ascii?Q?gTydMD8UEmNEOSllHXWf314OUAPSUefAvrAMQHty/g7XAnXabjhFIHMAq0GM?=
 =?us-ascii?Q?bieJM6HLl/AQ0G6cVRwlO5s4Ysn0TOZAr0tW+j2CD3GHYEJGB/CsVnB705IK?=
 =?us-ascii?Q?elq/uDvJKbEPyxpMGiuVmeiRVGZYpVaQf67t/CeqLEjKGgF5AggnHHawoNiz?=
 =?us-ascii?Q?7tQlUrZuWcjKBC+ALN1m8HrXDiIDkGUw3ljqn0xQiuNFO4CM2GW/0wSDzMXY?=
 =?us-ascii?Q?8oJpP7v03TITzBMRMynDkTWzdC21PoYvohMiATksXg4MGLDGZxmm/0uzKjvZ?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e8e56d-cf31-4eb8-eac8-08dcfe01c03d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 01:24:25.5517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5p0tUKLgLXWqk91imf29peMQlQjuRGMoE7xIV+86iVKuxts6O3k2QUwSZV+S7/EEQMu3ER7JcoeL2aHVurKBNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4583
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

On Tue, Nov 05, 2024 at 09:45:57PM +0100, Michal Wajdeczko wrote:
> GuC uses GUC_ID_UNKNOWN if it can not map the CAT fault to any
> context. We shouldn't treat that as G2H protocol error that would
> justify a GT reset, as it may happen due to some VF activity.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
> v2: replaced 16b GUC_ID_MAX with 32b GUC_ID_UNKNOWN
> ---
>  drivers/gpu/drm/xe/xe_guc_fwif.h   | 1 +
>  drivers/gpu/drm/xe/xe_guc_submit.c | 9 +++++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 08ffe59f22fa..057153f89b30 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -17,6 +17,7 @@
>  #define G2H_LEN_DW_TLB_INVALIDATE		3
>  
>  #define GUC_ID_MAX			65535
> +#define GUC_ID_UNKNOWN			0xffffffff
>  
>  #define GUC_CONTEXT_DISABLE		0
>  #define GUC_CONTEXT_ENABLE		1
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 147000fd1177..614110dbb527 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2023,6 +2023,15 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  
>  	guc_id = msg[0];
>  
> +	if (guc_id == GUC_ID_UNKNOWN) {
> +		/*
> +		 * GuC uses GUC_ID_UNKNOWN if it can not map the CAT fault to any PF/VF
> +		 * context. In such case only PF will be notified about that fault.
> +		 */
> +		xe_gt_err_ratelimited(gt, "Memory CAT error reported by GuC!\n");
> +		return 0;
> +	}
> +
>  	q = g2h_exec_queue_lookup(guc, guc_id);
>  	if (unlikely(!q))
>  		return -EPROTO;
> -- 
> 2.43.0
> 
