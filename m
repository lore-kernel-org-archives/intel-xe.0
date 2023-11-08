Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364C2C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 00:35:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F5410E305;
	Wed,  8 Nov 2023 00:35:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B03D10E305
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 00:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699403724; x=1730939724;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=k9T42IqFEH7cV82eKKjbTBHHd3qdKg7QMW82m8+BpdI=;
 b=F8GQyxOiuggHvvyJFyK2ehmg7p43GIVA5cL3JeMZ8o1+tA9DQdGqs3NJ
 PenUUZ4d7BkDs0ru9NwJzvn7WHABgH8uxtPVsJ9IUkzEdJ/tqjp5jDNBH
 h5fN3djw4zANTT/x7QDpcqksJo7mcUenF3+bP0ciFFSv4shQw/EtSc8hj
 PI+hr6ule7J9S8tBNgzYoD8eGgQS7rdXcuJ5ql9oP2UHwpvu/BfQz1Ws0
 iM3ifSrxgmFiWNDFm93+HLiwjDs0kBAkmsV0nX3LeCJOvYQFZzC5a/Qzh
 iufqvPlgZQiqOF0WZLWsp1VcxSdQhTUIE6lA9svv5Z4Y/1Hm7+jyxwdTZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="475886170"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="475886170"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 16:34:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="880019055"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="880019055"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 16:34:48 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:48 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:47 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 16:34:47 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4orWnbMcWmI8Lt1sDNxvytzfW3WFNZTlrcgy4yL8HguIvTDrQ1D+HU+dzeJadu4btVj1Vj1Yem3lB+srnNsO/X8vvt1FWSYl7bTB0SWlmF7bSQDrdgUJt+Eiy7WmpQkr526qt4MvlvGNLkFaNUG2uKsQIeeAOILwe5/tmcYtUjB/kDsewjH7UlZdDlplGmK4KvUHIO6nfNZEA4vq+b/s/XKuQWRMFRX4RQN3cIwo0mo1nGulNvU+G1xp2Yi19tmSlQLEf/op78LQEzeFyiQYO1HCimrlz0uOnF8hC0T8h7JMsYuq7DfxrM0zKx5jK659A1muH0Ve7NhbU8h0pF4Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rHrqSQI0SI0l1eY1CKJjeCwKghzPl7LOQvkv1ugxYdc=;
 b=jbSHtfyuH18pbrn8uY12FNPVhABPH1+6WK8Xoid3MpNa0jBAYaww7EPGmVifLxnTlHWgSbsnAkpMruFT8ZWlWpla/WvIO+8CoHCtHjL8sc6dH7BJ87HTXHlHisRcFCKQjkoD/rOL92fAd5PUTkfrt/U5lyeS7221j8noCvbydxGZgZePVdETQSIkJ62wr8JC1Ehrb826X5BlBfVSFgD4cn3qdh9u0kgPfrWZAIOMnFuVTQVZEqDtWvv9nFBSSllnOGK292UqmbRrOoJOCEHXDAbdrlbN2FR8Zz2C8pPRwkR6g2kyrdIFoI+X75ZkferO/G2Tcwsk8jaaRqhp0nnKaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB6802.namprd11.prod.outlook.com (2603:10b6:510:1ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 00:34:46 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb%4]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 00:34:46 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 8 Nov 2023 01:33:42 +0100
Message-ID: <20231108003344.1169016-11-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231108003344.1169016-1-michal.winiarski@intel.com>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::16) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fbb47cf-a634-4bad-da52-08dbdff2820f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BQT43Ss1bTT8aM4OYtYf0jfIxFQ60YVNLDhZSNKBHRyhz80mpXLyxPS5Uu20xwlI8AWp1p2HFD16bbv16aYQMq0ilLA1reeD7I4PReceox2CHa3amozvRHo15ntwXG2o6CUKHQibu1kDqmxuFf+En/aeNxX07vPKkkxyiiYG2p4xOnPyy4RoJfiqeZ8nhCn6eRFubYhP47esRUgOnwPKXdA0r2joQNpxvx82tnSgasU4cmNfD91UcvSIJO33bzfENCIb3efNCkX/tAmaFQIKKZfvRWA7N1yW5Qi4XNdWPi3u6Ow9SR6MFPn59bTmN3iweUO90imM1MOTYR9zoQbIctU8GkZfYwQmqqk2jyDYK5iiptr7yB5hJmWP5nxpAanBV+SmcKOnCKBAJ01FXk3GJi1da0OenENZxf6VO+oxMKDTj+96qFmrwkql56agrG4DiewkGYbD1UpwSyPLepQNVk2jW8JTPP7FqgEjjDS7FQDTTO2sZFAWRSV/8A5tc3TP5YiVb7q7I07h3R/jFDlWSriafPMANKYn+66ICJZjF3pclBeBrQI6nRi5QgDNbXVv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(39860400002)(346002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6916009)(6666004)(8676002)(8936002)(4326008)(82960400001)(2616005)(6506007)(6512007)(5660300002)(41300700001)(107886003)(6486002)(1076003)(2906002)(83380400001)(26005)(478600001)(66476007)(38100700002)(66556008)(316002)(66946007)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WU5ta1EzY2FlNCtJa29Ra2todFBwNUg3S1NtdzFWbThrUEdmQk1KaHVCcExs?=
 =?utf-8?B?aGRGcUxCUEpGbDdyTVlXVG1ja2ZXVTFaeEtKZXBodGtHbnUzVDdlQ2cxTjFh?=
 =?utf-8?B?L3R3cGJLdGZWeWJtaWU2QUpUZXpBb1hQcVlHVHVJZTBaUDNtWmxrcG9NUmlW?=
 =?utf-8?B?dHRiUnhpUGtSZHFRRUtTRVNlQkgxQitTMWxzd1Y0amJrMkQ3NGxOVVZaajFE?=
 =?utf-8?B?dUhaRHdWbFRmMHZJOVlETkp5Y09aRjJ2MTB0UDljVU5YVW04UEVoRCs2Nkln?=
 =?utf-8?B?dnRnZ1UydEhqODd0aHB3Ri9LR0FyUkhlSHRHNC9oeVg5ZTh1T3hzdjUzMEhV?=
 =?utf-8?B?T1VUMHlkZU5ZM0dxaXF5TEsvbU9YaTU3dWkvV2U5TCtqNHpGdlRrcUJpbmlv?=
 =?utf-8?B?eEMxaHh3QXZKVDVLcmdPL2pWWnAvTmlSZ2RidnljTHUyNjIxTktiTS8xZVpa?=
 =?utf-8?B?bVVlNDZUNVMxVUZPa0RQN2J1L2hRZ2VmNk9GcHlEWjQ1RG9SQ0MxTE83aGF1?=
 =?utf-8?B?dnpGNVk2Zk9COS8yc0h5WjRCYzQ2ZzQxMEdWM210eWZZdVNBcjUwenQrNU1y?=
 =?utf-8?B?VVM3S2pUNlF3M0dJbCtwMFhpdjVnMXlsVldwck95SmNaeG9pQ25yT1NGM050?=
 =?utf-8?B?SGtkc0txZnRTajB4KzdudGZOT1hZRUx2QWxwT3FUMDc5bjduTjlaUVVENmpl?=
 =?utf-8?B?b3ZGNmhUeTNyM3B4MHRGbWhjN2x5aE16QTVBa095U0F3SDlpS1U3ZjgyWE1t?=
 =?utf-8?B?OE5iWFhSazVpcmc0YnNCb1NnR3V1TEQ3NU53WTlYU08zUFJsRTdRMXRDT2lu?=
 =?utf-8?B?YUgrekU5enFhQ2JSNkpOUWtWKzhQUG5heEdRSkYxYVpNd0IxbDF3M0FldUpy?=
 =?utf-8?B?N01hT2FOM0FaS0VNZVVEZkJSMmgzd2FPcExBNWZtYlZaYlJKQ2ZkTDlqSzlz?=
 =?utf-8?B?cE9ZYWtWYVdKcmJDUlc3RVpjNWdUQi8zTVZPMWhrTWsyU1NyZmY1TnpLOTZI?=
 =?utf-8?B?aWoxSVJIQWtpc2Eyb2pzV3FEWTQrdHZOaXBaUjAxWERjMnZBWWJQVkZiL1gv?=
 =?utf-8?B?cUlmNGdFVGpVYncrQTliaGU2bFYvQmtrckdpMHZtdktwS3Y0Mi9EZWxDTmE2?=
 =?utf-8?B?OFQ2WlFVRmViM3Q4bUVtZDY2T3N2NG9LUHl0S0xPZ1RWTlRPVjVhMVl6ZVF5?=
 =?utf-8?B?V3JLanJOTldjWXZDRllJd3NVOGZKK0xheXhJcGwzcEpyb2U3OXBicDIwa1N3?=
 =?utf-8?B?MXZ6MW8yM1V6NE9Fb2VSU2tmVHdYcmsxL3dpVzJmSis1YUtIZ0U3a29iQ0hC?=
 =?utf-8?B?YmN4UTdMS2ZWOXozR1VIWEVJZktvUEdpbWwraWkrRVptOFF3V2c2SkFBN0w1?=
 =?utf-8?B?UTduZ3Z0cHBBOGhyVXEwWmU1ZlgzREg5TW1IVjlMSDJxNyt5MmJqK1lzd2Iz?=
 =?utf-8?B?T0djNmF0cHZQYUtOcW1ZakY0QkJsRzlaaktLRWlyU1o5ZXo4Q1NTS0ZrN0tM?=
 =?utf-8?B?eUJBUTRLK0EwSzlPeTRWOWpPeldMbTVyTm1IOUhScTFibEtFWmlZdE9KYzlK?=
 =?utf-8?B?U2NTbEhuRkk0SHRGQitBR3lXUy9wcWpxTm8wMmxJQWZQYS9vUFBpZHd5TG1h?=
 =?utf-8?B?cFFUbzlYaDkwVWtEWnl0Vm1OdldyQzFxeFA5NzFzbkNFNzZIMlNRdXdrUnZP?=
 =?utf-8?B?cXRPbkk4SWdnaVpQWkYyVzFOenhYYTN4NHIyMXNGaGFDOFA5Ni9DSFdkWVIr?=
 =?utf-8?B?dnZrVW5RNmxNUURuS1dST0FQOFMrL05CaDM1QjRJdnNOYW0wK0pmdWw1aFhN?=
 =?utf-8?B?U2R3UHlTZUlvaWhJTUVqS0plaEVYS0xJTmhIOERCRjNsQ2J5YmRra1IzNFFU?=
 =?utf-8?B?bC9KbEFFYXZDaHFydDNITXY3SHc2WmIrUVIxZnFLeG9zcU1MNG1Td0dZR2Zv?=
 =?utf-8?B?amlpb3VrNzE1UGJTTnBpUXhDSTdxSDlWcjFZQUNCWVRHeVo5eEtXek5BVTdz?=
 =?utf-8?B?UmNtbk5RMFhpaFY0RDBFdFRZWnZFeExGMGliWGpqNEttZFpPQjArUDN4ZXE5?=
 =?utf-8?B?TnhGT2VVVWc2RjM5YlJuVWE2RkZMM0pHWE5TWjlvZjdSWlhBZi9ETVJPOFlK?=
 =?utf-8?B?SlNpOEY1eTNJdE9kT0xPYXRsYm0zZFIvL2lZTmZrZVI1dTNZRGtaTjJWcDN2?=
 =?utf-8?B?d3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fbb47cf-a634-4bad-da52-08dbdff2820f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 00:34:46.1305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UaqsH8CtKFSlVV2tmHir0sa05F/qY3QDWlz8ShSOTKu+VFDtmTOqNAeo7Dyl3howrNNHQ53Mt1+LEEF0Dlvel917IeiiEwVgBIASCQS8vAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6802
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 10/12] drm/xe: Map the entire BAR0 and hold onto
 the initial mapping
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Both MMIO registers and GGTT for root tile will need to be used earlier
during probe. Don't rely on tile count to compute the mapping size.
Further more, there's no need real need to remap after figuring out the
real resource size.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index ff968ef611cac..8945c601e1c54 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -311,7 +311,6 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
 	size_t tile_mmio_size = SZ_16M, tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
 	u8 id, tile_count = xe->info.tile_count;
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
-	const int mmio_bar = 0;
 	struct xe_tile *tile;
 	void *regs;
 	u32 mtcfg;
@@ -325,9 +324,6 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
 		if (tile_count < xe->info.tile_count) {
 			drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
 					xe->info.tile_count, tile_count);
-			pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
-			xe->mmio.size = (tile_mmio_size + tile_mmio_ext_size) * tile_count;
-			xe->mmio.regs = pci_iomap(to_pci_dev(xe->drm.dev), mmio_bar, xe->mmio.size);
 			xe->info.tile_count = tile_count;
 
 			/*
@@ -374,17 +370,17 @@ static void mmio_fini(struct drm_device *drm, void *arg)
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
2.42.0

