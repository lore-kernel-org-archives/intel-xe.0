Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32149606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 09:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GtgQjT5C
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1BF10F482;
	Tue, 20 Oct 2026 09:56:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC62C10F475
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 09:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792490161; x=1824026161;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3CdZSt9nXsTntu2HsyldmHuW2ve2OPTPOirSg2LE3uI=;
 b=GtgQjT5C/tf6eM10UKBpP1t589h/Qv/SVBKJaUL1Xbllqtu0+9hlbRYn
 UHqI/foKnpgJdPoOWdYkK7oE55aqOoFGvf8sRPivWcoKQ5ZHEFsuVj3EN
 8P5ASSIhQXqSnnibbsIWev26f5Xkn2U2YwmAYmOHK1CWSWz+1ndDrfsm7
 ZMujn9M4xUFpncKRWpMdQ8gMA8toJTvsnDkno/zgfWx7Hojq/uxmizGR2
 ux/Tps2GGne9JAZZ7Lwd2f6pfWPqZuWwu/Ja71Xeu79dZwvYlzW9aNRQl
 zWkWStN/R7ugMXNAOHyYaabKHCFvZw+u2LLBVzqjFcJF1jS4/9Gaa7FlA w==;
X-CSE-ConnectionGUID: QNn/kj5MQRyV43k/OSvNMw==
X-CSE-MsgGUID: 0KETeu+PSWW5t0gT5deOGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1216442"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1216442"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 02:56:01 -0700
X-CSE-ConnectionGUID: BYXaQ1OFRmqpydwe010/0g==
X-CSE-MsgGUID: PizFA1GDR3+P1azNa4vjHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2667711"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 02:56:00 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 02:55:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 02:55:59 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 02:55:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Es+JrvZNA75VVxdT58Rhs9AxP3Qoe0n94OJqAGA5b8vFMCS7E28l8zx9MqGSfMdC8TRZaH16ei9ppMWhGQnb5Qm/WPVVnHfy2dXwnY2rHahkUu5/V2ms3YirnV3oFOCcnBjn0kE1Xq7vUOwZ5K3E2s4q3ScF8VI0C81zocPK9VG1honxQcRKDfaSq84i6jNSpKu4OpFXb0MBEl+MBhhy/7VAuj+DPb9u0QUN4pVwaZGOepkwNM1vW2nVURPOGSQnt1DurNYJ4LSFyVdqI2Rf7EKvwPihUSpzkYUV5JtGVt4/gz01uTKImPG8/URZtbML+I/A6zvQLqpqaClfG0DqnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vnVmdITIE26zboEUP9M5PS0PEHE/Su9vdH12pCyKMlY=;
 b=txHWoTe/QvAm97465pezsmCvXL8HZEKmmp1Xmw70VtUiM4bmmX/laBU6a/9mxMYp6quiq8BYpf82q4cwCUCyB3lpkVvord3RPIjgfmqNLgJNUdOVJeArc1PagXt/SAqS1SBwolNjCo9b0E6FSWqMvR7acvr9w/Oj3W7gr1eLsHZnKp1NeO/epkRLqPSu/Ckr6JmZrWcLlU9DFZ0TYSKSSjv5icLRw2jqVuMBk6BUa9SVKZ0Q1wfdxy5PnodxRy7DqCjgrntUiX0cSHWSEF55eBx9nyq5IjHioDWkB5V38kL76p9LCmk91cDJegyyyid9qWV3fUqt5vaTSzEuJDDDrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by MN2PR11MB4645.namprd11.prod.outlook.com (2603:10b6:208:269::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 09:55:57 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 09:55:57 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v6 4/4] drm/xe/ggtt: Add KUnit tests for usable and shareable
 pools
Date: Tue, 20 Oct 2026 11:55:32 +0200
Message-ID: <20261020095532.473609-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020095532.473609-1-piotr.piorkowski@intel.com>
References: <20261020095532.473609-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CWLP265CA0287.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:401:5c::35) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|MN2PR11MB4645:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a96562c-a10d-4fc9-a0d5-08df2e9056c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: rtMZYtW7p+B8Uy8JYUmO8RWpGFDLriv1rdYO6XJslQNk+QqWOzNR/40DvtoOe/HlCeqkZbxUroqXn7/zFN83TOeCvnO8KY1M4/d1m1Iy87D0z4xsvGpsYDmUyc0caQGotVhSXB9UOq9ZRrx/aONflhxjHdmdU9ZncufyaWGGtjxF2Jtcs/RBU5VlAcOLFoNoaix2GquV/5Qp3dsP2dw1uVSYuoMMrELV4wGY6OCtjfcWgTDH5sNBrYOo/5Q4jrjZqWxC81w6YaRoqI24y0OyDbHoR3+rTWP2x1hxxZZtZ+nAoWPffWb/gs6V1QTG4JROs1iRCa0HQWQMR2o2bw6t3Kqq5PgNPZingWvqXrPMesKKFtyeeAlndfCYxLfGrsZlBectaScicoDn6GlLbXhNLgy13xSlEdhZ4jZOyKE2VJCyzNXRetZ7q+KR1yiMInDXPVvQ6zA7kurraSVSzbYYYjHvPHTQSgIh3YdTiTFphU0gRAuroCV1Oemr+r14C+PiLBNeVXjdN4OqfB9KEPAPm6EYJ5ofij15Tk9RDCW1ymevs/2O9zmyKoUHcmovPpWXzferg0gFKdMdrFgPglwsYhdy1+fvyAZEtuEjyIKLq43VxYsbLjtdHZgUKnVidWdqLWSfuA/QtaOiXS2KGiuuisIO172f6I/7OwFTCz0shrc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzVoMHR2K0Vsc3dmb1JEa2JoR2xwNisyUnpGS3ZXQ3NkRUk5WnVpM3JaOTN4?=
 =?utf-8?B?UzY4L0gzRXhrQ1dWSDlJa1hsRW9tQVhSb0FsNHFNN3ZRNFM5Y0ZLWWdUa3cz?=
 =?utf-8?B?dHpPbU50MHlmdGsyMnBjM3pCZ0FBUVlwYkJhZThNOUpyZy9rWGxvWkpOMDBR?=
 =?utf-8?B?SUhwSFg2emplTVNyeUpUWldQbzkzSU9IOC9EM1F5VzVBVG9WdmhJMytlU2RJ?=
 =?utf-8?B?RnNjTnFVV1ZtUW5ZcVRVWFVhak5lNFRHMGtyRGJOOEFNejdxL2czRExiU2dH?=
 =?utf-8?B?MytEMHJRSEV0TWVOR0g3ZEN0TFNhdlplbE1NRWVBSEFqcVk0TGxKQkJBaGFx?=
 =?utf-8?B?ZGRXVTQ0ZGsxc29OcDJRTDhZaHg3M3YydXlvSjkxbXVRSW5HRkZyR2RVMzQy?=
 =?utf-8?B?STdWNDZTK2pvamlCN05JWWs5eVZNQStud243dmlxTUk0Y2t2M3Jjc003V1Zu?=
 =?utf-8?B?MXNyUHNuWDNTZVM4OW9EeWtoU2sxYU9qTnIveFVHUDB5MjJPclFFWlZXQW81?=
 =?utf-8?B?NDE1QTVPZEhsM2N5dnpZUjVrMVhqUmhQUDViSzlIVnU3aWNId0VTK3diRDMz?=
 =?utf-8?B?czAvZC8xbG5yWE12RzNmdlJ1MWkvTHVPbEcvTTJWamsxajJsNVZOY1NKUmo1?=
 =?utf-8?B?QmhTODVsWUIxK3dOYVNhWW8yMk03QWhHSG9uTzY5QWZ3WkE5L1BXMG90Y1B3?=
 =?utf-8?B?NS9wdUlUb0V6YXpvYkNwQUVUTG1aYmVsMHdLRk1DSEZSNzcyS0FZVUlBaGNF?=
 =?utf-8?B?R1Zqd2JRUXI5N0x3cXE0UGxxa3pCMjN3RE9FZWVYMmxEWWpFRm50Zkd1alVU?=
 =?utf-8?B?QkFtZ3ZVeldrK0cwVmUvdkZzUGp3dk5VMzRGeThaLzVxRHdBWno0dmlWQVdp?=
 =?utf-8?B?WEJQNXBOZFdoRjJnQkgzQnlXRjU2c1R5ZG1DNThTMUNxMzhMTUJXaXZpUG1w?=
 =?utf-8?B?bStDUm9XWGV3RSs3VmVSb1JHSENRY1ZoVTBmUGEwYXFIRUUvd1NxcFBmYi85?=
 =?utf-8?B?ajBzUDFiRjcwczJ6aTJNVGdjcDZjdkJJVmc1cSs5cUhMUm51K2NQcWo1M2l4?=
 =?utf-8?B?TERhbjR5NzdrL1BvajI2bG9aYzBwSlU3ZklKTjh4aDhMMUNhNFZESU1oQ3dr?=
 =?utf-8?B?SzlFOE8raEdVWllMNWp1RVQ5YUQydTRjZHNxVXlGSVU4K0trQUZQaHpOUkVE?=
 =?utf-8?B?NUpPOWxzOXA4RVlBaTAzVW1FZ0NCSDhweTFGVHdCaDc0Vlp0Qi84cFFJV2dO?=
 =?utf-8?B?Yy9YNE5iL3V4MDZDeU9JTytkVk00NitnaUZqbzhmWStib2dUczhHd2RqT2Ru?=
 =?utf-8?B?SW5IV3NIeSs5MTJUZURyYkx5dEk3ZkVuSHRTditQTHRQMSt3UHZLdk82TnVU?=
 =?utf-8?B?R0JmcTUydWpGbUVhWXpWSWZlSStoTGIvZW5nM2ZNQjVHZ3hGV0hDVUVwUHZN?=
 =?utf-8?B?ZkNNNkl4N1BHV1FibHFYa1NROHFvOHVVVDdFMWhIcG1EbCtEZnE1Smtpd0d1?=
 =?utf-8?B?MVkxell2YUVQVklxRGFWU2FmaDRPd09XSDJNdks5c0JaZzdyQ1o5OEIxMlpt?=
 =?utf-8?B?blA4OENCTkUwL0VheGZQNWozOWVVeEhPVjhzc1p1Um5RanJjaTVITDczZ0N1?=
 =?utf-8?B?MkNWaUdBQzlLTEg2L2ZFY2xyYks0cklPRlh1YVRjeG9LZlFYTFNVNE1rUFJt?=
 =?utf-8?B?R2FqTUx1dWwxQ0I2R0ZhRnY0TmFsWDlCZWwrWmtQLzBWZW1YVHcxd1hKK1Jw?=
 =?utf-8?B?aXBFTzBGb2x1SklGS2sySTlycVBZNitIdHNIdlE1cFZOWDZGdG9QZ3dGL3NH?=
 =?utf-8?B?Rlg4RExQU3FsZ0x2Zm4rNWFsYkFXRDJnZThlMWQwM1JDL2xJSWluM214NEdu?=
 =?utf-8?B?NUNHWVBmK1FLanppSU1RZTZ2eXpPbTBaQUZlOTA3aXBCSHJwUjFGUVUrUmFF?=
 =?utf-8?B?WUtvK05VZngxSDh2U1c1TGFrRURQNW5SUnlPWnpVZ1BoK0dJWXB3UFNOdFBB?=
 =?utf-8?B?Z2lLRGFub05OSUtkOGt2STlSUDQyc1FiTEExS2dlV2lIY213blZWNnkrNE9v?=
 =?utf-8?B?bTRpQWgxVkZLdENjZDdTSzk2MnA4UVNDaUlKNlk1RGpuTVdWZTlnbnA4N3pM?=
 =?utf-8?B?aGFCaEdNZHJ6YVJzejhIQjZRT25mVFUrUmJSTUxXSHNmZHNXQW5CZ2ZXZkRD?=
 =?utf-8?B?ZjVsYzJXeUxaSUpnZ3daREJzZnhNVUpKRDlDNU1BYlRhVVRRT0pUOEsrMUMr?=
 =?utf-8?B?MmFWY0xqTkRkZFhuUXhEalArK09YeUZjQXE3dGlZSy9lUVBLaVlvSFd5NGEz?=
 =?utf-8?B?YmV4MW5CYnJ6bSs5TXhwS2lsMGNCemc5dHlDUjRsNnpROG1jd0RLSlUrRTBZ?=
 =?utf-8?Q?086aZ2t8C21OxMRo=3D?=
X-Exchange-RoutingPolicyChecked: Yq9EKeSaq18oErFA8YZGy18Zg6/JSGwIbpQ9X+mwKq/3oeKGw3VzWvXthtbg6Gz/wdlsEFu3LnH2cPwrqAnZ8hvsoGxfRTd9njJBQgu98Edf4M96UhRCmsFjSNEF8mr/Y7KTVmzjU9ElLJGXWHAj5109KLlobAp1QNKoS8rS/JF698zkGTDYRIfdQjwQBY9KibPz1tE1cUsbAkNixwp8UR+EK6Uh5f/w3y6dpnky6CZHq7yxYBKUNpwy3FtdA93EWHMGKYvn38euZFL2clBdCm/Py4QeJWFx4OJH2d+8FyYW55jgkMDl7VlFJLqNmj/xMYj8Sd2PGJeVn1vku8X35A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a96562c-a10d-4fc9-a0d5-08df2e9056c5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:55:57.6682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8v6LYFE/SoILE4NX/WfoKYLq0tF6iIw3AsYDixAQwmTcJKW/nYcbLWep+ueYx59Fg8AtLae+/PtW5J3eJ+Bm668Y43TVaCl5c5Z4gNYc+aY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4645
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

Add GGTT KUnit tests focused on the newly introduced usable and
shareable pools.

Cover range initialization for native and PF modes, including partially
overlapping pools. Exercise allocation direction and conflicts between
the pools, as well as the unavailable shareable pool and requests
exceeding pool capacity.

v2:
 - Init ggtt.lock with mutex_init() in each test.
v3:
 - Rename the test file to use the _kunit.c suffix.
 - Use shared GGTT setup and cleanup helpers.
 - Split PCI IOV coverage into a separate KUnit suite.
v4:
 - Release allocated nodes through KUnit deferred actions, so that an
   aborted test does not leak them into drm_mm_takedown() (Sashiko).

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c | 341 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.c             |   4 +
 2 files changed, 345 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c

diff --git a/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c b/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c
new file mode 100644
index 0000000000000..03e4f212c62e5
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c
@@ -0,0 +1,341 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "xe_device.h"
+#include "xe_kunit_helpers.h"
+
+#define GGTT_TEST_START		SZ_1M
+
+static u64 ggtt_test_accessible_size(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+
+	return GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+}
+
+static void ggtt_test_fini(void *data)
+{
+	struct xe_ggtt *ggtt = data;
+
+	drm_mm_takedown(&ggtt->mm);
+}
+
+static struct xe_ggtt *ggtt_test_create(struct kunit *test, u64 full_size,
+					u64 usable_size, u64 shareable_size)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt *ggtt;
+	int err;
+
+	ggtt = kunit_kzalloc(test, sizeof(*ggtt), GFP_KERNEL);
+	if (!ggtt)
+		return NULL;
+
+	ggtt->tile = tile;
+	mutex_init(&ggtt->lock);
+	ggtt_init_ranges(ggtt, GGTT_TEST_START, full_size, usable_size, shareable_size);
+
+	err = kunit_add_action_or_reset(test, ggtt_test_fini, ggtt);
+	if (err)
+		return NULL;
+
+	return ggtt;
+}
+
+static void ggtt_test_remove_node(void *data)
+{
+	struct xe_ggtt_node *node = data;
+	struct xe_ggtt *ggtt = node->ggtt;
+
+	mutex_lock(&ggtt->lock);
+	drm_mm_remove_node(&node->base);
+	node->base.size = 0;
+	mutex_unlock(&ggtt->lock);
+
+	ggtt_node_fini(node);
+}
+
+/*
+ * Release the node on test exit, before the GGTT is torn down, so that an
+ * aborted test does not leave it in the drm_mm.
+ */
+static struct xe_ggtt_node *ggtt_test_track_node(struct kunit *test,
+						 struct xe_ggtt_node *node)
+{
+	if (!IS_ERR_OR_NULL(node) &&
+	    kunit_add_action_or_reset(test, ggtt_test_remove_node, node))
+		return ERR_PTR(-ENOMEM);
+
+	return node;
+}
+
+static struct xe_ggtt_node *ggtt_test_insert_node(struct kunit *test,
+						  struct xe_ggtt *ggtt, u32 size)
+{
+	return ggtt_test_track_node(test, xe_ggtt_insert_node(ggtt, size, XE_PAGE_SIZE));
+}
+
+static struct xe_ggtt_node *ggtt_test_insert_node_shareable(struct kunit *test,
+							    struct xe_ggtt *ggtt, u32 size)
+{
+	return ggtt_test_track_node(test,
+				    xe_ggtt_insert_node_shareable(ggtt, size, XE_PAGE_SIZE));
+}
+
+static void init_native(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = min_t(u64, SZ_1G, accessible);
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, usable, usable, 0);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	KUNIT_EXPECT_EQ(test, ggtt->start, GGTT_TEST_START);
+	KUNIT_EXPECT_EQ(test, ggtt->size, usable);
+	KUNIT_EXPECT_EQ(test, ggtt->full_size, usable);
+}
+
+static void alloc_usable_pool_high(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	struct xe_ggtt_node *usable_node;
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, usable, usable, 0);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	usable_node = ggtt_test_insert_node(test, ggtt, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node),
+			GGTT_TEST_START + usable - XE_PAGE_SIZE);
+}
+
+static void alloc_usable_pool_oversized(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	struct xe_ggtt_node *node;
+	struct xe_ggtt *ggtt;
+
+	KUNIT_ASSERT_LE(test, usable + XE_PAGE_SIZE, (u64)U32_MAX);
+
+	ggtt = ggtt_test_create(test, usable, usable, 0);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	node = ggtt_test_insert_node(test, ggtt, usable + XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
+}
+
+static struct kunit_case ggtt_test_cases[] = {
+	KUNIT_CASE(init_native),
+	KUNIT_CASE(alloc_usable_pool_high),
+	KUNIT_CASE(alloc_usable_pool_oversized),
+	{}
+};
+
+static struct kunit_suite ggtt_suite = {
+	.name = "xe_ggtt",
+	.test_cases = ggtt_test_cases,
+	.init = xe_kunit_helper_xe_device_test_init,
+};
+
+#if IS_ENABLED(CONFIG_PCI_IOV)
+static void init_shared_pf(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, accessible, accessible, accessible);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	KUNIT_EXPECT_EQ(test, ggtt->size, accessible);
+	KUNIT_EXPECT_EQ(test, ggtt_shareable_start(ggtt), 0);
+	KUNIT_EXPECT_EQ(test, ggtt->shareable_size, accessible);
+	KUNIT_EXPECT_EQ(test, ggtt->full_size, accessible);
+}
+
+static void init_partial_overlap(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt *ggtt;
+
+	KUNIT_ASSERT_GT(test, accessible, 0ULL);
+	KUNIT_ASSERT_GT(test, usable, shareable);
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	KUNIT_EXPECT_EQ(test, ggtt->size, usable);
+	KUNIT_EXPECT_EQ(test, ggtt_shareable_start(ggtt), accessible - shareable);
+	KUNIT_EXPECT_EQ(test, ggtt->shareable_size, shareable);
+	KUNIT_EXPECT_LT(test, ggtt_shareable_start(ggtt), usable);
+	KUNIT_EXPECT_EQ(test, ggtt->full_size, accessible);
+}
+
+static void alloc_usable_pool_low(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *usable_node;
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	usable_node = ggtt_test_insert_node(test, ggtt, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_size(usable_node), (u64)XE_PAGE_SIZE);
+}
+
+static void alloc_shareable_pool_high(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *shareable_node;
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(shareable_node),
+			GGTT_TEST_START + accessible - XE_PAGE_SIZE);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_size(shareable_node), (u64)XE_PAGE_SIZE);
+}
+
+static void alloc_partial_overlap(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *shareable_node;
+	struct xe_ggtt_node *usable_node;
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	usable_node = ggtt_test_insert_node(test, ggtt, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
+
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(shareable_node),
+			GGTT_TEST_START + accessible - XE_PAGE_SIZE);
+}
+
+static void alloc_partial_overlap_usable_full(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *shareable_node;
+	struct xe_ggtt_node *usable_node;
+	struct xe_ggtt *ggtt;
+
+	KUNIT_ASSERT_LE(test, usable, (u64)U32_MAX);
+	KUNIT_ASSERT_LE(test, shareable, (u64)U32_MAX);
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	usable_node = ggtt_test_insert_node(test, ggtt, usable);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, shareable);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(shareable_node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(shareable_node), -ENOSPC);
+}
+
+static void alloc_partial_overlap_shareable_full(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *shareable_node;
+	struct xe_ggtt_node *usable_node;
+	struct xe_ggtt *ggtt;
+
+	KUNIT_ASSERT_LE(test, usable, (u64)U32_MAX);
+	KUNIT_ASSERT_LE(test, shareable, (u64)U32_MAX);
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, shareable);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
+	usable_node = ggtt_test_insert_node(test, ggtt, usable);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(usable_node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(usable_node), -ENOSPC);
+}
+
+static void alloc_shareable_pool_unavailable(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	struct xe_ggtt_node *node;
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, usable, usable, 0);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	node = ggtt_test_insert_node_shareable(test, ggtt, XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
+}
+
+static void alloc_shareable_pool_oversized(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *node;
+	struct xe_ggtt *ggtt;
+
+	KUNIT_ASSERT_LE(test, shareable + XE_PAGE_SIZE, (u64)U32_MAX);
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	node = ggtt_test_insert_node_shareable(test, ggtt, shareable + XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
+}
+
+static struct kunit_case ggtt_iov_test_cases[] = {
+	KUNIT_CASE(init_shared_pf),
+	KUNIT_CASE(init_partial_overlap),
+	KUNIT_CASE(alloc_usable_pool_low),
+	KUNIT_CASE(alloc_shareable_pool_high),
+	KUNIT_CASE(alloc_partial_overlap),
+	KUNIT_CASE(alloc_partial_overlap_usable_full),
+	KUNIT_CASE(alloc_partial_overlap_shareable_full),
+	KUNIT_CASE(alloc_shareable_pool_unavailable),
+	KUNIT_CASE(alloc_shareable_pool_oversized),
+	{}
+};
+
+static struct kunit_suite ggtt_iov_suite = {
+	.name = "xe_ggtt_iov",
+	.test_cases = ggtt_iov_test_cases,
+	.init = xe_kunit_helper_xe_device_test_init,
+};
+#endif
+
+kunit_test_suites(&ggtt_suite);
+#if IS_ENABLED(CONFIG_PCI_IOV)
+kunit_test_suites(&ggtt_iov_suite);
+#endif
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 2173c4bd26a90..f9c4be45d1f57 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -1388,3 +1388,7 @@ u64 xe_ggtt_node_size(const struct xe_ggtt_node *node)
 {
 	return node->base.size;
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_ggtt_kunit.c"
+#endif
-- 
2.34.1

