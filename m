Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDE6E82CCF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 20:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4273E10E5A6;
	Wed, 27 Sep 2023 20:18:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22BB10E5A4;
 Wed, 27 Sep 2023 20:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695845878; x=1727381878;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MgHn9as7+ZCuRBXtw5DvRNn1PaxLxtRgDok8YgNEVcU=;
 b=RVAZ3MimIs48UwtjKGuF6KvENFpngM3c1b/RxR7bRDs+/uNsjleA6DC1
 AKP1zAG34nAcfChSDf6GbwSB7c4NYkN2GuTjZXxnY5VsEH1GLgTrrB3za
 WP/FGuacJAetzKQ2gy7Ne34wr2t+jy/gscrEmKUS7mxW0e9S89prFtJvi
 T5v1qQrtHaQjGPyM192jIHn3QC4tPW5jERrQMkzUsgLxSBmPL/4cj6nbs
 MlrOOE4ooVMMw5Xl7oJ7hsOhVgg/8b8JJUulvZmJP7YbiF86Kp7ggmlLJ
 wa/00T3o1dk5n1aDVxoDO7su0rnT8cVfD9j822USGykfKwu40aJZeXfG/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="412826793"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="412826793"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 13:17:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="996300189"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="996300189"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 13:17:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 13:17:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 13:17:57 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 13:17:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpIBmIGpsF1cARXdBvP3cCu5VFt8kGXnytMdkgMpQ1FRDtknu0kcRKntOaH75QDl7SeXXm6NL6oJ4O7cd6dXnm/MStvhPQvG7JrT3DWcuSc0j8uLnrLEpVSffWJEYwy4PaRY0aDAGTvVStjQkLXk5qq1vV+NjLpN2uEH3H6EWMpfWYku6pKg7683DWYZ6f23ZkD9Z7smO4hrvDiI5ou1c1NWShRSj0v5p4oS6XRVKMU/iNY9ZkVlg/6Dgxnq2+5o8Y+FdfQ0i0oPty9jnq34kk0Q6DWPgkGedw9Ngv3naa8lg6dSV6cd1Bl3uouc7NcMhe6R+lSb0zQeyan7/TBdVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGyTnklKYSqsrEYKZ4uzTTBfUvh6CXwgCwB1WIILIdk=;
 b=D4IreoGgNm/3eyB/EzAH11H2INC3p54CcVrO7m6c0QWNf5cZ13Wd7OwkGFSfwpwfTy/MucWtQaRLa7vRsQDjVkRGfx520863ef9AhQZGFcQJb35vNIe8/E+xhFFZA5bW09iuBcZI+3tXZHlZ027qu1mTkIiHgleWNvTHiQQuZv12EetKTWm5P+gw4OyHVRaht5hmGkYcwYamKVFzLqPoNWHPM42oQgK1gMc1H4+kbfE0/uynItIt+N98/PTGViY/23+xSDgrpUp2CLIe1EH6HAu4vbNhik5Q7ubREbxmRFZZxrnwJDnXSeSVzIuQtTwQ4viAiFj0/uUz4Qi60FXRAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB7184.namprd11.prod.outlook.com (2603:10b6:8:110::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 20:17:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%6]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 20:17:53 +0000
Date: Wed, 27 Sep 2023 15:17:49 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>, <intel-xe@lists.freedesktop.org>
Message-ID: <4bnwppryvxkwndq76mzjy5xk3rvo2z5bpby3c6qxu2wusyvux4@su37rl7enne4>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-14-lucas.demarchi@intel.com>
 <20230918075740.gswvt6joydhzbyfc@zkempczy-mobl2>
 <acuibqhswa7alrjto7uokpwcfzisbyxmrnkvbb3usdyco2kuct@wdtecpkkythn>
 <20230919091950.6iuxsetry62u2iwq@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230919091950.6iuxsetry62u2iwq@kamilkon-desk.igk.intel.com>
X-ClientProxiedBy: BYAPR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB7184:EE_
X-MS-Office365-Filtering-Correlation-Id: 33cdc98a-ad90-40fd-7342-08dbbf96d3fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mvhdMREanTgvO02qmyOrqpmHPuWX8SPVy95KgQt0IkJWCfgQW+oR5yq6YBOHyIwrI+2WmWDjt/iFxEpAw2Oex8WyxVP+efBO8t3mgWFQdEPMA0M1GENrpcNKjDCXAv7rTX8azLIEOvARGTMHJTHiiZ8UIabWo5ATY6dwcHH6CLfOSUD86rMudMICPXhz8wx6atKMKveW0YydBU/iYzlKil23QdRdg99t92oQ7WxDQtDRVzxLvFX7lw5Qn3MXVchG8IKzgFOKm1ipm5t1g/FKIgdNqDZKGyet8nnAYl3H7BVm+CDJvEaAenwenqYEqFxUOru3WM7QtAGcW4J6105N093GlaMU+PQkpuvd0tBPtXF1ZmGQfTOVyc/daLob5Lo9hIG/Wnz2HTHOsaeHUf3azH63E55QcYMRK5wk0cfCYLzjNWGN9bVtcqGLwix/vaibsoRu9tjzgrNOS1gHgSIhho93T17QsovlLutVcNpW61D1fDZNpPvXgbmmsXSjJf6pXPib49Suk/HsZSWKxlC4NDmb4+vrwxKTgOrrOkbEGZEWy7KiFhfxOgflRi4ArkY7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(376002)(396003)(366004)(39860400002)(346002)(230922051799003)(1800799009)(186009)(451199024)(6666004)(478600001)(83380400001)(66574015)(6486002)(6506007)(26005)(6512007)(9686003)(82960400001)(86362001)(5660300002)(33716001)(2906002)(38100700002)(8936002)(8676002)(66556008)(316002)(66476007)(41300700001)(66946007)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUJLWGt6THJsdFk4OXFLb2RlKzhORm8wRGwyRVpKcFlCa0FsT2JZUkVpS09M?=
 =?utf-8?B?SDZLMEw2Mzd5eldUTmU2OUNRVlRYQVcyb0Q1WS9pQ2ljVmlacHpGclNpaVNa?=
 =?utf-8?B?UEM4UVdMcnFzWUEvWlRYYkRZaHN5VklQdlp4TTZpTXYyNlM2ODR4QUx0SXdI?=
 =?utf-8?B?dGpNU0ZuajlSU1ozQVpkSm5XdlRrK2pLaE1WbnNiY2EwemY0SG96WTZvMURO?=
 =?utf-8?B?RDZWTVU3Um15ZTh5QXVHZUR1TWhlUDNHa2I2WkdIQzZuVGUrLy9kVUpvRXlI?=
 =?utf-8?B?b0hpMGl1RE9PSlIzdktaZE5ETnl4bEJBWDJTQmNsaDZYbHZUcE14WFdaaVV3?=
 =?utf-8?B?aWRmcEQxcFNreFVydG41R2VadFBFWHdCU28vYTI1MFJOczBQTy9hRXpuMjBt?=
 =?utf-8?B?dWhkOTlLQllTUG5JcWFkK1lFbTlacHloNnJhajl2S2ZaRmd0djJmd2xQMWU4?=
 =?utf-8?B?RXJKaHJhVldwOC8ya0UxZXJTZXgrMVFuSGNnc3BQSnAzSXl4NzRyNDZyTGNG?=
 =?utf-8?B?YTVnNUZRZ3VJSUptejBtei9xWVRCbHpYU0pPd2tJaTRjeXVBK0lFeFQzUEQ3?=
 =?utf-8?B?dlNLQU1oR3BlUlU0TGFkeVhvMmV4S0dxTVF1NGhCMDczOGRGcjJLNGdUaGov?=
 =?utf-8?B?bGlDRkJoKy9WZ3NoUE4vekJhdFg1MkRDeG53bk1CM0grSEw1UHNOLzVlUkhC?=
 =?utf-8?B?QkFucHlkM0pETnZGT1pYZHE2bUNnNkQ4TUFwc1k1NGxtWXVTSVFSVkoxaTI4?=
 =?utf-8?B?RkF3d1ZUSmF2WElZanVabHJ0S3pMTnZMdlduejE2UGR2QVV0Q2IzbFJQRkVX?=
 =?utf-8?B?bVRiT29jaEhYbmFjS25ZaDE0YUd4N2dyZmpLN2x2Y25uYkRvM3U2R2FUTTQz?=
 =?utf-8?B?SjQzTDE0Q0dhQVM2M0pNWWFXa204RWtxOGVHQ2E5ODZKUE1VTkpoVXFWSU13?=
 =?utf-8?B?OEhQaElFRHRxZUc3aVNtdmpnTnB6SmlEQW8yb1g0WmJldWxpeGpTUVZlNWJB?=
 =?utf-8?B?MzRyell5MGxNQVRza1p3c1hyUmFITEhLVnRERmVFU1BmN21lY1g3THZpcVZq?=
 =?utf-8?B?MGh3dnJ1SmFZOTNlVW04dmZkUnNVLzQyaTVidDJMWFZZcE0xTE9Zc0hjM0s5?=
 =?utf-8?B?ZTNWWUpCSG53aFduRGVPS3hrbnp3TmxYNWhGWUp3MUFPbnZ6bnRNcDRJVy96?=
 =?utf-8?B?ZVVCbmIvOVJkYTFoT1FaZ3MvNVdvVFdTMitHVHZDQnlOb2x0cEprREpKcmJy?=
 =?utf-8?B?Y3p0d0hIckdtajhWN1pEbExidjJHcjhwcEgvY1lRSVpZQy9kTUhCbEp4UTgy?=
 =?utf-8?B?MTR6TjRxUU9FYWxZUGtOWFNZOTFES2xBSmVSOHJiYmlkTnFEY05nNmpJbWZV?=
 =?utf-8?B?NldKOEkyMGx6U01BOUV0WG9xcHYvTWdGcldSaHdwdFA1U1ZEbGhuVGpFUTdP?=
 =?utf-8?B?TDdoNmhnaHliekdhVGtHWW9kR0Y3bFN1VUxwUGZjWGJtNGFXTUtNOHN5cjVS?=
 =?utf-8?B?WnhuV292L1lTQis5NXRsOXE2eXhHSTBSZ0pNaFFWR29EMWFRdTVoZVIzdDJ2?=
 =?utf-8?B?L1ZUeStTdzhQVUFLYzdqVjFuajVHZ1pHQTE4azc4Yi9LTnpubGJrcDB2Zncz?=
 =?utf-8?B?eVVKQnA1dDgraCtIM2FJRGdwbHZnYUpFVGgxTzRiWXdPcTFLbGoyWXYzRW1Y?=
 =?utf-8?B?eHVFMXZKTW4yV05OalZQMmZtRUlVL0xXOG4wY0dRT3RQNHh1N3g2Z3RUc0Va?=
 =?utf-8?B?M0MzUTBUNEdPL1U0MXBKQVMwN2VIZFNrRU56ckJweXJxUGVudzB0TWcveTg5?=
 =?utf-8?B?c2hCVDB0QlcwbTlYWnpRZlNTNGwybGY0bVBhdldWcXJORElIUGp0SlZjM0RW?=
 =?utf-8?B?L1dlMjc3QnJlQ2tHaytONU1oN1pFT0EweXpUQXUzYlhJdE5xbUM0UG1FTUZ4?=
 =?utf-8?B?K09YN0lIcnM5d2JYbW9KNHpqMnp5bENTaGpaY0FZcDJ1ZFQyOVFNWWp3VTBY?=
 =?utf-8?B?VWhXeWJON0ZiOURBcmhrdlRFdEJzbFVTOWZ1SEN3YUNNaWJtUUxNaEdNMTZW?=
 =?utf-8?B?SmEvQ2xUajJ0Q1k3VXh6RnQraDVGZm1KQVZPenNzVU9TR3kyYWZsT2x3VWty?=
 =?utf-8?B?ZXQ1YVp3Y3ZodHN3TExrck1xdndjVmIrS2tHU0J1UU1nRlRuY1ZUTnFsYlFy?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33cdc98a-ad90-40fd-7342-08dbbf96d3fe
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 20:17:52.7192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AkSIsAQNFvnXSZ99ZxPI55gAvF9vi4J4MmK7eaB61FhbpcUDDFOT+h8m7cb9bRY39KzbOcR/tWFVhGYsBsU6kC9nyzaDPNP3EVkgiq8ByM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7184
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [igt-dev] [PATCH i-g-t 13/14] lib/intel_blt: Support
 xe2 in xy-fast-copy command
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

On Tue, Sep 19, 2023 at 11:19:50AM +0200, Kamil Konieczny wrote:
>Hi Lucas,
>On 2023-09-18 at 10:17:12 -0500, Lucas De Marchi wrote:
>> On Mon, Sep 18, 2023 at 09:57:40AM +0200, Zbigniew Kempczyński wrote:
>> > On Fri, Sep 15, 2023 at 06:23:45AM -0700, Lucas De Marchi wrote:
>> > > Xe2 xy-fast-copy command is slightly different, with dw01 and dw07
>> > > having a few differences: 1) different bitrange for mocs (it was
>> > > previously absent in dw07); 2) no dst_memory, src_memory;
>> > > 3) hardcoded dst_type_y and src_type_y to 1.
>> > >
>> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > ---
>> > >  lib/intel_blt.c | 76 +++++++++++++++++++++++++++++++++++--------------
>> > >  1 file changed, 55 insertions(+), 21 deletions(-)
>> > >
>> > > diff --git a/lib/intel_blt.c b/lib/intel_blt.c
>> > > index 0658d67f4..508c2de46 100644
>> > > --- a/lib/intel_blt.c
>> > > +++ b/lib/intel_blt.c
>> > > @@ -1149,16 +1149,27 @@ struct gen12_fast_copy_data {
>> > >  		uint32_t client:			BITRANGE(29, 31);
>> > >  	} dw00;
>> > >
>> > > -	struct {
>> > > -		uint32_t dst_pitch:			BITRANGE(0, 15);
>> > > -		uint32_t rsvd1:				BITRANGE(16, 23);
>> > > -		uint32_t color_depth:			BITRANGE(24, 26);
>> > > -		uint32_t rsvd0:				BITRANGE(27, 27);
>> > > -		uint32_t dst_memory:			BITRANGE(28, 28);
>> > > -		uint32_t src_memory:			BITRANGE(29, 29);
>> > > -		uint32_t dst_type_y:			BITRANGE(30, 30);
>> > > -		uint32_t src_type_y:			BITRANGE(31, 31);
>> > > -	} dw01;
>> > > +	union {
>> > > +		struct {
>> > > +			uint32_t dst_pitch:			BITRANGE(0, 15);
>> > > +			uint32_t rsvd1:				BITRANGE(16, 23);
>> > > +			uint32_t color_depth:			BITRANGE(24, 26);
>> > > +			uint32_t rsvd0:				BITRANGE(27, 27);
>> > > +			uint32_t dst_memory:			BITRANGE(28, 28);
>> > > +			uint32_t src_memory:			BITRANGE(29, 29);
>> > > +			uint32_t dst_type_y:			BITRANGE(30, 30);
>> > > +			uint32_t src_type_y:			BITRANGE(31, 31);
>> > > +		} dw01;
>> > > +		struct {
>> > > +			uint32_t dst_pitch:			BITRANGE(0, 15);
>> > > +			uint32_t rsvd1:				BITRANGE(16, 19);
>> >
>> > Similar to block-copy bit 17 is not described here for Xe2.
>>
>> same reason to merge the fields as explained there.
>>
>> >
>> > > +			uint32_t dst_mocs:			BITRANGE(20, 23);
>> > > +			uint32_t color_depth:			BITRANGE(24, 26);
>> > > +			uint32_t rsvd0:				BITRANGE(27, 29);
>> > > +			uint32_t dst_type_y_mb1:		BITRANGE(30, 30);
>> > > +			uint32_t src_type_y_mb1:		BITRANGE(31, 31);
>> > > +		} dw01_xe2;
>> > > +	};
>> > >
>> > >  	struct {
>> > >  		int32_t dst_x1:				BITRANGE(0, 15);
>> > > @@ -1183,10 +1194,18 @@ struct gen12_fast_copy_data {
>> > >  		int32_t src_y1:				BITRANGE(16, 31);
>> > >  	} dw06;
>> > >
>> > > -	struct {
>> > > -		uint32_t src_pitch:			BITRANGE(0, 15);
>> > > -		uint32_t rsvd0:				BITRANGE(16, 31);
>> > > -	} dw07;
>> > > +	union {
>> > > +		struct {
>> > > +			uint32_t src_pitch:			BITRANGE(0, 15);
>> > > +			uint32_t rsvd0:				BITRANGE(16, 31);
>> > > +		} dw07;
>> > > +		struct {
>> > > +			uint32_t src_pitch:			BITRANGE(0, 15);
>> > > +			uint32_t rsvd0:				BITRANGE(16, 19);
>> > > +			uint32_t src_mocs:			BITRANGE(20, 23);
>> > > +			uint32_t rsvd1:				BITRANGE(24, 31);
>> > > +		} dw07_xe2;
>> > > +	};
>> > >
>> > >  	struct {
>> > >  		uint32_t src_address_lo;
>> > > @@ -1285,11 +1304,13 @@ uint64_t emit_blt_fast_copy(int fd,
>> > >  			    uint64_t bb_pos,
>> > >  			    bool emit_bbe)
>> > >  {
>> > > +	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
>> > >  	struct gen12_fast_copy_data data = {};
>> > >  	uint64_t dst_offset, src_offset, bb_offset, alignment;
>> > >  	uint32_t bbe = MI_BATCH_BUFFER_END;
>> > >  	uint32_t *bb;
>> > >
>> > > +
>> > >  	alignment = get_default_alignment(fd, blt->driver);
>> > >
>> > >  	data.dw00.client = 0x2;
>> > > @@ -1298,12 +1319,20 @@ uint64_t emit_blt_fast_copy(int fd,
>> > >  	data.dw00.src_tiling = __fast_tiling(blt->src.tiling);
>> > >  	data.dw00.length = 8;
>> > >
>> > > -	data.dw01.dst_pitch = blt->dst.pitch;
>> > > -	data.dw01.color_depth = __fast_color_depth(blt->color_depth);
>> > > -	data.dw01.dst_memory = __memory_type(blt->fd, blt->driver, blt->dst.region);
>> > > -	data.dw01.src_memory = __memory_type(blt->fd, blt->driver, blt->src.region);
>> > > -	data.dw01.dst_type_y = __new_tile_y_type(blt->dst.tiling) ? 1 : 0;
>> > > -	data.dw01.src_type_y = __new_tile_y_type(blt->src.tiling) ? 1 : 0;
>> > > +	if (ip_ver >= IP_VER(20, 0)) {
>> > > +		data.dw01_xe2.dst_pitch = blt->dst.pitch;
>> > > +		data.dw01_xe2.dst_mocs = blt->dst.mocs;
>> > > +		data.dw01_xe2.color_depth = __fast_color_depth(blt->color_depth);
>> > > +		data.dw01_xe2.dst_type_y_mb1 = 1;
>> > > +		data.dw01_xe2.src_type_y_mb1 = 1;
>> >
>> > I would rather use:
>> >
>> > src_type_y = 1; /* Must be programmed to on Xe2 */
>> > ...
>> >
>> > mb1 - ambiguous for me, megabytes first, lesser 'must be'.
>>
>> yeah, usually we have "mbz" as "must be zero", so tried to extend it to
>> "must be one".
>
>mbs - must be set ? But if used please comment this at struct
>definition, there are too many shortcuts.

I will just remove the suffix and add a comment like you suggested
earlier.

thanks
Lucas De Marchi
>
>Regards,
>Kamil
>
>>
>>
>> I will change this on next version.
>>
>> >
>> > > +	} else {
>> > > +		data.dw01.dst_pitch = blt->dst.pitch;
>> > > +		data.dw01.color_depth = __fast_color_depth(blt->color_depth);
>> > > +		data.dw01.dst_memory = __memory_type(blt->fd, blt->driver, blt->dst.region);
>> > > +		data.dw01.src_memory = __memory_type(blt->fd, blt->driver, blt->src.region);
>> > > +		data.dw01.dst_type_y = __new_tile_y_type(blt->dst.tiling) ? 1 : 0;
>> > > +		data.dw01.src_type_y = __new_tile_y_type(blt->src.tiling) ? 1 : 0;
>> > > +	}
>> > >
>> > >  	data.dw02.dst_x1 = blt->dst.x1;
>> > >  	data.dw02.dst_y1 = blt->dst.y1;
>> > > @@ -1323,7 +1352,12 @@ uint64_t emit_blt_fast_copy(int fd,
>> > >  	data.dw06.src_x1 = blt->src.x1;
>> > >  	data.dw06.src_y1 = blt->src.y1;
>> > >
>> > > -	data.dw07.src_pitch = blt->src.pitch;
>> > > +	if (ip_ver >= IP_VER(20, 0)) {
>> > > +		data.dw07_xe2.src_pitch = blt->src.pitch;
>> > > +		data.dw07_xe2.src_mocs = blt->src.mocs;
>> > > +	} else {
>> > > +		data.dw07.src_pitch = blt->src.pitch;
>> > > +	}
>> > >
>> > >  	data.dw08.src_address_lo = src_offset;
>> > >  	data.dw09.src_address_hi = src_offset >> 32;
>> > > --
>> > > 2.40.1
>> > >
>> >
>> > With my minor comment addressed:
>> >
>> > Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>>
>> thanks
>> Lucas De Marchi
>>
>> >
>> > --
>> > Zbigniew
