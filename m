Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04338C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 19:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0161112DE5;
	Tue, 16 Apr 2024 19:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EwD62jso";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D81112DE4
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 19:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713294358; x=1744830358;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fpaVYrRkHYh5MHU5GeLEmf5OzBK+/+3W92IY7q8IG6o=;
 b=EwD62jso5Bb1Dglftm6z3wiUAyBJ1IL4WW2UENOCAcuJE+uYi1JwNAjO
 uyRCoDRKS8UeaEZafqFHZUkaJvAPaU/g9ZSxCiRaFI8SQLrA9icnfj19w
 5Ctb2NvXBtxTcUGPj32wn0xZFPbiR51Dsok3EEfor/CnsdC3nmjEzB/MK
 lrY0f796Kvw8Ar2dZ7n0fZn27zinx/0FNrYfws3QX4A80/wS5Nb5UAnvb
 5CHmBdt6iGPV3Gfx+Bt/vYgyZL6UumKvacbZMqS55i1O8C+KFS+ry6Xx+
 pd4MmuWUgoPDZwZAuKNH4xhvExEA4wIonUyAer/OepuWJ8uLpIhdH8WKR g==;
X-CSE-ConnectionGUID: XRMTsCfWT32BQm7sBS/BcQ==
X-CSE-MsgGUID: 5yFXTmGwTeC9kk4+BZs1Gw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19903302"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="19903302"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 12:05:58 -0700
X-CSE-ConnectionGUID: YHuo8dFcREWBk66+SZAzEA==
X-CSE-MsgGUID: kpUhL2N8SpundXB6e/s+SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="26924571"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 12:05:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 12:05:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 12:05:57 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 12:05:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fBUPg9UbmV+OpefzYWPPwxu4WqXVv+p+ZWXuf9uO2rELSyxC2RNeMAu0C+9P5npGWEsm+PXYv8DEh09kuOqbKTtAF/9/3Vmptcvqm50TnQhCpTPqdVgilYMT2CoLoH3uLK8d09yKfHpXc6aEwof0d3UzgSVQzRjY7IDVqq7S3/wuaZS5M9TuPBRmq571TXuSd4cNsiD2TQjH8XAKVkkDQKlraqi+N2l1CzFYyaGMqU+CfUwfthPVT5DSEu9bpk0x0PIU57sGGOjPm7jfrJ0NikdlyjtucQy0v62RLF24g50nWZq5Rgd7Bu2XBSl6kz/WQ7Mk2KeGgFG9lKUWCxCtxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0L8duDf4Q8wtrjq7uVdFPz6+UDSBDPqC7yce1r9FRHI=;
 b=EcDB+RkJc2KFG47+evrLMrkU5ZsTtJj8qPNzHMm8UlABhEeHa4Rpj6nYGR+YpmNcwVoLFS8jleKG+5amBSgQNiWOXZVjBkLOVB5LwPLofU2umwFTBgFp8kovRWxR53JeU362zzQHdYWLiXKmoyJXqKWT3loOZRmtuc45BQnlxXb8XiaqVslXFOqN+wMhKCVjmW+cgSDb9QIxUbl/l3wuRwvzxave/BZgcdD4/jXNoNv9H4Jrgw/F+0IhAhVK//EqzE+lWBRGFBeCplGaxxZYPjstyjCb20h94vn3vqfc+de3PHa/DFRdHwduZxkDgtTD3yTtZBnrs7CfCQ6CdPtwVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SA1PR11MB8542.namprd11.prod.outlook.com (2603:10b6:806:3a7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Tue, 16 Apr
 2024 19:05:54 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506%7]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 19:05:54 +0000
Date: Tue, 16 Apr 2024 15:05:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, <himal.prasad.ghimiray@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 2/4] drm/xe: declare wedged upon GuC load failure
Message-ID: <Zh7MCpZGUz6z3dZm@intel.com>
References: <20240409221507.1076471-1-rodrigo.vivi@intel.com>
 <20240409221507.1076471-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240409221507.1076471-2-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::7) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|SA1PR11MB8542:EE_
X-MS-Office365-Filtering-Correlation-Id: 1af0a701-469a-4bfe-f95b-08dc5e483cc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4svTGHn+fQS7IGkP8vI3oCmSNzAyT0SvgoBH6FBlb1/uc7bxR3lHHoxX+yOKFHhRIo/6e/CgxOUFbvJgfcbKDHnRpyT1uOueBqBxuGqDPZktNnyuulLCqdUYAin57zKQz5wxqLviffaeEvXl0YRA2P/oGEumgS4Jp4pqPQzuS/dx3KieNg/8+9SHQuAxFoCGs0NWC7cbgYrqH3lk7tWj/0ZlNVzNCofSN+T6LLSAKv2GPs/hirH33lJ/WP702zyIv6jMigPkpkPBwS7FaPrEYm4gJgiuA9p3vrDOhXC4/jcO7K9PiaFSIPIPRZGZfMKljmO7D/r8CaWCI8mnCznECfwdBZ/InaGXhsJjx+Ip/DSMjw3eZvYrdCFIYrUVesGig4Gk6UHjO+ePUHg4Ary2Zm4cC5kJaggyduWLZlgdUuGTSunSCsvf7LU5QXv0f/75wtwzUKt08Bcm1fm4t2jVOcbhHB3UXvzbVnQEKl2mSzQEEN0U2lP9+YUTFx/7YW5c4AI2Oekk9FbqmINDb6QhdGr02czYTxYkbkbN/O0yrot0x+/TxkVETCeQ+uZ4EwdFNfnUbLoWk0UhSocipTHa6ZUa/EdfJAu96cfqEKIvVkLa+NdiXM5RR68HH9wMTNz33EpEqzu1jHD3929etKobhBHQAwmv7OwuCQMvJFiH370=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lcy2qXs9PDnCeUA0J8hBKc1NmDwaqAiJN94C2s8sSO4+vODdWx3B5eAYZz+i?=
 =?us-ascii?Q?CqnOZuKSAR8HxD6RcSq6LW14uJeJc3RC+VMMIiyE4Ob0JRKFfZvtcbWCfWip?=
 =?us-ascii?Q?4LHs1QAhhpkgWXwNNNudKxP8e8gDjwRKGagEUPGn89lo/3RSmzOJPDm2qtLp?=
 =?us-ascii?Q?7b8eVhVD4BG5aJRRCxMKhLXJIEdUMSlVLNo4sfcryOreSJxuIZft/z6IGa4D?=
 =?us-ascii?Q?V/JCdO27j68QwwAbOOvgGvxypICC742b12LZtjWSZJP0K8LN62zuqlVvJAOJ?=
 =?us-ascii?Q?YNtUFuw7lE85pA1ZLCDAlpG7js6xXWXNHgiOpOLsPvRRjHvfJSSgWE7EarqS?=
 =?us-ascii?Q?xxjQzCOVSjEloJWPrf2LWUmqPBrHF793BZLzydox0iR9DbWW9DT1M5H1Kq90?=
 =?us-ascii?Q?ZtxgjoKP3hP5ERxvASfMQXadwnKKRNf4g9eEo0JBe3HERrcahcL5AO3j9qqd?=
 =?us-ascii?Q?GUcECQLaySgHgInO7rskUBrZTfDoupDPQRllyb9vsEyIHak/icnmFbN0HC88?=
 =?us-ascii?Q?xodG1+c2/QJ7GdLwaI4Fdt3p5ohPi3u2EVTpVXEGKlwKrLZfr7UMsXYexfTm?=
 =?us-ascii?Q?eGmEWwbjoe4f9JXos+hcAdOuPYPTZIG4LQJdCz/tfsrEOPsZ9LXPMkIzs6W7?=
 =?us-ascii?Q?y8OJoXGxnk/4dFYo+8JsPtlVOdxnzaMqGEpjYCTIQqcFq7UbJ+au1stwHOl/?=
 =?us-ascii?Q?BdHS65ZwPAkCdIYP/7UIXr4ZMbw/Zuo33dw1KQOkO7KxqSzliqISl9VVvJup?=
 =?us-ascii?Q?oRd2lIekvP9EXAHNppQKoaQR/tW9rW9iEkervh6UouilFVsnhxflZE4m8d3r?=
 =?us-ascii?Q?AYThaEL5wOIE9Em3ZT+1z/lU1rR9gg2z5jdTc0N8gglqu11OWqv9rt3k7iRF?=
 =?us-ascii?Q?VjsnTYERyk67EjMHXxUlt6H3KUVN1B4BBLB/wXKpIdnnYFVqX+rnLb83bb2J?=
 =?us-ascii?Q?KWgxr6ZW6wjWs+NKxZ5AVH8CU3bWFMmm7i6SCWi64aOB6dN2uPOFZlXPkQ4m?=
 =?us-ascii?Q?v2/ddtmiVytrSFNryAIaLifm12AV+Fbz9LD5stxNRUBkJ4Eh8gRaz/YxOv4I?=
 =?us-ascii?Q?jcnU1YiOgW3ARm1+gl7kPHvS14LVgdXzvuy0A3TE5P2FGxOFGWKWCuRAVM+7?=
 =?us-ascii?Q?NgAT1CsfK8qD0zWY/7ihSXTsTj4Z4BmrRr6X1lVQfZ+4WVNanDnkJ4rn5/UR?=
 =?us-ascii?Q?qRAMCCc1UjDEGvKb6sNMmoV0c3v9Yl8ZUjKqFYQi7UFznusg2nGY38qQFzy5?=
 =?us-ascii?Q?fHwk1FBFeDvApjky13sPYXLei4KdBMVHxyhLxZbHOWe9i9PX3ZzL+zC3Szwg?=
 =?us-ascii?Q?M8zC2PJIzKD1FCZufNJ4JXMD6cmt3RUUaqmIRPzs6pqZV/3Ez1/wLFOGx5/i?=
 =?us-ascii?Q?UiNFUwYu5DAn4DYfMs9iupBN5CPlx2kfwsyxFyODPsJp/s0JuEzv2HoL3xwf?=
 =?us-ascii?Q?Jcpjld3Gr51rN0vmOkUv6M1eSPnvBlZ3I+MWJJozGkpQjG7cmbEWDcuIZ8pd?=
 =?us-ascii?Q?2m4ZO21W5hRV7y0vf/KP3E+mC9YYjJx0vnhORShiFmrglT1zq1mdzn8jxCn6?=
 =?us-ascii?Q?JncXSb0E5jeDAS4glyyJ/BmZsAHZ9PWbRj+MIXpDEgFVbl/csKj3YHd482y8?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1af0a701-469a-4bfe-f95b-08dc5e483cc4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 19:05:54.4821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLeDkIN6QB0MVmryS0Ltn6dmU0R/PJZsot7D0zdftytlZW+pP/lB5RXY4PG/3DN+w/dJVnQcyhxfVzWIO645TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8542
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

On Tue, Apr 09, 2024 at 06:15:05PM -0400, Rodrigo Vivi wrote:
> Let's block the device upon any GuC load failure.
> But let's continue with the probe so guc logs can be read
> from the debugfs.
> 
> v2: - s/wedged/busted
>     - do not block probe or we lose guc_logs in debugfs (Matt)
> 
> v3: - s/busted/wedged
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 42 ++++++++++++++++---------------------
>  1 file changed, 18 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 240e7a4bbff1..f1c3e338301d 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -451,7 +451,7 @@ static int guc_xfer_rsa(struct xe_guc *guc)
>  	return 0;
>  }
>  
> -static int guc_wait_ucode(struct xe_guc *guc)
> +static void guc_wait_ucode(struct xe_guc *guc)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	u32 status;
> @@ -479,30 +479,26 @@ static int guc_wait_ucode(struct xe_guc *guc)
>  			     200000, &status, false);
>  
>  	if (ret) {
> -		xe_gt_info(gt, "GuC load failed: status = 0x%08X\n", status);
> -		xe_gt_info(gt, "GuC status: Reset = %u, BootROM = %#X, UKernel = %#X, MIA = %#X, Auth = %#X\n",
> -			   REG_FIELD_GET(GS_MIA_IN_RESET, status),
> -			   REG_FIELD_GET(GS_BOOTROM_MASK, status),
> -			   REG_FIELD_GET(GS_UKERNEL_MASK, status),
> -			   REG_FIELD_GET(GS_MIA_MASK, status),
> -			   REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
> -
> -		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
> -			xe_gt_info(gt, "GuC firmware signature verification failed\n");
> -			ret = -ENOEXEC;
> -		}
> +		xe_gt_err(gt, "GuC load failed: status = 0x%08X\n", status);
> +		xe_gt_err(gt, "GuC status: Reset = %u, BootROM = %#X, UKernel = %#X, MIA = %#X, Auth = %#X\n",
> +			  REG_FIELD_GET(GS_MIA_IN_RESET, status),
> +			  REG_FIELD_GET(GS_BOOTROM_MASK, status),
> +			  REG_FIELD_GET(GS_UKERNEL_MASK, status),
> +			  REG_FIELD_GET(GS_MIA_MASK, status),
> +			  REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
> +
> +		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED)
> +			xe_gt_err(gt, "GuC firmware signature verification failed\n");
>  
>  		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) ==
> -		    XE_GUC_LOAD_STATUS_EXCEPTION) {
> -			xe_gt_info(gt, "GuC firmware exception. EIP: %#x\n",
> -				   xe_mmio_read32(gt, SOFT_SCRATCH(13)));
> -			ret = -ENXIO;
> -		}
> +		    XE_GUC_LOAD_STATUS_EXCEPTION)
> +			xe_gt_err(gt, "GuC firmware exception. EIP: %#x\n",
> +				  xe_mmio_read32(gt, SOFT_SCRATCH(13)));
> +
> +		xe_device_declare_wedged(gt_to_xe(gt));
>  	} else {
>  		xe_gt_dbg(gt, "GuC successfully loaded\n");
>  	}
> -
> -	return ret;
>  }
>  
>  static int __xe_guc_upload(struct xe_guc *guc)
> @@ -532,16 +528,14 @@ static int __xe_guc_upload(struct xe_guc *guc)
>  		goto out;
>  
>  	/* Wait for authentication */
> -	ret = guc_wait_ucode(guc);
> -	if (ret)
> -		goto out;
> +	guc_wait_ucode(guc);
>  
>  	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_RUNNING);
>  	return 0;
>  
>  out:
>  	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
> -	return 0	/* FIXME: ret, don't want to stop load currently */;
> +	return ret;

Lucas, thanks for the review. Just to let you know that I'm removing
this chunk from this patch. Himal had noticed and warned me that
this would change the behavior of other cases that are not touched
or covered by this patch. i.e. if the guc_load fails on guc_xfer_rsa
or xe_uc_fw_upload, we were not aboarting the probe, but now we are.

So, let's remove this change from this patch for now so we can go
ahead with this and then on top we see if we do the wedged on top
of the rest and make this function a void case.

Agree?

>  }
>  
>  /**
> -- 
> 2.44.0
> 
