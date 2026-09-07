Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D9AC79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 13:21:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77AA910E3A6;
	Mon,  7 Sep 2026 13:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fmbQ7qmP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2C410E13E;
 Mon,  7 Sep 2026 13:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788787282; x=1820323282;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=laDchXvjksLnbPOkbaYvYbtPNVxdoPsM6o5Lnp7W6zU=;
 b=fmbQ7qmPkbrWfEYBpIG1rhn3AV7r8XLzG5nvg1OjEOV51VnMxeUbErNp
 Dh1rALx3vtsE/XVFY1PwQZ33t/DM4zWUCxhaiQ+lA3Ysy1rgol2EqV2AO
 L5WRlVR3yL5G+5ubXfFkGJxU86IFBps+6hyAk5kuWRp8K19N/RPSlEQKF
 Zz3Mihy0dp1dKxV1X7bUEOA/aafIRfRKp7rWLQyn2hcpN3NLZ/X0f77qn
 UYGQQINWDjvLjLc1kHh7g539UdMqHaq2SPNXMlFiMaeU4yhaa2QhT+H02
 O3kSv+MERRZ+JW0CtvWP5FOin/V3ijuXliiMxQKzyuZSGKOFZFwi3fuDl g==;
X-CSE-ConnectionGUID: qC66i8HXQRiDVp6OJ2UqkA==
X-CSE-MsgGUID: jAMv5kV5TGmdKYYhcXR+Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89222987"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="89222987"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 06:21:20 -0700
X-CSE-ConnectionGUID: yiALxyGTSvSsQlVyekZOdQ==
X-CSE-MsgGUID: f1eiCNZYRd2Wqwg9KZaYeA==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 06:21:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 06:21:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 06:21:17 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.11) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 06:21:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eB0f/YFAQkfzA5xsAr24EY0o2ZnMvckz6020gotyvh3JCLvQ9mASJZhNAU+Hu268bPJlWQWTkL7Ju0kWZaXRq5SYXAqTW7eXTdyCO6k2+RgQXWKMHy9qm+qWfa/VZ5HPfvyym+NQfcBhrx7/ln/fkM5FCktIiq4uGazqC5Sf0f0wKVBw914memdCKPIVWBlND6GTTZguyuIig/0d7AV74nMFaTV697DuC9xCug05q2sX9FuJl1UtN6/oXrDM8fdlwIEvhxBWzn1+errXtnz5/f1loU5m1MNABAd4ibtNZVnYI+Vh7wp+26KnHJ+0iYMPtxWtLNpvSUAJNK3GedqocA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5q0lAeid8NnWfdnahNBrQ50ozR1Cna9UoGIEg8C4JE=;
 b=qLK5OeLwy6+cWl2nJ8D6bmlILT17E4GPDApxx9tpwQYYKtGBlegGPi/dHEB3E10w6dOrUNR6CmB+lw+y0iG0HG8stMMqJOzWbKd9uKziniLQPTcaR/bGCwoitiBQHpSBvE/nGWXppmoH1lcFXTa3wYPDvFYMJVLBP/pQe2WKaGzWrR3g+kfg/Wz/5zIHQhGwwIdwBOGMBooSPNj79AXDf0GKu/JMCc0JujGFlqSjPX0oC9hV6sCn6wsoWXIlfymuXqHYc2WPwMBjUKMuyeHab1TK3o0kwUEJqYSWCK9Gykgm/SySsFJqEzKdxWs+23eO81e3Z202SddW6SJpwWWZiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB6887.namprd11.prod.outlook.com (2603:10b6:303:225::16)
 by MN2PR11MB4614.namprd11.prod.outlook.com (2603:10b6:208:268::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.14; Mon, 7 Sep
 2026 13:21:15 +0000
Received: from MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494]) by MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494%5]) with mapi id 15.21.0382.012; Mon, 7 Sep 2026
 13:21:15 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/display: Limit SEL_FETCH clear to supported pipes
Thread-Topic: [PATCH] drm/i915/display: Limit SEL_FETCH clear to supported
 pipes
Thread-Index: AQHdPDbxaxy2NJaVoEara7ZpTwvCXLa+AIYAgASEW1CAAGEegIAAOQHQ
Date: Mon, 7 Sep 2026 13:21:15 +0000
Message-ID: <MW4PR11MB68873BD12A3FC6DDC465F612E3B22@MW4PR11MB6887.namprd11.prod.outlook.com>
References: <20260904062744.3010375-1-nemesa.garg@intel.com>
 <9514a15f9ded3fa79572f92a61f33650c4ab02e6@intel.com>
 <MW4PR11MB68875FF691238037309DD2CAE3B22@MW4PR11MB6887.namprd11.prod.outlook.com>
 <8ff50197b06bfab7e228805760acf7f793f80248@intel.com>
In-Reply-To: <8ff50197b06bfab7e228805760acf7f793f80248@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6887:EE_|MN2PR11MB4614:EE_
x-ms-office365-filtering-correlation-id: 1135a6a0-501a-454e-6a41-08df0ce2e4ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: fk+fbCkHp9PU/eHmqYHQ4TJtBtbuUft/vD0A7JnrViYK5uxVd5OiR7atYFpX7GxqT6Th9W5SzQj6R64loeiMcpEF73f7wCBaQwN5rna8yKm6zFUGl0xS/C7ALjPidA04HxziMuUFb1ct7cEDVU8UVzoGHR0nHxye8mumnjfnVj42lO7KFPb2bzHKOBBxupJu4T5Rfl9XuVJ8MUMQSdpN+4DtOaMoNOwSnfTzeVaAgDetK8qrdPUkWxWF6/FIEoq1rwLzSckGB/adftxOI9gQGG+0+lkt8CTIBq1TNBcLzdIuApOf7l/0ghlOFQQ9WbvdVeVPdCgMjgrt5Y5H5w24z2r79Wup3TAQsQrCP5VJqvsCqQIG1GAtO4hJPwfhJHjFcLleAWDhumvplcDLqiP4RChT4CAfWlhYwIz5MzJKMuOJx05wBsy628j7uOXzpCpnj9WUYt/k7BZy+yQrZ7OqjSgUqXKSWWih/XCbIL6BPzGmnYHhyN2EcGr5FfKJeJ3SMLI0WgV9AYDNJ1PlK8Ug4E3657tb6T2v4razjDNNubrk8UetmAv6D50SStUjIAIFfuR8XHU2sUKGTeumMeFYACngFfSDTRr1cUhEMA9QZfPZasMAeEfo2OfRP9PyyBGPS2IgvGKmFOxW2tH8M8O53IUmdfuyICRCIoAmTGtk7o0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6887.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Bz/mzUWcjC1GIWKPrUgswFDVghHs0/oasQQc3RdINj35zU5xruPHyBgSjFWi?=
 =?us-ascii?Q?dWYaT15wmF4Kg7dylc7IW18ZegKRPqlB0QMP8fsDdrK84frceFrH9y6h42g/?=
 =?us-ascii?Q?xMrCy34hF4b5Rz7iu0ZH0f5HBNkPKCfUSChlGZZU1fxhTNAAfdShIrxMLgOA?=
 =?us-ascii?Q?TtPEIy76Cpgdie0wE/zRRHavFZHELpEsZXrY+id5s8zl9kWNz36C6lEU4d6j?=
 =?us-ascii?Q?QMcb8D2Wbc0tmYs7gAHTjBmnVtW/4M4Yz8viQUjFvOxo5rWOeC0bWwuTmRuZ?=
 =?us-ascii?Q?7FWJKCzodyd2ogIEhUOauVYIVdIqlKs6ZK3zT4hedrTw/r4if1Wc7RvO8fJ2?=
 =?us-ascii?Q?F9/rQ+/RVUUtG1iQTL57jKvk6jCbTax7tldnPjfcts/GD6qJOkd7I28gdTqh?=
 =?us-ascii?Q?NOlkc15V68+kcVqhwX6AH9cO2G6X7PgYHfC2Ps+ETCqdvUqlatH6qzMNpR42?=
 =?us-ascii?Q?hnKS3ae9rgYKJ7amDx/4e7rvuUV1h3n7GIZa6Dvi2FaoxkPlcKOjKbgkEJ1O?=
 =?us-ascii?Q?sxczhiohytbDz4Gijj+ZwByPV86o6w5x8IeULM9oW4ZZ84C8DGi5dOZaHBTC?=
 =?us-ascii?Q?2PBsBnnWFm16oodCjMDNjYX8QpmZ9V6C0YpmMFsUkXt8vFGp7KhkeFVtNYDE?=
 =?us-ascii?Q?38slEo+QUHbuUDZbBvkYd6mgP4ZS8N8QfCn/3j/xopBYjBCom9Kz5bEB+A2h?=
 =?us-ascii?Q?EwJh5l/LmKJMegrSmyH6dq5l3W3QHI5t1rPFHHsQJK1jiJZARMtP/I+p2myZ?=
 =?us-ascii?Q?BvACjvbOIsDGRzWhr39BAXBSyb/Lnhavv0SFiH5J2f64hmwnBBM1NROSlz3F?=
 =?us-ascii?Q?I/vIakNhF3XhbbudlRs6EvllZr4V7eaLITQ1UsX1b/F+lvKcbs+fbMkovc1r?=
 =?us-ascii?Q?NJZUoeC+baZdxOS3h6QAlrdGJO5CE7di6InI+7foV4eXB78zRWCRKBWETI22?=
 =?us-ascii?Q?kZGtGE2CBhafuFs584k2yEGi2D4FBGbajkFyvPqytOyiFhtjpa69OIZiI0RY?=
 =?us-ascii?Q?GWpZO7ThldNdRwwDgU5bb8znmk/zlMZn4BS+6woU16atMYd/6gS4KBME0HSS?=
 =?us-ascii?Q?NMvaMSHY2Wn4YHebL0KRIVBO5h0Ts9Qd6SHgPhiW/oktTa94cDTMm2iAZARe?=
 =?us-ascii?Q?txearkwUmLtvaDILToBt/zuXIoJw+qgFszvZ+eZIeQVYqvvPcDysPz3yuEgc?=
 =?us-ascii?Q?g+XJe4rRrPs7OIxIQepGygeens7obw4dnZGGBXZWZNShZF9jJG8y46W5mQRG?=
 =?us-ascii?Q?eWXL8aE1ZwKAAPTwdc/jtMNSBJ+4azwR37EZdXKQdioaAkzBADBmA4PraEzq?=
 =?us-ascii?Q?F11E6+f5Wrnm9uGQZaMQSkojF3ogCyDJsP/9eAHCuXr+1dGtkh131tqBuHnb?=
 =?us-ascii?Q?w5bm+cr38HI5wX29vbYBTXBodJwrhd27/x0vYwqOXjcDE5sT6aPBQ0eveN5/?=
 =?us-ascii?Q?wlIdBJNV8yO4X3VThS1vu2X4lI/mYmRdQdiA09xBOswCk0/nZ/SK2g9H4f24?=
 =?us-ascii?Q?8/d+1PLXuLXvpSwvVpUpluSO2DYCv0WcEwtPdw0WKzYapZMzDsFCEeXXh2h7?=
 =?us-ascii?Q?ahqBbIUcZGEiecpuJZ1LDiqBR8/bosrlh+j8MBjXaSLebUczwk5NJ4+6l0Z2?=
 =?us-ascii?Q?GDrgw8rcFZjZiDM91goz/D8rbFNXYCiqg50bACYsNEVvQfMBKP6ibQ5lTRfA?=
 =?us-ascii?Q?FrM+q3q5W8RBo5nTwxQEgC5Et5ncC7Q+eb7gHjfb0NjaAYpjFUTgRh3kmuJ0?=
 =?us-ascii?Q?swf2dwS4xA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lo+7AgxG8x7kAMIcaArZbYr4MsbLlvRa/dnMNxWjyuHqvargr5trNW7Fb/YwDt8P+/90/T2NbQ7vOjL2gIZ8czylto3rsV6sqVSR3kCL7z9WwMKJiXeRuA6S7xJLFmcuUpO7dMSB5EWpRyj88dt3KJc1nx31ONbczBbHv1UaE4bttS36QsHspYzz7apKT5C/8WYrcXkgUMADI4dJJaSuqG/7n8zPuksX92dlWqFzj423SC8L9pSiSxpgcfh7EGrClcAMzo3z9dLALN0ubPyyt26iFJoDzoettB2JhE7UErNj2qClb/n4ySwWbCyHkp1bt4DAE8JZdAI8eBbm/1fa0g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6887.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1135a6a0-501a-454e-6a41-08df0ce2e4ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 13:21:15.2395 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8jqNLfWSl8ZBvrbTHKV8fnkrgjAYMm47PHKZxRzDjcOlD0LFJHfJTVyxtg97OAIO0EDFs5N7DIvT8XKuGkQbOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4614
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
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Monday, September 7, 2026 3:27 PM
> To: Garg, Nemesa <nemesa.garg@intel.com>; intel-gfx@lists.freedesktop.org=
;
> intel-xe@lists.freedesktop.org
> Subject: RE: [PATCH] drm/i915/display: Limit SEL_FETCH clear to supported
> pipes
>=20
> On Mon, 07 Sep 2026, "Garg, Nemesa" <nemesa.garg@intel.com> wrote:
> >> -----Original Message-----
> >> From: Jani Nikula <jani.nikula@linux.intel.com>
> >> Sent: Friday, September 4, 2026 12:41 PM
> >> To: Garg, Nemesa <nemesa.garg@intel.com>;
> >> intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> >> Cc: Garg, Nemesa <nemesa.garg@intel.com>
> >> Subject: Re: [PATCH] drm/i915/display: Limit SEL_FETCH clear to
> >> supported pipes
> >>
> >> On Fri, 04 Sep 2026, Nemesa Garg <nemesa.garg@intel.com> wrote:
> >> > Commit 7f1172a2ac0d ("drm/i915/display: Clear SEL_FETCH_PLANE_CTL
> >> > on plane disable") started clearing SEL_FETCH_PLANE_CTL and
> >> > SEL_FETCH_CUR_CTL on every plane and cursor disable.
> >> >
> >> > Not all pipes implement these registers. Clearing them on a pipe
> >> > that does not have them leads to an unclaimed register access.
> >>
> >> Where are the corresponding checks on the enable side, and what
> >> prevented this before 7f1172a2ac0d?
> >>
> > I will send a new patch where I am checking if its enabled then only
> > we should disable it otherwise no action needed.
>=20
> That doesn't really answer my question, does it?
>=20
On enable side it is icl_plane_update_sel_fetch_arm() and i9xx_cursor_updat=
e_sel_fetch_arm() where we are checking crtc_state->enable_psr2_sel_fetch a=
nd it  is true  on a pipe that actually drives selective fetch.
=20
The same flag is what prevented this before 7f1172a2ac0d: the disable
 helpers checked it too, so enable and disable were symmetric.

The problem with this the was, whenever there is a internal commit from tes=
t of enabling crc this flag was setting to false as crc and enable_psr2_sel=
_fetch  cannot be true at same time. So during plane disable phase SEL_FETC=
H bit was not setting to 0 because the flag is false and it returns early. =
So to handle this added HAS_PSR2_SEL_FETCH check was added.

And with this commit 7f1172a2ac0d the unclaimed read access issue started c=
oming as this check was  getting called unconditionally and so the disable =
path now writes the registers on
every pipe of a display 12+ platform, including pipes that do not implement=
 them.

So to avoid all this , came up with new approach where adding a new functio=
n for clearing the bit for the inactive planes of the pipe as selective fet=
ch is turned on

Thanks and Regards,
Nemesa

> BR,
> Jani.
>=20
>=20
> >
> > Thanks and Regards,
> > Nemesa
> >
> >> BR,
> >> Jani.
> >>
> >> >
> >> > Skip the clear on pipes that do not implement the registers.
> >> >
> >> > Fixes: 7f1172a2ac0d ("drm/i915/display: Clear SEL_FETCH_PLANE_CTL
> >> > on plane disable")
> >> > Closes:
> >> > https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16876
> >> > Assisted-by: GitHub-Copilot:claude-opus-4.6
> >> > Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> >> > ---
> >> >  drivers/gpu/drm/i915/display/intel_cursor.c        | 4 ++++
> >> >  drivers/gpu/drm/i915/display/skl_universal_plane.c | 4 ++++
> >> >  2 files changed, 8 insertions(+)
> >> >
> >> > diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c
> >> > b/drivers/gpu/drm/i915/display/intel_cursor.c
> >> > index 86bb96ac449b..3c06d5482691 100644
> >> > --- a/drivers/gpu/drm/i915/display/intel_cursor.c
> >> > +++ b/drivers/gpu/drm/i915/display/intel_cursor.c
> >> > @@ -544,6 +544,10 @@ static void
> >> i9xx_cursor_disable_sel_fetch_arm(struct intel_dsb *dsb,
> >> >  	if (!HAS_PSR2_SEL_FETCH(display))
> >> >  		return;
> >> >
> >> > +	/* Display ver 12 only instantiates these registers for pipe A */
> >> > +	if (DISPLAY_VER(display) =3D=3D 12 && pipe !=3D PIPE_A)
> >> > +		return;
> >> > +
> >> >  	intel_de_write_dsb(display, dsb, SEL_FETCH_CUR_CTL(pipe), 0);  }
> >> >
> >> > diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> >> > b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> >> > index 5cda1ab90e40..252df30debc9 100644
> >> > --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> >> > +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> >> > @@ -893,6 +893,10 @@ static void
> >> > icl_plane_disable_sel_fetch_arm(struct
> >> intel_dsb *dsb,
> >> >  	if (!HAS_PSR2_SEL_FETCH(display))
> >> >  		return;
> >> >
> >> > +	/* Display ver 12 only instantiates these registers for pipe A */
> >> > +	if (DISPLAY_VER(display) =3D=3D 12 && pipe !=3D PIPE_A)
> >> > +		return;
> >> > +
> >> >  	intel_de_write_dsb(display, dsb, SEL_FETCH_PLANE_CTL(pipe,
> >> > plane->id), 0);  }
> >>
> >> --
> >> Jani Nikula, Intel
>=20
> --
> Jani Nikula, Intel
