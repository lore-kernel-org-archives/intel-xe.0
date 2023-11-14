Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F3FC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:04:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0637E10E206;
	Tue, 14 Nov 2023 13:04:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9F010E441
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699967054; x=1731503054;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hNfCh4lOrqhhGRj4pccRIrKEQoXarHn+Dhgoz7u7fAk=;
 b=lPvomb5D6oN8i0fAK9G7XcW0tS+9OBQVPazn27GBwLcXLxq0H62KASAh
 PEKzRYafjQpdKohscFl1RraKzfL1/Sp/9+ICqenBo/CHKLE5wrFJ/nXur
 376K2DmFwe7w45+BTxxM3rv2iHgm7HxvhvJED3GCdzWvxIjIp32FSvd4t
 XKmgZNeotERoMnaQgJBA1Ib9wvlKjpsgdcmN4UWiKV10Cojy4Jw2VaTz/
 29ib8SqlbJI/pJyBQDd5kM+gHTUomiUzfoOpTrSzIEKWoXDIahUCyfwfr
 73zLB5o987vx1Xw752765pBC8qpe1p4Yhr/agkAykw/KrYDWTyH2RtHaW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375692151"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="375692151"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:04:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="799518449"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="799518449"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 05:04:13 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:04:13 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:04:12 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 05:04:12 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 05:04:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgAhzzULScUfIxIoJsoPwa5+Rv3GgelOPqhpObTtvaHeQIwb70lnjpnxbKCj3JaXlAQdaHuo2rvkOFQc3xXPukTWsAk0sIxKj9594vy7DFy5W2TzKUAiqr5Z/7pwlnAzrd9Q4Jlr+ATT4Y0OUaqF6M688RN+wvffzWqvpUB1qUdpESvVjCvSkWzYCuC0j1B7y3gRjzmzcV/xkmBMrs9xR5/hEe5JN9TUIANJe+Wi81yrUcceQXISyjdvAkGko240LVpaoTteAlffEGTS+OYfTAxydZ76y71WBuyhNkxvQxsbIdbNFYgba5OuKsKy33xyrIjM8FxVBxRkkM8Ich2OWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PtHRSgrd8pjHtW87rH69k45K32wlNCVjfiqKElnZS8=;
 b=GBp5d6Apkq4SWt6lwiA5AuXh89W58096TAFdy3+T8jy7UqmLeRN6zvC7E9VJ/8IVs6frvuaSoikimBPOwv8oqXMb8MlTdzM8pjogOayWBWE4Xflbpa1w6ivgRMEv8yH86OQrtyfn3533fXCfz7RDGP72YHO6VprY/S66RCkl6aCczzU/3rAjyXHqu8+bfFDu9k0J4s9z3XbFQwO7qJpoDHHIK9m/ULPboBUTX7OKD2KLcHp4kpj+K9kwTYtP3NUBPJGhM6pjs9M3fKst8fp+lmDNv9AiWLlOoNmcCOUMVHFXzbaad9iHYeAwTHMG2+PycTHry4nrdTUMSajaVa+2Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 IA0PR11MB7837.namprd11.prod.outlook.com (2603:10b6:208:406::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.31; Tue, 14 Nov 2023 13:04:09 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 13:04:09 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 14:02:26 +0100
Message-ID: <20231114130231.2299661-16-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114130231.2299661-1-michal.winiarski@intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0013.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|IA0PR11MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: 0199857a-8d2e-4a99-2494-08dbe51230ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: csqskzOS3Gr07OJft5AkP+cDPBKqMQPuIgZ8jD+BQ8vBvdq3PEIVCEeu3Du1G7xBqnzZ7l20GOEvt5u0swRZD8g3Sderz8nK0eAEopwRJe9LMSAz4n9GrEVaEitXwNkhBMAReBLWV2yarZ/euWhn4UyonfO5ciJXXppS4RtqTl464W4i6dbJdtTv/2H8FBYpG0k+Zlu3YF2ycrrOUsfqzOyXbumxScHjH5lQSUxo6Yyjyh0HzzO79ZwVRcU3hp4TdeH1hLJp0XQEbtanql3i4UhL0PXOTswiYT2gtikqBinrty0z2te3LcHNn8hELQGSHJoRX/VlIMw9uAr4KWPZ3xTDowqUzyPTjGbiQ2V6badNlTAmKbHgkNJRHjsxxod0KXmMBEkhd65sOkCLGTWmgG7BrvKkVgWLQl/8yEzOF4UK5vV5OY9sW/YwVnYfxEeZoKLQmyF9moUtLAjWBP2e1a/0LFNs7fJYqbBE4HqR7lope063DSdWpsoI/W91QCuSYLLlVW6cguwCb7o8omA9aOOsp5J9iNaxAfzBSNyKyt/cV9xfPqyiz5Ygqz98G2yX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(396003)(366004)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(26005)(1076003)(82960400001)(38100700002)(83380400001)(86362001)(5660300002)(2616005)(6512007)(6506007)(478600001)(6486002)(36756003)(6666004)(66946007)(316002)(54906003)(66556008)(6916009)(66476007)(2906002)(8676002)(8936002)(4326008)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzdwbUwzaXJFK1UwN21BWmptczFwRDV2TndhcVVVNUhUTlZremF2a2tib0RP?=
 =?utf-8?B?azExY0htclBiMEVVZzV2c1g5R3ZDeDFzUm5qanNqaTdHZWRKelpGTzZLSWYw?=
 =?utf-8?B?UVlPLzFta08xWHFCazFTTWJWcklMd1BiNERyVVN3UjVLbUdOVUo3RUw3TzRH?=
 =?utf-8?B?YWdaN01MeXUrb0lCNlhPMkZndkhSRExEVzNjVURWbDRsaDBMZTJRRlZabU9n?=
 =?utf-8?B?aER0ZmhmT2FxcThNQnZrcitYOGMxYzJ5L29sVDdNVFZjWlpjbzFZd3dOMHV4?=
 =?utf-8?B?NmxrOGFUTFlnLzQ0Q2dVSXBPUFVKV2FkQTFqdkQyYkZ0VnVTb1NES0tuMHox?=
 =?utf-8?B?ZUNSMllWTG9Bd0pNRFFwV00zVkl3RWhhNDFHRVlXYncrb2hrQ3ZkWXRVajZF?=
 =?utf-8?B?TFJ1UGFYVFlKR1J6MGlTRVgvVnhCOHNueTNTbHRnRkFJSDRrNmM1RVZzOHVH?=
 =?utf-8?B?aS9JcGhEUGpQMFZnckYrdG40blVCTEhVelpua3pnR3lTMHE1RGFFYjczNStJ?=
 =?utf-8?B?am9QQ3haVjVhQi9Obk9DV0w5UlRnMTE2WTI1bWdEYzNzU0NiZmtRcGEvZEcr?=
 =?utf-8?B?VEZxblFsTmhJbDFRZUwzTC8rQW5vWFZPaXAxclFXNVhIYjhHczc2REJHK2Ny?=
 =?utf-8?B?NE5QYm9XeWJoNEZIVmREaGFCbVpRemNzVzc2VVExTHRuMENVTXYyMURRT28z?=
 =?utf-8?B?dGhOQWhmZ1d2bDIvVllhU0dJVTBEWEJlWlphWUJPc3l0aDVZemN1b2hoMVdY?=
 =?utf-8?B?dHJXUFdkajhWTXdyM2l0MnBXS0xBOC85SzBPSHUyRldnYnF3U2VrU1ovVndO?=
 =?utf-8?B?RTVyWUh3RHgvYVVkWlNxZGVWNVU0VFBzaHkreSt2M2RCVjlsZE9KS2x4aDc0?=
 =?utf-8?B?MGhkMkJsMmt4ZHFmeDFCU1l4b2tGZjZ1WXVOUmJENFVqeGE1SzZTNTJ4ZWRM?=
 =?utf-8?B?YWFKYU5jVE8rVm1ya2tGZjlHdDFBdmsyTldNc3JjTnp4bHpKVEJ0ZExjRmZs?=
 =?utf-8?B?OWFiVTNNbzFHb0tOT2p4MWVOMldMTm1Uc0NFTlN3djdnQ3V0VHcvM2JIbVNX?=
 =?utf-8?B?SWcxcEx5c0NEQjdMc0EzNDd6Q2hsT1pxdVlENFA5dCs4V1B3WmZRUitTbU1p?=
 =?utf-8?B?c0F1aHBhVDVOUHFGL3A3MXNWbElRZUJDMDdGQkR2TC85Uno0UXo4cmc1S1Qx?=
 =?utf-8?B?aDUvK0ZxWVlaY0tnTkg1eTdLcnU0NEZhUGZMTnI5VGg1VVhtN2hFN0VuV2R1?=
 =?utf-8?B?YzYwMThwUjBVd3FYR3ZWT3RDV29qTDZ1RWlWQzVzeFExNlAyTW42OVkyNEdR?=
 =?utf-8?B?QjJOdHV6VzNycXl2bzlOWkNrNFg3MjRZR1Z3MEQxT0l2Wi9CQ201Q0ZGMitP?=
 =?utf-8?B?aHQ2cGJkenRqTmdjYTFOeDJRZEk5aHRvVnlGcmtvcklxUWRMS2VVRExpcURa?=
 =?utf-8?B?bzFSTFFhc2FsMVptaTk0TGxSTkYzVEthSWRNUFVROGRpakFzaVZPUVZuZkRw?=
 =?utf-8?B?UjFPcFBQS21JczdtR1JuQU1zOWxZT2J4YzFtMWExVlY5SU9KVVpSdmJrMXkw?=
 =?utf-8?B?Tk1MTGRRa2hlakIzL2F2Y3YwWUZmeHo5U0pvMHdMNmRoSTl1Z3Zrd2k4Qkg0?=
 =?utf-8?B?Ukw0YWpsdFR3RUl1dnRyMDFLbXR6akRiNzlXWjJSQWc0UjN0WDltVUdJeDZN?=
 =?utf-8?B?U3lWQnJGTE1zUzFxYVZ4Z2hWazRsQWd0OUNMOVpYTFNNa0Rhbm01dmJOU3V2?=
 =?utf-8?B?bzh5RlY0dWMzbW5qc2VqdGNOd2ZTRktNMDQxY2dvcnZtdHNBbmoxK05PRXVo?=
 =?utf-8?B?bUZPTDJUdEVEbXVCbExyYmZkeFpzSUMzOUwwTlFJVkxiV1NLd2FjNy9keG8r?=
 =?utf-8?B?aExJQ1BDRFFQazd2MlJZRkRUemhPU3J3Q0pGNDlrd0RQRU83M09xbk9ObExF?=
 =?utf-8?B?T0R5OWgrbVFsazk5Uyt6Tmo0RGowNzBiUnNtdkdrZHF4eVJ5Qkl0UU5pV0ZF?=
 =?utf-8?B?QkJwL2pSb0tEcGNpc3V1U2NuT3VqWCs4bDRKazRQMnJYVjlMSDNTS2NlVFlQ?=
 =?utf-8?B?Nld1OGpYMU8xT05YbS8yMzZjMkVTRDVwaHMwbU1iSG5mcGI2c0wwTVZ5MGpY?=
 =?utf-8?B?UXZWRDd2TFdtdGVLS3crKzhBWWs0RVd5cjJBNGhsUmpKM1ltZjVFT0UrRmU0?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0199857a-8d2e-4a99-2494-08dbe51230ff
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 13:04:09.8386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p9UKWwCeGVuNkHRRqHUD/S6EcBXR/KfF0Hr8JhMXP7WAxDW386Fw6+Y+qeRpSCwzkSkhz9uw2/C3d4W0LWmIq/EatcuDm8DguoTLbtkc1rM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7837
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 15/20] drm/xe/uc: Store firmware binary in
 system-memory backed BO
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

The firmware loading for GuC is about to be moved, and will happen much
earlier in the probe process, when local-memory is not yet available.
While this has the potential to make the firmware loading process
slower, this is only happening during probe and full device reset.
Since both are not hot-paths - store all UC-like firmware in system
memory.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index df46751fb5959..b04dd7d034d83 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -636,8 +636,6 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32
 int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 {
 	const struct firmware *fw = NULL;
-	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
-	struct xe_tile *tile = gt_to_tile(gt);
 	int err;
 
 	err = uc_fw_request(uc_fw, &fw);
@@ -649,7 +647,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 		return 0;
 
 	err = uc_fw_copy(uc_fw, fw->data, fw->size,
-			 XE_BO_CREATE_VRAM_IF_DGFX(tile) | XE_BO_CREATE_GGTT_BIT);
+			 XE_BO_CREATE_SYSTEM_BIT | XE_BO_CREATE_GGTT_BIT);
 
 	uc_fw_release(fw);
 
-- 
2.42.1

