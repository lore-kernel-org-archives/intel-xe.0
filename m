Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B148C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 01:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDA710E37C;
	Tue,  5 Dec 2023 01:34:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C593D10E37C
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 01:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701740045; x=1733276045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zjukaVqO8Xg4O1/vU9xtr+d0MYY8fFCUL5ADLIqqgEw=;
 b=TlW6ruBFLMCItM3mkQlMgJo9aaDjes8HYhBdMnK6+ytVJGVx2mGufTsK
 OUF7DgNk18ZIZqPFL9eL4A7PkbT4Uj8xU6MXB7Gfb/C7IBCrVu3zTedjw
 gcsiRamqMEbthKbNtbiiaM65hlZUnbO9k8dEXzPh+M8ejAgoavLuW/of/
 kdlM2gY491PHc5Sj8mu4rS/mDD1+qHvAaUjVT5wPYeQKMnk3ntFSznxWF
 0iQxnddmcDswte6zzmIPJQ7hkK5MghZDK9ZV/w8s7Ce/X01VBwMsokcIH
 iXzQIXRvB15vrsgRaVhuh/BJJn35Z/D3cPXEFtUXx1ijfOTD200lVw18+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="373268880"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="373268880"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 17:34:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1102277759"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="1102277759"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 17:34:00 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 17:33:59 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 4 Dec 2023 17:33:59 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 17:33:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UF80zuYdTha0lSw0JWv3jhH/ZwRyFg6+jhZpV4P2qbw4L9ljsagWwDTOWoOwMIJ6XGPB1Of5a5IQW6Y1FJejl31njZ+VXP22jLlYlTdSgASJztBp05+DPYQmtAycHa1Dj35imZLPeLPW70JsUwAIjY4sY1bAOgTSQxaeEWs/KhyEggsEhPmaibnF4X3WmpIMbRKVY5Sdzq9yiHh0X+yCXpcW26RRHWSnlR/kRrt92e3Q2K4gsOawiahVmhiGmSqEoKrDs32I7eZM2k+a+7jFFuGxjYg8xQYoVGi3Sh6jIjbag+6DWS/l6UFGFw481ssQzKSbHtAeToXWCBNUrhAHSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zybGhNN6AX0yrIbvJJ377YqRk2iEWUp7Nqv5P7L/Zpg=;
 b=mihgMSlnhckPhosfQ7+ahH2LIOSYbfFIyWKH/J6EveIlNatenaWNv/FO+2oAdAdUtadpiXhvaRsWfX0GlHu8BlrqELsE9gRMc1xgIr8NZ+qedOkFiA03LqeRFHArtTKwLulQMWTFq9ZqCTYIYcl16QsNk3cM8e3oJzr+2sfrkh4XbWkjEbKF+syQcfsyeNey8mYOa+j+/UNeWPjbnnpg0wvGhU0t+49bjTvvSWoKqYFtDfqLnxOTWKR71HmjPQr/1IYsn7tvwy2SIew8rJP+sKzG/AWbgCKJYno0TPl9KvXpEY6nH7DgYciLDovFwUUYTbRfcYNUIz+BLqx2PCI/xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB7051.namprd11.prod.outlook.com (2603:10b6:510:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Tue, 5 Dec
 2023 01:33:57 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 01:33:57 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 5 Dec 2023 02:33:08 +0100
Message-ID: <20231205013309.1497006-13-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205013309.1497006-1-michal.winiarski@intel.com>
References: <20231205013309.1497006-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0233.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::15) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: b05282f4-6ca3-4529-ef7d-08dbf5324007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BIKdlmu9DuB5wYx1Ez3OM0LD1aaN61HL2Cwbn7dM8Tes/0kjDFr4jQDIbNrnbqoSIIF3LWdrSi2tppBcXQFLDkN8dhHbMPo8FEzJ8dAYp4nJLX7ZBz6XFVCExekD1vmMTEIp/eahXrmIDpHwbxpOHjEpcvdSBDwxM9l/kFfjJop/iBIMHemtzr6YB56YMzdgHsKqp7uDZ1VF0sxQBEKZFwEZlChIsHqK9iplFGCxMcJGaBpXDdieaY2Ymf8rnLrwJuqBxGI+midwycnnYbwkQ/HOHfexD8HD4zWafFSW8BtZyHzv+9z7En6ICsjXesvFdW3vtdtHGmTqPc9f2R4assy8whvZX1p2gyxxKELcZGznXqAiRhiIDFZUjXpeWRXlh3p1M5LNXcYPFC+3nSA9IfnGPpfqcfbar5CGwTNSGKoAhmOOyn3mPVAea/ZaZfwkEO0zugaSY1g3DdLLkkIxb11TkWk5JhaXbjcZnSRoLBgx9hSiqLwIp/hNK3eka/Dt86UPDNcY+c1yGbmAIb8jBMW0ohHwLR7Ar2PcIho2ZfQEVFt3gLQC5K0x683oK8Yi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(39860400002)(396003)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(1076003)(2616005)(107886003)(6512007)(26005)(478600001)(6666004)(6916009)(66476007)(6486002)(41300700001)(2906002)(5660300002)(8936002)(66946007)(54906003)(66556008)(4326008)(8676002)(316002)(6506007)(82960400001)(36756003)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEdFREFwTzRCSjV6SDlqdWpVL2FaajFrcUJiZytBMDNBaDF1Z2tXb09zdHVQ?=
 =?utf-8?B?cm4wNG5UWnJtN3ZRT0F1MXkyMUh0Q1lFL1cybjBtN3QwMDFnRG9zQlZoMjUw?=
 =?utf-8?B?UWxGZEtaZmpWOC9lTzZ3UTRXOHdDQ0NCNFhrSzNEZ215Vzh3NFNPUjJoRmhv?=
 =?utf-8?B?RlphR1IvaEw3SmRsV0dWMkNBM05rY3R0NytCc3ZPdXI1aW5zZ0FjMzJtMWxj?=
 =?utf-8?B?VlBCcVM3L1hMdU9yakkxMVZnUFN0c2t3V3dBK3ZHd1ZQSjVQUHE4RmxrVVFO?=
 =?utf-8?B?UkVyRnpTemtZQ3hLVnJUcjdQeEdhOU5vODlOUGhXc2tNM29NK0oyekE2Vmpn?=
 =?utf-8?B?WUh6VDFkU1h5NE5zRXYrSjFmYkNEeXZLTUw3NVR1UHBkekd0NVpaTzUwWStO?=
 =?utf-8?B?S0ZlOFlCb3N5UjVlS0R4TU16bkJCZEJ0dnNkcldVdHdmSTFUTmdTczVNOXJC?=
 =?utf-8?B?MFluSDdFam1HeEVFMnY3MzBMTndBbEdXdDBGZTJmTm9xNWtaWmZqTUdVZGVl?=
 =?utf-8?B?RUFURWlSbzVxQmZ0OXlvY1ZtZ05rSlVmOWh6ZzhDazIySmVKMm1aQm1HTmM4?=
 =?utf-8?B?VlAzSmFKRnZsOE1IODFlWGkybTFsNnltejZDdHhhcHNEOFRjdzNJdnNDY2FR?=
 =?utf-8?B?VnRXUFYxVXExY2ZDbDNZd1FCRG5iOVkvN1FNdWRBVTJub0p2UldEdUdOQmFG?=
 =?utf-8?B?dThmd1daWEllKzdFUWRWVzZVTEZodUt4SWNyY2w3dXJhMnhya245T0lTSGJa?=
 =?utf-8?B?K2RobUdjNUJjVHp4Tm0xcUNtdGpRVTRyWFpIOE4wNC9HaXpFN3NOdGxYaWhF?=
 =?utf-8?B?U1JpVEVJby9mUkZKYUx2QlRkWHMxZ01kMVNEcjVhUUxhODNMYUNCN3pWL1ZO?=
 =?utf-8?B?MndCUzNDanhkdWlma2RBbVI4M0NFZ21jMngxWVZFS21kQjF3b1ZDaytoeDhr?=
 =?utf-8?B?MG9HdG55N0NXb0lWejMzc0V1SUpKTVlTWnRhUXA5K0Q5OTZaanRqckRUOGRV?=
 =?utf-8?B?QnVkUzFXSityQnBKTDJPbjVQeDYzSCs3cUNyb29yZXBZY0tzcFZvSHBkVGVr?=
 =?utf-8?B?b2tKa0t1ckpDNkVEc3JMS3JEbU5ETlFzNjBsMzVPaVdsQVlJcjRVZHVOR0hZ?=
 =?utf-8?B?T1NwUjRPM1lKKy9LM2hlUlg1VmV3dUVEY2NMR3FLME83TUVTalZkL0NvdmNR?=
 =?utf-8?B?VWE3NUdVN2pjRk05TFBZRlpsUWdiTmFxR2w0R3lBT0QyNU5jY3pJSHRDRytE?=
 =?utf-8?B?aS9SRTloVW1udnVXTjkrUkhXYVE4endmTnl0M2lsWW9HQjkzTDNXUU5DMjVn?=
 =?utf-8?B?bU10ZHhWeitDL2Vmamh2b0tTMXYwR25BQmdCTVR4bmRPU0dGakRSNnBQRGdt?=
 =?utf-8?B?alRodjg2NHZjZmVKcmc0V1N6YTNiRGo2a25QN2RkOWt3QzZCNEJqcTdSWmxp?=
 =?utf-8?B?S1FFUGpYY25zZmlvV1FjakZacGNZaUJKUjlGN3RFVEtzdmN0bHpISjQ3K0Ev?=
 =?utf-8?B?WlJlNjRpcU9XOWo0QjJ2TFl6dHNsWGxsNy9xblNWN3BDTGxadmtlbHQ5Ylg5?=
 =?utf-8?B?UzByTnN3VVhkUmFFQ1RxSFhMS2ZLekdOZHU0ZXZLaHUzbDNrM25BMHJxaGNa?=
 =?utf-8?B?cmxNSXlFaTBDMkZOMDdBZjFOQW91WElpTU1CZVJ6S00wdlNEZ09hWFBhNWRm?=
 =?utf-8?B?WmVIVGoxbVl0K1YwSlo5S2VSakxQOUsrVVZBdFRZWTI5QUVoWGtxUllZMU1s?=
 =?utf-8?B?RTJYL2VWR3BpSk5OeSsveXZRVnExOVp4N3NWcnRGKzJmWnUrckg3WENsUita?=
 =?utf-8?B?S3VPc21ycDhJcG1qSXlFQUpLQ2d1alhmbTFteTBSZXU2dWwwc0FLYWZrSi9M?=
 =?utf-8?B?bWtBdTJ3cmJuVXVwdGh3U1NOZnpoVHlMbHNxK29BUFVrVHA5WEtzeW1SS09v?=
 =?utf-8?B?ZVlwdytyUHFsZHFTNnpZaUtSd0ozZFlWOXZJYVVkTGFhUzl3ZlJJS1h2dTVV?=
 =?utf-8?B?WWNsQzZYNVpCSXMxUVBFNGRXRXhkWEFFOFN4OUNVRUYvUE0zVDhIZllxSFBk?=
 =?utf-8?B?azJ6ZjlFRkJodVdONXYyM3hBN1AvK1FjTHR6TFl1YWlEaFI4TmZVc25ySzdo?=
 =?utf-8?B?cFhPc3dsUmVtRkdrS20rS0dpWFdFQXc4MmRZSkZXbE5sQWRTSWZvZ2ZtdUtn?=
 =?utf-8?B?VGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b05282f4-6ca3-4529-ef7d-08dbf5324007
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 01:33:57.6198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uRH+Pi4nynhdUFi5JZnhvVlkPcRpVQIAPL9mn7irUpVXvRo4tw5LCBsKiWGnegU5I/Af6I4Sn/NzJVvCxFzOETUCsYE7VgyvihbBmPuaBdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7051
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 13/13] drm/xe/guc: Split GuC params used for
 "hwconfig" and "post-hwconfig"
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Move params that are not used for initial "hwconfig" load to
"post-hwconfig" phase.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index e6f680efb29ef..482cb0df9f15b 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -182,6 +182,26 @@ static void guc_init_params(struct xe_guc *guc)
 	BUILD_BUG_ON(sizeof(guc->params) != GUC_CTL_MAX_DWORDS * sizeof(u32));
 	BUILD_BUG_ON(GUC_CTL_MAX_DWORDS + 2 != SOFT_SCRATCH_COUNT);
 
+	params[GUC_CTL_LOG_PARAMS] = guc_ctl_log_params_flags(guc);
+	params[GUC_CTL_FEATURE] = 0;
+	params[GUC_CTL_DEBUG] = guc_ctl_debug_flags(guc);
+	params[GUC_CTL_ADS] = guc_ctl_ads_flags(guc);
+	params[GUC_CTL_WA] = 0;
+	params[GUC_CTL_DEVID] = guc_ctl_devid(guc);
+
+	for (i = 0; i < GUC_CTL_MAX_DWORDS; i++)
+		drm_dbg(&xe->drm, "GuC param[%2d] = 0x%08x\n", i, params[i]);
+}
+
+static void guc_init_params_post_hwconfig(struct xe_guc *guc)
+{
+	struct xe_device *xe = guc_to_xe(guc);
+	u32 *params = guc->params;
+	int i;
+
+	BUILD_BUG_ON(sizeof(guc->params) != GUC_CTL_MAX_DWORDS * sizeof(u32));
+	BUILD_BUG_ON(GUC_CTL_MAX_DWORDS + 2 != SOFT_SCRATCH_COUNT);
+
 	params[GUC_CTL_LOG_PARAMS] = guc_ctl_log_params_flags(guc);
 	params[GUC_CTL_FEATURE] = guc_ctl_feature_flags(guc);
 	params[GUC_CTL_DEBUG] = guc_ctl_debug_flags(guc);
@@ -279,6 +299,8 @@ int xe_guc_init(struct xe_guc *guc)
  */
 int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 {
+	guc_init_params_post_hwconfig(guc);
+
 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
 }
 
-- 
2.43.0

