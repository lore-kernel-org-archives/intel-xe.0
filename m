Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E894C7EE2A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 20:33:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E721610E121;
	Wed, 25 Jun 2025 20:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EysdNRsM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E3910E121
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 20:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750883594; x=1782419594;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GiI2I/AnPbFCmCvUqdsNi/G4ftqzpW1I4aOFHZApqcM=;
 b=EysdNRsMfngsrEg6zGSST7FMVlu9gEWgoJnAza38AGZVUJ7L/a4m0apZ
 hSuJxZzakgtpbOFMkB1rl7PEKZ2KiZvHbhddk4y0rczp4+CiwQt7DdyZn
 X7zZ6Dsst4FfhkAsXBOHHrdKEi1wIucqJFuBR+w/EDMhIU9IUMmSFW8rJ
 VPF6g8rCX2z44caGyq+c0XrdqramSHytqN4XGgXN2okYybKZ/JgbrJUrw
 MKcVrDlLWsmizeRTpyfo0Wbn+EjZNqFdSN5A3OiAAPJj007M2RRXaKv9P
 n/H8L+936/wBqjuSObrz8Wk6vraZgOr6J+dgMrZM1f665q2BkJtl39O7H w==;
X-CSE-ConnectionGUID: Pl1c07RDSDiXyPogJpg9hg==
X-CSE-MsgGUID: l8pLe/0+Rp6aTaby530Taw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="70601545"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="70601545"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 13:33:12 -0700
X-CSE-ConnectionGUID: VJgbcTFGRQ+XhnJ4sqGFgw==
X-CSE-MsgGUID: 5rf1sx/uQjqH4q6nwbX3gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="152495934"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 13:33:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 13:33:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 13:33:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.45)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 13:33:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tC3dD2hczVadhxLkqYM/+wweCUDVtL6ir2eoVnS3HN4CQQHvugF5opZa2oS/0PqeXjSXxOm3/HOgr6K9XkwZARYy/kXFBIM5gMW/08Sygov1+pM5ucKTJjXVSD05P1t1jUf6olNeb4Lu2f8AYDapLGuAZRsLsTwrCDydeAF9vlGFwQQspbpnafrP3NwLOiJPqqZ+gVP9VYrD/oNr3PaL76E7IQxzGf6Lu8mOsoDLN/7xDkR58KMqAltqwIfmlVigdj0yr+TMPbE2Q7/4H5eStrvbGvyeTUjmS3eJzHOhBLtRS2Vm9OAtgvgaBre3VwU528YfaKXCTq6JlqJJ40cjdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qipAC8wcnyzMXgyN+nepPqeyQ/FP/9+/jooMH4M65I=;
 b=EjwhLgMcW8dVWlSecCyjZJrr/X9RviW6Xt/lil9oeHtUgsmdEn44FS/vYM9t8iQ6QeJqZhhNtWayhIw09XuyfOQUyN9DYHxRF4+3DjcnTEVAz7Rmi4thEQb8qp7mAySQxjqQLwRtoggN0qEuLtaFk0HjJkTIae0UNQGW1aZwqxpnwX2zZJVRLN9/iqBLhorus8UzisxIBrSqLO4E+gGZQFAvF0X9MgN6q7TZGV6Mjllop7WOyzWQ8zYQCbXQRl6aOrq7SmLmtWEmrlmjPmnEJdqwqWrgRzmIUEGcp+wHxkyEsdWGGVPgpciPvoVuWnY+zF9TDFDCHXwRYO+kSLyy0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB4914.namprd11.prod.outlook.com (2603:10b6:303:90::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 20:33:08 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 20:33:08 +0000
Date: Wed, 25 Jun 2025 13:33:06 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3 5/5] drm/xe: disable wa_15015404425 for PTL B0
Message-ID: <20250625203306.GH4868@mdroper-desk1.amr.corp.intel.com>
References: <20250625193340.38971-1-matthew.s.atwood@intel.com>
 <20250625193340.38971-6-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250625193340.38971-6-matthew.s.atwood@intel.com>
X-ClientProxiedBy: BY3PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB4914:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e82e9f1-417f-4ea0-6a47-08ddb4277f05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?otuvZQwKWP+5XliIo6KF7h87Y2ZcL1Yrg9aa82JQsdGK0QShQT+ExIUnZETl?=
 =?us-ascii?Q?tuxUrIaRiLEdYYgpaQ71bYWejwtDFqtH5FoqFT3QJrLBGnnLdFkpaV/lfpTK?=
 =?us-ascii?Q?L/6Q7fsucoshkT1I3kaa1/ELJEAeFqERjzrAhHQfr5KXCPGTQ2P3sbDptQQ4?=
 =?us-ascii?Q?rway5/71eEH/ULC3Jng6YkItWfVWg9pguuL6RoEtF1CLvKRPQskEdo8VwSbz?=
 =?us-ascii?Q?UndwWqWUnavPn3kDNi8GfKDOPeSNAG7nQmkzRDlDwjxhwhvH2XmYQrQ0rtoL?=
 =?us-ascii?Q?8jF+JIERlwT1bhxZV0qKsQmwhpE36kvDoAxNaMNA6dzNL8iMSsstYJFovNvH?=
 =?us-ascii?Q?IJC8ranZc1nd+Fap+3I0w1xRuZ7vIA/TKfeUk6x9uczm6q6crNWzfZXmVwFW?=
 =?us-ascii?Q?BuJFSntyp36ymYV9aCIIZmHoGs9gw9AzIUW5Jy+EMVTyPrUigLVMhGooBABl?=
 =?us-ascii?Q?+tXAWDJYda64seFQQvI9Bt0t2StJMgYVSLVpwZE5tXHFLbyC7eSkchFy5+Zd?=
 =?us-ascii?Q?v/i/6KI0GGqCCys/9PPfBNQgepblh3gPLEAt2UCIesyvNPt6xRYDrGVA1btz?=
 =?us-ascii?Q?4yKV7sCGgWEY3nL7+OosYySgxAsveUxWHVikjnBGin/DjuHpJ47/z5prZ2fS?=
 =?us-ascii?Q?bVdkJFuN1CI45VIaqG0VoZvuLGPe+J3SPmwpkBCGvY8wqQSQeBU1nMgxQqMC?=
 =?us-ascii?Q?hNxJn2BKaEMYc3ihG66WGEaKDJrkHqxu4B+mHuqB/M55J8H6Y4qGlkIExBWX?=
 =?us-ascii?Q?gzciOxdQqhds7R8XcEiyeLswcs1n08pH4ORBchxDQgcTUmm905+NeZGl2tI+?=
 =?us-ascii?Q?fJuzDErFF5ADNrsYyKK3kIR1vPYtmGA/+oKBQf7Ovrk5qRSn+xVsFQ905fuk?=
 =?us-ascii?Q?KZoku/Rq9wmfjldVNXrTmgJPLwjxy1QwAlgIfrL6o1yCUdto8W3V1Y2hP9hs?=
 =?us-ascii?Q?EFRzEEdeN6GPJEwJo1VEVPKX8PIZPOYF6nw75BnfLOgPiOMda7BJH1AZ+JYV?=
 =?us-ascii?Q?bmD+Lds4L5QTSf3688cRDoX0w9V/471vVXKRaJmY4GY4aG4kYo1LbwDHIHkc?=
 =?us-ascii?Q?nEnOOzrRvoikhdZT4+oC+OqlVJomYctCGOUXcbVxOxu4S/tbWpexLKyBweiS?=
 =?us-ascii?Q?1A4VWuwX5GTkfhRoYhi/+kChcl45Pk8duEBdessg5130DSrgHAxbD6Ir8ovL?=
 =?us-ascii?Q?1lN6YZHH+iHGwd1gtJBen3jLyTAEzuBj1D+U42OVh7zL3LEOLF8Z8eMmCNO5?=
 =?us-ascii?Q?BZ3FX0Z02Fhz4ZpxwIHA9Mt/2ss4Fb/3uC4Ov+F7BLQrO8UxCENkVPWLP/h3?=
 =?us-ascii?Q?BLJZMXADHI2GnTxEBnJX/w7GUJ+8cuxfgjWKjdemXSdLpax3ad+kTSJdwHjm?=
 =?us-ascii?Q?VMXPtpNPbtXYhexZ9IVb5aTmaH3T3dTk17Cvgs3koZv1+f3ojv6fVhj+jOOG?=
 =?us-ascii?Q?0g7dizpVdNw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1KKmhZqu6z6/8N5ADxcG5jD1/Ha3JW4gNZIzLLI0TyXYtJ8zxzyDrWwleIpk?=
 =?us-ascii?Q?FSSM9vISU+pu2ZXaCtTIHtB4Fuhvt3wm9DXpA03W8ZLVCZYxArYMtmVO9QGf?=
 =?us-ascii?Q?vJmWBZRHxQCGZXsFPTF7m5FTw1PH4qhCtRXswszeb4SR+JPsHkjNd71iSrzk?=
 =?us-ascii?Q?vZUdNLffuo6Sd7RVJojhnVrhoUpgHYhwjb9TEcLbYV/skgSZTQcz4s2shi5w?=
 =?us-ascii?Q?RSmliK+N2fgB25Ow/0TXUXsgnKCU0dPR7x0cChfOKKbuVYka+b+xypTdYOAn?=
 =?us-ascii?Q?Cq8onUchaARC5d93AbzUIiua4ARBWH2g2Y2oWtWVJ2udiALUDHLapod/PGXh?=
 =?us-ascii?Q?NUFBJOWCJsTQjfymB80ecPZvvjy76reGR7GeE5Z/ezP6K++RofQLcHcKXJ5a?=
 =?us-ascii?Q?4mvvGH6Ih6cd/YL+3+7eO7wPRqPKIW9ssu0Qh/epAxDsKVGR12Iu1EpKGmwU?=
 =?us-ascii?Q?AQLpXnNH3xXRHbi5jfwzCP3GoWs5kCF15dYh3dzS6RDP76KL1UKCpeOE7xpw?=
 =?us-ascii?Q?kTeD2XALvwVnR2mdSy/V7gwXu1G2GzsTzoLwpk8yCbi3EtWZsBtHyqBImA4H?=
 =?us-ascii?Q?EUS87WzW+YwNqL1seUrIsKTq4caCERYNeHMALCPCbAjzjhpqo45mdWann/Kg?=
 =?us-ascii?Q?gShtz23jqPZfQc7gmGUYssrU63ds2PdK+dvnQgldQ2E2MLqGlqNEBgsark6R?=
 =?us-ascii?Q?eqT4hDVK1Iqo1Z5aWhrAYrN5iC4QR5XD2eHhSWMxy+L1Tl/dRMsBLdscGjF7?=
 =?us-ascii?Q?50XV4R0S/e1fdOJcPI9B/WgUPfSen/cIIHVVrlHcjjRyODzVrD5rKsvagice?=
 =?us-ascii?Q?LYGM51Wv1S8RgKDBreOUjAWQ5BXJTcrsBPcx3xJ6N0S+kNcQARQGpDplFAF9?=
 =?us-ascii?Q?8oprQuZEvaWw51leb7UI/ypT8PQe+/GYEzz/LCE3gt1XED2daAAeasxrfyze?=
 =?us-ascii?Q?kLBLx/9xuQtVLmRGcrJ3EuSyUXfq6YWmsS6qlMQsZ1tbzGHFWk8DDK1EbA6o?=
 =?us-ascii?Q?J+LliPXay+leF5pDDPMwI5SAlDWDXtctX9nUrj7LqrngMzWnCZNabACd/Jgz?=
 =?us-ascii?Q?yr/HAyBHkQtMdI94CTxU3f9ggeoiBLVnmVUO+5IBMsF35PtM7+4/mswUotj+?=
 =?us-ascii?Q?7yZti4aA1flC7X6og54N5FbyBwF755aTcbI1DZOO8yeJ5w65T/NZwDVaO/Ae?=
 =?us-ascii?Q?/Nwsvj53cXP7TxADil05AKUzbG0twYDLmcmpkUGOC7RzAugjLF/vNMV76hOh?=
 =?us-ascii?Q?LYKyb3zzbARWYhlBXXTucflwnTQhA8x21ZX/7Uj/aHH/VEQJ8KBSwpaQK3qT?=
 =?us-ascii?Q?rZikLvxxw6Jn2X5lFCi3QpAIti0TtQAybA9SqTuV6LA1ghFlM4m/4emcgXSc?=
 =?us-ascii?Q?4xK7VEi5MnqWMPGpSVVh1BVSDiHQlCKN0qkybMYgScBMOvnw+5BQCdOG09Z5?=
 =?us-ascii?Q?mt/4xVpwY22bG1dEhEA4JobO7h0bbnWT/qK+tV8U+jEt8uoxcLWG+NRpLJSr?=
 =?us-ascii?Q?fu4a3mmA/rOwbfzqpjmCCx7Muw37HRf0kUuR89X4MLMfLXBgtp2HzpuakVI8?=
 =?us-ascii?Q?U0dRfDXEMX1ZUH7+ZOER7fHCeT9O9mjGWTZ/uwyX5wcy+k0Lps9P61nm3U15?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e82e9f1-417f-4ea0-6a47-08ddb4277f05
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 20:33:08.5488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jh9xGXXXjLb9MqxzlraeYwKQXlignbMiUKYRCqs0/nXuLnQRyPFt3qqGoAofE5g/pRV0gnOHlNuZ5DXVVtZA5RcAc5IgIXvl66MuZ2cn/fU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4914
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

On Wed, Jun 25, 2025 at 12:33:40PM -0700, Matt Atwood wrote:
> This workaround only applies to PTL Compute Die A0. The reality of

Nitpick:  it would be better to just say "A-step" rather than A0 since
that's what we're implementing.  The workaround is documented as no
longer being necessary from B0 onward, so "A-step" also covers any A1,
A2, etc.  steppings (which may or may not exist) and matches how the
code is written.

> modern platforms is we're Multi Chip Packages with logic spread across
> multiple dies. Because this information is not available during PCI
> probe it becomes a bit more complicated.
> 
> This workaround needs to be applied on PTL until we prove that we are
> not Compute Die A0 stepping without reading any MMIOs. So use the new
> XE_DEVICE_WA infrastructure to apply early, until we can determine our
> stepping.

It looks like you copied a lot of the text I wrote on an earlier review,
which was just meant for general discussion, not a long-term record of
the change.  To be more clear to people reading the commit message and
trying to understand this down the road, it might be better to elaborate
a bit.  Maybe something along the lines of:

    Wa_15015404425 only needs to be applied on PTL platforms with an
    A-step compute die.  There's no direct way to map the PCI revid into
    a compute die stepping, so the suggested way to figure this out is
    by inspecting the media IP's stepping since on PTL the media IP
    resides on the compute die.  For PTL, the compute die has an A
    stepping if and only if the media IP is also A-step (this
    relationship isn't something guaranteed to always be true, but it
    works out this way on PTL).

    Unfortunately there's a bit of a chicken-and-egg problem here;
    Wa_15015404425 requires that all register reads be preceded by four
    dummy MMIO writes (including during early driver init and even
    pre-OS firmware), but the driver needs to perform some MMIO reads
    (including the GMD_ID register that holds the media IP version)
    before we can determine the media stepping.  To handle this safely,
    we need to just assume Wa_15015404425 always applies on PTL during
    the early parts of device probe, and then go back later and
    deactivate the workaround if we determine that we're running on a
    later stepping that doesn't require the workaround.

    So we implement the overall solution as two workarounds in the
    driver:

     * 15015404425 - a device OOB workaround that's always active on PTL
     * 15015404425_disable - a GT OOB workaround that applies to PTL
           platforms with a B0 or later media stepping

    The former workaround guards the extra dummy MMIO writes we do when
    reading registers, and the latter workaround guards logic that
    disables the former once we have the necessary information later in
    the probe process.

> 
> There are at least two ways to determine Compute Die stepping. This
> patch uses the Media GT stepping to map to Compute Die stepping, in this
> case Compute and Media dies step synchronously.
> 
> Since we're using the Media GT information to determine Compute Die
> stepping, use the XE_WA and the oob infrastructure to come back and
> toggle the workaround off when we know its safe, and after GT init.
> 
> v2: rename SoC to device, avoid null pointer dereference, update commit
> message.
> v3: rebase
> 
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c        | 7 +++++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 2 ++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index a9f708608f3e..a294a1b26d8f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -34,6 +34,9 @@
>  #include "xe_tile.h"
>  #include "xe_wa.h"
>  
> +#include "generated/xe_wa_oob.h"
> +#include "generated/xe_device_wa_oob.h"
> +
>  enum toggle_d3cold {
>  	D3COLD_DISABLE,
>  	D3COLD_ENABLE,
> @@ -896,6 +899,10 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
>  		str_yes_no(xe->d3cold.capable));
>  
> +	if (xe->tiles->media_gt != NULL &&
> +	    XE_WA(xe->tiles->media_gt, 15015404425_disable))
> +		xe->oob[XE_DEVICE_WA_OOB_15015404425] = 0;

xe->oob is a bitmask; you're clobbering a whole word here which isn't
what you want to do (and will probably go way past the end of the
bitmask as well).  We really shouldn't be mucking with the internals of
the bitmask here anyway; we should have a documented interface from
xe_rtp that allows a workaround to be disabled, and then use that here.

Also note that the condition here can also be simplified slightly if you
use the suggestion below.

> +
>  	return 0;
>  
>  err_driver_cleanup:
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 96cc33da0fb5..255e67113406 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -70,3 +70,5 @@ no_media_l3	MEDIA_VERSION(3000)
>  # SoC workaround - currently applies to all platforms with the following
>  # primary GT GMDID
>  14022085890	GRAPHICS_VERSION(2001)
> +
> +15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)

If you use MEDIA_VERSION_ANY_GT() here, then you could make this one
a device workaround as well (since it wouldn't need any specific GT
structures to lookup the media version, as long as we're past the point
where the driver looked those up).  It would also have the advantage of
keeping both 15015404425 and 15015404425_disable together in the rules
file.  Note that if you do this, you'll need to adjust the suggested
commit message text I wrote above accordingly.


Matt

> -- 
> 2.49.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
