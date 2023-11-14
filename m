Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F590C4167D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:04:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D3510E441;
	Tue, 14 Nov 2023 13:04:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FBA10E441
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699967053; x=1731503053;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ThmyUBSg8D0PykjloCAkRbOrfnB7sdI9xYnLr97/rNE=;
 b=G9NaEckTDjU0NUnW0nx1xoqqulrx4NBy4U15n2+p2hkTZAUP6k6pBaxN
 jvQ+67amm++nLtpNAX5Nofk4l3BAe6I4tX0yoHVpstQoG/QjdAFmSQorZ
 64LsIVs4AsRT1V43z4Vla+Umk0Mwci6ezt/fuKmyVpg5cqY2Y2zFgtdcA
 Rn30ACDFj/tK+ULVO56Wggab445vuS8Vxo/Xn+D+vKpgAoX1Vf8MvlCZS
 xI4rrPp3rolAWpXYwlc6n7xYcu0WUlyFxpYTK+qrVfiOtRkiZdSjs1qNy
 +M/p0SvkJpBU4g+je10DYD96/CCEuga+mjynjJTlv4G2dsffMgOLRO/NS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375692147"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="375692147"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:04:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="882046142"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="882046142"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 05:04:12 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:04:12 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:04:11 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 05:04:11 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 05:04:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqml2pAD0hRfWGNRZoEX5l8BIxVYrwpBpNsAZSmJhkmz4P7vGUBo/zh0zr4pWraorDsZ5kr9T185LbeF39wQrp5AkJ5+sK5sl1VfoSpP1OKng/w7HRuPc8yJyZXEp3MfN9nhO4qIB4Se4nuwJ20Ye2GRXc89Q3fimWL20dHW3t+q9IXLYUOEX6gCszciMwN+i4QLPQwJSoyXcNqj1hjNM/ShWcIK2QSF6q8k7JPXTGJi91TMMlRHn1eBGXQpl4Q8CNagnBbz8CMHWQ7v2gegyh6Lr9g+WKU19dvr3tyqMac5e7uGwd0jy9srPNhiz8lQy5p0zdaiDFxZBeV1X5Kzbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCJauImeoNaTnqB4zbwiPsJVQyvNx24Jh0lR3KQmJ/M=;
 b=JF6BLxEjKSLq2FavleJGemxntSbA78GcQNBPIW/2/0GttPOXFKxAmR4dNbaCmIh/YHefsRkrvt+0hCb86sZgV14st0ioA6Fes4TBznY/zojKUXdU3X+UNCtmYrxk6Nj/7nN4n7ajjxUweQaSs0++wH2IeAl5GmShFF5m10YJVSl05Iv36jl7nb2YMU7Q+1c70rpXOK7OFZ8p03DaMsAtM3WxjijuP2ZLHaSJctz83wXgUSw97wjwI+9ATiI/DlTuuo6kEz1MDOFScm6K2Wr7Uqs4bn1oSg9tO3mQnxcKDpKPuXuYVEPJh5VYhVDZ/btxykslSx2ifolWXWmLngxhuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 IA0PR11MB7837.namprd11.prod.outlook.com (2603:10b6:208:406::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.31; Tue, 14 Nov 2023 13:04:06 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 13:04:06 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 14:02:25 +0100
Message-ID: <20231114130231.2299661-15-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114130231.2299661-1-michal.winiarski@intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::19) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|IA0PR11MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: d239fbbb-6239-40af-bc92-08dbe5122ef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BulKmPEkemqTkOGJjSNX6hyjUoc4f914FrTfRjc34CWqirTn80cvnU3/2cqvJU0a8C8UC9dd94GKTtrbuV0qkE2lIlPbFj/Z87+Crgv2IRM4NXq2uGLLuPUCIqVdJ5qnGjWD7G/KYodHW8fJFii91JRmBRUex/tx46VNJ7fb7ckscnvkSKWnytm3bBvg4kVniw371LRNQ8/UpEHLz1BrUJoCyj5awP9GbjyZlVYbmu3oO80FdiNuCLgHFr7thk8gqkJlohEn/YzJY3kUB0+vonmH1BwwAjheuUicS47X7fpGmS8HB0aHtiqpP9slrZWbtEjUTVGiIEW2YpkxVovDEwzxwCMuoExU/pCaPBDjY1/VHG+5GNvLsPWbUNIxEk2IqQPS7gp+KG0h88R1IchuXEfZBrry5Pf73PzM0D0zDfXinIDyoaPFywZAxwlxkCdM9o+iVo9XKJglvUWfr6XxLsuqOtiycYIHzE7CaaF/FzL6fFRihOd114lKqN8y23Bcag56ktoZFPRnQeIGpm77Rm1+z9gz1TOdFk7sChPNCRtwp3tT7t+QV52sAXdVykdZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(396003)(366004)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(26005)(1076003)(82960400001)(38100700002)(83380400001)(86362001)(5660300002)(2616005)(6512007)(6506007)(478600001)(6486002)(36756003)(6666004)(66946007)(316002)(54906003)(66556008)(6916009)(66476007)(2906002)(8676002)(8936002)(4326008)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emZiMERDK3lKM01DZDhHVThzUk1uWkNFTWtoVmtDZ0l5RnB0QVgvTmxqSU1E?=
 =?utf-8?B?d05MRGJOK1NPaXZOckZTaDlzQ09SS2Z1VTNwRDY2Qzlqc1lFeGlyWFV5RENq?=
 =?utf-8?B?RnJsSTlTeE9nK05yQzVESXRpdUZ5cXVKbldYODFkTDQ3aUVRTW1KMGt4Sjg1?=
 =?utf-8?B?aWgxQzZMMGxLWCtNNW5tWlE5bkFDYmN5VkVKcVBwOVdVL1Jra1RuRUYrOG4y?=
 =?utf-8?B?cEtEV0JIUHc0aFJvekl5L00rY0Y1bFVlVHFHK3VSWGIrbnR1RE5laUkxOEhu?=
 =?utf-8?B?V0NtUlNNTUR1a2RsOUhtWS9GOHBKZXB3blFXalFOWkl2cXhHMkFsaEQ3Umd3?=
 =?utf-8?B?SDI2R2hYWWxuL0xlWVBUd1psakVyQkpYaVRFZ3l3MVB2WVhQSWhzRThpWUFC?=
 =?utf-8?B?Q2d3OUNNQ0VnU3NuSHVHRXhBY0hyOHlYMEFSWENzcjVRVnc4SitUamRBYXJ6?=
 =?utf-8?B?TEd4dDVvbmU5d3FZU21zcGF4K1pPY3RQZ1N0Z2NKUFh3ckNVRjlnOEkzeUlv?=
 =?utf-8?B?blo5NlVjZ3NXdkxYY25GZnlISjRNV09nODdDZTFweGtjMFdsSWhMWDhjMEdB?=
 =?utf-8?B?b056VEQwSVNxVjFZNUk0NVhSSFZSd3N2amp2cU1EV1NmN29wTEg3cUVaRlBw?=
 =?utf-8?B?MDBwa29pT2crQ3hKamVyb0RHVk9lcUxiZFRoQVBPd1ppRW8xUS9lYm5FcTlF?=
 =?utf-8?B?NURpMTZkdlNsSERGbW5rRTdnTW04MmFvWGpVSDRmU0g3cXNjN01jRHNaVnFa?=
 =?utf-8?B?QlBFYVIxOC9raXVSZEcxZkd1TTgzbjN0aGhna2tLanpkOGpLSUtaUWRNa0N2?=
 =?utf-8?B?VE9GSmN2NEFCdlh2Rno0d2hadzJ1bCtvTzVpcnBjcjQ2bEwzRkVVQ1dUalV4?=
 =?utf-8?B?N0R0blNiSXBoTndIVEVCNGdsY1lQMGpGSExLdWIyb0hLK21xNWZaTnozZ0Vr?=
 =?utf-8?B?TnBmZktIN2ozOVdUYUxUVnBqSWZKSlloM2F3SUxFUmk0Q09idFhGZTkzUVBY?=
 =?utf-8?B?dHBlKzhtOVNBSkhXams2Y0MrTkRyYUdodndIT096Yi9sa1lrTWpPcWNOanZn?=
 =?utf-8?B?Vng3dlovUFArQlZlOVlIOG1LaExzTFo5b2VHMnltL1AwQnR6Um12U2VQdVRJ?=
 =?utf-8?B?NkhhbHFWT1NJRkU2RGQxSHg3cmxRYnhCOGY2bEIySzFPOVlKWXJEaWhQVG00?=
 =?utf-8?B?UE5OQXg4TEJUM0VJYnAyTzRMYktaVEdxWW8yS2RZSTJzS0NuVlNuby95YTI0?=
 =?utf-8?B?K05wc2ZHTGxzV3RuK3dYN0hZK0JlbDJZYnYwVVQxYXVDNWxzelBQd3F4dzVG?=
 =?utf-8?B?NEZPSzRKa0QrMGgvQWdWekZUc2pXUy9JZU9Id0toYlI1TmFZV1JiUDd2WmFZ?=
 =?utf-8?B?YWdmMkpNeVlid1ovOHRsZ0xrblgzU3NJR0kxRFNGWlFTOENzMjJuREpZZmc4?=
 =?utf-8?B?UnB3MHhHWVF4VlhOU3p1clhHUFkxUFkzRThYbWxjdGtOWUVOMVdqWHdURDVj?=
 =?utf-8?B?OGJoY25YRnR5WGozRVhIOUNPWTNQMGVQSmx2OC9rbm9EMlNQbVJ4Z0xNTVRE?=
 =?utf-8?B?N0lBRmlvbkFxRFhLYnJLcU5DOGs1NmVROEgrbW9XcUZzYkVTb3pQcXB1UDR4?=
 =?utf-8?B?aVl5NWZwcFRhZldmeE9qMTVxZHFBNERMVFdNWTUxZ3pyMElKcVZ6VFBqdFpF?=
 =?utf-8?B?Tk1FTFloV2pncEJvdUVrOGVrUHpCWHp5QmhBNkNueFJvbGVjbS9iQzY5c3Bs?=
 =?utf-8?B?bTJSalhGRUF5Zm1BdWx3K2hlYTRDeDdIUWp4c1lPekRTOUhXSGJQTk5lbEtC?=
 =?utf-8?B?YnFVNVdzV2pGUjdBOWtzYlM4TzBKODJYWFdSR2R4L3lqT0xlcEtLYmsxaG16?=
 =?utf-8?B?UGxsZVhFWm5VTUZpWjdYRGJsS0N4eVIxMTB1OFpZWk9LZ25jSjhJMlF3OHRj?=
 =?utf-8?B?Uyt3ZENNU0FXb3FGaE01UTVuNUNITGZWQzRraEpvcDgxaDdyUzExS3NHSWRR?=
 =?utf-8?B?ZE8wcDRxQjZsNVdqdzlsaUFPVitKWlhNOGlMM0wzYzJ1bEtaMkgxNEdZM2Qz?=
 =?utf-8?B?Z25XUU5ZVlpCNnJtOVF5OUQzS0hZNjZQZjZlOUV2czVzejBPdTFpT1hTUlh6?=
 =?utf-8?B?RHEwK1NJR2xqalQyb3BsNnE1Uk04YXh0MDZTeVhvMXQxbGswOEo5c2VkSyts?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d239fbbb-6239-40af-bc92-08dbe5122ef9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 13:04:06.4797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0bYuWJD6oQHmALvTq3n1n3kWlAILPl6CHXICzUpM7Lyymf1+ucHXM3dYG7yiLAOzLf2uzZlWMeFwCMET+ZriTd74eZHyGTES6qnPDXf6I40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7837
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 14/20] drm/xe/uc: Split xe_uc_fw_init
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

