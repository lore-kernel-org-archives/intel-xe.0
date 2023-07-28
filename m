Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1ABC001DE
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 07:37:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C997510E660;
	Fri, 28 Jul 2023 07:37:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C106C10E660
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 07:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690529825; x=1722065825;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KDrbpehvIzSLjofrqNhTx7uSbjuUr+aqfRQb+LuAO+A=;
 b=gFFYs6Slgdo96k2KC9/bj+T2OB/VH/1d92yFiZlxi+yA5KHjdQKwlnbL
 5VnhudSsoRWELjwJAgIVC2jbrU5nRZY+LQHbjXexv16Lj7meyEc5c3C2Q
 T5YTSYe/4eT7iFT7qtJxd7awKVWpufYl0tE3E02GEfSgB6BErD0uHk9M+
 K/IhDe9igLrRmqwEl7ungei0K+1S6f3h7Ge7evBNd9slXi+76FqB3T3+V
 7efV/0tH5gjMtGaqltI96B+08vkO70wCL8RU1MRInuVTAX74gGUSAYtnJ
 Vz2qY415o5/V+L553NP31x6j1e5FWy7bskLiWgOLU0kBmQ5Epxmwuzouu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="434813930"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="434813930"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 00:36:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="721168476"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="721168476"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 28 Jul 2023 00:36:33 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 00:36:32 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 00:36:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 28 Jul 2023 00:36:32 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 28 Jul 2023 00:36:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0GqcYL9ax84famK4PC+n5zx86xYNd8wGHjXPbGsY7E8tTyuM/hv1U2JnWqOpQQ9uwk7zQPp4dX2O1RPwEHfrO+CmhcPMaqKmwdUxbJhW0LBHrJ7NUFQh+AJrdR6tqMYVU/d5+PvPcEJKUGR8LqK5iLHT7Usy9zaELtbpnygoVyBloUkHh1xc2waJ5FLCXbl2Dd/nINMewZ2hLaHOhlqE0Nv44at7iIfUmEVXPmQW5lF/jI7pjsOxGx33e0JnlwvC3RufdgxAjQ0yDuLhn7d7z72Gnm+mhL3w7JNKWUOTylltyMwF7WvNYfoi/UY58cvRLBqW5/PhGio/3qpkBqBrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2unSnT01LBTWLWOr8b7y0scekECs8loFdUpJo8YQ2VU=;
 b=HXZkk7LMm6vNDTtDsY3qCK4UPMkpNX4phtEkg2pP9rIYMXt0Nsgl+3o3y/m5HlzLfn1SvzoblOaaxmVfH/ykhN4Nrlo5eYGEDyOgWH9AcQNbUkniTF1M77A5WcEfhqhhdory3vMza8HTy10avH+siaT/zctGZha4XTwygReafTy5pBv4v/O2M3sv3j/MOgZxVoTdHw+hS+VcXFO8/5ZuAilzpur6POX0PGMz0xwNLKZU6VWBwuA4GxW3tibTkGDZmtKBfc7BbHG7SF+NI8B7VCSdHnse+TWSaKmbh1W0N4cOFQoeCH1te6p5TbAKU4tpzYp6B1jeOICxWR1xnH1JqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH7PR11MB6883.namprd11.prod.outlook.com (2603:10b6:510:202::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 07:36:29 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1a96:db0e:58b5:123c]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1a96:db0e:58b5:123c%4]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 07:36:29 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Thread-Topic: [PATCH V9 6/6] drm/xe: Add min/max cap for engine scheduler
 properties
Thread-Index: AQHZwGKel9GdYyOvlEC4e+S8iukGt6/NvMCAgADe1oCAAAW5AIAABISAgAASDoCAABItgA==
Date: Fri, 28 Jul 2023 07:36:29 +0000
Message-ID: <SJ1PR11MB62044364227D86A702DE966F8106A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230727082235.905240-1-tejas.upadhyay@intel.com>
 <20230727082235.905240-7-tejas.upadhyay@intel.com>
 <ZMKMuWeQBXsSo2Sb@DUT025-TGLU.fm.intel.com> <ZMNHp1f+wwyd9ZTB@nvishwa1-DESK>
 <ZMNMdIXaJrm4RKGJ@DUT025-TGLU.fm.intel.com>
 <SJ1PR11MB62041E3422EBC2A5D9ABC05C8106A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ZMNfY83ZteSxWk3w@nvishwa1-DESK>
In-Reply-To: <ZMNfY83ZteSxWk3w@nvishwa1-DESK>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH7PR11MB6883:EE_
x-ms-office365-filtering-correlation-id: 5e29e576-c035-4655-d725-08db8f3d5bae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y3sxr8hxeZSldUjZvm78orsd3DdpEOEcI9MJGIwh5vaf+YTQu8hrjFDsWnCVdV+0o09YqI/JiZtgJu2zvjr5KJWBIVMj9Fe36MKvhiLocLoV20u9iO6Wj7zBgm9ojxu4mhZ0zeH08GKfW7HXAt/yPKmFNkxMvgSB+lw6fdPq7a6mE883HXOpntXE3RyC3j6nbOcASNRZqdD5UP317xP44+rlvWnVsiGX+xUZtPOQyA/sNViM3J3LfWwA7psmKPjVnHdgn3eLygZtIMxAykuvnsOTiZ9kJlTskMs9emupBTb7X3WMgzcK09ZSZkRn5Fvm9ADsUCMhH8SkoQQmKTWgja0FJCPmEMtUuaXF0NnTrJRoiNwEwC2jOTGu1PXc9swQ4FTgvOT6yeGA9b4ow1+xMTa/PpoCdhmH432K9Hb02m5TDn034pr15NHJOs0JexP644Z5lgkU/zo7F6lv0/brF/GN6suT0jABsuxMDlwfq9gzUMbLYsqLw+Eqmt/Ji9if2VHieYQ+h5VYsRg5gKCxVHzbn3/DEBC1H4vgWyfamDXAvFBc8pl9vxpzbUysoxjtXJob9dz2geU2EvS7vOJy+g+ZXJH8zQoM3Dwk6QlAHXuC9jFUWzQoj8E6gHMzZYPQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(396003)(346002)(366004)(136003)(451199021)(2906002)(316002)(6862004)(8936002)(8676002)(52536014)(5660300002)(41300700001)(38070700005)(30864003)(33656002)(55016003)(86362001)(7696005)(71200400001)(122000001)(54906003)(478600001)(82960400001)(6506007)(186003)(53546011)(9686003)(83380400001)(66946007)(76116006)(38100700002)(66556008)(19627235002)(4326008)(66446008)(64756008)(66476007)(6636002)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/Mu9HZEyj1h/mKRcivX0o3u6iHnSNcPqKzNCZEsENNSq7lOHH/qt1CpV+Kmo?=
 =?us-ascii?Q?GV+Upm3HyTxkqonlg2HNpHgvq5rYQNFNp1hKZxCH7p+uHr0REDBO+XRSkkOj?=
 =?us-ascii?Q?xXRTI+MKVd4WrRMP32DocdBe9oUPo2Uxdw9hsd2CpfC94iU+AnE3C+uR60+e?=
 =?us-ascii?Q?JkIih8JRzaFxn4uVldEX+GgXZobddO3HcOxXenlHTeg9dujl1bY5G7jf4b25?=
 =?us-ascii?Q?iNW7cwdksP3qhHMe8LUTmNkm87bokWr6A1n0U8gYqKGecpHpAMoqiE1njzuK?=
 =?us-ascii?Q?PlGQUmjTnFp5HmyzUSGB8raioT2J0SYZBWGwKH+D6Vkjmp03deF63sFqxKAB?=
 =?us-ascii?Q?aRfQmM604zqkBuxvpVz1LiGwoLSwUYqdEDph0q8KH3bgwH0sMcZpLwc28SqJ?=
 =?us-ascii?Q?qQasOZIu0tuwmmOPTnQGiNSwGbEiecj29WRu04r4cdFUVucWdy3+XHSxmWtx?=
 =?us-ascii?Q?nAk/pwrj8tlQfQmHeaJlzkPkoJAl5+4WAKZ1FaPGH9bP6/iMoSNn3XVohw73?=
 =?us-ascii?Q?nUj75s7xBaBPEqZfY7CgOyVtatcj5xfiYrAw4PSOh0q/IvU61d4+o5E4cihc?=
 =?us-ascii?Q?sxJTLkMVL/LP3xdETgjwD1ArTjHic9bFiFBSW3QEeK1a31qu+dWhNk0UcY4p?=
 =?us-ascii?Q?o5A0H19GFcpsJ5WgXqIXFNAny+yA6H2fQsfbvEUqfZogC9xy5V9aLplEuAJA?=
 =?us-ascii?Q?DjwAMawQdOMxNnaW8OQCvm3KrQCGUuSBpGMACpMdHGvUK78ZZAZi3Tmp2+gc?=
 =?us-ascii?Q?km3nAb/V6MFO9NN1XabpHCR7FuYo9sBfAF5REr8YjcyX43qeewsX9sGQ5gbt?=
 =?us-ascii?Q?s0GTJlQV1oaTLQ1CqYCxWGZuhOs/KvEGy0m+CFHn++aBjhc3nwzQzKljD6qJ?=
 =?us-ascii?Q?xpEQAIirPjLl0+ML3JA+AyZsPGDjEpUjjYaytgnI9sPj3B+oZVUWWiKxFYA4?=
 =?us-ascii?Q?GNm+fvVLSP1M5ZA0IwVsl9kyLQK7pNtu5BDzDbV0B/319zSN8+kdtyAsQ0lP?=
 =?us-ascii?Q?i1p+E1z3NGJwPQa1xHOPuvQ6AsnqpTvTQFARe20JjPmVRsG2+//AaAYGOuSR?=
 =?us-ascii?Q?ybTxpaCAAMdks63XtI5Qz11T/qnbsItRQ+SupT6UycSb8UAYbCPQFivx2Aa+?=
 =?us-ascii?Q?5DGQ50NPOfAVLxMCMjhDXnulBkJa556xNTD2VhY8mJbEn+hx6WOQy2ff94WC?=
 =?us-ascii?Q?sPJmrcwW2FT8+TKwHM5bUlG4bmEwXTPRxaMKnUjCGbmqKR+njFNMettiOqET?=
 =?us-ascii?Q?qVDIe2qe//b6GDnPnvebHNb3Yk+e3zF2L0P/Tp8v9s+0Je05Us54IUh5fNdk?=
 =?us-ascii?Q?LWjvFTMpoYZkDoCkEKwUqTwMGPgQpZ1wIM0JHc5RNAPwViw9QGGBIRXz1jaP?=
 =?us-ascii?Q?bWuJj+TBKcCZEoP4FysfyAw8Yf6VVC2b6f0t36RHbBxpIsi/Rj2TPjWMaLHG?=
 =?us-ascii?Q?jhvc4Gx53S9CoTEExtCBnF+tezYEqDCYf18kPJ5XaotOMEMMqjrKYeAC1lp3?=
 =?us-ascii?Q?xvSqTUjaXDxK5gDyY4h3JFpj8BLeE/Pz0D0Xbnza3h/FeGNPSh4EDAYgV1KC?=
 =?us-ascii?Q?lJv/6AAcN3Ngf/gtZpAICcocHFjq/m8eLbs5L5MCIPMpPrcm+NEcGFY89tSt?=
 =?us-ascii?Q?pjlIeeYXWkzzeDWLbA/wnXepipZJiFVrsZp8/rxWysfU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e29e576-c035-4655-d725-08db8f3d5bae
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2023 07:36:29.6496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /lJ58Ws0FbfhsVsUNzyHlPl5x3+aPHD0vGTJW328C0+XQ6eFe7wJDkGUnjLNo9V7OVXZqvpIONIAoGmWkKT7po9lZmKFGBLxrKL8geEzbbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6883
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V9 6/6] drm/xe: Add min/max cap for engine
 scheduler properties
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Sent: Friday, July 28, 2023 11:56 AM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: Brost, Matthew <matthew.brost@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: Re: [PATCH V9 6/6] drm/xe: Add min/max cap for engine scheduler
> properties
>=20
> On Thu, Jul 27, 2023 at 10:54:42PM -0700, Upadhyay, Tejas wrote:
> >
> >
> >> -----Original Message-----
> >> From: Brost, Matthew <matthew.brost@intel.com>
> >> Sent: Friday, July 28, 2023 10:35 AM
> >> To: Vishwanathapura, Niranjana
> <niranjana.vishwanathapura@intel.com>
> >> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> >> xe@lists.freedesktop.org
> >> Subject: Re: [PATCH V9 6/6] drm/xe: Add min/max cap for engine
> >> scheduler properties
> >>
> >> On Thu, Jul 27, 2023 at 09:44:23PM -0700, Niranjana Vishwanathapura
> >> wrote:
> >> > On Thu, Jul 27, 2023 at 03:26:49PM +0000, Matthew Brost wrote:
> >> > > On Thu, Jul 27, 2023 at 01:52:35PM +0530, Tejas Upadhyay wrote:
> >> > > > Add sysfs entries for the min, max, and defaults for each of
> >> > > > engine scheduler controls for every hardware engine class.
> >> > > >
> >> > > > Non-elevated user IOCTLs to set these controls must be within
> >> > > > the min-max ranges of the sysfs entries, elevated user can set
> >> > > > these controls to any value. However, introduced compile time
> >> > > > CONFIG min-max values which restricts elevated user to be in
> >> > > > compile time min-max range if at all sysfs min/max are violated.
> >> > > >
> >> > > > Sysfs entries examples are,
> >> > > > DUT# cat
> /sys/class/drm/cardX/device/tileN/gtN/engines/ccs/.defaults/
> >> > > > job_timeout_max         job_timeout_ms          preempt_timeout_=
min
> >> timeslice_duration_max  timeslice_duration_us
> >> > > > job_timeout_min         preempt_timeout_max
> preempt_timeout_us
> >> timeslice_duration_min
> >> > > >
> >> > > > DUT# cat /sys/class/drm/card1/device/tileN/gtN/engines/ccs/
> >> > > > .defaults/              job_timeout_min         preempt_timeout_=
max
> >> preempt_timeout_us      timeslice_duration_min
> >> > > > job_timeout_max         job_timeout_ms          preempt_timeout_=
min
> >> timeslice_duration_max  timeslice_duration_us
> >> > > >
> >> > > > V9 :
> >> > > >    - Rebase to use s/xe_engine/xe_hw_engine/ - Matt
> >> > > > V8 :
> >> > > >    - fix enforce_sched_limit and avoid code duplication - Niranj=
ana
> >> > > >    - Make sure min < max - Niranjana
> >> > > > V7 :
> >> > > >    - Rebase to replace hw engine with eclass interface
> >> > > >    - return EINVAL in place of EPERM
> >> > > >    - Use some APIs to avoid code duplication
> >> > > > V6 :
> >> > > >    - Rebase changes to reflect per engine class props interface =
- MattB
> >> > > >    - Use #if ENABLED - MattB
> >> > > >    - Remove MAX_SCHED_TIMEOUT check as range validation is
> >> > > > enough
> >> > > > V5 :
> >> > > >    - Rebase to resolve conflicts - CI
> >> > > > V4 :
> >> > > >    - Rebase
> >> > > >    - Update commit to reflect tile addition
> >> > > >    - Use XE_HW macro directly as they are already filtered
> >> > > >      for CONFIG checks - Niranjana
> >> > > >    - Add CONFIG for enable/disable min/max limitation
> >> > > >      on elevated user. Default is enable - Matt/Joonas
> >> > > > V3 :
> >> > > >    - Resolve CI hooks warning for kernel-doc
> >> > > > V2 :
> >> > > >    - Restric min/max setting to #define default min/max for
> >> > > >      elevated user - Himal
> >> > > >    - Remove unrelated changes from patch - Niranjana
> >> > > >
> >> > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >> > > > ---
> >> > > >  drivers/gpu/drm/xe/Kconfig                    |   6 +
> >> > > >  drivers/gpu/drm/xe/Kconfig.profile            |  46 +++
> >> > > >  drivers/gpu/drm/xe/xe_engine.c                |  25 +-
> >> > > >  drivers/gpu/drm/xe/xe_hw_engine.c             |   8 +
> >> > > >  drivers/gpu/drm/xe/xe_hw_engine.h             |  31 ++
> >> > > >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 354
> >> ++++++++++++++++++
> >> > > >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |   2 +
> >> > > >  7 files changed, 466 insertions(+), 6 deletions(-)  create
> >> > > > mode
> >> > > > 100644 drivers/gpu/drm/xe/Kconfig.profile
> >> > > >
> >> > > > diff --git a/drivers/gpu/drm/xe/Kconfig
> >> > > > b/drivers/gpu/drm/xe/Kconfig index d44794f99338..0a4ea965645b
> >> > > > 100644
> >> > > > --- a/drivers/gpu/drm/xe/Kconfig
> >> > > > +++ b/drivers/gpu/drm/xe/Kconfig
> >> > > > @@ -83,3 +83,9 @@ depends on DRM_XE  depends on EXPERT
> source
> >> > > > "drivers/gpu/drm/xe/Kconfig.debug"
> >> > > >  endmenu
> >> > > > +
> >> > > > +menu "drm/xe Profile Guided Optimisation"
> >> > > > +	visible if EXPERT
> >> > > > +	depends on DRM_XE
> >> > > > +	source "drivers/gpu/drm/xe/Kconfig.profile"
> >> > > > +endmenu
> >> > > > diff --git a/drivers/gpu/drm/xe/Kconfig.profile
> >> > > > b/drivers/gpu/drm/xe/Kconfig.profile
> >> > > > new file mode 100644
> >> > > > index 000000000000..e72f15ec4bf6
> >> > > > --- /dev/null
> >> > > > +++ b/drivers/gpu/drm/xe/Kconfig.profile
> >> > > > @@ -0,0 +1,46 @@
> >> > > > +config DRM_XE_JOB_TIMEOUT_MAX
> >> > > > +       int "Default max job timeout (ms)"
> >> > > > +       default 10000 # milliseconds
> >> > > > +       help
> >> > > > +         Configures the default max job timeout after which job=
 will
> >> > > > +         be forcefully taken away from scheduler.
> >> > > > +config DRM_XE_JOB_TIMEOUT_MIN
> >> > > > +       int "Default max job timeout (ms)"
> >> > > > +       default 1 # milliseconds
> >> > > > +       help
> >> > > > +         Configures the default min job timeout after which job=
 will
> >> > > > +         be forcefully taken away from scheduler.
> >> > > > +config DRM_XE_TIMESLICE_MAX
> >> > > > +       int "Default max timeslice duration (us)"
> >> > > > +       default 10000000 # microseconds
> >> > > > +       help
> >> > > > +         Configures the default max timeslice duration between
> multiple
> >> > > > +         contexts by guc scheduling.
> >> > > > +config DRM_XE_TIMESLICE_MIN
> >> > > > +       int "Default min timeslice duration (us)"
> >> > > > +       default 1 # microseconds
> >> > > > +       help
> >> > > > +         Configures the default min timeslice duration between
> multiple
> >> > > > +         contexts by guc scheduling.
> >> > > > +config DRM_XE_PREEMPT_TIMEOUT_MAX
> >> > > > +       int "Default max  preempt timeout (us)"
> >> > > > +       default 10000000 # microseconds
> >> > > > +       help
> >> > > > +         Configures the default max preempt timeout after which
> context
> >> > > > +         will be forcefully taken away and higher priority cont=
ext will
> >> > > > +         run.
> >> > > > +config DRM_XE_PREEMPT_TIMEOUT_MIN
> >> > > > +       int "Default min  preempt timeout (us)"
> >> > > > +       default 1 # microseconds
> >> > > > +       help
> >> > > > +         Configures the default min preempt timeout after which
> context
> >> > > > +         will be forcefully taken away and higher priority cont=
ext will
> >> > > > +         run.
> >> > > > +config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> >> > > > +       bool "Default configuration of limitation on scheduler t=
imeout"
> >> > > > +       default y
> >> > > > +       help
> >> > > > +	 Configures the enablement of limitation on scheduler
> timeout
> >> > > > +	 to apply to applicable user. For elevated user, all above MIN
> >> > > > +	 and MAX values will apply when this configuration is enable
> to
> >> > > > +	 apply limitation. By default limitation is applied.
> >> > > > diff --git a/drivers/gpu/drm/xe/xe_engine.c
> >> > > > b/drivers/gpu/drm/xe/xe_engine.c index
> >> > > > 9e167b113963..d934196eb79f
> >> > > > 100644
> >> > > > --- a/drivers/gpu/drm/xe/xe_engine.c
> >> > > > +++ b/drivers/gpu/drm/xe/xe_engine.c
> >> > > > @@ -13,6 +13,7 @@
> >> > > >
> >> > > >  #include "xe_device.h"
> >> > > >  #include "xe_gt.h"
> >> > > > +#include "xe_hw_engine_class_sysfs.h"
> >> > > >  #include "xe_hw_fence.h"
> >> > > >  #include "xe_lrc.h"
> >> > > >  #include "xe_macros.h"
> >> > > > @@ -191,8 +192,12 @@ static int engine_set_priority(struct
> >> > > > xe_device *xe, struct xe_engine *e,  static int
> >> engine_set_timeslice(struct xe_device *xe, struct xe_engine *e,
> >> > > >  				u64 value, bool create)
> >> > > >  {
> >> > > > -	if (!capable(CAP_SYS_NICE))
> >> > > > -		return -EPERM;
> >> > > > +	u32 min =3D e->hwe->eclass->sched_props.timeslice_min;
> >> > > > +	u32 max =3D e->hwe->eclass->sched_props.timeslice_max;
> >> > >
> >> > > So I screwed this up in my last comment, sorry.
> >> > >
> >> > > min =3D cap_nice ? KConfig option for min :
> >> > > e->hwe->eclass->sched_props.timeslice_min;
> >> > > same logic for max;
> >> > >
> >> > > Probably add helper for this.
> >> > >
> >> > > > +
> >> > > > +	if (enforce_schedule_limit() &&
> >> > > > +	    !engine_timeout_in_range(value, min, max))
> >> > >
> >> > > Then I think logic works too...
> >> > >
> >> > > if cap nice && !Kconfig option to enfore limits
> >> > > (enforce_schedule_limit
> >> returns false):
> >> > > 	user can do whatever
> >> > > else if cap nice
> >> > > 	user within Kconfig range
> >> > > else
> >> > > 	user within sysfs range
> >> > >
> >> > > This is what we want in the end.
> >> > >
> >> >
> >> > Matt, I think this is exactly what the previous revision of the
> >> > patch was
> >> doing.
> >> >
> >>
> >> No... Previous version
> >>
> >> min =3D Kconfig option to enfore limits ? KConfig option for min :
> >> e->hwe-
> >> >eclass->sched_props.timeslice_min
> >> same for max
> >>
> >> Results in:
> >>
> >> if cap nice && !Kconfig option to enfore limits
> >> (enforce_schedule_limit returns false):
> >> 	user can do whatever
> >> else if cap_nice || Kconfig option to enfore limit
> >> 	user within Kconfig range
> >> else
> >>  	user within sysfs range
> >>
> >> !cap_nice && Kconfig option to enfore limits =3D=3D user within Kconfi=
g
> >> range
> >> (previously) !cap_nice && Kconfig option to enfore limits =3D=3D user
> >> within sysfs range (my suggestion)
> >
> >In previous version we can achieve it by just adding one below check rig=
ht?
> >#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT) &&
> cap_nice
> >+       u32 min =3D XE_HW_ENGINE_TIMESLICE_MIN;
> >+       u32 max =3D XE_HW_ENGINE_TIMESLICE_MAX; #else
> >+       u32 min =3D e->hwe->eclass->sched_props.timeslice_min;
> >+       u32 max =3D e->hwe->eclass->sched_props.timeslice_max;
> >+#endif
> >
> >Please let me know!
> >
>=20
> Ah I see. Yah, it is a limits selection issue.
> We can do,
>=20
> u32 min =3D e->hwe->eclass->sched_props.timeslice_min;
> u32 max =3D e->hwe->eclass->sched_props.timeslice_max;
>=20
> #if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>          if (cap_nice) {
>                  u32 min =3D XE_HW_ENGINE_TIMESLICE_MIN;
>                  u32 max =3D XE_HW_ENGINE_TIMESLICE_MAX;
>          }
> #endif
>=20
> Matt, Tejas
> Also, looks like you missed my another comment below.
>=20
> Niranjana
>=20
> >>
> >> The logic is different and I believe we want what I'm suggesting.
> >>
> >> Matt
> >>
> >> > > > +		return -EINVAL;
> >> > > >
> >> > > >  	return e->ops->set_timeslice(e, value);  } @@ -201,8 +206,12
> >> > > > @@ static int engine_set_preemption_timeout(struct xe_device *xe=
,
> >> > > >  					 struct xe_engine *e, u64
> value,
> >> > > >  					 bool create)
> >> > > >  {
> >> > > > -	if (!capable(CAP_SYS_NICE))
> >> > > > -		return -EPERM;
> >> > > > +	u32 min =3D e->hwe->eclass-
> >sched_props.preempt_timeout_min;
> >> > > > +	u32 max =3D e->hwe->eclass-
> >sched_props.preempt_timeout_max;
> >> > > > +
> >> > > > +	if (enforce_schedule_limit() &&
> >> > > > +	    !engine_timeout_in_range(value, min, max))
> >> > > > +		return -EINVAL;
> >> > > >
> >> > > >  	return e->ops->set_preempt_timeout(e, value);  } @@ -
> 266,11
> >> > > > +275,15 @@ static int engine_set_persistence(struct xe_device
> >> > > > +*xe,
> >> > > > struct xe_engine *e,  static int engine_set_job_timeout(struct
> >> > > > xe_device
> >> *xe, struct xe_engine *e,
> >> > > >  				  u64 value, bool create)
> >> > > >  {
> >> > > > +	u32 min =3D e->hwe->eclass->sched_props.job_timeout_min;
> >> > > > +	u32 max =3D e->hwe->eclass->sched_props.job_timeout_max;
> >> > > > +
> >> > > >  	if (XE_IOCTL_DBG(xe, !create))
> >> > > >  		return -EINVAL;
> >> > > >
> >> > > > -	if (!capable(CAP_SYS_NICE))
> >> > > > -		return -EPERM;
> >> > > > +	if (enforce_schedule_limit() &&
> >> > > > +	    !engine_timeout_in_range(value, min, max))
> >> > > > +		return -EINVAL;
> >> > > >
> >> > > >  	return e->ops->set_job_timeout(e, value);  } diff --git
> >> > > > a/drivers/gpu/drm/xe/xe_hw_engine.c
> >> > > > b/drivers/gpu/drm/xe/xe_hw_engine.c
> >> > > > index afa7d25c3852..e601bffe3b13 100644
> >> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> >> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> >> > > > @@ -364,8 +364,16 @@ static void hw_engine_init_early(struct
> >> > > > xe_gt *gt, struct xe_hw_engine *hwe,
> >> > > >
> >> > > >  	if (!gt->eclass[hwe->class].sched_props.job_timeout_ms) {
> >> > > >  		gt->eclass[hwe->class].sched_props.job_timeout_ms
> =3D HZ *
> >> 5;
> >> > > > +		gt->eclass[hwe-
> >class].sched_props.job_timeout_min =3D
> >> XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> >> > > > +		gt->eclass[hwe-
> >class].sched_props.job_timeout_max =3D
> >> > > > +XE_HW_ENGINE_JOB_TIMEOUT_MAX;
> >> > > >  		gt->eclass[hwe->class].sched_props.timeslice_us =3D 1
> * 1000;
> >> > > > +		gt->eclass[hwe->class].sched_props.timeslice_min =3D
> >> XE_HW_ENGINE_TIMESLICE_MIN;
> >> > > > +		gt->eclass[hwe->class].sched_props.timeslice_max =3D
> >> > > > +XE_HW_ENGINE_TIMESLICE_MAX;
> >> > > >  		gt->eclass[hwe-
> >class].sched_props.preempt_timeout_us =3D
> >> 640 *
> >> > > > 1000;
> >> > > > +		gt->eclass[hwe-
> >class].sched_props.preempt_timeout_min =3D
> >> > > > +
> >> 	XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> >> > > > +		gt->eclass[hwe-
> >class].sched_props.preempt_timeout_max =3D
> >> > > > +
> >> 	XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
> >> > > >  		/* Record default props */
> >> > > >  		gt->eclass[hwe->class].defaults =3D gt->eclass[hwe-
> >> >class].sched_props;
> >> > > >  	}
> >> > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h
> >> > > > b/drivers/gpu/drm/xe/xe_hw_engine.h
> >> > > > index 7eca9d53c7b1..3d37d6d44261 100644
> >> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> >> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> >> > > > @@ -10,6 +10,37 @@
> >> > > >
> >> > > >  struct drm_printer;
> >> > > >
> >> > > > +#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN #define
> >> > > > +XE_HW_ENGINE_JOB_TIMEOUT_MIN
> >> CONFIG_DRM_XE_JOB_TIMEOUT_MIN #else
> >> > > > +#define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1 #endif #ifdef
> >> > > > +CONFIG_DRM_XE_JOB_TIMEOUT_MAX #define
> >> > > > +XE_HW_ENGINE_JOB_TIMEOUT_MAX
> >> CONFIG_DRM_XE_JOB_TIMEOUT_MAX #else
> >> > > > +#define XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000) #endif
> #ifdef
> >> > > > +CONFIG_DRM_XE_TIMESLICE_MIN #define
> >> XE_HW_ENGINE_TIMESLICE_MIN
> >> > > > +CONFIG_DRM_XE_TIMESLICE_MIN #else #define
> >> > > > +XE_HW_ENGINE_TIMESLICE_MIN 1 #endif #ifdef
> >> > > > +CONFIG_DRM_XE_TIMESLICE_MAX #define
> >> XE_HW_ENGINE_TIMESLICE_MAX
> >> > > > +CONFIG_DRM_XE_TIMESLICE_MAX #else #define
> >> > > > +XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000) #endif #ifdef
> >> > > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
> >> > > > +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN
> >> > > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN #else #define
> >> > > > +XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1 #endif #ifdef
> >> > > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
> >> > > > +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX
> >> > > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX #else #define
> >> > > > +XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000)
> #endif
> >> > > > +
> >> > > >  int xe_hw_engines_init_early(struct xe_gt *gt);  int
> >> > > > xe_hw_engines_init(struct xe_gt *gt);  void
> >> > > > xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16
> >> > > > intr_vec); diff --git
> >> > > > a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> >> > > > b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> >> > > > index 990bb675d1e0..2b7ac4e02db6 100644
> >> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> >> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> >> > > > @@ -11,6 +11,20 @@
> >> > > >
> >> > > >  static int xe_add_hw_engine_class_defaults(struct kobject
> >> > > > *parent);
> >> > > >
> >> > > > +bool enforce_schedule_limit(void) { #if
> >> > > > +IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> >> > > > +	return true;
> >> > > > +#else
> >> > > > +	return !capable(CAP_SYS_NICE); #endif }
> >> > > > +
> >> > > > +bool engine_timeout_in_range(u64 timeout, u64 min, u64 max) {
> >> > > > +	return timeout >=3D min && timeout <=3D max; }
> >> > > > +
> >> > > >  static void kobj_xe_hw_engine_release(struct kobject *kobj)  {
> >> > > >  	kfree(kobj);
> >> > > > @@ -39,11 +53,92 @@ kobj_xe_hw_engine_class(struct kobject
> >> *parent, char *name)
> >> > > >  	return keclass;
> >> > > >  }
> >> > > >
> >> > > > +static ssize_t job_timeout_max_store(struct kobject *kobj,
> >> > > > +				     struct kobj_attribute *attr,
> >> > > > +				     const char *buf, size_t count) {
> >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> kobj_to_eclass(kobj);
> >> > > > +	u32 timeout;
> >> > > > +	int err;
> >> > > > +
> >> > > > +	err =3D kstrtou32(buf, 0, &timeout);
> >> > > > +	if (err)
> >> > > > +		return err;
> >> > > > +
> >> > > > +	if (timeout < eclass->sched_props.job_timeout_min)
> >> > > > +		return -EINVAL;
> >> > > > +
> >> > > > +	if (enforce_schedule_limit() &&
> >> > > > +	    !engine_timeout_in_range(timeout,
> >> > > > +
> XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> >> > > > +
> XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> >> > > > +		return -EINVAL;
> >> > > > +
> >> > > > +	WRITE_ONCE(eclass->sched_props.job_timeout_max,
> timeout);
> >> > > > +
> >> > > > +	return count;
> >> > > > +}
> >> > > > +
> >> > > > +static ssize_t job_timeout_max_show(struct kobject *kobj,
> >> > > > +				    struct kobj_attribute *attr, char
> *buf) {
> >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> >> > > > +kobj_to_eclass(kobj);
> >> > > > +
> >> > > > +	return sprintf(buf, "%u\n",
> >> > > > +eclass->sched_props.job_timeout_max);
> >> > > > +}
> >> > > > +
> >> > > > +static struct kobj_attribute job_timeout_max_attr =3D
> >> > > > +__ATTR(job_timeout_max, 0644, job_timeout_max_show,
> >> > > > +job_timeout_max_store);
> >> > > > +
> >> > > > +static ssize_t job_timeout_min_store(struct kobject *kobj,
> >> > > > +				     struct kobj_attribute *attr,
> >> > > > +				     const char *buf, size_t count) {
> >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> kobj_to_eclass(kobj);
> >> > > > +	u32 timeout;
> >> > > > +	int err;
> >> > > > +
> >> > > > +	err =3D kstrtou32(buf, 0, &timeout);
> >> > > > +	if (err)
> >> > > > +		return err;
> >> > > > +
> >> > > > +	if (timeout > eclass->sched_props.job_timeout_max)
> >> > > > +		return -EINVAL;
> >> > > > +
> >> > > > +	if (enforce_schedule_limit() &&
> >> > > > +	    !engine_timeout_in_range(timeout,
> >> > > > +
> XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> >> > > > +
> XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> >> > > > +		return -EINVAL;
> >> > > > +
> >> > > > +	WRITE_ONCE(eclass->sched_props.job_timeout_min,
> timeout);
> >> > > > +
> >> > > > +	return count;
> >> > > > +}
> >> > > > +
> >> > > > +static ssize_t job_timeout_min_show(struct kobject *kobj,
> >> > > > +				    struct kobj_attribute *attr, char
> *buf) {
> >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> >> > > > +kobj_to_eclass(kobj);
> >> > > > +
> >> > > > +	return sprintf(buf, "%u\n",
> >> > > > +eclass->sched_props.job_timeout_min);
> >> > > > +}
> >> > > > +
> >> > > > +static struct kobj_attribute job_timeout_min_attr =3D
> >> > > > +__ATTR(job_timeout_min, 0644, job_timeout_min_show,
> >> > > > +job_timeout_min_store);
> >> > > > +
> >> > > >  static ssize_t job_timeout_store(struct kobject *kobj,
> >> > > >  				 struct kobj_attribute *attr,
> >> > > >  				 const char *buf, size_t count)  {
> >> > > >  	struct xe_hw_engine_class_intf *eclass =3D
> >> > > > kobj_to_eclass(kobj);
> >> > > > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> >> > > > +	u32 min =3D XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> >> > > > +	u32 max =3D XE_HW_ENGINE_JOB_TIMEOUT_MAX; #else
> >> > > > +	u32 min =3D e->hwe->eclass->sched_props.job_timeout_min;
> >> > > > +	u32 max =3D e->hwe->eclass->sched_props.job_timeout_max;
> >> > > > +#endif
> >> > >
> >> > > I don't think we need this, just make sure default is within min
> >> > > / max of the sched_props.
> >> > >
> >> >
> >> > Shouldn't the sched_prop set through sysfs here which applies to
> >> > all future user engines (xe_engine) has the same requirement as the
> >> > sched_prop set directly to user engine (xe_engine) through
> >> > set_properly
> >> ioctl?
> >> > ie., shoudln't the requirement be same in job_timeout_store() and
> >> > engine_set_job_timeout()?

I also think it should apply same to sysfs calls as well. Unless we think s=
ysfs should limit to compile configs only. Since sysfs min/max cab be chang=
ed.

Thanks,
Tejas

> >> >
> >> > Niranjana
> >> >
> >> > > Matt
> >> > >
> >> > > >  	u32 timeout;
> >> > > >  	int err;
> >> > > >
> >> > > > @@ -51,6 +146,10 @@ static ssize_t job_timeout_store(struct
> >> > > > kobject
> >> *kobj,
> >> > > >  	if (err)
> >> > > >  		return err;
> >> > > >
> >> > > > +	if (enforce_schedule_limit() &&
> >> > > > +	    !engine_timeout_in_range(timeout, min, max))
> >> > > > +		return -EINVAL;
> >> > > > +
> >> > > >  	WRITE_ONCE(eclass->sched_props.job_timeout_ms,
> timeout);
> >> > > >
> >> > > >  	return count;
> >> > > > @@ -78,11 +177,40 @@ static ssize_t job_timeout_default(struct
> >> > > > kobject *kobj,  static struct kobj_attribute job_timeout_def =3D
> >> > > > __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
> >> > > >
> >> > > > +static ssize_t job_timeout_min_default(struct kobject *kobj,
> >> > > > +				       struct kobj_attribute *attr, char
> *buf) {
> >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> >> > > > +kobj_to_eclass(kobj->parent);
> >> > > > +
> >> > > > +	return sprintf(buf, "%u\n",
> >> > > > +eclass->defaults.job_timeout_min);
> >> > > > +}
> >> > > > +
> >> > > > +static struct kobj_attribute job_timeout_min_def =3D
> >> > > > +__ATTR(job_timeout_min, 0444, job_timeout_min_default, NULL);
> >> > > > +
> >> > > > +static ssize_t job_timeout_max_default(struct kobject *kobj,
> >> > > > +				       struct kobj_attribute *attr, char
> *buf) {
> >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> >> > > > +kobj_to_eclass(kobj->parent);
> >> > > > +
> >> > > > +	return sprintf(buf, "%u\n",
> >> > > > +eclass->defaults.job_timeout_max);
> >> > > > +}
> >> > > > +
> >> > > > +static struct kobj_attribute job_timeout_max_def =3D
> >> > > > +__ATTR(job_timeout_max, 0444, job_timeout_max_default, NULL);
> >> > > > +
> >> > > >  static ssize_t timeslice_duration_store(struct kobject *kobj,
> >> > > >  					struct kobj_attribute *attr,
> >> > > >  					const char *buf, size_t count)
> {
> >> > > >  	struct xe_hw_engine_class_intf *eclass =3D
> >> > > > kobj_to_eclass(kobj);
> >> > > > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> >> > > > +	u32 min =3D XE_HW_ENGINE_TIMESLICE_MIN;
> >> > > > +	u32 max =3D XE_HW_ENGINE_TIMESLICE_MAX; #else
> >> > > > +	u32 min =3D e->hwe->eclass->sched_props.timeslice_min;
> >> > > > +	u32 max =3D e->hwe->eclass->sched_props.timeslice_max;
> >> > > > +#endif
> >> > > >  	u32 duration;
> >> > > >  	int err;
> >> > > >
> >> > > > @@ -90,11 +218,92 @@ static ssize_t
> >> > > > timeslice_duration_store(struct
> >> kobject *kobj,
> >> > > >  	if (err)
> >> > > >  		return err;
> >> > > >
> >> > > > +	if (enforce_schedule_limit() &&
> >> > > > +	    !engine_timeout_in_range(duration, min, max))
> >> > > > +		return -EINVAL;
> >> > > > +
> >> > > >  	WRITE_ONCE(eclass->sched_props.timeslice_us, duration);
> >> > > >
> >> > > >  	return count;
> >> > > >  }
> >> > > >
> >> > > > +static ssize_t timeslice_duration_max_store(struct kobject *kob=
j,
> >> > > > +					    struct kobj_attribute *attr,
> >> > > > +					    const char *buf, size_t
> count) {
> >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> kobj_to_eclass(kobj);
> >> > > > +	u32 duration;
> >> > > > +	int err;
> >> > > > +
> >> > > > +	err =3D kstrtou32(buf, 0, &duration);
> >> > > > +	if (err)
> >> > > > +		return err;
> >> > > > +
> >> > > > +	if (duration < eclass->sched_props.timeslice_min)
> >> > > > +		return -EINVAL;
> >> > > > +
> >> > > > +	if (enforce_schedule_limit() &&
> >> > > > +	    !engine_timeout_in_range(duration,
> >> > > > +				     XE_HW_ENGINE_TIMESLICE_MIN,
> >> > > > +
> XE_HW_ENGINE_TIMESLICE_MAX))
> >> > > > +		return -EINVAL;
> >> > > > +
> >> > > > +	WRITE_ONCE(eclass->sched_props.timeslice_max, duration);
> >> > > > +
> >> > > > +	return count;
> >> > > > +}
> >> > > > +
> >> > > > +static ssize_t timeslice_duration_max_show(struct kobject *kobj=
,
> >> > > > +					   struct kobj_attribute *attr,
> >> > > > +					   char *buf)
> >> > > > +{
> >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> >> > > > +kobj_to_eclass(kobj);
> >> > > > +
> >> > > > +	return sprintf(buf, "%u\n",
> >> > > > +eclass->sched_props.timeslice_max);
> >> > > > +}
> >> > > > +
> >> > > > +static struct kobj_attribute timeslice_duration_max_attr =3D
> >> > > > +	__ATTR(timeslice_duration_max, 0644,
> >> timeslice_duration_max_show,
> >> > > > +	       timeslice_duration_max_store);
> >> > > > +
> >> > > > +static ssize_t timeslice_duration_min_store(struct kobject *kob=
j,
> >> > > > +					    struct kobj_attribute *attr,
> >> > > > +					    const char *buf, size_t
> count) {
> >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> kobj_to_eclass(kobj);
> >> > > > +	u32 duration;
> >> > > > +	int err;
> >> > > > +
> >> > > > +	err =3D kstrtou32(buf, 0, &duration);
> >> > > > +	if (err)
> >> > > > +		return err;
> >> > > > +
> >> > > > +	if (duration > eclass->sched_props.timeslice_max)
> >> > > > +		return -EINVAL;
> >> > > > +
> >> > > > +	if (enforce_schedule_limit() &&
> >> > > > +	    !engine_timeout_in_range(duration,
> >> > > > +				     XE_HW_ENGINE_TIMESLICE_MIN,
> >> > > > +
> XE_HW_ENGINE_TIMESLICE_MAX))
> >> > > > +		return -EINVAL;
> >> > > > +
> >> > > > +	WRITE_ONCE(eclass->sched_props.timeslice_min, duration);
> >> > > > +
> >> > > > +	return count;
> >> > > > +}
> >> > > > +
> >> > > > +static ssize_t timeslice_duration_min_show(struct kobject *kobj=
,
> >> > > > +					   struct kobj_attribute *attr,
> char
> >> *buf) {
> >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> >> > > > +kobj_to_eclass(kobj);
> >> > > > +
> >> > > > +	return sprintf(buf, "%u\n",
> >> > > > +eclass->sched_props.timeslice_min);
> >> > > > +}
> >> > > > +
> >> > > > +static struct kobj_attribute timeslice_duration_min_attr =3D
> >> > > > +	__ATTR(timeslice_duration_min, 0644,
> >> timeslice_duration_min_show,
> >> > > > +	       timeslice_duration_min_store);
> >> > > > +
> >> > > >  static ssize_t timeslice_duration_show(struct kobject *kobj,
> >> > > >  		struct kobj_attribute *attr, char *buf)  { @@ -118,11
> >> > > > +327,40 @@ static ssize_t timeslice_default(struct kobject
> >> > > > *kobj,  static struct kobj_attribute timeslice_duration_def =3D
> >> > > > __ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
> >> > > >
> >> > > > +static ssize_t timeslice_min_default(struct kobject *kobj,
> >> > > > +				     struct kobj_attribute *attr, char
> *buf) {
> >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> >> > > > +kobj_to_eclass(kobj->parent);
> >> > > > +
> >> > > > +	return sprintf(buf, "%u\n", eclass->defaults.timeslice_min);
> >> > > > +}
> >> > > > +
> >> > > > +static struct kobj_attribute timeslice_duration_min_def =3D
> >> > > > +__ATTR(timeslice_duration_min, 0444, timeslice_min_default,
> >> > > > +NULL);
> >> > > > +
> >> > > > +static ssize_t timeslice_max_default(struct kobject *kobj,
> >> > > > +				     struct kobj_attribute *attr, char
> *buf) {
> >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> >> > > > +kobj_to_eclass(kobj->parent);
> >> > > > +
> >> > > > +	return sprintf(buf, "%u\n", eclass->defaults.timeslice_max);
> >> > > > +}
> >> > > > +
> >> > > > +static struct kobj_attribute timeslice_duration_max_def =3D
> >> > > > +__ATTR(timeslice_duration_max, 0444, timeslice_max_default,
> >> > > > +NULL);
> >> > > > +
> >> > > >  static ssize_t preempt_timeout_store(struct kobject *kobj,
> >> > > >  				     struct kobj_attribute *attr,
> >> > > >  				     const char *buf, size_t count)  {
> >> > > >  	struct xe_hw_engine_class_intf *eclass =3D
> >> > > > kobj_to_eclass(kobj);
> >> > > > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> >> > > > +	u32 min =3D XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> >> > > > +	u32 max =3D XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX; #else
> >> > > > +	u32 min =3D e->hwe->eclass-
> >sched_props.preempt_timeout_min;
> >> > > > +	u32 max =3D e->hwe->eclass-
> >sched_props.preempt_timeout_max;
> >> > > > +#endif
> >> > > >  	u32 timeout;
> >> > > >  	int err;
> >> > > >
> >> > > > @@ -130,6 +368,10 @@ static ssize_t
> >> > > > preempt_timeout_store(struct
> >> kobject *kobj,
> >> > > >  	if (err)
> >> > > >  		return err;
> >> > > >
> >> > > > +	if (enforce_schedule_limit() &&
> >> > > > +	    !engine_timeout_in_range(timeout, min, max))
> >> > > > +		return -EINVAL;
> >> > > > +
> >> > > >  	WRITE_ONCE(eclass->sched_props.preempt_timeout_us,
> timeout);
> >> > > >
> >> > > >  	return count;
> >> > > > @@ -158,17 +400,129 @@ static ssize_t
> >> > > > preempt_timeout_default(struct kobject *kobj,  static struct
> >> > > > kobj_attribute preempt_timeout_def =3D
> >> > > > __ATTR(preempt_timeout_us, 0444, preempt_timeout_default,
> >> > > > NULL);
> >> > > >
> >> > > > +static ssize_t preempt_timeout_min_default(struct kobject *kobj=
,
> >> > > > +					   struct kobj_attribute *attr,
> >> > > > +					   char *buf)
> >> > > > +{
> >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> >> > > > +kobj_to_eclass(kobj->parent);
> >> > > > +
> >> > > > +	return sprintf(buf, "%u\n",
> >> > > > +eclass->defaults.preempt_timeout_min);
> >> > > > +}
> >> > > > +
> >> > > > +static struct kobj_attribute preempt_timeout_min_def =3D
> >> > > > +__ATTR(preempt_timeout_min, 0444,
> preempt_timeout_min_default,
> >> > > > +NULL);
> >> > > > +
> >> > > > +static ssize_t preempt_timeout_max_default(struct kobject *kobj=
,
> >> > > > +					   struct kobj_attribute *attr,
> >> > > > +					   char *buf)
> >> > > > +{
> >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> >> > > > +kobj_to_eclass(kobj->parent);
> >> > > > +
> >> > > > +	return sprintf(buf, "%u\n",
> >> > > > +eclass->defaults.preempt_timeout_max);
> >> > > > +}
> >> > > > +
> >> > > > +static struct kobj_attribute preempt_timeout_max_def =3D
> >> > > > +__ATTR(preempt_timeout_max, 0444,
> >> preempt_timeout_max_default,
> >> > > > +NULL);
> >> > > > +
> >> > > > +static ssize_t preempt_timeout_max_store(struct kobject *kobj,
> >> > > > +					 struct kobj_attribute *attr,
> >> > > > +					 const char *buf, size_t count)
> {
> >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> kobj_to_eclass(kobj);
> >> > > > +	u32 timeout;
> >> > > > +	int err;
> >> > > > +
> >> > > > +	err =3D kstrtou32(buf, 0, &timeout);
> >> > > > +	if (err)
> >> > > > +		return err;
> >> > > > +
> >> > > > +	if (timeout < eclass->sched_props.preempt_timeout_min)
> >> > > > +		return -EINVAL;
> >> > > > +
> >> > > > +	if (enforce_schedule_limit() &&
> >> > > > +	    !engine_timeout_in_range(timeout,
> >> > > > +
> >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> >> > > > +
> >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> >> > > > +		return -EINVAL;
> >> > > > +
> >> > > > +	WRITE_ONCE(eclass->sched_props.preempt_timeout_max,
> timeout);
> >> > > > +
> >> > > > +	return count;
> >> > > > +}
> >> > > > +
> >> > > > +static ssize_t preempt_timeout_max_show(struct kobject *kobj,
> >> > > > +					struct kobj_attribute *attr,
> char *buf)
> >> {
> >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> >> > > > +kobj_to_eclass(kobj);
> >> > > > +
> >> > > > +	return sprintf(buf, "%u\n",
> >> > > > +eclass->sched_props.preempt_timeout_max);
> >> > > > +}
> >> > > > +
> >> > > > +static struct kobj_attribute preempt_timeout_max_attr =3D
> >> > > > +	__ATTR(preempt_timeout_max, 0644,
> preempt_timeout_max_show,
> >> > > > +	       preempt_timeout_max_store);
> >> > > > +
> >> > > > +static ssize_t preempt_timeout_min_store(struct kobject *kobj,
> >> > > > +					 struct kobj_attribute *attr,
> >> > > > +					 const char *buf, size_t count)
> {
> >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> kobj_to_eclass(kobj);
> >> > > > +	u32 timeout;
> >> > > > +	int err;
> >> > > > +
> >> > > > +	err =3D kstrtou32(buf, 0, &timeout);
> >> > > > +	if (err)
> >> > > > +		return err;
> >> > > > +
> >> > > > +	if (timeout > eclass->sched_props.preempt_timeout_max)
> >> > > > +		return -EINVAL;
> >> > > > +
> >> > > > +	if (enforce_schedule_limit() &&
> >> > > > +	    !engine_timeout_in_range(timeout,
> >> > > > +
> >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> >> > > > +
> >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> >> > > > +		return -EINVAL;
> >> > > > +
> >> > > > +	WRITE_ONCE(eclass->sched_props.preempt_timeout_min,
> timeout);
> >> > > > +
> >> > > > +	return count;
> >> > > > +}
> >> > > > +
> >> > > > +static ssize_t preempt_timeout_min_show(struct kobject *kobj,
> >> > > > +					struct kobj_attribute *attr,
> char *buf)
> >> {
> >> > > > +	struct xe_hw_engine_class_intf *eclass =3D
> >> > > > +kobj_to_eclass(kobj);
> >> > > > +
> >> > > > +	return sprintf(buf, "%u\n",
> >> > > > +eclass->sched_props.preempt_timeout_min);
> >> > > > +}
> >> > > > +
> >> > > > +static struct kobj_attribute preempt_timeout_min_attr =3D
> >> > > > +	__ATTR(preempt_timeout_min, 0644,
> preempt_timeout_min_show,
> >> > > > +	       preempt_timeout_min_store);
> >> > > > +
> >> > > >  static const struct attribute *defaults[] =3D {
> >> > > >  	&job_timeout_def.attr,
> >> > > > +	&job_timeout_min_def.attr,
> >> > > > +	&job_timeout_max_def.attr,
> >> > > >  	&timeslice_duration_def.attr,
> >> > > > +	&timeslice_duration_min_def.attr,
> >> > > > +	&timeslice_duration_max_def.attr,
> >> > > >  	&preempt_timeout_def.attr,
> >> > > > +	&preempt_timeout_min_def.attr,
> >> > > > +	&preempt_timeout_max_def.attr,
> >> > > >  	NULL
> >> > > >  };
> >> > > >
> >> > > >  static const struct attribute *files[] =3D {
> >> > > >  	&job_timeout_attr.attr,
> >> > > > +	&job_timeout_min_attr.attr,
> >> > > > +	&job_timeout_max_attr.attr,
> >> > > >  	&timeslice_duration_attr.attr,
> >> > > > +	&timeslice_duration_min_attr.attr,
> >> > > > +	&timeslice_duration_max_attr.attr,
> >> > > >  	&preempt_timeout_attr.attr,
> >> > > > +	&preempt_timeout_min_attr.attr,
> >> > > > +	&preempt_timeout_max_attr.attr,
> >> > > >  	NULL
> >> > > >  };
> >> > > >
> >> > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> >> > > > b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> >> > > > index 757136614672..2e2ab351a991 100644
> >> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> >> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> >> > > > @@ -10,6 +10,8 @@
> >> > > >
> >> > > >  #define MAX_ENGINE_CLASS_NAME_LEN    16
> >> > > >  int xe_hw_engine_class_sysfs_init(struct xe_gt *gt);
> >> > > > +bool enforce_schedule_limit(void); bool
> >> > > > +engine_timeout_in_range(u64 timeout, u64 min, u64 max);
> >> > > >
> >> > > >  /**
> >> > > >   * struct kobj_eclass - A eclass's kobject struct that
> >> > > > connects the kobject and the
> >> > > > --
> >> > > > 2.25.1
> >> > > >
