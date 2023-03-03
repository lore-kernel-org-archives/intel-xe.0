Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC9FC7EE37
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 14:50:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3F510E632;
	Fri,  3 Mar 2023 14:50:34 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788DF10E0FE
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 14:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677855032; x=1709391032;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=6y4ub+h6MYg9Vsta7uHQ0pGnoTb+RAHRzj8XNrxEHFE=;
 b=a1vISfcNP2u/UV39lQ6WObiwmAQPnr4upHFFmuFYDCAClP2Bb2ETSxRp
 UmYpN11cFaNNqwtDQEDe8i2MtbnqUI+UktRjHnBivZqI54NlYTiAAMvuf
 vE0w5yhKVfQTBDZlZcImVoAsexileby8O/jDwqjWAOJ1pn8vWqBMGSkv1
 eCgRP+1eBoid5dO4r3sO3EOtvrtKbGhYhQ4SF8B3PsV9fwo3CtPN08Sn3
 6Tgsc+eOBiT+t5K09aArlBsVltLNu1pwWrFIVhHhE05xSverX/O6xxwOk
 7UxdC6a1HM614IBqfJpMGzE4BBVQ04lLBIxWiPMcKPMyxMKoOkcNbSYUW w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="399866406"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="399866406"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 06:50:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="677673169"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="677673169"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 03 Mar 2023 06:50:32 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 06:50:31 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 3 Mar 2023 06:50:31 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 3 Mar 2023 06:50:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fj4CRDVF/tlZpJKB6vnX61cNVGzz373lHlLtuNRofONguUd4jsUoa8GApsygodc1Ae30nyaW/o3hHbVfIZxYpNFtmD1btaJh9A9+N6Ajjpd6J8mo8UcThFD7xo6LXpwh9/eu+KK86A1Ph/rxqiRSdobTfN0uiE1Kkb4netF+cq63grXDio3XoZKggvn87KYgKg29/GfH4Tlu8CRVBbRZmXVJOczmPVYr8HNrWORazA5on6Xare2ruxmlliC/DUCfss7a9gIgAZAOa0KOh4z1c9HWJVZjXOAGw9RKoYZ2fzvzW6kfsxxYVR/gudHNeNRa9iLMX+OKTpGuM/+qpQnIrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpQr0ATnuOJq+hA46enk1vS8hBa45gRT7gZ39keMKKg=;
 b=bcbz1k8XQejm0kveEnwRNnczIudFfs02/OBnmdZtk5iDd6LfnZB2ML1n2w8FrUWApc2fygNbOghN1YeQLWrBl2VP8hEEgahIlWf54qfDhfi9vjxZ8W8+wY5Hq8vT4/dt6zlbPgIJFGxrSMVsry5jedjdvnGgnBxKCbnZk7W8edJw2s5kTZ5C3dEjVRiQGqS88NatxLiGv4tmx33ALp3IvDsOe3Qf/reWH38EuuyxHhwp2PvbXD+YFnmowiW8v6QtZuJPZB3hru/QyTZLfu6FmnGB7NKeU+FP7IanD964mAdNQ9Zoda23N9dfgXXaTmc0qHSLMBfJeOzQhotzLGopqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by SN7PR11MB6921.namprd11.prod.outlook.com (2603:10b6:806:2a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Fri, 3 Mar
 2023 14:50:29 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831%5]) with mapi id 15.20.6156.022; Fri, 3 Mar 2023
 14:50:29 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Mar 2023 15:50:15 +0100
Message-ID: <20230303145015.1018870-5-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303145015.1018870-1-francois.dugast@intel.com>
References: <20230303145015.1018870-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0243.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::14) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|SN7PR11MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: bc69b5f2-0cd1-4e5e-75a3-08db1bf6a19c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uti9FfzbJvdIpixu/iWTB7eBPczAg9F5Ajp6XaajKSwtS2DX13hyezHnK+Wygd2fGzDQjBDVcEwgYVo+KRu4TUyqN8hW6/YcUl6TtP/uXcMVGi5FSzmWBksNnvZbFstWaDDDaQTu1XxaYLwRYpVwQM5uUddAt8EZ0SJ/I8BPpY6+2TXd5FP+6XBV4qP/U6pIkKWhSPM9to4RuCrPzihKpxq49a1X55FXy811jer04VP1p9o5/rbQaSCaJrakv1RGbeniJO6GIGNWJf8/jIz/5GgXhK8wG5id1FZVE6Ydgg9iHGJDP8xqlcFEeCtZHNinVnD5nrFvWsodISo8kkozcxKPPQu9wtYgovONX5v3m1gqHuZT6x99qwaeUtLeqEkBZd8AOItQ6jQZOYOZf6sMsHRZJgSNys1QX5H+Mb0ct2uewbauCOS71kG0eeA1yVdEkUpYS1avnBWd7hTgJ3w8EVPLJhVlxN5mVb3/NkroqqmiFoTwOVgyXj79FdLxuvsIyAOhkJxjT72o2cCahTq7DIAeq0VZeEvUWWklG/3hemgCybnv4N4k60JY7Dxcb7gy0618HjGMd5d1y6sSF3nJbw8fGFBtZyxILl9A2rsstoC3wSB9S6Sq9E6zXc3S2ck1xvPZgYHA9IE74YgxEYVp9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(346002)(39860400002)(376002)(366004)(451199018)(36756003)(83380400001)(478600001)(316002)(66476007)(82960400001)(8676002)(6916009)(38100700002)(26005)(6666004)(6512007)(1076003)(6486002)(2616005)(66556008)(186003)(44832011)(6506007)(66946007)(5660300002)(8936002)(41300700001)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGVPbjIxVzFuWCt6OGgxQi9jOVNwVkM4czRwbEJkMlNCcmkzNzQ5KzdkbWhm?=
 =?utf-8?B?ZkdDaUdCZGdnekpHMjdoaVpCSUVRaFNlSUpsMWM4ekdsOENuTS9temVQYytw?=
 =?utf-8?B?dHVSd2UraXlHSlV4ODIwMjhZRW5yd2VlYm9zbU1SekZDZnFNcE13SitlTGx6?=
 =?utf-8?B?TnpidWRiNWhNNXhoVVRpVXExUkJEUjUyYlA0ZGZMczk1cldBMkhiZTVGQ2o3?=
 =?utf-8?B?eXVqODI3c21DL1E2SHcvcStYZjZzWGpWV0s1MGE1T3BXeGZZVFJib014SC9T?=
 =?utf-8?B?dU1TdHZyaG81RmltSlNpd3RkbHowZnVrN0NvWGVPUStlSjNDTlN2aWs2dDNj?=
 =?utf-8?B?eWx3RWwrQW1WTkJpdjFTTFJEZjhHVGRRczhhdTl2RnIxNmFwZ3NzZkRKT09T?=
 =?utf-8?B?aWtySjlZTS9KUlVMUjk4OGZYT2t1T0s5bk9YQlJIRkw5WUxYNTNabkFmcUVH?=
 =?utf-8?B?RThFOWhJeUp6RU5ic2pqbjdvaDRiYVFvT3BFaG5acmUrbnlYTlN5VU5YNDVw?=
 =?utf-8?B?UVpEaUJYU2F4K1NVbGpad2dPWXVoSHZKMFVUYzNWN3BSNHhvV1NsYmNpUVlJ?=
 =?utf-8?B?Yk00SFp0dlZlbnFUNDF6THJsWmJhQ0h0dlJBRTJtQkh2WUJ1Y2FkT1dHQUQv?=
 =?utf-8?B?TTh4T1poMHJlVWVCYzVPajdpU3RUWTFHM2hyWUlEbnorbFBVMnAyR2FKcnhP?=
 =?utf-8?B?bFJwbFVZeHNKNXRSMjVDTzV1cHByMnpQem5BSmNQa3M3TlgrcEJ6ZTVkcGFR?=
 =?utf-8?B?NnZFdWVqYkpRZUc4cWVSSVNkek9mVUpxYTg0NVRkdEpqNEJORTFoVHAweGRU?=
 =?utf-8?B?TjZ6OW1HMGFUcnFaY2FlN2ovZllmU1BuQ294MDJQNTJYWVByRkhxMjg2RlZx?=
 =?utf-8?B?d0tRczNrSFlURGZvdzB3ZzNjRGZvenoxYlBXKzk1ZlZGQk1JWUdHR0FtVDNJ?=
 =?utf-8?B?WTloaG41cm0ydXNtblNEdTdoQVFlTVpOQ0kzcnlVMzFablBOenBiTXdOQWNv?=
 =?utf-8?B?YWJkd2lpbldOOWxGN0lCMWJGTi9MaVdudytvTXh0U0xTdks2Wmw2aUt3dlln?=
 =?utf-8?B?cjcwYnJ4YmszNnlESmJHZlRNWHlsbDVEeEhCdHNLUzkwOXlIa0JLdDJUSXdL?=
 =?utf-8?B?TUF2SU9KRU1DRGNOaWJzd1JWb2hPYy9ZOVVSSkg0a0ZWTG5qU1NCcjhuejJ5?=
 =?utf-8?B?eFpQK1QxcUhqTW9BdzRMUDVNZysvNktCMFlBRytOYzVya0srQk92YkJKb2ll?=
 =?utf-8?B?MUZLeld3Ym9pSHFqd0QycENZYWtMUUJSZTgrb1NIaGM0ZEdsL2t5bDNpeDM0?=
 =?utf-8?B?dWFhWjF2SlZ6cGUyMVN5OVBMSDFBQWlETlBBSmRoZVVPejZPSEJQdjYyTXBC?=
 =?utf-8?B?UDIwVnFrOU8xNTJ0Mmw4NTYvWXBoWjFhdmZmUmgreTIwSXhBUVljRGpySnpS?=
 =?utf-8?B?M2NnSSs1WTBJWEkvdnY4SXRORWJFTDhjUlBoT2FLd24rZmVNZlNuei9GNnor?=
 =?utf-8?B?NXlGeXhSdWNybWlhcVI2UjNTNUtlWkdCVGh3bGR1U2JHeUw0T3JlaURQblNs?=
 =?utf-8?B?U0tQUTNad3RQV0kyRU9wbWZEK2Z3cDBmcGZVS05PUXBBS1JHa3REdWdTbUR0?=
 =?utf-8?B?RGhRdzcxeXNiRDNkVUJVVlJLVk9TZDljYzJzVTF0Q1RGVFd4ZlZPamY4Yjlt?=
 =?utf-8?B?TE42RGVCV1lZR0ozTmtZS05OSFc2Z0tJYmlQTXJUbkE3OEpNSHZUNTVOSnJB?=
 =?utf-8?B?dG9CZmhiK3ltRDlHZUZydlZQaitvVjdwc0xveUJYNVk0djhmZGZqTlZMUnlC?=
 =?utf-8?B?eGN3c085bEpTT0JQVkg2MWhGUG9hbGUyanZiSmNnanpWVFd6Z2FLY3N2M3pV?=
 =?utf-8?B?Qm9YckxKWEVPZW5kZG5ad0ZML2x5UGIwVFQ3b29aaGtFNFZoUnRxUnBPWjFN?=
 =?utf-8?B?M2Q1UEJvVlZwZE5ndjZFMjFYS0VrdWtNalRHUm4wRzBpZVlkTjludnlJb0Vi?=
 =?utf-8?B?TkthenJTVUlZL21GYUgrcWxGZkI3M2VGOTBBUnpmYzVMMVQ2V2tvQVY4UU5R?=
 =?utf-8?B?Yll5YjZVL2dJU1FuU1AxeW5Fa3hQRENqMG1FektrNDRNaXIwQ09LcVNWeU5G?=
 =?utf-8?B?N01ranFoMTA2VmRaQm1pQjdFOEdzTUZkVCtkQ0lSUHIvZWpxbEpQeDR4b25F?=
 =?utf-8?B?eFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc69b5f2-0cd1-4e5e-75a3-08db1bf6a19c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 14:50:29.1909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Lx3ziJn2gRPBn3P2+jWMYQm8Wc9J88LXh/eQyDjbTL5WXX2AbGUJExEBIBK5qai6n8eRe5dWHiBcXiB7hlGSPzhdVRtr7gMBfI0Yhr9fVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6921
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC PATCH 4/4] drm/xe: Add function pointers for all
 supported platforms
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

This patch extend the function pointers to all supported platform
by pointing when possible to an existing implementation of
setup_private_ppat rather than duplicating code.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/Makefile           |  5 +++++
 drivers/gpu/drm/xe/xe_device.c        | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_platform.h      |  5 +++++
 drivers/gpu/drm/xe/xe_platform_adlp.c | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_platform_adls.c | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_platform_dg1.c  | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_platform_dg2.c  | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_platform_rkl.c  | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_platform_tgl.c  |  2 +-
 drivers/gpu/drm/xe/xe_platform_tgl.h  | 13 +++++++++++++
 10 files changed, 129 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_platform_adlp.c
 create mode 100644 drivers/gpu/drm/xe/xe_platform_adls.c
 create mode 100644 drivers/gpu/drm/xe/xe_platform_dg1.c
 create mode 100644 drivers/gpu/drm/xe/xe_platform_dg2.c
 create mode 100644 drivers/gpu/drm/xe/xe_platform_rkl.c
 create mode 100644 drivers/gpu/drm/xe/xe_platform_tgl.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index c28831a10ae0..5124b9973522 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -72,8 +72,13 @@ xe-y += xe_bb.o \
 	xe_module.o \
 	xe_pci.o \
 	xe_pcode.o \
+	xe_platform_adlp.o \
+	xe_platform_adls.o \
+	xe_platform_dg1.o \
+	xe_platform_dg2.o \
 	xe_platform_mtl.o \
 	xe_platform_pvc.o \
+	xe_platform_rkl.o \
 	xe_platform_tgl.o \
 	xe_pm.o \
 	xe_preempt_fence.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f1f7a50d92c7..dfb391e285c4 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -266,9 +266,24 @@ int xe_device_probe(struct xe_device *xe)
 	case XE_TIGERLAKE:
 		tgl_set_funcs(xe);
 		break;
+	case XE_ROCKETLAKE:
+		rkl_set_funcs(xe);
+		break;
+	case XE_DG1:
+		dg1_set_funcs(xe);
+		break;
+	case XE_DG2:
+		dg2_set_funcs(xe);
+		break;
 	case XE_PVC:
 		pvc_set_funcs(xe);
 		break;
+	case XE_ALDERLAKE_S:
+		adls_set_funcs(xe);
+		break;
+	case XE_ALDERLAKE_P:
+		adlp_set_funcs(xe);
+		break;
 	case XE_METEORLAKE:
 		mtl_set_funcs(xe);
 		break;
diff --git a/drivers/gpu/drm/xe/xe_platform.h b/drivers/gpu/drm/xe/xe_platform.h
index f2bf48fac3f4..9aa35315d5bc 100644
--- a/drivers/gpu/drm/xe/xe_platform.h
+++ b/drivers/gpu/drm/xe/xe_platform.h
@@ -19,8 +19,13 @@ static inline void unsupported_platform_set_funcs(struct xe_device *xe)
 	xe->platform_funcs = &empty_funcs;
 }
 
+void adlp_set_funcs(struct xe_device *xe);
+void adls_set_funcs(struct xe_device *xe);
+void dg1_set_funcs(struct xe_device *xe);
+void dg2_set_funcs(struct xe_device *xe);
 void mtl_set_funcs(struct xe_device *xe);
 void pvc_set_funcs(struct xe_device *xe);
+void rkl_set_funcs(struct xe_device *xe);
 void tgl_set_funcs(struct xe_device *xe);
 
 #endif /* _XE_PLATFORM_H_ */
diff --git a/drivers/gpu/drm/xe/xe_platform_adlp.c b/drivers/gpu/drm/xe/xe_platform_adlp.c
new file mode 100644
index 000000000000..c20e04adf176
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_platform_adlp.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include "xe_gt.h"
+#include "xe_gt_ppat.h"
+#include "xe_platform.h"
+#include "xe_platform_tgl.h"
+
+static const struct xe_platform_funcs adlp_funcs = {
+	.setup_private_ppat = tgl_setup_private_ppat,
+};
+
+void adlp_set_funcs(struct xe_device *xe)
+{
+	xe->platform_funcs = &adlp_funcs;
+}
diff --git a/drivers/gpu/drm/xe/xe_platform_adls.c b/drivers/gpu/drm/xe/xe_platform_adls.c
new file mode 100644
index 000000000000..daeb9dcd4b39
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_platform_adls.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include "xe_gt.h"
+#include "xe_gt_ppat.h"
+#include "xe_platform.h"
+#include "xe_platform_tgl.h"
+
+static const struct xe_platform_funcs adls_funcs = {
+	.setup_private_ppat = tgl_setup_private_ppat,
+};
+
+void adls_set_funcs(struct xe_device *xe)
+{
+	xe->platform_funcs = &adls_funcs;
+}
diff --git a/drivers/gpu/drm/xe/xe_platform_dg1.c b/drivers/gpu/drm/xe/xe_platform_dg1.c
new file mode 100644
index 000000000000..cffb293e8d21
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_platform_dg1.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include "xe_gt.h"
+#include "xe_gt_ppat.h"
+#include "xe_platform.h"
+#include "xe_platform_tgl.h"
+
+static const struct xe_platform_funcs dg1_funcs = {
+	.setup_private_ppat = tgl_setup_private_ppat,
+};
+
+void dg1_set_funcs(struct xe_device *xe)
+{
+	xe->platform_funcs = &dg1_funcs;
+}
diff --git a/drivers/gpu/drm/xe/xe_platform_dg2.c b/drivers/gpu/drm/xe/xe_platform_dg2.c
new file mode 100644
index 000000000000..e12859608abd
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_platform_dg2.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include "xe_gt.h"
+#include "xe_gt_ppat.h"
+#include "xe_platform.h"
+#include "xe_platform_tgl.h"
+
+static const struct xe_platform_funcs dg2_funcs = {
+	.setup_private_ppat = tgl_setup_private_ppat,
+};
+
+void dg2_set_funcs(struct xe_device *xe)
+{
+	xe->platform_funcs = &dg2_funcs;
+}
diff --git a/drivers/gpu/drm/xe/xe_platform_rkl.c b/drivers/gpu/drm/xe/xe_platform_rkl.c
new file mode 100644
index 000000000000..195402f4eb9c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_platform_rkl.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include "xe_gt.h"
+#include "xe_gt_ppat.h"
+#include "xe_platform.h"
+#include "xe_platform_tgl.h"
+
+static const struct xe_platform_funcs rkl_funcs = {
+	.setup_private_ppat = tgl_setup_private_ppat,
+};
+
+void rkl_set_funcs(struct xe_device *xe)
+{
+	xe->platform_funcs = &rkl_funcs;
+}
diff --git a/drivers/gpu/drm/xe/xe_platform_tgl.c b/drivers/gpu/drm/xe/xe_platform_tgl.c
index 616c20b97844..11d8f38147f2 100644
--- a/drivers/gpu/drm/xe/xe_platform_tgl.c
+++ b/drivers/gpu/drm/xe/xe_platform_tgl.c
@@ -9,7 +9,7 @@
 #include "xe_mmio.h"
 #include "xe_platform.h"
 
-static void tgl_setup_private_ppat(struct xe_gt *gt)
+void tgl_setup_private_ppat(struct xe_gt *gt)
 {
 	/* TGL doesn't support LLC or AGE settings */
 	xe_mmio_write32(gt, GEN12_PAT_INDEX(0).reg, GEN8_PPAT_WB);
diff --git a/drivers/gpu/drm/xe/xe_platform_tgl.h b/drivers/gpu/drm/xe/xe_platform_tgl.h
new file mode 100644
index 000000000000..babeb5c95334
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_platform_tgl.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_PLATFORM_TGL_H_
+#define _XE_PLATFORM_TGL_H_
+
+#include "xe_gt_types.h"
+
+void tgl_setup_private_ppat(struct xe_gt *gt);
+
+#endif /* _XE_PLATFORM_TGL_H_ */
-- 
2.25.1

