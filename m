Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EDFC3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 07:48:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1A010E595;
	Wed, 28 May 2025 07:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jtpcfexe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1B510E571
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 07:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748418511; x=1779954511;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=OKC02zEdFoO9reiZjRGvBu3eg9Xnfz8V9skxdGMDIvc=;
 b=JtpcfexeXCO/ru0EKo79Inj0+CoiY/VN0JU/p3vPSBqMoLgfEPmDl6De
 Y/ojQqSjjV56O9GYkkvVIFqZeiG0JNKapniXSDMKwLHpLSi7hPDJygMOZ
 sSC+MEIOtaqPJ4w5PtbMZ5qeR8yDIUcopberShVxBlFC0gHq0+bM/j66S
 uSYHOSFLD7ZvR0SHa9c4ABa6kQN3xrLmGyNL7N84JBNTrwMDJrH3U4J7e
 5lcqewI9rHAIfuqiCJGzD5iLT0TtJiJrGXdnrUM+x7hCtyD4vr041fuYd
 eH+NBYV94BmzrmDnO+Twx/6wTCz7x8SaBzi2G8Yr/attoRUzIz4MNVg9z w==;
X-CSE-ConnectionGUID: Sy/apnYIRT2peshpCL9L0A==
X-CSE-MsgGUID: Pc5MhhL3SwOKQZ3vWxcOCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50426704"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="50426704"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 00:48:31 -0700
X-CSE-ConnectionGUID: GJ1G0x9jSDG+u8ftM0Sf0g==
X-CSE-MsgGUID: 0ojAnauBSdCzXJo4TWGUHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="144135793"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 00:48:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 00:48:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 00:48:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.61)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 00:48:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qu+aea1PwhGse9B2iNXNfrlb7LTIAQD8wLnkmk9xHesmZi92wZyf5Bzhid4ys2CLWyeF3B5DUHlEgq0BU/3LEaNOnCBW8mz5JWXmzUQI0kULEdRkYVV/Mw7Gs/nb+VQPfWOC3s2ka3qrHT+qGaCdiHu9o1xFr04Pr/r/5ZjrXI/360sc92HzEc2DnVhsd8Lp+8rWlQUwxAp2mU5OYisbPBQZ9aQBzjrNgiFcZfij7u1mJCTjBk0EKzRjooL+zDAozhTw6/jYcDFo7vNgSwXekcGgHSJKQzM2JGOLR/Y7ZATwsbTjE+U74z1dpdfO4SCpNV7ZU7KEL6KyRmjXLazh1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fU6LA2sY64p3ZjH35g+bctNI29Ll8WcRwaNlp4rqY7g=;
 b=Ogr+MPNZxDFDRlrXpcbzZVI/1s8Cl1AFBejEybTqeAp7nv76CIyswx2IVv9rmSP8SWa82mwM6KjHvqYSSuB9uGI5G5Q7dsmEwr/ZOtqd5xUUENRn9V4VdGuf21ycg4Y09JnZ59tGFIC8AAiRR7mao2PLP8k2Ouk1T/1Q/eIyYKkpcNcHxvQ0qgvBlM0CoOQLIptFTsAofvwDKFrMWpjARusJJinkg1iXqpi8GizbG/8dsj/VsS0h7k9xJhp5ANqQ53r+WcsG0ZQcFlSesTytAt/ptXQtqAgsOEj5FyTFaejfhMfj40iJy+ueVZRGIWknx/vBJfSSgTUB4lOXtSVbEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA0PR11MB7356.namprd11.prod.outlook.com (2603:10b6:208:432::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Wed, 28 May
 2025 07:47:54 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 07:47:54 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>, Stuart Summers <stuart.summers@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 0/2] Cleaning up code related to VRAM regions and its
 initialization - part 2
Date: Wed, 28 May 2025 09:47:41 +0200
Message-ID: <20250528074743.2027563-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P195CA0025.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::30) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA0PR11MB7356:EE_
X-MS-Office365-Filtering-Correlation-Id: 13c53020-9c53-4e2a-9b7f-08dd9dbbf4a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1RWQXhYSjArWVJtVGR4em5SUlJ5VzV4dlQrU0oxalZkTnE3dXJrY1dHeUho?=
 =?utf-8?B?WGh1Z2J1aXRvY3grejdoaDB6dVoyQUdQQVQrZGdGY2lWSXd1RkNFZ1huSmtR?=
 =?utf-8?B?blNSd2NUZlM2bmhGOFRRQTgvMjFQeHVEK05iWE00Q1owWGVrT3ZESU9DSG1M?=
 =?utf-8?B?UmhyelpYRWk5OXFDaGRQWTFzR1U2Q0JXVStpRUNHSjVDeU92d1dTbGtUN3hR?=
 =?utf-8?B?cFVJUThYOFV5MU1CSE5wSE5kMy95ZEZ3N0MwVVQwaFFxWHpWUUZDZlpmSE9V?=
 =?utf-8?B?TnpnNjZQYzRZOFg0ME9JNC9uWnlhUEtkMGd5SlNrQmxWSUxVS1pFRHF5Tmt6?=
 =?utf-8?B?TDFielQ4UjFuUmh1UUJ1YThKWjdaRC9NRWVRR1Nmd0RNM1RhT0tRK1FhUnQ5?=
 =?utf-8?B?dWcrWEE2bzB5djlqMTNoUlp4STU4cGxDeU82NlpFUXdSMEZYTENYRnNJL2U4?=
 =?utf-8?B?eVFHcFRlRXhqU0Q1OU9zdGxxUGVldHBBbG5BSHJqWlZjNmJGZ1hoZEhhREZD?=
 =?utf-8?B?eXZYdmR0Q3JLUHc1SDBTN2FFTFFIVWJDTFRyd3B3OGhUblE1T3ZUK2MramFG?=
 =?utf-8?B?NGxGY1Y0Unh1L2IxOEd5YS9ZV1lGbWpuZkY3c0tZRTBIWU1RNXFjUVQwQ0lC?=
 =?utf-8?B?aXVRdVpYV0dFSU9qcWxyOHFhbytsR2w3Q3lnc21nSVBuSnYyRkhsYlFQWWM1?=
 =?utf-8?B?RkFPYnlsVm1ZeFFYaU9UUmZPU1h2aXBucDYrUnNKMWJMcDA3WlVVS0FNNjZ4?=
 =?utf-8?B?SUlqK0g1M1d5TjhtYklsU0FMbXdzZTZEZENwakNsSE52eTdFRkEzbEpZNUkv?=
 =?utf-8?B?dU5QN1JKcTVQODAwR3E2RFU2ZUxrYVNOMERzcDQrYmRsdHlCd05Ocnlsb1Vh?=
 =?utf-8?B?TEU2aUNET1JIOW9mV2gwYjB2Rk9GZE1QZVdzQ0RWUk1yQXpNUjh4U2FqQk12?=
 =?utf-8?B?Wndvc1dKOEdRVFRINkwxQU01WnZ2bFRIanJ1T25GOC8ySE9DTU5ldStLeDlX?=
 =?utf-8?B?YnNHSUNWVGJHd1NxenZ5cGg5OWdRMnJESnpqZmpKRmhaTHJ5dlNZUzNEc25R?=
 =?utf-8?B?NGE4VnhJNUZvMk9EUFFYN3ZVQ1hLaDNBU2ZGd2NMVWVMc3I2NXByNGlsNXFy?=
 =?utf-8?B?bHdtMEZkRXNHdUd4VnRwQlJ4NzFUeXhXWWlBSWZNL01sbFJ1YTBDMklaOUVJ?=
 =?utf-8?B?L1ZpZkFvT3l1VlhFeStCMDhzWm9OTStzcDhvNU5uQ0x0NEs0SjQxMG80Vzc1?=
 =?utf-8?B?Y1RwTVpzRWVqSWRqVk9iZFlRL1YwYnhRT2drNjVPU1JwNzVDcnhheTdUbDBz?=
 =?utf-8?B?ZU1hd28vcUJ5MHBSZlMzM0R3ajY1WGRESW9IN3Y5eCsyZVk3RGlzMmQ0VGsx?=
 =?utf-8?B?Y2FZZ05HZHZGTG5pdm84WWY0aEptSXJ3U2poT0NoMmMxci9lcDNVVTVpUFZr?=
 =?utf-8?B?VzlVVzl4RTJiQVV5NUVHSGcrZ28zcWNlZnVzTVlXcGlGbWFkekFFb0ZQYlVr?=
 =?utf-8?B?blBiRUtNb3Vaa2RwRGNoaENHa21wR0dWaW04TC9uU2o5NytyaDIxOTBWb21p?=
 =?utf-8?B?QW5yM2ZUQ1lRVkFyNHBuOHlDcXcxcDdKdHVhcmpLL3FPSSswcFF4RHl3bUNz?=
 =?utf-8?B?eThvYjVFZ2d0bWtPZlM2L09JVng3RzBOai9jVVRwZEF6MGR5aEdLd2VtQkNu?=
 =?utf-8?B?UzdWVVR2RVorZGpiUjViNkFCMThiWHNZVlVaV0pNU0tDMWdyeUxKc0pXOVdm?=
 =?utf-8?B?VmsvMGZaY0NiMFF0U1RnTVZFWDlGVDlMZ1M2Y2JOYjlYeTBkU3dtdXZ6YlB3?=
 =?utf-8?B?amF5eHZ5S3BqeDNJZkQzaS9VTHppZnhxTlhsakdGRXBBckhPWmFxS0NIblM3?=
 =?utf-8?B?RFVtWnhnRDNteEJ5dW1nUFBWckZhQTBMN2hEWmZFRDBWMkZNWSt4NEt4MlRk?=
 =?utf-8?Q?lw98jPOI2+o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDhFNHp4Mjc5bmpaZFhraTRQV1BENUprU3I0amxoakFyZkZST1RkZ0hnZ2Nt?=
 =?utf-8?B?aVB5dVdJb0tBSzZPZldqZWxIelFUSGo3NENha2pTbTJXN3JsS0ZrWURacDRk?=
 =?utf-8?B?MEZOcFl6RXdEWVE0SU16RXJtb2l0UmpvL1Y2STlkNGlEVU9kODZjUWpHOTdM?=
 =?utf-8?B?ME9neUQzRWlZN1lzZlNocEFiNTF5WkhOaG1HSGtqT3JxNW5KaHg5bDhXRkFC?=
 =?utf-8?B?UHA2VUhucVh5ZHlqalNnM2lkOGNwdzNXQUJnSVlnYzhZTzJkZFpYUXUzdGdj?=
 =?utf-8?B?aERCK0dkdWxabTZMRjNreExDOGxGSW1Ua2hhWTJSckp5MUdTRWt4SVFmdFIv?=
 =?utf-8?B?SzE2eUg2cFljZThPVUdDWHBTb3V3MnN2dDRxNzlsZzMvWUJ2QjE2dG1rZGZ0?=
 =?utf-8?B?KzFwTnNwc21tcnYzTWhvT3FtVDc3bWZTVE9kM1FHeDMwUWhwSlhOcVNIN2FI?=
 =?utf-8?B?VmdBOFY0ZzkvUTBvRFR1Nk9iQWhndW9IY2ZBRHlOY2g3SFVWb3BqOFVuRFds?=
 =?utf-8?B?aDZmTW9TWWFDUDlRRWxvemU2a3pyUmwzU0RkWi92MytaZW5mZWZTZVZncDMw?=
 =?utf-8?B?MlRuQ2FvTkFlRDN4RGFoUThGRGI4OWFPL2NVT1FnalRrbmZxOWdxNFd5RVRL?=
 =?utf-8?B?ZElUU0hNK3h0TloxeWZNejVqa1FRUEJLQWJ0bldGODYwZTEyNGhFWk03SVRu?=
 =?utf-8?B?NDlNVmdsR3RWbnF0cXdGbmc2SGxBZXNZTzZCeDYyenpaVFk5NUIxRWRXenkz?=
 =?utf-8?B?aWxFc0pZTXQydVhKZWo2ejU4aFZ2eWhRTE1HUEl5YVlLVXRWY2loeXduZkZP?=
 =?utf-8?B?NTR0a21LWUNRSmhWZVlLZndIK25lMmc4cnY1cy8zTUd6WlJjVHdHS2xIeHNx?=
 =?utf-8?B?WDhVWmtEVWY0VHlNQnhUQS9HQklwMlF1aVhYLzZWKzF4N2svblNScmNiWjhk?=
 =?utf-8?B?bjNTWUo4RDlzN3J0WGlNY1FpTm5mU0xqMCtqMHZDYU9yL3VjZFJIL0JEVW9D?=
 =?utf-8?B?Zmh3TFVZWmxJQ2Z5THNuV3gyajYvNDRmRWVYbkVKRm10WXl6Q3hqUy9hQXJ4?=
 =?utf-8?B?aGVINXltWEtybGxJTEZZUmNseVZRWnpDQnh1TVp0N2lBVklKYnl4WGZIdm5q?=
 =?utf-8?B?UU9NYVBDTDJWSHN0NUR2ZE1tN1hlczV0NzFHRkNCYjRueDhDSkhjWENTZGtQ?=
 =?utf-8?B?dHlqTFg2aTV5V2JsODdFOGZhbEExdnhFanRiclo1QXQvd09MQ3lUVW1ua0JU?=
 =?utf-8?B?dGhvNDRhb1ZqQlAwNFZaSElrajBPZzRrRHVHeldKVlVKMm04Sk4wak1iZU93?=
 =?utf-8?B?ZVdRc2N3OTdRblZjaXBvdkM1ZEZEdnU1eFREQVAxMjRKUk5VNmNpTEdtUmpW?=
 =?utf-8?B?bnVtUFNFbWo0Y3JjVHNsbnJKWU0rNDBYQ0VrK2tHeXJNTWhmMklhdlVYbmdL?=
 =?utf-8?B?cHpYYUlTN3JzTUY4UEFzSk83WThLcE92ZGxZR2VzcFErcFdJQmJrWXNpS2RO?=
 =?utf-8?B?YnpYZHhoNHIrczlQckpuc1lVWGlsR0c2OVBxajI1ZFVxdnBuc3pJbUxTRmR0?=
 =?utf-8?B?V1dUMG0rWXM3c3BraUJWOUx1VFlFTlo5eSt3cFllQlp3dzIva2dFZjM0VVpN?=
 =?utf-8?B?V0FPVWRaYk9SZ0xzOHVHSGJXZTV1YWR2emJnMXZiMzZYS3pRWTgrTXBtZFln?=
 =?utf-8?B?TTlpbmV6Vm5UamtGNnJpUnc4a2svMmphSFo1ZU9pcDIyTmdKeTBseFdhd0hj?=
 =?utf-8?B?UExxTEQ4TG1wa0FMczVON2hYN3phSTkvSTB1WWdjOHp2WktrL3kwY2tobmpv?=
 =?utf-8?B?bk1iT1pIUDRGdC9iUklwamx2R1F2ZnpkSVJaWWZmZWZGMnBLc1pFMWpXRlJa?=
 =?utf-8?B?aXdNY1c1MUxrTFFvTGUrNXMxNlhSUEhxbkRmR3NkV0J3emJjbEtibUxhYWtD?=
 =?utf-8?B?Q21zNFoxVmNEamlvVGk5QVJvZ0FEZzVYWVNpNGgyVUcrWVozSnVpQytYVVdQ?=
 =?utf-8?B?R2tsVkpuczNHNzkwMVlZTDQvTXhGc3FlMmh3UTJkQVNRVWp1OVlTWDRtOTly?=
 =?utf-8?B?TEtZQVBYYWJEb1Vkc1k5cnpvTEZHcEZPeGlmaFVJTHgxMjdteGU0aW0reVNq?=
 =?utf-8?B?MXAyM2VoT1lMU3V3SGNjOTlRMG9JeWk3U2hnQjNzL2FiYTJLdWpRamJjZlhi?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13c53020-9c53-4e2a-9b7f-08dd9dbbf4a9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 07:47:54.7176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XJVpb/ADluagm0vA1MgIKpsb4nSasaZAo+urnxP/EVG4nq0xvvAU2YVfx1ti1poIdt4WLG5CeWtqQZbneMrk8Qffcv8vQZTD2qvRXQ8w/Wo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7356
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

As a follow-up to the earlier VRAM region cleanups, this patch series
focuses on further improving the flexibility and clarity of
the Xe driver's VRAM management.

This series focuses on preparing the VRAM region handling code for future
platforms, where a more dynamic representation of device and tile VRAM
regions will be required. Static allocation of these structures is replaced
with dynamic allocation to increase flexibility and improve maintainability.
Additionally, the initialization logic for device-wide and tile-local VRAM
regions is unified, replacing the previously separate code paths. This
simplification improves code clarity and facilitates future extensions
involving additional VRAM region types.

v2:
- fix doc comments in struct xe_vram_region
- remove unnecessary includes (Jani)

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>

Piotr Piórkowski (2):
  drm/xe: Use dynamic allocation for tile and device VRAM region
    structures
  drm/xe: Unify the initialization of VRAM regions

 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   2 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   2 +-
 drivers/gpu/drm/xe/xe_assert.h                |   2 +-
 drivers/gpu/drm/xe/xe_device.c                |  23 +++
 drivers/gpu/drm/xe/xe_device_types.h          |  14 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |   4 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   2 +-
 drivers/gpu/drm/xe/xe_migrate.c               |  18 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   6 +
 drivers/gpu/drm/xe/xe_query.c                 |   4 +-
 drivers/gpu/drm/xe/xe_svm.c                   |  17 +-
 drivers/gpu/drm/xe/xe_tile.c                  |  49 +++--
 drivers/gpu/drm/xe/xe_tile.h                  |   2 +
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   6 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  18 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h          |   3 +-
 drivers/gpu/drm/xe/xe_vram.c                  | 179 ++++++++++++------
 drivers/gpu/drm/xe/xe_vram.h                  |   5 +
 18 files changed, 236 insertions(+), 120 deletions(-)

-- 
2.34.1

