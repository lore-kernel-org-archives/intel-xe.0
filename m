Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AE2D64098
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 22:23:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B57410E299;
	Fri,  8 Nov 2024 22:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rf40WTin";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B24210E299
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 22:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731104639; x=1762640639;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pdK64EhWMHqCOqoGZCCQ6sdFtxffuYO4dEMUE21Mj9E=;
 b=Rf40WTinpQIGjgjo5h80I08jEONKAzvRMQsXQK2IHe0TmjbmqlWXLDM/
 kOcHnszQVQMwWfz+aCGokzLNF4zElkB46uuJQz7rZt7RPuoTUTbtM/D1P
 Gk3/UvTScpoXfBV4mkk0RruMD00rz+yq+rm72UqHUMKeMaHg8HUVrp82g
 vDYFO5KSuWHhUy6IkI3BccQ+eHURb/y8Mq4BVCogr7+b2RjL/POR+FBNz
 Xdpq2QLNqFp+787DWDfm4+2nKogKmm5+z0JfOKBaIvOnNW4ED37oT+Xta
 /cOIUhDJwf6n2UOMg6CP5xeXO+6+adPQ7w5wmSwnPH+Q3l5OPvZ/KTPqH Q==;
X-CSE-ConnectionGUID: vK4nAdM9TImKL1Ma9SnzsQ==
X-CSE-MsgGUID: 0S7QBc+kRRe2nA7Y/bCB2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="56400599"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="56400599"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 14:22:39 -0800
X-CSE-ConnectionGUID: w7DGxepyTpKRIkIhGQAGVQ==
X-CSE-MsgGUID: XRTZTWNnTeiE5GnOfRcvlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="86127319"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 14:22:20 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 14:22:18 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 14:22:18 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 14:22:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8fLxiGsOipBjSHIbmUoZVbq9SBW0bGZKUdGaVAQpbDnf9x0MtGV3Vy+yDJK3lTdJvfMZAauAWAQOPYEz/waNHywFhknZ2M7M1rLyhSyuT5FiUu7/23eqvJ5e5OIVtsWBcYsf2Z9kN0XSsEMhRZGYvzPtlKrPEzPLoaFkFFFPLUmMeaRU+56O746TjdbKVuYnVVVFnFtXwIlRKq/96osbjv2i2EDtc1ucB9yzdklkRe4T4KmyMK1XDSKQkdlcYsBRDIWxhBkBwbmp35+tMGKVu0/kGq/lDlTzq68qlhrhUKsxwiKFrb4HwbtstMeIhW9DdHYU942CA7NIZDwMWX4CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4AoaJVBelmkXhgdWytJycK04HIBZQsEMTsqNCX5SSc=;
 b=WWEreORco/sgs6aL3hgKUn86DjEESbR9r1TA4LCoWd9ku1S+AOqb0i9fjVG0RqQj6jfcdOHvXW57XZ7BfZWFr8cwcGFYFhm3Ncp9AqSy1MIp4PMgw3FRk9YtAWDuSxDAh5yL0N4RRz9q3xLctCvG4psxYDnhCZVRyoHvoihH+QUXg5/W+3x0ps+QDGbkCnLtIZBNHitRyKq3D4l7eqEYGRKcq8MBHhgtyLJD2ZxC0vF6SLVXDU6kbdM1wEk9FsmM3sAqNKuWe+8hhK1YyzRu0vkW6euQ+p4aL8vWXP+Wxuya8TT9ckzWULqQi7+5Bo59hcNCoXrvBuEFVFv9CpyN2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM3PR11MB8715.namprd11.prod.outlook.com (2603:10b6:0:1e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.20; Fri, 8 Nov 2024 22:22:15 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 22:22:14 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Dong,
 Zhanjun" <zhanjun.dong@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 5/7] drm/xe: Add exec queue param to devcoredump
Thread-Topic: [PATCH 5/7] drm/xe: Add exec queue param to devcoredump
Thread-Index: AQHbMgWv48hteP+OCkaex0ypd0mDGrKt8Xvw
Date: Fri, 8 Nov 2024 22:22:14 +0000
Message-ID: <CH0PR11MB544489F6D81CE8CBCA90ECD5E55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241108174312.272792-1-matthew.brost@intel.com>
 <20241108174312.272792-6-matthew.brost@intel.com>
In-Reply-To: <20241108174312.272792-6-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM3PR11MB8715:EE_
x-ms-office365-filtering-correlation-id: 358aa245-803c-4f95-6ad2-08dd0043cc64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?ixeg0eBgWPE8jnx0dpM820XqCHtswSv1Cs0p73RoXZuoPGijHDbyYytwsf1e?=
 =?us-ascii?Q?BKaTR6w76XYZ52Fjz+2Pd/R4AF+O4so0dEBkJJfAHyap+eRQIaJ36KlCIy4+?=
 =?us-ascii?Q?JtouYsJDWJG1MhaqF2fRnT+KjjxvOrgDGiwSFUHF1UFDNWogGceRSKo0AnUc?=
 =?us-ascii?Q?hGTi0EQDuoUn8qfgjcYPhuopA0eD3HJbJ0L/QeOp9ah0GiMH5I72w9IHbLGY?=
 =?us-ascii?Q?iuI6p/6l/bgzSn6ChFo3BUN9AT6nlu5pwLM9a3n90crl8OQtUVkZc6r8WHLq?=
 =?us-ascii?Q?PEIQFmJy6pKNe/JzlSkzPi3mZMBDuJqABI+QhHWEZ7vi5a3iPX+BV1kXVu61?=
 =?us-ascii?Q?XJd1WAPDANdqSwEgue7KGYZZe9/jIJrhCwKUwbv+i8dh1PeXlScvdE46QB94?=
 =?us-ascii?Q?Gu/STUP4B6gk7kXv1xe2XLSfnpZbbWxsoBNb9I61PzvOchLtrQ3PTEz1nEd4?=
 =?us-ascii?Q?/09lSCmIWkLq7+0T2YLWI2lMMxohtPr9+pmtRR357jd9xAf6I5pyPLBg5xL1?=
 =?us-ascii?Q?eFsUE8iDkYMpURnEsj4IPT7uORFpcIOPcGppK2dIWQ3fhmZCVUtrcijwjPRw?=
 =?us-ascii?Q?wm3/KQMhoo40dMTQ6AmhM7TFYGKkero43XhHTqJOTtgVlOSkovdykES7XMxH?=
 =?us-ascii?Q?J+6wpMNhEwHsOFai9sr2gJZBmJcgWSmPJ687joKpFAcq1UVvuB8lAHSEcpH1?=
 =?us-ascii?Q?fQ7knOzLAQnroj+FbolGA7ox9rfKlHVsQ7R/n8V5KZfJfZEVirug266ZdwEs?=
 =?us-ascii?Q?g5/7Znqy/Ih3QGcRtcBRfYlcgxSFUX5okYluz/D3K1Oi/K7pLlIKrF+dyVcu?=
 =?us-ascii?Q?fl+3SdyH+nA21nE+4zdInBKR0lOO7MT0JxfmD1ep8/iaagvlFP80W48bMMoK?=
 =?us-ascii?Q?A+gIN8y+f3NMl38x+U2wiqKy101q0K5emxb8IgxhM2KNEM59T+u61TGgrXzh?=
 =?us-ascii?Q?MpalZ7HoO7hd8xVFc757PbykQeAXfDkrEZ2pAXYzHoaS2B0fPiS5ZaHv88Yf?=
 =?us-ascii?Q?ikW8DxYZvrHq000cdz94L6Z+V+uPPfUvlD4ZQiexXavIJtyKTn61gsCRRAfK?=
 =?us-ascii?Q?qqEPh9jWg4qgchA7/HbiJve4nJlkCKx7kXPFKDVEnF/zvv/6oyzq6GTO0X38?=
 =?us-ascii?Q?IBE+jH8pQNiF/XiE9Hya/O+Dh97lyyfxfou7FJpx0EJXRixDqlKr5Gwylq/o?=
 =?us-ascii?Q?a7TbQ8Xx0UkEq7nOl4WbIJP4Vj/SxoA8UgEZI6KjBxE6vg4+YDIgHgtI1OrP?=
 =?us-ascii?Q?V7g0b1g43O6pAeUE6K113mFKzxHWSBAv+/E7vxf5adWEOfBbHVLfppVpj1PV?=
 =?us-ascii?Q?4zjEoSe4DWfzK7W4eW9ZwM8bDseRV5rP/u1Lgx9wZjimGk57LN4eDVYZY7C2?=
 =?us-ascii?Q?KO79ULM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?U8gxk9dJrPTuqUJiHzqu+59IOgMPfOhIFGJNSttcT8LKcmvrXMrFsx7wxHHZ?=
 =?us-ascii?Q?C0RLXxcsw6VWpLt2AOBPfa89VHEh2z4gJ0K7Rwm5wEexfndKBKmSfJElkSpX?=
 =?us-ascii?Q?tLX1OMlbiqhg8S8sp2e5paMXs0P6g5hngBNYSqML62GMYgkn/T2Xu2Rg1GPc?=
 =?us-ascii?Q?XByVPO2KuNqKypzd+aZDwbS15Q2JrrvdC3LYpYd7puAiL2HQnJvMcrTvCNf/?=
 =?us-ascii?Q?sJbOlXN9Xnc9f0Ac6m+g3oj6/GbcOSywp4amkAIrMTr7I8/hvg4pKUZhvN/U?=
 =?us-ascii?Q?sufnCxFWvwQ0XD+gqk2ZzEfQUPdIMxlQQbeR7PKWRPwx6s8xyRLCUqe0uvtt?=
 =?us-ascii?Q?ZHpC85qK1lKE3dPv+erCy0cdFjqBgm5zsLCPd6fPMOAMCCZer2itWDCPSVaK?=
 =?us-ascii?Q?TwJFUbxG4td6et0mTGyWk05c7QVYTc8bmy9NHlxsfT1qceluAl1XMaQ/hbnD?=
 =?us-ascii?Q?bLZpiLj8qQ0dzWzy/b6Ba5FvuaoGsP2rOyV7DaKw4nqw7wudbKcH8KVKlM3D?=
 =?us-ascii?Q?ZPtGPu/joeOJpnV4J9k1XvLJzhQJE83z0uwaNDWgYuYzRKezLTLwkN85djLG?=
 =?us-ascii?Q?ndGdcEYqYy+FVt3VwQkpUxtMMtbL8dk/hTifMNQC7JZ9iaDNGgSmO22d3DQd?=
 =?us-ascii?Q?x0raH21qgyHj5AwAMKa+Oc2Wce3b3jDxXHS+eionIwj0wz2c+Qetfbr+GO5M?=
 =?us-ascii?Q?dpa+8+axkJbEZfKpHMhjH0ylykkwKXC+xd9qo3qHi62ssVUwpa4HMEq0uypZ?=
 =?us-ascii?Q?3H3metNGOHdXpLAC0uQWts4vb8n+8ROUXB0Urzq0xbaOoLrwYx5gi3ViBA+a?=
 =?us-ascii?Q?PArlIF8/0laHf4F+ia2mTf5ODqwSzUZHL8zBiBxez7DvnBCPtxxsKKxQ7Hzg?=
 =?us-ascii?Q?cS9GT0a3FCIil4LOZTsjzGQXN/Zt0sHHBlwTnC2Me+jb6pD5iNpYgVMQytnG?=
 =?us-ascii?Q?3KVDQWC3dE/GVQ1OW+eyjFiW7Je+X0EvIidYFlhOg+v5HB+6qDUDBuTsDt1m?=
 =?us-ascii?Q?zDFpFXhzNww9+qgzE6VIuYFBDmQfvWPOkHw1wvlBJVIQ7vF/BB+uh5t/Z83t?=
 =?us-ascii?Q?8/oGRElZw3eZe6Px26eElgZYH5TksnolDdoo5PyQzgRhQgiW6u+/HZ6KSyAz?=
 =?us-ascii?Q?a6FiKe65GACQll+w3V3D09aXMI1vv+5wF7s/QW7EnISn3ybZF2set8pmfKnC?=
 =?us-ascii?Q?Q1CVc/VfstftqWXsLkP7iPg93Y5RYhj2tXR9rogrG+8VeVPpv5O/GT4+p71l?=
 =?us-ascii?Q?lG/NUn8jhmyHUlpDhcVxxiPsjk6hbkQPqB01xdPuM5FS/3nzDY2pjHX7hToG?=
 =?us-ascii?Q?oDt+tSA+ptLLgTyVGO4tC0mgsE2OWyqYvGXz74Hrr0IpgciG8qG8TGmPf+z2?=
 =?us-ascii?Q?MQiopGPL+kAIquKHmZ3c5qalHZL3cb6rMDjyr9YLdXKK/nDaI8h/RrTAamtA?=
 =?us-ascii?Q?CXc8/BYnIUjenwsH5TamY7OVjcTe+NXo91agIjbXmb40KpGD8P9VB7ZmpnC/?=
 =?us-ascii?Q?HSxpaPdgrKsBH9G10gvR8Qngq6gumgK+tLLGTxVil3h8nX+LfhMWFEyz7Gng?=
 =?us-ascii?Q?luBciYAw1Kkjjtnre0/76B+lQ/WWjcZr2XY40S2I?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 358aa245-803c-4f95-6ad2-08dd0043cc64
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2024 22:22:14.8160 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +6HSK2Yl1kHuhd7w6PUJw6DelmhJukqyHv+05jY/UnCk3+BPPuyE/4S5sTYsczltO+Xr+wX0Ndb9+zhpby1TUyrVWZu64cMhay9THu/+wDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8715
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Friday, November 8, 2024 9:43 AM
To: intel-xe@lists.freedesktop.org
Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Dong, Z=
hanjun <zhanjun.dong@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
Subject: [PATCH 5/7] drm/xe: Add exec queue param to devcoredump
>=20
> Add job may unavailable at capture time (e.g., LR mode) while an exec
> queue is.  Add exec queue param for such use cases.

This commit message could use a rewording.  I think it should read:

"""
During capture time, the target job may be unavailable (e.g., if it's in LR=
 mode).
However, the associated exec queue will be available regardless, so add an
exec queue param for such cases.
"""

Though, I might be misunderstanding.

With the commit message fixed up:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c | 15 +++++++++------
>  drivers/gpu/drm/xe/xe_devcoredump.h |  6 ++++--
>  drivers/gpu/drm/xe/xe_guc_submit.c  |  2 +-
>  3 files changed, 14 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_=
devcoredump.c
> index d3570d3d573c..c32cbb46ef8c 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -238,10 +238,10 @@ static void xe_devcoredump_free(void *data)
>  }
> =20
>  static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> +				 struct xe_exec_queue *q,
>  				 struct xe_sched_job *job)
>  {
>  	struct xe_devcoredump_snapshot *ss =3D &coredump->snapshot;
> -	struct xe_exec_queue *q =3D job->q;
>  	struct xe_guc *guc =3D exec_queue_to_guc(q);
>  	u32 adj_logical_mask =3D q->logical_mask;
>  	u32 width_mask =3D (0x1 << q->width) - 1;
> @@ -278,10 +278,12 @@ static void devcoredump_snapshot(struct xe_devcored=
ump *coredump,
>  	ss->guc.log =3D xe_guc_log_snapshot_capture(&guc->log, true);
>  	ss->guc.ct =3D xe_guc_ct_snapshot_capture(&guc->ct);
>  	ss->ge =3D xe_guc_exec_queue_snapshot_capture(q);
> -	ss->job =3D xe_sched_job_snapshot_capture(job);
> +	if (job)
> +		ss->job =3D xe_sched_job_snapshot_capture(job);
>  	ss->vm =3D xe_vm_snapshot_capture(q->vm);
> =20
> -	xe_engine_snapshot_capture_for_job(job);
> +	if (job)
> +		xe_engine_snapshot_capture_for_job(job);
> =20
>  	queue_work(system_unbound_wq, &ss->work);
> =20
> @@ -291,15 +293,16 @@ static void devcoredump_snapshot(struct xe_devcored=
ump *coredump,
> =20
>  /**
>   * xe_devcoredump - Take the required snapshots and initialize coredump =
device.
> + * @q: The faulty xe_exec_queue, where the issue was detected.
>   * @job: The faulty xe_sched_job, where the issue was detected.
>   *
>   * This function should be called at the crash time within the serialize=
d
>   * gt_reset. It is skipped if we still have the core dump device availab=
le
>   * with the information of the 'first' snapshot.
>   */
> -void xe_devcoredump(struct xe_sched_job *job)
> +void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job)
>  {
> -	struct xe_device *xe =3D gt_to_xe(job->q->gt);
> +	struct xe_device *xe =3D gt_to_xe(q->gt);
>  	struct xe_devcoredump *coredump =3D &xe->devcoredump;
> =20
>  	if (coredump->captured) {
> @@ -308,7 +311,7 @@ void xe_devcoredump(struct xe_sched_job *job)
>  	}
> =20
>  	coredump->captured =3D true;
> -	devcoredump_snapshot(coredump, job);
> +	devcoredump_snapshot(coredump, q, job);
> =20
>  	drm_info(&xe->drm, "Xe device coredump has been created\n");
>  	drm_info(&xe->drm, "Check your /sys/class/drm/card%d/device/devcoredump=
/data\n",
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_=
devcoredump.h
> index a4eebc285fc8..c04a534e3384 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.h
> @@ -10,13 +10,15 @@
> =20
>  struct drm_printer;
>  struct xe_device;
> +struct xe_exec_queue;
>  struct xe_sched_job;
> =20
>  #ifdef CONFIG_DEV_COREDUMP
> -void xe_devcoredump(struct xe_sched_job *job);
> +void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job);
>  int xe_devcoredump_init(struct xe_device *xe);
>  #else
> -static inline void xe_devcoredump(struct xe_sched_job *job)
> +static inline void xe_devcoredump(struct xe_exec_queue *q,
> +				  struct xe_sched_job *job)
>  {
>  }
> =20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 2cf4750bc24d..974c7af7064d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1162,7 +1162,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *d=
rm_job)
>  	trace_xe_sched_job_timedout(job);
> =20
>  	if (!exec_queue_killed(q))
> -		xe_devcoredump(job);
> +		xe_devcoredump(q, job);
> =20
>  	/*
>  	 * Kernel jobs should never fail, nor should VM jobs if they do
> --=20
> 2.34.1
>=20
>=20
