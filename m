Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6755CC6B33
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 13:43:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9102A10F0A5;
	Thu, 15 Oct 2026 13:43:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D1D10F0A5
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 13:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792071785; x=1823607785;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bXYE90HYKuaPloaUz99HzyOf8y4hn2SXgPte5UqS5h4=;
 b=PmFA1VpQMSjPRBSZ/3SPN769xpOjnbJ7Ny1JfNTGIsh3hPfT1ieD2b1v
 Lnfja3HAer6O/GdPy4t4Px6RZ0JAWgPfXeoWVBzbhd57tW4loddgNLwHE
 37N01K9T0dS4D6iQVaUlLcyVjtiLCjf4koS0RD8YnpkW66Vo71lKjOAmP
 Vtt5X9qgPf5AZuf7jKVW/DnkjfGhgXEZ1ovAXCbEC5d3UjC96mitsR1rI
 zm/vvoCmrCKETW/djN9wH3WbOO6ly8za0YdPEir+wAG2RVvufPSV7NapQ
 Vw2JeaWBtVoCM/FTpF08bJ9Li+XtdbgLEXXQwqOZmRCW56sc7M6DcHH+G Q==;
X-CSE-ConnectionGUID: 1OYjugP/R2yhR6UEsddTiA==
X-CSE-MsgGUID: 5YdsvRaQTbSCG3LS5tDTPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="852753"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="852753"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 06:42:24 -0700
X-CSE-ConnectionGUID: tokG4FTBSiGVVbeN4kFklw==
X-CSE-MsgGUID: /0ZQQ30+SvaoBd/nxfgPug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1628334"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 06:42:24 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 06:42:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 06:42:23 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 06:42:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qp+MnPYd4McZuXPAcLD3wRRl1H0q1803fnkiHGlG+4uWC8xLcnBnYOwG5NR5ScEkCoM3A2kpdGRNO+/v2C9qpPO0aAxIWbG3eA8Yv/00VPAbDkdTb8AWYwkJ2kU8zBQYIHadds4xJYSVQQUunuf6fM1+rbUUWVWMMUdXEXHoBbF0Vp2+3GgfkKvEpzdAnnQe520v6OSAOM+Em2R2moRJPgT3MDqzKwhidTyp52ISri+S37hwVrEGXt92XdcR2BUrO7JUbJnmjtAq7/jGdKpF1u72rXwTTFd5z2sWdbQ3q3zTyRuZkzkhQG6puMJKMtAfoDzP418IBklcb8GYEpZBPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5K9UNSge4ogTHK6ETMh12j8pSLNLNJFUwxqpmYaYNk=;
 b=Hjl2YyJKxg5FrNSbuph2oBXAkVJTZPe+8iMjGkGvJc0wC60KNtsvSqxpelvsAORvpdrc0lUNEIzsQddFp4CYnJk9ci3kwgHUP45gCxPWTxdbExTCDTamyM9fA4no0O+Rf0lohQm7hNGia/EqBPFpYx3q54Mw1cBsf7EBrFrLrkpgpmJQxebVne6YzbMWJFCRDxnz0U6lIGpp+7uD+qMvY4b53OVqCrpsRkoh39WwKHiURwCQmrfCZ5gKBhk5sNiUoyge+3tBKMfiizi9ZiW7syY7fg2db8PVMtDZ5USgauTky/S/CNGLKwBJsRUUbymY9QKbRkc+wXtOTeHZKj5UDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by LVTPR11MB9910.namprd11.prod.outlook.com (2603:10b6:408:3c6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Thu, 15 Oct
 2026 13:41:42 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 13:41:42 +0000
Date: Thu, 15 Oct 2026 06:41:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Rebind BOs evicted before the first LR queue
Message-ID: <atDYFL+RH/zCnlsZ@gsse-cloud1.jf.intel.com>
References: <20261014165618.2721850-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261014165618.2721850-1-arvind.yadav@intel.com>
X-ClientProxiedBy: SJ2PR07CA0011.namprd07.prod.outlook.com
 (2603:10b6:a03:505::20) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|LVTPR11MB9910:EE_
X-MS-Office365-Filtering-Correlation-Id: c1e8f4fe-cac6-4226-64bb-08df2ac20c0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|261009223027099003|11063799006|6133799003|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: JiT8+PyUkFp0gyyE0SjULFalAqWak9PQ5/PN3SNrhYC64QZshWwRkJB5h7ixd1HBjdnypfGa3Butm1lwsvgXYgrNSDQIxNljxbMqnJWD6/vfb9Afh3FUFjYcSozGjBFHQgCglX19yjloIjoJB9wFjXt1CHe3105sZtMgBshzn78lr1uBUuXUkDjwZpApdKclXsxpftZQW7FiQsEiGOAjES+HBcxs77aq3PyNeispzCULsOaYHprpNHY6pirzYbkXql4Vpt6/25FJWOzrvd/j5XUjrg/JVWyAAFidTnEi2XwwvnmsAEdH4kGJNPyYZ9dggCoswWCvf2j9E+rvvFP2lnD2NhBaxmXLZZ80CmzBa2/fPixCybvyEMK4LDmuegcwcQTvMu2k8Cl/8PsygS2ftf/nOqvGLEtfdoU5BTgz1IFZ22w86gYHBKhO31kIF9buZDQOoIgO+PwVsVOdDc6//znMLZQFeFEePGq8cW+eEsiPkwQJR9vf+IzNZlHHXzgkUkfyyfnxCrrrliF/llpLtG7I4WNB9N9yhbN/qaXsjzp4osCcla7hguLWYX2WsGVh+JCxjU0K8u0hPtyuEiRH9vepzTsdmYxxCfWuS7v1lNQsjpUBb7SnYyDRAjZ16Q2Il0Gr7SPQg+45YNWMvwX39tUU99iPf+gpZqjmbE5PmS4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(261009223027099003)(11063799006)(6133799003)(18002099003)(56012099006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?acC42+LZ5tRZQ4D3mxeZnxt1i9kWmxqLBFHMUat6Cyf/QZIYq9SEsEsjQz?=
 =?iso-8859-1?Q?/eAYXCykdzwzIH8AhZZAxokwi/9pZgAF9sIEkU7v0TrGDFECmjRFpg2K1g?=
 =?iso-8859-1?Q?TrQzdzx2mVQYVO+tES8vQmt09Nzk6osNOZt7hwQx27VhduJ6qDU9iGEODO?=
 =?iso-8859-1?Q?93vQ/gHMzwBq7nST/EeRPi//FylkJFojeg40NWXTCeEDBEHXdgc5qAFZQ6?=
 =?iso-8859-1?Q?7WKNmEtxBrhpeM9US4R93iSZHBLyWfl/gSQHX6PAVeBGEX5mf791hx0Nb3?=
 =?iso-8859-1?Q?lLeFzePr+BGZ/eXH3nEgKapmyCODWsiax5GGgysI8JqDrDOggpFnV22p2b?=
 =?iso-8859-1?Q?TNoKz0+51qUcOEoW/VDQhh5AuRS+l+pz1LPGahhbf90xyIMTwISEr87m/3?=
 =?iso-8859-1?Q?y1fcX7pilUebsICxBCIA3aE6pZzT+zHKj8eLnHdrlEhNJyF7NEDYg6FvZT?=
 =?iso-8859-1?Q?P7KRPTtGsG/lgohQBLENBNrPgFWlaHOH3LnQ0TOE8X52aTd2v4wyRC6gLr?=
 =?iso-8859-1?Q?lYlY7xpswNESLf88BEx1N15fFbHXO8F1c6zVO59lkcMyA4b+iaokwvVAiB?=
 =?iso-8859-1?Q?VD/8CRdXjDX8QJqhJbWlK/Gf+uPrph35MJgNLX4tJM5eqDyTCCn43IKQxq?=
 =?iso-8859-1?Q?Y3RAxWWTlxhUegiOhWlriKNSiXj7GttgIPLCHpPH0We+BdQnTlrNzORANN?=
 =?iso-8859-1?Q?wXaSM5t7lKEEYsESE3jF2OsXaK6eukKv0gCarReysK82Ls9wW4g7JVo43G?=
 =?iso-8859-1?Q?jtMDnqSA4xqMirFK+xJ240SrOlTkwEgEXN1PXJtiMoeu0Fu9kKlf34Be95?=
 =?iso-8859-1?Q?tljCP8qU2Gmthwz6OLiegHjGKWOxues/iTSz6jncdmRQIiXv4nkK7R5j0R?=
 =?iso-8859-1?Q?Kbn55s9nF/FNjrZSpaJsfg+IvN8v1MIlBsA9qEjjUnDik3Y2qFpbM7lOiG?=
 =?iso-8859-1?Q?OPNgbiC8qr+V1yaF0poX0TD3stBYT51dMcM8whXDnyaClkmrSWCRsAeVzI?=
 =?iso-8859-1?Q?lIopf4/M2MhXX10ENrcJGAjEfZDigq/cYHHjDGpEgR/K5HjBWrHHDApSHA?=
 =?iso-8859-1?Q?Lx9a+1XXveZCH2rvZ7yPT2B8d/rhxDbO2qKPQfdkul5VTZ5LGs427l1o73?=
 =?iso-8859-1?Q?r+B7bQELPQmCxLcr4c8TFwzfliV2ulg8IrEV+ZULpiPxQitEFaHRcTLP0l?=
 =?iso-8859-1?Q?0bjBW/ci9qp0dd9H84IxLgvmb6BldEvJkc5cykr44XgryoJiPl6qBYubUZ?=
 =?iso-8859-1?Q?kZvGOgyfWiy8MSxL7e3mR8XdzgMLYT5SoY+Z+llt0V4bRMXdCjDcm46iRB?=
 =?iso-8859-1?Q?Z/LtxjEDnxjYSdNzcqY/0/ORbGGMsVX//vy/yrFxlCXa9Er9r8+2v6NMh2?=
 =?iso-8859-1?Q?eM18XPjUL203hFLfmNNpV7jVPtAJOur+6HEs1hA3Kaf8CSROepdMdNReHS?=
 =?iso-8859-1?Q?wwBmEAwxR2qmUaJSbK+ggfMoy/osA2//9NN2HgAhe81R6g6aWLPTMoPZCE?=
 =?iso-8859-1?Q?yayiBub8yxnKHdV+AgznUuVmrp+Q7dAxTTssMTIn7rPI3csiYg6pXVlJjw?=
 =?iso-8859-1?Q?koHWtzMcmzjWFFTmin0/H18fUJrreV388EbVA07hv9tapFFHlsnzCr9VgB?=
 =?iso-8859-1?Q?0jT8OIkuanah2nc8sC1ukiCtd+JFSv5XTRa0uz+d12xj6DzsnRI2dw8B15?=
 =?iso-8859-1?Q?LE0jkyprJXDzNBZNfxWhs5oRY5Bna1LjaXK/1juoLDOS8CAzCnMM/2PWia?=
 =?iso-8859-1?Q?POtXsviHOAlm8jzMVogxWeKywX4hfhaMhZclXzMDSV/GDAXevNUgA9beou?=
 =?iso-8859-1?Q?VWukaRA7Jw=3D=3D?=
X-Exchange-RoutingPolicyChecked: pAReudy/sZcLqZ8k2t8MKGJ/33lU+vh1dRQVLd1htGQ5AYUk26J7zLCIY5plSKl3Oghlnjg8YPKULd/POogZBQeijE5KB8BBqzwJbrskEFw5nVOlqqVNyOLGDkdRC78rgIB12Ojm3YFBDn5dQkBxHQmoJgcZZkuBES8an/zRg9uZd58FTlD2J9O0cO8iRvlqOkDJn+6izwsWdIP4HnygOlWesXN7DZM64Drf6CejbLP6Li8a8BuWRuJDMjEX0fDWQNqjwuoXyZXrdinOqQYaKy2LSY5cXXcLp52z/x583HBnRGiT8+nZnzsaOqHgAZ8batrg2o7tkx6p2qK3tlCnsA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e8f4fe-cac6-4226-64bb-08df2ac20c0a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 13:41:42.5413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DROZWbfb3xPl+Q3M86neQC5A/LiOeE2VIUrhABRay81lmpXqKrFsDCUtdcLywuIQnbo+6VzAPDAXinxjeso7jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVTPR11MB9910
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

On Wed, Oct 14, 2026 at 10:26:18PM +0530, Arvind Yadav wrote:
> A VM bind can evict BOs before the first LR exec queue is added.
> There is no preempt fence to trigger at that point.
> 
> When the queue is added later, its new preempt fence is not triggered.
> The exec IOCTL does not validate or rebind BOs in preempt fence mode,
> and the rebind worker skips that work because no preempt fence is
> waiting. The first exec can then use stale mappings.
> 
> Trigger the new preempt fence in xe_vm_add_compute_exec_queue() when
> the VM has evicted BOs or pending rebinds. This keeps the queue
> suspended until the rebind worker validates the BOs and restores
> their mappings.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

This is a fixes in IMO.

With a fixes tag:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 095f762bbb6f..cbe60e876a45 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -272,8 +272,15 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  	 * Check to see if a preemption on VM is in flight or userptr
>  	 * invalidation, if so trigger this preempt fence to sync state with
>  	 * other preempt fences on the VM.
> +	 *
> +	 * Also trigger it if eviction or rebinding is pending. BOs evicted
> +	 * before the first exec queue was added had no preempt fence to
> +	 * trigger. Suspend this queue until the rebind worker restores
> +	 * the mappings.
>  	 */
> -	wait = __xe_vm_userptr_needs_repin(vm) || preempt_fences_waiting(vm);
> +	wait = __xe_vm_userptr_needs_repin(vm) || preempt_fences_waiting(vm) ||
> +		!list_empty(&vm->gpuvm.evict.list) ||
> +		!list_empty(&vm->rebind_list);
>  	if (wait)
>  		dma_fence_enable_signaling(pfence);
>  
> -- 
> 2.43.0
> 
