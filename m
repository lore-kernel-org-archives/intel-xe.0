Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE977C05027
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:28:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A189710E08A;
	Fri,  3 Feb 2023 20:28:14 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6CA010E08A
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675456091; x=1706992091;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=1yTmzGTeccB0tTuAnkI07o8EyUjJ9Frg8UsT2+V0BiU=;
 b=OZ6pM7gqUQcjSXUBom/03doumfg58PnQz0OMf2eAaIdnq6TfByKaqAv4
 WyG/FJQiyH8YAHHdomYiw1ssQ0EazaTSQKWyPmNREyYHaWK8sd8qvffD9
 kZUp8uIk9RDj9D+mRC85ubcLTpUbqaINqdGdl3haXoa6fsVsuKVNLGML6
 5iEI8c0/jCQsJclMV3clUF58AKN/coEQPUF5n5lce+h49I2HumnTqBw1C
 iZsv9Jb4vUFz9h3CThxXX7n6NtCmFfrGb0564VMCfFOm+/WCUYv1dd94i
 DH0xJsWOVwSrBK+J8+oVDsuMFV635ghs3cfcIQP1MabX12ZBTmMa4/TPn Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="327484336"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="327484336"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:28:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="774450385"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="774450385"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2023 12:28:07 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:28:06 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:28:06 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:28:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AL7Av6NjhtiJcvwUKdrYUJVRSbwXstKE9H9ueNHRyppK4FW9RZBiFJ0jADQL4Ctmr56AlYN0UyhHC+ufaZ5mjIp1PbC2ii49jLKe1ppTwvECPCbMzmIwO8iboLVeg8ZmxUbgOHEkBjdt5MOtzdFGZzkfmwBSQYT8Ad7OIexclSZd4K0PipihlMRACXbMPfA/AL05zHoq+Ydoxc8gqg8kFeZjRIRbHn0GMb9PkZw4UxtvO8SLQZSt1f6y2rqQDJsGfc+bDCpuahnZtCzhoX1gpTcj6K+vgerOJdQh2ql4fJNVxwjNxx7GqGTBxM82T3i1sCj7hq9Ntygo8/y1iaD3Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hx2c00H7zDSrXdlqxmSJzlXoiJWizH5zuRdEfGO0Seo=;
 b=oOtc8QgemvaImx9RDO5BMkj0OEX5oGCvXzTBe99ETaPX8OH4jwM8cxBC/MDCNsh+OwOa19W15zXVpUIsOSGe8UEwqVaPhzp0PEKoPtZn/MGO9R8cibJWgp0pJY+DT+VTAVpcE9oTdYdtEE4NBSlTXrBMqza0dhPaTjux9tvZ9Ttm/Z1ZWJVJo/SmGY+xGParWkJKO01/Il4BZpWj+UF476LEL6BRAsLN4PwqMcQFbtTPO988bLeAz2ddeZMpB8lNIOC/r7ZkkyxOrOsEVpaz+UpkSXqegJSFnMLTGT+eU3FbT+y3ozQv0rB9JoOxEUoyBP/vcwCMYofCtfRfZnyoXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA0PR11MB7909.namprd11.prod.outlook.com (2603:10b6:208:407::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29; Fri, 3 Feb
 2023 20:28:04 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:28:04 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:27:40 -0500
Message-ID: <20230203202742.577659-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202742.577659-1-rodrigo.vivi@intel.com>
References: <20230203202742.577659-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0136.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA0PR11MB7909:EE_
X-MS-Office365-Filtering-Correlation-Id: 168a5600-bc84-440d-df5d-08db062526c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hoH+m3chWGF/yz1STZWEakd32aXa3eSGISaR2gW5uU2YvQld6YnOrue3M0F1U8SAdi6JMksUGGI2kVCn6E9NwybCAK3qz/pF1sw2M8Don0y2Ty+R6PBhpsMKjO6KXL3qFGorEbXuxjLmmYyd5cWvxY8v1ZhccD59c8JLmyp0Pji6D/mR4H9j4vCpdXMDKBaLwIPrw1D313TffG2aPNS107U5kEE/A4y8xJsHlj1GiLMRbxFXmjHEvjMn6HFg1WWtJV6QiV4NHs5YlCcxUbyLwQAZgoFIitp/VCfwE70Vgo/YM14+MbwTa1aZ/FJdVwtCIEayrWIrwHkFuzim+hZBg9VCM30xUDoDkv3vmfUv1dly71M4/oHeBZvqRJp2fwj6+JiLd4U+h347iYvKUW8U1Awmenc08bpc54Jwmr0gi8KEBHkcfAix4g/CoKkQWaSo1j6ZARgyGRUUv8aNfxHpvC7wTW9U6vnuingLMAFGXuZYa4z64Z1iK2WyC/wzy4/+9rTil128nD7+FZDySSjl0GoMRM8iNh0rgT+iU8tuLr8xPC2a3wfzHQraFxyM3rOlzOMpd5HcTu7bgTL2zBgDhzi6Af06v8U4mUJaae+tlr8V8fY6y93wXpLqmiUp0yuzS7hZVEeJ2Rz4SY7DrhC7K8tAFkV/uw6EqKdDknPeNbslxlqusQb6gGvAg7s2NZrnVgdr6lx+bkX8sRpiQawDPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(39860400002)(346002)(396003)(376002)(451199018)(82960400001)(38100700002)(41300700001)(107886003)(5660300002)(6666004)(6486002)(8676002)(1076003)(316002)(86362001)(54906003)(6506007)(83380400001)(66946007)(66476007)(6916009)(2616005)(66556008)(478600001)(4326008)(30864003)(6512007)(44832011)(8936002)(26005)(2906002)(186003)(36756003)(550224004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXpJWmdyU0hOQ25mLzJqSTNBSk44YzlXdFZLTnppdnJ4eCs1Wi9CTWwzYnVI?=
 =?utf-8?B?c253dzNGWVFTL1FHN2liTU9Zbi9jWnNSOHpGUjlVOVlvMmZBMUp2c1VVSVRH?=
 =?utf-8?B?RkRzZmtEZi9xd3VzWmdaZlI0Q0hyM2ppdE1SVXdBRURyK25IK2RoZXNqYWhR?=
 =?utf-8?B?cmRmS2h5dC9pdmIrR3E0bW5JelFmV3NkQnN0bXUvUVRMa0ExYy9tRnJlRzFF?=
 =?utf-8?B?UU5rUjFuem5ZSzBNeUx0V3UwMmFqU2xjVUZlcy9QQ0VzbnRxWngrUWJlYm1U?=
 =?utf-8?B?RnNlSndjWCt6c1pKdlBna1QvcWhUbnRsRTBjalNLYnBIOHc5VXpFRlRHTVVk?=
 =?utf-8?B?WThQMjl0a1Aydnk2bGRqYS9SS1Y1RHluRFFUMFJTemwycUduMm5pOUgvcGxC?=
 =?utf-8?B?YjN2NmJ6VGtHeVNYYjZCMFA0ZEt5VktFVmxaYi9RUEVmTTRWaVpGQVc5elI3?=
 =?utf-8?B?NXRxSlZLVEQ3OFBMY2hQNHFPbGo3Yk1YNkU2TjMvUVBkcUIrcEQwWlkyYy9J?=
 =?utf-8?B?UHI4OVUvdnoxbjIxbXQrSC9sMmJDZkZOdzI4ZGxPTDZjUWNLUnAzV3dUcGk2?=
 =?utf-8?B?S0VYTVNEanllaWZuVlEyckxBZitVUENjRFJEYUF4RjNxWnR0QVhzL1o2RTBo?=
 =?utf-8?B?VUJGVE05aitBNUEvckFjS0JYYlBuR0tXaU5YVWdCc25aa25uNE9rYmwycG9r?=
 =?utf-8?B?U01UMmdncWlxZEVNV21icHVZaUVraDR5YXpaYmI4K20vcUpyeVNQZE5zNExI?=
 =?utf-8?B?dnZkWmY2bWl0Um02YW1KMTRDTElYOUF0RmxKRnpIUzdYYWhYdVFFcGxWaUdi?=
 =?utf-8?B?QUJVRlM4NFQ4RUExbS9UNWxLY254UzQwcFNibmI1Z2cyblI4ODFnZlN5MWU5?=
 =?utf-8?B?NEJERldpYkVlNzFQWmorSGVESnA3N2VWR0hpb2Z0MFhIdFozV2hpNUVaVG93?=
 =?utf-8?B?STZhMjFTZ3V0Ym9GR2ZENHhGN0hiaWxWcUFoRUJsQW9jQ1VHeEswMVNNZVpT?=
 =?utf-8?B?c3puc28rWThKZlF4SmcrcWNCZjZnMWNmTGdJNUh1cUE2YW1EM1FZRnEzendC?=
 =?utf-8?B?OXF6b1dsd3JqRFZKOTlSaTRwd3ZlNG85VWNnbmp3elZjeUp0WXRDUWpwVHN1?=
 =?utf-8?B?dzk3UERjRHIzSEU4TGI3Zmh5Nk80R2ErenFoeGxMOTRqUmlua1RCc25WdVZP?=
 =?utf-8?B?aS80RkcranJpbGo1bHlSYkMzaFRvaUlTZ0NnbW10NDBpU2tNdWMzT3ZCQXJE?=
 =?utf-8?B?SmE2K0kydU10b0h5ODBWa0ZyTlJpbVJhTEk4ZmJhR0ZWMVBnckowWXRKRFVU?=
 =?utf-8?B?Y292MUZiRktBMGdIaFlKQmZOamlNY0NPVVhOSTY2UFdCSGJQVEo2UStsMWUr?=
 =?utf-8?B?K09qa2JnSEdmM2FEN0RIZVdhQjNLRVRrdW1Kd0NFSStzWDdCYUx3cmFLb2Jt?=
 =?utf-8?B?dStUbnNvM3l1RVdUNDZWS09JZlNpYVZOQmxsZEJ4TXMxUkM1NzNFMXBLbmp3?=
 =?utf-8?B?Y1k5R1pRaWQxZXJOeHpVcjNvMDMwMlJ6bC9GWENTcnROVWR6U21wTHc4TVdw?=
 =?utf-8?B?MWVMVy9Xd2RZVjdMTk0rSVJ3cWFuMEs0N3dML0JiWGg4SXhCb3FvYTJBQ091?=
 =?utf-8?B?OHFhUUZFM0tHaURxVnFhMGNyamNCRS8wUVZYYWNjYzJ6eVNxVExjQUs2SnRm?=
 =?utf-8?B?NFFPekIwdzZoMVRqdTFWNDZsOXRjbmptUzFESzc3VzhJOEdDUFkyQzJqOURm?=
 =?utf-8?B?Mkk4SXZpZDNzOVZ5emtFS1QxUyt2TkI3dWMrVmd4WFJDWk9DZUF1ZTNxYXZw?=
 =?utf-8?B?aHB4VFBDUzBmbVpqNjFmUDE2YVVJZW90b3JyNDVDbVRXRjQrenliQ0kyeHJx?=
 =?utf-8?B?THIxVUh5aEV6TGhwTUVNenZXak1vT2FBcEFiQm5wZkRkY1Z6NUNrbnNFdnQ5?=
 =?utf-8?B?SG56ZUgybDJZdWtPaE5zUTlsazZ1MGFlaFEreHlKalhwTGZrcjVFS2JnNTY3?=
 =?utf-8?B?d0xhZklMQnMxeTVJdHAvc2E0U3Y2Vm9wZnhUaVc1bW9OUGsveGs1U29VL3JT?=
 =?utf-8?B?WlRiSm9IaUhIeTEzaGpKN3ZtZU0xSDl5K3dYRm4vMU00WWsrb2M1SDZNc1dW?=
 =?utf-8?B?QlZXSEdQYW1odjJGR1puZ2VqcVZ3ZUYwc01oaDdOQnc4NFJwRklzQkxWS0tl?=
 =?utf-8?B?SHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 168a5600-bc84-440d-df5d-08db062526c3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:28:04.0590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n3GTlRDUCRJJaE3wYeKQWjYu4FMNMUXjzzGodnxA+JvVvSvVUJuPcA2tmaUrutkcJu6pddL8RuODJvOrdZqABg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7909
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 4/6] drm/xe: move xe device display logic to a
 separate file
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

It is very ugly to read code with lots of ifdefs. Also, it makes
harder when the display part can be disabled in runtime.

So, move all xe_device display-dependent logic to a new
file: xe_display.c, placing the ifdefs inside the corresponding
header file.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Makefile     |   1 +
 drivers/gpu/drm/xe/xe_device.c  | 209 +++-----------------------------
 drivers/gpu/drm/xe/xe_display.c | 190 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_display.h |  59 +++++++++
 4 files changed, 265 insertions(+), 194 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_display.c
 create mode 100644 drivers/gpu/drm/xe/xe_display.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index d36d0b12f6ff..ffaa3795d9dc 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -132,6 +132,7 @@ $(obj)/display/intel_%.o: $(srctree)/drivers/gpu/drm/i915/display/intel_%.c FORC
 
 # Display..
 xe-$(CONFIG_DRM_XE_DISPLAY) += \
+	xe_display.o \
 	display/icl_dsi.o \
 	display/intel_atomic.o \
 	display/intel_atomic_plane.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 60938c2deee2..a028efa8eebe 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -14,6 +14,7 @@
 
 #include "xe_bo.h"
 #include "xe_debugfs.h"
+#include "xe_display.h"
 #include "xe_dma_buf.h"
 #include "xe_drv.h"
 #include "xe_engine.h"
@@ -30,19 +31,6 @@
 #include "xe_vm_madvise.h"
 #include "xe_wait_user_fence.h"
 
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-#include "display/intel_acpi.h"
-#include "display/intel_audio.h"
-#include "display/intel_bw.h"
-#include "display/intel_display.h"
-#include "display/intel_fbdev.h"
-#include "display/intel_hdcp.h"
-#include "display/intel_opregion.h"
-#include "display/ext/i915_irq.h"
-#include "display/ext/intel_dram.h"
-#include "display/ext/intel_pm.h"
-#endif
-
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct xe_file *xef;
@@ -181,16 +169,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	struct xe_device *xe;
 	int err;
 
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	if (enable_display) {
-		/* Detect if we need to wait for other drivers early on */
-		if (intel_modeset_probe_defer(pdev))
-			return ERR_PTR(EPROBE_DEFER);
+	err = xe_display_enable(pdev, &driver);
+	if (err)
+		return ERR_PTR(err);
 
-		driver.driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
-		driver.lastclose = intel_fbdev_restore_mode;
-	}
-#endif
 	err = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver);
 	if (err)
 		return ERR_PTR(err);
@@ -263,150 +245,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	return ERR_PTR(err);
 }
 
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-static void xe_device_fini_display_nommio(struct drm_device *dev, void *dummy)
-{
-	struct xe_device *xe = to_xe_device(dev);
-
-	if (!xe->info.enable_display)
-		return;
-
-	intel_power_domains_cleanup(xe);
-}
-#endif
-
-static int xe_device_init_display_nommio(struct xe_device *xe)
-{
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	int err;
-
-	if (!xe->info.enable_display)
-		return 0;
-
-	/* This must be called before any calls to HAS_PCH_* */
-	intel_detect_pch(xe);
-	intel_display_irq_init(xe);
-
-	err = intel_power_domains_init(xe);
-	if (err)
-		return err;
-
-	intel_init_display_hooks(xe);
-
-	return drmm_add_action_or_reset(&xe->drm, xe_device_fini_display_nommio, xe);
-#else
-	return 0;
-#endif
-}
-
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-static void xe_device_fini_display_noirq(struct drm_device *dev, void *dummy)
-{
-	struct xe_device *xe = to_xe_device(dev);
-
-	if (!xe->info.enable_display)
-		return;
-
-	intel_modeset_driver_remove_noirq(xe);
-	intel_power_domains_driver_remove(xe);
-}
-#endif
-
-static int xe_device_init_display_noirq(struct xe_device *xe)
-{
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	int err;
-
-	if (!xe->info.enable_display)
-		return 0;
-
-	/* Early display init.. */
-	intel_opregion_setup(xe);
-
-	/*
-	 * Fill the dram structure to get the system dram info. This will be
-	 * used for memory latency calculation.
-	 */
-	intel_dram_detect(xe);
-
-	intel_bw_init_hw(xe);
-
-	intel_device_info_runtime_init(xe);
-
-	err = drm_aperture_remove_conflicting_pci_framebuffers(to_pci_dev(xe->drm.dev),
-							       xe->drm.driver);
-	if (err)
-		return err;
-
-	err = intel_modeset_init_noirq(xe);
-	if (err)
-		return err;
-
-	return drmm_add_action_or_reset(&xe->drm, xe_device_fini_display_noirq, NULL);
-#else
-	if (xe->info.display.pipe_mask != 0)
-		drm_warn(&xe->drm, "CONFIG_DRM_XE_DISPLAY is unset, but device is display capable\n");
-	return 0;
-#endif
-}
-
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-static void xe_device_fini_display_noaccel(struct drm_device *dev, void *dummy)
-{
-	struct xe_device *xe = to_xe_device(dev);
-
-	if (!xe->info.enable_display)
-		return;
-
-	intel_modeset_driver_remove_nogem(xe);
-}
-#endif
-
-static int xe_device_init_display_noaccel(struct xe_device *xe)
-{
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	int err;
-
-	if (!xe->info.enable_display)
-		return 0;
-
-	err = intel_modeset_init_nogem(xe);
-	if (err)
-		return err;
-
-	return drmm_add_action_or_reset(&xe->drm, xe_device_fini_display_noaccel, NULL);
-#else
-	return 0;
-#endif
-}
-
-static int xe_device_init_display(struct xe_device *xe)
-{
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	if (!xe->info.enable_display)
-		return 0;
-
-	return intel_modeset_init(xe);
-#else
-	return 0;
-#endif
-}
-
-static void xe_device_unlink_display(struct xe_device *xe)
-{
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	if (!xe->info.enable_display)
-		return;
-
-	/* poll work can call into fbdev, hence clean that up afterwards */
-	intel_hpd_poll_fini(xe);
-	intel_fbdev_fini(xe);
-
-	intel_hdcp_component_fini(xe);
-	intel_audio_deinit(xe);
-#endif
-}
-
 static void xe_device_sanitize(struct drm_device *drm, void *arg)
 {
 	struct xe_device *xe = arg;
@@ -424,7 +262,7 @@ int xe_device_probe(struct xe_device *xe)
 	u8 id;
 
 	xe->info.mem_region_mask = 1;
-	err = xe_device_init_display_nommio(xe);
+	err = xe_display_init_nommio(xe);
 	if (err)
 		return err;
 
@@ -444,7 +282,7 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
-	err = xe_device_init_display_noirq(xe);
+	err = xe_display_init_noirq(xe);
 	if (err)
 		return err;
 
@@ -477,7 +315,7 @@ int xe_device_probe(struct xe_device *xe)
 	 * This is the reason the first allocation needs to be done
 	 * inside display.
 	 */
-	err = xe_device_init_display_noaccel(xe);
+	err = xe_display_init_noaccel(xe);
 	if (err)
 		goto err_irq_shutdown;
 
@@ -487,7 +325,7 @@ int xe_device_probe(struct xe_device *xe)
 			goto err_irq_shutdown;
 	}
 
-	err = xe_device_init_display(xe);
+	err = xe_display_init(xe);
 	if (err)
 		goto err_fini_display;
 
@@ -495,13 +333,7 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_irq_shutdown;
 
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	if (xe->info.enable_display) {
-		intel_display_driver_register(xe);
-		intel_register_dsm_handler();
-		intel_power_domains_enable(xe);
-	}
-#endif
+	xe_display_register(xe);
 
 	xe_debugfs_register(xe);
 
@@ -512,32 +344,21 @@ int xe_device_probe(struct xe_device *xe)
 	return 0;
 
 err_fini_display:
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	if (xe->info.enable_display)
-		intel_modeset_driver_remove(xe);
-#endif
+	xe_display_modset_driver_remove(xe);
+
 err_irq_shutdown:
 	xe_irq_shutdown(xe);
 err:
-	xe_device_unlink_display(xe);
+	xe_display_unlink(xe);
 	return err;
 }
 
 static void xe_device_remove_display(struct xe_device *xe)
 {
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	if (xe->info.enable_display) {
-		intel_unregister_dsm_handler();
-		intel_power_domains_disable(xe);
-		intel_display_driver_unregister(xe);
-	}
-#endif
+	xe_display_unregister(xe);
 
 	drm_dev_unplug(&xe->drm);
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	if (xe->info.enable_display)
-		intel_modeset_driver_remove(xe);
-#endif
+	xe_display_modset_driver_remove(xe);
 }
 
 void xe_device_remove(struct xe_device *xe)
@@ -546,7 +367,7 @@ void xe_device_remove(struct xe_device *xe)
 
 	xe_irq_shutdown(xe);
 
-	xe_device_unlink_display(xe);
+	xe_display_unlink(xe);
 }
 
 void xe_device_shutdown(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
new file mode 100644
index 000000000000..8d83b7c34ad6
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
+
+#include "xe_device.h"
+#include "xe_display.h"
+#include "xe_module.h"
+
+#include <drm/drm_aperture.h>
+#include <drm/drm_managed.h>
+#include <drm/xe_drm.h>
+
+#include "display/intel_acpi.h"
+#include "display/intel_audio.h"
+#include "display/intel_bw.h"
+#include "display/intel_display.h"
+#include "display/intel_fbdev.h"
+#include "display/intel_hdcp.h"
+#include "display/intel_opregion.h"
+#include "display/ext/i915_irq.h"
+#include "display/ext/intel_dram.h"
+#include "display/ext/intel_pm.h"
+
+/* Xe device functions */
+
+int xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver)
+{
+	if (!enable_display)
+		return 0;
+
+	/* Detect if we need to wait for other drivers early on */
+	if (intel_modeset_probe_defer(pdev))
+		return EPROBE_DEFER;
+
+	driver->driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
+	driver->lastclose = intel_fbdev_restore_mode;
+
+	return 0;
+}
+
+void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
+{
+	struct xe_device *xe = to_xe_device(dev);
+
+	if (!xe->info.enable_display)
+		return;
+
+	intel_power_domains_cleanup(xe);
+}
+
+int xe_display_init_nommio(struct xe_device *xe)
+{
+	int err;
+
+	if (!xe->info.enable_display)
+		return 0;
+
+	/* This must be called before any calls to HAS_PCH_* */
+	intel_detect_pch(xe);
+	intel_display_irq_init(xe);
+
+	err = intel_power_domains_init(xe);
+	if (err)
+		return err;
+
+	intel_init_display_hooks(xe);
+
+	return drmm_add_action_or_reset(&xe->drm, xe_display_fini_nommio, xe);
+}
+
+void xe_display_fini_noirq(struct drm_device *dev, void *dummy)
+{
+	struct xe_device *xe = to_xe_device(dev);
+
+	if (!xe->info.enable_display)
+		return;
+
+	intel_modeset_driver_remove_noirq(xe);
+	intel_power_domains_driver_remove(xe);
+}
+
+int xe_display_init_noirq(struct xe_device *xe)
+{
+	int err;
+
+	if (!xe->info.enable_display)
+		return 0;
+
+	/* Early display init.. */
+	intel_opregion_setup(xe);
+
+	/*
+	 * Fill the dram structure to get the system dram info. This will be
+	 * used for memory latency calculation.
+	 */
+	intel_dram_detect(xe);
+
+	intel_bw_init_hw(xe);
+
+	intel_device_info_runtime_init(xe);
+
+	err = drm_aperture_remove_conflicting_pci_framebuffers(to_pci_dev(xe->drm.dev),
+							       xe->drm.driver);
+	if (err)
+		return err;
+
+	err = intel_modeset_init_noirq(xe);
+	if (err)
+		return err;
+
+	return drmm_add_action_or_reset(&xe->drm, xe_display_fini_noirq, NULL);
+}
+
+void xe_display_fini_noaccel(struct drm_device *dev, void *dummy)
+{
+	struct xe_device *xe = to_xe_device(dev);
+
+	if (!xe->info.enable_display)
+		return;
+
+	intel_modeset_driver_remove_nogem(xe);
+}
+
+int xe_display_init_noaccel(struct xe_device *xe)
+{
+	int err;
+
+	if (!xe->info.enable_display)
+		return 0;
+
+	err = intel_modeset_init_nogem(xe);
+	if (err)
+		return err;
+
+	return drmm_add_action_or_reset(&xe->drm, xe_display_fini_noaccel, NULL);
+}
+
+int xe_display_init(struct xe_device *xe)
+{
+	if (!xe->info.enable_display)
+		return 0;
+
+	return intel_modeset_init(xe);
+}
+
+void xe_display_unlink(struct xe_device *xe)
+{
+	if (!xe->info.enable_display)
+		return;
+
+	/* poll work can call into fbdev, hence clean that up afterwards */
+	intel_hpd_poll_fini(xe);
+	intel_fbdev_fini(xe);
+
+	intel_hdcp_component_fini(xe);
+	intel_audio_deinit(xe);
+}
+
+void xe_display_register(struct xe_device *xe)
+{
+	if (!xe->info.enable_display)
+		return;
+
+	intel_display_driver_register(xe);
+	intel_register_dsm_handler();
+	intel_power_domains_enable(xe);
+}
+
+void xe_display_unregister(struct xe_device *xe)
+{
+	if (!xe->info.enable_display)
+		return;
+
+	intel_unregister_dsm_handler();
+	intel_power_domains_disable(xe);
+	intel_display_driver_unregister(xe);
+}
+
+void xe_display_modset_driver_remove(struct xe_device *xe)
+{
+	if (!xe->info.enable_display)
+		return;
+
+	intel_modeset_driver_remove(xe);
+}
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
new file mode 100644
index 000000000000..79aba827b254
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_display.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_DISPLAY_H_
+#define _XE_DISPLAY_H_
+
+#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
+#include <drm/drm_drv.h>
+
+int xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver);
+
+int xe_display_init_nommio(struct xe_device *xe);
+void xe_display_fini_nommio(struct drm_device *dev, void *dummy);
+
+int xe_display_init_noirq(struct xe_device *xe);
+void xe_display_fini_noirq(struct drm_device *dev, void *dummy);
+
+int xe_display_init_noaccel(struct xe_device *xe);
+void xe_display_fini_noaccel(struct drm_device *dev, void *dummy);
+
+int xe_display_init(struct xe_device *xe);
+void xe_display_unlink(struct xe_device *xe);
+
+void xe_display_register(struct xe_device *xe);
+void xe_display_unregister(struct xe_device *xe);
+void xe_display_modset_driver_remove(struct xe_device *xe);
+
+#else
+static inline int
+xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver) { return 0; };
+
+static inline int
+xe_display_init_nommio(struct xe_device *xe) { return 0; };
+static inline void xe_display_fini_nommio(struct drm_device *dev, void *dummy) {};
+
+static inline int xe_display_init_noirq(struct xe_device *xe)
+{
+	if (xe->info.display.pipe_mask != 0)
+		drm_warn(&xe->drm, "CONFIG_DRM_XE_DISPLAY is unset, but device is display capable\n");
+	return 0;
+}
+
+static inline void
+xe_display_fini_noirq(struct drm_device *dev, void *dummy) {};
+
+static inline int xe_display_init_noaccel(struct xe_device *xe) { return 0; };
+static inline void xe_display_fini_noaccel(struct drm_device *dev, void *dummy) {};
+
+static inline int xe_display_init(struct xe_device *xe) { return 0; };
+static inline void xe_display_unlink(struct xe_device *xe) {};
+
+static inline void xe_display_register(struct xe_device *xe) {};
+static inline void xe_display_unregister(struct xe_device *xe) {};
+static inline void xe_display_modset_driver_remove(struct xe_device *xe) {};
+
+#endif /* CONFIG_DRM_XE_DISPLAY */
+#endif /* _XE_DISPLAY_H_ */
-- 
2.39.1

