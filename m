Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5747C02180
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jan 2025 20:32:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6A010E11F;
	Mon, 13 Jan 2025 20:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EE1RGyPW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D26010E7D0
 for <Intel-Xe@lists.freedesktop.org>; Mon, 13 Jan 2025 20:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736800372; x=1768336372;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kTOGweFb7ArGF53rMYybgf1f31ine+c6xxf2J7bbsmQ=;
 b=EE1RGyPWoxc6JLmmCURVDyrHb9C1TKAepd1h1SWjAadFVEfhEH0C27i6
 DZ5z1/QnGGmHT9NRbUxQasQmzrhijlsx1fnDFGY6Mi9yTm50qDmKHvvjC
 k5JAv/gTntR67Mkp5MwXuiRP7VAbj6anspDTBOuzmYQgYSSydPEOXDw5+
 G6Ifi827QVUq0af4GOgrImF1V//7B88PxBtNti/AzU4HC1cHGlAZDycHM
 eo170XLvU9mERSf4/UOF5JvM38ejDgBsXWwb+OP4Pl+qvlaSxZEUjKG60
 mRAf95fvoyKUYK9jfjOBtWm9eS6aIs54TYkj6WlqRpqnxtkwiTq0/Nt00 A==;
X-CSE-ConnectionGUID: hYdjtEFiTwmzqc+rlItakQ==
X-CSE-MsgGUID: ZIN7dt1yQYaMH9XEZbjVUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36291785"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; d="scan'208";a="36291785"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 12:32:52 -0800
X-CSE-ConnectionGUID: vTr52hV9TQm+TnFdcuG0Lg==
X-CSE-MsgGUID: ews5ExgkTmiC4z4aPKMXwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108643832"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jan 2025 12:32:51 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 12:32:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 12:32:50 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 12:32:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGov3csqFOTbyQOvUQGh5Yy75otIWeOpVXYJDg14hILrxQXb6JXbTFjkNSFPfru/kYKq7l/lQbSqQZGkCFBALk2uH51jGfhZytqudI+8c5jKK/hM9T8kcs/XDJnKGVtLFcIG4uMFJVFnXZOdOKDkQ8japQ8KDM4djjAeN9wQV+ue5GlNE7qIV4TOfon6yXSCvGTrB3oK6CBq50P0a5yyWHSu3tHENALnAroqih3jxSCjbFIcUH40+ArE3Huot33F8UGveLxnFVKdZTw8KNjgfjOyWz+a7dzE9xR7EhwpyqcE+FoV3cpzLMPpbRpZlmKC7LwXRSYn7g8gQYSH7L3oZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DreIr5tzuwSgwq+o9We33U6Seg/QRXUzclu8BtoyHQM=;
 b=dhmOZz2baWuo4/g9NMtnETc83OIXv1guVbRCuUDXsSxW+MUMMHVDLDQBAzC5Ukff6O2viwhb4Ol9SDYvTZOeQAC16sRSaU0cqILzVPDsQqymx3P6TyIAVCw0ZGPIJrhF9Fp1HDgkK+Sw2wEYAauiAHshlbk2AoMKJooCEee/yNWNRNTlgYstfoMyblUsZGTQ+O5I7WixoExy0NoALHCX0NXwW8dKj4OeTFBJJp1mhfCuEugV1c1dS8YKZYPMKMzbI5UxSLjeuEZhxuz/B36AwYjGfXRmPrQImDLPGeCfkFy5ie8Rv2qeMxl89mRIScvUv5SXBVwmWoePcwdRETA/4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by IA1PR11MB7919.namprd11.prod.outlook.com (2603:10b6:208:3fa::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 20:32:30 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8335.011; Mon, 13 Jan 2025
 20:32:30 +0000
Date: Mon, 13 Jan 2025 15:32:26 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Drop error messages about missing GuC logs
Message-ID: <Z4V4WtZbvg_Qql9H@intel.com>
References: <20250113194405.2033085-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250113194405.2033085-1-John.C.Harrison@Intel.com>
X-ClientProxiedBy: MW4PR04CA0137.namprd04.prod.outlook.com
 (2603:10b6:303:84::22) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|IA1PR11MB7919:EE_
X-MS-Office365-Filtering-Correlation-Id: 86b2ad77-3613-449d-73af-08dd341166a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Cprrr0eFpeT5Ai4zQsEzl7UPF5xz2+/Mq80Xlg97dE/h3R/AwijCPB74PVcZ?=
 =?us-ascii?Q?Mm72IUFkJzYkG73NUvXgxzA8sH9sx2D/4ZTEFx9RSjDz1IA5u+L9VZmcdrIx?=
 =?us-ascii?Q?UBWMnA1O40V61YrtFFUbJo/wB3Bula46yjoyi62O9UgBRIWHr4b3By4xTfLt?=
 =?us-ascii?Q?rr5nvb8h6JmEHFQueveXW13X+SPck4Ya/wPaOLsHyVry41zCCkRtDT9NS4yo?=
 =?us-ascii?Q?5+RRPuiZv8m/E2h38/GZ/+bd4G45FvM1CYkhMq99O5mztnFEi1z1UftZPtjz?=
 =?us-ascii?Q?2c1VrpGxJZZJ16SFsi8qO69z1PNn2eTYhA9N4/m7nEOHVdfbgS4sWrvRmWsV?=
 =?us-ascii?Q?S3aCbfvsl3RMykhglICdFiKpo/T2V6dL2wFHjpmLbOemibMZUYZYjO2n8uZk?=
 =?us-ascii?Q?1KW4vupoFzbxc3gJjj+5DY3SSk+pHq9SgdJ29C6V25HqpD92iSxuejBqiGLW?=
 =?us-ascii?Q?r8q+xTrzkTq0mlar9khCRmHghSBBAGVZW+YWTBH/6u7jlhY2dQNDgG5iFMh/?=
 =?us-ascii?Q?hZoiAkgBRqAKNmOAMIh2GYlcXerN6srbrfk8dChnCWh+QA1+gdH685Zqk4d7?=
 =?us-ascii?Q?B4gA7dISFwSmz8OrTFypWST8Yt0JIWARIQy9r2PlFbg3rK/liS8Au72slGZn?=
 =?us-ascii?Q?4gjvVlKwtE6r+3Pda5r+Q4gqIgD6RW8VQOhbxAFZXBpyLgw71haht1lKqj3R?=
 =?us-ascii?Q?yP+ENT8WE8H2yHvZYbI0+cx1YbA6twDpa+buSHbbIcx1L0+eGSN15y0aIuu3?=
 =?us-ascii?Q?cbKtd+1vp0IG937A/5ZlNIFvQhJ98fBImIVUbnh4En9A0oooo6JWcazpzvgq?=
 =?us-ascii?Q?trBk0im9D8aE7T+z0XIxGCFoXrVMkMJ3qY2Kb1V/mTl2tZhX5VdlMaS8yuS3?=
 =?us-ascii?Q?UNj7mFsjlLQ3s2UXrTSW+Uu3e9QP0rJzj/D07S2Ni0GCJdIobjCZs4CpM400?=
 =?us-ascii?Q?vuuH6RrYen54BcOQ/6JTWp85RPmT6tgOPrLVjpN6DFOLYAlFLkxQ89chQ9H+?=
 =?us-ascii?Q?dn+CEUxj/DSDIamZNMJrTzCddd3V80DaoJXAtaiA1by+s0yu+XdNZ6ytygqd?=
 =?us-ascii?Q?ly6UMvkeGU0nU7Xpf+tMfxzQEL7w/qAgiNRs/EU5wFKNa4fob3pEBWWtKHBZ?=
 =?us-ascii?Q?Ye8xyc3OSmvExn7lo7UobU/NxfRwJkUdcwAQdHuQpPucm5kGsr6ak6o8U8WV?=
 =?us-ascii?Q?DwhRBspT5HinLzGnzInQQsJsmQD3j4zoUWSyfHvVlm/PgpzRH/83B6GQj9fq?=
 =?us-ascii?Q?5nFuSpa67SMB/bMe0SHe4xizGGX8VR1O1toykS1N5On8ekRDlJcYIHZxAhkG?=
 =?us-ascii?Q?ML5aROFkCtY3o2ZuxPBBxmLMun/n8byBSRGH0L63SankiQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UUkLBrv0Qw7NTy3aPRVbQ7oQw2it/cep/OLlCxZ6fmvlmsYr0px+y+L+lsq3?=
 =?us-ascii?Q?YPo5EiNlNYdGB4C/qPXrAWnR+EVDFzaCfq+VMJ+2Uz0jfWWAiWaBBHhaIISl?=
 =?us-ascii?Q?qzd+cBpLsp/RI44SsPE9lp14UUjflo9PW6KUU+17Mc0Hs2LfMGGOrr6uc/qV?=
 =?us-ascii?Q?aetlVqjF4KGkxHtNiglD8b9mtEQS1L89JoNlnsN8m4gmY5emBdE9DVLT3chk?=
 =?us-ascii?Q?FEjDF2NzdSc/zVip26wz+Cm/0CdU9Ep8gSoCQl8rpb+1IVpwfi1o2tj6fGXW?=
 =?us-ascii?Q?xo2/75O2F78qde1p2CY4nY1qcVUFL7GsNjkcny0EKRzMMK/u4D8ISB+e5HQa?=
 =?us-ascii?Q?GinNY7cKRXCKFcc170xx3K6lE0F6XQxLn0etXJUd4V88236Tx90x5EQwwYtq?=
 =?us-ascii?Q?sJGIWbyRwV1ZgRp/BztC1Mo14cTSzLCNBmTEi8NAyeIwULf3B3zqQkV4M5nB?=
 =?us-ascii?Q?D/1IKQixDdu7yAtoScPfdH81jf5Bttw5IsCFHTgXOfxsFS4wAghQ60H3Ss05?=
 =?us-ascii?Q?LvBcEaRwB70rN4Z/hivjqyHDlH9VdJBytDgMDLnaxCm2WKLyAMp0dLX8CT4F?=
 =?us-ascii?Q?9grMnq/Y3Fg99Sy9aaHSHKprFPnb2TuTzfNfaIWsgitwgK7wM+JOHxtHBCbT?=
 =?us-ascii?Q?vgatqLWw8BL9pbOUw/eME3KbOEk3A2jzku3QQ1VyWRymOrd7wpQxnErMuYNY?=
 =?us-ascii?Q?01Nxr6+Lt6LTIzEz7oPmyb64bD60n8Rhj1FlYgwejkIjVcP62wQvDE+6XEBG?=
 =?us-ascii?Q?Q06xwL19Wo1pPeCiRDcyIvlLp2tPKs6PKhzUAXtM2o8DOsWpBFMtjh3wTmYl?=
 =?us-ascii?Q?T/LGKr+3uVv1B/s35PM6E+0eYml7VlYgFMy1z5b/jG3eRoRuBTApwUrUvsSw?=
 =?us-ascii?Q?pFt3NQjzD167HPG0H1jB17xwyg6dSuQY5nezYfhGJfW+87V5ATx6llTe8aM8?=
 =?us-ascii?Q?QiaaUFDePtfoO7wcsVFI+8j3NSR7TiayY86zW4x+yhiHk7l/MUzwfzMv8WrN?=
 =?us-ascii?Q?3y4wvkR0aQalwOco+jit8V87vSmOsn7E0R8AZN8WOoNDoSvDFb4g4iICJRyU?=
 =?us-ascii?Q?EKlfyTxpDWI81qgMWgeIObsavF19DpNZyJE889I2NNsCfKD3Zxiqyh6yKBy9?=
 =?us-ascii?Q?4ADJFKVeYhipbshJuIVq+TV87NzR2AtbeE0EJOuTyhT0DrzD2i5JJlQZHOY/?=
 =?us-ascii?Q?zIrWy24ETqmEyR79Q7ydV7sH/42QRNrw1yMb+Qzdruf8qu8+PbPS4XKIKwNf?=
 =?us-ascii?Q?zPzj4l57roYmPrF7YI+NoDmTrCDoH+30xDvX6fMi5gqRGfhrdxMjHWRBReL/?=
 =?us-ascii?Q?FU5kXG04wrPn9X6vJBdtY4qBwBeHX0vNMg26/iWDASMtwhnyas1S/fTR8RwO?=
 =?us-ascii?Q?9TLIeygwxCcX1BJKx2OQKwg856p4DKLOVdqpvQ831TrqSFs9HmvGXvv875rt?=
 =?us-ascii?Q?9lNoFeAt6F6TghQRYSqURwtG8e880yDFhU0xt+Nu2wTcW5aLtvyDjIg7W6gp?=
 =?us-ascii?Q?ObVr/c7dZ1Ox+WKUIkDtCkmmmfojl5q8eEE+0bGk7BL1u8esZo8AGPVkw2OI?=
 =?us-ascii?Q?MwgL/DDplIQUAu3bSzzSj5IYTqKiVShZz322qqk4r3ICY1vZ0FAPdh3ZmzhB?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86b2ad77-3613-449d-73af-08dd341166a3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 20:32:30.1413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQY7FpEE/QgDLWhPcaC12Bq7SraawSYZhPhY4e/hzx4VcXoTiBi6tmT+uyhh+zmLWKEBxpRUFfrUbNqSRJb5Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7919
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

On Mon, Jan 13, 2025 at 11:44:04AM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The GuC log snapshot code would complain loudly if there was no GuC
> log to take a snapshot of or if the snapshot alloc failed. Originally,
> this code was only called on demand when a user (or developer)
> explicitly requested a dump of the log. Hence an error message was
> useful.
> 
> However, it is now part of the general devcoredump file and is called
> for any GPU hang. Most people don't care about GuC logs and GPU hangs
> do not generally mean a kernel/GuC bug. More importantly, there are
> valid situations where there is no GuC log, e.g. SRIOV VFs.
> 
> So drop the error message.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3958
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_log.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index df4cfb698cdb..80151ff6a71f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -149,16 +149,12 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
>  	size_t remain;
>  	int i;
>  
> -	if (!log->bo) {
> -		xe_gt_err(gt, "GuC log buffer not allocated\n");
> +	if (!log->bo)
>  		return NULL;
> -	}
>  
>  	snapshot = xe_guc_log_snapshot_alloc(log, atomic);
> -	if (!snapshot) {
> -		xe_gt_err(gt, "GuC log snapshot not allocated\n");
> +	if (!snapshot)
>  		return NULL;
> -	}
>  
>  	remain = snapshot->size;
>  	for (i = 0; i < snapshot->num_chunks; i++) {
> -- 
> 2.47.0
> 
