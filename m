Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11884D4337B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 03:04:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD6510E25A;
	Fri,  8 Nov 2024 03:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J0BXH049";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A972C10E25A
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 03:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731035061; x=1762571061;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AAGYLJ/Z0Cl1ZjFW7z6uOeXef3/nnTSm/1o+lv36jhw=;
 b=J0BXH049Qv/+CA7KmgpIS6+cJ/eWYyqPCFopDx9/oIi3b1W8Dvd/iwAD
 cAhhHSyMhQQORd/4mM70WeoTwKGpkxq1XQmRXnSGxCxpy5+U46OYZCa7Q
 45+O0AKUv9/Ay4aVnNP2G5/IU8JsVq/yJggxYVyqAYvhdUfogetAm5zAs
 YIdiCsuDEhOkEeyydUccy/Sag0FGOhwNz5POjSmawGnBxTTd3yUq5hVN8
 sMJE3EBNv3umH0IpZpQ7Vp1gyKpxdDUUy38xvfCSrMTx81o1YGpWEb/yF
 6LI3X3Q4kpy+EfwGF77jquD1CzhnNVJhq1L6Iss9wtewGecpfoIfJ9xtC A==;
X-CSE-ConnectionGUID: YpVJUGu2RbOB/9fiMdWzMg==
X-CSE-MsgGUID: 6xnwnq5NT06d7/gHo6FJNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="30792470"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="30792470"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 19:04:20 -0800
X-CSE-ConnectionGUID: 5yhyC05TT/aMTQVE9duf+g==
X-CSE-MsgGUID: bCwNF4/aT9uKwnYD9v8hAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="84865638"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2024 19:04:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 7 Nov 2024 19:04:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 7 Nov 2024 19:04:19 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 7 Nov 2024 19:04:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Omvh8vK9UrycoYOcN8n158W7P12gtxKGxg+bBhADlp0QxAVFqXNpw+1s2ZNxYRozVP5C6F4mjajgb+dihBqpcFJDcsO92F9S0Ht0TNMSHE3bihUtlfOzKJj8f6qVtBVA9REVKUbKUqJ/rJdT6xqExTVnjxGBEbN6pzH8IfdZcX3tREAoy8kCvVeaylERTZ3jt+N20OhdpYzrL58w4M/UaZ0Xcaz7nyS2Pa8lkF88ZTXfS9usFZ1+eLjiMR4P4y7Cy76fq13YTZJyb6/F8xoGiOLstYCrx/umhBwJTRhyk6PxKupO5UMvwKhFPcB1Mfcof80G1+uyH9wpu6lssxL1PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6qxzunAhFLPSjR3iHPyhqU0h3DazwXvVZsTglk2d4c=;
 b=S/2EgWsdGL9XVxPruJmqUCK44nLx8Im3RfbD6vj2zEnfviXrghf7linivSG7ghfpgoDDi/Etm2LSJq8/syJJ8psFlvJQjc5VqWhOrVGaIYCHiiPbaotuGkdbSZQ+KN8NpTf5I1HpI+9SqaotNtBddKWC4kymlQEEJ9bGALWccpnSnnccNilGxWyUxSiFDS5JFuk6gtfzLLwXU9S2wIdrrDyLoOYvSZ2ZPnPw5zn9DBmWruGuJQ4YHeKhQ5ULDnqLgxtD9XiY/n0w6d3YoFFZsxs6pgmkvfxDJPagCMsdWrabfVuJ9yfOCnA9JkziGwCNS7tmftfEuT0kwQ2O4bd+kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6838.namprd11.prod.outlook.com (2603:10b6:303:213::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Fri, 8 Nov
 2024 03:04:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Fri, 8 Nov 2024
 03:04:13 +0000
Date: Thu, 7 Nov 2024 19:04:45 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Tomasz Lis <tomasz.lis@intel.com>, <intel-xe@lists.freedesktop.org>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Subject: Re: [PATCH v1 1/1] drm/xe/guc: Do not assert CTB state while sending
 MMIO
Message-ID: <Zy1/zaWCbhI5y8RJ@lstrano-desk.jf.intel.com>
References: <20241107151357.1623733-1-tomasz.lis@intel.com>
 <20241107151357.1623733-2-tomasz.lis@intel.com>
 <48da6fac-2693-4fad-871c-d990f2da0bc6@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48da6fac-2693-4fad-871c-d990f2da0bc6@intel.com>
X-ClientProxiedBy: MW4PR03CA0247.namprd03.prod.outlook.com
 (2603:10b6:303:b4::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: a8ebe151-ce9b-46cc-446c-08dcffa205eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGFhb1lEWXZIdFl5clBCSWR4Tk5Hc1NoOW5tSDlUVHVhaVhWeHZ1bzY4NW9S?=
 =?utf-8?B?ZmVISUs2RDluTklQeGt4TjJtMzMwemE5QUc3OHFPSTcwQVFzc3ZmUjN2NXI2?=
 =?utf-8?B?SkJQcXBRYS9wR2MyMmVLVUpmZDN2OFlwNFdnYk9jY2JxYUM3ZHZzOU9EL3NQ?=
 =?utf-8?B?WXJoYU5wR1FUVEJCK0VRZXNCd2R4OHhpb2pRMUxzSnJ0a0NDcEJ4T0plbDlt?=
 =?utf-8?B?c0dLV01MY2RwRmIxMFVDeHE1d1YrSitjTmd2OEQ1L0VSK1c4U2piOUZYM2xv?=
 =?utf-8?B?QjFiWVpFazRvZThlZlVQN1Ewd093SVZGRkpyeXM0cUJtVWh0MGpPSDJoVlFQ?=
 =?utf-8?B?T0NEV01mWVg5UGhBa0xtZHlqbmY1cGlDcUlMZ1d5cnl5dFI2Q2VLMXhZNHdU?=
 =?utf-8?B?VExUYVVjd1RuSHN5STQ1T1cwb3lHUlo0TUV4MkplV244WDNYc2tpZnE4ckdv?=
 =?utf-8?B?eDRkbnFmYkFmbjI4aDRTNmFSL1dUeUNsMWdPeTd0T056cUcwVkhaZHNOdE1Z?=
 =?utf-8?B?WVN3UEl6Mk5xS0dHNjIyR3RDemV4U0ovNXIzUWtnWTBiUU9sWGVvaktwK2E5?=
 =?utf-8?B?SllDT2NHeURVMDNBdjRrZDEvZDk4a1RoZTBhRUdUQ2F0SFZGeWF0NFNmN1V5?=
 =?utf-8?B?OW1VTWJIQWNzSjA2c1gybTMxYkpPY0JLR2h0RXl2TWtpZEV0VWRQMDByOUJT?=
 =?utf-8?B?TVpOdnU4eU95QmN0YVczM1lkRmlBYkJFazJSWjlFcXJsbnlWRU1leFVUUFpi?=
 =?utf-8?B?THlvY0Mzc2U3VlNiTnNtMEVMdXVzK2pCMmVEWWtYcFpZelpCMGxES3BoUVRH?=
 =?utf-8?B?K01vaHU2ellhN25MRzBEUWV2Q1lzR0JxUjhpc3k1UW5HMlIxbEhyMkZzZ2FQ?=
 =?utf-8?B?bDB3NTZGbU1qckRlYnl6N05DZnNoMU05blNTTnF1Uzk1eEMyZmR1MU05Unlz?=
 =?utf-8?B?T3UzbUN4VHpIaythRXhMK0FveHArSzJaSzgzbHIwRy9iSjI5WTNBVGcvc3dL?=
 =?utf-8?B?TFFRWFluT1M3MUtPSUFxRWt5c0lEdjMwNzFYK3hEVWFsUlhlUk8wSGwvbk5p?=
 =?utf-8?B?Q2ZhZllGdlhialNnR1pucjFCUTZIN0hGckNxTW0yZEFTRHNrL05XVzRicFF1?=
 =?utf-8?B?a2Q2WjhmTit1bFViQld0MThSVE96dlgzbllGUmkwL2kyTzh1OEVRMXFsSUpO?=
 =?utf-8?B?QXJZNFkvb1hyYklVam1aekluclNSMHNybi9wdnRsYytqU0hXQlNrdzNNbVEv?=
 =?utf-8?B?VHpYUGlWNWs5OWpneWdUdCs4WTVJRzhZd3h5cmoxcWt4RStTL0JxQkhwYnd2?=
 =?utf-8?B?NTlHMEdhdHFPY1dPazlmY1VENTFrek9lUlgyZWZIZ3hLbHduS0RSUXVQY0F5?=
 =?utf-8?B?NzZKWWhRdThnaDlzRjA2Ni9ORGlETkVFTzI3OFh4cGlvNHdPS1pldVV4M0lj?=
 =?utf-8?B?WEI0d05JY2FCQ1JxMzY2ZEIveldWYXd4bGthUlNtcXlNSFhnbXVEdkRHMDJK?=
 =?utf-8?B?NHdwdHp1MUV1VVMrSGVQcGRmQ0ZueVZ4UDYvR1JtUTk5a1RkYXJzUHhpdkds?=
 =?utf-8?B?R0Vjb1hqWFZOb3hqZ3Z0aHFlSjlDRDB0dC9TY1ZwQkpHdFVBeUZGNjNtck9s?=
 =?utf-8?B?ajNKanNsNzRLQ2F4a3FxS3hweDRsY2t2U3BkQ0RyanBVS2o4cmRYdkpWa1Nm?=
 =?utf-8?Q?N0uIFJRwsyvOzCKzI2UK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXFVb2lSdVBUU3JQMHpvTVljTEVrQ3FvTFpMOFBPTUx1aE5CdFFPZEpwaWdv?=
 =?utf-8?B?aG9hQWRoS0M1dkI1bUpNL1A4SG9IcTgwazlDMHRrcUFscXJYdzFaTzhFWGFv?=
 =?utf-8?B?bU1NUzB6SU56bGFTQUpySEZvaVMvdjNWOTR2b240RlRUZ3RZM3NHLzNSY2Vq?=
 =?utf-8?B?OUgxTHFNRGZVbWs3ME5zWFNIZVdHTFRHU2pMSzFianpoVGIwZEpCaEV1Si9C?=
 =?utf-8?B?a1lGZTJ1VVpZRXRkZXI4dTN2QlREREM2WU1RWUFtWnlkaHgwVXJvZUluK2pN?=
 =?utf-8?B?Vk8wMk1uU2VjTVBmQmFja1RjbWtXcnZLTHVXeFN4cGMrN3Q0OFZqNWRtenNa?=
 =?utf-8?B?aUlFN2lDQk0xUUJFNWp4QkpiTUdDMlVZSGQvVjY4MGRoWisyODIzRjUxRGNq?=
 =?utf-8?B?djNuZU9IVmJRa0psS1c0Qm5ZTDJiMWNIOWpYUS9rUHkvbG5DZGNyZkNQY05n?=
 =?utf-8?B?eWhWcE9lNlNTZnB6eXNIYkR1OXNUaTB0amliM0ZyMVo1U3Q3THhydDc3VDR3?=
 =?utf-8?B?Q3QxMGh1b0gyN2k4bktJNzlRRm1OMm42R3NrVFljMEpYaVg4U1RsTThDVDBB?=
 =?utf-8?B?NlJsYnRqYVRJTkhaYW5GcXhOZnYyS1J5S2JoUmxUTTdLeE9ZKzdqZGNTQlBv?=
 =?utf-8?B?c0IxcTVueVFjV3k5eTZoQUowcEFramtXc1EwSExPNS83R1ZnMXM5T296RndK?=
 =?utf-8?B?SkthMXNGNjNySkVBci9OYkMzREVMNkwwcm1mYUx1WmFMZDlpSTkyaGhKSnVN?=
 =?utf-8?B?VmJGOUZCa3RIRitvNU5zWjM2Q1V1MU1tc3ErMUZocEx6U0ZpaDBiS09zbEIw?=
 =?utf-8?B?M2k0V2ZHTS92OGczQzVmWUJFWHd0U09uejF1dENmTzc3MzNUaHJTR2JiUnVa?=
 =?utf-8?B?NDhJNFpsc1h5ZFRhcndUS216SFYyMFhGcFp1VnVTSkFzNnJHd01Xb0FRMGIz?=
 =?utf-8?B?VWRIaXZ1VVZYSVhsLzBsdU1pZGpub0ZEcUM0N1VYL05nZ1lnNkVqTmxRN0dt?=
 =?utf-8?B?SGhUYkkvOVp4eFpOZ2xpaUxEbFU3T290MEh5OFpLUE9VVmlwQ2RsTUVVU2No?=
 =?utf-8?B?K2w3SkxTdDQ3dVYybWgyVW9scjFjNGRXUU5nMEswQ0hWZHNkZmU2dTRORkl2?=
 =?utf-8?B?dHo1eDNCUFVZTmNIK0x1dk9keXBCSDNRSUdnSm8xOCtzVnczNjYxZ2NCNW1F?=
 =?utf-8?B?QlRQNjVrWWxPS2t3aHZDSmhNaTJKVHNUaThRWWEzSkZlYkU5WG9BR09jUWxh?=
 =?utf-8?B?eUdSTUEyQ2N1ZyttVkI3UWV5dDhjd3lPbGViQ1NpNXJXNnluNGhQYkJYK1dp?=
 =?utf-8?B?UDhMYUUrUVVBNXNyTHZ3UjljODNxbnFDdEdrazVMQ1VuTGRQdElUdi9xeVlu?=
 =?utf-8?B?TTRnUFhxQzQwcnRBaHBSOEVoWFR0WlVvUktzclZsRTZwbm4zbUMvVytuSzlM?=
 =?utf-8?B?WmJ1UUZyZnVhVnJZMldaMG9XUm55WkpxWVdOMUNjajdGYmJIVnlaemN6d1ZS?=
 =?utf-8?B?OE5IU2xqb2xpT0tKeDA0cG5DMFNTd0xES0REczZaOTFBRGNNZlM0WW5xZ3dJ?=
 =?utf-8?B?VVFZSGhNeEoxVnV6TDNNZU1KTENGa0l4T0dxS1h4SzhuLzZFQ0gxTnZQUFFQ?=
 =?utf-8?B?RXhvUEdGZGdTMEQ5Mkd4OGFlMTE5Q1VScEZtRzgyVktBSGpnTHpuZFdqMk9j?=
 =?utf-8?B?UnFXUnlSeXhudFlsRDRUR1NsZ1p1OSt6Z3ZuRFNZQTdKdGJtcVZvWWdDSzB0?=
 =?utf-8?B?T2xJc3hGU1UrSU94bWMxVEIxOU14NVJDVVFTYUM1MU4zY01VRzNucC82aW4x?=
 =?utf-8?B?TkxoaEVwM2dVVXJ4VkFISDBBRTRoMy9jcW1Xa01EMU5mT1dRVFg4Zzc2OTA3?=
 =?utf-8?B?Y3ZwVllBRGpzMDlEMkxmdFJVYVFwNHVyclNwdW9hTXZVYysvWmcvS0NkaFVv?=
 =?utf-8?B?OVBOVitvamVnRys4d05XdWF5VjU4R3RBWHl4UXpFTTRyMDgyRHNYd3VySnAr?=
 =?utf-8?B?aFNZSUFKZzE3RUl3eHlUdFhqYm9vQ1crYjFHV0gwZThQNldSaVlvbWVQbGpu?=
 =?utf-8?B?blFsekFabjAreXZPbEJ1M2JCbitvaU1TdC9uWUZXQS9oNXdha3JuaTdKVFUw?=
 =?utf-8?B?ZG0xSktXOE5qclZ1L3AvcWlHb1hydS9YMVV3ck5vamxqY085a2piTWN0bTdJ?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ebe151-ce9b-46cc-446c-08dcffa205eb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 03:04:13.1060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rXeiNClUoxIJRSrfykjzAZY/LWrJSBBgmYpNulZjhx60S8soICh5+q2ZpTDQwMZ4rQUIJDk7vjWKBEWCkk+8gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6838
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

On Thu, Nov 07, 2024 at 05:56:09PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 07.11.2024 16:13, Tomasz Lis wrote:
> > During VF post-migration recovery, MMIO communication channel to GuC
> > is used, despite CTB channel being enabled. This behavior is rooted
> > in the save-restore architecture specification.
> > 
> > Therefore, a VF driver cannot assert that CTB is disabled while sending
> > MMIO messages to GuC. Such assertion needs to be PF only, or be removed.
> 
> + Matt
> 

IIRC there was a big arch push to avoid using MMIO communication
entirely but that was several years ago and lost track of GuC interface
specifics since then.

> > 
> > This patch simply removes the assertion.
> > 
> > Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> > Suggested-by: Michał Wajdeczko <michal.wajdeczko@intel.com>
> 
> in fact I was already trying to fix that [1], but I had to wait until we
> have some S/R code in place, so I'm fine with it as-is
> 
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 

I'll defer to Michal here as I'm sure you are more well versed expected
GuC interaction at this point that me.

Matt

> [1] https://patchwork.freedesktop.org/series/128721/#rev1
> 
> > ---
> >  drivers/gpu/drm/xe/xe_guc.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index 7224593c9ce9..df1ba94cf4ca 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -945,7 +945,6 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> >  
> >  	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
> >  
> > -	xe_assert(xe, !xe_guc_ct_enabled(&guc->ct));
> >  	xe_assert(xe, len);
> >  	xe_assert(xe, len <= VF_SW_FLAG_COUNT);
> >  	xe_assert(xe, len <= MED_VF_SW_FLAG_COUNT);
> 
