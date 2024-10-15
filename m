Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B67CD1D88F
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 17:32:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3634410E5C9;
	Tue, 15 Oct 2024 17:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RQlYe+Rp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794FB10E09B
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 17:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729013575; x=1760549575;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=I8Q85M3Sq9VpEoc2yPxb6KMlkYiAPze2+U+dqDV3lFw=;
 b=RQlYe+RpeOT4boVuFf6a0jK5X7CSYIy5bhE9m4xVxo8mHPZZsPeseO6J
 LkhbUd/nXOTUwxJuo8QKY6YSVI9+v/kRtJFjdNXvs4DBwv50itZQDjbTL
 Brl4Trg1FrNIJDBXNtriEtvaqC3Jy3D9n4i7tNePLZUTA4eZyk3OaWfqB
 +6W/fFF1MNvkjd3uGXYrILWK7yxTnsnbAYQboAq6gfIsdcuYzo+l4woz1
 Mv4R/slLMjhfoBM1bQxeRukoUIZcrQGbuLFF1kwyt867jzps0J74PllEg
 wJnhOA1iMns2hukZvsX5fv5lITcoCfb+y1WjGlexMs8VTBuezFsYmolRw A==;
X-CSE-ConnectionGUID: eyCsTSzZR2WZhqYEE9HoGA==
X-CSE-MsgGUID: vS8YgEtSRdSd7xDzp9tvEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28553671"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="28553671"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 10:32:54 -0700
X-CSE-ConnectionGUID: KyI9QGnhSdWoZMDp9tTB3g==
X-CSE-MsgGUID: ONETpCnvSgqNxzy8bMu6ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="108702370"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2024 10:32:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 10:32:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 10:32:53 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 10:32:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nnyuaq+EcoDBNEOaKYxoIRB7kjdxJesZXw0dmn4AiABHJA7o57YTUugHfWckx1Rz3SNEXs4RrDnBVSqLvECUkfvhMmaPWE7RhHHMQVvJUrEb0pDdhmH6K2BgHpMma8dnYj0m3KiIdlzQ8XnkAPQC1jNblXL5LO+4fXp0Oiczmcr2F/3c0L8lTMl+xzZ0EqHqZSAk3qug74tLXYNRjmlaJBGK+k13QISUjpb0Ht4x74AW5dlujU1/0YCT2q09YX7KbbD/siv4h7+xXPEOMOnecZq7dloTPiA8u1gnqkZ9OJ+XnI6vH8NoLeis3gPei4NabZeAcBr8z3XsuNPyofq2hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qktlc1wddraVexoHmtPUCzDqCgWy2mzFxp+t9407Qzc=;
 b=F+0KlXX4Li2yv2agyHBf++C0NPQ7mFztqnqAF5GmGHyfUn2qX6uMm22BODJN2NoWum8i4S6LkFRCEuwZ1mpmgTvgmNj2woRr3iS9DN+qej5uRQJvVyRkf6/E9tTQU+yVXbIybNVxqD/LIimZVpKFBzXyGt7GeduvZ5Nc7ye96AP2wYn+xXGDHMVP07mn3bafOnFjtzuU614AI/ny4SjFhxIKu5xeFtIXfWHmyjokqMAtsZ1Kc2RjpXn+7d8LUr9C0Qtm/syYqgPMgebKk0mM2U1Fx6c+46tmGiDMMBofKP0bRpXb963lRnatRt8P/fogjwy/f5wKb5oMGFU2ttebEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by PH7PR11MB6748.namprd11.prod.outlook.com (2603:10b6:510:1b6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 17:32:51 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%3]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 17:32:51 +0000
Message-ID: <6a98cb5b-0d1f-4fcb-9fad-bb839894ecf7@intel.com>
Date: Tue, 15 Oct 2024 23:02:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe3lpg: Extend Wa_18034896535 to Xe3_LPG.
To: Shekhar Chauhan <shekhar.chauhan@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20241015161938.845996-1-shekhar.chauhan@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20241015161938.845996-1-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::18) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|PH7PR11MB6748:EE_
X-MS-Office365-Filtering-Correlation-Id: 34bea8d7-a3b6-4124-9d81-08dced3f64ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVhTajJoa3FDWWVZeUZrLytMcm5nTnhGUWNGM0MrUXkwNS9VSUlFY0txZVBx?=
 =?utf-8?B?MVoxY0s1d2lEajZUSEQ1dGdTVXpxUStRTEtIVk1PeTJqRlNTM3prNU9NVGhC?=
 =?utf-8?B?QnVwYU1UNU1YWk9PRnB6aXdVdFlXK2VMUzRZTTArcE5GeE45MG1mR3NqWFh2?=
 =?utf-8?B?c0p3bmFucmhwOVp5TUNobmJQb0RDdUQxelQxdm90SjZiV2trcjJLOENOZklN?=
 =?utf-8?B?WElvRGNGd096UlBrZ2J2aFczZEFmdENmTUh6djV5L1ZVR2ZNanpGNjVqaFdY?=
 =?utf-8?B?Q3ZkUjBwMjgrd0JPZXA5TEZBYXB6a1hJdFdxOVg3OFFvaXRCUEVHSk1kUGZl?=
 =?utf-8?B?TkNHRkZoa0cwbTBzZHY3SWdLNVExbGlHZHBtL3BIYVNuditmMEZzU1NBV25i?=
 =?utf-8?B?dFRPSlZ0R2ExajhVUVJ1ekhpODBYcmh1SG1VY1U5UG9oM0tpZUlPcC9LekVK?=
 =?utf-8?B?UDZmSVVsVnF1NFh3VWUrbXlwZm9panV6Q0dGcmN0b0kzVHlMME40eGprWGcz?=
 =?utf-8?B?ZERFTU1rVmxpVXBUUjVnSDBoc2ZKREpnNEkva2txUFhsTlhObUFSUUc2YU5a?=
 =?utf-8?B?UEd5U3ZRL202N2hhTHNtb1pNOUdzNFdnMHh5eVhVSUNoejVEUmw4d29DK1hJ?=
 =?utf-8?B?S0lINUl1SnZlMDBlaFZveVY1U3lSM1I2NE1pY2F6VHJINy81c1JDdmxjalJE?=
 =?utf-8?B?VHMyRVJqUk9yMjVUQnV1SG9PejlxQlV4TzlvRUF1L2daM2RjUjdZKzh5alBV?=
 =?utf-8?B?cjk0WWE2MzJDd1YyaDA2ZkhjNm5rUm00WjY4dVV3a01lK0FmWHJNRXhWV1hE?=
 =?utf-8?B?aXFIeStQaXRoZzRIbmE3UUhmOUcyY2JYSW1sWFFqWjlWZkRqUmpPZDFLLzhu?=
 =?utf-8?B?NlJJYllBYXZUbk1RRXdyNE5iMzNYSGloUFhpemh2NVdneWZDeWs4SitiOENC?=
 =?utf-8?B?MnQ1K1p0M3I0dVYrRnd2MFRaRWNraUpQWHI1U1VjSlY3SngrdlNoR3BxTUdp?=
 =?utf-8?B?dmNJaEkrbWY1YjZQaHp1N2NKa3NpekJrUUtBb3lGUDZtNUhoZENkVlFlSXJE?=
 =?utf-8?B?VHk2WXc2UURKREtnb0R4dGJMWGhSUWlIc1QvdFNkeG01QXpLMWE0TEhmbS9C?=
 =?utf-8?B?R21hSXBmUk9lcHV3NmVOa1ZCSXROYkRaaFI0eCt4dy9sRWQ2ZFNZWlVoSDdD?=
 =?utf-8?B?S0J0ZlBHcWVZWjVQL3dBZkxpVm9KblFNdk1SNm53RkR4QllESHlzamtTNDhH?=
 =?utf-8?B?NlZDU2htVXErVXphN2x5ektYQnZlMHhYSHhrL2IxVkdIbHdqTjhJN2xndDhI?=
 =?utf-8?B?cWdjRWlGQXNUNWphcXRKRmZKQWdMNDN3Yys2Wmg5NnpKK0RMS0FzMWhkR25C?=
 =?utf-8?B?MkhUdG1SZW9HRHdMeFhOdW0yNklSNm41b1pzZE81RGhJaHFnTDJuWlBZd29U?=
 =?utf-8?B?VDdzaGhDVU9LSWRLNTE2OVdlYW4zUVF4a1d0Zmp6TGIzeE5UY0djcjM2cGxa?=
 =?utf-8?B?UWtXY3h6WVNrQ3dJRWpOVHN5WlhMV3lEbTVxWFpZVnRCTnRpc2NZV2czOVhP?=
 =?utf-8?B?NlIzTGNqRHJkYU05ZzNHWXdzU2xBRTBkcEdWbFhIckh1b1NqOThEUWh5STRr?=
 =?utf-8?B?bFI2U3dQRnhKeWFOVTVTaW5DNUlocm4vT04vZlVwZmxwc0NIZUxyb2RnaWdh?=
 =?utf-8?B?UEZCNTFQK2huVFVRTEF1c3k5MEVoVVZaaVBvTUxmYW8rTTF6OVFIMmtBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amhCclpoMVlJL2lEcW9ONHpUSEJiUUdDdW11bnkzUFVNTE5kMnFnRUVha0R5?=
 =?utf-8?B?NXJQc0pVVzV6OWJoeXpKblh4WmkzTUw5ZGg3dnp2d3JXN3hUbU9Id3dDSU1K?=
 =?utf-8?B?ZlFYSHFvT0hYOXZLMHFSTnlib0h1RzV5VXRWN3QrbU5UUmxaL25DREhWL0oz?=
 =?utf-8?B?Q0RmQ01VbTA3RXZxc3loL0dYNkpOYWpHdU5JRUxrNERWejBVeW9EUXliZzlJ?=
 =?utf-8?B?d1EvQWRucWxmcVFHSEU0ckxxMVRVSHpRb3QxWm9mcjRFSDRpMlpmVmtqN3Ar?=
 =?utf-8?B?NmVIMzI3bDQvUWM0bGVJc2hkYmppMEJWRjhiVEdzdmxaZ2Z4STh4eGMxUzhK?=
 =?utf-8?B?RHdSdWwwbU9yeTFUeldZNTdoR2lDeVpDeHBURkkyMGRwZXZ2MlJYeWF1UC8v?=
 =?utf-8?B?YjJ0WmV2NEpJZktCY3cyK0hVeVlBYXcvTGp5eEZYVU5JZm9NQ0xRNFkwUXhS?=
 =?utf-8?B?M1BjU3JLa1V5WHkvMXlsK0ttMU42ak05ZVE0UjlhK0QxWnRPMTRYUjVlRnFh?=
 =?utf-8?B?QjVDazlNL20zOXZER1BiUjZnKzgwWkFiL2l2WlFZTUg1TnRURWswaHBaM0Mr?=
 =?utf-8?B?cWdic0RFU0JHbnVzN2FBV0RRelAxV2R6SUlybmE1eGhzVk9ReXM2cm5vc2Nx?=
 =?utf-8?B?WTZOUjNVVGduSXBtRkIrbzdSZzQ4L3JheFQ1TVJkcDhEWXZzVTA3QUNpcXpz?=
 =?utf-8?B?NWxYeC9EbWVzMFhIQ1ZrdStvVk1zaWFQS1F1ZndTa01RTTNPYThTVTZlNjZk?=
 =?utf-8?B?Ri82NFZzazFRaU5BVlRDRy9tTXgwQ0xMN0V2QVpEWENkVG5pbDlzNzRRQlRP?=
 =?utf-8?B?OUNlZTNpVEdTTkNpNDJ3Uno2cnJ4cFQ1c0RDRVVDRFgwVHBHSmMvT0JrTXcv?=
 =?utf-8?B?ME9tL05Qek1neXhsNVNQaStuNHo0RW9qODBVd3FNZ3lRaW81UktnbXZQUG56?=
 =?utf-8?B?Z1E2TFFhMXBRRDV6WFVyR3JUU3VjendIbDRCbFpUS3FzVVhJK3JXZFZRYkkw?=
 =?utf-8?B?eDRtdnVYSDg2b2NCSGtwVmdBZFladEEvQjdDalNNaW0rNVI1cmtmV1dBbUov?=
 =?utf-8?B?c29kdmxCckI1RmswVnRHM2kxc3Q1WDljb0VOM00rMlNqczFtZkdtckZ6ZHp3?=
 =?utf-8?B?UVMzWW1vbTVWOEEzbjhCdmFWVWtSOFoxMkNyOGlwV0pTN0FsZEtmZXdSUTBV?=
 =?utf-8?B?YU9LOENOWTBnazMyZkFhckdXakVhVnE5akp3dzZUWjIyNzdmSjNZVmpOMGpn?=
 =?utf-8?B?RC9ac3dDbFlyYW43Y3BETTc1aENnQmN2OHFCenZneDcydVdRVjFoWUZFRVFZ?=
 =?utf-8?B?b1ErV3FXV21VYmt4cmQ5cWdIRkhDYXBVSVBjTUl5d3AwMkFWeUFab0VWK21q?=
 =?utf-8?B?NXU1c0RKUmk0NGUrdytiTDRXQlJFQ1V3dGFpUjVZYVhyK2ZZVDNHczV2a010?=
 =?utf-8?B?TmIvV2pEdHlsZkUzYUk1Z1BmSE5CS2NkSkx2bUJOTXluenhYK3FhOUtoUEpM?=
 =?utf-8?B?MTVMVkV4RVlKL2pkUDUxSlhBVHc0M25SdjRaUUtzTnZaMnZzS3lTNklyV0Jp?=
 =?utf-8?B?RktWS3BzbldjUDArOVVjRWw1V3U0bEVxNEg4ZHpyc2h6dXNLTXkvWjUyQnFH?=
 =?utf-8?B?OGtUMWs0SE1BakJGS1R5QmljRXFoYjY1SGRvS05HbFFaMldjTURKSGRFUXdi?=
 =?utf-8?B?TG9zWk9Uc3lJYmgxWGVnbnlqSWU2cS9BNWxBOXkzTHlHaExQd3hMRm5YNVQv?=
 =?utf-8?B?MlNFcmw2b2taWkpJVjNiNjR0aUthYzF6WmFpVGZONFpRRDE1UTR3SGRKVWkr?=
 =?utf-8?B?N05RcEZidTcrV2xPM21HNE1IK0o3aWVHazF3cmhLM080bTlLL3pyMjlFdHJQ?=
 =?utf-8?B?cFg4bEp5TkFJbUc3Y0lrazN3bzY0czU0OUpVQk1xVnJMVjNhRTQ5eHJXdEp5?=
 =?utf-8?B?TkJxaGhJdzY5M1ZZZi9YWDdnRmEwMjhCYng4aUE1QjdNQ3FMTmVJMEdlQ1hw?=
 =?utf-8?B?Zko4bEVDa0trM1N3MUc4aFlWa2xCY2ZUNlQxc0c2OVFXUGtsblVZaURrcXdp?=
 =?utf-8?B?emNnQjcwWVIyYzlUaXI0MFF2eUJpWkw1eFNOeFU1dFpjajF6M2RVbXUwUW80?=
 =?utf-8?B?Rmd6dnJnMzhCOFRUbXN1eHY3OERvUWlWL1RJVFFQa1ZzUmNFZFdWUEkzVmtS?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34bea8d7-a3b6-4124-9d81-08dced3f64ad
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 17:32:51.0597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6SadQPJZjUaP3cSKVK1awdU0Q0+k6kD3SI1X6EqJBxw9D0841UO3XikTvr+2TO61OSXi/WfGO55yUsiZgf+FaHyjrVxnlZzdilS8CQsxhVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6748
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


On 15-10-2024 21:49, Shekhar Chauhan wrote:
> Extend Wa_18034896535 to Xe3_LPG (IP 30.00), steppings A0 to B0.
>
> BSpec: 56852
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

LGTM,

Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_wa.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 0c90438e8e72..02cf647f86d8 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -602,6 +602,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>   	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), FUNC(xe_rtp_match_first_render_or_compute)),
>   	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
>   	},
> +	{ XE_RTP_NAME("18034896535"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
> +	},
>   
>   	{}
>   };
