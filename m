Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8BCEB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 20:22:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA9910E6FE;
	Fri, 21 Jul 2023 20:22:07 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F83C10E6FE
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 20:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689970926; x=1721506926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ndLvMB5knCqpxPIc/3NaD/cupYh4uxuMfhyYZI8dUXo=;
 b=Ri6eewICYu+exrlG/s/ThwKg72PrJ0Ns1NrsrsMIJSi1pcQegdqQ+8yc
 /Fsp1UU/QsdLJ6Sv+rzTGsE6wR1yIu2OkWdRoEEQ8QWICbXkO8igrDrty
 ZTcc1afqq7pcb0WerRf1R7hSEMGPBOhutY+v5+AyUnyWudtnYdAXi+d4l
 9rQt46CYlvSL6tn0VkUvWy4jkvwOt7aFNXqS/9Y/Dz6AW30j9e/U0X8m9
 ZqkSdvq2DMyXli6LW9tXk38/64q1GzQ0XQr8f9y6m/LqGDKILR8c5Ahs6
 BDyuYE7HIDdBT+PPodZ9zwOPAAziHVBpkfQmAYFPMyRSDdR4KHLNZHX2k Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="347403397"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="347403397"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 13:22:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="795074704"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="795074704"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 21 Jul 2023 13:22:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 13:22:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 13:22:05 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 13:22:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqNVZs+ugss+mSO5FtwtwHEDi6wkR2Ycoguu8EP9nPCW9LxsD7o/lhuGtXDrTlU8J3mhxWvOAItYNRicwoNJ0nUvr7bjufCC/oUQ9+zawQz+n6eEJ8amTGOvRcnLB+k+8zG/JnyQ2R7Ln0xrGHh1VIGFHyYJs03cVhg5gJi4u4kp6+3gqZfIr6Kd3mmQMi2GxpfA9tsI3Ec3qvklMIAiuXvdXV5xDT4GEV63KGqm7SL7HTVur4rqQnMmn8HZi7QLPOrEL0NE+lDe6yMU5MHvFMtfT6qnhsCAfPf5QytK4R+2A4jiSuWicAIr3ByrWkomTGLa2KEvcJaqUIhHnksYUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2UHaNYtRL5ETDYYu7SoO2JF430qhxFgpd/RXRHJ5xk=;
 b=SfsmS5xaR8lGACsmCV5Vo0mSLKSJ9navimG6nj0XTCgtqb9NC7/4Gvv1LRPbfl0loeVZYyCROrhjmw4M4xp9SncNJGxv2QkGCpkFOJtiV+nq+2BF82wMfBDAcDwJCJnH9a/DqRySYRL5xxX5nTZU6Hz8h/VhrYt+vb8yFuwCqNtuxAARxChx07EdUUf8JbJmEzdpAByjrJRIKgpVzFGQU1oR3VXooIabR6bsTV7nQrrMz9otlGFPX9m47UQ7gxEPTe8T+mUKtIKMx2Ze5rpeg0dE5DM83Osdoy4S8g8JvZnpyjna9uZnwWX5NGybwpOsvEEXVMLc00eYwUujVtp0dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5233.namprd11.prod.outlook.com (2603:10b6:610:e0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 20:22:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.024; Fri, 21 Jul 2023
 20:22:02 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 21 Jul 2023 16:19:14 -0400
Message-ID: <20230721202144.269837-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721202144.269837-1-rodrigo.vivi@intel.com>
References: <20230721202144.269837-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0034.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::47) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5233:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fcc5397-5c25-4333-0b9f-08db8a2824a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3TZ9or7bLkN3JGctlU6ZczgOqrJJ2pi58EQZmgGavk+2/Z9ief+6MCrTMuDsSXHMEIwZ81SOH5YJt1wUBfvOgPVgfteSBnMADXddFaDSERDlrRxE73x2ZB/+y8icGrB8H/HZISlEpLWKSF5M0Cx953Txu3SLK2XCyeppilS84xx/wLrQjM70PyqETcmyY74UcHH6UF+dp1NKuXE6XcuMfoiWrBpCw+0t8m2MfVZ4WJTD9VmXpiCeBNwkumtUkPdBE5w5vAF58GEAeFZKWcgICpK/4OJDO2dyCBi0KQPlw8eCBLizK3TTBFEj9AU3MGFs0z95Lm7tZo4l5KJbLcltJIyGVYqRhRWsEIamyrOV4VHvUmHJrKd9bUMnC0SXoNZPGdmz5YG0kHyZQPQqqO4hwbEUZ84jo5InHNF/PBdsXQeEV1MiOO3cpA9nqm3K7zxc3BGDPTJERiu5MbCK2Aw739r/na6JNqUTcbrZeO2Xn9KKJ7VmPm3m8OlJ1xZ971oZqvL+S4Dh+H4WHM/+adRI92PPMpHenu2lYr+jB2hL0AlgybNF65hkZUgLjVhyG6Dk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(346002)(39860400002)(376002)(366004)(451199021)(107886003)(6506007)(1076003)(8936002)(186003)(8676002)(26005)(44832011)(41300700001)(83380400001)(2616005)(36756003)(82960400001)(86362001)(5660300002)(38100700002)(478600001)(66556008)(66476007)(66946007)(6666004)(316002)(6512007)(6486002)(4326008)(6916009)(2906002)(30864003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djRrTE80OWR2aER0MG00T0RMUkU2YXAzT05rendTTzlUWU5QL2ZaQkVqbjVC?=
 =?utf-8?B?ckRCanYrWGVZVmF3RG91cE5VZmpFMmE3cWhqd2xGNnFrNVpIcSs1S0s2UmlD?=
 =?utf-8?B?dFBYOUgxMmhWU2wvby9Rd0QramUyTzQvYy9zRHo4RDVnWkg2WEJUZ2RTdUYw?=
 =?utf-8?B?dzliRTFobDcvdVZLdTYxSzcwdVhEeGVPWnVESjJFb2pQbFBPYzJxSEpXL1V0?=
 =?utf-8?B?MldiOUNyTjV5N3pENUpBSHVTcE5hbHQ2d0FZTDNWb1Q3NXZzbEI1eUh6SFFu?=
 =?utf-8?B?WWVzSjJrZTBoTFZZV0VvR0lKN0xQSnpYYldQZiszSmNPVjlyM2dueEQvLzVD?=
 =?utf-8?B?QmJua1U0Y1hQUjBBdkpKU1c0cmJoOWlvdmJ2YWZPa25SRWgrM2l2THE4Mmxa?=
 =?utf-8?B?amF4TXVERzRybDFiYnFqYjlmeEUwK0t3ZUdIK1pPZjdkcXp1K0plYUVMYTZ3?=
 =?utf-8?B?eENlQWpXamwxWE5XWWlNa0J4VzZaaEFrL3llaW9FV2thbWxwOFNwblgxUHhF?=
 =?utf-8?B?MXlzS2FvMldLM2pCRkQxd1dzRWNhSkcya3JtR1JWWUZTcFI3akxPck1LWjY4?=
 =?utf-8?B?U3JoZ3UxSUdVTEg2VTd5ZHRHeHFVOXZPT2xBY0N2cUFLZDgvbEpkN0VXaDNO?=
 =?utf-8?B?TmhvRW5pNnVQelhSQTNBMVZST0FxVHBHcVRqcXhaQlJJMmE0d3MwNlIrTld4?=
 =?utf-8?B?bWI0a09PeXUzNkQvZFB2bXB0OWl4ZlJCVFdWNnUxVjJkZFhxM29XUS9mbVRP?=
 =?utf-8?B?ZGlYT2VRZ0tYR09jVnczWGtkUXBaZVRnQnVmZDREc0NTUC9VWEZZMHZydzA4?=
 =?utf-8?B?enNJRVNuc2poNmRITU5mdUNIeTRaaTBiVDdvZmVtMk5McFQwekMwbTlhUWZX?=
 =?utf-8?B?Yjc1NTlGMXNLdEdLdzlFWEtnSE9lWkswZGtKcWRjS21oSFNpald4Ny83dzJ3?=
 =?utf-8?B?V2VabEwxdnBZTUxvWVU3WXpjRWNNSlB2ZDRWQWRSVTZPdmlFR3JRZzk1ZS83?=
 =?utf-8?B?OGdvdjRKSUV0VEdHZzFBaTg1MTRxcGFqYnk0dDdDQUljc2xDcXgyQzdOSTJI?=
 =?utf-8?B?dW1YMzFQdldGd253ODhWbTZzT2FIY1hjcG9oSHpmZW1zVFc2VGs2M3ljOGZI?=
 =?utf-8?B?bmpYMGorcGpnTGJHbnJSMDBwa3pnSjBQVnNQWFB2cmVidU5GL29naVNhYUY5?=
 =?utf-8?B?K05SOXBiUFdDdWxVR1ZNWlV3Q0NMTnhJOEkwU3o1UUd6Ly9FL3ZpRHN4N0Fp?=
 =?utf-8?B?b0VQT3BFRkk1TGt5MmFhb3pCRUV2OFpORW9kMHpEb3htNE9DMmRoQVRtWnhO?=
 =?utf-8?B?V1lSRkw5WDlYb3M5T04vVjhrNkdHTDM5UXMwVG9KUm1mVzAzVWFzenNvdnRy?=
 =?utf-8?B?N3RmblN4a2ZRUTI0dUNDWFBheDhoclZoZDFVenhsV2FpYWJYdEs4OHlDWTFW?=
 =?utf-8?B?MmlTT3BjRlBtOXpJS0p2cm81a0l5REJqelJrdVVGdjFmRlFibFJpemFZZlZz?=
 =?utf-8?B?SlRiUnRpc1hzRlJoREx3SDZSY3pEblpWWng0ZEZrWjhpbG91RmVXYldBTUdO?=
 =?utf-8?B?WFI5aGREenJ1WWVRSXFNamhpY2Iza3JuR21kVERNYnhrYmw2bEtsZHdLeVV3?=
 =?utf-8?B?TUcvdVJIWHNSZWI3K2J3UkpGa3huL0IxUElTQm01b3ZjMGMxOVhmYlFmUDRO?=
 =?utf-8?B?TFk1QWlBcThxQ3B3RXYvOEJlS2lPTy9BY0hwN29iaVdmakRuYUwrUENtSWN6?=
 =?utf-8?B?NDBib0pHZENKRm41UURkei85N0phU2M2N0thbXMwWTJSeFZ4amk0ZGtRR3dT?=
 =?utf-8?B?aWkzQVhkR1ZvS3RaYnhBUWJtYUQyUXlYcHpVRVVaZklYakorcnR6Yy8yMHI4?=
 =?utf-8?B?R0p2cW4xZStjUDNSZDBWWVBGS05yUndjM29mZng5UDJoZHBCTDRhZWI3RlhR?=
 =?utf-8?B?NGMremdpZHQyaGpkdFJtbkV3STJmUVZaRzJ4eTl0d0pvWkpBK0hRWjRiNmJQ?=
 =?utf-8?B?NFcwSFlCZC9SNWE2Z0JjOGtobjFwS1BPbFJlR2VEQTJJdS9DTnM5eGk3Y3Zr?=
 =?utf-8?B?UHY4TzJNejF3YjVCcmJZem1QRFp5c2lmY1BENm1ZVGlObDdYL0xPMTZpZTd6?=
 =?utf-8?B?RGRDK0RWeVNUV1dJZ3NLSzQ4UThURXpjdlBrYjViVGN0dndNamlaVDVoaDZI?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fcc5397-5c25-4333-0b9f-08db8a2824a9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 20:22:02.4826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1+s2VwKmlXAmW/suApHh8WXCPpdwmsd6Cs75BSFTa3PGBVZUQzTmIOEWR7jwXcM2ECQafR3vin/V/Bwob55eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5233
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 3/3] drm/xe: Kill execlist support.
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

This submission backend is incomplete and unsupported.
It was left there only for some initial bring-up for comparison
and experiments. But most of Xe driver and its features rely
entirely on the GuC submission.

If this code is not entirely broken yet, it is likely just a matter
of time.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Makefile             |   1 -
 drivers/gpu/drm/xe/xe_debugfs.c         |   1 -
 drivers/gpu/drm/xe/xe_device.c          |   1 -
 drivers/gpu/drm/xe/xe_device.h          |   5 -
 drivers/gpu/drm/xe/xe_device_types.h    |   2 -
 drivers/gpu/drm/xe/xe_engine.c          |   5 -
 drivers/gpu/drm/xe/xe_engine_types.h    |   9 +-
 drivers/gpu/drm/xe/xe_execlist.c        | 485 ------------------------
 drivers/gpu/drm/xe/xe_execlist.h        |  21 -
 drivers/gpu/drm/xe/xe_execlist_types.h  |  49 ---
 drivers/gpu/drm/xe/xe_ggtt.c            |   2 +-
 drivers/gpu/drm/xe/xe_gt.c              |  12 -
 drivers/gpu/drm/xe/xe_guc_pc.c          |   2 -
 drivers/gpu/drm/xe/xe_guc_submit.c      |   5 -
 drivers/gpu/drm/xe/xe_hw_engine.c       |  16 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h |   2 -
 drivers/gpu/drm/xe/xe_irq.c             |  11 +-
 drivers/gpu/drm/xe/xe_module.c          |   4 -
 drivers/gpu/drm/xe/xe_module.h          |   1 -
 drivers/gpu/drm/xe/xe_uc.c              |  32 --
 20 files changed, 6 insertions(+), 660 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_execlist.c
 delete mode 100644 drivers/gpu/drm/xe/xe_execlist.h
 delete mode 100644 drivers/gpu/drm/xe/xe_execlist_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 4ea9e3150c20..06d806c8a68d 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -53,7 +53,6 @@ xe-y += xe_bb.o \
 	xe_dma_buf.o \
 	xe_engine.o \
 	xe_exec.o \
-	xe_execlist.o \
 	xe_force_wake.o \
 	xe_ggtt.o \
 	xe_gt.o \
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 491506a1e12e..313b666c1c6e 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -47,7 +47,6 @@ static int info(struct seq_file *m, void *data)
 	drm_printf(&p, "revid %d\n", xe->info.revid);
 	drm_printf(&p, "tile_count %d\n", xe->info.tile_count);
 	drm_printf(&p, "vm_max_level %d\n", xe->info.vm_max_level);
-	drm_printf(&p, "force_execlist %s\n", str_yes_no(xe->info.force_execlist));
 	drm_printf(&p, "supports_usm %s\n", str_yes_no(xe->info.supports_usm));
 	drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe->info.has_flat_ccs));
 	for_each_gt(gt, xe, id) {
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 7221806c1693..7f7198a3dc6d 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -203,7 +203,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	xe->info.devid = pdev->device;
 	xe->info.revid = pdev->revision;
-	xe->info.force_execlist = force_execlist;
 
 	spin_lock_init(&xe->irq.lock);
 
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 0ee44856ad08..327453781f91 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -110,11 +110,6 @@ static inline struct xe_gt *xe_root_mmio_gt(struct xe_device *xe)
 	return xe_device_get_root_tile(xe)->primary_gt;
 }
 
-static inline bool xe_device_guc_submission_enabled(struct xe_device *xe)
-{
-	return !xe->info.force_execlist;
-}
-
 #define for_each_tile(tile__, xe__, id__) \
 	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__)++) \
 		for_each_if((tile__) = &(xe__)->tiles[(id__)])
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index b156f69d7320..0432ef995a03 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -217,8 +217,6 @@ struct xe_device {
 		u8 supports_usm:1;
 		/** @has_asid: Has address space ID */
 		u8 has_asid:1;
-		/** @force_execlist: Forced execlist submission */
-		u8 force_execlist:1;
 		/** @has_flat_ccs: Whether flat CCS metadata is used */
 		u8 has_flat_ccs:1;
 		/** @has_4tile: Whether tile-4 tiling is supported */
diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 59e0a9e085ba..b0218b09ded7 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -460,16 +460,11 @@ static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 				      struct drm_xe_engine_class_instance *eci,
 				      u16 width, u16 num_placements)
 {
-	int len = width * num_placements;
 	int i, j, n;
 	u16 class;
 	u16 gt_id;
 	u32 return_mask = 0, prev_mask;
 
-	if (XE_IOCTL_DBG(xe, !xe_device_guc_submission_enabled(xe) &&
-			 len > 1))
-		return 0;
-
 	for (i = 0; i < width; ++i) {
 		u32 current_mask = 0;
 
diff --git a/drivers/gpu/drm/xe/xe_engine_types.h b/drivers/gpu/drm/xe/xe_engine_types.h
index 36bfaeec23f4..24cabeb4021b 100644
--- a/drivers/gpu/drm/xe/xe_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_engine_types.h
@@ -14,7 +14,6 @@
 #include "xe_hw_fence_types.h"
 #include "xe_lrc_types.h"
 
-struct xe_execlist_engine;
 struct xe_gt;
 struct xe_guc_engine;
 struct xe_hw_engine;
@@ -73,12 +72,8 @@ struct xe_engine {
 		struct list_head multi_gt_link;
 	};
 
-	union {
-		/** @execlist: execlist backend specific state for engine */
-		struct xe_execlist_engine *execlist;
-		/** @guc: GuC backend specific state for engine */
-		struct xe_guc_engine *guc;
-	};
+	/** @guc: GuC backend specific state for engine */
+	struct xe_guc_engine *guc;
 
 	/**
 	 * @persistent: persistent engine state
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
deleted file mode 100644
index 541f82387bb5..000000000000
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ /dev/null
@@ -1,485 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2021 Intel Corporation
- */
-
-#include "xe_execlist.h"
-
-#include <drm/drm_managed.h>
-
-#include "regs/xe_engine_regs.h"
-#include "regs/xe_gpu_commands.h"
-#include "regs/xe_gt_regs.h"
-#include "regs/xe_lrc_layout.h"
-#include "regs/xe_regs.h"
-#include "xe_bo.h"
-#include "xe_device.h"
-#include "xe_engine.h"
-#include "xe_gt.h"
-#include "xe_hw_fence.h"
-#include "xe_lrc.h"
-#include "xe_macros.h"
-#include "xe_mmio.h"
-#include "xe_mocs.h"
-#include "xe_ring_ops_types.h"
-#include "xe_sched_job.h"
-
-#define XE_EXECLIST_HANG_LIMIT 1
-
-#define GEN11_SW_CTX_ID_SHIFT 37
-#define GEN11_SW_CTX_ID_WIDTH 11
-#define XEHP_SW_CTX_ID_SHIFT  39
-#define XEHP_SW_CTX_ID_WIDTH  16
-
-#define GEN11_SW_CTX_ID \
-	GENMASK_ULL(GEN11_SW_CTX_ID_WIDTH + GEN11_SW_CTX_ID_SHIFT - 1, \
-		    GEN11_SW_CTX_ID_SHIFT)
-
-#define XEHP_SW_CTX_ID \
-	GENMASK_ULL(XEHP_SW_CTX_ID_WIDTH + XEHP_SW_CTX_ID_SHIFT - 1, \
-		    XEHP_SW_CTX_ID_SHIFT)
-
-
-static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
-			u32 ctx_id)
-{
-	struct xe_gt *gt = hwe->gt;
-	struct xe_device *xe = gt_to_xe(gt);
-	u64 lrc_desc;
-
-	lrc_desc = xe_lrc_descriptor(lrc);
-
-	if (GRAPHICS_VERx100(xe) >= 1250) {
-		XE_BUG_ON(!FIELD_FIT(XEHP_SW_CTX_ID, ctx_id));
-		lrc_desc |= FIELD_PREP(XEHP_SW_CTX_ID, ctx_id);
-	} else {
-		XE_BUG_ON(!FIELD_FIT(GEN11_SW_CTX_ID, ctx_id));
-		lrc_desc |= FIELD_PREP(GEN11_SW_CTX_ID, ctx_id);
-	}
-
-	if (hwe->class == XE_ENGINE_CLASS_COMPUTE)
-		xe_mmio_write32(hwe->gt, RCU_MODE,
-				_MASKED_BIT_ENABLE(RCU_MODE_CCS_ENABLE));
-
-	xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
-	lrc->ring.old_tail = lrc->ring.tail;
-
-	/*
-	 * Make sure the context image is complete before we submit it to HW.
-	 *
-	 * Ostensibly, writes (including the WCB) should be flushed prior to
-	 * an uncached write such as our mmio register access, the empirical
-	 * evidence (esp. on Braswell) suggests that the WC write into memory
-	 * may not be visible to the HW prior to the completion of the UC
-	 * register write and that we may begin execution from the context
-	 * before its image is complete leading to invalid PD chasing.
-	 */
-	wmb();
-
-	xe_mmio_write32(gt, RING_HWS_PGA(hwe->mmio_base),
-			xe_bo_ggtt_addr(hwe->hwsp));
-	xe_mmio_read32(gt, RING_HWS_PGA(hwe->mmio_base));
-	xe_mmio_write32(gt, RING_MODE(hwe->mmio_base),
-			_MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE));
-
-	xe_mmio_write32(gt, RING_EXECLIST_SQ_CONTENTS_LO(hwe->mmio_base),
-			lower_32_bits(lrc_desc));
-	xe_mmio_write32(gt, RING_EXECLIST_SQ_CONTENTS_HI(hwe->mmio_base),
-			upper_32_bits(lrc_desc));
-	xe_mmio_write32(gt, RING_EXECLIST_CONTROL(hwe->mmio_base),
-			EL_CTRL_LOAD);
-}
-
-static void __xe_execlist_port_start(struct xe_execlist_port *port,
-				     struct xe_execlist_engine *exl)
-{
-	struct xe_device *xe = gt_to_xe(port->hwe->gt);
-	int max_ctx = FIELD_MAX(GEN11_SW_CTX_ID);
-
-	if (GRAPHICS_VERx100(xe) >= 1250)
-		max_ctx = FIELD_MAX(XEHP_SW_CTX_ID);
-
-	xe_execlist_port_assert_held(port);
-
-	if (port->running_exl != exl || !exl->has_run) {
-		port->last_ctx_id++;
-
-		/* 0 is reserved for the kernel context */
-		if (port->last_ctx_id > max_ctx)
-			port->last_ctx_id = 1;
-	}
-
-	__start_lrc(port->hwe, exl->engine->lrc, port->last_ctx_id);
-	port->running_exl = exl;
-	exl->has_run = true;
-}
-
-static void __xe_execlist_port_idle(struct xe_execlist_port *port)
-{
-	u32 noop[2] = { MI_NOOP, MI_NOOP };
-
-	xe_execlist_port_assert_held(port);
-
-	if (!port->running_exl)
-		return;
-
-	xe_lrc_write_ring(&port->hwe->kernel_lrc, noop, sizeof(noop));
-	__start_lrc(port->hwe, &port->hwe->kernel_lrc, 0);
-	port->running_exl = NULL;
-}
-
-static bool xe_execlist_is_idle(struct xe_execlist_engine *exl)
-{
-	struct xe_lrc *lrc = exl->engine->lrc;
-
-	return lrc->ring.tail == lrc->ring.old_tail;
-}
-
-static void __xe_execlist_port_start_next_active(struct xe_execlist_port *port)
-{
-	struct xe_execlist_engine *exl = NULL;
-	int i;
-
-	xe_execlist_port_assert_held(port);
-
-	for (i = ARRAY_SIZE(port->active) - 1; i >= 0; i--) {
-		while (!list_empty(&port->active[i])) {
-			exl = list_first_entry(&port->active[i],
-					       struct xe_execlist_engine,
-					       active_link);
-			list_del(&exl->active_link);
-
-			if (xe_execlist_is_idle(exl)) {
-				exl->active_priority = DRM_SCHED_PRIORITY_UNSET;
-				continue;
-			}
-
-			list_add_tail(&exl->active_link, &port->active[i]);
-			__xe_execlist_port_start(port, exl);
-			return;
-		}
-	}
-
-	__xe_execlist_port_idle(port);
-}
-
-static u64 read_execlist_status(struct xe_hw_engine *hwe)
-{
-	struct xe_gt *gt = hwe->gt;
-	u32 hi, lo;
-
-	lo = xe_mmio_read32(gt, RING_EXECLIST_STATUS_LO(hwe->mmio_base));
-	hi = xe_mmio_read32(gt, RING_EXECLIST_STATUS_HI(hwe->mmio_base));
-
-	return lo | (u64)hi << 32;
-}
-
-static void xe_execlist_port_irq_handler_locked(struct xe_execlist_port *port)
-{
-	u64 status;
-
-	xe_execlist_port_assert_held(port);
-
-	status = read_execlist_status(port->hwe);
-	if (status & BIT(7))
-		return;
-
-	__xe_execlist_port_start_next_active(port);
-}
-
-static void xe_execlist_port_irq_handler(struct xe_hw_engine *hwe,
-					 u16 intr_vec)
-{
-	struct xe_execlist_port *port = hwe->exl_port;
-
-	spin_lock(&port->lock);
-	xe_execlist_port_irq_handler_locked(port);
-	spin_unlock(&port->lock);
-}
-
-static void xe_execlist_port_wake_locked(struct xe_execlist_port *port,
-					 enum drm_sched_priority priority)
-{
-	xe_execlist_port_assert_held(port);
-
-	if (port->running_exl && port->running_exl->active_priority >= priority)
-		return;
-
-	__xe_execlist_port_start_next_active(port);
-}
-
-static void xe_execlist_make_active(struct xe_execlist_engine *exl)
-{
-	struct xe_execlist_port *port = exl->port;
-	enum drm_sched_priority priority = exl->entity.priority;
-
-	XE_BUG_ON(priority == DRM_SCHED_PRIORITY_UNSET);
-	XE_BUG_ON(priority < 0);
-	XE_BUG_ON(priority >= ARRAY_SIZE(exl->port->active));
-
-	spin_lock_irq(&port->lock);
-
-	if (exl->active_priority != priority &&
-	    exl->active_priority != DRM_SCHED_PRIORITY_UNSET) {
-		/* Priority changed, move it to the right list */
-		list_del(&exl->active_link);
-		exl->active_priority = DRM_SCHED_PRIORITY_UNSET;
-	}
-
-	if (exl->active_priority == DRM_SCHED_PRIORITY_UNSET) {
-		exl->active_priority = priority;
-		list_add_tail(&exl->active_link, &port->active[priority]);
-	}
-
-	xe_execlist_port_wake_locked(exl->port, priority);
-
-	spin_unlock_irq(&port->lock);
-}
-
-static void xe_execlist_port_irq_fail_timer(struct timer_list *timer)
-{
-	struct xe_execlist_port *port =
-		container_of(timer, struct xe_execlist_port, irq_fail);
-
-	spin_lock_irq(&port->lock);
-	xe_execlist_port_irq_handler_locked(port);
-	spin_unlock_irq(&port->lock);
-
-	port->irq_fail.expires = jiffies + msecs_to_jiffies(1000);
-	add_timer(&port->irq_fail);
-}
-
-struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
-						 struct xe_hw_engine *hwe)
-{
-	struct drm_device *drm = &xe->drm;
-	struct xe_execlist_port *port;
-	int i;
-
-	port = drmm_kzalloc(drm, sizeof(*port), GFP_KERNEL);
-	if (!port)
-		return ERR_PTR(-ENOMEM);
-
-	port->hwe = hwe;
-
-	spin_lock_init(&port->lock);
-	for (i = 0; i < ARRAY_SIZE(port->active); i++)
-		INIT_LIST_HEAD(&port->active[i]);
-
-	port->last_ctx_id = 1;
-	port->running_exl = NULL;
-
-	hwe->irq_handler = xe_execlist_port_irq_handler;
-
-	/* TODO: Fix the interrupt code so it doesn't race like mad */
-	timer_setup(&port->irq_fail, xe_execlist_port_irq_fail_timer, 0);
-	port->irq_fail.expires = jiffies + msecs_to_jiffies(1000);
-	add_timer(&port->irq_fail);
-
-	return port;
-}
-
-void xe_execlist_port_destroy(struct xe_execlist_port *port)
-{
-	del_timer(&port->irq_fail);
-
-	/* Prevent an interrupt while we're destroying */
-	spin_lock_irq(&gt_to_xe(port->hwe->gt)->irq.lock);
-	port->hwe->irq_handler = NULL;
-	spin_unlock_irq(&gt_to_xe(port->hwe->gt)->irq.lock);
-}
-
-static struct dma_fence *
-execlist_run_job(struct drm_sched_job *drm_job)
-{
-	struct xe_sched_job *job = to_xe_sched_job(drm_job);
-	struct xe_engine *e = job->engine;
-	struct xe_execlist_engine *exl = job->engine->execlist;
-
-	e->ring_ops->emit_job(job);
-	xe_execlist_make_active(exl);
-
-	return dma_fence_get(job->fence);
-}
-
-static void execlist_job_free(struct drm_sched_job *drm_job)
-{
-	struct xe_sched_job *job = to_xe_sched_job(drm_job);
-
-	xe_sched_job_put(job);
-}
-
-static const struct drm_sched_backend_ops drm_sched_ops = {
-	.run_job = execlist_run_job,
-	.free_job = execlist_job_free,
-};
-
-static int execlist_engine_init(struct xe_engine *e)
-{
-	struct drm_gpu_scheduler *sched;
-	struct xe_execlist_engine *exl;
-	struct xe_device *xe = gt_to_xe(e->gt);
-	int err;
-
-	XE_BUG_ON(xe_device_guc_submission_enabled(xe));
-
-	drm_info(&xe->drm, "Enabling execlist submission (GuC submission disabled)\n");
-
-	exl = kzalloc(sizeof(*exl), GFP_KERNEL);
-	if (!exl)
-		return -ENOMEM;
-
-	exl->engine = e;
-
-	err = drm_sched_init(&exl->sched, &drm_sched_ops, NULL,
-			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
-			     XE_SCHED_HANG_LIMIT, XE_SCHED_JOB_TIMEOUT,
-			     NULL, NULL, e->hwe->name,
-			     DRM_SCHED_POLICY_SINGLE_ENTITY,
-			     gt_to_xe(e->gt)->drm.dev);
-	if (err)
-		goto err_free;
-
-	sched = &exl->sched;
-	err = drm_sched_entity_init(&exl->entity, DRM_SCHED_PRIORITY_NORMAL,
-				    &sched, 1, NULL);
-	if (err)
-		goto err_sched;
-
-	exl->port = e->hwe->exl_port;
-	exl->has_run = false;
-	exl->active_priority = DRM_SCHED_PRIORITY_UNSET;
-	e->execlist = exl;
-	e->entity = &exl->entity;
-
-	switch (e->class) {
-	case XE_ENGINE_CLASS_RENDER:
-		sprintf(e->name, "rcs%d", ffs(e->logical_mask) - 1);
-		break;
-	case XE_ENGINE_CLASS_VIDEO_DECODE:
-		sprintf(e->name, "vcs%d", ffs(e->logical_mask) - 1);
-		break;
-	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
-		sprintf(e->name, "vecs%d", ffs(e->logical_mask) - 1);
-		break;
-	case XE_ENGINE_CLASS_COPY:
-		sprintf(e->name, "bcs%d", ffs(e->logical_mask) - 1);
-		break;
-	case XE_ENGINE_CLASS_COMPUTE:
-		sprintf(e->name, "ccs%d", ffs(e->logical_mask) - 1);
-		break;
-	default:
-		XE_WARN_ON(e->class);
-	}
-
-	return 0;
-
-err_sched:
-	drm_sched_fini(&exl->sched);
-err_free:
-	kfree(exl);
-	return err;
-}
-
-static void execlist_engine_fini_async(struct work_struct *w)
-{
-	struct xe_execlist_engine *ee =
-		container_of(w, struct xe_execlist_engine, fini_async);
-	struct xe_engine *e = ee->engine;
-	struct xe_execlist_engine *exl = e->execlist;
-	unsigned long flags;
-
-	XE_BUG_ON(xe_device_guc_submission_enabled(gt_to_xe(e->gt)));
-
-	spin_lock_irqsave(&exl->port->lock, flags);
-	if (WARN_ON(exl->active_priority != DRM_SCHED_PRIORITY_UNSET))
-		list_del(&exl->active_link);
-	spin_unlock_irqrestore(&exl->port->lock, flags);
-
-	if (e->flags & ENGINE_FLAG_PERSISTENT)
-		xe_device_remove_persistent_engines(gt_to_xe(e->gt), e);
-	drm_sched_entity_fini(&exl->entity);
-	drm_sched_fini(&exl->sched);
-	kfree(exl);
-
-	xe_engine_fini(e);
-}
-
-static void execlist_engine_kill(struct xe_engine *e)
-{
-	/* NIY */
-}
-
-static void execlist_engine_fini(struct xe_engine *e)
-{
-	INIT_WORK(&e->execlist->fini_async, execlist_engine_fini_async);
-	queue_work(system_unbound_wq, &e->execlist->fini_async);
-}
-
-static int execlist_engine_set_priority(struct xe_engine *e,
-					enum drm_sched_priority priority)
-{
-	/* NIY */
-	return 0;
-}
-
-static int execlist_engine_set_timeslice(struct xe_engine *e, u32 timeslice_us)
-{
-	/* NIY */
-	return 0;
-}
-
-static int execlist_engine_set_preempt_timeout(struct xe_engine *e,
-					       u32 preempt_timeout_us)
-{
-	/* NIY */
-	return 0;
-}
-
-static int execlist_engine_set_job_timeout(struct xe_engine *e,
-					   u32 job_timeout_ms)
-{
-	/* NIY */
-	return 0;
-}
-
-static int execlist_engine_suspend(struct xe_engine *e)
-{
-	/* NIY */
-	return 0;
-}
-
-static void execlist_engine_suspend_wait(struct xe_engine *e)
-
-{
-	/* NIY */
-}
-
-static void execlist_engine_resume(struct xe_engine *e)
-{
-	/* NIY */
-}
-
-static const struct xe_engine_ops execlist_engine_ops = {
-	.init = execlist_engine_init,
-	.kill = execlist_engine_kill,
-	.fini = execlist_engine_fini,
-	.set_priority = execlist_engine_set_priority,
-	.set_timeslice = execlist_engine_set_timeslice,
-	.set_preempt_timeout = execlist_engine_set_preempt_timeout,
-	.set_job_timeout = execlist_engine_set_job_timeout,
-	.suspend = execlist_engine_suspend,
-	.suspend_wait = execlist_engine_suspend_wait,
-	.resume = execlist_engine_resume,
-};
-
-int xe_execlist_init(struct xe_gt *gt)
-{
-	/* GuC submission enabled, nothing to do */
-	if (xe_device_guc_submission_enabled(gt_to_xe(gt)))
-		return 0;
-
-	gt->engine_ops = &execlist_engine_ops;
-
-	return 0;
-}
diff --git a/drivers/gpu/drm/xe/xe_execlist.h b/drivers/gpu/drm/xe/xe_execlist.h
deleted file mode 100644
index 26f600ac8552..000000000000
--- a/drivers/gpu/drm/xe/xe_execlist.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2021 Intel Corporation
- */
-
-#ifndef _XE_EXECLIST_H_
-#define _XE_EXECLIST_H_
-
-#include "xe_execlist_types.h"
-
-struct xe_device;
-struct xe_gt;
-
-#define xe_execlist_port_assert_held(port) lockdep_assert_held(&(port)->lock)
-
-int xe_execlist_init(struct xe_gt *gt);
-struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
-						 struct xe_hw_engine *hwe);
-void xe_execlist_port_destroy(struct xe_execlist_port *port);
-
-#endif
diff --git a/drivers/gpu/drm/xe/xe_execlist_types.h b/drivers/gpu/drm/xe/xe_execlist_types.h
deleted file mode 100644
index 05a620940209..000000000000
--- a/drivers/gpu/drm/xe/xe_execlist_types.h
+++ /dev/null
@@ -1,49 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2022 Intel Corporation
- */
-
-#ifndef _XE_EXECLIST_TYPES_H_
-#define _XE_EXECLIST_TYPES_H_
-
-#include <linux/list.h>
-#include <linux/spinlock.h>
-#include <linux/workqueue.h>
-
-#include <drm/gpu_scheduler.h>
-
-struct xe_hw_engine;
-struct xe_execlist_engine;
-
-struct xe_execlist_port {
-	struct xe_hw_engine *hwe;
-
-	spinlock_t lock;
-
-	struct list_head active[DRM_SCHED_PRIORITY_COUNT];
-
-	u32 last_ctx_id;
-
-	struct xe_execlist_engine *running_exl;
-
-	struct timer_list irq_fail;
-};
-
-struct xe_execlist_engine {
-	struct xe_engine *engine;
-
-	struct drm_gpu_scheduler sched;
-
-	struct drm_sched_entity entity;
-
-	struct xe_execlist_port *port;
-
-	bool has_run;
-
-	struct work_struct fini_async;
-
-	enum drm_sched_priority active_priority;
-	struct list_head active_link;
-};
-
-#endif
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index e1b84bc25375..01164eb25a10 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -234,7 +234,7 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
 		XE_WARN_ON(seqno <= 0);
 		if (seqno > 0)
 			xe_gt_tlb_invalidation_wait(gt, seqno);
-	} else if (xe_device_guc_submission_enabled(gt_to_xe(gt))) {
+	} else {
 		struct xe_device *xe = gt_to_xe(gt);
 
 		if (xe->info.platform == XE_PVC) {
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3e32d38aeeea..1b54344fe78f 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -14,7 +14,6 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_engine.h"
-#include "xe_execlist.h"
 #include "xe_force_wake.h"
 #include "xe_ggtt.h"
 #include "xe_gt_clock.h"
@@ -355,9 +354,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 		goto err_force_wake;
 
 	xe_mocs_init(gt);
-	err = xe_execlist_init(gt);
-	if (err)
-		goto err_force_wake;
 
 	err = xe_hw_engines_init(gt);
 	if (err)
@@ -504,10 +500,6 @@ static int gt_reset(struct xe_gt *gt)
 {
 	int err;
 
-	/* We only support GT resets with GuC submission */
-	if (!xe_device_guc_submission_enabled(gt_to_xe(gt)))
-		return -ENODEV;
-
 	xe_gt_info(gt, "reset started\n");
 
 	xe_gt_sanitize(gt);
@@ -587,10 +579,6 @@ int xe_gt_suspend(struct xe_gt *gt)
 {
 	int err;
 
-	/* For now suspend/resume is only allowed with GuC */
-	if (!xe_device_guc_submission_enabled(gt_to_xe(gt)))
-		return -ENODEV;
-
 	xe_gt_sanitize(gt);
 
 	xe_device_mem_access_get(gt_to_xe(gt));
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 91a3967fd799..3e442b1619df 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -814,8 +814,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
 	int ret;
 
-	XE_WARN_ON(!xe_device_guc_submission_enabled(xe));
-
 	xe_device_mem_access_get(pc_to_xe(pc));
 
 	memset(pc->bo->vmap.vaddr, 0, size);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 911d4965c27c..390a29b2fa70 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1118,8 +1118,6 @@ static int guc_engine_init(struct xe_engine *e)
 	long timeout;
 	int err;
 
-	XE_BUG_ON(!xe_device_guc_submission_enabled(guc_to_xe(guc)));
-
 	ge = kzalloc(sizeof(*ge), GFP_KERNEL);
 	if (!ge)
 		return -ENOMEM;
@@ -1899,9 +1897,6 @@ void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
 	struct xe_engine *e;
 	unsigned long index;
 
-	if (!xe_device_guc_submission_enabled(guc_to_xe(guc)))
-		return;
-
 	mutex_lock(&guc->submission_state.lock);
 	xa_for_each(&guc->submission_state.engine_lookup, index, e)
 		guc_engine_print(e, p);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 1af5cccd1142..0c7bf79ed767 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -12,7 +12,6 @@
 #include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
-#include "xe_execlist.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_topology.h"
@@ -225,8 +224,6 @@ static void hw_engine_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_hw_engine *hwe = arg;
 
-	if (hwe->exl_port)
-		xe_execlist_port_destroy(hwe->exl_port);
 	xe_lrc_finish(&hwe->kernel_lrc);
 
 	xe_bo_unpin_map_no_vm(hwe->hwsp);
@@ -395,16 +392,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	if (err)
 		goto err_hwsp;
 
-	if (!xe_device_guc_submission_enabled(xe)) {
-		hwe->exl_port = xe_execlist_port_create(xe, hwe);
-		if (IS_ERR(hwe->exl_port)) {
-			err = PTR_ERR(hwe->exl_port);
-			goto err_kernel_lrc;
-		}
-	}
-
-	if (xe_device_guc_submission_enabled(xe))
-		xe_hw_engine_enable_ring(hwe);
+	xe_hw_engine_enable_ring(hwe);
 
 	/* We reserve the highest BCS instance for USM */
 	if (xe->info.supports_usm && hwe->class == XE_ENGINE_CLASS_COPY)
@@ -416,8 +404,6 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 
 	return 0;
 
-err_kernel_lrc:
-	xe_lrc_finish(&hwe->kernel_lrc);
 err_hwsp:
 	xe_bo_unpin_map_no_vm(hwe->hwsp);
 err_name:
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 803d557cf5aa..0ebbe5ae2419 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -99,8 +99,6 @@ struct xe_hw_engine {
 	struct xe_bo *hwsp;
 	/** @kernel_lrc: Kernel LRC (should be replaced /w an xe_engine) */
 	struct xe_lrc kernel_lrc;
-	/** @exl_port: execlists port */
-	struct xe_execlist_port *exl_port;
 	/** @fence_irq: fence IRQ to run when a hw engine IRQ is received */
 	struct xe_hw_fence_irq *fence_irq;
 	/** @irq_handler: IRQ handler to run when hw engine IRQ is received */
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index eae190cb0969..5b00dd9ea31e 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -129,15 +129,8 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 	u32 ccs_mask, bcs_mask;
 	u32 irqs, dmask, smask;
 
-	if (xe_device_guc_submission_enabled(xe)) {
-		irqs = GT_RENDER_USER_INTERRUPT |
-			GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;
-	} else {
-		irqs = GT_RENDER_USER_INTERRUPT |
-		       GT_CS_MASTER_ERROR_INTERRUPT |
-		       GT_CONTEXT_SWITCH_INTERRUPT |
-		       GT_WAIT_SEMAPHORE_INTERRUPT;
-	}
+	irqs = GT_RENDER_USER_INTERRUPT |
+		GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;
 
 	ccs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COMPUTE);
 	bcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY);
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index de85494e2280..81f2379935db 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -14,10 +14,6 @@
 #include "xe_pci.h"
 #include "xe_sched_job.h"
 
-bool force_execlist = false;
-module_param_named_unsafe(force_execlist, force_execlist, bool, 0444);
-MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
-
 bool enable_display = true;
 module_param_named(enable_display, enable_display, bool, 0444);
 MODULE_PARM_DESC(enable_display, "Enable display");
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 2c1f9199f909..33ee4add5e87 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -6,7 +6,6 @@
 #include <linux/types.h>
 
 /* Module modprobe variables */
-extern bool force_execlist;
 extern bool enable_display;
 extern u32 xe_force_vram_bar_size;
 extern int xe_guc_log_level;
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index addd6f2681b9..f27059d96602 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -31,10 +31,6 @@ int xe_uc_init(struct xe_uc *uc)
 {
 	int ret;
 
-	/* GuC submission not enabled, nothing to do */
-	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
-		return 0;
-
 	ret = xe_guc_init(&uc->guc);
 	if (ret)
 		goto err;
@@ -65,10 +61,6 @@ int xe_uc_init(struct xe_uc *uc)
  */
 int xe_uc_init_post_hwconfig(struct xe_uc *uc)
 {
-	/* GuC submission not enabled, nothing to do */
-	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
-		return 0;
-
 	return xe_guc_init_post_hwconfig(&uc->guc);
 }
 
@@ -109,10 +101,6 @@ int xe_uc_init_hwconfig(struct xe_uc *uc)
 {
 	int ret;
 
-	/* GuC submission not enabled, nothing to do */
-	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
-		return 0;
-
 	ret = xe_guc_min_load_for_hwconfig(&uc->guc);
 	if (ret)
 		return ret;
@@ -128,10 +116,6 @@ int xe_uc_init_hw(struct xe_uc *uc)
 {
 	int ret;
 
-	/* GuC submission not enabled, nothing to do */
-	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
-		return 0;
-
 	ret = xe_uc_sanitize_reset(uc);
 	if (ret)
 		return ret;
@@ -169,10 +153,6 @@ int xe_uc_init_hw(struct xe_uc *uc)
 
 int xe_uc_reset_prepare(struct xe_uc *uc)
 {
-	/* GuC submission not enabled, nothing to do */
-	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
-		return 0;
-
 	return xe_guc_reset_prepare(&uc->guc);
 }
 
@@ -188,19 +168,11 @@ void xe_uc_stop_prepare(struct xe_uc *uc)
 
 int xe_uc_stop(struct xe_uc *uc)
 {
-	/* GuC submission not enabled, nothing to do */
-	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
-		return 0;
-
 	return xe_guc_stop(&uc->guc);
 }
 
 int xe_uc_start(struct xe_uc *uc)
 {
-	/* GuC submission not enabled, nothing to do */
-	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
-		return 0;
-
 	return xe_guc_start(&uc->guc);
 }
 
@@ -220,10 +192,6 @@ int xe_uc_suspend(struct xe_uc *uc)
 {
 	int ret;
 
-	/* GuC submission not enabled, nothing to do */
-	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
-		return 0;
-
 	uc_reset_wait(uc);
 
 	ret = xe_uc_stop(uc);
-- 
2.41.0

