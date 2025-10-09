Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663D4CCD183
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 18:06:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2CB10EADD;
	Thu,  9 Oct 2025 18:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RmHdwkdb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05D310EAC7
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 18:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760033204; x=1791569204;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RHUPhBHsgRAZquh12zXZ6AX497Aa2ShjdgB0Ny/SaEU=;
 b=RmHdwkdbydhQuXoh+l3zcvRzmlxM64tV19ExXLE5zupO9ig4tRnCtSmb
 5u61bbGlgv2jt6y4WlZ7oGP8FNkHrDf7G0omJIpVrTjrornlhHBKtYMF7
 oxj1s/H6HM8Lm+QivB0rPS1itaSRaSsvdDGOiwkFWjfjX8MOfkRpwW0Rs
 AKDyZIb+grjNfswkaDsPLnDL++MvTG9P/4N4JP25lQGtFim0eA7eWR8LX
 fXPecClj0tOqeliDtfgx6Ur8vCmhVVdJ4bjijJJFJRlpfEuIBK2NpSEWE
 mAN+jEVbsz/Ga8WfN+ozYURH79etnjx/ZRgANGFdqgrTk2zH7T+dtaVaB A==;
X-CSE-ConnectionGUID: 2HpA3MhqTP6X4fFfU7z3wg==
X-CSE-MsgGUID: GwRJJOXaRq+99H49ntH4Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62155850"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="62155850"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 11:06:43 -0700
X-CSE-ConnectionGUID: s4lsq0OFQYaaDKTkez0lWA==
X-CSE-MsgGUID: NaJ1qmZ3RCKkpx4XdSeXNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="211739673"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 11:06:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 11:06:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 11:06:42 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 11:06:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KyrCW/0pP6CKcH3FVG9lv9gNU2b2M/yeJH19tdKnpRePyEhSaYf7IRmfUoppF3luQZ3JifhuLtHGn/u1y6aOrHqNYWH4yBMMWEs0ciEB1mwr9UI214XSaOBseQp9oFbFe6Qg5kOCarfbht6ew3LdJLxCojnLp7HBu+e/8olK0aAWyXtPw8/7uyNsxHrhmk9kyygBwkSFILtJlyEAYZJxoBAA3UIOhRl+9OiKwLFP92DrQNJC/W9aYDR/tS1GyqkETAopgsyngfJfzDAPmHfG275t2lM1uXZUNIl9l27ppKeRRO840t2558dFRpy+8wgkujIMHiFjGeYItvjAztyeFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CI4gIBuQCFirtEzbyEOqaTUGiVWvAP4M5il/UcR23dc=;
 b=EmfeVNhBZtaG5y65XlIVOeTTPqbUY/DVuhEn26euPTZDK2OXbeXSRw0Zj7t9PtGcOEw0uDUlQXFbqxyU4i0T0bIiLqG+B/8W9Gx4k373dZjVQgKkopAqpv9PYCmmxW5GD8HCio4orp34XQuma+ZkQnppV/GC+a+LKY3/zx8/uujDIVo3XhHlYYI86Zu4P9ve3sMrJ2PEgnKPLLKglkevb9j36o43WXE6b2S1v0zrTsWbg09elMD9jQj0dwmooe8djsXvKE+C6zfNS5OwPqFM+locd95NpJsNFhH+CoRv0CPlK6cypeZVCTeTYRlfqaXfyg+N3Ismvm23wUjM6hZexA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SA0PR11MB4575.namprd11.prod.outlook.com (2603:10b6:806:9b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 18:06:40 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 18:06:40 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 3/3] drm/xe: Change return type of detect_bar2_dgfx() from
 s64 to u64
Thread-Topic: [PATCH 3/3] drm/xe: Change return type of detect_bar2_dgfx()
 from s64 to u64
Thread-Index: AQHcNv4itGtpwLApnEq/OjhMKNUvrbS56teAgAAzFpA=
Date: Thu, 9 Oct 2025 18:06:40 +0000
Message-ID: <DM4PR11MB5456181EDCAFA6F6A2732B6FEAEEA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251006201339.2603160-5-shuicheng.lin@intel.com>
 <20251006201339.2603160-8-shuicheng.lin@intel.com>
 <aOfMT1zzARbUH2yb@intel.com>
In-Reply-To: <aOfMT1zzARbUH2yb@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SA0PR11MB4575:EE_
x-ms-office365-filtering-correlation-id: a4e3ad25-f9d0-4521-da6e-08de075e98d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?ummLC7yCJqIy9kTNAbU/VnkkCdxOwjUXpibtF4WMPHWT43hNyW3vMecx/R?=
 =?iso-8859-1?Q?+nc74B5lQVH7xoSZPgXmQqIjiwRDjdMnjGEhK+Amn49NFuxHeCRMPcwAoO?=
 =?iso-8859-1?Q?GdVd0LCWKD3OSrduXU2LJXB04ydSpkcLgbzmj/LM24dvK2DY5RzybVaVrL?=
 =?iso-8859-1?Q?l9Q0vSJQ27Mz0IvakCbnt2i1mATHkVJDSFy7MOEHRwsIWtbcI3k3V45bXF?=
 =?iso-8859-1?Q?FREg86986uYGJK+DEeCexeNrsFR2LnhtNCcxbQKm0fm0Xj7vxBATSgue4H?=
 =?iso-8859-1?Q?HB9OBNylF86JSBL6gw6nGSn19WexpWEDFfDkXDEaoN1gZY/PqchjxSiPkt?=
 =?iso-8859-1?Q?Zn/eqBSfqzfVWPklHw70619oLOWoxR3W7BOOTIGY0le66Noe2L5kG8ZKHT?=
 =?iso-8859-1?Q?MV3qk0KicxKm9o5acz+w9SolfZD/4lDLSSV8VEP2CCAsCGFSo96bxYz7+R?=
 =?iso-8859-1?Q?p1I6wZmu4/6VoEVk7vwcfR1JCokDj7ss36yTtDR9LRov1OqaNZi5dZW89A?=
 =?iso-8859-1?Q?dKDEu2/2KOdJGqtSQbNFxb0OkXWwYf4ovLT5X61VPpC+ISWj2Ryx5oZTHC?=
 =?iso-8859-1?Q?tLi08eWybui9hq50uCkseO7LwV8C7IRoA31u9LxcHjgIvh9ztpV/J5lxF2?=
 =?iso-8859-1?Q?cRXPyKfd6mZTgSBfwCBAFbLvr7HiR/j3D1iCghr3Ct/FwsWF89RFF+cbsy?=
 =?iso-8859-1?Q?1Ctlggl9Xy42dSy6I0MS/t1bLnOaOTBESvPgz/pO3OWoJaFvQ99A9Lri77?=
 =?iso-8859-1?Q?tyjcD+dsvZGfNZv+SoymyOwA0GoeP7a7AbLJxDjdbiybjQ1vcoWhhQ4LgH?=
 =?iso-8859-1?Q?bPsUS67qcOxYbBMTGWcTHkZ+HyxmsUn+P56qSLMnlUGaa+ICBfpuks4rkj?=
 =?iso-8859-1?Q?llD5CBqethhn79YmU5TZDjX4kL+6QIwLZc8HZmE74bcvqMJhddKCus1IAu?=
 =?iso-8859-1?Q?45realo5V4CrSzVYvHUXJ9uiZbtPqgbzXM/L8pbcJDTXlgWf8AilZuikGT?=
 =?iso-8859-1?Q?2rlPWWFQkIQtGa3QahC8L5ux47dFF2sSIKn8TESsnhYUMfBfBrGLk8lYXq?=
 =?iso-8859-1?Q?wS8NSFIQYnyqDSnTIJxByDsoKYo8JdLzNEVRqlalE+zlcvM6Kh9Ti/4/f0?=
 =?iso-8859-1?Q?76LYgmirOc2QBdbo6g2zvLKEqFeuO2mTO6+2tmrtX4PAIJPNmck3oUry2n?=
 =?iso-8859-1?Q?fZIRidYJAkLAUBWqGSihjkigYmeiAniIDqfTD/lh7HcoPsoInMIoe/2tGD?=
 =?iso-8859-1?Q?Hzi2N8sUYaS2k0YzRChRIzxNluQJc6ffnh5Wrd6qCMz77dvltHqkmfN5Kb?=
 =?iso-8859-1?Q?T2pYOEnnsPOGxtUvnmLzp2ZFyzp3TriXtSi2mAdURnYFhOzjTmK+ghzGFo?=
 =?iso-8859-1?Q?ZpzDcXw4d/XbrgJC5FFTBQfkCzX0FU6cdHfq1Cch3APuL203dNJFDW/g1I?=
 =?iso-8859-1?Q?OvK/004FSDKGHdNnZXUUtqhfScERivmwP/PCguR7y5pUvDveOvc35rlhWM?=
 =?iso-8859-1?Q?bFBlA6dSJ/YmVyDTyhB4FmEOgRYgeecyEVI71muv0UsbTGdGXK6GXlCUOh?=
 =?iso-8859-1?Q?4dwABCo2gLM6GEPlDULgX0ZYWLOa?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?th11XIV1xG15bvrvLw1Kn5efLHHS3SfHIVdzKcQwV+Ymxy4HK/MEYtFFsi?=
 =?iso-8859-1?Q?IrBQLKnEyQR11hl6kV4GKvdXtY3OPqJt4A4n+kxaOqm1dGaREh0w9yUaNI?=
 =?iso-8859-1?Q?BwinwsJch65JU1CzyuqEoK0mM+JPYFHJak7Vpmz8nuSYQa/LJHRCfrOz/N?=
 =?iso-8859-1?Q?sSKzXylQIp7BGPcaVYqCE65cUJXMQ68fse39QAudx7ZQGSOkPqOyIhNaXq?=
 =?iso-8859-1?Q?i3oPtmyNuWWjOArEbHm5a1k0JA0hPWw5VNPdY/wDDFfXPe/Emx0Of4SrJn?=
 =?iso-8859-1?Q?TwaU38LygQWr4ZL5XKSfH3vpNDQ6fAqO0RbBM4vb/kocnkQXGqTRHR7CNA?=
 =?iso-8859-1?Q?gBPK4VZwIcGiR3aqB9nNsVt3deIoXGQFKNewwQcJThoJEnX48b8V0VEpY6?=
 =?iso-8859-1?Q?OU1zJt2KxbhBEWXdrDtLKXJrvQ2El9b6qZ+h5v/Ukb2hUSB4y025YID/CA?=
 =?iso-8859-1?Q?HOSPY9Ux1oeXO+IBMn2l/cXDBqVERIEE7D1MM1X5qd5CSb1IKoPJ7RtelE?=
 =?iso-8859-1?Q?vNoljG17FddwbV9yiOAa8l6Iuq+gHqMxlE40kTsuGcou2btbgbJCKHHja2?=
 =?iso-8859-1?Q?Dk9dneongBuHg1Qnfh0H9gKY0MnXz5LbNrZbOCil9vygEFB1hOJmJYJAiZ?=
 =?iso-8859-1?Q?HSZrYadv8rVcjxGSE+2MjFcTckro1QqemmcRIBsxalGdWzDOdyO4JZFhzv?=
 =?iso-8859-1?Q?+njqiVbt5Srl4fDgyG4hGKuktF5iQLW6g3RKOPADE2QlZId0NWB62EZGe5?=
 =?iso-8859-1?Q?4jGrPwfNuntZ78kHDrsSLOxYKqhLy9dzh82AbjKHw2gkSaoRhi9h+t91sG?=
 =?iso-8859-1?Q?6BuVc6nBEO+QvSJdu1eqbZAnjSUCdW0UmXmQecB3cd8FfNA905s/BeHAHb?=
 =?iso-8859-1?Q?Fs9XfZIsHnKC0vVIExzQNZ6fyKnGxeU/bqXudfywRPIGGpkGjID7y5xfAB?=
 =?iso-8859-1?Q?CCimWyIjCK8OI+RVPopWpraflhCASzAxn40fH+l33j8zWDNe9cWZXvGIJH?=
 =?iso-8859-1?Q?cbUE8C+VFGvDxaT5olKhHB49nri5WNh8G9pCvd3qMCcuLrFBtej5qMti0/?=
 =?iso-8859-1?Q?kyYtjiRhOgt5rhuqK+IqqoA6wykNZcta9YvzaDchjjrgaEfLtk2p9YdWDo?=
 =?iso-8859-1?Q?GwoKScJc2EnxMrt7iikYHnkh8neqJfC3B6m78k8ZPSvaVyKUhEOnj6tQoE?=
 =?iso-8859-1?Q?K1m3BoT7NUCadpTck+oV+A5bf4Sps5UBchbxwVZmqcL2xQSyJmGeWEM7HV?=
 =?iso-8859-1?Q?QddELdjajB84rXfanxnsXuxfcVC6CQr7d4+BxM4X/p9S6LmVG7aNIZFtMl?=
 =?iso-8859-1?Q?JGSrvjWxTcmc2HnXVVr4/B5Hr/K+UOIpd1aAG1QafGExKC2YWwyZb1tAKB?=
 =?iso-8859-1?Q?r04ThbMdHU/nqTQskoKyu+G/3gmWV0Kv+WnzGvnH3gwOt4dHkdD5loCTxE?=
 =?iso-8859-1?Q?ZvNHRmDIISdNcavnOko24zFOqGRyjy8525HKUONlvZ88gpVNFbxRM3RaA6?=
 =?iso-8859-1?Q?aaNlL8s7ftsA6/w5upAmts+vgXHX/4pEhac4LhJMXaNHsm9hMVafp33swC?=
 =?iso-8859-1?Q?qGX6Y/+klOfK8vNc7qK9i+8yEhn8WmMfkAg/+WmVjZJ1uDoVKgzIueh5bR?=
 =?iso-8859-1?Q?4w15lUshiJsBcsLLEiprMiFuzh05DsvVAh?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4e3ad25-f9d0-4521-da6e-08de075e98d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2025 18:06:40.4980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zIFlEgNbjHc9hMhot8uqxHFm3gcuUmcCwK8kLT6W9X/CI2KDu7bEkPcCHHdHHHRETSz3VUTNeim3qK8qz5v8Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4575
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

On Thu, Oct 9, 2025 7:53 AM Rodrigo Vivi wrote:
> On Mon, Oct 06, 2025 at 08:13:27PM +0000, Shuicheng Lin wrote:
> > The function never returns a negative value, and the return value is
> > assigned to a u64 variable. Use u64 for better type correctness and
> > clarity.
> >
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > index 9b00bdc8ef1a..d8ded2400706 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > @@ -81,7 +81,7 @@ static u32 get_wopcm_size(struct xe_device *xe)
> >  	return wopcm_size;
> >  }
> >
> > -static s64 detect_bar2_dgfx(struct xe_device *xe, struct
> > xe_ttm_stolen_mgr *mgr)
> > +static u64 detect_bar2_dgfx(struct xe_device *xe, struct
> > +xe_ttm_stolen_mgr *mgr)
>=20
> hmmm.... because stolen size is u64, this is right.
>=20
> But looking to this function below, I'm wondering...
>=20
> Although theoritical case, perhaps we should convert stolen_size to s64 a=
nd
> then fail if stolen_size -=3D wopcm_size took it to the negative side?
>=20
> Lucas, Thomas, thoughts?

How about add an assertion like below?
+       xe_assert(xe, stolen_size > wopcm_size);
        stolen_size -=3D wopcm_size;

Or add drm_WARN_ON that already used in this function.
+       if (drm_WARN_ON(&xe->drm, stolen_size < stolen_size))
+               return 0;

xe_assert() is controlled by CONFIG_DRM_XE_DEBUG.=20

Shuicheng

>=20
> >  {
> >  	struct xe_vram_region *tile_vram =3D xe_device_get_root_tile(xe)-
> >mem.vram;
> >  	resource_size_t tile_io_start =3D xe_vram_region_io_start(tile_vram);
> > --
> > 2.49.0
> >
