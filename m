Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFDD606A339
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 09:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RBVmVTQs;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=K7bKfBVc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E4510E785;
	Mon, 23 Nov 2026 09:46:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B481010E785
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 09:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795427189; x=1826963189;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=ZgmblgKNJ677/zWrwJB7ghPgujXvQZex3bfvtDw3cU4=;
 b=RBVmVTQssqVdUA6daEeqk26NAJVIyc4BMSlu6WF/Q3/2yLmAg9bIEneI
 NbIiT4zm0NEETrffHvhTn2Dx9Bjgz84leNkdmnPKbbc8isAAz7rUeNjRh
 jAhRi39Ye5ICo3W40l++TQQ1d1CeA5ESOM39FuuUgUWxaoBCcjNjPh2YA
 nX4+vFeOcQPRFv7flU8xqmZX5uswYXIxpSYX7PLv9KcPztITRCrpq9cnS
 A9QXL+8HoZRbhaHFVUvWAWx/cIVxWRKOfktiz9pcmkIzISgtwP/syUtLk
 /r8/O6xbzuMpWV1xQMiSFq6rDtOAwpMqkI2sJXhS1D89FsuCs0GGX1BAw w==;
X-CSE-ConnectionGUID: 8+39unOJSSCJyG+xsHVMng==
X-CSE-MsgGUID: JHjytQMmRcqkVrG2YDGb8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4240223"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4240223"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:46:29 -0800
X-CSE-ConnectionGUID: Vz2hVDZZSzixfwqTottLCA==
X-CSE-MsgGUID: KIieFphTS4ucGFkFtcsBYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11353894"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:46:28 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 01:46:27 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 01:46:27 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 01:46:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUAZ9BaqOzZ35DS8UnvEFQf5rHdfEKKNC3amIFrB4cg5SuRW8sNXbxhOJOTY9Ovwq21OBUf47BPgyDkHn7cKOy/Jkvu0MgC0Smt5v+h/XO6z99ztAeLWVHdb7zF7QAYhzBqA38QmS02xjh/JdIYhd3o1233975l2Jg/So67lTC1xK1Y1tOkR893K95lhFOTtqQKjYMriBDj0k+HfqHBSTHoJ4yDF/TWP/DNH2cGeYfuRjBWzBKP9ZOXRjsUMzqVW0/Q3/ofOHJm+cFPudz2406kq65cLOWV6L00XyUOeEl6qU8PGNYtjZhOCcIkuWuxhXll4U+LUOxaVU2srZwKd+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpSNQkWxHrdWIWx7CT6mJQJOZXgXs4e4JAl5K0Tf+jg=;
 b=WPDi36hm+vbVMSc8AImZTqHRSUAu3fg4B/DI0K3eAza0wwjMXp/+SahHhcR5AWkb4RUB05LWvnudPyGeheG+6/Pi4wVQoXQ1nfKeBGeHj5mwSSelvPlaGCsTjv5siCGml5wdNQunKdidqkLcdqSm9LhplCMk2IpOcUTOl632KaqgHaMJpm3z35m0UnsAFPOqGIeI3RCuFK4c9SaDMljCNO/+3s1RKQr/AszzZ5W6VNaj4Vhf5IbS5Rbk7RDAI/wkNpu9ee792mcbtPWWeYS+6qp6qDOUKXhvSC8EkfmnXdv+1Lq5b1Sce3OgfFupbvSbIYkde+Jn/HhSPCzOJBDLPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpSNQkWxHrdWIWx7CT6mJQJOZXgXs4e4JAl5K0Tf+jg=;
 b=K7bKfBVc5qTGbWdsQ3HwbkNX8iOI/t5wWWbXb1nlVMSpXCe/DvvjBD6zTfEX3DniTAmEsWEYT13S74yPlNL5pmp/jiCsfiXYX1Zl7flcU+89kazp3UmjAFYmcVmTBEWrawDPDPGnJymVs3xMNGtZ2gOm2HunD2Z2OJzEf0CKll4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SJ1PR11MB6084.namprd11.prod.outlook.com (2603:10b6:a03:489::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 09:46:20 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0615.012; Mon, 23 Nov 2026
 09:46:20 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 0/2] Prepare VFs enabling for VGPU profiles
Date: Mon, 23 Nov 2026 10:46:05 +0100
Message-Id: <20261123094607.3300722-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0139.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::14) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SJ1PR11MB6084:EE_
X-MS-Office365-Filtering-Correlation-Id: 3db9145d-d22a-4f7d-d493-08df4946a09e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|18002099003|11063799006|56012099006|261102123227099003|261021123027099003|261021121427099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: Qy7JrKSuAZYEWQTt7JwKfNgahnUxK1mzid0aLGV431BXNg2JhN4R3NoShST+SBlUeTLLaFNLXSe6nkUX3a14cED5WYuZgTPpS1nNjaLAcCHzZZ/lW2z2BgnOCCsdhHSlsu27UZa5ihMLiBiLyMwfLevDGeUMI7V/Yhv4tVDUa9NrP+UGNeW8M/a776ed3+N4NHGMxVYCTq36OG6aHO+EjzRAHWQpMwlxKl8frkC2kqKBEeUIjLkThKuTUTP4kxYOUtmgBGlyUvKC65zI24KuPWWCO+ZxkA31b7LRhHQkf80YWdg+Sjkw6yskT6i17lT0I2gwsL+ydZxRdtVaUVyRfNBdcchn023AuMk7rJMRVKq5XTOVCU4mnvNz+59trREG0RmsU9fL41GTMCuEkOE3OyHqzZ/GujntTuLMYwgLM5hEiZH5ZSYwGaVZkRkbCWE2Dd17Obu8ZDhFzTIPDEWunKE2JJ0Ta/stiZJKsdbtQrF5yiFXSLrVZ7d3BAo8w02N6Xx89E7aK6LmwJxU9YP5y/y3O30tL1MA+fDz3n8f00A4BNPgR9yPG8Z6JlGrVvyvy9tgYvd7nMW2lxC7+AtMBdrDlhje1TTaERPOfNbtgZb7Ye4Jz4mGnIRKQ02TdMExYfiVJT8gjes9LNuT6/tSXyyeExRWTsVKFWVj5czW9T8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(18002099003)(11063799006)(56012099006)(261102123227099003)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXVXVmxQL3pzaHlBTEgzbGdMbFBoTUwxZUZVVWE5WkU1SmFObnNnb1E5UURj?=
 =?utf-8?B?NmZVRWxFck90WkZ0bE9EMjhoVTVIai9XQWlTWkVxajRFazJ2TEFXOFd3aGFU?=
 =?utf-8?B?WWpRdjFLQlNLR00wazNiZWtQVXY0Qml3QUR5MnAwWTZLVDFzbEtTYkI3eFYv?=
 =?utf-8?B?a1N0NjJFSVR0ZWUrVU5JdDNybHZycEVRN3BMd253T2VqWURKeHN1b2JheGxl?=
 =?utf-8?B?TnNuQkh1LzMzN2V3ZUhwRmdPSUVGOTBlekRPTWN1UVhOVW9MY3lrVWwrYjJC?=
 =?utf-8?B?NDNEUnUxU09BKzBQamhsSExFNmNDOEpVUU5FOXkyVzJaVjdGbU56TVpiclpy?=
 =?utf-8?B?d2xSbytacDZ5UWFUem9tYzVYdmk2RjRhWG9heE80aHdRV21Wd09GN0VpcnZX?=
 =?utf-8?B?SDJYK0JSNmlWdkFCRWNSUEZRV0ZZM2YrVkx3TWlPRExhbWpCRXhYZldLRlEz?=
 =?utf-8?B?L2pzRVRJVEpBTlJDYmI5V0FSQnM1c3pFZEY0STVBSUtnOWVLQU5MRlE0U21U?=
 =?utf-8?B?SVFnWHlmcXRMT3pEUDIwQVIxYWZwbzA4cVY5UlpqWW1HUFYwd250djVNZ0ZQ?=
 =?utf-8?B?RFJ6T2hadU1WSmlDS1g5OFNGZ01RelczTDl2VElQSjErc214dFNXbUh5d0Mv?=
 =?utf-8?B?RW1JbjQrSFdzOGlVS1FhMk5qbXljYUM1OVJjNjNGcFdIbUJRdDhhK2RFMUdY?=
 =?utf-8?B?MlFkVzhCalJYcVMxQ2FIQi9aWVY0d084SjVCcGhMT0dEN3V2UmVyVGZaVVBP?=
 =?utf-8?B?OHRGM29YTTJhbXd0bzM5aHVyTVJXTm56UGthYUxVQTZkVVBUbEd6ZDJ6RktF?=
 =?utf-8?B?SEpTQU1lUmF1MTRYaFZlanRUMWllbHIzZXlNQ3BTdkR1NU5VN2dZeXVVRGd1?=
 =?utf-8?B?MGllUERuZVdmeTlQdlY0Wm01RUlQR0EyN2lzeFlmZEIySUxKdlI3ZGNtRG9z?=
 =?utf-8?B?UUJRWndURFNSY2dmTTJwekl0Rk96MXJwNkZ5NEcwbW9ueWJCOGwvcFBrU2ZS?=
 =?utf-8?B?NWRRdWszMnNSR29nWk9YS3ZNU0xGTWw0MDFaeEZleGw0bGxVSjVlOWovQmhs?=
 =?utf-8?B?cTVaL0p5TXh1S0hCVEhhMnpteEIrd045N0NpeGx0aFp1eSt3WW9mRkF6dEpa?=
 =?utf-8?B?UWF0TjZZZFhCeDcxS0NqUzdia3VjSk5TbkIwNlBQYmVVN1VlZzhkTDZSSHRw?=
 =?utf-8?B?eVFNWjVIR25WMUJiajNOTEJLNkFzbzBQMjlBNEVEOEpoTG1TelJ6UEk5emE1?=
 =?utf-8?B?V3FSQ0RyODFMV244S1JnUjhIVjRJTjJ0KzdzRDJ2MVRuNER0U091aVkreWpW?=
 =?utf-8?B?dkN0YjZKendINTZaMUthMDNkdm9VUUtLQjJQbGZCOE83dDdWNGpoNmk4blJB?=
 =?utf-8?B?T0JNN3Y3NWxMRVRLUHlGajAxcGJGQzU4UWxaVkpLZ1IvMnZ0MWhGUzFDNm1k?=
 =?utf-8?B?aGdGY3NlaG5Gc2U4WkdMenJjcTFCUU5ZeFFsOE5WYm13bDV1VmkybVN4UDlJ?=
 =?utf-8?B?SGNlZ01OTWNlYk9FOUpzWVJzRHZUdjhlOFI3S3RtT3duelBPaWpQQytMY0kx?=
 =?utf-8?B?UStLMmV4QkdCYXBycmpueVZEK0JtdmdtdW9lcDNSdWt1Z1FQR3JlbUQ3WExO?=
 =?utf-8?B?WlBpYnhLVW1CbmpKdzNCNmh0dG1JdXY0RXExL3FmUmtFaENMMjhvWVQ1Q1Bt?=
 =?utf-8?B?V2lkU2laUVE5bkZlMWd5UVRPd3hXYng5bjFpK01HV0FvVGY3ZlNyYVMxWHZr?=
 =?utf-8?B?dzhiQzFIdlJOQ3R2NTNUdFZONjhjTVBZbGQxVVV6R1ZIcUpKSjFBWkpKUm9L?=
 =?utf-8?B?bllvazFXS3lwUW5ydCtmeWdpY055bnBTMmphaUpPV1h5TGYvWnh3TFpxMU5t?=
 =?utf-8?B?cHRTdU1qT1ZoSkFuUmVKRmlwcW9vNjNZWm00SkxUODhkNEVybG9DeHBoNHRz?=
 =?utf-8?B?MmpRbnc1UVFVZHNtcDdrNUxBVUNzay9laEo0Nk5mT0ZmVEU2bnNTa01SMzFy?=
 =?utf-8?B?aVVwZkZ0SVkxRmtDWnVKemNEUi8rOVlzY2JyNFpVWFkzbXJNVmE5b2J4RW9u?=
 =?utf-8?B?Y0RvUEE2YmxuSHJXWWhicUtucVBQc0FrTUloa2xIcFZob0lRVGtuRXZPQXFK?=
 =?utf-8?B?ZVZsUE5saXRyNGtrT2p1aHpleXJwQzU2WStpNC9YZEVVMVBrbjE0UUd1YWZp?=
 =?utf-8?B?cHg3Vytyd3MxRjgyZHdscTUyTzd1azNMWEw4aC9mRkxab3p6MWh0NkN6QjFy?=
 =?utf-8?B?WGVpek5RbDVvRklsNjB0cjlaV0FoL1ZpZ2gwWkx4aFMrQll3R0pybnNxR3VP?=
 =?utf-8?B?V01ZU1doSHVWazRsSE1RYnZrQytGVWEyNWRqNnhMMGdZdFpyb2V0cldNc2dH?=
 =?utf-8?Q?plwEFQH5E53K5mKU=3D?=
X-Exchange-RoutingPolicyChecked: A0cnFDo6WYg+iUBusQXpc5ntNZpGdZ0ItmTR8e+HIwm0BADXRyIitMUZTkvnshdHclN5+WXE4H8Tc3OTpR9cw+B96wHZbYEH42hB5lUQX2Fce0DIrt1KjsyXj1rVcMdNZxt/v8iVGklst8f/wFtF0/86SEiBhkVtRmciKw2VKOzSCIsWOxwaW/e+yHHn4NFqwf/lptAMzpx8YIp6xuVR+lon+KPmtQWmk8f3xmvreFEQApg0mbNYm+i8C2PlbUXcXmDH9V32d4RihWzDRzLEGcAAw129WAR0s876j4magrbBbSFQNU3me3ZBzgedw1YWsBjfsYVFrx61G1n5rCaZ5Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db9145d-d22a-4f7d-d493-08df4946a09e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 09:46:20.2250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L6UaWIr34l/W3/sZRjpurxEdwRD+NIxNQrSLTL+sDexHCCSF+VTMGoPH+EZRAf+EbuIFD9FZvCa39H96fInQz/TiG47oFTtCOuixfSYzp9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6084
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Split pf_enable_vfs() into prepare, provision and commit steps,
so the upcoming VGPU profiles code can reuse it with its own
provisioning step. Error handling stays the same.

Michal Wajdeczko (2):
  drm/xe/pf: Extract VFs enabling revert helper
  drm/xe/pf: Split VFs enabling into prepare and commit steps

 drivers/gpu/drm/xe/xe_pci_sriov.c | 93 ++++++++++++++++++++-----------
 1 file changed, 60 insertions(+), 33 deletions(-)

-- 
2.34.1

