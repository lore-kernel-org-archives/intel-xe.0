Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF80AE9272D
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 19:26:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C35C10E169;
	Thu,  5 Oct 2023 19:26:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FC710E186
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 19:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696533976; x=1728069976;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=35Qtzt8KQJsCw1iHg2xPZp55f/RgKHUDaEDpn0pdRB0=;
 b=ZDCWWLdVZyryvAn4n7xk+UwF94HmVYcmMuLiSi6nRjuCIhba6gVBkTdJ
 1rlZwnMCv6OwPvdOPl/knX8Myi+m/nlxHGI05tWX8GQH3BG7lHjqPac2g
 qgVd1eBkBegiqMyPPpqOFpSwR362Ge9sZrdbUfMFXNPi28x1/exDUUPKj
 R4lWYrB1JsactecL2FXG0hNrNDYphD6jzgoSrJq0TpNVrb23NTVCHYQX0
 q1VHWN/fatF5LZQpDhk6u4rXySvmY9Cck2DGjk1i2v8n/GEPmCdzpDo6r
 unwkMZmK+5SV60WdfCe0qZcGpzr1Iuo0OrdtyHfw2kUJOi35MKNxmZnzb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="382469557"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="382469557"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 12:26:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="875658030"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="875658030"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 12:26:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 12:26:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 12:26:13 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 12:26:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTrcXQWRoSqYbYzqbvo0O1IR3Lgfg/D2uZBva6OjeC4rBwFRQ9oVxjrK/Ir0oJvE7S6Va+yPPlB3e6c7rg6LpmzJUnFbMMgJAhGuVg1izvjEoJ0JLHc+tshOA6dQJRdWrqbHBHpJzL1tXkMn41BatKHHEYtLjiZ8X92I7klD8mCSCQTEfYDoj/NbRyf6t7trO4cHnz0+bMlXxOih6j36muQ9NPMQmDJb2dbxNmKNwT03sOy8Ayx/pRqg7FYxYg7sVsJzPswR5fEj68Pd24hJUh8yD0HQDiq6d7OQ6CzE2t7LMnqBcKi/E+5iSbBRa2EQUBWT57sJJ/HCctAf0ftY9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Bv8p9n1L0SeaLeS4KaghNaUPq+Fx5xUv9CkDD45q3g=;
 b=RohK9pZj6RkKVgqpQxKL27H4QlFNVu6r5slQOT/BCq5jxdm5Jh8FerCFKVzkt0DeKsyo3zMImn5ABMALiry4JtyuVQwsh2xNxBKgSyJW4Cjkb/GhcPz62cH/MWyHRCjUtNVt+AV7MFRL+JAu7FkD8W3rA++yCBdFkPUo39rVH0bDutPax/3fbH99T2rVMrNQbsGcu7VVdvMj7ZTcMOKa70/dRlj5LTz62ssGDbmCz44u/0Ekgdaq0KZurQAJDDBJx4nnMH/eBgvSfgHOLsVhwhlmyOOtJIZPlp/pyoILgxaGKDbyfVT8I3rkC+HkmVLY1Xtpyns0Q6uRqUb8qam4WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 CY5PR11MB6305.namprd11.prod.outlook.com (2603:10b6:930:23::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.38; Thu, 5 Oct 2023 19:26:11 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b%3]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 19:26:11 +0000
Date: Thu, 5 Oct 2023 12:26:08 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <ZR8N0EfauiY8UeEC@unerlige-ril>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
 <20230919161049.2307855-22-ashutosh.dixit@intel.com>
 <878r8zhymn.wl-ashutosh.dixit@intel.com>
 <87mswx1vga.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87mswx1vga.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY3PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:217::33) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|CY5PR11MB6305:EE_
X-MS-Office365-Filtering-Correlation-Id: 6057fc16-2b36-4f5e-d3db-08dbc5d8eebe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dyZ9jo5tzs3osttFAcgB6ZM+VjtIKNaa6AXyZZIo/hkYZ6EFA8RJLYYR3TI0gkVFusykQ5qZlJ1bAlCkTbxe90Uog6Y8QZES2GETq6HYzeSMLYf/zNXGZ6/SquC6QQ4vYc1MbgnPyXKo9uMVjr9fFLn22Bw32149xSgCorglVJakIVpkG2ETMe61lhsYqx7zn7E1erU34Ho4VHLggjX2Zpblkt0NB6q9sbPpEnaUJT+3IE9Rh7NrrKNo+JrxfjngSTonlb0B1A3XBjSfE5wilq5F4z/EYglU2n2eqhogVoKCo+hb8EEUlsQ/ns9mQI+AWIpZmOO++tZu/IQ6M9TQ0nT2AdmeJ0YjTwpQqU5ue/dCbLBzNBIql5469BT2/WohDXZDtQyrI3Njdwfg9jA34H8TFmR6gA6WHI82hDyD7eQ6MWfmGniQxXBf5cJg9OoDEODXAggS1pwdf4NchGAjFxI2uUr4ACkv4Jfa2DSl5NrEpkWWmA+dewIXpm9B0vw82xFjbIMDddxpWUAMV4G60NP+GH71Qr7csExHucUAGm8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(346002)(376002)(136003)(366004)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(6862004)(83380400001)(33716001)(4326008)(5660300002)(82960400001)(38100700002)(86362001)(966005)(6636002)(316002)(478600001)(66476007)(66556008)(66946007)(8676002)(8936002)(2906002)(26005)(6512007)(9686003)(6506007)(41300700001)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3pxeWVDZThBRGlFZ0M3U1hjKy9GZVN4cS94ODlJZFlHVm9TcnVHM3ljTkQ1?=
 =?utf-8?B?Nk1KQmdpOVBTM3lNS3lTYzJrMVpKRHlTMlpocERMRVRVdHZIVDE0UEdVTG14?=
 =?utf-8?B?bFNTeWdJMGxEQWpPQ2h2ZUlWb21qU2plZGRMaWVoWXBmM0lyNURyMDVhZURt?=
 =?utf-8?B?MFBDZGRwdlJhcE9WcGd0RUtyTi8yT1Y2VHkzWVJ1eklZdklQWDA4RDQ4eWN2?=
 =?utf-8?B?cEJNTmNoc3lOT3NrZnRhN2w5TVFpNVhuN3FXN3RyampKcGVHQXN2dXBrU2tI?=
 =?utf-8?B?T0VXUzdqNHZqcnR0aXU2aHF5ZURCV0JpOTNjazhCTEg3akwzZzBId0lUT0Vo?=
 =?utf-8?B?ZFZCaGJGbTkxQ3pSV0FJZGhKS1IyRFJGc01USHZndlVTa3A1cWd5SzdWSk5K?=
 =?utf-8?B?N0IzSy9wa1pmR0REdG9zdHAxenJkSEtEMFRCWTRDZkNYNm1Kcmp5eUI2RTcx?=
 =?utf-8?B?aThEbitmWmNic1Z6TlROSHJSRDBISXpBeEVRbkpyUm9BTmkzYm1CaFdORkJK?=
 =?utf-8?B?SGRtYVZwdTZTUWIxbW13cjRiYWlBOXdYdGZFbk1tTGRxc3JvSnZzRHM3Vm85?=
 =?utf-8?B?VllLWXNmRy9nM0RVYlUxdHFzVkdpdDJSbDRyTkZxOXAxMjFUZExvbjg2MGJ4?=
 =?utf-8?B?RXBybXVpUXBudnBMZmE2QUxZYm1lT1FMaEljN0VkOWhicjZIOFRhblE3QWdy?=
 =?utf-8?B?WUoyUC9IZFZabEtVVkxIYzVDNWkrVVhwWkMwLzdSL3RUSXRVSzdKRlBNL0hL?=
 =?utf-8?B?aWVORzdoc3RjUURYNUdMTWJITUowQk9sbkhyb3phQ1k1NkRoc0YwU2VIbUtP?=
 =?utf-8?B?OEtLQ0FkRXdzc1BkSDA5L1JvV3JHOWxMekNhaWpMc2FRaVRycVVEelJBb1V2?=
 =?utf-8?B?TTl1T2dPbEdYa2NOV3B3STQxVno4bmxDelZyUFlvTlB3dVA4MGpibS8vN1dE?=
 =?utf-8?B?WDFaVkVkdlF1bFBESWg2b081MkdwTStSU1pQU3M3b0dQNmQrdHQ1Tm9VOFVU?=
 =?utf-8?B?Um1DRUo2ejlBQlRBUUNvaVZ5Z1lYSHlZUitGeXRTVVhLNXRHaDgvK1cvc1Vu?=
 =?utf-8?B?VTVsTGVEK2lmWEFqY2QwWWVRbCtMMm9GbXRCeUU1YUJER2hkNjh6NUhHVUQr?=
 =?utf-8?B?SzdCK1lZUXZKR3JURGxVd3BXeTJROVRXWC9uWTZIaFVEZndLWDFLdzRNN3Nv?=
 =?utf-8?B?bGtTWWc0NWtnRHJ1anFBUFdJRzZRNVQwS2w4cC9CTUVUTE16UnBpMjlLVk9z?=
 =?utf-8?B?aW1vMGY0K1pHWG9WT0FQd09ySElSbzBENCtjZlBZaVlRUHBROFRWeGkzMHIv?=
 =?utf-8?B?MmdMSjlqWnFHYVhhWERTSEtJQ2FNb0Q1emtqS3JFMVk4dHZDU3czb1NlUmk2?=
 =?utf-8?B?aDUwN3FuMFdrSTMwZTZNajdyNFRvQWZ6RWNMYjZ5aWVBWjJNYnEvNTdTUnZu?=
 =?utf-8?B?OHlJYVdaVXhIdnRJbTRIMEJzTUZjSmM5OTJwZUJub1JabmExNkpUbE1qU1ps?=
 =?utf-8?B?ekNuNWw0K1FkWmU3MlZON0p5a0NPLzNwc3VHUDVzNW1jYkVWTkFDbm1weTIr?=
 =?utf-8?B?L0FaK3prR1BIaUVhcVdYS1pMMk8yWUZ3OG4wT1E3emZvOWk1QkxpZXpaNlND?=
 =?utf-8?B?ZHk4L3R3Q2lXeVMxVDlzZHRWRjNCb1d4TEZZYUlGMnlPTzBPWlM0K2FHOUZL?=
 =?utf-8?B?S0pJSnpybzl5ZkdHS0ExdUJRZ0VuMDFOa2VqbVl2SjhpbWpBMVRUcGZkVERo?=
 =?utf-8?B?TXRsVHVIQ3pnUUNwQzRWb2h2V0lQeEcrNGM3YkNzKzNtSE1ib1V3akhmS2R3?=
 =?utf-8?B?c29Gb0R4VFZmcTh5bVNNYUxZaWhwUGo0NmtoVjE3ZGg1OUE0d0ZjbGlHeWhB?=
 =?utf-8?B?SFZhWkJDOUhRNkZGQmkzMmpxWFNVQlpsOGlNdGxtZ3lxMlpUY2RJYm1jNnVo?=
 =?utf-8?B?blVoVlJWdTRhazhnMkJwT3EvMXBwbXNqVkxrM1NGczdUclI0N3RmckdGRFRQ?=
 =?utf-8?B?Q0V2M2JLS05nK0dnWnIzeENPYndRYUNaa2VKR0tsL1IxV00wZW9tRUQyeDhQ?=
 =?utf-8?B?cE43VGEzbEFQK2ZwWTZ3R2JFUUxEb0ZVVlpnSlk0YzIvdDEyNytrSGNlc1ow?=
 =?utf-8?B?UW12NkZGVDBXOVBLUzRBeFRaQXlNbks0K1F6YTF5R0dOeDRSOW1YYThoem96?=
 =?utf-8?Q?k4IgeB/5aSmaE6hjEWJ7vIQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6057fc16-2b36-4f5e-d3db-08dbc5d8eebe
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 19:26:11.4451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +V9sZuZeynrlCAfFNi7Mbvlu8Lx2E0AW4wcYjCzleKr2yUDMvWlSMLvXmFYNXcB+reHcgbfdMJqqgAm5smaf27w+rLyoQMSjmScJut4XZFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6305
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 21/21] drm/xe/uapi: Convert OA property
 key/value pairs to a struct
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

On Wed, Oct 04, 2023 at 10:37:09PM -0700, Dixit, Ashutosh wrote:
>On Thu, 21 Sep 2023 16:53:20 -0700, Dixit, Ashutosh wrote:
>>
>
>Hi Umesh,
>
>> On Tue, 19 Sep 2023 09:10:49 -0700, Ashutosh Dixit wrote:
>> >
>> > Change OA uapi to take a param struct rather than property key value
>> > pairs. A param struct is simpler and param structs can be extenended in the
>> > future using xe_user_extension so there seems to be no reason to use
>> > property key value pairs.
>>
>> There are two ways of doing this:
>>
>> 1. In this patch we have collected all OA properties into a single
>>    struct. The assumption is that any future changes would be handled via
>>    'struct drm_xe_ext_set_property' chained structs (basically using
>>    xe_user_extension):
>>
>>    https://patchwork.freedesktop.org/patch/558715/
>>
>> 2. The second way to do it would be to use chained 'struct
>>    drm_xe_ext_set_property' from the beginning as is being done for
>>    DRM_XE_EXEC_QUEUE_SET_PROPERTY. This is basically the same as the
>>    earlier OA property key/value pairs except that the properties are now
>>    input via chained structs.
>>
>>    This second way is a uniform way of specifying property values whereas
>>    the first way in non-uniform.
>>
>> Just thought I'll point this out when we decide about this uapi during the
>> code review.
>
>Since we are almost certain that the OA uapi will need to be extended in
>the future, for the sake of uniformity maybe we should go with the approach
>2. above (this patch implements approach 1.)? Something to keep in mind for
>the review of this patch. This is what I was referring to earlier today.

Let's go with 2 then. I will skip reviewing this.

>
>Thanks.
>--
>Ashutosh
>
>>
>> > Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>
>> /snip/
>>
>> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> > index c0018abee4052..8ba11c4eb36b5 100644
>> > --- a/include/uapi/drm/xe_drm.h
>> > +++ b/include/uapi/drm/xe_drm.h
>> > @@ -1175,30 +1175,26 @@ struct drm_xe_query_oa_info {
>> >	} oau[];
>> >  };
>> >
>> > -enum drm_xe_oa_property_id {
>> > -	/**
>> > -	 * ID of the OA unit on which to open the OA stream, see
>> > -	 * @oa_unit_id in 'struct drm_xe_engine_class_instance'. Defaults
>> > -	 * to 0 if not provided.
>> > -	 */
>> > -	DRM_XE_OA_PROP_OA_UNIT_ID = 1,
>> > +struct drm_xe_oa_open_param {
>> > +	/** @extensions: Pointer to the first extension struct, if any */
>> > +	__u64 extensions;
>> >
>> >	/**
>> > -	 * A value of 1 requests the inclusion of raw OA unit reports as
>> > -	 * part of stream samples.
>> > +	 * @oa_unit_id: ID of the OA unit on which to open the OA stream,
>> > +	 * see @oa_unit_id in struct @drm_xe_engine_class_instance
>> >	 */
>> > -	DRM_XE_OA_PROP_SAMPLE_OA,
>> > +	__u32 oa_unit_id;
>> >
>> >	/**
>> > -	 * The value specifies which set of OA unit metrics should be
>> > -	 * configured, defining the contents of any OA unit reports.
>> > +	 * @sample_oa: A value of 1 requests the inclusion of raw OA unit
>> > +	 * reports as part of stream samples
>> >	 */
>> > -	DRM_XE_OA_PROP_OA_METRICS_SET,
>> > +	__u32 sample_oa;
>> >
>> >	/**
>> > -	 * The value specifies the size and layout of OA unit reports.
>> > +	 * @oa_format: The value specifies the size and layout of OA unit reports
>> >	 */
>> > -	DRM_XE_OA_PROP_OA_FORMAT,
>> > +	__u64 oa_format;
>> >	/**
>> >	 * OA_FORMAT's are specified the same way as in Bspec, in terms of
>> >	 * the following quantities: a. enum @drm_xe_oa_format_type
>> > @@ -1210,86 +1206,79 @@ enum drm_xe_oa_property_id {
>> >  #define XE_OA_MASK_BC_REPORT	(0xff << 24)
>> >
>> >	/**
>> > -	 * Specifying this property implicitly requests periodic OA unit
>> > -	 * sampling and (at least on Haswell) the sampling frequency is derived
>> > -	 * from this exponent as follows:
>> > -	 *
>> > -	 *   80ns * 2^(period_exponent + 1)
>> > +	 * @metric_set: specifies which set of OA unit metrics should be
>> > +	 * configured, defining the contents of any OA unit reports. Metric
>> > +	 * set ID is returned by the XE_PERF_ADD_CONFIG op of the PREF ioctl
>> >	 */
>> > -	DRM_XE_OA_PROP_OA_EXPONENT,
>> > +	__u32 metric_set;
>> >
>> >	/**
>> > -	 * Specifying this property is only valid when specify a context to
>> > -	 * filter with DRM_XE_OA_PROP_ENGINE_ID. Specifying this property
>> > -	 * will hold preemption of the particular engine we want to gather
>> > -	 * performance data about.
>> > +	 * @period_exponent: Specifying this property implicitly requests
>> > +	 * periodic OA unit sampling. The sampling period is:
>> > +	 *
>> > +	 *   2^(period_exponent + 1) / @oa_timestamp_freq
>> > +	 *
>> > +	 * Set period_exponent *negative* to disable periodic sampling
>> >	 */
>> > -	DRM_XE_OA_PROP_HOLD_PREEMPTION,
>> > +	__s32 period_exponent;
>> >
>> >	/**
>> > -	 * Specify a global OA buffer size to be allocated in bytes. The
>> > -	 * size specified must be supported by HW (powers of 2 ranging from
>> > -	 * 128 KB to 128Mb depending on the platform)
>> > +	 * @oa_buffer_size: Specify a global OA buffer size to be allocated
>> > +	 * in bytes. The size specified must be supported by HW (powers of
>> > +	 * 2 ranging from 128 KB to 128Mb depending on the platform). A
>> > +	 * value of 0 will choose a default size of 16 MB.
>> >	 */
>> > -	DRM_XE_OA_PROP_OA_BUFFER_SIZE,
>> > +	__u32 oa_buffer_size;
>> >
>> >	/**
>> > -	 * This optional parameter specifies the timer interval in nanoseconds
>> > -	 * at which the xe driver will check the OA buffer for available data.
>> > -	 * Minimum allowed value is 100 microseconds. A default value is used by
>> > -	 * the driver if this parameter is not specified. Note that larger timer
>> > -	 * values will reduce cpu consumption during OA perf captures. However,
>> > -	 * excessively large values would potentially result in OA buffer
>> > -	 * overwrites as captures reach end of the OA buffer.
>> > +	 * @poll_period: Specify timer interval in micro-seconds at which
>> > +	 * the xe driver will check the OA buffer for available
>> > +	 * data. Minimum allowed value is 100 microseconds. A value of 0
>> > +	 * selects a default value is used by the driver. Note that larger
>> > +	 * timer values will reduce cpu consumption during OA perf
>> > +	 * captures. However, excessively large values would potentially
>> > +	 * result in OA buffer overwrites as captures reach end of the OA
>> > +	 * buffer.
>> >	 */
>> > -	DRM_XE_OA_PROP_POLL_OA_PERIOD,
>> > +	__u32 poll_period_us;
>> > +
>> > +	/** @open_flags: Flags */
>> > +	__u32 open_flags;
>> > +#define XE_OA_FLAG_FD_CLOEXEC	(1 << 0)
>> > +#define XE_OA_FLAG_FD_NONBLOCK	(1 << 1)
>> > +#define XE_OA_FLAG_DISABLED	(1 << 2)
>> >
>> >	/**
>> > -	 * Open the stream for a specific exec queue id (as used with
>> > -	 * drm_xe_exec). A stream opened for a specific exec queue id this
>> > -	 * way won't typically require root privileges.
>> > +	 * @exec_queue_id: Open the stream for a specific exec queue id (as
>> > +	 * used with drm_xe_exec). A stream opened for a specific exec
>> > +	 * queue id this way won't typically require root
>> > +	 * privileges. Pass a value <= 0 to not specify an exec queue id.
>> >	 */
>> > -	DRM_XE_OA_PROP_EXEC_QUEUE_ID,
>> > +	__s32 exec_queue_id;
>> >
>> >	/**
>> > -	 * This parameter specifies the engine instance and can be passed along
>> > -	 * with DRM_XE_OA_PROP_EXEC_QUEUE_ID or will default to 0.
>> > +	 * @engine_instance: engine instance to use with @exec_queue_id.
>> >	 */
>> > -	DRM_XE_OA_PROP_OA_ENGINE_INSTANCE,
>> > +	__u32 engine_instance;
>> >
>> > -	DRM_XE_OA_PROP_MAX /* non-ABI */
>> > -};
>> > -
>> > -struct drm_xe_oa_open_param {
>> > -	/** @extensions: Pointer to the first extension struct, if any */
>> > -	__u64 extensions;
>> > +	/**
>> > +	 * @hold_preemption: If true, this will disable preemption for the
>> > +	 * exec queue selected with @exec_queue_id
>> > +	 */
>> > +	__u32 hold_preemption;
>> >
>> >	/**
>> > -	 * @config_syncobj: (Output) handle to configuration syncobj
>> > +	 * @config_syncobj: (output) handle to configuration syncobj
>> >	 *
>> >	 * Handle to a syncobj which the kernel will signal after stream
>> >	 * configuration or re-configuration is complete (after return from
>> >	 * the ioctl). This handle can be provided as a dependency to the
>> > -	 * next XE exec ioctl.
>> > +	 * next xe exec ioctl to synchronize xe exec with oa config changes
>> >	 */
>> >	__u32 config_syncobj;
>> >
>> > -	__u32 reserved;
>> > -
>> > -	/** @flags: Flags */
>> > -	__u32 flags;
>> > -#define XE_OA_FLAG_FD_CLOEXEC	(1 << 0)
>> > -#define XE_OA_FLAG_FD_NONBLOCK	(1 << 1)
>> > -#define XE_OA_FLAG_DISABLED	(1 << 2)
>> > -
>> > -	/** The number of u64 (id, value) pairs */
>> > -	__u32 num_properties;
>> > -
>> > -	/**
>> > -	 * Pointer to array of u64 (id, value) pairs configuring the stream
>> > -	 * to open.
>> > -	 */
>> > -	__u64 properties_ptr;
>> > +	/** @reserved: reserved (MBZ) */
>> > +	__u64 reserved[4];
>> >  };
>> >
>> >  struct drm_xe_oa_record_header {
>> > --
>> > 2.41.0
>> >
