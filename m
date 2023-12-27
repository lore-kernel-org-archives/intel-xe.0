Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2B3C46CD4
	for <intel-xe@archiver.kernel.org>; Wed, 27 Dec 2023 06:53:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D49810E002;
	Wed, 27 Dec 2023 06:53:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BE710E002
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Dec 2023 06:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703659987; x=1735195987;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G/yTwbCEVwL/4ve9ra9Aa6G/2FKNffa1JJAydso3KLg=;
 b=kVpo4GnipnvRbQ6Yah3jTimELDPHybVZwPJz9+bVh1dZ0VS2rGPBMjw5
 aX8ivKdr/12if9MqYj2K2fRH6Bsj6T7gwZtNGYwK7Ibf+OLNrJ5bepTCQ
 XPgzJnJFKNr9P30frIL9kkkkY3AhjmNXr/nqYpjaN8mno4HWXeqxB1IET
 Juc0n+QDYEVkKK15apjzTDdRiOER492kwI/AFXtZAaVDySQZnyrUtOeUr
 57BAPhA2kdIJBft5rtKE+/4EqYqGIKYRB+X3AZSpgfL3CU94qh2sWO4yB
 prTbYB/uHklN/Hcc/E9x/ceIHE4X1pb+Sh7rsIKA53QV7kvczDb5FrFiY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="427586787"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="427586787"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Dec 2023 22:52:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="901594060"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="901594060"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Dec 2023 22:52:22 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Dec 2023 22:52:21 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Dec 2023 22:52:21 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Dec 2023 22:52:21 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Dec 2023 22:52:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZWektf1Gm7IMtdAH05ZF5rGYmtQIoar5Edbbov7IEQc6VdwenGkoNfZ/WTmRe4WfmIC6ux/RTa/Cfgzdv7mDOsnQOi5H8Z8cLt+2SviLE/Hw1O2GqCLHTdcdaeqlxDU58kCJL9ha/DGddCyIO2j0LPq0bfA30bzVBd32aEnM/xAUBNCLEmZhMMgeJ8dsq4sHGqMmy4bKiWNv8fD77oitrtjDgE1cxx23y7HDC4TdnUuWtbH+cY997e1LchrdBOcXWtZAGg3VKx3jIbAfSBKRY/Y4JjxTALRFigkofMVRU4k8sfWmHq0Irjys2jGTefaU+ki8yHu9rbsQMa/3+vFkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxmavfXrwQz8Jif/Fw/cS2xu13bvPlm2dMz+eYpI01Q=;
 b=bEt+1GmLQLQcAK7eJX33j6aB5rp4310oGsbS6nD6rKAqv7HZQhbbjIcAjBjURRcFqNpLmrwy2QrLV8iNPoDVR9Tvui4phGiqU6kisyOL3sGEgVK86CIVWh7WJJ5B+hIkHrmvsh27I4jrS5eiJNC5JViU4cfs41wuIrJsvzHRcQ7C/anVqfzZhwiXQis1q7EeYsS+bh5ahMw4Wi2RoS94F3bqboR3L84WK5CQdd0SGe7ybpy5F+q/Ene0Uvo+g7wD0CY0mznZ/9xU9njaVFNmpU4IPTK/C8qJP6S7UPnNtVn9hk+x6f1AK85gpnQNQu7Nmfd80NncaVURP9+cKWWB7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB6190.namprd11.prod.outlook.com (2603:10b6:8:ad::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.27; Wed, 27 Dec 2023 06:52:14 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7113.027; Wed, 27 Dec 2023
 06:52:14 +0000
Message-ID: <8932513b-5aa9-40f1-b172-d271a9a08b92@intel.com>
Date: Wed, 27 Dec 2023 12:22:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Add more GuC CT states
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
References: <20231219172824.832873-1-matthew.brost@intel.com>
 <6af59573-3925-4af4-abb4-ad7e1f40b920@intel.com>
 <ZYUi5ZdXQV+r6J7C@DUT025-TGLU.fm.intel.com>
 <ZYUkIzf+R/JSJPIc@DUT025-TGLU.fm.intel.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZYUkIzf+R/JSJPIc@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0230.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB6190:EE_
X-MS-Office365-Filtering-Correlation-Id: a73368bc-4649-4123-a8c8-08dc06a85b57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AFR/L3SVAfm3qRZwP1Sbhwe1Q9rUIQoqKTY5ofDgtcmzsEsoqRI7LvL8ooutDwNKNyEa7LvqYvUVJ1WzcMSWSTtJqtEjyb+3SvujJvdjY3jTEA/jwkJHdpsHLXw/ppF5wWu51r1QehHHL4th1zJghjIVEJOoNFosz2J+KtAaYXxqWIIg91yjcxvp+yPMEXw/hvbQuD8f7MqkgDU6Yrp/aSzEhBz68gahCkEzy0HSRvpwXF9LNxa4H5tgd4uyX/RhtsrTTPgijAS3NqT5zwa/izH/hQtp4O2pROgaTxiPK3qxRLHR9aS35I2fbf2ZLGfwgPh4bkuKj6PxwXJdosUCuE8CyTn9OfE/a7VvyHErBPy77OGkotYHHZpM5TvAQtuwkV09HcS+VmAo7E3wme7xfrs7twDTt2YO385W1MHTSc4RGgmE91aEwmDe1K8D0HjWtCpCwhOt6W/I8PAzawvyoFoPN/1IXyOsW3EnYxrzI/ZiVU2arX/yCGk0EmhPC9jtPa4yllHzNIxZ/Ut4EKfx5Ibysrt+sKqzm+oEXbXI8ybbZ1QXkxAQwmVmD0jJueuotA7ebRDySjemkssNfjwKrTU0LuOZ3R+8ZLwcDDxCPpW+Ss0o6kbclbDVArB0SyUv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(396003)(346002)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(83380400001)(41300700001)(2616005)(38100700002)(26005)(82960400001)(316002)(4326008)(8676002)(110136005)(30864003)(5660300002)(2906002)(8936002)(44832011)(478600001)(6666004)(6636002)(6512007)(53546011)(6506007)(66476007)(66556008)(66946007)(6486002)(966005)(86362001)(31696002)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VStjNzdzQm1qM094ZHNyNnBCSEF0VUU2OVBzTTYydFg5ZTNyZzV4Zk5LNzYx?=
 =?utf-8?B?ZDJFL0VqQjMxYnEzdzkxSGtIbjkzMXFxMkt4WFBpVGdsQ2UwNU83ZGgrUE1H?=
 =?utf-8?B?eSs4aks2YWpsTEFjdjM1d3VEQkVDRStoVHZSN1VJVDFFdUxkaUxuNUdKNHpL?=
 =?utf-8?B?THRIbzBxTDZJdkYzS1BUZTJBSTBRc3A0c2luQmpXT2hGbVdjajZXUDJjV0lo?=
 =?utf-8?B?T0Zaa2h5bVppQmpWd1QzWENNMFVNUk54T2VCdmZ0QzBxbkpPYkNucHNrci85?=
 =?utf-8?B?YjJrMjlHcFNjTHBObTZLcndaQ01kUGdGejVXeWt2SjQ4bThoak1VRWxDa3FV?=
 =?utf-8?B?aFkyTXRHZ3kxSWdXeUZJRnYxQW9mbUNLUHNubUNhaktGT09TYk5RcldFbkpX?=
 =?utf-8?B?c3R6NzhRbzJxaU1rSXE3Wm56ejljdkI4SnNOM012VHdVT0RJTGRGczdpaktX?=
 =?utf-8?B?bklEcXRHdTdtQVRxdW56QmtwSDZUS1pJTlBnYmpKc0NQNDhHRDhRemJycDl1?=
 =?utf-8?B?U3FuSkRNS0srd0RqRGRncWw4K1MvMUpzcmxsMkpkVXI0dzhMRHhveEhnaEdk?=
 =?utf-8?B?ZDl1NndNL0FsQ3BvdExwSXBrRlBDaXllZTN1MFpUeGFJOGhDTFlpMGk0VDJ1?=
 =?utf-8?B?YnVSTlo0clBYYmZXZ1JlbzNRaDgyVzNpM2NreDBwNjIwSmdvWnNMOUd6MC82?=
 =?utf-8?B?WVFmbEpRYUs2ZWdiRC9iUHFYVzFERzJzUlVtYlRwU3duVXNjcWgrZUlGMDQ5?=
 =?utf-8?B?Sjg5RzhFQ2pTNmhNNnpodStVaVRsYXZCdDFhVllJODBKemtmK1FHVUdEWnVQ?=
 =?utf-8?B?Qmx6dlpZKzY5WlExK1ZxZUdjOUlsWVdiRG1sTklyTlArNnI3aHh3VWNUYmxq?=
 =?utf-8?B?aWo3RWdZM2lXTkZkaWJJbU56T3dFRW9tUVlBMXJHdHFnU0ZQVmxxZGZqOCsw?=
 =?utf-8?B?NWM4TG9IZTBPTEwyYzNVeFAzQ01LRWNGek03cmtjaUZqYWNtcWE2WHNXN0p4?=
 =?utf-8?B?QTd3cXU2aGlBZjcvNzBTMEJNUEJzS1VDUVVFS3RZWlZYMUxRTFRSTnhyY2w4?=
 =?utf-8?B?OURUUVdseXNPVW53M0U3c3lHc0VLRExiZUJvTE5PTFJOSzNaSDM3QnN2MDRl?=
 =?utf-8?B?OXM0alJqaE8vNHgzTlNSNlFYOTZ6WEQ5SUNsMVlMbFV4MEZEeEU3dlE0c2ov?=
 =?utf-8?B?QVhWOFpnclR5ZTRMaXRubGp0djhMNXQ5MFdlcVNsSWlPeUM1RlNQMjIyZTRk?=
 =?utf-8?B?elQ0Y0daS09QeWM2WWVXYnVkaFZJSWNyU1ByMDFPOCtMYyttamh6M0FQMEhh?=
 =?utf-8?B?KzMxWDJRb0dIVXRxcjBNZncwYlQ0M2ZMMndObzlqQU5maHJEWE9wS3lxWkh0?=
 =?utf-8?B?NGRseFVGcHgwN215Nzc0SXc0d3NQdExFWnBacmZ6RUpJVVRCclBVa2hVdU01?=
 =?utf-8?B?YS9qVGpKSDRkMFlUVFo4c3JnZnh5dTY2L1RNMWMzY0xyVUp1dUJBTnZNTk1u?=
 =?utf-8?B?UFZXTERONHo1VlVyOXhYQk9uWk8yaTlxc0NESlRpVkY0MittZUhHdXdLZzJU?=
 =?utf-8?B?VDNhdmdsT0liOHhQZG05NG5YNitmdW9rYkdkalBSbWUvSGQ3VnorMWNIYVgv?=
 =?utf-8?B?REpPempTOWlnNnZpanh3U2wrOVY2VG0xekdPUnhCMnJrWlBhUHVuQm81TVlN?=
 =?utf-8?B?VnUxRVZpdzhXNWxTTWd1UnhxQWs5bThHTHp5ZUtjbmVVOE5QZUwrczNKTUFN?=
 =?utf-8?B?cDg4VHU2ZmdxUWp0NGhSVG1zUzN6emZiazl5QnJ1MTRWWXB2YW5BYTAwRzMv?=
 =?utf-8?B?TUpPcDlUWFNndFVVV1FkL3pCVWtuL3VmRStSWWhtZVorSmt1aVVkVndTTWh6?=
 =?utf-8?B?NVI3SVpQZjlZNFRsOWFnSUc0RHVrbUxtdy9vNjh4Qkw4MS9kT1ZXSE8wSkNH?=
 =?utf-8?B?azhIQUpXeUxxK21kYTVvQTZzbFB6RzdueXBhQlRidXJIU0lsb0JJdE4wRUdM?=
 =?utf-8?B?MEhLbk5wYmd3dWR5endNK0FNM2Q4VkxITW4vMmNTWUEwMzZEck03SW5MeEFo?=
 =?utf-8?B?aWpRY2Z4cFlVVE00UkpkdTdwQVcxUmxiOVpTY3pPWVgzT1lETmUyeUF3R2VX?=
 =?utf-8?Q?xHuQ2hcSh5W65qSRwCoOxMk06?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a73368bc-4649-4123-a8c8-08dc06a85b57
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 06:52:13.9803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJ5umJodpttVtort3Tcz5rlkqqm7fo1PmUcgB6VbN+fLrJ2PGKIzPfBCf7LCCYIK7/NYtVn0l7hUtKLSynh1NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6190
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 12/22/2023 11:22 AM, Matthew Brost wrote:
> On Fri, Dec 22, 2023 at 05:47:17AM +0000, Matthew Brost wrote:
>> On Thu, Dec 21, 2023 at 01:56:33PM -0800, Daniele Ceraolo Spurio wrote:
>>>
>>>
>>> On 12/19/2023 9:28 AM, Matthew Brost wrote:
>>>> The Guc CT has more than enabled / disables states rather it has 4. The
>>>> 4 states are not initialized, disabled, drop messages, and enabled.
>>>> Change the code to reflect this. These states will enable proper return
>>>> codes from functions and therefore enable proper error messages.
>>>
>>> Can you explain a bit more in which situation we expect to drop messages and
>>> handle it? AFAICS not all callers waiting for a G2H reply can cope with the
>>
>> Anything that requires a G2H reply must be able to cope with it getting
>> dropped as the GuC can hang at any moment. Certainly all of submission
>> is designed this way, so is TLB invalidations. More on that below. With
>> everything being able to cope with lost G2H their is not a point to
>> continue to process G2H once a reset has started (or send H2G either).
>>
>>> reply not coming; e.g. it looks like xe_gt_tlb_invalidation_wait() will
>>
>> During a GT reset xe_gt_tlb_invalidation_reset() is called which will
>> signal all waiters for invalidations avoiding timeouts.
>>
>> So the flow roughly is:
>>
>> Set CT channel to drop messages
>> Stop all submissions
>> Do reset
>> Signal TLB invalidation waiters.
>>
> 
> Ah, forgot a key detail here. Setting CT channel to drop message before
> do the reset is key here - we don't want a G2H being processed to race
> with cleaning up lost G2H in there reset step.
> 
> Matt
> 
>>> timeout and throw an error (which IMO is already an issue, because the reply
>>> might be lost due to reset). I know that currently in all cases in which we
>>> stop communication we do a reset, so the situation ends up ok, but there is
>>> a pending series to remove the reset in the runtime suspend/resume scenario
>>> (https://patchwork.freedesktop.org/series/122772/) in which case IMO we
>>
>> This path we would want to put the GuC communication into a state where
>> if messages send / recv this triggers an error. (-ENODEV).  We don't
>> expect to suspend the device and then send / recv messages. That is the
>> point of this patch - it is fine drop messages during a reset, not if
>> during suspend or if CT has not yet been initialized.

Hi Matthew

During D3hot->D0 , currently GuC is reloaded during resume. This pending 
patch https://patchwork.freedesktop.org/series/122772/ only 
suspends/resumes CTB communication instead of reload .

Which states should be used in this case?

Thanks
Riana
>>
>> Proper error messages will added based on these new states.
>>
>>> don't want to drop messages but do a flush instead.
>>>
>>
>> See above. Also unsure what you mean by flush here? Do you mean the G2H
>> worker? I think that creates some dma-fencing (or lockdep) nightmares if
>> we do that.
>>
>> Matt
>>
>>> Daniele
>>>
>>>>
>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_guc.c          |  4 +-
>>>>    drivers/gpu/drm/xe/xe_guc_ct.c       | 55 ++++++++++++++++++++--------
>>>>    drivers/gpu/drm/xe/xe_guc_ct.h       |  8 +++-
>>>>    drivers/gpu/drm/xe/xe_guc_ct_types.h | 18 ++++++++-
>>>>    4 files changed, 64 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>> index 482cb0df9f15..9b0fa8b1eb48 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>> @@ -645,7 +645,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>>>>    	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
>>>> -	xe_assert(xe, !guc->ct.enabled);
>>>> +	xe_assert(xe, !xe_guc_ct_enabled(&guc->ct));
>>>>    	xe_assert(xe, len);
>>>>    	xe_assert(xe, len <= VF_SW_FLAG_COUNT);
>>>>    	xe_assert(xe, len <= MED_VF_SW_FLAG_COUNT);
>>>> @@ -827,7 +827,7 @@ int xe_guc_stop(struct xe_guc *guc)
>>>>    {
>>>>    	int ret;
>>>> -	xe_guc_ct_disable(&guc->ct);
>>>> +	xe_guc_ct_drop_messages(&guc->ct);
>>>>    	ret = xe_guc_submit_stop(guc);
>>>>    	if (ret)
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> index 24a33fa36496..22d655a8bf9a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> @@ -278,12 +278,25 @@ static int guc_ct_control_toggle(struct xe_guc_ct *ct, bool enable)
>>>>    	return ret > 0 ? -EPROTO : ret;
>>>>    }
>>>> +static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
>>>> +				enum xe_guc_ct_state state)
>>>> +{
>>>> +	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
>>>> +	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */
>>>> +
>>>> +	ct->g2h_outstanding = 0;
>>>> +	ct->state = state;
>>>> +
>>>> +	spin_unlock_irq(&ct->fast_lock);
>>>> +	mutex_unlock(&ct->lock);
>>>> +}
>>>> +
>>>>    int xe_guc_ct_enable(struct xe_guc_ct *ct)
>>>>    {
>>>>    	struct xe_device *xe = ct_to_xe(ct);
>>>>    	int err;
>>>> -	xe_assert(xe, !ct->enabled);
>>>> +	xe_assert(xe, !xe_guc_ct_enabled(ct));
>>>>    	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
>>>>    	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
>>>> @@ -300,12 +313,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>>>>    	if (err)
>>>>    		goto err_out;
>>>> -	mutex_lock(&ct->lock);
>>>> -	spin_lock_irq(&ct->fast_lock);
>>>> -	ct->g2h_outstanding = 0;
>>>> -	ct->enabled = true;
>>>> -	spin_unlock_irq(&ct->fast_lock);
>>>> -	mutex_unlock(&ct->lock);
>>>> +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
>>>>    	smp_mb();
>>>>    	wake_up_all(&ct->wq);
>>>> @@ -321,12 +329,12 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>>>>    void xe_guc_ct_disable(struct xe_guc_ct *ct)
>>>>    {
>>>> -	mutex_lock(&ct->lock); /* Serialise dequeue_one_g2h() */
>>>> -	spin_lock_irq(&ct->fast_lock); /* Serialise CT fast-path */
>>>> -	ct->enabled = false; /* Finally disable CT communication */
>>>> -	spin_unlock_irq(&ct->fast_lock);
>>>> -	mutex_unlock(&ct->lock);
>>>> +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DISABLED);
>>>> +}
>>>> +void xe_guc_ct_drop_messages(struct xe_guc_ct *ct)
>>>> +{
>>>> +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DROP_MESSAGES);
>>>>    	xa_destroy(&ct->fence_lookup);
>>>>    }
>>>> @@ -493,11 +501,19 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>>>>    		goto out;
>>>>    	}
>>>> -	if (unlikely(!ct->enabled)) {
>>>> +	if (ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED ||
>>>> +	    ct->state == XE_GUC_CT_STATE_DISABLED) {
>>>>    		ret = -ENODEV;
>>>>    		goto out;
>>>>    	}
>>>> +	if (ct->state == XE_GUC_CT_STATE_DROP_MESSAGES) {
>>>> +		ret = -ECANCELED;
>>>> +		goto out;
>>>> +	}
>>>> +
>>>> +	xe_assert(xe, xe_guc_ct_enabled(ct));
>>>> +
>>>>    	if (g2h_fence) {
>>>>    		g2h_len = GUC_CTB_HXG_MSG_MAX_LEN;
>>>>    		num_g2h = 1;
>>>> @@ -682,7 +698,8 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
>>>>    		return false;
>>>>    #define ct_alive(ct)	\
>>>> -	(ct->enabled && !ct->ctbs.h2g.info.broken && !ct->ctbs.g2h.info.broken)
>>>> +	(xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \
>>>> +	 !ct->ctbs.g2h.info.broken)
>>>>    	if (!wait_event_interruptible_timeout(ct->wq, ct_alive(ct),  HZ * 5))
>>>>    		return false;
>>>>    #undef ct_alive
>>>> @@ -941,12 +958,18 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>>>    	lockdep_assert_held(&ct->fast_lock);
>>>> -	if (!ct->enabled)
>>>> +	if (ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED ||
>>>> +	    ct->state == XE_GUC_CT_STATE_DISABLED)
>>>>    		return -ENODEV;
>>>> +	if (ct->state == XE_GUC_CT_STATE_DROP_MESSAGES)
>>>> +		return -ECANCELED;
>>>> +
>>>>    	if (g2h->info.broken)
>>>>    		return -EPIPE;
>>>> +	xe_assert(xe, xe_guc_ct_enabled(ct));
>>>> +
>>>>    	/* Calculate DW available to read */
>>>>    	tail = desc_read(xe, g2h, tail);
>>>>    	avail = tail - g2h->info.head;
>>>> @@ -1245,7 +1268,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
>>>>    		return NULL;
>>>>    	}
>>>> -	if (ct->enabled) {
>>>> +	if (xe_guc_ct_enabled(ct)) {
>>>>    		snapshot->ct_enabled = true;
>>>>    		snapshot->g2h_outstanding = READ_ONCE(ct->g2h_outstanding);
>>>>    		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>>>> index f15f8a4857e0..214a6a357519 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>>>> @@ -13,6 +13,7 @@ struct drm_printer;
>>>>    int xe_guc_ct_init(struct xe_guc_ct *ct);
>>>>    int xe_guc_ct_enable(struct xe_guc_ct *ct);
>>>>    void xe_guc_ct_disable(struct xe_guc_ct *ct);
>>>> +void xe_guc_ct_drop_messages(struct xe_guc_ct *ct);
>>>>    void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>>>>    struct xe_guc_ct_snapshot *
>>>> @@ -22,10 +23,15 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>>>>    void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
>>>>    void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic);
>>>> +static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
>>>> +{
>>>> +	return ct->state == XE_GUC_CT_STATE_ENABLED;
>>>> +}
>>>> +
>>>>    static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
>>>>    {
>>>>    	wake_up_all(&ct->wq);
>>>> -	if (ct->enabled)
>>>> +	if (xe_guc_ct_enabled(ct))
>>>>    		queue_work(system_unbound_wq, &ct->g2h_worker);
>>>>    	xe_guc_ct_fast_path(ct);
>>>>    }
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
>>>> index d814d4ee3fc6..e36c7029dffe 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
>>>> @@ -72,6 +72,20 @@ struct xe_guc_ct_snapshot {
>>>>    	struct guc_ctb_snapshot h2g;
>>>>    };
>>>> +/**
>>>> + * enum xe_guc_ct_state - CT state
>>>> + * @XE_GUC_CT_STATE_NOT_INITIALIZED: CT suspended, messages not expected in this state
>>>> + * @XE_GUC_CT_STATE_DISABLED: CT disabled, messages not expected in this state
>>>> + * @XE_GUC_CT_STATE_DROP_MESSAGES: CT drops messages without errors
>>>> + * @XE_GUC_CT_STATE_ENABLED: CT enabled, messages sent / recieved in this state
>>>> + */
>>>> +enum xe_guc_ct_state {
>>>> +	XE_GUC_CT_STATE_NOT_INITIALIZED = 0,
>>>> +	XE_GUC_CT_STATE_DISABLED,
>>>> +	XE_GUC_CT_STATE_DROP_MESSAGES,
>>>> +	XE_GUC_CT_STATE_ENABLED,
>>>> +};
>>>> +
>>>>    /**
>>>>     * struct xe_guc_ct - GuC command transport (CT) layer
>>>>     *
>>>> @@ -96,8 +110,8 @@ struct xe_guc_ct {
>>>>    	u32 g2h_outstanding;
>>>>    	/** @g2h_worker: worker to process G2H messages */
>>>>    	struct work_struct g2h_worker;
>>>> -	/** @enabled: CT enabled */
>>>> -	bool enabled;
>>>> +	/** @state: CT state */
>>>> +	enum xe_guc_ct_state state;;
>>>>    	/** @fence_seqno: G2H fence seqno - 16 bits used by CT */
>>>>    	u32 fence_seqno;
>>>>    	/** @fence_lookup: G2H fence lookup */
>>>
