Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED7BC88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 09:20:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C06510EAB5;
	Wed, 16 Sep 2026 09:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="crgtYB5b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A32610EAB5;
 Wed, 16 Sep 2026 09:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789550418; x=1821086418;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x+iOsqIKSrkFzmSsWQeXM7hmbLueoddHTjdOHu2MPm4=;
 b=crgtYB5bbX2Y0w93JtikklyGs0YRXsVK4q6XOZMTbio7uGa2dtpY/3n0
 YNAXxyIm21buQDf0XaTuUqbSf2YTA6pN8xjQBfOOd+4cA/HNQuXja0hsu
 7NoLFpU0c9G57xJNCVCC4nn1cvY9OqAkVGd21rgtVd7v1HTv6cS5+sglb
 wUbUAin+VmHzmCHF4Yot44xRCsWbPGFTn+TOH4TAACW5zB15hE+hHYO3t
 gK4qcwHyK/rQADNpw8CqkHDCKuEoYl3Ee/YSZuPn4IpckABQMvJ0WgldL
 cZ7rr5wn5Gv/MSzSNzeUBHDuQiB+W4CTwD/rZwX7icshe/yyWx8NfsakT g==;
X-CSE-ConnectionGUID: 6rtbkfcTQ+WmUVdlyjg5xg==
X-CSE-MsgGUID: 9+qdGbQQRTapwJVJeFVjJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77484400"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="77484400"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 02:20:18 -0700
X-CSE-ConnectionGUID: bl/2XG9SSj2l7ACD39/Inw==
X-CSE-MsgGUID: e7zwrr8CQS+jj9B1ZzkEJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="311555090"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 02:20:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 02:20:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 02:20:16 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.66) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 02:20:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpS8rihHsagt6qc19HN7Rd/pE7kejf7Ixpx2pF1yEAGrwkKBy0WoRKKBwH8S0MSh6GWbtnkjCwIqAq3bF5lSHyilCH6aqr9D7Iweub8nYK2eMwrpWYpbnS1L0fryVs4yt015XSk0aeHSf5/0yR8MUVtxdsP/7laj+1aqCKeVb2xV7ruKX87HqK4X45JUz9Ohyov+r/U2tn2hSb/Fvhc7nLk56gJfy++rL/HdkvF1WQEi7nx7RNKDnClubBgNGdQJ4KUikfKwtzJk2Bl6r7wrOixslLwRY/Hq84l9nW49YjWZMl361xEzcLFThepghufjhv6F/pQ9dAEVmQGUavku5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxY/Wv/Sm4F7m5+47JKuHvtaCiA0B8FI62WmIPgvXF4=;
 b=fe9nbYgW8m0eLFKtnRnAA/i6a8Akl0m0F+Z24YYSCXVavA261LlHDXpSzNV5I3yQk3vFKPDXExEFLYApwB4LZbNy5ng7xmtAD0SMqGDDPKtdGv8akEPSoLlmgFF+XLX7uak1BTOe7vJpc4kWBK2UyiW8vOXhmbMg7u3MCmLsIqR46VFZZ6u2Mk8Byr6wHtSgDZXd++57ZvYEUSSGzDp2Dq7ALmfkMxf5cxTNjrA6sdrjGvBYCro0KVLNPo4anR/2RRDjUY/zOWm84UmNp23PYaH8+AdxHj50QO12VrJ7lLbwuCHhQM1Mhn9BIuTonNuuqXe8aYvkIa3WfP/EUyllrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by DS0PPF0A1E7F360.namprd11.prod.outlook.com (2603:10b6:f:fc02::504)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 09:20:09 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31%7]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 09:20:09 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v2] drm/i915/display: Add command line param for DC balance
Thread-Topic: [PATCH v2] drm/i915/display: Add command line param for DC
 balance
Thread-Index: AQHdRMgs1BklRkQ020evG4b45+xHN7bQz8YAgAAfooA=
Date: Wed, 16 Sep 2026 09:20:09 +0000
Message-ID: <IA1PR11MB63487EF9C59CDB94B9CD19BFB2B92@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20260915040015.2451786-1-mitulkumar.ajitkumar.golani@intel.com>
 <cc91cacab48c7134647a12da0bfb8c3832e2fc5b@intel.com>
In-Reply-To: <cc91cacab48c7134647a12da0bfb8c3832e2fc5b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|DS0PPF0A1E7F360:EE_
x-ms-office365-filtering-correlation-id: dcbe7c5d-b119-4e73-43fb-08df13d3b490
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10067099003|6133799003|3023799007|22082099003|18002099003|5023799004|56012099006|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info: dY7pH9Zhnre0GsaNs7c+QZ7QYBD4CETz83wXeR5TWpmCz58D1AYyo3Iwu946PhgfNsnPlDiK2AllpMDKvay5paj8hswTvsSS0FToiRCK2idFTZRQsZWWhc1qW/kWdr6ygAMLt3uusGF3Zfmtz/QpJ9eqJVQ3Nc97T4PNmRuC0NS4jPNDCYPx8AZuyP+nmq4f/LXXAf5qkw7ujONKIv+S5zKhBApjK757eKIzNXeMOSZ8fsD/rWLa5sIzzP/378fJoHX+oI+iVndjFxTQ9+zLnSgGiMuzqV/ersTRIz9UfRQaucWXSNWcnj34BkxqdTwb/E4POwAb8f5RXdxABxWAh9S+sZIk8vPl28NRmiMf9DaUbMSfMeDoUsUJU8ryY6XHuAjrgdWeQUw8DH9Ubdzi+Jcoe64wANNmIvvFU50xXj/bCBPeNZJPlTlpw1cggDJX157g4Uqg0VnOWYX/sZlzvklGjyWiQqsGCmT9Q8ofOCjcvM38gSJJyiWE74CVR1uZDfNrr2w+Yl7kHtlBa+dvfQJ19mucTnO0Whocdi6FzH7BjO59RTbzLbrPZ5tXmjBptV9eoL6MbP3Sz1jZlxPkFzvNyK531T3G+cLYyG5G1AqDBAMc0PxqHcRhGjkiLDdfF+yfFnHNkTvsVrnYJVKy62DSmbN2W0Sabe0hmYe3vdpfhbCQz5GwesPqntxSp56t2HTsb2n720512MlZgiWdJZTtCLbs3SeOcm0SG/KF1i0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(5023799004)(56012099006)(4143699003)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BZzOHFv3sZIYbSkCxPruWeckurl9wjN+wV7Q8oRVSmm8eSLZBvdX+CUZqkqk?=
 =?us-ascii?Q?0m/8IzTAQ3uOQ0VaHqu0H9EAP3Sm09dn+IGXe+IkG1ZdNCCuqPsUaEXK6Gpw?=
 =?us-ascii?Q?dT6KzxnGoV9quDf2h8xRSzjKUOIUvf9uimAD6HoEqiW/QvoSsh8L61jUANOo?=
 =?us-ascii?Q?WT0THA6uPWw9iTwe11RaHFND7jJsw6TM+sXbrAxtmkTtnuwH7I4+R6Fnz9LF?=
 =?us-ascii?Q?vEjyCTVUebzR82Yz1RjPDc1G8yhaMwc/ZCBM2qc/oawa+qPkfivMjfmeKpuV?=
 =?us-ascii?Q?JlpMZLSdpxflqtjry702I9XoQO+AtH7BRa9NqHp2tFBqLX4xoFYqx0Rvq/zs?=
 =?us-ascii?Q?txWuWZPjuJPyfhbB7YgmvMnqsizYZc8HXA61i1ROanwcrEJGN7536gVyH7jd?=
 =?us-ascii?Q?37aacT4Q6c61hsDn2KKz4Kzgxfbf3Fa014Mxwu9TcR0cFMqQAiS8yVvjVjgm?=
 =?us-ascii?Q?5VC2Lbts1r+CkMK2pFMJ5m4ljG07BUOKC1uar2A/mcVPkQ7uxbMnRyyWJFPc?=
 =?us-ascii?Q?D6q7SN95Eck5hXCs0WSlRsW/a2fJv2Phf8+jjh+pSOil33qjYWea2Zz+Gd6P?=
 =?us-ascii?Q?NMtykQ7ps6y59uLtGEiF7Rh/uqk1q+IkX4HfTZ3rxYOxH0Ih63HCQlUaZRHW?=
 =?us-ascii?Q?zVFIDJhFIHuXUONTCMD9Seq3Qyh/uNgw9JLyIv/76aFWB8iDqgDJ2HjyhRJv?=
 =?us-ascii?Q?f9uqV/hFPbdgiuWo+yRGWbgR9ZMNpO1cCO7dK5Y+KluYnSL+YfZ+srIRpU/E?=
 =?us-ascii?Q?9qtA3AGt9DBpVzHptCPhL9J7oWzHTcBTUL2/wBXa1cFf7GwafQDcuxKYYQei?=
 =?us-ascii?Q?Sr5rlsdjrNuQid6v16ucDQXlAcxlIvodrhXZkrmXMFZES+cHoWP/1ohxctLM?=
 =?us-ascii?Q?O6I62zy8+4N0XaiY/iYvhNqC+6aryr/dCAGJU4NUaaqvPb9xCnp0Mg73mQtJ?=
 =?us-ascii?Q?L0uA5hDCFs8cdye8cB2VqFIfB8xKdflPbDHuUXK6Foy4XfzkmG0cf5P0QSbo?=
 =?us-ascii?Q?YoNGdL27VtA2rAgV8QmOSoFcl092/zHL3k/siLPdnzl7FlgkohcqgBMhxofG?=
 =?us-ascii?Q?pqxSPL4SeDUmvVeKROhxJcqERSnDosArlScoVO5cKeuyybG1k3qJM7cecXqF?=
 =?us-ascii?Q?QLIsW/J/iicA2SpYZJvs8BFBthzKW3wjSVtlzIreOvID0oGLlxyRfIEGi12p?=
 =?us-ascii?Q?OrN37NwkWoFkkRvjSBk4kcdVkpSu+NbC3CSEdbsVlC28e9NCbUzrFLKR6eNU?=
 =?us-ascii?Q?pRRA7nHDwvIkcHCu2GCbx27YoO6rHMUDrt7PkL3wrIrACLJ/yS4up4lTIY1E?=
 =?us-ascii?Q?CpcJG+Fk4oglfFnrN8w3tuCV8H1/XYOdc9bc9Tg5e1mSxcE50Ndo4xG6/e3Z?=
 =?us-ascii?Q?qi04DRZXBW8NEruK/+vMSUt97HAJfpzZOHfrD9ipmYg8zilyit+keR5OdKPt?=
 =?us-ascii?Q?tNEEEKa0KaJ39kMDqbWzj8iEBOAgEa16+2hOi6kftfRPN4IVO/1Dgv1oweJc?=
 =?us-ascii?Q?eEztl6bwZDh1lNC6Ki15X/aPdIj31oJEIF+3RlUvsZK7tq7yAw3gTa5eIEuy?=
 =?us-ascii?Q?YzArKv5R6I5T1CBVKVMEBdA6bGf/tASfFSPd9BbCycQqA+UBiFcSDkovt0Ry?=
 =?us-ascii?Q?Xy7j/qMLCFplW9VqDasjWDpYR+mAuTDcwJexcgPaXVMdtgADmscRRcTgCvub?=
 =?us-ascii?Q?kT36fjotahQ0EAcptW4Fn7f1zymrY1U3QxavnvtyUiRmSk8PaSOR9PsI6HcR?=
 =?us-ascii?Q?KIVk+MpTiOoUFulz4r3Bpwlr/P2AXkV5Bbkj+bxjw3uSOn2cubTi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ylHXgbxDrWbevts3NiV2SXFbAhKM6BkKIFJYDf3kkRfj+Iweu1+oSGgixC5odFbdWLneMxxEPKoj05iL3w63I0gArKHzWXEW/O5mOTcyz7hJmrkeVPUgi8kQZos0cZKnl+uOMGkCONNPY0TiqCjTg6O0Y3VlNkSUaymUekLb+xFOFFrSHixRGNSVk4RLAE+9GmoADpeNjuqqP+5wglE/X1aQimsENKVU2+MhIf6Nq8vrZgR6a9G8KkqO8iRgbCGYdnnMFGleU8YgeCw1BeWZZPz4dKoYMKb+6SjSz/hjBsHjhOgNxuCGDdkXzIejJ3DLSp3EgmbmbXXAd0Ym0I32yQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcbe7c5d-b119-4e73-43fb-08df13d3b490
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 09:20:09.7970 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n/224Eq9qxCDm+weXs0CYefgSfMD75CktCcKUisdkC/ZtZtaaxPJ3pJwv7RlCI21XeYAL1aQ6JlJoAc/uLlqsl4eY6pKY+rcX0i9C4HwnG0ePU+zy7G3GeSq5hBbm3eZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PPF0A1E7F360
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
> Sent: 16 September 2026 12:56
> To: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> intel-gfx@lists.freedesktop.org
> Cc: intel-xe@lists.freedesktop.org; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>
> Subject: Re: [PATCH v2] drm/i915/display: Add command line param for DC
> balance
>=20
> On Tue, 15 Sep 2026, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> wrote:
> > Add an 'enable_dc_balance' display module parameter, disabled by
> > default, so the feature can be explicitly opted in at driver
> > initialization on configurations where it is known to be beneficial,
> > while preserving existing behaviour everywhere else.
> > intel_vrr_dc_balance_compute_config() honours the parameter, so no
> > recompilation is needed to try the feature.
>=20
> How does this preserve existing behaviour? This disables DC balance by
> default. Why?
>=20
> What are you trying to do? What is the goal?
>=20
> We shouldn't be adding module parameters to begin with, and the *only*
> reason for adding them is *debugging* only. Nothing else.
>=20
> "feature can be explicitly opted in" is *not* what we use module paramete=
rs
> for at all.
>=20
>=20
> BR,
> Jani.


Hello Jani,
=20
The intent is debugging and diagnosis rather than providing a feature opt-i=
n.
=20
We are currently seeing timing-related issues with DC balance on some panel=
/TCON
combinations and are working with the DMC firmware team on the underlying f=
ix.
We are also identifying affected TCONs for appropriate quirks.
=20
Keeping DC balance disabled by default allows us to preserve the existing V=
RR behavior
while using the parameter to enable/disable DC balance during debugging and=
 isolate issues
caused by the algorithm versus the underlying VRR/display behavior.
=20
I will also update commit message accordingly
=20
Thanks,
Mitul

>=20
>=20
> >
> > --v2:
> > - Make enable_dc_balance a bool and keep it disabled by default; fix th=
e
> >   parameter type/value mismatch and correct the description (Chaitanya
> >   Kumar Borah, Jani Nikula)
> > - Explain in the commit message why the feature is gated and why a
> >   module parameter is used (Jani Nikula)
> >
> > Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display_params.c | 4 ++++
> > drivers/gpu/drm/i915/display/intel_display_params.h | 1 +
> >  drivers/gpu/drm/i915/display/intel_vrr.c            | 4 +++-
> >  3 files changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c
> > b/drivers/gpu/drm/i915/display/intel_display_params.c
> > index 2aed110c5b090..ca0ef466bb103 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_params.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_params.c
> > @@ -120,6 +120,10 @@ intel_display_param_named_unsafe(enable_psr,
> int, 0400,
> >  	"(0=3Ddisabled, 1=3Denable up to PSR1, 2=3Denable up to PSR2) "
> >  	"Default: -1 (use per-chip default)");
> >
> > +intel_display_param_named_unsafe(enable_dc_balance, bool, 0400,
> > +	"Enable VRR DC balance (0=3Ddisabled, 1=3Denabled). "
> > +	"Default: 0 (disabled)");
> > +
> >  intel_display_param_named_unsafe(enable_panel_replay, int, 0400,
> >  	"Enable Panel Replay (0=3Ddisabled, 1=3Denabled). Default: -1 (use
> > per-chip default)");
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h
> > b/drivers/gpu/drm/i915/display/intel_display_params.h
> > index ba01aeaf89440..5c5a1a1358c32 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_params.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_params.h
> > @@ -46,6 +46,7 @@ struct drm_printer;
> >  	param(bool, enable_dp_mst, true, 0600) \
> >  	param(int, enable_fbc, -1, 0600) \
> >  	param(int, enable_psr, -1, 0600) \
> > +	param(bool, enable_dc_balance, false, 0600) \
> >  	param(int, enable_panel_replay, -1, 0600) \
> >  	param(bool, psr_safest_params, false, 0400) \
> >  	param(bool, enable_psr2_sel_fetch, true, 0400) \ diff --git
> > a/drivers/gpu/drm/i915/display/intel_vrr.c
> > b/drivers/gpu/drm/i915/display/intel_vrr.c
> > index e36db11744405..1698c54e258b4 100644
> > --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> > +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> > @@ -439,10 +439,12 @@ static bool intel_vrr_dc_balance_possible(const
> > struct intel_crtc_state *crtc_st  static void
> > intel_vrr_dc_balance_compute_config(struct intel_crtc_state
> > *crtc_state)  {
> > +	struct intel_display *display =3D to_intel_display(crtc_state);
> >  	int guardband_usec, adjustment_usec;
> >  	struct drm_display_mode *adjusted_mode =3D
> > &crtc_state->hw.adjusted_mode;
> >
> > -	if (!intel_vrr_dc_balance_possible(crtc_state) || !crtc_state-
> >vrr.enable)
> > +	if (!intel_vrr_dc_balance_possible(crtc_state) ||
> > +	    !crtc_state->vrr.enable || !display->params.enable_dc_balance)
> >  		return;
> >
> >  	crtc_state->vrr.dc_balance.vmax =3D crtc_state->vrr.vmax;
>=20
> --
> Jani Nikula, Intel
