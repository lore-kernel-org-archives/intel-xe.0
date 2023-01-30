Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEAFC636D3
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jan 2023 19:28:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF1C10E09A;
	Mon, 30 Jan 2023 19:28:21 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB2A10E0C3
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jan 2023 19:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675106899; x=1706642899;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MxcDVNgXVqd6tmHnzz/t/OpbUmq1dSjSJm+QPOCL03A=;
 b=ICfm5aOJv0uk4VbpQVHepCeHudfzD48nf+qjfoAaUrD0XiEc7LZ3J7tQ
 1rH83XaxrUEyusij6a1KG7sY+xOGx8HVBaAGjuF05Ve+F0+UmCARkbes8
 5E8sjGwCjSgKkYml6svTyelGPHXTyEMFn2At5Got60LKByuYVzA+AGyfR
 p9PDebWbiUJCx8vQLUUDiEB06xmVFZVk3ddcYVnRmLEaIYR/SQnNJ5Uis
 mUwXojHfSsUquXZ3wlAWWnhWZOMu9rFS9pgs9kUtW4pIx4JtwZqcurawK
 fBmqibqswHNkWi3k6A+menW1iGyuBc5V3RfycnAuoNvVcoi7MhiYJ2KYH w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="307305731"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; d="scan'208";a="307305731"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 11:28:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="752954643"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; d="scan'208";a="752954643"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 30 Jan 2023 11:28:01 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 30 Jan 2023 11:27:57 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 30 Jan 2023 11:27:57 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 30 Jan 2023 11:27:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EaVLTTPsK0tR58TfbAylDLvp+vY1PoJ0xn57nmkgkzIOEEC4+Owo+sdrpenOrPA1icV1LKXlYhK9Fwdc70MoMDxLKr6YNlqLBuxEP7NPFkPvhh8yF7v9GeAfxegvSej/0LsmMETu0251wQjx/HDBeirPIZSZHgrLDhOMfuXZDvjYyHJ+qoL+KGN7DBlptdMQBD1QiR1kDqptvAzOlJw6Z7navbfV46TQHf2tvnUgSTqh1J8hAJBFp1wJKcgFFvq+zuQMuJaT4cSJ856IU1wmjqxxbyJee/uW27ZTVH7xaQUzJighdlfedf7ZJtYSpC3mJB2CzuOMTjzMDVSdfRd87g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZa9PPSwBBDS9RvEJQSHSCFpT3pBgcZo56sHBB0Cv9k=;
 b=PbTOoUscJvKU5JZ15X9ukmH+EbZ1i4B9/QA5niHyiJSSx1oFfC7/x7oIVkHFs/ME03xJrVHua0FOtYAMNa6JXp1f6yPCWwYNEsWpfqBHoIJk7w5pUKUUs7JrKDn8stSP9dbEuFmjZ+oR7fa0iHkjBEiNDlQde/a15pkWmWewQazx/cQ52pm2o+TJorjYgY9Zh+aw6wlaWkx8fPBBqDM0WAFDWNKDp9lsnhjdyrnmt7sZ09CYhSJFhkJ0saEMslaAGMdKpEr+Z4UHZXAGVrAfmPQpfy8nQOUHJuTigKIj98QgTRZ/caeQe9MJlXvEcl7pzAm/PLPqoT+ZCc4dFlIY/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5806.namprd11.prod.outlook.com (2603:10b6:510:14b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.30; Mon, 30 Jan
 2023 19:27:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a%5]) with mapi id 15.20.6043.033; Mon, 30 Jan 2023
 19:27:54 +0000
Date: Mon, 30 Jan 2023 11:27:51 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <20230130192751.ozgru3btj67iojfa@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20230130161723.42602-1-jose.souza@intel.com>
 <Y9f7O86ki5W4Qv1C@mdroper-desk1.amr.corp.intel.com>
 <7c9f39e8eb4ad81926af9b91f45509a5a5a9d347.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c9f39e8eb4ad81926af9b91f45509a5a5a9d347.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0149.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5806:EE_
X-MS-Office365-Filtering-Correlation-Id: 1606e2fd-158d-42ea-30b1-08db02f81580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nZqsSRpQs7NQVg2QGaacUKW/JsbgXDPgCY+c8ES/gmm1i4svb635tfBInFNaMTkp6fSnzrwThrzTTVoZ2aJXzaNq6o7snICw17DynGmg/WHdtNjNKSuTHi3cmZHmTGIDXdr282AmM/rwVc5Pz39yYHhfdVWhT8ckdZRB3VF8Dl3rRqGq+celfe/7LhZokbZDeu9A322L9KY2AT9kzmNAeRD6RubqUzeDkydye7NQuxdzWI2xHCnGD1altkrlzZ925RB2glW7jG6Wo5C7ILt/Ggurr3pO7DC8I6NkaoEfB8FpnK9/FMyT/xHlavu6M9KwCp3C8JUsgRFtL1935guAVd0V4ij52Y7uVexL6okoHkBeaJTYmRFMW8jzOznMbXebldetRVMLyQMdrRk2JrL44gQVnAEn6obKQNe+GJZhiG4MouCslQjW0Tk4sKPoLxuTH3f/RSYQdpIjz+hTUXMBzqSiKkYmne2KRo/Nf6TBH43kg2eXfWRA6jInuUJTip8Qdtd6PkzrLSSTn43lX5BwdA4DSiBZ+Lu6uhnEJblHXa7Kyt2BdRbuAysh9ewzu0jPO4uQBurKleZNI5rsisjwsSCoLi+ejj+5YTIRpmbVllaIrBjpKa6JeUrcrMAPIOUUyRHHZ/UeOhd8xug9wHDzIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199018)(33716001)(5660300002)(2906002)(38100700002)(6486002)(1076003)(478600001)(6512007)(6506007)(9686003)(186003)(82960400001)(86362001)(83380400001)(54906003)(316002)(6636002)(66946007)(6666004)(8676002)(66476007)(66556008)(4326008)(41300700001)(6862004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/Od6Cs43x71nAazRp1YU3Rzl3VW2l8CUWTuvEzzFFW4j73HNojIXQm9qJ9?=
 =?iso-8859-1?Q?fly+6fCVWIX4VdIW1u+zEjNPp8mEuCNmPqU2KMEoua2ifdpq+r65TUUiHR?=
 =?iso-8859-1?Q?7fORgkg5QD9bvxJ/h1sNRUxDPpezKeADWGdm/KyHhcr3qtDpA1ivaVKPVy?=
 =?iso-8859-1?Q?SCWo2Q0tuHOPxOZH3o2Pu+SrKoDgMlr4i6ipyLlfJMReNCoO9ttcuETqGx?=
 =?iso-8859-1?Q?zy5l8m9b4Er/MoXQsp7xqLIl371EAnmSS+7Vrixs26jxHWyM3dqKdJYxWA?=
 =?iso-8859-1?Q?VkNUUEVlbf1OW1qm8njdm+4Fme1IqxhEkqPqAEjfgCoe1w5yHS95sOjAnO?=
 =?iso-8859-1?Q?PGQl00hIiN5Bo3ddwBEh97qxdb+v2xTQkuLky1A3iB6uhTY++wUeerZgAE?=
 =?iso-8859-1?Q?Fd/jSq+sXzQucx/Q5eeBZLxGnQqtc9/5E9/iESC0H+ythCGJ2nGF++GNA2?=
 =?iso-8859-1?Q?/VIAJcn8vbscfF4y6SuZq07MAfaxHJy6BWzA4Ym+KHJlf743xrQ4qi98aK?=
 =?iso-8859-1?Q?6jEpYyuzZNf/j1ZlOgBzec33oOHwv3O3JakJbErg+TkIJIAouDIyjs0nX/?=
 =?iso-8859-1?Q?4NWT/UtuQHC3FC8ZH+RpHkYiU9V+V2d+ESgGWSA/u+4k2XG8SU/AK/xW7P?=
 =?iso-8859-1?Q?mFTM2I/SuI61YO7qKl5M4Gupm0HjmxNwDg1PBTbFqwkXNPMM6ke+1R4n/d?=
 =?iso-8859-1?Q?2PTqY0Cj17wvIK5FYS2ZN5tH+O6vaByv1EYU9DQkrDPtYRMECInu6BTJtq?=
 =?iso-8859-1?Q?Gqq89D5w9UO+QWOgx2jxwGGSWgBF/GZYZpnaEtGgL6DSzVt3hvX0K69DOy?=
 =?iso-8859-1?Q?8yrcz1s/8AI2i1/clllPNJyTtGDtaTDxKvSP2xWq3/3KERmC//AZjVAtq7?=
 =?iso-8859-1?Q?Mjleo64SFISRFXyWRjh6AXHRiXCjG5fjG9shf2ww8LU+yIDPt1mwN5IK9T?=
 =?iso-8859-1?Q?HxLVujXnmzyBnY8zAF3F+IxqVN6hoUs+JXr3TomhMl6cbMTESWN+y14Ca0?=
 =?iso-8859-1?Q?Fjw484x/Mc9wZRVrkqgRH82TZ9gKUJogspUd2KtxXe6gi+ZafFc5pTV/Ii?=
 =?iso-8859-1?Q?XyxohjgPkDWRUC13osd0izFuOwGPtnObKg22QSzTQA8B4X6RDwM4lM+5th?=
 =?iso-8859-1?Q?YPHsOEHdSIgxTBu0djHadEt1s80i6V52bViUptcnZOPOdHMIBKi4LCPpt7?=
 =?iso-8859-1?Q?qlDw2VWVrx41rT2QBd5RviRFtr6e+4YyWgJl+ym6tFdLn2/b8JVI8ECy56?=
 =?iso-8859-1?Q?vKD+c1sNAoeOwipUhLX+1XDwdytKCVSjgX+Ex+4FGVl5qPgsRP4INMpMjf?=
 =?iso-8859-1?Q?43Z/mpxZbAaTWDEQefpS/6fnj2bg4fsCgCL3nnHB4bLXQVb3dXoLz0Coa2?=
 =?iso-8859-1?Q?4gNH4RvdIdMg63HSIlFvCp7pCxLJlYMHwIFT7E1npk12CM8xBbaUDNmy+V?=
 =?iso-8859-1?Q?/BaQFMyhDcazfOqJ3mZWMBgJYtVohxsXPB3g0fBQUCB9X1XXWHl56PkDXP?=
 =?iso-8859-1?Q?v5oY1vvsQ9Xcs3ZOFDfBuzzgUAv7YlQjYz2/dKcaaDQohzhSd1esoCvcdt?=
 =?iso-8859-1?Q?UdIzx+U5C4pspx5VOtpkN44PMScgKERGrwKhSKAXa9cdkFqq2luZCBQHAz?=
 =?iso-8859-1?Q?bCc7kHjJ8fVWEmRYO5dI5HFvF9ZAKpsjYmJ+3gU1VzNl4CfXADjCL3BX9T?=
 =?iso-8859-1?Q?lTlkMvefGl4ooxMrnCGE/5/TCeNbKHkKpst8qyyWKuKKeG7qxYztIhS44E?=
 =?iso-8859-1?Q?mk9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1606e2fd-158d-42ea-30b1-08db02f81580
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 19:27:54.1111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 28ZomdursjV0UwxQiQP+BWEhhbncLwplI3zTJ8ZvGhZh0Z5nLTxOtkwLQlkO1WaD7qz2sS8ooX55Wtj9ZIXxYF0vedKiPLtfwrLrpPYG3lo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5806
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Add fake workaround to maintain
 backward compatible in MI_BATCH_BUFFER_START
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jan 30, 2023 at 10:04:25AM -0800, Jose Souza wrote:
>On Mon, 2023-01-30 at 09:15 -0800, Matt Roper wrote:
>> On Mon, Jan 30, 2023 at 08:17:23AM -0800, José Roberto de Souza wrote:
>> > i915 has the same fake workaround to return MI_BATCH_BUFFER_START
>> > nested batch buffer behavior in DG2 and newer platforms to the same
>> > behavior as older platforms.
>> >
>> > So here cleaning up TGL_NESTED_BB_EN in MI_MODE to disable third level
>> > chained batch buffer level.
>>
>> I was kind of assuming we'd just drop this setting for the Xe driver.  I
>> believe hardware will be removing the option to turn off nested
>> batchbuffers in an upcoming platform, so userspace is going to have to
>> adapt to the new behavior soon anyway; doing it while moving to a new
>> KMD seems like the easiest time to make that happen since the UMDs are
>> already updating their programming models.
>
>This would bring even more changes to track when debugging issues in Xe KMD port.
>Better do this after Xe KMD is stabilized and with better CI coverage in UMDs and KMDs.

but if we start supporting these platforms with nested bb disabled,
we can't change it later. At least not for the older platforms that had
it that way.

Lucas De Marchi

>
>>
>>
>> Matt
>>
>> >
>> > v2:
>> > - replace IP_VERSION_FOREVER by XE_RTP_END_VERSION_UNDEFINED
>> > - move fake workaround to lrc_additional_programming table
>> >
>> > Bspec: 45974, 45718
>> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > Cc: Matt Roper <matthew.d.roper@intel.com>
>> > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>> > ---
>> >  drivers/gpu/drm/xe/xe_gt.c |  1 +
>> >  drivers/gpu/drm/xe/xe_wa.c | 28 ++++++++++++++++++++++++++++
>> >  drivers/gpu/drm/xe/xe_wa.h |  1 +
>> >  3 files changed, 30 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> > index 84a73eeccd297..5d07e1e7bd506 100644
>> > --- a/drivers/gpu/drm/xe/xe_gt.c
>> > +++ b/drivers/gpu/drm/xe/xe_gt.c
>> > @@ -311,6 +311,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>> >
>> >  		xe_reg_sr_init(&hwe->reg_lrc, "LRC", xe);
>> >  		xe_wa_process_lrc(hwe);
>> > +		xe_wa_process_lrc_additional_programming(hwe);
>> >
>> >  		default_lrc = drmm_kzalloc(&xe->drm,
>> >  					   xe_lrc_size(xe, hwe->class),
>> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> > index 3325de3edf691..744b7d0982683 100644
>> > --- a/drivers/gpu/drm/xe/xe_wa.c
>> > +++ b/drivers/gpu/drm/xe/xe_wa.c
>> > @@ -288,6 +288,21 @@ static const struct xe_rtp_entry lrc_was[] = {
>> >  	{}
>> >  };
>> >
>> > +static const struct xe_rtp_entry lrc_additional_programming[] = {
>> > +	{ XE_RTP_NAME("FakeWaDisableNestedBBMode"),
>> > +	  /*
>> > +	   * This is a "fake" workaround defined by software to ensure we
>> > +	   * maintain reliable, backward-compatible behavior for userspace with
>> > +	   * regards to how nested MI_BATCH_BUFFER_START commands are handled.
>> > +	   */
>> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1255, XE_RTP_END_VERSION_UNDEFINED)),
>> > +	  XE_RTP_CLR(RING_MI_MODE(0),
>> > +		     TGL_NESTED_BB_EN,
>> > +		     XE_RTP_FLAG(MASKED_REG, ENGINE_BASE))
>> > +	},
>> > +	{}
>> > +};
>> > +
>> >  static const struct xe_rtp_entry register_whitelist[] = {
>> >  	{ XE_RTP_NAME("WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865"),
>> >  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
>> > @@ -362,6 +377,19 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
>> >  	xe_rtp_process(lrc_was, &hwe->reg_lrc, hwe->gt, hwe);
>> >  }
>> >
>> > +/**
>> > + * xe_wa_process_lrc_additional_programming - process additional LRC programming
>> > + * table
>> > + * @hwe: engine instance to process workarounds for
>> > + *
>> > + * Process additional context programming table for this platform, saving in
>> > + * @hwe all the registers changes that need to be applied on context restore.
>> > + */
>> > +void xe_wa_process_lrc_additional_programming(struct xe_hw_engine *hwe)
>> > +{
>> > +	xe_rtp_process(lrc_additional_programming, &hwe->reg_lrc, hwe->gt, hwe);
>> > +}
>> > +
>> >  /**
>> >   * xe_reg_whitelist_process_engine - process table of registers to whitelist
>> >   * @hwe: engine instance to process whitelist for
>> > diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
>> > index 1a0659690a320..872f3e4ddc73c 100644
>> > --- a/drivers/gpu/drm/xe/xe_wa.h
>> > +++ b/drivers/gpu/drm/xe/xe_wa.h
>> > @@ -12,6 +12,7 @@ struct xe_hw_engine;
>> >  void xe_wa_process_gt(struct xe_gt *gt);
>> >  void xe_wa_process_engine(struct xe_hw_engine *hwe);
>> >  void xe_wa_process_lrc(struct xe_hw_engine *hwe);
>> > +void xe_wa_process_lrc_additional_programming(struct xe_hw_engine *hwe);
>> >
>> >  void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
>> >  void xe_reg_whitelist_apply(struct xe_hw_engine *hwe);
>> > --
>> > 2.39.1
>> >
>>
>
