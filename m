Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1E0C27C40
	for <intel-xe@archiver.kernel.org>; Thu, 24 Aug 2023 18:12:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306B010E5A5;
	Thu, 24 Aug 2023 18:12:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C701310E5AA
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Aug 2023 18:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692900775; x=1724436775;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gd5nCCLGKECKQ+jyJihMsaAcUrsCogyiCgfhRDSMmDg=;
 b=g8M113eM6AQzOdipeLoNzQ0eWBWD8axd1tE/xUD79fyCYEgL5ZnA0IcF
 lhhN3G1iinKdibYBIKxWOYdgexgeeQwwI3/gmLtqqfhC4ewijalLJ/eS3
 MsuheCVe+EbXrEvRe0RFNj7MX0N0fiQ/y/+Wl3FSOJkVLfywHQ2hY6UvZ
 cKMPTrumHHd70xCZOwrAn/YQYS1tNGDUhiHyiETUgWqL36VFWUQfvWmNm
 ODH18d09wE+efB4Z6wqt9hJPyjqEXJhuBLnyfUwa01uthxuX3b0INc+A8
 RGvO8+2lMbys+k83xL5ngNK1uJo/rCfMLWj63WO063dKLOK8IDNotGRJH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="354847328"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="354847328"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 11:12:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="686991596"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="686991596"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 24 Aug 2023 11:12:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 11:12:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 11:12:54 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 24 Aug 2023 11:12:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFHTkwUq7Om+WPKrmGy+J2rUn69hOuxTwuotbTrtqfbI/VMYZJkFuGMWVrgE1TSgM7ZCf66MAS9QV26v8/YAzmx+7L6qZVB1D/lMa4vpedf+KjGmCoThwvpYwWnvIFYYuWzt622yrX4Q4sifQJvSjwg0NXQtv+TgyPeyJpellB5JEsgmA90CZIVm7hqqk2cEDyIqiEhByVuNzw7lepkB/FWMUM+cr5ZueHgIKQgmYvlk2U4NxqZO3J9GYqyHKXB4dDTch/L2DpdLQM1WbwVWsfA5ZK32XjmT+cCFSTU/iETKQBdUlozwgGGPRPOdx9cNhjjKorYgSQ1x9dQNK4Svzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iidfDJP8uGsEd7c98YQ7XG1LAkHOUePscrim9eErjsc=;
 b=VRPTdeidDYbFN1Aa4Hp3gDRtoWXyw3jg18A5jEUxOdRdT/PeatIZLGmDXrxCGPKSla0M67sZbTPx+OUZYxsft+xw/+UwiTp50r3FoxUaBgDey8tQWnzQUiV6Pc0ZHT478XppCtV1d6dkyOgKp3ZsYouKmr+3quxVR+HSqzqPjCTULnPbhDy9aqnOiLrfy/D5f+qI4lxQ+ezICgJHqYU1U4wuWg8c1e65Peo4zEVXkoRW1KoWjd/2lbpI9rnYaxMfNyKiioURvAPPy7Cn+/R9BDvc/YrnuTEqmExQnXEMLD2hQfSAY8cFGakmFTDUdtDKVQExSFqteP3Yqu3CJT/Jxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH0PR11MB7541.namprd11.prod.outlook.com (2603:10b6:510:26d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 18:12:51 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::4b20:e34:71f:139f]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::4b20:e34:71f:139f%4]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 18:12:51 +0000
Message-ID: <304cb901-9f6c-a48f-24f9-5f90ed05d3f0@intel.com>
Date: Thu, 24 Aug 2023 11:12:49 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230816215515.1506619-1-daniele.ceraolospurio@intel.com>
 <0e3b90bf-ce74-bd2b-e62a-8a5a37e8b39c@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <0e3b90bf-ce74-bd2b-e62a-8a5a37e8b39c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0082.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::23) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH0PR11MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dc9816a-7352-4442-c16d-08dba4cdbae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sZHLFnHBj46bhwwctgRMpQv3EVP0rseK4IkwfqeE0TUXX8pml5oce9lO3sVFfcndtLGnuj6jq36o9d6OKGK3gylXUXCHxIgiaaTnqPDgHkeivNY2ySEXL/ZzMRDvOB9hE/ismYDpPXr7p48ouqIe+zgvUE3Y8GomeLZl11A79pZmsN6oVjtArVScErTc8fxl1LNSIrcDPnmVz7FbDbsqyayKyz0lC1lDGVgTG94PE5WMMzXLExPKEqFmlr8aB8Qin2zCbH4iqm3XypW3+nlmSzy0XF/UTJSsZkGhgZc0N6DReQ8co+fBvD9M3vIV+zu29DdjihI/Pa1FZKJ1uSAJCxoXNcjglaTAFqJKucJdviyTdI+YcdYrTyHzZ0ZobUU0keIL4hh1DDFeOIoxoGuhpn+mLaSozylpPvIqrT3LJ9HCi8RTP3PhynNdmZLA3IaIvG9pWh67f9C6+VMKBKl3h9Iel+EuH2dTdD50dFQFCQ0Wsv0mGapMpfk1Sy5AqEPmSUsauiIcQj4k+PvXwuieSPKkI+PmXWZdtW5jp6aWjPwABAO3llumv3gvSe47KzS+3xIuPveFjTHNXDH93jHug6N8NrAJ/rSNWeqEu6n7ID9385H5zY4lp6fG6xP7I/5boyeAzVoVvvK0HITSVtFsMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(396003)(366004)(136003)(346002)(186009)(1800799009)(451199024)(2616005)(5660300002)(107886003)(8936002)(4326008)(8676002)(36756003)(30864003)(83380400001)(26005)(38100700002)(82960400001)(66556008)(66946007)(66476007)(6506007)(54906003)(316002)(478600001)(31686004)(53546011)(41300700001)(2906002)(6512007)(86362001)(6486002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R004WjlBaldNUDRIVzVKZ2dnZGVRTDQ5M2dkdkI5eTVFWldtaUVNUnRWQ0Jy?=
 =?utf-8?B?VGZCWXo5UFRpeGRuNUZtTGs1VnNHeHZNaHl2MjN4eFo1TzFEWDh5bit3by8v?=
 =?utf-8?B?VnZaNUdOdE8vWW1BVDZ3aXdidlMvZEVsckJMVms5dmxoMDJ4R3ZhWjJqSEJs?=
 =?utf-8?B?aXhZenloQk1EMjZMQ1krY2xVYlBQVzlEb0dTMDhrQ25iTWJzMzZmS21NeWFn?=
 =?utf-8?B?MFNqUnhuMi84SS9rRFB2SVRoeTdDTzFFK1lNeUVBbVBqTmhJOHdwK1ZqTVpw?=
 =?utf-8?B?NGljNVozUjVrVC9jdTJObCsyQ0UyUi9oRFFadUFNd0FhSmlnTENsTklGUUNO?=
 =?utf-8?B?OEd3TElWaHRPL2lpNzYvVzByaTRMVXZWVW4wVE5HMGZDRjdRb3ppcitVVTd0?=
 =?utf-8?B?NVdWVmp2R2JXV3pldEJRLzVMWUpQOG9rdFRSY3FlRzBhUmsvU21nL3M0UlQx?=
 =?utf-8?B?cCtoeVZmb2xNbjZ4S1pKOGpJMlZJOXhqT2lQaEtnK0lJRHlPZ1Jnbko4UzBZ?=
 =?utf-8?B?cXljM1ArT3JoM1FERVg4V3BFVHc3dnNYaDlSRmwrY1BFTytOeTJTMXZDM2dv?=
 =?utf-8?B?VGcxdkJ3M0J2bFBJSnBxZGVUTmo2eG1TaUdPZXNtQWtDYng0M1RuQUVUQTJk?=
 =?utf-8?B?WkNNRnJHSnowRjRKUytMQ0tpS3B4OWxKdjI2UDd3Q1Y1RFZETWQxczdNd05k?=
 =?utf-8?B?anV4S0dFRTE0MTlmaDNGV2s0MWtSRlJmRTJPV3UwYVRmVnRoSXk5NEFQRWpR?=
 =?utf-8?B?bFZWY0tWMkhCU1BwcVZvWWx3dVp0T05DUk9VTzdEdHlnUjh0b0ppWUVaMFRn?=
 =?utf-8?B?UkdkN3lZazIrVWswRUY0WGYxa2dpTFh5ZktFQk03NGl2Wk11V2svNG5uMkg4?=
 =?utf-8?B?STNnYm5wVHhmcEFYSVpNdUZ1NnBMa3VmR29ZOWlkdEVraE1XMXJmT0tGcXdR?=
 =?utf-8?B?aFhpRWhqWkxpMXhOaGhiSXJvcmJ1dE8wU0dTVG9uc3BwbDFFMTkwV2crbnlL?=
 =?utf-8?B?VHo2UnlKZnhWb0czelZPTi81T3hEVmlJaFB5MVNlZmpGb1ZWbzZhaUl1MEE4?=
 =?utf-8?B?Q2tRL0lBVlhKQjhPRTNuc1lJYkhRMHpxQUd3aHczVm9pcDBSZ0E1WHM4N3N5?=
 =?utf-8?B?VTNiY2NCY2wxMlNWb0VnZmlNZ3RwU2t4bkQ0TzBaUU96YVF1aFJBcWM4d2Ir?=
 =?utf-8?B?WDNlZU82Z2pJNUQyYnFGazk1elZDQTB4UnJhU200UGpkdTRGNm96QTZBKyta?=
 =?utf-8?B?YW52TFF0SzN4Ynovc3RjWEIwNE5QM0Nia0hkbHNuZy9QVkNMbzJGaDlxWVgy?=
 =?utf-8?B?bFNSQ3ltQmh5WUpMcFdlbzFodGxmZ2pJcGpyTVViSWtHM1Z0bEREWDNCQnRP?=
 =?utf-8?B?MTU1dEduWlM3N3ZZUCsyT0VQVWJpQVI5Z3VMblB4SFZGeDcrdzBNUm8yQ0Vq?=
 =?utf-8?B?Zld6dXkrVjZsYlg4YXZPTERHbExvUCsyQWRkcysxclVOWFdxdEpvdERMdERv?=
 =?utf-8?B?bi9QekROa3Q2YW1xVGduQy96RUowdHR4TFBlS2x4eSt1L2ZjejNEcmo1MlFU?=
 =?utf-8?B?NDQ0RUJpQnJQU3JBb1QzdHR1dkd0TXFHSGNJNElBM2FFNElxK2lIMVkvV1FS?=
 =?utf-8?B?MlpCNGlCRXNrWENydlFRK0N6NFNuWlZkMDVLNVl1bVdsSzd1cTd2SnVLOVh6?=
 =?utf-8?B?aGF6UGFaUVg5WnQxZjlUQlROZVZpQklCbkFHMXlWUGVRaUtrbithV2VMNUIv?=
 =?utf-8?B?L2lwN0Q5WVZMd09xVy9WNDFpMWlMUHBaV1RCSGJBdjhBSGxGWXQxWFZ2NVBx?=
 =?utf-8?B?bm1yNVAya2RSUFlvUkRDR3hFbmhsb2hUOExXQTBEZkppWjhNRVg5d2JodE5P?=
 =?utf-8?B?K2labzVlOGhCbTJSWjIxQkhjczkwVkhVekpIQlBqMDhVTzVxWkY0VmI1K2xo?=
 =?utf-8?B?MVdCb0p3dWNCYnFjc2hRTy9ITFdxMW85VUUzQXFzdjExWitINWZhbG44cTY3?=
 =?utf-8?B?Q1lheTFuemZXZWhhN2YzeHBTR1pYRlpSYkpsV0FTVjR4ZFFUYnkra0NCSXJM?=
 =?utf-8?B?MmpUYVY0RlFJSWRicTh1QXNNOFd3ckhQRStJb0s0cWlBeVBSVERHVkp1bXVX?=
 =?utf-8?B?bnk0d2ZrSWNmYlcvS2N6TWxpbTl1OHRlREtwRyt5N0g2MGRJNXFQNTd6SGIr?=
 =?utf-8?Q?qXLnhU+OqVtFwmZKZJkLY38=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc9816a-7352-4442-c16d-08dba4cdbae0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 18:12:51.4814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aFnRAKTYCtr+z2eU9AOaHQDqh2/MxcXtuDl7/DI2RTGaA0vSKPiiXH1s2HLFO4JarKXp9AomgHs0C+xc0qsTWuh6GLknDri0G7NvfFLeSas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7541
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC] drm/xe/uc: rework uC version tracking
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
Cc: =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 8/24/2023 11:00 AM, John Harrison wrote:
> On 8/16/2023 14:55, Daniele Ceraolo Spurio wrote:
>> The GSC firmware, support for which is coming soon for Xe, has both a
>> release version (updated on every release) and a compatibility version
>> (update only on interface changes). The GuC has something similar, with
>> a global release version and a submission version (which is also known
>> as the VF compatibility version). The main difference is that for the
>> GuC we still want to check the driver requirement against the release
>> version, while for the GSC we'll need to check against the compatibility
>> version.
>> Instead of special casing the GSC, this patch proposes a rework of the
>> FW logic so that we store both versions at the uc_fw level for all
>> binaries and we allow checking against either of the versions. 
>> Initially,
>> we'll use it to support GSC, but the logic could be re-used to allow VFs
>> to check against their expected GuC compatibility version.
>>
>> RFC note: I've added a couple of the GSC defines to show how this is
>> supposed to be different for the GSC, but those are not intended to be
>> part of this patch in its final version. I'd like to get some early
>> feedback on this before I build the full GSC version checking on top of
>> it.
> Seems plausible to me.
>
> Some comments below, mostly not actually related to this patch...
>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Michał Winiarski <michal.winiarski@intel.com>
>> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_types.h   |   9 --
>>   drivers/gpu/drm/xe/xe_uc_fw.c       | 131 +++++++++++++++++-----------
>>   drivers/gpu/drm/xe/xe_uc_fw.h       |   2 +
>>   drivers/gpu/drm/xe/xe_uc_fw_types.h |  36 ++++++--
>>   4 files changed, 108 insertions(+), 70 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h 
>> b/drivers/gpu/drm/xe/xe_guc_types.h
>> index a5e58917a499..343cc39ce5bc 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
>> @@ -52,15 +52,6 @@ struct xe_guc {
>>               /** @seqno: suspend fences seqno */
>>               u32 seqno;
>>           } suspend;
>> -        /** @version: submission version */
>> -        struct {
>> -            /** @major: major version of GuC submission */
>> -            u32 major;
>> -            /** @minor: minor version of GuC submission */
>> -            u32 minor;
>> -            /** @patch: patch version of GuC submission */
>> -            u32 patch;
>> -        } version;
>>           /** @enabled: submission is enabled */
>>           bool enabled;
>>       } submission_state;
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index 2e70dd4880f6..e22afd65e5d6 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -201,9 +201,15 @@ uc_fw_auto_select(struct xe_device *xe, struct 
>> xe_uc_fw *uc_fw)
>>       for (i = 0; i < count && p <= entries[i].platform; i++) {
>>           if (p == entries[i].platform) {
>>               uc_fw->path = entries[i].path;
>> -            uc_fw->major_ver_wanted = entries[i].major;
>> -            uc_fw->minor_ver_wanted = entries[i].minor;
>> +            uc_fw->versions.wanted.major = entries[i].major;
>> +            uc_fw->versions.wanted.minor = entries[i].minor;
>>               uc_fw->full_ver_required = entries[i].full_ver_required;
>> +
>> +            if (uc_fw->type == XE_UC_FW_TYPE_GSC)
>> +                uc_fw->versions.wanted_type = 
>> XE_UC_FW_VER_COMPATIBILITY;
>> +            else
>> +                uc_fw->versions.wanted_type = XE_UC_FW_VER_RELEASE;
>> +
>>               break;
>>           }
>>       }
>> @@ -245,33 +251,30 @@ static void uc_fw_fini(struct drm_device *drm, 
>> void *arg)
>>     static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct 
>> uc_css_header *css)
>>   {
>> -    struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>> -    struct xe_guc *guc = &gt->uc.guc;
>> +    struct xe_uc_fw_version *release = 
>> &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>> +    struct xe_uc_fw_version *compatibility = 
>> &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
>>         XE_WARN_ON(uc_fw->type != XE_UC_FW_TYPE_GUC);
>> -    XE_WARN_ON(uc_fw->major_ver_found < 70);
>> +    XE_WARN_ON(release->major < 70);
> Is this supposed to be a WARN_ON? There is no need for kernel stack 
> traces and such just because the user has supplied a dodgy firmware 
> file. Shouldn't it just be a gt_warn() same as the other firmware load 
> errors?

I think a bunch of those used to be XE_BUG_ON and got mass converted to 
XE_WARN_ON when XE_BUG_ON was removed from the driver. I believe the 
plan is to re-evaluate them and check which ones need to be WARN and 
which ones don't.

>
>>   -    if (uc_fw->minor_ver_found >= 6) {
>> +    if (release->major > 70 || release->minor >= 6) {
>>           /* v70.6.0 adds CSS header support */
>> -        guc->submission_state.version.major =
>> -            FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
>> -                  css->submission_version);
>> -        guc->submission_state.version.minor =
>> -            FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>> -                  css->submission_version);
>> -        guc->submission_state.version.patch =
>> -            FIELD_GET(CSS_SW_VERSION_UC_PATCH,
>> -                  css->submission_version);
>> -    } else if (uc_fw->minor_ver_found >= 3) {
>> +        compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
>> +                         css->submission_version);
>> +        compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>> +                         css->submission_version);
>> +        compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
>> +                         css->submission_version);
>> +    } else if (release->minor >= 3) {
>>           /* v70.3.0 introduced v1.1.0 */
>> -        guc->submission_state.version.major = 1;
>> -        guc->submission_state.version.minor = 1;
>> -        guc->submission_state.version.patch = 0;
>> +        compatibility->major = 1;
>> +        compatibility->minor = 1;
>> +        compatibility->patch = 0;
>>       } else {
>>           /* v70.0.0 introduced v1.0.0 */
>> -        guc->submission_state.version.major = 1;
>> -        guc->submission_state.version.minor = 0;
>> -        guc->submission_state.version.patch = 0;
>> +        compatibility->major = 1;
>> +        compatibility->minor = 0;
>> +        compatibility->patch = 0;
> Do we need any of this in Xe? There is no need for Xe to support GuC 
> versions that were obsoleted while Xe was/is still in pre-release state.

We definitely need the 70.3 check, since we're still using 70.5 for most 
platforms.

>
>>       }
>>         uc_fw->private_data_size = css->private_data_size;
>> @@ -280,30 +283,31 @@ static void guc_read_css_info(struct xe_uc_fw 
>> *uc_fw, struct uc_css_header *css)
>>   static int uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
>>   {
>>       struct xe_device *xe = uc_fw_to_xe(uc_fw);
>> +    struct xe_uc_fw_version *wanted = &uc_fw->versions.wanted;
>> +    struct xe_uc_fw_version *found = 
>> &uc_fw->versions.found[uc_fw->versions.wanted_type];
> Need some kind of range check BUG_ON thing here?

For the array? It should be impossible to get wrong, since the 
wanted_type is set at select time.

>
>>         /* Driver has no requirement on any version, any is good. */
>> -    if (!uc_fw->major_ver_wanted)
>> +    if (!wanted->major)
>>           return 0;
>>         /*
>>        * If full version is required, both major and minor should match.
>>        * Otherwise, at least the major version.
>>        */
>> -    if (uc_fw->major_ver_wanted != uc_fw->major_ver_found ||
>> -        (uc_fw->full_ver_required &&
>> -         uc_fw->minor_ver_wanted != uc_fw->minor_ver_found)) {
>> +    if (wanted->major != found->major ||
>> +        (uc_fw->full_ver_required && wanted->minor != found->minor)) {
>>           drm_notice(&xe->drm, "%s firmware %s: unexpected version: 
>> %u.%u != %u.%u\n",
> Does Xe not have gt_notice and friends?

it does, but not all files have been converted over yet.

>
>> xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>> -               uc_fw->major_ver_found, uc_fw->minor_ver_found,
>> -               uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted);
>> +               found->major, found->minor,
>> +               wanted->major, wanted->minor);
>>           goto fail;
>>       }
>>   -    if (uc_fw->minor_ver_wanted > uc_fw->minor_ver_found) {
>> +    if (wanted->minor > found->minor) {
>>           drm_notice(&xe->drm, "%s firmware (%u.%u) is recommended, 
>> but only (%u.%u) was found in %s\n",
>>                  xe_uc_fw_type_repr(uc_fw->type),
>> -               uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted,
>> -               uc_fw->major_ver_found, uc_fw->minor_ver_found,
>> +               wanted->major, wanted->minor,
>> +               found->major, found->minor,
>>                  uc_fw->path);
>>           drm_info(&xe->drm, "Consider updating your linux-firmware 
>> pkg or downloading from %s\n",
>>                XE_UC_FIRMWARE_URL);
>> @@ -325,6 +329,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>>       struct xe_tile *tile = gt_to_tile(gt);
>>       struct device *dev = xe->drm.dev;
>>       const struct firmware *fw = NULL;
>> +    struct xe_uc_fw_version *release = 
>> &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>>       struct uc_css_header *css;
>>       struct xe_bo *obj;
>>       size_t size;
>> @@ -395,15 +400,13 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>>       }
>>         /* Get version numbers from the CSS header */
>> -    uc_fw->major_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
>> -                       css->sw_version);
>> -    uc_fw->minor_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>> -                       css->sw_version);
>> +    release->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, 
>> css->sw_version);
>> +    release->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, 
>> css->sw_version);
>> +    release->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, 
>> css->sw_version);
>>         drm_info(&xe->drm, "Using %s firmware (%u.%u) from %s\n",
>>            xe_uc_fw_type_repr(uc_fw->type),
>> -         uc_fw->major_ver_found, uc_fw->minor_ver_found,
>> -         uc_fw->path);
>> +         release->major, release->minor, uc_fw->path);
>>         err = uc_fw_check_version_requirements(uc_fw);
>>       if (err)
>> @@ -523,26 +526,50 @@ int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 
>> offset, u32 dma_flags)
>>       return err;
>>   }
>>   +static const char *version_wanted_type_repr(enum 
>> xe_uc_fw_version_types type)
>> +{
>> +    switch (type) {
>> +    case XE_UC_FW_VER_RELEASE:
>> +        return "release version wanted";
>> +    case XE_UC_FW_VER_COMPATIBILITY:
>> +        return "compatibility version wanted";
>> +    default:
>> +        return "Unknown version type wanted";
>> +    }
>> +}
>> +
>> +static void print_uc_version(struct drm_printer *p, const char 
>> *prefix, struct xe_uc_fw_version *version)
>> +{
>> +    if (version->build)
>> +        drm_printf(p, "\t%s %u.%u.%u.%u\n",
>> +               prefix, version->major, version->minor,
>> +               version->patch, version->build);
>> +    else
>> +        drm_printf(p, "\t%s %u.%u.%u\n",
>> +               prefix, version->major, version->minor,
>> +               version->patch);
>> +}
>>     void xe_uc_fw_print(struct xe_uc_fw *uc_fw, struct drm_printer *p)
>>   {
>> +    struct xe_uc_fw_version *wanted = &uc_fw->versions.wanted;
>> +    struct xe_uc_fw_version *release = 
>> &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>> +    struct xe_uc_fw_version *compatibility = 
>> &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
>> +
>>       drm_printf(p, "%s firmware: %s\n",
>>              xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
>>       drm_printf(p, "\tstatus: %s\n",
>>              xe_uc_fw_status_repr(uc_fw->status));
>> -    drm_printf(p, "\tversion: wanted %u.%u, found %u.%u\n",
>> -           uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted,
>> -           uc_fw->major_ver_found, uc_fw->minor_ver_found);
>> -    drm_printf(p, "\tuCode: %u bytes\n", uc_fw->ucode_size);
>> -    drm_printf(p, "\tRSA: %u bytes\n", uc_fw->rsa_size);
>> -
>> -    if (uc_fw->type == XE_UC_FW_TYPE_GUC) {
>> -        struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>> -        struct xe_guc *guc = &gt->uc.guc;
>> -
>> -        drm_printf(p, "\tSubmit version: %u.%u.%u\n",
>> -               guc->submission_state.version.major,
>> -               guc->submission_state.version.minor,
>> -               guc->submission_state.version.patch);
>> -    }
>> +    print_uc_version(p, 
>> version_wanted_type_repr(uc_fw->versions.wanted_type), wanted);
>> +
>> +    if (release->major)
>> +        print_uc_version(p, "release version found", release);
>> +
>> +    if (compatibility->major)
>> +        print_uc_version(p, "compatibility version found", 
>> compatibility);
> These two prints could be done with a for loop.
>
>> +
>> +    if (uc_fw->ucode_size)
>> +        drm_printf(p, "\tuCode: %u bytes\n", uc_fw->ucode_size);
>> +    if (uc_fw->rsa_size)
>> +        drm_printf(p, "\tRSA: %u bytes\n", uc_fw->rsa_size);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h 
>> b/drivers/gpu/drm/xe/xe_uc_fw.h
>> index a519c77d4962..1b5bbbb97aaf 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.h
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.h
>> @@ -96,6 +96,8 @@ static inline const char *xe_uc_fw_type_repr(enum 
>> xe_uc_fw_type type)
>>           return "GuC";
>>       case XE_UC_FW_TYPE_HUC:
>>           return "HuC";
>> +    case XE_UC_FW_TYPE_GSC:
>> +        return "GSC";
>>       }
>>       return "uC";
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h 
>> b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>> index 837f49a2347e..69d3f2446781 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>> @@ -55,10 +55,27 @@ enum xe_uc_fw_status {
>>     enum xe_uc_fw_type {
>>       XE_UC_FW_TYPE_GUC = 0,
>> -    XE_UC_FW_TYPE_HUC
>> +    XE_UC_FW_TYPE_HUC,
>> +    XE_UC_FW_TYPE_GSC
>>   };
>>   #define XE_UC_FW_NUM_TYPES 2
>>   +/**
>> + * struct xe_uc_fw_version - Version for XE micro controller firmware
>> + */
>> +struct xe_uc_fw_version {
>> +    u16 major;
>> +    u16 minor;
>> +    u16 patch;
>> +    u16 build;
> Should these be 32bit? The submission version structure that has been 
> removed from above was all 32bit fields as is the corresponding i915 
> structure.

The fields are either 8 or 16 bits wide in the FW headers, so having 16 
here is functionally correct. We could switch it to u32 to be future 
proof, but it's not strictly required right now.

Daniele

>
> John.
>
>> +};
>> +
>> +enum xe_uc_fw_version_types {
>> +    XE_UC_FW_VER_RELEASE,
>> +    XE_UC_FW_VER_COMPATIBILITY,
>> +    XE_UC_FW_VER_TYPE_COUNT
>> +};
>> +
>>   /**
>>    * struct xe_uc_fw - XE micro controller firmware
>>    */
>> @@ -98,14 +115,15 @@ struct xe_uc_fw {
>>        * version required per platform.
>>        */
>>   -    /** @major_ver_wanted: major firmware version wanted by 
>> platform */
>> -    u16 major_ver_wanted;
>> -    /** @minor_ver_wanted: minor firmware version wanted by platform */
>> -    u16 minor_ver_wanted;
>> -    /** @major_ver_found: major version found in firmware blob */
>> -    u16 major_ver_found;
>> -    /** @minor_ver_found: major version found in firmware blob */
>> -    u16 minor_ver_found;
>> +    /** @versions: FW versions wanted and found */
>> +    struct {
>> +        /** @wanted: firmware version wanted by platform */
>> +        struct xe_uc_fw_version wanted;
>> +        /** @wanted_type: type of firmware version wanted (release 
>> vs compatibility) */
>> +        enum xe_uc_fw_version_types wanted_type;
>> +        /** @found: fw versions found in firmware blob */
>> +        struct xe_uc_fw_version found[XE_UC_FW_VER_TYPE_COUNT];
>> +    } versions;
>>         /** @rsa_size: RSA size */
>>       u32 rsa_size;
>

