Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC10C54E5D
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 09:36:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A05010F907;
	Tue, 19 Mar 2024 09:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SRYzAmVe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60AC210F2B6
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 09:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710840994; x=1742376994;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OX6YVJUL1MCvzeSNiFKpOZ8QA8IyT10GgCq3GBDknIo=;
 b=SRYzAmVeBIKSReTGfoFP2tt93R7z/1LYLBNZnday9kswQ7ja1TAezvIc
 IyGHkdfPh7GeO5IP/o2Vxo/kVbBu37CA2fd1PN+OwKhf3Z1AYP9DemlLA
 fNVRp6LTszlsI7NMG8lpBUETfjq2yyCO6q5z3u8bLJ7FjWFrH0SCozXtK
 +ntDcF1BkPBV5htXNVym5TNBmS41TYaXzmTfZKyqtp/vy+okdqBgb6vlX
 C2xhg2R4WAq4+r+fN/t5QRwAYNsWEOPBO+lUGEoJ5lnn/ZJF6E0VKSe06
 /I/gZwIp7qwRmHY0YNSja3QoYpVT5Mf7fFg+uT4TOierj8FrZEGK1lGfh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5563134"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="5563134"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:36:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="14406539"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2024 02:36:29 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 02:36:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 02:36:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 02:36:27 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Mar 2024 02:36:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GIxEPkNzxB5CaYSPzx6edHuvPkwjC4rlCkGy2lfF2PE2niGrbVfweRZJey3wkIBQw8VLVvetcVYqzhdKVBe0xz/yyGf7ethgE7eWhsp08uLQq7DCWnIEpoB96h1d5gXOLVU3XVk5WLSrDxztvl6CJryNCjVP1QxSCzBUR2K2Lm012Nhqo8USoqfGq5Rjq+ncSOb1JBV7m7Y8YHQcNGtWzoUTqLdQalbTB6+znbgtw6LzWIjfHlx53v/C3O8LOmrUbv63O1OtFoeM22u/yhHOQpfNgHNwLf+94lgIitfwArSrNS2cN06AIGJO6zBQEBDLDijKTTs7uRZ0lTAfZDWmzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OX6YVJUL1MCvzeSNiFKpOZ8QA8IyT10GgCq3GBDknIo=;
 b=R6ZWxhDGq5/eplxncxHc0KfzstSegNmuv6De/GtCyDUy0q1u7jT8+BlFRFbds/aDX6Hw8SutUs3HVX6k6twNmUZm9W8tuF6SafKk8vc+DuiSf3//NogQ35C6w1bp1CucC4h8vJaz2QVE+srq4y5PHJxmt7l+WPWOxgDtNZY8Ouc1fGPk0ndXObeVVPF0v23F2w2gB6qsfRhhNYQ10Bqok/Tg5flfoaYXVlQr9wKVV7W05fDQvQMLwwR2mbjvtyU/2N08xOPHkChwhqDhbS1xhq4gpt8xwaS21+ZpzBs0zVw9RvAGZl67ppfnprW2gsP2Dj2SD6wwcUoMzE26MiQOdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 DM6PR11MB4676.namprd11.prod.outlook.com (2603:10b6:5:2a7::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.13; Tue, 19 Mar 2024 09:36:20 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7386.015; Tue, 19 Mar 2024
 09:36:20 +0000
Message-ID: <4e597ff7-7565-48db-9172-764bd78506d1@intel.com>
Date: Tue, 19 Mar 2024 10:36:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pt: Warn on 0 level before going to next lower
 level
To: Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240318173744.6301-1-nirmoy.das@intel.com>
 <ZfinAR6OlL7OzrbU@intel.com> <a6109ad5-d11e-4992-9ccb-17dd8b658afa@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <a6109ad5-d11e-4992-9ccb-17dd8b658afa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0089.eurprd04.prod.outlook.com
 (2603:10a6:10:232::34) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|DM6PR11MB4676:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0rxUn7ShMIZwM9rNwqg7omFLzD7KBJQ+djOxz9L8S4jMIerTT83oTmn5swiDf+x+8X9uKEwIwuwWySdO4H96pEKDM8ASOMuW204P78TZD15C5YEJBCW1IrmKc9n37fHXge1i4pjxMt0mX06Kqxl7n4y1zv5R+Az4idMNi2X8wV0IujuVTF2XSS8nvIyD38wXo53sfLx0MWQ0a0TVNt+gHXPeZxLGmhjB0MJBUACCKCVdXLLmbWXzTUgBe1h0DTcA48y4Dneg4VlbrQAtKSJoLqZmAaTexY5MHRp3kMXhu17GqtxaFH3iwK9wdGEGkCyj7v5oGnRJwRyMLuij/qfWdsr7pfdu5yGYy0s4/uLKqiLnqalipw78cgvvauMnmoGsNpXRJDPYuTQWRryqEzeJS0SLqsjkwcGJSys52tDttSykkzsvpAue1JSqTDc1XS5rH6yncWX9IbUuOitk7uyfkjqR8UnHXkhJIvz569zH94aUFNQgzun/SKOSldQc3g5vMf1x5WN/93miDnc8IRrJJg5zeQxWfDltBhfokQjU03DSYDtNVcpUPc4anbXXTRGJnjkfBzBavPWL6dGu9axezkJAZgiJN+7Mik74G1R2PixpHJVBXxwG6hkIBX3N0UMK9i3ZHd8fkAcuu0X0WV7bRlqgdGkPpBQBEfe4Rfa1AGY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlNsdGV4dG1zdy81N1htcTB0NE01dVZNeCtuQjJpNis1RCtXSjBtSkVTYmsv?=
 =?utf-8?B?ZVJtbjVqS3U0UFhWNkw5UzNkMSs3WC9ITU5KZzNIK0R5Mi8vb0ZHZEFMU09P?=
 =?utf-8?B?QkJFMVlxd2Z3N3NtbXpjQzhDU0ltd3Y1cDhtNjVlSmZJTS9mZzhJYnhsd3F3?=
 =?utf-8?B?TkhyUGtQQUl1Mkk0RHpmOXB5aUZ1TkZReW9tOHpXczExVmdFcTdiN1paaXd5?=
 =?utf-8?B?NTR4NEZrcUdjMzlSWW5UUTcyci9rK1RlaTRrWS8rTkdHTXUrSmV6ZU54TzRn?=
 =?utf-8?B?NHRxQWVaRHlKM3NtV0NWZy9jNEwvUFliREUwdWdqbmQySDFzUzRKb2s1ZmQz?=
 =?utf-8?B?ZTg3TXF4U0JVRFZCT2VMWEd0dURKckMvajNZTmtGWjN5bVZ0MElCbnNRMlpv?=
 =?utf-8?B?YlBqK3Z1UXBMdE1Qd2hYZmtRdVcvOUdtc2NZZXpwUjFJMVUzRjBESjJURGty?=
 =?utf-8?B?RUlENzBkbHI5endaVHZLUlNjTjYzb3VaMnZiUVFqZGtjbXlBbFliUXJnWXly?=
 =?utf-8?B?TnZDcDgybXdQVUwrejIwWEx5U1U4aXFvQSsvVFFVZ1EwVSs2MUkrUVkvN3pV?=
 =?utf-8?B?ZVplSEdpRXlnVUJsSHR0Ym5Sb3duYzNqV1Rpc3FYclFNdFlRVnhpNEdzd1Nh?=
 =?utf-8?B?NHB0TTRpRXNWbnhjY0lHcktleGNvRHA5ZXlsQ05qRDJqbHRTelN4N1Z4eUpX?=
 =?utf-8?B?c1l4SW1yQ2d4SnpjNTloaXkzNUQ4NmoxdWFRTjFpc013cFZKbXBzd0tKRGhT?=
 =?utf-8?B?WGhxSjc1blkxVFhPcXFudVEyMXo2ay8xK3dCSnFSZjVyWHlkY3VwaWpWdDZo?=
 =?utf-8?B?S1pmS3BVODFya1NWUm5zSm93bFFLUFV6N3FDZHMxZ1d5UzNVNlIxNEdPZC9k?=
 =?utf-8?B?Z0pLQnhLMHZIL0p2OElsMHdUYUJwVk4xVm0ycVBDeFZEK0UrNFo5YnpRc1I0?=
 =?utf-8?B?MDBxWlNvUlBEcHlPdlZ3RWxSbDVPa1ZPN1NacmVSbjZyRGNYVjZoNS91cmRB?=
 =?utf-8?B?N1ZnNWg5cENzY3ErWWVVVjZENEFHaHB1OGZMcE5uT1h1ZFZnMjhzMzlYbUdX?=
 =?utf-8?B?QWNFKytsZzhvbm4rR3M4TzB4OHBXZTBFVzZXU0JxbWRBUCsyeDhRWXBGTklP?=
 =?utf-8?B?ZXM4Vk12d1l2QUpDNWRVRmNSdFZZMTlVRHRON3dEMTJMTEtQMjZCWDBEZU8w?=
 =?utf-8?B?NkpiMUFBK2F0L2ZKLzN4VGJZWUdkcHlYME5USys1RTBranhKY0xSbEE1TVJ3?=
 =?utf-8?B?VU9lS0lrQU84TXZRV3FjZzRyQWt6dUFPQWJiT0ZaMFZVaHRrcWh3L2hqdE1N?=
 =?utf-8?B?QVZnNmdNa1dGY2JFeEZqQWxOeloreDJBRVg5S1RURDE3OE9MbEhScmMzdTFv?=
 =?utf-8?B?bWtqclNuUmtZMWg5U0F4b2lNMUgwNDNlSXIxc3JyamhyZ0pRUEZUTTZnRXp1?=
 =?utf-8?B?SXh6ZUcvK1Q0b1NZeSs0aVZHeFlkY3JrdjZpRG96WkllTXpyTHlDS3JDNHdI?=
 =?utf-8?B?ZkNjWmg4VVlnOUd6N3E2OG5YYzRaWnpTK0tHeXdBVSswcXI3Qy9ySEFHNVhq?=
 =?utf-8?B?Y2FxTW5XYWtRdHRzRmpHVjF6VWxaYW01M0tOTEZnVXRhcVlQZTRBNkp2cDBK?=
 =?utf-8?B?bW8yT1B6ZTdQckRibC9MVkJCSHRNQjZ0cUtGOWh6U0djUWV3RlRRbzdkem9E?=
 =?utf-8?B?Wkp6Z0lHaWZmVHg2eXA2UDMxOWhCOFdpMGdDL3IwZm84MzgzSWtCQnJQUVlV?=
 =?utf-8?B?d1lNL0g3ak1JbTdPb2hDdEtXaWFOOEdBOHVKVHlXTVpEUDI1NHJObzZhNk04?=
 =?utf-8?B?ZGVKeHhRTmFCY3pXV2hjU1N2Y2MwQVU4QTUwV2dhMTdndGs5QnhvazBVQnB5?=
 =?utf-8?B?dXdDMVVpMEw1bUNTd3RBWU9IR0g0b2svNHpISmtPNEwyV2VhVU5NWjFoYXds?=
 =?utf-8?B?Qmx1UlhQcW5PamVBanFnSWExdUNuZTdaQ1BoOS8wajAwNm9HRFYxd1U4MC8r?=
 =?utf-8?B?RUN2K0h5dWFFK0JjQzB6RFpwQkw4eTBoZXVhS0V2Qk1qTk0xRFh6aXpRZk41?=
 =?utf-8?B?MHZycjVJY29Dc2xJaWprZ0YxNk0vZXk4M05OOUd3WEJBYmcrRmNWUkpoSWd6?=
 =?utf-8?Q?w+gLfQ4KjlG9kszB27U2uhtHm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d5cce43-6441-4431-f0da-08dc47f80870
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 09:36:20.1233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FGvnYVZcnvnFPYciW/ZciD6HEES7r7a2SkfgLwr7LecbNaqOGqew2+m6xwuFQmKnNEMtcvnHeDAnaCWHF1C6Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4676
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


On 3/19/2024 10:25 AM, Matthew Auld wrote:
> On 18/03/2024 20:41, Rodrigo Vivi wrote:
>> On Mon, Mar 18, 2024 at 06:37:44PM +0100, Nirmoy Das wrote:
>>> This should happen so add a warn_on to be more paranoid.
>>
>> should or should not?
>
> s/should/should not/
Yes, it was supposed to be  "should not".
>
>>
>>>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Thanks,


Nirmoy

