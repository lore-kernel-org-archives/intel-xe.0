Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E98C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 11 Apr 2024 16:22:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C10810F1E6;
	Thu, 11 Apr 2024 16:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TXjY8eBI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F4710F1F8
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Apr 2024 16:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712852530; x=1744388530;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hfb0VdosCKceMFd3wNhMlpyva6E0QuW71Y+jYZy7PL4=;
 b=TXjY8eBIRJP4/HGEc7nIpLzBK5fLDjmFDDcf9mxWGH+/+ooKafhgtDK0
 vO86tsDmH7mLfUOdPZwkAR/Tel2nskuUADJNHrlEXkT4wEQ4Ef3NV/jQP
 7c4Rs0luWym4tWK+ZkgIKSFd+vZMjpopjQ8jSzRpwJGCfhlY9wdFWjywX
 NKycUojDWckIEZKa8Cal0wfBGDiQqGalCg1UvMPwFqzOtqXlf3O3kk5AO
 ZATC1QNqNn6JyCT4bsIVH3rcbVG3eEBBFB5eNSuRWPdnmHrbFWzpyL6g3
 d3L4+vWUJs/9cZks4bCt7iMVlV7AzJD8mpArCtxoUYIyagyTcHSg2kMnn g==;
X-CSE-ConnectionGUID: ljae96s6S9G3UMylCNouMA==
X-CSE-MsgGUID: AIj8Au2CRROBJiNZhRkPVQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="12065027"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="12065027"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 09:22:10 -0700
X-CSE-ConnectionGUID: WHMjeMZDQ7S/8R6BjvSWYw==
X-CSE-MsgGUID: +kCx4btkRGyqt7nUNmGQag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="25594120"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Apr 2024 09:22:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 09:22:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 09:22:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 09:22:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 09:22:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfyoTXDw7R7x1VzXakpcaF0BiSpwvwT3ZkDvwrUlEsoc2K2v8ukJ1e0HFconwN+rN02jQLQSjlCxybimPwVqmX2hvo4xbe5Q5+YKiM/o4O2EnTVgZd4+L1iHQyI2+bQ+HrrEesimxfHGfvAQsOPvZxWY8/mWhYtxEs554MUbjhh7PL3MjXoCvBkRIbdM8MlDPj+5LUNnNUDN147q45yMJlmCQO920EhfVfi2QRwquDIOT5xwfP+fGWguyZRMvy+5vvRk+N5IqU1+QyZOjD/2suDEwVmulPp7BWlkdclcmGIHsR0jIgT2roEckWMbosZgrEHGuLCEMEW/tHaBa/rssQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2rLkbV60vfBkUJLkk2GJKpr0SQfh5Q1CAoTCYMdXYGg=;
 b=ko75qBAYNC8vyaUWdsOQwU4SlUVL09Z7GwmC7388lc/AeLExI26tEiGJoNBX9PEJTfhMW8apzTYNXjoQD/vJXjj7tYbUi5DDpZyj3Amp/0Z9dt1cHXR7dpe0cpgswaxMUxGFSc8RcQDWU9hpnaMZOb3UZVTnsF64Q+4JshubATx9Z8YWEwVncAbaJIS0AYPk2BNFHWl6kzNp0SfXRtbUmcrbGaGdF3ILsxrSpLJFyj2vUgg69srBMyQHJgSrBsePJWpfY+SAO6dg0cuij094R75ltKaf38TDclEw4I4m4xd8XEm8CCDHo7yzN7BMfpPjvLv8cL5zG3fGoTrv1/Oh+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by CH3PR11MB8493.namprd11.prod.outlook.com (2603:10b6:610:1bc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Thu, 11 Apr
 2024 16:22:06 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Thu, 11 Apr 2024
 16:22:06 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>, "Yang, Fei" <fei.yang@intel.com>,
 "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Thomas Hellstr_m
 <thomas.hellstrom@linux.intel.com>
Subject: RE: [PATCH 0/3] Enable device atomics with a VM bind flag
Thread-Topic: [PATCH 0/3] Enable device atomics with a VM bind flag
Thread-Index: AQHai2ryFhItLVqSkUOdVBkjf+nPzrFjPGow
Date: Thu, 11 Apr 2024 16:22:06 +0000
Message-ID: <SA1PR11MB69919E24A17807B65DB2EA2692052@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240410170308.409-1-nirmoy.das@intel.com>
In-Reply-To: <20240410170308.409-1-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|CH3PR11MB8493:EE_
x-ms-office365-filtering-correlation-id: 47b7636d-e460-4078-def5-08dc5a4387b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SpPCQqvH9/qu2ir+dDS9HUBqKVEJlHZR0igE6wvB+m5vH2InAzrtjA+Zu5pWa0OAGsZtSdqm7cz7mJQYI7aZ6dqn8QUdYMDwr9DsnihnKv2OPMt0K152fO4mLfTogWL0vokfd0Wyv+WONXwqliiVbRPH5QsdmXJWZH/dQR6euSK9a8M8lEbhKBoRsREUSn+hyKZ9ouSMLnNC/t/oqyclgSXOFWfDf5w76G+KBzjYYvrXR8ZPAq7kz+a705yfIawfpc6ne3h0cDCF8j2ustSJ1tJoCv7Fpe36pSxdVm2loZuEa58Rd3hrZ+fUtz1r2LnwRZS1K2N5Bz+Px3CmWw8AC87iQVO7sPizUqIrJ5pTYsiqgqkGiTd7ZFSMs9s+C6i4VoEJ0tEYdHjcNeRY7agmRcyLRfy/MIcVreWaH1nNsZrDuhwLhLgBJvolZlHjmC3te84wvhZH8hjJgqOpgcEsq/p7nqy/cmWSn3ASg95TgwE+bfQiRqw8PUUU9ZqCwzPrE0dViPrQFQxyEl6x621x/UJ3duikBg5aEeaY+KVZo9tPC2horHhFpcyscNlTrtAQX537TpqzgtC9N3SwycfpgrMf9Zg1ml+pJIvdjl1DhAOVKUh2x0yRSVouPyfJ3xlg9m3p/hA33seMpVZLkYvLlgW/q0kt8TFDhWylODvZ83A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vliqoGfeEDUK/5gPFfBgFuWlfPiSahKu8rnW9OfAUELkpiaqy96zVgyqWDZx?=
 =?us-ascii?Q?xvEsC/hQZAqdrzV6cimO96rauSzHbEF0CH3G6RC3zJYvPkCdCVIxOxG+wqFY?=
 =?us-ascii?Q?U/g77xRXgrwso76z1MjXCWp/49lpcJB4AG9eoAmIX84Hvdrb6vErYrn4Fdmu?=
 =?us-ascii?Q?s1OMKcJ2PzI0rNabD3QGPPg6Bzhf5v+G+Vio+37jWD22RJZwQ4oZFMzB80+O?=
 =?us-ascii?Q?CwLqy5mLWx4ciNZCHZusJ55tUvIm1arOlmbOQHrfU8fFRskHGeph68DrUo91?=
 =?us-ascii?Q?PC8+Ir7FWeowpNEBpvRGNox+yvyzUKOLJCf5h4b0I6aS9MIwJFzu23V78iHo?=
 =?us-ascii?Q?F3pJlrsocFryYvfUujJUq+6QKQYtUNWMWqSKMr3K1iT1Yhvr7Qsntftpu1as?=
 =?us-ascii?Q?xshxcvaDknwhY0RToJ/FtciK7rijVLqfylR2G+tLJGluscJwZaTFvsJldZCR?=
 =?us-ascii?Q?Q91YFp7NSeFMlDLKHhEGfv6x22qGHWmY/lJlN1QWX0b3ACrmjcXII1XuAgIc?=
 =?us-ascii?Q?bcone20Fd2u5G0DglBmAnXAXQKSff/CS4UjYKvitz2mCh+EgcprtZjOgT4hE?=
 =?us-ascii?Q?g1m12zzHFC7cdQ4VCAty9yB8N0VQVytntutb+g1SpSWsA9yBAs5OejUNofqv?=
 =?us-ascii?Q?CwOO3XU3YhN3mEbjqo3YMB+itS/ljaaU3oadkBGJu7SItIoBU2EnmQ6Z0jKZ?=
 =?us-ascii?Q?aBL1iIRxN50f6qNltVPCoKQbDgYEEYeV2pXA7YL8+ldVF3nfNEN+3Z/LitCS?=
 =?us-ascii?Q?WPr4JYbsb7EBpkodct16vtACSpeU7j/WmUWlhfttoKwlSg9MInJla3extyzA?=
 =?us-ascii?Q?ciPWtEV3A79xREFeyOedtOM8sTbVW4MQdyQt9qLEejGyTg2jGR7JJTM9FbRl?=
 =?us-ascii?Q?r9JkAyiZ8QsBQmmP02z8oacmARlEnh7l+cIpLxpJ2mYWot6SuG6URn85fELx?=
 =?us-ascii?Q?w4Yi0c/vmd8WfAwck43iNh6I2ebAGm10+fw8tueBINMdbyvmoKVI7DNdn5/C?=
 =?us-ascii?Q?QzCUtV47QboXc4KqfAXhvXiuEMM760HPYjazrsLoPx5EY1z7ScXihXJCwz6U?=
 =?us-ascii?Q?Fu5DHGskLV1ma7sPh60wOkHq4yD+8GWU4JtfyJ09r4qFzCG7VtiQbYJwFRff?=
 =?us-ascii?Q?fePMqiUXUNlme5lRgBFzw1+E41lidcTQ0QmyTKWyP/FQCvtv1Q92tTXMBmhp?=
 =?us-ascii?Q?j/3nUl/bQmZEPv7tlTRyKdunl3acQbt1QYjoHN0u5HrIanEv5B5TwrowSQco?=
 =?us-ascii?Q?yKUzWenHAba/LIE4WcEQLWQKG574FOInSDElsbbI0wdfUdQpJv3If5MkQD8P?=
 =?us-ascii?Q?62/BcG3ECrJa/56Ln4don2roiYU51UClnYFwh5+XBZE64lxeCRs/XQgbqgiT?=
 =?us-ascii?Q?MZzQJsfh3jXhXFD9CqOi20MZZrYR1S7no8WmglpnKCYNe6z/D6/aH7/hBUlr?=
 =?us-ascii?Q?q+nTE85nVryUL0r7DZOZe26wGR5tOMcCNJwQ4kDHc08/yaTuOJjFjk32qQAV?=
 =?us-ascii?Q?K425YKX/Ft0sGXAHrUm0840I+T0P/O8v/WpFU95nzeWwALRGIUIRA6Mi9bcW?=
 =?us-ascii?Q?+FQ6VPct2YnPmvzUs6c=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b7636d-e460-4078-def5-08dc5a4387b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2024 16:22:06.5270 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sg1Z64DZQftcY+T2h6kmNs7ia7T8AJ8Ges1xH4AqyzWjJFkj/U3FQ35oLcsowLGMsESqvCcl2/+E9F4EDsXN9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8493
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



> -----Original Message-----
> From: Das, Nirmoy <nirmoy.das@intel.com>
> Sent: Wednesday, April 10, 2024 1:03 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Das, Nirmoy <nirmoy.das@intel.com>; Vivekanandan, Balasubramani
> <balasubramani.vivekanandan@intel.com>; Welty, Brian
> <brian.welty@intel.com>; Yang, Fei <fei.yang@intel.com>; Landwerlin, Lion=
el G
> <lionel.g.landwerlin@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
> Mrozek, Michal <michal.mrozek@intel.com>; Zeng, Oak <oak.zeng@intel.com>;
> Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
> Subject: [PATCH 0/3] Enable device atomics with a VM bind flag
>=20
> Currently device atomics in SMEM only buffer is not supported and
> given that simultaneous usage of device atomics and CPU atomics on
> the same SMEM buffer is not guaranteed to function without migration,
> and UMD expects no migration for SMEM-only buffer objects, so this
> provide a way to set device atomics when UMD is certain to use the
> buffer only for device atomics.

If I understand it correctly, per umd-kmd contract, kmd should assume all s=
hared allocations support system-wide atomic by default (i.e. even if there=
 is not any user settings). So if we want to introduce API to let user to s=
ay "only device atomic is expected on this allocation", the API would be "N=
o system-wide atomics on this allocation".

Similarly, we can introduce API to let user say:
	there is no atomics expected to this allocation
	no device atomic or
	no host atomic

But the above assumption (all allocation by default support system-wide ato=
mics) doesn't work for device or host allocations on some platform, i.e., a=
s explained in the commit message...

So the API format is still an open to me. Should we define thing similar to=
 umd api here: https://spec.oneapi.io/level-zero/latest/core/api.html#ze-me=
mory-atomic-attr-exp-flags-t

Oak


>=20
> Test-with: 20240410170041.24963-1-nirmoy.das@intel.com
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
>=20
> Nirmoy Das (3):
>   drm/xe: Consolidate setting PTE_AE into one place
>   drm/xe: Add function to check if BO has single placement
>   drm/xe/uapi: Introduce VMA bind flag for device atomics
>=20
>  drivers/gpu/drm/xe/xe_bo.c       | 14 ++++++++++++++
>  drivers/gpu/drm/xe/xe_bo.h       |  1 +
>  drivers/gpu/drm/xe/xe_pt.c       |  4 +---
>  drivers/gpu/drm/xe/xe_vm.c       | 32 ++++++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
>  include/uapi/drm/xe_drm.h        |  9 +++++----
>  6 files changed, 51 insertions(+), 11 deletions(-)
>=20
> --
> 2.42.0

