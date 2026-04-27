Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F20FF8860
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 17:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4155710E87C;
	Mon, 27 Apr 2026 17:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V0Z1hN08";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7023710E873
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 17:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777311565; x=1808847565;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=71VNBRZetuYQ2B9BOfgoZY895yvTccXJ0dzbew7IG74=;
 b=V0Z1hN08jC3F8Wzt+HufNkMZ87uq1U9cuQXtswlzhzSa0UHOLvsnfKfk
 g/HgAvvIZAARfwZPLVlTMI+bwsxixNWnjrqPq/lQDXnBGQrmYO62SPls6
 0ivyt9+Lp78rpUTg8YtwuvdlPTB7kIKP+bxf6XnysQKM+vpKGcHxJ/G1X
 MpWDo466/HNZebngfQdMlpAn5I8ARhmDgTaaLcJJh8ShHUZmtJU/vVb+g
 c9wU0g4Jt4qrcs26S6DgXs/yjC2wmrVb17d4rnMDMm3hdFnFJIOYd1HVE
 AXq1f6dLTRm8/wkrOvylf9Kf+Eez1QJGr5wSZ6Z32MiVpSFKbrz15vnva A==;
X-CSE-ConnectionGUID: syVEp3pRTW2dm4Vjh2fTgg==
X-CSE-MsgGUID: U7h+IL27R9y9dN85ioslFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78269616"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="78269616"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 10:39:23 -0700
X-CSE-ConnectionGUID: x7FQJg48RMyBGLFIQh6etg==
X-CSE-MsgGUID: Mc7CQ152R1WIiTN50M1mog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="229366364"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 10:39:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 10:39:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 10:39:21 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.59)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 10:39:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMvtWjtYaLXUSAbftytQ+Nn9/qKnAbi52RMMWUzh2Buyn684FoKby64/bd0YoD3Emo4j1zm5bP9icr+NuH4/B9lJ4jb3xsDi3xpOGvqmGQcxur6M5eckYNzwE5L8LeSdldfva0L5wC1NLQ+ZzmGiRK1LiNgcv9gsvTC2G46yRv256hhlCPalBOX1Z/DrvT9v/pklc1DVRmPVRuPBVYm4rMIbRVTdtpREaZAe404Yga7jz7a4I7LqBEkefH1Z/eevGRU1H+VkwcE3mj3zEvh23j/wXJQAnKcDWOICsATfQ4zPnxpqKuyYgqdjLXRu73XJXxh/hy/+wrWO/yewW7vvMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TOCwWKovgludlNDDT3ie/bacgA8kdf/wTRAVxTOZyf0=;
 b=BWlcOmUOYP4RgO9294O8GSkD4emEu7MOrtxD7uSAnl2jqdQqa2N5m3TPtT5UP5oaQOS1/i3wss0FNYboQwyb9SzM2Hmz1oc5ljcYEKgGm7jDOf035pN7RAmxEbTXInmen9Rx57RJSmTK24xLCFDj3i9YvYq1E+zqcLHJZTw47LzXfSjFmv4bV2/afsfhlZ1tJE/gVZWBIllraIyi+r4B3m3YopGCpyPd/t4yuaZLfcxYFuaISzOfIXBop0Dnc5LrMv7JirrnXu/mwTbgGK1ppz7B3bwXS5ZfCOgID8C/TrEojpXM4E05RN6L0Wy9GUj/UsO7S0ApYm1uXwVLwzi68g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DM4PR11MB8178.namprd11.prod.outlook.com (2603:10b6:8:18f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 17:39:18 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 17:39:18 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2 01/10] drm/xe: Move CCS enablement to engine setup RTP
Thread-Topic: [PATCH v2 01/10] drm/xe: Move CCS enablement to engine setup RTP
Thread-Index: AQHc1CwN8PUNEpfbV0esMYduPGGoQrXzGQlQgAAJjICAAA4U0A==
Date: Mon, 27 Apr 2026 17:39:18 +0000
Message-ID: <DM4PR11MB5456E714548F7EBEF413C15DEA362@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
 <20260424-engine-setup-v2-1-59cc620a25f1@intel.com>
 <DM4PR11MB545671AE0E0F142BC6959768EA362@DM4PR11MB5456.namprd11.prod.outlook.com>
 <20260427164659.GH2131374@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20260427164659.GH2131374@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DM4PR11MB8178:EE_
x-ms-office365-filtering-correlation-id: 72509e86-dc14-460c-4b93-08dea483e8cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: eMzwhF/dK6w7QV/nMtQ1htS0LOAmtMEOHxNtch9FenbygNt0mgEjleuEKlbKvwh5/82kfIvQ2BBzXkB+DOatlOIzn2bqvymwETQWI72BkBpBvfqr6kRpTBXva+CErUodIqXSkqhMz3T0T+PiUy7lWVoWKbAqmNu4lb4pZXhIvy02mrg+i0ryzy+H94Yq41bcomnPmAxLgaGOrz/brN9R0njAO1qLX+L/+nLkhCJsQastnyGgB2yD6gSrQaO6Fy+Rg8duU/anxsTKV33Evqid+YHMN2ynKZwmLrQkZabGpRos32pzZJqUefRc7lqAyi1UHgcOfeSNOocFxRSCBgqm6bsgJRDx4TQn9rRxCGf/2m++SRpa/GVMjx5NRaruwMCnlFUmHpH9pPQdVk0PUPfvcCN69pxsXW8hXbKCuoKZPf5L/hNMLNwO8TS/BriBCLa8ju0uY+4TF2nfZq4WykOkY5z0yS7IasDeZSWxvBTB49xmhhHWRoJv4mEjcBiX00yYxMvvJvWjIR8ydHe1+HLB703IwPPx5w1nq6qQYMYdRqdFzt2m5Pq9GioV6nLu3X1ZzwMo529Qp2XdAF6Zo8hXZYpBE3lMY4bxndy1x9B9t5TMmrFygRq6J3Tc/8O28xHCwAgD2BzJoIC7fHKqUxpoSp9TFz1RNN/hR91uzJobaeteeJrHW5F7d1/3m3852XmLZPDb1St4UvnOWEVE9Klok7X5RpdafQz/ThqhGpAyZXAxf90Q9Ak0WBg3ijutDEpMMTD9jMPYf+e1IhxblNpTuNJUJTsuLDOWxHiUKzAQFzo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EeYE8yzkWfbfJx6+dualwxDy47UeAUzCKOfHIxAaU4N99mVyflPMi4tWjebG?=
 =?us-ascii?Q?k3YMJWAAFJDGFU4B/S2pT6RnFM6AMZX6rskdxXFqPXU5ez76ZHxxwfRzGlN5?=
 =?us-ascii?Q?se8/OHlW6B/3IZpxe9cMbe2CPCFFrFBkTSthUvuSzuf/PMcM81SPKvQZ+3lx?=
 =?us-ascii?Q?+9iJwhFTq3mHkRL7EVXzx4rZY9IR40vewASQzn4LJvrZXfSsjSSPQEc9AUl/?=
 =?us-ascii?Q?bP8LsAkhTuxda7hAM+L26Eoz07I5QplkqEhjMFM6wg7YqVKA+Mgj3P0+29MT?=
 =?us-ascii?Q?tbFfIlVsPgNrzG9hDZFzKZAxjgQKM8ejZ5lkaRqGdlCA7oF+3m2EEYWSEWFT?=
 =?us-ascii?Q?nshEkG5bWiJmzZeUVBVMeGcvZ2VL9xI+0ab/5EuoCNfkPmOpR9gOYYApYXWb?=
 =?us-ascii?Q?bl3Wil8Iru6uWo9DveZi0gKvdtVO7HfNYLTOxc8jpFh9XJHqlXXi4FlI/1GB?=
 =?us-ascii?Q?qb8z12hW/hxtTwSwbSh0TYzs0ksSI4PKN0rKvoA4a/Z4ldenxDKRqMU24lfO?=
 =?us-ascii?Q?1DCByhLMVrPfTu3e2lpEOcXvdqPaj5ME1m2N6tSx0g0i/TvZyo3CtR/UNDq5?=
 =?us-ascii?Q?tHXS1yQ3o4MtV3VKWTODmS008XxnTj2L/C4o0GP9Jz3LhamNJNYb+OZfOsFH?=
 =?us-ascii?Q?gwnXJZq2ADe2Btg9It02Oo+RLBnDjWQa+hPAUrHPJAxe9lLmnbIXr2Urktjp?=
 =?us-ascii?Q?L7ZJzOSvb33R8R6Des3A4SXlg7RrBI4uDfww7yD5YbrQb3reKp/qisaBrMin?=
 =?us-ascii?Q?ppoPR0hDhisX4svfm7z3+r59AcbZAj/J+UN4ytDln5yYXiXlXfsOMfGYf1KR?=
 =?us-ascii?Q?TITvHhfN9/wZcLhC5HrRlYq/UXWYebsTtfeV81C4joe96sE4IYFWxJud/TUX?=
 =?us-ascii?Q?Md7U9awE3yO6tQFHBgt8yjkuprpLvIJ2Vvix4rlR5ZQgn5kxO8KGQqgesBQV?=
 =?us-ascii?Q?81mZXDrX493w6n1lqk0KwvJ9NS/CeUX686ovGcm1HfUnqWeBi9nQBLiPSWfO?=
 =?us-ascii?Q?H0zJDQkC6enGSIHxVNY2SdwC2+Y1h3ANzx9865EOxTqi+3/i7Ltu1aKwS/pJ?=
 =?us-ascii?Q?OA0/byvctXdd4c8wDhyGJGGU9jq0ycWY8XsaAljP7GTOTgmifaYrkCpx8iAl?=
 =?us-ascii?Q?nzrTNG5C/vXXhOKL9hwsfDryrvEq8DLoRP1BPmz70Maco5IdBPY0XwR83kmh?=
 =?us-ascii?Q?9c11mw64nOQrr18s2YPtV1QPRLTCH89n/0pE2YafLSq8vt2pKgm7clAyCnWd?=
 =?us-ascii?Q?ePm1JqBQGUfGEJ1/u5khoTa+/YZmLRS+Z8T/syokCYFsJy20rghzvWMJIayn?=
 =?us-ascii?Q?ewMmsQU3SAb2RvTFss0tWYnAqYg6gwZd0Pue/tQhKMx0LCP96sJKbYNeursA?=
 =?us-ascii?Q?T0qTqQB3P/Vu7Qv1BFoHx7X4GPTHb1QHzYQ8c87gBjVw5eECoV756ixfRXIc?=
 =?us-ascii?Q?ftY6iNbMXsgkyN+WfU6reIuYTYV6Jd8sPgpff+tjE16DJdMn5PkxO9RrGdLT?=
 =?us-ascii?Q?JOi8yjhKeATWLlJGhW5RpTlHCB6hToN9l7zd1bvm8r/omXRXt1pt8OitGz3o?=
 =?us-ascii?Q?lPqsDbiVpQzGuZGpGSh3EdfiyEztUNGatL7Xegy7JkKwv/CiV09klQvgHSiS?=
 =?us-ascii?Q?c+0N2BR9h8ZUrPwmihQkqWaHUaWFjUIFF2TxsU1lFicc6rIbPwmxifc+F1ME?=
 =?us-ascii?Q?fY6R99206QtIurD2Tq15CXcQ/2ZnIdVwG9UliiIJFzhBhaimL4wA4tGzkPKG?=
 =?us-ascii?Q?jXYSrD2NEQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FUAgU5udQhWOgVVhs95Zg+tATp02fSEopGPkdYRQN6n/QjUYVhAM7MlGJkokB8XwRgdZs/kOS2HVR7WFVUHrBTDTxrKlX4tx+w6zGrWrvmytkb5SXIpjLyDRnNz+TtUx3jloOQ/VpKVyS61VPDH4kOnAMWmv5WUu5k/VghTZOGT2Suwej5AJTDpHnqoAgM9MPU+Z0mZTfgWheQ0awzNT9AYjJnVR2rkky4GDo2SZeixtuy+2LvkbBIaS35vg2k6JSh7LtcDiAyNKK2XWyXfumpjExthE0r1N2GB6gqNXqkoK4p3ZJZvHD4/kyABdleKnj1bLmAxWqrltVQY0fgyEWw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72509e86-dc14-460c-4b93-08dea483e8cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2026 17:39:18.6077 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: joqy30ALyH6vDCGRKT3n+11rOF6qZsxSw+b2PN/xhlgOJx/uFrF9HI/4X099UjyDQ7pvfEywbf8xhCm4ZRDycw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8178
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

On Mon, Apr 27, 2026 9:47 AM Matt Roper wrote:
> On Mon, Apr 27, 2026 at 09:30:10AM -0700, Lin, Shuicheng wrote:
> > On Fri, Apr 24, 2026 1:48 PM Matt Roper wrote:
> > > Most register programming for engine setup happens via RTP tables in
> > > hw_engine_setup_default_state().  Move the programming of
> > > RCU_MODE[0] which enables the platform's CCS engine(s) there.  This
> > > both makes the code more consistent (other RCU_MODE register
> > > programming is already happening in this RTP table) and improves
> > > debuggability (since RTP contents and checks of their correct
> > > programming are exposed via debugfs).  It also helps consolidate the
> > > regular driver initialization paths with the vestigial and currently =
unused
> execlist (i.e., non-GuC) initialization.
> > >
> > > With the original programming, the RCU_MODE register (which is a
> > > single global register, not a per-engine register) was getting
> > > re-programmed with the same value during the initialization of each
> > > CCS engine.  When moved to the RTP table, we use the
> > > xe_rtp_match_first_render_or_compute
> > > match function so that it will just be programmed once, while doing
> > > the initialization for the first RCS/CCS engine, which avoids the
> > > redundant and unnecessary repetition.
> > >
> > > We can also safely drop the explicit addition of RCU_MODE from the
> > > GuC ADS save-restore list now since all registers programmed via RTP
> > > tables are automatically added to the GuC's list.
> > >
> > > v2:
> > >  - Only enable CCS engines on Xe_HP and later.  Even though Xe_LP
> > >    platforms technically have a CCS engine, it's never been enabled o=
n
> > >    i915 or Xe due to other issues on these old platforms.
> > >
> > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_execlist.c  |  4 ----
> > >  drivers/gpu/drm/xe/xe_guc_ads.c   |  1 -
> > >  drivers/gpu/drm/xe/xe_hw_engine.c | 11 +++++------
> > >  3 files changed, 5 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_execlist.c
> > > b/drivers/gpu/drm/xe/xe_execlist.c
> > > index 1f8d358e60fd..026a1ec0c868 100644
> > > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > > @@ -59,10 +59,6 @@ static void __start_lrc(struct xe_hw_engine *hwe,
> > > struct xe_lrc *lrc,
> > >  		lrc_desc |=3D FIELD_PREP(SW_CTX_ID, ctx_id);
> > >  	}
> > >
> > > -	if (hwe->class =3D=3D XE_ENGINE_CLASS_COMPUTE)
> > > -		xe_mmio_write32(mmio, RCU_MODE,
> > > -
> > > 	REG_MASKED_FIELD_ENABLE(RCU_MODE_CCS_ENABLE));
> > > -
> > >  	xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
> > >  	lrc->ring.old_tail =3D lrc->ring.tail;
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c
> > > b/drivers/gpu/drm/xe/xe_guc_ads.c index 92c6981fe220..d0497d9f43a2
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > > @@ -748,7 +748,6 @@ static unsigned int guc_mmio_regset_write(struct
> > > xe_guc_ads *ads,
> > >  		{ .reg =3D RING_MODE(hwe->mmio_base),
> > > 	},
> > >  		{ .reg =3D RING_HWS_PGA(hwe->mmio_base),
> > > 	},
> > >  		{ .reg =3D RING_IMR(hwe->mmio_base),			},
> > > -		{ .reg =3D RCU_MODE, .skip =3D hwe !=3D hwe_rcs_reset_domain
> > > 	},
> > >  		{ .reg =3D CCS_MODE,
> > >  		  .skip =3D hwe !=3D hwe_rcs_reset_domain
> > > || !xe_gt_ccs_mode_enabled(hwe->gt) },
> > >  	};
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > index 2f9c1c063f16..74f29025dd6c 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > @@ -325,14 +325,8 @@ u32 xe_hw_engine_mmio_read32(struct
> > > xe_hw_engine *hwe, struct xe_reg reg)
> > >
> > >  void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)  {
> > > -	u32 ccs_mask =3D
> > > -		xe_hw_engine_mask_per_class(hwe->gt,
> > > XE_ENGINE_CLASS_COMPUTE);
> > >  	u32 ring_mode =3D
> > > REG_MASKED_FIELD_ENABLE(GFX_DISABLE_LEGACY_MODE);
> > >
> > > -	if (hwe->class =3D=3D XE_ENGINE_CLASS_COMPUTE && ccs_mask)
> > > -		xe_mmio_write32(&hwe->gt->mmio, RCU_MODE,
> > > -
> > > 	REG_MASKED_FIELD_ENABLE(RCU_MODE_CCS_ENABLE));
> > > -
> > >  	xe_hw_engine_mmio_write32(hwe, RING_HWSTAM(0), ~0x0);
> > >  	xe_hw_engine_mmio_write32(hwe, RING_HWS_PGA(0),
> > >  				  xe_bo_ggtt_addr(hwe->hwsp));
> > > @@ -465,6 +459,11 @@ hw_engine_setup_default_state(struct
> > > xe_hw_engine *hwe)
> > >  		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
> > > CS_PRIORITY_MEM_READ,
> > >  				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> > >  		},
> > > +		{ XE_RTP_NAME("Enable CCS Engine(s)"),
> > > +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1255,
> > > XE_RTP_END_VERSION_UNDEFINED),
> > > +			       FUNC(xe_rtp_match_first_render_or_compute)),
> >
> > If ccs is disabled by configfs, will there be any side effect to progra=
m it?
>=20
> That should be okay; the goal of configfs is to prevent the KMD from acti=
vely
> working with the engine or exposing it to userspace.  Letting the hardwar=
e
> itself consider the engine enabled should be fine since that's no differe=
nt from
> the RCS/BCS/VCS/etc engines that the hardware always considers enabled,
> even if we choose to not work with them in the KMD.

Thanks for the explanation.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

>=20
>=20
> Matt
>=20
> >
> > Other code LGTM.
> >
> > Shuicheng
> >
> > > +		  XE_RTP_ACTIONS(SET(RCU_MODE,
> > > RCU_MODE_CCS_ENABLE))
> > > +		},
> > >  		/* Use Fixed slice CCS mode */
> > >  		{ XE_RTP_NAME("RCU_MODE_FIXED_SLICE_CCS_MODE"),
> > >
> > > XE_RTP_RULES(FUNC(xe_hw_engine_match_fixed_cslice_mode)),
> > >
> > > --
> > > 2.53.0
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
