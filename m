Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E24CCD98F2
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 20:30:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE5210E111;
	Fri, 19 Jun 2026 20:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V8Rko9dv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A58110E04B
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 20:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781901004; x=1813437004;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xw1eoV20aATq8yS16hjTkYW+fqDNTiM9JNW7jso6gfk=;
 b=V8Rko9dv2s0WvZyTlKBHEJjzPsxmzr7psw6MQ648EbZte+0DBzemVKuc
 wncCUMc315vpWU2lNKBaLlCUGinNB/sXtYbDFDNx0EfjJ7FOJX84MBoCR
 wpdPlYw5T01dzM5x4KC0PPVDE6vmruxt8niXEN1URH+vS9nFAHNbEfxU5
 0BsGw6IB/HWdKGlLvSCYFO/HL4c59ut1ggu1yROTtGCpbwoEWhEVoyMYy
 TNRC/J5YnOtaIe22TlGCP/axBIcTn4VLDCcXWC3hwNybqxDHp6b1sRpsN
 KapFYfqXYT/6k8eFXKncZpOOZi72yUse4Qe0X9fmbXttrl9iP8ac9RE6c Q==;
X-CSE-ConnectionGUID: ei5EcIbDTziYJuuZ+mAlXQ==
X-CSE-MsgGUID: Jr8MHI/DTUyVRCWIj2uK7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="100176217"
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; d="scan'208";a="100176217"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 13:30:04 -0700
X-CSE-ConnectionGUID: iRenlCF7QWe3b+qx0bbSWw==
X-CSE-MsgGUID: MthVKdliShGRNnp3ERVVsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; d="scan'208";a="250617029"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 13:30:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 13:30:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 13:30:03 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.35) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 13:30:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ya3JgAZEI9R3Ij7sbEfQX5/bLHL/IrN+w0VJbu+SBstjelUk+MXlZXrlE4gkQvqFm0wVsrSOLv6v89AYQFYLJokdlPoFn2sFOdjvP7JhVYVR7agMdWfMHB/Uz/D0tnZJjM55kVff0O+14d4BdrmNTYJtUuiYA+IH579kBr+/gq1zgAGsSVcYteLFRyzw5gK+nxuTOWA1Ln26kGmONuSyx7M5vKCw/MT9cC1uMTiis7fMFtgIUJZcy401mqRH7rlDM099kGQuZpiGj7czf6owlB7eFsxaAI/FQZnQkfHQcxp2jb6MIVI/Vzakji5gFXMvGK6avBwhRBfvasfkWqZUbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ZM73rM/IEuwlHNNKcpDvwH0FBsRYnUzglMe9WK9q/0=;
 b=DefLiCs8I/dc0ypVN0daq8fWMop7pdDz0cjdqzDMR3svNxRWbeGpnYdL4eWvqGU2TpW+CR8NBaK5FlQSumQu0PRQrPFa4P+PH7sx9nv83A8YXgy3cjlsKUpxk28S+gSWsc+CD91/Vwd6eBsaGKSD/OR2GE82DRhNMhcrdSqjr8ZaH5fon11cdR1sl6/pRI3Tp76QL3PhCeOaeCBNcsFEk0SOjfJyODNFMGQ/4xo4riAWI5kBHcIs8NEB0xxZRR+7rSkyG7SYGAiYd7cGyuciJ+VZqlMtKCFA6jHO7KaTqQ67J1OrNI2JjLH/kOIb9hYki28ynPT0QHihN9H+YDMMgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SN7PR11MB6897.namprd11.prod.outlook.com (2603:10b6:806:2a5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Fri, 19 Jun
 2026 20:30:00 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 20:30:00 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v2 5/7] drm/xe/guc: Add start offset support to GuC ID manager
Date: Fri, 19 Jun 2026 22:29:33 +0200
Message-ID: <20260619202935.2701499-6-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260619202935.2701499-1-piotr.piorkowski@intel.com>
References: <20260619202935.2701499-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB8PR04CA0008.eurprd04.prod.outlook.com
 (2603:10a6:10:110::18) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SN7PR11MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: af40e0ec-b001-4c72-0e24-08dece418948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: eEbxkspZSgFuUEaAe9GCJGUH2uNOIF2SbYKqDRtOjufNOQCOcb4Lc440JU63CACcL/z8jPtC+yv1q1UTJyXlKF5EsdVSl8WVyXUFe4WzolhNrAJXvOUTfdNaUylen5wxYHl+TSKR5MUuADKLPsnoaXXkqGuGVSeluPn9KJWnuy0XxMgb46BohuGzsgvdunoGC8+WabEVt78T3FEq1bFYu3HoAy61sJKmzU46gXVTlPWDD2cezz0SW8Zj2fXuSW/Z2Ge8kDCkf95Qld8hQrkpwWosLRnGJFRLXQaW3G2l3LpxU20d1zBGO6HzNkJ7dpti0BtU44r8VTH2BgCEE2qNXoXtLAJrg0naz6pUfw4GH3+dKsCVvCSLPSVRlATezRnDZXCGdbNsznapr3+iVuU06vy16nU8JdBRWJNRx9Sxp5gWSZCZJHXm4FZbzAdnCM6Hrgg726nT3iNjN0/IkSTt1GDEAFs/HG255rShnQP1SW/W8PK9Oppnp7Kd33jDB+qmfnGEwTpcsapZ4F7baOMN9hh8ftkS5m2KG9p68j+o7WtVdtJhPUwEbxOhSB2g2w2IGIhjB1Uym+/CV7l1bjDvWskOaqbvh9OIUFR8EK8p1LTi2Rz2A4pk/0wEh8hltfSdoniC8Hgt6Kqvdg4kskB7KV5pBOdjNFoR+NDXlFuUifQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWZWbVEyazBXTTh3UVdYK0pyR3FJRkFGMlNsSlhFMm9Va1l0aFVOeHJUdzh6?=
 =?utf-8?B?cXRPLzR4S1luaGV3cmhnemNMbU8yaHVyNHdiV1ppNDVlbHRxNzd6cDlYaEk0?=
 =?utf-8?B?Q2ZWczA3elpRVVBkWjBpTDlISHFXN2VGUHhGL0RPY0tjd2lqcWZCT0dpOUFK?=
 =?utf-8?B?YUpib1l3ODl0K01pL3lYUzNiYzhDUGFFbllaa0pwOHBqK1NNbkNpUG9lYjBX?=
 =?utf-8?B?aW5ZbG9zNnRKS3Z1UDBIdGpxd216T2VxM3ZjdGpDV21RNmY1eFdKSTF3STNB?=
 =?utf-8?B?d0VoWlc3MXVRNVJDc3FucnN6NVBaaDJqaDJYSUtLdkVHcXRjZXpCN2JWNFd2?=
 =?utf-8?B?MlVwa1h3aFVSblp4RGpqY1NteEt0Q2NLQ3c5Umg4Q0NiMFRMbXVFOGtncnBp?=
 =?utf-8?B?cEswb1pDZTNraStFUzJYVHgrN1VQc1BPZ0pMUGZKcUV0ZkxmNjVndDJ4Ynpy?=
 =?utf-8?B?c1ltOWw3N05rQkZxSTN0WVdrcEpNb01mK1k1QTJ3TGhsUFhLR0NUZ1lZcW1m?=
 =?utf-8?B?N0M5Vm1NOUxBTXU0ZEtYdnZwa0xGNzcxdUZCdk1qOW5BeVBTbkkrdVRmSVgx?=
 =?utf-8?B?ZS9ubUZlSCtHRHRvZVlDZ2JBcFI0OVE2emZ6Nkh3MFBvamFqaXJRQVJZenJv?=
 =?utf-8?B?NkkyK011Z1pmQlM2bFJYeHh6TVpJVWtzU0Uzd0hSNnpjSXhJMXJWejYvS3BE?=
 =?utf-8?B?SU5nV01YTER0NmFDTWZvWXdwVk5oa0xqb0FvdUxxeThsRnE4WHVWOHZnSnlq?=
 =?utf-8?B?WnZyUjJkdXIwVGljd1BhVVBxaTBqUVhGT0lGSnAxWkVjMTh6anpweld5Ny9t?=
 =?utf-8?B?emdMUGVZU2RGcEk2UVNlUmdvbUx2TStMeXIvRG9QbSt2QTUycXNWSTVXb09i?=
 =?utf-8?B?amphWTFCZXVaQ0orREVZakdtVFpCQXpLWEFXYlUxc0xQcGNTRnQzWmMwWXN4?=
 =?utf-8?B?RTJqZnFOdE1hY1VXUGlSYzNtMzdySzJFbmZSbm5lNW5Zd2xsekxMdTZ2TkJU?=
 =?utf-8?B?cWxrdlVScGxrYVNmamNXaDdIWjFLckduai81Y3g5aHc4Sm1yV3BESGc0SDVR?=
 =?utf-8?B?cjAyVFpPUHM4VjZWSWp4Z1Z6K1gwdkw3RDB1QUdUQjNoWGNmVzJyWGo0QUIx?=
 =?utf-8?B?alZocll3aGphTXF3Y05PVDk2WVBwSUZHd0N0RHJadXZ3aGUwUEp4NDRYK05W?=
 =?utf-8?B?aCsrK0duZnhIekJ5b3hpZXRmTk5PY1NYWmpBU3Z0bU0rZmpCR040SENyRWd1?=
 =?utf-8?B?UzM2djMrbXFoMzdYaTNQQVpISnRhTE51d3BZUkZPaDJrczZUalBVZi9tRGd5?=
 =?utf-8?B?VFN2UUljZ0cvVDRTSGVvL0xoUy9CK1RHa1IwNWE5cE5SYWlxcHQyMWY0UGxK?=
 =?utf-8?B?Tkl2am5IQmRodldXeU54cmNDdU16N29OcjJVdWsxRUNheWxOSXFWcHZCTzFw?=
 =?utf-8?B?L0pncURMY2dpenFKb1VpOW5vOXVmbk5pL3RwUnVDZjZVeERkV2wvL1JENkg0?=
 =?utf-8?B?YmZUT1BsOERVWUhqY3djWGVGV3RmNkhVSnRTdEdwRUk4WHM3QkRjQjZxdW5L?=
 =?utf-8?B?KzRQN3h4NzdiS1JQa3lvbTVqVjd1QW5zWWtzU0dFd011Qnpya3hkcWIxd1hM?=
 =?utf-8?B?dmhvMHZseU92d01LV1ZYaU9qRWtsTllqY3FhbzF3VkM5RUlrUTNXQzZtWnVv?=
 =?utf-8?B?YWEyVEdjRVZWUUVMbnVYTkJYeHA0dittSi9zY3o4Ym4wZUZFYTM4MFNQSVNo?=
 =?utf-8?B?bG4wOXNRZlpaRVdieWpFVkFCcW0vblVvMG9qa3lzTm4wcUpNS09sNDdQLzYv?=
 =?utf-8?B?V1h6aHkwVUFnUmU3YmNTU1Yya3o3TEZra3pBZmc5SmwycWNhRTQ4Mk11dzZZ?=
 =?utf-8?B?czJNNmQybHQ0d1dNNi92ODFYTEo4amZESjhDQStnSTk0U2diSlkwc0tKL1BI?=
 =?utf-8?B?cUNLc2xGMlEvMFV5cnU2NDZJbVc4TEdpanpGUXo5QlFhdjNFOWxwbmlRZ3hF?=
 =?utf-8?B?SDhZMHZrM2xHMS8zUkZmMjBMYmNIN0J5NTNlV014d09OTC9DT245YVRRMlJo?=
 =?utf-8?B?V090UUNHQkhqb3RYUDlocXpCSjB3bFgvNjFIYWZKaEdSMFJiOUo3RDBxU0E4?=
 =?utf-8?B?dDVBekRJSk8xanBnbDFzRHpFMzVmVVAveThuMHlPbENSZ1BaQ0FoV1RMeCts?=
 =?utf-8?B?emdtUkZlUC9QWkN3c3JrRkJmVzArU2RxVTFzUE00akZqS3JNMnl0QW1oSVBI?=
 =?utf-8?B?U2ZkazBNdnMwNWhPbGtNOXgxV1JGYXp1YzQ0S3VtdWlPL014ZVhqNEYxZENx?=
 =?utf-8?B?dGl1YVZHRVlrbFo5UUlYTmZOVjlpZ1hMWFFrRG13UW14eDh1MGdJTHExeEtq?=
 =?utf-8?Q?CcvUuwo/vYaqVRug=3D?=
X-Exchange-RoutingPolicyChecked: BJF1duzQDIp8427nlC5WwBnxJEk1huBN37go6KyoOvPOfshlZGB78CnrnqKpjP1B514eKsthXyOeYvB5okZLYfu0IsS2Bj7nXLBDG5mq/g+UN9UOn9zVwrEIEUijovBR0bTBu0atLS273od5O7bL6BQd85AIYp2WKjF4F35Kh8j5c4wrg5WXNB0EVqStuK9R1L93lclByh6F20imLKGYJETEH3C/7RhLhD243dAhQjpjefi2FTOt5PtypKzr3Kt4uMgs52eX7qOFO3nnDO8WFylRlCTzOlR11azVTZ14dVQh1M5h5JIS8jgfFOExxh2JiCe5RGPPO0qveczwejhLhw==
X-MS-Exchange-CrossTenant-Network-Message-Id: af40e0ec-b001-4c72-0e24-08dece418948
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 20:30:00.5757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NiZqrZq505f/wGYAwq64pvuUoqkW3y+6O4oXSoitaBkxR5BoMQ9j6FW3rvyCnZVBlckSv7MapqZ47Xk1wq7t1hWnSszUrJ2zJMYrifmHYAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6897
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

Add support for managing context IDs starting from a given start ID.
Introduce a start field to the ID manager and update allocation
and release paths to operate on IDs in the range
[start, start + limit).
This allows using subranges of context IDs instead of always
starting from 0.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |  2 +-
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 41 ++++++++++++---
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 50 +++++++++++++------
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |  2 +-
 drivers/gpu/drm/xe/xe_guc_types.h             |  2 +
 6 files changed, 75 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
index 8f0be29ae9e3..89d4e1d0eda5 100644
--- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
@@ -105,7 +105,7 @@ static int pf_gt_config_test_init(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
 	KUNIT_ASSERT_EQ(test,
 			xe_guc_id_mgr_init(&gt->uc.guc.submission_state.idm,
-					   &gt->uc.guc, NULL, ~0), 0);
+					   &gt->uc.guc, NULL, 0, ~0), 0);
 	KUNIT_ASSERT_EQ(test,
 			xe_guc_db_mgr_init(&gt->uc.guc.dbm, &gt->uc.guc, NULL, ~0), 0);
 
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index 4e4b1c890000..cf533e7b1961 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -28,9 +28,9 @@ static void bad_init(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 
-	KUNIT_EXPECT_EQ(test, -EINVAL, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 0));
+	KUNIT_EXPECT_EQ(test, -EINVAL, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 0, 0));
 	KUNIT_EXPECT_EQ(test, -ERANGE,
-			xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, GUC_ID_MAX + 1));
+			xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 0, GUC_ID_MAX + 1));
 }
 
 static void no_init(struct kunit *test)
@@ -51,7 +51,7 @@ static void init_fini(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, -1));
+	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 0, -1));
 	KUNIT_EXPECT_NOT_NULL(test, idm->bitmap);
 	KUNIT_EXPECT_EQ(test, idm->total, GUC_ID_MAX);
 	__fini_idm(NULL, idm);
@@ -64,7 +64,7 @@ static void check_used(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 2));
+	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 0, 2));
 
 	mutex_lock(idm_mutex(idm));
 
@@ -86,7 +86,7 @@ static void check_quota(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 2));
+	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 0, 2));
 
 	mutex_lock(idm_mutex(idm));
 
@@ -105,12 +105,40 @@ static void check_quota(struct kunit *test)
 	mutex_unlock(idm_mutex(idm));
 }
 
+static void check_start_offset(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	const unsigned int start = 16;
+	const unsigned int limit = 4;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, 0,
+			xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, start, limit));
+	KUNIT_EXPECT_EQ(test, idm->start, start);
+	KUNIT_EXPECT_EQ(test, idm->total, limit);
+
+	mutex_lock(idm_mutex(idm));
+	id = xe_guc_id_mgr_reserve_locked(idm, 1);
+	mutex_unlock(idm_mutex(idm));
+	KUNIT_ASSERT_EQ(test, id, start);
+
+	mutex_lock(idm_mutex(idm));
+	xe_guc_id_mgr_release_locked(idm, start, 1);
+	mutex_unlock(idm_mutex(idm));
+
+	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_reserve(idm, 2, 0), start);
+	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_reserve(idm, 1, 1), start + limit - 1);
+
+	xe_guc_id_mgr_release(idm, start, 2);
+	xe_guc_id_mgr_release(idm, start + limit - 1, 1);
+}
+
 static void check_all(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, -1));
+	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 0, -1));
 
 	mutex_lock(idm_mutex(idm));
 
@@ -129,6 +157,7 @@ static struct kunit_case guc_id_mgr_test_cases[] = {
 	KUNIT_CASE(init_fini),
 	KUNIT_CASE(check_used),
 	KUNIT_CASE(check_quota),
+	KUNIT_CASE(check_start_offset),
 	KUNIT_CASE_SLOW(check_all),
 	{}
 };
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index f1e69650fb7e..8eaf2ca46f37 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitmap.h>
 #include <linux/mutex.h>
+#include <linux/overflow.h>
 
 #include <drm/drm_managed.h>
 
@@ -54,6 +55,7 @@ static void __fini_idm(struct drm_device *drm, void *arg)
 
 	bitmap_free(idm->bitmap);
 	idm->bitmap = NULL;
+	idm->start = 0;
 	idm->total = 0;
 	idm->used = 0;
 
@@ -65,10 +67,13 @@ static void __fini_idm(struct drm_device *drm, void *arg)
  * @idm: the &xe_guc_id_mgr to initialize
  * @guc: the owning &xe_guc
  * @lock: mutex protecting this manager, or NULL to use an internal lock
- * @limit: number of IDs to manage
+ * @start: first GuC context ID to manage
+ * @limit: number of IDs to manage; the manager handles the range
+ *         [@start, @start + @limit)
  *
  * The bare-metal or PF driver can pass ~0 as &limit to indicate that all
- * context IDs supported by the GuC firmware are available for use.
+ * context IDs supported by the GuC firmware starting from @start are
+ * available for use.
  *
  * Only VF drivers will have to provide explicit number of context IDs
  * that they can use.
@@ -76,7 +81,7 @@ static void __fini_idm(struct drm_device *drm, void *arg)
  * Return: 0 on success or a negative error code on failure.
  */
 int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, struct xe_guc *guc,
-		       struct mutex *lock, unsigned int limit)
+		       struct mutex *lock, unsigned int start, unsigned int limit)
 {
 	int ret;
 
@@ -92,14 +97,21 @@ int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, struct xe_guc *guc,
 	idm_assert(idm, !idm->bitmap);
 	idm_assert(idm, !idm->total);
 	idm_assert(idm, !idm->used);
+	idm_assert(idm, idm->start < GUC_ID_MAX);
 
-	if (limit == ~0)
-		limit = GUC_ID_MAX;
-	else if (limit > GUC_ID_MAX)
-		return -ERANGE;
-	else if (!limit)
+	if (limit == ~0) {
+		limit = GUC_ID_MAX - start;
+	} else {
+		unsigned int end;
+
+		if (check_add_overflow(start, limit, &end) || end > GUC_ID_MAX)
+			return -ERANGE;
+	}
+	if (!limit)
 		return -EINVAL;
 
+	idm->start = start;
+
 	idm->bitmap = bitmap_zalloc(limit, GFP_KERNEL);
 	if (!idm->bitmap)
 		return -ENOMEM;
@@ -176,25 +188,31 @@ static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm,
 	bitmap_set(idm->bitmap, id, count);
 	idm->used += count;
 
-	return id;
+	return id + idm->start;
 }
 
 static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
-				     unsigned int start, unsigned int count)
+				     unsigned int first_id, unsigned int count)
 {
+	unsigned int bitmap_pos;
+
+	if (WARN_ON(first_id < idm->start))
+		return;
+	bitmap_pos = first_id - idm->start;
+
 	idm_assert(idm, count);
 	idm_assert(idm, count <= idm->used);
-	idm_assert(idm, start < idm->total);
-	idm_assert(idm, start + count - 1 < idm->total);
+	idm_assert(idm, bitmap_pos < idm->total);
+	idm_assert(idm, bitmap_pos + count - 1 < idm->total);
 	lockdep_assert_held(idm_mutex(idm));
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
 		unsigned int n;
 
 		for (n = 0; n < count; n++)
-			idm_assert(idm, test_bit(start + n, idm->bitmap));
+			idm_assert(idm, test_bit(bitmap_pos + n, idm->bitmap));
 	}
-	bitmap_clear(idm->bitmap, start, count);
+	bitmap_clear(idm->bitmap, bitmap_pos, count);
 	idm->used -= count;
 }
 
@@ -276,13 +294,15 @@ static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, i
 
 	lockdep_assert_held(idm_mutex(idm));
 
+	drm_printf_indent(p, indent, "start %u\n", idm->start);
 	drm_printf_indent(p, indent, "total %u\n", idm->total);
 	if (!idm->bitmap)
 		return;
 
 	drm_printf_indent(p, indent, "used %u\n", idm->used);
 	for_each_set_bitrange(rs, re, idm->bitmap, idm->total)
-		drm_printf_indent(p, indent, "range %u..%u (%u)\n", rs, re - 1, re - rs);
+		drm_printf_indent(p, indent, "range %u..%u (%u)\n",
+				  rs + idm->start, re - 1 + idm->start, re - rs);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
index d0ce8ce85b7a..168c5b8d3710 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -12,7 +12,7 @@ struct xe_guc;
 struct xe_guc_id_mgr;
 
 int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, struct xe_guc *guc,
-		       struct mutex *lock, unsigned int count);
+		       struct mutex *lock, unsigned int start, unsigned int count);
 
 unsigned int xe_guc_id_mgr_total(struct xe_guc_id_mgr *idm);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 154d6129ea44..22fb4e8ce6ce 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -312,7 +312,7 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
 		return err;
 
 	err = xe_guc_id_mgr_init(&guc->submission_state.idm, guc,
-				 &guc->submission_state.lock, num_ids);
+				 &guc->submission_state.lock, 0, num_ids);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 717cac854724..5fd50961d9da 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -60,6 +60,8 @@ struct xe_guc;
  * is initialized and used.
  */
 struct xe_guc_id_mgr {
+	/** @start: first GuC context ID managed by this instance */
+	unsigned int start;
 	/** @bitmap: bitmap to track allocated IDs */
 	unsigned long *bitmap;
 	/** @total: total number of IDs being managed */
-- 
2.34.1

