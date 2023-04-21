Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C46C77B71
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 14:31:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA5F10EE26;
	Fri, 21 Apr 2023 14:31:07 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FBC10EE26
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 14:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682087464; x=1713623464;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8l/E+nkz2a7xxlmAOrQwB/vd9niaMdYS1SNpg3fExmM=;
 b=MfckfVKO3kTiIMSMeTh+4ZqFBufhzfUcmRgfbSkP3AYGr+cSzy3xhiw9
 ZXkK87MokvU0RMGt2dSlno0YJplXemF+UYpoKb9QItQ6GoYmltmkIWzxU
 oFaj2ezULijX/qnXfLaJQB6JmxUNq64a99Bw3Zm/9W0zVAcWJCn+T2W2U
 s4owWroC1n9/KOySEQ0SmdnLT64atof7aIei1UoTNrq5AOZcbTEKk5vUh
 lM0kqdWE6dqaIoTAM85FonpSscmbSgEJjAPqwGQIHVRIR1aeSOUyWD2Fu
 fgUMLwgglhLrILUePIuRoWmDeUpabGsutkMONi2OzkNnzLo0McFyqR3yI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="343490833"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="343490833"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 07:30:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="1021949114"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="1021949114"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 21 Apr 2023 07:30:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 07:30:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 21 Apr 2023 07:30:45 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 21 Apr 2023 07:30:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ds/03tY+atgQLY3+MDNX/UTgflk8E+dc18gPdR2O23CNDOB1Akf5ueDKD6p1huMF5x45yKYsKwfjatfICoUHaFxNSGmmkbxGLFYBAm/s+0Xx9qKBxBFO4BNlCnPGHVG2efbPuVXaGd660kINPIoOChbDLRXsByEHDdY9KCM0B3X3H83kSs5qL2FDFRwPy1DKHAJNBJoQw2QYNMMG1xk1ZGdRHqEUGfBLTrHF+4dxX+Lv2PcTsXXGPEw8FvXoW2QjAXdwGX2APYTmVHZlubeVndCSIIiFB0V3isAH6EKcb+biSCgsFAASVrFS79te/VY0WI4CWS7ugf0JLUwq+Cc1UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShDfm6GL1ZHQlAD5TOyvkBT2LUAf6rOJUAjElJ3b3Uk=;
 b=ladNcrj+9qdxZpLigr2CnnhNf/uKrijmEMEx2r2wJmwbkg6I2pMiji7OI06e5T7vDcBwDIuInAPoc2Y9fmP5x5VcRamhf28ztCrt2382elW9b7K6BmbDFI9hYip3PCx8y+pqsmFXfggZmc6DjW2HQeeCu3BZHfb8DtZQLGBKlUYWj6YqS3Chmqpj4H4XVQk5iDUxoSxPK+hRHhYMefqLwYR2dnLc/FBTG04bEW5E5KEoTFCx9xjxzPS2OTRMu8A47Znsc2BmgjDQbOuzkflDXyoRXDtuSnzA/5yKuOKqeM4hhYVu4t6cC1sIh1vSQnVGpp4x3E7eFE0t1LdvxcEPYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SA1PR11MB5898.namprd11.prod.outlook.com (2603:10b6:806:229::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 14:30:43 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02%6]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 14:30:43 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Thread-Topic: [Intel-xe] [PATCH i-g-t] test/xe_pm: Assert on unbounded VSP
Thread-Index: AQHZdDpBONjp46Lv7ECYUujFPu4QSK81yWcAgAAHUrA=
Date: Fri, 21 Apr 2023 14:30:42 +0000
Message-ID: <CY5PR11MB6211AB6A30A90B44C8F71AF595609@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230421101511.3532534-1-anshuman.gupta@intel.com>
 <ZEKVvAvVm8Z7uIBK@rdvivi-mobl4>
In-Reply-To: <ZEKVvAvVm8Z7uIBK@rdvivi-mobl4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|SA1PR11MB5898:EE_
x-ms-office365-filtering-correlation-id: 4887f1d5-aadc-40bf-9dd1-08db4274fce9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N+2MIDWIdZB/xILXMFa35WFBmxrz3alUJSdbMXiE+2HnXpQcSAXwZeWv6NbB7yKgYVabzDIrz7kMvFnTVD7N4aI2b28b8IzM3taRuXCGpzUNkMlIA60lxqCTn/IAknV6Sn5JTikKh42V/YHm4PydanYbzKDzeuQbjNKfhw9QEbG1TM2MPkJ228uFal6cMEvJi73M5vaaCQJjFgkMGhP6nELToF2dFw6l3ufJ54PjIIydqhtOpF9Op79//KNRMtyZryNVJ7ibA4QltZHlWpPr3vAdr/P0YTm8ad6E+RIqjSe7BXo5xLRDosYqo1HgaPQURoum1kV6bnFpxZn9MlMPORLtFRg+oREep1cSOoNdqWwe5MKxyiOT2hR5MiZT8OvHqiXaTOeE5F4NLA0wr8sj+U5+9olZsjhKMzRrP2Io5H4FHAzDrapBcOZqKBqBtsuFOw61+KXe7EzCKf5sLi5Znlll98yTGLxT6QIiWA3uuYNXlL+GgLDJhZF9oVE/6p6/4na0ILnZUGFoidVBzXqE3GtMac5ZSS4OdsifDfA76fmu5/4iuWdoWJCfEA+U4wJ62YEA+pqPMtMijK57DRc+DzzMc97O53JWrAV4IOeAAV28LnBKV9cfmauT7LOeONPx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199021)(53546011)(38070700005)(316002)(76116006)(64756008)(66946007)(66446008)(66476007)(66556008)(186003)(86362001)(478600001)(6916009)(4326008)(9686003)(107886003)(26005)(2906002)(6506007)(83380400001)(5660300002)(33656002)(52536014)(8936002)(7696005)(8676002)(71200400001)(38100700002)(54906003)(41300700001)(122000001)(55016003)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?U4dMuQE2B3Wtm9pR8PPlIFjHEW8+o+AhkLHRRqWyHEzzw0H0K6P+KEv3P7tY?=
 =?us-ascii?Q?/ZBwxJJJ+8aPkgcH0lGZ5kOlpLXD6kEVX4YeamCbz4rRjV+BgMV7Fq1a1tKy?=
 =?us-ascii?Q?vTXpwGo8uo7Jdp+jaN9XF2SoYR1K1LeB65C7cZOWv/GJFBrpdpx23zgCw6Z0?=
 =?us-ascii?Q?0ixSalj/sxRNr8CZbIRlaAo4/Yi4lioQpankAtvPBcdvqES0K6xK9vZXnuhu?=
 =?us-ascii?Q?qvI36mqMmUv+2aRHkh4dx2Z85oxUXPmYhFZYkNr6UUXCqzy7MrG/LTS2gMsS?=
 =?us-ascii?Q?PLydFKb+1wix8BEnmNwCXgREmAohJSRgOziW2uTdYF5nSG67ZjcrqKaz57OB?=
 =?us-ascii?Q?IegClmY9X8eAUanoyEU7lBMLb8+eJ4km8NeOa/tuD5LEd/xv1DzmKMZd2INV?=
 =?us-ascii?Q?yMSJq+1e12bK3oPeyYulwPpO3G/n5al4ranm0ZrX3h/uJlj601SHffdt7Qkt?=
 =?us-ascii?Q?oHPbvzBo+zumOby97qigZ4ye0DGHq0RRv/w1i46PHNfoZSVCIvptKipMEZcg?=
 =?us-ascii?Q?EXOO/xzKFd7J69oYUBv72HyqOeJI92sky55MD7dsUFRbZzi9CQcaiF0TbsGI?=
 =?us-ascii?Q?0lSLjnxk7fZhHqrIG5xBZeXnrzwGp4vvcnBN3QYvG6fo+YoSqsXiLPKme/nf?=
 =?us-ascii?Q?D2RUmt8Uhp60XRmljjLHCRibYwYcKTs+2qBDbQ0mx9X2M8awcJywmb1iGX1G?=
 =?us-ascii?Q?ox749M01Zla/tZD2dUq7SfBLDw4GqdRKmiW/kd33PlR+bA7WCYeFcf6ZaXaF?=
 =?us-ascii?Q?OWbfRMIG2fdDboZQ9ZBz6wcIYWR5zT1h/4mjzjZsBXLuBvan4h8xmDe0rFRb?=
 =?us-ascii?Q?OEiuPcrg2SwWe6B8G6IU4VHNB/CxeOS19ukwKG4JahM9Y2/IWGF7+qfHuOJu?=
 =?us-ascii?Q?OcM7rLqTXpZwU1LCqVtXm9/bu+WNKWko1dIUMkFbS6nnszGKdJ0noYP3PhD2?=
 =?us-ascii?Q?H7UIPRYmGnAoxZ2reBaoNnAGeWOTRXUOE3eHNWxCSte/ptLI/q5826OiwzRl?=
 =?us-ascii?Q?ixm5i122mVHz4nVKdDQ47X5SbIsLBqprU1A5meQ6VpEel3/UXbdCidZsL8YK?=
 =?us-ascii?Q?eEKR7924bhjrK/SjESTPioYVRnf9JkTxqP5+Bj/6hvQ3bFAoexIY+dOqU0lC?=
 =?us-ascii?Q?tKw58USbevcAHcLb/EBVve/jtx6Qs8y310NCdftIQ0mu+iPCnRcjL/MZ7gJW?=
 =?us-ascii?Q?5f2SpNfN801phAdxsGsoGhZ6vx6r11nP/c5o4nPsWVI3MAeexRXE0Da+c/lq?=
 =?us-ascii?Q?lM62bESTY/PNKDhjCx7pZ5GBvLDxK1FDCgtCoFK23kWAg2DRGIDFgspCmbs8?=
 =?us-ascii?Q?1pH+OndTQIsQEBX5YYq8q8EkcebgZqRlJecfTJQQLz7YT/fKyHiQ+zWs3xQQ?=
 =?us-ascii?Q?f0/wXL/3hIBu/EwocFmy55tRKSWQvjoqGAgLkqmNGiiCurcX3zx9Up2IjiwK?=
 =?us-ascii?Q?VngBGctRuX/GBUJwAhb6eQ3oqO1Is2jT0fp4nkaF0VMN1mW5P9Vrbd+/rsjI?=
 =?us-ascii?Q?UdcnI9nicdf4gCSwO3egimjhZWNsjrMGS2h9QKfpAKB7oz92X/SE/pKaCuMK?=
 =?us-ascii?Q?+wG4eHFYLv5jmbji6dBTd2kuMlQrjHmaGBGaPSJG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4887f1d5-aadc-40bf-9dd1-08db4274fce9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2023 14:30:42.9507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rq9GR/rXIUSZJwULlacfwxjT0SVQW+LpkTCvrEt6RtTZ2bM0C3UllxRaKTu1HH3wogTTx0P5w3btmEq0UfwPXE1Tx+/ZOpvooLU2cIPLi+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5898
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t] test/xe_pm: Assert on unbounded VSP
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
Cc: "Chehab, Mauro" <mauro.chehab@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
> Sent: Friday, April 21, 2023 7:25 PM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Chehab, Mauro
> <mauro.chehab@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: Re: [Intel-xe] [PATCH i-g-t] test/xe_pm: Assert on unbounded VSP
>=20
> On Fri, Apr 21, 2023 at 03:45:11PM +0530, Anshuman Gupta wrote:
> > Discrete GFX cards gfx may have multiple PCIe endpoints, they connects
> > to root port via pcie upstream switch port(USP) and virtual pcie
> > switch port(VSP), sometimes VSP pcie devices doesn't bind to pcieport
> > driver. Without pcieport driver pcie PM comes without any warranty and
> > with unbounded VSP runtime pm and system wide suspend/resume IGT
> test
> > cases may get pass as false positive.
>=20
> I'm not sure if I'm following here... you mean that in cases like this we=
 cannot
> suspend/resume at all? What are the false positive?
> I'm not following the whole scenario here...
Recently Linux core kernel revert the L1 substate save/restore feature from=
 Linux.
That eventually requires L1 substate to be  disable from BIOS, otherwise s2=
idle fails on a HOST with DG2 card=20
as DG2 was not able to exit form L1 substate. But due to the unbounded VSP =
our CI missed to report such issue.
As VSP were unbounded and DG2 Link was not transitioning to low power Link =
State and our tests were
passing instead of failing.=20

Br,
Anshuman Gupta.
>=20
> >
> > Therefore assert the xe_pm igt tests on unbounded VSP.
> >
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  tests/xe/xe_pm.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c index
> > 23b8246ed..78d9374cf 100644
> > --- a/tests/xe/xe_pm.c
> > +++ b/tests/xe/xe_pm.c
> > @@ -33,6 +33,7 @@
> >  typedef struct {
> >  	int fd_xe;
> >  	struct pci_device *pci_xe;
> > +	struct pci_device *pci_parent;
> >  	struct pci_device *pci_root;
> >  } device_t;
> >
> > @@ -344,6 +345,7 @@ NULL));
> >  igt_main
> >  {
> >  	struct drm_xe_engine_class_instance *hwe;
> > +	struct drm_xe_query_config *config;
> >  	device_t device;
> >  	char d3cold_allowed[2];
> >  	const struct s_state {
> > @@ -369,8 +371,15 @@ igt_main
> >  		device.fd_xe =3D drm_open_driver(DRIVER_XE);
> >  		device.pci_xe =3D igt_device_get_pci_device(device.fd_xe);
> >  		device.pci_root =3D
> igt_device_get_pci_root_port(device.fd_xe);
> > +		device.pci_parent =3D
> pci_device_get_parent_bridge(device.pci_xe);
> >
> > -		xe_device_get(device.fd_xe);
> > +		config =3D xe_device_get(device.fd_xe)->config;
> > +
> > +		if (config->info[XE_QUERY_CONFIG_FLAGS] &
> XE_QUERY_CONFIG_FLAGS_HAS_VRAM) {
> > +			igt_assert(device.pci_parent);
> > +
> 	igt_assert_f(!pci_device_has_kernel_driver(device.pci_parent),
> > +				     "pci bridge device does not bind with
> pcieport driver\n");
> > +		}
> >
> >  		/* Always perform initial once-basic exec checking for health
> */
> >  		xe_for_each_hw_engine(device.fd_xe, hwe)
> > --
> > 2.25.1
> >
