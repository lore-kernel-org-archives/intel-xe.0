Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4ECC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:04:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C0810E202;
	Tue, 14 Nov 2023 13:04:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C585510E206
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699967043; x=1731503043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lEen2gKPlEML9nlEJdileNaua9H/x6Dw0eavP3oXk/g=;
 b=nVfHLYud/GmT+QDSP7qRDTf7gPKWPwvFjtnDXPB6qcPL7nrOFpCzvSFX
 aOp/5ae5Zhz9twTwrVQ46/PwUoZQXXoHTcw4P1fiKj535dU+8ZvtGxYT4
 P8e7Iofs+CwVdUtnNx5ci2gRqF/aIfykCHC4q0zz3ki0aMJFBFXb0QEK1
 fWBFL7UqDU91zsLL7bgNtQBKQvu2vqipT64xi/L80NvbltHdRM/sLmtOV
 a72YaRNwQrXeVkjwILWzGxcA66eE5muSqzrVaZ2QhclpGym0CBv0bUDQu
 yFYiCiH7G0tPZ7h9BicBndbZVf4mLtLNoxZ0Tpj7xzpeMu8R3IjvmE3oH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375692092"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="375692092"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:04:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="882046113"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="882046113"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 05:04:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:04:03 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 05:04:03 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 05:04:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KeubrbbdkevManTabYvAN24AncpsDFoUmiXZHcssCq8kjGTH4HZBwyVvdo0Aib/+6J6PVIzxVLkz2OzELxNE1JGIi/KNrx2TJ7FD2RmCZc0b54lnABSFYB697m7Qz7oQIf8sw9bRmtdbVAbb6DW/r1kzDfyUEyrCAd2AMwRjTrtL7WhCPC0NkoVVQIBxmMTyJm5GKw3cFlLz7CXpyLHYMTXox8q7klsRgkkSh9Hq3iT+H1qTcMbJbTba+WtxXN4l7Ca5POjRd7Ioo6Oq+OroGyOwyLIpTpmYLgJ+qj92ks4BrElcQZHBW1EdMnpNJSapmiX8pTGYmhqzXUNgp+sZ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MO8QaeYHui0+H5pvqOPliSIrvOq+xpBAuo09J/Lc6nU=;
 b=Ml729wT0NrInwvchzXvd7S7LbX+bwmrbsOeDPyvUm+Mlm/QTEPJlyjGPltdfPJ/MHWAYr1/+7979c+WN0xUjLTo1GMhv88vulNKQr0A5JvF9R5Ck7x+QKQUEwdFkO10FDu3ncBjN7NdeRJZIwDxvzHD4SMW4VHlKoUGSLVXdJmdmNo8i4nf+BKCOwCayVIPgC5yCu5nBUL/dxE0Q+gF/CUXD+9KIfTxBfuYPoEQk6VtWJkEiPi909h8tKUM3Bmo1VGi7IOSnTJyMDX6XihF8eZwHShU2yzwYg4Rs6RvjppaWL03vn6PiGViloJs6Oe+Hi6fva/Ef/shPD+rSsw27jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW4PR11MB5933.namprd11.prod.outlook.com (2603:10b6:303:16a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 13:03:59 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 13:03:59 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 14:02:23 +0100
Message-ID: <20231114130231.2299661-13-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114130231.2299661-1-michal.winiarski@intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0045.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::19) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW4PR11MB5933:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e3bf664-30ea-40e9-ece2-08dbe5122aee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ehbYXNIXbdLWD/MvmaU9bZqlVFvHxR41EgoDiC0uBwEQRaBzZVz/oPRqhOv39IsgPm1iD9w/ITWrbmz+r8dQC4rxJhyzGmnCY/53GyNFRQgjvMqf+uEz8cCYp5FuOkoOJ4yEo/0IysVtmlEkHHnusiX2yK+FpQmAGU2VpEuJMewGBWkdlM43+XtreVxYUlJuRDhoi12O+7DWq8pMogIrry93w+1zq+TtliY7HiTL1a9GvxaBjsDqlB4XtmiQ4b2fnZ82MiKZiEWzWQcngcQKzdybr84ppFQeDQ+4oB57Et2iTDveWcSRXC/VgQZ7QKaQ6z1WXHEz1mckC3nFpWDFPZb5WdOPRdwlHuFcrnYQ6TWni+8sqWk/R5o3kLlrVtopBUGZ3u6/Ht7n5hzqCveKyDJjAEQXHn6YdrSr8u5ga1Aaul14CYSvWRTSDhLjqlYBOrp2vmwpAtuimZ31g7JbCXPVe9hgZaWGZQ9pMmboaAkqdm9lZEnFE66dJzO8vDfz9y5xTrUzBQ+FPDqWuZnJScp4zxaahiSQTcqak/8BPg9dm+d0ezvkefUrMfuD5sNt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(376002)(346002)(366004)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(1076003)(26005)(6506007)(6666004)(2616005)(6512007)(83380400001)(5660300002)(4326008)(8676002)(8936002)(2906002)(41300700001)(6486002)(478600001)(316002)(6916009)(66476007)(66556008)(54906003)(66946007)(36756003)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGI3dGp2dmV0Y3ZqbVV2SVo0WitlRDJaRTZhTVY1eEdmcDdKNUJjSWNjbmYv?=
 =?utf-8?B?MUR3WUo5NU8zQWlyMkpHUVIvWHZscVNsRndhMStCTmQrOUVPS3pLRmVhYkFl?=
 =?utf-8?B?VkQ0d01UVFNTRGJPZmlhcVk2T09qZ0I4bkZiWkV3YUdOUEVEUXNRME9DSFhS?=
 =?utf-8?B?NXE0MHFXM0p0YWxhbSttYTJ2a2JrYmxDS1BGWjh2Qjh4cEtYc2JRaEVoOHU5?=
 =?utf-8?B?eHRoRnZXU3VrRzJkaXROMHAzTUxNSXZGR3p4a2dnZlhPOTkzV0NpeW9ucDl5?=
 =?utf-8?B?UVRFNzVBUTZjZm1GcTFkdnhRZ21Fc0ZPUGZPZk9aQytTeGNic1YySVdGQ2w2?=
 =?utf-8?B?Qmt2VmNMcGxjQ3VVMXF0ZG5HUkd4Yll0bnh4bWRqWVppN0xUcDRaVEhVVWdB?=
 =?utf-8?B?czNweE5FK2kwKy9YRGJXRHZkTThEZkJiRkx2Nm1HYWxqY2ZKdGJNaVJBdmxY?=
 =?utf-8?B?WDljQlY3WnNVeFRORlVmeXBLUnB4bVY4U2tJbGFaeHR2YWJaQWh4dFRIOGh6?=
 =?utf-8?B?U25sZlVkMktFMlRHVDF2VHVlL2IrcG1ZUWtON1FZY2dEMVZzQk53TTM1SUds?=
 =?utf-8?B?QVBjTmpsK2h3aFl2V0pYV0lWWkRIalRwN1ZkTDB5RG42VEgxR3V1SWY0YWFj?=
 =?utf-8?B?dEVjNzZQMGtaaWJQWXNNNi9XaDJ4SXZpREU3NmswYjlOeER1cTl1aVI4WHAy?=
 =?utf-8?B?bnp3eENRWGwwSzMwQnlrRG5SK1dwMHpuTXNTeGtEcHdqdkdQa1VWNVZ0Zlo5?=
 =?utf-8?B?NW5MY3h6QitrRGx1TzlXbCtKb2hZOFNuU0NGQzYwTTJ0YVFyZ3ZEYU04b0dW?=
 =?utf-8?B?N3JVNWRubEszNUh4RzF2MDNlbXhjdllZS0lWODlvQ0ZSSHE2aEhYSVlzSHJP?=
 =?utf-8?B?RWkrc0hEMFdsbVhOb1YwT2I1dUhFRFdhRGRzaHZRdG1KTmM3cXVNYXV1cjRa?=
 =?utf-8?B?ZzlSd1p5d09IOFpQWHRudTlBblpmbVVGcEE3WVdXMnkwQWo4b2dqZGtxVDZa?=
 =?utf-8?B?WEw5YU5NZTNHb214QktteFZId3duQWZMRDZsTlNLT3lvT0R2OEFiQlpSUjQx?=
 =?utf-8?B?bXhvN2Z4RlRrRWFuVTZraFh3ZEUwcTFEUUR2SE9wY2JzV2prWUxqRm50Z0xQ?=
 =?utf-8?B?Y0J1ak1zL2J2TFpibDcyWVJvUzNtVks1VUNFdmk3WGJDQTdQcWc0azNwaTNi?=
 =?utf-8?B?c1hFNklIS1RQNUFXSlRBeGJ5QXAvZkFnYVZnOEdrTkdMbWFJbUVxVldJVGVw?=
 =?utf-8?B?YjN0OWlLSEZoeS9TZEJzSDdXTFNhK2FRR1JSMml6Y2s3WkJ4UjZyQU4zM1BZ?=
 =?utf-8?B?My9TQWNrZElUTnlwT3BMK05OaXo4LytIdHI1YTdXOXhqL3JYbTBlNG8xaFN5?=
 =?utf-8?B?cktsVjZQSjl0dTBrTlliMk9naXRYSDlqb0QvS1ZKRkZVNk1hVW9lTU5vbGY0?=
 =?utf-8?B?MHJGRzJNYndVT1pnaWovUFE3ZzI5c0FlRERhTDdJejh0R2pPOFZnZndFNjk4?=
 =?utf-8?B?TU00Y3V0S1ZnSWFFQnl4TU5Bdng3V0NFM2dldU1OWHIycHZjR0t1V2NETUpr?=
 =?utf-8?B?ZWozNDdqUXl5V3YrOWxOaW1TTGZxU1c4V01nN0Yweis1b2d4ZTcxSXRUVUdw?=
 =?utf-8?B?ZmxzY2xLMnNKUmpNSXBCZEdyQWNabVhJODhKZTJxQnJOTnoyNGhVSkxPMFB2?=
 =?utf-8?B?RnRFOGNtUmVvV3dOSWZkYkROYzk4bFgzd3hVWDQvMFNOcmhzTGd2UDNxY1Zn?=
 =?utf-8?B?Tll3SVRRNDd1UURpVVJYVlZpaVVpRHpoUXEzelgzZnNRR0dhMCtjd0dyRnJh?=
 =?utf-8?B?b0Z0cFQ3RTByeWNwbVkwZkFqUTIwSHRsckVJZGtDZFRaL09zN0Jad3FSWTR5?=
 =?utf-8?B?Nm53SmFnSDUwdjRRYTlpZXpwYnYrYzl4d01GU1J0Z00wc0xEMUN5QVBCT0pR?=
 =?utf-8?B?eEd5cWdCdGJBTzNNQnFNS0F6TllIMUFXQTY1eTNHMXFCUS8xVmtCalVDU1Vz?=
 =?utf-8?B?RUMwTWJoL2lEQVlCZ3VPVjVVRCtvTmVQczZ4S0hEZmM4Rm0wdCtXeGRZeHRv?=
 =?utf-8?B?TUdKY1YyOXFiUjNFb21RVEZyZXhNNWxuVE9HRGttSE9hSzBkT1lKdjNvVU1z?=
 =?utf-8?B?Q2hvUzE4MUNKZ0w3cW9kMDlVMWFkbnRqZTE5eXE5SmJoYUpOanZZa25mdnlv?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e3bf664-30ea-40e9-ece2-08dbe5122aee
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 13:03:59.7494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XuLO1Q7EH/NBd6EPcukGiuhWtMDh9YEF9BxjZ+d1ZmLk3CO3z8ce21bKFCabSn3vVVbzcK6NYIkRiKU3BLE2FBBFrsFrDEh6XO0jNoTk92U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5933
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 12/20] drm/xe: Move force_wake init to earlier
 point in probe
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

GuC will need to be loaded earlier during probe. And in order to load
GuC, being able to take the forcewake is going to be needed.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 3 +++
 drivers/gpu/drm/xe/xe_gt.c     | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index a89b5a32c093d..fde597fe0b513 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -404,6 +404,9 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_ttm_sys_mgr_init(xe);
 
+	for_each_gt(gt, xe, id)
+		xe_force_wake_init_gt(gt, gt_to_fw(gt));
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 6c885dde5d59c..c8e2689873c37 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -292,8 +292,6 @@ int xe_gt_init_early(struct xe_gt *gt)
 {
 	int err;
 
-	xe_force_wake_init_gt(gt, gt_to_fw(gt));
-
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		return err;
-- 
2.42.1

