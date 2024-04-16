Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83A8C04FF9
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 13:51:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F92D10F0C8;
	Tue, 16 Apr 2024 13:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nRHA6chW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DEE710F0C8
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 13:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713275502; x=1744811502;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EAHhck3yfpbYTqHz1Kif4mxpnEeC1NRFqa65QL0+lVc=;
 b=nRHA6chW0cPoBi02gNeoNI0k3kHYBxqsCqyLfoWoDJKlLDheuUcKxeEu
 5EwJta8hrO+5zudzDKZGUQkk1ZxUYoBUUv7k9ziA4yrJevMhe1mR3u8Eh
 jAA2Q3Yi1bVqfX6tEA0nT53TnjqdJ5avMQLmgC+mOMlFOvs3V4kzb/Jq1
 AXofAvfD75AQ4+npsB1a6VGFqq7B58lV7iudshEZzStzCTUhSCT+kp+4a
 YyOA2JOV5v3l/p0N3e/rG7HuSDsi3ql/e/xYLO2p/uIcd2SlFjL8C9WN8
 x/jFafqNTTmHtQUCUCUCOx5CB1/MU74+DAKqCrSbKjE5+ffND38vp4UXR Q==;
X-CSE-ConnectionGUID: 6t77DrQnR0e1a6K80rBifA==
X-CSE-MsgGUID: zrHeR3gTTOersb+5ghweww==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8575191"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8575191"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:51:41 -0700
X-CSE-ConnectionGUID: 7MDSLz8VQ9CxIZVL4MhBIw==
X-CSE-MsgGUID: bdod4aPqQt6hCRbcnX5/tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="22312143"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 06:51:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 06:51:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 06:51:41 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 06:51:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/Kg5hq693rf/GF3ivSYmkA4z0Db7sz5iaQWGg9I+nEk/essYkZCx3FP4YmwpoTiHlL+ECMBLtEhWfTBdZ0BLtcIgQ8kzIcP7N2KlY8v+QF0mZTeLMUcOlqqQ6AfPsiR88cCOmBB3xd8do5/krNeF9sCuvVpR4aHA/cmeI2mzNKgd4Gl4HNrRVfO0tuNGM/WPsZXnHTPVGggTSwSpNloWtUcIL9BGQ7pbyi5B01yJMRneCI0B70pJErEmdT8zMNvbuKKuRI2cpjYWKox1xyofpaCYQQEu7kHMyBJL5R8q5GDjPpZVmNNjic+Pi3Bm+QFZF85S7UEcS444cNjB8qEgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/XZFqdEf9bY+kGlMrS6FZEf10Wb4dd5K/86DTs+Xuk=;
 b=JL41rM/XKvGd/ThsUz+R9qdXL3n51hbtWXKuf+61Nho3pDChyj5cP5izMFxCXfySDclhB0ZahJurkh42kyeKTrjlJxe2iB5cov02yKwyDin54vHYlUJ8fElz+tqAkiPAHfQqTkPJ+tnao8NMocxk+5AX1wciJpIYnPRgoOmQR6aZ1g87AHqyQQzVYf2+lnAhevV5p1jc+ECB3CIZMX4JiIUC8RaOx9fPat/1viYnKVtAtm+kOlhXjCw49FI8O5tZHahFK1gUpOO4t/7YrvWrFIbPUvUvQoDepdNDLAfI7+vu+mqtfty4fWl9bODDFKSSV3Qelu/N97T4QlwvTbnuWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5201.namprd11.prod.outlook.com (2603:10b6:303:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31; Tue, 16 Apr
 2024 13:51:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 13:51:38 +0000
Date: Tue, 16 Apr 2024 08:51:35 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 0/7] drm/xe: Per client usage
Message-ID: <foccqtfvgz65tg6yoar5tsqjo4bndmftgwlsm3vujjjdin2wts@7cc3m4fcapyb>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
 <f2c46934-e137-419d-ba34-cff864a988ce@ursulin.net>
 <zj3ccdsxwfv7yms67c2fycjfhevdzp3qy7yz6u6ffmv4aymo6n@5lu4otfylkbt>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <zj3ccdsxwfv7yms67c2fycjfhevdzp3qy7yz6u6ffmv4aymo6n@5lu4otfylkbt>
X-ClientProxiedBy: SJ0PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5201:EE_
X-MS-Office365-Filtering-Correlation-Id: 381a5fcd-d4bf-4d63-b1af-08dc5e1c5661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Df8lsVDVKjqMhjszWu5Ki0iQ/Qhboay4nekrdXru77GYTlwdTM0WrDtJpjc7l203+lcXW6EDMbNTxCA1Rf9SfckmJwmDiXhbi+/GKKK3eK/SIrhC+K3mqP2N0+qoXT7zQzFPt0Xv52mdss1JM1k6GI2zLtAEWRG5ZvXgWmoY2ZDWGxRKhhxJNoCUql55lfaJLZBK+skMAWsPDxva93U2/ZUJhKnuGcY7zUD2B/UUrSSFQFabK4z4A1HW8Rxx9Sz6/ne0jZSza/MTpjoMw+wMXMpUopUL83DOoDadrPn99/P7FO5JduL2J7k1qhSUX8LVm4V2OD8gdKgElhwLhbIqq/Svo5s3cF1Mj6+nJeUVr3nPWcGgQaR7KHp26L2BL52DETfSMXgoA5V4nFcz4QBXxmkHvEjedXNwyEZGj3ebVQSSISssEdLeU+iZ3Qo0uWhPKRtZYAzhNQxzbQQs+VVlxwt5GSoRCuuyMmZSZ6DCXykBWwJijMlUfTARI4nNGade4Ulp5jltNTxZk57eIXopZLdK+E+UqcWSB3hnNHpMxEug4AD6WhZQ7pcMMLJGqD+tSxM56fRbOBNGWCFGHKfmEYtT1y0wdXEbZYLGvUa9FIFr6PkXp/MTDkJI1Y/LROuSbJqx9bGz+wXZUNRnquBlCcS3ZFcyXR/yrFiixSv77k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O5vuz7lqxyW1WGi6SWM77etNq0xeL3k+ighXYUO6abP8DtuYOQwMifOWhNwy?=
 =?us-ascii?Q?zE9DB/Kp2nqhg3VhSm22B9xJTu3r0lkA7WPparv8v668K0MS9Ev3EyMs4n+T?=
 =?us-ascii?Q?BNWhFeE6IYYcRg6Y8iWqf9QS1zxsK7HRvlcyx8iWaK+NKBiAqEUsol49chpl?=
 =?us-ascii?Q?AlBXj4atrwIiBWU0jOpEAdZdjPo8WO3+BWTKEeFai/8vGmUuUIKtlb5Z+GpT?=
 =?us-ascii?Q?MqQs4dOdsDvv1qk9hwLhzj0Yre56XWuuDblgnk62Fo29hjwhZk+A+uPgPwxk?=
 =?us-ascii?Q?b/rmyoGDRgN3wjo4shkN8IN7HUUjHiXpi89fIjGvKmS14TN0oXQYhPOR2qFL?=
 =?us-ascii?Q?GdkOXGoxrVTTQ6iQjxC7FiDYtMjV9TIc13j/h2vOr2Rs4ZWC3MnB8bCLi2DU?=
 =?us-ascii?Q?mG1RfvOo1Vr7ioKPVnZubCTZ9an4fBR9bEYvKpsaCfv45i7YudQMvt4e6ovE?=
 =?us-ascii?Q?LUdNusocoLZP2lpqSbZhmMdyGgAOmNITiDs+7We5j0PVmgpMhOInaAVczm3E?=
 =?us-ascii?Q?M52g2HU6eSffBkCHTyJHivI9G8RXEkNKxuygaZvAcIWTZ2SRsrQt7UPdT+yI?=
 =?us-ascii?Q?I1FkZwzbmlSdE9UIjExQVCHINsKDBvcMpzA4B1wg4zxKOLAiDLmicYR559h4?=
 =?us-ascii?Q?1vr91abQqLwkLqq1wztHizW0Pdw/kDf3rPZ6PjfhHXyctPF5J6sNUJdKxudo?=
 =?us-ascii?Q?gPs/xkjWb83FjkOorge+5o/Y4XwW9OxLHuq992yNwuLCwul7abXlKCCwzlFv?=
 =?us-ascii?Q?nSbhAzNPOX4UdyPmdryT8r47LHoBYCUmyPPqt98+t6N1e82XmS1oPpZhkmoI?=
 =?us-ascii?Q?zec5LAM209H0PZyRXO9tgdj0QBQy0zyBNJjBlkutKBbmU69qdOHgD6AanhnK?=
 =?us-ascii?Q?OSW1P9JQRMdcaDl+LVx8hcXS6SVDQH/Or+ScKRJbZ9QWRdleAOWBWuAO3LuR?=
 =?us-ascii?Q?F+yaCJubYrde3udKHImZ+VRedJVibnMPkfcFsDvH3mUs6QLy/gRl4uW8rhcG?=
 =?us-ascii?Q?fCjXcLFCTkLgljEm3ftLfr9M5+mXqY+I5hRfxpar5cE6iQJAsqVEVlZPEz4t?=
 =?us-ascii?Q?I/LQASVr7zbBCBwHf6Db/AtuHzgdctMhEnMOcsAOWJiv4HxE5bEp+DsatwnO?=
 =?us-ascii?Q?tROEyqmBEapu4mJGaQvrppMpgBkD9mH1Q/YFWL0CYp1NDLrES+RMAy8f3Ukw?=
 =?us-ascii?Q?lSAVWtcTd//2b8VvesFFxloF1PC+scebXq3bSnx8snsghkuO8sQUXyQm/512?=
 =?us-ascii?Q?k9GZE1esWMSDPLYtbGaSp2GhvyU6GRvFL/JMXSajmRfTODy+lLlUYA86IP6g?=
 =?us-ascii?Q?diH6wZata3CxC1bc6elt0V7a3IqUVPZzl61NNsGxiUsQDsyho150tmhYfNkg?=
 =?us-ascii?Q?NMfn0AhAzW7OJsY34Nfo5ddFRYbXnz0zYHBi0x4KRoKjAnXte6e94rByXwe4?=
 =?us-ascii?Q?rq+ogoa8tm+C89vQwf/DCMgNaVMeXG4sGcvaIbErNAmeAe6LTUWEUoZ8RTpa?=
 =?us-ascii?Q?aRJY/aDLqgOjzBvhmZUni3KkiS1NL2/6XeDpUG6FHc93dDQNktgjxlR1CfA3?=
 =?us-ascii?Q?dAsf9pgAAvPkiIpB4zoGYx1oFruCIb82Pc+KNV0usDkp/kH7qY/LLaAXMHUQ?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 381a5fcd-d4bf-4d63-b1af-08dc5e1c5661
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 13:51:38.2425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E0uygzGxhzwinz2gYIuXsVO9pW24oV1eOiYdhgvgSG95IPLtukVyFo886J2BU+I83Ek+ikEDC8eftfxFHb7TTsZk3VdqFJmY13h7ynv0dGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5201
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

Forgot to Cc Michal, doing now.

Lucas De Marchi

On Tue, Apr 16, 2024 at 08:30:33AM -0500, Lucas De Marchi wrote:
>On Tue, Apr 16, 2024 at 09:37:44AM +0100, Tvrtko Ursulin wrote:
>>
>>On 16/04/2024 04:04, Lucas De Marchi wrote:
>>>Add per-client usage statistics to xe. This ports xe to use the common
>>>method in drm to export the usage to userspace per client (where 1
>>>client == 1 drm fd open).
>>>
>>>However insted of using the current format, this creates a new one with
>>>the unit "ticks". The intention here is not to mix the GPU clock domain
>>>with the CPU clock. It allows to cover a few more use cases without
>>>extra complications.
>>>
>>>Last patch was a quick implemenation of a gputop-like tool in python.
>>>I ended doing it to cross check the gputop implementation. I's not
>>>really meant to be applied here.
>>>
>>>I tested this on DG2 and TGL with kmscube (console-only) and vkcube
>>>(in a gnome session), but it would be good to soak this under more
>>>tests. The biggest goal for this patch series right now is to get
>>>consensus on the new UAPI.
>>>
>>>TODO: Add documentation on top with the new interface.
>>
>>Yeah a drm-usage-stats.rst patch would be nice to have in the RFC so 
>>one does not have to look into the driver implementation to discuss 
>>the proposed uapi.
>>
>>Nevertheless I understand the proposal is to add this:
>>
>>drm-engine-<class>: <GPU_TIMESTAMP> <RUNTIME> ticks
>
>yes, the gputop patch was more explicit about this. Should had added in
>the kernel patch series too.
>
>>
>>That's two values per key. I guess "one key value pair for per one 
>>line of text" does not get strictly broken and that you propose a 
>>heuristics in parsing to detect that the <RUNTIME> cannot be 
>>mis-interpreted as the unit?
>
>the current format is
>
>	drm-engine-<class>: <RUNTIME> ns
>
>the "ns" in the end should be parsed by userspace to know
>what it is about.
>
>>
>>Not sure it is a good idea though. If you instead added a new key 
>>for the gpu time what would be the downside in your view? Like:
>>
>>drm-engine-<class>: <uint> ticks
>>drm-ticks-<class>: <uint>
>>
>>Or maybe even obsfuscate/generalise as:
>>
>>drm-engine-<class>: <uint> gpu-time
>>drm-gpu-time-<class>: <uint>
>
>I think both work, but I fail to see the advantage. This alternative is
>slightly heavier on the parsing side since you have to correlate the
>values from 2 keys, possibly dealing with them appearing in different
>order. The only possible breakage remains with this alternative: if
>userspace didn't parse the unit before. I checked nvtop and htop and
>they were doing the right thing. I sent a fix to igt a few weeks back
>for it to consider the unit:
>https://lore.kernel.org/igt-dev/20240405060056.59379-8-lucas.demarchi@intel.com/
>
>>
>>Potentially could also add a key saying how much wall time is one 
>>unit of GPU time.
>
>I wouldn't add it really as it may not make sense depending on the
>vendor and or usage. Examples: the gpu time may be different for
>different engines depending on where they are located (tile/gt). The
>correlation with CPU time is different when running in VF mode, and may
>change in runtime depending on the number of VFs. +Michal.
>
>Also, if the userspace side really wants to know (why would it?)
>it could be just calculate from 2 samples (possibly repeated a few
>times as it updates the output).
>
>>
>>Or.. would even the existing drm-cycles, plus abuse of drm-maxfreq, 
>>work? Ticks == cycles, maxfreq == ticks per wall second.
>
>I think it'd be up to gpu vendor what clock backs this time. For the
>current Intel cards, it's the refclock and it doesn't vary the
>frequency.
>
>>
>>Secondly, wrap behaviour every 25-30 seconds patch 6/7 describes 
>>definitely breaks the format spec and in my view should be worked 
>>around in the driver:
>>
>>"""
>>Values are not required to be constantly monotonic if it makes the driver
>>implementation easier, but are required to catch up with the 
>>previously reported
>>larger value within a reasonable period. Upon observing a value 
>>lower than what
>>was previously read, userspace is expected to stay with that larger previous
>>value until a monotonic update is seen.
>>"""
>
>but this is the behavior for dealing with "ns", not with "ticks". We can
>add a worker to run every so often.  When I got the original patches
>from Umesh, we had this worker implemented, but dealing with that was
>complex and wasting a lot of cycles since it was always running (except
>if we didn't have any exec_queue). Here is my tentative to simplify it
>since I don't really see the need to account for a ~25s wrap around.
>
>thanks
>Lucas De Marchi
>
>>
>>Regards,
>>
>>Tvrtko
>>
>>>
>>>Test-with: https://lore.kernel.org/igt-dev/20240405060056.59379-1-lucas.demarchi@intel.com/
>>>
>>>Lucas De Marchi (5):
>>>  drm/xe: Promote xe_hw_engine_class_to_str()
>>>  drm/xe: Add XE_ENGINE_CLASS_OTHER to str conversion
>>>  drm/xe: Add helper to capture engine timestamp
>>>  drm/xe/client: Print runtime to fdinfo
>>>  HACK: simple gputop-like impl in python
>>>
>>>Umesh Nerlige Ramappa (2):
>>>  drm/xe/lrc: Add helper to capture context timestamp
>>>  drm/xe: Add helper to capture context runtime
>>>
>>> drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   1 +
>>> drivers/gpu/drm/xe/xe_device_types.h          |   9 ++
>>> drivers/gpu/drm/xe/xe_drm_client.c            |  81 ++++++++++++-
>>> drivers/gpu/drm/xe/xe_exec_queue.c            |  37 ++++++
>>> drivers/gpu/drm/xe/xe_exec_queue.h            |   1 +
>>> drivers/gpu/drm/xe/xe_hw_engine.c             |  29 +++++
>>> drivers/gpu/drm/xe/xe_hw_engine.h             |   4 +
>>> drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c |  18 ---
>>> drivers/gpu/drm/xe/xe_lrc.c                   |  11 ++
>>> drivers/gpu/drm/xe/xe_lrc.h                   |   2 +
>>> drivers/gpu/drm/xe/xe_lrc_types.h             |   3 +
>>> drivers/gpu/drm/xe/xe_sched_job.c             |   2 +
>>> pyfdinfo                                      | 113 ++++++++++++++++++
>>> 13 files changed, 292 insertions(+), 19 deletions(-)
>>> create mode 100755 pyfdinfo
>>>
