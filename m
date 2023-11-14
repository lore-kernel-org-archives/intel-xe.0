Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21471C4167D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 11:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F7510E443;
	Tue, 14 Nov 2023 11:45:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A09310E443
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 11:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699962322; x=1731498322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+BICbAg90vIZkXTMjsyP5hKgME+VL+xIfv3MFOL3vV4=;
 b=Ppz5v7tcGwSZTgywFxek1QV3OgE2i1RuFc6BWkAJadIFwtzQsr1yqiHo
 PCaco83kbtWXxSFoUqixKO5AUUNFEdncBpacHsWssr93ligE4l9aX23TR
 zWhkXbtf4sqPI+4ZFC+UgbLmkIEIGB0UONVByb6kXzerA+Q1Bxf1VZ9xt
 83QWKh/vlrNvjMsDc1Fh108SE+prrz0cpF+aQoiiaNLlO5Dfa983S/v7U
 hHPIn8lT+BacY2rcVJaQhTqYkma3wQkxQmGrg57DHAAtNszV8hmWPnuuw
 SnznUbAYJvLxjZ7E/WVHJk6QhfHYn69GhsUX6+BtcGkW3gU63vgtjfC9h g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="369982128"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="369982128"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 03:45:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="835008987"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="835008987"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 03:45:21 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:21 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 03:45:21 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z51flFJrQXiRoIs7EuH4VCl/Dl33vcLAKo0yhWbk31bLQxqF970Nw7JNo5rM3wcfI7AQBSdUenSpCvzRmO1UIAZg5ClQnBPYKr5NA7Hzp2mJWa5d3QeTPbDOPpqoaAjFRjy2Lfl1vHy0KG28yNgLoDzkkCc31XAVULpbLibCJvz4BsyduSkVmKhvH6aaAVSKnkXuO0BeAxI+JlC5aSJQ6vgpxsyKCx1TR74yYoi+t2TpYqKMkQDAV981sgTAT1IAD9ZFy4H1X2xaNKT/c+ZqrAINJc1BZjgwnxrhCBnLH7NsH1CoAK1PpeM99/KDZ3gIKRhRzAcZh5UWfrJLbIkceQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0UlxCKER3C7CVQoHEKzrrVp9C8KByYZnjS1xxgzkwk=;
 b=fzFocrVcrZcuLFEINZxR2bvIAEO3jZm1cdk5S/NcqJcBuokx8awe8+K8vsKGI06wu5TEdZ83DPoV8dXFQ5JpBZB280/T1koID1KwnDHKs4jfg/EfJyDK8ChWmcstFHDcS0UnSqxiVobGNef+sRcBLDcgLt+RvU0MIvyj/2b+ziGI1BrjDLJNeaRkxPxW0aDHzqOH9ZJL4DHjrpTXzrCqhHzOeoUPZMQPBB9lFnegYbfPFBN9H3+PMeU7ls1fyZ1BwTN/zPE56I0ES21w2iXXhu3N+mQKAynY8Lds8k+LokdUnyh+01ETUyZgJXogMBlL/siSY9cJM95asdrl3KVHCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 11:45:14 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 11:45:14 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 12:43:53 +0100
Message-ID: <20231114114405.2207747-9-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114114405.2207747-1-michal.winiarski@intel.com>
References: <20231114114405.2207747-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH3PR11MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cc878f8-1744-4994-2edb-08dbe5072a61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RGMvqMBi8SqXWfXQexQngTBoaaCK8xyZ11IS+3wOJ3tpBTk1q9Vr0pgE6Rh/D3d+Q7q+sKxqMKHqpcVD7xh/V7MpUf1k73mzsDyS0hWQUYGad9dZA7u1GOkjhkJ4aQVCNfJC+hTIZktcjnU78Bg4UEG5d5vxP1n0TT8YWmxpIU69Aw6CV0sq/UNS9F+5d0IHzVoz3NFwiLFfnBU9+MUz+YiH8RswJRISA7iSepHUk+q6zIHxy3wOaiEa1UoRxqRMUV0+58weg/ytmWlgsfA7EeoCb+9UIfGoxy1UM8jbQ9hPOGxR43gU7BSsDNBlbVyf5ZCHJDllOt7leCpD5DDvBXT9J1rznw9MJokBzi+4hL5TYdupp6qvQ6xkS74oFI8Fq3g8MGiFyv363ZcjcFqumd9QDtCQnOyQP17tlOD6kou1vnB/+z9TRGE01mncbG52qkeE8kqSHHImzzOb+S/MJ/F7n3HCCONiYaJ5W/Gt/k3OPUHZi/UZflIGLIo+JiGU7ZoVosBalYPbAx/WrdFCagJ5c31KtirkcB3smyFHcWIkFdC+QZVGH4NRBx4I8gKP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6666004)(83380400001)(6506007)(38100700002)(2616005)(6512007)(86362001)(41300700001)(5660300002)(8936002)(8676002)(4326008)(36756003)(54906003)(66556008)(66476007)(66946007)(6916009)(2906002)(316002)(26005)(6486002)(1076003)(82960400001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YU1IUFMyTThTc3JFM0RTS1VEMXBqbDY3K2lsVk5rUzBRNDBqRHNZd05kWi9Z?=
 =?utf-8?B?L2hqbWp2ZUhLdHhabzJyb1JOWDFVUG9vb2lNUjd6R2hhemVKbXR4dEt5Q0pZ?=
 =?utf-8?B?YjV6ZWFUMW85YjdURVdnK1NNR3dRZURSL0djT2NseUJhODdzV20zTC9vRWVJ?=
 =?utf-8?B?bmN2MW5EMUNsMThWQ1ZiOUY0R3ZJcnVNZ0w2NmJvczY0M2hhOUY3MHhyMUF6?=
 =?utf-8?B?N2hxNUhTYUNiSlZLQ285NmJlL3FUWXBFVmVuOXZPUzViZzhZMGpDVU5hU0kv?=
 =?utf-8?B?ODNEYnd2RXd2N2Q5RGxYb1I2cElDMFZ5K2x4dExQR2c3aWN6UDJ5bzAxa3BI?=
 =?utf-8?B?YzNqOVlwamZBUTljcFp5QVlwYmtsYWV2MStuaDhPSkZTUm1SVCtMRFhuS1FR?=
 =?utf-8?B?cFJaWE5qd3pjSGRiZlhlbjVDOXV4MStEb1FYL2tyS0puWjBTY1E1MFhoS29O?=
 =?utf-8?B?WWZwYUtvc1lGcmNoR3h3TXg5eG5USHg0dEhNK1JuY3pCZ2wwQUFmaUZyUlFI?=
 =?utf-8?B?VE1GTFRHcURDNEJvakxtTzAzN1lFYkVxbC9VaCtubEFEejA5MHkwUGwvall6?=
 =?utf-8?B?b2UyUzZFYWdvbklVem9nRFNSZG1aYVV0ckdFUmdhYzN3Si9IN1ZLRWVyTW1I?=
 =?utf-8?B?YjlsSU4xYnBxT0VTTnRFdFRwQy9nVnlSZ09oZG5ObnNRTG9hdms5ejNRMUor?=
 =?utf-8?B?MGhUVUpjUVJtTCswL1lGUTV6SGxMb3ZZYUpXcHBENVIxaC91UjJkVnNzd1Bh?=
 =?utf-8?B?TEgrUjJCWmdsWEp4Z0laYXpEWC9MalJjUllhM1RjZkpZVktIWDUzNVQrQTN0?=
 =?utf-8?B?Q0FiWXBIeFJmUnlzamF2TnViV0pxT2lOSk5RTFBGRENxOGxWVE9YYmR6WHBk?=
 =?utf-8?B?YzZFb3pGbzZ3dEFYcFAvb3AxSFh4ZTRNVGVvK0xsMjg4cU5ndThyNTVhWTJh?=
 =?utf-8?B?N0lKRTBMK1AzSlVzbDNDR1dEbThkU0dSYmliVTQ3K1BwbVVVRzQ1VTIzYVUz?=
 =?utf-8?B?TFVIL0hsMHBhN200Uk5pM1QxYjlyaEpoeFcrTWxVUSs4NUZjZCtWWWhVSWt2?=
 =?utf-8?B?Sis3ZjhXaEtUSWNpQ3lMMzE3RDhoelI1WTFla3U3bThQRVRnMktDc1hJSE5B?=
 =?utf-8?B?cEdFMzExalMyZGhYNDB2TStZUGJXMUdjdVAzaCtMTGk5UnlxeEpLTGdNRVAv?=
 =?utf-8?B?Nk9SdGExZVlkRnI2bGlaRTJuMHpZZm5odERWNFdvVm50ZDcxYUlUbGUzalVn?=
 =?utf-8?B?YXQvL0lXYmJlTnBuZVlndW9NUXZrMDh0MWw0Vm1FUzNuczZkU0J3c1JZcVdT?=
 =?utf-8?B?ai94cllGOTcxWmg4SWtIOHFQQTdkaU5tb3owb29qb0tUN0JjWG5udTM0YkJB?=
 =?utf-8?B?blN5MTVtNnB4a0swVWFFVkU3VG01SlY0M0lseXlNYUU0N1ZheHAzQXFSK1du?=
 =?utf-8?B?UmVyWEZ4OXdnRjlKM3Ezak9qblc0aGRGdWYvSG8xVFI4dGVlTW9PU3E4d0ZQ?=
 =?utf-8?B?N1dmRUZ1UThkYzV2UUxWNnM1UWZtemM4aDYyUmRuUzZGMDA5T1dvazBVeWh3?=
 =?utf-8?B?UDNaZ1VoYUxVcDVDOVlwVG92Q2R0TjQrTnk4TmxKcEcrai9PSzBiY1dZRGZx?=
 =?utf-8?B?NmZBcUl4NmloSFAyQmVEckJ6ajZ0UGhva3llREx3NGRyWlNtWkkyK0phc09B?=
 =?utf-8?B?WitNOVk5WTA3RTExb3BQOTQ2MklsYXZ4aC9YS1U1eUM3ZFUyT2xCNC9PZjRh?=
 =?utf-8?B?ekkzN0o4T2FGOVhrb2dzUktFNHVLOVBkd0hQbVNjWDZKMTRyVlFRTU1nMW9h?=
 =?utf-8?B?cXp5cHBtbXhGRVU3Rk45ZUNlUWZRMVJwbDBlaUtvUmpOVjEwMmZxczYvOStJ?=
 =?utf-8?B?eWJ4dmFuekFrM1VYVng4ZHZKdm5lNWtrOG1oVTVIM3VpRGNNQURCRUNkZUJr?=
 =?utf-8?B?Rm1PWkhKVUVCSUQxdHBMT3kvNGN0emo5cVAvY1gzeUlwSWRaWkEyMTNCNzVZ?=
 =?utf-8?B?dUFmNVJIVGk5SUMvVGtHZTJnWStjazNGTGR2RVlUcjJTZWtXTEJ0K1haRk1L?=
 =?utf-8?B?ek9TUWhqdm5YNFgyN0ZWNjRreUFuV2FnSWdPWW9tenNhYmlyVStTdFMvaUxM?=
 =?utf-8?B?VEJ2eEdicU44Z0Q4cDJkclg0SHIyaWQySTkzTWJ5eXBPcWdwdmR1Ukt1bmgv?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc878f8-1744-4994-2edb-08dbe5072a61
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 11:45:14.2719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WXRLPjbtY7CTDr9uAwayANz30w4UrDNVJASq9fdfiwJyz8SlJC2Zb/qT11PszYkqznZhs3JjW7L5xxxzJIdYPlQ5x+RpzqpsbKTBFuxBAKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8707
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 08/20] drm/xe: Map the entire BAR0 and hold
 onto the initial mapping
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

Both MMIO registers and GGTT for root tile will need to be used earlier
during probe. Don't rely on tile count to compute the mapping size.
Further more, there's no need real need to remap after figuring out the
real resource size.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 5a6053a61f301..acf6dfca0bc46 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -299,7 +299,6 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
 	size_t tile_mmio_size = SZ_16M, tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
 	u8 id, tile_count = xe->info.tile_count;
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
-	const int mmio_bar = 0;
 	struct xe_tile *tile;
 	void *regs;
 	u32 mtcfg;
@@ -313,9 +312,6 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
 		if (tile_count < xe->info.tile_count) {
 			drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
 					xe->info.tile_count, tile_count);
-			pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
-			xe->mmio.size = (tile_mmio_size + tile_mmio_ext_size) * tile_count;
-			xe->mmio.regs = pci_iomap(to_pci_dev(xe->drm.dev), mmio_bar, xe->mmio.size);
 			xe->info.tile_count = tile_count;
 
 			/*
@@ -380,17 +376,17 @@ static int xe_verify_lmem_ready(struct xe_device *xe)
 int xe_mmio_init(struct xe_device *xe)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	const int mmio_bar = 0;
 	int err;
 
 	/*
-	 * Map the maximum expected BAR size, which will get remapped later
-	 * if we determine that we're running on a reduced-tile system.
+	 * Map the entire BAR.
 	 * The first 16MB of the BAR, belong to the root tile, and include:
 	 * registers (0-4MB), reserved space (4MB-8MB) and GGTT (8MB-16MB).
 	 */
-	xe->mmio.size = (SZ_16M + xe->info.tile_mmio_ext_size) * xe->info.tile_count;
-	xe->mmio.regs = pci_iomap(to_pci_dev(xe->drm.dev), mmio_bar, xe->mmio.size);
+	xe->mmio.size = pci_resource_len(pdev, mmio_bar);
+	xe->mmio.regs = pci_iomap(pdev, mmio_bar, 0);
 	if (xe->mmio.regs == NULL) {
 		drm_err(&xe->drm, "failed to map registers\n");
 		return -EIO;
-- 
2.42.1

