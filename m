Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669E0C05027
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:24:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304AE10E09C;
	Fri,  3 Feb 2023 20:24:20 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439BC10E09C
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455858; x=1706991858;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=U7TbX11VMOb506aB8rhY91cwpoAqPAx8pvEvu1MFGs4=;
 b=XNpW7bwfD15JlssfeH1wyd01vQ9/jn8qfsaP1aAONBByF1U5ApQNvfO7
 t3MYBBRrhs5GtkM+/S8hry2E3beTWFs2sKIpEXlMJXAGlCGAkXLxxBPIL
 nZ2ik0StVSCwXPzSRlwZj/B9ZDNwz/RjFoQKFfGxG95CwUIjIFxp8x3ae
 jrUYHq8VR3AFjcLp3CGMyfPGWtjND9EyjQK6TSxOMmJ5jWH5orKFvMTN4
 S4/am8p/0psM1T9CCtxYG2STtgspXS535FaesweTJDFWxC7YaS6ZgCh7f
 3XHwrLjrDWiIlzgJG5UZpJZsY7JWSdipoNeGuNeJTo1sNf4rOR46FGPcx A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="312502974"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="312502974"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:24:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="754594576"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="754594576"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Feb 2023 12:24:16 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:15 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:24:15 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsQNyXn9kfNEpxkshPWB3mrN8w2JRF0m5O+RawA3inFBp0G9/2q6ONOBLZ7+yM8SaWvQ6mKbJYLZ1iCPUXCsqvV5Oogz6B8MQCx6lQ7i3LI7aaNpHVDxkakJOEHpXIrzG9Eenb0z9od4kxQxZpIylrkltIEXqnu+vYnqRJm/So5DZzsoEcU/ljdHg6Vjif3p7CdbY1uY1bv15Xn02vjBZi2k8RT5raZjUhfNtU6mL6gNMBGYnX8BS0Xbrgq5QRLFhbar28iMFV1++YSJdNWVS73K1QFY3A9uU+4rwvQvqzfOdH+KJhKBldDwZAtsofmW9t+g542t4EqITxLx+ykMJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSTags3BRPqwvY2fgFZumz+h6nhjKwI2rXGVkQBYjVM=;
 b=BMwZfdM1C2HbKt2KoFyXwvEmdxzYYO7XazpXRi3Ahl4GEwz0gekOR31FbzlOCDMmY1WjyqJEPnT7yzLLyfFOz8groWBhOknIqbZpdy9c9hzUGi2bKKTdy6/puq1IMLcAojbBfLLzFfET0qFscAfye1iNCm3TDT8F2/5ynBt1+qCORV9/p09/Mlt+QY66JFQxUlmczYXKWPuTKvqoryxkr2nYWGO2tAXSgOhb2P/ZjRnpdy1kqnZ5ycIzGGC9AHnRT/j6A3lVDTS5KJgoGCI4e/UdmSy/LZFsinFlfnIToCPFxqLgBEIvDuD97HyWe7WND/gW9R+AmL3GmBx4LIqqoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB5817.namprd11.prod.outlook.com (2603:10b6:510:13a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Fri, 3 Feb
 2023 20:24:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:24:13 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:23:47 -0500
Message-ID: <20230203202409.577032-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c4c6dd6-e76d-47ac-d542-08db06249d75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a9hC0jswhMLQ5LJpmtCthiBm1PqphKTyH/hEQNBFuQ2STB2/n8Dt7DgcF7lutGVjyBXuuArPZjhV9rGHxax7m91Ro4vPfWyMViGLFgR8m6Sa9gSGLpxnyHJR+Lb7wofcmseMNprtEea6dwMwe3Udck8kxs23m0QHtnfUjZsGfaBgiD8h/LHJjMIYTVFkKa8MPZvW55F/FDJ395acAOJJjfTYNocytFL9KtxLuOos41+uMYHZ9yUW4APsUyMNUFei4lobddnseXDh5k3He7kK3y6WUyx9trrajr3NiEXblmG8LZIgD7yRaLAxOZAK22sAhZ0dOQcV94A45Djju0U8bSZ5BQGWlTgxUn/q+JAtuX0D9Xy1zMUewWeAEDA2tSPXVdgXdKQGCkBDk0v4zg44D+SIbzGCg7kCzx1d96qwMNc+lzUuHzLf2eRV/l2pqbDkYdObreqcWad5fOWSIO3COVnGJ5jD593u3fVQtY5Oahid657HjTzHuFcjCLTveazsHrpO/4ibiiMUwIgqhNQviZuZI4xD57PwNUQMlID7e4X7z1oc7/2NvkuzODY7gNV3bOFhV5tJHwL68R3qCx1xzpd+yRYzrrqcwSLB4VYmvLhpvHfCxqDxT+IsJFh2S75D1z3qmGm72LTuVBRtsKawUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199018)(6666004)(316002)(4326008)(36756003)(6916009)(66556008)(8936002)(66476007)(8676002)(5660300002)(82960400001)(66946007)(38100700002)(86362001)(107886003)(26005)(186003)(1076003)(6512007)(41300700001)(6506007)(2906002)(44832011)(478600001)(2616005)(83380400001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K20xb3FFZ05EcWxYZDE0QzNlbTVVYWFGeHVqQmthOGNFU2lqRkhjTmFCY1Qz?=
 =?utf-8?B?QjNTOG1JbnlBbFNFK3Y2cWxseW9Wd0RZQXJVL0FzcGtwOG95M1czeXdwaG14?=
 =?utf-8?B?dHZTV093NmtrMTlhNmdDTThwbFZtaHg4TEwybFFXZFZ2M3dTZ05MV3JNMVQ4?=
 =?utf-8?B?UVRDU2xPQVJsRVlmeWhpdkxPTEE3SHJYS3RCK09xQzVsdVVkTXA0OE1wZlhY?=
 =?utf-8?B?VTdCc0FseGpSaE94d0ZzLy9CakVTMGZUemVBRDBzbnFTalFWQUIvcW9ZNkIz?=
 =?utf-8?B?MzFVSGEyd0dsWE14RU1lVHFHbC8wb1hJTHEvcS8rSWlodldUWmk5UmdJWDhP?=
 =?utf-8?B?ZXI4cEdIVVF1NVdobGFBd3Q1cmRCV3ZEdmF6WEtwdGVuZ3BLVkdRMFdmVmdN?=
 =?utf-8?B?ekJKVlc1WTZGVUNXSkZUOTVzZUx4YzlxcDFmanlzcjZXeWUva3MxeUR2eXhC?=
 =?utf-8?B?clA2WE9UZjQzMWpzdWQ2MUhkcE01NlB4Y1F4M2Jrd3lhcnR2QlZ0MHJuL0Ez?=
 =?utf-8?B?eG83MWs3bGZ5dEpMK1AxZm9nQnRCRzZUQzhPcy91NDlNSmhrdmc2Um5LWDZ3?=
 =?utf-8?B?cEViSDZldy9yanJNUmc4bXEwTjBPRm55UVQxWEx6RGloWFgxK0hRTThsUVJa?=
 =?utf-8?B?Y0JwN3ljTTd0YVZLSE5WTlN2aHNHbnFubzlEaGJpbUtYSjRRcjh2UXd0b0dj?=
 =?utf-8?B?Q2RvUEpvWGcrQkNISlNHTHhla1pjM3ExYWZJM25KME95bGM2TDlIdzVPb2ty?=
 =?utf-8?B?LzJrSDk2dXN4SzJxOHU2L29tdVFhTThhQkx2TVNHaEY5SzRsRXBEc2RqMzJB?=
 =?utf-8?B?cXZObG92dFdOOGRDeWQyaklGeFBwbzAvdVQwdTV3Vmh0NEt2cE5oYkdGWk1h?=
 =?utf-8?B?bm1vNHFGc3h6QlNib3dFdDJOWGpOV21jbUdlOVF2SlhJRDh1UXRmQ216UDVh?=
 =?utf-8?B?TFp1SGZRM0tPc0R0M2ZLZUFZTWhGU25sMEk3VjJUUkpnd01CaUZ5VFgrTCtL?=
 =?utf-8?B?RnJaNWRVNjhmdkVtaG1GRDRqb0UwY1N3S25RL3RaSU9HOTNVeXZ0NTRCOFgw?=
 =?utf-8?B?R0xhQVdTN0xIdHBoekFGblNMRG1IMmNicVFlUmZDb25kNUpYdXZiVi9Bc1Jy?=
 =?utf-8?B?M3EzcFNEU1hFMGxOQlJkQTd2c1lOdTVOSFUzSll0NE1NeTlweUJOSDdWK2FU?=
 =?utf-8?B?MWpYajlWWXVidEpxeXZSdHZaTVRrVnlXZ1haY0RWbExEMmNCUDlGNEQ5L1Bj?=
 =?utf-8?B?NTFJUXlTVXdyMnQ3ZjRYVUpPZW9VRWVmSVZ2UjRHT21LaXVRdG9IWmZqeDkz?=
 =?utf-8?B?Q0g1YWpvR2huYjJaZUxSUVNHT0JSRmJlcDl4MkFWaEhhZjVFOGdSZ3ZFNlBp?=
 =?utf-8?B?OXhKbE9lZElQc0pRMmg5WG8rL1cxYS9OZ1o2TFNGVnBtazZQM09TQ1A1NmVN?=
 =?utf-8?B?NXUvZ0VIQVBoSk5Wd2NUbjJpL2xwZlVoTUJYWFY0TmF2NlNNM3JBTGFpSHEz?=
 =?utf-8?B?VW1nelJCWUZ3RUFyN0RST01XRFBzSkZpU0prdmlGbXRpWmZnUnB0RWlHN1Zs?=
 =?utf-8?B?Q0NoWUpnSmljNUVuT1J0cFpXMHdnTUtUZWNCMWJId3B0VUNFOFUwMlBObld1?=
 =?utf-8?B?OUYreUdsOHluZFk4T2VjVndQSEZmcmxkQitWRUFrT3lGK1hsQnJNeDJEaUhW?=
 =?utf-8?B?UWZMNm52UGJOSFpkTjZpNndhYnZDTTY3YmRUdTFmZVhjUVJUTUVoOXNzdUNR?=
 =?utf-8?B?VG9UeHVSUlYybUZzb1dkbWpSaFhYQUZCMll4Rk5oNjQ0bnRFOWUvMkEvZnNS?=
 =?utf-8?B?QzR3ZWQ5RGdZL0s3TXF5VDRMSzBpV2pzZy80YlRLQzRFSEo5UHdvQklscDMy?=
 =?utf-8?B?aEZLSHBEbzk1UzV1OElyWkpkZE1pY2lWMStldFRpdWQ3eDlkakpXUlNBRTdu?=
 =?utf-8?B?dFNaMXNQVTBDZlUxTGloeVVTbktsN2xlYkdXYlZHMm1vaElrN2xzT2g4djlG?=
 =?utf-8?B?Q0ozQzlEbSs2azlXcnZpYmREUkJTL0pPdHJ6dWwzRlpLc1hoSmxLZm1HQ3d6?=
 =?utf-8?B?VFl6ay9MN3orVktVM05Ma1B4NGxNNmh2RHlZUDJOdFlqOTZ6MmRUYlhVNDF3?=
 =?utf-8?B?VTdKQW9lSWsvd2s5VU13WFQ3cjI2enNZa2ZoWGVMbkpmc3JKRmJob053eDI3?=
 =?utf-8?B?RkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4c6dd6-e76d-47ac-d542-08db06249d75
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:24:13.6203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GRIKANUaSudfm6dBQWqU6TGFbDzCQSlEssdgkDgTGP9bhRZCjbtONYvxxuwaIZFgj4qorfIqiAUTTO250xCz8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5817
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 00/22] TLB Invalidation
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
Cc: niranjana.vishwanathapura@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Let's just confirm the reviews on this patch and get them
merged to drm-xe-next.

Matthew Brost (22):
  drm/xe: Don't process TLB invalidation done in CT fast-path
  drm/xe: Break of TLB invalidation into its own file
  drm/xe: Move TLB invalidation variable to own sub-structure in GT
  drm/xe: Add TLB invalidation fence
  drm/xe: Invalidate TLB after unbind is complete
  drm/xe: Kernel doc GT TLB invalidations
  drm/xe: Add TLB invalidation fence ftrace
  drm/xe: Fix build for CONFIG_DRM_XE_DEBUG
  drm/xe: Add TDR for invalidation fence timeout cleanup
  drm/xe: Only set VM->asid for platforms that support a ASID
  drm/xe: Delete debugfs entry to issue TLB invalidation
  drm/xe: Add has_range_tlb_invalidation device attribute
  drm/xe: Add range based TLB invalidations
  drm/xe: Propagate error from bind operations to async fence
  drm/xe: Use GuC to do GGTT invalidations for the GuC firmware
  drm/xe: Coalesce GGTT invalidations
  drm/xe: Lock GGTT on when restoring kernel BOs
  drm/xe: Propagate VM unbind error to invalidation fence
  drm/xe: Signal invalidation fence immediately if CT send fails
  drm/xe: Add has_asid to device info
  drm/xe: Add TLB invalidation fence after rebinds issued from execs
  drm/xe: Drop TLB invalidation from ring operations

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_bo_evict.c              |   5 +-
 drivers/gpu/drm/xe/xe_device.c                |  14 +
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_ggtt.c                  |  23 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h            |   2 +
 drivers/gpu/drm/xe/xe_gt.c                    |  19 +
 drivers/gpu/drm/xe/xe_gt.h                    |   1 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c            |  21 --
 drivers/gpu/drm/xe/xe_gt_pagefault.c          | 104 +-----
 drivers/gpu/drm/xe/xe_gt_pagefault.h          |   3 -
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 342 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  26 ++
 .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  28 ++
 drivers/gpu/drm/xe/xe_gt_types.h              |  41 ++-
 drivers/gpu/drm/xe/xe_guc.c                   |   2 +
 drivers/gpu/drm/xe/xe_guc_ct.c                |  10 +-
 drivers/gpu/drm/xe/xe_guc_types.h             |   2 +
 drivers/gpu/drm/xe/xe_lrc.c                   |   4 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   7 +
 drivers/gpu/drm/xe/xe_pt.c                    | 130 +++++++
 drivers/gpu/drm/xe/xe_ring_ops.c              |  40 +-
 drivers/gpu/drm/xe/xe_trace.h                 |  55 +++
 drivers/gpu/drm/xe/xe_uc.c                    |   9 +-
 drivers/gpu/drm/xe/xe_uc.h                    |   1 +
 drivers/gpu/drm/xe/xe_vm.c                    |  42 ++-
 26 files changed, 736 insertions(+), 200 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h

-- 
2.39.1

