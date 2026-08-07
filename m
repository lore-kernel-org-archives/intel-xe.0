Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112C5C2A09B
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 13:38:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B821110F4E0;
	Fri,  7 Aug 2026 13:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUoQLjf7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF8310F4DC
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 13:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786109926; x=1817645926;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mRK3shOVhDMCpj2t1F+elXhY13O1pb5jTPoLTX9hDoU=;
 b=PUoQLjf7Csh5NK3pyFbv4asSzPckHV2HVwEbyWCYLEoRrLxKSVID9fc1
 wa99XBV+ENEb9ZbXsxJJRl7Ba+iv0gtsgaO3uQFS1biptpHpQeH+TXSPt
 aPNMZFax4nnRsd2HtrKHSrnkXrAj9uQVOvjdpfY1xz1+MVDz60uM0J9YA
 SdQvVV+fgm7mErmDNgW6QDG8ZXM7jitcOXfR6c5OfT6wVs0EKIiMqqWvA
 mZ1o4wazUQWKcnDOeG/+CWWbW4+1Pin3CUlGQn8rUXwDktYP/ycba/bZy
 RtRiUDKFbm7ITMs63Ri5JGRUKWdtrglxOiuVNiLUDi6pq2yBd5dTHQaJI Q==;
X-CSE-ConnectionGUID: 1PBnDU9oSZiUAxwKe1lO/g==
X-CSE-MsgGUID: UFbBAcB3T/er7G9PLVy/QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="104251946"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="104251946"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 06:38:45 -0700
X-CSE-ConnectionGUID: dy4iKsuLRoS1CGBW3TxDSw==
X-CSE-MsgGUID: R8VRIn+HQait2Iyr3ywPLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="260633933"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 06:38:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 06:38:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 06:38:45 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.35)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 06:38:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P1nGqW9be9Hwx7v1GKk2lKHUNRwEAxwKuASf6cS7w7I8rc11c4eCukbh75ln0gF9FIr4Ha1xTe9Kd69obxca0j6LXa9Y/6I+j3bZm4lT4NHG/TyHlW/EgFYQQjSnWEzP9yvRpeY0BUSQs/FOvj8tEXCCrKwoUSYrVZbiFzoBR09t0sHSLn6HjcI0/J3lBgx0dmlJ0liS6MluMLEBMn5205/3njokMuq4xvaWV1SBl5BEKO38xXlFf8GMEeYJKyC0Jbc1wup5SV3/YHLn7O0SQhje+7sIDXYMBx7tuEcSmEsMBblysU2B7Tz5jgFfDv896LI0HzaJ3m+lCiaps+Gauw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AgKNP13FqP7iSQf+fIKFpJH/wPo2YBlEvshWlcfbQ0=;
 b=Kq5A2IZN8S1dTul82s4LXpRkoYzE7KvGOh/GJnEdZSb/4vVfNWUK0If0reMetfJqttOPuLKcTutCTRqdhoDK6Z6YC0VA+rvZ7yrSYUFjqCqq9PWPwVENP7+5Og7xjXvfa+O/gG7O35ZFaQeIistf/OxN7fYZUmLx27QDTnXYTjw1y0aRg3a1dBFL33GKz5ujiuoe3QqVfCjEvaN0OT58lOm1o67XJi/G+ENh35t8xQbqDW0N8WVK95rKz79Kxz16FnzAQLWduYdllehqjJdjwlF5LJOB5MQFFODQfedjM8ngc7lS0zRHdy8d9hihHiqTjUW18gdKA+v9wojtZdpjsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by CH3PR11MB7276.namprd11.prod.outlook.com (2603:10b6:610:14b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 13:38:40 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5%5]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 13:38:40 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>
Subject: RE: [PATCH] drm/xe/pm: do not warn about missing runtime PM
 protection after hot-unplug
Thread-Topic: [PATCH] drm/xe/pm: do not warn about missing runtime PM
 protection after hot-unplug
Thread-Index: AQHdJXxTptuMu+m8g0eOQD9AMTdbU7aQsKkAgAAS64CAAJ2OgIABF9TA
Date: Fri, 7 Aug 2026 13:38:40 +0000
Message-ID: <SA3PR11MB81187A8BED050933916D5E02D0D12@SA3PR11MB8118.namprd11.prod.outlook.com>
References: <20260806085711.437110-2-nitin.r.gote@intel.com>
 <anRGHJeae97n3ZwU@black.igk.intel.com>
 <anRV+xVRHWpTEiFh@gsse-cloud1.jf.intel.com>
 <anTaJUiijSUN+Dmm@gsse-cloud1.jf.intel.com>
In-Reply-To: <anTaJUiijSUN+Dmm@gsse-cloud1.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8118:EE_|CH3PR11MB7276:EE_
x-ms-office365-filtering-correlation-id: 4ee42c20-39f8-4669-a420-08def489312e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|38070700021|6133799003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info: v9colUTu0jyH/tcZfbj0ZF/uBzrxyNbhvP2khFMa+0MWldhFMIQ/soDdd1wsTsRM/hP7WWmxlxYxW6YuRQ6fKSGLHxvckVAAofUuQC+OonpB1/l0sOXxKMLXzvBKdpsZp4deNoN7QaEumqsFXSIl8dv843YdiECGx9r6o/I55xMuWLQOgtXnQ2cSHG0Pn14XBl0fUiqNQqQktMz26JV9ac7BA515+xn8wEjF0fRpt7e0RFBOiZ3rWQxDDCp7yKG/Jc/ALLxZJCylCHvsE+PB8Bbp4VO4hSDvobTQUTJIdzPaurelu9qgu/JMoMoWEs2IO8aHwDHK+b4DXaORScFhBZxF/Mk5N5HyenUeYjtzRhBFsAmMh/VdCAdwjL+/nZhPnuA2V8p7FASAhKLbiuKjbEBruO3JEEwAh+SDko5GvSyOvF4xLp1pbMQUUR+T0yMjWmsG3pxgNq4SCNsfAkxeNDl8eiXZCpZp/yrQ1mm6U7SuIx2GCOAsCRb9UJVRRX5pcMKRJENjxHealzKpGB38etNNQlHzomhtfmi3o5TIIajHylTz8Z/G/7jFF6Qec/I/c7umvzs6jPuU+8tLzDioiAHvbny9qw56XzNj5l1NcIUK8CuM01NCUZ1lOKXz1QOYYyWFHRzKkXCuY2ksFM384Yri5g3w7zYbHWAXuQk/fNNqCsti0aanDBVzhebcBiMEv3tQ3k/cdjH4XFV0P1QOdbex8EfRGFPm0J/8iI3DKvU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8118.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yUpb09D9lWF9oTR4smCoKiDam2v4ljtXdKo+ELV8u0ivP92JvxJND1azrVC0?=
 =?us-ascii?Q?ZxqToiZKStXzDnfBHNYiWCZ81kigL2xK4W37UnfnsaP0pItXtJHpAX+ZKoAq?=
 =?us-ascii?Q?Rlbu2gMvAmoL1V6zZEsFpnmBwLZfe7AK0D9rPaGWHtVY1HcbQ1FFj1/NfM8c?=
 =?us-ascii?Q?pE+9YLPLbuUQR9kZ3shcfNQVRzYuYqCdHnfk25XDcg9kdv4MTNqEssvEiwx3?=
 =?us-ascii?Q?uJVyBGxvDr/EdzczqS5DdWbYfvt2iDyUCKCfK4rCulkBXR/8dv5VMAAj9oBU?=
 =?us-ascii?Q?2DrrcBOGuaeSeDuKbgO2YSnOsX1iMN8HQfsw3ZUEm+gv0acFT2SePA0BTL9n?=
 =?us-ascii?Q?Sz0nNneDd7WUQHG23PuKvUCWXPDsaJSA5zBCRkL7M0PzLAfm/2z7oWuPG+tg?=
 =?us-ascii?Q?B5BkcTfC2A2xP0Mu1TvGmaCwVIabAzyntQXcDkhINaEDLn4D1pKvqCT7C2wU?=
 =?us-ascii?Q?99+pz1MZGv20+jcDJgJhDliP6JuFNc9kefiiMaczscvUSTX2HSeZGriXpdie?=
 =?us-ascii?Q?uRVMmYemstaaDzxYj9tbC/ZyAFkwdEv1hhX2oenkUWwwmEgxEodZQ+cU2TFM?=
 =?us-ascii?Q?t5Q8DzwrNTgXNr1vi0EyO0gB54+ZtRzcZ7ARDmrO+X2oLWKa4UlBj9m8kLHB?=
 =?us-ascii?Q?RJ/NvmyHWQ2H/IPL2/CgbEv2h47JPrxRnbv7tYHfRG8OM032KSkklSoK08JF?=
 =?us-ascii?Q?ndI7W0Yz1RQryhHkyDBx6O0T+dYp33pCxSfviW3QgCdE+WQjBaUeqPlPcHn9?=
 =?us-ascii?Q?gnF7K04Ah2F6PI8VHn3iquYvXsk+yYVuZPTAWtJJbUTqgxpld9cwwTf4VIil?=
 =?us-ascii?Q?oiBxNYRhRD69RaHdmNEcfnPMiIEB3fS1opJlfrrcluzu33j+FxDlm5ZZyv7F?=
 =?us-ascii?Q?7dFXPwTcjpTN1UB3mFZrCNs9FpX9rOEiQjOf5KMpCCE0ZfamHGRDw0YU1Yf+?=
 =?us-ascii?Q?g+INs9XJi2Lw+PNlV112KlFxKRM5e4XBdA2XtxeKjfJyE0cTZgG3QdvP1GvI?=
 =?us-ascii?Q?wLYJUbF35hq0JR8OeHJoaaoOVdEINzt8l0RKFGARoiaYKLHJB51nD+YkZVQa?=
 =?us-ascii?Q?yCgx+UI4OrxUKEeanF5igbkhEgHB3/3aY7s3YWObMZahC9WHklEZRMia08fJ?=
 =?us-ascii?Q?a/fWmOyp8vLPdib3iMTEevFBwXGOjALh7ErHnAWOG+SIGOP2nzt+gdqty8pC?=
 =?us-ascii?Q?iAXCmXRjm+7JoEmkwpYM/6JDmw3L6j5QZf4mCmbx9QIm23tYlPZ+UIJw+IfM?=
 =?us-ascii?Q?vrEXNgFClcnniVK0FaCqwnoc8jLOY3eghYfWf4IDv3RARg6wncDQhrTywAs/?=
 =?us-ascii?Q?LafZLxXYIo6qkmGQ4/XVsR5ynxv1UnMEK5RCNRBWz5ZJBHx0wulllguuW4r0?=
 =?us-ascii?Q?Qg33SqzTS1pPA9SAbUue7IrWpG+tz55Qs3Dtu6DCqhhkfo83/J2B/2OWnno6?=
 =?us-ascii?Q?3oTzi6Nuvsxq9FGeF2SguXaFllGh5Mlu6bYZOkCILzuSLsOh5BMpFPOR9Vtj?=
 =?us-ascii?Q?wAn4rhAN2NxMCkXE/clILhpZAVSenvUHsdRsscHpqDPIsAH4K+68ZgolQHmj?=
 =?us-ascii?Q?LbGvyCTeHx769esuQCNAT20A60gYmfzqvYdJxsL1f4cq/HRfxNPwZOEpdgKD?=
 =?us-ascii?Q?p+esIjqh9TSTb50U/T56pnT10GYhA8Iv/aRErjkUtkBJbaFmGudQDYSr/OK2?=
 =?us-ascii?Q?vvHcVQYdWSdYbv2EU7t4WiITMLJgs7ZqCvq7de4ttPnS59GoKlnVwcbvMkCc?=
 =?us-ascii?Q?cJe0Hfk5IQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: G3IMj4Qj+DBC5TCGGUjQIs3jDlZzS9WcRuopGk3A77W9t+egqXtJrsu2poDRqwglzPDUC2Hct1k4fCQf3PwyvyIb7W02/+BJKHF2sFM28yJ8PShnsvuIHdEvekg3phHkPxe2t3CsVWyTKJjWJvWxdS8DTwQXTKIXj2g0+nLNu60LVV6/2Dp2J9tybTDJ+uxvv3L/rCsYpRFnlgzqLJqOJC31gofJSz0pQxcCD5GW+t5naeH/rbaCcTAY+3qB4TKM9zj9rzbMOp0gjEM3NQIWwb6nvo4EaisV7YeffAMJZIHoywCmy3/KYNCJokTtODlkEbeoH0WjghwSogWqIvv7zg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee42c20-39f8-4669-a420-08def489312e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2026 13:38:40.5565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rw48BLElyiluiqS3uXZW0Yl/wfGjuDV561EMjY6hBzGNu59p4jaGjAStNSMFXvXN/x8xqqoBkKaseYapnYDgEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7276
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

Hi Matt,

> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Friday, August 7, 2026 12:32 AM
> To: Jadav, Raag <raag.jadav@intel.com>
> Cc: Gote, Nitin R <nitin.r.gote@intel.com>; intel-xe@lists.freedesktop.or=
g; Auld,
> Matthew <matthew.auld@intel.com>
> Subject: Re: [PATCH] drm/xe/pm: do not warn about missing runtime PM
> protection after hot-unplug
>=20
> On Thu, Aug 06, 2026 at 02:38:03AM -0700, Matthew Brost wrote:
> > On Thu, Aug 06, 2026 at 10:30:20AM +0200, Raag Jadav wrote:
> > > On Thu, Aug 06, 2026 at 02:27:12PM +0530, Nitin Gote wrote:
> > > > Exec queues are owned by user fds and are destroyed when the fd is =
closed.
> > > > After hot-unplug this can happen from a deferred close during
> > > > process exit, after the device has been removed and runtime PM has =
been
> disabled.
> > > > The queue destroy path can call xe_pm_runtime_get_noresume(), and
> > > > since runtime PM is disabled pm_runtime_get_if_in_use() returns no
> > > > reference, so it warns about "Missing outer runtime PM protection".
> > > >
> > > > This is a false positive for the hot-unplug teardown case. The
> > > > device is already unplugged, and the queue destroy path that
> > > > triggered this warning was checked and does not touch hardware
> > > > state after unplug. GuC has already been sanitized by
> > > > guc_fini_hw(), so no H2G is sent and the hardware teardown path is =
no
> longer reachable.
> > > >
> > > > Skip the warning when the DRM device is already unplugged.
> > > >
> > > > Observed with new IGT core_hotunplug subtests:
> > > >   igt@core_hotunplug@hotreplug-with-load
> > > >   igt@core_hotunplug@hotunplug-rescan-with-load
> > > >
> > > > v2:
> > > >  - Drop the drm_dev_is_unplugged() bypass from guc_exec_queue_destr=
oy()
> > > >    and instead exclude hot-unplug from the WARN in
> > > >    xe_pm_runtime_get_noresume(). (Matthew Brost)
> > > >
> >
> > I don't think this was suggestion but also I believe I misunderstood
> > the problem, but maybe this works.
> >
> > > > v3:
> > > >  - Clarify that the queue destroy path was checked and does not tou=
ch
> > > >    hardware state after unplug. (Matthew Auld)
> > > >
> > > > Link:
> > > > https://patchwork.freedesktop.org/patch/725773/?series=3D166744&rev=
=3D
> > > > 4
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > Assisted-by: GitHub-Copilot:claude-opus-4.8
> > > > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_pm.c | 5 ++++-
> > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c
> > > > b/drivers/gpu/drm/xe/xe_pm.c index a5289a9df8d2..a038687d5b2c
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > @@ -10,6 +10,7 @@
> > > >  #include <linux/suspend.h>
> > > >  #include <linux/dmi.h>
> > > >
> > > > +#include <drm/drm_drv.h>
> > > >  #include <drm/drm_managed.h>
> > > >  #include <drm/ttm/ttm_placement.h>
> > > >
> > > > @@ -914,7 +915,9 @@ void xe_pm_runtime_get_noresume(struct
> > > > xe_device *xe)
> > >
> > > From the documentation
> > >
> > >  * This function should be used in inner places where it is surely
> > > already
> > >  * protected by outer-bound callers of `xe_pm_runtime_get`.
> > >
> >
> > We should have those.
> >
> > > >  	if (!ref) {
> > > >  		pm_runtime_get_noresume(xe->drm.dev);
> > > > -		drm_WARN(&xe->drm, !xe_pm_suspending_or_resuming(xe),
> > > > +		drm_WARN(&xe->drm,
> > > > +			 !drm_dev_is_unplugged(&xe->drm) &&
> > > > +			 !xe_pm_suspending_or_resuming(xe),
> > >
> > > So IMO this is more of a band-aid.
> > >
> >
> > So if I'm understanding the problem correctly,
> > pm_runtime_get_if_in_use() (via guc_exec_queue_add_msg()) fails when
> > the device is unplugged? I don't see how the PM reference count could
> > be zero, regardless of whether the device is plugged in or unplugged.
> >
> > My suggestion was (and still is) that guc_exec_queue_destroy() should
> > always add a message and determine whether the device/firmware is
> > still alive while processing that message, then either kick the
> > destory or issue H2G. Other messages likely are also missing proper
> > device alive checks too.
> >

Yes, it was. Initially, I thought to send this as a separate patch once thi=
s issue was fixed.=20
However, I think it's better to include it in this patch itself.

> > If, for some reason, obtaining a PM reference via
> > xe_pm_runtime_get_noresume() doesn't work when the device is
> > unplugged, then that logic should be handled in the message submission
> > layer. For example, use drm_dev_enter()/drm_dev_exit() for hot-unplug
> > protection, only take a PM reference if the device is still bound,
> > encode that information into the message, and then determine the
> > appropriate next steps when the message is processed.
> >
>=20
> Below is rough sketch of what I was thinking. We can also probably rip ou=
t
> EXEC_QUEUE_FLAG_PERMANENT then too. We'd also need solid explaination
> how why xe_pm_runtime_get_noresume doesn't work if device is unplugged, a=
s
> that part it unclear to me too.

Regarding why xe_pm_runtime_get_noresume() doesn't work after hot-unplug, I=
 did some debugging.=20
You were right that this is not a zero refcount case. At the warning observ=
ed: usage_count=3D3, status=3D2(RPM_SUSPENDED) and disable_depth=3D1.

During hot-unplug, the PCI remove path goes through: device_del() -> pm_run=
time_remove() -> __pm_runtime_disable(), which disables runtime pm=20
and increments disable_depth from 0 to 1. The old struct device stays alive=
 because the old drm_device is still referenced by an open fd.=20
When that fd is finally closed, guc_exec_queue_destroy() runs on the old de=
vice where runtime PM is already disabled (disable_depth=3D1).=20
In that state, pm_runtime_get_if_in_use() returns -EINVAL regardless of the=
 non-zero usage count, which causes xe_pm_runtime_get_noresume()=20
to hit the "Missing outer runtime PM protection" WARN.

So this does not appear to be an actual missing runtime PM reference. The f=
ailure is caused by runtime PM already being disabled during device removal=
.=20
I'll move the handling to the message submission layer as you suggested, ta=
king the PM reference only while drm_dev_enter() indicates the device is st=
ill bound,=20
instead of trying to gate the warning.

To confirm this, I added some debug log and saw:
disable_depth=3D1, status=3D2(RPM_SUSPENDED),  usage_count=3D3

Thank you for the rough sketch, Matt. I'll work on that approach.

Nitin

>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9036f89dff7d..08000f8db28a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1812,32 +1812,15 @@ static void __guc_exec_queue_destroy_async(struct
> work_struct *w)  static void guc_exec_queue_destroy_async(struct
> xe_exec_queue *q)  {
>         INIT_WORK(&q->guc->destroy_async, __guc_exec_queue_destroy_async)=
;
> -
> -       /* We must block on kernel engines so slabs are empty on driver u=
nload */
> -       if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
> -               guc_exec_queue_do_destroy(q);
> -       else
> -               xe_destroy_wq_queue(&q->guc->destroy_async);
> +       xe_destroy_wq_queue(&q->guc->destroy_async);
>  }
>=20
> -static void __guc_exec_queue_destroy(struct xe_guc *guc, struct
> xe_exec_queue *q) -{
> -       /*
> -        * Might be done from within the GPU scheduler, need to do async =
as we
> -        * fini the scheduler when the engine is fini'd, the scheduler ca=
n't
> -        * complete fini within itself (circular dependency). Async resol=
ves
> -        * this we and don't really care when everything is fini'd, just =
that it
> -        * is.
> -        */
> -       guc_exec_queue_destroy_async(q);
> -}
> -
> -static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg
> *msg)
> +static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg
> *msg,
> +                                                bool bound)
>  {
>         struct xe_exec_queue *q =3D msg->private_data;
>         struct xe_guc *guc =3D exec_queue_to_guc(q);
>=20
> -       xe_gt_assert(guc_to_gt(guc), !(q->flags &
> EXEC_QUEUE_FLAG_PERMANENT));
>         trace_xe_exec_queue_cleanup_entity(q);
>=20
>         /*
> @@ -1850,10 +1833,10 @@ static void
> __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
>          *   it is safe to directly destroy the exec queue on driver side=
, as the GuC
>          *   will not process further requests and all resources must be =
cleaned up
> locally.
>          */
> -       if (exec_queue_registered(q) && xe_uc_fw_is_running(&guc->fw))
> +       if (bound && exec_queue_registered(q) &&
> + xe_uc_fw_is_running(&guc->fw))
>                 disable_scheduling_deregister(guc, q);
>         else
> -               __guc_exec_queue_destroy(guc, q);
> +               guc_exec_queue_destroy_async(q);
>  }
>=20
>  static bool guc_exec_queue_allowed_to_change_state(struct xe_exec_queue
> *q) @@ -1861,12 +1844,13 @@ static bool
> guc_exec_queue_allowed_to_change_state(struct xe_exec_queue *q)
>         return !exec_queue_killed_or_banned_or_wedged(q) &&
> exec_queue_registered(q);  }
>=20
> -static void __guc_exec_queue_process_msg_set_sched_props(struct
> xe_sched_msg *msg)
> +static void __guc_exec_queue_process_msg_set_sched_props(struct
> xe_sched_msg *msg,
> +                                                        bool bound)
>  {
>         struct xe_exec_queue *q =3D msg->private_data;
>         struct xe_guc *guc =3D exec_queue_to_guc(q);
>=20
> -       if (guc_exec_queue_allowed_to_change_state(q))
> +       if (guc_exec_queue_allowed_to_change_state(q) && bound)
>                 init_policies(guc, q);
>         kfree(msg);
>  }
> @@ -1904,13 +1888,14 @@ static void suspend_fence_signal(struct
> xe_exec_queue *q)
>         __suspend_fence_signal(q);
>  }
>=20
> -static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg
> *msg)
> +static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg
> *msg,
> +                                                bool bound)
>  {
>         struct xe_exec_queue *q =3D msg->private_data;
>         struct xe_guc *guc =3D exec_queue_to_guc(q);
>=20
>         if (guc_exec_queue_allowed_to_change_state(q) &&
> !exec_queue_suspended(q) &&
> -           exec_queue_enabled(q)) {
> +           exec_queue_enabled(q) && bound) {
>                 wait_event(guc->ct.wq, vf_recovery(guc) ||
>                            ((q->guc->resume_time !=3D RESUME_PENDING ||
>                            xe_guc_read_stopped(guc)) &&
> !exec_queue_pending_disable(q))); @@ -1934,11 +1919,12 @@ static void
> __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>         }
>  }
>=20
> -static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg
> *msg)
> +static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg
> *msg,
> +                                               bool bound)
>  {
>         struct xe_exec_queue *q =3D msg->private_data;
>=20
> -       if (guc_exec_queue_allowed_to_change_state(q)) {
> +       if (guc_exec_queue_allowed_to_change_state(q) && bound) {
>                 clear_exec_queue_suspended(q);
>                 if (!exec_queue_enabled(q)) {
>                         q->guc->resume_time =3D RESUME_PENDING; @@ -1950,=
17
> +1936,20 @@ static void __guc_exec_queue_process_msg_resume(struct
> xe_sched_msg *msg)
>         }
>  }
>=20
> -static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct
> xe_sched_msg *msg)
> +static void
> +__guc_exec_queue_process_msg_set_multi_queue_priority(struct
> xe_sched_msg *msg,
> +                                                     bool bound)
>  {
>         struct xe_exec_queue *q =3D msg->private_data;
>=20
> -       if (guc_exec_queue_allowed_to_change_state(q))
> +       if (guc_exec_queue_allowed_to_change_state(q) && bound)
>                 guc_exec_queue_send_cgp_sync(q, 0);
>=20
>         kfree(msg);
>  }
>=20
> -static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg
> *msg)
> +static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg
> *msg,
> +                                                 bool bound)
>  {
>         struct xe_exec_queue *q =3D msg->private_data;
>=20
> @@ -1969,7 +1958,7 @@ static void
> __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg)
>          * CGP update + CGP_SYNC (re-applies the current priority from
>          * q->multi_queue.priority).
>          */
> -       if (guc_exec_queue_allowed_to_change_state(q))
> +       if (guc_exec_queue_allowed_to_change_state(q) && bound)
>                 guc_exec_queue_send_cgp_sync(q, 0);  }
>=20
> @@ -1982,37 +1971,46 @@ static void
> __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg)
>  #define OPCODE_MASK    0xf
>  #define MSG_LOCKED     BIT(8)
>  #define MSG_HEAD       BIT(9)
> +#define MSG_PM_REF     BIT(10)
>=20
>  static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)  {
>         struct xe_device *xe =3D guc_to_xe(exec_queue_to_guc(msg->private=
_data));
> +       int idx;
> +       bool pm_ref =3D !!(msg->opcode & MSG_PM_REF),
> +            bound =3D drm_dev_enter(&xe->drm, &idx);
>=20
>         trace_xe_sched_msg_recv(msg);
>=20
> -       switch (msg->opcode) {
> +       switch (msg->opcode & OPCODE_MASK) {
>         case CLEANUP:
> -               __guc_exec_queue_process_msg_cleanup(msg);
> +               __guc_exec_queue_process_msg_cleanup(msg, bound);
>                 break;
>         case SET_SCHED_PROPS:
> -               __guc_exec_queue_process_msg_set_sched_props(msg);
> +               __guc_exec_queue_process_msg_set_sched_props(msg,
> + bound);
>                 break;
>         case SUSPEND:
> -               __guc_exec_queue_process_msg_suspend(msg);
> +               __guc_exec_queue_process_msg_suspend(msg, bound);
>                 break;
>         case RESUME:
> -               __guc_exec_queue_process_msg_resume(msg);
> +               __guc_exec_queue_process_msg_resume(msg, bound);
>                 break;
>         case SET_MULTI_QUEUE_PRIORITY:
> -               __guc_exec_queue_process_msg_set_multi_queue_priority(msg=
);
> +               __guc_exec_queue_process_msg_set_multi_queue_priority(msg=
,
> +
> + bound);
>                 break;
>         case CGP_SYNC_MSG:
> -               __guc_exec_queue_process_msg_cgp_sync(msg);
> +               __guc_exec_queue_process_msg_cgp_sync(msg, bound);
>                 break;
>         default:
>                 XE_WARN_ON("Unknown message type");
>         }
>=20
> -       xe_pm_runtime_put(xe);
> +       if (pm_ref)
> +               xe_pm_runtime_put(xe);
> +
> +       if (bound)
> +               drm_dev_exit(idx);
>  }
>=20
>  static const struct drm_sched_backend_ops drm_sched_ops =3D { @@ -2137,1=
0
> +2135,17 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)  sta=
tic
> void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg
> *msg,
>                                    u32 opcode)  {
> -       xe_pm_runtime_get_noresume(guc_to_xe(exec_queue_to_guc(q)));
> +       struct xe_guc *guc =3D exec_queue_to_guc(q);
> +       struct xe_device *xe =3D guc_to_xe(guc);
> +       int idx;
> +       bool bound =3D drm_dev_enter(&xe->drm, &idx);
>=20
>         INIT_LIST_HEAD(&msg->link);
>         msg->opcode =3D opcode & OPCODE_MASK;
> +       if (bound) {
> +               xe_pm_runtime_get_noresume(guc_to_xe(exec_queue_to_guc(q)=
));
> +               msg->opcode |=3D MSG_PM_REF;
> +       }
>         msg->private_data =3D q;
>=20
>         trace_xe_sched_msg_add(msg);
> @@ -2150,6 +2155,9 @@ static void guc_exec_queue_add_msg(struct
> xe_exec_queue *q, struct xe_sched_msg
>                 xe_sched_add_msg_locked(&q->guc->sched, msg);
>         else
>                 xe_sched_add_msg(&q->guc->sched, msg);
> +
> +       if (bound)
> +               drm_dev_exit(idx);
>  }
>=20
>  static void guc_exec_queue_try_add_msg_head(struct xe_exec_queue *q, @@ =
-
> 2182,10 +2190,7 @@ static void guc_exec_queue_destroy(struct xe_exec_queu=
e
> *q)  {
>         struct xe_sched_msg *msg =3D q->guc->static_msgs + STATIC_MSG_CLE=
ANUP;
>=20
> -       if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) &&
> !exec_queue_wedged(q))
> -               guc_exec_queue_add_msg(q, msg, CLEANUP);
> -       else
> -               __guc_exec_queue_destroy(exec_queue_to_guc(q), q);
> +       guc_exec_queue_add_msg(q, msg, CLEANUP);
>  }
>=20
>  static int guc_exec_queue_set_priority(struct xe_exec_queue *q, @@ -2650=
,7
> +2655,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct
> xe_exec_queue *q)
>         }
>=20
>         if (do_destroy)
> -               __guc_exec_queue_destroy(guc, q);
> +               guc_exec_queue_destroy_async(q);
>  }
>=20
>  static int guc_submit_reset_prepare(struct xe_guc *guc) @@ -3296,7 +3301=
,7
> @@ static void handle_deregister_done(struct xe_guc *guc, struct
> xe_exec_queue *q)
>         trace_xe_exec_queue_deregister_done(q);
>=20
>         clear_exec_queue_registered(q);
> -       __guc_exec_queue_destroy(guc, q);
> +       guc_exec_queue_destroy_async(q);
>  }
>=20
> > Sorry a lot of this stuff in xe_guc_submit.c around corner cases /
> > teardwons is a mess from early Xe work I did, we should aim to clean
> > this up with clear semantics.
> >
> > Matt
> >
> > > Raag
> > >
> > > >  			 "Missing outer runtime PM protection\n");
> > > >  	}
> > > >  }
> > > > --
> > > > 2.50.1
> > > >
