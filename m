Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84251C71153
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 01:21:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4771210E4AA;
	Wed, 30 Aug 2023 01:21:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF63210E4AA
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 01:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693358463; x=1724894463;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mdHOYSxa9xsnXdPvYeeALLQxfjw78sG5ZUcjpZILdSg=;
 b=KJ/E8iaWzQpvElDSGRfhPTlIqPHdFxl0Wwch8BGlQDoDCLDVa3NOS1xZ
 D7TwJAOgoGuWHypgIZublMcOWH9KbpOjPLdv0QRSkX8AaIZzoHQuKbuPS
 yNiE/JJxfkKiHg/aEEGvNRT2STCuyxHTnMCSIvx5JLG4g27Jkp9o8t6vg
 I/iDDE0+QlZspB0Bd5TN9xoqlShDFAYM20ika/qaSiDYv8kyyC4Ui5HGD
 h+t0+qWk9rmr37yOBX02x6aGfjd6/E7hgSflHBlqQb7XdQ9u4SUGEd+GE
 49RTagApykFsPweZThgBXLukaA/y5GQfWRmdPX+r8s/HaiRlFR4ij/2FS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="378238427"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; d="scan'208";a="378238427"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 18:21:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="1069670669"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; d="scan'208";a="1069670669"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 29 Aug 2023 18:21:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 18:21:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 18:21:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 29 Aug 2023 18:21:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 29 Aug 2023 18:21:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVfzpDJdhwKlN21PgOINhtNeBgVd2Qly5GnpOcesdRx9hLsVwCt+3HNWmLj4m3xap9oy7/mnhjnWeSU9Qt5lFir7eqAjf62r5PvItz+KtziS2VyFG2nleIWuza206ceciPEoYmkb5+oM11jrCvgJD9q7bNopS4CZbcGOj3z56UDJDafPSK7diPxK8DAFzl4yfEaSQkviJ7R7XgemRdUMsdH6E6FgMVMdKNnBs09djeFDWr96PXRvVYSE8L/HNntXVm8CUiQq1aNbaCTyVmSrGJHsBRqTS6FYA+vrltwxnQrUXfPy2uGUA0PZdNOmTDrZrqH2WhTwBOAbUkYCOQpyUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dESaIEOa5y30rV4mfQGYzXkTnNmlEQ5Oi35F/WnzXMo=;
 b=k4XwHJPxbZzR1q0TLBXCB+0eB0AWD7851nGSL3/7Yr9bBmJVx7pJ0PnY+xBxOl6FIsU5qmeoj053BaAZFxeXKoZSISiGwC084nmpcsalXPJNQjzPaLR3kMvFbH/hiGWzcD/+zcL3rSqxkw2YqN6DN9ZcYsb/7E2O/gTP/L0n6gw0FMq+sNAwuVvbcq8gnPWniqLr4+DnpVXOwv67gaoBuktEJ8bNMo7kHd9Uj62L2jcYMgQKwi+ePLQ/QEBlXDi7lsHw51hLSuzxAxvaSY0c2sOrMU1SJ+qoHgycYdVa5hyFeGb693Q4Bg7sOQEwNzYI++WR8MyUhiDNxhmMDDPvOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11)
 by SJ2PR11MB7453.namprd11.prod.outlook.com (2603:10b6:a03:4cb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Wed, 30 Aug
 2023 01:20:47 +0000
Received: from PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::a135:2fd5:e14a:ae87]) by PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::a135:2fd5:e14a:ae87%7]) with mapi id 15.20.6745.015; Wed, 30 Aug 2023
 01:20:47 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [RFC 2/5] drm/xe: fix has_llc on rkl
Thread-Index: AQHZ2pYMnHFvFYRBqEm9a9eYgSQLjLACCn5g
Date: Wed, 30 Aug 2023 01:20:47 +0000
Message-ID: <PH0PR11MB5782BB33AB04451300D9DA9782E6A@PH0PR11MB5782.namprd11.prod.outlook.com>
References: <20230829162840.73444-7-matthew.auld@intel.com>
 <20230829162840.73444-9-matthew.auld@intel.com>
In-Reply-To: <20230829162840.73444-9-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5782:EE_|SJ2PR11MB7453:EE_
x-ms-office365-filtering-correlation-id: 1118557b-51b0-4692-0c9a-08dba8f75746
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AgPB2eKGH4kZFyCk9nmd02noCNtzyORQvcQNp4icOb8fAExqXxv0wcxC8FpOX6olo8uhvHbqCpoUWL36Xo8C5zUpBJwSb4jaWqQzlH3KumXp0a3i4jRq/MdSe5RZg5rO1U2yNZXI1aQ28kXiBIBnhXc0Sdd5QmC0UaAkR9aUOvWgbFnrwdlj2TnKXTc+pH1RBabEOp2tnjFwFrn5oA069V5r7iH65PG3/5zn7YpBqDKQXMCo7NNw0WlLEUD/f826qnqZQZRlineonBX2sg8jMxhOXppdwxHALytKTE3atCrf1r+LQfGMYlBG88xRIHVHxK7ieD7hHwaLwocHirq6mGmgrmgCAY5BmrqLOuhf4X2bdrT/ndaoXra2BYySFiD5zFnamDm0Bym7ykXl4zcYq+3/XGsMcb4xgJM8mGjYyXyUESNcqyigUvOKSmYP9efdAqcQLj4LP/cX/N4kvi97QwcmuraI70P8e2/ygbozKuWZ0NFpCrz0GPSSTnW1YoECBPGeLATxO0J9xQv2I94Eplw5so8uZWH/UZ0scyS50J0TG5uudK58X4CPeZxsfNG9aYFj5t/0i0mC+tBSZ82l2AGZek8QGzT1GSMwlJ0KUH19a4618dJNN8cPrz0aWty6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5782.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199024)(1800799009)(186009)(9686003)(6506007)(7696005)(71200400001)(53546011)(478600001)(83380400001)(107886003)(2906002)(26005)(66556008)(66476007)(316002)(41300700001)(64756008)(54906003)(66946007)(76116006)(5660300002)(66446008)(52536014)(110136005)(8936002)(4326008)(8676002)(33656002)(55016003)(86362001)(38070700005)(38100700002)(82960400001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9mr1pjMOOSbT8fDWELCRpyQ33cbFCoV1gTLaLL7XqdsNQXnD/nxVCeIV1gen?=
 =?us-ascii?Q?6Th8QxcvBt900gYpWLhe+OB0HbYJxSLMMY5fjSd84Pcz/HF0abj5pwKlbQr1?=
 =?us-ascii?Q?evZL+RXqHhfGBkNnOw0soj6vxN1hUa0J+GUngyWJKCmQWMD2eQEtAb0jmyvl?=
 =?us-ascii?Q?Ooa3I31nDFt8yZ+7e7mU+6gim+7k+ayJKWSh6KBWHUx4JDhkh6GWz8Eav3Hu?=
 =?us-ascii?Q?csMd9BL66CqiSI6mCXJq+92hmevlAqRlGiLtxUZv7V3aGmMf4mZVwxBna3Hp?=
 =?us-ascii?Q?ltCwT3dg3hnpe08VrpFgwxiDKKmgZrdDD6qvZZxe099DyUsX0OAmUhw89F0m?=
 =?us-ascii?Q?0e2nC2bawuu7sO70Bt3jyoH3tGMa8KH+fI2Perps+auPcKX5fXJBsdIrFHmA?=
 =?us-ascii?Q?jliwp74OCUjRsL9c21wUMVLvDsXJKybop5iB5IKSyxZ4bVEdtbkWvEI9ylPS?=
 =?us-ascii?Q?WrrNq26au9LvJqGTEY9/Yi08rewaESlb2eToaKda/c7/i2IFAnWyG4jlOl4H?=
 =?us-ascii?Q?FxOwj2X2UvPfHWwkcTNUZ74jwGzlReiLE3TFJI6ALH/bPmueyR1o5YWGV/DW?=
 =?us-ascii?Q?P7+4bwzzZJBKxuQs6HNOPbMuO+xfOVU9qoeuwGVAbzHQ3puyi2+Xw3wcCq42?=
 =?us-ascii?Q?Fldh/zJ/qGDP0V91JJtfc1ceouwpPXjkX/Ls4sQMyz6TvXep1YNACRxzoegK?=
 =?us-ascii?Q?bEYnRYdO06ADkvD+MA+PFM6cOEZqyJddkH3nA46rWmTM7fKF5Cslu2eD7eKs?=
 =?us-ascii?Q?62E//0amxEflg+gC6xb4DwFqsjnS6oysar+VJi+koLnUF54W1H3/P1/pjd9M?=
 =?us-ascii?Q?OMBIjAJIzxWnTkoSb1+UpvNEqLMvVM2glC9V1dQLFszFvs1qs8MdvLuZWOe7?=
 =?us-ascii?Q?3nG62ucq/7UM7q5iSgahts1KdYvLb4+TpfB/oVKEdZL4zjSXi0s8bpt40Qsr?=
 =?us-ascii?Q?e95DaS1q3YvkkDHDbNkBJ2Ohr2xNieA8nHfayJjVhgfuxuV/ZklJpb+ARYx4?=
 =?us-ascii?Q?pnVzUU3+sAupI2nrxdVIKpPKV8BfiTqks3wuXQLt0oo2+Q5aNjnZbPpwkO5a?=
 =?us-ascii?Q?xjD6S0EVxuX1+SXvipO2M/ZykolgCyyQ8jaFXptQFRIKoNOkYqIIMiM5eSKS?=
 =?us-ascii?Q?W/bJg8HcKhh9H7s2R9DjR/gT+q8hhv8WrWtKg4WkmU9c9sz2PYtMpwoSMd6M?=
 =?us-ascii?Q?eKzoQFAYSU6fbM65ey0YwcCAZ4+7uzPWRioN/H4fDkI5D1kSlgjXmXN5s7j4?=
 =?us-ascii?Q?G1LmbbMqKm0wKSyEJ5oOsmVfmrrpJwMsGbFktLA9LpY9kZdkokcZnPxZX1U0?=
 =?us-ascii?Q?MB25iOAAVmjEjvjx4b897hhinuVIfmCOnaSAi1lycY166IgXXwpPY1+0GeMe?=
 =?us-ascii?Q?PxzYFe1uqFr3LePHLzaCt25toiG+c0n4D9WaUZSyaNMvzSsapDi7tkvCFg8A?=
 =?us-ascii?Q?tL94iPjgECfg8DGZJLZ5FYSkjrGlfQNIraagCVA5Be1lvsUG/oUFj5yXL/fl?=
 =?us-ascii?Q?uKKm6MisF6+Igs1e3rVCOskKHK3LpgPXrTd12E8bFHRTyRbvOmyoz6wOkbyS?=
 =?us-ascii?Q?zgaqihz/UDrQp+QkEk4zHfG3g5CHtcu7zNcl5C0+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5782.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1118557b-51b0-4692-0c9a-08dba8f75746
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2023 01:20:47.7614 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J1mLduYOJsonP4Mcu+4iOqwiajZ0gtlGhWUysT68j5GasIMqFxxFFN+8VpJ7VskjSX62lI5tBuaKmYxnKC/0nFAixAiV1yK+qXrBaE9KfCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7453
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 2/5] drm/xe: fix has_llc on rkl
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Auld, Matthew <matthew.auld@intel.com>
> Sent: Tuesday, August 29, 2023 9:29 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Mishra, Pallavi <pallavi.mishra@intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: [RFC 2/5] drm/xe: fix has_llc on rkl
>=20
> Matches i915. Assumption going forward is that non-llc + igpu is only a t=
hing
> on MTL+ which should have explicit coherency pat_index settings for
> COH_NONE, 1WAY and 2WAY.
>=20
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Pallavi Mishra <pallavi.mishra@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c in=
dex
> 7fb00ea410a6..791107dec045 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -240,6 +240,7 @@ static const struct xe_device_desc rkl_desc =3D {
>  	.media =3D &media_xem,
>  	PLATFORM(XE_ROCKETLAKE),
>  	.has_display =3D true,
> +	.has_llc =3D true,
>  	.require_force_probe =3D true,
>  };
>=20

Reviewed-by: Pallavi Mishra <pallavi.mishra@intel.com>

> --
> 2.41.0

