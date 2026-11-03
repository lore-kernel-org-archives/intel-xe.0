Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E28606A326
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 11:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WaFfy4HB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A08010F510;
	Tue,  3 Nov 2026 11:21:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3EAC10F506;
 Tue,  3 Nov 2026 11:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793704871; x=1825240871;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cCyYUpx65+purBVrbEdLAmfylojPiSGdXY6a5sAunks=;
 b=WaFfy4HBXYEDQC04BywVS5nYUECNmP8mFctjdm1OdrWnyQLxhIx0PFEP
 GlMmiaDvhKI8M3/+u4al70JWbFa+8AaO7eRr6ElzB4AMg1BS0llX73e87
 jUbT+u0gf60XZL1dq8gd4pXdRgyJDyseFRWtysDoFfXbgxxA0JiIGWcCR
 quYClAyY7i463qy8gSIJKJxSLYkKCB0jvYX7QSpG57f3V6Biw+pJ0iv/k
 fFpS8EggfD5Cujdm90wHp2PADtiAOhfSMGsFwDvOsVEDNASyqyOHQymKJ
 hz9h6YNh9VrPiyBrfA9OfUOz/y0/kON0nbLK36EdF3s0ZNlMiZzI+OsmW Q==;
X-CSE-ConnectionGUID: RNTrvfdrRAC453sFho90Lw==
X-CSE-MsgGUID: EkNRIwpYRJ6pn631ZKqssQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2314831"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2314831"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 03:21:05 -0800
X-CSE-ConnectionGUID: QhX8jbFmTZW1lVsDgTig8g==
X-CSE-MsgGUID: OJlM18tcTwiUjQyc1SqcDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6242795"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 03:21:05 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 03:21:04 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 03:21:04 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 03:21:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eH8QTNA9sBxP8qcy6G2IdPuCtrg6PI6tuK6tAfTS7vs20A4mt5pMqYl5l1+CoKEnrif+wpdkd4YrVpye+lUloD3ABEHcTQb+EdwTvV2taBdvMOWGxfhTpQQef/WDYyqOntPgaOA/rRADRQFoNR+KVKcjSCuVpQkgs9n1sYsSQ7/iUWbbjXefITWeA0PhBRYq9h8P7gQV6i3kEU12JdoSFCwXJI+Y71WkN9jXWihRDDTgI7TpZg05NIWbAqye4YYP/2TPXl4xbzUP36Q1I0l++1wPEL4G++FyN0OifoZVjgtME/8hMypbG80+dD/WrQKKRq1I6VH5JdTRJV8fOurENg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvPPNDQ/9pSy7rUgwBhh7soWbWjcyzNPJnuq+pNaKvQ=;
 b=d5LAwFTaduIkcrCUv7w0svtncYtmFzOoVaX4u0gQD7aAUj0A953Nm2pn//0cQcx4wvNs+C1YtjarUKup3k+kDKhWdhxI5C+6aP/q2+FtJwA4b4ePc8kJ4aGihHYmzkUAQ7anK6ZCG4MDR1oe9wCkZi+iL8v9bHF5jzwbKN4o2+R5BP5v/gfEAYr5OH32NiZsZ6ZD6ALgv8uWTKm7melKlzXJHnAkDY3RbUbhvPb3pWMQU2BSwV3svHIXB6jWLjBtAulejx4WiDY7yOBRa479vNEyQ1KJ3XbW47rxM1tvAi1mNenWnEMZjN16sP3xL0wfUqasMtM2U34pp+ppzlS5Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by SA3PR11MB992341.namprd11.prod.outlook.com (2603:10b6:806:58b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 11:21:02 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 11:21:02 +0000
Date: Tue, 3 Nov 2026 13:20:56 +0200
From: Imre Deak <imre.deak@intel.com>
To: <burakgon12@gmail.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mika Kahola <mika.kahola@intel.com>
Subject: Re: [PATCH v2 0/2] drm/i915/cx0: TCSS power for the non-TC C20 PHY
 on PTL port B
Message-ID: <aunDmJU5q7DAUmSL@ideak-desk.lan>
References: <20261015-ptl-port-b-tcss-v2-0-e00ce882402d@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261015-ptl-port-b-tcss-v2-0-e00ce882402d@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-ClientProxiedBy: GV3P280CA0107.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:8::9)
 To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|SA3PR11MB992341:EE_
X-MS-Office365-Filtering-Correlation-Id: d28d694f-ef4c-4bac-5cb6-08df399c8b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|260925022911599003|260925021911599003|260925021311599003|5023799004|11063799006|56012099006|261021123027099003|261021121427099003|261022075727099003|261028144727099003|261026140227099003|261026121527099003|261022105027099003|261009223027099003|10067099003|6133799003|22082099003|18002099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: gV3RVFER5g3MYpta0Hslx3CGDOMV5rxHQOMicBfdn4HQW2bgA9O4/DnAdD4j2rmRKU+aJVuHmdjA+FYeDhGnctkE36E7xrpmf8FO+XOORN4+NzHI8fvSTzIUky3JEmeMDXhh5xFORxh9ReJBQFPV3vx+/Mqq3eT7pB5CeuxPkgHKjbRwb0COfK5FIEaNHbhgsg21xiZxrLEO63Wb1etKOU3kbLReckWhH8jCCpctsIDVdgkwiclB/qF9AKkdrTqY5e9diTX+K4zjPv6OxH4vdookoxyv0eU0Q9U7KOkeA4tijvczaE7uiJzGn3ygKrtguL5ilFMUQoEZphiCPKjQ9YMa798sE1X4jqzKvFOjBBewrAEaPV1ORJn+7roimC+hM8asRlkrh8D8Quwjiwx9N1Xqifhj5WQtfp3E8zcQA6wzbSHyRJt1qvPNF78gOiKq4BKUrTlTH7C9PW+Ch5oRC/D6BCHPsbHpR9FBiPn2UwUW57b136tEokqwA1upBRqJPTY6gSzCHUoUNhQgEE8PNIfVW14t12fUOIwvRkMEo+TEoNTg0kqrW9KpbAvnszj9zn0HJ48nA0grYHsu6gg4B3rcKt3rguMUCntb+m+QQQFMkJrV+7j2JKcIz0IBU3Nk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(260925022911599003)(260925021911599003)(260925021311599003)(5023799004)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(261009223027099003)(10067099003)(6133799003)(22082099003)(18002099003)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?b2P9YI4uYD9euCM/S9l5zoCCiZI0XBGd93zf3cImB/baHuJvFbrJBq8Zu9?=
 =?iso-8859-1?Q?x86wrgSo/pvQZjTImJ3Y3oVL/UxLSRyk3x19myrh4Up02aNBt/KBEctXEi?=
 =?iso-8859-1?Q?Dkx62a70VWWHR33gU5L9OBI44s1PbtyNPrnZI384KDeYLwcACN5zEjjm2X?=
 =?iso-8859-1?Q?uMuzJZELbOnckmZvUHOjOy8NtsFCH4Fa0lOQjnBZ19K5psXzaBNa0x50rx?=
 =?iso-8859-1?Q?WJCp3nVSNldqdKn2t/8mZsdNLhwPxTqei9vyDtD1hsYotHeqO/ZJ5Y+5kR?=
 =?iso-8859-1?Q?Mt1QrdT1DaJv8vRYq1wq5qKbKw2OyOmaCfOaXOAlMSVYyeXlGpedSJj/Vj?=
 =?iso-8859-1?Q?bNOvyWy918lf5OrYNfN2E1bfr78P8sS76aXFOk3DlUBx4VJxR5PeMwyCra?=
 =?iso-8859-1?Q?Q2y2qVldmoce/mVb/vHEiQEpTebF9wiRkSgOsoPcBj5G1EALDhl1ssAWXI?=
 =?iso-8859-1?Q?qG7eyjR+hxGjsfZ8Ocnrj6P89YnYWw5i7zmNwZ8NPZxZUZUa5Wi+amP0pu?=
 =?iso-8859-1?Q?aWlmHB6mnHl2fYAjixNQMUNOt/PB4WUQuBjxI+NQy5mg1FbwH4Ng8H/Cow?=
 =?iso-8859-1?Q?5LoWVWlQpMUYn4VBTNDVkr8XDsbFQiiF3Dvip0AlIZ/GI1B5tnDtRC1Apu?=
 =?iso-8859-1?Q?dlPrkB24/x+Hq6SWKryruOtrr8gUc1OPqCdbQRzdbIk7SnRq8NKh14LHO1?=
 =?iso-8859-1?Q?2jqQ2PUdtg232PpGkjEo/57Kr4g9ELMRu0TlFob2cKuPDDS9IF+av+2QR5?=
 =?iso-8859-1?Q?9hvpPlp0u6C80JH63EbVkrF+1QZSfOtJPNVxnR3VA1zAf9ntGDWLCenk8d?=
 =?iso-8859-1?Q?bLkChHXdIWav7el15YtZbeRTdYnHSow37ZbMivUb4lVubgcPwatnt/P/mZ?=
 =?iso-8859-1?Q?G6ltN0TARNTYj4C7su5o+STgi5FshiX3w9Stk0iyVMCC694Bi5E5ffTWvZ?=
 =?iso-8859-1?Q?PIM9z76EgCtRouG9qlp9H4WprKbTuPlkGxO+fBKpZFSyS+B09sxf4j7kRI?=
 =?iso-8859-1?Q?3Yx+kV07U2BHR1094mv8GFbfb80LUwUM88cSmOC6cpBhuTNRT48dPhKt+0?=
 =?iso-8859-1?Q?U0OGunWEA5p1jAeEUHUcuTjnFPbKFRT1bwDlv9Rb3yhGWRE1EIXTrKU2yk?=
 =?iso-8859-1?Q?Fj0bbLitIMl1+ccG42lz/yfiWZwrz2++awW+jWxSjZBtCySnPwiA8q/2hq?=
 =?iso-8859-1?Q?QpZlnMsaaJEDjLd4bOewEGqtolracQXqAqxlZQ8fT+AKpA3kNKPWxV58yX?=
 =?iso-8859-1?Q?2U+Gryz4KoQ0NiKpBRhIu0ngiSLouF5U5vBcWllSolhnGX+sCE2ULlU3jO?=
 =?iso-8859-1?Q?mtlKG+sT24FE9v7RLHz/bsIyi/c4unV2thnYQT0tVBpZQV0vSJKf8ZD4Iz?=
 =?iso-8859-1?Q?ScalqB0nYd7iVkDf7uodW57l0Pxrp7CSk+Hc039IQJOmx/2T4XtH9aDueK?=
 =?iso-8859-1?Q?ac15JurlRuI7HMLLHLCZZbxWCoSxtcjSzmApJmg/RluXkFkjQXUtkzQ7cF?=
 =?iso-8859-1?Q?9qFeYJBQp/1iDuuCOn+jff6IM5NE3/6ydppYpGrpmJavs5GDnHJr8h8aI9?=
 =?iso-8859-1?Q?0/Ya3hIJ0I+RNVpQ6szjJQiEgAQyU1pnfSDEob7efDpKmD6o9/pQTxhE9H?=
 =?iso-8859-1?Q?i4XhoxSGmF0XY9ZMlr+SjirMMgpX1b6WX56Ed+QqCNgN3RMKrjgkaDFBcV?=
 =?iso-8859-1?Q?bdHTtbs7yB5yELLTqd1CnWU3vziE5ADz0XypasVaWeDe8w0Cp7WGWsSE80?=
 =?iso-8859-1?Q?houLgOzJeMA3UV1bFnSsaRsdkjiusWr2ICubDF2huY85RmbwtdBn3RmXOS?=
 =?iso-8859-1?Q?fLTXuQHEUQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: tAJT9DSbDwva2VJYuYOpEgXKk9tcr4sbQ1JdIR/klLiTRoPAYEzHkjlKUdl1xFUNcGEBEtKkSLMv/Qz98CXEIJb9ERlS4V1Uiz3NTNJk6+AZ8s/6w5k0Wzy1GcSw/4UcwAwOXANjPGuXH1tWMw5AaNIZ/As6WtJN7M55hqsoSKmV+aFRlZlAOmClxtcYahtXEJinEdoK+9ug2sBTyfXu7vF2Upi9ptoPVbO5n/lUhOKWO17sm3W9Zzh//jaJ4p905CXeOEqDUDZuFP10aJ5NEshW2Ue0eGOS1TOhRp0HMe1mNdQb2HDq6D+SftyqKrBLDiQcMxfx/iDyGiqsjSle8Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: d28d694f-ef4c-4bac-5cb6-08df399c8b00
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 11:21:02.3682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BP2XdSztgW5ZroSUWd2tguJpd6ccJQQAre7A/lHBn03bI9HcJvqL/vuI5ZFnVcobpgGkPgfK8+imEst+MnHog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB992341
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
Reply-To: imre.deak@intel.com
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Burak,

thanks for the report, root-causing and reasoning. The actual issue is
misdetecting the PHY type for port B on some platforms with a second eDP
panel connected. That misdetection should be fixed by

https://lore.kernel.org/all/20261029113017.618286-7-imre.deak@intel.com

Could you please give a try to the latest drm-tip kernel, where the
above fix is merged, and provide a dmesg log with that, if possible
attaching the log to the

https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9196

ticket?

Thanks,
Imre

On Thu, Oct 15, 2026 at 01:26:39AM +0300, Burak Göncü via B4 Relay wrote:
> On PTL, port B is driven by a C20 PHY that sits in the Type-C
> subsystem, but nothing in the driver requests TCSS power for it; only
> the firmware does, when it lights a display on the port at boot. The
> ASUS Zenbook Duo UX8407AA drives its second internal panel from port B.
> After a power-on with the detachable keyboard lying on that panel, the
> first enable of the panel fails and can hang the machine (gitlab issue
> 9196).
> 
> Patch 2 requests TCSS power for such a PHY around its PLL enable and
> disable. Patch 1 first serializes the TCSS mailbox handshake of
> Wa_14020908590, which patch 2 reuses and which the TC ports could
> already race on.
> 
> Two questions from v1 are still open:
> 
> - Does port B's C20 PHY on PTL always need the TCSS power request when
>   it is used as a non-TC port, as this series assumes, or does this
>   belong in the port's power well / AUX handling, or in a board quirk?
> - Should the request be held for as long as the port is in use rather
>   than per PLL enable/disable? Releasing it while the panel is off puts
>   the hardware back into the state an unpatched kernel has; holding it
>   showed no measurable difference in package power or PC10/LPI
>   residency on this machine.
> 
> EDITME: v2 test results on the hardware.
> 
> Compile-tested on drm-tip with W=1 for i915 and xe (clang). HDMI/DP on
> port B could not be tested, as this board only drives eDP there.
> 
> An LLM-based assistant helped with the investigation and with writing
> the patches; I tested them on the hardware and reviewed them.
> 
> ---
> Changes in v2:
> - New patch 1: serialize the TCSS mailbox with a display-wide mutex; it
>   was covered only by each TC port's own lock (Sashiko review)
> - Patch 2: also wait for the TCSS power state to clear when the request
>   is released, as the TC PHY code does (Sashiko review)
> - Drop the RFC prefix
> - Link to v1: https://patch.msgid.link/20261006-ptl-port-b-tcss-v1-1-240670342cd3@gmail.com
> 
> ---
> Burak Göncü (2):
>       drm/i915/tc: serialize the TCSS power request mailbox
>       drm/i915/cx0: request TCSS power for the non-TC C20 PHY on PTL port B
> 
>  drivers/gpu/drm/i915/display/intel_cx0_phy.c       | 37 ++++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_display_core.h  |  5 +++
>  .../gpu/drm/i915/display/intel_display_driver.c    |  1 +
>  drivers/gpu/drm/i915/display/intel_tc.c            | 33 +++++++++++++++++--
>  drivers/gpu/drm/i915/display/intel_tc.h            |  1 +
>  5 files changed, 74 insertions(+), 3 deletions(-)
> ---
> base-commit: daeb062fc40f727fafefed080c6d12a5ad1d0d12
> change-id: 20261006-ptl-port-b-tcss-8b1cbc5d98e0
> 
> Best regards,
> --  
> Burak Göncü <burakgon12@gmail.com>
> 
> 
