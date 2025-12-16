Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D8FD64060
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 23:53:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C3F10E307;
	Tue, 16 Dec 2025 23:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bq0TK6YR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5267C10E307
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 23:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765929192; x=1797465192;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zVR0vgdchhsTBz1VvmI6ZkxH/upSrHCfrNFimWskXKc=;
 b=bq0TK6YRFnjPZycObTs4F0/4pk8emea9eqwqNJgPSxGKLoHqOQ1JcvOr
 wBEUNq3i3EO3/tC0GT7MBIr+99Aq8oWcoEqmUYqqNA9FzzIB7RoU2X6P4
 b2629FvFZCtS7DXwfxCpU0A3K1RGGIAoJHdFhmySJs9IoUdAPGHYQqS/B
 K8Nkw5mOMK+VaT0PMBXVsoCKctuygCXECLdY7Fn+ZWF8Jp8NIpea5/FPx
 Oc7gOmKJvu0lbjBMePeM+uxdn8G6wvX9Q97QpDuYOMR+c/RScTTlvFs+c
 ro2m3bom3lpAIVhkuHPuaoWxGIR5nP3IpRGvfDTu63PoPkwvJlfMZMCAw Q==;
X-CSE-ConnectionGUID: FmH5XXfkSFuq3GcaeWgjMA==
X-CSE-MsgGUID: UopzqGjETcWmygTcZ33Hpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="71714580"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="71714580"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 15:53:12 -0800
X-CSE-ConnectionGUID: 5CPXM6ZYTaK56eP/Bghy+g==
X-CSE-MsgGUID: QHDU3nOaSGe1qxdG99gU7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="202652659"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 15:53:12 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 15:53:11 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 15:53:11 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 15:53:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O8qC74p8JyqAQDjkbVHb4YpFO5M3RCpkvscCSkhyRJN+w2viTrHkKvVBeuUS95R9e4roREzFnb4HPFoaCArBK1T3WUhjAK7AXIy/T5haHq8Bp9fKI4+StU7N+8KAxR4u/T5gM17+fJbw13ng7utQTF4TxGuoyQvQxXKjfF06k42VUXDfkHQOVV7gNPx4gQy9V9D9Shxnz/gEj9vAvsw6rswSACrhdb8Eznzg8AsZq4HUfqlOjfjY3yCrzMosSTzZANccM9KbtzQx1oUMB6ByqjWh+JUGsgvci+98/c615XdGJvdBitQ3iTRT5H8QVTnEKfTuz7cUl7K8xG5VdBvYVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZjk4KAoSogNiuwk3AGe8APiBoMVM+XrGwAqE/ITtJo=;
 b=sW00cFE7xPomcc8gk1tYJy3Sk+yNPlNAHgavfhK2Yx3SFXVvqzccujbaX5thtznBX425UC42ZcQ/DzN5jyXcW8M7mVUVZEFROjadNsCuK0a/QsfjyYLcBIoVTROf1QeCAaUhLOg8PxkVyMFAy0+NkKOYg2RVsZlxhzklCG3nqzQB+tqp8g2iem3x3hn5u6nEgBaMbJo5An3hlZzDVOrh70HPEYhTOG0i6LxcJTRiZKHiiFtkvxOfS30LLE7AYKWJKpdnYWGDbEcisexySYxRfBGFKXWp2Kgm2yoIaPs/w5Gh1OetWJQ0Gr72lvlK2nB5zQGKhDzFZoIXWoLygYhi+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by DS4PPF11A2D5672.namprd11.prod.outlook.com (2603:10b6:f:fc02::b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 23:53:09 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 23:53:09 +0000
Date: Tue, 16 Dec 2025 15:53:01 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/eustall: Return EBADFD from read if EU stall
 registers get reset
Message-ID: <aUHw3Td486iBv0Up@intel.com>
References: <6d78578c015b12e7ae243727ca7ed4b93551075d.1765174462.git.harish.chegondi@intel.com>
 <87zf7n4cx9.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <87zf7n4cx9.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0045.namprd04.prod.outlook.com
 (2603:10b6:303:6a::20) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|DS4PPF11A2D5672:EE_
X-MS-Office365-Filtering-Correlation-Id: 7226337c-7026-4a63-ce29-08de3cfe43ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alR4azVkU0NlMVh2NmNLL0dWR1R0Y1U4SVFua2RwTktrZlFLQWM5cllJYzFY?=
 =?utf-8?B?TTF6TVA0dk52MUtGZzRWaldZeitPKzZWOTlkeXEvQXFZTTZscUgwbER4TWFz?=
 =?utf-8?B?ZVFLUkZkaW1KSmtrUFRoRm45WVpQRlMvdVc0K2F4TThHa1FBR1BIcHRLbmdn?=
 =?utf-8?B?akhhZFpscFhVSjF2QUxCeDlnc0phSHR4cW12K2Z4YmUxc1RRTEFzSmRwZFpI?=
 =?utf-8?B?SGpHbHcwRHN5UkVzSmtKR0tuaUQ0cUI1UU1QTklkUndxQ2lseWpLcU55dnc2?=
 =?utf-8?B?MHJsZjFlQVpYaFB2VFVqWEZ5V1B5bVcxRU5IT2F0VFVlOGllNk5lVXNKK2FD?=
 =?utf-8?B?Uzl6d2s3QnB6K0xmci9zRXVMOWJXdEQxRlNZUlNsWDVuMXhUTXYvOG9vbWNN?=
 =?utf-8?B?Q1o3eGV1eXB3TFhjM1lUZm55OGtXdzBzdkdxMjFBSWQ5T2Y5RWVWaVdUdlRD?=
 =?utf-8?B?Z3hHNmVKTVJsMEszQ0xTSk1KNDhQWkFoMUpTWlpNbVlMMStlY2JIM2g5dmV0?=
 =?utf-8?B?dGhWYlNhVVZaMnMrNVpvR3R0RTh2bU5CUWZURURlMU9lRTc2NzhVbnp5em5B?=
 =?utf-8?B?dk9LQ05ybDA5MnlVb0JEOG1oUTljSU9ZZjQxcytUOE9Vb3FwblNjZ0NURTJO?=
 =?utf-8?B?RjBYL3V6Ym45NmlpTDBBNGpnUzl5TlU2N2RSaFUwSUR2VExrUS9uVGpSa24r?=
 =?utf-8?B?NzRjUXM4Umlpem1zVW5GWHJDSDEzY1huVmppWkxLYXYrMmtvMXErTDFwMFdS?=
 =?utf-8?B?dFM2NkxxQytnTzBXM2phUXlXeHVuTC9rSnZQb3IzdDNTMEJsUlZFVnF2bTQv?=
 =?utf-8?B?Y0xlS2hLUmlyNmI1dCtwak0vV2VVb1p1WmdnNHNtSXJSYXJKYy9Ic0tWc0Zp?=
 =?utf-8?B?S2xnRGM1ZDhocWIyTjRObmhNRGNsTDZYbnZSQjVpS0l4bHp2M0VPeWxhaWln?=
 =?utf-8?B?cHJ3ZjU5WVZzdXZPKzMrd2ZVQjdKdlNQbnpRRnUwUnVLQUhMVCsxdDFFUFhE?=
 =?utf-8?B?WXZMWEZNVVRRNStqamZwNWVvak0yZWtNSm0vd1dKOEpBNHJ4eWpJUS9DbVFs?=
 =?utf-8?B?dVRiSSszdTBmUlJGZU94RDNBcEpPTHI5aWFoQlpOckQreUZOVGNBUjZzTkdl?=
 =?utf-8?B?NXBST0NPV3o2Z3FVZlQ0cjVsejBRbFptSXJXWmFOUHpwTDY1bEIvYWNQYWtI?=
 =?utf-8?B?b3RPKzR5YTRROXcvcVJoM01ZMkI3RllkUmxMVEhORlpHUldscEcrZ0YreEQx?=
 =?utf-8?B?VUpCZWtvREJqSVVwbzlsd0ZKN29wYllXMXg1MW9RNFhhMTYrcjh5dTNsZGZR?=
 =?utf-8?B?aTlDZU5WWE1CM1BLUkRsUGk3Wk5aSmtQd3lRaWFEVVZxdExQdmxlRWFaeE9N?=
 =?utf-8?B?S2lQODhzbVgzTXR3L3ZVallUOXFYYjJEWmxhV3VxRDZRTVdaZVlRb2VDSm9l?=
 =?utf-8?B?ekFCK1pYM0lILzdDNHJMQWRITi9FWlFKU0QyMHJQcG1RaDBEN2tLRXMzYlZD?=
 =?utf-8?B?SnUvUUprSzd4cmdaVVB2cWRGMTByeEFVdFBESnVzT3N4RkI5eGZRVFBMK2lX?=
 =?utf-8?B?MkhJbXQycDZpU254ejJpUUkyKzFZZ0pHcVl0a1FmYkI1aEd4TnI0V1U4L1Jp?=
 =?utf-8?B?dW5QWjRZZnJ3U3JrdGM4UTBZandEcmhmY3dmaWd6dUE0Vjh5L2s0Rk5kQ3k3?=
 =?utf-8?B?STM5WEZMVHRVUVh5bEVFbG1YLzA3bGRrdXZMN0gva3FwZmhzRnFIaTVwbWVS?=
 =?utf-8?B?b2xyZzA5QisyMTA4UWhoUVk2L0Q2ZlhMVElXcmIxdjhHaXVvVWNNRDV0dnY0?=
 =?utf-8?B?ZkVhWjRxNVpIS2NLOThtNGRpbHVjcHQwOGNpT1NGQm9UUzZsN0NoYmd3dWhx?=
 =?utf-8?B?SElMb3Q0d2F5cEorOXhYekEyT0dIQ1d3cmVOY0dGRnBVQnZqL2M3cTljNGhC?=
 =?utf-8?Q?QXmCMlIFQ24W3oScVabVY78JSEfs5V7z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djdValIySnE1MlF6WHBNcUI1VTRwTzJVSlNmenQ4eFpoWDdsNjNVNnpRSzlz?=
 =?utf-8?B?a2Z3NURSMFVJdjFPZEdBU1l1eCtjSWYrMmJPYUdtVWY0aENtKzM2aTBIRDk2?=
 =?utf-8?B?Q3NCT25DL0g2blNNU0t4N3NhTGxDK0NWOGlPeG80V1RJbHdJYjFqUm5ETTJV?=
 =?utf-8?B?L09ZTXhoQ0x5cXppSGd3K1hUYmFmMzZhd3dpb1EvQWEvS1dYblE2SUU3QkpR?=
 =?utf-8?B?KzMxZHBCVHRqOEl4YndHREs4V0R6SEhic3lkaElVYThNbzVmWXYrbWRtbkZw?=
 =?utf-8?B?T2IvTGY1TVBPdjIrdmhvMi8ramZ0L2hQN01NK243ZzJBOTZ5UG4wbExGcVFX?=
 =?utf-8?B?Q1FiYk1vTjZBRU92aHdjT3BPdlhiUEgwUGNoS1VuZCtKV2NHektJcVA1WHR3?=
 =?utf-8?B?ZWlDWGFRSytGcmFXNTB3KzIvWkFiRGpMR1I2b3ptM2JFOVFpemZza3ZCTEJZ?=
 =?utf-8?B?ZHFvWlFrYm85UjNwS1FVVXYwc3oxMERJSHFnNmMyQmw5bzVkMkpvcExEZE5M?=
 =?utf-8?B?VmVobG9laDNQZDVBd2hSM1hDQyt3a2x1TTcxbGFqaW1lWFFqUExNR3RJdEJh?=
 =?utf-8?B?OUlBMnZzNTBpQ1J5djRTWmhQTjNsc1J5TllEQ0VJSzBBR1JnMjZRaVltZXVY?=
 =?utf-8?B?SkhpMytzL1ZjUlMvSGJub1V2RTNCVURydS80TGdCZmhsMlg3QkVERUtGV1FX?=
 =?utf-8?B?UjUxek5sSjBpcXovM2pOWUxRSnBoRm9mWGJTZHltemtaaU8xelQvVFN6UFNU?=
 =?utf-8?B?TW52ZndyaXlqVXF2RUczTzJuZm5OdFBJd2hudWtOUXk1ZENHaXlrYlgrR0Rt?=
 =?utf-8?B?a3dQUS9GYWlJZDlnRUlJOTFZcGg4Z2R3MVZ5ekNiRit4SERYVG5RdGxoWmhH?=
 =?utf-8?B?czlGZHM2MGYvUGdpeXBTdnZSYkZ0bDkvdnN2OCsrQXhYY3d5MWRNeXdUbHAx?=
 =?utf-8?B?YXFwUzVhTE9CWFlHQmd5bjAxVDlKQ2V3aE9BblB2N2RpbGxLa1lxbFFBWXY0?=
 =?utf-8?B?VkpyZm5rbFVqandacTYzcDE5cVl0SFhaTkhYaUtaa2tWRTJxbTFmbXdJTHN4?=
 =?utf-8?B?T2t3OGZyNFIvbjFiYXZxWXVLbnFRdk9TYWFvYkdlYXo3R3U3Qkt2QXBvRWRV?=
 =?utf-8?B?R0JMc28vWVBtTGxTMXptY3RUL0dCQkRPZ2VxZndyWVNXUWxaRHZ6ZytiSW1s?=
 =?utf-8?B?Z2VNaDUzQ0xxaUR6Ly80RUtvZERFMUJrT0pXLytXbjQ5SVhadHlNSlZJT2lM?=
 =?utf-8?B?WlJURU1rKzRoMjZiSkJLeVIrT09wTVRpdDhHL28xQ01XOTcwM3oyRFFUb2hN?=
 =?utf-8?B?WVJzWmlDdWdsaURsZHdVVVljdTUxMHM3TmNvMThnT1VwdDFDNjdRQ3NpaDkx?=
 =?utf-8?B?VUtENjU1eitwTTRJcG51cjd1VFVsSW5md2Q4ODMzV0dUV2owVTJNYXlXOGl4?=
 =?utf-8?B?V0l1MG42Qy9QUTNpWWgyV255T1E4SldLVmZOL3M3MFFXWkozUG9DUTZLeUx3?=
 =?utf-8?B?YXh5Q1h5a3F6TjQ1bmhZWlhVb3o2ci9sd0pvNFJsTXdYeW1WYnZVR05IbmhY?=
 =?utf-8?B?bEl6dUJCNVNRdnYvVVg2NG5WMlBtOWM0bEQ2MElqcmZCVnBjRkQ4aXBQUlFE?=
 =?utf-8?B?d2ZmcXdxY0JGUS9ncTd1VFZLL0xFR2phNUJLbDdzVk56V0RIanByVzF0ZFNt?=
 =?utf-8?B?NzlGMU1EellMMXFqa0VJbWVpSmwvR1ZCVkZ1UTJpOFgxUWRUZ09UVHJKRFRX?=
 =?utf-8?B?SnFrR0ZxM3gyTlI4WmJSUWNYRm9PRGsvd01xNjZPNG9kc3VtK0xZV1ArZEor?=
 =?utf-8?B?Q05HaXM4dlN2VGYyTGpjWFRRV3ZKS2IyTVFlOVBXOFdYME00b2xLYTNTUkhx?=
 =?utf-8?B?cDNvd3dhSHpodVBKelJ1bTdMVGVMRnlEM1JpcmRzK1I2aS8yRE1YbEVsSFVU?=
 =?utf-8?B?SlJ5TVlaN0pjOEVDTktYcnRERG5mWmpBN1dlUlhLUW5DTDZpLzRZMS9Od3pz?=
 =?utf-8?B?SzNwOUtxRThiMFdEMUR0RzU5K2R6T0pRMnlCcHdZdU1IcmhOdlU2aytFU2Jx?=
 =?utf-8?B?cVdNQXkyZlVwc2NXcFE5RmNpQjBrajM4d3dBTHZiNFdUMUI5bjNjWWxuT3VI?=
 =?utf-8?B?TWE4Nm5oMmh2YlBYRHlkazFKSmFGSjM1bzhMOWwvSldJNzJneUs5SnYxUm9n?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7226337c-7026-4a63-ce29-08de3cfe43ff
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 23:53:09.4867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1njKwPrqKEakCUaYt3PanRhFoDPPmymMZDi9xFFJEb3qRGsULX9GmsLJkpImDXZJkXHPw9aQM4mL25rlKQDlBkDJMmyO8cGNu3Riw7zzOBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF11A2D5672
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

On Fri, Dec 12, 2025 at 01:18:10PM -0800, Dixit, Ashutosh wrote:
> On Sun, 07 Dec 2025 22:16:11 -0800, Harish Chegondi wrote:
> >
> 
Hi Ashutosh,
> Hi Harish,
> 
> > @@ -541,9 +541,24 @@ static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
> >	size_t total_size = 0;
> >	u16 group, instance;
> >	unsigned int xecore;
> > +	u32 base_reg_value;
> >	int ret = 0;
> >
> >	mutex_lock(&stream->xecore_buf_lock);
> > +	/* If a GT or engine reset happens during EU stall data sampling,
> > +	 * all EU stall registers get reset to 0 and the cached values of
> > +	 * EU stall data buffers' read and write pointers are out of sync
> > +	 * with the register values. This can cause invalid data to be
> > +	 * returned from read(). To prevent this, check the value of a
> > +	 * EU stall base register. If it is zero, return -EBADFD. The
> > +	 * user is expected to close the fd and open a new fd.
> > +	 */
> > +	base_reg_value = xe_gt_mcr_unicast_read_any(gt, XEHPC_EUSTALL_BASE);
> > +	if (unlikely(!base_reg_value)) {
> > +		xe_gt_dbg(gt, "EU stall base register has been reset to 0\n");
> > +		mutex_unlock(&stream->xecore_buf_lock);
> > +		return -EBADFD;
> > +	}
> 
> Since we are introducing an extra register read every read() call here,
> does it make sense to first check if there's a real userland need for this?
I had discussions with the UMD folks and the feedback I received is - it
would be better to return an error than returning bad EU stall data. If
a reset happens in the middle of EU stall sampling, the circular buffer
pointers get messed up leading to invalid data. However, my
understanding is that if a reset happens when a workload is executing,
the workload will fail with an error. So, the user would probably
discard any EU stall data collected. This error code is an additional
feedback mechanism to the user to not trust the EU stall data collected
so far.
> And actually have a UMD PR which will consume this -EBADFD return value,
> before we merge this?
I agree that the UMDs may have to do additional work on their end, but
their PRs doesn't have to merged before this patch. If EU stall read()
returns any error, the UMDs would probably exit further read of EU stall
data. Even with this new error code, they would exit reading the stall
data. Upon receiving this new error, UMDs should stop reading the data,
close the fd,, open a new fd and read again.
> 
> Thanks.
> --
> Ashutosh

Thank You
Harish.
