Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508C5C5AC9E
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 07:18:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F55210F3AA;
	Fri,  7 Aug 2026 07:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P20/m0lV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FE410F3AA
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 07:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786087125; x=1817623125;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=l15YcjEadJYNybqv9nWEpQ0SAmZoTb17aPhsnJjgolk=;
 b=P20/m0lVMcwesPYy/pKBwZcK2+OCE7uNZ3kO4diqdpwrbwQJ0ZRgcZRP
 5FUmqtoMjM9WPGXvnaFBg/kG6B/kBU+yVmiGUQSXtTF8UsZp47U3Dr774
 4uKbOrdbSnxG2gVIAzIRshahtRDTIXq1QDwhrwAWKrLqQ/E5aDhObGGXo
 CpFvbLD1DrQwPT2b6/D+Z45qm6wd3YAwmB9FPMLOFL7isZ9Q7ZQeP3Fge
 OHu340cad7m0ONB/nIIbNTF2UZNQWlCLkffAIqO9fcc7L8q+fD+UCEM8y
 EyKqnKap8+u+iHKTabNGJq2I7KPn6OJaFkBQmmCDL4uXmEPX7RFE0S9EE A==;
X-CSE-ConnectionGUID: L2IaWrYKQOuiHyfGtgsgwA==
X-CSE-MsgGUID: YAVAMaGlSM+bZkFzYariQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="85662860"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="85662860"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 00:18:45 -0700
X-CSE-ConnectionGUID: vbjuIieqRHCtVqWpZd1wpQ==
X-CSE-MsgGUID: POHbPTCMTPuqqEq5tJK+iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="266173618"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 00:18:44 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 00:18:44 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 00:18:44 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.55) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 00:18:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uL23sDp7OS1Yv8UnNMAMwoNy64c+sdyhFJC3XZQRTAUS1PKCtr6gAzLmj52tBfRgpGGYYJ0RFilSRcBgyYi0uxAcc0gjW4o1uTnq6HJ9KAEjycEWOLB3PkrS277n6vgmLBQIjbIEvCJCfbxU9o0tYykWdKFER0F9uI3dfaGz/OWMWMKRNTZ2LrTDnVaGPTHuPZsGUp62HNkNQTr80XYrKJENqrQeIDp6nFpR/l91C/2Oof/6sYFWjTydiczfcHZfqwmi9QD4u2ttEwgJogBlAtdH8QVM5HIPz0fJzi5edYPQmvsQYfzmy6f7u6SsyEbryeEOyjhR7Pt5epNMdED09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4o+R3de89uxTPMCgLS32jwQOFXd6697zI6MLxKw45Jk=;
 b=VMtUgfWR1OmvY61+GDAGj3OW/PRxWuYIB0jM78B3tXrMW51AgzgwuS+u47hXwGtJXh5ez6U2FAQgJr7McQgJCvu8RlOograkLh27ihwE9OabrMsL4HAwTB7cldN7G/5TRot7lptGrZYLQPaEf1Yug/Qome0GFCtzB5zS2Sa/KHqmrq2dADYfs4rR+2K2nrUk3GY2cghv8aKrzhn+QEwZlt5V/yv9CqQQS6QlmhgOlG7vXlkd8KluhXSPjIkcIQHI3ZzHTJffGLb92VHImHjZ2NL59pUZn6z7KpYh6TW3G9fI9EMRwIySlrL5WeTbzk+ihZNaKS8QwGnLNaKr9ibWuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by LV8PR11MB8509.namprd11.prod.outlook.com (2603:10b6:408:1e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 07:18:42 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0292.018; Fri, 7 Aug 2026
 07:18:41 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 2/3] drm/xe/ggtt: Initialize GGTT pools by SR-IOV mode
Date: Fri, 7 Aug 2026 09:18:21 +0200
Message-ID: <20260807071822.225338-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807071822.225338-1-piotr.piorkowski@intel.com>
References: <20260807071822.225338-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIVP296CA0070.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35a::16) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|LV8PR11MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: 1079c032-0b5c-4eba-f95c-08def4541b8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|56012099006|11063799006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: bcnVJN/IE9j1i3hHy0u1PvbPHHohAu4Y6yKf6OIG5o8usCRISnJe7idLEvZXc8PI9HXysLEPT1U+Yoyp8mIsFRakOOsZuV1Bef1yjhgzrvEnqWcq7Ou4nj00DldBsR5oW/K9UrByQT4roiOkul5+ripli3CoacwTrtdoGOmpQRLYjusCmYg2CnzzV4scwc6i5BY4JZDyYnUXE8nX/eBPLsLXSB+06rXN+luC9AYZljS2nrgkRx0U5+V5YvLXXJLhvTSPS76rMGXpiya/NYZ4DySYkO2MG1KoGB/ydsQ0ve94Z0gNm4gdN5THR+SiXNmwhPVybqLt9dC6KICEhp1yHTsCm/XDTOOBjbdOsZLtTDoHRrXQVPMmEyd5q+ZTWODjeDjklfDxpu6nq2oYH6Drd5Le5RROrZZuIP6GrTvkLDhAzk22y5ffWZ1Hde9WreRxTRS3YKxyqrspHQmc2dWmjnD6uliiyAre+J8v7pOQme5wPCIc2CjTbCJ9ev8+xaRQsu+FZ/GKCT+B7nSo5Cg22GVGcNigNZexS47SOZ1NamWoQoVc8LmNVncs0wrgqSE/1KFdETAK47xR3PtMAKOGo5oFX9P2obuFmYC6hWGR7rh/oQHViRIX4/VG9yXQ6mFzAg2d4XDZwgagFzwBpWaqAyhUVQYisHckcXGffgi+uOg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHk2ZXM5cGVsWk9EUVE0QUVyZ1V3REpOUG1TcTV5b0FVTVdzNmlXeko3cWlj?=
 =?utf-8?B?QXNCQjZjYm9KVEZhRWJuT3IrRjJzNkJvUGhOUjc0SVlxNk55Q1RDSys4RW81?=
 =?utf-8?B?cEM3ejRNNzVzR21VWDd5VmoyQ0drdzFMa1FhWENHUmZzTFZkSnliUVJsRGp3?=
 =?utf-8?B?aHZqTUN2UU5QeFoyRnpEVzZ1d2JVN29tL3RNZTRYOGt6Vk4zRjd4MVA1K3Nl?=
 =?utf-8?B?aC83czdJMzk2R09NODFRZ1k3d0wwQWlnNERKczZXYjlmQVlSYnFyMmFVc05p?=
 =?utf-8?B?OEZ1QTJ2R09wWVkrN2sxZy9aY1BmbU1tK3NUSkEzcjFKRjd1UGZsUW9vdG80?=
 =?utf-8?B?R2ZYVlNDUExRSGFhSzdPUHVVdEZ1S0pkazdGQmhNM25xczQ4ZnJUbmw3UHZW?=
 =?utf-8?B?dllhMkY2d2V4cVIzZVRDdFdsUDZrNnVCS01HNFpzNm9TMGN6cXRmK21oRXJ0?=
 =?utf-8?B?VDNPYmlOSW9ycHpiUExkVUNtaVR5MFR5QmxYdXpjcHVSdzN2cDZpVDJ2eHRU?=
 =?utf-8?B?QVA3NUNXVGZjUW1SVEdwQkVWNUowZUsrV3MvcWNRYmNhTWs0em5GbzhjY2xO?=
 =?utf-8?B?NkVka2FHUHlTeGhSN0xPdFRHS29YTGhkb1R3NWtDY0FhMnpRWkVTekcvWlc4?=
 =?utf-8?B?TmJQRE9FOCt3bU4xUzBWVFZ6bDZFZTk4dXkvaXp3OFVtV1lCSXZHMTN4cmpv?=
 =?utf-8?B?QWJWc0xTMWZHRzhEQTR3a1dRZlV5YW4waUdqK2tCVkJHRTA2Y2I5SkFSeWdW?=
 =?utf-8?B?VGlHc0s4WHU3b1dOamhSWmQvbXNyTzR5SVhtTDVLOFk5RTlzVkV0aDhCV2hQ?=
 =?utf-8?B?Mkd4a1JHWXVDZElvb2c5Y2lTZldYQWxsVit6Rk5nRStaZDI5UkMwaUJKU2d3?=
 =?utf-8?B?dTgrSmE1SUFQZGxCajlvZk96WVI5b3d5VUxnWUJ2YnZOb0ZMMXRUcEFXL0NU?=
 =?utf-8?B?Wm0vMC9Uay8wOUpyVVJ5ZmNaZG41QTZPdjBBeTJpTS9sa2xrUVkrWm1BMzRr?=
 =?utf-8?B?NnZqK3hkRDUvRENMMk1sZktyY0ppT09FMjlVQzUvUk4zNkx5ZS93ZkdRTksz?=
 =?utf-8?B?cHR5elJnZEY2ZVI4eWwrcUhBOHliRWNZZmVnMlBrazhrMUx6eitZRTJmVnZ6?=
 =?utf-8?B?bUdYT3dqNXNDbmEzbStjdEh5aVd0eWZkVytHcWlBT2RPY1NCUUFtVzZmdmVG?=
 =?utf-8?B?ZVUwUjlwSXd5S1FvTlNzbjMzSUkxa3VLak1GVVJ1K2gzeTEreG9tT0hpLzdr?=
 =?utf-8?B?a1p5bmZCbDF4Vm90RVFRSFA2L2NrMm5pK1ZxMGJJY0xqMkZOYnIvWWc4S1RW?=
 =?utf-8?B?OTl5NFJWNG1YZVhWVmpwbUM2dktkMGZZNXdCTXh0aC9LSWJJQnQraTIyMXda?=
 =?utf-8?B?YXFDSjR0cUNOUUdtd3o5V3VjOS9VZ0V1RmhVTXdtaWJiWmFscnB1WkVlc0Mv?=
 =?utf-8?B?YmtCbm5xYnRUcW50M1R5TU9FY0VVa0FYN1I5LytSWEQ2MkVvbVJqYys3Mmor?=
 =?utf-8?B?OTVFYVF4eUJ5T0xSWFdnUXlOakhzaEF0S2sxV3BXdUpPdmpkaGc2QU1QTjVp?=
 =?utf-8?B?OFdPSFQyZUkyeU5nVlNjdjc5OVJPb25pUW9sejFEZ1pqdkUzcFlmRmxBU3pm?=
 =?utf-8?B?eERvdlhFdHlJTHNNQmNQN1lXek1EWTM3dTlpam5GV3VuQ05DbzFmUDBDOGxK?=
 =?utf-8?B?dnhVSUNsbG8zUUM0OHpudXpOQWZ5NnpndHppcVVDOENsMDhkWFNGalBSSVBC?=
 =?utf-8?B?d0NHYjJDRStTMVBVMFhWSVduY3NGUmcyWGhmeVpqRW1IL0lHRzdicitkMGhl?=
 =?utf-8?B?cmRrcktSVE1kVFhESjFQY1RjTjFRRDV6VFZpTGFFT3NPMHA5S2R3dUkvT3JQ?=
 =?utf-8?B?VXpMd0NiTEJDeTFTRytjdUR2ZkQ1L2U3UnIrVzZKQ3dCczR1emdSb3RZS0Zw?=
 =?utf-8?B?TkhsU3RtdzVXTXM0OFBMNlFYWFhtaktEN1ltV3pGcHNKUmE3ZTE1eTZtWUJr?=
 =?utf-8?B?NS95dzg2VjVoOGVxVW5KVFAwZ0RUajRLMG5mcHpzTDRaTTVINU5FVUhnSE1j?=
 =?utf-8?B?MlQ5WHk1NGxxczBTOG9PTnIyL3RpUnNWVFV5VmRIRTQ3Nm5XcVdhdktuRVJF?=
 =?utf-8?B?bSt0c1FTUWsxMytsSzdJck9vUE9KSlN3WHN3TUl5K1VWbkFmQU5aTjdKMFM4?=
 =?utf-8?B?YzBRYjJKUnR1emo1UW5JZ2hkZlhQbFljMElXZkU1QTQyZ3JiMEp0Y0puQzR3?=
 =?utf-8?B?TkpZVjVza3VjbENyOWswNXVGWG93R01WUUkvSnBXb0J5ejRyak5TRHphWVJr?=
 =?utf-8?B?OER0RkV4bzRzRlVkT1ZrVDhKWUlZY24yL3N1VGNnTG4wTm1rRE54cTNJcUJz?=
 =?utf-8?Q?H/MJfjsFoX5q75ec=3D?=
X-Exchange-RoutingPolicyChecked: pI+qCYfTnzmfXWhkf+zB4jidEVRN42ZCisbE5WzBFwS80m48IbB1Z0kpFmgLwD8wY8m04Y1fsNUGB4kL+RbRcUkG54LZbHkWh+jPBNai7Zss8/xrH/MbYCS11lC4UcHPiJUKliux7mNa9RBOqmqiojUOoHU9KOfcXitNLhL1IHESbiCPfnQBopg7yqztXzBKeUrqBJxBaNqkYOld1BBM6eIfKiV2cpuwDULlHkjlPj5vhQIGPnkGmwJbT2K8UOwcOVpmsnCPH27XT1a2+H4c9AjUQWrpfPq7cnputUYMBG/w4744ZSyR8i6GEflcrWpYLRf8pvS3BWqT32zqgI/NAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1079c032-0b5c-4eba-f95c-08def4541b8f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 07:18:41.1566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/GqkCPgL6zlgOn2ABbQyOUMTXe8cpCVOyp0x2VaBjhrk+SItScSCwROCdm5cjVH5IWYYZRBChhYE33MIIgqrGCb99LD9gV/gWVOn2cISYU=
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

GGTT initialization currently uses the full available range for both the
usable and shareable pools, regardless of the SR-IOV mode. The range is
read from hardware on native and PF devices and assigned by GuC on VFs.

Let's separate range discovery from pool setup and initialize the pools
based on SR-IOV mode. Native and VF modes will use only the usable pool.
Shared PF mode will use both pools over the same full range, so they fully
overlap.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 134 ++++++++++++++++++++++++++---------
 1 file changed, 100 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index eb02f9b84d3c..57e167b3bd3e 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -244,10 +244,12 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt)
 	return ggtt->size;
 }
 
+static u64 ggtt_total_size(struct xe_ggtt *ggtt);
+
 static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
-	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
+	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt_total_size(ggtt));
 
 	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
@@ -261,7 +263,7 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
-	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
+	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt_total_size(ggtt));
 
 	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
@@ -378,8 +380,8 @@ static u64 ggtt_total_size(struct xe_ggtt *ggtt)
 	return total_size;
 }
 
-static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 usable_size,
-				 u64 shareable_size)
+static void ggtt_init_ranges(struct xe_ggtt *ggtt, u64 start, u64 usable_size,
+			     u64 shareable_size)
 {
 	struct xe_gt *gt = ggtt->tile->primary_gt;
 	u64 accessible_size = ggtt_accessible_size(ggtt);
@@ -395,14 +397,92 @@ static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 usable_siz
 
 	ggtt->shareable.start = accessible_size - shareable_size;
 	ggtt->shareable.size = shareable_size;
+
 	xe_gt_assert(gt, ggtt->shareable.start + ggtt->shareable.size <= accessible_size);
 #endif
 	drm_mm_init(&ggtt->mm, 0, ggtt_total_size(ggtt));
 }
 
+static int ggtt_get_range_from_hw(struct xe_ggtt *ggtt, u64 *start, u64 *size)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	unsigned int gsm_size;
+
+	if (GRAPHICS_VERx100(xe) >= 1250)
+		gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
+	else
+		gsm_size = probe_gsm_size(pdev);
+
+	if (!gsm_size) {
+		xe_tile_err(ggtt->tile, "Hardware reported no preallocated GSM\n");
+		return -ENOMEM;
+	}
+
+	*start = xe_wopcm_size(xe);
+	*size = (gsm_size / 8) * (u64)XE_PAGE_SIZE - *start;
+
+	return 0;
+}
+
+static int ggtt_get_range_from_guc(struct xe_ggtt *ggtt, u64 *start, u64 *size)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	u64 wopcm = xe_wopcm_size(xe);
+
+	*start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
+	*size = xe_tile_sriov_vf_ggtt(ggtt->tile);
+
+	if (*start < wopcm || *start + *size > GUC_GGTT_TOP) {
+		xe_tile_err(ggtt->tile, "Invalid GGTT configuration: %#llx-%#llx\n",
+			    *start, *start + *size - 1);
+		return -ERANGE;
+	}
+
+	return 0;
+}
+
+static int ggtt_read_available_range(struct xe_ggtt *ggtt, u64 *start, u64 *size)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	int err;
+
+	if (IS_SRIOV_VF(xe))
+		err = ggtt_get_range_from_guc(ggtt, start, size);
+	else
+		err = ggtt_get_range_from_hw(ggtt, start, size);
+	if (err)
+		return err;
+
+	if (*start + *size > GUC_GGTT_TOP)
+		*size = GUC_GGTT_TOP - *start;
+
+	return 0;
+}
+
+static void ggtt_init_native(struct xe_ggtt *ggtt, u64 start, u64 size)
+{
+	ggtt_init_ranges(ggtt, start, size, 0);
+}
+
+static void ggtt_init_shared(struct xe_ggtt *ggtt, u64 start, u64 size)
+{
+	ggtt_init_ranges(ggtt, start, size, size);
+}
+
+static void ggtt_init_generic(struct xe_ggtt *ggtt, u64 start, u64 size)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+
+	if (!IS_SRIOV_PF(xe))
+		ggtt_init_native(ggtt, start, size);
+	else
+		ggtt_init_shared(ggtt, start, size);
+}
+
 int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
 {
-	__xe_ggtt_init_early(ggtt, start, size, 0);
+	ggtt_init_ranges(ggtt, start, size, 0);
 	return 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
@@ -430,41 +510,17 @@ static void dev_fini_ggtt(void *arg)
 int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	unsigned int gsm_size;
-	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size;
+	u64 ggtt_start, ggtt_size;
 	int err;
 
-	if (!IS_SRIOV_VF(xe)) {
-		if (GRAPHICS_VERx100(xe) >= 1250)
-			gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
-		else
-			gsm_size = probe_gsm_size(pdev);
-		if (gsm_size == 0) {
-			xe_tile_err(ggtt->tile, "Hardware reported no preallocated GSM\n");
-			return -ENOMEM;
-		}
-		ggtt_start = wopcm;
-		ggtt_size = (gsm_size / 8) * (u64)XE_PAGE_SIZE - ggtt_start;
-	} else {
-		ggtt_start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
-		ggtt_size = xe_tile_sriov_vf_ggtt(ggtt->tile);
-
-		if (ggtt_start < wopcm ||
-		    ggtt_start + ggtt_size > GUC_GGTT_TOP) {
-			xe_tile_err(ggtt->tile, "Invalid GGTT configuration: %#llx-%#llx\n",
-				    ggtt_start, ggtt_start + ggtt_size - 1);
-			return -ERANGE;
-		}
-	}
+	err = ggtt_read_available_range(ggtt, &ggtt_start, &ggtt_size);
+	if (err)
+		return err;
 
 	ggtt->gsm = ggtt->tile->mmio.regs + SZ_8M;
 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 		ggtt->flags |= XE_GGTT_FLAGS_64K;
 
-	if (ggtt_size + ggtt_start > GUC_GGTT_TOP)
-		ggtt_size = GUC_GGTT_TOP - ggtt_start;
-
 	if (GRAPHICS_VERx100(xe) >= 1270)
 		ggtt->pt_ops =
 			(ggtt->tile->media_gt && XE_GT_WA(ggtt->tile->media_gt, 22019338487)) ||
@@ -477,7 +533,17 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (!ggtt->wq)
 		return -ENOMEM;
 
-	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size, ggtt_size);
+	ggtt_init_generic(ggtt, ggtt_start, ggtt_size);
+	xe_tile_info(ggtt->tile, "GGTT usable %#llx-%#llx = %lluK\n",
+		     ggtt->start, ggtt->start + ggtt->size - 1,
+		     ggtt->size / SZ_1K);
+#ifdef CONFIG_PCI_IOV
+	if (IS_SRIOV_PF(xe))
+		xe_tile_info(ggtt->tile, "GGTT shareable %#llx-%#llx = %lluK\n",
+			     ggtt->start + ggtt->shareable.start,
+			     ggtt->start + ggtt->shareable.start + ggtt->shareable.size - 1,
+			     ggtt->shareable.size / SZ_1K);
+#endif
 
 	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
 	if (err)
-- 
2.34.1

