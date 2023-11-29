Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC604C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 16:29:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFDD10E635;
	Wed, 29 Nov 2023 16:29:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0AFD10E645
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 16:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701275349; x=1732811349;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=hh/fI2YUD1NloSLErtnH1K0A68QEJ1qrWrhz8S2et40=;
 b=kWzxm73po7z0oMb6EKQRmEVdmfbHkWKPMs1tp0A0O2o5OTBOR6uawoDB
 3sV5i16L5qSh5aIfRuPjtEqYCYOQC1cAsnug8gqy5PYp0aF1X8D/vJmbo
 1iIUMdGFeUs62pqflxICLBUVKC7wXVVVR0yDW8lICGqiRSoiojTBPJQG2
 twfyntWXTYKOhzdgiFWCEBS6+crQccvEjNg28Pu/qJOThsCpFtkvvbEA1
 j8tPUW1qKFOQ2pC/1TjKUPxp1GnAILv+IdxVQ5j9OSkhbqYP3QCe2uaPi
 O1sdOWexaS+fAMFqL4W+Wqcnot1VyNiCKOeZufUYNni91nCent1WKXZvL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="397082589"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="397082589"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 08:29:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="718799245"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="718799245"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 08:29:09 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 08:29:08 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 08:29:08 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 08:29:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRQhA+8mPSCi97wJqEOL0otZxei0QKzZvWiQIZFng8c27oxgfVxetNJhMiWMm6nr7goB+dwZcNxGI9wEyYPecTbPkcI8XvdfBIEl3oujnKI86ND7vpVeD11ERDVmn+DF2EuH0hCuVLS7shJxJhEnWcJjfwmGiTWkLmaHHTsWH3+FVbDQnvOOGCDWIUS81XXGsMV+1twwEy6yNfmGHD3kMAAKzr2zk3ZNYzOt9Ui6KJDHyfrwK624+wm9vz1EpmA1boubQ0V4LcvOsFoTxOarD6QT74uYyqaeHfJBEl8DAOB8YlkS1+Sv/fSfn2rGyQhNk38fQs8mWkp5yohZF4oXsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4o3s0ADGE4xwLazMhhmkns9xM51fUuYDCCp693t7+dc=;
 b=KmhYZblxNM0s524pxK5gobv7QUbngQEUFtDvN8G/IJcfDFhBX+cdZtiE/QyTh4oJZs+meTSO4OL+Y/O9ZKgU8jByJDbDqhHCHIeHUwC4+R2SVYiDmLMRyjQns2p8CoIKHYAU1mNs8myK6qUnRewQiwIu1z1Kn7sEPoatojnZPWZt034V3bceMrLmZqO2bQTHTy8UD3H/YJwsQfHDqUza1rxCimXxRxBuImupxmJ2/y+MFf3FKGHXjnb/Hjwrs/EnnJQ4b2qRzZ/JRQrWtlYWcQOoA7MJtKOH/+1HiIet3wC6np/rsBBRiueyVMGhATS9ITFMKpNe+J07gLno8p4+vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB8665.namprd11.prod.outlook.com (2603:10b6:8:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Wed, 29 Nov
 2023 16:29:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7046.023; Wed, 29 Nov 2023
 16:29:06 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 11:29:00 -0500
Message-ID: <20231129162900.15342-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB8665:EE_
X-MS-Office365-Filtering-Correlation-Id: 13fa4d3f-d5ab-4cc4-22e5-08dbf0f84ea6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9h2tiovt8PDWeY8OLzVhZqWxEjsxJcyibYWX30rtfhIl48Em3i5BbQrzRzw26r6mF+7c3nvgeY0c6jAu1ASnNJfXB1FJKtQYLKWtI4Ks/H8yXiGonvzAIOC67RHSa68TJM2sH2UIPlXPcARrT0npN3PzvJt+jAlqK3WUXYNm4yCsJP+egG5ykkOLsWVPWFz2ZnKYr0FELC+NP43xZYw/2tKGhlCt/QMlReChTJzt4yolx3vk7Sequ4MrjAeq+DkKPNXwjkFhwf8+i+uByZ87slTFUjaLrw3khpog8W2kdSoogKdknz9xw2HUX8NtDWO/HYN6jN40ZUDTr3hLeY65SfdnyyAscRlo0qUsU/xd++EbjhOJyKmV53NE99CGBs3Ts0OWBJxFBwNUTswwyfS3lUYYQUQrgZFv4M+kKkiHJimVCVlfwnoiuFWncZaigcgjhmuB6V1Oda4hdg6PJjJSii4UrfaFohLO09H32VBsxHApIjkJZEAR/889JM4gIFc5pyEbPbYFgy2quH9OW6NpjAXRtQMHJ/d+lfByiyouoLMa4xDuDLS4ZLo24kvvepsK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(366004)(346002)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(6512007)(6506007)(107886003)(1076003)(6486002)(26005)(2616005)(478600001)(6666004)(83380400001)(4744005)(2906002)(44832011)(5660300002)(6916009)(66476007)(66556008)(66946007)(54906003)(41300700001)(4326008)(8676002)(8936002)(316002)(38100700002)(82960400001)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8K1DCxtt5iVopTVYAyeqVbJLbh9og6JwAAiCpJJnK1+iANy9Vl+ugq/+QWBq?=
 =?us-ascii?Q?teTZWT0KUQVpa2MJlFXjp3Sfytd2YHxVkOYTkMKsWGkjpmusizLjgrC+EAej?=
 =?us-ascii?Q?6Knw78sxNUzapcR9HzG9FtbGfXrwurom9oolniYA86B3HsjYj5M+H+LR1TZn?=
 =?us-ascii?Q?DFhfEgLmqhB8VkMZzKeTENNd+PNCEOKnWqn4lgYD5/pNtVkoDf6uvZVDsLsS?=
 =?us-ascii?Q?ey7DiHHbS9qKKDtzOuhiwGnTCIS/WAKY8swmSA8a00XaxF8rtYDnpwW83A5Z?=
 =?us-ascii?Q?LCeTq2uuA3vTRWezYblAjn7TaFLTh6v7WSAc/2m9YiWpw2SrNzcTgr8xUZbw?=
 =?us-ascii?Q?lkKcOTUyjgwfCb8jU9rle8NNseEWX5G5dF58Fkp7XPur5mEOkw3JBWlpfGgr?=
 =?us-ascii?Q?a4OMgqwyUFNjRpNvxFrXKqqoHIhwmn9yk4j1t0sZlFn57A7T7R0sEEms1Di+?=
 =?us-ascii?Q?4LFeuKtHeq/zCzkSryPQH5XWjNw0SOJVC2SiA9n+Yzrd8IZdMC/0kB5qu0sT?=
 =?us-ascii?Q?lBxIPtWCKfDSU2VI6zoVrrybvvijVEGSNc66Hmj9SX92oJygcVtckCpIpGuf?=
 =?us-ascii?Q?KLCcL3HC++VVgMIf77jW75nS9lh3VI/Q0DNS4e43/H4x6MO5NVDjfi66MYpA?=
 =?us-ascii?Q?8SCsAc9vcq9wldgMIyTpClq6or8rr4DPRfwNDEjJPdp+y6wQhkc8xAXjDj1/?=
 =?us-ascii?Q?+A1I06IOe7m7GXiubA+J+V0iEWeQrBica7Zy0azWZe3zh54va0AKfKld+A7j?=
 =?us-ascii?Q?IMTJhvWQ7XfU4HZobf0PNeOv/BGoxqwfcN16VKkElCd7Ilujkjhc/Fsp8qVA?=
 =?us-ascii?Q?qmAXsECkxTs8KdbNVBHcZPcMUfB5Pk9DA/QIYMDlALLSS9/VRwf+8/BAR8F7?=
 =?us-ascii?Q?M+FBh1YdNVtcBi4jtmd4XMva1muLXnSX85gHBbks3hvKRSyZYUYu9NKMWw2E?=
 =?us-ascii?Q?V+gF489qVY7MaOOWtCcn7VIZoFJkte3TxDbI3/ormckA+k8bSDE4SdfK38IF?=
 =?us-ascii?Q?+G6jEwTg9dMSWEB28nBqATTdWn5SzBIyQT/iRYU2r2+Zi9PRKX2Dc00+DffG?=
 =?us-ascii?Q?WAomFp+MrTjte/rYilGoI8kPonDLeHkZhhJtIl4mq1Wpj62IJvABZXfd6/H3?=
 =?us-ascii?Q?jKwyGuxm3jBNvSwsENE/wib1oOlLOAT86313jYfzROZqnCE3uzeQKXBtnXFw?=
 =?us-ascii?Q?n4fCb3aXNsl11kdDnvjAEp9BnFqdu90Yr5U8rEL8yhcqKJjU+4KibIPxJNAA?=
 =?us-ascii?Q?Its0qDxDDjIghdmz1Cvjp+YW6Z+qzh4RZj3pYtMqvIH7ea9NK8+j5Wlug1NX?=
 =?us-ascii?Q?wFEbAvnuHiUIhTmdV14Q/AFNLv16BHTWJhkJew0yM6ok9VjVji8DktxcAvrj?=
 =?us-ascii?Q?6lm7QbJvB4QrOM73/pKTlkzTejcROuKZ4+R6M1QoH9RCZ/8+dBfUJuz2naJC?=
 =?us-ascii?Q?Pmo37F5edpVbgvpjFrdJu+HITz42YLwA0k6rKAPKw/2wjpgHDWXFllfqhAzK?=
 =?us-ascii?Q?jpBUJxyERi2Z0KFaTI1q4MXQ8ZEOfY5DKov8/CpR/G3JL3rQSYntb5a5WQ/Y?=
 =?us-ascii?Q?vVE9NrQYtNuvbCeXxGtnV6eh1f2APUfkvO/HhXU6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13fa4d3f-d5ab-4cc4-22e5-08dbf0f84ea6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 16:29:06.6153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5dKOg62VIWUunscKCyT//AfQctp4tHVtYXsBX/qJMZLKDRq56oy2YCnduFF39QTJia4V1JB+BQokN54aqh6cGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8665
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH] drm/xe: Remove unused extension definition
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The vm_create ioctl function doesn't accept any extension.
Remove this left over.
A backward compatible change.

Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/uapi/drm/xe_drm.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 88f3aca02b08..2c44845c4ba4 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -584,7 +584,6 @@ struct drm_xe_ext_set_property {
 };
 
 struct drm_xe_vm_create {
-#define DRM_XE_VM_EXTENSION_SET_PROPERTY	0
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-- 
2.43.0

