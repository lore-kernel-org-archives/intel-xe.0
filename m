Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4B8606A32D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 08:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=npIJJp5p
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED35E10F435;
	Wed, 11 Nov 2026 08:07:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0152C10E0C2;
 Wed, 11 Nov 2026 08:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794384467; x=1825920467;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:reply-to:content-transfer-encoding: mime-version;
 bh=fBIYkU0Uf/LcEQOvCZ09W73LqQFnBQvyF0+4t34im0M=;
 b=npIJJp5p0ympRz8QFj4uZpGn6RtRGhPVt0vJmKaZcNxt7j2zESLog0On
 7up/05eqkim1sR6aJZMG+FS0HR0oEFUorDVghpeKi36xyXAF98CpYUm3b
 O9dmGKx660XF2+VYS+Kaxsu05kJhLb/LdvoA2uwSLlHyCGp1p8e46dLap
 UFFS7ZrGbw+fcL4JRRtmMmX/jd+V11x/lp6o+P44z7Bah0pnPZHJEZ7IT
 s70cBwN+TAEfkdjMpOAryBCKrv82FyyPS1PzaMSY6qu6SqMohvx/zu3D0
 yx41LZTj01to6tm4QCpFLB60xfPUtNksccZ6tH1AM2nD8I11Ju6Sfn58O Q==;
X-CSE-ConnectionGUID: e99/KOOLT+WhOpTCOiYVyA==
X-CSE-MsgGUID: ujWpv4weS9CZA2pOSc7pSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3188171"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3188171"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 00:07:46 -0800
X-CSE-ConnectionGUID: 3ptMH5eNRMqE1mCCDVfAkA==
X-CSE-MsgGUID: M1v272UtRtGm/7HI4U2kvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8193989"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 00:07:46 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 00:07:45 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 00:07:45 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 00:07:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u9kMfeOnx1ILrcnznpmLOqhyaRqGcxjBfR89AGHtm5deHl30ir7IhIRU8ZmYULBm+7bw6vp0QGCwKrbVkABs7ENqUuMxNU6DaxX/vezFosycVl1ph2FOvkMKrib6VWn5ZBSxwreupPvuBQmb3JeggZBXxjW4ISggsgeCCDmKpIE6Hp8NFLw4Ar41dMYM8VJH3G+eO44MHiJtO0NtgvW41bfxqlgHliaX081wlxcgQUPd4ipqjjaV45iOPgvQQJR2hdQ54wmtwy+SDfmNyU7hzs+mj/ac/Qhg/hJlGV+WKLH6Eop7HfYq0ujfMYW5I0e4bgRSKsWMGzfG91oHOLX+8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47AT/fXSqMRS5MXIhMDuT6qZ8A7vmqJ1QURQsSZS4rE=;
 b=hRmJS4PFQ8cbkxXhqRFwH3purMaIRvAT2y/iEWe8L0ymORc5jcOMiaM3K2dilBEAv8l5pAywViioZeoToAaFxfmX5QvTemzhweWuPqBCRdoi3wxWCIk1rA2J8fPhh01BnCZLQLsjsBfVB0Dpj5+FoxaUJ08bbudF1UeovmTLwdOlNwYgMXN8eeSkPMTBYfM7ywXJdV8Xj2dEITAxnAlZhXeh9WwFhRjWopkQFZUHLbGk9dciCErUPvthB//qzHSwKSqP1RCdYwOu2+4IY1L9lZiqcB5I6K+6bFgrj6wdvYczbq4pzFwN9kxMUk3LELjj89VLyrooma3wA4txJQyyoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5378.namprd11.prod.outlook.com (2603:10b6:610:b9::6)
 by SN7PR11MB6725.namprd11.prod.outlook.com (2603:10b6:806:267::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 08:07:36 +0000
Received: from CH0PR11MB5378.namprd11.prod.outlook.com
 ([fe80::b1e:8ea7:5106:4fd8]) by CH0PR11MB5378.namprd11.prod.outlook.com
 ([fe80::b1e:8ea7:5106:4fd8%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 08:07:36 +0000
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>
Subject: RE: [PATCH 2/4] drm/i915/bios: Parse eDP fast link training params
 only if enabled
Thread-Topic: [PATCH 2/4] drm/i915/bios: Parse eDP fast link training params
 only if enabled
Thread-Index: AQHdcQqNDoE3FCbhE0O6BhjRsqByTbcnPLCAgAFHKnA=
Date: Wed, 11 Nov 2026 08:07:36 +0000
Message-ID: <CH0PR11MB537869A8B38C24C3C452C4ACA3712@CH0PR11MB5378.namprd11.prod.outlook.com>
References: <20261110115432.894616-1-shawn.c.lee@intel.com>
 <20261110115432.894616-3-shawn.c.lee@intel.com> <avMOl1UQ6kSCbROo@intel.com>
In-Reply-To: <avMOl1UQ6kSCbROo@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5378:EE_|SN7PR11MB6725:EE_
x-ms-office365-filtering-correlation-id: a1f503c3-1fc0-4928-7450-08df3fcad913
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|38070700021|10067099003|11063799006|4143699003|56012099006|261022113327099003|261021121427099003|261022105027099003|261022075727099003|261021123027099003|261009223027099003|261102123227099003|261026140227099003|261026121527099003|261028144727099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: cEOKtmHyJqPAT6bo9BulBlT+lFjk69O7ywXfKFlx6Bilk7G+D2dsAunRucme+UgsUi/D43zJ8A3LWbyuZxB2NgK0PHMLZj1/8klM5IAfXyYe/mR4dtCEJMaB6Fc4g/qcOqJk1ydgGWDwQdfL74KNLWE7HJhwfgZByHj8P04ZRZZlQLMTfQfnC0PnAqm5apnXYk8B9WmDfmR/QDzkziMeS3w2+11gOCkqaa55NF4pdCHy6hevA2o49TBa+QcAl/TSI/aIZP1RshxulA7V6E3BMr7oLEEYNsMaP82Si45RJ+D8CL2h671d4vPoG9NRey5TZw4MP3p5Plt1slscve4Itfy3yuS1kSk5wQMsn8sgOzuBkkDGILd8bJF/1zpj0QaXw5XrfG0SnWYzEmWoXy7uv7Cl/JlJKjH1v/sbWzDiClTovbp4E2rGLlqgTGi3fWWRbFGFZ1y4yUsrtbgZ813J143c7C1VsG24kLKzXtbz4F7RbzFTs8QpGjVnr2uXIsPZdfIXzNP96E8ytiZaMvQ9K0dd6RQWzyAkAdjsrp9RpdNG7AMcFJSB+0qxTAfLLdo88kEwZVG04nOYN5UZjH6poS0+aNcU5wu+gpezT5kSkxORQMgtfC6CP2o1Z8zweKYEkWq6YcXFr13y6FZT4X6b7FqorQQRDeSgb6B3OI12GC5EKBs+TpmNCdK1Me3m7MaCbHFK5hL49gr6/Nc0v3xpjg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5378.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(261022113327099003)(261021121427099003)(261022105027099003)(261022075727099003)(261021123027099003)(261009223027099003)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?/MxbnevBOwT7a+Y2vaKXJF22+XCT9SK8Ucvyqk+OgRZX8CrExJMfldlGDM?=
 =?iso-8859-1?Q?IAZ0+yXl9wZi0Yx9NW+k4k9XAfbaKEMLlYQpLBmB9KGDZTKQyYXF5CQEQq?=
 =?iso-8859-1?Q?TF8t+mAE2lwa6Zz2c+T/N/ZwCJg8HJuyXAmcS7Y8JF3bjecBrRWArJVtUC?=
 =?iso-8859-1?Q?o0rsbmxGpCyHxHZSV1DGJEbVzc7ufX4m2hm1tzBbqrhBQixhbuMz7LS/xg?=
 =?iso-8859-1?Q?VPkAiQk7nL/jF8Ec08pLICpwMoUSH5SX7T5X7YQRrxX0ssVmMteRiZAvVf?=
 =?iso-8859-1?Q?NFRWQ0lZw1Vqssz3St2wb1ql5h67VwZkX/4uSU3G0LrggJu/xWYuumbmKs?=
 =?iso-8859-1?Q?S1qcfzT7EZhQkhCP6p7kFU+ozqSdJgZHBEGdbmwqr5AlSqfrYDc0FWhgfI?=
 =?iso-8859-1?Q?YtspRz4MpbWCGP6vwT2vlHSNQIUIaRpTCghyFInx94OmIgWzKSi5A/yWuz?=
 =?iso-8859-1?Q?SD9mQZ9Cun/oiIIFHPhEv8YcELj3tjXX3ibUf+x2eY8hEVYRGthUoQovm7?=
 =?iso-8859-1?Q?wf9vydVqEEngn+69WGMd6K0kfpQwCdqUVp3biOeivt6NGHkUtuCdJVAuqH?=
 =?iso-8859-1?Q?tS52tsDJ25aUh2WNj4p4l/hoqywO9EVjOTTGn4dQ/N7gB3vL5wWf4lFjB/?=
 =?iso-8859-1?Q?lQ0toLISYaZDITT70WcgPgbsArtaUzneoxH52c4J09sZ4evYGrtxTKMe08?=
 =?iso-8859-1?Q?Q7YrZm3nxs7cqXw6/fbkI6gJvCpBtSxzL4D6s4rwPf8QtWLfHt/qNOZn11?=
 =?iso-8859-1?Q?FoaaWT0dH2w88pQyYtZwi+VYCOvT49FhRx+9xTZ2SZ4Dw+SiXbPIDMrXwJ?=
 =?iso-8859-1?Q?PhZH3NZCVuUXc5GSqciVFNZaKWfHxap+C0IBB+3z2nGnNusYqf/kUD+S9+?=
 =?iso-8859-1?Q?bHDOgvgOoRLkv9Ej3LYgU4ZR67xT1ZCtykZelbP7CVjKOPsWegfD+NYSpf?=
 =?iso-8859-1?Q?Th/ImLXjr5ACZFlRlRXvIgG2kcUi3Qs0OgftNP5d2dGJwOWMFO8/6+GReA?=
 =?iso-8859-1?Q?t6lc9uC6gfY+kDVWiw3ZwgUUxVsKMffDM5kmxOt37hWNJYqkW+n1aD5Cbv?=
 =?iso-8859-1?Q?ox0gGlfVAoWLBkmlguRKk8gtqo2Lh/UVpcHZUyS3zLrC/eL/fzD7DrC97G?=
 =?iso-8859-1?Q?i8QgXzAYyINxsyvXBnATz1Z+S3eZFv5kNx+wbZFOLVcrQIwSdDRoGEmx6b?=
 =?iso-8859-1?Q?LnjalsAQ6zLHrCQGJrMde7m+Ee2eBN7vlD5rXNenJo3axDgPuM6Lvsl5BM?=
 =?iso-8859-1?Q?0kTbuEzQ3ZRREgn2ftsHihnbC/1wZ6okP0X6XTJs+a01gid9TD3z7Cjdik?=
 =?iso-8859-1?Q?83Ufr8keOpMeQ3Y4cBydv89njLF6TGi3HG+SeJK1ZLUFWZ4ku1Xn0BwRHr?=
 =?iso-8859-1?Q?NZxueYFiGEoztBkdGE1adK6aFVN6JQcK7gqxFvDSYNIWhRdutAOCWWOP3+?=
 =?iso-8859-1?Q?3+FTuzSyr37R2x+n/1kHnU/etGqT7tnON2speLhS/QL+3AsEPSoyNUhEg7?=
 =?iso-8859-1?Q?cfjVYMo6bxIdUtDVz9y/5PcoZILlpBya4rq8NAQUifUgLb4s4yZujVHYJ1?=
 =?iso-8859-1?Q?w9oR8xLqke/VF/Eoil8HmWdSE4y+p0hl694fmUUev/n6jRygrS5vvyFtZi?=
 =?iso-8859-1?Q?bhqrO5ypBL5wBKIXF6qdBo6mmYEYnOfFc7Ng6+tkxEdjsapCfUzZkzrqrY?=
 =?iso-8859-1?Q?utgZvOGfGPejguNoIgMwwmKJchAVPc25qbC7jyhodOUGPcbafqglq8JVQO?=
 =?iso-8859-1?Q?9lyHhAqUuu+559tO5oEnhyTe8JmpGRM2NhLM9cRU7l7E/LLPXkt035OFDR?=
 =?iso-8859-1?Q?+lUOrz542g=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hme35bm8zm4W3BMOoEeBuExyOwTMiccTxBCueSv0cL4Ke7Ukb2OzDQIXmW2tpNq8VL6yVtm/XpWLUSUFGX3lnIYmsvSXMFnGb7lXvI2GhdgSSdS2TsvU+4PB9EavHgF4ZKVD86IP3pfaiQU/czASpVICJcjzBWwbo1JqzeC8hn2QqfK/7Hr2lgr1nxlgA5v5bhUTkkpGbhDnDGNA7zvHRIANmyo7sqMgcJBpAuObpdfxz41Mx8u44PuBVIr9pI4ZlIaTxX0xR7kVXP9reu1H2rhCZZLgTrqz4GoFuttanZPCEIs62YE/B7peBpEm1J5UGvnhHbp++1RKnL4ZknPKoQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5378.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f503c3-1fc0-4928-7450-08df3fcad913
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 08:07:36.7633 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fB/1HAHrBzxy+FfBFhGxSPEQQg8rhtJfXdD4wsQ3CWWVvMpyE1HDJi3WOKAr5FWMDK9v6jUhjDc+HYSnW5otvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6725
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
Reply-To: "20261110115432.894616-3-shawn.c.lee@intel.com"
 <20261110115432.894616-3-shawn.c.lee@intel.com>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 8:31:00PM +0000, Ville Syrj=E4l=E4 wrote:
>On Tue, Nov 10, 2026 at 11:54:30AM +0000, Lee Shawn C wrote:
>> The VBT eDP fast link training params are parsed regardless of the=20
>> per-panel fast link training enable bit (VBT 182+), which itself is=20
>> not parsed. Parse the enable bit into=20
>> panel->vbt.edp.fast_link_training and parse the params only if it is set=
.
>>=20
>> VBT default fast link training lane count is 1, while hardly any eDP=20
>> panel uses a single lane, so treat a lane count of 1 as not specified,=20
>> like a rate of 0, leaving the selection to the driver.
>>=20
>> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_bios.c     | 34 +++++++++++++++++--
>>  .../drm/i915/display/intel_display_types.h    |  1 +
>>  2 files changed, 33 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c=20
>> b/drivers/gpu/drm/i915/display/intel_bios.c
>> index 6b2924c56cae..378f8b60b4a0 100644
>> --- a/drivers/gpu/drm/i915/display/intel_bios.c
>> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
>> @@ -1448,6 +1448,12 @@ parse_edp_fast_link_params(struct intel_display *=
display,
>>  	const struct edp_fast_link_params *edp_link_params =3D
>>  		&edp->fast_link_params[panel_type];
>> =20
>> +	if (display->vbt.version < 182 ||
>> +	    !panel_bool(edp->fast_link_training, panel_type))
>> +		return;
>> +
>> +	panel->vbt.edp.fast_link_training =3D true;
>> +
>>  	if (display->vbt.version >=3D 224) {
>>  		panel->vbt.edp.rate =3D
>>  			edp->edp_fast_link_training_rate[panel_type] * 20; @@ -1526,6=20
>> +1532,29 @@ parse_edp_fast_link_params(struct intel_display *display,
>>  			    edp_link_params->vswing);
>>  		break;
>>  	}
>> +
>> +	/*
>> +	 * The fast link training rate is limited by the eDP max port link
>> +	 * rate: FLT rate =3D min(FLT rate, eDP max port link rate).
>> +	 */
>> +	if (panel->vbt.edp.rate && panel->vbt.edp.max_link_rate)
>> +		panel->vbt.edp.rate =3D min(panel->vbt.edp.rate,
>> +					  panel->vbt.edp.max_link_rate);
>
>The Windows driver discards the fast link training parameters if the rate =
exceeds the max.
>

Will do the same in v2.

>It also requires DP_NO_AUX_HANDSHAKE_LINK_TRAINING. Without that it will n=
ot use the fast link training parameters, even for a full link training.
>

Will use the params only if drm_dp_fast_training_cap() is true for the sink=
.

Thanks for the review, Ville!

>> +
>> +	/*
>> +	 * The VBT default fast link training lane count is 1, while hardly
>> +	 * any eDP panel uses a single lane. Treat a lane count of 1 as not
>> +	 * specified, leaving the lane count selection to the driver, the
>> +	 * same way as a fast link training rate of 0.
>> +	 */
>> +	if (panel->vbt.edp.lanes =3D=3D 1)
>> +		panel->vbt.edp.lanes =3D 0;
>> +
>> +	drm_dbg_kms(display->drm,
>> +		    "VBT eDP fast link training enabled: rate %d, lanes %d, vswing %d=
, pre-emphasis %d\n",
>> +		    panel->vbt.edp.rate, panel->vbt.edp.lanes,
>> +		    panel->vbt.edp.vswing >> DP_TRAIN_VOLTAGE_SWING_SHIFT,
>> +		    panel->vbt.edp.preemphasis >> DP_TRAIN_PRE_EMPHASIS_SHIFT);
>>  }
>> =20
>>  static void
>> @@ -1555,8 +1584,6 @@ parse_edp(struct intel_display *display,
>>  	vbt_edp_to_pps_delays(&panel->vbt.edp.pps,
>>  			      &edp->power_seqs[panel_type]);
>> =20
>> -	parse_edp_fast_link_params(display, panel, edp);
>> -
>>  	if (display->vbt.version >=3D 173) {
>>  		u8 vswing;
>> =20
>> @@ -1577,6 +1604,9 @@ parse_edp(struct intel_display *display,
>>  		panel->vbt.edp.max_link_rate =3D
>>  			edp->edp_max_port_link_rate[panel_type] * 20;
>> =20
>> +	/* Depends on max_link_rate */
>> +	parse_edp_fast_link_params(display, panel, edp);
>> +
>>  	if (display->vbt.version >=3D 251)
>>  		panel->vbt.edp.dsc_disable =3D
>>  			panel_bool(edp->edp_dsc_disable, panel_type); diff --git=20
>> a/drivers/gpu/drm/i915/display/intel_display_types.h=20
>> b/drivers/gpu/drm/i915/display/intel_display_types.h
>> index 90a5d29169c6..11f90ab1654c 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>> @@ -354,6 +354,7 @@ struct intel_vbt_panel_data {
>>  		int bpp;
>>  		struct intel_pps_delays pps;
>>  		u8 drrs_msa_timing_delay;
>> +		bool fast_link_training;
>>  		bool low_vswing;
>>  		bool hobl;
>>  		bool dsc_disable;
>> --
>> 2.53.0
>
>--
>Ville Syrj=E4l=E4
>Intel
