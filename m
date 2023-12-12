Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C74FC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 03:58:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F2610E0EF;
	Tue, 12 Dec 2023 03:58:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C9E10E0EF
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 03:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702353498; x=1733889498;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kbDBUXckorjF0iEVAP+TjgQK9Z61u4eNu6ocXzy0bVY=;
 b=R9Vi+zHH7+twnT54ViAebWMGo+Z4RaWqioAUy6oATy80speUELQw6Ciq
 i89tQCVCcLg422ykCPj4E40Ff0ycAzT293f8QmX9pSLc5hN3LC9abzn/I
 /LcNcxE0SzGlqbrh41hPzjTsHdNsWt6BqDNO5vYCLXCJYcsDdF6KsKGNX
 avaSHPMdtjfb4AAbJ4E0xsysox/CqIVo/IdpR7+DQJmw0mugChsXNlQ8x
 Hfxq91hHi2tJautpOOfBLF4dPOfwvyWnCd43g4pJTefuIQrMaWgNddEQI
 cnoi1Jv+X7FgEFaY/+QmBHMv0czJuK0ILCbaTUGIFZb4uEnzD9Q0ZRq0F A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="385162248"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="385162248"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 19:58:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="14795654"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 19:58:17 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 19:58:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 19:58:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 19:58:16 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 19:58:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOFyNOeJMJgzD3ShHsSh0MsYm2JOa2KMG12ttZ8lnPxepKpa97Yc122w1MaE54j8XpHtEUJvqqrqiSAM44MnK5GS7kPmvZQJsORayYe46VzQEpeyFBytD5uKUTra7UKSsrtkPPkqFzTw/bzH+uaiBFSAHmirITGfPTYLYn0M6Kc4Iwh5grYaip0KaKKaAerHQDgJgXFVmheh0DMwwY9/9hR9WUcmlIBqRlXjPTEzqoYDZhb0iNZO0TGPgEFNp1zONNrgzpHmXWDlkkPKHoQMGQlhhWj35eKLbkiBxUL3hfHJ67FnG5bI2zjV7kDK0XijSqG1oooQhFPIuXe7FLCF8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3n0868m9oF+DNUYCd9LLvlCXUZjVApHZ6i7dqWzVNk=;
 b=hNRavfHzjDvA/2eSGqoikfGLqfK+jbOJjxAxr2Bllvbdr/dCccu0E/OLq5J8kluZ3fAZk2oQAW7acENn2Tyu6uL3Fh5ik6DzJZgTcU4mH7z8x8LW6+0RqVG7pJi3fK3vzGtfymC/rU/EjPCXZ4Nr+teh12KvURRYXQaB+2jiDlFd8SNo86bHGIR+WXkq0fRUQPCJVAb/ihBiC/ZUrnXeA2CGX406Q9gqUMgWBRNuI6MsqOKqVmNH0f3z73yLWtAfZhU7A/KKn52R009o6xnPoFlKJ9HGe9BZb2e921srXdiilKWFAHrNqKAZTH764ktFV12W+9PIAO/ovdgMGnuHMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH7PR11MB6056.namprd11.prod.outlook.com (2603:10b6:510:1d4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 03:58:11 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1944:44bf:d17a:a508]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1944:44bf:d17a:a508%6]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 03:58:11 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Sundaresan, Sujaritha"
 <sujaritha.sundaresan@intel.com>
Subject: RE: [v3 0/2] Add memory sysfs directory and attributes
Thread-Topic: [v3 0/2] Add memory sysfs directory and attributes
Thread-Index: AQHaKR6MaBF6+Q9FbESXgcs/5vHZ4rCktAsAgABVqLA=
Date: Tue, 12 Dec 2023 03:58:11 +0000
Message-ID: <SJ1PR11MB6204AED00D5321727A38808A818EA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20231207151739.1241374-1-sujaritha.sundaresan@intel.com>
 <20231211224112.GA1327160@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20231211224112.GA1327160@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH7PR11MB6056:EE_
x-ms-office365-filtering-correlation-id: 8abff4b5-f0da-4b8d-409c-08dbfac68ef6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qgUbnMs/IG93ZRLXHKZ3ykducey1U2sABmsJjWtvL3MBl6V7ZMO3+rD4w/5J1mjorMtPGvxJN4k2Dt3ch+sl9D5j58h9EL0iF+aieGVwP0hIED8pxEerK59etf3KoLrtqQ5bcZlzPSCl63xBWPx4dmcrgjprMTOmHWs5qDbX2jLk3qVXabo7dCjo4c2NChrAp6VP546zp3p5JfTwFluQMQJiDwHD02ylRH8EkBDhJO9jEwnvqE7RFXV/7qIu9Tyk4u/35zRcyihSfHGdJgeghnUiXXT6aYPJZMyh4NYeM6H39xqqmLkJp26smz6lq5YYyd+86dkRCep5t4g5z6lF5VLQf8Snz9KzSU00NZm3cKUd6uVsEQffXTuJ4EkMjxf681ttD+Uo6UkQVpOSlFZw2ll1Hc+aLO1dbEy70N1I+2/sUkZcvvAX9u7saMSjSqSyuOORqjjUPb9YsKh9fcdyED+ZkauLl4Wzvo9dK1CfyVowZzwTi0NBu52ylHwFmhFsBY2k4ZE3HXj41JFu4zdmU2FoWSBWfsBYGbPDvmCysoTtupNFIx80Qf9u+2YFA7DmR8sJplC7Ae2e+g17NOhyLxk+227veBgIUB5xO4fxRTM/L9jj0Ln1Z+Ne32YVb5wm
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(136003)(396003)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(9686003)(52536014)(6506007)(5660300002)(33656002)(53546011)(64756008)(38070700009)(66946007)(66476007)(66446008)(66556008)(6636002)(76116006)(2906002)(83380400001)(82960400001)(86362001)(478600001)(41300700001)(7696005)(8936002)(4326008)(8676002)(55016003)(122000001)(110136005)(316002)(38100700002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WfoV7rBUOssfbpBE4hn9iKApvC0i/SPog4r9eH4gYJTt2Dh+XQYx56o8rFeu?=
 =?us-ascii?Q?iV2dV2OiuBOaRWnITCjAMvdWTvO5TIdLH11FbstV4hD8VmUWS7NA/TI58WeG?=
 =?us-ascii?Q?CwExKI8RRdUpbLHPb/tAgOfKIFp/eVZWIDePKbvemm9fgOCIrUqh2c0FdTzC?=
 =?us-ascii?Q?5O6NlpWrb7pcydZOdzrPbVr5FKpehkNhZpsd8baGfsuE4xDu3ZU9yPL/OLg0?=
 =?us-ascii?Q?0Q4E4wxOLOQb7WAjbACtEOoBkXA2O+QQh1YSIUR0k24S5PxUiaoTHCcdb/4g?=
 =?us-ascii?Q?CuPlrHGzlBICNLD0pwqkh9xCD2ChAnORkwfSWSg5ndxWnN7jT+5HqDCGjtIz?=
 =?us-ascii?Q?hC+c8lQgdqShepUWGtPWcUupT1hjLmuV/GSo3j6quNUxeJykpcr8o4eB6P0r?=
 =?us-ascii?Q?Go5py7UPTfwfo1lN7QOqlFkrISwystZQcmP3OA5ykojClf+GB3q8wYrMUJQv?=
 =?us-ascii?Q?HaSoLzxgH45aWwjy9+I1su/nsdt45WzUghFy54bPWj0ScI6hiv2mM23TjleC?=
 =?us-ascii?Q?1po4SOZErPGvz5CyllDI5BtZH8+0QwFFu9U7zeKY9q/J0QBQKhLUB0uckcMa?=
 =?us-ascii?Q?N/3jyXs3cN5HNudU4I/Q4Evbwg+z8RYNOzFSAC2jxC1I+5lqisGeD2aJFNwR?=
 =?us-ascii?Q?D3XEzpvmDHW5BHnWG1+Sq3H67WynwSkf10pAu58LNArZcG2799slWRCNiYDg?=
 =?us-ascii?Q?xf144U7s9nNJlnfuWbSoVcrbCzwLkcOE4BAfFjZbOoqyULUKRbC1tKvM3YoX?=
 =?us-ascii?Q?NvMyL6CWzjdjcM3YQBHwuxEIm94JKGnr5Z/Qwc/Uvl516KwtlrNCbY5wNfS/?=
 =?us-ascii?Q?+fE1wpW0IFONn1Q2cZsSBIgZUiNQDcfZV9mjSePQYBcIfgMwL7h4Z8qFd6MI?=
 =?us-ascii?Q?+CX0DVOgiNXFQSh18MFEEsnUTdaO9BpB3T5WbkETVGvFeX0+BIpumEWy4CnR?=
 =?us-ascii?Q?D2mYfx7gZYEr+mbMo6NEttcdkLI4Yz+JtxFNTDpYjqJY4wgMStnmEH35uAII?=
 =?us-ascii?Q?hOcyu5l0eM5TMSRFt0ErqjsB7QDfN3r1F+m660fjUlcIQemPBp1XD7exAK7a?=
 =?us-ascii?Q?07DfJsLKjH5c3PxO5otdMqN2bMmIyITfsb0P1N9u1FzChSAuQG0Rp1ZPkXvu?=
 =?us-ascii?Q?/I+X5B1WSGQl5N24y5KZrmBDr7mIfKXb+6i+owrADpM245HPB08DJZ6h4C6J?=
 =?us-ascii?Q?RHM4+PnRrxQlNSaf61NfDbm8cGq3AJfV8tDSs9EqUxZ2joGdDZ/tb98zkjrs?=
 =?us-ascii?Q?qygmB177beGvBAjk/5GSzzmXIQDRVMWDrD4iklNnPrxSzEKn/ZGYkPPFNgo9?=
 =?us-ascii?Q?shWkS10duk1qwjrQZyAuHoJ1xECpV8PTcfcfHehAQVC4YEZvDClLgNeTmnfI?=
 =?us-ascii?Q?vTlTFWvYV6MYThJEe8ABS533qEgVa/IIzC4PC23MCX/khMzc/O/s8rMq3PyF?=
 =?us-ascii?Q?hNv9WMSBbBpv1IW7mLRMozcvOHoSCP3hH+a/qphcjFr7LF0lcmenEOy230Iu?=
 =?us-ascii?Q?Pb+89ptGiu+xLr0pS4DNdZpY2DZ9wRwjXrKkSQ8hgpGftzMcrbOrDLb612/a?=
 =?us-ascii?Q?uNEzfviQPiycaaEpisGh+OF8YizGHLKgDwjvFHSFwKuBXDFiXPew0Fv/o594?=
 =?us-ascii?Q?AL7jKDyAIAIqF55gjc+xy+THPr9KyuanYzyukeBy/H+G?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8abff4b5-f0da-4b8d-409c-08dbfac68ef6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2023 03:58:11.1422 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z5d3UrUZNk+McDb8GMcLsyWJjhGoL6iVQYea0r7jto0WVHgoA+jdBaV1C45DQg4UldeC/wp7A77W1f4eYG2A0OiEXc3NbFSAQsUhZ7dVNoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6056
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt
> Roper
> Sent: Tuesday, December 12, 2023 4:11 AM
> To: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [v3 0/2] Add memory sysfs directory and attributes
>=20
> On Thu, Dec 07, 2023 at 08:47:37PM +0530, Sujaritha Sundaresan wrote:
> > Create another layer of sub directories to clean up memory/vram
> > related sysfs path. Additionally, introduce the vram frequency sysfs
> > under a the new path.
>=20
> What's the userspace consumer of this uAPI?  How will this wind up gettin=
g
> used in a real-world software stack?  Isn't stuff like the memory size al=
ready
> returned via the query interface?

/**
         * @actual_physical_size: Actual VRAM size
         *
         * Actual VRAM size including reserved portions
         * (e.g stolen mem)
         */
        resource_size_t actual_physical_size;>=20

It is actual physical size, including reserved portions, which query interf=
ace does not count. Level0 UMD is consumer. =20

Tejas
>=20
> Matt
>=20
> >
> > Sujaritha Sundaresan (2):
> >   drm/xe: Add a new memory directory under tile
> >   drm/xe: Add vram frequency sysfs attributes
> >
> >  drivers/gpu/drm/xe/xe_pcode_api.h  |   8 +++
> >  drivers/gpu/drm/xe/xe_tile_sysfs.c | 101
> > +++++++++++++++++++++++++++--
> >  2 files changed, 104 insertions(+), 5 deletions(-)
> >
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
