Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B9ED1CDAA
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 23:13:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F90510E19E;
	Wed,  3 Dec 2025 23:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BPqsGlhg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A1110E163
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 23:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764803624; x=1796339624;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nbU14jX5av11K2nbkBvgrrQQypn7jHkMU7sqKHqfJn4=;
 b=BPqsGlhg2M+dp64b/G8Q2hkA/dE+EPNgGoXTjWOoQVUl1vK17t5vkU6M
 TKreTCUj8F2v1rwlCkQ03HPchJ+8GkLXXTVpv62uudNDIQ9vAJ2Pz/BDF
 DR02iyGPKKfjb2m9WwhqLIMc7Cc930LDKuRb7gOrT4BiJgDfPpue8zEKP
 ovf6Cmcl4KIGPiY9myHRXlw+xXkvoSgixzBXETjuOpA2sohDDsL2fcXi3
 vW5bl6Z4mlPQ7oaSV7NHxZaoWMNYn6BpJcFJsrKTDx8rRyE7qwHyEwVOz
 LdlMyuRUMppRMsmVbLa8HyxFNK/jomdaFHrlf0chXvGbOwWIZPYlCsmcb Q==;
X-CSE-ConnectionGUID: fcfkVD99ST+771FTmZrCuQ==
X-CSE-MsgGUID: sxtylu47T3yOlpHLNY6c8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77436301"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="77436301"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 15:13:43 -0800
X-CSE-ConnectionGUID: +R6AxxUEQoCAWBxfAs5PZA==
X-CSE-MsgGUID: OJh/jZ8ASjaiFK/rhZ1bgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="194731074"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 15:13:43 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 15:13:42 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 15:13:42 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 15:13:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hLB9BhwbQRPy6y5kr57r2ReMDQu9SkstQmUnUs+4dSg6YvaldJrNsKVEkjlb4HxtAt5fjPeXX1GnAtd8D0btlaFj2DvN/NvVdP0DaSFsrdurdzdivMnmy1DNF9CD/hATLFPGLGj/wCAbHPoUkV+aYSrvxt6NLINAg8B1/3CXh6qm4BFEzpGtsuAxDSekENdiv63SKiHNWD5rTViYLcjX6htAdpABscuqV5u+Ee/DgBakk/r8r8mgmlPrsCmUBoCLbpRNdhyibzDLBmlQYtn1byMUVdTXArChgyoaZpPJy9WmzeIPqC3feZNRDJsRSjpZeCLcHzIYgjg4qgBp9mdwAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pH5po7b1LiUHi3T7aLwBbxAJLk74B6yJZVoJ0gzNGas=;
 b=vOuVcbmaLSqWAYJIfEKXXgnm9l3YSDlTPe8i4O79HsvjCEkGpqo4q86jL6N8vS5WJ4UIG565gXx9bHH7BBAObPqb+Ps0j6FNZNnK4m14y988JCxrwX8dUzt5KWxDZkN1gwycQWtzR7ifWLdQ7gfATlSyPguQS9Xv7sK1TzLtAhwIEwYmh/stTcrYi0paLVddvYHDskeNfPaaQskk2zYRG1Yx+G1JMn6NyV/ZvpmugYlgMpX8OVKs2ep1QqIhzFT6NkiHKNA7im27h/tF0TFl3abs5xGumk2ElqFQLVHmUjiCGwHqvHJMfJWvosvKgJ3IFno523sFYWrEqOR+GeEU3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 23:13:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 23:13:38 +0000
Date: Wed, 3 Dec 2025 15:13:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>,
 <shuicheng.lin@intel.com>, <stuart.summers@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 08/11] drm/xe: Prep page reclaim in tlb inval job
Message-ID: <aTDEIK/L+Qc4faWw@lstrano-desk.jf.intel.com>
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
 <20251126230201.3782788-21-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251126230201.3782788-21-brian3.nguyen@intel.com>
X-ClientProxiedBy: MW3PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:303:2b::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6197:EE_
X-MS-Office365-Filtering-Correlation-Id: 64d6f61b-8d7e-4468-f33d-08de32c197a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hLmRiwf/hX2wGH5eCDroPUI4F/nll7sBza5L6fMkM1lrN6eIQSiM4yjV4xf/?=
 =?us-ascii?Q?kkkdiJ5P+xEubpM6XBkgbcpajTxiXMRVaPqUMeJ7abbcX5AMwNMEhYt6BG3G?=
 =?us-ascii?Q?Dpbl/w/iIvO/zAkPgOlmrPFxeMyDZHWfPpXdu49pZdaHNBendVMnO+02FY/M?=
 =?us-ascii?Q?3AGBM8WaXsm+hpzGWWKjax5CgYE8F7AgdAQ0RAPDc3b9hcZ1OQTgpGbHgVZs?=
 =?us-ascii?Q?N9bOSql2Ekh0s3AchnFNMz0erlbQolPKncZBbkyDkawJfozAiBUxxDnuAvRk?=
 =?us-ascii?Q?5hwoKUd6kcrVxboNLr9ZhGnlX+G3lBK432SwTOFmCVCznCz8xEJW3mCxO6nK?=
 =?us-ascii?Q?Z7uVSIdIScbs4tVx8UYkP6EH8dORwFGk7BPE/ZkO+OdWXr1vniASalOgNGVH?=
 =?us-ascii?Q?t54Pdr5UvG9XUqUaA9go238uSyeSCbQ3Z+o+WBCzCH7swMPMk6EYEqwY4n+y?=
 =?us-ascii?Q?T+tBUqIpIS0fSN/tLAg4YtkMn8mp6EqAUQ/3sLTDifK/sQPhaPJ+dunCuYlt?=
 =?us-ascii?Q?bjytTGLevd0+4167gOBoBVFRO0whcNLoYQJj4hNFqTCcdGI3nbZrxQrJ2WFW?=
 =?us-ascii?Q?6bNkaMsRDpVZfE7+31KTudG5SCNxS/gD9PNVsSne7N44ncfVmeJ2CsiiT8bA?=
 =?us-ascii?Q?lWRNngQsYWYkUAdOOvti0hPlPTWYYnRFO9kpC4fDwVJuis362nbtmpqBFqAv?=
 =?us-ascii?Q?WzdclegmUyHFJtB32KNbgypKTj+ZJ2BLKC1Qc9FK84r86dc5j2IOPJJymPZ9?=
 =?us-ascii?Q?v3EWIhfXZ87lpqH05OmhDSQWZraqpHyQYkN7bTXKnGpTBN2R1m6LFNyy8gxE?=
 =?us-ascii?Q?kY5KCDXO1YezKA1XXrjAlgXWE9nuyDjelNSFffvaUptmYVBpep2bRZxzC+3t?=
 =?us-ascii?Q?/WyGFwwkx7aydokLGRok+lNfFtXt6RHdRaCIsz8KDxyEnP4pTQRgud5ljzkf?=
 =?us-ascii?Q?Zfle91vupAIE3nNdDVjX8eT/O5vTpmO3hxlU2pdUxHjkZWOwhcVNZXXNkz8i?=
 =?us-ascii?Q?ugPz04a0uQDNxa7MrFOKXUjJTOTfFuCSEivEYBHdv0bJ6IrPw1CrIfe4amPd?=
 =?us-ascii?Q?WwPhaX8+fanEgqkUArULbs/TaHd5cRHws8utxjyoKLKXrYFDwVOZp2taDldn?=
 =?us-ascii?Q?e9r+/zTzrv8KEtYLbC5KqKAV+3s2aJmrKAlFiwwsW089dWt/Iq9co/+2bf3q?=
 =?us-ascii?Q?6NXEEvqJriH8/96wLXqgsjgXK/+9URk9u1d2VaO1C4RuHbdzFKrQix3tj1NA?=
 =?us-ascii?Q?rzVRuMkYyyleRwrP7jouPMnA/YyvPzUp56nve9t9B/Obie3rXlsGmY76NxSg?=
 =?us-ascii?Q?/79UCUmbgeGDZm0rSvPvCn2TlDfw+wdnLE/Bod4RdREPhj3Hrlx6gqedAsvu?=
 =?us-ascii?Q?e+oXrqJJut0oOdUhOFiNxBOTOh8+Fbo6Ha1wypW97RI9w3GsFLkD3X/c82W9?=
 =?us-ascii?Q?Xp/t5m4E8j5qm7TNBzlhEs0d+3rpMmsw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RQgL5L2BkBhvb8KaGz7JAVYcB8EKrs048cm/CPhrZ7yjw+IYmU8KoOTlUbvc?=
 =?us-ascii?Q?ltbau70UA3NYzEoMpc9HBvJy1try2k7c8l5+AZDdE/9KqsIU5kUNk8WTRENo?=
 =?us-ascii?Q?uYvVnlgWWs9M4kSVhtIyp00XEkNngr41DEbTI21N+4zuxv9IpVqr4ZCMMr6y?=
 =?us-ascii?Q?sdrJRJn+19Kb/W8a0zAdM//95i/6prC2yIGPhjrMWfvdPnCU7gkoCcZvdW7E?=
 =?us-ascii?Q?YafNrwyC1hCicw6sKMIq4Qwk84DDI7w64KaTWDLzOawtiUvpiPuAAF5+A8l3?=
 =?us-ascii?Q?XIGBFx5dUNfyTTaXFFXG9s/jDCSqrzldTw8Ptn9EVBKxEaJlAUuKDjwGTpUt?=
 =?us-ascii?Q?9Fhs34m0ic94IF+A4kHB3jyso7SCWbOHwjxQiasJjM/IqYteLRVU0CIqHuBw?=
 =?us-ascii?Q?4RWKSLke9t0U9+WT2lKJulD32/66ZFUC/hD+io+0gsi81Bv3dvnNb06NwgqA?=
 =?us-ascii?Q?BgxDD76uNASuoIHNOPI378NhIfPhUkyXPag4/Mt9QZYI8MrM4qooYqzov8gR?=
 =?us-ascii?Q?V+rfMoFpUqIVyxrw3FHI/SA1nz3o4YxaXr6d2l647mfO2yMxPD5dAT1lZHC2?=
 =?us-ascii?Q?pjZcZnb3OMS0e2X5mcYQl41Fp7/0hMp1WO2rxdJhK0EpLb5gJSmbnWou+gJW?=
 =?us-ascii?Q?4WNfixK/UGVlx13piJ8IcnhIPMV0bRm0No5n9uOeGINKxRob/nkuFOYIUyxb?=
 =?us-ascii?Q?26j80ByD49LUgIQtxb00PA9SjFadG44GDwb1ezmVLxm/WdCxMtaBWOl/WgeS?=
 =?us-ascii?Q?5SG0FTXC8NPEyCajqPxfFoalBoV+par70p+IT+ru3tEivGYfqUUZAIlfEj91?=
 =?us-ascii?Q?MeGsMO972+ZdEUS67qpETEJAP8nwLIJBWxw615xgVogFOh0P4Z0qRqtBGy1J?=
 =?us-ascii?Q?0ROfKeWNUX2xjsu6NizvZmUttRq+XIxyFTxGXlx8Ms8CBKy67jzhnsYo9o9t?=
 =?us-ascii?Q?AclZCeuEDfobIf3BcCv74yCYT+dAUHA/IxqVw/UEQpUbeqGinPaycJCaVkxz?=
 =?us-ascii?Q?O3Qvky3m0zSmKLkob6ykcSuJhdNnLvi1bsizo8CMGLcbwTsAIwh/ovmEK78E?=
 =?us-ascii?Q?Z5/hGTrCCl++pLz1EwTkE8z0dY1SvQWLvwL+bFD6tf9XlFuLhIpIzMx9dp6F?=
 =?us-ascii?Q?O5E+EdvfBx/gu3N0ruW3pfPWsWVzdkB0nqzFCGBSa/WPFq8DXW+Ic5FzkHXL?=
 =?us-ascii?Q?KTY3vqYkhi4uuL61nhjfsXYT1fhl/Ox+/DIG46CRCqbuWm9GMOllsycGa5wN?=
 =?us-ascii?Q?Z5RjttjFeIQd3/SmlT0JgjPatfW+uglzJIJucFoVUpRx1uWLDf/rnSEHUK3c?=
 =?us-ascii?Q?fZ7CM7/+duQWrCogzY4Kang0LAe3jjKTrCDFY+P7kAuWk+DwJe/ZzLGUiuZT?=
 =?us-ascii?Q?YSgzFNQ53bCt6Z+ao6MRx36vJ7FIHagLmjAl0fCicOv/lKhswtT7VAos0sT0?=
 =?us-ascii?Q?iJE50Q2+bV5ybHI6Yduy9lYaLZkBOklbf4o8FgpH22yLMoM+PxW3C01ALwOU?=
 =?us-ascii?Q?1+F8QX/6o36Vn+Q1KH9kuyvbUVcjVEBaGLy0VnYzZAFrZ+7LNiriK+JxdbUM?=
 =?us-ascii?Q?eNEZHYRy/0KtY++0COssKemHXQVq/scEbe5lRxWA2AWYf6QCb4/z2zFN0/nK?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d6f61b-8d7e-4468-f33d-08de32c197a3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 23:13:38.8912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: af+CloD6QHkGFAxVrJPhLHpszzzCaOPA+1uO+fqMIe1tAbuvwVBaHDJIoVPeh9UaC2HxJoGAK78O5QfMT51v5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6197
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

On Thu, Nov 27, 2025 at 07:02:09AM +0800, Brian Nguyen wrote:
> Use page reclaim list as indicator if page reclaim action is desired and
> pass it to tlb inval fence to handle.
> 
> Job will need to maintain its own embedded copy to ensure lifetime of
> PRL exist until job has run.
> 
> v2:
>  - Use xe variant of WARN_ON (Michal)
> 
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c            |  6 ++++++
>  drivers/gpu/drm/xe/xe_tlb_inval_job.c | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tlb_inval_job.h |  4 ++++
>  3 files changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 347b111dc097..833d6762dd8d 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -2498,6 +2498,12 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>  			goto kill_vm_tile1;
>  		}
>  		update.ijob = ijob;
> +		if (pt_update_ops->prl.num_entries != XE_PAGE_RECLAIM_INVALID_LIST) {
> +			xe_tlb_inval_job_add_page_reclaim(ijob, &pt_update_ops->prl);
> +			/* Release ref from alloc, job will now handle it */
> +			xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> +			pt_update_ops->prl.entries = NULL;
> +		}

Do we not need to do this on the media-GT? Or is issuing PRL a single GuC sufficient?

Everything else looks good.

Matt

>  
>  		if (tile->media_gt) {
>  			dep_scheduler = to_dep_scheduler(q, tile->media_gt);
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> index dbd3171fff12..2185f42b9644 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> @@ -7,7 +7,9 @@
>  #include "xe_dep_job_types.h"
>  #include "xe_dep_scheduler.h"
>  #include "xe_exec_queue.h"
> +#include "xe_gt_printk.h"
>  #include "xe_gt_types.h"
> +#include "xe_page_reclaim.h"
>  #include "xe_tlb_inval.h"
>  #include "xe_tlb_inval_job.h"
>  #include "xe_migrate.h"
> @@ -116,6 +118,7 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
>  	job->start = start;
>  	job->end = end;
>  	job->fence_armed = false;
> +	xe_page_reclaim_list_init(&job->prl);
>  	job->dep.ops = &dep_job_ops;
>  	job->type = type;
>  	kref_init(&job->refcount);
> @@ -149,6 +152,25 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
>  	return ERR_PTR(err);
>  }
>  
> +/**
> + * xe_tlb_inval_job_add_page_reclaim() - Embed PRL into a TLB job
> + * @job: TLB invalidation job that may trigger reclamation
> + * @prl: Page reclaim list populated during unbind
> + *
> + * Copies @prl into the job and takes an extra reference to the entry page so
> + * ownership can transfer to the TLB fence when the job is pushed.
> + */
> +void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job *job,
> +				       struct xe_page_reclaim_list *prl)
> +{
> +	struct xe_device *xe = gt_to_xe(job->q->gt);
> +
> +	xe_gt_WARN_ON(job->q->gt, !xe->info.has_page_reclaim_hw_assist);
> +	job->prl = *prl;
> +	/* Pair with put after bo creation */
> +	xe_page_reclaim_entries_get(job->prl.entries);
> +}
> +
>  static void xe_tlb_inval_job_destroy(struct kref *ref)
>  {
>  	struct xe_tlb_inval_job *job = container_of(ref, typeof(*job),
> @@ -159,6 +181,10 @@ static void xe_tlb_inval_job_destroy(struct kref *ref)
>  	struct xe_device *xe = gt_to_xe(q->gt);
>  	struct xe_vm *vm = job->vm;
>  
> +	/* BO creation retains a copy (if used), so no longer needed */
> +	if (job->prl.entries)
> +		xe_page_reclaim_entries_put(job->prl.entries);
> +
>  	if (!job->fence_armed)
>  		kfree(ifence);
>  	else
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.h b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> index 4d6df1a6c6ca..03d6e21cd611 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> @@ -12,6 +12,7 @@ struct dma_fence;
>  struct xe_dep_scheduler;
>  struct xe_exec_queue;
>  struct xe_migrate;
> +struct xe_page_reclaim_list;
>  struct xe_tlb_inval;
>  struct xe_tlb_inval_job;
>  struct xe_vm;
> @@ -21,6 +22,9 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
>  			struct xe_dep_scheduler *dep_scheduler,
>  			struct xe_vm *vm, u64 start, u64 end, int type);
>  
> +void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job *job,
> +				       struct xe_page_reclaim_list *prl);
> +
>  int xe_tlb_inval_job_alloc_dep(struct xe_tlb_inval_job *job);
>  
>  struct dma_fence *xe_tlb_inval_job_push(struct xe_tlb_inval_job *job,
> -- 
> 2.52.0
> 
