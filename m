Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6644BC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 10:29:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A23F11297F;
	Mon, 22 Apr 2024 10:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M0OjANNw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBB510F540
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 10:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713781772; x=1745317772;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5HOlvZdV1AcLDr4xdwUcmq/GvtI7tfJnteOwP5Wfdos=;
 b=M0OjANNwhc74RpyQkXkqThHbgfIoThFm5q4ciywUqBakV0Nx/A7xT9EP
 QfiWMQDYHUpSR/wqSr2sbc+PoKKtJdQR3Gy6/TjbKyqO5hxGOqjY1HWzA
 SbvfMe9Rcup7sQHxa1EfwULWc+1NjAIy7QO04UDZuqnlWA52PMkVBvqBH
 9QCKgI1DcvH1tjIZO8efE9aNlPy0Hh8fQ6S9suJHbJRNaC6q1lTZndAXI
 PEVEDne2gNZ2tPYUJoaX6E1IZ/NQYPy3m7TW/i9jhjPyC94slCCVJA4Gn
 rE3waj2nC12S6zYWL6qK8gvqf3dPwocMcCg152OZd9EQOTW9h3vBmMNIP A==;
X-CSE-ConnectionGUID: OML3pfkLSjiPuMY05ulMDw==
X-CSE-MsgGUID: kJI+Oc3KSW269fd88ypqnw==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="20006896"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="20006896"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 03:29:32 -0700
X-CSE-ConnectionGUID: kJxlijQHQpeDgUpps7nNZQ==
X-CSE-MsgGUID: T+LbdcxnSbmcz4cqw9wa4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="24013192"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 03:29:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 03:29:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 03:29:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 03:29:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1jOV4CREintehpCFSZ5pE0ozyYelMYnpzXTqy0zza9nuNGobvumAEAPkQCgw3sPSv2e8VC7XaZk18qwgFZkl93OJejfMQtu7pLS/7eOI6DiXI8BnjRkPMPRTaU40jQkOPhIp0HobdrSX3ru6Nx/G0XnUG4u92GA33X8yORQDze2RXD6yO55cygCxNZC51zF3a0einar8c40ZLPivA3YE1ecx5D0JBBy9Xk3NTX0HQKb0D5SnUjZYGl4mDPc2pIlXe7uE8hRKM8I4K/aaQKCne7d3Va3PFcV/L0hM+JCpWudepgdgVEbqWcMZc+JEtHdIgi+kHmGh/S/Th3M9fgu0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPLGs46zgUyXmn59SZSGp4wPJZ79E4/bOmjv7jD4sYE=;
 b=A5G9ZU9SPE37IquH1XsWu9D3+iXBySCQtNmNsn0a8sHMw//T8eRTZp8iBF6EkCHSjFaGretNyNfG8ui3N6zY1W5sMJDlbIfseDs5FVOu5B8/GU/LQlWqkl05NZlV92Qu5S3iLFQG+4kyBzPxFAXTcDOQzdz8lQqmVZFR/qcFwWgrIQbiFrPF3DWE1ry2MLtrSyv0ZV+L+gIaLykFfQJzCtLRwGK1F+S0aN5+IBxvWsZXdjM06jSUYXZQqfEqVmG7GC0qBhhzBK1YEcfhKdnc1Kv4hPzqPIyf9JI8+gQ6UE87mNwMihV7qpxgM2bSAnUA1rr66WRWT+UtwmItqu0Oxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by BN9PR11MB5228.namprd11.prod.outlook.com (2603:10b6:408:135::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Mon, 22 Apr
 2024 10:29:27 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 10:29:27 +0000
Date: Mon, 22 Apr 2024 12:29:25 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] drm/xe: Add helper to calculate adjusted register
 offset
Message-ID: <20240422102925.ccs2gryz5l3wtv47@intel.com>
References: <20240418152802.182-1-michal.wajdeczko@intel.com>
 <20240418152802.182-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20240418152802.182-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI1P293CA0003.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::19) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|BN9PR11MB5228:EE_
X-MS-Office365-Filtering-Correlation-Id: 867d95d0-79a7-4dfb-722d-08dc62b71680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVhvK1ByY1ZnSkxwMXBURUs3cnFSNVMxZXFhRnhkQ1JyNXF5WGhVWXdiQ1Rr?=
 =?utf-8?B?b3NuNUZ0aFJDbk1MalRRaXJuQzFCeGxONjVndm1WUmJnckpvRGdpcG9Ybk5x?=
 =?utf-8?B?ZXFscFpQRnYvY0NkdTh3N2JURTA3MWdaaStlcjhSTmhxU2xWZHBpT3MrVm9X?=
 =?utf-8?B?dlBRakh5T2hjRFBNS2l3YldOREZtZ2k5RzBiQ3VrTmxCaTV3b1g5TFVJMlE0?=
 =?utf-8?B?WTdpakZnTzZ4R1c4Z1JpM2ZMMlNZNkczTzQ5T3NoeVEzVExFVHN4T21hcElV?=
 =?utf-8?B?V0JQY2d3a2xyc2VFSTBtNUdFcGxFMHlLRWxuek5mVWJhaUlCbGwrSUlIS3Nm?=
 =?utf-8?B?Q2NYTC9lcXpmSUVsLzJTdHIxYldQRGRqVTVMek1rTytlRWNhdnp5QkU4R3Ra?=
 =?utf-8?B?WHg5czlDOURpVUxiMkFnTG51TFg0WGZ1OXZHMkxKdTE2QVhINFMzOEVYdjVL?=
 =?utf-8?B?T2FFNVJkTjk0angwNUt2UmRQM0hMVGdMS3dVMkV3T05sYTF1cW0xSzhMUTVw?=
 =?utf-8?B?RGpzaHozZ2pOb3BtU1E5YzZUbTlWUXUvVFhDdE95a2puYXlWdlZHc0s1ZTRp?=
 =?utf-8?B?WFBMczJMUWVEdUlLcElJN2ZvendJM0EvTkhubHJXWU1WZ0NwNzUzNGtCZlNi?=
 =?utf-8?B?bkZyOE90UGNJTlBpRDAyc0tZbVdDRkxBT3RJU3JZWjN5czhSRERNdDNMUUsx?=
 =?utf-8?B?Z0xhRFpqa200R29vNW9Qd2xuWHFmclhkMldxcFdObVBFRkloT1ZuWExWVE5l?=
 =?utf-8?B?ekZFTVZJTVFQZlZ0QU0rc0ViNkJJTXJJbCtZeDBvUEJzdGthakx4enpaaFZF?=
 =?utf-8?B?N3lXU01HYkkvUUNxQzhnTm5aOE1tMW5OdlVkUDJDOVZyK2dLT0o2b0QxZHht?=
 =?utf-8?B?QURVNFlSdE11Q0FkUUJvTTdVWW9haEZPVkZIMXJ5cjBPaWJudEtGVU9iTUZw?=
 =?utf-8?B?ai9DNTI1eTBHSEFrMG1SU1J0NkNGb25wNmJUcGJGMjI5dk50T0xaSS93SlE1?=
 =?utf-8?B?YmEvdkVPaFFTd25nU1dsT1d4c3NZNkErK0VsMVBtdU1yU3JhSFVWWkJuS2pH?=
 =?utf-8?B?WFdsdWFEdXpTSXJVMVZxWEJLalBkYURLYTVQWFNoM2RzUitYZHd0azVCSnc1?=
 =?utf-8?B?cXpGNEhzaVR6dElad3pyYktmS1ppdXNwUCtWMGlGTEhUTkZzeEY2bWtIeGNF?=
 =?utf-8?B?VFdtQVNEbURoS0N1bzZBVjgwdXRIcXl5WGZhWUFDU3ZMK2FMVnFuOXN1bHFX?=
 =?utf-8?B?ZEJqWGg2dVhYMFhkVjhjdmpOTzlZRlV4SFJIcDJPT00ydzFMaTgzUGo2NWo3?=
 =?utf-8?B?Nk5MUG9LY3RVOXlLNXdlRXl3TlowUmFpaVJuMEZmeHJPd0svL3BpdEVjNHlw?=
 =?utf-8?B?cGNTWnFBMEptdll5b3o2eGVxL2xOWlJkRXVRR0JWZGo3MUVvQmVNeFJ3SW1F?=
 =?utf-8?B?TXNNWDFEZTVGcDhSWUVrWmhDUUorRE9lcFkvMmdzc1JaQkRtL1dtSnIxQm1C?=
 =?utf-8?B?TVdnUGREc3BkQlUwdDE0VmNzcEVhNGE5T012R0h5RWFRdEdNSW1qakxSY1A0?=
 =?utf-8?B?US8xc1N3MmFXQ3BvaEZ6SnBtZFhScEp5aGg2NmhNaVV4UkZEMGNLaXZpUnps?=
 =?utf-8?B?QWR0VnFmTFN5MjlTckRSNnZLd3hGS3EwTnBPMDRQNFk3TFdudm5qWFdoYlZO?=
 =?utf-8?B?M0t3dHl1SUNsMGNSajlBd1V4WWJxUXVCbU1zdHlsYi9ZYUdsdlJJS0ZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEhMa1ZMU0xkVGFRUi93ODFTNjZFdW1LRTUyeFk3TUJTWk9tRFpXL0Y2RHNh?=
 =?utf-8?B?YndweWlCaFpiMUNQNVJnRlJRQTFUcitFV0QrVVdlamdEQ3RtY2hENXpkeERh?=
 =?utf-8?B?ZmhKalVUR1RkaWdEckFGeTRyc1JMK004Zjh3YW1MQStDZ2ZaWEIyeTZHMGd0?=
 =?utf-8?B?a1gxbjZ0TU52cHFJRmRCYUExS3FoaVpWTzRBaHpzNzZQa25QN2xEOFpnSU1U?=
 =?utf-8?B?cGZWbVZoZ0UzUGZkei9QOW1wVmFIT0tsUndlQ3B5T3pMNTVtc1ZVRVhlZHJR?=
 =?utf-8?B?aTVSRW43Z0JwQ0RBNGNFUGNVT0VFN1M3aVo2ckp0NVlwaHVyZWdCbkxWcDha?=
 =?utf-8?B?UGJORHNZaktVWjlwZG5tbHdNbndadmpYS0tBeFFQZms5MUMvNHRQQUNiYnha?=
 =?utf-8?B?VUNlVGptM1h5MU1oUmpLWHJrR25XNkNQZEJKc0JlN2dkNHdoNGJVTGNYaVlv?=
 =?utf-8?B?ZGZDRmVJUmlPUVEvM252K0swQlFMd0kwUnBXdFlXRmZLNGI4Y3AwL2h2Rytv?=
 =?utf-8?B?WFN0eUdHKzN6MmdmOHR6THNJZHFNbUhMSExrQktNMG9oODVoOWlYaC9NUEp4?=
 =?utf-8?B?aW1ZWDZEWDdxVVl2MSttZGRaS05WNXB3TzBWcnB5MVZsY01YVE1tcmNGcGcz?=
 =?utf-8?B?WmZlRFgvRm45WFdyRkpNY21JMmk4YzM3cG9tbjVoVkhqNWM5RTNEZjlPei9N?=
 =?utf-8?B?OFBERC9TRTZzOE9nYVFrbGZDNFBEVDF5VGlya1B3MXlBRWcwMjFsYUVuWUY5?=
 =?utf-8?B?WXBGeFVJNWlOMUh0VDV3d25ncHZkNWtiS1diQ1RudWcyaXJGZDhIRkVHSU1H?=
 =?utf-8?B?YnZCRVhaNHV0dDl5SWFXOExmSFFncTBaUU5wVG05NFRGeEx2NU8wRnQvZjdC?=
 =?utf-8?B?c1NnY1lPK1p6bWdKM1RxWWxnNEVDdGNEUFdmbFZxUGhRNXk1bUNaRWRod0tR?=
 =?utf-8?B?cFgrUUxsM1JFalY5a01LVDFEQnEra1E4Y2tHU2lkOVNuNHJxZjBaY3pXdmVV?=
 =?utf-8?B?dXZXQWdZQUVIalAyRkJYcCtldUt3RlNtRkNzZUpHVFAzT0x0eTRiMHZNWXVV?=
 =?utf-8?B?ei85WVlJZ0w1NWNRVE9wbmhlYVZPNnluTGVmVXJPSVc0T3haZGpBV2Z4WFNE?=
 =?utf-8?B?NDlJcmRNUEhXYnNBcFE5alphYnBtOTlBeE5WODFEYUF4dVQ5QjZNWjFGNUg5?=
 =?utf-8?B?MmNkbzY4bVpvYWcwaHJDbFZKL0FLbTdIb3dSS3BySHZlNFdwK2RBckR6ZkJo?=
 =?utf-8?B?emdtN2lFMmI2U0I5VVR3NCt5L0xXanc0MGhhYmVvelo3a1hsaTlZK2J0S3B0?=
 =?utf-8?B?TUFKM0I1Tjl6RjREVllqejZ5OEoza29hR3N4SWRqWWU3NVZJaWNoQThkR3dD?=
 =?utf-8?B?dE04T3d1cm16a3BVU0xyT1RJYUc0UHYzdHA0ZGVYVFNrOWFBQU5OWTFMUXJT?=
 =?utf-8?B?OXF5TnJENXJVL0dIejh1QjhHYkU0NkpsQ3JiOWRqd3phT2lDVGF0c3FScmxW?=
 =?utf-8?B?dmRublZJY1JWRG5kT09RRUhTVkVUdnEvZ3Exb2JpWDBCNzU1aWsrczNKZjBw?=
 =?utf-8?B?N2EwSTg0UjRKYzhnSG4wMEowRWZGU0ZnOVZYZ3lCWEtwaWZFcjRPaDVJWWZP?=
 =?utf-8?B?Y0tjS3VOcE5SUkQ2OGgyaXBIOUZ2YmR3ei9IRCtmckhQa0xObTFKTzJ1aGNR?=
 =?utf-8?B?K3ZCZnN0RnUyWVN2dVk1aE5Nc2F5OS9ML3BvMisyNE56Um5nS2xHY1VmTzd1?=
 =?utf-8?B?akkyblhwdlE1YUJDNGZHRFJwYXY3aWs2MDBCTWNlcG5Cci9FSGE2eit4cnU3?=
 =?utf-8?B?QnVLVlgvbFhMS0ZwYzZLZ005dFI4SGtycnkyNUhtWTEyWFlmNXpDeWlVbHBw?=
 =?utf-8?B?Q0xsdFhjVmVRUmk0R3ZzdUFGano5TjdiRGpHQmRZdm1pMlppOFZGTVVRYzRE?=
 =?utf-8?B?aGV6VkRUWEFDMjU0L0ZWbjRHZ1ZRaVRVY2lOUXhEVHNTcDVHR2g0czhvSmpW?=
 =?utf-8?B?ajZHQVRPSXdtOUN1QUdVU3oyQzB1bUNnSForWXNSMmEzaEVVR0dFSjBiOXVw?=
 =?utf-8?B?eExlSHJJS2JodW1MM1RxY1ZXbC9HWjdiUy82aWFsb0l6TkNtaTNtQmRxaTVi?=
 =?utf-8?B?ZzVWSWxQZExnUy9FRndOMG05QXhKTDlGN1FLZU9TSXhwdzRlcm1zNEJTY0dK?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 867d95d0-79a7-4dfb-722d-08dc62b71680
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 10:29:27.6690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hSWF6QYkF1EpZ1JUwjZanj27afpBSfipzn/c+eyzWqw4ziq7SSdwiXnR2Y9Qk4TpzHaDJc+WswbtrPU6NGbVW+zmsby6jxlVQIxqWAsucTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5228
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2024-kwi-18 17:27:59 +0200]:
> Our MMIO accessing functions automatically adjust addresses for the
> media registers based on mmio.adj_limit and mmio.adj_offset logic.
> Move it to the separate helper to avoid code duplication and to
> allow using it by the upcoming changes to PF driver code.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mmio.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index a3cd7b3036c7..7d003bfb91a8 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -36,4 +36,11 @@ u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg);
>  int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
>  		   u32 *out_val, bool atomic);
>  
> +static inline u32 xe_mmio_adjusted_addr(struct xe_gt *gt, u32 addr)
> +{
> +	if (addr < gt->mmio.adj_limit)
> +		addr += gt->mmio.adj_offset;
> +	return addr;
> +}
> +

Since you already extracted it, didn't you think to use it in the xe_mmio_[read|write]_* functions ? 

Piotr
>  #endif
> -- 
> 2.43.0
> 

-- 
