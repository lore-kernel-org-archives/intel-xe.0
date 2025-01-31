Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4828C0218F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 23:11:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5491210E226;
	Fri, 31 Jan 2025 23:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cUOyNwIk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD1610E265
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 23:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738365118; x=1769901118;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=d3kMOwz+W7N1OrYbS9A81GBJCzw6bLuw+/yeSgSGmaM=;
 b=cUOyNwIkbeCuHBJ6/k2NxptTMqPeiWsHzvG3vSl7UONEKekmcijQeXVX
 sVVP4IrKrfM6eqgTW7e7t1fjLbOinvYOOTX5b5aCvsF3TjfxdfCij9Sad
 iO/gq3eVXFobXXLbDu1LKg3tET2F+Zn5tftDDGtuubl7RQZPvyyWpG/+Q
 Q9dWHsFOlcTNFeofE9j+bS+7st1JmkXquBIOeyCl/EcWr2jAS6fQGHvKB
 6/XhXeh1UAM2Eapi3f3naoVL9oODio0ToLlP6EdC5VGe3mz/D93mCWbLV
 yNseEYQRl2gHwXxeT2B0Nv5N3nfIHz54mLVOe/5bIwrg4f40gSuFIgpcj g==;
X-CSE-ConnectionGUID: X35Cnqi8T/2JybQTDUv/nQ==
X-CSE-MsgGUID: L8BdXkIURdqCWkTSDEMKzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="61415720"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="61415720"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 15:11:57 -0800
X-CSE-ConnectionGUID: IhdeaZWyQQuMda4jUiyikQ==
X-CSE-MsgGUID: 4TWtNN6cTGKDOzwmgQ22tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110628067"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 15:11:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 15:11:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 15:11:56 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 15:11:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sDxNGfje8aG9LlusOHe9Cr/J3h6J5F5TEm+UX1xQAGv2/jnVIJkVba3zvuyD8R3XvTEYI4fdM0//QZ6x3ahLs6h434aDoysMM4fUNdLo1ou26ezF70+UTTFOqPGb++nBpbZm9+hQbevqZzNxW932ube70HDwzvDfWIT1IcJOYfMkf03NLyjdYZ+lPCxZ/OmDH+qmvSXPPdtC82z6CGmH5Gp4vu9GGVRx3PvjP19jj1rVj/RyGcF+Qyhfyeo2Zxtu2cKca+a+uJ/8KxgP5osLteyXy5h54V+Hyo/bVx1mD64SQltpAL2eOECanMfDz/fPxuKls5+FjzZcwp3CGs/45g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzalSzQbziFcTeJM1wAgac5EUY93a4uUP+wjlvffe3Y=;
 b=cd2ie/mU1dqLlw4We48MsA8ZsHSYssNTINMt4ZbdCI5EHVV0iaAFHS4K09qL34ZDHIXqtB/n0h/ojtdL7LUlPWTDMTjs60rcO8LWwTqOBKqX6mE3vgjwhb0Ep8MQE+s7IG3zvB+ecSE84BMt6OvpI2nZgtdd7XMKtr6lN5GZsGt6CeZgCHbphQ8xFEjM6MpOILhsfZpsGkKBnaZSDG/D05JwNCC3zswP+m+XhFkZKFPJ05ciGE2FJSfwadauilLpxjQCor+FL4uMVG14F9MShFlLnll0HIIXbRpN2acGFdr78MLMUAKqMooYEHqThsNigee/AJYps5oG+QldtAQ5QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS7PR11MB7932.namprd11.prod.outlook.com (2603:10b6:8:e5::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.18; Fri, 31 Jan 2025 23:11:25 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 23:11:25 +0000
Date: Fri, 31 Jan 2025 15:11:23 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v4 4/8] drm/xe/xe_pmu: Add PMU support for
 per-engine-class activity
Message-ID: <Z51YmyBWc2HlsSZt@orsosgc001>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
 <20250129101653.1976699-5-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250129101653.1976699-5-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR04CA0339.namprd04.prod.outlook.com
 (2603:10b6:303:8a::14) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS7PR11MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e6068a7-9661-4b5b-c0b1-08dd424c95ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ckJpZ3Nhd0xYUkhMdDJzMzI5aVZpNzB6ZEE1M1pOd1BIbCtXZHpldWI2UTAv?=
 =?utf-8?B?dGJORUZOWUx6dUNYN01HT3JnOERnWlRDenpSZ21rcktsQTJ0eHAyMTBLSTN6?=
 =?utf-8?B?bXRFRzkrTUhGQm10bitmVWthQ1gyWHZVL0xYdTFMSElhVS8xajN1Z04yTWpB?=
 =?utf-8?B?d0lmSjhHeFhDaFpFR1FEL1RDMXo1OXg2ODN5UFRXOHRRRE1sc1JUdmFjS0V5?=
 =?utf-8?B?NTdieXFlSmtOdjZjSEZ2bkJvbE9iaE9LU1ZvNU15UnZLVnJySHVxV2JlbmJO?=
 =?utf-8?B?dkRwUE5Kdkl3NmZvZ2w2MjQrYk0ySDhrY2Fsb0NtSWdsVG5XSmZYcktxV2ZX?=
 =?utf-8?B?aDZLMmpENnJmV0xPK2E4Uk04ZnhnUjc5TE9UN3RJTzMzMHVhUGRvRGRycHdX?=
 =?utf-8?B?MVhKbldPMUFoWS9obkg3KytvT2JuaitPKzNvTDBQbXhVM1BLekt3cE9ld0xM?=
 =?utf-8?B?ajdsMmZQdjhmQ2FuOE1zM2ZBaTZWL3l1aGh0elhkWHZjY0FTSXhvWTBiTm9a?=
 =?utf-8?B?WHJTU2l4NHI2Qk9KRmY4cUtyVmZIb2t2K0NYdXN3eUxCL3VEVEpDTWdHeU5t?=
 =?utf-8?B?Z3Z3ZTlnOXVWSFJjeDdKOXo1emt5eVdLZG5JUWpXUnNPSkJqMWRaMzREYW5o?=
 =?utf-8?B?SEVkWUpPdEZjL2pSRjV6Tm5MZ3FVajN6WWpWZDRFQmpYQVFMampyWld5bDZC?=
 =?utf-8?B?NEFJdmR0WDBwZXNxTmlRTlNGcFN1bDN6bWtnT09YY25nWnJlNDlydzFsRDFk?=
 =?utf-8?B?ZTBFcFJjR29MOVNGMUhlWWErSjhqUFhMMTR0dGxIODBuVzFzcUVnN1pQQ1c2?=
 =?utf-8?B?QWdMWk15RGdBL3R6M1k0SVdxUXo3OHJIakJDZzBWc3F2alk4VTNRZGR5bmoy?=
 =?utf-8?B?QWU0ZEd4aW1UTDhWSDl6VmRxLzFrSnBBeksxUS9uZzlaMk9SSGhzOFRGZVc4?=
 =?utf-8?B?Rmg3azNVQ1dqV2JQb1NNYUFIdVRJYUVTSTZkOXFiMWVSRG4vWTJ2WU9tRHk5?=
 =?utf-8?B?QzRBbVBleGVKZy82MnpNVk9vRFlXY3YrTGhGdnF2a28zbkxiZXFxTTJCY2I4?=
 =?utf-8?B?aHdBS0wyWFZOb3NvK04zVzdTUTlUQlpheS9LVkpzWmE4d2JUSW9jNHptTytM?=
 =?utf-8?B?YUZsT2RQYXdwTWloa3kxb1BYSldkL2ZtYWpkN3l5NDZjSG0xYkFxMGZOeWdL?=
 =?utf-8?B?RXNKNGJjNC92YlJJcy9LQ1FIVFR4dmdxV3VkSUlycFJ5Z2dWWnEyVmdJTUhK?=
 =?utf-8?B?U0lmSDlWNnRnQWowS1Bob2pqallqbzRsMHJVN0ZIV3pLSktJS1ZJYlg3SUl4?=
 =?utf-8?B?SDBrbnhDeFBTRnNBT3BYa003YWtLK2ZXaHpPanRYWS9VNmZsU3J3Zm5ENDBV?=
 =?utf-8?B?empxbjZwbDY4a094ZkQ5N0xVOENEek9va05Pdk1sS29MTGdmSXdKK3FpVk1C?=
 =?utf-8?B?NG1RZHNGNEhwMDhnZEtMUEhNcWo5WjVQMlhBbEhndkowRDVNcUxKV3MvYnc1?=
 =?utf-8?B?Tnh4ZEUwbGVhWTJJSGkwRjZBUVdibnBYNjVBc0pDbmg4bEFPeXhyVUMzSjRn?=
 =?utf-8?B?QkZla2RPSTVqSjkrTXdTZ1B6aGZUcTRoSkYyM0tSREJTcWg4YXcreDJlR0tP?=
 =?utf-8?B?Y1NRUkQvODB4WHlXU0dOM2R4bkgwSWloc1pUQkR3UlptTTQ2YWhrQmVYTGRM?=
 =?utf-8?B?UDJRU1kyUVhSUm95VndPNTNWY2lHY2FHaGxxU2p6YUlMSTJDbnBNM0FiYXR1?=
 =?utf-8?B?VncyOVdaaUx3SUpBNmhPZE9IbThrN3ZTMjZUQU5YckZMUmRtc3dBSEs1Wnd0?=
 =?utf-8?B?bldVYUQxSHdIQmJzUTh4ZlJDdTZlUnc2STFab1ZzelFnaWZCTzdrYlkzZXpC?=
 =?utf-8?Q?4JfZtfbO6SpDV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NG01R0RtQ3IrajQ2TzlzSFYydFlBcmg3Z0xicHJXMW51SXk4VEkvdTBrQVcz?=
 =?utf-8?B?bGZGczVNdXB4blNLNlpCUldQYjdmN2ZxWmdPd0tNZ0t2dkE2UWh6WHMvK0ls?=
 =?utf-8?B?Z2lHQk1DWjJ1WGVkeFhLTjZiRXFBQVR2MUhHdGhnU1BuWmcremNWTmNoY1hx?=
 =?utf-8?B?Z0hCMG5iTW5zb0xYMU9VQm9YNlRYWTB5c0VjbHIweDRvS015Vlo3TlpITW5D?=
 =?utf-8?B?QmZOZlhjUEc0b2JNSDJpVk9Ibko4WmRVNUQ2OGZoYnFBTEp2cVVOZy8wRG9P?=
 =?utf-8?B?THg5VzZIK3lZMXQ3amoySThqM05aZ0VzTk85ZXFDaVVKc3NEcGU2czlHUWFz?=
 =?utf-8?B?YUpqYnphN1RKSExDS0tNa0FjZzBlWVloL3dEcUg3djJ3SWlmYzRmR21mUUVh?=
 =?utf-8?B?aE02VXBDWXp2bFRRQ2taTlFENTBJVjFXb1lGWm9idEphMEF4L21HZlFreEs3?=
 =?utf-8?B?VVJHZndJN2NBVEFHK0tGMXpFaWNxeUpNSDRNRlpGRE1QalVCYWxwT250U1pU?=
 =?utf-8?B?VFhnRUNScUVnazNsYUcyR0QvR1dCQnZ2T0E5TWN0RkVvNkRyVkJSejI5aUgy?=
 =?utf-8?B?eDN0bjY3SC8ra0d5SDIrUDVBWitqMGJ3eTVWM21maW4rcXgxby9YWEdSUitz?=
 =?utf-8?B?eDNxUVhMeDM3R25tZEhBKzNHN2xXOXdmQStwQUlnMlVid0tYOWRKZUJyMUNo?=
 =?utf-8?B?cnQwSHYrajNDeVNYWEZ6d2oxZlBneVRqaEkvajd1ZHIzQzBtSHh5dFZFSkgr?=
 =?utf-8?B?U1NIb0lHODdJeTFLUXg0bERLaTBoU0hURjR0TWgvejRqNkM2YlVia3duWmRQ?=
 =?utf-8?B?ajJrcWswcVFBakhFOWV3RFZEczdqOUxtUjB5SDlvR2J6YWovNGF6Qk12N1hR?=
 =?utf-8?B?cnZvbkIrM2kxcGVKa2V1ZnJXc2htMm5IRlFUZDFZTlRVbmdlR3VRbGhGdERZ?=
 =?utf-8?B?M2xZakpqWE5GQndDRGZjMnVlclAxMUc0eW4zbDhEblkyTUpuelh1ODV1L2dE?=
 =?utf-8?B?UFIxS0N0LzkyNExpaVJScDJpb0VSR091SllQT29LMmhzalJQRmdCWFlOeXdw?=
 =?utf-8?B?NU9xdkp6cWFEbXBEdHpmeU1mS01BOFhqT1pzSkFlZjRVTmI2ZG1RWTJNTkxS?=
 =?utf-8?B?ZUpnaUJIVkhWUnlzd2xSUnNSQ21URDRpRDdNQ2FHTDNnNFhUVDZIK092aytH?=
 =?utf-8?B?UnU1eFhyMEZNQ3cxQ2sxZW9oQVNubmlpMlB1M0RwUDFuY09EL0JwT2FuWlB5?=
 =?utf-8?B?dVcxbk1kTndIK0VPTThLQjFOYVNQeDNnNkp1UkxjeVd5Y3FEelZxRnhDTnox?=
 =?utf-8?B?NEFDcmxhWTNlVDhJR1loc2VPSm5IWm5LNFpNUnljL29vbElFRFc1YS9KUU1L?=
 =?utf-8?B?VlhxNTE4NXNaR0JDT3ZNM3dOQjNWWkVUK2FJc0YxQ2M5ZzFxZUZjUXlIbWR0?=
 =?utf-8?B?Z2o2VndMTUF2Nmt5ZStIdDgyblpUNXhLczlLMVNXT1E4UHZieXNBcnpyZmZR?=
 =?utf-8?B?Z05YZXBCMzhLWFRTSlJJVHp1VDJnU0ttRXlZWlRKR3hQSFAwNTJqWjRwT0lz?=
 =?utf-8?B?My9aajB0VTVwV3NEc0NTRzlBT2F4TEN3elV2bzV5ZEUzTUNoYUpDNUgwN1Vw?=
 =?utf-8?B?S1FpVUQvVDBiWlNaUUZGbUpDZ09PaGtqNmxNVHROU2p1aEEreTdTcjhhaTJ5?=
 =?utf-8?B?Tlg5aE5JWWdBRWJJaC9SVlUzbXJiYkFEYWpreWhkaDBJRjl2eWRQRWNrZ3NG?=
 =?utf-8?B?VW5BZllnWi9lSWl0Q0kydVUyNEgxMm1ab091d250Z2pEcjJMVUI4Q1lUTnZy?=
 =?utf-8?B?RjloTnk5bkorN3JJNWtGZjJRaTdraWQvQ1VzZTRqM1FZNklENUFhRU93KzVy?=
 =?utf-8?B?ZGxDY0FuenBGai90OGlpQit0ViswSjdXbmdqWTRlbUE1YUZIcENHaUkxY3RV?=
 =?utf-8?B?YWw1S01DM25GN3BQNkg4YzczSnNYdUFtc0lDWEtxQUVTKzB4Wnh0WDVpemto?=
 =?utf-8?B?KzEvZ3lCRDY4QkUyOWgyVGl1dktvQ2R4WWV5N3FubXYzeml5bXhveVhLSnRi?=
 =?utf-8?B?SHFSVDdZK0s1S0J1VFNTdE4xdUl0d3dpUC9SWGpDbXFNL2E4cEMzbW52aUxG?=
 =?utf-8?B?TXk1bldxcXhtWXRyQTVSTU9lZlpCZFdUeWhzcFZGQitjbXppN3hsRUJTZEow?=
 =?utf-8?Q?sdxuRa05JzCET9IX3AZeEzI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e6068a7-9661-4b5b-c0b1-08dd424c95ba
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 23:11:25.5852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ye1wOvl8IcQi+GKIZ+O9szaO7inUtuIKuKIgxvtpvqOcQRFQOeNWTeNw+2rUARuCuCzB9TbqY4DwIz5Mv7NCsc9FPfuXop46SCQwJuCHWvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7932
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

On Wed, Jan 29, 2025 at 03:46:47PM +0530, Riana Tauro wrote:
>PMU provides two counters (engine-active-ticks, engine-total-ticks)
>to calculate engine activity. When querying engine activity,
>user must group these 2 counters using the perf_event
>group mechanism to ensure both counters are sampled together.
>
>To list the events
>
>	./perf list
>	  xe_0000_03_00.0/engine-active-ticks/		[Kernel PMU event]
>	  xe_0000_03_00.0/engine-total-ticks/		[Kernel PMU event]

checkpatch complains that the line is > 75 columns here. Maybe drop the
'[Kernel PMU event]' and move it to left:

./perf list
	xe_0000_03_00.0/engine-active-ticks/
	xe_0000_03_00.0/engine-total-ticks/

>
>The formats to be used with the above are
>
>	engine_instance	- config:12-19
>	engine_class	- config:20-27
>	gt		- config:60-63
>
>The events can then be read using perf tool
>
>./perf stat -e xe_0000_03_00.0/engine-active-ticks,gt=0,
>			       engine_class=0,engine_instance=0/,
>	       xe_0000_03_00.0/engine-total-ticks,gt=0,
>			       engine_class=0,engine_instance=0/ -I 1000
>
>Engine activity can then be calculated as below
>engine activity % = (engine active ticks/engine total ticks) * 100
>
>v2: validate gt
>    rename total-ticks to engine-total-ticks
>    add helper to get hwe (Umesh)
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc.c |   5 ++
> drivers/gpu/drm/xe/xe_pmu.c | 129 +++++++++++++++++++++++++++++++++---
> drivers/gpu/drm/xe/xe_uc.c  |   3 +
> 3 files changed, 128 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index 1619c0a52db9..bc1ff0a4e1e7 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -27,6 +27,7 @@
> #include "xe_guc_capture.h"
> #include "xe_guc_ct.h"
> #include "xe_guc_db_mgr.h"
>+#include "xe_guc_engine_activity.h"
> #include "xe_guc_hwconfig.h"
> #include "xe_guc_log.h"
> #include "xe_guc_pc.h"
>@@ -744,6 +745,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
> 	if (ret)
> 		return ret;
>
>+	ret = xe_guc_engine_activity_init(guc);
>+	if (ret)
>+		return ret;
>+
> 	ret = xe_guc_buf_cache_init(&guc->buf);
> 	if (ret)
> 		return ret;
>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>index 3910a82328ee..8ea78d8f7e2e 100644
>--- a/drivers/gpu/drm/xe/xe_pmu.c
>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>@@ -8,15 +8,16 @@
>
> #include "xe_device.h"
> #include "xe_gt_idle.h"
>+#include "xe_guc_engine_activity.h"
>+#include "xe_hw_engine.h"
> #include "xe_pm.h"
> #include "xe_pmu.h"
>
> /**
>  * DOC: Xe PMU (Performance Monitoring Unit)
>  *
>- * Expose events/counters like GT-C6 residency and GT frequency to user land via
>- * the perf interface. Events are per device. The GT can be selected with an
>- * extra config sub-field (bits 60-63).
>+ * Expose events/counters like GT-C6 residency, GT frequency and per-class-engine
>+ * activity to user land via the perf interface. Events are per device.
>  *
>  * All events are listed in sysfs:
>  *
>@@ -24,7 +25,19 @@
>  *     $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/events/
>  *     $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/format/
>  *
>- * The format directory has info regarding the configs that can be used.
>+ * format directory configs:
>+ *
>+ *        60        56        52        48        44        40        36        32
>+ * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - |
>+ *   [ gt ]
>+ *
>+ *        28        24        20        16        12         8         4         0
>+ * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - |
>+ *            [   engine_class  ] [ engine_instance ] [         event             ]
>+ *
>+ * engine_class and engine_instance bits will be applicable for
>+ * per-engine-class activity events (engine-active-ticks, engine-total-ticks)

Please also mention that gt is applicable to the engine events as well.

Also a line saying "engine_class and engine_instance are not applicable 
to gt events (like c6 and frequency)".

Ideally it would be good if there is an intuitive way for the user to
determine this association, maybe something like:

gt-<event>
/* gt should be passed in format for events like  c6, freq etc. */

gt-engine-<event>
/* gt and engine* should be passed in format for active/total ticks */

but I am afraid that could just result in very long event names in 
future, so I am okay with what it is now with the required documentation.

@Lucas, any thoughts here ^ ?

>+ *
>  * The standard perf tool can be used to grep for a certain event as well.
>  * Example:
>  *
>@@ -35,20 +48,34 @@
>  *     $ perf stat -e <event_name,gt=> -I <interval>
>  */
>
>-#define XE_PMU_EVENT_GT_MASK		GENMASK_ULL(63, 60)
>-#define XE_PMU_EVENT_ID_MASK		GENMASK_ULL(11, 0)
>+#define XE_PMU_EVENT_GT_MASK			GENMASK_ULL(63, 60)
>+#define XE_PMU_EVENT_ENGINE_CLASS_MASK		GENMASK_ULL(27, 20)
>+#define XE_PMU_EVENT_ENGINE_INSTANCE_MASK	GENMASK_ULL(19, 12)
>+#define XE_PMU_EVENT_ID_MASK			GENMASK_ULL(11, 0)
>
> static unsigned int config_to_event_id(u64 config)
> {
> 	return FIELD_GET(XE_PMU_EVENT_ID_MASK, config);
> }
>
>+static unsigned int config_to_engine_class(u64 config)
>+{
>+	return FIELD_GET(XE_PMU_EVENT_ENGINE_CLASS_MASK, config);
>+}
>+
>+static unsigned int config_to_engine_instance(u64 config)
>+{
>+	return FIELD_GET(XE_PMU_EVENT_ENGINE_INSTANCE_MASK, config);
>+}
>+
> static unsigned int config_to_gt_id(u64 config)
> {
> 	return FIELD_GET(XE_PMU_EVENT_GT_MASK, config);
> }
>
>-#define XE_PMU_EVENT_GT_C6_RESIDENCY	0x01
>+#define XE_PMU_EVENT_GT_C6_RESIDENCY		0x01
>+#define XE_PMU_EVENT_ENGINE_ACTIVE_TICKS	0x02
>+#define XE_PMU_EVENT_ENGINE_TOTAL_TICKS 	0x03

checkpatch warning here ^ (space before tab)

Thanks,
Umesh
