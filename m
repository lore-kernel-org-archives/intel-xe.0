Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E616EE14C3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 21:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D10C10E66E;
	Wed,  6 Sep 2023 21:41:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCC210E723
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 21:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694036466; x=1725572466;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AoJNp75x+K3rWo5CRB6tugJ6HVk+gK3YzFLxbsuPYow=;
 b=L90QRq6HxRdpWTn1ka4qyrB+nvg9cWT9OlWU3+h5qxD1k3PV7UPIQQY3
 IbZ7OmLmaAmuhq2VlWxGeyLVmpi1G/97uz9NlAuDZizXWV38at4EmFqsw
 6/c9qxVtU26k2FyAtffB7IyJDcYe97AHyvip9wuDDe7Q57QR13T4rgh/r
 ZI4sQVldytNgWKcTcUnSBSfTxhhSO4Er60xHKmp4BoFCWe08IryT6tMSj
 agzPLQzp+YLBgfcj3EeOQKxVOXTKVk2ocJR52oMqFjekjnccPXAhq3Poi
 Zsmt5teASjBophBQ8Zjs28zGoo7W+Qf29cyzc/qyJcF4oG2iSSIKAQsJB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="379900462"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="379900462"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 14:41:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="691464769"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="691464769"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 14:41:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 14:41:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 6 Sep 2023 14:41:05 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 14:41:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbeOSTAMAvonfnyYDiqQrQa22UsWoKnWWOaKnritQdOd7VIUhI2+69/fmQL4Lv8fjyYQtTIQlh5/+k11DETgMS/QKd3LnOy8dCUHKSn+KYoWWX462AzErIdON0PAcBn+cXjErqKYtHxkG9PNBNDPIP6ssvP0iekAYzZiJQ4+w+7cxYN1TW/U+BuvT1PCWS8psVXJznYSt/72E/mxB7plrH+6B/nuDC3plivyobwsG3QuFRJmkZ/CZhdqLUNsYAm6RrehVUhrIvCUHoE5sPWIsU9B2GzQfVBprGyB/27TgetMKFe2h5tyYU02QwQjHtrZDeIKkCQOXnQc0wiOe2RgUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o57LxZmE+IXpscoymN+yzvM7rFpkQIGjr+1PhfRscGs=;
 b=bTXAUw2vS4E3++aNg2FvGx7nSqGz5m1evMNwECnK0vutM1uu3RL6euN1xRYMuMiU77TZc59b5EdCW7B6EsQLdMaZ7ueOvXMVrNEaaEOoy8K+NyCLHW4K6ZdJyaM12STMAq09TSmRikkLZiLxPJeaSZP7lAM5XYs+8pvdokMkbBC9YsqTyYHEERclySuaOR4eDjPhUViskg7fReeSWPiCT/QvQtOxv7B33nHqVViMzjMx2zj5Ux12HQ066GAWJ+h6MG1VXkHguAOX7G/bLxKg6Ba30DzR1ZxlHWq7A6K7tA5oevg45YgCwVikCQlU23vGafsaf7oVDzjbK6IsxhylyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4239.namprd11.prod.outlook.com (2603:10b6:208:192::20)
 by CY5PR11MB6413.namprd11.prod.outlook.com (2603:10b6:930:37::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 21:41:01 +0000
Received: from MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::396d:bef4:459:c050]) by MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::396d:bef4:459:c050%3]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 21:41:01 +0000
Date: Wed, 6 Sep 2023 14:40:57 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZPjx6XGFVTvY3RTr@msatwood-mobl>
References: <20230823195533.125633-1-matthew.s.atwood@intel.com>
 <20230824200538.GZ1529860@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230824200538.GZ1529860@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0111.namprd04.prod.outlook.com
 (2603:10b6:303:83::26) To MN2PR11MB4239.namprd11.prod.outlook.com
 (2603:10b6:208:192::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4239:EE_|CY5PR11MB6413:EE_
X-MS-Office365-Filtering-Correlation-Id: e217bd3f-0e1a-49a8-8d57-08dbaf21f6e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EljKPGCskzKFGNdqZ+L7xnAoFn/T7ex8IoiFt6YbiNt3mji3nsvj3+/ADpERJd6RprPPWus57RfNSYRhtS2E1G+/CFOMODfH2s/iiWSP5gJ6//0cjquwSnofOK9Qq1dfgvM7HoEiaW+/5nPTbjw84PtyrQzMwiQVfrhe4l2f5TLxCZeY7bA3dQVIwJKKcu0Qqwp6UUDQbBGbeZrd46Pa2/4xRGgxPwysn4SCI/iKr4rePfiaASX9VghU3BoEHP1y6G+jtByNyzIIa7g+7jkbXNOpQ1eR5b6yXe/HMs3ED2/uxuhIcclLVXbrYRYLVvy718/hUwLFiUQXYubePyci25yItUmTEpWkbl/fOK1VFeM70nbNwb99ESvlAjSh6QNUBKixyEvm7QJzJma7BfbSKT5B/N8P3Bc3OJ2FU8ByAxf+xtItMh7gp/9XQBkXDT9uWWO3o8edlI6zrk6frVKZ340U8xeYMwNyCu6T5iB7xb88w1cdsaCqdKZqlHNGtg+Ki3FBESSiyosryNn5bktYVCa9ldM6AiKLQfjY2A4Eok82BtN2d6+J1WI88LtnlJas
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4239.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199024)(1800799009)(186009)(66476007)(316002)(107886003)(6666004)(86362001)(66946007)(66556008)(2906002)(8676002)(41300700001)(4326008)(8936002)(5660300002)(38100700002)(478600001)(33716001)(6512007)(9686003)(26005)(6506007)(6486002)(83380400001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzJQcmRUS0MrSnNLVFdvRWkxNWsrcnJFWDJEVFRvSXdwbmFLa2N2bW03ei95?=
 =?utf-8?B?bktTelBaanJ4Zi9pTGdKbStTYzVQTTkxNG5aK05UOEdwWmFDTUdzLzRWVW5o?=
 =?utf-8?B?Y1VFL3UxOER2UjJzY0JTQXJWVDVNS1dJT01ESHg1TVpIZWtCdHN6UmFlcW9t?=
 =?utf-8?B?Smc5aHBIVGZFYmVxRzR4b0EyUkNsSHNtTlUza1UxaEh4L0YwbzNYM21oOXBU?=
 =?utf-8?B?M1lURS9KSW11bTJublR2alZSRTI4cERSQXJSd2VzYm1sS3F5WUdQaFBQaENQ?=
 =?utf-8?B?MGlWbzU0U1ZXRHlzcXlFUlNUa0FaS3p1M3h1L3V0NUVpMVEyTDBsTzkzVnBu?=
 =?utf-8?B?T2dBTXo4UUlnQWh6S3hKeUdPS3RoWDVRZFZESFNnalliSUdsZXp6bDdtMG1j?=
 =?utf-8?B?eGVUMTFIZ09tam5qQW1YNVhyNmdibUxQemt6RndCTk5Sb29mOXpRdERsM1Ux?=
 =?utf-8?B?U3pxRkw4OE5rL1ZuZXA3dHBpL3BjYVFIVVFOK0Q3SG9laDBXSjQyZTNCbzNR?=
 =?utf-8?B?b2FHNysvS3Zzam1NRVpZSGhOMmhQejJEM3B3V3lDUENNNWJVd01UZ3ZiNjNn?=
 =?utf-8?B?ZUhVM3RSV05DaXIyYTlpWVZ5VVB4elBFZkY1UDBMaG1tWWZhTnBhOE5MRWRH?=
 =?utf-8?B?S25OeExnTVlyTElyL0tTc0p2cmo3dXd0dVpyalgxZ2gvSDE5SWhlSnJYYmRG?=
 =?utf-8?B?WlI2SFAzUWc1L21uVG9ONW9zeEYrYTlGZmpiT1Z1VHJRUzQwMVEvRmVaQktG?=
 =?utf-8?B?bXFJSnZDNXp3N0ExVUY4OFZvUXg1dC8xM05Sbis1ZS9NU0FvakRsOFZuWUpE?=
 =?utf-8?B?a1ZWOTNnT24wZ2s0YXVNRmNUTjVZaHZkSmFSb1BUN0tXWTFhT2RjRUF2dUl2?=
 =?utf-8?B?RnpMYjduQ0JqUG9wTXhWSW1aQnovcEZyc0UxS2tIUXE5TFdNellRaXVhWDhX?=
 =?utf-8?B?eHRCblhmejNlckZ2Z3lORXR2L1FoRVhvQ254aWZKVTlCYk9qL2gyRDdzOVpN?=
 =?utf-8?B?ZkgxaDhOVDMydkFMRWgyWUFRVDkwUmNkT0FuMHhxMHZjWW9NTDBYbDk1SG5W?=
 =?utf-8?B?c3ZPL1pjYkdYelprREticXYyL2hCTzRhNnB6S0V1ekRUQmN1bDVENWVZakpp?=
 =?utf-8?B?NEU3ZDlaWE5FWFcrQkdmZDFvSjBQaDNkT3dDRG1yQUJ4UmJrTUl0RnVEU3g1?=
 =?utf-8?B?c0NyZ1FlNUFmanNNOEV0N0djNnhiVk16Zi9lMXdMQUFDWDJYa1F0aDJCd2xY?=
 =?utf-8?B?NWpkY3pObkZXRGVoMzV4bkdETFl6bXM4VDFFaDFiN01HL3MranJPL2s0ank3?=
 =?utf-8?B?YlRnZk52VS82cXYxUmNIUDdIU1paamowNlYrb0VXZk1waUF3aFBEZ3hpaVVa?=
 =?utf-8?B?UWo1RWNaRWVoWHZGMmxyNlBPUkhLbEhMQ3JiOHh3bnk1RXh6NDVuUDdwOFNW?=
 =?utf-8?B?bWNqam1UemRuVWFFSGVySVJiRklZSWd0cEYxMXRuV1d0cWFnVEdPZUIyMDlY?=
 =?utf-8?B?bG9DQmtQTEoyOUM4emMzQm4vUWZ1UWNiRk0rVDBMQVk4ZVBScXp3UHNDbzhl?=
 =?utf-8?B?bWpQQW1QWWZZcjhIL1A2UG0zN2NWYmNhMURXaFA0cERjV2N1ajF0ZUtVTUNh?=
 =?utf-8?B?VUJsaHA5bE0zMlRVRS9kSCtTejlsQnBTaloxK0VmcHhwWHFTZGhQOTdHc3dF?=
 =?utf-8?B?STFrd3RrcElXakxBV2MvYWZUUWRwaytkZDVNbEdRQmZQbGRmMU1aL1dEL3gy?=
 =?utf-8?B?Zm5xaUhOMWdMeXl0YU5kOVErdlZ0ZURCUTVVTVdwNjBnRUlpSUMxZkpOay9z?=
 =?utf-8?B?Q1ZVN2lsTy9SMnR2TmpoVW4rekpIeHlzK2N1dmxrNzZvRjlzL1poZFN1Ukpx?=
 =?utf-8?B?OTVoNElFeXNLdHFiNG5YNGpjK1IwOWRYWk1aRjM3cy9sR3loUzYyS0ptMVhT?=
 =?utf-8?B?NHpLUTI5SjR5VG5UVVlMUUlVS25EWFRIdkx1dmZKZStUNzVFRlA1YW9CVmRs?=
 =?utf-8?B?RUo1VnI4UTRLMXUzM2FkWXlXb2tlRlpHRU03QWRYSE5mbnl3V0Zhek1LcHhK?=
 =?utf-8?B?eWpGQVA3WklTUVRlL2JoSlpnTnVsZURkb3RVTENHRTAzQlpESWJuTXRrWDRC?=
 =?utf-8?B?WlNWOVN6VkdreFlteVhxQWNvODZYeG5EY2l4Snlub2VIQ1ZtREVBMGgrMm5R?=
 =?utf-8?B?SkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e217bd3f-0e1a-49a8-8d57-08dbaf21f6e5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 21:41:01.6340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3YnZ0SeauXZoHNHGxpVb8qvv81FWhEf7oFIVVKIvkUkZUe4tMXFBvXCr7h/uLrPTibExW48RN+P1SH7rDmnToUk5zUyFcQB3zjKj/p3qJVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6413
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2 v3] drm/xe: Add infrastructure for per
 engine tuning
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Aug 24, 2023 at 01:05:38PM -0700, Matt Roper wrote:
> On Wed, Aug 23, 2023 at 12:55:32PM -0700, Matt Atwood wrote:
> > Add the infrastructure that allows for per engine tuning preparation for
> > disable indirect state.
> 
> I don't think we need this patch; there's nothing terribly complicated
> here so we might as well just squash it directly into the next patch
> that starts adding some entries.
originally was, however lucas asked for it to be split out.
> 
> > 
> > v3: rebase
> > 
> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_hw_engine.c |  2 ++
> >  drivers/gpu/drm/xe/xe_tuning.c    | 12 ++++++++++++
> >  drivers/gpu/drm/xe/xe_tuning.h    |  1 +
> >  3 files changed, 15 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index dd673a684b70..9dafc56d5fe8 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -24,6 +24,7 @@
> >  #include "xe_reg_sr.h"
> >  #include "xe_rtp.h"
> >  #include "xe_sched_job.h"
> > +#include "xe_tuning.h"
> >  #include "xe_wa.h"
> >  
> >  #define MAX_MMIO_BASES 3
> > @@ -401,6 +402,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
> >  	}
> >  
> >  	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
> > +	xe_tuning_process_engine(gt);
> >  	xe_wa_process_engine(hwe);
> >  	hw_engine_setup_default_state(hwe);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> > index 412e59de9842..702cb41dab53 100644
> > --- a/drivers/gpu/drm/xe/xe_tuning.c
> > +++ b/drivers/gpu/drm/xe/xe_tuning.c
> > @@ -27,6 +27,10 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
> >  	{}
> >  };
> >  
> > +static const struct xe_rtp_entry_sr engine_tunings[] = {
> > +	{}
> > +};
> > +
> >  static const struct xe_rtp_entry_sr lrc_tunings[] = {
> >  	{ XE_RTP_NAME("Tuning: ganged timer, also known as 16011163337"),
> >  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
> > @@ -65,6 +69,14 @@ void xe_tuning_process_gt(struct xe_gt *gt)
> >  }
> >  EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_gt);
> >  
> > +void xe_tuning_process_engine(struct xe_gt *gt)
> > +{
> > +	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
> > +
> > +	xe_rtp_process_to_sr(&ctx, engine_tunings, &gt->reg_sr);
> > +}
> 
> It looks like you may have copied the GT function but forgot to update
> it for engine usage?
yes, seem to have copy pasted the wrong block, ack.
> 
> 
> Matt
> 
> > +EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_engine);
> > +
> >  /**
> >   * xe_tuning_process_lrc - process lrc tunings
> >   * @hwe: engine instance to process tunings for
> > diff --git a/drivers/gpu/drm/xe/xe_tuning.h b/drivers/gpu/drm/xe/xe_tuning.h
> > index 2b95b0c8effc..740cb1bd2f0a 100644
> > --- a/drivers/gpu/drm/xe/xe_tuning.h
> > +++ b/drivers/gpu/drm/xe/xe_tuning.h
> > @@ -10,6 +10,7 @@ struct xe_gt;
> >  struct xe_hw_engine;
> >  
> >  void xe_tuning_process_gt(struct xe_gt *gt);
> > +void xe_tuning_process_engine(struct xe_gt *gt);
> >  void xe_tuning_process_lrc(struct xe_hw_engine *hwe);
> >  
> >  #endif
> > -- 
> > 2.40.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
