Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E58BC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 11:44:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6401910E43F;
	Tue, 14 Nov 2023 11:44:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEF510E214
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 11:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699962294; x=1731498294;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=OS9YHT5b/STYsPg2VvV9VrwO2f57y+dgqZNu5FE4UWk=;
 b=lnQYIEmupMTOnigFstiLX9SpwwPXLOiNcEv6UtDTu5aItoI9DVEbyjWd
 2ra5KWvSpCx/1JPrEtEVaH7P4iaJSXxYIqVaW63T8TI8U7VzkUyTdu1S1
 ZV66fORV3XHraOVTucHXK/5F7ZWhmDERotAutQ9kdDW7dH026R6//HaJC
 XP7lpLQnnproyftRW8XZeR3H2sA9q0gq0dWj6yMsNDniHS/+NLqWYzvjl
 BMJGPN3kxPVK5aGIPI4SGPTGWgSSWrcI8DalxThX1eGuWR3gsLFn8UVFM
 CxZoAx0cGMkG40uu3+ki3ZsA9K1QXmTtGs43Xi+fceD9IKy+Wlnx5HlQD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="476849726"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="476849726"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 03:44:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="741070857"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="741070857"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 03:44:53 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:44:53 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:44:52 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 03:44:52 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 03:44:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mRUb+Zt5gZKeMs4KkiJJZARQ3Uv14MszvEG41fXbsi+l7vlu7aMtHSqqMaCnXfW2l1iQI0EuUZCvUjMX8V+gmmEGUczwAjT7XxFrnaxegoYZ3DWcBCW4M3h0Tjp38Q0p5lTN9mbjViB1DRYx13p74PTLDvV9vX0z2bz0HPFr6534v8wQm4wls994mKN93u6d0k8s0yKWlpQ4IJNaFXLrX8gthCtTTZJMpvUg0kEl7bHgefWnI8rWLfs1hQAH0dzAHD6cjuAgS4NBd7Lb21FOibppuMkdoRfh0xVqBZXhBFyTDUpcqIppMuK4Z+KCBXlC2XEyy2DRB1Eb8NZDqLUOWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vhl0KyaFAwqctv3J8WUtmWQL99fRaEZl8MGlwwGDUhc=;
 b=Kwd0JRjxocuxlFITmDGPrKLZXNRe/k1PRyTZJwSN57RLhiYwlTAM8BI+7/wnN4nmzm3e5s0iY6nQanxc2MJmIYOtdFyLTO8qhZHkuIKoI2HWecN7xbd+HIOUvIIxP3UgbkLjBAeE9TDY6c4hU0Qw17af39kXqUxxzleQL+5btDLbeuat65+hjv5wZHUG1VUpqsFzjSRxTIPiUlf6seujEw21v307kQXonPLOGGejgzl+TodBicQ6C8omqGnpCSgbrZVKfSx2AFwg1YXGos16S8dlVhBv5tWHvrDVtjH/kNYhdd4Y7afJ1tHzBKa/lcso7bVedcnSHJeQt1dA+urXNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 11:44:51 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 11:44:51 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 12:43:47 +0100
Message-ID: <20231114114405.2207747-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114114405.2207747-1-michal.winiarski@intel.com>
References: <20231114114405.2207747-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0012.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::9) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH3PR11MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: e1a0792e-e1f8-4ee7-cbd5-08dbe5071cad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4TfJcsHFH2l0aW0ehJph4hOwMGVUvynamW36goz9ye+b/4Xg6nSE/6oPrp5RAdwf/m3LRuLbs6qlxpXkDErG3t/lOdFZAadpY7L1ZtV+MW5NP2lvDkq7PsjUCtKWeWn4Cyq0trNnxjz8y95yfFIW+5gGAWA9UeSniVCpnwwCSkSre8PQid67PGHDnHujfEzZWz9qQq8G44bKICqxhrzYm8LafeEe9QOjdfgC1u1PMmhLzrgQI22eb2fjILEN5UH7K3JxikRObvO7ewcAlu5TWiXiW9Xie4Qs6IDh5qUelZAsK2lHIstDG91ggW+bj3Bggb5JQHg1CfWM5oa5uno6HvBSL1UrYoUqpZNImByxvw5Tzba3B/7E1noGk0h7cU/6tYz5eXXefZ6z7L4A+UoTvLmPeWqp7a7QyJW38CkenFN23KyRqFJCbglxECixHvD8leXURnEp7Dx22YYtKcxoSNl4eXmjnI8WvuwytOh/xOzB3cWrN9rxA1s2qLDcjvFw4aWZWzrfckIFBkw1ml5aheCshWdkckk5LFsMB4vmPTqXzWvRyMl4OugqpM0Gye0k
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6666004)(83380400001)(6506007)(38100700002)(2616005)(6512007)(86362001)(41300700001)(5660300002)(8936002)(8676002)(4326008)(36756003)(54906003)(66556008)(66476007)(66946007)(6916009)(2906002)(316002)(26005)(6486002)(1076003)(82960400001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2dpTDlZWnFEWjYza2pIMVZZY2dRTEZ0M2tPOWhtK0lKM2JLOXFGUStjb2ZJ?=
 =?utf-8?B?R25tN3dPeXorQ0o2dUxJQXJoRmZPOEl2aElxdjdBd3hGV1hTc0xaWFF6UmNk?=
 =?utf-8?B?aDhVZkU0MlhDSW91QmdVWWFHbFFQM2UvOEU1RWl1MTM0dXozTGlqVXdhTHhn?=
 =?utf-8?B?RUlId0RnSlhBWU9YQTd3Vk9ReVZaQU51RE8rM1ZiRW9jOUdWaGl4KzlGWEF5?=
 =?utf-8?B?dGpXNFIxNjlDN25tY0x4SHpRejhxUGk2anNKRTdFZ1ZnV2xqTnpzTWIyOVBm?=
 =?utf-8?B?MFo2Wmo2Q1F6aFRuTHZROGU2cm5JdllOazh0d2VnYnZQeE43aWsrRHAydWdu?=
 =?utf-8?B?L1BnMWNZZERrTVU1YmU2NkFNRm9hb2ZudmtJamRwdlNaQVFkSWV6QWRhaHhQ?=
 =?utf-8?B?WXVSMWE5YmF2TzZ0Rk5UWmVCYnpHWlNMY1FQc0dOWmR5ckpNTTVla1BIbmN4?=
 =?utf-8?B?aEMzUkRGV250QVUzTDVqSVNIaHBLbThkbzZoME1mZDRXVGZRSW10S1BJcDds?=
 =?utf-8?B?RThrOWVHRE9Qc0RCOVNQQzQ1YUZwZThIL3BwdWg4dXNjOVhINEc0L284NlZo?=
 =?utf-8?B?djhOUXRWQ0xmYWk2bXk3TTBzbHE3L0VFSnN4eVEwakZ5UGlCQ2l1SXpyNkN5?=
 =?utf-8?B?TXR1Wmw4QlEzOC9BMUpqRGVMcEVCNXI1UzdzaHJ1OGRqeEt1bkt2ZzQ3ZCtC?=
 =?utf-8?B?NUNJREJqUWF3MDdsVmMvU1NWTWNOb0dXWFI5d1dxSXZ0bjVNMUlUYWowTWdB?=
 =?utf-8?B?RWVMZ1drOUFzZjFlajd5NUlyalBsbDNXT2V1cWtwZy9Wb09kaVkrQnkxb29S?=
 =?utf-8?B?bG9ZN1VhZi9KSWRuWm95c29PbEVsN0xuZ0lpeERqSU9NR2M4SzFlU1NTenY0?=
 =?utf-8?B?VXhkUkpvR0E4MGx3WHFKODN2cGc5ZmVQQlNIR29FQ1k2Y0V4anJlNVRFdUZV?=
 =?utf-8?B?V01tMWZ0NW8vc1dhSlpBR0lIL1hnb21ocEFoemRqL20yamFESmdhdk41ZVRT?=
 =?utf-8?B?QUtBVmVEbEJ5OE5OenQ5ZkJjOVpyaVNWVnJTR01uRmtNQ0RTQVV4c3NsWnVv?=
 =?utf-8?B?SEwzN3dQSkdGQXBHTjhhYm04TVZrMEQrWXcwYWxsOE1XN2IwdCtoM0ZONDY4?=
 =?utf-8?B?dC9KVG1ZdWdMeXc1L0tJY3hQN3ovd0FqSVpUN1dTc2hITXVUVzFYb0Jaenpy?=
 =?utf-8?B?MUZZWDBDK3p0aFhwblVJZEhtaGIzTTh0SmRwOTVrcG9jc1V5ZDBCZnRYWDBO?=
 =?utf-8?B?MFlMMUhQOGhXS1Jud2JUaTJ1UDExQkpqSlA3ak5sSjJxWFZFQ3NRN2hBRHdW?=
 =?utf-8?B?eHNkRnJVTnNCek5FSlA1M2VRTFhURXEvcWVFNVc5Q293L0trYmVxTXo5RDhJ?=
 =?utf-8?B?KytPQlU5YVJiVnVMbUlhU3lJV3g2MFdyL0ZKYTJGQ0RobzRxV1FNNEZFRHBO?=
 =?utf-8?B?eGxtc2V2UWRZTHZqRmxlSUp0WUFRTjRFU1dlU3ZrdlFmZGhSYTFsMWdVVW1i?=
 =?utf-8?B?eDQwTWJVdW84MnRxMHdGTGNYUEZKNUo4T2FXbzNTajVYSTBwVnlDRU12V2hT?=
 =?utf-8?B?UmJTRHdLL2xSSnoyNkVZMTVPVkpTc2szUU1FbmI4cHRZM0JiRGhuOURDMHp6?=
 =?utf-8?B?QjhCdXpwT2hEVVpoUmNZQU51S0dkUFF3OHJ3V2Jhc3VhQWNwaWFQeHQ5VSty?=
 =?utf-8?B?UlNMY0hJMVlIZ2FhSWQ4ODNWc09ZdlNsMnBERW81QnU3Z0RtMUhnZG9tSGdQ?=
 =?utf-8?B?TUVnSnlIRFZSbGZ5M05nUEZ2azRIb3Zabm9laVJHNmpFdFVTZXJMMGk5V3k4?=
 =?utf-8?B?QmEweVBpODNJdmhBbUNVSnh1anpiTS9lRUI4WFd6RFZsWVFXendrVWpDVWlH?=
 =?utf-8?B?K2QyTENYQkpTb1RMeU9VVTMyQVhWcHd6MmY0Y1doaWF4SzAvWnJKazIwUThM?=
 =?utf-8?B?SVRkMytkVCtqT3ZFbE80TFVNSUdJT0hISm5PQW4rNGFQeE5Uam5wRXdoRkxv?=
 =?utf-8?B?cHJrdHovUDZoMWZqdFY4U21ONHVOVlNWNkQzZGxzSWs2WTIyMXpjTDlwcnpW?=
 =?utf-8?B?VEcwYmRFRytlaThGOGZ2MDRrZUMzNW9weG43Y2ZwN3Bvd0hxOEVXOWcrd2dI?=
 =?utf-8?B?S0VpOTdkR2QxekN1S2t5ZTBNMCtMeGtxcWo0Smg1dFprellQVm5CMSt1TlBi?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a0792e-e1f8-4ee7-cbd5-08dbe5071cad
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 11:44:51.3142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iOt9HKJsJEUHZhs1kJ6nIaacRcSEyJ6F8BcJjDyjX0bprlzMqhzIEDRVYNrRfTkIIYRSp4K4EqAS3ZvyI5lW0Ul2bcm+z6CJtUbA/pl7fbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8707
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 02/20] drm/xe: Use managed pci_enable_device
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

Xe uses devres for most of its driver-lifetime resources, use it for pci
device as well.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index de986aaee3bb2..6b9fe73280f56 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -663,6 +663,11 @@ static void xe_pci_remove(struct pci_dev *pdev)
 	pci_set_drvdata(pdev, NULL);
 }
 
+void xe_pci_clear_master(void *pdev)
+{
+	pci_clear_master(pdev);
+}
+
 static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	const struct xe_device_desc *desc = (const void *)ent->driver_data;
@@ -691,23 +696,25 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (xe_display_driver_probe_defer(pdev))
 		return -EPROBE_DEFER;
 
+	err = pcim_enable_device(pdev);
+	if (err)
+		return err;
+
 	xe = xe_device_create(pdev, ent);
 	if (IS_ERR(xe))
 		return PTR_ERR(xe);
 
+	pci_set_drvdata(pdev, xe);
+
 	xe_pm_assert_unbounded_bridge(xe);
 	subplatform_desc = find_subplatform(xe, desc);
 
-	pci_set_drvdata(pdev, xe);
-	err = pci_enable_device(pdev);
-	if (err)
-		return err;
-
 	pci_set_master(pdev);
+	devm_add_action(&pdev->dev, xe_pci_clear_master, pdev);
 
 	err = xe_info_init(xe, desc, subplatform_desc);
 	if (err)
-		goto err_pci_disable;
+		return err;
 
 	xe_display_probe(xe);
 
@@ -734,16 +741,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	err = xe_device_probe(xe);
 	if (err)
-		goto err_pci_disable;
+		return err;
 
 	xe_pm_init(xe);
 
 	return 0;
-
-err_pci_disable:
-	pci_disable_device(pdev);
-
-	return err;
 }
 
 static void xe_pci_shutdown(struct pci_dev *pdev)
-- 
2.42.1

