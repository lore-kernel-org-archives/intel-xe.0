Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45615C76195
	for <intel-xe@archiver.kernel.org>; Mon, 27 Mar 2023 22:34:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAAB10E783;
	Mon, 27 Mar 2023 22:34:35 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8124910E783
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Mar 2023 22:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679956472; x=1711492472;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XVYvPJS1YSmzVuohBJFDo1UzTBzQRlukg/L8fZKNWfU=;
 b=GYJE7NIwUGI1x7251dbtfHWFAUIeM2aukgKuEdYrOM/UyFK98Q8XMz5c
 9XFraSwh1/CETdNk1Z9EN2cTerIDhCixFZXhxZ02FHej2lDMczfFIW+md
 VmB8PGGH5C+F6BKcJTWFk1QiWxD1Jz2rX0b3/ipCgYQ/DX5FxojP80YII
 +wu5Bhfjy01LHAFM9htq7lZ5kgz/miUN9i74r9y7yTcIZPL3N+dvGUqBA
 WO+p9PvhLJF9SDPPcL/xMOUq8D4aJGIO/EKQ4iwsxtRvebv1wYyiyBMqR
 7OmSqsq83Q8bLKxczYfKD0cbDqT60M29DXHEyLIIqyS5pmjKUnHJU3HwH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="339130464"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="339130464"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 15:34:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="794541882"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="794541882"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 27 Mar 2023 15:34:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 15:34:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 15:34:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 27 Mar 2023 15:34:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 27 Mar 2023 15:34:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OlR3MFQGj2t3CHdYOFuTpW8JnGbp2hs0JXn9OBhP9JOX9EqgqZebcY866zbIYaHRQfjNlx7R90G1lauHQl0vv3K24a+UsBRdOwF8nNgm1X5xl6F0Ym8yEEMoP3l7Q8gpFV5fb7Ovdn5scXOn2oR7DsuXiIqCXOhjlqMQhEO9WqYjReV75pnEfqRlg9vuyXw/28LQue4oJF2bqMF40z17qmKFyEDaDjvQtwjh0shyWqRsaeG4bFNGy0PwMN2qqtekin+q+hIUGi/qW9s/9Y8JpDwesgf4ls31tx9D7T5HoZ2CuEM+LW6aL9iSunGj/XIlp/igBaWHxd3Kb5PNzdooxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LFkC07GOeFuiIv1GqfRGWwYOADSrDeuv72JqfznBvk=;
 b=mBAezyqqtHKF5PhDwruopqTiNUlYwDlDQC+F96bCbqW7nESr6tkisaP3g7T7u1/nZavLRqwHrfijtvdIO3odQRQktu1u0sH4VaQzj7XCPGPnWS4ZhKtHeUccQY7D23hjyBNG2P6cnlZmoCe6eagS1enEep1DdxV351wFZJbrRDtPiXSVkWASZwjbuej3j7XXya5ARUZAQVKImxxFZysNixrkdHcooEr13oDpTxtGiBS19Wqt3A1qPrs+eI10WzbMh0i+jhfbGqP7x7a1zQo03qsxMri1MOO06eNQPUDana842Y3poRX8x9vFx/L1cCF7wHjuS/DSIZEMYImFR3Oqmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SN7PR11MB8263.namprd11.prod.outlook.com (2603:10b6:806:26d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 22:34:29 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%7]) with mapi id 15.20.6178.038; Mon, 27 Mar 2023
 22:34:29 +0000
Date: Mon, 27 Mar 2023 15:34:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Message-ID: <20230327223426.GI1175070@mdroper-desk1.amr.corp.intel.com>
References: <20230327173433.2957645-1-matthew.d.roper@intel.com>
 <20230327215033.cr3fnbibsulfenoo@intel.intel>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230327215033.cr3fnbibsulfenoo@intel.intel>
X-ClientProxiedBy: BYAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::35) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SN7PR11MB8263:EE_
X-MS-Office365-Filtering-Correlation-Id: 36f6d8f4-98ba-49e4-157d-08db2f136da9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YDNuxNfAjQOfq9RyGPAzdfXU6dz1A2lvoPI13WAQNAZ5IEm2EotlJsBKz7Pvcr+eh1wLWL/HPRogLa0FrZdXuYQmgBwHuX8e4+glaxY7+yfDyOOk1LltiqzNhVvEV2ruxfnEjPRvl7b1kxJbT8aoiiPutKyiS3VXgSYkMnsgiWhC4GdDMyMn3kxzljMQ5BvU6a7m8ZTlfOeBo8sUNOukK+TP8sfAhy2qSl0o9Ln90Aq2YgnRb56DSQ+zk2FJkZsNHfP3lJBgey5gXcpQRV9IffSH7vkGaQ8eceA4zdNG/08hqiJq2F/e9LLAhZhACaMIb6oRw9+3a8ElfX0GcoNLQcZj7y++wl3lcaYmTVOVanNYBmlfDEPTRgvt/rs+aYuW7ICqyWmShipmPeyRidRQOdV+sPR+/oLe+1jzODlF6XDU1qlzzqT4Mu0OMdyjtC4ef4yeyOqhnIaYCysHl6ehtuctJjX7yeY81N5zfExdIOeDO0eHDTcJo5Entahjrv1ttrtcu0ggcSgv7rKc6mBf1e8IVYQFWWX2R/k1IRhWXZe5qDfJnmPiHo0qx6uvb1e3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(39860400002)(346002)(376002)(136003)(451199021)(26005)(1076003)(6666004)(6506007)(6512007)(83380400001)(186003)(316002)(66946007)(41300700001)(66476007)(4326008)(8676002)(66556008)(6916009)(6486002)(2906002)(8936002)(38100700002)(5660300002)(82960400001)(33656002)(86362001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vlGcC5AtQJ4pl6EzWlUHk23i/QyQxJPYTZMe2P5MNPGti68aZJm2aNtCCwM2?=
 =?us-ascii?Q?o8B4q8AEkUuohJoQR/kOtd48W2ZYn+5rqsZxVzkh/wF9mQtHy+KJnum8AeZK?=
 =?us-ascii?Q?zZ9wCZGQ1p4ghUlv34V6LMlqqwvcIrR4QCSxAvhnU404zM7FvXXcfDyBiYR2?=
 =?us-ascii?Q?I7CD8JzWHYiDZNU2WOvEyXexHrkyr31S/2J0yyNEUUJNJr9D4TAVV+cMnKRw?=
 =?us-ascii?Q?HKdqoJiYZT2im8tL4f8YXvwPqub8ShhPFluIRltHOMSpILyK5ZrLfVIrfWzP?=
 =?us-ascii?Q?YIbfZpNLegYRJoSWkjqDU5VfZFcIEKQ1JvPuSVJ52GEQj3/aqcRD358tbza4?=
 =?us-ascii?Q?XbnuVDY/nhPqJcanyP6Xbj4JC0svsT+wMZ+6BB7Q24y6edBLOFdY/tXryl0v?=
 =?us-ascii?Q?n8j0+/rxsHLB8WtkNqkPuQRwflpXn/4JGu5Qrw2k0VvKt8O1TYxaQGuxiJHQ?=
 =?us-ascii?Q?QIAeCICV60s+eLz5CrTKiksycgOa5z4aeUsOR8mqfxZRh4i4p/W5NDpzG6zc?=
 =?us-ascii?Q?KcJgzzaP5rhln/n257q+F09/B//jY718+HZe2lmX8ygUoEYQoZv7ZYqIn1B/?=
 =?us-ascii?Q?VKsuuj3f3Chyn7r/9yX+cQHvTVCHbjAnsscqd/MtUFajc5XnFvVN/sDQrBuh?=
 =?us-ascii?Q?ZcN3wOLdEujasAd5IHM+kfKwKqZddxgTSGd88iKD1JBbb2phW4FF4/QqAZCZ?=
 =?us-ascii?Q?ylNe32DIjys2puL/9IeBTdE/wfFdi2M+zimZzYUO1JkkY+H0CsMVeOfaBQpK?=
 =?us-ascii?Q?33YpmpEr9UUaGkychEhVsggCxPd8S1ausMDPsZDtfI8WHONgvPDyd7FwE0HV?=
 =?us-ascii?Q?/o/5zbZITdVLajmrroOjPKTDie/qBJ+iHSi0IPlPm0N/DGZTNXWOL3C4fwnL?=
 =?us-ascii?Q?2OFUZ5WvNDghpqYIi55BmckMkcOuS3jGswbvn31R5ilVzQh/I6Tgs+/Tu1uv?=
 =?us-ascii?Q?vQCd9W+Vxvs8TdPkQ8KyJt/XLaRDIhaoxa7wGCtl+D2AEXqH0zq10O8HED0v?=
 =?us-ascii?Q?uRVK+Q3IDZmLptHyTO101rgtC7NgpTpJa3yzS2IQG0RRueMDzG3GsLwRrMif?=
 =?us-ascii?Q?kvFcl3IB88shtZVBFjn9QYung6ksxNKR1ybgqLNyzPFJaI8FFEdKWV3a8+A8?=
 =?us-ascii?Q?YAciUEHUy0+dS4LTmoCSf2qMxqiIXGZ1wsysIPaJWpuseBKvx2fI0na5atyj?=
 =?us-ascii?Q?KX/vgYjgWxH4Xcg7mx6iIyoasguAHABh4SrZZnTPGHJg9oTgRE+lP4wxo6qd?=
 =?us-ascii?Q?hY4sqz4lCM4p24f5OERKNQUEQTznl2NWSVvKxFmnIxpOUvSS9SNrs2N2ZYtM?=
 =?us-ascii?Q?41JRBzPJz1YAxnZLg6nicATtlmCoGx+LVZ4PP1v14Ds7Sc9NBqBU0Rul55+P?=
 =?us-ascii?Q?YsPZ18uLd7Bpbt8mxPwIUTl/zcGtMDe8omCTLqIPrHMB21y8BwaC3B/pdRSF?=
 =?us-ascii?Q?seUs/GdZTSxGEobZq+JIgly4ufiArlXk+gp9BfLB+tIb39X9UXIY299IH7/S?=
 =?us-ascii?Q?GoFkoLCNPbEREdl5ngXjdTUiHXCYx0Ezc19zv6E0pcfdZb+mLL4UDq/TZnR9?=
 =?us-ascii?Q?UwZDNbf8sEF4ovbr0mOcWPjN6sZQzw3tHQ1CtwcMqWfYxglEStGGanjKIV7T?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36f6d8f4-98ba-49e4-157d-08db2f136da9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 22:34:29.5145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+5OTg1SaMnR6e9gYUAUSiDiG4dn34GpypVAX8XEiZpORab3Z7rlPNBQlvGfcChbG/ps98btDmEJNuSOhKd7teUbtTnkrjFT2npSl9cxWZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8263
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/pat: Handle unicast vs MCR PAT
 registers
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

On Mon, Mar 27, 2023 at 11:50:33PM +0200, Andi Shyti wrote:
> Hi Matt,
> 
> On Mon, Mar 27, 2023 at 10:34:33AM -0700, Matt Roper wrote:
> > Somehow I dropped the error message when sending this; add it back.
> > 
> > To be squashed next time the Xe driver is rebased.
> > 
> > Fixes: 11946af00717 ("drm/xe/pat: Handle unicast vs MCR PAT registers")
> 
> I don't think you need the Fixes tag here as this is not a fix.

True.  But this whole patch will disappear the next time we rebase the
Xe tree so the 'Fixes:' won't propagate anywhere.  Maybe Fixes: wasn't
the best term to use here, but I wanted to give a quick reference to
exactly which patch this is expected to get squashed into that would be
easier than searching for the title.


Matt

> 
> Andi
> 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pat.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> > index a713afdd0510..c860b2122301 100644
> > --- a/drivers/gpu/drm/xe/xe_pat.c
> > +++ b/drivers/gpu/drm/xe/xe_pat.c
> > @@ -94,5 +94,7 @@ void xe_pat_init(struct xe_gt *gt)
> >  		 * raise an error rather than trying to silently inherit the
> >  		 * most recent platform's behavior.
> >  		 */
> > +		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%2d!\n",
> > +			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
> >  	}
> >  }
> > -- 
> > 2.39.2
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
