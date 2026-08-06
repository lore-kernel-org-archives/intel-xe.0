Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DB9C56208
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 14:17:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 008AD10E261;
	Thu,  6 Aug 2026 14:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RxnJ5OrQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F4F10E261
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 14:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786025818; x=1817561818;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Yv6WGu3AqwgwUzaZTXyT+fYI2MmlxltQWi08LagTwZY=;
 b=RxnJ5OrQuoFLUiQe0g0vTOTa9rT8tcznPqB1Sin0GMUXnU2MmK61CqX9
 w/j5LnWMcFWWuQ7y9L07lEGvIHgDTjGBhM1vDOJtGyezM2fcJH4djGNDC
 5iY7zNxCvkWSgYZbQnA4K7z1onYWw5YC4OZxeHpW76kzAVgM8rZZJH2qR
 BDO5mVUGPonp6mTKmx6o54br0FNslfm+I4bgsT5J4zDo6L+ZEzexTNa9p
 KULys4aP2UyrLPVOvfgrHPRkWfgb+a9NiuMtLKKy9ZK3ZGsJOJNjpHKTG
 RCm6W6ISM+rWqaQDw5orJWBwfsaKhVXg+Z9atPTV9IZxYtdZxPKHDh0xv A==;
X-CSE-ConnectionGUID: zrsxgPPKQMqWhuP3U5GfRQ==
X-CSE-MsgGUID: SlBvFzTRSWuSMgLObsEeCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="90439224"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="90439224"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 07:16:58 -0700
X-CSE-ConnectionGUID: UWHw9piVSFqVWHbp8LJYQg==
X-CSE-MsgGUID: M7t+hW+ET4iAUtG4vhWGUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="262195623"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 07:16:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 07:16:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 6 Aug 2026 07:16:57 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 07:16:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPSuDKu163WxTtA3kbI//xOfMJtzkeJxR1ud35Cs1lyyJGPq4BQq5aUKCgPslEBLpzO9UoHUXywLSMtED7EyCVuBxBba99Ehq9aD8cWd+Shd/GBnRPb4aIEbZaABgXYJ6b0/Fgj3P00/Rky9AGG2PCdraLpAh0KnItqqVLlVc16rIfNTs+KKZYIC83qT0ccSiFiqVPERjZAW7yuCGMCFfsV+TQTbDkCN9txfrK4HJz51Zjrsw8Skic/JEs3fBtLkfWIw5/KaSejmFh3e7zEKNJX29IG3slAzN9+YYpvNknmmc+I8jovELkiQ1llZ16bHQZfGEvjBg/9E7w6ejSRSiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xznyfyKeqm27XWfgTtela2rU4Ol/gDl8OgHaFRjFiZ8=;
 b=CQo23dMCFWvR6gWDrfsz4MIP+bcdPn0oigaiJYrJ6Vr56av37CWQPesPfoLTXjvQS5EsBCKLJpYNJdQyjo8eYwy4KsqlNr8PE/ktkMVFsbR7TfjxEwJajmzh6eS4M3h5Z9swfS3Ks0JzCACy79IPiAVuEBYP0+NHUR26GCvw/cBuLykZpj/K74YElRZy6r+3a7UbcS/Tq+EMaNqDrkVZdQAFlPw25oBVTHqTqNC89tuQmaW/+9lxez2AcxulTn3zpxYPdzfiR/aVq1vQrFfcIWgeIXQT4uAGzmZ5i2KRwDdq9ZsLxm9yiJTb7Ig6P5HWiVB/J5RC82nMxXnF3jOF0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH7PR11MB5914.namprd11.prod.outlook.com (2603:10b6:510:138::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 14:16:55 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 14:16:54 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 0/3] Separate GGTT pools for submissions and VFs
 provisioning
Date: Thu, 6 Aug 2026 16:16:37 +0200
Message-ID: <20260806141640.186830-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0293.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::28) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH7PR11MB5914:EE_
X-MS-Office365-Filtering-Correlation-Id: bc7b39fd-fe2e-423e-a69e-08def3c55e25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: /Z+U/BTCekEhfHXc0bvAAskqf1dfowT1+mFdy2T7K8QTu16CLyl/+1yL5Hfj2ZGtcOFCt3SzH61aA+GjyBKdw2rk5OZHlWkpCnbGGMNIZmo9VnIX7H61sO6YOZMLKPUxvLLGNimAGi551P5fLKeNQyx6zjubE9OtIBrjValg+rSqfn2NevRZ6+neFYG38HW7bwzd0fwKVsre8F3sYu+pHcGCla9ZvpPkeSWbsfG6E2P/jq7p5A/eqMSFe5soKdIwC/5RPC6Qag11HWDA/8YR7XJyjMaPmN2JmfW51o29MJ+vll5zrJ7dRBWfMQbyFE65VaoOt6loRpvesbH6O5gley/4z9wXSZIR/AOycxdG/y5YloJ9U/5SzP7diVqjsK50/C+cW/CVjk5h626Y63Y0stbRkAALojQ+jvBPLaE/3vhygvrox1bh3z2GO3ji4BsCutjbTyoX/eD9msRQAswLp40UT504VAc7PD8Fh/lNk8+tlRSqM7x1cqdbJbvQfQGyVGwAMzvtzce5Vgyqs3mh/I/x7QioA+wWJQqq3N/vlC6Se3MWW1JR9allYCUFAopiCRej9H7bk5lUmUf5BkNLb1562Zeaq/37dp0gHPOmVEjtwejScl4ZhUOTQ0LfZLFlP3q9RUqaD1aUC+ODPnx5o0yz64ZDji9EP545hylHu8A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2kxQUNIVE93RlFXTk84ai9xL1FMVnBFdGdpdkNtN0VGS3ZNQ0xveEpEdTQ5?=
 =?utf-8?B?eGtUYzRvcFVKMkc3U05rSmNzNmNoRkhlSnErSU9pMzBlTUVMZzIvUWdRMGQv?=
 =?utf-8?B?Sks4Ykd1dTJKUlcybXVnNCsxRzd5aitsVTE1OXI2ZWhRbjBjMlFheHlyOWJj?=
 =?utf-8?B?N2htd0VNcG1CeGxvY0dYcTRySGFKenYyd2dWdmhnbUN2WDg2dVA4UXJrOTZN?=
 =?utf-8?B?NFJqNm90Tk1ONzZXMTh0YjRBQkZ1ODZCeGZzVng4Q2dXMnBsVVdVd1pNVkln?=
 =?utf-8?B?QnR3ZDhVRkFkaXhlQ3M3UEE4d0JveEtiS3hYSE9wK0EvL2JvZEEyclN4WWw3?=
 =?utf-8?B?aG5TeE0vdTFuQkUyZkpPSlgyS3BxZ09qclNtR28ySFYyQTE0NnoxSUJ0ckR5?=
 =?utf-8?B?NlFTRFFXRnlncVhCd2toaWdlRExLcFNWSXhucmJwMUN0WE9aZmk5bGw4TmRL?=
 =?utf-8?B?aEZiRE9mWjlHMUVqU3R5V0l5S0ZZU3FRWDVaakdueHVBeUR0bENud2IyT0I2?=
 =?utf-8?B?TEEwZVpoaEhHcXVyUUFzV256RXdJdUFBZEQ0SjNqWkFBT0NjelhQOHBROEo3?=
 =?utf-8?B?cjU2YSs3dzlkNVhqbTFRYnpjb2RiOW5IVjlqTU9qWGdRcWk5L0hkQnVuQTRW?=
 =?utf-8?B?VzBnb0twOHEzekpORDNHcVdMWmQ1Mm9XNzdZeFpsc2JoUi8xVjhibGJkQmFp?=
 =?utf-8?B?NUtQOERPdmZkOWpRanQ2QXVRZzJGaStnSlJhK0Z2VVUvUzVNWlI2bENhbFNK?=
 =?utf-8?B?bW03NjlQaFp2eHVsWjFCZ2FpN3I0YXlFTDg3dVlmV0hncXZ2Nk9CVmxMN1Bt?=
 =?utf-8?B?c3VSTm9aTG13bVg4Um44SDZRZlVCbVRsTzZkQmR6WlM4QXB2TEJKd2xtL2JZ?=
 =?utf-8?B?S2V2bFJudWJLSjRTd0xDbE5NdnB3ZlF4NnBlcWlROTlmOXh4NjF2dVJnY1Vp?=
 =?utf-8?B?V2ZXNUJyNVo0YitMVVNJMjMxVkdIOVpmV2Y3V2hwNVVqNDFadEJyRDhGakhD?=
 =?utf-8?B?ZkJoWlNrajk5cXZoZUhrbGFhZnJKbGprSlVQN2VQVURnVHRFbTMraUlxaVEw?=
 =?utf-8?B?NjFmVEV4Mlk4bVhBZnJocnVSRDh4TUhtczYxdnFDMHU5QXVSdm5LUkt3bG53?=
 =?utf-8?B?YlJEdDI1cDgxR0xpOGhNOGRxWXpTckZJQ0hpMzJxRUQ5Q1JNQ0RoeVV0a2kz?=
 =?utf-8?B?MldiTFJKbHJrU2l2bEdIaG1WTEhPMlRuaTVJRnBIV1ZvVStEVkVTdnUzUFU5?=
 =?utf-8?B?V1lrMnB1clFGemswVkR6SG91ck5rc1JpMkhCa0JaZjlUZndRY1NibnZad1R3?=
 =?utf-8?B?UG1sVEhpaFdLSHRLM0NoNytHeHlHQXRLZGhLeEdOTlhJODFrMXAyZVZua1My?=
 =?utf-8?B?Nk4yeGZLSWs3VFN4amRSQ0xzaCtDNXR3VlY4eGxVelZFbEI2SU1JWHZzV2E5?=
 =?utf-8?B?Q1lwWFZlRnAxdGtjd01pbk4zRVRsM09GcUJvYVVCYlZaZWYxL2VLS3NEZzMr?=
 =?utf-8?B?U25lRTMwN0NSSmp1RjdvZlNPcjBYQVZoVnJ1bzNVdVdsUkJXZ2xKeWFEcEZK?=
 =?utf-8?B?eEQ0NFZjYnF5UmJXbnluVE1YY2UwMDMwWjNnRzJEMjYranlyeUY3YkVqdDZT?=
 =?utf-8?B?VndxbzR1SXZpWHo3ajN6cWN4NDdnRUFhaTdLZlU1Q2hGS2F2K3ZtSnZGeEZM?=
 =?utf-8?B?OVVxNEtFWks3L05OOVlHNjZqUlR6OUdyTlJzSFY0Z3RXK3NVV0lVZWh1ZU90?=
 =?utf-8?B?dG9CRmo5U29hQjB4UW1GZ1ZsR3c0L1Q0MjQwVk1UQmpRZURPV3BFcUJzL0NR?=
 =?utf-8?B?S25JM1lFTWRnRWFPT1RSTUtDUVkwOGJrbVFhYjBzTWZieFNtL05QRGtkT1RS?=
 =?utf-8?B?b0ZKUGtocUl5YUIvSkRxL3pwNmo2Tk9lSjBOR3VpeXVOck5LZEFwcmxkRXBu?=
 =?utf-8?B?eEtyUVJYUnZVR2lyblhnbUwwRGMwSytYdlVUdkorZWNUa1IwRnl5NXJIUEY0?=
 =?utf-8?B?dFZhTlJkY1lRY3BmSDFFK1pOUnMxbGN6djNkdEFJbnBuYVVpcVIvMHVvZG9j?=
 =?utf-8?B?OFd4RCtRNGRwRXJndmwydndDMlNIR2Z5MFJWVlhSSk1KZFZCTWNxeFhWVVpS?=
 =?utf-8?B?NUhQWUJOWHhiQ0RzNjcrK1FjdVZRQkVFZU1HT0wzb0hTb2FxSXo4RTVyNzl2?=
 =?utf-8?B?b05iMG9ZS2srUHBNR2RrMDJyUjlVSldDS3c0a3hmWVVncDhnZmx1NzlMWGJG?=
 =?utf-8?B?U3drWUZvZXNFb1BDclByblowWDZvbkcwVFVScUhzU1BxSlF3MUs1SlVnQ0dF?=
 =?utf-8?B?VmkrdlZCTFN6MFVwN1BmbEp0a1l6Q2QvSU0vTkk2Y2s2aHphL2JzOTFwL1VL?=
 =?utf-8?Q?1JYTLwNI4RmldEgk=3D?=
X-Exchange-RoutingPolicyChecked: gnu0KNmti/wmsU5LPOZMKP6Lf8y+s9hZfiY4LTda4sxsL7UImX8uvk0QNPVs3bzUIEEqyXT3FqNfs/6Bon8kuqf/R/Bca9yujpaWVrmwp8ArzNOLDDRy14gdTXCPhx1yjqO5cscwizUTK/K8F7dlm09v6ZRZ3IukU5rB07p5cMGQ382lYFEBCn/c/pJCWcf0wHhMeAKn3WMZCtpWfbt13xKAzV+1jAMUTRrygx++aQYMQ7qY6BTuCFOIOE9NQRCp66mIEOnMdgbYCYbiBAnhaAD5S/Vw1piP4o5+HURkfIdotGQTmj2RcUWMXogZQolbY6Q3M2RwB5qCeCwwaP/emw==
X-MS-Exchange-CrossTenant-Network-Message-Id: bc7b39fd-fe2e-423e-a69e-08def3c55e25
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 14:16:54.8976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BRwo1XfzTxOkHpruu/ElxUU/g4mgpUYA3VsLTrNy/7Mk45FkdGA8UW+X0jYe73Cs5Jm7cenY39LALgMdUkAM83jevkLdCILGoIltYDcs1BA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5914
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

MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GGTT space is used both for driver-owned allocations and for provisioning
GGTT regions to VFs. These allocations currently share a single pool,
which does not allow their usable ranges or allocation policies to be
managed independently.

Introduce separate logical usable and shareable GGTT pools. The pools may
overlap, while each allocation remains constrained to its corresponding
range. When a shareable pool is present, usable allocations proceed from
the bottom and shareable allocations from the top

Piotr Piórkowski (3):
  drm/xe/ggtt: Split GGTT into usable and shareable pools
  drm/xe/ggtt: Initialize GGTT pools by SR-IOV mode
  drm/xe/ggtt: Add KUnit tests for usable and shareable pools

 drivers/gpu/drm/xe/tests/xe_ggtt_test.c    | 315 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.c               | 319 +++++++++++++++++----
 drivers/gpu/drm/xe/xe_ggtt.h               |  14 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  12 +-
 4 files changed, 597 insertions(+), 63 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_ggtt_test.c

-- 
2.34.1

