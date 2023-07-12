Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC8FEB64DC
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jul 2023 03:11:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D2610E487;
	Wed, 12 Jul 2023 03:11:29 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA3910E487
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jul 2023 03:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689131487; x=1720667487;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=C7pijWwEqhCD/poT2x4JbRb+y0Dd7L3J5SxQfKLX5hI=;
 b=fSyvQvu2w8V7zLghgclrScKIu9xVEUIFi+wXnZuPJNohPf8HjGX1z+Rv
 WVW6sWdwhjOqqzmq+WJd+Gq3tDpi6puDwyzfKxAnIz/AXwcHngBcrgryn
 h0bQVEk/vjZx9hHRAK0uSxvR/WOVe6X12SfLeVs/kwMRpcO1a5ceWWRtm
 jCOLTVDI9KtAAxshUvg791/jWQez2V1i91sd5Px5NTu5LIrh4NT2Q4Ot2
 JLy0ouzsfc+KRraIfyBegEBEuI80HGVAFuKDBsbO9SMWKH0c4h3TL2Bg4
 V6J1+VgSm7chLhZyx21j0ETJ0lS0LVbKSCvc+FmgAml3dR20pQbr9iHOS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="344391486"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; d="scan'208";a="344391486"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 20:11:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="715414385"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; d="scan'208";a="715414385"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 11 Jul 2023 20:11:25 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 11 Jul 2023 20:11:24 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 11 Jul 2023 20:11:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 11 Jul 2023 20:11:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 11 Jul 2023 20:11:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqQoUGV/lnwLCmqqAmcWDdHiTkqhBoAZ2+GFUiUdazBSUOxp4ELopv522ofxhfLZFsy/e2/sOMzeAIpnPIzr7u3/ORoaT3bXPjqxWoOFeBL+OveunP1+iuVamFWdoxQDbJrn+1vkVX2Sx+haLUl7nI/hJ92zRWANR9vdeLQhzeW4aJCXLxHsBdjN8VdnZvFlNMqReG2khRPqu2DuVOiNdCHXFB/56EGHFTg98ZuZ4POfgLYPcG+DbQBEm71BfpMzWSRnN7I9ri11GRPQc9jAYfN2R4mwzjOvU3blHvogfL+kQbhDx86p79CpaHneTuDMpCjZZapF0K696E8YYDL+BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PlL9QO/Whh8W/hwtsVmkDJycm5UhXFyWRZjcKgVbITQ=;
 b=Rgm8dzvq3mFPujvKsD1HnzBLxaa1sB1L2CoQOEdi4NCKSZSVF5m3aCMgcvTTO0UOszePT6RDhlXSuntCG7lLinN/OyOpz+QojcRm0wjRG98HjN5E07A7+V/z49wcMjeizTRjPDDnJLsqo5FTaU5Ox7fcGn3vvlJBeYjiEvgmO8xi5p8XlIyIY/I8HCsZVGI82bNMUNdJ9Xk8vsoNgf3p7jVj8ncYiVWDS7LoeLdlCv3ycPvyLwkfrv07odkcDkATJD4iChdZFUbKrCsF71G4O2CrgGm2m5NYT9+8Lo6EUXrH64zdsWTN/047dlALdlowlPgfEGu7rwy2WSil/XwBoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by DM4PR11MB6455.namprd11.prod.outlook.com (2603:10b6:8:ba::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Wed, 12 Jul
 2023 03:11:22 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2ead:623d:b273:bd8f]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2ead:623d:b273:bd8f%4]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 03:11:21 +0000
Message-ID: <08824c36-4692-64aa-1774-d20a8c7d89eb@intel.com>
Date: Wed, 12 Jul 2023 08:41:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230627122113.1472532-1-aravind.iddamsetty@intel.com>
 <20230627122113.1472532-3-aravind.iddamsetty@intel.com>
 <87mt09daqu.wl-ashutosh.dixit@intel.com>
 <a6fbb435-6383-772c-703d-183f26a8144e@intel.com>
 <87a5w8cvmr.wl-ashutosh.dixit@intel.com>
 <04ae6811-9bc1-c66d-6cb8-640bfd8a9c7b@intel.com>
 <878rbsckzf.wl-ashutosh.dixit@intel.com>
 <3c4bec6c-7af0-ade7-91bc-bbd3bfa46357@intel.com>
 <877crbct36.wl-ashutosh.dixit@intel.com>
 <953a6abf-5e07-ef87-667a-57ceef40369f@intel.com>
 <BN9PR11MB5305E0D08C2C1705AC72BD5F8B30A@BN9PR11MB5305.namprd11.prod.outlook.com>
 <266f491a-66ac-083c-990f-bc99c42883d2@intel.com>
 <87mt02gi40.wl-ashutosh.dixit@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <87mt02gi40.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXP287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::24) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|DM4PR11MB6455:EE_
X-MS-Office365-Filtering-Correlation-Id: 14fb654b-f1e8-4e80-3207-08db8285aae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vlYEhKiyRX40DPIn7bmT6Zvbr0Fm7E0dwevL7e0LNeCMPWeNb5PQ8LpoWqdE3l9qL2gOPIelLT6gZZZH1mnBY2BlFpskR2mBckQQK2gD9r9qlKJx7/XtNAeILzyBghY3MYba0zWs7jMycv4KV1UVMhFDRsLTprHONuoDTKtZnxg66oW1/bqyrCyueWdzhv/jZq5JX4t8iB/loGvtBBYZe18uDjt+9Y6McG8daVLZDNxabRCQ6vyogf6GfDDDaYn1YRVFpx5VjZ5d627EYAUTgQwdlX8WCsFZj8GTKnFPtSHKnOVJjv8q0UgP+9/nw7BZW6D4Hl17aKY09Fj27fZi7TNViEXKytoC2Ucagtbk1Vyl42s6T6unW0xXRBvjzCeghKP0wXTHoI9zqO740sJAWxCHDp3FM4zRwYLbOv4rnSZEEUh6kGko79d3CZVWaS0f4+od5lAcqzWM/C01F9374p1J0cdcIAxOKIUTVq3lyBj+PThj4sjazlTTA5cl7chtmg/H6CEFKWZpskUoLMlYdEeh9ax7N+OahVi6IAFh5PBx6LJWRxsYWAjllL7fXA3u4zAV9ADt6Vhyj2w8qlMWre/jtb1qzesuKA72p9AcbaPPmA1xwFmu8LqapwwmCsRRx48kPFChhRfFzsApjuhaBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(396003)(376002)(39860400002)(366004)(451199021)(38100700002)(31696002)(82960400001)(86362001)(31686004)(36756003)(6666004)(54906003)(6486002)(37006003)(6506007)(107886003)(26005)(186003)(53546011)(6512007)(2616005)(5660300002)(2906002)(66556008)(316002)(66946007)(6862004)(4744005)(66476007)(8676002)(8936002)(6636002)(83380400001)(4326008)(478600001)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXJwOUdZNTZlVkRiZUdCRkN4Yms4N3hsUFRONnNsZ3FrSFFoTGY3anZEYmxi?=
 =?utf-8?B?bGlzY3NvbkhMWWNxSXA0RVU1dWYyS1l5Lzl4d0xSTjgrMW52L1N3d1dQV2Zp?=
 =?utf-8?B?cXdod2d1bkh3ekIyMTZDZ244VnVxZ1VxTXBtRmlPV3lxd1hOWk9LSjFNQjR4?=
 =?utf-8?B?WVRVMnlwckZPc2RNdE9udTFjaVpZZWhObGM1N0x0MGh4ektHdVkwQWF1em4v?=
 =?utf-8?B?ZkVVMjI3Sk10anFaTjI0eXpuaGRjL1d4MkNucVlLUXpmK1F4eGVjNjNuczk4?=
 =?utf-8?B?NUNaa3gyTFpEQ09mNmFDb0NJWjdRcDVXV1lDUHIzdVVPNGlSNDVEcnMrT3VJ?=
 =?utf-8?B?aysrTnZqaHhyVXNPYkRGa3lWeTBjMGVxSCtSWTZjcUErRkczTU9mZ3Zna0NW?=
 =?utf-8?B?cGd5NmsrOSt5NmFQK29CV014eFdWSmx2dmFtdlRKM2p1d25xekUyOVlwZEVF?=
 =?utf-8?B?YmRGYTYyNVVjbzVacDMwUnk4SllCcGxvcVFzTENYRWxSZlhQYnJ4Z0ZLREx5?=
 =?utf-8?B?SEJuZG1kdzFNRlM2SzFGRzdwTk4xMlhteTBYWE5nOHNuREhheXVJci9GWGhQ?=
 =?utf-8?B?ZHM2cXFCUWxjanlGWEVESEdVa3lJTDNCWTFidmIzUVlxWklZL1ZhNWIvck14?=
 =?utf-8?B?d3ZnT3hXTnY5b0ZhbVBmMlZkK3U3U29neW4wVlB2K2V4TDE0aWZrMTUwQ3Z4?=
 =?utf-8?B?WVJDd1hGa0lWTmJBdFRTU2hOU3lSWWFxOUFBcGE4dnJxeG5Fdyt4NmphUDBR?=
 =?utf-8?B?TkRXKzF2MzFHczV1T1lzZmU3dzN2ZlM3QVpXUlpzaGpPekI5Y3c2NXBndVlQ?=
 =?utf-8?B?WFMrbmFERVAzaEs1N1RzNTRYR0VhOHRMRjhmQnNqejU0NVhHeHV2UDMvbWpj?=
 =?utf-8?B?eEJCVUsyd1hGZlNjVjk3SkE1dHRYeDE2SFViVXk2a2JrUXVBeEpoL3NzZjNa?=
 =?utf-8?B?MzJneFl0cHZ5S0g4L2lrcHlSd2g3L2Y4NElLQ1dDQkdKeFhPa0ZRV1B2a0t1?=
 =?utf-8?B?QTNlVzJOdTBRa1lNMVF1eHNsQldrdXlzbHY1S2FmckhHUk5tb0dwa0FmZkNH?=
 =?utf-8?B?czdSeGtudnJYRVZHSkVya1JlRlhaQWtaUXVlc2FHRnZqV3RNTWZqK1VrRGNr?=
 =?utf-8?B?NWdGdTE3eFM1UGxVNXhDU0xGUEl5V0xad3NGeWRDMjBLNUtHMmN6aVNRR3Bs?=
 =?utf-8?B?Ykg3MnhITkNpaTNQdDJZOFM3aDdod09mcVpNa0t3VnpzRzRQcW9EMkhwVEh2?=
 =?utf-8?B?Z2w4UlBmWklVbloxeTU4cWMyRWkxVVVjYUxFU3ArZGFpWUxxdzhDL3hZUkpI?=
 =?utf-8?B?NEF5ZHE3eWR4Ti90bmpUajFKYXg3YkJDa0d3L0RiT3RKWlhQL3FWcHYzWFIv?=
 =?utf-8?B?U3ZhckVrZ3Y4Q0w4emFUcmhGK1JOb3FlaTRBcG5QVUIweXVRdHRhNHZNTVl0?=
 =?utf-8?B?NjJTTkhYT1kzKzEyUkxXQk9ZRU5hdERNNTYyVEFzZjk0bGlqY21pbE1kMmcw?=
 =?utf-8?B?U0VvL2NpQzRSNmlsYW9HVFZLWjFlQURCZkJFTkVJUVdtbDMrSGJpalN0T0ti?=
 =?utf-8?B?SmtZN1JRTy9BM1BQTmhVODN6T1NBYllia0dUdHVQNnh4Ykd2YzR1TkF5MjJK?=
 =?utf-8?B?blI1MWtLdWx4YlgxM0FXZ0JhK25mTEhRNFpPS2owQUt0dWxUL0YwblVhQW8y?=
 =?utf-8?B?a1RjQmNoNEVNRnlpdnVWTnEyWCtJb3FPTzJOTE1sU09zc1h5a3NKL3I2eVlv?=
 =?utf-8?B?d2ErOEl4dFhuSXNmOW9MRXAxYlRGTmNRdmU2QTljSjlIUjROUnFtcXNheFFy?=
 =?utf-8?B?dE15RHVGNmVlSFpSZCttMWxqTEg3WDVsRmJUM2tIRFJDVjdaQXdHYWcxVkd4?=
 =?utf-8?B?N0t0UDVqeTl5c2FFdlFFYVdDeWROOVNaVno5alY3UmtRTGttbnM3NXErelQ1?=
 =?utf-8?B?aUp3Sk1YWHZEenNaaUp2aEVzYmdPdUNSMEYxUk4wNGpmd3dHQTRwU2c1T29u?=
 =?utf-8?B?TDkveGxXQjNOWlViMVl3R0NpWTN0ZFNpQm5LVFFKdTE0cW8ycVo0QTRGalBS?=
 =?utf-8?B?Y2pvd0Z0UVdDTGZUd25MTXN1MjdmZHpoakJwVytaWC9JbEtueDJMVHRaTExZ?=
 =?utf-8?B?ckF5bFoyUk9aejczQ28rcUszWjJxNlVhN3F5cVB1ckt6aE5BM3JnNHRvdFN5?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14fb654b-f1e8-4e80-3207-08db8285aae3
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 03:11:21.6397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6o3LrKZfd1HM2MrMpkNxHJSmCR08IsaiM9ByTNO+kBkiVkigx0vj82klNetgxjLhWCEcMmJZw7RSyUkxH1TioJWWgvzuXCdvuP+RhHuW5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6455
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/pmu: Enable PMU interface
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
Cc: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 12-07-2023 04:40, Dixit, Ashutosh wrote:
> On Tue, 11 Jul 2023 09:19:24 -0700, Iddamsetty, Aravind wrote:
>>
> 
> Hi Aravind,
> 
>> Please let me know if you have any more questions around this.
> 
> I've asked. But you probably know that since this is uapi, to merge this we
> would need a fully reviewed UMD (non IGT) merge request which consumes what
> we are exposing. So while we are reviewing this maybe let's ask L0 etc. for
> the merge request. I looked at xpumanager but didn't see it consuming what
> we are exposing via PMU here.
Hi Ashutosh,

For the UAPI consumption we can use the linux generic perf tool, won't
it be agreeable.

Thanks,
Aravind.
> 
> Maybe we'll need an ack from someone like Joonas too.
> 
> Thanks.
> --
> Ashutosh
