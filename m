Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C214EC10DCE
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 01:33:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BF810E460;
	Tue,  5 Dec 2023 01:33:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DD010E455
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 01:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701740011; x=1733276011;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3JQ5Bn+Z7A6GStmJ/jAIYNxWXcOMpy3A/aKU/T/q/yU=;
 b=bP/G2FNpglNVD0OpSRqMdfxEnPV6Xkg2Lvuc5j/UYNwvY4i/89q1BluM
 89wc35l/COd5MsaI/B326SX8TMb91ednsAsxg1+sEp4O1FgxHtlvnr7OM
 ilMkZrdvpSfdNSDh0/9XVvTO5elNLBmpIroAcyXByC5KdrwIN8cF/B8G/
 xfuRdix1z4/xXmVBZqRxDK7xl/1CJCgt6nTvezthPKkMJKgL+J8VKGynX
 t532iMDnbQB2Er4nZuGvfBDU/1VSBP9L9S1t2aWbCE6jDyI2fVhdmbMtW
 xLtxvV4fdNtkWIFmP050rS/BwyraU4QhojWDQzvA5J+ejBQIswWbDmqXJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="397723562"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="397723562"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 17:33:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="747035866"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="747035866"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 17:33:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 17:33:30 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 4 Dec 2023 17:33:30 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 4 Dec 2023 17:33:30 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 17:33:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MO7gtcyPyxOMaNMwKyPaDGrGY0EFlCOow3VHFzzMycR4ELH0tVNDq9r8zyO0VGbyW8ceub6JLZGNGjEl0qklCN7HNYATwZNmp6/AFNLp4ytvwJIIAPHEZ6FisBC18LRbJ8M5w7Bt1uGXjXDDi5AjG5+aq/1VjGdkcd1J4ziNm5AuQxtH3CUzLS9evxkPejzP/m9wTBwQR0kuaFyCkijtRgktqBmpr1g1XD9uN5KOcYlpMK4EvCBBYB3PdiIGbEARbOZ+09SK6QXwCTAalamjdz3kT9Ey/m5TW0mZGi1+PS4Y8pZgvzrgVzP89tv2oe9rhv2AGDbYQM2QymK6063tFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wc4eR0nn3Tx+LUZKyz6yxVBAVz0FCODW5CS7+zO+4Uw=;
 b=b5zPrbDdrD+ddVEyETXxw5wKA/hUFPfB0kVQT++SrXes9OxsUlRTzTdGZMA2M+6TEbYehsix83spTZpHXOvMMx8sikrSyx+kXUedVxUpYIrC62J+VN49QcFtyHoTdoFcBM7UzIqa9ocJCOZa4fKwH8cVN9XyTYPlDtTbt9DwILvtuVs81mrnJm50MxhsHtS6PQDuPhZ3JFcPfrs2aUhQiy6hcXXfujVhFAWHd1NHNFHGxGn/NSj+TFmw/QfPjpbnM6bXnmeFC0cqaf8oFniM8cfzbUtjUU3lACKbTY51LgR1z6IkO63oYcRgeJ8wvkAgpndlL5JB8CH6J+3YMyQO9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB7051.namprd11.prod.outlook.com (2603:10b6:510:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Tue, 5 Dec
 2023 01:33:27 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 01:33:27 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 5 Dec 2023 02:32:59 +0100
Message-ID: <20231205013309.1497006-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205013309.1497006-1-michal.winiarski@intel.com>
References: <20231205013309.1497006-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::22) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: cf5107a7-97a6-4e0f-8586-08dbf5322df1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VBqPS/vrQdmjF2LlxTYpsPpuxR3wiitDHFnMbAo027pdB1TU+sJlp28u9qUb+oa+u7FS9+ni0KtA2SZRRNEP0U+ahG2IMOYho+SkZbrWrgrcenWLbZi9fnUt7A2hQHrnNuhfmT89sn3WBLy6xBdw5hAEyIWL5c9jaZZFM/uTfk9q4gMH4bHUqIN8Bm8XwDLCxcIKh1Lr6fv4kopJwzaDCr0EK9n08kJEvRHKqgeGzLeXH9ahecY9ZiIaTN7rKL4HKj9NsMkdgAQlWoJ9CI3g+1dkSqZntnGbEsVRrj+g91hRwY3a6YwhA4+nk/4DsK2MqH6xNK+MPBL/MHz7wogDzrXwZPk5IgusmPBG+pSlZzbCGhDvgXYDc39kbBvESbywxsIZlIJHNj1n0j6IQ7ZDxZKxa4Ck9Edw2y/wP0r5CQKeYbtruT3qyMCHTZvxn/AR2GjREc9W6SBU5A2irSBNBLQ8fUz4sQJkAAIKHndSBjgpraQmStosNbjXDdLoHQuPlP1BfRGpFaenJOwHSKoru4oIniI4Egq90zfmBnnRAmPmd98nBn8Awj2gK1ouUA4u
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(39860400002)(396003)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(1076003)(2616005)(107886003)(6512007)(26005)(478600001)(6666004)(6916009)(66476007)(83380400001)(6486002)(41300700001)(2906002)(5660300002)(8936002)(66946007)(54906003)(66556008)(4326008)(8676002)(316002)(6506007)(82960400001)(36756003)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDA5U0oxNWxVVEdhTjZrUnU0eVdVTFdHTlQ5bWxUM3RrTm9MdEE1cHQ2Vllj?=
 =?utf-8?B?Y3prU25odWVjTnF1U00zYWtzNk00OHpIUjBtTTZNc29ZNnlmWFQzYUV4L1l0?=
 =?utf-8?B?Qno4RWxGWWEybGVFSEZjK1czbFNQU1hWK2Erc0xOL3JYdTg4TDlZWFR4TDZv?=
 =?utf-8?B?eGkyVElQSCsrWm1lSVYxVFBZTUdsS3ZkaU9oZVBzZGZwQjRKcmI0T0FPTW8v?=
 =?utf-8?B?MVFEdGdVZUVrMUlRQ0N1QVNRNVM5dXg5OElhcjc2VnBHcEFCZURuNVZDTFpB?=
 =?utf-8?B?dVlRU1h2bUtBajlsWGJWQnNZQ0ZyOHdrNDRvRUw2ZlJTS2JDZWpGaTlNZ00r?=
 =?utf-8?B?K0lvcjFWaHM3OEprakNYZDRCcHBGajFONWljMlFxRUZYdDlmb2hacGNrY1ZH?=
 =?utf-8?B?MnhyOUdCeFB2YlhKTkxTNDVxTXN3elZ4aGczMXN2Vkt6eGZQS2hhdURYVy9N?=
 =?utf-8?B?MmhJQjE5RDI5WnJSbXFNdnJYNWtqMmZNelE1ZEtyUDlVTUM5R1R6UjB0djAx?=
 =?utf-8?B?WnhNa1dNcW1mNk1vM2R6Ty80cGpEdmdybDlwMjA3LzhqMzFZVU9MZjV1RkZa?=
 =?utf-8?B?Qkx6YUQwTUJBMzJ5NFhWcVphbmR6L3dCRWo1aVNyNjYrenY0TmdoYWpad3E3?=
 =?utf-8?B?ODg3Nlh3TWgvL2JvQXNhdmwxTFBtcGxtdEc1TXFZNUkrcDRkTC9ZWC9Ycmsw?=
 =?utf-8?B?WHcyK0l0c1BITXdXRmNzcW9yNFQxUGcyWU5SZFhjRFZDWVE5VmsxSzBxeVQ1?=
 =?utf-8?B?N0FzanlGUFY0bEEvK0FYSFQxL054OXRzTmhySXlWNTljMHhMbU9vNk1CVmox?=
 =?utf-8?B?Q3VMMVMvQWVSWDFTcXJJQk4vdVdycVVER0t3bFVKTGc2Zk1teWx4dEo5clp1?=
 =?utf-8?B?cmZSUlJWRHZBSFQ5OStObm5uUVlCeDgwSzU2bXBMVEc5ek85c0p5WlgrdXVx?=
 =?utf-8?B?NkVPWEgvVXBEbGZtRis4UE5jNitRektlQkxGN1NEWEwwd0M0dFhQRElVeXoz?=
 =?utf-8?B?Rit5T0NheUowbDFsNjNTUnZaSExUQ0hUZDZaeFNtNkk1VUpGSGgyRHd3RDU0?=
 =?utf-8?B?bzlQL2xhVmpNOVBTNFV6aG1EckRPOTJwN0U3U3ZzWXZ4NmhGZ1JFbUE3c1Nw?=
 =?utf-8?B?NTVHWnJ6M2FDaVZtcEVhdlVlMW1aWGNsa2xFZWNlK2ZYZHp2Y1phUHBNVExy?=
 =?utf-8?B?azBCSXBxTHg4S0tVeXRON0dEWVJHNFMwWTcrWktXd0Y5MElhZkdHZHZnVVB3?=
 =?utf-8?B?NzVkWUNXaC9lT0ZVZDkrN3FKMTBlc1MvV2FJcE83VVNPM1liM2RQb3k3YklN?=
 =?utf-8?B?cnN6OW9VY0NzUnF3b0t2anlLRHcwNHY0NUVvL1FlSFlpRzFvcFM3dXUrU2tz?=
 =?utf-8?B?SEg4Y0p4ZVlKTUlLZUIxM3pSdnFIYkN6MVA0K3BMd3grbmVNVm5EUE1rWll3?=
 =?utf-8?B?bm9jaWJ2S2h6dWhVYVpYS3BORmhJRGhGcldlalNpYjI4eGV3clBMTVJXajNU?=
 =?utf-8?B?Y2ZucnJWQ1dZcmI5eXNEQWpVQU55K0JEcUpJa2V3czVyMllrUjE5ZU5mWjZG?=
 =?utf-8?B?bENRZDhEYjlHRndiajNybG9CMVhsTEhRWnNydHRYQTVySWtCalNlTzNoUXZs?=
 =?utf-8?B?UDZGMUoxTEZNYk5xZWRlMHNpMUpQQXBtT1ZjaWo5NjdIK29ENGZVYVBaNmpV?=
 =?utf-8?B?Z29ZTzRMOU5BbjF4UHBMK2hmNUYvVXJUVk1jcytURTJCa0NYbkIwSk9FR1dO?=
 =?utf-8?B?c21EVEordVdLbDNLN2ZWT0ZuZ3FlV2xDK3FCSmZ4L1AvUWpXZ0RRSnAvZHB6?=
 =?utf-8?B?NFIveGpJYmo0M1VCRmhTbUtNdnJnUmFEK0dic2tCNnFxRlQzVlhCY2xXZUdK?=
 =?utf-8?B?NnljeTZBWVhtSFB3VmFRaFdWSDZIRUdNTlp1YjdKMEpEdlRMTWF0MHJIT0tz?=
 =?utf-8?B?MG50eVZrb1REbEdEa21GTGlvVHhJL0hMNDFuWmJpZTRKRGNEeWJ3LzdLQTVL?=
 =?utf-8?B?MWpISFRxcTdTOVlMUkZBTVBKZlBXVjh3bVpjdXZkRnJqZUVqbnUrRGg1a2lK?=
 =?utf-8?B?OW5sRGhuZkdoaFNwWkxHYi9pTkY4N3ZmWVdYaUJDamdhcFpaM09YRVNxdXpx?=
 =?utf-8?B?RjhBMFhtOW85QmRVMWVCQTVpSyttRlJ5b3hkL0pzTDMzVGxLdUVROUo0T2py?=
 =?utf-8?B?eHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5107a7-97a6-4e0f-8586-08dbf5322df1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 01:33:27.2017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ObY256MIopRwLhg1GXElqlaTR5oui3ViBbpPnQkclTV9xIx3tco050yC2SFNfi9wJaxx/0IYHNHKfRwQ/VEZ0bHOjhhweemclPDhfVMeXNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7051
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 04/13] drm/xe/device: Introduce xe_device_probe_early
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
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

SR-IOV VF doesn't have access to MMIO registers used to determine
graphics/media ID. It can however communicate with GuC.
Introduce xe_device_probe_early, which initializes enough HW to use
MMIO GuC communication.
This will allow both VF and PF/native driver to have unified probe
ordering.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 22 ++++++++++++++++++----
 drivers/gpu/drm/xe/xe_device.h |  5 +++++
 drivers/gpu/drm/xe/xe_mmio.c   | 16 ++++++++++------
 drivers/gpu/drm/xe/xe_mmio.h   |  1 +
 drivers/gpu/drm/xe/xe_pci.c    | 26 +++++++++++++++++++++-----
 5 files changed, 55 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5e1f73c8c77ad..f4be4b13a506e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -375,6 +375,24 @@ static int xe_set_dma_info(struct xe_device *xe)
 	return err;
 }
 
+/*
+ * Initialize MMIO resources that don't require any knowledge about tile count.
+ */
+int xe_device_probe_early(struct xe_device *xe)
+{
+	int err;
+
+	err = xe_mmio_init(xe);
+	if (err)
+		return err;
+
+	err = xe_mmio_root_tile_init(xe);
+	if (err)
+		return err;
+
+	return 0;
+}
+
 int xe_device_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -393,10 +411,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	err = xe_mmio_init(xe);
-	if (err)
-		return err;
-
 	xe_mmio_probe_tiles(xe);
 
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 54694f98c91a2..3da83b2332063 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -37,6 +37,7 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
 
 struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent);
+int xe_device_probe_early(struct xe_device *xe);
 int xe_device_probe(struct xe_device *xe);
 void xe_device_remove(struct xe_device *xe);
 void xe_device_shutdown(struct xe_device *xe);
@@ -123,6 +124,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
 	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__)++) \
 		for_each_if((tile__) = &(xe__)->tiles[(id__)])
 
+#define for_each_remote_tile(tile__, xe__, id__) \
+	for ((id__) = 1; (id__) < (xe__)->info.tile_count; (id__)++) \
+		for_each_if((tile__) = &(xe__)->tiles[(id__)])
+
 /*
  * FIXME: This only works for now since multi-tile and standalone media
  * happen to be mutually exclusive.  Future platforms may change this...
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 2e6c94731a5a0..35aeb50b71589 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -15,10 +15,12 @@
 #include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_macros.h"
 #include "xe_module.h"
+#include "xe_tile.h"
 
 #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
 #define TILE_COUNT		REG_GENMASK(15, 8)
@@ -376,10 +378,8 @@ static int xe_verify_lmem_ready(struct xe_device *xe)
 
 int xe_mmio_init(struct xe_device *xe)
 {
-	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	const int mmio_bar = 0;
-	int err;
 
 	/*
 	 * Map the entire BAR.
@@ -393,12 +393,16 @@ int xe_mmio_init(struct xe_device *xe)
 		return -EIO;
 	}
 
-	err = drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
-	if (err)
-		return err;
+	return drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
+}
+
+int xe_mmio_root_tile_init(struct xe_device *xe)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
+	int err;
 
 	/* Setup first tile; other tiles (if present) will be setup later. */
-	root_tile->mmio.size = xe->mmio.size;
+	root_tile->mmio.size = SZ_16M;
 	root_tile->mmio.regs = xe->mmio.regs;
 
 	err = xe_verify_lmem_ready(xe);
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index c054c27f6925d..98de5c13c89ba 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -21,6 +21,7 @@ struct xe_device;
 #define LMEM_BAR		2
 
 int xe_mmio_init(struct xe_device *xe);
+int xe_mmio_root_tile_init(struct xe_device *xe);
 void xe_mmio_probe_tiles(struct xe_device *xe);
 
 static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 19d1cdd3963ae..ef4ac5412e22e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -537,10 +537,12 @@ static void handle_gmdid(struct xe_device *xe,
  * Initialize device info content that only depends on static driver_data
  * passed to the driver at probe time from PCI ID table.
  */
-static void xe_info_init_early(struct xe_device *xe,
-			       const struct xe_device_desc *desc,
-			       const struct xe_subplatform_desc *subplatform_desc)
+static int xe_info_init_early(struct xe_device *xe,
+			      const struct xe_device_desc *desc,
+			      const struct xe_subplatform_desc *subplatform_desc)
 {
+	int err;
+
 	xe->info.platform = desc->platform;
 	xe->info.subplatform = subplatform_desc ?
 		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
@@ -557,6 +559,12 @@ static void xe_info_init_early(struct xe_device *xe,
 	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				  xe_modparam.enable_display &&
 				  desc->has_display;
+
+	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
+	if (err)
+		return err;
+
+	return 0;
 }
 
 /*
@@ -624,13 +632,15 @@ static int xe_info_init(struct xe_device *xe,
 	 */
 	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
 
-	for_each_tile(tile, xe, id) {
+	for_each_remote_tile(tile, xe, id) {
 		int err;
 
 		err = xe_tile_init_early(tile, xe, id);
 		if (err)
 			return err;
+	}
 
+	for_each_tile(tile, xe, id) {
 		gt = tile->primary_gt;
 		gt->info.id = xe->info.gt_count++;
 		gt->info.type = XE_GT_TYPE_MAIN;
@@ -724,10 +734,16 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	pci_set_master(pdev);
 
-	xe_info_init_early(xe, desc, subplatform_desc);
+	err = xe_info_init_early(xe, desc, subplatform_desc);
+	if (err)
+		return err;
 
 	xe_sriov_probe_early(xe, desc->has_sriov);
 
+	err = xe_device_probe_early(xe);
+	if (err)
+		return err;
+
 	err = xe_info_init(xe, desc->graphics, desc->media);
 	if (err)
 		return err;
-- 
2.43.0

