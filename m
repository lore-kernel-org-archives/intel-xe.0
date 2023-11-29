Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCCEC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:35:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2017C10E699;
	Wed, 29 Nov 2023 22:35:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25D710E699
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 22:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701297331; x=1732833331;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=LYjShdVVv7SdBkLsRL3VRXAJgDDRyR54tb+sVyw5QS4=;
 b=XxbMbQVu6mOYiW1e+SjmXhaBg+gfnKIZc48cley19a8xUUycuKHR1zd/
 Xebhth+Y/Sq+8XnFEMEIZ2iFhaKse3wW3TSkgi9AKj26fhCiKLP+O4xo1
 PBvPE/gKQkpcNBaWCYPXPHD4H/UZmW2366GeJSZ5ZQS+NH8Ze22Oyc0rF
 q/uOPEROlfXBa2DZFRKYV8ZZNqfeiYYdvmhNhOUM+mgDIKT5ILxJYkmwx
 aPXC9mjaEGViQQSN+yRf51XqpHCELpNy3Oku0ZSTLE5NB2Q4weCP+zIJ+
 HcGXWKMDZUOx35Nafn4xriwNihhFLHnPqjKqx3uHs32tOpTiNhuUqtVGO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="373420075"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="373420075"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:35:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="718891776"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="718891776"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:35:30 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:35:30 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:35:29 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:35:29 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:35:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y2t7/i/OB0e/OF0dtVGNeTK6OWga/bUjFvNsUZMPaO1pQhHWA+4IpE6JAm+/8rZKhDRo4kT/8Nt9CmQZre+RZuoU/c32wxsL4DYNLg79VOzUmiaDZDrxOj9FgpntU+WAnb5Is8neQ4yqHHrdIkl/cMNRplHKNflssNUr0dipnaXH2I8YHFG12m2E3Y3iW8HDkVNTtSJkPuCtHp+gnIR7NLP98jW6Ls5M7gUcl+5QbLVVXbotwthOjPyCpBy3oP43miNKc9uu8Q/RPIcxgPCUiOZXLkPakkIyurv6BfnKy4O3+XmtLEWaJeHLI0PUesWcD5D4QD/weUjsXT8vEdTh3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2T11up4uYKkV3yisBBTj/4RthDagQiPkgxoN8vEhp8o=;
 b=OZIPTRVJGUInQbOgQUrwyddy7HNW0ZRji8165psq96qOiHOeSaoSo4yTLQCZj6BKe9N9Qwf3Jak+wrox2Nk3pwUzWrnm8ltvXnbMZIQFosgtasLiQdjx/csSsFkQqsMXDnmlcCSx68JRbQxayvuZDKN8RXsKwNuAERzVL1MGMHL2BB+BKeFurmHsw6N1HJ0aHBHRYZJdQQsXnRt278eILZh3J2fIUT6tqS0wCqssM9io3MEo5kx27GYuzpoRaOyn46kBkn6TYvCOtkbTfzWEqUvc7z7vd3m72DBRhGfVIXklha15lP+uNzMQB+v+qWabJ8j83nv7t8/SVm3MoWLi8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 LV3PR11MB8728.namprd11.prod.outlook.com (2603:10b6:408:218::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Wed, 29 Nov
 2023 22:35:27 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:35:27 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 23:34:45 +0100
Message-ID: <20231129223508.1189461-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0037.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::17) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|LV3PR11MB8728:EE_
X-MS-Office365-Filtering-Correlation-Id: e9236dea-a69a-456f-e30c-08dbf12b7c62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qwXQA2IcwMHJtTzs4dTnLiwtLCDAEGjMF5H8DtUYj9QhlFMesa77ZuNRX1ZwWvofdLS4APzWv2Djdm+1otyRKQNDQd3ZA2I29r8/0RcoQ0VG/lc04ZNatsEPvCHopED/0nAy3Vc6TUU/vK0VTq7HZpQN8EGhPgGh7ZvCrSjbrvsSrSa2OFJiJXe0uDn5acJ6VMuSq5hNaHeiaJdjnercIvflw2zIzRIzCh3edZCXpKjOp6+FFNU0+SpaqY1MmbDS+J26/3R2JHcNN7+RxpbcxFKIBJBWaY2mCBUUn3VAwd+lHBjLfhZpsPdI/ISwD/7f+jHOQap3QNwyQaIDLOoYtdex3pU0bAFwQF6egngvmY7mDQqLtrCszvXsNHIqn8E61e+BHtKX6yjW9B3zmr9/VU4zZDU5dkFM6IVY4uI7wKTqLU3/0QpjoW+7u/rye5UTnktQ4WGH3iaWxAM91ygLn0ylJ8CnVgPyc9O59EO4Hm0bbypl/CfWc2BsqP7gOsoLop7nLkrZBmBKxyAs6oup9W5KjFieYw3mJ6cv99PXU8BbahQ/FL0fIfF7SN/zxjai4F1e8YPfW3xBDSrbfcVKL9ESIFOer5ymm/suKlQQHPMWN0fOeZciHWpt21lL/BLW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(346002)(366004)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(66556008)(66946007)(316002)(66476007)(6486002)(54906003)(6916009)(6506007)(478600001)(6512007)(82960400001)(83380400001)(36756003)(86362001)(38100700002)(2616005)(4326008)(8676002)(1076003)(8936002)(5660300002)(6666004)(41300700001)(202311291699003)(2906002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1RoUkp1UFVCZ0N6RmFDTFh5YkgrS0pqd1ZwRXRMYzg4NUJENnhscUF3blk5?=
 =?utf-8?B?VXdESUZsOW5IdzN2WCtKT3o2VzBZYlhjYWswMkRiRElibmxXUzRBaHV0cUpn?=
 =?utf-8?B?eGlmRDc5T3NvK1VDZ0s0dmR6Y0NUVXBPNThSQWYzck9DK21VSEtRbDYzMWRY?=
 =?utf-8?B?RS9kMXJndXZxUzhGQWtIRm1SRk12WlI0dm5sRHlydm4wMTVLWWNaYVltcXpw?=
 =?utf-8?B?WHI5anBSa1dzMmpyTGFuRDFaL3JESG9CQmRnUWJDSi96Y2huL2Y1NDB4ZDZh?=
 =?utf-8?B?UUE2Wjd6YUtRajNaR3ZFVDVPMGZZaUlublRMMzVPYWZ3eDZDVERrOFZtbm55?=
 =?utf-8?B?ekEycVRJRjk1MW1BR25rNVYrYjN6bm94RU00VzVTeGEzWnJmZnhzcCtWUFJp?=
 =?utf-8?B?ck1wcElaeTFDVEJucFZabldGODhiVjdySjNmcmpNOEFickV0bW5xZUJ2Q3Vm?=
 =?utf-8?B?TWI0NzR3d1BtanU1WENMQ1BQdnIvWGxsVVYxQWxzMFhKaGZ4UzkvOFMyTFVx?=
 =?utf-8?B?NzFFSStrK2JjYVljYjh3QTVQVEY4ZndEVUt2YkFYendVTlhGMzZyR2NPR0F2?=
 =?utf-8?B?MHNVRDZVZk9qVkY4c2ZIWTBoNW8wVjUvM3VibjBsMjFha3JHZUhPVVFnTjAr?=
 =?utf-8?B?S3pMcHYvMDFnMXQ5OUFFVE9ZYzgwRVVGRktPWXBxdEJoZ2xLcGZvTWkvZTkv?=
 =?utf-8?B?WDdtZlZRT1ZSTjBFeHoyRWFFTFp6dVhuaUFPWE95UGJFUUx5TjFodHQwL2Zx?=
 =?utf-8?B?blBya25zUVRpcFpHaU1nMVprWk13cnRiYVI2WjMyQ2p5NmhUcmZjemEwbGZs?=
 =?utf-8?B?TTNXbE9lMEZYVGpwVUZJUm4xWTNXbk9RKytCNHROVjQyTjViLzBJN0RNMFNl?=
 =?utf-8?B?djFseTBwNEJwaFg4akFqUkVsblM4Wk83UTMwVHlBemdNT0NLU09FOFJLMUlK?=
 =?utf-8?B?ekthZUcwdnVYcGl1UmhoNFZWZ0tEbExEemwwd2xiV00rVkxPOWFDK3Ayd3Vl?=
 =?utf-8?B?Y0JEMUN4SmliZUxMNFVQU3hGNjIvM1hhQnFuZXRrWUhlN0FtZDd4Zm1Ed09m?=
 =?utf-8?B?M0tGTnU1U044YU51dFJIbzFkSlhkTjNLaG9JT1U4dXpDT1o4Uk9QNzNHMTh5?=
 =?utf-8?B?SGxsOWRmY3dEK1ljMjF6N0JtU2E0QlkvdXZ1OW5kbE45YWxDaGI5RnlNY1NZ?=
 =?utf-8?B?UkVRR3lreXU1M05UdEgvaERuclJpQzA2cFQzbGFiYU5RejZkcyt5SmVnZ1ZB?=
 =?utf-8?B?cHp0Nm1yU3NDV3M0WEtwL3JXditBV25xeFAxbTR3ajhBM0JhU2hvYk5GaC9S?=
 =?utf-8?B?QzVkaDkzU0VISzZIb0xmMFgrdUpXMnRXRTlvcmJWZGptdTVhRjdXNjBDdmZL?=
 =?utf-8?B?Y1lXOFVtRlF6WjhnakJZb2h5cDBYQ1NIK3dKSTNPenpsb2RadnpnWmhlUzRR?=
 =?utf-8?B?ZlVlWXM1RE9kSzNNNE9HWWQ5TUxGbWtMTUs3bTZSaVJZT3dMdCtrYmpvTmVl?=
 =?utf-8?B?TTNRdS9ac0YyYXNQZGppRVBCMWFJaE82VGRFUnYxQ3ZaRjRhOERJZEhyZ3FW?=
 =?utf-8?B?QVZRTkdjTW9pMER5SWNuVVMreDdBY0hmYkh6b01XVTRYR1Q2alJraCtiYXgx?=
 =?utf-8?B?WWVsUkhQUUh5MVlBT1J0YTdaZGMyOENkbmFxVFZ5UWRISFV1SjZVT0hROG03?=
 =?utf-8?B?aVNTMzlpUGFwb1JETlhjZlNjREw3WlZYa3poeURGVllxYm1ITGl1eG41L1Nu?=
 =?utf-8?B?L2YvODVZK01xcTBEcXl5bC8zNnR1OUlOMzAxWHVJRmlXR2s1cnN2Vjl1SHUz?=
 =?utf-8?B?YUptOVJNVkkvMzZHblJFQ0Fnb2p2K3BPYkEwcHVOVE5pT21waW5ENTB6NDVk?=
 =?utf-8?B?SldjUThvV3RYMWc5WWhaWURJeXFuQktPVy9YcGxZSjVHNVIvRm54VUVJSVpJ?=
 =?utf-8?B?d3BIQXR2RVdzUkdGREk3UUNLMkRFUnY1NThITUIrQU95b054MVZhYTI1Rmd0?=
 =?utf-8?B?eE1FK2laR0FhY1lxeTBLWWlzRkdvb0g5K0lOaEZuRnJGOWFsS3FGSjBGcmRh?=
 =?utf-8?B?UmtzbzI2clFEL3BuOWx3VHh0Y2FIa1N5MVBSbzN0aVVOZkgzWlBWbUd4Tzkz?=
 =?utf-8?B?WVpCZkVMVGdPQXFIaUREWFZZMHhvY1IrdTkrM3p6bGREU1dEQzRwRmhVMnJv?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9236dea-a69a-456f-e30c-08dbf12b7c62
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:35:27.8316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZQ1kdNwKSSKh23gD/IvGp3yt759aR65IgskG/fmPpyJtiPx5L/bz7ETGYsVZUomZhjat6UdRY8db+OjBMudDSNmb5IN/rikvLmn3WCI9Dkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8728
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v5 00/23] drm/xe: Probe tweaks and reordering
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
- Assert that realloc transitions from RAM to VRAM to make sure
  iosys_map API is used correctly (Lucas)
- Fix GuC resource realloc by introducing drmm_release_action
- Convert xe_guc_pc_fini to act as drm-managed release function
- Introduce xe_gt_init_hwconfig (Matt Brost)
- Init PAT before loading GuC

v4 -> v5:
- Rebase to resolve conflicts when applying the series (CI)
- Add kerneldoc + kunit to DRM managed changes
- Check for error in managed create from data (Michał Wajdeczko)
- Move the comment (+ engine mask assignment) about using engine mask
  from hwconfig blob into xe_gt_init_hwconfig() (Brian Welty)

Michał Winiarski (23):
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
  drm/tests: managed: Add a simple test for drmm_managed_release
  drm/xe/guc: Allocate GuC data structures in system memory for initial
    load
  drm/xe/guc: Move GuC power control init to "post-hwconfig"
  drm/xe: Initialize GuC earlier during probe

 drivers/gpu/drm/drm_managed.c            |  39 +++++++
 drivers/gpu/drm/tests/drm_managed_test.c |  65 +++++++++---
 drivers/gpu/drm/xe/tests/xe_pci.c        |   1 +
 drivers/gpu/drm/xe/xe_bo.c               |  41 +++++++
 drivers/gpu/drm/xe/xe_bo.h               |   5 +
 drivers/gpu/drm/xe/xe_device.c           |  76 ++++++++++---
 drivers/gpu/drm/xe/xe_device.h           |   5 +
 drivers/gpu/drm/xe/xe_ggtt.c             |  26 +++--
 drivers/gpu/drm/xe/xe_ggtt.h             |   2 +-
 drivers/gpu/drm/xe/xe_gt.c               |  66 ++++++++----
 drivers/gpu/drm/xe/xe_gt.h               |   1 +
 drivers/gpu/drm/xe/xe_guc.c              |  84 +++++++++++++--
 drivers/gpu/drm/xe/xe_guc_ads.c          |  20 +---
 drivers/gpu/drm/xe/xe_guc_ct.c           |   8 +-
 drivers/gpu/drm/xe/xe_guc_hwconfig.c     |  18 +---
 drivers/gpu/drm/xe/xe_guc_log.c          |  19 +---
 drivers/gpu/drm/xe/xe_guc_pc.c           |  25 +++--
 drivers/gpu/drm/xe/xe_guc_pc.h           |   1 -
 drivers/gpu/drm/xe/xe_hw_engine.c        |   8 +-
 drivers/gpu/drm/xe/xe_irq.c              |   5 +-
 drivers/gpu/drm/xe/xe_mmio.c             |  58 +++-------
 drivers/gpu/drm/xe/xe_mmio.h             |   2 +
 drivers/gpu/drm/xe/xe_pci.c              | 129 ++++++++++++++---------
 drivers/gpu/drm/xe/xe_tile.c             |  36 ++++++-
 drivers/gpu/drm/xe/xe_tile.h             |   2 +-
 drivers/gpu/drm/xe/xe_uc.c               |  23 ++--
 drivers/gpu/drm/xe/xe_uc.h               |   2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c            |  81 ++++++++++----
 include/drm/drm_managed.h                |   4 +
 29 files changed, 582 insertions(+), 270 deletions(-)

-- 
2.43.0

