Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFA7C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 22:47:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C363710E1DC;
	Fri, 12 Jul 2024 22:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iS6NG0XV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C5210E1DC
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 22:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720824419; x=1752360419;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WvLeaKu061OSjBAZ3PcYN/h79CbWuqkL7VjsDF2lv8Q=;
 b=iS6NG0XVGN4HUZvrud8wG0of1KIjFdYAQy2FME7LdvukPWWFMWFVw8kn
 8BCcGceBycTqn181Yy7F3PoiAJ2/7N+/XYmfar0HAw6vmkQTOgtsVE5nU
 H29ZOY8nLXjj0ZvNaxCYEhs6zn/ts4AGHcE1JoWFOutahNpglC+AFp0+B
 4MkG1L3tusGrG8TIxMFIhdt/zCSst68O8B4nJRJnqQUeFCXQJTjced5iB
 /sEeWyew3u7QFhkpm05sgBaGqZMY1QXecNUgDtMSnXn7OG04srbKJLuAh
 vgpJu3isdjR/u/Mpviy65w1tCqc3Vuw8TWA1rJFu+zICyHIgO1wZHrSNM w==;
X-CSE-ConnectionGUID: n5s2qkosTu+aYRkidZrrGQ==
X-CSE-MsgGUID: LxEwe9ReSROMpUBiFuMGbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="35826752"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="35826752"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 15:46:59 -0700
X-CSE-ConnectionGUID: k9rUyuE+REibEF33nbRvNw==
X-CSE-MsgGUID: lsaWCI6cQt+zehZ7AvJovg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="54231594"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jul 2024 15:46:57 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 15:46:57 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 15:46:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 12 Jul 2024 15:46:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 15:46:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l5m0P7LW+lX3X5XMDwodzqWkwvTdWgr/uh3XqOmz/fjzmpXkR+25xJCXyUGh+ymFHImjO7RUuah7qMrWWB8nGjsV6TLeyjHXQQaHcBOo589okeY2sDqF7CCuWvzkcfi6Qnsy3zvkGu9zm/R6oahjqzlnRWO6NQB/bDdgQh84ti0PlYUx8rICPojRyXB2NKQV+jJFgndsCDxboSEJHHYgLl7iaj7IUyuZtoSuboKuPFGqv4A85Fsw+IWcwzmww4SlWvque79tiYqKR3BkRJcNKwPQVIQAhwcvAF6nS+ggGL9hkF7omM+SSZNBwHX73+S7AnCxzcNTpcsmJvLKDbiwCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vczsHdXNA93N6s44h5oXnnq0dV0EsWxkcGE5PphhNH8=;
 b=vIPxjZrL33baTqOU7t5111HP6iDicEYPRIALAGNNn6PCIYfzGPdfwSLCYLSMy42HWDQGUeNjr8Gfdv3HAlyJzwrXBi/O/1pmff/hamoFmSVBW9M5YRNV4xfbSHx1GP6MulkFvMpRkWWzqNADB8lnlUa08MZkstxHtK0WN0mRdUw1mH7LTR2R8wJ96JcT2VdqcGe6fpR3AdZI6pd4IAi2VvFY3NZ+B24NIxKORt5A5qJVuRr16CRHGPSC71mrMOoUUEgcq41PrMSBSSIzQhA4m/o4Tsv0+ldi2gHP/miEmWUQoSDETKjsjjTNqxDaWsZ6nFWktxWr8HGBkUnKPqU9hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6812.namprd11.prod.outlook.com (2603:10b6:303:1ee::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Fri, 12 Jul
 2024 22:46:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7762.024; Fri, 12 Jul 2024
 22:46:53 +0000
Date: Fri, 12 Jul 2024 22:46:03 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC 01/14] drm/xe: Make exec_queue_kill safe to call twice
Message-ID: <ZpGyKxfOgXDnawrN@DUT025-TGLU.fm.intel.com>
References: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
 <20240712212901.2684239-2-daniele.ceraolospurio@intel.com>
 <ZpGqGUsECblGxJCI@DUT025-TGLU.fm.intel.com>
 <ce2b44d0-eaf9-4f00-bff0-170c4bcf5f24@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ce2b44d0-eaf9-4f00-bff0-170c4bcf5f24@intel.com>
X-ClientProxiedBy: BYAPR05CA0061.namprd05.prod.outlook.com
 (2603:10b6:a03:74::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6812:EE_
X-MS-Office365-Filtering-Correlation-Id: 74c9e612-85b8-4840-27c5-08dca2c486aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e+4UkFUPHj8L2+q2+Fjs0W58JmHqObDcVH/tOkm+s/IWOXlNz3Fua+qVqadu?=
 =?us-ascii?Q?Nb4ojVB6Dm9Azxy6PidTl4BJFb2MDhyDi1a60B0dQnQTTSiPdgnW5s3m4f/z?=
 =?us-ascii?Q?HDIbGt83RPQ3+g8fQ3RcfhjKw7NrUDDapDCjJJ7Rr6wBSBkDNg08BCEP3qoo?=
 =?us-ascii?Q?Pi3ed5KIDd+575z/P3SdxcES6rs0DaEavOO25iu2E6n2sKTfkpwuZoWxtu7k?=
 =?us-ascii?Q?vjKePldIdXcY9Xcm13X2chQYJ8lbMHQgyuGN+yIRcugOYDZn+YvXDazOhRd2?=
 =?us-ascii?Q?UIrnvqZnMZmloD3TI3bRfEc6Xg6Rz7l+cr7AP3h1YgM8JUfFo8RyYYvsuqJe?=
 =?us-ascii?Q?jVz5O2IZr+PVDqJpExrRFhyBheBKP4TrLLI3YZdVJRzMx5sPKw5mh76IqIJM?=
 =?us-ascii?Q?rXYilQ/2kJAfTlWbm26dPgUElB+9r9OM2EcoJV2zdg2xfr59ooZkJoLqLoBP?=
 =?us-ascii?Q?O6KsVOgqiXDAYgC4BYDFUQdEJ3dp9pH6AfD2Tvi+Pk525a2kk5jakMthiAUl?=
 =?us-ascii?Q?Ale4EgYQ6SXOCpgQS8KOUVVTRZ+Hvxzy2cTKOyVoZGYL7hAp668esVVu+zWh?=
 =?us-ascii?Q?ONV2GnR5Exj3DCGaPp+u2orsTvyMpvIYgsi8QpflkKiXSrOyDJpzv3jrrQig?=
 =?us-ascii?Q?fnx7YVa4Je02K/pj493U8ddjxkXbWg9OZp4UdoyJqL951/gNF/KoqCfGsAfD?=
 =?us-ascii?Q?dzQNm0Vi99SejEhEiVjNwHiDDeSG4F3CFqbKgdFKsWKTDhLuKI8zXGsXxNxb?=
 =?us-ascii?Q?d9XnzZY6zyhimrrgYrBXx9zyFlThVLzzApiyR5BkskRgxH56sv3cDCrE5D5C?=
 =?us-ascii?Q?efOY29Kn20ULbya9YsGNbYRfnKUObojyOIjcBw3Te1XiRai98Ki3Z+lc4mra?=
 =?us-ascii?Q?0wVom/Cg9AiD4/VPeYdRbFtkZ0XXOTxeMcLJUwBB7SVriN34mt0ky/UkyJzt?=
 =?us-ascii?Q?rnrLtQrlPLjfQ00BiMOM6RCKG7kuKT9yoKbX2qgytBz1Dgv3oq2nvVbmlg6d?=
 =?us-ascii?Q?e7gJpcHjmXrkjfT/A+yxaL7NqgEHp+CK4aW44TKIOtG3IVQCH9yxwa/rSucl?=
 =?us-ascii?Q?eap+1rZZoJjBP/XjbWWpSTZyoYrTYlDXE4OgyqDkrLdExug2vKCm3RA3Xx4u?=
 =?us-ascii?Q?Dd0HgOvCvMowkDCF4oerh8I0aft2MkUV2U6DJckcUDNeEk4BJGOCXXIQCx5y?=
 =?us-ascii?Q?OXda6wB6oi8dP/4vdu1+tzEGpwVtoULo3rXk2XaKQPa3tYb6sJn8u96qqty5?=
 =?us-ascii?Q?D3rJitIvwzPZHhc4low1+vxHupLsjRgiYvDL3zoEMxL06wDXDXUPaiw6XtcZ?=
 =?us-ascii?Q?22IyUNwm6yY6khiRj4Ehi0IcayDS9I7jKXncm6oGQhU6UA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X5zvMsc6e4VkjKJL+3mPufNUoYJ13q98zgr+XjZ+B4/866VItmp2a0Rxzzke?=
 =?us-ascii?Q?gnr2pHy6oFnss+tq+0vGjJ3zGCO6XU8KeJjg0XXbidgY4ON/iibmJDB4AJkp?=
 =?us-ascii?Q?k7g+HBp8Wm1Qz689JUxpztPsdQ8dGVbIV1uMpMxhO283HgofOI9exzet2BYv?=
 =?us-ascii?Q?NenfH2xNqrBWK0bCBKz9bMWYmUDTdvDW2kyGx2am1fj/vHqXlSxb5tlKddlJ?=
 =?us-ascii?Q?zDu9+WNZ8OdQ99yWW1v/WQhIHYvuNIKXY6ulProUEdJDZu7oXy27MmaIKBxz?=
 =?us-ascii?Q?gJRIqSMOCdtiFFbp9hAfTz8fonXqFW48ELRBQuFyw+6qX9d3XgTeJ9ZHPA2w?=
 =?us-ascii?Q?11kx4lTXkkEze7lO/T3KdAWE4ofPyDR7k3XlgQnKTVK36h11oQKgM1wIjvYh?=
 =?us-ascii?Q?ij2ulM84Gbx9qOmC1uD16S6I8gmBEhZ+8NcVC/F6X1YiiLE2fu/G8XqOVHm/?=
 =?us-ascii?Q?HsGfLC67s7fzdHf01IPTqL+KCzfFFGQCgIGON7k2S3hVeh9c5hyNu8HsXCgM?=
 =?us-ascii?Q?Wk0vRcAG9sI9JosLbrLDsFAj0/0wJrLQTgGrZiPhSGJT1pc/is11n9Vi3/XC?=
 =?us-ascii?Q?VAZeRb/Ncu1iCQuim/qg1i5sgoCvd7UWobanbrxResdghh0LCmI+zhd4sX+D?=
 =?us-ascii?Q?v8qAoTFH5WGqKuOYm5JV7ZsnnLVF9D+mdh+XzXK9AzgQc9e7njggBfujyuz9?=
 =?us-ascii?Q?TWfx53IzuwB8E569veZfxmcAwiWmpI0PFXvWqVSYrEswXtAQq10lthazeLCd?=
 =?us-ascii?Q?ypfD8sw61lDvsuog3EH8q3VU+PcNROQI6XFpKtIhP+eQoGDy11c9aEdonNle?=
 =?us-ascii?Q?GceFlOpf6R+7GMM5/HWDGR0YcdoklhW1jhNE/a5860ntpYqc6EMrw1hlpAEb?=
 =?us-ascii?Q?QQy9zdLbf+6Bn2rgiAi98Ctxyir53XGA4hdzQlP9TSiI/+aBoEDUmLawuCHh?=
 =?us-ascii?Q?ipdSjCkIh1IjgBZRxmVTGF4Rzp4jgb+0MHxq3I4taLmHcuDKrSbxUbRydhiw?=
 =?us-ascii?Q?++0MASpbWWeaIUS5LxqM9QoQSAKIMjNFoPvHw+BsOa6BRidNLhvrri3SvY6v?=
 =?us-ascii?Q?YcRkJmbqpfqKRFOu0BEAA+C85nydamUDMly0F+Z6uVWEfrR1qLiTSEtywaPi?=
 =?us-ascii?Q?PC3O6dsj3DcK/2L0Bmuf+acHPQW8D2555Zy3XezWnclQpe3sNjK1P2jYOV15?=
 =?us-ascii?Q?CEFmb+O2lqhz3rIZowBvB2aQLwM+2WiQqoq5cbQU5FdtQLH0wfpeP12YnoLm?=
 =?us-ascii?Q?JzwdD53Zp3NOatIzFi4RipzNUNfCAC6obTuLeRug/rEztL1vRdFZNVq85m7l?=
 =?us-ascii?Q?Qb2RULJT+qzSltJtejHI3r7XpInlZ8YfQZ0rEQmNUc5je0Zm2cIuoKExx9tY?=
 =?us-ascii?Q?8RjcxfcEFFuE9Sd/9E3szy9MzorTC8FXRsQ188YC7eOdZWInYoCPD8FkQ+m3?=
 =?us-ascii?Q?8msr1TgXp4gfMhuM8ZD5Xd39kfYfuXGDGNp8KsggPE8DdhYGk1cr4rjkmClC?=
 =?us-ascii?Q?A1GvQGuYF7wX0vJeCZU998Byja4Y/ig/WGNl4+dQjvpFNOiUCWExi8N2SbnT?=
 =?us-ascii?Q?6b+hek9KHJhaZbSB++xBM6V0TPD6bTcFTSLmbDZlckhn8EHEKQsDXI3g5f6i?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c9e612-85b8-4840-27c5-08dca2c486aa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 22:46:53.7109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FGvQIQoexK9ewrd1eXIPgJJ9qJJv+zi8az4kxfVJulB5kBS+gpEiZ74i6zBPH2qQEaaGvRKNWqS9x/5vzEA5lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6812
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jul 12, 2024 at 03:22:43PM -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 7/12/2024 3:11 PM, Matthew Brost wrote:
> > On Fri, Jul 12, 2024 at 02:28:45PM -0700, Daniele Ceraolo Spurio wrote:
> > > An upcoming PXP patch will kill queues at runtime when a PXP
> > > invalidation event occurs, so we need exec_queue_kill to be safe to call
> > > multiple times.
> > > 
> > > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > Not opposed this patch but is this really required for PXP as PXP queue
> > are not in LR mode are they?
> > 
> > Either way, I'm open to accepting this as xe_exec_queue_kill probably
> > should be safe to call twice anyways.
> 
> Not required for PXP, no. I just really didn't like the idea of calling a
> function twice when it wasn't designed to support multiple calls, even if it
> didn't apply to my specific case.
> 

Fair enough, I think go ahead and send this out by itself with:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Maybe add some kernel doc to xe_exec_queue_kill too if have time
mentioning it is safe to call twice.  

> Daniele
> 
> > 
> > Matt
> > 
> > > ---
> > >   drivers/gpu/drm/xe/xe_vm.c | 6 ++++--
> > >   1 file changed, 4 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 5b166fa03684..02f684c0330d 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -280,8 +280,10 @@ void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
> > >   		return;
> > >   	down_write(&vm->lock);
> > > -	list_del(&q->lr.link);
> > > -	--vm->preempt.num_exec_queues;
> > > +	if (!list_empty(&q->lr.link)) {
> > > +		list_del_init(&q->lr.link);
> > > +		--vm->preempt.num_exec_queues;
> > > +	}
> > >   	if (q->lr.pfence) {
> > >   		dma_fence_enable_sw_signaling(q->lr.pfence);
> > >   		dma_fence_put(q->lr.pfence);
> > > -- 
> > > 2.43.0
> > > 
> 
