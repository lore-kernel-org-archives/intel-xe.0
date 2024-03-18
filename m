Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12770C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 20:44:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CF81120C0;
	Mon, 18 Mar 2024 20:44:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mCTn/y+8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A191120C0
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 20:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710794680; x=1742330680;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VmnfiQgohYGkZkMNsvOk7geG/wSeW6Os5T664m2qqzY=;
 b=mCTn/y+8IuizCEifD0vjzmXLlulrhty3/1FnftGgE4s6hQG1EvLDJ7Oh
 LAM3WaaTGMjb3j7a4MjZCqMex4HlZ2v18HZW9WPHmgJQw/L3hiyeMjUEl
 I90cW6TKiQSVWrVj3XoV3f+/Qb83pR7pdifoWz83/FwTgMH3ObRiT9/TY
 mZ5nfdEhD7Y05MwazlaNlNNmdeF50F2W2AqyJZzx7mw+2F6dVK/k2B3uq
 03QXUrE+RRvBHPUJ1yWwOPHktdF+IdhSc5OJ+AX6MLymsYMPbGZjz3Xc9
 hHYHhtqabOHQthyjZNFc473XkcXY/pjxuhe4xhEye0MKDCKLfZQfyBAhs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16358872"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="16358872"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 13:44:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="18195946"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 13:44:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 13:44:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 13:44:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 13:44:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 13:44:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHUDbqfz5NiU72Z27cp6R7Xfl89hQy1ZGgP5vmK7kTYS01+aMJxs5p7lsWn1g3iEj7EnXpMEvQpQbq0zKiRcNQcxLtFML7FBU03PPQ1gPIJNp/i5gJL/SpPuoksE1sxbQk5Pi6qnDY0P/Y4EkjMF/NaTd2urSEsn0sx3W0ScFatdH0zui2ppiL2hkbJUcAqbiKXKLko+uwS6dbF979MLzrWgLPuXtA7fWAzYamECFuzGXDokalhxpdu6K/Xy4daV9xdViu4uDh8/hG6WJQ8m0bbx6svnkz0ZVqIA4U0EGGa8hITwrQeuVKlSWehH3ilx/d4bPJNFQIpZ8MDxRIyufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkpauK+CBnul+VyGd52/SErmX/DZwqJd6CXyZJx/reY=;
 b=nMr/Q8uUkBFvAhuGYkM+aQItuCMNQOHYSEeKJIShFfeAWQ9Q75JBj6kcsl+Z5HzNCR5dG30WZ1HGkUqjKIPJoStm5td1p4Q0ueZTMbzOu7ITFtdZAgsuhAoBrZjGcdT8+I5tc5S54FGTrvG0MCk70SmG0GQ3tXITurixRShZ4hulNKTKC6MDCJdOAk0AZwDQMEzCEh0FDUeGWoCqtmkvrwD4sRyjFI6p9HoQ6ZOXOi3Y4/h63VV4CoMpCrHR0a5HbYgHxDsez085L2YfuVlwubtonDTynwcLwvWsTgmUqEiNp7qp/4bl7avmSN8IQrAlhXY5K+Go82LE5I7y0iyZAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB6621.namprd11.prod.outlook.com (2603:10b6:a03:477::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Mon, 18 Mar
 2024 20:44:35 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 20:44:35 +0000
Date: Mon, 18 Mar 2024 16:44:32 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe: Drop bogus vma NULL check
Message-ID: <ZfinsMiI7ptWiiqj@intel.com>
References: <20240318093547.16326-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240318093547.16326-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BYAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB6621:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bMKv8QiSMSkS/0xqWrRTRta0FJlpOtQWbA3EZbgmy8383wdXNiMDQKNK3hd4XY3vdAqTpVHUcZxx2MMFOOc2dlOHfx/X1gIxEgUQi+Lz+6P1pq8qPXNUMxh8bYZirksCdB2XBjudARGNqaRgdtgwoZ7R72/KWuiKgOcrPbgyppgKuMtC3zEaXSSrBIFMIK/GqvY9zYX3YSViq4uYucgN4XknaYlUpTBgsY5bdLq58jwKczrWXJ3+PpTkWB/2MABNnbl5FLdskItvTO/wuhX9gjKJ1y8vVI1Cqc+LmN4WoY/iywCc31tli0R1ftxL4h9BTjeq7daH2JbBz7V9wHCxZbDXheUCUayz5tBB09712IWhuCapLk8cPVcSRRhltQqZarZ2/m6yNf3fw8da/s36m5npGEPDk7AR6b58k2ysAyAWOM3oQs0kVArIMR3/oLmHZrx/ti9qbgImwcDSUBpLkBLcJUE0h1CfQcY55InGp/mqnahu5MgUOzkYZOiapoYGW1+TpC8KqQz6Iafn/JlHLzOUTilaZu4HRyPNmcse3aFf/74zcZ6WQBskvNf0f9aRN5Ut7jaqgW1PfsCEBVhwzqbcVOrFcqnXxLautz/+ZLsWo6K69BKK/Tm7a99ZdTiWDS/N+mK+LL9CQaHOpuNegGffOPpKCxv9xzxxAU0d8r8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KmP8oudXmTcvMntvY4tLSDlIacnrxbE8Tpx0SoWYGR2LaaIARP4ZlcNFxga5?=
 =?us-ascii?Q?Th9rMMRMDz9RuH8sBkhDV01iU2ZmUtlDdwtlRRUgwoDNE9StrdRBXILKid1z?=
 =?us-ascii?Q?VQHndZj1uE3N5jgX+lXHGEtCvhhedGoWvSVOHDTk9db2ysFNNF/3bI8L9PA5?=
 =?us-ascii?Q?d6LhCrECdN0aI4h56Wve4wUqNfl41eeySlb8XLF+JiXMLj7ydQUVDBpTU6Wa?=
 =?us-ascii?Q?uex9NQFt4MniDWqNxMJB3V0ugPgGcUh/5P8p/+fNRKXWhOAK/JagaSfhNT/5?=
 =?us-ascii?Q?OtVu4zAfAlXA3E01DjZwzmeq5r9tn8u52qF424NzEvj+fupKIfaLRG29ej08?=
 =?us-ascii?Q?EBBCxZdOtXO9zrsn9bh014+na3vDcGEolUc7qPHKBg3TqyKDmfHmQ27KMIUO?=
 =?us-ascii?Q?l3U7PK2lG0RifwwZ/fWdF3NxcS/aGTkuw2+nwFsN3P11lU9qVxYNOa9aHOXW?=
 =?us-ascii?Q?zsvPQTOzlq0xmdzOUNfvIn5g7u1i4j6z0kA2lK83DQox6VTpCUGG24Hq7UxH?=
 =?us-ascii?Q?fcABknaPw88EBIoQ50kdTjMy+nogwoblgywxvT1Aafc6LPqoqWnrJBbN9bAy?=
 =?us-ascii?Q?Q84tnn0OPIuZvpKhrdIObL/4Jp1d3qaIoa2lLaj8flnoZ2RtZqnGpU/OoOES?=
 =?us-ascii?Q?pjqM7foT911CuvWF1oogZvgUMzZy3ynO3VlnWYwLxhJp/Ntw8gZtElDOFlTc?=
 =?us-ascii?Q?T59OBl/u8+MmTcpmub7mQz9uIv4CrAEAmIsuZT00sNHrCxf+IjpcJ5giPVoZ?=
 =?us-ascii?Q?vO5Flt69KOkLMe9Kfjh0vn/amwFnXzo86XLkYJpJsa7m+acaaAvNXMP2V4KV?=
 =?us-ascii?Q?wLbg12lfkXbhB6VaTNSUGCnWa/3mBcQ7PDoXmrpJevF4e8gVgcQMDCuJMqG1?=
 =?us-ascii?Q?pJR2pzz5AQr6HaVTry/+nuQ8j0VCbc2TM2W+dZHarQYUjUINmg3lRditPydN?=
 =?us-ascii?Q?bJd38zl4a4gEPEbHEJUrQYQvxF3LkLOXKbKrM2MgZ9Q9VK2lyJcp0Erju7PU?=
 =?us-ascii?Q?5WyIxZcWAlztgSakUOr6U68tOx3L7U2Cjg8olDQLik2ohayHWl2OQIiBq87o?=
 =?us-ascii?Q?vsph3RaSZcpBCVgNv/GE//NTw3aZXfs0SPbJbuKC74D6JpsHuFqDs4zaig08?=
 =?us-ascii?Q?UZynpyk07xWOczdAiwlcgiihz2OMbdB8wYH5Njg6wtgQbc94bk+nft1X+H1h?=
 =?us-ascii?Q?czz2jeMS/5JZFcAFXDGGrKOVGso8NN45zWyD7l/63+jF3eYadIN1tiP6wd76?=
 =?us-ascii?Q?1mp4RaWlFn7JSMexqLaLx2zEmRvm9ya8YI41ky4zOteTRpN9HUS9pyYcN/sd?=
 =?us-ascii?Q?HLLD7YrsjqJB+97co+TR4X1Uj2UcNAgscjlbVvlLosWjlvsbX5/24SKyb4EI?=
 =?us-ascii?Q?i3RKfTQrm9HrTwK42yUY5U9hq984rgbMl0lZFCIAoC4yAaycqH/XKrXIRJnk?=
 =?us-ascii?Q?k99biN6uDCyVnw0walhphrSzWD0aI+dQM4HediIKfDQ70REDmtyLIOED0ggB?=
 =?us-ascii?Q?7ldTW58RwBNemcMRxbZfSZGt47/oWf4eXOXayUAbfzuiM3YT0/VvClora+Ms?=
 =?us-ascii?Q?DSynkJMFYGQPahInrOl5AJuyOgwZBLCJaq8GVW62X6XKSEgqt2/QK7nAf686?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab1801dd-bdf5-40ac-5179-08dc478c38da
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 20:44:35.6771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tVoojvg0zacqQI7QcdaUZP1UDtwZYrfrBNBi7W/QEyLwK2+b/ngIKIo9d8ym5lBBp9sS4JrImZy+vCpNd2Uzrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6621
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

On Mon, Mar 18, 2024 at 10:35:47AM +0100, Nirmoy Das wrote:
> The vma pointer can't be NULL here.

indeed, otherwise it would blow up a few lines above on xe_vma_vm.

and it would had fail in other places before this function
is called.

So,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 7f54bc3e389d..8d3922d2206e 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -618,7 +618,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
>  	int ret;
>  
> -	if (vma && (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
> +	if ((vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
>  	    (is_devmem || !IS_DGFX(xe)))
>  		xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>  
> -- 
> 2.42.0
> 
