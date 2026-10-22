Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC807606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 07:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZVlQJCTg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91EC910E363;
	Thu, 22 Oct 2026 07:02:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF6910E363
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 07:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792652527; x=1824188527;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U1B48wJ0CmtvpR3TMp1CJJxjjlvQkyL8RxuLdeO9wv0=;
 b=ZVlQJCTgirnzzslpN2HnprWdfqqZl1uWIJTH2ViU6DMBdGI7xJ3HRq+v
 OdMoU5Et1O2sDUwMRXU33HAbfsBwsa2Z3K6nUyUMgcsuUzdypeuXjjEK+
 p+NPf+v42wnGTJdyEkQ2hFzb2/OCo5JSvvPZ3E8vp6LvKUQwALZ9KiEFV
 W3ucc3l2cB6E3L2/f7AQMxB9S5edc1rF1uR68BAz3kvwxp7ea/pLDVqPw
 1vLOC2Bhai6AGyanQdkZlHGRZf2qQq+IdHYycWKhh2ps7Aj9tfHywApXJ
 1LWH/e+mTb7nPZVmeZDH/XLbOd1K25VYGFisau04yNG62yZNF+Y1CtO0h Q==;
X-CSE-ConnectionGUID: hvq3tghjSw65PDqKMly7Lw==
X-CSE-MsgGUID: N1YD7XodT0qUcunhHEkxEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1291308"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1291308"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 00:02:07 -0700
X-CSE-ConnectionGUID: gWJPOo6ARcCRY/rXK5n3qQ==
X-CSE-MsgGUID: TUohIah5THCyDz8L9/SD/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3235486"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 00:02:06 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 00:02:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 00:02:05 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 00:02:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpWhJE8Y69EuoGi5FNAy8nTITfRF1nwwr+NiRudk3AHBaA5DLRDWr50ELAyunoTQgtFdB72p8tSV46l0JnM5lFpBzNsB/k83y8siB4QmRweMNXifFaGcD7rp8WDIBqXiuIpwgZ4bJ7xaYFCGlWoeuLupb8OgqP1ziF8iUHlHoEAjx/hsvyLcDy+4kuOnFda5MkAivN48SL/2w75NmoBwNcSK6vbTEOGM8eBJBepOGsOfuuByF9Jd4BS5crtZwqHxgQvE7YEmaJyJLlOrn6wwXz+xZZjKlmdlOAqYMAwhB7zvE1RGMgRJJ5mZwl40hvzgnG9iUHVFTJJqSGSA5AD3Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qx8JnxLAdIV4ugrKME2J/NlW5/EJ556NOXZIMK/0R3I=;
 b=mgaMh3NNjG6ftrkeqExuLZJ7vAamHeKMVlL1aW06rHINWCunusaQRu1ZIUFBZ+fYTebn9uOoZ27PLlj88ds/HDUnjMYpLPlYoF9EXkeDskWKW/p9DhTqDeBKtp6coBRi8IciDvXujU+oD2orXFP+w5hlq1DbfgFkl+lHXpCqeKWj9BWgLnRHVfFjrpfzSlTfw6w1MUiI4aKa+YehL0AIsWzwZbSjbrPj5w8vu1zPM3K/hbDIY741NquAZrUWvGBzzlxwkO9kTwc4wmDEsIFSz1M1On/GpTOtPYWmz+eBEfPhqzqYkQbStGYH71OBPT/ZVc+7yaYrW6AW+x9QyjZAGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by LVWPR11MB9907.namprd11.prod.outlook.com (2603:10b6:408:3c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 07:02:02 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0496.021; Thu, 22 Oct 2026
 07:02:02 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Subject: RE: [PATCH v2 3/3] drm/xe/pat: always check is_valid() when querying
 an index
Thread-Topic: [PATCH v2 3/3] drm/xe/pat: always check is_valid() when querying
 an index
Thread-Index: AQHdXLxSoAaOe3Ri/EObgYK+Rwq+ZLcJLDBw
Date: Thu, 22 Oct 2026 07:02:02 +0000
Message-ID: <DS0PR11MB87185E444C2C6085230F750681652@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261015154553.483229-5-matthew.auld@intel.com>
 <20261015154553.483229-8-matthew.auld@intel.com>
In-Reply-To: <20261015154553.483229-8-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|LVWPR11MB9907:EE_
x-ms-office365-filtering-correlation-id: 1aba887b-a0c2-4e13-16c0-08df300a5fc8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|38070700021|261021123027099003|56012099006|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003|261021121427099003;
x-microsoft-antispam-message-info: zUd8m6CTWUdrecbR20IrloYTxqv2Ynfsm7TkNVMbKWMYz2R9lRDRszwdpMabOJsTDOwqs94bkhxQqLGmRb+wktA3ZiG3OHmk+MTp8EQ7E86o+7xz4WawLx1zd+QgGs9CYWojW0eF7HcylLqzluDfu23BiZSdkm4hEGV2phhBs/PhCenltphPtHhv6RyZuKqYfGyAVGLwXQ+jSJFvB0Nq7SCVgCq1UbZyPJXV7cK7Tb23/bVnI7J/Fr/zLRpXxjUl5X3rf6C8+J+LfSZBvQYSHb//KcbhsoeFDCOf8+JtELOJNtfHtK7C9Y9I5UdlcLheBUjU4vQ5G3d7WVqauLpUeDS6i8ZYeDJgTtvEgzQHu6maJOae6pTeRNXOxrnPCOvQIn6LvUj2pjMMBdGnOZGmU3z+3o/rj3AVrZeQN4eqaUfGInYxveShpawrKTqPRPWSMiHkeLuggvQBG8PPb184c7wfRemWUJzLEKtiSMCPZGAVF+8KVl2n+124GpfyleeXHVhE+wdYe9WOjaFMI5dwMUagpk9dtWY+oQZB7rfvBGGBekcOt+Vu+Vzy7MVNrUhkmTzeuCk1S7XHRmW6ZAgTkb6kImw9K6fvFmgDdLrv7pJ3D+RjmlaBn132kR9sqyJOGbGE6LR+6ThSEhl/mwZ5gBmZN4L0yIQO3FU6xCtpuwJGen8lqiQXvaZ62zywyKdAi3Ok2RO2r0OpRbBbEkKNsqNe4kZSruYdrrbmabqH554=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(38070700021)(261021123027099003)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gDdD4bP9yGKgyb4PJ/W3g08so8/OvY1Qt/k+ZGTHtmuQ+p+MoGyZSwYQFmeH?=
 =?us-ascii?Q?pYgr1GHtTQ5RbuQd2Bn6T2vE1/dJkUKijfq3QphbGoYnoc4CL7Fwos7OC0OS?=
 =?us-ascii?Q?61l4KWPiUIES5MgiIfBQX8aWd6VnZndAAFOQEMdyEOcIJa8zw1gvJrJH08Kz?=
 =?us-ascii?Q?oAxdGyesaAkHw+4JHxiX4EaZQoMSylQb8plvqnYGV4dxox3GQE1+yHQ17L6G?=
 =?us-ascii?Q?1NxJpIKiTQtydADvC/a3RlWXHze6c+v16e86JyzE16lDDElnpSap2Fqe5q7D?=
 =?us-ascii?Q?CFrPS83+jkNgZ8kNVHaaAiuPLhQQomHT3FerbVYEX3xQLqeonpHjLKWx/wqL?=
 =?us-ascii?Q?Qplll3DHH9B7hQpyjvVE4ALaUzhEJ5QyncTasfy6HrW2Bniq1GlfqxMjIsT3?=
 =?us-ascii?Q?TCIkRebk/t5CUC2hTpw+pzCVHoUZMO0GlpByYpJIwU92r8tfdvPX2q0FsQ9i?=
 =?us-ascii?Q?VKSkpD606QdRoC4L4bGDNPAvGAsHqxZGHEPpDiP5HAjXJxCncb+e+WLf0Jq+?=
 =?us-ascii?Q?zGn4GQLnfCNdnEDlP0E1fEXHTxiIJjkJrGuEremM/OrKAPNyyf2a0YWqVoh2?=
 =?us-ascii?Q?A/4Ro475iG0u3Qyx/C+Rc5X5eDcESW6amv+xh6IVvRRQBAPgLf3kEN88uBvv?=
 =?us-ascii?Q?sH6u4J/rA2ALwpOpN/iYoqUYowgv56rIKZSYXeDA5HbIm1m5EFSjJxoY5Cq9?=
 =?us-ascii?Q?tTi5CVjReImMz64WExrUU1RMfu+HmGaXRgC8aWyPHOuq3dbgeY3BrHFmuN5K?=
 =?us-ascii?Q?gji0vBe09Jrk8Z0+iNc4a+VhguBzfmWiIYIIvrkI5kt3rKJUbJvAOUbH6Z+I?=
 =?us-ascii?Q?h7DbLgcolErDnsAibF21bRFW5UyCgOi8YIhDo98ucQ2DFOpTjF/kMaMoExJz?=
 =?us-ascii?Q?X2izIxjefpGdcDh7f/l783BAiGGeL6iCpdt8FgUxUJwpzr7UAxWPPEABnH92?=
 =?us-ascii?Q?Z1wvfTFyUVPy6LO3c7fw0luxzl+n6iAo6v1P8QObj/P5BYEjRmdSxB3wocgR?=
 =?us-ascii?Q?Hik60AjjBP4svg4Napbit4bd+Oj5+MAvSYie6VYDKxwjK5SDH4569e/esywx?=
 =?us-ascii?Q?Knfj3n45jxm95exwhc7LAqY885v0vkmE8owIArhCYueW9z2u3jU/RFyMgbr0?=
 =?us-ascii?Q?UPXC2Z+Mk9DibzZW+Aew+QQ8m7M1WCFUC1inXuLGR/0ETo3Luh1fMIxU6KLW?=
 =?us-ascii?Q?r8ZQ84ArupQTLG5EZ1LyhtKuCbemmEYWqRJf6A9op+7iDhJx2LZ4I/Lv5KTH?=
 =?us-ascii?Q?aqCWwl7ZAY3YD6yduQvCzdQqBsC8Htuu4Umi5IrpkWmzuHLOZXP35+dMfmNW?=
 =?us-ascii?Q?RCLphZ3Li3+QEUTOTWBKdYAxlmhoMUSDowCUdBWrrmuAyWgOzktyqr/lqgER?=
 =?us-ascii?Q?ZFbFctfRa7oNYzL8732JCUO6cBWVf7CSJ5cZCfa+0makOZpYesQgnEzb9i7h?=
 =?us-ascii?Q?THB7b5QJjIoyXIA7ohMUt5n6PAL/vXTb8fGnyeW97kpxlv26NLwDeJkZIseB?=
 =?us-ascii?Q?E3BpOggxoGbbfgx3C0ynrJsYJ17zZgKyWGMAvO7qC522Zu5JVhicaphCHRvy?=
 =?us-ascii?Q?OSdErD5C/kjIBhiihFcAGAh5YYF0m5RZ3NAilfqoJVo3DG1EKY8eBzAUp6d3?=
 =?us-ascii?Q?vLqqSRK4mpTRKvOSPzxQS13EDlvxOe3wEoOLhpcpv5zk6e8vamD/6SuLg5Fm?=
 =?us-ascii?Q?iA7gaKNg0kbg27HJ0ZFBTjF+AUSw2cs4RP799QTdaLbZsxIze6OWGvjgb3qA?=
 =?us-ascii?Q?1G3JVSHb8g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dDAoDBnSnxJYElpXn6irhhAu585C+3Vbm559NrqgeYnOR61sgeCr7sK122hx1GgSm7ijAu7wc0ZbfppUixt2OTdKNNXuNbFbfYxQBLeashc07J7U/QZZZW8rT6qspQsxHboHbykyNAkrNc6M8ichiEO/zzRuY+JfH1llUPhnIe0+3mknjkHMP6n+e+8h0ApYdBnaTIZNXP0BBx7zoTjrlEbpjAhFnGHSpceF0EFiu1pC3ZSOM2ExabDhn51M1wG/E62ecFDko4fIzIvK0tMqBUhkm11u6Z8RHq1opg4z69X9SAH9UOLxcPb0Ba2Z0F1jpt3vgBZdZtvLC+Fs6CEmhQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aba887b-a0c2-4e13-16c0-08df300a5fc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 07:02:02.4629 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jxW+/Id/4BpsY12gu4jYTl/1Zn/j9tHyUfF8WzZ1dxQNS6rk0npzTfuIwZpazmhmBkIRZd0C3Lmumb79wciyJ8HaL6Xe3MHPiklvKzYwW9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVWPR11MB9907
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Auld, Matthew <matthew.auld@intel.com>
> Sent: 15 October 2026 21:16
> To: intel-xe@lists.freedesktop.org
> Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Upadh=
yay,
> Tejas <tejas.upadhyay@intel.com>
> Subject: [PATCH v2 3/3] drm/xe/pat: always check is_valid() when querying=
 an
> index
>=20
> Make the bevaviour consistent. If trying to extract comp or l3 on an unkn=
own
> index, just treat as a programmer error, like we already do for coh_mode
> (implicit).
>=20
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pat.c | 6 +++---
>  drivers/gpu/drm/xe/xe_pat.h | 3 ++-
>  2 files changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c in=
dex
> d239693b803b..1189d7255c12 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -303,7 +303,7 @@ bool xe_pat_index_is_valid(struct xe_device *xe, u16
> pat_index)
>=20
>  u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)  {
> -	WARN_ON(pat_index >=3D xe->pat.n_entries);
> +	WARN_ON(!xe_pat_index_is_valid(xe, pat_index));

Multiple WARN_ON!
Should we change API:
bool xe_pat_index_is_valid(struct xe_device *xe, u16 pat_index)
{
    if (WARN_ON(pat_index >=3D xe->pat.n_entries))
        return false;
    return xe->pat.table[pat_index].valid;
}

Tejas

>  	WARN_ON(!xe->pat.table[pat_index].coh_mode ||
>  		xe->pat.table[pat_index].coh_mode > XE_COH_2WAY);
>  	return xe->pat.table[pat_index].coh_mode;
> @@ -311,13 +311,13 @@ u16 xe_pat_index_get_coh_mode(struct xe_device
> *xe, u16 pat_index)
>=20
>  bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index)  {
> -	WARN_ON(pat_index >=3D xe->pat.n_entries);
> +	WARN_ON(!xe_pat_index_is_valid(xe, pat_index));
>  	return !!(xe->pat.table[pat_index].value & XE2_COMP_EN);  }
>=20
>  u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index)  {
> -	WARN_ON(pat_index >=3D xe->pat.n_entries);
> +	WARN_ON(!xe_pat_index_is_valid(xe, pat_index));
>=20
>  	return REG_FIELD_GET(XE2_L3_POLICY, xe-
> >pat.table[pat_index].value);  } diff --git a/drivers/gpu/drm/xe/xe_pat.h
> b/drivers/gpu/drm/xe/xe_pat.h index f6b0fac2000a..de4d57ef9a4e 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -75,7 +75,7 @@ u16 xe_pat_index_get_coh_mode(struct xe_device *xe,
> u16 pat_index);
>=20
>  /**
>   * xe_pat_index_get_comp_en - Extract the compression enable flag for
> - * the given pat_index.
> + * the given pat_index. Index must be valid for the hw.
>   * @xe: xe device
>   * @pat_index: The pat_index to query
>   *
> @@ -88,6 +88,7 @@ bool xe_pat_index_get_comp_en(struct xe_device *xe,
> u16 pat_index);
>  #define XE_L3_POLICY_UC		3 /* Uncached */
>  /**
>   * xe_pat_index_get_l3_policy - Extract the L3 policy for the given pat_=
index.
> + * Index must be valid for the hw.
>   * @xe: xe device
>   * @pat_index: The pat_index to query
>   */
> --
> 2.56.0

