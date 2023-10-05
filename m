Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA47E92731
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 19:35:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A37310E48A;
	Thu,  5 Oct 2023 19:35:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E2110E48A
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 19:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696534556; x=1728070556;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vrZ1wNGDCxYAqIg0ndRyGjlBTOiZwTf97zDi3nsve6Q=;
 b=h2iTvhl2SJklrFcCi9hGGK3nis5je+Xcvwnr0KuzR0W9puZ6jEDV9BIw
 4MvU++sarQ65FNWEx6cAVOgvK6WM5vIU0rYGLqqd0y7UZLiCOgTyWys+R
 TrcQOilseoLkNZ3wQay12bpJIvTvdMwGyfI1TGbXOFc2e3PlyRkEO2k8b
 fFJfbUhWmYBdSgswKTtytSRphhyAnS5rVSesXvQIVVdfPs4PE8Wyn81BK
 crKWP+fFYwo4PVg87e0hlj1darCpfKOji0KU+J45tlQ2JpfYb38eNPj1T
 +hzdKRZ07rkK0AgSMGNoORK6tGq8Lxb8eaEIsqDno21FPHhHvz70gVpb5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="382471717"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="382471717"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 12:35:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="868053167"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="868053167"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 12:35:56 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 12:35:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 12:35:55 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 12:35:55 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 12:35:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JmvWLCXEn3a83QtDNGU/BjHw6e8uQFgeWJsHTepOzH+GlhecKWY69eCG9Udp/lieBas2f4h7uv/rZ843LePpSxWgi2CxxQbsn9+LpCO6VRMzTLgfOfaDoJHpk4Agl+XBzPpa8OvEMa9t8qg+tBXZ4fLdeS02CyitF4D6zjGgp0+zoIiXo+fHeXYVq43wl2Fbi8eU4fOqdQda1uiQ7x3U/wyniAkrGlUeAew4M/CJH9UEgtWbKMrMAFa54cCHIQidOgZpu4dxOAFxiRt11ryMpzTkFVgiJOAf6KJ1J1raPKvW/UDwJwknnCNXEXuZF35btTD8xf4yDPrxae2TOYMlng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJIMH9wjDqy1cxAThXEfwR9IIUCL90K7OB0LYCBJ77k=;
 b=gH3ePFK30gKGFL08nLfAh5SIS8srUiPYKEvCymtYYbW+yMdpyJ+urSTAkd/hA5s+F2eGhUyVjzNQ12X4ZiNrhEIN5Ye+Zw5bv79GJjF3AD7HXUaZiaNIEWyXvpOepElJlOtDIReYatFOvGxB/y8epegBXxiks2fX/A8jrnhRB+U2ohvlGq+nrF7tBJFIbQpCqD41EUqyJ+kHXmPfEb3CsDGeoC1vJxgFLcBMHhM3dIkslnNSRCVKTfWF3wf+F1yTihUqc+VVRGHEr4ehoTXobVWtz8BlynWm/oeJfc/uI0BNwr7+RjKhdCPJ1GawFZ3ngDgMJYUeOeOmBgK2VyB1XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SJ0PR11MB7153.namprd11.prod.outlook.com (2603:10b6:a03:48d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Thu, 5 Oct
 2023 19:35:53 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b%3]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 19:35:52 +0000
Date: Thu, 5 Oct 2023 12:35:50 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <ZR8QFnNlAX4tUcoT@unerlige-ril>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
 <20230919161049.2307855-20-ashutosh.dixit@intel.com>
 <87fs3axfia.wl-ashutosh.dixit@intel.com>
 <ZRzQBuqFTbPenC1n@unerlige-ril>
 <87r0m921dw.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87r0m921dw.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:a03:40::17) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SJ0PR11MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: c4128903-10c5-4869-c779-08dbc5da4927
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Feka2IPeNJ2OzaoQj0CcpgbMH9585hOmFBlPnuP9P5cH4NMCryIoMqo6wAn+o76lZGI6/WDA6mn8CJQ++jHScE3J/d4Yds8aG5QARW2RpS3mnNdiQJvgno3Dy7IoylpaOWTRcXn23kGCWEsaJ9wRn9pmggx2SeNV1nipcDacOh8igeAAQ9HVvCHYUHqbZgY7/vR2d4lSW2eF7IIXAjqONeo7Ka41LLN8yS79RUW6k+Cx8JGerkQdL1l9twNoXZ9tlezYQOUNFCCDIABokNaKA5dbMm9VtjgTSVf4AacsJcTCV69ExyA2r2Qcws4ALN+KFQW+bEY7YdzCVcNshV+4spvaLjNnsa65KOOiCS4+2l5l5UbZt2Czf7X5S1OHJYgKZRd56uzb2CKkplIGkjYRl2GCR3AfI5IplqUBt5ZulLzoMH13tADYEQmRM59JGRMtnsODTB+ISdmabicn87jegFwo9Y6Izg9quRUANjmaGJ9V/WMWV/pq+OngFoI1H53fI5w31NhgbGipwbr9BOFew289vOLZ8V6pLB7+m0WpyH16/KwXdHt8vbsxat3JK7LU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(366004)(346002)(39860400002)(376002)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(66556008)(66946007)(6636002)(316002)(66476007)(41300700001)(6512007)(9686003)(26005)(6506007)(478600001)(6486002)(38100700002)(82960400001)(86362001)(83380400001)(33716001)(2906002)(4326008)(8676002)(8936002)(6862004)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHhKaXIxZkJBemtzaGJTNTNWVkU4WUNHWFBia2oyWVBFOFlEbTkwSDlnSmhs?=
 =?utf-8?B?WFhuREpHcTErQWh3SG1kaVp6eURsS3RLdkpjM2trRUtBTCtqMnJjUDRhalZr?=
 =?utf-8?B?QnJTeE1IS1JsMHNNMzhHeHFsMDJZb0UxTFMxRUFvSnEvWjlTWEpaNXYxOTVi?=
 =?utf-8?B?MkowaG5GVHFWY2d3Q3RKbW5wTWRMMk45WEtrcTBhZXpmc0NFdkZqTUVpR2ZZ?=
 =?utf-8?B?MTJDd3ZYSTUwYndOYWhZcVVBdDIvVXZXaFlFZDBWWXZaSzRXUGRBcmFVSGR6?=
 =?utf-8?B?MnJyNzZDZ29SenBwZnVwRmE1ZGVZc1pwOGoxSnhOS0JUUEhGUG1aNkFkKzV4?=
 =?utf-8?B?c0h1bjhUUjFjZFlZTzdkZXB0UnJOSVlKaVBFOVBXTll3ZUtQdzZOZ2dRZ1dF?=
 =?utf-8?B?WFN4NVcyRlVmNDZHTHVHRG9KRXpEdGZKTGI4bmdIR0FlT1pSQ2Myb3NjSEdS?=
 =?utf-8?B?YXZJMitGUm5KK2dqakdIUWJvZU9ETUFDbGhQVEZVOU1lZ01ic0hvc1JwMXpV?=
 =?utf-8?B?cHl6aFZJMXR1OFQ1WEpZUVBRc2R5Wm03ZmEySnNUUW9HMzVtNUhrbGxHcVZx?=
 =?utf-8?B?UGsxT1pSeW1KN2IrMlhGT0N2ckhIbmk3OEFKbmU1UmNhTXViTHBXUGdCU0l0?=
 =?utf-8?B?akhWZFpaRGNqWnVVRkVjTndkWFJqUFI1VU93V1Zsc2Y4bkorYlFVYWlrNStj?=
 =?utf-8?B?SEVkbWRRdHlycDR4Um1IcG9wTTQxYUVPK3grNGlRNk5RL0FsbFdjSENyVy9L?=
 =?utf-8?B?WUlnZXlsZFhCZGJ1WkdMNFE5dDVVOVlDMTJINjBXVDQ2RkFhKzQzaHB3eFdz?=
 =?utf-8?B?ZldTejAydVJVdDZQTGNIRVFhMU1SbEFkckhpd3dsNzJreGZjWTFJRFN3Skhi?=
 =?utf-8?B?RDBPQWNkTmtxU3A3UFQ4Vk85SWxWOVVhcThpenVFV0lDNCtiY1ZQS2pNSmFx?=
 =?utf-8?B?cjcvcG1GOVVBVXd3N3pOdzZIY3FTYnVBOGpNT1pyZnAxc3RadjFkS2VTeXpv?=
 =?utf-8?B?VDE5RlFSQUVZWUF5R2F2bjF5ZmtNWHdQSWlzSHRha2lOU0ZZZVRGN21vMkU5?=
 =?utf-8?B?Y2hPdDQyMklQRFVvUWE1SGk1T01KdTJaNUZ1ck10bHZjZ3Rtb1hmMk1lWG5z?=
 =?utf-8?B?cnlwdmdrVVc1VWRUTXVJLzFNWk9vSVl6eXFhYlo3cjNaVEhXMnd6VWUzWUNL?=
 =?utf-8?B?SCtUb1RUM2VOblVVQyt1UjhQMUtLZnU2YWppNHdOZVhFdVplWVorSm1UVjAr?=
 =?utf-8?B?MFJIdXFCRkgxWDVJVWU2VHlqS05HZFErQ2U1K0xVbGs3LzVlaXJNL0Y2aGVv?=
 =?utf-8?B?WE14RnduY2lNNTlKQ3VEQWFJcHVpZ1gxcUtDeTJrQVZnYndDODdHc2hmS2Jv?=
 =?utf-8?B?cmhjZjEwNnpVRlovY05hWE54eG0yVWcrV1RTNUwvc3dVbG5aSXlRMVF5cHhT?=
 =?utf-8?B?SUhvTXcvYkpOZ2l2RXZXb3V4RzRZNG1wN1RiY0p2UFg5eFJLNzIvbmdIZWkv?=
 =?utf-8?B?TDdKNTBwZHdmMFQzNVJzb2RCdVRvbmo3NUd2c0tGd1Vzd0prVWlDUVB3N1lE?=
 =?utf-8?B?L1lPeUV3ckYrTW1KdFg4NWF1TDVPM0VKWHd6Rm1ua1lNcWpXVWlUZnVKb1Fw?=
 =?utf-8?B?ODJVc3JNZm5KaDFnNjkzNE5vS2VudXVBRmQwdlRHMHhlNXZ3SE9ZK1Q4S1l6?=
 =?utf-8?B?OXVjZWMvcWhrQzNsUlNyazU0cjRuU2EwYmtNQnpoZ2RmTGJQQ2tTaWlFVWph?=
 =?utf-8?B?eXYyMEpxY3o0RXFveW96MHhybC85NTR4bFJ0QWkzZG5nNkhMQytETzVLL0xP?=
 =?utf-8?B?NlAwT2VtaWxnTUIxQlU3L0JCZ0xBcjNIQ1R4QjJadHljR2k5d2lWN1lkZkN2?=
 =?utf-8?B?eUxsclY3OTRVSXB4UHZtWmx1Nmg2bU9taHVtUTJpSzVtelFyYktoSTZ5RGFO?=
 =?utf-8?B?TEFSbVo1MUl2Njd3NVhLRE1BQ0JzWVpNcFhLazRoRUFaMFplVUtjNElLL1g1?=
 =?utf-8?B?VlRLYTdodTc2bmpCeFg1aElrd21FOWYzY09Da2lJMlJkS0RZTTFnOVd3VFl1?=
 =?utf-8?B?TERRWkF5RGdEUmdVNzRkejFuYmNKUVI2UGJ4eW9JN3VJYzM2UERNOGNPWnhw?=
 =?utf-8?B?d2VPU3RMYmNiZkVQNm1KUTgzc1FzSzlnc0pUQXpKNGU5UDg5VG5hNkgvd2pN?=
 =?utf-8?Q?Q9OYQrDrAVfXr3oCgAblvw8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4128903-10c5-4869-c779-08dbc5da4927
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 19:35:52.5174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WNG31X2PVmBiHvRW/aKq1J3p5bVuoP+JWpm/6KquTu7aKbiUJG9hrsWBB9XJhN3TABkqpAcUm6aoU+Q8mjUcz4LTFH6gO9RjbgT8rrhlU8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7153
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 19/21] drm/xe/uapi: Drop OA_IOCTL_VERSION
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

On Wed, Oct 04, 2023 at 08:28:59PM -0700, Dixit, Ashutosh wrote:
>On Tue, 03 Oct 2023 19:37:58 -0700, Umesh Nerlige Ramappa wrote:
>>
>> On Tue, Sep 19, 2023 at 10:02:53AM -0700, Dixit, Ashutosh wrote:
>> > On Tue, 19 Sep 2023 09:10:47 -0700, Ashutosh Dixit wrote:
>> >>
>> >> OA version was previously used to track which OA properties were introduced
>> >> at which version. However OA version is an outlier in that a similar
>> >> version is not used anywhere else in the kernel.
>> >
>> > This is not strictly true. E.g. AMD's include/uapi/linux/kfd_ioctl.h
>> > contains KFD_IOCTL_MAJOR_VERSION/KFD_IOCTL_MINOR_VERSION.
>> >
>> >> For XE, we will track addition of new properties by means of
>> >> xe_user_extension. Userland can either maintain a mapping of OA properties
>> >> against the kernel version, or rely on return codes (e.g. ENOTSUPP) to
>> >> "discover" OA properties.
>> >
>> > But let's see if we need a version for OA or the kernel version itself is
>> > sufficient.
>> >
>> >>
>> >> Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> >> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>
>> ok, if there is precedence for a version, no harm adding it, but I agree
>> that we should see if there are ways to do this with the generic OA
>> query. For features that are added with extensions, it's taken care of
>> inherently.
>
>Afaiu, in this case userland is still relying on return codes from the
>kernel to discover available features, whereas a version or capability
>flags allow userland to know available features a priori without
>"discovery" by means of return codes.
>
>> Sometimes there are features that are internal to the implementation that
>> the user might want to know. Those may need to be exposed via
>> capabilities/flags in the generic oa/perf query.
>
>I agree that capability flags do appear to be a better option than a
>version. But in i915 we could update the version without modifying the uapi
>header, which we cannot do if we have capability flags (we'd e.g. at least
>have to expose a new capability bit). Is modifying the uapi header a
>concern?
>

IMO, capability is still a uApi, so any such flags should be part of the 
header. 

Thanks,
Umesh

>Both the version and capability flags can be easily included in the oa_info
>struct we are considering now.
>
>Thanks.
>--
>Ashutosh
