Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02666C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 19:19:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E12112BFE;
	Tue, 16 Apr 2024 19:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PuIc8lXy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B614112BFE
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 19:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713295158; x=1744831158;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YgoZo4oqNeKWVOYMOKH2JHqXNxNfHzTZCTIbn80laRw=;
 b=PuIc8lXy0y4JqB3NZ6eJpjxI+oZuVIljuRkbMFKqEzJCCin50XHo5M2X
 RX1OWHII+D5ssBA9hsrj5Odwp2hq0tu5GvipNmZplLholAvm6CLfpWOvM
 RcKtf235J5FM/eXbz7tlL6CC5WR2CZJs212FKolohN/4Ik2Cz4UrOp3O0
 8N/B9qcf3yZ1EXgZ53/u/YsD0nexFZx3a5YYSdUT7bpJM/fHQTLPyBiBx
 dPS5MswgRCpDJKJbqpc374R006ry/S+XhIg3AwFWsTRzYWAN5WivWHp+F
 dtXzpPYa3R5Q9nugK/bUcWytEZJwDIQeT+E54ZaI4N/96vu7RHhnHIEJy w==;
X-CSE-ConnectionGUID: iTSA8MPXSHyvsbi7We6g0Q==
X-CSE-MsgGUID: qUFQp+qTQcCDK07bwLE7sw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8979789"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8979789"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 12:19:17 -0700
X-CSE-ConnectionGUID: 7aKPjbzPTa6wJcHcY9M1dQ==
X-CSE-MsgGUID: 1Djr92XXQ3CrOpyEEaSw0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="22429344"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 12:19:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 12:19:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 12:19:16 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 12:19:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lDmVFIur4wE+wG1pkDV1NUIZZ8SKLBTGWQYk9gViTkcB3FtTGIAeJx/oDyD/pWgbacKZDbXVQhNlj0kKeI88VGFJf5ejQg4CmBFIk+9gjAp681yteOksukax7Oduf8+/QuqXA9SmcVW095cu6Nch9v5BrqX+Jui2NcX5dpnVkUtwMIvwlgRKJs8ZgiQ8HBKelQnpVJQI5koG/Dq5OehLh52tOQVMg1/O2baNyYt8SKoW+PcWIYRxFHrjv4nvCYk66nSQg1T+rtT3B1R3ZZHXP+CwhwswzphTPd/x+jFaozOIDcNPtrpR4YMKpFdy1sOqS6i1lbgZLYp3vEtuvWK0ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oFrG2Pr2M47kihigTNSiWzHZK2LqljQaLlUOkZs2fg=;
 b=c+/KhJ4t2b7jopgUiaTxquu9lRhL/t5NfjhTqGWFasAb3GVMMWq4vm5YW/WJM1D+BwfkLs3gDxvlbKtKrsz+vai2P5ud3zP/HVcp/OgZ9cFhawcymulWCKs1q6E48wjsilplUe6mKScRhylRsGBg9CLGJeUE74eiWFcv/niTBcPmwwxTOq2BOmPJ4TnysaDdeyT8NKtAVmXb1dI2ogh5gVU2pjGkDkl+EeplM1VonPyps4CLRyl+ojqsdW5OoijaUdiA3KYk9Yw8Ay1GB8EA2XMWrx9GlUZQKB7CN+RhxpUc66hI+RpvcbtI6JApvpaZarrInqIDSROxf8GJz1q+4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB8465.namprd11.prod.outlook.com (2603:10b6:610:1bc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 19:19:14 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 19:19:14 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH 2/4] drm/xe: declare wedged upon GuC load failure
Thread-Topic: [PATCH 2/4] drm/xe: declare wedged upon GuC load failure
Thread-Index: AQHaist7rPth36UTCUazmG1PI8ARwrFrTJUAgAACNICAAAEb4A==
Date: Tue, 16 Apr 2024 19:19:13 +0000
Message-ID: <MW4PR11MB7056A3B91F62B41BF8E1491EB3082@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20240409221507.1076471-1-rodrigo.vivi@intel.com>
 <20240409221507.1076471-2-rodrigo.vivi@intel.com>
 <Zh7MCpZGUz6z3dZm@intel.com>
 <c4d64vrido6iyvfnlzbf2jdbo4cxk26tqdjdxjp4wt72l5yq6u@ohewctaiish4>
In-Reply-To: <c4d64vrido6iyvfnlzbf2jdbo4cxk26tqdjdxjp4wt72l5yq6u@ohewctaiish4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|CH3PR11MB8465:EE_
x-ms-office365-filtering-correlation-id: 8576e419-02f2-4237-744a-08dc5e4a1a31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hqrMh8mLjdUTWadsJ42J3aGJlJEAGVbBbiP9qPVICsi/abmz+6xAwK9kgiKwWB1qu6yEj3peQdUp+voElFpm8nIAoibG/BKASZvvxv5ndNX1cCqXDwgrqnKsqB2AhJGhE/XJpCeAD0g/rad1Z9mGhVg8gHyzusxuKEY+NDo8d/0jYako+fblyfsZ1jKjDADss5gmgfUnhRIPJzdPomhCSDLwnjXYHDYXCt3d9tU0BK4XHC3J32JPaG+lKnLo4GCh2/pO8WVyTALXIBPX1kx/DWQOKoS3/pR6n/t4ts17xbF01ujtg2Ex5Pdnv94yA8ZBedwbuHD8wYS1Ttsgq80aVUI2wOtfRrG4I92CMqGnqY8MMXPcPm/sQUmbh0L3XA7m7YEGJncqwEhbWR2zVugOd73ZPmZhU/LmTRQ/qaPAhfQ3FOjzF5MOeC3RNs4hEeC+vc6vlbH+LjZZZ2gLyR6kdOPPOw35+EQ32yKpCZGSQcXnjaui8NJg7YDShU8LpHMz5AJWZmp/Q/pFb0uNP+xDoT+DhTXnJEEwwS3GhgDqCgBH5VfVXcQdPOCmfv+VwnDNCeasArkKeOgCksz42D8xHcFpqbbsu8WaXiMnQrbTIQWDxCBHQviFaCN9yb3eCvWgqsgVcZO+PH/OTIrfqMoxHlxKNbib0OxHkkt0ItX7zzyVrbCUgjgLwgrGoHIGu1ALH4A7s+/VW3/KNzRNCNyq7PMtLeiJRMg5mEDY6aUY8zs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?feiSFvaCltWCiMya7a6BxqMckG5ryw5o4fGJKQdfqqxmBEDctQjDyUAz4BGG?=
 =?us-ascii?Q?UtjaZpqq3Q0bnPREkbhK/eGh5Ijkig468OdnvIFcDafN7lIFogSAUbzBPf8+?=
 =?us-ascii?Q?oKo80Jdrzb/7XrsL3ygh0sYkRjr32Cel6Un3XRssvODQEFWH10SsdnTU1/xW?=
 =?us-ascii?Q?SLAZ9FDaNFD8fUzBNu98b/Vuk2Th3YkJSSwZWlV5aItG4X5uZGf+wZvVgGad?=
 =?us-ascii?Q?+Amdtvv1q0b/cLow1OFW7zoj2AaVlT6NYDbmIsrh2Caida4vEbJ//fZoXQQC?=
 =?us-ascii?Q?emMYkOVTa0V4ReyL+qkxeZh+8Lqdd3ia03rbgpOAC+gercLQv5J5hxWMbYoU?=
 =?us-ascii?Q?or9wjcheO1eNaoHIgmz9vg/chYD8DTfVfFr2yeMUz1EkBT+/IRf23jiLLw7+?=
 =?us-ascii?Q?2jtq04knWhMAOLRsqJQpCdz/ICW7Hik8wC0SUVKn/ZzDhCoTxIHZZpvlE6Ry?=
 =?us-ascii?Q?WgCv+XXscOefUcVxQQTvoY9s8yDK0A9BoupfYrnIISY4/QCVIG2HSRI90UiC?=
 =?us-ascii?Q?oMobLjdacFvVWxY40P3ILahbz7GTEMd2Ij7+Rrqh5y7u/6oVBySfc1q9P2k6?=
 =?us-ascii?Q?H8NmRw8b9lGGyl+Zsb/VhWtnhsRZQmvgc9fjSIveII6SWrdn5427+DkitAyj?=
 =?us-ascii?Q?uOt4PXTCRWp0bJ+9hbP9nNgQeaBwRv+qWrcvJGYBEi6wIfzrpB+6IqO8bcnK?=
 =?us-ascii?Q?k/h3JnUEG3xyMEDX80Wyow/JmAIymL25oerU0hCwjfvsdLna4QARzRYK3qD4?=
 =?us-ascii?Q?xUTA8hUrEaOWTHcuavWGVs+f7+qYjgWKWqzNk0IpDKwb2ocNeT/of4xcyyRz?=
 =?us-ascii?Q?8Uue5pgZKPdz0wnNqJtIn7ZdtRMhdvxOLquE+ZDxIkaBWdDjFR4numVeq/Ey?=
 =?us-ascii?Q?j0AKwCJBvdRybUXv33gBoYYopy+p3O+TXHoL9LFySD98bO8A93GbhxJs1hyK?=
 =?us-ascii?Q?9anHU9NiEecb1qJXOCsWXh1rEiPDKWxuUrela0ywcc5xepM47oyUeEYZ93d5?=
 =?us-ascii?Q?BYwAFFa3mT+ZoBUUzXbbZzLUjf75r8tdhwSDKO5K+zan6hO/B0Z39xBsnap8?=
 =?us-ascii?Q?Mm2ImuxRto7Sz0wtScZuqoUB2ow3Rz/tZ92DO/croh8XiOHFzJ3fdGWeqjh9?=
 =?us-ascii?Q?sM+5GsywKlZfkH+FZ9PDu71Q/vZmf0idZfEpCqE9sngET4uiPbA44TW8n0cP?=
 =?us-ascii?Q?wyKU/DPGu4mf9obzvV0tdU/jufQioDeRlJoPDB0QXbo/a5064doX1RHL5bbu?=
 =?us-ascii?Q?ZYhroXOiH+S9SMg2X3pjc5phTNvuW0JvlSRY1YjmMecDyxBF01ECClvYMcWo?=
 =?us-ascii?Q?V76C3bwq4k2GwMy0C6bVj/ZiQ4tS2regR+0yfmtsJ2AIDZSQ5O+wc+5vURmG?=
 =?us-ascii?Q?Mc1QB6aDypZa0Ry4hUba8k4fjcjRfVD6hLqOudQttJMCTfqnO6RlW22a5DXZ?=
 =?us-ascii?Q?ZuHhxv4LcGbGAYXmiVWqp7z3AUVgTThP0S0NFEgw/YidtmC1UzTQsOON30wb?=
 =?us-ascii?Q?UkmCZ+1ndWj8d8tNMgvh6UG0PEGTEOJiPsZJK1+iY6WcPalr2XrssMdQL4v5?=
 =?us-ascii?Q?QXebgJpQK1b3Nch5KvNbqTHpeKzVP9ObX0tgG4QlWvTW4XyeQteP+GPK09YV?=
 =?us-ascii?Q?AQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8576e419-02f2-4237-744a-08dc5e4a1a31
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 19:19:13.9331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0kJ8qGiMSGC8Z2ARMpNSk+Csjysotn9rfgo23G9DW4RcmaKwa2vdD0TnL8ZaJH2ktKdviz0ClOLsvuBEv5pcYGA3nABSeMkTJY2cS9E8dZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8465
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: 17 April 2024 00:44
> To: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>
> Subject: Re: [PATCH 2/4] drm/xe: declare wedged upon GuC load failure
>=20
> On Tue, Apr 16, 2024 at 03:05:46PM GMT, Rodrigo Vivi wrote:
> >On Tue, Apr 09, 2024 at 06:15:05PM -0400, Rodrigo Vivi wrote:
> >> Let's block the device upon any GuC load failure.
> >> But let's continue with the probe so guc logs can be read from the
> >> debugfs.
> >>
> >> v2: - s/wedged/busted
> >>     - do not block probe or we lose guc_logs in debugfs (Matt)
> >>
> >> v3: - s/busted/wedged
> >>
> >> Cc: Matthew Brost <matthew.brost@intel.com>
> >> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_guc.c | 42
> >> ++++++++++++++++---------------------
> >>  1 file changed, 18 insertions(+), 24 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_guc.c
> >> b/drivers/gpu/drm/xe/xe_guc.c index 240e7a4bbff1..f1c3e338301d
> 100644
> >> --- a/drivers/gpu/drm/xe/xe_guc.c
> >> +++ b/drivers/gpu/drm/xe/xe_guc.c
> >> @@ -451,7 +451,7 @@ static int guc_xfer_rsa(struct xe_guc *guc)
> >>  	return 0;
> >>  }
> >>
> >> -static int guc_wait_ucode(struct xe_guc *guc)
> >> +static void guc_wait_ucode(struct xe_guc *guc)
> >>  {
> >>  	struct xe_gt *gt =3D guc_to_gt(guc);
> >>  	u32 status;
> >> @@ -479,30 +479,26 @@ static int guc_wait_ucode(struct xe_guc *guc)
> >>  			     200000, &status, false);
> >>
> >>  	if (ret) {
> >> -		xe_gt_info(gt, "GuC load failed: status =3D 0x%08X\n", status);
> >> -		xe_gt_info(gt, "GuC status: Reset =3D %u, BootROM =3D %#X,
> UKernel =3D %#X, MIA =3D %#X, Auth =3D %#X\n",
> >> -			   REG_FIELD_GET(GS_MIA_IN_RESET, status),
> >> -			   REG_FIELD_GET(GS_BOOTROM_MASK, status),
> >> -			   REG_FIELD_GET(GS_UKERNEL_MASK, status),
> >> -			   REG_FIELD_GET(GS_MIA_MASK, status),
> >> -			   REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
> >> -
> >> -		if ((status & GS_BOOTROM_MASK) =3D=3D
> GS_BOOTROM_RSA_FAILED) {
> >> -			xe_gt_info(gt, "GuC firmware signature verification
> failed\n");
> >> -			ret =3D -ENOEXEC;
> >> -		}
> >> +		xe_gt_err(gt, "GuC load failed: status =3D 0x%08X\n", status);
> >> +		xe_gt_err(gt, "GuC status: Reset =3D %u, BootROM =3D %#X,
> UKernel =3D %#X, MIA =3D %#X, Auth =3D %#X\n",
> >> +			  REG_FIELD_GET(GS_MIA_IN_RESET, status),
> >> +			  REG_FIELD_GET(GS_BOOTROM_MASK, status),
> >> +			  REG_FIELD_GET(GS_UKERNEL_MASK, status),
> >> +			  REG_FIELD_GET(GS_MIA_MASK, status),
> >> +			  REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
> >> +
> >> +		if ((status & GS_BOOTROM_MASK) =3D=3D
> GS_BOOTROM_RSA_FAILED)
> >> +			xe_gt_err(gt, "GuC firmware signature verification
> failed\n");
> >>
> >>  		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) =3D=3D
> >> -		    XE_GUC_LOAD_STATUS_EXCEPTION) {
> >> -			xe_gt_info(gt, "GuC firmware exception. EIP: %#x\n",
> >> -				   xe_mmio_read32(gt, SOFT_SCRATCH(13)));
> >> -			ret =3D -ENXIO;
> >> -		}
> >> +		    XE_GUC_LOAD_STATUS_EXCEPTION)
> >> +			xe_gt_err(gt, "GuC firmware exception. EIP: %#x\n",
> >> +				  xe_mmio_read32(gt, SOFT_SCRATCH(13)));
> >> +
> >> +		xe_device_declare_wedged(gt_to_xe(gt));
> >>  	} else {
> >>  		xe_gt_dbg(gt, "GuC successfully loaded\n");
> >>  	}
> >> -
> >> -	return ret;
> >>  }
> >>
> >>  static int __xe_guc_upload(struct xe_guc *guc) @@ -532,16 +528,14 @@
> >> static int __xe_guc_upload(struct xe_guc *guc)
> >>  		goto out;
> >>
> >>  	/* Wait for authentication */
> >> -	ret =3D guc_wait_ucode(guc);
> >> -	if (ret)
> >> -		goto out;
> >> +	guc_wait_ucode(guc);
> >>
> >>  	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_RUNNING);
> >>  	return 0;
> >>
> >>  out:
> >>  	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
> >> -	return 0	/* FIXME: ret, don't want to stop load currently */;
> >> +	return ret;
> >
> >Lucas, thanks for the review. Just to let you know that I'm removing
> >this chunk from this patch. Himal had noticed and warned me that this
> >would change the behavior of other cases that are not touched or
> >covered by this patch. i.e. if the guc_load fails on guc_xfer_rsa or
> >xe_uc_fw_upload, we were not aboarting the probe, but now we are.
> >
> >So, let's remove this change from this patch for now so we can go ahead
> >with this and then on top we see if we do the wedged on top of the rest
> >and make this function a void case.
> >
> >Agree?
>=20
> yeah... I saw his reply and responded as well. We either remove this hunk=
 or
> we make the other cases also wedge the device instead of failing
>=20
>=20
> Lucas De Marchi

Thank you, Rodrigo and Lucas! With this addressed, patch looks good to me.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>=20
> >
> >>  }
> >>
> >>  /**
> >> --
> >> 2.44.0
> >>
