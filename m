Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E74CC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 10:09:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5247B10E7C0;
	Wed, 14 Oct 2026 10:09:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5669810E7C0
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 10:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791972571; x=1823508571;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3jftQMETaunE2HhqeaRJCaeguMxu0I5c2qdR4jSqavQ=;
 b=chCMK6JD2jZRiVWp7XqG1sA6XAkpHd49QlqBSCL+epDdhmvHX4I1zZMx
 jwK9NLoDW3AEW2Nfu6JqbitkiNbBPEbPWbRoPQQVBdNN+8akPcJrr+/16
 eR0nueIZ+Ofo3G4fvOWGOWYe/mP/ot626TXjHFjvwmy7int3qYtEb9Yf9
 dv0ocUrk7OfxP32O+SCHjrjoeER4uLS9Pls8w9vyanj53ZOHPXUz3ELdq
 KSuXyYAuKF0TojyBMcFrg8SdO3AtqJwFHdxZ/9LPU3l+qnqdCmzF1ZzZf
 Y01cecP/SpJqm7FNPYjIqGCo4YGnJ2gLkuZmk3GGAuFhPEGYKrU6W5ie5 A==;
X-CSE-ConnectionGUID: 3egY0p4KQ9yRp2B/LH/4NQ==
X-CSE-MsgGUID: o5XJ3VzWRoS8MWzJcr9rng==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="722005"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="722005"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 03:09:31 -0700
X-CSE-ConnectionGUID: gWiADgnJQgiwtk24VJT+lg==
X-CSE-MsgGUID: TLeZGsfxQC6M3fB8AEPC/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1473719"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 03:09:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 03:09:29 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 03:09:29 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 03:09:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGuZgWv/Qa0/DxLRPttJcRsEl6ACdXDVvW1BSrOqz3EreKIPSDc5vfPzQ2p+TEM47MlWYr4V/UI+TzXaMNkcdpExrEHzEjxmgH3Cq5pxDfGJo36EKKu9yUFTrZJqHVdePtOmwBJKKLeq4C5oZZpeBeECopj0TjcBwsvTPoUWQ41zaxW9j8Yhv+5q+ZY92d39kbK6lFGOb83AagFm0Y7F6YHeoprrJjMcOGdhA4wHX35BV2Q75h6bdr09E7khHoqTJju1K/DQPFAQlDzuSxyxEIeAoKRLLM2ymo/Wd/RErxNG9Psy9/Eo8O1OtkF9/XLVeoP/3WQ+kZ3qsmwBx0h5Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Upv07ZyeJZ8vqZDHVVhqQyMU+S+izEz/2gIavgIqLiA=;
 b=YFHmbZo9OQB6UQzY3xoqdqtWBHXIYmWRfW0ji3JGCtxoZBasUXsNuihZ956E2gqbv4EGi6LMYIJrqViHPbqJng8xuQBrx3mo7NHV+u6R1kAgcMIn7EtpU1I54z/HaIbgmGQKQuaXiZgvk68h522yCJp4G+2q7gFKTEKNU2UL8EZdZ16jJpILVy+sywUJJq4gb8+9rbH4obu58BwCIUj1OD3f6AoH98WBxp0/Gdzrvvj9sRYdjfogGU8NwW77QitQhmgmSFR7ich4SDt1tk0vOLoMCXl2HeHpduXAkupDTVosxR2bc5qgk3Gtc/desGom/0Zn/6vdIEO93CQ0cCCV3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH0PR11MB5928.namprd11.prod.outlook.com (2603:10b6:510:144::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 10:09:27 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0496.015; Wed, 14 Oct 2026
 10:09:27 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v7 3/4] drm/xe/guc: Start use explicitly usable GuC IDs for
 for submission
Date: Wed, 14 Oct 2026 12:09:06 +0200
Message-ID: <20261014100907.77877-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261014100907.77877-1-piotr.piorkowski@intel.com>
References: <20261014100907.77877-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P195CA0023.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::7) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH0PR11MB5928:EE_
X-MS-Office365-Filtering-Correlation-Id: 767e5912-5adb-4913-79f0-08df29db3ae2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|6133799003|22082099003|18002099003|10067099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: YDwyG70f8rj03XAmqjc5zoWlmMvRK+d6CeClnO0yjf9XlaZ6AKRTnjizhNrNNiukYs8ib4iD2FKbHXwx+h61ScDD7EeUwnt6jerrm1Aw51/NLankvaTB1JTepLv6VZ1D+Bx8gNFfwQQiGBUBsjVfsO4ZOS0HoRXvqEIDSZ5RsFczdFA3TlDLZw0irKDog1W0+tnKOgYGDd+CbtVzmGJvyC0awX3r+/2Sp8sdBa1eHTYA6E7ME6CLLRnz0K7TSC4RIy//mxKbef4osD0OsZRn5HU7sVNBq6VBM29dDjeP9AhYBKgLgt3A7vbLW2pH165VaAqi9tkJ2pJZ4FU6y1LIoTp/4ktLm4159To6V6B4yt/9+KnNz37k5vhMytvdXaSMXC25DNH/L3rBvipvZSBWU2Mc6al1jvFppMmiIB1xGk8sWkM9cQ+wZm98T1lYXkWwblX6VhVElcmaM9EIeZblICePUQlVNNFoajHZJwet7nk1IviQ8bau71RPUzhYsuqHh9eFupuq3yMB3PBmnt7PCfX5WresnIx5s1LHcOzDPQaecJclgMD07oA3hRW9xrvoHQj1QX1OXg7CxqkNC1+yiH022AoZikJO3AUuEJ2WWplD6teUJ2V0G6pYu+5Sj0WbwNS0bkpG5DSkbVc6mjfmTWfYuRDW12XX/X0IYS8W6uE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(22082099003)(18002099003)(10067099003)(11063799006)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekpSZkJiOEFqTDVLaGhyY1ZlQ0Rjbk9pbWRNcWZ3WUJ2R2Y2ZUdORzhyWU0w?=
 =?utf-8?B?SzVzZ0h4WWpGZzVrVU5Rcllkd2FqSlpDYUtBZmpLbnp6VU5rcUxDa2llUU03?=
 =?utf-8?B?UCt6WGhVdHF4UElySE9rdHNFSWJHbGZHcmFZMlBvV3lyUm5CVkNqaENlRDZB?=
 =?utf-8?B?MkZRb1dLbUNzbkRQdnVQbDN5ejA3SEkyeHlaWjNhSUZlSVVOSXdselR3NmJ2?=
 =?utf-8?B?Vy90NUVHZFNFSjltZGd1KzVuTkhvYllJTGdFNFhFWUhVWE5VUDRCckFrbGsx?=
 =?utf-8?B?RGhwVnFnejhTdkVjZ3YrSStvWU9OZDRiOUd6RHR5NkxiSGRwMjUwUzQwTEpL?=
 =?utf-8?B?bHEzQkVzLytBeGprdGNHcTBPeWUrWUFKbXdyZUVpZDZod2JCTWRXTm4wWnI5?=
 =?utf-8?B?aW5ETUwyeEpjYUJjNFJVQ2l6N2VORFNWUEVmVlRPWDRTWGhFRWVBUVk4aGpP?=
 =?utf-8?B?UXpoeVdybjhDRi9TYmVGeTdLb1FuYm1IZHNyWE9VdHV2UDNrTzlwS2l4KzJ2?=
 =?utf-8?B?ZHVKaXNHcXdWaTRWc0NwSERMRTVzWitBZHZ2c3Z6S0I5a20vN0xvdVhVR3dn?=
 =?utf-8?B?Tzd3ZjZwbzNsSWNRaUNwZ3lWQ25uUVJWWkxIRXNuK0xFQTFmS2Yrc1E3dTlV?=
 =?utf-8?B?a2FHL25ub1BQY0ZZdHFReDR4K2t4Z0NzT1Zsb3BxQk13RGRFV1dhaWtPanRr?=
 =?utf-8?B?b2xuTjg0eDJXeUJYNzRWV0tiVGlOS01DMmJDMlFyTlI0SE1Rc2RkNmhzTW5M?=
 =?utf-8?B?clVSZmNZTXdkd1NzV1pweTBjRWlUQ0lncTlwS3luTkJjVjE2NGpnZndaT25J?=
 =?utf-8?B?Z0JlMFZjZXpCY1JPcEp3QmVBK3BKTW9tRGV2RVNpMktGSlpoeUprNGpDREcw?=
 =?utf-8?B?UktXMkJ6YjkxKzFPVG16YjZwdjltM1BqKzk2YUdKWHhOQ0tOMGRJRDg1ZjlI?=
 =?utf-8?B?Ylp4Z1p1cnBrbis0Z2JxZGRmSUp6a3U2R2hMaGVSYS96NXhFZDNTdTRiTVNP?=
 =?utf-8?B?YW9iVEVWY25wZ3QzdytFMEZQdDVYSUIxSVc2RWpyUDNtM2JGcUs5VU9hZHYy?=
 =?utf-8?B?NEE4ai9xSU01eHo1Qm81NmR1NTk0YlE5WFpQQUR3OVZLNHlJT28vek1ORmxK?=
 =?utf-8?B?bDNSR1BBZDlzOWxST25YSkJZak95OEs1TnJIaDF3U1NBQXdLYUxrSkJGSGhL?=
 =?utf-8?B?aHZiTk9zMytjMU9wbGRCWkdZNVR0UEZBYVpZK0NCMmlBZEhvKzFrWmxiekJF?=
 =?utf-8?B?cVdITlpOOTN6QnR3RTU5MWFJUlBrYkkxcEJHdUtSNGxxNDl1eVNjNVJzaXdw?=
 =?utf-8?B?QWxCT0hsRWhDUHF2cDU1MEFvTFRwL3BzcVU0SFlaZHBYYWpwQXhTMklHUm1S?=
 =?utf-8?B?c2VBODU2Q0RHY3VmZnpwZEdwRlRhMEVEaHpxbWpaUW1MK1VXVW1xQVRzZDh5?=
 =?utf-8?B?MmVSQjBSWFRsV2dSclBES0h2RFBNbEtyZ3BhQm5Bb1RWcUtDNmtFR0o1Y2xO?=
 =?utf-8?B?Y1JTSUJIcjNxZ25FVmNIWHliYmZyMXZQSkdDd2NnT1l1bHBtS1B1bUNzUzRZ?=
 =?utf-8?B?L2I0V3B3SmVobGJHVEFSNHpBVmtBeDFlclNkejRJYTkyeVhjc24wMTY2MnI0?=
 =?utf-8?B?WDViclJJc242VlpWOTluK1JYY2thVGZlRVFBWWFUaFp0RHpzYXZNcXBxTlRC?=
 =?utf-8?B?YjFCckVCTVNLSXMxWGNvbmt1M21JRmRKRGJhelZVNjAxSTdPUmwwdDlabVJt?=
 =?utf-8?B?eHNxNmhtTEoxN2ZVZEg4dGFkOFZWZCtKalJKWFZSbXVkbnkzWmtyTWZwWUc1?=
 =?utf-8?B?U1RHYkw0ck0rd3JpVUtDMndhZ04zendnK1J0NFdlaVhOclVkd0pZenk4MWgv?=
 =?utf-8?B?V2hzUHRzSWFmOEUwY0Z4QTZ4bXk3YVNEems1SkFhUG1KU0tDRzFUNnpOM0Ux?=
 =?utf-8?B?L0NXY1RlNXlyRGRjT3c2REFjdHVQTjV1cG56ZmlGZXBvREUvTkh1bDFtVUdr?=
 =?utf-8?B?aFVsK2pDUG9GZkF3MWRPZWllSk1LUjQyTis4L0J1MmZSR3YrOWF5aGh2Tnlw?=
 =?utf-8?B?Ly9ZK05EVEY0SGRaV1JUUGZpS1F2OG1hYUtiUnNCbkFSUzFkZ3ZkU29XWWdX?=
 =?utf-8?B?bjg2eUlqV0lrUDdwUzYzRm1XcloxM0Eyek5ZY2NtUDFpVlF1ZnJHYVlnellp?=
 =?utf-8?B?M1lGaVROcGlXa0RwRy8vckRoajVjRFMwU1JFQjBLVGhMTjRvNXUwREQ2elUx?=
 =?utf-8?B?UHEyUkh5Rkx3TG51UlkyRFRUbmFyWkNNazFsd3BYRmRGWHF6dnJIcWpxVjBa?=
 =?utf-8?B?MGprMlhNeUhVNXNXOHRJd3RVcmt1cDhmbmw4QllvallIN0kwMVNOWFhzaEVZ?=
 =?utf-8?Q?XLoLNrpERXt8nnDw=3D?=
X-Exchange-RoutingPolicyChecked: 1eM0k3GQ1Kb+Gzwqmle0SFdfbyDYYrxu5fxpt3xvm2fDkvhdBSjdZpp+bbgnipYEDe0kzWTPfGGJNuyrU9HLofgrgAk7gliLZu7g7OgiddbkP4s7IfQ6+SYd74OnLnWfSGeKFIDrByZRNPGvLhd3VsdfphZrCGNOr5FIGlu/TfmZtzvk8maXNnR/8ebpIlhD4FpOo+YAtoXEx5f3a9pwKMBQd4pocbSfH1GqFef+2TpqyZJdfK+DbzohPeEA2+9g43EOOP9tiIFO4oTQWnh6V2swH6XU/uVLHKV600JQjEAAfdNI0CHTjyvf/lzFYZoqzhZNmVbqDp9WCe0fqZe3fA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 767e5912-5adb-4913-79f0-08df29db3ae2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 10:09:27.4495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1QeF0241am6XtpcEDcaQmL4zX37mDpy2wV6pSXjobIzjExNFXbFyFBmh9xIIbfbdblVnfPyzyXToNIcR1XZqYBf7gDqVKp9mI45CcvLBTI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5928
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Switch GuC submission to explicitly allocate IDs from the usable
ID pool.
Also lets configure the GuC ID manager according to the device operating
mode during submission initialization. Use dedicated initialization
paths for native, PF and VF modes to expose the appropriate usable and
shareable GuC ID ranges.

v2: Use xe_root_mmio_gt() to get the primary GT so no NULL check is
    needed (Sashiko).

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 32 ++++++++++++
 drivers/gpu/drm/xe/xe_guc.c                   |  4 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 49 ++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            | 13 ++++-
 drivers/gpu/drm/xe/xe_guc_submit.c            | 27 +++++-----
 drivers/gpu/drm/xe/xe_guc_submit.h            |  2 +-
 6 files changed, 104 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index 158f9ba4ace66..5c74a7876d8a4 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -67,12 +67,42 @@ static void init_fini(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, idm_total(idm), 0);
 }
 
+static void check_init_small(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int count = 8;
+
+	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_init_small(idm, count), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), count);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), 0);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), count);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, count), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 1), -ENOSPC);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable(idm, 0, count), 0);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable(idm, 1, 0), -ENODATA);
+}
+
 static void require_iov_config_or_skip(struct kunit *test)
 {
 	if (!IS_ENABLED(CONFIG_PCI_IOV))
 		kunit_skip(test, "requires CONFIG_PCI_IOV");
 }
 
+static void check_init_shared(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_TRUE(test, IS_SRIOV_PF(idm_to_xe(idm)));
+	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_init_shared(idm), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
+}
+
 static unsigned int test_idm_used_total(struct xe_guc_id_mgr *idm)
 {
 	lockdep_assert_held(idm_mutex(idm));
@@ -678,6 +708,8 @@ static struct kunit_case guc_id_mgr_test_cases[] = {
 	KUNIT_CASE(bad_init),
 	KUNIT_CASE(no_init),
 	KUNIT_CASE(init_fini),
+	KUNIT_CASE(check_init_small),
+	KUNIT_CASE(check_init_shared),
 	KUNIT_CASE(check_used),
 	KUNIT_CASE(check_quota),
 	KUNIT_CASE_SLOW(check_all),
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 3ab4cb9e4964c..6c35474ab843a 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -853,7 +853,7 @@ static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
 {
 	int err;
 
-	err = xe_guc_submit_init(guc, xe_gt_sriov_vf_guc_ids(guc_to_gt(guc)));
+	err = xe_guc_submit_init(guc);
 	if (err)
 		return err;
 
@@ -897,7 +897,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 
 	guc_init_params_post_hwconfig(guc);
 
-	ret = xe_guc_submit_init(guc, ~0);
+	ret = xe_guc_submit_init(guc);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index efc134bb8d915..9bf9f0e5b7c28 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -120,23 +120,56 @@ static int idm_init(struct xe_guc_id_mgr *idm, unsigned int usable, unsigned int
 }
 
 /**
- * xe_guc_id_mgr_init() - Initialize GuC context ID Manager.
+ * xe_guc_id_mgr_init() - Initialize GuC context ID manager in native mode.
  * @idm: the &xe_guc_id_mgr to initialize
- * @limit: number of IDs to manage
  *
- * The bare-metal or PF driver can pass ~0 as &limit to indicate that all
- * context IDs supported by the GuC firmware are available for use.
+ * Can only be called when the device is not in SR-IOV mode.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
+int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm)
 {
-	if (limit == ~0)
-		limit = GUC_ID_MAX;
+	xe_gt_assert(idm_to_gt(idm), !IS_SRIOV(idm_to_xe(idm)));
 
-	return idm_init(idm, limit, 0);
+	return idm_init(idm, GUC_ID_MAX, 0);
 }
 
+/**
+ * xe_guc_id_mgr_init_small() - Initialize GuC ID manager for small count.
+ * @idm: the &xe_guc_id_mgr to initialize
+ * @count: the number of usable GuC context IDs
+ *
+ * This function initializes the GuC ID manager to manage a small number of
+ * GuC context IDs (0..count-1) for use by the GuC submission code.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_init_small(struct xe_guc_id_mgr *idm, unsigned int count)
+{
+	return idm_init(idm, count, 0);
+}
+
+#ifdef CONFIG_PCI_IOV
+/**
+ * xe_guc_id_mgr_init_shared() - Initialize GuC ID manager for PF.
+ * @idm: the &xe_guc_id_mgr to initialize
+ *
+ * This function initializes the GuC ID manager to manage the full range of
+ * GuC context IDs (0..GUC_ID_MAX - 1) for use by the GuC submission code.
+ * All GuC context IDs will be shareable with VFs.
+ *
+ * Can only be called when the device is in SR-IOV PF mode.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_init_shared(struct xe_guc_id_mgr *idm)
+{
+	xe_gt_assert(idm_to_gt(idm), IS_SRIOV_PF(idm_to_xe(idm)));
+
+	return idm_init(idm, GUC_ID_MAX, GUC_ID_MAX);
+}
+#endif /* CONFIG_PCI_IOV */
+
 /**
  * xe_guc_id_mgr_max_usable() - Get maximum number of usable GuC context IDs.
  * @idm: the &xe_guc_id_mgr to query
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
index 209f99831f1b4..ed9970829a939 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -6,10 +6,21 @@
 #ifndef _XE_GUC_ID_MGR_H_
 #define _XE_GUC_ID_MGR_H_
 
+#include <linux/errno.h>
+
 struct drm_printer;
 struct xe_guc_id_mgr;
 
-int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit);
+int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm);
+int xe_guc_id_mgr_init_small(struct xe_guc_id_mgr *idm, unsigned int count);
+#ifdef CONFIG_PCI_IOV
+int xe_guc_id_mgr_init_shared(struct xe_guc_id_mgr *idm);
+#else
+static inline int xe_guc_id_mgr_init_shared(struct xe_guc_id_mgr *idm)
+{
+	return -ENODEV;
+}
+#endif
 
 unsigned int xe_guc_id_mgr_max_usable(struct xe_guc_id_mgr *idm);
 unsigned int xe_guc_id_mgr_max_shareable(struct xe_guc_id_mgr *idm);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7ce73489c35fc..cef59d5d82aa5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -286,20 +286,26 @@ static void primelockdep(struct xe_guc *guc)
 	fs_reclaim_release(GFP_KERNEL);
 }
 
+static int guc_id_mgr_init(struct xe_guc *guc)
+{
+	if (IS_SRIOV_PF(guc_to_xe(guc)))
+		return xe_guc_id_mgr_init_shared(&guc->submission_state.idm);
+	else if (IS_SRIOV_VF(guc_to_xe(guc)))
+		return xe_guc_id_mgr_init_small(&guc->submission_state.idm,
+						xe_gt_sriov_vf_guc_ids(guc_to_gt(guc)));
+	else
+		return xe_guc_id_mgr_init(&guc->submission_state.idm);
+}
+
 /**
  * xe_guc_submit_init() - Initialize GuC submission.
  * @guc: the &xe_guc to initialize
- * @num_ids: number of GuC context IDs to use
- *
- * The bare-metal or PF driver can pass ~0 as &num_ids to indicate that all
- * GuC context IDs supported by the GuC firmware should be used for submission.
  *
- * Only VF drivers will have to provide explicit number of GuC context IDs
- * that they can use for submission.
+ * This function initializes the GuC submission state.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
+int xe_guc_submit_init(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
@@ -309,7 +315,7 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
 	if (err)
 		return err;
 
-	err = xe_guc_id_mgr_init(&guc->submission_state.idm, num_ids);
+	err = guc_id_mgr_init(guc);
 	if (err)
 		return err;
 
@@ -415,8 +421,7 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
 	int ret, i;
 
 	mutex_lock(&guc->submission_state.lock);
-	ret = xe_guc_id_mgr_reserve_locked(&guc->submission_state.idm,
-					   q->width);
+	ret = xe_guc_id_mgr_reserve_usable_locked(&guc->submission_state.idm, q->width);
 	mutex_unlock(&guc->submission_state.lock);
 	if (ret < 0)
 		return ret;
@@ -3298,7 +3303,7 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_exec_queue *q;
 
-	if (unlikely(guc_id >= GUC_ID_MAX)) {
+	if (unlikely(guc_id >= xe_guc_id_mgr_max_usable(&guc->submission_state.idm))) {
 		xe_gt_err(gt, "Invalid guc_id %u\n", guc_id);
 		return NULL;
 	}
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 29abf07d8f041..7a81d0aa19bb2 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -13,7 +13,7 @@ struct xe_exec_queue;
 struct xe_guc;
 struct xe_hw_engine;
 
-int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
+int xe_guc_submit_init(struct xe_guc *guc);
 int xe_guc_submit_enable(struct xe_guc *guc);
 void xe_guc_submit_disable(struct xe_guc *guc);
 
-- 
2.34.1

