Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C8E606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 08:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IaIz4E8n
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000CC10E594;
	Tue, 20 Oct 2026 08:43:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFE410E594
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 08:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792485796; x=1824021796;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=XOe77WWYPO6ynIUuCHlhYyDG3Wpaz26oruof9eyZ6Dg=;
 b=IaIz4E8n4YOPZ4TpviAJ4qtVpQbgjVnaqJll/MIcGQOWPD2aVi73e5ig
 ivtRABa9pjsgYwKKEY6pTW0hyYdrSwlkGTf0qEJD1pHcm9gr2MlC6czhu
 wtskBrHLTPXJ9XDsdWxB4PkDEOpA/oX2RWnTAIk2vmHQeW/PNJvlivtn4
 6a6D7hoC6ge7fU1X2Toz341I03WuIMY4v9C+NSR61o1mO7IpVuoei5K6L
 ESlZMwaECPm0L4XzEa+POR41hiZA3ZCE8wfGUs8q1LOwDyxPuyl0pUv5b
 HUdA9O915PZTAjsRi2LfUFo9Pal5k9tA09yQWhcZRpj0jgROiXFjWCJGZ Q==;
X-CSE-ConnectionGUID: g3lZh+zYRmuN8TTn9K6z+Q==
X-CSE-MsgGUID: 9nHs0UngRqWIuwknu3OK+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1072096"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1072096"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 01:43:14 -0700
X-CSE-ConnectionGUID: Yj13u6MfT02qtdPPHSXrMQ==
X-CSE-MsgGUID: mZZMtuFaRIOSkhUZC6kW+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3221492"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 01:43:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 01:43:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 01:43:14 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 01:43:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nWTCHGwz90nUTknAyiRICTQhEjO5h2sCDnkC+BpLaLJRT2yBHZbpehOuSEs7NXOCQ9ZQ6KJhgeTXQ7RCU/6W/muEqgUGIH9UgDVgbGnGILgVybtOwcKAA0zGycNJ4cl6PkTP04I6Sxf5t+3rNvqW+99Cft5vYpMWsp33FkQBKoqNI/swbTBNSvJFLzMiO5ATqADuee/3QyB4Hg8k4WEyLDcKBIchBzIiR5uv7mgu8FftQndJ10KOXLJrxHpAhtzJyrpn6wsE5tNuVRcDC+lj95Y1Cn0xP4eR8pHVG/jvxfD1Y6PEwYKvBzzI5U7aruxWgt9/yw2hEgBagMVtnFXDng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmOxR0biuk1/0fdiMSOBMoOvdbM5JqBXdhX4LFTuznA=;
 b=EKoqtZOaqmj15MAqMd0UDJFNX+Sj5P+O+RrgD0dIrGCvVwtbzlk4F2IYC+zs8w5dxIXbuBy6M+h5slajGPVkCU1zrbUWcx40mlf13mVijB2PcqdOJ+RpcDzc7QgnefxthcGD5i9HYe1cquqVSYR55beTv+0BWz4+C6nwM2HEJFLh3S0UmQJHVM6IjF8V16tr4+3gFAakOw/HIuy+upqPzBgcCuLO8LMMA1kwxC953RkQjvc62LJmhvB26lkM6xv4sWctme9Dl+jNsYhaFS8T2GBykjnYwSYRZy4I9sKK+CmQye9q/flg7Mxt2CtvjL+W1STlC+4dIHDXfZj/vVHHmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DSWPR11MB9581.namprd11.prod.outlook.com (2603:10b6:8:36e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 08:43:10 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 08:43:10 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>
Subject: [PATCH v3 1/7] drm/xe: Define partitioned VRAM manager types
Date: Tue, 20 Oct 2026 10:42:52 +0200
Message-ID: <20261020084258.443645-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020084258.443645-1-piotr.piorkowski@intel.com>
References: <20261020084258.443645-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7PR01CA0031.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::10) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DSWPR11MB9581:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d699d7d-2921-4341-639e-08df2e862b6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: GQTykswctmIyEnlcii5NlQXaZkaehUL66mK0LPx6aa0olknGit937aNQWVKHabmthOXAn4jc1ON7MnRnUPD+79XeBowDZ6xum1S79avOUkzHSJAcv7z2k8Ow5rsTv8HR7Se8DTCGPqoht5xXhnwAoXNlFdUWvN3fNJQ3yn+jIkj8dnYWGVlFIOY5hCeIbhuKajQ105/ZBGFvVUGIMPtbJamE6qN/uaBgZPO1vB5X49q+lF9Ilo4sArLr/So7YzboQCuI6yuUmeWFOan2vOhT+HxFcr/S52Qad1mpWs5KFTXVSHIDZMUWcL2Pys7QwFq9MBK6bIfLSIYl3O8PZP8izCKSND0LcNd2Q7M553Cj6saPpmncQK9Ba2gZfzput0cSAPmWt8WyY32mSHbrCo+mxRzUY/F+84pjRZPO/JNCgVo3ikt02TRynrr3M+XEg1NFlbZg7KXaelHl1W37yAZAnQfjRLYCTfmaXp7ICyA4HMTOfBTyzj+Gts4+qldpIl9qLp2rZt2BPNLsN5sSiPpKbdE5yz969VKcUbGrHwff24RprC0ShtnYPOc3l+r9QKW7qai7ouFe8Vcy3bXtP54jT/OoUbSdXyp+KTw8dZgT7X8u3a92Vjg4UmK7q/15fA8ZjBrYnHvmjbyO+NORflNh/q7OQekcP8IHaD8zd8eC3So=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUtydW5NNGl5bEcvTHNLanlSK3JHYWN2K1BuMENpSDJpRmVPc0pRVFBQN0Q1?=
 =?utf-8?B?aDlmbFBOMzh6NlQvTXdoWjE0RGVsV0l6K3A3czhtVTlubnZXNmZOWk95Yk9Z?=
 =?utf-8?B?alpkUUJYam44TzVERVFSVVE1eEQ4eW15TG85S0xPU2VweEk3cGlpY01xTVFB?=
 =?utf-8?B?eGNIVEJoUzA5dkFkWDRhQVhnVyt1TUZ3c0xxM2FIcjdCL1pWcjFON0FnWWpI?=
 =?utf-8?B?YmVFL01aYnlNN01hVFlXcjlIUWJuUm9yNEtab1p5VER1akNWNEFNZ3UvTzVL?=
 =?utf-8?B?SnRWTjZNR2xuTEltcWF0RkJ4QVJ0elhlVFEwVnk3bE0xaTBQYXRkSDNycE02?=
 =?utf-8?B?MlQyQU90THlyUmFmN2IzSGkxSmUzejNTdkZIVGR3RmpvcTFFbnRBbXhqVVpB?=
 =?utf-8?B?aUVFbkxkYVBXVXJCTDFsT2NOSDdwMlY5QTlmU0t6ekU0MnRvVlNSRzhJM3BM?=
 =?utf-8?B?V3dVMnIyVkoxamRoYXNXMTNYNHlRdlBRMDZLSWFIaDV2VzJ5VmY2cTZ2RGFN?=
 =?utf-8?B?NXlCZ0ptdEVMUFd3YVA1VTdoaTNGeGNTV1JTcm04MkZ6ZkRaVmpGTVJHcmt0?=
 =?utf-8?B?Zm5rYm8ybDNaY3I0WUtYZ0V2eDlscjZFNGh1aEV2SE8zMWZPRnZ3ckRJZUdC?=
 =?utf-8?B?UFVjWE85U1NwYnhiVW1HenBVS0lzcG9naEMzZDRmelkxcThVOW1tK2lMd21v?=
 =?utf-8?B?RnZQT3ZNMjlrcWtNTGpqTnpOTHlKS1BXRktPRWRmRkJlWFFlbDNJcFlOOTMx?=
 =?utf-8?B?dzZ4Y0JKMU53OEhWSE82cmtPamZoMHBMRVExQWU2djRzVklpS2tLcVVHY2xE?=
 =?utf-8?B?MTZiUjMzTHV1NDZYOXhTb2YwekpjTzlvdlR1c2FNYnJIWVZCWitqazl1YW8r?=
 =?utf-8?B?cFc2bkFZZ2xQd1BVbytVK09SM2VoUkp5SFgrbUdzU0NmWVViZVg0dU1RcGcx?=
 =?utf-8?B?c3VpUFVwYjdMNVRGdDJQTWF5c3RrRmJ2ZHZibWk0VDZ4b2pZY0JEMmw2ZVBm?=
 =?utf-8?B?eU14SE8reTNCN0lSdGwyVHFTbmNkOHcvUnVTY3NYdzVsWVlLMjU4L2ZaSi9E?=
 =?utf-8?B?U0wxZkVvbWNrTGRoNytXdEVyTU1XVVZwV2gxeEhqaExkTUZVMVFocmM5cnFa?=
 =?utf-8?B?elFIUlZ1ZEtKWXhnSGVURGJqMTBiZ0ZnMTM5Q2xSbXJqbzd4d1pLM1pIc1Ar?=
 =?utf-8?B?a3ovUkMvYkVia0MxMllKY3NnUG4vQmFMMEtIS2lMRFVsYzM1VXM5cktpSjE2?=
 =?utf-8?B?VlNpeWg1ZzVoeGVjdzJCQkllamlCSUpVVXJmTmovNkVpSGtwdCtaUGlORjEw?=
 =?utf-8?B?RTIvWjcvaE9zaVVpQmw5YktJeG9OdkIraGhQMlR0QzRrMzBiaUMva3dxbXlD?=
 =?utf-8?B?YkR4R25XT05kNDM2clhqVG5LaWR2SVYrcXozSzJ2L3plZEVCNnJpbHFERmx3?=
 =?utf-8?B?K1pZeUhzSzRvVEZFaVlxbTVoNk9vYWhMMGQwSjN6QWVMWi9yc3N5OCtWYmZL?=
 =?utf-8?B?ellIV0hXOU9lTnJPbnJqWnlGQTNSa1hnTDNHUFg4d2hoRjdGR2tHZWJGVjNZ?=
 =?utf-8?B?cEQxalZ3dWd5L0s0NFlYUEpOSVB0eUN3RnFmamFmSVA3OTRna0RydkVIdDBs?=
 =?utf-8?B?NUYwZkV2eDRHVjFiTGo3TjRDaUxwN09ySVA5NFBCVTZKVHRrYjVaL1p4akkw?=
 =?utf-8?B?REYyUEQrb0owcmhacUpwVW4zUHdIT1hwTXFGSjErZUtsZWgzeWQxUklROCtK?=
 =?utf-8?B?ajhJdC9OT2V5VWtMQndBaWtpZ3Fkb0lzUnY3TFkzSkU2TFA1bmtFY1F5dSs5?=
 =?utf-8?B?cGRiS2RHc3p0dGJ2SC9BMWl4bFVKZnBxR1d0QTBDMkdDMkpOZzNwS1BlU2tz?=
 =?utf-8?B?Q0FDd3BBN3RoMkMwa2lkUTNjcHJoZ3k1QXdSdzFObzFSM1k3SHYxL3FjNXVN?=
 =?utf-8?B?TEtBVVNiK0UraFE5bE9VY2x5VnJDSkFtcjVsbXIvZHE0VGgxRVYyQnRqY3ly?=
 =?utf-8?B?RTBFWFllcklIQUcyYzFybG5HenRWVk8zTWNPa2pzMG52b2x5TzVOZENGajUr?=
 =?utf-8?B?azhUVmdxMHI5ZFVlYnlKbTl1WUM5VW0wT2FwNGxVYS9rditaRmo0M0t3R2VT?=
 =?utf-8?B?QkM4UzNFcHFFL0ZEaDFtVHJySUlCQnBVS01TTEVMSkY4Um9DVGd1Z05JNzRJ?=
 =?utf-8?B?M1JIT3lPUnhmTmhiNEN1cUNMS0kzYXExTHMrdWpuUEtFK2ZWdlptZStTQk1o?=
 =?utf-8?B?OW9hWGppTGxSeFoxU25yOGVUTGFJZnltY2JMTmJqSzh5R1lWanNSSnNVeGdn?=
 =?utf-8?B?U1hQZlkrWFB5N0dyRW9XTGpjOTdDbVVGVzJ5THZ5ZTFZNTIyNm0weGxMZEFj?=
 =?utf-8?Q?i0XlTVbYYsEItJwo=3D?=
X-Exchange-RoutingPolicyChecked: 15XRFlNs0v6/o7j0jbSOf50/ec5fRrQTNAGCeN1X4TpBEE21LOOr8mcunwDhNGGDy52KsIXqlORAzGlFHGRRbWLr9O4MVxt40uwBRhi1I6tF9GC0wUH46oJFg+vCXhjp34sLIeFIJKHFUiTbkCFEicsqldlR+b5Aj0yc9IF85jVT4twmiT8JQxJwpkQddbYA82V2WzZqDh28Ktc21uHP0YYINGUX9pyJxuNon5FvYzvytTI4rZeRqfAhd0JZ5OCBz0tg0gAdRPO2H2IvjMr2LF6qahK/vBoSZtOg0T482GiYH+vyHzO0Dx3lCDXX20V6r1z6pxXyWrGsgdvL/KhHAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d699d7d-2921-4341-639e-08df2e862b6f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 08:43:10.0124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gZmxWTfsxUGJh3kF8Y3bpUiaeQ6SP0v6ovAdzaDBkkhQyClMlyB6ikZBlZT07pXykgRgT1YGfUwJiRuidBUBRvzBTq5PfFqc/wvdMsHvSNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9581
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

A VRAM region may need to be split into hard partitions, e.g. to keep
kernel allocations in a dedicated low range of VRAM. Expressing such a
split purely as a placement range would turn every VRAM allocation into
a %GPU_BUDDY_RANGE_ALLOCATION, which constrains the buddy algorithm for
what is really a hard, statically known split.

Describe the types needed to manage each partition with a buddy
allocator of its own instead. struct xe_ttm_vram_mgr_part ties a buddy
allocator to the VRAM pool it backs, the manager holds up to
XE_TTM_VRAM_MGR_MAX_PARTS of them, and resources and offlined pages
record the partition their blocks were allocated from, as buddy offsets
become partition relative.

Each partition also tracks the CPU visible memory allocated from it, so
that usage can be reported per pool purpose, and the alignment a
partition base must honour is defined next to the partition itself.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Assisted-by: Claude Opus 5.5
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index 4a2cd27a5b617..1da3c82b28585 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -7,8 +7,46 @@
 #define _XE_TTM_VRAM_MGR_TYPES_H_
 
 #include <linux/gpu_buddy.h>
+#include <linux/sizes.h>
 #include <drm/ttm/ttm_device.h>
 
+struct xe_vram_pool;
+
+/**
+ * struct xe_ttm_vram_mgr_part - Partition of a VRAM region
+ *
+ * A VRAM region may be split into disjoint partitions, each managed by its
+ * own buddy allocator. An allocation belongs to exactly one partition and
+ * cannot span partition boundaries. This lets the manager allocate directly
+ * from the requested partition without resorting to
+ * %GPU_BUDDY_RANGE_ALLOCATION, which constrains the buddy allocation
+ * algorithm.
+ */
+struct xe_ttm_vram_mgr_part {
+	/**
+	 * @pool: VRAM pool backed by this partition
+	 *
+	 * Once the manager is initialized, pool->part points back here.
+	 */
+	struct xe_vram_pool *pool;
+	/** @mm: DRM buddy allocator which manages this partition */
+	struct gpu_buddy mm;
+	/** @used_visible: CPU visible bytes allocated from this partition */
+	u64 used_visible;
+};
+
+/** XE_TTM_VRAM_MGR_MAX_PARTS - Max partitions of a single VRAM region */
+#define XE_TTM_VRAM_MGR_MAX_PARTS	2
+
+/**
+ * XE_TTM_VRAM_MGR_PART_ALIGN - Required alignment of a partition base
+ *
+ * Buddy offsets are partition relative, so a partition base has to be
+ * aligned to the largest VRAM page size in regular use, otherwise an aligned
+ * buddy allocation is not aligned in the region.
+ */
+#define XE_TTM_VRAM_MGR_PART_ALIGN	SZ_2M
+
 /**
  * struct xe_ttm_vram_mgr - Xe TTM VRAM manager
  *
@@ -19,6 +57,10 @@ struct xe_ttm_vram_mgr {
 	struct ttm_resource_manager manager;
 	/** @mm: DRM buddy allocator which manages the VRAM */
 	struct gpu_buddy mm;
+	/** @parts: Partitions this VRAM region is split into */
+	struct xe_ttm_vram_mgr_part parts[XE_TTM_VRAM_MGR_MAX_PARTS];
+	/** @num_parts: Number of initialized entries in @parts */
+	unsigned int num_parts;
 	/** @offlined_pages: List of offlined pages */
 	struct list_head offlined_pages;
 	/** @n_offlined_pages: Number of offlined pages */
@@ -47,6 +89,8 @@ struct xe_ttm_vram_mgr_resource {
 	struct ttm_resource base;
 	/** @blocks: list of DRM buddy blocks */
 	struct list_head blocks;
+	/** @part: Partition owning @blocks, set on successful allocation */
+	struct xe_ttm_vram_mgr_part *part;
 	/** @used_visible_size: How many CPU visible bytes this resource is using */
 	u64 used_visible_size;
 	/** @flags: flags associated with the resource */
@@ -73,6 +117,8 @@ struct xe_ttm_vram_offline_resource {
 	struct list_head queued_link;
 	/** @blocks: Buddy blocks reserved for this page */
 	struct list_head blocks;
+	/** @part: Partition owning @blocks, set on successful reservation */
+	struct xe_ttm_vram_mgr_part *part;
 	/** @used_visible_size: CPU-visible bytes consumed */
 	u64 used_visible_size;
 	/** @addr: Faulty DPA reported by HW */
-- 
2.34.1

