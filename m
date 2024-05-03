Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD646C4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 19:13:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71EA51131E8;
	Fri,  3 May 2024 19:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mL570gAZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1641131E8
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 19:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714763617; x=1746299617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=OE40ldSC6UF6Y/QhC/npSvKWurzSe5PPubm7E50IPgY=;
 b=mL570gAZuPwmO6AGcRP2FvmBoCA7VwFz+jC0+ex5dY5PF32SZEit7Nx0
 3ob8K6UcPG+BsIE/A5/2R143wUGXFlV28x1XPFHWTeLMH1ERmSqQeyge8
 UTCQQboUcVJKp52grz7dKIX7i2+RDPaDkHO6ZFzWnoMQwm2yDVBCJfp8X
 5uWFJgMrzile3ZqsWslXykd3bcy01or6tThFAHMsGyhX0JHJ8hDCAiEgX
 B/4qUqc8m3Wot/AHdeB+9kzt30i7yIeH+Ok6OMKZOSluys1zirSr+lIhu
 xWu71Vv7qqvk3Ry5+pAAsOnNJyD9Wi3Jx45oYmQXeRK79o54gczI9Kfot g==;
X-CSE-ConnectionGUID: diIRzv31R3+542iiWqNBlw==
X-CSE-MsgGUID: YZwVN6LhQ4e3mChiufAJ8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10708800"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="10708800"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 12:13:37 -0700
X-CSE-ConnectionGUID: 00X2rzALTiucBkTxLhfckg==
X-CSE-MsgGUID: YUchEZ9nRRuQ0IDG+gPDXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="27943513"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 12:13:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 12:13:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 12:13:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 12:13:36 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 12:13:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBK58kIy1XWyQrEykNwLEk2stf3yuAEA37x+2pAFEZ4RbIBRAgkfhynXFaKnOizSIVhTHMn1Te7/kpjiRaah74S7C3zHG3qsVJJAW8ufoThlsx/I/X/hRxBUdbY21vxMN4blHJTmwCstNWsvrUSIMEO+54t00lA5Gw/NIQ9c+NQ9oexQ7YzNPml7kMPeZJNymWQKawApbE+aEMzRSNV/s/WjD/IGu+P5IRpCGi+Vq5W+ukSD/nhFq4VT2EGIBM/rF091uC5cdDxs4VXIicWFyZF0+T3txCrQOcBKPTloYYN1/Xl9s6vCHlgQcbF0XsUCMSdUR9vAkW7SP/c50Zl/vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9krmgVQlR4dC9xBk4mlLgkhTECWqTFsFEFYSTsbvnaY=;
 b=CKDYtPxviC4XqiXQq9DNJ1YywEVRvlJIWBYQeougHLi0hJcYC1C6cOw7gp47O1lCF7ceqiGoElC/T988xUdwgV2C+s1/NJ45EGqtv3p7LOAnKvs5OTzHOvlu+OiMwgnvO/olqLQwURLU+2QetZ1RaZVBxHpSOkeamEUcBbaOvCet1HSq7euLprLYUTxuqDg8dQqUmTMm5jRrcFIcNoBGImR7JoxdUa1Ws7BI/OmRE1r9JvbdOn6xX0AbQWxjbGDhEhi5iAjenanrx53GuXWauIcmyFbVyB81WZUSAQRzNBGc9RYclnLrNXmlZUqSEgJZHfmqNM6+c+3Tb61iNxlOcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7922.namprd11.prod.outlook.com (2603:10b6:930:7b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.33; Fri, 3 May
 2024 19:13:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 19:13:33 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <matthew.brost@intel.com>,
 <francois.dugast@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <matthew.auld@intel.com>, <anshuman.gupta@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: [PATCH 5/7] drm/xe: Prepare display for D3Cold
Date: Fri, 3 May 2024 15:13:07 -0400
Message-ID: <20240503191309.7022-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240503191309.7022-1-rodrigo.vivi@intel.com>
References: <20240503191309.7022-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0017.namprd21.prod.outlook.com
 (2603:10b6:a03:114::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: d91a0a0f-c822-4252-49a7-08dc6ba51ffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BTcI4csn+I1YWpMOyXTAKO80usNE9wEKXCCI7uPbJbKhbeqANp5RbulqiCvN?=
 =?us-ascii?Q?JLJgCp0So+cywnzU19XV7FuCAysF+8frvasxwVyfdo9CJPTxgQFeHOH33iTQ?=
 =?us-ascii?Q?yDLG56i742fSv2eUhKfcTvwFDDsXQaw1dg7sTFPukhYx7FFLiswlcvve5Bki?=
 =?us-ascii?Q?YOTPgH56/1TO17TcsDpFiJ51CQPaqqLWlnn9WiRRgsJZVRnrHCAdCSC3ZK9E?=
 =?us-ascii?Q?+JknviVVMO6EJ2LhXjv4jXAoT4kO8bAvFGqKwm8oAHVCPiuu85QyoG/3KaHY?=
 =?us-ascii?Q?21mrtQ+kt7bTQi+P5oqB/hH1mvSNnp4B1S4Qh+XbAKuEnuid7AO+qmhOtqVU?=
 =?us-ascii?Q?MRFSa/Z4dDX4W4CKUX84LvJ7/bmozYh+6UXoSUE+1RV4ZiAN2YDGCDy7tpcp?=
 =?us-ascii?Q?Q08pibLAoyuBcJyRCNe4twbh9wRfM8rFomA7kU8ZIBNqFDtAkPkqF+4vROV4?=
 =?us-ascii?Q?BfA03gz/PF0+jgexgQLd64mjIrRFkK5okx59M8B2pUtH0hhjOeh0d5Y5QmTD?=
 =?us-ascii?Q?P4zUUWvxtUThZ+EM1D4dtcyYTtBHjp1RWUDCyCKQshI+gnbbLak7NReXt5lE?=
 =?us-ascii?Q?v89X4xFwy4BdyE8S7zpaSzDHEgkyEHRWeLllnWOYQv8TrWpPtNMY+a0Q2AIk?=
 =?us-ascii?Q?DebSK/x0QQMoHsNKfNGvhsglHrV6yWsdXJjatOgXZNLoXh+CIbdsTmw36BDO?=
 =?us-ascii?Q?3N5tof/LrXAKMiBapfrDJyl3NcYa+v41n/c+stNqaHJwomW7MdPHcZQ68xwb?=
 =?us-ascii?Q?KpwdUHxTa+EMvzBVLZUgbhOsmU5YQsGOti2VLABID+gFly8D3gEJjkC2yjWl?=
 =?us-ascii?Q?clk5YkwD1veQUKDrsGfqzrKlfKiSAVtYjvEbphjdQTpYLVu1OrbNJx3MCxFb?=
 =?us-ascii?Q?gEbE3kcizYUnpuYNYabT7BvNf39H9LU55yzqd3eVNzRTrSW9Yj3A1niVC986?=
 =?us-ascii?Q?hnc1NLWBBPqqcpeZEvtivg8Ddpi26nwSjZxgKlcPJotL7OILJMnr/ubnsXT9?=
 =?us-ascii?Q?g1AYe2pmWaqPVv4ZiL8tWjkVOGgvG/KToLlsQXQc9ax9i4UK1cPDQ0H2rSWl?=
 =?us-ascii?Q?ow7ZUm8Fy721wJc5eY8AsXqG1rLpmFEbKQd/sDECdFzC08qSKFlCTVQ/uwZk?=
 =?us-ascii?Q?MU/oE7W+EyZDc3P83ZzMjZ/YOgLp64RgPKOh993kZAb+aUPefAfmY7AujfdX?=
 =?us-ascii?Q?QWRl1kNN/r0W7S3+v/Me8QejMb5yg8/OIACesKgAz4p62fFocX4CN71X4+XX?=
 =?us-ascii?Q?cYlps5Jch0B7zhdZa7tYKUJoAnZT4w18rd1J9MiEBg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?opXkg8xKVaJWddD7615XPdLD7VeIzZ101k6S//IKzD0A0JV1Lgzyf3oS9tne?=
 =?us-ascii?Q?tT7/8y52MgG/nIoV53X7JhtpYGV7s+LwxV9alBNDae57HKxvI/QgyiQDC9Vq?=
 =?us-ascii?Q?/nku7cZF82A+U0PkUD7EoG6iG1C6uUqu4YomvQb8qB5ea6ORwexQdv37+Yc6?=
 =?us-ascii?Q?apmhDz6CvgQxRlyePffaLUZvHjfeOu76V9EWNLtsTv7jttWOx5z1xM9Oufkv?=
 =?us-ascii?Q?IyaXhKp/RufSeqUhs2wkX13LWQ9W6/JL4ohfbNTQfoKEV0bePJ8F+g8jLJ9V?=
 =?us-ascii?Q?7M0QevShZbxnbofO+mWf94WOU+2E7lU3UuxbHwAAIrrgskNDNPd8NfTM8WwI?=
 =?us-ascii?Q?bg8/TPd3+xgdSE4Cgs/Use/FhMucLi+oF8sLO2o6c6bwKF4Enrfz9XJpXg8m?=
 =?us-ascii?Q?wlyDveYB3qConkFDFBOmmu1KUkebEriR0w+U2mSz2gOCf5b/IDNXYIxkcSmo?=
 =?us-ascii?Q?WHtXBzMxnmnT0dJIQAMHDU2vTm5VcP0+8Kzr3j6tq8PBjEiOlm/ap30UARft?=
 =?us-ascii?Q?tf2BmnQyQNRmbl8bRmpOxCW4nwyhHoGrtqIBSwnHvIdBamYxiM4UweG9c0ST?=
 =?us-ascii?Q?A2Q/I1Iu3LOplSx0UdcVWPfwbZlpjdDj342qIX+LBxM5o/TjhjNWmRrDAeOm?=
 =?us-ascii?Q?wk12E2LUaLZfr7ehsSQYOCAkgI3jq2MfsuC/7WIy1+KWJSpASojywuxXaZj8?=
 =?us-ascii?Q?PB0KDuijDxl3wFMsJqQJZbNFoCtW/ED+SEG2XBxZHb6whfargxmG8+XUvynF?=
 =?us-ascii?Q?jCt36QA/01Gq493/8vHW1FEtm7YhCPC892wmeikigB4Now/nlxPh8TXcNh5N?=
 =?us-ascii?Q?rREt981RxVHbAisePnttwQceh8IEosyPnnTeufVu3F+d1gS8LIN8Ahyhls4F?=
 =?us-ascii?Q?uw7+08b4FVtAbf/VKj8tmxOqSn4Xylq1jKBKKvltX3YgVp5zpW5J5GGcscn4?=
 =?us-ascii?Q?R6K+c+jWSAWxHteEN6rO2A2vbQcgGpOFJDBHsxmMAO7ZG6NCG1Ix8rCwHUnA?=
 =?us-ascii?Q?ubdvjqDxETpeLRQXvA73Wea06N0ExH6iP/6im9J3+ZSxLGheEcZn7YpdXM+V?=
 =?us-ascii?Q?/oRi85imNbvSNRummTCSpZn2F42EeGoQn5BvzcSpsDp9BA5iXJJvVagWfVpj?=
 =?us-ascii?Q?JfpftLzE1gmB5T+GMe1YTMW1AjKvVX+s/9/LZKtvWBYaUZlGfz11xh0dK4Sh?=
 =?us-ascii?Q?WC/SaU+mTzl+fxOVEEkx7k9M8Ml69Ssd/2vU0LrFuRAfMsnVTK24gIPbWK6+?=
 =?us-ascii?Q?O8AeIDfNVsXkKnfiyfsanxsPGJGcg16dcg2LP8SWYPtGO5cQuUWbnda537GK?=
 =?us-ascii?Q?hWFAwsqathnjm+nWt7gRZ7NsPxpyKrlG9FyOyNRHCnuHLvjuRKENc31xTTno?=
 =?us-ascii?Q?xKi1rUj1WmG2U4zPLw3BfAk51YFP2I3uAQdWLptcE+5wUvL+Rucok4Efo1GW?=
 =?us-ascii?Q?qChre5EvBbhKrCZWWHEf93xv2M8LEpAF+xoF7OAHNcFLvpKiWlqMPunLAnjP?=
 =?us-ascii?Q?aLSXuqWny8kJ6vKtkWwQia1HDZKtFSkai+HfZTzwP3Xnu7KuAIRp2ScTM3vv?=
 =?us-ascii?Q?/+cESMTJzHo2cHdRlI8ajAWUr/gBllie7ccaKaW0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d91a0a0f-c822-4252-49a7-08dc6ba51ffc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 19:13:33.4508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15cT2ZLYtEctFS9187wTdNSUELhzDA8HhYZxYnECor6n5CzSNkSnX2dCKVne+7Bxr7ikAiRrlJhw84H6gEy4xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7922
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

Prepare power-well and DC handling for a full power
lost during D3Cold, then sanitize it upon D3->D0.
Otherwise we get a bunch of state mismatch.

Ideally we could leave DC9 enabled and wouldn't need
to move DC9->DC0 on every runtime resume, however,
the disable_DC is part of the power-well checks and
intrinsic to the dc_off power well. In the future that
can be detangled so we can have even bigger power savings.
But for now, let's focus on getting a D3Cold, which saves
much more power by itself.

v2: create new functions to avoid full-suspend-resume path,
which would result in a deadlock between xe_gem_fault and the
modeset-ioctl.

v3: Only avoid the full modeset to avoid the race, for a more
robust suspend-resume.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 10 ++++++----
 drivers/gpu/drm/xe/display/xe_display.h |  8 ++++----
 drivers/gpu/drm/xe/xe_pm.c              | 15 ++++++++++++---
 3 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 0de0566e5b39..4b3fae8b4893 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -300,7 +300,7 @@ static bool suspend_to_idle(void)
 	return false;
 }
 
-void xe_display_pm_suspend(struct xe_device *xe)
+void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 {
 	bool s2idle = suspend_to_idle();
 	if (!xe->info.enable_display)
@@ -314,7 +314,8 @@ void xe_display_pm_suspend(struct xe_device *xe)
 	if (has_display(xe))
 		drm_kms_helper_poll_disable(&xe->drm);
 
-	intel_display_driver_suspend(xe);
+	if (!runtime)
+		intel_display_driver_suspend(xe);
 
 	intel_dp_mst_suspend(xe);
 
@@ -350,7 +351,7 @@ void xe_display_pm_resume_early(struct xe_device *xe)
 	intel_power_domains_resume(xe);
 }
 
-void xe_display_pm_resume(struct xe_device *xe)
+void xe_display_pm_resume(struct xe_device *xe, bool runtime)
 {
 	if (!xe->info.enable_display)
 		return;
@@ -365,7 +366,8 @@ void xe_display_pm_resume(struct xe_device *xe)
 
 	/* MST sideband requires HPD interrupts enabled */
 	intel_dp_mst_resume(xe);
-	intel_display_driver_resume(xe);
+	if (!runtime)
+		intel_display_driver_resume(xe);
 
 	intel_hpd_poll_disable(xe);
 	if (has_display(xe))
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index 710e56180b52..93d1f779b978 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -34,10 +34,10 @@ void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir);
 void xe_display_irq_reset(struct xe_device *xe);
 void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt);
 
-void xe_display_pm_suspend(struct xe_device *xe);
+void xe_display_pm_suspend(struct xe_device *xe, bool runtime);
 void xe_display_pm_suspend_late(struct xe_device *xe);
 void xe_display_pm_resume_early(struct xe_device *xe);
-void xe_display_pm_resume(struct xe_device *xe);
+void xe_display_pm_resume(struct xe_device *xe, bool runtime);
 
 #else
 
@@ -63,10 +63,10 @@ static inline void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
 static inline void xe_display_irq_reset(struct xe_device *xe) {}
 static inline void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt) {}
 
-static inline void xe_display_pm_suspend(struct xe_device *xe) {}
+static inline void xe_display_pm_suspend(struct xe_device *xe, bool runtime) {}
 static inline void xe_display_pm_suspend_late(struct xe_device *xe) {}
 static inline void xe_display_pm_resume_early(struct xe_device *xe) {}
-static inline void xe_display_pm_resume(struct xe_device *xe) {}
+static inline void xe_display_pm_resume(struct xe_device *xe, bool runtime) {}
 
 #endif /* CONFIG_DRM_XE_DISPLAY */
 #endif /* _XE_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index c3adcbaba223..8500dc93f695 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -96,12 +96,12 @@ int xe_pm_suspend(struct xe_device *xe)
 	if (err)
 		goto err;
 
-	xe_display_pm_suspend(xe);
+	xe_display_pm_suspend(xe, false);
 
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_suspend(gt);
 		if (err) {
-			xe_display_pm_resume(xe);
+			xe_display_pm_resume(xe, false);
 			goto err;
 		}
 	}
@@ -151,7 +151,7 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_irq_resume(xe);
 
-	xe_display_pm_resume(xe);
+	xe_display_pm_resume(xe, false);
 
 	for_each_gt(gt, xe, id)
 		xe_gt_resume(gt);
@@ -366,6 +366,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 		err = xe_bo_evict_all(xe);
 		if (err)
 			goto out;
+		xe_display_pm_suspend(xe, true);
 	}
 
 	for_each_gt(gt, xe, id) {
@@ -375,7 +376,12 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	}
 
 	xe_irq_suspend(xe);
+
+	if (xe->d3cold.allowed)
+		xe_display_pm_suspend_late(xe);
 out:
+	if (err)
+		xe_display_pm_resume(xe, true);
 	lock_map_release(&xe_pm_runtime_lockdep_map);
 	xe_pm_write_callback_task(xe, NULL);
 	return err;
@@ -411,6 +417,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 		if (err)
 			goto out;
 
+		xe_display_pm_resume_early(xe);
+
 		/*
 		 * This only restores pinned memory which is the memory
 		 * required for the GT(s) to resume.
@@ -426,6 +434,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 		xe_gt_resume(gt);
 
 	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
+		xe_display_pm_resume(xe, true);
 		err = xe_bo_restore_user(xe);
 		if (err)
 			goto out;
-- 
2.44.0

