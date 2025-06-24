Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC04AC77B7C
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 08:57:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA2510E0BC;
	Tue, 24 Jun 2025 08:57:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NWR9570+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F9D10E0BC
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 08:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750755442; x=1782291442;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=udK8vkD2edQ4jK9RC2Hi6ZMInR/7IkMRtOWTGjHXl1w=;
 b=NWR9570+NAVN5v+gel/WGdWmtZXrCOok/VDPsVgpeHWUmH3EqXPNwxXh
 fmtXDfNAm9GvCP7llWfB0s2vMkpe5hjn8XPBh0oXP0QtvCtT1GFt0gUjE
 JKT8K3SZU4HlksC94g+wMmX2fe7U3OoB1JDKlvY4e8Hplpo5pUfhCDp+p
 CJ/xMUAIwsSw7GkybA31Rns4zvmj/UVJ3XtAXxt+33hvFQOwD288enfwM
 GwMZ0XlHH1wm12BIyRUljEKrUcye6mcuX0HaO8fg/ceuf1zNRobuR7mp8
 OClbTQyT8w5xIk6OsTt+oiT4gQwYGhjS+W57pwgk3dUphT/faapMXiKbs w==;
X-CSE-ConnectionGUID: xActsdKPSI+UmqKL7xpIpQ==
X-CSE-MsgGUID: fzFMxKFwRQ6ngLeZqW+AVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="63681134"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="63681134"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 01:57:18 -0700
X-CSE-ConnectionGUID: eQgrm303QD+h4oWKTdUdSQ==
X-CSE-MsgGUID: DjaBSpDzQDe/0qOJ/+J9Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="155886060"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 01:57:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 01:57:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 01:57:15 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.50)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 01:57:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w86MTYNvIFyigFJdFWyQm4WKhIiexQ1G+j4iYY+hTt2uSs7NCYz7KIA16wUB5pNSVG7J4cISoiNiljPbAhUDcq8f730l0adPoGqoJ1Ej9bDZS+eVgnYA4WFRGcH65NBIxUxPsAs1FVyCTOgc0A69hrWrlxRVd+rIYXnfqMQ2I72RB8BlEHLxXqUoMMI1+VZAKjpD/jcytUsB34e5FaTEsgEH6K5sKH0gtNwLBkjjpoe5Zk+a9AjjV06XcigipgthyadtshpR+7QJEt1T/G1eo1k3VYtCyd+Yo1nn9vUBoJ3BlUJOgmK9MRjfdUhdveGhoNnsviJexV5yNAsmhAFk0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iI6e+wcNppjOGzOBPQ8QcNWrYXtoi5QHo8/1os38ydI=;
 b=V8bWD0qlaIL4NWnSL+Wyn7IUW1kXGdQb2SMYkm14VY1dkWnPWPcbGj0t8cXrNgwQ9oHdug1D5CSJt5Sl1SjcsAZa2RsmJLzxWVmlFofBG1gKk6sYMDlioY/sQ0K/XXOfjbLA0zOANIbiN89Q26EgLp7wwszTO9RS6660oA/+C4vUOSYCY8OLrHH0Eg8U4rb4iGPPP5X0vCxaHyil3L9uSe7HhOy5jCjlyTXAkvED++om/I4FhBv+0ddGsQylKbKqkP7Y3F06GWa9ysP0ijVdcuXGQuMc19CWbEn5+qdt5lCxgD8sjpLyTehzmpw+70ELs5clkHaTtogRCmqMv1lgAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA3PR11MB9399.namprd11.prod.outlook.com (2603:10b6:208:577::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Tue, 24 Jun
 2025 08:57:12 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 08:57:12 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: Lu Baolu <baolu.lu@linux.intel.com>
Subject: RE: [PATCH] [topic/xe-for-CI]iommu/vt-d: Enable ATS before cache tag
 assignment
Thread-Topic: [PATCH] [topic/xe-for-CI]iommu/vt-d: Enable ATS before cache tag
 assignment
Thread-Index: AQHb5N4gjJpcrWaB3EOMLnSYx7Gbh7QSAhOw
Date: Tue, 24 Jun 2025 08:57:12 +0000
Message-ID: <SJ1PR11MB62047BAAEDE70F546C5BA5AB8178A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250624080021.4015583-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250624080021.4015583-1-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA3PR11MB9399:EE_
x-ms-office365-filtering-correlation-id: d8e9a8ba-f97e-4b0f-927f-08ddb2fd1bf8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|10070799003|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?g3AWYPRGoJPiQSIgqwTRKu9UNjkxb+JYQ/+rtvcqMijaF3/7BOQVKIhsHeF5?=
 =?us-ascii?Q?jZIwhFgf8nOa3ow/TA616lRqDUX0tEyD5GRdHvetnMnIU9fAhvECLNEjarqI?=
 =?us-ascii?Q?ncaPTVC/jw2PP5hhpiGf3pB469/Y0YAmFHMyEbn3r7eDerSJxTM3qigf7Ge+?=
 =?us-ascii?Q?3+rkF5fOBxdkFw778JeOz6vNs7rLLmYyz2hkmkiAB73TYCaQBxmI0E/qbQz9?=
 =?us-ascii?Q?a8WXhFnKNYJ9kr/85pvgZTsZQIAYmUzI+sZ1gMsc0D2eCkO+osb1puAc9cN1?=
 =?us-ascii?Q?ygrEVQCuKcOj1LsgTn1EZd+y1vkKC+aI6lNqIIN+pxLEMPX3ZouQqbwWamy1?=
 =?us-ascii?Q?9JYFt8ABAqsf0FhWuap4Vy62cQ/uEZyChjJntNQBdrregFPIU7GTbKz04BBO?=
 =?us-ascii?Q?foFznk2u8l0wxzI/QNLwaz+7u7Xg1JRehw42Bo2y46mAgu5D1YxAqKztAl69?=
 =?us-ascii?Q?NuEEHR/VTrDws2NjC4pKCFRhumgblyqdSIySLQGefRmB760WACnMEcFSySu4?=
 =?us-ascii?Q?05zgvbR6p3tAMjkP2G1e5OJt3B1P92hsx4cDk/s63G55Bug5q+B74hqxJGEs?=
 =?us-ascii?Q?iPTRcfppOopZ4lBS1iol3uqUCwh/ci9aCiuk11xuZZ425Y/fEQMancz1jQcX?=
 =?us-ascii?Q?jnz+x4pNK5YAAbNY2W6TJlWQGtzHd+qZRBWdT8f0lVr1SchPMfwhNF5TOPVZ?=
 =?us-ascii?Q?46FMymDCqs3XJCgz/cmvTm/aPYpX5aim2M74CzTecSDpYPXfQ/2Gf4wBy70E?=
 =?us-ascii?Q?E/RSC3DOL3w1XcDnmE6tGwvWBzH7+45l2oFXe3dfdhpAQHcgbe5Rska9V/V+?=
 =?us-ascii?Q?EVCEDGKctZFV0Z36hc1T9eeP/+t8B/1tP9N5nkPEiId+qTZdRiA0YCUuGuOy?=
 =?us-ascii?Q?3OrbizgQUFzK23O8XkBkbp3D+xRcPl3ZBXiJVWiQrpC2RsLjUL8mOZRUpiTv?=
 =?us-ascii?Q?UcixwG7jAMxyNUjR1dPkVL0iIhAH+3WQAxrODaAabXFa1smlgAYwvT2tSIuy?=
 =?us-ascii?Q?YBcux/cqNM4uJmkd8j9QgXjJl6zHGy/LCpGCb5gsKOIYw83ubGw5e8DOJ6Fg?=
 =?us-ascii?Q?KpP+FiDVdhYWVC2y9Gjh4XbZEVP6cBhgyoDr0VP4e16Tee+vjfaMhhUXhFWF?=
 =?us-ascii?Q?ordZRRrXXjKFvE/Agg5Lk/EEExxuHflAm+iWPtWZnwH71qQg3vN4my7+JJfM?=
 =?us-ascii?Q?w2mzPszx3ioyH1KFztQ483QcYSaEJQUeTx9gJpbCWg5AGC1CAdOzZpkuENgw?=
 =?us-ascii?Q?qB957BzgBK1KuMN2zsCmzuvmbKfql2ndzFaCqtHV6GMclsdMrvlJm71qxf4a?=
 =?us-ascii?Q?q56RB+UQWfes3YVYH9rQaASp86yom1zQaGMlJ8uUzybxsuEZb+j/LVzOSYPC?=
 =?us-ascii?Q?r+Tk4P5q8lmqwxEvhB9VBkWXO2Fj8In5NL68uGmWwbUZfppB/piLf43is6v3?=
 =?us-ascii?Q?NS81WjG/hy/nzV7I9UG31AdLGIyb26QN2z3tWiNg7SShyqf5Q2jxHzA17H8/?=
 =?us-ascii?Q?EMzGK+hd0cleXJ0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kjmyIZzPNJI54zyoOvakmH++EhyJVJpsouEXk7ABnorqsiyLh9+Kpo7HudIu?=
 =?us-ascii?Q?56Y8WcjQlX4XekQ0m/YsMxe6jjoyjZ/qXDHSjgWTRhbsqAquRLLvhO/OKZol?=
 =?us-ascii?Q?OdoOPnSSnmpS9Qb5wIfpF9RcAr6ueAOyyxRGHjO3+o/cT/prQRyCti+tCVTU?=
 =?us-ascii?Q?EKTig6mut08uYEFj2+UVL1N0TmRj+7+Rscip6dPDFpqmn6X77kDKsZ8rljQK?=
 =?us-ascii?Q?IR3E8GaZ6odg2gtaIygL1rVSIOHt3m56w6xVdQtts7fD3NaqDd4rhZarfwR/?=
 =?us-ascii?Q?lXD0p8oqEWDF66VQNh/Y4Ncr5FhG1bOuTmkieapv7tW2y9Vsoq54aqVpi3sJ?=
 =?us-ascii?Q?efGzUCGF/UWmMz/1QT1oDEqxaFuQzXO6+cQBgoN3MVH36Oc+DtmAUiRCBXE2?=
 =?us-ascii?Q?iw06wfpirB5U87uBlCglrP8kCR0ArIX5b/BxQuc+CG/+/DBl5s0+vN3DGZCA?=
 =?us-ascii?Q?GBbs7O7TX6yUkeapHr+SJoIU8v+Yq0bxsWv1iRBS0tbXlXuzeCUfN44tjtFX?=
 =?us-ascii?Q?imnmnIB2B8kgz0y4/HW6I6tZjGtWFRJ9klyFkQNDR2BpGSfn6B4DC07MADSU?=
 =?us-ascii?Q?BkTRMHIy2KQkyew8IPhRorEyypDLMCYuEQ5GkoJ6GbQEVB8s7lNtN8bntmbR?=
 =?us-ascii?Q?yZEivEK8zT1y5Qqe+g5JiQoqqCUfeR4o23113ctJh31fLETuZyCxDPYjaU7j?=
 =?us-ascii?Q?/7mqfHS5rrG8amOMIxXPbarzCmnJ7ZsUk/uvBOzlzE6DaSAIpSCvMkw68g2L?=
 =?us-ascii?Q?Ytr8IlbI94nzZnBW/JoXtfME/MNRyOG7ddsEAASfM7UQ1NgLthkmazMGkkcM?=
 =?us-ascii?Q?fW2HZcd4BErXvFCoLtRyCJjxPDfOfQoX0SL3cUaXQfsKlBl2kZDBU6JJLEPm?=
 =?us-ascii?Q?/2Lz7GeSB/I10ZV7KmCz4B7gqiVaZ3Zy/UTu8GoFKeg5rBYUcB9xBqenkflU?=
 =?us-ascii?Q?GtiW6+2Dte0mMzMV1pqj0+rEOD/MPqMx4jNqDqZ+m2cpoKyKYDCliLJHoRHn?=
 =?us-ascii?Q?ob+LJayjf15G9eqTycEPpc0GegzcgM88tJ7fn9MTdltcmHeMgnqNv1EOrRJ0?=
 =?us-ascii?Q?XP6VUQVHnWe61nYu0GCklDaruklTc+QzCjGAHtwjXQHYsFt+YF77Q0++wQO3?=
 =?us-ascii?Q?gG77vO+/4cc5dWv0c04e9vnq9TxmNIC24LmsDJBSLeMgri3qjtAKgc9wrDf9?=
 =?us-ascii?Q?uXAGYf6G+plLTAVPsvNueWJd73nOK+6TsKAvrnPgAyBHWTgi2WWlPs4wX3Pb?=
 =?us-ascii?Q?gf6EHwX3Rhqn8tPiT2pqkRTZI8riL0ELh9zesSZdsN7kokdSn32jmIs6mhJx?=
 =?us-ascii?Q?39vXeDL4MvUdwB5jb+GNEFZS3iRFq2vMI/mQnv2YsBueEobGUS+YBRxK926T?=
 =?us-ascii?Q?V76xFwhizlDm6ZbnZ37n2ZS0ccRZxZCezhbCnKJtB1vt11yDZUrQFxk1cWEq?=
 =?us-ascii?Q?Ldu9U25saI2C0fNWVkdz6d9iyuUcOeVgRemi+3O2TW7Sbu95IB8DpsZPiHno?=
 =?us-ascii?Q?LHRUN9h4xR1Wm/Atw1MD7UEnDFGqzDznCK7nYa756kU+isa8Qc//suWj22ON?=
 =?us-ascii?Q?2f2PZlpVCB4sZBxPdE9sCv9SdXR3O14Eji3JRdRXBcsM3KzNgdQ1G1fcCmaQ?=
 =?us-ascii?Q?Q6mGfN8a0B3jauijqZDyIcUwPhBXDDDwjXja8W/QdWrY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e9a8ba-f97e-4b0f-927f-08ddb2fd1bf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 08:57:12.1968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6rDtd4KNjHITsmE6/yFI3bJMmmJRlf8pFh89cNBT9OmZz1YPwj1nb25DWLeAm00Jy6U7Ya198FGIcz4adj9dEzJvcbqqITyP+0JICjCNROo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9399
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

Ignore the patch, does not seem to be rightly rebased. Will send another on=
e.

Tejas

> -----Original Message-----
> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Sent: 24 June 2025 13:30
> To: intel-xe@lists.freedesktop.org
> Cc: Lu Baolu <baolu.lu@linux.intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH] [topic/xe-for-CI]iommu/vt-d: Enable ATS before cache tag
> assignment
>=20
> From: Lu Baolu <baolu.lu@linux.intel.com>
>=20
> Commit <4f1492efb495> ("iommu/vt-d: Revert ATS timing change to fix boot
> failure") placed the enabling of ATS in the probe_finalize callback. This=
 occurs
> after the default domain attachment, which is when the ATS cache tag is
> assigned. Consequently, the device TLB cache tag is missed when the domai=
n is
> attached, leading to the device TLB not being invalidated in the iommu_un=
map
> paths.
>=20
> Fix it by moving the ATS enabling to the default domain attachment path,
> ensuring ATS is enabled before the cache tag assignment.
>=20
> Fixes: 4f1492efb495 ("iommu/vt-d: Revert ATS timing change to fix boot
> failure")
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/iommu/intel/iommu.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 7aa3932251b2..863ccb47bcca 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -54,6 +54,7 @@
>  				__DOMAIN_MAX_PFN(gaw), (unsigned
> long)-1))
>  #define DOMAIN_MAX_ADDR(gaw)
> 	(((uint64_t)__DOMAIN_MAX_PFN(gaw)) << VTD_PAGE_SHIFT)
>=20
> +static void sm_iommu_enable_pcicaps(struct device *dev);
>  static void __init check_tylersburg_isoch(void);  static int rwbf_quirk;
>=20
> @@ -1825,10 +1826,11 @@ static int dmar_domain_attach_device(struct
> dmar_domain *domain,
>  	else
>  		ret =3D domain_setup_second_level(iommu, domain, dev,
>  						IOMMU_NO_PASID, NULL);
> -
>  	if (ret)
>  		goto out_block_translation;
>=20
> +	/* PCI ATS enablement must happen before cache tag assigning. */
> +	sm_iommu_enable_pcicaps(dev);
>  	ret =3D cache_tag_assign_domain(domain, dev, IOMMU_NO_PASID);
>  	if (ret)
>  		goto out_block_translation;
> @@ -3765,11 +3767,18 @@ static struct iommu_device
> *intel_iommu_probe_device(struct device *dev)
>  	return ERR_PTR(ret);
>  }
>=20
> -static void intel_iommu_probe_finalize(struct device *dev)
> +static void sm_iommu_enable_pcicaps(struct device *dev)
>  {
>  	struct device_domain_info *info =3D dev_iommu_priv_get(dev);
>  	struct intel_iommu *iommu =3D info->iommu;
>=20
> +	/*
> +	 * Called only in iommu_device_register() path when iommu is
> +	 * configured in the scalable mode.
> +	 */
> +	if (!sm_supported(iommu) || READ_ONCE(iommu->iommu.ready))
> +		return;
> +
>  	/*
>  	 * The PCIe spec, in its wisdom, declares that the behaviour of the
>  	 * device is undefined if you enable PASID support after ATS support.
> @@ -3780,7 +3789,7 @@ static void intel_iommu_probe_finalize(struct
> device *dev)
>  	    !pci_enable_pasid(to_pci_dev(dev), info->pasid_supported & ~1))
>  		info->pasid_enabled =3D 1;
>=20
> -	if (sm_supported(iommu) && !dev_is_real_dma_subdevice(dev))
> +	if (!dev_is_real_dma_subdevice(dev))
>  		iommu_enable_pci_ats(info);
>  	iommu_enable_pci_pri(info);
>  }
> @@ -4309,6 +4318,7 @@ static int identity_domain_attach_dev(struct
> iommu_domain *domain, struct device
>  		ret =3D intel_pasid_setup_pass_through(iommu, dev,
> IOMMU_NO_PASID);
>  	else
>  		ret =3D device_setup_pass_through(dev);
> +	sm_iommu_enable_pcicaps(dev);
>=20
>  	if (!ret)
>  		info->domain_attached =3D true;
> @@ -4359,7 +4369,6 @@ const struct iommu_ops intel_iommu_ops =3D {
>  	.domain_alloc_sva	=3D intel_svm_domain_alloc,
>  	.domain_alloc_nested	=3D intel_iommu_domain_alloc_nested,
>  	.probe_device		=3D intel_iommu_probe_device,
> -	.probe_finalize		=3D intel_iommu_probe_finalize,
>  	.release_device		=3D intel_iommu_release_device,
>  	.get_resv_regions	=3D intel_iommu_get_resv_regions,
>  	.device_group		=3D intel_iommu_device_group,
> --
> 2.34.1

