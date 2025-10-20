Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B81CCD193
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 18:52:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157C010E4DE;
	Mon, 20 Oct 2025 18:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJkvCd4f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8DD10E4DD
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 18:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760986353; x=1792522353;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WkR1fuov0VjKZyNbszZ0XE2DHT1olJRWPyMxK9u37tE=;
 b=XJkvCd4fv9a0M25jnzMkui896ee3yZm1o3jA1DbdvZM2sBjgIJpYh66a
 S+PDdcINjurXkaT3AldndhCstTdXCxmpLwVqkqGyizpmzur6t3YlzPZP/
 cXzzhhGCF76skVw9V+xKPBUlQnf0OcPAd6/xKVBmwl2M8m0QELnWgOBhN
 cSmHACZxCNfzqsmf4yl++pdhzpJxdKWjiT9XryUxBjNyNqpd9JTCm6czn
 7TBzvWunpuMtvleKh8GDi985IhoUJAEsQT5eG66/LqgBuacacWeoMHCYN
 ZFT4OYZEJibiMElQCpX1rQQelZQoAV+heV6O0rFppjRclrSJgU11Ye57N w==;
X-CSE-ConnectionGUID: rxb1jclsQba4R5dyFka8jA==
X-CSE-MsgGUID: mf21iz5ASwyjHSOBxiWqug==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="65723452"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="65723452"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:52:33 -0700
X-CSE-ConnectionGUID: peJmegYgQlmakPCaQ2Phdg==
X-CSE-MsgGUID: Fn0Y69ECQe+KYlCJlVVDwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="184172362"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:52:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 11:52:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 11:52:32 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 11:52:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0mJNubfqydRbtHRDft2W24S8b/8Lk3PdG8oqT92mZZyQ+tjtiCp/vPpjZDmv7xjxvf634Fg3JLctQPBJxYqs44VP1rXlriYCfP2N/qxzEGpKqjfLJrbOOex4P5VaVxmSCh4hQZI4FUqK3iOPAccR1jZm1hIxpy+yilk+V/nBjWAEFGqUAMmg3376elGR2M2IYltSEF07El2VMIo250Fxz/pZZCAaAKbsqK1sVe4cjxMU/qcjHu7awj7ffTx/IRrD2yJ1k7w+pJacOnyyXzx13YVuznZQgIDqSXDx1fCZVxTXz0MyN180FC5MfUPLtd51VvsbHxyVZZ95bnsK0T9pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGdNZxb2TkieB0V6KYThAs2VAibL7K/HCN4iHbuciqg=;
 b=Wa3SGYE/fRpNsOClXP2MdJrt0bXqiYPNxId4EZ54U8IRbfkm5IHw7nnWRw6WndRAn8oKIplRt8o+J6lUI8k0ECA2orqMox0SOZFfXsPMTiiEBecTmzlQ7yIImK++7hVjarbKUyOKbVNZb1lkTFtPFMlJsr+KqcmJ+yqgeaOLY4/KHbrd8VKGvpa2XKGC++WR/5soRw/ZllyZHBau0a7rn9LQdzn/3US9f8kbZqiS38XlumZrqpETELqKzbSyjIA1z8+lruZUlEGHRqMWMf3Vm4+wWWGx1OgtVVfzElFbX3R3VlYYnjFeJAIcOdAJo9OW7ngxs88um/tc+EZonMvfQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 18:52:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 18:52:23 +0000
Date: Mon, 20 Oct 2025 11:52:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 6/7] drm/xe/migrate: skip bounce buffer path on xe2
Message-ID: <aPaE5T23Z1ZG7N/I@lstrano-desk.jf.intel.com>
References: <20251020125431.41153-9-matthew.auld@intel.com>
 <20251020125431.41153-15-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251020125431.41153-15-matthew.auld@intel.com>
X-ClientProxiedBy: MW4P222CA0028.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: ec63e073-3e27-402b-be05-08de1009ce6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Sd38jvAzEw4hI1CQo9Qt/equzPLAB0Gg8rB1qSStPtILYbC81sbwEoH3Sq/l?=
 =?us-ascii?Q?BQ+Nevq1GOdSirD4a7veZsyAvoxiAt8MgZUz4eaiABOSPxlIz6Wbvat6obYI?=
 =?us-ascii?Q?6zlSmjn7ILIAUBEgYe+yjJPOCr4ykofVWw+IvE9gV38juJ/uvnlJdeA0WL9/?=
 =?us-ascii?Q?OzoIvt8vHUHKcCZmquSUguTjXinU5h3ISfcdGcjiUT4zOHV06/eQoHs6ji+a?=
 =?us-ascii?Q?RMTrxpCPR/gWaiUPUZNG59Ru6xmejFn0KBn1fu4KPMCQANA6S1f1BRR2vye5?=
 =?us-ascii?Q?Ppb2vRzupI67xdw7+dkNrwEpmk5pqbyPE5YoyVpYlv6OxEOKmhxFJwE2x+cf?=
 =?us-ascii?Q?Xpi3mhtMxyIAYuRmYyPB62ZlXY9uAOrXApu9B4Sw3urRBZQcFGyeqjK8EQS+?=
 =?us-ascii?Q?/zv06bqzAs8CM5HHp+SMDiNJJqNN+zCtyI2ZIEEKRf+Vm0dlM+yM20kwmsRC?=
 =?us-ascii?Q?SqFh7p+7X6NIZP84Yf5BYtijPxx55tUAq+YACRAqQ2zcmUWfs7LZMu8XNFt7?=
 =?us-ascii?Q?b85hLsNGd4EGCId4WfKGg6gDlKD3FUaiBc/jfhLNkbVft+iMpD+0JUi3o4j9?=
 =?us-ascii?Q?tMJqr/NQsgei6FTLpUCECQPy3H/Ge8mPOu+Y1GWIe4QPTt1NMT8yGBkhMQSK?=
 =?us-ascii?Q?aa5ivGom3OyFsg/Xhq3tIQA7KNOQTc7DI5bYPj8e9WldrF968g2E1o5SXg4+?=
 =?us-ascii?Q?vL6ktYWKD27uboep+NNBCnmPKIzrssTc9P+OCa7onb+Rmpxr1P7Nt1kbhw82?=
 =?us-ascii?Q?S7GyXzoa25HfnKizUfJfEOEmkxHxIk/IsOiAE2xg4Zba00vs202F6keFjKIA?=
 =?us-ascii?Q?3voAKCKgR+YEbVF1Jz1zGHu1jfEJ3Wmkfl5TffLUWXbNOMznf3x81dVnlxoP?=
 =?us-ascii?Q?izT5DD0QLNtGUyNO1q/fB0o/2Y5fz8GrmU7GTLVE92EsYeJVN/ugLj1rHXGN?=
 =?us-ascii?Q?tDLoSaVTfd+ePvF12xXbrnxmOFwxwJyqBWM5Ab4rYQKHgz4yi9lxNeY2jyun?=
 =?us-ascii?Q?OI1c5JvrfAZDHl1n1rRyWC0fcA/YjpSfLUakZRF4dM0N2cq8TPhIOvlslDum?=
 =?us-ascii?Q?g1mCoyUBQKZj5oGkWffUc1d6jKRDFiOqFCywOXsS2fLRFbTuRPbFMejJFbv6?=
 =?us-ascii?Q?h6R+AGlX5TFDONB8VHbSBmMFP+/ShexqlhJX+SN4RyAvZm5cHkEW+oFwgmz/?=
 =?us-ascii?Q?nAneY2LYbIG/lXg8WvMawxFaQHg1kuOChXS39VH8sKZUll7wDjyM5n4u+6A3?=
 =?us-ascii?Q?CNzaoxJqlzPsrNKvjHZ5NI39zZiEBu0CvIalSSe4p1xjDdM2VbYpO8vAFB+I?=
 =?us-ascii?Q?nD8zglai8dJmcvRgArLXU9YXrObnrAuWILD0NXNX2Edwlw13GEzs9wZme2mG?=
 =?us-ascii?Q?u5VbgrPVW3fCU/5jADpIQKi0+WAoAHsNcc0uHfQsO0CENVLy5VIRlDI1ZosI?=
 =?us-ascii?Q?zvb95D+D2tv5K6R85hOPwpzkFwg4oXcl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KRayrHy03N70PxW5pzYaGxxJLJzh9x146/zoA3egJRBE0b8suSQddgPw3hBL?=
 =?us-ascii?Q?5Qi3FDY7uUHCLH53zXveTu0X5oeIGjVNesqWktHqkfa2R2iG6u7IVQuPUF0p?=
 =?us-ascii?Q?3/Gb7XbuBGmhB1fP7DyFq2p1+CJ62seZ6bk+0OryHOSGhKQlRMwQkMPXef8l?=
 =?us-ascii?Q?17u/UioUhtnXsXM9dJ3dHLwWr4A6GOgWOKEgQ89G59igTxytOijU49DcROuk?=
 =?us-ascii?Q?/85EvEB9B4XHbmTJ3UgSal9Nv7TrPjsWI5ZbKsSH5UzqIx0EUveDCsasuBBY?=
 =?us-ascii?Q?mY6YFk4Qw5QDUdiERJrS5Xq4Y2UxlbiVtBfCRsgo8RDEMX4f7aIp1FmDQuh6?=
 =?us-ascii?Q?8Ui4B+OB+CmUlYIFSbbdBHF9MECrdy6piIZwxdotXHZs8Dkq2JP9g7x1hX8E?=
 =?us-ascii?Q?90nTWFN69E9szz10+tNFJesduD6TX8vWA/R9BTIZXGS4uw3mj3dpmlSwhVvd?=
 =?us-ascii?Q?QIIVJyBnYbWylYSIQQppR4aZYWHC4WstZ3Ywidhmr3uarJqrRttPeVF54S1E?=
 =?us-ascii?Q?Bu7QU4UlhPY1x6ZuufbjOiv8morrhXkctNwUhMqamxEDWwQEnEqMMZ2ioz63?=
 =?us-ascii?Q?+Jc52F9rkF3nY8Ixz9MyGNvCMjKHpm+Q3DyRHKGdn7HaYQx0/fFdiwz889P4?=
 =?us-ascii?Q?5UdXLNZkkSPXDSUmGjGJVDRHxYK7q/ktzMTlDIcluRpZXQSmjAcmiQEz5y4w?=
 =?us-ascii?Q?YT2Jbn7u+wnW79Qv0cd3NmAuC6GH/Vxeb+dCWoI9nWGIGD5Hn6vvDRBxWh5Z?=
 =?us-ascii?Q?s97RrFhU9EGAYuxcBFR6zGDpoQKq0FZ97FOD1dJ5iqWhES1JHz8CUCLfOuYs?=
 =?us-ascii?Q?iGT/z7ZZO6REXebjgRRYaSXUwOlBggvhJ0zoZ0AhcEDZSmzHzkt5WG0vA7ld?=
 =?us-ascii?Q?QcTie+jbVodQXhpqtq1eGAQiWxGLl0MMqLZwHlapI1c4kQSW+yaC5Gk6PWub?=
 =?us-ascii?Q?VpGObdWUg1ph8+gSEjDa5Pf4SACuF8eUUvKB/hwMOhi3S02oajq/rp6jF6pA?=
 =?us-ascii?Q?hFjrNUEpoaKktu+TeXvvF0A4RodWiZe/RpX6eVURNqLp/nlaIS08SkxDaTjw?=
 =?us-ascii?Q?AWMTA0diCJ9IrC3C67aiUwRAA6+cT+fFnNfpIwhQfZiCptsYRkK8evRNdGCA?=
 =?us-ascii?Q?uB/BbXBaxJF/itQi/ALHvEVSE0gVm/na0kdtrHmYtLUMiy8QHowHKSZo1hw0?=
 =?us-ascii?Q?ON5zdTkLaegpAc1X1UYy1vJWvBX91vntoFZG1OKrh9guW8kJ73tUm5cVT6GG?=
 =?us-ascii?Q?txx07Vf5SifT62nfFCQ7fLAK7GTi7x78uUhv01Se8OyLYOGNdTMW59maBZw2?=
 =?us-ascii?Q?AehEQ3tDdjG3gNHaXatTwTsEnv//bXHS7cdi1Mo/Hk/FUa38MLlc7e/v5+eD?=
 =?us-ascii?Q?SfPB8J//i9AfTPNw2kRwu6g5iYXXPESnmQhP4Ph+PtkIeqqgKyZEqRtApcFA?=
 =?us-ascii?Q?uK6eUnzjtAY0kdQdx8WddWErrb433PleQfKARhDolN/b4RltzkUOQgEZ7SEo?=
 =?us-ascii?Q?FdRCDribwTXoqrpbv3lqiEq6Edi1F0b29s+R5b51MbSY8qh7UoUF6MwN+kpF?=
 =?us-ascii?Q?siXBVGm77PkbuRxolTuBRjyQEr+eyO5IbrsZKlm531hzjI5IKzkDqXkdGdLy?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec63e073-3e27-402b-be05-08de1009ce6f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 18:52:23.8843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8IsBquYA1fAt2YxqqTBix6znYcqJvL+WAU/MElNhWMPe4xvfSN4QqbkJLd8uJbynXb75Btgnbb8d+iDtr7yzNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8185
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

On Mon, Oct 20, 2025 at 01:54:38PM +0100, Matthew Auld wrote:
> Now that we support MEM_COPY we should be able to use the PAGE_COPY
> mode, otherwise falling back to BYTE_COPY mode when we have odd
> sizing/alignment.
> 
> v2:
>  - Use info.has_mem_copy_instr
>  - Rebase on latest changes.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 14ade32b8b69..7819a168ed17 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1938,8 +1938,9 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>  	unsigned long i, j;
>  	bool use_pde = xe_migrate_vram_use_pde(sram_addr, len + sram_offset);
>  
> -	if (drm_WARN_ON(&xe->drm, (len & XE_CACHELINE_MASK) ||
> -			(sram_offset | vram_addr) & XE_CACHELINE_MASK))
> +	if (!xe->info.has_mem_copy_instr &&
> +	    drm_WARN_ON(&xe->drm,
> +			(len & XE_CACHELINE_MASK) || (sram_offset | vram_addr) & XE_CACHELINE_MASK))
>  		return ERR_PTR(-EOPNOTSUPP);
>  
>  	xe_assert(xe, npages * PAGE_SIZE <= MAX_PREEMPTDISABLE_TRANSFER);
> @@ -2158,8 +2159,9 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  	xe_bo_assert_held(bo);
>  
>  	/* Use bounce buffer for small access and unaligned access */
> -	if (!IS_ALIGNED(len, XE_CACHELINE_BYTES) ||
> -	    !IS_ALIGNED((unsigned long)buf + offset, XE_CACHELINE_BYTES)) {
> +	if (!xe->info.has_mem_copy_instr &&
> +	    (!IS_ALIGNED(len, XE_CACHELINE_BYTES) ||
> +	     !IS_ALIGNED((unsigned long)buf + offset, XE_CACHELINE_BYTES))) {
>  		int buf_offset = 0;
>  		void *bounce;
>  		int err;
> @@ -2231,9 +2233,12 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  		if (current_bytes & ~PAGE_MASK) {
>  			int pitch = 4;

Shouldn't the pitch be 1 for info.has_mem_copy_instr and / or we use
linear copy mode for non-256 byte aligned copies?

Matt 

>  
> -			current_bytes = min_t(int, current_bytes,
> -					      round_down(S16_MAX * pitch,
> -							 XE_CACHELINE_BYTES));
> +			if (xe->info.has_mem_copy_instr)
> +				current_bytes = min_t(int, current_bytes, U16_MAX * pitch);
> +			else
> +				current_bytes =
> +					min_t(int, current_bytes,
> +					      round_down(S16_MAX * pitch, XE_CACHELINE_BYTES));
>  		}
>  
>  		__fence = xe_migrate_vram(m, current_bytes,
> -- 
> 2.51.0
> 
