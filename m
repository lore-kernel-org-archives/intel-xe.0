Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A19C77B75
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 05:49:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF7810E0B5;
	Tue, 23 May 2023 05:49:37 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4C310E0B5
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 05:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684820974; x=1716356974;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rABu/WQHG9EgucjKFyiKZfyWya6jGsg7+dwWMc0znSQ=;
 b=GLFDVUH8iclZytNx9JI3QYQb/AqN5xuvoxSkgpGhcnEwruuLtd3ownn6
 UozBGkrydmz5+p8A0ZnkwNRwymAIvmCz7FTdV3t5Tdo6bwMoE8Kdmsmdg
 txf75pyC+TredPgESZ8Z/q1fadYMRu8QR2qUj1cM+nmYlDaF1MleQmYiR
 pWy+h8JWGR5C93M3Iwj83FkaM7lroY1Zp3Lh/iiQ9Mx4Ow0oVh6WBTDpa
 te/WJ3tVg/U1vAsNlC36lGhRN4iCfE8UcL05cO8vfvK0f127X2xPAjHle
 BtOfVtQotexFblR50lip7cklhjCnh25vYG/0P+BpuffwlpaCxqmIlFDx9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="337726172"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="337726172"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 22:49:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="768848599"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="768848599"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 22 May 2023 22:49:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 22:49:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 22:49:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 22 May 2023 22:49:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 22 May 2023 22:49:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePZKFF50KOZK6KJV6WxzLGDY2RvzLzY3NA/jn2nnXXxZ63hTwhgtDuW5JgWtVMwt+lhOx1BgM2JpVxsa7w+gX/LT7FcCa78F67l6oqMEueTT3FXQioqyY83Srv2PXVRkspOj9VP6edMeBaCtQ66oZ8+B1aUNs5M9o7Mh2zBMzYe/WSUxlbljABRAeHpHbS9S/tfhCxCQkNh+uriWCpfGSZjlgNNiyRuXpoMH4laReFofVu7YalJt+n43wlavdot44RtP79i/T3TdqeGCfoWXxMd7BPv5i5HUGl/MXQeDhtVbfhFjnHYS6rGJZshYgLE6vCjgtQyXvCp9CMKLe3mwwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1chzYRrSeEEvA230vFiWIoYXuOLfMw2sB0mwvbHsyzA=;
 b=P4fbgZmwaqI42EBWeoSHjJnNM2oswrL9P+s+teNzRAh0XyrENoPaUBq3DM2SuMqBc6/Cp7/INP/9cJWODpk+2wyUC3LhE5+fDlF/CdzdBjgl3qeEmb9ChM+WGAKIUmY2dEpbgTqfiVhEsjMHsbiqRLHeeviVd64ddeQ88IndE2Xqh+9T131XZiVwakTP6suxXhSU7eHqcjJ1dV6POTnbeCCQjD1WIz2DZurFc/rvep42rc4Fgl4hgNjlSyfkWBKjAd+SrwBZet9u+js7YwhJRtL6UixV9UrNmpQEJW5UBTgwqRYTLZBEIqSwAov3sttp+veyqD4jhDmEdWdC8CUSYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB7153.namprd11.prod.outlook.com (2603:10b6:a03:48d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 05:49:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 05:49:30 +0000
Date: Tue, 23 May 2023 05:49:07 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christopher Snowhill <kode54@gmail.com>
Message-ID: <ZGxT0/L0nMx0guZJ@DUT025-TGLU.fm.intel.com>
References: <20230522015040.3849776-1-matthew.brost@intel.com>
 <20230522015040.3849776-4-matthew.brost@intel.com>
 <CA+aRtuZHM=ncF_E5exeN2QayVv3gX+a-m2xOAgNiX5kP3GBTaA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+aRtuZHM=ncF_E5exeN2QayVv3gX+a-m2xOAgNiX5kP3GBTaA@mail.gmail.com>
X-ClientProxiedBy: BYAPR07CA0090.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: ea849443-cf3b-4028-098c-08db5b5179e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OhtYhFoVo8kokysC5nmrVMJX9+W62gT7pGoD5E/LOVPBtdN81JfXWQ7XjDY5q1IpILL0KhEbd0MyOjZB72W1cpRyCOSiJnuUFnxFAuuK975crN7K+IfQmJr/TnXS5LFJr+rMjPJP5/giwFm57tE2OsDJWRkVY8LlVuCiURldK2A4viDsjsM8oK6sQ6vZqSjtRgO5n/8UNoT0UuWda22vfsF7zAKNSuag9gTA1bovA3mkiEXKfdhyhzy+SFIS7f3DQc2+sJbxiv9ORF9pDglxRnMeGRFut88v8fvD91G0NB9Pj3mYnBzpMKczNJ2oXen3Auct9Nm6skqTufXvL1elO0h1VCIkjOGk1cEodhKz5PQk5bh4AmrTOHzF65Re/7hW5fd5eXTTvqJz06GLXopGAHHkgQEqfJJUEOKhH9EvHsmU6OUSc7AQgeqBHy4FARluNuU2ntvhcorWFEjOSOCrzlH9xbIrv+UWppfMx1BFTfj+FVsbRI62WWauppAubDSQU2wpwA39MpG6WAlDJxIyXeY4EgMrqDJ3a3xdv/aRchfJnKtVPpdokKwgxhfuL0IAKHK2MCHXky456hfMz/jHRAO+b+Qp116fFOEY91CyJSg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199021)(2906002)(30864003)(44832011)(5660300002)(83380400001)(8676002)(8936002)(66556008)(66476007)(66946007)(4326008)(6916009)(66574015)(316002)(41300700001)(478600001)(6486002)(6666004)(6512007)(86362001)(82960400001)(26005)(186003)(6506007)(53546011)(38100700002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T01ScXkvbVppNzlQVHFqZ0I3TVBacWtSS09zMXRmTTV3UXl6VWRuMEFpQzBV?=
 =?utf-8?B?YTBiSkFqekkwcXgwYjFUdXUyMHNqWW5kOUVnU3E4cHdrczhIaXl1WnEwcU5r?=
 =?utf-8?B?N2pCRWt5NTloWWJ5ZkJ1WmlrLzBvYjhiSVp6c0FrYWY4MmdXL2taY0RvWnFG?=
 =?utf-8?B?OVNRWUZQdVFGd3VCc3FNVWNoSC9HNHU1NnRpaEdiU0JPNFRGN3N0L3FLQWZU?=
 =?utf-8?B?Y2l0VXAyanJQeE9OVTd1UkZPOHkxQWxMT3RWdHhmS21LS0tHYlhUOGx3TC9i?=
 =?utf-8?B?a1lFODdvc2pYR2xKaldBYnV4VzhNK3pFRkhlYkE2S0w3cU5sSXFXR3ZzRjJW?=
 =?utf-8?B?Vm9xbnc1cTZWWW5YWDBmK0duV2FGZnoxdDJwMTlWZ3lqVG1STGo5b0lCVEFk?=
 =?utf-8?B?ZVVQNS93YTVxSW02VXBIVXMxK3k5azJnYjR4VXZRN0ZMTWJhVjRvc3RSTStw?=
 =?utf-8?B?TnR5NDc2N2ZrSGVhbGd6TlUxU0Vab3FXczFVNjNDMlY0S3lId3NCaW13VUVt?=
 =?utf-8?B?U1hvS2tNaENpMjA1czJ4dDFQUXBrMWh4QTRSN3ZHWVRwL2R5SFUzNWhHdFlh?=
 =?utf-8?B?SXhKQUhQcEpuQktMMnlmQ2NmQlhlalg0WXNFUWF6dVNMVktKRkcvM0xKaEho?=
 =?utf-8?B?NmxENUNvZXJHamR5V09yM1JBdGRscVliV05COWovRUp5L2ZtZmlRRHlvQnBY?=
 =?utf-8?B?V1B0bFZiL2NrWFhNNDlwclB2V3N2c2QxN3V3Q1FQT1JjSVFwMGd5TkY3QzVX?=
 =?utf-8?B?N1J4VVRld0IxcHdtellCY1FVYTJXWmU3SnFoQ3VNeHVaaFk2aXNXZm9ZU1ZH?=
 =?utf-8?B?cWNkeFhrbG8vSVdGamF2WkI1c0xudk4zYUhlSGhQZ0tqbnd3eXN6STQ4UUpv?=
 =?utf-8?B?NnRNRnU2VDlTNEhXNDlTQVc1UCtVTjVtRENOb1o3SWsvQXl0bkJJRE5zekxj?=
 =?utf-8?B?R21MbFBGMlJ4OHFhSTZicVdtWEg1VGxjVXcyU2Y5Nm1jVStDdDluMERYVDdv?=
 =?utf-8?B?R2dnVXVtcXV6TmJpRytCUW1penU5VkhUcXFoZzI2eXg2aTBvMDlSVWM2M09G?=
 =?utf-8?B?cUhpTDhTRUZneTNWempTa0pPc1BKODgrL3VWcTBEQmlxYjBPNDVnZW5iSVZo?=
 =?utf-8?B?YjhwQ1dBMnNJU29DbGNJeEMvYXlFdmlVd2cxV256eDZmZVFtZHh2WU9ZclFV?=
 =?utf-8?B?cjVWTXlxMXZ5c0VpUzhVRnAxRlZTRE1FQU1HV01VQlhMWEMvZHFsRFhrTURM?=
 =?utf-8?B?RnRGMk5mbDBBRVBiMlVXMG5wWlFtMTJlZlJ5c2VjSFNuSmdnYVNyWTZ4dC92?=
 =?utf-8?B?M0VIQnQwQUxoTGtVSTNuUkVqcEVwUnF6WlcwcDVKNEtMc0l6WG5tVGJXdTU2?=
 =?utf-8?B?bEhUMEtmSlZZaW5NV2JEaWtZdEQ0WElOcmthcGdTcVZaUzdhQTQyMGNjOEtw?=
 =?utf-8?B?bjhtcngxN1NBc0xtZURxMkNGWXBsTzcwTDlVUXFrSGpxK2VrQjRlcjA2Qys4?=
 =?utf-8?B?cjNGbUVGRU02dUdQaDVPcXpycmdVYkNEeUdTMWNvTGpKdFVvTVNYZ09icHhh?=
 =?utf-8?B?Ky82SVdlaEtIY1JpbksvZVNvMys1R1ByWVBjUzMyMDdBMXJpRXFjQ1RCLytj?=
 =?utf-8?B?Zm44M1VHMTgyaWZwRnJnQTRURjZQL0JML3dsRVVHeEd2RzFEaENLdXV3Mnkx?=
 =?utf-8?B?c0tvTTdramRHZUlCSkt3eFhMYjFKYXg1YWhlK1JaTkd1L2l0RTdKYVFrRG9G?=
 =?utf-8?B?cjh1UU4xNTZkeDN0V0RPYzdEbW1mR0pDbWtaL3VTcGtOV2ZnTVFHRnhTOUpN?=
 =?utf-8?B?V2thTUhQWGY0cGV3Qms2bThVZ3E3V3YzWGtrOGdjSW5wS0Ivc20xcmNDWkxZ?=
 =?utf-8?B?dUEyWGo2QzArdWllSlRWTnZSKzhpRzBHY0x1aUxQY25rcXZMUkk3RkhUTE9S?=
 =?utf-8?B?SGVhaEZrdWlkaHI2dVRZSWpzZXJKUEdXUjVEVGhyRlhqNmFibTBOMkliOFE3?=
 =?utf-8?B?M1RPMDhKZC84Q1RsQ09CM1E3QTB3L2RaakJpNldqNEx0RXcxbWJhSndEV1VS?=
 =?utf-8?B?T3dyMmFqb0Z4Y0QrM0ZZSGY0QkdkdEVvWm80OFJFVjU3d3puWU04QS9XZ3Fl?=
 =?utf-8?B?NVpwaEJNOEdtTDhHSEdqUmYvaEZrNCtLVEhpVnpMdUp3MnI0U09MK2xBWDhk?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea849443-cf3b-4028-098c-08db5b5179e1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 05:49:30.1243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MBLnf9FfvcwlMSRK1ezydp3vYuJipNHF7zyp7GzTOim+KMFvZciB2nmHBh/Z3gTlZ3EGZOmUVJRG4QuenFc/wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7153
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/8] drm/sched: Add
 DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
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

On Sun, May 21, 2023 at 10:48:50PM -0700, Christopher Snowhill wrote:
> On Sun, May 21, 2023 at 6:50 PM Matthew Brost <matthew.brost@intel.com> wrote:
> >
> > DRM_SCHED_POLICY_SINGLE_ENTITY creates a 1 to 1 relationship between
> > scheduler and entity. No priorities or run queue used in this mode.
> > Intended for devices with firmware schedulers.
> >
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_entity.c | 40 ++++++++++++---
> >  drivers/gpu/drm/scheduler/sched_fence.c  |  2 +-
> >  drivers/gpu/drm/scheduler/sched_main.c   | 63 +++++++++++++++++++++---
> >  include/drm/gpu_scheduler.h              |  8 +++
> >  4 files changed, 96 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> > index e1838e328de8..90e925804a20 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -83,6 +83,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
> >         memset(entity, 0, sizeof(struct drm_sched_entity));
> >         INIT_LIST_HEAD(&entity->list);
> >         entity->rq = NULL;
> > +       entity->single_sched = NULL;
> >         entity->guilty = guilty;
> >         entity->num_sched_list = num_sched_list;
> >         entity->priority = priority;
> 
> This very important patch segment was omitted here:
> 

Yep, not sure how this happended. I tested this but must have somehow
installed a stale branch. I have fixed this patch in the latest rev.

Matt 

> @@ -91,7 +92,15 @@  int drm_sched_entity_init(struct drm_sched_entity *entity,
>   RB_CLEAR_NODE(&entity->rb_tree_node);
> 
>   if(num_sched_list) {
> - entity->rq = &sched_list[0]->sched_rq[entity->priority];
> + if (sched_list[0]->sched_policy !=
> +    DRM_SCHED_POLICY_SINGLE_ENTITY) {
> + entity->rq = &sched_list[0]->sched_rq[entity->priority];
> + } else {
> + if (num_sched_list != 1 || sched_list[0]->single_entity)
> + return -EINVAL;
> + sched_list[0]->single_entity = entity;
> + entity->single_sched = sched_list[0];
> + }
>   }
> 
>   init_completion(&entity->entity_idle);
> 
> 
> > @@ -124,7 +125,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> >                                     struct drm_gpu_scheduler **sched_list,
> >                                     unsigned int num_sched_list)
> >  {
> > -       WARN_ON(!num_sched_list || !sched_list);
> > +       WARN_ON(!num_sched_list || !sched_list ||
> > +               !!entity->single_sched);
> >
> >         entity->sched_list = sched_list;
> >         entity->num_sched_list = num_sched_list;
> > @@ -215,13 +217,15 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
> >  {
> >         struct drm_sched_job *job;
> >         struct dma_fence *prev;
> > +       bool single_entity = !!entity->single_sched;
> >
> > -       if (!entity->rq)
> > +       if (!entity->rq && !single_entity)
> >                 return;
> >
> >         spin_lock(&entity->rq_lock);
> >         entity->stopped = true;
> > -       drm_sched_rq_remove_entity(entity->rq, entity);
> > +       if (!single_entity)
> > +               drm_sched_rq_remove_entity(entity->rq, entity);
> >         spin_unlock(&entity->rq_lock);
> >
> >         /* Make sure this entity is not used by the scheduler at the moment */
> > @@ -243,6 +247,20 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
> >         dma_fence_put(prev);
> >  }
> >
> > +/**
> > + * drm_sched_entity_to_scheduler - Schedule entity to GPU scheduler
> > + * @entity: scheduler entity
> > + *
> > + * Returns GPU scheduler for the entity
> > + */
> > +struct drm_gpu_scheduler *
> > +drm_sched_entity_to_scheduler(struct drm_sched_entity *entity)
> > +{
> > +       bool single_entity = !!entity->single_sched;
> > +
> > +       return single_entity ? entity->single_sched : entity->rq->sched;
> > +}
> > +
> >  /**
> >   * drm_sched_entity_flush - Flush a context entity
> >   *
> > @@ -260,11 +278,12 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
> >         struct drm_gpu_scheduler *sched;
> >         struct task_struct *last_user;
> >         long ret = timeout;
> > +       bool single_entity = !!entity->single_sched;
> >
> > -       if (!entity->rq)
> > +       if (!entity->rq && !single_entity)
> >                 return 0;
> >
> > -       sched = entity->rq->sched;
> > +       sched = drm_sched_entity_to_scheduler(entity);
> >         /**
> >          * The client will not queue more IBs during this fini, consume existing
> >          * queued IBs or discard them on SIGKILL
> > @@ -357,7 +376,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
> >                 container_of(cb, struct drm_sched_entity, cb);
> >
> >         drm_sched_entity_clear_dep(f, cb);
> > -       drm_sched_wakeup(entity->rq->sched);
> > +       drm_sched_wakeup(drm_sched_entity_to_scheduler(entity));
> >  }
> >
> >  /**
> > @@ -371,6 +390,8 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
> >  void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
> >                                    enum drm_sched_priority priority)
> >  {
> > +       WARN_ON(!!entity->single_sched);
> > +
> >         spin_lock(&entity->rq_lock);
> >         entity->priority = priority;
> >         spin_unlock(&entity->rq_lock);
> > @@ -383,7 +404,7 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
> >   */
> >  static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
> >  {
> > -       struct drm_gpu_scheduler *sched = entity->rq->sched;
> > +       struct drm_gpu_scheduler *sched = drm_sched_entity_to_scheduler(entity);
> >         struct dma_fence *fence = entity->dependency;
> >         struct drm_sched_fence *s_fence;
> >
> > @@ -476,7 +497,8 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> >          * Update the entity's location in the min heap according to
> >          * the timestamp of the next job, if any.
> >          */
> > -       if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO) {
> > +       if (drm_sched_entity_to_scheduler(entity)->sched_policy ==
> > +           DRM_SCHED_POLICY_FIFO) {
> >                 struct drm_sched_job *next;
> >
> >                 next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> > @@ -499,6 +521,8 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
> >         struct drm_gpu_scheduler *sched;
> >         struct drm_sched_rq *rq;
> >
> > +       WARN_ON(!!entity->single_sched);
> > +
> >         /* single possible engine and already selected */
> >         if (!entity->sched_list)
> >                 return;
> > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> > index ef120475e7c6..b3b0472dc202 100644
> > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > @@ -215,7 +215,7 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
> >  {
> >         unsigned seq;
> >
> > -       fence->sched = entity->rq->sched;
> > +       fence->sched = drm_sched_entity_to_scheduler(entity);
> >         seq = atomic_inc_return(&entity->fence_seq);
> >         dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
> >                        &fence->lock, entity->fence_context, seq);
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index ead122e99d00..d9efa0bd69c8 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -32,7 +32,8 @@
> >   * backend operations to the scheduler like submitting a job to hardware run queue,
> >   * returning the dependencies of a job etc.
> >   *
> > - * The organisation of the scheduler is the following:
> > + * The organisation of the scheduler is the following for scheduling policies
> > + * DRM_SCHED_POLICY_RR and DRM_SCHED_POLICY_FIFO:
> >   *
> >   * 1. Each hw run queue has one scheduler
> >   * 2. Each scheduler has multiple run queues with different priorities
> > @@ -41,7 +42,22 @@
> >   * 4. Entities themselves maintain a queue of jobs that will be scheduled on
> >   *    the hardware.
> >   *
> > - * The jobs in a entity are always scheduled in the order that they were pushed.
> > + * The organisation of the scheduler is the following for scheduling policy
> > + * DRM_SCHED_POLICY_SINGLE_ENTITY:
> > + *
> > + * 1. One to one relationship between scheduler and entity
> > + * 2. No priorities implemented per scheduler (single job queue)
> > + * 3. No run queues in scheduler rather jobs are directly dequeued from entity
> > + * 4. The entity maintains a queue of jobs that will be scheduled on the
> > + * hardware
> > + *
> > + * The jobs in a entity are always scheduled in the order that they were pushed
> > + * regardless of scheduling policy.
> > + *
> > + * A policy of DRM_SCHED_POLICY_RR or DRM_SCHED_POLICY_FIFO is expected to used
> > + * when the KMD is scheduling directly on the hardware while a scheduling policy
> > + * of DRM_SCHED_POLICY_SINGLE_ENTITY is expected to be used when there is a
> > + * firmare scheduler.
> >   *
> >   * Note that once a job was taken from the entities queue and pushed to the
> >   * hardware, i.e. the pending queue, the entity must not be referenced anymore
> > @@ -96,6 +112,8 @@ static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *enti
> >
> >  void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
> >  {
> > +       WARN_ON(!!entity->single_sched);
> > +
> >         /*
> >          * Both locks need to be grabbed, one to protect from entity->rq change
> >          * for entity from within concurrent drm_sched_entity_select_rq and the
> > @@ -126,6 +144,8 @@ void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
> >  static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
> >                               struct drm_sched_rq *rq)
> >  {
> > +       WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
> > +
> >         spin_lock_init(&rq->lock);
> >         INIT_LIST_HEAD(&rq->entities);
> >         rq->rb_tree_root = RB_ROOT_CACHED;
> > @@ -144,6 +164,8 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
> >  void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
> >                              struct drm_sched_entity *entity)
> >  {
> > +       WARN_ON(!!entity->single_sched);
> > +
> >         if (!list_empty(&entity->list))
> >                 return;
> >
> > @@ -166,6 +188,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
> >  void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> >                                 struct drm_sched_entity *entity)
> >  {
> > +       WARN_ON(!!entity->single_sched);
> > +
> >         if (list_empty(&entity->list))
> >                 return;
> >
> > @@ -696,7 +720,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
> >                        struct drm_sched_entity *entity,
> >                        void *owner)
> >  {
> > -       if (!entity->rq)
> > +       if (!entity->rq && !entity->single_sched)
> >                 return -ENOENT;
> >
> >         job->entity = entity;
> > @@ -729,13 +753,16 @@ void drm_sched_job_arm(struct drm_sched_job *job)
> >  {
> >         struct drm_gpu_scheduler *sched;
> >         struct drm_sched_entity *entity = job->entity;
> > +       bool single_entity = !!entity->single_sched;
> >
> >         BUG_ON(!entity);
> > -       drm_sched_entity_select_rq(entity);
> > -       sched = entity->rq->sched;
> > +       if (!single_entity)
> > +               drm_sched_entity_select_rq(entity);
> > +       sched = drm_sched_entity_to_scheduler(entity);
> >
> >         job->sched = sched;
> > -       job->s_priority = entity->rq - sched->sched_rq;
> > +       if (!single_entity)
> > +               job->s_priority = entity->rq - sched->sched_rq;
> >         job->id = atomic64_inc_return(&sched->job_id_count);
> >
> >         drm_sched_fence_init(job->s_fence, job->entity);
> > @@ -959,6 +986,13 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> >         if (!drm_sched_ready(sched))
> >                 return NULL;
> >
> > +       if (sched->single_entity) {
> > +               if (drm_sched_entity_is_ready(sched->single_entity))
> > +                       return sched->single_entity;
> > +
> > +               return NULL;
> > +       }
> > +
> >         /* Kernel run queue has higher priority than normal run queue*/
> >         for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> >                 entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> > @@ -1206,6 +1240,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >                 return -EINVAL;
> >
> >         sched->ops = ops;
> > +       sched->single_entity = NULL;
> >         sched->hw_submission_limit = hw_submission;
> >         sched->name = name;
> >         sched->run_wq = run_wq ? : system_wq;
> > @@ -1218,7 +1253,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >                 sched->sched_policy = default_drm_sched_policy;
> >         else
> >                 sched->sched_policy = sched_policy;
> > -       for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
> > +       for (i = DRM_SCHED_PRIORITY_MIN; sched_policy !=
> > +            DRM_SCHED_POLICY_SINGLE_ENTITY && i < DRM_SCHED_PRIORITY_COUNT;
> > +            i++)
> >                 drm_sched_rq_init(sched, &sched->sched_rq[i]);
> >
> >         init_waitqueue_head(&sched->job_scheduled);
> > @@ -1251,7 +1288,15 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
> >
> >         drm_sched_run_wq_stop(sched);
> >
> > -       for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> > +       if (sched->single_entity) {
> > +               spin_lock(&sched->single_entity->rq_lock);
> > +               sched->single_entity->stopped = true;
> > +               spin_unlock(&sched->single_entity->rq_lock);
> > +       }
> > +
> > +       for (i = DRM_SCHED_PRIORITY_COUNT - 1; sched->sched_policy !=
> > +            DRM_SCHED_POLICY_SINGLE_ENTITY && i >= DRM_SCHED_PRIORITY_MIN;
> > +            i--) {
> >                 struct drm_sched_rq *rq = &sched->sched_rq[i];
> >
> >                 if (!rq)
> > @@ -1295,6 +1340,8 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
> >         struct drm_sched_entity *entity;
> >         struct drm_gpu_scheduler *sched = bad->sched;
> >
> > +       WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
> > +
> >         /* don't change @bad's karma if it's from KERNEL RQ,
> >          * because sometimes GPU hang would cause kernel jobs (like VM updating jobs)
> >          * corrupt but keep in mind that kernel jobs always considered good.
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 929d0d567a0b..1a26f501a400 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -79,6 +79,7 @@ enum drm_sched_policy {
> >         DRM_SCHED_POLICY_DEFAULT,
> >         DRM_SCHED_POLICY_RR,
> >         DRM_SCHED_POLICY_FIFO,
> > +       DRM_SCHED_POLICY_SINGLE_ENTITY,
> >         DRM_SCHED_POLICY_COUNT,
> >  };
> >
> > @@ -112,6 +113,9 @@ struct drm_sched_entity {
> >          */
> >         struct drm_sched_rq             *rq;
> >
> > +       /** @single_sched: Single scheduler */
> > +       struct drm_gpu_scheduler        *single_sched;
> > +
> >         /**
> >          * @sched_list:
> >          *
> > @@ -496,6 +500,7 @@ struct drm_sched_backend_ops {
> >   * struct drm_gpu_scheduler - scheduler instance-specific data
> >   *
> >   * @ops: backend operations provided by the driver.
> > + * @single_entity: Single entity for the scheduler
> >   * @hw_submission_limit: the max size of the hardware queue.
> >   * @timeout: the time after which a job is removed from the scheduler.
> >   * @name: name of the ring for which this scheduler is being used.
> > @@ -527,6 +532,7 @@ struct drm_sched_backend_ops {
> >   */
> >  struct drm_gpu_scheduler {
> >         const struct drm_sched_backend_ops      *ops;
> > +       struct drm_sched_entity         *single_entity;
> >         uint32_t                        hw_submission_limit;
> >         long                            timeout;
> >         const char                      *name;
> > @@ -612,6 +618,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
> >                           struct drm_gpu_scheduler **sched_list,
> >                           unsigned int num_sched_list,
> >                           atomic_t *guilty);
> > +struct drm_gpu_scheduler *
> > +drm_sched_entity_to_scheduler(struct drm_sched_entity *entity);
> >  long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout);
> >  void drm_sched_entity_fini(struct drm_sched_entity *entity);
> >  void drm_sched_entity_destroy(struct drm_sched_entity *entity);
> > --
> > 2.34.1
> >
