Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FD8EE57CF
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 20:54:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C5E10E0AC;
	Wed, 11 Sep 2024 20:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KcQQscJE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5491D10E0AC
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 20:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726088042; x=1757624042;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YUJFp2hjZCebwMYCKPLQRi6zm9/+m5+idcSPHQWhdu4=;
 b=KcQQscJEmUBB56V7+aN9UNC05LjdbTno1tPS0QHBEu4p1+NMrk2rsjEH
 A0aqXPndTtBSOgcroNPY7dyrQIpwX3T++z7gb9Apl0w6W7NbbY5mwZeiU
 LqFtZfg3EsdKr051vloXEgoiRGhTzG8T6doqNvPT9uWG0bQz7F76xEE4m
 i8ufhcPUvFYdnXdexAydDq9WvOBzadEbwKHI0/awPx/7ZnyBqv4BXfJHY
 I4T/xd30t6fD9dEnomJbaJuiCqenApDYJKTsBDdKqGt/PsT8sezSGX0d5
 E9dZ2qX2FiQRyIXqeHdLv9k3yTKkD4nbFhepaEAfuED0GrZtnCrP5nxNf Q==;
X-CSE-ConnectionGUID: 1RKe9LWCQxmYawQIonHY3Q==
X-CSE-MsgGUID: TC4VBTG3ScGKLKp9ilcj0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="42388622"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="42388622"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 13:54:01 -0700
X-CSE-ConnectionGUID: zpUb4IuWRHOFXg5M/LCTtg==
X-CSE-MsgGUID: 2X3ZsyvmSeaZEEY7pupoIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="67483806"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 13:54:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 13:54:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 13:53:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 13:53:59 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 13:53:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vl+6z9Srfa2bws+r9usvrMgdzntOkYvPFhAsuIcgW0pIgw+Cn4SP7SL5zfdIdpRq+qWdxPgjYpnmKKGgepletubR6x5S10EHt3LczqcGGPILv7SvWvY6T5VSiSOGYaTtjorL2S28ZC6y+C3F1EDk9JDVzL1S/JTMhJLNZOKgaIDPvzKaObCGnxssLI2gSrELTUCv8cZui6ZvWkSr6rgKzKEAK2P7LKeE0Rt3hlmljcRTFasvNDXXkx/ghBF8wpisxZCfxEx3gWX+wAPqUzOHDjW0/8QcBBZvtWtTNyH504wMm2mpZB1nX5OF2id+yugtUtC/D7UMjYrF+NJlM+p6Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWN5p+UGpmH0krooOwRdyxa39q3zc4Z60akRprhpPCc=;
 b=CgFCDHM7ndZrcGlvpDnWLsUDaYhCrRHIxNB1IwlihXtKtaC3gme+2T5U/y/kLHBEvnjkTqqF6isKsPZlTTQhSogLGzKiFCZf7CvimhT/luVjSdh9IC5ImVBNe9J0v+Ci6ZY2gqPQ2XIua0/OYJhCXayCs7+Co+mD80ywGWKu4mIruN7sNKRhgcpcbYcJ2JB3e2PdYGUszEb5RFDrA4P5gREW11/BftZOYfN0ulJfse/DrRpuQy4IRmfz7mgxLwrvVJOFUF3Kow88LcfFKhcQdtRAyp13z/14hhYw976n+efL/KXh7++a4ZqNCMNf1uPSLylLWm8M9MFbaZE7yj7c8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SN7PR11MB6995.namprd11.prod.outlook.com (2603:10b6:806:2ae::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 20:53:57 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 20:53:57 +0000
Date: Wed, 11 Sep 2024 16:53:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>,
 <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/xe/xe_gt_idle: Fix name conflict
Message-ID: <ZuIDYRisZaNBOSPQ@intel.com>
References: <20240910142837.636680-1-riana.tauro@intel.com>
 <ZuBdM3qnzcZM_uNK@intel.com>
 <ZuBdll8hFS1bElT6@DUT025-TGLU.fm.intel.com>
 <0732e0c6-d3d1-4886-ba76-11995ca4554b@intel.com>
 <yc4ftt3mt5pvah6kgr2kkq2rv3pf6s7swi3uqp77nd3tyzxloj@fpjowiwgpjxt>
 <ZuCAnYNYC8_ICcKC@intel.com> <ZuCFyhH5SMSMglSw@intel.com>
 <597355ff-611b-48a0-99dc-2c40f5e9c8c9@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <597355ff-611b-48a0-99dc-2c40f5e9c8c9@intel.com>
X-ClientProxiedBy: MW4PR03CA0352.namprd03.prod.outlook.com
 (2603:10b6:303:dc::27) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SN7PR11MB6995:EE_
X-MS-Office365-Filtering-Correlation-Id: f6219e2a-e394-4d3d-f90f-08dcd2a3daba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jrcb816tFby8aG1xuDErfD98qb3/Z7NW4zOHx0/exwb41oMe2lSV9v/alwdo?=
 =?us-ascii?Q?4w5A3m6VApVlLy9YdzN1yrV1hDDDXabXtmRsEx1/A9iXruW8Q1wJYHOaIVO5?=
 =?us-ascii?Q?usqF7UvJnx187jq21oitR6YljX4U9YLuPmGBWAFDzzUpyGsY65RJR0eSHAdy?=
 =?us-ascii?Q?8nLFYn3Gp2tBjuML+YmXRU95ay0gEcU8ClY8+mkJF+Hyp9W2clKyLMvGM63y?=
 =?us-ascii?Q?LFEeTZwAKlAKqigfJrcd9sT1kqNjeAw3q+vvz/W0TdgQt0HyzefhkFZl0NU4?=
 =?us-ascii?Q?RxkZ64fuiykyDAZbMHfN/EM4JpQqaw5G5YYCq7PT+gQLlUUPBNyOGjiDIhf4?=
 =?us-ascii?Q?B4whaRPvoo9BTJSzg/3dcdvvWPsC15D83cGBEsU8Xo7+2+EYMttg5WA0p5ld?=
 =?us-ascii?Q?ssSRV5jVUZ3pqvwGUIfGxXWt/JSbmJn9r+S1oWWi8Vf22Kvr7w6M8nH6DUGY?=
 =?us-ascii?Q?ozpiTFBED39liG4j74JO5iec66R2o7Edc44f7huR5aQKFQrUsQh9TknasnYr?=
 =?us-ascii?Q?cDkKvM8b5ErdWG75x4/NK7yh+v50fIJTu0UbMmfD1U5zLJLHRyGxmH/Plrqg?=
 =?us-ascii?Q?+W+vUPhwtTRflZGQIQfMM+KKbEku8qGmQA+Pto60aQC8H11wj3MB8et+YPDO?=
 =?us-ascii?Q?Y5d9X/1w+DC9sOGm3adk1woG0TVsD9kcakR82dLo9PU00AChIEx+E13uARKQ?=
 =?us-ascii?Q?9Psw6bobROIKnyxenU7c7tkPs0RgXUXT59OYNXOeeGs/UT/JtDefy3KUr69M?=
 =?us-ascii?Q?fb6aTNk5QjqzYrKlLxVyOaLgyTn4gcIrg1L66IpLFUnkT8gxoLPCdAC3lM8E?=
 =?us-ascii?Q?ASb9kQkodSIobTev8+py2Tn4EMgrQWIAYyN5+EhB/O9xZylqrhTBieIEqqD1?=
 =?us-ascii?Q?UpAsGOtQF4XCK/N9Wf9ZilxJ//0110hXeEN1AO/1Wp/OUUQ+B0/BQ3PxJCqz?=
 =?us-ascii?Q?0niN1b7NSoaEXvKLtK0jBnW996j6MYA43EAC2EtZkOARcDoYdRaKghyK2HHD?=
 =?us-ascii?Q?Rlxc/Dvq2fSvR7S5L0rYTXEQV3khnr5jeaNsWdN1Cx8tfDpuVR7xwcp9zsEk?=
 =?us-ascii?Q?+ZvuBxDT0+vNdPH5zCJk7A8tcTKH0yJiV5lg27c9yB3YCmux2znbaQkH4chK?=
 =?us-ascii?Q?c4mIUEat47LNRYx2jyVuqYplvsQALBixXRHwr1A8fvYRlZ9j+CrWX1wikHsT?=
 =?us-ascii?Q?+BMnGOD6Qk3urVj34uhs2Q7Mcme9LO530yhHQX5d6de0WkpJmmGa0bsLGDXb?=
 =?us-ascii?Q?OvdbbrSTKZ9On/cIB4b02q4Z4/zu5OwecJnuQqIS+HWC9tnADvArIP2K3t6X?=
 =?us-ascii?Q?yn4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KNYPqJScIaMs5ieM56zg4BJ/tUnm+t8Nfc7DJM+9lspWe4naB7UJiDEGWlcP?=
 =?us-ascii?Q?yh5EvuzQumxnkydwRFtu2x/davB0lwd6lZeDqLCacOWlEcxlfFv5UOdv27yK?=
 =?us-ascii?Q?ShKcxORejkVT7+3Q+vR4enW5HUkIY3Z6QOxcbdH939D2HNnrOU2hJATQn7Ik?=
 =?us-ascii?Q?PX+fhalfcDT+YfklT8SG6KXbUqpwN8DpLeRiFv+0TUocSOHXFC4h6uAdCX/K?=
 =?us-ascii?Q?q3Phv1jgniUFnJPGUdPM7QEg0xvjB2Nca/y7mhBgft3TMmGigrYql/D2e5db?=
 =?us-ascii?Q?/xTz2pqiq7ZiUUIyPd/lkO9WjP0E2/ctJyVYoIwkxB/OHAz6fbjuM/YLIEgW?=
 =?us-ascii?Q?7xVaZPKoeq9vTfu6qgr6pBHjgIe1INYOVNsrUF63YFC2VmUU2lCBa+jWT5H3?=
 =?us-ascii?Q?QF0QA4+BCTBNPM8AXO6cpykivosDzISDpTdVSGM8IL/uO16qsLT44tmzRVf0?=
 =?us-ascii?Q?+8c4OvUmFG5EvFpPnLgH6iGXZEdaK2UZ00rVZTtKENe77sf2TEhG6pVI3k0l?=
 =?us-ascii?Q?jfbaBEMRKSbdOEVyuaFkDr9wVMpKfru0VRBDaJ1zCINW+HiwH2PusVLmT2z7?=
 =?us-ascii?Q?2CfcVQoAaW9l02vgNDTHGJxSC5oGAzlzDdC3b9Xr/q5mDkX4sq2PYSZW88Xg?=
 =?us-ascii?Q?5+mQHGPybIkDmkbwc+DuJVwtLFfK3KqbsYrl+Zk+DzNRa2qB1ejmsZOsZJzO?=
 =?us-ascii?Q?iDsWEjZCpMAbimM2mXcetn/PUGz3cTbEnQ9I8iuEdzZKduCOl8rW8Nn6AyAM?=
 =?us-ascii?Q?GcsyW1GC2O2HDjD/sUS9F65SitvRQ6N6TkPqOezqJXMSog2tsXu/q2G0PF0Z?=
 =?us-ascii?Q?czoxtbv1fqd0mrVfBbPCiLncjHXGB7oeC2EDea/X+mzksB8XTu5jXeQpFsbJ?=
 =?us-ascii?Q?kAt+DutTwt/b4zp7MXikCrfpkApSAhKQtRrGXAocwremCWDKhmXhn+vWLh+7?=
 =?us-ascii?Q?Hd12EUOXpwQbFnCA40vDKPH1WrMe4pqrMDVCeiIJ8mkCEHqd8ZHT3+b6WcUN?=
 =?us-ascii?Q?b2kdNKsLjz6UPQUmAJZrJqzLPAlEHYy1GDgQK3/0PfH8Y9nRKXvLU3aIThjl?=
 =?us-ascii?Q?u3MaEZ5OwrSBH3PT+Ae/IphO+99ix9aDY9QAtAz+G96Xy47OtzI817H2kkaG?=
 =?us-ascii?Q?K6r78lYD7PG/gbieh93OLOwXqEG3NwUFtBTjHrwG65Y0jPlyWPF5z17SU8IK?=
 =?us-ascii?Q?lzhtxr03rb9y0vdeEWkk6sZH+ZUS27p06tOXDJGNY4640vqvsbUyGLlJM9QX?=
 =?us-ascii?Q?ixnRFq5uSgtYSJehY1eyLaRqx9lKwUN4kwgvo4cQV9n9NfvPL46hvgw5ZKW+?=
 =?us-ascii?Q?Yw51ioSY5/sOIdZ+jLXpFRxBbbRAXm0Blii9lhfPY5ZYsfaAcgw4O/sE9c2Y?=
 =?us-ascii?Q?iIvnv8G1Oc1HtOL/KwJroFFDz1XOuDu4gBcJIVtjp4TxTcJQGhlN1leqivNK?=
 =?us-ascii?Q?j6bDdc07vuePb00D0cxJlHLqWR4f7sJniR+MPcD3bwc2IyZ+w3wTbCH1AUij?=
 =?us-ascii?Q?66vXw0lHy7/LKensxwhl4drgMfXUDcEcQ/e8eKM+IkvVPRzKfchUULD2BYqV?=
 =?us-ascii?Q?QB0zNMfc9wqAmebcpYaW4wcsXYKgWNaLO5l3E9h2Dw4Q0ZUABKg5uDeOiOqY?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6219e2a-e394-4d3d-f90f-08dcd2a3daba
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 20:53:57.3137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6dZ3NfUT0IG4o01ctzhwn1TIYLwOdHJu+y2YCmcFkjK/b4YFCtg19BjxRLGhDn06yt1NMhwbWfYYAEqoeQVOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6995
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

On Wed, Sep 11, 2024 at 12:09:43PM +0530, Riana Tauro wrote:
> 
> 
> On 9/10/2024 11:15 PM, Rodrigo Vivi wrote:
> > On Tue, Sep 10, 2024 at 01:23:41PM -0400, Rodrigo Vivi wrote:
> > > On Tue, Sep 10, 2024 at 11:48:20AM -0500, Lucas De Marchi wrote:
> > > > On Tue, Sep 10, 2024 at 09:55:23PM GMT, Riana Tauro wrote:
> > > > > Hi Rodrigo/ Matthew
> > > > > 
> > > > > There was an error when this change was merged to linux-next
> > > > > https://lore.kernel.org/r/20240909195939.067c1c13@canb.auug.org.au
> > > > > 
> > > > > The conflict was because the below commit
> > > > > 
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=for-next/hardening&id=3ff37dbb1ae9926d3b51749f7d0d3f474fe2440b
> > > > > 
> > > > > Jani suggested to rename or remove it in
> > > > > https://patchwork.freedesktop.org/patch/612760/?series=136477&rev=5.
> > > > > 
> > > > > Removed it for now, will add it once the commit is in the tree
> > > > 
> > > > I think this should just be solved as normal merge conflict.
> > > > 
> > > > It's already solved in linux-next with the right conflict resolution,
> > > > which is to drop the local helper from drivers/gpu/drm/xe/xe_gt_idle.c
> > > > and just use the helper from include/linux/string_choices.h.
> > > > No need to drop it here and then eventually bringing the same change
> > > > back.
> > > 
> > > Well, indeed. Since the function is exactly the same let's just do it.
> > 
> > On a second thought, this can be bad, because this conflict will need to be
> > solved over and over again. It is silent (only detected at bug failure).
> > And the worst part is the inclusion of a line (#include <linux/string_choices.h>)
> > in the conflict resolution.
> Inclusion of the header file is not needed as other functions
> (str_yes_or_no) from same file are used in gt_idle.
> 
> If https://lore.kernel.org/r/20240909195939.067c1c13@canb.auug.org.au would
> be taken eventually, should i just drop the correction?

yeap, please just drop it. Let it be solved in conflict resolution.

> 
> Thanks,
> Riana
> > 
> > > 
> > > > 
> > > > Lucas De Marchi
