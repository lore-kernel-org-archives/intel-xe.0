Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1164B606A333
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 17:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GBHfMb4A
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB37210EAA4;
	Fri,  6 Nov 2026 17:43:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7ED510EAA1
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 17:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793986988; x=1825522988;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Yz7xkb2JY202rAGeBhi9MbAs2fsYF9iLRpEWy9j4Z6o=;
 b=GBHfMb4Agi78ptWFLAJ+leLFhik6SirjVfTQVuQIEliEMI5UJuPka0P9
 GLGg882E6/8JR1EhBbyX4xf0QNSGp9NgwmT7YQFOL17uRwYHj9VxxGNEp
 H3uExE0suuwXF2LVrVTmQqkxMG/cLvzB3C2zDoShAYBbqWX5Ha8bMDKZl
 flQM5JXuMg/O0ESBSiS8AqWiuWUOh3R8IqdJj4qHcWs4tyDhrPa5juunE
 qlIbDQVTslQ1gMx7UCwVgX8i1qkTKYIJjioWwVg442JrHSoyyDP2wTf3u
 vs7NXLifWc5Q59PKnWvpuBlr4StWMrVEUHQ9wcmNcMh079NvEumQ7kn4R g==;
X-CSE-ConnectionGUID: 8pFyEZmQRPWtApQWUoGvmw==
X-CSE-MsgGUID: HZu/8AdUT2aRo303nYP4QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2896395"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2896395"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 09:43:08 -0800
X-CSE-ConnectionGUID: UOR0qTV+Qfy6pc164Mus1w==
X-CSE-MsgGUID: 6lwruiyOSaWeHiiIdC9PgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7652444"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 09:43:08 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 09:43:06 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 6 Nov 2026 09:43:06 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 09:43:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yEjJYTVx+xAFOqCcDj4OXh0j5SVoA4RaeaVnGqdKhtvR3adnkARMz8o9odbEuqfp2y51aTL8fAqJQAKSYf/gRDy46GKMvJcpw90xkesl9cIEKySa3xnWSc7x8tZ7Ka7w6WDwRADu/VsSFFaSpoj3ratQhfC2TmUd4Tr+Bw2lIzZS/bHnaYMiet0H2QFkev5I/WO3ZBwxchHEkjXwZ3QYzEqXrPhGqePfMJdZwegBxZm35ykBFSVz4IHQsKPP85g5+FjGeclzVxqpDVBEGDW+nB+UxHWDSWFXwY6HArOTe7PhdDgq4WfXklQaslu9B594UKjsKdmqXEYyo3Y/QWtrZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kMiF+7bRf7QIQ9b4njZB4Kz5t59I/geGcZfmRkGnhE=;
 b=SiuQvRuKeQeEnRQz0NtMkXaHuQWUbVTq17bWvRtTgOabuRtBdCPkpJCLswWkKnP2LyobSHjgXNOsZlL2TZ0NdDPbs4kRtzEOwfJFinNg7f1JtNfzXz+MvEHcLcfK2Zqja3kfYK9PC4c7ZvT31+Sx13cXBu0qoacjxPj1JYQJfJGHmjfR9dDRXesvlPOuOxRf+9XYRZ7DlTwYYitgDKbeD7MTiMLptKKHyeDsIvkm9QW1fUzygvgcmzB8U4wkKF+KasV8lz3wARzHwoSURgwD741kKnrbeJUkoH+7nAuTsNpbFeGG/CV42S2zWfK13xEDylasdGKVT1szI5afDd9aIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by LY0PR11MB046905.namprd11.prod.outlook.com (2603:10b6:404:230::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 17:43:03 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 17:43:03 +0000
Message-ID: <d54b93d4-9492-4188-863a-e632ae5176cd@intel.com>
Date: Fri, 6 Nov 2026 23:12:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/13] drm/xe/cper: Prepare Intel CPER info records
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <daniele.ceraolospurio@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <arvind.yadav@intel.com>, <syed.abdul.muqthyar.ahmed@intel.com>,
 <nitin.r.gote@intel.com>
References: <20261023043422.681260-15-badal.nilawar@intel.com>
 <20261023043422.681260-28-badal.nilawar@intel.com>
 <auhAl1p1PBAcEaLg@black.igk.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <auhAl1p1PBAcEaLg@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0264.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::15) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|LY0PR11MB046905:EE_
X-MS-Office365-Filtering-Correlation-Id: e046099b-7262-47cf-9a70-08df3c2d6834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|261026130827099003|261026140227099003|5023799004|4143699003|11063799006|56012099006|261022113327099003|261021130227099003|261021133027099003|261022115727099003|261021123027099003|261022075727099003|261022105027099003|261021135927099003|261021121427099003|261009221227099003|261009223027099003|261026135527099003|261026121527099003|261102123227099003|261028144727099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 3QqRx5B9/yrbEWk8mbZskYe87RAGrkP0KPo9KaWnk6mc0JkhA78xz4849WoHMzQI9kZkOiyotwy+/whYhmhc9hFIQHVxU8UGBF4xYRAgYJNba2C/qnsFaJrKyjwoXqUenMaX/vGyecH7x1rI47WoT5kopq/fi4UrcC6d+yuSWdALt358NMA85dUWPYdr5BM07nbLyD/8hzkmZz6oTSMFLlZFtjYx+PK5BEmuM1B0tgoRYhmGCeK5YmrLlzz9sCiZjz63s81Xm9qi1vhytpmjQlC6u2kNm0c2Ql9FEqRw/T2D/qPlpAJtrjt1yBbI1VVekalfewQiZOegeCNX5T14g+P3ezg966lQuEyPlJszJmZvBQ7Jc7Zd2ggpPz2F36dnpmKGvLhgaUGJ7MR0OUwc/V7RwDNuXSrzlhSxrQm4LuFoC/HwR2Iw6VuGP/w1Tuxy3HLVSuAtdgpz01YEN4bu5HHf7zY9CW1OGt7yWs4ZWIYQMVpD7xURFTh5vdgmxyyvrloW5710oKTdvqNR1L6/DILx3It/d21Tu8/f7S1AZo8BqSPwJDa3HSokcnZ+097tC0ybdKH1KYDXvw1zY0gYh7RPvMY+hVR06mZ7jO2SkB5bu+9RNrDOOOHwYaLkRA+vkUSTM7ZtmbauF5ZrMzgqNTvi6c0762YOH00ojJTmUpY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(261026130827099003)(261026140227099003)(5023799004)(4143699003)(11063799006)(56012099006)(261022113327099003)(261021130227099003)(261021133027099003)(261022115727099003)(261021123027099003)(261022075727099003)(261022105027099003)(261021135927099003)(261021121427099003)(261009221227099003)(261009223027099003)(261026135527099003)(261026121527099003)(261102123227099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTI5NU9ERUlKeWFrMU1yUkozRkFWWVdnVVZvZnZXY2tLbE9COWx6WmNWeTR1?=
 =?utf-8?B?WkNVaDZNc1lLRkRkTU4xVkRORGxQdlY1YUY4dEZJRU1uL1ZsQ0dGL2JiYmQ4?=
 =?utf-8?B?TGtJL24wNnlUc2F2VERCOVl1QzNWTkEwZmJHbnBzcER2UkJYYnhYWVdPcWhH?=
 =?utf-8?B?UVNvOHJFZlhJVVp5Rjh5TTYySzBPYVloOUNNV2JjcjJDLzR4ejY3UHQyZDFQ?=
 =?utf-8?B?ei9rRkwxNmNNQVRwMm5idU5STXdvaFA1NnVoV21tSVlmcXJGNUhTSTJjdStm?=
 =?utf-8?B?bThKbEE3UkVwU3p0b24vQVJFdGMwRHEwUVE1aWZ2a1R0c1I3WkVPNFVaQmdU?=
 =?utf-8?B?Vmo3aVN4YndHS04zN0dnNWVabnpuNGpSaVdRNENpU0lnMzd4dFpwdGpINjJp?=
 =?utf-8?B?VkdBM0RkNjE5aEMrZkxLUjlvZ0RGL3l6L0JmdFFVVVA0WTdSN1ljTlIwaUcz?=
 =?utf-8?B?YjJxNXE1V0xtR0N0bTl1aTV3dy9FNWtpd3VxNGNHb1lsenh3UmRJRXBlTFR6?=
 =?utf-8?B?K3pORW55V0llcHIycXhqTFdoSXlUeTJMNXJLaDduMERMdUl1dzlVT3F4YWtQ?=
 =?utf-8?B?ejV3dlNYdGo0STF4TXF3amNmTkQ2enZxV2J1dk9HRitwUEZqWDE3UHdOOUdr?=
 =?utf-8?B?QUYrL21KajUrYlAvMDVXYmRRN1c1Mi9lWWxENUtsb3R3OWQrcEJCaWN3RVdV?=
 =?utf-8?B?bzJoWWJKbGNHMUFsbERFSU85U3VvcktQbk9reEdQdEVzVGZrZzlxRTIwN0Zs?=
 =?utf-8?B?VmRoUWo2Wm5BNHdyRmthL2xVSG9kblI2VElsWGN4bmdYRmlXbGgvNDBnVnJy?=
 =?utf-8?B?TENwVFYydFM0V0JuK1JjTUZUL2xNN0RBVys2UU5GVFppNi9DaTIzVHZsYVkr?=
 =?utf-8?B?WmdoRWpRVFByd3JCeGJESVF0Qm1qbDlVNXppOG1TUU1YTlVuRlVYMkw5YlJu?=
 =?utf-8?B?UUN1MExjWDFHZlhjMUFEK0Z6UlN0NkRWcXBKN1pvc0Q3WXUrazVpbG93UzlI?=
 =?utf-8?B?RjFTcE0yUFdqMXVkSFZaR0RqQytSZ3F3Zmk2UDdnQlJ5K1ExemFmaFl1b01X?=
 =?utf-8?B?UWtXTWtWQ012YWpPTjV4RmFscTBpb3dPcnhPWE1jVkRqY2FBdUw3S1diN0x6?=
 =?utf-8?B?MEozaktDUW9RdW04UUNsVlRZMHBOU0VjVDBaWnpRR245OXptWnVqaHVsODV0?=
 =?utf-8?B?eWtnWHRBVmFYbUtMSXppSVUzVm05dVgxaUhiQ29TS01wcDZkVU5DREwzbnZQ?=
 =?utf-8?B?aVBNM3k4dWN2SHpnWXVaYlZxbjlsZks4UTJ4Q1BIUklISXFhUkZXMlhDTGxG?=
 =?utf-8?B?eHdjSytGNDJ4Q1VUQnJkOEZ4NjhteEpvSW5Vd1N6dFlwZXNXNzJPUStCNzdL?=
 =?utf-8?B?MlFPTTZtMC9td3dtQmhWNFVNL08vYXNXQVdxZFcrZkM1ZXM0Wk9RbFZDZzky?=
 =?utf-8?B?Y3MwVDRUaUxjbDhRbWtTMldlWkNqYlR1UmwyQzhIQmFNUDFBT0YyejB1RWNo?=
 =?utf-8?B?OVdIMzFPeXRuZEhITGlqdUNXejVkWXAzVEp0VnlZejFFa0ZteHNPOCtPZ3VV?=
 =?utf-8?B?MjNGREo2Y1dMeFFDSmZWendMdzAyeUowdjEyYzVIblNoSUdPSzJ0OGZORlhQ?=
 =?utf-8?B?cVk4NlkxRWVRZ3VURE1VRUE0R0JKbTViYWsyU1FPWm1PNmpTenB3dmhLWU1F?=
 =?utf-8?B?ejFXL0gvdlNXblFVZlZMdVVZdTRwcXliNlV0V3hQbVlWYzJHQkE2NnFnb3Ev?=
 =?utf-8?B?MzJUZnhpWVVDYmNFTFVnWk5heDArMHYxazBtek1iSEZ5VHBDNDZJcVpBZ3Nq?=
 =?utf-8?B?V3czMzQ4Y2lPS29tZmFTUmhocHRJL1dkM0dOdW9PT0VrRW9wa3ZhbmFtWXpH?=
 =?utf-8?B?b1BTVVdVZkE4NzhhN1FFemwwR3lOM2dLVlBjWDl0UHJneXlpMnc4Q05leXRX?=
 =?utf-8?B?QWl1aWJ3YWpKMWNkMlBFMDFOQUZEZUdhM0pZeVBVU242YzgxTHJxUEtqUVVL?=
 =?utf-8?B?MEwwMmRUbENQUGV0cW14Tm1aeG95TVhXZU4vMlFnVUpOd0w5dzY5Q04rQjht?=
 =?utf-8?B?Z08ydEZ3c0VaeS9ZTHFwSEtEcVhLZkI0NnZRVFEvWktYMVUwcTdHZ01FYmVB?=
 =?utf-8?B?MjJ6cTZYalNIRmRLY0x4MTR3dE5vZlJIZGRkaThQMktENVVjOTBiNjZNZDE1?=
 =?utf-8?B?eEcxdDQwOFJGS1lOWVJaMC9XTWNuancvUFprV01XZktOQ2ZsTlZVNDhycGk5?=
 =?utf-8?B?ZXdOODFtSCs5aTJLRG1aa2hwZDdKSE0zQXpjdU90WFcvMXZnbVkrWmNDNGlm?=
 =?utf-8?B?UDNSWm1WQUJoK2piUngyNWdaVWI4OTRDKzZ4SUR0aTJyTHBPdHZvdz09?=
X-Exchange-RoutingPolicyChecked: xhi7YIDSnL65/WPXbVvvWej5zzY6p+n15ufn9FbMcsZbXQy4HNuz7tDH5C6HE7gfzXRzKDxZaHIulX+1ekZh28E3ClrkII7d7tB0wRPtxp45uQBX7wpJT2ZJi8nD6brgBri3gGYpLrCbMotCdraBObL89mxDkpnvTDnvHOUxd/HeKJl+bRYMUfweUtMVJ1Z2e1FIgwhVK+bQdmcUGuGPsZoMMMFYUxYxZ7skDenb1n15zOUDPLbcwgOYAXNW8hoa0VLrFRhtFRteJhJSCCA++Nk9sGbm2d0xHjlKi5NYaU5JiyHHTV2mTUSwVe7jG8fSvLaK76xVxS6DOM1mG6MExA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e046099b-7262-47cf-9a70-08df3c2d6834
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 17:43:03.0588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 56vECyzY+3yI2ofLcKGxrJFmYfYIwM1AygaoKGgVzKksGKLjHqcThpqtcZgmpMPNrAqGDem8VSWyJlAfHN6XYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR11MB046905
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


On 02-11-2026 13:19, Raag Jadav wrote:
> On Fri, Oct 23, 2026 at 10:04:35AM +0530, Badal Nilawar wrote:
>> Prepare xe_cper_intel_info records from RAS info queue data. Depending
>> on the error class type, detail or aggregate, one or more info records
>> may be generated and embedded in the CPER record.
>>
>> Assisted-by: LLM
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>> v5:
>>   - Simplify CPER info and event queue naming, and use size consistently
>>     for byte-size fields (Raag)
>>   - Add and handle info_log_size in cper intel header
>> v4:
>>   - Move struct xe_cper_einfo_entry to xe_cper_types.h (Raag)
>>   - Use kzalloc_flex()/kzalloc_objs() (Raag)
>>   - Allocate info queue buffer from reported total size (Raag)
>> ---
>>   drivers/gpu/drm/xe/xe_cper.c       | 247 ++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_cper_types.h |  54 ++++++-
>>   drivers/gpu/drm/xe/xe_ras_types.h  |  25 +++
>>   3 files changed, 318 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
>> index cb4a15a036ac..0d04a85cb1af 100644
>> --- a/drivers/gpu/drm/xe/xe_cper.c
>> +++ b/drivers/gpu/drm/xe/xe_cper.c
>> @@ -89,7 +89,7 @@ static u64 cper_timestamp_now(void)
>>   static void cper_init_intel_hdr(struct xe_device *xe,
>>   				const struct xe_ras_error_class *counter,
>>   				u64 first_timestamp, u32 sig_id, u32 error_count,
>> -				struct xe_cper_intel_hdr *ihdr)
>> +				u32 einfo_size, struct xe_cper_intel_hdr *ihdr)
>>   {
>>   	ihdr->counter = *counter;
>>   	ihdr->validation_bits |= XE_CPER_VALID_LOCATION;
>> @@ -105,6 +105,7 @@ static void cper_init_intel_hdr(struct xe_device *xe,
>>   	}
>>   
>>   	ihdr->error_count = error_count;
>> +	ihdr->info_log_size = einfo_size;
>>   
>>   	strscpy(ihdr->pci_bdf, pci_name(to_pci_dev(xe->drm.dev)), sizeof(ihdr->pci_bdf));
>>   	ihdr->validation_bits |= XE_CPER_VALID_PCI_BDF;
>> @@ -200,6 +201,212 @@ static void cper_record_emit(struct xe_device *xe, u8 severity,
>>   	kfree(rec);
>>   }
>>   
>> +/* Entries built from RAS error logs carry fixed-size error_details */
>> +#define XE_CPER_RAS_LOG_ENTRY_SIZE \
>> +	(offsetof(struct xe_cper_intel_priv_event, metadata) + \
>> +	 sizeof_field(struct xe_ras_error_log, error_details))
> Move this to the top of xe_cper_types.h.
>
>> +static struct xe_cper_intel_info *
>> +build_einfo(const struct xe_ras_error_log *logs, u32 num_logs,
>> +	    const struct xe_ras_error_class *ec, u32 error_count)
> 'counter' for consistency.
As suggested in later comment, will maintain error_count.
>
>> +{
>> +	struct xe_cper_intel_priv_event *entry;
>> +	struct xe_cper_intel_info *einfo;
>> +	u32 queue_size, i;
>> +
>> +	queue_size = num_logs * XE_CPER_RAS_LOG_ENTRY_SIZE;
>> +	einfo = kzalloc_flex(*einfo, queue, queue_size);
>> +	if (!einfo)
>> +		return NULL;
>> +
>> +	einfo->error_count        = error_count;
>> +	einfo->queue_size	  = queue_size;
>> +	einfo->queue_count        = num_logs;
>> +	einfo->counter		  = *ec;
>> +
>> +	entry = (struct xe_cper_intel_priv_event *)einfo->queue;
>> +	for (i = 0; i < num_logs; i++) {
>> +		entry->size       = sizeof_field(struct xe_ras_error_log, error_details);
>> +		entry->timestamp    = logs[i].timestamp;
>> +		memcpy(entry->metadata, logs[i].error_details, sizeof(logs[i].error_details));
>> +		entry = (void *)entry + XE_CPER_RAS_LOG_ENTRY_SIZE;
>> +	}
>> +
>> +	return einfo;
>> +}
>> +
>> +static void free_einfo_arr(struct xe_cper_einfo_entry *einfo_arr, u32 count)
>> +{
>> +	u32 i;
>> +
>> +	for (i = 0; i < count; i++)
>> +		kfree(einfo_arr[i].einfo);
>> +	kfree(einfo_arr);
>> +}
>> +
>> +static bool fill_einfo_entry(struct xe_cper_einfo_entry *entry,
>> +			     const struct xe_ras_error_class *counter, u32 count,
>> +			     const struct xe_ras_error_log *logs, u32 num_logs)
>> +{
>> +	entry->einfo = build_einfo(logs, num_logs, counter, count);
>> +	if (!entry->einfo)
>> +		return false;
>> +
>> +	entry->einfo_size = struct_size(entry->einfo, queue,
>> +					entry->einfo->queue_size);
>> +	/* The first log is the first occurrence of the error */
>> +	entry->timestamp = logs[0].timestamp;
>> +	entry->hdr.counter = *counter;
>> +	entry->hdr.count = count;
>> +	return true;
>> +}
>> +
>> +static u32 build_detail_einfo(const struct xe_ras_error_class *counter, u32 count,
>> +			      const struct xe_ras_error_log *logs, u32 num_logs,
>> +			      struct xe_cper_einfo_entry *einfo_arr)
>> +{
>> +	/* All logs belong to the queried class; the error count may exceed the logs kept */
>> +	if (!num_logs)
>> +		return 0;
>> +
>> +	num_logs = min_t(u32, num_logs, XE_RAS_NUM_COUNTERS);
>> +
>> +	return fill_einfo_entry(&einfo_arr[0], counter, count, logs, num_logs) ? 1 : 0;
>> +}
>> +
>> +static u32 build_aggregate_einfo(struct xe_device *xe,
>> +				 const struct xe_ras_info_queue_dynamic_counter_hdr *hdrs,
>> +				 u32 num_hdrs, const struct xe_ras_error_log *logs,
>> +				 u32 avail_logs, struct xe_cper_einfo_entry *einfo_arr)
>> +{
>> +	u32 log_offset = 0, count = 0, i;
>> +
>> +	for (i = 0; i < num_hdrs; i++) {
>> +		/* @count is the error count; firmware logs at most XE_RAS_NUM_COUNTERS */
>> +		u32 num_logs = min_t(u32, hdrs[i].count, XE_RAS_NUM_COUNTERS);
>> +
>> +		if (num_logs > avail_logs - log_offset) {
>> +			xe_warn(xe, "CPER: header[%u] claims %u logs but only %u remain\n",
>> +				i, num_logs, avail_logs - log_offset);
>> +			break;
>> +		}
>> +
>> +		if (!num_logs)
>> +			continue;
>> +
>> +		if (!fill_einfo_entry(&einfo_arr[count], &hdrs[i].counter, hdrs[i].count,
>> +				      &logs[log_offset], num_logs))
>> +			break;
>> +
>> +		log_offset += num_logs;
>> +		count++;
>> +	}
>> +
>> +	return count;
>> +}
>> +
>> +/**
>> + * cper_prepare_einfo() - Build the CPER error info records from RAS info queue data
>> + * @xe: xe device instance
>> + * @counter_resp: counter response containing the first embedded chunk
>> + * @counter: RAS error class used to populate the einfo error_class fields
>> + * @count_out: output number of entries in the returned array
>> + *
>> + * Assembles the complete raw info queue data from the first chunk already
>> + * embedded in @counter_resp and any additional chunks fetched via
>> + * GET_INFO_QUEUE.  Two use cases are supported based on num_headers in
>> + * the info queue header:
>> + *
>> + * Detail error counter (num_headers == 0)::
>> + *
>> + *   [xe_ras_error_log * N]
>> + *
>> + *   Returns one xe_cper_einfo_entry covering up to XE_RAS_NUM_COUNTERS logs.
>> + *
>> + * Aggregate error counter (num_headers > 0)::
>> + *
>> + *   [xe_ras_info_queue_dynamic_counter_hdr * num_headers]
>> + *   [xe_ras_error_log * N]
>> + *
>> + *   Returns one xe_cper_einfo_entry per header. Each header's @counter
>> + *   identifies its error class, and @count gives its error count. Up to
>> + *   XE_RAS_NUM_COUNTERS xe_ras_error_log entries are associated with each
>> + *   header, and @counter populates the entry's einfo->error_class.
>> + *
>> + * Returns: allocated xe_cper_einfo_entry array on success (caller must free it
>> + *          with free_einfo_arr()), NULL if no info queue is available or no
>> + *          error info could be built. @count_out is set to the number of
>> + *          entries in the array, or zero when returning NULL.
>> + */
>> +static struct xe_cper_einfo_entry *
>> +cper_prepare_einfo(struct xe_device *xe,
>> +		   const struct xe_ras_get_counter_response *counter_resp,
>> +		   const struct xe_ras_error_class *counter, u32 *count_out)
>> +{
>> +	const struct xe_ras_info_queue_header *first_qhdr = &counter_resp->first.header;
>> +	struct xe_cper_einfo_entry *einfo_arr = NULL;
>> +	const struct xe_ras_error_log *logs;
>> +	u32 buf_size, raw_total, num_headers, headers_size;
>> +	u32 avail_logs, count = 0;
>> +	u8 *raw_buf = NULL;
>> +
>> +	*count_out = 0;
>> +	if (!counter_resp->has_info_queue)
>> +		return NULL;
>> +
>> +	if (!first_qhdr->total_size) {
>> +		xe_warn(xe, "CPER: info queue reports zero total size\n");
>> +		goto out;
>> +	}
>> +
>> +	if (first_qhdr->total_size > XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE)
>> +		xe_warn(xe, "CPER: info queue size %u exceeds max %u, truncating\n",
>> +			first_qhdr->total_size, XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE);
>> +
>> +	buf_size = min(first_qhdr->total_size, XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE);
>> +	raw_buf = kzalloc_objs(*raw_buf, buf_size);
>> +	if (!raw_buf)
>> +		goto out;
>> +
>> +	raw_total = xe_ras_drain_info_queue_raw(xe, counter_resp, raw_buf, buf_size);
>> +	if (!raw_total)
>> +		goto out;
>> +
>> +	num_headers = first_qhdr->num_headers;
>> +	headers_size = num_headers * sizeof(struct xe_ras_info_queue_dynamic_counter_hdr);
>> +	if (headers_size > raw_total) {
>> +		xe_warn(xe, "CPER: aggregate headers size (%u) exceeds raw total (%u)\n",
>> +			headers_size, raw_total);
>> +		goto out;
>> +	}
>> +
>> +	logs = (const struct xe_ras_error_log *)(raw_buf + headers_size);
>> +	avail_logs = (raw_total - headers_size) / sizeof(*logs);
>> +
>> +	einfo_arr = kzalloc_objs(*einfo_arr, num_headers ?: 1);
>> +	if (!einfo_arr)
>> +		goto out;
>> +
>> +	if (num_headers)
>> +		count = build_aggregate_einfo(xe, (const void *)raw_buf, num_headers,
>> +					      logs, avail_logs, einfo_arr);
>> +	else
>> +		count = build_detail_einfo(counter, counter_resp->value,
>> +					   logs, avail_logs, einfo_arr);
>> +
>> +	if (!count) {
>> +		kfree(einfo_arr);
>> +		einfo_arr = NULL;
>> +	}
> I'm seeing atleast two functions here.
>
> 1. Figure out buf_size, allocate buf and drain info queue.
> 2. Figure out header_size, allocate info_arr and do all the num_headers
>     magic.
Sure
>
>> +out:
>> +	kfree(raw_buf);
>> +	*count_out = count;
>> +	if (!einfo_arr)
>> +		xe_warn(xe, "CPER: failed to build error info from info queue, emitting record without it\n");
>> +
>> +	return einfo_arr;
>> +}
>> +
>>   /**
>>    * xe_cper_emit_counter() - Emit CPER records for an already fetched error counter
>>    * @xe: The &xe_device
>> @@ -208,19 +415,47 @@ static void cper_record_emit(struct xe_device *xe, u8 severity,
>>    * @counter: RAS error class
>>    * @response: Counter response returned by firmware for @counter
>>    *
>> - * Build and emit a CPER record from @response.
>> + * Build and emit CPER records from @resp, including any info queue data.
>> + * Must be called from a sleepable context with a runtime PM reference held.
>>    */
>>   void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
>>   			  const struct xe_ras_error_class *counter,
>>   			  const struct xe_ras_get_counter_response *response)
>>   {
>> -	struct xe_cper_intel_hdr ihdr = {};
>> +	struct xe_cper_einfo_entry *einfo_arr = NULL, *entries;
>> +	struct xe_cper_einfo_entry single = {};
>> +	u32 einfo_count = 0, count, i;
>>   
>>   	xe_assert(xe, is_hw_sigid(sigid));
>>   
>> -	cper_init_intel_hdr(xe, counter, response->timestamp,
>> -			    sigid, response->value, &ihdr);
>> -	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr, NULL, 0);
>> +	/* Draining the info queue sends sysctrl commands */
>> +	might_sleep();
>> +	xe_device_assert_mem_access(xe);
>> +
>> +	/* Without info queue data, emit a single record from the counter itself */
>> +	single.hdr.counter = *counter;
>> +	single.hdr.count = response->value;
>> +	single.timestamp = response->timestamp;
>> +	entries = &single;
>> +	count = 1;
>> +
>> +	einfo_arr = cper_prepare_einfo(xe, response, counter, &einfo_count);
>> +	if (einfo_arr) {
>> +		entries = einfo_arr;
>> +		count = einfo_count;
>> +	}
>> +
>> +	for (i = 0; i < count; i++) {
>> +		struct xe_cper_intel_hdr ihdr = {};
>> +
>> +		cper_init_intel_hdr(xe, &entries[i].hdr.counter, entries[i].timestamp,
>> +				    sigid, entries[i].hdr.count, entries[i].einfo_size, &ihdr);
>> +
>> +		cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr,
>> +				 entries[i].einfo, entries[i].einfo_size);
>> +	}
>> +
>> +	free_einfo_arr(einfo_arr, einfo_count);
>>   }
>>   
>>   static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
>> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
>> index 107688b17d17..3252e89f64cd 100644
>> --- a/drivers/gpu/drm/xe/xe_cper_types.h
>> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
>> @@ -69,14 +69,50 @@ struct xe_cper_intel_hdr {
>>   	/** @fw_id: Firmware version string (GFSP+PCODE+CSC+GUC or MNG+NUC+RAS+GUC) */
>>   	char fw_id[256];
>>   	/** @reserved: Reserved for future use, must be zero */
>> -	u8 reserved[5];
>> +	u8 reserved[2];
>> +	/** @info_log_size: Size of xe_cper_intel_info */
>> +	u16 info_log_size;
>> +	/** @reserved1: Reserved for future use, must be zero */
>> +	u8 reserved1;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_cper_intel_info - Variable-length Intel GPU error payload
>> + *
>> + * Appended after &xe_cper_intel_hdr when detailed error information
>> + * is available.
>> + */
>> +struct xe_cper_intel_info {
>> +	/** @counter: Error class (severity, component, location, cause) */
>> +	struct xe_ras_error_class counter;
>> +	/** @error_count: Total number of errors recorded */
>> +	u32 error_count;
>> +	/** @queue_size: Total byte size of the @queue array */
>> +	u32 queue_size;
>> +	/** @queue_count: Number of entries in @queue */
>> +	u32 queue_count;
>> +	/** @queue: Packed array of &xe_cper_intel_priv_event records */
>> +	u8 queue[];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_cper_intel_priv_event - Single event in the event queue
> Looking at the above struct, perhaps 'xe_cper_queue_entry' would be more
> suitable for this. Also avoid introducing random terminologies (like 'event')
> to make things less confusing throughout the code and documentation.

event is error event,  is cper terminology from spec.

As discussed offline I will rename this to xe_cper_intel_event, it 
represents one error event from event_queue.

Will retain event_queue_* member names in info structure.

This patch populate the cper event queue from RAS info queue data.

>
>> + */
>> +struct xe_cper_intel_priv_event {
>> +	/** @size: Byte size of the @metadata payload */
>> +	u32 size;
>> +	/** @timestamp: Timestamp of this event, in firmware ticks */
>> +	u64 timestamp;
>> +	/** @metadata: Event-specific payload bytes */
> Please also reference the payload contents (if taken from another struct).
Sure.
>
>> +	u8 metadata[];
>>   } __packed;
>>   
>>   /**
>>    * struct xe_cper_nonstd_record - Intel GPU CPER record
>>    *
>>    * Contains the standard CPER record header, section descriptor, and the
>> - * Intel error section header.
>> + * Intel section header. A &xe_cper_intel_info payload may be
>> + * appended dynamically.
>>    */
>>   struct xe_cper_nonstd_record {
>>   	/** @record_hdr: Standard CPER record header (UEFI Appendix N.2.1) */
>> @@ -101,6 +137,20 @@ struct xe_platform_id_entry {
>>   	guid_t    platform_id;
>>   };
>>   
>> +/**
>> + * struct xe_cper_einfo_entry - One CPER error info payload and its source counter
> s/einfo/info for simplicity (in all other places where applicable).
>
>> + */
>> +struct xe_cper_einfo_entry {
>> +	/** @hdr: Error class and counter value used for the CPER section header */
>> +	struct xe_ras_info_queue_dynamic_counter_hdr hdr;
>> +	/** @einfo: Allocated info payload, NULL if none */
>> +	struct xe_cper_intel_info *einfo;
>> +	/** @einfo_size: Byte size of @einfo including the event queue */
>> +	u32 einfo_size;
>> +	/** @timestamp: Timestamp of the first occurrence of this error class */
>> +	u64 timestamp;
>> +};
> Shouldn't this be __packed? If yes, also group it with other __packed
> structs.
Not required.
>
>>   /**
>>    * struct xe_cper - Xe CPER state
>>    */
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
>> index 67d57182aac9..903a122e468e 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -171,6 +171,31 @@ struct xe_ras_info_queue_data_response {
>>   	u8 data[XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE];
>>   } __packed;
>>   
>> +/**
>> + * struct xe_ras_info_queue_dynamic_counter_hdr - Aggregate counter header entry
>> + *
>> + * When a session requests aggregate counter data, one header per matching
>> + * dynamic counter class is prepended to the queue data. The @counter field
>> + * identifies the error class, and @count is its error count; at most
>> + * XE_RAS_NUM_COUNTERS error log entries follow for it.
>> + */
>> +struct xe_ras_info_queue_dynamic_counter_hdr {
>> +	/** @counter: Error class associated with this counter group */
>> +	struct xe_ras_error_class counter;
>> +	/** @count: Error count of this class */
>> +	u32 count;
> 'error_count'. I realized this will help remove a lot of comments above.
Sure
>
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_error_log - Single error log entry following dynamic counter headers
>> + */
>> +struct xe_ras_error_log {
> Why can't struct xe_ras_error_array be reused here?
Lay out is different and it has additional members.
>
>> +	/** @timestamp: Timestamp when the error was recorded */
>> +	u64 timestamp;
>> +	/** @error_details: Error-specific details */
>> +	u32 error_details[16];
> 'details'. Also, why 16? Does this signify XE_RAS_NUM_COUNTERS? If yes,
> please reuse it. If no, please define its own macro.

Sure.

Badal

>
> Raag
>
>> +} __packed;
>> +
>>   /**
>>    * struct xe_ras_get_info_queue_request - Request for XE_SYSCTRL_CMD_GET_INFO_QUEUE
>>    */
>> -- 
>> 2.54.0
>>
