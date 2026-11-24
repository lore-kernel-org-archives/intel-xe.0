Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDA2606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 10:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JvGdwbXj;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=U9h3/Hsa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC4C10F46F;
	Tue, 24 Nov 2026 10:51:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF0F10F46F
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 10:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795517450; x=1827053450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=nssh9ifV9dx7M0jWNYZBb21Ein9DO+y4MLPNXbJB8wY=;
 b=JvGdwbXjY7ekz1Sz4j3MQIvp7jj8KJRfKKwH90Ykk6PrKKsMfnVbrVbj
 QlJa2Cqy9eqMUmLyVYRDHf9OWX4vlydSn5og6WYwe3IqA/v0Inlpy5jOT
 5ZZcXzvSayIzztQkvIPK4l3prv17Ari4Lfb+cun56QN2uvQUJYPzBJ/AK
 yCrgVCXtzOOb9JHjPnDnZnFRPni4W3fUKxsJrypvKhcIxUGOWiCil4Kv5
 rQXTFFs9E3DC+gqAg6pHAS9+Vv1Qf3+stOUfj9ARajmL3fQPIKkULtT0M
 XVK52HW6hK0nn405phqZSmBtnNJDzd8KVWpedexpq6uCPD+NBy7TeaXgi w==;
X-CSE-ConnectionGUID: K04KGFotRV+qVdnhNjYWTQ==
X-CSE-MsgGUID: spEn/5ClRZGiHIFKT8RCbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4366931"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4366931"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 02:50:49 -0800
X-CSE-ConnectionGUID: UASSTRYXQdOtBh4OfnWVyw==
X-CSE-MsgGUID: iqpxEuNUQ2yO+etz5/xPUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="12130431"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 02:50:49 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 02:50:48 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 02:50:48 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 02:50:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVkIKLsqKh3GcDUworWf64Qz/5h1eHQhoi21UGj1R55sBxvy9i9UIOUuf70CeNsSeHyC7SMgopqOLztiC8HaXmNhiW2JdvmOVmYGeiUgFpvigVgv3yx3W8IE5QP1uwjHp3uJnzRuscruEAHO5vbZIgDE6MnYPkzsiEKEoeDrfg3HGsSZRrEaiPL05jCzpPPQWDKrAczmj/bIfR+gBxUHaaBAphYzJ14FotUqALYbNtgWQapQMkswZZhRox4dfLbBfFojgojx/szJ/WXJcFQYWUNajRMq3oBj+8SgFGsxZUWEgxiPghoWGnLqJQzUed2gNlKE1mPVcGXkhbgqCjtt/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRScxjeAGhETI1RazpqnY20r4o/5TJcGvL5VfVF0Ci4=;
 b=rh40njNI5SLonWqcUWFqvQo5qKK8CzkZ3uFrDfS8I820nehc8gruFrjBMR6q9BAmK7ArNrHmY/bq723+3fF+4BJ/kKk9MXYHZDSqa1OJcX0qs1sZsTXfXGhYPE2cfjoTEuJvsarJLcIg0VScaxVaQngx76+VPsNXA0WJ+9cW23ixu0HVeNIPTYV07Y44DlZd2Ppa6eKugZLSfy96Q5fg9Hvtz28zZxkV4ayN4V3iJm/xoS6vI1wL36Iw274p1hv8iuj4jAdhBHIZkeYkGrRrkhU88479DVvog84wU8T/XbfzQcJqLun/tAddVZ0mBJ4+ZOtPBeITMcfpAE1A3//v4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRScxjeAGhETI1RazpqnY20r4o/5TJcGvL5VfVF0Ci4=;
 b=U9h3/Hsa8z8GVUPQTjI7pv1jahc/vrEj6ARmWKRGQWOyqJ9O310lvRGycqzZgA10o6ffsIXCWXce9LRwxnkRlD+ek3ewS4RYjMeW1yZlVFAals9bxGtaJOio1FO4Nt6bFs8eGvHkEEoWxXuR98AbqLNTl6InKHNutlwx8itsL4w=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by LV8PR11MB8721.namprd11.prod.outlook.com (2603:10b6:408:203::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 10:50:39 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0662.001; Tue, 24 Nov 2026
 10:50:39 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 3/3] drm/xe/pf: Split VFs enabling into prepare and commit
 steps
Date: Tue, 24 Nov 2026 11:50:09 +0100
Message-Id: <20261124105009.3431301-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124105009.3431301-1-piotr.piorkowski@intel.com>
References: <20261124105009.3431301-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB9PR05CA0011.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::16) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|LV8PR11MB8721:EE_
X-MS-Office365-Filtering-Correlation-Id: 90174926-6736-48af-effd-08df4a18c76c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|11063799006|56012099006|10067099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: PfBqsx5NcwDiuxiC64NqpTKjq4r08rsOfkkPL10/9ZpuQfeU3Tf4nq21u39hTj46rO/CSbm2DtTQgoaOOPhS6EFU9X9VrIw9Gj/pkNzvYk9m7eF/ps+SxQAEseKZUQjeWPahvTWnb7Zp0D9IkqINPIMpsjXohetNyBw6BG9ASKqXIRdC1Sa7kHB6rBxwrX8CaTkf1NspWOnGkOM+H1cLXo6wgyn7r+E6bXaT0zNz0wc3NgKm1atebRM/+lhBclpMcs9+5DyIJWiru/oeh58zDmJMsOjITwjU2DuSqYvWRmbjyTzWLftrRibHO9UQN99A++vU1q0jnztLlVyeelkvorJr0ZMT/LBndUzvo0gTBgUseN0DujkbX+OGDZTRSxkBk2ZyZeDelIRb0AGFXDOI8C6Blz115meqmRW6iliQ1josjEG/ieWrPlLVn4tNOMjgRFJLfLyCjm7Yx8v3CjQjGwDcYevvt8fxPOpVHJ14Ko9qLlwtLcErntBT1lT6NmqixHvaosiXDdJqURDdfl48pjqQaco5jU9/vbym7bINZi5Ag+xmkSPcDFW+vTZ1Ax96SwNohgJiIKfXo5FqJcsGjJtCn2MXoGTDoxAf0ze0pggog0Fpj4LtLCISiApmy5tkD0vEsWQa7vunatFNIYxJxxmPIq5bWu6Waz/+g/GyLbM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVR1cWpVeXlqN1FPQVZOakVRQjR1dDNNdm9CeS9sVVRUVzl3Y0o0alo2UmFi?=
 =?utf-8?B?Q1JTVUNZN29UUVFmZTlTV2VUMURZd2FIT2tzNThvWUQwQTB5QTRWMEFJK1RY?=
 =?utf-8?B?OVpjVzYxakl3WHk2OTRLeEFRQURZTms4bEpOYlR4cUhpNWRCWmoyNkFueFNM?=
 =?utf-8?B?UDdDQjZDSy9JYytSdE40YzVVMnBEVjBHdXdCT056aDRpVjZpWldIQUM0R0ox?=
 =?utf-8?B?UHNydzl2SE50Uy9YUmNnZmphNXlGZ2R6T1NaOXNqSzRzM2VGVCtGQTZ6Qms0?=
 =?utf-8?B?VHdYQU1JSVpTUm5MdlhSZ0tQalVmSG56ZTVTZFBaL282OGhRT0dmQi90MERi?=
 =?utf-8?B?SS9JRjV0VXJCcllrZWJmL1lIbzAwRUlPUzFhMXgreUh6cTBXNHYyazliT2xT?=
 =?utf-8?B?Y3NGVjNhMUorQ1Ivbkd3VFBuMXh2YXBWa04wdG5wekVGOXU4Q1RCeWFxSUkw?=
 =?utf-8?B?ZzB4Vm40MDBoeUFXcjBSaHVMZDA1QWJjbUhhNDZ5NEd5N05GSjErTmQ2cXlT?=
 =?utf-8?B?alozYnFkR0RYZXZhbDhGMHpSekJnNGViUWtvZitZZ3B1Snc3WnhrZWVaenc4?=
 =?utf-8?B?U29lRDNBZmtpV0phTmZKbm5zWHI1QXNYQytpeU8vRjJWbmJIU0o3bnQ2cjk4?=
 =?utf-8?B?RUZPbUNXK3NVaDRwSkNabTByNnB5MXQ3ajgzcnM4N1VCVTV5YzlEOENnajZ5?=
 =?utf-8?B?TmxJeE1tUTg0MWtGTWYxb1JkeXBCTHVVemdzVFI1eXhyYWxZbnVFWktvUW9F?=
 =?utf-8?B?c1B2bTlISndkdkZNdmFWc3J1bE9oRmw0STZ1eE5KWlVKWWNYeEtvaHp1cVVp?=
 =?utf-8?B?TlFKV1dtekFGZWVQbzR1N3R5bExKSmU3ZmlhSnF3K0s2V1dDdDJMR3pYT3dK?=
 =?utf-8?B?cnBGNy9XYnY5bm9iWjZNZWhlMXlCd2NhWjI5ZTlmWllWM0hzRGdoZHdiVy91?=
 =?utf-8?B?RjVGdDRod2V6U2VSdkdPN29TN1I4S3FUcjg2aXdZdUtmN29iMUFsendURlFY?=
 =?utf-8?B?MFRmejcvdDRVanA2c3ZDaXVuTEJRR0xaWjR0Mm4yVnFpSlBDQm14M20rWVBp?=
 =?utf-8?B?a09maTh3SjMyT0Fsa2hMNnJwNG80RUhWUHZpTHBiYlV2cG8zb01ScXhlajZa?=
 =?utf-8?B?M0hkejdrTytzdlFWUlo1QlBmZlRzNTBzRHNreHpJTGVoNGtQN3IxR0g4VHJw?=
 =?utf-8?B?ajFsSW41QVIzUHFkaXdEREQxQ3J3WWt5cnVucFBHdFR3V0NoZndkSmVCMkdp?=
 =?utf-8?B?c3BERk1tMXFaNlNkd2s0OWtKd21VL0h2elN4U1IyNzhkODJvd2w1SmZjbHQz?=
 =?utf-8?B?ZkNDV3ZhUGwrNXo2eDhHK3ExNVd6N29USkZodCs4QXN1TERmUkZyZW1TeWxX?=
 =?utf-8?B?SkIwcStDVmhvQnBxMUtKVWwzUHBqL2NDMlNFL2JORmxtdkVBenJWNjkydGUw?=
 =?utf-8?B?Z0FIODB1bWdRbHlLeFpMRVJybHNzWUhxdlJUcnVyb3YwRzVaYlNsMlJ6Nnlh?=
 =?utf-8?B?aUVmdGdMejl4VTBuRkhzYmZPMUw1ZGJsTlZQVk5GUVV3TFFRbXVJamo5RTVY?=
 =?utf-8?B?Zkg0UXI4S2JieXByOEZ0TU41SjlWLzN0RWpVSXIwcC8yQ2MrUDZjUTFOSWRE?=
 =?utf-8?B?VWFMUlRsOVk1UnY4L1RuMmx3TE1CdlEvVDFoeXZwcDdEYWVMS0hqbTJOaGxN?=
 =?utf-8?B?S2VZUlFQSU53b0VkUExON1BPSkE2RGZ2VUtOUU5laUtwckxNUSt6YU9zY3Mr?=
 =?utf-8?B?S3hKMHhYaklqUjdnZGg0aHc3bHJPUWdZcWVuNS9SQTNkQVIwQ3kvTHprTUR1?=
 =?utf-8?B?akh4VXhYaEZiNFgwczBuSFBiM3lLdFFjM2tBcjFYcUUwdEpmQ1NGYXE5ME1x?=
 =?utf-8?B?S3ptRTR1NUsxZEd0VFdJUTRyVTl0QjB3THJjL0l5WllJSWxDSFkrV3hpQjlF?=
 =?utf-8?B?NUhoYzY2cVlmWk5BUFN3VDdRUzk5bTZISVVkQUJZM1AralFYcGhFYnIrb3Bt?=
 =?utf-8?B?WE9iUVBaTkxPUWJJM0pUY05vNDlHNXRaZWx2d1VyT21QNFA2OEt5cHBBS2hS?=
 =?utf-8?B?Z1ZzQlRPUEcxUkRRSWhhTVBURngyZTFoc3l0aDZmY0FrQXZaZnB5c1ZJQW8w?=
 =?utf-8?B?NWJCd3JDdCtRcCtvc0ZFcEgwMDltMWpSdVJnNWl5MkFGSnQ5RThRdHA3ci9D?=
 =?utf-8?B?bEdIREZmRU9CN0lhNnFUUCtxQStNM1pHdkhOZDg2REZyTkRidDN4REFJNWVh?=
 =?utf-8?B?UU1HaGcrRW1UdzdLR3hTUC9GV2p4ZlFrZFBwNEFQU21tWWhyeDRWalgrOEJt?=
 =?utf-8?B?L1R2SHIvMEtGczRxTkpoZUM1a2owczR2YTV1SG5OT1V6cm4rdmJ1QWV0MXl2?=
 =?utf-8?Q?Tjx+W8x4z+DX+wY8=3D?=
X-Exchange-RoutingPolicyChecked: gl7qzlUH8p7RUev3C5mjnPKiGx+D8p6UXgCHc+PWqTkEMwSzA3J5V3lXuRoiCYDJEtQXlgYNz1OvLAGampC/S1qJZQTbj/86tsW9BZ0u63IfEBhmKMe4QPXmFAY9rubCINmaqzNhADgTjiS5icI05V5FwYn8oF6iogVKsVmJ9uISp1FD/uvRASeUEJ2IJtjFyJ0T2VZakpvv0IVOQUj9nxN4OwElo9tpEhtEnslGkgg0vkfA4lY6SYmuCPWS/q1y2lXvhQmsGbNNLyFKKEaZtcM4L2wTIjRjyGFOkeUw0B+TQiUK0Pz816rir/BNd3A+unknB1/P5Q8Xc3EeG2dOEA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 90174926-6736-48af-effd-08df4a18c76c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 10:50:39.6895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivvfRYRse5MX1FlZ+OxkHmTbnbqX16bUOwr14zUj7p6kcH5F/OQJ0yRR+5J4jgSHiFtERydJWo1NrIlD0jKtimHcgsPjpbKQP6/rfhkqcSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8721
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

Split the pf_enable_vfs() into separate steps: prepare, which waits
for the PF readiness and takes the extra runtime PM reference, and
commit, which resizes VF VRAM BAR and actually enables the VFs.
The VFs provisioning is now done between those two steps.

This is a preparation for the upcoming VGPU profiles support, where
we will want to use a different provisioning step while keeping the
same prepare and commit steps.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_sriov.c | 69 +++++++++++++++++++++----------
 1 file changed, 47 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index d0536322dc05..b0cfa6e46d8b 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -129,30 +129,23 @@ static void pf_enable_vfs_revert(struct xe_device *xe)
 {
 	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
 
-	/* Release additional PM reference obtained in pf_enable_vfs() */
+	/* Release additional PM reference obtained in pf_enable_vfs_prepare() */
 	xe_pm_runtime_put(xe);
 
 	pf_finish_vfs_enabling(xe);
 }
 
-static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
+static int pf_enable_vfs_prepare(struct xe_device *xe)
 {
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	int total_vfs = xe_sriov_pf_get_totalvfs(xe);
 	int err;
 
-	xe_assert(xe, IS_SRIOV_PF(xe));
-	xe_assert(xe, num_vfs > 0);
-	xe_assert(xe, num_vfs <= total_vfs);
-	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs, str_plural(num_vfs));
-
 	err = xe_sriov_pf_wait_ready(xe);
 	if (err)
-		goto out;
+		return err;
 
 	err = pf_prepare_vfs_enabling(xe);
 	if (err)
-		goto out;
+		return err;
 
 	/*
 	 * We must hold additional reference to the runtime PM to keep PF in D0
@@ -165,35 +158,67 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	 */
 	xe_pm_runtime_get_noresume(xe);
 
-	err = xe_sriov_pf_provision_vfs(xe, num_vfs);
-	if (err < 0)
-		goto failed;
+	return 0;
+}
+
+static int pf_enable_vfs_commit(struct xe_device *xe, int num_vfs)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	int err;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, num_vfs > 0);
+	xe_assert(xe, num_vfs <= xe_sriov_pf_get_totalvfs(xe));
 
 	pf_resize_vf_vram_bar(xe, num_vfs);
 
 	err = pci_enable_sriov(pdev, num_vfs);
 	if (err < 0)
-		goto failed;
+		return err;
 
 	pf_link_vfs(xe, num_vfs);
 
-	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
-		      num_vfs, total_vfs, str_plural(total_vfs));
-
 	xe_sriov_pf_sysfs_link_vfs(xe, num_vfs);
 
 	pf_engine_activity_stats(xe, num_vfs, true);
 
 	return num_vfs;
+}
 
-failed:
+static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
+{
+	int total_vfs = xe_sriov_pf_get_totalvfs(xe);
+	int ret;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, num_vfs > 0);
+	xe_assert(xe, num_vfs <= total_vfs);
+	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs, str_plural(num_vfs));
+
+	ret = pf_enable_vfs_prepare(xe);
+	if (ret < 0)
+		goto failed;
+
+	ret = xe_sriov_pf_provision_vfs(xe, num_vfs);
+	if (ret < 0)
+		goto revert;
+
+	ret = pf_enable_vfs_commit(xe, num_vfs);
+	if (ret < 0)
+		goto revert;
+
+	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
+		      num_vfs, total_vfs, str_plural(total_vfs));
+	return num_vfs;
+
+revert:
 	xe_sriov_pf_reprovision_default(xe);
 	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
 	pf_enable_vfs_revert(xe);
-out:
+failed:
 	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
-			num_vfs, str_plural(num_vfs), ERR_PTR(err));
-	return err;
+			num_vfs, str_plural(num_vfs), ERR_PTR(ret));
+	return ret;
 }
 
 static int pf_disable_vfs(struct xe_device *xe)
-- 
2.34.1

