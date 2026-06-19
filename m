Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEBFCD98F2
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 19:12:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4C710E11B;
	Fri, 19 Jun 2026 19:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GPGjTdpk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8F510E113
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 19:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781896318; x=1813432318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=k7GeUb3N4ufHBl8Qp3uTzLv5UDpacvgReQhKpM+qIOA=;
 b=GPGjTdpkzXqD4h/3LjbV3WAOlgzdObFf4OoPICzaj9nRC4eoYixzxMUT
 nhOXQCvK9fLSCzqSKSdayBH70KDLpWhqqmsIgT1qKaRWeA06WA+jRenS8
 aSJ85jBDVU/N6Q7S0HzdaxV7vGswxCXxh4++1Osr1RdTaqvbP/J7l7/Bu
 lYtomCZUqm5zOBEwXqqs/aEvodxwS2ZhIc8/byiAw/ts+vDLakwJQo7ko
 ZAnfksTA+qI5VeOy3RznYi1yJ5ShdiL8BrTGAZxq1e+LXF8UmL0ik+fWL
 2s8fDknG2L12VYlKY2TYX+MbborUkj25n/JSf5yI/6GjA1qXOSDAwnafW g==;
X-CSE-ConnectionGUID: SZaovOOcTbqU1k30Co6vgw==
X-CSE-MsgGUID: ztW8+IKlSQKucWn2aGhpGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="86585362"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="86585362"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 12:11:58 -0700
X-CSE-ConnectionGUID: MM78XadWRuSiADGeQDYxRQ==
X-CSE-MsgGUID: MS8IAL4dSC2Zyx8avlJfVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="272386597"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 12:11:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 12:11:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 12:11:57 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 12:11:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q14is+wBEFv4O2WsJFpuaY7QNNj2mSKce11vnuwjVm544aeqIFSrupwSE7N5Kb0FW+1EH2QhfdPMYMdRuPOQsmN37lJhSFMTBMIAhWsX3NgoydKDC77LqAVRPVN3j25r+bK5zj7cD7iIfCcbu2uHcxnoyzZJGfdPzub71R2yIcklRB3mCtJiRJRdsYvdWkk6KKYPXp7aDWRsA9uLAtKz44OXcva2jSaRDmIHQhdHesL/twkrMkKAqkYk53AvTsYPBjoX78zWJKbJ5IeiK85nsspyi8gslSFvvZpuJvJmzl1WBwaiA0XjB9FBShnhEUQzP6XTncK6MktuQkRDM7bN6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgQ/ITpiqBXRPMumtqNkb+rAdxmoULQKXu/4ESIyaG4=;
 b=lgVMBhYX+TvxdKnDE88o41wE7FEPEJdEYgQ/v5ILZJnino4lKuAtQlGfWyf5WDELQM4so008uZfKdJtq58iXuyT/WxDdMTvRIbRf+F3ZbhnAa1/xrmMexnSlwyJscK9M9wI+10NZ/NSqsM6Nf6wCg9Oq1KaMj9MFNlEkgQd/JGIG6pgBZaWeI00/okqafaCsayHmaH/n8pjaQkJe3HUqMX9KXpE1XshpryKxXTIClcnQVP+Gd+uwxHsk2AuFt5vEu4u9rdeKibDGy9dt3T/Q8SopwTP0jIXcYTGsn8WCQribX5tWe3y04t+nKQ+qSrKZl5JhHWFp0f1j9pdI8IJ1Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Fri, 19 Jun
 2026 19:11:54 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 19:11:54 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v1 2/7] drm/xe/guc: Use DB manager to get total number of
 doorbells
Date: Fri, 19 Jun 2026 21:11:02 +0200
Message-ID: <20260619191107.2628783-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260619191107.2628783-1-piotr.piorkowski@intel.com>
References: <20260619191107.2628783-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZP191CA0012.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::6) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SJ0PR11MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 06eb25a2-f5f5-4287-f846-08dece36a003
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: YmL0LZZggkRbhHxo2XML5LpTGXm757TC2jNXkuNk0FdObZjheNrCES2iqoyZt4Q868k1O671wPJZ3YipfsWlmH6zl6xrdBr804E+e8gJSVeKrWhdj5OhccNNvrOY403CaNHOedDZ+QKX88NHgqeio4Te7ZjqoOrVOjvozWb0zqA94Fn/ms7GGN8LAK6L9FnOFTFG22zAh5bz8xw720M6MOawUQWJeJ1N5YSJwlTgW6J5tsO+H5o/yGKf9DIhdiL/kj2xhDK+XcEiY/YKB2ef1rCuJ9N6sFhEzdqX2eYMFMzHQaU1AQIy53IsoOQVu2Q1TVsAOrL2EXOjB6fYiDPnMx+svngyQr3Zkil3Iu92JUKxwle1fPG762PNWh0oIaFXp14eFx2DfHAIlEZibu2BKNrELbZnTRmJPsgv81y4lxJgo3UdD27DYQSY8BQ0praYC/ru5mA18MjkV7J82BM6vYou4n2RHdMuEbKEztUMPZ0hIzqhc1DRIGBulMEz4Oa6cHSETh5FghiVJabjuaVR3ENmO+Lfcne/7JG2aoslmoL0HztDPc9H2/atCF8Jz0fOIxHqV74q5z1NQd9jjaKjNeULN51V6/bjySsy923zmHxRvy8mlC5hKrBJD8c5GMzloD0b3PtKTqpOSto3BAmPsJHlDylnLdNXojwhbLtHvKk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UW9uZkZiNXBVYXM0L2dmWWhjZXA2YlRCTm0zMDlKdUY1NzFrNFVReUdJY0Iv?=
 =?utf-8?B?WXBFKys1NE9FaHFqUXY2ODhGZC83ZVYvTDd6MXVITXlISmlCOTRRQ2dtb1Bu?=
 =?utf-8?B?NU5vUFlwWXBqK0ZIaGFPbExjbWxjTXpURGZEaEVMMTVqcnlzRUp2dGEyeVNh?=
 =?utf-8?B?YU84VlRCdkFER0M1VU1Odmo1VVZWajEzZm1aUFdHc2Rpcm82akdqUXBoWWU3?=
 =?utf-8?B?d2ZtT0pyRW9rV1ZzUkRXanhmWFJoVDNjWEVsK09pT1RhczA1emdYak5YWXBP?=
 =?utf-8?B?RWp6NkRrZVhjVWpIb0NscUtaRVQ4d3hIb3pjd21zaEYvK3ppeEFsVEkxczVD?=
 =?utf-8?B?V3VIYWVWQi9BSmoxWm0xSVRaL293MDBmbkVPL1JXa1VDTmZaTzZGWGtGUW5s?=
 =?utf-8?B?NzNScGluM21oNWk3WjFVT3gyMzdHZTcxL0o4cHNFdmVEWE1mWFNUZ01sUnZ3?=
 =?utf-8?B?ZUdCVDVTcDVSazlHeEd2YmhvbE5URDVxT1hTVy9ZMzVaUnRCYTAwaXBRLzM3?=
 =?utf-8?B?NC9LNFV3SXJ1Zk5tMVZXU3hwOFUrTEp5SVMrc1o2SG52b3FOdHpSdzFkczJv?=
 =?utf-8?B?dTR2blMxR2tEMXN0ZUY2Tlk4RURjK0NyVkw1cFlUenFqeEpPbFFqZTJiSkJ1?=
 =?utf-8?B?SDh2NFJtTU8rVWc1eUlxSTc3NmozcVNEdUtNaUl2RWkrTFk4ejhwekFNY0t6?=
 =?utf-8?B?eGw4WWFwTmhJc2hMbEJUVFJrK3RQYzJBdS9YSkthRXFtdkhIUVZuV3hzZCtK?=
 =?utf-8?B?UnI1dWU2NndneG5va0lhRXBHQ1Q3ZGl1RjZaYTJPbldNUFpiaFg5WUYzWVZC?=
 =?utf-8?B?K25YTGd1eHJBc3Z5ZkVWVmR1ZkI4SVY3K0ZoYUJEeFE0ckhXVTNNM2FGbkI1?=
 =?utf-8?B?YXExT3VmSnJrWlAxR1dNS2RoNmxKcUE3TkJ4endhL1JTdHBtQURvbjNIRnNp?=
 =?utf-8?B?Q3pBYmJjelQzL0FMa254ck9BRHVKSzhLd0RmZlhkVTZsSTRuSTM3YlJzd2dx?=
 =?utf-8?B?SmtHZjhxcHUyYWNMQTAzbDVOa3YvcjFQS1RVSlcyM1lpaCsybGpLT2Q2OEZl?=
 =?utf-8?B?V0swZ2FjcFUzcGF3OCtFZlFRNlA4RTFOcXF6RkJyb0lERU12VXlSZHY2SEZu?=
 =?utf-8?B?Q084eFZjeEJVeW1oWWJBUFQwRi9HQTltN2g3RkM4MENKZmlUYVpWdGpSSVVl?=
 =?utf-8?B?SnRVdDZxNGVrR2lUdFNIYjVHT0ZuSHBwOVpud2lWa2RDa2hXKzZubk5CZWo4?=
 =?utf-8?B?Z2Y0QzBZblEwNm1QT1plTTEySWx3RTJvc3V3eFAvUC9HTWFON3NGNmZYem5j?=
 =?utf-8?B?eEE5SmZZM2pkZEViZTdxbjJtNUk0d01WZWlsbUgrVmlUNnF1eGhsVGFjNnl2?=
 =?utf-8?B?YUx4NmZFVSsrc2xiVTljN0F5NHFkVEsyd2E4aVBRSlRoakswREpWcDN6SUtQ?=
 =?utf-8?B?TGVGK1Jjalo5Sks0emIzaEt5aFlFKzkxWEF6QkZ4L1gyTFJSM1ZUNGpnS1lL?=
 =?utf-8?B?R0FuQ2lRWms1VUZuaDZwa2kybnRTTUZWcEttU05HMzF2a0ltZDVhNHRULzli?=
 =?utf-8?B?WjI0SmJjOHJ6UmdWV0YyNmZ1c291ZDkvV2x1ZGJucklmMTJHdnM3TmFJL0hi?=
 =?utf-8?B?b0I2U3h2S0tFVEU5SXR2QXpWN2x3MU16bnk5anNrcVFLNnFLODk0NlpDR0hI?=
 =?utf-8?B?cmJXcEUrbkc4TzBsclp0WTN4ajAyT3RvdE1SRzM5OXk2RnZ5SHZSK3JoKy95?=
 =?utf-8?B?UUJ6R1V2WmxZTWJiZ014dzViTXRTTnptRlNvOFM5clVlMmhNc0dPOGZHOGVs?=
 =?utf-8?B?VmtPdC9GaTk5ckl3RVczeDIzNURPWjlucGdKRkNEY2JyQkdVOFhlL29CMUx1?=
 =?utf-8?B?eTdmVUJUanlBbmJkNDIvZGR4Q2tXVHVlc01CWjVkeERqWFNFYXg4UmdMdHp4?=
 =?utf-8?B?cE9HeHBlNE41NllXdnRrMmFMQ0NkR3N3aGI0QW9UaXAyZld5bXQ1a0V1WWd4?=
 =?utf-8?B?cVBJQTVLVHZLMzg3WVQxTHBmdW0xNHhOTmFLOUZQR1p0K3ZsSlp4SmtpVmU3?=
 =?utf-8?B?WGFHZkZhL3hkRjZrZHIxK3hXcUtNcHZlS0x6cW5GOWhrUERDYmt5NnF2bnhj?=
 =?utf-8?B?RFEzWHo3dTlxcUo2VUNOLzNmak53UHlVN3FuVjhWaDdWUk5CMWliRWtXSGNE?=
 =?utf-8?B?V0VSWTFRbndjb0dIdzZmbG1kSkUvYVc4U0ZIWVlsSXlTME5VQURVanhXSUx5?=
 =?utf-8?B?blIvRnZLNWNyc3hhNG5YcjQxdGJNUmZ0eWw5TVlZdjdRRzQ2bVowcVVqMkt1?=
 =?utf-8?B?T3dHWTNWeDdsNmE5V0E2SXFjbVV1Q0QvMVVGOVBiRHZOWkNZWVpEVy84UVMx?=
 =?utf-8?Q?J7xbiUheWj4Z3CsE=3D?=
X-Exchange-RoutingPolicyChecked: YR10CGO7hPCSH2pk4T9GXoWOWUStNTb1GEJa+MovdTgtEJpO9tR22TaFRbkmQ0p4dZYsFZ1kDFHy3tbJl4Cy0cdJVwHuq16AK2Yd6IgOG9gAA/RufeRpdRtMsFKwOrmZ53bjv+9CMUIXJTt5HTAgia3XC9gRO4WH4oe8bfMkXdhQY9gwHsKi4T6QOY7+a6BYCKbo8pFbTnPNNGr1HwcPAjcYJWJ6rAPQNYotR3+4hQF8Ri1q654WaMopymWHcI8pkXQkDtQOv3L9pjRG8sDbRPv3aptBLEJ7RwbP7quTIJIky1USRjD9LYTuB9PE/16aCeYR5UsClicmuUxHrYbcTA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 06eb25a2-f5f5-4287-f846-08dece36a003
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 19:11:54.3350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLz0euTdaPBaLHTW60w+4QlRP5c0are5TsldWsEMx9YwzeF4hzHCRrhOCbEMtdauMpwS9H8Ps5d2SQrNSBUArbqhDe6SfkAjqU2O2itWOxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5867
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

Add a helper to return the total number of GuC doorbells
managed by the DB manager and use it instead of the fixed
GUC_NUM_DOORBELLS constant.
Update code to use the actual number of available doorbells
from the DB manager instead of relying on a hardcoded limit.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 10 +++++-----
 drivers/gpu/drm/xe/xe_guc_db_mgr.c         | 11 +++++++++++
 drivers/gpu/drm/xe/xe_guc_db_mgr.h         |  2 ++
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index aa77bd4cbca3..7292d86a9e8c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1221,7 +1221,7 @@ static int pf_set_spare_dbs(struct xe_gt *gt, u32 spare)
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
-	if (spare > GUC_NUM_DOORBELLS)
+	if (spare > xe_guc_db_mgr_total(&gt->uc.guc.dbm))
 		return -EINVAL;
 
 	if (spare && spare < pf_get_min_spare_dbs(gt))
@@ -1264,7 +1264,7 @@ static int pf_provision_vf_dbs(struct xe_gt *gt, unsigned int vfid, u32 num_dbs)
 
 	xe_gt_assert(gt, vfid);
 
-	if (num_dbs > GUC_NUM_DOORBELLS)
+	if (num_dbs > xe_guc_db_mgr_total(&gt->uc.guc.dbm))
 		return -EINVAL;
 
 	if (config->num_dbs) {
@@ -1404,16 +1404,16 @@ static u32 pf_profile_fair_dbs(struct xe_gt *gt, unsigned int num_vfs)
 
 	/* XXX: preliminary */
 	if (admin_only_pf && num_vfs == 1)
-		return GUC_NUM_DOORBELLS - SZ_16;
+		return xe_guc_db_mgr_total(&gt->uc.guc.dbm) - SZ_16;
 
-	return rounddown_pow_of_two(GUC_NUM_DOORBELLS / (num_vfs + 1));
+	return rounddown_pow_of_two(xe_guc_db_mgr_total(&gt->uc.guc.dbm) / (num_vfs + 1));
 }
 
 static u32 pf_estimate_fair_dbs(struct xe_gt *gt, unsigned int num_vfs)
 {
 	struct xe_guc_db_mgr *dbm = &gt->uc.guc.dbm;
 	u32 spare = pf_get_spare_dbs(gt);
-	u32 fair = (GUC_NUM_DOORBELLS - spare) / num_vfs;
+	u32 fair = (xe_guc_db_mgr_total(&gt->uc.guc.dbm) - spare) / num_vfs;
 	int ret;
 
 	for (; fair; --fair) {
diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.c b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
index 6767e8076e6b..697bf8684ebf 100644
--- a/drivers/gpu/drm/xe/xe_guc_db_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
@@ -111,6 +111,17 @@ int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, unsigned int count)
 	return 0;
 }
 
+/**
+ * xe_guc_db_mgr_total() - Get total number of GuC Doorbells for @dbm instance.
+ * @dbm: the &xe_guc_db_mgr
+ *
+ * Return: total number of GuC Doorbells for @dbm instance.
+ */
+unsigned int xe_guc_db_mgr_total(struct xe_guc_db_mgr *dbm)
+{
+	return dbm->count;
+}
+
 static int dbm_reserve_chunk_locked(struct xe_guc_db_mgr *dbm,
 				    unsigned int count, unsigned int spare)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.h b/drivers/gpu/drm/xe/xe_guc_db_mgr.h
index c250fa0ca9d6..cbe163fe7ece 100644
--- a/drivers/gpu/drm/xe/xe_guc_db_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.h
@@ -11,6 +11,8 @@ struct xe_guc_db_mgr;
 
 int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, unsigned int count);
 
+unsigned int xe_guc_db_mgr_total(struct xe_guc_db_mgr *dbm);
+
 int xe_guc_db_mgr_reserve_id_locked(struct xe_guc_db_mgr *dbm);
 void xe_guc_db_mgr_release_id_locked(struct xe_guc_db_mgr *dbm, unsigned int id);
 
-- 
2.34.1

