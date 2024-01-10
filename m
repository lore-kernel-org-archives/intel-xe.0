Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C17FC4707B
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 23:09:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0090F10E5EF;
	Wed, 10 Jan 2024 23:09:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C1C10E5EF
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 23:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704928152; x=1736464152;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BYjamHD8nqWG+iA5zFTJDUcrDchWLTvrcOGGmT/L78I=;
 b=JJZpNp37mzD1x60NAwuvE83605kU9Y541KUl3grZC+spV2er5//lPMzc
 6pfUDTpyN3Qv5BZ2aUWXYEPh9tEZA44Sng+0ExssT9DV0dy5qzMPyXBHH
 75UbkcSh+kkvJOd61Tpvk+oOtMGFwze/ws8tSDSNHCfpl2HG198Rp8zTk
 rYG+S15wVsbc87NPNs0u3hh/yo5YgwYmGHriyC8mIexcI3Ky8O1furAVU
 gtah3jBL0clIToaqkpJBgBWQtZjpr9hEOq+YvcVoaPiwBJEy4tXcSCM0e
 xa0NrR9c64Duw0Vc5TsGFcgAP2RbEXr3QIhdIlmwcN44eJ7TTywwN9pXF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="5413539"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5413539"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 15:09:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="955528631"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="955528631"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2024 15:09:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 15:09:11 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Jan 2024 15:09:11 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Jan 2024 15:09:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtdcW7SnHILSufRe9Si39VuXpFsZ5m0JchbQBNHZj+9rv5cZZ2X2Zt+b/rODMAjrzjspq3n6dc48xX3xIhr6qbbItI5DigvfEyAfQTKwfngHMQ/ymfRXe7zotmxAGLavdVyl31UNY/znt051XCiLslU9q5LFAOLSS+2i3uz1p51wakH29sQN29jDKV8mxPSBK9YR4etzYv+MgpdHU5ydKyVOga8oZ9rJq7Bb6iz2Ov5ID3L6CUdOf2AVZViJnKsy1zHx5XbdB7wBWU82sqELJivHe+gPyzk7QQYyYkzD7oM6ynvot2ZZFv7DDpnDCAMB7qFQRD9PCCZOMNR+TZxhOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvKZ7G4RN2pUNc9UD4eXxk89sxeYCQ7UxMylnJwn9qQ=;
 b=WYl953q5LLum1JWs4Rlwl0Dg4EPXmUAfI7/fFExGVj0SovpnIb+uNbBhYKTE1+4c3rJ7YEBdyWa5EImMomzZV6QDMzVlfRakBQsjTAe+X43CxZUy91+ZSxeG/6JjDnpjFy06L4fTms22m61cssw7UMfDqWIXflHdnsE61lStnE04v+0bJCHrsrls2jA1dxEn/yod1sXsrXGHdDmMjV+xja/qZncDdlhf9pkb7WQzma22Kll7YqYh5fmIAPF2bZfEjd0snrAu2Vn+i/kJl9a5SnsBeyL3t21v58aZOLESB+SeNvjoZT4zMt9sGcdL3GZKROZ3Ww2ytPRIvBr2/QhOhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8425.namprd11.prod.outlook.com (2603:10b6:806:385::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 23:09:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 23:09:09 +0000
Date: Wed, 10 Jan 2024 23:07:55 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/guc: Fix arguments passed to relay G2H handlers
Message-ID: <ZZ8jSw7WdvokR5Rh@DUT025-TGLU.fm.intel.com>
References: <20240110195951.453-1-michal.wajdeczko@intel.com>
 <20240110195951.453-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240110195951.453-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8425:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d7e889-42c7-4842-8c57-08dc123126e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eBDIlZLmxeTVCbpLb4lgYpqB8l0O7amshSOPkGAYPolc84773Fm9DEwjlzcgV0LUFtI13f66OdOajqkmR5GV+JV5tAKRT1DKT56beXuwCYW34K+CAXY/BqPPkvQfAias19141e4QZyKf61/mj3nB21anHwe9hpoc2kA3kJuXhtnbHWENDIn77ijkVYEP+b7bOqf2J1lHIBB04DAFGW18NcIMTzIaJaGbsItmIPmsRAPlaxn+HnhpVIqfOoOYnOW+StBsthL4F/F6pf4O8WHUyugEtFZyWoX9CoVWkB2SByYZu0bi1Q5Z51VAhspHZWt6aYRhGpGYWsSqAbJvrzank0VPSSkDG7vTdIU7q0ZIvmpqZviDifvDS2NBSvLkFvp61yLPPZ1URB9ivHWNworMtxQBraO7OA5/JMiv1SD0OAZ8OlOQHYWx7WvI5NBu4n+Sw6tOJWWI4f3KPIjMkjf74BQUNqQzbrW12G7X9DuUBteE7s56hxjN5iPOruTZLTCW7DVoo38fbMUJezLgzUQ5pCfcwQUjcoISlsTzXoujy6xpuxHPjGInRfmuajWTaPfm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(136003)(39860400002)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(5660300002)(2906002)(41300700001)(86362001)(38100700002)(82960400001)(4326008)(6862004)(6486002)(66556008)(6636002)(6666004)(478600001)(66946007)(66476007)(316002)(8676002)(8936002)(6506007)(6512007)(44832011)(83380400001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nDNJ95RjiEWCXN2jC2Z+yagwWUjws5Xhay57PQ+lq8THhzZDstRyYU57Gu6J?=
 =?us-ascii?Q?0/ce2wrPcFl+eT8kkd6TnS1etuD8jpJtCW+U/19lWVlkVKwSZIl1iXYjGmPp?=
 =?us-ascii?Q?vsRgRpzlAVZx8tCXk/EGJa4RVCSZI+lpi7A13zX7/WXrgVBP8Qt5OSDhcAu1?=
 =?us-ascii?Q?XdGhXPJ2BkDzW8EnV3kNegs1srZzcMGQuUg0YxTCQLtthHal0bRYK2szj+Jt?=
 =?us-ascii?Q?oWtu2nn3/JZMvDTggLADc5aKltxflNK6mh9UmQwiJLx8+kUPzuibv4ynnL+B?=
 =?us-ascii?Q?GM4N5EH1KMYuI4fIoWcmQJx+ddePMwuVweBRnJiWFPCcnKGmXcurd5I1bspM?=
 =?us-ascii?Q?iFnCQ7W2f/FD2+SB1nY0THyAlaxj9hr3vDbZpQxByZH6qI+re+apzpWvNNzO?=
 =?us-ascii?Q?iPxSHWY9o8sJJ/wB04gHYTQLdKIC6w2mIxnhC2Ib2+Yi4GjS+4nnXvIk/gT+?=
 =?us-ascii?Q?75mudatVBW+FemKGJDBIDgswc8gtj430TWLDFpGQQx+ll3fwIhWxnuIt6uJp?=
 =?us-ascii?Q?XefND1nIgsOU4Fw5FQNbnMLwCInAIBunpWYs0nrE8YANPuIX3knucSqvGmJ9?=
 =?us-ascii?Q?ESVP5pj9vrrFGoetqqRo391DKJlH5W7gei9qekG/HFBOD+1HEr+kvn35P8ev?=
 =?us-ascii?Q?SgKQfMNaEuCNyTGLLAEZmidJGCzV4Ig4NybM0cwnKFSn7N5TFOWRP71/dJft?=
 =?us-ascii?Q?p42dtr7piLkrMHvCN7jfR0GSzB2/020EBWbPMokFHlw4ecGVy1DEtczVWQ1I?=
 =?us-ascii?Q?gO2lXBIDc4TB+O5FYTg+xbKuZv5VTCdE8K89hjfNmc/+KPSs6U/OviSfJgfV?=
 =?us-ascii?Q?IGKL19RT+PsQNBqFcdhRrmFANjk5SZFFZzhQOFZ/yplVXcLpAm2y34/RoOGf?=
 =?us-ascii?Q?X0nzzmiubrlwFnX8pr+eSIMurhroYSz2ySzxgxajjNJyaC+BmwB5Lha5lyGF?=
 =?us-ascii?Q?DXuxK5jYN3OIqvvSaCjPu/ffWA8OVCUrr7VyJKEr+IvIqahNdOXuITEE4j1r?=
 =?us-ascii?Q?DgJ6xwyem+7ZusUy1R/vBqZne8dRcdQVKLJVQ18WJvqEXoe1JoMlw7EV/Z2F?=
 =?us-ascii?Q?LLNP8eHV5UiRS6oncJMa9rVX94u5tPSGGRJc9sYiNpzYuRyKVQwe76EvZgLR?=
 =?us-ascii?Q?RwQkIRPKfTF8WBHGF89Woqevkj6SNgei3hoi+CVg80Mcho0o7y4GCn8SAxlx?=
 =?us-ascii?Q?+5kusK24hIXHWFCmy7UfIpaVG4nxmpZia1Ehrtk0zPr05xZv40EP67aBEuve?=
 =?us-ascii?Q?XcZt/MhTUKfTuYLeuldfcrCEHOU6EnfqZntwGKRCvHvjIwoV2F1CgdXoeSdf?=
 =?us-ascii?Q?oNqZi9irRr2xct7k1eOmDxAGa0kzhrmg2lR6JwsNZl9H/iNYO33Jv2Z0mBCF?=
 =?us-ascii?Q?0n9erGk67FNJJ9a884nR4sNZsrhCY9rd+BIoH7v+hoSrAlqKHIunOAzuc1ZI?=
 =?us-ascii?Q?8gu+AGoT6JU/38CwHWXzYn7zYcnFr3zYlnUufR9wvUutEqEZJTvv37XHUVtv?=
 =?us-ascii?Q?JYsk8a5YPj8R1KCApTzbyLuXQs3kzlwc92GyXzm0IyEQlueYQvXlMpICrqw8?=
 =?us-ascii?Q?rpr+aIeqCnVnDTIAy2/nMG50SwsT56SnP/38QH1wTaeVJ6k1Tp4CQ8mhfAWZ?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d7e889-42c7-4842-8c57-08dc123126e4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 23:09:09.6078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aWydzUfAGt0SrI0SbuhoY0SjuZWAs/pDNC+S+rgmas6JihZb2mEfPoQzLvLkCGfZishiePgEgklyxafWUyBPvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8425
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

On Wed, Jan 10, 2024 at 08:59:51PM +0100, Michal Wajdeczko wrote:
> By default CT code was passing just payload of the G2H event
> message, while Relay code expects full G2H message including
> HXG header which contains DATA0 field. Fix that.
> 
> Fixes: 152577060697 ("drm/xe/guc: Start handling GuC Relay event messages")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

FWIW I do think the argument names in xe_guc_relay_process_* functions
should be changed but not going to hold of this fix.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index d6b7020a2d2f..4a0c9ce13bf8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -984,10 +984,10 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  							   adj_len);
>  		break;
>  	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
> -		ret = xe_guc_relay_process_guc2pf(&guc->relay, payload, adj_len);
> +		ret = xe_guc_relay_process_guc2pf(&guc->relay, hxg, hxg_len);
>  		break;
>  	case XE_GUC_ACTION_GUC2VF_RELAY_FROM_PF:
> -		ret = xe_guc_relay_process_guc2vf(&guc->relay, payload, adj_len);
> +		ret = xe_guc_relay_process_guc2vf(&guc->relay, hxg, hxg_len);
>  		break;
>  	default:
>  		drm_err(&xe->drm, "unexpected action 0x%04x\n", action);
> -- 
> 2.25.1
> 
