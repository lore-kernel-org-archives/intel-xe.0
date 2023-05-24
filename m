Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941E1C77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 14:05:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4105E10E025;
	Wed, 24 May 2023 14:05:12 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4CE410E05E
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 14:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684937110; x=1716473110;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=blHYJQ6I9Zh0/mG9meWBXXo76K5PljL6fDGtQiMmY4Q=;
 b=i6FV6qSkJ0RycY27ip9Bf+M5RoHYBfc6SQCC+AnV56BhRGd298B3Y0Pn
 Dm6ZZjOpEgyPQoB6tDp0jOHvx/+VZXvtT8I5bJWKT9UwrFej/vw2HJI4U
 CEGOReYTJE/ARiEsU5YJQClJ6GdmfrdniHwrfPhHw7+AzdTE1gBSl+N8g
 cYLBQhJkeBSTObHDwWQWQAGXQL1tDKNY6C7KfIcTb5pRsf7Ywrx0XXvbS
 qHrsEzy9qjnWIjF56potEqM4WfVX9pdNZbCqcHqEXYjANCtSxVj89qfAo
 vnB9tVgL2/P48+6XIT0yefaN0sN4Nd1XS52/5nvRzUBiZNNnDgC0kwbC6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="417030918"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="417030918"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 07:02:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="816610635"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="816610635"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 24 May 2023 07:02:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 07:02:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 24 May 2023 07:02:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 24 May 2023 07:02:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POyGhhNDUD4+GO/npjkOMxOjhHEkl0osucMsCetioUuVdZYtAZSV+AVxaPiLe3QM63c7Nr0BUhH8IoXkVwa0lVcFgY/FSTbzi7dMkko+VPxbuZNqiSTjuhwjJ7REzYO4taBRD7ygOM/LCP8o9hW5oe1aBTLGujaYIOJI8JhWsXNxjjyZ7dWD8J4MJ/rwTQa/IeDMIBOjI7Tyrurw2/JbWIxX2wid/iT02HKTCbvnyfTxiiPkTuDwEi0Lq+/2MDrj4SHkEbrKSpJ6xNokEjqUL4IzBbScQiiLaGrVC9azsxyi18Bk8ewDiTDu47bDSG9rrbMyqTMQL1S8Of36jiFjOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M75nRZbGn+KnAAgLJrprskcPFbOBWM31EBPTvLohSW0=;
 b=LM4A6SUTE04+RMgaEwCWGGMUjkEKjJ61BDxJDAQ/vqwxarOqqbYdIymUMi+Eiq4aH/4Mb16xDNufHtvu1Z8OxMbX8iJRP9JgJO/ubhxPd6mEYKWNYq2WB2PuYGAp5yhUt3wURJtTRba5mbEhgW2R6ESOZKzJL9yIUWxVqLYIt5I/AmX3qMKqWqrfel9ng5CNEryXcH7rCgUF1yHulZ1wPactL76e7naqFtFhcsx88EANewd6xUo7/r3DZB6AyE1X/CTYmAZ4iSzHgnx/iqL2F7IB0TJUHk92+uWHAefUn8ZvtCSQXj8nuEhdOcO/G5YqHxnE4AYOO0XQVX58Ss2yug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB6669.namprd11.prod.outlook.com (2603:10b6:a03:449::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 14:02:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 14:02:34 +0000
Date: Wed, 24 May 2023 14:02:06 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christopher Snowhill <kode54@gmail.com>
Message-ID: <ZG4Y3isjnk2IEEO0@DUT025-TGLU.fm.intel.com>
References: <20230523054404.4011148-1-matthew.brost@intel.com>
 <20230523054404.4011148-9-matthew.brost@intel.com>
 <CA+aRtua3TQh0kh6CaEA=oE1OPrSGXFBUJY2FwXp8MZ+EYasG8Q@mail.gmail.com>
 <CA+aRtuYm7G8F8JhDKQiuKVBKmkYahVGghee+5tDY4ht4pG3jfA@mail.gmail.com>
 <ZGzBvl8NwKQlUzTi@DUT025-TGLU.fm.intel.com>
 <CA+aRtuYyMaSRcAouAx4f_YkD3AB6V2iG+Sg4+ozjfgaA1kDRvQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+aRtuYyMaSRcAouAx4f_YkD3AB6V2iG+Sg4+ozjfgaA1kDRvQ@mail.gmail.com>
X-ClientProxiedBy: BY3PR10CA0021.namprd10.prod.outlook.com
 (2603:10b6:a03:255::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB6669:EE_
X-MS-Office365-Filtering-Correlation-Id: 97f1e9a3-5a4e-4582-d0ec-08db5c5f8598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HZzHdWaHVt9VJU9ZvAvTmBbeVq9QdGp8a3Mp7t85Hxi0juOuLZSjLuxAl66o9adcoJvnZnij5ikn9ZCCX/TTEZpruV5/VbDkISofN38IZzGJGwwrP7FjPJuozg8B/zMefEcI6D5nY4M0VJ9HbXB7+tA+aFMXbaSmV+2htNzwgXCa9B6hCwPEGOmCSSI/XOALxjnoNs5MNLgKJ36+XggdpAq0F6OLxap5FHd2aly8fMnRpXrJByt8a/lOdX01O7fgWgX30ja0xuy/WHOBf2FBUi3p7V/k5Yv7p3TiUIkNCQs5efL/n0sPYcrcLtlxP54bIXi+JLRUnOkwWplmPvD3pH+Ar23DDq3z5TjWor3eBAkmspmZxykTkaYbFovA9jITiTNZBlqC4G85kWlVIvIv+s9zHSABTa4ZFHFL0naw7Ag5wJLINW/dZWgq5o7fAyDVd5mglMQCIpNnRPJm1GYfEGzuviCzeeu7UdAsX9NThYOwcB7haGCDfPkqW4cjL4t71WrvZIGMuVKTaWz2DJyUgl8rnQdqNIkV2McwAJFwUOM8Y6rT/iqrp4tODip3W4Zl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199021)(5660300002)(8676002)(8936002)(186003)(53546011)(30864003)(86362001)(2906002)(83380400001)(44832011)(82960400001)(38100700002)(6512007)(6506007)(26005)(6916009)(4326008)(316002)(66476007)(66556008)(6666004)(66946007)(478600001)(6486002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmFiU002K0pOcFVVY3hyZVk3cWp6TURpekxSUkJaVlQwekVSVktTTm9pVlBn?=
 =?utf-8?B?amt3M3dKdUo3R1hmd1ZHYnlQKysyTVNuSjZQWFRMazRPQWZZeXVDdDlwblFt?=
 =?utf-8?B?ZjZjTm9zN3lSclB2U09mRFk0dGNyNHdNWmxuelFMZlhrVHlSanNaSXBjTVpO?=
 =?utf-8?B?blJ4bHNQbnZYczRTc3h5S0FzQ1ZNU0VNeHF4TjVwVTdKMjFiL1ZhazJFanRw?=
 =?utf-8?B?QjlzR3c0czl1YUU1aHA0QUhzRFpBbFYwN01wdVg2MWFJMTNHZjljV2E4bVBQ?=
 =?utf-8?B?cVhqcnFFVUw0THh4d0czaTZicHhmYW9Qb1lMNVJDajlDUjZRcnZ0ajVMTmE2?=
 =?utf-8?B?V25KOVBQZzJCeWxpNDhrQmNBbTJabldFcmVoSnhhOXJxeEJUb0NlK2tqamRh?=
 =?utf-8?B?UjlnT3AvLy9SeStOaDlRTGRDTkp4ODFrZU5vSTIzWU1FZ3BiaUd6WXlOOXZ6?=
 =?utf-8?B?bmJBY1NpaStaNlJMSExMd3FPVHNFVTFic05pYUE5b0VOZTdSckpDL29zcnlB?=
 =?utf-8?B?ZkVUaUJHdUE2WHdnM0dYbnJGdjdIRjU4ejR1Qm15Tkk2R0ZtdC9qaU11dUgx?=
 =?utf-8?B?b3ltTjlpTUp4dDI1c1I3SHovS21rM2Jld2FUc3lSdUVkM2ZSVlVTVjltWmFs?=
 =?utf-8?B?OFFnVExjMGthWUU3WklSNWxFS0UySTJKb2p3aWdKc1diOEFsN0JINGk4TDJG?=
 =?utf-8?B?UUFyb3VON3krY1BtdEEzQlFsYzFuQ2lYNjNidUF5RldnWTBhRTB6R0JQMTdC?=
 =?utf-8?B?SVpDR0VvU0p4RkRzZkNOY2FWa1FrR2phalZwZU1nVnZ1eHM3RlBwdjlKSjhm?=
 =?utf-8?B?MzdJd2ZJZjlXVFozVS8yQlc4QTY2bzQxZzllUE1vanVCb0YrTWpMTGkyN3B6?=
 =?utf-8?B?d2hUL1EwUUtOWGlxL2l0T0p4RThNSGFwVlU4RHFkcWh1Sy95Rm44QklLcGFG?=
 =?utf-8?B?QVhrQVlUbmxPdnFQTnZYVWpDZGNBUmt1dkRQbm00RUJyNjJBTDRFN3AyWlZj?=
 =?utf-8?B?VURjVjBwOHNhd2tsa3JOZ3NFWWZwQVkwOXRvY0prek5UbGw0ZzMyQXoxZHdu?=
 =?utf-8?B?eFllLzc4Qm5LOHdoUVlIaDQ5cFNwZkpJeWJGZ3FWSDkwOVdISWlmY2hZczhB?=
 =?utf-8?B?Y1dONml0M2w2cjlwa2JEYU52MkRYRkprVm13VEdTOXBISUNTbTh1SDQyZXdl?=
 =?utf-8?B?dlByNVk1TzhuQ3pIT0RRNC9JUXFhTS9VWG9KTWdlc1orZmV5Z1hkQWR3ZTJR?=
 =?utf-8?B?b2FLY2dwS1ZxVjJKOGRiZUdUNGdiR3NYY2RDNTQ0c1QvOFZYOU85SzRPVHNm?=
 =?utf-8?B?cTdYR1pLYVU5blYraURwRFZkeUZDblRGNUE5a3VtckFQUXBiZHVhN2ladVdm?=
 =?utf-8?B?Nm5lQkxJNEtyY1lZWXlTRTQrSHZwWjNMMG1DSXlkUFY2bnAreTJhM2V0V1JC?=
 =?utf-8?B?dWJrcUhLMUQ1QzNyTEpqRFZXdnBVSVVSeFBzOGNHaGVVejI5S2llUCtUUysx?=
 =?utf-8?B?ck1aRXVuMDZ0VytRSVY0YnlvNi9OZHNNVkRiZFRuRUF3b3ZWUlYrRUpsS1lo?=
 =?utf-8?B?b0hDZlJRSG40SmQvUlhVbzE0dm1EdUhhMjh1NzN0TVprYzZYVU5vQ0JUZDVD?=
 =?utf-8?B?UWYyS0ZlY1JWeG9BcklWOGU1cHFLMUFXVmxkc3RyNzRVdlRRZUI1OSt2djQ0?=
 =?utf-8?B?ZDVzUkNHa1lGOVljU1dsdDB0SjBnSm1kVUVuRS9TdHFVanJWSHNjRVFmVmsv?=
 =?utf-8?B?N0JzNEhkcThqTmI1cW5uWkJRRzFHTTZkbk0xSktnejAwS2ZoT25DQnJGYkVa?=
 =?utf-8?B?M2FCd1NwTkw3SXRsV2t5b2w5MGVHKzZraGpLWUt5SkZ6WlZJVXdNZXgwVGVj?=
 =?utf-8?B?S2M5Rmg3WC9UZkxmWW1ramduQVd6b0dIQmdpd243MGhtZm83K2VQdnNhRWVj?=
 =?utf-8?B?SXp5bVdGSVpqQTVabGNpVlBaWjQ0aThYL004QmFNZnpsNWg4Vkg3WEFDbDd0?=
 =?utf-8?B?UFUwUFp4NHo5Q2FvcHlTVXdJTXZ5NUxCR3hSb25WUE4zditHTW5KQmF4dnVS?=
 =?utf-8?B?ZnBxK1R0VEpqeWEwYU9tN2VHTU5wMVBMU1I0WGQ2NGJxME5EU1cxdVk3NytI?=
 =?utf-8?B?Z1pBYkVOT3EvakNUczRCcUxjQnFWSkI4VGFPZ2ZMRTNlVnpLOWUyUlVYOEJr?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f1e9a3-5a4e-4582-d0ec-08db5c5f8598
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 14:02:33.8678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SAwLO7EXwYA0hRAJkW3nCA5gkuIBEzPwdRNBT0ndj/HPyukrvtVc3DgUSHZECDYfV9WAUsK5omhZ4MiD1gBZ3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6669
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 8/8] drm/xe: VM LRU bulk move
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

On Tue, May 23, 2023 at 10:01:53PM -0700, Christopher Snowhill wrote:
> On Tue, May 23, 2023 at 6:38 AM Matthew Brost <matthew.brost@intel.com> wrote:
> >
> > On Mon, May 22, 2023 at 11:52:43PM -0700, Christopher Snowhill wrote:
> > > On Mon, May 22, 2023 at 11:38 PM Christopher Snowhill <kode54@gmail.com> wrote:
> > > >
> > > > On Mon, May 22, 2023 at 10:44 PM Matthew Brost <matthew.brost@intel.com> wrote:
> > > > >
> > > > > Use the TTM LRU bulk move for BOs tied to a VM. Update the bulk moves
> > > > > LRU position on every exec.
> > > > >
> > > > > v2: Bulk move for compute VMs, remove bulk LRU in xe_gem_object_free
> > > > >
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_bo.c       | 24 ++++++++++++++++++++----
> > > > >  drivers/gpu/drm/xe/xe_bo.h       |  4 ++--
> > > > >  drivers/gpu/drm/xe/xe_dma_buf.c  |  2 +-
> > > > >  drivers/gpu/drm/xe/xe_exec.c     |  6 ++++++
> > > > >  drivers/gpu/drm/xe/xe_vm.c       |  4 ++++
> > > > >  drivers/gpu/drm/xe/xe_vm_types.h |  3 +++
> > > > >  6 files changed, 36 insertions(+), 7 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > > > index c82e995df779..22cf65bd63fe 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > > @@ -968,6 +968,16 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
> > > > >
> > > > >  static void xe_gem_object_free(struct drm_gem_object *obj)
> > > > >  {
> > > > > +       struct xe_bo *bo = gem_to_xe_bo(obj);
> > > > > +
> > > > > +       if (bo->vm && !xe_vm_in_fault_mode(bo->vm) && xe_bo_is_user(bo)) {
> > > > > +               struct ww_acquire_ctx ww;
> > > > > +
> > > > > +               xe_bo_lock(bo, &ww, 0, false);
> > > > > +               ttm_bo_set_bulk_move(&bo->ttm, NULL);
> > > > > +               xe_bo_unlock(bo, &ww);
> > > > > +       }
> > > > > +
> > > > >         /* Our BO reference counting scheme works as follows:
> > > > >          *
> > > > >          * The gem object kref is typically used throughout the driver,
> > > > > @@ -1081,8 +1091,8 @@ void xe_bo_free(struct xe_bo *bo)
> > > > >
> > > > >  struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > > > >                                     struct xe_gt *gt, struct dma_resv *resv,
> > > > > -                                   size_t size, enum ttm_bo_type type,
> > > > > -                                   u32 flags)
> > > > > +                                   struct ttm_lru_bulk_move *bulk, size_t size,
> > > > > +                                   enum ttm_bo_type type, u32 flags)
> > > > >  {
> > > > >         struct ttm_operation_ctx ctx = {
> > > > >                 .interruptible = true,
> > > > > @@ -1149,7 +1159,10 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > > > >                 return ERR_PTR(err);
> > > > >
> > > > >         bo->created = true;
> > > > > -       ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> > > > > +       if (bulk)
> > > > > +               ttm_bo_set_bulk_move(&bo->ttm, bulk);
> > > > > +       else
> > > > > +               ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> > > > >
> > > > >         return bo;
> > > > >  }
> > > > > @@ -1219,7 +1232,10 @@ xe_bo_create_locked_range(struct xe_device *xe,
> > > > >                 }
> > > > >         }
> > > > >
> > > > > -       bo = __xe_bo_create_locked(xe, bo, gt, vm ? &vm->resv : NULL, size,
> > > > > +       bo = __xe_bo_create_locked(xe, bo, gt, vm ? &vm->resv : NULL,
> > > > > +                                  vm && !xe_vm_in_fault_mode(vm) &&
> > > > > +                                  flags & XE_BO_CREATE_USER_BIT ?
> > > > > +                                  &vm->lru_bulk_move : NULL, size,
> > > > >                                    type, flags);
> > > > >         if (IS_ERR(bo))
> > > > >                 return bo;
> > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > > > > index 7e111332c35a..f7562012b836 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_bo.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > > > > @@ -81,8 +81,8 @@ void xe_bo_free(struct xe_bo *bo);
> > > > >
> > > > >  struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > > > >                                     struct xe_gt *gt, struct dma_resv *resv,
> > > > > -                                   size_t size, enum ttm_bo_type type,
> > > > > -                                   u32 flags);
> > > > > +                                   struct ttm_lru_bulk_move *bulk, size_t size,
> > > > > +                                   enum ttm_bo_type type, u32 flags);
> > > > >  struct xe_bo *
> > > > >  xe_bo_create_locked_range(struct xe_device *xe,
> > > > >                           struct xe_gt *gt, struct xe_vm *vm,
> > > > > diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> > > > > index 9b252cc782b7..975dee1f770f 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> > > > > @@ -199,7 +199,7 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
> > > > >         int ret;
> > > > >
> > > > >         dma_resv_lock(resv, NULL);
> > > > > -       bo = __xe_bo_create_locked(xe, storage, NULL, resv, dma_buf->size,
> > > > > +       bo = __xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
> > > > >                                    ttm_bo_type_sg, XE_BO_CREATE_SYSTEM_BIT);
> > > > >         if (IS_ERR(bo)) {
> > > > >                 ret = PTR_ERR(bo);
> > > > > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > > > > index ff4df00f20a2..b2dcf34af16b 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > > > @@ -395,6 +395,12 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > > >         xe_sched_job_push(job);
> > > > >         xe_vm_reactivate_rebind(vm);
> > > > >
> > > > > +       if (!err && !xe_vm_no_dma_fences(vm)) {
> > > > > +               spin_lock(&xe->ttm.lru_lock);
> > > > > +               ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> > > > > +               spin_unlock(&xe->ttm.lru_lock);
> > > > > +       }
> > > > > +
> > > > >  err_repin:
> > > > >         if (!xe_vm_no_dma_fences(vm))
> > > > >                 up_read(&vm->userptr.notifier_lock);
> > > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > > > index 0398da1ef1e2..a5d65d0325d6 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > > @@ -629,6 +629,10 @@ static void preempt_rebind_work_func(struct work_struct *w)
> > > > >
> > > > >  #undef retry_required
> > > > >
> > > > > +       spin_lock(&vm->xe->ttm.lru_lock);
> > > > > +       ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> > > > > +       spin_unlock(&vm->xe->ttm.lru_lock);
> > > > > +
> > > > >         /* Point of no return. */
> > > > >         arm_preempt_fences(vm, &preempt_fences);
> > > > >         resume_and_reinstall_preempt_fences(vm);
> > > > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > index fada7896867f..d3e99f22510d 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > @@ -164,6 +164,9 @@ struct xe_vm {
> > > > >         /** Protects @rebind_list and the page-table structures */
> > > > >         struct dma_resv resv;
> > > > >
> > > > > +       /** @lru_bulk_move: Bulk LRU move list for this VM's BOs */
> > > > > +       struct ttm_lru_bulk_move lru_bulk_move;
> > > > > +
> > > > >         u64 size;
> > > > >         struct rb_root vmas;
> > > > >
> > > > > --
> > > > > 2.34.1
> > > >
> > > > Something in this patch version, either moving the cleanup to
> > > > gem_free, or the move_tail later in the patch set, causes kmscube to
> > > > deadlock on terminate, forcing me to reboot the machine. Reboot got
> > > > stuck when it tried to terminate my user session, so I had to press
> > > > the reset button.
> > >
> >
> > Any chance you have a dmesg for the deadlock on terminate? Hoping it
> > gives some clues to the issue.
> >
> > > Verified, substituting patch 8 of 8 from v1 results in cleanly
> > > terminating kmscube.
> >
> > It was Thomas's suggestion to move this from close to free, this is a
> > fairly old patch and couldn't recall why it was in close rather than
> > free. Now I think about this, I believe originally this was in free but
> > moved to close to fix a bug, will try to remind why it needs to be in
> > close.
> >
> > Matt
> 
> It actually goes zombie/defunct on termination. I couldn't backtrace
> it, so I had to wait for the kernel to spew forth a backtrace of its
> own from the hung kworker processes that caused them to be stuck:
> 

This is very helpful, thanks Christopher. I see the problem, we call
xe_bo_put while holding the VM dma-resv which in turn calls
xe_gem_object_free. xe_gem_object_free tries to acquire VM dma-resv and
deadlock.

I think I'll move this to the close function.

Matt

> [  245.565723] INFO: task kworker/14:1:130 blocked for more than 122 seconds.
> [  245.566642]       Tainted: P        W  OE
> 6.3.0-1-drm-xe-next-git-g48a7045a0879-dirty #6
> [  245.567413] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> disables this message.
> [  245.568207] task:kworker/14:1    state:D stack:0     pid:130
> ppid:2      flags:0x00004000
> [  245.568216] Workqueue: events __guc_engine_fini_async [xe]
> [  245.568392] Call Trace:
> [  245.568394]  <TASK>
> [  245.568398]  __schedule+0x443/0x1400
> [  245.568408]  ? check_preempt_curr+0x5e/0x70
> [  245.568415]  ? try_to_wake_up+0x263/0x610
> [  245.568421]  schedule+0x5e/0xd0
> [  245.568426]  schedule_preempt_disabled+0x15/0x30
> [  245.568431]  __ww_mutex_lock.constprop.0+0x539/0x940
> [  245.568439]  ttm_eu_reserve_buffers+0x1f4/0x2f0 [ttm
> bea26c7978113683d7615187c2f4d33b4f3ad4a6]
> [  245.568462]  xe_vm_lock+0xe3/0x110 [xe
> 35c5fcb454ded180c3570d3957d73eb524fe3f0d]
> [  245.568653]  xe_lrc_finish+0x62/0x130 [xe
> 35c5fcb454ded180c3570d3957d73eb524fe3f0d]
> [  245.568827]  xe_engine_fini+0x2f/0x90 [xe
> 35c5fcb454ded180c3570d3957d73eb524fe3f0d]
> [  245.568989]  process_one_work+0x1c4/0x3d0
> [  245.568996]  worker_thread+0x51/0x390
> [  245.569012]  ? __pfx_worker_thread+0x10/0x10
> [  245.569018]  kthread+0xdb/0x110
> [  245.569022]  ? __pfx_kthread+0x10/0x10
> [  245.569026]  ret_from_fork+0x29/0x50
> [  245.569036]  </TASK>
> [  245.569051] INFO: task kworker/14:3:488 blocked for more than 122 seconds.
> [  245.569963]       Tainted: P        W  OE
> 6.3.0-1-drm-xe-next-git-g48a7045a0879-dirty #6
> [  245.570782] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> disables this message.
> [  245.571592] task:kworker/14:3    state:D stack:0     pid:488
> ppid:2      flags:0x00004000
> [  245.571599] Workqueue: events __guc_engine_fini_async [xe]
> [  245.571768] Call Trace:
> [  245.571769]  <TASK>
> [  245.571772]  __schedule+0x443/0x1400
> [  245.571777]  ? load_balance+0x18d/0xe20
> [  245.571785]  schedule+0x5e/0xd0
> [  245.571790]  schedule_preempt_disabled+0x15/0x30
> [  245.571794]  __ww_mutex_lock.constprop.0+0x539/0x940
> [  245.571802]  ttm_eu_reserve_buffers+0x1f4/0x2f0 [ttm
> bea26c7978113683d7615187c2f4d33b4f3ad4a6]
> [  245.571823]  xe_vm_lock+0xe3/0x110 [xe
> 35c5fcb454ded180c3570d3957d73eb524fe3f0d]
> [  245.572012]  xe_lrc_finish+0x62/0x130 [xe
> 35c5fcb454ded180c3570d3957d73eb524fe3f0d]
> [  245.572185]  xe_engine_fini+0x2f/0x90 [xe
> 35c5fcb454ded180c3570d3957d73eb524fe3f0d]
> [  245.572378]  process_one_work+0x1c4/0x3d0
> [  245.572385]  worker_thread+0x51/0x390
> [  245.572391]  ? __pfx_worker_thread+0x10/0x10
> [  245.572396]  kthread+0xdb/0x110
> [  245.572400]  ? __pfx_kthread+0x10/0x10
> [  245.572404]  ret_from_fork+0x29/0x50
> [  245.572412]  </TASK>
> [  245.572552] INFO: task kmscub:traceq0:8581 blocked for more than 122 seconds.
> [  245.573498]       Tainted: P        W  OE
> 6.3.0-1-drm-xe-next-git-g48a7045a0879-dirty #6
> [  245.574336] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> disables this message.
> [  245.575151] task:kmscub:traceq0  state:D stack:0     pid:8581
> ppid:8170   flags:0x00004002
> [  245.575158] Call Trace:
> [  245.575159]  <TASK>
> [  245.575161]  __schedule+0x443/0x1400
> [  245.575167]  ? asm_sysvec_call_function_single+0x1a/0x20
> [  245.575174]  schedule+0x5e/0xd0
> [  245.575179]  schedule_preempt_disabled+0x15/0x30
> [  245.575183]  __ww_mutex_lock.constprop.0+0x539/0x940
> [  245.575191]  ttm_eu_reserve_buffers+0x1f4/0x2f0 [ttm
> bea26c7978113683d7615187c2f4d33b4f3ad4a6]
> [  245.575212]  xe_bo_lock+0xaf/0xe0 [xe
> 35c5fcb454ded180c3570d3957d73eb524fe3f0d]
> [  245.575373]  xe_gem_object_free+0xb4/0x100 [xe
> 35c5fcb454ded180c3570d3957d73eb524fe3f0d]
> [  245.575532]  xe_vma_destroy_late+0xc4/0xf0 [xe
> 35c5fcb454ded180c3570d3957d73eb524fe3f0d]
> [  245.575726]  xe_vm_close_and_put+0x191/0x490 [xe
> 35c5fcb454ded180c3570d3957d73eb524fe3f0d]
> [  245.575913]  ? xa_find+0x92/0x100
> [  245.575921]  xe_file_close+0x196/0x200 [xe
> 35c5fcb454ded180c3570d3957d73eb524fe3f0d]
> [  245.576081]  drm_file_free+0x219/0x270
> [  245.576088]  drm_release_noglobal+0x1f/0x70
> [  245.576093]  __fput+0x86/0x250
> [  245.576099]  task_work_run+0x5a/0x90
> [  245.576104]  do_exit+0x342/0xaf0
> [  245.576109]  ? __futex_unqueue+0x29/0x40
> [  245.576115]  ? futex_unqueue+0x3c/0x60
> [  245.576121]  do_group_exit+0x31/0x80
> [  245.576125]  get_signal+0x9a5/0x9e0
> [  245.576133]  arch_do_signal_or_restart+0x3e/0x270
> [  245.576141]  exit_to_user_mode_prepare+0x185/0x1e0
> [  245.576148]  syscall_exit_to_user_mode+0x1b/0x40
> [  245.576155]  do_syscall_64+0x6c/0x90
> [  245.576161]  ? exc_page_fault+0x7c/0x180
> [  245.576166]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> [  245.576174] RIP: 0033:0x7f8956f44f0e
> [  245.576179] RSP: 002b:00007f892b7fdcb0 EFLAGS: 00000246 ORIG_RAX:
> 00000000000000ca
> [  245.576184] RAX: fffffffffffffe00 RBX: 0000000000000000 RCX: 00007f8956f44f0e
> [  245.576187] RDX: 0000000000000000 RSI: 0000000000000189 RDI: 000055c8c22459c8
> [  245.576190] RBP: 0000000000000000 R08: 0000000000000000 R09: 00000000ffffffff
> [  245.576192] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> [  245.576194] R13: 000055c8c2245978 R14: 0000000000000000 R15: 000055c8c22459c8
> [  245.576201]  </TASK>
