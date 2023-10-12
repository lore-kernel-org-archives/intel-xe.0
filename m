Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E47CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 10:32:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E5510E49E;
	Thu, 12 Oct 2023 10:32:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A51410E49E
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 10:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697106766; x=1728642766;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CFgmKAc5V+vYYQSirZavIY2qeY7LzvGRz3sue9wWPqI=;
 b=gQVEBSZ+r2jQC7DyU/FpvG0nKHaLC8LiZnEiRmIJdd3BIYziYbjsvqtL
 EmVysd5q8DEQc6oCisxoyvPATwJQUCttwnrUwwCXvqYID+H+LZcRXMKVD
 gQcrc5tW7zLKR66v7zTVhJpGkgGDaWnG+CD6Viu2VfVzr3XR/OJ/YA8JR
 15SQgAPdrZX4Q3piKg7PEbsvg4P0HK7hOzkw8g+u+uH72EPKb+rUyamYO
 sK50LxSqhf2chu2IOCro2ij6EnKOiU/oLbCJv66ETndE8ms3O5T9QJ/FT
 Hfi+xI3grRO97O8LuQWiExO3BkFNpvGPmSwNGM8GNYfJ+VsBXh+/T99a1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="388748188"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="388748188"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 03:32:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="789346271"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="789346271"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 03:32:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 03:32:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 03:32:45 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 03:32:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewYmu5V9y/Vlbs/u4qhePveTlDfra9JN1iOmZgplHrz8/DECwUuQzbWE1tuEoz8dVABPMI3QszNIczRQ2Po77SZ2IWitrCBA0A3AYQRWVOdP8o78z4YvjYJd+JaHXt++dQVMa/4nI7TUMLIFNMvSopPQ13Y0+dAVWn1CybRqygMcL6/BAo3GnLx2ZYKEgpQV1ebs9nqaa3QnOdFsaHZHaTXoxp0L/PRa2OhocUxXi0D63Bnh3mhNDhGFc0Wp3FApI0dyI41+aMKf1R6yfqtSd408/UveunJOHeSRQVKPPGj2REcHw9dVnx/BikUUgeM0J/8elpbSG4Re3777eTR/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ooBkhydYhFmGEJ5NY4fXcuulAlhk4nffo7dir/w1Nyk=;
 b=mgUV6OHfxnHUB55GHmoKR8SZ95jjj5EUgBxr/XCtz5gla/qcw3wN8DJRT0zFJSrxnKHFEbQM6FRYQfwMfwsdY0CKO+j1VyHi1cbuiUBGYp8T9MXk1OQLYgqCSLFrmiRL6EnaJjp41lFxO5Txk597svVwn55p/VJs+LQBgiBOcUbyhtzQ+cTkv1UStDd8ao7WeNq0pvdagaLN9XFjNPYleYeiz5yukREywdBJhmxchv/p02xnNrNeL7iQ01OrfVO68LqKQImvYKYaHA56IUeKUhoZrJ5D7Gt/vXkwbqFKhVBGcB5kbjR/U4kI+ukrG+mS2rKUJ+dj5GfnjGCPwL75Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Thu, 12 Oct
 2023 10:32:42 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::5103:18cd:56cd:ec75]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::5103:18cd:56cd:ec75%6]) with mapi id 15.20.6863.032; Thu, 12 Oct 2023
 10:32:42 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v4 1/3] fixup! FIXME: drm/i915: xe doesn't have gsc hdcp
 interface or something
Thread-Index: AQHZ/Pbc2MG9te1LXUmDdJuXnK6k4LBF9F0AgAAATzA=
Date: Thu, 12 Oct 2023 10:32:42 +0000
Message-ID: <SN7PR11MB6750B987DB4EF0AAAC5605EBE3D3A@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20231012102622.810974-1-suraj.kandpal@intel.com>
 <20231012102622.810974-2-suraj.kandpal@intel.com> <8734yg2kvj.fsf@intel.com>
In-Reply-To: <8734yg2kvj.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|SA3PR11MB8118:EE_
x-ms-office365-filtering-correlation-id: 395d3753-c4f3-4c4e-4a78-08dbcb0e9129
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tq+y8NgOk/9ukSbnHQ8iozQSbi22d5hR5/FK7pE6SjdHLih6m5zMMdO2ha/XVgg0CxPQvZaAMRYccTMx9F75jgOXPIlHu8p3NQ2M8XoFWFUQpb/5fRiX2wwqczlBVpnjbWnprt+IcHkXQRw5CZT1XU3Cw+62zEhYJi2Oxh6Lr6yWD8c47u8hmNpy5CTaVHY/5O2CKq55+WGOskhykm5wJBuZIFS95sgxyNT133ZGG+Bzf0p6jeXpFl2Qv8IP9srX7n9rbP7wLZD7w3sJvsiP+OnN6FBCX7Hw7yfqYBhKJlKMHJ163m3k4epnvc5ct00ZbAISLRFqjiRGaT/YFjCUKzoZv0OP8TKj01Q/DtJCJpb1WWq+XFejviJmqdLi24UaAPiBlzjyJxkxvyL7RIyfQ/FTm0TaZyt09HuCTTacDZKned2jG2azpGAtg5Z/hwUyWq4Fddgtz7QY9WTFrkTRfST+c8LRkUCIolnQrCFlWj0WEh04+APyHy3/aMPothLlDOHPRP7vSkqBVLwuIleepQBF7MUVyBEYrlzR4tdcZt2JG2Df/bUPoePrbmnw2dApyGWZJqxNpCCagd2LyLo97ckVYzKGNMA0Arm7LTh78lCf6BC9lu7jOmyOoekZ77oF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(39860400002)(396003)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(83380400001)(53546011)(7696005)(478600001)(9686003)(6506007)(38100700002)(64756008)(76116006)(316002)(71200400001)(26005)(66556008)(66446008)(66946007)(66476007)(110136005)(41300700001)(8676002)(52536014)(82960400001)(8936002)(4326008)(122000001)(5660300002)(55016003)(38070700005)(2906002)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EhT5z9BnCZq+VClbPamrwYwiOGSFaNn1eTIp7SKlj1om6ZjHbUH9pdVQNVU4?=
 =?us-ascii?Q?FdtKtcoNPB6O2HQiijnSouw2+bmCIA+53HjaqSdmwki33OipUhcEV11ahvUi?=
 =?us-ascii?Q?v9rNedKVsgBNLmXfl+Ee0RpWt6iUcBWQn21PVn1dYMfO8VqH4ebCcVPQxoRk?=
 =?us-ascii?Q?r4BtTALG5ZTTKWmqOWU4v2Yex3s0zjPp2gWldLlqk6PLWWIM0T+Dt+FMfR9z?=
 =?us-ascii?Q?SkEt5r1UR986dBcF6QpFXM0a58SEV7/FlhR9lfbPpibtfCUq7Wd9szlFnvea?=
 =?us-ascii?Q?nSZNRPpdz/HmH6mP16as8BXAVm6/uKppMbR92rt6C05Odlv3m8b0K4S7gg8R?=
 =?us-ascii?Q?7XIXh6QKpWLGFR8pmGAH6OwB/+EWYpoEY8EeszOoJ69wQin/jSvMypZX/IlV?=
 =?us-ascii?Q?eyFrVTTwUCbzmg8qXfYD20i8L9g2pMQ3ZyHeUFwPBewKA3Q8aI+D/xVktP6L?=
 =?us-ascii?Q?xeS7LZP9SOd8CtfoWhwdsbz5R7WUDI9ahHNtTVae6MApmGPfraBMuigqmD7D?=
 =?us-ascii?Q?FvnmFqjvnVG1rIVLugGzH2h9rWAvO20azjDptJ17DLJdK4rDWm16YQhjCyzm?=
 =?us-ascii?Q?n+alukYK1atJc2co8it7E2ag/lzmUEIguZZu6+cTTPgqQ1UEZ3AL3wazarjS?=
 =?us-ascii?Q?F3Jrx2h7gVvlrbACiesHvfWWX8uKc/kDRkcqr0XN/wVCHXiLgKn5GIxLP1k0?=
 =?us-ascii?Q?mX37V8L6YxoNJ/Ucw2R2uU6e/N9kgSFDoBKNEBIQo5sS/QeSBEj/do/8n2dH?=
 =?us-ascii?Q?cAs/rXiYshI0faUkCvRpkw87KXb8v7ifibA272Lp+YVt/NZ6iD9sHAjZ4prQ?=
 =?us-ascii?Q?os+2sVGd1Fsl4j44IvC2OkqpqX4bmEjz5pNZWIaDLjhEUnNtG4+xLDr6i2iJ?=
 =?us-ascii?Q?XQXutRpL2Ib1aGjt+aMPFVFVU2XzzmebJV30OiKqoMzT31Sow9JzkmQLBS1l?=
 =?us-ascii?Q?yU7yoCbwKR2J6Y8AJHFwE/NtSoW/EQXgPYcaujJ1m3enrUqnB2qnC6+AoPjE?=
 =?us-ascii?Q?XyoYBMO8JmMQfYwYIQOTRbxPKG0OftlJMYySRLpe7sD1BsYO8ffo5AbaYDkp?=
 =?us-ascii?Q?3ZsGsBQBzqThmkPxr9wPVzRNaEbng63RSFDY61PtwKoF5TdufxDoIcN6xCKL?=
 =?us-ascii?Q?kuwcVA6zZFvIBYAAtGlUlxxZprp5gAQnu+A/upro5ZoGHVftpDrDCehYG27I?=
 =?us-ascii?Q?Sx6117wEQSilCauGkujApWpGt1KOlhmq3AOnVElKYqhDDwH+yvF35oQ5k1zT?=
 =?us-ascii?Q?S0Dtc0OuvOpZqHm4iAlxl+uZ8bhC8U9w3icO2r+kNw8IDdPTpUgYZF7x+kR/?=
 =?us-ascii?Q?/ySjRA6PGsBjv1e+LhTx9XfEBZ2QvRdBagjaun1/ff3rs1sSZ64igwMGpWYi?=
 =?us-ascii?Q?6gOlsJY8qK8RMQsFkr4eOiavgARmCuxFFB0SPgbkcHeTEHX7QOxX0BwBM75V?=
 =?us-ascii?Q?Onaej2hZc4F4y5tsid5Y4xZCkZ4xPFp+Dsyr/b2QmTKht3xRdbBs9mItvdkP?=
 =?us-ascii?Q?VA01MSseOaJs/OPFt6/+aiU+7O9RFSsEbkFRHB9e6ZCKbJM4BdzI/A/G2t3A?=
 =?us-ascii?Q?kF034W7pSuKrui+DXuwyP3bfMiLt19dI6cHBOqhv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 395d3753-c4f3-4c4e-4a78-08dbcb0e9129
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 10:32:42.8312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fUbjuApupXQElC6xnNs4JMwgDY1kbVAbvc8cQPofdw0nwZExLnKx8YGTQHBdeiUB0JcuVDwgkvFfGPMfsrdkmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8118
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 1/3] fixup! FIXME: drm/i915: xe doesn't
 have gsc hdcp interface or something
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
> Sent: Thursday, October 12, 2023 4:01 PM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-xe@lists.freedesktop.=
org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: Re: [PATCH v4 1/3] fixup! FIXME: drm/i915: xe doesn't have gsc h=
dcp
> interface or something
>=20
> On Thu, 12 Oct 2023, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> > Remove stubs to clean up HDCP code
> >
> > --v3
> > -Should be a fixup patch [Jani]
>=20
> Did I really say that? If yes, I was wrong. Sorry, this should be a rever=
t of said
> commit.

Ohkay will change this into a revert patch

Regards,
Suraj Kandpal

>=20
> BR,
> Jani.
>=20
>=20
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_hdcp.c | 5 -----
> >  1 file changed, 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > index ce9993c64459..8cca4793cf92 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > @@ -173,7 +173,6 @@ bool intel_hdcp2_capable(struct intel_connector
> > *connector)
> >
> >  	/* If MTL+ make sure gsc is loaded and proxy is setup */
> >  	if (intel_hdcp_gsc_cs_required(i915)) { -#ifdef I915
> >  		struct intel_gt *gt =3D i915->media_gt;
> >  		struct intel_gsc_uc *gsc =3D gt ? &gt->uc.gsc : NULL;
> >
> > @@ -182,10 +181,6 @@ bool intel_hdcp2_capable(struct intel_connector
> *connector)
> >  				    "GSC components required for HDCP2.2 are
> not ready\n");
> >  			return false;
> >  		}
> > -#else
> > -		/* TODO */
> > -		return false;
> > -#endif
> >  	}
> >
> >  	/* MEI/GSC interface is solid depending on which is used */
>=20
> --
> Jani Nikula, Intel
