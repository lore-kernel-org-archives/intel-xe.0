Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45117C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:17:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F5F10E5E2;
	Wed, 29 Nov 2023 01:17:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468ED10E5E4
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 01:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701220667; x=1732756667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wGvSpIuSMFxxBDuOou3C0GKTj6uVwm7bsrUT7oIAxnI=;
 b=K2i7huOqDbTpruSajymXEnb8TpkO2IPydB5UhDNxBEp9humkvPysKKSS
 IofWR8hqXz1PAiE2Hh/Ls0pDglMzPuVpUnX3TeGc4BiBp25KILOqtEhRr
 N9el7v1ocpHjPmN1fdOKQaLdgmDja5nr8NJIiXMm3GH5ygxNOlaLIcWlu
 mkAILNsDGlHoSaqKjIN8W7woNQcVXn3Mb8eBZ5gBOBHGX0XcJ/aCjKohm
 UhqfWBINWKmM8dFaVWJomcrR1zdfM5QT4Fpvz+LxdLXTmRjXYuGzF7gPy
 mTtBtAczbnUwruH905NdUJk39p1UQir02XmTx4x9L9oK0uiKak6/gZbL5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372436677"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="372436677"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:17:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="892272841"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="892272841"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 17:17:46 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:45 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 17:17:45 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X708+Chs7xifs9wxxV0ogYWAVI6xeOpXxaQFtl3ELzzreoH1q5DPlU6wI9Kv4zYGkmJoP1b5hNTUKOJuB5FygzUOcY/nkDxYf57GoI9hKErURv+Wa8pmq79T0QqnkC3vo9wti6xP8F5HTmNKONKFyvVhK6FCTC6YaiGRSreFMZ4ghNwFTSZbhVWGyxgG2k+F3IcAG8YaupCG6aZM/zSZJeGTKBDQfzS1QZek14I2mF5/v5EJSscq5ITHt6yRyH/BmZXrNDoKQ7ybyKbGpDs1OJ+xeSk/d/qlfz4L+o/vH8ifh2PjMAiqGWmArTZSCPS76EoeROR71U+mDcvrga54uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2VsqH3uivmiWejTWWposKeKzA52iLolJoZ0YGCzB0w=;
 b=T4vMoIJNdU8MAD7MadvcEIiMcozdxHLGi43XMOwxzj5jJeVEXUsQFAGtleUbq79ZpKSFojHvlKQx9x5KDFWbs9rOV13eMv8M9bblDhboR538JEvsbmWuPrgDemDjQlMzkgkE4diACex9B19Mfu6VxWQ89UrB45PUpCmnRrDDDsyiEvobmaBLRjRyzXfgxkHnSOzSUzzHA0MyNEEmrBpLi5AFtLfO+5cZghRQ/6qud6sL8xxaFGMtizVPgn7lN7HK0pJKTSqa+JbCgej9RlBcHGOJl75h2gbLSXCb/jwk6DE9GFfcojdgdtYN5Dg/Xn6UIfZ8ZZuDTSk0LThVEq9l5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB7992.namprd11.prod.outlook.com (2603:10b6:510:25b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 01:17:43 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 01:17:43 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 02:16:21 +0100
Message-ID: <20231129011624.836843-20-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129011624.836843-1-michal.winiarski@intel.com>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0025.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::38) To BL1PR11MB5365.namprd11.prod.outlook.com
 (2603:10b6:208:308::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: b16589eb-a74e-4fee-f4c4-08dbf078fcaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j4tnOn9soigbgb+MxAUMWW1UvA43tclQKMAvRFMCTWIL5qHI3Guk8q+gjv9ryCOBAF9vjDjEGQ4t5RNzDKTzBTIUtbJipV2fc0oV4JaQ6rUYNZphumNWxSqYxd2Yu2KNwF+wHVSMMN09rLFQ6nEvv63Vni5l1gW/w8/U6uzQ6V2K6P1AHyJHda/+jMc1vLQBlh/eDF78/Cks7BZNLFLxz2rsnJb+PZmY8uwpbcUI3XbH5UC93zeRz+CEfLXPWBCsoc/n7Fxli339zDLrCSuK/fWHw04umwbqDHYveXcrWlBoijIUW/hKYgxqYkbEBaIiph4xcRo8eYC2kHTeTTTIrTRBFlWArFbXyztQ7GCU6JESBVq2IR5Tvm0sYUHtWfaQGMgDaUwfJHCEOEoN3HYErwbPZnpuE0ev/KH31kN4okoVYGbsiztEa5L3R4Z9rkOO8vOZsBeU7ZqWPvxz5iAsNaK+0NXheKgGOU/lCUoqpJcgzFewdzsVBZiNr+klJE4fDxVWcGcrld7haeznbvdLYVnUMeHvWQ1/FrqDwupOfnXhsr2N2VcGoffvVj09s7KU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6666004)(8936002)(4326008)(8676002)(6512007)(6506007)(54906003)(66556008)(66946007)(66476007)(6916009)(316002)(478600001)(6486002)(41300700001)(38100700002)(86362001)(1076003)(36756003)(2906002)(26005)(2616005)(83380400001)(82960400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVFDNzVLZHFxWVVtaUpaZStZbUxWYXZwSVc5ZExrWk1ieUdlM2RCdGtzMWdR?=
 =?utf-8?B?QWE5T3JtNUhMdHdJdVRGTGxxeHVyYms5Mkh0WFlXVWVXNGM0OUpOVFo2Mk9X?=
 =?utf-8?B?ZTVOQUtBNDhER3NKbEJraWhHNjI3THpzV0pxM2ExQnQwN3BxZWx0NTB6c0JG?=
 =?utf-8?B?Q081SGpRRHdGcjQ1RjJMNlJmTllWQUxsZXVhSVdRNElsQnhyamdVRXlEMVBj?=
 =?utf-8?B?QTN5Q2hFTncrWUpybXpJUUUwL0RBQldodU82dEhwRFMzTnpNVG9xcFNGbjdr?=
 =?utf-8?B?QWV2M3RWZjBMSG43YjYvc1FkWWJDTGxVMHlXc2VBaWhieGpyaUhqNkJKUXVq?=
 =?utf-8?B?STg2Mk1jZHdPSWJUc2pxSU5oMDhLWWlqbGQvV05CTTFqSjN2RHBmYUkyM2sy?=
 =?utf-8?B?T05xMGVTNzd5dVRreklhbFRER3F5ZXNzZXhpeGt6c1A4SHlybnVEcDFDcTZk?=
 =?utf-8?B?NEdYYkZkMkw4Vkc1ekZ6dVJRYTJ4MDBJcEhKcVp2dHQ4MFp4Kzg3MHRZa28r?=
 =?utf-8?B?MFFORGZJTFVLTlR1Y2NiT2ZjR05DK2VqR3p3UlZTQUh4aDhHaENtZy92ZFE5?=
 =?utf-8?B?QlhYeEFVMzE3NVM1TEJlZkc0UGRYQkhIYStoLzQ4RnlaZWIvZTc4Q1BzQWp1?=
 =?utf-8?B?UFNya21TdUtrZWIrM0pQMU96dU1JWmhwdHo4UXUvS004bWlMSVVvdDRzYThr?=
 =?utf-8?B?UlNVQW1hcHl1aWoxRTl5NllNUG9NaTk5VHdTZzJFMVc5TFRBNEhyRVd2Zktl?=
 =?utf-8?B?Wk96ZVNsNlNVbXFJTWpwNnQyMlgvS0NIbkV2djZCanR2UGlKTjR2bG84VEdn?=
 =?utf-8?B?UTNnQXcvU2RCbmNHQmJHQ1k3anhHL0xSNERYSTNDUUV0eU1rL2NjYnF1KzZG?=
 =?utf-8?B?eEprUWZBNWhSYk1VekxPZ3c5Y2taaFpJOHF0UEZqTXBCeG9nV1djUWUrQWxG?=
 =?utf-8?B?Y0pCeGY4TVZuVlRWN3JBckoyZzJVS1dJZFF2VDhoYnJmaVFxVVFrTUpFVVpV?=
 =?utf-8?B?ZHBpQXN4dnMrMDIwNUozbUlSNjhCTFdHQXArQ2tPZFc2Nm5CSVNpR05KTGFR?=
 =?utf-8?B?YUhmenVENWM0V1BlVVYxdHdCdDYxSWlibTNBaDgrdzRrSllURFdQNk1aeFRi?=
 =?utf-8?B?V3NrenNNY1R5RWQ1aGpXL0dFRWFRMXpLeTErWDYxNzVaS2lOOVR5UnVlSjZa?=
 =?utf-8?B?N1ZLT1hXUXVVQlZEbjBKYVJIdzhTdUtBTGd3Tzd3aUR0M25yd2kySkFRQUdm?=
 =?utf-8?B?WW1oWW9ldXVyNmNkenVyb3lmMlJ2akpOTWIwRXpNNkwyMkVXbStLZ1BxSFFz?=
 =?utf-8?B?clZKT084NDdrYURHTE14cmdmQlBHQ1RIYmtiazAxVjNZQlUva2FDR09lYW9v?=
 =?utf-8?B?SThlbnkvaWl3VzRVUmN0QmxrVXRLUTdCL2JrOFd0ZmhxOUpmbktBQU5ZNUp4?=
 =?utf-8?B?eng4Y2h5bzg1Ylg3eGdQQ3FITENzbWU2cXRvNGl1TGY1UU50NGlwWFg5MDgv?=
 =?utf-8?B?TTBDU3ZFeEc1SmIwQU5HeWs2VkZSbFZHdWhNbFppa1dnUVNvenA4ekxqRWVu?=
 =?utf-8?B?ZGg0MVZ5VEZOU213b3NMVU9oWDVqNlhySEpSOGY5MGtXcndXREpFb1daamZH?=
 =?utf-8?B?WGw5cUxBdFJOa2d0dzZzdGFYRHlxWXJPMEJJeitzMGFxajExK0xDTThJcmo0?=
 =?utf-8?B?QWdMMmtZZkFycVJiUjF0WUE2UWk1eGNMQ0Q3QjFlWTZQVWIvNFdYWG9LYlov?=
 =?utf-8?B?OC9IR0d3SXd2bWxYYm1CNHFSMTU1SFdhbkNDNGU3aFVIS0hiWklmMFpUNEF1?=
 =?utf-8?B?dmhLeVBJSG0vdzVEOTNTcHNNQjJpeTJ0WkZsSHpQS0hudUN6YlRaWXk2REJ6?=
 =?utf-8?B?a2Y5ODBma0RIdGxRUk1EcFg3Z0l6eU5LN3YwOVpUOE82MVlSNTZCMGVHZVQv?=
 =?utf-8?B?MjJ2YXJjVVMvQzRXZ01remdxaTI1SXMrYW9lU25NYXVvdUVjSXROTXA2ck9S?=
 =?utf-8?B?QWtRNk1xZFMwV0RXUitKRmFseUFvVXRvQ2hvQVF0SFE2VXhMODY0ZnB2Nnlz?=
 =?utf-8?B?UFlDWDZ6eVcwTXFJL1BZTFRlaWlFelFSV0xrNHZENzdXS0hqVEJRRldtWG5S?=
 =?utf-8?B?VkNNbno3Y2QrNnJCeXB5WHpNcFN5a3Jzd0hndVpENkVhbUlPRGh0UGgxVlJJ?=
 =?utf-8?B?cXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b16589eb-a74e-4fee-f4c4-08dbf078fcaf
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5365.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 01:17:43.3701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LIvEIW7LwddDL9UElAeje7KaDze/4K0rOIqxU608H83EJoKSOIE/O27AdGFK1tXlZboF7LaJzq9TxPqQNK/KylO2Q5d7T989b1LAHSmTJDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7992
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 19/22] drm/managed: Add drmm_release_action
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Similar to devres equivalent, it allows to call the "release" action
directly and remove the resource from the managed resources list.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/drm_managed.c | 28 ++++++++++++++++++++++++++++
 include/drm/drm_managed.h     |  4 ++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index bcd111404b128..f819940b8a959 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -176,6 +176,34 @@ int __drmm_add_action_or_reset(struct drm_device *dev,
 }
 EXPORT_SYMBOL(__drmm_add_action_or_reset);
 
+void drmm_release_action(struct drm_device *dev,
+			 drmres_release_t action,
+			 void *data)
+{
+	struct drmres *dr_match = NULL, *dr;
+	unsigned long flags;
+
+	spin_lock_irqsave(&dev->managed.lock, flags);
+	list_for_each_entry_reverse(dr, &dev->managed.resources, node.entry) {
+		if (dr->node.release == action) {
+			if (!data || (data && *(void **)dr->data == data)) {
+				dr_match = dr;
+				del_dr(dev, dr_match);
+				break;
+			}
+		}
+	}
+	spin_unlock_irqrestore(&dev->managed.lock, flags);
+
+	if (WARN_ON(!dr_match))
+		return;
+
+	action(dev, data);
+
+	free_dr(dr_match);
+}
+EXPORT_SYMBOL(drmm_release_action);
+
 /**
  * drmm_kmalloc - &drm_device managed kmalloc()
  * @dev: DRM device
diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
index ad08f834af408..f547b09ca0239 100644
--- a/include/drm/drm_managed.h
+++ b/include/drm/drm_managed.h
@@ -45,6 +45,10 @@ int __must_check __drmm_add_action_or_reset(struct drm_device *dev,
 					    drmres_release_t action,
 					    void *data, const char *name);
 
+void drmm_release_action(struct drm_device *dev,
+			 drmres_release_t action,
+			 void *data);
+
 void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp) __malloc;
 
 /**
-- 
2.43.0

