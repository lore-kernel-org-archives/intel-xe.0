Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F26FED9F8
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 17:35:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EA810E579;
	Tue, 17 Mar 2026 17:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LwPB1fdQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A9E10E579
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 17:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773768952; x=1805304952;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=nCv9J1DjOMnIhiwXxo/JVNscYOuxGdiq2Xb2y7r0yok=;
 b=LwPB1fdQYUaTKlIr03dN9YYwoeVeBndvPqjcd3D6cqv+8QiRCMOco+P2
 Be80H9DrUY0xRyaaGGC4ghvs48Xqn7ldKCV19hM9aGG8M26yI2pGPPyVJ
 4pkCA0PuR1qUwdJRqmuM4J13lzxwV32Jv7yb4RjmbFZ0vW1m6VJ7xus9u
 sRVIroj5xSoh6vrDV4FOrMRH8me+BifMbRQ9fcgOs6oNGt684wXH5hZma
 SvGlPWKLuzfLz+ua1FUeEZK9Bt1h6frKnBAZ2zN8Y0Jo2+nOReV7BSwnb
 NerhZ9iy4JT3nN9EIRGB0AwrBYfbl7aNWDTx74xTumOhblZzAflpSaCbP A==;
X-CSE-ConnectionGUID: ui9b/oaNSCOBvzE2peKfLw==
X-CSE-MsgGUID: yuLQRYW+Rw+7mowIONhwTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74843712"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="74843712"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 10:35:52 -0700
X-CSE-ConnectionGUID: EXauJym+SIKAw7qtrzdLUQ==
X-CSE-MsgGUID: 8+3OgWgzSZqSDmO9huyudA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="218449563"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 10:35:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 10:35:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 17 Mar 2026 10:35:51 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 10:35:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+YsE6HmeYqd9Xh2k049HFfU53DEjagcU2LP5OGX5K70e21ZWaJS7RMODE772AIp3IU5DoH7mpXrJoM4llZvBADoCtO0tsEYTRnleVHoe7XwfwBkiXhhvX/GDMLo83e58jNWbncs9O2vKM54SxyOfaC2Xi1OGB37knuYWlt7fVXt8rr9JGQsW1XpGPvJLbo3v7LZ05yJWsIfCPHKwe058GGHuI9aYzwdobAS5yjkTSjzV4E+7wD/lzUl+fCq44coe1fOzjZUSbxP7EUc0xmLe9ucZsfXkwSl/GG+ZbsBQLfUIgMJZ3RDBGB+dAok76x8kEr8A6buOBhahgYZ/01liA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThF1nnmJDxxOvV9f11s4sSuCSLVQHOlx66u+n0/d6zs=;
 b=VZF1Hixl/tmC95CJVfVTPFkjJTUOnSCE9JhH2q+z4VGM1LC+GyYWF3WqTKiw3APvz1ZkWvJcUdzT229UQ/Oms5YHh89gBzb2GxPdMAmtlSdTEbIuFfgbh2dUmZLp17rBuURpny2K41x9ixwjV2VSie1BEBVAxyIiDg0TYqel097NuzaqZ1HxGJPpLtCCn4SFX3UTytrUZa0vBOd30R3gmUymdD0tLVlV4pV1berEHs9z5F7q7g2Uvp89AhiQJkrcTglfx2YjEc2EyapoKbs3tb26SLpQ9tiTfyhGJytLPHs+oLo/IfRrHFg99rIve4+Fl/7CUgWVCecZNFyWX06ybA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH0PR11MB7587.namprd11.prod.outlook.com (2603:10b6:510:26d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 17:35:47 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 17:35:47 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 0/4] kernel-doc fix for headers
Thread-Topic: [PATCH 0/4] kernel-doc fix for headers
Thread-Index: AQHctW/hrPvBAm/I+UKz1MRuQvtMjbWyp6aAgABSLLA=
Date: Tue, 17 Mar 2026 17:35:47 +0000
Message-ID: <DM4PR11MB54568B292FD55BFB10B342FEEA41A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260316180322.1721237-6-shuicheng.lin@intel.com>
 <afd9abb5636b6de4c84250dac35565b6db526c48@intel.com>
In-Reply-To: <afd9abb5636b6de4c84250dac35565b6db526c48@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH0PR11MB7587:EE_
x-ms-office365-filtering-correlation-id: 642fc592-f417-4441-4ceb-08de844ba008
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 3ep48Q48EQ/GkEmjxlx60S+8jjBr14HrCP++NOjlGXTwPmMtL6OxY+BowVjiDwh7S53+VuoyIM+7F6YmQ3/lam7lB+73ekSxu2W2bZCTR/fG8udC4ADEmxgpoZ1Ztz2KUQ5LuWd3atOcaH6bOd0QROPoNNQlsNuNAdXWMjqbV72K6/vTbhhf+53rN4JjQoYq1ofOVfiTaszMykBebcOqDDVTaj96NvG7IkYPEUXmaEZgGORbWcVe4pRTCN77v30o6UwRiDSNkoiExZMqQjtvFIaUNZ88VHtI3jaC1wEhfATz9+nSk4XQ0yAEtG7uQS6zuV5UW/VJefa5i4AKhAmkAAZbpEcNkM48Af0LNkkfgKCsCqFmXg5UM3pBaFALCPhZZ/K3HYZeOYL62PCpX2mDAe/XX5toBW1Cby+3BXNyJMmiokXUhRlpxdWJ/ldaG0eiLboExRrcEDQfFx0ABpnM9EhR1SnuFedwJE2HzcFw2/6bh/joszTlVQXd/BBdKS3rX1n11LhayzjkXb+gWNSN/6nx5ImuxWTrsDshahwcia2rk11mUcJPjAc9sHc9qvHgOOu8TSw2+N9V7tkRlO2dkTkcDhNB+z6nCrEy6LbbJdFirB4P3Ko1rW5o8ytqW7i00U0UCgqwHinE1t1ufVakpv5UGlUEt87QVZyW3eusglntg928q66dpnDhcTnBpkc54hcg393g5Q7DRyI5LUprxS0mURReTYQ5exR4meAb+XE2dKeEbTyf8Guf2g0g4h3fp57yKxA5kQY9wvNKEE6rj/IPlpDfEwMdZMH0MKzmnEk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TN28+7NnnXzooFkCMy17iYFvCgTuqWuqWVy/M6Q4kpTfDSCa4zV1XRXOKXIj?=
 =?us-ascii?Q?Y3zgUWOxIgySH0lNK0dtQjvxNUsEsGXBKIGTwsoXsq8fOZrCi15f6F7YnSTE?=
 =?us-ascii?Q?7vB0soXhr/hdifkwOf0BKs7HFd3f+H0yWyL+JE4qaaQab5mAwZf7fl9Vzwf1?=
 =?us-ascii?Q?/5zbtBoc7vEtsm3i0pkvYo+GWqsr+cRRiAF7tEXMovDs6osyHxcu9S9bZHu3?=
 =?us-ascii?Q?DeZHjPQWOsRxQQG9XwbG+gmP6D73CFVuOSB4MTRHTo1NmBRyhw0O3Ay5sHQv?=
 =?us-ascii?Q?CmEGOC8mV8JM00X5mMJ9100m0Yjg8bdMfX6kpNhMcAaf/VkU39+VXpSO1YLy?=
 =?us-ascii?Q?ARwvgilDv9ViDD79NN5b4qafQ38pQKK2Oo7yDs7muAgqhfdN2buNdH/eEwNq?=
 =?us-ascii?Q?KLxo8igTFrTR6NWsSOy3laIr+XMbiKicER94mwl9OInVAE/dk2uM5L+eQ1ai?=
 =?us-ascii?Q?R/f//AEqq63t+YOyuKxdDEqMqFtxJxuoOwFL4LjnTMoh0mes4pcu9YV2ast5?=
 =?us-ascii?Q?V/DvZnF6X4PiIZlh7322hc2xSlGgZVTsDzrixkSkEQ7yhOvUQbskO/IkxeuL?=
 =?us-ascii?Q?leMhO9K5fI9KnTDx3tQGLmp7/gmFD2tL8N2XtFZH5LOTPkhNVVUuKlGbDzHf?=
 =?us-ascii?Q?/QEzE5lX/FDzI4fi2gUg0v5V8fktksYbiFOvKgXu/ZOj4JQrayU4wisRa7zu?=
 =?us-ascii?Q?jq2mNqwYi490Q6hkyAzYPBsUlDuh5R/e48Y4hyzwaNP3uZQJ/xgdozBmkrMt?=
 =?us-ascii?Q?BdoDHAKqvtjpufiEXoHe0B8DqzIOA4Uey0+asQgmSKVD8T3WG4rrd7DJ1/RX?=
 =?us-ascii?Q?UWaILTVsLsGA6B/P9uEyBV2JvlHhayUF6CWlLnmzpQU54mms39n+9rlvLbCJ?=
 =?us-ascii?Q?fyCzZfvYGQgP/goqcUsKX2jT0vdX5Or54dh9nIkGGlFLmXh/E8gcmhFwvg4v?=
 =?us-ascii?Q?B1OZZ/mkhFAcyQ1ehng6wY143NfVHtNv5JkM6aqmfeetO810pIvCos1ePhFl?=
 =?us-ascii?Q?XVjdxPsQYHwMoFHCSJg1s+4enwd+euHYtFro0MTyWfjU2aIarex0NkWYDzuc?=
 =?us-ascii?Q?yCK51YK8DBaAcm3zZlROmTM84TtCodyzDux7o35fyuSG86zqMedpmzCtUKv2?=
 =?us-ascii?Q?WtaZqSgU3ASD6tCJHq+TA86FnBOsRSFp+nj1bqoh8WZFyEJ3cbuCZ6mwTNoC?=
 =?us-ascii?Q?eFmM2QmPOpeXbBwUf3J3Yx5jW/2Ng11EJ9UYvU+MaFV0g2xJ9zHVd50VyCwg?=
 =?us-ascii?Q?+MS9P5cy5gfG8lExuX8XKxsTPTUvZHq/Bmb6yBoIzF3HMaErF0xEvk0LxGOh?=
 =?us-ascii?Q?7sSHOmFtXImH9HR9f/4ENr0C/OOkPMA4giCe4c0I4PtW+GEAU2duaoWjX6zN?=
 =?us-ascii?Q?ECWxf4m7t5Gq0iXBN07fB37Fhe0TAsgOmaHiVyOCkGAO81D/D4jcDqXaSl/6?=
 =?us-ascii?Q?IMLVfE0ADfB9aUcP+nbK86cCuawM5uEEQVIUYOAjrStM3fUin5FKIOcw3KIu?=
 =?us-ascii?Q?usEhMpbN8Zd+wQGmMIfIQiRNfpzvIOCWJLFhE4+plweUSNObJ3fkD+TZlD/4?=
 =?us-ascii?Q?oKQec3SVC6R2r4LJIJmZpdbgjjNdI/Gbl/A4fFbJPXxjzTRnpdjtONUa7OSG?=
 =?us-ascii?Q?sHupJ79uf/MdNh7zQRYISWojiYjtrPU7/8RxNTQPwEhRuACjBJyEXDiAw8cI?=
 =?us-ascii?Q?nt727L0VJLfX45CHRyqs+apMYJdaMYGdJGUggP26pHmMZVTptzuC2uhCvJht?=
 =?us-ascii?Q?X24ERWS0zQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jDRRq/KHFE5PttjJj4yxbaqnw4MRwsBDZ/WJ3XVqwVcp6qdAfOpl596l8WgSIIBGNKm8twhXLMkF5puMVf+Ls9ATQv+IfO3+kwcF5bJ35dCv7OT7KVxkgax05mPspYAjELy1vni1+zC3Wc8i4DuPbts4HdKUYfBsv0IdPits+z2mJDzmhZIgmYvSq/Afst766kLMIk+VDoV5xfQfdDvXkF3zc+rqMbNDpszWW8W0w3HzuxTvuxX2CKoRZVHY3yZoZgNoigQIliZ/2vTrbD7ay/VziERtqBt3HY6+1bXGg8/zZt7TAfWPqiy9SWYFVdeaQrwC1xvNPZEoVwNry97f3Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 642fc592-f417-4441-4ceb-08de844ba008
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 17:35:47.5429 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B9dvzUZ3/UFYpM5GivhLZHlCDUPgmesXHMJDYds8QEg5Wi8LCXLksFoyAaiYB8p2EQBfMRdnXGtJ9WhtO0FcoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7587
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

On Tue Mar 17, 2026 5:26 AM Jani Nikula wrote:
> On Mon, 16 Mar 2026, Shuicheng Lin <shuicheng.lin@intel.com> wrote:
> > Generated by AI and reviewed to confirm the change is correct.
> > Split by category to ease review.
>=20
> Will you also ask your AI why kernel-doc didn't warn about these in the r=
egular
> build?

Ha. AI told me that kernel-doc script does not validate whether the name ma=
tch or not.
"
Why kernel-doc Misses These
1. Inline member docs are stored as sections, not validated against C membe=
rs. In kdoc_parser.py:1673-1676, when an inline doc like /** @format: ... *=
/ is encountered during prototype parsing, it calls begin_section() and add=
_text(). The tag name is recorded but never cross-checked against the actua=
l struct member on the next line.
2. check_sections() (kdoc_parser.py:661-674) only checks the other directio=
n - it detects when a documented section name isn't in the parameter list, =
flagging "Excess" descriptions. But for nested members (those with . in the=
 name, line 537), even the "not described" warning is suppressed.
3. Some structs aren't even parsed. For example, xe_oa_buffer uses /** @xe_=
oa_buffer: ... */ instead of /** struct xe_oa_buffer - ... */, so kernel-do=
c doesn't recognize it as a struct doc block at all.
"
And to fix it:
"
3. Enhance scripts/kernel-doc itself
The proper fix would be to add validation in kdoc_parser.py that cross-chec=
ks inline @member tags against the actual C struct member declared on the f=
ollowing line(s). Specifically:
- In process_proto() around line 1673, after parsing doc_inline_oneline, re=
ad the next non-blank line to extract the actual member name and compare it=
 to the @tag.
- Handle dotted names like @outer.inner by checking the leaf component matc=
hes.
"

Shuicheng

>=20
> BR,
> Jani.
>=20
>=20
> >
> > Shuicheng Lin (4):
> >   drm/xe: Fix stale and mismatched kernel-doc member tags in header
> >     files
> >   drm/xe: Add missing '@' prefix to kernel-doc member tags
> >   drm/xe: Fix kernel-doc comment syntax issues in header files
> >   drm/xe: Fix type and parameter name mismatches in kernel-doc
> >     references
> >
> >  drivers/gpu/drm/xe/xe_device_types.h      | 6 +++---
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h  | 2 +-
> > drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h | 1 -
> >  drivers/gpu/drm/xe/xe_gt_types.h          | 2 +-
> >  drivers/gpu/drm/xe/xe_guc_capture_types.h | 2 +-
> >  drivers/gpu/drm/xe/xe_guc_ct_types.h      | 4 ++--
> >  drivers/gpu/drm/xe/xe_guc_relay_types.h   | 2 +-
> >  drivers/gpu/drm/xe/xe_guc_submit_types.h  | 2 +-
> >  drivers/gpu/drm/xe/xe_hw_engine_types.h   | 2 +-
> >  drivers/gpu/drm/xe/xe_oa_types.h          | 8 +++++---
> >  drivers/gpu/drm/xe/xe_pagefault_types.h   | 4 ++--
> >  drivers/gpu/drm/xe/xe_pt_types.h          | 2 +-
> >  drivers/gpu/drm/xe/xe_pt_walk.h           | 6 +++---
> >  drivers/gpu/drm/xe/xe_vm_types.h          | 2 +-
> >  14 files changed, 23 insertions(+), 22 deletions(-)
>=20
> --
> Jani Nikula, Intel
