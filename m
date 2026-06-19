Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAC7CD98F6
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 20:30:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B26610E0ED;
	Fri, 19 Jun 2026 20:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="STSqILJ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692AE10F6EA
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 20:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781901007; x=1813437007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mbcBf998PquTSwPZXLIXdS4lG/0hreO+IiZ5Rajtv1s=;
 b=STSqILJ81QlNEjSfqy0kSp+auwFczDHA4MxAGNMpdanAzoiDHHeuYP6Y
 AQmKfDb3fJqy0RPuALqEAhfmSMFWt16IYgCUWwfxzwGrLN85XQwGOycy1
 NlDIu1AXBX0/dfu6+18OQ+54xWWlC7A2YV/ovB940/o7uYTp1/lXyBgw7
 X6Ni6rlCVZbpnTiHfevUXE9OGVkRA0KE7DyGyALcjk1Y8YVJFAwrgy3I7
 Qc8okzqg4+vbDkrlcYCM1eULv/9NX9aw9o587+oFbKxOb0aumetTlbhIg
 SW5KRv1cOswG9zMAqoHDKATPKArphv2H5iP2YQhdF66mE+kifZQdiVTva g==;
X-CSE-ConnectionGUID: +XIqPaRXTL6I9FGWsmumBw==
X-CSE-MsgGUID: w9Gw5NVrREOSiA4o++87pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="70256043"
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; d="scan'208";a="70256043"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 13:30:07 -0700
X-CSE-ConnectionGUID: o2Anma2BQ/avWJoA3TMhYA==
X-CSE-MsgGUID: AZPKHDdsSvKVxDTIYmCM1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; d="scan'208";a="245771613"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 13:30:07 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 13:30:06 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 13:30:06 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 13:30:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QH/WLJwIlzWTIMWHa/TSGwL0nu+0nwNCC/vhLx1VzXCOFOtgCMkbmmzRqxIrgZoHR7B8k3w+yQvBdecG2XK6BLhIkqJv76T1MD2Bjtn0KNoXw2gwf+2Vg0+EeyD7J5X6R9H55SGaMFU8g4dtl5+EOMy/4MlCbFVvnGy35XeLsLcZ5WzjxgPYc0SYbJPIcywx/e6rfsazNlM34hS6QUnYJ3LdB2mpvJVzB+HMo5RB5yNbzIV6OM4sXxqXUSKNtXusV3VvHHtL1QllM9GHNu4yOczmtBJXPuU3hKKPLb8LEL1oIrCCXNVGOPV2fsGi/uBbOdoHdK7A5Z69Rgn8zw3t7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvHgFrxpistGTVdsyNCbInoka5tsDA72k4QeDNiq7rc=;
 b=n9OLNgagXqY9I5wGiJ9cOavyVA8C+IN8Gfbi24uGvUp4n4efCSjCVQebwPOo9AyPXIqyVzEZUbHIYEv0HWkBtzQNVA3vhcDm2LNIjT1vwZ01lRvwIDFuaGvl73eb2xB/x/Jb17e/eo93xtb/W6UnCaXN30zegCvIP63RDe/cngz1rldnqxSryIlEbLo9ixY4HzMSzCeDEBrwecrLDpos3rvpVZ03QQijDO3R3F3VsHAwCiy/YyFex/IMFV+mBcHvrO1gIfyYoi0TjtfNbTWucMEsqQMwdgr1vz4PWK4nTgbQcKxjNVfEQwPXtY94S/rjq2KoZPGP8uwMTWwUEsV+Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Fri, 19 Jun
 2026 20:30:04 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 20:30:04 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v2 6/7] drm/xe/guc: Add start offset support to GuC doorbell
 manager
Date: Fri, 19 Jun 2026 22:29:34 +0200
Message-ID: <20260619202935.2701499-7-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260619202935.2701499-1-piotr.piorkowski@intel.com>
References: <20260619202935.2701499-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZP191CA0058.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::18) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DS0PR11MB6375:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ce300a0-fb2a-4bbc-686e-08dece418b8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: 9Uum6jkrhbeS4XG614yjt9cHLwy8FO+ndwhMmvoENgUbqd+iAy/nh6tn8XcB8WvSGs8sk4mEDx/J2MrbJoqbCyQY6OCOZxl5XzPVp6zyc7XlLnJ1x2M4/ld9csTyxDQ1EwaAPVjoYyHAn9TkTJFvVlFFhqJcRdizXolDR0ngEuyoMV5Ncnipi9wZI69OuAZL5JA4Junp7L9okOQONMyTWWmGwaJLK22/vQTZJ6nBmcjeZc1XsNhKLznKVVGwRWz88HiP3GJALgUSNwNmKkvzoWa7fJUIOWVV4ZAnG5vR3pwhGM+fshJ2kbPdzkC5EFQw5e47m2RLO26db44P0m/b4asEaTeNq3wiDZknuoWc4bli3hnH3ugVVsVmmZQCltTERBXyQ2zQK9blxcpQK1HM+ZRmVkBCv5E2rLJs4e5RuZCoS7TRir9rgXQWuuSm/0qYvTRVY9k5/yAHFbJZ8589IUJ49VzNzn1vFR3BAtTA3u4xwEnWme2iPzWWPYIWbTLxBm2brn6OgwtjmxP1R64nI0yL6etdR04X3jGzWSXw1RQYxlFQgEqx3nUiJxqYNszZ3Z0tChL8jWGw85sn8Gm77IS3Jq4PVrQUr+4r/kIFc0PQ99S96fJINiysZOxEZj/2jKUdUaoYJyEaZ4lfIj0CUPVkEVu2HnOAthzuF0Nd0IQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(11063799006)(56012099006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RENwVlpGc0hYbUlGNVRoS2lkNGRRcWhiTzNNYnFscE0xUk95bFRWMW5NMURM?=
 =?utf-8?B?ZE1LZzNIUEJWRzg4L0pncjRqUHdkaFAySnVsakw2UUwzTUd5NnppbTM0dkNT?=
 =?utf-8?B?d0FJYUhCWTc1cERtTjQvbDBDYjlWYzVtc0NVQnVZK0ZSZlhmalR0eXJVa2U4?=
 =?utf-8?B?QklxUEEwVExOa2loeVpxSWUrczhDa0h6eTcxem8vbC9HTHJaU3J0cXNOQnJm?=
 =?utf-8?B?QzdSVVhjaUhmLzJpRDNVdjMrUU55bWVBYUl5a2VhbTBGdWtTODVpamhlTXdm?=
 =?utf-8?B?OWVvakNCb2VnbGJ3akdwZ0pCR1c4S2FyeFcyZVpOSi9VeTN1Z3FZdmlmQVNu?=
 =?utf-8?B?YU5hb0phOGMrcFpOQkt6bmh2cGFUK1ZwTzVKY05tMmxIbVk3TlBhZy84MVVn?=
 =?utf-8?B?aWlQdzExaEV5cTZTb2dseHpXM1J1VzFPU0RhTzl6eUtIVEYyNXN4UkEyYTR4?=
 =?utf-8?B?aG1IWHNadlBmWDBDSjJ3MmxLYy85dVBFMlVIRXRzbW1ObytnL1dGTi9ha3Z4?=
 =?utf-8?B?Y3BLKzQwN3ZyY2NTYTdITUZERHViNTQvODF4RlBvbXJrNmxWOUl4cUVVTlUz?=
 =?utf-8?B?RDdtVmVvQTZjR0daRFdkTk1JTjNjUWRiYlg0OFRkU1JkM2VLUytvZG5mMFVM?=
 =?utf-8?B?VGFUSmxEOXpXOC9KZ2xta3NSTVVoQk55VlNEOVdxSEhJcHZCMTJDZlhQUGh0?=
 =?utf-8?B?SHRxbUMrSjEwOWhHTjRwRDVmTVBiYnNvcW0wRWxiWjJ1K0VsYk9xNW1qT1h1?=
 =?utf-8?B?d0VRWGV3UG5CRG9BbnRyNnhxVFYwRWtXU280YkphTTI1cU55VE42eUJ5b2Vn?=
 =?utf-8?B?SnRZcHlGMUdQZUpvcElrMGJ0bmIxQWFPc2g5Zi8rMkhwdEFQMzRVNllDQmFI?=
 =?utf-8?B?b2JSRzJwNFB5NE5Sdyt4azQ5WnpMbFFrNTNIdTEvOWVvNUZGckFwYjNOTXdu?=
 =?utf-8?B?UmwyODhCbVFNQ2JPa3R2VGFCdXl2NDUwMnB3NGhyd3piQ25lVjdkcXZDMUhi?=
 =?utf-8?B?b2tlTk03aGxMUytvYjZIZmgwSHZuaGRDTUZoMnJ3SFBnWVVlNVdEUzVBMGJU?=
 =?utf-8?B?cmt5cTJIOTJtbkZqZTRuaThxUkJscVUwZlFiNXRTUnFOZkZTVW9RYXdiSTlF?=
 =?utf-8?B?cHhUY2FGeCsybzBuTlo3a3p1RWFrb3p4amR5Mjc4aWw2UWZpWUQ4N3lidFBZ?=
 =?utf-8?B?TEE1SndhY3VWWFdaNStlRDJLRjhHbjN2dWJGdkdTM2hlUEFEUURzaC9keTFN?=
 =?utf-8?B?RWNYTHd6L3FjVk96RUpmMUlyT2VuWkhzdmU2QlNGejRJcWhFMFpMNTIwOG9I?=
 =?utf-8?B?ampUUHpLdXY2am9oMEZBUEtNTW13Vk1icFlpSU1ndXlRazVWdlBmM1ZTYmlY?=
 =?utf-8?B?U3B5ZHF6Z0RBT1FnMFdFTi9yYnRqTmRnbVdTc0dnL0xWVEVrYzJLMjNGdko4?=
 =?utf-8?B?NFdtTnFoajlSdk05RzhsRHJwUWlVaE1HOUtLZEtlV0Y0UjlrLy85Q2tIY0Fy?=
 =?utf-8?B?VDBmUWR4cFJUUjhSdDh5Y0hLWWRXMFk0S1J4dWRMZnRhOTdlbXJ4TENFSk40?=
 =?utf-8?B?clNReG1NaHcwUVdqQldNNWIyUUEvWFRBcWlGVWlHZXZtdDVuNVpyck80ZndF?=
 =?utf-8?B?K2kwVWFrM1NEdGVwNmhCUlhxWGEvbU5qT09FNmRGM0hzKzdFY0ptRFZkVTMr?=
 =?utf-8?B?VEdianJsOGxDRSt3aVRQZSs0dVNySnc5MEpjRTVmTVJDWERPWFFpL2dHOWI3?=
 =?utf-8?B?Tmw5SDNGYjE0cDk2V2RBK1VwbC9uUFl0elMzdmVzcmtPT3AxbGlvSjkzdzVs?=
 =?utf-8?B?N2xDVElacG1KZmRrY3kyTGpWV3dnSVFCaFBrS080ZVE5RUZYQTdUc3QwSUho?=
 =?utf-8?B?TUQyaDR0cE16ZXI2VWNmRFluOWovbDhKRzdob0NkVEV1d2FKTU43WXJWWlYr?=
 =?utf-8?B?VTkvOTFzUVA1WFRDUW41di81RkRaakFlcGlNM2tXejB4dGY0Y1JxM0VrV0Vw?=
 =?utf-8?B?NjRiUUNROVFDWlBhQnJHT2o2dmd0eHhEZzdGMkI1WnNDQ2ZWNElndXBuQ2Zl?=
 =?utf-8?B?NTJ1ZGk4OUVGYkdRanpscmpKVXM3Qi9SSzNOOXAyZGp1S2Vad3NGd2RFQWxk?=
 =?utf-8?B?dDNLMlhQMG5LcG1QdVRpaFJrbllwN0V3MTdTQWZRR3hhYXZoWWxzeU5LNVE0?=
 =?utf-8?B?MHhRN0FTdHYzTTdUR1JCNTN0ZG5vWUFXOFJycEZsbE5xMzR3QUJYQmN0V25s?=
 =?utf-8?B?SGhGc1dpWUJkcmxxeEtTUkZldlRud1dQU1FsL2h1eWpuanhHWEdWbXFUV3NP?=
 =?utf-8?B?MnM2bnY2VVUxaWNwam1DZG5zZnJTQ3A1NStlU2NnNHp4MVA3a083Y05McGN6?=
 =?utf-8?Q?E9ZJ1n3gim5CVIKM=3D?=
X-Exchange-RoutingPolicyChecked: nDYRFTfAwgfmeb2BqQoADKAn6C5dZhW8bpbIr2IR8G+Ie9mGdYmneP0FTwZND/+tfyO1ykax6X2wz+vUxeYGJvUAFR8mfodnv4096DZhbUvdqVGteT8bnA8gfFkXHC2XrXjIbzjk4FKrzW85yZMi8Wto1rfGRicZoLmfI3HYXbU+05+8qPc64LirAplRrISpJJx7NCelNIdOGlAJKe0B9PYKFEUf/AVWUSETZ2BmkDqiL8WGDzJhaKnHO87bMynyQ64xLxLwqEob1lemJIK0u1+MzK9Gy4W+Mb8LHyjWXNeqnY5aSmQzFl/Ug1HuSE3MIt1TKIiGoyxiZpSj6oMXAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce300a0-fb2a-4bbc-686e-08dece418b8b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 20:30:04.4882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U4l6nnm1POkMVj3LSbVoX67X5isXP2ZjcGRFxVvf092itQLLuo+uu8gxMefGcZtgKYKQCKr0ZS0RO3UIpQqAU8QFx1khsKQ42Iph49B2CkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6375
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

Add support for managing doorbells starting from a given
start ID. Introduce a start field to the doorbell manager
and update allocation and release paths to operate on IDs
in the range [start, start + count).

This allows using subranges of doorbell IDs instead of
always starting from 0.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |  2 +-
 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c | 43 ++++++++++++++---
 drivers/gpu/drm/xe/xe_guc.c                   |  2 +-
 drivers/gpu/drm/xe/xe_guc_db_mgr.c            | 46 +++++++++++++------
 drivers/gpu/drm/xe/xe_guc_db_mgr.h            |  2 +-
 drivers/gpu/drm/xe/xe_guc_types.h             |  2 +
 6 files changed, 74 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
index 89d4e1d0eda5..ed72f34c5948 100644
--- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
@@ -107,7 +107,7 @@ static int pf_gt_config_test_init(struct kunit *test)
 			xe_guc_id_mgr_init(&gt->uc.guc.submission_state.idm,
 					   &gt->uc.guc, NULL, 0, ~0), 0);
 	KUNIT_ASSERT_EQ(test,
-			xe_guc_db_mgr_init(&gt->uc.guc.dbm, &gt->uc.guc, NULL, ~0), 0);
+			xe_guc_db_mgr_init(&gt->uc.guc.dbm, &gt->uc.guc, NULL, 0, ~0), 0);
 
 	/* more sanity checks */
 	KUNIT_EXPECT_EQ(test, GUC_ID_MAX + 1, SZ_64K);
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
index fed4e70be49b..2d4af4f8116f 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
@@ -28,7 +28,7 @@ static void test_empty(struct kunit *test)
 {
 	struct xe_guc_db_mgr *dbm = test->priv;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, 0), 0);
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, 0, 0), 0);
 	KUNIT_ASSERT_EQ(test, dbm->count, 0);
 
 	mutex_lock(dbm_mutex(dbm));
@@ -42,7 +42,7 @@ static void test_default(struct kunit *test)
 {
 	struct xe_guc_db_mgr *dbm = test->priv;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, ~0), 0);
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, 0, ~0), 0);
 	KUNIT_ASSERT_EQ(test, dbm->count, GUC_NUM_DOORBELLS);
 }
 
@@ -67,7 +67,7 @@ static void test_size(struct kunit *test)
 	unsigned int n;
 	int id;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, *p), 0);
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, 0, *p), 0);
 	KUNIT_ASSERT_EQ(test, dbm->count, *p);
 
 	mutex_lock(dbm_mutex(dbm));
@@ -90,7 +90,7 @@ static void test_reuse(struct kunit *test)
 	struct xe_guc_db_mgr *dbm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, *p), 0);
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, 0, *p), 0);
 
 	mutex_lock(dbm_mutex(dbm));
 	for (n = 0; n < *p; n++)
@@ -112,6 +112,34 @@ static void test_reuse(struct kunit *test)
 	mutex_unlock(dbm_mutex(dbm));
 }
 
+static void test_start_offset(struct kunit *test)
+{
+	struct xe_guc_db_mgr *dbm = test->priv;
+	const unsigned int start = 8;
+	const unsigned int count = 4;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, 0,
+			xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, start, count));
+	KUNIT_EXPECT_EQ(test, dbm->start, start);
+	KUNIT_EXPECT_EQ(test, dbm->count, count);
+
+	mutex_lock(dbm_mutex(dbm));
+	id = xe_guc_db_mgr_reserve_id_locked(dbm);
+	mutex_unlock(dbm_mutex(dbm));
+	KUNIT_ASSERT_EQ(test, id, start);
+
+	mutex_lock(dbm_mutex(dbm));
+	xe_guc_db_mgr_release_id_locked(dbm, start);
+	mutex_unlock(dbm_mutex(dbm));
+
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_reserve_range(dbm, 2, 0), start);
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_reserve_range(dbm, 2, 0), start + 2);
+	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
+
+	xe_guc_db_mgr_release_range(dbm, start, count);
+}
+
 static void test_range_overlap(struct kunit *test)
 {
 	const unsigned int *p = test->param_value;
@@ -119,7 +147,7 @@ static void test_range_overlap(struct kunit *test)
 	int id1, id2, id3;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, ~0), 0);
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, 0, ~0), 0);
 	KUNIT_ASSERT_LE(test, *p, dbm->count);
 
 	KUNIT_ASSERT_GE(test, id1 = xe_guc_db_mgr_reserve_range(dbm, *p, 0), 0);
@@ -156,7 +184,7 @@ static void test_range_compact(struct kunit *test)
 	struct xe_guc_db_mgr *dbm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, ~0), 0);
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, 0, ~0), 0);
 	KUNIT_ASSERT_NE(test, *p, 0);
 	KUNIT_ASSERT_LE(test, *p, dbm->count);
 	if (dbm->count % *p)
@@ -175,7 +203,7 @@ static void test_range_spare(struct kunit *test)
 	struct xe_guc_db_mgr *dbm = test->priv;
 	int id;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, ~0), 0);
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, 0, ~0), 0);
 	KUNIT_ASSERT_LE(test, *p, dbm->count);
 
 	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, *p, dbm->count), 0);
@@ -188,6 +216,7 @@ static void test_range_spare(struct kunit *test)
 static struct kunit_case guc_dbm_test_cases[] = {
 	KUNIT_CASE(test_empty),
 	KUNIT_CASE(test_default),
+	KUNIT_CASE(test_start_offset),
 	KUNIT_CASE_PARAM(test_size, guc_dbm_gen_params),
 	KUNIT_CASE_PARAM(test_reuse, guc_dbm_gen_params),
 	KUNIT_CASE_PARAM(test_range_overlap, guc_dbm_gen_params),
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 092084b200b9..bd87b8f94519 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -882,7 +882,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
-	ret = xe_guc_db_mgr_init(&guc->dbm, guc, &guc->submission_state.lock, ~0);
+	ret = xe_guc_db_mgr_init(&guc->dbm, guc, &guc->submission_state.lock, 0, ~0);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.c b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
index f810692ad8fa..c39c39d16c0a 100644
--- a/drivers/gpu/drm/xe/xe_guc_db_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitmap.h>
 #include <linux/mutex.h>
+#include <linux/overflow.h>
 
 #include <drm/drm_managed.h>
 
@@ -66,6 +67,7 @@ static void __fini_dbm(struct drm_device *drm, void *arg)
 
 	bitmap_free(dbm->bitmap);
 	dbm->bitmap = NULL;
+	dbm->start = 0;
 	dbm->count = 0;
 
 	mutex_unlock(dbm_mutex(dbm));
@@ -76,10 +78,13 @@ static void __fini_dbm(struct drm_device *drm, void *arg)
  * @dbm: the &xe_guc_db_mgr to initialize
  * @guc: the owning &xe_guc
  * @lock: mutex protecting this manager, or NULL to use an internal lock
- * @count: number of doorbells to manage
+ * @start: first doorbell ID to manage
+ * @count: number of doorbells to manage; the manager handles the range
+ *         [@start, @start + @count)
  *
- * The bare-metal or PF driver can pass ~0 as &count to indicate that all
- * doorbells supported by the hardware are available for use.
+ * The bare-metal or PF driver can pass ~0 as @count to indicate that all
+ * doorbells supported by the hardware starting from @start are available
+ * for use.
  *
  * Only VF's drivers will have to provide explicit number of doorbells IDs
  * that they can use.
@@ -87,10 +92,12 @@ static void __fini_dbm(struct drm_device *drm, void *arg)
  * Return: 0 on success or a negative error code on failure.
  */
 int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, struct xe_guc *guc,
-		       struct mutex *lock, unsigned int count)
+		       struct mutex *lock, unsigned int start, unsigned int count)
 {
 	int ret;
 
+	dbm_assert(dbm, start < GUC_NUM_DOORBELLS);
+
 	dbm->guc = guc;
 	if (!lock) {
 		mutex_init(&dbm->internal_lock);
@@ -99,11 +106,17 @@ int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, struct xe_guc *guc,
 		dbm->lock = lock;
 	}
 
-	if (count == ~0)
-		count = GUC_NUM_DOORBELLS;
+	if (count == ~0) {
+		count = GUC_NUM_DOORBELLS - start;
+	} else {
+		unsigned int end;
+
+		if (check_add_overflow(start, count, &end) || end > GUC_NUM_DOORBELLS)
+			return -ERANGE;
+	}
 
 	dbm_assert(dbm, !dbm->bitmap);
-	dbm_assert(dbm, count <= GUC_NUM_DOORBELLS);
+	dbm->start = start;
 
 	if (!count)
 		goto done;
@@ -159,12 +172,18 @@ static int dbm_reserve_chunk_locked(struct xe_guc_db_mgr *dbm,
 
 	bitmap_set(dbm->bitmap, index, count);
 
-	return index;
+	return index + dbm->start;
 }
 
 static void dbm_release_chunk_locked(struct xe_guc_db_mgr *dbm,
-				     unsigned int start, unsigned int count)
+				     unsigned int first_id, unsigned int count)
 {
+	unsigned int bitmap_pos;
+
+	if (WARN_ON(first_id < dbm->start))
+		return;
+	bitmap_pos = first_id - dbm->start;
+
 	dbm_assert(dbm, count);
 	dbm_assert(dbm, count <= GUC_NUM_DOORBELLS);
 	dbm_assert(dbm, dbm->count);
@@ -175,9 +194,9 @@ static void dbm_release_chunk_locked(struct xe_guc_db_mgr *dbm,
 		unsigned int n;
 
 		for (n = 0; n < count; n++)
-			dbm_assert(dbm, test_bit(start + n, dbm->bitmap));
+			dbm_assert(dbm, test_bit(bitmap_pos + n, dbm->bitmap));
 	}
-	bitmap_clear(dbm->bitmap, start, count);
+	bitmap_clear(dbm->bitmap, bitmap_pos, count);
 }
 
 /**
@@ -249,6 +268,7 @@ static void dbm_print_locked(struct xe_guc_db_mgr *dbm, struct drm_printer *p, i
 	unsigned int rs, re;
 	unsigned int total;
 
+	drm_printf_indent(p, indent, "start: %u\n", dbm->start);
 	drm_printf_indent(p, indent, "count: %u\n", dbm->count);
 	if (!dbm->bitmap)
 		return;
@@ -256,7 +276,7 @@ static void dbm_print_locked(struct xe_guc_db_mgr *dbm, struct drm_printer *p, i
 	total = 0;
 	for_each_clear_bitrange(rs, re, dbm->bitmap, dbm->count) {
 		drm_printf_indent(p, indent, "available range: %u..%u (%u)\n",
-				  rs, re - 1, re - rs);
+				  rs + dbm->start, re - 1 + dbm->start, re - rs);
 		total += re - rs;
 	}
 	drm_printf_indent(p, indent, "available total: %u\n", total);
@@ -264,7 +284,7 @@ static void dbm_print_locked(struct xe_guc_db_mgr *dbm, struct drm_printer *p, i
 	total = 0;
 	for_each_set_bitrange(rs, re, dbm->bitmap, dbm->count) {
 		drm_printf_indent(p, indent, "reserved range: %u..%u (%u)\n",
-				  rs, re - 1, re - rs);
+				  rs + dbm->start, re - 1 + dbm->start, re - rs);
 		total += re - rs;
 	}
 	drm_printf_indent(p, indent, "reserved total: %u\n", total);
diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.h b/drivers/gpu/drm/xe/xe_guc_db_mgr.h
index e29e318e213b..d04e989bc88a 100644
--- a/drivers/gpu/drm/xe/xe_guc_db_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.h
@@ -12,7 +12,7 @@ struct xe_guc;
 struct xe_guc_db_mgr;
 
 int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, struct xe_guc *guc,
-		       struct mutex *lock, unsigned int count);
+		       struct mutex *lock, unsigned int start, unsigned int count);
 
 unsigned int xe_guc_db_mgr_total(struct xe_guc_db_mgr *dbm);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 5fd50961d9da..4183b23bfd8e 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -31,6 +31,8 @@ struct xe_guc;
  * is initialized and used.
  */
 struct xe_guc_db_mgr {
+	/** @start: first doorbell ID managed by this instance */
+	unsigned int start;
 	/** @count: number of doorbells to manage */
 	unsigned int count;
 	/** @bitmap: bitmap to track allocated doorbells */
-- 
2.34.1

