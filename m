Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9C9606A319
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 09:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FIcZtbgf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8344410F46D;
	Tue, 20 Oct 2026 09:55:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37E510F46D
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 09:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792490151; x=1824026151;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=H08x6+6akoVQOPKj9JBbIP7j82igvA5b7HU1FmT4tjk=;
 b=FIcZtbgf+7odD6UOzQgly8+zgrw7R2eW8vdeE+WiGsE3yVz98vAy0tM+
 O02sHCOmT2rg5EqOE4ddalctx12VsdhQseckeW5Bw4IciU438nXSi6ev+
 Vvde6N13TPkXv1wjJLkwDCEIjexNTXa0tVqztneFWXTWXMLEyhlxqt8VA
 XTzEACvYMnCd/+JSNS+6lTgY75szF3xijXuMvUzUG2AOEMiXui+B7YEGz
 8+9Cd1gZ29Q9YOMVUYhvGJkH4IsAn1Zgd/AS2vEPju8Jjh0BMEGlifpFX
 I+2uR0ATltICX5c2UFdoTb4osxTIRVNXw41IQPA0KoHKdP2Mek5pLs5m3 A==;
X-CSE-ConnectionGUID: K6eU0Le1RzmqHKFKttAcig==
X-CSE-MsgGUID: 3TewFqw7T6+xHn8ALzWlpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1199660"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1199660"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 02:55:50 -0700
X-CSE-ConnectionGUID: SpxteU2aR+69jAZEtAdylQ==
X-CSE-MsgGUID: RiK3Lz6aSuiSfEUVqLDJpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2759217"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 02:55:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 02:55:49 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 02:55:49 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.13) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 02:55:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rsIzlJMDzejWPt8aGMBq/PH+70dk6MC2b7a8vH1ksxUyL8HItTytKAD1EclmP8kFZKnSNRbsnuS5iEjdkKUUL8IGDNQSS7jVLj4IZdI6iXB7WPH4vpjgbxEaRgX+7OehG6rElLzOwQwr5CHlRxq367JtEg7/DIb7mhd+hh64espmPIBD91/R/76wgZLPGRbWQe+5QP41xcNLzI3NKlr9GYk6780a1m7KsB7bJ6KJjWoOkz8UIKn2XVpyL5EAE7AEd876DvKYZxK4qeq7jcJmoB2vlTW9SPeQxn5OWXZf3jUV0o5xNbyfy8b2A/9NV0s4MqdxUrQRBIXzTek9RoD7vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gw93SURGVVn6bvAuXYCoX0a5bO0B7ke6QUWaDnzCa7Y=;
 b=m6Pu1SGVpfYOwNDNnfRsNogR1MbZ9qD1kaWWIqIbpW1Faz+Mcu1YRjZIuY5omsYuLqSR8WxQHjOuxs+wiyfTpwdChdkfTU4iEvp5skRB28oGzGxEAb+rFn372iKyMS0QGnOxHYbaEsaDEwU5hLpF8OzEPzLoNftu2ITYsA3bYc0NqP9jC2/4kEGgLYbNJuZh6hMK48uAgCD1oviQFNkNeLq3SKm7jp05TNGwVVcA4bXqdDblVheEoOsiVupqGKq61Xtm5Uyyrb52ipH3eVflfrGj682SOqOPmzSSWObo7QaFjIbS2p0qL7Hn6di2yI7xTsqSc7MrZT3W8YoYn6Vylw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by MN2PR11MB4645.namprd11.prod.outlook.com (2603:10b6:208:269::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 09:55:41 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 09:55:41 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v6 0/4] Separate GGTT pools for submissions and VFs
 provisioning
Date: Tue, 20 Oct 2026 11:55:28 +0200
Message-ID: <20261020095532.473609-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0232.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:372::19) To BY1PR11MB8054.namprd11.prod.outlook.com
 (2603:10b6:a03:52f::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|MN2PR11MB4645:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f781c3f-d5c8-4481-ed90-08df2e904cbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: I/Zig/H1xJWgb/77hQB0TAmXCzFY6ed6tdmHHRsbuUibC3MEatT77HjV4XSbSQkEjjus9ExML0xR69rcUXBFqqbhz8MdCm8/eVIpUytibMLhOnW9TZlQEEF3e9BpY7HBEOVhUhrV92BKiu17doYlBLmAQ4Z6w/wc3Tem9way7FzI3vOS1jsPAe2Zq8KlPn+8tgRECZXEFHuTyrw2vVztgYMoucF6M8d3XyAwHR0vhE8Wt8fTGzaB1isYwyX7w9mnArDs6zyu3KpuU9eTOz7nqZs9IZkyW2wMfKh+2l4qsoBxPQutLxwqVSZUWigqKRoBE/DknW6qDpojIdPhDXsaAY+Mk7k9ahlLDAF6xASzSzFJqVfvo8NjiTQMbWcgQgoZJk3TD0MyfniHoaFyvZv9X1JaPD/XtO0seJWdsiXS6I4GMJW9Iy7yqYb+EeffAiqkcm55iUBQhzeZYlEByUC4on5LjGQho03tTf8cWerjXPJxtzq02GMCSch/NkCGXqyz3UDF5LJyCWGiuEOYz79F0oxDld0ezOXiIDcJ+1bdTTTjtRS/lCCf8P9XsIyxh1/8aOHIlQBqL5swIPn1Oe2LInF+fQVvvsTpiWLhTtyraf6wfbRDARESiQlmRxUEtSmdu8mDToUODcYf4M1NAbRDKc0WdSovR5xaJWli92GwcmU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFZTT2RCNkl4Z3pLT3RWWGpKek5qejJHeDNjQmkwQ1JxQ3FlWEVKSmNmL1dI?=
 =?utf-8?B?QU9QYlRFQlcydnR5UkRpYUFMaVpHSUpSV3pPSVNGNE5QSzM0d3AzSlBmck9T?=
 =?utf-8?B?YjE5Ny84UTRLWUYzUG5kVTM1dTdGclh0Wm80RmQwQmY0ZlExTVQ5V2JsbWMv?=
 =?utf-8?B?S3ZUemEzTi9NSXF1bDRmODRXK2NOZ3F0Q0hKNjNBYlNaZGVuZS94Nkw0M1pS?=
 =?utf-8?B?NHdZK3FmL0MzazhiazEvWGxzQXhYS09jWWo0RnIyTExhZm9Bdjk3cFR4dllr?=
 =?utf-8?B?ditZdG41RXlqTlMrOG1NdWo5a0dyZFBCNC9KQmxjRkhQM0pWODZqWjZuaVFT?=
 =?utf-8?B?VVlxeGZUSEJCQjVCQzF5UXNrTFh2UFNaSlpVdnVwa0VpbjB0LzdBMDlnWlFx?=
 =?utf-8?B?NDRNSnA4NFlLNFNjdkRlUzZack82ek9CbVJUZnE5WDVwSWFtNEk2eElDWVFy?=
 =?utf-8?B?cG8xTjZlUW9QMUlmOEtHZStoNi9vT3p5S21sNlM5YXgvOG1Kelk0elRtSUsz?=
 =?utf-8?B?azZYdEhVSk9HczgxNXY0OXNON2hPdWFTalVWd3g5ME1vdEFBL1ROY3dmU2pO?=
 =?utf-8?B?c3BudWhQbGRHVGZJRnpBUHVyWWUrSUlxUlJEVmxKQU5IaDF5M1hFajhnOWxv?=
 =?utf-8?B?d2JoQWtYYnBJcUF0bW1iUUg4d2d5eXBuNTFMYURjR01Ub1J5STBYUlZlaUpG?=
 =?utf-8?B?Y0xERTJUYWI5ZldpeTVsSGZOMlFuSnZ2SzNnVU9jTkVyWDc3bkNHUWluRFlS?=
 =?utf-8?B?ZFVEdXNOVDhHTmFoaTNma0dFNkg3NHJrdWplZE1sbFFtblVSUjBaTU1CMG9i?=
 =?utf-8?B?Sm03L2ZWejAzTW9sVGwyRTVVRkluUUJYVk9pRC81dG9tNk9xWWlNQVEreU5Z?=
 =?utf-8?B?b0F0Nnd0QjRST3cwdElQeSsxL0pxZlhpYjZDL1VyM2cyVXJXdjRmbWdkZ0o1?=
 =?utf-8?B?eVlibG9YekMxTGpmWE9oUnJzNnJna2VjNXpFZDRpRGxQaklkWlZvbWNROTBG?=
 =?utf-8?B?QXdmNEwwUG1Hb2NoNndpYXh5M0hma3o5L2VTcmZ3TFVuWGIzK0ZTZVVKekdy?=
 =?utf-8?B?cjZrd2gySlV1Sk1zSHdQS3dtaXh2aUsrTGpVMFRIdWh6YjBwRWxyV3JhYXhv?=
 =?utf-8?B?dGpYZ2FwQkNHZEpJNXJRVlNRRks5VGtnbjdFSXl0MDdsTEhnUmcvQW9lTTNo?=
 =?utf-8?B?cjhBL25MWlg3eHl3NnVLQmtncEljTFREanVhQVVQT2RTL2VmTjR6R0g3Vmcx?=
 =?utf-8?B?NWt5V3hscDZSRlNQYUdUdHhkS0VnblBueHYwQmRLZmFzbHYvTUJ3V25vdTdy?=
 =?utf-8?B?dThNWGk3MXNsSDYvVG9BQ3prek9vTmFGekI1bkNHdnAyc2x4M2RMR1NpNWpx?=
 =?utf-8?B?ZHJSVld6bW91OGJTK0ZQTzVCYzBVQmNZRFBPR3A5cGYyMmFqZnZGWExCeWhK?=
 =?utf-8?B?TFVlTmxYSWVOMTArbVo3TGNjeFAzOFVuK0prZzBHVGd2dktia0tyN2s0KzJH?=
 =?utf-8?B?Znk1VElDUlZ1dDNXRkNBK3JHeDRycnFERGJNa01MeUFOWTlYT1BmUkIrSE1z?=
 =?utf-8?B?UHU0dzMvRWhicjZ3WjZSQnJKcUxEL3Y5MjFtUDhXdWlGcHpNQnFOWFYrQTlV?=
 =?utf-8?B?TStCbXNRYm92aEJXV2FJNnFhSC9Jamc2MzJvYmJqYXVkL3ErdG5LcmJYZ0tI?=
 =?utf-8?B?MGprQ3R6bjd6QmU4NjhaME5FQWlOU3VqaDh1eU51b00yU2pmd1E3QUFwUURk?=
 =?utf-8?B?bDh6RWdvOUxWRS94MTh5b3o1SU85TVY1bUd2c1FkU3BYbFJRQTRZaVdKc3RI?=
 =?utf-8?B?ejJRZW1ublNCTlg2TzljSWpGNnJyOVpDcU1wa0kvSGp5alBuS0N0NUk2WC9O?=
 =?utf-8?B?cDJYMXJHZHBsRFVCTEJsNjgxZGV1SVEwdnJCbi93U2RjMGFhZjBVWWRGT2Q2?=
 =?utf-8?B?RkRYc00zUklKZFdKNjMrbnRNcTJiSFE1RjZRcEZwLzZyaFFBbDREa3p6d0Rt?=
 =?utf-8?B?clBEeng4RFdmN2hNbW9oWDl1azQwMU5tRHFjUC93VitwQ1hKbTNHWXUxV2FJ?=
 =?utf-8?B?bExldDJsOFNuT0drRHZoZ1hoLytvQVdWd0ZEbmQ1MXBEVTUxRHVqcU5MVkZ6?=
 =?utf-8?B?L3B6SHN6ZDBNR0FEUDJLNS82c0hXSERSWEpnVC9xWjZiS0JOaGJ5VjRIeTRI?=
 =?utf-8?B?ZU0vdGR4T0UvSDFsMjZtRFZQWm1FMENiV3IwUE00cmdaZlZLZmxjV0NHTlpt?=
 =?utf-8?B?SGRPVnpiOWRiZ3VKdnRDT3JkMXZkNHk0YmpvcmswbGpSK2xLZkt0NkZtUCt2?=
 =?utf-8?B?V3ljL2svM0g3UFpxTWw4T3NQdFlhY3I0RXMzOFBQd280L1g4LzdnVnViZEFW?=
 =?utf-8?Q?JVwCFnh9eH3TClWs=3D?=
X-Exchange-RoutingPolicyChecked: X+RHxQhvEQVE5LsvwTOVLX7tGuDgX2oeSYBQMERX6Z10N4RlBcjG1kHVdKFj+GruKtsllyJs9K4ARjPPv/0ZJq/W56TPHD911nwNmk6jAvCmO16ze416gj74rjEm02dMiAbcSrFdGheV+rh2mnkb8OnJS8jYaUMAD1GosfoM17zfLHsn39hEMt14TLO1zgYkMfnb6MOtEC2YXXj/3c1rk0ERdIy7sJC3aY4VEGZlwrerM0wxU7pum7CCgj8B19bZ4ESlw0QJmH3Ze2ivqwF1D4yI2WjC57kPpSrmbwCRRBg/pUddkbKJlmlI4GvR9p0qURu6lkfUKrrEHIoxwdv85g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f781c3f-d5c8-4481-ed90-08df2e904cbc
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB8054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:55:41.2762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g+fpZWnwcVkbOUKKH5/3NJ0HyczISWWkQkQatycnbaOOdPio999IkfCXu+8YFOB05KxvVZiZ0KAU3fnYy583hYNj39hVxNHKGU5V0WzIJqI=
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
v5 -> v6:
 - Release allocated GGTT nodes in the KUnit tests through deferred
   actions, so that an aborted test does not leak them into
   drm_mm_takedown() (Sashiko).
 - Rebase on current drm-tip


Piotr Piórkowski (4):
  drm/xe/ggtt: Introduce full GGTT range size
  drm/xe/ggtt: Split GGTT into usable and shareable pools
  drm/xe/ggtt: Initialize GGTT pools by SR-IOV mode
  drm/xe/ggtt: Add KUnit tests for usable and shareable pools

 drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c | 341 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.c             | 302 ++++++++++++++++----
 drivers/gpu/drm/xe/xe_ggtt.h             |   4 +
 3 files changed, 587 insertions(+), 60 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c

-- 
2.34.1

