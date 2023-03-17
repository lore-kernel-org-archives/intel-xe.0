Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B5B7C74A5B
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 21:36:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F0010E285;
	Fri, 17 Mar 2023 21:36:06 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92D510E285
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Mar 2023 21:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679088964; x=1710624964;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MSU1350AvzAXGgD/ppCRhwys6IJZI7w/Ogxc1hiIAww=;
 b=BdfUBv79UfG2mLfdrm9SyBUEPdA4Oa2W4bimrqeaAHPigi+A5tjAAplg
 LjhGhqJ78p4uM1Mv9OrLTXP7p4iI9OM9UTR26u1NOewgirjUZXcbr00p0
 sjcT8tTmM0C6+gOvjtLeAeyXXFa5pj8uWtyjlN5N9OdesfyL77gZYPQ9/
 z3yB4rxtda79Nn0UIP2cAEyhxFxoUkTIngUh03O7OvS0j86BgCdGG7zdG
 4NwINC7qqt2G6HI1Dah2MTbxJaKw6tZOAaLAPYJcZZReDqY613SI37pUJ
 Lc80Afl3b5UseYJMU/PiuawMBpPZDSb1J1FO2vPn0HQ8siJ9N8ScjgSS6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="339906197"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; d="scan'208";a="339906197"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 14:36:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="823798982"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; d="scan'208";a="823798982"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 17 Mar 2023 14:36:03 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 14:36:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 17 Mar 2023 14:36:03 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 17 Mar 2023 14:36:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMpMaJjhMBHe/3lCxbosflEE7UHqHFepxlJBZZwEe4E/X+iysqItdEY6WFG12CSpNKj1kwZTvHnFrhK7w38u3j6uw3qi8cqzxrWIqdYsh9JeBdWNe882I8GIHIIsJIwx09Nuy2DsmYpmLqhe3FV0foqwSe4O+vm+OfSYMnqsoxviz4BqZqYsNnfkKGBwnfhXzSjUnR7cnJlG9bSL8A5SXgRNB2ruCbFeV3n2xrqo4smdJz0fPYW6YMVJjia/sexr4GmziavUOdwwYaeHp33SOlsjyDy/ZP+0O/nGodaiM1chHmO98pyrgNtUUKE2QUQKCmqc2IZtxa2hq546sk/gIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pk5r4f6MoTk1Hm1nzFtvuiu1+q/Xrht576kMd5vJEUY=;
 b=YVWC98Rnj0aKP3Kx3RRgxAzyZ4ewjvwZQ0FYt0WFMDR40Kxlozlaqn2xF5yfC+42GDgCyuSrnaWUlgnVfbI/UJVcJNUm8mHNvRBv3fWTyovDOwvAO1RdC8kTopn3NmduermwRuK1gzKtTsIXrB2JlDscP+QYOwEzPc8FPt4HW/kYpmJW3d7F/jkSnzIYPRPp2kaxedvAu0B9gasokQzaILNdOX2LoTAe2XEsoUMmcOzhmixU8f7wZciXgxawMh+QTv2/aWw8JMIPt0ol/joEb5+r50lu7zdoL6zlXvWH/hDD7mKjPfmOZPtrNr3jdql3VYTVOKTJjTONIochXCdOiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4799.namprd11.prod.outlook.com (2603:10b6:a03:2ae::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 21:36:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da%5]) with mapi id 15.20.6178.025; Fri, 17 Mar 2023
 21:36:00 +0000
Date: Fri, 17 Mar 2023 21:35:24 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZBTdHB8gfEYvQN9o@DUT025-TGLU.fm.intel.com>
References: <20230317062213.225989-1-matthew.brost@intel.com>
 <20230317154503.ckbb64gbcxwhzouk@ldmartin-desk2.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230317154503.ckbb64gbcxwhzouk@ldmartin-desk2.jf.intel.com>
X-ClientProxiedBy: SJ2PR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:a03:505::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4799:EE_
X-MS-Office365-Filtering-Correlation-Id: bec65649-1e4d-41d0-314e-08db272f99c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y5sWuyihPhHJVTaZhxaq1Dn6/ARcO7XvDrCk2ESXimJEpNG3WJWFKX3lOE17Hu41QWrMChZ0RXf+K4aFwFnHIbUhhQ/DnbDM+vdXDyfrofmRkAIhkI/7jV5F1hLshMX38+md1kjLoJa7p82ld1yl8inF0kjED8b53MoxXAzl9U9N19YJKDJ4je9xW7vByugCA7ef/3MdNqUEqDAhtpilfCSwMTYtuMck1eX7XZuswwtRz1MeScphLqI9y6+0xs4v4nXdoykomqtBuWN7u/XgSQA9/l6uSJTbIguQ+yZbEVAHscK8NLQhd0kJ6njuh7uOIpfZl8pv3yfTTVpQiKfhrynvsLQLkcPnr4VHQio8VDBPnI0LTyijxqO6wisv/j/Z8h0ky9/M+Dn25Z/5ifkgoEmn6yYQJlhHuDEmD2R/ImUKWNxQdEgKLLfkqKHqxnEzEPk0BnlsZcXfTsodczsdfLgo8uKcSiBdsejqrpfvZbrcYnpVaxWQFGUWIDXq8kKdJGAZLFB5Mmu2pwfJlQ8GFbOXcJlfC/kfHS7V052OWwaPqTt2MDVX1bZYd0wq3KzTRjOIOrEfka0g3N6RrE9sdtUBFhVVjc7NLbzup6KrdbbT9BdW8TFYWEr8jELbJeWbZ76u8Smcqa9CYQ0fNikKgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199018)(4326008)(41300700001)(66476007)(5660300002)(8676002)(2906002)(44832011)(4744005)(86362001)(38100700002)(82960400001)(6486002)(6666004)(478600001)(316002)(66556008)(6636002)(8936002)(6862004)(6512007)(83380400001)(6506007)(66946007)(26005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UlT7D0/nndygOGpUywby5VIeBNUr0YqiO+eL95jwurfjUIv+aVTgaH4V+yj9?=
 =?us-ascii?Q?sKCLC6JMibbKFUj2G9EDGP4OIrWwkHiJ3B14O99T1XM7Glya2GNraGz0lJ30?=
 =?us-ascii?Q?I09Ct5cmFUePTUgITcX9o7HuoiAHsohc9FasLow1HwYOjrI3o1SZLjCsbYt+?=
 =?us-ascii?Q?hSx3L9Hh4Enp7h09n/dVR5oiEDxPjjALACSydcR+LMybOha76j5mSJZtXfOQ?=
 =?us-ascii?Q?5qvYIutRkHSeoDS6qBvi1roj/NFLUC0aMKAIs1EeRB/ueEJ/BknoaJly3iVs?=
 =?us-ascii?Q?4x4p3TeKAL0T4lXl6xxB28v6OpWgYfpUP/8xAYgsLOMaEG89MqiH1MRbc8c2?=
 =?us-ascii?Q?gg0AZ7bA8PleJheP0YwIUxYHOEnO29RwUK1gsStZo0Nl3xpy3EUcL7f8h0FO?=
 =?us-ascii?Q?Rxuhaia1QqU61bpq7E+JFEx0qOoibzvto0HJtNfbdOb/ntJUuh0BurpFqBHq?=
 =?us-ascii?Q?I/qsHuYtTnD3ci2wZvAUMKEZkSIURsDHS7fjRaPNuxoG8r9KJfF7ggvWhoaT?=
 =?us-ascii?Q?Ip8AJy3gXW1JYC2e/V3Qw54zHij62+TcIFtivquhqWqaXr0dCf9yj2XnV0ZX?=
 =?us-ascii?Q?Fh436wca4GF7+bVlYru/s6CWAaJ3h1kmZdLu9W8BvXgbyBYdoCb+c4/X64xr?=
 =?us-ascii?Q?wR6qRfE1hg1VHjUgmUG9z46ZOEapuThXZh1yP7n6IEf2Pdi7NcQO2aGJucWi?=
 =?us-ascii?Q?W5IraxUp3GK3BY4taynU7/Sc88jjvaio0ubxGoyDZRhuemtvq7AU2vyfc4fR?=
 =?us-ascii?Q?GEq+CkBGGj6EwQcZ4yWnvvjAHlPv7k+PIzOjTNWrcH1qPzM072yL3lF4+1iC?=
 =?us-ascii?Q?TmNEmtvJpoqEUqLKY+d6QyPSfNFgasy2DaD19/4VX2EP0WqiCLAfUAXpZDSl?=
 =?us-ascii?Q?YrZAlHx0SFJmaQK2Xyp2Tw6HhbvrqUJOB5fx1T7iXjJ9ep0P0JTxt73hhZmy?=
 =?us-ascii?Q?MXa7jfwJhkmc7onqr8CIYffG98PHilQ2ShZq7pt/MhDLUIAyvRRuMioRbxqF?=
 =?us-ascii?Q?E0pBoL9CjX3jlORgE5aTWh/2+ki9mMnP7SaqqI1aenS05cb7MiKymSQ7sTM5?=
 =?us-ascii?Q?Wp8Lm0NrivF3sDBYdj3s5irqkSEg9Qo8TNlJjvCVsxNx2PUBH/KiljWhurXh?=
 =?us-ascii?Q?tLi0VYjZYQ/5PlWhAujG7DgmZJVPUgeivWRD+an0+xJXW+Jt2W4RaouL/VrI?=
 =?us-ascii?Q?ysthYRxWpRo7OEztHTmJSQlf+2SdVBp1ykhpCsvwtVeWgxkaDocTQYwooDKo?=
 =?us-ascii?Q?TTe1gjkCp8VgcW7sGwtrLes73uq5SDf2cbBFaIzHxfHiXc/tBb40NS3t9ZSR?=
 =?us-ascii?Q?7UCVH8036s94S7Mkp5GBJVKxJtzwGgDV8ZFiuXysHWpZa1dYPUcXeCz9irJG?=
 =?us-ascii?Q?pbT9XJyTjIxJELXWY7KPba7vZp1YwPJULkLfFnyspEWg3rzz1SIba41NvgQt?=
 =?us-ascii?Q?zNJAidMeB8uVTbe+K3/J01MBu/fdQbMYQvhDU/1yEpf3wZZOySAoyUt79BOU?=
 =?us-ascii?Q?MneeK+JDPSb3f+cwpZkuF8vgyajKWz36GCOBBewvhyskPbk+CfI29jMr9sw5?=
 =?us-ascii?Q?FqSP8KSNXrI+GYja+5l3qSI36RQ26pFLxxZZEVl72KJCl417J8OsJLjVlEqG?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bec65649-1e4d-41d0-314e-08db272f99c4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 21:36:00.1337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yrReFS6g0gzc6gN8KlmubUPF2x9n4L7SZhHdAx4G0wKw/jKg4kbzmMpGiC0bD3rH13XZ/ja3yyNVtJj08fC/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4799
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Decrement fault mode counts in
 xe_vm_close_and_put
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

On Fri, Mar 17, 2023 at 08:45:03AM -0700, Lucas De Marchi wrote:
> On Thu, Mar 16, 2023 at 11:22:13PM -0700, Matthew Brost wrote:
> > Rather waiting for the VM to be destroyed (all refs to VM go to zero),
> > drop the fault mode counts when the VM is closed in xe_vm_close_and_put.
> > This avoids a window where user space can create a faulting VM, close
> > it, and a subsequent creation of a non-faulting VM fails.
> > 
> > VLK-45296
> 
> you have garbage leftover here. Please open an issue in gitlab to be
> able to reference it.
> 

So no referencing internal Jiras? I thought iy fine to do so.

Matt 

> Lucas De Marchi
