Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862A1C79FA1
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:06:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F55D10EAF4;
	Tue,  8 Sep 2026 10:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="niAUyZti";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACD110EAF4
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788861984; x=1820397984;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8CJdTP4Gbzj5nWLO98ie15HlNi1QTx+xnVjRJ9SthDE=;
 b=niAUyZtiRtRasZffj4xcLHceC5W+jzSSkQcJzP6qS86L2FP6WJd0xMrE
 VK99EsqoBWgkFT8rnUvSJ5dyEVJaAyr5CHy+4Yb+ab4FGTDp7Vdj0iU5w
 5oVaRLbjHyduuw+h1qqbkNLZ/mWEnl73vGr5R7msraCydh1tA3K2yf52+
 15iBKWB4W7Ip/HJ46nGRAJFvJCl5NxztG6sCRuWkh2IgJ9kEK+0IrjH02
 e687LFs1KjdCKKu0m9vDrFwJfSpziY9Ei+McZcJUx0JOJkMBczA9ttdi0
 QIx44LfGygOv3DCcsdHRstZ3ayLdtPkZSuzUmurdhUSgtmUJkBQVEYq4o A==;
X-CSE-ConnectionGUID: 12APBvi+ScmmxdqiMcvzWQ==
X-CSE-MsgGUID: 2n+rE18jS4Ckw1y5j8aJyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89103131"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="89103131"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:06:24 -0700
X-CSE-ConnectionGUID: d6s9YG8dSiSIYgWPT7r51g==
X-CSE-MsgGUID: nocMaA+dSquVVxqCanZ1Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="267275401"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:06:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 03:06:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 03:06:22 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 03:06:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J30/akiieJoBYc1L/5A7Aj8mmhHi4Y4aIvBmkaq+t+yljHUGezo/JK8wclX3jtGCcrSdMMnlgitOAYtB0WJg6D336QNLqQFDiWRT87Vp4bAigsKzwYOAigQQJucviPTfiq6+OEaRf73c2z3tR3H3foCw7ASBEezSUYC244en0+vrZfejlDxwKKCjS6bKLWuuYN8lyhYCNcy9tx4MBL9yHHslj9rsWujRZqe/OL08i3h8xkZt1URjiT7Pc7zPf0T5AmgEpvsgI2kkWObf5aCGrUmoQXY5LayEARSh1YWFK53g8B6whNSb0NJK2g3Nt/VX7U+C8j8WN4o9AhYYDeGpcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06gmbyEqI8ckBoikXyyrRGK8pczFVgFKBK+eKEiixVk=;
 b=PnVFz0ntmXhOCOgXC6t73qaHQnkpPCOonah0YPtRFMiSUlnBuz0vONVZncKpcsGZQONHKx60crDgpgiUZqEMSxn6VZVgWdWNTDD2YAUvnDFeImqj4cK9y8fPYqVl4Th/Wd97ngAD7uYNFUC6JpB1znzNq5IUaPKJMId1jzHReqfj+lIvAfwmYODTTZiIshtvQPRx5wPV7Vaynrb0t6QzaU951SI8SJ46PKBnGM00xP9hY/kMz+TUNbYQk9AA9FMrj/1uNAMZsQLnX3y9PGq9HcmKu1LpAOs3OFMUsu2av10tIR1w70g8YDqbxztiPe1+LbHS1kM5B9j57D3IeA9pcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SA1PR11MB9827.namprd11.prod.outlook.com (2603:10b6:806:4d8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 10:06:21 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 10:06:21 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v5 3/4] drm/xe/ggtt: Initialize GGTT pools by SR-IOV mode
Date: Tue, 8 Sep 2026 12:06:01 +0200
Message-ID: <20260908100602.1626556-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908100602.1626556-1-piotr.piorkowski@intel.com>
References: <20260908100602.1626556-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P194CA0006.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:10:553::15) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SA1PR11MB9827:EE_
X-MS-Office365-Filtering-Correlation-Id: 90e1f2ef-602c-4fc8-dc3a-08df0d90d4e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|6133799003|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: vryKUfyES79qsm4JeDBialTLtNyMQ1YQerhYE+ZSs7PQJN1zU1LBwL7MkMnqn8YX8KgwAA6//NoudmovvdK2AI8pFIrj/rLE2kYTVW8oNYshgMJqhqk1ny1TfvsGX4dj8ZKitoniYvL67sv8MuEXJWex2TIkc6YQu1LETCApXRN1rBDlOjMU16DH+CmitrcvJaruBw+tinFd8A4NKVLnG6pNln7N2vhxfWPC5NylSUhKf7QFuKPJmMLnmnufJi4Byg8/7kYmCMt+aNkcHUVr5whhJhEgDzH4T5R7EM89kjBqRhdmzPwIZ1Pwx6h0BJ59HDAsRJgiZQJ6+jHvjhsSvKNQ/EAqGD7aPD/vMt4rLDbdjjmWLLhKG63GlqSzgqZBtQuRT5kNSDFhOiEvziuonoyJeZueUAgU6GUCivS/CEWEtBZSRP5iwNNSMXn2/l3WTaVn8MCxYcqqVtqSZHzEDhPFSTYJa4MsdCJRp4QeL1eyFAOvfYcrKKaK6y2k87UpA7F1i9hen49r3oeCIEth9tG9Lw5lbPxg61LrZ23Z8oTyRZrllnkGmiKxNigF8OJ/DXGhuN8frhOWiR57VbQmSqgIR+9mLe4V587nfIt6ev4ke9dbM1soEhDnasBSFyBI/SXFuT3sCfSbibYbA77IQutgvHmltP+5BoKYKJVvj5A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tk9seUM2WVpOSW5mTHI4dW9NNHBWMWNWMVpLVm1QZUFFYWtHYXMrSU9hSGZy?=
 =?utf-8?B?Zi9LLzNIaVNDVkt1V1czdC9pUHJmTllRdndKa2Z6OUw5QkZNZ09BMWhGWlkr?=
 =?utf-8?B?b09qenVaL1pvSjhKMHlwdHMxSDlhNTVUdWdLVU1lVXBOUWVNZTBoa0Q4TGR0?=
 =?utf-8?B?VCtmNDNHcGFJNzBtcy9wSWx2bkZLR2JOQmVueC9SS3VLUHJ2aTF0ZVd1a2ZW?=
 =?utf-8?B?dEYzRS8xd2luT2I2MFU0UHpHSkJja2VQWHJrdmFGOFgzNjkzTmVLNGpPSFpO?=
 =?utf-8?B?NCtvNmZRQWpieVhtMzNQRFp4cHdJMzlxZXA1YWYyL0VzRyszczZLU0dCUVZG?=
 =?utf-8?B?d2Mycjh3UUJSYTFsRktVN0FIQXFnT1RSOU9BL2F3djM0Z2d4ZklSc0dlNFd6?=
 =?utf-8?B?eGZ5eDlpYk5MRnNHUU1CMjRtSmo1MGN5bm9IVjNhSUtPelBCTDE2K1JBcnVj?=
 =?utf-8?B?TndUSjQ0UUswdGpLaDRTM3MwL0MyZkdnam9OMEpXVUh3YVFOUjJDMWU1MjBq?=
 =?utf-8?B?ZmNKSDdGbXUreURCSzNVNnh5bFlKTU96OVV0RFRPL2piRkdLeUZrVEs3RDBO?=
 =?utf-8?B?ODZIMWFnVFYrT3B0azdxNEhPZmU4SGtmZHh0bm4zeEJpdlBDcGgyVFo4Y1pS?=
 =?utf-8?B?NkdKSTJuc0lQcU5BNERoYWdPNjg0YTAvTUpnMVFYQ0NLUWRyUzJTcDJuREhj?=
 =?utf-8?B?dmJNYitNeGhTbjBmQ0hKUFY0VGpIcEh5cC96WU1BOFNFbkZDcnUrZzhMV0VF?=
 =?utf-8?B?SDhydEJBQ0o1emd6NVdQOEkyK2JaMWh0cDhxcENZTkZYTlFVbm84aGM1a0lD?=
 =?utf-8?B?V2E0ZEVCeUU3Qk5IdDZLamJlaHFWVDQxSVVvYjNLM2JiNEgzZm4zTU1xbTRO?=
 =?utf-8?B?c1RST1dKdlVYeFlxYW5zb1JGVHZqQTAvR1RpcDhlOUxXMWJCZUs0bHh0ZExY?=
 =?utf-8?B?TzBlZTNxWVlOVE5KYUdHWkxuOEdnNlB1UnhSVDk4bGJVa01vTmxqQTZpV3ZD?=
 =?utf-8?B?bVFPK0M1UmhZWnkwTXF1bHRoT1Vid1hBUUdlbVQ2SkJHd3pXdDU0VDJPeHdU?=
 =?utf-8?B?N24zSlM0YjhHdHlGZHMrbkUwZm5BRVIxZkdkZ0w5aG1QMmRseDhIdGdsRjNv?=
 =?utf-8?B?Rm1uSWp1RFFJTEUzWDNnVHo0SXkzTisvYTZ5T2J5dlMweVdvNDlDdlI2UzJH?=
 =?utf-8?B?N3lXcXhqTFk5WllWYkRYbDRpYW9FNG9QdEVsOEt4WGwweTd2YmNZenQ3MEN3?=
 =?utf-8?B?VWV5L1VYb1g2SkFreG53M24zM3h0a0hQOGptT1lYckNCMUJuWndmeXpRY2tn?=
 =?utf-8?B?eTFOQUh6OVlqeUdJajdtMDNwRFVIeGpZcXNobzdVeVJrdUJKQ1JaSTVDYWZr?=
 =?utf-8?B?dGxwTDdGeXpWbjZxRTQxQ2ZKRGtwRHpqWmFndXV1ZjhIbG1IR1V6c2dhNGdi?=
 =?utf-8?B?WHBWT2pGdWNOOU9qOUw2cEZjMWFvZmhBWFgwYS94djM0bXJkVVBaYzh1WXJN?=
 =?utf-8?B?UDcwRldXaU1Ra2txM0dFb0FEMU5GN3N5bVEydkg3T0xZVHhXT3ZCS3A0aFRG?=
 =?utf-8?B?a3VDZGdNR2Y2OFhyQTA3Y0NuOUpnSHMzK3JGdS9SUFdMSitWdFEzYU4vbDhl?=
 =?utf-8?B?c0dwV3lOaW40YjRBaythanVyS1Y4VEVjSGtiODFWU04xNkFYUFlJSUQxNDBZ?=
 =?utf-8?B?ZDZoWG96UVRBNVo5TmdKU3hQVEsvWjc3TWtvR1JkUEQyemoyU0x6blZHaStL?=
 =?utf-8?B?ZGFrRVFCc3doSFh1blE0VlVqNGhsbWZUL2pkZU5Xc3lheForanlGTnFUVEFE?=
 =?utf-8?B?c3J0MU1LNU5SRmQ5VnJYcHZGMjRNUWFDZ041TkpLcTI4b3ZVVUdNK2czNk02?=
 =?utf-8?B?NFQ4d2svVWpoc0xQUHEyN3h2KzRmYmxsSEVvRlhEOWF1SlNZV2VLQ3pmMHI2?=
 =?utf-8?B?Y3llbGZDM09taTl2Z1FnSWVxNFFJV1dVeUlwL2JTYW1aaHBEa3ZhZWlnUUtX?=
 =?utf-8?B?TzVxMURqNEVnNllCNllxdTJEVllvdFBmMVJKVUhwOUxCSzBvdk1EekNBQTRW?=
 =?utf-8?B?VDVoTmFuemN3ajZxQ1RyeTdzYjJHUUV4S25RaXduNUphMy9aRXNCb3dRSXdD?=
 =?utf-8?B?MFFIeWtSR1NzSWUwWUVOZ1ViTS9IaDhjMCszQzc5Sy9rckwzNkE1d05qUzdz?=
 =?utf-8?B?NDFxT21taGdxZVNQK1pnQ3pDb3RVeG0yUlRCL0xVVVVxcnBHQWFrZUlHNTR5?=
 =?utf-8?B?Vk1UaEllWkFOWUlGTGYyVFR0NFh3dEZQNWhITTBGNHAzUEMxNnA4c1Jxb1kz?=
 =?utf-8?B?a3BtQlVyRFFJY0p3SUNyMXNaY1Y2UmRDdjJDN1VkLy8zK2NWTkZzN1NkeFU2?=
 =?utf-8?Q?C9m9LTp34I+dSMcE=3D?=
X-Exchange-RoutingPolicyChecked: YwHlsxO1Np19RY5OEDS8fLBC4bTYXN2fTti7Eq4rZxGKxaA0u9kRIxVudgo6B7CoMBfJY4bH9Pg7UGrk/AKG+mw+4m8INup1kzyjlKR3eV7a/m5PZhp70g0vQJCM2Vit1bs/u7Oiu8IAYIC0PNuC/rs/I8BqsLVfu3UvFw7dhlv0zpIEH5przO8JzkKV98l3l+jYC/X80cn6tqaSPsrMP+X8d5BmAOIugdzBOiy6pPS65zZz8bnr8fJsEfB3WknCI2amXAvj1EaITYEZTJkgo3EI28joXjZgu5CjYMrwXM+g+fb57YtuCCUXu7fcI0gL1WyVF2TGfYFX1Tl3szYSLA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e1f2ef-602c-4fc8-dc3a-08df0d90d4e4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 10:06:20.9504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZkpREelIifr8hXw5KhKGl2ledlvUlDGLSAPnjO+hTNYA+1Lhl3/u45IF4R8xS1mhOwyabwyurC+w9tnODTKqs9h3LJe9/uEBS9qF/8x0uVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9827
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

Separate range discovery from pool setup and initialize the pools based on
SR-IOV mode. Native and VF modes use only the usable pool. Shared PF mode
uses both pools over the same full range, so they fully overlap.

v2:
 - Rename the native range discovery helper to ggtt_probe().
 - Treat out-of-range VF GGTT as invalid instead of clamping it.
 - Move GGTT range logging into the common initialization path.

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 125 ++++++++++++++++++++++++++---------
 1 file changed, 94 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 6a59fc20153bf..4eec94e377c98 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -389,9 +389,97 @@ static void ggtt_init_ranges(struct xe_ggtt *ggtt, u64 start, u64 full_size,
 	drm_mm_init(&ggtt->mm, 0, ggtt->full_size);
 }
 
-int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
+static int ggtt_probe(struct xe_ggtt *ggtt, u64 *start, u64 *size)
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
+		err = ggtt_probe(ggtt, start, size);
+	if (err)
+		return err;
+
+	if (!IS_SRIOV_VF(xe) && *start + *size > GUC_GGTT_TOP)
+		*size = GUC_GGTT_TOP - *start;
+
+	return 0;
+}
+
+static void ggtt_init_native(struct xe_ggtt *ggtt, u64 start, u64 size)
 {
 	ggtt_init_ranges(ggtt, start, size, size, 0);
+}
+
+static void ggtt_init_shared(struct xe_ggtt *ggtt, u64 start, u64 size)
+{
+	ggtt_init_ranges(ggtt, start, size, size, size);
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
+
+	xe_tile_info(ggtt->tile, "GGTT usable %#llx-%#llx = %lluK\n",
+		     ggtt->start, ggtt->start + ggtt->size - 1,
+		     ggtt->size / SZ_1K);
+#ifdef CONFIG_PCI_IOV
+	if (IS_SRIOV_PF(xe))
+		xe_tile_info(ggtt->tile, "GGTT shareable %#llx-%#llx = %lluK\n",
+			     ggtt->start + ggtt_shareable_start(ggtt),
+			     ggtt->start + ggtt->full_size - 1,
+			     ggtt->shareable_size / SZ_1K);
+#endif
+}
+
+int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
+{
+	ggtt_init_generic(ggtt, start, size);
 	return 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
@@ -419,41 +507,17 @@ static void dev_fini_ggtt(void *arg)
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
@@ -466,8 +530,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (!ggtt->wq)
 		return -ENOMEM;
 
-	ggtt_init_ranges(ggtt, ggtt_start, ggtt_size, ggtt_size,
-			 IS_SRIOV_PF(xe) ? ggtt_size : 0);
+	ggtt_init_generic(ggtt, ggtt_start, ggtt_size);
 
 	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
 	if (err)
-- 
2.34.1

