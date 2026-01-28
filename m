Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C10D46BE9
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 19:29:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9EC10E2E4;
	Wed, 28 Jan 2026 19:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y7JSaoQL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A0710E2E4
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 19:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769628590; x=1801164590;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VbPUa+DTTtX00NFdw+y6wtdNyYFf7PkJuQdUK/vXlW8=;
 b=Y7JSaoQL5DZFjWd0ysdSqVSbPY72xHXfsJe9Z3/Y7ATbzgkxqav0R7Rs
 dV6X0v6YVK8AiycnDZGfmumSdo2v45iJ0kKoBZQzp/oyHhDOnYrxC1R2l
 Z1nVRUamzbgaE4kuAwH2WaK+H1HKFBzXPstRZjB6qv2nbvHt1+f20sYUU
 X8DWWaO3IAZvGRZu8T62x5+1QsPt/EI+UfPScGRV1ZMVI0eCRQ1/j/nuO
 YqQyvsThd9FMRM1T1nKzJ/uWr4TAC1pYvm6fLY2uimweO5heGu71qGf5m
 RasdtFJI9fDLkD++1fEsdsNGSlZKthxNHKfr4/AdUifSweVd/S8pQDkJu w==;
X-CSE-ConnectionGUID: rIN0P29ERN2j8UOLKTRJkQ==
X-CSE-MsgGUID: 0VlSnktkTWOGOe32mBW21A==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="82280646"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="82280646"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 11:29:49 -0800
X-CSE-ConnectionGUID: yQe5OS1nSBWO375shw/0Pg==
X-CSE-MsgGUID: Cs6FXuizRryTGE1nXZt6dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208722227"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 11:29:49 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 11:29:48 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 11:29:48 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.48) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 11:29:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQFN92HmOZOE8XwjfBMWtdDzaqdNAADNYYioSl+LWqK1GmGH+0o8+g5qbwkSdJeNP58Sblh0ME84aJdjiK3GghWb9C2h90EY/nTe+L8QKifD9EuMvv+I1vIPymYtqIRyPMxKOFVpwfCihckXqcnpuJk5eNF6gLBcbyD9VbVoqp2+W7f13kO+LeFluLkZbllgMuIhrxGbhC2e/Za38/Yz9nNJvx6fVpkbtUIbamoahXGmJbe2jMpjt9nmD/Pu9GGADHytKXXEgtMZ3dyHUGqAl4c+hz/WTAS0Uzd98E86XmGxBXeHHE3U1lCkgmG+7gtrKIvYOlbUsp8vI1LZpJgbiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNnIxOGNVmYC1QLCcnZpBVIjzgI97UeTeTiqCBV5oKQ=;
 b=xDciQ2ikbpiggJxD3zXSk9jeC9GQ9H80m9Imh4CI0XkHMT+4UyZlQOVA+H/EZDhtAMWmA8j4WdWE01fZd7Bcal+bLU8qdQP2GLfMJ0XCXYhxZ7GOxHwZ+FOvyrKfYZicDwv0MRekEJoZpIeYrfXVphWgSGYUrVYgk/PZlrhp/FN4d9+lhfxnINQIqmmvq186bSB5kUziChCC00uZmWxAXmxZKPJyKS9UvOdkXOVgzaCIRuIVQkLYGQWdwjsH7A51UqIze3AW29Lqle1SWcnbeysuYZT3/YYrWE6cSuEKc8DH8GP55zo8MPkZ5IYhXkYzl4URcTBhlaJIKGYteMCuFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SN7PR11MB7465.namprd11.prod.outlook.com (2603:10b6:806:34e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 19:29:45 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 19:29:45 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Purkait, Soham" <soham.purkait@intel.com>, "Vivekanandan, Balasubramani"
 <balasubramani.vivekanandan@intel.com>
Subject: RE: [PATCH] drm/xe/cri: Add check to verify if CSC is a PCIe endpoint
Thread-Topic: [PATCH] drm/xe/cri: Add check to verify if CSC is a PCIe endpoint
Thread-Index: AQHcj1qAsZv/rx0urkyCL4he6g6zTrVn9VfA
Date: Wed, 28 Jan 2026 19:29:45 +0000
Message-ID: <DM4PR11MB54560324D07FEDFF997199EEEA91A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260127070119.1381077-2-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20260127070119.1381077-2-balasubramani.vivekanandan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SN7PR11MB7465:EE_
x-ms-office365-filtering-correlation-id: c48fdd18-6c98-4e08-f64c-08de5ea39819
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?1mq1EQFONDx+RU6jIv2sZC6kSf4BvSSgIl1zm944gFtzPHLUjjL7yBDp6x3Q?=
 =?us-ascii?Q?hrDEWkasuLpoNFw6XJFr01dnpLT8e+yvkMyX17ER1oRGehCwW1AHmaIEHtwT?=
 =?us-ascii?Q?8Ny7vF+UGnRvXzj4feJKV8oWEgUTo/YNphxz/nrgZErOUTh2mMJQlcrV7mLJ?=
 =?us-ascii?Q?YtHiLtbVTt71mzBzebMEuk8Ho1ZGK/sV5Dap61cMI+NwDxlNMfdRdZynMcSc?=
 =?us-ascii?Q?TiXSHRvhgXFBias+T+zvc9Czf3HHVGr4oJaVdQ4HT/ZT5R7j/Ft7eMTKLE4t?=
 =?us-ascii?Q?oIScAfb6LWFmsMs8+2Wx3OIawfRx3wNyz9cqN7DnhcJ0PM6aO+1J7Dh7HHJa?=
 =?us-ascii?Q?8RfBQ3MANvm/8fl153QtnXiVjeaMTIPwwc+lURgTCc8neu2K6HE9/LoV7Amc?=
 =?us-ascii?Q?L6CBdwO1Xr4Tja5JXDP+vgqQCVtMBt+IkjDsnszvMEIxFcnLh7Bw/mtXLSg7?=
 =?us-ascii?Q?LO+XQ5ZphSGifLRLZX9R1M6J1yhcm80Y4FCVptOeuNQc0zHRuH+CmguJvFY8?=
 =?us-ascii?Q?C47GXmNg3cpekht2k8FKvSVjNM2ueC6nRTjl1X/pRkAjsSYZnouTTqamg30t?=
 =?us-ascii?Q?TTMTTS8fT/gbbBnaRV63Q9Q0FPa4jP/mrNKJGP6pDEcUhv6BEJdVZ9lqjOi2?=
 =?us-ascii?Q?UZPJP6vHprpKRhV+JMpbRpXqngSBY62fRTPMBQuUDn3bA4V05avGn7xFDGUF?=
 =?us-ascii?Q?RrP11B3u5p+Yg+5XDf+GwlICSjcST7S/3rtNh7k+TNFAhpNvWY8C9p82/8w+?=
 =?us-ascii?Q?DsYCANdd+anUO3x+HLfb2KLB+djdkN435d3ti+EZzBwF0SSFsmQ+6eS7yqZR?=
 =?us-ascii?Q?VpCYD0j0TYP+dunuovCHFnSbfmU2sNJ/4I5/JVWkTSSUqFGtjWRv/W1Senu/?=
 =?us-ascii?Q?aGrwXMjqHls/KdNUgiqdHVZy2MzAzlgLoqkLacFzmTC7ByzXYdTAoEe6zQ+R?=
 =?us-ascii?Q?xV6VZmHBkMiXLLDo7lf2NPbB0SVYSoX6eEbCW/gBMdZ70oQEJPzLaAJt8xUM?=
 =?us-ascii?Q?+PQcBVA+xYcW5tmJqTIL+gLhKvCjuZlbi30bz7VeqWw65zVgNFnh7H3mnY8r?=
 =?us-ascii?Q?QbBTPApGppivoPjdYTW9XS4fsro9jFf58XWmBDJGZpPeqmCnifNyHhuMix0R?=
 =?us-ascii?Q?Cxhx8uromgLV/lsYkj5tAZDSNSgvs+CJQxo79lpb4CnnJzHQz/WQUB/9WztQ?=
 =?us-ascii?Q?0stQzO04LyjDyh3DD9M57tsgTXiQw0NOvdibt0H23Zp/7z3TowQDXy0OuIKu?=
 =?us-ascii?Q?KC0NPq+m1qC7KTd2dhMxZiogap8SegfyuF6bK/F6Dy9MGpC/1zciaY6Bo36G?=
 =?us-ascii?Q?opERzVfXfkhs4d7RHEspfWh0gMAalOsZJbAbVG61wljVZ3XNgx1Ggl7b1IoX?=
 =?us-ascii?Q?iRncZNqSmLOKpZDah0l1orhIH6mrB+uaYSnyB7oX3b7gzSulkFsW/LSC34PT?=
 =?us-ascii?Q?GprVwctTuoYSdkkMPiue6eCaIZgtUjUf8Ev49CstvNedTKD41hlokVqzFsw8?=
 =?us-ascii?Q?/kj8SdeX1vd8MRifLQRKW9vZvqZD4GkAKyMfeD5OzZFsQI1qYhhsHEUKVBvL?=
 =?us-ascii?Q?eeA10DRpBFyFa0KuFqFDJr2vdtTXLN7vn8p4SVX2eEN0x9OPjTW88rZxlESG?=
 =?us-ascii?Q?aTzcL8bpLlqidDt7Ml8mYdw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1msV2Xy37PgZLnU8jbP+w0QdOym2JOx/5UMnFWHok0hKPk74c3EtlIiPyf2X?=
 =?us-ascii?Q?GUWwu3NaboMW5np3ivxoST0ZAKoQCSA2gPSzgsER1jsb0nkVn7xgTGJCH7x0?=
 =?us-ascii?Q?3ZHii+ZRgRJ7Fti7M0kfabs2WmQjtscKW/D8DN4WLlHAeEXDylLbYmPZKZQs?=
 =?us-ascii?Q?RmC14jZ9f9JjriIhf8YvAUlGl0Slv+2prMlyLb8QC/E/BkdtI7u4mGmQpN7H?=
 =?us-ascii?Q?JFBJzEEmrVw8xksnulMsLyfoDaTuAOMZ9j2A7arxpxyuWRgiC5ukJcWlA/8a?=
 =?us-ascii?Q?5KsmeNvwbbwlv2otp5Yeq16+SWAidgRFlYHskUE0rQN1ZJj2OXtY+E2MsPCf?=
 =?us-ascii?Q?3HVshiEby/nnzL1GUu+sHUBvtv2yN+huY4EY5KYwrp2xxfw4bFjh4124DVv/?=
 =?us-ascii?Q?Zp+ACbH9/hAQYxvlU1Fk9rD6qhy4iA6Wt2GFWhn9sEj8lqDb40wY4l6dzd48?=
 =?us-ascii?Q?z9EzvmOe8c4Gfv9paLAEQ095gSq8L1Ti8CBuvprnbUKx9fPDhKIHTXnDbdOi?=
 =?us-ascii?Q?nzZSwg11FKt2k6XGZfXdjg1Y9ciNPFuCR6QyVNQawEh+Gq4FyrJK/s1J1oWO?=
 =?us-ascii?Q?CppUIuvQLpQlF4a2cQtBFepWo5kAoo/xb/bUEM8f1XKoYMBPiAVYvG/nApXg?=
 =?us-ascii?Q?PYuJpjCEowyxBNnLCicFUNyls6rMs4fwLPVG9JgDJ/ixTJFOUqET1kvZN3xd?=
 =?us-ascii?Q?rrDnEOyJpeSt1OXvp04dgAdYACDxeRlVl2fFRbFJH3iVPebLE32yLXiJhWrl?=
 =?us-ascii?Q?n3bLxI6K4ZLXigIdGxdZUluTgFhw3GUNintmvx4oeOhHvBrLv3JAK87HWAVO?=
 =?us-ascii?Q?UTh3/lXJyvJCGNR8nVXHHsIOyS/bsiMLGXQTpbviCetST1oPpo29exucEG/P?=
 =?us-ascii?Q?ubMzDLCFWYsVGXXZSfdgckIfWyoAXcw03x9ZlYN2m7JfeeyIY1v1hRUk5SVc?=
 =?us-ascii?Q?7An5dXg96MwJRHwXJaWurSpMkFupIsrVdxVljx2ZLjLAUcnLt046T1/WiJZ1?=
 =?us-ascii?Q?NayCzic2fuc7BFtLtmi5yP0gwgFP/xM4RDZrtsx3xPytZGQ3o5MlCpFkNAwz?=
 =?us-ascii?Q?VcwURgNdH2CQ9GTbp2lY2GhVGVi8KuIcL04R5coKCvCeQcAIY0UUP1OoAONI?=
 =?us-ascii?Q?tltR1Dnb/TEpQNwPfmFih+zRy/cTtZLcvJgP22u4vfaZVEkH4d8Ih4NFGlAM?=
 =?us-ascii?Q?YS0NSYBidvAXgkXcU3s8WVV1+OwdQUfQY68ZzERiBMVHsEx779EqBseZfCM0?=
 =?us-ascii?Q?kluet0TdOOag23yUuy9b2bscLNxbNsTxbBMgwJK9V2WYR8Fs2uoqNicoqBkp?=
 =?us-ascii?Q?lDq00F3jqUzK9qYVrjCIIDB1rKF1K6IpeA1oGDoioUG1VLjjQnQBvWjYpwrQ?=
 =?us-ascii?Q?EG92HjDz+5PFb9jdtwFiF0XIjtgA9RLmYJbWP2JZbB5BRz7PzHW13IP4O7jM?=
 =?us-ascii?Q?ErdSQCiCrWQBj+5Ex4a+CAM7SwKUc+T7zzNXfr0TplNPro4uIwLqS22V203s?=
 =?us-ascii?Q?DXn58nc8b6EvGrDANSKvYwmwBAYjEb0TwTlM3Zau1SBCVnwmBlvNKvZpu6S1?=
 =?us-ascii?Q?/Ank1v+I77wpis3hgpZJlFgeHiHmA34vyI646V8y8cU9XQxJqJQy2xZa+JBF?=
 =?us-ascii?Q?P6rVY+tHifbpmCz26B762Wqnb29sIkvV/stwa2GsWQZwV5lu7sNHlC/Zp22u?=
 =?us-ascii?Q?gfnpHiWpdzQCVCX36E1+XEhAo3saJasXRjK7c9gxfTluhB1ZKN2TvuguOCtB?=
 =?us-ascii?Q?LiDsSV1lwA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c48fdd18-6c98-4e08-f64c-08de5ea39819
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 19:29:45.7544 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ill8DrHTrUk/dJGvUjDEGKgz52o/tTLhjcmvBS3JkEnZS2ZNh9gyZcD5808xgr9eKbpJ5I4aizi6h7sfahmW+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7465
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

On Mon, Jan 26, 2026 11:01 PM Balasubramani Vivekanandan wrote:
> From: Soham Purkait <soham.purkait@intel.com>
>=20
> Add check to verify if CSC is a PCIe endpoint via pcode mailbox during xe
> modprobe. If this mode is not supported, an auxiliary child device for th=
e MEI
> driver is created as a fallback flow.
>=20
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Signed-off-by: Balasubramani Vivekanandan
> <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_heci_gsc.c  | 35
> ++++++++++++++++++++++++++++++-  drivers/gpu/drm/xe/xe_pcode_api.h
> |  1 +
>  2 files changed, 35 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c
> b/drivers/gpu/drm/xe/xe_heci_gsc.c
> index c1f15313f92e..191ac24707a4 100644
> --- a/drivers/gpu/drm/xe/xe_heci_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
> @@ -10,10 +10,14 @@
>=20
>  #include <drm/drm_print.h>
>=20
> +#include "xe_device.h"
>  #include "xe_device_types.h"
>  #include "xe_heci_gsc.h"
>  #include "regs/xe_gsc_regs.h"
> +#include "xe_pcode.h"
> +#include "xe_pcode_api.h"
>  #include "xe_platform_types.h"
> +#include "xe_pm.h"
>  #include "xe_survivability_mode.h"
>=20
>  #define GSC_BAR_LENGTH  0x00000FFC
> @@ -42,6 +46,30 @@ static int heci_gsc_irq_init(int irq)
>  	return irq_set_chip_data(irq, NULL);
>  }
>=20
> +/**
> + * is_csc_pci_ep - Checks whether CSC is exposed as a PCIe endpoint
> + * @xe:  xe device
> + *
> + * This function queries whether CSC is exposed as a PCIe endpoint,
> + * through pcode mailbox sub-command
> PCODE_STATUS_SUBCOMMAND_CSC_PCIE_DEVICE_STATUS.
> + *
> + * returns true upon CSC as pci endpoint, false otherwise  */ static
> +bool is_csc_pci_ep(struct xe_device *xe) {
> +	int ret =3D 0;
> +	u32 val;

If xe->info.skip_pcode is true, pcode_mailbox_rw() will return 0 without up=
date val.
So it is better to initialize val =3D0 here.

> +
> +	xe_pm_runtime_get(xe);

This xe_pm_runtime_get/put could be replaced with:
	guard(xe_pm_runtime)(xe);

Shuicheng

> +	ret =3D xe_pcode_read(xe_device_get_root_tile(xe),
> +			    PCODE_MBOX(DGFX_PCODE_STATUS,
> +				       DGFX_CSC_PCIE_DEVICE_STATUS, 0),
> +				       &val, NULL);
> +
> +	xe_pm_runtime_put(xe);
> +	return (!ret && (val & 0x1U));
> +}
> +
>  /**
>   * struct heci_gsc_def - graphics security controller heci interface def=
initions
>   *
> @@ -179,7 +207,12 @@ int xe_heci_gsc_init(struct xe_device *xe)
>=20
>  	heci_gsc->irq =3D -1;
>=20
> -	if (xe->info.platform =3D=3D XE_BATTLEMAGE) {
> +	if (xe->info.platform =3D=3D XE_CRESCENTISLAND) {
> +		if (is_csc_pci_ep(xe))
> +			return 0;
> +
> +		def =3D &heci_gsc_def_dg2;
> +	} else if (xe->info.platform =3D=3D XE_BATTLEMAGE) {
>  		def =3D &heci_gsc_def_dg2;
>  	} else if (xe->info.platform =3D=3D XE_PVC) {
>  		def =3D &heci_gsc_def_pvc;
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h
> b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 85cc7478b787..391a98c8b5fb 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -35,6 +35,7 @@
>  #define     DGFX_GET_INIT_STATUS	0x0
>  #define     DGFX_INIT_STATUS_COMPLETE	0x1
>  #define     DGFX_LINK_DOWNGRADE_STATUS	REG_BIT(31)
> +#define     DGFX_CSC_PCIE_DEVICE_STATUS 0x3
>=20
>  #define   PCODE_POWER_SETUP			0x7C
>  #define     POWER_SETUP_SUBCOMMAND_READ_I1	0x4
> --
> 2.43.0

