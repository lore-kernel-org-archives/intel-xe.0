Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39F2C3ABC3
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 06:59:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA48910E2E4;
	Tue, 13 May 2025 06:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JEMGh8E6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7133A89D7C
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 06:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747119541; x=1778655541;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hKutVmvZmRKTk58Pifk/PiCSHX34DA+urQh9SuAL+sQ=;
 b=JEMGh8E6rD4EEGwQNq5dfz61WXIZprl5zQCw3dJKZbmM76v243VFtv+i
 4No90yk5/bJFD5xdAOiSzKqU3Y9nmdJ0H5zGjl+znUDVrsXb5Krmc+RAm
 IqsFhyjvAybc73YH1bFbF5NMpUksRcIgqbIcPWKcuDyk8xhSas7VYnIFV
 nVo3stvUqdAFo7Qj1jv2Lb5yRGMoRXGvmVSPYPKEp1xWQ7+n1948gpKcp
 rkfJ84dp5X2R3W4iVRmNCgZFUV73mxeBSsjT6AI8+6k1sae571tkTCVSv
 vhD86TdLJaqW4VQxidnAgXnmA853P90bJcmj6ydgU0ulej8OThZk5e54f Q==;
X-CSE-ConnectionGUID: +3D1DfaSRauW0IXPm9pc0A==
X-CSE-MsgGUID: GNf3Y5cwSSGJv4/Ku28lZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="60285292"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="60285292"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 23:59:01 -0700
X-CSE-ConnectionGUID: a923aprnS/mdxZ0RT6CSwg==
X-CSE-MsgGUID: P7AQrgQsRymIlaiI8Warhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="137354644"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 23:59:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 23:59:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 23:59:00 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 23:59:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XvTePVC8AiWYzCzV8WRbv8Pyrnmws17Xvp7PFlYLDS3eXWe780NNutz+YAL+7uZ+sbpCBhWDByXajcXh2p+3xd8cNlY4wmkGKE3xx18M5CtqMJEs4WAU85XAZwf6sRJOwk4Tgpoq2kl9CDouWB+JtU99ajRfp+LV+sxD8p5D6BWe+9awIu2daQU4cbFm7E91XlC0+hHEH2Du4Dw+GnQKVifCVfcDsGmV2FAqj7PcuIJngrvytdvjdKLTfYC9bt9dt1IeaGt/BF6mnTu1MjzgCWgOUTrV8/s11U4/uEkufsx0QivY7MEsE0aibb7XhQaWXh6KqyQRTUR7b3uQ6mrZgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSkWouFlaQtO+OyddAcPBQsKjFT2ULmTvo047eOQrJU=;
 b=b/ixxY2UHKnliGv8wbyDJG3R/HC9uaRdTnnxHqXf6TetmsxLyF3ewychglTO+5AdvvCZohpsUw+g2zuJZUSMdOszfzkax5WJam7hj5hOfjn/4VA8uWpwGsg45z+4c8AL934q+IfCZfN5B/zs4YsPust1AZu6RznTTn0BkNsMEhVL9N+Ic435v+cp/xxHdZu70YzBWOmYWNmP9xMdHObwnXTsKreuU7EwADMGiCOHIJRb6h/6K0y2O2kjnxClX4nijjys+QnVezXZG7BRhZ4bD/YCOdub9HNvJU3p8MOoEv6dkK8/eLOsNJxNzepfoNqe2hbslfsN4FI433p/jO1ezA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.29; Tue, 13 May 2025 06:58:42 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 06:58:42 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe: use xe_mmio_read32() to read mtcfg register
Thread-Topic: [PATCH] drm/xe: use xe_mmio_read32() to read mtcfg register
Thread-Index: AQHbw7uwhrOLaeck/E+AR2rBpE8Zr7PQHjEw
Date: Tue, 13 May 2025 06:58:42 +0000
Message-ID: <SJ1PR11MB620444BA4A4225A2AA6D9E9A8196A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250513035515.3458300-1-shuicheng.lin@intel.com>
In-Reply-To: <20250513035515.3458300-1-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS7PR11MB6039:EE_
x-ms-office365-filtering-correlation-id: 9f968f34-0c64-416f-dc6c-08dd91eb990a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?OtDuoB0AJyQM3lRI7FAqlhZWlCjDJm3nM4fB1HXPwGQCL2gITJl/dW8UzPZJ?=
 =?us-ascii?Q?vpdqgbegbw8qCew1gt16cjgkF2V6kwSQssk9hGMK3PZQrjlAHRX19Oj0b30K?=
 =?us-ascii?Q?Di22VjyEiuyEs8jcZIcnFgvRGwiemOkBYKlZO1a83z1rNmSMvQiVWUqQ/cs7?=
 =?us-ascii?Q?91svZ1K+ChLxgCPkHBA6gSwPP7pCVykDDSya8eXWArrGc9hOIN6j/azjj+Tu?=
 =?us-ascii?Q?EOEicog/wh5B2Pu+WCVL3s73zPUoUmLf+vre90D+Je+ZIotFVk7vuBaMYaIu?=
 =?us-ascii?Q?A57fGPo7zEVsfKgW0pfxN0gOjtU8MLMROew3+iM8++IbpRouMC3jUDW5PdgP?=
 =?us-ascii?Q?2X2KZwbVL6Ag/H0MzJcgv0LBOl0gMpi3ZOo+J6D42jPl8xHG9AozGpE4bwct?=
 =?us-ascii?Q?Ap41Hnm7I7f/F69DEq3OP8VtnD45lO0HtB+d/bpAbJnmDjg51aqFo8xFdpQ/?=
 =?us-ascii?Q?rsYhj1d7Ox346efxA0jASWgntxQ6nXgd8BqNhSOP5awiKGyfDhPWAVVkCV43?=
 =?us-ascii?Q?TdbJB3F+D1/9AlOIc7db9Gd/JIyuwMWtXb/nBSlawnuUGNfjice6KOK7fXK8?=
 =?us-ascii?Q?bDwfLC4yjF3DbKwHmf5/zY8yzfHH4JjKOij9yOg7t9j4AkIr8iFUTtQa3Yru?=
 =?us-ascii?Q?T1qo3k4Ikdme5QlHD4gAfHDKYIaKCDW2hb/Xs1uhWlIq179IvIeRk83Ci9tn?=
 =?us-ascii?Q?HB5lESjdT9dFMg1u7iQ24lSR4x7Z3gAfJkb5nm4fNwpMpCpXG2WahJy3CGZI?=
 =?us-ascii?Q?VysERx7fHZ1w6b2T7yq4N79x0PQtK0dT8bMEtnT756QMxBlRO2Un1gdATsxH?=
 =?us-ascii?Q?eKJzaLynrHAWrAVlJo4bJl8YYj7GmkZqV1cAhkVg6JgzfuhTKaalnFBqenXr?=
 =?us-ascii?Q?sIpE2d+PY5NeFaEDVD1Svo+wOL/IOj8LmX3WU4OgdyAISNC/mWyqRjB6Zihs?=
 =?us-ascii?Q?0onAmAPYVR90Ys+bJjLRALUjCPQF3i024aFhzs6IYCpyz5xetBTPDKwmfLle?=
 =?us-ascii?Q?PechuYbH+B7JTdzARHj1Vm80zxGJviKlTc5NjLFG2Vaufi4Yt5t9B0+5yiJu?=
 =?us-ascii?Q?VfPMntkJAX8Ghu5AJFincDZaC/lxL+HaYyewpwdUNCsnyT4k4bYuisCel510?=
 =?us-ascii?Q?TC1HCV+kKgIO6q3BXObMlHM3nU+NTkfSfBzdogTmOVf6Gympbb9FZZoE/qiJ?=
 =?us-ascii?Q?it6GzHmWYpSNqwnzexCnx/01qEMO8AR00MT+FuonKZQabJhy+U5YvadAedOg?=
 =?us-ascii?Q?Ve3nwJnD0oKWtBeG/eVL3Lph/Dn47YPBkC+0YdvCSdoEzkZqm3qfK0SSFw8H?=
 =?us-ascii?Q?m4nwcy1cq59JatnvG37wqPp2f2MHzU5eZvFp8n0xNIm9MqnykNpCpkekeFqU?=
 =?us-ascii?Q?iuDdalouOoavLu2Ag++Z50Yv7oiKOm3o1wMDB2vAWlKvsXp63vMJxHKMT5Ot?=
 =?us-ascii?Q?nPLlu6iMf5whLrMjn0U5TrC32/3n2zEu3j0BlgKw2yBzuw7F8+ZY3ghGPPb9?=
 =?us-ascii?Q?xMRle3w/rRiokZ8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YAF9hMJKBKE91feOA9hzlx2VrBRp+hVstA/ItttlaOZEfV1JpW2E8OeN0PYp?=
 =?us-ascii?Q?3Y453OvUZD50BlKnDTp/cnFy41U3+sCB+Ld5ZoaTSEJdv/+zvt1Obg55//Eq?=
 =?us-ascii?Q?nMZG5ZM2vDI8AN/YiWX3zOuxHpKJBQTAh+RnCWyBLDc1m8eHnz+J5s9+IHvo?=
 =?us-ascii?Q?lzuBbO8LoGo9+LzYMc849RgQ+oJXRNYpiWHYRt+Pxi7pR4aXd5T0QM7SsxOW?=
 =?us-ascii?Q?hsxuQEFFTGi9pgQUCya5dk05szfE0iZLEs+L8vhxVRH193w0PCYD1D/R8MM3?=
 =?us-ascii?Q?tzOZWBi2dvfzEEC6sNcFBdy3S8hL49L5xQoJl4UgE5IKXGmeCFXVDwj6XKlC?=
 =?us-ascii?Q?SFO0XRunQFHwC0w+8PURjMWHiqQls9RSg013xsrykSudBJ8QYrGs2oLi/i4d?=
 =?us-ascii?Q?D2GlrvOV8fxVtSQM965RNszn6m4r5SoGboXIOhbkop7dRFf5Qenca64dQlls?=
 =?us-ascii?Q?Oq6qWXXeMa8rEbMPN6BBEI7JAMFORX52GkqIrLb4aExVUgWDUPuKcf0w+7lH?=
 =?us-ascii?Q?idBiPBTblnTBxk7eFPRWcNIXs9+Xnuns2XFm2NQwtwXlHb3whIxZqU3jLGTQ?=
 =?us-ascii?Q?gptXjh/ZZe5J3kzKy/snCDNmfG4R4KoiqNlgLxXchD9DH1rBYWptZ2KGGB6q?=
 =?us-ascii?Q?jph6do7AEgGn2qxwtBj1HIIAjsLxQ0neDJhAMUF0IrGlc5y2yHo+3GbOg2+U?=
 =?us-ascii?Q?j8mq37DwNddYPuMJqGjX3aVqe8iOl5lngJd+vvftcAnT6cR2OFXZmTwlXbhR?=
 =?us-ascii?Q?lZwnEewT0sUlLTJc5jUhnlc8XBeEfvTp3INUR+BGXWLU9Cj48PZXo8a97r4A?=
 =?us-ascii?Q?g7OVPEDyA2INH/efD5iJ6OMO3F1xWz+JxIppvJAPOCIGGMcxjRB49ADZadGl?=
 =?us-ascii?Q?hq/UoImdYa9xG2g/Uwuac90HZ9Sg1n/P60+fmzl/kjaqoRF3zZb9X5xNcOm4?=
 =?us-ascii?Q?t7GtEwpGnu99ylwjTHwPcChTBRKpglQDNYHd+o4W/lPMePZUgQ2ZlTXHhaZC?=
 =?us-ascii?Q?Fgusy15mcJV2im+yu5Xo/vbR22AAFpSVL//HdkG+2e4C8O5K3yHx/128oUVG?=
 =?us-ascii?Q?PS+oi2nVc+ro0tGNVaSeunwy7jR+8tCuo+/mIRm/BKLNLWQrYVWQTZJrO/oW?=
 =?us-ascii?Q?iYdLEFaZJt1h9dvACm7n18/hu+Zhq53EdQuZGGHd+cJJfaND7x/D0tcqBawW?=
 =?us-ascii?Q?l1W5PY8LYzMA2TD7PwD4AFDr8o+/fdSU3fksFosz4PbyKmWKsZGbOTpxn4RM?=
 =?us-ascii?Q?87OFk/B92h5WquJH2jSIP3jnvFYlJffiVB1o8L/P+Kciohf09pFQvwtsMUB9?=
 =?us-ascii?Q?6SEvw92BkWLrRJXwduAJ5zRgs1twSIJYwNNxK1q94yK/H/tysKcC8FyWtZ//?=
 =?us-ascii?Q?8pcwRiMgpMedF43lG5rGGHL8pQNXsYCEpZglJpNrb6kQRRGS8e/5MikSPaUB?=
 =?us-ascii?Q?2v4gniL4AGeiGg3DARliFwVBue7ak6UePVnwUfo7YECeEEvbA3jScQYmbf1N?=
 =?us-ascii?Q?t3dx/qfRUC7/y87nV1wZen0EFn7h6eD2NxZiZQh3Ci8AceG1f0YN3bjH2pZW?=
 =?us-ascii?Q?zAc8bCM9VJKCFE83PM9/JfWEEd+3PB9jejPl/4vubcEz1q5t8pD18cLaWUBH?=
 =?us-ascii?Q?vJ7KUFdWFKvcBi2oGCFGbraIYSv6/V0dxoGjmFeTgH10?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f968f34-0c64-416f-dc6c-08dd91eb990a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2025 06:58:42.7413 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bZ57M2dWiaWMlbJQQbUNCz/UH8e9L8VVjrAEo+KZOTOgNxTnZHNZxNWmEhO3qR498dS2oQrWcAn2GUwP1s51nizl25MgV1amf7XNP0Q9Cio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6039
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Shuicheng Lin
> Sent: 13 May 2025 09:25
> To: intel-xe@lists.freedesktop.org
> Cc: Lin, Shuicheng <shuicheng.lin@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: [PATCH] drm/xe: use xe_mmio_read32() to read mtcfg register
>=20
> The mtcfg register is a 32-bit register and should therefore be accessed =
using
> xe_mmio_read32().
>=20
> Other 3 changes per codestyle suggestion:
> "
> xe_mmio.c:83: CHECK: Alignment should match open parenthesis
> xe_mmio.c:131: CHECK: Comparison to NULL could be written "!xe-
> >mmio.regs"
> xe_mmio.c:315: CHECK: line length of 103 exceeds 100 columns "
>=20

Probably it needs fixes tag?

> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 096c38cc51c8..7357458bc0d2 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -75,12 +75,12 @@ static void mmio_multi_tile_setup(struct xe_device
> *xe, size_t tile_mmio_size)
>  		 * is fine as it's going to the root tile's mmio, that's
>  		 * guaranteed to be initialized earlier in
> xe_mmio_probe_early()
>  		 */
> -		mtcfg =3D xe_mmio_read64_2x32(mmio, XEHP_MTCFG_ADDR);
> +		mtcfg =3D xe_mmio_read32(mmio, XEHP_MTCFG_ADDR);

Yes it is 32 bit reg.=20

>  		tile_count =3D REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
>=20
>  		if (tile_count < xe->info.tile_count) {
>  			drm_info(&xe->drm, "tile_count: %d,
> reduced_tile_count %d\n",
> -					xe->info.tile_count, tile_count);
> +				 xe->info.tile_count, tile_count);
>  			xe->info.tile_count =3D tile_count;
>=20
>  			/*
> @@ -128,7 +128,7 @@ int xe_mmio_probe_early(struct xe_device *xe)
>  	 */
>  	xe->mmio.size =3D pci_resource_len(pdev, GTTMMADR_BAR);
>  	xe->mmio.regs =3D pci_iomap(pdev, GTTMMADR_BAR, 0);
> -	if (xe->mmio.regs =3D=3D NULL) {
> +	if (!xe->mmio.regs) {

Not sure if this is needed. Everyway apart from above minor comment this is=
,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>  		drm_err(&xe->drm, "failed to map registers\n");
>  		return -EIO;
>  	}
> @@ -312,8 +312,8 @@ u64 xe_mmio_read64_2x32(struct xe_mmio *mmio,
> struct xe_reg reg)
>  	return (u64)udw << 32 | ldw;
>  }
>=20
> -static int __xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32
> mask, u32 val, u32 timeout_us,
> -			    u32 *out_val, bool atomic, bool expect_match)
> +static int __xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32
> mask, u32 val,
> +			    u32 timeout_us, u32 *out_val, bool atomic, bool
> expect_match)
>  {
>  	ktime_t cur =3D ktime_get_raw();
>  	const ktime_t end =3D ktime_add_us(cur, timeout_us);
> --
> 2.25.1

