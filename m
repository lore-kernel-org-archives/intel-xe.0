Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E786C7EE23
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 19:31:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3DBE10E148;
	Thu,  8 Jun 2023 19:31:30 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A62210E60D
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 19:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686252688; x=1717788688;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=i1X0nwYzE5ge7V0ZjxcGu2FpgXgedkFXRknpSwt3oAs=;
 b=ErKOnbID4pSfrcc1OJ1obQ7GPyeDGjS19QlPuQyy2SwrJ07zfeZ79/vp
 lEMRwpdqmh+C0TAQq+dRRP63LGfFJWf2lgSaOVK/nf0QMiGW42iX0fdSk
 PmXBgAGDncg0joV1PsBdtzb2x0sB9nAcIteAgHmUixaFE+Wdf+jM6Lbo/
 XgQSgee9KJSzjs/IfTjEuL9BxI2cSyhoAWgjsKkDe7DHNjruH6A4D1iUA
 nUP6+Dln7hmWWjDaTi2w9DhD9mnAgqRNv1UaUA11dnJxUCkeIKbVTZ+hR
 aoapZlLdyoFZQPqDo+1yIAfx06dEFxnEzx/HFRSvEGByIrNG/3horLrrl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="354904202"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="354904202"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 12:31:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="799935583"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="799935583"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2023 12:31:26 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 12:31:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 8 Jun 2023 12:31:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 8 Jun 2023 12:31:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJL3+H6Ft8cdsLQ4wvDe0XorH7thIupD9oEoZizNFTbxfP67XfZnlSp0nJhSOXKVl441libt8wIASvvwO/L0qwjWNIlYWXuChbuowWJNXwJAoxMk6BoKN7ScG3kRN6BqZByV2ksHFlv4YClXv4slnam/li7OylThCJyZZWBLaRRpX+8CJnP629goMtC+uBcpGePnx9iIYA8LrC1JvotKeQasG8p3ApkFkZYrFq5kxVAIx4GFCOdiwl4MukFsq8coKPRLxQXsWRD6zkn53btKr/z3p1xqZf3Cv61Vtuo3qfsdiZLXvUcZUI1kvIYdB5UIHL+XFrq1bNwuzY1PdSmA8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7h3N5aClW7JYjH8bOxbFcIqrFGTckHsLM/py+VCAS6o=;
 b=BOxDBM0EVKuGFxLl8j2ffVyAoZHXcPovf7Xn5BX6v2JlP+4QsKdDPR3r5ouQYzidh45WCYO8O2wH+SvC8GH+a5SsCoA0lU0Mo0vCMCSoln2DGo3SD0nQXHhioElEZgjxZgCgR5DSvAupHzb8FOzfEy3Z3gozguiXn7czP1Tve8SUDoEtNgTdfJEjxqeMzNDvOlQTVgm/q3D54DJb+1BH6bwaSVn68S12hjG2w1jA0KrFoza5No1Udw/0KK3+Y8ghKxC9HC8Leig4m2lVLIIPLcLIno/zh8LvYz7W0XkjG0+dZ55TUfRpC3jJwYIPQ2aTEIFM6j0XPRmhvhh7iI30pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8555.namprd11.prod.outlook.com (2603:10b6:408:1b0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 19:31:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 19:31:24 +0000
Date: Thu, 8 Jun 2023 19:30:54 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Message-ID: <ZIIsbuOPQRFiEHDR@DUT025-TGLU.fm.intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-12-matthew.brost@intel.com>
 <CAFCwf13sC-O_5oEXBDW-i858_cH0+BU1sW67vyDqGr9V_5oOtw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFCwf13sC-O_5oEXBDW-i858_cH0+BU1sW67vyDqGr9V_5oOtw@mail.gmail.com>
X-ClientProxiedBy: SJ0PR13CA0106.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8555:EE_
X-MS-Office365-Filtering-Correlation-Id: f400a30b-cf27-4046-6527-08db6856f250
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AkGb44bwtd2zy1sabzBcssQe2KwJGZADWJB134eNGMYC6HJNGyfVRP5ANw46UbNoPj2CDX1RQ06f119chRCUa+IqNgIWhJWvFfKWFqr6t8S38q9jwhFgj2kDSmVy+qMcyUSik+nvF8Gb4YegFiw5stYVoNK/MAy80OGtWTMQUGxX5NHBqsTIlU7ndseakQiNxnLK3SAXA6deK8Qxns4UwOE+teYKRJu/0qgjaXI+BjCxsSFuYYFJHiby9IbLnkV8Y6MLzN68UtIo7aeKwZ+I/ylAKKlUhSwIozSvXAZbO548rsue10frLvGxCw3Boe92ms3pUM4u7E+Dl1LRm3P6iKNQQzVQSNoHKwnokRY4vZhkDGZ9bG4etm+JfEaYEWWlM9dorwr6WSP4eXgnXcLnc7JDXjPDOLB1LKhFVLYFcDHjIFbg8dELhD+S/xOmb43LnIA/CIA50YTUHp5uQ4vJzI7Xx4x1JjoibvSQgc1AVdNY+ziXGblRIFZUeOHw/lcbJP299MyK1Im1BL0UQiraPibd1FvUfTsOeADRLtizOPUO7miu55Vhrnbu4zb4ZZiaxLYV1MlFuSEyyB+MVYg2TuIyJqyMcUhqHpeSv0jYPOo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199021)(5660300002)(30864003)(2906002)(86362001)(44832011)(66899021)(6666004)(6486002)(83380400001)(53546011)(6512007)(26005)(6506007)(478600001)(6916009)(316002)(66946007)(4326008)(186003)(82960400001)(66476007)(66556008)(38100700002)(8936002)(8676002)(41300700001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qk1uL3JpaHh4NEZJQndWRk1WcGdTbmM2Nm5DMU1iM1ZGTm1COS9vemtYeFJI?=
 =?utf-8?B?MWZlV0xUeFZXWjAxRmhzZUt4bDM2WkNJeHl0NUJwSUFxVDhsWU5EZTZQd0E2?=
 =?utf-8?B?ZmRrSmtiR3hCWVRPankvVHpMdXBZcFZJSWszNTRzRDRZa1BVTGQ2K3p6UkJj?=
 =?utf-8?B?ckhadXU0ZGdGczI2Kys5SzhiZXlrZERtRDR1U0Q5N1lEQVJBaUR0UlBJQWdt?=
 =?utf-8?B?R2lmSXBMaXNkcWRqSzFwRm02bWNHYTBhMnhlRnh3K3BnTWU1c3dldlFwbUZy?=
 =?utf-8?B?cDU1ZHl0Qjc5Z28ySUdmY3FjczRlZEp5T0J6RndyWG5uNWNlM3BRaGY1UlJa?=
 =?utf-8?B?U0hQaEUwWXlPdjduM3paUVE4QnZZNmtOSDdBWGNBN1VaVFRpZkZNWlZQakhu?=
 =?utf-8?B?aUtVaVFyWXQzTys4N3pwUzBQNUVuamVCMElsZG4xVmozTGQ3MTg0Z1FtZmFE?=
 =?utf-8?B?WWxIMzFyRml5aFJBblhCWEduRjdsejBIak8wcUEwV25qdW1mTGovOE9jZ3ZN?=
 =?utf-8?B?ZW5VS3hjUGhEYXJlek5QY0p1VVFyQ1JSWnBaQ0JFNGJBbHlLWlJ0UGkxZzNz?=
 =?utf-8?B?RG13elZta092cW85RWF1R0crWmtOd1cwTW85ektSUHBDUnZISEdQWEthZ0lu?=
 =?utf-8?B?azdHV2p6MkIvSTdMWTlFTUVwVzJ0WTNrdE5PSGFIZlhQcmc0eFZFa0czMFlH?=
 =?utf-8?B?dzZOL0JZZHo5bHFrbHgvMDJhb1JwUWcrVzhsNVJtMVl0K2RlWXY5U0EzOXA0?=
 =?utf-8?B?L1dPYnN1L3ZkU21BYkpMWXdaekhuS2MrN1lQNUpWOEgrNmU5ZnIxaHdZQ2JW?=
 =?utf-8?B?ZC9BZW5CcTROajAySHh4WU5SWlh5aXNLcWw1OFAxSzBxU1pqcUVrUC8wanFz?=
 =?utf-8?B?UTVTejlCMjNNY0ZJTDVQN2RWVGhLTjBHMG91RHp6VDhHd3o2bDZML1gxSWxJ?=
 =?utf-8?B?Q3RvTUMzRGhmMFlDZXB0MlJmSXhWUWQ2dW5JTW1nOE1Held2cjNvYVBwSU40?=
 =?utf-8?B?OCtpeHFkUGlubUJ0aTE5TnZsZ3liWGp1UlluN2RjNExBNlFtUFk2MTBwKzRy?=
 =?utf-8?B?RitlczEyQ09jY3VIa3pyc1NxMWE2SFJaMUpuTGNpY0ZRR0QrRHJxbGVoalhu?=
 =?utf-8?B?VnhDMFZYazVhQmdFc3NIbVVsMVNjTmp5ckpiWnNqL2E0bXR3RWg0MSt4a1RJ?=
 =?utf-8?B?akxyNVVLT3FCeHZxZmtLWjFvekl4QVhBNFE2KzlnQnk0QzJIdExERXpVUlFE?=
 =?utf-8?B?SEF3TFYyVm1zQ1Z5S0F3OW14d1dJeWRvejZUWEpvTW5uOG8reERJQ0dhL2dq?=
 =?utf-8?B?ck8vS2V2M0luWmpKTXNJRU44cnJRY09ESlk1Qi9WY0lza0g3cUxhY21rQkxa?=
 =?utf-8?B?cENkdGI2bHhHdUdNemVEZVYxZmFUZzd3VEhrczJPMVRrdHlTc0hqTHluTThD?=
 =?utf-8?B?dlN4UW9IOGpFMDB2S1Z1cERiTnZQUnpWSldlL0ZCWHhldWNjV0Z3eVRMNVQ2?=
 =?utf-8?B?cjg0ZVRwOU1HbG9KSnl6U0FyR3gyaTJDVU5TWlNjMHM2SUttR0NKUCtEM05I?=
 =?utf-8?B?aWdxZ3lITngzc1NRV1FSdWNMejB4K0wwaWlPcVp0TjRRTW5ZamkyWFhZS1NR?=
 =?utf-8?B?U2diT1h2SnRZc2NvTHQ2SVJOVGJ3ekViSVVqbE5YQ3JLbzhvVCszS00xT2xo?=
 =?utf-8?B?ZmZHMm0wREJRK0l6WnFvZHB3cXNDeS9WYS8rTTdCVjBGNitFaEVHYlArS25t?=
 =?utf-8?B?S2p6QUMwOVhRRzJvTUtjYkNzN2Y3ZWtRM1huMjIxR2ExN2h5Q0t0ekl3Zzda?=
 =?utf-8?B?bzYxSVhGUFpXeUk4RTIvcEx1b1RYQi9lSDdxbjBwdjExWUVRQnU2MEZDUDlS?=
 =?utf-8?B?djE1bWdDeG01a0drVXJFaTJvWWtTN1JZN094MUU5QTY4cHZlV1E5bTQ3Y20x?=
 =?utf-8?B?am1LS2RCWEcrY1ZlZzBEVENYWHA1MytBeE5iMXhaT0xEb3pXenFLY29UMGxt?=
 =?utf-8?B?enhSMzRKVzBmMEcwUTBCeFpBdXlYbVR3WE5PS092S0VwWTh3ZmFPMUpkTmpT?=
 =?utf-8?B?dGNpb2ZpKzJsdStiZFpScHdiMGxMOFZleDlmaC91dDY1UXhWMlFGYXVTbGwy?=
 =?utf-8?B?UngwZWxlNnhiakQrazV1ZmlxV1NQNTRUZW9VaVlsZXp3a2ZDK3U5NG1TZ0pM?=
 =?utf-8?B?bmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f400a30b-cf27-4046-6527-08db6856f250
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 19:31:24.8310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PVy/NY8vVcJX4tqpuKPOgWEV28SXCN2Z9AsL3RszYr5WjuMdRsiyHciXChZI9XKvLdRK1k04ORyxgqeyOfUMfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8555
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 11/31] drm/xe/guc: Use doorbells for
 submission if possible
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
Cc: intel-xe@lists.freedesktop.org,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sun, May 21, 2023 at 03:32:10PM +0300, Oded Gabbay wrote:
> On Sun, May 21, 2023 at 3:18 PM Matthew Brost <matthew.brost@intel.com> wrote:
> >
> > We have 256 doorbells (on most platforms) that we can allocate to bypass
> > using the H2G channel for submission. This will avoid contention on the
> > CT mutex.
> >
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Suggested-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_guc_regs.h    |   1 +
> >  drivers/gpu/drm/xe/xe_guc.c              |   6 +
> >  drivers/gpu/drm/xe/xe_guc_engine_types.h |   7 +
> >  drivers/gpu/drm/xe/xe_guc_submit.c       | 295 ++++++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_guc_submit.h       |   1 +
> >  drivers/gpu/drm/xe/xe_guc_types.h        |   4 +
> >  drivers/gpu/drm/xe/xe_trace.h            |   5 +
> >  7 files changed, 315 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> > index 37e0ac550931..11b117293a62 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> > @@ -109,6 +109,7 @@ struct guc_doorbell_info {
> >
> >  #define DIST_DBS_POPULATED                     XE_REG(0xd08)
> >  #define   DOORBELLS_PER_SQIDI_MASK             REG_GENMASK(23, 16)
> > +#define          DOORBELLS_PER_SQIDI_SHIFT             16
> >  #define   SQIDIS_DOORBELL_EXIST_MASK           REG_GENMASK(15, 0)
> >
> >  #define GUC_BCS_RCS_IER                                XE_REG(0xC550)
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index 89d20faced19..0c87f78a868b 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -297,6 +297,12 @@ int xe_guc_init(struct xe_guc *guc)
> >   */
> >  int xe_guc_init_post_hwconfig(struct xe_guc *guc)
> >  {
> > +       int ret;
> > +
> > +       ret = xe_guc_submit_init_post_hwconfig(guc);
> > +       if (ret)
> > +               return ret;
> > +
> >         return xe_guc_ads_init_post_hwconfig(&guc->ads);
> >  }
> >
> > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_types.h b/drivers/gpu/drm/xe/xe_guc_engine_types.h
> > index 5d83132034a6..420b7f53e649 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_engine_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_engine_types.h
> > @@ -12,6 +12,7 @@
> >  #include <drm/gpu_scheduler.h>
> >
> >  struct dma_fence;
> > +struct xe_bo;
> >  struct xe_engine;
> >
> >  /**
> > @@ -37,6 +38,10 @@ struct xe_guc_engine {
> >         struct work_struct fini_async;
> >         /** @resume_time: time of last resume */
> >         u64 resume_time;
> > +       /** @doorbell_bo: BO for memory doorbell */
> > +       struct xe_bo *doorbell_bo;
> > +       /** @doorbell_offset: MMIO doorbell offset */
> > +       u32 doorbell_offset;
> >         /** @state: GuC specific state for this xe_engine */
> >         atomic_t state;
> >         /** @wqi_head: work queue item tail */
> > @@ -45,6 +50,8 @@ struct xe_guc_engine {
> >         u32 wqi_tail;
> >         /** @id: GuC id for this xe_engine */
> >         u16 id;
> > +       /** @doorbell_id: doorbell id */
> > +       u16 doorbell_id;
> >         /** @suspend_wait: wait queue used to wait on pending suspends */
> >         wait_queue_head_t suspend_wait;
> >         /** @suspend_pending: a suspend of the engine is pending */
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 0a41f5d04f6d..1b6f36b04cd1 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -13,7 +13,10 @@
> >
> >  #include <drm/drm_managed.h>
> >
> > +#include "regs/xe_guc_regs.h"
> >  #include "regs/xe_lrc_layout.h"
> > +
> > +#include "xe_bo.h"
> >  #include "xe_device.h"
> >  #include "xe_engine.h"
> >  #include "xe_force_wake.h"
> > @@ -26,12 +29,22 @@
> >  #include "xe_lrc.h"
> >  #include "xe_macros.h"
> >  #include "xe_map.h"
> > +#include "xe_mmio.h"
> >  #include "xe_mocs.h"
> >  #include "xe_ring_ops_types.h"
> >  #include "xe_sched_job.h"
> >  #include "xe_trace.h"
> >  #include "xe_vm.h"
> >
> > +#define HAS_GUC_MMIO_DB(xe) (IS_DGFX(xe) || GRAPHICS_VERx100(xe) >= 1250)
> > +#define HAS_GUC_DIST_DB(xe) \
> > +       (GRAPHICS_VERx100(xe) >= 1200 && !HAS_GUC_MMIO_DB(xe))
> > +
> > +#define GUC_NUM_HW_DOORBELLS 256
> > +
> > +#define GUC_MMIO_DB_BAR_OFFSET SZ_4M
> > +#define GUC_MMIO_DB_BAR_SIZE SZ_4M
> > +
> >  static struct xe_gt *
> >  guc_to_gt(struct xe_guc *guc)
> >  {
> > @@ -63,6 +76,7 @@ engine_to_guc(struct xe_engine *e)
> >  #define ENGINE_STATE_SUSPENDED         (1 << 5)
> >  #define ENGINE_STATE_RESET             (1 << 6)
> >  #define ENGINE_STATE_KILLED            (1 << 7)
> > +#define ENGINE_STATE_DB_REGISTERED     (1 << 8)
> >
> >  static bool engine_registered(struct xe_engine *e)
> >  {
> > @@ -179,6 +193,16 @@ static void set_engine_killed(struct xe_engine *e)
> >         atomic_or(ENGINE_STATE_KILLED, &e->guc->state);
> >  }
> >
> > +static bool engine_doorbell_registered(struct xe_engine *e)
> > +{
> > +       return atomic_read(&e->guc->state) & ENGINE_STATE_DB_REGISTERED;
> > +}
> > +
> > +static void set_engine_doorbell_registered(struct xe_engine *e)
> > +{
> > +       atomic_or(ENGINE_STATE_DB_REGISTERED, &e->guc->state);
> > +}
> > +
> >  static bool engine_killed_or_banned(struct xe_engine *e)
> >  {
> >         return engine_killed(e) || engine_banned(e);
> > @@ -190,6 +214,7 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
> >
> >         xa_destroy(&guc->submission_state.engine_lookup);
> >         ida_destroy(&guc->submission_state.guc_ids);
> > +       ida_destroy(&guc->submission_state.doorbell_ids);
> >         bitmap_free(guc->submission_state.guc_ids_bitmap);
> >  }
> >
> > @@ -230,6 +255,7 @@ int xe_guc_submit_init(struct xe_guc *guc)
> >         mutex_init(&guc->submission_state.lock);
> >         xa_init(&guc->submission_state.engine_lookup);
> >         ida_init(&guc->submission_state.guc_ids);
> > +       ida_init(&guc->submission_state.doorbell_ids);
> >
> >         spin_lock_init(&guc->submission_state.suspend.lock);
> >         guc->submission_state.suspend.context = dma_fence_context_alloc(1);
> > @@ -243,6 +269,237 @@ int xe_guc_submit_init(struct xe_guc *guc)
> >         return 0;
> >  }
> >
> > +int xe_guc_submit_init_post_hwconfig(struct xe_guc *guc)
> > +{
> > +       if (HAS_GUC_DIST_DB(guc_to_xe(guc))) {
> > +               u32 distdbreg = xe_mmio_read32(guc_to_gt(guc),
> > +                                              DIST_DBS_POPULATED.reg);
> > +               u32 num_sqidi =
> > +                       hweight32(distdbreg & SQIDIS_DOORBELL_EXIST_MASK);
> > +               u32 doorbells_per_sqidi =
> > +                       ((distdbreg >> DOORBELLS_PER_SQIDI_SHIFT) &
> > +                        DOORBELLS_PER_SQIDI_MASK) + 1;
> > +
> > +               guc->submission_state.num_doorbells =
> > +                       num_sqidi * doorbells_per_sqidi;
> > +       } else {
> > +               guc->submission_state.num_doorbells = GUC_NUM_HW_DOORBELLS;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static bool alloc_doorbell_id(struct xe_guc *guc, struct xe_engine *e)
> > +{
> > +       int ret;
> > +
> > +       lockdep_assert_held(&guc->submission_state.lock);
> > +
> > +       e->guc->doorbell_id = GUC_NUM_HW_DOORBELLS;
> > +       ret = ida_simple_get(&guc->submission_state.doorbell_ids, 0,
> > +                            guc->submission_state.num_doorbells, GFP_NOWAIT);
> > +       if (ret < 0)
> > +               return false;
> > +
> > +       e->guc->doorbell_id = ret;
> > +
> > +       return true;
> > +}
> > +
> > +static void release_doorbell_id(struct xe_guc *guc, struct xe_engine *e)
> > +{
> > +       mutex_lock(&guc->submission_state.lock);
> > +       ida_simple_remove(&guc->submission_state.doorbell_ids,
> > +                         e->guc->doorbell_id);
> > +       mutex_unlock(&guc->submission_state.lock);
> > +
> > +       e->guc->doorbell_id = GUC_NUM_HW_DOORBELLS;
> > +}
> > +
> > +static int allocate_doorbell(struct xe_guc *guc, u16 guc_id, u16 doorbell_id,
> > +                            u64 gpa, u32 gtt_addr)
> > +{
> > +       u32 action[] = {
> > +               XE_GUC_ACTION_ALLOCATE_DOORBELL,
> > +               guc_id,
> > +               doorbell_id,
> > +               lower_32_bits(gpa),
> > +               upper_32_bits(gpa),
> > +               gtt_addr
> > +       };
> > +
> > +       return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
> > +}
> > +
> > +static void deallocate_doorbell(struct xe_guc *guc, u16 guc_id)
> > +{
> > +       u32 action[] = {
> > +               XE_GUC_ACTION_DEALLOCATE_DOORBELL,
> > +               guc_id
> > +       };
> > +
> > +       xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> > +}
> > +
> > +static bool has_doorbell(struct xe_engine *e)
> > +{
> > +       return e->guc->doorbell_id != GUC_NUM_HW_DOORBELLS;
> > +}
> > +
> > +#define doorbell_read(guc_, e_, field_) ({                     \
> > +       struct iosys_map _vmap = (e_)->guc->doorbell_bo->vmap;  \
> > +       iosys_map_incr(&_vmap, (e_)->guc->doorbell_offset);     \
> > +       xe_map_rd_field(guc_to_xe((guc_)), &_vmap, 0,           \
> > +                                 struct guc_doorbell_info, field_); \
> > +       })
> > +#define doorbell_write(guc_, e_, field_, val_) ({              \
> > +       struct iosys_map _vmap = (e_)->guc->doorbell_bo->vmap;  \
> > +       iosys_map_incr(&_vmap, (e_)->guc->doorbell_offset);     \
> > +       xe_map_wr_field(guc_to_xe((guc_)), &_vmap, 0,           \
> > +                                 struct guc_doorbell_info, field_, val_); \
> > +       })
> > +
> > +static void init_doorbell(struct xe_guc *guc, struct xe_engine *e)
> > +{
> > +       struct xe_device *xe = guc_to_xe(guc);
> > +
> > +       /* GuC does the initialization with distributed and MMIO doorbells */
> > +       if (!HAS_GUC_DIST_DB(xe) && !HAS_GUC_MMIO_DB(xe)) {
> > +               doorbell_write(guc, e, db_status, GUC_DOORBELL_ENABLED);
> > +               doorbell_write(guc, e, cookie, 0);
> > +       }
> > +}
> > +
> > +static void fini_doorbell(struct xe_guc *guc, struct xe_engine *e)
> > +{
> > +       if (!HAS_GUC_MMIO_DB(guc_to_xe(guc)) &&
> > +           xe_device_mem_access_ongoing(guc_to_xe(guc)))
> > +               doorbell_write(guc, e, db_status, GUC_DOORBELL_DISABLED);
> > +}
> > +
> > +static void destroy_doorbell(struct xe_guc *guc, struct xe_engine *e)
> > +{
> > +       if (has_doorbell(e)) {
> > +               release_doorbell_id(guc, e);
> > +               xe_bo_unpin_map_no_vm(e->guc->doorbell_bo);
> > +       }
> > +}
> > +
> > +static void ring_memory_doorbell(struct xe_guc *guc, struct xe_engine *e)
> > +{
> > +       u32 cookie;
> > +
> > +       cookie = doorbell_read(guc, e, cookie);
> > +       doorbell_write(guc, e, cookie, cookie + 1 ?: cookie + 2);
> > +
> > +       XE_WARN_ON(doorbell_read(guc, e, db_status) != GUC_DOORBELL_ENABLED);
> > +}
> > +
> > +#define GUC_MMIO_DOORBELL_RING_ACK     0xACEDBEEF
> > +#define GUC_MMIO_DOORBELL_RING_NACK    0xDEADBEEF
> > +static void ring_mmio_doorbell(struct xe_guc *guc, u32 doorbell_offset)
> > +{
> > +       u32 db_value;
> > +
> > +       db_value = xe_mmio_read32(guc_to_gt(guc), GUC_MMIO_DB_BAR_OFFSET +
> > +                                 doorbell_offset);
> > +
> > +       /*
> > +        * The read from the doorbell page will return ack/nack. We don't remove
> > +        * doorbells from active clients so we don't expect to ever get a nack.
> > +        * XXX: if doorbell is lost, re-acquire it?
> > +        */
> > +       XE_WARN_ON(db_value == GUC_MMIO_DOORBELL_RING_NACK);
> > +       XE_WARN_ON(db_value != GUC_MMIO_DOORBELL_RING_ACK);
> > +}
> > +
> > +static void ring_doorbell(struct xe_guc *guc, struct xe_engine *e)
> > +{
> > +       XE_BUG_ON(!has_doorbell(e));
> > +
> > +       if (HAS_GUC_MMIO_DB(guc_to_xe(guc)))
> > +               ring_mmio_doorbell(guc, e->guc->doorbell_offset);
> > +       else
> > +               ring_memory_doorbell(guc, e);
> > +
> > +       trace_xe_engine_ring_db(e);
> > +}
> > +
> > +static void register_engine(struct xe_engine *e);
> > +
> > +static int create_doorbell(struct xe_guc *guc, struct xe_engine *e, bool init)
> > +{
> > +       struct xe_gt *gt = guc_to_gt(guc);
> > +       struct xe_device *xe = gt_to_xe(gt);
> > +       u64 gpa;
> > +       u32 gtt_addr;
> > +       int ret;
> > +
> > +       XE_BUG_ON(!has_doorbell(e));
> > +
> > +       if (HAS_GUC_MMIO_DB(xe)) {
> > +               e->guc->doorbell_offset = PAGE_SIZE * e->guc->doorbell_id;
> I think there is an implied assumption here (and in the code below)
> that PAGE_SIZE is always 4KB, which is problematic in non-x86
> architectures.
> If there is no limitation on xe being used solely on x86_64, then I
> think it would be better to change this to SZ_4K
>

Will fix.
 
> > +               gpa = GUC_MMIO_DB_BAR_OFFSET + e->guc->doorbell_offset;
> > +               gtt_addr = 0;
> > +       } else {
> > +               struct xe_bo *bo;
> > +
> > +               if (!e->guc->doorbell_bo) {
> > +                       bo = xe_bo_create_pin_map(xe, gt, NULL, PAGE_SIZE,
> > +                                                 ttm_bo_type_kernel,
> > +                                                 XE_BO_CREATE_VRAM_IF_DGFX(gt) |
> > +                                                 XE_BO_CREATE_GGTT_BIT);
> > +                       if (IS_ERR(bo))
> > +                               return PTR_ERR(bo);
> > +
> > +                       e->guc->doorbell_bo = bo;
> > +               } else {
> > +                       bo = e->guc->doorbell_bo;
> > +               }
> > +
> > +               init_doorbell(guc, e);
> > +               gpa = xe_bo_main_addr(bo, PAGE_SIZE);
> > +               gtt_addr = xe_bo_ggtt_addr(bo);
> > +       }
> > +
> > +       if (init && e->flags & ENGINE_FLAG_KERNEL)
> > +               return 0;
> > +
> > +       register_engine(e);
> > +       ret = allocate_doorbell(guc, e->guc->id, e->guc->doorbell_id, gpa,
> > +                               gtt_addr);
> > +       if (ret < 0) {
> > +               fini_doorbell(guc, e);
> > +               return ret;
> > +       }
> > +
> > +       /*
> > +        * In distributed doorbells, guc is returning the cacheline selected
> > +        * by HW as part of the 7bit data from the allocate doorbell command:
> > +        *  bit [22]   - Cacheline allocated
> > +        *  bit [21:16] - Cacheline offset address
> > +        * (bit 21 must be zero, or our assumption of only using half a page is
> > +        * no longer correct).
> > +        */
> > +       if (HAS_GUC_DIST_DB(xe)) {
> > +               u32 dd_cacheline_info;
> > +
> > +               XE_WARN_ON(!(ret & BIT(22)));
> > +               XE_WARN_ON(ret & BIT(21));
> > +
> > +               dd_cacheline_info = FIELD_GET(GENMASK(21, 16), ret);
> > +               e->guc->doorbell_offset = dd_cacheline_info * cache_line_size();
> I don't understand something. We have 256 doorbells, but here you
> overrun the doorbell_offset, where dd_cacheline_info can be 0-31
> (because bit 21 is always 0).
> This has overlap... Some doorbells will get the same address.

Yes, there is a 8 to 1 multiplexing behind the scenes here.

Matt

> > +
> > +               /* and verify db status was updated correctly by the guc fw */
> > +               XE_WARN_ON(doorbell_read(guc, e, db_status) !=
> > +                          GUC_DOORBELL_ENABLED);
> > +       }
> > +
> > +       set_engine_doorbell_registered(e);
> > +
> > +       return 0;
> > +}
> > +
> >  static int alloc_guc_id(struct xe_guc *guc, struct xe_engine *e)
> >  {
> >         int ret;
> > @@ -623,6 +880,7 @@ static void submit_engine(struct xe_engine *e)
> >         u32 num_g2h = 0;
> >         int len = 0;
> >         bool extra_submit = false;
> > +       bool enable = false;
> >
> >         XE_BUG_ON(!engine_registered(e));
> >
> > @@ -642,6 +900,7 @@ static void submit_engine(struct xe_engine *e)
> >                 num_g2h = 1;
> >                 if (xe_engine_is_parallel(e))
> >                         extra_submit = true;
> > +               enable = true;
> >
> >                 e->guc->resume_time = RESUME_PENDING;
> >                 set_engine_pending_enable(e);
> > @@ -653,7 +912,10 @@ static void submit_engine(struct xe_engine *e)
> >                 trace_xe_engine_submit(e);
> >         }
> >
> > -       xe_guc_ct_send(&guc->ct, action, len, g2h_len, num_g2h);
> > +       if (enable || !engine_doorbell_registered(e))
> > +               xe_guc_ct_send(&guc->ct, action, len, g2h_len, num_g2h);
> > +       else
> > +               ring_doorbell(guc, e);
> >
> >         if (extra_submit) {
> >                 len = 0;
> > @@ -678,8 +940,17 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
> >         trace_xe_sched_job_run(job);
> >
> >         if (!engine_killed_or_banned(e) && !xe_sched_job_is_error(job)) {
> > -               if (!engine_registered(e))
> > -                       register_engine(e);
> > +               if (!engine_registered(e)) {
> > +                       if (has_doorbell(e)) {
> > +                               int err = create_doorbell(engine_to_guc(e), e,
> > +                                                         false);
> > +
> > +                               /* Not fatal, but let's warn */
> > +                               XE_WARN_ON(err);
> > +                       } else {
> > +                               register_engine(e);
> > +                       }
> > +               }
> >                 if (!lr)        /* Written in IOCTL */
> >                         e->ring_ops->emit_job(job);
> >                 submit_engine(e);
> > @@ -722,6 +993,11 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
> >         MAKE_SCHED_CONTEXT_ACTION(e, DISABLE);
> >         int ret;
> >
> > +       if (has_doorbell(e)) {
> > +               fini_doorbell(guc, e);
> > +               deallocate_doorbell(guc, e->guc->id);
> > +       }
> > +
> >         set_min_preemption_timeout(guc, e);
> >         smp_rmb();
> >         ret = wait_event_timeout(guc->ct.wq, !engine_pending_enable(e) ||
> > @@ -958,6 +1234,7 @@ static void __guc_engine_fini_async(struct work_struct *w)
> >                 cancel_work_sync(&ge->lr_tdr);
> >         if (e->flags & ENGINE_FLAG_PERSISTENT)
> >                 xe_device_remove_persistent_engines(gt_to_xe(e->gt), e);
> > +       destroy_doorbell(guc, e);
> >         release_guc_id(guc, e);
> >         drm_sched_entity_fini(&ge->entity);
> >         drm_sched_fini(&ge->sched);
> > @@ -1136,6 +1413,7 @@ static int guc_engine_init(struct xe_engine *e)
> >         struct xe_guc_engine *ge;
> >         long timeout;
> >         int err;
> > +       bool create_db = false;
> >
> >         XE_BUG_ON(!xe_device_guc_submission_enabled(guc_to_xe(guc)));
> >
> > @@ -1177,8 +1455,17 @@ static int guc_engine_init(struct xe_engine *e)
> >         if (guc_read_stopped(guc))
> >                 drm_sched_stop(sched, NULL);
> >
> > +       create_db = alloc_doorbell_id(guc, e);
> > +
> >         mutex_unlock(&guc->submission_state.lock);
> >
> > +       if (create_db) {
> > +               /* Error isn't fatal as we don't need a doorbell */
> > +               err = create_doorbell(guc, e, true);
> > +               if (err)
> > +                       release_doorbell_id(guc, e);
> > +       }
> > +
> >         switch (e->class) {
> >         case XE_ENGINE_CLASS_RENDER:
> >                 sprintf(e->name, "rcs%d", e->guc->id);
> > @@ -1302,7 +1589,7 @@ static int guc_engine_set_job_timeout(struct xe_engine *e, u32 job_timeout_ms)
> >  {
> >         struct drm_gpu_scheduler *sched = &e->guc->sched;
> >
> > -       XE_BUG_ON(engine_registered(e));
> > +       XE_BUG_ON(engine_registered(e) && !has_doorbell(e));
> >         XE_BUG_ON(engine_banned(e));
> >         XE_BUG_ON(engine_killed(e));
> >
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> > index 8002734d6f24..bada6c02d6aa 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> > @@ -13,6 +13,7 @@ struct xe_engine;
> >  struct xe_guc;
> >
> >  int xe_guc_submit_init(struct xe_guc *guc);
> > +int xe_guc_submit_init_post_hwconfig(struct xe_guc *guc);
> >  void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
> >
> >  int xe_guc_submit_reset_prepare(struct xe_guc *guc);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> > index ac7eec28934d..9ee4d572f4e0 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> > @@ -36,10 +36,14 @@ struct xe_guc {
> >                 struct xarray engine_lookup;
> >                 /** @guc_ids: used to allocate new guc_ids, single-lrc */
> >                 struct ida guc_ids;
> > +               /** @doorbell_ids: use to allocate new doorbells */
> > +               struct ida doorbell_ids;
> >                 /** @guc_ids_bitmap: used to allocate new guc_ids, multi-lrc */
> >                 unsigned long *guc_ids_bitmap;
> >                 /** @stopped: submissions are stopped */
> >                 atomic_t stopped;
> > +               /** @num_doorbells: number of doorbels */
> > +               int num_doorbells;
> >                 /** @lock: protects submission state */
> >                 struct mutex lock;
> >                 /** @suspend: suspend fence state */
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > index 02861c26e145..38e9d7c6197b 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -149,6 +149,11 @@ DEFINE_EVENT(xe_engine, xe_engine_submit,
> >              TP_ARGS(e)
> >  );
> >
> > +DEFINE_EVENT(xe_engine, xe_engine_ring_db,
> > +            TP_PROTO(struct xe_engine *e),
> > +            TP_ARGS(e)
> > +);
> > +
> >  DEFINE_EVENT(xe_engine, xe_engine_scheduling_enable,
> >              TP_PROTO(struct xe_engine *e),
> >              TP_ARGS(e)
> > --
> > 2.34.1
> >
> >
