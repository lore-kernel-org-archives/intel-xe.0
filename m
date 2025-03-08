Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4894C28B28
	for <intel-xe@archiver.kernel.org>; Sat,  8 Mar 2025 00:57:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6034810EC3F;
	Sat,  8 Mar 2025 00:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZKxDwT51";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA86210EC3F
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Mar 2025 00:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741395436; x=1772931436;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=JcdSVH/TMXkevpKJuwKFFQb57OCZB4Gdn++ndWkstpE=;
 b=ZKxDwT51z/2MvqwoHjcakzcicAZRKxLsWzRqC9C1mHx5zIO/r2KJnfw3
 e9YcESgCLMXVSiKzpJNnvB34bFGevAEoYBcvzF1FKzSrIvPK7o+p5qBIc
 5G2sTD1Kqyq/LAFXQVx8PYMeo8hvmCbkAlcjBCK2a0oW1D4oZXeayvLDl
 drHDBjHN7vDd4Fk4f7XOW8G1jY1CSKvv1gKZDwNkYdH6UKE0B6sVUVKHy
 1kYoNzrGDLlQAxOV50/UOETfhwDGbLtYSQmZiqbcHH/uZaBgPYbDnC22d
 xkhvHPATbWzQ/UzqoDAG8rjsmZZa+v5PnaVXcJS3iM/ycP+OHKn2Evh+m w==;
X-CSE-ConnectionGUID: J1bx/DSSTz6vEEaTDtdCXA==
X-CSE-MsgGUID: +3oIZvuKRSqg5VUAERBeAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="64899043"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="64899043"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 16:57:16 -0800
X-CSE-ConnectionGUID: esIFz5UGQZmzBeb5CHEo9g==
X-CSE-MsgGUID: xdlShZHhRLiFHeTM8hywbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119404093"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 16:57:16 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 7 Mar 2025 16:57:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 16:57:14 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 16:57:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FdkAz5VVr8x3dKSnZOaT6SSpsKUSafY591ardFYEHzaLm72xctrk8FH7lZbc+tABpgu7DL6WbGrWZ9qyghMCFG8syJOCtVjvx1SQNHwNF1aclTrkxckOr84QE67THkXzsm4b6d98u11WS44iK0qHXmDTtgg2vikMkeODxq10NAHtVG4+fufaCttem0CmVnMuUe8I/vZOEAOwwJpuPA5GADzN7vgoYgXhyMaYeqadEaLF91tFbJNMTEo0E35lMfZXKRdS6mlYW09mQBR0lj00IOMBQJeFvY7Tj3zC0Ms1LkF0zPdhaKXuat53Jm5W61yLI00XWJD4FQlZ7yAwpgzRKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPNUT5oAb3gcRnZBeY2xusSkn1xmannK2YCqib3L/S8=;
 b=s0Bjh/6jMbhgvMv87Tncnj91V+kDedW2wlYhIvsjg+YsIo/1bK363q6E6qmbY477zyAQnhKbOQzg7cygTwwrm94lRomqHWvs1o+781aoV7D5P38J++7RTqEgJqe2qIXGzJfSCPG27by5umwU3gXU5BC7FQFXKxYfmgnmM4rox2dXhpwALlO+pkkgmkvFQzt4wal4N5uvcJaW4xh7cJt/lKd2EKyzc0DvH42PkckVEVPZp1T3NoyxhyD1VTHZQrzsnPRexRcnA0Ub8QZ233nuXVr0ptVFBp4fZfyUqNf0A+JEFzaek8Q2GJ9Wz0DDby5ttsE1K1sV0DGM22gEGE4cNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB6455.namprd11.prod.outlook.com (2603:10b6:8:ba::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Sat, 8 Mar
 2025 00:56:44 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.020; Sat, 8 Mar 2025
 00:56:44 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: [CI 2/2] drm/xe/pm: Re-enable D3Cold by default on BMG
Date: Fri, 7 Mar 2025 19:56:36 -0500
Message-ID: <20250308005636.1475420-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308005636.1475420-1-rodrigo.vivi@intel.com>
References: <20250308005636.1475420-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW2PR2101CA0009.namprd21.prod.outlook.com
 (2603:10b6:302:1::22) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB6455:EE_
X-MS-Office365-Filtering-Correlation-Id: f01b71c2-37a7-456e-ab94-08dd5ddc1848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vMhCNETICPFPbUhdCRl1lR3BwHCBnHHBt4fMBfPaRpY/CqMjjpr9KYgqnE7T?=
 =?us-ascii?Q?Zlh/rMgkwTqF4d6HAGFLDBxZIeH1BZ3vZHTCz7GO0xTbzWFJByfW3anjpA1Z?=
 =?us-ascii?Q?eH2AW/Y0lZsHj7JADWwfpc/W11KdN24FxpzSOnIrzok9RiTPt9Z7YBY/qp0+?=
 =?us-ascii?Q?GaMmXSp2dhp136kIjGHwgr8FvbNQJ7hqHoQeDd50QcmkFgs7kQeltQHuwept?=
 =?us-ascii?Q?acUB/RFXhI4fp8eEzxKSzmx5dOe7jITPR/ZoS3YMkQLdIB2aJYQKAT/azitg?=
 =?us-ascii?Q?wMnA96HU7BctbOurszx4jEIUx85HDNRQ0Pd36hJK2kwEeBBURroSvSHHTbzt?=
 =?us-ascii?Q?BdTRI2OhiQPymiO4iXBb6OVnIuIcZEEjBVv8z9zhyCHzxeZM2+643H6uIDTa?=
 =?us-ascii?Q?EoWfnJGyEsH4up1vCiHEyOjlakQrHGncRjl84zA2QFyMm8dkm/wraKETjWfp?=
 =?us-ascii?Q?tY1h+RZdj22u48Q9ucJhpAh+jiPK0wkxwrv4vL8yoe7aE7iPTDapl+cDxas6?=
 =?us-ascii?Q?scXTbBwIdIWUS+vj9gl71hoTzHicTK1OkNkFyi/GZC9LsYoqF9eN1Qbar2Rv?=
 =?us-ascii?Q?mSldA7HZArMZ6XPZKCG4YjQCTqNWt9ZlPfMDgaYT9rDe+mjZizb9mDyIR5mj?=
 =?us-ascii?Q?LKJSehjSFnB2sNA46095qp3BLey7CkQnpxm689ahpUxzTfJEJydUCeKjCM4U?=
 =?us-ascii?Q?n0cxl3KUPJIBWZI+4wJAFg+Qgz6uaH6BmyPdEN0/GS4aOfZZdmqMJbRDddHI?=
 =?us-ascii?Q?vaEoL9SX2xnX22cwLlihnR+A7sgnr9hnAEoBtE55uEWrHq6ri07WKvV2aKi9?=
 =?us-ascii?Q?6rrXTwcIoYBAL44KFFTFgkrSaaGe2NFXxmfJcoTPxJzgcVzz+7Z83DPcJj/P?=
 =?us-ascii?Q?PU2rE7aihWWg6rerlMykQy4+G5zzLHTJoP1dCqDJmKUjKBp64y8Mkot3FuLD?=
 =?us-ascii?Q?7Oqvyic+JAgPlrehxGb4BmmZiDk3NI/wnK9QUVxmANR1OMSLP8XyrYiQJdh3?=
 =?us-ascii?Q?PeVz8cTfWz5xtwtk+dUcubriO7FsoGijCNi1WRLPp3msw6XyIrxTNLqStCJN?=
 =?us-ascii?Q?mqdeuDbOAC2YUktgXhYFC9jPJ5hWENBWydjRNsJAiKX8TytVf2isD32HfVJO?=
 =?us-ascii?Q?Ey7gsmeif/rPxnyhAoMQ2cRAF/dE3vzb6nQa3TrPZMr9wNQeT9eAlfUWx73f?=
 =?us-ascii?Q?9nfGSYPakhi87dPQrN6zbayyjPytMm77n0hGeCSw/E9RWXphBowgdPtz6yPj?=
 =?us-ascii?Q?W96qALY9ZEA5OlnYmA5+PukZOlbMkJHXS92pqT48lKIpsE6BhYlh0yYazFt8?=
 =?us-ascii?Q?wge7+zBslaJpzb/anck1jDx1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1KGqaS0wcUipeGpFtEMqqJpcxsPXgnZ0A6pvnd8wl3xCngGeLYGukmnY8I9v?=
 =?us-ascii?Q?eW9T2W8D/Dgolu3mp270awPtX/Qx3zjSGYWMtjtl5UXBCqmcmhj0XKjxWQAQ?=
 =?us-ascii?Q?b3fYAihI1fz62xLU/yh/lXumg/T+maqpHn4CBBEwg0zFpHcFcGtXiFB4IfLV?=
 =?us-ascii?Q?YplB7+7Lg6gB5u0Wg0JTgwovsW6ZHFNqQL7cPdLihEhR7KYwVflrldNN2k6a?=
 =?us-ascii?Q?k1+bSP+TKwZe5yXH9xnb2ioTNor0nL/XkVVcm3IAb+Iqmiy+vcQGeZI7zNfS?=
 =?us-ascii?Q?/y56UvGBnTsBcRk80yCcdEf9xE1BX1kdbt9CUEueA/y1s2e+O+RVrDPoA0eJ?=
 =?us-ascii?Q?1o5wrE7evImZGQe5FEBIjuBYhRsJvSJggn71Ke98aa8Hao5Q1G8VTV5fPUiV?=
 =?us-ascii?Q?vFlRz+MMZeDyO82SRbTO+WyAdMbi/3yX+sTvIghIWSqQoxQHfFt9wlnme5el?=
 =?us-ascii?Q?ZoGKy8M5xH3bBUsNyfVftJ6N6JjVN4BKxxvfPqpRiPNaqF88Z2tU1JxWc+r9?=
 =?us-ascii?Q?q5a7/eJJhPtmrK2/d8FDQ+5/fUuyGO+HJO4vSvoS+9dg5JlzyaNRrgNdgtTz?=
 =?us-ascii?Q?KsUKqd1r+gpupZwjjnP4txMB9pxKsTlsGnItZFdZwzAXu1WF7ppbaJAdEYHS?=
 =?us-ascii?Q?2fBczexFsFy70vn7c3yHLF0ncXx1NXe0KVh7C6sPkTtzyB9Ny6WWwjciwZOk?=
 =?us-ascii?Q?pBhixlpOHkHMQC9pPi2x0XwLkgLOsibOD/U4vbxdU4waHblYjiXjCDBFgsie?=
 =?us-ascii?Q?t7U6am4PHgLrgacOCogUTtEkwGgrV++Bm3731BawNd+EQ2TCxXVrr1ybZ0BK?=
 =?us-ascii?Q?zuvr2mG95pzD0hneRj5nNEEghq2ewJoiefpqMDW5h50DYrkgqYCbps/F9E9A?=
 =?us-ascii?Q?zMm8N8C0YX9zn0lrFVE/OXtlWhdg27BFSIm2syV5NtVrtli8J329MeLMtfS1?=
 =?us-ascii?Q?Z+WttcqFoxG6gwJpxSgNksN84KZEbRruPLxL2+zzt/ly0DDPp/r5x/nxErrE?=
 =?us-ascii?Q?1jjTetrgJ6qGQLo+uX41HF+V0eQ5Ne79ZkFS9pWUlirLmLAvGm9T2h2Ew3MR?=
 =?us-ascii?Q?e11EcWe+7XL0TlObNECLpoeb2/i3IrFBIgHmnXFgbFOCgKAJDuA+70GSMPEP?=
 =?us-ascii?Q?Y/oi0g7ec12Ua9F0u+nptR/VtWV070pUKN29FdFIF3jeiOl2IrvhRtCqbz3V?=
 =?us-ascii?Q?DOsBsa+VpL+RGCN4s3R4N9qvCfyw/+L9SfLDkr1MQTX+OLJqDq3he2W3fSFh?=
 =?us-ascii?Q?nOKFwF4w3S7/+5/YM4lChjuakNo3HkJ2oDvcVCepGIPoPjWJaGx8Se+GKZIA?=
 =?us-ascii?Q?8T+0J1RpFCJOK5LxO52KtN7qNuaaHaXxt+w7VK4DP2mHa6kw+HsIRIQiOtjp?=
 =?us-ascii?Q?1yAGkZQw+w7gfAMebu01nDUAVTXBm1rLZrSssgEff7lg8HS4uz5eGH1RqjjA?=
 =?us-ascii?Q?Smx18Stnmdi4aEMtZwSZ3R5/rivNRZypi6z7oUllGin4uNnYmUxnnF6VUB2F?=
 =?us-ascii?Q?7noZLXc29r24+Hoa1Vkyb5P4hLR0jHOayeJwst/4SfefLXBIVcWkCX7fnuGd?=
 =?us-ascii?Q?jnbBgcKVMHwcDonWZO8ovpe8s09P3jA3y3iBKnW7Byyi+J+vxgLvmE7M8T9N?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f01b71c2-37a7-456e-ab94-08dd5ddc1848
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2025 00:56:44.0006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YREPOKRf03XyjN0HJ8G4VOEdCRwY19VjmdhAgqV80Gw2C4KT2jW9L/4cJyyFp6fDnhpQiFVW3beimd3yG8Qc6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6455
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

This patch re-enables D3Cold by default on BMG.

If issues on runtime_pm resume are seen and the D3cold->D0 transition
is suspected to block the device or cause memory corruptions, D3cold
can be disabled for confirmation with either:

1. at runtime:
   echo 0 > /sys/bus/pci/devices/<addr>/vram_d3cold_threshold

2. at boot:
   pcie_port_pm=off

Upon confirmation of D3Cold related bug, please file a bug to the
link below.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 7b6b754ad6eb..a7ddf45db886 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -279,10 +279,6 @@ ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
 
 static u32 vram_threshold_value(struct xe_device *xe)
 {
-	/* FIXME: D3Cold temporarily disabled by default on BMG */
-	if (xe->info.platform == XE_BATTLEMAGE)
-		return 0;
-
 	return DEFAULT_VRAM_THRESHOLD;
 }
 
-- 
2.48.1

