Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854E5CCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 10:20:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09FB10E0AB;
	Mon, 13 Oct 2025 10:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YB/Ko3LJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F1510E433
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 10:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760350810; x=1791886810;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xSIbivMX3kp2YRwciZdjp01tYf1aznXbouLZNvSCR24=;
 b=YB/Ko3LJjJ8YZFLzr+yPncUU7zF9AoPchMWDA/cpOqiTwsWvc1HWT55J
 03ftVjlmbtGzzh7b81z1HG1Bk8KIi2SVozFSlp1h5vpMX3MlXxOIQCWq9
 SfziqdUTo3hDbhBikqA/l7GWAEhXj+oX2IqLQXlh/v/SXXA15jP84pdtf
 Ix4GdrWo042Ja+u/SvXqxA8FJOnZBPfInDBuVLn8goHYv0j0xd8FUAKzY
 tts7mN5PMEtL4a2Ufwf5EVMFRUwPE9PL63mw5s0fopoNsML2+pKipsf5e
 O2qqMDs9I70Nu8dIA9QvYQTq5I7VdDg+HaCUJznuHTbQJKaIIakex+wMM A==;
X-CSE-ConnectionGUID: l+jxeTTNQj2FDnK/a0vQig==
X-CSE-MsgGUID: 9HVj6y/jRZmxw1cONS7z/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="65107253"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="65107253"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 03:20:09 -0700
X-CSE-ConnectionGUID: v/qPOpHhTE22GI2gX3OwHg==
X-CSE-MsgGUID: OTHjfRWwQe+HXGZ5N8X+yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="181238374"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 03:20:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 03:20:09 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 03:20:09 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 03:20:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y6LzwjhoJZx1CEXl2RsI1MH7PmbaR26KcDM1tNCm4lTZMrbiJq5ckQGJOMTwqniDA4Kb1onX0k92zCI9/eGGkazMV6srCZCZf+V/IrJPztALTB6azGz/WUqHsd2ZUyrZ5q+xchrXBE0PltCwB6JqgR9atGMAU92AKOAn5wU3gSEddqpjyNqJ88o1fYASFsQ8RbP0ZrESZvH38n1wDmkyPz+7VzMlGyk91zmyqkdKc14alnZBvS/kt765Khs9anneFSg13gDizRgkWC54+2CAd2P56+XHEPxgEeJioySdWp1/utW7gt7AZurFHJsBM+wPmpfAh8Zo7bbTZubh8toUcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjojpFbfuB2fNE9+Fxxa/kM28UlX0Ger2TTliR5Qkrc=;
 b=cIS/MApzjgwUQv4v05gpOP0t8qtVLqWVdMreHmQU4E80W+T0xz5+NkwtA1TfLkUfVTnPBc4JuDCK27Emaj5b/tkPH1zNESENsAFPJDciABN50aPMs/BmQkjuByZII4sak+I/SFRopf/IZAkhH5y7DZ4PIyhjcbXymvjb4oqR1oWDX/cT28x2a2vdieIKpGWPNgfJDf/9gsSYQibuz4adtIJbhxi68UXGs95qZ4HxAcfnpbhtAs4MWNJkmSxnme77bqE++HoF7/2bJRwINvUvSNCPdA2LiNSVowBkl7Vimd+LMHByntyM16V/DZbA26icz0SiC99EBvJOarpvJN619A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8987.namprd11.prod.outlook.com (2603:10b6:208:574::18)
 by SA2PR11MB4778.namprd11.prod.outlook.com (2603:10b6:806:119::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 10:20:06 +0000
Received: from IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e]) by IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 10:20:06 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: Arun Abhishek Chowhan <arun.abhishek.chowhan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] [PATCH] drm/xe: Sort include files alphabetically.
Thread-Topic: [PATCH] [PATCH] drm/xe: Sort include files alphabetically.
Thread-Index: AQHcPCgmOOfEZRMho0eW+YGCuP5/8bS/2f2g
Date: Mon, 13 Oct 2025 10:20:06 +0000
Message-ID: <IA3PR11MB89873A3BDAC05B1C9881F603D0EAA@IA3PR11MB8987.namprd11.prod.outlook.com>
References: <20251013095914.3742505-1-arun.abhishek.chowhan@intel.com>
In-Reply-To: <20251013095914.3742505-1-arun.abhishek.chowhan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8987:EE_|SA2PR11MB4778:EE_
x-ms-office365-filtering-correlation-id: c919f8f4-58b7-4a92-0e4f-08de0a4214b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?bIKtByGSUMrIWK9PwFzaV8r5xrEuHG4bt+U86Woqpi7joU3osEUn84hnaDTA?=
 =?us-ascii?Q?iqh07ODjoTXlh0y2m1JsjEEG4msZfF923B2wyZooEMXR6qA5zerNK0ti5XPE?=
 =?us-ascii?Q?/GUVq78w510dbKbLA62wTkPfLFm40O7g+FaYDFKTpP6n+ZN+Oi8h9gJ7iJyL?=
 =?us-ascii?Q?Fv8Jx1dODGwuIxX8X0ejdxKZsGXqca91UW1MOpIW15pA/t7yAYQAN8LHeUWL?=
 =?us-ascii?Q?TSTFTrPkkNR9E1JmN6SMJa7A+A3oP3Mj/V3S4/sbSQA5qWuFo477sCVYQCca?=
 =?us-ascii?Q?I6Y2nObwWH695P+ZHXNvw1t8OEVjFvhjEiXrNFSxedxvCGgB2E5CXPwDQGJ3?=
 =?us-ascii?Q?eDaG1LwESECq32+VyLwT2syVKsY25kQQuxrG3dqcgkf8pOAuS4qCSDRyyYKg?=
 =?us-ascii?Q?w5r9V9YF7T3OF+p4R7NmraM9J+u88Pcz3MIDJWdWh1O5fYEQqn673lWDdRye?=
 =?us-ascii?Q?75f+B0MXbJ7g3a75H0OQ5PMCJWVLE7ncC8yBvFFzCC4cYcm85wsrYTkmSc1P?=
 =?us-ascii?Q?Oc4MrdyJOibepu2LwHzMFHMLC0pHfw0D8D5T/wF50viyE3hWYPxx2acUiDj+?=
 =?us-ascii?Q?sdpMKNoHA+jad2X6YwrK2gO0eDwhVHB3pK4jRzSaXnn5xcp5Q3dRWYtZVbOj?=
 =?us-ascii?Q?5Vy2DMB6S+Ii7mb/q1f7IAByv+Z+hgijs5TU5KxYr/JoQ856Cxq3bDF5FReB?=
 =?us-ascii?Q?Bq6mUHfwOC0h/K9hepAIvAt032/BDz/abc2RLh6x5hsOoApnVnfedpfkVws0?=
 =?us-ascii?Q?W1+BAaCrBte/OmMPnktlSChgyQxs3mlDQmideJ87c9tMfXypY1el9kqhHPKR?=
 =?us-ascii?Q?kBSI/MmiXHXiz1atUDoEFjYa+jsq0sPIiPFbb6Pw0UvCc8l0UMWM96qb7SBC?=
 =?us-ascii?Q?Xyt9o8XabTCRZ4cQ/+rzmZxvbfqXePuyIcqVC6wF4e60LidnGiN9kISv7djt?=
 =?us-ascii?Q?DpgN4Vyo4Qt8/qqcxSdFxR5ShGxPQwFwpAy+wp8mY3Ey8VVa0Z/8td1H+kuc?=
 =?us-ascii?Q?MDyY2BuZkB7Ll2VoeedE9bQTPugrNDvfplTlFpZzU0H+b9rF9nayUB9XYXUN?=
 =?us-ascii?Q?iWwjQn1yTyC36+7o7504bUmXGrm9dELRb2l4ulJ89g6xYA01FztiLT3ywdne?=
 =?us-ascii?Q?SOvVdWIR0urEhapfUScsKOzxni/6C2cSRGCbQ8SBxUIHZ0TC7GcQYXL+Lohz?=
 =?us-ascii?Q?eX2Wcr0cCk9TnPLIcKJ8j3xwuAf/1sYq7u34z4zUDDH3DBc0wK9F1rhksfOj?=
 =?us-ascii?Q?LnP2bJ9jWHE9V7JesgoycpPUEBlAXmM6DD0j4hvvwui2AYbuUY7vRIBibPm6?=
 =?us-ascii?Q?KICn1RljEWismLp2w1OgaR/Cvrgpn+9WQ9rbhiMoGeMrqAeR3qKV8ugkuuYX?=
 =?us-ascii?Q?U3sXkbBhj+uT0izgUD2/64GA6X+hid6vZcYKz1BWgiiD+7u5Vb4qfeSI93yE?=
 =?us-ascii?Q?N9tkKdjTLsQshtKtCQnoAzKUIi6LXEtpXJxc89h+7/SUTOfdGJSWd+E7PZRQ?=
 =?us-ascii?Q?4l+okBIL2SsAB/ifNoz3fRYxgw6D7I1CEjmA?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W7lQ/fkk3pKPM3pTz7954ptWLvfusGl2b4orxDnKcK1bhrckSkitxIDHZlgZ?=
 =?us-ascii?Q?AD/D18lZAIx/Gxum8v5nVb65N26NFEBrxZ3vVeGrXXVGpF+Jcj4BEmRmUUej?=
 =?us-ascii?Q?XCroPB/rC8H0u0AoFYToemGZve8HHT8gk1wIMC2Q8uZ3yhaMEPPYBi8teY2y?=
 =?us-ascii?Q?+WkV09t8Eq5hFk4T1kJ8qnprIPuSW7cjcdxcYyyeWmaa84K8gi/zMS5eDT5A?=
 =?us-ascii?Q?pxp0x8ltpYErHazliEzkUn06vJhJImAZEJ2+LYOkQpNxYJEn9QT5JP0VhMpa?=
 =?us-ascii?Q?5txrkRmYUpe9OrRY4Ja0km0LuEGRmSaIBGrp2qvWGWmw8Yj6/LqY6IURB8sY?=
 =?us-ascii?Q?+gBYPfJzrNH98ZEWieSSCW7+arJiZ6Wudz1B5XTzZveFbqviHeVP/DtXHVCu?=
 =?us-ascii?Q?ghL2TkKNUAs5+9RMLyugEHU5rx7nWJ5hYsbUtd2c/2hRY2y0o4QdKcaqQP7Y?=
 =?us-ascii?Q?pyBi3lbBTqWIU83Pkm3r4LRTSHVT4vXecBmVfHpk/0HiFQg9KtANAnDycae6?=
 =?us-ascii?Q?PIeaCBQ10Peqk+D+HJo/jT/X1Bxwk7LK2QLcZK7GqDa1TGsq3QEcSvHH6vSt?=
 =?us-ascii?Q?H229FV/d43nJQshZDyh1utz73rZCbS62MpUmzA5K7xnLSEG7haydkg6gJSHl?=
 =?us-ascii?Q?QnLO8l9rZbBsugL/KJ6o/NybgIayt9TrpCPBLIqobDu2ulC1a/5zu/zuN+zd?=
 =?us-ascii?Q?kU/GcQnsjvFkuHqkwqocKkztSK/qq2fA5qCvD/Qf0L5lFYDmIaAet6fcv+ib?=
 =?us-ascii?Q?AOMv4D/LUT+P7nxKv0w36Zpex7KOOjj6i9x2fHYCVqtJgO5jdDjtyq3SmhNY?=
 =?us-ascii?Q?62p7BrOXmSeeP9qHyL4K3PS6sUEnES7B0Jgkcwaf1Bx37DmcoujYt37FVaFY?=
 =?us-ascii?Q?CWVIzk239qQbciY+FPNyuH1x62WqDIic6B/Z9Dh6qVJ6kOUkQpYSbxW+snDT?=
 =?us-ascii?Q?ITKcPwUDRH7zAShtAdAz06/YNi/MMHkT722kLc112DM9eeFQkFqA3WcZTyhl?=
 =?us-ascii?Q?n/w8nnnzC2dps3kwHDrB+w+FI0PWXIht/fEklhjlc3heJBssSw5YkzamJT0m?=
 =?us-ascii?Q?utJsQPIOg1TX4qweOrRDy9O2qdubDBJ4ceqPIw2CKCu6jnoXne7v4PmvJcDd?=
 =?us-ascii?Q?DJW8fV1i5SvnF634SAgmIMt2fX5U2ktRoNsuTx8Y1JxgnKP49Y7T2UQTNHI3?=
 =?us-ascii?Q?M7NL0K6Cb4pw9hP9BPduIPzRQJiXNC31oV/E79EYhJLWNXscmJKDzHpz/I4D?=
 =?us-ascii?Q?riDZIBi+XURt0mJA2gSA+s4nlGupJESD7gw/ydDjFeAnvagijgx2kzgv37si?=
 =?us-ascii?Q?LWzQ6w9nW1Jw7Q2VDiAXdJq3x2bT/uSICOMv2IPlqMbj6BheuqRg3WSIJy60?=
 =?us-ascii?Q?YXXpEYf4KAO+kD219AV9w/W6Zj65pZQREn+HOWM5YLAytZYTGm0isU2FtbCM?=
 =?us-ascii?Q?92VyxUmdtrIQ9tC5nqk1iXhgzQaP4LT4ikE8CP5vpl0v92Wtfe0XTGNJXXP4?=
 =?us-ascii?Q?MWJErjcRXXj5d19Aa0hz9nNGP9JE+OkDxdXwZuqL8YbOEIvoIihMH+5Wp0Cq?=
 =?us-ascii?Q?ANzhzxZppgJNA9CJrZeknxIoTkDf/L3jvyxnIUR5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c919f8f4-58b7-4a92-0e4f-08de0a4214b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 10:20:06.4020 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nOAX4uWV7thTu8cx9lLznx7OzcKFuviQ94ncZh8abc0QbJ9vKxKlg2dpoLxLGsUaoXb1ae2h6EvAfYdbSuRwWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4778
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
> From: Arun Abhishek Chowhan <arun.abhishek.chowhan@intel.com>
> Sent: Monday, October 13, 2025 3:29 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Arun Abhishek Chowhan <arun.abhishek.chowhan@intel.com>; Gote, Nitin =
R
> <nitin.r.gote@intel.com>
> Subject: [PATCH] [PATCH] drm/xe: Sort include files alphabetically.

Subject line has [PATCH] twice. Please drop the extra.
Otherwise patch LGTM,

Reviewed-by: Nitin Gote <nitin.r.gote@intel.com>

- Nitin

>=20
> Sort the include lines alphabetically, no impact on code behavior.
>=20
> Signed-off-by: Arun Abhishek Chowhan <arun.abhishek.chowhan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 2 +-
>  drivers/gpu/drm/xe/xe_guc_ads.c | 2 +-
>  drivers/gpu/drm/xe/xe_tile.c    | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debu=
gfs.c
> index 34f622bef3e0..1c3c9557a9bd 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -27,8 +27,8 @@
>  #include "xe_sriov_vf.h"
>  #include "xe_step.h"
>  #include "xe_tile_debugfs.h"
> -#include "xe_wa.h"
>  #include "xe_vsec.h"
> +#include "xe_wa.h"
>=20
>  #ifdef CONFIG_DRM_XE_DEBUG
>  #include "xe_bo_evict.h"
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_=
ads.c
> index 58e0b0294a5b..22ac2a8b74c8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -18,6 +18,7 @@
>  #include "xe_bo.h"
>  #include "xe_gt.h"
>  #include "xe_gt_ccs_mode.h"
> +#include "xe_gt_mcr.h"
>  #include "xe_gt_printk.h"
>  #include "xe_guc.h"
>  #include "xe_guc_buf.h"
> @@ -30,7 +31,6 @@
>  #include "xe_platform_types.h"
>  #include "xe_uc_fw.h"
>  #include "xe_wa.h"
> -#include "xe_gt_mcr.h"
>=20
>  /* Slack of a few additional entries per engine */
>  #define ADS_REGSET_EXTRA_MAX	8
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c =
index
> 6edb5062c1da..8fd6ee990d14 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -19,9 +19,9 @@
>  #include "xe_tile.h"
>  #include "xe_tile_sysfs.h"
>  #include "xe_ttm_vram_mgr.h"
> -#include "xe_wa.h"
>  #include "xe_vram.h"
>  #include "xe_vram_types.h"
> +#include "xe_wa.h"
>=20
>  /**
>   * DOC: Multi-tile Design
> --
> 2.43.0

