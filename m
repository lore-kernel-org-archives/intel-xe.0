Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA44C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 00:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BDF10E301;
	Wed,  8 Nov 2023 00:34:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A76110E301
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 00:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699403646; x=1730939646;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=zBY+XBH91dKOMvY6o7sdBkZIoBdNKXmpS5S0KDn2Eyc=;
 b=CoCzNRvPpz44bsrhlDcDP2YiIIB+bc3orM7RWORAEBHlQMC20Whjul0g
 91Lq1MgV+06vqeJCv34Z63PP1ngCrmrUYK7lao69XpGZqWK87vZyytheB
 39/SzUZA0rqWquBvbZYXMpirK34DL9D3DICVAVtl6RmR4GZ+1TUCd9117
 GVvR1321wDZ9UeZUdMrUMAdgeXbXWv4sYLgWNmvwMsSayHgklSUDHsceq
 iKbrdbiBw3kV1kdKFaqUvk2V/gPzXnc/sibx2oQnlM+lvDETEDL1AOeAz
 eqb1sH1b6Zrcbk+/A1sHvRqQK7W6LQRMzmbVtUhmX55K4kuwam8mDNou2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="475886050"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="475886050"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 16:34:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="880018879"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="880018879"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 16:34:05 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:04 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 16:34:04 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8xTpyhV2lRNywi6MKIwhKc9/8c1D0izE6jKN8AA/l6V1WKVXYpVunuTj+qgAVguKcL9I349QCBW9WQOo/Cc5a7MERxpVHG8V5ZLaBss83yguF8GuHmX92onX9LcCD/LzbN4ODIPY5YW4tqHbDnGQJ2BGw7xylWMmv1wRU1P0nQ3k6GkbPYX0TgWkhZyAAUU7euTHn/JOwiiEU9ikuSgd/tKEwHthkjim0paWSl2bLU7UuZ3Sk20ZatJj5cBdCzrX34undyE8yo/TBhFzlv50EzyYBvzZenLnl4O6oCjCUYjuGG+AHlKTnctwN7KsSEzGD9JjqfxK9jqw3k4UDFN4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPMpBYSG2a7KGFkkY9hLZwdQKxgo9lerDAKZhiwAC3A=;
 b=kNMXt+ofOZRMnIKOyftrTOJIO/ExUjaOVtjIwrkNwj2n6E4G5Dk2e/nrOpZhpa7C4aTMHRF0HG+D6pqQUUf4TpEpuKqWAaIj/7H7NJP/5e0/MDsvNJk5gRKXcm69kGU4RzHhGKzG5ujIK+MEFuG89hX3sQJHNZeB/qDcHdQLKaGgzH5pS1MtK/MF4BGhiQpyl5vV+A8rMFkmV/vpjd0gxKZxSL5UptmK7q3QVK60/U7r3GEt9LwloCiPtPZa76sBDG+dDF7OPsYjSsdI7OxmcDHwlrrVwmDQnC57Ac8x5W5mQyqf0KWy6Qgw/y1/PrJdxJj+XJ5ALob99ybC6djhyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB6802.namprd11.prod.outlook.com (2603:10b6:510:1ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 00:34:02 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb%4]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 00:34:02 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 8 Nov 2023 01:33:32 +0100
Message-ID: <20231108003344.1169016-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::16) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: 563f1dc4-37f0-411e-fd4e-08dbdff267c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dXFKZgxU/81zAGaxPhl0NQBdDGBOsPphXL/hrNVN2XlUjAKtY0P5UTWffcjqbk0xfoPYqQkFgXRUml17dpwUKGUw8QLb6fkJ4uHx6FMjq/QMkG3KjV42stgQdesBou+MyNTsGA3Cf/KjeAnXsTq2FRzYd4UhjnsM8Xa0HIkHfYJlqnJl30Fv8xC0xAhRGfewuGgWPZl+bvKPpYcN6J44IYRMRPdwBsrsHe8ITrdQjjkhW537Cg+Fx9mLTyE16h/WkH4lbjGCVz/CyZu3/MGPis3zML6H5Wp7TAXinkTnYhMzOvQ8bh/iEx/NXVZvFHxAcwZo1ybWOzf/2xgA8uBtd5qWmiRw/rgl+bGYohkJjsnx0y06oIQtQF9ivqmlkU+af+HOOXk79tWa2nYfC0CmQuc4eqDIUCt90baTK9RigiM9IPuwi2pFLPE2AM/ZYhnLstLJDRPqrem2bwLOEgUZRY9hosGj8e9BHV882v7L5cAZ8nnSHvpNlW4sciuNJrOzoqgYlPLzh/EEmBo+GZbM3I1MVra3bIL0cppANkCC28H7uSOGYWl7o3se/djJQm6z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(39860400002)(346002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6916009)(6666004)(8676002)(8936002)(4326008)(82960400001)(2616005)(6506007)(6512007)(5660300002)(41300700001)(107886003)(6486002)(1076003)(2906002)(83380400001)(26005)(478600001)(66476007)(38100700002)(66556008)(316002)(66946007)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHY3ZXplMXF3TGJhT3U5dkhMR205WGZmKzRyeGtpTk1VMjhiNzRMZ0xPMkZn?=
 =?utf-8?B?WTVzdTlTU25HeWZiQ2NTL1NmbUhuWVVmbXNVMWZlcnRKNkt5cnBqaUJjS1BD?=
 =?utf-8?B?UG1MMGNocElXMW9vMmJkaXArUys3Tm9UdDNyUkd4OGlSSldwdVFKY0RDdGl3?=
 =?utf-8?B?bXdRYTgzUGVpNVk2dFdNa1JUZWM5bHpXb011M1didWJLcE5jLzVWWkZXSlg3?=
 =?utf-8?B?N0hqSkxKZzZTRzVPRXd1RlJ5NzI3L2hXaU1yOW1RVEo3ZEhPdkdYZ3lRL1Ew?=
 =?utf-8?B?Ty9pZCtSeVhZd2dhc3BMblBDa0pnZHBSNlh2U3dWam45TkpQbnFpUzJoYTVI?=
 =?utf-8?B?dXB1WmtIYXZ4eTlJbWx3RzVkK1BiZW9MMU1PeFNLVU5DTW1XRHJtSU9vdWY2?=
 =?utf-8?B?bnlTYXZBYmdKeWZjbFl3WWNZV0lNQlNpVEpzZmNSVC8zWlhZMit5a0pkejlM?=
 =?utf-8?B?RGRQYjBHTHUybVZ3T3lnaHJlWkx4aEZVd25BT083MWxaang1TUFNUktYeFNB?=
 =?utf-8?B?MlZTbklVak1RUHRtZ3dudXJPWDVnTmRaTG00UEJhRU9hNndTSVNVdEllNjR5?=
 =?utf-8?B?ZzE5TzJmdHowdWk3QllRY2E4U0I4Y3RjeFNjMUFMeWthUHRyRU56MjI2cktY?=
 =?utf-8?B?NTBMaVdGUTZubkRaSFQ4UXAycmJlcUY5ZzhBTHNuMEtwamFKVXI4RTJMOTZ2?=
 =?utf-8?B?eENtNm55MzNIcGp2RXRmK21oVTZ4Y1VPSVJIWWtOUUdIbnJDQ1R6aS8rTitx?=
 =?utf-8?B?YnAyUUJ1d0Rld0RGcjBvMy9Wa0N6ZkZEV3o1RThmbWd6TzY5LzNsV1Y0Znh4?=
 =?utf-8?B?WGIyNVZORVVrd2JpSXJoamswQjJkWTZaUGhGdEd2aCtYQllDSVpIbnlZVmV4?=
 =?utf-8?B?cXlmc1B1aFVIWGRnNEN3clU1cE9TRFFJSHdZWFMzVTV3Um5NOGRkN3YwcHVD?=
 =?utf-8?B?V3A0czVMWStlT3ZEUzRudjl1RnZ5SXZKSDQySUdiQkU1TS8xQ0pvRlNadm55?=
 =?utf-8?B?MVJBMlNXQ0l1M0F6dG1MUys1WU50Z1BsSFNuWk56emJ1SXBDMVIyT05STTQ3?=
 =?utf-8?B?ejZHd05RUzdBMUdmSGZ4ZTdlaU9WMUlxNVFkZGV6SklEa0xXdlVTUjJIdGNZ?=
 =?utf-8?B?QWg1T1RraFVVR2kwZFF2TXF0cnp5MUJBWTBZMm51Z3dCTHBEaDBHb3J4MzEy?=
 =?utf-8?B?Ymxoc1FEWUgvaGxrRWUyQnlCWFFDN096OHc5M01vOVNPSHBFTjdsdU1nS0t4?=
 =?utf-8?B?RHozdW5GL1REQWxzSk5tU0JhWExWWmhKZmd6dTRXOC92K2E5UGphSzZWN3VE?=
 =?utf-8?B?YUJyS1Q1VGtjTHpQRDlxcGhkVUlJMCtkOHhtZkwxcmZ2cWd6N3d2VUF1eksw?=
 =?utf-8?B?TlhDZHZTMENPbUxEVUlud0t1STFiUUNzaWFLMEd3RXBVOENQaUdHRFlPTHc5?=
 =?utf-8?B?dElVRWZhUDlFKzVndnd3QURSaEdROFhkRG9jWStGUG5IOFUrNGZyeks0UzRX?=
 =?utf-8?B?Ty9yeGZwR0VUL2l0MkJ5Y240eWZ6cVByNFBPS2sxS3Y5MGllaCtzYkxUaFBs?=
 =?utf-8?B?SURMVzhOdlFkLzJrbUxBdkZlNks3VG5qREoxRmxQUnp2Q3JKdGRnaXBMZlI3?=
 =?utf-8?B?NFFaN0RzbGd6bTlBeFRhUGlJMzhvOXhOYlY0bmZZdWtROUt0RDdQZFpkaDU5?=
 =?utf-8?B?eU51RFVZZy9icVZ0OEdxeHV0TUs1Qkt4STJ1bEtPbDFSdWhXdmNaM1FZVkkx?=
 =?utf-8?B?Zm5KQzg5YnpqVE9NSGo5US9ZRjA2YkFMMzc2R1p2YmF0N3Z3RTVuNkpNZVYy?=
 =?utf-8?B?cndMR0daTXhoblJZVWI5alNxSE9sV0h5S2pMRDkySHpLRmZvWDFHZXNkVk5h?=
 =?utf-8?B?Smk5RFZQRjBoSXpSTUs3L1lYL1lZU3JsY0E3QUpEY2Y5SDFHVXFjMkZkN1lX?=
 =?utf-8?B?WUt2cERiUlN6ODVveFFGNUNOMi94a2g2Wlc4eWxBcnM0Rk5OWFFxRjFZTjBP?=
 =?utf-8?B?bnQ4Y1A4TnJwd2twN25jbTQxc2FMNnZ5RzFLMVAzSldLdnJ3VmNIUUJZSE9B?=
 =?utf-8?B?cEx5NUdFTmZIc1ZoZEM5Z1YveFo3amk3emxieVFQdmV0R0lrUis1eHRtSUJS?=
 =?utf-8?B?Z2pPRG1WNEdtRWl1NkpqSVllbFBNMlRmTGFodWwxb1QrMDgrYlpKMUVzOGZo?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 563f1dc4-37f0-411e-fd4e-08dbdff267c4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 00:34:02.0992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+NSLtCTU/sUbvs3o/XwGaFIyD02kb1G7feevDibrdI1g2k7ovCLyIwnB0qjDvfVaYRdLX1RMG8CWUxxs8wN55xSk4v7l6kvC6GyXJqBzn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6802
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 00/12] drm/xe: Probe tweaks and reordering (part
 1)
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

When Xe is loaded on SR-IOV VF, it won't be able to get most of the
information about the hardware directly from registers (it's necessary
to communicate with GuC in order to get the data, as VF doesn't have the
same level of MMIO surface as native device).
In order to keep the probe relatively uniform between native and VF
mode, it's necessary to slightly reorder the current driver init.

The series starts with generic tweaks (dead code removal and devres
usage), followed by initial reordering focused around MMIO init and info
init.

GGTT / GuC reordering, which moves the initial "hwconfig" GuC load to
earlier point in probe will be sent as a follow-up series.

Michał Winiarski (12):
  drm/xe: Remove shutdown
  drm/xe: Skip calling drm_dev_put on probe error
  drm/xe: Use managed pci_enable_device
  drm/xe/irq: Don't call pci_free_irq_vectors
  drm/xe/mmio: Move memory training check to probe vram
  drm/xe: Move xe_set_dma_info outside of MMIO setup
  drm/xe: Move xe_mmio_probe_tiles outside of MMIO setup
  drm/xe: Split xe_info_init
  drm/xe: Introduce xe_tile_init_early and use at earlier point in probe
  drm/xe: Map the entire BAR0 and hold onto the initial mapping
  drm/xe/device: Introduce xe_device_probe_early
  drm/xe: Don't "peek" into GMD_ID

 drivers/gpu/drm/xe/regs/xe_gt_regs.h |   1 +
 drivers/gpu/drm/xe/tests/xe_pci.c    |   1 +
 drivers/gpu/drm/xe/xe_device.c       |  65 +++++++++-----
 drivers/gpu/drm/xe/xe_device.h       |   6 +-
 drivers/gpu/drm/xe/xe_irq.c          |   5 +-
 drivers/gpu/drm/xe/xe_mmio.c         |  83 ++++++-----------
 drivers/gpu/drm/xe/xe_mmio.h         |   2 +
 drivers/gpu/drm/xe/xe_pci.c          | 128 ++++++++++++++-------------
 drivers/gpu/drm/xe/xe_tile.c         |  19 ++++
 drivers/gpu/drm/xe/xe_tile.h         |   1 +
 10 files changed, 166 insertions(+), 145 deletions(-)

-- 
2.42.0

