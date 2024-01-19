Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE74C4725D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 10:18:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4528A10E185;
	Fri, 19 Jan 2024 10:18:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2E310E11D
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 10:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705659532; x=1737195532;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0ZBADgGLtwUfKDaFeVDNZaX4q+BpVUcDVu60Wze4G0w=;
 b=dzGuwSKxqUPfuZ2TshSftxnrEeGjs2ntORPSZf9FzM0mc11k52dCyp2K
 6eOn3esBQcNPLUSTQ0Y9m1q7er9RNzT8bB96zBdlNohxoBKVOlkk6vdx1
 kfcXLDcgGetZMbOSOdioM+mxZwC2Peh2odL3SHoGiMEMTC+eAPj8eazxz
 oWRUOtJmH++4eW4Bsa/RR4IgjeUbzrx1jTXaKyivp5qRGAV+/BIvERnuS
 5Oem/mHWDCq+CBiptVfkWWxwVYWNxMUoun2IBy4GK+NB228Vwh2E+4oCP
 tsZOBoEuCXZF+S441DVWVn1zeyD6aY8H9pWfYtI0DmPJCynGqhpwYK1xq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="399584632"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="399584632"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 02:18:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="653173"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jan 2024 02:18:51 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 02:18:50 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 02:18:50 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 02:18:50 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Jan 2024 02:18:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTGI1bbIyRZ0U2RdcSSB26TqDaGUW8MJ1Q7JtplWedLfzJzVayuluGGTrHGeeSPZgDVR/Ysu7GTL0ZAX1ez2tSUqE92EW4XZyyNNigOp6SNvNdxIzVywgfucdn79A6vm//YOswkvQoKAn0D0fsN+wrmQuPwvz85FjdXl0AIAnb0OHDDf7SfOx5Kg6tt6TCcwyG0IbNlZ0rIMRB/1HhcV7S7tKmzMJOv81/ytXTC6XfukaQrm4U+MJj92dQmQ3Y/tS++MSLoA1Y4DNyBb5JP/GIQehWRrNTHiccxKpnObMqteRRGAteZHln/66yH7FADTD5Zs5G0WMBmOnohFrlf9KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtiLFnlxTHTRN7El072AULsQRiO5B2aLZI05hYFJNXg=;
 b=gIjPtAKVxMSHLWwEWdurY1gmnzyZltLbwWQQkhgcPAreU50sa2ILjNtieu18rsUUJoPaZJucbFCdrJkf6mOcHwpKYexf9gTLgmr9R/zdCrhAqVMkcd7q7xXO6StD3qIFe4aSFvqroMqqGXx8ifPTyoRKMxuDVYeH+7p2eY3+fWm0EFb6DKeAOByH5s/j4gH1b2MO3IpkRHi38E/rjCGHwoNfm9xprx2YCku3np2pFhcNumElUlfyIr/Salr425ly4Il7zIeZ55svKMTJMKhAA+02IXoQwaw1gE3wqAQAlggOa0hnQLp+bmC+2sL5lxLK/h5E1y294bVA6gJQZORrXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 PH0PR11MB5660.namprd11.prod.outlook.com (2603:10b6:510:d5::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.26; Fri, 19 Jan 2024 10:18:45 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::b651:485:1973:7554]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::b651:485:1973:7554%3]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 10:18:45 +0000
Message-ID: <72e53026-1bd6-4637-b2c4-bf9065c13df3@intel.com>
Date: Fri, 19 Jan 2024 11:18:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Set PTE_AE for xe2 dgfx platforms
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20240117144851.22952-1-nirmoy.das@intel.com>
 <20240118004924.GD5549@mdroper-desk1.amr.corp.intel.com>
 <7cad1473-e49d-44a0-a5e6-bb5b06f6d293@intel.com>
 <20240118160812.GF5549@mdroper-desk1.amr.corp.intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240118160812.GF5549@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0239.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::10) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|PH0PR11MB5660:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fb4a5ad-9dfd-477d-2de9-08dc18d804b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YaIbLcytK21iYevDnqx0BI5VWw1TNS/VTmlJBzc+/IYFuMpeuI7btmTyLoX0TXsaOz5LIhFyl/VBkaR0BeQEjdHse9gbUyLvuAAzrtcpBDXK1Nx3Igi9nVHYgVZZvtBH1q7ITJN3fVmOgvdydnHafDU2FzDP6nDPUUoBhBV/K/zBy93RLEDlDQ/HAMIJY0IWit9lpjmfRlkiWhaOot2yUd8vlkhSjJL2AnUpa38VTHAogd2o899gDYXmql34AVMMNy18OkPVH5OqIq4+2DkxwrsmAc5QzvdmjKoJ0DpXRHdX+BfE1OWIVNO8slIYrA2dxU7MZP3L/8gWmAYHGRZ8C6/IeB4Ki0h3jiKvD94XsuVXLhLJgKfmWuAcje6ypiOKeiaTDtPxRQvhhilj/3LrTJ/5H3AmEKgTy6cPySX6duUd+QSbUvAzMbflw43ZBXthL8roo74nffOeU9Onn5TNBP5ZFEZNkm+RPJlL5zHF67YJdFpbwIQD1yK18LOhsxhSsAWeZ82cnXqUmKu/KzfiAs/SY5n/N5A555xIxKXS3omDz1Cm6n71YI3AqS3liMSTXY2mONKLONcVPGcQvVjLxVkKYC9NqMDgNOxtIPunv07hK4WT7xcr4itz28jiW3/U
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(39860400002)(396003)(366004)(376002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(26005)(107886003)(2616005)(6666004)(6506007)(6512007)(53546011)(83380400001)(5660300002)(2906002)(44832011)(41300700001)(478600001)(966005)(6486002)(66946007)(6862004)(8676002)(8936002)(66476007)(66556008)(4326008)(54906003)(316002)(6636002)(37006003)(36756003)(82960400001)(38100700002)(31696002)(86362001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWZuTlR5TnAzbHFMUXQxT045TVpLdTFwVzJMSkN5NTYzd3cxTFFLazlFKzJB?=
 =?utf-8?B?VzFOcU9qWWFrY3UyRXVMOWQreW5BbGZwa1RhL1V5WUZwTDlySnk1RmhtQ0ZJ?=
 =?utf-8?B?ZWtHL0V0clV3TzFrWWNBRE5XNkU4Ulg1UjlHaUczRTd5Z3YzMkwzczZkM3JH?=
 =?utf-8?B?YmR4Zjd6QXBHODdBUkVCTTVHN1dpZWdRQkRjc1EvUVIzUFZ4b045S2ZUdGpC?=
 =?utf-8?B?eUJ1MjdlQlhubEE3Wk4vOWVtV25KVU9vakRlNFJCL01rREtncW9ORjg3cWp4?=
 =?utf-8?B?VDA2Z25XYTBlM3o4N0JVUVVGNnRtbHpoQWNzTzk1eWpqMXJIcUVIaGY4RzBJ?=
 =?utf-8?B?YkZ0c0tQYlZteTFtZE84TCtETi9DWEtUdjJFVWQ4UGJrRncwQksxSHBlekkx?=
 =?utf-8?B?Y2xtSjRpUkdjUUtjU0c3VUVTUGd2Y1d1TUtld3Vva3dqckJGUUI3L2hkaVc0?=
 =?utf-8?B?V0FoaHF1T3JiMlhGZy9Dc05kQS9aZjRncGZ6QXNSOThsRzJOQ3dic2ZHQy9O?=
 =?utf-8?B?VGIyOTZVZnFWeXJaeTJEWlh1SDRKYzgvZWVEZGhvZHZ0WS90SWZ4Q2FYRTBW?=
 =?utf-8?B?KzJjWXVZZjE4R3lVcWttRU5zNDZsWlZKb1BST1dVN2NRaUtKS2JEVmVhdVlN?=
 =?utf-8?B?dlVDdzFxdGQ2TDFBOEV6a01rRk8yTVJtd1dwY2pWYk8xNmZaUFhJVU1aUkI3?=
 =?utf-8?B?U0QreVlkM3FBcXlaMjdqVi9GR1I3ZnBhN1QvOUJYeDFkMWFyWjQzZWo2SXVB?=
 =?utf-8?B?dzhzQzNDQ3Y4SkMrM1FFVUtQMXV6Z1cvbFkwSDIvVWhMUEhLSC9NYmY4WEMr?=
 =?utf-8?B?Mkl6S0VPamN2S0tHWTM2VUpTak1zdGt0LzdOM3RMbmVLWHdOcXRQUjFDd3Az?=
 =?utf-8?B?RlFKZWNBTS9FNUkyK2VBbWhmVkV1YXh3NWxhRCtBcFliK0ZYMCtWM3c3MHh1?=
 =?utf-8?B?MGx1V1VmRDJDNm85djZydzgxcjlGVjZrVGhycnpPanhHWHdmS0JIckV4Zmti?=
 =?utf-8?B?cllBRlE5ZnZFdjF2TGRWUTR3elF1cEd6eDA5RTIzbmRqQStuUDNqWXFOa2cr?=
 =?utf-8?B?VnNSL0lHSHI5cVdZSTZuaEM4K2pQVWI1T1I2RndLbUw5amNQY1pLTDVkRXNq?=
 =?utf-8?B?ekZaWjMydUtqcXdRazlIR0FwRmFMV2I2RHZJUVJNTDNPYU9nbTlEemlkZzB5?=
 =?utf-8?B?N3pPa0NXQmFscXNpcFVjblM2VEZDSlVBY3g5ZnMyYUcyODBaQ2ZwekxHb3dp?=
 =?utf-8?B?b1Y5Rnc1WHF6dFhoZ1JiWHo1bkYwb1M5RHExbmRwTmYyRjYrTGZRZHh1cXFJ?=
 =?utf-8?B?bDllTVZLNndqQzY0bkdORlpDYVRJOHZBdGhGU04zNHA2NXFDUG5QZTI5U2Zs?=
 =?utf-8?B?ZzErTEVKZHQwWk5iYktMWkJWOHJpMndiMWFTZGQ3OHJwckl6NC9ib3MxemJZ?=
 =?utf-8?B?dHZpZEpxcVgzYitSYmJvZmFEd1lvS1hNdHhaQnI0eFcrblllUmd4YmliSzNE?=
 =?utf-8?B?V3ZWNTN5MmxMT2FRUzdnVGlkMEE3L2p3RTJmaEQzVFhZTUxWRVhRcTJhbVYx?=
 =?utf-8?B?VE42RGVCZVZoMGhuRHN6U0FwWldVUnIyV3lFdXBiSUtHNFpSTng1NGcwaWdO?=
 =?utf-8?B?c3o1aFFkUHVnMkxNOUpZUmhGRUxlbi8rK2hhYUpCdTJ0bVBEeDVjeFlwTlhS?=
 =?utf-8?B?V0hEMTVSWUZXSDZ4Z3gwaUorWmtXKzVJcWpxRkt5Qms2bkpKOHZRUWhXV3cr?=
 =?utf-8?B?cGpwTUFpU29qMjRmNXU1VkRrc3BvWmtmTytFbVpWakpteHl0V2llWjJoOEpk?=
 =?utf-8?B?dFNkbmI4d3Y4cjdnZ29mbldOZjZNWHA1V1BYbjRCQ05IenZ6RjhSbDdqT3g1?=
 =?utf-8?B?elg2b3lrMVI1Tk5TWUIwOUlObGtldUl0clNlSS9UdmgwMGc1cDNmeXdNQjNz?=
 =?utf-8?B?RDltU1hjQXBPNEhKSHdYSXpVS3paYTJhUjNMeGNUUmhuUW9DQlJJeGZrRGdq?=
 =?utf-8?B?VE5sQ1RoYTNWdGFJS0pLZmhTUDF1S2Q3UlRBWDVTWm9Qd0cybXZ2Y1ZKTEhR?=
 =?utf-8?B?UVNOamRhbDNMMXVDNXRNQUdKelozNkFDazFWSFAwQ2tJTGpSWXlmSStsT25p?=
 =?utf-8?Q?OBxWqX6tzeX8LnrT3fDAGEQdq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb4a5ad-9dfd-477d-2de9-08dc18d804b2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 10:18:45.2180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Twf3z915lshw1tNjDz4DNOFtlo6ShB+8QgdMOg9WuK09Sxk9V3O/ePM2whXfhTYEzZK8mkIC7vHaufGg5V4Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5660
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

Hi Matt,

On 1/18/2024 5:08 PM, Matt Roper wrote:
> On Thu, Jan 18, 2024 at 03:42:56PM +0100, Nirmoy Das wrote:
>> Hi Matt,
>>
>> On 1/18/2024 1:49 AM, Matt Roper wrote:
>>> On Wed, Jan 17, 2024 at 03:48:51PM +0100, Nirmoy Das wrote:
>>>> Atomics on XE2 works for both type of memory so
>>>> extend setting PTE_AE for dgfx platforms as well.
>>> There are no Xe2 dgfx platforms yet, so it's kind of hard to review this
>>> fully,
>> I should've have sent it internally.
>>>    but my understanding from bspec 71539 is that in theory a dGPU
>>> atomic operation against system memory would probably only be atomic in
>>> device scope, not global scope.  I.e., it's atomic with other GPU
>>> operations,
>> This is my understand as well.
>>>    assuming the CPU isn't also accessing the buffer.  But if
>>> the buffer is shared between the CPU and GPU, then you'd want to set
>>> AE=0 to ensure that we get a page fault and can migrate the object into
>>> lmem first.
>> I think on system memory, AE=1 should be the default and opt-out by UMD with
>> a uAPI. Basic operations like
>>
>> MI_ATOMIC will fail otherwise which if understand correctly MI_ATOMIC should
>> work on system memory except
>>
>> on PVC because of a know bug. I added a small test to check MI_ATOMIC which
>> works on dg2 system memory
>>
>> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/bat-dg2-oem2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-system-memory.html
>>
>> and also on discrete xe2 but requires this patch.
> I think it depends what you mean by "work."  My understanding is that
> barring hardware defects, MI_ATOMIC can always execute and perform the
> requested operation on Xe2.  However in some situations the operation
> will not actually behave atomically from the CPU's point of view.  The
> AE bit in the page table doesn't make MI_ATOMIC work/not work, it just
> determines whether we want MI_ATOMIC to trigger a page fault or not.  In
> cases like this where a buffer can be accessed from both the CPU and
> GPU, and where we need true global scope atomicity, then we'd want to
> make sure AE=0 so that a page fault is generated and we get the
> opportunity to migrate the buffer to LMEM.
>
> I think the expectation of userspace would be that MI_ATOMIC is always
> truly atomic.  Wouldn't it be better to make sure we trigger a page
> fault by default and only turn that off if userspace explicitly tells us
> they're okay with relaxing to device scope atomicity?

Yes, if the default expectation is global scope then it makes sense to 
have AE=0.

Had a chat with Oak and he confirmed that for L0 the expectation is 
global scope.

>
> Either way, we should probably wait until there actually are Xe2
> discrete GPUs; at the moment this is all theoretical since the only
> Xe2 platform we have today is an igpu.

Sounds good.


Thanks,

Nirmoy

>
>
> Matt
>
>>
>>
>> Regards,
>>
>> Nirmoy
>>
>>> Matt
>>>
>>>> Cc: Fei Yang<fei.yang@intel.com>
>>>> Cc: Jose Souza<jose.souza@intel.com>
>>>> Cc: Matt Roper<matthew.d.roper@intel.com>
>>>> Cc: Brian Welty<brian.welty@intel.com>
>>>> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_pt.c | 6 +++++-
>>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>>>> index de1030a47588..3ace4b401369 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pt.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>>>> @@ -602,8 +602,12 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>>>>    	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
>>>>    	int ret;
>>>> +	/**
>>>> +	 * XE_USM_PPGTT_PTE_AE is available for igfx and dgfx from xe2 onwards
>>>> +	 * and also for PVC but atomics only works for PVC on device memory.
>>>> +	 */
>>>>    	if (vma && (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
>>>> -	    (is_devmem || !IS_DGFX(xe)))
>>>> +	    (is_devmem || GRAPHICS_VER(xe) >= 20))
>>>>    		xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>>>>    	if (is_devmem) {
>>>> -- 
>>>> 2.42.0
>>>>
