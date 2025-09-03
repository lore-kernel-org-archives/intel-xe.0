Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED16CA100B
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 06:04:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E4F10E002;
	Wed,  3 Sep 2025 06:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="esgIdyKd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B9910E002
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 06:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756879446; x=1788415446;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=97qAKaEviXP23cBempPIC54ioWjIiYO2+65H/hAAVKU=;
 b=esgIdyKdglLOnE8hzibB/yRBl2F6yaDcxE/Q+wdnjh+bsftGclCZREtQ
 bIGTC+IKdinnjCO5UHUS9kjqdWDF/SK1YA5f29T2KCfQp5buGGC6p+hq7
 EQAw5S4CzxLhcBTGvqbPCPLrpcFql8OcJEQ4qN75dxcO1P4p0hPJvGoSB
 glie4KWWSQZtGFWjqUaZeqWExs8paVDxnvJsuRyzJrIbP//ygzIFnxI4B
 QwZtx6thgFpr2JSEI3I7HA0bMHJRfSg4gtTbBXjBD/H184dnVeuDiceTf
 6gicHtsU5mFEbHeX8qTIs6KYrveOlXmyCBKsang34d3w8kBs2Xp91HBmL g==;
X-CSE-ConnectionGUID: VJRQFuhgTnyNg2FPmberWA==
X-CSE-MsgGUID: VD7XPrk+Qb+YEFximhgpqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59249966"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59249966"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 23:04:05 -0700
X-CSE-ConnectionGUID: umvyHUcmQiSxBI4GTGGCtA==
X-CSE-MsgGUID: /aZBRYp8Sl+piojU5qULjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="172312070"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 23:04:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 23:04:04 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 23:04:04 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.46)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 23:04:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EEywqJ6lBp8FuyQHFjHfkx/IXqm239qQgWSG1mfu++JQ0EZ1YE4fKDywRt/lrlGR9NIquCDlHkDV1OscWMVOCINekl5pcHXa1xljLdDzPKDuEUlOtKG54xsbXoTrMeyiN2Zb1Sh0d+ot4neZw5DzhDOygHcjJ0E33VpAakWr0VkLdRD6qt00Wx3nuxOUcH+oRJAQD1cVa9Z5YA6B0NRyBB7K1PQUYZpmdWABR63AuKWDwu5mwep9QpI8y9/+D6+reKWAVFB0y/5f0oHqgGQ4vsqCe2hvTQvdTEt+ZnUbZiNyUg6po55Sou5iq5e+49vQHD8r02JhQA+uLtc+NlvyrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97qAKaEviXP23cBempPIC54ioWjIiYO2+65H/hAAVKU=;
 b=ZPq1vjaBZPsZDca2FzY9jleHt6GJHQOVfMuVvLB8fVy4Mg7jOGAs1rWKGSfnodeqc+4ZB/4R0aVFoJt01nTmmgndQ2mTPjadRVFziN+IrC8jhz+sRa11uyLu/7Z40l2rk1movcVQRC6TVrg+o1mWaTaDmUsdwW+Au1WNRkDXlidN/RihDelszUOCBADavLxYqp3YoMKMKuw+5luI8CWQjMRzOKQPvVXSJ2jlv7OVuEVke80/Xrn+VA+fPPIeNZfiQC5PcOJznUN9+4/95dFkiFe2HxN/TsgvY8GGUjPYe3CRSoQWMKZEjrpqRWPf9i9XutiomnLvrV2J/YSgldg8Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by SJ0PR11MB6743.namprd11.prod.outlook.com (2603:10b6:a03:47c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 06:03:55 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%5]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 06:03:55 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: RE: [PATCH v2] drm/xe: GPU frequency tracing support
Thread-Topic: [PATCH v2] drm/xe: GPU frequency tracing support
Thread-Index: AQHcCps9baOmbuZy6EuoVSX3g0B3UbRd9H6AgA0C5jCABEJvgIAR30ig
Date: Wed, 3 Sep 2025 06:03:55 +0000
Message-ID: <CH0PR11MB54276B85FB6B33E69FC066DA9801A@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20250811083414.3863103-1-s.sebinraj@intel.com>
 <i6iszloxcdb2olq5hspkzjefimracmqoawpu7t5gwlehgnyudv@usbccibofr7v>
 <CH0PR11MB5427BE3DA4B3078A7514BCB79833A@CH0PR11MB5427.namprd11.prod.outlook.com>
 <87wm6vxedi.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87wm6vxedi.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|SJ0PR11MB6743:EE_
x-ms-office365-filtering-correlation-id: 5697f359-52e6-4d91-7ff1-08ddeaafaa23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?kkKPnrE4dYztgEjtDlZvIhSp071QJ6pgkNXtfVlN1GG6ipv2DBmUxVkG6cCc?=
 =?us-ascii?Q?M982kilXnXGli9SYZm5zEEkpzBixmNRsJrQyNkYFCuzDv6WjLvciHPSqRaV0?=
 =?us-ascii?Q?xovvd3H9J/XX3/pZH43ekQd6WuWu5FkzB3yODBA6VxdxWBNXruflAaUvxAyi?=
 =?us-ascii?Q?dhuVMVTDAYZn62+jsBbjjBoz9vWDGFDmQEe2dfJOpk1EJBwBaTI2rsz4sB8I?=
 =?us-ascii?Q?BIOB/p6NQTngtxETS7q186dTlct8Pvq+A2yqQHyaBDlwCu3eg/IOI3Fv7sdz?=
 =?us-ascii?Q?0nr7GEyFc0ej8HNO/5lc8I9gaEy74ceA47n2jSe0F5l65lz6vDIuO8nOdRLD?=
 =?us-ascii?Q?n+y3FJaKAd1b/q4EH4uupGoEFYLyDqyYXx/rD1VQnmmMkJgofCIw2ADzi6nE?=
 =?us-ascii?Q?4jxrJF1F5XW9FJYLy6mizOiiCzuJmDCsgcSfKSFMzNbvpbTYT4qL5CRNOWpr?=
 =?us-ascii?Q?q/yI4IPLnSU2bn57S5eyh+BoTek6xTYvgFu5ZKNi+ZC4TlGlGaPO5HfQoMOL?=
 =?us-ascii?Q?Qm2eZ3vA1hIjgWJ53X2E8gjP60ACwPwBR9Y4uCoXX5uKJtK14wO2sko82tTI?=
 =?us-ascii?Q?3rroFERyLqvx3q2sMrhq9kQOKTuMY0HSbd15uKDRYo2Kzh+DM9Daa5oO9ct5?=
 =?us-ascii?Q?jewfYcTRAVnVibJ8Zm8QlXKEPGPNbtl5P0IMZm29yCg0hXuKTq0n/U9+Cuv9?=
 =?us-ascii?Q?oFszwnnfQxsHHtub5tjgEYJc22QPGDZPGteCkiikZMCO38wRJ8ntLAX8q4sY?=
 =?us-ascii?Q?7aB9CQbJ9Vs1MVrXopSFSiYZAJwHlmShOhg4f0sRZsL1TwbAJc+9Pb+7R5v5?=
 =?us-ascii?Q?8q5zitWkP9MqVuFycogXLbnSI1aLL6WUOTGKTCjNgcSifoDzGzd3ggZGJhq5?=
 =?us-ascii?Q?R33pZ2EU1N2liOuLVBQ+IueIyLJe56Zrt00bZaaA3QawR0FmvtFku5Vi3CGM?=
 =?us-ascii?Q?SWnvuky+teiMuIdiHR/9mlMTVUMc9648Kqd+k6nDhAINTx0fiRogxvuas6fX?=
 =?us-ascii?Q?srlxAYbAqtqTqd5VSQHs6+CERMlnG9IvucJ5GYLIlvNVQ6A+cE5Y+YyaK2Hx?=
 =?us-ascii?Q?bYVMybdAaHQVNXDFbsOnBchelYQhT+14HN05Bq6hqQaLiPunEcvPFpiKFVml?=
 =?us-ascii?Q?53xNh2TMbRTncdNP+TJvD1O/wJxfiG+bDrwEZLkYSewOgmqLtAyLX8mRn0OO?=
 =?us-ascii?Q?WaiI7R4jPZr+v4azMOrloTOmwPXW8XJ+t79M93TyGtPdCjvRTu5OA5n685ND?=
 =?us-ascii?Q?MM1r9pn6jIBHBb0FWnnA+x7NqjIm3+p1Ky3ohGDp8Z6aEbzgjlQSn2o12Ztk?=
 =?us-ascii?Q?eVK0V+d7r4DNyvGGnxbX5mGAjExI5+usfkLDBMj+n1KPNJkRiXwcTlPbPzMg?=
 =?us-ascii?Q?+Qve71+Z0WXaxMGSKO07wz8yhnCx3l6wjCOke9v6rH/Lvp+saPXmWhdVmF/2?=
 =?us-ascii?Q?nSCUCkU0OBcZc4PylehfwhQGXlJon/NUowQBoJoxDzxP+R065I+o/qjxp5Tw?=
 =?us-ascii?Q?5fa2tiFcyOVBysg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?N4K1RzghxolDHbQ5/wmzYSaLTgmOcAcGba6/mTYRYFPbiOTGNGeOTfiSxMVd?=
 =?us-ascii?Q?9RxhTFNvOR5Wbvsb3TtQSz2YXjHrsnxdARjcw3jSpl/PqNoIq97H2WllNBdD?=
 =?us-ascii?Q?S/bedroHtS5wiDkfP5rVuyNGguOyxjeK3LxIibf6rgmWLHvKgBiLdK4mFqz0?=
 =?us-ascii?Q?NR4pJrnN4gPk07AqoyDxy+l+6H5MVS2fHKmw4POhxOFLkeD0rDvN8JsklIeS?=
 =?us-ascii?Q?+Qeo/ZmYmRBL77MPB6Z7fYq5haIHq6gWBKi80l5e1LlWKs8FdT2ibIQCDNoU?=
 =?us-ascii?Q?3XKnpuA2B0OwQ/UNs3J1XnKmVWbiKWYxeyYSJSzAlqLRiu+bQLfVxX5FuJ4J?=
 =?us-ascii?Q?HrrWtV9MG0MB/VVv8vjN3yjvdcx3d6K4ZSQVyK6oRPgfH3/Hl3gMwjAf83JO?=
 =?us-ascii?Q?/TbAlW1tceKqegoMAQwbdQ3Yg8xoCzVhz2Xb9MV2McRUaU+JLL6oQD1c7X54?=
 =?us-ascii?Q?7+Qsrgi1FTXeSLrIZHcttlPwDZj1NA/urd39HEYKIyQmqbtUgB1Z8EZvMlWB?=
 =?us-ascii?Q?CcNClGsZZSsVy9x2giQdlo3ijY06civgcQVFkzf6FMR5kKs0fGJ97b+xa8xX?=
 =?us-ascii?Q?kosVtzR2WHbbwhGiOPX0SFqmmDgRRbiUBrH2L8XQHuEKVkZWaiBm77FVC//F?=
 =?us-ascii?Q?BT2afIcnJC3LFMalFChxtLf4HR2pcZVtz42RhMNW9P7CQ9+A4QhOzSDM+pOQ?=
 =?us-ascii?Q?kvEVxJwQxElPEtxgLumkZ7O1FLwOKy/6vAI3yrHGYUapfDWreucR3FlUGRoQ?=
 =?us-ascii?Q?kkMLoYchngxBXeuCAalyNgxzjFKzHMSn4iVggSmvpDY0W7izJ9L1n/v7lMZK?=
 =?us-ascii?Q?4bTPSUMVLe/MdWQDWh2DKMHd+V61f1ccMrjLgRxANGAS0OqVhV/QcyFAaFwJ?=
 =?us-ascii?Q?oYaWphkMrU033MYHayH5mUZYvoyZBghJTt9HLNnMKZFO9PIbKmtKePSqdqvB?=
 =?us-ascii?Q?Hh6zbgD3ugHxTENALmyQHr2t/fLZQblpPnAVr5Rh9BfwZ+9P7l99s/7tth5o?=
 =?us-ascii?Q?Zx0fnpNTsaizs9fraNyIJoq6nO9OgTMbXoz0IR+PYSFGUZfvtn1op+gskmwF?=
 =?us-ascii?Q?7I9jyKZKUtW5t5RpKN2W8+F1+b8waYvrosA/S1r7VNM5L7c0/ht/7TWx1Uw0?=
 =?us-ascii?Q?BhmTlV9gDfkwSy32OQM0GL2IObRzkrMRMDCFQ8Hrui9bVEePZ4rxgB5adVDy?=
 =?us-ascii?Q?vh9d26iCpaFnksU/VzvsM9Bl3cnhies3AeRwxNylKqOOzv0I6fu4U+0yZJHR?=
 =?us-ascii?Q?K33Jt5d+umnMMzUvDBgfKsKOo9ETpbQs9XcMVKsMkv0EjADHeeiHuLES2oC7?=
 =?us-ascii?Q?qOkNYEX7TAv8Cb+etP4xucfHQsyTv6+XINr8idi/k8I5JItqz/4Odxm8548h?=
 =?us-ascii?Q?x4bu4aXMI90zGTI71GRyaCCvWo7SjUFv8By4kz7E9QMEf7IP3W31L5JTZZXk?=
 =?us-ascii?Q?KSFaCdpSZeS6MkhyfADiEEjTeI0LWGq9/p4d8tCFLcWESsqqnfJA+PKgH/Ji?=
 =?us-ascii?Q?2wSa1hbx7wqpXGOHBVaIacOvDlRPsF5pqPYi6aYTGAee4BmzPembKBRaxW+t?=
 =?us-ascii?Q?clt7sFTlMWTgrhhNJ9rGPCSAQ/yG8UrFsg4jOhy3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5697f359-52e6-4d91-7ff1-08ddeaafaa23
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 06:03:55.0977 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zzjek/UXuzdykA9yZIlGXpP3YBvEu2A66gVuMY+xUclbxnTK4nFyBUzgS+RL3g7CLfC+w7c9/vuCPTWqmvAWeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6743
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

On Tue, 19 Aug 2025 21:25:43 -0700, Sebinraj, S wrote:
>
> We went for this addition rather than the one in xe_pmu (via perf stat=20
> - user space tool), as we have a requirement to have the trace point avai=
lable at d/evens/power/gpu_frequency for Android xTS.
> In this case the user won't be triggering the perf subsystem for gpu freq=
uency for gt0, gt1.. even if we add the trace points in xe_pmu.

> Why not? Which userspace tool is consuming this ftrace and they can't ena=
ble the PMU event?

> The way the ftrace event is implemented here, it really doesn't provide a=
ny more information than what is provided by the PMU. IMO, a ftrace might b=
e more acceptable if the> > freq change event emanated from GuC itself wher=
e the freq change is actually implemented. That would need a change to GuC =
FW, so maybe not an option at present.

> Also, similar to Rodrigo's comment on the work period series, if we need =
d/events/power/gpu_frequency (rather than d/events/power/xe_gpu_frequency),=
 that should be
>added at the drm level rather than at xe level? Would that be acceptable?

> Thanks.
> --
> Ashutosh

Okay got it, I'll try and come up with a solution where its more generic an=
d at drm-level.=20

Also, if we are to use a userspace tool which enables this PMU event, which=
 comes to down to perf subsystem of xe (here xe_pmu). Then I guess using a =
trace(defined at drm-level) for the "act_freq" at xe_pmu would be acceptabl=
e ?=20

I'll bring those changes up in the next revision for review.

S Sebinraj
