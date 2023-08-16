Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE780C001B0
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 05:49:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27B710E2C6;
	Wed, 16 Aug 2023 05:49:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394E110E2C6
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 05:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692164950; x=1723700950;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TSHiQNepB0O3hccr8PqqcpP34s3ZFOVKQtgy03ZLpvo=;
 b=CjpBf7CFDd/zamtfN7NvQdpMyvq12RoLVujUhG7fU09Li0WIS6TLeg9f
 YDSRIsMslsbsd+YU2zrs1zRFuAd7BAiITtTIiAegdBiLR112f1BwwiyZX
 MoilaujRVROCAIjyXEpssbKc14IG6SSvU5Ew0Z04+H56kg51cUXWZc5pj
 +gxcKoFbYQL6IKnwywi7szCAmEGi3BWMHWD7pJxjLhxKsvBtb+FFz5Zwn
 uNTL22RFwiQrCBrzW0ezbvbJoNpI1jBQ5YhsRYrz3ZXj8Peb6QpEyCLSf
 u9tn4JK2RJEe1qC1zGHHG5B6jIgV8bitdlHjcclQH8xIHEwU3fZgADzaZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="458799935"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; d="scan'208";a="458799935"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 22:49:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="727636361"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; d="scan'208";a="727636361"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 15 Aug 2023 22:49:06 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 22:49:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 15 Aug 2023 22:49:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 15 Aug 2023 22:49:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOYU3SfwObhb860JdFkGZLROdQYwMeLfr20wAS7LRuXxUkcJI3ltPS1K8/cOj6tOlmFFyADUBPzbYw1GU+2R8iWCpB4YxzFsGbdSegYSay6DXwWuZNMcHpkERenJ9Nbun4qmAMnDK9LycJjuDf+5oFzib7DFJTNj1o6K/DQpu2JOo4WxGYSdCy1SASVCT9uzQs7gNWQeQcJfyzpuh8Nt9a1v9cbGOzni/DxMXIfsFRbNoOzBh2lpOf2XqjvsTZXJkF7R9U2CkdgesS8KWV8ycy2FIGguatg2Ikk23yeyKDKLA7xQ6rL9+a9gZwlvcxnfPKb7abSVygyr3y3nU/6ZFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xhu8nbKWlgss+wKwmX5QfMIuOEkMdK3zt2JljOVqxdU=;
 b=dJXAlFTeBcKy1SYkbh96umixc2kxlHH7pmFUj4T3lJIBOeb+ZhlDwEYVIrdbUJAeOFmnPZ+jSaKRo+z20gV1FzG51nTnjpt8tLTIRhHBHKYbiNlc6Z4oCWBgCzzJ8iLGspZqrKgYyc1N2B6xpPUkn65NwJAV+0XdQafUusmN6H/1r44s6kNiTZaE88lA5he6PpUgUujddDeOSRZJDtUyd2aS8a71yRXn0/gzitiBI0/KPpaJTk+pl3FhiamPXCCwE0aiqd7faLv3FgUa8hM5DpaQUxUuLolXklugfR6spWcyhaMyt697budCNYhd4RyfRlCcNnH2aGfsMfpBosaRMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5480.namprd11.prod.outlook.com (2603:10b6:208:314::6)
 by MW6PR11MB8339.namprd11.prod.outlook.com (2603:10b6:303:24b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Wed, 16 Aug
 2023 05:48:59 +0000
Received: from BL1PR11MB5480.namprd11.prod.outlook.com
 ([fe80::6bee:aa5d:26fc:3fd]) by BL1PR11MB5480.namprd11.prod.outlook.com
 ([fe80::6bee:aa5d:26fc:3fd%7]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 05:48:58 +0000
Message-ID: <0d096901-3085-9b25-5d4a-d7c1adb44900@intel.com>
Date: Wed, 16 Aug 2023 11:18:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230814131213.1620252-1-aravind.iddamsetty@intel.com>
 <20230814131213.1620252-3-aravind.iddamsetty@intel.com>
 <875y5htupj.wl-ashutosh.dixit@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <875y5htupj.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::12) To BL1PR11MB5480.namprd11.prod.outlook.com
 (2603:10b6:208:314::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5480:EE_|MW6PR11MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: 45fa479f-73f4-455f-d452-08db9e1c7bf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zyBSWSOmDO4jydtkY4qBDrYQK4Y+u5gUHXSKktsM20xvUStRQXBsXxNGvZz3Gb2ONiWAWdj1O1TWxAdTDHSqZ104ePiWrELm7eANiTkcXQoyNUwthJYDVIysqwCoY4wY2E1zYmOANVmGzEjJTXrVsgtAgvvC3ECMSfgiLeNwHRCmCt6Y9BsJtnQUSl6NbFSY2JZWwxxLyAFLLrwaTXpFnQuQS/laTQ+KHB2ZuuQfN4IbGhB6ZAnz3MKEs7HxqxZcOHsHoB3bcxGBRLrq8BZ+iB1z0IxgrUscDqI8N73LtlZ2V6G0TKqOXcR/jjCuwDLFw/uEcZAPseqZI+qJ6dLnuW29A4DTVZg8+S+RbUKxzxJh5RMH8qM3jaX5hLaFZMIOQYHerxQ++/ZRtQko2BDS3vQvN3RCXdsfUyAHlrf4WNxvO2xugABAQEqc8SxeRfv8LPo0T1vz54hJEj5Q06ftqSVs7IEM6WvgI6AFa8CRsAuqICx8h+hzd4vBBrMW9wzf/ZL+pe6aZmBOB75d335i2aFPpHOctlJ3hwQI76m7KaTdCfDtxrBQY8Qfty9EN8nUfzpv/U64Cona9T+JbFNWOSKBfwtTH7KttJghmmovUoFgs0qOKoAx5mkFPF7KsV0uYrixB3GF6PeC+Yf4yYREWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5480.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(39860400002)(396003)(346002)(136003)(1800799009)(451199024)(186009)(6666004)(54906003)(31686004)(66476007)(66556008)(66946007)(37006003)(6512007)(6486002)(6506007)(2906002)(478600001)(26005)(107886003)(5660300002)(2616005)(83380400001)(6636002)(41300700001)(316002)(53546011)(8936002)(4326008)(6862004)(8676002)(38100700002)(82960400001)(36756003)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDErWEFrZVAwTlRsYkJFdktpcy9xWkROMnJXR2Urb0FrTW9hRGhjZnZ3Y3FL?=
 =?utf-8?B?bU9scy9ERDEwWmFYRWpIalp5MSsrRXBTZ1dmZmFWQzFTWStWbkJ3SGZ1MjRG?=
 =?utf-8?B?eWhFbDdDK2tIWmRPMGpRZ1FFb2Ryc3JjbTFXK0x1amFSMzdVS00vNHVsckpi?=
 =?utf-8?B?SUFjZUhkUFdnRDE4VGQxcFVzbDR5bnU3c24vM1RsSXBweHdPWGE3ZC9hQkFG?=
 =?utf-8?B?dEs4Ym43WWxGWTFNSmRwTFhrdEtSaERxTmtMYnFYQXVNRkNGUmFMZW1EWDJq?=
 =?utf-8?B?UEZlQ3pCVkNsemcxYzIrcGxKQ21XR2pLVTNmVFlGZkl0TnlPQmhiTWc2R3cw?=
 =?utf-8?B?MXc2VE9hcU9kRXQxSVdORlRiQlAwNk5Qd1A5OVRDdCs5enYyS1N3azBYdWpJ?=
 =?utf-8?B?R04wZDFmaTB2aXhySFJGR25TRVJuTnAvRmtBcWUwY0VoUStZVStFY1FtcG5x?=
 =?utf-8?B?ME9raWMyMDdIdDVlSDRZZlRyRTFqMzYreGxJODZDRGhpVVc2RC9pUjhySDMz?=
 =?utf-8?B?OGdTSVVkWSsvU2NmUTV5MmhvS01JQkg2TVJMTVpmSThydWhGb1F6WVl4d0F4?=
 =?utf-8?B?eFY2L1FRWVdVVzR3THkwdWhTSVRjbnZEcldRb3RTbk5yODhTd3A2cE4ySFFW?=
 =?utf-8?B?bWkzS3BTc0N6Q09Bc1BLU1E0elFJVFVjWE04VndCOFdDRFhaa3N1SlpBKzNN?=
 =?utf-8?B?N1dMcEwrVENuNGNUdkl4QVdxZEpkcU5sY3JpcG5wbjE3aXZyb2lnWUFzT1kw?=
 =?utf-8?B?TCt4aUtuNTJ1eG04LzBzQXoyUGJhT0ZDNDlTS29GR1g2aVR2bWJ5Q21lUXZv?=
 =?utf-8?B?R1dDREpuelRwNWpaeGVvcFlBaVVvU21wOWQ4NitkTWM4T0s1WkxETUdDbGx3?=
 =?utf-8?B?QUZ0dUxiZEgxTmY3cXJGR21UemlsdzZmWjVvUFNKZk03VzFON01uamVEeUZq?=
 =?utf-8?B?UTQzVE4zdWZsV2pDZWpQUUNLSm1iRExGS3NkRW5UamVGdG5zdU4va0NQbWRQ?=
 =?utf-8?B?amE0ZzJRNnkwVmJVNFhEaGdsVnA2dnZlcjRLeWUrbFR4Y3ZPV2FBVXNNUmNT?=
 =?utf-8?B?a21Qd0J4RUl0NEJ0OExvZkNNZnlDZ0c3MUwvdzEzZ3VtN28rNHpac2pycWxO?=
 =?utf-8?B?d1M3bkNqUEFleExZRVZra29IbFN3NFVLNFZ0c3duamx6Y0VndGpHTy9abzh4?=
 =?utf-8?B?ajE3STBrb3l6Q0RKSFJoQmpFSTlGT3F1VjVNNnRmaHVXRWpCZng4dVQ5NzlF?=
 =?utf-8?B?ejFrbWpJZmFUM1N5R1hSMXk0dXhlRHFTaWVERnlSaldHY0drRnl1c1FqSE81?=
 =?utf-8?B?R0I0MzgxTHQvUVdkT242MWc3QmtuUGJnVkdVNEpFTlZJYmxxVUFZd0k2bGxw?=
 =?utf-8?B?cG5kTE9ZZDFKd3UxSWczN1NBSW5seWgyUHlzTEZPN3JQL1FnVFRIVWczZlVW?=
 =?utf-8?B?bTBjYXlQaW1HMXZDMUU4ZkVqQnYybC93RFM1MmI3UEhyMXpWTi80d3U4YTJJ?=
 =?utf-8?B?QnljZ3lKejlBZjk1RjdpZHQ5UnVMditWUm9mdEZ6eUgzcnAzM2hHazB1RXVY?=
 =?utf-8?B?bU5VMmFvTUJ5dDBVb3hVemxOdlYzSWNpaDk2UVhDaGRuaEFWenVDWTU0VnJM?=
 =?utf-8?B?ZEhidFlnbFZRUmFlTlV3Z0VIa0FzbE94RmZ5bHlTVWt3NnFmMXd1aVlnQ05O?=
 =?utf-8?B?NTlWbmdwZWdOQ09mSjJMVkRHMjZmNXJtNUYrUTlYbC9xUlFYclZXWXp1RUxv?=
 =?utf-8?B?RXVENlY1Ym1TTzVZVElqTHlSaXI3UFBwdGFhaGlXRTJVRUtmaXgvUkxsd1V2?=
 =?utf-8?B?ZG1HL1JWdjljOTdwQWtFRGRvSitOTDlqcWVqcndSYWgwTkplR1JkejhjN01G?=
 =?utf-8?B?SEVMZHFWajlvU3AzRU8yOUV3TWZIY2dlaHhWNWwrdWpzUVhTYWsxU29aa0Vk?=
 =?utf-8?B?RWkreEg5bVlTQ01LUCtCbGRURnJ5c3lEdVpyQnJRZ0p3SFVEMGc4WVp0YU5Z?=
 =?utf-8?B?a252azlKTHkrUDZtek1kODFYYmxTd3QrSE5ZT3R0TXk4WEg5c2JlYmdVZ0Vl?=
 =?utf-8?B?VVpuZENZejVjQm14bzNZUzZVSmRCMUN4dmVESncyNys5elU4LzJ4T05Sb3JL?=
 =?utf-8?B?YzZKU0RiRytSTTgzVXNyVWZXb0FabFFzbWxDcUVQZDNEMlRHUGlUNldHYlhV?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45fa479f-73f4-455f-d452-08db9e1c7bf6
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 05:48:58.7596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRMZw2jHi5+wsUZVov+5kDLhTODHoUlpYJgeMbBBDMthbFYAfTQT99vdF2taBv3tdj3xNyhedAPbkTQCxUnQqGR1FaY8BHPutgEAPjzvwFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8339
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 2/2] drm/xe/pmu: Enable PMU interface
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 intel-xe@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 14-08-2023 22:41, Dixit, Ashutosh wrote:
> On Mon, 14 Aug 2023 06:12:13 -0700, Aravind Iddamsetty wrote:
>>
> 
> Hi Aravind,
> 
> So I am not going to review this version of the patch. Let's do it as was
> discussed today, I am assuming something like: when the event is "opened"
> do a xe_device_mem_access_get and forcewake_get from some non-atomic
> context. And keep these references till the event is "closed". Also since
> we are keeping the device awake through PMU data collection, no need to
> cache register values during rpm_suspend?

Hi Ashutosh,

I was thinking of a  two stage effort, first have this series merged in
the current form and extend it in the later, please let me know if you
think otherwise.

yes we still need to cache registers during suspend as that can happen
even when PMU is not opened and also PMU can be opened when in suspend
and we have to return the cached value.

We shall only take forcewake when any event is opened and when the
device is awake.

Thanks,
Aravind.
> 
> Thanks.
> --
> Ashutosh
