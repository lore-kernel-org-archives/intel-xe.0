Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CA8606A333
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 10:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QtGgQ93G
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF0210FA81;
	Wed, 11 Nov 2026 10:31:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3417F10FA81
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 10:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794393086; x=1825929086;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=gI1fqzwdO2K636Ux+RLE1kFy59ybgZ4Ue8bseEEHc+g=;
 b=QtGgQ93GEOPL5UNkt4O4pDL8sJ9CFE9TkBgbx0XqeRJIKblb31d5TyZr
 bgvDpURjjgm6AJRZ94om6Xrop9RcYboUL7ZHxOPKzDNhIPqqVhwDQpO46
 n4fSJQiSe4fk4/2qC8yUaOOKT5YcsI4dj+Yx9vpnfq88fATCNW95V8mLS
 bcUdaFSzQ2i9qurXKruWwQ8ticEKbN8gFUt+cbbISZhryQNmdN/3Z510W
 vdb4KsJaEnwtmanw0ZmmFJsN/DuJGAkL+grLHddIYjoGeFRdvOJ/qMYKj
 9+5OrEyGQpcLP6QNeCcRba5NVrGSuaIH8tmo/ahuhtmiAJZPW2tj0gLwB g==;
X-CSE-ConnectionGUID: bK/hqYWYTf6a2uQfk5EjMQ==
X-CSE-MsgGUID: ThKgyBkhSZW73i91Wd75RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3205551"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; d="scan'208,217";a="3205551"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 02:31:25 -0800
X-CSE-ConnectionGUID: DkiJ6yVGTe6gdkDRGJPuig==
X-CSE-MsgGUID: Ef5pO0j0TK+2kyj8dPfHQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; d="scan'208,217";a="8308372"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 02:31:25 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 02:31:24 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 02:31:24 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 02:31:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMdnzokaxa3VLLCWWdE5nmrRiFA0PeWIMl2HEmjEsm7H+fXGRs7J6Yv1gPxwVx0zk9HYfrPPt2Zthk9vaeKDE+irfgdQ1/U4esK/1gMb/RmgtCmDxuoy65pk7tmCdERDEQI2ESAtST5BXk4LM7mfXOxhYnpTdZ+/vu3Q4MLGqFc3dLh7O2DcZVF3/8TRkNT5zW2p0/kf0pi/ndyReWhteI/pC7VbVuvOekv0JABOKPBsukWrkO8w1al2JnAkzWXU33NWdAxqVg8svgxUXTrZyb2EGPv2vvC20U4yk8Ukr5sXSkrhCY4TTJG4TmXqJAs5VtmsuavBsViSpSFE2yDH4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kNyswIbIFS2hnRbYLxq89NuwjR5bJlGK1Wcv1ogWm+w=;
 b=nh9j69b438lUh2eaTYud946qegzX9D1uILxN7HAxVI1CCn7vFQidr9aTe3phQmREKrmp0k9nxWYCFf57OCj5i14HHue3gzjX4lKmk8MElTJhpckJ8SEqEFnDDnBv9cuoitgNY6gu3O7P+79saj7kbC+0fwCE54rEq/5QeOVB8dV4FqtLuUVkKrEDnY62g28PekgqiSW2K2pB9KPXWujwKRV/87G2niE2WxUPIKZiDEUkyccjQKXNXFhpmrHyBMFOOWN1e3F6ChWo3KPWaqtM8ebteRIHYjGReAXcDDqRlipnYlJbSQEMr/TZ8urY+iXLNA/b49NNsmd1AKYGOosI8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by DM4PR11MB6215.namprd11.prod.outlook.com (2603:10b6:8:a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 10:31:21 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 10:31:21 +0000
Content-Type: multipart/alternative;
 boundary="------------p2yAAipt4TNDUfRDH6FYwnLK"
Message-ID: <b1d61531-691f-47a2-ab19-2a4777865e76@intel.com>
Date: Wed, 11 Nov 2026 16:01:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] drm/xe/cper: Prepare CPER headers for software
 errors
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <jani.nikula@linux.intel.com>
References: <20261105085348.1467925-8-mallesh.koujalagi@intel.com>
 <20261105085348.1467925-10-mallesh.koujalagi@intel.com>
 <3739228e-2de9-4e83-a676-e4d41d9fe41c@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <3739228e-2de9-4e83-a676-e4d41d9fe41c@intel.com>
X-ClientProxiedBy: MA5P287CA0149.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::19) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|DM4PR11MB6215:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e550d5f-0df2-40a0-9fc8-08df3fdeed39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|8096899003|261021121427099003|261026121527099003|261028144727099003|261026140227099003|261102123227099003|261009223027099003|261009221227099003|261022113327099003|261022105027099003|261021123027099003|261022075727099003|10067099003|11063799006|4143699003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: f4/ewlKHOsoy4j1QpAhO/uNyZfQghFt6konUhK2OgjIl9+FmB5TkscCa46HpBl2g3swkJWsSKKaNtVoCqynvDOpMo+Tu+wGdnv3F2Tu9o/1l8OrzNErC26vA2kRJiJOCe+IQBc/dhVCdFCRUAc/L4Zu/liBcIbzg7ooq3AxV32v6jFQzYwFnwsdeZXYMTXVj/g7YS2wF+HEFPH3rKOmIMUOoEKVKztPHfZeodJz19utjKOkuc6znaDjfRXBdkvGlYrgBZctqSSPIr3KGoenRVuUmFuWcYBpFBT+N11rFoS7lahmkZcU0LEgRfM5g5QYm6S36TbLFmpTwIyczZAdZizxI7LYRzFYI4xJwKlhMGJO4odAmXEvFf5eJchRXGty+3OtujmQ6t9nZdZfYhcCc+Z7r5V/Kr/muUD0HdDcB3MoNfPG9Xv4gkLZ4R6a3bQV4/67U6vPATrpMkFO5WrdS+WW5hacC8nV+7qMoo07yR6sH1AmnPzBnkeqsML7jIou7ebVZNAUIPmGg1Nhu26L+JXR7+bqx0QhIODda25vQvzXpdy6WfBfbCd+TrvaYcgOT2wsKGWqKv1owgqOnZ9X9Tu0fLCVg0IFQBeANttvqDhQ4WIAWIp9Mg/WzAzJRhsTrIILgI+VKBHFj+JAg/V/KjNyMjkuDyPESOiD8fF9E8eY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(8096899003)(261021121427099003)(261026121527099003)(261028144727099003)(261026140227099003)(261102123227099003)(261009223027099003)(261009221227099003)(261022113327099003)(261022105027099003)(261021123027099003)(261022075727099003)(10067099003)(11063799006)(4143699003)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0NyRTJjc1BKNjNZMkJyR3FYdzFNREUzdGhnR0NXbW9Lb3lhWWg4NWRmd1Fq?=
 =?utf-8?B?L2RJQXNZM0ZTOWNEWi9tNGU3d0RuNitUYmgrY2hmdFFwQkcwUkNyTjVpUjJk?=
 =?utf-8?B?UjB4QU5ucDlMMEoyVExlNmY5L1ptNGprT0l6cmRNMTJ3d3p4L0x2eExmSGJM?=
 =?utf-8?B?bW5kRjBNMlBQREtEZ1U0VVpFdHdhUm5lbWZvRFVTOGpGU0dJU0hzOTV0VFNv?=
 =?utf-8?B?eW5HeUszQ3pWK1pldzJiR2c2NkozWmJQT2Zaa2Q3OVNkT2tXSDkyZEZrMmF4?=
 =?utf-8?B?MDNIdDA4SUd3bDRDN051eGtoeXMwUXd4UStJd2tqd1dmemtZOW94SXFXTWYz?=
 =?utf-8?B?UXVCam1SVWpzRzNkNG5TWTI5cFFoK0ZjcktCWVJlM0JBK2lQdzBnYnQ2OXdq?=
 =?utf-8?B?NzNDbDlsOVJMK0IycnF5TjUxNG1ma0d1eEFSaEswTGlxSG1kZGRQNzNRV3cx?=
 =?utf-8?B?OEhCUFNxMysyTFR5WUxldHZpNWxkNHJmaHdpTFM4TFBBVkFRSGRYdTA3SVR4?=
 =?utf-8?B?WkxKRGJFWjk5VElPUjVOc0RBSFBGTEdxN2JHR1NzN3k0Y0t3d1B1OU1pbGUy?=
 =?utf-8?B?Z051WHFHbGU2dWdNWHZFdUJnWVdXOVZ5Qlh3M3pkeW80VFQ0WnFlRStDeDNJ?=
 =?utf-8?B?NkRXdzR2L1J0aEk1WldManlkTGgwb0NqMnYzcGg3K1dRdVJ5ZW9oQXVZVG4v?=
 =?utf-8?B?QzNVay81SmNTVG9zZFlnU016NWhWQlp4bEdRVUtxOUZrYWo0MVdtQlVveFU4?=
 =?utf-8?B?T1R6dkhybzhCdCtNaXE5cTJCdGh3N2g4dWFYdW1TbkhHa1pMTjJGU0hjVDRt?=
 =?utf-8?B?R3k4cWx2TEthQ2J1V0pwMnpJZ3FObnZBdW5HcnJ1dG1WZnNYeHRiM1Z5TlJQ?=
 =?utf-8?B?VTh3dDlwY1NHYiszenFXeElXTVZXRUJ6Rm9BK2tpMk9qN0FxNmdONTdVdDM4?=
 =?utf-8?B?eEVKRGY3WThwSlZSNmZaWThGa3VJUGx3MDlqT0YrOWdXekdCSVJCMXhvR0dJ?=
 =?utf-8?B?TVpJNGJJZm5yK0ZZRVVuMHRxQVRiNU9laWJoSk93QjhHeFo2MnhkQVUrbXBo?=
 =?utf-8?B?YmYwVXIrVnpnMEFBNmNXUUhiYVZ3TGh0ZCtIZ0U1T2lGSEpIK04xTHhRdFl2?=
 =?utf-8?B?R3E4eG05bTRUSGVjY1V0QnBSbWwrNjkrTTErbVlCZUtpUzNSVFpUdXhCbFhp?=
 =?utf-8?B?aWFNR1BkYVpGK3lDejhLN3pPRmFCT1d0Zjhrek0rOVNhdmRtTUtTOVhRQ25k?=
 =?utf-8?B?ZnI0REhqK0Jrb1RlY0lxc1p3VEptSVh6enVsYWJZb3VRZjhvRUZKbVpFMFNu?=
 =?utf-8?B?UmVmOXlKeXl4M0JKczAyQlhZRnZUNWV3VVQ0aWJVTVl4dzJDcDMvazU0VzJl?=
 =?utf-8?B?VFF2N1IyUGtIcTZCZ2xjQmZLUWpEYW9tQ25MWjJxcEJrd011Z1plcVdnSVAx?=
 =?utf-8?B?YnRqUnVaU1dhOTBkK3VFVlRYZFlkQmswWHRUZVVlNkRKSDlXM0VQemt5Wkdr?=
 =?utf-8?B?aC81b1ZtbmJWYmZmbkJwVXdZRVZnY1YvZTlPM1pIa3pkNEQzbkVNd2d3VEZS?=
 =?utf-8?B?V2R6R0IwdmZ4MmthZW9WcUsxQlhpZ0Vlb1VuVWtvUU0xUCtzOU9TTml4NUpH?=
 =?utf-8?B?WXQwVXYzTmhvSmNrM1RyRDNtZGJ3bWtRYkYvR2sxa2EyYTk0dnRIMit3bHpt?=
 =?utf-8?B?NWZ0b2kxYm01cG4yM2dqTGt4R3pPQ2VWRjZrSTRuUE0xMTZhaWlxdGkxN3k1?=
 =?utf-8?B?aEQ0bkZ5Y2RtdGVsblN1TjlnN3VpS1NoTUJOeDZ0U3Y2N09pZDBZY0tPQlVh?=
 =?utf-8?B?bVpOcUIrQ0VxblNJckRrdFBKT28xTE1vb0IyellNNmVIMTFkTFEzNHRjaGUw?=
 =?utf-8?B?ZEcvSG1JRVBwQ1RlUVhiNmdZT0l4WDIrRTFVd2p3bWNlSmtpS1M5ZHphbzA5?=
 =?utf-8?B?TXBWWks5dTA2SDhReVZSWGZndG5iOFZwVUZMRWZ1MDhtQXNzMXkwRS9lblZz?=
 =?utf-8?B?ZFFqdGFRR0Z5ZnQxSDRocktsT1RqNEIyem9DZ1lQTE4zbFVrS0ZoQ2ZzSzRL?=
 =?utf-8?B?d0w0cnJDYUtpUGtDMGEycUJYdmR5cmRwaWl1ckd4V3FqQjVrSlpncVBsUC9G?=
 =?utf-8?B?amFacURvMHExc21jWWtVNFYzRTB3TkhTaWZOZnp5bDNMdlBIZ3ZGdEFYclZk?=
 =?utf-8?B?Tk5rSTJadnpVQjBGQTdrZDhhcGcxN2VHd0J3d1h1ZWl2Yk9XUzkwZExlZG93?=
 =?utf-8?B?czJaMDF3SjdDVDNCVHIvU3duNDl0SDhGbldKc1JoeEJWT2dTdUhEVEhrekRn?=
 =?utf-8?B?TVZKcjhpZXlwY1g5ODIxTVY3YktGcWVvVUdPd3ZudXVWeUZLMXhobHF1SWkv?=
 =?utf-8?Q?yTf3kbCDcguGJ5Pw=3D?=
X-Exchange-RoutingPolicyChecked: jNSp++yfP1VzThSeOll/BTVdhNSvjp6YM+svT692bLdW4eEGwltxMm3KOl4dr7ChqPyEH3oPDdLrgTC8f8E8DS5HJxY41+WUYdR/oUQsRdK1h5bNos3E1JtqMwlSPvVk3MmEOYqOJzR1Y1anpxc3S1mA2wNDvCMTHpbYcNMHGjdyGxY0/8N3LMP+SjzRnW8ZC3aU/0dukma4Iwo+D0iTeRvkEsYBI06S0WaqRHtLjCsvf89aQ2mnGy8wBbUS7oAMPYeAZ/Vj02yIYjajW+pS7ysGrTNNlaIRfI83yWo0JL2j95OQ3KhxnMAXTUz8SYmGnSbokgzgZ1Ltq6tttAg4jg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e550d5f-0df2-40a0-9fc8-08df3fdeed39
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 10:31:20.9332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RvuruIhPG1ltBsXax0752VTpbjercqK0wypYu2lXZAZ1QD2S/T73Osb7NJ58FhHR9h1nb3xvYS5qBkzzUo5Uf4O/DXGT70s9Ct3e3IEltug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6215
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------p2yAAipt4TNDUfRDH6FYwnLK
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 10-11-2026 07:25 pm, Nilawar, Badal wrote:
>
>
> On 05-11-2026 14:23, Mallesh Koujalagi wrote:
>> Add software error classification support and reuse the
>> common CPER header initialization path.
>>
>> Populate software error metadata without emitting a CPER
>> record yet.
> No need of this statement. First statement already covers the change. 
Ok
>> Cc: Badal Nilawar<badal.nilawar@intel.com>
>> Signed-off-by: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
>> ---
>> v2:
>> - Move union inside xe_cper_intel_hdr structure. (Badal)
>>
>> v3:
>> - Introduce structure where it's used. (Badal)
>> - Move error-class union inside cper_init_intel_hdr. (Badal)
>> ---
>>   drivers/gpu/drm/xe/xe_cper.c       | 21 +++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_cper_types.h | 32 ++++++++++++++++++++++++++++--
>>   2 files changed, 48 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
>> index db3513c59834..10aa10bbf282 100644
>> --- a/drivers/gpu/drm/xe/xe_cper.c
>> +++ b/drivers/gpu/drm/xe/xe_cper.c
>> @@ -14,6 +14,8 @@
>>   #include <linux/time.h>
>>   #include <linux/timekeeping.h>
>>   
>> +#include "abi/xe_log_abi.h"
>> +
>>   #include "xe_cper.h"
>>   #include "xe_cper_types.h"
>>   #include "xe_device.h"
>> @@ -92,11 +94,11 @@ static u64 cper_timestamp_now(void)
>>   	return ts;
>>   }
>>   
>> -static void cper_init_intel_hdr(struct xe_device *xe, const struct xe_ras_error_class *counter,
>> +static void cper_init_intel_hdr(struct xe_device *xe, const union xe_cper_error_class *error_class,
>>   				u64 first_timestamp, u32 sig_id, u32 error_count,
>>   				struct xe_cper_intel_hdr *ihdr)
>>   {
>> -	ihdr->counter = *counter;
>> +	ihdr->error_class = *error_class;
>>   	ihdr->validation_bits |= XE_CPER_VALID_LOCATION;
>>   	ihdr->sig_id = U32_MAX;
>>   
>> @@ -219,11 +221,12 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
>>   			  const struct xe_ras_error_class *counter,
>>   			  const struct xe_ras_get_counter_response *response)
>>   {
>> +	union xe_cper_error_class error_class = { .counter = *counter };
>>   	struct xe_cper_intel_hdr ihdr = {};
>>   
>>   	xe_assert(xe, is_hw_sigid(sigid));
>>   
>> -	cper_init_intel_hdr(xe, counter, response->timestamp,
>> +	cper_init_intel_hdr(xe, &error_class, response->timestamp,
>>   			    sigid, response->value, &ihdr);
>>   	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr, NULL, 0);
>>   }
>> @@ -249,6 +252,18 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>>   			     u32 component, u32 location, const void *data,
>>   			     struct va_format *vaf)
>>   {
>> +	union xe_cper_error_class error_class = {};
>> +	struct xe_cper_intel_hdr ihdr = {};
>> +	struct xe_cper_driver_error_class *driver = &error_class.driver;
>> +	u64 timestamp = ktime_get_boottime_ns();
>
> Why not ktime_get_real_ns? Also, for readability, initialize it later.
>
Sure!  will update next revision with that.
>
>> +
>> +	driver->error_type = cper_sev;
>> +	driver->error_component = component;
>> +	driver->tile = location;
>> +	if (IS_ERR(data))
>> +		driver->cause = -PTR_ERR(data);
>> +
>> +	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, &ihdr);
>>   }
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
>> index 68e30df0440e..d8581992dc45 100644
>> --- a/drivers/gpu/drm/xe/xe_cper_types.h
>> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
>> @@ -45,6 +45,29 @@
>>   	GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
>>   		  0x80, 0x28, 0xb9, 0xb1, 0x3e, 0x6d, 0x58, 0xb0)
>>   
>> +/**
>> + * struct xe_cper_driver_error_class - Intel GPU CPER driver-detected error classification
>> + */
>> +struct xe_cper_driver_error_class {
>> +	/** @error_type: CPER severity: CPER_SEV_* */
>> +	u8  error_type;
>> +	/** @reserved0: Reserved, must be zero */
>> +	u8  reserved0;
>> +	/** @error_component: Driver component id: CLASS[7:0].TYPE[15:8] */
>> +	u16 error_component;
>> +	/** @tile: Driver location id: TYPE[7:0].ID[15:8] ('tile' and 'GT' field region) */
>> +	u16 tile;
>> +	/** @reserved1: Reserved, must be zero */
>> +	u16 reserved1;
>> +	/** @cause: errno of the failing operation, or 0 if none */
>> +	u32 cause;
>> +};
>> +
>> +/* Same size as the counter-sourced error_class */
>> +#define XE_CPER_ERROR_CLASS_SIZE	12
>> +
>> +static_assert(sizeof(struct xe_cper_driver_error_class) == XE_CPER_ERROR_CLASS_SIZE);
>> +
>>   /**
>>    * struct xe_cper_intel_hdr - Intel-specific CPER header
>>    *
>> @@ -52,8 +75,13 @@
>>    * All multi-byte fields are little-endian.
>>    */
>>   struct xe_cper_intel_hdr {
>> -	/** @counter: Error class (severity, component, location, cause) */
>> -	struct xe_ras_error_class counter;
>> +	/** @error_class: Counter-sourced or driver-detected error classification */
> This seems redundant. Otherwise  /** @error_class: Error 
> classification */ is sufficient.
Make sense!
>> +	union xe_cper_error_class {
>> +		/** @error_class.counter: Counter-sourced error classification */
>
> Keep the original doc.
>
Ok. I'll change to /** @error_class.counter: Error class (severity, 
component, location, cause) */ in next revision.


Thanks,

-/Mallesh

> Thanks,
> Badal
>
>> +		struct xe_ras_error_class counter;
>> +		/** @error_class.driver: Driver-detected error classification */
>> +		struct xe_cper_driver_error_class driver;
>> +	} error_class;
>>   	/** @first_timestamp: First occurrence of this error class, in ticks */
>>   	u64 first_timestamp;
>>   	/** @sig_id: Aggregated error class SIG ID; set to U32_MAX if unknown */
--------------p2yAAipt4TNDUfRDH6FYwnLK
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10-11-2026 07:25 pm, Nilawar, Badal
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:3739228e-2de9-4e83-a676-e4d41d9fe41c@intel.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 05-11-2026 14:23, Mallesh
        Koujalagi wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20261105085348.1467925-10-mallesh.koujalagi@intel.com">
        <pre wrap="" class="moz-quote-pre">Add software error classification support and reuse the
common CPER header initialization path.

Populate software error metadata without emitting a CPER
record yet.</pre>
      </blockquote>
      No need of this statement. First statement already covers the
      change.&nbsp; &nbsp;</blockquote>
    Ok
    <blockquote type="cite" cite="mid:3739228e-2de9-4e83-a676-e4d41d9fe41c@intel.com">
      <blockquote type="cite" cite="mid:20261105085348.1467925-10-mallesh.koujalagi@intel.com">
        <pre wrap="" class="moz-quote-pre">Cc: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com" moz-do-not-send="true">&lt;badal.nilawar@intel.com&gt;</a>
Signed-off-by: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com" moz-do-not-send="true">&lt;mallesh.koujalagi@intel.com&gt;</a>
---
v2:
- Move union inside xe_cper_intel_hdr structure. (Badal)

v3:
- Introduce structure where it's used. (Badal)
- Move error-class union inside cper_init_intel_hdr. (Badal)
---
 drivers/gpu/drm/xe/xe_cper.c       | 21 +++++++++++++++++---
 drivers/gpu/drm/xe/xe_cper_types.h | 32 ++++++++++++++++++++++++++++--
 2 files changed, 48 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index db3513c59834..10aa10bbf282 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -14,6 +14,8 @@
 #include &lt;linux/time.h&gt;
 #include &lt;linux/timekeeping.h&gt;
 
+#include &quot;abi/xe_log_abi.h&quot;
+
 #include &quot;xe_cper.h&quot;
 #include &quot;xe_cper_types.h&quot;
 #include &quot;xe_device.h&quot;
@@ -92,11 +94,11 @@ static u64 cper_timestamp_now(void)
 	return ts;
 }
 
-static void cper_init_intel_hdr(struct xe_device *xe, const struct xe_ras_error_class *counter,
+static void cper_init_intel_hdr(struct xe_device *xe, const union xe_cper_error_class *error_class,
 				u64 first_timestamp, u32 sig_id, u32 error_count,
 				struct xe_cper_intel_hdr *ihdr)
 {
-	ihdr-&gt;counter = *counter;
+	ihdr-&gt;error_class = *error_class;
 	ihdr-&gt;validation_bits |= XE_CPER_VALID_LOCATION;
 	ihdr-&gt;sig_id = U32_MAX;
 
@@ -219,11 +221,12 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
 			  const struct xe_ras_error_class *counter,
 			  const struct xe_ras_get_counter_response *response)
 {
+	union xe_cper_error_class error_class = { .counter = *counter };
 	struct xe_cper_intel_hdr ihdr = {};
 
 	xe_assert(xe, is_hw_sigid(sigid));
 
-	cper_init_intel_hdr(xe, counter, response-&gt;timestamp,
+	cper_init_intel_hdr(xe, &amp;error_class, response-&gt;timestamp,
 			    sigid, response-&gt;value, &amp;ihdr);
 	cper_record_emit(xe, cper_sev, &amp;INTEL_CPER_NOTIFY_GPU_ERROR, &amp;ihdr, NULL, 0);
 }
@@ -249,6 +252,18 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 			     u32 component, u32 location, const void *data,
 			     struct va_format *vaf)
 {
+	union xe_cper_error_class error_class = {};
+	struct xe_cper_intel_hdr ihdr = {};
+	struct xe_cper_driver_error_class *driver = &amp;error_class.driver;
+	u64 timestamp = ktime_get_boottime_ns();</pre>
      </blockquote>
      <p>Why not ktime_get_real_ns? Also, for readability, initialize it
        later.</p>
    </blockquote>
    Sure!&nbsp; will update next revision with that.
    <blockquote type="cite" cite="mid:3739228e-2de9-4e83-a676-e4d41d9fe41c@intel.com">
      <p>
        <style>@scope { a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
} }</style></p>
      <blockquote type="cite" cite="mid:20261105085348.1467925-10-mallesh.koujalagi@intel.com">
        <pre wrap="" class="moz-quote-pre">+
+	driver-&gt;error_type = cper_sev;
+	driver-&gt;error_component = component;
+	driver-&gt;tile = location;
+	if (IS_ERR(data))
+		driver-&gt;cause = -PTR_ERR(data);
+
+	cper_init_intel_hdr(xe, &amp;error_class, timestamp, sigid, 1, &amp;ihdr);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
index 68e30df0440e..d8581992dc45 100644
--- a/drivers/gpu/drm/xe/xe_cper_types.h
+++ b/drivers/gpu/drm/xe/xe_cper_types.h
@@ -45,6 +45,29 @@
 	GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
 		  0x80, 0x28, 0xb9, 0xb1, 0x3e, 0x6d, 0x58, 0xb0)
 
+/**
+ * struct xe_cper_driver_error_class - Intel GPU CPER driver-detected error classification
+ */
+struct xe_cper_driver_error_class {
+	/** @error_type: CPER severity: CPER_SEV_* */
+	u8  error_type;
+	/** @reserved0: Reserved, must be zero */
+	u8  reserved0;
+	/** @error_component: Driver component id: CLASS[7:0].TYPE[15:8] */
+	u16 error_component;
+	/** @tile: Driver location id: TYPE[7:0].ID[15:8] ('tile' and 'GT' field region) */
+	u16 tile;
+	/** @reserved1: Reserved, must be zero */
+	u16 reserved1;
+	/** @cause: errno of the failing operation, or 0 if none */
+	u32 cause;
+};
+
+/* Same size as the counter-sourced error_class */
+#define XE_CPER_ERROR_CLASS_SIZE	12
+
+static_assert(sizeof(struct xe_cper_driver_error_class) == XE_CPER_ERROR_CLASS_SIZE);
+
 /**
  * struct xe_cper_intel_hdr - Intel-specific CPER header
  *
@@ -52,8 +75,13 @@
  * All multi-byte fields are little-endian.
  */
 struct xe_cper_intel_hdr {
-	/** @counter: Error class (severity, component, location, cause) */
-	struct xe_ras_error_class counter;
+	/** @error_class: Counter-sourced or driver-detected error classification */</pre>
      </blockquote>
      This seems redundant. Otherwise&nbsp; /** @error_class: Error
      classification */ is sufficient.</blockquote>
    Make sense!
    <blockquote type="cite" cite="mid:3739228e-2de9-4e83-a676-e4d41d9fe41c@intel.com">
      <blockquote type="cite" cite="mid:20261105085348.1467925-10-mallesh.koujalagi@intel.com">
        <pre wrap="" class="moz-quote-pre">+	union xe_cper_error_class {
+		/** @error_class.counter: Counter-sourced error classification */</pre>
      </blockquote>
      <p>Keep the original doc.</p>
    </blockquote>
    <p>Ok. I'll change to&nbsp;<span data-teams="true">/**
        @error_class.counter: Error class (severity, component,
        location, cause) */ in next revision.</span></p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>-/Mallesh</p>
    <blockquote type="cite" cite="mid:3739228e-2de9-4e83-a676-e4d41d9fe41c@intel.com">
      <p>Thanks,<br>
        Badal</p>
      <blockquote type="cite" cite="mid:20261105085348.1467925-10-mallesh.koujalagi@intel.com">
        <pre wrap="" class="moz-quote-pre">+		struct xe_ras_error_class counter;
+		/** @error_class.driver: Driver-detected error classification */
+		struct xe_cper_driver_error_class driver;
+	} error_class;
 	/** @first_timestamp: First occurrence of this error class, in ticks */
 	u64 first_timestamp;
 	/** @sig_id: Aggregated error class SIG ID; set to U32_MAX if unknown */
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------p2yAAipt4TNDUfRDH6FYwnLK--
