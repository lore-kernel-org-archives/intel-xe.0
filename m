Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329F7606A31E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 03:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d5dME7p5;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=NIJBm5Qa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC1610E161;
	Fri, 27 Nov 2026 03:30:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008A610E161;
 Fri, 27 Nov 2026 03:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795750249; x=1827286249;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WbakQz1MQYAFX6Vfot710fiPw6ZrLRyDdtifay50XF0=;
 b=d5dME7p5Ty+VRTdSLWVqUD7F1H/aAzW6oVLgx0VoSODq473Do5QKjZzW
 A9lq3FfB1GkzCfRyRn4cqRwj5faR6vsTcu4YhsfJeBnXFHI4UT8MTtVQ9
 1gAuoTkWEMJMeEjR6HVXIlNLZSR0plmzFCcuMpDtF+7Amiqt3QR4EqSEC
 IiZ8aW2ELZ9l5MrGaSPNbfukEU4UIG54IL58KknSkjGOfhRaXjFx3Fv90
 mVSa0ctULiYgbqiOLJy0DtYWnp516hJEuiNBLf3W36IINarYq18qO1oh9
 NAB0OvKZMkcbTDJl5bawY7YvAell1jHCf2pj530/7+SyBeIxF1cpv8C+A A==;
X-CSE-ConnectionGUID: U5+ZfIfeQHWfVxlQk2Gi/g==
X-CSE-MsgGUID: edgJmMbLTF2yX4iABG/OhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4513406"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4513406"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 19:30:48 -0800
X-CSE-ConnectionGUID: mM45IAlbREuPYnSKhhq/nw==
X-CSE-MsgGUID: zf4jPvKKS3qlU/c5sxl34w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12440808"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 19:30:48 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 19:30:47 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 19:30:47 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 19:30:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbCrsQM4t05TYU6OP81vqInZx/07Im3/pPpIQVSMe1FJF2r/o1gypK9XZhoPI4Go0mJULroXiC6RKyh9syQpEnoypEhEv3/29gZXp93SeOaez4Theu+nd19O0ULWpzuF+OiCsQ+/3m3y3mYlFtacsP/oV2k5MopWuAjqli5dxwQ0LF5B2CNuZ0Om68BvCe6545Ftbn6lfjIZyLtdFtfBx2422N7M80iooi/A2dzJTDcW8n13ulhic26Z8pEpaGCys9zteHOthYhrqQQd8+8Z5fxXou7kHNRwzuO2/5eEBWILQISSIVvjrgkN/cZ1/f52LRVzKaAOBhmxBzyOVGsNBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtKl7HQq8gjMbXGKNIHy7asFMNNCq1K1F1oGcFr6cMs=;
 b=u20jQSeH5CsApc8jiiZWbbTl5cML1gOjBauBZOXCK8h5PEmHdKNqJdXS75/4d6xKfZG9RMKBjCqZ/fASVDTy3j3zrjz2wHJHprMoPd1VySpLpSrTU33qyYDjveQtpS2nNKAkXLeR1UKVTdfCFfKJoKbUhmKp2Tnq7hhAMhVU26luqbquFRNtBULw4AXV8GWpx48WdOP+SWz15/RKcPNx7TMFVLDyzG0CzvTmUU5XxEabeTZ/xMgyzFt8fJt3Jw77buabXvTEntC67bGgHlof5UOFpCjn5C+IePE2y/iX0x/RXvqKvpuWRsNsBHwM9VPOgMQTvN8pS83QitBt6X4ysg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtKl7HQq8gjMbXGKNIHy7asFMNNCq1K1F1oGcFr6cMs=;
 b=NIJBm5Qa/jvC7z0LDNaNW6kZGAQ8Izj4idsNxmylyPcm72fTMX6UYZaBzPI/XsSoHEI0etE0jqCqh9hqKClRceX6072CJ/xNVTff1SDGloa6vyLyXWRig4HMvrUzmQ2rcBrAbPgWdCX7tfjKkclqiz1DmAnMSQDfMPpiQY1iHsE=
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by DS7PR11MB6104.namprd11.prod.outlook.com (2603:10b6:8:9f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.10; Fri, 27 Nov 2026 03:30:38 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.21.0662.001; Fri, 27 Nov 2026
 03:30:37 +0000
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 "Shankar, Uma" <uma.shankar@intel.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/cdclk: Fix 2 PPC hscale adjustment for min CDCLK
Thread-Topic: [PATCH] drm/i915/cdclk: Fix 2 PPC hscale adjustment for min CDCLK
Thread-Index: AQHdfdbYIJ4WGHWiXkOqJItzJetLrrdAwK2AgACCtyA=
Date: Fri, 27 Nov 2026 03:30:37 +0000
Message-ID: <PH7PR11MB82520C4CF29E7A57FE2142B489412@PH7PR11MB8252.namprd11.prod.outlook.com>
References: <20261126191032.1961148-1-uma.shankar@intel.com>
 <awiLffAoM4GsVxUw@intel.com>
In-Reply-To: <awiLffAoM4GsVxUw@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8252:EE_|DS7PR11MB6104:EE_
x-ms-office365-filtering-correlation-id: 8289477a-d5c8-4df7-aeb2-08df4c36ce11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|11063799006|4143699003|261009223027099003|22082099003|18002099003|10067099003|56012099006|261026121527099003|261022075727099003|261102123227099003|261021123027099003|261021121427099003|38070700021;
x-microsoft-antispam-message-info: HduGPNtdoyJDZItqMuCk/tpw0mfiODweKVkQ7JvRF7xBfVnigWydv6hoV9QUZG4t9qQaP82zr4j55MaEuclBVoyemetA3fFJd72AUr7yX/u8xVxudYOnuD7F5qumGOX+f0+9m/jau59RcLnkyaVzNpGXtqjf7BQGN5uR7XJnx55GKt1zhaiGCK6YvZihzbQwv8+8Jf1kkV8cv5wJI8VhhKSPG9/TSymV5qTu1h5D/l26tZGYZOQOaqvzf0lMMmJDDdZYEwjY3Fw1MRGglpKOduX9Oqg/0BmMxdmpW/xm/tm0tmngmGHA2ofp2MVeiMa5vTMxoW+3SA5JyhGWp6TxN41IL48CRs3RzQV6gX3/h6Kvz2jWPhnwxz1C9hlXNYJ3JLBtIhHGP/vwf05LshSYbDqp9dkUzrrhpc1Oe/D3XFOTnyw2DXxcXAOqsWqwj9C6MiLLfwDrKHHGnNsscY9APRZgOL4AigHCPvR4IFmA7YAoM0bjYjThC+AUp+k8+5IDWTC+mQyl7LMq7ZeepnIczw8Cb3vZv7b7UUtI2VH2RgFcAFcOU1+i8auO06/sYBb/uJQfTpvH+30b1gwOoecIHzx/pORK1Aly0V1ZIbHWMOcqB6Tg7+ziJa0RyRAjtQT/WefSnf8GmJvB3xyrTakyjT474fpcPQj2B+qhbU/hBXWPQCsS5pfGd5Bx3B0ZOGgOl/+GbluYUF75RAFhrjwm9J/LxvAPgVJMKZqhS2Z+Tk0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(11063799006)(4143699003)(261009223027099003)(22082099003)(18002099003)(10067099003)(56012099006)(261026121527099003)(261022075727099003)(261102123227099003)(261021123027099003)(261021121427099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7zmYfOHsI6F21wofLEynjIqUmxzxXXsPBJWA4o/kSE5DUwLLjOytYzwXc9?=
 =?iso-8859-1?Q?4mw9m5Ci3aAacePmdB75rG74CP6zNvcx51lx3S91N8lJ9FEm2oITIuJLGe?=
 =?iso-8859-1?Q?MwGzxIjHHtaSCLgA4eTAkciaazaz/S/1tjGa1censJOnwCC6GAztb8A1ai?=
 =?iso-8859-1?Q?eG9/BcEQIfXEQEGRl+ru6yDUcFOGfI+o7sMeygckm7CVKSzfAaJskL14Ui?=
 =?iso-8859-1?Q?CCoyGfHkZuUlT8i2B8iWWt4vRghukqWWHskOsz8r/X1ax1yL7bDo2WDELj?=
 =?iso-8859-1?Q?+JtXoFGrt7f4USFDrJGltvt23G/AyqUHrY2oZn2QwXxNxDYhYJDAcvLl1N?=
 =?iso-8859-1?Q?mSv26ae0WPXmCFT/6815v1WqxvKAFYWXDfkiQZzLe9BqNhfcf4yU9rEaZS?=
 =?iso-8859-1?Q?ow5hcXWkojCIs/QlYAFNcX0mHM1kyZ+302fWyz8zqwAW7QWviIIyf1DqFA?=
 =?iso-8859-1?Q?4mXGG/ASyFAnbqbfP52tjAmgcxBpaygfPZ0I7afsE/yJV/o81oQCzi6c9V?=
 =?iso-8859-1?Q?V7KDXmhTbdlTydKqu3ch1AaW3IXD6z8Jqr38cC8dt9VzxQhdizj3V/ILSr?=
 =?iso-8859-1?Q?O6VdE4LrSwUaZj2vcDVkK04Uf3S2zey4WQnZxC8Yu/JJH0hBSahvES9xzf?=
 =?iso-8859-1?Q?+3IKHWliJcwOAJFmsWhn/lCQHhFFSzeCFXECo9r9600Bjyu30EC5vFRt/o?=
 =?iso-8859-1?Q?Q66o9NSIn4QRl01kND9H00CZo9In3gl0eOCGEOZGzhUSu7ZCmchbwx2xn7?=
 =?iso-8859-1?Q?/0mcZ170m9oAJFKqaBQUWfF3VyHu/PoZmZbfJwPPNDGEXFTQWLUPiy3D53?=
 =?iso-8859-1?Q?wmONvuCmaw3UXmddI1WUEclxmE4kTtKT1bqgVqJt9sFlvTWYpiGG6ZElFW?=
 =?iso-8859-1?Q?xUs9+TkHsUQsT7RCF7tdMCA+NhAJrXKOBhzGxgNttvSh09wu8TCPJY99Dc?=
 =?iso-8859-1?Q?7hgCePSrSielBc4RWo9X6+PIfRngaAQjSov7UUJZ9XLMvDYPCE2atusqnu?=
 =?iso-8859-1?Q?2DfF3v3KMOOR0kOD40BFvWnN23l3Cbp3yUSVCDgU0lgKzBB94bhATlgbfm?=
 =?iso-8859-1?Q?a670/P4XK+kj0teOQBwm/g+oqdl2RO1pToUeSUVFJCHoPZ1r3DLgdJLg9H?=
 =?iso-8859-1?Q?zM8P3EFl5mMMQmo9n/WCTreS15TOtmL1EY/VBh0OEHv+ZANmtydxaE5yFX?=
 =?iso-8859-1?Q?9PlP6OhYUv7lApS6MdNatTOX2lbWdxhg4YE+qRhaemKPF7BwT3q8BUSzC3?=
 =?iso-8859-1?Q?W73ngIqu/KEei6iO3AbiPqRGO642ZiNadXX8rPpbGSnGP+vglxJVIeTiiB?=
 =?iso-8859-1?Q?Ab8WUSg25gptTEJla/ov4kQJiTO7z/CI1fGqESzklo1ESKCFg3JzG3I33N?=
 =?iso-8859-1?Q?+6Y2NWXhL7w4fqT6h6OGaxnAiSUiN3IBHafMPUkU3zQtGyTYiwABfxH84N?=
 =?iso-8859-1?Q?N/ydGu+V1jnEvUr2aUoKzqi/Xm+UpbE2kPoJ98+U0EYOjvDVr9aj14znea?=
 =?iso-8859-1?Q?ay5z7HIqiuUKFAItdVKqsH+ryYVU1atSx+8HoKa2LJL0fMPNPfrLQxbqQG?=
 =?iso-8859-1?Q?kGR4hqRyi7InWnG0QhXxwN31vPP+CqciIqcslRpCa0hq4rrE9LyHDgrx8Q?=
 =?iso-8859-1?Q?azzLbwYjBwXS457nqFfKeUUnPq9/cObxQlL2CAs6OS/87buKZmGnYdYDeL?=
 =?iso-8859-1?Q?zLi0E4H6MAbMQ3siVktqYK5If9qIzar7/f2/CTjIrH6vAgxWOIPYC8lNbK?=
 =?iso-8859-1?Q?MMSnyY1uBlnNe/+1ua0dyEm94/pZa3/ArRc1qD30iyO31Ye7Ty6Rlr1hU0?=
 =?iso-8859-1?Q?RFWePYcthA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jtLFDnw4Rfxjnl2DRazp/VtuyE5yj9PkB/F2uVrbU79hubUvx72z0nF3yJVkgbZhmd/udHVuCJGkiXvCh8CMv63VvBs1P/8WdN8ACSwjpqYQFH3vcR9PchOxeBbKFqzmkF1RX5CHfMS8nZP2wfqyFDWmheIhxKzG7FzP/ujF3ZbSNDpvYsDbLQdWbEV40pAeLq8YHo7Ep44go5z0/VMfnSrKpE+yOk4WmhlLdP2dManZbMcrZbgIr+oEriCRqKoYfCtv/p5iinRdMO5xRPTG24/eTuiYBcpwX5rnQgh0Y5Ag9099rrrUS5jYrYVbB1wddg3n6Gx0BI4v98bsc2cTtg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8289477a-d5c8-4df7-aeb2-08df4c36ce11
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 03:30:37.8690 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UrazKpILIgRybITScRyywvGwMB07Xf2bqmWSOJmyw047oHFM+IRyLF8Ism0G/VYwzmZ7zuLxyr8LEoPtuCvUOCJu1YB0Pz0cggZ9BWeCay0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6104
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

Hello Uma and Ville,

Thank you very much for the fix.
Tested-by: Vidya Srinivas <vidya.srinivas@intel.com>

Regards
Vidya

> -----Original Message-----
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: 27 November 2026 01:12
> To: Shankar, Uma <uma.shankar@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Srin=
ivas,
> Vidya <vidya.srinivas@intel.com>
> Subject: Re: [PATCH] drm/i915/cdclk: Fix 2 PPC hscale adjustment for min
> CDCLK
>=20
> On Fri, Nov 27, 2026 at 12:40:32AM +0530, Uma Shankar wrote:
> > The horizontal scaler filter works at 2 PPC, but still needs a full
> > clock for a fractional shift of just one pixel. It doesn't shift by
> > two pixels and re-align the taps, so the extra clock doesn't average
> > out.
> >
> > Bspec now documents the downscale amount used for the min CDCLK
> > calculation as:
> >
> >   hscale_ppc =3D int(hscale) + min(1, ppc * frac(hscale))
> >   downscale  =3D max(hscale_ppc, hscale * vscale)
> >
> > Compared to the empirical formula we have now, the fractional penalty
> > is capped at one extra clock, and since the scaler filters vertically
> > first the penalty does not multiply with the vertical downscale factor.
> > Update the code to match.
> >
> > Platforms without 2 PPC (ppc =3D=3D 1) are unaffected as the formula th=
en
> > reduces to hscale * vscale.
> >
> > Bspec: 68858
> > Fixes: f69946f6d891 ("drm/i915/cdclk: Deal with 2 PPC hscale issues
> > when calculating min CDCLK")
> > Tested-by: Vidya Srinivas <vidya.srinivas@intel.com>
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>=20
> Looks good.
>=20
> Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>=20
> > ---
> >  drivers/gpu/drm/i915/display/intel_plane.c | 42
> > ++++++++++++++--------
> >  1 file changed, 27 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_plane.c
> > b/drivers/gpu/drm/i915/display/intel_plane.c
> > index d23de0f34e4b..4a430d6a0ba9 100644
> > --- a/drivers/gpu/drm/i915/display/intel_plane.c
> > +++ b/drivers/gpu/drm/i915/display/intel_plane.c
> > @@ -266,25 +266,28 @@ unsigned int intel_adjusted_rate(const struct
> > drm_rect *src,  }
> >
> >  static unsigned int hscale_cdclk(const struct drm_rect *src,
> > -				 const struct drm_rect *dst,
> > -				 unsigned int ppc)
> > +				 const struct drm_rect *dst)
> >  {
> >  	unsigned int hscale;
> >
> >  	hscale =3D drm_rect_calc_hscale(src, dst, 0, INT_MAX);
> >  	hscale =3D max(hscale, 0x10000);
> >
> > -	/*
> > -	 * Double the fractional part due to some 2 PPC granularity issue
> > -	 *
> > -	 * FIXME: BSpec calls for doubling only the <0.5 fractional part,
> > -	 * and rounding it down to a unit fraction. In practice that is
> > -	 * not sufficient, and we need a more aggressive CDCLK bump in
> > -	 * many cases. The updated formula was derived empirically.
> > -	 * This may need to be updated once we have better undestading
> > -	 * of what's happening in the hardware...
> > -	 */
> > -	return (hscale & ~0xffff) + ppc * (hscale & 0xffff);
> > +	return hscale;
> > +}
> > +
> > +/*
> > + * Bspec: 68858
> > + *
> > + * The horizontal filter works at 2 PPC but still needs a full clock
> > + * for a fractional shift of just 1 pixel, so the fractional part of
> > + * the horizontal downscale factor costs PPC times more, but at most
> > + * one full extra clock.
> > + */
> > +static unsigned int hscale_ppc_cdclk(unsigned int hscale,
> > +				     unsigned int ppc)
> > +{
> > +	return (hscale & ~0xffff) + min(ppc * (hscale & 0xffff), 0x10000);
> >  }
> >
> >  static unsigned int vscale_cdclk(const struct drm_rect *src, @@
> > -303,10 +306,19 @@ unsigned int intel_adjusted_rate_cdclk(const struct
> drm_rect *src,
> >  				       unsigned int rate,
> >  				       unsigned int ppc)
> >  {
> > -	unsigned int hscale =3D hscale_cdclk(src, dst, ppc);
> > +	unsigned int hscale =3D hscale_cdclk(src, dst);
> >  	unsigned int vscale =3D vscale_cdclk(src, dst);
> > +	u64 scale;
> > +
> > +	/*
> > +	 * The scaler filters vertically first, so the horizontal
> > +	 * PPC inefficiency doesn't multiply with the vertical
> > +	 * downscale factor. .32 fixed point.
> > +	 */
> > +	scale =3D max((u64)hscale_ppc_cdclk(hscale, ppc) << 16,
> > +		    mul_u32_u32(hscale, vscale));
> >
> > -	return DIV64_U64_ROUND_UP((u64)rate * hscale * vscale, 1ull << 32);
> > +	return DIV64_U64_ROUND_UP(rate * scale, 1ull << 32);
> >  }
> >
> >  unsigned int intel_plane_pixel_rate(const struct intel_crtc_state
> > *crtc_state,
> > --
> > 2.50.1
>=20
> --
> Ville Syrj=E4l=E4
> Intel
