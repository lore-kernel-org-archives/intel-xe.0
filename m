Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74285D44172
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 15:20:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C73D10E0C2;
	Tue, 19 Nov 2024 15:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LKlpa9UV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF8510E0C2
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 15:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732029604; x=1763565604;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Wi2XCeqjKCPdtfjLfNLlL8T2nT7tc1XMhkg51dqFxfw=;
 b=LKlpa9UVVemFz+dgYtRTu3GbegPNKYi65ZcArcF+315L3ldkq5qKskni
 lzDdcHFVRV4gejkYwtftWzE/bckLmKvTdoCrNZqRHZSxsuIhsn38qaB37
 LR6oLD7i+xbC6Sy8GGW9CjgSxI4F05shuxYRBBLvOIJ6LQoaUi4XBXitK
 8Mh0/YCztlsMjYpZQUxdPuD0eHYFoKd0BSbevEycEbr1lZy4fbeFWW8a5
 sYyoAMg/eqUHHGkoS6H8CrmoztG6yCEkjWOlQm7OFQ1KnpduDD/PUYLEu
 RWYUfPkKtThe/ufa/LYmGRKSGukp8x5Sq4rbD2dEzKwjV4cPo6OCINk0z w==;
X-CSE-ConnectionGUID: aL+kffuZTGG8aq1AltBb6Q==
X-CSE-MsgGUID: 891q5RxpSSqxxGLs3LUnGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="43422027"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="43422027"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 07:20:03 -0800
X-CSE-ConnectionGUID: KHsYfi/tQMCQ6c5G/HKyZw==
X-CSE-MsgGUID: npE0zc3YQJmAHrwvBFruDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="93669255"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 07:20:02 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 07:20:02 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 07:20:02 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 07:20:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MhXLfjQI1UNBjopKZcrhhMLQ+IB7BmeyjbcFhtbXQns3NZvGzvvIpNK/16cZLyEElw8xGWKOyDP8Wddn1k0TxIeKP6CpzFd1cchjhgCwUzIeS25oG3H8DQHy4m4awAQVCjbjJhjqP53WuDvsOP/rba0PddQAO9PD007GWyikbuLNrf21JKwxAta6p49k9wzyF+b9c1beazUc45xUOdSB2HyjFFPwBiWECYak85+aAy2iuZAKEtTKDFjqF/roSnSwW0S0jz7xAbv1ZINxr9JeagylZCoBJS9Gx5wc3Wxgc9iwhzeT6byHPbccIGVeBxMEH1iZjcMAP08OJ5kbDHvhKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3H0CUlwA4od8YKe8+Jd53XXIiTzMBDngOSK2+pMHTg=;
 b=J/539U1pO6lScFTDiulQMMGu/21nxKyrOGk9yXyiLMQRqi/tVNlSn39ha8/EqsHHFJ5Jz7tPQgpqDtcPZAqVMJTWpP/RsJqLIu7H6vugJLMstcvapa5r3cWi7fVNxrp0FzSVG1rsO49+Kk2uf/s4j9pnU4rRESxKLcfsNTfDXQcIt1AgpdymXTr5bADtzdnZUpk+gBgZD+iAu/twJeUF/nKODBEiQes1nW2CFP0jJDRFaYeEyUjovQnXwnXcgQLOs9UWwdSbDMJk1D1QRjokuzFbCIWJlqgPQnTPrKfJkHB1sJbcJFwhfzkUu3f7Z6AclX8WF0cP1XLh6hFj4ZRoRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by LV8PR11MB8608.namprd11.prod.outlook.com (2603:10b6:408:1f0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 15:19:58 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 15:19:58 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/oa: Disallow OA from being enabled on active
 exec_queue's
Thread-Topic: [PATCH] drm/xe/oa: Disallow OA from being enabled on active
 exec_queue's
Thread-Index: AQHbOiMCJLmIqgewN0aJNbEkNwnCjrK+uDRA
Date: Tue, 19 Nov 2024 15:19:58 +0000
Message-ID: <CH0PR11MB5444B89902FA25B65AD174A1E5202@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241119013256.680030-1-ashutosh.dixit@intel.com>
In-Reply-To: <20241119013256.680030-1-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|LV8PR11MB8608:EE_
x-ms-office365-filtering-correlation-id: 268b933d-e8f1-4342-397f-08dd08ada17c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?eEfHaCnSdRFfIMGWR9eoShg8EnpXWeoKVoZcLbyLhW08i6uPdUQtUQGw2qKq?=
 =?us-ascii?Q?QqenmRAm3yEnQ1e/QZt8AqL/nbZgP2Qt65LN82hplc+GOxHJo6ZA0krNmFSH?=
 =?us-ascii?Q?wPvyZKrQSnVj8rQc64aLCGTRB82sSxe0PjQZdMlntddH4l6szieO3eef/Hba?=
 =?us-ascii?Q?b/1DC7a7W1n6TCstjsFCmn2Z3GtqVHPfQLgT+UG+wjUESwA8jN9a+gGPfhYl?=
 =?us-ascii?Q?GTG/xbRR8hsPqr4gmAdGwNx6SMd3ePmgGglYXiA2BQmBUCtnJJQfOdEg2wPz?=
 =?us-ascii?Q?xiKw2JrtpzcXTegMx13L1d72buqadvfxRfDCfw1J/M1QgOFlbT5ft4ytwjDW?=
 =?us-ascii?Q?OVLOkwUICO7rKmzfARtH0gOAJHBtk/5Y4/TlKUhLy+kITnQYyF5jDZ/FFMtJ?=
 =?us-ascii?Q?1crpfi2FuAHmjuR1RaLhxFiUrLAvz77Mb24FcXoGtGYVUgfEiy/HZnfNKOJS?=
 =?us-ascii?Q?za1VgeGBNS4gMcLSUmTTvZI6gghpK7Lw6PimrxZJI3QhtWtDHIgb03iXnLj3?=
 =?us-ascii?Q?w3NS4NeBfNwhvU1oWuFzSziPk4HWfFiaMvJCAhAgn61KB3xJGlXYkLVkEmvU?=
 =?us-ascii?Q?3ixY2T0sGYpzAnlf+1Arzw6J6RzAd0ZWU7ZD1gFEYMvjW+232ZGzZIZkub91?=
 =?us-ascii?Q?47e4TJ26i2W9ABLcy3PmZVvQbyBdjUpVCfjqmRAmDDo6jhdPuwwqh4rk9fcK?=
 =?us-ascii?Q?mHjGicLg7RDTVEdaKBNlkC7mpzAyvFGeIF/SFAKPPP2k7aeic5qmCFrzTlX0?=
 =?us-ascii?Q?kRFWmj0zI+jh+JdCl+3Lx5AID3CRbVwdK10WjKgc56ooOZQS9KP50c0IFig9?=
 =?us-ascii?Q?hQICOgkheN8rtr55j8rfEPkTzJzlWVQUMetQ4Cq6NblHfOW+D4spIzftvmeE?=
 =?us-ascii?Q?LcSqDCsPp98ic4zkyDlm7OuRVyJ3WT/lkjTMM37zBvxAFE4w3wAlZMpZJqtX?=
 =?us-ascii?Q?eDpYfQ1GHe/v/K6fHphgQ/K8T/zBFNr3PvWdvA+b66j4IqA4dY/jSnc3KeJP?=
 =?us-ascii?Q?DzqCnjj4VnDeK30OrYMeLS6jgbv51kaD6qWseXroOBYk5wwj120DnIcbXvfV?=
 =?us-ascii?Q?jx7PIM2EaJA06jtriehmoEEPsxfyO9adUIw6Aw6X5kVsGsaKhalLV13oOXog?=
 =?us-ascii?Q?4byuu437jHSVrH4wGvPrLx61Kjc3p3x9A3gxZcwItOv9yncGec3A+blWJCMh?=
 =?us-ascii?Q?YyJlQVAPnTjOV6om8mQbGX2jGdMZZjCekIUVef0DUGYG9UChsilpRd5vdVtC?=
 =?us-ascii?Q?HWcl8A8nDobdo55nWO2ohy7pdZU4gnkA+kpwjxzUJOHAb/DueerUmwRaBQ1q?=
 =?us-ascii?Q?f934L6+4XgQ+U9KMq3rwH7gx2Kd76ho24cnfSWNEntESFkCQTnxuGFaRo4ng?=
 =?us-ascii?Q?gQh+HNs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xKVCLHSeMaTxGWumdHBuIf/VYmpZS5lCMTN13HwN0p/ITMHw5UhU1wKPftEV?=
 =?us-ascii?Q?/qOP+r8u0/bne17l046TQFirGGCb7tRA7WgflMRZ02DR9MpUXt5yocVbfUg2?=
 =?us-ascii?Q?j4Z2SVqyV7QbxS5ok9WDmsLOQvOI/3luQJwpSCyIrQo0VIS5ix3HnLZ8jKIy?=
 =?us-ascii?Q?HgbzpTeptanFD9Yx/bTlxuanx0hrNcO1fGTgeKYxdGCFNnKDnr6tDdJ0564t?=
 =?us-ascii?Q?zUMFo8vUtL4pizJgOUDfWLt0NI2Vwt75sosiSs0EZGXRJiwMw9b428oF4ixE?=
 =?us-ascii?Q?p4984sRL24cixCaZ2Xmx7TU15+qMIHxwPwTSN52XNK+mqAGdiES4Z8m4MguO?=
 =?us-ascii?Q?ITOGJe1nsZ25ozNr6Ksm64IpoOebNJ9ANmZtarJAQVlELHpvNwmdbC5cHvkF?=
 =?us-ascii?Q?XXHlULY9FTMHJ67kSOkSUsFwhrhQSUlsN0Iq8ZTFEn+ExSdponhsbos/GaGy?=
 =?us-ascii?Q?bYKV2xS6IPGYgijrpgWMKmALK4LEFzt0oz9w1iBtnFWTVhfpu/Jz8y65hAdY?=
 =?us-ascii?Q?D27bC/LbG61WteZ6L0MojtzeB3wQ+w/tacUdi98aOO3ZVJmwYafoVBru3Y9O?=
 =?us-ascii?Q?1tvx74ueWTp4kWwKGj28rYdGFdBO+0jLYX4wsgFsBlzHMzc5oDq7DulVp80z?=
 =?us-ascii?Q?DzxRhXJ4klQ5O+pULw4FheVLeKPL5/1x+0dvcKJL1NU3lc+DOIwDvUKnkFDD?=
 =?us-ascii?Q?V9NEtHTz3OyaoCAbemBycy7KaRxi/NC3zcjJDJtI5FlH7Q87DgpEuC+pcFX2?=
 =?us-ascii?Q?tzy6/eYkP5KMNNeGGOQz5zjfHlDLtW2yXu7vNnXdFwL7MMpJzCtNMXv9wmra?=
 =?us-ascii?Q?m84hJoQFYwoLOg0KP9g/BSc4VAQbHN+YeQm5L60NIkN9dEROIlGL+QrxtdJs?=
 =?us-ascii?Q?oLktw+whPBmEb2PiiFdCyhKE7ISsxOY9azNJz56c9lbB8CIn+VpT/gyGVmOW?=
 =?us-ascii?Q?RBU1m75kDpvadWUpursvfxuskT2hRpYLLFZzZa4ycVLpN3gH5mUJ4hxegiRf?=
 =?us-ascii?Q?kNlKKqv6xdAm1hh4p4/UZeGfszVdaV0dl1VXWdXoYB6vUVoV3uU52zw8f78X?=
 =?us-ascii?Q?7j3QLDRTd67SeLp6x7vpshRwUm2CZ1d9gBK2EDCo88K4M+MfLLKgndwE2hka?=
 =?us-ascii?Q?h0wQUC2E3mCMV5Set42AptPjMpPtgNrZ0SeG1hzMtUHPaPylNdm42mS8Fvqr?=
 =?us-ascii?Q?ViiKNWtxv1ONbRLJNdV3sL6kBx7tA6HftGv/UV7PWegSv2d6P2uJVZLP1SOY?=
 =?us-ascii?Q?cmkV96U/pn2HNcQD8sqFpUjWvCs3XvsR2QWVz56iM2y4jb3aZyOVNdzV4Dy/?=
 =?us-ascii?Q?ZmZ4SQrVCM8Qb5qrd0/qz3PRQZA8wUpFDGDnzuicnbt+Yo2SfPZ07JmS+U0l?=
 =?us-ascii?Q?FY8V9oEq+izUGLyopT5P4yREL7vj6BK7bkuXWEXcf4NuWOZpvVHxD2lJ0ok0?=
 =?us-ascii?Q?myKKQxOd0sC/YPIiaaPkyDmsaNkLKXqIDFpIfr2yqje00jN3J414nh9timzF?=
 =?us-ascii?Q?8AK8vRBmIz3BIof4ZYVYtRkgZA6v2Fz+3CzALSrVCyzQBCgLEbYgLKxKlFl2?=
 =?us-ascii?Q?DDJbqBJ8Vy8t+DofJ74nbIh66g0ythme93L3cu/C?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 268b933d-e8f1-4342-397f-08dd08ada17c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 15:19:58.8057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fiAMcUnCsQRaGj3Rwy8wMINeMMlLqnIUp8jcchKCDvjcPdHIFnXv+E3aWdGTiV+FZ2qA9HopdLUsCrEzt9BX9J75t8xB5GVOmCG4ADDtPVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8608
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

-----Original Message-----
From: Dixit, Ashutosh <ashutosh.dixit@intel.com>=20
Sent: Monday, November 18, 2024 5:33 PM
To: intel-xe@lists.freedesktop.org
Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Cavitt, Jonat=
han <jonathan.cavitt@intel.com>; Brost, Matthew <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/oa: Disallow OA from being enabled on active exec_q=
ueue's
>=20
> Enabling OA on an exec_queue toggles the OAC_CONTEXT_ENABLE bit in
> CTXT_SR_CTL register. Toggling this bit changes the size and layout of th=
e
> underlying HW context image. Therefore, enabling OA on an already active
> exec_queue (as currently implemented in xe) is an invalid operation and c=
an
> cause hangs. Therefore, disallow OA from being enabled on active
> exec_queue's (here, by active we mean a context on which submissions have
> previously happened).
>=20
> Transition from 1 -> 0 for this bit was disallowed in
> '0c8650b09a36 ("drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream
> close")'. Here we disallow the 0 -> 1 transition on active contexts.
>=20
> v2: Don't export exec_queue_enabled, define new xe_exec_queue_op (M Brost=
)
>     Directly check OAC_CONTEXT_ENABLE bit from context image (J Cavitt)
>=20
> Bspec: 60314
> Fixes: 2f4a730fcd2d ("drm/xe/oa: Add OAR support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c       |  1 +
>  drivers/gpu/drm/xe/xe_oa.c               | 13 +++++++++++++
>  3 files changed, 16 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/x=
e/xe_exec_queue_types.h
> index 1158b6062a6cd..b88d617c37b33 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -184,6 +184,8 @@ struct xe_exec_queue_ops {
>  	void (*resume)(struct xe_exec_queue *q);
>  	/** @reset_status: check exec queue reset status */
>  	bool (*reset_status)(struct xe_exec_queue *q);
> +	/** @enabled: check if exec queue is in enabled state */
> +	bool (*enabled)(struct xe_exec_queue *q);
>  };
> =20
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index f9ecee5364d82..b9b9cdb6f768b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1660,6 +1660,7 @@ static const struct xe_exec_queue_ops guc_exec_queu=
e_ops =3D {
>  	.suspend_wait =3D guc_exec_queue_suspend_wait,
>  	.resume =3D guc_exec_queue_resume,
>  	.reset_status =3D guc_exec_queue_reset_status,
> +	.enabled =3D exec_queue_enabled,
>  };
> =20
>  static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue=
 *q)
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 8dd55798ab312..4a7440c40978c 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -2066,6 +2066,19 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev=
, u64 data, struct drm_file *f
>  		if (XE_IOCTL_DBG(oa->xe, !param.exec_q))
>  			return -ENOENT;
> =20
> +		/*
> +		 * Disallow OA from being enabled on active exec_queue's. Enabling OA =
sets the
> +		 * OAC_CONTEXT_ENABLE bit in CTXT_SR_CTL register. Toggling the bit ch=
anges
> +		 * the size and layout of the underlying HW context image and can caus=
e hangs.
> +		 */
> +		if (XE_IOCTL_DBG(oa->xe,
> +				 !(xe_lrc_read_ctx_reg(param.exec_q->lrc[0],
> +				       CTX_CONTEXT_CONTROL) & CTX_CTRL_OAC_CONTEXT_ENABLE) &&

You may want to consider turning this lrc read into a helper function,
but either way:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> +				 param.exec_q->ops->enabled(param.exec_q))) {
> +			ret =3D -EADDRINUSE;
> +			goto err_exec_q;
> +		}
> +
>  		if (param.exec_q->width > 1)
>  			drm_dbg(&oa->xe->drm, "exec_q->width > 1, programming only exec_q->lr=
c[0]\n");
>  	}
> --=20
> 2.41.0
>=20
>=20
