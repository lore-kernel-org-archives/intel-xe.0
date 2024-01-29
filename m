Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139A6C47DA9
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 13:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D296A10F722;
	Mon, 29 Jan 2024 13:03:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980C110F722
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 13:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706533413; x=1738069413;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hMcUK9dvkOV20KPbZ8ytklKLBclr85DSW2c7VrXTWdY=;
 b=eP5i6sWdjXQcJyoiKh8alPxO4f1RZrQ5BmW7wn+jbEa1G/3KDSWKkw2d
 +e/PB4DSXLeh6GgdQKSLebY8dqaDkzJzokH+3TYCc8UyDE6U4uiI7AdUz
 VVxIWV4unpmN2rDcT3J+ZpWAVqjFiXadDmyZQm9S4A3DdAsTL3oF9Tt5l
 efS3JIj7TswKNepS8IU8c2qO/ePpbA6mscpVmRajoN8Z1iw0knAWbL37R
 69+xX7hOlrFEkN2WnkFHc5+mD3IA7sHKedAXz6FUtQhS4j0hBV0Q35VRY
 IUIzG4BUPaTl/dc9ogG6y9JQVi4Ucyf4jYtphen0DDN8QRT8uKEOvs2C0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="10327561"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="10327561"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 05:03:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="22095967"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 05:03:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 05:03:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 05:03:30 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 05:03:30 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 05:03:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BaSC/qJXOL97HBLV26R9sejtwepFaQkOGy9WfFlNz3ejN7byZlr/myFQHD1Hly3kkWe3F5ryx5dgXdQzCP432UYK8wJcjiUsKKMot8P1hTWSL6DHjAdBH7N1u1KHhLVASFCRH0uVMNK9l0sxurLwFw8smRYFm3XACH9KIbKn/MuoyYg2lg2WFBKlmjI1rD/llZmoxaoWr/ZnX66Mslv512ldYQfCYxPCFqaIL4MiOSrZ1wtsXvDGQyEUFZTMMKz2PIygUHVSKmKvywfsBveaPIqw7aqz9sX/MTHXz1A6nw/f345ik/3F3iK2lirwhhyhboKZ5fGPN+NQLDiASVDYcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g3v9L+xgOqKXYlRNwEL9rvBAv7XL4pBfO5/2gbnB34c=;
 b=aHEzEUbItsvxhe0yA37eTj2geg1/ZdMcz9Boy5le/S3BRNoDgkAiiABblmIYxw3fTxxzFa6EXaC26ARWs1PSPcgZR4OBgwTUXVSoH/Hnnx43SZXJergYnZXp2AV57y1t4o06QMXDeJROE1Mq5eYRmEGqwGUHLk2vPev2dYVfhHps5eZVeEwuR68lNDGmngHaLBy608xiHRptLgczJt3xFqQywjdvKTqalSblG4S5ZlojFYB8FpGKC5qTx0KH8b0HbHIF5EPGuancNf1RzAQeyDu5keZXFIK+jrwC/RPZavgL56wEq5LBf5Dw4OvFyxVPDplNU+2yyMQuDyppJ+5TnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 IA0PR11MB7813.namprd11.prod.outlook.com (2603:10b6:208:402::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 13:03:28 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 13:03:28 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/xe/guc: Allocate GuC data structures in system memory
 for initial load
Date: Mon, 29 Jan 2024 14:03:05 +0100
Message-ID: <20240129130308.3544466-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129130308.3544466-1-michal.winiarski@intel.com>
References: <20240129130308.3544466-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0155.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::48) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|IA0PR11MB7813:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e518c49-d92a-4bae-ab85-08dc20caaf60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rQF/QPGIO3La9eU2v3c2Ij5zXe6mgxP8zqJ2Z05w7zaCYs3bSlFHR6B9FAWgK7gMiIKCJd7JWXm3otLRNbja+2PglSzDeD5/J4CfjJb4UCIczbARQmUY7nDlE2BK7vv/VxLg9WeequTobjtLT8FgIqyvUPIxTax3IF3Lv67W/M8YgwB2ur6cq51m+6vVMLj5jCVkWTIsFqx5Vm9up4yU6X3Sz9nv7/nJdqCLeN6ceouYuEKqPa/wvcU8DkY8E5tn+oqAcC9P2uIbmBHQEwWehOMgmE72IZBQORYUnfH1maTbcklIv5YhQkMaHWpgPDd3zrlF8KsbjFJxFkMtj/1rym2P3FuuoCJuYnFeBOj6glHJj1henFQZp3VZydDj+Y0uzc6OQbpXaSHde+i0QtUCV1Cr05nvirPQ8KnOa73RkWb6+i7CcpSLIAAoadS78FMdkh8QcOQ9Yy4Nu9zfx9UObUYotn3BxN6sMjjfPFUdm9l8JRrGZ+p9mAoIQcucWANYuf3yCBC+AH5hHtVZ1CN0RvkWsQBpnNG6rlKd602v1VjbBmGYvF8T74ZtMhq+aCwymCt+f4blKyxG0Owcl2m7pXdZhMYCfnBfa1Fo3aNNkw4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(396003)(136003)(376002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(26005)(1076003)(83380400001)(6512007)(6666004)(6506007)(36756003)(86362001)(82960400001)(5660300002)(8676002)(41300700001)(8936002)(4326008)(2616005)(38100700002)(66946007)(66476007)(6916009)(54906003)(66556008)(6486002)(478600001)(316002)(2906002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTlOekVKUmF2U1hENUQrWUtwVkNxT2FRU3dZLy9vb1dIWHJXMGM3OXJTRnJv?=
 =?utf-8?B?Z0tFbmIzQ21PNU12NEhkWWpXSHBwbWxxR2xDT0VsaW5YNmE5dllheUowK2FS?=
 =?utf-8?B?cEUzSXFtYzJtTklMNHp5ZVA5M0IvN2owOUhDOXVQb3MwU21CMmljakd6V0h3?=
 =?utf-8?B?L1Z1WUZMSFU3T0FrTXlNNHkyREVmSXlpKzJoSTBwRXhaSGJyd1p0bXNHLzRX?=
 =?utf-8?B?TTJVYlVPOUdXNFZhcE5IVHNwR1dUYXNyVGwwTmNHdW1XRHJ6bFp2OXR6OG9F?=
 =?utf-8?B?dnp5NGlUcnhWRVcyOTNVVmJLTHRocW9oV2w1WEl3MTRPNHdDeGxzbndFdTRM?=
 =?utf-8?B?dmF3RFo5N1NiM2tGb0dmRGpEOTFielhPZFVVZENXUk9nQTFiQ0xmQkhyb3N5?=
 =?utf-8?B?d1V1bnZjQVBlbXgzWWJXNm11czJ1aC80TDd2U2ZtWktnV09LTnU5ZkVwaTdE?=
 =?utf-8?B?WDFWZGwxcDM5VEovdHI3UUsyZEIzRjY4SU50ZU9JckZ2WlpqMWl6ZkZqTW5Q?=
 =?utf-8?B?SHJlcVVYbzVQdFlPY2VOVkQ1VktCSUZyVVJ2SFhaaUtKT3lWR2pjZkY4c1FO?=
 =?utf-8?B?RFZJc1N6QVA1TS8zcXRwVWhsY05IejdrWWFRbnM0Z0xDMjlQWDU0aTlsREdr?=
 =?utf-8?B?M0ZWNnV3T1Q5QjNRRUlQQ2tYUzhJQTdNREF6Sy92TG1tOWlnR0JHU2crajdK?=
 =?utf-8?B?YnQ2SXdITXZsZldZNjFSSG4ybThIeHBoRXRXUThXdm5BTjhLYkJxcUplSmxk?=
 =?utf-8?B?YjR1QzBoU0lJT2pVV2hkSVhpbHB0NEFpSHE2S09SU20rN01nYmZ3K1BZMnNl?=
 =?utf-8?B?NDRZbElDRGRMY3BMQmExanpqZlZZRHR5dno1YXA2MmJPS3U4ZzNNb3pmd2Vu?=
 =?utf-8?B?Y1B6aDRGZnl2WUxEcTR1dzRhY29kbWFxMkFDNmE2dDVxZnNQaCthSWk5Mzhp?=
 =?utf-8?B?U29rRXBaZUFnWUZ4NmFYNmtUV1ZFNVBhaFAxZit0bFBxdmtLRWpNakM1Z25L?=
 =?utf-8?B?Tmg3bzRNSTViREVvcGlFcmtpaU4zMDNjeUd1SVdNR2FTUjh3T21ZVUMvWm5p?=
 =?utf-8?B?TmVvY3ZiVnlkeGtIckNuVjVUZmdGaWVJb1VCR2FGb3lGaDNJbTBpUm8yZFRj?=
 =?utf-8?B?S0hxaWMrYWZBcnk3T2p1YklxSG9PMW01RHRqQzg5YnlkZmk0ZkhiZjVSMk9j?=
 =?utf-8?B?ZEZkQlR1LytZdGtscERESVFZSC85dEhIMm9yUXhscjR5d1VXdngybGRmYnpW?=
 =?utf-8?B?eE1wQUExTFBHc0RFUmJQMlBzM2tJY2k0bXdYbkh3NGJYdW1MclRmWFhMLzlI?=
 =?utf-8?B?VDdHUGVRTTVHZGlCQUFRaDBYOFU5cWJjd3ExaDFNMWtmeXkvUjNEbTByWkpL?=
 =?utf-8?B?aTRzMGhFVGJMYkdiekpDTmlYQS9lQ3NZR0NacS9uWkREN0lMNHdIWlljN2pV?=
 =?utf-8?B?Y0ludmpicFgrUkJOVzd6OFhkQUxKdDV2emxpdkN0K1Ftb2FUM29KbCs5OTJw?=
 =?utf-8?B?RTYwV3FRQTlzc2tFWjhUcjE3MkVjMUg2N3JoTExyd2ZoSkQxbDZoZzVma3pR?=
 =?utf-8?B?aC94VlYxTlUyalIwaFpiZTc1UXMyOEo0NUF6NU0xMXNudS9FSWlsSjJDN0Mv?=
 =?utf-8?B?ZU9OZUVUdFM5dllaeFZmVXQ4dHg0N2laYVJ1WThYQmY1dWt2WEc4OXVSL2hm?=
 =?utf-8?B?K280ZzRYZHFkZ0UzbzBaYmJVNVgzcUFPSjJra0VMNy9NVnI0ZUVxZyt5cEZB?=
 =?utf-8?B?c1pEdmNTSmdIUXN1T04waTEweE4zdmh3a2RPN251M01qMlpCK0ZqVzY3Q1pt?=
 =?utf-8?B?a2o1ZS80b1d5Z2RUM0ExbGFyejcxN2JiYXBEcFpEQmhDb3VUVFJRMWtQenlS?=
 =?utf-8?B?Y2EzOFFMS09DV1ZWZm1nSksrWjl6cndUd3U3OHArb05LQWFsVWZmN0NPbktm?=
 =?utf-8?B?VmVHem5MRldNTUhuY2NYeWUrb3ljSC82VDBkVy9FMnBERjhkdm4raUdSd2Nx?=
 =?utf-8?B?dXRCY1hxZVZIWVpwV0JBeVowd3ZVUForU0RSajJoYmJodk90VU42cERsZndE?=
 =?utf-8?B?aDhIOVZvY0QvamtSalpiSzU0UE1Nd1VDcE9uK0VDRjlyWUNnYVR2WUdpT3ZH?=
 =?utf-8?B?RTJBaldzRTRIMFZNZjVWbmZQb1dxSURiT25hM0d1Sk9ZMStYajNKcFN4VGxQ?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e518c49-d92a-4bae-ab85-08dc20caaf60
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 13:03:28.0104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IMAMeD1xZ0/DLGbhOIA+l7JI8Bn88PxRdauZIB7O3cdcHA+x54mhqZJDre+8Y9MsuLlG+d6qhzFRpqhVDV8iFp/1SOiTjIbr+Xkdh1/Ltlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7813
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

GuC load will need to happen at an earlier point in probe, where local
memory is not yet available. Use system memory for GuC data structures
used for initial "hwconfig" load, and realloc at a later,
"post-hwconfig" load if needed, when local memory is available.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
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
index fcb8a9efac704..9b9a1252f3090 100644
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

