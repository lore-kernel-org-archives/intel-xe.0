Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC0C606A325
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 13:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bRBXgP4v
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF58110E03E;
	Tue, 10 Nov 2026 13:50:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D51E10E03E
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 13:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794318605; x=1825854605;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bGWMG9wooE25Fn6Y40hXASSuMEjJawhX9bNmfzLsS2c=;
 b=bRBXgP4vum9wT0NGekSleyOhEHk5kNdN5bozqYx07iCGcw/kCnwF3X5k
 duzra9vV5ip7RP77HVzf/bD8J4xy4aMlBqZ5Yu4FicRIn6gEMcGUqkBJN
 ++IXx1/2i1Lqo17tt2sjd200LD32YHrMWmBYovSHHUBM2q7f5mfdtd8lE
 KbR8l9k8XgagYFiMpYiw92IjzfiPCHUyz1Dx9wMS58/b49hwRptZvWU7l
 g7v9+3p4Vk1aKqgvxAdHJFPNmZd7WvC+xV2uS9KO7cAmvp3PaCDj++y0Z
 RwFdI+jFae73/EFcicqirc3A+tnVa+RiZeCN2n2YY4zs4ty4XPK1IEPoZ Q==;
X-CSE-ConnectionGUID: dsagQnS4TretoDoqrkkveg==
X-CSE-MsgGUID: 2XNJmAPQRc+pqnWkWwNyZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2950914"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2950914"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 05:50:04 -0800
X-CSE-ConnectionGUID: 06wnlCs0TVyMexjKxNbjXQ==
X-CSE-MsgGUID: WyFYaTg8TfGgGa+vjH523A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8298595"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 05:50:02 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 05:50:01 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 05:50:01 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.63) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 05:50:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9PvyEHel2IPQ7t9R+6MN2Nt6Yn+D2v6/EI2S7Fd+sH2c42a21goGHu+w1rrghepwCJLhGNuXMS2opvrBzUi7DAdmSK6TA/KGYMvJMwRUKauSi4Gp+5O+/0xfL4LZ/rMwzSyFKcmhl1MJ7B5+mITcKUuVwj9LQcX96PMCqs1AvF+VAxpXjh3LVdY9ibQTz26o41pmJ1Fl/R4Ed4jImP9vicyBkYFy19irQh+aXhjntnOs3OOuyMxl7h8QJ6mC9nYeEIjub8M+Ofb2sc2PaNjhZIbsyhcqGlz01Lgv8IE6x3h4/5K/U2HwUYOWP+00IOak/0aJ/uiMpeNS+NrW5CPSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6AVajI8/dyk31R4tSQOGzYsOV1t+9V9WnwmqnLr3z/I=;
 b=q8BRHEafD2zCkj9lgT6eatPSoXuvcFRooa+lTScJCG8wlKwKBaseL/huxW1L9lVCI8BfRQVN8u0ePdRtzNp/OJWUP2vo27w92HRM8j7cagg0HxuIlDKFP0X4BDjihe6fc/ygyKisDGc+RDEYW7Rvxa+u8B1Cc2myZZeqh61GrWo5iy2r5FUeSgX+2YtMEwBxa7NACms3dZwMllD7Un01CY5WcqNGMFTZTED+9EmVmcgaGn5oKZBq8PpDL3PWthfB3isB7hOMEEvCZN2UcI+Wihr5Wu9YGmN5ZgMYtuPXSSJDxMHipdh9q9OeISRkq+58PGKbU0wbtkmBr0Jy1WsyRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by SA1PR11MB9876.namprd11.prod.outlook.com (2603:10b6:806:4d8::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 13:49:59 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 13:49:59 +0000
Message-ID: <d7c8f01c-2e27-4e1a-93a2-35dfdbe0c5b2@intel.com>
Date: Tue, 10 Nov 2026 19:19:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] drm/xe/cper: Add software CPER emission entry point
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <jani.nikula@linux.intel.com>
References: <20261105085348.1467925-8-mallesh.koujalagi@intel.com>
 <20261105085348.1467925-9-mallesh.koujalagi@intel.com>
 <f58d57bc-05c2-42fc-94af-dbd5ea260323@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <f58d57bc-05c2-42fc-94af-dbd5ea260323@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::12) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|SA1PR11MB9876:EE_
X-MS-Office365-Filtering-Correlation-Id: 050b33ec-0810-4733-7abc-08df3f3182cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|11063799006|4143699003|56012099006|18002099003|22082099003|6133799003|10067099003|261009223027099003|261102123227099003|261026121527099003|261026140227099003|261021123027099003|261021121427099003|261022113327099003|261022105027099003|261022075727099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: KGioMxuWIqaw96QiIsc+bh7m5D9LlaQ5s1ONF7mrUZyLsqrODF10c0R4qo/IkDuQkGZTB2uQWfaliP6XomuPI9L0U5JlqGbDwC+nSKTO7yX5O/Op7Rspc8CmYvi8r4DwF+1SGmjTc3jLIbAha/F6ul+aRiXw0woonuMFE7RRONBVhYqsZ9Q81XVY98HVdERRWUrACF2nfxnaPq2dMCkf2sVOx7FBZrBxu2YurnymrBlHreDe70g323zCdNlIv7POfJMqh8LsQWUKisJRietbxumcCMZld8liJGcYwDVUReUzLKSDEDtaZqYnJlNu62EHBcn9CeoRBZT6p0M2RKoDM39Xdp1Qbegu4QG1ceAD/O1R/ZS8mK/v3i6cMaGXdvhcbNt4AhlEnHfIrhETcpvCjKhy02Vugfb4gSNhXKvhDWK/DW9j/SSjqVI6E3dLKuhSQcvQBOteQ9ehTqSuaI/phzjFQWBuYrzyAef4XZ1nZnU0J47we+gjslkdw5/J05+Icfs5EaKZSQSOxPx+/wYyNrd5QbmY+bNewGfYoezY2XuFFXvqObZAeSNYKK5NhV6IRjpcUrwsO1eO2w2y2jdGEA8H7ekyZAOolYagGriO7WLZB/R2CgUHzIvdVrIxjhu7LsKduVmH8LzvJUkRo9ezZITqGssB4/J13KETrVlYI+E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(6133799003)(10067099003)(261009223027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022113327099003)(261022105027099003)(261022075727099003)(261028144727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDBRWUtpV1ZFRm4vTDhrR08xZVovbCt1SnB4dFlFaW1VU0FnaEtobklHL2pC?=
 =?utf-8?B?MVg1c05EZ2tqSlpNSzBvY24rMUs3TnFVVm9va3BxRVZGenhkRXI2U0o3eGc4?=
 =?utf-8?B?b3ErUStUWkhvRXZ0bkdEVE9BYkRpamoxcC9RS3JYZXhjZXFweG0vclBDWkYr?=
 =?utf-8?B?aUlta2tLOVFyemJ1STByOGthd29FVE0vcVlPRVAxSWdhN0ppVk1YbXVnYjFx?=
 =?utf-8?B?cHpwY2Q4d0lKQ0JDSzA0SVlMZTN4QUxLM29aVDl3ejdvUnB3RkQvOVBUU2cx?=
 =?utf-8?B?cXhQbURHbmVTMWI3V2Q4dmNRU0dOOENMeTg4U2FoTStUWTd2MHF3cUdEcXhj?=
 =?utf-8?B?ODZNbGlTZ1F5cWFYS1NqWU1JRGtMd1dTSC9RWk1IRzdpRlEvdFRhVlZIUHFh?=
 =?utf-8?B?TkNiT0pPaWNnZEVwbmZrWHpsR3V5ZkZrL3d1WDVEZVdjNGQyQit0SDIzWXJ1?=
 =?utf-8?B?aEpySS82dVdaeUZ0RkZJbEY4ZWM5TEl0TVpUSXY3YjdzZDZZYnc1dWZUK1FH?=
 =?utf-8?B?bzE2czN0ZmdFZHNBak1rd29ySGhpZk80L2J1WVpqeWJLbmZkNHVFdTlkUC9u?=
 =?utf-8?B?RldFMWlMRXdDTTh5bE9QY0pEV0pWaWhZV1pOV0RtKy96NlJqTm5JVit1QzIy?=
 =?utf-8?B?ckFqZ1ZFSDdGb1YyaEtxWDU4Z3hoUVhXNmJNdnFCUmR0d3ltYXNSM3BTYWtk?=
 =?utf-8?B?QkdCZjZYQVdaUm04b3l5WDhyQWpLMUFGeUpaTXRnd2hUWFFHREhTR0phSFJN?=
 =?utf-8?B?QlZocVBvL3BrZUdScVo0b3FBZTFaSkQzcXh4alhKbEhudTIyTzlUWU1RLzl1?=
 =?utf-8?B?d3RFS1MwTlNSWjB1ZkdkeGo0d1dGT1ZvbERXZERUbEJ2TG1XazJJMUY2bFI2?=
 =?utf-8?B?L1lQeU93T1JjS0I1RGVzR3BpcmtSWFIwWXdSUDZKc1NZdEZaOW5tdjg0R2ZQ?=
 =?utf-8?B?Z3hRa2M0L1RNYVBsVWF6MmhreVErU05BMkUvTVhKbXp3emVUcjhwK2dqbnZx?=
 =?utf-8?B?Y2xBSlZqNFRabmxnRjd0enZHNE1MYTdYa2RuSHk2SDNpNUhvZ0RtM21lYWxZ?=
 =?utf-8?B?bTZnYURqY1pBZEo4MzBMa1ArZTYrSzlkdm05MDZlVU1kb0VZZDBZZ2xwV3R6?=
 =?utf-8?B?d2kzdFJFTDVFb25leGs2VFlkZzNzdGc2SUZxbER2SWZRSzE2Wnd2dDN5SGdh?=
 =?utf-8?B?WHVsTVE1MFNhbS9CL2hqbHAzTHUzSHdMSDBMelhJbldEQ0JPZ2dNdUlUSVEv?=
 =?utf-8?B?Y1VsQkoveE5KR2k0MllwRXk1TGNVZXJMd1hURzRTQjh4MUMzZDQyQzJBWVgz?=
 =?utf-8?B?ZDFYQXNrc2Znd1diZTh3RFN3RGx2TnhHWlNrUE5WVjNBRlp5K2Qxa0k2Um1F?=
 =?utf-8?B?UzhjZ1JVT2M4QnNKaWNqRlJZYytkWjRSdlc2NlBWMHRhZnQyM0RNRTlJTzNz?=
 =?utf-8?B?WitkaS9OcjRJRWZwVE5hL0p3ZmxPZGFDMDZ6NDNGU1E4TnhnL1crNXFyV00x?=
 =?utf-8?B?NUtBczBZTm1PeWU3NXlYRlN2L1hhc3gydzltNm9ZSC8wWWorRzA4eWRZOFVw?=
 =?utf-8?B?bGRTd3Q5UFl4d1lOZ2JPSGVUa3dVblkxM1ZZV3hMQlBGY0NKb0YyM0tldU16?=
 =?utf-8?B?QlQ4NXZYNnVkeStPd084TUd0ZXFTZGk0bDUrNHo2UXZsYVVDOW5VYzl2TWZ1?=
 =?utf-8?B?am5TTmkrUFRiVVQ3dEVQK2FrbWYrRERNc2k2QVd0aVBSbW1La2wrcFZwbkZv?=
 =?utf-8?B?TzFvUVpwMDRQdjFsRTBoa2lwN1N4bjdyUDRpbUtSQm5rcnc2T3QvN25va3BZ?=
 =?utf-8?B?VGtzSWhCUWUwanRyWUNRY1pZc1gzZjBQanlBUEI0UWNZSkpXMzdpL2xGTnJ4?=
 =?utf-8?B?OVlHaDZnWlRuOXYrTStzQmFkT0hSVXEvTWdqRTZQOGRBWFRGbFBNMmhHVDhI?=
 =?utf-8?B?aEk4c1hXeUJ0eHZyZjkyRmZaK0krdC81TUR3N3lyZE5WNFFvKzlMRGx1bkhT?=
 =?utf-8?B?SmtZYTU5S0ZTMTlROEdoL2EvczhhVmMyN3JWWWdYZ2ZTV1AyRUpXTVFKNWN6?=
 =?utf-8?B?T0xHL3ZXVmR0aWhNaUV0bmdSOXZUNlJLVlE3QXo2d3hFQWl1T3JlN1RqcW9n?=
 =?utf-8?B?ZmhGdUJtRnBHZHpkbUhFbFVLQlcrbmN4c1k2YzJkTEVDOE4yeUN4cSsyWkZR?=
 =?utf-8?B?Qjk1a0NNRHlLVjFwQmlZUVR4eGt3MEE0S2lOYnVjcUgvQU5HTUZHcWJ2NUJh?=
 =?utf-8?B?T1NqejJxWjV0dHNkS0JrV2tLZlIwYUI1eTFhaGlFQTZlcG1xRmZQbUYySEZT?=
 =?utf-8?B?dkEvM2NiUVhML1dDWUc1c3l3cTE2bCtqdHZWQW5WcWhJTiswL1ZjT0Yzbkg2?=
 =?utf-8?Q?LiXiiJ73NRNcQSls=3D?=
X-Exchange-RoutingPolicyChecked: Vp/L7QK1nkx+TaS/05C1+4i6qwJj4NVqoHe5asjr0eKFHIBdB7zusy1qzbEyjE2D5+OACW1UKY0DacPdi7qsjBes5oqSeTRWlGpZhHZy9JYPPeNxqUWOrUfCPrJcTHEUCrjGMvkbzcyVLOWCK47LkAfEuhyelKO8WL+lOjmrbDnJu2jZ4H+caLKnjRxVutdtFFRCjFPgAjELPhUwsegSD/M6+m+ELVA9D4YVP+7UxyljNRPOMdgApuSyZsZutW+V90Cu1sJolXoD8fv5tM+h4XfDA45liP4wCmJuZt4GpZDEn0u31uGUHV2wtUlFlfvlKnC8YWDvxyThIbjmjdS4KA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 050b33ec-0810-4733-7abc-08df3f3182cd
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 13:49:59.3892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h5M+PlVXT0oyfGscG7SFS933sL6XX6zrOlNER9SwmGc/V4Zfm0UFwTXc+l8xLQVbxxA9E0zJXkydeQQc2YdgBIQtHu6xMHKzXPlYwczI0EQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9876
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10-11-2026 06:58 pm, Nilawar, Badal wrote:
>
> On 05-11-2026 14:23, Mallesh Koujalagi wrote:
>> Add a software CPER emission handler for CRI SIGIDs.
>>
>> Keep hardware CPER handling unchanged and return early
>> when the Xe device is unavailable.
>>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>> v3:
>> - Handle early PCI probe where xe device is null. (Sashiko)
>> ---
>>   drivers/gpu/drm/xe/xe_cper.c | 22 +++++++++++++++++++++-
>>   1 file changed, 21 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
>> index bb90030bcd2d..db3513c59834 100644
>> --- a/drivers/gpu/drm/xe/xe_cper.c
>> +++ b/drivers/gpu/drm/xe/xe_cper.c
>> @@ -32,6 +32,11 @@ static bool is_hw_sigid(enum xe_sigid sigid)
>>       return in_range(sigid, INTEL_SIGID_GPU_XE_HARDWARE_START, 
>> INTEL_SIGID_BATCH);
>>   }
>>   +static bool is_sw_sigid(enum xe_sigid sigid)
>> +{
>> +    return in_range(sigid, INTEL_SIGID_GPU_XE_SOFTWARE_START, 
>> INTEL_SIGID_BATCH);
>> +}
>> +
>>   /* CPER platform_id GUIDs (RFC 9562 UUIDv5) for each PCI device ID. */
>>   static const struct xe_device_guid_entry xe_device_guids[] = {
>>       { 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
>> @@ -240,6 +245,12 @@ static void cper_emit_hw_err(struct xe_device 
>> *xe, int cper_sev, enum xe_sigid s
>>       xe_cper_emit_counter(xe, cper_sev, sigid, counter, &response);
>>   }
>>   +static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, 
>> enum xe_sigid sigid,
>> +                 u32 component, u32 location, const void *data,
>> +                 struct va_format *vaf)
>> +{
>> +}
>> +
>>   /**
>>    * xe_cper_emit() - Emit a CPER record for a SIGID log entry
>>    * @xe: The &xe_device
>> @@ -268,12 +279,21 @@ void xe_cper_emit(struct xe_device *xe, int 
>> cper_sev, enum xe_sigid sigid,
>>             u32 component, u32 location, const void *data, size_t len,
>>             struct va_format *vaf)
>>   {
>> +    if (!xe)
>> +        return;
>
> xe is expected to be valid here. Silently returning on NULL would hide 
> a caller bug.

During early probe function xe is null, only passed pdev (pcie device) 
to emit logs. In that

case we need to handle it.

>
>> +
>>       if (is_hw_sigid(sigid) && !IS_ERR_OR_NULL(data)) {
>>           cper_emit_hw_err(xe, cper_sev, sigid, data);
>>           return;
>>       }
>>   -    /* TODO software CPER */
>> +    if (xe->info.platform == XE_CRESCENTISLAND) {
>
> Introduce has_driver_cper flag here.

Ok, will update next revision.

Thanks,

-/Mallesh

>
> Thanks,
> Badal
>
>> +        if (is_sw_sigid(sigid) &&
>> +            (cper_sev == CPER_SEV_RECOVERABLE ||
>> +             cper_sev == CPER_SEV_FATAL))
>> +            cper_emit_sw_err(xe, cper_sev, sigid, component, 
>> location, data, vaf);
>> +        return;
>> +    }
>>   }
>>     static ssize_t cper_on_query_show(struct device *dev, struct 
>> device_attribute *attr, char *buf)
