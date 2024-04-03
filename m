Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DA4CD1288
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 19:50:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55678112E70;
	Wed,  3 Apr 2024 19:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QM7HtUty";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BF8112E70
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 19:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712173855; x=1743709855;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=VrqQzGXbFKa9yKlFemf2rtnbtF4jWVg5L2dg77Xrd4I=;
 b=QM7HtUty+PNQcKJvyiqZoQluRUixToBFwj/8C3dPLJacX5romZjwQfsc
 BVNSbmivlLuOi67yaKOlFLbdlmIqQQtddS1VXcwHsXC6QMaFHOBEJr1cJ
 dBC6NGUl8rfOZRU38dXY86k5fhyHmdE1kXVvCaVAVJ6dIRgp7gIxdCg+i
 qqZ7vNLulBdes4taXu8X6rvzQ/SGScfWPLIcKm+Jeb/EZR5EYQQczrT20
 jSpBwyX3k0L0nRQfloBoxSmQF8lOQgm43B3QscrC+4LeaWHhfYm/Acw2i
 DJ8TSOla2r10KCOe8X1ThBTaERpVEmTo3dMRFfDnbjz7hBLR7DPPWYoV0 Q==;
X-CSE-ConnectionGUID: HOdBBxeZRu+0UQx0l1A3rQ==
X-CSE-MsgGUID: YwEl8xDXR2KWeXSrYao31Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11257364"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="11257364"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 12:50:54 -0700
X-CSE-ConnectionGUID: ImhpCoLaSD6v0rGKCrrzYQ==
X-CSE-MsgGUID: 2nvjHrZuTW6teqr58ybBiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="41714959"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 12:50:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 12:50:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 12:50:52 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 12:50:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElLA22sioRjqcFab4E0bu0Lrz1gxJUg7x+Kn8yMO3J3+xLBko+XefL6lARC3OBJLXhXy/LSImhKsmZCJ6tKhnFddm3Ls5u5xrvPDKzcNPi9VSBjY/bMgDIP/FMdtwpN7wvUTFIU5n4mte7f69bLV0Ki/MN9Wj1QVukRj6SvbuBH685clKr9TdrJK8NFNuA5O0Zm06oxTLe+/kHh452QYHip67kXF0p/ZHTFtfFEAmcWXzJTW9zUfIR3r4roIu8g8ZFNwOXqylcTJZ0Ba8mMuPrsJDySSoeQyz8zQ36d5Ux33RbulsW5CGG/4GxCF2Z6PJjqT4OCWJ82tcJQOs0RLdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tdbcgyMs92TIelnDneKwMhGAIDaQKs8LuX5FeLm88M=;
 b=RRYsCHNzHssIUb9D8X4gUe2ymxqzTjy47pmEoeK5J9mV/SNzLTWauzpGR2P3qTZR79Gcue9JVxOUYTRhy0Ha02yEPKboD/KpyfrhU+b7Nr3Hub12So1zjNby53hHQSwQnvcMBILdu1gDf3x/SqLqbdMQO0izPB5YcjtPHlWSV9MYj35bVDOejNDJRToxH4HRkL+mTu91tEDpmf/LvvMH8vUWuXIFKY1mk9kZyNyWG4QJR39R/O1VkNMu6zmuI7UkzOJ+J+H2VeD5VQLoptxwaToEt3H+LnEGAjMzdd2mAH0ARi1Ou+CTg9/ol+TYRz6YqC8NlyhqtqrDnYlAxFifiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB7031.namprd11.prod.outlook.com (2603:10b6:303:22c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 3 Apr
 2024 19:50:50 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 19:50:49 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>, "Nirmoy
 Das" <nirmoy.das@intel.com>
Subject: [PATCH] drm/xe: Protect devcoredump access after unbind
Date: Wed, 3 Apr 2024 15:50:44 -0400
Message-ID: <20240403195044.239766-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0389.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB7031:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8adxNDHp4CFe45O1rS2sIOhmIuXtp4VRrO4kvfeItkLkzwmZT66Xku5rzX2Q+fdhSRYS+ageZ9Ca+cCZDX27mQLSq5V1+6M81U93DroGa6m6UX4Cy9guvQ1NA8c1Zr2ttS60Bn54Gx4sN6AIo3x1txqNU9jr3RaNK9a35eLt4TIRz/XwD7gqbLXqPhKQR7MuIKYRI18SjZmUUPDwhyatQnaDkCtVey+3HcAcx1Jm5QwcYAqTGV3QOBLgIQokcqVxlRaok3kne9Z/cfQn4nrxB7KgHoW6GyadIWlFLvciFK39ZEUjZA5C7XedRbFTQ7ATw/OH/UGXxka0QBnEYKn8wiKvfdJPgK843nBuJ45+fza4+luuQT9Q72yxZVKhNYWvzXH7rKbompB56sfzXlZ0rYkncpE0osp/eeOT7BoaMbOQIRAQjaS5tIRj7AsmHU5/8azlsF3Sfc1UIHpVdJSixwBRrMoURwFG1NlBbTNN1TbCuInrKbwuaAf2i5fvG40tgKh8bcfsenJ79pkaLjHIZdmEmieN4E2oxswGTCbNiW5cur4IwvXloCnNH9QBBF793YV/qi9XqyzYeKbXg2Wp8GAf90y/if3xpLN2R2908PnZGg7gAQMINRvSai6g8szRYeyldR7SFhnMMKeRo09KsfUiQtbXsYAlxHr+/pBP14E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MElCWFE0VXgyZ0lKSXJoNkNVSXNDbi9oNEVubFU0NTV0WkJhTlZ4ZWNVK284?=
 =?utf-8?B?VFJtbVV6dnpzRmNSOGp5cENrb2JaTXRKR1FGVjJWWDVqUHFDN2VmdVNrTC9v?=
 =?utf-8?B?d0tNb0NGeFlOV1NMUzJmNnlQKzNnekN6QjZsVFdTY3J4Z1VycGFjTXQ3U0pZ?=
 =?utf-8?B?L0FvV0Q0MVZMODUwRUxVQ3hidE9QYTE1T2JiaE5zU25HQm53aXM0Mi8zSFk4?=
 =?utf-8?B?UlE4R1QxYUQrUVVpMkpYVWNaMFBscUp3WDFYa0dXQ3U1UCt2UnlFK3drWEIr?=
 =?utf-8?B?REU5WHR0TlhtZDBaYzc0REZITGhvbFA2QXJpNXg4VUF2NUdVb1RpbkhZenVv?=
 =?utf-8?B?bEVTcnVkUTJnaHpQdlBsdUNKdFpIYzR3bVhBQUNkL0NWbU50MHBZa3pQUDRz?=
 =?utf-8?B?WDhJbW40WWpkQVVCSDZqdmNFUWNKVTR5YUpxQmM1emlXd0t6WUhxK1hkRXJy?=
 =?utf-8?B?R2hiaXlBOWNScnc3NzNLRnhJZmMwcHY4azNTRWg5MXlsaURZMEdLZGxHRits?=
 =?utf-8?B?VXdrOUo3UlcwcVZNWTEyOEtZUUJNVlFxNENnSE5taWxlbWl1M2VCeXd6aHJp?=
 =?utf-8?B?ZUZZL0IxL0tkc2E5dnZtVkQ5Nk4yazJsZDQ5SmwwK0x0U3JQU0FBWU9mSXF0?=
 =?utf-8?B?V1U0MW9ja1MyQUtSaGQ5RDFYczgxQlgvV3JFVWxnamhMYmUxaU5VeGs5MStY?=
 =?utf-8?B?b2VsdmdpY053aGY4cUdkekRZeG8vY09JNEk0eE5vL2NySStESUFIZUp3akI1?=
 =?utf-8?B?YmZodzJZeHdDaXg3S3BtVjgvM1liUjBuS1NjUlZHS3lhR1VUcFhoN1BRQnMx?=
 =?utf-8?B?bzZFMWRWZW9IV0R2cGxyZTh4YVBZQlQ3VGdRMmhyaDAzczFKamNYUjM5Z2p3?=
 =?utf-8?B?L0dHVzRFKzY5NXpsK0p0MlVtam5xRFFpYStIY0JvR0VHS3pZTlNlRFVoVWU1?=
 =?utf-8?B?SFl2WWVLdFFhZVpaMlJlb3V5TVNUQjlzaVpwZE1UL043WEhKYTROYzlvcG1U?=
 =?utf-8?B?OStrb0g3TWQwSkpOd0NKOG5CakNudDY3RjZMRDFydm01WW0rWkF2cFJuRWpY?=
 =?utf-8?B?dkVUTmR3S2lBVHlaZ203ZTl2VHNXcU80N0Jpb0k5Q0daWncvSm5NVCtWMXc1?=
 =?utf-8?B?NnNuc1BycUsvK3FUekNiR0tmcWEvLzFEK3BQeUZ6czVhV2pTSlhMSll4Qm1x?=
 =?utf-8?B?WURPV2ZHUmFMQnpueWd4YkR2MmJNYmdVbUxhTlQwQkRtZW5kZFNIaVh0UVpG?=
 =?utf-8?B?MFltcUNUVkhvRy9XSjg0aE83M1RReGV0Z2dBbll4QWthYlFnVXI3blNkNXRH?=
 =?utf-8?B?c1pvTkl5cjkybG04ZEF0ZjhGTkxkbG5QTm5BR3RlK1RqZGlMM1JXa1VpelNt?=
 =?utf-8?B?TzZ1UFdDYk5EWm91ZjN3WFY3czF0L0EzTnEwYnFnS2k4SC9ib1FVU29zL0hw?=
 =?utf-8?B?U0JNT1NGVFZoOVNqT1lqWDhzUEdsd0ZvYko5ZktJU1BjRGwvd1VnME8vYWNQ?=
 =?utf-8?B?RUF5VjZCQUM1REVKQzcrUFNCazZ0bFIvMFl3N09qbUptcUNlS0h4Z0NJVGlL?=
 =?utf-8?B?Z1NkZk43RG9TQWFZR3RqcklIY1N4NThCak9iRWx2YTQxU0s4eUUrTmVxdFZs?=
 =?utf-8?B?LzBnZGJnTnU2TnZrMGpLUXdWMHFHZk9xWmhZbFRLVndEM29KNEY4YjVXRFlC?=
 =?utf-8?B?UVdCVFo3eFZ1TjVIUkQ0QXVVSE5VeXY3MU53bkFFWEthbmlnYlViZUx6eTlD?=
 =?utf-8?B?WDRjY2JSRjkyb3JrRWpMa0dnSnRNRStRZnc0dXlKNlBRRVVtTkRPd0VwV1hF?=
 =?utf-8?B?U0orMnUxUFloK1FnVjErVTI4RURES0FjRkNYcG80eWlqMkpzV0t6VTZqRnQ3?=
 =?utf-8?B?dFhjUldBVFltdFJIUFFuTTBVd0oxTHBweXB1ZXZReC9HcEVlczl0SVpMRnBG?=
 =?utf-8?B?Zi8zMENHME0rSnMwczlBSjZSK3JXSldKSm0vV1YzZkVBSGh1L3RGZU40ZjlW?=
 =?utf-8?B?elIwVzRYREZja0tmSlZJSTJtbmsveC9nYW5tYTh6WWQ2a0lpNmRJaVBDMWtL?=
 =?utf-8?B?ZHFENmpEMWpCbEViK0kwTm5KdkluQnV6V1FIZHFmMmFTQVhTVGRTOHpPKytG?=
 =?utf-8?B?K0wwZEtOS1JlZHNTcm5sTGlNRUd2R0hlZC9PdDJjOXNiVFhVMlZYMlBSeFEx?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a1e8133-e424-4d99-ecf4-08dc54175c04
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 19:50:48.7050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o4bt9pjJPOXdllWNOnGSsEydxYfCAi0inBRDb8DgN6TKVBrZ92U8VtRPoGmTGcP88gfbQemdTzGm5/ok/0A0jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7031
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

v2: - Use IS_ERR_OR_NULL (Nirmoy)
    - Expand to other functions

Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 1 +
 drivers/gpu/drm/xe/xe_vm.c         | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

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
index f4bfb2705956..2a431690d245 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3426,7 +3426,7 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 
 void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
 {
-	if (IS_ERR(snap))
+	if (IS_ERR_OR_NULL(snap))
 		return;
 
 	for (int i = 0; i < snap->num_snaps; i++) {
@@ -3483,7 +3483,7 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 {
 	unsigned long i, j;
 
-	if (IS_ERR(snap)) {
+	if (IS_ERR_OR_NULL(snap)) {
 		drm_printf(p, "[0].error: %li\n", PTR_ERR(snap));
 		return;
 	}
@@ -3514,7 +3514,7 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
 {
 	unsigned long i;
 
-	if (IS_ERR(snap))
+	if (IS_ERR_OR_NULL(snap))
 		return;
 
 	for (i = 0; i < snap->num_snaps; i++) {
-- 
2.44.0

