Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2814D2F7E5
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 04:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B21E110E03B;
	Thu, 17 Oct 2024 04:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mpdPsU0K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520E910E03B
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 04:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729140364; x=1760676364;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K1cRIRe/Iqx3Ik6T74ctKWE+BK7QW0+9tvKbzUnTPdQ=;
 b=mpdPsU0KrVxauY8lh3JolCJaQHEKFMNAmTs3sKuuCBSSKkIXr+dNc1V2
 3mVoBcJNS2wob+iLbCho1Cr0QkRrzaGxwqLM5/AgEYv8QZH8Mwne1LLPN
 F9Cwdy7z9zREVrqXFAe7OmvLJFsQ1CHMhf3+yoQK5S6wUCT5A5mFrgc1B
 elbJHUuxyLSx6DJ0oI+b9n1BV0EfdJOgyOVs8TQHTm7/fa65dpBY527Qa
 E4s3A+Ic+H0x1VUB0pKFjEreSGDhfB0aVmZrBLycjGrMbzzk06t+2NkoU
 EgM08KVpf/kJKDpUkkgtWHBnfzKnWMHrgLeBgcb+Hy0LFpndu815peBoe w==;
X-CSE-ConnectionGUID: GWjCsw8OR5qE9xJgI5LS7w==
X-CSE-MsgGUID: 6QDu8Ps3QJWr1UfEAYiABA==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="31478480"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="31478480"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 21:46:04 -0700
X-CSE-ConnectionGUID: 4xkr87jQQpmudkKirscqNQ==
X-CSE-MsgGUID: zpxM8FkVQv6xJlHGHWSVtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="83082306"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2024 21:46:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 21:46:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 21:46:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 21:46:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ES2vDq7DrcEpZY6seGmYKZCUpZzTYvCWpi2MV8kztS8ZMpxncJtpagXOtm3wFCcC/3+NF8LfehWJRNlrcSGGdPJq88coDb0R8C18wB/kQ4ZlJI0UsQ7SLO9OIMS8jd/GhaoqjlZK8ee0E4GEWXjkEreHfkhcx6IAENGNw5ZqhRNbAQ+lFIQ7VMXk23z0E0GTWqEu6kvOokKYkF4Qx/EZo6fkdm41bdy16p750x9v/xHLljR6adDVVIOynDPVlFweqQFFaRUdUSXPBV5EtZkh76kv1aVl56sWQYRsbS6YUl+e0gAi5iX4l/eFgtrJOvZxF4jngnSdW23B5nGb61O6jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4t1XiTn9iiqYCkQusD2cpl84dlQS5efO/NZDPfNrO30=;
 b=WVk1Iui0QvSFDTx4PrAQwv93Nvwtg6yEhyCR2V1AM+PCXTF4MpPq3WQaP4nb7QK151swwSXvkBWOPb2DZ0gdRvQPw6sf8pKE0kJCV4X14yviP4oF/OI4fwcq1+mesungd4TKhMdhFYsUEcUj+2VhEDLIoppXW6ggqcd+4qZalL06OIz6d9yy8oh8PgHiivZrTyyW+3bo4s8MX6kGGMHbjAsGbHwGw68/00dph9AP66v+UbpHWZQxrtgtOX48PfCLeH5nQZElt3vMM4vF8TjpEgvI1EWXoAokhie39EW4ntvSe8vkZMABjNbcoiYY1TaPVlIQrXjwh4U/4BrqoeOk7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by SJ0PR11MB5181.namprd11.prod.outlook.com (2603:10b6:a03:2de::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20; Thu, 17 Oct
 2024 04:46:00 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.8048.020; Thu, 17 Oct 2024
 04:45:59 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Hogander, 
 Jouni" <jouni.hogander@intel.com>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Syrjala, Ville"
 <ville.syrjala@intel.com>
Subject: RE: [PATCH] drm/i915/psr: Implement WA to help reach PC10
Thread-Topic: [PATCH] drm/i915/psr: Implement WA to help reach PC10
Thread-Index: AQHbFaSgCvThjqHPQUiPv4PzvyLGobJ59CmAgASUVICAANfi4IAAVGOAgAq+WeA=
Date: Thu, 17 Oct 2024 04:45:59 +0000
Message-ID: <SN7PR11MB6750866593B8B817D5F14579E3472@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241003145337.1673715-2-suraj.kandpal@intel.com>
 <20241006164934.1689930-2-suraj.kandpal@intel.com> <87o73t8hdg.fsf@intel.com>
 <SN7PR11MB675019D7D0344FCD40446332E3782@SN7PR11MB6750.namprd11.prod.outlook.com>
 <87v7y073ma.fsf@intel.com>
In-Reply-To: <87v7y073ma.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|SJ0PR11MB5181:EE_
x-ms-office365-filtering-correlation-id: 49cadd9f-cc3d-44a5-e2ed-08dcee6698ac
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?YjMTXM+qU9bnHrIMSQvWG4jAV7p+TXRC3U8pPDAzZNIKbVFnL3ZLk5fFrfaN?=
 =?us-ascii?Q?pWtI2WYSzoTt2RLQ1WXjtHdxI4VAjZTe8Z943WTmw+sNC7EyomY+aG29PsjK?=
 =?us-ascii?Q?qjLTUlVxpfQg6urIjcZk6YvTkdPrmvOgwmJUhA4S45dnzUFJBODgiRg6H14P?=
 =?us-ascii?Q?8QOMp0raSO6LNoDshpGqpP25f1QlQbc8dNVTg10FCtAZqRRQu8cWEqwUCPww?=
 =?us-ascii?Q?0k7eRbRVtPgykU0ALv++qtDvKyv0zQ6gtEslvtVNyAtzIy8cZC7ftdZXl1Ss?=
 =?us-ascii?Q?sPR68zDIfkcoCvENce7XIiMnpQorgaXc/dbIKL6gyTXOctDQD501baB/uTYH?=
 =?us-ascii?Q?XRV7KP3/OEF0AIg3oO1y8LpSBvue89XpwI6ljsfKmrC+5jsXQPmxFNhS2/ao?=
 =?us-ascii?Q?rYIlNC6+H0ogl7owMTtqkXLQVXyA7FjTrMqwBpsboFlg4OpgO3/vS1JwMdqA?=
 =?us-ascii?Q?vyclUsIK2ch4tcvlugh0pR02L1dpBA0wE1zJWP+X4/mWA+IOEwgM4ZQVIzyN?=
 =?us-ascii?Q?7Ia3S5SJ7KPzOC187crdfjiOy6TRyNO9SMOgNsXZZf9tbn2fWXJP7B/jWfm1?=
 =?us-ascii?Q?uMle8rLS34PMQL2Ytzp/nr/iU3AbEaPodtLCvrj9qf8U5jHh0gZPkM2fTN7j?=
 =?us-ascii?Q?STDc1vXIBKnlptwPDZiwg64apUprLjv5GCIG+FJQGfPzHPKdNzshWH6pQtbO?=
 =?us-ascii?Q?i2IJmbZspEeFgDYNQ7wUhGE5UiMXSWA2jBgOGSqW1uHVpcWojlFOea9tEuE3?=
 =?us-ascii?Q?FJpQsXIOtEov67I0X0Sg6RIt5qo/cv3M2GFCsXOWw+n8WqiULiOF090i/eL4?=
 =?us-ascii?Q?NtwIjvkSHjBe4lfU3sM4hiIWPvZHnVXD+vFcR6KzuzXulf3CI9MX2f9gcYz6?=
 =?us-ascii?Q?L5rPXqbwskyygluib8P9RU7qK05c6ZpuwrWwWMUZ70gM7kGCYR8NLsbRDBCI?=
 =?us-ascii?Q?DbGvfrA/t8xFVvk/jPE+mGBeK6JzQdVUsrAskiBAXct8GAT20IT3Y3Vj2VE2?=
 =?us-ascii?Q?qPXzLTJLRfhkxywzzlK9oKl3mjF/hiC8s1BimH8ijoaxLZpdGiWmyoTsE1gZ?=
 =?us-ascii?Q?8wybLGz6m41lbYVItwKq0jrEcbadJp1hYzz6k4iJ0Sgy6mbQKbyy8kNBE38c?=
 =?us-ascii?Q?yMJxze8TfeC7vPyVXng4v6Uv7w9PTtZkg3jYXHV9w3mcbmrgwtBgM/uMBDfQ?=
 =?us-ascii?Q?2YkgWLkBjv4R54DXu3zHqo5pUxAYONNus2419TiUB11RaVW3ZIm9kcCI2IRK?=
 =?us-ascii?Q?HxEl5Fly2F84dwJosyTeKskElh9VQ4Gr2sF+iMFDckP2v6MYswOT3MKJuy+P?=
 =?us-ascii?Q?pe3HYLLxRXfBCL+kxe6DTquWkoFh5PjR+5SyVPrbatvITL93p9xi4ZYU08wh?=
 =?us-ascii?Q?AX+Xjd8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1/kltZ2OZP/Ek0j5kXzb3UWMviBu17sOmSBnnTWzL7K8zC0ZKJBK5pH969C8?=
 =?us-ascii?Q?pjhE1QouaGKHhMYuMQ8AdC3MLRS59umwTDGbvxeamWZpjoosipCaFjS1ZBK/?=
 =?us-ascii?Q?m50jlXEZbMnEGegEVQ7GtZooLoigzSB+wOYjnExnMVl55LUYo7n8vE6lHf5K?=
 =?us-ascii?Q?Ju9kTD7caKqI3NK/DtmPWkTobZ9BvkqbYjIcwjihTbqSaKhrrJq5CWQIJD7y?=
 =?us-ascii?Q?zhldGgEOjLiXq2GJOw41541O4X2SNCmaAvzZByfUUqY/0MBXFcooKoI4djwf?=
 =?us-ascii?Q?CM+YEfXlwIPpp5rJ890BluxkGvC9FOT6+xe3CieMWfXt+jNs+QV1tCgVy0pb?=
 =?us-ascii?Q?hQJjBF999Yx8BQmIKzOjjUaWSsJvWV4xqRyYoNfiUUdDrDatR2NBUJ2Le95p?=
 =?us-ascii?Q?eO4FPNYS1wYAGC5CQczCl3xcK2+/Qmzo2vn2Oa+Ts8kwtosJQkeNE03woyY3?=
 =?us-ascii?Q?vCy/7QhzIWlWEXE1NDHxokIn0jBDvkM9LMZOJp8atT/nBboNvLZp4/u290M/?=
 =?us-ascii?Q?EsTmV/K+AfpLWwCbr2xell9ZqIhJ9FSq3uJJs7BEeaj0HvrppHn8VYcjs3w5?=
 =?us-ascii?Q?2tIp1omdloKqxjOuZ2yEQGlT9C1RY41iURSSkpQbsgs3xCBg8qNUCagpWvE9?=
 =?us-ascii?Q?nl8/SbB7WyViCJWIYHQfPKX2LABEMr1gCZxC2wHRTYcetZa6D6km5QMM+xoK?=
 =?us-ascii?Q?yTifZPydEwvNMflnswJ93JyIQcRyXGuxdLMTzdjr1DO6j1YFtuYXxKdQC/tS?=
 =?us-ascii?Q?j6lfcrvDWdXvT1XTkb9WE1C9SYQ7hBrKKWjrlbgLy2IvuzqBcYmZ2YnzcWIE?=
 =?us-ascii?Q?IK9fP+jPOZYbrijOTMDwiR8wPQECvj5YNOs8a/eCH6F46gidIRlqoxjMJjcp?=
 =?us-ascii?Q?eqkqJaV6cCpXyE4bexTHnOLvOiEvxFRiuy2QFXJsb5L98TVtEmqriFzFgjYL?=
 =?us-ascii?Q?OhdnYYvU+PBkYIynoloLATuLQagggSeo88+wfzdZeuavKxZbV2aFeC3g4yGi?=
 =?us-ascii?Q?uLrojFjc1zc6J1lmdaWb2bsi+4LDZsJI8RS6kNlldaOGoCHNrFlzq4jV30ZJ?=
 =?us-ascii?Q?cA8BwE1J2DAJNguqgy8aDBeTceMJk8zg/VdOI/+F/UgPbXCLDYbL+DmfEuw5?=
 =?us-ascii?Q?4fb2eb+jXss5/OIMIl9QN95mayR9yaidI/z0UJtYznZMBPB+YkqeDIEeqNYI?=
 =?us-ascii?Q?jj1I9YVtka2jaQ6nfv4u4YppSf1Emxc9ccUnAa/kvEfJJLIFZ/zkZa18R2Oj?=
 =?us-ascii?Q?uZ51FPs6MjS1HrxetZwGO8tL/MfYgxEmWRlm9WoWKmjhzUdWQBHvSmITJME8?=
 =?us-ascii?Q?wvWbFH9Si4p4WC0KU4qY+DNC9WlBKbBPOhYi/exfqBmRaIdNIo73o+sQKfUF?=
 =?us-ascii?Q?kM87EV+9kyP9COeDbT9GDL2cVCeR1tB2BifVdb3Gp8z3deuKMA6lpcozblJ4?=
 =?us-ascii?Q?g8ks8xiLpXGDdQ/Ph+BQAyRzSa9Hp3XtQRvqhShu2DNrZP0UxDMKatPoiecg?=
 =?us-ascii?Q?PrRuZL4qMA5d8oxHHEZ2LwRITkIrTSrga8WrqsBuCob7tGSl6uH1eNEIiCTG?=
 =?us-ascii?Q?PgOESjKXcK5SVX647nShiVdERY9QUonSNBUyke5y?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49cadd9f-cc3d-44a5-e2ed-08dcee6698ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2024 04:45:59.4859 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GPvcwMkZgSk2n1ZH666A4V+XZXTfXKEr430BCxrFLAvpQGHFdY2WgG0GhIqbdg9AI0gdKQ1oZOYgNxNH4jAeHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5181
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
> Sent: Thursday, October 10, 2024 2:10 PM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-
> xe@lists.freedesktop.org; Hogander, Jouni <jouni.hogander@intel.com>
> Cc: Shankar, Uma <uma.shankar@intel.com>; Syrjala, Ville
> <ville.syrjala@intel.com>
> Subject: RE: [PATCH] drm/i915/psr: Implement WA to help reach PC10
>=20
> On Thu, 10 Oct 2024, "Kandpal, Suraj" <suraj.kandpal@intel.com> wrote:
> >> -----Original Message-----
> >> From: Jani Nikula <jani.nikula@linux.intel.com>
> >> Sent: Wednesday, October 9, 2024 8:16 PM
> >> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-
> >> xe@lists.freedesktop.org
> >> Cc: Shankar, Uma <uma.shankar@intel.com>; Hogander, Jouni
> >> <jouni.hogander@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> >> Subject: Re: [PATCH] drm/i915/psr: Implement WA to help reach PC10
> >>
> >> On Sun, 06 Oct 2024, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> >> > To reach PC10 when PKG_C_LATENCY is configure we must do the
> >> following
> >> > things
> >> > 1) Enter PSR1 only when delayed_vblank < 6 lines and DC5 can be
> >> > entered
> >> > 2) Allow PSR2 deep sleep when DC5 can be entered
> >> > 3) DC5 can be entered when all transocoder have either PSR1, PSR2
> >> > or eDP 1.5 PR ALPM enabled and VBI is disabled and flips and pushes
> >> > are not happening.
> >> >
> >> > --v2
> >> > -Add debug prints
> >> >
> >> > WA: 22019444797
> >> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> >> > ---
> >> >  drivers/gpu/drm/i915/display/intel_ddi.c      |   3 +
> >> >  .../drm/i915/display/intel_display_types.h    |   3 +
> >> >  drivers/gpu/drm/i915/display/intel_psr.c      | 117 +++++++++++++++=
++-
> >> >  drivers/gpu/drm/i915/display/intel_psr.h      |   2 +
> >> >  4 files changed, 124 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> >> > b/drivers/gpu/drm/i915/display/intel_ddi.c
> >> > index fe1ded6707f9..cbd71c136c8d 100644
> >> > --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> >> > +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> >> > @@ -4368,6 +4368,9 @@ static int
> >> > intel_ddi_compute_config_late(struct
> >> intel_encoder *encoder,
> >> >  			port_sync_transcoders & ~BIT(crtc_state-
> cpu_transcoder);
> >> >  	}
> >> >
> >> > +	if (intel_encoder_is_dp(encoder))
> >> > +		intel_psr_compute_config_late(encoder, crtc_state);
> >> > +
> >> >  	return 0;
> >> >  }
> >> >
> >> > diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> >> > b/drivers/gpu/drm/i915/display/intel_display_types.h
> >> > index 17fc21f6ae36..7fb3eeb0e0f2 100644
> >> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> >> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> >> > @@ -1576,6 +1576,9 @@ struct intel_psr {
> >> >  #define I915_PSR_DEBUG_PANEL_REPLAY_DISABLE	0x40
> >> >
> >> >  	u32 debug;
> >> > +	bool is_dpkgc_configured;
> >> > +	bool is_dc5_entry_possible;
> >> > +	bool is_wa_delayed_vblank_limit;
> >> >  	bool sink_support;
> >> >  	bool source_support;
> >> >  	bool enabled;
> >> > diff --git a/drivers/gpu/drm/i915/display/intel_psr.c
> >> > b/drivers/gpu/drm/i915/display/intel_psr.c
> >> > index 8e9f068b9b2b..9b77045df228 100644
> >> > --- a/drivers/gpu/drm/i915/display/intel_psr.c
> >> > +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> >> > @@ -26,6 +26,7 @@
> >> >  #include <drm/drm_atomic_helper.h>  #include
> >> > <drm/drm_damage_helper.h>  #include <drm/drm_debugfs.h>
> >> > +#include <drm/drm_vblank.h>
> >> >
> >> >  #include "i915_drv.h"
> >> >  #include "i915_reg.h"
> >> > @@ -896,6 +897,82 @@ static u8 psr_compute_idle_frames(struct
> >> intel_dp *intel_dp)
> >> >  	return idle_frames;
> >> >  }
> >> >
> >> > +static bool
> >> > +intel_psr_check_wa_delayed_vblank(const struct drm_display_mode
> >> > +*adjusted_mode) {
> >> > +	return (adjusted_mode->crtc_vblank_start -
> >> > +adjusted_mode->crtc_vdisplay) >=3D 6; }
> >> > +
> >> > +/*
> >> > + * PKG_C_LATENCY is configured only when DISPLAY_VER >=3D 20 and
> >> > + * VRR is not enabled
> >> > + */
> >> > +static bool intel_psr_is_dpkgc_configured(struct intel_display *dis=
play,
> >> > +					  struct intel_crtc_state *crtc_state) {
> >> > +	if (DISPLAY_VER(display) < 20 || crtc_state->vrr.enable)
> >> > +		return false;
> >> > +
> >> > +	return true;
> >> > +}
> >> > +
> >> > +static bool wa_22019444797_psr1_check(const struct
> >> > +intel_crtc_state
> >> *crtc_state,
> >> > +				      struct intel_psr *psr)
> >> > +{
> >> > +	struct intel_display *display =3D to_intel_display(crtc_state);
> >> > +
> >> > +	if (DISPLAY_VER(display) =3D=3D 20 && psr->is_dpkgc_configured &&
> >> > +	    (psr->is_wa_delayed_vblank_limit ||
> >> > +!psr->is_dc5_entry_possible)
> >> &&
> >> > +	   !crtc_state->has_sel_update && !crtc_state->has_panel_replay) {
> >> > +		drm_dbg_kms(display->drm,
> >> > +			    "Wa 22019444797 requirement met PSR1
> >> disabled\n");
> >> > +		return true;
> >> > +	} else {
> >> > +		return false;
> >> > +	}
> >> > +}
> >> > +
> >> > +/*
> >> > + * DC5 entry is only possible if vblank interrupt is disabled
> >> > + * and either psr1, psr2, edp 1.5 pr alpm is enabled on all
> >> > + * enabled encoders.
> >> > + */
> >> > +static bool
> >> > +intel_psr_is_dc5_entry_possible(struct intel_display *display,
> >> > +				struct intel_crtc_state *crtc_state) {
> >> > +	struct intel_crtc *intel_crtc;
> >> > +
> >> > +	if ((display->power.domains.target_dc_state &
> >> > +	     DC_STATE_EN_UPTO_DC5_DC6_MASK) =3D=3D 0)
> >> > +		return false;
> >> > +
> >> > +	if (!crtc_state->has_psr && !crtc_state->has_sel_update &&
> >> > +	    !crtc_state->has_panel_replay)
> >> > +		return false;
> >> > +
> >> > +	for_each_intel_crtc(display->drm, intel_crtc) {
> >> > +		struct drm_crtc *crtc =3D &intel_crtc->base;
> >> > +		struct drm_vblank_crtc *vblank;
> >> > +		struct intel_encoder *encoder;
> >> > +
> >> > +		if (!intel_crtc->active)
> >> > +			continue;
> >> > +
> >> > +		vblank =3D drm_crtc_vblank_crtc(crtc);
> >> > +
> >> > +		if (vblank->enabled)
> >> > +			return false;
> >> > +
> >> > +		for_each_encoder_on_crtc(display->drm, crtc, encoder)
> >> > +			if (encoder->type !=3D INTEL_OUTPUT_EDP ||
> >> > +			    !CAN_PSR(enc_to_intel_dp(encoder)))
> >> > +				return false;
> >> > +	}
> >> > +
> >> > +	return true;
> >> > +}
> >> > +
> >> >  static void hsw_activate_psr1(struct intel_dp *intel_dp)  {
> >> >  	struct intel_display *display =3D to_intel_display(intel_dp); @@
> >> > -1008,7 +1085,18 @@ static void hsw_activate_psr2(struct intel_dp
> >> *intel_dp)
> >> >  	u32 val =3D EDP_PSR2_ENABLE;
> >> >  	u32 psr_val =3D 0;
> >> >
> >> > -	val |=3D EDP_PSR2_IDLE_FRAMES(psr_compute_idle_frames(intel_dp));
> >> > +	/*
> >> > +	 * Wa_22019444797
> >> > +	 * TODO: Disable idle frames when vblank gets enabled while
> >> > +	 * PSR2 is enabled
> >> > +	 */
> >> > +	if (DISPLAY_VER(dev_priv) !=3D 20 ||
> >> > +	    !intel_dp->psr.is_dpkgc_configured ||
> >> > +	    intel_dp->psr.is_dc5_entry_possible)
> >> > +		val |=3D
> >> EDP_PSR2_IDLE_FRAMES(psr_compute_idle_frames(intel_dp));
> >> > +	else
> >> > +		drm_dbg_kms(display->drm,
> >> > +			    "Wa 22019444797 requirement met PSR2 deep
> >> sleep disabled\n");
> >> >
> >> >  	if (DISPLAY_VER(display) < 14 && !IS_ALDERLAKE_P(dev_priv))
> >> >  		val |=3D EDP_SU_TRACK_ENABLE;
> >> > @@ -1686,6 +1774,24 @@ void intel_psr_compute_config(struct
> >> > intel_dp
> >> *intel_dp,
> >> >  	crtc_state->has_sel_update =3D
> >> > intel_sel_update_config_valid(intel_dp,
> >> > crtc_state);  }
> >> >
> >> > +void intel_psr_compute_config_late(struct intel_encoder
> *intel_encoder,
> >> > +				   struct intel_crtc_state *crtc_state) {
> >> > +	struct intel_display *display =3D to_intel_display(intel_encoder);
> >> > +	struct intel_dp *dp =3D enc_to_intel_dp(intel_encoder);
> >> > +
> >> > +	if (DISPLAY_VER(display) =3D=3D 20) {
> >> > +		mutex_lock(&dp->psr.lock);
> >> > +		dp->psr.is_dpkgc_configured =3D
> >> > +			intel_psr_is_dpkgc_configured(display, crtc_state);
> >> > +		dp->psr.is_dc5_entry_possible =3D
> >> > +			intel_psr_is_dc5_entry_possible(display, crtc_state);
> >> > +		dp->psr.is_wa_delayed_vblank_limit =3D
> >> > +			intel_psr_check_wa_delayed_vblank(&crtc_state-
> >> >hw.adjusted_mode);
> >>
> >> Compute config should only change the crtc state.
> >
> > Hi Jani,
> > I see your point the reason for having this here is because as Jouni
> > suggested that we get the crtc_state completely filled out Only after
> > compute config so calling all these functions there may end up giving
> > us misleading results. That's why we ended up using Compute config late
> path to get these variables filled up. Also trying to fill these up in pr=
e/post
> plane update gave the wrong Dc5_entry_possible result since at that point
> vblank gets enabled.
> > @Hogander, Jouni what do you think?
>=20
> Two ways this could go wrong:
>=20
> - The atomic check (i.e. our compute config path) goes wrong later, and
>   the state is discarded, but the changes to intel_dp remain.
>=20
> - It's a DRM_MODE_ATOMIC_TEST_ONLY commit, which is only supposed to
>   check if the configuration is possible, not to modify anything, but
>   the changes to intel_dp remain.
>=20
> In both cases, the mode hasn't changed, but you've changed the way PSR
> behaves with the existing crtc state.
>=20
> You can only modify the hardware or (for lack of a better word) the more
> "permanent" software state in the actual atomic commit.

Do you see any way where we can get this changes in and later discard them =
if the above two scenarios occur
Or a more appropriate place to get this calculated where its done after com=
pute config but before atomic check
To make sure these changes are discarded in atomic_check itself

Regards,
Suraj Kandpal
>=20
> BR,
> Jani.
>=20
> >
> > Regards,
> > Suraj Kandpal
> >
> >>
> >> BR,
> >> Jani.
> >>
> >> > +		mutex_unlock(&dp->psr.lock);
> >> > +	}
> >> > +}
> >> > +
> >> >  void intel_psr_get_config(struct intel_encoder *encoder,
> >> >  			  struct intel_crtc_state *pipe_config)  { @@ -2742,6
> >> +2848,7 @@
> >> > void intel_psr_pre_plane_update(struct intel_atomic_state *state,
> >> >  		 * - Changing between PSR versions
> >> >  		 * - Region Early Transport changing
> >> >  		 * - Display WA #1136: skl, bxt
> >> > +		 * - Display WA_22019444797
> >> >  		 */
> >> >  		needs_to_disable |=3D
> >> intel_crtc_needs_modeset(new_crtc_state);
> >> >  		needs_to_disable |=3D !new_crtc_state->has_psr; @@ -2751,6
> >> +2858,8 @@
> >> > void intel_psr_pre_plane_update(struct intel_atomic_state *state,
> >> >  			psr->su_region_et_enabled;
> >> >  		needs_to_disable |=3D DISPLAY_VER(i915) < 11 &&
> >> >  			new_crtc_state->wm_level_disabled;
> >> > +		/* TODO: Disable PSR1 when vblank gets enabled while PSR1
> >> is enabled */
> >> > +		needs_to_disable |=3D
> >> wa_22019444797_psr1_check(new_crtc_state, psr);
> >> >
> >> >  		if (psr->enabled && needs_to_disable)
> >> >  			intel_psr_disable_locked(intel_dp);
> >> > @@ -2791,6 +2900,12 @@ void intel_psr_post_plane_update(struct
> >> intel_atomic_state *state,
> >> >  		keep_disabled |=3D DISPLAY_VER(display) < 11 &&
> >> >  			crtc_state->wm_level_disabled;
> >> >
> >> > +		/*
> >> > +		 * Wa_22019444797
> >> > +		 * TODO: Disable PSR1 when vblank gets enabled while PSR1
> >> is enabled
> >> > +		 */
> >> > +		keep_disabled |=3D wa_22019444797_psr1_check(crtc_state,
> >> psr);
> >> > +
> >> >  		if (!psr->enabled && !keep_disabled)
> >> >  			intel_psr_enable_locked(intel_dp, crtc_state);
> >> >  		else if (psr->enabled && !crtc_state->wm_level_disabled) diff
> >> --git
> >> > a/drivers/gpu/drm/i915/display/intel_psr.h
> >> > b/drivers/gpu/drm/i915/display/intel_psr.h
> >> > index 5f26f61f82aa..e0fa04952393 100644
> >> > --- a/drivers/gpu/drm/i915/display/intel_psr.h
> >> > +++ b/drivers/gpu/drm/i915/display/intel_psr.h
> >> > @@ -47,6 +47,8 @@ void intel_psr_init(struct intel_dp *intel_dp);
> >> > void intel_psr_compute_config(struct intel_dp *intel_dp,
> >> >  			      struct intel_crtc_state *crtc_state,
> >> >  			      struct drm_connector_state *conn_state);
> >> > +void intel_psr_compute_config_late(struct intel_encoder
> *intel_encoder,
> >> > +				   struct intel_crtc_state *crtc_state);
> >> >  void intel_psr_get_config(struct intel_encoder *encoder,
> >> >  			  struct intel_crtc_state *pipe_config);  void
> >> > intel_psr_irq_handler(struct intel_dp *intel_dp, u32 psr_iir);
> >>
> >> --
> >> Jani Nikula, Intel
>=20
> --
> Jani Nikula, Intel
