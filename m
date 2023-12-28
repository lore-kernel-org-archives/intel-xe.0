Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58B0C4706F
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 02:13:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765F210E23D;
	Thu, 28 Dec 2023 02:13:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA0B10E1D7
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 02:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703729577; x=1735265577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=B7I+VPZHJe25mmcf76SFiiQxNyxAHS/+uMrc7dr6ABo=;
 b=gMTfQ4NX0Z7H+Nj1dJyyg5uuPAgXm51H+Nma2V9NUlSZ/iS+5ZLhWbO+
 0NARrkLmaZU4WUulOxdOC4FbMVjGh8geRCrthpFGUT8bk8m5DJFWW9Q0M
 OUN9Y13Ka8esKIpJxveHla+bqdnSF/9KwbuAY+9scJ0Iun22CvaN7Dogt
 uigclAVBxPbcMacIxLHl3cUv/B59v9HIGZbvFaaXBSOoKNsWqGVZponOW
 fenrcovS/Q1hgcNMTdAt5CdBF34RkaNxH9wY4HoMpgpXNVvIhE/v0x85q
 s/iY1JgFViGckCdXvaxCkEmK3hb+ZkJDwHzVoG0dvkZrflj+vbG96k6x9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="460830245"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="460830245"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 18:12:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="20451615"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 18:12:56 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:12:56 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:12:55 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 18:12:55 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 18:12:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XnKnOWfHYyaeW1TjJXkZWrwwap/TckGQUlfupKFV5oO9kwvyJt81G8sMtQ+t3/GWiU1+btaSjk0xF74E8FRh18IBNAup3m5JheoSXC6mCjo9rE57bl2rskG1Dxiw2NWTaMbHLCTYEq0WUku3TlSfcJHYbCVp1YAHo7Axni/FgsRPGsPTAtrPII5knx0RtCtKOWkemId1+Pkl47AjVasUlMiCyWKaElcib+uSFGIsedD/5AYAOr2oEhHZJC0S+UYVHAhx2u33WMtKSFoW00pmROfIODOdettL3YU/9unCGJtEYn8b8M2YU7l1ccyW+ZsvZy4YSTkHxNhY/HyRN1Ov3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3ShMITLJJHw3f245rsISHji8UYUOVMxstOIq5DSi6o=;
 b=g6h+P/9ACX7Dgb4+MDw9aRb/LBnzCaE7S/pYs0sQlLDYln3U7mOiWUwXopl3cd12EsfowS/E/IpzN/klikU3Myml20g1Qz1FSH6zta+394/sSyIKonE0DmB3l3RNDsMrCDDcd0UAKX1A4V1HR+y45QBR6sLVDJG0KKSay1pZWIpbdVMnIp/UHOci+8nYhsh2dgdhzjwDyI4yRI7BodYm5qEwVj49P6vnAfNhzKqNxF3F/d8WH0QUUt5WRnYJtfkWIdEgCkJE4kTY/so06tIRKxUCRxEw/O/rJR6E04i/t914QHw73zOqC0FzvLyoOolp3Lyiwno5Wyi5ZPQiDvrn2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7146.namprd11.prod.outlook.com (2603:10b6:510:1ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Thu, 28 Dec
 2023 02:12:53 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7113.027; Thu, 28 Dec 2023
 02:12:52 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 04/20] drm/xe: Convert xe_pm_runtime_{get,
 put} to void and protect from recursion
Date: Wed, 27 Dec 2023 21:12:16 -0500
Message-ID: <20231228021232.2366249-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0049.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: dd0fda56-4934-4a4e-4d6b-08dc074a7f53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ktVqQNVXwbkH6wLM4V8RhcKIm6H44X3ENpIEp+IbFIQi5JREQT0VUMONn9RpVzwSk0f0ViViM1eqgY4trF2CNsuv+ZZqUqln1tSYcUQqAaY/WeUKK/bbNmuUh63kWAC0NnN/L/NOdr8ezH+qrnwCPQnf8dZrCF0+x8pFlwayXh4QDMuguHtmc61XtuhyolHsBCO/43+oL7NU2J32rnLqwgEgERqrtFYTW8BmMHRCH+ezGLDF3fgMJpgRwxFRm/kzb2ckxKlFd0R5FCJDWYwhEK60Q88Vb1NL9k9L+aCvH0TW9wHdCgWi6HFj7qGW5bdTHAA9ePXxqqPtXhxFPimZPDs01bF2U+EcB4RTmoc9Qk/A/2KzVDhtjFQTPkt0cIj/yQZpHpWdzH5h/XqxgRhMKitbH94xCgkxMFR5/KEzDF73Qz0T3EEkk0HjMYnPmofmgYQmIoTJ6g2D5zRYgEzAQCzOJIaZcOsCjC+qmKnea5JPHIfxQAZzvNU+t8gAwLJCZSYwYfSykgLpfe8LcDWZuYdXz3YJhxenezQ36ZYrVwUjLhkCkaG0hVJBUDvIn6Ix
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(82960400001)(2906002)(38100700002)(36756003)(86362001)(41300700001)(66556008)(66476007)(316002)(6916009)(83380400001)(66946007)(6506007)(478600001)(6486002)(26005)(2616005)(107886003)(1076003)(6666004)(8676002)(44832011)(8936002)(6512007)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fnxqtDcGi4nRmrHIs3IfN1gzSJl9WzCepSvhaMpye+yqzpHnpmsoV6c3udsE?=
 =?us-ascii?Q?zQPTZdjQX2OtgWvsaK6vF9Tlro2v8xfmY/0xRnnTVVN129VrR4+Bc3BGAzs7?=
 =?us-ascii?Q?D2zznraJCg343SWm/s5wOCeXA57ODG4HdvHoLRCLRuv2Iv7EUXYUW9n6qsXz?=
 =?us-ascii?Q?r1msg8zGlwwN1pfANFxVaA/6NWairegBNd/ZIy0mSmEumZE7SL/w+FV2ORkY?=
 =?us-ascii?Q?WcDC4Jt4Ska/rMa2lh4VJXwKM1OByrejXE3slyyrggAq7cA+5o6vXBsPZJW4?=
 =?us-ascii?Q?NX2kQljKltj9az+6d7levUMmjv7jBpByDk7oRFn0sjPx6IkwFH4ttI1hN47q?=
 =?us-ascii?Q?J/i0u5BaxhA8hZtbnKoCzta+J1YjO3XCTNcXiqwmKRCcK4NiBrzo06srcrM8?=
 =?us-ascii?Q?zTbHI0WHZuxxcKvcN4IRYL2JTqhG+2/wng8vlID4tQNeUB9fwky/skP6ae8F?=
 =?us-ascii?Q?Tp2DzIFF/Qj9jT+Hf168bIp9/ehHXelF4QHJTiJqo8tb/twG7OMO7t9N/2Q0?=
 =?us-ascii?Q?mT3WzZUBzLhMScaShjkoygeWNpjnjiqsikRQpfpqyOZPOfud/filjIU0rdA8?=
 =?us-ascii?Q?hn+JSEWOTZ5m+zSrkCLPAr9a8gXh8Xk5wwNSmhtqB1B4NkBrpVoiEJRNnPcj?=
 =?us-ascii?Q?HN6qED0Rk9PFDqCJ92vLEIXoF3Wai1bMf/FfjyZnrrgjLx3EQ9TwBQpaT4Wn?=
 =?us-ascii?Q?BYHjnlhWucrdkgzeVgVajKfu571WgvbhhT65gzjDHTouMW/mnkwek/1gKw4m?=
 =?us-ascii?Q?bH8hiATyQ/FaXmxEEwmz4GLf5K7hzc+6p6Gmy3wgOapYnBzDuzDfvi7z0PEh?=
 =?us-ascii?Q?P4ctcB4z/Y8HjSpMbbIjhInMO0rmQDxqXZL6LbpEUkyu7iMgYTjhuUBm5kym?=
 =?us-ascii?Q?10pkrgg6yBvbQkoqxPbzvbUxUnl7WQ9bhf8Q2jLeMHmZTv9sWQhZDaVFEfIF?=
 =?us-ascii?Q?7Trz/gJhzb+CyrlS3XPk2QB5wuMxdPQPBoaQaaJ+D31w3u5GfrzTQ1dofDw6?=
 =?us-ascii?Q?4fiVz/JeNzcXrL7lK2o1pZouAZ1bHO44MQpNgFzFsFn4CTtjsH7l1Kb8sz9X?=
 =?us-ascii?Q?6tzVYagguxJiM9rZrzmhIBiCghCSbhIJfKXunj0sntFoVtAlh61ohFJHCg21?=
 =?us-ascii?Q?4EpxDJJiH+eOaWPdhbKJIyYp4vzxNgcnHf7H2xsi+APksFj+u2Ec5184/4mO?=
 =?us-ascii?Q?YeIsdy+b9BlWf9yXNPAgBlrk8dsZXXfNSYJDrg7j7sylA/0O1kVKxRRDKIpj?=
 =?us-ascii?Q?9ls5voRJGN2Jm+2L3oO+KxWafVFe6RZ8J6aQXJvbQoxELj+63t3L4S4Qkvam?=
 =?us-ascii?Q?SQHNp5NzXxc1g3fhaJ+Rs8e8Qez8d9cAAkXRMPkg2PM3hHLFaI19WAzEI7qU?=
 =?us-ascii?Q?GvLCvr7MQ9+9UhbNfo3tUxpQngG7cJYpV+EQMXsS4W5obyXRVOs8f3ag4XkR?=
 =?us-ascii?Q?Hua3dgYTUrdQt1G51qNqL9NbY07BrbBEnhg3oUdV57iCa8qfhhNVua6ObQLx?=
 =?us-ascii?Q?TLr0bSwXNY0nFaBSEJh6nH4JlUmVYc8VD2DbnCXFxYAjqdjid0qmF2CMoaSu?=
 =?us-ascii?Q?kdV5F2zdIlB5SPTY9h4c4akUcIF5Fnweb8zWNKo1U9ulREqwZI6QjshdNwZZ?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd0fda56-4934-4a4e-4d6b-08dc074a7f53
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 02:12:52.6670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ThCKsgFQrgv+mfZYUDQ9kJi/3o5FXIIcJdn7Ec2YqhYn3NRm6L2X+TMseULC0KZXKJlE58/RHbUBXr8J1/Ivsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7146
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

With mem_access will go away and pm_runtime calls will be called instead.
So, we need to protect these against recursions.

For D3cold, the TTM migration helpers will call for the job execution.
Jobs execution will be protected by direct runtime_pm calls, but they
cannot be called again if we are already at a runtime suspend/resume
transaction when evicting/restoring memory for D3Cold. So, we will check
for the xe_pm_read_callback_task.

The put is asynchronous so there's no need to block it. However, for a
proper balance, we need to ensure that the references are taken and
restored regardless of the flow. So, let's convert them all to void and
use some direct linux/pm_runtime functions.

Cases that need to check for the references or runtime status will
be handled separate from these main get and put functions here.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 19 +++++++++----------
 drivers/gpu/drm/xe/xe_pm.h |  4 ++--
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 32db9068ac169..bd5ca41e19c5e 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -366,26 +366,25 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 /**
  * xe_pm_runtime_get - Get a runtime_pm reference and resume synchronously
  * @xe: xe device instance
- *
- * Returns: Any number grater than or equal to 0 for success, negative error
- * code otherwise.
  */
-int xe_pm_runtime_get(struct xe_device *xe)
+void xe_pm_runtime_get(struct xe_device *xe)
 {
-	return pm_runtime_get_sync(xe->drm.dev);
+	pm_runtime_get_noresume(xe->drm.dev);
+
+	if (xe_pm_read_callback_task(xe) == current)
+                return;
+
+	pm_runtime_resume(xe->drm.dev);
 }
 
 /**
  * xe_pm_runtime_put - Put the runtime_pm reference back and mark as idle
  * @xe: xe device instance
- *
- * Returns: Any number grater than or equal to 0 for success, negative error
- * code otherwise.
  */
-int xe_pm_runtime_put(struct xe_device *xe)
+void xe_pm_runtime_put(struct xe_device *xe)
 {
 	pm_runtime_mark_last_busy(xe->drm.dev);
-	return pm_runtime_put(xe->drm.dev);
+	pm_runtime_put(xe->drm.dev);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index b812281635673..069f41c61505b 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -24,8 +24,8 @@ void xe_pm_init(struct xe_device *xe);
 void xe_pm_runtime_fini(struct xe_device *xe);
 int xe_pm_runtime_suspend(struct xe_device *xe);
 int xe_pm_runtime_resume(struct xe_device *xe);
-int xe_pm_runtime_get(struct xe_device *xe);
-int xe_pm_runtime_put(struct xe_device *xe);
+void xe_pm_runtime_get(struct xe_device *xe);
+void xe_pm_runtime_put(struct xe_device *xe);
 int xe_pm_runtime_get_if_active(struct xe_device *xe);
 bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
 bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
-- 
2.43.0

