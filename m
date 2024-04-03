Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58D7CD1292
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 15:17:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74288112772;
	Wed,  3 Apr 2024 15:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AkwILSN+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030EC112769;
 Wed,  3 Apr 2024 15:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712157461; x=1743693461;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=sLT++pTJ56BhOpUwqNOsq2oxotDTcVjC58LLeR0ksRQ=;
 b=AkwILSN+q7nBLtUfj0a0HTCmG72/6hpfD2sDPRXXtiIwpkoSZFSLiUjz
 GZRPHIawFR2qc7wUz8H8wu+KgLslfmV1XjhMX4k3nL94bIkLdQQMPCiuN
 2YDGaL2HOCnzJMT2Jxc3yB5iNUeNMzUA3/X7hpAERUea17UXb1noABTrP
 vyG8fMvuSD7jUZRWCb8sw6SyPcQutOkwjYFipL6ReyCs3LPMU0N23khzk
 fr6HGf/U0sXhs+WuvxuD72dZAfpM2Q5wkn+oosV92ZLLfMtxbgNMQbwfj
 LnNJnRAGTBaPF6gsN4X0RpjAQFoyWvBaOqTBKnXl/7lVHgpbzeo6owKkk g==;
X-CSE-ConnectionGUID: wn2a8HfXRqiT9Q8BlO0R6g==
X-CSE-MsgGUID: yAb5NfNxQ9eDbdnzDc3s2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11174120"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="11174120"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 08:14:33 -0700
X-CSE-ConnectionGUID: mJzMD9MsQvOVrln20pUNHg==
X-CSE-MsgGUID: yCs/GtEATEW1xhb6zfgfLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18506306"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 08:14:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 08:14:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 08:14:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 08:14:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 08:14:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlN5ZsYAREc28TSahwNK36THAiiPsiIglwxWdSvbq+vVimcHEhW6KAhBlrDfA4lNGgGTi2RiiHze+8Ig2bqQ3SNUus276bKcUzaVs2iSxxiNumWNRXD0CP7lW9NBFq9JDMn2FdNnZ0+7B14iSMb5yDJSUMgzjHvVWxWXBP1sMZPG6/k0oxWJalyMo2jl6WrNe1aEvQNQyS7eJ30BgmrNjp/9VzHxpzZEvbhqa+7Bvqobs2mhGJvqfDMsda6L6A7fO8/FbQIitz40p7oCx8W3HxFY6qzDIVCiK4Ogv4OihKQSSFPhXi79ga0TeDay2B0DWfb6KyAXFZWoGB+Ylw3bQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3riGe7kuI8I4edRIx2E44Jf6/1uqNm9viDl1rFZ3l+M=;
 b=AnVFS0lVHLr0xQp6GRYy6/9ef1qz31ET/Xg9Cu4lhc+WZ4JDtmXTHFgfyITiHrpmRQn/ZccsoE0Hd41lYzcBNf5Gjuv953ekRE7WKda1d164e8FUclX9pmRu2VswF9hphVNpb53i4GpUlHhQVJqlJ7+C1cCwHx/hDlkEsRI+QSipl023/bp6HUdee+vfxlMlG6AHgG1n18CCy6APDsyUiVGMNtGxooEV46exBdQVKbhX/sk3Ry+hrTRhO0mEfsxMIFhYfTLcufsto5Oxxf8rJ72D5iQ7GPLuQlLpnYO2s9oNXbBrbDipTxrRJI37d4hLTdDR847lF/n4cEYxKoD1GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7479.namprd11.prod.outlook.com (2603:10b6:510:27f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 3 Apr
 2024 15:14:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 15:14:20 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH i-g-t 2/3] lib/igt_kmod: drop devcoredump before a PCI module
 unload
Date: Wed, 3 Apr 2024 11:14:08 -0400
Message-ID: <20240403151411.113159-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403151411.113159-1-rodrigo.vivi@intel.com>
References: <20240403151411.113159-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0194.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7479:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U84f62/G9aq6dktGmDanEN7wBdV134UUA5+tPWZHA9hcIJgBUHdyhm8wW1GR1DCtNrjUpBGwJVM08SKF8jrPDP14Y8S3jCBiDuswvue8T4/4nw/nAEfSWLWeVDxyyCBsXfK0YGJ4zkL+iRDshGgjvNF9LfSxWYBaOrA+ie2UNC+WQrStUU0i+GnZZWXyk2+G4XynMwjzvF1okW69by+xLHs7WN3B3sgkOXYmmeN17VHCws1d39bHN7xN4CkPGu2dJ3NYY+u7YVaTViJB3zqp9IP4Ac373nZ+goHSbDNCw10JzEoy1xvq4hU0+fdMCtvLjOVOVO2oVKQ+UkCsRDXGx3mE6SVU8Xrmvc393nAVDyRtx2Q26NH74IVGd6KOpjeboNSlAVh9pYIu+9zge8Da5yj0H/7DGJodT+stZmOFUz3+UQ2Y1uqoafWucU2AnqcKQCwPm4x3mXGmDIKHzi0IoBKBDA7CRjnGgfgUudLXq1K0B9s9Px4z1moBUq0pgLpWHNEkhdUeU2uddZcjITiXQIk4tbbnG4W2asw/51XXbysrCHuuaolV/7FelWpYeVB535eJRn5/rR2VJFKF3zTxIgWbdTNWB10J+yQNTRwGw8+o4Q3leIxEZQ1kgprgEqkVpSzREi/4A6vDmPHmXODI0pUcV1WSGeXUen0b27ZoGrA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3g3ZzAvNVQ0SG9GMXdWWmJiNE1zNHpRdGxUTzlpUk16VDdiQm45cERBV0dZ?=
 =?utf-8?B?S1hMRmJ6UW9FakljeFQ5MmRVeE8vUWtpZjdZMVhDMk13WmMxT2t4MDVzTGVI?=
 =?utf-8?B?L2hqbXhjdVdwQVcwUTEvQVozNFl4bzBQSkNmZjBBMFJ5dWhlalNRcFdPR0Va?=
 =?utf-8?B?M2VVVHdKaUZ3SElVUG80Ny8wVHpzUnFiV05kVVdjTTdnM0kxS3pkemxxTVUx?=
 =?utf-8?B?R0JHL0l3UE9xd3RrZGpHcG84TnlkNlhEd0haSUdVamlVTmcxbG1NblllL0FX?=
 =?utf-8?B?NzhVQ2V5dmJuLzFscGcwTGhITU5JSEJ0V1lDZU92NHdGSjhpc1pWYzB4eUY4?=
 =?utf-8?B?eFh6eWQ3L3BIb1NIb0MvR2hhYUc1cmRSZ2s0VktoWVpPdndZM0JEdm5UcEdu?=
 =?utf-8?B?THBPOTByY1RLNkhxTFJtMTU2bG90dXdCRlU1R01mT3l6THAvZlBpOGM3YUlH?=
 =?utf-8?B?bmkzVUhFamFnYXAveUpWcGt6K3Z4cmFEWXl6Y0V4SGF6a2xZMkdEZXkwS1dt?=
 =?utf-8?B?RnM2RTY0MXRvaTkrSms2NXdHbzBpS0FieHdTMmtpNGFkV2RlYW5ITXg5dkc2?=
 =?utf-8?B?clRYWUM3a2luTWlDTWZnZ3d4T0EvM094WDlPc2NBVzJmMVBGVks0Q3RGYkN1?=
 =?utf-8?B?QmtCRTlaREhTRWd2cDdZVHJIeC9BY1RWZjYvUUZzZHRKczFEa0Q1MkI0c2ti?=
 =?utf-8?B?c3RBTGFSMU8vZXpTcHlZSEJsdUhPOTN0NVF5YUZOcThIVHoyYndFbkFHaG9W?=
 =?utf-8?B?Sng4b3RaOWE1c2tUQ0NYWmZ0TEtBREhGTGNrYnNEQXcxa1VzMXB6MjU3UFhh?=
 =?utf-8?B?YTNMc3cvQU5NcFNsRSt1MDVOS09RU1Y5dmozR1BWMjdvQUcyWFFXM0N5cm1M?=
 =?utf-8?B?bUx5YU1WVjBkMlExc2hrWi9NU1d5UHdGdjFwQ2xMeFB0TmlDZ3hJTit1VE9z?=
 =?utf-8?B?ZFFrdFNLOVdlVTVDMExldndRQk5IZXl0M0k5RFR4T2MvZjBwajZjYjBOZ3dD?=
 =?utf-8?B?VldMSlFjMnJJRHltRm50bmF5ZXEvdnhycVZwc1ZPaHEvRitCSXdKRjU2aktZ?=
 =?utf-8?B?MGZSc2EvMUg5aExDV0NtdGRjcS9qU1h2S2o3MExVRWd1S3lkekF0aTFzRkUy?=
 =?utf-8?B?M21tcEppVnVNZDFEM2hhTEExOVcyQVN2QVFDYjRDcUVYWTZVREQxZjhBcUk5?=
 =?utf-8?B?SlFIQjl0K0VyNkZiV214bkcrajkzWGdZa1VmUC92bVByMUJndDhkS2lmdnBi?=
 =?utf-8?B?RDY2NDFwdnVldU1sQTZ0ZHkxMGE4YXdwak1PWllJeU5MdVBXb284Sm9YaUNw?=
 =?utf-8?B?S0hHWXVzc0ZKUWZYOXF5ZWovK2JRV1E3Znk2ZzJoUFROeDlYaTlGVWhhQlE5?=
 =?utf-8?B?aDc4UmtBSlR4OUZaYk9pbVppN0NCRXRmU1puRU5lNm1kRkRYK0ZGREtPSlk0?=
 =?utf-8?B?am42bDEzczJ2MzIxS1JSa01palQyZGJ6M1VsWFoyelVRREhkcUdJejVEMW5F?=
 =?utf-8?B?TFljUkxTOWNRdFdIV0Jjc0x0a01ZbE9YSlVRaVBWbmtVcXRJSUVoMS9UeHEw?=
 =?utf-8?B?U3FKRkZzbzgreE5aSFVaczdUK2R6WTV0SHdKeDhXUTJyblVZWGIyQzFObVly?=
 =?utf-8?B?Vkt4bkNidDUzYWwzSmZxc2loUGhjWGRvZXZXZWQ2ZEMxMFNxLzNyVmZPejlX?=
 =?utf-8?B?UFJKYTgvVEY0N2hJb3RjeHJhMytPRWR5QjA4aXdDRmtQSzJ2WmR1bXBIQ1hw?=
 =?utf-8?B?cU9PMnJQUTRDa2VUVFp3Ly8yMC9kOUhGcDUzc3hjZEhiVjlIM0NhQXBka3JQ?=
 =?utf-8?B?cDBHV25jVWZZWjk1Z29IeTVJMEUzWkVSeHNvNm52dEtEMGJrUUh5aDNzT3Bo?=
 =?utf-8?B?WlNaME1KSERMM0VRenBsQ2VqOHdTQjlmeE9vc0c1YWlwazJoZktscCtCV1FR?=
 =?utf-8?B?RGRzTDN2QlVyVitIQkZvbjlteUpFSmd2OTJZS0ZrbE5Fa0xrOHpFWXJOM0Rx?=
 =?utf-8?B?cENuOU1QODN6YkZqMnp4VjU4RmxDdjNrRmxsVGVwWGZjK2ZMK3U0L09yaUY1?=
 =?utf-8?B?bjZIQUQ3UHgwT0RBRjVENjB4SmpXNTNqMTEzZUtBcDBZQ09tY3Q3TGh3S0lM?=
 =?utf-8?Q?aO+IP5TRqL9/Bc+VGAi5eYq4h?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb13e43-8ab4-40c9-31b1-08dc53f0bcec
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 15:14:20.9472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jVdihUz8dKGATr0kruuYlcrWip2CQ/sBmHubDnOFjP7LsRjaC1xUTGCasy8KbZPiQNLVgU1HwnaMNwX1YEevjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7479
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

devcoredump holds a module reference, blocking the module removal.

It is intentional from the devcoredump perspective to keep the
log available even after the unbind/unprobe. However it blocks
our module removal here.

v2: Accepting many suggestions from Lucas.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_kmod.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index cc242838f..14d51f4f6 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -323,6 +323,59 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
 	return err;
 }
 
+static void igt_drop_devcoredump(const char *driver)
+{
+	char sysfspath[PATH_MAX];
+	DIR *dir;
+	char *devcoredump;
+	FILE *data;
+	struct dirent *entry;
+	int len, ret;
+
+	len = snprintf(sysfspath, sizeof(sysfspath),
+		       "/sys/bus/pci/drivers/%s", driver);
+
+	igt_assert(len < sizeof(sysfspath));
+
+	 /* Not a PCI module */
+	if (access(sysfspath, F_OK))
+		return;
+
+	devcoredump = sysfspath + len;
+
+	dir = opendir(sysfspath);
+	igt_assert(dir);
+
+	while ((entry = readdir(dir)) != NULL) {
+		if (entry->d_type != DT_LNK ||
+		    strcmp(entry->d_name, ".") == 0 ||
+		    strcmp(entry->d_name, "..") == 0)
+			continue;
+
+		ret = snprintf(devcoredump, sizeof(sysfspath) - len,
+			       "/%s/devcoredump", entry->d_name);
+
+		igt_assert(ret < sizeof(sysfspath) - len);
+
+		if (access(sysfspath, F_OK) != -1) {
+			igt_info("Removing devcoredump before module unload: %s\n",
+				 sysfspath);
+
+			strcat(sysfspath, "/data");
+			data = fopen(sysfspath, "w");
+			igt_assert(data);
+
+			/*
+			 * Write anything to devcoredump/data to
+			 * force its deletion
+			 */
+			fprintf(data, "1\n");
+			fclose(data);
+		}
+	}
+	closedir(dir);
+}
+
 /**
  * igt_kmod_unload:
  * @mod_name: Module name.
@@ -341,6 +394,8 @@ igt_kmod_unload(const char *mod_name, unsigned int flags)
 	struct kmod_module *kmod;
 	int err;
 
+	igt_drop_devcoredump(mod_name);
+
 	err = kmod_module_new_from_name(ctx, mod_name, &kmod);
 	if (err < 0) {
 		igt_debug("Could not use module %s (%s)\n", mod_name,
-- 
2.44.0

