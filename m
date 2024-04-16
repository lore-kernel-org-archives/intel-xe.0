Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019D6C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 17:40:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1B6112D9C;
	Tue, 16 Apr 2024 17:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gl4PzcRu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1050C10F26F
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 17:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713289239; x=1744825239;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CLWxAbObnjDTOeIuNkNreAB+riMJIqMZM3aoZN77D5c=;
 b=gl4PzcRuhsqlLcXkr1TPmIaK6ESq9jYkLciyfBMoUFpAE4eGQYQENi2c
 qE1r6xIRfKs+4jPoK6H2UHtxfB3WcmjUiTML/UKVyZVh0YF0n7UxDeLuv
 Ga/Ipo88N3jsnZbwonjR8psdyuFt8C6TSznFHCbwZ8+3ekWxEEZa7Cxi7
 hbg7Oc1Oafl9GYn7WH9kTO5QvhH8359zYG4B1b9pjc2Mo0vOph2oY08QZ
 syJhX2z8YhrvyVewgQC5embBsz7XpAHv2vNpzK3u2nGJX0f3QcNS/w96L
 7cug7tYC4F7V5TFxg4T2tTLE0r8S+6j5CPBajJ54h1NxofEX7c+AnFSq/ Q==;
X-CSE-ConnectionGUID: V6e4FeQfQF6xC4X7Xdrs0w==
X-CSE-MsgGUID: sA0ku7o0QUKjqJEdk1uxQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="26256614"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="26256614"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 10:40:38 -0700
X-CSE-ConnectionGUID: w5Jc1VPBRdyimOEbWGu0ow==
X-CSE-MsgGUID: N8HQPetNRcWgxqR70eoQzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="22218737"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 10:40:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 10:40:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 10:40:37 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 10:40:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUy/eNFYq4mrbHPpCCUV90gnWZoGj7dDmiQ3uanNFraF6Xr8ApI7hYjU4wic4IAUE9QQgeDdjKfr1yOqlDZFy3IQEsuf52Z4JxoFzVB/XxfBdVeklepGub6LkzeK6SpmuUxXyHXFUHVNzXlRUcWOakCyOvNg3oDETiZSPc72JNl/FwiDhlMFdQpCRvk8pyE9ITq4V1cZC90tNZ3GPT2E+C1QX5BHsEdr6nD92+pIrejBAEltlqivuzMl8g3wdvyCuZx4h91Lt7nLZXaf4+baLZtULcoxX1igwaV/5oipoZb4wT6X/Y0gkhyAiXqKEGbHmGMFar8ljrZLxZewggO2aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZlsnoHyN+l2FjVB+DvTiQQ0Q42+dnMRUn/y0u7ZnKc=;
 b=R4rg8FILBgRIX5DRtCqJyv1thUNY+4zSqEmmeoP9E8DhgncEELxrSCpKpREVhRBllamdYkr+0DSVwmQdrJn8IAyhnEmNuvTCfR6HKx49oWkvhuxEqhXQ35o98RaWDNqET6BZm1ltEyz3IIFND7JA9aYPpPy5MLfhljAQ4OCRCdqPu+tkumdU7Jy7y3IhCXy70WodhJRcwBIHskccrUMr/addOhu8dMhM4rQ3ehjmtm8WfbkO3yWcN1TvF9+WNf65to3e4pcjk1CFjuw62/M7hl5CLku5ABY4Qx6QrYm6CahWjL4+yxhDuDr5sO47NNVsiFhHTTrpV/OVNYaMM8IvEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB8091.namprd11.prod.outlook.com (2603:10b6:8:182::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 17:40:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 17:40:34 +0000
Date: Tue, 16 Apr 2024 12:40:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/4] drm/xe: declare wedged upon GuC load failure
Message-ID: <qjxa35eqrb3fr6vvfkq27duclrcf5feg65wpiqlwh6ww5y2qho@jk5cgntpib23>
References: <20240409221507.1076471-1-rodrigo.vivi@intel.com>
 <20240409221507.1076471-2-rodrigo.vivi@intel.com>
 <be0f922d-7ad0-4d43-b2fa-0a168664535d@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be0f922d-7ad0-4d43-b2fa-0a168664535d@intel.com>
X-ClientProxiedBy: BY3PR10CA0014.namprd10.prod.outlook.com
 (2603:10b6:a03:255::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: 28bafa32-2fff-45d2-7ffd-08dc5e3c51f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8YkgBF6tZy/R4AjtGVl4Z2/7pJzTLCuKA3C+M9+Vw0WBF6p3PzS7BDBUKyS4azbVMUV4q0fpS+xlvD9Aur1gDxXAls2FmOmjGJW88VBkGGVPUmF4mWSXFY4RWq8QrHNKT/M+o8fk/X0PVDy7+TXI/xgWchWhFD4j5XDbAiYkU494Io6IQUuu2DUI180tCUWBjiOl4rFnpyrZR98UVygCe55lxML5D6ZswrjN/UrFf9X7FIJWKQF/1VoHA4Q26ryACxcB4EGl6quEb1u5kr7KQzR33EBEmhPVttJg/VqZeNvZO3yAp/trpQaD854LlXOCzON4E/cRsmftMh6T0aXWRwjf7S96YKyFjzLCrz3NAvuEG6XxH3yQZOADTTIfGg8AUaWb026sZdF/5vZATOdLkCfAhz+Eo38QqzHoso6vuO42FqH4sCPdg0Vs22JYURZjUst6s7HWaNpBbhrWtGh8FMSlYdXASgy8zmsWivCJmCM9dCgwNqpynXkq0u/QosRVIH6P1qjjb4AgDUio2cA1WFJxzQONBKNhiBqL9uX59JMxhO+ltR6LcFyBaB3rBP9VC2TfeZBCcQlhKu0o4omtOAH3uo2tUs+EIFWQU8/6Ji4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UMAKCitAMWaCCuVg872/Xcf513bRa8sOccaUZljhJiJOUMkKcvtoxIVKCj?=
 =?iso-8859-1?Q?OERN7LRh3paPJNGf4D3MxmFUOVJCPZyWThBmD55tuAPNng0+NJJjpxiGHr?=
 =?iso-8859-1?Q?acZEAnqVRGiPYqwkGjd12K6ndncdQbNaIEZtUCjbWz/hRBSyCc8+dqAqkb?=
 =?iso-8859-1?Q?uIsCxy0787Zb1J6cLDXOcqfV3Mw6hnW1PQyKjOHosIK0qKth9D8umSwVyB?=
 =?iso-8859-1?Q?z7cJbYHTxbyO20TsirQDKLvFAMmf3xju/rWJDy+axw/0h/S+empZ6ojM9z?=
 =?iso-8859-1?Q?VDtptZRMbyZyBMModFH4YNSjwsNGHQuwlE4h81VcA4BXfidakUnEaMnM7N?=
 =?iso-8859-1?Q?nlCP4T9wJPFvO6HnyiLQSqD6vW/9mS6/9lT+5FEcdPcwJqNx4XIzCS0h32?=
 =?iso-8859-1?Q?0nrR8qMD52t47o9xL7yXPwGemCSG6FTs0cc6Uswmm0DXaFNw7FhmbXy3gl?=
 =?iso-8859-1?Q?xLtj5TiA8ZkAqdN9wps/lSUYv+xSy5t4U4ZIH8lyatGCjcKsmY+TwtSEyz?=
 =?iso-8859-1?Q?FcMigL+Y0RTrgjrDuRVbgyR0CHKmSOaVSqZL3Ss3ooL87hiyh9V4qVp0AV?=
 =?iso-8859-1?Q?VhrPWSl6kznWFp2WcfF04wd5csl7WU2Sml0IgUQAoYmUa9AIQsO1TMwpes?=
 =?iso-8859-1?Q?Jbm/gHftiWuaxdNTiPjnzDsBIvqeIu6bhZ0sg2wuVjVj82pb5uN2/cMTMR?=
 =?iso-8859-1?Q?lsnhCu5bg7Wtbsl2/BHGqoMzVE4y9ed4sPxtu5DuZOR897+o3a6J5HPkAv?=
 =?iso-8859-1?Q?Vt6nP+zYIhssJkQLbgd+3EHSvajkgF8Jpnn4f0WLSpjmvOdLJYtv/0v3L4?=
 =?iso-8859-1?Q?isRwUjHSMLtdZ85msHdaXYoFsT3/xeissAPMehi8Z5VNn7LaTzI7hvbGj0?=
 =?iso-8859-1?Q?7FLEYrvBXyU/OsiolMtwYLMIru3nMg54hnnE4tV4QkBVCqu5r+RBI8Ifh4?=
 =?iso-8859-1?Q?F3uMCGhRR/XIv31wnqinLJR+9gcbuWq73I8OE2SbspACnCoeYpk+G+QooX?=
 =?iso-8859-1?Q?fiXNCwLL3vFxBpqB/LqLSys819NreIe1tYrC7ptvlAbVcGXziffEvH14Jq?=
 =?iso-8859-1?Q?rXG5ID1HHmfHShZnV8pNkfpEQ5Yor48uqNO+cmphgB+HIALXCMVQKkhHXE?=
 =?iso-8859-1?Q?EDiGbwX7pFpXZaZ7ziFNNgb+LJJadFQjNJH9IThKMBCwNrO4Qa/yERT5Vo?=
 =?iso-8859-1?Q?1RFecbfCta4o2n6zkK6ZPm+H3QmtN4eYs3MHAWlZRX8sPW8tO8pL9kU9xg?=
 =?iso-8859-1?Q?SGrPMQKZk5pW6RdIKBZ4fFisCk/YUozRXfvrOs1C5Ncv/dAydbUwvN1o6C?=
 =?iso-8859-1?Q?4gp9Feh40GMmCmscDGvAqOBg/ZgMNJy+VyzYcc+UdPBqYSiHeGpxKFWOT0?=
 =?iso-8859-1?Q?6iZaCaV51FpMMLTh1e7Dn3YYOuDcBMl8pXM1Hj8XEew6je7ZZa7eEqLdv+?=
 =?iso-8859-1?Q?GQ+bGh/M5uJHxQ04uJfKNMSUjTZv4fMFMTxZ2G/UOKnr+D0PqisPvEBPjB?=
 =?iso-8859-1?Q?AJrf0/gOAcV6PkWZYRvXXrBEj7QTr7MUQzc7RIr+/5H6z08E1XxqsbbRPF?=
 =?iso-8859-1?Q?g+IWhZn+8t0gXpTagBOdsz3jhKyPskGAfONOxLLWoNUxspgBe/14tJDW5D?=
 =?iso-8859-1?Q?04Z8zb1qwku44ylbCn+ZsHQKufHgudc3rXraB9ykJoBgdnG+BNPQQHzQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28bafa32-2fff-45d2-7ffd-08dc5e3c51f9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 17:40:34.7390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9/nwjQXS8OflSMl4iLEQrlyInxdlUqw+UB1JnQySJPkcebun9eVjUDcfe04q4/HibFiF7PszA9qgv2HBgW8LZIe5yunjptD1Vf8f6Du2OI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8091
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

On Wed, Apr 10, 2024 at 12:20:18PM GMT, Ghimiray, Himal Prasad wrote:
>
>On 10-04-2024 03:45, Rodrigo Vivi wrote:
>>Let's block the device upon any GuC load failure.
>>But let's continue with the probe so guc logs can be read
>>from the debugfs.
>>
>>v2: - s/wedged/busted
>>     - do not block probe or we lose guc_logs in debugfs (Matt)
>>
>>v3: - s/busted/wedged
>>
>>Cc: Matthew Brost <matthew.brost@intel.com>
>>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_guc.c | 42 ++++++++++++++++---------------------
>>  1 file changed, 18 insertions(+), 24 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>index 240e7a4bbff1..f1c3e338301d 100644
>>--- a/drivers/gpu/drm/xe/xe_guc.c
>>+++ b/drivers/gpu/drm/xe/xe_guc.c
>>@@ -451,7 +451,7 @@ static int guc_xfer_rsa(struct xe_guc *guc)
>>  	return 0;
>>  }
>>-static int guc_wait_ucode(struct xe_guc *guc)
>>+static void guc_wait_ucode(struct xe_guc *guc)
>>  {
>>  	struct xe_gt *gt = guc_to_gt(guc);
>>  	u32 status;
>>@@ -479,30 +479,26 @@ static int guc_wait_ucode(struct xe_guc *guc)
>>  			     200000, &status, false);
>>  	if (ret) {
>>-		xe_gt_info(gt, "GuC load failed: status = 0x%08X\n", status);
>>-		xe_gt_info(gt, "GuC status: Reset = %u, BootROM = %#X, UKernel = %#X, MIA = %#X, Auth = %#X\n",
>>-			   REG_FIELD_GET(GS_MIA_IN_RESET, status),
>>-			   REG_FIELD_GET(GS_BOOTROM_MASK, status),
>>-			   REG_FIELD_GET(GS_UKERNEL_MASK, status),
>>-			   REG_FIELD_GET(GS_MIA_MASK, status),
>>-			   REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>>-
>>-		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
>>-			xe_gt_info(gt, "GuC firmware signature verification failed\n");
>>-			ret = -ENOEXEC;
>>-		}
>>+		xe_gt_err(gt, "GuC load failed: status = 0x%08X\n", status);
>>+		xe_gt_err(gt, "GuC status: Reset = %u, BootROM = %#X, UKernel = %#X, MIA = %#X, Auth = %#X\n",
>>+			  REG_FIELD_GET(GS_MIA_IN_RESET, status),
>>+			  REG_FIELD_GET(GS_BOOTROM_MASK, status),
>>+			  REG_FIELD_GET(GS_UKERNEL_MASK, status),
>>+			  REG_FIELD_GET(GS_MIA_MASK, status),
>>+			  REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>>+
>>+		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED)
>>+			xe_gt_err(gt, "GuC firmware signature verification failed\n");
>>  		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) ==
>>-		    XE_GUC_LOAD_STATUS_EXCEPTION) {
>>-			xe_gt_info(gt, "GuC firmware exception. EIP: %#x\n",
>>-				   xe_mmio_read32(gt, SOFT_SCRATCH(13)));
>>-			ret = -ENXIO;
>>-		}
>>+		    XE_GUC_LOAD_STATUS_EXCEPTION)
>>+			xe_gt_err(gt, "GuC firmware exception. EIP: %#x\n",
>>+				  xe_mmio_read32(gt, SOFT_SCRATCH(13)));
>>+
>>+		xe_device_declare_wedged(gt_to_xe(gt));
>>  	} else {
>>  		xe_gt_dbg(gt, "GuC successfully loaded\n");
>>  	}
>>-
>>-	return ret;
>>  }
>>  static int __xe_guc_upload(struct xe_guc *guc)
>>@@ -532,16 +528,14 @@ static int __xe_guc_upload(struct xe_guc *guc)
>>  		goto out;
>>  	/* Wait for authentication */
>>-	ret = guc_wait_ucode(guc);
>>-	if (ret)
>>-		goto out;
>>+	guc_wait_ucode(guc);
>>  	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_RUNNING);
>>  	return 0;
>>  out:
>>  	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
>>-	return 0	/* FIXME: ret, don't want to stop load currently */;
>>+	return ret;
>
>Hi Rodrigo,
>
>Can you please confirm whether the concern raised on 
>https://patchwork.freedesktop.org/patch/582990/ is valid or not ?
>
>With current changes error return from guc_xfer_rsa(guc)  or 
>xe_uc_fw_upload will lead to driver probe failure. Probably we don't 
>want that.

yeah... I think this return code change isn't really needed for what
this patch is doing. We could very well keep the return to maintain
the behavior. Or do we also want the wedged state in any failure in
__xe_guc_upload()?

Lucas De Marchi
