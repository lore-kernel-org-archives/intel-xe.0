Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CBAC001DE
	for <intel-xe@archiver.kernel.org>; Thu, 10 Aug 2023 09:38:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2B010E177;
	Thu, 10 Aug 2023 09:38:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA9F10E177
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Aug 2023 09:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691660299; x=1723196299;
 h=message-id:date:subject:from:to:references:in-reply-to:
 mime-version; bh=k5+MAnEn1mB0qzOvDoM1CQqjnS28Ovcqzq4gxvmSR7U=;
 b=dZGMfy21a0FFvYIPKc6TxeBmBjpDMVy1sZDdxTDriZDig03l/cPsFh4D
 VLPfc6th64+e0mAIoB+K45eP56P7LWm75DPISAn8X9Jqrx0MNwG0Dlimr
 CiApTGts5bgimJ7/CdNhMsjBWYC1xDhX/u0YzcV/Fl5loRU0fYJ+rHElR
 +zE40RqTcOeB483Cl/Rm4I2KL0jsEyx0eMEMIOb+SVi2nA8cDo7iQF0MG
 uRpnvte8901p0aSeIAGHSM+T7zzjAEDZlqVP2SwD40TucMlH6/z0O0gg1
 kzeeY/eZQ8lEygip+P4jCJepVDaEDfYbQh578IL9YojAlkNjIkLigta+T Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="356319929"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
 d="scan'208,217";a="356319929"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 02:38:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="822176009"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
 d="scan'208,217";a="822176009"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Aug 2023 02:38:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 02:38:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 02:38:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 10 Aug 2023 02:38:16 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 10 Aug 2023 02:38:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fvjw11nBh9NCS43rRCf08z+Pv5tSjR1DJ4rocxe3Me6ekyRYYLrfjm9l4JpkDj7trNZ+ppTF2uEfFhjPzVFrtsYYwuxhFAStWZqPnVioQaqFkmt3YIbJ0M1XCvo38AdxmRnkEeZaGKm3qkOsgeUZqJpAtvMeqxiSbqgRkhvRlgvdaZaBp/l+yQyZjTLF2R/9WI8KH4nCE+zxldR4KteoEVueSGxRscV1w1tsFpalnELixsBdWHNeU9DvuzylJhCfiuYHFATaCBEGe/XR3btwUfRKxmlJ8aHWRau8TBOqLCI8uUtAzVVJ+OdFCxJrGsaYjHl6GdWYbO8iCfRn5MkwWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8X+n3V3R5BXM3rq4U2VtzFGpV+CqATO4R/tZJ55FSk=;
 b=Nm9PwGUAJ1I4qsuPPogSbaa0gLEvrGPuVAVipLFc3kXhJD9jiDBzcQKS+/6JmlynO4gOLlGLTlkgrIYcudS2Qd1VpgxFBPOxSgZEB6+/ExBK3LR1+LlErNgG3R8fBIHZ2Oav9RSJDuAn0neEzoN8uJ4P2BQJ6rK/7exI6oPdhnw7+i5EmHuFfuxKnMKSgPaBG4LlbX8rBgA60x93rQXZTX7i7+m4ir/7ZB6MaYTDJXNy+Bj3jf+XEldVBAdrRtHsfC6VBu6wIppOPHrTDkgySAPSMTgGMYYokuHbQT8Egb0JBxwLycXj61Vh/w33AjoilHjQt1Mwj9FGmeoz0Ah22w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA3PR11MB8004.namprd11.prod.outlook.com (2603:10b6:806:2f8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 09:38:13 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25%6]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 09:38:12 +0000
Content-Type: multipart/alternative;
 boundary="------------CgzehWtx00X3drQ0bVhcqrn7"
Message-ID: <78b0e2d2-3c4c-484f-bcd4-fa896adef534@intel.com>
Date: Thu, 10 Aug 2023 15:08:03 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230810050755.715775-1-himal.prasad.ghimiray@intel.com>
 <20230810050755.715775-2-himal.prasad.ghimiray@intel.com>
 <877cq3s567.fsf@intel.com> <ac574fd9-dce4-4f1e-a209-f4a400263273@intel.com>
In-Reply-To: <ac574fd9-dce4-4f1e-a209-f4a400263273@intel.com>
X-ClientProxiedBy: PN3PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::14) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA3PR11MB8004:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b7bad3a-bb7e-4044-b8c7-08db998583ce
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SxaspLLxYkjzM90pIdLFBjFWJ+OyattnWCBA5l9RR4TiR71Kfdxeyox09R+wmkvrl9Jk128S/IE9aM8V+Y3yZltjy4LP24eTh/3ZBaPIl06TUIbprgXzNCymZDIlXS9BfM+YsN+tcxRuDXc1mNN6uXUrM6cT9YcyoG+eBKQ8RcHq7xNxRuhQ4rwVkIzn740SvM2FZKQQQw3dT+6TD4oSnjbWxhCQ8knU64oc0ML7Ld8w5cbPeP9R5XxZS6/ZuiSVsH4ah0WXkr72ekhgGMPRMYg+0oolvBSyiZZgytkuqhBhR119wRfZe8Q+LXOeAjXPW5O+It/1EHcRKNOxXaA/3uQgbsgPRw08wH4pik5ilN0zscGZVPT/MOjMple9bv3h3pYbnLdt61TbvryELNIzzBfVgJ9yaNuuod/2wVQ7KdgI62NZXRBNDt3wykdSInE18Srk0Tfdi5uSPSyuvub6uqqkLmmX6/Nm+yuMly2wpRp037bluLaNbFb+t+1+pi0A/AgFDzHVOhEKprS6G1Ou1Ds5j/tfGXgOoW1f3oO6tzewvW+hmpBvLbtt9Ioe/+WppZgQgkziRdxbawb6s1k2ywMcH/7i7kgSGCb5p0YT4s6iA2nzJqlDWODZjUbaAtsJXRW9xxY/vio0cX2n+lDwxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(396003)(136003)(346002)(366004)(186006)(451199021)(1800799006)(31686004)(5660300002)(478600001)(53546011)(6506007)(26005)(8936002)(8676002)(2616005)(41300700001)(83380400001)(2906002)(6486002)(33964004)(6512007)(31696002)(86362001)(38100700002)(66556008)(66946007)(66476007)(82960400001)(36756003)(6666004)(30864003)(316002)(45980500001)(43740500002)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEpNRS9OeUdzZTJ3THV0TWNsWkozQ3JMVC9aNW9oUDBkMCt0OFE2ODJjbVJ4?=
 =?utf-8?B?WUo3c043SVF4dEVheWdsdlB2Q1I5dDBzZ1Q2cVpPeCtjTldZNFFUVzF4eE1y?=
 =?utf-8?B?UnR3aHVwVkFXc2VLVTNzU3A2cVc0aEw2V1RuVVVZMWJUa3pRUWtWbVNRa2h4?=
 =?utf-8?B?aGFENnMxZWs3YzJPR1BWV01XeUk2K2R0MW5hOWxCdWg5Q2FKb0NXdGV6VWJP?=
 =?utf-8?B?cldxejA2NUJLek1xRHdmNmEzRDRhYnRRc2ZmWENNb0tNWElCUG5ROHp3SkJK?=
 =?utf-8?B?Vm42dGdUZTloeUh3cHRxQzdzTWVwU2ZaTGhQby9qbXdqenZJR3dNNlQvN201?=
 =?utf-8?B?RVpuUnV6Mnhsd2xKUGwvZVlxdTgwVG40NlVxc0JMRHRIWWRhTE5XM0xnL1J2?=
 =?utf-8?B?cTBENDFwTFZVZ3RNTmxVT1h4aUdtWjRqNSt2SkhERzg3Ykh1bkxoWnFtVVlX?=
 =?utf-8?B?SFk0MzRlNGprUnd2V0QrWnM2VWZPS01DTmVzQlJTdjBnZ1JMMVBVais5TVRT?=
 =?utf-8?B?TVE5TVBBaXhOblFtdlQ2UjlqZFNNRU1meGZ6YWpUb296dGhLRitvTXRjSFpV?=
 =?utf-8?B?eHZpcWN3cW5NWW9MUmo3Yk1WLzVjeHU3M1prTE8yY0dER3dlemx1OVp0TjJS?=
 =?utf-8?B?UUU5NU5JcDdQLzhUczBqZ2ZEM3pyNWRsY2o0WnJzaDh1L1diK1FiQ2pxR1h0?=
 =?utf-8?B?SFFrTm1uRVZDZ28yTC91M2RONmF5T21NY0JVRWVMcFZDNjVELzJENUtybndz?=
 =?utf-8?B?WmczK2V1TDIzK0o5dGxRQ1dIU0ZUQXVwUkhWWllweFk5QUdaYmgzVnJYL0VX?=
 =?utf-8?B?Z1daWk9PUEw5WW1jVHBaTHRyVE5CZWxQSTdYV25QT08reWRxSmZNV2dRb0Vl?=
 =?utf-8?B?Y3Jyd3hEV28vZXAxd1FFSG8xbDkzeFVJaEZiREtITDlmdml6VC8yRU9TK1ZT?=
 =?utf-8?B?UGlQMUNOZ2o2bFRhQkVJMEFrSDBBbDFVK1hVTmNiY0dlZWUzS1RLVncrdWdu?=
 =?utf-8?B?TUx2clFDUDJtQUxLK1VJWnlvWnkxVEF0N0JUOXRqdUlxZ2Y5c2RCbkhYcGk5?=
 =?utf-8?B?RXlTVWpiL0VEV0NDYlVKdGRFWkF5aGY3U1BkVHRXWG9CRU1KTkwvcnVCK1gv?=
 =?utf-8?B?bEN1TDIrNkV0V1NIMEdCQVBJM2NLZm5NckpUeU9JNTJ3ZGY1RVB1V1U4Yk95?=
 =?utf-8?B?ZGxSR08rSzd3aGJGUTQzbVl3NHo5ZyttVkNZZ3YxK2g1NXdKeWpMTnlrSDZ5?=
 =?utf-8?B?ZUVlZ3hXOXBXV2FjQjhPdms3YUhOTFZuVUE4M3BwenVWTDdqbFRFZzBBNmxq?=
 =?utf-8?B?K0MxR2FQUGdrSlRwdG92ZUh5OFRHbkNadHpRVGppNTN1WUFlTS9ueFBLMWFo?=
 =?utf-8?B?K2laVjNXeGs0ZHduSzlLOUhkRVIvcEtRNzBkblU0Uk9YV2dqRWluYjdCV3Np?=
 =?utf-8?B?WHJJTkNjZTNwRVNTOENYVW9ick9FczFjdE5PMWgrS0cvNVhTWE9yZEh2R1Rj?=
 =?utf-8?B?TlZNVnNUZnVIaDBNRURPeW80bnRtSGRXc3lqaERYUXJ2RjJ5YUJGc3Ura3Rs?=
 =?utf-8?B?NjJqUzRyTGUwYUQ0ck1ocmlaMWt4K1orVTl3dlV4ZG9VQ2dqdUNJOEszdWho?=
 =?utf-8?B?R1Zxa3UvbXZaeGthbGNQYit5b2ZSTy9QdWFHaTMwWFVoalRQMFIxOGpCT0Jz?=
 =?utf-8?B?eVcveTlFZE9kQU9GajBWTjdmei9TZ0ZDeDgrcy9IckJGN3g0V1JHRWYzTEtN?=
 =?utf-8?B?SWw1MW9xUGttV01MRUJmNmM0cGdmRzY4QUw0TFF5SklpTDdYU25ZT3UzMTRO?=
 =?utf-8?B?WnZvRzcwYzJTWE15RzY5L3N0VXNCMGdVeGk0OHZOdERjYlo0VkhZeGl1WTYz?=
 =?utf-8?B?ZERDY2YrWjZzdWQzRkVlc1ZPQW43ZDZDQnltVW5xbEpaQWFTZkxEbE1OOEtO?=
 =?utf-8?B?TVBnMTN6SHAvNnMxOVNiOWwzMGJkakNobkFyVm13YXVLZGZNUFpPVmFHMUVs?=
 =?utf-8?B?QkxmeU1mMmUzMzZzeFdTbnZucCtpRUNTME03SHVCamR2d2FqTWc2S1lUUVhm?=
 =?utf-8?B?c2xXMm9TcmxDb0hpTkc4Qm1QTzhlT1E2N3JrU3BxMjMvQjNBNi9JQ0xVMmRW?=
 =?utf-8?B?cHc4cllXekVwWGJBbHZuaFVXcEVIaW41Rk95UWJNN0I3NjJ1QytoQVJrb2pX?=
 =?utf-8?Q?MvhvCwpPmzaaQzahxvdHteA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7bad3a-bb7e-4044-b8c7-08db998583ce
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 09:38:12.7502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JATAGWdVbiEBG9lmX4Yxn7JvH2AQIWEsjN/oJf2irqCEFm5fYLbVsQjDxBQCUzy8RUKLps2dCvxF2OX7ivzR1X7laSwufl7UmOHD6LpGnI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8004
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/4] drm/xe: Handle errors from various
 components.
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

--------------CgzehWtx00X3drQ0bVhcqrn7
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 10-08-2023 15:01, Ghimiray, Himal Prasad wrote:
>
>
> On 10-08-2023 13:24, Jani Nikula wrote:
>> On Thu, 10 Aug 2023, Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>  wrote:
>>> The GFX device can generate numbers of classes of error under the new
>>> infrastructure: correctable, non-fatal, and fatal errors.
>>>
>>> The non-fatal and fatal error classes distinguish between levels of
>>> severity for uncorrectable errors. Driver will only handle logging
>>> of errors and updating counters from various components within the
>>> graphics device. Anything more will be handled at system level.
>>>
>>> For errors that will route as interrupts, three bits in the Master
>>> Interrupt Register will be used to convey the class of error.
>>>
>>> For each class of error: Determine source of error (IP block) by reading
>>> the Device Error Source Register (RW1C) that
>>> corresponds to the class of error being serviced.
>>>
>>> Bspec: 50875, 53073, 53074, 53075
>>>
>>> Cc: Rodrigo Vivi<rodrigo.vivi@intel.com>
>>> Cc: Aravind Iddamsetty<aravind.iddamsetty@intel.com>
>>> Cc: Matthew Brost<matthew.brost@intel.com>
>>> Cc: Matt Roper<matthew.d.roper@intel.com>
>>> Cc: Joonas Lahtinen<joonas.lahtinen@linux.intel.com>
>>> Cc: Jani Nikula<jani.nikula@intel.com>
>>> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/regs/xe_regs.h            |   7 +
>>>   drivers/gpu/drm/xe/regs/xe_tile_error_regs.h | 108 +++++++++
>>>   drivers/gpu/drm/xe/xe_device_types.h         |   6 +
>>>   drivers/gpu/drm/xe/xe_irq.c                  | 220 +++++++++++++++++++
>>>   4 files changed, 341 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
>>> index ec45b1ba9db1..9901e55fc89c 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>>> @@ -87,7 +87,14 @@
>>>   #define   GU_MISC_IRQ				REG_BIT(29)
>>>   #define   DISPLAY_IRQ				REG_BIT(16)
>>>   #define   GT_DW_IRQ(x)				REG_BIT(x)
>>> +#define   XE_ERROR_IRQ(x)			REG_BIT(26 + (x))
>>>   
>>>   #define PVC_RP_STATE_CAP			XE_REG(0x281014)
>>>   
>>> +enum hardware_error {
>>> +	HARDWARE_ERROR_CORRECTABLE = 0,
>>> +	HARDWARE_ERROR_NONFATAL = 1,
>>> +	HARDWARE_ERROR_FATAL = 2,
>>> +	HARDWARE_ERROR_MAX,
>>> +};
>> This file is about registers. IMO enums belong somewhere else. Define
>> hardware registers using macros.
>
> Hmm. Will look for better placeholder for this enum.
>
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
>>> new file mode 100644
>>> index 000000000000..fbb794b2f183
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
>>> @@ -0,0 +1,108 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +#ifndef XE_TILE_ERROR_REGS_H_
>>> +#define XE_TILE_ERROR_REGS_H_
>>> +
>>> +#include <linux/stddef.h>
>>> +
>>> +#define _DEV_ERR_STAT_NONFATAL                         0x100178
>>> +#define _DEV_ERR_STAT_CORRECTABLE                      0x10017c
>>> +#define DEV_ERR_STAT_REG(x)                            XE_REG(_PICK_EVEN((x), \
>>> +								_DEV_ERR_STAT_CORRECTABLE, \
>>> +								_DEV_ERR_STAT_NONFATAL))
>>> +
>>> +#define  DEV_ERR_STAT_MAX_ERROR_BIT         (21)
>>> +
>>> +/* Count of  Correctable and Uncorrectable errors reported on tile */
>>> +enum xe_tile_hw_errors {g
>>> +	XE_TILE_HW_ERR_GT_FATAL = 0,
>>> +	XE_TILE_HW_ERR_SGGI_FATAL,
>>> +	XE_TILE_HW_ERR_DISPLAY_FATAL,
>>> +	XE_TILE_HW_ERR_SGDI_FATAL,
>>> +	XE_TILE_HW_ERR_SGLI_FATAL,
>>> +	XE_TILE_HW_ERR_SGUNIT_FATAL,
>>> +	XE_TILE_HW_ERR_SGCI_FATAL,
>>> +	XE_TILE_HW_ERR_GSC_FATAL,
>>> +	XE_TILE_HW_ERR_SOC_FATAL,
>>> +	XE_TILE_HW_ERR_MERT_FATAL,
>>> +	XE_TILE_HW_ERR_SGMI_FATAL,
>>> +	XE_TILE_HW_ERR_UNKNOWN_FATAL,
>>> +	XE_TILE_HW_ERR_SGGI_NONFATAL,
>>> +	XE_TILE_HW_ERR_DISPLAY_NONFATAL,
>>> +	XE_TILE_HW_ERR_SGDI_NONFATAL,
>>> +	XE_TILE_HW_ERR_SGLI_NONFATAL,
>>> +	XE_TILE_HW_ERR_GT_NONFATAL,
>>> +	XE_TILE_HW_ERR_SGUNIT_NONFATAL,
>>> +	XE_TILE_HW_ERR_SGCI_NONFATAL,
>>> +	XE_TILE_HW_ERR_GSC_NONFATAL,
>>> +	XE_TILE_HW_ERR_SOC_NONFATAL,
>>> +	XE_TILE_HW_ERR_MERT_NONFATAL,
>>> +	XE_TILE_HW_ERR_SGMI_NONFATAL,
>>> +	XE_TILE_HW_ERR_UNKNOWN_NONFATAL,
>>> +	XE_TILE_HW_ERR_GT_CORR,
>>> +	XE_TILE_HW_ERR_DISPLAY_CORR,
>>> +	XE_TILE_HW_ERR_SGUNIT_CORR,
>>> +	XE_TILE_HW_ERR_GSC_CORR,
>>> +	XE_TILE_HW_ERR_SOC_CORR,
>>> +	XE_TILE_HW_ERR_UNKNOWN_CORR,
>>> +};
>> Ditto about enums and regs.
> Will address.
>>> +
>>> +#define XE_TILE_HW_ERROR_MAX (XE_TILE_HW_ERR_UNKNOWN_CORR + 1)
>> If it's an enum, adding that last in the enum does the trick.
> Makes sense.
>>> +
>>> +#define PVC_DEV_ERR_STAT_FATAL_MASK \
>>> +		(REG_BIT(0) | \
>>> +		 REG_BIT(1) | \
>>> +		 REG_BIT(8) | \
>>> +		 REG_BIT(9) | \
>>> +		 REG_BIT(13) | \
>>> +		 REG_BIT(16) | \
>>> +		 REG_BIT(20))
>>> +
>>> +#define PVC_DEV_ERR_STAT_NONFATAL_MASK \
>>> +		(REG_BIT(0) | \
>>> +		 REG_BIT(1) | \
>>> +		 REG_BIT(8) | \
>>> +		 REG_BIT(9) | \
>>> +		 REG_BIT(13) | \
>>> +		 REG_BIT(16) | \
>>> +		 REG_BIT(20))
>>> +
>>> +#define PVC_DEV_ERR_STAT_CORRECTABLE_MASK \
>>> +		(REG_BIT(0) | \
>>> +		 REG_BIT(8))
>>> +
>>> +#define DG2_DEV_ERR_STAT_FATAL_MASK \
>>> +		(REG_BIT(0) | \
>>> +		 REG_BIT(4) | \
>>> +		 REG_BIT(8) | \
>>> +		 REG_BIT(12) | \
>>> +		 REG_BIT(16))
>>> +
>>> +#define DG2_DEV_ERR_STAT_NONFATAL_MASK \
>>> +		(REG_BIT(0) | \
>>> +		 REG_BIT(4) | \
>>> +		 REG_BIT(8) | \
>>> +		 REG_BIT(12) | \
>>> +		 REG_BIT(16) | \
>>> +		 REG_BIT(20))
>>> +
>>> +#define DG2_DEV_ERR_STAT_CORRECTABLE_MASK \
>>> +		(REG_BIT(0) | \
>>> +		 REG_BIT(4) | \
>>> +		 REG_BIT(8) | \
>>> +		 REG_BIT(12) | \
>>> +		 REG_BIT(16))
>> Are the above supposed to match what's in xe_tile_hw_errors? Seems
>> rather unmaintainable.
> xe_tile_hw_errors contains superset of applicable platforms and mask determines
> what are applicable bits for a platform.
>>> +
>>> +#define REG_SIZE 32
>>> +
>>> +#define xe_tile_log_hw_err(tile, fmt, ...) \
>>> +	drm_err_ratelimited(&tile_to_xe(tile)->drm, HW_ERR "TILE%d detected " fmt, \
>>> +			    tile->id, ##__VA_ARGS__)
>>> +
>>> +#define xe_tile_log_hw_warn(tile, fmt, ...) \
>>> +	drm_warn(&tile_to_xe(tile)->drm, HW_ERR "TILE%d detected " fmt, \
>>> +		 tile->id, ##__VA_ARGS__)
>> Do we really want to keep adding new macros for all possible scenarios
>> in the driver? This is getting out of hand.
>>
>> Where's HW_ERR defined?
> include/linux/printk.h defines HW_ERR.
>>> +
>>> +#endif
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>> index f84ecb976f5d..1335ba74981a 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -16,6 +16,7 @@
>>>   #include "xe_gt_types.h"
>>>   #include "xe_platform_types.h"
>>>   #include "xe_step_types.h"
>>> +#include "regs/xe_tile_error_regs.h"
>>>   
>>>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>>>   #include "ext/intel_device_info.h"
>>> @@ -166,6 +167,11 @@ struct xe_tile {
>>>   
>>>   	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
>>>   	struct kobject *sysfs;
>>> +
>>> +	/** @tile_hw_errors: hardware errors reported for the tile */
>>> +	struct tile_hw_errors {
>>> +		unsigned long hw[XE_TILE_HW_ERROR_MAX];
>> Even with the documentation comment, I have to look up the source code
>> to realize this is the *number* of errors for each class.
>>
>> Maybe "count" is more informative than "hw".
> Ok.
>>> +	} errors;
>>>   };
>>>   
>>>   /**
>>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>>> index 2022a5643e01..04a665faea23 100644
>>> --- a/drivers/gpu/drm/xe/xe_irq.c
>>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>>> @@ -362,6 +362,223 @@ static void dg1_intr_enable(struct xe_device *xe, bool stall)
>>>   		xe_mmio_read32(mmio, DG1_MSTR_TILE_INTR);
>>>   }
>>>   
>>> +static const char *
>>> +hardware_error_type_to_str(const enum hardware_error hw_err)
>>> +{
>>> +	switch (hw_err) {
>>> +	case HARDWARE_ERROR_CORRECTABLE:
>>> +		return "CORRECTABLE";
>>> +	case HARDWARE_ERROR_NONFATAL:
>>> +		return "NONFATAL";
>>> +	case HARDWARE_ERROR_FATAL:
>>> +		return "FATAL";
>>> +	default:
>>> +		return "UNKNOWN";
>>> +	}
>>> +}
>>> +
>>> +struct error_msg_counter_pair {
>>> +	const char *errmsg;
>>> +	int errcounter;
>> Counter? Or type/class/whatever?
>>
>>> +};
>>> +
>>> +struct error_msg_counter_pair dev_err_stat_fatal_reg[] = {
>>> +	{"GT",			XE_TILE_HW_ERR_GT_FATAL			/* Bit Pos 0 */},
>> Does this again tie the enums and the bit positions together, similar to
>> how the mask macros also do above?
>>
>> There needs to be a single point of truth for all of this.
>>
>> I think this needs a redesign.
>
> As commented above this is array which defines all valid bit positions 
> irrespective of platform. Mask was
>
> to determine platform specific applicability.
>
>> BR,
>> Jani.
>>
>>> +	{"SGGI Cmd Parity",	XE_TILE_HW_ERR_SGGI_FATAL		/* Bit Pos 1 */},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
>>> +	{"DISPLAY",		XE_TILE_HW_ERR_DISPLAY_FATAL		/* Bit Pos 4 */},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
>>> +	{"GSC error",		XE_TILE_HW_ERR_GSC_FATAL		/* Bit Pos 8 */},
>>> +	{"SGLI Cmd Parity",	XE_TILE_HW_ERR_SGLI_FATAL		/* Bit Pos 9 */},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
>>> +	{"SGUNIT",		XE_TILE_HW_ERR_SGUNIT_FATAL		/* Bit Pos 12 */},
>>> +	{"SGCI Cmd Parity",	XE_TILE_HW_ERR_SGCI_FATAL		/* Bit Pos 13 */},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
>>> +	{"SOC ERROR",		XE_TILE_HW_ERR_SOC_FATAL		/* Bit Pos 16 */},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
>>> +	{"MERT Cmd Parity",	XE_TILE_HW_ERR_MERT_FATAL		/* Bit Pos 20 */},
>>> +};
>>> +
>>> +struct error_msg_counter_pair dev_err_stat_nonfatal_reg[] = {
>>> +	{"GT",			XE_TILE_HW_ERR_GT_NONFATAL		/* Bit Pos 0 */},
>>> +	{"SGGI Data Parity",	XE_TILE_HW_ERR_SGGI_NONFATAL		/* Bit Pos 1 */},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>>> +	{"DISPLAY",		XE_TILE_HW_ERR_DISPLAY_NONFATAL		/* Bit Pos 4 */},
>>> +	{"SGDI Data Parity",	XE_TILE_HW_ERR_SGDI_NONFATAL		/* Bit Pos 5 */},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>>> +	{"GSC",			XE_TILE_HW_ERR_GSC_NONFATAL		/* Bit Pos 8 */},
>>> +	{"SGLI Data Parity",	XE_TILE_HW_ERR_SGLI_NONFATAL		/* Bit Pos 9 */},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>>> +	{"SGUNIT",		XE_TILE_HW_ERR_SGUNIT_NONFATAL		/* Bit Pos 12 */},
>>> +	{"SGCI Data Parity",	XE_TILE_HW_ERR_SGCI_NONFATAL		/* Bit Pos 13 */},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>>> +	{"SOC",			XE_TILE_HW_ERR_SOC_NONFATAL		/* Bit Pos 16 */},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL		/* Bit Pos 17 */},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>>> +	{"MERT Data Parity",	XE_TILE_HW_ERR_MERT_NONFATAL		/* Bit Pos 20 */},
>>> +};
>>> +
>>> +struct error_msg_counter_pair dev_err_stat_correctable_reg[] = {
>>> +	{"GT",			XE_TILE_HW_ERR_GT_CORR			/* Bit Pos 0 */},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
>>> +	{"DISPLAY",		XE_TILE_HW_ERR_DISPLAY_CORR		/* Bit Pos 4 */},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
>>> +	{"GSC",			XE_TILE_HW_ERR_GSC_CORR			/* Bit Pos 8 */},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
>>> +	{"SGUNIT",		XE_TILE_HW_ERR_SGUNIT_CORR		/* Bit Pos 12 */},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
>>> +	{"SOC",			XE_TILE_HW_ERR_SOC_CORR			/* Bit Pos 16 */},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
>>> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
>>> +};
>>> +
>>> +static void update_valid_error_regs(struct xe_device *xe)
>>> +{
>>> +	unsigned long mask = 0;
>>> +
>>> +	u32 i;
>>> +
>>> +	if (xe->info.platform == XE_DG2) {
>>> +		mask = ~(0 | DG2_DEV_ERR_STAT_FATAL_MASK);
>>> +		for_each_set_bit(i, &mask, DEV_ERR_STAT_MAX_ERROR_BIT)
>>> +			dev_err_stat_fatal_reg[i] = (struct error_msg_counter_pair)
>>> +			{.errmsg = "Undefined", .errcounter = XE_TILE_HW_ERR_UNKNOWN_FATAL};
>> Nope. For one thing, the arrays really should be static const, placed in
>> rodata, and not mutable.
> My Idea of keeping it mutable is to avoid multiple platform specific 
> arrays.
>> For another, if you have a platform with two or more different devices,
>> whichever gets probed last clobbers the data.
>
> Thanks for pointing it out. I had missed this particular scenario.  I 
> believe defining platform specific array is better
>
> because then we can ensure them to be immutable and we will not be 
> required to have platform specific mask also.
>
> I believe this will help with maintainability too.
>
> BR
>
> Himal Ghimiray
>
>>> +
>>> +		mask = ~(0 | DG2_DEV_ERR_STAT_NONFATAL_MASK);
>>> +		for_each_set_bit(i, &mask, DEV_ERR_STAT_MAX_ERROR_BIT)
>>> +			dev_err_stat_nonfatal_reg[i] = (struct error_msg_counter_pair)
>>> +			{.errmsg = "Undefined", .errcounter = XE_TILE_HW_ERR_UNKNOWN_NONFATAL};
>>> +
>>> +		mask = ~(0 | DG2_DEV_ERR_STAT_CORRECTABLE_MASK);
>>> +		for_each_set_bit(i, &mask, DEV_ERR_STAT_MAX_ERROR_BIT)
>>> +			dev_err_stat_correctable_reg[i] = (struct error_msg_counter_pair)
>>> +			{.errmsg = "Undefined", .errcounter = XE_TILE_HW_ERR_UNKNOWN_CORR};
>>> +	} else if (xe->info.platform == XE_PVC) {
>>> +		mask = ~(0 | PVC_DEV_ERR_STAT_FATAL_MASK);
>>> +		for_each_set_bit(i, &mask, DEV_ERR_STAT_MAX_ERROR_BIT)
>>> +			dev_err_stat_fatal_reg[i] = (struct error_msg_counter_pair)
>>> +			{.errmsg = "Undefined", .errcounter = XE_TILE_HW_ERR_UNKNOWN_FATAL};
>>> +
>>> +		mask = ~(0 | PVC_DEV_ERR_STAT_NONFATAL_MASK);
>>> +		for_each_set_bit(i, &mask, DEV_ERR_STAT_MAX_ERROR_BIT)
>>> +			dev_err_stat_nonfatal_reg[i] = (struct error_msg_counter_pair)
>>> +			{.errmsg = "Undefined", .errcounter = XE_TILE_HW_ERR_UNKNOWN_NONFATAL};
>>> +
>>> +		mask = ~(0 | PVC_DEV_ERR_STAT_CORRECTABLE_MASK);
>>> +		for_each_set_bit(i, &mask, DEV_ERR_STAT_MAX_ERROR_BIT)
>>> +			dev_err_stat_correctable_reg[i] = (struct error_msg_counter_pair)
>>> +			{.errmsg = "Undefined", .errcounter = XE_TILE_HW_ERR_UNKNOWN_CORR};
>>> +	}
>>> +}
>>> +
>>> +static void
>>> +xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>>> +{
>>> +	const char *hw_err_str = hardware_error_type_to_str(hw_err);
>>> +	struct error_msg_counter_pair *errstat;
>>> +	unsigned long errsrc;
>>> +	unsigned long flags;
>>> +	const char *errmsg;
>>> +	struct xe_gt *mmio;
>>> +	u32 counter;
>>> +	u32 errcntr;
>>> +	u32 errbit;
>>> +
>>> +	switch (hw_err) {
>>> +	case HARDWARE_ERROR_FATAL:
>>> +		errstat = (struct error_msg_counter_pair *)dev_err_stat_fatal_reg;
>> Why the casts?
>>
>>> +		counter = XE_TILE_HW_ERR_UNKNOWN_FATAL;
>>> +		break;
>>> +	case HARDWARE_ERROR_NONFATAL:
>>> +		errstat = (struct error_msg_counter_pair *)dev_err_stat_nonfatal_reg;
>>> +		counter = XE_TILE_HW_ERR_UNKNOWN_NONFATAL;
>>> +		break;
>>> +	case HARDWARE_ERROR_CORRECTABLE:
>>> +		errstat = (struct error_msg_counter_pair *)dev_err_stat_correctable_reg;
>>> +		counter = XE_TILE_HW_ERR_UNKNOWN_CORR;
>>> +		break;
>>> +	default:
>>> +		return;
>>> +	}
>>> +
>>> +	spin_lock_irqsave(&tile_to_xe(tile)->irq.lock, flags);
>>> +	mmio = tile->primary_gt;
>>> +	errsrc = xe_mmio_read32(mmio, DEV_ERR_STAT_REG(hw_err));
>>> +
>>> +	if (!errsrc) {
>>> +		xe_tile_log_hw_err(tile, "DEV_ERR_STAT_REG_%s blank!\n", hw_err_str);
>>> +		goto unlock;
>>> +	}
>>> +
>>> +	for_each_set_bit(errbit, &errsrc, REG_SIZE) {
>>> +		if (errbit < DEV_ERR_STAT_MAX_ERROR_BIT) {
>>> +			errmsg = errstat[errbit].errmsg;
>>> +			errcntr = errstat[errbit].errcounter;
>>> +		} else {
>>> +			errmsg = "Undefined";
>>> +			errcntr = counter;
>>> +		}
>>> +
>>> +		if (hw_err == HARDWARE_ERROR_CORRECTABLE)
>>> +			xe_tile_log_hw_warn(tile, "%s %s error bit[%d] is set\n",
>>> +					    errmsg, hw_err_str, errbit);
>>> +		else
>>> +			xe_tile_log_hw_err(tile, "%s %s error bit[%d] is set\n",
>>> +					   errmsg, hw_err_str, errbit);
>>> +
>>> +		tile->errors.hw[errcntr]++;
>>> +	}
>>> +
>>> +	xe_mmio_write32(mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
>>> +unlock:
>>> +	spin_unlock_irqrestore(&tile_to_xe(tile)->irq.lock, flags);
>>> +}
>>> +
>>> +/*
>>> + * XE Platforms adds three Error bits to the Master Interrupt
>>> + * Register to support error handling. These three bits are
>>> + * used to convey the class of error:
>>> + * FATAL, NONFATAL, or CORRECTABLE.
>>> + *
>>> + * To process an interrupt:
>>> + *       Determine source of error (IP block) by reading
>>> + *	 the Device Error Source Register (RW1C) that
>>> + *	 corresponds to the class of error being serviced
>>> + *	 and log the error.
>>> + */
>>> +static void
>>> +xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>>> +{
>>> +	enum hardware_error hw_err;
>>> +
>>> +	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
>>> +		if (master_ctl & XE_ERROR_IRQ(hw_err))
>>> +			xe_hw_error_source_handler(tile, hw_err);
>>> +	}
>>> +}
>>> +
>>>   /*
>>>    * Top-level interrupt handler for Xe_LP+ and beyond.  These platforms have
>>>    * a "master tile" interrupt register which must be consulted before the
>>> @@ -413,6 +630,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>>>   		xe_mmio_write32(mmio, GFX_MSTR_IRQ, master_ctl);
>>>   
>>>   		gt_irq_handler(tile, master_ctl, intr_dw, identity);
>>> +		xe_hw_error_irq_handler(tile, master_ctl);
>>>   
>>>   		/*
>>>   		 * Display interrupts (including display backlight operations
>>> @@ -561,6 +779,8 @@ int xe_irq_install(struct xe_device *xe)
>>>   		return -EINVAL;
>>>   	}
>>>   
>>> +	update_valid_error_regs(xe);
>>> +
>>>   	xe->irq.enabled = true;
>>>   
>>>   	xe_irq_reset(xe);
--------------CgzehWtx00X3drQ0bVhcqrn7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10-08-2023 15:01, Ghimiray, Himal
      Prasad wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ac574fd9-dce4-4f1e-a209-f4a400263273@intel.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 10-08-2023 13:24, Jani Nikula
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:877cq3s567.fsf@intel.com">
        <pre class="moz-quote-pre" wrap="">On Thu, 10 Aug 2023, Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com" moz-do-not-send="true">&lt;himal.prasad.ghimiray@intel.com&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">The GFX device can generate numbers of classes of error under the new
infrastructure: correctable, non-fatal, and fatal errors.

The non-fatal and fatal error classes distinguish between levels of
severity for uncorrectable errors. Driver will only handle logging
of errors and updating counters from various components within the
graphics device. Anything more will be handled at system level.

For errors that will route as interrupts, three bits in the Master
Interrupt Register will be used to convey the class of error.

For each class of error: Determine source of error (IP block) by reading
the Device Error Source Register (RW1C) that
corresponds to the class of error being serviced.

Bspec: 50875, 53073, 53074, 53075

Cc: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com" moz-do-not-send="true">&lt;rodrigo.vivi@intel.com&gt;</a>
Cc: Aravind Iddamsetty <a class="moz-txt-link-rfc2396E" href="mailto:aravind.iddamsetty@intel.com" moz-do-not-send="true">&lt;aravind.iddamsetty@intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com" moz-do-not-send="true">&lt;matthew.brost@intel.com&gt;</a>
Cc: Matt Roper <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com" moz-do-not-send="true">&lt;matthew.d.roper@intel.com&gt;</a>
Cc: Joonas Lahtinen <a class="moz-txt-link-rfc2396E" href="mailto:joonas.lahtinen@linux.intel.com" moz-do-not-send="true">&lt;joonas.lahtinen@linux.intel.com&gt;</a>
Cc: Jani Nikula <a class="moz-txt-link-rfc2396E" href="mailto:jani.nikula@intel.com" moz-do-not-send="true">&lt;jani.nikula@intel.com&gt;</a>
Signed-off-by: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com" moz-do-not-send="true">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/regs/xe_regs.h            |   7 +
 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h | 108 +++++++++
 drivers/gpu/drm/xe/xe_device_types.h         |   6 +
 drivers/gpu/drm/xe/xe_irq.c                  | 220 +++++++++++++++++++
 4 files changed, 341 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index ec45b1ba9db1..9901e55fc89c 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -87,7 +87,14 @@
 #define   GU_MISC_IRQ				REG_BIT(29)
 #define   DISPLAY_IRQ				REG_BIT(16)
 #define   GT_DW_IRQ(x)				REG_BIT(x)
+#define   XE_ERROR_IRQ(x)			REG_BIT(26 + (x))
 
 #define PVC_RP_STATE_CAP			XE_REG(0x281014)
 
+enum hardware_error {
+	HARDWARE_ERROR_CORRECTABLE = 0,
+	HARDWARE_ERROR_NONFATAL = 1,
+	HARDWARE_ERROR_FATAL = 2,
+	HARDWARE_ERROR_MAX,
+};
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">This file is about registers. IMO enums belong somewhere else. Define
hardware registers using macros.</pre>
      </blockquote>
      <p>Hmm. Will look for better placeholder for this enum.<br>
      </p>
      <blockquote type="cite" cite="mid:877cq3s567.fsf@intel.com">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap=""> #endif
diff --git a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
new file mode 100644
index 000000000000..fbb794b2f183
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
@@ -0,0 +1,108 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+#ifndef XE_TILE_ERROR_REGS_H_
+#define XE_TILE_ERROR_REGS_H_
+
+#include &lt;linux/stddef.h&gt;
+
+#define _DEV_ERR_STAT_NONFATAL                         0x100178
+#define _DEV_ERR_STAT_CORRECTABLE                      0x10017c
+#define DEV_ERR_STAT_REG(x)                            XE_REG(_PICK_EVEN((x), \
+								_DEV_ERR_STAT_CORRECTABLE, \
+								_DEV_ERR_STAT_NONFATAL))
+
+#define  DEV_ERR_STAT_MAX_ERROR_BIT         (21)
+
+/* Count of  Correctable and Uncorrectable errors reported on tile */
+enum xe_tile_hw_errors {g
+	XE_TILE_HW_ERR_GT_FATAL = 0,
+	XE_TILE_HW_ERR_SGGI_FATAL,
+	XE_TILE_HW_ERR_DISPLAY_FATAL,
+	XE_TILE_HW_ERR_SGDI_FATAL,
+	XE_TILE_HW_ERR_SGLI_FATAL,
+	XE_TILE_HW_ERR_SGUNIT_FATAL,
+	XE_TILE_HW_ERR_SGCI_FATAL,
+	XE_TILE_HW_ERR_GSC_FATAL,
+	XE_TILE_HW_ERR_SOC_FATAL,
+	XE_TILE_HW_ERR_MERT_FATAL,
+	XE_TILE_HW_ERR_SGMI_FATAL,
+	XE_TILE_HW_ERR_UNKNOWN_FATAL,
+	XE_TILE_HW_ERR_SGGI_NONFATAL,
+	XE_TILE_HW_ERR_DISPLAY_NONFATAL,
+	XE_TILE_HW_ERR_SGDI_NONFATAL,
+	XE_TILE_HW_ERR_SGLI_NONFATAL,
+	XE_TILE_HW_ERR_GT_NONFATAL,
+	XE_TILE_HW_ERR_SGUNIT_NONFATAL,
+	XE_TILE_HW_ERR_SGCI_NONFATAL,
+	XE_TILE_HW_ERR_GSC_NONFATAL,
+	XE_TILE_HW_ERR_SOC_NONFATAL,
+	XE_TILE_HW_ERR_MERT_NONFATAL,
+	XE_TILE_HW_ERR_SGMI_NONFATAL,
+	XE_TILE_HW_ERR_UNKNOWN_NONFATAL,
+	XE_TILE_HW_ERR_GT_CORR,
+	XE_TILE_HW_ERR_DISPLAY_CORR,
+	XE_TILE_HW_ERR_SGUNIT_CORR,
+	XE_TILE_HW_ERR_GSC_CORR,
+	XE_TILE_HW_ERR_SOC_CORR,
+	XE_TILE_HW_ERR_UNKNOWN_CORR,
+};
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Ditto about enums and regs.</pre>
      </blockquote>
      Will address.<br>
      <blockquote type="cite" cite="mid:877cq3s567.fsf@intel.com">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+
+#define XE_TILE_HW_ERROR_MAX (XE_TILE_HW_ERR_UNKNOWN_CORR + 1)
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">If it's an enum, adding that last in the enum does the trick.</pre>
      </blockquote>
      Makes sense.<br>
      <blockquote type="cite" cite="mid:877cq3s567.fsf@intel.com">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+
+#define PVC_DEV_ERR_STAT_FATAL_MASK \
+		(REG_BIT(0) | \
+		 REG_BIT(1) | \
+		 REG_BIT(8) | \
+		 REG_BIT(9) | \
+		 REG_BIT(13) | \
+		 REG_BIT(16) | \
+		 REG_BIT(20))
+
+#define PVC_DEV_ERR_STAT_NONFATAL_MASK \
+		(REG_BIT(0) | \
+		 REG_BIT(1) | \
+		 REG_BIT(8) | \
+		 REG_BIT(9) | \
+		 REG_BIT(13) | \
+		 REG_BIT(16) | \
+		 REG_BIT(20))
+
+#define PVC_DEV_ERR_STAT_CORRECTABLE_MASK \
+		(REG_BIT(0) | \
+		 REG_BIT(8))
+
+#define DG2_DEV_ERR_STAT_FATAL_MASK \
+		(REG_BIT(0) | \
+		 REG_BIT(4) | \
+		 REG_BIT(8) | \
+		 REG_BIT(12) | \
+		 REG_BIT(16))
+
+#define DG2_DEV_ERR_STAT_NONFATAL_MASK \
+		(REG_BIT(0) | \
+		 REG_BIT(4) | \
+		 REG_BIT(8) | \
+		 REG_BIT(12) | \
+		 REG_BIT(16) | \
+		 REG_BIT(20))
+
+#define DG2_DEV_ERR_STAT_CORRECTABLE_MASK \
+		(REG_BIT(0) | \
+		 REG_BIT(4) | \
+		 REG_BIT(8) | \
+		 REG_BIT(12) | \
+		 REG_BIT(16))
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Are the above supposed to match what's in xe_tile_hw_errors? Seems
rather unmaintainable.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">xe_tile_hw_errors contains superset of applicable platforms and mask determines
what are applicable bits for a platform.
</pre>
      <blockquote type="cite" cite="mid:877cq3s567.fsf@intel.com">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+
+#define REG_SIZE 32
+
+#define xe_tile_log_hw_err(tile, fmt, ...) \
+	drm_err_ratelimited(&amp;tile_to_xe(tile)-&gt;drm, HW_ERR &quot;TILE%d detected &quot; fmt, \
+			    tile-&gt;id, ##__VA_ARGS__)
+
+#define xe_tile_log_hw_warn(tile, fmt, ...) \
+	drm_warn(&amp;tile_to_xe(tile)-&gt;drm, HW_ERR &quot;TILE%d detected &quot; fmt, \
+		 tile-&gt;id, ##__VA_ARGS__)
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Do we really want to keep adding new macros for all possible scenarios
in the driver? This is getting out of hand.

Where's HW_ERR defined?</pre>
      </blockquote>
      include/linux/printk.h defines HW_ERR.<br>
      <blockquote type="cite" cite="mid:877cq3s567.fsf@intel.com">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index f84ecb976f5d..1335ba74981a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -16,6 +16,7 @@
 #include &quot;xe_gt_types.h&quot;
 #include &quot;xe_platform_types.h&quot;
 #include &quot;xe_step_types.h&quot;
+#include &quot;regs/xe_tile_error_regs.h&quot;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 #include &quot;ext/intel_device_info.h&quot;
@@ -166,6 +167,11 @@ struct xe_tile {
 
 	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
 	struct kobject *sysfs;
+
+	/** @tile_hw_errors: hardware errors reported for the tile */
+	struct tile_hw_errors {
+		unsigned long hw[XE_TILE_HW_ERROR_MAX];
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Even with the documentation comment, I have to look up the source code
to realize this is the *number* of errors for each class.

Maybe &quot;count&quot; is more informative than &quot;hw&quot;.</pre>
      </blockquote>
      Ok.<br>
      <blockquote type="cite" cite="mid:877cq3s567.fsf@intel.com">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+	} errors;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 2022a5643e01..04a665faea23 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -362,6 +362,223 @@ static void dg1_intr_enable(struct xe_device *xe, bool stall)
 		xe_mmio_read32(mmio, DG1_MSTR_TILE_INTR);
 }
 
+static const char *
+hardware_error_type_to_str(const enum hardware_error hw_err)
+{
+	switch (hw_err) {
+	case HARDWARE_ERROR_CORRECTABLE:
+		return &quot;CORRECTABLE&quot;;
+	case HARDWARE_ERROR_NONFATAL:
+		return &quot;NONFATAL&quot;;
+	case HARDWARE_ERROR_FATAL:
+		return &quot;FATAL&quot;;
+	default:
+		return &quot;UNKNOWN&quot;;
+	}
+}
+
+struct error_msg_counter_pair {
+	const char *errmsg;
+	int errcounter;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Counter? Or type/class/whatever?

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+};
+
+struct error_msg_counter_pair dev_err_stat_fatal_reg[] = {
+	{&quot;GT&quot;,			XE_TILE_HW_ERR_GT_FATAL			/* Bit Pos 0 */},
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Does this again tie the enums and the bit positions together, similar to
how the mask macros also do above?

There needs to be a single point of truth for all of this.

I think this needs a redesign.</pre>
      </blockquote>
      <p>As commented above this is array which defines all valid bit
        positions irrespective of platform. Mask was <br>
      </p>
      <p>to determine platform specific applicability.<br>
      </p>
      <blockquote type="cite" cite="mid:877cq3s567.fsf@intel.com">
        <pre class="moz-quote-pre" wrap="">BR,
Jani.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+	{&quot;SGGI Cmd Parity&quot;,	XE_TILE_HW_ERR_SGGI_FATAL		/* Bit Pos 1 */},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_FATAL},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_FATAL},
+	{&quot;DISPLAY&quot;,		XE_TILE_HW_ERR_DISPLAY_FATAL		/* Bit Pos 4 */},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_FATAL},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_FATAL},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_FATAL},
+	{&quot;GSC error&quot;,		XE_TILE_HW_ERR_GSC_FATAL		/* Bit Pos 8 */},
+	{&quot;SGLI Cmd Parity&quot;,	XE_TILE_HW_ERR_SGLI_FATAL		/* Bit Pos 9 */},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_FATAL},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_FATAL},
+	{&quot;SGUNIT&quot;,		XE_TILE_HW_ERR_SGUNIT_FATAL		/* Bit Pos 12 */},
+	{&quot;SGCI Cmd Parity&quot;,	XE_TILE_HW_ERR_SGCI_FATAL		/* Bit Pos 13 */},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_FATAL},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_FATAL},
+	{&quot;SOC ERROR&quot;,		XE_TILE_HW_ERR_SOC_FATAL		/* Bit Pos 16 */},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_FATAL},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_FATAL},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_FATAL},
+	{&quot;MERT Cmd Parity&quot;,	XE_TILE_HW_ERR_MERT_FATAL		/* Bit Pos 20 */},
+};
+
+struct error_msg_counter_pair dev_err_stat_nonfatal_reg[] = {
+	{&quot;GT&quot;,			XE_TILE_HW_ERR_GT_NONFATAL		/* Bit Pos 0 */},
+	{&quot;SGGI Data Parity&quot;,	XE_TILE_HW_ERR_SGGI_NONFATAL		/* Bit Pos 1 */},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
+	{&quot;DISPLAY&quot;,		XE_TILE_HW_ERR_DISPLAY_NONFATAL		/* Bit Pos 4 */},
+	{&quot;SGDI Data Parity&quot;,	XE_TILE_HW_ERR_SGDI_NONFATAL		/* Bit Pos 5 */},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
+	{&quot;GSC&quot;,			XE_TILE_HW_ERR_GSC_NONFATAL		/* Bit Pos 8 */},
+	{&quot;SGLI Data Parity&quot;,	XE_TILE_HW_ERR_SGLI_NONFATAL		/* Bit Pos 9 */},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
+	{&quot;SGUNIT&quot;,		XE_TILE_HW_ERR_SGUNIT_NONFATAL		/* Bit Pos 12 */},
+	{&quot;SGCI Data Parity&quot;,	XE_TILE_HW_ERR_SGCI_NONFATAL		/* Bit Pos 13 */},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
+	{&quot;SOC&quot;,			XE_TILE_HW_ERR_SOC_NONFATAL		/* Bit Pos 16 */},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_NONFATAL		/* Bit Pos 17 */},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
+	{&quot;MERT Data Parity&quot;,	XE_TILE_HW_ERR_MERT_NONFATAL		/* Bit Pos 20 */},
+};
+
+struct error_msg_counter_pair dev_err_stat_correctable_reg[] = {
+	{&quot;GT&quot;,			XE_TILE_HW_ERR_GT_CORR			/* Bit Pos 0 */},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_CORR},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_CORR},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_CORR},
+	{&quot;DISPLAY&quot;,		XE_TILE_HW_ERR_DISPLAY_CORR		/* Bit Pos 4 */},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_CORR},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_CORR},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_CORR},
+	{&quot;GSC&quot;,			XE_TILE_HW_ERR_GSC_CORR			/* Bit Pos 8 */},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_CORR},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_CORR},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_CORR},
+	{&quot;SGUNIT&quot;,		XE_TILE_HW_ERR_SGUNIT_CORR		/* Bit Pos 12 */},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_CORR},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_CORR},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_CORR},
+	{&quot;SOC&quot;,			XE_TILE_HW_ERR_SOC_CORR			/* Bit Pos 16 */},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_CORR},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_CORR},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_CORR},
+	{&quot;Undefined&quot;,		XE_TILE_HW_ERR_UNKNOWN_CORR},
+};
+
+static void update_valid_error_regs(struct xe_device *xe)
+{
+	unsigned long mask = 0;
+
+	u32 i;
+
+	if (xe-&gt;info.platform == XE_DG2) {
+		mask = ~(0 | DG2_DEV_ERR_STAT_FATAL_MASK);
+		for_each_set_bit(i, &amp;mask, DEV_ERR_STAT_MAX_ERROR_BIT)
+			dev_err_stat_fatal_reg[i] = (struct error_msg_counter_pair)
+			{.errmsg = &quot;Undefined&quot;, .errcounter = XE_TILE_HW_ERR_UNKNOWN_FATAL};
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Nope. For one thing, the arrays really should be static const, placed in
rodata, and not mutable.</pre>
      </blockquote>
      My Idea of keeping it mutable is to avoid multiple platform
      specific arrays.<br>
      <blockquote type="cite" cite="mid:877cq3s567.fsf@intel.com">
        <pre class="moz-quote-pre" wrap="">For another, if you have a platform with two or more different devices,
whichever gets probed last clobbers the data.</pre>
      </blockquote>
      <p>Thanks for pointing it out. I had missed this particular
        scenario.&nbsp; I believe defining platform specific array is better</p>
      <p>because then we can ensure them to be immutable and we will not
        be required to have platform specific mask also. <br>
      </p>
      <p>I believe this will help with maintainability too.&nbsp; <br>
      </p>
      <p>BR</p>
      <p>Himal Ghimiray <span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span></p>
      <blockquote type="cite" cite="mid:877cq3s567.fsf@intel.com">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+
+		mask = ~(0 | DG2_DEV_ERR_STAT_NONFATAL_MASK);
+		for_each_set_bit(i, &amp;mask, DEV_ERR_STAT_MAX_ERROR_BIT)
+			dev_err_stat_nonfatal_reg[i] = (struct error_msg_counter_pair)
+			{.errmsg = &quot;Undefined&quot;, .errcounter = XE_TILE_HW_ERR_UNKNOWN_NONFATAL};
+
+		mask = ~(0 | DG2_DEV_ERR_STAT_CORRECTABLE_MASK);
+		for_each_set_bit(i, &amp;mask, DEV_ERR_STAT_MAX_ERROR_BIT)
+			dev_err_stat_correctable_reg[i] = (struct error_msg_counter_pair)
+			{.errmsg = &quot;Undefined&quot;, .errcounter = XE_TILE_HW_ERR_UNKNOWN_CORR};
+	} else if (xe-&gt;info.platform == XE_PVC) {
+		mask = ~(0 | PVC_DEV_ERR_STAT_FATAL_MASK);
+		for_each_set_bit(i, &amp;mask, DEV_ERR_STAT_MAX_ERROR_BIT)
+			dev_err_stat_fatal_reg[i] = (struct error_msg_counter_pair)
+			{.errmsg = &quot;Undefined&quot;, .errcounter = XE_TILE_HW_ERR_UNKNOWN_FATAL};
+
+		mask = ~(0 | PVC_DEV_ERR_STAT_NONFATAL_MASK);
+		for_each_set_bit(i, &amp;mask, DEV_ERR_STAT_MAX_ERROR_BIT)
+			dev_err_stat_nonfatal_reg[i] = (struct error_msg_counter_pair)
+			{.errmsg = &quot;Undefined&quot;, .errcounter = XE_TILE_HW_ERR_UNKNOWN_NONFATAL};
+
+		mask = ~(0 | PVC_DEV_ERR_STAT_CORRECTABLE_MASK);
+		for_each_set_bit(i, &amp;mask, DEV_ERR_STAT_MAX_ERROR_BIT)
+			dev_err_stat_correctable_reg[i] = (struct error_msg_counter_pair)
+			{.errmsg = &quot;Undefined&quot;, .errcounter = XE_TILE_HW_ERR_UNKNOWN_CORR};
+	}
+}
+
+static void
+xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
+{
+	const char *hw_err_str = hardware_error_type_to_str(hw_err);
+	struct error_msg_counter_pair *errstat;
+	unsigned long errsrc;
+	unsigned long flags;
+	const char *errmsg;
+	struct xe_gt *mmio;
+	u32 counter;
+	u32 errcntr;
+	u32 errbit;
+
+	switch (hw_err) {
+	case HARDWARE_ERROR_FATAL:
+		errstat = (struct error_msg_counter_pair *)dev_err_stat_fatal_reg;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Why the casts?

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+		counter = XE_TILE_HW_ERR_UNKNOWN_FATAL;
+		break;
+	case HARDWARE_ERROR_NONFATAL:
+		errstat = (struct error_msg_counter_pair *)dev_err_stat_nonfatal_reg;
+		counter = XE_TILE_HW_ERR_UNKNOWN_NONFATAL;
+		break;
+	case HARDWARE_ERROR_CORRECTABLE:
+		errstat = (struct error_msg_counter_pair *)dev_err_stat_correctable_reg;
+		counter = XE_TILE_HW_ERR_UNKNOWN_CORR;
+		break;
+	default:
+		return;
+	}
+
+	spin_lock_irqsave(&amp;tile_to_xe(tile)-&gt;irq.lock, flags);
+	mmio = tile-&gt;primary_gt;
+	errsrc = xe_mmio_read32(mmio, DEV_ERR_STAT_REG(hw_err));
+
+	if (!errsrc) {
+		xe_tile_log_hw_err(tile, &quot;DEV_ERR_STAT_REG_%s blank!\n&quot;, hw_err_str);
+		goto unlock;
+	}
+
+	for_each_set_bit(errbit, &amp;errsrc, REG_SIZE) {
+		if (errbit &lt; DEV_ERR_STAT_MAX_ERROR_BIT) {
+			errmsg = errstat[errbit].errmsg;
+			errcntr = errstat[errbit].errcounter;
+		} else {
+			errmsg = &quot;Undefined&quot;;
+			errcntr = counter;
+		}
+
+		if (hw_err == HARDWARE_ERROR_CORRECTABLE)
+			xe_tile_log_hw_warn(tile, &quot;%s %s error bit[%d] is set\n&quot;,
+					    errmsg, hw_err_str, errbit);
+		else
+			xe_tile_log_hw_err(tile, &quot;%s %s error bit[%d] is set\n&quot;,
+					   errmsg, hw_err_str, errbit);
+
+		tile-&gt;errors.hw[errcntr]++;
+	}
+
+	xe_mmio_write32(mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
+unlock:
+	spin_unlock_irqrestore(&amp;tile_to_xe(tile)-&gt;irq.lock, flags);
+}
+
+/*
+ * XE Platforms adds three Error bits to the Master Interrupt
+ * Register to support error handling. These three bits are
+ * used to convey the class of error:
+ * FATAL, NONFATAL, or CORRECTABLE.
+ *
+ * To process an interrupt:
+ *       Determine source of error (IP block) by reading
+ *	 the Device Error Source Register (RW1C) that
+ *	 corresponds to the class of error being serviced
+ *	 and log the error.
+ */
+static void
+xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
+{
+	enum hardware_error hw_err;
+
+	for (hw_err = 0; hw_err &lt; HARDWARE_ERROR_MAX; hw_err++) {
+		if (master_ctl &amp; XE_ERROR_IRQ(hw_err))
+			xe_hw_error_source_handler(tile, hw_err);
+	}
+}
+
 /*
  * Top-level interrupt handler for Xe_LP+ and beyond.  These platforms have
  * a &quot;master tile&quot; interrupt register which must be consulted before the
@@ -413,6 +630,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 		xe_mmio_write32(mmio, GFX_MSTR_IRQ, master_ctl);
 
 		gt_irq_handler(tile, master_ctl, intr_dw, identity);
+		xe_hw_error_irq_handler(tile, master_ctl);
 
 		/*
 		 * Display interrupts (including display backlight operations
@@ -561,6 +779,8 @@ int xe_irq_install(struct xe_device *xe)
 		return -EINVAL;
 	}
 
+	update_valid_error_regs(xe);
+
 	xe-&gt;irq.enabled = true;
 
 	xe_irq_reset(xe);
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------CgzehWtx00X3drQ0bVhcqrn7--
