Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E22ECAC5B9
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 19:06:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E661610E2D3;
	Thu, 25 Sep 2025 19:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zr3wFLFL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3366F10E2D3
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 19:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758827190; x=1790363190;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=UpiHVuy0OERbNebg4wef6cnWt8+bVflg1SGzB2B+YDw=;
 b=Zr3wFLFLi5LzP9KnNzW/zyggK2c8yRIRv2iCIRtPOdlJZYIHnRODDFGG
 QH2QlD0qKzUqrZLz9EL2VYEqw1l5edeDSZUxTBfByq3f50nQdIRS3GJ6T
 771yY3Qok0jaePUUSA44qQOrRGTxkMw31/os7uE6eHI+YJdCQ7txfXM9T
 d47sxDE16PfF7vsQ+9XES2DY4diFxXOiAvqFsPaWwNFXSihVNRo+aFpd4
 ko9sKfUYihNszVud/LZJ0end1O3fFittuAVDEb9JFDFpl4qew+ueIP/x3
 Bd1WCQCsyxQ1TsHN40OhKgoCnvx4chFm1YgCYlaNx6x87lNtO+YFlQd2O Q==;
X-CSE-ConnectionGUID: S8svC2I7QAKMb+zb9jYMZQ==
X-CSE-MsgGUID: 1evjRD2JQ56nEaD8BADfVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="72519482"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="72519482"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 12:06:30 -0700
X-CSE-ConnectionGUID: XDIko3d5Rj2Xk1GlwnJ6JA==
X-CSE-MsgGUID: qhwTvoMcR9WuW2PhsHfk4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="177469838"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 12:06:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 12:06:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 12:06:28 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.40)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 12:06:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x10Y3TE9aFyQqmmqU+G0Hg+mFZjUSjEeqdIAQMA72r6TcARWshP6LcngybhGnOJ0SEs7AOYeFnLG3RBvJmFzrRN2JA0ryG5A4urEoRo5EsahxgIsbejox972TFtGGlpPA17h9SVZuGSCqv/p7cqP6CUZw7ifv6sfIavgMWnSpsZQ/gD95nQCpE0Y/HeftoRtsjqSLkt1yyJs99z1P88OrAKLC04XYNH2v57TvTlKoS3XxPwCCYbVXu57bU3O55gi6svkeq4SpEoV/QKQ6+f30Ny40dqBqnKUFSPaxSpXI5cWTOIdg2dp1cOLG5DmR53W4/afbEVC1Eve1EAUenLgnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNH8Je6Ny3VsFsSFUg7altbsKeShqqH9UEqIkIFluyg=;
 b=n5H6LEmtq7JQJSj9sKGk1ZoxLPjKutLgRVj+Chx591Bf0p+OrgBoQ4MacCFvzaM2JfQlp5t77aWjRjBJPD6lJWD2za8lyYhqgrkSu3KM+nI/kahXW/QZR4k0win6i0bWgH8vRaxkrwkVFofUoSLiYnY3asdAVUivWQVdGfCGbgU5zt7QXvwraPtqL+3DpQhTLN2DOLq8RnACQF4/5hPDKnCIpFfQGcjOubNa3p+efJaEpSO5jem9Fnjo6YdXgMo3beIdEWlbn2H2JKMNsyk5N1cfcp8A/pE5ip+0fb1G4t4fp67UZA+NYc5c7IwGZ8BS2brfD8YAi8537316JrhYKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8059.namprd11.prod.outlook.com (2603:10b6:510:24e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 19:06:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Thu, 25 Sep 2025
 19:06:22 +0000
Date: Thu, 25 Sep 2025 12:06:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 18/34] drm/xe/vf: Wakeup in GuC backend on VF post
 migration recovery
Message-ID: <aNWSqw1IH57zGN8Z@lstrano-desk.jf.intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-19-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250924011601.888293-19-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR03CA0251.namprd03.prod.outlook.com
 (2603:10b6:303:b4::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: 91352d99-73ba-4af7-0a7a-08ddfc669da0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7A26fEW+KqxK7YNnIbysOa7FJJNqPdXib0e0p7V6bryQ8R1fc4gZXc4b+fjw?=
 =?us-ascii?Q?Qaujm3Y94+oXgC7oN5JL+8vbQBYvzyhA5vtg9VFDfE/GtYgAP+6mH1dL9T4H?=
 =?us-ascii?Q?0HDrGhfo1/ym0cT96cXXijRheaPOWghoYhnoGhjehxCbcSwfEfbpLCfvYlhw?=
 =?us-ascii?Q?egvOj+ccGVqvvMr+EZmzoTsckIkshGjqHI/ZCff3vTfHFFhp6RqE/PcTfRn0?=
 =?us-ascii?Q?fJn50rgHyd3q58yKqT0czv1eMTmAQIoUAexovt+VPRtZoU30wp9mkJu8reJ2?=
 =?us-ascii?Q?QRfGvgU7/q7SUhuhfSi8xxd28J7QmhqNjSRacgZNIwsj9LyX7uuMEGjgtX4Z?=
 =?us-ascii?Q?X+Kz1sjCD/vJFe61AaGQr2iMtMQ8mx1zLv2bxdW0cUA7Fhk9hTNbbDmWmQF/?=
 =?us-ascii?Q?96cttrzmz77EzCueUQUi9DUd+Hcp/3XTCw2NO8TXN16oMwZ1dQHc8M6mIlp7?=
 =?us-ascii?Q?HRGgfQybI2yrJe6Kcpyq6uzdfivzJSIyqjcPFqedxe3SD3tv6PP3HM1y+Yej?=
 =?us-ascii?Q?3vM70Cx3ib3Ir2UbgfT9+i6w0SockEOD+0Ss+wwEgRWeEin6vsSCl5E9G2jf?=
 =?us-ascii?Q?2wSUBSWK+tkwJlEkMO01H3IeiBZq5ePEd1XDof8dNTN7bdrFe0dfIxDgynRX?=
 =?us-ascii?Q?FVhe0biGL4mtzE7tHjK4PhHz+CebKfGHCITjKpGpkXKSyfEpY5qNr0vbWhGi?=
 =?us-ascii?Q?KW3yn/Vc+S3cvrCDfvVHwETEV0H5TDWzTpA5cHmakoAB8483Rmm+TP32c5OJ?=
 =?us-ascii?Q?yKPrG6UZJcVuH+BDO0H4x8C6dbTSISpk//257HlvqBg16odpuDWzRYgqQ34i?=
 =?us-ascii?Q?VOqkVosTTHJfYh1tuEpWe3M/+F0PmzjaYC2qc09J7CrrjXa7b5Tr/q88VnGj?=
 =?us-ascii?Q?UXoTaZ4MHr0ZslPqHSn8HDb7KQ0icmyybT0jOBVtFpchl8juN2i2SUVu9qoU?=
 =?us-ascii?Q?MukS6JzZsW2sTtiKBiJNFuR5ESD6EXvoN2hJk9vUltZSBsNmW5qSIyjX2N1q?=
 =?us-ascii?Q?kdSImgacAEkAAurWPiGMhiOo6AEKKjj0lt5QTVsYODX1vZjg4RZ8h4zK0Rwn?=
 =?us-ascii?Q?do5uG8u3d1+hyypNhMVRFidxPktdATp3RuK3tOipKTZjvDdsvz2kAEt4GLrJ?=
 =?us-ascii?Q?LVDlpPsQqmjiqVHZ9KHbiBJ7xEg/jr5PrHD+PJe4UJfTeBiNfbSYzUkE2bAX?=
 =?us-ascii?Q?e9+i+oPwOt7fKk+pnSfJsHvS6fnbXrMTszE6E9rEj51fIx/ZrVEbH6q9/IJQ?=
 =?us-ascii?Q?7m8xH6E1e16YtJetfoQk4/nGvKd67Wzsk7BxpmTKywIvaOuOzgo+YsCtNGwV?=
 =?us-ascii?Q?tqVS4GwhG0X9Gz6/WI4qxZvSJrTQ2GGDfEjD623+49BLqjUuM/rScHmORFDY?=
 =?us-ascii?Q?pWmjan9bB/PJMADdT5dUmwATENIOXEeWYCnfwDTChfHIjRp3CJOoEUVBfFmR?=
 =?us-ascii?Q?PsyKB9Lb+TEE3KRSTUjmx50nzu012Q6f?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jL8NLaOCT5Qy/RS9CXiS/Hhl2Kog6Asz9clSVAnE77bc3EnuqAQjaANYF0am?=
 =?us-ascii?Q?3XfXuHV8WjCiPMuwOJdD+GHOkCJU5TIg9pkkhs6zogFsPfOXvYrxY56tLRda?=
 =?us-ascii?Q?AC8ItmOklojMFOdZU/sbUPyl234uq32Rm3ubJ3S1HxSGHkeklH9EeTEvvnTK?=
 =?us-ascii?Q?rpsm16Otp2k1swxrB+gZZ+rN1mpa25ZNAHTpa+KK+BmFZ9vX9E7k/hLh7zVr?=
 =?us-ascii?Q?5nZ7ChLi3UmCQ0E/wf1Q9TMKbFL4QidWdtjU82ywUtJArfnmnRDrZOibJnbv?=
 =?us-ascii?Q?7iRvh+P++N1cxzQwtH0Z973m5D58EvJonyJxKg5znFBh1HFHhdJiHjQjosxm?=
 =?us-ascii?Q?FityPPFDlQ8LsjH5PRtGfkSIr6kqHQyqB5ah7YnxblgpjoNOrRtCiUK0euPu?=
 =?us-ascii?Q?1Kbe7QtG181DyHS7W9lHWZfPzhzeTvEETCkjRKBdeW4JOQfruuUCQblvlqGA?=
 =?us-ascii?Q?FeiGsd+UBn8dZ2AzCPDnsQ2qBv/T9SdBkYpwxWH9MChTfDoef9uO5g49/YUL?=
 =?us-ascii?Q?JIY4SqeJubdGcQBhdEhKE71CkfHUjqNmORK7wVUUWqVRqn1HK2U2jtm2rHrx?=
 =?us-ascii?Q?T0s/Wy7K5zooWek368+NZqvw3fdsnNCtaQ1bAc5hu+EfaHf+Ri8axcIuIn1+?=
 =?us-ascii?Q?s6Fsl9iOuRNBSBRCfC44IWigEL3yyZq+Q8ZtIQ3qoKO8NshjHqSN3KP7U33e?=
 =?us-ascii?Q?e0WWlAScL34diTQb5AZrUpJef7NaRcNNt+L8TYjBOB/5Xdm3C15hZx13d/8q?=
 =?us-ascii?Q?bYIgwVxqKbZ4Zg20gh7a1wR/P6lYlOOgjjDinvtbehbKu9lyttCJHSB78lqI?=
 =?us-ascii?Q?GyPKXOOHy0de9QWtFaIx+9LgZY2/UhEq5fpH7cESEFLQkLS6eGLnT3FHcUXi?=
 =?us-ascii?Q?zVUkr7opzoq8sl+HahwJZjil78qG3Qbm0wcuQJYABWNGVwn5Ysh25pP+AMxY?=
 =?us-ascii?Q?5yEoTt/tmw/Uz2/AQnP6V5Gb+zm/deRkb9NOFiIRgg87YJRlspAHaaiiozuQ?=
 =?us-ascii?Q?TxBY5QkPJs8Q52Tc0iYTRx2KgYlx4d1oR/cZeJNTW1CK+UxFssDR5xPHt3uU?=
 =?us-ascii?Q?bYEAO0ccysfLwLmxOs4C+2qskh7M1nFpF1P1O4h3uAPPOQIPOK2xan9WHQob?=
 =?us-ascii?Q?8fX9crcjyxWUKazIV2F4/lGrwQ3wADtQVkS1W9+TRSzeBckPw9Ha8tNhRXSo?=
 =?us-ascii?Q?BrOcZxHSdip+h3YFdGtf05KCRuSx6Yd2gh45Y3nw/01f29kCOA8KHVi+eMIb?=
 =?us-ascii?Q?sWI6Pz1LQCkWYjIpQRi9WGwlu2rmCWDti9vt5bdx7YuLaYMuJByKxeEhwnE3?=
 =?us-ascii?Q?e0nDfbCrgBkjLceFs6p0AQTLChWmeOaJ1XhZOa/Bc7JfTie/KG57S923PXQW?=
 =?us-ascii?Q?J2CsggL5+xV3fLJR1gdVSsT811xuDDwv2KrwIySLo7De9pPfS3kRL9h62PAM?=
 =?us-ascii?Q?bL2iMKI82k/izU7mW5/Yib5SGy22H0Z20QMqq9ulIyfh1/uLHnZszY9PbKyF?=
 =?us-ascii?Q?HCygkhF9eJcIxJWrdHxJbTD2g6KgmuPgfF9FlNk7EyYBFn96GyRI444OiuQ1?=
 =?us-ascii?Q?/qBoUWIkaNb/S8F3nmze0Fi33PCGu8vUbDa8U/3b9ZkmA+2DyrPlS/g1HLXW?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91352d99-73ba-4af7-0a7a-08ddfc669da0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 19:06:22.0144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: udbbO2AROUEg9pYd1I/iT/cA9BZ7/uPr/Hyk17WMAcwxKIQUJzcUkDvKNtVqvkiaccAt2oY3ZtWr08BTfpOPeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8059
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

On Tue, Sep 23, 2025 at 06:15:45PM -0700, Matthew Brost wrote:
> If VF post-migration recovery is in progress, the recovery flow will
> rebuild all GuC submission state.  In this case, exit all waiters to
> ensure that submission queue scheduling can also be paused. Avoid taking
> any adverse actions after aborting the wait.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  3 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c  | 51 +++++++++++++++++++++--------
>  2 files changed, 41 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index b8e02bba7360..a96e0dd65bc1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -815,6 +815,9 @@ static void xe_gt_sriov_vf_start_migration_recovery(struct xe_gt *gt)
>  	    !gt->sriov.vf.migration.recovery_teardown) {
>  		gt->sriov.vf.migration.recovery_queued = true;
>  		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
> +		smp_wmb();	/* Ensure above write visable before wake */
> +
> +		wake_up_all(&gt->uc.guc.ct.wq);
>  
>  		started = queue_work(gt->ordered_wq, &gt->sriov.vf.migration.worker);
>  		xe_gt_sriov_info(gt, "VF migration recovery %s\n", started ?
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index b82976f031e5..52b86cab4ec5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -984,6 +984,9 @@ static u32 wq_space_until_wrap(struct xe_exec_queue *q)
>  	return (WQ_SIZE - q->guc->wqi_tail);
>  }
>  
> +#define vf_recovery(guc)	\
> +	xe_gt_sriov_vf_recovery_inprogress(guc_to_gt(guc))
> +
>  static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
>  {
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> @@ -993,7 +996,7 @@ static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
>  
>  #define AVAILABLE_SPACE \
>  	CIRC_SPACE(q->guc->wqi_tail, q->guc->wqi_head, WQ_SIZE)
> -	if (wqi_size > AVAILABLE_SPACE) {
> +	if (wqi_size > AVAILABLE_SPACE && !vf_recovery(guc)) {
>  try_again:
>  		q->guc->wqi_head = parallel_read(xe, map, wq_desc.head);
>  		if (wqi_size > AVAILABLE_SPACE) {
> @@ -1192,9 +1195,10 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>  	ret = wait_event_timeout(guc->ct.wq,
>  				 (!exec_queue_pending_enable(q) &&
>  				  !exec_queue_pending_disable(q)) ||
> -					 xe_guc_read_stopped(guc),
> +					 xe_guc_read_stopped(guc) ||
> +					 vf_recovery(guc),
>  				 HZ * 5);
> -	if (!ret) {
> +	if (!ret && !vf_recovery(guc)) {
>  		struct xe_gpu_scheduler *sched = &q->guc->sched;
>  
>  		xe_gt_warn(q->gt, "Pending enable/disable failed to respond\n");
> @@ -1297,6 +1301,10 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  	bool wedged = false;
>  
>  	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
> +
> +	if (vf_recovery(guc))
> +		return;
> +
>  	trace_xe_exec_queue_lr_cleanup(q);
>  
>  	if (!exec_queue_killed(q))
> @@ -1329,7 +1337,11 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  		 */
>  		ret = wait_event_timeout(guc->ct.wq,
>  					 !exec_queue_pending_disable(q) ||
> -					 xe_guc_read_stopped(guc), HZ * 5);
> +					 xe_guc_read_stopped(guc) ||
> +					 vf_recovery(guc), HZ * 5);
> +		if (vf_recovery(guc))
> +			return;
> +
>  		if (!ret) {
>  			xe_gt_warn(q->gt, "Schedule disable failed to respond, guc_id=%d\n",
>  				   q->guc->id);
> @@ -1419,8 +1431,9 @@ static void enable_scheduling(struct xe_exec_queue *q)
>  
>  	ret = wait_event_timeout(guc->ct.wq,
>  				 !exec_queue_pending_enable(q) ||
> -				 xe_guc_read_stopped(guc), HZ * 5);
> -	if (!ret || xe_guc_read_stopped(guc)) {
> +				 xe_guc_read_stopped(guc) ||
> +				 vf_recovery(guc), HZ * 5);
> +	if ((!ret && !vf_recovery(guc)) || xe_guc_read_stopped(guc)) {
>  		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
>  		set_exec_queue_banned(q);
>  		xe_gt_reset_async(q->gt);
> @@ -1491,7 +1504,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 * list so job can be freed and kick scheduler ensuring free job is not
>  	 * lost.
>  	 */
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags))
> +	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags) ||
> +	    vf_recovery(guc))
>  		return DRM_GPU_SCHED_STAT_NO_HANG;
>  
>  	/* Kill the run_job entry point */
> @@ -1543,7 +1557,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  			ret = wait_event_timeout(guc->ct.wq,
>  						 (!exec_queue_pending_enable(q) &&
>  						  !exec_queue_pending_disable(q)) ||
> -						 xe_guc_read_stopped(guc), HZ * 5);
> +						 xe_guc_read_stopped(guc) ||
> +						 vf_recovery(guc), HZ * 5);
> +			if (vf_recovery(guc))
> +				goto handle_vf_resume;
>  			if (!ret || xe_guc_read_stopped(guc))
>  				goto trigger_reset;
>  
> @@ -1568,7 +1585,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  		smp_rmb();
>  		ret = wait_event_timeout(guc->ct.wq,
>  					 !exec_queue_pending_disable(q) ||
> -					 xe_guc_read_stopped(guc), HZ * 5);
> +					 xe_guc_read_stopped(guc) ||
> +					 vf_recovery(guc), HZ * 5);
> +		if (vf_recovery(guc))
> +			goto handle_vf_resume;
>  		if (!ret || xe_guc_read_stopped(guc)) {
>  trigger_reset:
>  			if (!ret)
> @@ -1673,6 +1693,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 * some thought, do this in a follow up.
>  	 */
>  	xe_sched_submission_start(sched);
> +handle_vf_resume:
>  	return DRM_GPU_SCHED_STAT_NO_HANG;
>  }
>  
> @@ -1794,8 +1815,9 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>  
>  	if (guc_exec_queue_allowed_to_change_state(q) && !exec_queue_suspended(q) &&
>  	    exec_queue_enabled(q)) {
> -		wait_event(guc->ct.wq, (q->guc->resume_time != RESUME_PENDING ||
> -			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q));
> +		wait_event(guc->ct.wq, vf_recovery(guc) ||
> +			   ((q->guc->resume_time != RESUME_PENDING ||
> +			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q)));
>  
>  		if (!xe_guc_read_stopped(guc)) {
>  			s64 since_resume_ms =
> @@ -1922,7 +1944,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  
>  	q->entity = &ge->entity;
>  
> -	if (xe_guc_read_stopped(guc))
> +	if (xe_guc_read_stopped(guc) || vf_recovery(guc))
>  		xe_sched_stop(sched);
>  
>  	mutex_unlock(&guc->submission_state.lock);
> @@ -2075,12 +2097,15 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>  	 * suspend_pending upon kill but to be paranoid but races in which
>  	 * suspend_pending is set after kill also check kill here.
>  	 */
> +retry:
>  	ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
>  					       !READ_ONCE(q->guc->suspend_pending) ||
>  					       exec_queue_killed(q) ||
>  					       xe_guc_read_stopped(guc),
>  					       HZ * 5);
>  
> +	if (vf_recovery(guc) && !xe_device_wedged((guc_to_xe(guc))))
> +		goto retry;

This retry loop can lead to a deadlock on VF post-migration recovery. It
appears this work queue / item not finishing during VF post-migration
recovery can interfere with VF post-migration recovery worker getting
scheduled. I have solution to return -EAGAIN if vf_recovery is true
which the caller catches and reschedules the preempt fence work item.
This appears to break the potential deadlock esnuring the VF
post-migration recovery work item gets scheduled.

Matt

>  	if (!ret) {
>  		xe_gt_warn(guc_to_gt(guc),
>  			   "Suspend fence, guc_id=%d, failed to respond",
> @@ -2187,7 +2212,7 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
>  {
>  	int ret;
>  
> -	if (WARN_ON_ONCE(xe_gt_sriov_vf_recovery_inprogress(guc_to_gt(guc))))
> +	if (WARN_ON_ONCE(vf_recovery(guc)))
>  		return 0;
>  
>  	if (!guc->submission_state.initialized)
> -- 
> 2.34.1
> 
