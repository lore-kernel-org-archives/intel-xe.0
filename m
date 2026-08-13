Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2D1C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 09:45:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3CB10F265;
	Thu, 13 Aug 2026 09:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QV0OEina";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3F810F265
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 09:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786614343; x=1818150343;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LTk5pJSpU8xnyA2rK6y6EY+Z6IpyHvu1+oPvmvhZNsM=;
 b=QV0OEina5W2ru+9AsjquHFZvR2DhFyNcsUQjIequGRi5Ss7B3jFDmLZV
 f/P4J7KnyKlgTBWlAjJ7YvOvjF0YON7LWlyCaXxS6reyFI4cLjNIlDe9d
 tuwD9quKOflbL1UuMkipxaurOwoWFFqkTMNvevBanSR7PPc/XaWc7UTE6
 7QJAzf0PYunp2KevgBl53B1nBZQVHai7lWtlsKq92dRqVqdoEeUQXrQ+t
 BxsiH9UlFpchkowmrGcaDWMuvk2bDbEw0oYkWoAQzMoUDUHs+Z5Zgnl1R
 a2y5saixAKqMf98ss7yb7UEAdR639KUSCyjIxQvOh2aXzyAnGWf0qONLm w==;
X-CSE-ConnectionGUID: w+AVjuH3QWynd2pZpLjAHg==
X-CSE-MsgGUID: 2PnQ5s+VSaO2pmOH+ACjvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87400439"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="87400439"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 02:45:42 -0700
X-CSE-ConnectionGUID: MABEIny/Qsik21HvfY6FUg==
X-CSE-MsgGUID: bG00dNyiTNGHljqHIMh/6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="260083767"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 02:45:43 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 02:45:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 02:45:42 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.10) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 02:45:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oxt01mzNS/x951+TuUHYphAFedVaSrfpoCf0ArYzs/65KH8cB1pjONPu0Ku9rylZZYxnKfDaWOAGPmEqd2MYESwpsSYN6Z0e03Y8hNUU6Gr/MlUKUC7Yn4niAGHmmAA7dKjCTvzPyqGTegBcOcQE6duDfoVcYTYjQFb02PVCdwEt0K6vZM+Nqcka6A/vH3bvu2HOgfB6hmLn9B3OJnnoqtY96HhJFgpAteMVrZxB4DAQrtJjwi48dl3VCc2lNtiafqc5Hk+KfmT4g/3rLmhxdf7tjB4qwmYHiRLg0cWod3zDgjBEMQ1+bAbkcaBWBGv6QTo6O4XHWFW8TauBNZyRrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAdsoCthzA/QPCFzp5jkcT7jfUUQUb3l9uI4rTJ4iuo=;
 b=gTk9LN60OQrclpuTNByAWFsng+GxenrM+OVewm9AzS97k3zzstQUfhN5cRNqQZh8dUJYecP/JospLPXxl5O5gO5qpFiWFiOix2riiKOobAapQOXRTfWSuLXv7WVOKagFxvgIJmlR4YFpgxvlDa5lgeGB0EGkYAOk+blBsggCz8gcJ7kWSvuknKnWX0HzMJ8LPc8uP5pwYjrMXJxd6r9N4Ia7bL0hCOEXZMiHYOaPzEeUt9To6jNIwGbqV+3+g9YCtf7Bldcg+W1qM6l/fc+0opfbBd3T5W4X5gkiaZ0f8j6s9R+I6oK5ZcHnQy2pNuKZQdLj5xYiZtJ0I4MptScEFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH3PR11MB7369.namprd11.prod.outlook.com (2603:10b6:610:14d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 09:45:39 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Thu, 13 Aug 2026
 09:45:39 +0000
Message-ID: <4cc18374-cc9d-46dd-b372-7e46ff6f2542@intel.com>
Date: Thu, 13 Aug 2026 11:45:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/23] drm/xe/log: Add structured SIGID error logging
 infrastructure
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Mallesh Koujalagi <mallesh.koujalagi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Yoni Levitt <yoni.levitt@intel.com>, "Aravind
 Iddamsetty" <aravind.iddamsetty@intel.com>, Raag Jadav
 <raag.jadav@intel.com>, Riana Tauro <riana.tauro@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-3-michal.wajdeczko@intel.com>
 <23eb71a4-6e93-4f93-b403-eefd8d6036c1@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <23eb71a4-6e93-4f93-b403-eefd8d6036c1@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P189CA0028.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::41) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH3PR11MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fd7954c-20e1-4ab0-d8ff-08def91fa200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|10067099003|4143699003|56012099006|5023799004|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: aQqn/+Rrwhucjk2Mbz2xGrxIOeA8/pwyDBljjLZZZUM39fRRwDYSl3fwtvK6UPNVAy6SOLYPcDg7S+z1XQZwtZW9MSjLj8ICcCb5BhtsZWTkHC3c9dRfs48jS86KSIMeLsbu27gs8RWVVf2dRjLRDXmd4BfVqN/Yhycj3Idc/fRrFqJb5mP/9jF1hrcU2doXH1c2ryJasOBK6dkJofpGtL5KejsoYrZbtwFnh7kgUWBmtqRRlBxc9LauhrCy+9IdC/nKJhWn+Dv5SHJ+lhdXWVfBBU7nCWgQsGOPHIYAIG8p1w+yaVpfKUytLx+0KorVK+AaNQGNPZtKlq5XBWh5i1EUueyFmmwc5jnOpjQ6HKqM/48c/9/xiQUCVXdpCn7Nq0REypuTdSZ8jRSdNb9K/1R+XmCXazkEFOyJktH+d/UXfNxb+/o7QST2fgqHw9q3W5fNYGOdT+qLgT3fdL1mqNjCMYUR/OdmVFBkQ1lMp9d7zXNBly8gzbsWVRHiU9bo/9rqkD90c5RxwWPMwbVWa5w4FcKtgR70RgA/xFOsSwWgx9GLEBhwRXUoQKQop6Y4uxRxIEOQrbgFyBNSOqrxpGF7gCzlBC+yJeYO3X1yJHoDO6F4468te8nlJJyPfmrZG+Uf7jfe0dF6bJ6KnwnoVSiLORc6USAcTdyN4kkFoPo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(10067099003)(4143699003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c09WYlIramRRSXUwMGsrREI5cFcrZTF1TkExQi9BZ1lNQ3JkTW5oSVo5N2Nl?=
 =?utf-8?B?Rk53ZHhSV2JEdUNJRzIzWFhLcGR1N240YnhabjFRTXAxTFN6dWF5c01oZWE0?=
 =?utf-8?B?Q1Q1dVZjU1FlRU04b2RYT2xFRGk3eWd6QUg1cVFVSzd3MUYxUlpqL0xXblQ5?=
 =?utf-8?B?aHZWMkRVcnZSQmF0RCtLRUFKVllkMExwVGx0RVlIcUUyTStkRUlYMDFIZzhC?=
 =?utf-8?B?d2hpbk1Ob1FvSzljSWtqODhVd2FPQ1ROV2dueDdHYm9MYWpqMVlJWk9VVWZi?=
 =?utf-8?B?ZUtoZEQrTWtDWjVWS3VWV0c5bC9MY3hmaWR2MkltUVNzQ1VzeitoOEpZeEpX?=
 =?utf-8?B?UmpyVlczTGsxOXBsUXRSZU1tUGRtQTdlNlhFeTFFZEFDVi96N3dJV3VBZDNV?=
 =?utf-8?B?ZENPZTd1SDJtSVlFa0NNZE9MYjhmWjBabllpeFREN3BFSG05VmtPaGVxZXRH?=
 =?utf-8?B?aFNlTUkwTXhJbWtpSU1LRzR0TmwrNFNyODdPVUJBc21BSWlnRU5DdTIzbjNt?=
 =?utf-8?B?YlJqd245bVU3NzFIdjBISTJwWlY1TDg4YXU5SWZxekdVYnVCYVVabXNHTWla?=
 =?utf-8?B?Z2ozMy8vREN4YzJFa2J5SDE4blNTbDJYazZ2aUQ5Tm1PdCtTRmFPTUJOUThK?=
 =?utf-8?B?OGNEbUU3UDk4SGdrVnA1SkRySEE4YmlDNzYxWjd6YllkNmlRN1pKYUVENExN?=
 =?utf-8?B?Z1UwR0FqdTZ5OWY5dVhXMXRGS1VXTU52K3FNa0xDWWRkS0JOamtYNkJWRVJN?=
 =?utf-8?B?a2FzdGNsVThaMlhyOXRENHRUTDlzd3ZPZlFkUHNIM0RSUHp4ajh5UDMxMmkz?=
 =?utf-8?B?MHRoblFlSzZ2aXNwK1E0ekdSTG0zcnQwVEVQM0NkVzFCYWpyOVZOM3ZCZjdH?=
 =?utf-8?B?dStram45TG1vNUd1b3UzdkNmQU9qWmtUaUMwbVg1UkltZklmNzZIa2V4MjNB?=
 =?utf-8?B?N3pGRkZuNUV6ck1ZRkFYQ3RMMmZIZzdkNUFaSGV1MUx6Z3JKTCtTTkw4bkhR?=
 =?utf-8?B?WENDQ3M4U2lXdmxmTk1oMElsSGNoQlphaGlLeldIYjRmV3poS2F6eEFSTkIy?=
 =?utf-8?B?VlZ5NFlzd0hHckVYQjJLSkxieThNVm56eTZaVUYrc2dDeTNpRzVheG9ndXR0?=
 =?utf-8?B?NXZKbUVhaVZhZzl1S0h4SkJvaVVFa0pOcWxGOUloa1YzS2VFR2phUDF6emEw?=
 =?utf-8?B?UUs0ZzAwdXdidGJiaG0yZW5tWmVZSGxCM3d1cEVTTkZDQ251dTVVNWRHMVEv?=
 =?utf-8?B?SHYyZkdFMFNzTW1mR1RPR2tuY0p0bFhqVE5VL05kV2dkQ2xGT2h3ZkFzN1c5?=
 =?utf-8?B?RWxjM2NLZEFFbzFOOW9SZ0xtVVVJTlhBL1lkOGkvZ3JPVWRleDNMdDhybkl4?=
 =?utf-8?B?N2xFS3Q0UVg0UGxpbFBkdWdEWFZRS2xCYnFMVUk0R3FkTkZtbzQrSnVjTVBh?=
 =?utf-8?B?dGZ1eDgwZEFKcTF4Z3lTZDE3SFMwRXRldk1aWUJsQmFqZ2tVUDVuV0FJb0Fp?=
 =?utf-8?B?MExWYmxZUGVZQWFuSDlmRllqeE5JcXBpWFN0K28ySUFKRjZZVG01MzZzUHJi?=
 =?utf-8?B?YjErMU1hMzBoZkVMd2NhNmVlbjVHalptcmJEd3RrNDZaS1I4L3BBQmtOT043?=
 =?utf-8?B?NkZGSzM0UnNZWnl6S3M1UW13ekhxUDFCT0N0K0hDSWtlZFFQTWFZQnQ3TVN6?=
 =?utf-8?B?MXlaWUVUYTA2ZC9yQytCY2VpV1AvSUVhcWxnVUxUeHRrYTlGcENlWERNcVho?=
 =?utf-8?B?cDVTOVRzNTF6eEJraVl6Z2NYU0laRjR3T0drWEtWc0hFU3BoSUdaSE9sUHVu?=
 =?utf-8?B?TklHTjJiZHhXdG54WUN0SmtHLyt6TVVuaFQ3UWdVcXF1SjhncGJoeVNvZlpo?=
 =?utf-8?B?TUd2N0t0Rkk3YVNDYUxETlRzU2J6bnozYmhkYVdURWhZYUFpNFU1QnA3bjBJ?=
 =?utf-8?B?SThwSmxLSWx3cXhPeEU3Z3I2c1h3aFBjN3JNZmg1cDNvRktTTGxRUTNRU0hr?=
 =?utf-8?B?b2NES0YvRzE5amcyVDh6RzJNVW9aZFdOb0UxZjdidE9Cd28wbURJNDNWdkpS?=
 =?utf-8?B?WUM2SjByQk1iNGsxbnVjNTdJVkkwYmRjcHJBVVJGQUxOY21QRGtYTVpJcnJk?=
 =?utf-8?B?VTB4bHlBUVdGa2k3eXBCZC9BTE1ld3RQYnpyMU1Va3ZhSFFNUkREVnVRRVFi?=
 =?utf-8?B?cnlOU0JEdmZxcWNqS1dVVVcyU1JjRDBOTklkVkg0Wjg0a2ZHb2xWSHNzR1ls?=
 =?utf-8?B?RXBsMS9iZGVWQ0VMN3BZRTdtZUFhdnRDakVCOVpPeVRjaW5BQ2VXVE82MVdt?=
 =?utf-8?B?dzNJdFQwS09sOFpKZmZudlFhajZTcmp4dnNUczhUcXhTc09Xb3NzNnUwcVAv?=
 =?utf-8?Q?KP7wU0jJnUhhDozE=3D?=
X-Exchange-RoutingPolicyChecked: sxrVA2o5UbNq6U3v1rmILDtN/qCs1VMPFMD87AXelPB8G4LnL+eZuyIoauSSlA+urZrBPQlvXDvDo/4AbkNqSm7I/tinvhDSyLaYLayUmWTfnTacyqq/L+WVtKxBbcELSlAs2O1fFOYqJXBCb+enkjGN29zgxw3okDQ6cdJjqLfrdAVxEyg2543Z5961Jaz+G+qYUWrB7/3WW2WxC3vViZH2K9S8kXqr+Ie35LqL/bfA9NkbsnHctITOE3ADf6qYu4Xic7ywxVV4oADmNoLU9qj2aptpqCm9LYYHj9Kl4H9vuMLGESZrSVV8Q6an+2A3EE4JspMbBTg1XQonmIcgDQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd7954c-20e1-4ab0-d8ff-08def91fa200
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 09:45:39.2156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mySctPBB0kqrLOR59xZ/SiGsaIWt1pCdRiPmPbCR4QoYNyQQDVS4+lqFHgRoU1yQEXHCZzElra/uh24u8Hrns7LT4Y1w+cVucON7Vx9vo2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7369
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



On 8/13/2026 11:33 AM, Aravind Iddamsetty wrote:
> 
> On 30-07-2026 20:50, Michal Wajdeczko wrote:
>> From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>
>> Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
>> strings that have no stable shape. That is readable for a human, but it
>> gives fleet tooling nothing durable to match on: the wording changes
>> between releases, lines can be rate-limited or dropped under an error
>> storm, and there is no consistent way to ask "which recognised fault
>> just happened?".
>>
>> Introduce a signature identifier (SIGID): a small, stable integer that
>> names one recognised Xe fault situation and serves as the primary handle
>> for triage. A SIGID maps, through published end-user documentation, to a
>> description and a recommended action; the driver only has to emit the
>> right SIGID next to the usual human-readable text.
>>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Assisted-by: Copilot:Opus-4.8
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Co-developed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> Cc: Yoni Levitt <yoni.levitt@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Raag Jadav <raag.jadav@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: CORRECTED is still an error (Michal)
>>     prepare to decorate dmesg with comp/loc (Michal)
>> ---
>>  Documentation/gpu/xe/index.rst        |   1 +
>>  Documentation/gpu/xe/xe_sigid.rst     |  14 ++
>>  drivers/gpu/drm/xe/Makefile           |   1 +
>>  drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 183 ++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_log.c           | 135 +++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_log.h           |  20 +++
>>  6 files changed, 354 insertions(+)
>>  create mode 100644 Documentation/gpu/xe/xe_sigid.rst
>>  create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>  create mode 100644 drivers/gpu/drm/xe/xe_log.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_log.h
>>
>> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
>> index 665c0e93601c..0247a255f7e6 100644
>> --- a/Documentation/gpu/xe/index.rst
>> +++ b/Documentation/gpu/xe/index.rst
>> @@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
>>     xe-drm-usage-stats.rst
>>     xe_configfs
>>     xe_gt_stats
>> +   xe_sigid
>> diff --git a/Documentation/gpu/xe/xe_sigid.rst b/Documentation/gpu/xe/xe_sigid.rst
>> new file mode 100644
>> index 000000000000..45d84a62f185
>> --- /dev/null
>> +++ b/Documentation/gpu/xe/xe_sigid.rst
>> @@ -0,0 +1,14 @@
>> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +
>> +========
>> +Xe SIGID
>> +========
>> +
>> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>> +   :doc: Xe Error Signatures (SIGID)
>> +
>> +Signature Identifiers
>> +=====================
>> +
>> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>> +   :internal:
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 67ada1d6c2fb..7ac3954737f9 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -87,6 +87,7 @@ xe-y += xe_bb.o \
>>  	xe_hw_fence.o \
>>  	xe_irq.o \
>>  	xe_late_bind_fw.o \
>> +	xe_log.o \
>>  	xe_lrc.o \
>>  	xe_mem_pool.o \
>>  	xe_migrate.o \
>> diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>> new file mode 100644
>> index 000000000000..99717fdf74a6
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>> @@ -0,0 +1,183 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _ABI_XE_SIGID_ABI_H_
>> +#define _ABI_XE_SIGID_ABI_H_
>> +
>> +/**
>> + * DOC: Xe Error Signatures (SIGID)
>> + *
>> + * What SIGID stands for
>> + * ---------------------
>> + *
>> + * SIGID is short for *Signature Identifier*. A SIGID is a small, stable integer
>> + * that names one *recognised Xe fault situation* -- nothing more. It is the
>> + * primary handle used for triage: a SIGID maps to a human description and a
>> + * recommended first action. A coarse first-order action is documented in-tree
>> + * per SIGID (see "First-order action" below) so the id is actionable on its
>> + * own; published end-user documentation refines it with finer, cross-product
>> + * detail. The driver's only job is to emit the right SIGID next to the usual
>> + * human-readable text.
>> + *
>> + * Why this exists
>> + * ---------------
>> + *
>> + * Today the driver reports faults with ad-hoc ``drm_err()`` / ``xe_gt_err()``
>> + * strings that have no stable shape. That is fine for a human reading dmesg,
>> + * but it gives fleet tooling nothing durable to match on: the wording changes
>> + * between releases, lines can be rate-limited or dropped under an error storm,
>> + * and there is no consistent way to ask "which recognised fault just happened?"
>> + * A SIGID answers exactly that one question, identically across driver and
>> + * firmware versions, and (eventually) across other Intel devices in a node.
>> + *
>> + * What a SIGID is (and is not)
>> + * ----------------------------
>> + *
>> + * A SIGID names *which situation* is being reported. It deliberately does not
>> + * encode the detailed reason or the outcome. Those are carried alongside it::
>> + *
>> + *   SIGID    -> which recognised situation is being reported
>> + *   severity -> how serious this instance is (see below -- not fixed per SIGID)
>> + *   errno    -> the failing operation's error, shown with %pe
>> + *   message  -> free-form human-readable context
>> + *
>> + * Severity is independent of the SIGID. The same situation can be reported at
>> + * different severities depending on the instance and the recovery taken, so a
>> + * SIGID is never tied to one severity; the reporting site chooses it by calling
>> + * the matching xe_log_*() helper (see xe_log.h).
>> + *
>> + * How to pick a SIGID (the uniqueness rule)
>> + * -----------------------------------------
>> + *
>> + * Pick per *report site*, not per incident. Each site emits the single most
>> + * specific recognised situation *for that site* -- so the question is never
>> + * "classify this whole failure", it is "what does this site detect?", which has
>> + * one answer. A single underlying failure therefore legitimately produces a
>> + * *chain* of reports from different layers, each with its own SIGID -- e.g. a
>> + * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by the firmware
>> + * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, and an
>> + * aborted bind as %XE_SIGID_PROBE by the probe path. That chain lets triage
>> + * follow a fault from origin to final effect; it is not a duplicate.
>> + *
>> + * If a site does not match any defined situation, keep using the ordinary
>> + * ``xe_err()`` / ``xe_gt_err()`` logging rather than forcing a SIGID: a wrong
>> + * or over-broad classification is harder to retire than a missing one. When a
>> + * new situation is genuinely worth triaging, add it to the list below.
>> + *
>> + * Scope: software-emitted signatures only
>> + * ---------------------------------------
>> + *
>> + * This header enumerates only the situations that the *driver itself* detects
>> + * and reports from software: probe abort, wedged, survivability, driver-
>> + * detected firmware failures, engine TDR, memory faults and IO/bus faults.
>> + * These are the only values the driver assigns.
>> + *
>> + * Signatures that *originate* in firmware or hardware are a different thing:
>> + * they are produced and identified by the firmware or the hardware itself
>> + * (e.g. via their own records or error counters), and the driver merely logs
>> + * them as they are given to us. They are deliberately *not* enumerated here --
>> + * minting a driver-side id for a firmware/hardware-reported error would only
>> + * duplicate an identifier the reporting layer already owns. The two
>> + * driver-detected firmware situations below (%XE_SIGID_RUNTIME_FW,
>> + * %XE_SIGID_DEVICE_FW) are software signatures: they mark that *the driver*
>> + * observed a firmware problem, not a signature reported by the firmware.
>> + *
>> + * Numbering
>> + * ---------
>> + *
>> + * SIGIDs are a single flat list numbered sequentially within the assigned range,
>> + * in the order the situations were introduced. Values are stable: once assigned
>> + * they are only ever appended, never renumbered or reused.
>> + *
>> + * A retired situation is deprecated in place, never re-purposed.
>> + *
>> + * First-order action (resolution buckets)
>> + * ---------------------------------------
>> + *
>> + * So that a SIGID is actionable on its own, each one is tagged with a coarse
>> + * *resolution bucket*: the first thing an operator should do on seeing it. The
>> + * bucket is a stable, driver-owned hint; external documentation may refine it,
>> + * but the in-tree value always stands on its own. Every new SIGID must pick a
>> + * bucket, which forces the question "what should someone do about this?" to be
>> + * answered up front. The buckets are::
>> + *
>> + *   COLLECT  -- capture logs and open a bug report
>> + *   RETRY    -- transient or already recovered; watch for recurrence
>> + *   UPDATE   -- a firmware update / flash is required
>> + *   RECOVER  -- an explicit recovery step is needed (rebind, bus reset)
>> + *   IGNORE   -- ignore if the SIGID severity is INFORMATIONAL
>> + *
>> + * The bucket is documentation only -- it is recorded per SIGID in the enum
>> + * kernel-doc below and is not printed on the (deliberately lean) dmesg line.
>> + *
>> + * When to use SIGID logging
>> + * -------------------------
>> + *
>> + * The xe_log_*() helpers are for these recognised fault situations only --
>> + * important, operator-relevant faults and events. They are not a replacement
>> + * for ``xe_info()`` / ``xe_dbg()`` / tracing, nor for one-off diagnostics;
>> + * using them for ordinary logging would dilute the fault stream. Not every
>> + * ``xe_err()`` needs to become a SIGID report -- only those that correspond to
>> + * a published situation.
>> + *
>> + * dmesg vs. the machine record
>> + * ----------------------------
>> + *
>> + * The dmesg line stays close to a normal xe error message so it remains
>> + * readable for admins; the only stable, machine-matchable token on it is
>> + * ``SIGID=<n>`` (``dmesg | grep SIGID=``). dmesg is not an ABI: the surrounding
>> + * text may change freely, and lines may be dropped. The durable record for
>> + * tooling is the CPER record carrying the same SIGID (generation is a planned
>> + * follow-up).
>> + */
>> +
>> +/*
>> + * Top level Intel Error Signature Identifiers.
>> + */
>> +#define INTEL_SIGID_INVALID			0
>> +#define INTEL_SIGID_GPU_START			100
>> +#define INTEL_SIGID_GPU_END			999
>> +
>> +#define INTEL_SIGID_GPU_XE_START		100
>> +#define INTEL_SIGID_GPU_XE_END			299
>> +
>> +#define INTEL_SIGID_GPU_XE_SOFTWARE_START	100
>> +#define INTEL_SIGID_GPU_XE_SOFTWARE_END		199
>> +#define INTEL_SIGID_GPU_XE_HARDWARE_START	200
>> +#define INTEL_SIGID_GPU_XE_HARDWARE_END		299
>> +
>> +/**
>> + * enum xe_sigid - Stable Xe Error Signature Identifiers (SIGID).
>> + * @XE_SIGID_SW: Software component failure. [COLLECT]
>> + * @XE_SIGID_PROBE: Device probe/bind was aborted. [COLLECT]
>> + * @XE_SIGID_WEDGED: Device was declared wedged and is no longer usable. [RECOVER]
>> + * @XE_SIGID_SURVIVABILITY: Device entered survivability mode. [UPDATE]
>> + * @XE_SIGID_RUNTIME_FW: Driver-detected runtime firmware failure, GuC/HuC/GSC. [RETRY]
>> + * @XE_SIGID_DEVICE_FW: Driver-detected device firmware failure, PCODE/sysctrl. [RETRY]
>> + * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery (reset). [RETRY]
>> + * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault. [COLLECT]
>> + * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault. [RECOVER]
>> + *
>> + * The situations the driver detects and reports in software. Values are
>> + * numbered sequentially, are only ever appended, and are never renumbered or
>> + * reused. The tag in brackets is the default resolution bucket (see the `Xe
>> + * Error Signatures (SIGID)`_ section).
>> + *
>> + * Firmware- and hardware-originated signatures are not listed here; they are
>> + * logged as reported by those layers.
>> + */
>> +enum xe_sigid {
>> +	XE_SIGID_SW			= INTEL_SIGID_GPU_XE_SOFTWARE_START,
>> +	XE_SIGID_PROBE			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 1,
>> +	XE_SIGID_WEDGED			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 2,
>> +	XE_SIGID_SURVIVABILITY		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 3,
>> +	XE_SIGID_RUNTIME_FW		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 4,
>> +	XE_SIGID_DEVICE_FW		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 5,
>> +	XE_SIGID_GT_TDR			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 6,
>> +	XE_SIGID_MEM_FAULT		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 7,
>> +	XE_SIGID_IO_BUS			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 8,
>> +};
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
>> new file mode 100644
>> index 000000000000..70a41bdf1a01
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_log.c
>> @@ -0,0 +1,135 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include "xe_log.h"
>> +#include "xe_printk.h"
>> +
>> +static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>> +			  u32 component, u32 location, const void *data, size_t len,
>> +			  struct va_format *vaf)
>> +{
>> +	/* TODO */
>> +}
>> +
>> +static bool is_hw_sigid(enum xe_sigid sigid)
>> +{
>> +	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
>> +}
>> +
>> +static bool is_sev_error(int cper_sev)
>> +{
>> +	return cper_sev != CPER_SEV_INFORMATIONAL;
>> +}
>> +
>> +static const char *log_hwe_prefix(int cper_sev, enum xe_sigid sigid)
>> +{
>> +	return is_sev_error(cper_sev) && is_hw_sigid(sigid) ? HW_ERR : "";
>> +}
>> +
>> +static const char *log_sev_prefix(int cper_sev)
>> +{
>> +	switch (cper_sev) {
>> +	case CPER_SEV_FATAL:
>> +		return "FATAL ";
>> +	case CPER_SEV_RECOVERABLE:
>> +		return "";
>> +	case CPER_SEV_CORRECTED:
>> +		return "CORRECTED ";
>> +	default:
>> +		return "";
>> +	}
>> +}
>> +
>> +#define __LOG_DRM_PRINTK_FMT(fmt, args...)	"[drm] " fmt, ##args
>> +#define __LOG_DRM_PRINTK_ERR_FMT(fmt, args...)	__LOG_DRM_PRINTK_FMT("*ERROR* " fmt, args)
>> +
>> +static void log_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
>> +{
>> +	if (cper_sev == CPER_SEV_INFORMATIONAL)
>> +		pci_info(pdev, __LOG_DRM_PRINTK_FMT("%pV", vaf));
>> +	else
>> +		pci_err(pdev, __LOG_DRM_PRINTK_ERR_FMT("%pV", vaf));
>> +}
>> +
>> +static void log_dmesg_printf(struct pci_dev *pdev, int cper_sev, const char *fmt, ...)
>> +{
>> +	struct va_format vaf;
>> +	va_list args;
>> +
>> +	va_start(args, fmt);
>> +	vaf.fmt = fmt;
>> +	vaf.va = &args;
>> +
>> +	log_dmesg_vprintk(pdev, cper_sev, &vaf);
>> +
>> +	va_end(args);
>> +}
>> +
>> +static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>> +			   u32 component, u32 location, const void *data, size_t len,
>> +			   struct va_format *vaf)
>> +{
>> +	const char *hwe_prefix = log_hwe_prefix(cper_sev, sigid);
>> +	const char *sev_prefix = log_sev_prefix(cper_sev);
>> +
>> +	/* TODO: add component/location details */
>> +
>> +	if (IS_ERR(data))
>> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%pe) %s%pV",
>> +				 sigid, sev_prefix, data, hwe_prefix, vaf);
>> +	else if (data && len)
>> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%*phN) %s%pV",
>> +				 sigid, sev_prefix, (int)len, data, hwe_prefix, vaf);
>> +	else
>> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s%s%pV",
>> +				 sigid, sev_prefix, hwe_prefix, vaf);
> 
> Can we print the device UUID as well every time we print the SIG_ID, as
> the BDFs keep changing it can be helpful to identify the part correctly.

that would be overkill

and I don't think that BDF would change without bus re-enumeration
and driver re-probe

we can log SIGID PROBE info level message with UUID once on every
probe attempt right after we would be able to retrieve that

but logging that on every dmesg line - no

note that you may still consider adding that to CPER record

> 
> Thanks,
> Aravind.
>> +}
>> +
>> +/**
>> + * xe_log_emit() - Emit a structured SIGID log entry
>> + * @pdev: the &pci_dev device
>> + * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
>> + * @sigid: signature identifier, see &enum xe_sigid
>> + * @component: component identifer
>> + * @location: location details of the @component
>> + * @data: pointer to the additional details, or ERR_PTR, or NULL if not applicable
>> + * @len: length of the @data in bytes, or 0 if not applicable
>> + * @fmt: printf-style format string
>> + * @...: format arguments
>> + *
>> + * Emits a dmesg line that includes a single stable, machine-matchable token
>> + * ``SIGID=<n>`` followed by the optional severity token (like ``FATAL``) and,
>> + * when @data pointer is set, either the error printed with %pe or a packed hex
>> + * dump of the @data binary blob. The dmesg line will also include printf-style
>> + * text message.
>> + *
>> + * Note that the full dmesg line, with the free text message, is only a debugging
>> + * aid, not an interface! Only the ``SIGID=<n>`` token is stable there.
>> + * The durable machine record is the CPER carrying the same SIGID.
>> + *
>> + * Note: generation of the CPER record is a planned follow-up.
>> + *
>> + * Examples::
>> + *
>> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=104 FATAL (-EPROTO) Invalid GuC reply
>> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=106 (-ETIMEDOUT) Engine 'rcs0' hung
>> + *   <6> xe 0000:03:00.0: [drm] *ERROR* SIGID=103 In survivability mode
>> + */
>> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>> +		 u32 component, u32 location, const void *data, size_t len,
>> +		 const char *fmt, ...)
>> +{
>> +	struct va_format vaf;
>> +	va_list args;
>> +
>> +	va_start(args, fmt);
>> +	vaf.fmt = fmt;
>> +	vaf.va = &args;
>> +
>> +	log_emit_dmesg(pdev, cper_sev, sigid, component, location, data, len, &vaf);
>> +	log_emit_cper(pdev, cper_sev, sigid, component, location, data, len, &vaf);
>> +
>> +	va_end(args);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
>> new file mode 100644
>> index 000000000000..d475e816ee0b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_log.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_LOG_H_
>> +#define _XE_LOG_H_
>> +
>> +#include <linux/cper.h>
>> +
>> +#include "abi/xe_sigid_abi.h"
>> +
>> +struct pci_dev;
>> +
>> +__printf(8, 9)
>> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>> +		 u32 component, u32 location, const void *data, size_t len,
>> +		 const char *fmt, ...);
>> +
>> +#endif

