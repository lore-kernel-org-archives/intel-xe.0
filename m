Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DB8D0D151
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 17:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C1310E5A9;
	Wed,  7 Jan 2026 17:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DiSHCWj+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5623B10E5A9
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 17:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767808771; x=1799344771;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ibrEMe5G1u0QyztoiciZbN4Z/rCsvtNQV04ZvESzKWc=;
 b=DiSHCWj+jBt95RYL7gp6bKeodeid8pNJszhWZ8PdPNoCxq2JVw0xy2me
 E4KRFSSLKU+NEbHQi7hT2iqTu1S/yLgNQ3Nl0g3m+hNGeqF7Mq6xsscTe
 Shh27w74MJlrhLbD25Z9YfPkhbA5cTPOW+Xd4hO/c26HHCpaSQcRC2ALa
 wSaxZx1MvMOHIxkr/VWX2pm9tYgVAlGhKy9a0TY/QKJ9UAxT1cBMSg2gI
 rtlWsyzzklu2q4jVEb5nyv19hPcHaB0a0ZWN2BcV+SA8J0v27vM5dzD9b
 DOuAhHbofmlBVaTWAK67up3D+V2ySotA+FTyptEE/lPPOdK83pv6uMg1c A==;
X-CSE-ConnectionGUID: h8/Pt8WJS5ybW4NTySvP/w==
X-CSE-MsgGUID: cMB27rRjSMK28T2k/s+GWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69236189"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="69236189"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 09:59:31 -0800
X-CSE-ConnectionGUID: L/BXs9nRTLWCNx7qb+OPpw==
X-CSE-MsgGUID: yH461X07ReytgTleE3kS4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="208049239"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 09:59:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 09:59:30 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 09:59:30 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.19) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 09:59:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIckyQKRig8YzU16URlEWhqbSUf3KpQbeZ6xRfqMCYAN0wtm1thWO9XCnh3UbR3esCBElJjx9NpUuAmmJPstyPeiMjlzVx1i5x45yF1DdzX2TaPYvA+0uxdqqOJKA6Z1GSSx6j6rr6Fij32RcIOhAvOxdt9+K+4WqMbm2XS8VF6pGqa7qR+NwItvOZ9EJmuiheLNshe+PhbYUEvkzZshFQIA9YcUDPaJLqRUHPCpo3K7Zur1tumjZMg5B6BQkM+npplRQGx/VesYQ+qjer5lB7rCiS2NYFDtI8WCKWNOvoE6pwIoCy4cgSIop/y1hcwPfUeJB4i/mHY3vPjJZusKWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibrEMe5G1u0QyztoiciZbN4Z/rCsvtNQV04ZvESzKWc=;
 b=eFIEg4QCmpvKQhSDYJveOkX/TfF23wsU6JUCPEthb8Go7KSvF5nz0sKp8P2T8TmXUabjwfinaEfNTnxThtVAjLrKmxDOV63jw/fB0WzVJcL7ihLP6fa4Tgcj78XdaZQtDo4Q4OTU+ZzeIJ1pRbTK1dJaJJxUD4c2nA7YCdUR7llv2idGwMpYeKqD9ZNQWLbuCgtD6jGtOIgKIylYoTwFpbRiA9RANBDmu+d8ytuup6Zgi08SzMBuuj2wOXkLS6ivuxsDU/yuzIwk9oty4gMdY4Xrkn6aqTxz6xm2CHJI+9DS9mPkdiRETgKByHX3W6XWVEbFIEIopDYidvmOjpPTFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SN7PR11MB8065.namprd11.prod.outlook.com (2603:10b6:806:2de::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 17:59:26 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9478.005; Wed, 7 Jan 2026
 17:59:23 +0000
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Filipchuk, Julia" <julia.filipchuk@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>
Subject: RE: [PATCH 1/5] drm/xe/guc: fix struct guc_lfd_file_header kernel-doc
Thread-Topic: [PATCH 1/5] drm/xe/guc: fix struct guc_lfd_file_header kernel-doc
Thread-Index: AQHcf+3m2j0Znt48rkaTX/uhVXaJkrVG/pPA
Date: Wed, 7 Jan 2026 17:59:23 +0000
Message-ID: <IA1PR11MB8200EB58CCB7596135ED35888F84A@IA1PR11MB8200.namprd11.prod.outlook.com>
References: <20260107155401.2379127-1-jani.nikula@intel.com>
In-Reply-To: <20260107155401.2379127-1-jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB8200:EE_|SN7PR11MB8065:EE_
x-ms-office365-filtering-correlation-id: 4570d961-fca4-4a8e-339c-08de4e167d53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?UGhGL29yQWhjQXhraDUycjF2WDdVRFlUMFVPTVE0MGk4b0Yybnd3Wml2a0tY?=
 =?utf-8?B?ZTJjOWg3SXNMOWhNL1o2TStEbFM2Njd0TVIzTjR2OXlicVhWV0dLcXBZVXlI?=
 =?utf-8?B?Q25kaUVsblp4aWlzMXcyVG41alpTOHpFcFlhZlJkTTBSVVNLc21nWjU1bWdk?=
 =?utf-8?B?SkhiRDdXR0g1L0ZsNTdsTFJ1SDJ2Q1ZRU0hZd1lTSDJjc2MrbStvQ1JVeFh3?=
 =?utf-8?B?bkVlSm50M0NISUMzM0taZFVsRysxT0Y1WEpFQVk4WVcxZUhiNXV0ckpOZHJK?=
 =?utf-8?B?bGFhcll1VnVIbllaVEQyajMydmdKMGo3SzRBeWdrdzZWdkNrOWhTazk0R0pO?=
 =?utf-8?B?VDBMZkZaVjlNTkpzWUJrRFhhMWRCc2g5V2ZCc1B0MC91cmZoRFJUZnJ2dWlW?=
 =?utf-8?B?T2d4ZzRvSFJGZ3owbS9Eb0hBYzBBWUJXN0gvNC9MMHF3dTRtWnZQM3BaeWJQ?=
 =?utf-8?B?MjRrVVBobEhWSGJWTTBxUXlhYTMvOExicTIwMUxQb2hzaXJPSkNGZUNaUXNV?=
 =?utf-8?B?TGpEenlNRHRDZW0wSTdFWDhnQ2IxbFBXQ3dmWE1DMDNUK1dNTEU2bCtUNXM3?=
 =?utf-8?B?ZFhLL3dNUFg0QzFEQm8zallaWGh1YUE2ZlNieG13a3dIOS9HdHFPQlZCZjNt?=
 =?utf-8?B?N0x5cCtBQkl6bjdFNHFqWmI4T1Axc0pLUjhFUDRENkR4c1lETUdhcTNxbXdE?=
 =?utf-8?B?MS9ZWlAzRGJRalR6MHZnQzAxdHIwRWJQSTBLdGYrODdRUFVjbXBEeHVTbUMv?=
 =?utf-8?B?UkFOS3ZUd29TWVVDVDRqN24wdUlaSFM1aFZOdVUwamJGNFJSV05JZ1pHc2Vl?=
 =?utf-8?B?aVlKVUF0UngwY0IyVUgyTnZ5TU1sOE1Kb3NNbkNXdjdBTXI2WmRQZmdrUWlt?=
 =?utf-8?B?ZGF3WkthVGc4bGJjanNEM2RKWXpWKzU3R2JMVkNNeE1DbTZ4V29XTUhIVGpU?=
 =?utf-8?B?NjdLc2k2WU1yTE5ZaFk5eUxpdVg5bXJ0Wk9LdEE0REtXSWZFZ1FlV2cySmVG?=
 =?utf-8?B?eDFoQjdaQ3E5cWtaN3M1M21zZEZkR1k5ZzJZZzRXYVY3bVNDWlhUQUk0UG1q?=
 =?utf-8?B?WGlwem1JQ09vLzREUDBLdDRLQmYrV1pzd3ZpMDRvbVZOKzl1OUdoTjJZeFFQ?=
 =?utf-8?B?M1Z6WVhEOW5vejBLUmJmTUZCL3BubWNPbkNJcXNhdUkzam9VSVJMQ0lxSEZl?=
 =?utf-8?B?UDZmbnNYSWpGQ21BT3htVUd5cldaVFovVEpsVU8wV2c2MVFwazIzNlRyWTZ4?=
 =?utf-8?B?NFVaQTY4UkoxTzlEeDJ2VnpiWGVLRjFFR2NDUU9vZjJBRmJ3QlRPaFpkeVNh?=
 =?utf-8?B?M0FSYzZoRWkvL0RXZmtyN1pPbi8xQUs1WTFWeFBLMkNQSVNCZlRKU09EdTNM?=
 =?utf-8?B?RHBYZ1o4OE5nOWtyNDg2NkltRUovRTVHTllFd3NHS3JFZGdnVkYraW8rQ0x2?=
 =?utf-8?B?TnJ2anlNRHBTTE84eWtIVEpMMEVpMWZlb1F0NFJKc1RMdGR5V0FFVU9ZOC91?=
 =?utf-8?B?SlNwc29aY2p6RkE5Yk5RelhQSnB0NUQ0T3pvZTJlUmE1YjhsQ2ZuT1RXOC9O?=
 =?utf-8?B?cmhGdWZ3T0FnQzQxZk90YWZwNitvNFVIVDhKVC9EVzB5b1BuNktvN2JULzZ1?=
 =?utf-8?B?ejJ3ZkNFd3JvNTk2R3BPT0I3MmtjOUFvWUNxMWxmOVBKWk1MbEp1SjlOVkps?=
 =?utf-8?B?YytXSTF1aUVVK3RRNUVudUthTTdNYytnTyt1WE0rN3FMclcwNCtQMjRyS0Zv?=
 =?utf-8?B?TGptVXVNTURhSFFLV0J0b1ZXZzQ1dnVPQ3ZzeDhpYkdSbC9GZzlOYTFxY3Rv?=
 =?utf-8?B?VGR6ajlPTlpGK0MrTEVVeEhkZHMyeTFncmRISXYwRlh5MmUrZE56SWhTZ0ZD?=
 =?utf-8?B?SzVSNkt6Wm5hQ1ZDRVlOT2dOcjFSbTlQbDlMc0h4MEI4cXdhR2V6WGFRdXlp?=
 =?utf-8?B?em5YWUcrZnJzTC9ucGltQ1dvN0xDNVVFMFd3R3l6TVM1cWwySlRZNkpVQU83?=
 =?utf-8?B?b0pqRk0wNUM2MEdWQ29xU0FBSXdoL3gydGMxbmdZbDFXVllpZmFBdTU3Ryt0?=
 =?utf-8?Q?FoS1nK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1B5YXFmcDlrYkliQklpVUlGbkZ2T3o1dTh0VE1seklJWk9yS3NKdnE4Znl5?=
 =?utf-8?B?d0VsS213Vi9wMmpBNzVwSmlQaWVKMjMyWnkzSkxqYUtVdWhGUVJHWUdEZ3d3?=
 =?utf-8?B?YXBITUNKd1dEMC82V09jdVBKdWZjQzVlajVYTEtjRFF4clQ3Q2V4b0pHQ0V3?=
 =?utf-8?B?NlFwVk51YWMwUUFDcSsrMGtTazNxYW5ab3VRYnF6VVJlMlJhMDlyKzZWbEFl?=
 =?utf-8?B?bEdYTnRaSmwyait4R1FUSDVBVjduWW1oZDJnd1lQSjVUaGtTa2M5L0hlV2VT?=
 =?utf-8?B?S05OMm45Y05UK3huejBlWWZ5c280MFhPbjZuUzdKQjN3QzYwNzFxOWFraUlD?=
 =?utf-8?B?bDhNRGpCM1NBU01GRDJuTWFRZ1ZyRGM5SjdhNWNBZ3JvN3NtRkRNZnFtOTVD?=
 =?utf-8?B?RGtpNVRUZWFKQmVYaXloZy9UNWpnaGc1TkFPUk1sU2xOWldkQWpsSGk2RVFT?=
 =?utf-8?B?LzFQczltVk12bjZSYVhKM3RqanR1WVhlMXlnQ3lkWGRVcGxQd1VwdkdsMTZB?=
 =?utf-8?B?M0NsSWs3Y0c3ZFlDL0ZWbUpVMXYxTG13TkI5Um1PWWNKRDVQYnFOZkNtU1dO?=
 =?utf-8?B?dW1sVnFxMVlmd0hzYWhzckhGVk9jaFNLV1IvdUdBelhmdHpNMEM5YUNoNjEx?=
 =?utf-8?B?VHFad3QvZFd1NTQ3Q0E2Slhkc3VYVHF6NmVZdDRLbDVDZmY3SDRIVkZMY2Q1?=
 =?utf-8?B?YUpqV3pYMExQSHZpdDRoQ3hUaTczMUE3V1ZhZjdIOVk3YmI4ZFY3T2UyL2Ir?=
 =?utf-8?B?aTZxUU1OOFMxcUE3MGFWa3dNVm9IK3lEUzVUYkUwOFVicHJqKzYxQURkNC8w?=
 =?utf-8?B?bWNvSHN1V1U4dW9oeEI4TW5leEFyVThqR2JmRjNmTi90VGgzV3VMU1B6enlI?=
 =?utf-8?B?TEJmOGlSUHFpMjZRZnVhNWQrbG4xNFBacGloWlk5YU4vdWJ4WGxnd3NkaFor?=
 =?utf-8?B?MGRJYTY0UVRKbGt2dWJwUHhNZ0NveTFwc0w0ekw0dElueldscWc3VkpoMFpT?=
 =?utf-8?B?dHUwT0hWeWlYSXRDdmRVYUpDcUV4MkxWYTArZ1h2MkhKNGlIUC83aU8yb3BF?=
 =?utf-8?B?VS9iVzhzV2owZVlwUVZTbXNDL09Qanh2QW4rR0dKRi9GL3V0YkNlanJMZGU0?=
 =?utf-8?B?dWNrNG1rWnZCMVcxZnQ5NU9LNG96NFJoZytqZW5xU3pIMzVKSjlCMENROG9k?=
 =?utf-8?B?SkNKbXJBYWdaMVpVS1QvL04rODNBalpIdER1RFE0S0duRjVxSXUwRjk4Snds?=
 =?utf-8?B?SkFvN01yeTRvRFBiR1BpR3g2WkFwa1BqVUd4Z1loSWkwT3BSbS9VOFdDZUVS?=
 =?utf-8?B?aFRuaWl5cVBjS29yZDZzdWZOc3VGYXNSWnBNQnZiTHk2SmViZkhHOXl1R0RY?=
 =?utf-8?B?YlZVSE4zcWptekZPTXpmakY2c0ppWExpbG9tYW5XNFViZHd5MTI0NjJvdzdH?=
 =?utf-8?B?cExvQ0Z1eGpKMmpjRU9QRU1UcWZjbVJ1SUFJeGhiWHl6OEF0eTB3SXFFM2hx?=
 =?utf-8?B?NWUrTE0rYVdDbERvdU1pMVZjTHNYeW42OTF0ZjcyRVJETEhFc0NOa3VpcG5a?=
 =?utf-8?B?dHA3UDFETTJlSGR3aU9VTm5Na21BSDV5YkhoV2NPYmJZb0RlWWJPY0xJZWdW?=
 =?utf-8?B?Sjhhc0ZmeWxvNUpvUWs5Mkxwbk0vemxyQkV6REtQT1hxWFBhRXhINFNCOEEx?=
 =?utf-8?B?bktvM2ZLRnEwMytQNnBpWHZ2MU9zOHN3ZDJMdjdXZ3RiV0xSdTU2NFRGUnlw?=
 =?utf-8?B?VlFISUJiY2Z3Y3lqdElpaDRLTUtVOUcyY0ZiUklqTWI4SHZnbWp2a0R0bk1F?=
 =?utf-8?B?ZVVrL0FNOW1EYStDV0VpR01wbmw1RWczRkxYZk5yM2sra0JmSnJOQ0RmTlV5?=
 =?utf-8?B?cjNwcTU0ZmFqcDF3eXlucmdTcnBQWkZoR2hNOGpIcUlIMWhadjdsbnRFc2Q0?=
 =?utf-8?B?c1FIQnA1Lzhvb3BTWlhxaVhJcHhSQ3V2QXFGQ2hIbHMwYnI0cllyMmNCcTVC?=
 =?utf-8?B?c0Y0MDUxQktaWHIxQ0dDZDlQSVBGL0owRnZnd2hSZ3NGaklzb29hYzFSeDIx?=
 =?utf-8?B?OUkyTXFzL0hqdG1TTEJrbHNhcThMcTdSZVorbk1JcWF0RWZnK25zbXdoYW80?=
 =?utf-8?B?dnRiNmlpVWthMDl6U3BPWnlXa0xGVUNJaTlEWkpWSldzQmRyOVJpaS9WT1dI?=
 =?utf-8?B?bWtPbGZqT2tWN1RwQUFNekNyNDJ4NzJTLzE3a2JPUzJIbTVMTjNnQ1FRSVd1?=
 =?utf-8?B?dU9MenFYdFNwdXY0N0NnTkJHdjRwSWgwSTZIZ0t0bEVSU09BaFhQaXUwUUdt?=
 =?utf-8?B?cmxKaVJxQ1NhckJDdkZJMnFaRUl0L1lUSkNxdzU4a3RTY29OVHFqdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4570d961-fca4-4a8e-339c-08de4e167d53
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2026 17:59:23.1556 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2jQBux33O9W3BKTcqK/sh34BpCwTtuXClmjfb5HMbgLY8ZLqNHLoiPQJ6vzSNL0HOr6E1xERmHAVw2/fKrIQdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8065
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

TEdUTQ0KUmV2aWV3ZWQtYnk6IFpoYW5qdW4gRG9uZyA8emhhbmp1bi5kb25nQGludGVsLmNvbT4N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBOaWt1bGEsIEphbmkgPGph
bmkubmlrdWxhQGludGVsLmNvbT4NCj4gU2VudDogSmFudWFyeSA3LCAyMDI2IDEwOjU0IEFNDQo+
IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IE5pa3VsYSwgSmFuaSA8
amFuaS5uaWt1bGFAaW50ZWwuY29tPjsgRG9uZywgWmhhbmp1bg0KPiA8emhhbmp1bi5kb25nQGlu
dGVsLmNvbT47IEZpbGlwY2h1aywgSnVsaWEgPGp1bGlhLmZpbGlwY2h1a0BpbnRlbC5jb20+OyBE
aXhpdCwNCj4gQXNodXRvc2ggPGFzaHV0b3NoLmRpeGl0QGludGVsLmNvbT4NCj4gU3ViamVjdDog
W1BBVENIIDEvNV0gZHJtL3hlL2d1YzogZml4IHN0cnVjdCBndWNfbGZkX2ZpbGVfaGVhZGVyIGtl
cm5lbC1kb2MNCj4gDQo+IEZpeCBrZXJuZWwtZG9jIHdhcm5pbmdzIG9uIHN0cnVjdCBndWNfbGZk
X2ZpbGVfaGVhZGVyOg0KPiANCj4gV2FybmluZzogLi4vZHJpdmVycy9ncHUvZHJtL3hlL2FiaS9n
dWNfbGZkX2FiaS5oOjE2OCBleHBlY3RpbmcgcHJvdG90eXBlDQo+ICAgZm9yIHN0cnVjdCBndWNf
bG9nZmlsZV9oZWFkZXIuIFByb3RvdHlwZSB3YXMgZm9yIHN0cnVjdA0KPiAgIGd1Y19sZmRfZmls
ZV9oZWFkZXIgaW5zdGVhZA0KPiANCj4gRml4ZXM6IDdlZWIwZTU0MDhiZCAoImRybS94ZS9ndWM6
IEFkZCBMRkQgcmVsYXRlZCBhYmkgZGVmaW5pdGlvbnMiKQ0KPiBDYzogWmhhbmp1biBEb25nIDx6
aGFuanVuLmRvbmdAaW50ZWwuY29tPg0KPiBDYzogSnVsaWEgRmlsaXBjaHVrIDxqdWxpYS5maWxp
cGNodWtAaW50ZWwuY29tPg0KPiBDYzogQXNodXRvc2ggRGl4aXQgPGFzaHV0b3NoLmRpeGl0QGlu
dGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVs
LmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUvYWJpL2d1Y19sZmRfYWJpLmggfCA1
ICsrLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9hYmkvZ3VjX2xmZF9hYmku
aA0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS9hYmkvZ3VjX2xmZF9hYmkuaA0KPiBpbmRleCBiNmVk
MjBkNWI1MDguLjVjNDg0NTlmMzY1ZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L2FiaS9ndWNfbGZkX2FiaS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9hYmkvZ3VjX2xm
ZF9hYmkuaA0KPiBAQCAtMTQ4LDcgKzE0OCw3IEBAIHN0cnVjdCBndWNfbGZkX2RhdGFfb3NfaW5m
byB7DQo+ICB9IF9fcGFja2VkOw0KPiANCj4gIC8qKg0KPiAtICogc3RydWN0IGd1Y19sb2dmaWxl
X2hlYWRlciAtIEhlYWRlciBvZiBHdUMgTG9nIFN0cmVhbWluZy1MRkQtRmlsZSBGb3JtYXQuDQo+
ICsgKiBzdHJ1Y3QgZ3VjX2xmZF9maWxlX2hlYWRlciAtIEhlYWRlciBvZiBHdUMgTG9nIFN0cmVh
bWluZy1MRkQtRmlsZSBGb3JtYXQuDQo+ICAgKiBUaGlzIHN0cnVjdHVyZSBlbmNhcHN1bGF0ZXMg
dGhlIGxheW91dCBvZiB0aGUgZ3VjLWxvZy1maWxlIGZvcm1hdA0KPiAgICovDQo+ICBzdHJ1Y3Qg
Z3VjX2xmZF9maWxlX2hlYWRlciB7DQo+IEBAIC0xNjMsOCArMTYzLDcgQEAgc3RydWN0IGd1Y19s
ZmRfZmlsZV9oZWFkZXIgew0KPiAgI2RlZmluZSBHVUNfTEZEX0ZJTEVfSEVBREVSX1ZFUlNJT05f
TUFTS19NQUpPUglHRU5NQVNLKDMxLA0KPiAxNikNCj4gICNkZWZpbmUgR1VDX0xGRF9GSUxFX0hF
QURFUl9WRVJTSU9OX01BU0tfTUlOT1IJR0VOTUFTSygxNSwNCj4gMCkNCj4gDQo+IC0JLyoqIEBz
dHJlYW06IEEgc3RyZWFtIG9mIG9uZSBvciBtb3JlIGd1Y19sZmRfZGF0YSBMRkQgYmxvY2tzDQo+
IC0JICovDQo+ICsJLyoqIEBzdHJlYW06IEEgc3RyZWFtIG9mIG9uZSBvciBtb3JlIGd1Y19sZmRf
ZGF0YSBMRkQgYmxvY2tzICovDQo+ICAJdTMyIHN0cmVhbVtdOw0KPiAgfSBfX3BhY2tlZDsNCj4g
DQo+IC0tDQo+IDIuNDcuMw0KDQo=
