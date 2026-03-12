Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90B3FED2CC
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 05:55:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3998210E348;
	Thu, 12 Mar 2026 05:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ri1qS90x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB5110E348
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Mar 2026 05:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773294918; x=1804830918;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kbxqhQraGiWLl86JnEl/0QP/igvKk17gDLl17yysVII=;
 b=Ri1qS90x/y1ZTYkZ2tlT9fRzJf0N/cqUjxHG2kKK+fviFfeXQiYPF8+/
 8znLqgKNGPfT6Yd/xopA6ILhmsPoretzSl0f8+qFZmq/e7a7PtVL4V5Pe
 4UAbf3452yb54cq+3IDmxZ+CFbpyLVheWJbE62r+0vaxsWiyHLytodN/h
 hjMux//aPr67lIs2rgMfGXcO9ElI5g/oPSwf8zEJZX+hZSLkwo5WTZNd5
 ZfBufvktn+j5OU43kGW9gEarKXABw4iMQyjmK7VK6VghFV6fJsP2/LaOD
 5OYERNC3b2YJO9bCSSWfXjo9R0EzXR1uyE693MRxhfgbSX5Rq9mcKWVPH g==;
X-CSE-ConnectionGUID: 2tYalZ1URhydVcnWcg6+Qg==
X-CSE-MsgGUID: MGw8XDjHQaSSAN/d1sdQTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="73569261"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="73569261"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 22:55:18 -0700
X-CSE-ConnectionGUID: iHEfr8CWQOmFnBforMWjEQ==
X-CSE-MsgGUID: Ymjq87rYRs6hkSeZbOXhUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="225413281"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 22:55:17 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 22:55:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 22:55:16 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.20) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 22:55:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=da6YByZmX1Edm1xnoc6PM4xmt1Wr4zZ//dJ9X4LXPshapUNRIAaxtAcyQEojvU3AVEee6uajVlsAn2jyjYmNfxyx6SXmT2r+h0OWrLu7oaTOpiFrPA1ul0uwH6QFJ8bMFNvXkByglG31PcXf8bLnnaCbS1NlJoHC6hu25f7p87nsYqc9CEoVaeDX0MZLM3w9TGuFIlpgJrrVgB1BB/239TORd0w5sretaVRHFYVuLQ67xLQZS1dYy/XU7HybqYMsctr0ix/DY2NqPGOux5Uw35OUZDECsbv8dLSfb4fslu/AbFvj3iqACwsxjTLdlbqYsZYT6vueJqF+gyCE7yOADA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12+46glGnxTEV0WX7H6IybF4UJcU9J+LkfVXyr7I7rs=;
 b=KeOVm3YeAu1GNUCyuSZbQ3kxYU0P9+AhwHbskyadx8VfFrWTZxaTPKuMY+feKz9+qrTZI6W8T7bmYv+Op6syEJV863VGbj+2FDcrAH3uy14Qys+woA/kkA+wacrjVpnBMhwL4HlL/Qjw6Rj1Y7aj/Oh7mE6FpZJxaIrPWzOMPLAOAZST+lYo4Vi3WbT4VvapKuK/0sVni2Myj1vxouvdeHzPYhz2PYmkQi8M/RQ5XNnRoAhtuAoHU4Xz1I4otDAEG98WMlsR52HvDdJStB7riBka/RXjQ1E7f/uVgQW4Xa38UqPVvIN93lGtozurEdtKmFMY/GAeYaGKkZkOUCxQcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY8PR11MB7083.namprd11.prod.outlook.com (2603:10b6:930:51::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 05:55:13 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 05:55:13 +0000
Date: Thu, 12 Mar 2026 11:24:59 +0530
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v9 6/6] drm/xe/pci: Enable System Controller for CRI
 platform
Message-ID: <abJVM7NCjvk0Z5QJ@soc-5CG1426VCC.clients.intel.com>
References: <20260310182336.611041-8-anoop.c.vijay@intel.com>
 <20260310182336.611041-14-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260310182336.611041-14-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MA5PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::17) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY8PR11MB7083:EE_
X-MS-Office365-Filtering-Correlation-Id: 861ed6d2-bd42-4b1e-0273-08de7ffbed79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: lmUP3yqBA0+DDm4VL/uBl6SLoyaoGV9yeyvxnycOaQEQJxT/xR2ErSkDrx6dJCj3Fh5DgCynwUUSXS+nIJ342dwptD8/xYLHTJMrcMFjzRpSMhfBlBlWPvQgBqdBk1C+qATIALIsCg4VefarDJRTzKbfsr1xpESO27TBKJsc0TwUiJht4JzQHwMiw/L0DyJilz5jUpo4iaZHSXJwqMSec+D1T1JCCqHgpz+Sc/477h2yHXxZYRhAT+jSttBQse8Ua/9Gpv9LLwzGAVG0fxOdPkCnwplBqWnkq6e62eH3OjpCKHWyI0ZZNvgeWEmYUqHVDjUi+WTwgP85OpXaFCJQyND4vuZdfQH42rmLlzauZgzz+TmZI7fuMT6AB6BmJDWULYfQ6w48Zs/A020Nqdg0VmMZa2PlsSCbfvealETxUrWVgLnKhcyGmUBaX6+omXTv1yvkd0yT7iW31nRYTE7z1zl52FB1J6k7uPIuDGVJC1Sd//YLs91mDLN7PuXsVbG+7dkZvMs544p68RF1AbDxS4KTrQIWfbrqMwziWKnVGNVSXpuZcvkGtK/WPSlgPWIFs0vUQaa1QXReWL4sMWrA5nbGtv7yTEeomZ2oV5Ph+cgnCZLs277kjf86GdUzB4V7cKO25IoWG1WRNYSrXqxuU+csnxnDN7NGlirIuVEad5vklAsRJCGn5etu6cM+TiSr84wbXW9auvxiPqyWRrqorq3ewnGa0wEGw5jDJxvyZdM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGphTDlDc0NienNUaEhFMkxIVzc0Wld2ZEdMUjhla0gwZWZ6VnZKY0Z2bzNI?=
 =?utf-8?B?QVErbjBqNk5nMVFVTDl0NFZ6ajJZYUFPTUVSUEc3ZG1qbDN0elFkQURsdWl5?=
 =?utf-8?B?bUhaOHE3dVo0OTlQT0x2dnl6M0ZoSFhQZnREKzRSMkNhZ1Qrb2g4UWxHNUFZ?=
 =?utf-8?B?MDV5TnZueWQzM1h6ckdGM3lzNUZFUUhtTmppRjl1V2RRNFBoU1RFRWdVYnNl?=
 =?utf-8?B?MnExd3E0b09Oajg1blRMRENpdm5XUDNlZDFJVzFIUlBNc1VkV09SbmlTTGZZ?=
 =?utf-8?B?V29pL09aN1M0cnU1ZWJqNHUyZ1M5Mk95N2ovckFUYWxHNk5jM3NURC8wcHFy?=
 =?utf-8?B?L1pZZVlpcC8rNWMrZU1jVWQ2RWNCL3hvUDVDUG9yT0hBME1QKzJ1K3hKUHNX?=
 =?utf-8?B?MzFuN0dBTjM5UzBkUVMwZ3JpaEp6MTJVOTRLK1V0dzkrdGI0S3J6WHlYVFFE?=
 =?utf-8?B?UFZveTRHM2FyY1RFRDNBc3RFN0hSczczREYwcU1ZTDc1WXJyT3RCSUtjOHRy?=
 =?utf-8?B?L1hUczBtUDFsdlBYN0k3Z2VubGlrTXhMWG9SUXB0Zkxwc1Q1Z2xydU5IMUN2?=
 =?utf-8?B?aEM4Q1JWWHVjMDZ3dEZjMW82c0NlZ0orcUNidkMxSDFZY0wxMDdYdWFDUi9a?=
 =?utf-8?B?VUdHYVlyd1J4eHpNRGd3cm1jazZ4d1czZDZFR3NiWStDdkd6NHJLQkc4Qmpz?=
 =?utf-8?B?QXNQMi9yUHpyc1VOdzc3MHBXTllNZHRsSVNZSmpuZXFCSlk3WXdyRi9yY3Jl?=
 =?utf-8?B?MkJjU05XZmNQUkJGcmF2K3Z0SlIzNEZrbnEyTVhPbm1sRkkvRWh2dHdCeTZv?=
 =?utf-8?B?VmpWTHUzb3c3anM4Y0d5SmZrS2RqbDBPbWI2MWwwd2huVytveUxFSzRYNTY1?=
 =?utf-8?B?UER5anBKTThFcm9qWUZsOHF2MEpMWldhZEhGRkFwZXFIV082MnJ6M01pR1Jv?=
 =?utf-8?B?Y0hyL3J3bWJYSmg0L2x4d25MV0p4TU9nVlpXNktHaXcreG1BNE9vNlpySjBS?=
 =?utf-8?B?RTB0Nkx2WXNmaUFaOFgyRS9IS2tVWUhUQjRndWt0OWlwcDJFSUV0RS9UY2tK?=
 =?utf-8?B?LzZDY3U3SmtzNHVML1F5SE5ZMHI1bk5TY0FNUzQzNk5tNVFhOHV4TFBpOFNS?=
 =?utf-8?B?SGVVVlFQc1VDUFgrMHJNUGZOYmo0S2hBS2hoQmR1WGNaTjdTbDRvRktsb1gz?=
 =?utf-8?B?cS9UWWx3NjZhLzZLNFl5c0xGZ1NObWFCSVF5ZnpOcTR2Mk45Y050V2xHbkNx?=
 =?utf-8?B?QlBXbDd2QnZaamRVb2V0TC9ieXd1QjloRkFPL3FhczBBdWtqOEJ2ZW1NU3hs?=
 =?utf-8?B?dEQ1ZUtiMkpKVlpDODhqSmZlang4eXl0a2ovYjlWYWdpczR3TmlZV2VPTkdU?=
 =?utf-8?B?bDRNQU9CWVVRTm5iQ2VzbXVBMFBYTi9WQ1B6UkNSZ0k0aVp2NmMzM3lxZzBB?=
 =?utf-8?B?b055azJmUlRtVUhlaSsreHRXMnJkQzIvdWRGQ2FLOC9MdjZiSDNRem1la3RB?=
 =?utf-8?B?ekIvOWFCcmxZdTFyU2lycTZUeUhOMit5MUMzdFVLYWltb1Nxc0puS2ozMnBP?=
 =?utf-8?B?UjZDaXdzdklzWCtuKzk5WjNCMGoxeXVZSHF2S1d4Y0RncVR4NUZnSXlYKzVR?=
 =?utf-8?B?aS9YOVcvcVp3WHNMYWQyTnRrRXJjaHNBeGRnTXg2a0l0TSs1NGpvd3RyWFVP?=
 =?utf-8?B?cytsbVlJc292bGJwWE9rSmJ0dmozUnJ1QWZQQ0dRaTFLRUVzQUhQbUZaTWxV?=
 =?utf-8?B?SE9LM0pzbWtGZk9PMk9qdWZlaTBLUFlwRyt3NG5DZ2dWMWJqVmxEai96NjBm?=
 =?utf-8?B?alpFZWNuWGJ1U2FaODZkbGU3K3RQcTRzbXZkck1tdFQrVG9qb3IxeXE1Z2RB?=
 =?utf-8?B?MjFVUVdsUzNXRmlCblkranZnVG5qVFNESEppcWw3eUM4RnFlaTk4Vk84eVBu?=
 =?utf-8?B?NGJlbDNUVHlzVVFBS2RqYU0xWXFzTm10MUpEWnA2TUl2RXpDYmRoNkNZRit5?=
 =?utf-8?B?eDdsODFlMXNqdW9aQWE3YnBJOUY3em1WS2kwYUtweW9QRWtFdENzR0U1Snhj?=
 =?utf-8?B?T0FabFhlNUpOZ1lpK0hWVnJQcTNLMnZyN0ttOHVrZmdoaFkxNFVPL1RGNjRl?=
 =?utf-8?B?bWdlYlo0NHJSb0xQWkJEWXBGZWhFcmhQeHFiQS8zU3MxNTBhTEZ3M0E1NE5H?=
 =?utf-8?B?VTMybFQ1M2IwY21NNVFiTngwY0QwMmJBZi80b1NKaGdIQUxTNENqVWNhRUFr?=
 =?utf-8?B?dVQ1M3NFbUNRdTZmWFRZMnE5bytocDQwUHBUemVMR3VrSmZCQzY1eVJQSloy?=
 =?utf-8?B?TnFXSHM2K2JDaEZldjUrSUpvQnpyQ1o0RVBSalNuMFMvRlB2QTkrZTRYRDNz?=
 =?utf-8?Q?UDBqDec1G04EXbBS5HynntBdFGRa0QkjzxLbf?=
X-Exchange-RoutingPolicyChecked: Yx8wPwjw0zbsxzmKWcs577qCy+oe/cIqlK9AmZglgpZm/+Te1gF1TQgtyOs9fiRxFmf8NvFci0nrFVfiG/RN1if9TaRjDrbuxPDcdh7U5ndBPPl6bIWulK4WDXElwcGjLK63J0LTFwkiQE45mSB1YFPsHu8YfLbwCIMQW32wbMm+3dlBWkpSpUA4GA5fGaFcP6kF2jT2MvaLRCS7JZp6ZKo/xgTJkN3Dj+U1NfqswlOd0mZC7Ai8e/IeEHXu+3NCMLfK/GdU1BFsLNXJ6HIv/OvU4KF0eH+am3yCuXTfy7YpYg3U/ZRVcE/opjDsT6p47PY4KkeNk3IfsMMUxFG7+Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 861ed6d2-bd42-4b1e-0273-08de7ffbed79
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 05:55:13.3084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Br9G90zDo3ADLB+pv3FzlX4aUcBMaLSQfiuwRYyGo53wYTE2V9Efn9kw+F0VZWqTjy100gKc3UkXROh+gqeNQbleF2AhV03l9VpFf9t4XMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7083
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

On Tue, Mar 10, 2026 at 11:23:25AM -0700, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Enable System Controller support for CRI platform by setting
>has_sysctrl flag in device descriptor and runtime device info.
>
>This allows the System Controller subsystem and mailbox communication
>to be initialized on CRI platform.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh
>---
>v8: (Matt, Michal)
>- Reordered patches for logical flow
>---
> drivers/gpu/drm/xe/xe_pci.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 29f976e66848..3d4a6619315f 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -465,6 +465,7 @@ static const struct xe_device_desc cri_desc = {
> 	.has_soc_remapper_sysctrl = true,
> 	.has_soc_remapper_telem = true,
> 	.has_sriov = true,
>+	.has_sysctrl = true,
> 	.max_gt_per_tile = 2,
> 	MULTI_LRC_MASK,
> 	.require_force_probe = true,
>@@ -764,6 +765,7 @@ static int xe_info_init_early(struct xe_device *xe,
> 	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
> 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
> 		desc->has_sriov;
>+	xe->info.has_sysctrl = desc->has_sysctrl;
> 	xe->info.skip_guc_pc = desc->skip_guc_pc;
> 	xe->info.skip_mtcfg = desc->skip_mtcfg;
> 	xe->info.skip_pcode = desc->skip_pcode;
>-- 
>2.43.0
>
