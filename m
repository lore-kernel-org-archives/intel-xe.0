Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8DFC6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 19:52:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB9D112087;
	Thu, 21 Mar 2024 19:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Soh+owIW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2803F112087
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 19:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711050728; x=1742586728;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NDOIlWD5UCdPx0wIePwU/85MxWJJB0pH0Fxwr0S6PH4=;
 b=Soh+owIW1gJvZM1EeKW87oYl97nFLlowWS5IN6EhYTg335xqiB8zFtDa
 F7aTqsLDdEFOxvWYeVeo5R9Pvib4GnIqtyGLG0oqMLCRV/mRLgThM4FHG
 JOr7Z/kqCQfVrE40MOge3+1UJ5h7GXbvK3KS8MchRmQYe5PkpPcFuo9nK
 +N5prM65+XDXSPzE/MF0eyZPfp06BE46PrRccVQxiHH3LGjubVzXlNlnP
 Kr1H0PIQEw26EMpI7oJ+sOkiOEn/9eUGdYkipuFhF8EiSlgKuy3XFUz22
 b4h/aB3EIL++Q1SSLRQ5ba9SbEIbCNPoT5AMeHRft6YhPhV7qpD9djWiV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6187466"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="6187466"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 12:52:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="14505029"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 12:52:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 12:52:02 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 12:52:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 12:52:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 12:52:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvYVmXkqus5ve80ULieHoF1lcTHVnXKd9rqckKdjKnRD6moudtlGcGws5X1WWaxmtOpZ1fjCQ44hzYgqvbJ9HYdUkDiaCJC2y6Wz+mrSv0kiq5haiKdI3yjZvI40kwtdjBZ68AP22SICpsJObcT229WNEM5nczZkjD/vHKeAa1zRugGVbho+hi7FIzqpUcA8+o6/oZCgHW44suYq4ILrhOLZnPCVTnpKsj42E73MLFfXzOyMJeTsm3vy/QuBTOinpnWNa0pOHrVQ0QToE7j2/ClZfbrt/HR+3Rs5aWmS5hzuHtg72RM9jqKietv3pO/P1gP2omd5LapSz/ueK9tCXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4b2BhLFRSfVJewQrz3oiGDncwKQ2pAHnlaPlAZSl/rE=;
 b=IL3omdBfSLzYymYWFvOC3iG92V3XR7R2SzqSudxqrsmsMG5vdveiO4glQ1Xc60lTF5NM/yFiOcKDnnI+VCWKGSkvLCHYd3y5laxMSO3VnPBxN/UZ+uVeG2GW8LwpJAoc3o3bh7Ws0Y+GjXHhlT3ZEpAHvj2WyLtz90gY9BuQBHMTgMKo5bRaNPlrgrBylkSvtCE8/evYr3kDHN9/asJGxp+UB5N9CQyQQHXcJ6gufpKb+5RmwA/6XBbVwne7andWzcFcv6fHblpxMiOblx2dyqjXtsA5zzXueclgFeoTTnx8AjziFm8a3RgA45iPL4kTWg6LKGtAhdUlY+tOrVYzEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4586.namprd11.prod.outlook.com (2603:10b6:303:5e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Thu, 21 Mar
 2024 19:51:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.023; Thu, 21 Mar 2024
 19:51:59 +0000
Date: Thu, 21 Mar 2024 15:51:56 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Remove explicit shutdown of SLPC
Message-ID: <ZfyP3C2I_vxjg-Nr@intel.com>
References: <20240321184924.234579-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240321184924.234579-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: BYAPR02CA0012.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4586:EE_
X-MS-Office365-Filtering-Correlation-Id: 12e096eb-6809-48ae-e705-08dc49e05ef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DVtowMGli9B8dJWAPdkRD907BtDvyLXqAdT0T2BX1iX7IjSiuN23XYZiIQrfkPlJ8j3i7JzZrZzg/xFvq1Y1ttYeEVZkBcjoau1TJmQt9FLQx9oGpkH4y06vseDMGMD36TKpEGAEJ2rT/p0Oeu/Hqd32F6yJ4IC2ro+8EnCzrw/tBuyyPxPunkn/OWCtRox55Gl2pST06i7kTenCiX2Qm5yPKYkYucmUvyBN86KShvKqe9QWH4U2481GNygyyjTy86KJwnWfD6Yj4QGx8nfQn40fCuXe87hLRtAgkQPnWPI08iYlZCnBE6b2Tf7gh/vj1mXZpa76llKfFhIjf3z2clG8E2/U2pjvQW9uLdGvrhDgXkw0Ym+oEcfXrBkyu3VHa5Ao89Ufvb7mHvZKBsI/UM4xAJ1bzjuNs2AXL2CRuYPFVUoYjf5rzljnLOoZToEijcgWnpFHpPHbVzVJcOftO1urcQE220EF98B/9PLR9YUhk4UJbT4bLOaA5/1QLvcX1+GkRgn++IWvFy0SezQd+vjBcSJNKIKKqgYoxlzeb+MGGRdqPkR0dbPGCfdYJTC5janr7G8Mdox0nNR5COdWn3Z60Juze2O+ZgpWQQkJ9J+zpQOqdrkF8Yso2xHdPPUqQ4GACV9VMVAiyYFer3nbtsMh/SQvahZprSE+lpoe2kU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hs6zNEOgcXhCsj3eiAZ0UY8u5AvaeaetA9b2PTDSiQrtiGwbHCsBOQbjG7xi?=
 =?us-ascii?Q?wM01og542XJxgA/2K9pWRzQ/mWUHEIt6p4JxCVR4B0/uJjfJe6Lzut9xVP7d?=
 =?us-ascii?Q?IU/pCuQM52dyn+7WD36SDM5MXzujoH6yMV3EqLbvLtO4GJ6BPtsBLzdnbwvi?=
 =?us-ascii?Q?T3ocSl1M4J23qDnarxFWE1g5vdY+F2elGAGfi0sa3fM3Bpi4LMettx24YCSp?=
 =?us-ascii?Q?tPsUbbjN/+P0AMLVmYKyidjOmsO23NWD84xbEWvFsq6G2Tlot4V2PGULHfdb?=
 =?us-ascii?Q?fKSaTLcKt8Sws7yAy7E15TEHp8lUPZKm3g5nZr3MscFIqP5nPWLhhrn+NbaE?=
 =?us-ascii?Q?v46AUtOwbXaCzXWg3W92/UiTONQBUWLxjoEjS8Txi6TpKdbZF7/ZEqFMjCRu?=
 =?us-ascii?Q?1ZXVO1lu1tzXOiiWKwgxmCGpbC06CKtMMTbz4M6e4HsUCoezq9J+sOXv3hg0?=
 =?us-ascii?Q?k19tiZO0AH0foD/iWNcfAZk/WUygRbF3xqXhwBWYbPGZ7yUBmxy5E7teJj6C?=
 =?us-ascii?Q?Ty3zN8E8d889HTR5tOPBIw6A+zXCnLZIxvm1T46STj/3+29v7z5jMfdk5XHT?=
 =?us-ascii?Q?CWsUmpVrpcxkUDOwCJS0elm4m5lh+SatZyWbnop01AdHIozY6zg45OBnPuSD?=
 =?us-ascii?Q?L3AWB1AYATWd/C+wPRwsjDyZKhYBay18AoQDltLlcJ8SHi6ez7XTAUjon88q?=
 =?us-ascii?Q?V1b8jvUtxvhUd4bI9XhYVmSXt1/xUmpvPN/a2isROrQvqzMHQGnHii6Z+GWu?=
 =?us-ascii?Q?QGCKxrnxFcipvD34PRlUvJuStkpznlfxV4uh7DGlePv4bEJvBoyZia+3HuL5?=
 =?us-ascii?Q?MJdXvFqiuypKe8lMFBiT6cGI9bT5JVVAUApoRPh9lLL4TnZ+DB7bKhOcrFPh?=
 =?us-ascii?Q?+Vb2oCKV5Z/JjRX5EHGYQEJYjW8arbd1uoeJGuFuBDp7ivXs8ugqbQBdShDr?=
 =?us-ascii?Q?uWVcQaw0kZjcN1IQKBXa4kMqfpYeERpknwjuXiUlIuuSEr7WGNUInvU0VoX/?=
 =?us-ascii?Q?ji7r/o3Tl70gCc4cqWOyXLmaZf/LDzRTMTkbBXzz4RXZ2sCdQRWOiCOuJF81?=
 =?us-ascii?Q?hlanivMzPdDbviHgYehWdxQo0+UXAGFGqPR4yNhAgDZliIgWA40BE8XG1sEJ?=
 =?us-ascii?Q?kG00eAQebI+O1gNpqSxfK1oPxWdLGvCSaQ0T8oohvheRszDNCYDGmm2vDgfs?=
 =?us-ascii?Q?MIKGdUoRjLvcX3EptWB8KnIOLgr6ntK23aHuT9oxS8i2zGU1umFSzsPjyt2C?=
 =?us-ascii?Q?AmGjB8Jw+nuv4s3yxTmLEswGWvkUvDQnQ7bj5QXgYQtLtkj0d+spY+AuR3Vc?=
 =?us-ascii?Q?UmSczjYCW43v3SCrsqH8JPnzPehhMuu2S4PZf/YxekGa42ehCp7uR2RV1bZ8?=
 =?us-ascii?Q?xw/NrpGcXdrUy2vFV8mdLdeD8jaA1sEjveya7N61wop4uJC5vCml11rBGAAF?=
 =?us-ascii?Q?6WMU3S67VGPku82bugZ/Zt9NuNbkWd+sKNfjKToqyADcgAtQ8zzQEGRBpU+U?=
 =?us-ascii?Q?CtpCKo+ZgIixJ7BYbJw4nuOA/tVl4FxCAC2l5pWf14R402y1M7zHayh/2baX?=
 =?us-ascii?Q?KmPAaqEKBcvTsoy7g3vxmPbp32aIBLFTqzFnNK+armKAb4DNHFE6jLfzPgW6?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e096eb-6809-48ae-e705-08dc49e05ef8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 19:51:59.7771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GaYYbf76x3yg2jSC5V8SmtPJbj3mhh4+sK8qPq5T3xFaRWtNl96iAVxBndYNu4DXq7Vu+HxkjCwxC/GFbkkFBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4586
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

On Thu, Mar 21, 2024 at 11:49:24AM -0700, Vinay Belgaumkar wrote:
> SLPC shutdown is called in reset and suspend paths. In the reset
> path, it is possible that the H2G call gets lost as GuC is in the
> process of being reset. There is no value in stopping SLPC when
> it will happen anyways.
> 
> In the suspend path, we disable communication with GuC, so there
> is no need to explicitly shutdown SLPC.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 29 -----------------------------
>  1 file changed, 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 786acaf71931..6dfae1c23946 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -145,25 +145,6 @@ static int pc_action_reset(struct xe_guc_pc *pc)
>  	return ret;
>  }
>  
> -static int pc_action_shutdown(struct xe_guc_pc *pc)
> -{
> -	struct  xe_guc_ct *ct = &pc_to_guc(pc)->ct;
> -	int ret;
> -	u32 action[] = {
> -		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
> -		SLPC_EVENT(SLPC_EVENT_SHUTDOWN, 2),
> -		xe_bo_ggtt_addr(pc->bo),
> -		0,
> -	};
> -
> -	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> -	if (ret)
> -		drm_err(&pc_to_xe(pc)->drm, "GuC PC shutdown %pe",
> -			ERR_PTR(ret));
> -
> -	return ret;
> -}
> -
>  static int pc_action_query_task_state(struct xe_guc_pc *pc)
>  {
>  	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
> @@ -889,7 +870,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  int xe_guc_pc_stop(struct xe_guc_pc *pc)
>  {
>  	struct xe_device *xe = pc_to_xe(pc);
> -	int ret;
>  
>  	if (xe->info.skip_guc_pc) {
>  		xe_gt_idle_disable_c6(pc_to_gt(pc));
> @@ -900,15 +880,6 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
>  	pc->freq_ready = false;
>  	mutex_unlock(&pc->freq_lock);
>  
> -	ret = pc_action_shutdown(pc);
> -	if (ret)
> -		return ret;
> -
> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_NOT_RUNNING)) {
> -		drm_err(&pc_to_xe(pc)->drm, "GuC PC Shutdown failed\n");
> -		return -EIO;
> -	}
> -
>  	return 0;
>  }
>  
> -- 
> 2.38.1
> 
