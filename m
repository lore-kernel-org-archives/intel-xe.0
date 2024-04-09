Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D976C67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 23:42:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E711610E674;
	Tue,  9 Apr 2024 23:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BpLPwjiR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0301510F5EE
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 23:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712706145; x=1744242145;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DUxkKCRsAqrU+JS7Wc59SWYonn/TTlh9J78SfwkAa0A=;
 b=BpLPwjiRVyFsqx8RU5pvjxMxafl1rx4oiADVd8z7KIjECFmF9PhxEY+s
 ml2TEbrTzUWU0Bo+OV8WjSceIcw/XxHBoh59/tTSdSyJmDG5NvaxjoiUX
 dScFxcx85DyOJcFVfANJkmSMldmFfWWJM3nEemdYjP6AM0KX2SeQbPX+i
 yUb5wAj8hJGMwUXSteFq6fBAPWBd6aKhT7TqGBPHDCRoJpmW+BEXksfSD
 JjDGPTQe2nESRx9FdbSeYCEvuJpvOS5Vat0oq/cmlNWVRM2fZN8BkytsA
 NeD0l1YxLFHIN2Mi0I8Zu3w3PI2djbKdecGSL3G2Ht/4wKVjdgTmJgMLY g==;
X-CSE-ConnectionGUID: T8mOhsj1QI2Tt/78BwI87w==
X-CSE-MsgGUID: eRt9+QL5RYuYJGNIZO3E7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="25552038"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25552038"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 16:42:24 -0700
X-CSE-ConnectionGUID: CWAmUXJbRs6krzNIe6yijQ==
X-CSE-MsgGUID: FBJ/Kr/RQmeEGZGU6l7WNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20811065"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 16:42:24 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 16:42:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 16:42:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 16:42:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NE3w4qQyBH6cxaksDZp8OBJ+9gNEM14I0Ud+JSbsz2+VnGROMOyhL+S6ijDjsJyNUhE+ps3iYvSDO9rwJHVL0OBQdJ40CyOqVXFlOJ+w9IimyDHHVbojzAngeCf0smoNh59F1NhoRN5bc5jwVynJN46ETu/tRPY/smQNQZ+WEkJUePbS8VXQ4Wukl7SB6G/CM93i41qvlRNq8S8so8R9dWPP2I5H3403Ad+ZS4vz45kFbl0enwsr9U0v0YkycH/YtqsM7/KzKZxBHX1vbqwngdlUr+IsKQRuQNtVgRD/s0nPE2uujksvZlI1ewM/+IGDDQTqW8tfkoteR9t4nmQOmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqDOs4FxSNwAqtNIHoSSR8Exi6OIlMxn3bpGG6/lNvo=;
 b=ClAee2P1OUoMUjTUxgOgYoIu16CJlt6kh6/+DZiEarQ2WEj9qnlPEuB23oNIoYkltTM1/0Z2S/xo9u/gzvigQpi3sEnffGVL6Ib33xH86IiwsXC2SbRJzts59UC/5BsllD6NckxaoW8eUpN2zOeTzN6yrKpl7pCdxoNBHapter9sfFntVdBveN6kQVCPU2Es/Lvzmkqyafs+zwUBVV2inaB0G89jr3S6iq6DGHekwXeG70Yaz7VyQi31GVHnuiXFbC7q1t+NRG1syDT5vSckWB5t4GLO0HILP2jlvzYO9QoG75jvvwyqJTNWyNuTYjPpUnmyk7DITSqIb49TevEcZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6253.namprd11.prod.outlook.com (2603:10b6:208:3c6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Tue, 9 Apr
 2024 23:42:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 23:42:21 +0000
Date: Tue, 9 Apr 2024 23:41:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/4] drm/xe: declare wedged upon GuC load failure
Message-ID: <ZhXSDqawxvfwEPcm@DUT025-TGLU.fm.intel.com>
References: <20240409221507.1076471-1-rodrigo.vivi@intel.com>
 <20240409221507.1076471-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240409221507.1076471-2-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BY5PR20CA0026.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::39) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6253:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lSvDq/vmCRI2Yez4GTDlXFUKyj3dx1Waak8YuH4060P7bIGcne+dfbssW90WHKMAvuFM9x5Z/KwK9RDMB+dC5UEvd5v3OP7kOszBfxbyz+RduT2QgWlbU5IrHFQmnm02wwOyoxUJJVblEywf8xUQD1lyh8oCGzbbBB68sh/8xgL8d3hRwy+vKpvPJwponjjMMhRyP0LP+unWjKbFumPN8N9sOS5PQc/erxhis6pC3Zxf2BCUg26fM1+/kqlWm85P7L3y03iM7fbtSUsjGKn0B+KzUNWk8ua2bTy/WuaF1CCZuzbXKueGoZix3SjZJJ466kFOxguMSECOH8HVq02ooBFPkGTdUZT6iYoSVbu6N8Jsw1dj+dpK1n6QCT20dGGDB3vKYdbbPBOW5Pqs/RmlrdZI55ptq2n1tFK8I1BDLigB++LllDsaPSMKCC1ZqTUiM/vgEu43u7YAj9CkqyhBawagOxu42elXopF1zK1N4GtokP7u77IjYcrIZOBk7CCNpr1Ycw7jxhiD8qQnEVbm/md0SvWyvAAGqEM1UAVCTi9zFkWrhN9htTw81DN+oqzi++gwv5BmYG0vyqYS00RJhbIVtDZzYaVpCycpsM0VNF92wMXaeu/7A+6WeT6z9q4TBYCcBpgnP79rb16GIlBhR1Nz8PEVPivS5Wsc9ep/EBk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?//f5vur30ED8QjdZS+MmcnrrM9Wq9LzhQiO+C0ZZ/N2d3JZj9npA39BYWlrt?=
 =?us-ascii?Q?wu/3T8qUtsIp9L0RxUJEPNOWe4B7asQ4nHVmc5oj62eBJkiTtGHik5FRxU2B?=
 =?us-ascii?Q?bzaX9HcOrNzWydQ5V/4WyluxZzG9YGtSfNp2SY1zT6jhFDYZleizGgysuNTT?=
 =?us-ascii?Q?nCreTE1WyU11EdiNztkrcL5RDghv1CUx0SS5eQxTTRkIclMttO934/zq4+tO?=
 =?us-ascii?Q?l0lUUEst/g90UuXKY8hCQ9PQJPoHXvhotQOLn2dp17sLRL5YW7tA2fYMF5La?=
 =?us-ascii?Q?+FnKEbSaA+2IRgYqA38r2SI/25qKXegNgn/NJKm6KrPkNKJXtYU2rxxSFjHI?=
 =?us-ascii?Q?KSmxZv7qBpgUpqK6/1SlpMF+NTA1B84esdFXD/+JfMV5dqvxEWRSTgCnomP9?=
 =?us-ascii?Q?Z3f531DpS2REFI9Mu2+bHMUAvv137AjUf/IHHwBEXYV3J9BkRYdfrKwW8jsI?=
 =?us-ascii?Q?Gju4yslKsKWupkzEsU5g3+0nXT+naQKq7pwZ+Pv8iUqIW09tqP3lWpklPDDO?=
 =?us-ascii?Q?S2AHTRavWB1QCQlzZofwAl0KdNrjhnzH+gdxrz+SzWSZtyBeNogN3VBEkb49?=
 =?us-ascii?Q?o/T50dh9SX1HLQ8Z+5P4SKk83Rd6dzTX2B3bV519XIil7U3kWbSTJrxqqrQG?=
 =?us-ascii?Q?jz6r35aOyYTHyHihN7jjVpME5aUbrDTHVvpyTNk0iKn17KTaLtP+4S9imJDL?=
 =?us-ascii?Q?ctVeLCOMtzZeq4TndjmHOrRFIVU6tvBUog/fPrgaaTITbbMMuuQCnYMsgQJv?=
 =?us-ascii?Q?5PxQ4pXW9gY/xkqw8mdrzXkk9yiqL4KnNJFiB/i5/HKHbPUA8HI4cqycCwPg?=
 =?us-ascii?Q?DulwCWy1kjklr2IL8xtd1roWooz52UE7V6jb+4/CHYrsZ+KWbI12cisovEn5?=
 =?us-ascii?Q?t8RhhP3PAqGSRULjREn61qwP9bQcXZx8wXJ6D+MsGB2Ost/Cgk7fwYaefz1q?=
 =?us-ascii?Q?PLP4Qw4xlHCzPe4M6yBhKqzuVKLk6WJRg3w1gYHeMRYe6UynHwy6E18eSQek?=
 =?us-ascii?Q?sAdXIa1+vw9R6opQupqKvd/f//zASM2Lr331VACIF05qxN2hvQke7722NoIh?=
 =?us-ascii?Q?Hke3LilGpRdXePtasl68eUMAl3wiUvzomaUIxq53EdcOi46YLqTwj/PjWsBz?=
 =?us-ascii?Q?PQzdR4vEjwqpfkGO19C9n7YhC+Yge0g3Y9EhFb9W1tuTH93jhgsEFfTMdfHR?=
 =?us-ascii?Q?M+VTzEiXfRozPx6/0/q604nSbgPNhi11VFz03hOq105l+qMH0RjQIcbuPRuc?=
 =?us-ascii?Q?gUA/CFc7Wdd2p3ACyj/jJVPxYzOOD47XtemfqWFNhODDj6k7G33Da9c3Z+Z3?=
 =?us-ascii?Q?8f52ReB6wMd/UQlnKWC4moUu+riZHm0Nwf393Y7bWerEBfjqxihfQq0oZ+0B?=
 =?us-ascii?Q?c4JLqgsIZA5nxV7aoNgEnm+NqAf+8MT2p8ucZRl1ftyCJWs38AIXhRUV9Ste?=
 =?us-ascii?Q?9fbXKSkIxziC9u7XJZ+LyUHU2yYAhS7AcTSpyBeazJWc91SIrwVwaNPIbCmM?=
 =?us-ascii?Q?cORUmIuFw05qxhW5jsrnyOuK2gNWmVpSCgUD9RCZ77b9dUKseVVcpyK5ppF0?=
 =?us-ascii?Q?BWhcOduhUG4cpPUTFmnwTxsWIM7HS7IrMNHLLEpZNVzc0TVh8mrvEmQaq1YE?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38474474-0737-4ffc-c5a3-08dc58eeb322
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 23:42:21.2077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5T0YPwrQ9r158/DUSQDCI9S7ym7IagBc5kI5M7sQCOFGw6NLwnGwkrclt7UCHkG2VRh+tg/u6FvLk0uc9qUqIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6253
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

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

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
>  }
>  
>  /**
> -- 
> 2.44.0
> 
