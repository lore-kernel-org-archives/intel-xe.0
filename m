Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B904FC47DB3
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 12:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8139510E2B8;
	Fri,  2 Feb 2024 12:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N9R6SJdr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF31C10E2B8
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 12:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706875757; x=1738411757; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Xz/fXZ9ABEVGDlim0Bu69wtkq3t1vlr59NOpkUI2r8s=;
 b=N9R6SJdrmvPrh8kg2RmPGXYItUWn+ihNVnxxh3xJV+nTlI+Qv0gfl9ju
 twQN7OnNNK6nnR1E5QZSVb5UcGnQ7zLBIdwZ7ZRgZqkhKneamOayaCOJa
 tnlP2cPYbXKIu3tNCqlQ8oU6ECgBfmf5iX29hu8zZUcI6+Lu72b9N4vtf
 dE7G5XTNv8MxJ3wLzD7224Z0qvj33Caox3XpdsuY5a11hZueD/6xefNB4
 X9W0hVZnUG2VQ+Ago1NHU+I6IFQLy72e9gcqT9FRZxq5qdgKhaFjOOiXT
 MW826A9MMUvZpZvNxrsc4fyntYWr6BXx2vCJ218TGaf1vRwelgfSMdla9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="3967779"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="3967779"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 04:09:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="30873005"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 04:09:16 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 04:09:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 04:09:14 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 04:09:14 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 04:08:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XkWf5q2BQnPotfFmLlrNKn4sLXAtAvDhmzFlGX/TRlbYKmykoMBB7wXPHCQJYqj7k7GP5n/EVwWdkB5Zb3vLLXenirdKqfE2Wl1tsqsNwkQAZkWFCk2VzcF7ylvxEkMnlFi29pfe2l5lQVgXmqOrtsD/IeS/r2SMAvw3F4j1vPc16n9mahykThXDB5ay4wxUEb1DFbBRLqEWRQjlvKZomMu+9W8pxvGNXX4UNq7LLqVkqcFfIRhnFbSw4SNU9EGmTfDzm7SJdd1gfBthFiTQXq44X3UEIK1porQDb/3CytG3s95rlymZqYiFKvlntWZ7ZKL92HLRUJGgiKLYG1QDdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqZZlFriHEIUwswtNc3z1YVnifxEgUhcRTx0WeF2WbI=;
 b=bBcLMwjn2RA/fdSUA1tLXM0E/EWzGG2nUD2AX1P4kftAnmbDI9hxRSpIATuYdp3QC7QqJa/9y96MWLYLR+75WuggvaiEONdmB0TzwAc+4/OAynBc2Cf8CtvwP1vRPmTHblIwBz7ybrUZEcgzdN3Pp/UV2NbHd10b/rguETSrkqBn0+RX+DJG2hIAZ1Qrcr7NpRqx8VnkaGb3u8hkK7dB8vdo9hmQaQf4yOl4vbx0lzialfhETAxtCjz8tixb/Ay6jlm3pzWU8Om0VnoEl2u/rlT20HLpZswqL+siA64j5IMu5V5E/2vHPhvdD6ZLG2dztNg0YdlEVV7jRrJ1SqeU9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH3PR11MB8493.namprd11.prod.outlook.com (2603:10b6:610:1bc::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.26; Fri, 2 Feb 2024 12:08:43 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::a818:a5e:b1b1:511]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::a818:a5e:b1b1:511%4]) with mapi id 15.20.7249.027; Fri, 2 Feb 2024
 12:08:43 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [CI 1/4] drm/xe/guc: Allocate GuC data structures in system memory
 for initial load
Date: Fri, 2 Feb 2024 13:08:31 +0100
Message-ID: <20240202120834.1187656-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P195CA0079.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::32) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH3PR11MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ae786d5-f402-476f-bcba-08dc23e7b332
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BOp/p0FBlpdHiyJB8eb5m2LBEaWCFY1kds3y9hctuHqkCvLLFrdvnsBbfJB6BA2yzcfAH4qZ1wfFenIP8INoQCOEwA9G2Da/uDBqZ+Qy7R5J5kDnKU9JEYj0r3X9UTD66gu118GcD0wanB1/54t+TaLYkSH8BZqau0aCYBPN2CBtrOCfIiRh6ckN1I4/8gu77TdI2HJQTBIiOmKP40Su91/OXjYyQ4wQT2hMZ5Z2GyeTURXP96DUglrxcuOwbyNa7wHNU8vzwWFr5/wR5/orpK+iZmBuFfJMQPUSpVr+OtU49fCbd0DShlRPh9ZeoVUAG2wGKSSzmsbAXPp0oRWnk6SMDy2e3n8XFEvQ+CaHdgfd8HzEqfmTByj2RInfdg6Ds6sMcQ0089VwQ/U6ERC1f2zMEkYMiKwtZxb15sMKu2x87OMayy8kb7obNInyciBSpwtSL9aVN6NuY1RJFgX3dWduAXRr3rLie4vBacR4KtDp4zxWQGQVmoKadF2bAf8Hhd2KVpK21haNaeKaN8vxBetP6546kXMBYdQIq4HgPUNQDxjCgreAXXM39KT9bqeLRq/pYnvBhypZYtUqmue9owbn2CrXJu0BnY1qsJ29tO4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(396003)(136003)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(66946007)(2906002)(5660300002)(66556008)(6666004)(316002)(66476007)(8936002)(8676002)(6916009)(82960400001)(41300700001)(478600001)(36756003)(38100700002)(86362001)(6486002)(6512007)(26005)(2616005)(83380400001)(1076003)(6506007)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUtHL0VLOWFBK3hGNndFSDZRQnFQV1lPclM4R3hJYk1Id3RnS01QTjVwODM1?=
 =?utf-8?B?R1lEZE1CVU5BYnJ2NWVTUnhhbE5ncEJDRHFzbndtdGx1TnA0djVwQ29XNXF4?=
 =?utf-8?B?T2tBRmxuZXV5U0dUc3dtSHk3RFFSa2NJcy8vdE1oUVhCREYzSk9MSWl5OUpx?=
 =?utf-8?B?dkZyZTNzMzlrVDlKK2xXY1I1Q1IvWFFWbVFKVFYxcm1TZndCT3ErVFY3anBq?=
 =?utf-8?B?VjRiRE5zVnlrTWt4NkJ5ZytBR2xObjJCcUJOU01XWTc2SmN2VTE5QVNBbVB1?=
 =?utf-8?B?STVWdWppRFltbnZoVmVDa0pCbjNwcTdaOHJSSmhRZ0VnSGxGcE5KVitOZk1n?=
 =?utf-8?B?YzBrSjVTUVlNZnVscVd2Sy9QNTNOQVFSaVdxdnplaVEzY3RNemdaeUJFOTZH?=
 =?utf-8?B?alhnSkN6RFE5aXlEeWd1SHdBeG4rOHY0Yk5iTWd1MlZiRlFSU2lrOC9ZYlJj?=
 =?utf-8?B?WXE2clFNK2xuRzRTbU1FQnh1VGhocUU2R2FCclRFandDU3p0M2lyVDY2R0U1?=
 =?utf-8?B?UjNFcnVxT1M5dDJoQmJTSWUvOHlDcUxVYjFmZ3FkbnNXb2JTN2RPYWduZ2Zn?=
 =?utf-8?B?Tk56SXhteXU5S3BITTRpVzNIZWVOMVVVcFM4eUVKR0VpYkVxV0lxWlQ1TXhx?=
 =?utf-8?B?bGRwQUNCV3luZ0RvK2ZBckh1Q0xRRFNNNlIwa0NtWHNZNWxIY2o5Vi9hYXVp?=
 =?utf-8?B?L0k3alNzYjdIeGppY0lqOWh6VC9ibHF3MnpjSnl2dGpDUkcrandSTVhDSFBP?=
 =?utf-8?B?TmtucmNtaFV2bEJGM1FxY1dvQVV4YW8zaVpVeVpmdFdEOU9IRm9Fd0ErV3Ro?=
 =?utf-8?B?dHQvZ3dmeDdESlpCbmVBQ0UyQk80VXhHRnNHK01wM2lqVDQ5Y3ZiV041bndM?=
 =?utf-8?B?TENXWEJISG5BWkM0NmE5WEpISnh1cFRCNERZMUZYSDRHcnBzWkxRYVl1Slhw?=
 =?utf-8?B?VVZvTW9WaldaTTdzZVJwY20xbk53Q2tNOFYxSTcrdU1RejQzK0hQMTU5T1ho?=
 =?utf-8?B?TENnVlI4SWY2VjNvSHZUbk5VbzNkTit4R3dLTmREN3FXVGZIOVVCZWxNL29O?=
 =?utf-8?B?QkduMDdnTFltUmNrSzJUWStnaFFRREF3aTJkTml5bXNXTThDMnh3TmRrVVhm?=
 =?utf-8?B?RkRoaGNzTjFXbHprb1BHMjNka1YzaXFXQVd0dmlUaVFYMzM5b2dWRXhwSEhk?=
 =?utf-8?B?OWFTYnM5ZitIeWR1UkQzMHUrbjFlQnZJUmNDNC9pRnBSMHU2MExKSXB0MHE5?=
 =?utf-8?B?WncwSlIxU3hsWGpUdlcwS1RFcHNDYUlIb2FEWTkyOGwyMkJzRmQ0TjlIWnlO?=
 =?utf-8?B?WDVOWUdnMm1EM054bi9EOENHSXNqZHRDaHRaZ1hOTHd4dCtBalF2OTliYTdQ?=
 =?utf-8?B?ckR0V0lDYzVhd2Q4YWQrR2tKQWdXTlBhdkZnUytsU0x5VzF6UDVFdkcvbWMr?=
 =?utf-8?B?WFA2UUcxdE9jUVNEc2pCS2JpTHBvaVdtVXhENDRuZUtac0lqcFhGd2FrcUVv?=
 =?utf-8?B?TFJHaVFHSTFEQzNuQkF3Nk5zNDFrK2ZwN2ZNVG1nT1BWM1VTZzRGQlNnL3Qx?=
 =?utf-8?B?Wk5CUGErK3g0azZuL2RPMHQvQTQxTXZKV1V6WGlWZmc5SnFHU2ZRdXNZVjVT?=
 =?utf-8?B?MVYyWjJpTGVmRUlaNElXZzg4Z1lLcitSSTRKeW9vK0lvTHdMN2tCbGs1cHJW?=
 =?utf-8?B?enA4YS8xMUV4U0c5Nk1GZnVRR243TTEvam1zSTllY0pGemxHQkhHeWpzWlhH?=
 =?utf-8?B?MkF5MmpXaXh1WGF1cDJ2ZHN4R1RWTEV1S3dVTHRxcUNWeEIycGJVdWdJQktz?=
 =?utf-8?B?SloxNktwT0MzTktBUE5QNk1tV1FVU1RldmhCcjMrWGhLQkp3OW5MNVBmR3M0?=
 =?utf-8?B?enJUamt6MHVxYVdzRDBZRzJEQy9jM1ZseTZEdmN6RFh0NmxqQlZSUWRzNVZj?=
 =?utf-8?B?YUpaWE9yNkNCQlQ1dHc2T1JvMGtKV0lUZ295NE9NV0hjYmY2Vyt3enNodml3?=
 =?utf-8?B?K0xzZjQwSkxNVjRSUzJleDl6dWlFZHMxSmtSTGFNU3lzOFA0UXY5S0N3bTJq?=
 =?utf-8?B?dzUvSlVCWFRYdUdkM3l0bmtZeXVMZVE5MmVFWS9kejAzejFPSFZwaE12SXZT?=
 =?utf-8?B?c3EydUErZURxR3hib0VyRG9lRU9RQmt0Zk9oSGQraUQrbU5XNVNuUlI2R0F6?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae786d5-f402-476f-bcba-08dc23e7b332
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 12:08:43.1872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: alRpkGWsr6fHX6Xvd7l/bUGRdWT4Rtru1ZnyN3Ki1KSvRQq4S6snj6dfZ3eb52ovmPEPEP11RNaTI4kZttWczFWDq0Q+anzxtw5VeDEfIdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8493
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

GuC load will need to happen at an earlier point in probe, where local
memory is not yet available. Use system memory for GuC data structures
used for initial "hwconfig" load, and realloc at a later,
"post-hwconfig" load if needed, when local memory is available.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 32 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h           |  1 +
 drivers/gpu/drm/xe/xe_guc.c          | 34 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ads.c      |  2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c       |  2 +-
 drivers/gpu/drm/xe/xe_guc_hwconfig.c |  2 +-
 drivers/gpu/drm/xe/xe_guc_log.c      |  2 +-
 7 files changed, 71 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d6a193060cc0b..7df87fbad0938 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1605,6 +1605,38 @@ struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_til
 	return bo;
 }
 
+/**
+ * xe_managed_bo_reinit_in_vram
+ * @xe: xe device
+ * @tile: Tile where the new buffer will be created
+ * @src: Managed buffer object allocated in system memory
+ *
+ * Replace a managed src buffer object allocated in system memory with a new
+ * one allocated in vram, copying the data between them.
+ * Buffer object in VRAM is not going to have the same GGTT address, the caller
+ * is responsible for making sure that any old references to it are updated.
+ *
+ * Returns 0 for success, negative error code otherwise.
+ */
+int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src)
+{
+	struct xe_bo *bo;
+
+	xe_assert(xe, IS_DGFX(xe));
+	xe_assert(xe, !(*src)->vmap.is_iomem);
+
+	bo = xe_managed_bo_create_from_data(xe, tile, (*src)->vmap.vaddr, (*src)->size,
+					    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					    XE_BO_CREATE_GGTT_BIT);
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
+
+	drmm_release_action(&xe->drm, __xe_bo_unpin_map_no_vm, *src);
+	*src = bo;
+
+	return 0;
+}
+
 /*
  * XXX: This is in the VM bind data path, likely should calculate this once and
  * store, with a recalculation if the BO is moved.
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index db4b2db6b0730..ff919a836d163 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -129,6 +129,7 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
 					   size_t size, u32 flags);
 struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
 					     const void *data, size_t size, u32 flags);
+int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src);
 
 int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 			      u32 bo_flags);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 868208a398295..8c10546e387df 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -272,6 +272,34 @@ void xe_guc_comm_init_early(struct xe_guc *guc)
 		guc->notify_reg = GUC_HOST_INTERRUPT;
 }
 
+static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
+{
+	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
+	struct xe_device *xe = guc_to_xe(guc);
+	int ret;
+
+	if (!IS_DGFX(guc_to_xe(guc)))
+		return 0;
+
+	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->fw.bo);
+	if (ret)
+		return ret;
+
+	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->log.bo);
+	if (ret)
+		return ret;
+
+	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ads.bo);
+	if (ret)
+		return ret;
+
+	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ct.bo);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 int xe_guc_init(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
@@ -331,6 +359,12 @@ int xe_guc_init(struct xe_guc *guc)
  */
 int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 {
+	int ret;
+
+	ret = xe_guc_realloc_post_hwconfig(guc);
+	if (ret)
+		return ret;
+
 	guc_init_params_post_hwconfig(guc);
 
 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 390e6f1bf4e1c..6ad4c1a90a787 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -273,7 +273,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 	ads->regset_size = calculate_regset_size(gt);
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
-					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					  XE_BO_CREATE_SYSTEM_BIT |
 					  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index f3d356383cedf..355edd4d758af 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -155,7 +155,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	primelockdep(ct);
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
-					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					  XE_BO_CREATE_SYSTEM_BIT |
 					  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
index 2a13a00917f8c..ea49f3885c108 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -78,7 +78,7 @@ int xe_guc_hwconfig_init(struct xe_guc *guc)
 		return -EINVAL;
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, PAGE_ALIGN(size),
-					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					  XE_BO_CREATE_SYSTEM_BIT |
 					  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index bcd2f4d34081d..45135c3520e54 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -84,7 +84,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
 	struct xe_bo *bo;
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
-					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					  XE_BO_CREATE_SYSTEM_BIT |
 					  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
-- 
2.43.0

