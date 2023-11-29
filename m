Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA49FC07E98
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:17:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06BB10E5DD;
	Wed, 29 Nov 2023 01:17:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A030610E5D9
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 01:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701220623; x=1732756623;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+dTnocr2dR02O8KNX2uVr8uLOp4+wg1HRh6ZA3y5nks=;
 b=nfd0Vy7+/3q1hmja1Rj+8DWr34ivQ5BcqLntyNDEqagJKTAUNTpiPy9j
 aA5dbEZT8ffuPGb8ZMjJYT2vFzzNvhKsrkv6iRYVNDHXkFh39n7Y2jZk1
 cCGxQEQNmVRTej+S8Vgqk96aUu0sSgPRroN0uhbZ6O7rEZQ4Z5IfeMQd7
 vOSzddvlAvLx11rXKEPOlY8JxOfEOADQn3LNJ2G2l+Pyp7UOm6nfqCuSi
 DTQA2wwxUT4TbbGtz4O83sKQ1FeaKZJLPhyo/72lXNuP2cXdSmAHYSJ1P
 jk55K/K1nJjhjmdUDpReX1IZPUgT9o38XubzLNDigSKKfzRcS2b+eJsUo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372436569"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="372436569"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:17:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="892272661"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="892272661"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 17:17:02 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 17:17:02 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSLQ1Kd8ILeYVPPH1nEIUkMnnbf+mngsu9UedT+9F9MdqkdklxCAI9G1tsuQurI9I5yp/Bg7SlSbRQZsq93irZDHF88Gi+YTBxaz6A3GoWlEfljuTXwfx7RLPNHDiLeN0O+gHkqtNL7ECnjYHaIXtTyeIt3Qzxxr2mD58NOOBU82przFRl/uu3ie5TS5j3HLvYlEQ8htrmE50nQH25SRnjhmsChQG5iAvVhNaKd/3CaMMH5LihGiiqs96PX1wwIijx+UX/KFtf2oYFidmKYUWAvS8kjftItqE8jExPx76AlY1b/Ftds/77c0DKcofUol280mNubJUgyBgxtux81stA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=viJqsd7uxwAk6p5/Fu0ifLoR8zW8Lb3p3jloFHmyjSo=;
 b=RfGj61RH2cPT68aPHE1NWRYQYZyTtBCL4K8MhktggM64E7UadBYyy+a+S3jw4WJMwlS9YwnSv7k44od1TX+tJD4XpWH2GGUAIDGztQHSbK8UBdRWlUYtP71xYqFCQS/iJS5zm5Q9drdQMrpsu8LXg3e0Xvje9XrxfMuc4o8V+5a85mUaxz0IQsiTmjAMAkIGNDXfrJ9NuLQmLEWQeuyeADpVo7hRyLIxiV1EUf1pIhlxPVIaW3g3mJlWoytDxpSdItBpUxD1XzEG31jf1svYedUKp6uERXkDb3q9rQw64S3ynxJUV5pR+XzmEZs87KKw/bIBLZy/8GJxmf21ZlCDuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB7992.namprd11.prod.outlook.com (2603:10b6:510:25b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 01:17:00 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 01:16:59 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 02:16:10 +0100
Message-ID: <20231129011624.836843-9-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129011624.836843-1-michal.winiarski@intel.com>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: d4d13b63-bac4-4e89-46a7-08dbf078e2bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WxJvw25YNGz2Du1awBElOwT+mpi4XFc82+M/ozt1RK2b/rsPHV/DrnqoPk8AjHzVK8L9n0KVZCluBpCKqXpSq+8P/ITjKs2sYrqw8LgKBQfQrh8JCp675BBsbvEUO5p0X2/yFI9STpGPLMEcPr6mgjEj6ac3/Nxm5fRst3F05QZyql5kS9f/5m4spVTMnZd4iwLPI5Jfjbk68/AE7xNwepa/BPMSlJPgGee41JfPkY3afERxmtzPT2TjlTLxw7dwggtuRbwMzMY4a9Bp641Ps/EHUpkE41FejCj4GKQW8cV5bb3cCe0oKfzXqbzf+8TIfRCwuei8v7r0SUtLMnEQXmVGB4OD/kaU/dADGRlTcrTe0/3jB3aWh6fQIq4j26Qoabdlx54rKh6Qguh9sHNYlHzY/2HRmg0TCLB71wyFEHnFlRmPiHvWJysbzrlXqV85avdOJAbsnEAfV+RBJ4stWjLYvA8+BA0ujOOQC79l4e83lCVbAxblNQLWo5iSPI85wTkjHcxxDb3VThuGY4DIo15jGSBJxM/qcSOMh5jTRieQ5Pk33VYmW3v/bwM2qO02
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6666004)(8936002)(4326008)(8676002)(6512007)(6506007)(54906003)(66556008)(66946007)(66476007)(6916009)(316002)(478600001)(6486002)(41300700001)(38100700002)(86362001)(1076003)(36756003)(2906002)(26005)(2616005)(83380400001)(82960400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXFuWXlrVlNMdHBKaEI0SDE0VC9QYUJzNTFIdGdiT3psTGpiRXJwSG5yVTdS?=
 =?utf-8?B?cDBSTGJrellzSFpOS3ZoQ04rS1lCNHpOb0IvQVhEZFpYQ1hTdXp2R1BwbURs?=
 =?utf-8?B?K3JJMndnTDlkSHFHVVIzeGZ3QUR0VnIzSVl6NmJUU1B4bFc2eFdzdXNXY3Jo?=
 =?utf-8?B?SVZ4cnJMSk52L0dTbGFkZ3FhVWQxa1NzNEJPL0lyWkMvZXFBTFFMVFB6NHVL?=
 =?utf-8?B?eG8wNkIwa1RZSVNER2NVTFZiM2t3MkxNQWRXRktSOUxIRkRiRzdlQy80eStY?=
 =?utf-8?B?K0hZSXJGNFlLdzBGZGlMdTRnaXJMSFdON2hWc3V6UXdDRkx4WXNnemlsSFZ3?=
 =?utf-8?B?YVhReCtLMk9UOUh0anF0Nmhwd21YUnBhdmNKU1E4L2hRdTJiVGpNNVJaRENQ?=
 =?utf-8?B?dURzRnVNeXlsazV6SVM5UWl4MDFtaUQzc1dlTVF6Vk05VXk5YjhNNm5SYnJL?=
 =?utf-8?B?d0lVUEFyVWVYWUd3Q3NtZHlSK3kxRThZVUxoY3JHVWxZNjdSRUU3dklCWmJx?=
 =?utf-8?B?dCtMcExiUlZpNWpCZXM1NVhXV1NnWkgyVU9YSXpGMnFoSHZ6cFFpT25yQ0Z0?=
 =?utf-8?B?a29xOEY2MGJoeVFreU1rVVpxVmJoVzBhRDBxWndidE1ON0lHa1FEQlR1S3Ry?=
 =?utf-8?B?SkE2dGdWTE1nY2tvU3l1Mk96dFF6SFUzOXJqeW13bC82bEw0ekV0citrMVA4?=
 =?utf-8?B?dmlSNFlia2JkRjhTWEJUci81Skd2WnFETm9tV1hwemMxWDlNUFBZTWVmcVdT?=
 =?utf-8?B?aGt4M3FlMW9tdlRiN0pFbno4b0FJZ3lOdnhFWk5zSDVOUkdwU1VZRldTOXQ4?=
 =?utf-8?B?aUZGcmZLVi9GSWd4eGN1VzhGM0lPWVFvLzlEWElFVkZ4cjVDbHl6VENSV0V5?=
 =?utf-8?B?VXdIb3ByWDBNS1RndGZkbm1EcHZxZTVTd2h4UGN5WEpkY0lJN0h3UEhXNGV1?=
 =?utf-8?B?YXRCTmhvRGozblhkdG4ybHNvZTR4RkQ1MUhyV3RPRVZxMi81UzZQSFNjY2lp?=
 =?utf-8?B?bWxvejJzdm1FblJPZ0E4Vmx0eG9qb09uTExNUVpzQ0xyanJuT09SdGlsSDZy?=
 =?utf-8?B?RklUSmNKaGw5alRvUFA2c3BKNzZPWklrRTNTa0RBWTVlYzFFNU5aNzd0V3hO?=
 =?utf-8?B?VzRnT053SDlNOExEZk85VktSZUpzRTBpbnFXS25ta0hsSHpqS2lueU5lbEw3?=
 =?utf-8?B?OWJYQjY5dGtGZWx6S0c4ODlTZmVhaGl4WmF2aGZMdXJORXRKM2tNdVRrL1hZ?=
 =?utf-8?B?V0U1NVJoT2k1WE9lby9aVHRyNGRUSVZlL3A4MThNWkpBT3pYbXg1TGlib25R?=
 =?utf-8?B?VEFIaDI1dGNRNjlvUjhVK09mREdzaWxTank0aUZwMXdNaWZ1eE1TaFFzV0dl?=
 =?utf-8?B?SjMxWEg0ay84YmVLdmdzVjcyYzNQbjliaGhPSktyd3lQK0ZRTFltYVZJOHpz?=
 =?utf-8?B?Qk1HaXh0T1loQnRacTFkQVdhWENzYXNGdTBSWlJGd3d0VXFFM3JVaU5TNjIy?=
 =?utf-8?B?ejhoSm1kOWtWOHpOOFB4UGt1ZGN5Z3Exak5yRGpibXF6a1gveWFHMHZ6UHBU?=
 =?utf-8?B?SGJ1Wmt6S2xRaWZobjlaV3RkMUpNOFMwbXJEZUp0bmlIN2pua2puNTRJNzZY?=
 =?utf-8?B?Z1UrdXVqenRZc3NhcjBhVE9SZ0V6MWNlTjRNQmloYjJBc3JpWlFlR28vZlNL?=
 =?utf-8?B?bStqYjdTOWNQT3EvZlEySTNESEZsMUFGb2lzaXJlaVR3ZklaSjZQQkIyNGdv?=
 =?utf-8?B?RTA5Zzk1Mzk5WTNOQTlmd2Z3VmNGY1Z4M2x0Wm80MEpFcDJ4bmZWcWJGR2po?=
 =?utf-8?B?dzdEUEltRnYxYzdrR1JyWnpURkVIUUlWbnFwVzZ6eHpBc2ZMejJSalFyUXVr?=
 =?utf-8?B?eDM4QzhpWVJ3a0N3YXFGdkhGR0tnNDdHREpQSzJiaWd1WFJEczFEQTJYZkRY?=
 =?utf-8?B?Y2VHWXVCcHRudTJaRHNQRG1iR3VNY0RwUzFYdGxaTXN4YlFJRCtUaG1sb3FH?=
 =?utf-8?B?alZWMTQ2WEpNNGJJQ0tTb0trVXp2d0NDRWJoVU1xUStPVFl4a1lXTWFQUWpN?=
 =?utf-8?B?bE85cVN6R2FBL1VSMnNOQzZ0c0wvT2srUVN5MlNtZ3ZRYXVhY0hzUm5BNDVr?=
 =?utf-8?B?ZWhydzNmS0oyUG9UZkJPZldiVHBnbk9JaGR1U2UyWjhNSWluT2N3UXhsY3BV?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d13b63-bac4-4e89-46a7-08dbf078e2bb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 01:16:59.4954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CYaqdvBIr1UEk9o5STl64X7SxNOb2LQG8jpNqtRGZ992YyGbrsY7rhXVm7AdBC6LXPycGvH4dOPacAhKJQygK1UE299fsG9kUYfjhuTP/BM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7992
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 08/22] drm/xe: Map the entire BAR0 and hold
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
Further more, there's no need to remap after figuring out the real
resource size.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 9769d56988ece..d1b59021c9712 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -300,7 +300,6 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
 	size_t tile_mmio_size = SZ_16M, tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
 	u8 id, tile_count = xe->info.tile_count;
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
-	const int mmio_bar = 0;
 	struct xe_tile *tile;
 	void *regs;
 	u32 mtcfg;
@@ -314,9 +313,6 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
 		if (tile_count < xe->info.tile_count) {
 			drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
 					xe->info.tile_count, tile_count);
-			pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
-			xe->mmio.size = (tile_mmio_size + tile_mmio_ext_size) * tile_count;
-			xe->mmio.regs = pci_iomap(to_pci_dev(xe->drm.dev), mmio_bar, xe->mmio.size);
 			xe->info.tile_count = tile_count;
 
 			/*
@@ -381,17 +377,17 @@ static int xe_verify_lmem_ready(struct xe_device *xe)
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
2.43.0

