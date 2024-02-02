Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B76C4828E
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 19:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E2110E174;
	Fri,  2 Feb 2024 19:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H1QlsgX1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E1910E174
 for <Intel-Xe@lists.freedesktop.org>; Fri,  2 Feb 2024 19:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706903635; x=1738439635;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=spsGrnKL2NJ4UURzftJoy3+v2LSmqf7TCT9XCs3i27Y=;
 b=H1QlsgX1LtHpN/kutGW2pNbyWH+CFbrcH9dRtrVjDLg3NpJcL8p08ycs
 7DM/fKJNf8SfdWmtoH6TwulD/AMUxDLS9IqVVHZWX27LrOskNK1Cylm7/
 P85Lyt6b0EPEJZGkFaBkSvKPu1C+wdA7dFsAUPrNtVbFQl1f3KckLQ9Jk
 W7w7WlfjMdE8kwJnmHqoXZY2/C6fu5WW/ILc2k2je08n97TSFh9YS+XYf
 AWCUMycKNakgmMp7vKDKFKTABVGhbz6tTWary1e5N0vqPnaadS//ozZB8
 NYf1I+kD8qFZu5bfUV8VSPFz9XRNFEgD7diiAJ5GB1CQo0dE1Ze6LgemD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="10828498"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="10828498"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 11:53:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="151095"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 11:53:52 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 11:53:51 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 11:53:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 11:53:50 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 11:53:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdXfrverln5/JCQ8JCg4jiIVjxng4XtBrAdbJyVDTrV1qX8gsZBtNBMFSiA3W6vmkgUeVOou6d/4QJR2SUkV79o89KlDpuLYOTxBo1GdwLMZm3y8mVjsM8rXWDJhmTzy+7gVaCLclN76iyZdvSgeUndti1hED/Nz1ABAc9qVVm0OlACuCQZycU8zwJZN83AyfJ+EcoAsXMk2nwfbgXFf2v/e2p1+ls6OJxnobA23NO1kLaHi/JMqPpD4zD6zlTdymqkvmAenJQsFYo1bz51TV90DSQLi3irbh/Llr1IznBMaMqKh24AC8TK10OIFjivwCbDi0/dYndgfv9TpoiuCZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nj8M/Vre0T16MvSIkcN+X8VPYr4zfW7ULyYyPNJLpas=;
 b=bevnIX0/ziw9gBnWLv6jftlYkU4QS61AJvb9UTxpH6knfjLxUSIBG0e6/X7jkaWZO4ZQP7XSpAiVPd7onu/B5Rj3cWfg05K9+fxtfKIqwkiKGrvQVWectbXGWZYJKIQZNMEPm6zaiuX+MXJTHVktCrwcI/3VpRL3JUbEM7vN5NSHAwZ+nTGp1Uu6w0H3UsyBOvLUzWf9QhLt282iWzjBhpDqn2M03D8adRs0n4SocevkfbfGG6bwxEZ28XBu35gXEQbue1kGddUx/Bo1aV4XbUYbf6F9e8tF1RyDtcnHzw3w/ZNst1cx/2PmvTRGbwomI1v7DJFpQX2p6O7Qa7ezWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MN2PR11MB4725.namprd11.prod.outlook.com (2603:10b6:208:263::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.31; Fri, 2 Feb
 2024 19:53:48 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7249.027; Fri, 2 Feb 2024
 19:53:48 +0000
Message-ID: <de3159f5-c992-4ee0-b420-90b86c5464a1@intel.com>
Date: Fri, 2 Feb 2024 11:53:45 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Update to GuC 70.19.2 and add LNL
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20240202073050.1986142-1-John.C.Harrison@Intel.com>
 <njcmjcrd32ztgxa7gwmgsmhszwsm5je3ojv7mfvpkmm5s7dfep@mqy2hfmadmif>
 <2cd956b3-bccb-4423-be46-435125343449@intel.com>
 <pm77ns5mf7s4f4dk7jsf4c424bi5evvtvsfpnvf26svluys6ry@fv6lo3wbqh37>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <pm77ns5mf7s4f4dk7jsf4c424bi5evvtvsfpnvf26svluys6ry@fv6lo3wbqh37>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0097.namprd05.prod.outlook.com
 (2603:10b6:a03:334::12) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MN2PR11MB4725:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c3f8233-11f0-44ec-4648-08dc2428abbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V6JOmpihOWIVHPIM+ean/hBgk2THR590R8koB713OvHCT3xCKgzgSE2sE8MdWjWz2z2wOlLHlCdnJcCLxeItCL6E13BlOqdLUt/efx2cZ1KJ6jZfyQ+DzhfQ6sozP0TlWlPA4Ur5aNQle7Lu6Sk+X1FS7JEhlWTx4UyvpkGrzILkmIUDIeflImVSlesZQIKm6nuYiKrH2puLzG4U78nRAatz+78h13aa3BmN0RDua0zdpgydQRR1jXh6mKFaB3+Q6f2OqKHE+H2Rwz5oy+nrfXXbyjn2xaB/BO/BKnfnF/oGYd4FD832JlbSuoaevpvuAAC7m34RYk2+IAzsMr+vSug58wjXSZAbGYVt/7MUynONU7pdJsNigUAFsKFsKBhfWJzlBAHGxVFA8YlAakZgSiJX2o29NY/lruPv7sIrL5WoZuAvVa2uqkH3LB1xTcdb6f9mT7PizwrYTlgA9NcX9NyPvZlR9DxY+enlAK2vVYBwMkCyHopiMxFnAbhRdtVGMG4wwX3paPdLimAZBAj2SZecSKiZrXNz3Du3PmQjZXf39P4mv4FY3SW4gwYhShNNcgWGT8y2lv4q2opLUaDyJ/TbIZ6ofhWzjf/58GrWH3/kBdezo+YkhCbHjun4lWIf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(396003)(376002)(136003)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(41300700001)(8936002)(8676002)(6862004)(4326008)(31696002)(15650500001)(2906002)(5660300002)(86362001)(66946007)(316002)(6636002)(66476007)(36756003)(66556008)(82960400001)(38100700002)(6506007)(53546011)(6512007)(966005)(6666004)(478600001)(37006003)(83380400001)(6486002)(26005)(2616005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ti9DbWRhQkYvdjBSMEJyOHRjSWJYaWQ5Q0JaK0kra0c5N3NyWlFpYnNkMmIr?=
 =?utf-8?B?Y3k5cW5pZlN3RzNjbnU4Q2tFRUpoUy9TN3htNW40MWthQnV2Vnl0aFRkdU9r?=
 =?utf-8?B?MHNVSUdwTmR2c0JtTlJ0VjFRZUFxTytwZ0tkVk9HOERRN29DM0Y4YVhqZGsv?=
 =?utf-8?B?eTJCWHR6UWp4czRZc3o2SnpncGZSWS8vT0k1V2Rqa05kcFlhYW8vNE9xWndM?=
 =?utf-8?B?UWg4Vm9CeGE3MW52dkp6Kzc0Z3EyS0k4U3pxSWVZQmN3YUdFelhzSUh3bSts?=
 =?utf-8?B?N2FDU2E1SmtIYUpXV0ROaU12eFdTeHlRa2FGNUNwL1RTU1V2ZFhmU2hVemJt?=
 =?utf-8?B?SWxjaEN3RXZUZGg2aklaL1g5SkxzNEllYk5BTkh5K0ZGK1N5S2ZlVVZBa2wv?=
 =?utf-8?B?TXNkbStNUjdHSjlSRVZEQ3pyK2YrZFo4NURJTUMzVFBWQ3lNc1JLQlZSQWhR?=
 =?utf-8?B?R0VmcXFQRXFnOVNJaDdKcTJUNFJndFV6dlFhVVdJWVlDTjU4cGNKTTk1b3B6?=
 =?utf-8?B?Y0F4WFhyWEwzZm5HNlgvSzdFRXQzSmZhZUdJOUlJTDhWbGlVb1Q0OGFPaDN4?=
 =?utf-8?B?ak5Zd1BUTUhWekI2MjNFU1BpRWxQMnBJczFtQnFKMXlCWC9aUDI2c0hUYjdP?=
 =?utf-8?B?bEVLMVdsSnVZRWxWVDI3eHhVdnZ5SnVwU2R6NTZVR1FOdVFiWC9zWmdYZGdL?=
 =?utf-8?B?aXk1dVJONXU4VjBsWDJqZEZoNitDVE9lWWlBVHBUVXRLWWVYbVBxOWlkSmhy?=
 =?utf-8?B?bzZVK0EvZFJ3OG5TOXJwemxaM2VrYm4wOU0zdUNmUnpnWEpTR3VLUVhSbzF0?=
 =?utf-8?B?RHFERmFFYkc2WUlGbDdGWVV2MFBtZ1dla1FqbStUQ2JaT3NUc1R0NFNCSjdI?=
 =?utf-8?B?OUk5cC9GaVAxaU9iOXg4TFlzcGV2dHA0ZUU0QnBtcGxUaUd4SG4vQ1VFamdi?=
 =?utf-8?B?V1RDdnpiQ0JnR2VyVnRHTUVYSXpwSC92bloxRmxFU0ZYQi9HaUhxQXlVT1hp?=
 =?utf-8?B?Q0JrYVZFVkwyTVY0a3ZZbmNCTlJlTTVjNHNtakFLOENaME1USnZwUWlnYVpY?=
 =?utf-8?B?d040WWZsQmxrZTgxVG9qNXpINHBaOUxsZzBTMTRZNWpzUUhOTW13K3U4UzB5?=
 =?utf-8?B?OXQveEhyRlNDeEVIaDdnbHYrTnVPdk91YmQrU0RZNkhuS2FMcStUY2RVMXFh?=
 =?utf-8?B?Q2VwWnpEVjE3YlJDMXk1QUxQdUdSVE11dEtIYUlnbXRlRGxpRE5LK3VRVyt1?=
 =?utf-8?B?N0JqaURXNklSRFF1T0RTcU13ZXltQVdPTTBOcUdyQ1M2WVNrY2krczVwRGhJ?=
 =?utf-8?B?QTg0aFpzMHlNeUxndGNzMm9PcVpNOFJDc1RrRThZMERPN1dKSWVSUVQvNS9E?=
 =?utf-8?B?bitJeHVZa0h5WGNhYTlMKyt6T1ZmcUV3Nmh3ZXJPNXlRd2FqT2xmUndESnZv?=
 =?utf-8?B?RUtoc2xDcHZjQUJaU2NmQ0JnTGVQQ0l6TkJxalkvTnBUdmVSVzhNMjJYOXNh?=
 =?utf-8?B?WFFPQWlrMWVnYlNzSFBUY2E5eStaL3E4QUxWTmE3NWdSVWl2N1JzTnhzTk9W?=
 =?utf-8?B?V3lGSWZ3L0hreDBJekVLOXJnSXFaemw1akM4cE5vVnVMZjd3bGIvTGUxbk9x?=
 =?utf-8?B?S2NmcEtHampTaHZjUmZnZUlmMVhkQU4vWUovcFh0bzQ1a2QwdWxrR1NqT0JJ?=
 =?utf-8?B?NXYvTXlZeS8vZ3lONXV5ZkNzblIzeWh6UlkvWndmM09FaUZrNjNPOGltM2Fa?=
 =?utf-8?B?UnNtNGt4SWJLSG5TSVhkSmIwdTJtUzFiVnEvaEpUcllTNmpERWlva1lIdVJa?=
 =?utf-8?B?b1kyeGRUdU5UL0FjSndMYjdHK0tyODhEZXBJQUxCVU4xZ0RmemhVQkVvZ2Yr?=
 =?utf-8?B?YmtxN0dXNjBmSkh3V0F6bUZ2K1ZqN1BuWnNqMEM0RWxRV1MraWdLcW5LWm1z?=
 =?utf-8?B?cGxiam9lb0NYcjYvS2JKdUxBVG85bWdJRXdlZjRza2hZbFRPR1R2Z0VseEk2?=
 =?utf-8?B?S3lpNGpyOWJoMThKVGo2STdNdEZ0VG1aVWpoWlBsQXRHTys5RzM4dU10Z1NN?=
 =?utf-8?B?S1ByWUFzM3BIWHl0K25CaW1tMGpFZ0gxQk5DSVlzdlhaeHBUMHBneUNndGgv?=
 =?utf-8?B?WXpDYTJEVHd5dkwvYVNOS05lblRWV28vbWQ2UlF3YzVIKzBXN2dyZkZwU3RN?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c3f8233-11f0-44ec-4648-08dc2428abbe
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 19:53:48.0083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ezNGa6EzT+D03pQWWhdZ/1LLes/8Ws+SavIa1ALe5Gk+uqYTkMUdts+liBYcL0RT2IMrdJRRVHGQShcpk4XfWUDjgc84o7Yl5+zmb+Ml9HQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4725
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

On 2/2/2024 11:35, Lucas De Marchi wrote:
> On Fri, Feb 02, 2024 at 10:51:36AM -0800, John Harrison wrote:
>> On 2/2/2024 08:53, Lucas De Marchi wrote:
>>> On Thu, Feb 01, 2024 at 11:30:47PM -0800, John.C.Harrison@Intel.com 
>>> wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> Update to the latest GuC release including the first release for LNL.
>>>> Also include the patch version in the expectation check as it can be
>>>> important.
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> For CI to be able to test this series you have to do:
>>>
>>> a) be on top of drm-tip, not drm-xe-next
>> Is this instruction special for this particular patch set because of 
>> the for-ci conflict? The wiki page is definitely still saying to base 
>
> If you're talking about our internal documentation, it's
> outdated since drm-xe-next got merged upstream. Documentation for
> drm-xe-next is now maintained upstream as part of drm-tip too.
It would be useful if the internal doc could be updated to reflect this 
change. You can't really complain at people when they are correctly 
following instructions!


>
>> patches on drm-xe-next from fdo:/drm/xe/kernel.git.
>
> patches targeting xe are *merged* through drm-xe-next. Usually. And it
> usually applies fine if you are on top of drm-tip or drm-xe-next, but
> not in this case as we have the topic branch that conflicts.
>
> Since when we got merged, drm-xe-next is "just one more branch" that
> forms drm-tip:
>
> https://drm.pages.freedesktop.org/maintainer-tools/drm-xe.html
>
> and drm-tip, as an integration branch, is the merge of all its component
> branches that is done on every push to any component branch.
I am aware of how drm-tip is constructed. I just being confused by the 
conflicting documentation.

>
>>
>> Is there an Xe specific repo for an Xe specific drm-tip? Or are you 
>> meaning the genuine drm-tip from fdo:/drm-tip?
>
> not sure I understand the question, but I meant the one and only
> drm-tip as per doc above.
Okay. That's what I meant. I just wasn't sure if there was some new, Xe 
specific version of that entire process alongside the regular one. As I 
said, the internal doc describes a very Xe specific process so it is 
confusing as to how much is Xe only versus how much is now just regular drm.

John.


>
> Lucas De Marchi

