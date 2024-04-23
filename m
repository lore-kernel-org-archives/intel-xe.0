Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E99DC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 22:18:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEF910EC75;
	Tue, 23 Apr 2024 22:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bRLZ9lUy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B45310EC75
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 22:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713910710; x=1745446710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=njFgeAerBrqaR+Ih1GGY7xaRkwT0Y0UnAE9XYP6nQ1k=;
 b=bRLZ9lUycaEyP/kP+jv/5dYFW7sU1/jT7jqLXgJTG+lc6DROoL7aT8DG
 War8QypE38qRbgfcBmfsn59XWggMWGraZhmndagKTH/AtJkBN9FMZn0AJ
 yk1ZNdYfTZKDg9lblzReve8/kQRZEjgekaezou8RzamyXWbihknuTmz6G
 qGWRdUYU6OCUDwMob3h/Lb14tuaDwAk/hjBv4gZHpczeEstaLn7CIRT/f
 nqP606VaiA4y8iJ5KHZVeV3R3tlDT7kg65GTibI3GISRAXNCNZL2eIT9J
 jvLzcPi+cBebBJfIRCOMa/UrcEaZFPOvUPh4W1nQTgK98wPI29jABQJp7 w==;
X-CSE-ConnectionGUID: GOlHWwf0SZG/3mdZ9NwBXA==
X-CSE-MsgGUID: B6f8+livTUyliv2pRyLt6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9392585"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9392585"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 15:18:30 -0700
X-CSE-ConnectionGUID: g7sCezj9Q4SYb3ak8XfY7A==
X-CSE-MsgGUID: Vb+WdrvQRuyiEJqbUITt1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24551117"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 15:18:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 15:18:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 15:18:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 15:18:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 15:18:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdKChbtXI2s+xehZMOs9IPnt/gxtqUNqSBAok+xlpfacwbAuFQJQ1fEKw8+Ncxf0i+1W8E/szPQMJ1OzZzl3Zzb3ZymoddVDHEpl5WSXk2Cdv0WKY2xcQfFhW/UPc1O29bWvoQnIsOQrueDo/o+5WvnjA2xYiyUZZgxaknSNZqCSKtNhdsbt4+lj6+ZSZfoz0d66PgXsxpqr+8WWCSE6c44oNAHJphj/vfjS5/jdLWRGOgW+DuL9YmYe0kY7EYXsImehLvddLL7e8kQmDA/49+6IRPN+sFWsARJ8V6G5ncpB+T7na8zldbhJAOZS2jvIMAROQ7CnAO0z1GgPPSD3bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BCcxUY9NBzobe2T2S6sEcMvIv2+D4h+pmSeK04Fz/5s=;
 b=A8MHGMkTwKrn6FslblIfErRbN2xeJH+iheIcCl2/8cKCyrydBuvv9pDtNrmY7/u5hIZF/q4CkMf4mXWbQ18Abs5ACPJtXIf+vxcl+DqDpmR6MLGthqh8nEoE+jgD9pWGo6WHOSB5/o2+DcgM7taojhC4c7eEAog8eymc5DQXCEb/GboU/+/81kacUGKo1qqOBlx/Wc9XY/MdGN51qdJ/GlXDiUVXjFBFDrYVivXZdIQYJRJSYdiQxuNCDhbwNPXQ3Yzgd+svAQvFVBFOFGJN+bIr+CQn6JaeXekGQ27wwcL83V0DrYSsGleVyD8PdRlG7e8ySRpQi4DW8JH1/h+A2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5080.namprd11.prod.outlook.com (2603:10b6:510:3f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Tue, 23 Apr
 2024 22:18:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.018; Tue, 23 Apr 2024
 22:18:24 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 2/4] drm/xe: declare wedged upon GuC load failure
Date: Tue, 23 Apr 2024 18:18:15 -0400
Message-ID: <20240423221817.1285081-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240423221817.1285081-1-rodrigo.vivi@intel.com>
References: <20240423221817.1285081-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0045.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5080:EE_
X-MS-Office365-Filtering-Correlation-Id: 249ca52d-e3b5-45b1-6a46-08dc63e34ac8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2dZIizSs7GUpdKEtIpJ8YYpR1R6sK1aTd7YwRJIajfzkcsu4yz0pzD2pPuvz?=
 =?us-ascii?Q?P+UHN2o6+iiizDn1wr/hkXDAZd082McaCBQEdM4ItrgxMuw57O+wI7gg+py4?=
 =?us-ascii?Q?q33/n3W15f1MDG4rqQGzDJes9VByoj0skK6Biz+iuqmHspzniCgJ1T+kGWXQ?=
 =?us-ascii?Q?JQGYv16nDcbjecl3Oo4IUI/YtSd9uZGHgsBJbdFNxkAmzQGNyGIfTDwZvVZM?=
 =?us-ascii?Q?MLyTWreBHGxpp1eOxVq/OZ3wgyAMHMfJVkoGb35ubS9fWvzWCSp1Yh02/6R3?=
 =?us-ascii?Q?KKJw1VosM4l938cKL6iF/byOAckpd7Q1XZ25hM6MrAu23z5grD7v2hPTXUpb?=
 =?us-ascii?Q?0Lmbeay2eV7qEXoR1bKQ0/ecsmB5py0CqEXwKU1nyQN+jkRXmrW2kg+Qlczv?=
 =?us-ascii?Q?aW6kju0mJYtSA1ADMEIs7du644+aKnzYiYxwI4o8GNpSMmvDphfJfshjQ8ey?=
 =?us-ascii?Q?fB9Hi1GqQAptRBjo1RiNyPNup40hz7az9V3EPT8qNFegQnzKZEhtJUSakMlo?=
 =?us-ascii?Q?nWJdeaJ0s578QsoQaJ935T+jrBYjz6q6REqQtKADervDkkC/PeJvQJ/ydnS4?=
 =?us-ascii?Q?FtpUatZGBatw7majpxaA2e9tSBDVl1d5pfcOc+DYuTt6UnG6NBvB2Y67x8mS?=
 =?us-ascii?Q?J+P+jLdWBvOEBbZJ4a3dmmXVickWFSMJb8k1BjuWzhPi2Ua4B0gvS9j4AlLR?=
 =?us-ascii?Q?9JimloRcLGvaMWZcp306DKmpnJWD/DKC1jP5G/szFEFIFBPfPUoTYvGcDWu2?=
 =?us-ascii?Q?bttAsaJCcV07IaxWBy8RHGdad47pxQ7PS6Dl7cBj6RxA2V7xQsO+ZhOLxha9?=
 =?us-ascii?Q?u8/XtJW12f+aRg83INSgoc/kQdtiBCREcSf7fJ0ewSCcZyzKbU73XCoUpBki?=
 =?us-ascii?Q?iAR00HCjqbs/6BWJM8szKrTeaXM/N3bXzwjS9QqXjHgcDG0b2Ov7kxf90qOm?=
 =?us-ascii?Q?erpc5MylhqgT/XeRrxKNZSHAalgYDX5dCD2CNqkRXY30J7ktVf4A7KaJFqbr?=
 =?us-ascii?Q?4/OCd0dbO9Lcx7hZFrGLUApjNIIu67zO5lV53qs7zQ26l65E5BSXtjfZ996l?=
 =?us-ascii?Q?XWPBUTSqhG9RvnKAAGM//q7lvieUTeFQAMrwAt/B/4qlGy/cUHCesXWKErLa?=
 =?us-ascii?Q?TAvLEAuq1HgQQ3A+MOnfAD8mfO0ct64Ig7328N/S+16mTnyYtxoqTZzDXIpU?=
 =?us-ascii?Q?N55zswZBum8nJn5UC99eci8/9ekjTSFcuJDQpTO0sjh+It73YCHG97Hc90dv?=
 =?us-ascii?Q?wJYMQkMOIBk717HDWqW0PleM0nortQ0HrTDzgJX6Kg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/YU/3vW3jwVtCvKw0GMSkk+FRRiZWcn9yvnfUdrMITkmviaDhV4ysWxdR9AH?=
 =?us-ascii?Q?SL2lQNaiNjBI/oO1wrFonfh6tnH6q8MPqdHKJZN5VpfhmSmT8F/eFVYB8dqg?=
 =?us-ascii?Q?uGYiS3iZeWrmtifdaZZfgTyB5kVO3QJwdWVDIen8gG2JYlMTmKJLp5RJCsaB?=
 =?us-ascii?Q?wHBmIuIHHPa/M4R2L7l5WEDnUrzG8+eqlECKuyusqZA2m7E0KJbCgfjUzF/s?=
 =?us-ascii?Q?xmJJz1Y0UUeFDjXUbqGa0oY5IA3pki68ElS8J+CuDAsVhe1ld19604nYB+gT?=
 =?us-ascii?Q?sWzQDHs5gbqmkKFgTmKwtpJmfTs5i1ReT0EWxXD6Ju5M0o6x781H7o05FX23?=
 =?us-ascii?Q?Iwf+3+WXz4HszRHU6ml98h+ZzwYNXsC3klC5zkVpoyNOekiQW6nm7uLggCBt?=
 =?us-ascii?Q?qlx3B7a6pv0/vPiMaCl7VsuLYDU6xoZrzJ3DBd6TTEFRNn8i/JHnY3orDWG2?=
 =?us-ascii?Q?V22SjHrRc1p6TS+WaLe7EpP2z1/zs9r4k4v2B+0BIZIbjLDTYzrAxXnmDB4q?=
 =?us-ascii?Q?NJR+JmydlkSLPBC/gflpter+8bAFRdeyizxOD/coiTyC66xwsPackldZjbdb?=
 =?us-ascii?Q?FoE3setDxKydjkrtmAMX/Gslf1GwftaelnF4hUdVP510TzukywPEHbeAqOyp?=
 =?us-ascii?Q?iKinMNzV0O7UEMU6dNfOHeQ87C4+h8k+GF1+6/zqsOfjJDm+wlubXPkhh4Z3?=
 =?us-ascii?Q?UXoAMxdOOidNSYYG3Mc1+UE2J5zXFYvl2M0zUX5BxxRR2rn4DLg1VtORfo1N?=
 =?us-ascii?Q?tdJ9o8lECATbjthNofYdttC37v5F3ABhkVRf0b8NXpnWs3chA5DcibosLlE1?=
 =?us-ascii?Q?pkZP/Xt0meteBjtd1cozK+lOFxoc1LjvvDgMNC+ceUuqcZMVZ/x25gPDh1da?=
 =?us-ascii?Q?bVzGNvY57QCOccqCf/TvEREBJoemzW/PTI98t9uXOOGrH8BWMoIGiknpRTyG?=
 =?us-ascii?Q?TeI5VyfkkYi2zU5iT7wduF6mmTH6MxAXy/zSWfYsWHThGa60Y+rfoZg9d1ws?=
 =?us-ascii?Q?cyB5iOrcPdU0Xe7DQP5ipcbQ1Kx8U6L5FJjooxiyIo4e89Wug+TSW6E5+eEK?=
 =?us-ascii?Q?mc0mdYoWloK8Id0Ba2MwgITO0gLZXPahBaASej5Jj49gpMb9gILt0dzkqE1a?=
 =?us-ascii?Q?v6YvBzTxK6fg2xIjtmSS8CBqtmxYEdEYRB3OrkCx/JImzSCaXPfB9xy3FuwE?=
 =?us-ascii?Q?K2MTeBOcgunPK5hxkdrQSCI4XROxlq9/WRCAypLr8WI9GRHhH3OntA/rRCkK?=
 =?us-ascii?Q?XhbnPIuzSm16MEydHlWJ6cH/5UYxSjwawlNMgy5HHLCFjB2oBrWHB97/Kr7s?=
 =?us-ascii?Q?HaedyRmCAA7Y6XKZsSESZkKZTNNrxfE7acnEAddZmzIDSzBKNdLCWNBrW0GA?=
 =?us-ascii?Q?qKSojxRMOGGvN47i1MMYe+VHcDeRRpaaIsWpv8dSEDR13weVQQDVd6F6TGHu?=
 =?us-ascii?Q?ttCfbhu99eoY90Z1Ujc6CndVUpq0tYMC36r5UAhgQcIBR0/N9aGqsW/UxL/L?=
 =?us-ascii?Q?V928PAA6G9c0fGoEfrirgGIFW0DsdnJ9jtBsmhTQQWtOwn+EgLT/kBHZyfFo?=
 =?us-ascii?Q?3CXl4Fo3lHGGZIN58vSibNO0kdWwM2Rnp0mQl6zMaGVcOZqQ1r3IsQRxkkiu?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 249ca52d-e3b5-45b1-6a46-08dc63e34ac8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 22:18:24.5801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MMbakOTvpCVbawY1QjtUsXv8txggORaHu76KkZlldUdfHLMAcGhsXSVBNwXbytEofmI4vU9HGj76Y7Y4gCNLBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5080
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

Let's block the device upon any GuC load failure.
But let's continue with the probe so guc logs can be read
from the debugfs.

v2: - s/wedged/busted
    - do not block probe or we lose guc_logs in debugfs (Matt)

v3: - s/busted/wedged

v4: Do not change __xe_guc_upload return. (Himal)

Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 40 ++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 240e7a4bbff1..17438d5b18a4 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -451,7 +451,7 @@ static int guc_xfer_rsa(struct xe_guc *guc)
 	return 0;
 }
 
-static int guc_wait_ucode(struct xe_guc *guc)
+static void guc_wait_ucode(struct xe_guc *guc)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
 	u32 status;
@@ -479,30 +479,26 @@ static int guc_wait_ucode(struct xe_guc *guc)
 			     200000, &status, false);
 
 	if (ret) {
-		xe_gt_info(gt, "GuC load failed: status = 0x%08X\n", status);
-		xe_gt_info(gt, "GuC status: Reset = %u, BootROM = %#X, UKernel = %#X, MIA = %#X, Auth = %#X\n",
-			   REG_FIELD_GET(GS_MIA_IN_RESET, status),
-			   REG_FIELD_GET(GS_BOOTROM_MASK, status),
-			   REG_FIELD_GET(GS_UKERNEL_MASK, status),
-			   REG_FIELD_GET(GS_MIA_MASK, status),
-			   REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
-
-		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
-			xe_gt_info(gt, "GuC firmware signature verification failed\n");
-			ret = -ENOEXEC;
-		}
+		xe_gt_err(gt, "GuC load failed: status = 0x%08X\n", status);
+		xe_gt_err(gt, "GuC status: Reset = %u, BootROM = %#X, UKernel = %#X, MIA = %#X, Auth = %#X\n",
+			  REG_FIELD_GET(GS_MIA_IN_RESET, status),
+			  REG_FIELD_GET(GS_BOOTROM_MASK, status),
+			  REG_FIELD_GET(GS_UKERNEL_MASK, status),
+			  REG_FIELD_GET(GS_MIA_MASK, status),
+			  REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
+
+		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED)
+			xe_gt_err(gt, "GuC firmware signature verification failed\n");
 
 		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) ==
-		    XE_GUC_LOAD_STATUS_EXCEPTION) {
-			xe_gt_info(gt, "GuC firmware exception. EIP: %#x\n",
-				   xe_mmio_read32(gt, SOFT_SCRATCH(13)));
-			ret = -ENXIO;
-		}
+		    XE_GUC_LOAD_STATUS_EXCEPTION)
+			xe_gt_err(gt, "GuC firmware exception. EIP: %#x\n",
+				  xe_mmio_read32(gt, SOFT_SCRATCH(13)));
+
+		xe_device_declare_wedged(gt_to_xe(gt));
 	} else {
 		xe_gt_dbg(gt, "GuC successfully loaded\n");
 	}
-
-	return ret;
 }
 
 static int __xe_guc_upload(struct xe_guc *guc)
@@ -532,9 +528,7 @@ static int __xe_guc_upload(struct xe_guc *guc)
 		goto out;
 
 	/* Wait for authentication */
-	ret = guc_wait_ucode(guc);
-	if (ret)
-		goto out;
+	guc_wait_ucode(guc);
 
 	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_RUNNING);
 	return 0;
-- 
2.44.0

