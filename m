Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC538C77B75
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 13:38:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842BD10E441;
	Tue, 23 May 2023 13:38:40 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5FD10E441
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 13:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684849118; x=1716385118;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3sjDn5XznOvxrzM0MNRm8VveoTTv+wiHebXjE8Jumjo=;
 b=VOVfuQL9lSO5W/hixCq7Q8y18YTOqkNCkjRXiG7SOAKIniP3s/1+DAQK
 hDkGmMoUkWmNTacBgUtksPQtqwtnW9JG14wS72ut6aQobtUzAlRPVAqjT
 vrCdFxUckYFypbh7qjfl5haFNQGjgyb10QFwF4NOTvrYT7TQzm4IqKi/Z
 SBqrxX28kBdWcUnFvJ2ZUrQMK3KNzsWYv5qpVHCxeQTej+Jlkbf1dZIvl
 ajJGWWRuHJyDnbjVUTUuAV9bNuXmoCXALMLs0yZ7LuEIAwmHqWjRFXr2f
 AltuSWrvbZiD2bao1LfDvdtrZ6LBwbqhLP1Qsiw2w5fUfkXGqRrkNfRdc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="416696789"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; d="scan'208";a="416696789"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 06:38:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="654371062"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; d="scan'208";a="654371062"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 23 May 2023 06:38:35 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 23 May 2023 06:38:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 23 May 2023 06:38:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 23 May 2023 06:38:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1whxCsMvfkvmY2d/7nFET47q5S4ix0npeq1+09tOgWPSgrk7Dp0pcstuOJoPXegMOaunJ3c4YvDnSqBQ8smX6VhGvZWWdIkVuOkb8ek7iwHrCQsMdbN2gUbm2HpyKwG2s9QcEJEuLKSA9bIOtDMnXVlBLDMTQjC+Tp7MKh7Zm4hiu7PnVyCADBivFiJP/BcedJ/6o5c1OHTNjW9k1AGoty3ZRnpZoTS7Azzwb+fdNseT2HoshpZKM1fMj9oN5rLuLRm5nistUBSf4RmlNUzuRlH26xtvCujjrRBWi/bjb2TCqI6CnMkqG5O5qY3QEgxXd9RHRHS4HkQc3ET4BwDWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohHuIYvdutyKFZ8qZgpykgswuOlqep0RjF+5ISmxYGg=;
 b=bSgiBzu33xJ9uWqbd+UmgumTdOzuhrpKDX4gitatq+XN6pYAtuzVQc/OaLFIwBkw8KI+kfTaPGp8ZRAKfZ2Uc4pdfLA53tSRQP9fQLwpPyA14InD7VqsBy16tREv0UFtuFjst+NLdpf6V1GAkGYH5N2aDuO5rOVAwn0pxy9EE+owqlzOg9oyIQVq6KntyonyHfhDIvepq8tu+EEk+Eh/aEGB3VosTTpMvaRUdz9TR1X0sbVzAmvbKKV96xipEFyLIFea9C0he/OmJ28o6CZmTUgVOzNcHmP8b/209ACBOfachyjPJr7tvAjPlQwt+QyIRkyYB9KBSzbWa4yDjAfNUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7340.namprd11.prod.outlook.com (2603:10b6:930:84::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.27; Tue, 23 May
 2023 13:38:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 13:38:31 +0000
Date: Tue, 23 May 2023 13:38:06 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christopher Snowhill <kode54@gmail.com>
Message-ID: <ZGzBvl8NwKQlUzTi@DUT025-TGLU.fm.intel.com>
References: <20230523054404.4011148-1-matthew.brost@intel.com>
 <20230523054404.4011148-9-matthew.brost@intel.com>
 <CA+aRtua3TQh0kh6CaEA=oE1OPrSGXFBUJY2FwXp8MZ+EYasG8Q@mail.gmail.com>
 <CA+aRtuYm7G8F8JhDKQiuKVBKmkYahVGghee+5tDY4ht4pG3jfA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+aRtuYm7G8F8JhDKQiuKVBKmkYahVGghee+5tDY4ht4pG3jfA@mail.gmail.com>
X-ClientProxiedBy: BY3PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:217::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d9b7b43-c58c-4a8b-22df-08db5b92ff29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /26ZxF/uy9xKBbfow210Uef31tRbmoGJE9Dh0BdFQs1P4LHtR0bFhJPua8H9fXUhJ3HBQxtdgK/vsKHNVjyGJM0UB2sCmVLJdfSmGDTTa82sSrThQEBcphygzgyLaAMQTZ7tD3dXjvDFj9bEsI6KKZmbSS6pE9J+BgNbZzK/kMBR6U3WNy/wOth/8kkuy4BUMQfR5ej2arnAYre65DpmsPpn/jZ2ndkzOuwLTVk3gplTTTXqV0gG5o/B1of/GWPk3SdRn5v+5ffQvt/LIXCWEOFTjpyaV60F1Wq145c/7lmGW24RZlQr1OmCIw2aPrfh29EjqnTspuJ2gME71Efx46nBFR4FnBzdzGu56N+Qp9PPJoc4+TkkJedTcQf+W+3imjdhfVZ+OxOtLmLCIvbgfGhZuKfuVVPHcdSg7/kNDI35yP2t/99d9fZDsHXJ+W8xST1E7DQWxWUXA6yIxIWUFoZ84KEUksbxIdUWLOdYMnm+fMauVt6eN4oBOjA0FqhJ6A1saKB1F0qK2V4oWRPIyxMUMZ/BB6mrRgW2OIEln63B4bYgQ6xQaj8+uFMoqAIy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199021)(8936002)(5660300002)(8676002)(83380400001)(2906002)(186003)(82960400001)(38100700002)(86362001)(44832011)(6512007)(6506007)(26005)(53546011)(316002)(6916009)(66476007)(4326008)(6666004)(66556008)(478600001)(6486002)(66946007)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHdXdnFVMktSMDBVZWlUQU8vR0JZR2NxN3IwL2JVMTVXell2U0lwRi9IU1dX?=
 =?utf-8?B?djRWeTFmRXdQdFRTbHpTbUR5bU9tTFlQMmdXcHNHWW52UENONGZ2S0RnNlF5?=
 =?utf-8?B?UDBFcjd6R1RZenpqZnA0OVlrTjZzUlNKeFNpTVUyUzBOWE9JTTNnMHJvTzMr?=
 =?utf-8?B?enBNN0xXTkVwWFhtYlVjcWUvM2RjYUtOaEZ2S2F5RE9XSmxVcVdXa3N6eUY4?=
 =?utf-8?B?NEQyWUp4eUt1czN5ei8zcXpFQWhtdEVmV2pZbnM4NWlvR2Y2Z29BS3dqZkFh?=
 =?utf-8?B?bzdXbGZoVEx4MlVYeTVqVzg3cXZ2bTNuRHI5Q1BiM0RITDQ4MTBjSkNsZFBs?=
 =?utf-8?B?TmJuMHg3MnRXN2dNNS9wd29FSnNsRFFNbVdUWjVtZkpsNjVJVGxad0ZXU1FY?=
 =?utf-8?B?U0hkRHNFZitKRXpjdzJhcXNnam9tdkpLbVRwdURkTUQySWd6QUF4UXEzdit6?=
 =?utf-8?B?RnlCV2lMU0pRMlgxOVo1Z1JiZGdzMkMzZFE5WUlYUjBoOVRlZTNTK2FjQmc0?=
 =?utf-8?B?M0YybEdYdnZ1dVRka2RTaXFtTHgyZENDS01hWlVWTGVGQVVTTlVRclN6WllM?=
 =?utf-8?B?c1NzWWEvQ0tCcUNNeW1VTlkyYTZBQVdVTEo2K3hubDVzelhIU0pGK05BVUJi?=
 =?utf-8?B?VVVDNEtrUjlLQktxNi9ZK2RISm92S1dKN2lWQm12OFdMYUEzbi9jakJrOGla?=
 =?utf-8?B?MzF4Q3NjOGRZRnRjSTNZVSs0T0VzYXNITzk2VGhaL2w2bmVEcTQyWUtVV1Jt?=
 =?utf-8?B?WnVPR25oMXFiYlY5d0ZTTk5EcnZuUG5rbWw1R1FKQko4NE0vRkZhaWNURUYx?=
 =?utf-8?B?M09EczZoVVlMZmR5a2JqaWFNeGRhdThicUc1RkJjdkpLZDUwUThwZUtDSm01?=
 =?utf-8?B?ZjV5UDZWcGtNamZSUGhBd3hUdEV2Ym5samlURVVRTm5zVm5HWURINUxxbjBB?=
 =?utf-8?B?UElXdjlmKzRmTGJSeGNad1lGelhYRE13L1lpM3RxdFFZbTRLMVNKK1N4NlRR?=
 =?utf-8?B?VktYRlVnWG9hS3VBNG1YMXVDdmJ0VS8vVGdJb0tHUENQMTZQcTgxUkdVTUhM?=
 =?utf-8?B?WUc2cWszeUxmWCtEN3ppTEV4SVBoeWNCS0FrUU56Smt3Qy9DVHkzaGNGMTRi?=
 =?utf-8?B?c1pnT05FeGFORE02NEo3aEcwcFlxcVFMYm5nUFcvRitiWVFhQVAwSkFNdzlX?=
 =?utf-8?B?OW9sQjJwbmFJazU2RXZzT0hnUTBTTmU0VDJzcjVwWkwrVUpPZTZVM1J2TElB?=
 =?utf-8?B?bWNDaVlkMEdScVNhNG9Sdkg4SldUR0syMm5sZXEzNmtPNStqQUZBQjhRRXNn?=
 =?utf-8?B?V3I0U0xHSHVVVTQ3ZVJiNll0NWozSmZyMitIQWltdnN3eWpUSmFhS3NDZkIv?=
 =?utf-8?B?NmNsY3dzeGM3UGNzL1ViMmR5VFRuZlZ1Z2lzSjBIdm00UlJtS1AzR1BiekF5?=
 =?utf-8?B?MzVVOVdLQUFKTGoyNy84YjhhYis1OTdvZ0xYdUpjVjZ2TGhvM3k4cmJpTXhy?=
 =?utf-8?B?SjFNSnB6Ri91cDRRTHV6UXRwVEUwdlVVMHc4Wk9IdktKd092SGpKZFN1cUs2?=
 =?utf-8?B?OFRQZjVMTWZ1d0h0UFhrU3g5YThvUVBnNFpKcm9rR1NCYnpxa281SEpaNWV6?=
 =?utf-8?B?dmp3dWdjbFJxQlRvcUc1L00wWS9OTkpTbTFYYWpLUHJQTThiT0lWM0lsVVhr?=
 =?utf-8?B?VXZZNzgrUEtscHFBay91ZmdaZUZPT0dSSkIzZndTV3g2a2hrc2hSa29vekd5?=
 =?utf-8?B?Q1FiL1k2d3NCajFQaE1XODVhRzRGN1N4bWlMbDVsS01oem52Tk1kdVhtdEJh?=
 =?utf-8?B?OWY0OHR1UHFkQTk0NElhaHk0YXFEeEhVbjBEcDdwWTZzMXFSL04zSGlqY1lN?=
 =?utf-8?B?S05wdkU2d1NDU08xSWQ0QW1haFpKZmpaVUdIbTRZRTVtVnIyQ096V0FqbzJh?=
 =?utf-8?B?T0VFWEZhMlNZekhteEJlYUQ3elp5VGF2ZE00dGN6YjZpbXJGeE5vL1J1WUh6?=
 =?utf-8?B?NDJydFBNbHBIbUlnUFBlMVBnQmpmLzhERk5UclJya0hPZTgxdEhOMStDQW9F?=
 =?utf-8?B?K042VlFHNllFTEcvb0dtQURBVlQvN0J3dHoxcmJZY3pzWS81R2l6UW54MGlC?=
 =?utf-8?B?Q1VWQVRKdS9adTNUOUFoeVc5T3pQTEJELzBiVFpRczJOU1o4N1pyZVdoWEVu?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d9b7b43-c58c-4a8b-22df-08db5b92ff29
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 13:38:31.0172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1FissmOYP+yRBg9nwIbkNHCAyy722iE3DY8zCCsei6tfshymKTlAfiTkSw5z5P5KUQeXi3fqXesSpz2vT2Q+Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7340
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

On Mon, May 22, 2023 at 11:52:43PM -0700, Christopher Snowhill wrote:
> On Mon, May 22, 2023 at 11:38 PM Christopher Snowhill <kode54@gmail.com> wrote:
> >
> > On Mon, May 22, 2023 at 10:44 PM Matthew Brost <matthew.brost@intel.com> wrote:
> > >
> > > Use the TTM LRU bulk move for BOs tied to a VM. Update the bulk moves
> > > LRU position on every exec.
> > >
> > > v2: Bulk move for compute VMs, remove bulk LRU in xe_gem_object_free
> > >
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_bo.c       | 24 ++++++++++++++++++++----
> > >  drivers/gpu/drm/xe/xe_bo.h       |  4 ++--
> > >  drivers/gpu/drm/xe/xe_dma_buf.c  |  2 +-
> > >  drivers/gpu/drm/xe/xe_exec.c     |  6 ++++++
> > >  drivers/gpu/drm/xe/xe_vm.c       |  4 ++++
> > >  drivers/gpu/drm/xe/xe_vm_types.h |  3 +++
> > >  6 files changed, 36 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index c82e995df779..22cf65bd63fe 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -968,6 +968,16 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
> > >
> > >  static void xe_gem_object_free(struct drm_gem_object *obj)
> > >  {
> > > +       struct xe_bo *bo = gem_to_xe_bo(obj);
> > > +
> > > +       if (bo->vm && !xe_vm_in_fault_mode(bo->vm) && xe_bo_is_user(bo)) {
> > > +               struct ww_acquire_ctx ww;
> > > +
> > > +               xe_bo_lock(bo, &ww, 0, false);
> > > +               ttm_bo_set_bulk_move(&bo->ttm, NULL);
> > > +               xe_bo_unlock(bo, &ww);
> > > +       }
> > > +
> > >         /* Our BO reference counting scheme works as follows:
> > >          *
> > >          * The gem object kref is typically used throughout the driver,
> > > @@ -1081,8 +1091,8 @@ void xe_bo_free(struct xe_bo *bo)
> > >
> > >  struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > >                                     struct xe_gt *gt, struct dma_resv *resv,
> > > -                                   size_t size, enum ttm_bo_type type,
> > > -                                   u32 flags)
> > > +                                   struct ttm_lru_bulk_move *bulk, size_t size,
> > > +                                   enum ttm_bo_type type, u32 flags)
> > >  {
> > >         struct ttm_operation_ctx ctx = {
> > >                 .interruptible = true,
> > > @@ -1149,7 +1159,10 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > >                 return ERR_PTR(err);
> > >
> > >         bo->created = true;
> > > -       ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> > > +       if (bulk)
> > > +               ttm_bo_set_bulk_move(&bo->ttm, bulk);
> > > +       else
> > > +               ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> > >
> > >         return bo;
> > >  }
> > > @@ -1219,7 +1232,10 @@ xe_bo_create_locked_range(struct xe_device *xe,
> > >                 }
> > >         }
> > >
> > > -       bo = __xe_bo_create_locked(xe, bo, gt, vm ? &vm->resv : NULL, size,
> > > +       bo = __xe_bo_create_locked(xe, bo, gt, vm ? &vm->resv : NULL,
> > > +                                  vm && !xe_vm_in_fault_mode(vm) &&
> > > +                                  flags & XE_BO_CREATE_USER_BIT ?
> > > +                                  &vm->lru_bulk_move : NULL, size,
> > >                                    type, flags);
> > >         if (IS_ERR(bo))
> > >                 return bo;
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > > index 7e111332c35a..f7562012b836 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.h
> > > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > > @@ -81,8 +81,8 @@ void xe_bo_free(struct xe_bo *bo);
> > >
> > >  struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > >                                     struct xe_gt *gt, struct dma_resv *resv,
> > > -                                   size_t size, enum ttm_bo_type type,
> > > -                                   u32 flags);
> > > +                                   struct ttm_lru_bulk_move *bulk, size_t size,
> > > +                                   enum ttm_bo_type type, u32 flags);
> > >  struct xe_bo *
> > >  xe_bo_create_locked_range(struct xe_device *xe,
> > >                           struct xe_gt *gt, struct xe_vm *vm,
> > > diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> > > index 9b252cc782b7..975dee1f770f 100644
> > > --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> > > +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> > > @@ -199,7 +199,7 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
> > >         int ret;
> > >
> > >         dma_resv_lock(resv, NULL);
> > > -       bo = __xe_bo_create_locked(xe, storage, NULL, resv, dma_buf->size,
> > > +       bo = __xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
> > >                                    ttm_bo_type_sg, XE_BO_CREATE_SYSTEM_BIT);
> > >         if (IS_ERR(bo)) {
> > >                 ret = PTR_ERR(bo);
> > > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > > index ff4df00f20a2..b2dcf34af16b 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > @@ -395,6 +395,12 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >         xe_sched_job_push(job);
> > >         xe_vm_reactivate_rebind(vm);
> > >
> > > +       if (!err && !xe_vm_no_dma_fences(vm)) {
> > > +               spin_lock(&xe->ttm.lru_lock);
> > > +               ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> > > +               spin_unlock(&xe->ttm.lru_lock);
> > > +       }
> > > +
> > >  err_repin:
> > >         if (!xe_vm_no_dma_fences(vm))
> > >                 up_read(&vm->userptr.notifier_lock);
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 0398da1ef1e2..a5d65d0325d6 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -629,6 +629,10 @@ static void preempt_rebind_work_func(struct work_struct *w)
> > >
> > >  #undef retry_required
> > >
> > > +       spin_lock(&vm->xe->ttm.lru_lock);
> > > +       ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> > > +       spin_unlock(&vm->xe->ttm.lru_lock);
> > > +
> > >         /* Point of no return. */
> > >         arm_preempt_fences(vm, &preempt_fences);
> > >         resume_and_reinstall_preempt_fences(vm);
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index fada7896867f..d3e99f22510d 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -164,6 +164,9 @@ struct xe_vm {
> > >         /** Protects @rebind_list and the page-table structures */
> > >         struct dma_resv resv;
> > >
> > > +       /** @lru_bulk_move: Bulk LRU move list for this VM's BOs */
> > > +       struct ttm_lru_bulk_move lru_bulk_move;
> > > +
> > >         u64 size;
> > >         struct rb_root vmas;
> > >
> > > --
> > > 2.34.1
> >
> > Something in this patch version, either moving the cleanup to
> > gem_free, or the move_tail later in the patch set, causes kmscube to
> > deadlock on terminate, forcing me to reboot the machine. Reboot got
> > stuck when it tried to terminate my user session, so I had to press
> > the reset button.
>

Any chance you have a dmesg for the deadlock on terminate? Hoping it
gives some clues to the issue.

> Verified, substituting patch 8 of 8 from v1 results in cleanly
> terminating kmscube.

It was Thomas's suggestion to move this from close to free, this is a
fairly old patch and couldn't recall why it was in close rather than
free. Now I think about this, I believe originally this was in free but
moved to close to fix a bug, will try to remind why it needs to be in
close.

Matt
