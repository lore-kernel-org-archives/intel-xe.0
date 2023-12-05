Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C05C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 01:33:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BA310E37C;
	Tue,  5 Dec 2023 01:33:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0733E10E380
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 01:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701740001; x=1733276001;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=S+Q5aNSkDDYcgMSaGBAWvdN3ge0wJgQcTOcVMfWafv8=;
 b=Iodon6yZV22OclDwNnyimh9PHwHrLMQSvgI+3Aw4oYtqgLweUZIMkGmz
 vuXv0sljZrR6WAy6rNHktLq2DU9TNIOiwzD6NsnEINRX0HXY3UrUzmPba
 XVmZK9jnOKgBSO1X1i3Tibqhk4aOUd8Tk4gZkjrbBW3EDOpARV2cotrS9
 v1k75DxQsWNOAbIH4LjoQcWwZGcsdhOZvn92ZeadMhT6NsK8I9YuRGkVO
 p0y32yhx+3PO3eS5TP0X/3nMexEDzX/hGST7H4vgN9zlQwEwplOUkX8nF
 Ocwyw0IjfwYS67enTk65Gvjnhe5yav+Z8x0wKljbEiWb+IkCET5yTijFd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="397723546"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="397723546"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 17:33:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="747035836"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="747035836"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 17:33:20 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 17:33:19 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Dec 2023 17:33:19 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 17:33:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XhY6uUr6buPSDNjayMkKw/OsrUUKyyKrUon0RVzWn6YqnbeV5o8g5eomFJZWBTC3jPJM7sVHGRL8SIHPJZbhb87nrntOizWqUYDO5n5gk6daDGSiu2ohv8dNKe9iTihQ64FqKiVSieM4xbnKlqzixp/ypayoL2BLqRGpzRd8nsmjOG2VQo4fBLmkxZUVV+ZrGQ8A2RkNxDohrKJD78IgX8vruyXT4vphuALJG+nBluUFCiP+r9lRZL3MSsy0GhPH2vCdL0vgbkFU8E/7EzPDkrFeFuhuT3FinDhQ9ZsWli41HpQYxO3HrcAFgrsIV0Gc9+Kh7LZPFHQgC4QEgfNZ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlrvunD+oXKhnAUSL/bDHkHiFaVWsKzgwW1Wk+Gpn5g=;
 b=HPB88aw6uQ56Z+r4Jj9rA9YgR4dGjWCgY3WbCvKjf5FU7jbJiZBs1OiuhC0omanmB6NgWzNcg+16TSNRAnKa5/xyNtl6U6ZoRY4pZS9T2PqC7NHDIgmy2mUKtL2exg9daPCkasbCva6h6jUgzHUVSiawGcoaCoCXOgVYkGjgEg+VPpSDAhwQlf2wiLvC5wMwoMHgrlZLAeXuUFdkHAUtS9K0OMGrV/EdTSs4LU+AdpSocpsaccBoHt2xhuK+81wchoDLUP8EacG7h4LL0C5AmvJ2D0WseiEwKfmhTUwi7dZDLKHm2t6z6+O3i5gZrIRgledGeQecpADFqC8PYRRKzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB7051.namprd11.prod.outlook.com (2603:10b6:510:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Tue, 5 Dec
 2023 01:33:16 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 01:33:16 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 5 Dec 2023 02:32:56 +0100
Message-ID: <20231205013309.1497006-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0009.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bb4c8b4-cb10-459d-4ffe-08dbf53227a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fNO/ZBGE2zABG6C/AfIVz0scfI3/b0SyADMtdjwU6zfr5xDuWuQ2mIvVfVspjZXrDOIhY4sr4v/rdt8vUWOIL+jWxyd/iAJ7ZbFw/Od49vEZT5QRSe3Q0/dLRupaKK3WI1ykuXhMRR92j61tMy8upY2v/gHLBxdkQdaWh+YcKSWYt3aa0u/nDeBD68DFo3YysCvnq23BWNN8wh8obwAmSyEg+5mUWg/w5gLfFtd2J2bNx0bMpzA/mcyOCUaqvGgaWzFgKWY9xlTpYyrsZrDZAjdYI7/Cxo8BXpqzNLlOlzYDySQEMMd2paNOEpAr/wCWVvXxcBcIFVV+bNNK4UGIxqgYRLwhCfvSesi6q8wzpKTpkFUFL2sby8cYEaV3o87xfMJyKMdJ8Y1jc08nQEfOP8sk2ysF5MSSNNRJwOJ/4o1Hr+cR7akfeW1rGGgY8YkRanaQfHDtdyIHaCgxhdvSdww3w8QB1kkb9aGjLVLL/7K/x5z/+5WLarA4qpc2rUEu/sYxTTdi6gZia+avakyV6e/tKUBVBfPuyy9zai78vo3o6K929aukq6T7tlVK6ZtG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(39860400002)(396003)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(1076003)(2616005)(107886003)(6512007)(26005)(478600001)(6666004)(6916009)(66476007)(83380400001)(6486002)(41300700001)(2906002)(5660300002)(8936002)(66946007)(54906003)(66556008)(4326008)(8676002)(316002)(6506007)(82960400001)(36756003)(86362001)(38100700002)(66899024);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzRnRDl6Mml4TG9Qd3U5RkIzZm9aMzliOHRURTcrTE1aOFJvVE4zZTFabHg2?=
 =?utf-8?B?Z3ZwbGg5aXVqby9kWUNQMTZXR0d2cGFua2xPQm5hL2VDRVJmbUV6OHdzSkV3?=
 =?utf-8?B?Q2h5TXliWmp6RVdjOFBUTE02OFBVMWh0M01wNXN4VlBhcGk1b2tKNnRpeEtk?=
 =?utf-8?B?bkNjQS9iRjN3bUJPeGJqVG81ZWpkMHlDclo5R0dRMUVLMXoxaXFMN3ROR3Bj?=
 =?utf-8?B?STZaOTF6VFozQ1lmWStTTFV4ZC9qaGN6TnhjejMzY3ovUXF0cFNaSW45bnVa?=
 =?utf-8?B?R1krZW1oaDBWMktRdmhnVTljU0ZJREVPUzd6OGlYUjdTbXJzdGVyLzNPUUg5?=
 =?utf-8?B?eitWZmRSTTNFbW9QbWtWUUdST0lpOXhmMitEVXQ3TEt4OGNCK25tWTB2Z2Fo?=
 =?utf-8?B?RnBzeSsrRXFCYmNoaGFiamw1Yk0rT3lYaWVhajNEN2JtQkNJUkN6QnY4Wk5O?=
 =?utf-8?B?blQ1U2lmNGVzL0xoWmJxS0d4QStBWkxQUEhPbXdjQm5XRXU1Qm1CT1dDajN4?=
 =?utf-8?B?K01KdFVseDE2eU5JWHJISWtvaU9hWmJCcStHVUR0bTFWcnZXeThjV2hHQytJ?=
 =?utf-8?B?cG9rR1J0aEIvZVJFNE4yQnd6cU11YTVZYW9JU0VPR0t3bytxenRqSm5BMGhx?=
 =?utf-8?B?eUZlbEtROWkyNXF1MVE4NzdqVWZ5U2hQRzgyMFdyajNBaFZraFEzK09qMkpp?=
 =?utf-8?B?SmR1OVA4NnFTK3JDL2xWVXpVWndRbDh6VlpjQlRnOENLRlZXMU9HL0k1czg2?=
 =?utf-8?B?USsrVTg3eGhBYVNQdFUvMGc3S240aTdFVWM2VXNHREgvZjNkd3dwV1RXaVp3?=
 =?utf-8?B?UGY0K1NQbUpjWnBwWittTHk5c1lpTng3SHpzZjRSeGFYMktFcjkzeHZqZTlS?=
 =?utf-8?B?ZElVRFVRMU1tZjRGcGo1RnQyc2NVeXcrRFpqYjhkcGZrQnMzbmZDYk1ScVRF?=
 =?utf-8?B?OEtGYTZYN2NXRG5aQkVoMTd6ZVM0ejhnQ2h0NllFTWtXamliNVVMRlFKeXQ0?=
 =?utf-8?B?Nis3VjNQa21CMjI2NlJ1REtwWkNaTDcxYVBLMGR5ek90MzdhdUxHU043NnRq?=
 =?utf-8?B?d1JjSGRJV0xJWUdWVmdGRGdhc20xdzJDc0ZoV2NaSENYeUhHT3I4bHdKUlVX?=
 =?utf-8?B?MnVFajFJN3hESndxaGh2Z0xlNkJTZ00rV2FXWk94S0E5TzBuREZTejhJOUo4?=
 =?utf-8?B?eFRvbkwzL3QwcWtMaTFKNmsxZ3lscmp3dkFLV2h1U3VMa1RHMlJrWkJXc3ZO?=
 =?utf-8?B?VHo4Z3NsU2FnSlVpM290NGc5aFpZZ09EQVpmTG5LWloxTi9TMERYYTEvMVpF?=
 =?utf-8?B?YVFiNlFtaXdqTVl5VzZPTkVmSDBoMG8wLzFJYTZydm5yRHZjcXFoMmlONk0x?=
 =?utf-8?B?VkIwU3FVVkhmNzYwbVVZSlFuZHRvNWZtdzR3VVEzNzYzbVc1ZFhib21RMjNV?=
 =?utf-8?B?OUxzZW9OaVl5aVJnV3dHeTU1ZzBlWHVqV1pxUTVmS0FIWmV5MGFpbEk4NWRp?=
 =?utf-8?B?NGdDSHV2U2drT3IyQkx0MEd2RUZJVnhDUUhrRlVlakdXcnB4SCtnakk3c1V6?=
 =?utf-8?B?Wmx0QUZFQU40eU9PS3A4c0VoU3Y1T2g3cTNzcTdDN1JiTk83RTRITjF0ands?=
 =?utf-8?B?K1ByTGVjb0wyem1jVUlhV0hHNGVBc0tQUjRkQSsyMkJFdVpPZkQ3dTk2NEph?=
 =?utf-8?B?dGZnOHljNTNKMytFOE13aFJNaHI1a2ZWMVdlcmRGZnJySVZvR3JqVkVzZ1JP?=
 =?utf-8?B?V2JqcHNZdk5lR21RbmFQYnR3a2tkbG1SRldDRU8wMTh2MGViMXk2MDFJTkFm?=
 =?utf-8?B?RXNtOTZ3WVlFOGg3M1JHb04vYlUwS2hKMVRobVl5UGRzaEdtSm5ZWmlmOXBX?=
 =?utf-8?B?ZDJ4dkVlQXUwaVlySDJXMEZHRS8zREJQSU5tQTQ2c0plTzBLTHg1VnVvQ09F?=
 =?utf-8?B?akhIMy85ZXA5dVEwK2E1NEhQdVlGWk8vd0ltK0JYSlRhVTdPcG13OGRDbCtR?=
 =?utf-8?B?RHZQSjZITFM4Ny93K3JWcWpHMFNad0VVU1orQ1lxcUNhUVJlZUtzS1RLRmNX?=
 =?utf-8?B?VE5lUFFtV3I0ZEZkREhuMzRRcng0L044MjlRWVdFU3RHWmRFQVVQYnk4TlFr?=
 =?utf-8?B?RUg1aExsRVUrbndRbW00emx4Mk1KV0EzNVNlWnFpajA2WjNMbXBGV3ZnQU80?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb4c8b4-cb10-459d-4ffe-08dbf53227a3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 01:33:16.6700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0NdooACq+pwjo2ic2aHjxTkhx6pw3+JCOAU4CbpbuThfWY02VDuKOA9YbJe8eqGkhtnmhIB2L/AnGrlY4ykOPLouQKokYQt6XWAY3gnMbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7051
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 01/13] drm/xe: Split xe_info_init
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Parts of xe_info_init are only dealing with processing driver_data.
Extract it into xe_info_init_early to be able to use it earlier during
probe.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c |  3 +-
 drivers/gpu/drm/xe/xe_pci.c       | 78 ++++++++++++++++++-------------
 2 files changed, 48 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 306ff8cb35cb1..d850dca85af17 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -143,7 +143,8 @@ int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
 		return -ENODEV;
 
 done:
-	xe_info_init(xe, desc, subplatform_desc);
+	xe_info_init_early(xe, desc, subplatform_desc);
+	xe_info_init(xe, desc->graphics, desc->media);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 6977f48b03c8e..10c150627cf4a 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -474,16 +474,13 @@ static void peek_gmdid(struct xe_device *xe, u32 gmdid_offset, u32 *ver, u32 *re
  * media is optional.
  */
 static void handle_pre_gmdid(struct xe_device *xe,
-			     const struct xe_device_desc *desc,
-			     const struct xe_graphics_desc **graphics,
-			     const struct xe_media_desc **media)
+			     const struct xe_graphics_desc *graphics,
+			     const struct xe_media_desc *media)
 {
-	*graphics = desc->graphics;
-	xe->info.graphics_verx100 = (*graphics)->ver * 100 + (*graphics)->rel;
+	xe->info.graphics_verx100 = graphics->ver * 100 + graphics->rel;
 
-	*media = desc->media;
-	if (*media)
-		xe->info.media_verx100 = (*media)->ver * 100 + (*media)->rel;
+	if (media)
+		xe->info.media_verx100 = media->ver * 100 + media->rel;
 
 }
 
@@ -492,7 +489,6 @@ static void handle_pre_gmdid(struct xe_device *xe,
  * based on the result.
  */
 static void handle_gmdid(struct xe_device *xe,
-			 const struct xe_device_desc *desc,
 			 const struct xe_graphics_desc **graphics,
 			 const struct xe_media_desc **media,
 			 u32 *graphics_revid,
@@ -536,32 +532,59 @@ static void handle_gmdid(struct xe_device *xe,
 	}
 }
 
+/*
+ * Initialize device info content that only depends on static driver_data
+ * passed to the driver at probe time from PCI ID table.
+ */
+static void xe_info_init_early(struct xe_device *xe,
+			       const struct xe_device_desc *desc,
+			       const struct xe_subplatform_desc *subplatform_desc)
+{
+	xe->info.platform = desc->platform;
+	xe->info.subplatform = subplatform_desc ?
+		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
+
+	xe->info.is_dgfx = desc->is_dgfx;
+	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
+	xe->info.has_llc = desc->has_llc;
+	xe->info.has_sriov = desc->has_sriov;
+	xe->info.skip_mtcfg = desc->skip_mtcfg;
+	xe->info.skip_pcode = desc->skip_pcode;
+	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
+	xe->info.skip_guc_pc = desc->skip_guc_pc;
+
+	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
+				  xe_modparam.enable_display &&
+				  desc->has_display;
+}
+
+/*
+ * Initialize device info content that does require knowledge about
+ * graphics / media IP version.
+ * Make sure that GT / tile structures allocated by the driver match the data
+ * present in device info.
+ */
 static int xe_info_init(struct xe_device *xe,
-			const struct xe_device_desc *desc,
-			const struct xe_subplatform_desc *subplatform_desc)
+			const struct xe_graphics_desc *graphics_desc,
+			const struct xe_media_desc *media_desc)
 {
-	const struct xe_graphics_desc *graphics_desc = NULL;
-	const struct xe_media_desc *media_desc = NULL;
 	u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
 	struct xe_tile *tile;
 	struct xe_gt *gt;
 	u8 id;
 
-	xe->info.platform = desc->platform;
-	xe->info.subplatform = subplatform_desc ?
-		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
-
 	/*
 	 * If this platform supports GMD_ID, we'll detect the proper IP
 	 * descriptor to use from hardware registers. desc->graphics will only
 	 * ever be set at this point for platforms before GMD_ID. In that case
 	 * the IP descriptions and versions are simply derived from that.
 	 */
-	if (desc->graphics) {
-		handle_pre_gmdid(xe, desc, &graphics_desc, &media_desc);
+	if (graphics_desc) {
+		handle_pre_gmdid(xe, graphics_desc, media_desc);
 		xe->info.step = xe_step_pre_gmdid_get(xe);
 	} else {
-		handle_gmdid(xe, desc, &graphics_desc, &media_desc,
+		xe_assert(xe, !media_desc);
+		handle_gmdid(xe, &graphics_desc, &media_desc,
 			     &graphics_gmdid_revid, &media_gmdid_revid);
 		xe->info.step = xe_step_gmdid_get(xe,
 						  graphics_gmdid_revid,
@@ -576,15 +599,8 @@ static int xe_info_init(struct xe_device *xe,
 	if (!graphics_desc)
 		return -ENODEV;
 
-	xe->info.is_dgfx = desc->is_dgfx;
-	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.graphics_name = graphics_desc->name;
 	xe->info.media_name = media_desc ? media_desc->name : "none";
-	xe->info.has_llc = desc->has_llc;
-	xe->info.has_sriov = desc->has_sriov;
-	xe->info.skip_mtcfg = desc->skip_mtcfg;
-	xe->info.skip_pcode = desc->skip_pcode;
-	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
 	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
 
 	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
@@ -595,11 +611,7 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.has_asid = graphics_desc->has_asid;
 	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
-	xe->info.skip_guc_pc = desc->skip_guc_pc;
 
-	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
-				  xe_modparam.enable_display &&
-				  desc->has_display;
 	/*
 	 * All platforms have at least one primary GT.  Any platform with media
 	 * version 13 or higher has an additional dedicated media GT.  And
@@ -712,9 +724,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	pci_set_master(pdev);
 
+	xe_info_init_early(xe, desc, subplatform_desc);
+
 	xe_sriov_probe_early(xe, desc->has_sriov);
 
-	err = xe_info_init(xe, desc, subplatform_desc);
+	err = xe_info_init(xe, desc->graphics, desc->media);
 	if (err)
 		return err;
 
-- 
2.43.0

