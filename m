Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C1AC55838
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 06:10:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE54D10E274;
	Thu,  6 Aug 2026 06:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pd7iChA1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED5110E274
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 06:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785996599; x=1817532599;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ETgKB+cQxzY2Jjlqvr8JBVXID5mRBDzrUzOnFmmq2y8=;
 b=Pd7iChA1ouuS4tEQu7shuf2Gga7yr8vNxHfNt0VMo7UCejfG5HuI0+Uq
 UVJ0zHrZd3IfgkhXMY3jCfwgJF6vBnAyWqHhwWBYEGXux5zFyRI5mhLJ1
 +nWuN17yf9boRhs3UBc7PoOj3X7E/gKUOQtGB0zVoWelaszAeqs+VUOA7
 MjgYie4iahQLxWkeWa0HdeMoQRUj+rsorRMm4cqAZx012sBnWbiOGfIxg
 1TGG0ooC0i0LXl97zAnxYz+UqQVJoSUzhmfbIbnipYg+vAAUi+CnIaZit
 aT8vydwQH224X9i98GwkPefKQ34limxfoqoj/3jSbm+6s+G/ZO7v7N2vP g==;
X-CSE-ConnectionGUID: mr8EiUmnRaOQ/t4YXupjFA==
X-CSE-MsgGUID: rhStY1ETTFCumibUBojTWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="96931000"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; d="scan'208";a="96931000"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 23:09:58 -0700
X-CSE-ConnectionGUID: 4ZvDd7nUSr+TozdTXC6Wkw==
X-CSE-MsgGUID: MrlY/pX6RziYUdGQZ17w8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; d="scan'208";a="285388911"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 23:09:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 23:09:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 5 Aug 2026 23:09:56 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.58)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 23:09:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8XKUHUVCxFfCL26bBFvP2DgXHuBSSElBTCFoZcusK05dA8KQlsqO+t1yS1NBtUCrkAxwtV1K+16o28O/IEuh76Yo2QltJqXXieexbsqnskD9N1NN8amu9p5LpVhafK7TeLPwvPt85nZ2yE+fAkSCOgD8ojjSmOFvgeUd/g8+3+K5H9590xzUUvzBK9x7s4av1q3xlbNKhuOy+btrhi1a2UGEVQszvSsXjT+lNqupW6ZI/UEV40i7ao+gHEDfb3MZ7zOWRGBvDJJmJytWpgqlkkMgTtKAPkBk2mPDT4PjGZ0ZDP4veUlrEZw4UQ4bHzcRoPu9Uxxy0zTIq9ygebgRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETgKB+cQxzY2Jjlqvr8JBVXID5mRBDzrUzOnFmmq2y8=;
 b=dsCF8REHUEGqdKU/3aO+kbRg/AJqCqfd9RioCBCu7Bqyb4o4JEfab1/2aTh5Ux71rq6Arf5I7olFpgGs1qrHWllIRQIgdJsRxhE+96NszURwdR64uS+qyGdlPLkdaHTGWCoAFOau1jke1ZwGOgPbAFRZ+XlOjhDyEMyueuySmFOCPoylqx3QqN/0vmFi8p1KTlvpH79jeADlhJ8aN7lYreHp2GCdWFetFMVRa651a9V7B7db9jSoWmH5AgPIYoqjMYtNpPOLSuGPYc2UvQnbFoyO+DK+w1myd70N2AWPQa5ztKbKLfHxqN7W8eMBhlk+RiDhGiNdEnXgSUdt8Ytlzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 06:09:51 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5%5]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 06:09:50 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH] drm/xe/pm: do not warn about missing runtime PM
 protection after hot-unplug
Thread-Topic: [PATCH] drm/xe/pm: do not warn about missing runtime PM
 protection after hot-unplug
Thread-Index: AQHdH+A3blUlj5trUUqN9S8Ho0aa+LaFkVeAgABcjVCAABDvgIAKfHZw
Date: Thu, 6 Aug 2026 06:09:50 +0000
Message-ID: <SA3PR11MB8118FDD028B722BD940FBE85D0D22@SA3PR11MB8118.namprd11.prod.outlook.com>
References: <20260730053635.1515929-2-nitin.r.gote@intel.com>
 <amroMZ8MF0PrF8dh@black.igk.intel.com>
 <SA3PR11MB81184728764B0494D31F1036D0C92@SA3PR11MB8118.namprd11.prod.outlook.com>
 <amtECTK2qry7RVzR@black.igk.intel.com>
In-Reply-To: <amtECTK2qry7RVzR@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8118:EE_|SA2PR11MB5177:EE_
x-ms-office365-filtering-correlation-id: da0ab600-fcd7-4c15-a577-08def381534d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|38070700021|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: MSww+P9g2LEg2rU63E/dRDlti0QOtJpreA/Nxte3NhKylSg4IbMvxuUkqfdkuZdJVvDCl0+HlIwF/5Nw+RDdSpkVT99ce2Yi8We7xv/PlxKoCu6Cil0Y3/PXximXjFMy8dCiIpIWC/1iHf4JuGsWvIWZBjVmsz/fR+sDgT7qjWHl2AQwpjIrGSpnHQULdov5v6Q9L/WNcqcYkFGZukUFaQHTzGyV6f3ZkIWEUUpk32jGwhMlVDomu0/P4NrSUrBUKppnHjaC38s+4yiuajHf8rd8PtjhxyOmxdr8iQPo4loefLRtyqhjYIl9XfgBBEQSHQPN1HSQEadJEFMrcuEGycFyznb6ieb4vXgshIX/2iJs5WvFoPQzAOvX04j9ix7SrnJQZmRueazySnGxIKRLUbYksQjsuL5QToKedbZfPDeoiLtWhP7SPWvqSBq5oCYuOXH2Rv6VwCJeokWnZmvtmrZF+lRVEcVw5olgPa+Y2UPXGuv6tXlVAIMtR5fXkxkYAVPR/BWuWpSPI1IvgbJgmkSPUNnpupFAO1I+41K1eZ+ZycE9ZDQ/A0xyItuev8lCrF8zflv/FXpzjFK1Dsbcs4PgUvV+XXpBX2+BcFAoX0yIFoH0kVh7qUuUYQBA256ouHeoja+QdRReADoitgs3Q4XJgbZq8SOjuUanrZgE7ZCE8vzSWftbu9IbhSiLERK/goF+zx/zROQ22U8yWAqF6ThqPuIRPrrVtDAvpF+IzrM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8118.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?w7ysZa4VR8h3B7qDNEz0ioFZfyE+DM39eulkrphd9NIjtHM7wsl61mzdPYoo?=
 =?us-ascii?Q?LhZicZBmzpHwh/SIKzGNFTnbQlg7tCLOYZ0mFzgl1w2tsf3hBxikPj5bOrt9?=
 =?us-ascii?Q?TZkq0aUqmOae6X8OGbywIaYrbvs8x3mZCY/0I5WWnY+PocH+ZGfbPNOxjxDz?=
 =?us-ascii?Q?MWaNqjpOUs9ZXdylSGHK9GgkPJC83v3ntezyzbqybPBp5TEfYNei+EE0UjFq?=
 =?us-ascii?Q?jtOYO+DDzYP+iiLz9prry677BueCrfJ4EzeT8GBTsdwa5mekscGgswFeuP29?=
 =?us-ascii?Q?P/g6dnAj1jRXKANjPV2/3XJsNQjGb6QQSYPIyYfhDMZN7vbEFp1zYpx8NtB3?=
 =?us-ascii?Q?u5fn6I4mIXIu4F4p2UCBpMNoSW6gBTHuWPLk6nW5OjxiICToyON6MG3pVw3d?=
 =?us-ascii?Q?R575WgeJxVyWT+UoKw++TwSikNd+QOFZrJMDHmAvmemIE93QHint4KeCkWZJ?=
 =?us-ascii?Q?Js1WAg4r67KjjYP3FY3YoJBzSvriDkXMIOBCunc1mjJ7D8eJHCUeHd8Ssq5O?=
 =?us-ascii?Q?KC6JifefyU/A/UjMBGoWKujK49hTgJHfKBFt8MlZ8H/+JhgwrCr4w9fFlV9w?=
 =?us-ascii?Q?qaVW1+gKWHSAQ2/F+eloKiZlOlQ0cp5A9qjnvIMFD/JoP0SPh0ZJR4u60HAZ?=
 =?us-ascii?Q?fTYZyh4GGnZW6ohgpDAhjpFR0XTbCQ16zOG2YazkTmQGBDHOuZeiFZHExsTH?=
 =?us-ascii?Q?d9s3eUqI+HWzemmUwK6Tc+LNJJf1x8MTEQPNaSqMN1GorgacbOUIeUOKf/1T?=
 =?us-ascii?Q?CICDAnjerN+TWXkAQeXWtNvY7d1ekEmQ2L6UU1VKUdbwqplzDLQq2z287Rob?=
 =?us-ascii?Q?Nb/G8eyeDIknH7I0RTdKuUxfXF+VMAjAcPX9CorrpNkZZB1gu6peJoLAmYCa?=
 =?us-ascii?Q?P2lnfqaBFnpep2S3SypgLqiqPVnT8PS7sR6jsk2bHXZvqeZQ6m+usEVcXkzc?=
 =?us-ascii?Q?0wVROfNuUqzozMl+qxYfr9AQt4FIJ5M1FS7SrmdVA3ckFFbvBJ6twTAP8Qya?=
 =?us-ascii?Q?Zw1si8uBOtz2as4OVvxpnDiAfDfWbluWFR1LKf+VnaBkifQIbbR+XF6yWyu1?=
 =?us-ascii?Q?RkFE6/CQjd/qL4AdEm3e7gMcTA/0+KAHQMTf/l14fnS0woU1EVrHfoGzjTNP?=
 =?us-ascii?Q?Wby28oa715V41tA3I70ugRJypI/bYHIeMdlphdDvVnzkUbcvslg/J5StXTUH?=
 =?us-ascii?Q?4KchxNBBXVvUlsecEkumRfcBhzG/fU3sjk7cubF/1pnlnsV+rer9EIKj7ZxO?=
 =?us-ascii?Q?ND82dibvhQOqgu+xXDa9qRlNPDu43aHeVN1JVp5ULlyA+rFEpQzZ1WyllS4v?=
 =?us-ascii?Q?K3V/AN8wwYsUj7+5jElIDIF5x6WoURgiuQYZWEHVXeTxSYMxVrCNM/X5LekY?=
 =?us-ascii?Q?TvZxImiY6EAkA8iw8BthNImFv+yqPUisqKDSAFEq42oSrHUFP8AOp9av97fP?=
 =?us-ascii?Q?O7EwGy/x5o8kUt5p6w8Ni0YiirTpjE+C1mT6lFsGWP0vhF65R+Rfd85SJWSe?=
 =?us-ascii?Q?g/ZeiRF0GkVN76dTCLhLI2Ac3SJWLY7Y6l/3b19sZPw3K1JOJz+Udr14kKCE?=
 =?us-ascii?Q?6oiNHI6p2mrvIgYDq5DfWtawvBF3uOQq9Uu6spuACk6WUmUUUamou9V7F3ht?=
 =?us-ascii?Q?inR0BPbtf8dCv6JFlAGeAw9m54I4jU3z+rTCtvRwlis3Pmivd35SLkhg/Zmu?=
 =?us-ascii?Q?KH03DpvDKbPPGv2FfwnbH78T8ngqy26HetEQBpXVUR1vdd5hzYo2mGD8is0P?=
 =?us-ascii?Q?TDAyHTIa6g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QPzXPCTlFikeLqJiGLgolZHrA7ksZQHWU/qRJPXWOzuaoXtZ7ZIdDqhavCoN4LI6s8hUURgJFcqZnAgz9Vhr5mmlqKACz/Aw42gG80WKPsZutwYXEAsmk2AotrYlkFc7CLd0GtTQnwEkOW6Q6XB/XeCTykdeE+t/RuBHf2TXbbZ5DeHMKVpYN5ynfiwHCjfc7gt51CW1lOPAYG8YneiabXhfhch1Ajq87iViuaYgdnfUJ5/Aw2U4Wr5R5md6F75pVdR0p9vdPuZWiIA1Crj3lvvpLYtX0RuGubEZRuuMfEzkB9XGV6g0D9RrUb6idpK33LGxEHXsOMVr+gGGh+L6kA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da0ab600-fcd7-4c15-a577-08def381534d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2026 06:09:50.6551 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iHjf+BIwMxQNXLpQp153/zJta0c/ZzPnNRI/FqkqEsyjxb8sVfwf2A/eUpt3AhTYsV4Uth0M7ObEf0XDe/QiIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5177
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
> From: Jadav, Raag <raag.jadav@intel.com>
> Sent: Thursday, July 30, 2026 6:01 PM
> To: Gote, Nitin R <nitin.r.gote@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Brost, Matthew <matthew.brost@intel.c=
om>;
> Auld, Matthew <matthew.auld@intel.com>
> Subject: Re: [PATCH] drm/xe/pm: do not warn about missing runtime PM
> protection after hot-unplug
>=20
> On Thu, Jul 30, 2026 at 05:35:26PM +0530, Gote, Nitin R wrote:
> > > From: Jadav, Raag <raag.jadav@intel.com> On Thu, Jul 30, 2026 at
> > > 11:06:36AM +0530, Nitin Gote wrote:
> > > > After hot-unplug, device_del() disables runtime PM. A deferred fd
> > > > close can still run later during process exit and destroy
> > > > remaining exec queues, which may call xe_pm_runtime_get_noresume().
> > >
> > > This sounds like could cause many other side effects. Why not make
> > > sure the exec queues are taken care of as part of hot-unplug path?
> > >
> >
> > Here In igt@core_hotunplug@hotreplug-with-load and
> > igt@core_hotunplug@hotunplug-rescan-with-load subtests, the workload
> > keeps the DRM fd open while the device is pci hot-unplugged. Later, fd
> > close reaches
> > guc_exec_queue_destroy() -> guc_exec_queue_add_msg() ->
> > xe_pm_runtime_get_noresume(), after pci_remove/device_del() path has
> already called pm_runtime_disable() during pci hot-unplug.
> >
> > So the WARN is a false-positive for the already-unplugged device case.
> > I will update the commit message to make this scope clearer.
>=20
> I guess my question was, is it safe have the exec queues lying around unt=
il fd
> close? Wouldn't it be more appropriate to have them cleaned up as part of=
 hot-
> unplug itself?
>=20

The exec queues are owned by user space through open DRM fds, so they're fr=
eed when the fd is closed, not forced at unplug.=20
drm_dev_unplug() marks the device unplugged but keeps the drm_device alive =
while fds are open,=20
we can't destroy a queue while it's still referenced by an open fd.

The hardware side is already cleaned up at unplug; guc_fini_hw() runs in th=
e remove path and sanitizes GuC.
So by the time the fd closes, only the software state of the queue is left,=
 and that's what gets freed here.
And when it does, the cleanup path checks xe_uc_fw_is_running(), sees GuC i=
s gone, and takes the software only teardown.

Nitin=20

> Raag
