Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E44BC7EE29
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 22:47:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C0B10E787;
	Thu, 25 May 2023 22:47:18 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D591110E787
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 22:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685054836; x=1716590836;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VKon9QGHvsvQLQsSKOUpJ8c5ATQv5vYrdqrA5Z+lnoQ=;
 b=jKCvWADU/Trny0KRV3T2OAgUCU6/r9S8cwfxTBKHG+l68Z6295NUoEnf
 hl9n+d1wvE9lA638fahQQ0gtMN0elsA3k0ky69XxZ6ke0tjB0gj47YrbL
 l6adUdZO4OPyFaRT6mFYjUVq2WMnNg3YWw71u3QcI2AQMHVI4FG3cGMQ1
 Zdgqnk85omLppnu4KA1vB6l54ksI/Ay988jyseAtXATYS/dNBXW9yexkV
 QJr9HiZY52ibyfJsmHqWujxgIdGQ2HolavtWOPDu8glsmH/1GPiJLs9ip
 +uNyxi6qaTYYnu65bxE0NtI1omEZ4yZrY5GgpVD3OgdQnPlEx2JHtNan/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="334395251"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="334395251"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 15:47:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="829278981"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="829278981"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 25 May 2023 15:46:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 15:46:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 15:46:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 15:46:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B799H2sqNhbLe5Cqkw0aGliQB0gYcL05ZWIZ48w6flTbsPZabOT8lqKAzuI3JSFcJjEVjJVGnPK9B+Lo845aNeof4bkKIrxP4vB3JCGqFWyUVL5gYQ41SaU+n3zAnYnVQwKvybKFU9fKjdih+SdXlSXVnFER8rU6eMBkOgskhx0qX+w8G/5T2wwcfyvzwcl0lAAsTn5IGU/5S7OROABGAVSpLKfREyQg4Af7WEbu/wK7eH2xNcZ6EW8x24FEJpw7amIJ6DU9Eky/7BcGe0y86F5IKLcLThwCDTL8vltZWJwsedw0hLJg8UBaIKdoB8rgi9F0TKAg/zW9FUCcBC79VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKon9QGHvsvQLQsSKOUpJ8c5ATQv5vYrdqrA5Z+lnoQ=;
 b=nXLQ+z0dYHS2dUpOcZgwXq6UYgNAP23qh5AzvqLk1V3IR79gROo6mF+L/o2aGM1HpGsKHUhwR+4N0LnOWtynwQiLCXCaf9PHwTQ9vpQ4X7d1jXq81KIVxu35JOkkoQaP5xNwV9dZwa15tYxyYQGcfY98lTQjCeNeOchIHaQjK+Jj5i4GyHG50aJpTWP51Ecnbz7RfDxDbWK5gFuhDYVGkNyf/NIa/whzJHL/6r1fJ9y3BsADEFztxfLs3uhaiGQo+LmRoi1cAm9elvEZ25Fca5laPX38uCj77rObsWPi4OHCnK3UvQ+CnqIsEbCFWvGdLYCRYSut3ABg7dmbqK97aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7898.namprd11.prod.outlook.com (2603:10b6:930:7b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 22:46:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6433.017; Thu, 25 May 2023
 22:46:53 +0000
Date: Thu, 25 May 2023 15:46:50 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Christopher Snowhill <kode54@gmail.com>
Message-ID: <djxnjryahlbbaexqqldv45tlcdlsufjo7zi5biwsmzkggdywmc@wmehm3yarb3q>
References: <20230525015607.2192395-1-kode54@gmail.com>
 <44f4caa513b8b92e322ad7c725fd13b5053a6704.camel@intel.com>
 <can3buqui3msmblc7bkxo7mb5nfwpdlmsg7abo4sit2hqgpc33@rukg2yblkk67>
 <1918VR.US05UYXGP19H3@gmail.com>
 <3bpbea4zj7y2h66rn4vzb2vum5klwtbn2jtn5imlf2kov36zzf@knqmclpzpstx>
 <cd0ce7292aee8d8453477c32d47cecf6ce552682.camel@intel.com>
 <CA+aRtub_6JqwYAXr-TGMgei-+inD85UdF5eTHob==p_u2mm+jA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+aRtub_6JqwYAXr-TGMgei-+inD85UdF5eTHob==p_u2mm+jA@mail.gmail.com>
X-ClientProxiedBy: BY5PR13CA0034.namprd13.prod.outlook.com
 (2603:10b6:a03:180::47) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: f8177379-7138-4ab1-f3e5-08db5d71eeef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 16FU6ykll/vu+Dq55PGxMLl+UF8s3xBMsJMsnwwDZXJi0i41/mmxQBy0n3NYoyWqRQR+0+pqyraheMi2ExigMFq2MYHY4bcZE0ySTIIX97WRU2uYf0KXuUTNDkv2JNj+f1/g0Uwx/oavenpmtN4MvgUt89cJS78cdoptSs1qHPmb9K31DIhmibuPkwzEmm/6KjPxudf2BNk1gY1hihzMU2jFqfjXx8yBrCuSZwevGL2o0oYCffazcly8xkhvyS1jZlv9zWPYOS0B+XEGHslsA7p7uinrn7kPqR0pLcLKRUmD6v8bfq4NxeMYavsSMnUBfLsfUasEoXdsvvMT2iV9QplXVvT1BB7BpOBlOZI+UjuN4IuI1A/nUSuWQL7FXWbR0Kg5vUTYvY5w+QHZcEX/qPHWQXJURvvoiOKS0x7xhsIZJ3fmqkC3RS5C/Qx2xdTAkPnVpbMsu7DTouiGPNGIAAyhqtjIXi+OJDo9KZdQ2ikQfYwSlx+aLqIYEnM9niMa1UYCK1VjbsOqPvsTQIsE447gisCrRGybYFwqJtje1IZrBIqm3SPvkU7gWo+7+icI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(396003)(346002)(39860400002)(376002)(366004)(451199021)(5660300002)(8676002)(8936002)(15650500001)(2906002)(186003)(83380400001)(86362001)(33716001)(82960400001)(38100700002)(26005)(6512007)(6506007)(9686003)(107886003)(316002)(54906003)(478600001)(66476007)(6916009)(66556008)(4326008)(66946007)(6486002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eE9VbjRaTzM5MG5GU1FJUTVkOG5wQXF2ZGg0aG4zYTlyL3hUVktqdFZkclcz?=
 =?utf-8?B?V3NYTFZ6bi90NWZzWk5pbm02U3ZzWTdHWjlxZ0lYSXV3VitKNVlneHlOc2c0?=
 =?utf-8?B?Vmw3UGwvNlNocnJsRm9RZDg0Y21GQTc1eGhtVVZibVB1RmFBdFJIMGowUlUw?=
 =?utf-8?B?RFllWHc2b2tZNkFlL2ZRSjZQUVFJWG5jVWlVN2xIVFlxNjFWV2cwRFNEUUFU?=
 =?utf-8?B?cEtiazNtenR1UGRydXIwaXNiZlFSQm05NitVcUtFQlV3QnRocG9zWFBoV2hh?=
 =?utf-8?B?WUJWMXh2TmlYSGNWQThoQWhxWi9oUDNCdGk4ZjR0cEVEKzVQWFEzS1plN2V2?=
 =?utf-8?B?QlY2M24vNldiYnBLNkwrbWJYRnhQRXJUQ1hrWFpSK1dHd3RxUHdQZGI1bm81?=
 =?utf-8?B?TjRLWHF1bzdpOEpFRFNLVWFXazdaV1V3TzR4TnpBdUZqd0JOdkN3MFFhK0dh?=
 =?utf-8?B?YmlxWEUwc253L2pwYWx2cTVoY1JsWlRYTjdjOHdidUpXenZDelRIREN4em45?=
 =?utf-8?B?SjAzN3N2WEY4ZXZxSTRSR3RTcUlHdkNTc1RERXBkSjhwMVAzbE93azZWU2M4?=
 =?utf-8?B?TFJHeGlMNHhwMTJWSWRhWXlEY2xKMUVtL0YyZ0JUcXNUSnVDY0ZzbEwvNWpl?=
 =?utf-8?B?aklLOHBINENjVy94dDVhU3krM3J4K2xMbnU3Wmx3SnkyemdRQU9OcGRaSXZD?=
 =?utf-8?B?dTFsdXg4K01uRC95cVJGTmUvQnJpanIvQ25BVW5yeVlwK1I5T3lKcVJWRyta?=
 =?utf-8?B?bld1clA4U0I3dnZIZWFOSk91Y216Y2k4eVFiSUVnQTl6cDNtUUE1elF1S3p2?=
 =?utf-8?B?aXFka0tsQlZBZ2NGeDRNeTN6WXRma0FHVCtCc2dEODllN0pnOVNOZVhsOGNs?=
 =?utf-8?B?VElQSk9mTjFGVlpoY1pnZzlFanJxdThtWXorZ0s4L3kwL0NQaklzR0pUc0FP?=
 =?utf-8?B?TEJLMHgxaGc2L1c2NzR2T1dHek02bzFlTXIzWGNKK0o0MS8wRXFXZVQxQkV5?=
 =?utf-8?B?U2tFMDVlTXBTMUsvWGttbEdmdU5RNklkNjhwWEJtRHJNM3MrYkkyWjd5Tklz?=
 =?utf-8?B?czRGVkU0S2VaL3E3YnBNVnVzWlBoMnd5aXVwSk8rWXd2QUZINUM0akRoeE1t?=
 =?utf-8?B?MFN1YW54R2hka3FaK0swSnpGc3pZZVZZL3kwaS9TcXNxRmdTSnJWRXBiZGgy?=
 =?utf-8?B?bWFpNWswc3dzc0tBdDNnaG92V3haTjZFOUFVNjFjN2pVbVVXV0NSbDg1Yi9T?=
 =?utf-8?B?U3dtNjM5SHE0KzY1K0pkRnltdG9wYWFXbUY2ejUvUlAyaHNudkw5Z3ZNQW9t?=
 =?utf-8?B?SldYb2diTE10b01vWFlDVGJMcmMrOWZtcGRna0JSM1IzNi94bTF0WHRRTlZu?=
 =?utf-8?B?UjM3TFQ2MmhCblZqVm0yaUhLNE16c1Q3dXNTWTdrU1VlRlRTa0FqWHByU3J5?=
 =?utf-8?B?MjdUbEFmRW4xNTNiV3BSZzFWYktxK1F1RUZPMlZ5bUI5RTRGWXhFNXAvejVB?=
 =?utf-8?B?V0ZORWM2ZWk3RG43Nm9GNlNOeDJCRU4vRzJpeXU2c3BkTG5iYW9aSG5mQnRx?=
 =?utf-8?B?cXU3QnhQY1JnenVFeVRrM3lHQmJMQmVGTUpuaWxacENacmtvTzc2LzhoRWMx?=
 =?utf-8?B?RWRGazh6QXI1bFFUL3BtaWJEeVZFeUkwRjJLWUNMSE9qZUIwU3BCZmhFdHFu?=
 =?utf-8?B?ZTUxN1hEc2NhU1hNSnQwdHpZbWpSb1NmYzVjYzhBTWtNdDNZLzlsSE93dzd3?=
 =?utf-8?B?RklIb0IrN1VrcHJ5SmFiRUJpRDNSTkFYbXNYMnc0UUM3QnpxWXVJc2NaREQw?=
 =?utf-8?B?Ry80NU0rNGpGcnVORTZUVVRiZUx2L29WRDQvcFVuYlV4VGRCdUlVL0RhT0Fx?=
 =?utf-8?B?UkhmYnZmUTRtcE4wN1lkU0NjTVhNODVERmsrRlBHYzM2d2c2Z2R5TkJXSDJw?=
 =?utf-8?B?ajR6VXJxcHRVNnBtM3RtSEJQQ1h0dHByMHp6TlVUVjM5MTRpQVRnekhIUXdZ?=
 =?utf-8?B?MWpKV1BBNC9LdjIvNVo3RG9mNEo0eU9zb29qVzdFc2FlTXZnUldDRlZhNGNm?=
 =?utf-8?B?MlZhakF3eEV4NHMvZ1IydG5MaUZ0bUVGZkJ6MXIvRC9UNnJPa2gvMmNmNHBX?=
 =?utf-8?B?R0VCYmxXUWxsY2dTNlBZM0JEd3pienVBVDlsRHNZeW1Cb2lHRnFBaHJ6MEpL?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8177379-7138-4ab1-f3e5-08db5d71eeef
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 22:46:52.6185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0yQsSidcej6PzAibqpph13dp9jTo4UNpGB3BXypnvG4PFQJ41Ho2Xes7cEvX8zJXl3paYW/O+12tuUa/XRMTLx2Oy+SM0+BWWIOeJ4AVz1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7898
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
Cc: "Hazubski, Filip" <filip.hazubski@intel.com>, "Yu,
 Effie" <effie.yu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 03:44:08PM -0700, Christopher Snowhill wrote:
>On Thu, May 25, 2023 at 12:44 PM Souza, Jose <jose.souza@intel.com> wrote:
>>
>> On Thu, 2023-05-25 at 12:12 -0700, Lucas De Marchi wrote:
>> > On Thu, May 25, 2023 at 08:48:37AM -0700, kode54@gmail.com wrote:
>> > >
>> > >
>> > > On Thu, May 25 2023 at 08:13:43 AM -07:00:00, Lucas De Marchi
>> > > <lucas.demarchi@intel.com> wrote:
>> > > > On Thu, May 25, 2023 at 01:24:55PM +0000, Jose Souza wrote:
>> > > > > Hi
>> > > > >
>> > > > > Planning to push this today,
>> > > > > Christopher already have sent the Mesa MR and IGT patch series.
>> > > >
>> > > > the whole point of this series is being able to fix it without
>> > > > having to
>> > > > synchronize with the mesa / media / igt / intel-compute updates. There
>> > > > are some reordering in the structs that would better be done before
>> > > > applying upstream and when that is done, then we need to sync all the
>> > > > UMDs. But not for this.
>> > >
>> > > Unfortunately, all userspace software which is also built for multilib
>> > > must synchronize with this change, or else their 32-bit userspace will
>> > > simply fail. In my experience, apps consuming Mesa 32-bit without this
>> > > change will fail spectacularly, often crashing on startup.
>> > >
>> > > I suppose only Mesa really matters, since most users won't be
>> > > installing proprietary software that consumes 32-bit OpenCL or VA-API,
>> > > but there may yet be cases for that. This is usually proprietary
>> > > software, often involving use of Wine, such as Steam's Proton
>> > > distribution.
>> >
>> > yes, but 32bit was never properly supported before this patch. So if
>> > they don't synchronize, they will continue in the current state of
>> > not working at all.
>> >
>> > And I'd still try to pack the structs properly before having the
>> > definite uapi in place, which only happens when this all is merged
>> > upstream, which is *THE* most important synchronization point.
>> > I also sync'ed with Jose to clarify on that.
>> >
>> > I'm about to push it, but since it's your patch I'd rather let you
>> > confirm you are ok with it first.
>>
>> Christopher, until Xe is not enabled by default for the first platform uAPI can break.
>>
>> Was also about to push this to Xe and Mesa but lets wait for you ack then.
>
>Yeah, sorry. I was considering Maarten Lankhorst's repacked structure,
>but that also resizes several fields to uint64_t, which actually
>breaks a few downstream packages I tried it in.
>
>I guess we can stick with this for now, at least unless someone wants
>to rearrange these structures in the near future. At least this way,
>maybe we'll get some wider testing done to squash some of the bugs
>I've experienced, of which I cannot tell whether it's Mesa or the
>kernel driver. Mostly just CCS shenanigans with frame blitting of
>large windows or video playback, or sometimes compositor animations.
>
>I'm not sure, do you think we should hold off until the structure is
>repacked? Unfortunately, the last person to attempt a restructuring,
>mlankhorst, has appeared to have gone AFK for an extended period, or
>is at least occasionally responding to other things on FD.O.

reordering and repacking as we noticed may be problematic.
I'd just commit this now and leave that part for later.

Lucas De Marchi

>
>I'd like to consider his attempt again, but I forget if it had any
>outstanding issues, other than the need to split the patches.
