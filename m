Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5379ACD5BD5
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 17:52:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D181210F4EB;
	Thu, 28 May 2026 17:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BH1aYVmW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D422F10F4EB
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 17:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779990763; x=1811526763;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8fhi2cuex3yWz1WD4BwqLzEojPOS5s3r3FcQ95CiAqk=;
 b=BH1aYVmW7Bid5mQkThoguHp4930Qre1Q3oNwwAt4eWeaLLV00xmJBap0
 ipnI8LJDb/X6+wTZgw/dEEFTxEX35cBPHSTEIqC/m2PZc/0C+qi/d46I/
 mbdwnTyt5c/gLCf/rn9op7uN+TAX6mO3qM7t/g2G8W3C+QQOBASAJ8Pud
 3nd5Wii01Me16OhFZg7u59DdpQk8AgjBYARIDg7RqSWsbL3Vpsj6OrXV/
 GEantC9ThELR0kooS2IVy96VKDzbvRHcmEHYf+LxtYhY0b+hwt8BxlaJO
 jvsDmfAm2kfbtei8xeCGCTnnd/5YjkXJVbLT7MEmKVqHYTI59k4shcSFY A==;
X-CSE-ConnectionGUID: nks9mfRoRqCkF/8swfw/Og==
X-CSE-MsgGUID: Ly09KQ7TTv2S7C9kEUGUJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80901935"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="80901935"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 10:52:43 -0700
X-CSE-ConnectionGUID: QnZcDSclREy6nszBAg/KRw==
X-CSE-MsgGUID: OZKMkF2oSwuEitRWNpH6sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="247564059"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 10:52:43 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 10:52:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 28 May 2026 10:52:41 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.36) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 10:52:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RRRd4LUKHEI101/T8EO6oUEGynniTt4vTEqeGiLD7Pd4/VpHXr3X/rRblOnIkQMvVx/jx0n7ZTGKsgfuXe2n9I2/kF6lBNzZUwD3WRC3kwZWRWhcQmodx2LLtxMOnh1YW9vBB5hrGMgYMvQFaW5Omure4NVx27N0Mi+5P5z6zwgLLI+m7dvR8zcos8JR12LXeuabFrDWt/NIjgKzejs5eRPKxaTN8maWaK9UeZ6iskvfkOjUIeFk++U/3dvo0fWbSfc8b/HAxz8a/ET21Na0HVcA/b8tTpWWB7QjdoeUwMF0JKTn1i77E07a9ATIfQKije1Vr6JTzHJqnJsn2FWrAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fhi2cuex3yWz1WD4BwqLzEojPOS5s3r3FcQ95CiAqk=;
 b=UY63girIxO/hSMDcJtWyHySGlgEHJQmnGed/OY9tK8IlC6p7PIKmCidNZogLGM67nxusVfaeOcGGu2NxOJMx7bmYnRlyzaX3R9uByFpHCOlJtoaUk0KIPK6yBK+2NcdchIRgANCVnp6OoJjnjIYee4H/YkC9KQKUdCcbo/u9tFC7y9GTAgN55Cjl3vk7qrCFV/ORL9TjLdRz6CyCswKTvEM8yYLXLxO6rfIu5ZFxr+6WLjaBbHrErbwqdOE8DfBwB9NO3r4QXZISA8xM+XWHbV51H60KyNsK5Reu2HiCtdw3IaNDZjlvN7ZUtCrup3RcRRMG0wcYRYi6aEOfd9Sp0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by SA7PR11MB9596.namprd11.prod.outlook.com (2603:10b6:806:4d0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Thu, 28 May
 2026 17:52:34 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%4]) with mapi id 15.21.0048.016; Thu, 28 May 2026
 17:52:34 +0000
Message-ID: <9a5fbb32-f6c9-48ff-bff0-ec49c21d5f43@intel.com>
Date: Thu, 28 May 2026 10:52:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/xe/guc: Reduce GuC log size from 8MB to 2MB
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260511194924.2016315-1-zhanjun.dong@intel.com>
 <20260511194924.2016315-4-zhanjun.dong@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20260511194924.2016315-4-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0080.namprd03.prod.outlook.com
 (2603:10b6:303:b6::25) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|SA7PR11MB9596:EE_
X-MS-Office365-Filtering-Correlation-Id: 441f3ce1-e9c5-48bf-2543-08debce1e59f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|4143699003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: sxTv5yv6IBoOYbSvJ5VNHRE4IRfTMzhqvLoAYHJ8/tPeqn2LhU6bBO/TkFJ7ELR7oSd7gGV/mWrs3ZMXoksFL1Rkbgz0+Ti9GJs+udMFbLGvi66B9qhyrYPwKH5Ars4a0REAWHBgEgaZvEqG6Z3uW26wRCDyxJ5bTXywYWuqkEAuiOzVrrxbjeHphwDOU80DNZbw++4CA17CUFJUAkE8ayInGCVUcvUTxxzT5/vlbwMeiJ0lK/hUo4hbAsOWEqjEkYKUjTMOXGYN6XLWnGQ+r8ZfHp9THl/F8QHSTGcfxKZUTtZhyGRF1H3ces4YskJiurEbdk2grkMBLnltC2SYocRuEPJzfNsULBd6Y2SX9cV3KgwjAcghIvoG697SMLl3TNc/+8ELRIgbi546snRAurtWsksAk7RC4PTNgHuG7peQJaP1Y45GivAJH7bfS9/BejqViW5r9FnuYnppLou8Q5gGO5xWM5DaIFR5w7W0v0TKyklhi3Okcb2X4QVKOibSTgAcwFGZmyIw66dhUzk8mC10r02G8EriY0pxqd/u9HE0czMddNjEpFmroxoNfTvjs7TR6SWU6px7bU3cu4mL9+yiZnIPzl3b2LmQFMbPtElTRne7awgUZKAtfrmroFSgUwy94NTKlLb96YlYFit6T7TH/+WKA2zn9Dc42DggfbMt6pzbRstzBc3eHdibRaoB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(4143699003)(11063799006)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlpiaFpaTU5rWVROU3pKRmV2aTYwTVZWS0REMWRSL3RkY1pJdjFFNVZIaFdG?=
 =?utf-8?B?d1h6TVU2ZWR1eEJiSThOQjRhWDc0bjR5Y1VJZm5TSC9tWFA4bENmRzJ4WXp5?=
 =?utf-8?B?Vjd6U0F0SHlXMlQ0dkV4U1hLOG9HMTNsQWI0dldIK084QXUyS08zWm5CSzJO?=
 =?utf-8?B?dUdyVzR0MWxKSG10OW9qM0EzSHRYU1FpcXRTWDlnU2w3OE5ERTg3M1Y4a0Nu?=
 =?utf-8?B?aW5yc3Nkc2xoMldsTzd2Ylk3bnRUbTRlL3BkT2gvVitCZU1kV3AzVXM4K1Zm?=
 =?utf-8?B?eDhackE1Mk1NMUVYbFFHdGVlbGJMelgzQ0xidVROUU11MG1tUXVZTmZEOUhV?=
 =?utf-8?B?MzFNQWplb2tUNDErNFZHMG9zVjhVTWYwRUJKMWE3NjNHRHFON0RmMXJjV0JM?=
 =?utf-8?B?VENmalh3NFlJRHd5YU41ZUdQeWdUdG54LzR1dTVnSDFOcjRTSkpFWGNpbC9S?=
 =?utf-8?B?Z0RvUENwdnRGeVk3eVRHTEx2cGE2eVJVeUNwcHdESmZHVmRWU2h3bllGWHE1?=
 =?utf-8?B?cUc4Tmx2OVdLOWZzdDN2VmlKRDNsSDM1U1NVa1I4NXN0K2NHMHlSeStiRnht?=
 =?utf-8?B?NkRMUGhGeTh2TlRvenR3WFRRTTByN0tYbXRUQk5vQ2tIVVVZSTNxdzlpdmVx?=
 =?utf-8?B?eFFFdjhHY2c0ZjZsdFVlL0lkM2g1WmtUMWtZNzIwNS9XZE02bDd6dXFUeEI5?=
 =?utf-8?B?ajVGTFFyWjFxQlkyNDVaeEFPNlJZelZHRVlid1NrTG85cmcraEc0L0FYNVkx?=
 =?utf-8?B?MEZRU3FWcWlpaVR4d3hPVGh3cmMyVW1XKzFYeGIrcG82NFRvYXIrR1pWb0Iy?=
 =?utf-8?B?UWVtWFZTd0hPVUhYb1djektrTkhmb0lsVHhiVEczRVFTYVRTS1QwYU5BTFE2?=
 =?utf-8?B?Qk1PV042V3BDM1dhd045aWhyckllb2wwOWxXUlFGczRWTTdRc2VNNWFPa1Zl?=
 =?utf-8?B?SWZwcERYRzZHZXRPeWlNb2oxN0VCbXF2Zk5Mako3WnN5TnZrdWUrL1lXNEFl?=
 =?utf-8?B?TXpITHBiVFhNR0NaYnF2TDFTTUVTdU1lOEdCZ1R5MVl0ZUtkMFlUUmV1TzNq?=
 =?utf-8?B?UkFRc1JjY0dIaURSUUIyY0M2dG5VaGhybmdnU2UrT1dad1JRamVBVy9wOVN3?=
 =?utf-8?B?VkhwWHZvVGdjdFg3SXByRFliSCtQUzJ1V2ZrelcxZ2dWbjA5eXFMckYwenFk?=
 =?utf-8?B?bVdWMFBCeDJPQ2toenRjdnNjbWhTbVRKNWE5c0JhQXpGa1FNcXRJbXlYYUFx?=
 =?utf-8?B?UlVHb2xZbEM1UlkxSUI1c0JHNHE1eVZnMGhJOTJkTGpuSmg2WkFNVnNma2ZM?=
 =?utf-8?B?VTFTMmhJRGdlcGx6Z0F1eVFNLzVnSFNZRU1wZmtsRDgzUm5Ra0lUSFZkS0lX?=
 =?utf-8?B?NitraDJ2NjBwdHlkS1c5TGlLUUZoQXNWMEc2MW1rVW1qN1ErWjVjN1dBeVpK?=
 =?utf-8?B?eUJoS3FLb0ZIa3BVV2VVUEQ4SXZEa21DLzlub1ZHaGRHOFkyeGJQb1FQL0NH?=
 =?utf-8?B?WGQ3NlpjOGdtZDI1VkREMUh4dTBEN0dCK0N1N0NEQmF3Uk4xN2x0K2orT09H?=
 =?utf-8?B?VzZRc09kSTlqckwrNVMxTWlzTFhTQi8rQVFDK0Y5MllCY2ZDTFBkRG8yMm5r?=
 =?utf-8?B?ajQxak1tYnp2RDQweDZxd1ZKMGV3c29QM09LUm9Jcm9LWStRT1FBZE44SWVN?=
 =?utf-8?B?MGY2Rit6YWVtRHJwQmk0QVhhbG5WeXRQNkVxM3lBVmU5QndQYmJ2Uit3WEdi?=
 =?utf-8?B?RlhhbGUraWdrS1JjeEk1MFRSdlZITythVHhPVFJYV1FYSVBTYURpN3NaRlNj?=
 =?utf-8?B?SFhQdXRaTDJZVk5QTXduYUczVGtjNjl6STZiQXgzTUJNVVJ3NkhMWk1odHRl?=
 =?utf-8?B?ZEFkeXF1VlZUV1A0dzJJWGxDOEpSdDVwMWlPcjN6U1UyQW9SeExUcXBLcU43?=
 =?utf-8?B?a1VQYy9FWVVhUStsNlZNb2VJY09HQlJaeWI2eHcrY0ZPWjdkSE1NdDZLS1Z6?=
 =?utf-8?B?S1lNbVFqMTBnQmwwUVFQMlpHa3Q3UUtoOE1zN0hQRzBNcWtzYUMvc2xhMUxQ?=
 =?utf-8?B?SGZOYldHRExjWGNqMWxPanc0Z0t5Y0p4bnZRWXRDWXpXS1Y4bWtiK0RKbXVq?=
 =?utf-8?B?Z0d6T2xhYTFJQjYxZllTdnB1aW5yT2ErYi9jWEdranpZN0gwRE95YWhVckp1?=
 =?utf-8?B?U2dDNHdReXpvdWN1MFREaVJzUG4vM3VVamlkQlRCNW1FMC9uaDN0WG8yZDdq?=
 =?utf-8?B?WE5xbG16Wm1mYSs2RFFDZzZ0ZEl4bmVzb0pmRGpTTWdIYm9OLytqaGJMcnBE?=
 =?utf-8?B?WGJwTlJmNjNaNzFSNEwwSHNkNElkOFR4bG1Ndjg5bzlVTTBSQnFCSGlIOUkr?=
 =?utf-8?Q?7utCZidejwDYKKdM=3D?=
X-Exchange-RoutingPolicyChecked: F6sC18Uxd24Z6fNA3QbaYrVchFAyakfZhx6I0HfhgtiY6v09GIydNkwzMUR71g0lhSHmebZw8XeGnugZtevDQq5uBIoC4+G16B4wZml5ixnmPGvKzntWSzBg3sV+ZS7GmExWPHnyqj7eQEqFdIG96RqYox8Ibf4riCk3yrsRTa5ipAKHhcXFhJAvWgIG17efF9cmRpb5/5qGQ/FXoWRKv94QcQK7YajmtfBUYFsfZMt6UVo8ytBnCXCVt/7Md62lz1ksE9fB9s4UWMn1gJ+2BPEY+wsTxmZGkJ4S/oeswtf0Cw0jQCuDDnWxasApE3VTfAH095yWii8Jt1joDQUKow==
X-MS-Exchange-CrossTenant-Network-Message-Id: 441f3ce1-e9c5-48bf-2543-08debce1e59f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 17:52:34.1599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2/I4OyxenYrnCTLi2S+i7/Zjv3JUcD6+CxY3g2e8zDYWjt18SZChYdRT7zOHVPay9uMpaH06jbfD90aHeCOD1QQGWf5bJ8rcmZ7oOj3WSyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA7PR11MB9596
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

Change looks good.

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
