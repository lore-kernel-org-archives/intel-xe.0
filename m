Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD0EC25B78
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 18:56:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBAD410E923;
	Mon, 13 May 2024 18:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RXtEUbwD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF0310E928;
 Mon, 13 May 2024 18:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715626560; x=1747162560;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=davoBPRRb2peNXbOssB9JsEHEOVkAb0aYjNMVQaWzyQ=;
 b=RXtEUbwDfW7pDnwVkvIAsOIyDTDKd4Wku4aiNbWcggxpGRs5zwfZBgBQ
 LSsO8VSOUxAcMhXFlzU3aGDTdr6JKYJcJLG0aG1Id/rnGIxmpqNClij8K
 yk3/BHLON2zt/7beFE1x74L5+pDx6SrDh+rYhpJfMSKFGrh/VF3shFM8z
 2+JttupdCLiGvZgAr/sK/3WxruaiXVM1CSQddG818Sgp/jCT7wm/YmMzF
 6LFsvAbVf2CWFQ50xvfLvs+7yBn86DxGw+O5pmAEcdrApU3taYXf55LPu
 T/IVrT/j55qFdY89oR00t0aOhT2VhdOAD2c7QjcD2jtN+wQlAZzhKu0S5 w==;
X-CSE-ConnectionGUID: dVTDyJbZSDCr7xwPpIQHPA==
X-CSE-MsgGUID: JOiqYNhBSbaurRdIjcYJ0A==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="15400414"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="15400414"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 11:55:59 -0700
X-CSE-ConnectionGUID: iL8Iw2e/QoiQ9vpqRK1VoA==
X-CSE-MsgGUID: XANeT68wTOCTbBOp6kjelQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35177181"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 11:55:59 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 11:55:59 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 11:55:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 11:55:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 11:55:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKFhhirWKzVkMLpXvHsaUl0DOMRvnMgpIPka3GTPzaanK0Nmg6zMFlOmvpCvM7pffg0ffc5dG0c1t1Kd24CNO+ZVSKhfeTCS6qrzSigE5agRo2jdH2Qn40t44EqkCD6Rtu9UyHDIHKLbmdsxxJwvWdU5tUz66pw+t8P3VH2McX7PLxTgl90L11TosRx8K8MuglVqDRc/oa4BJ4Xa+I2u1gRO38zqpYH4prNZYFkpLfpA46ficafFWLcrPZR9d3iGTzC+Z0kBYOrylHHA6hPx5tcACd6k9HKetIrVvRNq839SdE1VdBFlKWpbsF7JC6il4CwioS+4IJqlxZ8om5vXYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZGiAO52cvK16c/OvugbvfeAyUWNCFdmJbma2mwLMIk=;
 b=IB0Dv55FM3rD9co0NNPad0l+szLC/HLRWhnuXYnKduBgz2MZHmcfRR9/LRIrcVC/14foPcsjaKb+0b8cuI2MMaZjzM/Zl0XKvkprvmWa4enhn+BAkrjCVbkSlstpW8/FngnCefHRZcDBU8Q63xC3S+84Uxpe0TsQgGg8sgHx/z9iZ8CphQ/umkH26wRn5qUW1gV45RNnMEfdOcq8pd+FbCmAck0cgwdJ5aAYv16XallrUs2HA3O/thMlnv+CMN+PJv1/N1rs3/E7+0iZJ6SdZfDtGE9qRidAzutFgqgllFk87hMSVkp6ttSEvvWxxy3u8mn0xHpjb6K6aV8lV1MbCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6904.namprd11.prod.outlook.com (2603:10b6:510:227::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 18:55:56 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 18:55:56 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>
Subject: [PATCH i-g-t 4/5] tests/intel/xe_pm: Only check the rpm resume after
 the first mmap operation
Date: Mon, 13 May 2024 14:55:17 -0400
Message-ID: <20240513185518.772398-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240513185518.772398-1-rodrigo.vivi@intel.com>
References: <20240513185518.772398-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P221CA0010.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: bb19551b-cb03-4c44-b23f-08dc737e5251
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zVyr2LSrs/MBRUGHBRUMAZfFvLD83szaHNP0uCdk27haNVhOEbM/RgTBOG6u?=
 =?us-ascii?Q?qyZLHIeYfUtvLVJk/QAW/Mve8W53ck/BKDAkWJyzty89Wfy1mhhIyY9lGiSK?=
 =?us-ascii?Q?nBK1Pmg65EHZwjOOwN/6vwLlOogfPwzdLi6z29dXmwUav659E7960wPk1Mde?=
 =?us-ascii?Q?7JndUaXgLHg+pg7xnT4s0TWtapGUviEyDTuVmMujNTqrSDmMS1R5K0P2TTRo?=
 =?us-ascii?Q?TD9VAgFS/2yrI2G00aXMNObr6TRynWSj2X8IB1OHAGdcH5mx/eFtT0+G80nV?=
 =?us-ascii?Q?Zase2PitZMam1Ycry1nIHVjrjm2fzlWNL7M2buWc6/Ro7vLDz9+A4EhQ63If?=
 =?us-ascii?Q?+iyMmpy14BmjVHXyCgZqmgckmDEShLsNz5FtNrb1Vte4gF6Ea+mhZfo5SheT?=
 =?us-ascii?Q?rrLDnV4cJ5sur8nOBKMwW6xyu9dnywCiAbCrcdCBRBk2UpDUAzoI8cJIo5it?=
 =?us-ascii?Q?cEtJBqCp8Y6w0EU5l5RDFZw7EsByBi9D1wDrDF/lXYN3VZWDRXHi+3ww+ART?=
 =?us-ascii?Q?MvrGQSSJaAX3yws159VGyIXkf/UlfOArfM4OAZeJKfTLHWgBm7D5oh7Ev3iQ?=
 =?us-ascii?Q?9jo58QxPHwixp4sggz7cebLjgctPQJdIMWvJjMFyLlKZISSIILeXDrpgAX79?=
 =?us-ascii?Q?aUXAIVWWNgKF9md8I1XuDfHJuF+c3nZcW5yPUNTABDecKT5gyjAjl91OH+hu?=
 =?us-ascii?Q?/arO0HfJ/IahT07DjKheV64gMaxG/rRYn7Xp/V20y4qHI4nJT2wvHl2q92s3?=
 =?us-ascii?Q?1St1Abq+a8GU5JHHNWj13groxG3aUPmyeUgC8mC566MT1t3syO/RUCxonTiv?=
 =?us-ascii?Q?wait2nbWXsFlsXprLbp9pjlHTZ9iUae249aXVN6FVxU6yIX8RGfzii6PchIJ?=
 =?us-ascii?Q?IGLzhP4xBX7PUOrgGb48o4kjm+2r+dE2Z3e0a55JufVw9MsUWvBf0akZecyY?=
 =?us-ascii?Q?zfjwq7dNLPNUqFIJ8L0YB2qXZd/wsK8YrrZEPcJ/CDnFiLXxGdFzmGzmNTn1?=
 =?us-ascii?Q?pDFc6lb89VmHyVctFYDlhu2zZ2tpNeSN5mBDh9WdvZBTG4Fwm/9/t81QFZ54?=
 =?us-ascii?Q?YCu8hY/XP3YNQ+0dbc5E2LS5iEhfT2+795QRWuRlDPJWsFHE3a4GLwTZdnw2?=
 =?us-ascii?Q?SmIsy6CWKpa6YwooCU+KBAfDtDtW3JaazDxQXnwqV4Vlj7/n2kcKogTzGr+i?=
 =?us-ascii?Q?3fvJ3iKVVNMJOi64xAgGCTGrCgybgnbWmGZ9+2P09qoDwAaSSaZouaDzOaAU?=
 =?us-ascii?Q?TkEbQuLtyazH66Z5HDja1LiMXteZN4gq5NIAd7sx1A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fSEvb6DYtaiqsgV8UtRHdqeuhSXTlcctE1ENgFieKNaeAK7v0XMLsdwiEV7U?=
 =?us-ascii?Q?axN7TkZgSowsT2VQDVU8DHxGpjahMB8ji3M447/B2cRv4FIufO29QOuDoBVG?=
 =?us-ascii?Q?O/AP8beUFlihbg0DEkYYyGf97QoEPww0Jv1/aJtBuSBqxQC+fgV1y6I6J1eq?=
 =?us-ascii?Q?iQmBP4GdQbP7vBlmGz/MVGGjJPz4/60VNwqT8/YtCm4k23j8+IYC9FGEqa5z?=
 =?us-ascii?Q?uTndV58sWENaqWBFKxhnxRrRrmUtrZ3oAE+neIt59vqjAaf/RsWdAqg7vTFG?=
 =?us-ascii?Q?XbVnCn3cp0QvBe7bIjnuXDKMBHD5s8FNS/Hq+AYHimLf0tG0ZUQNg+DHE6dg?=
 =?us-ascii?Q?2uLf+zEnw89F/WqgTNnAGvJA4uRS6c1N1ok6WsIfb2ekF0F+SI1Z03/j7ZIO?=
 =?us-ascii?Q?vo2Np64ThxY9vCSvbvoq3Kp+eneu9MpxuEfWuHVa5QOQXEod9ijAwkl9Wr1h?=
 =?us-ascii?Q?c1VzakQ6L1gdW9LUMH+4fkvF0KKBo9olQVqaDje8sfxdxKpUZ1AmefZH2+oi?=
 =?us-ascii?Q?OqJcdxgcxDDg06YlqjPRzbE2MbTMFgZIj590b4CpmyC0Slmet9vnt7fY1E4Y?=
 =?us-ascii?Q?N76V+ABgv6UMHAiEeM4o5tthOYv9tSvdEDbY2AG72nq8IW4bJVsHVyjwK4Ac?=
 =?us-ascii?Q?cBULZbgWvlLaM9hNuSgb8PK9EIo/TUVjjga+RhaJVrZ356d9RM4V2IDIDyc5?=
 =?us-ascii?Q?MAVOs/htcgeS5U4faxubEugh9dG00L4fHvyqAPvYMgmOzH6DKdZxnhe0wLz5?=
 =?us-ascii?Q?ooilk2fRifJL0/VdhT9kUmK27IQ3AmbUe+ea5r57QICB2Fkqlp290vpPZYcn?=
 =?us-ascii?Q?bw5wCXnj0k51zemG7plHyAljawRSwHBZ7lwgRSMk7K2iTyC+xSt8kKzrsDSe?=
 =?us-ascii?Q?j8JtqD8plUsIEdjf4goQaZr3YrZ197VzKC/6eqrFFafPbk6+Cj/sWEIV3kZO?=
 =?us-ascii?Q?rg+g3PeVMl1MN6+TLFtmHGCkxccOjyIu5eQ7jF+UPVv5BFh38LkT1fVlP8D3?=
 =?us-ascii?Q?AfIR+BP0GYXilUmDnJ7twZFqLMKflVAR9KoYfyCzZEQacD5nuG1c3dqdEvqq?=
 =?us-ascii?Q?3/FL8pPN76CqF03rw4KIJA3koYbRl9qnuWI9hoNRZs4PBD0Xe7nbA2UlhECv?=
 =?us-ascii?Q?Yn7VaW6uruhJPu+gJUkRtG42PB6XnP6wNZn/Zz6xewt/Ip1Vne/YNRmjPIKY?=
 =?us-ascii?Q?ZWNE1BiYhfiiqxzpqkIBwan337/ZRe8e1sjuwrmsr+gsg6WDhAoLdd9fWu7E?=
 =?us-ascii?Q?VoIh7niLCQNMnHwVLrr/cGELgvH4sGVcSnZur7ZNBMdPAl5icFASteTxjz+/?=
 =?us-ascii?Q?SlnoxzP+KqAt4FScyRXHpGzAe1ahPmB3vy2IBPhFO23pjF1GJgRfpfuUP25K?=
 =?us-ascii?Q?k4dEO2v8EkI21JsWTqv37XkZ0TmrmEqDeVSzxh891Id9iU8H1D/VotKkaGmS?=
 =?us-ascii?Q?npyP1yUo+beVGMIH+5ROR8wR1owZ+gUCAyNK8/eavOlro9X44pY+e4hQurw7?=
 =?us-ascii?Q?iH5rTN0U1ufNtf521VRjfVSXArFX0EVSK+gf8Bvwt1KdaWV2ozNufI0HjgUx?=
 =?us-ascii?Q?JAECdmmhehjBjjEbwl/0hupdMTqmOEzxu3n+8Qrj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb19551b-cb03-4c44-b23f-08dc737e5251
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 18:55:56.6242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYMsMD8xLXAbojEZAECXdjncvilhg0QpQ63QIhlZXV3kqAazb7fMShBkc/WrQFxiyNIm56Dv/SPk/QPl97SALA==
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

The very first memory operation on a mmaped region after runtime suspend,
the device will be resumed if the memory used is vram.
However, after this first operation with page fault, the memory
can be migrated to the system memory.

During this migration, Xe kernel will get a notification at
xe_bo_move_notify, and the bo will be removed from the
vram_userfault list. Then, on the next suspend, we won't mark
bo for page fault and resume won't happen and the active count
won't increase. This is okay, since the bo is now in the system
memory we don't need to wake up the device. But the current
test is wrong, because it assumes that the bo keeps forever
in vram, what is the issue here.

Only checking the resume after the first operation is the
enough. But also, ensure that both read and write operations
are actually validated.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 72d484163..81226a910 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -37,6 +37,11 @@
 #define PREFETCH (0x1 << 1)
 #define UNBIND_ALL (0x1 << 2)
 
+enum mem_op {
+	READ,
+	WRITE,
+};
+
 typedef struct {
 	int fd_xe;
 	struct pci_device *pci_xe;
@@ -525,7 +530,8 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
  *
  * Functionality: pm-d3
  */
-static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
+static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
+		      enum mem_op first_op)
 {
 	size_t bo_size = 8192;
 	uint32_t *map = NULL;
@@ -563,8 +569,12 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
-	for (i = 0; i < bo_size / sizeof(*map); i++)
-		igt_assert(map[i] == MAGIC_1);
+	for (i = 0; i < bo_size / sizeof(*map); i++) {
+		if (first_op == READ)
+			igt_assert(map[i] == MAGIC_1);
+		else
+			map[i] = MAGIC_2;
+	}
 
 	/* dgfx page-fault on mmaping should wake the gpu */
 	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
@@ -574,12 +584,12 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
-	for (i = 0; i < bo_size / sizeof(*map); i++)
-		map[i] = MAGIC_2;
-
-	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
-		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
-			   active_time);
+	for (i = 0; i < bo_size / sizeof(*map); i++) {
+		if (first_op == READ)
+			map[i] = MAGIC_2;
+		else
+			igt_assert(map[i] == MAGIC_2);
+	}
 
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
 
@@ -781,7 +791,8 @@ igt_main
 			     "when device along with parent bridge in d3");
 		igt_subtest("d3-mmap-system") {
 			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, system_memory(device.fd_xe), 0);
+			test_mmap(device, system_memory(device.fd_xe), 0, READ);
+			test_mmap(device, system_memory(device.fd_xe), 0, WRITE);
 			dpms_on_off(device, DRM_MODE_DPMS_ON);
 		}
 
@@ -800,7 +811,10 @@ igt_main
 			/* Give some auto suspend delay to validate rpm active during page fault */
 			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
 			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, vram_memory(device.fd_xe, 0), DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+			test_mmap(device, vram_memory(device.fd_xe, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, READ);
+			test_mmap(device, vram_memory(device.fd_xe, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, WRITE);
 			dpms_on_off(device, DRM_MODE_DPMS_ON);
 			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
 		}
-- 
2.44.0

