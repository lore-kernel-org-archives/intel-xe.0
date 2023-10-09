Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DC1CD610E
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 17:06:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7771F10E18F;
	Mon,  9 Oct 2023 17:06:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB9910E18F
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Oct 2023 17:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696871162; x=1728407162;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qdzpObEy3Y8Wsylmu4v4RkRGqapuagyhmXx0FfycJ94=;
 b=elCfY/s3PHDtje6I1Zo96xy/8z+uWg4C0J52sq3H2RoAUs5JlaNHNWJ3
 wNbprgpR8zqmZg8YeE9KGGyyrRUq4LWTvEPdA7eg8fwBsDcIi4bOQOdFR
 f+DeHn8hpu8hC6cBgPcHAPKtdoh5ULCFAJyolRnnxf/M/y97XbwnYDc3N
 DTaiZjfQ3+7s4Cm0psYuTiRgaltO9L93tLpBs/eS1vpXK+vt67V3ObJtH
 jKAhTcWZdLRZt0Sp6srckFHOlGMBgxeQSlfwYEcOtniYhESSGizM+LleF
 rI8j0L17sglHadsqUZrMJswPiR7Ypk3Vgw7+n80yNoeijbRkH333h3wnq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="450695160"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="450695160"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 10:06:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="818912286"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="818912286"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2023 10:05:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 10:05:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 10:05:39 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 10:05:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WbmoIgYH6fgct2FSfSPnD0IaGpWrxu+tHEdf+A2811RqBTRPhN9ZNixaeU+MoewI2uQ2mE1ss/TsU+b9uO2oCw+HWSyKB9Mf79YV5Dqu7UWnETWae4hDrBlnwofRu0NurAYxXOIha9LhK6KHnQwo5/67dnNHZCiLGTzS2RbTGHzJ/dxrdD+FSSTYMGxRw2LycBZBdFm4nrUAmsIe6qkcRxh+Ida/VM5ICXPUEPwYrs73qHy4Gs8cxNmdDqTWlMFxPXBCpouAsH0oLSwDeXXynhkW+WATZppL5vfwtoaEBn/RMTS0OAj7Q5fDYRkdd+xvBR88zQjdSpCb9pL48DLGMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7sfK5r11ugalHS+SGogEw7cPP5mEAEmoZEetkejofg=;
 b=XvxZK9c7RgajnCHu3amZ2c1kR0RwUAEgpxJjNOxXmLO1Bm09ErgEBw/QWJm+4RYYRPpRUVcRAbV95tUfPGzKhotcnGLo87vp/Pp6B1HTDe/sWyBwpZTcCN+v/rHMGUgBv3UM6lhbkzqLq/1+VPxyVRYnXDx61F3x9JRIrnNN7shUbhaVGLI3F7q8mi3KDXOF6SciMydWAyiIzq4oQ3atRq+osiRvL6OgfxKw/e/csMVg5Ma8cZJnNus6dLgKmMgH7f0Bfrv9jV3oGdUIA4z1m3AdTxGyQzctqFSkA6nX4AnWYTB4q1TLScUUUqyQ/hYSrb0b6iX9xvmWvo1MpagX0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.38; Mon, 9 Oct 2023 17:05:37 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d%5]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 17:05:36 +0000
Date: Mon, 9 Oct 2023 10:05:33 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZSQy3ZN7daBNBzfk@unerlige-ril>
References: <20230926125540.7-1-francois.dugast@intel.com>
 <20230926125540.7-27-francois.dugast@intel.com>
 <ZRYcFy97svJ8Z4NS@unerlige-ril>
 <ZRaTrQ6qqa9wIO9n@fdugast-desk.home>
 <ZRb0uavwuieKeqVy@unerlige-ril>
 <4bb2a25702832a21263c3e5780644b979697998b.camel@intel.com>
 <ZRxaJFgF1Qoqtoey@unerlige-ril>
 <ZR1El9m3GERsbg_I@fdugast-desk.home>
 <ZR4g2l8Gd3TmWuzc@unerlige-ril>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZR4g2l8Gd3TmWuzc@unerlige-ril>
X-ClientProxiedBy: SJ0PR03CA0219.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::14) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|DS0PR11MB7264:EE_
X-MS-Office365-Filtering-Correlation-Id: 32749fac-25f2-4153-da12-08dbc8e9f439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dLtoyGZgQO1+yZ8tA1AMCjK3/6E8zA4C3lKY94tqFGAmZpV8CWG/hdi7ucq7GwkB+5FuO8oShdqhBf7ry0yHIyWPr2VfhpMakEakljtYKhEMgHS3DFitydaEYNzclNTI3loSyaS2/5CujhBvke35PU70IHkDmqv029iYDZXrALhcW269Od1tI17sNFVd+5rB3OfOQ4uQMDycxh95LVCpukomUbqnPNWZHdYsHY//if5r2LKGAX9+fiyuQIFJ6UNoAd0yI8GMwuWFr9hBja1Lj3h/0UNNfjtylzdJkMN41Juc6S69e2hkEvePZlgzUgnEBqwddGW5yvYwfJIUFSNm1Ct6pc4TV3KHEcMY8WBXgUPRtkAZhbYGSNdOgf7i5J/uyCqo9PMbNtpoDviv4Mwdk6zuXZsx64vTYkJVPRWTxq4QMJqgJrsqGh2zuXJPxJnhx5QNNoePheqba/pZlmcQ7hkNgKM/Nxx9eV8sV9pIk1f7ArL7wtYoAbGpa+h2mhfRi28yhWUT3Cf7qWuHr6NNLb4uEmD53uE5q8fFAy3BGrotL6XWFL0hsld/7hWO7ThKfe03Xi98YxOWGeE6SEliJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(346002)(376002)(136003)(396003)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(9686003)(6636002)(83380400001)(107886003)(26005)(66556008)(66946007)(66476007)(316002)(54906003)(8936002)(8676002)(6862004)(4326008)(6666004)(41300700001)(6506007)(5660300002)(478600001)(2906002)(966005)(6486002)(6512007)(38100700002)(82960400001)(86362001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWNodE0wZURjN0d3bnNvYVBvRVpRVEVES2U3bDM2ZCs1dThHY1JjbFFmbk13?=
 =?utf-8?B?Y0hqeVdsdHZ5Z3ZtUDk2OXQ4aGhuZHRESHVEbVV4dGJhRjE5alhEY3ZTSUhI?=
 =?utf-8?B?SGN5YUNCNkNkbUlFVzFSYzBvMGR2eDYzdHBvZW94ZGtNYzY5eVZZT3QzcFhp?=
 =?utf-8?B?LzZDRUNvL3BRcGpFdUNzVFdGcmM3S2xTSmhRYnFhbDBwa3JRQng0aE9rN3Rz?=
 =?utf-8?B?NmV5amJIbm1EcUVReHI3d1BaK0RacGNFVS9ldEhSajdsdjFxaG4wWk5Zb1h2?=
 =?utf-8?B?N3Fwa09UZ2hvZGdnSXcyY1VoamY1UTF0dGJOcE93M3BrdS9lVHJQSmVlRThE?=
 =?utf-8?B?cDJSZlo2ajQyOEpGZHBVTkkxWFp2d1BTK3JVSEIzallzZ0ZBMGV6MzJvWW1M?=
 =?utf-8?B?TXRxZ3AxdldiNDFQelFHSHd1QkdJeG1telpiSytUcjlZTk0xckdsa2lmWTdm?=
 =?utf-8?B?TWw4SGtrVjRDVUUvc2srSjBYQjltL0M5YVl6eUwzMUM1aG5vbFBSci9GaHg5?=
 =?utf-8?B?NVM3bG1ZTVRyRmN1VlRDeFkyamcxVWhRSldtd1NoUTBpalFiZEluU1YwdVFU?=
 =?utf-8?B?TU0yVnFkZFhOT2Z3VEJVNityWnR4SzA0dzk2VWdWbjg5QUVURlM4OVFTMHdM?=
 =?utf-8?B?M3RoZWpQWnZOVVN0TmgyQjcvRU1LNmlZaWZabSt0UFR3NVYzUkV4TXQrS0Vr?=
 =?utf-8?B?d2t0M1VBRkRJVXBSNExQRU94UWN1WDB0L0xrcVVRd2FWaXJZbFZrLzNBUHpr?=
 =?utf-8?B?Zk5Jcjg5Nk1lQTJMd0VDWGhXT0p1TGRRZGc1aFQ5S0tFRVVPY05aQUd1bFpt?=
 =?utf-8?B?dXBMa3AydnFqTk1jWHdVallHMTFxN2FKV1U2M3dnQk1CcmNMQzJtNUVoMDh1?=
 =?utf-8?B?TC9hdEdIU3kxOTVUaXJsSG1wZThzMXNwSkNPZTJDdFBFQzd6N1huNWI5YnNi?=
 =?utf-8?B?VVJ0TUl6VXRkNTFmSmVvcnBnOGtia3BCZEtjZ2RkN3VOVjZKalJYZnJ4RmNP?=
 =?utf-8?B?OTVaTGNtM2x3dVVUSXBScTg2ajl2VmxtNEdZM1pjOFlFN25FdHk1WmdYeVhD?=
 =?utf-8?B?NFhmWWFLYUgxZldXeHhjQWhadkowWHNTMVlUT3FKUFByZ0RTZjlRWlNoZ01W?=
 =?utf-8?B?S213QW5vMSsvVlREeElmSTVZejJvTTl4SkoxK0o2N3VLUFc1K0RQWm9Hc2lX?=
 =?utf-8?B?WGkxY2JBUDlKQTArR0RscVdUaHNGeXpnS2V6eUZpbFdVUENiSWZRcURwbHVT?=
 =?utf-8?B?NVFnREFYZ2VlN2V5eHE1UzJNMUpCeEZHZ2ZuUjZxSXAyRENLcCtUSmRUcjlZ?=
 =?utf-8?B?eUovaFJSSHZucURrRjZCbVdPK3V1T0ovM2FSVjJGb2FDRHhLMTVVakRkYWVN?=
 =?utf-8?B?eVEwOHVTaUdIT1l5WXBaLzZrcWdHSG9tUTVnNWc2RkdJekxSS1NZaDhNdVA3?=
 =?utf-8?B?VXdpUzVMRmVINnpaUU1xRzJ1dDVqZ2RyRHhLdDdpWElrSnc4b1BEV2JaRkRh?=
 =?utf-8?B?bWtpSEFISDdYZkRrajl4K0xOR1NmZ1JyUTBKN1A2OEE3RTdCN09yVkNHc3V0?=
 =?utf-8?B?VXhuajlLaGJRa1lyaElBdlNaUTBJckhscWpSOFBXL21sSXlYd2prYkpFVHYv?=
 =?utf-8?B?R3RIZzU4YkJxcDNxR0dKbHBENFVwTGtYZEQwdFlHWEhtYWJ6OWw3djM5VU5M?=
 =?utf-8?B?Zmpod1BQNGNWMkRwWFg4dkRwYzhja0ZGaWU4NlhvT3VqSHk0ZEpvMk1hNHI5?=
 =?utf-8?B?Y3JKajdPamVJUU1mLzNnWG51ZzEwL09UY2lkSDRMMzBTUGxrd3ZYR21ad0Zs?=
 =?utf-8?B?dmRmdUhrTlZUSVlkZmJHcHA1RXV0Q3BBcUVaS1N6UkY3MmtvS1FVYUhpUGJD?=
 =?utf-8?B?cUJTVlo5SENtVFhuOTBoZGtFV2xhemdpVnFJY2xZN21DYjlGVmVVRUJ1ckV2?=
 =?utf-8?B?cEFOdWdmZEV6NEpPaTFhMGtEcHk3cVp5ZVFMYUpZS3I4V2h4cHZMaU5XRnBs?=
 =?utf-8?B?eExPK0M3UXRXU2RJenRvT2k2bkllVU5RVVhqSjFJekQxZGRRSXdjdWhITFdK?=
 =?utf-8?B?RnF3blhyZms0TitTV3VBSzM3ZW43UUpyaW1PeUdRV0s3Yi9yUFlvYSsrV2tM?=
 =?utf-8?B?MktRL0FFd0hkeUkybUVmL1VZajlGclRFNmFzNUhZN1ZvOFZUaThxVC9CMGp5?=
 =?utf-8?Q?FTYFM3xValzOEkBeRx1pYOI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32749fac-25f2-4153-da12-08dbc8e9f439
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 17:05:36.4971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UGDHVudS7QdKnGddYf2Xbg5E8WSccHFotOAEjYKuJq95RdvZ0rbp1LlLY6VDk13I9TY+i0F4CQae9YzAyal37l6QAZQKIcWN6qiy0XhFOo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7264
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

On Wed, Oct 04, 2023 at 07:35:06PM -0700, Umesh Nerlige Ramappa wrote:
>On Wed, Oct 04, 2023 at 12:55:19PM +0200, Francois Dugast wrote:
>>On Tue, Oct 03, 2023 at 11:15:00AM -0700, Umesh Nerlige Ramappa wrote:
>>>On Fri, Sep 29, 2023 at 09:45:35AM -0700, Souza, Jose wrote:
>>>> On Fri, 2023-09-29 at 09:00 -0700, Umesh Nerlige Ramappa wrote:
>>>> > On Fri, Sep 29, 2023 at 11:06:53AM +0200, Francois Dugast wrote:
>>>> > > Hi Umesh,
>>>> > >
>>>> > > On Thu, Sep 28, 2023 at 05:36:39PM -0700, Umesh Nerlige Ramappa wrote:
>>>> > > > On Tue, Sep 26, 2023 at 12:55:36PM +0000, Francois Dugast wrote:
>>>> > > > > Add pad to reserve space for future uses such as special configurations
>>>> > > > > for media.
>>>> > > > >
>>>> > > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>>>> > > >
>>>> > > > I saw a comment in v4 that you dropped the patches that are not reviewed, so
>>>> > > > this is:
>>>> > > >
>>>> > > > Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>> > > >
>>>> > > > Hoping this will be part of the final series that you merge since the
>>>> > > > ENGINE_CYCLES query is using this structure and relies on this padding.
>>>> > >
>>>> > > Actually using your original submission [1] this patch should not longer
>>>> > > be necessary, right? It includes:
>>>> > >
>>>> > >   __u16 rsvd;
>>>> > >
>>>> > > [1] https://lore.kernel.org/intel-xe/20230814223734.375449-5-umesh.nerlige.ramappa@intel.com/
>>>> >
>>>> > Hmmm, I failed to notice that earlier. My bad. v4 looks good, you can
>>>> > ignore this.
>>>>
>>>> It is named as rsvd but it should be a pad.
>>>>
>>>> We can't leave as reserved to be future used to return media engine capabilities because drm_xe_engine_class_instance is also used as input to other
>>>> uAPIs and that is useless information after initialization that UMDs should not need to carry around.
>>>>
>>>> Instead DRM_XE_DEVICE_QUERY_ENGINES should return something like
>>>>
>>>> struct drm_xe_engine_info {
>>>> 	struct drm_xe_engine_class_instance instance;
>>>> 	__u32 rsvd;/* future could be __u16 capabilities; __u16 rsvd; */
>>>> };
>>>>
>>>> This can be fixed in uAPI take 2.
>>>
>>>Hi Francois,
>>>
>>>As per Jose's inputs, I posted a new version of my series here -
>>>https://patchwork.freedesktop.org/patch/560614/?series=124565&rev=1.
>>>
>>>Can you please pick up patch 3/3 from here. Note that just adding the pad
>>>does not resolve the issue I was mentioning in my original series.  We also
>>>need to explicitly initialize the pad to 0 in this case. I have included
>>>that change as well in the above patch.
>>>
>>>Thanks,
>>>Umesh
>>
>>Hi Umesh,
>>
>>Thanks for the update. An earlier version was already included in take 1
>>of the uAPI changes [1],
>
>Not sure if the below link in [1] is what you wanted to share. It 
>points to the series I posted. I am guessing you were intending to 
>point to a take 1 series.

fixup here - https://patchwork.freedesktop.org/series/124690/

Thanks,
Umesh
>
>Thanks,
>Umesh
>
>>against which UMDs are currently aligning, so it
>>would be best to leave take 1 as it is and include your fix as a fixup in
>>take 2. Could you please send a fixup instead?
>>
>>[1] https://patchwork.freedesktop.org/patch/560614/?series=124565&rev=1
>>
>>Francois
>>
>>>>
>>>> >
>>>> > Thanks,
>>>> > Umesh
>>>> > >
>>>> > > Francois
>>>> > >
>>>> > > >
>>>> > > > Thanks,
>>>> > > > Umesh
>>>> > > > > ---
>>>> > > > > include/uapi/drm/xe_drm.h | 2 ++
>>>> > > > > 1 file changed, 2 insertions(+)
>>>> > > > >
>>>> > > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>> > > > > index 79e47708d526..84091860c7d2 100644
>>>> > > > > --- a/include/uapi/drm/xe_drm.h
>>>> > > > > +++ b/include/uapi/drm/xe_drm.h
>>>> > > > > @@ -143,6 +143,8 @@ struct drm_xe_engine_class_instance {
>>>> > > > >
>>>> > > > > 	__u16 engine_instance;
>>>> > > > > 	__u16 gt_id;
>>>> > > > > +	/** @pad: MBZ */
>>>> > > > > +	__u32 pad;
>>>> > > > > };
>>>> > > > >
>>>> > > > > /**
>>>> > > > > --
>>>> > > > > 2.34.1
>>>> > > > >
>>>>
