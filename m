Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D28FCDB482
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 07:45:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438AE10E066;
	Thu, 19 Oct 2023 07:45:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9136310E084
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 07:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697701551; x=1729237551;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fnqRPy9Y3J2khki0ipI3OocL2qBL8Q95Mi1RLRdxZZg=;
 b=ic8HynsN1PyC4DTV9C07/V+3bmJyS4D/2wBanvDxtQeQee/Y59nG7eRi
 2X4ShG0/o6SbEiZ+7fYJRz7tPQcvlugWPxVT0sflM07NJLyxf34rf0hCq
 3GRJ2SaCZk/qlTRwdgcV8zLffqlcHdGh6/80a5V+8Oi9W4eehS8bj7tPA
 aboOoFBFRNBUvFIzSbV42bshQoTdxajyaiyMcg+UosTPGPYUAEATtJ3/x
 pMe+OsLnuN4T2tLWIUZTTiTf/bKRrdXf90msxQM8UAvYH2I9aThxeYbfE
 wostdomOvH5hChSw/CGVFGofSxEl8bYL6kvuEJs/rExfyHZ0JqRidzVyd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="4788357"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="4788357"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 00:45:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="880547289"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="880547289"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Oct 2023 00:45:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 00:45:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 19 Oct 2023 00:45:46 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 19 Oct 2023 00:45:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWuS65sWG/DwRfHy4cDoR9pNFt7UNRfgFZ3N/x2nDvrEK2boezFpjzVOWb8uodDV00AhKpBPgsBUnM8ZjXnbMtBgk7K4S+doAIQrYpfeKHzJ836aM/GML8DgoUw60ytSS3aR3gFasZQ5qd3A4s/O4ryze2aN74cYsxAy3xLhC6kySmDDYozRMEBRqsJ/BQsD4p60ASlsuexNJ1qXOH62JDZCrNP1YC/UfnTgOl89X6q/8fLv9Jy5uLBL1hTLrBVvVbaUJf5Z9BMUSV6byof5OMNddyLblKknIjCIwwjT4LNUZ2kE2MebQ7xOi92DcSiONPoq8gokx+R3jmJdorAFwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSPKMjpYUnTiHiJcm0S7J1VpU1ZIq/AVxzx7Hp4DRrA=;
 b=X51FXucezXOu3chwNqcVOnA7OLnf/YUtjmlStUpvhzMs030wk38/0CpAggMFH0sXZuJ5YGT4j39mwqJwve8/I4p04cFLTIFeWtoxtkqkjAd0R2rqIWQHb9bJo+HPTVyH2IA459gBtGjgNXqn10Zck+bYkvdbNyBNv7+xA4UMvhYIVRVL2UmGGtZ61sa18iUDm1+Q9zqOkmBt9ZlFxTkSMczYb6CZ4LMuZg/A04hPZLg+2iNLtCaIgqsFf47ywCPZHrXz9CfVs23OfCPZ3VQLFsHEbti8c8Oegp0kYMBxLLJedOBKayNa96tpPM5gkt8WwLcY6IKhNv/ejOH8CDOLIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SN7PR11MB7995.namprd11.prod.outlook.com (2603:10b6:806:2e2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Thu, 19 Oct
 2023 07:45:44 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::15c8:5319:c6bb:323c]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::15c8:5319:c6bb:323c%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 07:45:44 +0000
Date: Thu, 19 Oct 2023 13:15:32 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: "Kalvala, Haridhar" <haridhar.kalvala@intel.com>
Message-ID: <ZTDenBGkzBl57jEW@bvivekan-mobl>
References: <20231016101720.1657746-1-balasubramani.vivekanandan@intel.com>
 <20231016101720.1657746-2-balasubramani.vivekanandan@intel.com>
 <20fd16ee-c8cb-49aa-c223-2b511d158827@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20fd16ee-c8cb-49aa-c223-2b511d158827@intel.com>
X-ClientProxiedBy: PN3PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::13) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SN7PR11MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: c4233fd0-9beb-44b2-ddee-08dbd0776607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TkKCanRk3uMbIHJz95IDL0c/afnUIFMY5+EExqPe5Gq9yynAgwuyP/E+CjjKZdXl8IfaRnKBRFUzI0g1WWFYUiJ4fm2CfPnvF1Ts3i1jR/FBUTgfMsRiyBQubxioDN08w8BCQwLoxPY080WojwuulxmrlD/57F5VtqWEcu37rKxjLyzlgfllYhdv6LKh4Fe75KMldZlbnF6BMBRA8uZfbme3hGLumcaZjohORlL2T8fyHzCJTL734iDmFtZrRMCH+PLFDGfBYiuqHqGLgAQsyxYhpTSDdx2DGDM8WtpwM5WJxlTH7BE6KfiROYeeAOlagAepoF4Q9Xmh16kDvBlNT5k53TpQqhasJ9qqW4rZsjZbboVwx4eki4pZGaZb7RJQBEdlQE26NTcVuwjx35GR6O2MBu8tojmR/h0yGdd039QDwOhEBpjvaYDSGrOy1q6bu8o7w5SrRb0RAhyjGNZiPlkLQNB3lZDqkrmVWkyRTy4sJodX/TWFNWX6ri8dMp1UWqn/df9DstxIY4ohdTOb55Pgews4rRe433zQUFaHtgxM13DubsFrmrmT7A5TvemL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(346002)(376002)(366004)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(66476007)(6486002)(38100700002)(83380400001)(44832011)(6506007)(6666004)(53546011)(66556008)(6512007)(66946007)(26005)(9686003)(478600001)(41300700001)(6636002)(316002)(82960400001)(86362001)(2906002)(4326008)(8676002)(6862004)(5660300002)(8936002)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWtzZ0dhV2Rkc1NWaXM1OWpJb2tBdEFMbjVVTE1ta2MzM1hoUDl3aERHVTRV?=
 =?utf-8?B?dHV1RDM3Z2h1VkJtcENxelo3cU8zVGpKVy9icVptOU9uaFVQNWJiVlROYjho?=
 =?utf-8?B?NVE5TVVtWU12T3lqODFBSUI3Slh1TkIwSTB2VXo5aHI0S2xZNWFlV2tJL1Ri?=
 =?utf-8?B?WlNISzkvMnJHZDE3WS90Y211VmhIemtlakljSkExcU1GZDcwWTN6YURXbmF3?=
 =?utf-8?B?M3FCMDRDcnhsazMrYVFIVXA2ZzNXQkNRK1FablFuMWNlbkZUZXlENkEwNkhi?=
 =?utf-8?B?SVkwNTkxSmZaSkpHZHhsbHlDYWo5c010dklyR3RWR0hzU0taTloyaWpKMVFi?=
 =?utf-8?B?VVJadENpNUFiUDJGTDREWWJHQXNPZHF6Y0ppUFYwQTk4TWZRVGthNEJaNHpo?=
 =?utf-8?B?NlFGY3lCYzJidDZLcVhaZWtUbUNPV3FtK2NEMGxmYnpjZG9RaVE5ak1lQ3Fn?=
 =?utf-8?B?Sy9IVjBScHNaaFZkWGdxMW9tZFl4Z1JZTi9DSEZHbDh6QzhsVlk5a1Z0UXVl?=
 =?utf-8?B?Mm8xL3l4MlFVbFIzVDhTRjFqYjZzUTEwUnhiUkxZVGU2c3BCeGcxOStGZ2xh?=
 =?utf-8?B?UUl5NVM1SVNOR2tOQ1dGaHJHOTZaWWlUc3ZuNGJBNXliZUs2NGgwbXc0dktn?=
 =?utf-8?B?Ty9scHVTbUFDMnlBVVBuYWxmZXZaSlRwRkY4dVFFWWt1L3BaVjF2dDFvZVdw?=
 =?utf-8?B?c05zd2g2L2EyOGFnd0hDdW8vN1ovOXV6MllnQjh2S2VyVDc5UUludEhlcDQx?=
 =?utf-8?B?b1pxaWRvOEJodndIc1VyaDV0L0p0MjdSUDBObmE1a2hhU2thdE1IWXJNckRO?=
 =?utf-8?B?NzZuUjN2WW01WEVGemRvNS9meXdHR0tSQWRTZnhlc3BiMDJuRk1ndkhaWHRQ?=
 =?utf-8?B?aWNjMDFoZ2VoN2EybkhZRFpDSnlURFRxN1JadS9GbkE5eDRGUUVNNC93MWFE?=
 =?utf-8?B?UXd6eG1FMVQ5aEM1cXFYRGlYR1VyZmNGVnpnNnQvSkszRjR1VXdEOGNLeWRl?=
 =?utf-8?B?U0RKSE1JNjVteWZPbndRaGxBVTJmWFZEb2hNNmVPa1Z5WFVYWjZXNkV0WnFi?=
 =?utf-8?B?eHMvcUZHUlNvQm5FMXVMYSs5Y3piOERlQ1RsWHE1eDlHN2FyYWkxcFFlQ0tK?=
 =?utf-8?B?SmJ0c3FTcnBFNFNDZGJoR0pVSm1HWDg4bG1GWUphWk9aMi9lSGszUVlZT1ZE?=
 =?utf-8?B?VHpqUkNLZ0lhcDNOb3Zzb1lCVmFpd2xsOEU0bmRaT3hMaFdqOUFNWGQ4b0Fp?=
 =?utf-8?B?YlRiaU1ld1hoVnBnU3ZGOG5icG9ER2xzK0FNQnJZS29OTWNSdTA5S2VEZHlQ?=
 =?utf-8?B?aW4wM3M3Y3BFSVNDZmx5bldmY3RWTDM3VTBxSGFKeHZud0tYeStXOXpkSG1S?=
 =?utf-8?B?ZmZoMk1WcS9abzZCdW1rZ0U4OVFYSWdkRldwZlpudXVsWXl0NEJCUWVRVE9r?=
 =?utf-8?B?NEJ2L2k3YlpNcTZ3UW9yQUhUT3pGNm1hcTJUQzd2V045emMrZ3Z0UU5YUzF3?=
 =?utf-8?B?TnBaTmdZeHh6U20zWDZpejFqWDBEZFlFZW94dG1zNEZ6UFJGdjR0aUJ1QUpJ?=
 =?utf-8?B?clNTakZSU0FGc2dkQnVrSjhsT0c3YnJkMCsrNGR3OVFjeW83QTFXVU5MajVG?=
 =?utf-8?B?eWFCeFBLank4ankreUZ1bXlZdTk4M2lITjZMRCtDaUczUU9kYkNIemM1SmRk?=
 =?utf-8?B?eDIxc2w3cTFSUWZ5bmk0Q2Q0c01ubGY3a3FoWWNJcmhSb0Rlei91eE5sYmxy?=
 =?utf-8?B?QkR6RENLeW5yQWoycTdieVlWVDlXdjNNMmdDZHVnNGIvOEd6NzdiaGJZNGx3?=
 =?utf-8?B?N2trWWZmbFJ6M0hxMHJtdnVKelY4cjlSd1BqUElqaG82MThxMFpMb1A3aVBT?=
 =?utf-8?B?YTREaGtqeUFPUGxWdWlrdkhUcHNmWHhtVWJpaGRvLzR4SzFxTmFCcFV0Tnpr?=
 =?utf-8?B?c3lwU3pCQzZoRzNNaUxxa3QrYlRxUUkxU0YzWHIzYjM2a3l5dTdqSlNSTndZ?=
 =?utf-8?B?bUh2Qm1hR09zRnhmRy9hdHFTZHJabW9yemxiOXFGQVhZZDlubHM5Qmo0TmtE?=
 =?utf-8?B?NnIxZUpVK3ZnQjcxVjlZR2l5aFpuZFFPK3FRT011RmJVUVhxd2lEVFYzcWxO?=
 =?utf-8?B?Z1g5eVdvdVNnWVRpaTYwTHJEbnVQTFBVaGVWaXJXUE1UVXRYdnZSTW5IVldr?=
 =?utf-8?Q?Vy7is/rYOU6xgZ1pIATr9wg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4233fd0-9beb-44b2-ddee-08dbd0776607
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 07:45:44.1174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5TvPOq027um5Hn6BMKH24S+bg+Xl1rvgqI2YRDZtJrcnkPCA9U2bF7vVia/ThoediwxLNjt9PNzOfzy4V0ZRywog20Ur4Zswciq4mkTXYtI+uM8NBfRqY2BfRPJ50Kf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7995
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Add event tracing for CTB
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

On 18.10.2023 13:19, Kalvala, Haridhar wrote:
> 
> On 10/16/2023 3:47 PM, Balasubramani Vivekanandan wrote:
> > Event tracing enabled for CTB submissions.
> > 
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_ct.c | 13 ++++++++--
> >   drivers/gpu/drm/xe/xe_trace.h  | 43 ++++++++++++++++++++++++++++++++++
> >   2 files changed, 54 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 8b686c8b3339..a84e111bb36a 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -460,7 +460,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >   	/* Write H2G ensuring visable before descriptor update */
> >   	xe_map_memcpy_to(xe, &map, 0, cmd, H2G_CT_HEADERS * sizeof(u32));
> >   	xe_map_memcpy_to(xe, &map, H2G_CT_HEADERS * sizeof(u32), action, len * sizeof(u32));
> > -	xe_device_wmb(ct_to_xe(ct));
> > +	xe_device_wmb(xe);
> Hi Bala, I think its better to describe this change in commit message
> (ct_to_xe(ct)  -> xe).
Done

> >   	/* Update local copies */
> >   	h2g->info.tail = (tail + full_len) % h2g->info.size;
> > @@ -469,6 +469,9 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >   	/* Update descriptor */
> >   	desc_write(xe, h2g, tail, h2g->info.tail);
> > +	trace_xe_guc_ctb_h2g(ct_to_gt(ct)->info.id, *(action - 1), full_len,
> > +			     desc_read(xe, h2g, head), h2g->info.tail);
> > +
> >   	return 0;
> >   }
> > @@ -934,6 +937,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
> >   	struct guc_ctb *g2h = &ct->ctbs.g2h;
> >   	u32 tail, head, len;
> >   	s32 avail;
> > +	u32 action;
> >   	lockdep_assert_held(&ct->fast_lock);
> > @@ -984,11 +988,13 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
> >   				   avail * sizeof(u32));
> >   	}
> > +	action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1]);
> > +
> >   	if (fast_path) {
> >   		if (FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[1]) != GUC_HXG_TYPE_EVENT)
> >   			return 0;
> > -		switch (FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1])) {
> action can be assigned here instead before condition to return.
action is also used outside the fast_path condition check. So if it is
assigned inside the condition block, it would remain unassigned outside
the condition block if fast_path is not true.

> > +		switch (action) {
> >   		case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
> >   		case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> >   			break;	/* Process these in fast-path */
> > @@ -1001,6 +1007,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
> >   	g2h->info.head = (head + avail) % g2h->info.size;
> >   	desc_write(xe, g2h, head, g2h->info.head);
> > +	trace_xe_guc_ctb_g2h(ct_to_gt(ct)->info.id, action, len,
> > +			     g2h->info.head, tail);
> > +
> >   	return len;
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > index e32f1cad51d9..456c776f4be1 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -520,6 +520,7 @@ DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_exit,
> >   TRACE_EVENT(xe_guc_ct_h2g_flow_control,
> >   	    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
> >   	    TP_ARGS(_head, _tail, size, space, len),
> > +/* GUC */
> >   	    TP_STRUCT__entry(
> >   		     __field(u32, _head)
> > @@ -567,6 +568,48 @@ TRACE_EVENT(xe_guc_ct_g2h_flow_control,
> >   		      __entry->space, __entry->len)
> >   );
> > +DECLARE_EVENT_CLASS(xe_guc_ctb,
> > +		    TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
> > +		    TP_ARGS(gt_id, action, len, _head, tail),
> > +
> > +		    TP_STRUCT__entry(
> > +				__field(u8, gt_id)
> > +				__field(u32, action)
> > +				__field(u32, len)
> > +				__field(u32, tail)
> > +				__field(u32, _head)
> > +		    ),
> > +
> > +		    TP_fast_assign(
> > +			    __entry->gt_id = gt_id;
> > +			    __entry->action = action;
> > +			    __entry->len = len;
> > +			    __entry->tail = tail;
> > +			    __entry->_head = _head;
> > +		    ),
> > +
> > +		    TP_printk("gt%d: H2G CTB: action=0x%x, len=%d, tail=%d, head=%d\n",
> > +			      __entry->gt_id, __entry->action, __entry->len,
> > +			      __entry->tail, __entry->_head)
> > +);
> > +
> > +DEFINE_EVENT(xe_guc_ctb, xe_guc_ctb_h2g,
> > +	     TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
> > +	     TP_ARGS(gt_id, action, len, _head, tail)
> > +);
> > +
> > +DEFINE_EVENT_PRINT(xe_guc_ctb, xe_guc_ctb_g2h,
> > +		   TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
> > +		   TP_ARGS(gt_id, action, len, _head, tail),
> > +
> > +		   TP_printk("gt%d: G2H CTB: action=0x%x, len=%d, tail=%d, head=%d\n",
> > +			     __entry->gt_id, __entry->action, __entry->len,
> > +			     __entry->tail, __entry->_head)
> > +
> > +);
> > +
> > +/* GuC */
> I think this comment not required at end.
Done

Regards,
Bala

> > +
> >   #endif
> >   /* This part must be outside protection */
> 
> -- 
> Regards,
> Haridhar Kalvala
> 
