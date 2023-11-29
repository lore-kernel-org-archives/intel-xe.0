Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD37C07E98
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:16:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A9010E5DA;
	Wed, 29 Nov 2023 01:16:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A94610E5D9
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 01:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701220605; x=1732756605;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Vc41GuYkqpQXYwx5ycFMiZ8zpYV6SjaTi5HZwuTDTiw=;
 b=OPw9QYqM107eQ4Zi7Kf9up1f+VZ16s1pb3tD0tCQXNJf5xSXv8DkSwXP
 oZY2P7RM+vSuFm7PtC1tQiSPhDlBy0sxEr3YBAdXiOiYsXu4tGh1+03Ee
 qJCZT6Pqz+Ds7AruHXGTe9CGM/t1My6dOE0+gbGTi0eDckO7enYbvzqEj
 m/zvl3mpKyiC/KHsUOAt9TIz6sjwzFGO4eZc1CwiXmotLMLHJfCJE+EjZ
 xklJpuen2epJHyUf2odQ9PywX/iFlynriAgshEtjEvtowRVh8Ypjz4TlC
 ccAmvzm/yvQfxcfZtvugKVPok2ZKOiARmPIspVC/pIKyVbD59v/BRsyHt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372436518"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="372436518"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:16:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="892272425"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="892272425"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 17:16:41 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:16:41 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 17:16:41 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 17:16:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTazh/aLYqxgDY4xglTXE3l2OCH0VwqqX7oSMt6T1YMILRxU9G02bxZWLIpuu2FqE7Z+ISVJhpsfWXKkJHyuCdfxd65yJxfO0Ih/CGj0Nszue2keSw7QKThGpMmE0Cbqs5ey3Hmfy7Q9raqGrMVLhb27kABjwmVWPy/a+pWnU3Mk1gm/6EyICEFP7ys1wUyndWMqlpC/CFcZPO67lI+QFSViZ80Ut2Q02vbLizEoZaWJjw/PRMXkqDSXfuBaNCp4G3q7ryLP/ZqvA9AzyiEJnobBl2fufGlGQH+AEKyfZvrsGbJ/NvgUNYIvUPfnOOsC8kYTvW7CP9YpmpdpwHe5xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUZfFFKYI0y9Emkzilv7YwH4PyK2lBRFF16oFVFrHZ0=;
 b=YOGZy/wnR5+VCrhRlxZFwQyyxK6mwP4QzxYNr4W63UU8njdCJmAT3ro5jo+6nrDTTTdZfWUDVfrNsj4jydicj/C0FuSBuGWjMYmDS6V4diBncruFa9VE6mxhAqtZbA725iXx9mo47mXlrasA2y1uWTN1LsZVpLFeaEcZN+qZiFi7P4FGwjmKQokQls8ICHoifEnGydq2Bjm8ZQCsxYi7aybnwNUgsDIyDSEdTGqgN5/Y1EpPGsyuZJfg7he4LboYNbvjPlgJroA3ynOzyxzgL8VHt8Z0pykew8J5dUWg4jvT4FQ7k/fSQrj18M2EmVCdZaGsKkkV/Ds3bHviWXXBSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ1PR11MB6298.namprd11.prod.outlook.com (2603:10b6:a03:457::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Wed, 29 Nov
 2023 01:16:33 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 01:16:33 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 02:16:02 +0100
Message-ID: <20231129011624.836843-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0095.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::36) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ1PR11MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: 04de860f-0770-45ff-6148-08dbf078d325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vVko5M4XA2t9Anu0cULK+fg6Jl5hLb8bj/2AK3Za+POiicIVwGyOSnKnkK2fsAPQrobJ8hXKk/MJtQqnnsraYPv0qL9TjpUlBQca6+ABvXo9M4oOc794iUiXRZTlDgcHZbRlvuHoLQoanoGkB1vo0/KeO7KZCea7Buapay6gPiy1Jd7HdDJnCZV8mz5f3oznk37WcVkdadqfMEeG7SDYDzPuKc3e7duFB4p3byNthY2CZrTX1pV21QKU93qSo8MCFJi/KSy0PX5hfRvEPBlGYTWBs65VBq7Cyu8NNEa43ZBN3ZURpiRi3v8yAXbP7OTbPc7uLrnVP6InDEXfxVl4Ty4UvId0bMpA5CLfSM5uyH5R4FfhpJr3rMvQbjJ0lftS0V5hb5Wd/fcO/k3jZemomFlz4QkSvLGn+XWvThBfFchZpbpL8Dw+F4GOOj3750QpUI8ZmMkhWw7iHsH6gp/BwQAFuQW3LZ87y3L0xPIQSro202wf4KJKgZY+QqubY6mi3wxnG89JqmwT6cQAu/SMRv4fhHwUFI6tFN3fwTZP9AHTfIl+uvgNDMV3l7/m9Fy1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(376002)(39860400002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38100700002)(41300700001)(36756003)(86362001)(1076003)(5660300002)(83380400001)(82960400001)(26005)(2616005)(2906002)(6512007)(6506007)(6666004)(8676002)(8936002)(4326008)(478600001)(6486002)(54906003)(316002)(66476007)(66556008)(66946007)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFFMSE1wQjB1M2x5anhrQ0ordVUrTXFocVFqbjZxSkM5SDZpN083SjZIU09a?=
 =?utf-8?B?QXIxMit3c0wwUDFoQWhoR3ZwVGVwWFpGd3R3c2VxQUVqRGhWTGZBY2lPa3Y3?=
 =?utf-8?B?SzY4WUFzUEZOQkFnUEluTUZNNnhFdHFnbDhHYUxmemxOT2luM0dYMDVLVHc0?=
 =?utf-8?B?UkpDNGZZR0ptUFEyQWF5c2hqS3FCb3VOdVE0U1RYWThrQ2pmbDkwSmQyYWJZ?=
 =?utf-8?B?cmQ3bEs0MHZlS1g1U0hoa01mcnNtNnFUcnRic29XYzVhTDdFdDRpUUZjbCtm?=
 =?utf-8?B?aVFKTk84UjFKbEtiUVk3Vnh5ZnZ4ZE9MM0VFZ2dBNVpNTEpmRDVOOUNXczNa?=
 =?utf-8?B?MmprYTQ3RXp1dGtvaVBSQjB5YWcyOGR3d1RaK3JFcnFOaWh4TlNGaGU1Skh5?=
 =?utf-8?B?NzV6WHBiT2VuaFF4RStyNWZycnhic2x0aTVSYUpqYjc1UEdFL2diZ041dGFO?=
 =?utf-8?B?aC9rSjZrQ1dlcm0zL3FCSEV1NUxCY0lUMmVBUW9XV0ZqM2diTmc3RjJSa0Qy?=
 =?utf-8?B?Z21vR2VsSG0vcE1kSFRVb2s1d0sydVVtY2YxbDBha3hrQm9BZWdoa0NUT3Bq?=
 =?utf-8?B?Yi9nMCs2alI4STBUcktkTHo5NkZSZC8zTkVFbGR4aTY3NkJ2TXMxdDFSdzFH?=
 =?utf-8?B?Zlk5NExydHhSdnNZcnBhbUdDWlRScDV0NEJZTmRVUkYxVE56QjlmK25YZktr?=
 =?utf-8?B?UnNSaFpDb3dvN1lWMWhqaWVYbVBPaWZpWDR5VlFuTlAwTHlyY20rYzExN1Nr?=
 =?utf-8?B?MUxWVWs1L2FPREQ5TkY0RUlTTVo0WGRId0RmZmR4WFVwSzVPNzNZOTNYZFZ5?=
 =?utf-8?B?TmIwQVFBaUJBNnF6eVUxTGdFQVlSdXl0d0pJN2U5RHg1RU9zRVdhQm13b1Jy?=
 =?utf-8?B?a2hJSzZBK2F2TXdETFQwb0JQdXpUODVWb3dSYjZNMDhJQWxMeUNPWVZOaGto?=
 =?utf-8?B?YTU0WGg3RTFpYTcxTzBYUXNjdDBTT0xVWE11RXZjd0NPcHZ0ZDNCbWs0Wm4r?=
 =?utf-8?B?N0dZRmQzZFZlL2h0bG8rRm5FV2xFemJLa1AvZk9vcnNUV0EzUjYyOXhoVkxF?=
 =?utf-8?B?TG91SmUwNGtaaGJBbGNwakVORm04R1lPd0Z1ZTgrelQ0eXlMUmg0QzBzMEN2?=
 =?utf-8?B?SjYrZ25CeFh0NmFzSUM3enBXUXZhQ2VvTXAydHNBM0pwbjFuSEczc1E2Zkov?=
 =?utf-8?B?eTBnT1o3MGt5a2g4ZnRBZGFwcXdVaFExYmJkMmVkRXZZV3NCZ0ozbWJaMHpP?=
 =?utf-8?B?R2o2SzRiQnQyMVRqaTg5M216T3FUTHdLUCtqVjRqdjNEUStXYmtNbk1kL05H?=
 =?utf-8?B?Z3lsQUNjbGRUT2ZNKzZtRkxnaWlIZlc3WmN5YVZKOXBCUGxxNUNDVmlERmJx?=
 =?utf-8?B?Lyt5QTZ6UDlwV1BaQ1FDTWlpVytkc1VVbHFIU0crWUk3VksySlJJRWdta01G?=
 =?utf-8?B?NWhCVjdqUzcvR0dBS2c4dVdYRkQvYzNZV010cnU0RFUzUVQrR2ZpZ1JOdE43?=
 =?utf-8?B?ZkFIUk9uN2FkczdiNkpZM25hcndCTzZqVXBoV3UrQmI4eXFUQkpxRHE4alZH?=
 =?utf-8?B?cHdLbkRMS0xQdGZySmo5NmhMZEdkeVJYZTJHeWcxUDBZaEVtc2dBVmdmNTFs?=
 =?utf-8?B?VUZNcG0xZElnSE5MaWcwYlYyMFdjekRvaWNWR3pZNFdDUGs3bWpkcXRCNU9C?=
 =?utf-8?B?MFZKWTBSR0JSdVVPd0dIdUZkYUdOaGlteDlXS1RwdDF3TVk5eTVmRldBcWZp?=
 =?utf-8?B?dURCZUkwalV1dkpWQTJVN1JtQ0VSVnNLbkhJYU4xZ1VsWS9NY0VUbWEzeEhl?=
 =?utf-8?B?bEdMWS9DL2pUUlcrbDdqZmZSMWgwbXFUMnRDaXdGNU94dWNmd0N4b3BYYlZt?=
 =?utf-8?B?Rml6akFiWlRCRGNYNzZzYkhwMXVEemxvNGZCM0VXaDdqZTEzMmh4Rk9wcEho?=
 =?utf-8?B?bjZpcGhXL2RFRVlMZXNOallwOHh0N1h5b1RxTEM2LzVCdGhYeUtZa1ZSZVJy?=
 =?utf-8?B?WVpLS29vUTB2M0lTQ1BaMlVGdWJpQ0JMU1AwV2lxVEZma25MMXpkV3Q4ckc0?=
 =?utf-8?B?WDgvajljZncrRmQ4K2liNTVFTnR1ZDV2NzQ0eTZIcTFKMVgxVzFDK2UyUG5C?=
 =?utf-8?B?N2tET3QrcVp2b3ViWDF1MExMRVNhRTBta3NYTkpDN1hpTXVHV2NVUTNaeXZF?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04de860f-0770-45ff-6148-08dbf078d325
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 01:16:33.3184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 63+WyYGvIgbm/M7jVryiGzmNFc1YxgZxnL8YWFBZbr+5Ph3tZh6k5sxrjBNKhzJHgDuk++5jKW63yvnmC5SRN9SwRzU0zj+vL46zJ6UxaV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6298
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 00/22] drm/xe: Probe tweaks and reordering
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

When Xe is loaded on SR-IOV VF, it won't be able to get most of the
information about the hardware directly from registers (it's necessary
to communicate with GuC in order to get the data, as VF doesn't have the
same level of MMIO surface as native device).
In order to keep the probe relatively uniform between native and VF
mode, it's necessary to slightly reorder the current driver init.

The series starts with generic tweaks (dead code removal and devres
usage), followed by initial reordering focused around MMIO init and info
init, followed by GGTT / GuC reordering.

v1 -> v2:
- Add GGTT / GuC reordering
- Don't reorder VRAM init check, as the value also hints at pcode status
  (Matt Roper)
- Add comments to "early" functions introduced as part of the series
  (Lucas)
- Move xe_info_init_early usage in kunit to correct patch (Matt Brost)
- Drop "shutdown" dead code removal
- Make "xe_tile_alloc" static

v2 -> v3:
- Fix warn with W=1 - xe_pci_clear_master should be static (CI)

v3 -> v4:
- Drop explicit call to pci_clear_master (Matt Roper)
- Don't define MEDIA_GMD_ID (Matt Roper)
- Keep the "peek_gmdid" for KUnit (Lucas)
- Assert that realloc transisions from RAM to VRAM to make sure
  iosys_map API is used correctly (Lucas)
- Fix GuC resource realloc by introducing drmm_release_action
- Convert xe_guc_pc_fini to act as drm-managed release function
- Introduce xe_gt_init_hwconfig (Matt Brost)
- Init PAT before loading GuC

Michał Winiarski (22):
  drm/xe: Skip calling drm_dev_put on probe error
  drm/xe: Use managed pci_enable_device
  drm/xe/irq: Don't call pci_free_irq_vectors
  drm/xe: Move xe_set_dma_info outside of MMIO setup
  drm/xe: Move xe_mmio_probe_tiles outside of MMIO setup
  drm/xe: Split xe_info_init
  drm/xe: Introduce xe_tile_init_early and use at earlier point in probe
  drm/xe: Map the entire BAR0 and hold onto the initial mapping
  drm/xe/device: Introduce xe_device_probe_early
  drm/xe: Don't "peek" into GMD_ID
  drm/xe: Move system memory management init to earlier point in probe
  drm/xe: Move force_wake init to earlier point in probe
  drm/xe: Reorder GGTT init to earlier point in probe
  drm/xe: Add a helper for DRM device-lifetime BO create
  drm/xe/uc: Split xe_uc_fw_init
  drm/xe/uc: Store firmware binary in system-memory backed BO
  drm/xe/uc: Extract xe_uc_sanitize_reset
  drm/xe/guc: Split GuC params used for "hwconfig" and "post-hwconfig"
  drm/managed: Add drmm_release_action
  drm/xe/guc: Allocate GuC data structures in system memory for initial
    load
  drm/xe/guc: Move GuC power control init to "post-hwconfig"
  drm/xe: Initialize GuC earlier during probe

 drivers/gpu/drm/drm_managed.c        |  28 ++++++
 drivers/gpu/drm/xe/tests/xe_pci.c    |   1 +
 drivers/gpu/drm/xe/xe_bo.c           |  38 ++++++++
 drivers/gpu/drm/xe/xe_bo.h           |   5 ++
 drivers/gpu/drm/xe/xe_device.c       |  76 +++++++++++++---
 drivers/gpu/drm/xe/xe_device.h       |   5 ++
 drivers/gpu/drm/xe/xe_ggtt.c         |  26 ++++--
 drivers/gpu/drm/xe/xe_ggtt.h         |   2 +-
 drivers/gpu/drm/xe/xe_gt.c           |  60 ++++++++-----
 drivers/gpu/drm/xe/xe_gt.h           |   1 +
 drivers/gpu/drm/xe/xe_guc.c          |  84 +++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_ads.c      |  20 +----
 drivers/gpu/drm/xe/xe_guc_ct.c       |   8 +-
 drivers/gpu/drm/xe/xe_guc_hwconfig.c |  18 +---
 drivers/gpu/drm/xe/xe_guc_log.c      |  19 +---
 drivers/gpu/drm/xe/xe_guc_pc.c       |  26 ++++--
 drivers/gpu/drm/xe/xe_guc_pc.h       |   1 -
 drivers/gpu/drm/xe/xe_hw_engine.c    |   8 +-
 drivers/gpu/drm/xe/xe_irq.c          |   5 +-
 drivers/gpu/drm/xe/xe_mmio.c         |  58 ++++--------
 drivers/gpu/drm/xe/xe_mmio.h         |   2 +
 drivers/gpu/drm/xe/xe_pci.c          | 129 ++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_tile.c         |  36 ++++++--
 drivers/gpu/drm/xe/xe_tile.h         |   2 +-
 drivers/gpu/drm/xe/xe_uc.c           |  25 ++++--
 drivers/gpu/drm/xe/xe_uc.h           |   2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c        |  81 ++++++++++++-----
 include/drm/drm_managed.h            |   4 +
 28 files changed, 518 insertions(+), 252 deletions(-)

-- 
2.43.0

