Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CE9C47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:35:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C44310FE69;
	Fri, 26 Jan 2024 20:35:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B9E10FE69
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301346; x=1737837346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qcQIISVKmKa5KI2gYQtoLgGi6fDBzIdhKyZsQJEQt28=;
 b=M0SekADT0F7WMlu2VsBadz3bjy5thDraT3WWzMxejjwlH7VHpJXh/gN4
 Qrri1QKjsMHyxCcmLWQb5ihXmbEAhrpdZbGx6NNKsMZ6n+IvbVWEvstNA
 vNH9DER2YWn8UkeGAs5dDuj15iSG3ndXhWs9nLrae8leor4r20sXR07oO
 oXpH7ut8SA4dCLDaVE7WUVskO24a0Nr8/fdW/uVPcDd7cQ3sCw28MvSei
 5HYyQV5AExNpf9596QIa61ZIwU9KHIZ2QFHRUGfVUNyNBzIqAgBy0UXy6
 XJrEVu7/Pq9V4Z2itG2PLAJ4UCmJYe/TibPR8HHJ9be1fHcm4S5ffuzaJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="402220238"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="402220238"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:35:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="906412120"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="906412120"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:31:08 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:07 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:31:06 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+ye4u2lTDse5vKjcKxmOgSvgpPIWp/xDYYoIvfWWUSkRbpALgtsTP7gTXtqEiuoQG3mxEb8tOfwjB+rMYfggayNCFsyhjvil2k/w0rYkTuetptXzEHmDhYt2Wa6xbBw+YMIKWS/xxngtzd8gMM49kq75t9ElFQDU84XkfeTfrx9KBgodc8aBMxheEmYtJc7+J5qmO3Brsv7JvjuskQuv3V7TmwxeKAP7g3Yr8Fc15FZKzvgdnCh43vOElraVv7Uv8jz7v1BgexFgcAxxxv/eXxzsgI71Wdd8BGhzbyDJ/DhSXSEz/miLfdvOWUDYD8ctxQet+QM8k0YSbPOM6cF3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exLHUeJoJcHlZ80IYXJggwamFBzQQHueR9aLs2BER4w=;
 b=n3tFfTfmwJ+fH38WhY2/Ca9c3fd+KJ3x7c+othOoG7NZjoKnTwYXxi+2dQ/diHhlyKWHTIHEzsNxU+cJl76BWKK9kpbTwiF47jjqDqjngFNi51+Xc4zwDDPhczHPoZRst+33b320NhB8xE6zjxZgiLxkjrAW3YUIyN5VezeG9qZW1KrP2CscUSz7pEmBOdHzDHFiCxfnDPsJ52F2IfWQ+KOc8BeCl8k33JMMA9BRaISRjMlEd72i1eMXeZP5jCpFdjxFsxhJ0q3rPN4khRx8n8DywIYUY3i7DBPgMCv5jfsAqDi65HYSDz3+DudtRI2aDHgUMyx3E1WgIioSwdT+rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV8PR11MB8700.namprd11.prod.outlook.com (2603:10b6:408:201::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.24; Fri, 26 Jan
 2024 20:31:05 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:31:05 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 06/34] drm/xe: Prepare display for D3Cold
Date: Fri, 26 Jan 2024 15:30:15 -0500
Message-ID: <20240126203044.1104705-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0032.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::45) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV8PR11MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: 169a1275-4d12-4d8c-e64b-08dc1eadb850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FpxaazNJTnnfBn1D/GODtNppjmb5MhQHmxxgqzfpGH6Qn77/ujiee4I58vf0kkDcYgVhMDKk1ugiirYz9S404EYM30ynQDrGOaMModOz9lgFWOgn1xJpaIHhhETsuVdl0NlssuOQNnfsNkOsCCgTIzjlKPJj636P3k19DVnIB2l18VPnNc706dOAkKBy76DT+nz8MWRcETjsLOHFmFgMf+iRLYcI0U+4fybj0jP7PQoa1wu3+08yFOIBAS85V+bgxr0Q23fNt6moJdYJIsEA5tgeDLeK587a0fF7GChHDZ4OqEzu/0TgQ/Otmt2xypW1D9yYPr6nP1oY4DuWPVU1dzReHCL+wFmCJg3WGYtz2tD9w8gPy0VEBDJXaO0pQsKJL03togywpv7P6y8IPdQty50Ctas+9G7ONQmP/ZhNplyHnlaRziCFcNuxpN3Zhis4ZaoVwcmCk/bzM4OFroxDA5iYBkZwzhjOm1iyffKyFRQz06s2ABo6ZVERWJwO494EOLVPKFxJP1aKtdvLGt4A9fjSQNwhXx4x6idc7RSi5XSsFaRTOV1xAMI0r7XvJwy9IbK5yHzdHywyneUR+drI91wX7HNgD6MxPTlGb6jAP8I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(41300700001)(83380400001)(26005)(107886003)(6512007)(66946007)(1076003)(38100700002)(5660300002)(44832011)(6506007)(2616005)(2906002)(4326008)(8936002)(66556008)(8676002)(66476007)(6666004)(478600001)(316002)(6916009)(36756003)(6486002)(82960400001)(86362001)(66899024)(32563001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uPNQTDlcA0c2aYidI3k2/HtZmDgBqJg/X9mutLr488JGqn08jgUMBNJURLHp?=
 =?us-ascii?Q?VBMy84YSUZt1qQnJDerF0weckF0U4oGJOs+w4oyuVDCobtumdOeRctv4c6ER?=
 =?us-ascii?Q?Xh0Z5ZCfehJogR6ECjVitTCwy9klBp5EP4V7m/zzQjiiL1TCzd+aB+hVm+C9?=
 =?us-ascii?Q?CwjlAgHZcnngjuiPa/WCQ+juNfJ/hVRHRGFeJ8WkI+/swuI6r6/Wmk2bHDJk?=
 =?us-ascii?Q?Btt4hCTUBFfwfouHoAMkaNUv7xYl/CfuWJC+wIqRunCM1xAJTGfQ40hTPDUm?=
 =?us-ascii?Q?UZJY6ZVT0YLC2w+rw0T9dDl/0XNvJ0KcRsQKCxZNIb3XMO5ivVcHy6CfxgB5?=
 =?us-ascii?Q?6w2CyW2U19sTHE8VUa+hgB33VkH8rRv70Mban5eTAE6eVUZmcs4OQv49eP42?=
 =?us-ascii?Q?rNGioJx5hTUDzJjQq6J5t5osa45LUdUI/ZR8CmhV/lvvq8CWNs0nwHeVZOyc?=
 =?us-ascii?Q?pOfpOGn7016yvx9RcZoJbl6Nm1BrNYGz4oncJ7EVFrCew00v9xMlu8S6kL12?=
 =?us-ascii?Q?RZIj8BVbbCn+mpudCdRpG/Z8mVD3GUDLtqkbNIWZHFiYjzOZbjP9PBmwB0Ty?=
 =?us-ascii?Q?MbjV+9Y8lMVUyH87QfDs6vJpR13jt0sDx630gxtJN1aHuUEy4Z9f+bMIcbEq?=
 =?us-ascii?Q?QpE1BBUzHhueVzYtjWZWJru/xCOnV/yUSsy9GGTtpkfbYUm8/va0AOv1SFdD?=
 =?us-ascii?Q?5Y/O882jhAcLj1/oDOR1xRRBBDYYwVKxouoMciAf6mAwiFYT4RP0ATd6Qhk5?=
 =?us-ascii?Q?fnAiCRJ97qekUtVE2JFYJlodf5PQmKbXIXMQOm1Cj3xRKh9pHJc487nq5zoP?=
 =?us-ascii?Q?PqGeHRLbC1/MuFLZQoKMOEVxfusJ78ZjSAKrdwDqc9dZBZGoUM8RUSS2iYVr?=
 =?us-ascii?Q?pqq6fNxD/6FLfrUEhIpV0ri3YIgPYY7zSN57Zs2+qHgJN2aTE2qucJgUkmtd?=
 =?us-ascii?Q?eUdWYzJXUDQFy6m2MMq51mmvXvLhtAzJFfsboMeJ0z7hd6e1UKbdKeEk/f2D?=
 =?us-ascii?Q?YY0sZFzMFTQ5wNjRXwW94Rra1J3OPB/DIfuFoCoYFRkn4RVAjkodDwDHxvSp?=
 =?us-ascii?Q?X49NN5jicmsz/s+D9NJgDtVKT8FwupMwlV2n0HDBVPCnvdYY1+/riSX0/qPA?=
 =?us-ascii?Q?AEvEn6RHRFXplFo/aYaZIbB020zTYPRHnSFtgnyKukzqAK4cEcsb48GKGGd+?=
 =?us-ascii?Q?L7SQ7pE8KrabeQ1J8wBzOz72cVqYe1FewafjfoFOphnAdOtE4A095ALe1BMv?=
 =?us-ascii?Q?eBDSAxEwVjPXHpH8AgGaiPlJn/BkXDWm17FjNBp7AKlqMNcB9+KANgd1tKJi?=
 =?us-ascii?Q?6MZ2NajWo6y2lBUtQrn5M4TO9wT/R0w7P4S69C1a+2w4LF/eY83pQfNxo3Lz?=
 =?us-ascii?Q?NCTrmWU/F8t6cms4sRdUAiXKYlHpJR1NF6dyh39SRRD/Ovs/z65MMGs8YXyn?=
 =?us-ascii?Q?8scA5vcB2gNhdHohEaGEuDAWNFTbZ8KhDBVZhlxJproqdI/1170tn7mcOEu4?=
 =?us-ascii?Q?XkRZz80AJrr2NN9NgsW4P2b6Otc9fOslbsZvcKm9KUwlC4QfphYC8jMjX9Da?=
 =?us-ascii?Q?CbrhhEcgxq1dTsvjz7/au+qzJ1gBzJf0lbWEjHp4BGvVB40Z5IyzDy7vQcQL?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 169a1275-4d12-4d8c-e64b-08dc1eadb850
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:31:05.3214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SNTSGq26KE4n0rG2kI4JQlCJH/h0VPSByklEppLpBcCv/3sCqVRiffSONWd69jd7Tsr+i5EGoR/wRyl4+jBTcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8700
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
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

v2: We cannot do the full-suspend-resume path or we end
with a deadlock between xe_gem_fault and the modeset-ioctl.
Reduce only to the power-well & DC sanitization.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_display.h |  2 ++
 drivers/gpu/drm/xe/xe_pm.c      |  5 +++++
 3 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 74391d9b11ae..3ab23c67c145 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -368,6 +368,28 @@ void xe_display_pm_suspend_late(struct xe_device *xe)
 	intel_display_power_suspend_late(xe);
 }
 
+void xe_display_pm_runtime_suspend(struct xe_device *xe)
+{
+	if (!xe->info.enable_display)
+		return;
+
+	intel_power_domains_disable(xe);
+	intel_opregion_suspend(xe, PCI_D3cold);
+	intel_dmc_suspend(xe);
+	intel_power_domains_suspend(xe, PCI_D3cold);
+}
+
+void xe_display_pm_runtime_resume(struct xe_device *xe)
+{
+	if (!xe->info.enable_display)
+		return;
+
+	intel_power_domains_resume(xe);
+	intel_dmc_resume(xe);
+	intel_opregion_resume(xe);
+	intel_power_domains_enable(xe);
+}
+
 void xe_display_pm_resume_early(struct xe_device *xe)
 {
 	if (!xe->info.enable_display)
diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
index 710e56180b52..cd5a2c4de9de 100644
--- a/drivers/gpu/drm/xe/xe_display.h
+++ b/drivers/gpu/drm/xe/xe_display.h
@@ -38,6 +38,8 @@ void xe_display_pm_suspend(struct xe_device *xe);
 void xe_display_pm_suspend_late(struct xe_device *xe);
 void xe_display_pm_resume_early(struct xe_device *xe);
 void xe_display_pm_resume(struct xe_device *xe);
+void xe_display_pm_runtime_suspend(struct xe_device *xe);
+void xe_display_pm_runtime_resume(struct xe_device *xe);
 
 #else
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 28a4231ddd8a..9910b748adab 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -317,6 +317,9 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	}
 
 	xe_irq_suspend(xe);
+
+	if (xe->d3cold.allowed)
+		xe_display_pm_runtime_suspend(xe);
 out:
 	lock_map_release(&xe_device_mem_access_lockdep_map);
 	xe_pm_write_callback_task(xe, NULL);
@@ -355,6 +358,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 				goto out;
 		}
 
+		xe_display_pm_runtime_resume(xe);
+
 		/*
 		 * This only restores pinned memory which is the memory
 		 * required for the GT(s) to resume.
-- 
2.43.0

