Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378E2CD98F2
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 10:55:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC00610F25C;
	Thu, 18 Jun 2026 10:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BAzwc/n0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E213710F25C
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 10:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781780123; x=1813316123;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P67RBQqzCCMgDoqXkEULnnIlxyKlKVG8x3VJEuN8Rio=;
 b=BAzwc/n0l8188DkZ6Or53rPYLtq2kEzpJSOO1gAedRotdXKerbqboblU
 Y+ogUhWkjz/++h33ALmtm81cuvSKp8gbsaqzNB1iy4VjNSG8LrhuYoVnu
 7Ulr6pjBll/UDifWSUoGVbE61jWsDuHUCXY5q47txoO1dk5QAy3Q/23rm
 VLPkWeh9fXmj2tFGbYAdwkbClGzjR3HxaYrrEXN+jwK3Vx6XhWbXmgi3J
 NY5fm3OD9Rmd+crqiSdEJxzm0tHLnzHYr7nMIwxxGB8ksW4+hn+xvxNvf
 HFv7NnMeq19BLvlD2OAD6QSWF6lv105AOIC+ocLxjPF96F6Zp+VxHbbJd w==;
X-CSE-ConnectionGUID: 6xvzEw+dRc6wLKTweb/zVg==
X-CSE-MsgGUID: vzjSkh/iRYq8wtNkgbfZfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="108156380"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="108156380"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 03:55:22 -0700
X-CSE-ConnectionGUID: 7I8niRfaSDKCjkyjjLuswQ==
X-CSE-MsgGUID: Z87BfeVHSI+8Wq7etW8JXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="241957165"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 03:55:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 03:55:22 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 18 Jun 2026 03:55:22 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 03:55:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbblPM9you96fkBQe+WkH9grm99nTrpSUYYseege2xjMaDXsJjJ5Z1/7dim5cxsZeE79zPBNLCRnNlTBMv3TP3Lcsv4aDe2NK8ZY30eh9gtLIlDZxdTO03VYm6Wnf0v9lw+GcgRBpDhQpGy2Smmv8Q+iPQLbOeDLcbsiL7fJSB5FXRI4IopG84wBaNiDYK5Jdqenm/z0yJqNfDKBHVJjIJQWCGjj62BRMhzzcC5Dyi6lUcgd7o7QuzU3gFmgBs14qB4rRWK0ypeQ+wxLhr625Q5C6f3SBvKx6DSMmfSuTgKzc1ykBiz3QNjEwarQ2WydtQqxcXtHzQO9aNMlYeDasw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUjpkgePNQRKTsz7bV+NBZ91VBR1fKB0R0vULZJnhhM=;
 b=g+HSw10gDbiykdbnMfDrt5D0UoG4EBvYesvqP70WLydoyiQecbu+UCsruCa7QEYdTQ8Oec+Xu122wfavWABFOMtPIQnOWaRZhyk+W7/oSvZQ3ZkWNAXpQqiFrWQtU7G483tvUeq5GLbhtNiQq2odQ6jKJ4IlhzfaR3jIG4hJa3v5O0RsPsZ8ZJO24qW28En94lv/ORqC/lwdy9Yc0JJJqmTguvOIIWvUSi1I+5tD2MT8XCkcfBnUTLYsVH4xWYWN3vghTGsC1wA5+aIZUC5QG6Bjpt0UbO7qOdhzP4rlGEKyHF8dRhoIJwcHrh2Et5AM732rlzT/0x5d47hNlk15tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by IA4PR11MB9322.namprd11.prod.outlook.com (2603:10b6:208:562::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 10:55:19 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0113.015; Thu, 18 Jun 2026
 10:55:19 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>, "Jadav, Raag"
 <raag.jadav@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH] drm/xe: Move drm_client_dev_suspend/resume outside pm
 block signalling
Thread-Topic: [PATCH] drm/xe: Move drm_client_dev_suspend/resume outside pm
 block signalling
Thread-Index: AQHc/jJPmagXjUd9qEyGGBaQF4GogrZCnR6AgAGH3RA=
Date: Thu, 18 Jun 2026 10:55:19 +0000
Message-ID: <DS0PR11MB87186F6A43DCAE1F5EE4091B81E32@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260617082104.610620-2-tejas.upadhyay@intel.com>
 <0fbd905b226bfa9224991fa8d414edb8c94222a2@intel.com>
In-Reply-To: <0fbd905b226bfa9224991fa8d414edb8c94222a2@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|IA4PR11MB9322:EE_
x-ms-office365-filtering-correlation-id: 409f6ce5-3d07-40bb-2208-08decd28167c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|23010399003|1800799024|366016|56012099006|11063799006|4143699003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 7vvGjEx7v97vjSl+ffWq9MrZtOlN60g9V5TgrqUkYtNLd+qr0cNol99+mVSZKcOlXVgML6j9IBW6Y1xQEKyEakpmkXiLjkxhP28E+NQ3D87n3LDJ8LvDJZrnKVECQowRjuuplCETPrQOPFDP2AqwjTBwbu+NelYXaLXLdbavGtcjomx7BP4/GWZQ7T2tXpJjWLK/z2VcJZeqw13d0WvnIOF6dOr3o1NL/CpsPbM1cmcmiELRn0NUcShhzus5VRDkE232/EWUvdYQscB9OiSxFSu0lluZdkPTf/cC0gHQo5JpVzKRx/HM+hK/YB7Jg/DXWDZJ+D3w3BL/YqJH0kzpdWNd2R2TfHwijXJMhuEcP7b19+wzg3o9C9hXZu8bBWgpZHbmQ8oDNfWDwkJdQRHXagi9KNHdHoEslng5C/mWF49+fIIgfLNIpYezQKAZvPzLNJiwEm86UL2JHLhNHmZIVhjooGivUNnkl+SUeE0yJEpzawkRwkyoBQ2qXN6gLSfWjHbqiMfzZj+dBcm1ISdWC7UnNI3Ji1DeFBAPZvHCBWlqiTwhTK8w18DuxMb3ECG9mBPdNjvSaCGDPvablxz55t8QGPNaRNiPGV+sT2Fm0Q/t9TkULCQ1gEtzEQoTQla47LQEY5oibTmlLonUm4+dB/KYiPnB4XGQNznW91KNB9XGlr7bIhFbPkT/w4hl2dHtekIwPdgibell9GiijXQEChwMb3vBIhG/4iK1f3E+pKNRJDSMDG36J7+BSg7qLUGC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JYvFAGmiBENIf87RjpcvvcBf3IiAotN2gD9OLu+S7i+r+S2PhS0qBoWqQeB4?=
 =?us-ascii?Q?X/H3HtNInqfKjTyRmHDeIjVEfgWcaKfLpRjgsvNQMAZjJrIwF0oV/wUbEV2k?=
 =?us-ascii?Q?edR2fDN2158yweBCxAvxNr8ACh1mE45DN8PPtlQrmjNOV0ch9CyszoryRESo?=
 =?us-ascii?Q?FDAcZ7UYxkKrI3iqt7j7HczT4HG/avyAVCQ2wNsUyEjds+1Jq3WGqLen5K3T?=
 =?us-ascii?Q?yzkohBOUDYfrSpRS0BaqZYydYlx693LVcG/7odp4DIh7cu0e0SF2toEM2AWG?=
 =?us-ascii?Q?qY1MDQRj0jpQMAEpFLX51Fk4HDDpXMSTk+dbhS9xjHCv/O2rI3EQBjiqhGPc?=
 =?us-ascii?Q?ShWV3k/UzGU6bjs7H3uyeWIp5XHUQ1rQAyodhD5FScEQV/wkqluTLZMyiqGR?=
 =?us-ascii?Q?SSH2NrVLOPbJH/CdnZ0sZoP8ZrwmP0KkhWWHw3J33Bnek5DxOZipIZhdYQFL?=
 =?us-ascii?Q?3nsdmnDo5q9KRejVj9g6OYBRVSe1j1ESNzzezJ+VMU55obnqUPiKyjjJo7bT?=
 =?us-ascii?Q?kfZi+LZiZ1GOQ2mXaeAs/j6wx9UjUOUn37UJ7SnABtigYFmWolJXICLguGwE?=
 =?us-ascii?Q?MN3omYMBssal++63LzSTe/pY3JjHraoVQjdv4k9EXRib7A706t94pjuzfxGU?=
 =?us-ascii?Q?NIJalBllb10PGtltOuigLm0YWnmQxfBW75A+KWtbeDBHLwJf1n1MMMAbd+AA?=
 =?us-ascii?Q?9N1ssvaJMmeXErJ5M30dIWnu3liN3+A/8gZ/viT8P+EaZ3F0OjJ3FlPlKHFB?=
 =?us-ascii?Q?jIx8sf+GXHl3OV8F8JvJbkHEi1xHmgl5ML7VgOIb5iWhc+LzaRHmgzd50BFL?=
 =?us-ascii?Q?sOn1Ej62m8SEXxo+0o6pDJdvlbsUKrTdD9aJD5ywwjQu8duWAg/XTF1BiB0e?=
 =?us-ascii?Q?/Kc5mj9M1LzyLsBcvmJLTTZekzDyLZXMRMQYp2dLTWEuUqTVs6lDKJsj5iw5?=
 =?us-ascii?Q?cVskgs7IoWhmdN6+ScTSA77MHwgyi6krLaic+N9++1xqZT5ZXcFOB93mE4Y6?=
 =?us-ascii?Q?X71bFKzZuDwKL4Gp6NZGWEr3Fh8QBPlTl9ioTl3XkKjdEegrNq/eJ8X+SvzT?=
 =?us-ascii?Q?gGQHns4teiCTU7U4pt7KfIjDKbPD/TEFEbcWSmDLTfBBtUbWoY7I4v6/sFYw?=
 =?us-ascii?Q?gUnM3EN+n02kc5v0TFKPtM4O4mgSOryVfOZpMMoMJbBlWSzldgmIp8pDV/T0?=
 =?us-ascii?Q?CpJbsAhEM5IUuZwG8kepzh8rLf0EZdBQ5UWJgjhVjrjfvmjLwHtKl9pc89D9?=
 =?us-ascii?Q?LFGe0MFdtkxM0VXimvGPUXpYoj10CoqnFn91/lB1njj7WZ+OoEAyx3r8JzIR?=
 =?us-ascii?Q?39iWR1TalLTsO83YLGKePRhEUZ0J1HWeg/WT0MDb1G5PfjJUL1nPyBJZ6LEP?=
 =?us-ascii?Q?lQ8CYlYHkbSz7s+Caya4TNWM8bWAxAk3UXx55s5NiQQgoLPoJEMmFAVeleTc?=
 =?us-ascii?Q?fEYlXY1QECvA4VhTDbMe5DlEfIMp4BTEqAlD170q+JZjCDd/wA4RY7RA0E0I?=
 =?us-ascii?Q?j0NkJl+u6gkBmkgdW8HhDY/IQetIehB+PJOfQKm08gtlGELJIX1f11V4krsw?=
 =?us-ascii?Q?eRW00YN8BGd/YDNPUFqs8E97gbvDrPAVGFKD27ApfbgdaSeUF+hmRGgszAlA?=
 =?us-ascii?Q?2LZdcVnXTsjk0piqFz/CTScptMPItXrcdJAHgIv3+0FUXYB7UX85G7ZOTq0K?=
 =?us-ascii?Q?TzbY0mE6w/bkQYYfI9hANjKGu+EGLahHRUjA0KIloRhgTJ2P8dD33IOOANJ6?=
 =?us-ascii?Q?ojtrxWqKlCTzQxGMS+n4jg9kls97RaNs0cqenPt4BgI8NOu/0zmlnPRAyZWI?=
x-ms-exchange-antispam-messagedata-1: 4hiy6YT0O5ZiVA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Vn/R7qMq9SaCpTYX/UbCo2dY6xI4E+Qi++EOE1/4Y1ZAbcO7ZzAuS40FOjNlwmcyfQlfQCaAhEZL15LHmiCZL7958Rn2CyMlORu4mpy9lX5sSEnBaAl58BGwjfVOWgYLgajO/+MaCOj+5mpmRf+UlF3yzoPaQADwhffHJ6lBmSYi2JAgVFyq4nmi/gnuMF3iw5wZ7nrzJ4tY2Mv22FMQ8eA+D4wnmoDTTB+LJTtUgFCb5TbaXPpwQPLFZ02TJu2CML9iOrDVeaUGgvgzA6woYViCL1zGSBK5pCaPn+rkVyH3B16HGGzie54OsgRgErWoSnWNjQ5k4VCmt6GHA2EJmQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 409f6ce5-3d07-40bb-2208-08decd28167c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2026 10:55:19.2530 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IgtwHyE/LruNlyxX/IoegSoXZ/3G8O9RF0XZWzfYfDcXyiA2HJSgPwQIB7rDrPTvnOoz3jSVIKAbdHVk3cXXiXsbZtAz50ECa8/z/aG5Lyo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9322
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
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: 17 June 2026 17:01
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>
> Subject: Re: [PATCH] drm/xe: Move drm_client_dev_suspend/resume outside
> pm block signalling
>=20
> On Wed, 17 Jun 2026, Tejas Upadhyay <tejas.upadhyay@intel.com> wrote:
> > A circular locking dependency is reported between xe_pm_block_map and
> > dev->clientlist_mutex:
> >
> >   &dev->clientlist_mutex --> &vm->lock --> xe_pm_block_map -->
> > &dev->clientlist_mutex
> >
> > The dependency chain is:
> > 1. xe_pm_suspend() calls xe_pm_block_begin_signalling(), then
> >    xe_display_pm_suspend() which calls drm_client_dev_suspend()
> >    acquiring clientlist_mutex. (xe_pm_block_map -> clientlist_mutex)
> >
> > 2. drm_client_dev_unregister() -> drm_file_free() -> xe_file_close() ->
> >    prelim_xe_eudebug_file_close() acquires discovery_lock.
> >    (clientlist_mutex -> discovery_lock)
> >
> > 3. xe_vm_close_and_put() acquires vm->lock under discovery_lock.
> >    (discovery_lock -> vm->lock)
> >
> > 4. xe_exec_ioctl() holds vm->lock and calls xe_pm_block_on_suspend()
> >    which waits on xe_pm_block_map. (vm->lock -> xe_pm_block_map)
> >
> > Fix this by moving drm_client_dev_suspend() before
> > xe_pm_block_begin_signalling() in xe_pm_suspend(), and
> > drm_client_dev_resume() after xe_pm_block_end_signalling() in
> > xe_pm_resume(). This breaks the xe_pm_block_map -> clientlist_mutex
> > edge in the dependency chain.
> >
> > The drm_client_dev_suspend/resume calls are safe to move because they
> > only blank/unblank the fbdev console and don't depend on display power
> > state or any operations within the block signalling scope.
>=20
> What baseline are you using?
>=20
> See f597d4b2fd0d ("drm/{i915, xe}: move more calls inside
> intel_display_driver_pm_resume()"), pushed almost two weeks ago.
>=20
> The direction must be to move display related calls to display, and neith=
er i915
> nor xe core driver should be messing with anything to do with display dir=
ectly.
>=20
> Need to find another solution.

Commit f597d4b2fd0d is NOT in my tree (drm-xe-next). I will need to see why=
 its not in drm-xe-next may be next rebase is still not done. I will wait a=
nd respin, I also need to think on Matt's concern.

Tejas
>=20
> BR,
> Jani.
>=20
> >
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Badal Nilawar <badal.nilawar@intel.com>
> > Cc: Raag Jadav <raag.jadav@intel.com>
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/display/xe_display.c | 3 ---
> >  drivers/gpu/drm/xe/xe_pm.c              | 5 +++++
> >  2 files changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/display/xe_display.c
> > b/drivers/gpu/drm/xe/display/xe_display.c
> > index 810d93fefcbc..ec65dcbc3fdc 100644
> > --- a/drivers/gpu/drm/xe/display/xe_display.c
> > +++ b/drivers/gpu/drm/xe/display/xe_display.c
> > @@ -304,7 +304,6 @@ void xe_display_pm_suspend(struct xe_device *xe)
> >  	 * properly.
> >  	 */
> >  	intel_display_power_disable(display);
> > -	drm_client_dev_suspend(&xe->drm);
> >
> >  	if (intel_display_device_present(display)) {
> >  		drm_kms_helper_poll_disable(&xe->drm);
> > @@ -461,8 +460,6 @@ void xe_display_pm_resume(struct xe_device *xe)
> >
> >  	intel_opregion_resume(display);
> >
> > -	drm_client_dev_resume(&xe->drm);
> > -
> >  	intel_display_power_enable(display);
> >  }
> >
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 99562f691080..d00c620d0926 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/suspend.h>
> >  #include <linux/dmi.h>
> >
> > +#include <drm/drm_client_event.h>
> >  #include <drm/drm_managed.h>
> >  #include <drm/ttm/ttm_placement.h>
> >
> > @@ -177,6 +178,7 @@ int xe_pm_suspend(struct xe_device *xe)
> >  	int err;
> >
> >  	drm_dbg(&xe->drm, "Suspending device\n");
> > +	drm_client_dev_suspend(&xe->drm);
> >  	xe_pm_block_begin_signalling();
> >  	trace_xe_pm_suspend(xe, __builtin_return_address(0));
> >
> > @@ -219,6 +221,7 @@ int xe_pm_suspend(struct xe_device *xe)
> >  err:
> >  	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
> >  	xe_pm_block_end_signalling();
> > +	drm_client_dev_resume(&xe->drm);
> >  	return err;
> >  }
> >
> > @@ -292,10 +295,12 @@ int xe_pm_resume(struct xe_device *xe)
> >
> >  	drm_dbg(&xe->drm, "Device resumed\n");
> >  	xe_pm_block_end_signalling();
> > +	drm_client_dev_resume(&xe->drm);
> >  	return 0;
> >  err:
> >  	drm_dbg(&xe->drm, "Device resume failed %d\n", err);
> >  	xe_pm_block_end_signalling();
> > +	drm_client_dev_resume(&xe->drm);
> >  	return err;
> >  }
>=20
> --
> Jani Nikula, Intel
