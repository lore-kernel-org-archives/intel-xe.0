Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06C0C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 20 Dec 2023 23:58:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC3610E630;
	Wed, 20 Dec 2023 23:58:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E8E10E630
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Dec 2023 23:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703116717; x=1734652717;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Kzx+t20Vi5ZsCewZKoBWpmI+vX5qOA5StUG09jJI9l4=;
 b=RTdpgGUlnSRszqm0liKkZvOijMK0PEwOjEodFnzfp9gFc8eJqGRhzZJA
 QSpv0LXCLsVl+VllDk9IT9qHSja3k8RMYA6HD3jNHu4pWVj26WGZ/7/UZ
 dKnMJeMr58G+eKRG8BCvkodfYQeHsN48DJ7FSUAppgOIBLfkhLRpjyiul
 ICJcc5eoMOrU/q8x+JHhW+AzM4GRaKA1FCSjHLwFsZpLLt1k/wUvSuB5N
 51t2QZF38SdVPsFTaGhAnPjtN1j/9a7+z2F+OlmMoJUc7YZTiK394gtgI
 FMR8s4VuDEKc9z/lhqADwBJ/I/oenNRVy0DBFSCiu69U4QWf2xeQPdgoU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="386316791"
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; d="scan'208";a="386316791"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 15:58:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="846915765"
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; d="scan'208";a="846915765"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2023 15:58:36 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 15:58:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 15:58:35 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Dec 2023 15:58:35 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Dec 2023 15:58:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTbldXI33PAkpsvZuzCZflV3dkd2a/6eu0eDmKJYRK6u+afWPTUK+3Dy+Swz8Op6HJhsII3jDhhe5ewBPogH2neMvHgX/eCIBvg2XY5KpPkdD2SM17L5quakHuq89xkYkwF7IY9xpRHJJDmJts4EhuO3cCTWBDiEBcUYpw9syR4AB4BhJK8evxUmXnLHT0LZBcCMRviZO23VrWzkg6b8BOzMrT5+Db7P4XSP8El90LbMejlgvbFkMgDPDGenwzVq8n2EbCDR4qsEy8EDGSbU5bmvHzrHoMvpuaWNB9+FIAI59iRC/xyKAeTM+iRx8a7JM+7bPZA7xyiGQBf2HICgCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVcHUgYdNmOgCWRuWHRCR/e7HFbWIeDj4j8gIPrD6ro=;
 b=g8z0yHGc2qfdmZGrTF9gKJWI0G0mQRJuLKymE+iqoZ8KopzVXldAyjtMtDKaW/ZAgldvnxVtAhfUoMa6faqmKdP9zoMoGNCIGEfnRzRGU6Ce9SdAYKnmRQgZJKakkkLTjD9MqgH4zbvqKjJCT5j04yczDEn/TajMCBWTQ4tj+a1YlQfPGba4q/p7qQGzQdml8YgmVG5foyKb5IShT7XuXOWQajU722aramcAJHOdckIxkJOGLZlmil4KdPTFeBqJoPYFWq4kJt81X2woZ1RrkEjFuedZ6hb/UtIeu5W9rBRJRw4hzanRq6axjtDocq3ux30gvx0jV2DHT5rTZ+GoeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 MN0PR11MB6086.namprd11.prod.outlook.com (2603:10b6:208:3ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Wed, 20 Dec
 2023 23:58:24 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9%7]) with mapi id 15.20.7113.016; Wed, 20 Dec 2023
 23:58:23 +0000
Date: Wed, 20 Dec 2023 15:58:18 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v2 0/8] Engine Busyness
Message-ID: <ZYN/mkkRT+oFJLSo@unerlige-ril>
References: <20231207125802.3730165-1-riana.tauro@intel.com>
 <4c5c2902-9503-465e-8a59-d17d75d8781f@linux.intel.com>
 <ZXpgwiRQ7z3cTE3V@unerlige-ril>
 <b753ccd6-3417-4da1-b3d3-a16aad6588bc@linux.intel.com>
 <ZYJ9U7/Y0uqq/Ygw@unerlige-ril>
 <b1573816-c1f6-4958-8171-d5c43a3d2766@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1573816-c1f6-4958-8171-d5c43a3d2766@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0326.namprd03.prod.outlook.com
 (2603:10b6:303:dd::31) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|MN0PR11MB6086:EE_
X-MS-Office365-Filtering-Correlation-Id: 9460f40c-2623-4bed-971f-08dc01b78cba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zB7PXA2aPW/ks0LbQfJqxKNRkrzJQBnaShPvzk9JnDJJ/y3iVAxcTnmqYLmgDUu6R5fB48UGUFi9CRQo9WDhIlDd4mzHQhEs+gK4FZHDR0WuG2YuK6+9Ovj1B/XkcoOF38Fd09dKu5p8NCsMJzyHEiSQRzrVDeQP/9QqFmcOolBOQZg+7inlCgID0TqRXu0YKREfacivR1mAj4ABysb10KNWJj/v+slWs00fZ8B1ZoqVotgAzVb2/ziswzL6V9HaPVib3CKbH4DCZM8nkjX3c7/ADaQ6QSalXDOMB9MqYMO1Ou/RadfJ6IXKDrkPU9+hKFyWouEj8M3+jAgCm+zkwqMYQykDeEHTN0f7RyEhc2zq3KoYj5zWVmO4eWHvYb4rURH6EvC2z9byJd1ep68zFtga7bc4g9ujTvCkMUB3/mtW7ZUT6fzX1gKpiioROwtnP6QLAekaqPU9NMEqQ3/aE15Kk90+EVqNeoDX7e+suyeEDAa0BK8vYiokAlK8zfa4KKNc6biZTNM40plEgux0rfJCzCYwbiQFThkdAlckiWPKXZnifL3Sty1OGOPRLm/B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(376002)(366004)(346002)(136003)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(8676002)(86362001)(2906002)(6666004)(4326008)(8936002)(66946007)(5660300002)(66556008)(6916009)(316002)(66476007)(38100700002)(82960400001)(478600001)(6486002)(9686003)(41300700001)(6512007)(83380400001)(26005)(6506007)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVFVc0RDYU1tNTl3cGxMeUFQSjZiQlV0NUJTVjdoSm5aZVN6RytIUk14RGMx?=
 =?utf-8?B?QldWWFl0ZlIyNUZJOEMyb3Q3Nys1Q3R6L0ZOUXBnSWpQRUkwbllGNTlDeXBH?=
 =?utf-8?B?RnEvTlJ1ZVN4K1Z3WVFMcEZ1bEx2K3g5MzYvY0lhbEFhdTkxRitjNENsR2pG?=
 =?utf-8?B?dGZQRjJFdHVHeFc3SHJmWENZZ1pwOW5wUk4rclRBME0vengzQk9nZ1NrbzBm?=
 =?utf-8?B?Y0lZeDZyUHMxejZROFA0bXJNRi9JV1Ntcis3NDU3QkorU2lMdXJGZWhiTjAr?=
 =?utf-8?B?WVU4TjZQWkRlVStJQ0YybXZtcWJGQzF3S0d2SmFYNDhtN3JkNzFJWjljQTdj?=
 =?utf-8?B?OXpVcVA5QUtuWjVVZnNaRlRsZW0xMW1SZy9xd0p1TkYvTk51QUphQWNvZU4r?=
 =?utf-8?B?SjVLUFdzYjRqRzJvT0FVSTJCa2lETXNaU2ZUNGNZOUxoWG1VM0lCV2N6UDNX?=
 =?utf-8?B?MGIrS0R6aVFoSHJzazUvdXlzdHVuZnVyaDRtK2NQL0NITzl6eHB6YTdFeFVY?=
 =?utf-8?B?Z2h4THBnVm5wT3ZrQno4Z2Vyeks4UHU3dC9CZm5ENTkyeFZDM1RyUnNvMXJR?=
 =?utf-8?B?c2d1Ui9sMmtCbk1RQVA5YTE0TGhtTUl1b3RCd3VWdG5SV2MxUVNVTzhwUjV1?=
 =?utf-8?B?WWtXQmZDR1dvYmk3VVFSRjRkRnZLbEE3TzMzczZnbVR6by9ONWVoZWRFU1dt?=
 =?utf-8?B?RjF4ZnA0K25aMjBaYkh5QWVvNXptNW5MTlhWbVZscHFkZnVpN3krUi9xWEdM?=
 =?utf-8?B?TUZwcENsM2J0YkxkSUJrenpLcDNHWlA1cVY2ZWdBZUM0NnJOdUhNMm81MThh?=
 =?utf-8?B?eU96VzlpMDRCbnc5YTFDR3lWODNCbnc0c2JJRnJiZ0tvTnZaTjM1NU1ra1Jz?=
 =?utf-8?B?YjJMbFFPWlRtd21sckQ4NDRDUVFwRFdLRFpRdTlFMHFlamtseHloUEdmN3N5?=
 =?utf-8?B?TU1BREJsNG5Lc0xxZ1BMRTdWekNaVURiVGxiV3JBVEZicXc4bVN1bnB2YkF4?=
 =?utf-8?B?azRnckNhZHhqVHg0WTQ4aC83Qlh1NklaUHJSZnd6YnFpQ21mMFZTWjdCQlIx?=
 =?utf-8?B?MUhicWxxWXo0c2JRZTBRWlR3a2traFJjcFl3blhra21jalVVcEt5WGFaOEw2?=
 =?utf-8?B?MEhMS0FkMmkyVXBaRGxkaWNqL2wwYUtuZm80QWtRKzl5VURvZ1VzTjd5SHJT?=
 =?utf-8?B?cnhUVUdRVFNzd2lyNjV0cjJVaEp2c2dOYUNSOVVwMjdlWkZtMnpwTGdJSm1J?=
 =?utf-8?B?d2huQjlWeFhWWFZjdmpYZFRxOWd6V1IyRHp4VWxOdVJNaHlRbDdjaDQyT2hR?=
 =?utf-8?B?dklrbzMvYTRieUs0QkQ4dVpyTjRkUXlaa0R5THhPRUhkdjdRWlY3NTl5cEFa?=
 =?utf-8?B?UGtqTi9XTEMxRjg3YUMwcnNkN1ZWcHdQZzVaeWw3b2oxVmhSYnRHcG5UQjFQ?=
 =?utf-8?B?OVRXNFZEOVRlS3ZGMkFOdmlmUE80SWQwN1NUSjJ5Zlh1OHl6Z2RKcExlYU1m?=
 =?utf-8?B?WTQ3SmxGZDRlWE1PMUFac1FUclJpUmE0TWpWNVd2M1Y3eEJQbDFpeTF3L2s2?=
 =?utf-8?B?d2Irc25ZTGZEN2tES1NQZGhXSUFBcktRWUN4VHpJZWtCeUtvWk0ydXR6WEV3?=
 =?utf-8?B?bkNRcFZVc2FZbDJISWtKRERIOTc2ZmhDUmJMV1FRaFBOOVJsTUlJTWpoa3or?=
 =?utf-8?B?dGFpR0pnV2FPaTRuN2IvQ252b2lXUHVheXNIeWptTHEyOEk1b2REeWx4Tmc1?=
 =?utf-8?B?dTR3MmVPTVExY1pLTGZLdFhoRXFQY3d4WHZYeGwyaCtieDJwZWtTRER6NVVr?=
 =?utf-8?B?VExXRm5OVlpaVURZa2NXQUMzS294VklNeHQyaHhYR092dlo3MEw5bThCZWFW?=
 =?utf-8?B?dStUU3RVK2tsZ1MwVVA1VGM1MmVRQkRUbEZYUDJFRk95aU5CMzNpb05FMHdD?=
 =?utf-8?B?VDJGOHArZlNkQnc3Wlp6c2hSemdzS0tNRWExODFpOEh3Tm5VZzdMYnNXclpJ?=
 =?utf-8?B?bHpMRkxJWWZhKzd2VjVvQ1hybHZpME9HRXRqVDBPbmpib2hwbncyVTJjWUNk?=
 =?utf-8?B?OHpXME5UTHJOczdGQi84dDBiSjFIRC9lanNtcDZSQUhUUWVUN2pNc2E0Vjls?=
 =?utf-8?B?M05OblUvTmpLVjdSbGx1L1luMkdSeW4wbjdSNGxjSlNINUxCN1BDZmdJdWx3?=
 =?utf-8?Q?8fOlPJj+gPFOJ+fHBHIgU0g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9460f40c-2623-4bed-971f-08dc01b78cba
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 23:58:23.5236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1Zv1/wBatb5LgJrMil/NdisfMoQtH/3wyLxXTQf9J+hO9FQA/GAjcddTNmA9qI+pjeikv+VgZq+PV6E8G1WVQCnSI+7G/AO4pV/pUkBH/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6086
X-OriginatorOrg: intel.com
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

On Wed, Dec 20, 2023 at 09:00:34AM +0000, Tvrtko Ursulin wrote:
>
>On 20/12/2023 05:36, Umesh Nerlige Ramappa wrote:
>>On Thu, Dec 14, 2023 at 08:06:46AM +0000, Tvrtko Ursulin wrote:
>>>
>>>On 14/12/2023 01:56, Umesh Nerlige Ramappa wrote:
>>>>On Thu, Dec 07, 2023 at 02:45:47PM +0000, Tvrtko Ursulin wrote:
>>>>>
>>>>>Hi,
>>>>>
>>>>>On 07/12/2023 12:57, Riana Tauro wrote:
>>>>>>GuC provides engine busyness ticks as a 64 bit counter which count
>>>>>>as clock ticks. These counters are maintained in a
>>>>>>shared memory buffer and internally updated on a continuous basis.
>>>>>>
>>>>>>GuC also provides a periodically total active ticks that GT has been
>>>>>>active for. This counter is exposed to the user such that busyness can
>>>>>>be calculated as a percentage using
>>>>>>
>>>>>>busyness % = (engine active ticks/total active ticks) * 100.
>>>>>
>>>>>I think I've asked this before but don't remember it was 
>>>>>clarified - what are the semantics of "active" with total 
>>>>>active ticks? In other words considering activity timelines 
>>>>>like:
>>>>>
>>>>>1)
>>>>>    0          1s
>>>>>rcs0 |xxxxx-----|
>>>>>bcs0 |-----xxxxx|
>>>>>
>>>>>2)
>>>>>    0          1s
>>>>>rcs0 |xxxxx-----|
>>>>>bcs0 |xxxxx-----|
>>>>>
>>>>>Assuming 1s sampling, would the above formula correctly say 
>>>>>50% for both engines in both cases?
>>>>
>>>>Yes. What is the significance of case 2? Are you saying rcs and 
>>>>bcs are executing in parallel?
>>>
>>>In parallel yes. Complete overlap, no overlap, or any overlap of 
>>>activity in between the two.
>>
>>GuC accumulates this on context switches, so the overlap does not matter.
>>
>>>
>>>>Either ways, when total active ticks is queried it would provide 
>>>>the latest value of the active time (does not depend on gt 
>>>>park/unpark since the value is either obtained on demand from 
>>>>GuC or is a value that is frequently updated by GuC.
>>>>
>>>>The duration of context (in to out) is accumulated for the each engine.
>>>
>>>But why is the total *active* tick moving during the 0.5s - 1s 
>>>time of the 2nd diagram though? What does it mean by "active" if 
>>>nothing was active during that period?
>>
>>VF was still using it's allotted time and hence was active.
>
>And if we leave SR-IOV out for a moment?

Then it is just a periodically sampled (by GuC) value of GT ticks. The 
period being 100ms.

>
>"GuC also provides a periodically total active ticks that GT has been 
>active for."
>
>How many time worth of total GT active ticks does GuC report in 
>diagram 2 above?

Every 100ms we would see an updated value. For the duration of 0.5s, it 
would be 500ms. Sampled at 1s, it will be 1000ms. Until 0.5s it should 
be 100% busyness but there is an error margin of 100ms. From then on, 
the busyness % will decrease as time progresses. The error margin is 
more pronounced for very short workloads, so IGTs were changed to use 2s 
batch durations rather than 500ms. Haven't checked if IGTs have been 
posted yet though.

Regards,
Umesh

>
>Regards,
>
>Tvrtko
>
>>
>>Regards,
>>Umesh
>>
>>>
>>>>>I am also curious if there are plans to add support to 
>>>>>intel_gpu_top in which case please copy me on the required 
>>>>>refactorings.
>>>>>
>>>>
>>>>Certainly. It's in the works.
>>>
>>>Cool.
>>>
>>>Regards,
>>>
>>>Tvrtko
