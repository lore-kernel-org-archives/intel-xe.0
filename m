Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5201C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 11:45:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD7610E446;
	Tue, 14 Nov 2023 11:45:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034A010E447
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 11:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699962343; x=1731498343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ThmyUBSg8D0PykjloCAkRbOrfnB7sdI9xYnLr97/rNE=;
 b=D2VwXcqMrDbwL6c7wzDtkwkqHmxgyne3iN2J3ZpgTcvfv+Bg4K3RxTR2
 daAqEXRSPOIzmYQM/yBLXXAwMxGXVQWvhwKxsT8dERa1QGFB7IshgVPJS
 V5nEJmgr7Gy/4QDFDjtt3AkfID5zhxQZ0UH4qSOZEorfEPyf41vuTJXOF
 b6u1/Q1jt042ZRKWcl9ZleJ1847Fq1MpFEmntU30VhvUYFRKAOtoOPzkC
 YNc4MYl3BpTjs89sfFrM1HENMdoualm1n843gCd99yR9d+C4UCTAiaoD8
 Y7mrQGnqM55FIC59GyQcUrwQQmvLM5f/NToNcv+vgBXxyEj+YBU74qQO1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="9276864"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="9276864"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 03:45:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="1096069820"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="1096069820"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 03:45:41 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:41 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:40 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 03:45:40 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYmrTDASN9YvBITSW1LYfQXyMMTzKEvFg8uBM2TS4y+kl8wA1YlQstm4jLTFRV/MwERDtfjrWJRKQlS/qAQOq+0GKW4zWjnCrKhaqKdK3qq3B8rZsl6jDGCEKLzw5rOIq2Ii5wAthvPPZRW3S/eeuuWZud4xyOpS2fVCKYI5b1j9GeJlKyHIo7f90pARfpE4K0gzH26gBw+VhPXEhd3ZLbAueK6DgzTl/hU7QTKCy6lyN0C5IZyvfieXWZPW6TqZuGjWKd0B2GL4SMfsT88Cwb3j3rlDRyandPNBNlzHSO2/v1IAEzgObOYybOb7EYwkDtGd4FHvOcUXoQ/E19nMbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCJauImeoNaTnqB4zbwiPsJVQyvNx24Jh0lR3KQmJ/M=;
 b=AoM77tfbkg1o0gxrvhHEHxuQm2H0CE+5PdFy6egleLNR+ab37vkqQvtYlMf5bxKlCT0CY8NPfL7+bEW1OnQQspbYVK7Vk15OpGjRgq4dnQZNO5qnhQU8nTpT9sOt8PpPlCFfABnTwDdTHeODStfh2/KZz4hWfEeRmgYGNncPtOnsT0LRt6DvDngtrvjYNepiTwGUg4NJootaWvQvJ5cT9KTOI8c72TIowIo78Bzmk6qJ3Cqa1MDSrOlFaAvXxuSsO5kf7GyN1r0nHdSpEFYfNovEHV1Yl4iBgbCojN9owpVLmasQsypatzoHc/0wjEnANCeOvfkdZpj+QzfxHYCY0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 11:45:39 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 11:45:39 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 12:43:59 +0100
Message-ID: <20231114114405.2207747-15-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114114405.2207747-1-michal.winiarski@intel.com>
References: <20231114114405.2207747-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::16) To BL1PR11MB5365.namprd11.prod.outlook.com
 (2603:10b6:208:308::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH3PR11MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 4016331d-6f9a-4693-c2ea-08dbe5073893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A9BbIPW+mqNkBLrctG7t3bFug4MoGv3KlEn9N1UUsJYzd8m81jeKJPMLJkNAs5SuTmIIC+rmN2ZAMx4HAum5HHsOwyTeSsL9aZ97S0y9d0dTVA02Z/7wacjssS/mvgwgXO2M9mvtqY0AgwJj6XlV2qAM/ZYJf1i/cEarCKJjjMo5TJcyjQP/Q50mU2JG99nta+ViytqlPNck4+8daW5HkCyviXXT3hZTP5705D5pppjkLFhzQ4o+aPNEeaEzIKHJzNFUqo7dhGUythksROSaq5b+yBRJ7cPUKcexDCA+DWX1k/pqm6gDuhBejFg+JI5hlBf8EDPcNZ1+/nkCKn7uslhRjdi3k+ulKEWwOfg5KvmfsEp05MJx9+GXbawfHieNjWQgMxoDNzxzTKN0o4M4Npio+1Gx216Uq17AHPXd0aim1AGeDI49ISVTBNLi7QydN0ZTFKWtr1cTPnM6wpQFS/vkTV4H+o2ZsxC5EEqDv4Ax0rtmRxFUWvDx+pAWJSEJdulvYB8A4Ctk+Kc7zzqBNMiBWiqr6CNy7jvBZJHIJ8Xo4fL8I7haIglKfjMW5GFt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6666004)(83380400001)(6506007)(38100700002)(2616005)(6512007)(86362001)(41300700001)(5660300002)(8936002)(8676002)(4326008)(36756003)(54906003)(66556008)(66476007)(66946007)(6916009)(2906002)(316002)(26005)(6486002)(1076003)(82960400001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blFuQ1gvc3B5RktpYTVBTjdQLzF6UkNUZXdiVDl6VkhndnRNRFdWbzdjMU1y?=
 =?utf-8?B?WVM4Rm1waTYyTlNKTDM0N0hqcnpOclhnakI5U2xyYVRzREdFaXI4TjZKUmlJ?=
 =?utf-8?B?VGVjdUVIZ0VVUzBXN0VrRFZ1c3lsUzdnMVROdW5OZU5YTjJramVyNCtHUU8w?=
 =?utf-8?B?RmQ2VzZ2ek5DQ2pqSlNQYTBCaUE0bDhYVW1MWTU5eGdYeXFGdW9QSlFNY1Rk?=
 =?utf-8?B?RlVROWpGTzloU293Vk1jTnhKWkVLak1RS2RQa3Vta29QWEFYWm1DckJHRjlD?=
 =?utf-8?B?cE0xZnZGWVJ3RzNsVGVvRndrYitEdDdFcFF6RGJTY1pidzFTdnBGcTQwcmN5?=
 =?utf-8?B?VzN4eWlIb3VxNVd0a0x5aWZOdHZrUFNZQlpaU0RmUWZrRjJuSDl6ZE5KYXNu?=
 =?utf-8?B?V0liMFFaUzV6MXByRXUxQ1dvdDFESzEwNnQvQml3R2FFZG9QdUJNUUJ3NWFh?=
 =?utf-8?B?MmdObnMvWW9vbnY0M2MrNDU3d25kckdBclVnaloyOCtsYjUveWoxUTh1Wm5r?=
 =?utf-8?B?SVlUV1h4YkxKWFBJeVdSeTZZVkYxODFDRjUzN0JnejZtaEQ3WkExM1MvY3lT?=
 =?utf-8?B?YzExZG9IMEFKTnhtelRoaUVvVlorZ2RDUGNTSlltNG5pYWZjN3BLRGpYNXc4?=
 =?utf-8?B?aVlTOFZEeDZpY1h4RkJ5YVZJb0xBQzg5elpkenNHckZHRlRKYUNaR1N4UmZp?=
 =?utf-8?B?RFZJUlJVMUsxMVRWZHRhUnY1WFhQYS9qOGgzb043YjNIbzZzK0x2amk4N0lS?=
 =?utf-8?B?VU1FRllDcXJQOHpmYVo2ZFd2ZEx0UFFyMExnNWFSUnRSVVNTN1M4cmtEK29T?=
 =?utf-8?B?blc0V25kRkdVY1FVVzR5UExyTGNnbEE2Wmt3aTVKb01sNmVTWDlVMFk5QXhv?=
 =?utf-8?B?RnJVdmRpbmNSTm45aEpmK3k3WTE0d1h5TDFoaU5wTUpRRHhEVHJLd1l5MWRk?=
 =?utf-8?B?Mk02QlZMdEVJL2d2eXNrdlNyQkJQYWxEd3kxdWJ3NEg0Vm9CTG80Lzc1MXpn?=
 =?utf-8?B?VTJlRVJZeEVMQ3F3TW40L2xMWC85M3FIeFVGbkJUdVlZd2pUWjZ0MnFHeG9r?=
 =?utf-8?B?R0dvam5MRGpSaUpoa1d1c1RUa2NMbE5YZFpKcDhITnpva1QzQUJXRUV2ZUp5?=
 =?utf-8?B?enY0RmM2VFZ2N0FJc0VETytrR2tleEc2SG9TLy9XZ0RQUjlVNCtaK3V4NGJi?=
 =?utf-8?B?cFdaeGFranFMYkFiR3NnWjFqTDluL1V3eUFEZGprZlF5MDUvQVVpcEVTNnZ2?=
 =?utf-8?B?bFc2RlBObGxOeG5iZTdJbktsZHNjK3VoVUJQWkswY2w3R3lBYTVvcDJsWWhr?=
 =?utf-8?B?a2hYa0JnWGJDa0lGa3g0SlVhZnBjQVI4UWk5QStMN01kWGMrbVlpWGg4YUNj?=
 =?utf-8?B?Q1l0TENkdXVpS2pPdzFUV2tUWnJqTkROZHU2TVkwTjQyQ2luQXFYVklROTgx?=
 =?utf-8?B?Um9QZndDSXdnTTgyLzF2SXd6MnB1MzRVSmt2WXlHZkJmQkRvZ3BwRmFCSU9F?=
 =?utf-8?B?YUZybndPUmNob1JpZDJ3UFJKTHdrTkFtc3dyV1A5NXNIMmp5ZVlmMjJjb0dp?=
 =?utf-8?B?eDNpdW9acis1cWgyWmV0TENhRXhvWno3eFM4WlBOQTJKaE43RUc5ZUpBWGx3?=
 =?utf-8?B?YUJSQ2Q0VkloMTJsclRzV0prU0pjeUFWdi9kQWVmMDJDMUJsNkthSXdma1ln?=
 =?utf-8?B?RGlLNGp0RkJxWGdyOUxxcEt6QU9BU3pLa3hzbVlTM1pjYjhOeFd3bmc3SHdq?=
 =?utf-8?B?Y1Y5b2s3Ny9udHZoUTd2R1VjVXYvZ2taOFRsbUZROG1LdlBONGdwdFBjblRS?=
 =?utf-8?B?WVdRWUJ2b2NCdGZCR3JCNzJ4WnlHck1SYUVaSTdYWkdZWGcrMFVQS3N0eU5F?=
 =?utf-8?B?aGVxSGZtNjRIWStNUlZsQ1g2ZjVGQjNJTFdiNmFwNC9NVjQvbWJwV0JTM0xj?=
 =?utf-8?B?dkpERG1aZ3VTZ3UvK2JuaVE5VXlad0pxSGFYWVo4MUJGWUZEbXpYaXltSzU4?=
 =?utf-8?B?SFpDZGlONlllQjU2WTZucnZ0Z2VNK2xPeE5FeG5FVTlTVTA3Y3B3bFRNVTJP?=
 =?utf-8?B?Zy9lQUZ1QWZaM29pRk1raTZFTFJuRUZDYVlBZEZtQ1ArQTVpWmszcFFrakda?=
 =?utf-8?B?d0xPY2ZvWE9ZZ2Y5bFhUcURGMWN4enpmUklxYWxDNi9ZQU5QblgxTW5pY0cw?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4016331d-6f9a-4693-c2ea-08dbe5073893
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5365.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 11:45:39.0410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBrwa9axZz6QCD9IzbPsq/ak3LL6E7bmijDVxqNuxM5mlvebolzlJziIU4igxrFniD/oWtXhYvX87PFMjBZm5+tsGIzkRV2vn2wXqWGEFuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8707
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 14/20] drm/xe/uc: Split xe_uc_fw_init
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

The function does a driver specific "request firmware" step that
includes validating the input, followed by wrapping the firmware binary
into a buffer object. Split it into smaller parts.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 82 +++++++++++++++++++++++++++--------
 1 file changed, 63 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 3032c4f148d48..df46751fb5959 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -524,14 +524,11 @@ static int parse_headers(struct xe_uc_fw *uc_fw, const struct firmware *fw)
 	return 0;
 }
 
-int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
+static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmware_p)
 {
 	struct xe_device *xe = uc_fw_to_xe(uc_fw);
-	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
-	struct xe_tile *tile = gt_to_tile(gt);
 	struct device *dev = xe->drm.dev;
 	const struct firmware *fw = NULL;
-	struct xe_bo *obj;
 	int err;
 
 	/*
@@ -575,10 +572,41 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 	if (err)
 		goto fail;
 
-	obj = xe_bo_create_from_data(xe, tile, fw->data, fw->size,
+	*firmware_p = fw;
+
+	return 0;
+
+fail:
+	xe_uc_fw_change_status(uc_fw, err == -ENOENT ?
+			       XE_UC_FIRMWARE_MISSING :
+			       XE_UC_FIRMWARE_ERROR);
+
+	drm_notice(&xe->drm, "%s firmware %s: fetch failed with error %d\n",
+		   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path, err);
+	drm_info(&xe->drm, "%s firmware(s) can be downloaded from %s\n",
+		 xe_uc_fw_type_repr(uc_fw->type), XE_UC_FIRMWARE_URL);
+
+	release_firmware(fw);		/* OK even if fw is NULL */
+
+	return err;
+}
+
+static void uc_fw_release(const struct firmware *fw)
+{
+	release_firmware(fw);
+}
+
+static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32 flags)
+{
+	struct xe_device *xe = uc_fw_to_xe(uc_fw);
+	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_bo *obj;
+	int err;
+
+	obj = xe_bo_create_from_data(xe, tile, data, size,
 				     ttm_bo_type_kernel,
-				     XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-				     XE_BO_CREATE_GGTT_BIT);
+				     flags);
 	if (IS_ERR(obj)) {
 		drm_notice(&xe->drm, "%s firmware %s: failed to create / populate bo",
 			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
@@ -587,28 +615,44 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 	}
 
 	uc_fw->bo = obj;
-	uc_fw->size = fw->size;
-	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_AVAILABLE);
+	uc_fw->size = size;
 
-	release_firmware(fw);
+	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_AVAILABLE);
 
 	err = drmm_add_action_or_reset(&xe->drm, uc_fw_fini, uc_fw);
 	if (err)
-		return err;
+		goto fail;
 
 	return 0;
 
 fail:
-	xe_uc_fw_change_status(uc_fw, err == -ENOENT ?
-			       XE_UC_FIRMWARE_MISSING :
-			       XE_UC_FIRMWARE_ERROR);
-
-	drm_notice(&xe->drm, "%s firmware %s: fetch failed with error %d\n",
+	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_ERROR);
+	drm_notice(&xe->drm, "%s firmware %s: copy failed with error %d\n",
 		   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path, err);
-	drm_info(&xe->drm, "%s firmware(s) can be downloaded from %s\n",
-		 xe_uc_fw_type_repr(uc_fw->type), XE_UC_FIRMWARE_URL);
 
-	release_firmware(fw);		/* OK even if fw is NULL */
+	return err;
+}
+
+int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
+{
+	const struct firmware *fw = NULL;
+	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
+	struct xe_tile *tile = gt_to_tile(gt);
+	int err;
+
+	err = uc_fw_request(uc_fw, &fw);
+	if (err)
+		return err;
+
+	/* no error and no firmware means nothing to copy */
+	if (!fw)
+		return 0;
+
+	err = uc_fw_copy(uc_fw, fw->data, fw->size,
+			 XE_BO_CREATE_VRAM_IF_DGFX(tile) | XE_BO_CREATE_GGTT_BIT);
+
+	uc_fw_release(fw);
+
 	return err;
 }
 
-- 
2.42.1

