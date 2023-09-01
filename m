Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1AFCA0FE1
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 07:56:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B283010E07C;
	Fri,  1 Sep 2023 07:56:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14AF10E07C
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Sep 2023 07:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693554990; x=1725090990;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=FcFbEi7yi6QzhCVq2WNsCCWnaGYPkiGIQFboixklq6M=;
 b=Tjw6jr8D9qvLvTj1Ak9f9IEOtcthubT92f10poMhMFvbByvxgWUKMieL
 QfR6/WoMqEw6X9caNScF51d4DzuTgFniVQW2NoDBG/TpHNbkhEubBXSzZ
 qPSGiTGd9HrCY4XkXTpA05kJ7Cge6Wtjo2h5+aVDvth7QRWJLU61arNpo
 C3gFN/jeCd0EyT7fIBb/Sc/GHbVtk5p5V/hnH5MvUD1aqMaj7lFAp8UOJ
 5irmXPpIdt9M5PhwW4O1Y0o7/qjYBoAJCSn2Hkqq1V8HNwHTDJHoY5G1M
 eT6d6japOiVq0yAvLqNaxjfg4MisfHCdfrT0MzCJiowDu8+ulBiUwYr0y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="442556839"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
 d="scan'208,217";a="442556839"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 00:56:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="739845931"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
 d="scan'208,217";a="739845931"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Sep 2023 00:56:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 00:55:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 00:55:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 1 Sep 2023 00:55:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 1 Sep 2023 00:55:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YG2MxIL/4myRB7nig9Y1xrNaxB/WG5SRvcQZEoIA0K6sfKRJLRagp/Mvy7rvl3mza2Qow6OMIruBdNjIxm6FUidRcSkXlTGSAph4scoTWLvteybEyAbhrQokAua3XXH+tPM30sEtdP+NAAyn6KRyZEtsb3XsMwl+pU58V8HB36+Uof/LqHRPpgl4MF2NfDDzMv7lSKjl2wPTbnGFIvGk+xyRlhiGimAMCdkGKepr/ozebXQ6xu2Ct482kJIuIxjWOgKcgvtj/4lBQ1RfVBJJaowIe+HDli8oUNgJiRxtV31xQWwcScXDWFqpdZlp/45p640foNdOFx2J8uJ3geHIvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdxWd6xn9xLwF6K3u7moNpolvzkt1x2L7YYim+6qx54=;
 b=SfJesHDNh9HIS0oE4kcUlR0S0ET5Xhah9+ksmafoYbys6f+Ncv6h6Mgxw9yYxBoOKCSn/BSrvPRN/yf3x5gfyfhFxCAM7as+gsZP4gzkqKlR0jKv7z1JYKPM8WUt7NOEkvf4IW98vl2IHhkYq1aViOmCu6QUoXSF/1Hrts25JOYOgM2fLbQrgSOWSTTBoDzuAmsB1IVwRCn3F7uobDJuI+WTB2QR/qs6CM8neAA208Hd5+atftrT89wu1fPSapARc0KXjnGFMbf8X9xU3pvM2WNgvaQ6LNFRZXQk+3jMqodhsareQWwZ4O6gZjVqp88FyHgrhI8JWIJpOKHT0J2Ilg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by LV3PR11MB8505.namprd11.prod.outlook.com (2603:10b6:408:1b7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Fri, 1 Sep
 2023 07:55:48 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::42c7:cd4a:ad29:f97c]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::42c7:cd4a:ad29:f97c%7]) with mapi id 15.20.6745.022; Fri, 1 Sep 2023
 07:55:48 +0000
Content-Type: multipart/alternative;
 boundary="------------k88zYJ0p02XG1aE5gMX0O0Zp"
Message-ID: <621f1b64-fba8-d724-869a-373e74dcae98@intel.com>
Date: Fri, 1 Sep 2023 10:55:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230808013159.38811-1-ashutosh.dixit@intel.com>
 <87jzu6xnlr.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <87jzu6xnlr.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: FR0P281CA0259.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::18) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|LV3PR11MB8505:EE_
X-MS-Office365-Filtering-Correlation-Id: f60e6b4a-4738-4605-7761-08dbaac0da63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DyMEdL38hejmxZVfo116cmobbBtIw+ZlU9jZcA5GKJHSIqyQo4Y2jyLeORnlUbmlAyH6H9n39dxkbgqi7lNNZJy+GhH+8NJAgWdeKCvJuvl/waufh6oDqp/bZ9X5ZzD3oTyomcKr5XmnpABy2LoqK79ph7EoX01yKrycjpOYsYBR0PI52cRFLSCNBzHFIRqjoTv14lPie5cdrC4rNWnZazzvoSmpOJLHdvG7hQ9Nhn8bPxqge64gwsg5U0Tmg7YM+tl8IrtFbFraevyop0MGt6DDz230O4Ua0NM+cmzf0M1flpDUbgDjSMV+u7H3lvz9xN8HH+v2jaBg1S48Qx6Uxp2ST5F9mQOa++GDU7t9bCcLnaJMRzBGWpMdiRxV8P5IKJO20aSMNu8LTokRMohcnlHjr1OZKtcrPKD8HtEeAmMT4uC0Kl9Kx4vztlmJ9jCm25xhHdcPqBw6k4J5NUW79XeF1KYGPcTACNJMVCwRT0ycNHQ/wZlNX++bYkYp/DczqrDKj65Iobgq/yQvA9xBOfS5ftJ4mib/KGsQY9Q3fWQplOZb90exCJ5pqcTtqd3VdyKuM8GjRSo2LELw0R06FwAoIPYEBbPU7o5XM+5SdaT+FiR0BpexTDPNzdwwPiYWU6Mzux5rIgTdhAcYq13vU4RvOxwlhwyVMLQ30DwR194=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(396003)(346002)(136003)(366004)(1800799009)(451199024)(186009)(4326008)(8676002)(8936002)(54906003)(66476007)(36756003)(66946007)(66556008)(2906002)(5660300002)(316002)(31686004)(41300700001)(6506007)(53546011)(6486002)(6512007)(26005)(107886003)(2616005)(166002)(33964004)(31696002)(83380400001)(6666004)(82960400001)(478600001)(38100700002)(966005)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGRKRkRLOENiVmlBaDllL0tab0RnYzZzbVZPcVB1NGJSTFRuSHV6NnBxNFpq?=
 =?utf-8?B?RjdyRlpaaCttYmdvZ3lKTXI1dDgwSUJ3RmsvZnpLZ0ZLbjdnS0JENmw1Z1V3?=
 =?utf-8?B?ZlJvVEZXRCtUZVRoY2xUOW05WFE2WDR6MGx0bUNkSGNtVnRPaTByV3Z0KzF1?=
 =?utf-8?B?dFIrNDJTWGJUWWJuM3NBQW9jM2hMSTFWa3NnWDBVRjhac2hrWVBnTFRZSUxC?=
 =?utf-8?B?WjR3d2d5Y1VrV3NUTmNxMkhyWG5xcVNrM3ZERlA0MnVsaXhFNHlwY2hBNG5r?=
 =?utf-8?B?SjVzNk1zc2w0U1FWb2ZUZ2p6WGxyL3RsdkxLcWl3dFNUK2dNcmtxRVgrVFNF?=
 =?utf-8?B?STI5aGlXWmRCRGFKSzJnam0xYkFGQmVGRllqVGRaOTdIaGF3RXdPdE5Zenls?=
 =?utf-8?B?ZXVGK1Y3cUhNMzc1RWJiUDR5RGJycjJpKzdPUGhJbWtVRDBRNGo1YWpCOVBh?=
 =?utf-8?B?elMrUE1COVU1L1FDYW05MmxacUF4NEJ4MWNTa3ZFMXl4V01HRXVlckZ3Sm9D?=
 =?utf-8?B?bURPRm1oUmpGMzJWWnVEOUg3ajJQc09hUmRvQXRnanBjK0dualdCV1ppeGFX?=
 =?utf-8?B?QWNaY3pLMDBSd1BtNnVrZUNhZXRDblEyb2FqaUd4ZUNCcVBtenlFMUt5MXc4?=
 =?utf-8?B?SkJDSXh2ckNIaUF1azdEKyt0YWcxSHJoL2ROSFBvblhIU3JtS2MzQkw4NFhv?=
 =?utf-8?B?bHRxaG1jRjhtdTVZK1JWU2JiTVNsdXgzK0g3akU5N2lVQ1FSQmRhcThuYTZm?=
 =?utf-8?B?WE5LbENuaGtWMTE1UXhxbk0zcDJOUlcwQ0YvWWNReHJKZzNmZjBtRCtKR1RU?=
 =?utf-8?B?VnUxaUJmd3ErYzZQeFFxY2pBbFg1aEtJeGc1UzFxV2VOcnlreDNqc0hEK0JK?=
 =?utf-8?B?NGpHSDVYcmpIbk42MEQ3Zi82NlhNcExnVDRsN0lSZDN2Y3lkbFRtM2hWRTAy?=
 =?utf-8?B?d0xzMmRGNHlhRjdDc1NITkFBZ0J2dFl2UVpQc0Z2WUhjU3Q1Y0hBZEZKdlFH?=
 =?utf-8?B?bUhLTkpCZ1E1YWk1RTRKVy9TOGxjbFVBa21OeXBaS3g4cHk5QnNFVlIxRmtl?=
 =?utf-8?B?Ykx1b1ZnV3pMY3B0TFVFSkJPeDVERWdUaGthcUZQZWkwNkNrY041QzFrMGE0?=
 =?utf-8?B?OStLMVZjclFrNHdQQzFsaEx5QjNtYStZNnF5NFRFZnp5dzU0NTl5dGJkcW9N?=
 =?utf-8?B?dGRTbFhCdGdkWjVDd2diYWRBNkxwZ3lVQUV0UHZnVmJZS0FmVHYrQjRJYWMr?=
 =?utf-8?B?R2tnYXkwNUNER2NtamFiT3lVWnhoNUx6TVRuTWg2N0w3dFpZNkU4a01RL3FM?=
 =?utf-8?B?YnFDY25aWng1NWhmKzBSVWZOa0UwbHpBZzM3Nng5UGQzMTk5aGdxTm9xYVVi?=
 =?utf-8?B?SGhDbTd1UDNxS2FzQi9Cb2JqOUxrQy9OT256WlpyUW43TEhjQVJVMy9RUEoz?=
 =?utf-8?B?VTh4UHVsMWRibU9zV1duNTFadWR3L1ZXcmtxeEdnOHBKNGkyb1VSOWpSaEd0?=
 =?utf-8?B?dlRFUUNySC9hc3VoWWtnNFNPa0FMb2xMb1BkZXE1TCtJZDZjSXBINnl3SGpV?=
 =?utf-8?B?UmxkN0RMSVZzS1o5emppU0pHRDJLSFF5RnhOMDVGcDZORHNSNUJabktSWm4y?=
 =?utf-8?B?WUpjM2cxQ01kdlZGOGg2ZEdUcjZwY3UrQXlKekZYdEtMeVl2R3pwbUlNSE5T?=
 =?utf-8?B?YmZpTUtiV1JSc2ZxSmVnbHdxcmJFRTU4OWpQM1BkOVFrNGJ3N0I3Sm5hd3Qr?=
 =?utf-8?B?Zld1Q0tReW9vaEs4c3VlVjVSL0wrK3Vsc01pQUExSmdFb2lYa0VnQWV3TFUw?=
 =?utf-8?B?Ry9BYjc3VnAwdTh6bEdudzg0QllRUHFTaW9ZS3BOdVlLM05SSFU5RW83bEtB?=
 =?utf-8?B?YWpiUzRJZ1N3dGtoMytVekw1RldxRUFHOHJ5WVJybkFSR1huUDlkN3grN0pj?=
 =?utf-8?B?REdvelNpVDh1ZTdMSitwYmVtakxsWmRYL05xVU1rVVI0TG92N09XdGFXc3NK?=
 =?utf-8?B?VWpqTHFsanhnU2s3c2J2REFjZTNDV0J6b2MxVDJjKzZicm8wZ09aSmFhWXcy?=
 =?utf-8?B?dzhpMTB0T3RSVVRLN3FGK2xXSFd4d3RMNWN3YjNORUd0UVZyaGdRSVlVQVg3?=
 =?utf-8?B?MmJHS1ZVOVc1NkZ2dWtuVWhmTTRYWG9CMnljakVzQW5zeEx4NHhVdkFUQytX?=
 =?utf-8?B?S0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f60e6b4a-4738-4605-7761-08dbaac0da63
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 07:55:47.9848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: icVEmOG/JkLq+h+jmUWomxx3vKwjPUJ4uNbojbNS0t1V1Usgbl9c8f7n8csmmszVAKqYnxvXdZqfZZPLZFOR69pS5eSIs3NbOGlmvYcxW8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8505
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 00/10] Add OA functionality to Xe
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
Cc: Robert Krzemien <robert.krzemien@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--------------k88zYJ0p02XG1aE5gMX0O0Zp
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ashutosh,

I just noticed this change in the uAPI :

@@ -298,6 +305,7 @@  struct drm_xe_query_gts {
  		__u64 native_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
  		__u64 slow_mem_regions;		/* bit mask of instances from drm_xe_query_mem_usage */
  		__u64 inaccessible_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
+ __u64 oa_timestamp_freq;
  		__u64 reserved[8];
  	} gts[];
  };


I think you need to remove one item from the reserved field so that the 
structure size doesn't change.

-Lionel

On 08/08/2023 05:41, Dixit, Ashutosh wrote:
> On Mon, 07 Aug 2023 18:31:49 -0700, Ashutosh Dixit wrote:
> Hi Umesh/Lionel,
>
>> This patchset is the initial port of i915 perf/OA functionality to the Xe
>> driver. It has been tested against the following IGT patch:
>>
>> https://patchwork.freedesktop.org/series/121082/
>>
>> The following features in i915 have not been ported and will be added (as
>> new patches) if/as they are needed:
>>
>> * Inline batch submission on stream exec_queue/hw_engine
>> * NOA wait
> About these two in the "not-yet-ported" feature list for Xe: In
> i915 when a stream engine is specified, requests are submitted "inline" to
> that engine whenever the OA stream is opened or reconfigured. This feature
> is at present not ported to Xe (see xe_oa_submit_bb()).
>
> I have a couple of questions about this "inline submission":
>
> * Is inline submission a hard requirement? That is, in Xe can UMD's say
>    (completely outside OA uapi) fence till a segment of the workload
>    completes, then open/reconfigure the OA stream and then continue? If
>    UMD's are able to do this we don't need inline submission in Xe. If UMD's
>    cannot do this please explain why not.
>
> * If inline submission is indeed required, can we do away with NOA wait (as
>    implemented in daed3e44396d ("drm/i915/perf: implement active wait for
>    noa configurations")) or implement NOA wait differently in Xe? E.g. can
>    we expose a fence in the OA uapi and UMD's would be required to wait on
>    this fence/sync-object before continuing workload submissions after any
>    OA stream open/reconfiguration.
>
> The reason I am brining this up is because in i915 there are a couple of
> scary bugs around this which are still unresolved. E.g.:
>
> 	https://gitlab.freedesktop.org/drm/intel/-/issues/8746
> 	https://gitlab.freedesktop.org/drm/intel/-/issues/8190
>
> There is therefore reason to think if this functionality can be done
> differently in Xe (not to say these bugs will be carried over to Xe).
>
> Thanks.
> --
> Ashutosh
>
>> * GuC ctx id (guc_sw_ctx_id)
>> * CTX_R_PWR_CLK_STATE/GEN8_R_PWR_CLK_STATE
>> * hold_preemption (DRM_XE_OA_PROP_HOLD_PREEMPTION)
>> * sseu_config (DRM_XE_OA_PROP_GLOBAL_SSEU)
>> * Override gucrc (override_gucrc_mode)
>> * MTL bios_c6_setup
>> * ratelimits
>> * compat ioctl
>>
>> I am providing the following additional HAX patch (not part of this series)
>> to help review these patches:
>>
>> https://patchwork.freedesktop.org/patch/551683/?series=120100&rev=4
>>
>> The commit message in the above patch explains how it can be useful for
>> reviewing this series.
>>
>> Test-with:20230808010017.37819-1-ashutosh.dixit@intel.com
>>
>> v2: Fix build
>> v3: Rebase, due to s/xe_engine/xe_exec_queue/
>>
>> Ashutosh Dixit (10):
>>    drm/xe/oa: Introduce OA uapi
>>    drm/xe/oa: Add OA types
>>    drm/xe/oa: Add registers and GPU commands used by OA
>>    drm/xe/oa: Module init/exit and probe/remove
>>    drm/xe/oa: Add/remove config ioctl's
>>    drm/xe/oa: Start implementing OA stream open ioctl
>>    drm/xe/oa: OA stream initialization
>>    drm/xe/oa: Expose OA stream fd
>>    drm/xe/oa: Read file_operation
>>    drm/xe/oa: Implement queries
>>
>>   drivers/gpu/drm/xe/Makefile               |    1 +
>>   drivers/gpu/drm/xe/regs/xe_engine_regs.h  |    5 +
>>   drivers/gpu/drm/xe/regs/xe_gpu_commands.h |   27 +
>>   drivers/gpu/drm/xe/regs/xe_oa_regs.h      |  173 ++
>>   drivers/gpu/drm/xe/xe_device.c            |   16 +
>>   drivers/gpu/drm/xe/xe_device_types.h      |    4 +
>>   drivers/gpu/drm/xe/xe_gt_types.h          |    4 +
>>   drivers/gpu/drm/xe/xe_hw_engine_types.h   |    2 +
>>   drivers/gpu/drm/xe/xe_module.c            |    5 +
>>   drivers/gpu/drm/xe/xe_oa.c                | 2356 +++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_oa.h                |   28 +
>>   drivers/gpu/drm/xe/xe_oa_types.h          |  295 +++
>>   drivers/gpu/drm/xe/xe_query.c             |    5 +-
>>   include/uapi/drm/xe_drm.h                 |  257 ++-
>>   14 files changed, 3176 insertions(+), 2 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/regs/xe_oa_regs.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_oa.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_oa.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_oa_types.h
>>
>> --
>> 2.41.0
>>

--------------k88zYJ0p02XG1aE5gMX0O0Zp
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hi Ashutosh,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">I just noticed this change in the uAPI
      : <br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">
      <pre class="content" style="box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; display: block; padding: 1em; margin: 0px 0px 10px; line-height: 14.3px; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: white; border: 1px solid rgb(204, 204, 204); border-radius: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><span class="p_chunk" style="box-sizing: border-box; color: rgb(165, 42, 42); font-weight: bold;">@@ -298,6 +305,7 @@</span> <span class="p_context" style="box-sizing: border-box; color: rgb(160, 32, 240);"> struct drm_xe_query_gts {</span>
 		__u64 native_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
 		__u64 slow_mem_regions;		/* bit mask of instances from drm_xe_query_mem_usage */
 		__u64 inaccessible_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
<span class="p_add" style="box-sizing: border-box; color: rgb(0, 139, 139);">+		__u64 oa_timestamp_freq;</span>
 		__u64 reserved[8];
 	} gts[];
 };
</pre>
      <br class="Apple-interchange-newline">
    </div>
    <div class="moz-cite-prefix">I think you need to remove one item
      from the reserved field so that the structure size doesn't change.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">-Lionel<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 08/08/2023 05:41, Dixit, Ashutosh
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87jzu6xnlr.wl-ashutosh.dixit@intel.com">
      <pre class="moz-quote-pre" wrap="">On Mon, 07 Aug 2023 18:31:49 -0700, Ashutosh Dixit wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hi Umesh/Lionel,

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This patchset is the initial port of i915 perf/OA functionality to the Xe
driver. It has been tested against the following IGT patch:

<a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/121082/">https://patchwork.freedesktop.org/series/121082/</a>

The following features in i915 have not been ported and will be added (as
new patches) if/as they are needed:

* Inline batch submission on stream exec_queue/hw_engine
* NOA wait
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
About these two in the &quot;not-yet-ported&quot; feature list for Xe: In
i915 when a stream engine is specified, requests are submitted &quot;inline&quot; to
that engine whenever the OA stream is opened or reconfigured. This feature
is at present not ported to Xe (see xe_oa_submit_bb()).

I have a couple of questions about this &quot;inline submission&quot;:

* Is inline submission a hard requirement? That is, in Xe can UMD's say
  (completely outside OA uapi) fence till a segment of the workload
  completes, then open/reconfigure the OA stream and then continue? If
  UMD's are able to do this we don't need inline submission in Xe. If UMD's
  cannot do this please explain why not.

* If inline submission is indeed required, can we do away with NOA wait (as
  implemented in daed3e44396d (&quot;drm/i915/perf: implement active wait for
  noa configurations&quot;)) or implement NOA wait differently in Xe? E.g. can
  we expose a fence in the OA uapi and UMD's would be required to wait on
  this fence/sync-object before continuing workload submissions after any
  OA stream open/reconfiguration.

The reason I am brining this up is because in i915 there are a couple of
scary bugs around this which are still unresolved. E.g.:

	<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/intel/-/issues/8746">https://gitlab.freedesktop.org/drm/intel/-/issues/8746</a>
	<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/intel/-/issues/8190">https://gitlab.freedesktop.org/drm/intel/-/issues/8190</a>

There is therefore reason to think if this functionality can be done
differently in Xe (not to say these bugs will be carried over to Xe).

Thanks.
--
Ashutosh

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">* GuC ctx id (guc_sw_ctx_id)
* CTX_R_PWR_CLK_STATE/GEN8_R_PWR_CLK_STATE
* hold_preemption (DRM_XE_OA_PROP_HOLD_PREEMPTION)
* sseu_config (DRM_XE_OA_PROP_GLOBAL_SSEU)
* Override gucrc (override_gucrc_mode)
* MTL bios_c6_setup
* ratelimits
* compat ioctl

I am providing the following additional HAX patch (not part of this series)
to help review these patches:

<a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/551683/?series=120100&amp;rev=4">https://patchwork.freedesktop.org/patch/551683/?series=120100&amp;rev=4</a>

The commit message in the above patch explains how it can be useful for
reviewing this series.

Test-with: <a class="moz-txt-link-abbreviated" href="mailto:20230808010017.37819-1-ashutosh.dixit@intel.com">20230808010017.37819-1-ashutosh.dixit@intel.com</a>

v2: Fix build
v3: Rebase, due to s/xe_engine/xe_exec_queue/

Ashutosh Dixit (10):
  drm/xe/oa: Introduce OA uapi
  drm/xe/oa: Add OA types
  drm/xe/oa: Add registers and GPU commands used by OA
  drm/xe/oa: Module init/exit and probe/remove
  drm/xe/oa: Add/remove config ioctl's
  drm/xe/oa: Start implementing OA stream open ioctl
  drm/xe/oa: OA stream initialization
  drm/xe/oa: Expose OA stream fd
  drm/xe/oa: Read file_operation
  drm/xe/oa: Implement queries

 drivers/gpu/drm/xe/Makefile               |    1 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h  |    5 +
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |   27 +
 drivers/gpu/drm/xe/regs/xe_oa_regs.h      |  173 ++
 drivers/gpu/drm/xe/xe_device.c            |   16 +
 drivers/gpu/drm/xe/xe_device_types.h      |    4 +
 drivers/gpu/drm/xe/xe_gt_types.h          |    4 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h   |    2 +
 drivers/gpu/drm/xe/xe_module.c            |    5 +
 drivers/gpu/drm/xe/xe_oa.c                | 2356 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_oa.h                |   28 +
 drivers/gpu/drm/xe/xe_oa_types.h          |  295 +++
 drivers/gpu/drm/xe/xe_query.c             |    5 +-
 include/uapi/drm/xe_drm.h                 |  257 ++-
 14 files changed, 3176 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_oa_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_oa.c
 create mode 100644 drivers/gpu/drm/xe/xe_oa.h
 create mode 100644 drivers/gpu/drm/xe/xe_oa_types.h

--
2.41.0

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------k88zYJ0p02XG1aE5gMX0O0Zp--
