Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED05E77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 15:29:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CEA10EFF1;
	Fri, 20 Dec 2024 15:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jnzok8S6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0ADA10EFD6
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 15:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734708584; x=1766244584;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=7dsZY0IjwcE1gqiVcn9xSAfU7p+pI5T21uOV7mUv1H4=;
 b=Jnzok8S6b/9nFRghbqvs8chQuwAo8fOxb4tiB8RBYw7/J2itwrC3uKsP
 h5yd6pkH9kljmdcfDXRJk+ymNWO5TNMmrv1b0zVvM5C6o1UccsvJtoQG7
 XhWwofmhllD4KEiyT5KW0Wuv8LfLQPKHv9JEQDYpgTooVIwT7gPDLV/O9
 eu/Jf9SEYurgUNzFcqqLYzzPzcrwj+I0Oj6Z/NlnmapZexWwIRfWuYxNv
 mE4xo55a0pI8wAJgdffQB8c5trkKmELwM67nukfQJK5gpAfBWgHr2VDeb
 zm2Q9o2W0p5MxoAaKu+Z6uf+V0rhL8TMO7TBIvbBI5V2u3nZdnUHCPT7o w==;
X-CSE-ConnectionGUID: gvOKO9ruShe6nHq31QQ7dg==
X-CSE-MsgGUID: vNwsvmhEQ1mPnudNxIAsnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="34974195"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="34974195"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 07:29:44 -0800
X-CSE-ConnectionGUID: B1hNWLD+Rnq9et7Z6W/4dA==
X-CSE-MsgGUID: cTU1b7UgQvmJMv62ZT9rgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135882905"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 07:29:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 07:29:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 07:29:44 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 07:29:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=soISI/PSu0SirBO4QB8V5saZoU+9exRoRU2y2H6SXoeMnHnZj1zoY4Lv1LfOKLDo/eoGRvN66WVUmRTJ2KZc/y/cOz+qB7CHEfUveYmX6rq/Bo05ynx875H53qeO/qaQwdDvfP3scLdk8HmQ811jzb9Em/IfzZkWFvPc7Ya/xX+GjdsZ14ZlU8EMkStA0uCLdZeiWNkEFyq7vX8SJhXq4+J65IvczGPmJonGOXCezjec17n/iN6P6quc0FEakxZJpIfFV+zeXiNgmeNyMpYCTNFA+zfutzBarH58VRZqVjNdHW2IPJaIFWgDDqrWyC+cCZbToP52uVBU6HpUW3OHpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwNd30qaDoYO4AfW04+ArgGzF5135ferRQjgFs1Prxo=;
 b=K8UmJhzxwy3EGlH9+5OMGRmjVW95snOgzNJVjSDQ2o0qI75M7y5YSgNbEmvobPpuoEdLRGVRiZEIYOv3RO2pkfDwHDb6R7YqfQhS5YVB7AVbfnyS43JW1ivYIKrhih5WnXyT22kL8BpArpb1xxyNV265MADsJR+8t9b40u/TkoVMxsFos30wcVe7hU5e4FSv/xUCHmqc8NocbS+moozm0r3pS0HQJw+4FqJXjK6NzFY5gGcv0CTeWLeivUwRkudE+0Lrsgbu8hwRDVYRNMysktvNM7D5POegwPobhuCV0srNmuSArqnzjuWw9PHLJuomOWXhJAjmU63s9Vf+QPYEFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by IA1PR11MB7855.namprd11.prod.outlook.com (2603:10b6:208:3f8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 15:29:40 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 15:29:40 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>
Subject: [PATCH] drm/xe: Introduce the RPa information
Date: Fri, 20 Dec 2024 10:29:36 -0500
Message-ID: <20241220152936.623627-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.47.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0108.namprd03.prod.outlook.com
 (2603:10b6:303:b7::23) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|IA1PR11MB7855:EE_
X-MS-Office365-Filtering-Correlation-Id: 5adb35e6-ba88-49e1-83f2-08dd210b1ecd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OZdYJlGcstR6KhrZjFNLctn1V2nJZthF/bXOe6CjavROcf+TrBk1bGoGgNVD?=
 =?us-ascii?Q?QGS8qmuWJN1tRwYE6ldmDOy3PPhTE3TuuVYUO8bNT9mvviafe1f9b+ivKahZ?=
 =?us-ascii?Q?0sTAczzfTk0sJaMrAGTiNHbwzHvv8UtVdn02DGmcQ+VdbRVYKs2taQfuyi+Q?=
 =?us-ascii?Q?BfY7CYyjZ7K9WGKWaSYc4IUYWIYQ0dQcuF7i8o1TkbtUUnPJw8uT/krBahnA?=
 =?us-ascii?Q?kRC09gFXNjtFUHl6hqkxOyzni5m648RFEg2S5u8dZ9HSsh+gXCDajYG+AVPi?=
 =?us-ascii?Q?ThJwAPyGDKJ09kM7JF9omdhqfE227DygsKchLcvLm1w3Wt1/XbSVyr48xCvx?=
 =?us-ascii?Q?UvIShj5fehnPNKR3wNa2+/GZMiCmmSHgmMTkp9cOfuJwRanzj2yIHSoVAa70?=
 =?us-ascii?Q?++9cA9WBta5LXhAaT1mwtjpUCirJJvHBLoF60Nomiudx5ooZq64N5an2ZaUK?=
 =?us-ascii?Q?mBN5C3d9MJR7b3D0166S1KU9q8QGbMDaEHNcixUg9kdBBc1f7eRzzfBeAO5x?=
 =?us-ascii?Q?5rZWCc39Zbdovyox4bSXkzqdTEZvYLAn8m01czZijcf+EL98S0jw/IFHSxz0?=
 =?us-ascii?Q?QNxc2lI7vDuYL9BTrvaCoGoy5rpuchtvtWcGo9TW57hiLSVR0aEuVOKGEr5l?=
 =?us-ascii?Q?5Tlq6W/M6EoYRcI4vTVRKPP1rlcu3eeLwL7Yri9RjiBq0WGDwU2jEuPS7Hbu?=
 =?us-ascii?Q?HSIFQCe0hWMpFg77bbR83wtY+eGaUkVzMmW3c2liH3SLOqbSj33U5Hjk1scF?=
 =?us-ascii?Q?9zZCl3hGVAi63A6KXKzNUD6cBXCs39btVOAbK4vdBEpbdmwPCP74S5qHE5B/?=
 =?us-ascii?Q?ksq/8u0FyU2eFoo0ZmWqO4XPP7gJu3H23bDifQWk23xjRjwdlOrg6K2s9LeI?=
 =?us-ascii?Q?59mwnfw9FrmYe8SBh1Q+/mhxSJRIUHTTX3EY7u5YI1Gh6IVY33yCwioaoH5Y?=
 =?us-ascii?Q?TScOHZMMBR9Iq3OWFTKQDcDM2cryiG0JjQKY6Srnv5nmPWIsPQb8bZ8zculc?=
 =?us-ascii?Q?XMzYVk0ebVFXRT3IffPtv2PtnDNBbAqiC624Bto05QwJademmj+Oeg5Rj+dn?=
 =?us-ascii?Q?X3ketAcDzMnCIQ7TvWDdcystG3wKPMn/bzDk2dyMwRDWcQgxMZTeLPGaGjDQ?=
 =?us-ascii?Q?G2NPfKimP/exaatftBpmxjFvzDIKq40l8oYCF9fBqxPkA2UNt8sSv7Jd7x4y?=
 =?us-ascii?Q?BU19w0F6JmkMBGcpmcMJSeFlFP9NMRE3SV7p2cNT9XEO3einWN3L9RPwJUIx?=
 =?us-ascii?Q?zw3O3hdq5SBkBjnW7G4UbzR37Hx3Ye18KMBfS7p0CWjlPwfBKCEwCPm3ivY6?=
 =?us-ascii?Q?RKALGI0Ngr3SvmLXi0FC9sJ5I5NCBFBgxrvEVJdTsDSN8gAOOtem7MvVJ/ak?=
 =?us-ascii?Q?5NL/rbObI90T6c+HAwMpUfzZxdz1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B5rtOt/+gbVPlG2F2NBNmgTvHr9h/RkhotsY/dhTBTzXjj4/MUHCWE9teyPk?=
 =?us-ascii?Q?0tLpOAQie5a/4omSC91tySxHEuaYyTRnZY5IOGA08E1Ek1NMJHFz9nRbHQpm?=
 =?us-ascii?Q?g23DNT5r4MRedqEJ6DTtcwAMBi3MrvriAuQ6s00KyJdgeaH1IiU8V9de5Q5y?=
 =?us-ascii?Q?OVAdpDou5utG0VPptG5i65iN/hUK3SGJ3505dTypTcpf3StirfUNthAGfWme?=
 =?us-ascii?Q?ERMdXV95fXuIJijX+WnsFq5si//Orx1YGoKKBzmDAS5ambELx9f3BtL9cejn?=
 =?us-ascii?Q?VKhY3VKTRlHsxl687RkCWlC/Sl4Cnwab2RlF9uHiYPTXQOzk5aApLrt7am9C?=
 =?us-ascii?Q?xFMKc/C3ds65QvZrpa8qes2rueHw3ovXV2E4mrDradA9f41fyA4OrkAUKvQ5?=
 =?us-ascii?Q?0McAiNwFPi9KlMTR1aYzM1fXJpV/ZPvTjN3sJrX1cU2+Ctk3fXKPTeU7YoTs?=
 =?us-ascii?Q?sWDIXMTLQ7exxKrdRJTEwWoIMGV+6HiKOIAwR1Jl4cOfLUosZbYEmA1aEPqf?=
 =?us-ascii?Q?lpUrFJ2cpAOeSZTOzWTbtetbk8GPFGcrSHsyj/9z8QlJetViwIauTkPGLkKW?=
 =?us-ascii?Q?iDVi6F4qbQoTWoNsLP/0q6daSCUOushn0Bt/ZQMKJXk9AkSklLNDO3gJXDEe?=
 =?us-ascii?Q?oFi11A+6R0BjKMDFL0o0+v/9DB6Jgi9/a9zzQ8CEwS+BVSFfTJTlT7SekFXk?=
 =?us-ascii?Q?xxhLkdWha8f4zkyDiSHBX22tRtlZRNR+8aPK2fAHux6tWQnkrYFA8mpLYNiW?=
 =?us-ascii?Q?mkZigpCFOHj3ZjVkNQiSFcLjpxey2NOtDHMu8gYYEUOj0oDr6kc3kZbEZDQz?=
 =?us-ascii?Q?safuqY2uQ7o5kwvqKDE6R+QsxdNrYPYSKXqBtmIFsUvVrmun9ql4kaZtdq4A?=
 =?us-ascii?Q?Ew6V0sAk7CE3QKygEN3v0zHT8eaw4V0SaKFU+rCO+Hwqzelz/XiP1O2ZdHVO?=
 =?us-ascii?Q?zKItZTFTKTUBkMSpt7cK7hL7LPN/yXw/M1D1EVbd5bJUmS6XXwxOCX16I5Y0?=
 =?us-ascii?Q?ZYbZiP+TeYSVe3RK1HYL71Dsm2K2dI+GPkju4gcwmJJXSEug74r5Rt/NH1ru?=
 =?us-ascii?Q?GIPhu2vvPy5SI3tM81oFPx1BGB6zFh9mGLA9uID8PxUftflgbGGF94YiH4lm?=
 =?us-ascii?Q?bmwtnj9yOaapFfl7q9oeCsYaZgTzbW5k6XL15ScuVDmIsIYPMoMPWw2sbFXt?=
 =?us-ascii?Q?LMxSIMEWBAba9jbUykCtybxP0TqKxVaTu3nSoR/viVkCHuFj1yZkLqZrFnxS?=
 =?us-ascii?Q?HQAMapZ2rfGyU2dL59vmpy7VzBqRuyoDGjOpCqrQKBuKOsmIhzAwpEKD6DqT?=
 =?us-ascii?Q?dxtCX319J7iq5VpGRNy3/5iylsHVrPSIplLDv7bmzc3GQ81FveAdkTYNRtzF?=
 =?us-ascii?Q?6U+m1wFv71xO81cWP2/QOgUQ3WJhbHjHm5sedlQXKCNwqDNbFnJRcNexHpNW?=
 =?us-ascii?Q?3H2ZhzzF5oxT0OJys/JoZNrDfeodYV+ACCOwwkZf6zQcVDper0CssW5VGrkU?=
 =?us-ascii?Q?bqWlzfxoSeTqnIkAA4FY/u1+GP3XsrDUfMuTLEAV90BdyytEmgaK744ZLcMu?=
 =?us-ascii?Q?C/Nx+XQt4vAADo9MDwFujETgU2pqcka8zN44zzlAJxQYzt7sftXhQWp0Ozjj?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5adb35e6-ba88-49e1-83f2-08dd210b1ecd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 15:29:40.3995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uR0WPZFRdaLHnpQbBwYIys/Oq143EJ4ePArghflta+BqiavqGORxzh1DeCzGQtSc5PgDEHoYCvkWdJdxSnmI6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7855
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

RPa is the Achievable frequency, defined by PCODE at runtime
based on multiple running conditions.

v2: Remove RPA_MASK from i915 file

Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h    |  4 +++
 drivers/gpu/drm/xe/xe_gt_freq.c      | 15 ++++++++
 drivers/gpu/drm/xe/xe_guc_pc.c       | 53 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_pc.h       |  1 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 ++
 5 files changed, 73 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 3293172b0128..6cf282618836 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -44,12 +44,16 @@
 
 #define MTL_RP_STATE_CAP			XE_REG(0x138000)
 
+#define MTL_GT_RPA_FREQUENCY			XE_REG(0x138008)
 #define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)
 
 #define MTL_MEDIAP_STATE_CAP			XE_REG(0x138020)
 #define   MTL_RPN_CAP_MASK			REG_GENMASK(24, 16)
 #define   MTL_RP0_CAP_MASK			REG_GENMASK(8, 0)
 
+#define MTL_MPA_FREQUENCY			XE_REG(0x138028)
+#define   MTL_RPA_MASK				REG_GENMASK(8, 0)
+
 #define MTL_MPE_FREQUENCY			XE_REG(0x13802c)
 #define   MTL_RPE_MASK				REG_GENMASK(8, 0)
 
diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 6bd39b2c5003..604bdc7c8173 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -115,6 +115,20 @@ static ssize_t rpe_freq_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(rpe_freq);
 
+static ssize_t rpa_freq_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+	u32 freq;
+
+	xe_pm_runtime_get(dev_to_xe(dev));
+	freq = xe_guc_pc_get_rpa_freq(pc);
+	xe_pm_runtime_put(dev_to_xe(dev));
+
+	return sysfs_emit(buf, "%d\n", freq);
+}
+static DEVICE_ATTR_RO(rpa_freq);
+
 static ssize_t rpn_freq_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
@@ -202,6 +216,7 @@ static const struct attribute *freq_attrs[] = {
 	&dev_attr_act_freq.attr,
 	&dev_attr_cur_freq.attr,
 	&dev_attr_rp0_freq.attr,
+	&dev_attr_rpa_freq.attr,
 	&dev_attr_rpe_freq.attr,
 	&dev_attr_rpn_freq.attr,
 	&dev_attr_min_freq.attr,
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index e8b9faeaef64..a6fdd2c062ff 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -38,6 +38,7 @@
 
 #define FREQ_INFO_REC	XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5ef0)
 #define   RPE_MASK		REG_GENMASK(15, 8)
+#define   RPA_MASK		REG_GENMASK(31, 16)
 
 #define GT_PERF_STATUS		XE_REG(0x1381b4)
 #define   CAGF_MASK	REG_GENMASK(19, 11)
@@ -328,6 +329,19 @@ static int pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
 				   freq);
 }
 
+static void mtl_update_rpa_value(struct xe_guc_pc *pc)
+{
+	struct xe_gt *gt = pc_to_gt(pc);
+	u32 reg;
+
+	if (xe_gt_is_media_type(gt))
+		reg = xe_mmio_read32(&gt->mmio, MTL_MPA_FREQUENCY);
+	else
+		reg = xe_mmio_read32(&gt->mmio, MTL_GT_RPA_FREQUENCY);
+
+	pc->rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
+}
+
 static void mtl_update_rpe_value(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
@@ -341,6 +355,25 @@ static void mtl_update_rpe_value(struct xe_guc_pc *pc)
 	pc->rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
 }
 
+static void tgl_update_rpa_value(struct xe_guc_pc *pc)
+{
+	struct xe_gt *gt = pc_to_gt(pc);
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 reg;
+
+	/*
+	 * For PVC we still need to use fused RP1 as the approximation for RPe
+	 * For other platforms than PVC we get the resolved RPe directly from
+	 * PCODE at a different register
+	 */
+	if (xe->info.platform == XE_PVC)
+		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
+	else
+		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
+
+	pc->rpa_freq = REG_FIELD_GET(RPA_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+}
+
 static void tgl_update_rpe_value(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
@@ -365,10 +398,13 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
 	struct xe_gt *gt = pc_to_gt(pc);
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (GRAPHICS_VERx100(xe) >= 1270)
+	if (GRAPHICS_VERx100(xe) >= 1270) {
+		mtl_update_rpa_value(pc);
 		mtl_update_rpe_value(pc);
-	else
+	} else {
+		tgl_update_rpa_value(pc);
 		tgl_update_rpe_value(pc);
+	}
 
 	/*
 	 * RPe is decided at runtime by PCODE. In the rare case where that's
@@ -447,6 +483,19 @@ u32 xe_guc_pc_get_rp0_freq(struct xe_guc_pc *pc)
 	return pc->rp0_freq;
 }
 
+/**
+ * xe_guc_pc_get_rpa_freq - Get the RPa freq
+ * @pc: The GuC PC
+ *
+ * Returns: RPa freq.
+ */
+u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc)
+{
+	pc_update_rp_values(pc);
+
+	return pc->rpa_freq;
+}
+
 /**
  * xe_guc_pc_get_rpe_freq - Get the RPe freq
  * @pc: The GuC PC
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index efda432fadfc..619f59cd633c 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -21,6 +21,7 @@ int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
 u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
 int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
 u32 xe_guc_pc_get_rp0_freq(struct xe_guc_pc *pc);
+u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc);
 u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc);
 u32 xe_guc_pc_get_rpn_freq(struct xe_guc_pc *pc);
 int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq);
diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
index 13810be015db..2978ac9a249b 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
@@ -17,6 +17,8 @@ struct xe_guc_pc {
 	struct xe_bo *bo;
 	/** @rp0_freq: HW RP0 frequency - The Maximum one */
 	u32 rp0_freq;
+	/** @rpa_freq: HW RPa frequency - The Achievable one */
+	u32 rpa_freq;
 	/** @rpe_freq: HW RPe frequency - The Efficient one */
 	u32 rpe_freq;
 	/** @rpn_freq: HW RPN frequency - The Minimum one */
-- 
2.47.1

