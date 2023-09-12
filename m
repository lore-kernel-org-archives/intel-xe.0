Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCA4CA0EC6
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 00:12:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB2F10E00C;
	Tue, 12 Sep 2023 00:12:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602A310E00C
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 00:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694477570; x=1726013570;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wmtaYxDHW3P5oLeneVTpVczKwEEZ9KqtEe6WDBB4ZiQ=;
 b=VaCloSwgJdrWNoVGuhiYn1ZzR4az3+QyOYO0Z7ywMs9r7qZOsbdMGwUS
 GtSFkFgbssKRb4F+3bk7xhFYnDPNPiJiLvbMcbEdOrkcxG04y5yeWmu7X
 Cq1Efh6/xFsO0gcnSkysYVHdsuXOhmQZvd+XDvROmx5klVCRhm8S1ifj5
 Uhn173mbhEJiTR5LfYtjkgDU/oatbDdadL1AWJw0p8FznBrr9FFfYHbPt
 ++LRsJm3aTkWgvcrdSHL3hSt40Hddjvmg7uAnXHSgADTEf1vppgh88d/6
 jJzYX3Ywxfbo3byCpNMyu2zPECj/VT6hvqyCPMq3XjkmNjzCV4WDULdvA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="375572383"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="375572383"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 17:12:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="809020787"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="809020787"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2023 17:12:49 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 17:12:49 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 17:12:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 11 Sep 2023 17:12:48 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 11 Sep 2023 17:12:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbuYSidnW7tbDmQo7CmuXtS1N/nHZOQ63udldEKtG3l+cYV0oZcqHKBezgyAX2Taactd+QyGy0+b3onuzbTJ4pFSmnUO3bFW+xuj4IYmIUAjaGfiuIOcx03kpJ3Kd1UgWuWpDmTW70CZLBMX5NsROI/Ff6kL1Ces0eRCBqeINNuzH8iwCgiD+0w9/w6KxKKtQ26+wmzCWMpcuA9e8SDRvmc1FG6ynYAC778qhWUZoRXu+5GNp+Ta4kUrI2+S7nIaGhYs1+hjdccrubPa5NNYXCIH/NCTZx6MaAjyVfr8U3HRjoKEmf+RB9J36Yaf9vBPkz0ZnP5NhahcjvzZs05fgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pegzSwpSe4/Apo/3MAhgTuLJMSrySzDGNLonatD+y4=;
 b=kgEysZjhuhFSeUsB4kk5N0bA8s1GZMMObAAX08Qj0V/L7RI47sXdf5JLGwFutWe9CkHqet66OlX3UpGxVgKf19HEqAhpQn8tAcb0ND7J6kbB1oeg11vGgLBBQ2OJxJ1z7eted1qYGBkVs94yZ45s6QNjkG647MKMQcjO8/FwZWtxxCTIDHyzMWxyqNmetC4vJXtMk0N4uqEdHIeMfMRxH7XenT2vDo5SVONHdR32BftxcXrtT6XTlCfW4weJauhSF1liWJLpSsynTXlEcjsiBY+7pNYweL6R3mz8CaPT1rR4T2IW966Z1K9N6BxQtQux7S151UZw6LQ5XAepHJnNoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BN9PR11MB5466.namprd11.prod.outlook.com (2603:10b6:408:11f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 00:12:46 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 00:12:46 +0000
Message-ID: <e7fab04f-6391-4899-55b6-4f0c4a3c6b53@intel.com>
Date: Mon, 11 Sep 2023 17:12:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.0
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230802212646.838717-1-daniele.ceraolospurio@intel.com>
 <ba6018b2-ba65-99be-ab77-2b1b2b663fca@intel.com>
 <54ec3096-452c-4eba-982a-b36fc8e7d7c6@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <54ec3096-452c-4eba-982a-b36fc8e7d7c6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0151.namprd04.prod.outlook.com
 (2603:10b6:303:85::6) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|BN9PR11MB5466:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b6fc8b5-4472-4c9b-6047-08dbb324fdf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sJk/h5TN6Nb0bXHkjh06JF6UMkQa1940b2reH+DiJf/CuU3w73RRwAZqovgQvd0VRW6xgY/bdaJZNsS1tczKWxY4jKi2ZfsWJZ/X7kSN8Qa4f7j15Y25heYjHMp74VzSq1zMrKhUDSfBrqGQ+0xYqDgoGUL7hThA+6Tw3daL197Ms4OIdcEuZX+2T4wP2lxwonk27svQkJT24icaXR42qnY92lIkJsPahS/7YMDpzMcI0Meo10PpBLTUvAi2zJNzvEn4NN4Zv8SA7ZTdhE+dvFLhZAB+jD4PDqioyJ5kRTzTOhyFfskIo4zBQ9AnDjRL8ZWiQ4rUDIRiArQr5A9ALnVi3k7Zj5JbEzBY1FV+DKcXMtfMwNvy9qU6mG+TmwWVHByySq5AetxgP02yyHm89cC5yjrKrmh//rUcxidzamq7orHmI3PC5qcrQpfWNV4zIDXwn0kBaDNa3llUuCatyX3/OOAtclY0ZoCsaRjvxZK8d5ZYEpfqsT55PHii53sI3pZiZnANN1sCaHmKgazPKTGZv363SYIOnfzBmi6MyV8NG3KG8cTwWP5E/0q8dGggQDbtAdpivVb2LE6Q3tkr64KNXPFUDNaab5Qp36A2eBQnPJCwYDlRUmlpPsC+vWY95uLijPyZPu/fMFCXsrjncA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(396003)(366004)(346002)(136003)(451199024)(1800799009)(186009)(5660300002)(41300700001)(66946007)(66476007)(4326008)(8936002)(31686004)(8676002)(66556008)(316002)(31696002)(38100700002)(36756003)(86362001)(478600001)(53546011)(6506007)(2906002)(83380400001)(26005)(107886003)(2616005)(6512007)(82960400001)(6666004)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzE4RjFBVmRnQmp2TllYNmpEWU5JSFUvUjZEb1JRZEJ0RzVPVzFjTDgrcDA3?=
 =?utf-8?B?b0szMWhvckJYZWkwNTcrSzYyZGlJWnhrZ2lOd0pWTS91dmhRL2hPY250RmtD?=
 =?utf-8?B?YjZrelc0YU9sMWp2bi9uTjRZZk5TRm5QYVh6VnE0aXJaWDlyY0hzUkhMeWY2?=
 =?utf-8?B?TGtSZThYa1FwUEhGOERZK3l5ZTQvdEdLU295VHhudTBPR1F6M1pYSy9VVFk0?=
 =?utf-8?B?eUtPRkUzT2ZXbGxWODFESGNycHJVT0lvTEprUWxJQzBNcllDemtaZzNCOHp6?=
 =?utf-8?B?UEZRMHBLMkJmV056RDRYNDQ2Z0FuWUxGeU9EVkdRQVA0VCtnMkpvUW5Oc04x?=
 =?utf-8?B?cWVtUHp4SGNVVUZyeU9KQVBIMmNPZWNhcDJOVlZMSEJ1T203UUFWaEl1WllI?=
 =?utf-8?B?SnRrYS9UdjNtR25qblBZNWJoNzkyaDdjcis5SDdtZjY5VWRYek5nU3Ztd3A1?=
 =?utf-8?B?NnB1Nm1JYk8rejZMRG9sZ1dIaHFVMDdlWjBnY0NjblZCMGFZSGZDTHBnT1pC?=
 =?utf-8?B?TXBmU05yMXNIZ3NsNURJWTVHb05tQ2w4bm1zeWRuQlpvODlkVEpzeERWWjJq?=
 =?utf-8?B?SDE5ck9TNzcrSXRPai9QU2tDNG9BZnNZV3Jkbld3L1N2aVdvU1MweUpnQjlD?=
 =?utf-8?B?dCtLeGltdmRHRGFxa2prUlBuRWJWOFRsUk4vczhMTklMeUtlOVZXOGI3U1FM?=
 =?utf-8?B?SndwSXpyMVgzUFhPVjUzVDkrY2dwNlpVNTg3d1o0MzlhNEo5UzV5OU5MS2lt?=
 =?utf-8?B?cDdVWGtJTkp2dG9Sa09yaEhnMmZIZi9zSkhrYmNTYWcrNFZxeVhBNU05K0Vo?=
 =?utf-8?B?bUVTMDJXZzZIVTNzR2h5RFluU1BWWk1HdEtLeEdJcGYraVRldTc5VHN1MzlG?=
 =?utf-8?B?OFVTK1BrZjVFN0ErL2VhZ1hMdjBJZ2kxdnBzbXBTK2VoL1kzSFV0RHBVbC9X?=
 =?utf-8?B?cGZSdmdYbElkQTVtTjZueVV3SWdpaitNWDVWZEpyRTBXZ1pCYmZYSjQzV255?=
 =?utf-8?B?RDF4Smcrek1HSDU0TWUxY3E0V1BJQStvRFpPMFBkVm9QTW9uZ1RuSnRxS0FH?=
 =?utf-8?B?SnY5bW4vTzFURnhtUE1rVkYrV0VCd1B4NWVSNFQ2SFM5dlorVlZ5Ylg1RU1D?=
 =?utf-8?B?QkJUU1BnaC8vYUJNWjgyNHhFSUN0L2J4cFZQTXlQeFJnVTV1RHhyRFZoN0hJ?=
 =?utf-8?B?Qk51OUdnSks0RVB0bTZQbDJXUXBXUjBpdUs5dDRZQmd1QVBHa0R1NVNQUjJh?=
 =?utf-8?B?MW1ZTFFRamdVSXJ1WmIxYnZoZTVzRkF5VmJrMW1NSGhhcExTMzdpMnR0aExk?=
 =?utf-8?B?ekhUTzI0U3JhZUNIc3g3L0RYTUMzSjZYWk8wa2tndVZ6YUYvSit1MURWbWU2?=
 =?utf-8?B?cHdjZXNzNmxCNXVUQVN2NktIRUt3RE1aVHdVK09pZE9sR1oyb0tpRkFCN2Iw?=
 =?utf-8?B?ZHhVLzN2TWgyNDI5STA5SHhwclFEaXhxdjN4TmxuMmkraWVhQ3h5YWc5ZGpY?=
 =?utf-8?B?SVZiMUNlQkhpT21MaDNlNitsQ3M3VHo4NXJubDBrUndXaE5NSzAzcnQwVG5i?=
 =?utf-8?B?NlpkSWxlOVlBbGJQUG9teU1jRHpZQWNBTzRKN0dhUGpDVUFBbDdhQnpRdFlP?=
 =?utf-8?B?cW5vQWZDbjFoNzJRR3E2M29WTDZkSHlTS3A5R2tMNzhzWWRSWmRsM3Z6Vmw4?=
 =?utf-8?B?cUlidjRLSjlVQjBsN00xdXJtYVlNbThzaXRhcGVmUWsxY3JJbnAyNm1sbzhQ?=
 =?utf-8?B?Z2pOcHRYOUJqZ2NROGVhUGYvV2dBTzJZWUVxUHNVWnY4bFVwMURZVlkxc1RP?=
 =?utf-8?B?TTVhQ09rRTNPNVFaQXN3Yzh0Q2JXZUxnaXdzbys3QWJ4TmV5RExEV2NBQ25j?=
 =?utf-8?B?bnlvWFI0QnVIOWhYSzZ5TmxwMXowQVNCamlGTUltS05ZcjZnT0RPL3NnOGN3?=
 =?utf-8?B?MUxJZGxGZUlBSVFYU0tiZitXMVNIcEx1VmJWMG9OZVkyVnZhVjhnNDBHKy8x?=
 =?utf-8?B?Qi9FS0VKSWQ1R3JlNHk3QVFOYWhUNzU5alJPTm5zSk1XWXA5UDkzKzFQSzVJ?=
 =?utf-8?B?cEZlTzZBN3Yzc3l2MmVhMkREVVY2UzZ3akFRSkI5bDNmOHBNTXVQdC9oVk9I?=
 =?utf-8?B?WEJUbXhPekE1eURScnRHbmY3cUo4LzNTanMrcmFuc2pHdk5KMjh2cDh4UzJK?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b6fc8b5-4472-4c9b-6047-08dbb324fdf4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 00:12:46.4951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: esAOIVRYGmCUVm3Y2GQk4W3xnQXsjspgJN9PZYj4mzlZqF09w/op2XVjEr82RgBG9TYc5QPldZGZYAIrge9kGcoheWUxbKokIqmYrXCbLv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5466
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/uc: Fix uC status tracking
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

On 9/11/2023 17:03, Daniele Ceraolo Spurio wrote:
> On 9/11/2023 4:54 PM, John Harrison wrote:
>> On 8/2/2023 14:26, Daniele Ceraolo Spurio wrote:
>>> The current uC status tracking has a few issues:
>>>
>>> 1) the HuC is moved to "disabled" instead of "not supported"
>>>
>>> 2) the status is left uninitialized instead of "disabled" when the
>>>     modparam is used to disable support
>>>
>>> 3) due to #1, a number of checks are done against "disabled" instead of
>>>     the appropriate status.
>>>
>>> Address all of those by making sure to follow the appropriate state
>>> transition and checking against the required state.
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_guc.c   |  3 +++
>>>   drivers/gpu/drm/xe/xe_huc.c   | 15 +++++++--------
>>>   drivers/gpu/drm/xe/xe_uc.c    | 10 +++++++---
>>>   drivers/gpu/drm/xe/xe_uc_fw.c | 14 ++++++++------
>>>   drivers/gpu/drm/xe/xe_wopcm.c |  3 +--
>>>   5 files changed, 26 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> index 2493c5859948..7cef5dcf571e 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -228,6 +228,9 @@ int xe_guc_init(struct xe_guc *guc)
>>>       if (ret)
>>>           goto out;
>>>   +    if (!xe_uc_fw_is_enabled(&guc->fw))
>>> +        return 0;
>>> +
>>>       ret = xe_guc_log_init(&guc->log);
>>>       if (ret)
>>>           goto out;
>>> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
>>> index 177cda14864e..35e2fdd07f69 100644
>>> --- a/drivers/gpu/drm/xe/xe_huc.c
>>> +++ b/drivers/gpu/drm/xe/xe_huc.c
>>> @@ -42,22 +42,21 @@ int xe_huc_init(struct xe_huc *huc)
>>>       if (ret)
>>>           goto out;
>>>   +    if (!xe_uc_fw_is_enabled(&huc->fw))
>>> +        return 0;
>>> +
>>>       xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_LOADABLE);
>>>         return 0;
>>>     out:
>>> -    if (xe_uc_fw_is_disabled(&huc->fw)) {
>>> -        drm_info(&xe->drm, "HuC disabled\n");
>>> -        return 0;
>>> -    }
>>>       drm_err(&xe->drm, "HuC init failed with %d", ret);
>>>       return ret;
>>>   }
>>>     int xe_huc_upload(struct xe_huc *huc)
>>>   {
>>> -    if (xe_uc_fw_is_disabled(&huc->fw))
>>> +    if (!xe_uc_fw_is_loadable(&huc->fw))
>>>           return 0;
>>>       return xe_uc_fw_upload(&huc->fw, 0, HUC_UKERNEL);
>>>   }
>>> @@ -69,7 +68,7 @@ int xe_huc_auth(struct xe_huc *huc)
>>>       struct xe_guc *guc = huc_to_guc(huc);
>>>       int ret;
>>>   -    if (xe_uc_fw_is_disabled(&huc->fw))
>>> +    if (!xe_uc_fw_is_loadable(&huc->fw))
>>>           return 0;
>>>         XE_WARN_ON(xe_uc_fw_is_running(&huc->fw));
>>> @@ -106,7 +105,7 @@ int xe_huc_auth(struct xe_huc *huc)
>>>     void xe_huc_sanitize(struct xe_huc *huc)
>>>   {
>>> -    if (xe_uc_fw_is_disabled(&huc->fw))
>>> +    if (!xe_uc_fw_is_loadable(&huc->fw))
>>>           return;
>>>       xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_LOADABLE);
>>>   }
>>> @@ -118,7 +117,7 @@ void xe_huc_print_info(struct xe_huc *huc, 
>>> struct drm_printer *p)
>>>         xe_uc_fw_print(&huc->fw, p);
>>>   -    if (xe_uc_fw_is_disabled(&huc->fw))
>>> +    if (!xe_uc_fw_is_enabled(&huc->fw))
>>>           return;
>>>         err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>>> index addd6f2681b9..368e4feb57db 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc.c
>>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>>> @@ -31,9 +31,10 @@ int xe_uc_init(struct xe_uc *uc)
>>>   {
>>>       int ret;
>>>   -    /* GuC submission not enabled, nothing to do */
>>> -    if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
>>> -        return 0;
>>> +    /*
>>> +     * We call the GuC/HuC init functions even if GuC submission is 
>>> off to
>>> +     * correctly move our tracking of the FW state to "disabled".
>>> +     */
>>>         ret = xe_guc_init(&uc->guc);
>>>       if (ret)
>>> @@ -43,6 +44,9 @@ int xe_uc_init(struct xe_uc *uc)
>>>       if (ret)
>>>           goto err;
>>>   +    if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
>>> +        return 0;
>>> +
>>>       ret = xe_wopcm_init(&uc->wopcm);
>>>       if (ret)
>>>           goto err;
>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>>> index 2e70dd4880f6..fd53ef9e5c99 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>> @@ -339,17 +339,19 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>>>       XE_WARN_ON(uc_fw->path);
>>>         uc_fw_auto_select(xe, uc_fw);
>>> -    xe_uc_fw_change_status(uc_fw, uc_fw->path ? *uc_fw->path ?
>>> +    xe_uc_fw_change_status(uc_fw, uc_fw->path ?
>>>                      XE_UC_FIRMWARE_SELECTED :
>>> -                   XE_UC_FIRMWARE_DISABLED :
>>>                      XE_UC_FIRMWARE_NOT_SUPPORTED);
>>>   -    /* Transform no huc in the list into firmware disabled */
>>> -    if (uc_fw->type == XE_UC_FW_TYPE_HUC && 
>>> !xe_uc_fw_is_supported(uc_fw)) {
>>> +    if (!xe_uc_fw_is_supported(uc_fw))
>>> +        return 0;
>>> +
>>> +    if (!xe_device_guc_submission_enabled(xe)) {
>> This is generic code for all firmware types. So why specifically 
>> check for GuC submission? Can't we still load the HuC even with GuC 
>> submission disabled?
>
> This is an unfortunately named function that is not actually GuC (or 
> even submission) specific, but it is actually used to track usage of 
> all FWs and related features (see e.g. xe_uc_init). I agree that it 
> could be renamed, but that's out of scope for this patch.
I would argue that correct naming of functions is a critical 
requirement. Otherwise it makes it impossible to understand what the 
code is doing! Either when developing or when reviewing patches.

John.

> Note that there is no way in Xe to load HuC without GuC submission, 
> nor there is a plan to add it AFAIK, and even this existing switch is 
> only there to turn off the FWs for debug.
>
> Daniele
>
>>
>> John.
>>
>>>           xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
>>> -        err = -ENOPKG;
>>> -        return err;
>>> +        drm_dbg(&xe->drm, "%s disabled", 
>>> xe_uc_fw_type_repr(uc_fw->type));
>>> +        return 0;
>>>       }
>>> +
>>>       err = request_firmware(&fw, uc_fw->path, dev);
>>>       if (err)
>>>           goto fail;
>>> diff --git a/drivers/gpu/drm/xe/xe_wopcm.c 
>>> b/drivers/gpu/drm/xe/xe_wopcm.c
>>> index 9a85bcc18830..bf85d4fa56cc 100644
>>> --- a/drivers/gpu/drm/xe/xe_wopcm.c
>>> +++ b/drivers/gpu/drm/xe/xe_wopcm.c
>>> @@ -139,8 +139,7 @@ static int __wopcm_init_regs(struct xe_device 
>>> *xe, struct xe_gt *gt,
>>>   {
>>>       u32 base = wopcm->guc.base;
>>>       u32 size = wopcm->guc.size;
>>> -    u32 huc_agent = xe_uc_fw_is_disabled(&gt->uc.huc.fw) ? 0 :
>>> -        HUC_LOADING_AGENT_GUC;
>>> +    u32 huc_agent = xe_uc_fw_is_available(&gt->uc.huc.fw) ? 
>>> HUC_LOADING_AGENT_GUC : 0;
>>>       u32 mask;
>>>       int err;
>>
>

