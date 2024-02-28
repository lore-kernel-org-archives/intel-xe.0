Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6A8C5478C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 22:48:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DE610E215;
	Wed, 28 Feb 2024 22:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kzLz0sPo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFAE10E372
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Feb 2024 22:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709160528; x=1740696528;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kl0KSmEL67412ANpbnk4HqQB32KiEjrdkG/yeQQVxMM=;
 b=kzLz0sPovMbZDhLuCBSV5U1IKkes9KwiyPYxJkKzQtH+rCD2kUmyzt6F
 /G+1HduS+nfFKXEQQoxtJvWhz2eG8MqvMmX58R6WA+ADDrSxEoC4hwAm3
 55qUkqVuwW/6dqDVifZDV0V4XicgCgdjwD5oJzUgeFiZPJh83d8a/nMw1
 9V2t1R/AyondVw6cvJOh0uTzeJCRMPYc76427YG7nXIbWJDWhZgNIRp8M
 Z3ChIFRqxfSmvqNMZ4lJHvnFwcHHeyxsagJaKgVSfMKwRAdGCZIDidRod
 UiN2pjPK0iTSc82vhWpJPvopOta4qR7OcnCXh51rrKxHN6kucOKp1yTSP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="6539041"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="6539041"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 14:48:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; d="scan'208";a="38445742"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2024 14:48:48 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 14:48:46 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 28 Feb 2024 14:48:46 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 28 Feb 2024 14:48:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XnGfxHOW6pbRCGqrGrjzcd45utho4LqBKfmQYjxlrfE9bMbkG/NatZSsLCa/mcF2XB3QwnK24D8E9rpuQokm6vkqdkdcG76Cn/yBQQ3OtOn9OE/wjFjxs/ceMLW3KXqXkPJeA5bLvHH6qHodpiV1Zd9Vxaw3O68XAIyIY07ypW2PyunaA/56V7pgGGrTCvC4QEde/UQkG6eoPSeTyoN5F+JC3+QWCqDknbKlMzNSP3k7KQWap78K+Uq8y1o7Z+Y5i6VEJPclUGsAWZXR6xLvDGmC/4b5lTquJDgPiSajgNSPH/ihwkBh10yXaFEXPcekmTxHrlvomrTOAtvhPzpSlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0FBpZfbW7gXRquQz1tEbeCdoe4nkK09jCIifJGpsPc=;
 b=FGoOdu0RjYfb6zMYeQMUDG7RPBHNF+891PkXrKKijzFGHdL9pz+EW4SatXCii1XLSvjBXhxoKy2DksltITOVJAYL1OjbWfThCLhElwQit0hdEe8SBvp9aQxSzEgXbcFAQnsrUb/rNzna2tuV7NSOC5cO9pL7EFAMKm720D/6CiKicoIiCNTHjZNgMk0ZLDCXeRAyWhWYsbVbzTRQ8BzjHZbBCqTlYmCOfEoRyYiKEqHMuGU7PanMpmH/YHNPaAEmhwLGe3Dqwk326t+B4TdenKubV/yiVRnIeidgoxctpk0O9wrCqZKDaAjCrmMZS5j3O2YXfas4HW25AGYnPzXCEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7726.namprd11.prod.outlook.com (2603:10b6:208:3f4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.24; Wed, 28 Feb
 2024 22:48:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01%7]) with mapi id 15.20.7339.024; Wed, 28 Feb 2024
 22:48:44 +0000
Date: Wed, 28 Feb 2024 16:48:42 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/guc: Fix missing topology init
Message-ID: <fske6aqc35ox7slgmb6o2lierwhj7t37avgelllwdroit3vwzu@bibvvquz34fw>
References: <20240227164922.281346-1-zhanjun.dong@intel.com>
 <20240227164922.281346-2-zhanjun.dong@intel.com>
 <20240227203804.GR718896@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240227203804.GR718896@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0233.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: e10688ab-9526-4150-4750-08dc38af6a94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e71uE48FNQzGS0iOaJztV/GLqblP3ZtueP3mym7J0hAyH1Kg5EKi7wBeyVx7+c+w/dVqPVsDDFkbqjzZspOk2dGQfw33E1ns9VArJEYRjMBLBfzysqPB23HabrjAOmrzbNAbKK+ltQC2/yV2VCtJ05YyMc8Dcp1Yi24FASQ42aoMQ0ap27vians3t8v5Uo68bPsvFbziWusbplWOmsCULWLnU3PGlA/IIyxOhr0mZ4IZOFbJGKODfW1rPZT9NmuXhDOdpEkFuNp7+O4wFMj7+yN5MhRGfy3QYlsWj8N4qUwdjemw/Y1tdvcagshp84EskwfEdzfeu39bL1BIcBPoHlD0Gk6g0isK36TRXtjJBfoAyoQ2bB4coWOQSUFaj532xDJpbFMi1O8pixm+yHtDdsyBQGOUxoqD2dlVPvWSDdk9fRZbZAy0LvibBnEFDO6wvdWe7UABiykuZ7wE80KoWNmehe2gsrGGJ8MP2SBRy7bbL0erl/wuMhaelUPypCO7E7nO/3lGunKGkzStWy78qopvYHN6fwr89ITkLhmyYkMrWc6Q4JyfqxRZZ8bErsev2+DHlvqLiBDIUlJNOscGLUaB0aGgoFmg0KGP5WwUdQ5ntMUbkXvh50xZ8Z6ZBNyR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGY0YXpVeUkwM0Z6azFtU1RkVzdwTHFCMnFKSXZjOEt4TytKTFhjV2Z4ZjZR?=
 =?utf-8?B?ZlNETzBNYkZhZ2c2Qk9VWFRJanNDQ1JiVk5DbTllRkx4QW1zWGpWdkw5Q0Vp?=
 =?utf-8?B?dzR5bmJRaXdsVkhvN1VvblhvT0JCZkYxOHY0cFVJNVhteUVrbEh6ZTJTT2RC?=
 =?utf-8?B?YjRzQ2RjV25SRnhUcnUvRXZ3NURRWTBSam9IMVNuTHRIak9KL3gvSS96L2FE?=
 =?utf-8?B?TFVlMzUyNjlsWGtWVVovZ0JXQVVaWHlNZlNxZjJibGVrWnNMZzhqUUMramIv?=
 =?utf-8?B?d2R4ZHdpLzJXUHhzL3hKWW9lc3l1WUs1RE5yK2VEL0lJaUFPTXhvRyt5MnZW?=
 =?utf-8?B?c3FJWU94Y0dKNUF5TVV3YXlXTS9xejZTcWJ2WGE3OENzS1AwZlZWNFVUVzlv?=
 =?utf-8?B?RG9kT3BEdDdISFIwVlRkYmhEVzI2b2pxTGcwMTQwK05lZENpeUtrMC95eXNq?=
 =?utf-8?B?RC9OTUV5Y0E5V2dHYWdUekZhQWNzZ0hhYXRVeU1jbmtlTDc1QkpyYy9TYWNB?=
 =?utf-8?B?ZUNLOFRXUk9HWFYxNGZLV3ZNc0p3RlR2ait2Y1NmazJTTllVZmNnTWpuNHhh?=
 =?utf-8?B?WVF5cFFjRzJQUmNhZEpjelhSQ281SW01RjlTbmQ4R2J3bE02OER4T2tPeEdG?=
 =?utf-8?B?YXhtc2hjNGlPdmdsZXhnNVVmNDVMcGI2K25wdFpIY2NnelFTRmYwandCMGhU?=
 =?utf-8?B?Q0xZa3NSakRLaGpLZzdjbnhuaXNBZW1oelEvMzRuMGZ1OG5sd0lBdnJRTkdR?=
 =?utf-8?B?MFRRTmRQU3k4bWpQMHpzVkNWQUZFZm0rZm52NjJGMmVTY3BydXNEdll1RTZV?=
 =?utf-8?B?YjB2c0lJbzdFMUhmRlpuMEl5Vm9oWkU5bmpTOWRLRmRwU2FUc0NjMmhzczdZ?=
 =?utf-8?B?U0RadEFKQksvdjJ1ajhDckJTZVNtd3NrUUViSG5FMkhqbysrekEwdzRaWDMw?=
 =?utf-8?B?QlNrUEhjUWpEbkYwcDJWeUhoMURvUS9GcEpSYkFYVmtBV0crTTQ3VjJhaEsr?=
 =?utf-8?B?alhZWmN3VWpPVUxLenVIMDVIK0VPQ2RGbkpNSk5pS2d5V3lXZXhkWHN4NXBF?=
 =?utf-8?B?ajdRNzFrUGZSKzFTNVcycEhYaFRjQVZNK0tQTFdTSVFKOWNBdlZGNy9VUnU0?=
 =?utf-8?B?ak14Rm9EVCtGT282M25QZkZrVWg0TFY3a3JmMEwzSmtWeVBJOVhNVlhwUnla?=
 =?utf-8?B?dFBTQTlmOWxGM2l3WHJBQXlzQWEzWGMxNVRZUVArbVB4Qk9TbWh4U3hDcUp4?=
 =?utf-8?B?TEdSSjlLeXZVdENZQngwZmNtVWFVRjhzT0FSUVM4R2xQeE5KU0tDSTVVUU5a?=
 =?utf-8?B?Q3plQy85S29iTXF0c3ZLWm01K2NwWWtoZldkb2J2eFpBdGhuNU80bDZ6ZkhX?=
 =?utf-8?B?bXlxYURobUxXbm5WWmZOOTdYTlJiUS9ib2xweXBwUElJa09JZUlMSWhEOU5m?=
 =?utf-8?B?NnRha1FlQXJRYmZPWlJqano3MU5YcWxKZWpOU1VyU2xxcnQra2NMckhBYkxo?=
 =?utf-8?B?SnNSVlY0cGZOVHBETWlPOGxYOHh2U3VQblpkaS9FMHYzTGQwY2l3Qk5rQ055?=
 =?utf-8?B?emp1QytuU3JDZjFwNnpXMnhjMGJNdzd0Z01HUEZ2Kzc2aGk0ak5NcDR2NWJK?=
 =?utf-8?B?SDhmYjNGNVNabUVGSnBranhGL0lpdnlrNzAvdTdFSXdTMDA5cUJORE1Gb3ZY?=
 =?utf-8?B?dzVVL0dka1VzTGc3cEErTWhVbmN5MnBabUZOUFVlRDZ3MTRZenlTNkpDTXpo?=
 =?utf-8?B?bWdBMVVwWS9uMnBTOTJzTEgwRDVJeXVuZEFWbnAydnpDRHVVTzN5UUlib1Zx?=
 =?utf-8?B?UjBTTGJ1QjJ1cm5BWWJDcTRvbStEK3NXWmJnZkFESTYvK1Vqcnd0NE00Ritq?=
 =?utf-8?B?YVpjV21RTndEb2dzNU90TFYwa01NV3dqV0dybGNCMWFXU2NIdzBVUDFXYXE5?=
 =?utf-8?B?amhVczE5ZEdSMTNJbXE4UkZBVDQyODdMdGo3RGdWYnAzZ2pNbEkweTJBVmZu?=
 =?utf-8?B?aHJvQThPVjY3M0E3VFhxenZmcmF3enA4SkZKYjBDcHNnMUpqeXN0b29qOGFX?=
 =?utf-8?B?RDhpR3BLeHoyYXRzMUVxaW94RzNHOXFKTWN0OHNvb0FBMWNod0JDMis0cEln?=
 =?utf-8?B?SXJxaFBjcXFmMGo0RFV6WTVMSWpOVk5OUEpOQnlvcU9TOVF5aHFGSTRHMU5Y?=
 =?utf-8?B?RlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e10688ab-9526-4150-4750-08dc38af6a94
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 22:48:43.9688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Et7Nm7boCc/sk0tO/xR3e7hTQjYGf+JKZ2PKvIFytdt8LwCtSUbkNdknGtb6S0BePoPhiHw0D1x6cvxm0zZPVEcqLdFp/2qGxW60OAW3eqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7726
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

On Tue, Feb 27, 2024 at 12:38:04PM -0800, Matt Roper wrote:
>On Tue, Feb 27, 2024 at 08:49:22AM -0800, Zhanjun Dong wrote:
>> init_steering_dss need topology dss mask to be init ahead.
>> Fixed by moving xe_gt_topology_init ahead of xe_gt_mcr_init
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>
>We used to initialize topology before MCR; that must have been
>accidentally lost during the recent refactor.  So that means we probably
>want:
>
>Fixes: bf8ec3c3e82c ("drm/xe: Initialize GuC earlier during probe")
>Cc: Michał Winiarski <michal.winiarski@intel.com>


since there's no change to the patch and the Cc is already in place,
I will just apply the patch

thanks
Lucas De Marchi
