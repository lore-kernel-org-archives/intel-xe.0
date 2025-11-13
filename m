Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B7DCCFA18
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 07:07:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E8410E0C0;
	Thu, 13 Nov 2025 07:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GE/xemS1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FEA210E0C0
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 07:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763017622; x=1794553622;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EOErifyltPGW4BAkxiK1wOUueZVEsB6nqkBmxCGHSaQ=;
 b=GE/xemS123bsezu824TaU9cHdLf7++VflM9O/QS2jlhL9jJfk2jL7rjs
 C6qmul9IYbIsqDV9YLefknP+kzXo4O6IrHZmEsNb7aT2wLIv/sDUkkYHO
 bR3P7I75x8JU+zknpCoQiWwl4fPcLzCEvdEMZfACnwJYWhb1QCIOqlTob
 PRKHMLW6PmG/+UB2hZFGZ1lC87YdWC9aPGgUK6Ep7RdF8hDPaz2NstDsC
 TOMzGBF8REuQl0BPuwW9ZZ4vm7vnxKfAiBOnSrr0Vr/UB0agQkaUfcJRS
 1iu0IdQmzTGR3YEc7crA4GQ+ky8EJnaiXo+iIlqpquANCjvXByLkY+lW+ g==;
X-CSE-ConnectionGUID: 3qVXSee8RN6TvhoSDji/uw==
X-CSE-MsgGUID: iJUKfh16SYuykhCD5wbwcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="90562630"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="90562630"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 23:07:02 -0800
X-CSE-ConnectionGUID: UsBDjJhYSm2Uu8KVTqLv2Q==
X-CSE-MsgGUID: eP5r5kqRQaWeaRBXO6G86g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="220085598"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 23:07:02 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 23:07:01 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 23:07:01 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.29) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 23:07:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NNIqQ/+cFoMGKqvi65yFUbyvMEuRPt2RyJuS6t+I3i4NsqQUMfE8Kyk68+aEOkU5SFxKzAvzI/GjN+9MNJyCSEvBL+0/onk2Rtj2XoklwUGdxvFWCJij1E1yI38taIX/KSlSAYocZHJtnaMBf0xWXfg3hpJxPxDo2vI2rJSYWySF+hY/ewxyGMo8PgU6s43ruYg6yO5wp4XY0K8jOnlf5kBRHr64oRQzlDCVHed5oFP/UJLxXQOvPX2JksVHR/5r6Kui0kax7v75O6Rg+NLcxx84rgUeazUzlMeVWcsaja3UZY92ucP9riEbl7oyXBBLQzxZcoMTyNqOlyGwOuXVJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CQ/tn/oUqBN1HfqMBmCdS26sxt7tPcNFWjA679wQl8=;
 b=GLDJHBJqpkGIiH63YfI6HW87C18c8NTaIdMtNdHw7MZ5Hb61TURflIzCJlhLwmEIk9WxtJnEQfEf2xAS37oWj+og/YeU6BWKmqGE7rE05QiCNIYcdvp/rwZ5RiYO6vuzWmv4vS8oelM4bMFaDRyZ/Bwh1IWVizuJHfZk6NHW1N/nuygp1wXo92Edg6mjgy7OHCDRdSyY5oJA1AYASVZNiPAstfdlxVTB/ARcUYvaNXmQqYdA4kkL5FiYyKDbKi0qsnDMOq3hPjIPcLAXqfukgOYkrFmQyImd41xYrARrlNEzSX3T6IybGKAo8cWuP7R/39X8IgiRsEcMKPYelsYUXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by PH0PR11MB5064.namprd11.prod.outlook.com (2603:10b6:510:3b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 07:06:45 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 07:06:45 +0000
From: "Wang, X" <x.wang@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH] tests/intel/xe_pat: add helper funtion to read PAT table
Thread-Topic: [PATCH] tests/intel/xe_pat: add helper funtion to read PAT table
Thread-Index: AQHcVGumNG+Nf0HaREGmmXeba4VUy7TwLwcQ
Date: Thu, 13 Nov 2025 07:06:45 +0000
Message-ID: <SA3PR11MB8046B745454D1EB92A72522C86CDA@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251113070333.2148502-1-x.wang@intel.com>
In-Reply-To: <20251113070333.2148502-1-x.wang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|PH0PR11MB5064:EE_
x-ms-office365-filtering-correlation-id: e60eb0c1-b655-4161-b3f2-08de228334d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|42112799006|38070700021|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?6a/EF7dekSs9fDkeD5QpijHTB+fq550jy0kkKDq5lKFbXKjSyD8BgjzaX20P?=
 =?us-ascii?Q?IX+5RMer99S4Y463z/di0PpSXUvXFJ9gsBXOpN1ClvdDyPK51eFEFra3+iNA?=
 =?us-ascii?Q?wYt9QGl1rVr5pn1KfJZHY5ESs/1noV5LfEl9hCzWPK8n/TdmeVkLzZWTNqzJ?=
 =?us-ascii?Q?c4fjuw9F+mvgRKt8n/jJ8GAoBqejjZvyCZIo2OI7daMEqklHszHiETIYI9y0?=
 =?us-ascii?Q?6crZfZsT3gdao3d1AH9eM76YV5eAT//0gZsPp8sTQSlnF/41ono+w4tpP86U?=
 =?us-ascii?Q?cvp9OoihKi3ym/dNw5Fv3I1Ul7vOYYZ8364pISfUMx7l6Z/JMgIl2FwCe1Xg?=
 =?us-ascii?Q?1mVTPjNi6uDGUC1oVFK1z6EYdXW+Ql4Uc2a4vpcisDIHDxNUaxOP33zmctsm?=
 =?us-ascii?Q?gmTpfyUA0Gq/SHAvo5Gdvdc05QrNUB+2IwyzwnqVSaqiPOzzBiKT2+o49q+8?=
 =?us-ascii?Q?X71PD8h7pCZf1IQoRNPrsYHXTJn4EJHhtEIvDuDkNKZ1UHqKZ58pedK2bYRK?=
 =?us-ascii?Q?b9N9i++32vNbOSYDH2dowVjlSA/gITJ2kfo1pnDa2JkABkJ5QNzM58ncTe4p?=
 =?us-ascii?Q?0lDhD7MSfErBLy8fDmym/WWvI1QYwWVYNjIZWr0mPaZXhSCe+Wq7dKCgWEF1?=
 =?us-ascii?Q?YdOLrH8lVbeJdRu/J2NI+wI1frncUaIu4+FAd2uY0nvxNrIlN8qezYtaYaDU?=
 =?us-ascii?Q?nNO8j4K+GbraTpHML3CEzOiEhLZEGHUf8aO8J3JRW9RqDOV2lEumcTsTbyL0?=
 =?us-ascii?Q?jJwTpCHOIK7lEuEsldsdwZCqJcRXk1Ks9AJyW3z6z1bpKov8iZQ63f8xRJF9?=
 =?us-ascii?Q?6E/WaLBP1v3r6KJqjRm29n+XTF55CbfLtFBllu1NwuyxZK+E2LC14UFZy8Hw?=
 =?us-ascii?Q?eNc5PTY19tYRA1kcj4AxBy+VQI0uh76+eFcxkbiphNiTUEZkcIpdp6h8w/PE?=
 =?us-ascii?Q?4vgvN8UhDc0K6VG3B5P0Dm5ZlL1S6p0utbj/GhkmKqX2hpwCrzr1c+pzZMMg?=
 =?us-ascii?Q?S8SkLB6YgKHIryf1g4aZtXjnp2lAlFCSstj0X2hJdagSv3WfKR9xXcM/NI6Z?=
 =?us-ascii?Q?hyWI9eoFmzBf8lnoaoSB21yhasKICr3RarcIdNcmIGfnGL1eE4DEZdbEqarZ?=
 =?us-ascii?Q?D9HUHRe9nrGTCys9MkjMZ4PdSwxqKxNDvmv0vFZZGUhmQSzanQ9OoQZam/rE?=
 =?us-ascii?Q?rPBJRFUBxTanJJsum0Or0QqFisl9BJcXEWhW/XaaiFZ7UmVRF6asyr3OVz+l?=
 =?us-ascii?Q?I5Dh/P+1+FnPCq1nI3UqPEirlA+VcC6lNE3QmlZdK1eOVo8a2wR1kj1oiWzZ?=
 =?us-ascii?Q?xy62BEEWNL6cqn9PJ1fhhM7XdZ96ZrWDY4+Nr+H81LfxYqsyzhSiZrLV/IPD?=
 =?us-ascii?Q?5bb5wXufZnZaG4otoOifY+yZiMd50P4XqRq4BYh+cGNqk88UK0vJzVuW9ymu?=
 =?us-ascii?Q?4qOm7n5S9U+JJ5quXW0OaUlK8+32jGOqH0eIBAdEn3UVTSbencYVqU5ZpnA7?=
 =?us-ascii?Q?3Kpfds4Ss/s0VV/jXF0/+MsEtQpJXBq7GX/N?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(42112799006)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?R+HhQF0d9XnFzMU2eCUuQsZ50ch/LriEc99DVDX/hp5/lUsW563tK5WVxyT+?=
 =?us-ascii?Q?/Fv25YqDu9dAqEgwYXVA8M0EJzxe1kvZURAJwIegc2Blp9KXjl6FnoE8Ufjo?=
 =?us-ascii?Q?3EUVWae/G14DDN0Y7Bbm5/jbpbEGOQ8evm2ljVNFingcJIPjxWAau6of0LS9?=
 =?us-ascii?Q?4cZN4LQyHetrjVBayNatSNKE3gxyW0NVY1d2PoVpAsjdupVjT2/+M8xjZuED?=
 =?us-ascii?Q?w8Wmqm6MEpZWyjTZizb0a7ZyyhEVtQo1DxEDChZpjT22oD5pj3ruiUsXjsUG?=
 =?us-ascii?Q?UQFZhOJLMjDssBRG1adlYlUCdODqj6D6ctYs1MRDum3Ph9QKESez+9hzyrR9?=
 =?us-ascii?Q?N7lWYfRn14N9aQ7elZqjluKuFrWKXu3Jash8MJb5GxbWxciBOCTZGHIsaDfI?=
 =?us-ascii?Q?LtataLiTugpFo0M5FZz9yqOtE+6ooUq81sShY3cUy+VNk0IT3zzDTEYhB54u?=
 =?us-ascii?Q?lhfE+ZqgtYfzMhVKpKWY6bQSX/R2Zn3kYGYIY86xn38QACAhzRJylYD2dMR6?=
 =?us-ascii?Q?Y0qp6f76hjpEX4EnDivEeSb2tUBvl7VqoJ20tkU3q69wiuLG7AXnP1MX9LRi?=
 =?us-ascii?Q?VcY5t8VpU7JGiJMTdnSbjq8ZN3a/kCUljur5fDFANkYNXbPb3MsSYX9g7ETB?=
 =?us-ascii?Q?rF+fwgkTiEQbK04EEccgUpsp/uLXOOGEkmhO1EUeogio7Np2rOnL4/9C1Ghr?=
 =?us-ascii?Q?rlR6lvvQcMDi26t56Mr/oJNi+GqsAEoxsVOTbrdiZBnq2uiqa/ySPYL1WfNd?=
 =?us-ascii?Q?70jD59KX0bW4LybOaQ20VchXD39Bo972GoQivW6ydbk5mnO3gIHWKzMETMAP?=
 =?us-ascii?Q?IQfST08CgXGa/mRiQcqDL2uzujj1nnVleLi58AqF9UKzZvgrCi5LYDfPszcP?=
 =?us-ascii?Q?O+cnM1V4/6OoIeJhBaqBhNWNDIDsAqRln2deQj0hcxuMZz0P346sgLNw9QPN?=
 =?us-ascii?Q?tH7eHedbmU/hcyuziG2WpwVACo207CVpKVTxNh2rnrjOnzL/GHYTMjgYfE0n?=
 =?us-ascii?Q?vF00tc1b34wammwFmnRGbhkhF0bjnGWOlNJRKo8l37v3sU9Tt317T1ZgQNF3?=
 =?us-ascii?Q?hBPGO08zJGK/6eawlUfQl8REFUBAs0GHIr/ftk4PyflHUrXIdRhN4PyOC65e?=
 =?us-ascii?Q?XBruZsg9Zt4WLSYhKyOCGChVL+RxMd0rA9+DzanBLbnjbnm/++zWxyT026AA?=
 =?us-ascii?Q?681hfcT4kcn2Jeg5s5H5fJgOgYDk32v2sf3jPzzQXv1KlPzvvoY8W3ltHBTx?=
 =?us-ascii?Q?1gCsNoBo1h+3+hW3Eiad6uNpsWcrldv8N7cgh2d9PS07gqoWWjMJbUf+feJz?=
 =?us-ascii?Q?sj6N6jk7xJfKGGLF535S9DVf5sOnvyZDt2NgfUbRmOTrbkEy/2KsfbMAG0zO?=
 =?us-ascii?Q?NFD8OYmEWb1MQpgHChFPRVixbuPjganTsKmcps/v93W3BBxO18km0XwfvGsq?=
 =?us-ascii?Q?dUtfFpVojJ3gE+X4eFmC+fdEfXDCribio+4YaWpa+CZrkL9P0IqnKNqvd2Hj?=
 =?us-ascii?Q?Dt9pMR5sZWSVvbxt7WyRVYj38L9oWlJN7tC2VcKQmbbDZrHLb3w0YgpeOfp/?=
 =?us-ascii?Q?DXPiTZwFH597V0QFLTEOFogV8WH6iYI6dy3vBNEwVFZ0Zx3UDxehgSUM63cj?=
 =?us-ascii?Q?H9d81jvxybaQvbe4kHhLXMY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e60eb0c1-b655-4161-b3f2-08de228334d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 07:06:45.5035 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8MJZFC50D3fofJNE0jGBmBssZ8liJmA2sREQTQAKocszOQmtnprxXSYmSM2UWIkBfn2bTe42yS72DQ1UqEsksA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5064
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

Sent to wrong mail list. Pls ignore this.

> -----Original Message-----
> From: Wang, X <x.wang@intel.com>
> Sent: Wednesday, November 12, 2025 23:04
> To: intel-xe@lists.freedesktop.org
> Cc: Wang, X <x.wang@intel.com>; Auld, Matthew <matthew.auld@intel.com>
> Subject: [PATCH] tests/intel/xe_pat: add helper funtion to read PAT table
>=20
> Added a helper function to read and parse PAT entries from the debugfs fi=
le,
> including decoding of PAT fields and reserved entry info.
>=20
> Updates the pat_index_all test to utilize the parsed PAT table for more
> accurate detection of hardware-reserved PAT indices on Gen20+ devices, an=
d
> prints detailed PAT entry information for debugging.
>=20
> CC: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  tests/intel/xe_pat.c | 118 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 116 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c index
> 59dfb6b11..36d429c97 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -77,6 +77,96 @@ static void userptr_coh_none(int fd)
>  	xe_vm_destroy(fd, vm);
>  }
>=20
> +#define BITS_TO(n)		(n >=3D sizeof(long) * 8 ? ~0 : (1UL << (n)) - 1)
> +#define BITMASK(high, low)	(uint32_t)(BITS_TO(high+1) & ~BITS_TO(low))
> +#define FIELD_GET(val, high, low)	(((val) & (BITMASK(high, low))) >>
> (low))
> +#define FIELD_GET_BIT(val, n)		FIELD_GET(val, n, n)
> +
> +#define XE_NO_PROMOTE(val)	FIELD_GET_BIT(val, 10)
> +#define XE_COMP_EN(val)		FIELD_GET_BIT(val, 9)
> +#define XE_L3_CLOS(val)		FIELD_GET(val, 7, 6)
> +#define XE_L3_POLICY(val)	FIELD_GET(val, 5, 4)
> +#define XE_L4_POLICY(val)	FIELD_GET(val, 3, 2)
> +#define XE_COH_MODE(val)	FIELD_GET(val, 1, 0)
> +
> +#define XE_PAT_MAX_ENTRIES 32
> +
> +struct xe_pat_table_entry {
> +	uint32_t pat;
> +	bool reserved;
> +};
> +
> +/**
> + * xe_read_pat_table - Helper function to read PAT (Page Attribute
> +Table) entries
> + * from a debugfs file
> + *
> + * @drm_fd: DRM device fd to use with igt_debugfs_open
> + * @debugfs_name: filename under device debugfs (e.g. "gt0/pat")
> + * @xe_pat_table: Pointer to an array where the read PAT entries will
> +be stored
> + * @max_entries: Maximum number of PAT entries to read into the table
> + *
> + * Returns: The number of PAT entries successfully read, or a negative e=
rror
> + *          code on failure (-EINVAL if debugfs_name is NULL, -ENOENT or=
 -errno
> otherwise)
> + */
> +static int32_t xe_read_pat_table(int drm_fd, const char *debugfs_name,
> +				 struct xe_pat_table_entry *xe_pat_table,
> uint8_t max_entries) {
> +	char *line =3D NULL;
> +	size_t len =3D 0;
> +	ssize_t read;
> +	int32_t parsed =3D 0;
> +	int fd;
> +	FILE *f =3D NULL;
> +
> +	if (!debugfs_name)
> +		return -EINVAL;
> +
> +	fd =3D igt_debugfs_open(drm_fd, debugfs_name, O_RDONLY);
> +	if (fd < 0)
> +		return -ENOENT;
> +	f =3D fdopen(fd, "r");
> +	if (!f) {
> +		close(fd);
> +		return -errno;
> +	}
> +
> +	while ((read =3D getline(&line, &len, f)) !=3D -1) {
> +		char *p, *s;
> +		const char *patterns[] =3D {"]", "=3D", "[", ",", "]", "("};
> +		bool found_all =3D true;
> +		uint32_t hv =3D 0;
> +
> +		/* search the pattern: PAT[ 0] =3D [ 0, 0, 0, 0, 0 ]  (     0x0) */
> +		if (strncmp(line, "PAT[", 4) !=3D 0)
> +			continue;
> +
> +		s =3D line + 4;
> +		for (int i =3D 0; i < ARRAY_SIZE(patterns); i++) {
> +			p =3D strchr(s, patterns[i][0]);
> +			if (!p) {
> +				found_all =3D false;
> +				break;
> +			}
> +			s =3D p;
> +		}
> +
> +		if (!found_all)
> +			continue;
> +
> +		if (sscanf(s, "(%x", &hv) =3D=3D 1) {
> +			if (xe_pat_table && parsed < max_entries) {
> +				xe_pat_table[parsed].pat =3D hv;
> +				xe_pat_table[parsed++].reserved =3D strchr(s,
> '*') !=3D NULL;
> +			}
> +		}
> +	}
> +
> +	free(line);
> +	fclose(f);
> +
> +	return parsed;
> +}
> +
>  /**
>   * SUBTEST: pat-index-all
>   * Test category: functionality test
> @@ -86,6 +176,7 @@ static void pat_index_all(int fd)  {
>  	uint16_t dev_id =3D intel_get_drm_devid(fd);
>  	size_t size =3D xe_get_default_alignment(fd);
> +	struct xe_pat_table_entry xe_pat_table[XE_PAT_MAX_ENTRIES] =3D {0};
>  	uint32_t vm, bo;
>  	uint8_t pat_index;
>=20
> @@ -114,10 +205,33 @@ static void pat_index_all(int fd)
>=20
>  	igt_assert(intel_get_max_pat_index(fd));
>=20
> +	if (intel_gen(dev_id) >=3D 20) {
> +		/* Read and decode the PAT entries from debugfs */
> +		int32_t pat_entries =3D xe_read_pat_table(fd, "gt0/pat",
> xe_pat_table, XE_PAT_MAX_ENTRIES);
> +		igt_assert(pat_entries > 0 && pat_entries <=3D
> XE_PAT_MAX_ENTRIES);
> +
> +		for (int i =3D 0; i < pat_entries; i++) {
> +			uint32_t pat =3D xe_pat_table[i].pat;
> +			igt_debug("PAT[%2d] =3D [ %u, %u, %u, %u, %u, %u]
> (%#8x)%s\n", i,
> +				  XE_NO_PROMOTE(pat),
> +				  XE_COMP_EN(pat),
> +				  XE_L3_CLOS(pat),
> +				  XE_L3_POLICY(pat),
> +				  XE_L4_POLICY(pat),
> +				  XE_COH_MODE(pat),
> +				  pat,
> +				  xe_pat_table[i].reserved ? " *" : "");
> +		}
> +		igt_assert(pat_entries =3D=3D intel_get_max_pat_index(fd) + 1);
> +	}
> +
>  	for (pat_index =3D 0; pat_index <=3D intel_get_max_pat_index(fd);
>  	     pat_index++) {
> -		if (intel_get_device_info(dev_id)->graphics_ver >=3D 20 &&
> -		    pat_index >=3D 16 && pat_index <=3D 19) { /* hw reserved */
> +
> +		bool hw_reserved =3D intel_gen(dev_id) >=3D 20 ?
> +			      xe_pat_table[pat_index].reserved : false;
> +
> +		if (hw_reserved) {
>  			igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0,
> 0x40000,
>  						   size,
> DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
>  						   pat_index, 0),
> --
> 2.43.0

