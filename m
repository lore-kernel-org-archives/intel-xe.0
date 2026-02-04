Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06B0EA7943
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 20:05:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840E310E76E;
	Wed,  4 Feb 2026 20:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oE7EupzE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4894B10E76E
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 20:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770235544; x=1801771544;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ldKpZee2NehLFPhDe6Gh5x90XhB4KdNmCMavk02w0fY=;
 b=oE7EupzEYlDs8viwkAGaRqTw2pzjqhNrD0/eoLIxdupoqudOLjq2o/y8
 cXEzWqFtZQPk1VFytQA42j/NWYyEXy3tChWDzYLLPPuMy661DnHA5bV12
 qDp/Kbeeryr0WgWn0Qch6pNrQQcpYC6+8x1HIxy94Te0VJV3OIpeE7FCc
 H/pEMhbi1fpOhIYBUdL3Ph7EHr3GD3+ceafqM/SoQ4lQ7BEiEbR3lxauw
 8eFx/mz9vjnjNHtM8/ni1jB2UFmUFB/RAZVtjWle9F+A6yAzQm4YCrhDn
 OdfiATBcQMeriDdZjL/lH3wgj0QAgzH/vWfH3GfRJzBzjCvb81a5EXFbu w==;
X-CSE-ConnectionGUID: 9gkLklmhT1K7BVSdug2XcA==
X-CSE-MsgGUID: Rdque4i2TaWZI/S4gyJGGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="89011234"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="89011234"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 12:05:44 -0800
X-CSE-ConnectionGUID: fwhjPhaIRHqFlwHWFJe7TQ==
X-CSE-MsgGUID: zXbdFXw4SE+UEHxUyNupbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="247861576"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 12:05:43 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 12:05:43 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 12:05:43 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.53) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 12:05:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6rtr7JCm5mPo0Zgx76XAyfmAYVwUii5Z/gH1Edf3bac9JPHqgRqcDwO+a/gX6kkZ/4jrwgeXPc+qdS/QZz9j08brDFOIx1quChrN0gkUlbhTIU9lmdyzqepSPaLNQMbotrPAtK3othcH18Q41QAIbahrP082/9sA9xEFKNwtfED29hNN9BsEID+wUHuSROTmEU/NBOPJIokIQAc3Dg+xFHJXjCC7c5zqopzjeS2YhfgvNsF1H19Kn59vbFcM+2uL7jDAP2JHoEMNjrIgqvNBolfO6ngspPIp8Oz4lG3jPN2lJvy1k5WvUYtydY/Yfu7BAWLpSt/W7b2npcN0GwBUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTNsWX+/lpTZXKuA33+zQZ6+MRcFVT7vJUyvED3nDMw=;
 b=FxBCu/B7EYn3eovQFOhqKLd6fyr8PCAn+q0Ves/xHvVhenU94VJyXtEU8fFdHCi2S/racEBNvO0XuQweFCI8n9bDYrW8krQ4QHtgo382M6DMkF/H/CvGe8cyIHeQoOQ+D5twfEkQtVyT8YzSocIvAYQCst8r2DrYZGH+QLIZrZiV2FPqTyaVRxWDKnFDunUo6f1gTWdRnruAWmKmG1Znz9afrnVe5JySpqUn1quH7TOTfDCuirEavd94pMORK14qdagpLXhefOguaIUfq15c/02Q5VSEgAzGD7TkWY51nmA1QR9TuwWHiUMolzeJ5i4/f5tsdM4cE4xsnZaircElwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA3PR11MB7486.namprd11.prod.outlook.com (2603:10b6:806:314::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 20:05:40 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 20:05:39 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Move number of XeCore fuse registers to
 graphics descriptor
In-Reply-To: <20260204002549.3888274-3-matthew.d.roper@intel.com>
References: <20260204002549.3888274-3-matthew.d.roper@intel.com>
Date: Wed, 4 Feb 2026 17:05:35 -0300
Message-ID: <878qd86zqo.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::32) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA3PR11MB7486:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a122111-8109-47ea-3226-08de6428c46f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kwu+LEsHmLDccjuK80YmMtWqn01a4F6JnOAh0TGIsnDmnwTROtaX2ywLzhJM?=
 =?us-ascii?Q?fveTaU4e6LG7ub6F/MtnrUJjavAc3B//zN0YkE+Vnsinkj4kZeQPgGlvDLkj?=
 =?us-ascii?Q?fkvtRfFSEwGvPadpFT8x41NYR3JXLUnUPPBGWa8vtklCktUvC+xTUbCO3BRC?=
 =?us-ascii?Q?aOu//r2mLi4ZOocJLji172Q9NtDRMYUrkkVT4YtSqDIuTVuBKf+z+drgD8S7?=
 =?us-ascii?Q?u/Rqv5lIDKiBbhGd2R3XFctFKgCf4+RQgF+lqnhaaNo+DmksOCj0xjxNb8zl?=
 =?us-ascii?Q?/Xe71KDt92ZYdhJty1h0BYmwxFx0rBUIl881cwvJO94eJDJzB2Td0AsnD1Hg?=
 =?us-ascii?Q?fe1+cNZ17hxPXL8dydLwerfzyrxBjffJ8R5xw1gv8dh1sw0oR3+200jWgIKJ?=
 =?us-ascii?Q?SgWZvTiaawstVY73ZEYe2n0LyXit5P0N+gf7Ax0wZGMfnbydqIQHCPuf6E/2?=
 =?us-ascii?Q?AJ+zo+E2k5mUL+DsPbkFJlCuxHe3NMGF1WM9513rGFsh2gXQwhpqTUXLP2m0?=
 =?us-ascii?Q?k9QoyQI7ccSW78kYcWhC3moVhhXTyPfzebk2tLlmG6DX0MkP2rHbphu1KTPK?=
 =?us-ascii?Q?+7md2NrQ5h07CunKhFAkm4PXlo8Amd5/WQ2Y8TWP1Wrc+jE1W15aU+utkx1/?=
 =?us-ascii?Q?dLIwDGH6rOK0W+aYiNDz+2UbEfsw2PXeFkPWMOmf1lkQEL82QqxvJcGoO4ZN?=
 =?us-ascii?Q?+EBIxAYQAbOEmP4r6qrEywMsRYF4b7jiPpORfh7e9SaREy/HHMW6SR11x8Um?=
 =?us-ascii?Q?PmSAQeloiHcfsK3fDiQqPo5VajbvCqgOcMcjDfPSN665vveSFQWwAzwo8qg+?=
 =?us-ascii?Q?Hc4ZsVbIIrVphCubc9NbtKgQTAYF3eOUkhhLOqVpyg8N2AFgIW3AHFANVchn?=
 =?us-ascii?Q?gQCUExgGa4kq7mDnFVUzmbhwXEDmf5oC9pnir2210j9Di3tJQGx9ywvQ7coO?=
 =?us-ascii?Q?6LuoeJISkrahEkX1a167q56hZ2sX95LgVikBHHojU9DMui8XebH+UR++sxva?=
 =?us-ascii?Q?QVD+br7DcwIuyHhfT3xCuRhwVdwimLF7HGX6yJHdnhkNcxJRLobNWpXGZb1B?=
 =?us-ascii?Q?JaJG753cmJLmykQKLChPYTqkiGlJSNOb2htPcGZPQtdJnEKv63a161AJYvYq?=
 =?us-ascii?Q?MIvxA/IUOMVZC8I8tH2XqFRL2mf5v8OnyA8AHN+lEBm6LixF6TPd15tDkose?=
 =?us-ascii?Q?73WnK++PatVg21TYb6DkdRvxc10KyC6OmecoTS18DkpFKzewXj52BEoo/A0w?=
 =?us-ascii?Q?jzkabPUGbX20uMEzghlKTVHIASKcARXTf/XEQ+p7x2ukEBuWggxt2RCtbanC?=
 =?us-ascii?Q?qH1bGuj87D8YXlRjNBat6N0sVspJGyBSfbsT4D2Y0nGvvEIIhEFY96DbyxXx?=
 =?us-ascii?Q?5Cj/ajMy7qqIxluTACQ/JWNs6i/r2lshDkyss/KhmRLwBuUDNn0TOkLhowlE?=
 =?us-ascii?Q?8Rq7Xn4u2lAyMNPVrDjOJtSFDnHh4fIJEtxq/XPSZkOyFjygfS21uAhC6WOi?=
 =?us-ascii?Q?ZDEcN1FNq6vf/3mSn3xU1b2UMnAnozpxq7VPWPklqh8lr5KC6gYBmNBtJVzd?=
 =?us-ascii?Q?+bxjUnaccW495ee27sA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zwpbdHZnmg/+ABjhwsJE9nvCcmpY5IOFuSDSejHGAsnlbGlpmwfN08US8ZJ6?=
 =?us-ascii?Q?ynxZtVDwZL3XolBUk2Z24xWIFWP/DtkwQfxr8YrXXNIrJLsTjYmZJb+Ins4n?=
 =?us-ascii?Q?lfGpi+NkfLfeYgwi0i/dO8zb1tHtU+soWQPc8OC6MGBLGJdZqTv7TppT+Uct?=
 =?us-ascii?Q?bC7if3mVFUhdIY9w2pV64oaaxladSRoN0a+CZ7BGiUTS/J6bpNpmuVs5fuoy?=
 =?us-ascii?Q?FKd1IiQvoJLODDAcPvqIrpCHDSPa0GhmDj4EizlmPkR+LgpWQB6/+U7CO8Cy?=
 =?us-ascii?Q?AqDPce/Gy83imaIOHNAei9YdsL0Nv91xXNEHV/B1HUdM85RgQzK7bajaGGJY?=
 =?us-ascii?Q?8ca2C4EU5/eGMKybYYzyWtpOsSmG6MqQDL0tA9JOX7RVHmE6Vx6s6Mxt5+1A?=
 =?us-ascii?Q?lKTAHQtmvO+p28Wi2fwaBi1x/1sXxqq/zyRNSbz7ho6R/AvYMYM/t/LBgB7n?=
 =?us-ascii?Q?WvbSgwqgcbbDOi/VKC2zYBPsRwwfIxYV+O5oc8OM0KNEnudaqEAEg/4fW91E?=
 =?us-ascii?Q?8jxQ0ubp3DwnRMY6yY0RymlQwtU7BCICSlfk7e0V8UATzebJXP5rqZtZPPYS?=
 =?us-ascii?Q?XBT8UTlD0omMFy+sbXrE3lzJVuCse0owyv26nMh0sGI6sqnpcCs0WkK09zVx?=
 =?us-ascii?Q?fPr21pv7VziK9ovAyTEcedBvmD7sWerorMsbV5BW1S/sD/76Z+n6q/TaqX9E?=
 =?us-ascii?Q?g41n5dBJkN4Y9ZSfRvsHusgU7OoRzjYqXc3jr6y3ZBIT7GjVf2JOIRrldF50?=
 =?us-ascii?Q?aYvLg4Url/lvh9kmcqewtAgBX1HHIG1ksOhYypGX6BKo3tO92qyz5JjvjrrE?=
 =?us-ascii?Q?as1QTiAQeXfe1jivLdSGepOJY1qWV0qWEz06b+Tmo/dZIYV1D25Y8kubXiUS?=
 =?us-ascii?Q?LDGIzccmBK54oCSZGdSSVkAEAm/lsdyHxzwrcZ5jZMZugJlG0vf2glueGZiK?=
 =?us-ascii?Q?UcB2tULftajojNfRfu7QpkMvgFqOj4uEkruMdyDGpdQDKsqnUFTzX4WwJh9q?=
 =?us-ascii?Q?gMFdXgLrQ9lmfA/ErS/2cu12urW9sIkt0wLmJYR1S/kzzDjKimRYAmLEBWz3?=
 =?us-ascii?Q?JkEhesimPrIh6yTGvOlQ/jWaUSAn/uHpnY3374QgjHl+mYyH9EuPoV3ZTY6H?=
 =?us-ascii?Q?m+RCIW77Et46AKfyp35jR9MYdHiYtSuiF58M2PHyiQ8xb2GVjbn8x1wL0PnL?=
 =?us-ascii?Q?ox6nv6VFNwrvzfNfa7YFHSbjvQ7fsV9g+VQX/7aDGEBJXo8qUxw2r6+/fQHr?=
 =?us-ascii?Q?SeMlynyHXPT9Z8T+t75KitcGpSYol7loUQtAWIA4IaIkgTtIjGwZrct9Pv3D?=
 =?us-ascii?Q?DN2a9wzZx7yZxdDZJ53FeYZaqZ/BOpeLQ3cJkYyhcw5Kjow6LUNoIBUjGCJi?=
 =?us-ascii?Q?Sv8pSQjMdK54GQVeDiadsPNymMFyNtvKLMQ36lftuPNO6C7jfZFAPUumZmmc?=
 =?us-ascii?Q?oBBfJBxJm8f0yPDTchZuW8CcpD1WLZi2ad5aqJUNCMx3Z+26UcViZu5/MGW2?=
 =?us-ascii?Q?5/U15H+AC/hEavJFMjXDu/dPkYmA0SkfiYwhN2jdUFJbZx6aI8lsoKkOkEiA?=
 =?us-ascii?Q?kjSaH3uAvjDSbNUBp3ZsHNtLFwrXVAyJUagoSvqc51pI3+awykbx4PgSy9y2?=
 =?us-ascii?Q?yXkgGNEf/mNFTTZ1P4yN5HBg2v+HsPswbFbFDQ3B8eeFlGxpyNolLAzvFW/z?=
 =?us-ascii?Q?Zjqz1lgCmYAZ8NAl5qMIS2dGJy19pjg62enBpgnUhFjYNLe3uZRn8e1t8eT5?=
 =?us-ascii?Q?TYqMkjna3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a122111-8109-47ea-3226-08de6428c46f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 20:05:39.8786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9KAGRhxNZeNtm6QgYirkMwGVgOmdqQf7roYjRUP58iSi/Ov+fHED1pFWmtUf7lTGaAsh6Cjm7Wjkewyis9ySAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7486
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

Matt Roper <matthew.d.roper@intel.com> writes:

> The number of registers used to express the XeCore mask has some
> "special cases" that don't always get inherited by later IP versions so
> it's cleaner and simpler to record the numbers in the IP descriptor
> rather than adding extra conditions to the standalone get_num_dss_regs()
> function.
>
> Note that a minor change here is that we now always treat the number of
> registers as 0 for the media GT.  Technically a copy of these fuse
> registers does exist in the media GT as well (at the usual
> 0x380000+$offset location), but the value of those is always supposed to
> read back as 0 because media GTs never have any XeCores or EUs.
>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

It would also be nice to add a check in check_graphics_ip() to catch
cases of descriptors in graphics_ips[] missing defining at least one of
those fields.

--
Gustavo Sousa

> ---
>  drivers/gpu/drm/xe/xe_gt_topology.c | 37 ++++++-----------------------
>  drivers/gpu/drm/xe/xe_gt_types.h    | 10 ++++++++
>  drivers/gpu/drm/xe/xe_pci.c         | 12 ++++++++++
>  drivers/gpu/drm/xe/xe_pci_types.h   |  2 ++
>  4 files changed, 31 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index bd5260221d8d..575dcfd5eb9d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -205,24 +205,6 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
>  	}
>  }
>  
> -static void
> -get_num_dss_regs(struct xe_device *xe, int *geometry_regs, int *compute_regs)
> -{
> -	if (GRAPHICS_VER(xe) > 20) {
> -		*geometry_regs = 3;
> -		*compute_regs = 3;
> -	} else if (GRAPHICS_VERx100(xe) == 1260) {
> -		*geometry_regs = 0;
> -		*compute_regs = 2;
> -	} else if (GRAPHICS_VERx100(xe) >= 1250) {
> -		*geometry_regs = 1;
> -		*compute_regs = 1;
> -	} else {
> -		*geometry_regs = 1;
> -		*compute_regs = 0;
> -	}
> -}
> -
>  void
>  xe_gt_topology_init(struct xe_gt *gt)
>  {
> @@ -236,23 +218,19 @@ xe_gt_topology_init(struct xe_gt *gt)
>  		XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
>  		XE2_GT_COMPUTE_DSS_2,
>  	};
> -	int num_geometry_regs, num_compute_regs;
> -	struct xe_device *xe = gt_to_xe(gt);
>  	struct drm_printer p;
>  
> -	get_num_dss_regs(xe, &num_geometry_regs, &num_compute_regs);
> -
>  	/*
>  	 * Register counts returned shouldn't exceed the number of registers
>  	 * passed as parameters below.
>  	 */
> -	xe_gt_assert(gt, num_geometry_regs <= ARRAY_SIZE(geometry_regs));
> -	xe_gt_assert(gt, num_compute_regs <= ARRAY_SIZE(compute_regs));
> +	xe_gt_assert(gt, gt->info.num_geometry_xecore_fuse_regs <= ARRAY_SIZE(geometry_regs));
> +	xe_gt_assert(gt, gt->info.num_compute_xecore_fuse_regs <= ARRAY_SIZE(compute_regs));
>  
>  	load_dss_mask(gt, gt->fuse_topo.g_dss_mask,
> -		      num_geometry_regs, geometry_regs);
> +		      gt->info.num_geometry_xecore_fuse_regs, geometry_regs);
>  	load_dss_mask(gt, gt->fuse_topo.c_dss_mask,
> -		      num_compute_regs, compute_regs);
> +		      gt->info.num_compute_xecore_fuse_regs, compute_regs);
>  
>  	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss, &gt->fuse_topo.eu_type);
>  	load_l3_bank_mask(gt, gt->fuse_topo.l3_bank_mask);
> @@ -330,15 +308,14 @@ xe_l3_bank_mask_ffs(const xe_l3_bank_mask_t mask)
>   */
>  bool xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
>  	xe_dss_mask_t all_dss;
> -	int g_dss_regs, c_dss_regs, dss_per_quad, quad_first;
> +	int dss_per_quad, quad_first;
>  
>  	bitmap_or(all_dss, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
>  		  XE_MAX_DSS_FUSE_BITS);
>  
> -	get_num_dss_regs(xe, &g_dss_regs, &c_dss_regs);
> -	dss_per_quad = 32 * max(g_dss_regs, c_dss_regs) / 4;
> +	dss_per_quad = 32 * max(gt->info.num_geometry_xecore_fuse_regs,
> +				gt->info.num_compute_xecore_fuse_regs) / 4;
>  
>  	quad_first = xe_dss_mask_group_ffs(all_dss, dss_per_quad, quad);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 5318d92fd473..bede105f37b4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -149,6 +149,16 @@ struct xe_gt {
>  		u8 id;
>  		/** @info.has_indirect_ring_state: GT has indirect ring state support */
>  		u8 has_indirect_ring_state:1;
> +		/**
> +		 * @info.num_geometry_xecore_fuse_regs: Number of 32b-bit fuse
> +		 * registers the geometry XeCore mask spans.
> +		 */
> +		u8 num_geometry_xecore_fuse_regs;
> +		/**
> +		 * @info.num_compute_xecore_fuse_regs: Number of 32b-bit fuse
> +		 * registers the compute XeCore mask spans.
> +		 */
> +		u8 num_compute_xecore_fuse_regs;
>  	} info;
>  
>  #if IS_ENABLED(CONFIG_DEBUG_FS)
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index b5e8935fff1d..e3a574835f35 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -52,6 +52,7 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>  
>  static const struct xe_graphics_desc graphics_xelp = {
>  	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
> +	.num_geometry_xecore_fuse_regs = 1,
>  };
>  
>  #define XE_HP_FEATURES \
> @@ -62,6 +63,8 @@ static const struct xe_graphics_desc graphics_xehpg = {
>  		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
>  		BIT(XE_HW_ENGINE_CCS0) | BIT(XE_HW_ENGINE_CCS1) |
>  		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3),
> +	.num_geometry_xecore_fuse_regs = 1,
> +	.num_compute_xecore_fuse_regs = 1,
>  
>  	XE_HP_FEATURES,
>  };
> @@ -81,12 +84,15 @@ static const struct xe_graphics_desc graphics_xehpc = {
>  	.has_asid = 1,
>  	.has_atomic_enable_pte_bit = 1,
>  	.has_usm = 1,
> +	.num_compute_xecore_fuse_regs = 2,
>  };
>  
>  static const struct xe_graphics_desc graphics_xelpg = {
>  	.hw_engine_mask =
>  		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
>  		BIT(XE_HW_ENGINE_CCS0),
> +	.num_geometry_xecore_fuse_regs = 1,
> +	.num_compute_xecore_fuse_regs = 1,
>  
>  	XE_HP_FEATURES,
>  };
> @@ -104,6 +110,8 @@ static const struct xe_graphics_desc graphics_xelpg = {
>  
>  static const struct xe_graphics_desc graphics_xe2 = {
>  	XE2_GFX_FEATURES,
> +	.num_geometry_xecore_fuse_regs = 3,
> +	.num_compute_xecore_fuse_regs = 3,
>  };
>  
>  static const struct xe_graphics_desc graphics_xe3p_xpc = {
> @@ -114,6 +122,8 @@ static const struct xe_graphics_desc graphics_xe3p_xpc = {
>  		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
>  	.multi_queue_engine_class_mask = BIT(XE_ENGINE_CLASS_COPY) |
>  					 BIT(XE_ENGINE_CLASS_COMPUTE),
> +	.num_geometry_xecore_fuse_regs = 3,
> +	.num_compute_xecore_fuse_regs = 3,
>  };
>  
>  static const struct xe_media_desc media_xem = {
> @@ -783,6 +793,8 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
>  	gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
>  	gt->info.multi_queue_engine_class_mask = graphics_desc->multi_queue_engine_class_mask;
>  	gt->info.engine_mask = graphics_desc->hw_engine_mask;
> +	gt->info.num_geometry_xecore_fuse_regs = graphics_desc->num_geometry_xecore_fuse_regs;
> +	gt->info.num_compute_xecore_fuse_regs = graphics_desc->num_compute_xecore_fuse_regs;
>  
>  	/*
>  	 * Before media version 13, the media IP was part of the primary GT
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 8b2ff3f25607..470d31a1f0d6 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -66,6 +66,8 @@ struct xe_device_desc {
>  struct xe_graphics_desc {
>  	u64 hw_engine_mask;	/* hardware engines provided by graphics IP */
>  	u16 multi_queue_engine_class_mask; /* bitmask of engine classes which support multi queue */
> +	u8 num_geometry_xecore_fuse_regs;
> +	u8 num_compute_xecore_fuse_regs;
>  
>  	u8 has_asid:1;
>  	u8 has_atomic_enable_pte_bit:1;
> -- 
> 2.52.0
