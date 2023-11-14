Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D2AC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 11:44:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29A910E203;
	Tue, 14 Nov 2023 11:44:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3FD710E203
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 11:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699962291; x=1731498291;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Z4uuP6d4FXjDgRfaHvKmBlIHRC5etkVtsWJKEeHHqNU=;
 b=YRf8zeWimD1NE5cHS1k32mPggBp550+BQYHNlN4peZ+lJYR98zNmEd2r
 XTwVVdUpO31JrN479XzfRv2+LbDycbAAB10UVlwBLtCqyGy7EOW/LtJeB
 LbfxGHVKaUBfilEDzFPgE7EHfLw+SaSnk0oM0Yj2ST9LG/zg3dFRGyy9e
 ec5FhxUaj7tuHM3S1EtROGVQpfM6m85ZAr5tywLunGVztDqfUlICuLOdc
 h77IAqh8+fAAjJvAwdhyItqAPL0QcVxNllNHu4upBheL7XhiwbqfxSIUb
 HGFZayt5Y020RVLQ6gz+RuSHjJcGVmWqfNi2lwwtpWf5xgoe5BilQK8i0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="389495424"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="389495424"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 03:44:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="12782133"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 03:44:51 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:44:50 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:44:50 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 03:44:50 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 03:44:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ddbxLhcJYjHs6TeZvNBdRMkp8k5jybKL2MxPLwzz+mPAAD7eq3Xo/0GJUDrPds7uehPhC4D5dVJBnxfwZ+40M2Be5Q5cEXf1zOUXVavE5593DDO7qYd9mCbxLBdtd2k55R3+w+R+eXz9iuPtnbSkpNATbgmxzk+n6Ru/bVoLoOpWz0nKJFhGUv+Zhw9kiwS9GwVQPNhIid3Mh1dWYbJRNZFiJAUe5ROuVIvKeXx1kiQkDdJ9tS/4VS+XARe2K+PzxvlxL82G/LN6u5YQAMVU2t2AP8U27iGjnRQsBUMWg4yUm9Zh7iSgkBf8mx8j4ndV6sjTzfYc/ojYQe/qNFafCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKTZo+POKLuHndLlFjBKUysGwNkYEEZ85zoSsuf7FF4=;
 b=jozbteIw3DoILi1WZqV0dlwpi6pv6qTFS3/d7jzbTRKA7mipNLFSm1e/5obJY7JeilUW6idPaQEXK2RGNuslCzamVSfnJfMmfZ2Atid6X54O0WltQ1U31gaw9prsATVLdCccXfw0+Xn3P09z3EvZ/Wra6pZgfR4LocSaGI2jMuogaKQVFSYeIk1FjDYRJ5BFo98ByifEO2/uaYKELzd5IK2dwVHXXmWM9G6TXwt3fz7xaZSbUEj0i9BedsSMtWq59mPKkJt/T08/ut+PazuDNqaElox8JDrcWO4hFEHZdwpCKeGNLsxAgvk9+03oq/6hbFVqjz0mTFxS/6degSB9jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 11:44:43 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 11:44:43 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 12:43:45 +0100
Message-ID: <20231114114405.2207747-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0034.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::7) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH3PR11MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: e80bc58d-c4ca-4077-51ed-08dbe50717b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y9Upq+G7bqh0W5J3YBkrEsAhvJPk8J2nDV00VT1A4VWg77DJ1OusJJBADZQHZkZaRimTItlQFvUc3jnBzd1le0R1iUxt7j/t2E1AtQgKpWqinlWBBQJCgZWWLNEAku83nBZ2KR2kukZZq5eIOB47pD9bce7jjIxycd7P1SyiTuKI7GVWr3ETRzKqxRoIEEn5gJyuqhAcXsbtgV5eU3HWsHqIDNxJhEZDOF4izZeUanlfggGIYwh4Yq5hOLdDet1W66e4BG5HeIe+2TNuNOZay0Zf4AZ/YEwRmPEk3VnYAW2A87OqUI4jxm3YiVDYuCYS5XSud4FrhMC1nq3evOAA6OLf5iZdFDpGV+t5J5z/yFAiLqM5/YSfU6lJKIEFiW5Ok/7OvC7z+z84tgKeJFQ3lYj3fdW1yNixP5a09n/2cSzbq0FwkeQtUI4yNPscSHCXwbRubbKuB7psWPW2F5PsLuUO0/POKxk24auuiWTdhoQsC6RwmH/8oipKn9nIZyEKQztt6cWBDCndrtuh6uwTUzJXiBsIEuUo2YtZnkPOwE84XsjYtuKfqa9/kZHzXLAo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(83380400001)(6506007)(38100700002)(2616005)(6512007)(86362001)(41300700001)(5660300002)(8936002)(8676002)(4326008)(36756003)(54906003)(66556008)(66476007)(66946007)(6916009)(2906002)(316002)(26005)(6486002)(1076003)(82960400001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEZGbVNXSWtCdENReksyK3BlMVdSb3cyL1JDZGJVSG0vb1piVmN4eDF2MXZt?=
 =?utf-8?B?bzBzWmNGY1hYcnhWY0tKREF3RFZBQzhLbGEwdjhmNEVSSFVJYllIdnlpeklT?=
 =?utf-8?B?bzlGNnN6MFd3QmlzazdwdEJLMGhPdEZjMHh3dGZYRTRMRFc4RjkrbzFjRlBi?=
 =?utf-8?B?ZUxWZXBZZjFlYktGYzkxOUlDcjFmNEtXYVFaTGR0TkdML1BZclUrTjdpek1U?=
 =?utf-8?B?b2loQW10QkF4SWo4Nm43NEcyU2cxTEJwdG4zTWI2QjZlMG5Jbys2UjYyUDZQ?=
 =?utf-8?B?K0VDbVExNDZISGx0M3hZeGhCZDk1aVg5Q0xXNFlzVk9SWDIwc09wZWRqd25h?=
 =?utf-8?B?b244bjNyQU80dFJYdEJpelFiSXJQL3l3eXo0d21QTG5tNzBGZUozMFhydFZS?=
 =?utf-8?B?Z2R5d3BTanVsakpHd2JRTHgzSVVOVGE3YXJRVjIzanE3TGk1STNIY0FXUStt?=
 =?utf-8?B?dmtMVUlQYXhhTWk4dDBqczdmcjE1bU5lbGxnaytuUllNZTRMdXA0N2srRlQv?=
 =?utf-8?B?TllwdFV4M1k3NlBHa1pONjE2dE1helA0Uk5HQlZmQ3Fscmd2cGZxMmtYYzlI?=
 =?utf-8?B?cHpXeEdPaVo1aVVNbmcwUFdZSzl3WVB2QWtKSHRwYnVWRk9yanJrLzBGMzBP?=
 =?utf-8?B?N21reFdGVUswMVdWZ09lcStRVHY4RzVYTzM5Qlg4N056ZTJmQ1ZnU3NQVGRq?=
 =?utf-8?B?VEdQVDYwRnFITlRZWVdLWlNGVGpJY2g0VGFVaTBnRWFkWTJvVjZQcmlCNEJH?=
 =?utf-8?B?NWJ3TjJvVXdJd2FMTkdkRDR3c200TnlNeFh0OXgwTURWWWVoU0N3UVd6UjYw?=
 =?utf-8?B?M3lNRFRTMmlYZFlhY3NPd3E4WHhpSkF1OGdCNHlKZ2lEUzU0R28rWllubUdv?=
 =?utf-8?B?eiswakdQNDFVQW5QTlJWWDFlSWIyZ3FYZW5UWUpuMG1nL2NhQk5ueEx3M05V?=
 =?utf-8?B?Z3ZCRGVkS3YvYXYrNU4vNjFhd0RaOElxb3hWTlpJMHNWZ3JDOW1XeFdHZ3Zs?=
 =?utf-8?B?YmlGTlYyd24yUjI4SUtuMlRGc09UVEw1VGdENEp5T1grQjBMcmNLUXErU3Vz?=
 =?utf-8?B?bmJkNERkdkhSTEJrbnBraVF5dTF5di9aalVVMjNNRzRYL2lOejMyUDg5enZ1?=
 =?utf-8?B?aC9NQTUwWlQwd1FyNXZyc2VtY1VPRVZuQWNtQ01ZL0RldHJldy8xR01TTFBN?=
 =?utf-8?B?a2NENEZJUUliQ1lQeS9qRWlrMTRLR05nNzdqZVNDYytDMXhPSWxwSGFETXdo?=
 =?utf-8?B?Y3BSckU2NUZ4NHg1bExCUnhYZzh3L1JWMFdMbC9ld3dXbkpBYWZldHNuWlFP?=
 =?utf-8?B?bVZCZmNkOFBNUEIybDIramg1cTFvdmVWRzVQNTVhM1hES1gyTHdMSENNWkdx?=
 =?utf-8?B?YU5ia09weVdmN2N0NkVGQXlabUtWT0J2RHdpRnZtUEppT0xpcTIrMnlHYUJE?=
 =?utf-8?B?dUR5b2tTaWRHKzdtaVluVWhnRFhjZ054ak1mNW5uVERDUE1relpZUGFVWHRE?=
 =?utf-8?B?cUJVZm5RN09ucnd6dDdkNThSdDhMWHBON1dMRmsvRjFsS0IvRHRGYWlCTFdM?=
 =?utf-8?B?WE0rcjc4Vi9rREFrN1Y0dGpBYkd3TmFvc2tHQ2hicUVWdlRleXRVNlBMQVpV?=
 =?utf-8?B?dC9YWHBpa3ZZRzFVTm1BbnY2K0NDQkZ3MlhESlNjR0Jmd29YaHJya1QvNFhX?=
 =?utf-8?B?cUNDdWE3YWFOTDJDV1hhTGk0YkxZYVpydzlVbmpWYy9JUGVkL2RxdXkwb0dj?=
 =?utf-8?B?TENpSmw0RTlMeEtrUE1CL2FVaktaMlFpOVdZOUkvTldka0twNTZlR1hhY1RJ?=
 =?utf-8?B?dWZNbVZrTzhUN0lwTUM4QzA3SXhrTHJzTG4yRy9YSlBBZmlUSXMzVHo1NTI4?=
 =?utf-8?B?Ky9Nbi8yUHhkWDhUMmR1cEZJaWNsanp2cEUyZ3RFdlpVVUhhcWY3Z25lcGhj?=
 =?utf-8?B?WEE5d1U1RTNhTEJtRFpnTjE2QXdGQUU2MUgwOUZtbFczcnQ5TE42c3BGNnhn?=
 =?utf-8?B?c2w0SXZaSmd3TmROcjF5VkJUMnlQcWxwWkYwcHhvazZlbmdaS0pJWThDM09z?=
 =?utf-8?B?TXZ4VjVtUmd1aElyTTJRTWFjT21NWk9FMDFRY2kwRUd1ZzBtQ3NHeWZLaTNS?=
 =?utf-8?B?WXgwVWRqcTFPNjllMHhxTDZ1K3c5NWdqK2ZUbFh6UENKMXhhU2txdm5OY21t?=
 =?utf-8?B?bkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e80bc58d-c4ca-4077-51ed-08dbe50717b9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 11:44:42.9998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mmlOT+k+1H/PtXhcwc3usB+qPFCX6jmIFRkioRiwzeO5EbjBXIKwKgOLtCs5PZw3UDaEjcn3qohURUys0egiN5liPaSfWMlxzltJhbWWUDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8707
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 00/20] drm/xe: Probe tweaks and reordering
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

