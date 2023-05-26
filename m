Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB40C77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 06:02:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE8A10E1B4;
	Fri, 26 May 2023 06:02:18 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BBC10E1B4
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 06:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685080936; x=1716616936;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TZpqgOlZbhtJFSwwJODR4KWQ/sNdFcpM6V6KRzh4kXc=;
 b=T3/pVF9b0y0Els1UCjOA7lMmfHzcBqXDqkrQP6r1ODBReNgl3VCtdEvn
 3nIDnsiBOdtNIEjXtj1g6wQ38i6ZKALIHLwPLyn/W6pEHm60LEcas8IM+
 FrObd2KY9Ai3K3W5AfJLGfuH3KQJORfmVUeCrGgOg+c9k36+g2Y2c/caO
 t5jD3KZyHmnJ6HOwmlmZ9hsSqTR6+5QrAsl1tj4COiO1EnHQU4qfE01Ge
 zAvmzAGYzu9qZVCKLKF65vaP0ZQyR6Rh6GjXV2zXNjL08lx819GVV4qdl
 m+M1iwfZHswHWi7hqW5SA4cBrrsYx2WBaMxT3mAjs/3fYHNvbdcc8KnVZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="354143635"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; d="scan'208";a="354143635"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 23:02:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="794978455"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; d="scan'208";a="794978455"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 25 May 2023 23:02:16 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 23:02:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 23:02:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 23:02:15 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 23:02:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HolP8IfatE93rK2QE70S0vR/UvlyOMHG1cP13Uuy5kaumixUy6e6t63YOwb8RbDc68tSxSIyy3OECqroWZuLiUVsqeBOcz5TZoe/uRiHmHBNuBKHpxlfFJesSuBxcoKdi2VUjYGDZ1/x8KAPs6lxTIuj5Tv4wRvhqyP65TQoyOJa+E7Ep4Y6+ca8PnJK/BAtemNOEBygrFe3+sGlqVwEYlYoj0AxnNruLEh5cckXMUPjiQnLcSXOJ0c57DSgMh3X/LoIvXcFPf4bsDnE40Nc/kD2g1Nfb9XYzJ/vrF6GAqCdOEMMg41D1bjT7vjvpZzClZRzSjRZxPnRsN6SJrLfhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZpqgOlZbhtJFSwwJODR4KWQ/sNdFcpM6V6KRzh4kXc=;
 b=U1zRMD/3YllIAaTrpecnGyt97hGt6C0dhRTo+e30u14eoiPsNpcuTCJ7n9c/OXXb5pbb8/xFqN+WU5gA2dlZ/UCreoblk0lI7vEUMV1inrIXUdAgOkAc7zyopzoh7Kl4/Gsp6K4LN06oCN7KJd0KVXRDI66PFNLmco9gFj8IrwLEd/ELBcDhBYjvYqMMfNUVEo9Sr49NwKUYAiH4pObhv7Lbqfo+0s2HXOvmugHMA7gw1Xu+mEkFKO8caXSL7jZbpVvFjy207d6wmSAdCSiYU3GJFuEmumL/0PegIq56dUEJspuLoF6hl7Vld/vC0YaYVBaBpL7DyMObDkiXlVF3Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7092.namprd11.prod.outlook.com (2603:10b6:806:29b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.18; Fri, 26 May
 2023 06:02:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6433.017; Fri, 26 May 2023
 06:02:11 +0000
Date: Thu, 25 May 2023 23:02:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Christopher Snowhill <kode54@gmail.com>
Message-ID: <5ag2lyig7gyx45pecwvvk4eshzv4vodlfvb5h2dxkqrpc4d2vz@4sneo7k777nx>
References: <20230525015607.2192395-1-kode54@gmail.com>
 <44f4caa513b8b92e322ad7c725fd13b5053a6704.camel@intel.com>
 <can3buqui3msmblc7bkxo7mb5nfwpdlmsg7abo4sit2hqgpc33@rukg2yblkk67>
 <1918VR.US05UYXGP19H3@gmail.com>
 <3bpbea4zj7y2h66rn4vzb2vum5klwtbn2jtn5imlf2kov36zzf@knqmclpzpstx>
 <cd0ce7292aee8d8453477c32d47cecf6ce552682.camel@intel.com>
 <CA+aRtub_6JqwYAXr-TGMgei-+inD85UdF5eTHob==p_u2mm+jA@mail.gmail.com>
 <djxnjryahlbbaexqqldv45tlcdlsufjo7zi5biwsmzkggdywmc@wmehm3yarb3q>
 <CA+aRtuYgPL0W2URbhHUY1rQ0NFxX5L6s8Yjt5kQoMGd5qSQJVw@mail.gmail.com>
 <CA+aRtuZf0vT9gOHA4zBZPU8WNDo5XGpBROAfgiDjkMfsSYqm=Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+aRtuZf0vT9gOHA4zBZPU8WNDo5XGpBROAfgiDjkMfsSYqm=Q@mail.gmail.com>
X-ClientProxiedBy: SJ2PR07CA0006.namprd07.prod.outlook.com
 (2603:10b6:a03:505::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7092:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a301608-ee16-4260-f2c3-08db5daebe72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: deTKdbkzGVnrzlYv5s/C7o2O5T65J5wHv39sp6pTv2tQVQONfXKQWeTvVCjT2Yg7IAMjDhaZEKXVEApYYoF075Gf0dVPvMJlUK0v7P91zhm4reJ5YCW2XyLZjNVf89Jh/qqNSIIx2qhWsrzOC9mCJamI9IMP2CkO8YoFfZWOewm93pyEWWlEIg5NRy0FX1mVsGghrtViDMrgt8u1tpL/iuRs9m5Mzt8SJ+tXKdduTWocV2BzmK0hPhyQ9OeKe8VsKL1SM7ZQJQEbz7j+mZZuKGLKwhKTuCDJhPiHhW5evHFgPvSPwFE2q3NE3x6IVA/QyQY+eXKTzha9v70bIEpOI/C+jLFNwiabbkh06kOTDqecMVq1CF9bYvaMPrRYNjJdQvfbbAWzCcnIRADxblFGPONoxFibpva65/gSo5SJrTjnm8Wb2HrLrXvkmrdDjrbSAwV57SAoBKL4lKN0ccMJspMOshaFqA/jUtJZRZV8KR2fI/1lGow3H5cDGl6RPU2z1uoLA8MY67+iexSNhpzhVVYw09kVe3FdgjubXn+NIxX0qHZFftkekJ+snH1Z7+2u
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(39860400002)(346002)(366004)(376002)(136003)(451199021)(107886003)(316002)(53546011)(9686003)(6512007)(26005)(6506007)(82960400001)(38100700002)(66476007)(4326008)(6916009)(66946007)(66556008)(6486002)(8676002)(8936002)(5660300002)(6666004)(41300700001)(33716001)(83380400001)(86362001)(478600001)(54906003)(186003)(15650500001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0g3N1VEZ2QrQ3QxR3JlQWZSamR5YU1qa3Z5am5QKy9ZZ1JFZEF6T0Y1YzRj?=
 =?utf-8?B?NFQvUE56dTNRZmpZUXB2Ky9lTVlkZWNDSnExbTBCeEEvSlZBaHIvcHRuM2hK?=
 =?utf-8?B?S0sxeVhIRWhMY2huaEhrL2RMSlFKRHcvR2VBcXZ2OHlvTTEvdWp4c1pWTjl3?=
 =?utf-8?B?M3ZYZ1NSUmVlZGhpbEZEaEpiWTBlME84ZVNhVXZEMEg3YXh0MW9kQUxNK01M?=
 =?utf-8?B?ZmE2QkhzYTBRZytDYkFxL0UxM3luMEZKZ0hkekt0VEdPUTU1Y29mR21SOFE0?=
 =?utf-8?B?S2h2RjFyTGgrN0t6cWRrbjB2ZDZqY3VLV1ovWnZlZStGMGVoOS9TbUlicEhQ?=
 =?utf-8?B?SkVJK3BwZHlNekVEeXFwYXdpR0ZOYWZHQkhkZHlFeU05akQzZ1Nkc2tFK3Nv?=
 =?utf-8?B?clJLU0d2SzV4anVUSWoyNDN3M1R4dUxGNnJ0RW5vR0tManE0MGdaK0VDaUww?=
 =?utf-8?B?eW9FdHNaNGRIdnZlUkNCTXFTQmkwdUUrcW81VVZrUXdyL1BXaUV0SXlkaVpw?=
 =?utf-8?B?TElTcTlzaDhvbGJLeVRhY2FCT0ZIS29uMHZLZDRrTlc0NzIreTl6U3MzeTlX?=
 =?utf-8?B?cHY0YUlGKzFNMDZGRDF0cWVEZFYrejJWSkQzL1ZHOE1adXp5NE5PckRqQ2Vx?=
 =?utf-8?B?N1pNUlE2QUM3OWNFTWFPVnRDRTB5UUVhMzdXWGpaa1NQVXRCWC8rcU14NzF6?=
 =?utf-8?B?VHlsOXAybEdqMFRuMytIdFp5bjVhbVVnMFprcUd3V1N4aFJSL1VOMWt2RS9F?=
 =?utf-8?B?cUdYalgxSG5DSFBJaVNTakppTXB2RlVPVjhtbysvbi9ZL0E4VjVTdmNrRC9n?=
 =?utf-8?B?ampzK3pVNzRPTGJpejcxNVhwTHR4djJ1WEJ5TUZmMXo5enJza05nWGc3YStU?=
 =?utf-8?B?Z3dMSHkwWnVuUmJSYldXaHVPYm9pYmo3MHYyVWd1OWVzWjhLUjg3YnhmWGw5?=
 =?utf-8?B?LzFmdzFqY3gzMFpWZzFBTzVGQTRFWi9CMDNlNGQ5aE5ScTNvVFErQytwdkdy?=
 =?utf-8?B?RnIrSmRmdnhlNEsrekwyMkluYnh6Y0JxUEJVUnJMSElQLy9WbnU5SW1rZk5F?=
 =?utf-8?B?YmphaVI2V2poeFB6VnNHM2krRlNKam9FbzhET202QUREMnIzUFN4MDlsdi9x?=
 =?utf-8?B?VnlOc05tc254Z0dRZEZYbjBwSnNyVGh6bUllcGZqc04rQlRxQ0tRVlBVckJX?=
 =?utf-8?B?djJ3cGlYOXdaV0NDL0h0MUpSRnJ1YlEyN21CejFhMm0wL1FXN05OWGJWaE5z?=
 =?utf-8?B?NmJCNWhlaUlQU28vZmN1dXRRUjJyQ1QxVHRta2dSeCtsY3dsZGFTdi9XQlF1?=
 =?utf-8?B?V205d0YwOGROV3pKaGVRZHFzZGlFU2JWb3NPK1pXWVRENkpTVW5NaFg0TGdu?=
 =?utf-8?B?SSs2Vmd6R3k0NU1KUi9jSUkyb1hodStJbmNQSjl5eklPVTVReDJHUTRVT1l2?=
 =?utf-8?B?R3ZBRzNTUGlFQjYrMm5uMTZZUllmMFdwUEJ3aXRkVUQ4bFNLakovUWNPVFVk?=
 =?utf-8?B?M0ZncitFdmJhT0FjVVkzWldvbmpmSldQVHBnVGlwN0ZaRkVtQml0TGVYdjV6?=
 =?utf-8?B?enRtZWk4RjNtS1JzektibUhtSit2aCsxRWY4akpESmFjZVVqbEtvM3Y1aXVa?=
 =?utf-8?B?Mk9NK0d1VDhzQk9YelAxQ0tIajRhNm51QXl6elNRU1k0VDNvaEFjaXJ0dUdq?=
 =?utf-8?B?czQvN05xdlpUek11ZXhCcHB5bW4vc0FLTTVLK2EwUk5GaVBFakRvQzJHdEdP?=
 =?utf-8?B?Zyt1eGtId0UvKy9SQlBPQnZRRkpWMndnZ2dBZEdtUy9aSE9MeEJCNEJTVmhi?=
 =?utf-8?B?ZXZOTEs1dTRzSWwwTEdjQzdNV1JaYVBSTDNIV1hPVGh0c2FvbEZBR0dNVnk3?=
 =?utf-8?B?SWhKUXY1eVpPRXJKQ3NRcUUrMHluYzRYY25XelcraG85NXVVZWhIMUQzL05E?=
 =?utf-8?B?eDRzczZqUHhLR05nbHd3cktqaVhhRDc1SDJNZ04rcUs3eWZKZkNZRXpXbFlm?=
 =?utf-8?B?ZmlNUDJ3WnRLMEhxdHowUWlHN29BWFI2R2JGT3ZpdmVCNVNzNTdBdWdsWFpN?=
 =?utf-8?B?bTFUbUc4YmxXUGRDSE1MQVplZXoydWFiVm1hMWpmdndVOWVsdFlZRmtteVJK?=
 =?utf-8?B?N3dRQzhFSmpvTDhQRmREOW9ZWFdVTUdWVGwwWk5HREFOcGNBeFFsR3EybkFC?=
 =?utf-8?B?RkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a301608-ee16-4260-f2c3-08db5daebe72
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 06:02:10.6021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BWH4Mu51wspWhHjzi2xNn2Zsw4s8jKqddG9LO7lg9jj+5Coi6Do93evfnWsNQUx3sFomngnWh9StqGhTgVtDE9MecvwvvXzeEXKGoB2lfv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7092
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/2] Update Xe uAPI in a minimally
 invasive way
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
Cc: "Hazubski, Filip" <filip.hazubski@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Yu, Effie" <effie.yu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 05:33:41PM -0700, Christopher Snowhill wrote:
>On Thu, May 25, 2023 at 5:23 PM Christopher Snowhill <kode54@gmail.com> wrote:
>>
>> On Thu, May 25, 2023 at 3:47 PM Lucas De Marchi
>> <lucas.demarchi@intel.com> wrote:
>> >
>> > On Thu, May 25, 2023 at 03:44:08PM -0700, Christopher Snowhill wrote:
>> > >On Thu, May 25, 2023 at 12:44 PM Souza, Jose <jose.souza@intel.com> wrote:
>> > >>
>> > >> On Thu, 2023-05-25 at 12:12 -0700, Lucas De Marchi wrote:
>> > >> > On Thu, May 25, 2023 at 08:48:37AM -0700, kode54@gmail.com wrote:
>> > >> > >
>> > >> > >
>> > >> > > On Thu, May 25 2023 at 08:13:43 AM -07:00:00, Lucas De Marchi
>> > >> > > <lucas.demarchi@intel.com> wrote:
>> > >> > > > On Thu, May 25, 2023 at 01:24:55PM +0000, Jose Souza wrote:
>> > >> > > > > Hi
>> > >> > > > >
>> > >> > > > > Planning to push this today,
>> > >> > > > > Christopher already have sent the Mesa MR and IGT patch series.
>> > >> > > >
>> > >> > > > the whole point of this series is being able to fix it without
>> > >> > > > having to
>> > >> > > > synchronize with the mesa / media / igt / intel-compute updates. There
>> > >> > > > are some reordering in the structs that would better be done before
>> > >> > > > applying upstream and when that is done, then we need to sync all the
>> > >> > > > UMDs. But not for this.
>> > >> > >
>> > >> > > Unfortunately, all userspace software which is also built for multilib
>> > >> > > must synchronize with this change, or else their 32-bit userspace will
>> > >> > > simply fail. In my experience, apps consuming Mesa 32-bit without this
>> > >> > > change will fail spectacularly, often crashing on startup.
>> > >> > >
>> > >> > > I suppose only Mesa really matters, since most users won't be
>> > >> > > installing proprietary software that consumes 32-bit OpenCL or VA-API,
>> > >> > > but there may yet be cases for that. This is usually proprietary
>> > >> > > software, often involving use of Wine, such as Steam's Proton
>> > >> > > distribution.
>> > >> >
>> > >> > yes, but 32bit was never properly supported before this patch. So if
>> > >> > they don't synchronize, they will continue in the current state of
>> > >> > not working at all.
>> > >> >
>> > >> > And I'd still try to pack the structs properly before having the
>> > >> > definite uapi in place, which only happens when this all is merged
>> > >> > upstream, which is *THE* most important synchronization point.
>> > >> > I also sync'ed with Jose to clarify on that.
>> > >> >
>> > >> > I'm about to push it, but since it's your patch I'd rather let you
>> > >> > confirm you are ok with it first.
>> > >>
>> > >> Christopher, until Xe is not enabled by default for the first platform uAPI can break.
>> > >>
>> > >> Was also about to push this to Xe and Mesa but lets wait for you ack then.
>> > >
>> > >Yeah, sorry. I was considering Maarten Lankhorst's repacked structure,
>> > >but that also resizes several fields to uint64_t, which actually
>> > >breaks a few downstream packages I tried it in.
>> > >
>> > >I guess we can stick with this for now, at least unless someone wants
>> > >to rearrange these structures in the near future. At least this way,
>> > >maybe we'll get some wider testing done to squash some of the bugs
>> > >I've experienced, of which I cannot tell whether it's Mesa or the
>> > >kernel driver. Mostly just CCS shenanigans with frame blitting of
>> > >large windows or video playback, or sometimes compositor animations.
>> > >
>> > >I'm not sure, do you think we should hold off until the structure is
>> > >repacked? Unfortunately, the last person to attempt a restructuring,
>> > >mlankhorst, has appeared to have gone AFK for an extended period, or
>> > >is at least occasionally responding to other things on FD.O.
>> >
>> > reordering and repacking as we noticed may be problematic.
>> > I'd just commit this now and leave that part for later.
>> >
>> > Lucas De Marchi
>>
>> Acked-by: Christopher Snowhill <kode54@gmail.com>
>
>I sent the other patch anyway, as a request for commentary, and so it
>will be available for a future date. Do not apply.

applied this one for now so we can get the 32bit support.

thanks
Lucas De Marchi

>
>> > >
>> > >I'd like to consider his attempt again, but I forget if it had any
>> > >outstanding issues, other than the need to split the patches.
