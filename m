Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB74FC79F82
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 12:55:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CD810F91E;
	Fri,  4 Sep 2026 12:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KcGwy5iT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F7B10F91E
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 12:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788526524; x=1820062524;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PRn/h5DwpLbpzJNAGmnQpEIbb5P6YjXmckHli0pJrPg=;
 b=KcGwy5iTcjv82AJkAhi908rusmPfAkWfUkHxqo+dJAJxMIYxOUFzpZT6
 dP58jWQKCCZXOQnj58KqcOOyDbedcHUcRKx7Eh5m1jI0KGFGSSugsZrBB
 wQjluNKkzv72tEDwstb3XnH5gSTGkjtNhIsKKZYJsYJEzwBGup/73UE/3
 kSCogW5JROs4NLExAKUImYe2wue6VjkM8TRkI3D+6MuYJLVJ0G+n6XOUs
 U1j76kq7I6fz3i1hnF7Ee+GNv+f5t/9/biovvgA8pFYco8fvBHYvp9pZX
 LsKFZID8Vrxdx629DEDr1eafpuBN7lDNDPHYhys6eTfkXk2h+Mzjy3w81 A==;
X-CSE-ConnectionGUID: zkozBLObQ++rOC9WN8UFhA==
X-CSE-MsgGUID: hXnRkONDTEKTOvROGx1xRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92846540"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="92846540"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 05:55:24 -0700
X-CSE-ConnectionGUID: HADyvY13SgqjM28qT5RHAw==
X-CSE-MsgGUID: wd9nVip/QWWfnrbs+yqhLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="275314585"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 05:55:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 05:55:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 05:55:22 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 05:55:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yaUaZq1GKmeBR30SUtn0Dc1tslhIlGbrjibpem/m5ht+OV4J3VDmdi04JuNulxN2grgpLFQDkKafie6Ad7sP05NOt0nOck6gzKxXhHgkSiWIHmYxWGUWVcsieGLIhYaPLCjVHWrnTGWDaOnFRozskF210T3V9Iiav2xj3lfu4RVUinn3R9Tynz7JTTedfgEV1tJthHs3CruBtKN/gLTTVFDEd6BdMKyaQx7CEILjWt6qXkBcHjPTdlOBhVKhOjawXj7d2BJk/cUJsEljvS/k68XiGr80p2cZyVRByAGUkt2y487bn4DaFZjQbULwxZObLaDnpADQNqVlT2ll5s6b7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7KhhdvKc4n9U++Esv0prEsjPU6YHK3akuUf8tAzEZA=;
 b=x9KYKanP1b5VYmpPC5JjXjcoHMPHtJ4mIlarpQaLq0UFBOYYpoOfFpZo3K9XjYIDBwz51tzwLGXbxAkYK1xotmMjI7FuHyk8MX3pOvlkTB05BCPM6VsquC9bv1yUvIWPJfObNhPYG4P+YetwzcYNF7fcCfLoPhY2JAcUw1WPtrGd+QFyIHz5/gDeAjBrkalTc3w+bFyMJxLE/OY+TtGuyAhGIyTGQRQqQRr5+NBy1LA8D3DQRyKbMUkoRFmXgltX7hQWC0MQjp1BwmLeneh05+9TluPnTG1BJOdS7GlRLZsjVG7k4CM+StxJxNRhGPxu1O6b3AJy4JYV03m5K3cBLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by LVXPR11MB9707.namprd11.prod.outlook.com (2603:10b6:408:386::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 12:55:21 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 12:55:20 +0000
Message-ID: <f0f541be-da13-4d76-b515-2c359f9da33c@intel.com>
Date: Fri, 4 Sep 2026 18:25:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] drm/xe/xe_ras: Handle page offline requests for
 device memory ecc errors
To: "Tauro, Riana" <riana.tauro@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, <tejas.upadhyay@intel.com>,
 <himal.prasad.ghimiray@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20260825063615.3697317-7-riana.tauro@intel.com>
 <20260825063615.3697317-9-riana.tauro@intel.com>
 <17780d34-b06b-4db7-888e-e3734530ae31@intel.com>
 <d16a1fc8-2524-4ad5-90b5-e943f112c4a2@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <d16a1fc8-2524-4ad5-90b5-e943f112c4a2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::11) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|LVXPR11MB9707:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bec0eed-1204-4fb3-707c-08df0a83c6ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|18002099003|22082099003|11063799006|4143699003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: m5dzD7P6/Gnsm63e24CNfnRUeRaL/RXe9lMWvI9PnN44c1vpkfuT0WfKBZvN3CHulZJ/Qi8iU+KExBgFjh0SLeAYaXeDCzseFRR9rl5wsxnOXmPmrDlKPhYZ9P/tV/rPBtfL5qAujyTQv9MckA2kiZbzH34uDjgya9HylZ59N5qBapZ0ioXtSkFRctuQEHWymjCSm87SumV6ZkBO79FJK8PcPJZ+pmLXM2EuIOd451iYyjJ+PFdOcLi/SaXD+iWplFmmduNYoOlXpdVqV/d8ZYm9beIo3VXXFXRoOYVPltYGsh/s/zQsNqyjT7oDl6TSeN6rsER4lvZLLyrtgO1hbH2qm6azmm6VOgpoP4DNTQ5nWh8Rjdx0DlAI/5RRcqNVy9QeaS+wdBn76zIwpZwQESb/5x0c4ZfyAY2a8eOzdW9tlCDre7MAq5MdGYycViTkcP+y9JgITDd8bCDu2R47fpwZ44s0NJ9XRofQfDnJe6R48QqoGwJdxkBsxrw8LXZZpBo4UeV/HVuWE4ksxXBQ+u/UJoNCDd0xHiBlZpBLldCnRhk2DWBtdPFPMAiFd3Jz+DSvWPiAKKUcNBP1lKNTtuY1jQdGmEhlndg97TPzWk5NpGX9dHa2CMXAcNJe5E//XbwcN9oUdPfKjZKYtclRa5F6o3wI6OHPEh6+r2rClsM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elYrSHQrR1hRaGdtRjQwRGNNU20xTldqdjlURnllL0lGTStMbHVXNkFSY0o4?=
 =?utf-8?B?ZWlSaDkvMnJJZFBKMzBrSmxwKzlWVCtTYjQ0YjlpZGwwNGJyclhkN21VK1Fl?=
 =?utf-8?B?cTliVEZYdVlpWVJBZlpWeFdEaXhpc2RqR043U3VjbHo2NFhhVkUwUldEb21j?=
 =?utf-8?B?dHN2d2IwY2RpVk16L0FpejBtUmtseFpTZUlRUGdNQ1dxVGpDTCtYRzFYT1Ey?=
 =?utf-8?B?Q08yd3A3VUlMTVpkcGtrZjBKdWlDdDY2TTQ4bHlTR3dKZEFuMEFLQVpzV1lp?=
 =?utf-8?B?aDFmZWpteEtCNENVUml0c2lvZFpsTnI4Q1QrZHpjWTRWN0pLbGtYbUpFck1E?=
 =?utf-8?B?L2NDclE5MkZJWE1INmtZT0xTSTlEb2ozb1g2YmRsTnQ4OURNajEvOWM2VUZ3?=
 =?utf-8?B?QWRzRy9NZ2Q0WStQWXIxM0RrbjI0S2phTHl2QU5La3Q1L1UxQ1pFczVQb3M0?=
 =?utf-8?B?TkZFQ1pPWWR1WmJIUy9HMWl6M25Tck5SSFVFZFMzUE9DZTFiV3U4TDIrUGNk?=
 =?utf-8?B?STZuaU01VS9vUE8vSU5QdVduYkhlV29jd2FvSmhWZDJxaWhpRjB2b21oQXlS?=
 =?utf-8?B?YWdjRFdrLzlINnozcWlMM3l1c2VPZkFxbXZiZHZOdXpwUzBlWThyc0p5MVZ2?=
 =?utf-8?B?dFQ5VG5CVnlCdHVqYWdWdlAxRXZDK1NHM2UxSXh4a3ZJNGdCbFNNcEpEOVhF?=
 =?utf-8?B?VnpnMTRoU0VEb3h4ekZaS0dGRzU4YVJTSkhHazlHWmcxTFRkYzFua3d6UVBU?=
 =?utf-8?B?dXp0aS9aNEJLZDZWNzR1UXc4eWRtNitVYllyTy83MjBmVlkrckVSeElhTDNV?=
 =?utf-8?B?Y2xLZS94Y2tNRE5wdUhsUG96WThYWnk5L3paVk1yREhsUVA2V3JndXdLWlRx?=
 =?utf-8?B?Z1o0QXJUTVc1eVlmK3JKWWtoMXV5emh2cW5TK3o4bkdzTnNndVpNWEhQOE1w?=
 =?utf-8?B?RFJoL0JoT3V3MVJ3Y2RQaE40UHBuWk1xZUhydjNoRmFJM1JpRDBLVmhkd041?=
 =?utf-8?B?YW9VUkdidjJzZVowcDFjT1FNVlFjZHowNUdDT2QvS1VSRVo2a3pkVWczRGFz?=
 =?utf-8?B?cEh1YVkyN1ozVitoZlZ0MlBIOWFDQlJpbFRkVmtDNXNOOWxBa1NDT3RKdnJJ?=
 =?utf-8?B?MDMyM21zb1BlT0hJOXZjTmNna1lkY3FmU3ZjcUFXaktPOGNVVSthOTZyak8r?=
 =?utf-8?B?djc2Y3NQMGVGSkREWHVtcDcya0tBcGNjYS8rZFJvb2wvejVmaVpKTytsckxX?=
 =?utf-8?B?NWo1d3JENlM2MVhqYjRKSHg4R3RqVWtKelkxNGZ5cU11T05jN0pKMjNHbjFk?=
 =?utf-8?B?V28yV09uZmcyRDZON01SM3dhRVBEcittSFBwNUtzWFp5RGh6RVA0SkJ6YzVW?=
 =?utf-8?B?ODNRYXAyQkg1a1N5aTBYbmRVY2x4TG9PM1JYYjNnVyt5YktrYXBTOW43ZHo4?=
 =?utf-8?B?QzB1RklqcW1nY3phNmJTbS9nN2wzek83RWRINUd1ajFxeW5uOW9BUFMrRVJP?=
 =?utf-8?B?eHlWMjdDMnYrNG5wTE9GcVFWRFBycVNaa0RVSEdRelVUVUZyNzE5QUtVMlNW?=
 =?utf-8?B?eVBtR1NJVzJQOUswQzhmMFo0bG43SHhZMVZGZzlIZGJXRUxONHhGWDBKaUNV?=
 =?utf-8?B?Z1FoN0hqMXJsaGVjbWtTQ1RLSThOWHNYNVI0NmMvREpoTE9ZMlpGU1ZlLzll?=
 =?utf-8?B?ZGN5emtDYjRJclBXcitDRUhYUDFYWTVwM0M3YVVXL1V2ZGN1VCtVZUo4Zmwr?=
 =?utf-8?B?Z0JndDVKTXRDOEo5RmkyaW5lcUw4YVVzRTk2MVhQdUg1a1h0TVNvay9MZ3Fm?=
 =?utf-8?B?dnlPN2wvUURBeHoyU1JQTFRjZVdJMkFnQ01tcGIyaHlxTGRDc25TZ21KcTgy?=
 =?utf-8?B?Y3laNnJIeFZFb2x1dm14VTV0Z3hPc2xFaGV1aTNIaTlBM3N3ZWwwSXF5WEgv?=
 =?utf-8?B?eVlIbkJML09WNlJvUHFOaUNvSXl4Mk1PanBsWEhNSXZCVXNqYzF5VFFmb3Zh?=
 =?utf-8?B?d3RITUFwYzZOdERzYklZQTFlMnlIOWx6QlhSMHlNUm5MYVRFZU5EdE9NdVJk?=
 =?utf-8?B?OGJOL0xPSjk1OWpuVXB6Y2ttOGFlc24zUUZuUTA4RXZaVGZZME1oalY3ZXdX?=
 =?utf-8?B?cy9WWWtDMVVXbm9UU0RyT3F0cWc5czdDK0pNcHdpMGRVQnhNYnZEWFVSLytX?=
 =?utf-8?B?K2oxY2c1NldnQjBVSWNuaUlDTkthQmNXZXU0ZXQ4V1Fsb2QyMnJMeHA0UTJC?=
 =?utf-8?B?Sm9vQWFOc09YY0ZSQTgyVGpIajJEMlY1QTE1dDU2WkZxc05DSCtmSHpBeXo4?=
 =?utf-8?B?UDBtNDljL3pVNDluckdVRU9PNk90UnlWbzJiVGl0QjMrL1FiU3N5bFZyeXNW?=
 =?utf-8?Q?z+ieTQo35+Np6uSI=3D?=
X-Exchange-RoutingPolicyChecked: Wk5L331ET9KbF/x60qzXQ8LMB3Nr8J37tAogrmVqZ82Aj4B/403bORsnxniUSSI2yHPQGPlu4FS2tw+civmGBjC5EtwKajKQHIvAm09p/Kq65IquS4qo7TI1kCxrQnHWT2oLjuYiDpbGr31w6JP1AovLesLyNUhHqpfYrpJEHNlNp9MyzJt2egvbT/ivfVR7ThhmfrgznmK9044fePkY345TjObeJeQad3lhVOXAvCdrbjFT1pYSwlt117fYdv8z5Gf7hjTqxziyW1/BLE+amfGXuMJbQyaf4/drr+frb7YNcsjlnWJbMRwEH1nPAafZALmxNRMJc0uqlnDAwR3X6w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bec0eed-1204-4fb3-707c-08df0a83c6ed
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 12:55:20.8447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: klce4Od8J2WZggJ+t53l/mk3zvOg1H+tMeVPWP/mu9rQ+UnlWP3DuTM4OthmFS0xtfHjqpp0lkXJIlh615dqcsSjw6xauFcfulDzofYDs7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR11MB9707
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


On 04-09-2026 04:10 pm, Tauro, Riana wrote:
>
> On 02-09-2026 12:00, Mallesh, Koujalagi wrote:
>>
>>
>> On 25-08-2026 12:06 pm, Riana Tauro wrote:
>>> This will be integrated with the related address-fault handling flow
>>> once this patch is merged.
>>> https://lore.kernel.org/intel-xe/20260818104055.3833974-14-tejas.upadhyay@intel.com/ 
>>>
>>> Sending for initial comments.
>>>
>>> Add basic support for sending page offline/decline requests to system
>>> controller and use it for device memory ECC error handling.
>>> Pages that belong to critical BOs cannot be handled by offlining and
>>> require a SBR (Secondary Bus Reset).
>>> Pages that are configured for log-only handling are not marked as 
>>> bad by
>>> firmware.
>>>
>>> For all other valid page addresses, the first occurrence of error
>>> indicates a poison error and the page is offlined only by software.
>>> Firmware avoids permanently marking the page as bad. The second 
>>> occurrence
>>> of an error indicates a Double-bit ECC error and the firmware
>>> permanently marks the page as bad.
>>>
>>> Cc: Tejas Upadhyay<tejas.upadhyay@intel.com>
>>> Cc: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>>> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_ras.c                   | 121 
>>> +++++++++++++++++-
>>>   drivers/gpu/drm/xe/xe_ras_types.h             |  35 +++++
>>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
>>>   3 files changed, 153 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>> index d25d25f77531..c643c7137a42 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>> @@ -3,6 +3,7 @@
>>>    * Copyright © 2026 Intel Corporation
>>>    */
>>>   +#include "xe_bo.h"
>>>   #include "xe_debugfs.h"
>>>   #include "xe_device.h"
>>>   #include "xe_drm_ras.h"
>>> @@ -200,6 +201,115 @@ static inline const char *comp_to_str(u8 
>>> component)
>>>       return xe_ras_components[component];
>>>   }
>>>   +static int send_page_offline_cmd(struct xe_device *xe, u64 
>>> page_address,
>>> +                 enum xe_ras_page_action action)
>>> +{
>>> +    struct xe_sysctrl_mailbox_command command = {0};
>>> +    struct xe_ras_page_offline_request request = {0};
>>> +    struct xe_ras_page_offline_response response = {0};
>>> +    size_t rlen;
>>> +    int ret;
>>> +
>>> +    if (!xe->info.has_sysctrl)
>>> +        return 0;
>>> +
>>> +    if (action >= XE_RAS_PAGE_ACTION_MAX) {
>>> +        xe_log_err(xe, DEVICE_MEMORY, -EINVAL, "Invalid page 
>>> offline action %d\n", action);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    request.page_address = page_address;
>>> +    request.action = action;
>>> +
>>> +    xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, 
>>> XE_SYSCTRL_CMD_PAGE_OFFLINE,
>>> +                  &request, sizeof(request), &response, 
>>> sizeof(response));
>>> +
>>> +    ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>>> +    if (ret) {
>>> +        xe_log_err_fatal(xe, SYSCTRL, ret, "failed to send page 
>>> offline command\n");
>>> +        return ret;
>>> +    }
>>> +
>>> +    if (rlen != sizeof(response)) {
>>> +        xe_log_err(xe, SYSCTRL, -EINVAL,
>>> +               "unexpected page offline response length %zu 
>>> (expected %zu)\n",
>>> +               rlen, sizeof(response));
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    ret = ras_status_to_errno(response.status);
>>> +    if (ret) {
>>> +        xe_log_err(xe, SYSCTRL, ret, "page offline command failed 
>>> with status %u\n",
>>> +               response.status);
>>> +        return ret;
>>> +    }
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int handle_page_offline(struct xe_device *xe, u64 
>>> page_address, bool send_cmd)
>>> +{
>>> +    enum xe_ras_page_action action;
>>> +    int ret = 0;
>>> +
>>> +    if (!IS_ALIGNED(page_address, XE_PAGE_SIZE)) {
>>> +        xe_log_err(xe, SYSCTRL, -EINVAL, "Unaligned physical page 
>>> address: 0x%llx\n",
>>> +               page_address);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    /*
>>> +     * TODO: Call function to handle address fault
>>> +     * ret = xe_ttm_vram_handle_addr_fault(xe, page_address);
>>> +     */
>>> +
>>> +    /*
>>> +     * Handle return code from address fault handling function:
>>> +     *  0: Page soft offlined, decline to firmware
>>> +     * -EIO: Address belongs to a critical BO/stolen area that 
>>> cannot be offlined
>>> +     * -EOPNOTSUPP: Address is valid and can be offlined but user 
>>> policy is not to offline
>>> +     * -EXIST: Address is soft offlined but yet to be offlined by 
>>> firmware for second occurrence
>> nit: -EEXIST?
>
> Thanks. Typo will fix it
>
>
>>> +     */
>>> +
>>> +    switch (ret) {
>>> +    case 0:
>>> +        action = XE_RAS_PAGE_ACTION_DECLINE;
>>> +        xe_log_err(xe, DEVICE_MEMORY, 0,
>>
>> I know, it's switch case using ret, please make use of errno as ret 
>> from xe_ttm_vram_handle_addr_fault ().
>>
>
> This is 0.. do you mean replace 0 with ret?
yes, pass ret to xe_log_err helper function.
>
>> and make it consistency across all below xe_log_err.
>>
>>> +               "Poison detected at physical address 0x%llx, page 
>>> software offlined\n",
>>> +               page_address);
>>> +        break;
>>> +    /* User policy set to decline page offlining */
>>> +    case -EOPNOTSUPP:
>>> +        action = XE_RAS_PAGE_ACTION_DECLINE;
>>> +        break;
>>> +    case -EIO:
>>> +        xe_log_err(xe, DEVICE_MEMORY, -EIO,
>>> +               "Physical page address belongs to critical BO: 
>>> 0x%llx\n", page_address);
>>> +        return ret;
>>> +    case -EEXIST:
>>> +        action = XE_RAS_PAGE_ACTION_OFFLINE;
>>> +        xe_log_err(xe, DEVICE_MEMORY, -EEXIST,
>>> +               "Double-bit ECC error detected at physical address 
>>> 0x%llx, page already software offlined\n",
>>> +               page_address);
>>> +        break;
>>> +    default:
>>> +        xe_log_err_fatal(xe, DEVICE_MEMORY, ret, "Failed to handle 
>>> address fault 0x%llx\n",
>>> +                 page_address);
>>> +        return 0;
>> hmm, In default case, we need to use return ret; right?
>
> If we return err, then we would cause a SBR
> which is needed only in cases of system controller's failure to 
> respond or belongs to critical bo.
> Any invalid address can be ignored.
>
>
>>> +    }
>>> +
>>> +    if (send_cmd) {
>>> +        ret = send_page_offline_cmd(xe, page_address, action);
>>> +        if (ret)
>>> +            xe_log_err_fatal(xe, SYSCTRL, ret,
>>> +                     "Failed to offline page for physical address 
>>> 0x%llx\n",
>>> +                     page_address);
>>> +        return ret;
>> 'return ret' should be inside {} 
>
> It is inside {}

if should inside if(ret) { } right ?

Thanks

-/Mallesh

>
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   static bool ras_counter_is_valid(struct xe_device *xe, struct 
>>> xe_ras_error_class *counter)
>>>   {
>>>       u8 severity = counter->common.severity;
>>> @@ -367,11 +477,12 @@ static u8 handle_soc_internal_errors(struct 
>>> xe_device *xe, struct xe_ras_error_a
>>>   static u8 handle_device_memory_errors(struct xe_device *xe, struct 
>>> xe_ras_error_array *arr)
>>>   {
>>>       struct xe_ras_memory_error *info = (void *)arr->details;
>>> +    int ret;
>>>         /*
>>>        * For memory errors, the recovery action depends on the error 
>>> category
>>>        *
>>> -     * TODO: Double-bit ECC errors: Page offlining
>>> +     * Double-bit ECC errors: Page offlining
>>>        * Poison and data parity errors: Log only
>>>        * For any other memory errors, request a reset as recovery 
>>> mechanism
>>>        */
>>> @@ -383,10 +494,10 @@ static u8 handle_device_memory_errors(struct 
>>> xe_device *xe, struct xe_ras_error_
>>>           xe_info(xe, "[RAS]: Data parity error detected\n");
>>>           break;
>>>       case XE_RAS_MEMORY_DB_ECC:
>>> -        xe_info(xe, "[RAS]: Double-bit ECC error detected at sw 
>>> address 0x%llx\n",
>>> -            info->sw_address);
>>> -        /* TODO: Add page offlining for Double-bit ECC error */
>>> -        fallthrough;
>>> +        ret = handle_page_offline(xe, info->sw_address, true);
>>
>> In case of soft page offline, we need not required reset right? 
>> however when send_page_offline_cmd
>>
>
> We do if system controller fails to respond or if it belongs to 
> critical BO.
>
> Thanks
> Riana
>
>> return err that case, reset is required. is that correct behavior?
>>
>> Thanks,
>>
>> -/Mallesh
>>
>>> +        if (ret)
>>> +            return XE_RAS_RECOVERY_ACTION_RESET;
>>> +        break;
>>>       default:
>>>           return XE_RAS_RECOVERY_ACTION_RESET;
>>>       }
>>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h 
>>> b/drivers/gpu/drm/xe/xe_ras_types.h
>>> index 99b2466e2062..2fac968879b6 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>>> @@ -17,6 +17,19 @@
>>>   #define XE_RAS_MEMORY_POISON            BIT(2)
>>>   #define XE_RAS_MEMORY_DATA_PARITY        BIT(5)
>>>   +/**
>>> + * enum xe_ras_page_action - Page offline actions for page offline 
>>> request
>>> + *
>>> + * @XE_RAS_PAGE_ACTION_OFFLINE: Instruct firmware to offline the page
>>> + * @XE_RAS_PAGE_ACTION_DECLINE: Instruct firmware to remove the 
>>> page from queue
>>> + * @XE_RAS_PAGE_ACTION_MAX: Max value
>>> + */
>>> +enum xe_ras_page_action {
>>> +    XE_RAS_PAGE_ACTION_OFFLINE,
>>> +    XE_RAS_PAGE_ACTION_DECLINE,
>>> +    XE_RAS_PAGE_ACTION_MAX
>>> +};
>>> +
>>>   /**
>>>    * enum xe_ras_recovery_action - RAS recovery actions
>>>    *
>>> @@ -245,6 +258,28 @@ struct xe_ras_memory_error {
>>>       u32 reserved2[10];
>>>   } __packed;
>>>   +/**
>>> + * struct xe_ras_page_offline_request - Request for page offline 
>>> command
>>> + */
>>> +struct xe_ras_page_offline_request {
>>> +    /** @page_address: Page address (4KB aligned) */
>>> +    u64 page_address;
>>> +    /** @action: Action to be performed, see &enum 
>>> xe_ras_page_action */
>>> +    u32 action;
>>> +    /** @reserved: Reserved for future use */
>>> +    u32 reserved;
>>> +} __packed;
>>> +
>>> +/**
>>> + * struct xe_ras_page_offline_response - Response from page offline 
>>> command
>>> + */
>>> +struct xe_ras_page_offline_response {
>>> +    /** @status: Status of the page offline request */
>>> +    u32 status;
>>> +    /** @reserved: Reserved for future use */
>>> +    u32 reserved;
>>> +} __packed;
>>> +
>>>   /**
>>>    * struct xe_ras_get_health_request - Request structure for 
>>> obtaining gpu health
>>>    */
>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h 
>>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>> index d0341538ad05..3363f48da2b7 100644
>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>> @@ -26,6 +26,7 @@ enum xe_sysctrl_group {
>>>    * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>>>    * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>>> + * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to 
>>> offline/decline a page
>>>    * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
>>>    * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
>>>    */
>>> @@ -34,6 +35,7 @@ enum xe_sysctrl_gfsp_cmd {
>>>       XE_SYSCTRL_CMD_GET_COUNTER        = 0x03,
>>>       XE_SYSCTRL_CMD_CLEAR_COUNTER        = 0x04,
>>>       XE_SYSCTRL_CMD_GET_PENDING_EVENT    = 0x07,
>>> +    XE_SYSCTRL_CMD_PAGE_OFFLINE             = 0x08,
>>>       XE_SYSCTRL_CMD_GET_HEALTH        = 0x0B,
>>>       XE_SYSCTRL_CMD_SET_HEALTH        = 0x0C,
>>>   };
