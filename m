Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25137CA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 11:52:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B418910E42C;
	Mon, 12 Oct 2026 11:52:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC3810EC67
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 11:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791805936; x=1823341936;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=TnISZefNZ5hEOiTe5xF+Jw4MXQtIf7071NQYaLDN9Go=;
 b=iXjnP3rnwVK9VQvVRPbdsL2bHQRC9IRRZi3oVFV9yzx8Pr/tWE1kxzDe
 qa5zfGbXWWpd8Wl1JCr24wynFelEHxwIUVYH1jx/caKe49a7lR4fh1PY7
 zwXH6d+b13heEVtgmZJdlE/Xczlt/WChc3kfJUAPKOAfmBDki5yvZHSvt
 NuQFrN/r7jlLCl3zqVy25TCwREx2QquveO2tUZTe8Lkqgx2nF69cLy7eK
 xqtWDH9LBCR8bqlDQB+bafs11gvlEb7xAr/eNF3dbM8nIVDIcwkrT35cY
 jE+zrYbPBqnVCqcOZuM9jCkB/LWechozei3+N2z3csgiAuntsuv0k8+89 A==;
X-CSE-ConnectionGUID: h8UVodFUT/CDZLZzTdGULg==
X-CSE-MsgGUID: +hr09Aa2QRGhV0/nSQie2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="520690"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="520690"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 04:52:16 -0700
X-CSE-ConnectionGUID: mj/FWA9jTiOiSsGDDOj5lg==
X-CSE-MsgGUID: AvuQs3p2RWqUDZtZ4+yoRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="800993"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 04:52:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 04:52:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 04:52:15 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 04:52:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQneNzs9BDU5jHJbFMNhjjbZFC5S2FXq72WwTLlxQfMbA77TDaRY4L+g+xYFmwUyCf8l49nEGpfMSZtljNwZR6hk5yff9Ba3uKsEOZEl1kAZkjOg5MFRxx5pDhv4nmLc9fKEKiQ+9nCTV1HTHUGIQtIIg0bh0ORVlPpDvp0x5Rjbyr4LJ/E8esBLPDGsnWBTZJZNJmqYBa/fFMr25c/qp4afY3uttfMpHR+Ansj1WJCyeOCTFeVUcAECTlXhpDA0fOPhj50Amwx3/We1M18dBdZZe3v3Q0udJ+Er+P4sdfuhmkVPgEm/y/ar87Kn8ZfKzqYFsT1jb/Ynq8X2jtECtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Csav1AnzMk7TelqtLtbK7c8ym34g/5MlrBk34x4iJBM=;
 b=r8vONmX2wfNUF3ApsOARRHZKu4tP+I68Tv8Q7SfehlY6KwbdOeBOCvuZU4IhOIFj8etpXM7rJBi/ypQ4R1l+GclmjL1G77XOnIEDnBZ/QzlUXmc9ubD9Ndpt1q9exLYhtCjsHW/g8QBTGRVdIo4dLRISnbPRZoFGmMnf6I3L0xxs5tK9W33Yyr4yJ6nX3xPV8/woYoFF4s/r36WwXqHssWGRN0/LiNwfC/j9MNPXAIuAyAKc88iB6uuqEykMj7WAOLmlMOiGiv//VtFPjhrylYiggJLBfyBKrnlJBQfUVjPIcFkAnjAY0N9GhTJjVUpoy6MMb7WdVxuDPb8b52jNVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH0PR11MB5047.namprd11.prod.outlook.com (2603:10b6:510:3c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Mon, 12 Oct
 2026 11:52:08 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0496.015; Mon, 12 Oct 2026
 11:52:08 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v6 0/4] Split GuC ID space into usable and shareable pools
Date: Mon, 12 Oct 2026 13:51:39 +0200
Message-ID: <20261012115143.4100364-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0059.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::13) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH0PR11MB5047:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cf58d2a-94b0-4a99-e607-08df28573e0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|11063799006|56012099006|10067099003|6133799003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info: kQW7VpKnF6L6lDJ5lzi68v5KUYYUVfVqTSlMIaq4i44DUC5suCTZA2FjtjhAul8V0INgHRALvcVozab7E0mvVS/faq0xr3u6Yvi/m6pqbYIl91ByFLMZ/bgMN8YkUjuixguOAZ3VyMNZBP+adopt2clR2dFnzvYgZbL/fc7IJtV9oBBBQGBWX9ZQrI2NKlBOPlLGe9W44qe21Zq4BAC3UFLh6lPm0pIcg163MrH4pmxSlsQRt19GRsmNzpCfHvipVcXH0k1LadQ/g9r3C7RY1jCXb3pdy6ORCCLb3Zw3aRiJT9MKSS6H6JiBQ2PL2doO15coP0mDpIpaE0f1g+ussLSmh1ZkR52NblwS7h5aS5JPLQtcRwxMgDviuyRaJReDKD0VZRb8AlIx6lqrra86fjSrPADRB6mh6PM+YrXra/6MeDh+RojlAeeykUlJEysUImeY79YzYGgxcp20yqfqI8C+02DJSmBWfR4WTAnDlHDBn7WdeGg/kjuloNSM2/uc/VahjzhMQETuSnh2V4Hr6/1KAS0YHPWvHHQrAVp30Wfi+cDNpGjoN2U4GJ8DYuofolvFSIXgNXwOM4yl+HmIHR3h3TOWmlMjXL7dk6w70VK8l6lGUvIZyYbyajN12ryxBsn8i9kq/2q4BwDfevF0SW+JUDztJloFdDirimPHx1M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(56012099006)(10067099003)(6133799003)(261009223027099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STRIZ3NLMXg3U0JGeDc2OTBrN3dPS09aYzIxTjloWm1HMU9FL3M3REdHQ0Qx?=
 =?utf-8?B?ZEhyQlJVcUJTcndHK2NYYkFEY3puZlFFZ0JoNmdtaHl5bmpJRU5lM3pKbUta?=
 =?utf-8?B?YmJUS1NWd0E5eW9nWGkvQmFFeVZlY0pYV21lOVVGVy9KaExLaDJPSldjMWtI?=
 =?utf-8?B?WlJaUDJnVHhyY1JuSFZaTFdkcHRCaU94UmxRenhGWGJFNlNGa2xuRUgzY0Ur?=
 =?utf-8?B?ZXcvWnpzZ0cvQWt6N2VaeW0zbEFDdDExTlVBNlZNVHpRdU1LU3NLbHp6TVVa?=
 =?utf-8?B?S3JYeERkZ0JGWTdaQ2o3bVd3S3pEV1JtUU5IMkNUMUlTSXUyR0o2T2pIVGhy?=
 =?utf-8?B?clZ1NVQrblFseTVBMDJ3TTNrdUFYcnJJV0sydHFqMUxHcVp3UUM0aDdJdUxz?=
 =?utf-8?B?ZUlrWldTdXBnRjQvSjRxWS9lZnNzMjdSYldDQWJ5d3RJdGQ2SmlWaGVXakdy?=
 =?utf-8?B?cndPbW9DSlFLOENlTzlGMHM4Sld5S1RXa1FwM3dRN3dQN3ZOajhOQjIrWjFp?=
 =?utf-8?B?dCtaaVYzemcrZFlKTFdtdEdVN2J5dHFQb09zcXlvWjRHMU93dFd5YXh4QjlS?=
 =?utf-8?B?WFpqL3lwRFppYXpud1JFQ1dXL0xpWHVFTXJ1SFFMVnYwZFJYakdudEsrQ3Rh?=
 =?utf-8?B?clNJbksrQ1JYQzhpam1DNktteDlkUTNFZlFyMWxnT3VhOTBhaTVnWndaamo2?=
 =?utf-8?B?ZTFVdWdjOElSeHdUNi8yc3RuckgzNU9qT0lRbUZ1dWVlaG13U1loWGJ1Y01K?=
 =?utf-8?B?VjRQYWwxQ09BWGtoQ3l0ampTREh3SXRSQkZyNUFLMXgweDVLN1ZET3ZYeFQz?=
 =?utf-8?B?OWpRdUFOd0czS1BBSUo5M3RyUWtWdllLYk5TUTROZHdmdGtYb3FnOVk3N0I5?=
 =?utf-8?B?N0dHeFJ4ZG9DRnRGWmVYZCtKdlA4K0lzVTlrTXJONThNaFZnZVgyQlloSWdo?=
 =?utf-8?B?LzRaNTJlTkFiakszakRtaGtVMzB6Z1dmTXV1M01EZlRGS0d0ekRSRE5YTFJC?=
 =?utf-8?B?VG5td3l4elBDNEI4czJrODRlN1dDRWRldUdleGg3cjRwWC9nb1RyZ3BCNlVq?=
 =?utf-8?B?dXJLRU1lUTZ1cE9sSEkrRW9Uelc1RUc2cFozSU16OFE0cnZhaWZBakRZVTZO?=
 =?utf-8?B?aTVZTDhhREF4ME9pY1M3c1B3ZWhyRlY1RkMvbVdZK3p1NzVpYWhYdXhmcmtS?=
 =?utf-8?B?STRtMk5DVmJVb2VNdGhLNlFBYS82emJHanZ0WitWQWp5Q1hiU1kwRTZQZm1Z?=
 =?utf-8?B?VlRSZUFXeHFPUERLZEE0QWluNHdWMTdQQVlKNmlVOGxJMWMyVlhVaDBQVFo2?=
 =?utf-8?B?VXVINWk3VUExSWhSQlFRMEhwZDcvaDVpTjVQdzFlMGpsQ3NSOHJabnZ5clJ4?=
 =?utf-8?B?VkFOSU8wbTJXSVcyeEh2ZnVKeHFrd0V4VXkyMXRwOGtYL2dUQi90T21qMnQ3?=
 =?utf-8?B?NC9qMEx5aTYzOVMvdTc1aFVjdjgvZHQwaE5ISXNwZk11MzVUTzRxdE0ybFcz?=
 =?utf-8?B?T1Z2N3lwQTgwaWRDU3FrQnJHeGhOQkpEemUzMkJOQWJzSllvRmZYdzBhRjE2?=
 =?utf-8?B?TmJjNUpPV2xRSGFkLzdtOUhPemp3Z3VrOVR4eUFJOVlpd2N0V2tBSHkyZUhH?=
 =?utf-8?B?dHFoVEp2SnNuTUFlN21Jam9sSVBYMFNYKy9uTlY3d2VyNDBScDhMeDFrUVdO?=
 =?utf-8?B?SVlGdEl4SFUxeTB0bFdmR3hnSngyQ1A4d2ZBZ0psN1RPY29rQWVCdll0NTk3?=
 =?utf-8?B?eW9aVHliSElLdFR3R2ZyYTJsNW9LSnhjNEwzdStITjZJVUpqOUd3cUxiRTlq?=
 =?utf-8?B?dHA4dStEckJtN2MrV01pSjhFaGJ0TkpnWWtwUlJEeUptaHN3K0FvM3BRRmxF?=
 =?utf-8?B?NHdBbjl5bWRwWEsvT3dyYWM5SE1ML1VIWVg3THA3R2xlWHp4cGJEL0FGcjFX?=
 =?utf-8?B?dGE2WUgwMGxyZ2diVDhBcUpheVQyUGxtbHYwczV4VS9WdXMzdU9TTERZVlBa?=
 =?utf-8?B?QmpCVjNlSDdMT3Y0bXZPQUQ1SFdncnRwR2puTGtNekRkaGp2bjROQ1QraFdw?=
 =?utf-8?B?Z1c5SUhFZTA1dUZsZlpJWmZ3V0QvOGxTY2ttOWN1QmhqOFFybU12ZUtwVmQx?=
 =?utf-8?B?dENqRTljdnAvZTlhRXdXcy8vVU9WREduRFQzUG1DN1h6RzdlTkplR3JJQTI3?=
 =?utf-8?B?YU1TYk8vRktCSFNISGxQRFVBZ083bzNSZDdRRmswMy9oK2dmcUNEN2J3NkJk?=
 =?utf-8?B?WlJOS1lpVUFPNklROEtHUk9lOWtRWTFyWnZBQ081NUp4ZGRrK1RDY3k1MFd2?=
 =?utf-8?B?YlJqZnhNTFNselVqazNBY0ppYUFET0JZWnpBMzQwWnViQmVPbkRJS1l1elp3?=
 =?utf-8?Q?obfykOX/E1y2Cmak=3D?=
X-Exchange-RoutingPolicyChecked: igf6O2k7j88otM1hnV9AU6iZ/3zHd8g0UI9DbL1iVOGpu5cLhpQjTZMJ0js3f86Q/hjwT/TXDGrJjqCoIY5oJlInwMu9unXdrIkMmCskOso5VAQNeLSOkVB8AiYe66L5YHGxjElKLJ8iwVBLauseyGgKG2bpl/DE8IuQts/WO87crZTHghBBARjirrGp/mqcyXXs6qlWzt73QqVUUtQb9HLLO4ENGhnUCSSPeR+llcUfML5aGeHWZg1ETPpJp8uOIoW1w13pun05mGHNt+oXv8tYfXiN5eqhsHi6lYsNQ/Xc9O4eN4RTy5ruexUZWgRbc7V+8uqS+ZFJQyXGuEedLA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf58d2a-94b0-4a99-e607-08df28573e0f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 11:52:08.0286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rc1QtW/NS5h/96EhrdOrk2Vt6tgczTi59VW8jy3gt43npzdh7b+Qh0yCSNMPLrt9fdX3ZJkgXXpNy0gH4uXPUlk/8Bzw+TwSm4sD2QSVqtg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5047
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

The GuC ID manager currently treats all GuC IDs as a single pool shared
between GuC submission and SR-IOV related allocations.

This series introduces explicit separation between IDs that can be used
for GuC submission and IDs that can be shared with VFs. The ID manager
gains support for independent usable and shareable pools, dedicated
allocation interfaces, pool-specific accounting and validation, and
extended test coverage.

To preserve existing behaviour, both pools continue to map onto the same
GuC ID space where appropriate. GuC submission is updated to explicitly
allocate IDs from the usable pool, while ID manager initialization is
adapted to expose the correct ID ranges for native, PF and VF operating
modes.

v1 -> v2:
 - Fix issues reported by Sashiko (top-down VF ID search, KUNIT_EXPECT in
   locked sections, xe_root_mmio_gt() for the primary GT).
v2 -> v3:
 - Guard failed ID reservations before releasing test allocations.
 - Fix shareable spare quota accounting to include PF-exclusive usable IDs.
 - Skip some tests required PF mode if there is not CONFIG_PCI_IOV
 - Some minor other changes
v3 -> v4:
 - Avoid releasing unreserved ID ranges after failed test reservations.
v4 -> v5:
 - Do not apply the spare quota to shareable IDs reserved from the
   VF-exclusive range (Sashiko).
 - Drop redundant range checks and unreachable asserts in the ID manager
   initialization and shareable reservation paths (Satya).
 - Use a local variable for the max shareable GuC IDs in the PF fair
   provisioning profile (Satya).
v5 -> v6:
 - Add an idm_check_quota() helper and use a single -ENOSPC check in the
   shareable reservation path (Satya).
 - Fix check_used() cleanup after a failed reservation, so it no longer
   releases a zero-length range (Sashiko).
 - Add missing early-return guards after failed ID reservations in the
   remaining KUnit tests (Sashiko).

Piotr Piórkowski (4):
  drm/xe/guc: Split GuC ID manager into usable and shareable pools
  drm/xe/kunit: Extend GuC ID manager split-pool coverage
  drm/xe/guc: Start use explicitly usable GuC IDs for for submission
  drm/xe/pf: Explicitly use shareable GuC IDs for VFs provisioning

 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |   5 +
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 724 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  21 +-
 drivers/gpu/drm/xe/xe_guc.c                   |   4 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 461 ++++++++---
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  31 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |  27 +-
 drivers/gpu/drm/xe/xe_guc_submit.h            |   2 +-
 drivers/gpu/drm/xe/xe_guc_types.h             |   8 +-
 9 files changed, 1124 insertions(+), 159 deletions(-)

-- 
2.34.1

