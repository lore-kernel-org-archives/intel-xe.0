Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19C5C5AC82
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 07:18:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9863B10F3C6;
	Fri,  7 Aug 2026 07:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PaC3V4Fq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5BE10F3AA
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 07:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786087125; x=1817623125;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=SPTJoVbBMxfy4UcZN2dALDP+qAqOnDe/0iiE0hB3yjY=;
 b=PaC3V4FqSuhRKtLsmndHimD9TXIk2+VRObEvjjNoQT2uD5t8BfBlE5sU
 wKvNp0egszeo+GxyWCaEfbQZlGDcSqTyww0MvQm73YOM3ms4P0qK2q1LV
 vvmxJgp8MMab/c69lR3KiD8TCqgpBNmrs+21COvOMPuYSb4yRHzVxA7gF
 lzlZrfK4A6wKFPKEhu60KrbXpEwUYzomc3rOB+ouPd/3MuuN1W3wSHSgA
 mByBMya8t0i5k8aVZU6f4CrOnJK/3sRCMX87OuPule5rArfwyJiPE9RA6
 0lmGP0ar4Ul6VHP5NEM3hz9QT+DaSIR28Ec7eyXHr98SNAXUxh9ciQS1a A==;
X-CSE-ConnectionGUID: 5QhAnw+KSNmrLlekfub5CA==
X-CSE-MsgGUID: oy5qFjHvS56m45Gl16XdIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="89218060"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="89218060"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 00:18:41 -0700
X-CSE-ConnectionGUID: 37gtjwVzSxe2os2YCmziCQ==
X-CSE-MsgGUID: rrajMjIcTPyfGEBX14/pZg==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 00:18:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 00:18:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 00:18:40 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 00:18:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xz4opHBsNJsSvGptF61eji6SOduu0vzW05Xi2USAkBw+T7xrZ+3IRA2rm2RaQZ1rvE18mUK661wTlayDI4pc3PbPO+VTxhpsXC9JK4mzSxd1+shVNmTYKvPz3b94Le0rFvhcsIJZWNRWpXHmMNXlWu1MFtV7/aJw25ul2QxlvhX1UmFanN5PAszkvdNxVWf+Lu+stcroI2DGsydXgSWY289sHQODRq+Pu1KJVaAbrqidDrnC/Nip0iAipXussxns3ZF0lUiIjdvsVGb6DGZ/gqEGiCO14byZyZojErDwh9iu8JWoGWq+u22bhL05sVAeW6hEKN0HUg3p5796qLVIlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20sckJBFGeGi2mZQbTetKRSSHNJWliZhcyAw9lfIi7I=;
 b=ipqscY4V/E7WrP8s7WzXAWxQf/jHEk5Vp1pZBnjBPBWLd7o5JR71TRgkNI5+MCUB3lmgYsZfnUV46y/Amb0Z4N1aNneu+i493afgke/XCEhK5fx+VBJ+PWdgLNXHXvk2wzTy+YqLx72b8AYf+8M6El7BkFfV+Er8aTApcNR2oLZ+yj2JSPmJhq2N99bFB59BFBNdQGtD5ixkag56mTM85Td1ru1fb45obdIE/KFksafS8XRftUo4ju+iC6InLQZ1yfqdfSnlXCfLP+qgshkHVGqI6nbhYNS58ySYA61WefxaEpmm3b9bI0wObqwIWVQUUHgEUBSn3zPxYmMq32wnbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by LV8PR11MB8509.namprd11.prod.outlook.com (2603:10b6:408:1e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 07:18:33 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0292.018; Fri, 7 Aug 2026
 07:18:33 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>
Subject: [PATCH v2 0/3] Separate GGTT pools for submissions and VFs
 provisioning
Date: Fri, 7 Aug 2026 09:18:19 +0200
Message-ID: <20260807071822.225338-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0272.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::45) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|LV8PR11MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: 321e9ddf-6219-43e9-6908-08def4541691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: HZXdhqS/qoQWz6F0z+cW57AirSBWvYBcfj5sArFSA//gR60Luj2pyWN/WHBqaRzYvrDuCWWoK/cVl393tGUPq5BdW5ymnAdhEaHQMwYPg/qY3VSVXauhaH+xPTHpf2FHg2WHADt/dxbCqzxUrjKu7ZHt1YHHHDPsB0ugIxZCBaS8SmsYLLJZCq964n49Wxw/k86VBoYo4YctCLr3anNtNqEAMDENPxAq7Ye7pTcjUGgSYMhKpb9kJvQZcdr2G2WA9zhyVq8HnLOR1CNfxxEG3o63Kfmn3TRT5tWubudgACAAc+EM16DaydgUgrAT558fSXkDcpoLFbWeq+oO2NwFkMn674rO4VaxctvKlnx4nhABsfVke36TJxKsUGdz8oQoVpdv+kgO1jXCYxzuyvprxAGVYvMHksKkAtgXpGOOK9nnvgnh74BQjop/F9MvdpFlnNmvqzLu3LJR9vpmZhRQeHwps5j4wxCc+aFPh61peI9IYZPwlOQUzeZzPiPWZ3vJIB+z14InLscJne617gtKEwjkUaILjd4heSfJOacYO28JF3SlKgeFLF64smhErVVibZI+s6zVw/2pnudApb7VN2e3shcD8pFhMR+2HdC3RsTVGpE+1medK2DBcldpARHGyHo3Bl3ZuUwB30Gws0kSSyP+cVEkpneMkxg/SIHvoHE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akJ2RVlpZUhjTVRqVGtiVGM0UFVaMmhReTBjQTF4Q2ZlbHZBM3JqVkc4NHhN?=
 =?utf-8?B?bUJ2eTlqYjg0L3FPdU5mSnNRaHkzZy9SUjBCZDRnVlhGbnNpenlPRGV6dG9Z?=
 =?utf-8?B?QXB6aDFnb01zWUtnblY2dG02cVBJQk5sb255Y3Vlc0RpTC9Qb1BsSmg3cTRm?=
 =?utf-8?B?d2NPV0MvK3A0TElROEhoRUNiRXduVHdJV1hpTVlEZXd2YVAzWEo3UE5kQlVr?=
 =?utf-8?B?Wk5DLzh4dXZaUnpzZDhmYUh2S2tMQmt2OGpJelRQVzhWOVoxZW85cWxhVDdu?=
 =?utf-8?B?cUFUVXZDN0tuRTdJckEycDA1aHVzSlp4L3A2ZzhvcFVMYzc3d2phOC9QMFNW?=
 =?utf-8?B?d2hldVI0c3BIWllzUlN4SWl0Q2ZxcURQZFFKNmcxcFBoQTVlOEJHMjYyTVVo?=
 =?utf-8?B?QTdhNEdNK2NIWDFsakRPamc0M3ZSVXJtRXFtU040YzUrUzA1czVQM3NiQ041?=
 =?utf-8?B?V3BrLysxMW5oYllidWViY2lQWGc4dnVpbk5aeXpkZ2ZYQjcxaGxVOUU3dWJz?=
 =?utf-8?B?SEthRXUwK2VERld1Tm40TCs4czI4Ykd6M05yS0N3TWJTT0NkZ1dRTXVjdmwr?=
 =?utf-8?B?Q1QxdmhUc3BHMEdnbEU5WHEzMXltS1lHMkx3VDZiOGhzTmFTVENKUllPYXZn?=
 =?utf-8?B?RTNLYjBJV1VzeTlFcmdiNW96TEV2M1dKdktzbWhWeGMzOUJ1MHVLazduNGpy?=
 =?utf-8?B?UHczSTRNcVFoekRxL3VlQk5qV3JLMmRQa0Z5MVpOTDB3Rzh0SXBKcDJnbE1x?=
 =?utf-8?B?OWNud3Q0L0V5bG5ramgwQmVuQXpGYlVweCtxLzBKNENXTkhrMlZXTGNsQ1VH?=
 =?utf-8?B?dmpJL0FPelYvemhKbWV3SExnSkYvRllqNGJ2UG1EZzdFc1ZuK2dUZDN3NGNR?=
 =?utf-8?B?UHFBUlI4aUVsREtqeUJYS0RHQ2JFRnhvdllqNkhxcVRNVGJkUEFwdnk5OWpq?=
 =?utf-8?B?QkFjWDB0N2dGWTd2d0JrWXZFeVZUUzRtbzZ4UWZybjJYTDcxeHppcWR0MEla?=
 =?utf-8?B?TGJKY1A4cEhJZ3RzQU5vK0d5MER0dU4vT1FHcGpIMlBhdjNjR1l1RExoelBB?=
 =?utf-8?B?Q2NseEZrUFJSM1pNRDZjTk1BSU9jczRUVmdHdUx0czNIYjBZVjJIN3h3dlZ4?=
 =?utf-8?B?ankwREMrT1NCRkduNGZsclNZTy9kV1lWOTVBMkF0M1BxOExNbU9lbWVhM3Zm?=
 =?utf-8?B?ZTAxbVl0ZVUzcjVZU0ZuenFYbDZ1dVl5S3kwN29Ka0JybXp5ZWk0ODFhS2lY?=
 =?utf-8?B?a05PdWJxVzgyVVEyYUNqbzZsZXhxZTRkQUlQVmZaWTRLY2FvMHdVdk1qYlRV?=
 =?utf-8?B?VldnZmo5cEJqOUdWWUc1Nys5aGtTYWVCT245K2ovQ3pqbytmNFNzSks4RHBQ?=
 =?utf-8?B?L1JFQ203NEdMVWd6enNWTWI0cnJ6MUEwa2l2VXJaOVBPYndOakFMQ2dLeWxj?=
 =?utf-8?B?YXlodlR5SGl6WTlmZDFQYlh1VTZ6RktlSEYzcmJ1UStXdVhhUEdGS3M5c3BS?=
 =?utf-8?B?K0h2dzlJZkJGMUFUQ1AzcTFYbEVWV2FUb214TXRWajZ2R0hmUjZibjNQcXNY?=
 =?utf-8?B?MmxPT3RNTVVkclJGbnMzbDRWUlVaVnJhN1hMQWp0ellsWjZDOVpUYkh3Sjl5?=
 =?utf-8?B?bG5yWjJQTjdKUElrUFVlME4yRTVkM2pSd0FrWmZ5VGFYYmMwbnlaZ2I0U3lq?=
 =?utf-8?B?Yk1FWXRhN3JoTVp4VlJoUDJrQVBvVHVOaG9COGRGRDRRZTJORWhqT3V5bnRp?=
 =?utf-8?B?Nk4zeENMUnZrOWFMczk5amhXMWtDTWRCQnZjS1dUU28zWkhpZmdoVXQ3STda?=
 =?utf-8?B?aEdMbSs1Q21pRzBhL0pBeWY2RTFKb3IvOWRmTHlYQlpxMkJkTzNnNnRYR3Yy?=
 =?utf-8?B?MVdIbWNaUmpRTkhaTVllR1VDaGM5RUo4aEN0L3d0aDlwMHBMWUdHZUM2b1cv?=
 =?utf-8?B?OVY5dHByeDZnSmNobm5SaU1reFIxbWtPZjZ0U2lSSi9zY1M3TlBDS2NCVXN6?=
 =?utf-8?B?YlVZQmNVTFZQSmVxc1l3WENTWVlzaUpJVnZkN2RWRWsrSktyelRmS203QUo5?=
 =?utf-8?B?dXpQdnVxcnFhcE1LcXFhMzFkUXc2ck5IUlhhd3g2cHJnM0hmdXUrdlg2MEIr?=
 =?utf-8?B?M2diZUdQSlN6c0U2M1AxNVVScFpyZS91aGVUTVZ4MkQyS25rejZ2VFJHMzY3?=
 =?utf-8?B?RjR5N3Nickx3ZXF2Zk1yWW5wL21hNExxWHpNRnNBNTZ2b282MDc5NHNSemNJ?=
 =?utf-8?B?Rm4rVDdYLzZuR1U1ZjZmUWc3QkxWcFhzQno1OVM1SW12Ry9TbDhIV2hkUDVm?=
 =?utf-8?B?WjdYZXdMdzk1Q0RVZDR6b3doaDNsd25wTXZKT1c5RThiUllBRVg3dzkwekxO?=
 =?utf-8?Q?xesLkVbvSbIykr98=3D?=
X-Exchange-RoutingPolicyChecked: IdSIaODAxn22jSoWoDMohsWPFQmi+mle8KOCIpT3XXinEc+cfgUH+KmG+lS8caR6hBGdtQBckis8n2X3yECRkrGuF2dvjEGXwd9AOErcOSzoyvdpx+EEytLNjcuM3zKBlDVS/4D2TVNxqtImoT2h2A1gjkPV4NpF3XTYUPv3G6oCZXgs4pSLcDjMOxuavP6r4c5fayLp35wyjqLfel/ME8Oj/pA3H2THLTIovey8oVA68F8ILq7OCBzSdXW/vVqJpPENE/6ut+HHNlSuM9lALErj3enKs5NajPm/kV6ZRGcBXr9MrWOeTYbQ5mH2ZiFaSjMG9RmAcDsjOXiroKZzrg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 321e9ddf-6219-43e9-6908-08def4541691
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 07:18:32.9223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0AJJBq+grNImBq2jwBOdHL6bmXwAhRleqSijqIqDoXX04zS9AjfJHCXH7RSKVS3211ul1Q8SzryP/ge/C1YhXemmAIyuEIOY2zFOtI6fqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8509
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

GGTT space is used both for driver-owned allocations and for provisioning
GGTT regions to VFs. These allocations currently share a single pool,
which does not allow their usable ranges or allocation policies to be
managed independently.

Introduce separate logical usable and shareable GGTT pools. The pools may
overlap, while each allocation remains constrained to its corresponding
range. When a shareable pool is present, usable allocations proceed from
the bottom and shareable allocations from the top.

v1 -> v2:
- Rename ggtt->usable_size back to ggtt->size.
- Remove the ggtt_insert_node_in_range() helper.

Cc: Matthew Brost <matthew.brost@intel.com>

Piotr Piórkowski (3):
  drm/xe/ggtt: Split GGTT into usable and shareable pools
  drm/xe/ggtt: Initialize GGTT pools by SR-IOV mode
  drm/xe/ggtt: Add KUnit tests for usable and shareable pools

 drivers/gpu/drm/xe/tests/xe_ggtt_test.c    | 315 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.c               | 305 ++++++++++++++++----
 drivers/gpu/drm/xe/xe_ggtt.h               |  14 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  12 +-
 4 files changed, 586 insertions(+), 60 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_ggtt_test.c

-- 
2.34.1

