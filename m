Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD94EDE9AC
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 17:45:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6326A10E8C0;
	Tue, 10 Sep 2024 17:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JPJmFWUN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AE110E8B9
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 17:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725990354; x=1757526354;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Y+0TOuBzi70u13q+Si5ZQP+Wk7u/oHNgcyAs3Qy2P6U=;
 b=JPJmFWUN9NTOcT+h1mNeJILSyjq8cXMN3n2ui9iEK9HmJzvCKJZz8Lbd
 jUGehpEz9oa2ffjv0StGH+b5sukJ0N7DnLDLxFxRhaGC0Dce6v2y7zL5Y
 9/i/bfXffjzfUY5frR5A/spIbrU0bWYnlZzMoWS538bkMjTnHLcC0ONe6
 v/NMsOIuXiliZ4v5ZI8VInGJpex0v7oafssevttOTLktaTQ0GyLhV5GhK
 Qyay6/FlSGYsAxqPvd3HsZ5vQd7wUPhyGKLIYl9LhB6So3GA+Al89BXRI
 zWke1ns9HFu4vl/QInAhdBSmIt2aHsPj4o73++2hhZ420FwrN+1hJd9Xc g==;
X-CSE-ConnectionGUID: lqtHuam/SjG4Hp4Ntz+sAw==
X-CSE-MsgGUID: /mFIUbnKSyWKOSbD4amUbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="42233788"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="42233788"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 10:45:54 -0700
X-CSE-ConnectionGUID: mISfeGvkSRKOAUgvFkuhOQ==
X-CSE-MsgGUID: 0nrs7vM3Rm6c7BUcaj+YqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="67863296"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 10:45:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 10:45:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 10:45:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 10:45:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 10:45:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qFH1hYqVK20Ow5jR4KHwjZ+3mjLraB4vjGCDWc5UjkfGupuk3E9OSsHXndauj4Sax9EoVfaEYoVgYS76TaPUOWSH7jCwSi4xrkFMEzelojoP8PneNsrStUUO3cGDO8GlQMl46QoLduOivkTc4LBtRqr40JIMiC0RFc2e8Gr+IRycFeVKYpcNepJXf0G7JKNpdXm2T/ulHOo7UkVoXOWcSxNnrPeQrum610PGg6R/qB5eX9t+KCjvLcl2L8H/iLJmD8lAjU6DxMJIzAdfXU4n9FY0jK95Ie90vNbpU5rj7NvB2C74eSDM+SGwcj2wKLm/XxFxzEvKe6xF1lU98vQo9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjNnUqKzIYrVq/Yy049UQ5wD2tu+msBMgf29ciKniGs=;
 b=E2VMWHcniH60p516/PelMmjFIfHJcYpvSFOL+Al8JSAOsE9YmrVkrLNJe9cjMvAd13dUyNyyN/JoNkS0ddSYi6DXVJOn0yB8nGjMQ5vUM1BBF7yG7XwmKun040SmeDVOpvoilCme8PGtwS0xImvuqlxbJkM98dqOCK64BQWKjNkjJWjyAMB+iQGg63Tiq6HdAo2mYMF9dgdxiiqcckg3/AtBKjstHF8NKrxyHp098bdII0UstV2jKmtjqiCSrYQCMw20x2OvDz9tz/8FU4rLv8jHH0YY+MO0CM98p6Upq5PxdfjNGEIgkQ02o9PE+x5aq+K96+v4OU+cCqtujL9hOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by IA0PR11MB7259.namprd11.prod.outlook.com (2603:10b6:208:43c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 17:45:50 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 17:45:50 +0000
Date: Tue, 10 Sep 2024 13:45:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>,
 <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/xe/xe_gt_idle: Fix name conflict
Message-ID: <ZuCFyhH5SMSMglSw@intel.com>
References: <20240910142837.636680-1-riana.tauro@intel.com>
 <ZuBdM3qnzcZM_uNK@intel.com>
 <ZuBdll8hFS1bElT6@DUT025-TGLU.fm.intel.com>
 <0732e0c6-d3d1-4886-ba76-11995ca4554b@intel.com>
 <yc4ftt3mt5pvah6kgr2kkq2rv3pf6s7swi3uqp77nd3tyzxloj@fpjowiwgpjxt>
 <ZuCAnYNYC8_ICcKC@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZuCAnYNYC8_ICcKC@intel.com>
X-ClientProxiedBy: MW3PR06CA0011.namprd06.prod.outlook.com
 (2603:10b6:303:2a::16) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|IA0PR11MB7259:EE_
X-MS-Office365-Filtering-Correlation-Id: e701b3d5-1e7e-4882-f50f-08dcd1c068de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3ivipbgrTqETeiGKxZwRfkMV+E2n6paYbB59UwKAXXRmBgDnM2z+fWjUbGlp?=
 =?us-ascii?Q?1aSZpmmI5d5HA/CTjXMQ9eqcGW/AiDBCOCBxCmULvNpb3MraeSD8MvBU+NHo?=
 =?us-ascii?Q?AbBlD/P8IAR+GtzojHikpaefK+Rs+mHZZj5kl0qncQQ9BtESqDWvA33f0/20?=
 =?us-ascii?Q?IVZybtG6Zl0Qob9SJnEaE6NkRJIIe79c+iUzUKmF7lsb9K7vPwznZWLqdBXF?=
 =?us-ascii?Q?WmsIJoRLCIaP24qf6BFqnbLxCl0Iw0fYzM7CyzbBjpA5gL74H/Ol26+E4lYB?=
 =?us-ascii?Q?nuY1dgNmlKvwpJ1WgH27u5WU+hOavs+JyrHjnfGKoCc5dFB5H+a+pI6cSEcs?=
 =?us-ascii?Q?T+dIQ97ami0QeHbj6wOsVK9yStbx84aCKigqyCSUDXqVs5pxHCo19+A9Xat0?=
 =?us-ascii?Q?sf+6jHi/XZ6hgUeupoyvp2pKXylcA/EySN+0roZ3H6ThjYHJm2UgBQtuRBDY?=
 =?us-ascii?Q?XA6P3NNHWsBl+T2ACd9aoNjCnkY8xiN1AZ8uEVtR6Qdg7/9lxxpuS6d4tHyj?=
 =?us-ascii?Q?z6LeWEYvSXD2w8zM7jevJkC2XhZtkPkWb6Rv8p07/9/yC/S/cfu3O07oRKex?=
 =?us-ascii?Q?MgFAZE3IKbox7rRncDuubrX/mp2zuzBQrG2Dq1rsOXjAwJjdTq4AUfNOjtvO?=
 =?us-ascii?Q?BJ5zUh7nNxqx8s9dQf2K1NNCc3IEMfHDkV1ctNZJLT5o9eyfpNqgwRzc8DJY?=
 =?us-ascii?Q?3OlWjPYy+Eh9s4GPcbAM6wJLm2SsjWQ++WSK9zRa9gaOSrXhFcjdzAItt79w?=
 =?us-ascii?Q?aPMHORCRIQhBOgTwePUnvRa2BVrCi4KUgxfN0XWedUq9PSCQ/fdB/DMxXo03?=
 =?us-ascii?Q?wo0Wa8BXIjouE0htj58ty4zcT6BCFe2+MnJZepfr4yiCaK+LnJpUlXepkK1b?=
 =?us-ascii?Q?y/qGFcrar4V/j8AJ2cqjUFpXlFU1uj5ZcG99yqbD4WPlo1U/ZJZEX8piDFjP?=
 =?us-ascii?Q?CXeLrfgcTXZ30tWtIu9U94O869ST3wgJzdOPtvvR1JBGLwYZowTm5hvQgWlJ?=
 =?us-ascii?Q?XhJgVQJXcxKoohoSuqVJJzCTnRt0l5HOjD3wAPLI/7xdiF/wElnoUecr4lnH?=
 =?us-ascii?Q?xLhIhjZEuB0FGfOTWkZ6pPB9wj/qKY7cW3QQX3LlFVWsH32K1/As3AnE8Jqc?=
 =?us-ascii?Q?o7j0igB3TURkgFWfLqq5lxgpFvZhE2JbJjwCXsSVzeHFVW+dKlT5l762uAXN?=
 =?us-ascii?Q?35bg06XkXPbvmgtvFfQHcKvHiCB0uCty8fGJ4z/n+kUZ1CnsL7h4PIrXm+18?=
 =?us-ascii?Q?BP6Xx7EsOvlHQV6R2JIMXmH8bjW78z0ciCP7xNOUg3qPwhMCfMTWd14tOYAq?=
 =?us-ascii?Q?Su4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a2Dnneghe5HHPrRZS2NTbhhkIK3UTZLX6P/OPYTHWEiaNtUh9d5v5v/NR3vh?=
 =?us-ascii?Q?eqwO7YZxKvIkkJCaEtABQqwwM0BaR5E5jE13MZcy4Ya7ngZosrEKmUfyMdGd?=
 =?us-ascii?Q?KZjFXWIafrlp/SKqp19wRPYYFZUcq5bvt/oFXYviwJ8LQLCua8IcV0OODePG?=
 =?us-ascii?Q?6p7n+NwuXxBX22pJD3i2ukgZ7V+T353+7mf4TEcYa8JWg/fgMLTyChfTntzS?=
 =?us-ascii?Q?Kn5rKyHzvTHe1W0cYqcmMEg3RqtWd45blzC8TZ3NK6LIAV68hW0AC7yd82jJ?=
 =?us-ascii?Q?Wt2a1tH21n0EmlEOm2ubELa9RgnOj1KWzfqOuzPXei57gBBtW/5B8dQ7amY9?=
 =?us-ascii?Q?WPoLZwKQ0AQS5hUQyFF7MWau0w+AodBCXcjJF00Np198RTAkZT+dAjhiyOw7?=
 =?us-ascii?Q?+eF6DAxxTVkunzcoals9x1IP5AD4h1DeZDLzy4ZtmLHEL8kr0tZtECvrHTpm?=
 =?us-ascii?Q?qFGZdapdIVsISlYpslieq2JR9oJrAxQBtI9qkc3qk9Z8sjDd0gz71x2MdECA?=
 =?us-ascii?Q?oagdKCPLBOvYmgn1sbPzUoWPvTURYUx0bq/WY7K/BvZ7mHuCPyUPlwItHK9q?=
 =?us-ascii?Q?TNi01SaA1vIipPpGocF0oZ1fXqDRwr7Y7XXJojUp/Ru9cYVOJJ4Qm8ZhaWgB?=
 =?us-ascii?Q?73sTey9Vbb8bIwScxSgunbmN0yo1tWS9bES3JcEtkBrdCb2t5KhFdqvlM5mo?=
 =?us-ascii?Q?IYJnn68JKkp1PQCyXVEI4qKnZacIVlstzZ+EJquDMbDdcQSN8UFHlkFIHMli?=
 =?us-ascii?Q?pF5sFDZG8sgTSAwu+mgdRAK+1Z5hvwUTVniiKlHJ1ByGRu8WcOYEh5fGsu7O?=
 =?us-ascii?Q?mzY6B19kZMcUV7r+bmq6eZJoVmE9Rj2Q/vgyXuj7eLbxDl5ziI4Udrk/KGzF?=
 =?us-ascii?Q?ExILJbn6IzaVdq+m+SabCF4wRftBGemVXYPW5mGHSTA6rsxD1tgHFqoDE9EQ?=
 =?us-ascii?Q?fa8Zwf2MbggywGlk/9z+a8isDTqP3fV7AYTCzplibfkuznnxloF7vfNavr4n?=
 =?us-ascii?Q?QF2/vwtvYjj3gqh1mS+sQHy0VGU+T2IAmumcpsKqJ+bcAaS0TPWLCJ6xwPaF?=
 =?us-ascii?Q?ot3W6JwCH50UBz7EoZPXoZVeYh3cOHq1+R1JENCj9pwKWqXEh/Xqe2key7wC?=
 =?us-ascii?Q?5xBUOivePoniKAx1M1+3Bfk96M/6JYhatXec8bzTicZvIs+xB1DHnlQKMBsi?=
 =?us-ascii?Q?f1SSTjOITtvLfr+jhLautB1RwyOB3HzSKghTMz+AIVDqALea4sO/H2XK7ka8?=
 =?us-ascii?Q?LGWEmlUWljoKVTj+KHR052GooB0VHJp0RFLhznQIDUTFLUZiohJ6Cw/wCSMO?=
 =?us-ascii?Q?irmhyvTpKjRJjSYk+7rCfsAQD0OomRJxVpNbjVs9inNbJXF47k1LaNJJdFdl?=
 =?us-ascii?Q?vxKhgJvXILr8NRncH3J6yOSMuLrarYJTAz6PmbvKdfDO6nbhrfnnDyg0zmoa?=
 =?us-ascii?Q?8zUVEcYzreVIiulAHfMfVv3d6bv7pue97+JAj5mXs2zDYhjCu2j1UxPAdSfh?=
 =?us-ascii?Q?BaueL8ZUh9ll6j5Fri/rBSAPJensJLgD8YUY88PTq2+J3a/apTx+Oc28OqvW?=
 =?us-ascii?Q?O8vhmCJL7qejxRHXTb1CNSQEfSplhgC0cLV4ulb0FCD3XMPAAdaav5okq1qB?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e701b3d5-1e7e-4882-f50f-08dcd1c068de
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 17:45:50.7435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: smgNPpmOflnrimaWCujNDcTx5+4aaovFvqAYfL8YoOukhLq/2Quqkyyqc5i6nkQoPNDh2kNCQYiw7yVkj7rrbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7259
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

On Tue, Sep 10, 2024 at 01:23:41PM -0400, Rodrigo Vivi wrote:
> On Tue, Sep 10, 2024 at 11:48:20AM -0500, Lucas De Marchi wrote:
> > On Tue, Sep 10, 2024 at 09:55:23PM GMT, Riana Tauro wrote:
> > > Hi Rodrigo/ Matthew
> > > 
> > > There was an error when this change was merged to linux-next
> > > https://lore.kernel.org/r/20240909195939.067c1c13@canb.auug.org.au
> > > 
> > > The conflict was because the below commit
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=for-next/hardening&id=3ff37dbb1ae9926d3b51749f7d0d3f474fe2440b
> > > 
> > > Jani suggested to rename or remove it in
> > > https://patchwork.freedesktop.org/patch/612760/?series=136477&rev=5.
> > > 
> > > Removed it for now, will add it once the commit is in the tree
> > 
> > I think this should just be solved as normal merge conflict.
> > 
> > It's already solved in linux-next with the right conflict resolution,
> > which is to drop the local helper from drivers/gpu/drm/xe/xe_gt_idle.c
> > and just use the helper from include/linux/string_choices.h.
> > No need to drop it here and then eventually bringing the same change
> > back.
> 
> Well, indeed. Since the function is exactly the same let's just do it.

On a second thought, this can be bad, because this conflict will need to be
solved over and over again. It is silent (only detected at bug failure).
And the worst part is the inclusion of a line (#include <linux/string_choices.h>)
in the conflict resolution.

> 
> > 
> > Lucas De Marchi
