Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852BAEE4996
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 05:38:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5027E10E2DB;
	Tue, 22 Aug 2023 05:38:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE6BD10E2DC
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 05:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692682710; x=1724218710;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jxKv2e2CNY/ALq3rg1nwOLEJ1DmgyB7FKSibk7c3KA8=;
 b=haHv8nNkFNfOI21UPAWkkk1LF0mDsAjNaHcbwFVDgz5mxcyuE6kHUpME
 awIppCAyycKjHYJ8G+KICfZ08gqr1wjmvDfzKHFgF1oII5TcLGpeDPars
 FLsCnEnJ5zn+9XWFKC293c4ylM8aDd2d1MI5IouL4p6XJqTKwDDBHx8pB
 K6qDxLvAmrxgQ2agDV6M1xSgaoFJ4QyDjqtLazr6DaDJvzn/Uc1f4LJDV
 RQ8Rey7rUXXe/KKJ1mqNaMD3jM3NsK1pBQXT7UoemlCUyWyxVJKPTdL7Q
 d11neD4VAOmrY+cjlA+KALDI+Pz+lj//qz/AzvJvNcKD6dvBvA0PBjjmk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="437696724"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="437696724"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 22:38:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="1066902602"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="1066902602"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 21 Aug 2023 22:38:29 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 22:38:28 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 22:38:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 22:38:27 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 22:38:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbT29qAQexwX+sQWgcgf4SQ1zyfhRgsFbFsgfYRGHpI6RY2OXvmv6IxzX/AMF/BIImh//8ERHusmpzeJ8ATA/Coztwnhp3WtKgxW1ZE6EAekX2C14bEjAQ3cFBkzYZ7aP5t/rKGd2b9U2bpm3BP3ae1wZNS8+AYgPCGNsGfLGNkX54cm3ZWhM3F9xCWKFS4elXY6d+xfxFAP2IlQk1mkh/n6nbb/8ReTNRAW4VcE1vddZCf/THdzXU4PliDE2XISSe7LzKQcYB07k7Dc7vcKNRp2H3M7ipGMVejjl0Az0cTXHTP5Ae14eZxOjW6CH4n6hv6C46D8Mgxnpk7a5YFeNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hTnOrO85aKzeZ3L+fuJP0vtEPufL5zjod+eWV2Q23M=;
 b=GSbTMXNB95u/higXqM2+eec/evPr/p8BLgXCGOOJDogGSSJ8YfgHhCD4JknhCCIPa/ENE5b90CM6yloplCwiWUef8YLsbgbqZHNuR9nPD3A7lKPzXEQ+oA+j3OXPw6yJpTHksCFO/sIz8hDNho4LC8dUs4ojB/Q9QNXWCkShaSXV6J2qVh2ZVmtbmRAfyO/Df4zSq2OazMlF7sBEoW4+7l7pUxjrE0YVZq1CV6lIm7gOla5MVs86BQiNsht5NIkHC0LIA0xkjteqSKsgOvgGmsZ0LUvyJR9E/nttrSGLWOOg9O470sp5MLufh6twt4Pa4l4ZzHDd4oMnJ3Xn3iIIoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by DS7PR11MB7905.namprd11.prod.outlook.com (2603:10b6:8:ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 05:38:22 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 05:38:22 +0000
Date: Tue, 22 Aug 2023 11:08:10 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZORJwnjGGpepCpAx@bvivekan-mobl>
References: <20230818220824.700519-1-lucas.demarchi@intel.com>
 <20230818220824.700519-9-lucas.demarchi@intel.com>
 <ZON7pQL3RH8ZSaPH@bvivekan-mobl>
 <hwe6d7pbsibj4lf46gsherwfsq3pzayxvofwlvhj3k6ahwradi@hhwryrzxq2ty>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <hwe6d7pbsibj4lf46gsherwfsq3pzayxvofwlvhj3k6ahwradi@hhwryrzxq2ty>
X-ClientProxiedBy: PN2PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::14) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|DS7PR11MB7905:EE_
X-MS-Office365-Filtering-Correlation-Id: 200265fd-f27e-4275-60d5-08dba2d1ff5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XKBnuQysii4n3lkRV2lDRYFFizChh4d4BziwU1fMhj7x2QItNH1M4pAStgAokijl2uMUecXK4Lgk8pdtVuR+2y9kLCF0VWb1Z4+kUAAfxVYtec0rZtUyEZ+rTr4g0jsy4cWg6ZYPCk66zLwe3868HCau9yOUxsAZcbzAzpAsl8irdau0FxGJvd2PGx9KHej/Bg9zyRYcnmdJQKZS4R7t+QYhC5H6HHSmIoLgSkdXr1Y680A9+RflQyow/PNLc9CBIzeXDGkaArPhzvLHB9iHEL0G44xfPVyUIag/ojgGWQxHemtF2sFJtpwnUSXVsH4DBcxnqpBmAtYLiFYqkCJu7EFarnih/L0u0mzwWJnixk6JT9uQCglaKl9dn1+ej2liDnnsiSpPwn+eOk916xgJ3uIY1a1Ji9OCNsnOlkiz0jVWb/ICQ1gXBaENEQJsRPYQDhP8zz6hE4HyBPtUQO8Bm34r1dpJAhLGsKA2riuKt/Q6yy1J5QNNwP6V/3HENXvOgHMimbiujh6dVA3U3VzbJTWqQT+EYQ7yiWkW7+M5j2z6npWnNZByYcZqJ6/xzoxW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(376002)(39860400002)(366004)(396003)(136003)(1800799009)(451199024)(186009)(6666004)(8676002)(6862004)(8936002)(4326008)(6636002)(316002)(478600001)(66556008)(66946007)(66476007)(41300700001)(6486002)(6506007)(6512007)(9686003)(33716001)(38100700002)(82960400001)(26005)(53546011)(5660300002)(86362001)(44832011)(107886003)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmtQQ3NYMXRGTVpSSUNMRHUyajZNYzdSYXJwUGRqL3ZRYVVzRUp3TTM2eTdt?=
 =?utf-8?B?LzB6bWdqSkZ0eDIyUFdsdjhkWlVYeDVkbzErS1dWTW92bG5KcDFrM2JUWk1V?=
 =?utf-8?B?d21DbGt6ejhneFFQQTVJU2ZFdVFGZm9YS1BPTEkyN1BWK0VWN2ZTemRYSTI5?=
 =?utf-8?B?UkgvQ3JxRFliT1ZxYnMzWkxJWktrY2RTQnFIb1N0VFc2Qm9uNFErSE1SdHh2?=
 =?utf-8?B?ZWN3QmpHaStKVzdabGtUU0owN3pjMWFHdndkSTd0eUJyVm1HV2J0ZXRsOXlY?=
 =?utf-8?B?TUptdVNZSkxLbE9QYk14MlRlUWd1V3dHd2ppQmdUa2dMTnJ2b2pRcmpVOUYw?=
 =?utf-8?B?WlBlbVJNSUN2RUswYlhFUWE0NUpMSEJxQ1NLcitZSU5CbFZaU2NzSzBEbStT?=
 =?utf-8?B?bW0vNktwU0pvUzhLRHZZWkxVTGZkUkNjbUlSS2d0eU5WUWZ3QXdzNDI4Mm9Y?=
 =?utf-8?B?U21sMEFDbEdkdmJ3UUpIU3RBUzZkbCtUSW14YStNVkhIQWNzb3F0RWltSnlC?=
 =?utf-8?B?U2JlV0oxSVJvZzNvYjljNHhRakF0QzBDRmE3ZEhtQjR4QkhXZFFZZzRWUFpC?=
 =?utf-8?B?L1BjY2dBd3Y4VjUxV1ZLb0tRL3hpWWNLcmhaUWVtcFh4S0FVYnFxQ0tCRVMz?=
 =?utf-8?B?TEdSMHAwdCt6V0h5V1hyekFKSGlIakJyNStBM3FRRE9oRS9tNndUVkJLM3U2?=
 =?utf-8?B?OFozc2dzZUJlS1Z6Tm0wUEQvOGZZUkgrbWlEZ0V1YXVsa3NSc3picm0wdGwy?=
 =?utf-8?B?RFNpRWVleXpjTjBrdTltMGVMYmVRY0htSU1SbDJ4cjBRR0xFY0w0elpnU01a?=
 =?utf-8?B?Z2RDckRZV0hHNmxSdHNSN29YaXRmSXQ2Z1hlQ3lJQWQ5dlN6Y0tmNk1aU2ox?=
 =?utf-8?B?UHRwMW95blJWb25UbWl2ckpsRjh0M0t6aUl3b0VodFFDZHJ3c2ZIcWdMK1FJ?=
 =?utf-8?B?Q0JyWGlCTWF4SnpKSm9iWVFkcDYyc21oVWVqd3h3UFNGajRKTU1lLzZOaWU2?=
 =?utf-8?B?enJLdUg3ay9kVUJOVjV1Nmh6aFYraUFYYWJDNGtGOEdMYnpBSzhJYlpHeFRa?=
 =?utf-8?B?RXZlcU5UYy9OV0t4MWMyQkd0bDV5UGJDRlZtSHdPOUpVaXBicGJ4WHQwWkdB?=
 =?utf-8?B?WmIvdEFvTllId2V5d3FocEM4Y2FVYnRxZm53SWhmdW8xRERTdS9aV1UwQkYx?=
 =?utf-8?B?Znoycjk1Q29JY1Q2bTJQMTZhZEoyOVVGdndIMUc5b1ZGcFk0RUVsTzRRQVJw?=
 =?utf-8?B?VUd2cnhvOUIreWZ6MDRjZUJHVWJXUTF0enFFWTN0elNBUjJDSnlEaFJLMWxQ?=
 =?utf-8?B?SjVNeFlZVE1ua2lhbXZXZWszZE5lTGp0T2JGN2FtbWlLaU95TkxRL0NrcldV?=
 =?utf-8?B?NEFGTXR3bklCWFNNVXlrVXNQS3ZIS0NXSk5VK0d5ZHlsOHA3NmZzWkVWYS8z?=
 =?utf-8?B?OXNFY1pBaWd2NHhwUy90QU9ZQXpNR1IzNVdERW1XVkllWXJraTNrRjhDdlVQ?=
 =?utf-8?B?VWlWKzBxOXpxWk1GZWZlNXU3WGg5YUozRUFlYzhEUDFpOVhkV0EwYWkwS1hC?=
 =?utf-8?B?T3hSN3ErbHhGaEtHK2pQU1VvRHBtNDBGTTV1WGVTQzZsSHMrY2o1cmxybnhR?=
 =?utf-8?B?VkNVQUpzMTRTMmU4YllQdEhjTVpQUnlRNDBMdk0rMTdoTGRwaVMrMFNqeHFP?=
 =?utf-8?B?Mjd3YThEcitWYjQ2RzlTY0JSYmJaT2s0UFF1dGFxUlE4anhPNGZHenh6VGFt?=
 =?utf-8?B?bUJndHNGRXBUWnFBYXJ5MWRsa2x3OEtFZE04OFVjZ2pmRnY0bXdDQW13QzMx?=
 =?utf-8?B?bk1VREZPOE51M2x1aHZ4Q0dEV01xQjFUUFBoTGdiT2pybmtla2ZyYzNqRElW?=
 =?utf-8?B?RURhbkREK2kvQTVZN2dwSGFCZEthZUdNNzVwQVhYaTkwcmdLb3JGRWkrN1BD?=
 =?utf-8?B?cFFYdHJRakpJcDdHZTZkWGVjYjBYdWpFeG5xa1N3U08wdnZQM21zQnBRRkFh?=
 =?utf-8?B?RnA3K3ZJTVpWak52TlhVSTdtdzljQVBOcmVCSXpIaDNkbnFJMFBsM1hYZGEr?=
 =?utf-8?B?aVdJdW1sdmkrRnZ0ZnRGTFZxMVVhdzhPUEhqK1Q2bEtueE05VkdRV2M4K0tQ?=
 =?utf-8?B?cUZjY1pIeGNJanBadFlEbWV4VmdwSEFGTXRpMEc4OUU4YXJ2Nmc1TXE3ZW1u?=
 =?utf-8?Q?SAZmmTt7tgQ4UoW75HaISRc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 200265fd-f27e-4275-60d5-08dba2d1ff5d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 05:38:22.2729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ET6GGhc5Xov3xnU87xAOYo9kdhkwCq4nuzTxUK7gjcSL8JcDuEp+TQRYT3nMPVo7y/wAuJqwsbk7A7p9JrUscKJR02n1CvANvu4/WmTL8BGN6JqyxtPInDJ81gQA5koR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7905
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 08/15] drm/xe/xe2: Define Xe2_LPG IP
 features
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 21.08.2023 09:03, Lucas De Marchi wrote:
> On Mon, Aug 21, 2023 at 08:28:45PM +0530, Balasubramani Vivekanandan wrote:
> > On 18.08.2023 15:08, Lucas De Marchi wrote:
> > > From: Matt Roper <matthew.d.roper@intel.com>
> > > 
> > > Define a common set of Xe2 graphics feature flags and definitions that
> > > will be used for all platforms in this family.
> > > 
> > > Several of the feature flags are inherited unchanged from Xe_HP and/or
> > > Xe_HPC platforms:
> > >  - dma_mask_size remains 46   (Bspec 70817)
> > >  - supports_usm=1             (Bspec 59651)
> > >  - has_flatccs=1              (Bspec 58797)
> > >  - has_asid=1                 (Bspec 59654, 59265, 60288)
> > >  - has_range_tlb_invalidate=1 (Bspec 71126)
> > > 
> > > However some of them still need proper implementation in the driver to
> > > be used, so they are disabled.
> > > 
> > > Notable Xe2-specific changes:
> > >  - All Xe2 platforms use a five-level page table, regardless of the
> > >    virtual address space for the platform.  (Bspec 59505)
> > > 
> > > The graphics engine mask represents the Xe2 architecture engines (Bspec
> > > 60149), but individual platforms may have a reduced set of usable
> > > engines, as reflected by their fusing.
> > > 
> > > Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pci.c | 19 +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index 46e3a9632efe..ed6c4bf8c63b 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -176,6 +176,24 @@ static const struct xe_graphics_desc graphics_xelpg = {
> > >  	.has_flat_ccs = 0,
> > >  };
> > > 
> > > +#define XE2_GFX_FEATURES \
> > > +	.dma_mask_size = 46, \
> > > +	.has_asid = 1, \
> > > +	.has_flat_ccs = 0 /* FIXME: implementation missing */, \
> > > +	.has_range_tlb_invalidation = 1, \
> > > +	.supports_usm = 0 /* FIXME: implementation missing */, \
> > > +	.vm_max_level = 4, \
> > > +	.hw_engine_mask = \
> > > +		BIT(XE_HW_ENGINE_RCS0) | \
> > > +		BIT(XE_HW_ENGINE_BCS8) | BIT(XE_HW_ENGINE_BCS0) | \
> > > +		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0)
> > 
> > Bspec: 60149 lists more BCS engines than what is assigned here. Is it
> > intentionally limited to only BCS0, BCS8.
> 
> That's only the mmio address offsets allocated, it doesn't mean the
> platform has those engines. See BSpec 70815: there's one main copy
> engine and one paging copy engine.
> 
> Lucas De Marchi
> 
> > 
> > Regards,
> > Bala
> > 
> > > +
> > > +static const struct xe_graphics_desc graphics_xe2 = {
> > > +	.name = "Xe2_LPG",
> > > +
> > > +	XE2_GFX_FEATURES,
> > > +};
> > > +
> > >  static const struct xe_media_desc media_xem = {
> > >  	.name = "Xe_M",
> > >  	.ver = 12,
> > > @@ -320,6 +338,7 @@ __diag_pop();
> > >  static struct gmdid_map graphics_ip_map[] = {
> > >  	{ 1270, &graphics_xelpg },
> > >  	{ 1271, &graphics_xelpg },
> > > +	{ 2004, &graphics_xe2 },
> > >  };
> > > 
> > >  /* Map of GMD_ID values to media IP */
> > > --
> > > 2.40.1
> > > 
