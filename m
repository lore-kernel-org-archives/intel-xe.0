Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972B6E95A91
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 08:53:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F55710E228;
	Mon,  9 Oct 2023 08:53:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA37810E0E1
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Oct 2023 08:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696841581; x=1728377581;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1Hzbeiq3TAUI0ugEJzBVwEVf+Y9HF54CAo6H0uPtwa8=;
 b=EE5N628R7fbhsQP7X9nPczt5ExGgz21rGZ14jvHqp6caJP41s/j7LB5s
 qELpuhBkAl8EWH3mrw7TxBSwL8CdzAvesFNZXuxnrp4SZa7N1DJe/1QHU
 MrysrzcBVOnyQrAYgeUy77C5pvKzxCYhdOC/sK0Zz6wlCkyRHTE3lnsEd
 9x+Kpw+WRaGPIOg14hLZC2zV9MRHpcFR6TNjm0Wz8Nwq/bujKgYt1+4sK
 JovYemUO1tDRTe2WGuEDNF8Rjf534F7RJosW0NN2gqGiF/1/hzQhcwrbc
 TApwolb9kIYzfBHYyZ+jBxAli/jyMa21Jg3IsXSEsAejYSTz1wX9P1Swf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="382975562"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; d="scan'208";a="382975562"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 01:53:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="756644805"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; d="scan'208";a="756644805"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2023 01:53:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 01:53:00 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 01:53:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 01:53:00 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 01:53:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNO+u9zyR+35Q1sOwn8BXJqxUev1iF4MJKVxhW8MhR38jpANYtt3wwsCFoNgCnOvVrfpC4qW6JnSRbqi8O7BQieehCSPumwlpJVg7fKi7rwZmZyDbQLa056RN+th0zGoAKnCxoI3oYG88tZSe27lxUZKUph/XIyL1AH8NAtE/cjHotMaxAydcHstjjBveHHgwCKF5dzKtZBU0+DCrnDshLGdFs23HHx/mJHvv3O5hdGRbkr4xaE86hR3pHj2o+5tfFvZOqsXkj30U75JgYfcDw+TsNqw6yK2gWHOYBG7xeS50DrtoNsXdSFuWyHtqjqXMsK9eb5HBZ7wMsSz+nWQoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtGQTwjnWOP+IPhRxPnrktZc1CsBwymytiXFtgR/Kpk=;
 b=HOlT+H5sRDjmDGvz3vXvrnd1/55qSGUTPDQJW/8agHQUlfthjOLWeIjNCxs3GkElFRHxgOS9LOnozSS6MUt+cCMrAItrziwpDLa9IRfKtEcfXcOjJmH84m3iU/Hdq+zLCpYtiGUhf054d4ycwaWMn3erSkJpvgeW4hDPqVcqj+FdkjlkTTKjVN/veq8ZgWmM19C1Po+0KD2FhEq20//zKAhzMhIofE+PNKnscJCgSR+PQG5wdVDqHNdIa13asiJJkVv+GOVcJVrCbTzmi1O/3+PMnB4pOEoWOo3i+Ywm8RPmJ2wMSGb0xpF+Iy15f4l76iWi3V/2KkOTJaehct7vDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 DM4PR11MB6118.namprd11.prod.outlook.com (2603:10b6:8:b2::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.43; Mon, 9 Oct 2023 08:52:58 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4%3]) with mapi id 15.20.6838.040; Mon, 9 Oct 2023
 08:52:58 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 1/3] fixup! FIXME: drm/i915: xe doesn't have gsc hdcp
 interface or something
Thread-Index: AQHZ7UEmjcJQw78o+UuduLWikiAc2bBBQREw
Date: Mon, 9 Oct 2023 08:52:58 +0000
Message-ID: <DM4PR11MB6360DB0FA9CEECBCD3FDC8F2F4CEA@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230922082909.334085-2-suraj.kandpal@intel.com>
 <20230922103759.346871-1-suraj.kandpal@intel.com>
In-Reply-To: <20230922103759.346871-1-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|DM4PR11MB6118:EE_
x-ms-office365-filtering-correlation-id: 1653bd2c-8300-4af8-165e-08dbc8a522c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YMwM3NKp+xY6DpKb6BBVtqh+1xpIMfVY+IbhQOf/JwN2lUAaXO91v51GD85D/UFoDbQk333x2uGni+FPgzuQK0aAKFs82XTQMszbWaFm/z7t4tGz5KDhtO7C7qdey98sHJrb5ZvvNFBlHhszpVVbNqTJIij4V/FH8yj+AZ/VdzA4COSMAOpEA5rbYMrwUFHMEBD7L19TWpZPnvSEeBWYSD6Sq2+IIrkowtZxXztXF1GTLh8BEfelA7SInjFiU1fjZiWzSdG48pzJ/TvaArJEdSNYQrTwBpeZ9OBsS+xkglexFumIW8sHlFwzbtEG04wEqXJn+oPqpg9DAJGOxJMw7VHUYPT3u/u+J0HUApYSlGE4QxgE+k4702vFsc/4dzhjyEhtcgZIBSs+Z3ScZMQrzA6/03sz36qro85T/Jk2W6XD5LIZpombror07sXlF6lvA0DMYBGpanp4Q41n5XsaeSSsWpuG+K/lllC9FT8FN/TJcKpoNK6E8JGCERNEllpN46B0Gz9KB0RaL6jYAlXuLD+05mdgGmo3F0r+Bv4BKCR3KCOe9i4+T/z6AXhcLbXo3VUKX4Du+VWute+MhIM7IhDC5ElaGCmGCU1/7Z/PEBsqHFA0Uw2fPq8565kf0Awf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(396003)(346002)(376002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(122000001)(38100700002)(38070700005)(82960400001)(86362001)(33656002)(55016003)(2906002)(9686003)(478600001)(41300700001)(52536014)(8936002)(5660300002)(8676002)(7696005)(71200400001)(53546011)(6506007)(83380400001)(66556008)(66476007)(316002)(64756008)(76116006)(66446008)(110136005)(66946007)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?q9Enfrrwj5nx8Qw9MRiYPCCOFsqnBnTbqebh5w3hbKHVEFPCdSBFEBOq4Ysb?=
 =?us-ascii?Q?9XShs83TKnf4WGpnBeFBu3veeUaFpDJPoRSxN/v8y5nm7GK6tMSWcgVdXmgf?=
 =?us-ascii?Q?hkcpTnSvPfiZjs9ZXwuXWkXvhvfxDH30L9zlK6OXaa6envK83zKyMIx1gCh+?=
 =?us-ascii?Q?N2k8feoF+vMgYhZXCwLdi28/IQqPSKsKJb1f2/Wbd0bgsFDgqGKqWT/dbL4V?=
 =?us-ascii?Q?ZG7DFrMrqOu2+sDV0fjMQOzYsl7qmOdHDt37QMtznXrTT04Al0E4zGNsr1rh?=
 =?us-ascii?Q?PvZo9Zru2eqGUyHE1vl4ZeelRnhgTdXpFoT+eeMapKXlTrfY29ZYcVxHPdoB?=
 =?us-ascii?Q?CZEHzU7KQfuiFPfMPlbQb+/gf3Np3FLtPakspSBRTGlammsTXXz0P2TIzDwm?=
 =?us-ascii?Q?kMGnkA63JBaSckxfZtFymhfFfpZSwAYcHooMZy/DKezX2Tl8yHPbtyOKGyAe?=
 =?us-ascii?Q?7how4jTsy7dt6tACZEdIF4B4XTsT0jr5AkAPMwLtU4lm5yCNVFEWwzdQiNLL?=
 =?us-ascii?Q?zKb+DrutTKcv1zn7ZqC/A6cYMDCZHc4T7TSccDsdhmA9l4CZUA9Bn3tceo88?=
 =?us-ascii?Q?HUttVne2qnkV2rvEj6YjiP9XWlh+9784bYh8CPZ1BRHzvxqy2OI6x3vDeLBY?=
 =?us-ascii?Q?OhjRTDanI9PZ4SDNC83nlwGk6yM8yglDDDy0ULrv/ORnCtoCpHPltkSUeMes?=
 =?us-ascii?Q?TbnTYW2xRWOOhFk933O4Q11t2m66NyIIhCnfv7at86koIgJQ88CBDQgkeynn?=
 =?us-ascii?Q?rzDC8/tnwWZ28lBgYvJHAmt1RPtw3SY7ioGkETQxmBJeIWekxaXQx3USBa5Y?=
 =?us-ascii?Q?yh2fqi/IdYC43Cnv7hRyysPdR9VmezUIxW+EA9YHhbRPD4pPgITGzFhrCd51?=
 =?us-ascii?Q?EQxWpQQeINoals5/Z7VUUv542yNPOyPnsIe6mZQhZY0VWgXUMpgfZ1tvcg3e?=
 =?us-ascii?Q?9RnrZCI6mztUb9HimchkbxzQJE1q7P+ld9bNqq8acA2mu22sSz9i+pEqKL0I?=
 =?us-ascii?Q?Sfi5ydiYwPhpcab0LRSAbMKQvHkVKf/nu3haiovmLxxGisWi7ftDkRwXHE0q?=
 =?us-ascii?Q?GG5192E02j/yWXnomd0/iepjetAMtcSKoFW7W5Zme4tyiN6lOzMpgITzpQ5x?=
 =?us-ascii?Q?4fzFNsxOS06vEc38Y9j+b2C0cJoA/8LiBEXcIeWxWxsFK5VvWKTFBFRQCNTj?=
 =?us-ascii?Q?oIiv93f1owVYaIkvD7zrXfNZoX7RvnsjT8lNirvjCQE8YklnRMBChxNcvR0e?=
 =?us-ascii?Q?E7wLUDhdYMPj+eyX2HdCvY7f/tcGwQ/blOLRGHdpCtA5yeZnMURn3mzung13?=
 =?us-ascii?Q?iNczSsHkLONnUAf9qVegPbe2Zq8ef4rrpTmkFPIwSqBgNipc75WRaH5wAJHE?=
 =?us-ascii?Q?Zeu4LouIe1nrXLCiuUq7lfxZM+hKVC7Fz4Dyx046Jgks1iASzxZ7kwIUnWRx?=
 =?us-ascii?Q?aPgDrua5uFvUwclUJV9MLjagHfcp/den8pekloh/p+zwvMWzdLcirVh3Bnw5?=
 =?us-ascii?Q?ZdbIkcq8LloON9ar0Kcut7PscNOjyk4ZzwZYAnAxUE+4s7HwePQ0Atflqs5v?=
 =?us-ascii?Q?HBuyFg0pkA5bVvj7xnEYiU1IYrtibgNf45JaXXVu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1653bd2c-8300-4af8-165e-08dbc8a522c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 08:52:58.1337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kublZhdei4x1vJxLfkqsk55aXvJ1GVQOHN5uammpyPTu52PtYgysctEavjYO+9B1MrahHr4R4/FENckhpj6U4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6118
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] fixup! FIXME: drm/i915: xe doesn't have
 gsc hdcp interface or something
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
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Friday, September 22, 2023 4:08 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH 1/3] fixup! FIXME: drm/i915: xe doesn't have gsc hdcp int=
erface
> or something
>=20
> Remove stubs to clean up HDCP code

You can mention which patch is being fixed here (one which introduced the c=
hange).
This can later be squashed together.

> --v3
> -Should be a fixup patch [Jani]
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index f617ccd206c8..a42549fa9691 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -174,7 +174,6 @@ bool intel_hdcp2_capable(struct intel_connector
> *connector)
>=20
>  	/* If MTL+ make sure gsc is loaded and proxy is setup */
>  	if (intel_hdcp_gsc_cs_required(i915)) { -#ifdef I915
>  		struct intel_gt *gt =3D i915->media_gt;
>  		struct intel_gsc_uc *gsc =3D gt ? &gt->uc.gsc : NULL;
>=20
> @@ -183,10 +182,6 @@ bool intel_hdcp2_capable(struct intel_connector
> *connector)
>  				    "GSC components required for HDCP2.2 are
> not ready\n");
>  			return false;
>  		}
> -#else
> -		/* TODO */
> -		return false;
> -#endif
>  	}
>=20
>  	/* MEI/GSC interface is solid depending on which is used */
> --
> 2.25.1

