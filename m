Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DC3C47422
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 13:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64BF9112900;
	Mon, 29 Jan 2024 13:03:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F26112900
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 13:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706533433; x=1738069433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cwQZkLb97gUowiDkg/A29b/77SEQ43nfYgeyTypUnV8=;
 b=YT4VG114+xi3fNXa+f/f/QCtfP+5+5vM3BR4l3e9phVsQiFq1CaU8+Og
 FuDcOllhU4DwbwS6N5pV4FoluoLnlrB9vRYCj3k6P2bDCLeOdBwC6+QjI
 EjOZSMYW7VOinGrHlvQGTBirubF1rTERs5797+h5hzNLS1/qRgurUAdF9
 y1n9StVgMwmC1f1juDk3XQOF4DoqoWLQh6rykRnpCB47kkqcP2Tz0Ra7d
 HZwzTTxJrgi55gvJQGHtXiwjMIzV2Tg5QxTLEGg9g4SPqY4nxUge8/wvU
 75A9pqYGNNqhN5uvNBowlqDH8AvJPsDiz5CL1I27cpgHtl3dYMi0YSFop w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="24412187"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="24412187"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 05:03:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="960886624"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="960886624"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 05:03:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 05:03:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 05:03:43 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 05:03:43 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 05:03:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5juw4G7ne1cLJskOxDDeBzsMJdj1iReyNdxF1MvycX/PRAi7owun+LZmATWqyWxQ5UWwriyqGXjqdlM+n41rR9ajTzaX2nRuXtG7DLXd8sUfYHWVDb4+GJ9ESufj2wX8iHfx2otu5X3QkAmcathAxPH6Re8CBe6iGMjN05peG5a50dZxxUbTYgKsOiR1RU2QmSWI1sh9X18zhuj6KMn77YDINd/T6EREr0LZZTeK4GHZCF6lfj9cBmdHXRA/EZatXKQ+8QegA3DZqzTCn+jIiFYaPKW8Ogllw3QkZqzjqyjc5MKrGrugA7mlJ9BjH3y8nrdIPqCyDWCFqJMiR06iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gExgUCvpaiud3zmTWW3SrqW/JjmMckXQy3BfSsmJiYk=;
 b=gGIXU0UYC1H8XIcg9zoGzEbMFF3/3JiSV6YEU8I7D8/JQrwMSZTd0g4jNpm4Yy0CIGTviqiex1cghYQeox0/Cgd4bi1onoZNtbmPlEbcf2p4H09z+2oOPaIKuTIRv+kKx6OSokg4hf+QaLp8Lsna6naX8Bnv3QLgPRt1lnxnOa3Y72f2dTZXZiaCDDg4jImJlw5NkacFtPQLJU4TZyhmESxUAWjXx0FaVEaAyzdli8mS7jpUw7BzJwiMUeX7qDOp3dApzGfe4GZ7FmrT9ile3oFEbBTB2FXYLSHovNumwhYKB6jkYxH6dG7Yn88DSuEYbUeVlHvEs1jJcAFTdYkDag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 IA0PR11MB7813.namprd11.prod.outlook.com (2603:10b6:208:402::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 13:03:41 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 13:03:41 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/xe: Initialize GuC earlier during probe
Date: Mon, 29 Jan 2024 14:03:08 +0100
Message-ID: <20240129130308.3544466-5-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129130308.3544466-1-michal.winiarski@intel.com>
References: <20240129130308.3544466-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|IA0PR11MB7813:EE_
X-MS-Office365-Filtering-Correlation-Id: 15e153ba-3896-43d4-8846-08dc20cab734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NG9GyuQeGj8D+WGQyUhwn+AP7vpsgAoCQVqGtCS2HsbBW7+GCqfr+1xLufjE4dKvp5aX4jc8FsW4YCU9lkcx/XRjw6fslkVPSxSntFWY0NGUwipYK4opgJzHQSoYX6sLQWIyVCt4US7kDPBTaPrFMFMPbaqRo421Zml8zItB1VP+mwZX4vqrji+Lmi08uigIcH8x52Gyj9Hc8ekQvu4I1Yfs6DYUXQRjudrku2/RNx174YY7r2QgVn9liTaGlh7Y+A31V9e6FZA7oDRsvhmaPrhL6fyT9IOQ7vJeVpqfKDhUw+jUt0eYI3rJyYavBzQLA7o4jkEegFI4lJTakd2nRdleOFDoEPj5igDDY0Wpgk89Z0z424f6Rjp5I40qmVf/SYEgH+3bP/141p0bt9hC/qey6qzzWv+lLc7bw90Y1NZn3rVD5YSIJQljqtpLkwCG+4RJh+Y+FPUqQZWyRL6XOI5RmqkUiQyzMNryQ6uAFRBZM5GQkpwWLXubZMM1gpih/yCSxbRsRUADtN5ySS6+pvoAt1qs11Hmgx+/xCfItB5Io2VLGRXPRgfRl40iNT+2pXJOKJMwMuasJyiHctJ5WjbaE0kWpJtH0gQmMQKsaNI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(396003)(136003)(376002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(26005)(1076003)(83380400001)(6512007)(6666004)(6506007)(36756003)(86362001)(82960400001)(5660300002)(8676002)(41300700001)(8936002)(4326008)(2616005)(38100700002)(66946007)(66476007)(6916009)(54906003)(66556008)(6486002)(478600001)(316002)(2906002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2tHeEpmd2JPclF1RkJhVE05dG4vKzR5Q3RDdWw3aTZLYWMzc3BRYXY0Lyt2?=
 =?utf-8?B?ZVpTTWU5TFNIQzFSQzdXUTFXT3pNaGlyYlhCcTFjWFE0MlY4SEZXZVlweTRL?=
 =?utf-8?B?NEs0ZktPK2ZCVkJlaFJaaVNYQ0tsWVJwYVA2c3RlRzlON3Y3S3V0cFFJZEwy?=
 =?utf-8?B?aFFET2NFbzhrWHZKVWM1NmI5cStDSmNKOG1yZk90aFg0SWl6MFVlYUNlM2FW?=
 =?utf-8?B?cVNVVjB1WDVuaUxlVEhob1lSWTEvcVJsdG9IZE9pNjFVNEpud080anpadXAy?=
 =?utf-8?B?ei85b1MzRzJrWWsxRXEzMzJKajA1VXpLOWZlbVYzTGwrUlpkRXRnRS9zaEJ2?=
 =?utf-8?B?ZlVHR2plQk5qV0gzczdiSUFXWjFRa2Y4MmYzbVpQQ3R5am5pSnFaVFNhNHNI?=
 =?utf-8?B?TFh2Q0E2ZlRWTmhqMkYrbFI5c2U3RjBLdkdyRUZnTkIzcUtrb1Y4YW5DTVFD?=
 =?utf-8?B?a0EzVHVxSlF4bUVBeS95M1lla01qazd0d2IrVjJjS1M4MzJpeVpLamI5Q1Qw?=
 =?utf-8?B?b01vaWR1ZmRxRTArb1VJdytCeW9yYmpvSElTT2dFeTZja2JTUVFmQ21jNG9H?=
 =?utf-8?B?cG5xTE90bWFsK205amZyM05ISGl5OFBWRjNiTG1hN3BqR1NlZS9Td0dEV2VJ?=
 =?utf-8?B?Sy9lTkZnMThtK1Yza3NDY3dxdmQ0WW9yczMvZ1lzd09mYVFYNUxVZTI5djZv?=
 =?utf-8?B?ZjdmT3R3b1dwUTd4YUp0a1RYSTRoMTNTYWxDcTAzc3ppYTZuY3ZtTS80VFBp?=
 =?utf-8?B?UVc0eE1pb1g0eVhXOVFmbVpsWUYySSthcVVWaGZEMW1Eb2FNWHgzQkZiaFd4?=
 =?utf-8?B?YWdXRmJkK3U2TlAybys1ZVVlWmZOVW5EZ2wwaDg5eTBCTHRBTE5UN1htd0lW?=
 =?utf-8?B?M3JsZDl6Zk5FVTRKYnhkYWg1clFhellKVXN4MTNoY1J1U0xTc0lXVklwd0la?=
 =?utf-8?B?V29sWklXYjNmMlI4NTVka0ZMTTlaL0FpRzV6ZUF4TU5sOW5QRGdadk1IRWc4?=
 =?utf-8?B?OUdpYVAzQ1Z0YVhuUzhVSGJoNGlEVGM2eHlCVDM3S1JpWTNBUTB4bjgwL1Zz?=
 =?utf-8?B?TTBiL1V0cE5uQ1JRVmduOTZFVldSZm55b2QxYTVaZjc4WitDWTdDamhYaURX?=
 =?utf-8?B?UDVNcHlDaXF4VnlncVNrV0RIMG90ekhDWENpS1R5bGo3U3NHYWc4TFplcE9M?=
 =?utf-8?B?ZTVUT1FxUDk0QjQwYUJRS3crRlBYY2lxeVdTQ2JRSjhoR2RHN3czTlgxY2hR?=
 =?utf-8?B?ang2YXhrbDhQbS9zK25SZ3loRStLUSs4WkJST1dMTkpjSHJKVUNjYmFzZVlj?=
 =?utf-8?B?bjk3N0VNdTdWdXJhNEo5aEl2MlVUU01ZTjRzYnQxWitqUGYzVmJkL1dWRHBk?=
 =?utf-8?B?R3lzM2lYVGd2TDdVbFJETHFySXFaYlBPVm9nc0VyR3hiZ0RZNmdkYXY2QjFi?=
 =?utf-8?B?NlJMLzJGQktXdFRxVkhuZkFWUS9TOExuQ3lTbGFKWkxSVXVmT3oxTlRualNk?=
 =?utf-8?B?YXBpd1JhOTdvTEtrd0VOemZXVkNrY1BNVy9LbWtzajFldy9wM1lIY29LeGpN?=
 =?utf-8?B?RURIQlU0VnpNQUFJTUZhMzNGdjlBUnhDRXU3T2VXQ3BnblZlMmNUbW96cmI1?=
 =?utf-8?B?UVJuUnNTcGYzeFJOYmkvRWdLdXFMdFBzamExUDJUQnc4TG11aVFuVmFFa2tU?=
 =?utf-8?B?cmx2UlZrREl1dzJvcEQzUVNlUno4bUNmMTIreUM0bjFyS2QyWnh3c3FkcVA2?=
 =?utf-8?B?VSt4VXRDalpWeFNybjkySk9Oa0NXbnF4UWFaMlc2K2o5eTQxa1F6VVA3R2FZ?=
 =?utf-8?B?YnpnWmhOSUZYUm14VTZzaWtab2ZtN1BLV1ZHaFpGb2ovRzN4dDNLdDhBM1ZS?=
 =?utf-8?B?U0tKZUxLajFGVHJKcU1EQjk1TzBnZmsrR3hWNGQ3a2V5SVIwS2JpM0pUWFpL?=
 =?utf-8?B?MkM5WmRXdkFMMU1IenNRSlVUR1FPU090Z05qbWVDVkh6cnh2b3RvcmRTNDVI?=
 =?utf-8?B?TUpsV0tLSEhtakJZNDMzUFpQWlFrdmZ6U2ZtYnBGd0Z5VDU1QUp5bEJ1SWtZ?=
 =?utf-8?B?WVBPelcrbU9ESDB3amI1dk94dXYyNEFHaXNZbnp0U212Z3g3QkZjUGVBaUtF?=
 =?utf-8?B?TXI2RWt2U2N3RHVXZ05uVEYwLzlrZlZHVUFYSDBPMTJZK3pHUXV0N20yK29F?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e153ba-3896-43d4-8846-08dc20cab734
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 13:03:41.0037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0oDzTjTm9HM0G09AiU6g3ZL131Ix2BRGmj6HtOx6GAlDIKoz0DKSRoo0Ip/sAWHWhM4K1KV7AfmhTJacI9VltGcdG43OPjMfQ1SzBoW7kAs=
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

SR-IOV VF has limited access to MMIO registers. Fortunately, it is able
to access a curated subset that is needed to initialize the driver by
communicating with SR-IOV PF using GuC CT.
Initialize GuC earlier in order to keep the unified probe ordering
between VF and PF modes.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  6 ++++
 drivers/gpu/drm/xe/xe_gt.c     | 57 +++++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_gt.h     |  1 +
 drivers/gpu/drm/xe/xe_uc.c     |  8 +++--
 4 files changed, 52 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 6faa7865b1aab..ae999b114d6b8 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -471,6 +471,12 @@ int xe_device_probe(struct xe_device *xe)
 		}
 	}
 
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_init_hwconfig(gt);
+		if (err)
+			return err;
+	}
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 0bc59a4dbb496..312469b5dcc9b 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -315,7 +315,6 @@ int xe_gt_init_early(struct xe_gt *gt)
 		return err;
 
 	xe_gt_topology_init(gt);
-	xe_gt_mcr_init(gt);
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	if (err)
@@ -354,8 +353,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_hw_fence_irq;
 
-	xe_pat_init(gt);
-
 	if (!xe_gt_is_media_type(gt)) {
 		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
 		if (err)
@@ -364,19 +361,8 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 			xe_lmtt_init(&gt_to_tile(gt)->sriov.pf.lmtt);
 	}
 
-	err = xe_uc_init(&gt->uc);
-	if (err)
-		goto err_force_wake;
-
-	err = xe_uc_init_hwconfig(&gt->uc);
-	if (err)
-		goto err_force_wake;
-
 	xe_gt_idle_sysfs_init(&gt->gtidle);
 
-	/* XXX: Fake that we pull the engine mask from hwconfig blob */
-	gt->info.engine_mask = gt->info.__engine_mask;
-
 	/* Enable per hw engine IRQs */
 	xe_irq_enable_hwe(gt);
 
@@ -444,10 +430,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
-	err = xe_uc_init_post_hwconfig(&gt->uc);
-	if (err)
-		goto err_force_wake;
-
 	if (!xe_gt_is_media_type(gt)) {
 		/*
 		 * USM has its only SA pool to non-block behind user operations
@@ -471,6 +453,10 @@ static int all_fw_domain_init(struct xe_gt *gt)
 		}
 	}
 
+	err = xe_uc_init_post_hwconfig(&gt->uc);
+	if (err)
+		goto err_force_wake;
+
 	err = xe_uc_init_hw(&gt->uc);
 	if (err)
 		goto err_force_wake;
@@ -500,6 +486,41 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	return err;
 }
 
+/*
+ * Initialize enough GT to be able to load GuC in order to obtain hwconfig and
+ * enable CTB communication.
+ */
+int xe_gt_init_hwconfig(struct xe_gt *gt)
+{
+	int err;
+
+	xe_device_mem_access_get(gt_to_xe(gt));
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (err)
+		goto out;
+
+	xe_gt_mcr_init(gt);
+	xe_pat_init(gt);
+
+	err = xe_uc_init(&gt->uc);
+	if (err)
+		goto out_fw;
+
+	err = xe_uc_init_hwconfig(&gt->uc);
+	if (err)
+		goto out_fw;
+
+	/* XXX: Fake that we pull the engine mask from hwconfig blob */
+	gt->info.engine_mask = gt->info.__engine_mask;
+
+out_fw:
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+out:
+	xe_device_mem_access_put(gt_to_xe(gt));
+
+	return err;
+}
+
 int xe_gt_init(struct xe_gt *gt)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index c1675bd44cf6d..ed6ea8057e35f 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -33,6 +33,7 @@ static inline bool xe_fault_inject_gt_reset(void)
 #endif
 
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
+int xe_gt_init_hwconfig(struct xe_gt *gt);
 int xe_gt_init_early(struct xe_gt *gt);
 int xe_gt_init(struct xe_gt *gt);
 int xe_gt_record_default_lrcs(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index d62137306d280..9e51aa6a29604 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -32,13 +32,15 @@ uc_to_xe(struct xe_uc *uc)
 /* Should be called once at driver load only */
 int xe_uc_init(struct xe_uc *uc)
 {
+	struct xe_device *xe = uc_to_xe(uc);
 	int ret;
 
+	xe_device_mem_access_get(xe);
+
 	/*
 	 * We call the GuC/HuC/GSC init functions even if GuC submission is off
 	 * to correctly move our tracking of the FW state to "disabled".
 	 */
-
 	ret = xe_guc_init(&uc->guc);
 	if (ret)
 		goto err;
@@ -52,7 +54,7 @@ int xe_uc_init(struct xe_uc *uc)
 		goto err;
 
 	if (!xe_device_uc_enabled(uc_to_xe(uc)))
-		return 0;
+		goto err;
 
 	ret = xe_wopcm_init(&uc->wopcm);
 	if (ret)
@@ -69,6 +71,8 @@ int xe_uc_init(struct xe_uc *uc)
 	return 0;
 
 err:
+	xe_device_mem_access_put(xe);
+
 	return ret;
 }
 
-- 
2.43.0

