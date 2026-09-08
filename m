Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73587C79FA1
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:06:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4DE10E0BB;
	Tue,  8 Sep 2026 10:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mFZwZMnC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3653210E0BB
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788861974; x=1820397974;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=vBie+TeUPvovHpmGdl0WWhnKpUYc3krMP3X/2i7ElNU=;
 b=mFZwZMnC3Av4MPR2GQu5AjIfhBoUUQEb/9t4jvNH8w+D6Bs+q6f2eUhF
 jnPnangETXtzl/xbkHUhBOn8CGMO4AxHpA1QtlIT5i901RGYl1S1PqsvT
 qr0lL2mZk3OlcQqEimaXO3HC5Y1ylFT1zZyJThNL4I4ebKdf8j0L1V57j
 ThIwGO+tpm24S80qtlFu4H6Qxk/dQmdrO6mDf1OWv4GcAbL5SuNcZALl8
 MTawCEODlEbabCD66vmQrq4J5BKvRld4tEYwgMkq5iA0a0oDk7BRhDk4+
 77+CwJ1FjItOM3WwfPADZho+jyWSQCRjBLeCdd6PkIvk5LV0wBb2Ssxhq w==;
X-CSE-ConnectionGUID: UWAV35QlRl2pAZRuFe6/CQ==
X-CSE-MsgGUID: 6YIoGlRHQaOX9mjGQHAPYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="112036921"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="112036921"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:06:13 -0700
X-CSE-ConnectionGUID: /QIY3RYMRwuWbog35Se9rA==
X-CSE-MsgGUID: On7SoiJ3Toy7mG3Oz0qwFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="295849941"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:06:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 03:06:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 03:06:12 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.46)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 03:06:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WgH4zemjz0bOc4eWTOxN8Xv5NV4P1qGC0vGlUpT9IcXJImGQ196L2cyeDKo7KlT6IuFA7o3bsbs7jPRdb27K1nYTbYBGIXFRx1r7TbE9CdZDWWsCEhBC9A7Uij1qYrafg7WNiLX/xXd7GAiPU5+wL8QddseOUajBLewIFKRsakDQO2+QtoqASmeIgLfLvWaNSFaY7SvzH1+4aGMT7gLd0gDdjrwrvYR8J38v99MZgowS4fNsULz0FvkXPxbdlv4JACnm/Kcvjc1rGcQ8gGzxWF/zVzyMfCu/UsQ+Pm5bdTeUBS+qZuDwj0eaBhmjGOlz8WbOMJqvJkER0OoVlCoEKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQAsvjaQDGuMLt4cHn1bw4wQL3QySof/7gcih8yP4oM=;
 b=d96Vdo5xzgi3g7le94bLWnq2GGaHNr7fLgQmdteQzNirYpJEXMYpwh8D53dqVFejCgUpLrFy2neF4liHCxyRrf5rWAD1jJzRlGQ79rDsgvRu1Hg9P8Ahu6UGR8Q8yQTpSXxm1zvL2h0e1p3njUryXr8cKRtgvW9umIORVZkiEWqgk33EdSqNaMWmzr7LDIlsK1FXb8e2787D9rHJJ3nZ3pjqVo3lZk1wkfsE7abN3L0N/1IrcnMOYlgsZ0R7qa1tLP6Nx52/IHv1tjFFTnGS5gw9HKZF+tlc8cMUV/v4xn5XQEtDSo+sQK4EeS8IkZT90BrEIDV33h0tK+518fYubA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SA1PR11MB9827.namprd11.prod.outlook.com (2603:10b6:806:4d8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 10:06:09 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 10:06:09 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v5 0/4] Separate GGTT pools for submissions and VFs
 provisioning
Date: Tue, 8 Sep 2026 12:05:58 +0200
Message-ID: <20260908100602.1626556-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB8PR06CA0043.eurprd06.prod.outlook.com
 (2603:10a6:10:120::17) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SA1PR11MB9827:EE_
X-MS-Office365-Filtering-Correlation-Id: 211b0932-9f51-4a2d-eba5-08df0d90cdeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|6133799003|18002099003|3023799007|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: NbHKREOvRVft7ebNtgWfbHVCprGBQfVkDkYtAbHEBpdCxAST4uQ/1tpux2K2auWXyK9yTEGySbjl8thZ8Gnzx2Yd2kpC8+8nun2AaoKntjS2Bv1q7MtjNUkCJOLl1Cgt2YrpgVe5RUJ33cjgSG/lhejUK/g4XVlMUHDxHNIiHhETU4YcTi26sC1AlXrgAJMwP0Py1htJ+z+OX7jTAlpR2yq3ST5QHqJ1i9vbsF3BJn86oRVW8WeXXyGgqWfoiJS/g2Eco1c/bJSaH6WjpxODBX2p8e7WEd7oTFu5ZIR+fz42j/YZug6UotBzoLf39ZAadLhD/KlenEwvdYT8uCcrhtsJ8zjeCTXEDATjZmKoRg4UkmtkO6fE35MNDuDE28LJlWwP4iMtkeaW2ljCmIBpq+LlJHzXmf9iDRO7IwiMc09byYcNhfNBUDHX/vDKOVdenaS+iNwHK12s5ke++G17taCMiaiBCqf90vzsQpAmwWFTUe4fs9qtzdb2KcuLd4aWBz3FBboGMLCqVlYg9cl7ZyqZaMxRoRAjuALraPrjjnGvfyUpui+89F58zbTq6vmjg0FkKdZzeoR7NMT9MKnvhSEleaMEFo+8JewRXJNyMxc5IllERjn7kSMpkT8jErDRk8hfHO3fmlNZWXqL85tW3DMwtZZF4fTHfXflFc5yfAk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(18002099003)(3023799007)(11063799006)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mnc3TWFVNll0d3RxSUlNc2pTdUpRbHJUYWJQaE9rUS9CUWtPb01oRGhjZnhk?=
 =?utf-8?B?dzNRay8rTys5RzZXNFVOd0J2Ti9pOGR4OGRMdUlzWEFnS0UrOFlVQ1lubWpr?=
 =?utf-8?B?aTY1ZTFIVVRyQ1ZrcVNVM283bUFjcElNMjJlSTZxSFhNQ3czV2E5aldnM0tk?=
 =?utf-8?B?eVRTMGtaRnJQT2ZjWG5UTi9vZkxKVjhkVnRuYkhYY1VDQVZPTWFWbmwwVHVX?=
 =?utf-8?B?cE5HR2VkVVE2UGJsbEVodFl1cm5GYitFNnlGZUZOOENlS2dDbXpRdFk4M3Nt?=
 =?utf-8?B?MXJDU0VJV3loRlBUOVlnTFFMaldNQ3BoQkVCZlRacjVBSFgzRlUySTBkZ0FH?=
 =?utf-8?B?TExuakphelo4RDJvRDEwVkQwNWpYT3Z4bE9tc0NJMFZwTTJZMG82NWhqVHdV?=
 =?utf-8?B?QXJZU05uUkJKd0FBcVQrOVpHKzZZTXl6LzZoaTlrOXhxc01abDdQQVZFUGtN?=
 =?utf-8?B?NlkvZFl5ZUJ3TFdEYzBTL1J4NFJHVHh4ZlhPbVRtZGEzczlvMGl5VHduakJE?=
 =?utf-8?B?VGdTMWdWOTlCRDVUV1kydFpVKzBCQTFCVklmMm9YR01vY0FIeG1ETURVYTZ0?=
 =?utf-8?B?amQrZlRNK29WYWRnOVNWZjFLWFdER1hKaTNLd2tKVDZjMkdFSXFOWm0rRXZv?=
 =?utf-8?B?d09MQTBCaGRMeEJVZjFIci9xSEVlVVFVTWxrU0Z2ZG9UR1QvQnJNUU1rd0NG?=
 =?utf-8?B?NWRIOWpnaEJwTjRTOWJ1d1c2byt5WVNPQUZGQmJpOXRzNjlMaG9kdHFITlJy?=
 =?utf-8?B?MHYwZkVZTkhWUXZmdTRtR2ZKd3FxcVBjOHhkeVRaVTdxSVdxWUQwa3VVSnYv?=
 =?utf-8?B?YlpybndzSDBaZmZFMEcwY3lWZ0tDRHpQTXNEaTJwRU01WVhNdDJSb2JSakZL?=
 =?utf-8?B?QTJpVU1yWk9SenBRQ3hLZTlYR1IycUM3V2RqMUtUQ3NURmRmZ24zaklHcndx?=
 =?utf-8?B?a1BFNWhMRUpUa0EwVTRWT2t5cEhVTGFGOUNnLzFzdTRxanBFcXhhU2ZiYWY5?=
 =?utf-8?B?bUNtR3Y3cnF5TS8xbkh5WEdHZXFEM2lQNWZWZm1vZ01wYjdscTU4eVNhTDJq?=
 =?utf-8?B?K2lvQlVyNnV0ZmVLVGRIVkJVRVJ0R0FQNUt1Q1BPL1VKNFNoaTExVWw5Smh1?=
 =?utf-8?B?NXlqanZ0eFBEdm5ZMkFrbUY5dmNWTVJ6WFMzdE8rWitsOE12NlVnd3h5MU4x?=
 =?utf-8?B?RkRUZ1pQb2JFV0kwNmRnQzBpbXB6TVpoTjRHdTQxMElHbFUvUURxNWJDVHQw?=
 =?utf-8?B?OHRreFE0ZVNsV1FVVlFpQnllYlNEMmQ5cVMzWS8xUlhZL0hkSFZwK0l0NVZn?=
 =?utf-8?B?ZW9nWUI0VUhWQWl6YXphTWh6SGNERTIzaFVEY2Z1NlgvVnBQV2hMbEs2R2tL?=
 =?utf-8?B?UTNJblhmTGZkMFFUMys4M1Y0c09RZkxPQ1A0ZkFHNjFaaW9vZlNram92N0pm?=
 =?utf-8?B?VmRDVlV1UFIrSk4vR0VudzRsakdtODN2eHNnWXB2L0pDSkxaV0tJM0dMWWFp?=
 =?utf-8?B?ckc2NVNmcHA4ejdsUTEzbmpKRzJwanlwT1lLYWJrS3RzbStObzRLc1RnR2ti?=
 =?utf-8?B?QmUwOEdrSi9xcXhwc1o2OGw3SlFnWFNGaDVqQldieDNrbWkxYnQxb1kremVS?=
 =?utf-8?B?QUhocklTSFkrZEQzTWREdnIxa1NCN2pSTkJvL1h3dS9uYmk5Qk9NMVhmVDl5?=
 =?utf-8?B?K3hZS3JzOVVXaFZXU2FRUFljNXgrZ2FwOVBiTWNvaXh3Y3h3R2tmNjY1eTdJ?=
 =?utf-8?B?VGkvQmVtNEhvUkI5Q2hacjhRaWN2eUlra3hBM1NXMVM5bFNpYjZKMnQrN09q?=
 =?utf-8?B?ZVlHd1hycGN2ZWd0V0NpN3g1d0NBMXN5M3p0YkNKdElCaWVFVnVUSHhNeWNQ?=
 =?utf-8?B?M0hERDJVNFhwRTl3QU9aVlVERGR3UDRjMEthSTV4cFh1d0s4UVJYZ3ZubVg4?=
 =?utf-8?B?c3JHSGF1ZmtnQ0pVaDNHVlJWYjZzdXFMZ0IvSk1aNjJrT0M3K1VMTWhnS2ha?=
 =?utf-8?B?dXFYU3BLaXp1ZWpJSWQ0bFVDazFVVS82RW82bXJOaHV5SUFDN3dBWnlKRHVC?=
 =?utf-8?B?cUkvdUt6RCtvaU9zTmtTRVNkcm8wcVFMeHoxZ0tpdlNqcm83WlB3QkhTc09j?=
 =?utf-8?B?amt3ZGEzSFpKWEdLMk9JY2VvVldFaHBVelRvUmlaVWJzQnVSbStOQjlBNlVi?=
 =?utf-8?B?NGphcDJ0R21rWkplUE9hdjF1ZkVGUXBrMCtlMkhKVjVSam9qaW1aK3MvWjJF?=
 =?utf-8?B?UHllMnZwSC9ybEgvSEsxTFc3NCtkbWszQWdlQ2hXZ1lmNmU1YmhxTVB0NHBD?=
 =?utf-8?B?R2p5QlBMcmR4YkxwbVplMXJtYzFSVXh3eFFZRy92MlROblVIWnZhNlJlOUVw?=
 =?utf-8?Q?12na+AiJHyVpppwo=3D?=
X-Exchange-RoutingPolicyChecked: UBFwLIbdhWE2dPip+SImKKjpuR6tBQ2HMFAkNHAbWpRBo56qhUjKrlxwYph/V49z40bC+InAUmr/JmwlXKMIOxlH9ufNIED1mUrYmVXFRfWs0+I8McMgqrdB74kM9pAW2qljnqdhUH9talqHLNCUCTZ31zpfUs5mJezl2PrjSjS5uXy+eLgeXaEt/hZx7Y8q18Mir530MlEIsAwiT4l0/GICvLwyEDJGXofR9gpuDY++akM2jP+SvfN07Nd6tJF4fD7C9pJxCEZIDl9vDjOhCZTlIbhBzvsDsMuUZTbxLiCgpQvL6cVTv2SpGG63bt2t0TAq5KB0NMbMfqerNS/UCA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 211b0932-9f51-4a2d-eba5-08df0d90cdeb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 10:06:09.2485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/XZnGUfLC3+zoUGcNRbzSGK3RYGOVw4TY84FbEXAurict8a6M7mFkxntQTUJt1f4AydXRphuadY9I13jx2lznEmqNOJxUZAX7H/pXAl++4=
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
v2 -> v3:
 - Init ggtt.lock with mutex_init() in each test.
 - Introduce the hw_size struct field instead of the ggtt_accessible_size
   function.
v3 -> v4:
 - Set the shareable pool size only for SR-IOV PF,
 - Return -ENOSPC instead of asserting when a large BO no longer fits after
   end is clamped to ggtt->size.
v4 -> v5:
 - Add a preparatory patch introducing ggtt->full_size to separate the full
   assigned GGTT range from the regular usable range.
 - Rework the GGTT split patch to use full_size/shareable_size terminology,
   compute the shareable start on demand, and keep regular allocations within
   the usable pool.
 - Move the range initializer rename and full_size parameter into the GGTT
   split patch.
 - Rename the native range discovery helper to ggtt_probe().
 - Treat out-of-range VF GGTT configuration as invalid instead of clamping it.
 - Move GGTT range logging into the common initialization path.
 - Add GGTT KUnit coverage for usable/shareable pool initialization,
   allocation direction, overlapping pools, unavailable shareable pool, and
   oversized requests.
 - Rename the GGTT KUnit test file to use the _kunit.c suffix, add shared
   setup/cleanup helpers, and split PCI IOV tests into a separate suite.
 - Drop redundant non-PCI_IOV stubs and misleading provisioning debug output.

Piotr Piórkowski (4):
  drm/xe/ggtt: Introduce full GGTT range size
  drm/xe/ggtt: Split GGTT into usable and shareable pools
  drm/xe/ggtt: Initialize GGTT pools by SR-IOV mode
  drm/xe/ggtt: Add KUnit tests for usable and shareable pools

 drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c | 327 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.c             | 298 +++++++++++++++++----
 drivers/gpu/drm/xe/xe_ggtt.h             |   4 +
 3 files changed, 571 insertions(+), 58 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c

-- 
2.34.1

