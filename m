Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C32C7EE25
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 00:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0039810E57D;
	Thu,  8 Jun 2023 00:12:20 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D6E10E57B
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 00:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686183138; x=1717719138;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fAMRPTH5emZI2MJMid7xA1ea3dWZ1j9T4rPoQ/E3XSg=;
 b=d3l5G+bZZTaDvPPrMaWruQ2hrKuAA3+M/14IojfBXwWXPfbvjIs16H4/
 VI4SnfSKs3AVfarDG/Iv8V/rZLzrINPFA6Y2N8b6CXsLwL9iOuCG2AjN/
 O+ETyyYJ6dFfxdvrdGqDd48JCHiBqbujY6MP3gjeKY5qzzxjQjEJEH0f4
 NVR3LsPXafWc/DtmoaYP0LUWqakRwkqVarcRxc1Ollvy/6Ns8nZ/CBYFg
 Jnqn7JxYUaxkCWNT0mEtnKwrvUzvPxjJQFFA4sT56SDbskZLPLZYqIfyM
 F8ety7/ZqsC+Bi+V53AIh1DGd3O6VL4nLWPex2QOd41cxQsdGrHvcmOHD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="341802835"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="341802835"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 17:12:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="854108373"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="854108373"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 07 Jun 2023 17:12:17 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 17:12:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 17:12:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 17:12:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 17:12:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ch0PNC8L1YDFDvZZoS4eqR1HjtD3wX6RK0nkpV4eBN6R34Rt/laFY+0X8pXSqb3SHRHC1mc27xrPbBYNXMuVOmGlNG+GpWc7bqvpmvM4dsB+PSnbKGsCfOTI5q7OZherSXchR2VyP5u7ewoVNqhq8S9b2vtKBQLmTJKqUJdSmDUcwiDZFcwpXYV7+xJucNRYnwDQoxPwIOXfG9jT+bTpCGb4YCMOyr7TdPYUC2m+SOtQxpXxW60AepbqB0GMgjfu//vErE0YWgiXQiw57KreREMgw9Y0JjPefpG9MJTHKEAl0meScuA30LfWKin2VyppTI1Gb9XL4oA9pU2JtfwibQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVrAoH74PcgKdg4bYFkeEEthz366rwENYeGehQmBGAY=;
 b=UDf65e2TsvuRtTN+xpBu8ybMJdaV0OdJgyyQepSQ1/b66thhZlyhZ61fhIyp7lHOMfegC3E+Q2AwF7YRwUhXY9VlRejKPn+/Y8heY+RuY0CyD6HrEIonDQoyqNLqtBFsQ8db+bIcEjvm8i/AwUXcCUvaU7gmxS9gjGKTYz52W0GfW7mgarFyd+aP7yn958DRM4ZzPS3ZqBuPYzxowy8633FMl2TuiPS1MKS7pHAHo3L0SgEkQOnhAF7sOlQA+IbnBkAvufk2xSwlRS0ktxT6AEnAahCgz4qQXB/st/mUthFYI88g820CQAIlmEHho4tUIRkdQ0cJDAM9K5P2w+vO9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MW4PR11MB8267.namprd11.prod.outlook.com (2603:10b6:303:1e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.36; Thu, 8 Jun
 2023 00:12:14 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 00:12:13 +0000
Date: Wed, 7 Jun 2023 17:12:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <20230608001209.GZ6953@mdroper-desk1.amr.corp.intel.com>
References: <20230525232406.688875-1-gustavo.sousa@intel.com>
 <20230526001038.GJ10045@mdroper-desk1.amr.corp.intel.com>
 <168506366187.3319.4933213415417310598@gjsousa-mobl2>
 <wjqnree2qplqlfkwuzxcfujob53ooe7ccdenzvypymjjecam2u@p23d6xn3mwi3>
 <168539689700.259912.17352008220425971440@gjsousa-mobl2>
 <szxnvedtttjyvxsbcwu5hqs2bw5qz6xlabqueurhy2fwsofd24@lzr5djyebxgu>
 <168545129566.51912.15897016718209439905@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <168545129566.51912.15897016718209439905@gjsousa-mobl2>
X-ClientProxiedBy: SJ0PR05CA0156.namprd05.prod.outlook.com
 (2603:10b6:a03:339::11) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MW4PR11MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce77ef3-ac53-4d24-aa17-08db67b50258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j8EN2HzgHkkC1UCnyPFCGB74z88mt7dnpa5FyWOhBfiY0Do+MHajLrfNRipA8hxAxL2IEyg1YgBUoFdUfQctfb3sGP0tvEEK7H9pIqCkQLUDrqyZRaNRUicoW0t/6+ZBhuxN4YmpFgZUSC0q0/ls0bzrBu2TwY7jRLqYSm3OetKH2MqoeWUUe6FvoU3d6Cd7fkNcrPEwKhXbW0hZa7wLaaE2TxHsF1ylAOf4Z2ojAshePlO2D2R6ojUe3Yw6e3B3bmiUiBpvCK6tZ7Tcbwryt1lRqAXq9efiKVDCeuOr4pz/vsS0XPnt7KtziSHXJ4ct4zN7nzwE678WeHV6jV4MGFH/QWEQqijmPvwe+acwrIksGIsMJguYi7ehR1wPWEav4aKS1XwE4MNgiEBRzxk4xAUPQBbz+4Qps0jHeU96vU7dddiTOK2YA2nSjG2FF4S6gj2yjhL167nP1jZLBqcBIbviUixL6pGGMz2AwvJZvEyWHbPCtGN7Z3IR+nyOK881i2U2mlg405Oi5UNTvDncYPB5bjrA+KrDMHGk7KPSz0FcsIZi7UULYOAgICqluYY6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199021)(186003)(1076003)(26005)(6506007)(6512007)(83380400001)(6486002)(6666004)(2906002)(8936002)(6862004)(33656002)(8676002)(82960400001)(478600001)(38100700002)(6636002)(41300700001)(4326008)(86362001)(5660300002)(316002)(66476007)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JkWn+9ba8c8bdnRRhNZ9Mnj32WvtajBKBqaqMV4ILz5xYCsHO/waDv6MLwob?=
 =?us-ascii?Q?nL2bLicz4OYLf4LAfyp1gVhppxt2QlgMZvV5eucrhb2oCDa2zdEEX4mc0Ift?=
 =?us-ascii?Q?Dmr1E3Dv1K9I9B3Cvkop9imbntDaco29maVc9yU1lkje48lKlL1MgdoUlcTY?=
 =?us-ascii?Q?eIUJUqdqcvB5atECLogSJT302+1Jgu2ueZgfNqOzZFzLlMBnvR9NEONFR/rG?=
 =?us-ascii?Q?xdvT81wzBaLrPlbXfC9rEuoloXxZVYi7zqiGNrvhZPlko/kIkNyjEi4bO1SO?=
 =?us-ascii?Q?ghpKziN+sRD1XwPLPJCj6pBtPsb3vMfuyUtEl4W2wjIi5Wm8zMY3A93Islh4?=
 =?us-ascii?Q?QL/9yd42oF2R7gqvLj9lcGx1Yg3n7FZnF3POq6adv6d+0MTJxeMC3Oopb73s?=
 =?us-ascii?Q?9cbvoAnThrekwOunxY645OYCeTnq9gR26m0bb/LH1YusyM4s/m4naKc9LaIm?=
 =?us-ascii?Q?xcASfFnJplZotZE3HgnpaBrowLyu3m1A3T9VMq/oRkzbGemhREyNNyJW4IFj?=
 =?us-ascii?Q?XojkDibsXkVpJXD9EoB8wV9zu0LSXYizkv30iFLZvAJeSRG0prQQBKUO5ExB?=
 =?us-ascii?Q?azp37f1tCWWYXh6oiZxqVCtPdN0iY+wf3COh1I8nxlmFpeno+hpa65kc8svt?=
 =?us-ascii?Q?sKZr1RgGiqrkt34XbTtZU/neX7KPgZGIe/HzGO/BB8hG6tJ6B6FlGYaABIk7?=
 =?us-ascii?Q?b5gkIZkxzYKTw+VJh6OVdymdU8Ov5GmBIE91d9MvfeebvGLp8IzPB1YQHwHT?=
 =?us-ascii?Q?KjYs0L2TXxbdRnrCagmITWCAk4z+6ycvL/oYcN1wR1SH/RhMNNEGG0jWIqRT?=
 =?us-ascii?Q?HSfWLK1K2zbXdDGD9sJ1FeVf4SCrm60YEP7g24Jc4pOvi5IDqM++tpSDgCBV?=
 =?us-ascii?Q?kM+4GJSna+/UjnDnispW4JK8Goijjq9yP5iyO65fMh2iNRmGPw2H4AYXiGpD?=
 =?us-ascii?Q?yDI3kwkPkT5cqoB+su7hJhGmQXx4FP0rlU94hokfyrR1AHZHHuRchZAdOz8h?=
 =?us-ascii?Q?jRiZQCOC3p3RUFlC0OnpGkolEriuiifjafhdVRxJr5lyxexZ8ytmruaNTKno?=
 =?us-ascii?Q?kTv10TuIqv/UR9UVKx+QoIR/ic4yT+hI3f9mEbzQoi0BpLRBBcjM0ZiwqzmN?=
 =?us-ascii?Q?E9XrvtQMNpwYAE0tn2eySKKUW1tDY6CfQO459ee85JKhbdgMkth3XycumZnS?=
 =?us-ascii?Q?aLfkwUuH1BuaBXMNP6NFFL4zLCu3Walvx5JOVwzad9hiVx/vJoDzLzCEZclP?=
 =?us-ascii?Q?+rvMxcgrtVm54avPTuaQNqann7QPxMGZfc7Xw+V4MvIJbVEb3IVQlY1hD3/e?=
 =?us-ascii?Q?LBh7aF8FNpGx8IMHSopYilfHV891MNiDtIcLBgs5tDwEpMLJ2+qSE+tsAidz?=
 =?us-ascii?Q?xHzdnAjciUzpZkyAlyP6xCi5dIKFzqIfm8D0VcP7j7eG2IuMZ5akyTskBiAy?=
 =?us-ascii?Q?AXe//IUIZto1u6cIYYNC17CLscArRheNE0Q6lwkLLLoLcreEhsF3pgUIexGX?=
 =?us-ascii?Q?5mGwDcTOwVpAdVkaxRdnXmu0vXOAetv6m1cWWJSQkOl2znJsw4gz2P3AS+WW?=
 =?us-ascii?Q?9sGWwU5EXEzINfb2Xc4GRpNrOJLf7nh6iYg71Vf5sUDj1jQ2+4jhsKyo0Kfl?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce77ef3-ac53-4d24-aa17-08db67b50258
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 00:12:13.3065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yXV3PKYOUJL7+XaZOo061mW9t8fO09Nv3iB4pRbsOnnN3dVnyTTqqvSXQ4mDsje1q2iW7NFegkAnEBU9/zh8HW0M4H8yrGqG7/IwbeVHzVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8267
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/reg_sr: Apply limit to register
 whitelisting
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 30, 2023 at 09:54:55AM -0300, Gustavo Sousa wrote:
> Quoting Lucas De Marchi (2023-05-30 01:01:34-03:00)
> >On Mon, May 29, 2023 at 06:48:17PM -0300, Gustavo Sousa wrote:
> >>Quoting Lucas De Marchi (2023-05-26 13:58:22-03:00)
> >>>On Thu, May 25, 2023 at 10:14:21PM -0300, Gustavo Sousa wrote:
> >>>>Quoting Matt Roper (2023-05-25 21:10:38-03:00)
> >>>>>On Thu, May 25, 2023 at 08:24:06PM -0300, Gustavo Sousa wrote:
> >>>>>> If RING_MAX_NONPRIV_SLOTS denotes the maximum number of whitelisting
> >>>>>> slots, then it makes sense to refuse going above it.
> >>>>>>
> >>>>>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> >>>>>> ---
> >>>>>>  drivers/gpu/drm/xe/xe_reg_sr.c | 7 +++++++
> >>>>>>  1 file changed, 7 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> >>>>>> index 0312823101ad..b82f704179a0 100644
> >>>>>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> >>>>>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> >>>>>> @@ -231,6 +231,13 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
> >>>>>>
> >>>>>>          p = drm_debug_printer(KBUILD_MODNAME);
> >>>>>>          xa_for_each(&sr->xa, reg, entry) {
> >>>>>> +                if (slot == RING_MAX_NONPRIV_SLOTS) {
> >>>>>> +                        drm_err(&xe->drm,
> >>>>>
> >>>>>We probably want xe_gt_err() here so that we'll know which GT we hit
> >>>>>this error on.  Also, it wouldn't hurt to pass hwe as a parameter to
> >>>>>this function (instead of mmio_base) and include hwe->name in the error
> >>>>>message here so that we also know which engine ran out of slots.
> >>>>
> >>>>Yeah, makes sense. Arguably, we could simply pass hwe as a single
> >>>>parameter and figure out the rest. Is there any reason not to do that?
> >>>>
> >>>>If the above is something reasonable, I wonder if xe_reg_sr.c is really
> >>>>the correct place to have this function. Maybe it should be something
> >>>>like xe_hw_engine_apply_whilelist()?
> >>>
> >>>As long as xe_reg_sr_apply_mmio() is there, I think we could leave this
> >>
> >>By "there" do you mean "inside xe_reg_sr_apply_whitelist()"? I'm asking
> >>because xe_reg_sr_apply_mmio() is not called by
> >>xe_reg_sr_apply_whitelist().
> >>
> >>Or is "there" the whole file?
> >
> >yes
> 
> Ah, well... It looks to me that xe_reg_sr_apply_mmio() indeed belongs
> here. Now, for the register whitelisting, I wonder if using the
> xe_reg_sr infrastructure is the more correct thing. It works, but
> it feels more like a special case... Maybe we could in the future
> extract a platform/IP matching mechanism out of xe_rtp that can be used
> for different types of actions, with general register programming (i.e.
> rtp) and register whitelisting as two examples.
> 
> I think I'm going a bit off-topic now... So, for this patch, I guess we
> can just keep the function here and make it either (i) receive only the
> hwe or (ii) both the sr reference and hwe. Option (i) looks more correct
> as it avoids redundancy in the parameter list, but at the same time
> feels a bit weird because all exported xe_reg_sr_*() functions receive
> the sr reference.

Option (i) sounds fine to me.  No real need to pass redundant
parameters as long as we can extract the sr from what does get passed.

Thanks.


Matt

> 
> >
> >>
> >>>one in xe_reg_sr.c. If we are going to migrate it somewhere, then
> >>>probably xe_reg_whitelist.c would be a better home so the RING_FORCE_*
> >>
> >>Yeah, that makes sense.
> >>
> >>>are all contained in that unit.... We could then add a func() action and
> >>>remove XE_RTP_ACTION_WHITELIST() too. Not sure sure it's worth though.
> >>
> >>Well, we could at least do the move to xe_reg_whitelist.c for now, and
> >>think about XE_RTP_ACTION_WHITELIST() in another patch eventually.
> >
> >I was meaning more a XE_RTP_ACTION_FUNC() and then it's the caller
> >resposibility to do whatever they want. Similarly to how we have a func
> >for the condition (XE_RTP_RULE_FUNC())
> 
> Yeah, or maybe do (in the future) something like what I'm suggesting
> above: to extract a matching mechanism that can be used for multiple
> purposes.
> 
> --
> Gustavo Sousa

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
