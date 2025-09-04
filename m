Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C526ACA1013
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 21:03:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B98110EAE3;
	Thu,  4 Sep 2025 21:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WUVWywu7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3335710EAE3
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 21:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757019786; x=1788555786;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=raEzUoeiER+LB9UoB+W8q7I1J0ImjIArQg+ZHCKB+Fs=;
 b=WUVWywu7IogPr6rsT0iujwoaOfTpUoXwp7u+lDzsQ0XdlqGEbCEsmuso
 QmjFlE3oFDe72faV3Cd/Zvsjs3BM1Ilr9L4AhsusXFy8V2zLU3YMCQ32b
 pe/Clp2Zlec123kwQBjLWa+oMyDYIiiONnqojZUQLLS8STsGuuVfRb9Ad
 zkqW+FQlZlIdn06yeVnzTQiNV00EG7t6+TyH481SACvuArcaBcTsFrbtW
 KAhK04yjPdzW1pXJGynAyEIkHaXYME7MRe9/yqRQLvrt/c/8y/JdHON9W
 hcl8fdgTEdCdJMdxcdvw4cSkMWFQZLRTO0vDeWQh/o2VKcB+yVtmeEmxB g==;
X-CSE-ConnectionGUID: 5BnQXvKhRKKGZ3c+6+J//A==
X-CSE-MsgGUID: lKtOfcGNQwSmyJ6LtEZTdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="69988281"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="69988281"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 14:02:52 -0700
X-CSE-ConnectionGUID: PYxBjgqLR7Op4DDreGKApA==
X-CSE-MsgGUID: vZhQvqSYQBiSG1gOD/9D2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="177251473"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 14:02:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 14:02:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 14:02:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.61)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 14:02:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlZEZPX/lZcGX9eD8jWegO0J8l4MpT5fdh1eAz0JFWd5XcbAo5YOts4L7oONGx3bTj2tLhGIcR8lvJxQGpyjdf2Bx1he1OSj/FxEDYZDYnrx85SfDeDghoQbjCUgxpVtY+MtZqsInx3LrWaY8bwMtbYLqLH4t3wSAl0n8mEngV0oP/gw4jWviRcE4+gfHgqfhrRwsQIjR4isKGGYk/In7MqrzlFeqc/3Ay9G0OHkGD0xbUZhnVmyAXhOJDtiDWWIh3BR26qQC7uok7mr0e3A75jEekjHr11ZulHkGLRx0dhnbV0hlOjkzZ6nHWG3QfPERyLdTmVYnchOKDyM8QBwZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUU5znepQzUt6XiZd9JcZFxxpZfzQnB7gO/CdHElOfc=;
 b=vz6c7AVlRplIbb2sbVDv6nLtWkXHSlqK1DTU/ALp4Q8oj9oxSY/wZIF2exMO4tIPeND6KJ4YHizGZ0rrAv/mZS9Dd9Oh5790ABDTRh8mf9qeGPZ0DVeR41FR8/bOKfoDZlqapb1dmILTCCH3Hu1d/bXm4M3ykY12RkQ6TP+jdgbiey9vhYEbgsBrA8jjIRjqgMQTB3KwBlpNHMtLoVbq1kLbvFbEnWzdsUmL5dHyUFAQLcKVzMsqWN4N4xonEozKiUc/rf2CGvCffjHk3uA2AqAG087Ir0Sj5l+PahYfUspTdzGiiVcRHbcJnqixDbgjMMmXvB65/TYFC1RV7urnLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by SA3PR11MB8120.namprd11.prod.outlook.com
 (2603:10b6:806:2f3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 21:02:48 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::d66a:6830:d9af:740a]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::d66a:6830:d9af:740a%6]) with mapi id 15.20.9052.027; Thu, 4 Sep 2025
 21:02:48 +0000
Date: Thu, 4 Sep 2025 14:02:43 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: <John.C.Harrison@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/guc: Fix badly worded error message
Message-ID: <aLn-c_NgYoL9waYY@msatwood-mobl>
References: <20250904195752.3846138-1-John.C.Harrison@Intel.com>
 <20250904195752.3846138-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250904195752.3846138-3-John.C.Harrison@Intel.com>
X-ClientProxiedBy: MW4PR04CA0374.namprd04.prod.outlook.com
 (2603:10b6:303:81::19) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|SA3PR11MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: ff8f9740-4eb2-46dc-3a99-08ddebf66711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWRGUnRxNndmVTg3YTB6ZlZ6RThvbGE2UnlLeWV5elIyWkxGSEFjeENSN0R4?=
 =?utf-8?B?T3l4STNZK2hwdUdCNFVaSzdkTXdaL3pRS1I5b0d6ZjFuUHpFd3NQTkY3V2FW?=
 =?utf-8?B?eDZMdkUwaEpMZFRJRkZ1VENKcnVHRE53RFRLUVVPK29Kc3U2NFVkYkVnZmZm?=
 =?utf-8?B?bUpyMVNsdjV3NkczSVhnWXZDVi9admNKQVhrbXdpTWVNMnpMclNUNWtGZHlv?=
 =?utf-8?B?aEpoL3c5TUo1cUV3MGM2R3VQMnk1cDUySDhFRTdhYWdLc3lWeGNsWFlJblBR?=
 =?utf-8?B?MDJiRkpWMUE5THlDNUErVHdaY1d4c1J6aVNhb1RkVGp0WVFBMngxTnp5NFlN?=
 =?utf-8?B?eTJyRUs1RzhkZ2JLaHhOR0UrOUhqTUhzcXNBdzRQVTZrSURQcDVib3dxdm50?=
 =?utf-8?B?eHoxc0d2eXFoODM2OXRaMnNmajJBc3RMQXArQldpbUUvTEhuTFBhaEtDSEtP?=
 =?utf-8?B?V05yOS9BaUhPK1JVb1lUc09Mb1JNY2NydWM0WUVlN2RaTUNpbzRlQW1mcFI4?=
 =?utf-8?B?NjhCZGFIbTJXOUJBK0JDQ0hFUVFOak5CT3NZcG5NOGFtWjBLWGJCZElvWEh6?=
 =?utf-8?B?YVprMTJ6Ym43Z1NBbWhGTytrc3gvTk4wYzYydEQ1alhWNm5OdVRnRmdRaXNV?=
 =?utf-8?B?dEgrOHg1UDJjQVNRQTMvZG9laEV3ckJnZTNWRklJRkxHTUZFSVB2YXplckhH?=
 =?utf-8?B?Y3ZFeGZucnB1NDZTMzc0cU5TMVo2NERZYUpwTVBVRmc5ZGVDWGdyN1Z2bGlL?=
 =?utf-8?B?ZnE3aUhzclliVlUzYVBnY3NRNDFCdnhIWXlvNnZBV3R2ZUNCM25tSW9ibUVB?=
 =?utf-8?B?MUZSdmQ5YkFBZ0pDM0U3ZFRTNzBZbFJXWU5JWlFLTThIc3oxRHBiUmYvdU04?=
 =?utf-8?B?NFlSY1djbHpTS2FZU3M0azBLbWc1SFIrSVAxMjdJckkzeitsR2FaNGJJU2pC?=
 =?utf-8?B?aFBVWEhtRkpkRndIaTAvMWVrUG9WUW9TWTlhWkdTRXhISGd6T29DUk1YVUM5?=
 =?utf-8?B?cW8rOFdMZVVhdXNvWVJhSEM2OGdJMEVvOTRGV1BnUTV6OUIwaWpSWHVQWUZM?=
 =?utf-8?B?aUVMV1FmazZLY1FuK0hGRnpzNTMxTlI5aVRFK1IrcHZrVGg1UCtUUVROZjBO?=
 =?utf-8?B?YXRURmdrWWFrTFJQbDgwdXVpdzBIeUpMSlgxUGpZcW83NlNQUG9TanR0VDdj?=
 =?utf-8?B?WUsrK1hyS1FOWkJMWHNNVVBzWmcrSGZOcmVGTU5HSlY2cEZxM3BlQ2g5R2dq?=
 =?utf-8?B?dnNiZCtKTFZCbTBGZ05aOXljV1RCNDJLZFhnTVVUaUIySXNmdEZ2eU14WGNS?=
 =?utf-8?B?MEFSbU9xYTlCem5ZQStaaWlHbHpmSEZlM0FjZkE5V3Mra2l5S0I2QzZsWWpE?=
 =?utf-8?B?NjNScWhhZHROL1FEdHZucWJHRHAySmZKZlNOMkhnbHFmZlBCZmRYK0ZSbkVq?=
 =?utf-8?B?aVlZbHMvQ2FIc3BuYVVRaTFVcEZtOVRHS09NdS9EWnk3U25Pai9JREJTcmhG?=
 =?utf-8?B?VkhPZXNZRTE4a2RRK3g0UlN2Nmg4U3BQOEJ0SHZRZlJvOVBYWVZZMW04bzFy?=
 =?utf-8?B?aFU2d0JVRmw2TGwrTWwxcHg5akR1bDM4bkphc3VSK0ZFcHdxU0wwc084TWl1?=
 =?utf-8?B?RnZmMUliQzhxbHZiUHM5elgyeGV6SGZkMUhDLytCVVBxTG8wZ25VdmhGNG5i?=
 =?utf-8?B?RlFJSEYyVmxYYTVhdG0vcEJ5SzVnWUFQSmxMTmRJK2VudmIycEtSMmtQeS9t?=
 =?utf-8?B?WlpIVWNsVE9wdStyVHllaEVQVzJHRThNTEI4ZlY3aG9WSUJRUCtmdktTWEVF?=
 =?utf-8?B?WHNDWkpOUmtIcnI0eVFGYWhyT0NmOEQ5OTRSTWZ6NzdjVHBkdzh0K2N0UUlY?=
 =?utf-8?B?VkpsS3E5VFdjc21pdVVuV3ZMVmF2R3dsZ1NhS3hsTHBhODVZOXY0cldPbVBy?=
 =?utf-8?Q?m4k3ZoQhRBE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Skh5REZiNkN6WDhTb1M3enNaaGtNZmd1YzZKQXVPZnJTVTNQdnVYM2IyUEJD?=
 =?utf-8?B?Tkh4c1hUTXhkbW1tWVNHbDNpUi9qOGVlSlV6VjZWME5XZFBsM1BTa2ZoMGZH?=
 =?utf-8?B?dzFpUWhwN1RtUk5rOHZPNVVsZmlJQmFzTkZzQVFiR1pqZUV3anZJMml5bEMz?=
 =?utf-8?B?aGRFNTNxSkxNNThzQ05vQXc0dmxlS0FwS292RE5GTXlmNGxnTFVIRXZhbHFx?=
 =?utf-8?B?NlZoTy9LbFZSak8yZThYNTBVK2kwS1pFWnJ0Ym1uVXI3YWY1V3RETUJ0WGtt?=
 =?utf-8?B?VE1ZdXVIRHdTT2pqYzRleXVpMWVYT1BQYzFMSEhORUh4S0NUcjRJenN6QlRn?=
 =?utf-8?B?UVhMWUMxQ2IyZkJvRWRkNFZIZnM1SGZKdkpiejlDU1JHS1R0aEcvaTlkTGdM?=
 =?utf-8?B?R0RjRzY5QmVKTlVoY1NSbitMSWdaVE9CN2ZsTDAvaUpId1dQQ2FwQmt2VUVV?=
 =?utf-8?B?SmxlZVFOUFFqYUphLzRPdXE1Q0pWV1pGcGhrVWhDNDJhNTJEMnVPcHZzTmF0?=
 =?utf-8?B?am8rSDJISzVKNjVYaHhnUWhKTmdwRTJzRnFwMzg1aVk1YWNmbnBDYllydEY1?=
 =?utf-8?B?VmUzNGtaRXAxbHYvRWcvVjJXTE5ZRmNkaVp0bFUycjcwOVBubUNpRCt0b2ZK?=
 =?utf-8?B?WU4zeU9WTHZMc012aDZFZ09BS3VINjVKVGs2M216NS8vQUVkOVN4RVg2WnZY?=
 =?utf-8?B?VGpLcVllaE9Wamx2SG9nQVREV1JEM2ZiR3JSdjNZcUF5b1haWEJ1c1dzZFlY?=
 =?utf-8?B?RmNHRi9TbTJ2Y2JwZ2lJVHNub1UxSjdkVjlZTGNvTW9wNk1tMENWemZoRmxv?=
 =?utf-8?B?d2V2bnpqeTZ5WHdHRm5Gb3E0N3o2YXA5RWFkM2ZBRjY5VDZVWVRpUzhyMUsx?=
 =?utf-8?B?YklzN3k5T2FUc3R4L3Yrd0ZtZFladElBYUdFVW5JeXV3TXpWc1A1N1lqYmcz?=
 =?utf-8?B?RWhJYzRWWVZzbzBnQnYyQmdiemlENHErQUp0cThqN2lQdWpPZVd1ODJmeFRH?=
 =?utf-8?B?U0dmZGIxczJIN3kxYk1uc3RGZDM4RTVnYkM4M2NkV2RLbWo0UEZjNGoxWEtG?=
 =?utf-8?B?akNaS3o2NEFOQVExc3IwQllNRGI4aGdXNUw4bGRDQXBuTlU2VWxrQU95eWxz?=
 =?utf-8?B?bHVwTm5GS2hRbkFxSHhFeUk0b2tBV1ZHQVZUeDRDbjAvWjgvazJ0dXRNWUI1?=
 =?utf-8?B?NWUxb0VsMk5hblpnaFNHRWJpSE40RjNpSkQ2RVBYYWZJUk5PdkJaMUJrUHE0?=
 =?utf-8?B?Q2JTRDhPQXhyWmlmdUlTclRQL0VnUEYwMWtwT1V6RWZ2MXhpd3NIMmd1S3lk?=
 =?utf-8?B?OVY4SFlwV3pWNXpqVzFuZUxIWEdFbTJnOFRTR1E3RlBML3JjQnZNT0xZYVMw?=
 =?utf-8?B?RUhSMzBGTFFNaklFNm13cFdneExHRzc4a3QySUdWT1VQWHpwOXRtZExVWGJq?=
 =?utf-8?B?MVI0b3JQSnd5ajNCaDBuMURycjY1c0JXL0hDUS9KWW1IYXgyaS9HaWRleUx2?=
 =?utf-8?B?b2txK2I0dXAzOHZLYlI0d1ZxWGh4a25PalFtQlZuRk5hSDFwakRTTDVFdGJl?=
 =?utf-8?B?NUtIYUEzRy9HRjlldXphNlVObHpuM1IxU0NsREpwN0JQWUNUMjJoemdnWGM1?=
 =?utf-8?B?bkllQUIwd211Nng4dFBsTVpNemRwQ2tDNm1rQVlCZXJhWS84ajFUNnJJbkZn?=
 =?utf-8?B?a0RGK2pMbUlza1RpR2VMUUtQZy9Ndm5ROFY4TTNBVkJKWmNuVkN1WVg1WDA5?=
 =?utf-8?B?bXUvdkxsZjZIRUI3ZnNqNnJjeElXMW5YYTV5V2xJYXN6TU03a3h0ZXlFbC9w?=
 =?utf-8?B?TkN5SGp5WVhsYkJGOHd0UUxRaEl3bmMwTmxxMktvWE5xOWd4R1pZdVBKRHov?=
 =?utf-8?B?TnVqNW1uTWwrdUVPTDE3RXI2VE5qRTdtS3E3d3N5cXpnSkZ0bHhPYVlMK3Bq?=
 =?utf-8?B?VENLcllMcVNGb3E5YjUxRXFiZXBKQk52TVhOVnQxbmZpcTZJUDl0UFpPSkox?=
 =?utf-8?B?TktPSmhpWWF3SUFmSmlVK2YvQ3lzczZsZmRDOFZRU3BOTDcwVlZlQmVvK1pn?=
 =?utf-8?B?R0tUMzdyRW5lV2RkY3VINjhtQm9VU0VPcEhaQjYyYy9VTGhqZWJRMjVpUzdq?=
 =?utf-8?B?LzA5SWo1cXJCeFk2QUhXemRiQXk2ZmtxdVFuUk5Cb2E5MVo4QlpRTFBWZDhj?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8f9740-4eb2-46dc-3a99-08ddebf66711
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 21:02:48.1970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aY6xo1Uk7usBK0Sq5uGSsbc/furt5vSZJ0Q3l5UGEOoUyuZtHPDsNLhFT0ER8nIFQ1tXs8nOs950enl7npuhT0ALadnyI+KiUF5fIllM8Xs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8120
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

On Thu, Sep 04, 2025 at 12:57:51PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> If a GuC id lookup failed, the error message was 'Not engine present',
> which is bad in multiple ways - incorrect English and 'engines' are
> now called 'exec queues' in this context. So fix it.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 89b73f4df5d1..dc23ce9804cd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2029,7 +2029,7 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
>  
>  	q = xa_load(&guc->submission_state.exec_queue_lookup, guc_id);
>  	if (unlikely(!q)) {
> -		xe_gt_err(gt, "Not engine present for guc_id %u\n", guc_id);
> +		xe_gt_err(gt, "No exec queue found for guc_id %u\n", guc_id);
>  		return NULL;
>  	}
>  
> -- 
> 2.49.0
> 
