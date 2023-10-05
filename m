Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C5DE936F8
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 02:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1AE210E33A;
	Thu,  5 Oct 2023 02:35:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D8E10E33A
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 02:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696473328; x=1728009328;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mo6XpH6VadhTTnCclKQerw9VZlkmVojGeBOnIN3w0Ds=;
 b=Y4Z0maLv48gPEry6l5HsyPOVNgU9dCH9EmfJwtf0l+WiSgxW25/reGrg
 5MVICi8/E9al4Qi+FgO0twtZFV1uhBh6GgGGT38YWTq6yeBPVDp8FZWiy
 uuhuynrf6prbJ3A5ltFw1zoYZ2RfJEB7hCYjxgt3N0ZaD15zaM3j9GdTe
 PV9KZEJ0/8H+aTsT+kdEubaouXK0FGv9FEDjPY52qcUCsU4zSS4mf9Osi
 gLlZOMObwL4cAz34MbWlGjTpgKFGogtFtSScF/JWhk51NnJXk+uy3XYQI
 +LOjL/iq+wd7rOGj51tRFwV5Oh6YLlsBv3F4aUKF+ODsf27V9Wb+dGJme A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="383281958"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="383281958"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 19:35:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="842194504"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="842194504"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 19:35:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 19:35:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 19:35:20 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 19:35:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ny3WVWDM7aNq1qwSfFqtPzfwep5K1yQzwsplOjiif7D+ssl9uVPn7H4fpMdq3pDnlSvxEVIp5KL+lXmsxlqL+luOmJnP/Urg65qUtYQ1YeZdUDUl0tYdOYnPA3p/bwEHAy2tG4ZD10JZUx1i7Vv559BCoeexe1wdKEKlJiiF7y8c0F+fPoDFoMuB4e0xF1e7C3KgWFU1gJPm4xfkuLhSuf3S5ar/DsJGaF8OE+cUgYKV/grJnOOJmD9lAMwwlJNP/C6+9zFqX1PPSdo1h+xbEz/k6HOFRkIpAOCub3tXwlZFFrPt3KLmOuwdoDdGAEeZD1aJDUl5Ew2dQPfIhvt5xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvDAFWQEUhUuafxxgOdOhD2RdvFLnSR/r78ApTLhk8w=;
 b=nX1YaYWj5zqwRpWiqBHEjwh6TlOEwhF37mykdtfvvO9uz2exC5aE3o2NXOYlVppElKNi4P7DwqT1pMggDAK0qA/C9rjBVQ5m4mLXQ37YnLINqapfB619IamwCAxQmXpWdbTcdoJ8+qMvdDyc2ILZFFVEaSnl7WCSIVEX77IHttu9bTxZmzcmyOZBYWv9ILnJtcu6wRdI6/wJKKEn5JOvpiSQiigZp8hDcLFySiBNMBJVTtDSpcqHXvh4Ogth31haMq70ZBgR/6fDHurRiB1xFMNiVi2eY+J51CsA9D0A6K5CAD/5/XV1SBpgiXoa03XWNHq+SnjkyiVUKuP2UacZkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 BN9PR11MB5291.namprd11.prod.outlook.com (2603:10b6:408:118::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Thu, 5 Oct
 2023 02:35:16 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b%3]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 02:35:16 +0000
Date: Wed, 4 Oct 2023 19:35:06 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZR4g2l8Gd3TmWuzc@unerlige-ril>
References: <20230926125540.7-1-francois.dugast@intel.com>
 <20230926125540.7-27-francois.dugast@intel.com>
 <ZRYcFy97svJ8Z4NS@unerlige-ril>
 <ZRaTrQ6qqa9wIO9n@fdugast-desk.home>
 <ZRb0uavwuieKeqVy@unerlige-ril>
 <4bb2a25702832a21263c3e5780644b979697998b.camel@intel.com>
 <ZRxaJFgF1Qoqtoey@unerlige-ril>
 <ZR1El9m3GERsbg_I@fdugast-desk.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZR1El9m3GERsbg_I@fdugast-desk.home>
X-ClientProxiedBy: MW4PR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:303:8e::10) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|BN9PR11MB5291:EE_
X-MS-Office365-Filtering-Correlation-Id: 852e9620-483d-46d1-7e13-08dbc54bb580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W2l04hqKXHlAFqU7yy4cX5JGZRb6T+iIjwJzpXR1+s2GcGBMqB+NLQrr/KRU8YSDR5x/czPrvHu+MJmhg3s4FKpxt6MaTD2I5CW8862lhS3Nv9/vDXBDGO2do50g7y7+Tn8imEV8Qk1t5dU0r7YGB5SlHiZ0ks6Z8ghQT+BSEQsbxxiaxPmNF6yvtMizkzX1AYkGR5/NQ3SxSOANKcwFQiXUajcww8OalMyASIru+MM9N1NXqUyuwQ1pSpPkY4nxf/eqJuUsWFIT7iHcKSa72geQfC9DJ3xYIDC00mEIVxabkfFDaeqCCQpwb9HJHttggnpg0V/pHZ5vE/MQk1orWQr973tvu3cIg/TFEurk5CKwZH4no7xP9olrnxB3ymB0cEEsF3z0r7AN3b7EFbMdzhLALcqxHvLw4EEm0I5LO7Y7IQ0/N/QHbU5krlF6PrajPQimSyUkpFsdtM55zvPQ8sjKnkjwyja6ImT6hsNF8xO9alXkvFISLdIj6R0JOkqINm4Jkhu+RdokcUqi1hVKHfOTJGAqjhfJRxKetEam1hotliYik+S1aU+HDxhuv3UCAk3SBwKVAc/LfI/EmiDM5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(396003)(366004)(39860400002)(136003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6506007)(9686003)(6512007)(86362001)(38100700002)(82960400001)(26005)(33716001)(2906002)(6486002)(966005)(478600001)(83380400001)(6666004)(5660300002)(8676002)(8936002)(4326008)(66946007)(6862004)(6636002)(41300700001)(316002)(66556008)(54906003)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OERhWHAvTnZlemNWcWp5c0t3dk1BL1dsUFd3c0lUSFkxY29PbTZOMSt2bEs2?=
 =?utf-8?B?bWFKbFJrSStPRUhNV1o3aEtyU1VzbnBtWFp5OXgzdlJCTzBGdUJBMVJuQ1B5?=
 =?utf-8?B?aHpUZURydi90WmVFTHpJTVAzdzY3OXVTaTE3aTNtZ2p6U1NGSk0rQS9UYXJu?=
 =?utf-8?B?WVRNU0ZqN3BHcDFjTDBtYzFWaVFleFFLZ0JGTUUrN1V5Njlla0M0dkExNEdB?=
 =?utf-8?B?UmNaMmhSTW0xdlVJTkg4d0NZd3N4WElPQWVYbzQwa3pydTZ5UlAvMmVpZFdL?=
 =?utf-8?B?aW04bUI3ZmNZTDkwMHFPNmgydjJQclQxQnREY3hhZU5uQmh4WkNvZ0NnekNJ?=
 =?utf-8?B?cW1FVmdTaXkyS2Z1UmgwRGcyZEZZeFBxc0crSHRtcGlMamR1WHRmSGJqU2FB?=
 =?utf-8?B?elB4QURoVmZpVmwwdWppSjFGaTVNeFNyUi83NDRYZ25NdlZQMXF3VUFqTFl0?=
 =?utf-8?B?MER0QVJRbU1pWHI5Sk1BemRGSjdLQm5kcTQ4SmIrOXA1dUJwbWFqQ0ROZ2VF?=
 =?utf-8?B?QUtCbWkvNW9hbjJxaFlDbjhvWUN3Vk5HTU5QNnBLUW9MblhqNW9HSU5IbEda?=
 =?utf-8?B?bktRb1lTVkZ1a0pEQThPMWlKdWYrNDQ3cUorVEc4Yy8reUViVVY4MTBXUnAx?=
 =?utf-8?B?VTZGRkw3dEJIVzhBWmN5ZzJwSkpibzJsYnlrcFdhUDIvOU90UmZrejlmRmRO?=
 =?utf-8?B?VVBPaTRkWlM4ZzFsMkFJOFYzNHNMZUk1MWYrWnlTTlhhT3o2dzQxazVFY1ov?=
 =?utf-8?B?bVlTS0UyZnZHTEgzOXgxQmt4aHZ5M3pTTnMybUd1eEQweVpHTkZxamFYQ3R5?=
 =?utf-8?B?d050TEExU0R5eEdZenJqSzk3M1YxKzdCS2RyUng1ZGxNTVpCaHdvWkdqZmd5?=
 =?utf-8?B?eW11eDVaYjUvaElqcmJ0QVVSK2F2RWxQbURzZ0Y3L3BVY3YrUW9WRVVJOWVl?=
 =?utf-8?B?bjJGdzZjaXhpbkRvR2l2OGQxd25SNFJRT0ZOdW13UzdCcjloQk1reTZXVURO?=
 =?utf-8?B?ZUp0eGZ3QnhpS0Vvd3lseTJwcmZ6YnFBS0hoVU5mN2lNVHkwVmo3US9oRDZi?=
 =?utf-8?B?cU1QRllxcFhyQVRyT0dHSUg0SmVyMGRKNWZVa0I4Tk5XdGZTdnNramZnSlEr?=
 =?utf-8?B?RTdzMkdJdHIxd3dFc0pzdXdJS2tqZTVzaVFYditjS3FYcmluNjJGR1NQWVc1?=
 =?utf-8?B?T2JDTXVHNVpSSkdWL2hCYTBNNWVoeWNqR2ozVEVER0VrZldPc0R4RzNqMFVN?=
 =?utf-8?B?REhzUUJFMmI0QzN0M0RUazYreWlvZVErTTlYR3owZFFXQzlIajl1UjhYNS8v?=
 =?utf-8?B?TUsyVjFjK1ZBZTJyTW9zaEtwam0xZ3NYOS9ZQjhQcTVLSThnM1pRT1Z1cHhh?=
 =?utf-8?B?Q2ZNZ0xLYXJYZTBGaXpyL3RoWU9oQU1Na0pPZmUyay9pcTd6a25GN3RjVHFW?=
 =?utf-8?B?ajlhZUVYL3lORVNUNndtSDIrZXNnbGFvRjJqK1pjOG9DUkY2eVJ2OEZrWUtB?=
 =?utf-8?B?M3haYWF5OVBnSjREcEowK3R1T1BvY0Qrd0d6b2ZROUlrbWV3SnorMURMOE1M?=
 =?utf-8?B?dGpxUW42eTdIUS9CQVZ2b3YyYkYzeXdRbFo3bTZzdzY2UU1jNm1mTUpPZDRM?=
 =?utf-8?B?bzRhb1dQUHZSYWlCY0JKZjdWWUxYa1U2ZXZYVlB2UmdIbXpINUtKYkV2Qnpj?=
 =?utf-8?B?bXNxaDJHZmQ5YzBoTXI3SWRsVXB2OVNJN1g3aHo0V1JsZ0I2M1BjcDZQendH?=
 =?utf-8?B?SnFKMzJaRGZ1NTBFSWUzWFVCaGhRSjlQRjFjdVl4Z3dQK3BScVVuUDh5U25I?=
 =?utf-8?B?Ty9LYjlDRUVFaGRwVEt3ZGk5SlFHYVJHNWtXd3hzUCtRbnVWQWZKZXBnSWMz?=
 =?utf-8?B?b0c3Zm5nVndpVmUyWGFTN01tYWFEUzU1Q21iQnBuV3d1dUtHOGdKL2c2WGkx?=
 =?utf-8?B?dHZBR3Q4d2VCRUlnRnp4dG5jZFVodVpkSWlxaS9nR0V0dHV3MVBmQXRYMFdk?=
 =?utf-8?B?QjM3cnVsN3FyMGwySS9zam1uTFBoUXN2OHdEMnp0UHpvMFA3WWY4ZEdYV3Ji?=
 =?utf-8?B?bUdJeDVCQXpEZGxBQSt6UW02Y0cvN3NCZG52SElUU0wxWGdKamxXUWlITVdL?=
 =?utf-8?B?dnhwUGVRWnAyWFBDc251VCtTaGdiVTZNbmtlUnlFbzh1SWZHSlV6MG15Rm9N?=
 =?utf-8?Q?8I/BeWRDRkYGi4cQw0OomoQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 852e9620-483d-46d1-7e13-08dbc54bb580
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 02:35:16.3083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQD5SJuzZQ9XtR6iZDBObZ9faSf4qJuYNwESq0HkxdLa+uAt0HVp+/cB+sVnSi+5YuO6flB/JQLUI9MqU0SVKGcUGVwiMuSQV0AOdCgFKLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5291
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 26/30] drm/xe/uapi: Add pad to
 drm_xe_engine_class_instance
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Oct 04, 2023 at 12:55:19PM +0200, Francois Dugast wrote:
>On Tue, Oct 03, 2023 at 11:15:00AM -0700, Umesh Nerlige Ramappa wrote:
>> On Fri, Sep 29, 2023 at 09:45:35AM -0700, Souza, Jose wrote:
>> > On Fri, 2023-09-29 at 09:00 -0700, Umesh Nerlige Ramappa wrote:
>> > > On Fri, Sep 29, 2023 at 11:06:53AM +0200, Francois Dugast wrote:
>> > > > Hi Umesh,
>> > > >
>> > > > On Thu, Sep 28, 2023 at 05:36:39PM -0700, Umesh Nerlige Ramappa wrote:
>> > > > > On Tue, Sep 26, 2023 at 12:55:36PM +0000, Francois Dugast wrote:
>> > > > > > Add pad to reserve space for future uses such as special configurations
>> > > > > > for media.
>> > > > > >
>> > > > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>> > > > >
>> > > > > I saw a comment in v4 that you dropped the patches that are not reviewed, so
>> > > > > this is:
>> > > > >
>> > > > > Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > > > >
>> > > > > Hoping this will be part of the final series that you merge since the
>> > > > > ENGINE_CYCLES query is using this structure and relies on this padding.
>> > > >
>> > > > Actually using your original submission [1] this patch should not longer
>> > > > be necessary, right? It includes:
>> > > >
>> > > >   __u16 rsvd;
>> > > >
>> > > > [1] https://lore.kernel.org/intel-xe/20230814223734.375449-5-umesh.nerlige.ramappa@intel.com/
>> > >
>> > > Hmmm, I failed to notice that earlier. My bad. v4 looks good, you can
>> > > ignore this.
>> >
>> > It is named as rsvd but it should be a pad.
>> >
>> > We can't leave as reserved to be future used to return media engine capabilities because drm_xe_engine_class_instance is also used as input to other
>> > uAPIs and that is useless information after initialization that UMDs should not need to carry around.
>> >
>> > Instead DRM_XE_DEVICE_QUERY_ENGINES should return something like
>> >
>> > struct drm_xe_engine_info {
>> > 	struct drm_xe_engine_class_instance instance;
>> > 	__u32 rsvd;/* future could be __u16 capabilities; __u16 rsvd; */
>> > };
>> >
>> > This can be fixed in uAPI take 2.
>>
>> Hi Francois,
>>
>> As per Jose's inputs, I posted a new version of my series here -
>> https://patchwork.freedesktop.org/patch/560614/?series=124565&rev=1.
>>
>> Can you please pick up patch 3/3 from here. Note that just adding the pad
>> does not resolve the issue I was mentioning in my original series.  We also
>> need to explicitly initialize the pad to 0 in this case. I have included
>> that change as well in the above patch.
>>
>> Thanks,
>> Umesh
>
>Hi Umesh,
>
>Thanks for the update. An earlier version was already included in take 1
>of the uAPI changes [1],

Not sure if the below link in [1] is what you wanted to share. It points 
to the series I posted. I am guessing you were intending to point to a 
take 1 series.

Thanks,
Umesh

>against which UMDs are currently aligning, so it
>would be best to leave take 1 as it is and include your fix as a fixup in
>take 2. Could you please send a fixup instead?
>
>[1] https://patchwork.freedesktop.org/patch/560614/?series=124565&rev=1
>
>Francois
>
>> >
>> > >
>> > > Thanks,
>> > > Umesh
>> > > >
>> > > > Francois
>> > > >
>> > > > >
>> > > > > Thanks,
>> > > > > Umesh
>> > > > > > ---
>> > > > > > include/uapi/drm/xe_drm.h | 2 ++
>> > > > > > 1 file changed, 2 insertions(+)
>> > > > > >
>> > > > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> > > > > > index 79e47708d526..84091860c7d2 100644
>> > > > > > --- a/include/uapi/drm/xe_drm.h
>> > > > > > +++ b/include/uapi/drm/xe_drm.h
>> > > > > > @@ -143,6 +143,8 @@ struct drm_xe_engine_class_instance {
>> > > > > >
>> > > > > > 	__u16 engine_instance;
>> > > > > > 	__u16 gt_id;
>> > > > > > +	/** @pad: MBZ */
>> > > > > > +	__u32 pad;
>> > > > > > };
>> > > > > >
>> > > > > > /**
>> > > > > > --
>> > > > > > 2.34.1
>> > > > > >
>> >
