Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A49C021A4
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 17:25:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F309510E4AC;
	Fri, 14 Feb 2025 17:25:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="arU2wrXH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA6410ED1D
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 17:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739553942; x=1771089942;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=un1/mwvSAebgA0azRZdTpx8/mokmskqvKZVdpaVJVEw=;
 b=arU2wrXHtb65FaucywYm1YwPsXmzHt2NTiSGqT5EYHuiZtIY3dA/B98M
 aj4Bh3g16KLUjgHykaSIuVSkvW36ODg21PhGx2M5tyiYHroVuDDxsf1ZH
 /XpCOPL7olfRMq9TSkHMg/3cIbCJh2Z/h8zMWtN/d+VBoVYebHYHtoUKi
 cqWg9yMwCgyuhAzfUsWonzItyj0iL5153H8EKsSMXfB+XmPO3GLgBDNuf
 EcFOapzt6hHL6FqvnSBTZIN6+MB6laYRA2YkE9clsFgtgUWv843bUiUfj
 VDCBCMc3wsbvLshrSIRZqd8MWZ/U3RFzTuwrF+t4UtmnI6cUHw0e94uiY A==;
X-CSE-ConnectionGUID: NfmC17wISnqd/UoMxafd1Q==
X-CSE-MsgGUID: SpVNOazNQl2JAkDZSc8PyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="50939592"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="50939592"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 09:25:41 -0800
X-CSE-ConnectionGUID: hY5jIIW7SOCGFztOsjf4KQ==
X-CSE-MsgGUID: EQqtYhseR1uZbhY8/cypBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118715977"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 09:25:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 09:25:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 14 Feb 2025 09:25:40 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 09:25:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EziiDs++gwM6xxwQnmf3YX+8mzyLTFBWmbKmizdQId43zVbqvfCuXo6trjqvuNK3jSsP3UYwJTQOPrspSMl5AWqmgqmtupFhUqcwMk4JhjVnN8yANkzwVujsTy/AiPdJF3G/oRC1LAaxRj/Xa0N7/C49tC7CWJdExkDlf1osTFeO3w961O9Sgd3Xdzx/j5Ej+jsZaQO6tPY2RObSzzEtDzk0bnA6DSOTWz601XnanzGuEmSMHpU/c7V/7oAT+n4zlwvrTGCYY/nJ2JgiNlsgWCv7dsCOv9bXFlA8kSUPiw+bn+lNGUuR6e1cTq9ElEeBYNQp8wTS5fs8FGOPdzTOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woXgTnvd9dRv1TUUzr254so6nxqyw2ezX25kjEG1pXU=;
 b=rEAioYrcDByF+psM0lTMNf0fiK7ywNRs26hfyfdWXqskJ7nGpiCdktJX9FJy356lZtecE8z7+WKcj+Gyv73lIFE4VJdGTbJGozeZyWgQ8xdoNnuhJtufk/JLxjqHdAXb3gExD46DIDaweZroLxkTQYdBKvpn9/KKx+PZSlh7K7anDFE53T+FcpEwRoMVOFxU8YNsr/w7ODqDrF7dtMQHjhtZ7P9sP+zUy9AexIimt0GoiOpmHR4HMIt6Aj8+gGKsbt5eVe557Oxcj7+uuM50U7pzmMp0ieYIWxflsJvm4U3xkznAU80FhRvM01gBiGMMvfsbfqdLdUrCARahdmM13Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by PH8PR11MB6903.namprd11.prod.outlook.com (2603:10b6:510:228::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 17:25:10 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8422.015; Fri, 14 Feb 2025
 17:25:09 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 2/2] drm/xe/guc_pc: Remove duplicated pc_start call
Date: Fri, 14 Feb 2025 12:25:02 -0500
Message-ID: <20250214172503.502320-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214172503.502320-1-rodrigo.vivi@intel.com>
References: <20250214172503.502320-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P223CA0004.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::9) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|PH8PR11MB6903:EE_
X-MS-Office365-Filtering-Correlation-Id: 350d04ea-e92c-4fc4-2125-08dd4d1c8833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?46nslfPyV21RGXk3R1RrgdaTTSx6c7o2AeT950F8YqnPm891W5habuEk9i9G?=
 =?us-ascii?Q?vvwg1YaSUze6OrIfXsZ+BpHX6RGo+vXsLTi36yJVFW3XJTUXYoR/XJZ6b0QM?=
 =?us-ascii?Q?enyh7llZ4TlMIv3VbbohgCl8PPi/3I3qSHSKJUQbTge+li5aWY9K047BvKE6?=
 =?us-ascii?Q?KwEK54874os7iYHCVCzCbaS3caWIRolZCVeZNn+L26uD245d5l+dZNRqC759?=
 =?us-ascii?Q?KumsrQNzMssiFGqhKAbxdxcyCPsziut7kWpBF0Cn6XDbse1rGenrFa/U2BS2?=
 =?us-ascii?Q?bVt609rSx7Fax78D6wrhYDcWM34wJvyBValv6Z6KoWNVFtky11MTVS1mHukT?=
 =?us-ascii?Q?WQ+AOTnI1Jl375DZ8USYei1FMB05rTke67a56X5wvT2f2OO3NB920gSfRo6u?=
 =?us-ascii?Q?fiSfNnE0FpvfwPtxD4ap5lQWxDffZSkRQz7NK4TnAjwd94E7qOYlR5Oy4hFc?=
 =?us-ascii?Q?rBN5UFG5gWFyskXppoQ9VfaexJKFnCcYAUus2d6qoBF4zWDdOsssDYtI9zvw?=
 =?us-ascii?Q?ITm01g4uq8/vr1iOGeO+MAaY9xeWMbvXH2J9ukvyKbB2WCo7spebnYTNemSZ?=
 =?us-ascii?Q?asgipu00GojZDWGA5DeCitoutdgqvEzesFxlUkMFvEvKxuCL9vw7gnXSyu9r?=
 =?us-ascii?Q?bmLAtj6mVLs0ftSPFH+uK/yTdOlLaIBEasBimIgOsbyF1ql7KaBnfe3zRruy?=
 =?us-ascii?Q?/1kpjg6E1wzu+YRE2/Qv+Vi8OAocdW/v9SiKYJS7awRpjigAndSqCP5GkYV5?=
 =?us-ascii?Q?+/7/P8zIZAphS19OVf53v3sz+/Opg9i+eNBEu2Ys57KGiycLXQZn4GccSz5V?=
 =?us-ascii?Q?mKAaSzKZpUVkAecMIM5Wvi2wpNvIITyPXv7yWv5EadBNFyGPK6jE7EE6ZMUW?=
 =?us-ascii?Q?wkzFE0alaQUvhN8Zu+FpYhebYMrQwo2yBti/bd4OHZDRXyDhzJgrBJOKOnYM?=
 =?us-ascii?Q?EH/ohjm/PmR9Aikk7r3qHfUYvv3/2zspIZkCcqJUm2MNykxY9ppVluGwi7II?=
 =?us-ascii?Q?rdyahINWgdd2InOJCH9j7ZqOt5THrpTp6vergjHjDaTTBKsm37O8pTSY4mkG?=
 =?us-ascii?Q?dMRgQtIFRweeRdbCtP/eS245xSfTvouBYXtyfnm/hgh1gLvVB6uEnoMEpCB1?=
 =?us-ascii?Q?0Pyi6qpiOLfOWQ+Ec3+fxn4YzIvrkkRqDybL/CsFOilvQ35+02XyI7bF3ED8?=
 =?us-ascii?Q?BcN3uXU2T/uEx/B1K8g5DjGCmGn9Y3vbP4mjLHgI0oRzn4SxQUMhtYgjA8sX?=
 =?us-ascii?Q?SLSEzz8J0ACd6kAG5aTlOgy6Egtu/hMPV2g5XKSv4gWOUuJQ42pDuPuFZHFP?=
 =?us-ascii?Q?OB0mVRxDZtfh/pTQpuPxJMCHGTYdaGRyzV7BFBsLoSgd+51aHCyC3/d4PBWi?=
 =?us-ascii?Q?4k6qlcMf4Aqbi1985xur9SGmQFYE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KDvjgQsuOMVcA0BQn0fGfD/VbVxnHFPHbCbE1gnTF7XrrD6IPQhYLr7beJpt?=
 =?us-ascii?Q?CtHi2u4rX75UgvUpA5BFczbbzix8pDH55IAAbVxXgDm8XW97ZCToNRAzu6JX?=
 =?us-ascii?Q?FiHZLQFD0u5rmINrrn+vr3HJHI4G1dNapkDlS29J3S7DAuuO/5UTlj+6RIel?=
 =?us-ascii?Q?cnmAcHQE1TgZFwV6BlX7HKOzddTyEsutHCxq6FoNw7z9HrXueYiPBwLx/Mku?=
 =?us-ascii?Q?vnet5Jtr8LRYthmwPcXfzydtaoDFt4QutqOqa8wWoztwOs1AaQrxHDceHRhY?=
 =?us-ascii?Q?SIYWXd5JOoSZ9bfcK5zU7MXj7JKuWBvQA/ZpNO0W/Q7F4qRfb0by7dnvA/uM?=
 =?us-ascii?Q?J64ZaurPr0uNl0tMbYKXANR8Di64LBVubQo4P8fYaongPuRKfZYXlQFuYVFa?=
 =?us-ascii?Q?s7dDVn2Ux9m5A6G4yhH8lwF30gxi+vhfNIP2ibVdWK1honVTD5Zi7/k+Jmpk?=
 =?us-ascii?Q?2AwWTEoG2YNruAe5CycULy5PAcVkiVBc1dZ+pvrceFKojIu1DmcEtJhLz0ic?=
 =?us-ascii?Q?P6Lr0Q+HhL8xSvoVGtc/U+CZRoOxJz/ViATLa23N+8uxdnwY2jLaOzKSjXif?=
 =?us-ascii?Q?8Taj4TMB+iglIT3YyFKJ8rgJP+qgvXj2o90usmmaL1jtWA66ZnFGAe+7fojr?=
 =?us-ascii?Q?OxXk+Q762BO/Ft4+ZfLFv7nhu7RbxESWSolCjQD5GwKFtNZ8XfmAhvkA+DLQ?=
 =?us-ascii?Q?TSRed1SlvaN6AM6qmIvfgbosvZxOkrqeHAVI+b6DOhsvsjhJPkxE3IALN43c?=
 =?us-ascii?Q?MiNJAXjGjqylExlbf/b7oQ5qiG1+a+pYbHsngMhzdSu3uoVUMRtm02/jbsJQ?=
 =?us-ascii?Q?5T9U+OFIfncpbWFueEzady+cbWERA6dQnWsHT31jB7vZf2KEMk75zeQ/WGGa?=
 =?us-ascii?Q?EAyRFtbqBHoeUpVtL2oGXeoD+UMTTnozJ50Q+yvf5KkLYZYAQ5FQxHaqwVQd?=
 =?us-ascii?Q?CfrzYZgt2q9AoSYH/tPK8qcFbhuYvb107DULuJC8WXD0cPxKHzdc2/dXdXzL?=
 =?us-ascii?Q?p1MSc3ATF5u6FQTMw+pTZNzBdADzl8Evj0F3ZGHienpV4hy1RdaRzEwLh4AN?=
 =?us-ascii?Q?aUvBrvwCJaWCvO07NWWNXhYNJ7mFoAMmSQx9mOlQ1r0xn78lIo/9xqA7nA++?=
 =?us-ascii?Q?yerGvxYdlg2JHC1yY2QROfr/KEE6XCwFYvaKphof8U4Mu0ru+2FVqiyQ/3UB?=
 =?us-ascii?Q?xU8Ci7A7GAKy1DSQWO8qfYexsQBF8jvZrMgA2wKpWlc9U3wsUw6AJ8Kq053o?=
 =?us-ascii?Q?hXJm6GqohrZZ6cNgrJumLyD/5ckQ8h9S4sS5HJ9M+OCnkVnfgY/FBkca8E1z?=
 =?us-ascii?Q?MB6VEvoaSkzwAbJHk/NyMwEctVAPpqFwf+ETo2wdnftwm23J/WByIEhyqVeJ?=
 =?us-ascii?Q?bGxrVj63CzLqIfp4sg5jbjGLrUI6pMrIbgjXjxv5h46/kAKcouGknTWVwgND?=
 =?us-ascii?Q?29VBkrJTTGyhZD4oNT228objMG2pvTN75cbR9R1eIWF0ddfkq86w6B6DcCSk?=
 =?us-ascii?Q?3K5iXvSwUR9qO/4DPleyF2Cd74fAdGvMqhB1DybEr9gv1G1eAzdnhtHmhBOz?=
 =?us-ascii?Q?Llkibufz6SqU4cWMz1mZsirfuvQ+RADaW1KAuVeNV1VoGabXgvu4DNCXa7VU?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 350d04ea-e92c-4fc4-2125-08dd4d1c8833
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 17:25:09.8627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h8YTr1Jy48FsjgF+uk14abJ1Pg7LFD+l0x7OYSiP9YqEpFm6AI2J8YvvcnGz96UFwlBpCHewrFMlHgX5qaYelg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6903
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

xe_guc_pc_start() was getting called from both
xe_uc_init_hw() and from xe_guc_start().

But both are called from do_gt_restart() and only
xe_uc_init_hw() is called at initialization.

So, let's remove the duplication in the regular gt_restart
path.

The only place where xe_guc_pc_start() won't get called now
is on the gt_reset failure path. However, if gt_reset has
failed, it is really unlikely that the PC start will work
or is desired.

Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 1619c0a52db9..eaa035b25aa8 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1491,14 +1491,6 @@ void xe_guc_stop(struct xe_guc *guc)
 
 int xe_guc_start(struct xe_guc *guc)
 {
-	if (!IS_SRIOV_VF(guc_to_xe(guc))) {
-		int err;
-
-		err = xe_guc_pc_start(&guc->pc);
-		xe_gt_WARN(guc_to_gt(guc), err, "Failed to start GuC PC: %pe\n",
-			   ERR_PTR(err));
-	}
-
 	return xe_guc_submit_start(guc);
 }
 
-- 
2.48.1

