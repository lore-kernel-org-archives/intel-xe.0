Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD04C4706C
	for <intel-xe@archiver.kernel.org>; Fri, 22 Dec 2023 19:36:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499EB10E636;
	Fri, 22 Dec 2023 19:36:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE23D10E84E
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Dec 2023 19:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703273796; x=1734809796;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iJfQGdV5M4L4Ci9mPNPoWSZ2Y+Lf7sIgXv4lVeQPiwE=;
 b=CMag7Nfl3yrjIdpRcZK+s/czermatvRnSJd09LmwOfKOcelTtDbKirSA
 ModZbVzDEaRcXYk/oTTn+YESq7MbzMIxSbI2dK9+/r8Gn3Bh46cWLN0qF
 XmJHg2BrHNZsP8/34KASdduVC4DbzkRNDnKYgeu22ug8bIaaRbjfxvqfM
 YhMjOzdfelOcq6wnZKTBlvGPpLAlOnKd5N5PSEGgpn7sGGgt43ApfC150
 Ylkv5AC21DKMkj7ilEGSN2wwbOqM7TIIgAFDDbSHsh4OII2zB+B8QtX5j
 bM//amXz+QLi9rIkp4jJmWlM2BZ9JB7MM4s+L6oIVWAgoLpYU1JEUUtf5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="376293796"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; d="scan'208";a="376293796"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 11:36:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="753345667"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; d="scan'208";a="753345667"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Dec 2023 11:36:35 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Dec 2023 11:36:35 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Dec 2023 11:36:35 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Dec 2023 11:36:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZbbSdIEqa8Rz6KPUhUFI6vAC5wNsx27n58erw6qOeDuS2515IyMryjSKpxv/PrVlrfgcfjO3bl9Wx2mHTp59flXGnybKAmjb78LRvzuKtOcByzIuwq3vakweawWFW6CxmP+CNvmlV/PUaODsDSUZ4Zw62nbXg3V9mIP1LhZblMFhQYS80RIXokyzdhji5VL6xNFHMZmnU+UC0yIxBuDmmJCnhZKCqr+72Si6FYRLQpCL39nLPrFYwrKbD0PFa344FShZBHKHGHztxEBH3riCtW35D3Xm2TAq0jMoUovavmHs3bGTFXMkH01Ar3kbn7S9iulFCfT0fPQzMqsScQpIKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1Qg0MP/VHYFn9WtI7jEhSZG9uIOUNb2GXLQmwEdVlk=;
 b=g/4UxRZjx53DRIsPxS5eoRa2yxa1VAXkKDEqeH9ICnUo44kx5ApozOxVtHLl0amG/yLhTMvNKbrzPuFJ6c0Yrt0Cb2SNBaIFQCf/8tiUE83OpNTA0/mATYaMo1iZfHBr1Ps++Y9Q4q+2Xd6m/vV6/v/4T18mepMf1zAMAev0wA7wD11YVTNiHLW2XzNt0oXG3v6ryY4bm4LVO9ZXnTGta7ue0dDM/dwK6s16nv09OIH2u5EgLmJoG5oOVtAS7zmW7d8UPPhaXF9+AzwGkFiYd07RBPAFlwIEwUZ20p14jHW9+08+Kscy82qQY+5d+ryG+H/sGZC8X0ad5MjcRNFqPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB6401.namprd11.prod.outlook.com (2603:10b6:510:1fb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 19:36:32 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34%4]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 19:36:32 +0000
Message-ID: <c777b06d-4323-4bf4-84fd-b06334c97484@intel.com>
Date: Fri, 22 Dec 2023 11:36:28 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Add more GuC CT states
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20231219172824.832873-1-matthew.brost@intel.com>
 <6af59573-3925-4af4-abb4-ad7e1f40b920@intel.com>
 <ZYUi5ZdXQV+r6J7C@DUT025-TGLU.fm.intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <ZYUi5ZdXQV+r6J7C@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0159.namprd04.prod.outlook.com
 (2603:10b6:303:85::14) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB6401:EE_
X-MS-Office365-Filtering-Correlation-Id: 3935e674-05df-4406-fb0c-08dc03254d2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E34Vx2aGYpoiFn7uxwpBS/KS9InKJ/irsfp4jRmA9CPL/UP+PF9s2EC0m857o/HEZOBYzKQRUaoXikrM+mOnalI/aEHtZFQEtRojw1cQNOIYTlG4Wc6TGHglbFxFpeVG05f46zR/UwPfK5nUWqbShIp55VUbj7QadE7COMaIA59Ac8OKB0LnKbAEwUkcI6N5V2jr/Av9jIrYaZorrxHhig1yvu8Z27wf3f6bvmdQsMr2IwjW+BjZsiPHP+OTYUEC0qsElxQ8TgfvJqChjQz9TWieafbf5queV9gMQJZrJAEAsgxet7Y9WEK2u5BrvfUShIJ9GJywwGA/XpoYDUNRQSNyoPh75Om2aLpO8AMBRorkqqckX7f0t1wujkD8goQB+CPUN3BsHOm7wr7HthlKxn6unggBa1cTCl7AgoZRfsPlnrJAwq/ODQ5cNnuWAUOqmrfiq81W9BlKnY0lynck0grOwjzlPme9mpqY6LYpGekq0LJjdBuERGB58mv+2Y+rvPGo0+eJmZOIf8GRkikXYKXJCRQpfPWCbkCy9pyB5k7MO6CCRMYb5t1biupm4oftoQhc2CcS4Gt3upqAuqUxoUfdmLI1POMgZAMceuAm2Y3mv3ouTwvrSQuDO5wwc0D7IZ4KKOo5P5GeWcs4AOnjE+9j1ZVRTDivhwSVjREixTY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(36756003)(31696002)(86362001)(31686004)(6486002)(53546011)(966005)(6512007)(478600001)(66946007)(82960400001)(41300700001)(2616005)(38100700002)(83380400001)(26005)(30864003)(316002)(2906002)(6636002)(4326008)(6862004)(66556008)(8676002)(5660300002)(6666004)(6506007)(8936002)(66476007)(37006003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2Mvem81N21veHVlelZpOVc3NXBxTXdqVCs2aFlJWkdVaWg1ZlRueUlVWGYr?=
 =?utf-8?B?QU5jYWRLZk0vOUZ2S1IzNzBHT0llLzM4a2tWVnFPU1lMUHQ1czl1SzZOU1ov?=
 =?utf-8?B?cHBzOVFyVEgvS3NDZWJNOXhBbEhsdlZISEgyYVVZTTFLa29IQUxDdXhDa1Qr?=
 =?utf-8?B?a0NHeHpWWWRHNW1BODZFTm45azFqZ0g4dWtHWVREVUtiakRjMHFUT3pkTERH?=
 =?utf-8?B?VzJDZHZ2STkwUFZDRm9xME1zMmRRUWJMZVR4MGJ2R0h0NEFyelpLWU5mNnlY?=
 =?utf-8?B?V0JKWjF1cWE5ZXlyaE5oTzRhd0VhaGlzcHpST1JWdm9KRUJqajBWdmFzbVlJ?=
 =?utf-8?B?dW40SkdPWmZnVW1zMlhDejhxVTYzTHY5ck5SQXp4M2RvU25nL1ZibHhHQmhK?=
 =?utf-8?B?bENDVWJ4UUxmNm5pYlAwaW9rOEdRTjNCeXVKQzBIWSs4cHlCanVpaFVlWW9S?=
 =?utf-8?B?ZHJiYWd0Z3ZXa0FVM3NzcVlsVk5RSEk3ZlYyK0RaOVp2TGJHU2o1dzlMbU91?=
 =?utf-8?B?TkxwdGJ1YzhFVUkyZmhNODBCNFg0bW56cXpSMzRwMm5VTGI2NmRoazJpalZG?=
 =?utf-8?B?MVFGam5Pbmdsdm1ic3BUN3piazk1MHV3cWRxcDdEcVlvNDZ5RmFiOWxPOTRa?=
 =?utf-8?B?ZksrdDRNSkdQNGlVd2F1TkdvVlQyVUlJM2hRL1pVblBwSFNmblZIUXZNZitk?=
 =?utf-8?B?NWlqRVRhcFM4T1ZQcnNSTGFSNXBWZEpudVRkRTQvS0FKd3diV2hiOXRRSlY3?=
 =?utf-8?B?VkliNkxSRXRZM2pBWkNQZWViT2FVRGh2cmtRNTRBb3VnN2tmTGRzWndMRUJl?=
 =?utf-8?B?UmRYWUZjSTU4WWdPNjVMWXd2NzU3OWtZd00zZkNPejlQUUN0MldKWTlHamYy?=
 =?utf-8?B?MmNtV3NxOEI4cUZ4MTlYYXFuMzFwK0doeHk0S29KejNSbXJ5YTlMTkc0WkhM?=
 =?utf-8?B?bVBqc1k5aDhDRXY1SmIxdFVSYTJyMmxzSkRmUUlmcmNadkNhTHJIVTYzMTYy?=
 =?utf-8?B?YXlQQzkwb0wxbzNURGNtcGp4VHlHa2thSjhGY0lDQnplQ1ZjVThnam1Lb3pr?=
 =?utf-8?B?OFB2Y2FEUVFUZThWUndoWis0Y2h6ak80dHRDNUM4enRBdUtBdEFnamtPdkp3?=
 =?utf-8?B?Z1pSV2I5UzhodU44YklKYnhuN1pnd3ZPMWc2STZmT3FRcGp4N0pKTEJsNzRs?=
 =?utf-8?B?MlJYTDlReWxjN3ArYkE3L3pVc1dOaS9LVENiN2M5T0NOTWxiMmZZWCtybjJB?=
 =?utf-8?B?NCtvSzNxaEthK1hQNDJuNThla2tRc3Z1aWdEZWRFcWNzbHd2VDZmWFR5UWdE?=
 =?utf-8?B?Qm5ySmJDVnFHNXdEMHNTV2NTaGZPNC95TDVCelBYbzNHRWZnck05UzliS25i?=
 =?utf-8?B?M25sdDduc1F0Y05jS2NjSnNIbTRTR3FSbmxMV0VwMnJpTGk2aGtBZzBFUGdl?=
 =?utf-8?B?QlJ4UkUxVnZ6eTR2VjY1M2xycGs1eW5hTnU4azFXYTlJMTIxR21PaldPYkFV?=
 =?utf-8?B?VjUralNEdk1aTzFpZEQ4bUZwWDQrZjV0SzZqTEdicks3UlNXZGZ4SWd0YVA5?=
 =?utf-8?B?Z05FQ2FNYWNVOGQ2STQ4MVBrSFJHc1N3Rm5ES3kvUFZ1eG84V1VNUU5jWGVP?=
 =?utf-8?B?RTFnOW5Id1NsZlVyVjlSZTlibUlDM2w3Qm43aUh2SGVjeXY3bEZkWHZCVkd0?=
 =?utf-8?B?Y1lGQm5Eb3dEWVdvSlZwRG0wOVROUGczd0lJSWhWdDdqUDYzT0NhNzFPNkth?=
 =?utf-8?B?RmYwTzlpaEZzUnBUTXg1MUhac3B1RnVCcmFDbmFpNnlEanJjeldaemRTV2RL?=
 =?utf-8?B?aWVlRkNwdW03eFBva0ZSQlZSUlJaWSt5T1ZLTzhQdWRrUmo2K2JYcjNzVW5y?=
 =?utf-8?B?ZnE1REJUeDNia0NvYTlwcXdYcUdvVjBKOVUwU1dnOXVNTE5tTkJ5aUlvdFZi?=
 =?utf-8?B?VVlDMXJkQlNyejRqSTZRU0pDa1IxM2RRbCtBaEh1NmRhc3Z6VXhSUnJhOExj?=
 =?utf-8?B?ZFB3MmVCV2QxaTV2M2l4WDBTZVpIM1FiVGRVT01zVCtyMXpsdlVUSnhDdlZ5?=
 =?utf-8?B?aVBnc1lyTUdBci9zM2xmcWM3RFAzU0ozUlAzWHB2REQyNFpDaTBxNEVSZ1Nv?=
 =?utf-8?B?N2ErWlpGcjY0Z1RFdytVNFpESjN4aUVHa2prYVRYUHlUOEdxWHBOWk5EN0JG?=
 =?utf-8?Q?LlsDGb0K9Gslk1YiRWWoInM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3935e674-05df-4406-fb0c-08dc03254d2d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 19:36:32.5769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xVLQFy2If3KvOI409JQJdRRj+7m9upQfQY3sMOfcLV/q2cQMk1qwaD3GTvJ6bWDy/28Lod8bYDsXOYfLdgi9o7rZvT3CTgShwg8oMYme+V4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6401
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



On 12/21/2023 9:47 PM, Matthew Brost wrote:
> On Thu, Dec 21, 2023 at 01:56:33PM -0800, Daniele Ceraolo Spurio wrote:
>>
>> On 12/19/2023 9:28 AM, Matthew Brost wrote:
>>> The Guc CT has more than enabled / disables states rather it has 4. The
>>> 4 states are not initialized, disabled, drop messages, and enabled.
>>> Change the code to reflect this. These states will enable proper return
>>> codes from functions and therefore enable proper error messages.
>> Can you explain a bit more in which situation we expect to drop messages and
>> handle it? AFAICS not all callers waiting for a G2H reply can cope with the
> Anything that requires a G2H reply must be able to cope with it getting
> dropped as the GuC can hang at any moment. Certainly all of submission
> is designed this way, so is TLB invalidations. More on that below. With
> everything being able to cope with lost G2H their is not a point to
> continue to process G2H once a reset has started (or send H2G either).
>
>> reply not coming; e.g. it looks like xe_gt_tlb_invalidation_wait() will
> During a GT reset xe_gt_tlb_invalidation_reset() is called which will
> signal all waiters for invalidations avoiding timeouts.
>
> So the flow roughly is:
>
> Set CT channel to drop messages
> Stop all submissions
> Do reset
> Signal TLB invalidation waiters.

Thanks for clarifying

>
>> timeout and throw an error (which IMO is already an issue, because the reply
>> might be lost due to reset). I know that currently in all cases in which we
>> stop communication we do a reset, so the situation ends up ok, but there is
>> a pending series to remove the reset in the runtime suspend/resume scenario
>> (https://patchwork.freedesktop.org/series/122772/) in which case IMO we
> This path we would want to put the GuC communication into a state where
> if messages send / recv this triggers an error. (-ENODEV).  We don't
> expect to suspend the device and then send / recv messages. That is the
> point of this patch - it is fine drop messages during a reset, not if
> during suspend or if CT has not yet been initialized.

AFAIU one of the reasons behind this patch (internal report 53093) is an 
issue around the suspend path, so we do already receive messages after 
we started suspending. If I understand this patch correctly, we would 
put the CT in DROP_MESSAGES state on suspend, via the following chain:

gt_suspend
         uc_suspend
                 uc_stop
                         guc_stop
                                 guc_ct_drop_messages

Are you saying this is fine for now, because we always do a reset on 
resume, and that we'll need a new state when we stop doing such a reset? 
(not a complaint, just making sure I understood your reply).

>
> Proper error messages will added based on these new states.
>
>> don't want to drop messages but do a flush instead.
>>
> See above. Also unsure what you mean by flush here? Do you mean the G2H
> worker? I think that creates some dma-fencing (or lockdep) nightmares if
> we do that.

I meant the G2H, yes. We've had a ton of problem on the i915 side with 
worker threads running parallel to the suspend code and trying to talk 
to the GuC (latest of which is 
https://patchwork.freedesktop.org/series/121916/), so I am kind of 
worried something similar could happen here.

Daniele

>
> Matt
>
>> Daniele
>>
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_guc.c          |  4 +-
>>>    drivers/gpu/drm/xe/xe_guc_ct.c       | 55 ++++++++++++++++++++--------
>>>    drivers/gpu/drm/xe/xe_guc_ct.h       |  8 +++-
>>>    drivers/gpu/drm/xe/xe_guc_ct_types.h | 18 ++++++++-
>>>    4 files changed, 64 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> index 482cb0df9f15..9b0fa8b1eb48 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -645,7 +645,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>>>    	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
>>> -	xe_assert(xe, !guc->ct.enabled);
>>> +	xe_assert(xe, !xe_guc_ct_enabled(&guc->ct));
>>>    	xe_assert(xe, len);
>>>    	xe_assert(xe, len <= VF_SW_FLAG_COUNT);
>>>    	xe_assert(xe, len <= MED_VF_SW_FLAG_COUNT);
>>> @@ -827,7 +827,7 @@ int xe_guc_stop(struct xe_guc *guc)
>>>    {
>>>    	int ret;
>>> -	xe_guc_ct_disable(&guc->ct);
>>> +	xe_guc_ct_drop_messages(&guc->ct);
>>>    	ret = xe_guc_submit_stop(guc);
>>>    	if (ret)
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> index 24a33fa36496..22d655a8bf9a 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> @@ -278,12 +278,25 @@ static int guc_ct_control_toggle(struct xe_guc_ct *ct, bool enable)
>>>    	return ret > 0 ? -EPROTO : ret;
>>>    }
>>> +static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
>>> +				enum xe_guc_ct_state state)
>>> +{
>>> +	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
>>> +	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */
>>> +
>>> +	ct->g2h_outstanding = 0;
>>> +	ct->state = state;
>>> +
>>> +	spin_unlock_irq(&ct->fast_lock);
>>> +	mutex_unlock(&ct->lock);
>>> +}
>>> +
>>>    int xe_guc_ct_enable(struct xe_guc_ct *ct)
>>>    {
>>>    	struct xe_device *xe = ct_to_xe(ct);
>>>    	int err;
>>> -	xe_assert(xe, !ct->enabled);
>>> +	xe_assert(xe, !xe_guc_ct_enabled(ct));
>>>    	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
>>>    	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
>>> @@ -300,12 +313,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>>>    	if (err)
>>>    		goto err_out;
>>> -	mutex_lock(&ct->lock);
>>> -	spin_lock_irq(&ct->fast_lock);
>>> -	ct->g2h_outstanding = 0;
>>> -	ct->enabled = true;
>>> -	spin_unlock_irq(&ct->fast_lock);
>>> -	mutex_unlock(&ct->lock);
>>> +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
>>>    	smp_mb();
>>>    	wake_up_all(&ct->wq);
>>> @@ -321,12 +329,12 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>>>    void xe_guc_ct_disable(struct xe_guc_ct *ct)
>>>    {
>>> -	mutex_lock(&ct->lock); /* Serialise dequeue_one_g2h() */
>>> -	spin_lock_irq(&ct->fast_lock); /* Serialise CT fast-path */
>>> -	ct->enabled = false; /* Finally disable CT communication */
>>> -	spin_unlock_irq(&ct->fast_lock);
>>> -	mutex_unlock(&ct->lock);
>>> +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DISABLED);
>>> +}
>>> +void xe_guc_ct_drop_messages(struct xe_guc_ct *ct)
>>> +{
>>> +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DROP_MESSAGES);
>>>    	xa_destroy(&ct->fence_lookup);
>>>    }
>>> @@ -493,11 +501,19 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>>>    		goto out;
>>>    	}
>>> -	if (unlikely(!ct->enabled)) {
>>> +	if (ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED ||
>>> +	    ct->state == XE_GUC_CT_STATE_DISABLED) {
>>>    		ret = -ENODEV;
>>>    		goto out;
>>>    	}
>>> +	if (ct->state == XE_GUC_CT_STATE_DROP_MESSAGES) {
>>> +		ret = -ECANCELED;
>>> +		goto out;
>>> +	}
>>> +
>>> +	xe_assert(xe, xe_guc_ct_enabled(ct));
>>> +
>>>    	if (g2h_fence) {
>>>    		g2h_len = GUC_CTB_HXG_MSG_MAX_LEN;
>>>    		num_g2h = 1;
>>> @@ -682,7 +698,8 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
>>>    		return false;
>>>    #define ct_alive(ct)	\
>>> -	(ct->enabled && !ct->ctbs.h2g.info.broken && !ct->ctbs.g2h.info.broken)
>>> +	(xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \
>>> +	 !ct->ctbs.g2h.info.broken)
>>>    	if (!wait_event_interruptible_timeout(ct->wq, ct_alive(ct),  HZ * 5))
>>>    		return false;
>>>    #undef ct_alive
>>> @@ -941,12 +958,18 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>>    	lockdep_assert_held(&ct->fast_lock);
>>> -	if (!ct->enabled)
>>> +	if (ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED ||
>>> +	    ct->state == XE_GUC_CT_STATE_DISABLED)
>>>    		return -ENODEV;
>>> +	if (ct->state == XE_GUC_CT_STATE_DROP_MESSAGES)
>>> +		return -ECANCELED;
>>> +
>>>    	if (g2h->info.broken)
>>>    		return -EPIPE;
>>> +	xe_assert(xe, xe_guc_ct_enabled(ct));
>>> +
>>>    	/* Calculate DW available to read */
>>>    	tail = desc_read(xe, g2h, tail);
>>>    	avail = tail - g2h->info.head;
>>> @@ -1245,7 +1268,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
>>>    		return NULL;
>>>    	}
>>> -	if (ct->enabled) {
>>> +	if (xe_guc_ct_enabled(ct)) {
>>>    		snapshot->ct_enabled = true;
>>>    		snapshot->g2h_outstanding = READ_ONCE(ct->g2h_outstanding);
>>>    		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>>> index f15f8a4857e0..214a6a357519 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>>> @@ -13,6 +13,7 @@ struct drm_printer;
>>>    int xe_guc_ct_init(struct xe_guc_ct *ct);
>>>    int xe_guc_ct_enable(struct xe_guc_ct *ct);
>>>    void xe_guc_ct_disable(struct xe_guc_ct *ct);
>>> +void xe_guc_ct_drop_messages(struct xe_guc_ct *ct);
>>>    void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>>>    struct xe_guc_ct_snapshot *
>>> @@ -22,10 +23,15 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>>>    void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
>>>    void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic);
>>> +static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
>>> +{
>>> +	return ct->state == XE_GUC_CT_STATE_ENABLED;
>>> +}
>>> +
>>>    static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
>>>    {
>>>    	wake_up_all(&ct->wq);
>>> -	if (ct->enabled)
>>> +	if (xe_guc_ct_enabled(ct))
>>>    		queue_work(system_unbound_wq, &ct->g2h_worker);
>>>    	xe_guc_ct_fast_path(ct);
>>>    }
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
>>> index d814d4ee3fc6..e36c7029dffe 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
>>> @@ -72,6 +72,20 @@ struct xe_guc_ct_snapshot {
>>>    	struct guc_ctb_snapshot h2g;
>>>    };
>>> +/**
>>> + * enum xe_guc_ct_state - CT state
>>> + * @XE_GUC_CT_STATE_NOT_INITIALIZED: CT suspended, messages not expected in this state
>>> + * @XE_GUC_CT_STATE_DISABLED: CT disabled, messages not expected in this state
>>> + * @XE_GUC_CT_STATE_DROP_MESSAGES: CT drops messages without errors
>>> + * @XE_GUC_CT_STATE_ENABLED: CT enabled, messages sent / recieved in this state
>>> + */
>>> +enum xe_guc_ct_state {
>>> +	XE_GUC_CT_STATE_NOT_INITIALIZED = 0,
>>> +	XE_GUC_CT_STATE_DISABLED,
>>> +	XE_GUC_CT_STATE_DROP_MESSAGES,
>>> +	XE_GUC_CT_STATE_ENABLED,
>>> +};
>>> +
>>>    /**
>>>     * struct xe_guc_ct - GuC command transport (CT) layer
>>>     *
>>> @@ -96,8 +110,8 @@ struct xe_guc_ct {
>>>    	u32 g2h_outstanding;
>>>    	/** @g2h_worker: worker to process G2H messages */
>>>    	struct work_struct g2h_worker;
>>> -	/** @enabled: CT enabled */
>>> -	bool enabled;
>>> +	/** @state: CT state */
>>> +	enum xe_guc_ct_state state;;
>>>    	/** @fence_seqno: G2H fence seqno - 16 bits used by CT */
>>>    	u32 fence_seqno;
>>>    	/** @fence_lookup: G2H fence lookup */

