Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42418C5DF87
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 09:46:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE7610F296;
	Fri, 21 Aug 2026 09:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bokcAywu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7B610F296
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 09:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787305591; x=1818841591;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Sljk1EjYja5TOW0POFpNwPioU7SuYoLS2vpQODzRu7c=;
 b=bokcAywudQY25dTsNDxtjRHbv8z/IsDoTQ2fzIX2oCn/TNsPt4+untSL
 Ze9+nk/w9cFG/zz1vXn31Nacwcs4x1q8CktCq6WlXzNb325l/VDqGZ1s7
 jAr+zy75la0TMtk3zujCaaqCxa+dUIhaSMybrvsIJNxEknmQvp8lO4Oet
 6KItwmHxFM0EULT0USYZ5SA/7ik56VxDNkX5ji4C+oP9Gw+t4ZHLRoEA8
 r4HFpMtTt84ZM9+LVPQU8WOAeMwToz2LhfQfD5mSSlI2MN0biLFso12gJ
 NEJj8FuHl6dGhOU4GYL5d1BoqZ79r8hzyofub4Dqv8YpVzOp8GNxZnwQh g==;
X-CSE-ConnectionGUID: ifQWScP+QWKxwCbdFm00iA==
X-CSE-MsgGUID: PfszUZGQRHyu5pGtalprgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87770424"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="87770424"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 02:46:31 -0700
X-CSE-ConnectionGUID: f76hcUK+SKer9ZzFpspFsQ==
X-CSE-MsgGUID: /unwvC8vTOm43Gw6Vr3dnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="270521638"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 02:46:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 02:46:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 21 Aug 2026 02:46:30 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.29) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 02:46:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hjky18bLkd8UPHvgLuMh0gJDCuuprOVjDmEEDMmIqRG98xPJaHdhi9DHwGJx72zP5BekmribiB52iGZVfoiR14gg5uT7kGbPdz0VrhQAgnTxruQkMQE4vGwEMY+tUxqo/JFj/FxqYN8gTeK/hD8MLO5Brf0v0hpoRNo3zNf3W47ee3XSFhSFAEhI1Ep5jKVaUPLfRJFheWn015r5cBzr0veuyiipF6sVsE315+g8B1Wiktj2hqE+9zY/d0tEMfU+pxhkospXxnJRKYdclbsvnjes8RLz4HxrOdCFIgwmMZVNYhpuRebLiLU7dHQQ7E0DLr0eZyBQjkPqAaWw8Xi19A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeikXPIxJYPrkULFO6h6rXkyJjhbpV1wnYzDWuKm41w=;
 b=UXRT9HDw9mXOZxJvGanRNM0LUFHOoMiCrqDspDAp9fR7PM3B6lNKI3OWoepRZ9CtVC77YUk1MQGVePlibQP/IYIdkbic2ihULZjZ5mGZUG2a6Uu7whbq6xLe6yb3XuVQVOhev3TsaGPdTzTLI+gpTvusF4HU/U7nqOFo37m30pMASTF8u1eSSCSP8GlqeYv6kfwf9mwTFUL1Q0YfUOWNDCAaYT5TDaJHi0TxB8sN4gTWwbvAlavB2IncXnOVAukv980QcQgEAYML42IFl7PQcXeN7ftkP0TiM6DasDSY5k9OVeXtNiMp0D/lQp6hwniiPsSd2cdba/Xm0DDXc3diLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH7PR11MB8454.namprd11.prod.outlook.com (2603:10b6:510:30c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 09:46:28 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 09:46:28 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 3/4] drm/xe/vram: Add initial support for PF-mem regions
Date: Fri, 21 Aug 2026 11:46:00 +0200
Message-ID: <20260821094601.607060-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821094601.607060-1-piotr.piorkowski@intel.com>
References: <20260821094601.607060-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TLZP290CA0012.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::10) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH7PR11MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: d58ac00b-1637-4f76-4afc-08deff69126d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: k/QP2kLgC00fJ9/CJf0o/OHSXnXhPqZsizjv1Is5d1P4gLQfmR5RBZs8HXx3wBWDpTjxY/YFTf+RBMXFdS29THPAbt21ArVRZDlR6ArzAF3yqyqSeplpN2g7o9kE+TCDZz4E5RDyyj9d7fZLpW4cZKcL5lljwRGMUG7SK2jMkDLvjm+8V2gTUN+9c1UG/r+0g+q2qYZmZ5hTSZOWpoBhM1/PHq6nq4u9EoupeKQagIRty9rvzISPyBJF7S4L3X9duNsZ5VPzgwBZ7AOa7LuCv1upOKHdApiVvfdx7BT7p1GZYwrn4FJDlbNuODSxc1lPWvrO2AOCICMdYGaPZsMqPQc0CSMLOuEZrFpdqZ2Zec5dyNvw9xuX48CKSPmG8VpOBRX5gPNgNKCY4dbixEuAHXj1dgcYGiTSY5+gzz2v5RlHiOCxwO6lGwgqyPk85uA6EoZ+wAASh76TueJklooBkvum0nDRax4hsN1frMnMbXWSGPBG+i7T+My1nlimn4zUfW3QhyqHc/JnqIZf1yDckCJqd+/P/e0I983/J2Paq4g8zERAIQEI6kNz9siAmdN5voxE7KWpCjUyLBLOhoLcpUpL6CGfGajuPJcceVkGZHKBtgN/bl3Mki4fYuH3CVF9pll/4xhb1sM479k2u87JgmKQeCEfqOWgkcexmf6Igf0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVNyVEpPeUM5Q3p2aU5Td1JOQ3YvWkFMUkRBZG5lakFCNW5WSXZnOUV2YjhZ?=
 =?utf-8?B?MEhuWmR5OHFGNlRQVjdpTnhRWFV6Ly85ZEVNMFFtMnkyczZ5dG9ZWEQ4RGUv?=
 =?utf-8?B?TDJJL0J2NWZlZWZQQm4yNThramFaVkpsZWduUnM5eTU5aVIrVEJMaWxQV0lO?=
 =?utf-8?B?SERTRUFyektUczNUemI4T1ErMndmOVd5YWlDTnVSNDVISTNPRFBEMkRWVHZ2?=
 =?utf-8?B?dEtqNWhVMkwyaTV5end3TjBoVTloUXZLVC92OXZmdmtpbk9sSndzNmhDcEVw?=
 =?utf-8?B?RkYvMzJVNmF0OUEzdXhzTUFudkNqWmRmTVl6UXRoT2o1aWgvRmZWRk92SnQr?=
 =?utf-8?B?eVBwaERNYi9FTHM1Y0JSWUJpVmJrNk5rZE1GZXhkR2tCSU51d2FUUS9vU29r?=
 =?utf-8?B?T0tkWFZ4dUpMbVZKa3RZRy8xSVMyalpnREhPQmhDREVoejBZSzJnTmpTckFG?=
 =?utf-8?B?WXVGbWovV1BMYkFabWRCUC9rRVlGVEgxR0c0ZFhkOXplVms2a0pUWExVUklJ?=
 =?utf-8?B?Z2k4d01qaGhjNzN3ZytsME5DaEtmbGhkVEw4b3NxTzR6ZkhlR2FiNUxHeXdz?=
 =?utf-8?B?UTZZdC8rMU1yNnAvTnVHeG5OYmo0TmhYWTJwTFMxeElwNzFQQnQyVSsybEtq?=
 =?utf-8?B?WEtZUHNScWNrU2x6aytFUi9hMXphQ3JldWZVeVBsMTlqckJSaE12N0xhT0VK?=
 =?utf-8?B?Ry9ZbVQ4SlhXWER3YitNVlkweUhZWmtodXJNcTdMQzhvRGdtZktHQkVVUFdD?=
 =?utf-8?B?UDY4S0hyNEJVR3FvMHhtNUhHYTl2bEVjRFZZZXVNM3pyQWRHQXc3SnRwbUtU?=
 =?utf-8?B?MFp2TUwrOFkvdGpleE1YYld0dkx0Z2cyOGp6bnFoQitkRnd4UW9GQXNweVFL?=
 =?utf-8?B?ZWdXcFhoOTlhaG83M003MnRObEFaQVM0Vmw1Z2Y0N3ZhbC9wQ2JXOE9Sa2xi?=
 =?utf-8?B?SlBPd3JMRnhFbHpUeFcvSGQybW8ydGhRaGY4MTBuNktBc2pqdVVaTUV0Tm1l?=
 =?utf-8?B?SFFoNGFLTUc1TnpIay9LQm9pbUpNQ3N6TENUaGNzcVhQZGc0Z3c3aEh1eGR0?=
 =?utf-8?B?TzZYUnlNMDVCYy9GOHNHMG56NDlreXFvRUNaaU1MMlRJb0owc0dFZEZIR043?=
 =?utf-8?B?eisyREtEN2IwTS93Y2pOd2g5VG0yZ3VhRm5qVzVEZU1jQkVqNTV4V0lRMDZQ?=
 =?utf-8?B?S0Mrd0w2MC9HczVHVzlkRTdyT1k1MmZBTzBKZ1VIczhYYURMRzQvdkFtdXZI?=
 =?utf-8?B?U0hEaUwvWkI1VjZXazkwNkI5dlBVamR3QXlzdmZoTkRmSEllL1loQklPUDVP?=
 =?utf-8?B?Q3djYm5IdnhyMjk5VDdsT0hWcEI2YzBjTTNDK3VZMDlReEx0YW50ZjB4VkJ0?=
 =?utf-8?B?cnJ6NlkxSzkzbWpCRjBVd29QeFFzYnBlb0hCSDh4aFc1UENJY1BQaHVRQ0Rl?=
 =?utf-8?B?QWovdiszSWhsRE9LVHpDTHdGY0R0VkJqYTZKcFJlMTdhQTNnNjBCMEovODJx?=
 =?utf-8?B?ZjJhZ2dkLzZtZmxMQ0R6YVZBWWx6dWJjdWlkOFQvWmRCVE1OYjFKc2ZRVVY1?=
 =?utf-8?B?Wk9ZLytpTEhXaUk3NlU1VUNzMDlIeWNQVUo1MENabldGbzBpRjFSWVRTZ3ln?=
 =?utf-8?B?UytiRVdzSHpnc1hlUWJFNXBNUXkzK05aTjR0ckZmdkhWdzhtM0RuVE0rUXM5?=
 =?utf-8?B?QUUxcWJzTkVPZTdpd0lYa3o2cGNhSFZuL1FMVUhNc0lETjVJRDJtOUwvRjE5?=
 =?utf-8?B?d3hhTnhHam8vRTNDUk9IL1p4eGRlTDdOdzQ0THlKRnpwZVZWR25RMmNVSmdk?=
 =?utf-8?B?MHRZQWc2NE9WMlp3dkZ2RzZwekN1UkE2RmRrcmJtS0hWUTJONFY0dlU1bXJQ?=
 =?utf-8?B?L0ZhdXU1WjBwTWFOQnJnbjJoWWVUM3NIMC9Tb2dHMFNqd3p5bStkcm1HbGJ0?=
 =?utf-8?B?a29PK3JHb0dCT29Mb0xyM0c4eHNTSlpla2RnWStFdlpsaWp5dG1hSHJadjEr?=
 =?utf-8?B?ZldXeUNuNTFJeDBFVktuUVl4MGVjcnZmREVhYUpCVmExYzV2aUlUT1FRc3Yw?=
 =?utf-8?B?OGdXTHc1cHhONkE0RHJxSXBhWWZBUHlnWEhndUtKZXI4VmQyMFVoSHd5RGhp?=
 =?utf-8?B?SW1INlZyeE0wOUwrSjRvU29jNk1IemV3V1VqTDk3RUp0WXYyckpVMGd6YkIr?=
 =?utf-8?B?OWtvTDB2Y1ZRRVJPME5pL0JvTGJUN1V5WXh4bElJdXFPZFVZZTNVc0I1Zysv?=
 =?utf-8?B?Njl5UkpnYUJhK2JGOEdoR0ptQ05ldVBFbTJ5V0k0aFhMOE5NKzkrUVZ5eThu?=
 =?utf-8?B?aUo3TGJ2TEdZeDc1MUYxWU1abkIrRFJHSVRGSVFOd3NEendZZXp5UU05dTJh?=
 =?utf-8?Q?MB21JJk2qyqeR7pQ=3D?=
X-Exchange-RoutingPolicyChecked: DL35beLfuE9ua/Wf6Js7u+kCqdewhdrYo/KfT1wuozD9tVt+ig44VbuDimwbturFHitMf0jZXgMp6m8f8IfSkVnAu/Tpzb3yvL8cih7fOFs/wzyxvOpgUZJV1alTJDQofH/FqIB9ryk4fpwqIVn7C9udeIOhcmxSStKoE2IThKiB/MB18FMHEtmH1oZSvg+yI8gQWFJrFpXFJrjwqSPGPMD6ZDnz0K6WRpYsoiql009XsxkFqdq1rjV5kJGsD4UW1j3mlpvE6gbnUeYYXTltVaIxsVzuFMwXa/lmEiYJNcuhAviit6yAkNc4cL5/BknrVfHjSgXsUsKYXa/ZhS0UuQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d58ac00b-1637-4f76-4afc-08deff69126d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 09:46:28.0311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FL7pTk6J+p3mNWet4Ws8QGtEXneFmWXX0eXpv5Y3nvg97iaL95o9fAnrCPRfOKEKQcJbd3vLpM8gJFMMvu7He1U/R5bwOrkHtl9vXw5Hxe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8454
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

Add helpers to allocate and initialize such a region from a
caller-provided parent, offset, and size, and assign the matching TTM
placement. The helpers do not decide when the region is needed or how
large it should be. A separate TTM VRAM manager is initialized when a
caller installs the region as the tile kernel_vram.

v2:
 - Enforce page alignment on offset/size and guard against a NULL
   parent BAR mapping (Sashiko).

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_tile.c       |  8 ++++++
 drivers/gpu/drm/xe/xe_vram.c       | 46 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vram.h       |  4 +++
 drivers/gpu/drm/xe/xe_vram_types.h |  2 ++
 4 files changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index fd0c2e4cbdd2..e196f424fda4 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -198,6 +198,14 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 		xe->info.mem_region_mask |= BIT(tile->mem.vram->id) << 1;
 	}
 
+	if (IS_DGFX(xe) && tile->mem.kernel_vram &&
+	    tile->mem.kernel_vram != tile->mem.vram &&
+	    !ttm_resource_manager_used(&tile->mem.kernel_vram->ttm.manager)) {
+		err = xe_ttm_vram_mgr_init(xe, tile->mem.kernel_vram);
+		if (err)
+			return err;
+	}
+
 	return xe_tile_sysfs_init(tile);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index e5f83df98826..408733c01d4b 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -29,6 +29,8 @@ static const char *stringify_vram_binding(enum xe_vram_binding binding)
 	switch (binding) {
 	case XE_VRAM_BINDING_TILE:
 		return "Tile";
+	case XE_VRAM_BINDING_PFMEM:
+		return "PF-mem";
 	}
 
 	return "Unknown";
@@ -258,6 +260,11 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 	if (vram->mapping)
 		return 0;
 
+	if (!lmem_bar->mapping) {
+		drm_err(&xe->drm, "Failed to map LMEM BAR\n");
+		return -ENOMEM;
+	}
+
 	vram->actual_physical_size = region_size;
 	vram->io_start = lmem_bar->io_start + offset;
 	vram->io_size = min_t(u64, usable_size, remain_io_size);
@@ -276,6 +283,45 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 	return 0;
 }
 
+/**
+ * xe_vram_region_alloc_pfmem - Allocate a PF-mem VRAM region
+ * @xe: the &xe_device
+ * @id: tile id the region belongs to
+ *
+ * Return: the allocated VRAM region, or NULL on failure.
+ */
+struct xe_vram_region *xe_vram_region_alloc_pfmem(struct xe_device *xe, u8 id)
+{
+	return vram_region_alloc(xe, XE_VRAM_BINDING_PFMEM, id, XE_PL_VRAM0_PFMEM + id);
+}
+
+/**
+ * xe_vram_region_init_pfmem - Initialize a PF-mem VRAM region
+ * @vram: pre-allocated VRAM region to initialize
+ * @parent: tile VRAM region that provides the address space context
+ * @offset: region offset relative to the parent
+ * @size: region size
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_vram_region_init_pfmem(struct xe_vram_region *vram,
+			      struct xe_vram_region *parent,
+			      u64 offset, u64 size)
+{
+	struct xe_device *xe = parent->xe;
+	resource_size_t remain_io_size;
+
+	if (!size || !PAGE_ALIGNED(offset) || !PAGE_ALIGNED(size) ||
+	    offset > parent->usable_size || size > parent->usable_size - offset)
+		return -EINVAL;
+
+	remain_io_size = offset < parent->io_size ? parent->io_size - offset : 0;
+	if (!remain_io_size)
+		return -EINVAL;
+
+	return vram_region_init(xe, vram, parent, offset, size, size, remain_io_size);
+}
+
 /**
  * xe_map_resource_to_region - Map ttm resource to vram memory region
  * @res: The ttm resource
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index 87088ffbfd5e..021f044e496b 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -17,6 +17,10 @@ struct xe_vram_region *xe_map_resource_to_region(struct ttm_resource *res);
 int xe_vram_probe(struct xe_device *xe);
 
 struct xe_vram_region *xe_vram_region_alloc_tile(struct xe_device *xe, u8 id);
+struct xe_vram_region *xe_vram_region_alloc_pfmem(struct xe_device *xe, u8 id);
+int xe_vram_region_init_pfmem(struct xe_vram_region *vram,
+			      struct xe_vram_region *parent,
+			      u64 offset, u64 size);
 resource_size_t xe_vram_region_io_start(const struct xe_vram_region *vram);
 resource_size_t xe_vram_region_io_size(const struct xe_vram_region *vram);
 resource_size_t xe_vram_region_dpa_base(const struct xe_vram_region *vram);
diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
index 51884e7a679d..01690bfbcce0 100644
--- a/drivers/gpu/drm/xe/xe_vram_types.h
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -18,9 +18,11 @@ struct xe_migrate;
 /**
  * enum xe_vram_binding - VRAM binding types
  * @XE_VRAM_BINDING_TILE: general-purpose VRAM region bound to a tile
+ * @XE_VRAM_BINDING_PFMEM: VRAM region reserved solely for PF kernel allocations
  */
 enum xe_vram_binding {
 	XE_VRAM_BINDING_TILE = 0,
+	XE_VRAM_BINDING_PFMEM,
 };
 
 /**
-- 
2.34.1

