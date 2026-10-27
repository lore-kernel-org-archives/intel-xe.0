Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5530606A31B
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 06:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FhUcwr5e
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B65C10E1F9;
	Tue, 27 Oct 2026 06:04:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8CE10E1F9
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 06:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793081053; x=1824617053;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=jLeGFm4gUCUWKgnHU8ZSuryrZDm7jIyr0QZ7O8GzzD0=;
 b=FhUcwr5ev2tnbtMPnOz+M9ovWsmLwzaKTymXeuKgG0E868COsMRBVeM3
 kN6JV1xamka0FJ93yG3jWVH7RfiDZucNoCDsOvkiXHamhiKI9PRLWOTPW
 ptzD6etwxfP6twc9+thZmwhdfJ6WYSDyVI2E0qI+aGk0stT7qeEy4iDrD
 5wNO6/uBkQm6ed6BAUs+BS+YWV00is8hrqMaPExEfaQu881RQkrdqm8b3
 O1MpdxvAN/4wp9faK/maRb2A+6iCjb0Azrjl+hjkvrwt0s5j+QL6NBz2v
 hb8+TfXfH+Cn3NNFxcKetGN3PPfAIHfNfSQdjbFi0zBSbx4pFmdPppxr7 Q==;
X-CSE-ConnectionGUID: KtymvloTTh2lmidRzjbn5A==
X-CSE-MsgGUID: IlNc5H4fTJ6hcpo5ePvlQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1667400"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; d="scan'208,217";a="1667400"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 23:04:12 -0700
X-CSE-ConnectionGUID: PHj+YqDyRbS4nhMbDTYZGQ==
X-CSE-MsgGUID: ewbpAo0MRXmsR0jXd9j9CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; d="scan'208,217";a="4364708"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 23:04:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 23:04:12 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 23:04:12 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 23:04:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SCRSVrE8fgPRJPcRFfnHYrepSUSNNOI5ygT52zj4e4g0M4RSR9yzGqgooemI0q4pEHX5kJzXqd8nX/1wZjUKHuo2t1/2wcZ/vOh9uscL2YxXTOyEWpPSZ6E/+Q2jSAEUOwpYFxkZLh+WoRt9gMMzAlJqxEwL0DLXQsHD0iHIU+/sF745pmpM+pd8v7rioms6fWOMr99Sh7Ntz/h2YUFqmrB/lDC3I5R3tWeAFwGNSPAqdRs6sScHIEyenvW8IAjwKmF2mh1RI4lZxfdzaalfvGbV9DMhKKfKhJfoUiIQaahNOsVs4KRXMcBRyPGAw5TV26frYsR22vhJDAEZeaa0AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fL5mE3T0URc0HrpWvNi6RHrX+4p+Y/PkIqm9lfhP7PY=;
 b=aPvsbNCylhTifGEkegJR0b0qBktuu7YUBtt2wgLwigtUhypUIwsZKn/O0rhws4eWfXir9boFkPjs+i/GcTOU5NO5BMhwQSZXkHZ8ALf/oye/MNcDrVVsYW98e6PEjeXJcFnSZpnGVuln8/8INb+5UznGFHv/PsSpWanSzTkBwA/2I47raxRQHTYPssDxA4gWReBdWpeLKXpFd1Q2Vbo7NWNRiQyY32i2ttDXdyha0eMiPZLskEzxcSfCSd90BaUxsskvP3z62J57xztwj7l23752X+s6A0jBYndw1uMuI8A6j1tdaUIVVDgycGF2DXh4cDUSjzaAMtMN3wq+6Wxp5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by CH3PR11MB7820.namprd11.prod.outlook.com (2603:10b6:610:120::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 06:04:09 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 06:04:09 +0000
Content-Type: multipart/alternative;
 boundary="------------6985JH280Eqsnl4V0DIpltis"
Message-ID: <520a56ea-40a6-47bd-84a0-be5cf604e5e7@intel.com>
Date: Tue, 27 Oct 2026 11:33:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/13] drm/xe/xe_ras: Report device memory errors using
 SIGID
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <daniele.ceraolospurio@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <arvind.yadav@intel.com>, <syed.abdul.muqthyar.ahmed@intel.com>,
 <nitin.r.gote@intel.com>
References: <20261023043422.681260-15-badal.nilawar@intel.com>
 <20261023043422.681260-22-badal.nilawar@intel.com>
 <at9L8jjWN13Z7yy-@black.igk.intel.com>
 <508a5fd5-5734-4eba-b93c-b247a6418476@intel.com>
 <at_-a4q-4GU-7gwk@black.igk.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <at_-a4q-4GU-7gwk@black.igk.intel.com>
X-ClientProxiedBy: MA5PR01CA0251.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::12) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|CH3PR11MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: aba04c64-7ced-4ba5-f70b-08df33f01db7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|22082099003|18002099003|261026121527099003|8096899003|5023799004|56012099006|261022113327099003|11063799006|4143699003|261021121427099003|261009221227099003|10067099003|261009220027099003|261021123027099003|261022105027099003|261022075727099003|261009221727099003|261009223027099003|261009223327099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: lDEDkt5W6XeAg4TVl6Z1qzIuYXxRtKBVQT0IG2GqnOL+wVMn2SiHuyZdom9LavfFphk2f2YA6YGMNwwsABIDydeK67iSt+d98ogs9dhNyXspROJvUj1jbKivFA28seOpMI4V3rbKI79qPGYJh2+UH3RyuYw2MtByQ3ZB/RO0w5ZiDg3BulmcfwOy/UpCxQ5hEDQOhV+26qsLjJvuVfPhwY+UG5YdKlCVH8g6VD3bItEcTHCFX7hDOCG8jj+UhWy535jvkzZbifHy6grkFJiKKvN0zFvEeQqBz6Zv9Q+T7XGfSq0j4XM4BwHJ0cUXm1CdHYbSKQ8vPYw4+iakympn0XpY2qQeIWQ6XlW+EA4Hbq3eZifE63+FU/z3zkdDW+CWG8zcDE8pN3Bml4eq1HNFkgSwPBa803Qrw7wpgpP6uu7A1MBzVC6YU5D8gXFIXx3OtcNX5VLwyJ8S9ulq7IWA9/4oOm67qJ7Nr4Uu6J0ws7YsYqCWNXPXl92GA9lcJoI62q7i580nlvTxs9uydtn/Mg9s977AcCEfeaSAZ73fna+O7L93vWWN6nOrqDH6NO/MjJx4JZAbaBzMzAvcJ35xJXzz1ehhNJtVS0ny+ATCrdgyOl15Sje7XFIi5nRn104Frop6KwW0tA+Zt0i8sGrZIBz5Op49LDbrt7wzGWMzmSQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(261026121527099003)(8096899003)(5023799004)(56012099006)(261022113327099003)(11063799006)(4143699003)(261021121427099003)(261009221227099003)(10067099003)(261009220027099003)(261021123027099003)(261022105027099003)(261022075727099003)(261009221727099003)(261009223027099003)(261009223327099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUhXTXRvYmZRSGhkZHQ0enB4a3FncTBQYkNCaXJvb3ZnZG1yVHVuT1Z1bVZI?=
 =?utf-8?B?U0cwOE9ORGpndlFmdXYralRVTWx4QW83K200WkRhQkUveGRYV29jZnlnQms3?=
 =?utf-8?B?Z1gvTitjLytta2x4Q1BNNVExc1VtUW9adi9TRTF4SWFEcEltZ3JYT2kvNk5k?=
 =?utf-8?B?eWR5dGpuUjVTN013VHZ6QUZaZ2tKbUZGZUQrM0lyRTJZN3BRT2lBNU40ZmtU?=
 =?utf-8?B?dU5oUkVBOW02QkJncmpmejBaS0ticW9GK0JiNFZmMXl1elI2a1VMdnpXMGJC?=
 =?utf-8?B?NmpiZm9EY2t2eHJUd08xOUREZlBrR2tLQUFZNWZBakRnRU5TYzBTQU5nWTU3?=
 =?utf-8?B?S1hJMFNDa3pkV2Y0M05xN29zUEJGNHFIbkV6cVE4bmJSRHRKdlZxdlczbnNY?=
 =?utf-8?B?TXNudVladTgxYVM1SEJJRXlIbDZHRkY0VFhzY1ZHNlJVUmZyOHhVZWQvOGE3?=
 =?utf-8?B?b2NNVG5oUkhaY1BXcVpMNHM0cklQamV2Vkh2YnpMeDRaZnhRT2UxbFBJWHl3?=
 =?utf-8?B?WFp0S1ZETVBGcGdFcitqOVBoK2FEajVreGpicXptU3VDaUN3c1RFSm1OazRq?=
 =?utf-8?B?c3FIa29YeklxcmdQUU84akJrZytoem5GVXdYTjBpSUZBcGZSa2h2ZmRKaytR?=
 =?utf-8?B?bnUrRXdVK2lUSHhGWTczTlJmV0tQbjNMMGpYSTdqYk40c056VkdaWnVlaEZr?=
 =?utf-8?B?SGlvYzgxcWFTQkQzaFl1L1REME5BWUVGL3ZidkU4UjVUcFF2eFhXMTJQMENu?=
 =?utf-8?B?Y3ZoQXZVRmVUUG5Cazk4Qm9nTlZ2aXNjQ1VoRk9PakVOWUVIVnpqMUFKRU9j?=
 =?utf-8?B?Mi8vVzlQVy9QVkVDYStHNWE3UDhpbWxTbTJiR0E1dHMydHBDUCtsaXRaMUZ0?=
 =?utf-8?B?Z3NzOUlTTVBUWWdkRUlWZFAzS1k1NEl1S1QvVFVtTVZHaVFYSVdSL0RHWm5L?=
 =?utf-8?B?dEFqV1lmaUMwNG9WUmhnTkxCcEM1ZHhSUnpPUktRNFJobjB2OUVtRUVOMkxr?=
 =?utf-8?B?eDR0dDNVLzJMazFLanVJdTA3OStIdVJ0ZkFEQndGcTRSUEcyeUdPM0xoYklt?=
 =?utf-8?B?TEFyQzFPM2Flb09vR0hBUEtTeGRvQzZWa2JPT1RocjZOUmFiSW4xMDJlbTlT?=
 =?utf-8?B?aU5DRm1HdWZ1N0pSbXRhKzBETFlRcFFqTXk0ektudEhsOERsc1BLcUExbG43?=
 =?utf-8?B?VmVzYytEbHZ1SHZaQXNHVWJjVE1sK01aZHhsbjBsVjIxQkhUelJDWm5EeXVt?=
 =?utf-8?B?WG5PSjdjNmFBMzlIZ1MralJlNVgzVURaVXZ6NXNtRExUajk1VW1EdGM0TjZQ?=
 =?utf-8?B?bHRDcXlVM0ZPZ01xOSsvOHZYMUk4VzJtRmZidE1CWCtnUU1QeEZLclI0TEdo?=
 =?utf-8?B?ckJXMVo2QXFGZEw2SnFRMFdlK2k0eW52TEM4alpTWTJURGpnRnBJcGRBdHlW?=
 =?utf-8?B?ZjlvNDJlUkM1dmtMdjByeW1hQWJLYWVYckxrU0xTb0xJQ29MN2Eza3ZzQzBz?=
 =?utf-8?B?K2h6d2lqdno2ZFYrWjBwNjJSY3FDYU1lWGxHZ1lqT1kzK2pQanR6YUFyZmVY?=
 =?utf-8?B?bGNiTGo1SmI2UzEzamtzVmpBckNnYWFIVCt4M2RBcndpNDhuUkEwRnVEK0l2?=
 =?utf-8?B?dHU1YmNhTWtqRW1JN0FPNGUwOEZsQ3V3VzkrRTNsRmJXUlNsN0U0RWppR0Jq?=
 =?utf-8?B?MG1wMXFrNkpYRFFSb1cvbWRWVFhPUHZnczBwa2JrMVFueTdjN21zRW5tUXJX?=
 =?utf-8?B?YXQvM0JocFRwY3UzRmY3d3E4ZGc1bDR4RCtkZHlkbjg2ODJ5blZicEVpWmJr?=
 =?utf-8?B?Q1dZMStEc3lxMEtwaHE3RUt5ZDNSQVJIdjhyS0NZekZGeWhmN3NMbDZ0ZXNt?=
 =?utf-8?B?Y3JqaUpDQlc0aytGR3RwMFk3enRmYWY3QldFK1JrcGhlRE9wRkdKK0dvLzdY?=
 =?utf-8?B?ZlJhUXJEUDl3MkwxOTFBZUUzeGtNampMa1hOSThmVjVXbjBVYlVROXd5SFJi?=
 =?utf-8?B?NnFQNWFGTlQwNWlvUzgvaGpRamtNWjdMK1RBYzFtSFY1cXJoeUlqblhLby94?=
 =?utf-8?B?WWlwdHpMNHVETkFRaGE5TnRjcTZzbm8xbUM0T1ZYdkVtVjB4SGVlYUQvNml5?=
 =?utf-8?B?bDl3VjM2K1pIdDY5cXRZdFRBMGRHVDZVbjR5OElXcmpCTElaek9OdUNWREdn?=
 =?utf-8?B?Zm5paWZLRTRoSFI4R0xoMjZwNkNGMm51cTMxUDZCZFU3YWp2RE9vZ0laUGs0?=
 =?utf-8?B?RjJJa3JPZk5NbkpmYWpVa05kWElpRkVSMXY0eUYwdWh4MUJwRXk4VDI3Qm9P?=
 =?utf-8?B?YlFVZ1RCcXIwZlRRMWE3cFFxOWxrNXhqQ1dhYStNajZzTm05dGpYZz09?=
X-Exchange-RoutingPolicyChecked: jAaHjCGU7ieCUt/Kivwzh3ucUVG3F6s02suQ2ylul9nyWTMHKfcDBL6V8PSoCLhNg1jlb2o7yfcfSVKTbs+MuscKghH83OOlP+4ngqAZWjxvokvYfB2vTRjm6Ch7G45vKaVYkGw3CkRdd6aUlEIOPy/Ku6nrbv0VRrTJk+28AuAUAjLSClsQo28t2orsOkc19dh+PNVMoJZ181Rx0IcggzsuuzBDtx0y7DIZQF2LgKz+7jKLXmr+xiw1jnBLnq8fre/2iDQNFAprPxrpzDMq9N5J1R/RRvUQejOiUAS3LZXu+7aiAvGrEFiszyacr7CFt7sxmvcQDEodj1m2Mr6M5g==
X-MS-Exchange-CrossTenant-Network-Message-Id: aba04c64-7ced-4ba5-f70b-08df33f01db7
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 06:04:09.4443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JMRe439ua1LJ4n2jy86vA6Ob7VfZZWXK0Jb7w9YZHx38V5uA9lQ2/kA+Xkt6I/tpIm6/Nq1zI3bVMZIAi8iDCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7820
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
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------6985JH280Eqsnl4V0DIpltis
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 27-10-2026 06:59, Raag Jadav wrote:
> On Tue, Oct 27, 2026 at 12:01:42AM +0530, Nilawar, Badal wrote:
>> On 26-10-2026 18:17, Raag Jadav wrote:
>>> On Fri, Oct 23, 2026 at 10:04:29AM +0530, Badal Nilawar wrote:
>>>> Use xe_log_comp_info helper to report device memory errors using the
>>>> corresponding SIGID.
>>>>
>>>> Example:
>>>> 	xe 0000:03:00.0: [drm] SIGID=202 (020100020008002000300000)
>>>> DEVICE_MEMORY: Double-bit ECC error detected at sw address 0x63000
>>>>
>>>> Reviewed-by: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
>>>> Signed-off-by: Badal Nilawar<badal.nilawar@intel.com>
>>>> Cc: Riana Tauro<riana.tauro@intel.com>
>>>> ---
>>>> v5:
>>>>     - Log unknown memory errors
>>>>     - Add example log in commit message (Raag)
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_ras.c | 20 +++++++++++++++++---
>>>>    1 file changed, 17 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>>> index 95e87c635b04..5ebfc6e8dfc7 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>>> @@ -643,6 +643,7 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>>>>    static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
>>>>    {
>>>>    	struct xe_ras_memory_error *info = (void *)arr->details;
>>>> +	u8 cper_sev = ras_sev_to_cper_sev(arr->counter.common.severity);
>>>>    	int ret;
>>>>    	/*
>>>> @@ -654,17 +655,30 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>>>>    	 */
>>>>    	switch (info->category) {
>>>>    	case XE_RAS_MEMORY_POISON:
>>>> -		xe_info(xe, "[RAS]: Poison error detected\n");
>>>> +		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
>>>> +				 "Poison error detected\n");
>>>>    		break;
>>>>    	case XE_RAS_MEMORY_DATA_PARITY:
>>>> -		xe_info(xe, "[RAS]: Data parity error detected\n");
>>>> +		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
>>>> +				 "Data parity error detected\n");
>>>>    		break;
>>>>    	case XE_RAS_MEMORY_DB_ECC:
>>>>    		ret = handle_page_offline(xe, info->sw_address, true);
>>>> -		if (ret)
>>>> +		if (ret) {
>>>> +			xe_log_comp(xe, cper_sev, DEVICE_MEMORY,
>>>> +				    &arr->counter, sizeof(arr->counter),
>>>> +				    "Failed to recover double-bit ECC error at sw address 0x%llx\n",
>>>> +				    info->sw_address);
>>> Isn't handle_page_offline() already logging this? If no, shouldn't we
>>> try to consolidate?
>> It doesn't emit CPER.
> So perhaps convert them into cper instead of duplicating logs?

I'd prefer to keep the CPER emission in handle_device_memory_errors(), 
which is called from xe_ras_process_error().

handle_page_offline() and its sub-functions invoke SIGID at multiple 
places, not all of which require CPER emission. These functions are also 
called outside the error-handling path.

Moving CPER emission into these helpers could therefore result in 
multiple hardware CPER records being emitted for a single error event.

My suggestion to authors of this feature is to clean up SIGID logging in 
handle_page_offline().

Thanks,
Badal

>
> Raag
--------------6985JH280Eqsnl4V0DIpltis
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 27-10-2026 06:59, Raag Jadav wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:at_-a4q-4GU-7gwk@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">On Tue, Oct 27, 2026 at 12:01:42AM +0530, Nilawar, Badal wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 26-10-2026 18:17, Raag Jadav wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On Fri, Oct 23, 2026 at 10:04:29AM +0530, Badal Nilawar wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Use xe_log_comp_info helper to report device memory errors using the
corresponding SIGID.

Example:
	xe 0000:03:00.0: [drm] SIGID=202 (020100020008002000300000)
DEVICE_MEMORY: Double-bit ECC error detected at sw address 0x63000

Reviewed-by: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
Signed-off-by: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>
Cc: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
---
v5:
   - Log unknown memory errors
   - Add example log in commit message (Raag)
---
  drivers/gpu/drm/xe/xe_ras.c | 20 +++++++++++++++++---
  1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 95e87c635b04..5ebfc6e8dfc7 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -643,6 +643,7 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
  static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
  {
  	struct xe_ras_memory_error *info = (void *)arr-&gt;details;
+	u8 cper_sev = ras_sev_to_cper_sev(arr-&gt;counter.common.severity);
  	int ret;
  	/*
@@ -654,17 +655,30 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
  	 */
  	switch (info-&gt;category) {
  	case XE_RAS_MEMORY_POISON:
-		xe_info(xe, &quot;[RAS]: Poison error detected\n&quot;);
+		xe_log_comp_info(xe, DEVICE_MEMORY, &amp;arr-&gt;counter, sizeof(arr-&gt;counter),
+				 &quot;Poison error detected\n&quot;);
  		break;
  	case XE_RAS_MEMORY_DATA_PARITY:
-		xe_info(xe, &quot;[RAS]: Data parity error detected\n&quot;);
+		xe_log_comp_info(xe, DEVICE_MEMORY, &amp;arr-&gt;counter, sizeof(arr-&gt;counter),
+				 &quot;Data parity error detected\n&quot;);
  		break;
  	case XE_RAS_MEMORY_DB_ECC:
  		ret = handle_page_offline(xe, info-&gt;sw_address, true);
-		if (ret)
+		if (ret) {
+			xe_log_comp(xe, cper_sev, DEVICE_MEMORY,
+				    &amp;arr-&gt;counter, sizeof(arr-&gt;counter),
+				    &quot;Failed to recover double-bit ECC error at sw address 0x%llx\n&quot;,
+				    info-&gt;sw_address);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Isn't handle_page_offline() already logging this? If no, shouldn't we
try to consolidate?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
It doesn't emit CPER.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
So perhaps convert them into cper instead of duplicating logs?</pre>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <p>I'd prefer to keep the CPER emission in
      handle_device_memory_errors(), which is called from
      xe_ras_process_error().</p>
    <p>handle_page_offline() and its sub-functions invoke SIGID at
      multiple places, not all of which require CPER emission. These
      functions are also called outside the error-handling path.&nbsp;</p>
    <p>Moving CPER emission into these helpers could therefore result in
      multiple hardware CPER records being emitted for a single error
      event.</p>
    <p>My suggestion to authors of this feature is to clean up SIGID
      logging in handle_page_offline().</p>
    <p>Thanks,<br>
      Badal&nbsp;</p>
    <blockquote type="cite" cite="mid:at_-a4q-4GU-7gwk@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

Raag
</pre>
    </blockquote>
  </body>
</html>

--------------6985JH280Eqsnl4V0DIpltis--
