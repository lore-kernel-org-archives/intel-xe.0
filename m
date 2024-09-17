Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F49C3ABD8
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 05:57:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3B110E1E8;
	Tue, 17 Sep 2024 05:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EkaELSkB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94AA10E1E8
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 05:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726552631; x=1758088631;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u9SYb7J6hY1tvW2CyQsb/c6NzVBi5CIkmxkaaT1VGvc=;
 b=EkaELSkBv3wQVMVitAkO8S4pkVzt6PQSDvew7MysqnUvaqsAceB6a0Tg
 eVdypXIxkoVn2Tpa40/eY6AD8hBjX5bDVFLihsOD8r76I1/LrA6Gk/mxW
 SsV5UgzpfEnZcselPE8u/0PvWrjcXLAUMiGX/ba034VNIyDS9OwNr0dg2
 K2NQffRzQKoWS13aS73Y4qeXfDYk+c7BGeDK8ooU4fRCM0UsfJGgyRwvW
 uwjjOMeS+Hk69aOAOYDI8+kmMVZdsmYWk1QD92J1TOJW0Pb9Gx7ps/koF
 5GNWfB0GcafIh4Ud+ivmX1Vid4kgWmW6J4M2TUWEOMl1+2e6UNZumQ/Ty w==;
X-CSE-ConnectionGUID: mjjrv07nTEap7L1sdpGXLA==
X-CSE-MsgGUID: oHCoiJ28R9aIoTHtgV8e3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25550368"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="25550368"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 22:57:11 -0700
X-CSE-ConnectionGUID: 3EYr4S4HSBq/2klWxPjJGg==
X-CSE-MsgGUID: iQu7fSuYT8uuj4O0tFCkqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="73448040"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2024 22:57:10 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 22:57:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 16 Sep 2024 22:57:09 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 22:57:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kcUiWL4zQmT/SgCD0kIHut6FEyUq8DLbcWxd2GTXlTB7CUFcjVJ8aZXxRxeAjOYNLugTs/FXPrFjams1hZdcuNsGEVeOJjBSC9+WWrK70cSzdzGFZfQSci/BZhncmy/1OXADwmJIJ//VEZt+2Fb7nMaNVG/CvzbhyvfmGl1pe74P/iDbQI5ZDIwrqZMp7YLyzWJ5c51b1zoTLACjr7lhAGVTFEB7edTTGzBoWcaqMh9t0mjHOyrBU6RZJ1Uv4F3cxILgH/tOOuiuWXjsvQMhuK3gyjPjGhD4m7gG8/K0w8Q+Kn3oudZnvFxh38dhcZ0nZGbWoB7pkva8lCUi9iLz7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJ4M3jIX9LRqh/CVA2H7vZLcz+eQLsuh3T6INSVAztE=;
 b=FAt+E8swb/GsUCLDExmsbXDM6E3ELwCGGCpyu54NID/J4LHH3AzqNsbB2ccnfnYJwXCvwJA2D7MXmkCs4Uic0Y1KiuWATPU+/6FWEA+tEFmioumE2e/V8W1GdiH5WH0yiUe5febRJpQ+WVGaKZBPx4x8hp+8+NFDdBJQLyP7ctXOamjLQjNE8ke65Io5RpfIqYjqmHh4qzGyZYY0+IBMyeOoTGZfl+YJE2SKhAuOz+XvW7SQ9WyvmqDKcFPm6HFWC/fE/N5efzgGdEh0HPKrM+w6AINVa0Ed26rNU1ws0ZrtlAIXbqmfCRY6HviyumuGx9sVa0pTZrOeaTHkXFtjSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH8PR11MB6976.namprd11.prod.outlook.com (2603:10b6:510:223::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Tue, 17 Sep
 2024 05:57:00 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 05:57:00 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, lkp <lkp@intel.com>
Subject: RE: [PATCH] drm/xe/rtp: Remove unneeded semicolon
Thread-Topic: [PATCH] drm/xe/rtp: Remove unneeded semicolon
Thread-Index: AQHbCG3gCpt/jHSq+UihM7NFZ0drO7JbeupQ
Date: Tue, 17 Sep 2024 05:57:00 +0000
Message-ID: <SJ1PR11MB62046D6FD87C23260E2CEB3881612@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240916192149.855996-1-lucas.demarchi@intel.com>
In-Reply-To: <20240916192149.855996-1-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH8PR11MB6976:EE_
x-ms-office365-filtering-correlation-id: d0a6fc0e-aa08-4e01-1129-08dcd6dd8bc5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?SVdTphUuGkR7XFujdbl2+mVyyfYhlQhjJX0o2kx7OdGsvKWO1jZ/87LJgGot?=
 =?us-ascii?Q?IbhfXvdLT6lYwKOKKIav6weQ8GCDvUzQwKbe1EW6F75Q2M1bcjADmRjdTB5h?=
 =?us-ascii?Q?J1qRjel+rPW5OJNwx8DFwuN/vo5A6DHHiJgT4Loi0S89zfAgmOqgjU5MqoAx?=
 =?us-ascii?Q?9QVYK3ji4VmywkAdXgAAvjIrET4Hyj7L/YbsWXJscTYsdJkDqFPLc/Mx6QUF?=
 =?us-ascii?Q?zf73aJtbMN11+aUT7kV4qQWV6MoOFeeQdtEDRGUg4Cto9YkGmsmovP3vG5dX?=
 =?us-ascii?Q?nLTXncpueS3nSehSWGnGbLYnGqbNt7Husarrquvv9Ig148wIvSk+2FCMWWPo?=
 =?us-ascii?Q?xfFLPAB1GOxWbz8WLskLP3iQr6JyR3XOBaTzN59d6KkowN3tUE8dkjeGqLpw?=
 =?us-ascii?Q?OdPfU3cm2PN73xyNm2rj1GX8tx3hJvfurVl2pWPlegEmAiHj9TgVHKExfXyL?=
 =?us-ascii?Q?pqmpUbz0cESRhmZgGa8lSDzMq2lSGMeEHESjjUiKF9VsrNeiAhLExVznPUuP?=
 =?us-ascii?Q?ND40F1g9MEYrqgrJVvddG7AmmGnyaYsnNLcNxjLEsPI88PJ2Hv9A3rS504Um?=
 =?us-ascii?Q?ulLDNVmOyVTBdMOMzn3U9CUbXOZNQB8rbb+EAD8vhxTsf2Gj15BtDlCfvlpV?=
 =?us-ascii?Q?741H3gro1nCVEQcK3/4JofAf+el5pIzd+fJ9Z8CqFgpNi0kky8xogDGdkY7z?=
 =?us-ascii?Q?/uiCjd5hCrwuUOVhmileEVxgFQrc4hnAIWQLKhd87O8o228gwA8eioDsekdl?=
 =?us-ascii?Q?oQdi4LB2y/45AAbQOeKwqxVWN3L1m9+ojLfsF9fzj3Rqn79ewMPWVf2qcJ2F?=
 =?us-ascii?Q?9kZZHmfzaKiVDQmHKXrsuzuZGjoE9ov/bXPf2roNQPdCr7VOYh2rCsr+XEda?=
 =?us-ascii?Q?2EPcCivloIj8TQXRouq5ta1Wf9HHbKG4+NsCB9HEoElSZxuf9shN2Mkq4H13?=
 =?us-ascii?Q?oog9eTLMmXnf2mjKhcbxjlzQS55JgFgaQ9yw512xTQS6kncGBvzMs8HLz9Vr?=
 =?us-ascii?Q?iL//nB5ejzQTTHESsx7rq6imqyvEoZ6lpbTrhMSPKz7gh6ohtpDURejcdBCP?=
 =?us-ascii?Q?gqurGI8qab7gPIj61at0xU7iiFy8FN0spvlXXB6kG0fOmAXh+Tsc1bm+PaRG?=
 =?us-ascii?Q?B88E9CLcqQFj+QbjMHjo1VwljJWN/ctGyd+wboeopcK3/PYeP1/PQxblPpm1?=
 =?us-ascii?Q?DZKJ31GDIiCPZhWOEdMQPtpXzF7rGeIJD2f0SmHAONhlRf86wOkrt1ANxHY6?=
 =?us-ascii?Q?mvrbJ6EfrBoiU5plt7nx6yhl+YjG+sC00/K/LF19wi+MCG4czHPYtoZaQcJ5?=
 =?us-ascii?Q?iZNGhFXw66eU3eesIwua7jxoW4yURl0r1vy+vnIrpy+02WHhyt/EovirW9B3?=
 =?us-ascii?Q?/pQ5fL+SuG06lptCk3zxdn0mKXbZrbDm8YtvfUKAUIibuOEUAg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hsQ7G2+FV5tK7fhKNLZ+WAN9WkwaN1mKWTL+8v1w6fJiO5HEzKOGeATSGNqZ?=
 =?us-ascii?Q?jQUBoLVgtazBnXQM5gHyrMbH/Kh9stsEegI3CY/OOiPcAelsg45RcRTZEuMb?=
 =?us-ascii?Q?MmiWmWNtmnDwoY+LidNTIQw9oRXqyZijnIGcLyDUX0PDogAwTymmFLOmSYqZ?=
 =?us-ascii?Q?bkrwZeXOY/C/IM32QLwdFwulT9hiahCwaSj2sHrgSS1jk5naNtcS6GSGjEBD?=
 =?us-ascii?Q?WiILqM/IdP2WB8E5Mio0LmlYdjCe53Zewrj8gjA/otKvj206d34l7NsUcE7y?=
 =?us-ascii?Q?d6oNev4CM/+cqMwfBSTr1xfax7MXwO15Af+Q0Okfpm2/AO0Pf5MA9TRES+/n?=
 =?us-ascii?Q?AfFLFrhGbEOR9osO5W/UZwkq1QVI7QW0XvEAk9oS7FwxFQg88zBgCx7DzIy4?=
 =?us-ascii?Q?IyKJCtX6Koh8ilhgeOOz0xrFsbvVh6u81w7xBg7c1ZRoV03eqXE6+Xql/S6s?=
 =?us-ascii?Q?EaF5get+EKvvJpWcICMjIuL14XRFS7MMP+1ES8O2rMs7X97NNekXisF8p9JC?=
 =?us-ascii?Q?4koFHxMhfRh697/Bjn2qXGBDLLnNZG9N2WY55aV/i12RJPT+vxQdkh0QQCwL?=
 =?us-ascii?Q?ju5+fiHTp76rP+7nxe7H6H53m2EMu1nOvMElQzNwQzOqDohbB3O3l75tGpC5?=
 =?us-ascii?Q?u8sLhZyN56tjQN/bUSgrcZT0gR/R3wWoOU7SHWsPQM5U9Y4xuEja6YtBUnIh?=
 =?us-ascii?Q?41YmmbEU52XEhDYVYuoRQH+O9PUr6GeI8wvvH6rCT4C+7VdUvNZGZmBILdb/?=
 =?us-ascii?Q?kFuUG926xustkuR4YsXch2Ghaay5S/wtmWU+Df3MNmxl+V8n5puPuK9Bo6Jx?=
 =?us-ascii?Q?YFFLXwHJi8LmDrlGvSzbNDoAORpZrZG8CJgOFUlky7qfgNrtNKn0/wZCmv1/?=
 =?us-ascii?Q?4Mtd7cpp0O4osHCzU2zcQjXV7xLF+8jQeT2+LABGloABA13XFhI9XoVZP00B?=
 =?us-ascii?Q?KZjXbYN5Oj0UVpfhAm+AIKMrok4ANIWD6BZhBgCNmYwfhP0U8uf4whzF2wVu?=
 =?us-ascii?Q?287ErpooX/05jqb4D06LKtLzdYRij7iPbLJ1L8yZNNyYyO9DoK7FWBA5pFg7?=
 =?us-ascii?Q?XngRii2R/JJwKDl8O8EI7r1fiR/maKnfRZsRjryQpvAhFPpVTGuXr9/Ev75h?=
 =?us-ascii?Q?sAbzJ3aieoH16n+Ov8gbgR9PHINX1eip9/FlO8BiN135ttgEt1GOQTZNnbq0?=
 =?us-ascii?Q?iOG8zi73u8l27srgz44ZWLtFLrdbI/KyreBkNJv3P24C7+PxALlXcsa2MEHd?=
 =?us-ascii?Q?U23S7ZqjLekZABRfj9pG7x60C7ikdoJzfDyCrWmv62sH3MFZfgQfglZaG87o?=
 =?us-ascii?Q?jXGgz6/Irr/6UPdaZa04gcu5Gr5JoUb9NPro50mCY6euuAUkiMDaC0jN2CEj?=
 =?us-ascii?Q?cjRlG0uhV6aegZrbYr66V7M0h7MnoLCtqMgn8zdqeZV6U1esJzZQPOeEmkb2?=
 =?us-ascii?Q?OuEeBXUhImx70yYn8a7tN7q5sFc+g5y+aym0Y9GrCasn6U/amgB7Wq4wrq0U?=
 =?us-ascii?Q?vS9cYaCg3iIhbQS/bhCz8CMwF/B9VbZFePsFmV3EUZEb3EzQvF/2hzu6r2rs?=
 =?us-ascii?Q?yx/oe21P7tUxH6akicWVbxVA6iRuJZdrgiaFH8z8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a6fc0e-aa08-4e01-1129-08dcd6dd8bc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2024 05:57:00.0366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kvdo4a4v4ePnhZt3sBMMFkicN6jAK/yCx6PiL34TT0eqLR54L0xOZq6Y9MY8nQg+0qJ8TRoH2Na7/N0YkJQmhrJk5aHyniMUnTEe8SycPzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6976
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Luca=
s
> De Marchi
> Sent: Tuesday, September 17, 2024 12:52 AM
> To: intel-xe@lists.freedesktop.org
> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; lkp <lkp@intel.com>
> Subject: [PATCH] drm/xe/rtp: Remove unneeded semicolon
>=20
> Fix coccicheck report with regard to unneeded semicolon. This is currentl=
y the
> only case according to
>=20
> 	make coccicheck \
> 		MODE=3Dreport \
> 		COCCI=3Dscripts/coccinelle/misc/semicolon.cocci \
> 		M=3Ddrivers/gpu/drm/xe
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409151152.pJ4ukp5k-
> lkp@intel.com/
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_rtp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c in=
dex
> 86c705d18c0d3..b13d4d62f0b1e 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -196,7 +196,7 @@ static void rtp_get_context(struct xe_rtp_process_ctx
> *ctx,
>  		*gt =3D (*hwe)->gt;
>  		*xe =3D gt_to_xe(*gt);
>  		break;
> -	};
> +	}

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>  }
>=20
>  /**
> --
> 2.43.0

