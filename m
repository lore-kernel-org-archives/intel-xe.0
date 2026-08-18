Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E608BC5DF74
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 13:24:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB54E10EB71;
	Tue, 18 Aug 2026 13:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iQwZewzF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55FA10EB84
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 13:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787059477; x=1818595477;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D8rV6LerZU2XMmi1F2iXywgLJACxq1ioe4fM6Zv9FQ0=;
 b=iQwZewzFiYRzMNGn/MvPTsNVLWtWL6oD7sDtJypnirX0zzEotKY2uMm3
 hnT6HHaAFQOcIyoHBABnSV6jGj2sLHLdHgHK0gCl6a/k4Q5j4piCqQsZy
 JuTTXbXfnvnQxuY+pjQbHBmSkxBtLn8QdFJpwg6wQF0Gq2kTXPGObCNwj
 UG9DtlB1kTBvryhPMtGniOoy28ceiQ9Jatl+if61kkxl3pNWE+Ckar0Rt
 B4dlhCcmkmgoGqpjuSQeq8p2s8mnHR9ZS2SSlk8gmV4mnz44GEQyS2CGG
 HZ/0Ba7Q8OHuZyOR8r13nHz3Csc6AYRqeF4Rqw1AZGmBEyIq0TELC2qPw w==;
X-CSE-ConnectionGUID: DUWK5Qj9S7eaha2uSZarZw==
X-CSE-MsgGUID: yaESUJsATwCnpENKK52zUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87756735"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="87756735"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 06:24:37 -0700
X-CSE-ConnectionGUID: sIjuRfw8RP2w1oeIgK7+AA==
X-CSE-MsgGUID: YVV3yE7FSHOwZlViE8ftrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="288733718"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 06:24:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 06:24:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 06:24:35 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 06:24:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFLhMojoD/SkgXRkIaCp9z+eWeUccg9Ds2bbly2PKCeQa1Ad9o8PKvhjoNJ++b9y26x6VxXrJ2vAeP+d8yOr4E+v8z/5uzfZbVUNMCXU72N7avI9aJzmkVh92mLVEZ10rl8LJfY86wnvTDyb1rfHoOlh/bW7hxGDL1+dYR/fjwkyXUSQRsV/tzPgQY3FWvegUMwc7MWYFr1buh6Jbf/nTId7UZFcGAHMINExoRir9BnHXr4sQFaX4jDjvQoJRZOiNacBrVVeJnm7vvh06NuNiHaegzrZZ4Q7iVL+0kpXJc7zZ3pha/hQewhDKuv9TF2phwLfip38S4NbZEo5dppWpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxWYwwcbrXM9vfFoWQsnWoGFAn/Rlnp3i9lvvO0im/w=;
 b=Lj2MKA6cZMW6e997XmSvh6ewRQDtmeSb+CmALcm75Czuxbz1Fr/2l0cmouQS9bv8vQPgHXgpD4d7LcvoIea34PI/7HcSgyxvjOh8MvGSa6Ldj3tQ3c4rnfSlfEbfBBihiG3vtXSSviS86I7KlHkEHL4FF8dkZdEwYovEVpBqp0F3d2hNHJj1EPZJofi+NyrF/MiEgVzDBbYaXX8dG9HBQu3Y4hXE7DGNPU4TFDhU9MbKF+eri/EQRVISGrFvId0uxd8oLheF7e8N0VCPmtDcwLp8bKWPNZqRj/7es69OiACZ6hHg2vbDOcIsEg98dNXypnLjD+GslOuOvzAE4SpAIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SA2PR11MB4841.namprd11.prod.outlook.com (2603:10b6:806:113::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 13:24:33 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 13:24:33 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH V17 00/12] Add memory page offlining support
Thread-Topic: [PATCH V17 00/12] Add memory page offlining support
Thread-Index: AQHdLv42IByU227zOkusW+B8CYUjx7ajxOsAgAAAeMA=
Date: Tue, 18 Aug 2026 13:24:33 +0000
Message-ID: <DS0PR11MB8718C56ED696DF773C0CFBA981A62@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260818104055.3833974-14-tejas.upadhyay@intel.com>
 <aoRXRpXwjoRULfpG@intel.com>
In-Reply-To: <aoRXRpXwjoRULfpG@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|SA2PR11MB4841:EE_
x-ms-office365-filtering-correlation-id: 58fcd056-563e-4a92-6bc5-08defd2c0ac0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|56012099006|10067099003|6133799003|22082099003|18002099003|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info: /zd56+BHvHxZxneQLhbcTFQGYrrln/ByW7A8ThGFS8XVFmBHtaA/98Ac9tg85A3Gal/oIMl3qXdA89pjpGwJ9YPI+kQxty9VNqiBs2iF/Y3DDrvcuu78GAS+CzEx6Fez696IB6HSOGhn3LUajgf6GAipxpPZm/5W1dVOOKjApTII9XskVC3on1M6w7vERa2RW9Os89SFKcAzNJq/E7ySZO5sOOfXZaErRHvg/77W99+xkr0VldnxDoIyKiaPXUtJYYqNpTc+av+YVP0PhveythIu3+eL4OCOGCNeYMnijYJIFCW536fnoTiD1FGix+4owb+TJFyi6dTDLVUQEQ69qdnWE8LXI3XHWYDwrgoB/O8DLXM8MUP6w9ByP2YsxpEdCknVq1qY72xpLZXtTwd2FxiEogFeY4qx5oxTS8LIv+UiWtuN71lCNbKp0Xh36CJv6Noco25i1nOWgVNsQ2/+KM0ED2CO1DBPNdr3xzdnkW6k7E6k0IK3WNaYIi7FFyb6QKAkKsF0We7JG2gGcXA6GOsYep7XHJanzI9j71L038qmjWwog7VDpSgonmtmnFJL12qkLt8CqedY0aQzvoyxA8Xxlqm/GZLXtTCyywaRDf82tXUSGxclTVyj3m3zcHScpuOviMJIecamCiyuyWc30WjsuL/foNhfk9ggGWJsCj4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VmpK8toEwckLBfoXO0uHNEA56BxtlTP6yFrfpXjdJsoEZ3fDp1JQcc7bgDow?=
 =?us-ascii?Q?fCQGRrcUTWF/ETfxes29CAnkEIfgybkgNSgHsj2ubVvE1vHDOzJ5U/jU6w01?=
 =?us-ascii?Q?i/7Ob/s61LOrKewshMjSSxI4XHVqpbzDfEKOsEWxbqcERKb/ms9p/QVtz9EU?=
 =?us-ascii?Q?HVYlSktjvrPRI/5OOrVJfp+BO+SgzbQoFmLNqVNeR1ACaT8+jOs9mP/XZRVw?=
 =?us-ascii?Q?3vj32inIJiYs7iweyeUFCyre+qa9uzmqGeu3yl/DqOlWdtGzGPwc7qNaDSHW?=
 =?us-ascii?Q?H3RO0V+6mU2NhO8xkrUmsh5rSVPatOmpmINh5HaTifclaz6iUUblGzbaSws7?=
 =?us-ascii?Q?WSbxM5lVB4L2Nj5J5B9G0plIelQQS+bS+7tT3wxi88s7V8aynFum80bDzdOT?=
 =?us-ascii?Q?aV91dGu3pvGDCjwI8q8cdxc+2rURt6izAYhaE6zqxwjsyUZZXoi72JPChuzT?=
 =?us-ascii?Q?aLdlqt/EaFm+WJVOyg6gZsCScYNam21xAeo/8K8qHySA8fbajWbgkJ3X3FX5?=
 =?us-ascii?Q?eF2yy646vDCQZUHajxdcp5GfosKEvKAGbQx/QJfZ1JEnuZITHmFCtQkp3Pcm?=
 =?us-ascii?Q?5IexYSmWoAqaL/vcJb1NgsgNIOo3fas1pLs0SK6RxmrwrqhT595bNBJnUBol?=
 =?us-ascii?Q?lFxTb+QFYmjTqlqubbIKvOLTYO9N91/RuQS+CLJtj2IEfaVmf7PxYP18LUWF?=
 =?us-ascii?Q?/MvAbUO9T+OPjIwzcFSq94bT4sTqMFnYTM95R4dQt2jlu6HG6JlyVM2RO5vA?=
 =?us-ascii?Q?vdk1f3zEQ3jDwPaSduwoYd8oDBjUyFeernldcQcDN/mvrNxZLQ/oWCd/xwUX?=
 =?us-ascii?Q?Ahd2bDXXp/46bj4SlZDReLc6kE68ZOZHcuGgR8SS8M7mQRJIjjPuQYM4c1a8?=
 =?us-ascii?Q?spn7SExI94g/T+XSZBlpSdea+qsNImt3DpNx1qGShgbg9YuR7g9bM7RpW0rc?=
 =?us-ascii?Q?Um26QOlp0n14WI2lm8Uk5FnkipmNNyVw2tt9YjFANEM8bvqH1xfE9SXO/7Nx?=
 =?us-ascii?Q?ML4sMYf4aE3FxcUV02Te3uLCj8SVfHNU1/Eyw/nFVf3Lm+gEPycx/HuUnMW3?=
 =?us-ascii?Q?2HbZpWC+9SeJGmtjJ7ZCBhXyYCeEj5+0q4toOIjYJqRDUeD3AKxSigBFA5CE?=
 =?us-ascii?Q?i0P0iKXNwrL8unbR95WV3+LE/+ZmnP3A4+27WiZUluUGm/Eww8ZzQRSlnVZ5?=
 =?us-ascii?Q?LSs7P7BKdJPYj/wt6UVcMX9Wv83A68hd+ul8cxpk93BLGSGkqs7qXl5ZWkMl?=
 =?us-ascii?Q?1AdtNIwsX+4b3zQqyJviK7GIfsHpz4sI1mEpR9PslQSvvtjrBeh6N9G8V+hJ?=
 =?us-ascii?Q?/e6YOAfuq/ZF7/zjEdcYLUCKY5JHdqIvc6jSrwPao/k6JmzFCuPhTuHaN5tG?=
 =?us-ascii?Q?l3XSFheHDnH2VbxguZmqyk5+N27cKKqw2SnUt69nXQxc83dpJjXZGCvjHJgB?=
 =?us-ascii?Q?1JPvmyTTqhrIH5cZDN1w3YPoHcrGjFGY2khJ/9EEa8nNc3bnJpwceOBeGzEL?=
 =?us-ascii?Q?CtyU+kM6vDfsM5mSnQmL8E212s4LfZWgKienFmxa4BTqo+3rm/odBcfy3c7e?=
 =?us-ascii?Q?OUtg2fIrbe5xvlL/DaO/c06IrcjZSS0ognAodeQQI/E0GpD1oJYRxOTd42Jm?=
 =?us-ascii?Q?jJAGt7USnupRRicoTn/uGIsMWxpz5uMf8CeHigo0vFYjBMHvOLi+ZgNBpJ/B?=
 =?us-ascii?Q?2Sm1uq5qxs0E/yO3xq3L8oVS6ZSDCmYTrIVHSHcMZMzqBrbuMd7QgVRYN7fJ?=
 =?us-ascii?Q?8OMj8h4/vg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CkANUkBbNi0WpGTBP5d4DBBtBakJ4nJApZMvu/cGLFIRxzbKDEqY2Sv6/jzMaqt0pIY5VhVpqNAznhkzwc6N0O5i2GGQvTiT1Z1YAbAHQ6Qnivx0n8AbvZB0eVOQhzv6EWo9U7/lpuMaUd5Bv8F33eHqUwpoVyQRrAUnxOWaVHkscvjA+rqeUwdOHXLsevOcVmEeGW8iRimnE8NpVvmq9c2f4K8SCOkkiJO6wYvloNTq0muHYp2hDOcp9OYLzUXxckAp8yOjozTmL3H0lx2xEXP2Rf5DNkWu+s7X8H2iYOxHNQDubxUZ5LgZYblCQJnURxALe2fXfxc8nk/LSQjn5A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58fcd056-563e-4a92-6bc5-08defd2c0ac0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 13:24:33.3490 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eUYTNOxwnznPyePdmrZlU98xpF+A1t/SSoQIrGDPH3e0pPzz3kz1lvIM2hQWekiXPIgZH2wW8C46xLfcLVZt6QnMkzuXG7FF5hE1zyrllok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4841
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
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: 18 August 2026 18:30
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: Re: [PATCH V17 00/12] Add memory page offlining support
>=20
> On Tue, Aug 18, 2026 at 04:10:55PM +0530, Tejas Upadhyay wrote:
> > This functionality represents a significant step in making the xe
> > driver gracefully handle hardware memory degradation.
> > By integrating with the DRM Buddy allocator, the driver can
> > permanently "carve out" faulty memory so it isn't reused by subsequent
> > allocations.
> >
> > IGT tests for testing this via injecting simple single address and
> > duplicate address fault to unit test functionality:
> > https://patchwork.freedesktop.org/patch/740601/
> >
> > v17:
> > - Rebase on drm-tip
> > - Enforce CONFIG_FAULT_INJECTION_DEBUG_FS for fault inject
>=20
> Please stop quickly spinning revisions. That may be counter intuitive, bu=
t fast
> revision spins might delay the progress.
>=20
> Also, please ensure that any blocker raised by reviewers in the previous
> versions are addressed before sending a new one!
>=20
> And, it is always a good practice to CC the people that engaged in previo=
us
> reviews. Trying to respin without cc'ing them and without addressing the
> previous asks or blockers just sound like you are trying to by-pass the r=
eview
> process.
>=20
> This series has a big blocker and should not get merged anytime in this c=
urrent
> format. Please go back to the drawing board and fix the documentation and
> sync with other components. This is not getting merged.

Hi Rodrigo,
=20
Seems the quick revisions have given wrong impressions about bypassing revi=
ewers comments about the series. The sysfs changes will be only merged afte=
r making them compliant with upstream doc and in agreement with other compo=
nents in their usage , with all reviewers in alignment (same thing I replie=
d in original revision of sysfs during our discussion).
=20
Intention here was to address review comments in other implementation patch=
es  and getting them merge ready, implementation patches don't depend on sy=
sfs interfaces, sysfs patch will be merged with compliance and agreement of=
 all reviewers.

If the sysfs patch is giving wrong impressions about bypassing. I will drop=
 the patch from series and spin it separately. But I would like to continue=
 making other patches in series robust and review ready.

Tejas

>=20
> Thanks,
> Rodrigo.
>=20
> > v16:
> > - Correct sysfs patches with moving code with rcu lock
> > - In case purge fail let next alloc decide final failure
> > - Remove addr_to_block API, its being pulled from drm-tip
> > - Remove some unused code and replace where existing API can be used
> > v15:
> > - Split few big patches into small
> > - Avoid vram_mgr lock in sysfs
> > - fix missing queue_pages counter increment
> > v14:
> > - Solve sashiko reviews
> > - Remove SOFT->HARD offline patch, decision is taken based on -EEXIST
> > - Dump gpu buddy allocated patch dropped
> > v13:
> > - Add fault inject and remove standlone debugfs
> > v12:
> > - Fix Sashiko review comments
> > v11:
> > - Add BAN reason for UMD to know about offlining
> > - Add support for soft offline mode
> > - Rebase and remove dummy lockdep annotation patch, as it merged from
> > upstream
> > v10:
> > - Remove RFC
> > v7:
> > - Improve debugfs warning messages
> > - Use scope_guard for locking(MattB)
> > - Adapt addition of queue member of LRC BO(MattB)
> > - Extend and use xe_ttm_bo_purge API for vram pages(MattB)
> > - Handle dma_buf_map requests for native and remote(MattB)
> > - Address if in never initialized block, set block to NULL
> > - Add lockdep in gpu buddy (MattB)
> > - Correct allocated_addr_to_block logic (MattA)
> > V6:
> > - Add more specific tests to noncritical bo sections
> > - Handle smooth exit of user created exec queues
> > - Break code and make purge specific static API
> > V5:
> > - Sysfs "max_pages" addition
> > - Reset block->private NULL post purge
> > - Remove wedge, return -EIO to system controller will initiate reset
> > - Add debugfs tests to trigger different test scenarios manually and
> > via igt
> > - Rename addr_to_tbo to addr_to_block and move under gpu/buddy.c
> > V4: API reworks, add configfs for policy reservation and apply config
> > everywhere
> > V3: use res_to_mem_region to avoid use of block->private (MattA)
> > V2:
> > - some fixes and clean up on errors
> > - Added xe_vram_addr_to_region helper to avoid other use of
> > block->private(MattB)
> >
> > Tejas Upadhyay (12):
> >   drm/xe: Link VRAM object with gpu buddy
> >   drm/xe: Link LRC BO and its execution Queue
> >   drm/xe: Extend BO purge to handle vram pages as well
> >   drm/xe/bo: Make xe_bo_is_user() public
> >   drm/xe: Guard teardown paths against purged BOs
> >   drm/xe/vram: Extract buddy alloc and free helpers
> >   drm/xe/vram: Add page offline data structures and lifecycle
> >   drm/xe/vram: Add VRAM page offline fault handler
> >   drm/xe/configfs: Add vram bad page reservation  policy
> >   drm/xe: Add sysfs interface for bad gpu vram pages
> >   drm/xe/uapi: Expose ban reason in EXEC_QUEUE_GET_PROPERTY_BAN
> >   drm/xe: Add fault-inject based VRAM page offline injection
> >
> >  drivers/gpu/drm/xe/xe_bo.c                 |  13 +-
> >  drivers/gpu/drm/xe/xe_bo.h                 |   5 +-
> >  drivers/gpu/drm/xe/xe_bo_types.h           |   3 +
> >  drivers/gpu/drm/xe/xe_configfs.c           |  67 ++-
> >  drivers/gpu/drm/xe/xe_configfs.h           |   2 +
> >  drivers/gpu/drm/xe/xe_debugfs.c            |  49 ++
> >  drivers/gpu/drm/xe/xe_debugfs.h            |   2 +
> >  drivers/gpu/drm/xe/xe_device_sysfs.c       |   7 +
> >  drivers/gpu/drm/xe/xe_dma_buf.c            |   3 +
> >  drivers/gpu/drm/xe/xe_exec_queue.c         |  14 +-
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h   |   7 +-
> >  drivers/gpu/drm/xe/xe_execlist.c           |   4 +-
> >  drivers/gpu/drm/xe/xe_guc_submit.c         |  32 +-
> >  drivers/gpu/drm/xe/xe_lrc.c                |   1 +
> >  drivers/gpu/drm/xe/xe_pt.c                 |   5 +-
> >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 604
> ++++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   3 +
> >  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  40 ++
> >  include/uapi/drm/xe_drm.h                  |  18 +-
> >  19 files changed, 834 insertions(+), 45 deletions(-)
> >
> > --
> > 2.52.0
> >
