Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E10CD5BCE
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B526E10E3CB;
	Tue, 19 Sep 2023 14:26:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0F910E3D0
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 14:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133585; x=1726669585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aSSxBiRzUitkGE8tsDNxlCTK4Ifs7a1liYx28+QN8dA=;
 b=jHGVoiluMbe+L1q66Ru9TJg/TSRbPSNwZfhtf0/CXvZiaEhmqRrf+PCB
 QtmuU8UR+pcQODRNrZWWdC1/IeiuXu4Ij9dvyM+YiyQj+5kifxMycmGeE
 nl3dwnA9kvTXZaZo3nGavBe+Uf8ofQKaKRfSxD+pXg4t+Cy23nbuWYt27
 b/QbItMi1E+1R56nI8QvauZStB0KJXGjkbKHhyZ0htDjxd6EymWRZGUtv
 TRISpsBtnd/2haCeId2dvFmVc9USv5DDSixWLh785qnEllQr3o6bPOyft
 Fv3hBw7QL21wK8/MPn638xKP48Kv7b+MBoE/PPqJPBoIrdGyZrzjzminN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="383786052"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="383786052"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:26:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="781319643"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="781319643"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:26:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:26:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDkV/U4Rl68Cd0oQ67vwsMk+iwguEKZqhOOTuHgM2j6udC0efa8OSmzx4wveFmtQihNsVKcHTFNnDdvvVP2ctdUbFLUaWk/RCP1lPfoHoOO4sIV4+BrcLLltvHdlfsQCs4ByyY9RM+M8kL8gyyXoHiIX3PG1QGG+wyjbVH5TK8h2IYa9A7kwmG+zac9jQelf1/FR9Y056+QDtWpbjjmUZo8kAe0YnfU9wiYiaME3nKd/YW7/B6JxdQMk8hc7JRtHeE3sCTGhiMOCPbNMfrQTK8DL4SSFYvas0bNv7z0KKWro0hyGFRqULVGxM6wIwzSYQJnv886WT8WUmqdKq0V3Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHGe5gA4ao1xvAye97g6M1Qd1qxS3CG+Zud9g6dGBfE=;
 b=YhgcrO2n5+78zGtbO75oKVhOK1jcyAqNdbyYYengybNqFLh2MgY+6z6RwMX7RTJLn6e96pbwj3z6WIoQ/2arm57hmeehl3YGhuq6B41nBUoob8O442gEamF+lqieoot25ryqIlSnrO6fxhSiA8JoFPuyL0tfS0EbQo2kKIcuqqFf43os2mX6IbEwAWRV34dwt0UDBAeeAmw7DZSilEhTUTF+pPNJh2Hhx8OSDnob6qm9hekZL9okce0QHKXuU0nNMFOFYoVdp9Wyr3AefbroC76e6iboqAMG3BTfmd8Q7Z0sVhzfXlVVzs8mctMcE0BrOOMX0FxaR2XkWsny5oHeLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO6PR11MB5585.namprd11.prod.outlook.com (2603:10b6:5:356::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 19 Sep
 2023 14:26:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:26:02 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:24:53 -0400
Message-ID: <20230919142504.91652-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142504.91652-1-rodrigo.vivi@intel.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR20CA0019.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO6PR11MB5585:EE_
X-MS-Office365-Filtering-Correlation-Id: 30cf33da-7c1c-4195-8973-08dbb91c5996
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1qMJAayr1oHoq+7ULJTNpwZ1AVNfR8/ZUKL98NRaLGlJnNKw5W2za/6sHh/NjlhKauJNPoVSLjvHSnq6gsQkl7U+fRbCzJdtaqCQK/QY/FUu3C0AadK1zbAZt0spcDjj+Q8v/mUTs6YKLQJCLKka+iH6F1NhJQ/QgDxOgzhn2EWqLZSEwbH5n21IJ6ZTqOyH3VSZv3/J2AN21ztCLediorFCFhNofukoMfmIEc/RbMylI5rQmn1C/FwD60NOJ2tnKnwIE/jR8Vy+swsphBvNck0l5FU5uo+PhCtf+5xs56DIwjJ1226K4tDf9qkNO1gfqn2OQZY6K9xqaGrxLrPtIfPxKcCALUQ82i9fj/3WN5haDR1yyun5qRR1u1BgVp8K9Mkj0xVomWy30cgPn3gh8bl9BZ36I2hU2FRKzsfYXD3ngnalsatlMxdP46Nq1H+B31wNeOiHtFdW8R5wV4d/Mzon9E7YWTHtgSCKHHJmTsEwZp50aOBzReH1Yy2LWverQjdohEc5pTTInxQwjCzhwqks+uc106OlVPNi4DdyT8nwnmxCwO1oj7YSxkpOe0jKPCiUi0niE1j3auy73ICa3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199024)(1800799009)(186009)(36756003)(44832011)(5660300002)(83380400001)(86362001)(4326008)(8936002)(8676002)(41300700001)(6506007)(6486002)(6666004)(82960400001)(107886003)(26005)(1076003)(2616005)(6512007)(66946007)(478600001)(2906002)(966005)(38100700002)(6916009)(316002)(66476007)(66556008)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnRyWUlnWHM0b0RsRHZqS3NyZGlUckJqd3lTdVJnZ1k3ODhuN0VLOUlmYlFz?=
 =?utf-8?B?d0NLZFBjYmhqa3BUR04rL3J0amNwLzBEQkMyUzlsNkZ2WmVqS2FObTN3VGQ1?=
 =?utf-8?B?N013SmJIQkhtWWVCeGZvcDc2Zm1GU1BkODB5ZDhxRmc4b00vY3o0L2dUQkRx?=
 =?utf-8?B?U3NCaUdrRUVnNGVEUGFTQlJoenlnVzRwRnhXS0pmeldhVVB4emxmWmF2K0xT?=
 =?utf-8?B?ZklkQi9xZGhQQlRucGRRUEIzQWg4d1NxQ29URmp2TmkwK3dacTRqd3c2bEQ3?=
 =?utf-8?B?ZUdSdXA3KzRic2hYUkEwUXQwK3ZRbkhjbExzVFlzZGVSVVJpSms5Q3BRR1RG?=
 =?utf-8?B?bUZ3dkgwS3FPbWlqYzFVNzl3TngyaEFIclFqcG9JQ2lWUkpvMHh6YmRBUSt3?=
 =?utf-8?B?Z3A2T0FBdy85dnE2MTA3a1EvcS9uVHNyMG5wUFBqQlUvQ0ZLOVl3bUxkMnBK?=
 =?utf-8?B?SnQ3dURNZGFXelNqeFcybEJCWnZMVGM4U3NwT050Q0M1ZmVKMFBkRkFtMkUr?=
 =?utf-8?B?S1JHV1pOUmNoNnF3ZnB1eG5IbjkxN3ZDUGlGaXRRRjQ5Q01Hc21senY5dE0x?=
 =?utf-8?B?SU4vcFVad1lwRmxXaHhpbkNHOUM3eFdwMXVGb0U3UGN2VjdmbHdoMTc2QXJR?=
 =?utf-8?B?QmtQa1I3QVZGRDBjcktVdDFKWHB3bnNaZTFucUsreWovUWdWbzVSRTkrcm1M?=
 =?utf-8?B?OUNVRENCellia1JmZndpTDhQTkdSNm96M1ZqcnRSbGlBL1Ntdy95ako4TEpK?=
 =?utf-8?B?aEtCLzlLVjRBL1NsSVpqM1phVU9zTVd2VTEyWDVtaWUvc0hvaE9KN0ttWC95?=
 =?utf-8?B?bzZmOU5VcVRjK2NsVndGNE5KZGZRMXRiOGxCVVVKWHcwcGtVMkVNV3Q1ZFpx?=
 =?utf-8?B?SFR6czZYRjRwREhCWkYzV1ljRmh2cWRiaGF6VFUrMXQwYktWZCt2OXNGcDNT?=
 =?utf-8?B?KzQzSHRIZlpvMFJneXE3K3NPWmRIMjBkNTJCVzFIVHBMSEZaaVA5bmpGWUlL?=
 =?utf-8?B?WTZ6YnNHQm5rZnI3MHpQN0c5RUpJRlFQMUw1eHlNT1BzTE1SaFdGcHZQWVRn?=
 =?utf-8?B?MkJWQWpUTm5HNmEzV0tucjhCUFhXTE92Uk15c1VwUmlvZFBhNDZEazgxQmtI?=
 =?utf-8?B?RWd4ZzdnTTIrWmdsTVN5Z0h6TFN1cmVrMzB2M0gwZkdtM3k4ZDVxakxIT1N1?=
 =?utf-8?B?dzUyckNvVTZNcnhidFl0bWkzb2lSNDNDMzd2UXlnVjhCT0FaTlAwQTgwdGwy?=
 =?utf-8?B?OUxmdUFhZmhnaGQ2aWdJUTNUWlFPUktncloyUUNVampYNE4yVmhoNmxHOVlz?=
 =?utf-8?B?aEFuMDM2OEZ2bkJxQ0VxV2JhcE83aFdhaVRKQytKbGQ5N0RDcmtWTFZ2WWpE?=
 =?utf-8?B?M0sxWlhDRHMvUEg1R2VRMldHOFZZMUhUb2F3VnlCL25XMmJkVHVkVEtSeHRJ?=
 =?utf-8?B?MndPOVBXQ2pUK2d6Q0Y5dTczdk83TU9FR0hIejZHcmRCQlM4Y0lDS3JEdzhz?=
 =?utf-8?B?cmozbWpVUDNiTzBKbDBiZGJLckROR25vSncwWjlBWHlxZTVIUUZEZTFEMVlF?=
 =?utf-8?B?VTYyMUZYUnRJcS9vVzc3bDhYaGd5bU5RNlA3NE5XencwU25RVnNFMDIzaXJP?=
 =?utf-8?B?YUN6T3M1OFY2NXdSandFUmhUSitPOUpMZlVZWnRCOUhUaStKcWJCam0rY2w4?=
 =?utf-8?B?S1VMazhFaXgwOGpXRmRvRVY0WTBQM0xYemlkelBETzhid2tmU3Q3UGNPRGJP?=
 =?utf-8?B?WG5sY25vN21DSUtJYVl1eWo5TjV6bzUyWHpXQ05KNjZqZzZnN3hNc0lKV2lp?=
 =?utf-8?B?OEpOVSs3QTRjL3lmRVVGTHlIM0VSME9KVjFycGliUmF5Z1ZFZjRZdlQwcGxB?=
 =?utf-8?B?bDBzWXdSK3RYV1NoN05GZEhzYmxVNGdHODV2ZHhyUUxwejlKZXFFSEIxWXE1?=
 =?utf-8?B?eFRVTHJWQnNzL3EzVklBOFlrZGF3MjdvbHZFK0paTlF3Z3pORXpucGM1dUsr?=
 =?utf-8?B?VXQrSW0raG9GZkVrRGVITWtaM1hkVCtQL0QrUmF0YkMwRWpnZ2FxTmVYNXRy?=
 =?utf-8?B?ckl2WmNiRURtWTNWVi9sMEVZbVEwU25pbk9jNVhsK3duRHRORFBNK3J5Z2tt?=
 =?utf-8?B?ME0rOUFzZlhpSkV0Yk5IdkdaQ0hDUkZ6QjNqMFhxNFlncVhjaEFDbEZtS2Fr?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30cf33da-7c1c-4195-8973-08dbb91c5996
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:26:01.9364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UcxD+mY0fWkD4kgr6erWB6fDdj+SQ1jcrU1S3BM/6weT0MkFR75U/G5t4fNbErcSz43CrXKxJwbYdJ67IhJDQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5585
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 06/17] drm/xe/uapi: Remove MMIO ioctl
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
Cc: kamil.kopryk@intel.com, filip.hazubski@intel.com,
 Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, jakub.chaberek@intel.com,
 effie.yu@intel.com, bartosz.dunajski@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, carl.zhang@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Francois Dugast <francois.dugast@intel.com>

This was previously used in UMD for timestamp correlation, which can now
be done with DRM_XE_QUERY_CS_CYCLES.

Link: https://lore.kernel.org/all/20230706042044.GR6953@mdroper-desk1.amr.corp.intel.com/
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/636
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |   1 -
 drivers/gpu/drm/xe/xe_mmio.c   | 102 ---------------------------------
 include/uapi/drm/xe_drm.h      |  31 ++--------
 3 files changed, 4 insertions(+), 130 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b6bcb6c3482e..74688647f332 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -107,7 +107,6 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_DESTROY, xe_exec_queue_destroy_ioctl,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_EXEC, xe_exec_ioctl, DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(XE_MMIO, xe_mmio_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_SET_PROPERTY, xe_exec_queue_set_property_ioctl,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 3ccc0af4430b..e636e3f3456d 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -422,108 +422,6 @@ int xe_mmio_init(struct xe_device *xe)
 	return 0;
 }
 
-#define VALID_MMIO_FLAGS (\
-	DRM_XE_MMIO_BITS_MASK |\
-	DRM_XE_MMIO_READ |\
-	DRM_XE_MMIO_WRITE)
-
-static const struct xe_reg mmio_read_whitelist[] = {
-	RING_TIMESTAMP(RENDER_RING_BASE),
-};
-
-int xe_mmio_ioctl(struct drm_device *dev, void *data,
-		  struct drm_file *file)
-{
-	struct xe_device *xe = to_xe_device(dev);
-	struct xe_gt *gt = xe_root_mmio_gt(xe);
-	struct drm_xe_mmio *args = data;
-	unsigned int bits_flag, bytes;
-	struct xe_reg reg;
-	bool allowed;
-	int ret = 0;
-
-	if (XE_IOCTL_DBG(xe, args->extensions) ||
-	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, args->flags & ~VALID_MMIO_FLAGS))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_MMIO_WRITE) && args->value))
-		return -EINVAL;
-
-	allowed = capable(CAP_SYS_ADMIN);
-	if (!allowed && ((args->flags & ~DRM_XE_MMIO_BITS_MASK) == DRM_XE_MMIO_READ)) {
-		unsigned int i;
-
-		for (i = 0; i < ARRAY_SIZE(mmio_read_whitelist); i++) {
-			if (mmio_read_whitelist[i].addr == args->addr) {
-				allowed = true;
-				break;
-			}
-		}
-	}
-
-	if (XE_IOCTL_DBG(xe, !allowed))
-		return -EPERM;
-
-	bits_flag = args->flags & DRM_XE_MMIO_BITS_MASK;
-	bytes = 1 << bits_flag;
-	if (XE_IOCTL_DBG(xe, args->addr + bytes > xe->mmio.size))
-		return -EINVAL;
-
-	/*
-	 * TODO: migrate to xe_gt_mcr to lookup the mmio range and handle
-	 * multicast registers. Steering would need uapi extension.
-	 */
-	reg = XE_REG(args->addr);
-
-	xe_device_mem_access_get(xe);
-	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-
-	if (args->flags & DRM_XE_MMIO_WRITE) {
-		switch (bits_flag) {
-		case DRM_XE_MMIO_32BIT:
-			if (XE_IOCTL_DBG(xe, args->value > U32_MAX)) {
-				ret = -EINVAL;
-				goto exit;
-			}
-			xe_mmio_write32(gt, reg, args->value);
-			break;
-		default:
-			drm_dbg(&xe->drm, "Invalid MMIO bit size");
-			fallthrough;
-		case DRM_XE_MMIO_8BIT: /* TODO */
-		case DRM_XE_MMIO_16BIT: /* TODO */
-			ret = -EOPNOTSUPP;
-			goto exit;
-		}
-	}
-
-	if (args->flags & DRM_XE_MMIO_READ) {
-		switch (bits_flag) {
-		case DRM_XE_MMIO_32BIT:
-			args->value = xe_mmio_read32(gt, reg);
-			break;
-		case DRM_XE_MMIO_64BIT:
-			args->value = xe_mmio_read64_2x32(gt, reg);
-			break;
-		default:
-			drm_dbg(&xe->drm, "Invalid MMIO bit size");
-			fallthrough;
-		case DRM_XE_MMIO_8BIT: /* TODO */
-		case DRM_XE_MMIO_16BIT: /* TODO */
-			ret = -EOPNOTSUPP;
-		}
-	}
-
-exit:
-	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	xe_device_mem_access_put(xe);
-
-	return ret;
-}
-
 /**
  * xe_mmio_read64_2x32() - Read a 64-bit register as two 32-bit reads
  * @gt: MMIO target GT
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 59e9f2f87074..e39d66a65c89 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -106,11 +106,10 @@ struct xe_user_extension {
 #define DRM_XE_EXEC_QUEUE_CREATE		0x06
 #define DRM_XE_EXEC_QUEUE_DESTROY		0x07
 #define DRM_XE_EXEC			0x08
-#define DRM_XE_MMIO			0x09
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0a
-#define DRM_XE_WAIT_USER_FENCE		0x0b
-#define DRM_XE_VM_MADVISE		0x0c
-#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0d
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x09
+#define DRM_XE_WAIT_USER_FENCE		0x0a
+#define DRM_XE_VM_MADVISE		0x0b
+#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0c
 
 /* Must be kept compact -- no holes */
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
@@ -123,7 +122,6 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
 #define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)
 #define DRM_IOCTL_XE_EXEC			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
-#define DRM_IOCTL_XE_MMIO			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MMIO, struct drm_xe_mmio)
 #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
@@ -939,27 +937,6 @@ struct drm_xe_exec {
 	__u64 reserved[2];
 };
 
-struct drm_xe_mmio {
-	/** @extensions: Pointer to the first extension struct, if any */
-	__u64 extensions;
-
-	__u32 addr;
-
-#define DRM_XE_MMIO_8BIT	0x0
-#define DRM_XE_MMIO_16BIT	0x1
-#define DRM_XE_MMIO_32BIT	0x2
-#define DRM_XE_MMIO_64BIT	0x3
-#define DRM_XE_MMIO_BITS_MASK	0x3
-#define DRM_XE_MMIO_READ	0x4
-#define DRM_XE_MMIO_WRITE	0x8
-	__u32 flags;
-
-	__u64 value;
-
-	/** @reserved: Reserved */
-	__u64 reserved[2];
-};
-
 /**
  * struct drm_xe_wait_user_fence - wait user fence
  *
-- 
2.41.0

