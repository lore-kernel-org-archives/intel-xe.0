Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D43C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:46:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88B910E9D6;
	Fri,  8 Dec 2023 06:46:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC4110E9D1
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702018009; x=1733554009; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=4aoJwKQkH3WaTpITdh8ufQtikpl0z3Bec0F78Vq0ojM=;
 b=e4Jrx9BW2AUI7mUBo9ZZ1vU6EmYmC6I4XUakwQov1rqt4GdWX/Ou/L6Y
 5DsywC8dZNHtczGGJgBMO5JAjl8mwjICCuRBZ0ftvFUGKkXLxALRrkIA3
 hA/EO8kJqC5OvepdZg8877gZjFvWmPq5fmbW7RPIxf/UFggtf6MIRoGRo
 KY1yCEvq7J6DZJsssfYT0YeRG2qV+YLz3yFKbe7xFX+7b3cwLizS3Ldkt
 SVyWbJCp1DGSF+cYaNa3/bcjyvpkNIMAz4okrEQOMLgdmQgSjVTqpjOvu
 FV5sMbmS1Q1EVwxf8HX9qLcuzXOFuDwXaFJmpp6hCPsGEvQdG4TVK3g/C A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="393235509"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="393235509"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:46:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="721769444"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="721769444"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 22:46:48 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:46:48 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 22:46:48 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 22:46:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDQxi5j9pkSK0j6BgkSABe9sXRNVlwUSckkZn+un+ZPdjJdE7r9p1+GmOM7YSVWG3Xf9lm/3FQg3pIRhXCbGtLRrPRMBBEB8KtbCWUKX4I09UFLUbQi7rXC9nFIjtNria2b8xkJsgg2ytm+kH61d2jCQNoj+kdrVaCV562MeTvp3VmP8rPi3nH2UlkWqWE4dmUbFMBSzmPu/hi66qqaswkyexfuXLNp84wQL7XBmQF+zuG9joM9oaRyMGMnmZryAviFlNjD9y+Aw7rrRAjLQJE4TPylpKARLxk4KLjvBvbjAHKkrtceLu+IogN3YToqHVbfiP1eEWAXn5l8DdCD2wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F70NfDwaq5ZI6F/e97u/lCpPX3K8IL7FQRpGLnwZeOw=;
 b=B5xRb67Gp0fn8LA507ec73wLqL7MseSTqmk6pq2iUXpQ7eYhSDqaFt0qcy3rSVWODyu9sV2kT3PFpItD64n/HPTnXZEUacLPmWdHmG2Ow/iivfGyYk+8t8QsKicMNCPvyb8F4EL5CpjRFIHkrlBXPUWB1NIRho9g99AvUM+XVwTA7fz660f1LkdLxThAL658bH76zqKrWpw6QVmdcWid3yJdQ/CCKB/HvZw+lnfHCoRidIrKGvRKV4iT6yIQYMHf2J3+MQcN5XclAdgJOAso6MocCBjfyRlbND7Xhvhp13Z4T1JHFqheVNiu4EU0GGZl+yDX0rej6AkC7GByil77BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4831.namprd11.prod.outlook.com (2603:10b6:a03:2d2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 06:46:46 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 06:46:46 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 00/16] Adjust to GPUVM / fixup version
Date: Fri, 8 Dec 2023 01:46:27 -0500
Message-ID: <20231208064643.877688-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0041.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4831:EE_
X-MS-Office365-Filtering-Correlation-Id: 3820e319-09c3-40a9-2914-08dbf7b9721c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0AXB4N4uPV+j+igR3VMatBjcgn/mu7aeEbyMxy4pXvBhy3MjwqjdudRth3sYWNJVJ4GPxuiT8IZKZ+oKiaJWVewnBvPec+QoFWp6XrotRiLQoqrGc5Uk8soWudlGIKscG+juO/zYq0A8DRZdB3tbymdl9MiBr73R65ngk9ddDmHL0twbDdOs+bJ1lcuRWy66iqpP4TTafG0UfeYn1pzUXwz7DdzKObAO+BdHIunIH1/Wst6UW/vCZq9RsRMP5QHEU2A/vEtMeyRVize8z1fvDjciGFpOCBqFveOLLjP+BfbQllrryWCmCsJYGURS2qY66UpX4bV2KOMVVq4d+Z2wFA4jd701CYy2x3ZL46oYgQVMMhVDIpcXC9qyv8UcHwKEau0xxAssk3kEE+qMxLs2uUikSGoPg2Q3a4AWldEcHepcuFfj/JaliJ2CeuQVXQgHCp+KQG83Av7D6s3fr11UBPsyeD5w8/4fSOfU22DME8ctMo2tLOONotA9pr3gHiTX/Dl7eK9r/qiLy5iQOW2jE+WSnCRDJY6Om7/94UxyLV9tPVxb+tCBWGwQXyi7K9Q539DuhqmzspxKa9EvvwLvDWOoayjr5P2/A9cLoMdXMKjtwRPwtx7mYyUMWL5Qasi5FVoqB+RHojayFA2FP8pImg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(39860400002)(136003)(376002)(230922051799003)(230173577357003)(230273577357003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(2906002)(8936002)(8676002)(36756003)(86362001)(44832011)(41300700001)(82960400001)(66574015)(83380400001)(6512007)(26005)(2616005)(1076003)(66946007)(66476007)(66556008)(316002)(38100700002)(6666004)(6506007)(966005)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWdPNHJ5d1VWYXdNQzRyQ3ZJVUhHV0JzYStuZ0wvdkZXcGw1WVNxUitwSk9q?=
 =?utf-8?B?bExVcmczY0cxY2JmQXhTTzZNTEpMeExsNER6STloT3BReXExU2piSGxaeHJp?=
 =?utf-8?B?ODM0d1FkaER1U3hkVzZ0UmUwRSszT1NqOHMwRG5sWjdNcjNwTDZLeU1sTlg4?=
 =?utf-8?B?Y3MyNkN5ajJNU1hTeVJTM2ZIVyt1UUlENWlrM2FROGJyckxKRGUrcG5oRTJD?=
 =?utf-8?B?c1NXdGVGaXY4VS83S25HbnI2NFhzMjBldkFhaFZaZ3NFOVRrVGhHUFJRYWJi?=
 =?utf-8?B?TmtOdDRYK3dnbFo1SklraFZPN0lScUs2Rko5cGlIY240RTNJejA1dS9BS2FW?=
 =?utf-8?B?UnZRWnpwU1UxbFlBMmNVQ0RTa1BUa3AyK3VzT0VhVUtsaWJWUGtOTzFnN2pr?=
 =?utf-8?B?NUEvQkRSWHVSaUlRaloreEJxSDdvT2lxcy9ramRDSmQrUGRFWGVCbmNMejVN?=
 =?utf-8?B?UERFaTV0L3hOdzJGaFBTSFB0TFFpNWc4N2I1T25KY0NsUGlERUJSTVRJYzVl?=
 =?utf-8?B?M1FXQ2JINDRiYnUrOXlKU0dDbzdjNnptUlpnd05EVjB2ek1YTDZjZjZJNEl4?=
 =?utf-8?B?eUJTSmY0Nk1UbDlsRENUblI2bFRveVc0azdBUG9Lc2pqMXdnWWM2NGVHOUFx?=
 =?utf-8?B?NzV2WjZvM3FyU3V4NU9SVVFIS2Z0TFhHSElFVzRPbWFwUnVjZUtsbVlVUXVh?=
 =?utf-8?B?cEtRcTFiQ1dEdlE1bmNwb2w5aGdyTjQrck04M0tRekVlUjBvaDNockY0WXdJ?=
 =?utf-8?B?b3VQNmpnS3lTUGNvaUR1bi9jUERmamFmcnJtOENxQUdFK0lSeC9zOTdHeG9O?=
 =?utf-8?B?K1pWMjZPdXpGZVpjYjFTS003dXYxekxSVktqOTZLNXBxS3ppc0h6dnlXcDdB?=
 =?utf-8?B?RVBYM2UwSjlIQktsUW1qVjdaWk12V3dUa1B3TjVQN0p3TmVibnNIUmlNRHhC?=
 =?utf-8?B?dkhROHM1bnhpSFlqb1RwSmJETW0yeUFUU0MzWlZpMTdsRUxBbDl5WndpcURL?=
 =?utf-8?B?OFRDdGpVT2tySDEwQ0tQQjFjM254c1BzMmpWZE52RnFSZkhpeXpxelVmRW0v?=
 =?utf-8?B?YXNWcTI0UjNJTEFsNDBkcUF6a0FlOEI1czFvVXRMbnRGNTc3N2Zkd0I0bWN4?=
 =?utf-8?B?T0RNQ3FmODJ3TEtLRDdBa3ZKVVRlRmlxS3E5Z0xVdGtIN2kzbGEralhmUGM0?=
 =?utf-8?B?NHZOUEFaSzZGYitUeXNqL0U0RUUxR3hJZ1BmWXpXMlJZUWhXYVk4ZlRXSzIr?=
 =?utf-8?B?NzgveER2aWlxRjZoTllHZlQ5Y2ZNeTZzODQyUU5SVFJyTndMUFQvWTdVU1Vu?=
 =?utf-8?B?bUxYUjduUXoxaUR0YjMxVTBqUkNsN25pRTYvWTJMYmFHL3BXK29oUkZyOHQ0?=
 =?utf-8?B?RXF4REdWTEc2bE12QzFCSkJoS2UzMEJRQzQ0WGdPQ2lQeGhWSE9kSU1lTTlR?=
 =?utf-8?B?Nm1Ed1RYZ3lpOUQ3Z2xGaEgwblc3aDl0WjFJSHp0WTlNZmVDQ1UzWkFicTJU?=
 =?utf-8?B?eUJXZ1B4WkVVNS9VM0wrbU1WWDNwV2U0RGFEZGowY0psY1V4NTBqRU1qM0ll?=
 =?utf-8?B?eXpJcEsvaEh6bjF1OGpRR28vMWpzajlkTHQveGxqVzVJOE5hbkFWeit6RHBM?=
 =?utf-8?B?dnM3eU9laDFzRCsyYTVvYXo0ZW5kWjRrcGhZQWVVd2g5Rm5jdTlJYlBPUFZY?=
 =?utf-8?B?T1k4OCtBWVQzd3pvVk5Jc1dYTnpDZTRIdUtYcDZaWGRxRDhCUnlaVXV1Y25o?=
 =?utf-8?B?cmtlMzRpVXdFdUMxQXRGeGlZczBpYUNPOWUyTVlIeGt5cTNLMlBCR3VnVFAw?=
 =?utf-8?B?aStKRmU0Q2VZZUFCRFFPU0I0QW13Rm0xM2xFb01na01oWkZHMEhYaUgrSFlm?=
 =?utf-8?B?VlFPQkxsZ2VvdzAwOU9Mc0gzcEsvQ0VJMzI0ZlI0azNKN1VxRzJJWmp5OXJ1?=
 =?utf-8?B?djJEdWtHK25XaUZZbWN5NjdOSERJek4zc01oaEVvTVpMcmhJS1VZYVFJZXlo?=
 =?utf-8?B?dHZCUUhkSWI2d3NiN0VRRFQrVHMwVEJDbnVzU0hyMkRMY3ErVnNnMTFXMXdp?=
 =?utf-8?B?cUt2cEE2Szk2MDRKcTlZM2xTOTZkQ3RmOFdmcWowbjFjcnl5cFlNNWJjcHYr?=
 =?utf-8?B?VUhRYWZ0TEtMVXdyRzIxS2tBV2dZTnFZT0tBeW4zTmxzSVhaWXJETWN6NmJF?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3820e319-09c3-40a9-2914-08dbf7b9721c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 06:46:46.0294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xcFNwoAeFXsju+j+QnOd0jWL9ZT/T7moQc0nfprLzkg48uZx7qgUwl8PWsEsQM3+BMFIe5j6F2i4jgTZUcGS3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4831
X-OriginatorOrg: intel.com
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is the fixup version for the series prepared and sent by
Thomas. That adjusts Xe to the lates GPUVM code that is on
drm-next already.

So, our upcoming rebase on drm-next would face some challenges
without the fixup approach.

So, here are the fixup patches showing exactly what patches
on our drm-xe-next will change during the rebase:

the final result is a entirely clean branch where all the
patches compile and make sense individually:

https://gitlab.freedesktop.org/rodrigovivi/drm-xe/-/commits/adjust-to-gpuvm-final-clean-rebase

Then, this branch has an empty git diff when compared to the Thomas
reference that is in this branch:

https://gitlab.freedesktop.org/rodrigovivi/drm-xe/-/commits/adjust-to-gpuvm-thomas-ref/

Also empty difference from this patches in this series that can
also be seen at this branch:

https://gitlab.freedesktop.org/rodrigovivi/drm-xe/-/commits/adjust-to-gpuvm-fixups

Thanks,
Rodrigo.

Danilo Krummrich (11):
  drm/gpuvm: convert WARN() to drm_WARN() variants
  drm/gpuvm: don't always WARN in drm_gpuvm_check_overflow()
  drm/gpuvm: export drm_gpuvm_range_valid()
  drm/nouveau: make use of drm_gpuvm_range_valid()
  drm/gpuvm: add common dma-resv per struct drm_gpuvm
  drm/nouveau: make use of the GPUVM's shared dma-resv
  drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm
  drm/nouveau: separately allocate struct nouveau_uvmm
  drm/gpuvm: reference count drm_gpuvm structures
  drm/gpuvm: add an abstraction for a VM / BO combination
  drm/gpuvm: track/lock/validate external/evicted objects

Rodrigo Vivi (4):
  fixup! drm/xe/vm: Simplify and document xe_vm_lock()
  fixup! drm/xe: Convert pagefaulting code to use drm_exec
  fixup! drm/xe: Rework xe_exec and the VM rebind worker to use the
    drm_exec helper
  fixup! drm/xe: Convert remaining instances of ttm_eu_reserve_buffers
    to drm_exec

Thomas Hellström (1):
  fixup! drm/xe: Port Xe to GPUVA

 drivers/gpu/drm/drm_gpuvm.c            | 1131 ++++++++++++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_bo.c   |   11 +-
 drivers/gpu/drm/nouveau/nouveau_bo.h   |    5 +
 drivers/gpu/drm/nouveau/nouveau_drm.c  |    5 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h  |   10 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c  |   10 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  170 ++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.h |    8 -
 drivers/gpu/drm/xe/xe_bo.c             |   28 +-
 drivers/gpu/drm/xe/xe_bo.h             |   11 +-
 drivers/gpu/drm/xe/xe_exec.c           |    4 +-
 drivers/gpu/drm/xe/xe_migrate.c        |    4 +-
 drivers/gpu/drm/xe/xe_pt.c             |    6 +-
 drivers/gpu/drm/xe/xe_vm.c             |  164 ++--
 drivers/gpu/drm/xe/xe_vm.h             |   26 +-
 drivers/gpu/drm/xe/xe_vm_types.h       |    8 -
 include/drm/drm_gem.h                  |   32 +-
 include/drm/drm_gpuvm.h                |  521 ++++++++++-
 18 files changed, 1859 insertions(+), 295 deletions(-)

-- 
2.43.0

