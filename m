Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D857DC4828F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Feb 2024 18:34:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC4110E5CA;
	Wed,  7 Feb 2024 18:34:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MWHRm4hS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5495510E5CA
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Feb 2024 18:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707330855; x=1738866855;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9zC7Rcn7QAJShJFZ2fdgEl+wp1wD76L25LwyekL4ZFc=;
 b=MWHRm4hSz+/I2466ZVwovfxl/OHHFsW/HaVgFsuWt6BtZQOoKAud96h6
 UQ0v7nFYYEuDpScdHykEDjcfIaDNeRZtxLSpyoImuji4I/CMYYrBzE+2Z
 UkpfiVhwJfEom+zyWDExKNcl4GNNL1XUPVlDKwxNeDyBU3TjWm5HYLOqE
 GNaqeg5tYcXLAW6u9ZhRCH9yGuSmqL1sXLp1oEzVzc1qsbElD+0nsvAyu
 3ph27JaZm6u7MjUdOYNfWA45Bf6uZLQ3shR/bxCpyXyNiGprZW69OehOm
 omAr3UTwsKR/vtprAyukTSYHqIT4dRcVpASj8qjs4TxE5h0OsFdPKtjGq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="12410683"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; d="scan'208";a="12410683"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 10:34:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="6026827"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2024 10:34:12 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 10:34:11 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 10:34:11 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 7 Feb 2024 10:34:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKtl+fszJ0LcixELZ4jXmaPBh634UDx833W57ATXDgDMixzPFKu+XKKS7rufPPA3WGaB0eBwXc1rNmAaLK2Yl2tBhtW7RCz+YjZFNB7RhofVXbunuC1bEO0+O193eQXFqcMOb69NdhyHH0FQ7u8DtHWbW6+e1lDk/E2bX3ytfYinOsyMLtnmxWithouLVDZEAv+9NDcsuKgYz6DxrN5eu0SmMTZmR4Q4y182fkFdpSSiRg2UnpWzGNckbO2nKQYvhZ7njX/09j0kfcSN985d1/rpaRm7pi/GIKNlhe3q901iEYTBeIuPnpqOUkyndTnMNOnTbAumh63cwYhH7t/DOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bHugLNJMSFaONsjKQ0X6npSgSuKpM2LJLY/MXk3ae8=;
 b=MZNKISPCfeRO8nRO2pokrASsEOiN2pK+LZ2ExGR/b7NeChtpg963agYyVl7FBS5S32FXlnH8q/K9PLWYhm7PCxvO33uQdwkGZrjNgpYbi0BJSaqNnB0XVmpMhF7A0hRpuMWF3eo3mXNnZKKt331IL7VCb1cLDB6BJLE6BQwYAPtUEOXs8HtNks8LRE3gz98hSB15x49pl6wGhanO42zDqzcXW9ntRUrpJknQWe8yn7KHr+vRBNkPT0NPBaJHBkL8JrVWAEVL1JUGAtqIIy0lhJ0hoK/+yKJoLf/YudQfG5sZb27T4/LJxXY+ykk+M5DyEGx4bnXBftNdK86gSYQcnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 18:34:08 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::c138:faf0:9fa7:8a03]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::c138:faf0:9fa7:8a03%7]) with mapi id 15.20.7249.035; Wed, 7 Feb 2024
 18:34:08 +0000
Message-ID: <6d27be6f-f501-4bba-a8f9-ae80f23484bd@intel.com>
Date: Wed, 7 Feb 2024 10:34:07 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm/xe/guc: Don't support GuC older GuC 70.x releases
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
CC: John Harrison <john.c.harrison@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Gustavo Sousa
 <gustavo.sousa@intel.com>
References: <20240206234103.373364-1-daniele.ceraolospurio@intel.com>
 <bbb3bc27-73cd-47e4-bdb2-8a12e8aaf2ca@intel.com>
 <ZcL5c1TTfCxUckCi@DUT025-TGLU.fm.intel.com>
 <zcvxg35dgst3vffu76v532dhl5lob6ilpi3hktg4ptnqc6lsbd@dsrjrmgk2kdj>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <zcvxg35dgst3vffu76v532dhl5lob6ilpi3hktg4ptnqc6lsbd@dsrjrmgk2kdj>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0066.prod.exchangelabs.com (2603:10b6:a03:94::43)
 To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CH3PR11MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: b7d3a2fc-43bb-4e9a-db7f-08dc280b5efb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QolF6/BScoHKnfsr6pl6uASaTpg4PyL1AwfPHvr0vq5fgyPIPq1oEQvioZw0lX6BLBs596Zvia20V3TwFmWTtIc/ZmT4uRBMrhdTMKjsxfWayo+cYj3CyiT1qWM0MpkZpq3wG+FN6lYN8z6L6c156OKu4M75e5NG2ka34dgM4vEj6yNJ1CqqQXDplDcBVU26kX2zaYZtIJHmw0qFkxjazg9UV4XZOewLDfbxCMERwyB3Houchn+Se8bEaQwdW4iKFfrHCeHItvXqBsvsnSmt4DwfAtqVvgge58C8getoUwjXKu96hTLwVW/4Zi4lHBY7lo1UJTzJsKnT3B3WfzZG0eduzRd6/O3u/eUJ9VizNNPU5ZRfXlSQ4Piw81r8uaQydXrRe2g7oREsqwfQ+C22AZkwrbB5K/eQjCpi9PZdxCMktE5CFbkUxEw1TlteBXfTFNBraKPjmmb4xKobYXEwGsyLiL3bd9vSDVYPh24sxqCiiIFMtWc2a0zdSIw/LZREX57zywfdYWeeTXv8zE+pnnar1yKbUcWcQtIumHi80PfUNfJf+GH7e5z7hkthkT1Fu5K+sMw5pKQl/hiR7ldjvJ/sVxpqDasiG8AHiaOppdE2C+VLL4PRAmIwmyY6bsbc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(396003)(346002)(39860400002)(230922051799003)(230273577357003)(64100799003)(186009)(1800799012)(451199024)(2906002)(31686004)(5660300002)(66899024)(6512007)(86362001)(31696002)(83380400001)(107886003)(2616005)(6636002)(53546011)(54906003)(36756003)(110136005)(8936002)(966005)(41300700001)(478600001)(6486002)(38100700002)(66946007)(316002)(82960400001)(6506007)(8676002)(4326008)(26005)(66476007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VU5lWGo5dVFEcXBHTjBaemNPdmpDd1N3cG9XVFc2MVRqa205WkgrSE1SK29G?=
 =?utf-8?B?MzMrZVdQSWlDQXpSNGUzUkhqSWRqcXFJc2lubXRwU2h0bTN3cXczek1uSHo4?=
 =?utf-8?B?RVdwemtEaTc1S1Q4cUszTHdaeXlZMUZqT3J0R2JWbFQrYktYZ0p0dk1kNmpp?=
 =?utf-8?B?dk4yWnl2QlB3bGhoemZ4QXMwL1ZqTUl4VGVNdnJwdHVwTlNUSjIrVW5YWmZn?=
 =?utf-8?B?UVAwdC93SEVLVDdublpFdzBUdVhJdWR6S3J4bDErZHk0VnhISXdFWThneGJM?=
 =?utf-8?B?bXVvRElpcjhpVk93N2FVRWNadWkzTzRreTVZSVhBOXYra1pYMTlEME1pMjVX?=
 =?utf-8?B?b0tMVkk5enM4UVUyeHVmSGVpTzVscFRYYm0xU2E2dHVaWDhqaXg2WHVoUnVl?=
 =?utf-8?B?VE9iNnh1WUFuTTZIRUNPRExHV3E3L0FtSFB6ZUJBeEJ3NklINnZaTGcvUGxa?=
 =?utf-8?B?K2VydVNQRjZDTzhVSWp0ZVozWkZKZy9GNTc4eTM0MkFjM3d0eDNxOUwvblVk?=
 =?utf-8?B?S0QwL2tISXVieVFwTzhISGYrdUEwNnJYOEVJbzYrNDM4Vy9aZGxhY24wMmd2?=
 =?utf-8?B?SzFHNmxkNlNtTjdZcDRGUXpOeTQvZWM0M2xVcUVwZ0cvVzlwZFpzZUYwWmo5?=
 =?utf-8?B?U3hLSjdYMzROcXUzM2tmVzNoMC93TnVvdTNnUHVhc1dRaGxJZVdxK3hxdERK?=
 =?utf-8?B?TU1TREoyeHFuTzFvcTF0QmVURGY2amtTZHdnOFBvSC9RQXFWWWpuSExqZjYr?=
 =?utf-8?B?UXFQL2xzbWVFcHlGNjZtKzhxUmVHdXc4eVNNeHVwVFY3d0M5WlVUWXdBT2I5?=
 =?utf-8?B?bGI5V1BGVFZZRlQ2R2tjTGJjL1NQVTdKV1l0RWkrT3pLaThKbEJheWNXdnMw?=
 =?utf-8?B?cVVhS2JUcmVVb21nbklJRlRxQ1Q5V3FWZ3JSckRJRFlUMDJoK3JXRUwyMDZO?=
 =?utf-8?B?WFhKWDRUNDdQUzh2U0x6Qy9ZL0JDUDZ0ZlduaXdRQ242aDU4VHoyc050eFhq?=
 =?utf-8?B?SlFNU0dyZzFpNndSQS9yVG4vRDhYK0w0V3c4b1Ewd3JQQndXNGxQd1FzUjJv?=
 =?utf-8?B?RjQ2RE53QWtHN3VwTkUyWnZDc3FzUzU1V0t0d2ZMc1lqWGtOUUxyMnhvVy9v?=
 =?utf-8?B?YUM5b0VBcWNpM2NJdUFnQlBLa0VkTHVBWm9JTy9HQnJwY1ZNYzdXZStMemtW?=
 =?utf-8?B?Z1ljbFJpQVEzeTJsVnhHRVp6TE5XWkRLT1BSUEc4cW41dHc4czhCYjJmeDU4?=
 =?utf-8?B?Q2RmSXNvSjZhdDhXWkdzVjVwWTJ4Zjh0ZTFiNU5mK296SktXQSsvMUQ2QzNj?=
 =?utf-8?B?UHVGZkxZdEl1bFBQWUNMQjVGMDVqbXNRUmltUnpWYkRWeHRaUFl5Q0lia1Jq?=
 =?utf-8?B?aE8vam1qYUx1cldPWjN4azdzNWRnbldWYXBpNFp3MjBaeFNjWktVOHJTT0pP?=
 =?utf-8?B?VFA3RTV5MHkyT0pZTWFFK0QzVy9janVCcUMzSUs4ZXJ3UVh0NWR3S1FnTDF2?=
 =?utf-8?B?SFY1Q1JBSWR1YWFsbFdaZHhzMXR5WXF1WWoyMDFMbC9FL00wVjJLTHR2cVZ1?=
 =?utf-8?B?aFZENW9TQTYyVjk5OVZDK0pyd0FrV1hUckYxc2ZOMUkzWFRXR25tcU02SFFG?=
 =?utf-8?B?djBiRVRnQ1NycHBmeFBxK21NTElMNWg4NExZRGNIUHhEY1d1Ukp5djdneUpT?=
 =?utf-8?B?aStBdU85dmo2Tmo3RFh1N2FoK0R5Z2VxMTZqcFdxNUpBTm9qeStTL1ZLUjky?=
 =?utf-8?B?TXBjdlluQWJHNkMzR3JCa2FrcGFzUEo4Yy9BOGZTeUJtc2g2Z1NncldsT3Zi?=
 =?utf-8?B?VzVjL3o5WnpSR1BrRVJPM2oxWkIzbUNiN2xaNzI4TjhHN04zZXVJNVdmY1RS?=
 =?utf-8?B?VjBNc09tWFQ2a21PQjRXUXRYeVZyYkRsWTVnTmhudmd3a1p1UFpxZFRBZEpv?=
 =?utf-8?B?VXlSYTNBRjg5V3JDbFVnamRDaFVEeCtDTlFEUk1CakJ1ZC84VlExTkV5REZh?=
 =?utf-8?B?TFVtV1c3UWJUZUIvcThBYWRDdVNIVGRGaHo0Q1c3UnVLRzdwUDNPWmV0eEVT?=
 =?utf-8?B?bDVkakUwcFpwaWhQM2h0TGJNSXdEeDhCYW1PelEwOEFSMFdGZ1pJeXRSakhr?=
 =?utf-8?B?UG5ma3NlSHNSZmdYMVcvQi8xdVB0bWwrdFpnYyt5c0VqYkJ1Ykx1czZlNU51?=
 =?utf-8?Q?6PTOEEV40P75VsdYzbzq+Po=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d3a2fc-43bb-4e9a-db7f-08dc280b5efb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 18:34:08.4426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EETVLYqrDjCx7ZOPpM2FY0+EV9Y5Z85zI20IKltRov18AJLt5pkIrpDibkWSGz37upnbRivHur97iKFvAxYYh236ZLN4fhhWYe6Kk2ERdOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8660
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



On 2/7/2024 8:42 AM, Lucas De Marchi wrote:
> +Gustavo who is dealing with DMC firmware lately
>
> On Wed, Feb 07, 2024 at 03:30:59AM +0000, Matthew Brost wrote:
>> On Tue, Feb 06, 2024 at 05:18:50PM -0800, John Harrison wrote:
>>> On 2/6/2024 15:41, Daniele Ceraolo Spurio wrote:
>>> > Supporting older GuC versions comes with baggage, both on the coding
>>> > side (due to interfaces only being available from a certain version
>>> > onwards) and on the testing side (due to having to make sure the 
>>> driver
>>> > works as expected with older GuCs).
>>> > Since all of our Xe platform are still under force probe, we haven't
>>> > committed to support any specific GuC version and we therefore don't
>>> > need to support the older once, which means that we can force a 
>>> bottom
>>> > limit to what GuC we accept. This allows us to remove any conditional
>>> > statements based on older GuC versions and also to approach newer
>>> > additions knowing that we'll never attempt to load something older
>>> > than our minimum requirement.
>>> >
>>> > RFC: this patch sets the minimum to the current GuC version (70.19),
>>> > but that can be moved one way or the other. The main aim here is
>>> Ideally, this would be bumped every time we update Xe to a newer 
>>> firmware
>>> version right up to the point when force probe is lifted. At that 
>>> point it
>>> becomes fixed and we have to add the version check support back in for
>>> future w/a's and features.
>>>
>>> Get's my vote :).
>
> Yeah, but see my other reply... I think we will have to wait the
> firmware being available in linux-firmware for that.
>
> Also, let's kickstart a discussion on our process with some
> possible changes so we can get it documented. I think we have a good
> opportunity here to start adopting the
> https://gitlab.freedesktop.org/drm/firmware repo.
>
> Rough idea:
>
> 1) use intel-staging branch with tags for pull requests to
>    linux-firmware, just like documented in their readme.
>    IMO the naming is rather unfortunate since it would be
>    good to use it for (2) below.... but since it's already used
>    we can use something else.
>
>    this would mainly replace the use we have today for
>    https://cgit.freedesktop.org/drm/drm-firmware/ ,    which could be 
> retired. From  upstream linux-firmware pov the only
>    change would be the remote location and that we start using tags
>    for the pull requests, coming from a single branch regardless of
>    the firmware (guc, huc, dmc, gsc): intel-staging. Once accepted in
>    linux-firmware, the branch is fast-forwarded.

I think this needs a bit more fleshing out, because before we do a pull 
request, we do want to run CI on the blobs. Also, in several occasions 
we went through a couple of versions before we closed on what to push to 
linux-firmware (e.g. in the latest push we started with 70.19.1 but then 
pushed 70.19.2), so we can't go to intel-staging until we're actually 
ready to push. I think the process you have below for mmp blobs should 
work for this early testing flow as well, but we might end up with a lot 
of noise in the staging-intel-for-CI branch.

We also need some rules to handle the case where there is already a PR 
in flight and we need to push some more blobs. This might be as easy as 
the committer seeing that there are commits on top of master, replying 
to the previous PR to deprecate it, and then generating a new PR with 
all the blobs.


>
> 2) mmp firmware versions are only ever pushed to a separate 
> staging-intel-for-CI
>    branch. There is no pull request in the mailing for this. We can 
> either
>    push directly to the branch or create MRs in gitlab. CI would start
>    using this branch for the extra firmware for platforms instead of
>    whatever it's using today to process the pull requests from the
>    mailing list.  Or whatever it's using, because I don't know and don't
>    see it documented anywhere.

As long as the CI team is ok with this, I'm all for it.

>
>    The patch on the kernel side to use the mmp firmware is only ever
>    pushed to the topic/xe-for-CI branch since a) the firmware is 
> coming from
>    a non-official location and b) end users and distro packaging
>    shouldn't see a warning when building the kernel due to a possibly
>    missing firmware
> 3) Raising firmware version requirement for past platforms used as
>    SDV can be done **unless** it raises the major version. That's because
>    end users would start seeing the warning that we avoided in (2).

Who are the end users here? If we're talking about older non-officially 
supported platforms, the only users should be developers and they should 
be able to handle having to update the firmwares to a newer major versions.

Daniele

>
> thoughts?
>
> Lucas De Marchi
>
>>>
>>
>> Mine too.
>>
>> With that:
>> Acked-by: Matthew Brost <matthew.brost@intel.com>
>>
>>> John.
>>>
>>> > agreeing to stop supporting very old GuC releases on the newer 
>>> driver.
>>> >
>>> > Signed-off-by: Daniele Ceraolo Spurio 
>>> <daniele.ceraolospurio@intel.com>
>>> > Cc: John Harrison <John.C.Harrison@Intel.com>
>>> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> > Cc: Matt Roper <matthew.d.roper@intel.com>
>>> > Cc: Matthew Brost <matthew.brost@intel.com>
>>> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> > ---
>>> >   drivers/gpu/drm/xe/xe_guc.c   | 14 ++------------
>>> >   drivers/gpu/drm/xe/xe_uc_fw.c | 36 
>>> ++++++++++++++---------------------
>>> >   2 files changed, 16 insertions(+), 34 deletions(-)
>>> >
>>> > diff --git a/drivers/gpu/drm/xe/xe_guc.c 
>>> b/drivers/gpu/drm/xe/xe_guc.c
>>> > index 868208a39829..5e6b27aac495 100644
>>> > --- a/drivers/gpu/drm/xe/xe_guc.c
>>> > +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> > @@ -132,15 +132,10 @@ static u32 guc_ctl_ads_flags(struct xe_guc 
>>> *guc)
>>> >       return flags;
>>> >   }
>>> > -#define GUC_VER(maj, min, pat)    (((maj) << 16) | ((min) << 8) | 
>>> (pat))
>>> > -
>>> >   static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>> >   {
>>> >       struct xe_device *xe = guc_to_xe(guc);
>>> >       struct xe_gt *gt = guc_to_gt(guc);
>>> > -    struct xe_uc_fw *uc_fw = &guc->fw;
>>> > -    struct xe_uc_fw_version *version = 
>>> &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>>> > -
>>> >       u32 flags = 0;
>>> >       if (XE_WA(gt, 22012773006))
>>> > @@ -170,13 +165,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>> >       if (XE_WA(gt, 1509372804))
>>> >           flags |= GUC_WA_RENDER_RST_RC6_EXIT;
>>> > -    if (XE_WA(gt, 14018913170)) {
>>> > -        if (GUC_VER(version->major, version->minor, 
>>> version->patch) >= GUC_VER(70, 7, 0))
>>> > -            flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>>> > -        else
>>> > -            drm_dbg(&xe->drm, "Skip WA 14018913170: GUC version 
>>> expected >= 70.7.0, found %u.%u.%u\n",
>>> > -                version->major, version->minor, version->patch);
>>> > -    }
>>> > +    if (XE_WA(gt, 14018913170))
>>> > +        flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>>> >       return flags;
>>> >   }
>>> > diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>>> > index 4714f2c8d2ba..e5bf59616f3d 100644
>>> > --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>> > +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>> > @@ -296,36 +296,28 @@ static void uc_fw_fini(struct drm_device 
>>> *drm, void *arg)
>>> >       xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_SELECTED);
>>> >   }
>>> > -static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct 
>>> uc_css_header *css)
>>> > +static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct 
>>> uc_css_header *css)
>>> >   {
>>> >       struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>>> >       struct xe_uc_fw_version *release = 
>>> &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>>> >       struct xe_uc_fw_version *compatibility = 
>>> &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
>>> >       xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
>>> > -    xe_gt_assert(gt, release->major >= 70);
>>> > -
>>> > -    if (release->major > 70 || release->minor >= 6) {
>>> > -        /* v70.6.0 adds CSS header support */
>>> > -        compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
>>> > -                         css->submission_version);
>>> > -        compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>>> > -                         css->submission_version);
>>> > -        compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
>>> > -                         css->submission_version);
>>> > -    } else if (release->minor >= 3) {
>>> > -        /* v70.3.0 introduced v1.1.0 */
>>> > -        compatibility->major = 1;
>>> > -        compatibility->minor = 1;
>>> > -        compatibility->patch = 0;
>>> > -    } else {
>>> > -        /* v70.0.0 introduced v1.0.0 */
>>> > -        compatibility->major = 1;
>>> > -        compatibility->minor = 0;
>>> > -        compatibility->patch = 0;
>>> > +
>>> > +    /* We don't support GuC releases older than 70.19 */
>>> > +    if (release->major < 70 || (release->major == 70 && 
>>> release->minor < 19)) {
>>> > +        xe_gt_err(gt, "Unsupported GuC v%u.%u! v70.19 or newer is 
>>> required\n",
>>> > +              release->major, release->minor);
>>> > +        return -EINVAL;
>>> >       }
>>> > +    compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, 
>>> css->submission_version);
>>> > +    compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, 
>>> css->submission_version);
>>> > +    compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, 
>>> css->submission_version);
>>> > +
>>> >       uc_fw->private_data_size = css->private_data_size;
>>> > +
>>> > +    return 0;
>>> >   }
>>> >   int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
>>> > @@ -424,7 +416,7 @@ static int parse_css_header(struct xe_uc_fw 
>>> *uc_fw, const void *fw_data, size_t
>>> >       release->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, 
>>> css->sw_version);
>>> >       if (uc_fw->type == XE_UC_FW_TYPE_GUC)
>>> > -        guc_read_css_info(uc_fw, css);
>>> > +        return guc_read_css_info(uc_fw, css);
>>> >       return 0;
>>> >   }
>>>

