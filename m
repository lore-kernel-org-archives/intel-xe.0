Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4E5606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 23:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AtUWancp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634D010E0D0;
	Thu,  5 Nov 2026 23:42:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E2110E0D0
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 23:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793922121; x=1825458121;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uebeW0Rm9PeaFSWLzsn1jjIDSbQ4kFr7rGkzI5swRoY=;
 b=AtUWancp//tSZOvRLXbHg3Ix8d9h30PMgN5rIHazLdoWI/cWlbJ76QgI
 uGtmlqsS/5Mtr7b640YHUxPSyhDDlzKd7nd0hPb7PISTjJ4bg9BwI7bFu
 J0IkrqcymRtBKy9GlD4VhS26nM3aHloPGsI4OxFATmtGCpzumrRrjohUD
 jZMSjaSFaJy7JVi3+GAJeLd63vJ7udE6OZMeBevkA8KXU2jP/Qf2GLnVM
 xQxNR7BmVJNe96pQngyWVV/Ka3PsevF72kKs/9lHuIipHaCIlBj2CJV2b
 UuVp7ia3bRJCAqe18X6PUptUglDIwBpSMJ2PYXre3vjR326/ZZFvoGUv0 A==;
X-CSE-ConnectionGUID: xrbaUPOsRDyFr33PeD5AGA==
X-CSE-MsgGUID: zBylv+gCTeuHu0rc0xLUFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2768915"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2768915"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 15:42:00 -0800
X-CSE-ConnectionGUID: +YkU9ap3Q3qUIugjsAbaqg==
X-CSE-MsgGUID: DrdpZ6yvQRCNFqx89Yzopg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7263672"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 15:42:00 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 15:41:59 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 15:41:59 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 15:41:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gcy2WqyelcC44x7qHKzdPUDDl9SnLVPV7nFu1RvxIf3RA7g8MAEYGyfookUZJTj92zGtXn/oqsGPZdE5z/oIDUbvoMuloUqjQK/JYuORjLwh2XSeZLEAhi700UJuStbdO/HVEeUM+SCQ36bgByuA94TVR/HBIBGPft2Izdf1AyVBogSGSVttQdOdtZha7brd/XJDLSLh5vgBeIpmtt1Hp+0UP98kqsBNnKKf4Hixeb/RQi7R2NmJCEl5tts4+F/YIAO+B/u5Qo9OywYff5/mFxlgt0FLbQEzg7SRZFAMScf3ZyKfo5P8XPotNBYXBBkquXaehPnrVn/2lhvEnjIGgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9j9iUTlynaWOsEwuB6uIySjVDuUbww8tNbe+SOfXQI=;
 b=wR9EXw++0N66dCCenQej4kepEgpeAYBe/pSsslfM4Xen3tiz6nHei5LLy5Z/FxsW5+QAhtkcZYF3b8nvoPBqKKauCoWPe4En0U4VZJmKnZAqfXTX//VXKAXD6IY2+aHKwSXZ6wJYZXmzp221+vP/gCJ+dG4/umCVp9efgQx0XL8jwMgEoza3sPvQ3LBg/gLbeq62oFtE1aegTaoK4OUovIE7etuJmozx0wZYtM6HA/vKxMXGv0OfAY6klb7wmo66FKnntG7zKR+xXHLLO1tlkAF4loPGF7Xd7viKlhaNtDbI41tp4Da5rM64PNeRPvCPwlWXbKx8gSzfv13Vgv402Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by IA4PR11MB9105.namprd11.prod.outlook.com (2603:10b6:208:564::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 23:41:57 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4%4]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 23:41:51 +0000
Date: Thu, 5 Nov 2026 15:41:50 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniel Charles <daniel.charles@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/pm: Apply tile workarounds after PCODE
 initialization
Message-ID: <20261105234150.GK6162@mdroper-desk1>
References: <20261103021418.654723-1-daniel.charles@intel.com>
 <20261103021418.654723-2-daniel.charles@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261103021418.654723-2-daniel.charles@intel.com>
X-ClientProxiedBy: SJ0PR03CA0146.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::31) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|IA4PR11MB9105:EE_
X-MS-Office365-Filtering-Correlation-Id: 35681acd-adaa-4e50-8c08-08df3b965de9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|18002099003|6133799003|10067099003|22082099003|11063799006|261022105027099003|4143699003|261009223027099003|261021121427099003|261022075727099003|261028144727099003|261102123227099003|261026121527099003|261026140227099003|261021123027099003|56012099006|261022113327099003;
X-Microsoft-Antispam-Message-Info: kKdCh+GSVYXGN1eUrcljcA2pn9Oh6T1PylEsNfaWVU5R/D/mllbxmeIvucPdrNiHnoqddCSD290w21Ut00TUmgrXQaMFbY85U/v0ChIYgDlaHBU1q9VYjekg8dXhAq7RgPYG3orktwCpwQQIQjuIG4uHwBd0GWGGOyQu/nt2jE0/cZFBbDKfgIdW6I6pnPRiSKPoFiE4UGcOTY/29/MoKaZYf3rbDdIG9y4Y5nAT/0C2LApLriOBhIza58+wUnWFKaOyjDZu/ptwmmVNcR1pBsP5CxlYWHmXTJ4vzy3n7pPf9sw/aT74YAK6AHzwgzhshix6/snK4ZHhCS1Nc9qY7kr4IgClkpMrQ84ZXl5e4KtgRSlIN0awAYZeR8BH0e8VlUSBHHLlUSHmDQh+8xiXOgdnll4aep3IgcUeuRXNkWfPT39W7WdH5SG49YRGP6u32obDQrtG6PMgi6KuhLcdfVZxongC4SvEigv3vSMnSD9fECoZMOB2y+IQdCNu0u9gcVuKwnDcrskjlAelM1Fu2fMFJ1DsO/F+Bq2lv/Vve3/iqlDczkDB2IpRogLexOdpNvyW/PD2TeS0KVf57Ll9jsdBaa27Huilul9baDXtJbDmPIs0vLOTlRHtvSYnnN3MN5rZhATmnyhAmDYpl5CGDpcZcSqXwEsKRToeEQqcHOQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(6133799003)(10067099003)(22082099003)(11063799006)(261022105027099003)(4143699003)(261009223027099003)(261021121427099003)(261022075727099003)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261021123027099003)(56012099006)(261022113327099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W5k8McytwCwcVFNSE6Ds3WI32VhiYpzvo9Onb1otDG8LRGyjN7K0z3lk2Lcq?=
 =?us-ascii?Q?EDpuPc6cHityOyD7C7uPCP6AESdp9uUVHcf1fRF//GUtpQajQESfrawXrsFi?=
 =?us-ascii?Q?zXjGN4IZ/2J557evCuRLM0k8CxcmHkI62Rp1AeRYln1gUJiF4/Adx+iEIo+0?=
 =?us-ascii?Q?pYlxMAOSnSS1/mQs/9nE8AG1Wz/0C4kZfPJAdqU2rEF1fGJaKKkN5SkaW/AW?=
 =?us-ascii?Q?p6ex6PujW4Auz1wE/USfGp9xP3Jba30jhCd4XxdZPr59l3NzViZS4F5tVMT3?=
 =?us-ascii?Q?/k9V2PTQRqpTRgfL6G2kdiZlGBc7YxRewoWLkTs9L/d1iReWcEqAfZqAEMiP?=
 =?us-ascii?Q?6CEdqsa4GHDQ6VLuNdwoFdLQpibH3UUZda61FSK3NVfymMRg9yVQAMPMvX9j?=
 =?us-ascii?Q?fF3QPFGsuyMAUuX4+ktLfUGCMzSG9vWNLEN6OPe9kwpxjc+Det0Hp/Cu3PCS?=
 =?us-ascii?Q?aeFZMeyr80j/Tk7UftDHZTvHUu5iH5es6c8QtVSoNLKkhhD73G5A8qu+at3d?=
 =?us-ascii?Q?tTGRm8hc3CrnpykgtePZmi8qBVSmk9e0f6QCnhIF1kl26IVbtXt8/xR7lY9L?=
 =?us-ascii?Q?eZnDVdNncJaWt1/HgdoHnCrCSmNnB87yd21GnrBvXKQoy0+g2PXTJo+JyQW8?=
 =?us-ascii?Q?fzPsWVb2i7bYzenjGD6W608TymbPHDmRX868dgDBMTQUBvs90mf5nQDLheiS?=
 =?us-ascii?Q?2K1xgsXaR1W37IGQOWXgAgCLql9QCYkPOMu7gSta9miwjpsWocEqjDLQNlZP?=
 =?us-ascii?Q?0Assw9lqpU3K4k1pvSyClK07kfZcdK8gG9FL6wRfA+C0O+UvI3meT8Nz7NIS?=
 =?us-ascii?Q?RSOlLsiRxODKRuUW5XWMyCCC3PEqv+7G3E3Jf9dMYwWpCGUOXFMHUvoUklrb?=
 =?us-ascii?Q?BSSLx0751TOqimZMAQbN2J8VC68lSDw0DjQQQqkpmpKm5U9kxyayMyhyegcZ?=
 =?us-ascii?Q?5Fg+KORbYTxGMi6AHL1myYGFlICXrAwAbgj4ZB2sKFEffCk6P3PgfhMCSTdE?=
 =?us-ascii?Q?5PBr3tNZ0Dg62xPo85/jh9adI7V3Efbv00Qdsyc/iAJJZJdiwrxYJnZrjHgc?=
 =?us-ascii?Q?5p7fTLlkGiOoNK2i/VfUwci3+gevPo4mUrhb/U/GtfECP8d8g4Na+7X5zztF?=
 =?us-ascii?Q?quCOBZOeOijy7R5VsDkuzYJEniFGSqSsJZRX9XNBFVU49Efh49m7bucrQCp5?=
 =?us-ascii?Q?A9eyGBhzVCN7II9Rrd/WPXGu9GqWn6YIsZ9T+JTGUXad2FceLOQcQK01lN5F?=
 =?us-ascii?Q?SqD9zXqgrzdS1wAcgfSLVz7ig7frsQ9o0ash3IM5/zvj8MYlIw8hPtD6Tbm9?=
 =?us-ascii?Q?mDd/EviC9UB2ERu177Q3/ul/I1GzM6P+OEbfIYiYm9OokmYtHrOEWHJMABff?=
 =?us-ascii?Q?GJF8BnoIcWa+d3nmKxLFwC2fXXyw+AjKqqVAAxTLPm20pQiubgc8trA3vvIB?=
 =?us-ascii?Q?HOA/Nr57tefgz5CfnZet/iTmoinDje5yj2nNQhU+9d+w6Ve9/m5N6rmGaRJd?=
 =?us-ascii?Q?jm1HhyKQhdBu7EzZXnKS6nvNxLfL7DbO4klc85s/f7EfVCwQJr9ptDpuk3TG?=
 =?us-ascii?Q?MfQVK8iShADlhuIoFU8oQXcx4/xjwk4d2fWg1D8bF1MNSby/EYnzQ8uAJ8mN?=
 =?us-ascii?Q?Y+pjCaTbBFP7NHWZrJTZudB9b8qEP2+U5wVlCDYGfiHNQ1F0qiUJ7trWJImS?=
 =?us-ascii?Q?nXFA0h2zzkReFkA05lUX1gWCiLzLA1PCSq/YmUEtiEN7Ti1tzqpJjvyoLtLz?=
 =?us-ascii?Q?5bBNeb+dV16Xp9qiIUn6gFBIOvsRkZE=3D?=
X-Exchange-RoutingPolicyChecked: rkXLvIfGz3vhek0oU1JLSQaaJCS1ZC4C8TboFCSCeHl/8SLxMqLk4hkflt7kAfEPsSqu3GYJBCeDSuKavICdDn3CDXzAaulfGjtGef/PLkRcBSVmYe7e49S/mEMTpgJ0PsV7/eQmRVpVXki2igcwgG/2h38is4E6g4RwveY4YdlLA4Us6J/p3f22V/dcz2UrlZ++6jiXfDDTE6Y7XykGvqBqzuvNXI6BLCPG2CtOolW4mzIphncKkmZgc4Y8Wh3wRuTo46DAEzHiqFrYF9K7ptaNwsZQLjJ/ojJR6O2FO4z3P1qZ3meaxkMyIeoqgoHLpx0eoNYE9hkEwfehmIowXA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 35681acd-adaa-4e50-8c08-08df3b965de9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 23:41:51.7680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4LnvLlsAjiYzz48KI0AsVjqzd9yJ8jTZ7gUgCc4yXlvHqhBmXCcwg6UUlSMW2TeWTq3amKRWeUx9J9DDgwjjtNT5zpmKAnw5e1zJvFy0rs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9105
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 06:14:17PM -0800, Daniel Charles wrote:
> Tile workarounds program SoC registers through MMIO. Wait for PCODE
> initialization to complete before applying them during system resume,
> since MMIO access may be blocked until SoC initialization completes.

I think most non-GT register access should be okay before the pcode init
finishes, but even so I agree that it's safest to apply the workarounds
after that point as you're doing here.

> 
> Also apply tile workarounds after PCODE initialization on D3cold runtime
> resume, so their register settings are restored after power loss. Keep
> both paths ordered before early GT resume.
> 
> Fixes: 0d0534750f9d ("drm/xe/wa: Apply tile workarounds at probe/resume")
> Signed-off-by: Daniel Charles <daniel.charles@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pm.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 89d64aa6577d1..462357844cb48 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -241,13 +241,13 @@ int xe_pm_resume(struct xe_device *xe)
>  	drm_dbg(&xe->drm, "Resuming device\n");
>  	trace_xe_pm_resume(xe, __builtin_return_address(0));
>  
> -	for_each_tile(tile, xe, id)
> -		xe_wa_apply_tile_workarounds(tile);
> -
>  	err = xe_pcode_ready(xe, true);
>  	if (err)
>  		return err;
>  
> +	for_each_tile(tile, xe, id)
> +		xe_wa_apply_tile_workarounds(tile);
> +
>  	for_each_gt(gt, xe, id)
>  		xe_gt_resume_early(gt);
>  
> @@ -687,6 +687,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   */
>  int xe_pm_runtime_resume(struct xe_device *xe)
>  {
> +	struct xe_tile *tile;
>  	struct xe_gt *gt;
>  	u8 id;
>  	int err = 0;
> @@ -702,6 +703,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  		if (err)
>  			goto out;
>  
> +		for_each_tile(tile, xe, id)
> +			xe_wa_apply_tile_workarounds(tile);
> +
>  		for_each_gt(gt, xe, id)
>  			xe_gt_resume_early(gt);
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
