Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784C9C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:17:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F0010E5DF;
	Wed, 29 Nov 2023 01:17:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E1010E5DF
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 01:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701220649; x=1732756649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=WkzEcxXEra3NxjetHFEfkMHDApx2piX0N/bRoneG+8w=;
 b=OR2fnM2N+MH3JdpXfT6gSruYKD5bA76xrKqqGLssjGYST522OUyxv9DD
 4mpDHB5yLKrTT6/IYF/CbzOInWosqZaOZ8n3mmyPBV2B+M1CYxs9F36h9
 l7CkFkduyPsX74/vInPRZQVFc1RHgOp31ALYWC0Wej++TN6P1Yi9wV1BJ
 Jwec8HlzupPXm/JBAJk3uKHpBcIi/s9cQ7SvzyBXS7cN9Jjktmn2wRFlr
 l/Ry6MVM0r+jK7Yj9jx5VYVinRGd3HurJUK1tpqVaAYGIlofp56NTfrJC
 DUvZxwAyB/6U/6eWMNQqa0YdP2oanmslVWkoAAR9RwiNai9/3upefSGYS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372436642"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="372436642"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:17:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="892272742"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="892272742"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 17:17:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:28 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 17:17:28 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEFhye6RAgKcfHYRWf+rUcREUSkHXamr+fLk5ylix3dA4GDHkpfgFz9fwG4KASk086Yu0dKVvYEsfdJglZaVgd79GW7jrhNfekoxE47nUJ2te+KJCW1a55vAOtAgTaoquyiyPETgCd1CN/7nkj6n/7Zg6DgHlxzn4Np0shQvfJ00Mu7oonRC7Eha4iFb0eoSoBnQqf8LcoajqZQvdBOWZEmSPa/KhLmDavq///GWRge9++6ttNuwR9dk7zXY9EGriZ8SuVqxJIJPzYwcWvr8lYwCpzTQed2h9h5755peY3GNaMrTPJS0g9twdiTS6BY1F8X/96B0ua5VwPptHmh7Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IvoQ24NHQ4wCx2Nyx2ReVZSPPqkhDDPfG4ce30RHsE=;
 b=n9qxsc0jxXpP1Flu9dp1jy4JcgqAqVMZ5mljg0GIv74pI7MInSoEjR70nSEtziRRMNicXCTwnAlmIkxxRmAH4onW5QxKly/9c0R5asdGngGjGGglVuVn05erW8n8aTv/mOqDVeymO9aWio4kAZmRFjsPinw2GcocJQsDnWxNHOQ/I/h56G8Q0hereXFJdwSfNMOXGz0qtCgouXBtPEjtfq+ozZ36jQ1iV2XgyXiHbM2POfZUpSqQFMu2LKN10u7XcWEjRHVUK1m1VEVrkSuwzPzyzyCzHAy1/xJbio4lpFZ58pnpkA9zPfL1IPsSd5gA8f2r8Qm+AFT6V/6NbDXv3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB7992.namprd11.prod.outlook.com (2603:10b6:510:25b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 01:17:26 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 01:17:26 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 02:16:17 +0100
Message-ID: <20231129011624.836843-16-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129011624.836843-1-michal.winiarski@intel.com>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0130.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::14) To BL1PR11MB5365.namprd11.prod.outlook.com
 (2603:10b6:208:308::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: c5215b58-d099-47b8-ad16-08dbf078f260
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5SO8ww4IqeXhZQLCSf1i7C8cvYxpJPZMeWL+mlCUjTqk5D+2S2CSdH9aGBsIdoqZMtXLxZuOkJmvfixod2sAhH4YLaZioCnYDq9Ktw1kEST5jAUj4A71kWbpXG0CC5Op5aLAuKBrV+g+pSY5BUZtVJyi6R2pN7ah634+FL2NpLfDtkAvweGHo7ZGGjiyILTTK3UXbHcOMAFU4pekhK5yfZf16e2XuWnHWlkfBN8/WcFqjxp5zpNLeDHh0TaLt5W8P3Bjr5rpIfsI9zFfb/1vrkHe04A51Dj11JMakb8wROiWjtpUrEk+qH6QrwCchVvLE4nQRsk0yYMfr0KjM/bnK+K6leomWFL9tMk+RL7a5Z/r2jbsH0MRPO6DEUbhbYxF597hOJjKcccVOO0VZHO/HoO7UsqgOXAdy4hVLN31415VU5eS2htsfyj/YVpVGwdO+A4v0jS8Ccs3x/uFiIR+tC1xviyMNf5vbswp895XdnoA8RTRUablCTGOyvmud6wEA2yFyyygC6P7maN3cWodzdo5zgSGfKbAf46/NJ22TAFmmkOw+6V/xsXgbCJmDlM9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6666004)(8936002)(4326008)(8676002)(6512007)(6506007)(54906003)(66556008)(66946007)(66476007)(6916009)(316002)(478600001)(6486002)(41300700001)(38100700002)(86362001)(1076003)(36756003)(2906002)(26005)(2616005)(83380400001)(82960400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTA2V2RWTDhhU0NYamxaQ0pudkhiS0VOb01uUFFuT2szLzdDL3h6Q3NuOUdy?=
 =?utf-8?B?ZTZhSU5ZM1BJSWpFTEZHN3Q5Z1RUM0t2ZjhNb0kvT1JreFN2Z0xQNEcwYzdB?=
 =?utf-8?B?SDBRVWRTUDVuaDdkc3VjK2N2bFJkWCtHa3JnUnNmZXBVR25MTVlyVVlPODAz?=
 =?utf-8?B?Mm5abnYyU2Z4alc2L2dFaHhMbjBKalBMVjI3NVU4V0RwREk3cDE4WlFnL0lw?=
 =?utf-8?B?aEhUWkNxcXYxeGRnK052S2YxMVNQZk5QdEY2LzFhVDdQR1ZyTUxBdTNxM3BQ?=
 =?utf-8?B?Ly92eXRTenZmNUc0b0ljOWdJaEJ0UGFGWUkyaGdKWXh6cmZCb2FXK3hBSll3?=
 =?utf-8?B?ei8rRjYwUzEvWDFZQ2N5ckRjTFl1RXQ1ZzMyajBHU2ZvVW10bnM4MG04OWlv?=
 =?utf-8?B?SnhYQkgzdWlrN1Foa29TbWoyMkI2eGFiQnZXL09zYXowTy90b3JSeFNFTjRv?=
 =?utf-8?B?REpLeDFndEUzU1Q2Y1RlbWtVUXQ1QXRSSzQyYXBTY1ZoUVBjclJYZk53ZXJw?=
 =?utf-8?B?SElBc29uRVZRRXBEN3VZVVR1MGtHQWZVbWI4RTdHdlNTUjN1YTk2eGxwK1dV?=
 =?utf-8?B?TE9kS1oycWdSL0g2ekRWQlFaSUQwdERjTnkxY1JRNlhRWVRHeWRqTzdnRWJx?=
 =?utf-8?B?aTZMTVowZzZ5MjA0QTNHU2VxcW5iRUJZWE43N2VET1RaZmJSOGtBSkhxTS9u?=
 =?utf-8?B?bzRzV3FES0pSZ3ZGZythMnFiaHYxZFBTTUs3a2EvWENiTmJxQzVwb1hqM0JY?=
 =?utf-8?B?V1ppQktNcEJOWUR0WTlPQVhDRTJweXRwcGVHQUZ6MjlJWmhVZEdpemJOUy9j?=
 =?utf-8?B?YjV3YVU1ZE96bG1tRHdtRFczaTBHSThBQkRMSENaSHRyRTJzRmdVcXJ5NEt2?=
 =?utf-8?B?RDdIOTFqUVJYeDFkc0o4ckpkcFRTN2NkVG9vNTgwb2RUdlV3UnhwZEIvNDUz?=
 =?utf-8?B?S3BKdVpTa0dHb2h4bWVIV3YxNFhFRThWeVJrSktreEFTRVpwS1ovV2EwWXVi?=
 =?utf-8?B?QUluWGRMR3pYYzY5MWd3RjduSU5VYUZjMk1wVW11bFA3ZHZXNnMxd1JnSU9H?=
 =?utf-8?B?UXpSVXJ1d1pKQVkwL253REkzbEZ1V1g2VEZhUGk4NXBSbWZHUGU0aHdTSHR6?=
 =?utf-8?B?L3ZWR29mZzlVWndrRHFBTGcySmNNT0d3elhGWXE3TndsVC95cVphS09EOVFr?=
 =?utf-8?B?NWtNTEdaSVEzZmdUeE5SYUFCMG9rRGMybGNFUkR0ejBETG5oTWMrbXRBb004?=
 =?utf-8?B?U2VjMUdTb0MxeEcxd2ZNZ3BWZElaWEw5NFNJdUxoK0tuamtvZXFRZ2tFOVZu?=
 =?utf-8?B?aWJVYzFDWHh2QzJwR3VtdzJTbjdNQ3E0VWpadm02YkhDNkxjOXo3MnRzRnJM?=
 =?utf-8?B?Q3RkQ1YwVEN2MU53N1krdXhmQnRpYkhTUy9mdG9PRW0xNkxSOU1kb0RFb3FT?=
 =?utf-8?B?V09iSGJud0hLaGswQ0NMWWxoblFlTmVIR2x5RmR3cG5nT3kxYk5qNGZDUmI4?=
 =?utf-8?B?SFh0MnorWXFyK2NaRkRhdm9XbjRwaXd6Y1l5SlNobEJ3SHIzRDkzc3labStu?=
 =?utf-8?B?NWMrYWdXTEtEOEtXeVA3ekpGbS93WDZPbUd5REduSjlTVVlCVHMwbnROVDBP?=
 =?utf-8?B?bVNneU5NZmJ4Z1B4ZUJhVWQzVmJaMUxjNlNtSWI3TkZHZHkzcEZtS3hSMmwy?=
 =?utf-8?B?VnFrL0NaTk5KM2RtaGM1aEN6ditmNU1jRmw3WldMdVFFTHBYOC9ndVJzTUYx?=
 =?utf-8?B?M0JvRTZUakNPeXptRXVJWkNORW9jZkRTRU5RclNlQW9MMERHNHM4cnRFaGVu?=
 =?utf-8?B?aHJlTFJqNm52QjhibnNYRVcwRzRnM3FFTGdSVVN4VEh0cU84UGtIckpncmMy?=
 =?utf-8?B?K3V3MEFSVGJKUjVRb1l0WWhtUzhrQU83VTJwMVRLU21FeHovQlQ2QmloNFVS?=
 =?utf-8?B?bHdDcHFwRmNPN2ZKSlg5VjJaMURJTngralRrRENXY1ZNeEp1YVlJclhZY3VQ?=
 =?utf-8?B?cTVMeUU5SVBpNW1MZzlIck9tRjBRT0tsRUk1WmlteGdMcnNNdU9WZHQvVUNw?=
 =?utf-8?B?WjlEbjFsb3Y0THprSGtZRHQ0V3ViUzc5dlV1UTFzbkY3czU4cmpNUEY1ZWM1?=
 =?utf-8?B?MkFKelV2T3dyZHdhR01xOWIxUGhaNUdXVUUrYjI1OVlCYkRXeTJHU282TDVH?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5215b58-d099-47b8-ad16-08dbf078f260
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5365.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 01:17:26.1613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qiBBqcWV48pbShOuxXsBPGhWev51pKjD9a29OAnqrGBmpCb8VV0RJ/yIyA6mxnU1wIeEPPEZNDGXKO43faysw11W8C6CnhczBNQXwEDzoXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7992
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 15/22] drm/xe/uc: Split xe_uc_fw_init
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
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 80 ++++++++++++++++++++++++++---------
 1 file changed, 61 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 5b86c51941335..31b4886ac43eb 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -523,14 +523,11 @@ static int parse_headers(struct xe_uc_fw *uc_fw, const struct firmware *fw)
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
@@ -574,9 +571,39 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 	if (err)
 		goto fail;
 
-	obj = xe_managed_bo_create_from_data(xe, tile, fw->data, fw->size,
-					     XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-					     XE_BO_CREATE_GGTT_BIT);
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
+	obj = xe_managed_bo_create_from_data(xe, tile, data, size, flags);
 	if (IS_ERR(obj)) {
 		drm_notice(&xe->drm, "%s firmware %s: failed to create / populate bo",
 			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
@@ -585,28 +612,43 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
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
 
 	return err;
 }
-- 
2.43.0

