Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39AFEE01FA
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 01:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E0E10E9DD;
	Wed, 11 Sep 2024 01:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iuaG21xs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC09310E9DD
 for <Intel-Xe@lists.freedesktop.org>; Wed, 11 Sep 2024 01:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726018076; x=1757554076;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=u5N5MGyUlgF++N8IIpx+1BJdf5ur0EE1FUVKx/iqTvk=;
 b=iuaG21xsPbOpRm2sJ4wbrNytNBkf3dcwwN9Oz8ZELOvXSeDy+wMH1fde
 EGFvdWkwhewTGXUsRq2b4BB340fdiuWnnhXdkAupOQEVihX3tkpBp4EIe
 jtWcwvFBMTT5zidAdRqQrkS6w5tRbqw9LjRMnvcajCgnwaHkXEQJdP5WP
 vR6Rz8UUoMHV31LhP4wZ4uGlYo5GZRQU7aklv4p+xoc6QXd46EtOfP/jx
 vdLcVeQsR5UXOwlXk6sHm/9yovCpQZOiQAn2xvXKOd7T1TI14re2ggfh6
 gxoe+kl9FAx3MafV2Heg2l5OZa1xJA5GfRGhAmh+ulhnbAjFyQf3hvaVR A==;
X-CSE-ConnectionGUID: nUFVhj0aSlKc0im0cfJTrw==
X-CSE-MsgGUID: 7/LZ/HhwTbi6kO8Asv1nPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="28537868"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="28537868"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 18:27:56 -0700
X-CSE-ConnectionGUID: AsTYJ5QHRWaSzE64OxES7A==
X-CSE-MsgGUID: 7qgmjyxlSbuXqh670m6d3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="67162260"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 18:27:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 18:27:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 18:27:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 18:27:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=quv5zBCAHrRSF5StpOEGTW3JIguALRt/V3AQK1Jo7XtiOObLOW4w45pDMFmLOmjWI4mR4gBi78JQY9QlNgH9/vDktGKcTEwWeCWtPptkVh4zpcP9IR/vd9z0IMGaNK82lSon7BseQngG2FGrxRXGLEYWqBk8pt4tCQDeQxTFgee2DsTLK7FfSQOPoE6uvyz2tQtjp6l9bb2AbikVpPc0sbLbRi1aZthJZ8T4boUbKCH9BsTP3MwotMcGtVuRozMe9OGECEDehODZI5fBmRnZTltro6j2AbnCllNftAWJGOZEZiM5ctcb/a9QExm/VpZfKbLISc3euo8n1XG37LVmEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ypp92QXZibgzOArWEYSlCRAGF8aVwrVzhHshfESiXE=;
 b=KlDNMQdGZHsg89d34iu9mOZP1KSCo51ul/Q7JKmrhxucYwAlyoZjF6sgjiY40c4ri5BMD1iZ68ns1TzQRvkLejF72aY90862yZy7NOiOapeqEiNWyyuhIGQQ6YTrJjXf7bmJDErr1TQ4eq0Uuv8rRfwm5L/nkNvCa3bxUm2dOgkLFmjRoM03Rq7q4gvDW4q3yx+xpkWbUlJRS3sVr84joEpdUpg1fh/V4iT5eSR874oFhdsRvZwI83JBT3vEgJpzdJWEyocdaLLR+wcnUbauUeJa+lfevHVTA9ffQk1TdsIYO0H/r7iE/cbSima4p4oKfcWIrcRYSxTxbIACFEYSjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 11 Sep
 2024 01:27:53 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%7]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 01:27:53 +0000
Message-ID: <9b0ecab6-0003-42ed-bb35-4e3cff7cf4ef@intel.com>
Date: Tue, 10 Sep 2024 18:27:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/10] drm/xe/devcoredump: Add ASCII85 dump helper
 function
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <20240905205106.1063091-4-John.C.Harrison@Intel.com>
 <36c69a89-eb37-4300-a376-cc1395f8375e@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <36c69a89-eb37-4300-a376-cc1395f8375e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:a03:505::15) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH0PR11MB5880:EE_
X-MS-Office365-Filtering-Correlation-Id: a1250aea-eb25-40fa-8ed3-08dcd200f4cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejVEa09xcCtXTXlIT08vSnp4OTUwNVBCR0hPejBzcnVLYlcreThZZlRCUy80?=
 =?utf-8?B?REhjVjBGR25tMXdWOS8zZGtvMWNaQXZpNFJ3OXMyRmRnVkNKNDVtMU05T0Nm?=
 =?utf-8?B?N0xKMU81bm0wcHFhYVZDUVB2OVd6bGNLaWU5ZUsyN3FHVjBWSHFkOFdNa0xC?=
 =?utf-8?B?bWJlTkFqV1RJamtnbkM1ZCtxTTBWaEtETXJvNEF3L1VIemR5SnBDWng5RHB0?=
 =?utf-8?B?WWNhS0lzcXJNdW5FcVNqRlozRmtFYTE1SmhFd3laRnpIVDZBTzcwWTYrdHhL?=
 =?utf-8?B?WGcyQmVWQXEzRlZlalF2blVZUVdVbkFObUZwOVU4QmlVY1lFekNwdWU0UVpH?=
 =?utf-8?B?RnZpWmM0WnF0dXRhdyt2QzlxQU1MRlFyVC9zNEIzMGNsc21zSjc2cU9yYlQ5?=
 =?utf-8?B?MnYycUZsT0hRZE5qS2xwLzNvSHVIUW1zWVNFRTRxV1FlWWpvamdTV1NSYWlD?=
 =?utf-8?B?amhuV0pHQU9sRlNiZ2dIYU52ZFlxV3hWbkxwMWE3Z2Riamg5ZW1hNVhySzRz?=
 =?utf-8?B?NlgrYkw5bGtST2NJbmJSZTVyWHo0K3gwR1pHczNoZVVIYzFjL3Q3SjJVeUgx?=
 =?utf-8?B?a2RIdDdMbDJ4YlJtU09EWEJWdjdrRUpweS9WMmh3RGVuVnovSzFOV1RxYU1O?=
 =?utf-8?B?Z0I5c1kxTklaKzhNMmgyWDRNYmUyRmh2R0VKaHZuRjNOR0NFMFJkNzRidWtX?=
 =?utf-8?B?bnlTZFQ4ZCtTWkZyWXdIL0VJWlc2dmJ4eGs4QXBYbjNtbFJsc0h1UWg3VEV2?=
 =?utf-8?B?NVZXbGx1K2JUajhWeWJYWnJYQ01TZXhTZzFvcktVeXVjUEs3OVo2S3diTmVX?=
 =?utf-8?B?YndVT2h3ejVINmY1UW53TW9RNkNNWkVrSndQY2dGNWgrc3YyR2JSOUh0ZitK?=
 =?utf-8?B?aEZiTW8wcHpacG9meVJJRUE2OXJ5TEJnVjhkNktnazYvcTJWcmNCK1V5dXpn?=
 =?utf-8?B?UEdnSmhOem00RXEwWHkwdjZVVHZMM0hGaUN5VW9NNjFjRzJJZWlWcDZYR0VW?=
 =?utf-8?B?eXU5TGs1SldBdTM3cElRYXNpNEZCanFYTmUyK2ttQnQ2WXltZlZxL2FBTVB2?=
 =?utf-8?B?T3puenBlcitVYWUxRE56OVJXb21ybThDOTZCZWYydnBSMGNXOStucTgwVERB?=
 =?utf-8?B?enc1ejhCSk9iaFNKem1aTDVBclgrVGpQTTZoRDJMWUlLY2dnenlCWE1nOUVq?=
 =?utf-8?B?Mm1BV0lxQ01zN3NRVjBtYUZPRVhTRVBPRU5xSlFjSG8rQkdGUmVIamhHa0RM?=
 =?utf-8?B?cGN4MXRiRm9nb3F6emEwa0xyaGZ1b1FkOFF1bFBiUHRUR1lkd1VLTmJINVN5?=
 =?utf-8?B?VG5HamVTaFF5cGZzdDZqbENJMnc5NHYxYUFOWVl1dHJxQUluYlJ1cWpGbWJh?=
 =?utf-8?B?R1FETHFGOFduejVpZlRzVXlhQS8vNTBlWVB1OTROc3pLUE9WVVRNaXpPQ0R0?=
 =?utf-8?B?ZVhyenJRNStDekJuTDBIWHdpQm84YUlsSXIxZ3VCWEIzNmZJeUlmYm5GSFZr?=
 =?utf-8?B?eTA1RVZrOE84K0pjSjdmWnhRTGdjbWVUbEJhREdRSUxOWjBOcmlBYWVnTUpm?=
 =?utf-8?B?ZWNwM1BmR3lTOHVlZElyaUJHbmttUUNSdjV6K0FpR09UcTM3WlFBREErN3Fq?=
 =?utf-8?B?UFkwV0x3dkxQYnNUTWt2T2xHTnlpTU4zWTdOYlVndDJnTlRQTzBjV2tvSnFB?=
 =?utf-8?B?b3VXVnFNUlg0N0Jab0QvempGS200N0ZNb0ErUHg2WUFiUXIySGZ0MWdUQ0JO?=
 =?utf-8?B?Q25PYUg4dzVXdy90dDVORE5wanlRb29HWEVKd3pUYmN1eGRkYVZnSEcwR3Ar?=
 =?utf-8?B?VkdNZml5WXJQcHJIajhLdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXRJV2pNZ1pmRzRGbFhYTW9pVkVKUktMRHZHT1FuMUQ3MTdZSEZsbUlISnVz?=
 =?utf-8?B?T1ZmaDgyb1Fxck4veHlyekhaVGpOUE9GK050NnAvY3pKVkcrV2ZyNEVIa1F2?=
 =?utf-8?B?VHFDNitJNS90a2lza0l6a3FQZnhmeGo2cTBQczgxVTM4dkcwcTM4VW93N0Fr?=
 =?utf-8?B?VmczWTU0THFmSGRjeWdXU2FMSzhkcmpFbVpUZ2NEZFZSR1Z6b1loTWZYRG9h?=
 =?utf-8?B?UUZwVjFwS0JwcUhYNmE2ZktGS0FTdVpDM1JCNm00QmcwVHdxRzI2T3hXcTJh?=
 =?utf-8?B?SkJVK1lvR1UrU2kxbXlXNHRhRXhUSjhLeTVCZzRtbDEzQlR6cG9lMG8wWEN5?=
 =?utf-8?B?NEYxRTNYZE1sZ0MwUzNhTzFxdDNaalhSSW1sUFZWNE9ZSXJqUGlKa3JVR21W?=
 =?utf-8?B?SktyOWo5NHZObUxrMThxVG10d2I1YzA4bFczS1hNcCszS3JXZS9ETGJyTnl1?=
 =?utf-8?B?RFJjZzUrWmtPN2pGWlpnZHRTL21MNTVBZUQrdk1MdEp5V3gwNFFqWGtwcmpR?=
 =?utf-8?B?SXVhd0ZuQjFaRW1wRHpORy9hMlEyZVRVTUhaZUxnN0tWVXNoWmNCcHRWaHF3?=
 =?utf-8?B?YTF5a016Q2lGWjdmbHJ6TnNIYXVpYkNwOHZ1ODNDZGQzaFVHRWtsVDBtb0xS?=
 =?utf-8?B?Njk0ajhTZTJRSmxRZm9oL1l1M3JxZ2lWT3FXcDd5aTVHaDJQdnpsWExnV2lN?=
 =?utf-8?B?OUdXTDZwclBwQ2x2WHBUdDdRcUt1cXNaNHB1QWVKQVc0TCt5VzRMVm9iSm0r?=
 =?utf-8?B?MnZXS1NhWE5DNURCYTgrU2ZtNGt1UGtCVjcyaGNkdTVOdVpicGI5czNaWm9F?=
 =?utf-8?B?MVBzTTFSWW1manU0b2NZaVQybGdZMk5KUVljS1Ewa2cyT3hUeGFVdXFoOVlE?=
 =?utf-8?B?dTBEZ095Z1g1U2lHMEIwazE1SXlaa2I0ZkZ3aVRXZWpxN3Y2Qkh0L05zZmhj?=
 =?utf-8?B?UXRLMC9YRFNMR2FNZmFaa1NqYmFjQlpjUmZTNzcvQ0h6SVZwQnJsU21zZEZZ?=
 =?utf-8?B?VUo4Mm9JUWdVU1FvTnYvSHVMeWZRYS9pNEh0N0FkSnAwVGdoZVZiSzJobXVr?=
 =?utf-8?B?SXB1MVNyaGNnbklQOTZRNitzTWhOSmtIcXNDK3Y0akdDeVIweWU1VThwNXEz?=
 =?utf-8?B?RVYxcmFiWVphVWNtZGJUL2YwZnpRSllVcWk1THl0dWs0aWV3Q204d21iWWxh?=
 =?utf-8?B?Vm9IOXE4T3YrbkxDTktmTE9oYnFxdHJmZ0xveThuRVhGZFNyQmM4UVczbENG?=
 =?utf-8?B?VTlwVDkxNTNDYW5qVFlRc1Y3MkRUYTR2dWVwV1NXaThEeTB5emVWazJLRnJp?=
 =?utf-8?B?c2grZk5DQjR3OE1zemlFL1dNV09JbThrU3VqZFIrRkMzTllCM1ViWDAyU0ZH?=
 =?utf-8?B?R1RqZmdxUW5sK1o0WWZsWGVCNzBPb1NNc3dZcDdMMTN2UUtRb3BjQUcvaVM1?=
 =?utf-8?B?UWhqZG45Yk1Cc2ljamh4U2ZJOWFiVGJUdk1IazRTKzMwVkQ3cm5pNk1LR3ZT?=
 =?utf-8?B?QkU5TnQ3SERtbTlMcy9aV1FmMjgvMXlNRmw0RGZTakVFdnJPSG1EdDdjczF3?=
 =?utf-8?B?Si9DVHllYjVaeVpyYm1zWDh3T1hxamhBM1BiWHM4N2p5R3ZvZnRmTUlndWFz?=
 =?utf-8?B?dS9xSFVFRzVIQXRlMHl6Qk0yOEtmOUJJVXpxSzRRMUpjSmhuamtIRGxuZmk3?=
 =?utf-8?B?ZGM1Z1VmLzJ0ZDM1MGJFbFBIM0VHZHBMeCswSldLV05Ldy9Xb0loK0dsZWJ0?=
 =?utf-8?B?NXZDTGZWTTdVbld2UWVydEZ0Slg5Vjg3M0R5Vzl0WjgvMEhrcmNCWFJvVjJF?=
 =?utf-8?B?ZWxYUElWY1pkU3UyMmFPK2M1cjJQamVvU29rL0lBV2MvdnNwRE5mM2lxWXhJ?=
 =?utf-8?B?QzQ4N0Rmc3NPN1lqQWhmazZNNkxQd0ZMQTA1djU5TEg1R0xnZDdRUG5GcThP?=
 =?utf-8?B?Tmdpd3E3L1JEZzN6V1Z3K1c0RmZLTVA4Y2lpVS9GbU5VWGtIZThYa0ZXZm80?=
 =?utf-8?B?N2NpKzNXd2JxZk1YVFpRSG5VMjBMUmVsdWIrZDdLTjZLNS82bGFTZThwcXlT?=
 =?utf-8?B?NWhVa1VmNnYvSG1CZVVVZEN5UXB4UzBQdW9KcVVqeGJJZzB2a1VSQnRsWW5I?=
 =?utf-8?B?WHErY0cxblc1RklSQmxUN1NwekVEcmhNWGtQdmphSDNUenV2SGlUS1YranVR?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1250aea-eb25-40fa-8ed3-08dcd200f4cb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 01:27:53.0188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vtFW6S+Co8E+nQ9Sg4hdT5+UvjQBml97ByC86fzBF5RaDxbYcC7C34FurMN/xeEWeDYY9979D4VkG0QIswVCX4xnklZYDn2a0aCTEt0kPlU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5880
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

On 9/10/2024 12:33, Julia Filipchuk wrote:
>> +	if (prefix) {
>> +		strscpy(line_buff, prefix, DMESG_MAX_LINE_LEN - MIN_SPACE - 3);
>> +		line_pos = strlen(line_buff);
>> +
>> +		line_buff[line_pos++] = ':';
>> +		line_buff[line_pos++] = ' ';
>> +	}
> Since 2 characters are added to the end of prefix should the computation
> for n be "DMESG_MAX_LINE_LEN - MIN_SPACE - 2"? MIN_SPACE already
> accounts for space of trailing newline and null terminator.
Yeah, I think that is left over from when this was adding three extra 
characters rather than just two.

>
> Also, prefix is only added to the first line. Is that the intended behavior?
Yes. The first line tells you what the dump is. Then you just have a 
continuous dump with no interrupts other than the line breaks which can 
be fed directly into a decoder.

>
>
>> +		strscpy(line_buff + line_pos, ascii85_encode(val, buff),
>> +			DMESG_MAX_LINE_LEN - line_pos);
>> +		line_pos += strlen(line_buff + line_pos);
> Since space for ASCII85_BUFSZ bytes is guaranteed by checks against
> MIN_SPACE output of strscpy can be used to increment line_pos. Although
> I do like this safer style that would work even if the checks failed.
>
>> +#undef MIN_SPACE
> Suggest to also #undef DMESG_MAX_LINE_LEN here.
Yup.

John.

>
>
> Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
>

