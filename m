Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799FECD1288
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 14:51:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F1A112B96;
	Wed,  3 Apr 2024 14:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uingo9xA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFEF5112B96
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 14:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712155864; x=1743691864;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=7x7y43yQsDmcI2ICWF7dX09azuitAt/rTk7y5H/LMZk=;
 b=Uingo9xA/rXPCrxTjZ1i2ew8O86SXLNXNlZobPwDe9m6pRg9U974+T2A
 1FTvsFsr6TYpFgplwZpBLTVcxmFRr6EckS6UTsDf2sk8xgcJ9PEiBeotZ
 PEcX93Qnv1JAeunOsq8J6JeoIcoJbljDcK5UNB+pmLo62kKSBCLTeTMPY
 6wnfyfNwENreaHsu/o135hwfudzWekCdQvTbK0X96mri9zC9Lsz116SxB
 FGE3zSUsLGVLUzq4K4NX2vk/p4JS8S915N0Y2NoEq288tozG+yJVaXC+i
 sZso0XbGDzhDkix46kZFN/riUebwaRrHslMQsGNnIJhLgkTqX3888JjkL w==;
X-CSE-ConnectionGUID: qChbKmw8RmmO3iYnjk7W9A==
X-CSE-MsgGUID: XCSxHcA/Q2WtQuylurHlCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7239220"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7239220"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 07:51:03 -0700
X-CSE-ConnectionGUID: /q5KKQ+8T9GNMZgoUicvyg==
X-CSE-MsgGUID: n1k9oNFrRG6dti1yg0BiJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="49692221"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 07:51:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 07:51:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 07:51:02 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 07:51:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKDzOw0ukVZJFfO31sboQorEwYGA8rMdaKm0hKVE2YtovQSCHiN2U2YUblfcXgvnQdkKLgFxutF3OnY0ZqGUnEL3V6+tA5zw/t0c1sOSMU6E2McaAyA+1v2dSeeGyzmM5HAY/aVP3RfyVytSLF2YmTtkZzDkdFHAMiXHF6EHt2VLyPAKNAU2EGiQGrV+f4IONN39wHmsip0IZFey+a5O9IEj+/n9Uu9liFqicdus1TRheC8JwbebgZxND6YEMvREfdcHEkD7MKKxTFcoTF+rQqPSovQSYcvWeQzGGAQ9bFSEMPIu8tB0DcEXQd7ILS3l2OTMPPqW9iSM5WfyVcVqxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3TBgBprRqC/MB2UIwWlivBDBxpFj3IqgyHW9BMLbtYE=;
 b=ARDUj/zfMhqLuh9Zl3glvy9VoQqLpgupbueDcXyX5jEjc3VKouaYITTybLMNPTQW8MaPNDpHaG4GziNbl2p/F+L2vyx0mJRZ4iWxYWsEVRSEBFGIjkLbxaOWWd+cyBSkjYTWPhX+Tg0K9Y7io+IB4B3R3eT2oIIX3wBXxEHUtcv58Fx9yGxaEyhd1SXFReAn4uWocJPi6YUvxq6cGVR1XhcRM5l9BAJugSE643W5xzwPcmzju7O9CC5m1H1bwBjVUPbL338FJ+xixeCyAfDbiyTOWzm6YC2oNqaKjVTxbJrdi3Zsaf+hPcOOytyVYG9OvY/Xlecs1pt83KTOFizbpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB7024.namprd11.prod.outlook.com (2603:10b6:510:220::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 3 Apr
 2024 14:50:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 14:50:58 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH] drm/xe: Protect devcoredump_free
Date: Wed, 3 Apr 2024 10:50:54 -0400
Message-ID: <20240403145054.97414-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0064.prod.exchangelabs.com (2603:10b6:a03:94::41)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB7024:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o7BvumbXJ6EgxoF0+R/QgMz9toZ4v46XYeo4LIGikATgQk3PO3f6GPe0V6kowGSW6QfDjliPLeiY6hH/csD6PBjNxwxXpcAY06lRsxWfVQZUm49Unje9usCuKxY4QoKAwKBjg22SvQeY0X2TKppGZptEMcuo+8HU7XX29psMlKoReI8pzC6BOmrd1QhTMB3/swNIO1V7cXwi5/sw+LsM/AH5c2cWBzVQUn0pBtaXQlcIf5nAQwaElQbUsUEVx+qCti6k98RvwVb2dIH1SNWbJdk4Jyywiq9oudvhnvZEXrf+5KQW/1hLvQ4WP83uXVA/Mx9ahZ+vtsDQq+/2ZqwG2fCp9H4w7N92UOxIv6w1854eQYunJans45zQoYEJ+FuP4PsQ86ZxcPPlonChGGSDSX0QWFzUSrZm8R0qwWpJuw6YYZp0S2ygFcfz9hB06FucDxrIwHbRG15ghNroSIMufiK3b7LeH2YXMW8ei9GmCwkSCD5uWaQUMm8pXbz7ytDoB+lx3U7SWbsV3XomTnLdHylcK8Q6Tz1oscL8ZCScPSHnoRaJx+gbccHzeX0wnFPA6+4HJ3pjPS6CpTgVO7c5GFc8cA8+3xKv6mWq8GjCQevxrdlVSO1xHTo+ov3KN9tFvrupbEGmB6Vm1bz6grNx0oOTX+7DWbyFecQYAftZ9xg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QklSclR2UXBkVjF5REdPczc2SWxzMElnM0lMWUtKZzBib1NYVTdQOExkLzhx?=
 =?utf-8?B?bWNNZUhPWTRtY0tCSno4MFZKOFJreUltWklYUkFyaVVOcnpndkpvTnJlb09Z?=
 =?utf-8?B?RXlhYkUzeDJNTDZaWUZIemYwaFNXSXZVMHJHVTQrLytQRmJvcitKODRyQnM4?=
 =?utf-8?B?Q2JPOUFYS1JlYUx5ZmNrMFEwOUwrbERkNE5NMDAwRzRWUWVIcjdES0lMSkV4?=
 =?utf-8?B?M2ZlS2ZJOUFIVThyeDZXNFRNb1V0Mk80ZXdqZFFENC94OGVUT0J6bnJBVHor?=
 =?utf-8?B?Y09Fa2FBdXRpeE9XZVVMUUd1R0FwY1lDYloya0p1MC90SEdtTFFvc2kyTC96?=
 =?utf-8?B?c2hBVmFKeXZ4WXNONVlCNHhmN1htZ3BLODBZVmZ6Z29zVU5aUXBDSUQ0RVlY?=
 =?utf-8?B?UFRGMkNkZElqNjdxc1RuOGpLbnM5K2VuYmVLaXBBQmV4d2Z1d3BKOHcyWG55?=
 =?utf-8?B?YmtDVVhGY3pYUGlmNmhBVWxxK3Q2WXdrTjVwMy9rbGlEd2ZtZys2T1FuK3lU?=
 =?utf-8?B?OE9Zc0J2blNmWHdpczZNMXB2R3ZoTy9Ga1owa0hHUDVZb3k4T1NUendaWExP?=
 =?utf-8?B?N3E1b2pWaDNQKy9jbm53RlZnZG42aENaM3A2cDFMQjFWZm05Ry82V1RId2xO?=
 =?utf-8?B?WHZRMHlWUEJQZC9WdnlHZHJ5U3hHQ1pLbFJPOWg4RGFITWRFcGhJUVVaOFV6?=
 =?utf-8?B?MktZL0V6d3d1TjZYelhaeVlJb1VKcHRaRGpGVlF2NmJpSDA2UmYrZTY3UTg5?=
 =?utf-8?B?UmlxSEhyb2tzelVXY09qYWY2Q0YxK1hhVGw0WlZRWCtVNDk4Y0Y0MHR4cExR?=
 =?utf-8?B?V1VjdndYeEljSXVkamZrb1M0SzJILzdkOEhNTmtOZEs2ejNPc0lwcmNoT0JV?=
 =?utf-8?B?MThjV2ZVa3oyTlgvc1J1WTIzVnE3eXhoWDVmcytVdW5SUkcxRmFIZTRldTJo?=
 =?utf-8?B?WUVhMVFuZE1aelcxSFhUNzM1cEpGOXlyV0VMcUx2OVliZHhsSGdMakl2aFV0?=
 =?utf-8?B?djZmeCt4NnF6MThlZnBqdWphcGJZNW5FcS9iVGhCZ1dDZEJ6Z3I5VklDZ3F2?=
 =?utf-8?B?UGFXOC9icTRsa2NGbWJrZHRnbWgxTDJ0dmE4TW82ZnIzNTBoNC9LeW9NVFM0?=
 =?utf-8?B?bXBqTzRBa1pJUzI3ZzhMcjI3b1lUVHdlWjVWZjlVbkpqQms0ZVIwemNHU1NQ?=
 =?utf-8?B?Mkp3T01GaUY2ZEZEWGNPR3RJa1cvOTZHTVI5bGJBSWFYTHZhaEFPVlROVHpT?=
 =?utf-8?B?REJxTnFNNFc0azFhYmlVdG83UjZva0IyRFV0dk9neXNQOHI1TWJicnlwa3p4?=
 =?utf-8?B?cG5sOE5SUDRBTUh0dnhqYlQybXdLcHM3cHhpQjlpdk5xcnN3bVRrK3R2Yksw?=
 =?utf-8?B?cHdSMjV4MUIwbWNjQUR5RTg1S01lVW96NnN1WFJtTkU4R0g2RWQ1ZWxsRTha?=
 =?utf-8?B?QUduSldZT2M2eUx6UDQvZ2NYeStjYmx3ekJMMmp4LzRxdzNiZXRaU0hGVHNO?=
 =?utf-8?B?OW1UVEY3eXRabjRqbW1FQzN4dE9NSUU1bmlod2tjZ3NNK09nQ0MvUS9jSHBT?=
 =?utf-8?B?YklKbWovSGxoM1NxR01HQUwva1NSWk5vYWVIZUE0KzBXVi9Ma3hvbkQxSWVv?=
 =?utf-8?B?Y0RXTUJFWjFkMzlkblNjS2I1bG9SVUI5c0Rzdk4yS3c3cnEyVVh1WGFMOHJ0?=
 =?utf-8?B?S3pPbEkrVXNmMzVUTFd2Mm9mbk11WnR3TUdrZDJHbTZqWU0zeEdxREpPZUp2?=
 =?utf-8?B?SjZyYytLTVhjajl5RHg1U1VUMDRmNkY2TXF6L0loY2ZYRzg5SElUREJWUnl2?=
 =?utf-8?B?MGZiOXk0aGlyMmNST2lNYms0NytmWnNKeDFJamtvM29aZzdySHZ3bEhoazVs?=
 =?utf-8?B?L0gyMlN6VVRGYkF4QzJmNDYvc0NEOXN1Nmltdk9MTkhzdURCZnhKS2k1M0ZX?=
 =?utf-8?B?NjlKN1p6NGc5WlNmUGxoL3FCRVRlYkpQckRkbGpDdjJrQmtkcDhIWmVGK3Fo?=
 =?utf-8?B?WEx2QzhFbUN1T0hDNk43UHBIUFJndEp4MmJQVHhDWFpMRERLUHpyNHhDc3lM?=
 =?utf-8?B?YWZpR3ZmS0IvY0JyYXpENTVRL3Z1RTlNSDZPdGlGakFNaTNWazBWV3VwYlpr?=
 =?utf-8?Q?Og6xEYc00Xon3UBKQGPnZTBeQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d45f055c-8614-46ed-b523-08dc53ed78f9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 14:50:58.4620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mxGgVlZ5lkPUULh3B05ShXT5C/JIo5BTwzCYCuA+zx8b75Ag9DjZZ79fejH/onuRpa4hrMt6Xjcfh31AaY7IHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7024
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

While we don't have the full flow protection when devcoredump
is accessed after device unbind. Let's at least for now
protect against null dereference:

[  422.766508] KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
[  423.119584] RIP: 0010:xe_vm_snapshot_free+0x30/0x180 [xe]

While at it, I also fixed a non-standard code-declaration block
on the similar function of xe_guc_submit.

Fixes: e5f661bb56d4 ("drm/xe/devcoredump: Print errno if VM snapshot was not captured")
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 1 +
 drivers/gpu/drm/xe/xe_vm.c         | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index f42f1b567067..6e32f9ce4eb5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1961,6 +1961,7 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
 void xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapshot)
 {
 	int i;
+
 	if (!snapshot)
 		return;
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f4bfb2705956..ccb2e1c67c2c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3514,7 +3514,7 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
 {
 	unsigned long i;
 
-	if (IS_ERR(snap))
+	if (!snap || IS_ERR(snap))
 		return;
 
 	for (i = 0; i < snap->num_snaps; i++) {
-- 
2.44.0

