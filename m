Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B03EC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 21:47:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D314010E683;
	Wed, 29 Nov 2023 21:47:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C52510E686
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 21:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701294441; x=1732830441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+dTnocr2dR02O8KNX2uVr8uLOp4+wg1HRh6ZA3y5nks=;
 b=FskYGmW9oWEym/cV40jRWK2HwdPlJG+UQxBmKya8N1vzFpfuiPYtkzYU
 89/U3zNrQWBBTOrKFmth0F5HeR7Y1Yt8WF6kcYS8LZ1XOXaYzdXtV6pLz
 oblm3b3a5gux4T1r7BSMmx+w/2zy7MEVgvL5yjRyWC5dMEe9M9oFpzWcB
 UFU7lcSATD6XdlpxUTXzKmLbdA/ztzUZRT2XWpKU/tA+0fokCotXwvP77
 Joged9/it+fPsa4rzefmlIjn9Y+veGU6wVrYQKi9+6aw0W6zIPQ40EMBr
 aZ8E/3UdiuZ/cp42gk4cYUq9qu6LqWNCcPexCnq53GFMZQAO3UyuDUUi4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="397124038"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="397124038"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 13:47:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="798063858"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="798063858"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 13:47:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 13:47:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 13:47:10 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 13:47:10 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 13:47:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xb+d00NKAST2OWMuv0nKO3ca7JczM6guHs9h5vxkNBZFnXd9jczkbO2joy462sWkTpf+Ake6WjNoqVCY7ungZTrRgzWAKwzEURRWTAl86DnXq5yHc2IhFV4XoCLAO4wV9IfwpBH9HWQ3SJ7lBRIXVjDMBakvNwTuLVzNSVlakocBzL1mtxPubVJ+9sIaNKXl/6cyYvvYymj88QLH6f6vT5M8r1VRhsqvQRchdIOyH79Bhc6rJv6ty96pM0KULOvYrl1swPKr/OKo/aiDeanSIT+HHcny4zq1OW+/tjRa5XQy/MyYeO5160U5b7QXJUUlY8P7tyu/PLjAu+/msaCBBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=viJqsd7uxwAk6p5/Fu0ifLoR8zW8Lb3p3jloFHmyjSo=;
 b=Ce0U3NClsIOrRWoxipjNEC4/Mi4tbmuI7JuSOu9dGIItmXSLvcAq2ujXVzDK7DVb00WJKDWd/bUudhLtAmLNCizZMlxpKTH6uEmtZNNhHCyECFXe6AfRheYy2yl/rfiOulmRJOeVGCQZpur6jGTrbYYNVgF0yyvhIHrKCrHOcUqLE7Plr0p8zdz3bkOsTlm0NTgDl+Z6P5b9ZnYCEysEumRMkc9XSIv21tlfQdnvWFQ6JvHlhE20jp4hSvWZdfik3EjYI7/kudnWVAWIINbC2PzctIyrh4B04ruTVPdesX8mKweFOEnOQ/oPTCi9g4H+6AJO01yj0YWJK8ak1lZa+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ2PR11MB7520.namprd11.prod.outlook.com (2603:10b6:a03:4c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 21:47:07 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 21:47:07 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 22:45:04 +0100
Message-ID: <20231129214509.1174116-9-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129214509.1174116-1-michal.winiarski@intel.com>
References: <20231129214509.1174116-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0385.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::10) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ2PR11MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: 35cefde8-d3e1-451d-a08c-08dbf124bb70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HaTYQyNzVTOc7RyEb1/LNZo41NGrgvo6SBEFwAgD77k3zZox+cV0molVJ7IBQsHsegAxIUOp3UVP/L915WUsiyC8rTwJIF09FMK4hxg7wxFAV2gc728+DZy9syeF/E7caa2sp2vTxcJ3sJNaY9jhPsSc38I1h9T7aez8yyROl6R1htXGfY6u7dErVmUDW6pQvh6YvTEr0uy+syLvOPidsmm4tq93ZqVxbkAS3oVhnneYKtL3qwBsOPE9AnXoeqykt76ebmkYzurcYSy/qqgjGZDpV9P9981QfUY75C1jN74xcpEAhlaIQdNpVdwoD4RtvrdBy8Q2731SxCHM33H7D6oJmz7dPN+4tuE395g55Nd/Ueu68TOLj/pW6iNqNSCO225fhM4rirOHq828BVWCa2bdJyxWMDl8CildhZphhbidUXgdKRlX7OTkClb5lTBle775Te0t6dRMoEWi3INH3ix6LCc2+DAHPQAdlrS2ZxQa6q5haJ+CH9G4EPWL+OutuvIX3YLILh2gCx+J2cPFHRyJDDMJoMKDH8tOLe9D7bL/SekMQj9clmzUvWF8ezUiSeRYu/Nc9QhJCShskahzJl2lps821IU4GyPSK2S8IevvaFoBpaPzH9dJ4gNh3WEK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(396003)(366004)(136003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(26005)(6512007)(478600001)(2616005)(6666004)(107886003)(1076003)(6506007)(2906002)(41300700001)(8676002)(8936002)(83380400001)(66946007)(6486002)(66556008)(6916009)(66476007)(54906003)(4326008)(316002)(82960400001)(5660300002)(86362001)(38100700002)(36756003)(202311291699003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDVEdFVleXNxTXJucmJmNU9Za3UrREdWalJQbVNNaDRzLy84d3dMNm9tejRw?=
 =?utf-8?B?aUZpRDRTU3NpVnoxZW9wRXRkRHk4N3hEcUJmQ3UrVGlTUG9EcXFwWjRKc0dX?=
 =?utf-8?B?ejBQL1RWYUd2VHZLT29pYVdVZS91Y1NmKzZ2Tk5udytib0JSU0k3QjFBRWo4?=
 =?utf-8?B?bjVuNkhTSGdNV0JNRjF2clRvN2RXRUh5MURrcFpQLzd5cVJtVS9PbURNVVJp?=
 =?utf-8?B?a3VVNlFIY3lUZGx4L3lITGRpbHBIWkdqUnhkLytzUGxjNkQ4SGxvRmJQS3J6?=
 =?utf-8?B?ZXdsLzJFalFtMkxsUHVNdE56OTAyeFJUdit2ZnRqUWJGM002aVlLdHQydDd6?=
 =?utf-8?B?RTZXaEJZR2hGTWF1WDFabFFQN2YyOUI0bko0YmJ1WHJGNDF5SktnOEpZV1hU?=
 =?utf-8?B?bGdOSVBGNzdEMGNubTVRYUdWbHgxL1pEQXUyUkh1bytBQkZWdFptY2tlcGRs?=
 =?utf-8?B?NEY2SWRsb1hiSW9ZSHZKdnAwb2FSbDZ5d2xrWnRwb3IzMmwwT0hxNFEwbnNN?=
 =?utf-8?B?M2JXU1Uzend6cG9FWkNQVXJlV2pOSlpZOGtWbXdBNWpBem8ydUc5Mmc0UlVm?=
 =?utf-8?B?ZWpidE91R2RpUGpENWt0aVpKWDZYNFRjSGVEdVQvbjFaYm5ITmhDS2JlUFNP?=
 =?utf-8?B?blJQUkZDdFN1a2M2bndvM2NkSHlEU0VBTGdXbm82WThabTI2MGN2dDZBYlJH?=
 =?utf-8?B?c1hISTJPclBkQS96c0d6OEFUNk1NZ280dmdMNVBFdkpwTzNyYnZXMDJjRkJq?=
 =?utf-8?B?dm0xd00wOE91KzVXSkoxbkJWcEtXTUZMakdadWVhQW0xd2lFOWtVcE8vSGF0?=
 =?utf-8?B?MHJtTjNzRkxDd2ZGVEFxU3ZlZWdObHVkdExMVUdzZ3huMWUwYVlhcDFtQ1R4?=
 =?utf-8?B?S3JiZGVtSWxsWW9ZNDVNN0sybEdKZktFaFRHekwwMXhTMVAxZEhmSzdtTkp4?=
 =?utf-8?B?WTNmUVNMbHIxc0VqZE1hOGVBcXhSNVRDRElHcGg2eHR4NGF1akRrYUdnY2tv?=
 =?utf-8?B?b0pYQUMyeG9qT1plRWFrWmdEQ0ZyNUcwSWxFQ0w5bEIraHdQdERYb1FaNUw2?=
 =?utf-8?B?b1FYVHQweXFqYTZVUENzU2tOcFQrak5VV0wvN3hxSU84SjRiZFBmQkpJMjVZ?=
 =?utf-8?B?cWxWYU05Vzl6NkdiYzhBZGd6VC9Cd1lOL1p1WlhQS042d1NXa2p6OWhsRHB3?=
 =?utf-8?B?eitaVEtXdWN3N1RIRjlWOEFZeXJhWHpNb2lLUml5YTJ1T3pvNFFIMHp0S1o0?=
 =?utf-8?B?emRxMkFxTjNNa0pqN1VjclR5R1VTQTYreGtFcmV4Z0Q4V2JuVVNpN1NlT1NP?=
 =?utf-8?B?aWxYSFVneWQvdFNRaUl4alRZcHowTFhlRGpzZm45bXpjdEFwYW1RYmFLQXNh?=
 =?utf-8?B?UFlON2N6bTZob3JvUjRFWmlpelZhOG02S2xraGRrS2lLaENXMlB3NHJ4Sllo?=
 =?utf-8?B?MEtQdS9mblM4enljMmxqK2RWenRxRyswSWRCL3lTcldpVlIxNHZ2TWE3TC8w?=
 =?utf-8?B?ZDB3TGFoc1JLZzJXV040dXZTeFdWZExHQkU5eENQQ1lrYStaamlQZ1lkWDNo?=
 =?utf-8?B?NTBadGxtL3RVSFMzZ2U4TGFEaS8xZVFIS3pIeDYzRndIOFBuZCtNd0xLOWc3?=
 =?utf-8?B?WFVpWDcrZ3pjTHlmeHNkWmZOTENUZkE2QWNFRzFub3hOQTFtNGc3Yk9xa3JR?=
 =?utf-8?B?OTEyMG5UUEFrVGh2NW9oK2FmUXlPNFJITkJxR0xaU3V1Vko5L2ptUkNocmxU?=
 =?utf-8?B?OHdVWkQ5aDlxRGU0NDZET2xQaGNGQ3JiZEY2VnNRK1JRM2o4UUFyOEl5alJs?=
 =?utf-8?B?ZVMybWlNbnljRXRnWENwblZZOStvN0xvVmdjU2phMFI5ZllrU29OQlh2YTNl?=
 =?utf-8?B?eFFncU9QRFBCazFVYTBFZEd2RzgwMjRXVGMxbWxUZkNTODlxRUpsUG1ST0xk?=
 =?utf-8?B?LzFwYlNjRFFmbDlGbEJwU25FR3U3ZmwvVmVqaFdTSDhYb05wRWxaLzVyQkV4?=
 =?utf-8?B?T2pkallpVis2U2xsbXRyaFk0VzRqNEpMRjJYUVYzRldOQWxhYWRHMlVsRFpo?=
 =?utf-8?B?QmpBeGgxODJWR3ZlQXRQM2dCM3dqeTZ0WmxsVHNoVUs2MzBkSmtjeUdiYTJY?=
 =?utf-8?B?MzVJV1NsZ3R3WmZtRHFBZ1hlbTdDR09jdkpTT3dSRlR0Wkllc09Id1JvSU1v?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35cefde8-d3e1-451d-a08c-08dbf124bb70
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 21:47:06.9996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JibwoUDCQUljD9nXDzS7IaR1FYsb7+3zJYHHcl6rIVhfSKeF7+Xk1FHi+8MCd4YEY1kOp+nFJR8ugY9XjQDuAF7iyErtp63luH6yoyQcebc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7520
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 09/14] drm/xe: Map the entire BAR0 and hold onto the
 initial mapping
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

