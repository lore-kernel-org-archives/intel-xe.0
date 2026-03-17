Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07517FF6E7F
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 20:55:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D3810E362;
	Tue, 17 Mar 2026 20:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="alqpFewz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB6510E362
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 20:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773780931; x=1805316931;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=mqaPjdC3EbW0YpAiBYtJNsgpYYfYPYTkPXNIVvwut6c=;
 b=alqpFewzuyuk471A/DrsB93h+ADnGMwDraH1aNy6ifOhC+n2q2cYiSUR
 fcOuq80u4vYzqYMGxRbJZD7+aln753Ckft8vW1iUJnYS2mvRwl9bKYgi9
 ZRV9/uNqayFGBIQgmsDsb55+6mOXFuEUKp3pq8a1tWEyPArEtGkx4wJEi
 SsEOY0aRWKn/4OczxK6yASq3Q3yzwDfC2VeUk4rq7ugDQv6tTNCX/KYOG
 eSWhw80sNmV5zNnjgRm3c7TNtY5rD7oqtQjbYWrBRiz0D+yvfcj6KlJik
 yqjcL6D6hpIZp95ym/HkXDKeTGFLc9tSDDncoA1FcqqAp4RwuCkX7FYYx w==;
X-CSE-ConnectionGUID: 3+PkXnNaSIqJGypFbak8pg==
X-CSE-MsgGUID: 9NWOSXAaRwiL9vZXtgA3yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="92209158"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="92209158"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 13:55:29 -0700
X-CSE-ConnectionGUID: D+QFS3HPT9+fWY0/Un521w==
X-CSE-MsgGUID: Ph4xxYGOTSaBCbpLO3NiXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="218480357"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 13:55:29 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 13:55:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 17 Mar 2026 13:55:28 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.29) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 13:55:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxUT3BGZNc4Z6zw3ZfYiCASMPQ1yY4aT/nS3Rt5gBwRJ3j1H7IJOW/xBZwX+YXtg7JOZ0aXHYr6aoYPfZg325UfGNm9+cdyNPb7x43JbOv2wDEq+Su+xfs+Ar922QVLMlyb5Xzpzpt0DH9MWdjRVFZAf707TrKvOove3hzf1Wu6FRDZ/UThwaZ1Squc7B/LlinUXpgE7cv8xVKvG0roQkIhAk7ggRxmAAjgy1bfqeRrQfgBZId1SLuBWSpS4Qf9JLKPBuLFZVkj2kV4G37eVkfkflOjehLsLHjwjD1qRxykfejnczEsqe81A7U7glbJdcwP8Mrc/AFqdaBwOm4MO9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMEsu2Rn8QimGaOn67Z8N7rcuLtymMd0mnINnBnnOYg=;
 b=ABo7NHpH/Dg6Vbpdb1v0U4rAtYw0p+c8aTxNMzKCMM8lQX2Qd9Fc+sZH2hH1kp0V1VAwJzqJ9l8ZdguHV4tqV2VdqN5SnjTly9GVSjqOmxASSTVCpCwxjBBRX1LIOYBqNeDrdJ/ie/1V8kc/BAEk16BmN7UupWlhDjcAqzABtMpzPQA8glrduOZZPZ0HJRYopkZyV0r7HVdwtDU5TK6TkKvfs5S35P/7RbShrot/xTws9H4gV6HPcEDxyPW23aPAjF/ipd98jiRG35mJrekZqk0SacMK41oIC7ZfpyFtcvcyXdgPSbNiQyoi3Ga5nItZLP0mFZJvZNdYUcRIOkMnQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DM4PR11MB6504.namprd11.prod.outlook.com (2603:10b6:8:8d::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.16; Tue, 17 Mar 2026 20:55:25 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 20:55:25 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 0/4] kernel-doc fix for headers
Thread-Topic: [PATCH 0/4] kernel-doc fix for headers
Thread-Index: AQHctW/hrPvBAm/I+UKz1MRuQvtMjbWyp6aAgABSLLCAADMPAIAABaIA
Date: Tue, 17 Mar 2026 20:55:25 +0000
Message-ID: <DM4PR11MB5456F7FB8A80E3A9B9A71080EA41A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260316180322.1721237-6-shuicheng.lin@intel.com>
 <afd9abb5636b6de4c84250dac35565b6db526c48@intel.com>
 <DM4PR11MB54568B292FD55BFB10B342FEEA41A@DM4PR11MB5456.namprd11.prod.outlook.com>
 <34f735c369955434693b3f256d39e94e34d49360@intel.com>
In-Reply-To: <34f735c369955434693b3f256d39e94e34d49360@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DM4PR11MB6504:EE_
x-ms-office365-filtering-correlation-id: ed06f4ea-2a4b-49c1-8606-08de8467834e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|10070799003|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: PuewxsD4olPiDXaSD91dwtu2i3eqWuDhxIktY9bzee6R0ioxn+nJeFRJqlZC3LuxLHApELUALAjVlWzqtlnZVEpSOn9/yFdNc6PrOSXI2ks2oiG8UXxU5wxxG5bNBZ4vVCXQzHWKZ9RgGActoL7ZYrMre4MSAygwn1O/EgCQp5J6ignJFmGphJQgyjJOs38Jk0gXxWWH8s3/zGajDWUJt5NQ1/7LFUw0RBID5728fxS4yCZ8xHPbdj6f325j76AztwO9sKcwc3NOITcvfAAWO7sDSPQRQ1o0ssYpyl7z7+jmDUlsOHeM7ypdLu+vAdrwLS/1KxHdlMfyqxYsFQMsrMOb9OrqTJFlVBn16Z6zW2EbEL0vYoe6HvC3RAV/Z3KsjwOSfFBK1jtKTBsbukwYfelrvFWspV4FxhgSlabm+jtl+I6EgvjuFJIOEk+RFJH6Sdzxu0hoWIUZ6jbhPtgJXrC8hssAxwhL0GLxSJfpC9ICVDx8CssbEQi9TjhmQpRYUErXAmvM6E0grj8c6B/t2lFMyYj46goXajHUHxYfqWYBMZ5csodDTa1W13I+ROn/2E8R5x5NHzJPCF9Ffy/zhNLHd25JaxxHAisaUmLer+65kTYTkq5DyaOuvTq/dsAFQMyDnZ9YTr6FJqpUc0YocAomsSTyJDMQrZUJxTCFR8Q7KVr9oly8YGQ+SXf63HuNLXNPoqF19Jkr02CQR0H0bnUvUJTUCqAbynJfNVJlnQD1DtDsld67JYTKc5U/043CN4n5phN2IDpKEVQ3Fr59tStrnDm2gfY541EUrngH6W0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700021)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?N+nRSSxwMzm3nx1hAgDCwzew9oPYCHdl8kIZ0aGs/tM7HJYV0JVLCj4eJ1NJ?=
 =?us-ascii?Q?Nw2mny7gjXc4n1ufhE9vdkBSVEB9yty+mZKKEddL4skwufV4YsCNB8tCgJ99?=
 =?us-ascii?Q?due5L8rkKvMPlHBATmnPZZ3XtfqbmoVXFkFWwvP32N5NWtd0dZo/uWxAJGbO?=
 =?us-ascii?Q?XNuCg4UKynYspicZ63QpGLl7RqYnr/43LIzBITqtVdkdAFSPfT4b2+5m2a63?=
 =?us-ascii?Q?+fZq700QqW5RpyLMB0v69zOzcBlIW6FRpJ+v26UP+m0kqNIKxv/K1Enr8zus?=
 =?us-ascii?Q?0wkmtPBUU3mgLEEn2QW2qC3a01J7JiG2SJxAYRsCEPcZPhI2ERhIavZUdBbN?=
 =?us-ascii?Q?aHjectQ7mcDfKCB8yoYGbKWLED2t6mLAWOgrDC96vECIp5Kc8SDfDdfy+p7V?=
 =?us-ascii?Q?zk3QJTQUJ77sv3mg0P3iQWXNheJHFcK/jS3pJj9mQeO3bf9zXVQYKGvyNMG2?=
 =?us-ascii?Q?MhlNmpUHsd9bpKoI/9KSGnjE6A7YwNqZprKD0anq9C75PYg/dX7ENpUoByr9?=
 =?us-ascii?Q?1B5Ep9qeHtoZBdap53VcGISRJWO0XIkv86733r2DTqfZep++fGB9NwO8C4uE?=
 =?us-ascii?Q?Bb9z1r4hSpUiVETJlNR1o3DfSGFfr28aMwlGcIkn4D1yORDG3y6kJm0iRiRe?=
 =?us-ascii?Q?kW0JMnKD4vgrjuf6sqOMJ0ZMhb4ZiE6455wmO7DxkAZtFoWTzBGKatS3zzvI?=
 =?us-ascii?Q?786HUUixakH59k45H0TGBf2CUDVKxMEtmpZZTZcTyj66b6NJMWWMpMhXRuhp?=
 =?us-ascii?Q?zJSCP/Oa3SLufEbXSZKi44YH28tLSSycPOWE5DVVfgDjeOf1IH/p37CyAFnJ?=
 =?us-ascii?Q?PNgi77n5fEEKJ9GXEFhosVW1WdW8wfmqwhRh7K7YKwdxUKYskl9VRnR4G0RP?=
 =?us-ascii?Q?WhAgFtkWNZpZsWOFL5CxKlmrmciOFZSaOrq872bCK0PxjfPhLXuPnjta27JA?=
 =?us-ascii?Q?yGWaYkaA3RSekgZeXXYI447FW3UwM5EEk5KWp5iIwted0hx5gEuthF9sqdmO?=
 =?us-ascii?Q?7tF8ziWrXAjTcGkHrhFfPQDcUtVjXNXcKWsKKNO85RZKwwFCy/MZTrjNd1dJ?=
 =?us-ascii?Q?LTnyRRyPvH3BKKOy+tqI5pDpwZ6XbENTayAmwEwToSy9HI7iVCb+htB9zIMj?=
 =?us-ascii?Q?a+FHt1m6uIosGZ4VFv+b1ARfFmATYdl8PjklrR/anuXih1pB0HGNY6SQFchf?=
 =?us-ascii?Q?YVGPycSPgqN5iI13Pqb4BWpTuH9SsXx8k+4577rpmL+2F54/4KwpU7f3+g6Y?=
 =?us-ascii?Q?6txNRgGPXTj3ZXSFKQCntuEomK17maJFakweNkfr72ujvKUSoyDzPZFP18AM?=
 =?us-ascii?Q?C2qrWBzqoPro0/GrPnR6n+jW/Ad5bA7eMCj/iTilIota2WR9g/7BC+103Di0?=
 =?us-ascii?Q?pdHvqZsGNLRmbXIRmb3KWATGC4YVp3MPq5jbHstB9peTCfQVqsDO+PK+HExo?=
 =?us-ascii?Q?rmNvE5WE8XQ7DLFN/OLWOGHYHFle7uuMFJLRrEHA8yeqdFefJnP3vQUOep+D?=
 =?us-ascii?Q?y+13rMLnvcrbxoIjwPzhiwZhdPMVc3cJ7F4ATdncWdPykUqrHpGBi0J9wgCF?=
 =?us-ascii?Q?IDBMiLJidCmzseqEoWcsGIl+/KLIpE2uyz3KTwv7ldSYZlCgTm6S4wWthfyu?=
 =?us-ascii?Q?zQvcy1WGL8qM1SFKNBEQWcoMayAoFxYSzYxh9sqdbJkMyEOQi5nfQTA5+UQX?=
 =?us-ascii?Q?gFIqDWSXXEDaWhhoqcVSC4H/2TNKQC+3EKSuVPf0xf3389xhZvIpiG4zYgjS?=
 =?us-ascii?Q?hmmTMH/MkszMLZ7S3dNzIK3DfdjC5yR1Fhwo97kYUEWbKuClTz7EB8LlpYLr?=
x-ms-exchange-antispam-messagedata-1: McwhHpmd0SnbNQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ZbU+Cxj3u+zhGgQCM6j9ysd/8q6VH2h1ncFDpSLF8LK1uVGMr0VuQQKk6Zgi1EWaITCoiWYLOnO/Xogmeq9L44SCBoOE+IPcFtnqxf4Rn4+Zo7cJvYhilyRZQbr2vVDOifv3/oDZ8lnCOq9AV/dxzjjfJBZhCcmPtZRDicFyYsiY0Gsj2WCsJksdZsPYz1iPH0E5Gq+CSHWdbXIVsZX8I7ZMqjz4POX+WnQUUnur63FCZ/GPxwJ+0PNBkPHgRCPVC3M/3COMxdy1Q8qAW7U3pzwme41j8bGyun/uVM7FO/5jR/s0EjE9wwgE84dPz91aUlJ7sQ2FsxKBeg3ywDZ3oA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed06f4ea-2a4b-49c1-8606-08de8467834e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 20:55:25.2587 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IIkvOrksjXYeN7QMlOa/6gCzZoscSThoqV/el3gsd/rV9S2lSfiGazHm9jImko8hCa91tZr5ql5W5KRvM/E4Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6504
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

On Tue, Mar 17, 2026 1:23 PM Jani Nikula wrote:
> On Tue, 17 Mar 2026, "Lin, Shuicheng" <shuicheng.lin@intel.com> wrote:
> > On Tue Mar 17, 2026 5:26 AM Jani Nikula wrote:
> >> On Mon, 16 Mar 2026, Shuicheng Lin <shuicheng.lin@intel.com> wrote:
> >> > Generated by AI and reviewed to confirm the change is correct.
> >> > Split by category to ease review.
> >>
> >> Will you also ask your AI why kernel-doc didn't warn about these in
> >> the regular build?
> >
> > Ha. AI told me that kernel-doc script does not validate whether the nam=
e
> match or not.
> > "
> > Why kernel-doc Misses These
> > 1. Inline member docs are stored as sections, not validated against C
> members. In kdoc_parser.py:1673-1676, when an inline doc like /**
> @format: ... */ is encountered during prototype parsing, it calls
> begin_section() and add_text(). The tag name is recorded but never cross-
> checked against the actual struct member on the next line.
> > 2. check_sections() (kdoc_parser.py:661-674) only checks the other
> direction - it detects when a documented section name isn't in the parame=
ter
> list, flagging "Excess" descriptions. But for nested members (those with =
. in the
> name, line 537), even the "not described" warning is suppressed.
> > 3. Some structs aren't even parsed. For example, xe_oa_buffer uses /**
> @xe_oa_buffer: ... */ instead of /** struct xe_oa_buffer - ... */, so ker=
nel-doc
> doesn't recognize it as a struct doc block at all.
> > "
> > And to fix it:
> > "
> > 3. Enhance scripts/kernel-doc itself
> > The proper fix would be to add validation in kdoc_parser.py that cross-
> checks inline @member tags against the actual C struct member declared on
> the following line(s). Specifically:
> > - In process_proto() around line 1673, after parsing doc_inline_oneline=
, read
> the next non-blank line to extract the actual member name and compare it =
to
> the @tag.
> > - Handle dotted names like @outer.inner by checking the leaf component
> matches.
> > "
>=20
> Maybe take that on, then? We've got build checks to run kernel-doc, it's =
a
> bummer if it doesn't catch the issues.

I can give it a try. My concern is whether it might introduce too many issu=
es for=20
modules that aren't strict about kernel-doc but still have this check enabl=
ed.
Anyway, I can send a fix and see how the community responds.

Shuicheng

>=20
> BR,
> Jani.
>=20
>=20
> >
> > Shuicheng
> >
> >>
> >> BR,
> >> Jani.
> >>
> >>
> >> >
> >> > Shuicheng Lin (4):
> >> >   drm/xe: Fix stale and mismatched kernel-doc member tags in header
> >> >     files
> >> >   drm/xe: Add missing '@' prefix to kernel-doc member tags
> >> >   drm/xe: Fix kernel-doc comment syntax issues in header files
> >> >   drm/xe: Fix type and parameter name mismatches in kernel-doc
> >> >     references
> >> >
> >> >  drivers/gpu/drm/xe/xe_device_types.h      | 6 +++---
> >> >  drivers/gpu/drm/xe/xe_exec_queue_types.h  | 2 +-
> >> > drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h | 1 -
> >> >  drivers/gpu/drm/xe/xe_gt_types.h          | 2 +-
> >> >  drivers/gpu/drm/xe/xe_guc_capture_types.h | 2 +-
> >> >  drivers/gpu/drm/xe/xe_guc_ct_types.h      | 4 ++--
> >> >  drivers/gpu/drm/xe/xe_guc_relay_types.h   | 2 +-
> >> >  drivers/gpu/drm/xe/xe_guc_submit_types.h  | 2 +-
> >> >  drivers/gpu/drm/xe/xe_hw_engine_types.h   | 2 +-
> >> >  drivers/gpu/drm/xe/xe_oa_types.h          | 8 +++++---
> >> >  drivers/gpu/drm/xe/xe_pagefault_types.h   | 4 ++--
> >> >  drivers/gpu/drm/xe/xe_pt_types.h          | 2 +-
> >> >  drivers/gpu/drm/xe/xe_pt_walk.h           | 6 +++---
> >> >  drivers/gpu/drm/xe/xe_vm_types.h          | 2 +-
> >> >  14 files changed, 23 insertions(+), 22 deletions(-)
> >>
> >> --
> >> Jani Nikula, Intel
>=20
> --
> Jani Nikula, Intel
