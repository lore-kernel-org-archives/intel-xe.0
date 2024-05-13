Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9371C25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 18:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5627D10E929;
	Mon, 13 May 2024 18:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BmQ586MX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133BE10E928;
 Mon, 13 May 2024 18:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715626565; x=1747162565;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=51Dz0W/2MhWlkHP6qcvh/ofXcATAWGzxuaEnoPPbJ6Y=;
 b=BmQ586MXHASjxMYME+a8hLlW3jL70LvVGVxrVCxKcHmA3b3ik6HKGrqY
 m8Qtu8pD/qNKG6MoIzKkWfgqPRPracTsjcdF7E1P4dZZW3LDWTF5NIVaP
 LiP+nbPh2kvXsHpnGlSVQ24ZxGQMQyDkTnCRurNU0MvQZ3V7PFS3OkEox
 wAFOEklD7sIMyjLy8szWohcWSEWjOoZDBO8BmuHzL/0mVUK0j+OQejeF6
 /SmdMznnOXTZ7Jc6R1bA31x0F9ffWp2h9InMsn1bzCtzucMRZ7NnjMdmK
 c+PnxyrGOqskcIJI2hXzH0mF1aX9mS76a9SfSgIJSBy5bvt1plLLRGWdu w==;
X-CSE-ConnectionGUID: SOz7eJGuROe5dcTnFPoI/g==
X-CSE-MsgGUID: gWSjmimwRVyD94ezP0mcyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="36957381"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="36957381"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 11:56:04 -0700
X-CSE-ConnectionGUID: mjtnp+FMSfeQU2eEUEkeKw==
X-CSE-MsgGUID: YlQszpOpSUGI5rlt6QO3JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="61249218"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 11:56:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 11:56:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 11:56:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 11:56:03 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 11:56:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ourb+5l2YThbK2AL8whE3PmuXKV3vx0Zih3uvrqac/K3uheLLKZcB//Lfcl9XnyN/pbT13p9AHBbLyF7w1jJdk+V2899QbIT7q8+bWEBgGcslWatlZ1Soa8YOT+df79cocHhKlSw1TOltoYs3nrWig1wFZfPWsDaGdFYZPPaWjnBBkJbzAbmliTDJXutuLE5PEPPGp94+UlRu6eOMpDw0ch6QJwDysIkdg1YYSfyKs/y4PpCatAJQg8D3RWcb1lpvy/XMduTkBcAYJnFoM1bwRd1IDpGrI6TlABZaVKSYeMClr9Zpic7SUpMy/c6I7UY+aVtDW9ZUTsX0yT3qtNJ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBwjjeI5rKRtBy02QWdXZ4YLQBt6dqYQXKkJiZTMrKs=;
 b=dTA8vie0rkQEVORnc5Dfu+I5IoWv2sz2ITd2swFhuGBeuXBG2XEo2oJtXq2D5bnqUIOzUW1wCj6CH73x0SDAEeOUKnDzkUjf9+tsNZaxWdfB1UQ8m18siTatYM1O7yqquwyjFrFAk0u2SPsqL8R8YOfqqE5XjdUuFTIKJeNKZfRto3wr4j61qGKmoemaxxWOTfnzBCqxrc68nTRd9ueRNEnsziGgNkcnOwTUVpG00lF9gLX2HYghY/sj1Dvg6Wqww5L8IU3AsjFC6rvRdty7tpCJL2W3b98jTdqreX+PFWpeqfqLto2aJsVpmicYZ1U0viORsZxV7zKssbR+VTN21Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6904.namprd11.prod.outlook.com (2603:10b6:510:227::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 18:55:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 18:55:59 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>
Subject: [PATCH i-g-t 5/5] tests/intel/xe_pm: Convert mmap tests to use
 existing d3 helpers
Date: Mon, 13 May 2024 14:55:18 -0400
Message-ID: <20240513185518.772398-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240513185518.772398-1-rodrigo.vivi@intel.com>
References: <20240513185518.772398-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P223CA0024.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: cfe9fbeb-b6e1-4604-170d-08dc737e5425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0eTuMbSGfY1xr1ciw8y10WEtzQnsJQItHQA04K4DnZ4uDvYcnQUHqkmyRRnV?=
 =?us-ascii?Q?q+Y/XPnY1VjbPR/8gdV4F65vuMETZshSV2764wcj9YeQYBHysatIZkA3uFZc?=
 =?us-ascii?Q?iybqt4wZFCe/Ye0O/dHZ4I4M9GIUATL6tuq3uVd4e1BnsvlAWoMAeDbfnKpa?=
 =?us-ascii?Q?YRbm27xAq7jAPOY5M5HXTTnW1aaHmpjsW+WGAvKCK9P6kzZvSBFP7Jj1dIiU?=
 =?us-ascii?Q?zNNSg4icdOUGbrXfnS8z26AO5uQq5pk7DW0FmwBzkMsE7YMNNzh30pWlYUBd?=
 =?us-ascii?Q?6W88v3p74pm/JJSyWjRUC1hLinAUGUaKFVOg3ufddu90b5gfU2un/Gk1OlV4?=
 =?us-ascii?Q?qoMMM1RaBZC+6sdU0QWS8ocoTxeN6t4uJtIfl+ZchugdAggVmjfmbVNxniGj?=
 =?us-ascii?Q?WhJYqpKS/49d0TTDNJ8tCSi0y/WLWHQq/L26Lgz689yUXhTpgUqP3A23Mck7?=
 =?us-ascii?Q?/FyJzoDIJm0hF5UJ9q7lrKjzx3Y/zsHg2urnW7pNkew+hMUPtG0oAulrRUT/?=
 =?us-ascii?Q?LT01yydK5noYhmpDRtzzci3Td77Cd87ktbHrktrq1eQF0xZel+SRg4sTehRQ?=
 =?us-ascii?Q?wl6FoHEq9vXKQnXeadvHZeptd0fFW705ukMKXM5gnJ6PUHuBl8U/51V6Coda?=
 =?us-ascii?Q?ERSyke5JlryPgCejmLHdQ8tFe1XiLcKcpg+S1RevLqaZUOcyMdZ7e9iJxAY0?=
 =?us-ascii?Q?T1kpwKz/nPcS1c8wFYFi/uFbtUMmhGk0P5bQ3MzDXct50nq5Y5EvA1tDVuTQ?=
 =?us-ascii?Q?lrZu9dI5GnZWfndTXi7tnoIgkdkAjP5JYh+DiwdXO9LQjGOZgrtKha/hAqaZ?=
 =?us-ascii?Q?dV70xvVMy6Xlo+PGjJhOeVNPVQnpt7X90OWm1jsZP2Ubkxy4lLXysjdw1/DJ?=
 =?us-ascii?Q?BTNjYxwz6kucIlU+h6ZIJLkQf7DCD3Rrt9S9KvwnvhlaN6CAAbzQEvTgwmmD?=
 =?us-ascii?Q?qQwUuX8WLO70SgWRxS9TCjdSGmlOLid6wYFSeUUZozgOHiNCi4fIUNc6r7h1?=
 =?us-ascii?Q?7ZxfmNk/33ny8ELs/5wyA61GNUGnafUWxGeZQTnetyENBRiy+DKN0jsrjea0?=
 =?us-ascii?Q?GMLtD4rClkMviMk66Nq/aV8P5yzagM/wDoMQEMihMBZMTJ3oUWNttUTRP3tZ?=
 =?us-ascii?Q?WR+upy4ve1/8jwg9mie0YJYIsP3vZS3MNddV9YBEJSiUWNIWXvriCoe0yNUn?=
 =?us-ascii?Q?QbSPeJV3vNuvHryFuF0tMWGtNyHVvPbkiZtv95V6V8qB1+K0138MMX7Kid7n?=
 =?us-ascii?Q?+l4G1jFuVtAC5Ij17iwvKTkm4E6dxgbmuk3/+lurmQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RC4YuwEgs1idK7R33U+h/aAD0763E9NVtPqLlu7BMtN7yjUvjo1PO2RX/82o?=
 =?us-ascii?Q?0gGPeR25lxGQyasitbC7+xt30CS4taJOGvApPrJJUlCDxLRFx8vPek6h4fwc?=
 =?us-ascii?Q?WZL3RtnDH+fWUtuw3DaFmgo7987O5XMgCfkZjh0D10R5Qwk/C4bOZvwlyjYk?=
 =?us-ascii?Q?3hSjvLiNCZxEAG8ARujyDsptq6vpxLZkAiS4ZaLLNTVl0AVULd+ZJwdjMm0Y?=
 =?us-ascii?Q?oyzeokw26X1ulQMN+oJl5daBWt9iXRyVlU1g/yWm8YqrBj6XK9H2oBcxcbRC?=
 =?us-ascii?Q?EczLYpi/5mpxvHSvkL+8ga+7kKZCfk5wXr10x/yC/AOUIw2IShZhd0Pli7sP?=
 =?us-ascii?Q?FyWl3DWgG9zuZyAQpjvq9gXIos2PWICnvmpDSwgYgtY65eju9Rcc4TVzpFXB?=
 =?us-ascii?Q?aBhGTERJS3EIS1MqsY5B2RfCqPnMHmrjccfdRbDdjkbqu0jmWwDNPbXTp7tt?=
 =?us-ascii?Q?3Gsslr+qLD9pRBTglw+VqHrkglCNdOgJxqPGddRbrzPn/RJlmnPw3sZKooTb?=
 =?us-ascii?Q?JHcFxu4PPxjOxHgl14NmxjzxuBOx2wD4po8G9on8KJQrSKn4cuyPfkumsk9U?=
 =?us-ascii?Q?6zY83TgzRzElOA4Fh1UzKIBkEuKdKdRaXSu7IIiwsEyFpb18NJBvmdjjrbpB?=
 =?us-ascii?Q?EPAqhWNQuhDBIv/Dx7DuNIXmjOZTGq1nFOvwaPW27AtJsOJfRnRNnM54SgeX?=
 =?us-ascii?Q?/teKC+Mb8unNejkH4hSFioscbo40elAQeUyx22KbOe5TF9VaqxKnhlSmW7TA?=
 =?us-ascii?Q?0wINWZbyt7bye7g0xc3wxfeW9w/m4A961QVbgPRUfmq8MSbA6jfK+YCD+E36?=
 =?us-ascii?Q?xu28Zi7Gj/puPU5hia3ajOslv007dUSGgDaPkFL5izRnilBhV1DRBkyQpvVJ?=
 =?us-ascii?Q?UR47of+gCAH085iBzAD5o8d+tpbTg2nJlUPtSt6RPzjmOEeOiNAkjIu+prA1?=
 =?us-ascii?Q?mn9wzqX5uTkk6jUIFKfL+l1g9sKTKdlOJAi7JfIVa36v9aH7Nf40Fyq2l7QV?=
 =?us-ascii?Q?Ptd2UyiKQpC1Pxi4CS/GQu9X3yBL49al0MN1AqL4NMornMa6a+6FJUgLg1F0?=
 =?us-ascii?Q?sJydl+dN9ZzMrC1k+hvbtvGs3RnBzQ830xT9JeEjJ/xtiQ1ptwMcAr5TG2KL?=
 =?us-ascii?Q?Ot9+ia6nrbC/hEGHvxQ9h8wFgXbAFJzxKUnU15WujYP3CkJHCKn63ZoYHf7d?=
 =?us-ascii?Q?urJYCTsrYO4h7/0V/tRl+FaP+ApafcBuYxmcANGopeCt4PM18NPHwMBu+f5r?=
 =?us-ascii?Q?vQxTz/WrICbEzlFjpgY9FKysY88nJexOYQq13Y7aGm+BX/z6JfPnervfMRnv?=
 =?us-ascii?Q?mMyTJMCmQ5ePV9U8xvDINmXJdAhTeB3QaUT9KK0fhbCfWhG9xTIdT+EJjr2K?=
 =?us-ascii?Q?MlUOryMvTK7SWns+3DJ/56Qva7tNpT+V2g4YPJnMQsU0MyM8rA9JbPD8lRdf?=
 =?us-ascii?Q?hxwXFCZtMssNVNT1RLDozh+JIqvpb55cF+hTLshsQPgc0Swyjehb1Tn7DYAA?=
 =?us-ascii?Q?TD451j9y724js2X3d6wGUjTTiaK2q0Y6XNYo8YNGCFCk/XmhDA8NKnHQ7+ka?=
 =?us-ascii?Q?zmgYejCMhyJl3Yg8nPXrzIHqaNPQ+vZRl4ixwLb3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe9fbeb-b6e1-4604-170d-08dc737e5425
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 18:55:59.6511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHr6nJB/Xz9ezBK2M7xW/QJdrKc5Csqn74TuVsMyf680m3KbZBNva0KJyCQkq7zNWhHKSsYR6R258ff+r4ZqQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6904
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

Standardize d3 setup and ensure that it tests with D3cold and
D3hot.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 80 ++++++++++++++++++++++++---------------------
 1 file changed, 42 insertions(+), 38 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 81226a910..4aeddaea8 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -519,19 +519,25 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 }
 
 /**
- * SUBTEST: d3-mmap-%s
+ * SUBTEST: %s-mmap-%s
  * Description:
  *	Validate mmap memory mapping with d3 state, for %arg[1] region,
  *	if supported by device.
+ *
  * arg[1]:
  *
+ * @d3hot:	d3hot
+ * @d3cold:	d3cold
+ *
+ * arg[2]:
+ *
  * @vram:	vram region
  * @system:	system region
  *
  * Functionality: pm-d3
  */
 static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
-		      enum mem_op first_op)
+		      enum mem_op first_op, enum igt_acpi_d_state d_state)
 {
 	size_t bo_size = 8192;
 	uint32_t *map = NULL;
@@ -540,7 +546,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 
 	igt_require_f(placement, "Device doesn't support such memory region\n");
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
@@ -566,7 +572,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 	close(fw_handle);
 	sleep(1);
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++) {
@@ -581,7 +587,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
 			   active_time);
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++) {
@@ -591,7 +597,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 			igt_assert(map[i] == MAGIC_2);
 	}
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 
 	/* Runtime resume and check the pattern */
 	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
@@ -772,6 +778,36 @@ igt_main
 					  NO_SUSPEND, d->state, 0);
 			cleanup_d3(device);
 		}
+
+		igt_describe_f("Validate mmap memory mappings with system region,"
+			       "when device along with parent bridge in %s", d->name);
+		igt_subtest_f("%s-mmap-system", d->name) {
+			igt_assert(setup_d3(device, d->state));
+			test_mmap(device, system_memory(device.fd_xe), 0,
+				  READ, d->state);
+			test_mmap(device, system_memory(device.fd_xe), 0,
+				  WRITE, d->state);
+			cleanup_d3(device);
+		}
+
+		igt_describe_f("Validate mmap memory mappings with vram region,"
+			     "when device along with parent bridge in %s", d->name);
+		igt_subtest_f("%s-mmap-vram", d->name) {
+			int delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
+
+			/* Give some auto suspend delay to validate rpm active during page fault */
+			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
+			igt_assert(setup_d3(device, d->state));
+			test_mmap(device, vram_memory(device.fd_xe, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+				  READ, d->state);
+			test_mmap(device, vram_memory(device.fd_xe, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+				  WRITE, d->state);
+			cleanup_d3(device);
+
+			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
+		}
 	}
 
 	igt_subtest_group {
@@ -787,38 +823,6 @@ igt_main
 			test_vram_d3cold_threshold(device, sysfs_fd);
 		}
 
-		igt_describe("Validate mmap memory mappings with system region,"
-			     "when device along with parent bridge in d3");
-		igt_subtest("d3-mmap-system") {
-			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, system_memory(device.fd_xe), 0, READ);
-			test_mmap(device, system_memory(device.fd_xe), 0, WRITE);
-			dpms_on_off(device, DRM_MODE_DPMS_ON);
-		}
-
-		igt_describe("Validate mmap memory mappings with vram region,"
-			     "when device along with parent bridge in d3");
-		igt_subtest("d3-mmap-vram") {
-			int delay_ms;
-
-			if (device.pci_root != device.pci_xe) {
-				igt_pm_enable_pci_card_runtime_pm(device.pci_root, NULL);
-				igt_pm_set_d3cold_allowed(device.pci_slot_name, 1);
-			}
-
-			delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
-
-			/* Give some auto suspend delay to validate rpm active during page fault */
-			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
-			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, vram_memory(device.fd_xe, 0),
-				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, READ);
-			test_mmap(device, vram_memory(device.fd_xe, 0),
-				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, WRITE);
-			dpms_on_off(device, DRM_MODE_DPMS_ON);
-			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
-		}
-
 		igt_subtest("mocs_suspend_resume")
 			test_mocs_suspend_resume(device, 1, 0);
 	}
-- 
2.44.0

