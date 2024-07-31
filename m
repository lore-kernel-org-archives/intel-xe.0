Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE35C3DA64
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 21:12:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21EDA10E6CC;
	Wed, 31 Jul 2024 21:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HyCxYrHK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B589F10E6CC
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jul 2024 21:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722460372; x=1753996372;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5saYoJ5tGpzXyGk5rwVdKolasnBn4ZJ0NOY4NZR1pII=;
 b=HyCxYrHKWB/acHabGUCCd6lYUh8wDuzgUojAeL8h2kGzGdMyiza/0luQ
 /aPnU4SutI3rOCRsr83exDP+/+sgGDHF5vEmmwOmXzg+paiixv4gvyyMy
 MWx9zzC6jcVNDfjxuDZq4NMjU4lWb3pmpIJTpXFK7xTn71TNWrF+BOQQ5
 rGwVWOXYsn1NHF0xoId+xRuNrhhebJ6oya/r9C1WZ/xF/dCkGCcVn45lS
 TsCx6s74upTjcLDp9i1SwL/s/VkfQsiJhA8OA0Y3KAxhdaBYcXLcTpxgC
 IJUdvwssLpK6WlmBeb4Fk630WMo5I0kqr9x9A/CxR+Kk2jbXPqaRgENOU A==;
X-CSE-ConnectionGUID: CrX1nbRKTeak70yRKBL60w==
X-CSE-MsgGUID: kqyqSNTxSWyrIMYGwunFMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20527483"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="20527483"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 14:12:51 -0700
X-CSE-ConnectionGUID: eeSKUG1BSMO+0J01BgzEdg==
X-CSE-MsgGUID: bQRYcM0oQMyDv+c8u68eew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54706183"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 14:12:52 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 14:12:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 14:12:51 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 14:12:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTBiXndBu0q+tH9HiRtZwx1ZElvGhnJLdal71f6TRr13NBGjMSJprG06425NRAMNVUcwu2UBYv7NEdOWIgKXxF6FVvq2vB7NvWZ+9Dy2vyiDkwAT2SYoXDrBBEeUcx8t71eTw5BjjXTVOT4BeWfAc7G19ZesJneo21AvmQ0a5njKBDUAaMm0rk/pdQvTT4D5iSg+tBEUBixPYUyYFLWGZm5XhH11Om5/ii7Jbpt/RbMYRhrAGFYIEDJ8CBDFi+oEp83DtZZ7+FhJPlI8McNcXKs8abtykLFHOYclXp5K2E/jvzusnrJ0+YeELavJQ+Rr1NkQn9sW/34YVuWQ8rp48w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRB/caTedxymVUD1dLQjThsTS1At74keXQp1c8C4xT0=;
 b=DCNJ/Xdq49eWknnE39cCY2LBCFU2zeSxrhURErzwK3W1hrv0fa3bdAI/JjmA1chS74kLQLza8JEbhr5IWZm3YSNvO8b0yKnQZQRZ8HTwPVDpQ8XcQfpXW71jSR/3fYNDfSiAFZGGYyUJyaA9f1E7TVai5TAUzak49qqGPqKNKLBdjWQ0D+jle4sjaJMz76O3TltMIO3h7oSE0bd6c8YHrI8metSahnLKtdNZ/PlRmOOiNbdD6iD308XDZqbEN/DD5xqxcuTHnBF8vnro9/RXUcH9yTkGCa6T7ysqluELLYORDLr3AZUX2K/4ZXKmDTKb/3z0e0pvhZQk5h7Bmlm3iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB6545.namprd11.prod.outlook.com (2603:10b6:510:213::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Wed, 31 Jul
 2024 21:12:46 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.021; Wed, 31 Jul 2024
 21:12:46 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Poosa, Karthik" <karthik.poosa@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] drm/xe/hwmon: Fix PL1 disable flow in
 xe_hwmon_power_max_write
Thread-Topic: [PATCH i-g-t] drm/xe/hwmon: Fix PL1 disable flow in
 xe_hwmon_power_max_write
Thread-Index: AQHa42jbiI9i7fDh6EuP4uZevpStMbIRVYEg
Date: Wed, 31 Jul 2024 21:12:46 +0000
Message-ID: <CH0PR11MB5444A1214D4E9B19199D7E6AE5B12@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240731165636.1401533-1-karthik.poosa@intel.com>
In-Reply-To: <20240731165636.1401533-1-karthik.poosa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB6545:EE_
x-ms-office365-filtering-correlation-id: 32043c05-92f5-4d91-dbfc-08dcb1a586ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?1aiPbU/EpacuC7NIf2PcGuJDLf4qOgcGxRJfoGBOcgIZi5Sm3/uZ/7l68ZiO?=
 =?us-ascii?Q?kIs1E5m/x9mEHu0Tu0t/ZF+5P6xGrYFfefIrqY+64/YiFdvRcVPi0S4UmTXI?=
 =?us-ascii?Q?7Ownax9fh/EjhEKQs7qFFVXPrILhwVgRhUO7tHQ7tJ6R0G9T1kuyxQQiOTC3?=
 =?us-ascii?Q?08crseT7SXS9Vfxeggn2sTmayGk353RI/dS61e4XFifLmsXyefL4GYeMAz17?=
 =?us-ascii?Q?j6e3LatbLq+kRWR1ffevIRRofIzozbccJNA0OG9wa0rJ0+UwnYDWSSlwZg0o?=
 =?us-ascii?Q?7FbDbtQzXWyqsba83ucNAZtIz+4M+yvLeQ3grMWBX92eIYEJSNjvIJJgaAOi?=
 =?us-ascii?Q?JcwfPrTXMxprdeurZLW06aSjR4908sH0YbaRmieHeRv1RpUuNpgOs8cVi4tZ?=
 =?us-ascii?Q?4NTbVR3Q51pIjiKkeywnTbuIIy18MHFuT5gjqzivWTJ1TCmYN6Ygp2JAaLlj?=
 =?us-ascii?Q?d3x1hOeRnTtd+0oaqgpPe5uAM5TYN2RL/zY3rzgCVhEls7KTc621h0dz8K16?=
 =?us-ascii?Q?5yvXYMYL7v49xrQf6bmPjCA+R8W2lUYZNnTCm9HYPxVYUIGNBoOM3P2v1FSd?=
 =?us-ascii?Q?z06B/irAgMOZV/VobRE+ObMPUO0y8x9tqpwiwFr0SKNygFpoUd6Jny/+Yglb?=
 =?us-ascii?Q?23qg/YtJb8kxZunrf+diGAOqwX/EMiQlTW6UP+SaRAIBTTa+zJzHQqEkkEJ3?=
 =?us-ascii?Q?MDkdeh2T9YRbsPO2gIoG6FcUmAYwM8iaMg/ukZTZ0tHKGf9CirEt8q6a5I0i?=
 =?us-ascii?Q?+kJJUydCNz4ntKILsK6nnH10GSotpKBcd47j3Jp76gLPlJ2xRV3Eq5k22wl5?=
 =?us-ascii?Q?TU+Yh1UuX9yhXwLIh7jii9Cm5EQKtoXaTf8mroYiz59p9TUIIUtokrcx1C9W?=
 =?us-ascii?Q?pCYM6YQQa3Tv/rqbL9+efU1EmIi61dJuAw6G+c9VpzVP2AOExzDrsR6rpIqM?=
 =?us-ascii?Q?WvpwxxNFhjNRNafoK1Z72IAGybsOQECxBBhBzwOlDXL3T4UMPdJgmRJjnxKo?=
 =?us-ascii?Q?hoPG9eCtVExTc9jAmDATuM/X28HNtV9xA+D10fgAh+UaC9HVhMPoPX4MlN70?=
 =?us-ascii?Q?dt9VuUtZKXnFNSrOrGBk0Y9ewruP0C0OgehT0gelCtjoztbQ9n/gOGC0hBV2?=
 =?us-ascii?Q?Pfz1lssmLWVMdmWFdgZ86UwxYsXK/CcbEE4DHg63u+N12/iStR89QIbZTwMG?=
 =?us-ascii?Q?327gAEbys1+jGlzSrI1Fd8H8GJjx9eUGAhVF1nRw8mldNtH/H37kc1pyhJsS?=
 =?us-ascii?Q?+eNmrf/izCBxm5SBbPqJcvg8VBHFZdW2DYu01Vn00gpBOP2cHYD6tV4CxQVQ?=
 =?us-ascii?Q?jku51gv6cB+Rr94lUkLyqHHHa89JMxFNIQDeYrbS+gAsanX9tIIj5vrxDn5I?=
 =?us-ascii?Q?Vdm4K/fHyq1GSO7789CKbzJrUBCJIQgCPiHyeu/LWE3FVH6F9w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?B8RQf9wuuGtqZQA76WWHSqMqM2BoSyjn9vOHroIWloMq+5i1BHasjszFTHiw?=
 =?us-ascii?Q?MKMVtH47qwCkhgJcMjpF8C5g7Gegtt65tCA1qvA++V2Bhg93Ul+kRWlWQNvo?=
 =?us-ascii?Q?1ttkY/yrxPyX8LgP+O2wA7Kf2ScoaxtoHeCfVncybO1Y0C8yuwMwffxaLBFo?=
 =?us-ascii?Q?tgO8ntBNVfFnxITE2dbyi66kJeDEVrs0MjuGV+w9/0DGB+QwQX6je6/7eDNU?=
 =?us-ascii?Q?yVkqIxn2CCHHg3uViymxX01cOLArslAaBFf5iW8CtqZK/RQ0fOkdFL0wfXuM?=
 =?us-ascii?Q?DaDEbK77JfXYSUP/psQPpDysrl/EbhDTN5rMGCGBLU85rSjAlzQCVHoeEYH5?=
 =?us-ascii?Q?Rqc/0xznckW8EwyqgYSAYCWpl45WcnAVhzdjDW+2T2/5ft5z7Fay3gD0887H?=
 =?us-ascii?Q?VfCA8e8GYYwF4HnzfWMuO0h40BF5VkQ/b/mrGdiCv7JGgWobhFqKGMQ3IByR?=
 =?us-ascii?Q?pKWr5Fr5WjnwQI5YxLuMgo4KkpJNxzZzzovfPRoGtYkYm/y5H2zU5mTkaaiW?=
 =?us-ascii?Q?XdgsP0RsLQiKD9kTapVBoH/kXaSF8pDEnzX70027guS6Cha2WxiMS5EdfMUY?=
 =?us-ascii?Q?WPiS5HDTFdSUiKYqUvOmAJU7XNR+uO3povLQta0Ary7De7mnyl79+KCzDh1l?=
 =?us-ascii?Q?FgOoWl5eX7watrG53rmLkfa620MRkX6SSjFVP/60Y6UcLrP0ckN6CvBXr6rF?=
 =?us-ascii?Q?nl5wpIOSzmQ6YmkJHak8c04AHIy+zj5JBI1My03TcQTPlLiGjoStkfwtN8qR?=
 =?us-ascii?Q?UU1ExhVItgFNb319OCV2XgAeJZyPevuh30L3g895VfDmvATehucJrDsE7eqF?=
 =?us-ascii?Q?lIpPFcpXXrRe2Y0vi2CgPOX29Lt23a+mBxviMs4ByBNc6XzWwlKVfy1j283y?=
 =?us-ascii?Q?FJW24Nb6AqR8p6ci0OQCwway+OQlBLHbJRNwLkfyvExoHnANeJyrHHnr3TBE?=
 =?us-ascii?Q?ptWVawxTbrpkTKZQ19PtZ1+C9muZOFwUYSDKtEZZEwaizLa6ceS47XWKa+qO?=
 =?us-ascii?Q?zjnTZJABv8FnYOVFlWodsW9u2Id+2S45K63bOUfBBKxN8ADEUp5UPcaY3X9A?=
 =?us-ascii?Q?sEufiR/U6y2ShDjluM1TwSL/euXyFoO5XrPKN3+Agfpdv2uVdBQZ2GxPkZYc?=
 =?us-ascii?Q?c18fjao47U1o5Tc7w0Kc4JNVb8tYnEsaEj1fIAJbGn33ugQPV4TQKZxhlJtj?=
 =?us-ascii?Q?kg0NrVhY0U+mA2e4kAm3gE84Qny801btU80zsqIYDi/bCx8cv75N+0vFHrLC?=
 =?us-ascii?Q?3Zg4gYX3JLeG9kPQzxwPCVnoQeHaU8gddqJnT397bvW7h9q46V13I4QvwH1x?=
 =?us-ascii?Q?mgEHpQXp0QXOOS7QnGqVXnatnSFuCSY+m8B85oEn3IGZ7QMn45+lFt7Vjf74?=
 =?us-ascii?Q?IEzWnv12bNy5ukm1iGtrc0XdmpKVJB9w+ZA1Ra/6yW8XFW+x7exzEwITN8RD?=
 =?us-ascii?Q?wP611vCEISWN8owtT/Asbyn4TnDWd2qaAXk+K4z32F6HCkERNe1mhvPu2xDm?=
 =?us-ascii?Q?knZIHeBZRYWuJHH+FQvVCp8AZ7dFJEBZ9JN+2E5vuMgo8SzBfvTxTIjpn4uD?=
 =?us-ascii?Q?D/+EgCofuPe/tX/HEMfwFNvSJyeJ8DOQRcd6EohL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32043c05-92f5-4d91-dbfc-08dcb1a586ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 21:12:46.6657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bxi7FXskDvS5EKgKw1lUCD3yEFN4m+epgUzHKkOsTFVoQ88tpbKw6snoWV94x9U1+LySHECeWKF2hDtRtfHtufOK02xyqX2a6Ad4/cLbPpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6545
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Karthi=
k Poosa
Sent: Wednesday, July 31, 2024 9:57 AM
To: intel-xe@lists.freedesktop.org
Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal <badal.nilaw=
ar@intel.com>; Belgaumkar, Vinay <vinay.belgaumkar@intel.com>; Dixit, Ashut=
osh <ashutosh.dixit@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Poo=
sa, Karthik <karthik.poosa@intel.com>
Subject: [PATCH i-g-t] drm/xe/hwmon: Fix PL1 disable flow in xe_hwmon_power=
_max_write
>=20
> In xe_hwmon_power_max_write, for PL1 disable supported case, instead of
> returning after PL1 disable, PL1 enable was path also being run.
> Fixed it by returing after disable.

s/returing/returning
also
s/was path/path was
but other than that:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Fixes: fef6dd12b45a ("drm/xe/hwmon: Protect hwmon rw attributes with hwmo=
n_lock")
> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.=
c
> index 0c8ce09e5025..832ea81faeee 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -203,9 +203,10 @@ static int xe_hwmon_power_max_write(struct xe_hwmon =
*hwmon, int channel, long va
>  		reg_val =3D xe_mmio_rmw32(hwmon->gt, rapl_limit, PKG_PWR_LIM_1_EN, 0);
>  		reg_val =3D xe_mmio_read32(hwmon->gt, rapl_limit);
>  		if (reg_val & PKG_PWR_LIM_1_EN) {
> +			drm_warn(&gt_to_xe(hwmon->gt)->drm, "PL1 disable is not supported!\n"=
);
>  			ret =3D -EOPNOTSUPP;
> -			goto unlock;
>  		}
> +		goto unlock;
>  	}
> =20
>  	/* Computation in 64-bits to avoid overflow. Round to nearest. */
> --=20
> 2.25.1
>=20
>=20
