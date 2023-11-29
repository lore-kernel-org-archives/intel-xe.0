Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9C6C10DC2
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5186110E6A1;
	Wed, 29 Nov 2023 22:36:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B8B10E69F
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 22:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701297358; x=1732833358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VurglYA52KQh61LJXRZe+rlKLtbhKrLBSpQw9TWZkiM=;
 b=mls/o+SvEsOjBh/eSMKR2CbemlSWDReznydP4a4cT6RGGM/N55hNSynf
 /FMXKjiigv2hgTHyZwuWPYUBBEcLRlsE1/NeQb+aTqIevqiGYkFaLFmdG
 W7CSKliKDmR9Vnx9bq0k8NKgJMUKryL3Kzo2GsirkWc3dv7YOpZ+WTWGq
 cSn6ln/om7oR/iuvAYTki9uResMzvB1CwIAXk8o9jCke+oY6NmO7XfDwD
 RFbZft2+5Srbky+nIhxiPJ61Ik2Xk9/IUZgXL027S5cY0Mj/gBztvTC8K
 P7Zjp0/nOZi9sDetPJtbZxfIHZ/cfjc10PHydCymQQEgu9xlKbUNAjaQO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="219732"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="219732"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:35:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745418044"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="745418044"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:35:56 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:35:54 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:35:53 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:35:53 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:35:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axPtHpR4Ddqq1a6r3oR7wYnmLgwLAfJtSKAXlUF/dmQTaztVC6iNVs+cal2Dek/hI81ptjPN3wipfo6SGLY8wXbC2/6obke/hR54VrHzxVY/kYPYZ+8N0KOMs35tImyEj3nJ/wG6u6fi5nh/ZdQTSVyg1KqdmWXBTWwj3WhDZuU3qKaHfcC1ml+OLG1XZLMgUawT4CDp8G4qPRnNlQL82HD6TUcd5702IvmD5jjYMBgvJAG8fif0JcrR1NUsSCLGpF6a2dRwmrqLKFUxhqkkwHa2SPB/WVdLZxgVj+GqLu4La9a439dyqIzhcHXtt3moTcJ9vu+5BA7UGUNaKD+WDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUqJ3PvEoe3NXg43oN23dIi4d8diPyPJjoeHlTrL6X8=;
 b=IyPZCv3fxtP+DbzEYfNkC8E8mQdcK7tShJO/BNgVeGESNyq2e+R6pEHHliRCRUrs/0EUwgVigizfeRgIuZ1dleNTFDzNWlpj1sDaTf3DqGfwE8DoesmOxA1aMEAkaYLE6Tsi+WP7TtySDUfOlR1vQrvzuvtxOENxXNsWcCsdljv/LiRFq2IRmDDm0ZnlDUSo7LdkhBPRvbeAKmr/f5BsNnrM7VDQ9b4jcKJBWyxluXuz9vEdYoI0eFbErKekPRlcnb+sexAxF2D7CDVlft+FcjT5Bo4Rn6j9b1NlXm3XIeoZIScCzcq1hkb8q3834bssAx6gjJhUt+sOIdPkI9fh9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY8PR11MB6962.namprd11.prod.outlook.com (2603:10b6:930:59::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.23; Wed, 29 Nov 2023 22:35:45 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:35:45 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 23:34:50 +0100
Message-ID: <20231129223508.1189461-6-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129223508.1189461-1-michal.winiarski@intel.com>
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY8PR11MB6962:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a6fa8f8-d7ec-4cec-3d58-08dbf12b86c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PjBvO8BUy903AdK1LA6P/8zv3FEAsi46Gdt4VigCcv2ZGXPEPSAhrHQyG67geuWEfTs1qCT1nrcPFmM5UcXrbwwuRJ4f+u5nETyedujCLPXfvkw44L9FIrW160ukFXI1CVcUShPFqoLa5VOZfadfDqfcY2d8/qXVDrF3fHQbd9cZOEguJNlsCLKZfaP17oWYs/j+7mr3b1Nz108SctLPsTw81MEut4OisyMiEsiZKYdr7/sbZgRoAiZwY45Blgkl2z7LXqB+4mQwifcMr2FDm96m/IPZ7CLJGlf7H3G35S7FTwH/ZdGkpBlL933TjvmGlbQPrvDUW6mVFVwnqIsAg4lg7r1QBk4+VKmnkhkktlMJUWYLRL+/k30sNHfBlK5Sv5yqI8pallg0cnURDBqSrpmHy6CEbev4RVKPMzj8Y3hbTBGjz+CQOxvJL/3xfBtKFEa4m9WhEwYNJqFfIfjMrncgISBB76GQdHRkIuwjOhOjY8w/G9SkDbByndCSfSUJTWpq6Zh12MunMOBK5AOzL6kI1MgJK0We2ZMUsjuBi43pb3wcmZhXbg9SDQGxCklRyavDgQG5byq4Kjm2+WcjFewZr1dGrgLPuKYrHswjbzYqxrYUiuTpFcyYKUh8dika
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(83380400001)(26005)(2616005)(1076003)(66556008)(54906003)(66946007)(316002)(6916009)(2906002)(5660300002)(4326008)(8676002)(8936002)(86362001)(66476007)(6506007)(41300700001)(36756003)(6666004)(6512007)(478600001)(6486002)(82960400001)(38100700002)(202311291699003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWw3NFJVK1VGTHdrQ2lTYnNna3pMNFlrVmFuV1lkY1hSSThIRWJOZXZ6T3RN?=
 =?utf-8?B?RVVqdko1QkdRNjlrVkZrZ0ZkSzNIOURFdlNZcTVEamYvc0xzL01pVXRNVVJu?=
 =?utf-8?B?TFl1OWNhL0UwTjNicDVSQmxMRzBIWFdraFRDT1VMSXZpeFRYUHlHM0RGMkxJ?=
 =?utf-8?B?VG1UOTgydXNqT0RHekFBak5mMGVtZFF2ZHdsZExhS0xaeE92R3plcGJkdldw?=
 =?utf-8?B?UGF3QzhGUGxXUDdSbzdxd21yallHRDJFL21Bc0F3TUhBblNUamkwLzdSZGl2?=
 =?utf-8?B?QmFzRXFQOTJpaG1NZG5sZEZrYjRPREduOFMzK0JXVng1TnIrUUd3ZkNoMkVD?=
 =?utf-8?B?aXN1UVhkVVJwamE0ZGNpbHBHai9VWEM1bFFib1FWOUVrbmwwRVdrMEtWSlpy?=
 =?utf-8?B?TTN4a1ZvaHFpZjkzY3hWTGRVcnpRU0RZTWhtSnUrV1ZCZ0ttcHVXamMySHVU?=
 =?utf-8?B?QWtqbGRSZXpXaitIbVN2aFBlZWhWaUZFcjgzcy9TbksvS20yZUNib2xyUWFK?=
 =?utf-8?B?bUFTWUZYNE0xT1BOSFRMaG9JVC9NNE5KR0p3V3FJTlI3NFk5UTZWVzRNdE40?=
 =?utf-8?B?TGZCeWdmd3JwZHp0cWZxd0dLRVNac3YxUTdDNzM3WVVnUnBjaDloSGlLT1BM?=
 =?utf-8?B?OEh5YUI2MzcxTldJd25JVXJhS1J3eGFHelRWL0IxWmdhNGVJZFB2QXNGVXd1?=
 =?utf-8?B?YWhnRUpsWDY5S0hvOVJIWXZPSkhjQ2xNRWVoQm1ZdWY4R3R4bmVabHBmdFV6?=
 =?utf-8?B?TEpKaXpmaWtacEdOMC9nR3V6cnlUUDZYbkNhTlZhNEhZdU5qVzR1dW94dVFD?=
 =?utf-8?B?UVdNdm5lTGhVYm9wN0lUN1MzWGkxOGlwYlNYc1JQZUhEUXBSNkw0eEw2eHFH?=
 =?utf-8?B?ZnU4WURzVi94RWU3QkxOYmpWN1ZaSWM2ODFsTUJoMVVDdlp2SHNIQjlIcklJ?=
 =?utf-8?B?OTExaStnMUdMTG1mdHR1bllJNThkMWwyZ1llVVdoRUhZMEVhWk1SUjgrV1Bm?=
 =?utf-8?B?cFhiV3g1TUE0cHZFY1pqMVVHb3BhQitqaEJVeHZlNGNTejM3YmxpWUFlcWxH?=
 =?utf-8?B?MkR5QVFSZzJaRUhWNTJHRHFPQ0NtMDlwRzRQQk5iUG41OXkxZ2g4ZXJxUmV4?=
 =?utf-8?B?ZnNvV08wUDE5R0crZ2M2TEhxeFhSZjNjZ0F2djE4c2w4NVlZTWppVml6bGtp?=
 =?utf-8?B?Ykl2Sm9YTFFURU1PMFcyUzRpNFB4OHR6Tlp5aDBhUHFIM25IQjkrbE13NEZj?=
 =?utf-8?B?SDZqblpiRy9udUZxY1VUelFPM0FWRUNXaWJScDJHSnIyd2FCN1dDMGtjWDd0?=
 =?utf-8?B?SlJrQTJvOWk0T1NGS1FhY3JFM3BqdTNoQThWem96YXFuN3hqZWNRMktXTlEr?=
 =?utf-8?B?N09aK2dPcWNhbXFheEtaRVRmb2NYMXg4QklMZ09POUkxd1FuYWlicEtVa09z?=
 =?utf-8?B?b0JQUXNZc3ZYVk1qcThMakc0Z09GRkNUOXRvYlZhY2lCaTVvbVlQZUswVEda?=
 =?utf-8?B?U1J5ZWNSSGptcEVVRU1sZlBRZFROSWJjcGcxSFhzWFRUdEZGWk5xM1N2SnpW?=
 =?utf-8?B?anYvdk0xSm50VHBDaWJYK0ErUDc4VDdZUE9VdW5mZTI4bk9zT1VzNTR2Ym4v?=
 =?utf-8?B?SVFLU1NOZWdlU0FBY0h0ZHduOExPNTZGeHVtUGdyWGxkN1pQTmM2cjRzcGpx?=
 =?utf-8?B?TDBNNWhjb2hUMFkwT2tjOXhHbzNuVzVTSUZqSzBNaTN1Z3dHSEQrZHlrcDdZ?=
 =?utf-8?B?VWxucG9zRkNPU0MvUk5LSDgyMEx3NHhsalQrS0JuWWlWZnpCN1k2TEh1d216?=
 =?utf-8?B?RVlpNjJacVlpYlBzQUkzQyt3T0UrZnZMYklaRFZ2SFFCZFBhVkZXSzJRekNY?=
 =?utf-8?B?aGdPV0tTQ2VvM3VKWmN0Q1orc044d2xJQ2M2UCtyMlg2bERQa0VzMksxVktp?=
 =?utf-8?B?M3IzV0NWSHFueDFxTUtSNkl3OW5Sb1ArSU41NW13WE5oNXZ6MHpqRy9MdFhQ?=
 =?utf-8?B?bVczYzVYM3Rob0svcm1sNWJsYnIxMVBrdDhNeDlrU1F1MXpZNWNPS21QL2Nv?=
 =?utf-8?B?blByUDZFNEZnUGhWMS8xdE5IMGRqU1dieDRTVVdkQ3FwYlZGVWpvRmFUK3JB?=
 =?utf-8?B?V292UDhlYjJmWnRsdG9mZDdyUWxIa1lpN3VYTURoK1hXeXM1MzE3eXRaaVUy?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a6fa8f8-d7ec-4cec-3d58-08dbf12b86c4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:35:45.2484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ARbVeFnSy4PqVbpGFU0ktSzob0tbOc3fMJgNYHpiqd1gXS+woUGr+EnpJYOVDh34IZfYXx6QXEV9sIkC67XWZUb8bA076suIYXrDs7T2ZWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6962
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v5 05/23] drm/xe: Move xe_mmio_probe_tiles
 outside of MMIO setup
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

