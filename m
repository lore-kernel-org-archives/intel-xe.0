Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD37C4828E
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 12:09:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB95310E740;
	Fri,  2 Feb 2024 12:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AmVaAa3g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C32F10E5F6
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 12:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706875759; x=1738411759;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=qVKX24IaMZ9BgxX5SgRWr0si90N2mLT+OCou6KYsCVw=;
 b=AmVaAa3gRZ2/N5oI3w46/Xwxutil4XcMABeXPsHJWkUYdb9dHZp8FBdV
 52tCSXRYndFz7s+1ZNuVkkWGk8DuwJdWeVdbRPZ8ji/ZgWBDDlv0CUsmE
 JG21CiJp0w9ZatVfKhqpeVd/z2UQ9nQjYgbq13hrZM5rMbOxHPt+K81Lk
 x6ByRhwgi/Dm3pnjftzEu5v3T2zglHFwNKkJXSwz/Jm+Z8b7gCenapK3o
 Cz9aK8+7xH0JGRqMoTv9VUvrxA871IkD87wMV28bjVCfYx5K0OOVUN7Ru
 15AMUhsAvtG4IuAPejT29Vx9RRw1XVPhKg/urAU1asmE0Z3cleIK0kJXq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="10887554"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="10887554"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 04:09:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="31161426"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 04:09:19 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 04:09:18 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 04:09:18 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 04:09:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrDrW7UsbSjLR49azpDISvW933jgNCZva2fwOwcz1LF4HRJ7jPfFrix8eVLlYG+oRWaOkzMGAicTaqvQVLnXpL9ockkdcMUVPvJucKM8r10aLEs+9Ed2KaJPL+CHzbB9llwH6wBCEcsEFBYwf/xUDhcGIbzfgV/QteGDK0WKIYE/6p4Gk7FLcIZXNdJxvDhrLAlJx0HFi752lSq+9OvvtEEpXzzGf37OiL+vOLyEQgvXLDR+Kkc8glNI/NQRgNcIyorBXuZu/PjtCLJQStXErjouVi0ZooJgJ0bzy9jI2IAf93ssPdjbauhEvP8ZJBlQ57hYhmB/TzG2JEjIyJ1Y7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJqt7pu9ez3JYxSOLDAGlv461C+bSd7YlfU9qAbOlNU=;
 b=e5k7qQko0sCx1rlvbtDg8Sv+NxyWKvsVuJSBLRL6NhGCIZuUu/U+lzzIIICoz8mG7XC/odw2ZwHno4AosoUGMu65bf4cgprhaCUafRZiHSUQBHYOTalib08UDK/cLpPQxxTUIDf0IGGHJ21r9Az6/mXSKJLHPhHR3mPfQ6LnC9O9sGFF+668p67EWxpxET0uz+WzBxInLIgIlElopprUIrBNMtcyxpsD+Sqoc3gNS2Ib0kVfA4xv/OqW4n9/LVqVjM63MakhytPivkSzly39T6U82sY0HcCe8OwJd8AUZUZOyx0kG2KJ2sA5EF1DA78MV2YZKK+eMx2lLXklB8DwEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH3PR11MB8493.namprd11.prod.outlook.com (2603:10b6:610:1bc::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.26; Fri, 2 Feb 2024 12:08:46 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::a818:a5e:b1b1:511]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::a818:a5e:b1b1:511%4]) with mapi id 15.20.7249.027; Fri, 2 Feb 2024
 12:08:46 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [CI 2/4] drm/xe/huc: Realloc HuC FW in vram for post-hwconfig
Date: Fri, 2 Feb 2024 13:08:32 +0100
Message-ID: <20240202120834.1187656-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202120834.1187656-1-michal.winiarski@intel.com>
References: <20240202120834.1187656-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0051.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::10) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH3PR11MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f26ae5-5a65-4bde-f397-08dc23e7b51b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2UKXAoiBe4tyFVLeo+QrVC2V8+ZR1R4jqoUL/j38Lf+TbrlL7MkV2xMzvZk8xjZbkT8rN72QEnWT3pZMmVY2O87hgxWiPz4Sgha5Y/ERGm5yBwyCHLyQMB0Yw8oMcbfmQaIguQnl2nxx5ZLQiYUkEUtdvBNoMvO9jDG6lEdSnjkj517I27CcBAmRSdCXe+UVZ/Gbz9VTPLoDwumWfxgCiTrTmYklfYwOuaeh3Nik4QzwZ4mKR3V8RayLydvt6YtrZF4d5UazShyNRgksdd+nKVlHCWKzzaA0GpqgFwdWHjAxRYOMlTwCyC5DJOZEOVLsZjLZkY/wzTRsCdLLAtWjdDlmuJgVChCvXukIp8O9Cu5LyebITp+PnXKIcqrYx46w7oTEmXq+35apvtCxHpBrB1BKKllAkoOl4qJtZWQLe6oMuuTVfsBIrq+ZLE+TtWGdn+xh+kxIXYR7JmuFE+yE4o365bkImIrnj4TtnmEOf2+8rtk+oGKT2YJOFax8XRmK/DY31J0JbtWOVviS7Cgvs1ynDtTUlNvIfgeARL2Bo9isseqeXaCBfe65dPLv1+6f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(396003)(136003)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(66946007)(2906002)(5660300002)(66556008)(6666004)(316002)(66476007)(8936002)(8676002)(6916009)(82960400001)(41300700001)(478600001)(36756003)(38100700002)(86362001)(6486002)(6512007)(26005)(2616005)(83380400001)(1076003)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXg3emR6Z3RVbEhyK1d1L2lhdkQvU2k5aW9La3BUTkhHV1dYOXp1NFFTdFVH?=
 =?utf-8?B?OGxuL1MvVC9pYVR0SytJd0tGZHZ5UHZGMm1CZTdlY3ZFQjJpQUZsU25scVJl?=
 =?utf-8?B?M2dlVGthSDBMUGpNSFo4aCtPOXlGMWZ0bWN2eVpaZ2UyWnJyQWxBbnB6ZkxL?=
 =?utf-8?B?Z3ErK1Evem5ENzU4ZUtFY3NsWFdnRktrZlNoWndYWnNyYSthT0ovRGZCNWoy?=
 =?utf-8?B?QzdSdTNjR1ZIcjBIK2t1ZkVBMjJ0REdFZHg5Z1lXYzZ1UjN5bVhjanpaNkVj?=
 =?utf-8?B?bUl4N3pySlFDSDBBQjlHVnd4Rm5xU1RFMWVKMVpEZGRsMlhTbVZGL3JEZTUx?=
 =?utf-8?B?cTlGbjhlalFLc2dZYzQvQmovRittLzNDVkNMc1pqNzNUM21WMC93b3I3QzM4?=
 =?utf-8?B?enFwUHFoK0ttS0lHT0VaVlRDdERhSVFnOTdiWVhya0lIOTJwakxYcXRSZFF1?=
 =?utf-8?B?czQ3ZlByQzBHNU5FZkczMzFJVXFyMUFUam9jU0RlZUwxbWNEZ09RWWNPOFU1?=
 =?utf-8?B?ZkplR09hVHhxNXJRWDNoYTZyZUorOXh4ZzNqc21USy9FNDg4MEVsWGsweDJt?=
 =?utf-8?B?Z3JLN01BRHpyNGJ6cW9lQkRpVloxeko5aEFLV05qczUwOW1teFpOeStZMFpX?=
 =?utf-8?B?VXRtaXBiNEVlblNXcytuZ2pLZFhsN0xTRTV0YTZxRE0yaFEvbUtLVzRBUXZB?=
 =?utf-8?B?SllRTVR2L3JuUE5xVTlFS0V5VXppL3dmbkZiSWwwQWtOUy9aSHUvdUs1MEpU?=
 =?utf-8?B?Wmdkay9JcEU2WWpBcGp6MVAxeHIyUitiN1MxKzZtK0s3RVpNK09lUmp3aXZI?=
 =?utf-8?B?NzMvbnEzT0xOVjgwazY1TGY3NC9zakhZSDNMVmYwakcwUkp6ZURMMzZVZW5j?=
 =?utf-8?B?MnN4dUN6bExMY3JCcy9ON0VHKzlKSjdOeHdFM2pBTUk4RjY2OHRkNXlaUlV5?=
 =?utf-8?B?MUprRW44NzYxRFhnOXVMc0UreGo4aUFpWlBwMTV0MVNhMlhTZDdCaHZwZHB5?=
 =?utf-8?B?WkNCQUR1MlpTMTlSZVA5a3QrOFNHdGJCRzJLdW5tVE82Y1pEMHFMOHZtcXR3?=
 =?utf-8?B?K3pIY2VPaTNOTXE5TndOOUFNK2Rta3FrRFpHOGo4NjhuMEdFK0Qwc2FPNVZj?=
 =?utf-8?B?RVgvNm95ZHpkdkRJcWdoUkpWN054TGNxVS9Lb200SWdDRUxaWUVqc25ZQ2ZE?=
 =?utf-8?B?TWJVT1UwM0JSeE0zN0grUWtHREpwM05kMVV4Wm9STFVIOEpLaFRJb3c2RDJp?=
 =?utf-8?B?VjZkZ2d1UjFPUDVvRjlmajFUS0dML1REczRyYjd0MUdxbGJkQnpSUG1NSXdi?=
 =?utf-8?B?ZUNKOHZ6RU5kZ3ZYZElEcFNvVkhMV2hVcGpKc1YzYXNGdC9nS3B2ZHhvd3BN?=
 =?utf-8?B?ZWMrNDBvRzYyWHdVb05RSTJuNWIzVUliZGFtd09KdThjbHRiRzdJelFWZ0ly?=
 =?utf-8?B?VnJzVTRqeElmejVnNGRoL3NhYTQ3RlhMU1RGVHVVV0pnc3I4bnNnUkV5enBV?=
 =?utf-8?B?OS9CK05McjBqc2s5Y1c2eGdacFQ4aWlYenZPZjA2dzJKWkJjSEducGMwdjdX?=
 =?utf-8?B?WTAvMEVGek1DcGhtdnU0b0E4N2NtRVh4Q1Q4NkRlL1NLTVRmcDNkZzNJYVZu?=
 =?utf-8?B?ZnhRSHRjdGw5dTdPdWkxL3Foaktldk42aStkdTA4WHRWZW5lRzdzdlBhOVN6?=
 =?utf-8?B?R2NXeDI3RmplLzYrZEpraGpkZ3pvUldWZERLblgvMGcrNkZ6K1dybHpGWjFH?=
 =?utf-8?B?RTBudjRMOHdJbkdNTWJUUXhSNDlDc25UdnFMWHM2dnhFcnlzVzJPTHBRWWov?=
 =?utf-8?B?WEVuZzI5SlpRbkRaN2NFWVBXa2JqeXdEUFhIcTk2RVVHQzk1Ynpxb0tjTUJV?=
 =?utf-8?B?bnFibXJ1MFdaZ1RsVFZPeGxNNkk1N1doYWhpbEhTNkdXMTExSXhnU1FYSTI0?=
 =?utf-8?B?SHV0dUwyNHorZkxveXJ4SkdjMWFrK3M2RTREbHhld2hoU3cvK1E4MHJpYTVI?=
 =?utf-8?B?Tm1RV1pkRUNOa3JaUk9NVmJJYWNRUU5xSzdiQ1pkUnZaYnI1MG1QTDhxUnY4?=
 =?utf-8?B?Zmg5TlVJOTlLYzl4UG1UbmlHUG16clE2ejg3U1phZmNZYVlVVHBoSmt2YlVq?=
 =?utf-8?B?UmRzRExiYnV6ZzlQYVVpSlc2cDV2MUhsV3R6c045cytuMlNLSUFmV3lpU3VO?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f26ae5-5a65-4bde-f397-08dc23e7b51b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 12:08:46.3870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dSHmdELE+8EjCEJuFYQeddXD2B7ozQGDcZRb1OcoGoiimDaSq9do1o8FQGPhnrl6bVCPHoObbvjyPmwSkcsGj8SpGcXcQaPAewk3WrWvAIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8493
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

Similar to GuC, we're using system memory for the initial stage, and
move the image to vram when it's available for subsequent loads (e.g.
after reset).

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_huc.c | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_huc.h |  1 +
 drivers/gpu/drm/xe/xe_uc.c  |  4 ++++
 3 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index eca109791c6ae..b545f850087cd 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -112,6 +112,25 @@ int xe_huc_init(struct xe_huc *huc)
 	return ret;
 }
 
+int xe_huc_init_post_hwconfig(struct xe_huc *huc)
+{
+	struct xe_tile *tile = gt_to_tile(huc_to_gt(huc));
+	struct xe_device *xe = huc_to_xe(huc);
+	int ret;
+
+	if (!IS_DGFX(huc_to_xe(huc)))
+		return 0;
+
+	if (!xe_uc_fw_is_loadable(&huc->fw))
+		return 0;
+
+	ret = xe_managed_bo_reinit_in_vram(xe, tile, &huc->fw.bo);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 int xe_huc_upload(struct xe_huc *huc)
 {
 	if (!xe_uc_fw_is_loadable(&huc->fw))
diff --git a/drivers/gpu/drm/xe/xe_huc.h b/drivers/gpu/drm/xe/xe_huc.h
index 532017230287f..3ab56cc14b00a 100644
--- a/drivers/gpu/drm/xe/xe_huc.h
+++ b/drivers/gpu/drm/xe/xe_huc.h
@@ -17,6 +17,7 @@ enum xe_huc_auth_types {
 };
 
 int xe_huc_init(struct xe_huc *huc);
+int xe_huc_init_post_hwconfig(struct xe_huc *huc);
 int xe_huc_upload(struct xe_huc *huc);
 int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type);
 bool xe_huc_is_authenticated(struct xe_huc *huc, enum xe_huc_auth_types type);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 8f37a809525fb..d62137306d280 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -94,6 +94,10 @@ int xe_uc_init_post_hwconfig(struct xe_uc *uc)
 	if (err)
 		return err;
 
+	err = xe_huc_init_post_hwconfig(&uc->huc);
+	if (err)
+		return err;
+
 	return xe_gsc_init_post_hwconfig(&uc->gsc);
 }
 
-- 
2.43.0

