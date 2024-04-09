Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0CECD1284
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 11:36:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D400112298;
	Tue,  9 Apr 2024 11:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J0nkZ2ZW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A148B112298
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 11:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712662577; x=1744198577;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=UNMm3kQzVw0B2eN/zbrIcic3s9EtfwvcNKAbkZWYoHY=;
 b=J0nkZ2ZWjd8TkwHniUeaP64wkmuUjSY83xx6OYMED/4Qw193oLU+W4Jh
 aJlNX63l9Noh1kXQ7SqVS34HYUUjvl/YwXJ+36OWVIlkAKzvbGtt4CC65
 dQ5/DNJTRvSdl2Zh/pkvLWBohpy4ivSfnoKNjHqXAyVorqCEEMWf8Zkf2
 zvzqFzvRJ0N3yD9vOfvuhRHxxwXBqu/mswMVS0BoiTFRbomLHo4YeRjYf
 k1cbiCWd7yi7r52ZQEPAXVngv4QkzSfydDmNCCfnOPn1bUqg5PAmZXrYj
 N7qZegO13kYXkdHsBUfm8Znj0n49Co3x0Jv9eVMPVksYwl7Lw7g01b+fc Q==;
X-CSE-ConnectionGUID: LGUZNlSNS3qm+qrJ6F3WdQ==
X-CSE-MsgGUID: MVVzguJqTZOMEPiCkKnRzw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19122224"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="19122224"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 04:36:16 -0700
X-CSE-ConnectionGUID: BEfjr0gDTeGszBN4wJDB+Q==
X-CSE-MsgGUID: XF3yW5QsTyKST5oqwOpOtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="51195619"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 04:36:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 04:36:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 04:36:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 04:36:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 04:36:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3vL19fomZMeaSLeVaKlyTybjDwbjvLg9Gb1rQKjvO1nNerHcJzdUzZYjnOTp8UlkTDrB7XfKFayY3Zv4MfvFi2M8IRLYNWcpQum8kRsAyV6s/f7ipsVNIIGCk6662MUBMToZOdpBGkRTr7v3Hwfi18Gj6u6PxuXnbWouSelaFIiV5aouQ38hQYuJCbeSsYRBNqrknb8RnZODIVebdBjuXMVLRCtvEz106TJXpvyNLgBFt1EpBuEvuPmrFjgBXwWLKQToYVyQVvfzSr6kTS5NPuFdWwCpftlz755CVl2h6DD54I4wtYoUkQmJJ0HtXog37u78vm2k90RNJvXqMyGWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNMm3kQzVw0B2eN/zbrIcic3s9EtfwvcNKAbkZWYoHY=;
 b=cMWTpG7+DyFEMn4cg/sUvyfRTxgo3drMhVo4YYYaE48PMQsWwNfc/XxL5Ttm7guOj/lbtQ+fe/tL8ENVUvGLsjp85/UVrklcfh/wnLkxsu15vWCW9oJlp/uJ9DHavCpNkuvVjRSoe/qZIeRcMNzufpwzHIuHaT25bK+dk4v1V6Ef3s7B+gPQllAKu6a/OH5ZXCM+fJ9WHmDkjsf8OnPyxbZFFpqBczeduHMqNyVGJZbAH9HyclqtqNTVOEP9WG3fj+cIjODkAfPR+8moR32E+lyJ9X2KYvD1DawJJ0tz/A8WeAdg4T6qpCre9uy75M6CfBbwftocOR7NsGjFmtbb/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 IA0PR11MB8418.namprd11.prod.outlook.com (2603:10b6:208:487::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Tue, 9 Apr
 2024 11:36:13 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724%6]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 11:36:13 +0000
Message-ID: <898a343b-0149-49b8-8d73-f38063af6018@intel.com>
Date: Tue, 9 Apr 2024 13:36:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: Use enum mode in drm_mm_insert_node_in_range
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240409111541.2478-1-nirmoy.das@intel.com>
 <a93ebbfc-6f04-4028-b50b-a2505f573125@intel.com>
 <56175793-a4a4-44ec-a1b1-2d978859e677@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <56175793-a4a4-44ec-a1b1-2d978859e677@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI0P293CA0012.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::20) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|IA0PR11MB8418:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bY7R02CPLmoWvHgdkLNFFlF7xd3SIw4I8yQXFKqR3rQJdVehCOZaC9WR2zV1JeV08RNUOnWKHNo8A05zJnwgkbKxfAxupf8Qpv3PPijixIp1cMosg+w8psbz7LIasO4oynJzEqbjpzlJfZTxUCfUYqU9DkHmuf+fyvB5nf1FqPAz0/tMtxLXJyFqxsxhFYI3FmbUnFPFj7ydOHLaydZu82rCqbM7YKU5Tu1NJzcyhj4orgMEkuuEfqCiynxaVgM8k2asG16skpu6OAvLUihJhqOVnZjxsCQQZO27MWMvqKpmBriHhOUdVUmMs9l9tZVvtfQIteaWZ/ziUbP1wJYKV/5k/EqSdHoIisU9VlrMMS/ZyQ75XaLGYHsrA9mdUzHVC3gRijNTunKDpleCDuIWG4/tFcifbIRPAVgmh+kCdFxNLCnlPvCHKwFacHO68tu6rdzdvv9quyOXSakwrAYz/OsqSHk+CIqBeMVazQ2AYlussJtXIjZMA32FKBhmarPYbp80Z+Ehk2o09R73nyutjYLwpIiz5/C6wbzAK+T9PR9eeYz8G1t6ky4SAlrj9fNqzXCAbCSR9bh6QZDqAmbHGNNOwKBYs9jrIMRw6W6XVDbIktFPRuzskbEFs//q/ZDqzan3AExgvhIbYSAFFXINmJrDKF+iVtDmFA3S39YRZyE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDJaWkQyNndyS1lTL1JMdTJKeUxVNHIxcUhubk9CcVJVYWhlUlh6d25UOHoy?=
 =?utf-8?B?cytSUU16bWsxbjJTSVNRSnI4cXhlNlJ2SEFiWURsL1ZxcGFmMHNBeWNyUWho?=
 =?utf-8?B?SHk2Q1NDTXVKeHJtYnFjWUx4RVBkY0hOeTUxVGcrSzMrb3VBMVRhSXZwRTd3?=
 =?utf-8?B?a1hoaGwyc3JnVktSKzlzL1A4dVRkbDFzSHVsWVNBTnl4ejY4NzdybENlN2pC?=
 =?utf-8?B?Y2o5NlptUENkYytRYmpLNGJQUUpwaUI1U1JhV2VxMDNRZExNQ1E1eHpncnl5?=
 =?utf-8?B?Z2tHRU4xT1RtVzZLb3kzZWtqTFpGaG1jUzA1Tnd1eFFPSzZhdUxEUXNFR2Z1?=
 =?utf-8?B?RSt0SVdTeDBsMDVuTEJlTDhZTTZnMHRPV21meUsyNXpnZEx2eEx0SVFjQ3JL?=
 =?utf-8?B?Wk9IYmUzWi84RTAvcHN1MXN4b29ZMjRkbWhrWmxSUjhNYWFBM1c1TXRQb2Zv?=
 =?utf-8?B?L0lzRGlBYi9PMWhhQ3l5dnVGRlNkWUIySlBpWmZiTGV1MThjYVQwM0ZSRUlr?=
 =?utf-8?B?RXgvRVRTOFhCdFhLVFU3NDJpVTUzcXl1eXNOSjkyK1lOellnTk9CSERweVFW?=
 =?utf-8?B?NFV3TTdVd0paVG9Rd1E3WlhGQng0YjdwNk9PT293ejMrM1N5Q0J4b2UrVmFj?=
 =?utf-8?B?MlJTNEYwc3ZuLzNITFJHRzl0eUlQNFBiRkx1ZFhtNHRMWGdsTFpLd0g4ZjRO?=
 =?utf-8?B?Z0F5UTRKTnFrN1h5WTB0WmpaeWpsMjkzYlREN0FFeCtxTUIzVWdPd3JtZ1NX?=
 =?utf-8?B?WHg4OTIwSzE4c3V5WkxPOXh0dVV2Q1RaVEdVazlZMDJjSE5BRTAvUWxzTHlS?=
 =?utf-8?B?Q2JselkvaEVoWlhvTWo3Ylh0aElZMzFzcjZIa3JISjllekpURE5JeTB4Um91?=
 =?utf-8?B?TlNQbzczRjV2UElkMGR1OHVLcURNeWFWVUFiUXozak5zZi8zYi9pTGwzWTJQ?=
 =?utf-8?B?K3VjUWZQRHdZSGFMUXk3SEtNdStpdFNaN3VuTExMSkNid2JQb0UwWktnekhY?=
 =?utf-8?B?K3kxV3I1RnI4aXpsTnhQK1IyY0JLb29MZ0VoSGNicmdZYmNhY0RhMHU5N3dS?=
 =?utf-8?B?Y1lNeHFFcGU0K3ViQjhvWlA3MHZKZ2pCcTZIZHdnSVQ0VGVJaFhjZFNnNUxO?=
 =?utf-8?B?MUpaaHNBeE9GMnkvTVZGbi9na3UrLzd5dWErMjNkL2k5emNMZ1pBR3VOVHla?=
 =?utf-8?B?b1lYV1JBUjFLQzBKWHdEMktqNWoxNGZ1NjBGZFJVeTlJMXFhdTRtM0RDSHlV?=
 =?utf-8?B?eGNOeTdWOHEwZFRkU1VYeVM0dm1pRDZ5OVhraGsyQ0pEUllHNXM5bzhDcGRa?=
 =?utf-8?B?a1BvZnl5VjJWbTU5akZ5SnVoZVdPRGpJS1ROMEhLd3ZJSXRQdGh5bUQxRnBq?=
 =?utf-8?B?NCt6cGZ0cWxobmFzbUZNcG9uQUpjVlNDcG5sVXQzOVZRVDZicUxaR2d5eWJN?=
 =?utf-8?B?MFlFZHk3aVdKZXVkZWlZUzMrc2JmZlNEYlhQZHhQZnJmSUNONTgwc3NnMUtU?=
 =?utf-8?B?NlRwd2xmeDFWVkVFTkFiQmFLeHIxSEFQcS9KbkI3UHZvbkJhTUtNWjB3czN2?=
 =?utf-8?B?ZjN2Q1J2VGVsTHlRM1ZFSVJCL00vQnFHMUdrQ0d1Rll2dXA4Ymk4WXJuWXlW?=
 =?utf-8?B?TS9TeWtxWHVoKy9uZ0xNaGJtTEtLZW5NdGVrOXhHTmZobnZGcE9IWXcyNlNo?=
 =?utf-8?B?SXA2elNFcHc1dlplMTdRQUIrdnB1cXE5Q3lMWnk4aFVSallMdm5USkRkdWNM?=
 =?utf-8?B?WFphL0IrbFQraFFNODFuTTBWQVMycjFIR1NCcFUwV1BOOEl3YnUvNk1IQlVs?=
 =?utf-8?B?OVlBZDBqVDNDSWZRM1Q3eG5WUjBhZUJqL0RveGZNUmtkZmNlb0cwdTlPaS9y?=
 =?utf-8?B?c0tTNVNsRitSMXdxaFlMSXQxWWpjZmhpQ1NGT2Q0QzIySmJCRjZXTVpxTTRB?=
 =?utf-8?B?SEpOTG9oU1htc0FhK2hxYTNjZE5yMUEyNUVSSEFIdWJRRHZVQWZxT0VlQWJo?=
 =?utf-8?B?OVc4dWc4MFA1OXkzaDZNVC9kTkU1aXdWcm1VOWVEbTQ5NFB2VHNkWUFHQjFP?=
 =?utf-8?B?dGdVeWZkR25jNkZtZ3R0aVJxQ01WTWMrbUhjaURGK2MrT0UvcndYaUhVSkpK?=
 =?utf-8?Q?9g0Ds8JcHsOHtH5X7VWstVtU5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa1cded-da5c-42cc-e512-08dc58894274
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 11:36:13.1292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nEFSOriF5W1heCrP8juLCIwAShOhURZuxYNawRL/eOEUaGRwHVII7qZmp8ejkmwsvY38+5WuA6ZZYccpRVlxkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8418
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


On 4/9/2024 1:33 PM, Matthew Auld wrote:
> On 09/04/2024 12:31, Matthew Auld wrote:
>> On 09/04/2024 12:15, Nirmoy Das wrote:
>>> Use DRM_MM_INSERT_BEST as mode instead of zero.
>>>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
> Commit title should be prefixed with drm/xe:

ah right, that was stupid of me.  I will resend.


Nirmoy

