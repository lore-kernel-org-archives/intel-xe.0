Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFF9C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 21:54:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF84510E67C;
	Wed, 29 Nov 2023 21:54:08 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Wed, 29 Nov 2023 21:54:07 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438A510E67C
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 21:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701294847; x=1732830847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VurglYA52KQh61LJXRZe+rlKLtbhKrLBSpQw9TWZkiM=;
 b=UEiZ3RRpYO8ky3mgHkKtB/j1/UTvOn98Wjs5UvUkFkEZjoZZN5vkIhCu
 xyeIffBj2DmlZ7woWOt7M+2FNZ0KxInwC/XKZNNAUOfR/N2eRE4H0hw5O
 Zp2CcD7j7lrr/+QwCYqO01U7+pxzHiFGdUWfGH+ZR5sgU1FkhHgYroUgb
 aJfq+NfhSBY8oJeVk4A5MeHjTdeUaP8e+mqayu7wp9MS5fK61yUYr+MxE
 Wv3n8iy8rpRRn5Jgw8h+aXMhk6yJ0gzIg0Zlk359ZM+zq5XVSFTBIdVFV
 9WLf9TqX5SCOu1sU+XjYwV79Lo5L2ht31DOsbLaz0FnWDRi0/q2S7s6XJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="112692"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="112692"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 13:47:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="772822620"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="772822620"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 13:47:00 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 13:47:00 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 13:46:59 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 13:46:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gb9B6tkveOYb7OlEkhKIu0dkmZTqp7ScQTydj/bxbom7GVPbAQqk1cVWdONpOmIWyK1xVggUgLesxSitstYk8kusSsTQXJMYJQzTXcdAUmrFOdb34Wkqn7NHcSyzhU+48CTxUbxXmpfmluoIzovl0z0Iw3mHhE4p3Fzb+pTXlBLpDfbERaLD5SeQ7z4CBcN3n/7EHyhtDg+y/cX6SLnJAO3zR5GGhPCJDURYk6oH6HPYMS+UPs1DkaRKuIvAGSk02xWi+jxk22JzBkSmwmfOK+g8rSoGChZvtss2n3YFk+Vep1naneNpOvFEbJ9c7sk+/j2M5KDXQi+J7ThAaRjmMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUqJ3PvEoe3NXg43oN23dIi4d8diPyPJjoeHlTrL6X8=;
 b=JDAa0nOC4opfPNHj7LDn9TBX4OHO5JdhkiZyM/r5xKwVDgjlHZf+I/2oMZpqOeTqvhf9nhy67QsuDHonJXolV/9eLjTQt9MCYOuWmswgc2yW+3h0NmItKBLfsBl6tHzN6ZemajCvAF0ejgQKENhpVKKzuXso+wcGeIqd0WKOYH2A0VCg714xPdojIikJUpaO8ABhPX8i1BJXfGVsoFewDfA8j3sznxeMcEaupaEdD+3yX/HRY52WZymubCAxsv46G3+h3EgYFNmsddtAPG57YiJH4yGR6vxocfadlvvjQ3RMcnXZ2Siu5JGpJVj19xOn0KRa4wZUt8smKe6WG+XnCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4930.namprd11.prod.outlook.com (2603:10b6:303:9b::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.28; Wed, 29 Nov 2023 21:46:57 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 21:46:57 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 22:45:01 +0100
Message-ID: <20231129214509.1174116-6-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129214509.1174116-1-michal.winiarski@intel.com>
References: <20231129214509.1174116-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::17) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4930:EE_
X-MS-Office365-Filtering-Correlation-Id: ee8a878d-2bd5-4e6f-21d4-08dbf124b59c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9VB/ogeuqvkWU2RMm6uNTjAtUiN3cpvNk/M9M79j1W9qoCX6aOXCBw6uP7qyItQABep4DpB8d08+pXtLUPDGVorX1uLIWdxGcPNyTC7T7Z6tuOX2vPZqDSELEKxzW4I2Saslee+wt4cwcnf7lVBjEKCt/qLtAch4KQvqQdwHrBqJRpVWvU3xpmnwmGiGPONOTuBlSQbXd2UwZbMroCrQFJzkr0PHPB8ml+z+PdJuvmr481DSTynfN00FZjc9MOQZ3l/I8HP89RH8NwFbFI3+wbolFrkO/oMvUprzmqnU3mtM48fYb0x10kxLCx/sQLQj/ZNtYrZj6bPoS3cs9IrJhGuMKqmtjWnfp4Ud9jHOCvLKv1LujNNj4cjOxEQMhPB0jVeKtejRghZrGejnCEDPAnI5AnUSMTukm0ylM/oOQ4HDXY3AxuDheQPsInREEHe/7hNs2oritBVcLf+Q2D/4KGrRFlP8ftNX9GZAdur2dmhbcZ6w4JyO6TIfUa7aQEmQ1mOYIZl3m0MffxssLdXFdENonF0V9ep/IOl8xxSdVgLaaZB64HY0cu31d4S+k56d8ixuoYLuH6z/Ng+jMuSNd7xGY98XtzBJJOFFh9HuejsC4e/g6ELAb9peddu10f0I
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(136003)(366004)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6666004)(8676002)(8936002)(4326008)(6512007)(66476007)(66946007)(66556008)(54906003)(316002)(6916009)(478600001)(6486002)(2906002)(26005)(41300700001)(36756003)(38100700002)(107886003)(86362001)(6506007)(202311291699003)(1076003)(2616005)(83380400001)(82960400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHRkQ0htSis2ejdSL1drVHhLYW9WczdJRjZUNDNKTXYrTWwxWEp2SDJjRDZF?=
 =?utf-8?B?b2JNdWNER2xkOE1oZkk3Y29GY1VWM1BBRm5GSGpOYk1PYUFDV2tLbXo2eS80?=
 =?utf-8?B?ek8xOEFhSHJWN3JCRU52c0g1V2lGQXBxaytWSGRLMDBpVlNja0E4b250a1Bu?=
 =?utf-8?B?TE9NakVaVTZhOElGWEhNUGNHQjhQcjhMeTdqbHZadytJelpBTjIvdCtaK3Ra?=
 =?utf-8?B?cE1CTFdaQnRReGpDWTdmd2Y0dU1lcTQ1ajk2akdDRzlwWlhmbE5xRmdUbU91?=
 =?utf-8?B?Tk9GVUk1WDhZVXpXa0hZVDJkQjU5Y1NCMzR4bzBBVkR4dHBXeU5hWm5EQnVZ?=
 =?utf-8?B?RGIvZXBWMVNhMll2UXhqQmpHSzF5MUVCemU4eGFkSkNlNElMdG9weGZaMVFw?=
 =?utf-8?B?Vi84eDFpZTViOE9Gdno3dG5DRkVWbmZ5V3ZST0xGM3pOS1N6dEo4ZEhXWmdN?=
 =?utf-8?B?UWQyWFJxNng4c0hhRHp2UzlDQ0NzUkxGN29SWDFidU5pTXhkbFMzd0VxZHlS?=
 =?utf-8?B?eVVJVlNJZFNNTVRjbG4wQ1E5ZUFJdCtJVDJWRExjeG1rSFllZU9hczMxeHFH?=
 =?utf-8?B?dWplMWhJaUl0K3cxME9GRkFLT25sUVM4b3h2OG16M3d4M2FiR0l6TXY4QzM4?=
 =?utf-8?B?N3ZqSjN5KzlRNGJsTGMrSWhzNHFZcU1pR05pTTNnUlJVb1Z2bzJnUUkxSjNZ?=
 =?utf-8?B?K20reDVqUnUvRTBzM0pnTDV1TlJuVXAxU1czUzhmQVlUY2NVR1pFOVhyc3E4?=
 =?utf-8?B?S1ZnVzZvK0Q3aVlNNjc1bStsSWRiMzh0UUkvTldlK0lSOXF0R294ejNyQWZS?=
 =?utf-8?B?WXdpMEllNy9rTkRYc2NUTkxXSkt2MUJmeFBrNXJhR3FYajB4STRhcThHSzlw?=
 =?utf-8?B?WllIU2tMODE3Y05lSk9meFNnVVp1N1VaSFpDWi9ybm9mUEQzcHU0TWhnZ0cw?=
 =?utf-8?B?NEFlUENiZzlQTnU4eXdQSXFrbVhzbTNHMVlaUzhMV0xDL01nV25CUVNLVlgr?=
 =?utf-8?B?SzAyUDZvaDRHR0xuc2w3V0hWemRLK096WHNrczVHYnZUbmJ5UFByaXFlR1Zp?=
 =?utf-8?B?ZFJrU2tsa1BNeGt1Q3ZJSjBya1BQTGtRTVlCTnFRWDRsYjdwUGljWEtFTTRO?=
 =?utf-8?B?TVZiM0Q1YmU5cmJEcjdmQUtpZVRTQXBUMGJkT3ExbFRodlJXOUpOME5kNURJ?=
 =?utf-8?B?eW1kSFJzT2Exb3p6VzAzb3Z5aG9QV3pkTllvT2Z4OXdTRWlyd000YkdTNlkr?=
 =?utf-8?B?ampScHpYN3A3QXZuQk5MR3p1UkNaRWp1Tjh2STY3YUx3N2VvMnN0N2RqUnM1?=
 =?utf-8?B?Z3VMYXZQWUFlUjVHRGYyTmlUT2ZGeDdqekxDL2dvYVZrZXRxTjZIMnVBVnc0?=
 =?utf-8?B?V3NMWThVM0wwK0JHbzVZQThLOGJLZXdaZXJVL0NPQUxrUTZyYk9NYXR4QU5r?=
 =?utf-8?B?cCtIQ01HR0pIMlpxd1NjYnVSVUdQR2FIazQvYnVYM2laQ3BqTlZZTVhtL0No?=
 =?utf-8?B?VVhyV3ZaK3VKYjRzVm5TZFdpdll0WUNOZ3ZIT1drSFZ0dUNZV3lYa1I4WjZj?=
 =?utf-8?B?cnVpUlNoTkJuOVN4SmFaV2psZCs4Z09CUUJQVlgvREdDdXE2T3ZCdWZrdkh5?=
 =?utf-8?B?RzVTQlpPZ0w4ZjlscmlHWU9WdThxSWxjS0I1UGxoT3BDU3Z2SmdITTdzSjlv?=
 =?utf-8?B?WHBHbVVXUTBCWTE3Rzdvd2ttUXJLYUh6MnlFbGhIYzBaelk3V21Ea0YrUTNN?=
 =?utf-8?B?RmF0akphQWR5Rmdjb0NhdU8zZEhmbUI2UzFoaXplRjdxSUg3TWJPbWFLNVdr?=
 =?utf-8?B?L1lMRmlYYnRhTTZqdEVab2F5c2t3eURWM2Jlek1pSzlvMVVOVHBUNHFTTkl1?=
 =?utf-8?B?cEk0T0RlempqYzQ0Nko2WFNTR3ZQS3VhRXRpb1QrS3h3SS9hQzM4S2dkZVpv?=
 =?utf-8?B?WXhsL0lCcFQwaER6WWZYSnFhYkJuT0R6MTF2YVlDUEU1d0puNnlHUm9KTzZa?=
 =?utf-8?B?eE1jd3ZPc3piZld0U1duOU9Md2l5RDl4YUxOVXorOExXV05WNHQrYTFRcjha?=
 =?utf-8?B?L0poRU1WTkUvYThYalF6ZCtrNWYrQW8yekJqZUtpeDJBSmJaOTJrb1JWVWVX?=
 =?utf-8?B?eW5aR1M1VXB5eGR5OFJKUWx4Vmg2L2ZsdStnL1hDSldUSkJSOThzTTliZ0NQ?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8a878d-2bd5-4e6f-21d4-08dbf124b59c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 21:46:57.1865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8yYLlzoCNOvaZGxamWTBLUaphEm3HtbGGz4OVG+EtIvutdQLfIy/3LulYdR4yBiovswEt3ZdfSYxbO5KZrRnlp1/kq/h4TeCCE2xSHouk2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4930
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 06/14] drm/xe: Move xe_mmio_probe_tiles outside of
 MMIO setup
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

MMIO is going to be setup earlier during probe. Move xe_mmio_probe_tiles
outside of MMIO setup.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 ++
 drivers/gpu/drm/xe/xe_mmio.c   | 4 +---
 drivers/gpu/drm/xe/xe_mmio.h   | 1 +
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index dcb0871083931..785bf2e610b7c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -403,6 +403,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	xe_mmio_probe_tiles(xe);
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 9e8adb73cc978..9769d56988ece 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -295,7 +295,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 	return 0;
 }
 
-static void xe_mmio_probe_tiles(struct xe_device *xe)
+void xe_mmio_probe_tiles(struct xe_device *xe)
 {
 	size_t tile_mmio_size = SZ_16M, tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
 	u8 id, tile_count = xe->info.tile_count;
@@ -409,8 +409,6 @@ int xe_mmio_init(struct xe_device *xe)
 	if (err)
 		return err;
 
-	xe_mmio_probe_tiles(xe);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 218b796629adc..c054c27f6925d 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -21,6 +21,7 @@ struct xe_device;
 #define LMEM_BAR		2
 
 int xe_mmio_init(struct xe_device *xe);
+void xe_mmio_probe_tiles(struct xe_device *xe);
 
 static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
 {
-- 
2.43.0

