Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FC5C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 21:47:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C9610E681;
	Wed, 29 Nov 2023 21:47:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E6810E688
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 21:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701294424; x=1732830424;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=e+Ja7agJ9R10Ky5IxWBZhaLkrvnEAVBBu5eU8klQ3/o=;
 b=LFqYXMsbfI3Ml4K9SRyJu/MlcRQLvs1mcweu2UvHDTtFIdhvqcSr997u
 9SgGhHfUV+V3dLKrgfJKiJ1LxvQDCkxyjPzZIVGi8kA/UPPWdrdbNAXwx
 HR0x0aVpKK9vQkl9LZzRNxYGdR0P3MK8GSwdfYBIhesspbb5N5zQWx6gd
 tT5Zp5L8KEUwYjfT63K7BJLrXmdFzYOZNKR1UDkl5MFmNHPFb1tQ8UXhG
 6xSj3qibPi60P0Aw/ED9VIR0Tf2AqNIM1BsuUMOlogqHF8HyXpYnb0g4l
 C8rFHTiz4YtgCw40xgf4yvM7Ro/BgyvZv7O7cwmNUxbdNz6xW9VF8UZjC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="392975251"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="392975251"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 13:47:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="1100680130"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="1100680130"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 13:47:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 13:47:03 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 13:47:02 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 13:47:02 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 13:47:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S89ZvIG3Nwm4pnq7zT9bjLsx+qiOnsn6spfRgzEO0oxck1es5jEW+y42MYhZQg82m2BwRYrSj9/QeTdvyq9L51T+YtML5hURCD0TKlqKiLfECt1HMQLUh334c5762hdIeN9M095HkKFBx9Kn/pUlFuZYHhAVzrOzAoWsLH/juVdwUgQG+fvyVzfukWuqvvABLh6ng3wYOpesxdXJPJonrw2fUe40DVRLaUYgBlRjjSoXxsV5wTiUnKMy1JG6mNewt1enfNnfhJRjdW5Av+CDTpHxmnOhB0W0uP8Md36b113eiD7cIH2Q99AITSTNM8A9kTFX9riTS+lR+kUkDNFpqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6DHBv6fsJGrcTMW3XyfSrwB56qXWA8zhhrMbCbXacA=;
 b=H5QZR7MfpuCiYsImoXjcR/OufBL8EBbW96FXh+3oimYoECzLQAQEKiAlqMkWsaVZOeJqIliXxH+LoDNx5hics37nAcaZUKAPdKGNMbLsYjm1lUJ6q1aWDBqMOI/Mc2CbMx588FM9k/sIkCXffjjkNhS0wcxQhGMAnncGluPK7ux8Ed4sYQogO7kZK29Os4wx1gmi/55vefzVIW8MJt0AzG3HTdfBm9KtRZ/kmpEdRdA8MWqaohbq3IiBclhwnrVAcn5ZWuKHhwiqiRZpOkk7aoOtQnZAv/cRqp9r8dxCMlGkydlBjMu/Y18l2Lww2SHBbk0/nx7fX98ZQ3TTfJecCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4930.namprd11.prod.outlook.com (2603:10b6:303:9b::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.28; Wed, 29 Nov 2023 21:47:00 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 21:47:00 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 22:45:02 +0100
Message-ID: <20231129214509.1174116-7-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129214509.1174116-1-michal.winiarski@intel.com>
References: <20231129214509.1174116-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4930:EE_
X-MS-Office365-Filtering-Correlation-Id: 53a7ca6c-8274-4612-8d6c-08dbf124b799
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KPTAULbBdtYhEDnQFs0pJxuoSNt9okmfyCGZxQImte9t9wgAF3IIWUOifqnCETsJAv6nOWKEJL/8ijx04GHBHzuDpSmJHCrDgf9upmJB92PH1aLBq8LtK6QOCZe5eF7DJxsA8JSQHIBbUA+9EuShsnVN1ehIgSq741Xi0KAfpboTLdu6Epp3sxy1La8rmLk+rSNO5Vr29DCeNTGOQJBOx0R4Wszlm6gMCmr36Nj7ZP5EJZFv6LAO1pbw7YL3Frr1y6JVsJJvd4XknJh5J96oRiwKFBhtKWdVrMmhhDnTJcN4vfOz+uUq67QsHq0VOrgKXesb+aaeKfkxun7qWF2gzysgp4XX/e7ohe9WRFu3IXqFI3JnYP8g50WLLwCSISoInnToUyZdKVZoms0IcGqXCiRWzuv6xIVUQDMa9bwcl+iE7G67CTKSU7xjaW82PMKbhFyeg9hK40l749yLp/N2gjMzctVA1mw62MwfB2nbr3SoFwYfp55XS8GFNMPKTRa5QcxNmHQnCEPqm1RGd7S7NERBH+JGj1Hapbu3tFBcTwidocvCldGSxJG9r1bdOi63C9APoGctltYHatvn6HZfZqe7G5NP6+/fAsOlEG4I8h0vLNYGPrt5CqW896271PeQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(136003)(366004)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(8676002)(8936002)(4326008)(6512007)(66476007)(66946007)(66556008)(54906003)(316002)(6916009)(66899024)(478600001)(6486002)(2906002)(26005)(41300700001)(36756003)(38100700002)(107886003)(86362001)(6506007)(202311291699003)(1076003)(2616005)(83380400001)(82960400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0JuOUdPczZBV3NhS2J6LzJuTEg0TWFrY0V2UHNsYzNIajY3TGYwTXlJdUlV?=
 =?utf-8?B?dTlCZnBnNlRYd0FmRjhOSm9nay8xN2NMK1Iyei82c0lsUFpiQkg5ZDBXSUVS?=
 =?utf-8?B?K1J6WDNHVVQ5Q3hraUFDRXNPVzh3UmlKcUJ1TTlWdzIrRlRra0MzT1BCaUp5?=
 =?utf-8?B?VG5hOHRpd3ZHdEh6T0RzY2x6dE9CZGZXYzEwM1l6UzQ0a2U5MHgyejY2TUQx?=
 =?utf-8?B?VElxemlCbG5RbEp5eGRJSExQRFp3M0ovSXdOUTZYZVk5b2UycUZnZ0QvaTNx?=
 =?utf-8?B?VmRxbldrR09LNlBtMkZ1WjJST1FLekZMRnQwZjdaaE9UOU5vZ3pRYXR2ZHNO?=
 =?utf-8?B?My91NW05Q0c4dGhoT2RldytIdXV5aWNPOW83VTl5cnVybzkrTUtJaVBTVjEz?=
 =?utf-8?B?TFEyRVZVY3l5TnY3ditJRjBFSTV3S3ZaMGgzcjZHbHJncEdTaUoxRnk2WWE4?=
 =?utf-8?B?dWsxWWRuVTY4SThoSmdlSnN0VkNtZ1BGRmh3Vmx4RzlzMDZldkxwaTZXQjBK?=
 =?utf-8?B?WGFCVXBFSTFQOUhDNE1KeGpPK3BqS2tXZGFjeW9hM3RYMW9FSmxCZ3NPbUxM?=
 =?utf-8?B?dUJmYmp1Z0k3MFgrV3JXSFpNS3l6cHYxbjhmUWNSUERZTWVtS0lHd25RSzkv?=
 =?utf-8?B?ZjdydEVVUElkbnZUeXk0YkVWY1ZmZk82LzhyK3c5SlUxOGVYZHdoRUlUdEh2?=
 =?utf-8?B?VWM4QlNzdFhmcUg0YXBaWDk2bmhkemRpMndGLzdsL2JyZHh6cklxWCtoMkIz?=
 =?utf-8?B?Q2FvN28zQ3V0WFlNMVpocFBGRlNMNUdnRWk0K3dGd3FUMFlSRkNtVGpvVUFv?=
 =?utf-8?B?QU1JQlRzOW81N08wa3RaVGJ6ZTdLT3hzVWM5M2dHcmVJZHJKekpvMEFXVWJV?=
 =?utf-8?B?REJWQy81MmNTMWZaOUlDeldEcEhIUXBCQTYxVXA4RVI1K0l4RDV4L3JIbTFQ?=
 =?utf-8?B?bDhPb2lRTU9GY056UGszUDJBVHZCY0htSWQ4bnYzaFFCY1QycERzOGF5Q0h0?=
 =?utf-8?B?YmFSNWVhYUI0R3Z2aisvSXdVWVZic2pRZFpHZGtXY2YrYkxZQklldkQzN1dT?=
 =?utf-8?B?Z1dDc0VlVHN2T1Z4UjFjSmdiMVAvb1pkOXRZN2ZXMUUvWWlpVzRQc1h5UmZu?=
 =?utf-8?B?SWF0QTlPY1BrR1pWc0xpendxNnNMaUN3QXBRa21jVTREVUpHVUwxZjBSS2ZQ?=
 =?utf-8?B?QThXaXRleUh1TXFONExwb1lQekR0bkxqcXQzbnNzNEcwU1Q4YnZhTEhRY1RU?=
 =?utf-8?B?SlFSMUJ3NjRjeCs3aEVNbGNyWjNkQW9vbDVJSXZmQVZ2MWIrcHdwOHhFTnlS?=
 =?utf-8?B?QXVDZEQ2bTdqUHNrNVZNM0tJcEMrdUZvR1c5b3B4aHRhc2p5ZUp4V1l5SmV3?=
 =?utf-8?B?RUE2VHNaSmFRUnVGSmhQQ0p2eGVoZUhlTDNlV2psR0N1cVU0N3R5RUtXa0xQ?=
 =?utf-8?B?TkhRdGM5SEJ0Si9nUFEyYkw5ZWtGbENHMmY5WDBmZEowYzRycXhHd1FCcXhx?=
 =?utf-8?B?VENTU0prUmxYYkN2NjJWOFRma2hrY1FCKzZacDQwQWZxcHdoU0I1N0lPVkFp?=
 =?utf-8?B?STR3NGhVb3lzeklmcTdYc1FIdkszOC9KRjI4OHB4VnQwVlYwVFRoWEhPZUZI?=
 =?utf-8?B?NzAzS2JXWnhJVytDOTUzdzVsRjNDMXlhL01WM1Z6VFFySlBjRFpBY3M3OUtS?=
 =?utf-8?B?b3FJTlkrMk11a2JlV2orTS9IcURHcE5qK0FlRFR6d2xabUQ5TkxpUmlSdnBu?=
 =?utf-8?B?V2kvQ3hpOUxNTjhXdXZRdUUzd3lQOEM0cE83NXcwL3BKNi9BcTlZS3dhSDJY?=
 =?utf-8?B?ODNwNjhyekJlRDZmNG80eC9pWGFRSDFYTWpQR3lSc1NTaFlaakZGb1lUaTJ3?=
 =?utf-8?B?Wk9LbEd4OE4yNWI3VnFjelRtMFh3QnIrbitsK0hWQmkzWStkOUZKdkFkYk1P?=
 =?utf-8?B?U3g5dVl2Y2FRc3Z6TjJtSUtWV2RYb1pVcC9hQzFzZVRzc09qWUcrYmhpVnY5?=
 =?utf-8?B?Y25KanY1cTJYcjBzY0ZaN2NUQis1bFIxaWk2dWlQcHhqV2UzZldoZ05SbU44?=
 =?utf-8?B?STM2c1Y1NmxzbUtyaVlYaUxEeTh4UVMvUVMwd3llUEpHNk5QTEp2Ti9GV0o0?=
 =?utf-8?B?QzgrYXNjb29VRjJYd0xhc1J2c2R5eEIvNDdJbDhpcjVyY1VCckhXWFpibmtw?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a7ca6c-8274-4612-8d6c-08dbf124b799
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 21:47:00.5369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Th7pKOkZZpV0S96Ei5oK+m8r2GeHe/huGDwwSpQlwG+dtpV9HRuZS42HQfBZ+Eg84mH4eGqYM+3KENSnCjjnCuk6d2Z8U3GM2WTlayWBo+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4930
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 07/14] drm/xe: Split xe_info_init
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Parts of xe_info_init are only dealing with processing driver_data.
Extract it into xe_info_init_early to be able to use it earlier during
probe.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c |  1 +
 drivers/gpu/drm/xe/xe_pci.c       | 44 ++++++++++++++++++++++---------
 2 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 306ff8cb35cb1..f2cdc9bb4612a 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -143,6 +143,7 @@ int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
 		return -ENODEV;
 
 done:
+	xe_info_init_early(xe, desc, subplatform_desc);
 	xe_info_init(xe, desc, subplatform_desc);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 074ed456eba6d..e5f1fefcee120 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -535,6 +535,35 @@ static void handle_gmdid(struct xe_device *xe,
 	}
 }
 
+/*
+ * Initialize device info content that only depends on static driver_data passed to the driver at
+ * probe time from PCI ID table.
+ */
+static void xe_info_init_early(struct xe_device *xe,
+			       const struct xe_device_desc *desc,
+			       const struct xe_subplatform_desc *subplatform_desc)
+{
+	xe->info.platform = desc->platform;
+	xe->info.subplatform = subplatform_desc ?
+		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
+
+	xe->info.is_dgfx = desc->is_dgfx;
+	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
+	xe->info.has_llc = desc->has_llc;
+	xe->info.has_sriov = desc->has_sriov;
+	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
+	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
+
+	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
+				  xe_modparam.enable_display &&
+				  desc->has_display;
+}
+
+/*
+ * Initialize device info content that does require knowledge about graphics / media IP version.
+ * Make sure that GT / tile structures allocated by the driver match the data present in device
+ * info.
+ */
 static int xe_info_init(struct xe_device *xe,
 			const struct xe_device_desc *desc,
 			const struct xe_subplatform_desc *subplatform_desc)
@@ -546,10 +575,6 @@ static int xe_info_init(struct xe_device *xe,
 	struct xe_gt *gt;
 	u8 id;
 
-	xe->info.platform = desc->platform;
-	xe->info.subplatform = subplatform_desc ?
-		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
-
 	/*
 	 * If this platform supports GMD_ID, we'll detect the proper IP
 	 * descriptor to use from hardware registers. desc->graphics will only
@@ -575,14 +600,8 @@ static int xe_info_init(struct xe_device *xe,
 	if (!graphics_desc)
 		return -ENODEV;
 
-	xe->info.is_dgfx = desc->is_dgfx;
-	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.graphics_name = graphics_desc->name;
 	xe->info.media_name = media_desc ? media_desc->name : "none";
-	xe->info.has_llc = desc->has_llc;
-	xe->info.has_sriov = desc->has_sriov;
-	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
-	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
 	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
 
 	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
@@ -595,9 +614,6 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 
-	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
-				  xe_modparam.enable_display &&
-				  desc->has_display;
 	/*
 	 * All platforms have at least one primary GT.  Any platform with media
 	 * version 13 or higher has an additional dedicated media GT.  And
@@ -710,6 +726,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	pci_set_master(pdev);
 
+	xe_info_init_early(xe, desc, subplatform_desc);
+
 	xe_sriov_probe_early(xe, desc->has_sriov);
 
 	err = xe_info_init(xe, desc, subplatform_desc);
-- 
2.43.0

