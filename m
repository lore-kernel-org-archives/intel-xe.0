Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE37C5CFEB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 15:09:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97AF810F39B;
	Thu, 13 Aug 2026 15:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XQPj+fm2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7502E10F398;
 Thu, 13 Aug 2026 15:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786633785; x=1818169785;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=x/jJrlcbKTWsFV17kEGBieAuU8xQ/Q03wYBZMo3++Vc=;
 b=XQPj+fm2Q8noN1Pipf4xMWUuToaKy8/qUHD6fi0B0Z587j2+y0n34zA/
 U67Xs/4XylOBom8QKD0rQJ8OTKFycO3Q5YI1ciXXrjmX/12Hw3CaB5wF7
 ohcExLb4wQjbnQ+cLyy0ezhuXg04Rf7JbSfVjdX6+2WR0pl7Q3fwcLZCT
 SbU7x1cVnoGG0WfHKaTLVNr2aDu4Xe+nE/4HjWRkA8e4H2AypFlpA3XzD
 JR4natnw5o3XxBm+ImVuGjAITpJNRxsso8h+E5/8+cY/uLZkUam1Flp5s
 Gaw0YFTifoD+bNj3ISllxjJOAZySbbfLrMq5jJGgM5rt25OWtihpu2bAM Q==;
X-CSE-ConnectionGUID: djzb8/LSSK6ZAmasrd2fdw==
X-CSE-MsgGUID: OlphC15ARV+zRFI41kCtog==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="97873734"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="97873734"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 08:09:44 -0700
X-CSE-ConnectionGUID: JZlsAohDRFeNq7b3U1RACg==
X-CSE-MsgGUID: kD93p0msRIq1Ki3kcvfhGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="302218429"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 08:09:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 08:09:44 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 08:09:44 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 08:09:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eg/ioilkoOuNa4ljKg4eKXO9YxmqNe6Y5tF5s3gUcoGNb+bPYiXw7a7gGwZZC9FOs/q5rpr8zaJwhXJL5+Y/AgBxsvNvlntx08eY+zplhSFvexpngeshakpyrsTKztIE8BXMNwoaoeNErzR+5+SPUROWtc9oN8pL6MwQ5JI97fPVeBIkD3wdhKIFqKsEaD6n2sHAwhhqjuI6Te8oY5Lagn+HASgykQsknaqk91NE/teocJdAmwh9DXDCcX1rXhUouCp31MNB9L50rxP813/8H8vJ6SnonBIke+ytlbN4lyGwVOUS4e52Fdgvtxi8TeK3srqatZR84kBO/i9lrdfM4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/d1acEPeR931d9vL3MRm67E2w2ht3U/vOuV45uq0TIs=;
 b=KIdbJGrBwjqV8fEV5OA70bLCNxRsK52JimSSyy00Mek1HRpVUnuW7oEsZFNHP70ekJl/B2pyJA1LO54KdOOcyOpgi7cD0xbmSeNPozn6h3U+fu1JcnbWk+lYO4a9N+YwDWACo43+qlGwZGDOyvGp1pD2DtGQqQUYUMr7/4BjMr+D2KnS0uxkeoJObP7bsNM1JEC83KPZ9MCqfEAdUPlp2l0H0Dy0FpvGJUeAYqr8sCEcqUrGUF46ahMPEsowuMbkuhVWoxz69xzTZ1/hHWGbRN+FX2ffp2IS1riH+hoKsBgn1iDgMT8FihE2yCknlrPqIZgSGf8+cZzWv1BM7tVRjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB6887.namprd11.prod.outlook.com (2603:10b6:303:225::16)
 by DM4PR11MB5312.namprd11.prod.outlook.com (2603:10b6:5:393::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 15:09:30 +0000
Received: from MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494]) by MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494%6]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 15:09:29 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plane
 disable
Thread-Topic: [PATCH] drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plane
 disable
Thread-Index: AQHdKj/nCFyvhVx+Gk2OYLa7AjJgkraaMu8AgAACgbCAAAsUgIAB1Zrw
Date: Thu, 13 Aug 2026 15:09:29 +0000
Message-ID: <MW4PR11MB6887837CB69484D4160EF038E3DB2@MW4PR11MB6887.namprd11.prod.outlook.com>
References: <20260812094547.1808459-1-nemesa.garg@intel.com>
 <0958cc7e77d3c1bc717aa88bf8d74bf04c498822@intel.com>
 <MW4PR11MB688720289D3B3CD86834A345E3DC2@MW4PR11MB6887.namprd11.prod.outlook.com>
 <4ce02b124a6d5cf02e2d6522bd40e9c4f5ed8472@intel.com>
In-Reply-To: <4ce02b124a6d5cf02e2d6522bd40e9c4f5ed8472@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6887:EE_|DM4PR11MB5312:EE_
x-ms-office365-filtering-correlation-id: 26cdad04-17ab-40c4-97ac-08def94cdfa1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|5023799004|56012099006|11063799006|38070700021|6133799003|10067099003|4143699003;
x-microsoft-antispam-message-info: EOQXDWatS0+7b6so0JD+H1id/R1AfQrUbxb/+/5xl1i/784+9dTdUtgMV7r8d8ACMJcHdmm3P8AM1zLwmNwkFfGLTcah59IpaiyGOHrIz+/1kNse/bMSiGiNd3hdkUi6wbl48a4PWVBnrY5aGoN5XPGqlSq92Z/4fiUF8mcwDoUrO+oG5TIhrO0I0aA7v36xKRYrwP1aIvsNmVkdqFIL8SNRbQaSjp9agImy7DSu3cC3geYeYQrUoAVDjICkuIWehlpmxUcjy042T6Be67cx5r/KNVFFuhh+LnFh0UVborCJnqimpJOg0cTuO+rqyicslXAJrvrM0dAOgQXqxXdvcs+ckNYr5xlRlRZrJpfdvaS1vx31TS4M3WhC0RrhSVnrd01kAiLUjUejoYVbZ9DOa8k9twXYsVhg+wOT50pMLOO0d3V54hlCtDz/MEFEJgI0zwZHfpjg5XFgDEvUkhTbu1k50o88JBj7dZyuNXQiK2o0SDwRYs1sN1QXGrjSNAfJFUVwZlY7a3W7fZJs+J+h8YDNUeLmnaOdbOxVnmCgciB0bp2J25o7Ax32OmPwbe79WAAec7gDEMNkrChMy8MyU24zCohLtIpYc+2yxt+12CCS+5k6gMj6vxyrHbQUTbUXaXwBlcjER5Rho+UXFqxGO2PpNL4MqPufR3/BTDgdjIY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6887.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(5023799004)(56012099006)(11063799006)(38070700021)(6133799003)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?B52HWJETVmtAfiqEcNjcm9nkttohj1Gm90om3GKAnjLz4mwSyj2REGb2yTO4?=
 =?us-ascii?Q?Q3Q1O7pN7WKsMIqvEsgGLG/5MuO9W+OkMSAVm2O6zByL1wP3SOiYQ515rEi+?=
 =?us-ascii?Q?DkJhRDuSb6YYgz7tYvjNuywq33992gAlVLcZ80MUVCe2SelZQXhPEeMrnCEM?=
 =?us-ascii?Q?kv7O+XrBB9OdBWiUKnF82/WyPcCYSMPeX471N0r4vgDwuXh4AgNSnSAUKOpU?=
 =?us-ascii?Q?abTnlI12+IDa4MMmuBK6q//CsMuBOKfOyNPuWI0aPYCqtliYs9pO5ZjMAhnG?=
 =?us-ascii?Q?G6akmUy5xayyJQfrzavDjlbEejE5ULI8Aj3q73EDzO3kEgvaek/Bs0Tw66ox?=
 =?us-ascii?Q?ZNEFgmqKt1CKdNO3/+zVkKL54rkYK7OQnBFXlP9qfi2SCFGV1axNR7slmRBA?=
 =?us-ascii?Q?Mnnc2VSaCqVE2A8JprZnnJAs7b0WaIPkmvtWquzyKQtbgh+GMl4pNCjGXrre?=
 =?us-ascii?Q?bNek4FrgaVI7RwV94Eoeshs4Uhf925Frc8rEKB8mZ6ZgRljjQDNzvH6RSBQQ?=
 =?us-ascii?Q?+UgLYLGx0LTf7VXvFv6UDe81QzMIP1DKs/j2LFtdyeHS16cCOLszwnzW1vjZ?=
 =?us-ascii?Q?X5agNcCvfxjUgnVwCZrIn+yLB27pmuflyLw8znhlgfr8maWwrul3LcAw9GQv?=
 =?us-ascii?Q?c4ifAE99qxBPR8DRULX8VgT6aokD28NMIBaIG/95eV7NUAV/xUq5bdJ+AvZw?=
 =?us-ascii?Q?PbGtbIDAu/Z3unMpLgPaEs8Et54kHz7VuO/Tweeug7KgDhw8nsOJbvlX3wwS?=
 =?us-ascii?Q?aF3MihF5JfFIGwiJwduVXCOAy8VFNIYYi8nvJr+yWduHzHlDxnzwdx1946oo?=
 =?us-ascii?Q?Ms09af8jkOCDF9ZWNueT3EBF1g7FJG6mp1vfguRjJdLhmjOvUMXbBt7ikxJ6?=
 =?us-ascii?Q?jOxgr3uJVZrzGliq2Q1JrTtX8bh3iCPvSUHYQYr5WItfyn67nYyVPqxC6g2v?=
 =?us-ascii?Q?+xHmRi7QMZ8CY5EzeLZAG6hAU69FYnMveX0rdfa4qYzKpmtOyBcKKXb8L8r2?=
 =?us-ascii?Q?NB+y0brVQ7dCsfuHYmqhsQheW1BkXvd02EmH0Z5/zzwTOAHRG2CifveLes2r?=
 =?us-ascii?Q?mQpIrYsNvu2r7VQQd9DDV4rNvAZOSb4DZU9w2a5E1B9kwoqz2Dyxy2uG0ta1?=
 =?us-ascii?Q?PQQWdSuE8viSGREZWvDVlT7Oq7nUbst6zbhy1qw8EOvPj4v0tMWSZNbGAawq?=
 =?us-ascii?Q?1Za43+/2r/j6qgEUuSl8wvVLrBSZUwDnGkaoa/Z7iOb7sh0P1aKAC2OCWe0G?=
 =?us-ascii?Q?owZffLMLs1WBb9AuP9OqOfu9qGVVjhLMroilzW8i2a30d3J35kQNFENLWK5X?=
 =?us-ascii?Q?QKHpX6skHLszj8iR7032AqlA6i3yqoMyCsItOCAVY0qWnQJfA0ufnj9VQLEB?=
 =?us-ascii?Q?sWLCnVAtaI2KpGT5sN+OkPIpHPAPo4Ll+Dr43CIeD49gCVG0fe70+sQ+LXxc?=
 =?us-ascii?Q?2j1vWSF9PqBSv9iS7V8nVZD8qO2TXFENbFvOh/1aTda5CASqAhuoHqfrXqs+?=
 =?us-ascii?Q?bhHV1e0JEh05jftNWMocf31zXIK9QsYQjqINsWzjYcyMzSPwL2cFbWAjPCG2?=
 =?us-ascii?Q?OeKqKycF1q4Ia48M9NbzksYufAqe7VjXLvf4o5s42D41gdW1xPE9peZDSi9i?=
 =?us-ascii?Q?BeUBx2Uyb/6YigCKN/YOdFF10KpnqNkUW8EQwSLhKlN106E4RxJs64orruJj?=
 =?us-ascii?Q?vVsQzykXBocLqoS7vzPliimH0/x01Ff+C0mwvWLvAPFiO4spRJhhFFyM8aqb?=
 =?us-ascii?Q?0u6kCUq1RA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XBzQwZE50ZthRR3loD9LPaTuv8UGDvh9g+hL1shOGFMfyZwKSidjDoBWIgS65rmnNcDjJwwSbZSAYJBjJU1rxpf4e6uqDbTEoH/yPZnrDraWz4Trvdggc/UnFxDdt5XAdVv20kmjhHyT35988yM2/lc4tI+Z4PtK2zoRo5jm7xSI2ZPufPThj6vdezlqyEnhHoHv5aCP/FhnD8JLF0GFwJVFi8KapkNslYphDZCaklLw6ZCF041ctrYsvaC+bhmaKDbHMOdFZPwHhe7vIpiwRQUN0S9bocUZ0AhloI5Uhwp76yB/ii/Aaz7tdkD39XZ9/5RAwHbl/2c60IqQe5KY7w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6887.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26cdad04-17ab-40c4-97ac-08def94cdfa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2026 15:09:29.7606 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X5w4Y3IezyuMyUfhEJ+HRHt39p+p8Tqyut8vaPjqbMxmTyr5aDpM5E2py+MFp2BhlJsqoOB9FuKoAaSHvC09fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5312
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
> Sent: Wednesday, August 12, 2026 4:36 PM
> To: Garg, Nemesa <nemesa.garg@intel.com>; intel-gfx@lists.freedesktop.org=
;
> intel-xe@lists.freedesktop.org
> Subject: RE: [PATCH] drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plane
> disable
>=20
> On Wed, 12 Aug 2026, "Garg, Nemesa" <nemesa.garg@intel.com> wrote:
> >> -----Original Message-----
> >> From: Jani Nikula <jani.nikula@linux.intel.com>
> >> Sent: Wednesday, August 12, 2026 3:47 PM
> >> To: Garg, Nemesa <nemesa.garg@intel.com>;
> >> intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> >> Cc: Garg, Nemesa <nemesa.garg@intel.com>
> >> Subject: Re: [PATCH] drm/i915/display: Clear SEL_FETCH_PLANE_CTL on
> >> plane disable
> >>
> >> On Wed, 12 Aug 2026, Nemesa Garg <nemesa.garg@intel.com> wrote:
> >> > icl_plane_disable_sel_fetch_arm() wrote SEL_FETCH_PLANE_CTL =3D 0
> >> > only when crtc_state->enable_psr2_sel_fetch was set.  If a plane
> >> > was disabled after selective fetch had been turned off, the guard
> >> > fired early and left the register's enable bit set in hardware.
> >>
> >> Why doesn't the selective fetch disable change the bit?
> >>
> > During disable path icl_plane_disable_sel_fetch_arm is called and here =
we
> have a condition :
> > if (!crtc_state->enable_psr2_sel_fetch)
> >                 return;
> >
> > So if the plane is disabled after selective fetch has already been turn=
ed off,
> this returns early and the enable bit is left set in hardware.
> >
> > Turning selective fetch back on does not repair it:
> icl_plane_update_sel_fetch_arm() only runs for planes that are in the upd=
ate
> mask and visible. A plane disabled during the off window is neither, so i=
ts
> stale bit is never rewritten, it just becomes live again.
> >
> > From logs: plane 1A after being disabled:
> >  plane 1 ddb (0 - 0) CTL=3D0x00000000 SURF=3D0x00000000
> SURFLIVE=3D0x00000000
> >                       SEL_FETCH_PLANE_CTL=3D0x80000000
>=20
> None of that answers my question.
>=20
> Where does crtc_state->enable_psr2_sel_fetch get set to false without
> disabling the bit in hardware? Why? What's the scenario that actually lea=
ds us
> to the case at hand?
>=20
>=20
We have intel_sel_update_config_valid() where we check when to disable sele=
ctive fetch.
In our case its pipe_crc so whenever crc is enabled we need to disable the =
selective fetch and hence
we set the flag crtc_state->enable_psr2_sel_fetch as false.

After this when we land in icl_plane_update_sel_fetch_arm() we do early ret=
urn becuase of the check
if(!crtc_state->enable_psr2_sel_fetch)
  retrun
without clearing the bit in hardware.

Scenario leading to DBUF overlap:
1. PR + selective update active.  Plane 1A is enabled and SEL_FETCH_PLANE_C=
TL has its enable bit set.
2. Pipe CRC gets enabled so enable_psr2_sel_fetch becomes false. Plane 1A i=
s still visible,
   icl_plane_update_sel_fetch_arm() returns early, and the enable bit stays=
 set.
3. Later plane 1A disabled. icl_plane_disable_arm() -> icl_plane_disable_se=
l_fetch_arm() takes
   the same early return, so the last chance to clear it is missed.
4. Pipe CRC gets disabled. Selective fetch is enabled again.
5. icl_plane_update_sel_fetch_arm() only runs for planes that are visible a=
nd plane 1A is not,
   so nothing rewrites its bit.=20
6. Later the hardware still treats disabled plane as a selective fetch part=
icipant and the DBuf
   overlap detector then flags the collision against the live plane's alloc=
ation starting at the
   same block.

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
> >> > The bit is harmless until selective fetch is re-enabled.  When it
> >> > is, the hardware resumes fetching for the now-disabled plane and
> >> > keeps its old DDB range reserved.
> >> >
> >> > Fixes: b1f5279b5981 ("drm/i915/psr: Move plane sel fetch
> >> > configuration into plane source files")
> >> > Closes:https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/87
> >> > 39
> >>
> >> Missing space after :.
> >>
> >> > Assisted-by: GitHub-Copilot:claude-opus-4.6
> >> > Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> >> > ---
> >> >  drivers/gpu/drm/i915/display/skl_universal_plane.c | 8 +++++++-
> >> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> >> > b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> >> > index 07a683293352..afc1df1b84a4 100644
> >> > --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> >> > +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> >> > @@ -885,7 +885,13 @@ static void
> >> > icl_plane_disable_sel_fetch_arm(struct
> >> intel_dsb *dsb,
> >> >  	struct intel_display *display =3D to_intel_display(plane);
> >> >  	enum pipe pipe =3D plane->pipe;
> >> >
> >> > -	if (!crtc_state->enable_psr2_sel_fetch)
> >> > +	/*
> >> > +	 * Clear this whenever the hardware has selective fetch, not just =
when
> >> > +	 * the current state uses it. The plane may have been enabled with
> >> > +	 * selective fetch earlier and had its enable bit orphaned when th=
e
> >> > +	 * feature was switched off.
> >> > +	 */
> >> > +	if (!HAS_PSR2_SEL_FETCH(display))
> >> >  		return;
> >> >
> >> >  	intel_de_write_dsb(display, dsb, SEL_FETCH_PLANE_CTL(pipe,
> >> > plane->id), 0);
> >>
> >> --
> >> Jani Nikula, Intel
>=20
> --
> Jani Nikula, Intel
