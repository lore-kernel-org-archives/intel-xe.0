Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C4DE7D27E
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 19:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD6110E42D;
	Tue, 26 Sep 2023 19:52:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657DD10E42D
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 19:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695757935; x=1727293935;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=18MqHOEgfO42vggt7kPWwgAv4j1cGUZ4T5dQnpU8Uj8=;
 b=RT/lNZnvhEni8i3w7jAR57VqqA2YRfZyrKJjLb6rPrKpdGUPi8F9X7Ji
 X0nNzd0LX5tJ9DsA9JAA2YLhUymWVkZe+zAG8BaWYmM2zX/SEL5VVMg+p
 LwBA+UVHA7TQwEXKaKyMOa1M4GsdDU8nCJd1xOg9e8KZzwOPaMHnWm3oP
 pbKZylYV0vklBBwTn4xS+/oZC/cqy6hWwR37BM/0zZKWp57LT115NXRsd
 G/bN23hQm5+EzgPon5QBeW3j0yW5xkHIst22CAoeCflmkTmVV+m3IfaUw
 BQAOS52V7TpdSvlnH7ZCHKBL5tEwCyk0BS4vfn2sxSQmzk6IAfQ8ZvD3Y w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="378936461"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="378936461"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 12:52:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="892325746"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="892325746"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 12:51:09 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 12:52:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 12:52:14 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 12:52:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VPTucw+4TADUMintCDz1N2OSrWfdPwZd9VTn+bGgzS4k9KV1sFJ+11sogbV3xd1xPuf89E+p52pBIoiDeb+3X3SdGoASiGwWLdJ7O+DeP0Xeynek4bNxfq2Rv5IxS5+YQmY64iSdhvy0rHr1At/yVvGqeRcgkWEfclO5va5nz6bfR6N+X5JkqZrGpVa0ZJsnDv9T93vmUec6M1cl6rhwZvgKOLstuLogmzjQtV8kdhm4BChiJ6IsJOtzAIbZluckNX+WZrKx18Q7H2guhOK/XopEpEFAKHOrBP9/5/3KBAxZLgxWRM6AMYImuZaz54jJ3rAqBtpUOGTl207BvegtXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmJ1x4xR/YQEMisx7Jf0VzVaHtu9bMtGb4xwGmG6+Y8=;
 b=lQin0JTN06tLIvaLTkique71wsIqgj/qf7LfbAjFh37E93xGG/3r+m3aimxaiacuj4hFUgKpsAaYAH/HXoWsApFTzIHwZ8zv5Lf0+8kfAeIu5KBLwwKQgozs0DrV4IGOcJbKOd5wOQCYzOy2soTqJTdy301RjvtZ97dzVQsoJqdDUpaXP8DqAygVk8w507B0RPh4DXKy8hYvG3p7LvuUXVfGj4h3OCTFkrzr2uOCK0A/zJPKxbBIdhp23OsalK+YNc56aP7K72de6JY3WB72NDA7+VayqrjBGeYlFOaKJqFxQQ+ul2SYtctMXSE4KbutMgtEgBOwtJbqLIRWSZiuQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 PH7PR11MB6380.namprd11.prod.outlook.com (2603:10b6:510:1f8::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.20; Tue, 26 Sep 2023 19:52:12 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::a51e:7713:dd10:97da]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::a51e:7713:dd10:97da%3]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 19:52:12 +0000
Date: Tue, 26 Sep 2023 12:52:10 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZRM2avt22erTAimS@unerlige-ril>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
 <20230920192940.135004-4-rodrigo.vivi@intel.com>
 <ZRI1yPmabDfopQ77@unerlige-ril> <ZRMnbYcsX+GSEgA3@intel.com>
 <ZRMp8rRXkuybDH3E@unerlige-ril> <ZRMr6JXpSurNe90N@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZRMr6JXpSurNe90N@intel.com>
X-ClientProxiedBy: SJ0PR03CA0182.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::7) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|PH7PR11MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: 3484cd47-34ce-41f7-05fe-08dbbeca1374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 21rBzkg6Q3/Ahnghk0WF7rggK5gMI/v+vozgz+39M5vIyIqr7Qr18UGSnwDhaM1S/TtxfFTOe2N3Jos10+3oWAahMs+4cafr28CQbJo+5KQw2ssYEKibxqkk8c6B1FpP8CckWkaprfMlLdUZK4fRY0FGY13MsxIlMC7zIuARu9LrQku1Dhal4xFJHfUmhX4sJlddcZeOdEDzBwO/ukfhSKrqHXl9LDCO8N+7coVDPxcYSh7ceqAdRXPynJhKOOp67ottne1G+MIjx8enK0n8dyWBxoEgP2Q2cInsM35h3h/leDtWqbKDRrykrh2ie8InCpkkztVOFXK+XPFoDLeO4J135C4XnIHfUzYBlOjeOv3UIeA9o0H4VdYKQCH5mGHWIMHarRCulOyla4C5ZgboliCVp5waNGZKV5n87zspaHaeMQRzvZOcxT7Gyxi9F0yOdxAzsP+rLc3P3vRA2A0lZU28jGaBru79aW9MlPHcuB/6mzguneq+2GspsLmoB3Nxe0ER9EVqzqgJfIYHdTts2Uy/w6eLZFykclEvR0WYzu1Q/eLbnMcyW8w4N15JVXFscvULhCrM5q2hlIx08wByHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(39860400002)(376002)(136003)(396003)(230922051799003)(451199024)(1800799009)(186009)(86362001)(4326008)(6636002)(6512007)(6506007)(316002)(9686003)(5660300002)(66946007)(107886003)(38100700002)(26005)(966005)(66556008)(66476007)(478600001)(82960400001)(8936002)(8676002)(2906002)(6862004)(41300700001)(6486002)(54906003)(33716001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDM2WnRDUlRsb3dLdy9ST09ydEd2dGFVVjdteTdweFUyZjJrUHJURC8zUnlW?=
 =?utf-8?B?eEQxM1hmREQyTElrM205UVRXV0xvMzFMczR0OU96S3MvWXgrNXJ2OE5qOUVl?=
 =?utf-8?B?NTFuMFRhaCs3TmNHRSt4MmtVVnFqYjlqNjltNnFoN3RUdG1OTGY0UTIxdzVk?=
 =?utf-8?B?UzlCNDZnV0xjTWRFZkFBS3pwYTZ1Y1JwR2xQdFVCbHFGRTVjMkErSTh5WW5o?=
 =?utf-8?B?MkRST2kxYjRHRGkydCtxU3dsMXpVNjVCN2x3Mlk3YXAxcWtEREJTRUVlQit1?=
 =?utf-8?B?TWZncVViWFlGL2VpbFhkNzUwaU1LYldQcEovK0xEZ3dEODJOVHU1N3lrbzlG?=
 =?utf-8?B?aGVzUEVYUURadEt5aU5DcWFUTzRZalVjajdIWmcrd21qaDV6cklWU3I0Qmhm?=
 =?utf-8?B?WVJoMGdsczZUZXNNbnNWcDZMZDlLREphVzdaWS9WdVZjcjFnTnErTHBuYjF1?=
 =?utf-8?B?MC9QK08vK3h4UU1SdXl6ZENMbjI4eFdnQ0JDQ2IyRm5YV21XUW1YT2M0RlFB?=
 =?utf-8?B?QTVhZk5uM3luT0lhUU9zMlRka2MvQWpOWEFyU1d0UlJhTjFQYU05blBQaVVy?=
 =?utf-8?B?VzZrZERtS0pPMEpBTEd1Vlc0b0IvUXBGRzVVZjZwbjB2Zkhuc0tJQzdVdGJt?=
 =?utf-8?B?VGxmcWVJK1JiR2ZjRnUvVktwcElNYVNldGthS2V1OTFNVUJRVENVU2pabWRa?=
 =?utf-8?B?bFVVYlhuMkYrMFQ3YVd0WXZyLy9LV216MlZWV1VwbHpMTDRaWXplVStJOXlu?=
 =?utf-8?B?cWwvR2VoTWNrS0JrWWF0SVFLOElZODRrajFzaDFUUDRSZVZRbmNsb1VBaDRM?=
 =?utf-8?B?TEdINW1ocTc0dTBQbWdtd05XZHRDY1BqQW9UcmtsY3ZUeTIvc0hVTUVqZkhR?=
 =?utf-8?B?Wlh5dTdmR0NkZnNKMGNjTEh2aDFXN3YzenNrZEVFQk1oMExyS3d1bVU5MG5s?=
 =?utf-8?B?Q2hKV1d2MDNVVUd1M3ZMaldHNTRISldlMGZtd0E0RVlhRUgyTzU1QXRjVEpM?=
 =?utf-8?B?MXp2VG1LNGhGVlJSNnNOcE9UaDNCRG9HSFY0R0NpbExXaWVvOUd3ZTMvNHRq?=
 =?utf-8?B?c3FyL0ZkY1ZFVmpqWGFrWUh4VlVsYi9PanlSSjI3RmVPV2NSTlZJQTlod2xq?=
 =?utf-8?B?TGd4b3pDNlM4c2xBUHA3UVBUc08zQStYZHRMdGZJV1dWNEx5SFlwUTBrT1hk?=
 =?utf-8?B?OG5Yd21hM3FDYjVqeVpEREozUER3NjFCV2taYUdrdy9vNGUzNVdVcGdtUW45?=
 =?utf-8?B?VGRycVFMZHBlQTBhRFh1ckhPRnNsNFJvRytaWC94Q0pmUExrWjVrVUNBS0ZE?=
 =?utf-8?B?bkRNMlJLTGY2ZTFNcnBkdnVGSWpBYWxydHR3UFFVN1hSYllZTWNvNWtPRW1k?=
 =?utf-8?B?SkhQRkdlRTJkb2VORUZGaHl0d3FKbWV5djZwRVhQM2JOZXh1eDJEQzRJa2xG?=
 =?utf-8?B?d2M2a1hxVG5odHlPRWRFWGJGMWJWNVkzc2NWR1hVRXlWakQ1SWpxTGlLd0Fh?=
 =?utf-8?B?ejRwRVN4NEh1RVBZRmdQREM1M1krTzhVeitYdzVjZmxNSkVFOE55R1ZsYjla?=
 =?utf-8?B?RUpOV2IvaHRUZFEyOVZyenZsaVhEaEIva0tiZUxrb0x3dHU2NFlnd0ZhR0JQ?=
 =?utf-8?B?UmQ4RFR6emRHTWk4NUVWdzd2YitVQ2lJYVNEamJmRkM5L2ozSWlJaUJwalpS?=
 =?utf-8?B?ZnBCdlg1ZHJ6Y0pzR2ZOUFhVSFpYVkhsMGNtbWpKRnRhRWVkNmd6QnRvcGxw?=
 =?utf-8?B?NDVGekRNNmFndm9XbVo1MDZwK0J0VWErTEJrWUMvQjd2bmNJYUFQazRtNzRB?=
 =?utf-8?B?Y2RBaDJZbnFwWW9naE0wVjRxblpIVmZtUTlmUHJzbFZRTG9mV3g3dzdZUTZG?=
 =?utf-8?B?ckZsK3padG9QTjVNcFptZThRQnptdGVEZ3lkWnI0cnRIenVNQWJnUndpN0xK?=
 =?utf-8?B?ZTM5Z0p1d0JZKzFFK1QybC9TVnZ6MHZBeVNVVUhFbUE1NElBOW1uOFN5bGhK?=
 =?utf-8?B?QUhEWEJGaStEcnVFQTgvNWZ2RmRJcno0NndHVnJYbi9CVEV1SGtRSW9RVWNt?=
 =?utf-8?B?NHVjS0drM1d2cTlnSTFRVjI3ZDZ1L2pmNkx1Z3pBRmQzOUNoL1IxVFBIQlc0?=
 =?utf-8?B?b1RnMVN6bVJMRU1uVGYreHNhbGJkNmtiTG1yYkhWY09PN09qOUhhMlhXUTdr?=
 =?utf-8?Q?m86Wko4YVbZjJS3J9JawNmw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3484cd47-34ce-41f7-05fe-08dbbeca1374
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 19:52:12.3542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8KesBc8Lwac/hCRgwnlyCuxweddlL8xWC/H+hK534s582RDfA7zNGidc6UrGByKQfjrCT4uacK7K51BIgs5sbGetFymA/SdaShpmfmTeVsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6380
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 03/20] drm/xe: Correlate engine and cpu
 timestamps with better accuracy
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 26, 2023 at 03:07:20PM -0400, Rodrigo Vivi wrote:
>On Tue, Sep 26, 2023 at 11:58:58AM -0700, Umesh Nerlige Ramappa wrote:
>> On Tue, Sep 26, 2023 at 02:48:13PM -0400, Rodrigo Vivi wrote:
>> > On Mon, Sep 25, 2023 at 06:37:12PM -0700, Umesh Nerlige Ramappa wrote:
>> > > On Wed, Sep 20, 2023 at 03:29:23PM -0400, Rodrigo Vivi wrote:
>> > > > From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > > >
>> > > > Perf measurements rely on CPU and engine timestamps to correlate
>> > > > events of interest across these time domains. Current mechanisms get
>> > > > these timestamps separately and the calculated delta between these
>> > > > timestamps lack enough accuracy.
>> > > >
>> > > > To improve the accuracy of these time measurements to within a few us,
>> > > > add a query that returns the engine and cpu timestamps captured as
>> > > > close to each other as possible.
>> > > >
>> > > > Prior work: https://patchwork.freedesktop.org/series/87552/
>> > > >
>> > > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > > > ---
>> > >
>> > > Should already have an R-b from Jose based on this -
>> > > https://patchwork.freedesktop.org/patch/552682/?series=122440&rev=1
>> >
>> > While incorporating that and fixing IGT, I noticed the inconsistency
>> > present on the v2 that was not part of v1.
>> >
>> > Why we have the struct name as engine_cycles now but the query itself
>> > is still cs_cycles? Which one is correct? why do we need both and
>> > cannot align in a single name?
>>
>> Jose had commented that XE does not have the concept of CS and asked for a
>> rename to engine. In the latest revision of this series, I had replaces cs
>> with engine everywhere.
>>
>> We should use engine.
>>
>> Latest series - https://patchwork.freedesktop.org/series/122440/
>
>yeap, I got from there...
>I still see
>+#define DRM_XE_QUERY_CS_CYCLES		6
>there
>;)
>
>I can do the renaming locally if this is the right thing to do...

oh, I think I missed that. It should be changed to 
DRM_XE_QUERY_ENGINE_CYCLES.

Thanks,
Umesh
>
>>
>> Thanks,
>> Umesh
>> >
>> > >
>> > > Thanks,
>> > > Umesh
