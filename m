Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E627FCC6B33
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 13:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9483010EBD8;
	Thu, 15 Oct 2026 13:29:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C354C10EBCD
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 13:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792070946; x=1823606946;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ep0sUAbixjDsoQI4E/Gxm/8K8x3hiNPKl+xpqwtrdc0=;
 b=k2RyY4lhVa/6hHJmNYZnPpG4OyFAhY/Os+cJSAQvK8tbN+2jYjUV9OZx
 6bdsIyVuPfYC7I8FiYFpp9TLiJJJKceaVCTF9kn9sHJDasCGEOdfg7pOr
 VHt/ONFHo6VFqFTaEUWdv+bGJ+sVrxwzkkkJN5XR55UI6jCcU9Hzn6I15
 lbUHCxm0BXEKfygx7GJE55AH5P9Dc5oPMoLu9mPJvTWEUL+nbtRcaW5RO
 b1IL4HRSIerT7y4MdUsrssGr4MWmH4MCPHSh6gw8oyYIUTua3YNPWMmQk
 su5ELGpRSg27HvT4YffL9VROdauz/tlkh+cQu+3669H+h83PVg3hCRP/2 g==;
X-CSE-ConnectionGUID: ybx8uG7GTn66Dj59bXT4yA==
X-CSE-MsgGUID: Kpb5K7i7Qce5PdlgIK3qVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="835611"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="835611"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 06:29:06 -0700
X-CSE-ConnectionGUID: 8p37WUxASg+oVWc6e11bCQ==
X-CSE-MsgGUID: TEz9GhJpSoerH/pvfQbQWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="2048962"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 06:29:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 06:29:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 06:29:04 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 06:29:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rO/FdtGmn2g4AeSkWeOo4E5EEWMfw9UpizzL3wLX9RBCxIWCm/Ke4jDVHRTbW4sbJAQp28tC6HbONkCKWqzwOEwQyQbwm7Es3BjNuALMnJbFOSpRX5IXVilNhCJSj7cWTDJZU80aCm7oGQfCHL2WhP8sujLiEj3emVQUqbOEwese9U/4nK07tZjpVEelzFJIRGrAU/Jnfgl4kvSU+KHnqbeAAMOud3PFLtptFlIvIAYeQiwnUclYxIN+fF2j4SVIwXLCXVzu1gaPRP6/AtCY5vAYNDdaYr04eVVWaExwFUkC2cvB8aDpTnidC/00nzmAczT9ECjulr3qbD6vBbP6cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLNYQprLO5FdVaL0dQKzUiroz4tk+aTfZFXyAtDXIWg=;
 b=vfAoouS6H8IfpjqHPD+ehCWPMnHGOCRBa4DzkwZmFRllDUIBYidgxTXu+ZRZDYuC/gNMW03U6xNOSEb7V8RcBgU4qjK6RP29bcH9Q9DR0Mjq5YF4BQUKYJOZNjUxT4igHUxUVSnLyjDPiV3yCjBnjmFnBHqrqEuGVY/jCuy0OuAntEsnob60WDLxvJcUu0HvQ5x4ZCdGYizXGZOasi36+hHDfbVjW/sIiCRVa4mSPZ2CW3aKthphbYSJaNBxTtfAHy8NASC1UoEFsSpffjD4wKvq78uzkaGFefQCzIzOxLQhRCNkI3LmKrtA2zj/yhY7mDl/1bxpP9piDKdsKBI7Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by IA3PR11MB817020.namprd11.prod.outlook.com (2603:10b6:208:548::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 13:28:57 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 13:28:57 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Subject: RE: [PATCH 2/2] drm/xe: revamp hw reserved PAT index checking
Thread-Topic: [PATCH 2/2] drm/xe: revamp hw reserved PAT index checking
Thread-Index: AQHdXItV+dHcWaIutk+mpB9OYcy62Lb+mMew
Date: Thu, 15 Oct 2026 13:28:57 +0000
Message-ID: <DS0PR11MB87181583AA6B0AFD80538DCC819C2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261015095516.403932-4-matthew.auld@intel.com>
 <20261015095516.403932-6-matthew.auld@intel.com>
In-Reply-To: <20261015095516.403932-6-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|IA3PR11MB817020:EE_
x-ms-office365-filtering-correlation-id: 599dd01d-689d-43fe-d365-08df2ac0441d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|38070700021|56012099006|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: RTZ9OQBafQHxofIg37tHF9GaCNzR0jaG19QNT/3N4VLlEswDmgiXoxIqNmadvNgkl6ZuKUOP863ym1PtuN7t2aHj285c+K5kHLkOZADS9G2pG2PyUWTNKNW9oSzcjMToeT5Tm1ywdQrbBNSA0JUpyrrR2dnsQhOGFnAqcpNeDrTCETwSSnwttqN2OlNuV/odWqhKWDETplZTxoHcNvfG56gAiB64v0dnj+js84xZH442ovv74my90xidvL/5k702KUOMGFdiTNBivm98Vpo7t1lYdO9e555EIPS2LTQhyAhceA/m2iCW/odfQf8Xdk7ruJvJ95pcgYTNGvgD50bpNRYXfb1W/wOOaAVWOzsuUlCPsQsslyXwTff8295gzgaKfFyXnnh0uZ2tjofIiSa35Ajksh1GTv216tLn9RCOC1mKkvHk/cH2DWnBLFhi9AodivriU1Fpr4HPswqEPhJ+RDkqDG0MUghiXJ0RA5UH5OcynD7QrqdzVpffTMTmowuYh5fjCS+neU1R6wbyOgPe58NNE+NFMWW8S6pbTjUFm8FpA8tGsnY/2SWUEHKDBTU5x/HPE6ufHzo4PrSr2xbYQ4hi8ky0HCSFRqAR+9VyW99aVM0Qy0pNgtQrCM6NXjLwVaLHjyGEIaCCmim3a4P+fmHscpxHQq4mLW/cfDLFbZ4MHjiu0fTUcfkrjPtAmiUxb62/mVz9SYFJy2Qiv0glSv7F6T5/60ySBf21M80S76U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lvoIJFi3ZN4JZbmX+jX11S1EaTepCu97joeMpmhEjtHaroe5ZFBCqedeKNVp?=
 =?us-ascii?Q?ptOkOEV7QZOw4YXTPFLrn3+YyBVBxhLuQDYa17TTZZkt9MKpW6W1owIuc7r2?=
 =?us-ascii?Q?J520KMfTZS82IH3/DrVyKr6ZOC17VES6tYh7KuV8s9qENyHUsmPOXcrSTd0s?=
 =?us-ascii?Q?HLhjCJlgrH0+aQC4w6WlHwa13V82vqe/iJSU2FibLZrQoutaG/K+KoETsoGZ?=
 =?us-ascii?Q?lWKBIBk4N2sG3YcowMalFCFXaXXjJFYlhyv6ulKNAFOmXBJKl6bglUv+NlhV?=
 =?us-ascii?Q?+QE2/V3nuCRXffYm8N/POEoAdAwBu+WG2HW4eHw7NvpEizGi5Zzbie6vDJ/z?=
 =?us-ascii?Q?MhZK+HtmlDVA+23JgKt3rnaPZkaXBx4yQXiKZHYk2GlsGDnczOM3V/62vcTU?=
 =?us-ascii?Q?9e5LKPgoEAXzdMDHHyuRyquQnuY7hmxzPJsvi6+RxucZM3+MuTTsJai60MH6?=
 =?us-ascii?Q?vPaz5brZzVLMW+xqg2NSQ2Z6JEGJRYXRo967lvAUxL5LzahHlPmgANTccTSx?=
 =?us-ascii?Q?1y996WuyDQElTXAKlomvAe0iNFAnNN1fmSKsTXQ9RxdhaKs4+XOlV23FeEeu?=
 =?us-ascii?Q?O8DlF+tyChITwd2uTvsCUaNPU5P2/UgYWOnFAmRnelJ9CBBx/D602274IU5u?=
 =?us-ascii?Q?HmAGJJVO07L9zt5FgRnpmge+udgPdC8cHv038SQlahfp3B5RuKbesnVjUAEP?=
 =?us-ascii?Q?Zqcmd/GnqdGljhN7olyiAKzcWrj1AiyH+AkrI3zolKn0yI+Xw2AFWWhp2ywE?=
 =?us-ascii?Q?rnpsCUbTcf+wp7LTvL0pCX6DIJUHANQl2nP+dVcqRPON6uk+OysOrXOL5QaQ?=
 =?us-ascii?Q?TTIvp89WHD8+896KRJAIBeoNYf4Bo38Ni94l+lVpOQFGLP4WzFKN5Z+xrUty?=
 =?us-ascii?Q?bFmvxgA1+/vgv6yndC3T1XZn4SUYNYc2cTuunekT+QYdSdWBfC7s9UwF+QhL?=
 =?us-ascii?Q?ku6xfo0anWVDGKqr4xGr51hUCgwI/saxr3xt0IDtwMDsQE14LZ5jraw9HI0T?=
 =?us-ascii?Q?TbxDVk8oJi+OqRgRmrEi5TwBqbaiz0ZS/myyZ5a62cFVHOsBSKA32/vsXn54?=
 =?us-ascii?Q?/34gfRv9q2fzadjj6oVWh0eLBSDRlSofLrvnmAHec1WHc+CL20rnvT/ZnMDK?=
 =?us-ascii?Q?LDqHBEHUsNM6sVBYQJ1tNftG5ZGt4YhmCtJPB51jU8EqcDpSCeeWXxMKTgl9?=
 =?us-ascii?Q?MZUw7TIc2ATn+nEyAEv3ja8UX+tEmNby/58eSSoZkDCmPe7774fly9AG929E?=
 =?us-ascii?Q?6UQPa3kI6f1Dw9Ug3JsMv7TjmDoH3UQ98CZVQvWm7tyRH12+7kbTlfFcte2p?=
 =?us-ascii?Q?THlfTyRaQzjd9TmpMZEgZrY4TJ0hY/4MSrj8wLwCFM/Wz/Zd4ghz+tiXGCij?=
 =?us-ascii?Q?vCLjhqd78s12I14YL4MJOeJjuGXn452vzpH5UbjW/8eJAPTAnzQWbTTVzzo+?=
 =?us-ascii?Q?0xwpMkEfzVR14MqL9lw4101Q6rPJiM7zRTQs6q5wrK+qsIEcQR0Mv6b824og?=
 =?us-ascii?Q?ylCHBWWYuIQqo60roTYUIyroHLEgDDMq+C8NQmll83zFRiuMjMwLg4XKIKRm?=
 =?us-ascii?Q?p4MybFo0fp21O/X7vKlbH/QY7cQbJQLjZl3vFZMCHRgq7kyANzW7sy7plwVy?=
 =?us-ascii?Q?cMl65vqptQrE0qM9rOWeoaec8aYysuEgC9o7QyT/KDUsXKjawjjBuqI/fjIT?=
 =?us-ascii?Q?EXXUKxlWMXHcLUzQ7uMCSFypvviXF8SPqOJPKM8p0OFC5V1+V7tPSD+/iHOU?=
 =?us-ascii?Q?Q5ssIX8Nog=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 2YcKbi9ckNWqRwk90951BcylIpK8v9WePctsdWMWdeX5aMgs0kHiy6c3v/7dsrLCUEl1QjBCEV0Zix4vMnGLffpMs6K0zlGdCDF/C/d4yj8yNegqgxddHTLsgp9mEGubGH89PcYTzt15p3P6CksHMvl+u74e74L7dK7x4MQlfcA6VDdYN717noxTnwFr/mSyiTGSMas/CZd6L0xMC/iWHW97L7Q00PlGxfeociuk5mK5aAWPGd7Whs3I+kd5AffHg4lFQxUx4t7wSGL+SpDlVZZ1jRsvGii4YbmuM6p86s1jTczkAVIrOvRCP9IIoeVMIf6FZSnh2pZB+U4TnUiUOw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 599dd01d-689d-43fe-d365-08df2ac0441d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 13:28:57.4695 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +d8cnPFVANijzGx7WP7uP1uhnHaC+eCRe/WZ6yxh1w4BlG2COtJvxfYS0D7AMFzx9ZSwVG5ZLGpj7S5y8PhNHAZ/WHfstqjJDUsWJqYk8L8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB817020
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
> From: Auld, Matthew <matthew.auld@intel.com>
> Sent: 15 October 2026 15:25
> To: intel-xe@lists.freedesktop.org
> Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Upadh=
yay,
> Tejas <tejas.upadhyay@intel.com>
> Subject: [PATCH 2/2] drm/xe: revamp hw reserved PAT index checking
>=20
> This came up recently, where the current code uses the following to check=
 for
> hw reserved/invalid:
>=20
>    if (XE_IOCTL_DBG(xe, !coh_mode))
>=20
> This works, but is actually confusing since coh_mode being zero is valid =
from
> the spec pov, but here coh_mode is some driver defined value and not the
> value from the spec.
>=20
> To avoid any confusion, revamp this to just to pat.valid directly.
>=20
> Assisted-by: LLM
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pat.c        |  8 ++++++++
>  drivers/gpu/drm/xe/xe_pat.h        |  9 +++++++++
>  drivers/gpu/drm/xe/xe_vm.c         | 10 +++-------
>  drivers/gpu/drm/xe/xe_vm_madvise.c |  8 ++------
>  4 files changed, 22 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c in=
dex
> d1ba2325d9e2..d239693b803b 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -295,9 +295,17 @@ static const struct xe_pat_table_entry
> xe3p_lpg_pat_table[] =3D {
>  	[31] =3D XE2_PAT( 0, 0, 3, 0, 3, 3 ),
>  };
>=20
> +bool xe_pat_index_is_valid(struct xe_device *xe, u16 pat_index) {
> +	WARN_ON(pat_index >=3D xe->pat.n_entries);
> +	return xe->pat.table[pat_index].valid; }
> +
>  u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)  {
>  	WARN_ON(pat_index >=3D xe->pat.n_entries);
> +	WARN_ON(!xe->pat.table[pat_index].coh_mode ||
> +		xe->pat.table[pat_index].coh_mode > XE_COH_2WAY);
>  	return xe->pat.table[pat_index].coh_mode;
>  }
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index 6398c3ab4805..10adaa6fca34 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -56,6 +56,15 @@ void xe_pat_init(struct xe_gt *gt);  int
> xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);  int
> xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p);
>=20
> +/**
> + * xe_pat_index_is_valid - Check whether the given pat_index is valid.
> + * @xe: xe device
> + * @pat_index: The pat_index to query
> + *
> + * Return: true if the pat_index entry is valid, false if reserved.
> + */
> +bool xe_pat_index_is_valid(struct xe_device *xe, u16 pat_index);
> +
>  /**
>   * xe_pat_index_get_coh_mode - Extract the coherency mode for the given
>   * pat_index.
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c inde=
x
> 095f762bbb6f..320bcb7013d2 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3811,17 +3811,13 @@ static int vm_bind_ioctl_check_args(struct
> xe_device *xe, struct xe_vm *vm,
>=20
>  		pat_index =3D array_index_nospec(pat_index, xe-
> >pat.n_entries);
>  		(*bind_ops)[i].pat_index =3D pat_index;
> -		coh_mode =3D xe_pat_index_get_coh_mode(xe, pat_index);
> -		comp_en =3D xe_pat_index_get_comp_en(xe, pat_index);
> -		if (XE_IOCTL_DBG(xe, !coh_mode)) { /* hw reserved */
> +		if (XE_IOCTL_DBG(xe, !xe_pat_index_is_valid(xe, pat_index))) {
>  			err =3D -EINVAL;
>  			goto free_bind_ops;
>  		}
>=20
> -		if (XE_WARN_ON(coh_mode > XE_COH_2WAY)) {
> -			err =3D -EINVAL;
> -			goto free_bind_ops;
> -		}
> +		coh_mode =3D xe_pat_index_get_coh_mode(xe, pat_index);

Should API doc have note there like below ?
/**
 * xe_pat_index_get_coh_mode - Extract the coherency mode for the given
 * pat_index.
 * @xe: xe device
 * @pat_index: The pat_index to query
 *
 * Caller must have already confirmed xe_pat_index_is_valid() for @pat_inde=
x;
 * an invalid/reserved index will trigger a WARN.
 *
 * Return: The coherency mode as XE_COH_*.
 */

Anyways,
LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
> +		comp_en =3D xe_pat_index_get_comp_en(xe, pat_index);
>=20
>  		if (XE_IOCTL_DBG(xe, op >
> DRM_XE_VM_BIND_OP_PREFETCH) ||
>  		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) || diff --git
> a/drivers/gpu/drm/xe/xe_vm_madvise.c
> b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 5c7aefc641ee..f2c70657460c 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -393,17 +393,13 @@ static bool madvise_args_are_sane(struct
> xe_device *xe, const struct drm_xe_madv
>  		break;
>  	case DRM_XE_MEM_RANGE_ATTR_PAT:
>  	{
> -		u16 pat_index, coh_mode;
> +		u16 pat_index;
>=20
>  		if (XE_IOCTL_DBG(xe, args->pat_index.val >=3D xe-
> >pat.n_entries))
>  			return false;
>=20
>  		pat_index =3D array_index_nospec(args->pat_index.val, xe-
> >pat.n_entries);
> -		coh_mode =3D xe_pat_index_get_coh_mode(xe, pat_index);
> -		if (XE_IOCTL_DBG(xe, !coh_mode))
> -			return false;
> -
> -		if (XE_WARN_ON(coh_mode > XE_COH_2WAY))
> +		if (XE_IOCTL_DBG(xe, !xe_pat_index_is_valid(xe, pat_index)))
>  			return false;
>=20
>  		if (XE_IOCTL_DBG(xe, args->pat_index.pad))
> --
> 2.56.0

