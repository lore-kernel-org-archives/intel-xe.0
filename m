Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46661C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:04:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D7910E444;
	Tue, 14 Nov 2023 13:04:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719D010E441
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699967039; x=1731503039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=T39H9ca4wXvo+NiEHjsZh0oYkcScFtcQc6ErFSdJDsQ=;
 b=CohVnnd8O7ssX2kr8koq8EnTNyRoEptdZYo+4W3yH6BTzpL2VR2jsDzw
 xsfJERFgtN8gGHzBeftx3/Gusp+jb3Ty3f+uCeyAPDlj7+crb3nxmy9b0
 fnR8aTbwSm7FD9UcRUWL7kqrUdRegKKFNrg3j2tVxsMIRFUbMw+BEGtDw
 BcQB4rzuBfvIuYqTnt/QiT2sGeOrYe73fmsfvsRGSF/4cqgi7IEOPi7Zd
 Axob57tba3XEkJxOQDDVhI/EY12ySvytcmcUxpdLPWr0jh5e22oN31+c2
 jvfmsaJN0YbFOFDsorqZAY9HymODpe09EypVINegoy5qAMYJtkL+iTM44 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375692079"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="375692079"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:03:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="882046101"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="882046101"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 05:03:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:03:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:03:58 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 05:03:58 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 05:03:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UyJiMlGk0bCfLyoD0DHr3nrtgFcMxRCPGY4LhB8OYkX+E3pSeZIRDUrQ+amOGKCE8SN19fukgwspkiSyDanQTLeJ7Ayz3TfG22BynDjqyVaJzZ45De42bkD7xL8F/1X7HlPTxHCaa+XWBibwTW8D5oSgYU+7tuufIdNEmJTg3V4Uc3/Z+y0EALtiqlMPHpXpO0Qxsrylvo3LtpEvJicjSVZVlwDKWpep+KsuqjhCz0ZmkUBQjeDm0vpO6606EBd1ShgehNCznpjWcvA6YYdKXunSEZqvFw03Vnk642EMr+2UZI/fiV0Cq1UsVorym31trc+qc6puHiHF1UYQ9DW3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53KyOLk0wYvMXAH4NHjBcPRSb+nvCZ7DOeXkSCDfK6g=;
 b=mpTrKQgwwQDUwcak3KF9GpHY0bANgAwDfpLxuc+yc6kPgdCpnZ7L5QQviWpxaV97kZLAbPwAQrlCGnIkXE1Nabq8MTAgjHSFbmmf9kg9leuJanskxrPAQOTJTL+cBf+DZiWOiwaB2FP+RY7H6XVOqw7Tz3ilpkL0GHBgo5uG8uUEUOPYtcujV87Lvia5IPoyhlm7iPW2fbiIyVlm8OzIp6e4NQhUuVZBRJZp0lDtH9wQFAaFTkkKD0cezLPIpg5M7DXMiCKq2BuowAfmIJckJpjPAMLVuIZNAy3L2choD2uvkdhJCVxqAgTuZ6QY6IUDjR6WLWTW2GCQJ9vXsKQrRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW4PR11MB5933.namprd11.prod.outlook.com (2603:10b6:303:16a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 13:03:56 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 13:03:56 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 14:02:22 +0100
Message-ID: <20231114130231.2299661-12-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114130231.2299661-1-michal.winiarski@intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0043.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::28) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW4PR11MB5933:EE_
X-MS-Office365-Filtering-Correlation-Id: 9717985f-438e-4331-223b-08dbe51228e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mBJLa7ysoY0E6dKYQFl2fTOctOedSSa3nslmNwV4P6s5v/Dph4PvPaeWyD6odnJ+Vv97yr/UndeGyMHWJP7nbJj5VixXtNDIKLhHlQrfglqWYkcpHXETSgafoI9DTEC6uv0nsgj7iLMJbDTLCoHbBe0FNt3hwR96/AZcjzh1ctUonpA+XDJGO5m/ytPjZWBTXeE+4ox9PrSKJltsD3ZTUc1EUgdF4QduK2Vol1RBAY4YXYWxWvoRPeeIANw7/1xi+TP0bn5edoU/lqVm4tgZqms2qM5foYFuTnIxk/flwPZqVHAmW9wUS7sDfba+ByHu8iuAVzYM3q/VnSCh7qrrqM/Ef3uV2Ke5R+9qbWiPa6h6MR+uk7N06FmgA2bjNKof18Ifg4Lywu+ANui35FZalfXhlY8n1I43xks1B/lzv8VF0I88YcnxwV72ABCgqW/j+AKKaMgDm9fGlmFOnzhfNumODNMCc/8c19iSL2/XUmtqUz/E0JwUSHyu7yvb+xJ1TTfkze7iavNAJVGNE850T2jFdaTpEXVG0wWsF0NfXzoQI7NvMOU3GVwBEKL1QC5x
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(376002)(346002)(366004)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(1076003)(26005)(6506007)(6666004)(2616005)(6512007)(83380400001)(5660300002)(4326008)(8676002)(8936002)(4744005)(2906002)(41300700001)(6486002)(478600001)(316002)(6916009)(66476007)(66556008)(54906003)(66946007)(36756003)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2FUV0U2NHgwbFVCTG55eSsyeEk0SloxOGVlMjQxZDR2eGhuNUM1NFpCc2xZ?=
 =?utf-8?B?LzNYQXF3TTBhUnRiYVBObEg4K3d6UFp3NDNiRHczajhoblZWTVRKdEFVZ3Fu?=
 =?utf-8?B?Vmh2VG92ejdqcVMzSnowR05GTnFQbXNUZ0xKS0kxZytLeU1xaHlKRCt2NXZX?=
 =?utf-8?B?L05uM2lBYUZteUN3WFp4MzFLaGdqR01WMlNVeTRLUzkwUnJ3Q2gwQS9MVTNs?=
 =?utf-8?B?amRFY3lHUWZGM1RKTUFKOHdlaEpNK3pnV2doZWM2WDVHbEZHNkhlOXl0dnZX?=
 =?utf-8?B?b2cxYnJPTWFIbHFJbGYycUJTWlloSldaV1RFR01BYjBqNXlOakJ4TGpDZDVK?=
 =?utf-8?B?K1oyVzZtVENteDE2ejhYNDZCaFVyN0VEc3VsL2VPckpNMDUwWDV6QjUxUER5?=
 =?utf-8?B?eWpsbFI1ZDJJTndubVdpc1M2M1p4S1ZWWWtSSUhHbjV6ZnpDRDNmM3VDcDl6?=
 =?utf-8?B?eHJvNXhDclpZb08yNFJUbU8wN012S2t0SW8zSklnQ0E0WFljUjY4Zks3T1RH?=
 =?utf-8?B?SHhiVis3cUljQlBVM0JCUmhKV2hzWlVoenFnbGJQelNGQnhqYko5dWlBaDhX?=
 =?utf-8?B?V0F6eS9qWE0zVXpzOXRScU5QNmJRVU5Id0NTUk9ZZGVKOXFRNUdXWHN1STht?=
 =?utf-8?B?MUM3NThnelNwUDZ2cE11bVpYTTVCU0dzc1R5RUorRk05ckRCVDMxUmxJam11?=
 =?utf-8?B?MmNvT05UWnJjTjlpQmtCS2cvcDVMZndENFR4MHlxYmZSWnlJWU82aTRDNEVP?=
 =?utf-8?B?VGJXTERyRUpLWUtZZEdIMkhJR2hVNjV2dHJLekRRQWpKckdseWNLL3FubFh2?=
 =?utf-8?B?aUVWOVZhV2pGYjlXSkpCMWdzUXVwdTFwenRySlMycncrQnpYVWdDaVI1NHRB?=
 =?utf-8?B?STdSaWg4QUJyNHJkSjdHMmc0dk85RkZxV3lCN0R6WFRwUFlRNDJ1WDRtVmpP?=
 =?utf-8?B?RnpObTVCaHBuR2txMjZJM3FVKzVTV1RHRWwrbS9jRGkrK3dJZmVrQ0QybWFI?=
 =?utf-8?B?eFRuaWhXb3VleElnbTduUnpqWE5XSlR4T2RBV0pkaTEzSHlQVlBWV1ZIeUpw?=
 =?utf-8?B?dDlUOXZXK2RmZU05U3ovZkE4cXYxVnVXdzZNRVVEaFBlQTcxTE44bWJsMll0?=
 =?utf-8?B?VmRlWGFDbnZpTW9ycy9CQVdvYTlURjBaaUVNcTlXMnBqTHNmdVhiZ1FRZ2gv?=
 =?utf-8?B?dldFS1R4WVg5VG5HUXBxbmo2bC9IdWk1TXMxZ2s1c09zK0VCa01CTVVJSWp1?=
 =?utf-8?B?b3NkaThrQ0VGajd6L0laUEhsSDdFcmhLOGhwRzM2RDdxN1FWd1dxcUVDU3E2?=
 =?utf-8?B?WVcvTm9CR0kvaFBWeWZyWVoybDB1Q3g1ZkJLN2JqaWoxT2hOUlZIWTFHcDF0?=
 =?utf-8?B?R1JpRTRLWXFPNGRKcmlFU2tTK0F2MjgyaFpqUmZBNHpSZmM4UU1OSkxoSUtm?=
 =?utf-8?B?UG1xaDhwVURSdnBuWXJheUtDdnhIWW1qajYyVnRIWU9pWnhvd1RqL0tOanpn?=
 =?utf-8?B?MDRCRGxmdFM1ODlZdVNLZi9YbkFzWUVZNFpBWUJWalR1WHBvbTJpUEtHRzhj?=
 =?utf-8?B?dW5QYTFqNkhkT2Z2dmRLbU1wYTkzVVlqVWN0bllaZk5uTkhvVXRWUElFR0FS?=
 =?utf-8?B?Vk9ZZDNCWWFHbWpJWHJ6V2diTUlJZFdCRUJmb0E2QmtWdmxjN1JkaU4vTHIx?=
 =?utf-8?B?bkFVdWdBbTdjeXR1TG8xQUxmWE5od0NnVlBGUmUwVkQwcXZWSW5EbU9iRjk5?=
 =?utf-8?B?TmVUamhiYnkvbWJPKzJNN24xUTh1SGpPUUIrWXhrWXVIU1hjM1NKcUNteHdZ?=
 =?utf-8?B?Wmw4UEc2MTU0cFFsR3ArKzdnRDdrelExNDFXbjg4Y29aQm1yNXBzczBNTmVt?=
 =?utf-8?B?aHBDWlQrSkk3TWNnSlJnZlIwSkMvcld6NjZjZ3hiNHZaczZOWFhnZkpHZ2Qy?=
 =?utf-8?B?T1cxOEV1blFjQkJVY3M5OGhydFJrRkN5M0FrSzBSSnhsUnJMd3RNUWpwWkJp?=
 =?utf-8?B?R05XWkVSaGUwNkRJOFJYQ1lUUVR4bWZUditjRlFRQkZkc3YvSjU1SjV5MFNK?=
 =?utf-8?B?cExUK3ova3pZeVlpYkxjRlpMSnNHMGVRb0hwcTIrZWlZaTlOdy9vcGJHQUlt?=
 =?utf-8?B?N1d0OVc2RjZyOU5seTREQ21KWHZiM1o3UVR0UDFPZDFjQ1AyYWduSnQ2Tngx?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9717985f-438e-4331-223b-08dbe51228e7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 13:03:56.2595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+uOyUFF4ZIGIFG3c7tna6Sh4sJDiJl61XMWV09V7ETHQ73WQ6kDaMCTAQ0eoMFpkZRcXmjCd64i87yhz729cWDH3WvKsEWmgfMQhxO73ok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5933
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 11/20] drm/xe: Move system memory management
 init to earlier point in probe
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
GuC, we will need the ability to create system memory allocations.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 6fe669fdf1c0a..a89b5a32c093d 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -402,6 +402,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_mmio_probe_tiles(xe);
 
+	xe_ttm_sys_mgr_init(xe);
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
@@ -430,8 +432,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_irq_shutdown;
 
-	xe_ttm_sys_mgr_init(xe);
-
 	for_each_tile(tile, xe, id) {
 		err = xe_tile_init_noalloc(tile);
 		if (err)
-- 
2.42.1

