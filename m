Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CD8C25B77
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 12:22:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F066510EA28;
	Fri, 10 May 2024 12:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lojSvuT6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E6F10EA0F;
 Fri, 10 May 2024 12:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715343771; x=1746879771;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bKHXiRVpt3+3SwZsYvSX7aZ8bQjFnei6Of4p24yhOC8=;
 b=lojSvuT603x75tv4Qehqs3WTG17qMrMC2Zw3fjnIGZPKAqoAfQK3UccL
 p5LLVCyv9zYBo43r05ltU+NArMIzOywUSCmy0jpAkDUedG7QklR+PeOES
 D2NEq2Kg6GSHUWCs14WfdY9+CRolCl8Ykrgg7+y12aLkIDg1NreINgwaG
 zIQ+v/8YjUHFOMAzcFl2gY1YSx75TSf3hxc5z3diem0lAw1bY55bdeADI
 Tg377XPvRycyvpXcX5KO78T3i++JYSXhfozjahgIX5NivZXNprpDjSI2M
 qY4y1+RD/O2ZMCC/xB6qGz+out2dfTO0J2Zqh1vTmBucbDxIW8C8jzJ4j g==;
X-CSE-ConnectionGUID: Pyj0YoA8QPawm0+xnAcp1A==
X-CSE-MsgGUID: lOXzPYGxRK2uZXNFqpGfvQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="22727639"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="22727639"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 05:22:50 -0700
X-CSE-ConnectionGUID: t5H2tlvtTq29QNem3w2UzQ==
X-CSE-MsgGUID: AKdhO14uRemViPHBkK+uaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="67078096"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 May 2024 05:22:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 May 2024 05:22:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 10 May 2024 05:22:49 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 10 May 2024 05:22:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LpGENaQWJuKSY1DGMU8Sq63kWCkDYkPwsLOIEX9j7CIgocsmOl5cxGEDsOwSysuiNhB3Q6RGVis8rscDaEbE1USIPcPbA+ZPwd1/I1t41kC20FNQ+YNFfYlehp0ZVAn2ntJZKgrXB4nI7gU1T3s/+9g4z4qdeLucJbkdk2iqECWqZ8CxnBj5wyPK7/UIEXvhzJ2L2ULQupUh4SbYn0tqxvYobFeU4Pd3fg5WRLhr13A803jThDnML4zsGIQoph6r5mxb09dQz6AuILI9hn6yejwtGksbh1XybZNiEOz+INe7dNuOGfoLIHyaGPlD5mAAJSbll/t7K6TNrUarM1EXnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2S/nwKtZLnVkKVZ6Mr2ru8KpMnXJMY/vGX2Ikf9h8g=;
 b=SOwyqVbCaCwBZ2/DxKHEkZbWHZqxFW0THNYU7N3xrLF3ajlJ+iYPrZr1xsistr0RnP3aJgpNWAcN2PD44tC/HLrTcYerXI2mksM+pBDhZtpzxbfcIDSEThkmLesEAOrSNQEextDIQqRVc+c9KDrBDw00C693ls+TPotDu1jHjtk7DRjjHRZuCeR4fxjr4s107q+SLcnFuxH0Sk5AozJGGUerZ3xWcNXJfKuaodahB8VB+fY7E2INN4P31YacJb8xMaebimZS/50M3lEHCnsrn4LLGz2SzdYfgx11m8wmm53YEPliPqM4KyOv9PbBFzRLkLVnuqEU0ciIRCHpJoVipg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4901.namprd11.prod.outlook.com (2603:10b6:510:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48; Fri, 10 May
 2024 12:22:46 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.047; Fri, 10 May 2024
 12:22:46 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 4/4] tests/intel/xe_pm: Convert mmap tests to use
 existing d3 helpers
Date: Fri, 10 May 2024 08:22:30 -0400
Message-ID: <20240510122230.724229-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240510122230.724229-1-rodrigo.vivi@intel.com>
References: <20240510122230.724229-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0089.namprd03.prod.outlook.com
 (2603:10b6:303:b6::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4901:EE_
X-MS-Office365-Filtering-Correlation-Id: 73362ba5-8f54-4933-1266-08dc70ebe675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TnuTG5qrPlp6NbmRst60xxM6QWUBCzG/7yUCykRjHP05jb2UmrSbNRk6c/Gu?=
 =?us-ascii?Q?hUOlxAHv2L6/dpXqRYLzJujuzx5S8AptWMl+zo/Ej/wpu9J85kCAQWCwg1+0?=
 =?us-ascii?Q?oMPckoCjK+bcwqaLTMe8OSVonf9TSZQJbLLPws0dyIa2hYJzsz2QJbolRQKH?=
 =?us-ascii?Q?EZHBO382Oe0y24pqPgZr1z6iTr4BOe43Y/BeZKCb3I4uw6UZNRajYM3etSBz?=
 =?us-ascii?Q?1Oi0XIOlCOtZSuYnxu6IVLIzr/v8DvJqJHZj6funeUduo7+kJgyfqGYvIvvd?=
 =?us-ascii?Q?nYxytcAiDMa5+8YAp9enyTuSpBiV1oxfihBy0Wjr9kRM9yow6V3pAdMn00X4?=
 =?us-ascii?Q?N7xd6lFvblJhfoBR1TndTmffyPMLUkzH1P6iO4ZAOWECVZwgS7W4/FF2NJ1b?=
 =?us-ascii?Q?lj4Wftgz9+E7W1sfV3Ll6Jvv3Hiw/8JWGDxeZSFAFqm/mUUGEcuK3AK0If+G?=
 =?us-ascii?Q?CtVLCrqdkFNUR8oouXNuqcCFmgmqeliLvfpSxtqwuUZ3doaq7gEN3g6ndTk3?=
 =?us-ascii?Q?LDMepooSX3jgn1V0ASPw/LirBNpPBXBN7VTDVmpkeyXKBZiFOkQ3xSi9Zfs5?=
 =?us-ascii?Q?B+ZTnPNqg8OgfpFd8+nQMchQ9S0YWJuKCty7PyqnF/p29HVhSn9GaaniV50a?=
 =?us-ascii?Q?xYVJpYcoMtS1K+wxv4nAIn1onzWztvEMwlidta1pCT4w/ScCt+3hLoD4nOYS?=
 =?us-ascii?Q?v6jAaX9JphJ8dBwqOnSl7Rv5xKklk1wB6/PiGXaGbtTw90Z8cPk1B8h9fNty?=
 =?us-ascii?Q?65XmT/42+G3CxfRdaDx1YWQDrDGMOJN2pz3UbmGiNpxn6UgZtTBAAtrhmXqJ?=
 =?us-ascii?Q?lQ/dqPeDukJATaMArPUr2eyUvnxF2vyahdpRVLIrjFRvKfMjzFyuAs7ZtAj8?=
 =?us-ascii?Q?gIsGe1AtYwNRTA9kS/ELn8o9kYL+e+4/O7CvnlTGx8BACjkzR+qREHREPZkr?=
 =?us-ascii?Q?bWxQr0mJDHGtS3jovSUaSbzCv0KHxBqsVgsBszXF8DLWH1LBTtltB+B/sTwM?=
 =?us-ascii?Q?QD1UJweFT5cCkWwwpKTPDLjfbEYhGDELFtYHGw4ZznzJ/2/02a2gCZCwZ6pr?=
 =?us-ascii?Q?AOOGTZth1ALbyZWQrkkWNmW3myznOQFmxtEzZUhkp0S0tT6obdZXozepPeCa?=
 =?us-ascii?Q?8izJMNzpdYo0lawhqa+l+pYqwKb3yJXBd6z8h6HQ/FXl86tFaADw1pwa/NDY?=
 =?us-ascii?Q?xb515UGSJLE4V7EHmzhsvr7kwZ22hdwd2oNT4gTgdEEBfjCzT+nATfvTj32z?=
 =?us-ascii?Q?RXgG8eD5iIOPsGhAsVTkBbKUdez7JahZ+Ypbard3UQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B0/G8E0jLDjkw6UhSwcQ2wkPY5E0HIXSrNGqHBTdfxlkhP+MctrgJv6L+hWa?=
 =?us-ascii?Q?fEFhKWxozUF34Ea6nu2Cc+J521V7vrppdYpL4rvhW7pnFk8u07lvAKKgW4if?=
 =?us-ascii?Q?0GDJi/PxoiCTA5YMPBiVYoGadizA/PFWYKmYVnhmkgC7SSxcTupBs5xyQKog?=
 =?us-ascii?Q?kLili33F1RS4Bwvttz5PdX/4KZAnPHq/Dn/CqR8nAechRr+1FrufnPVLz0/j?=
 =?us-ascii?Q?RaCsBasSxTGVwJbYs7XlQD/rU+iKL8diLMQrRuk5SLcQJuNODD85P24ZiK/b?=
 =?us-ascii?Q?6qM+kJdpjZ0pPwBshybQx+cwF1VK3CkPzBtiKkvZtGnp/bW4KYIssryKZZqg?=
 =?us-ascii?Q?opPGAmDblfHpChyNTMU+4LwZAcVW8yIo0PP/zmu3sk0crW0x6IhcoXvJ6vV/?=
 =?us-ascii?Q?WE6/MwrkD8/1lnRmx1GfRDa/v9HCzHyNC72FbHtrgB67ZGn1i+kV7no6FIPV?=
 =?us-ascii?Q?RH9L4fKkLl9oRp0fklNb+MZLBsAgU+NmFGblEw6KNS+QKpUdcF44/n0+AVbJ?=
 =?us-ascii?Q?FuewOq7TnX2/6jYXOqvJ5KX+53Umf6wQ1BUdVng0pgWbQ1GfWF8LbCLuFbu4?=
 =?us-ascii?Q?XfWXLABnR+UTJ4YYc7SLITqTpY5qmaX1X0BBBRuUfKlvhJWLihb39e9OvoIJ?=
 =?us-ascii?Q?Be10WGMWoMgw7KrcmCAYAMQqr8fZSlZm8HXtndefPLiwAsuAoLZd8EDVrWi6?=
 =?us-ascii?Q?Dt+VJ4YL903OOdkAy9zfG7LP+zWbdspBP2ZwXO6gdwGHqX6Meov7oUVNLqIQ?=
 =?us-ascii?Q?uyewCI2tGeIbH6cV+OyWrkeI8NJ4YyYRPPhNuuACrYnKHaAR2lo8ZDfFLKu1?=
 =?us-ascii?Q?kHSeKMNQPuA9FkBga116ce2tAP9/5mqkfxbfNBvmvlbP6uSYZ32Ru5kvUyOD?=
 =?us-ascii?Q?0PQlcsewW3WaOrM94tCU1nuS4z5A52kU+V+pafFjCMDu1mxk9BpgBBzHbPvj?=
 =?us-ascii?Q?a+8tX61R+gei7uzEGk/U+mRVoVGGRK1FqvR7RQUpMuz/NpFAhxC79++aFb8B?=
 =?us-ascii?Q?zTPgj7+8MLimiV/PGq0zqSwjmdmxQV/vFvkqz9QhGxOw65fAS+6F/5KMu1K9?=
 =?us-ascii?Q?PVBN1GRHe8nvX+5Qw8AgcQTjcjhxS/Bd6l5NouWdzihx7u/M1a9sLRUbbUdH?=
 =?us-ascii?Q?64focfBfHJcJNgotl4R/hoe6/bF8Uskpsnto4Sf4NiB7XTEYiA7ydjP2rW05?=
 =?us-ascii?Q?kNWGlIEx22uKJn/5ZCYfUzLeZu78BiW27KASftpHCV6L+Qqx526FcBj/tS+p?=
 =?us-ascii?Q?ujDDoMfLMZWXv5rvO0zTqNYk5fNWU5groHedJ5w99aU8aBcDJ5BgCRdk0mbk?=
 =?us-ascii?Q?WU26qt1j2gdVA8DyfM4Jy3yhNwRugJBm97+ZN6aUdtc5FoJBO8fRDPDYuIlx?=
 =?us-ascii?Q?ymLwkmY/4eDxLf4XIJt85ME4fkxNDUpjBAa5QuyTPnTfarAXFbLmelbhlD0E?=
 =?us-ascii?Q?PHpNRSh+Tz+lZwFfXLa1Uwrrw/ywWyD/1JSFf3NNKs2TU31uaDJnAGnhKXJB?=
 =?us-ascii?Q?vvy9pKeuZnO4R+meKXppOHg/EnCsFmDN6mbe+K4+0JVGQPzLUsoUgvXsxdyH?=
 =?us-ascii?Q?gTo9lArZVRl5SRxqsTlCZGzWw37wTPPVIH4a50mSe31727m3uf7Ydulwql4i?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73362ba5-8f54-4933-1266-08dc70ebe675
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 12:22:46.7353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ClfMtj9NB3lLI6BWnjyCk47UsWgXjoJX1qwp+/z6sAdfVmTC52GXIRhwtQpmNQFn8tqKNsykmv/yPfMdvr4rrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4901
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

