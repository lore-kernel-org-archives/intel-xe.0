Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41458C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 15:03:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AEE110E250;
	Thu,  3 Apr 2025 15:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S17iutK7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F71A10E250
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 15:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743692584; x=1775228584;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9Xn8N8N69h9ga1HOKI/zlnPD+dfvr7eW4mCPhMzS33I=;
 b=S17iutK7C2ZZg/iAjMiJDew2H10d7vmaHcEc+D6Lk6RkVwKxdooe4rRQ
 bHZ12reqgBdz/JAdrT5cKyFMOvqJFLpPDjte4hLhVgPzfg8nh4QFt+670
 AOkYiMHNZ0Fbe3U4HKkxQAyda83B9ymtN+3YlmZysc1oxN26kHSoUO3Sl
 ojpX2Q04p7v7aitUIUpocaaZTaUdNcrhRRkozf+i/i0zusAcKbDP7DrEV
 vbKjBV/YZlYXsxwWQ+XXaLIt1BEIV4HOscsO1f3BwvtlZLcM/lqoSg+j1
 hpSzzYDD8HYyysANRrKGa4BPZrxDpKH1CgeGWQ/pOMoIvYqtGjegspsZI g==;
X-CSE-ConnectionGUID: jjILSojxT0SRWtdxWLGZtA==
X-CSE-MsgGUID: JPsUHzPMQUKnVuft+g6L5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="47825054"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="47825054"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 08:02:40 -0700
X-CSE-ConnectionGUID: W3Nx0v2oQhanqmBrBpMy7A==
X-CSE-MsgGUID: UQ5EUDOwQreClJuL6/dPxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="127319055"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 08:02:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 3 Apr 2025 08:02:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 08:02:40 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 08:02:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BtPCj6yjzkZ975/V4L3ywwsPV2iOH3AwlP6XIepBkV7LlA62iZxs/oPGPvyJ+5WCIpfYjgnpaEZcSd4Bjx/3CuFztPMLnFpNGZsyraOO51fBe3RfoPbJJLaYATNxqqqf+wH/VoNtxsSoptwEDBv1R/shGPO1YTUwRzdkf2GZt1u3TO6pNTwNdsyH8LzEXSYdxdNwOYy5CtvSnFQqAUXwFAGvXi2gdwK9AQ1crdWTqaehLFp9CTx2syL4aBspJjsPDnj+y7HeXi7zfCT9Iwu8aT4jmGCFmp9TEInHzYK2M9lPnuOYAL+WZpB2Z8bWEbn5Z+vV/9/0dnm+nXjYC6hNVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Em0iLLkKszC9a5Qx2xeVdfjAsP2E5MWm3kVlzRbWB2Y=;
 b=D8TLGEn/dbef5uiPJwedWblDUWkl68d/OZXYb3wbBLF2PXCNCGdHpyJRfBHene+W1vB5oLCpcxkUbF3Sp34WGTnMTMr7Gbo3ES70G+YPpBkEN4cVHJxVY0HV2ishGaPl4xYKxMeI8gCO/KvaNw7QCrK9psxK3hF91rRp7FmDbv2j/WGkhuDVVg3Zt5mtpfUl6JtEcYEWzWR0/Ok4ZC8XTnjTpBD+EOo9cTEhKsBY3lEeuQQaI8B2gDXbWZMfz6L8ZHbRu9o0DHCl6ysFb5DVVrtjePqI4YGuzZFMTWwGdKa6PE0MZpVw65RRVaoo3zF2H0DPdy5yuUri5cpSny20Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Thu, 3 Apr
 2025 15:02:37 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%7]) with mapi id 15.20.8534.045; Thu, 3 Apr 2025
 15:02:37 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: RE: [PATCH v4] drm/xe: remove unused LE_COS
Thread-Topic: [PATCH v4] drm/xe: remove unused LE_COS
Thread-Index: AQHbpEsOibOfiKdXQEmRHNdpY3c+97ORXYUAgACr6kA=
Date: Thu, 3 Apr 2025 15:02:37 +0000
Message-ID: <DM4PR11MB54566C87919A0C6D03ADDB61EAAE2@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250401205703.4179906-1-shuicheng.lin@intel.com>
 <20250403034608.332548-1-shuicheng.lin@intel.com>
 <SJ1PR11MB6204019D902743D0D9BFB96581AE2@SJ1PR11MB6204.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6204019D902743D0D9BFB96581AE2@SJ1PR11MB6204.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|IA1PR11MB6098:EE_
x-ms-office365-filtering-correlation-id: beaa3883-2a3d-45a8-a0cc-08dd72c092ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?+kk5AbJI7Sh3zFr3qGhY5k7ZGOSd959i/kc2C5GECW/8PqKdpBnwrxcd/p9O?=
 =?us-ascii?Q?NnvTbI8sfrhmfdQCZsh52SqL8APBGEWZWg6FIXQtCu+wM/urSGGqcRv3jUNF?=
 =?us-ascii?Q?XTeNXvUnXrmXvpUY+lYtT6v239x/IPJPE+jsCuzcDPFGeK/e9yZ3iH1nOeln?=
 =?us-ascii?Q?Tws5z13BUhKSOsy7nrxRFm5jE8rMwSXDvvxWsL6U+r/2TJ77pgQjLpxtLY0O?=
 =?us-ascii?Q?MZzRsBGrl1p7bAkxHPAweng5CaEp8TSoGykqU2bNvK0IMPWo3CoDXXb0jGGl?=
 =?us-ascii?Q?7dkc7PDkpKNwdd+O2uA1EcuD/KI57ZBbUf2ktxsoHLBNAHa19FNZUeQZMEPP?=
 =?us-ascii?Q?jAGGg9ortrdryHO/dZ+vciEOqA1EGMFo4yaWxpeFhU968v66EMT4yR63+Jxx?=
 =?us-ascii?Q?nKDqTwwxIbhBK/IsyQ6AsH9/VV2BgL3f9ae9mLiyUifXiDZL3Z7h1TGe4NzA?=
 =?us-ascii?Q?3Blcin/uO3xWJfvyqj2CVCSwy8Gt/WyW2m8bPWiqVSWhERm8S/GoKo8HpF44?=
 =?us-ascii?Q?bogx0PvWKJqYNexrcKzefFhBzkRCxLzg2Y5uMNz568knn9SlKZWwcLLnokUy?=
 =?us-ascii?Q?P6D+JXa/UeudKoWClPV+jPk0AyFE5BVsKJ1h6OoXnKJr7qaHfJKxRmAoNBOE?=
 =?us-ascii?Q?TMdOlVhE+aqfHmluPw0Pc7ghGWzdbGrQ4L1ZQbqC9ak1++/OnAFujkUHHrsb?=
 =?us-ascii?Q?YlzOi7FROAwCupr8LY36fLjygHU5Xz1kq3id4U/tBhePWCnzPlaHDJUqthUl?=
 =?us-ascii?Q?j5USNie+5jPqlijquXa8nAetJjXNb/w6iKHiATEdXh1bzOJLGkgL0fbMiIeE?=
 =?us-ascii?Q?bWIQEQRgZh1N1SQpqZd1R+sAE81jyYXrC3CokJz6Wh/JbHSqtPf5IN4S016E?=
 =?us-ascii?Q?0BEA00CaXcJjDHI3lv5xL22TKKEAEiubc8dOmDOwLAee6tiVvQH8KA0i/mIq?=
 =?us-ascii?Q?js89UWHANs0oUorx3bo/qEhkSX2VWGy3G9wqADfT3d0ZCbaW2eEkWuh2dnZ0?=
 =?us-ascii?Q?1j808C3g+1EdIP7m8Db+drT+bPf0FY6iv3ZcieAC+K3t3nqYIYDo59oDU7PK?=
 =?us-ascii?Q?7QLfyJy76Tsx8xAfi1llb/+vyZjmLZ0Z0tAxMzScu3zOBp2hsRArKdYKtlXJ?=
 =?us-ascii?Q?91ncweSePobEm3Jgtb9yN/jT50Q6W3v3DzGBI1D8VlVdGYxXxp3xtnVzP6Ag?=
 =?us-ascii?Q?NT3UEhL9K9GVlBVRHjucrAi4BhshNpVbLrISoMVeJ4fIiTpJScR5MFliV0uu?=
 =?us-ascii?Q?hDilaKVXP2pbFB/uq4VTcUExebT5qINcKvixX9suTXGO3njokA3IOueToGJC?=
 =?us-ascii?Q?921ucTNeb3Vtk6fpA0enmDMESxPGmoN8pVHG67LNGP6JfL+nx8MSR2bVIdMB?=
 =?us-ascii?Q?SLv/rrSPnGIlX5nY7O2R3Z5dFMvOztWq0l2gV+WI7cdjbu2OMxR3O+uIE5We?=
 =?us-ascii?Q?oLDuBnOvKPwCnXvroeEUSiJEEVeKNDqi?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?q/OhfkcNLN6wbfLzSBnUq9tXC3/Fr7I6V9mlS6CQdI+eX9KCYFvIlfZZmz0Y?=
 =?us-ascii?Q?BY2okDxFxW+yHjt29jP5fTDmWtMGjsB5aonoeZ/bR1Q3zZoJvqyA3W7ykCQG?=
 =?us-ascii?Q?KXv6AkRTah5P1UaPGkrpJ99+jzmK/y/PqwqmWXuNDni0/csYTYeE5p8jcnqE?=
 =?us-ascii?Q?rcddpCQ4KFe6PJOdoSFCnnZUjixmXHjL4l/RtgYDDehcA95iOi539r1JWyfp?=
 =?us-ascii?Q?evsv+tSDV6VUhuObU+UFgOdkt+gf9/fEzV1gTL8YFcBRaEqO0zMxeML3nHft?=
 =?us-ascii?Q?0g7RhzmpNbi+0/jbXs6G8L4oUkviohTioW5ww+C1PKWnxA8nuuLzBjlDsO2n?=
 =?us-ascii?Q?iKOmsVUn7uf+62nNjKzDXCY8n8aUgNbV9SxfbZqDn7TpjC9HxKw/yLsFDe66?=
 =?us-ascii?Q?jUHeB2XnbThUbmj79btrxpY9fc6VwTBy0LGE+RmX/3wUm3pK2tV6kEnk0CeB?=
 =?us-ascii?Q?69ddsUDy4cnRRwhjCvPVgmEQKQFr00A6bacilsqRfJXa8IEsYwp/Bddwledv?=
 =?us-ascii?Q?B16/pIqpwGW2pi7Humx9gyzeZLyb2pQV8o85IIThY/cPTX8BF5tsZx/IRXWZ?=
 =?us-ascii?Q?xTKHrlVutpHyyPdvf8oheBq99OWK1QSamp32P5MLN0KSuBD9gjvjt/Q6mQs9?=
 =?us-ascii?Q?t9UykR7huB1x2MrVXbuhytopki8MxquRN3m3KBrR/wrvD7MM1vDzXxnmkcLT?=
 =?us-ascii?Q?SVnBG/jmfwTLG+0PTTkw4GciLUDlsrDXVLmA1Scw9iNZiZJA3b2MUOJqmOFl?=
 =?us-ascii?Q?iZtOFyTU3zZuwybmII9tOoVcGeidET0rI2KuXtLuU/lQQ0tpFhBQGaTCgkjM?=
 =?us-ascii?Q?YfGLrGYk5SVL7OdTIBlAPqglmyjbDTXgOQX0H8GLUZQ69klqQRg4WtCENPKr?=
 =?us-ascii?Q?cYN29jfQTYMU+3k1IPhrzA5pU035p1rJwRn/biIXPrIGAHatazN5/dTL/JqB?=
 =?us-ascii?Q?EZsAhHNnFHUujpkrO4mFGjyxUErUgZpq6iNwJajTWj4YDgi99p5AXcKjQURF?=
 =?us-ascii?Q?mAUkfOFISXp8YaqD9WTK2JKyS8TzSkcTpT1773a5jcXTCTsygebICj1U88f9?=
 =?us-ascii?Q?OyivZqLL8OdWdjIwI0Djmsb1ZpM1Bca4N+0BSK7Dl2mU7w9tcNnnugsN6CdR?=
 =?us-ascii?Q?mXpMGjR5Ohj4rA8y5UVNACJjeWiBZ09kter10+kjg0PD1V/IX9IBa8N/5OIL?=
 =?us-ascii?Q?Eblkl+WMmIaKYCtira4xHoTgihrqSANbSgKbL4fehvpFMSC/zL9KoV4F58F2?=
 =?us-ascii?Q?LLYZAzd96OPVISxxj33wUKMAyjOGvnCzV1+S3Vqi7+ixQThRp8X+uvAOG5D7?=
 =?us-ascii?Q?lUdQZVw1E6JUPt4qKwOwsNBczoclWD2hkEcyOQ8bVWD4JuAtvcFizVq6MnLw?=
 =?us-ascii?Q?nOUWn494vZ31jsU7SoQuOmImPhPqK0u/BWqXoajiRg4lROSCKpgd6cWp/X3/?=
 =?us-ascii?Q?dzFlt7zGMhH8Vd5SetSEi/F1uPWDmS834S7wnvm16/sAyYY+l6uiualqHnWQ?=
 =?us-ascii?Q?pja5sdSb4TCck3dchUulc4VitxDq7jL8Dw13uHLyzmcjKpzOOn4jAzUXs5of?=
 =?us-ascii?Q?hCdD9fhWE8viv5o7yGZCLdKFTVSBbDLiT47dITtT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beaa3883-2a3d-45a8-a0cc-08dd72c092ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2025 15:02:37.6192 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4JTjUpaZurkcaT3dgo2jvu+HtYI03hDCWFpHPBQRmBKZT5FPVk45nrNEDP1IuRIfSzO8rlaHbNkelzQrCIMM/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6098
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

On Wed, April 2, 2025 9:44 PM Upadhyay, Tejas wrote:
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Shuicheng Lin
> > Sent: 03 April 2025 09:16
> > To: intel-xe@lists.freedesktop.org
> > Cc: Lin, Shuicheng <shuicheng.lin@intel.com>; Roper, Matthew D
> > <matthew.d.roper@intel.com>; De Marchi, Lucas
> > <lucas.demarchi@intel.com>
> > Subject: [PATCH v4] drm/xe: remove unused LE_COS
> >
> > value is missed for LE_COS.
> > The value for this field is universally "0" for every MOCS entry on
> > the old Xe_LP platforms, and the whole field has been removed from Xe_H=
P
> onward.
> > Just delete the line so that we don't have an unused definition.
>=20
> Your patch says V4 but no revision history mentioned.

The change is just some typo error. So I didn't mention it. Sorry for the c=
onfusion.

Shuicheng

>=20
> >
> > Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index da1f198ac107..c1590e322ef3 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -62,7 +62,6 @@
> >  #define   LE_SSE_MASK				REG_GENMASK(18,
> > 17)
> >  #define   LE_SSE(value)
> > 	REG_FIELD_PREP(LE_SSE_MASK, value)
> >  #define   LE_COS_MASK				REG_GENMASK(16,
> > 15)
>=20
> Do we need LE_COS_MASK then?

Yes. It is used in the code for read.

Shuicheng

>=20
> Tejas
>=20
> > -#define   LE_COS(value)
> > 	REG_FIELD_PREP(LE_COS_MASK)
> >  #define   LE_SCF_MASK				REG_BIT(14)
> >  #define   LE_SCF(value)
> > 	REG_FIELD_PREP(LE_SCF_MASK, value)
> >  #define   LE_PFM_MASK				REG_GENMASK(13,
> > 11)
> > --
> > 2.25.1

