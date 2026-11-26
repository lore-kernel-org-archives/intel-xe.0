Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DCD606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 10:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V9JyL4M4;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=fXFDS2BI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2116112289;
	Thu, 26 Nov 2026 10:08:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF131122A4;
 Thu, 26 Nov 2026 10:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795687710; x=1827223710;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=9YUCHAJmM8FIEHM9gWsrT/RZW8qYTZkX0b7ehJQzolU=;
 b=V9JyL4M4sj0FQi6FeIN7SWIpHihKUavE0uVIewp6/XDAnje2adXIJqTE
 6kJi3frounf4+RJKID/9eennGS4Qk9de1KtKxhLClsYwET0A/SsvcsSIg
 keojBCsBQJrTmPJ4IYkxd3L56/yi4/nJmDgsbjyGKskBA73Lk3KeBGZXO
 a2JrbHtj0g3uR4ejM6OLtFTsaCxeJ9jcEgmCggriUSTQsbVUXJm7CxqI2
 4RpVvdM3nzRi5I1Gbb5pe5ltunjjcCt16b927MfLMvjSyrtrYFKCAMTRy
 2fGVMSAwcD/tpooG8+sco441p6WYdplyWBL9q6xsqWxcu81I52xySrCSE w==;
X-CSE-ConnectionGUID: wty9H6gTSdSiKUc7E4FTig==
X-CSE-MsgGUID: jk0GSPvBQ5mPr+Mx6z+Gzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4608156"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4608156"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:08:29 -0800
X-CSE-ConnectionGUID: 69+zExSNSuu4TsmfLrLTLw==
X-CSE-MsgGUID: 4S3mBfYZTmC5owO4UAEAVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12464554"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:08:29 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 02:08:28 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 02:08:28 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.23)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 02:08:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8ZyTFjxdBEWOrlz7eJbzdYonNr3jSNPSF3IAeXHJPs15ivSoLQ7JUs0T6mGP0I4QfBzShrQmjbQZ576V8i06nQMjmI+cfOIdFkLtXWcNwPOdGY2UKM4RGmpq71maMGcRRuPz9oBMx8y6UrAieZimb4lYfom2tbLQS2y7Hnb0m2TMjq9tdWJ+rVhINcgogbL7mEg/zz+8zsUh2S58cUehcaTB/kBTf7HKflfBzNdNzU9s1HJYS8eQ6f4YsVrIn6r6a97Q1F2ToHr8/NA9Tn13z2eOq7N6dE0RbfgENJr7qNKP5XEIOKi56Kzx2c09FdZLfD9AvlGuBLDw65kWvTyyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kG8K8KPEcxUgKB1u4uzCWyyjCiIRcnQB6gocJ5VgMuc=;
 b=Do7L8tMeJ9a4Mnfgcd9Xnv0H+AJLryMb2BCNKNTq8Kx72oTGlwcWUCm+V9UN7yODDAflEE3up/q3wsnF6YZT4yW43cSLdhH7uSc6bAiSvv4ft3PANQlk0GeBmt2sfGBurW/sBS6EQUUN65ruPGA3BMTYAmRnZhA5W9feBG3cvNUngHf+z9tJB3lYWpusPVuw3TW+NTkIeqfSUKHOqi/igPotzp4C5mIja6MW/IBBL0zdNfXCZnw2ppxgeLdMbyi+TmDSe0Xk2tC7ZzB7nOviE+LurhnFnshrWRsfUX4Dy9+3msyO1l9MButl/q6VZOt+j970B1b6GIPWapFugKYZEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kG8K8KPEcxUgKB1u4uzCWyyjCiIRcnQB6gocJ5VgMuc=;
 b=fXFDS2BInTGCnuMG4t9EJK5ZVft7WYICiip6GKdDVVtEfsrwcGfhz0SYrBVfAD9bwtuekRWFsO4NADDUJOerHnqI1YikEzxzsCP7zBNuwwMDf6Vn7yjaQmmFaoJZAT7GRd0c9Oghuue2y02N/+w5eEh2kSWR90Vg/UZ8qWuo0v4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 10:08:18 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0662.001; Thu, 26 Nov 2026
 10:08:18 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: [PATCH 13/13] drm/i915/ddi_mgr: Enable dynamic DDI allocation at load
Date: Thu, 26 Nov 2026 12:07:53 +0200
Message-ID: <20261126100755.1252635-14-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20261126100755.1252635-1-imre.deak@intel.com>
References: <20261126100755.1252635-1-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0001DBA8.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::6e6) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|CY5PR11MB6366:EE_
X-MS-Office365-Filtering-Correlation-Id: dbc2255d-44df-4dd9-4a59-08df4ba53164
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|11063799006|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: rYSHZAbCVLEzLyuDCW1v6BTpPCcpoz/ODZUypuXHdp3sPo09DAmv0VwjjiBGOW6t1T+m6P2px0iRsPhLdYKsmjZd/Dk9wGoNzuJM/r1kzrrsPA0Xta2M4nYuavP4sHHilKFRreelMxawHAc/zT4nZFskAwGsKVKLxtiowTqIZKLqyH6FS3PF5cNJK4C6smrNzAs9ZEDoaFrq0zClSONU595WrwsQ1OJDqIzBRwOyYImT57gPvRUbxvgJunCzkya3LmbppSgc5WoHtY58WcLQSLYh/fX6mjEYghvnrrf3jYB2GS9X/mjGhsFtTHOLSVQeBF3IYIul03D/Y9tOV78Y44r5HLlm/F9fuZJ1KHOt4A87MoWIrNZqgF0oGQ3+5eZdlNdBz9Ko+Rc+UYAWab7PSS8u2ZNnLC+DeTMqzS4Qg+47VRbWRWH6wlxL/dOSe2Us9vMf2xVAuYlNzhS9OprJe1zr9jmJY5C4PKWDItpip6J5uDdLHftuzxHMocmMMdNLbq8MEDQogYJyIz7JNoJC8PTSTtauEOPtKteBMqs5JQOgFO14uxXRL0cl8IYqcIsWsz9i8Vk2FD2auX1EWQokqxK6C1ke+CUx40IJ5jsrcKpZIYSAkKebJ7A9ksIzb5pkIOtFWXHXMjTTJjTp+SwyfbOovjIhPgmgh+bwRxC8j3s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0l2Ug1V/W76L9Rx39fFUhXondzX8+iKnnYgV0cCZzT7rX96zqDxrJuos5pD1?=
 =?us-ascii?Q?bEU3RStbg9Q7R7qf1lElrM5GmqSuBY3s7O4UQz/Ek/RYuiTmdV2XDmwGRCBN?=
 =?us-ascii?Q?+dM2sDrvTZe3x+sIzS65DTlA2mnI9z1XCNWJWV0USvGoF5AyHijflKiozJCU?=
 =?us-ascii?Q?l+87OKoLnQjN87St8y9aEcmrgEV5H44X3msz8YbIO6XxghXA1y1u/mmkue4k?=
 =?us-ascii?Q?GGhd5PpZhxLAM1xmcDc7Y8VC9aJKcdJgb+L9+3KX8PWUW6vOyPot3HzSa+Lf?=
 =?us-ascii?Q?pqoIDN1FcNlffubE1CJSCevHL9KTvzOO/iYuFk/EjhaQ3zm6/PGbq18iHZm3?=
 =?us-ascii?Q?cLiviP1oGJXPMmVXNurTXYgV1q0YwPGS7ov+JXDYN9LkMr9/9e0VEZDoiqN8?=
 =?us-ascii?Q?bIBDcQwxhH6mGvkWkcK7dkaBn5JgrLCJuGr1XsAPvptFCv7FBKFyrte8i0xM?=
 =?us-ascii?Q?b6pIpZI4VAuZzum9AZfqGozolBD8Ovl2uS5HSUZFM0VftirvWX/N20U2GsNv?=
 =?us-ascii?Q?kzlQkY5b5rbEU1MC05cXJCziyLgJWdR93563a0Se0eFYk+kpduxsrwkXDuWB?=
 =?us-ascii?Q?D/jGP0b2USAL9CrJyoc/v4Zel8FyMOapbRfz7PzdzUJ+Pk+DXblo+oxbTRxq?=
 =?us-ascii?Q?P7sXvqVCAm3e26FlOsN/BF5HgL9x6gO04SOhrQTBcneelgGqCddeWhGB44cJ?=
 =?us-ascii?Q?Ca60DY5pIIKJkRDTxXVj41VZMY5Pd53U6OqMg1hxeSN0NNlbUXCDzyuxSmbb?=
 =?us-ascii?Q?6lDcwZgjIQ/TdCFVTM6y9w00uRJyKbH1snEPWYCUZFshBWLds5nEqOfssH1W?=
 =?us-ascii?Q?arqmzgbPABBSb+jU39+ymx/ufc6KdBgYiBWvWKoLKx2Gbg/ZoI9WieWjtJYM?=
 =?us-ascii?Q?T1qdMjtybMSPCOF2peIw4/a2t50vz0WhR/FLgWFtc8Yp3vRpo761njgHA0Ap?=
 =?us-ascii?Q?mjONkx0ykaceJt+USBXAYpxBinW40NsjZ0uB8j1/t5qwsG6vJnin8Ace7eNi?=
 =?us-ascii?Q?cmv1dxPuYcG+yPPlQH5TD8WOA248vvXC0Zsm+ZHRSfWNonj138WofA8tSc/i?=
 =?us-ascii?Q?ZJZcUlEdYJTtjY5DaUmC8FeGka2+8bDHWwW/ik8HlT472sdVgfyQddKmOKbY?=
 =?us-ascii?Q?6VXGx+CXdTO6Dn3FLET3D88TAXqIgpxtIA1b1mGmqGUt4mZWDnvvfKLGLnlw?=
 =?us-ascii?Q?oaDK5jewTeGUtK2iH39Jk7imBGQvlEyh3ll5bfCFN+f/ivthvO/NgA1lgkdM?=
 =?us-ascii?Q?OaGrARYvxIce3ncm0dEHvNlXx9j6KtitS/tE3bxkBk5sTLfh7GmTIYjvtKc2?=
 =?us-ascii?Q?1W8D1GTTdwjcuIEt08Ut5mkbJO2ARiiMwlzEgE5uezQH1PIctPWoGAMV7fJM?=
 =?us-ascii?Q?OkZbZov1ZT2EYF6ttkILzNT/BLHf78rwelFa7zypnDUMlKv5/lsq8MUGfESh?=
 =?us-ascii?Q?J9wOjm+RGciYJGQlhzMDMTkaIKLcN9BPmRe9Pt5OqysFEXCOyffNklqolD36?=
 =?us-ascii?Q?BGqogCJKP1bfCa0RVQyVtJ3BsWEshZGv76u7mIIXWhqMSZPAuClwuv4lMQIa?=
 =?us-ascii?Q?sarQJ1il4/7+kRw0/fhRr9LkhT7QMYYB3yAv09ldJGypnqLhswOxnaxjLASG?=
 =?us-ascii?Q?LepDPHIEE1G2EQZucye8A2gY8zpKGkenidinqw8rwX9IYBAyIswTvCuOMBJS?=
 =?us-ascii?Q?ZfZNytZ1Ka7cZBmqF73Tv/ixI5wN4u/IN0e4gl4YkYS/O12WDCENgLgHtI6m?=
 =?us-ascii?Q?T6EOCCjaqA=3D=3D?=
X-Exchange-RoutingPolicyChecked: k33EH1rBItma1TENZ+rPJgOg0uXdtosrbYXHuTQCdfCJmPPhYbgDOk9kS/iBID/AsztVsdAeGL7ZotIFRqY1csxF9L66ECqqESgmzr8Z81ykG5Op0OEZzrjeLW4IURfTvbxXAFoUfU5kldUnd0342BRLgtzIiVTf6o2fSZRdXRbD/wO+Ljk5gFqlw6COgGOSdjjFWcEOkp/e1kIq8PSE2cyhU7CPzOMfD+UVyN6/eCF1JRFMsSqb93UdtUCR76j6Rj2e3giIpPGSV/nA+mZB32NyqWTGMhl+ZLVOF9QoiRD262QiKKwjKuil67/Zh8iZmc8YJW38b2ot8hmKB1FFbw==
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc2255d-44df-4dd9-4a59-08df4ba53164
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 10:08:18.2628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xp5pQM+p37y5hAxZiFCjoc6X4hcJB7geQiSTZlHPuFJ0zBHpzfva11GeI2lwwOpR4DnXHkMYm5eHtkh7Q99UPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6366
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Initialize and enable the DDI manager before GMBUS and output setup so
legacy DDI allocations and HPD source mappings are ready when adapters
and encoders are created. Reconfigure the DDI assignments and encoder
mappings during system resume.

For now, this enables only static legacy DDI allocation. Legacy DDIs are
inherited from BIOS or allocated only during driver loading and system
resume, and these assignments remain unchanged during runtime. Runtime
reallocation support will be added in a follow-up series.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index a9b03b4a1e76b..5a70228599553 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -484,6 +484,7 @@ int intel_display_driver_probe_nogem(struct intel_display *display)
 
 	intel_pps_setup(display);
 
+	intel_ddi_mgr_init(display);
 	intel_gmbus_setup(display);
 
 	ret = intel_crtc_init(display);
-- 
2.49.1

