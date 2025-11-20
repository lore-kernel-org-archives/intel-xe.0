Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09961CF8860
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 14:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18E910E2A5;
	Thu, 20 Nov 2025 14:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bC6LdW20";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5550910E2A5
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 14:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763648731; x=1795184731;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=c3itdTBUtscHL8bHpbg1BY+smPLlVDP4+wxg4CTzgE0=;
 b=bC6LdW20m3r9t9QHQy5gtJvcoTlHHkUSXAP7etgZaPmWbct/RIl8eFe5
 wFRQPEmympfqw70s7lrIym1iCR92A+Lko6uDPXbfdlQt45HSIRu0BvQ7s
 J7cEYSFKRmhF17PjWhxmHYQrx5DQKGdfdOby7LWTD72yfuHZs5xd+0yYi
 m596aIhIVROGcxQgS1j/Pr8GYqL3QyIiodr4DgT/0ye7zoKl+Berr+bBl
 W//KVSKw430cCXAjNB2JAh1C5mLGX8rG8F0e99CXJahlEPJCUh8i7a39H
 fLcTuUVUDPevK570RsGDk/c9mEaJglnZUGyKPCIYIItniud/dVwN7Pugr w==;
X-CSE-ConnectionGUID: LC2hdgK0Qyuodrsjy+lbrg==
X-CSE-MsgGUID: jfwUALfeRXCkfxibh6HNGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="76823785"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="76823785"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 06:25:30 -0800
X-CSE-ConnectionGUID: v3+AUnX4SS+hRP8nshcCSA==
X-CSE-MsgGUID: aSshzSUQSgeTl/VdCv0zPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="191057119"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 06:25:29 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 06:25:29 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 06:25:29 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.36) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 06:25:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azmcl3ymA/YdlhpB3PAKz4JR5ckmaaaFB9xejjiusBdSeGwg70fbk7BmdELUjb6oDY+lPhucRXlQG5N8ZV2TxgKuZEg6b9tbHrONH300pWDuOAPju7c7vDK1muscFczSs0TZp86xoUNksTGZJyNW3F025j/oRsnEpOTsU1XJvr6M7TZq9kdeAFWSznrF93E3byHcWiMjsPOoKywi9eMnJFxdOqiN2Zw1GXJdFLyA7tBxE5690Ebb9inlqUqBtBJUXr0fPcamDXqdmf6Z1TeWu7wu4BlfOga/SxS3NottEV9o1XcKlWZhKKdiI/G5QO0JeN4vhReJTl3o9MkTVoNJ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTb6Tv8S7RCtgXpUGzWJKOoWLeomwdh1FBDx8E4vyFs=;
 b=e9mHH4AYa87CUKkij3zYa2HyTn//Pz4oHY7aot0d2wlPr0rU80rMYZyg66/SRsmpGU5fqVplj02jiEnV9+cw2pG30CZ4QX+eWi1mlur8TWRb/RjWW+xSezYWaU5YT6eyBGoiyqA8lWMnJVWy8ztjrl2EBEan8VJi/6QUr9TSOkH2SGMrZUn55GBrSdPN5o5OhVekzSmen1KdlARfBUcLDT1vL8ZsfDK0LOzKx2eUcTYp6kgiiN1LnXtvClfL013pUR0fveEicEA/Na3zw8S0o24yctkBRNk9SiSKRBPoC0hIVB09xLnvJl/9BQ/CNeJKPIdM9hzCw85A18Fzth/Iqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB7644.namprd11.prod.outlook.com (2603:10b6:510:26a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 14:25:21 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 14:25:21 +0000
Date: Thu, 20 Nov 2025 09:25:17 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <badal.nilawar@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/xe_survivability: Add support for
 survivability mode v2
Message-ID: <aR8kzbSqC55ueu9E@intel.com>
References: <20251112103336.1468261-4-riana.tauro@intel.com>
 <20251112103336.1468261-6-riana.tauro@intel.com>
 <aRTQCoNGUf_D0f1F@intel.com>
 <291ca7a1-51fb-4f28-b1b7-1e4f9d12878c@intel.com>
 <aRZfkujQB1QV9D4v@intel.com>
 <7396b97c-89eb-4716-993a-57a5a08d66a5@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7396b97c-89eb-4716-993a-57a5a08d66a5@intel.com>
X-ClientProxiedBy: SJ0PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::19) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: a251eb75-d049-4743-115d-08de2840a2eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Cs1R9IP2dtWWH0kjMJOmG9wD+7l7G7iAnwI7ytBzDb1uQLyiDoaHINys2AxX?=
 =?us-ascii?Q?BuirApT2PIj+FxMywYALXZQNunk3mGJLR85aCW4xIIAh9vvquFVfKHN4Xr2p?=
 =?us-ascii?Q?lJBbDOAj/X2Byezw+Gfx8tVCpczSUoZER3B5c9ChRq0lig2NLie/nTcJ8FYg?=
 =?us-ascii?Q?14F3OD9X4JfsAw237Epn3F5iLUEZp1PnSaSQKomn2up+jhU6/yHbF3SQ6tP0?=
 =?us-ascii?Q?mcnXTEJ4FOMja4m8DNfWxVa8OwsFD+uLzrw1Uzg+Q32lyKBX7aUCoobX+0/c?=
 =?us-ascii?Q?/kuV9EmgHGKzfRdqCq1AXIQeyiC5sCamnbxb+uBCJK8TtX2c9lN8oQuaH7K0?=
 =?us-ascii?Q?+X/2jATGXmjZ6tDBLhL6LWTtreYqOha8A4JyAGvd+ZBbv1RhFXdLaYoz/y5h?=
 =?us-ascii?Q?v09bjCxJthsdQgL/45oMv4Iu/4tGaPTMpRRIeQe7t6C/UqTXb+unSA/TcIZE?=
 =?us-ascii?Q?HNY2MvE4XSYf1f71pO0fNbeOqKb7/FxqyUJsTRpODP97mYdZ8inzXG27HcIp?=
 =?us-ascii?Q?9Ewvx80e+tCNl1gUNlx3arWF5RN7kAVSa0KmvEFDjufwAiAwwzD+bz4DZ6tK?=
 =?us-ascii?Q?NXHXC9fRqu34gxFZXDlp8yYHmMUKw0mqmrEE0Pajn17wpVM3muQNG8ys9aJ1?=
 =?us-ascii?Q?2DVocs7Te58vzw00xK/S+tUraO0oOkcegOXNKdQkwUOckJ/sQ7ux3vfHcloo?=
 =?us-ascii?Q?BeijyEVVmlHawuZCnzYpyJ4rCTS2EpKL8MxlL0krPJDBZ3S3q62AcN1cN0vK?=
 =?us-ascii?Q?swvlbZjCk7fWLmu9fO5MhTM0xUUCtzNeLoO8F00nNSr/2R97zwPvu9B83eIf?=
 =?us-ascii?Q?r7nxZMX3wimEbSnnLVApCCjcVVwyEAoQY1Na6HG3JHFzW4p/3nCoSJ4XUK+J?=
 =?us-ascii?Q?PCAUT05I3QxZqwXd2ZQ09LpO5PO7NRKRH0AazpUczwQg1LVgR3l32JOwc1mv?=
 =?us-ascii?Q?IPvZTuHCtOApCQcrDlu0xu2GbUzZT+u1qsaSWXoxi75WK+MIVGvF7h8clkxr?=
 =?us-ascii?Q?cHL9xbCNHAt4GONL2e5sWOeGKVGnhHSs+1QhsvYLB5l4CNi8n/2/kVDyMnzW?=
 =?us-ascii?Q?xt3TVWf372gusFzidZxyNK10M396fgRFJRWYGCKMIsPiSc4SXut4lxfduDOY?=
 =?us-ascii?Q?SjIlMg6LaiVIAW0ylels+hBWdHNwRB1Gi3C3oea457X1CYnIh9MMNE6DvLow?=
 =?us-ascii?Q?9meWD8dyP+Kj2BeCXT9ZBQK9Kix6AfNRswOP53DJWwX51w11jpS5QLXls6mO?=
 =?us-ascii?Q?XUO30h+eiTpOyxHHrwk2cPGbL7AADRxdxFtcmy1Y5MMSKL3RA/TpAL9HChto?=
 =?us-ascii?Q?w4WBgAA8+nPfVTMjLLlinSIbkKue1jojZaIz3MzpkmvGVEuZr4jqUvzcRY9P?=
 =?us-ascii?Q?s4TtYL9TkG2sI5F9Ydqm6CdNOj8IzUW+ii3U6Zmrgp00aBRKYNj8PHrVS6PF?=
 =?us-ascii?Q?lNbhHpYbgsFU3Jj6j0i1/VXthaRHKoAn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ovVZ3YP4UK+zTf1Il1z5wHzSRqwXvF1O7dpPqM6NOzS7AsrAMYtloQN3zZqk?=
 =?us-ascii?Q?IJOTlEBipZrMmRaPJRosR8EUOVVwlLihHaEHDMMpBsdzfEdRg3aTbrdvfxNi?=
 =?us-ascii?Q?Bfo7xZ5jUKwVVYQ42FgT9qYwRuSc/Z6lTvVc6bZdeUlDNuXaoh4oITF8jY+e?=
 =?us-ascii?Q?36czy5rgnH8DhqWz1mOeIqWqwEYdtXUPqfU1CXLmNNWF2dzvC38q9FWh95Tv?=
 =?us-ascii?Q?q9TqksHwH4oVcJSouch7xPMpZlnaBdj2BFyyT9RHHhiQBiA1016p7dYMQZYw?=
 =?us-ascii?Q?vN8leztu3QMD4nBF4JhT7TvCnlHkctjIzPTyaj2TwWKueF6M7sEEXpAY9uow?=
 =?us-ascii?Q?RyD3hhft9E+uqjHyiiToJVCGW16jxkIr8KURN0EOqUW2IkWDKIM5+E+SdBJM?=
 =?us-ascii?Q?YqcaMOaAZRz0Y9DFDUq7hqonwGphYLhWuL1E6NFy+vO2zB4kpu5CTBKMekrg?=
 =?us-ascii?Q?fGnGrKLn9Z/OFZEU9Z5WVgjvqesoZrX7nyrQNPZETdMyN5ZUDLC4yINLQ7JU?=
 =?us-ascii?Q?gsGOW8OEve4bIUwvbtbi6+yT+zYlUxPZFWKYGngMKEVM3AukXB4yN1r5AktN?=
 =?us-ascii?Q?OcuXL8w0Gcw/uluv4UH16RbOoEFHmJcTbCvusP1kNndR3qOmpYnI2h0JiyKh?=
 =?us-ascii?Q?uKxOEq5RStoL+YNXOUg/pa6nPjkzb/mHt09td1dgRph/TMWL/fqiYTvYILXv?=
 =?us-ascii?Q?WcA9CPh8eYOa6tO2ZsW6PnwbtuE+KllrXxOE+LtwAzR6/EbKlp1LuV9WFMVT?=
 =?us-ascii?Q?Q5U5xv008QDeYKBikIrZLJxxKZ/vhFIH3e0UNzzAcXREqfj2/itPqoiu7FXV?=
 =?us-ascii?Q?W3OXthOhRYX47Fj1A3Dh/1X6Dy4OdVoLLqz+0Zh93tLoxE088TM0AtJ3aoLW?=
 =?us-ascii?Q?dRebPrz1/Vxkw30HrjWkz9ZEYyGvfcnMvbloEBoIABRzKsEBKiz13yRouDjG?=
 =?us-ascii?Q?Z+iTBHiApH5xBvEoitv35lE3c9bSH85SqiYQ+qS/opSgY6+RXVFwG36Y02uB?=
 =?us-ascii?Q?dN8s0NGPVdv4W+scDYxVm1pc/vnffHJNuZW72NHEEguebqcXT3Hk7sUU/nlv?=
 =?us-ascii?Q?0I75pPSrTtLxI0LcZ0s7g6WY2F4MfuEcEUsykX5TmNXyj9J27wshPNBIxH1J?=
 =?us-ascii?Q?sHvzDr+3s3q9DTtmcPbksMk7IEHGeMs6nRQduCgH5WP8VPaqo0HptQsIHnk2?=
 =?us-ascii?Q?Z47k9cAHfSbYzkKajM+gM6+85CR9G1P3Gm7K5HciibOn/FMZ7nJrzQFfE3ha?=
 =?us-ascii?Q?ePp0NHDQo+9x+TGyHM3DuoODowiQtYHbrx4cxerdElgZswgMzA+UJKbpm673?=
 =?us-ascii?Q?K61ft70AOGQ1TyRgGIEScGUZKAXctMkmXApM868/SVbw8icXyO9hL++Z4teh?=
 =?us-ascii?Q?BdwakZgLYCtxWzSAz/xQjqexQFHk6FtZVKQ2us9p27IKEHKHCJcK5rCnhRpy?=
 =?us-ascii?Q?4dbc0+yAeW1huZHdFetoLwRBgsdVzNYhn7gqHp6xNM8yGWWxW6QY1ipT44me?=
 =?us-ascii?Q?pCTmQWeo3b7VWeAi23FMutOVJ0YYk44omrNfOCDOL/s3714i0oAPHA85wXQO?=
 =?us-ascii?Q?eCaRcA9TMXz+LU6qUlw7QkaHhJDdNRwZQKmBGy/RJJjLQCPpc2Z6WmDbRBjp?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a251eb75-d049-4743-115d-08de2840a2eb
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 14:25:21.1989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1kV/bKB4evAaQskwikjLb9e2PLvKG9JFfZHGXJAg2sGTesSxZCZCfGYvu+lfMGca6BXHs6ErBiafqum5p8rn+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7644
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

On Thu, Nov 20, 2025 at 10:51:25AM +0530, Riana Tauro wrote:
> 
> Hi Rodrigo
> 
> On 11/14/2025 4:15 AM, Rodrigo Vivi wrote:
> > On Thu, Nov 13, 2025 at 01:56:19PM +0530, Riana Tauro wrote:
> > > Hi Rodrigo
> > > 
> > > On 11/12/2025 11:50 PM, Rodrigo Vivi wrote:
> > > > On Wed, Nov 12, 2025 at 04:03:39PM +0530, Riana Tauro wrote:
> > > > > v2 survivability breadcrumbs introduces a new mode called
> > > > > SPI Flash Descriptor Override mode (FDO). This is enabled by
> > > > > PCODE when MEI itself fails and firmware cannot be updated via
> > > > > MEI using igsc. This mode provides the ability to update
> > > > > the firmware directly via SPI driver.
> > > > > 
> > > > > Xe KMD initializes the nvm aux driver if FDO mode is enabled.
> > > > > 
> > > > > Userspace should check FDO mode entry in survivability info sysfs before
> > > > > using the SPI driver to update firmware.
> > > > > 
> > > > > 	/sys/bus/pci/devices/<device>/survivability_info/fdo_mode
> > > > > 
> > > > > v2 also supports survivability mode for critical boot errors.
> > > > > 
> > > > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/xe/xe_pcode_api.h             |  2 +
> > > > >    drivers/gpu/drm/xe/xe_survivability_mode.c    | 41 +++++++++++++++++--
> > > > >    .../gpu/drm/xe/xe_survivability_mode_types.h  |  6 +++
> > > > >    3 files changed, 46 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> > > > > index 92bfcba51e19..d41f07f9194d 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> > > > > @@ -77,11 +77,13 @@
> > > > >    #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
> > > > >    /* PCODE_SCRATCH0 */
> > > > > +#define   BREADCRUMB_VERSION		REG_GENMASK(31, 29)
> > > > >    #define   AUXINFO_REG_OFFSET		REG_GENMASK(17, 15)
> > > > >    #define   OVERFLOW_REG_OFFSET		REG_GENMASK(14, 12)
> > > > >    #define   HISTORY_TRACKING		REG_BIT(11)
> > > > >    #define   OVERFLOW_SUPPORT		REG_BIT(10)
> > > > >    #define   AUXINFO_SUPPORT		REG_BIT(9)
> > > > > +#define   FDO_MODE			REG_BIT(4)
> > > > >    #define   BOOT_STATUS			REG_GENMASK(3, 1)
> > > > >    #define      CRITICAL_FAILURE		4
> > > > >    #define      NON_CRITICAL_FAILURE	7
> > > > > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > > > > index 3d9417911c33..d22fdd08d227 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > > > > @@ -16,6 +16,7 @@
> > > > >    #include "xe_heci_gsc.h"
> > > > >    #include "xe_i2c.h"
> > > > >    #include "xe_mmio.h"
> > > > > +#include "xe_nvm.h"
> > > > >    #include "xe_pcode_api.h"
> > > > >    #include "xe_vsec.h"
> > > > > @@ -66,6 +67,11 @@
> > > > >     *
> > > > >     * - ``aux_info<n>`` : Some failures have additional debug information
> > > > >     *
> > > > > + * - ``fdo_mode`` : To allow recovery in scenarios where MEI itself fails, a new SPI Flash
> > > > > + *   Descriptor Override (FDO) mode is added in v2 survivability breadcrumbs. This mode is enabled
> > > > > + *   by PCODE and provides the ability to directly update the firmware via SPI Driver without
> > > > > + *   any dependency on MEI. Xe KMD initializes the nvm aux driver if FDO mode is enabled.
> > > > > + *
> > > > >     * Runtime Survivability
> > > > >     * =====================
> > > > >     *
> > > > > @@ -95,6 +101,8 @@ enum scratch_reg {
> > > > >    	MAX_SCRATCH_REG,
> > > > >    };
> > > > > +#define FDO_INFO	(MAX_SCRATCH_REG + 1)
> > > > > +
> > > > >    struct xe_survivability_attribute {
> > > > >    	struct device_attribute attr;
> > > > >    	u8 index;
> > > > > @@ -131,6 +139,11 @@ static void populate_survivability_info(struct xe_device *xe)
> > > > >    	set_survivability_info(mmio, info, CAPABILITY_INFO, "Capability Info");
> > > > >    	reg_value = info[CAPABILITY_INFO].value;
> > > > > +	survivability->version = REG_FIELD_GET(BREADCRUMB_VERSION, reg_value);
> > > > > +	/* FDO mode is exposed only from version 2 */
> > > > > +	if (survivability->version >= 2)
> > > > > +		survivability->fdo_mode = REG_FIELD_GET(FDO_MODE, reg_value);
> > > > > +
> > > > >    	if (reg_value & HISTORY_TRACKING) {
> > > > >    		set_survivability_info(mmio, info, POSTCODE_TRACE, "Postcode Trace");
> > > > > @@ -193,6 +206,9 @@ static ssize_t survivability_info_show(struct device *dev,
> > > > >    	struct xe_survivability_info *info = survivability->info;
> > > > >    	struct xe_survivability_attribute *sa = dev_attr_to_survivability_attr(attr);
> > > > > +	if (sa->index == FDO_INFO)
> > > > > +		return sysfs_emit(buff, "%s\n", str_enabled_disabled(survivability->fdo_mode));
> > > > > +
> > > > >    	return sysfs_emit(buff, "0x%x\n", info[sa->index].value);
> > > > >    }
> > > > > @@ -210,13 +226,18 @@ SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
> > > > >    SURVIVABILITY_ATTR_RO(aux_info2, AUX_INFO2);
> > > > >    SURVIVABILITY_ATTR_RO(aux_info3, AUX_INFO3);
> > > > >    SURVIVABILITY_ATTR_RO(aux_info4, AUX_INFO4);
> > > > > +SURVIVABILITY_ATTR_RO(fdo_mode, FDO_INFO);
> > > > >    static void xe_survivability_mode_fini(void *arg)
> > > > >    {
> > > > >    	struct xe_device *xe = arg;
> > > > > +	struct xe_survivability *survivability = &xe->survivability;
> > > > >    	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > > > >    	struct device *dev = &pdev->dev;
> > > > > +	if (survivability->fdo_mode)
> > > > > +		xe_nvm_fini(xe);
> > > > > +
> > > > >    	device_remove_file(dev, &dev_attr_survivability_mode);
> > > > >    }
> > > > > @@ -227,12 +248,16 @@ static umode_t survivability_info_attrs_visible(struct kobject *kobj, struct att
> > > > >    	struct xe_survivability *survivability = &xe->survivability;
> > > > >    	struct xe_survivability_info *info = survivability->info;
> > > > > -	if (info[idx].value)
> > > > > +	/* FDO mode is visible only when supported */
> > > > > +	if (idx >= MAX_SCRATCH_REG && survivability->version >= 2)
> > > > 
> > > > should we also make the version a file inside survivability_info?
> > > > for explicit check instead of implicit?
> > > 
> > > Are you suggesting that we had version in the sysfs and let the user check
> > > both version and fdo_mode entry before deciding?
> > 
> > nevermind, I think I might had missunderstood the flow...
> 
> We can remove the implicit check for visibility and expose fdo mode
> irrespective of the version. The value would be 'disabled' by default
> 
> Is that okay?
> 
> But i think it would be better to expose it only when it's supported

I agree with you. Sorry for the noise.

> 
> > 
> > > 
> > > > 
> > > > > +		return 0400;
> > > > > +	else if (info[idx].value)
> > > > >    		return 0400;
> > > > >    	return 0;
> > > > >    }
> > > > > +/* Attributes are ordered according to enum scratch_reg */
> > > > >    static struct attribute *survivability_info_attrs[] = {
> > > > >    	&attr_capability_info.attr.attr,
> > > > >    	&attr_postcode_trace.attr.attr,
> > > > > @@ -242,6 +267,7 @@ static struct attribute *survivability_info_attrs[] = {
> > > > >    	&attr_aux_info2.attr.attr,
> > > > >    	&attr_aux_info3.attr.attr,
> > > > >    	&attr_aux_info4.attr.attr,
> > > > > +	&attr_fdo_mode.attr.attr,
> > > > >    	NULL,
> > > > >    };
> > > > > @@ -301,11 +327,18 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
> > > > >    	if (ret)
> > > > >    		goto err;
> > > > > +	if (survivability->fdo_mode) {
> > > > > +		ret = xe_nvm_init(xe);
> > > > > +		if (ret)
> > > > > +			goto err;
> > > > 
> > > > should we really fail the survivability mode here?
> > > > Or keep the survivability mode with some indication that fdo/nvm has failed?
> > > 
> > > FDO mode is only enabled when MEI path to update firmware is not available
> > > due to some error in MEI.
> > > 
> > > If initializing SPI also fails then user cannot update firmware in
> > > survivability mode. Staying in survivability mode will not be helpful
> > > since both paths are unavailabe. That's why added the fail
> > 
> > But then you also fail the probe anyway right?
> 
> yeah this would fail probe. That should be expected since both fw update
> paths are unavailable

Cool, thanks for the confirmation and explanations.

Thanks,
Rodrigo.

> 
> Thanks
> Riana
> 
> > 
> > > 
> > > I should remove failing on mei_init instead. Missed that. Thank you for
> > > the review comment. Will fix it in new rev
> > > 
> > > Thanks
> > > Riana
> > > > 
> > > > > +	}
> > > > > +
> > > > >    	dev_err(dev, "In Survivability Mode\n");
> > > > >    	return 0;
> > > > >    err:
> > > > > +	dev_err(dev, "Failed to enable Survivability Mode\n");
> > > > >    	survivability->mode = false;
> > > > >    	return ret;
> > > > >    }
> > > > > @@ -436,8 +469,10 @@ int xe_survivability_mode_boot_enable(struct xe_device *xe)
> > > > >    	if (ret)
> > > > >    		return ret;
> > > > > -	/* Log breadcrumbs but do not enter survivability mode for Critical boot errors */
> > > > > -	if (survivability->boot_status == CRITICAL_FAILURE) {
> > > > > +	/*
> > > > > +	 * v2 supports survivability mode for critical errors
> > > > > +	 */
> > > > > +	if (survivability->version < 2  && survivability->boot_status == CRITICAL_FAILURE) {
> > > > >    		log_survivability_info(pdev);
> > > > >    		return -ENXIO;
> > > > >    	}
> > > > > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> > > > > index 1ed122cf62f2..d887b443b397 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> > > > > @@ -37,6 +37,12 @@ struct xe_survivability {
> > > > >    	/** @type: survivability type */
> > > > >    	enum xe_survivability_type type;
> > > > > +
> > > > > +	/** @fdo_mode: indicates if FDO mode is enabled */
> > > > > +	bool fdo_mode;
> > > > > +
> > > > > +	/** @version: breadcrumb version of survivability mode  */
> > > > > +	u8 version;
> > > > >    };
> > > > >    #endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
> > > > > -- 
> > > > > 2.47.1
> > > > > 
> > > 
> 
