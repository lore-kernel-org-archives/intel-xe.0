Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D22C624A4
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 03:25:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E98710E372;
	Tue,  1 Sep 2026 03:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bWcEOXhj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABFCC10E369;
 Tue,  1 Sep 2026 03:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788233119; x=1819769119;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K0sWlpubCqkt5pm6DAhKprLADzBvJ70AcRkb7IlgfjQ=;
 b=bWcEOXhjbaqGNmn7aGttdsdS+0NKbCkE4jF9P1IApBcF4rYf7uL7Q0Ui
 v5hUIe/t7i4T3bZi7sg8ljzqhKrCI21kZ8LtdkcE1VFb1QIIofsIB/Rlf
 ubYg17pYuURHnRPnR8V3p+Yo/aAS/Ke6ZF6c0AibHL4CZbDD/C1RabfzG
 ZYKaEhNKzL9uDkUFVk+042j5ngwtJo+3cdqK+zrseACMJU55JeVSQAmLR
 LCjhedvpsMHXIyZu9SjgDQVr66ZADtu13uG5HRBey9v2waiM/mE0Xw51R
 gLvFw+JJNA/CkB01HN+AA84zEqwwL/BdK+nJ5RbVm0K/PcVSQmCw6HQwe w==;
X-CSE-ConnectionGUID: es0UcovQQg66IPKbJPlEIQ==
X-CSE-MsgGUID: +GZC0vyoQoaPE4QD4MEzIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="92517357"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="92517357"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 20:25:18 -0700
X-CSE-ConnectionGUID: qBWkIFjsQUuOjnqbcfdIGA==
X-CSE-MsgGUID: dJSiZHa0RQuijum7VDbCoQ==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 20:25:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 20:25:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 20:25:17 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.36)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 20:25:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/2gIDcNy4Tosvzy/IEU9wzZ4JAgkhjZcq6FbmuQ0BSp+QN4SY7xzEPqsq83Vm1FGbD+EaBWB6FwitoFEck8J0ALxoPvYOXWXyX9PS49qpquv5mjUxEMgf3w/UnN1LoxbhBzkD9or9c0L2yqv48vFumT2oMTISxw4DNEte99D3YXauMPkvlR52j17rNTYI6HuMJ1Bn6TJaZe79/XV8MFCMd+DhpL+SejeJ1rYw1kCYByrLkXm2B2mQnSYzVD2qxS6ydwjRZVn/pFoXnmom1GzVUOyB1B2PYxQ9PqPu/rmliIPTsbLlccaDqq4vlYRfQ9xpSb6OVjrCwpyRfhcyL+lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJVoHkV7TBglAVZqekYgePuPzwxX7ydmfyImW3euTWs=;
 b=yxfVvR99GEyq6WgEsntBZ3w4Z14F1s3E9WTHVWxa58vSfOUuP5miafblwhiVeF7irymTKfuPMo7X+iu8l6PVRR2vQLbjzWD3cY5vj4QtBazZyvUzauIW8X+jhU/3ofHHBvhYpMcJltNYgZj+ldFCe/CEzVaeZuHu7ObHFKSWzvAp1ErCZmtT3NQdzkls2JfodDBJ1eSJqIQQgH7Q0G8T47yxTo6/e+CNV9du5fURw3aNjWru9gi8MTY8MuQrTJ3B7aqJspzvTLr5VwA0w6p3ppNh5uktGseIvWjMYjQD1/zmRI/k6xBCk7dnDm0ZGXWM/OQyS+ywHbi168Mm4+pvgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by CH3PR11MB7676.namprd11.prod.outlook.com
 (2603:10b6:610:127::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 03:25:14 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 03:25:13 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Murthy, 
 Arun R" <arun.r.murthy@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 07/12] drm/i915/nvl: Add register definitions for common
 SDP Transmission Line
Thread-Topic: [PATCH 07/12] drm/i915/nvl: Add register definitions for common
 SDP Transmission Line
Thread-Index: AQHczU5/jM/H/+eX6Uej1yXKNUVqk7a56CeQ
Date: Tue, 1 Sep 2026 03:25:13 +0000
Message-ID: <DS4PPFE901A304FB849FC548BEEA71825C0E3A82@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260416024504.1925195-1-ankit.k.nautiyal@intel.com>
 <20260416024504.1925195-8-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260416024504.1925195-8-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|CH3PR11MB7676:EE_
x-ms-office365-filtering-correlation-id: d4407bbf-cc07-4066-8632-08df07d8a2fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|38070700021|10067099003|11063799006|4143699003;
x-microsoft-antispam-message-info: ZKsneE+RWlRDEQY4KHnHtK5K8YbPhZXS4Rup38bkiEcXITQfLDKs61ycxdakuGQcn8RMjHuXUVPj1ZoOiyi+ns6JiGVgNj4IcJeAAfGvma6D+1lCb9yoD5amXK/NC7k3I2k3qkX/y92+8/3R6KafVu7tWe7GhV/vwOIa2Y8dpvwBqJ1uE2rZRR794gYRYeFOuXlg4XNWFd5mD9QTgxUDYk0B2Chyhhu44IQozBpUjcPSqgJuTP+1Gn6NpIIb0Qd8lHR+jc97o93Ahi7ag37+66MCSSBBktMXEyJMNdjGf+jf50YRGxzVfAWfiSwMclQX9hYnx0iQ75Z4ELIA+VScCCencZD8n034B5KpvE6fgglk2t19eUJS+s2xdl+O3GQtVVKVVwwGj6C4CrjAFbvyp0JsWKVj2z2jzx3MZc8CIrwr2XldPk+rtK3jem62nS1HO0i846JSOqDB0qT0JLE9l3Zj35JpluOV+gIJNs4fpG69mN/6Hc3Ljmdcr65gdWFBCg8hPvcsagKyjbuDWi5jmXOibl6fp5hwCedJUttfFTTiySClEeKIWC7oOWZCaQjo3b2HIkX9PSOcGwoWpSuOEfESTRAjF/oQEqmh1e46d5R+qfhdEpT28Ar/Fqlu4N2+rWF6BDhxJRI79oHZ0Zmul9WKbnH399+dAq+AeLhupsBuHnPvFZX6ODydHTDsRFlJ6FvsLaNpQvIrp5unne/eb9HxgfQYYAi7lAJhTjMc2js=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(38070700021)(10067099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+frG7kYMS10/DPLIwVBT8EleFlJdozIqpHZlDvBlJUkK7EvFl7XWLuDcAuSk?=
 =?us-ascii?Q?2Nqnm9OIZPEql7hzITp+RVOjtdWrPsgq4UX1VhoLQb2oNK6oQCz+GqTIEeBo?=
 =?us-ascii?Q?0NHovzXe4Y4TPglFGFCe//Lo2DWwiXLFo40z6VKOhfq9OfGj9/QknD0DlS01?=
 =?us-ascii?Q?1YhU0uTggYqAW60ueIiht5oUbeJH0E6X7TQF8y+gwcaNp0WmjMrvlpDQLD6c?=
 =?us-ascii?Q?O+38LLfKpkRO2bjOcP0KVXS1uQnn+Ph27CNlorCk0nHcuyQZs/LMr6TGlhrw?=
 =?us-ascii?Q?vtLw0mf8V3Umpm+8Ky7DIGntjwygHvZrgELCvA8B5BsOApGXCaU1Z+61STs3?=
 =?us-ascii?Q?1Acaumv5IUqyGmO0zrrwADn5DNKNXvS54qv8IkD1Ttnjw1wm5QQDTkSz984+?=
 =?us-ascii?Q?eslVYG3IL91bKZWm2LkwAihMOJMiTYHImjLzzNX8AuT/3eqq9oBFCKBuImB6?=
 =?us-ascii?Q?IVr/H1OdBuNTeALmn296TazxWJE/dz+F8wowOuh5yJMOdpigAeyyRWfBiPLR?=
 =?us-ascii?Q?gcRZgHQ8JAbcOUhxdy6kfyzi/Bxq0mphfucxBBpU0bz9Yizub9DlCsDNryq0?=
 =?us-ascii?Q?GInE0gvA90vIEtOjfqknWngTjnc6LjkA9jjM09MpQC8WfE5ArNAnKQluA2Vo?=
 =?us-ascii?Q?LGDx2t9/PGSKoQIZkID79n4+edYGTZUVmRsN+KLn5SAuUvFurU+zs9/ULlgK?=
 =?us-ascii?Q?pIf2uwW9+r5GGYlCgWgbg5zKrRafx6Mns3udIO5EOxQequrZRv5+UKuMBOeB?=
 =?us-ascii?Q?2KQMFTSGMzw1Gz6pqXQTu8G9khzGoaT7DlW0uY+NAlNxsdxsZtIwevgsmG2w?=
 =?us-ascii?Q?aicAbK7J/2XRZmWHZX6CgrJUA9eHQ4rnhyb0ezZ9c5RtTDMx84Dcglx34jdw?=
 =?us-ascii?Q?cX+J1vaG/0T4yRghC4MDQ2m+Efas5y1gk7qfhhFMUTgUtyx3GB2Bd4nMf859?=
 =?us-ascii?Q?jhi4CbN2YSoX4iEOXNziYS4u04whufuxfD0OpOmfKlxic8gBUXKBI3QZJ/TI?=
 =?us-ascii?Q?Ytymw7RJrkYThNWKGxVP+gpGbXJhTqiqXM63rZT7RooAGuyoDoYHpWa0po7F?=
 =?us-ascii?Q?0jsIace1Qiv+kZBVaXGUUWf9PWUDcRjYPq7P+XL5zqwpzmAdB9N57DXOgjwX?=
 =?us-ascii?Q?9GnwDPJRozJ2pf4dWaP3gudXRWui0oa/hK3emtk6y9LwXoh4zvHZDDh4NWO8?=
 =?us-ascii?Q?AiR8prj+QmXrUM9E16NgX7MvJCU9gWOZdXv/riBHye3lZNwEPKKswKxjYFMz?=
 =?us-ascii?Q?x4xx9zPOnSb6EqOiaVleo4DQISliLY6XH2EJukrpipwE/iqk18lLDjttOtkQ?=
 =?us-ascii?Q?EyJHX+tKgcFpebCNXR/If39WL8s/vbQzU7FbjNyyB9L7BDzPqvqttD6MSwne?=
 =?us-ascii?Q?a2jWswWAG5oLGL8qx2p1rp8KeReR8LhX9WJ1O+7QlE6WTi7sfFOpWOt7KYdt?=
 =?us-ascii?Q?2hzkTQVDcDp3eGgTsOlHYibV8VT4VN/WHSAj6VMCi9c5Svy+cBetEqG68S7M?=
 =?us-ascii?Q?p5l8XqHmNOlfkne0bWJ9bLmfMq/q+vAXHPiNPJdnLRQtlu3ZwSJR8huIXbKW?=
 =?us-ascii?Q?hLTNbgjqoQVNWuLA/UEUABkyV2SfeJewLsBkC7UhoJVhU7lohEDNyjtNWxod?=
 =?us-ascii?Q?YV2L9oI7rWDfr+In3ON9jkOi/GqUZjglmFHKzqQSLyVci9tDldnnlnn+uZsf?=
 =?us-ascii?Q?wjDj2S2EVihNTjpNAq+Wtj+ieMrTU3ApuyM7xEioXLdQirkcdX2Nho9fS8E2?=
 =?us-ascii?Q?scg5D72gLw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: X6etOWMhMA4y4cSr3POtqc3MLVyqhyqCGANTGn2LFL7qUkFdtdSI2RoeY98YkvrM9SSgN7gs2UGkSFMWU2VMRLiXGjEyL/qaUdJyJwxe0iZw37sb5BtLhxSR1xougcSpPkaISzxVibRaI6p0hnEPas6IOU0M0f5SSzlBAJ02nPHCme6Bg9MTpUW5Vs/yzk0WgO/fAlupKYelnXbNt686jfr5zUpjcD/n9wqSZQ0R4Puwmsyh4uu1hFpmeaB4st/c9pJMFH+kVgxbM+SXvgG0BrPdbsk46uIDHRSXinAn4Z+pkOimG5e6HcyhtFxIkILyRyQHaAemd2NLrFXxbyGL8w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4407bbf-cc07-4066-8632-08df07d8a2fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 03:25:13.8159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FqU+CLmBPyPNLcIlEjG9tq8nPxBl7nOuvKnDNslQfGbFGGGddKVQHIArpEJw3PomLJXnEEx0rU6h5S2d6cHn+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7676
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

> Subject: [PATCH 07/12] drm/i915/nvl: Add register definitions for common =
SDP
> Transmission Line

Maybe drm/i915/dip:

Otherwise LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

>=20
> From: Arun R Murthy <arun.r.murthy@intel.com>
>=20
> Add registers definitions for common SDP transmission line CMN_SDP_TL and
> CMN_SDP_TL_STGR_CTL.
>=20
> v2: Move all registers to intel_dip_regs.h (Ankit)
>=20
> Bspec: 74384
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dip_regs.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dip_regs.h
> b/drivers/gpu/drm/i915/display/intel_dip_regs.h
> index 85dcbf42e77d..7e69c5cf63da 100644
> --- a/drivers/gpu/drm/i915/display/intel_dip_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_dip_regs.h
> @@ -14,4 +14,23 @@
>  #define   EMP_AS_SDP_DB_TL_MASK			REG_GENMASK(12, 0)
>  #define   EMP_AS_SDP_DB_TL(db_transmit_line)
> 	REG_FIELD_PREP(EMP_AS_SDP_DB_TL_MASK, (db_transmit_line))
>=20
> +/* COMMON SDP TRANSMISSION LINE */
> +#define _CMN_SDP_TL_A			0x6020c
> +#define CMN_SDP_TL(display, trans)	_MMIO_TRANS2(display, (trans),
> _CMN_SDP_TL_A)
> +#define  TRANSMISSION_LINE_ENABLE	REG_BIT(31)
> +#define  BASE_TRANSMISSION_LINE_MASK	REG_GENMASK(12, 0)
> +#define  BASE_TRANSMISSION_LINE(x)
> 	REG_FIELD_PREP(BASE_TRANSMISSION_LINE_MASK, x)
> +
> +#define _CMN_SDP_TL_STGR_CTL_A			0x60214
> +#define CMN_SDP_TL_STGR_CTL(display, trans)	_MMIO_TRANS2(display,
> (trans), _CMN_SDP_TL_STGR_CTL_A)
> +#define  VSC_EXT_STAGGER_MASK			REG_GENMASK(11, 8)
> +#define  VSC_EXT_STAGGER(x)
> 	REG_FIELD_PREP(VSC_EXT_STAGGER_MASK, x)
> +#define  VSC_EXT_STAGGER_DEFAULT		0x2
> +#define  PPS_STAGGER_MASK			REG_GENMASK(7, 4)
> +#define  PPS_STAGGER(x)
> 	REG_FIELD_PREP(PPS_STAGGER_MASK, x)
> +#define  PPS_STAGGER_DEFAULT			0x1
> +#define  GMP_STAGGER_MASK			REG_GENMASK(3, 0)
> +#define  GMP_STAGGER(x)
> 	REG_FIELD_PREP(GMP_STAGGER_MASK, x)
> +#define  GMP_STAGGER_DEFAULT			0x0
> +
>  #endif /* __INTEL_DIP_REGS_H__ */
> --
> 2.45.2

