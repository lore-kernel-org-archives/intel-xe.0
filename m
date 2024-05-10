Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A5AC25B4F
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 09:44:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BB610E871;
	Fri, 10 May 2024 09:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ml/LXf/S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CEE10E871
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 09:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715334252; x=1746870252;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=Ffox9V/AHtuFsr2tl79fPFHEe5Kp08kt29mG3/n2l3M=;
 b=ml/LXf/SQI4AIFivaHKlkJPAxLrl+hmVoNbU8qFWK531bqapRjj5YOLS
 c2QkWl/xzuVw1N2lXselQ4Av+at+grQyZlGyIhoY+mgjBzmYD4r5woB0h
 Nb5Uqp+gpVaP+FG/10tpTQ/KmsGW0Qur3A//xbm8Y6kfi1WG4X7h0e/SP
 U7IzMvk/Nvh8bRr/ZXAqaLKXz0WPPB6fcmWxo1tbETzTuYRLyR5k2meyO
 wUtXP7zKPHpsrSySudyzNV/dDgnDxkjHI5n+kMyTag7x/WdzNQvc1yJD7
 Pobg3Za3gDWBhJLSnAygiQL//oixA9XaWFjb6+iS6jAz2GQFgpoF/YECY g==;
X-CSE-ConnectionGUID: z3zb/w3pROqW8CC5La8iaw==
X-CSE-MsgGUID: 5OjO8aHxR7+tj0Vq7y7mFw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="22458650"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208,217";a="22458650"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 02:44:10 -0700
X-CSE-ConnectionGUID: t5Rh0oSrTKOodQTAaPO61A==
X-CSE-MsgGUID: Ad71JOEvRGSF3yPCJQUiuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208,217";a="29666351"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 May 2024 02:44:08 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 May 2024 02:44:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 10 May 2024 02:44:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 10 May 2024 02:44:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdMf3FsoBNSX8KQ+5QIDgqw6YbK9ucrPfWqMVwIwYzNSYkCjF9LDWzuATGNoTLgVERsLgFJ4phmH9/GWq+C7IJfZg4CbBpb9OM7ZAtBw484EN8ya0/G9BT+xzlIcOsx0kE3Eh5vAZAfrCg/1yFqDkpIlb3vtXFuqskDb0/YiCa0G96ig8+5cxME5jSrzQH7RG4zjkY9AafZAEJEGyZlBDGFM5Nw9pr6Nc9W2MBnR5GTcoyIJuQeMoamxYH5uHkahuOectp8ZGu6LL8BwxeSQqc30WZeCaCMqy9+wrEGewl3I6RRsJzFUEcVjiEdHiMQZLlgXIvuoC00HGugTLU4qrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+R7hfxcIkEQ5HC9YIdpb1/NMIu5/rlBD7fkNOvlSoM=;
 b=GUpxpNhm+kSxuxJPMRYLOGqGs/qTQswHOZ+oVWZmHKw8Y/uxuu+zd3+Xq3Q4ZzVHkMeOt7tZxJNDqMMjzBuiulrkCKgGW8H/X4/8KBIn8hQuwhrBoptnqNc49AkmlbveZniUOa5tzgMblOJYqV5sKr+OTUXke8XYlAO0tuwGzpUgjvjTRRjmmGD3XEWbR3pVmUIxsdtA+AvTFdyslAacbC4xTsBI66cdXPfKXWvDVw5qSyiZ9n+7lmN68/iVT5IB2IwClEBE5rmAuEV0ilJlEVgVzzfoPcmCF1mrmlHqX8+WMpFC6nY5Jw0ppeRuanY+wMySKDb77G5Sd2b1uoQ1SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH0PR11MB5283.namprd11.prod.outlook.com (2603:10b6:610:be::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48; Fri, 10 May
 2024 09:44:03 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7544.045; Fri, 10 May 2024
 09:44:02 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
 "Konda, SaiKishore" <saikishore.konda@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Siddiqui, Ayaz A"
 <ayaz.siddiqui@intel.com>
Subject: Re: [PATCH] drm/xe: Modify minimum of various scheduler timeout to 0
Thread-Topic: [PATCH] drm/xe: Modify minimum of various scheduler timeout to 0
Thread-Index: AQHan7gxBZth6vRpC0quH9Xo1BUEo7GNUb8AgAHC6ICAAR+PAIAACWnP
Date: Fri, 10 May 2024 09:44:02 +0000
Message-ID: <MW4PR11MB705636A5456E4D03F69005E0B3E72@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20240506133447.3143994-1-himal.prasad.ghimiray@intel.com>
 <27iutedmzaotadr7fhnqhvy6naydrsqstgarjmqa4ltmlsowix@bn7n2shccrgd>
 <ZjzzKwMHFjdQaG7m@DUT025-TGLU.fm.intel.com>
 <171533219643.7531.15603783689137370423@jlahtine-mobl.ger.corp.intel.com>
In-Reply-To: <171533219643.7531.15603783689137370423@jlahtine-mobl.ger.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|CH0PR11MB5283:EE_
x-ms-office365-filtering-correlation-id: f9efb0ae-7323-4166-2fa6-08dc70d5b9dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?3ZzMiY7ndC378NqgNE5WaHBdXPXxSR5qU5YrOPCub8KevWiib9uBJiSdSQCB?=
 =?us-ascii?Q?e6MrxFYr8gwxu38QsKgFn+NhmRIJhXt66jSpLFVP2awglXPQbGljbb1HhuuW?=
 =?us-ascii?Q?4CCaOqh/hUmjVbCAUdCqUGgkcoeP+NPyOmjmPW1exWbOqs3ziN/ppzO2045x?=
 =?us-ascii?Q?KVFGCrv6vSclkid6d2LC+qKpWQYqo2jWaulF08ETq0PLMfSgnpAWzBegFGfY?=
 =?us-ascii?Q?Q+mYJqOpHb+HXeK+XHy8/zLl80j6tsuflDGsWasdgocozu1/lSYEvgj4vYdS?=
 =?us-ascii?Q?er2jjkaehmI2G54XcAXeEfZl756+N7jD/0WTnayw8TLxdJQqNtKVfFKbKwFW?=
 =?us-ascii?Q?NCbyOQucYdnBd70SLt3nHsdIb+kw+8lQtiuRCqsCPsuIitflybBKw4j7Drps?=
 =?us-ascii?Q?OG5WkOYf2G3JlQn+Pyor2cMNAlm9cYkWmztthIytmzYRs+f1zqf+/AmsnE+q?=
 =?us-ascii?Q?/y4x1WGz3T4dSANHepAlEDkdOV2XvKNKMmdZpaWFGoKJWpP0fLun62RqrGlk?=
 =?us-ascii?Q?RgUPiNUX7oJRP8fvgQnosJwCBKIbILoXCEo0xKFR8PdVxeuVarIxi6TGD99I?=
 =?us-ascii?Q?Lmfy088QDJdKLWoKr0FY+U4zpDgkiN8dKTbDIQcYxtd5nCKX7nr4psn2gol/?=
 =?us-ascii?Q?aUj9+RVGJlVFG6PKsSq57zbPTfJD+pvSGDtdA+1KlMsBmvRUBMbDxQXEPBGY?=
 =?us-ascii?Q?wLns2kUziMSZmlkDMy6V04fTh1nB0gaqg09BCwVSuqoBkYEXRMgzDPK9xk6Q?=
 =?us-ascii?Q?I/mrkMY4lOGZrJ6uo5QFD69joI1Atz1o4vfixsjzikQxNT3P4/116ODOO/lu?=
 =?us-ascii?Q?NM3hCRt9KXyRE6nss5WP9ioX5jNbuoMSVaXfzsuNnjkJgerY79X6AYhThc1F?=
 =?us-ascii?Q?+w8FHEJMBaY9kOmXqKdb1aEv5eFfesVMIgn+zFCG3+Jslxvaxl4nJ5gVfEm8?=
 =?us-ascii?Q?/Wg/MHvouAuR4bM85kLZiLKeBS1PtME3It1GMlLDfH9TaIa6NjwP0+JQR6bd?=
 =?us-ascii?Q?z1Xc6kw4sRuuz5PYC3ferb4/tfTe2lTfTzPgMzK+lhYTpglphHODMBMqSnSz?=
 =?us-ascii?Q?XRULKULuVEiBGOYUMk5MYp+RlJfDQHYvI16NRXyP9xhKvasJ8GNRBnyiTZWi?=
 =?us-ascii?Q?n9oX60OeQNsBnC1Rt0TITbPr0DxPS3q90aMMS5wVDq7PgjR0xBBg0dPpTZuI?=
 =?us-ascii?Q?sUHyKguUFS2KFBP1xXOwUunwS/oO32tKm11HWAXkuyewLqItNX4ToQJq1+Ku?=
 =?us-ascii?Q?XZlBWoBhGWwvVBT8yKcuaVdgzG0iTqldrkwFdlKaEHHPUqXO2qK66Aas7OLc?=
 =?us-ascii?Q?1WFT3te5IeaH6DUbAwSdvcKlRfOjGybGob0NlPvwlR11rg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JF++jj0NJMzjKmeO4asnrWZFaOW4mgblkpuGZo7lC1IsfFFfdjrO2ZwZKlpA?=
 =?us-ascii?Q?cZF8rTU/bthMGzvy9HW4NtgSmiC+yop4mCWn16NOmk9luXmsPM1mqcy8rRGk?=
 =?us-ascii?Q?zH1/j7rNOPSENGauGobLQIm9/5ZMUYXdl444A236fABUexR1ZWkI2wr3RaZo?=
 =?us-ascii?Q?kw5yT+e4Kv0IKbuWjPccHsfERjLcWSYcyMOgubEtkwdrdARc7yKQx+jks5QX?=
 =?us-ascii?Q?whfmh1dAkeQ9J6jvS5jUzR0AWUWqA4Dm0ydD0yXL0n+iYFojXnrS5gHIe3LE?=
 =?us-ascii?Q?HBEpEWOORNAcbfR83rcMoV9+8Z3WfR8WTthscufpyx+wfsaqQa/xPn5OlVIf?=
 =?us-ascii?Q?A580yvNSPbygKFJBz7HVpCZ4tNLHP5Y3xTL5d7JemufGALu4kMwkdSmWXsgV?=
 =?us-ascii?Q?zyPIqIZIRMtEv2qEAP1mNpCV+I/LfkvwChRZDdggRt9ZA20x1NGFOS450aXu?=
 =?us-ascii?Q?U5oPibyMdN6T1tFmlRGrFEIpUtmCQfLECMMaHsTm/QtTqCSM9ZFvS0SMP3lK?=
 =?us-ascii?Q?SmtB7ECsWQj8tEp046tk4uwRk3nb8seywElPxcqMqwdf3Ma20jeaBS53qUzL?=
 =?us-ascii?Q?6VAo3/rHsKWETX4v+5VVBrBnkHnvboYYRO4rFGr0oj1oc+m5L7gmnhOrV2Bn?=
 =?us-ascii?Q?6tjeTvPgUv/Lhmy720HVAno5QrYrlQaqvLSuhs5p+UZMu2MmbMpCq2Fa1nk7?=
 =?us-ascii?Q?yVxoGBZ9o6PxyRMe3z5V5aoHlj7qalr8A+TIVzHT+Kii5aHOpuBCYSSDlVQC?=
 =?us-ascii?Q?yHUVnv++lYkgDL2H48IvrmfDrZ/mW/tqurIURUBpmeefii6g2ywW2XP7l32U?=
 =?us-ascii?Q?awiEd9GYJ0z9e+sQgsP1n/LfIDco7idwssYqRFG6LRmcoFhdPApKJATRtmvR?=
 =?us-ascii?Q?bWuZdIX1U9JSrjB2AD8l86kdsy8imefJWFszUbZobmUUHznEIub54jW6CUUQ?=
 =?us-ascii?Q?MeH/OT+dlXstGRbG4ixvh6rF6wzXRitF4GrAIqKgJiN7/GmwocBFIDxqc6Nm?=
 =?us-ascii?Q?8Vx505byUg4IqHDUZxol4Vul9/CBQfgDLtJGrQFzW0O513gD9KcaBxMHbyef?=
 =?us-ascii?Q?/vaR+2VHDjw4fBX4q08pOi5KLQsDQoUSyY/G7NQGrFavRJO291Pm3SSKDp6G?=
 =?us-ascii?Q?BcEoafpsjZi1oiLAg89skvAIEP0t7gAsj/2/vSOFFKpSoQgRngGyqjZO3CUD?=
 =?us-ascii?Q?Ig+x8F4clxh5v0hGzqiJusmJ8FHXKKGtoMMh+qkadXDM5VNquNG241Ne0wYb?=
 =?us-ascii?Q?cDjtKJChG5vebs9hhyd8yBX+Db0EB/T/njJrFnytYGeyCHbAgRIBgUEYyyfH?=
 =?us-ascii?Q?aWZJM8p/vTJS/bZYeosvUAQ64cI0uPj+YHs8bQUkYsJUbRveESGLyXkLQsEU?=
 =?us-ascii?Q?cPvtqNoFYLa56TBfW1Txl8+GBxovc/JD8HEL76dv63VJ5WTfupeZr8Gc0gmU?=
 =?us-ascii?Q?3SiWP+6xgWMAKx9Rk/MuW5dzlaN4Vn02YKPZPOfXkkOs0wabcKnXSB9bXDwa?=
 =?us-ascii?Q?ss5rrchATaXVZjHSxIYpdRJ+jky+posOh5rG8OFpE/7Wcg2xZ05oAPCW8oTK?=
 =?us-ascii?Q?00bdMGatoCZnNi18bR2Gjhv7YZ/d2vJ0avPWQUxwdCzCLtiI6ipHKyV7Voac?=
 =?us-ascii?Q?aRThk6+RMeIXl/Idc4p89y0=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MW4PR11MB705636A5456E4D03F69005E0B3E72MW4PR11MB7056namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9efb0ae-7323-4166-2fa6-08dc70d5b9dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2024 09:44:02.7878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TB3gOKFEjErgLMGVVSsGUv4g7eqOJKNpWKhywp8cTsLe1S0Xif/SWy/l98knOQRPjlw8+juIppHGLw3+Ss/ys9lpk8LhfZxniV54QrsNGVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5283
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

--_000_MW4PR11MB705636A5456E4D03F69005E0B3E72MW4PR11MB7056namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


________________________________
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Sent: Friday, May 10, 2024 2:39:56 PM
To: De Marchi, Lucas <lucas.demarchi@intel.com>; Brost, Matthew <matthew.br=
ost@intel.com>
Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-xe@list=
s.freedesktop.org <intel-xe@lists.freedesktop.org>; Upadhyay, Tejas <tejas.=
upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe: Modify minimum of various scheduler timeout to=
 0

Quoting Matthew Brost (2024-05-09 19:00:43)
> On Wed, May 08, 2024 at 08:06:52AM -0500, Lucas De Marchi wrote:
> > On Mon, May 06, 2024 at 07:04:47PM GMT, Himal Prasad Ghimiray wrote:
> > > Remove the min/max configs and change minimum values of preemption an=
d
> > > timeslice to 0. The sysman teams must deactivate preemption and
> > > timeslice to assess exclusivity mode. They depend on configuring
> > > timeslice_duration_us and preempt_timeout_us to 0, ensuring these
> > > values are set at their minimum.
> >
> > nack for now, based on this explanation. See below.
> >
> > >
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com=
>

<SNIP>

> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> > > @@ -10,41 +10,17 @@
> > >
> > > struct drm_printer;
> > >
> > > -#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> > > -#define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> > > -#else
> > > #define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1
> > > -#endif
> > > -#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MAX
> > > -#define XE_HW_ENGINE_JOB_TIMEOUT_MAX CONFIG_DRM_XE_JOB_TIMEOUT_MAX
> > > -#else
> > > #define XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000)
> >
> > previously one could configure a kernel with a different max.
> > And now it's hardcoded. How is this better and related to the
> > motivation in the commit message?
> >
> > is this commit doing 2 different things?
> >
> > 1) Removing the _MAX from config since nobody is or should change that
> > 2) Modify the min value to 0... That seems weird as basically there is
> >    no minimum.
>
> This is true.

Maybe I've missed some discussion but what is wrong with the previously
agreed approach where KConfig would determine hard _MIN/_MAX bounds
(and maybe _DEFAULT) that the kernel can work with, then there would be
sysfs min/max (+ default) which the sysadmin sets as comfortable with
considering the expected use-cases on the system and application then
choose within those bounds (if it wants expedited hang detection for an
example)?

> > I'd like to hear Matt Brost's opinion on that.
>
> I chatted with Lucas and second his nack. The requirements for this
> change are coming from sysman and are unclear. If sysman needs to set
> this to 0 (akin to no maximum), why can't sysman build the kernel with a
> Kconfig to allow this? This use case appears to be an HPC/AI data center
> scenario in which the kernel is probably built with a non-standard
> Kconfig anyway. Why can't CONFIG_DRM_*_MIN be set to zero? This needs to
> be addressed clearly and publicly.

I also thought we agreed on doing different build for such scenario
where the interactive desktop is not expected to be used, so larger
delays are more allowable.

The default build simply can't allow unlimited blocking of the HW by
certain workloads in order to make sure the desktop/compositor stays
operational. That can only be enabled by default build when the long-runnin=
g
workloads can be isolated so they won't interfere with the workloads
using dma-fences. And I don't think that code exists yet.

Sysman should be able to report a feature missing from the kernel if it
detects that it can't set the limits wanted. This can be reported to
user via error code and/or error message asking to install a different
kernel build.

Same strategy has been applied in the past for various kernel features
like realtime/virtualization etc.

Regards, Joonas

>
> Matt
>
> >
> > Lucas De Marchi
> >
> > > -#endif
> > > -#ifdef CONFIG_DRM_XE_TIMESLICE_MIN
> > > -#define XE_HW_ENGINE_TIMESLICE_MIN CONFIG_DRM_XE_TIMESLICE_MIN
> > > -#else
> > > -#define XE_HW_ENGINE_TIMESLICE_MIN 1
> > > -#endif
> > > -#ifdef CONFIG_DRM_XE_TIMESLICE_MAX
> > > -#define XE_HW_ENGINE_TIMESLICE_MAX CONFIG_DRM_XE_TIMESLICE_MAX
> > > -#else
> > > +#define XE_HW_ENGINE_TIMESLICE_MIN 0
> > > #define XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000)
> > > -#endif
> > > #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT
> > > #define XE_HW_ENGINE_PREEMPT_TIMEOUT CONFIG_DRM_XE_PREEMPT_TIMEOUT
> > > #else
> > > #define XE_HW_ENGINE_PREEMPT_TIMEOUT (640 * 1000)
> > > #endif
> > > -#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
> > > -#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN CONFIG_DRM_XE_PREEMPT_TIMEO=
UT_MIN
> > > -#else
> > > -#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1
> > > -#endif
> > > -#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
> > > -#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX CONFIG_DRM_XE_PREEMPT_TIMEO=
UT_MAX
> > > -#else
> > > +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 0
> > > #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000)
> > > -#endif
> > >
> > > int xe_hw_engines_init_early(struct xe_gt *gt);
> > > int xe_hw_engines_init(struct xe_gt *gt);
> > > --
> > > 2.25.1
> > >

--_000_MW4PR11MB705636A5456E4D03F69005E0B3E72MW4PR11MB7056namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div><br>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Joonas Lahtinen &lt;j=
oonas.lahtinen@linux.intel.com&gt;<br>
<b>Sent:</b> Friday, May 10, 2024 2:39:56 PM<br>
<b>To:</b> De Marchi, Lucas &lt;lucas.demarchi@intel.com&gt;; Brost, Matthe=
w &lt;matthew.brost@intel.com&gt;<br>
<b>Cc:</b> Ghimiray, Himal Prasad &lt;himal.prasad.ghimiray@intel.com&gt;; =
intel-xe@lists.freedesktop.org &lt;intel-xe@lists.freedesktop.org&gt;; Upad=
hyay, Tejas &lt;tejas.upadhyay@intel.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/xe: Modify minimum of various scheduler tim=
eout to 0</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Quoting Matthew Brost (2024-05-09 19:00:43)<br>
&gt; On Wed, May 08, 2024 at 08:06:52AM -0500, Lucas De Marchi wrote:<br>
&gt; &gt; On Mon, May 06, 2024 at 07:04:47PM GMT, Himal Prasad Ghimiray wro=
te:<br>
&gt; &gt; &gt; Remove the min/max configs and change minimum values of pree=
mption and<br>
&gt; &gt; &gt; timeslice to 0. The sysman teams must deactivate preemption =
and<br>
&gt; &gt; &gt; timeslice to assess exclusivity mode. They depend on configu=
ring<br>
&gt; &gt; &gt; timeslice_duration_us and preempt_timeout_us to 0, ensuring =
these<br>
&gt; &gt; &gt; values are set at their minimum.<br>
&gt; &gt; <br>
&gt; &gt; nack for now, based on this explanation. See below.<br>
&gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Cc: Matthew Brost &lt;matthew.brost@intel.com&gt;<br>
&gt; &gt; &gt; Cc: Tejas Upadhyay &lt;tejas.upadhyay@intel.com&gt;<br>
&gt; &gt; &gt; Cc: Joonas Lahtinen &lt;joonas.lahtinen@linux.intel.com&gt;<=
br>
&gt; &gt; &gt; Signed-off-by: Himal Prasad Ghimiray &lt;himal.prasad.ghimir=
ay@intel.com&gt;<br>
<br>
&lt;SNIP&gt;<br>
<br>
&gt; &gt; &gt; +++ b/drivers/gpu/drm/xe/xe_hw_engine.h<br>
&gt; &gt; &gt; @@ -10,41 +10,17 @@<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; struct drm_printer;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; -#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN<br>
&gt; &gt; &gt; -#define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIME=
OUT_MIN<br>
&gt; &gt; &gt; -#else<br>
&gt; &gt; &gt; #define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1<br>
&gt; &gt; &gt; -#endif<br>
&gt; &gt; &gt; -#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MAX<br>
&gt; &gt; &gt; -#define XE_HW_ENGINE_JOB_TIMEOUT_MAX CONFIG_DRM_XE_JOB_TIME=
OUT_MAX<br>
&gt; &gt; &gt; -#else<br>
&gt; &gt; &gt; #define XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000)<br>
&gt; &gt; <br>
&gt; &gt; previously one could configure a kernel with a different max.<br>
&gt; &gt; And now it's hardcoded. How is this better and related to the<br>
&gt; &gt; motivation in the commit message?<br>
&gt; &gt; <br>
&gt; &gt; is this commit doing 2 different things?<br>
&gt; &gt; <br>
&gt; &gt; 1) Removing the _MAX from config since nobody is or should change=
 that<br>
&gt; &gt; 2) Modify the min value to 0... That seems weird as basically the=
re is<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; no minimum.<br>
&gt; <br>
&gt; This is true.<br>
<br>
Maybe I've missed some discussion but what is wrong with the previously<br>
agreed approach where KConfig would determine hard _MIN/_MAX bounds<br>
(and maybe _DEFAULT) that the kernel can work with, then there would be<br>
sysfs min/max (+ default) which the sysadmin sets as comfortable with<br>
considering the expected use-cases on the system and application then<br>
choose within those bounds (if it wants expedited hang detection for an<br>
example)?<br>
<br>
&gt; &gt; I'd like to hear Matt Brost's opinion on that.<br>
&gt; <br>
&gt; I chatted with Lucas and second his nack. The requirements for this<br=
>
&gt; change are coming from sysman and are unclear. If sysman needs to set<=
br>
&gt; this to 0 (akin to no maximum), why can't sysman build the kernel with=
 a<br>
&gt; Kconfig to allow this? This use case appears to be an HPC/AI data cent=
er<br>
&gt; scenario in which the kernel is probably built with a non-standard<br>
&gt; Kconfig anyway. Why can't CONFIG_DRM_*_MIN be set to zero? This needs =
to<br>
&gt; be addressed clearly and publicly.<br>
<br>
I also thought we agreed on doing different build for such scenario<br>
where the interactive desktop is not expected to be used, so larger<br>
delays are more allowable.<br>
<br>
The default build simply can't allow unlimited blocking of the HW by<br>
certain workloads in order to make sure the desktop/compositor stays<br>
operational. That can only be enabled by default build when the long-runnin=
g<br>
workloads can be isolated so they won't interfere with the workloads<br>
using dma-fences. And I don't think that code exists yet.<br>
<br>
Sysman should be able to report a feature missing from the kernel if it<br>
detects that it can't set the limits wanted. This can be reported to<br>
user via error code and/or error message asking to install a different<br>
kernel build.<br>
<br>
Same strategy has been applied in the past for various kernel features<br>
like realtime/virtualization etc. <br>
<br>
Regards, Joonas<br>
<br>
&gt; <br>
&gt; Matt<br>
&gt;&nbsp; <br>
&gt; &gt; <br>
&gt; &gt; Lucas De Marchi<br>
&gt; &gt; <br>
&gt; &gt; &gt; -#endif<br>
&gt; &gt; &gt; -#ifdef CONFIG_DRM_XE_TIMESLICE_MIN<br>
&gt; &gt; &gt; -#define XE_HW_ENGINE_TIMESLICE_MIN CONFIG_DRM_XE_TIMESLICE_=
MIN<br>
&gt; &gt; &gt; -#else<br>
&gt; &gt; &gt; -#define XE_HW_ENGINE_TIMESLICE_MIN 1<br>
&gt; &gt; &gt; -#endif<br>
&gt; &gt; &gt; -#ifdef CONFIG_DRM_XE_TIMESLICE_MAX<br>
&gt; &gt; &gt; -#define XE_HW_ENGINE_TIMESLICE_MAX CONFIG_DRM_XE_TIMESLICE_=
MAX<br>
&gt; &gt; &gt; -#else<br>
&gt; &gt; &gt; +#define XE_HW_ENGINE_TIMESLICE_MIN 0<br>
&gt; &gt; &gt; #define XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000)<br>
&gt; &gt; &gt; -#endif<br>
&gt; &gt; &gt; #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT<br>
&gt; &gt; &gt; #define XE_HW_ENGINE_PREEMPT_TIMEOUT CONFIG_DRM_XE_PREEMPT_T=
IMEOUT<br>
&gt; &gt; &gt; #else<br>
&gt; &gt; &gt; #define XE_HW_ENGINE_PREEMPT_TIMEOUT (640 * 1000)<br>
&gt; &gt; &gt; #endif<br>
&gt; &gt; &gt; -#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN<br>
&gt; &gt; &gt; -#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN CONFIG_DRM_XE_PREE=
MPT_TIMEOUT_MIN<br>
&gt; &gt; &gt; -#else<br>
&gt; &gt; &gt; -#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1<br>
&gt; &gt; &gt; -#endif<br>
&gt; &gt; &gt; -#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX<br>
&gt; &gt; &gt; -#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX CONFIG_DRM_XE_PREE=
MPT_TIMEOUT_MAX<br>
&gt; &gt; &gt; -#else<br>
&gt; &gt; &gt; +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 0<br>
&gt; &gt; &gt; #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000)<=
br>
&gt; &gt; &gt; -#endif<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; int xe_hw_engines_init_early(struct xe_gt *gt);<br>
&gt; &gt; &gt; int xe_hw_engines_init(struct xe_gt *gt);<br>
&gt; &gt; &gt; -- <br>
&gt; &gt; &gt; 2.25.1<br>
&gt; &gt; &gt; <br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB705636A5456E4D03F69005E0B3E72MW4PR11MB7056namp_--
