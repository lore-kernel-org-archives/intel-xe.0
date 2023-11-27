Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFBBC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 03:11:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1154B10E163;
	Mon, 27 Nov 2023 03:11:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359B510E163
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 03:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701054674; x=1732590674;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v8GWOhClQaz84uBdeAkxO0lNG3uLUIuYnsOaniDuCio=;
 b=QIYdgUkbUa7cFScLbAKO1g0+wdRHw7bWNL8e28AEv3MlxnvDuPs2Rtnm
 C31qXf3o4VcIu6hb2MwOJUOTQ045KyoCfoAyaFvPINHqSw7pMxu6JxEvv
 9Fnn81vf+IAF6nQet5rrawzNNyJSdkr+TveH/jOQSy7y5wj1itpIiYoDV
 smtAqRe6c61dArfAk+gNb6TrC57dX9qI1V+MhBOav1RpjaKY4oMwtyuWz
 5pOhIALdN3c2q3UurrrDwh5E1HCmfmbtsmyzTm0R7myznaDup/ngdmb49
 oycK+r9vGhbgUvamKvFRMNOJqBV2a/0rFDf2iIKdCQm2T6mcKmOkvAXxR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="372783806"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; d="scan'208";a="372783806"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2023 19:11:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="9493188"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2023 19:11:13 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 26 Nov 2023 19:11:12 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 26 Nov 2023 19:11:12 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 26 Nov 2023 19:11:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FTCHL1YmZ8jj3QxCp2mY3ilGWEkmyEQrpXsdu1cHjGpPh1N+W9BOVXHehjS9ARbR/gMBTxbP6cOxKm5/YghWvFJ/jrtP9osS/8R9uSBOj+0ATtD1a8bf9TjAzLN9UgTVcI/nA9hwPWY6dUVWTXCzfWCjjjwhZyeLvrDRwXphZDmRjSJoNebzCxS5q7lM/nBrjwmOcFyueO2HhGg16JC2WS7JbTZ8aYVtZcN2n1NA0vEBtRJ+MgiWfeapPpjQR9OM8/az0xklLMB23/OoYhKuGwlRbvGiStMyQwWidS+6LCIg+EDIXT6YdoqTg4sUKSOoUN17UOfvkkH733wluV0lAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7Pcm0IzlWDdQyuW2v3k9hZoWNPx1vTdzIZjUP/8QmA=;
 b=XfC3EV+ou04cLHocOB4aUmIvZpyTvPCQzcYZZYixWlxXqp1JbsX+Zb7SB1DHJ++QmBxyeO7Ldr81Jr86oKye0XuG9RflOn/IVKUXDoCyuMjE/WC9RVdNg0ifiH2IC8JqOgzNOHP1V2zlwqLh/VMTGWiITnzuFlLAUQ4RQPp+N5D3fpquD/FTVY2NErFk0NyJc+LOFcGpq9mf3STSXRKELfmY2AjDrwNJWQ9fqvsgF49T0lCYIn9EfdDk3xEN6xIlfa6nXyNCyFd94iW4OJMxL+RScIJeU7lK/kvuA43Z+2Md+PX0w0ZARntaqtVP9NE/Tsoe6GunkGYeaNXR7SRUeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH7PR11MB6605.namprd11.prod.outlook.com (2603:10b6:510:1b0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 03:11:10 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c%4]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 03:11:09 +0000
Message-ID: <7727e791-88cc-49ae-a195-1ee7e04996ca@intel.com>
Date: Mon, 27 Nov 2023 08:41:03 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20231121100906.3587649-1-himal.prasad.ghimiray@intel.com>
 <20231121100906.3587649-3-himal.prasad.ghimiray@intel.com>
 <CAM0jSHNGO3AKBkH9U7WueNp7dPwT_FLQbD-8e=OtHA3yOrQeZg@mail.gmail.com>
 <CAM0jSHPfO6dm74KbKVUC=gJym8RzFgd9S8U6QJeSTWmW1pr3Sg@mail.gmail.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <CAM0jSHPfO6dm74KbKVUC=gJym8RzFgd9S8U6QJeSTWmW1pr3Sg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::19) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH7PR11MB6605:EE_
X-MS-Office365-Filtering-Correlation-Id: b0c45d27-7d5e-4e14-06cc-08dbeef680fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Vay6SF03SD/36w/cE3bVYX1WtYZHJv2KTaYy6oNaQPQxL6syILyeIwtpQpNaP7PTYrf8jQBWARUvmJ59cZ1WtCbNUrdRIIEfiulDJ2Q3RcYpBYnCJJbljEESj4xDV4xdaHpbnude7VFtA1FqgfnWMOqfL3G0toO8J6zaFhYHPR4Mdvsw0ojdfRKLSr3yYSjBnM3ca2uEGZ7GNxnuebSC1rhwOTo1sra7rsBlNQCe0h2trB4QPHr4j61eEgxGlm5052MiIYdI3EPB0r54XsKc0+dqA1G8iBYzVDYzuc2Hjrg/3bqPMxSDIW/4ghvtO2K1DHF7P69KKPbB6U5GTYRuOV15JMJyErRdnt2XuNf7E05KSKbaVrkXhQDdDpiIkk1fXR/knJknECwOWdJnRTefOaly9Ju53RmXf2960gJApmW9CufOgfGlB7KtEDtAH1aO2EPilfzeFaetAgOU9aehrzeeQnj+O5nRYaYza6edAB5OgdA6q3H7wQk0A1h5gtLr5XzmxBCZ3jrw8R3EWKLtfynYW7+2HiwcUytiHCBs86mRgtgcIqSMLZXf4HRdIIY4PtNUGp91o+rQD/yPL7EYDPL1CjugotYN0elwAA0c8C4igv6jLeb8EObd1FojG2ZzdMDaY+I6BPAJUCKNBSy4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(38100700002)(31686004)(66574015)(8936002)(82960400001)(31696002)(6512007)(6506007)(6666004)(8676002)(316002)(66946007)(66556008)(66476007)(6916009)(6486002)(86362001)(4326008)(478600001)(5660300002)(53546011)(2906002)(41300700001)(36756003)(26005)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXFHVXJadFJ3VEJUVUJxQ1JOdHN3YnVIOWxjZG9aalpQNnFGUGdOTTZ2ckhz?=
 =?utf-8?B?ZHJhQjNBelhVazBGMzhqWmZWdmFSdTIwL0lSTGtBYUJSSnJCcWdUSC9DWXh2?=
 =?utf-8?B?QzNqdFRUR2JSVGVMOExFZDgyVllPeEllWVJlbUhwb1Y1bXdzVnZ1bWlGUlJw?=
 =?utf-8?B?NFNXVW5Lai9RZy9leWo1UzdVM1luVGdTaC9iVm1hNUh6NHlEYmQrM0tPcHdF?=
 =?utf-8?B?MUF2WkVpaExWOElBQi9NUityWXh5QzdnYi9XdWVqQkRTYkE5NHgyYlFvdUZq?=
 =?utf-8?B?akR5NDFkNWw3SXN2Mm9sWXR1VlVUeEllSzJCYW9BKzVXSDdrWmVRTi81OWF0?=
 =?utf-8?B?Ykw3MnNGVk8zNy83QVgvMHRjMHNRekp1bE8waXE4RFRVQ2FhU1MvTlJJWlM2?=
 =?utf-8?B?TUFxdHR3bVhwZVp3TW9PT3BJaWdvZTlzNTEwbEhxb243Z0VQa3oxb1N3WWpU?=
 =?utf-8?B?Sjc4MFIvbzhqVUMxbklSV1JYRnhOS2pNeVRaWTRYSkY5SWx0bE5PcTFTRlRF?=
 =?utf-8?B?c0NQekdKSVdPaHhJU2tuank4QXMydnAzaGQzVG9MVVM4U0Z2ZmF4N3E3WEw5?=
 =?utf-8?B?Z0wvNzlkdllSRSsvalZadWxzNE5venl3d0tZZEtzZVVadlhhSGgxbWNKRXJS?=
 =?utf-8?B?T2F3Zzc1V1lBcG83bDRrVklXRDZEdXNuVG11VFVKSlQ0YlZkMnErYmp5Nnh4?=
 =?utf-8?B?WDJpQ21WT3BPaWtZazU4dU83VXhFUXZ2Sm40MkV6RENybit4aTRNMk1BZDdO?=
 =?utf-8?B?Z1lJTWdtUVhaNTk1MGlzRHg1QVExRWxNMWFvRVdjZmo3Yk5HNVd0OTZFenhr?=
 =?utf-8?B?R1JuSEJJMUdVcDBvNVdnV2dMM3F2S3c3ZjBYaFV1V0xQOVZic1pMazR3K2Q3?=
 =?utf-8?B?cUVYZXZhMldEVEJEeGJaT3A0NTE0Y2ZWNGRjVEpOdEFiNHBtNHhXVnBFOTF5?=
 =?utf-8?B?QnBpQmxNd25laEEzYzVpdXJwWmM5T0xrYkxUVGVSOU4yaGJFRmh0SU1Fc3E2?=
 =?utf-8?B?SjR1QTNjWVRUamUvVFluMFdoeEJsMFZwd055ajhXVExWdHJQbklkT29mb1lN?=
 =?utf-8?B?U2Rsd1UvMTNVa3NtSjBYZ29SWU5Da28yNDNtWXhnRXdPZHlZYTFSRnpndDFl?=
 =?utf-8?B?T2x5N0NHQkpwVGxSR1QwZlZqWktvZ2VMYnlVYWRlbWxrRHJUU0MxVkFDaUpU?=
 =?utf-8?B?VjR0elA1RWdsM3NpanQ4V2YwcmtjemI0b3czY1RUVnRJU1JTQy8rbWxOTk1s?=
 =?utf-8?B?NzBlenozdUZQQjN6TC9iZEZCQStMTlJYcTR2Vk52NjZ2dEthcWo4Z1NMT1BO?=
 =?utf-8?B?SWNsV0kvcHE1akg5WGFjanh2VUVQM2JndlQzWjJSa1RsM2oxbFdNMXN2bFZV?=
 =?utf-8?B?R0xQNk5YVXJPV1pFbndQVUdDL2Y2U2w5RGV3aXRSZ2FHY2tGb01JM1JlbVIw?=
 =?utf-8?B?LzA0a1FEa3BSNDh0dk45VVpvTk9HeXZ3YXBPZ1NHUlRWSVVGVExxOURrdm1a?=
 =?utf-8?B?OVFDNXF1Qy90Sld3K2dwQTBNdytyQW1Ea2ZpR09jc1dGaDViMjVvNXB0ZFJ5?=
 =?utf-8?B?YU4xTkd2b3FWYzRMYnFTUk5nbGNMN0w1dGIxd284cU1ZQ2ZtTys3RUtVRUhU?=
 =?utf-8?B?TjhpM2lMQ0s2Szd3MnRaWGowYWNROC9WM0hSNGUweWV5aFYraVVhenozb2Mz?=
 =?utf-8?B?S3lVYlBhRklLRHQrYUk1U3FQV1doUmhSYmdSVzJ4YTRNbll4WUV0YnZMTkVB?=
 =?utf-8?B?UlFtc05CSE5NRUpMNWRIQU1RWHp2T1BKVzZ4bDFlNStqQTFab3ZVNFdMSkZD?=
 =?utf-8?B?dHJsc0szL0k2SnhrM1BPRTJBRVJCRGRYQ0R2Rit2OTBrQmdtWnVHZ2ltMi9z?=
 =?utf-8?B?SW1jTnlGcUsxeFhIeFRVWUlaTGFMamJZNzVXMS9xVzgzMkNPNzZIai9tYStU?=
 =?utf-8?B?d2ZLdHVWUDZLQy8rNm84QUNSM2hpc1A3N0xwYkw5ZTgxRldocUpuak40L3Zn?=
 =?utf-8?B?KzNYanEybjI0b0psVk1hOW5OaGNLQlM1cnlEWGcwaGZpa0N2TE5DUzkwaW91?=
 =?utf-8?B?TFJ6d3FjTTRpSWZ3dDNjNDJ4OFFYYTVKN0xZZWZqaHlTSmdVZHdzck9rdlMr?=
 =?utf-8?B?L29ZKytDS2Nudll2Sm4wSmI3b1VET0htdG56bDRYMDNraDlyeXFYK3g5d0Iy?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0c45d27-7d5e-4e14-06cc-08dbeef680fe
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 03:11:09.9665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qH0oISvfUHkrQZR98GjSWGpNXsvqU4XJqVdSEM55a9UI9Is1rVT5mW1m/fsizKfUeIqQ+SyqYngovcEDVK8x3YTCTLHEUlvOd+oJli8dwRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6605
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v2 2/6] drm/xe/xe2: Determine bios enablement
 for flat ccs on igfx.
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


On 23-11-2023 22:31, Matthew Auld wrote:
> On Thu, 23 Nov 2023 at 16:37, Matthew Auld
> <matthew.william.auld@gmail.com> wrote:
>> On Tue, 21 Nov 2023 at 10:01, Himal Prasad Ghimiray
>> <himal.prasad.ghimiray@intel.com> wrote:
>>> If bios disables flat ccs on igfx  make has_flat_ccs as 0 and notify
>>> via drm_info.
>>>
>>> Bspec:59255
>>>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Huh, I wonder if that explains why on some particular LNL DUTs
>> compression just didn't seem to "work" for me.
>>
>> So should this information be passed along to userspace via some query
>> uAPI? Maybe there is some tradeoff between enabling compression and
>> other features (like coherency), and so knowing this might be useful?
> Another idea might be to reject any compressed pat_index, if the
> platform doesn't support flat_ccs?

Thanks for the review.  I will start the discussion regarding exposing 
this information via some uapi or

rejecting the compressed pat_index. Will come back with further info on 
this.

>
>>> ---
>>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
>>>   drivers/gpu/drm/xe/xe_device.c       | 30 ++++++++++++++++++++++++++++
>>>   2 files changed, 33 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> index cc27fe8fc363..b642301947f5 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> @@ -142,6 +142,9 @@
>>>   #define XEHP_SLICE_COMMON_ECO_CHICKEN1         XE_REG_MCR(0x731c, XE_REG_OPTION_MASKED)
>>>   #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE   REG_BIT(14)
>>>
>>> +#define XE2_FLAT_CCS_BASE_RANGE_LOWER          XE_REG_MCR(0x8800)
>>> +#define   XE2_FLAT_CCS_ENABLE                  REG_BIT(0)
>>> +
>>>   #define VF_PREEMPTION                          XE_REG(0x83a4, XE_REG_OPTION_MASKED)
>>>   #define   PREEMPTION_VERTEX_COUNT              REG_GENMASK(15, 0)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>> index 8be765adf702..07a3e4cf48d1 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -16,6 +16,7 @@
>>>   #include <drm/xe_drm.h>
>>>
>>>   #include "regs/xe_regs.h"
>>> +#include "regs/xe_gt_regs.h"
>>>   #include "xe_bo.h"
>>>   #include "xe_debugfs.h"
>>>   #include "xe_display.h"
>>> @@ -25,6 +26,7 @@
>>>   #include "xe_exec_queue.h"
>>>   #include "xe_exec.h"
>>>   #include "xe_gt.h"
>>> +#include "xe_gt_mcr.h"
>>>   #include "xe_irq.h"
>>>   #include "xe_mmio.h"
>>>   #include "xe_module.h"
>>> @@ -342,6 +344,29 @@ static void xe_device_sanitize(struct drm_device *drm, void *arg)
>>>                  xe_gt_sanitize(gt);
>>>   }
>>>
>>> +static int xe_device_set_has_flat_ccs(struct  xe_device *xe)
>>> +{
>>> +       u32 reg;
>>> +       int err;
>>> +
>>> +       if (IS_DGFX(xe) || GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs)
>>> +               return 0;
>>> +
>>> +       struct xe_gt *gt = xe_root_mmio_gt(xe);
>>> +
>>> +       err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>> +       if (err)
>>> +               return err;
>>> +
>>> +       reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_LOWER);
>>> +       xe->info.has_flat_ccs = (reg & XE2_FLAT_CCS_ENABLE);
>>> +
>>> +       if (!xe->info.has_flat_ccs)
>>> +               drm_info(&xe->drm,
>>> +                        "Flat CCS has been disabled in bios, May lead to performance impact");
>>> +       return 0;
>>> +}
>>> +
>>>   int xe_device_probe(struct xe_device *xe)
>>>   {
>>>          struct xe_tile *tile;
>>> @@ -352,6 +377,7 @@ int xe_device_probe(struct xe_device *xe)
>>>          xe_pat_init_early(xe);
>>>
>>>          xe->info.mem_region_mask = 1;
>>> +
>>>          err = xe_display_init_nommio(xe);
>>>          if (err)
>>>                  return err;
>>> @@ -390,6 +416,10 @@ int xe_device_probe(struct xe_device *xe)
>>>                          goto err_irq_shutdown;
>>>          }
>>>
>>> +       err = xe_device_set_has_flat_ccs(xe);
>>> +       if (err)
>>> +               return err;
>>> +
>>>          err = xe_mmio_probe_vram(xe);
>>>          if (err)
>>>                  goto err_irq_shutdown;
>>> --
>>> 2.25.1
>>>
