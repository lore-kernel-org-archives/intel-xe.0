Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11F8C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:03:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE6910E444;
	Tue, 14 Nov 2023 13:03:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2EA10E214
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699966983; x=1731502983;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=rlmQFJAGuMtVg5+d2kPDRsAHBOB9USuPh9ebD++UniI=;
 b=MLz0HzcbUTqu/YjbwUP0RvUC19c4aAG11m8HXelB+cykayLY7gbT9XTD
 Z3UiEWOpGe6DCJdLlP3/ay1XdKDhK80pxxoQSI4r97iCa8+Fj7ns2Px1p
 fqVQDYvDmR+8uG7ssBNBQLLv2OQ6fq4h7OKrcrnY81zXI6q0xIhZEZX8w
 nGxLPSqr4ijSctCIY4fCOnX18JE+nSUMn2/5X/GeucGN5Qo/AWMVTLHA0
 0rdcKWFLWv5hL/7ELUKmOzIYyfsSU+M/S2pNU59qvWS678AJ/m0lIcqG7
 mivuco87lTduezydp29e0IFXEO/oDqmI7ijbOSLQhJGwU+KJWcHbPIUHz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="369993006"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="369993006"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:02:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="758168045"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="758168045"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 05:02:42 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:02:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 05:02:42 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 05:02:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPAOVGiXFo6U0heQdZ1yq/TF5m0tivigM1UPU7tKMpLjmmW8Wn2NraodPwQvxOd+YV/YyJQiD3Nu/CEUKRNqnXUoJ3OpssjFVW4vqM2EhsZkR2TUIjo/g09zC+PwzUYA74CahAdcXQLoIAq4ZxYglTkfiHgmDk6CAzIVjW03BYT+1xbfMhBJhgK05P3ukstFf0MiyLjjEBUDXRTqywGu7o1rdzoOAmef2+J2a9S92pSmzoMv2Z8QdaiSKftl0y1OXM9z7L/9w6mYZF5osJOYPAmKjsKjEsklhcxCvhTIlSLwbDJRo+xBNuTM0xclxSssv8ayynEB4BIItKfosfbv8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GrJnd6je0cyJyQOexfdFBIZ0i2kpq4cW29aAwNon2Do=;
 b=aLGsRAWWdtbXBs9rsVHYW3eCnnDvhwvQMCYqJpK6p5ie+cFc3y85BLfDHZ4d+1y19TcGeILPUc3c2DrqSUe70B9m3jt2qSFe7loWvRFZyFBh/ZxM/9Ys3R90WDF0kJmNYjMMl7V+4YrGVzf6IuCkB059egFX76e18ec2UiB22JcBwI8S6isxjUdwv4ok+qQxEdAISLi4E8Q3QoCAokdaK52lPFgpiNxfMDoIfon4GCqmpr1aCcoEk6+zaYQ3lNicd6JXrXTkvOEqooFaPVuHWzuucENCoBEfW+whqakw3Fo4A/ZV/d4EKFYqLISVVLl5j0i2VT7nUvMY6+XRB8fqlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA1PR11MB7040.namprd11.prod.outlook.com (2603:10b6:806:2b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Tue, 14 Nov
 2023 13:02:38 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 13:02:37 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 14:02:11 +0100
Message-ID: <20231114130231.2299661-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::7) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA1PR11MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: 8de2aeee-69d3-4601-20c2-08dbe511f9fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /gUkIalAfMbbT7aYUzzZ2k1xT6QG2Nhyr9Ontlrj/21Jsh4MN3PMEWoofugVBIkihsfMBamnmYD+arMrZCvZssYQKOcZSV0cmvAX2jZLxfzr3CLFos4uobBqD3AK+DsaNjW+og2oLFswKBmwS6fSUU/vcHaeiSCP6cnnAVaOmHAkz9vITZJQ8yAv9I1CGxlPYv7Nv02XpPeBa5/7aiZloxMlJwccPlsJqBfWDgbVo50Yhz9S7sWoGNeFUnn7hgklvtdehaBJGsh/AyoE2/XvRTi64mxM5oqT4zXAPoZILqkDy0SGHV1stwK4SNqLy3iJ/+hSe8PyqnroyehIQ0kaeH62TpT1pjIqfZFDl1YV/PJ8b3lHO0cIz9WjaWOI2in0SYe6/8JegpmUvmr9nzI3WUff9fgFVwEgQgkFKNnVOun1MsAaM6v3ZB0bc5WNFRJAFIDm+lZCBs/mMkbq0PHsXCQ06bqWMx6zZSo6s9HEJruGnpyPW3EaL+uPXT9SyYI5KsWmJmYBrQmzgmCKgX3UaAZpdvMZynWDwAXZ2mJDfYUA40Nje2xHsfXjIwby4w9B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(366004)(136003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(66476007)(54906003)(66946007)(6916009)(66556008)(86362001)(36756003)(82960400001)(38100700002)(6512007)(83380400001)(26005)(6506007)(6666004)(1076003)(2616005)(2906002)(478600001)(41300700001)(6486002)(316002)(8676002)(4326008)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M21DOHB2SVE0MU1udjhuTnR6bWZ6YTM5WGNvRmdodGVIdWUvTkpTR1F6QzAw?=
 =?utf-8?B?cUNqZURFaUNoMmF6S2UzRTVpTSs2c1NQbTRqRENwU1FxREZCTW9wZlBDOUtL?=
 =?utf-8?B?SnFSK2VNRm4walcxd0VLK1hWVm0vUHlsSVZEczVkMXNMZE9PTFdwRXNxZFRU?=
 =?utf-8?B?blYrS1p1eHBNSXhWNUttdXJZYWdmSHlnRmxFYXltNEhCZEFPdm9hdUQ3Vldz?=
 =?utf-8?B?bUFUQWY1MG9KTlczdjR6S3ZPWkJTUHBlRCtiWjhRSThKNFdrZHRWSmwrbG9B?=
 =?utf-8?B?MEJQcU9mcXhzeFFHWDJYbzhSdGZpN1V3bDAyQjBrMlQybTlNTWxGUEVRemlm?=
 =?utf-8?B?OEdqazY2Qm9ESVA3WUI4UTBCMnB6ZFp2dDNZYzhobm1mZngrODdWUlE2Mmxr?=
 =?utf-8?B?V2RMb3JkUm8xSms5enJpcTFtYXhxd1o3VTMrNVY2TGxPS3lTRXF2bXZKY0Jy?=
 =?utf-8?B?bi8zaVd0VXRGYTFNTTExOTVmSDdPTWgwVEx2dCs1OEM2RE1YbEpvZUJkNGhE?=
 =?utf-8?B?SytzNk1za01vRjZIcUcrRUhodzlNWkZCandxdE05aHA3YVdjdVY0TFVJcUd0?=
 =?utf-8?B?NVpNTTNHT3lid3JCQ0lHeGRyK1l0cmp3SjRKQW5mVW5kUTIrbThvU2JCRnll?=
 =?utf-8?B?eWc5Slgyc1JwcVh1cmhWSmlCaG5mbU1lLzhoZStEMUJzTDl0V05MczlDMy9u?=
 =?utf-8?B?a1ZpTHRnaU5iZmJYVHJHUXM4a0s3TjR5L2FGQzZtSjNuemtxV1ArVGZzcXUv?=
 =?utf-8?B?ZEEzam80OWhNNnNHcERBQ2czT2xTV09JYmZQc1lwOFVGQ0xEZnJHTnNtdzI2?=
 =?utf-8?B?YUFUSUtIdnRRTGlkWERjMEk1QlM3QzJvVi96UldKL0huMmZuR2ozSFpVQ01u?=
 =?utf-8?B?eG9VVmF6SG41WlRDMFpnd1VOUEdpMi9GSjUvTFJ2SlVSYW1XR1BVM3lWWFFa?=
 =?utf-8?B?RmFQalRTRWxlNW1hYXpicW40dXRmOHlMN1lwZEtPeGs3bzdjTzBNYzdjWU5W?=
 =?utf-8?B?TFN3cFNCMUM4MHJaSVh1VVgxSlpQWFI5YmRFV29lcWFTRzliU2twUDA0Nktk?=
 =?utf-8?B?dXkxTmZJUGxPdDhxT0Q5ano3cElMRk5LVzF2OFhkUWJwQm05N3Z0TU1SOG43?=
 =?utf-8?B?c3ZYbHhYS085ZEFIa1pMdUZ3WUZpcUFPNlJLRzc3QnNERUIvUks2L2Z6Skhx?=
 =?utf-8?B?RElVbHpJeW1wbkdjRmpBVlNBSjduMURiOFcwMU9lRTc0WThPd2FPNURNeS84?=
 =?utf-8?B?aSs4UTN2d0xaZERTOFZrNUZ1ZVVMSkVkVXdSQnAzcjAyTGZha0lFSW1rTG9E?=
 =?utf-8?B?R3JDYUZiWXJrTk1aZERVS29QdG9sN2l1TlZnSG9Db3daZHRLeEh5aWprd0hG?=
 =?utf-8?B?L1FabmtCck0xb3V2T2xmU2ozdHFiM2hPbm1zZVNRNFFDVHl3KytkSnF0RmRZ?=
 =?utf-8?B?SmZmUitmSHpVUHVLbm53WGM5ZGR5STlBQy9acmt0UXhGWDRmbld6cDUrMFFV?=
 =?utf-8?B?M1FHY24xWFQwUFNpVGtLcnUvck5vNmJud01IazVDVlJhbXNOeExoY1NJaWNt?=
 =?utf-8?B?M1lMMFZFd0lKT3gzUmI5VVpxN2s0anp1cUkyaFppbm1HdVI0aktzVExjOXdQ?=
 =?utf-8?B?TXVFN0dJbnZQaCtuUzVuelh0ZHdaS1Y2SUxHOXRxbHZLRWxBekw1dFQrWmRR?=
 =?utf-8?B?alNvM2NhWHJxd2NwYkJzQ3BiWDFUeGVPNkVqY0w3elJrMm1aN0xpdTFSK2NB?=
 =?utf-8?B?Y0lseDNiNTY5ZllSbi9TUmMzcFhZUlQwckloRW80elZzMGRsSHpvUXRERDg4?=
 =?utf-8?B?QTRsUnFqeEs0a0xBM2QzVXhnWEkwNVdxZ29qeWVzOXM3ZlUzeHNzWHdnZU1Z?=
 =?utf-8?B?dy9UQmZQUjgwT0wwcTU2MUhobno3Yi9HeFBvdXhrdjdzUE5GMkYrNDVURDhF?=
 =?utf-8?B?TjZnOGR5Y0t3TTJYbk1HaVRlT1c0bFFlaHdBdUhkVGxmOXNZRk1NWkdaTkNE?=
 =?utf-8?B?aExHdXpmT05oNGRWcVh4dkVtZTM5VGFPNHRUVDdmUVR3MS9adDl2d2FmczBv?=
 =?utf-8?B?VWVqNk0yUm8wV2RJZ2ViQWZWYW1wQStJR2xRZXFqa1o0bEs2Y0NCakQzRDhB?=
 =?utf-8?B?VnVoZEMvVS9rTjh0Yml6Uk54U3BhUEl0MFFPeEwzTjFaVjM1bCtRdmh4RVA5?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de2aeee-69d3-4601-20c2-08dbe511f9fd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 13:02:37.5877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DL7xYdtWRDGzBi+QY++TGhFrOt1u4srJTt4iwZldIChZmcvuZpXPKvkYTs7VMfTrQX5md0l1whRX6y9Nh1l3fpH8Nkp4oT0RAm+bY+fUR2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7040
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 00/20] drm/xe: Probe tweaks and reordering
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

Michał Winiarski (20):
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
  drm/xe/uc: Split xe_uc_fw_init
  drm/xe/uc: Store firmware binary in system-memory backed BO
  drm/xe/uc: Extract xe_uc_sanitize_reset
  drm/xe/guc: Split GuC params used for "hwconfig" and "post-hwconfig"
  drm/xe/guc: Allocate GuC data structures in system memory for initial
    load
  drm/xe/guc: Move GuC power control init to "post-hwconfig"
  drm/xe: Initialize GuC earlier during probe

 drivers/gpu/drm/xe/regs/xe_gt_regs.h |   1 +
 drivers/gpu/drm/xe/tests/xe_pci.c    |   1 +
 drivers/gpu/drm/xe/xe_device.c       |  81 ++++++++++++++---
 drivers/gpu/drm/xe/xe_device.h       |   5 +
 drivers/gpu/drm/xe/xe_ggtt.c         |  20 +++-
 drivers/gpu/drm/xe/xe_ggtt.h         |   2 +-
 drivers/gpu/drm/xe/xe_gt.c           |  25 ++---
 drivers/gpu/drm/xe/xe_guc.c          | 107 +++++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_ads.c      |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c       |   2 +-
 drivers/gpu/drm/xe/xe_guc_log.c      |   2 +-
 drivers/gpu/drm/xe/xe_irq.c          |   5 +-
 drivers/gpu/drm/xe/xe_mmio.c         |  58 +++---------
 drivers/gpu/drm/xe/xe_mmio.h         |   2 +
 drivers/gpu/drm/xe/xe_pci.c          | 131 +++++++++++++++------------
 drivers/gpu/drm/xe/xe_tile.c         |  36 +++++++-
 drivers/gpu/drm/xe/xe_tile.h         |   2 +-
 drivers/gpu/drm/xe/xe_uc.c           |  49 +++++++---
 drivers/gpu/drm/xe/xe_uc.h           |   2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c        |  80 ++++++++++++----
 20 files changed, 420 insertions(+), 193 deletions(-)

-- 
2.42.1

