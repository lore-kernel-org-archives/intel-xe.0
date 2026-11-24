Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826D8606A33B
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 18:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EQya8dcx;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=b2yjMz5z
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB5510E4AA;
	Tue, 24 Nov 2026 18:09:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C4310E4AA
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 18:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795543745; x=1827079745;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=facjrdMHhn3zHBtQpRHLuNDPDrwI6IpIEimaFx4v6MU=;
 b=EQya8dcx+0lh3WfZUodl+X/9czGkMNwGN3bFoHAJHBTdi6it0guC3A9m
 u1TSasEjCbGSfGPzYWqQmBCj/NqCFEJci4eBfzUc+1/0blIxq5e9jw9lr
 1OB3IpYyWyidsMxczq2eHEkZvFIPILBL377jpv+fa/AAnRAzMQUd2nhDb
 T0KW7F8/WPy/g8yXBEL1fD/JHhDc/wJkQ2UrIYqOaymYq2WG/LqdEpJjo
 iy88k7AsV+PSSbWAj3ERJ93O4EzTAUYZKKoDjH61bRCakMHIpXTBSG+WU
 RXT67gInsSmTfuAcbiNCzU1f87uUnaIwOl4/BrjouCR2FgLqiy4mWUZhC w==;
X-CSE-ConnectionGUID: A9U2e3VESayi0qvpjwXfJg==
X-CSE-MsgGUID: ZEv7BqD7QtOC6GpI+t6J1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4397348"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4397348"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 09:21:14 -0800
X-CSE-ConnectionGUID: YhuwFvfXQuCPMWkTlg0Hvw==
X-CSE-MsgGUID: M3gHPFhCSz2//kWGiSfkWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11817277"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 09:21:14 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 09:21:13 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 09:21:13 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 09:21:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QnTS6WfdOFuCz1GsXBsS9SEvdnhhmgq2apWOq1kjsY82vuARsB0fPG+6aoCqQzfhSZe2hDQRiSygmYF4Y+xcwZA0oNTMZ3AAruM/pFFDb8FeSkGDJqUHoZuGCTiDUpY30GWSQTdXT2mCKNnVXYv6yty7KYu3MPkoXe0Yxllt+pk5XT7ecUWKe19gE5/RTtnHAOxIX9sqdOBanko+Mg63Kdqikjzpfy2NBsdK6URZZqE2IxXJBBTw/EsGKqFdRb6Y9Dz3GNhjRgnuAGuZJLpBnrbIC6dDMnbe3vK2NrUnQ3iGsfEfAjHMP9KrqMC2x9xTfRzlOl4kbzRWrWkFZO5L7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDNmStRbEVuXWFyBhRYVLgDQNvOeS+3ydNf9MzpAx54=;
 b=Tf7EltITwbAKs3k0WW13bLlCVy8TGIqeUDLIfYP/z0244eidS0zoARYEjgbDPZzcSKzT435x1RympZ/SQ4OZ7vrYLXHwQMyeARw19IISoJ8gChc7Z8q332YfHYPHyOEfyxIT/5qmN8YMG4jrj1ZVNp80brisKs7GpSph7kBpD5LaROP884CSjsyIivZq7YGxYjEYSjEPYk5HJjOgG5XZdS0o40pTNCMvjgnkIVfnNkKSImR2zMK0jXoFBDBMpxtqgoZlVNV5hkr54ao7oOXGRmY0VH32kKnYzTGlb2CxvdJ20VSlyv7PlQ6iW0+62acr9g7L+7pXkLwrlhF3RElh6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDNmStRbEVuXWFyBhRYVLgDQNvOeS+3ydNf9MzpAx54=;
 b=b2yjMz5zH/dbh0kRRuCl5GKAmf5W6zqHsCe7kTrci4qhkKFDQ1xlWsVLu5qNYm9zJ4y7nlFOVQ/4RG+zHfgx6rzVHz3agtSLqLUXgp8gE70URoMeJn+uXvc9zOz/P4pzxKdyxjQFlNNbJzj9rJ0JsvsbRsdMommHCDmf/RrXSE4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CYXPR11MB8756.namprd11.prod.outlook.com (2603:10b6:930:d6::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Tue, 24 Nov 2026 17:21:04 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 17:21:03 +0000
Message-ID: <fd341c40-b5fe-4624-a6cc-9c3458880240@intel.com>
Date: Tue, 24 Nov 2026 22:50:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/survivability: Fix infinite loop in aux info
 traversal
To: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20261119104300.3401464-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261119104300.3401464-2-sk.anirban@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0108.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CYXPR11MB8756:EE_
X-MS-Office365-Filtering-Correlation-Id: 9889c45f-a1d6-4edd-0caf-08df4a4f50ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|11063799006|261026121527099003|261028144727099003|56012099006|10067099003|261021123027099003|261026140227099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: GNiWcgbBnuR/hEuObe4c8IKdySWY55/GQZRhnYgC1E8b3Tpwr9LFZdFCOR/xoekT8EbA/tFOdaNFtJWrUoYZW27VhVZvUzc9gDAGFPw6xis9qxo4qBeq3nShuJD5ybZjo/JnPgg33WWkEysL6/ZU7X40IQlSmqMtEj+Hoi00kyspPTq7bVrSDtTBT7cAIgb197fkar7I9+cQDdz5CqjyTLtbwg020SOMcJDkcuhYASqkhAfozh4NsZMQQL5VaNth0stWxsV5CuugEi9xad84epKJ4aYovlES5xi+gi50bBPdFdd4EchhDz8s2OmQd5SWKWr6zgxpvsLjsbs0wYtjjy+jukLlFDVykuq0Iw9s7sJfeml0zgnpGljKV2JjNipERnUQj7jeIbl9xIbVKS7Qq5Hi9+VQZggXA1Ozbw192E32aIgv2fl64jIaz0gJlkIa+5NUM4r4SJ2a0XmHjNSpnz0+ikGgJIvhJ3BCtvTTofAm6iUg9PbWVtRND+FjfqNWbT5H5jetKWrbLxYnbdMCCMkaUO72GaCeDQzUSj3+uGBdRFChltBcXS+e8Nwu8L5cCyDaf46qK+uHpiqWE4Z8OM8MMVXxS5J2qnZgPlwMONFSJ5JZBXy3BZdi0gfGNrIw0CCbJ0gHZwtSqwBeG2eUI94roGw5iGm4WetUb6YWrTg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(261026121527099003)(261028144727099003)(56012099006)(10067099003)(261021123027099003)(261026140227099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RllDQUdIdEJlSWRMZ0xJVTRVSm02ZnV2MXNGZklTOVNjZ3RNL1FOOERFb1Zu?=
 =?utf-8?B?YmxEcEF4alVrQUhYQzVndEFoWDNFUXFRU0s2R25DWWROak5Da3VKRlJYR0Mx?=
 =?utf-8?B?Wi93djJTZXRtcEFUTCtPNXBNV1NWRGNXS1JRYXRvRDRabitVamM5K3JkbDJ0?=
 =?utf-8?B?MVc0UURjaGNobUVxTGthL0NaaXJxRldBRi9aY0w3NnNFS0gyQnZzYXpreUZD?=
 =?utf-8?B?cWdRWFZSWUxXSGxyZ1ZRS0hFVkNIZGpReDNMWFlsY2ZEL1VvbWZnSlRIakp3?=
 =?utf-8?B?N2Yyd2JTSW1VTlNoanZnNFQvekhxOUpjL09FOVpyc2I3djZndnFPSW5Ydmgw?=
 =?utf-8?B?TmMrNTVPTDJnYTltelM0MGRnczRhWW9acUxyazIxMGNuOWRRYnl3Y3BkRmJ3?=
 =?utf-8?B?aC9qNGw0QXh3SUYxaktoa3JWRzRZT2NYMDBSNjRwcTdNM0RtZDJIZFFqYkp2?=
 =?utf-8?B?UTNsZE9KUkc4VWdwQ2RhMjBkRS9lNC9HdFhnN1lIM29mQ3QraFgvL1d1dlU2?=
 =?utf-8?B?SS9Wdm4vRzBBd21SQzFSWHdUNDNVSmgxSnE0V0RvUkNhU2xhMk80QTg3UVFi?=
 =?utf-8?B?Zmh6UU1vR2NmUlpsMHQ0eFlpTUY1OUVGbmk5VXlSWitEL0JHb2p1VzJOWm9z?=
 =?utf-8?B?dnNmVDN2dFp6NlczZXBSR21DMEUxV3hWb1J3YUNhdFNzVTBIbndvMTFWTEhQ?=
 =?utf-8?B?M0hKaU91anFVOHNsSnpWR09HSGNXSUJ0M09YT1p3SDZjUWRtVEZnbmxsdFBH?=
 =?utf-8?B?dU40M3lwZWtIdzlUVWFTZy9BRHdIVmxubEdjNjZaaUM4dGhHTHhqZzJMNlJm?=
 =?utf-8?B?L2ZqdldYTDA2czdZWW9JcmZJUFluOW42MVYvRzRKN1dPZXE5aVZ3VkJ4TWlx?=
 =?utf-8?B?Ym5IYjE0a2dRdmRpd1pyS3BSWUtSSE1LOTZFN0c5R3lqQ1ZEQVdQZ2R3RkNl?=
 =?utf-8?B?TnBzVHBoWjRKY2pLbU9HRE1mMWh0WEdlMzlLTENHR1VmMHk2ekFUNkpKOUJX?=
 =?utf-8?B?L0ZXSFRKeUhEYTFpaFpTU1FKcTA4Q052WVRDeGxLVmxCKytUQ0dGaURod3I2?=
 =?utf-8?B?MkpkYTNFSzJjYm5JckY3MkNGOFBOL0JyVlJ1b3NxenpCR3JGOUNJcjRsNkxz?=
 =?utf-8?B?RlJQN1QvSjljaWVZMC81aEhKTDZjdnlVNGh0eUxreThoZEF0Mm95cThRVGpn?=
 =?utf-8?B?UHZsMkwvOS9RdkMzTmNpNnA3NlNra01qL1FOdDZBUkxtaEk1ZmxUZzcvZ3hv?=
 =?utf-8?B?MGtHcXNlbkFYQTNkTlgvNUY1UW8yNFNoTkxBYW5tUFpZb3g3eXhjZjBabENY?=
 =?utf-8?B?bWZXdG9USi9jN210T1p4SEdIR3kxaHg2Yi9nYk0yYnRyczI4ZCsxcTJDK0Nl?=
 =?utf-8?B?OWFLb0lWbk5BTURXMlZTM29jR1hZcG5CaEpMdzlLbWpvOEN1RXFjTERJSm5H?=
 =?utf-8?B?SW1VKzJyM3N6Q0ZiQXM4RjMrazlUZHZ5b2sxMG9yYStnNW1FUkIrcHYxZkpE?=
 =?utf-8?B?OXBiUVQyWkd1Rk9jUzh3Vm95U3dlSVZSWHRGem0vSXlrY2s5WGNDRkNwR1k1?=
 =?utf-8?B?VVIvSVkzNFJPelpoZ2xJRXpNWk1nRTk1a2lrQko3cGpnVWJMa24rUWV0UWxp?=
 =?utf-8?B?V0N2cTcrcVpnY1N2VllRcHFZc3BjS3llMHZFOERoOXE1WGZmQnlqbWphQ2oz?=
 =?utf-8?B?enlOUzMyM3VGbHpMVTBlWlErZHRBREl1YnVCQmVLVGxhckZVdTdPc0tNdXNn?=
 =?utf-8?B?SkswWCtUUWdlUWQ0aU5PTUFJclBnTkNHSmU1WDVqQW9JTGRYSHpJL1VxMWI3?=
 =?utf-8?B?VEdwVldhcnlhbTZHWlkycmtHRjdZVi9GVlNSenFKa2tnSyswMHpsKzlQdS94?=
 =?utf-8?B?WndtQVBGa2gyZTVMeEk3MXJUeGQ1bmkxZTZXVTVjZGtqTVF4ZWlvUmJaeWxk?=
 =?utf-8?B?RW9tazRtZmttdW9aV005YWVkS1ZsKzliTnRETXNJcVowMFdPMVFYSllnOXkr?=
 =?utf-8?B?NExPUHg4cmtxVGptL1RSaG9vUlVUWC9vaHZzeGRGcDJxWmZXOU1iZ29BSWxm?=
 =?utf-8?B?Q24rOUV0QjZMczYrSklDc1RFL29kVlQ1QkNpQk9DZm9tK0E5VnFydFl5b2pN?=
 =?utf-8?B?ZXAxUnJtVW12aUYxUlozdE8xbTRmZ3dET1QweTBwdWNxTEVXYmxGOHV6MWlD?=
 =?utf-8?B?aGE1MkNjZWNCeTZpU1NCbDFYdFU3cFdYbDFyMXR5MEZGOWdEWUxnaDdyNzZ0?=
 =?utf-8?B?NmZkUHQxNEFwQmpLZzM1TmZkVWhHQ2ZSb0lUTXJIcmFmWGNoL0ZtdWN6clcv?=
 =?utf-8?B?Ym5tSmpRRWxMVUNnRTNsRUlyZjNyNDV1UEkwQUJqQTVoblFvNDMzZz09?=
X-Exchange-RoutingPolicyChecked: XNJo+5Fl+du1BzExaR/+vSK7j46njv+g6eqFnGe1eCE67+C4CD05TQST/8xoPteSbNDrG57iIutZgN3kJFnqVXeClwcOVd1iebLOmoee4/nmqRZBL3P4178TP0ttrSFJiJkGsCG9/eLSXraz8bwZIcm3ni2vqaBLiYUrLqFm8lmQzmJhJrnkzaekYxz6y7Hw4Os1RgrPDQxAoq12OeOKeKra+3U1l8cnneKsLoRErYWzEr7ba/zubHJ6F0Y0WDsrrVIyl5m2X7gGOJ5bNgb388W7pwbQVdg7iy4TBZpFE6tKZa7agRmiPP+L1bZbXT0DpqXYITf5sU0jg7CWLE+Aww==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9889c45f-a1d6-4edd-0caf-08df4a4f50ef
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 17:21:03.2599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tPm8pjD5eJpfaypbp0Q/Jc/hs5XfDvI0USdoQZlYzYjwqLaF6PMuaiI6W4MkHurePlykPGJty4Tpv+BtGURfUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8756
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


On 19-11-2026 16:13, Sk Anirban wrote:
> AUX info register traversal can loop indefinitely when a register
> points back to itself. Avoid revisiting registers by reading each
> register once and collecting the entries that contain data.
>
> v2: Add fixes (Riana)
>      Modify loop (Riana)
>
> Fixes: 5e940312a2ac ("drm/xe: Add functions and sysfs for boot survivability")
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_survivability_mode.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 91a0680e449b..5fd40bc0dec0 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -168,12 +168,12 @@ static void populate_survivability_info(struct xe_device *xe)
>   			set_survivability_info(mmio, info, POSTCODE_TRACE_OVERFLOW);
>   	}
>   
> -	/* Traverse the linked list of aux info registers */
> +	/* Read all aux info registers and store the non-zero ones */
>   	if (reg_value & AUXINFO_SUPPORT) {
> -		for (id = REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
> -		     id >= AUX_INFO0 && id < MAX_SCRATCH_REG;
> -		     id =  REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, info[id]))
> -			set_survivability_info(mmio, info, id);
> +		for (id = AUX_INFO0; id < MAX_SCRATCH_REG; id++) {
> +			if (xe_mmio_read32(mmio, PCODE_SCRATCH(id)))


Do we need this read? survivability_info_attrs_visible and
log_survivability_info already do a valid value check.

Thanks
Riana

> +				set_survivability_info(mmio, info, id);
> +		}
>   	}
>   }
>   
