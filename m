Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA780C47071
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 18:00:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94AF310E297;
	Thu, 16 Nov 2023 18:00:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBBB10E2AE
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 18:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700157600; x=1731693600;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Mb7w4+UknnqhTWI30tkeWJANCZrrpHypMOdpY9kmY1E=;
 b=e4Q12MKI1p8kZ6nGboqOXfPHYqzpDojVg8MV62ki1Wy02A6+nXbLLAGu
 UifGg7K3NGZ4yCAg2wcGI2yBHovWcSZsxZfMkWUIDzAmT34aESUHiCFXD
 GU6hxWiJ7y6PADeexno95DqLew7RhVmOACn3fwnC9brTW6xhrc8l5DeYq
 k3sNOaLUUuFQESUA5OlvaLxYoLJDDLRZgIPPyTJQKBWDttcnQEi0Oe3e8
 KeyUPFYXnNr8ZOsbUgzxGJvbMtwK/tNfDRHeusV8P7nOAMUiQJB0qvoT7
 qAGeQZiC6gEI24wQpFpq/yNidEEzrnngwk1wupGcdZRJYseOaLmb5ABC0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="389998195"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="389998195"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 10:00:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="888992006"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="888992006"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 09:59:59 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 09:59:59 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 09:59:59 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 09:59:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mp703ER6sf3yDoloc3POgHhoEuuEzVw/KrRHmW79/6nxN0f6pdULRj4zYUC54XghgSpyyClClcnGCQr/+iRR0fVu9Ur+ADWfqpx6/RsHnYcKiEYVs/mP2O7JbwWb4w1NSQwBhup0Di+eSvvTFBU6Lf4q2tyUsH2yYcntCVqsyn70S1yl8JiRzYh66jI3hojKEyapdOli3fXYwhWzSlqmfVAsuarL3C6iqqgr7+OBR664qsU1wcP7QobmL4kYBQbDtvRJtxEHOaNRVLZtjgbSqf4KMKrOa200222PT+e8j4kzJw6x3JLKPXCE8YFZ5oDYxOB1KjJFcINTdKuQxl0IOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7RKVb8kpg8C4L0zapjgl5M2D15vuvWwobrF0YDTxQ0c=;
 b=ZsdSAimmhDm3y2ln5cZjCxcgZs2xmSvlLjahsb0Ek7tu9COZdWPUfz2tQjc2clFLA4D81fTTayfmdjbPp9EsJ4r18b1rWvhaOyQ2mACtdL80qiQtD+yMatexoliOIedOSEUvLiXkWDUhGPtyWCEjeabRxgZ6lx3FmvWzhVQAmUsXlKvwvWeuon1JPbTorlm+IEpnlHmqbb8uNgNxLgFa8rz9zs6if5F4ACIqU5oMP8PrdaWiwNSQOErFSA/b5L2gqyEt7/ovPSzJZyBvq/emoLkeXupYV0haca2fRWql9r1ilptIsds3CgUrZCtffktLTt5k0X2RNSEJqPtZHKIvGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH7PR11MB7662.namprd11.prod.outlook.com (2603:10b6:510:27d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Thu, 16 Nov
 2023 17:59:56 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::399c:3488:d511:adef]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::399c:3488:d511:adef%7]) with mapi id 15.20.7002.015; Thu, 16 Nov 2023
 17:59:56 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/2] drm/xe/ats-m: Expose uid for ATS-M via
 sysfs
Thread-Index: AQHaEkndZNZQuguXukGO93j6s7OngLBwdVCAgAAeMoCADLP/MA==
Date: Thu, 16 Nov 2023 17:59:56 +0000
Message-ID: <SJ1PR11MB62048CEAD7DA514798ACC56081B0A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20231108135418.3049168-1-tejas.upadhyay@intel.com>
 <20231108135418.3049168-2-tejas.upadhyay@intel.com>
 <a4701efa-eab1-4a65-94ce-2c08107db9d1@intel.com>
 <vnyr2nbirfddf5yh4q7lskbwrq4hk7v3ngosrazuwiioaufsml@qckippjlrtvb>
In-Reply-To: <vnyr2nbirfddf5yh4q7lskbwrq4hk7v3ngosrazuwiioaufsml@qckippjlrtvb>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: lucas.demarchi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH7PR11MB7662:EE_
x-ms-office365-filtering-correlation-id: 5289f64c-6242-4a0f-f465-08dbe6cdd787
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KWqnBQGEkZFw2DF/6ZLbAJb4GdBpuSrhP1ctIJGRMXUzapcKjEdN9AbNsssZS5DscXqLVDMuo0c+H2dB3N0q6qxyWfWgIwh+vdwBJqhpp+20x6KCoHn370dXJxh2BcG60vWYsuV9+ni+UyVBYAnLYrDd+uSDfSQhbFJm5QH+s9ghPNW93DcwbMD2t5fQorvTY0KGxJMnicb3GwjDF8/ep2obt2AgnHnr7oneZDe+aQxScGxVeRbDLiJnNxvm1Js5ockAxsHQqOBuqppmSk7kFPjtmD8mR038yv8+ZntHNgcG6kfPRlyy/kfXvLi7oHVcJ6RHHTQCxfCN2Fn+4r9RolhrFEwUsDRfmQLVgxnELilCIZT9+1bLoz/97Qf/YYsss4kyqBSFYVFQaIrhhz/9D7p4YVXylxHJg+bJ6Nw9O42WCMNRX09Rjkh1wMbQXroL9rVaC65uqz1gb04vFvnHa7XdZs1G/HlSENDZbCSG+24IdvhBR1oMpznRl9CYZ4NY4ckTbwkLp+WB4pBfgIO0trLCRSPt3Ve5jAlsM7qnv1CxEAiWM7hXyUl+sH/f4BV7pDln4KXr6/jceG6p+HzlDSehEzRSAr/VPSVETySo0efNwZe8Ghmsva6uhfPfV+UZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(136003)(39860400002)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(82960400001)(83380400001)(55016003)(6506007)(66476007)(8936002)(76116006)(64756008)(5660300002)(53546011)(478600001)(6636002)(110136005)(38070700009)(41300700001)(38100700002)(52536014)(33656002)(9686003)(4326008)(71200400001)(86362001)(8676002)(7696005)(316002)(2906002)(66556008)(66946007)(66446008)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sX+E0dzA175QiY9MFv9BpPK/S16mivaoNFN3CbogEVSRTieQsWYFw7/kqknE?=
 =?us-ascii?Q?DFoEnhrFTr0yGmI4vllV5WgncQ8K5n5imHQ6pPhUHHHDkN+nVRcY+A4XbZfS?=
 =?us-ascii?Q?yGTmJxU2i9NpaLu+G0vhWEV4IlG/7pT7Y9gG/FfOhRMSBxKcyl6CwBckE5ox?=
 =?us-ascii?Q?wC0HtWZ9TpjnBq8tOTmIIMqdhc1QHfWhiKyFk+/0CoG+MCUdfFtIqryboCPg?=
 =?us-ascii?Q?AGQL9Y2oUOA/Q7ukyuQ0srIT9wwAZfLj9Dq+r4CtOUZDSqahDPoTva4F2OBm?=
 =?us-ascii?Q?q4X0ikhQ/w1+WXVNHjd+AFLxtIST54XjwcZhhs0Bunbh0Sody9n4oZsD0nqq?=
 =?us-ascii?Q?jmBY099dLAM7lIpoBanu4Js89r2zx7vW/Xj+EDSuqA4fzhK0d8oFKQ8ZXAVw?=
 =?us-ascii?Q?3cs/Wx/Sj7wj9qwtMNVRd6vvAZNMQ9oWyx9cgVwDP7lL1W0dUrni67OK29DZ?=
 =?us-ascii?Q?z+LfeaS+Nex3Ymhu8AvECCizYKgEe3yMGrsFGIrER86z65ZjIbAn2c6ZDUWc?=
 =?us-ascii?Q?36P28A3pTAyT+yTEXnqWm0Oq+VQP14hvUlKyiPiELaFDbbQ7s8wVIzEOhXuS?=
 =?us-ascii?Q?2FDkCIMwdxqosxuH9Kuh7WYID1DqPnGSYa9pzECdyTjgvrrU/kZiV7vzHaQm?=
 =?us-ascii?Q?Y8OQL4LntgB3aHkFjKtQWEJdM3CewPmDWyytvN4+HDXFfthf7XFEn2bBCRJ9?=
 =?us-ascii?Q?HYvjbkdBHtDeLO6/pWo35Pwx1OVTyWRFbXCyO7o2afMU5DqkfW+m7LXkY4Zh?=
 =?us-ascii?Q?MOlFi/fciEsIg0EPRtx+PEH/Hj0PeZSvpXUAk3nVCJ3AOhN7Jhy7lgobG64Z?=
 =?us-ascii?Q?MkeIS/VTuMikAu3ork9zviY8a8VRDst53G+FWXdp5sYhvDwl4SrjLSAmsV5y?=
 =?us-ascii?Q?TbqvimFH2oiWTjfwMcIF7kTzCmtSi4efAkEydSrOn+X55Cnss2B/rTviUWkw?=
 =?us-ascii?Q?mqZ/KT662JEoMVeNT5h12KP2sUdtFvplPH9eSnS1BjNBkT9JZcthHKDv7bmu?=
 =?us-ascii?Q?3wEh34tfusF0g2EZlTnq1RiSQLAcbPZBsWm3lbuptd2n255MjgalZHr60RvO?=
 =?us-ascii?Q?bTlYNoHDExNq72EXdJlGZDgrZZ2UeCas9GKDXGtp4OTG7qnyV0vcsn0zO1mY?=
 =?us-ascii?Q?vi6cHRz+qgS0FYTV/JjxLC1MdAB42hEoyMlDiMY48sfozozQfdzkggvSMEov?=
 =?us-ascii?Q?vjVGg6NFT7wnVsu22Su3MQLIOy+vkw7/Q1zTwGVVy2azq1E4hrwtP+stE/u3?=
 =?us-ascii?Q?+SrpLik/foC4eGodbzgZg14c+FFXgaF89ORls5ddolIeojkibgHHnRzIokEH?=
 =?us-ascii?Q?n1oQmnLWITLKc1AlP2QAFlqEJCm6ETjl/3/RHTHAzncB+5bxO0c8ONVhjSCb?=
 =?us-ascii?Q?h+Dp5RCDI80UrpmU/+QDTrPAR7Oe9ns9lJEY87nBfUOkjK0eNMsdmD1dsYbk?=
 =?us-ascii?Q?8G7HYOG7KGh5xZeAW3GoAkqf83xqeeRu4/SznkCfgIX+MZrPSEhxQjOLB6eO?=
 =?us-ascii?Q?NBu8I3uOfFT9H2IbvFyyt3tX/8CvcqlTOf/3JPvsUPXMcr18oWGchtlHp0fj?=
 =?us-ascii?Q?i0O4vvnOOKDWEhC5FuY3pWiv9k4nuBJOliNb/gMPFQ2IMUZyh36CZwINYBaG?=
 =?us-ascii?Q?3IspUKCU7KMtJrBYI7Njeeuxu0b4jA5h1YRq60l3yqr5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5289f64c-6242-4a0f-f465-08dbe6cdd787
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 17:59:56.1498 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E9fdAMRjh5QpY1djF7qWoK56B6lNhvuc6pl6BCWjrQ4i8ScFEf0lqJPflmnHCo/LoRE8Ee9ZtAuYtwyqgBpNB4rMlA4Est5/kGta6Lw4838=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7662
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/ats-m: Expose uid for ATS-M via
 sysfs
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Wednesday, November 8, 2023 9:26 PM
> To: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/ats-m: Expose uid for ATS-M vi=
a
> sysfs
>=20
> On Wed, Nov 08, 2023 at 03:07:45PM +0100, Michal Wajdeczko wrote:
> >
> >
> >On 08.11.2023 14:54, Tejas Upadhyay wrote:
> >> This patch exports uid to the userspace via sysfs.
> >> For example, uid can be read by:
> >> cat /sys/class/drm/cardX/device/csc_unique_id
> >>
> >> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/regs/xe_regs.h    |  3 +++
> >>  drivers/gpu/drm/xe/xe_device.c       | 11 +++++++++++
> >>  drivers/gpu/drm/xe/xe_device_sysfs.c | 21 +++++++++++++++++++++
> >> drivers/gpu/drm/xe/xe_device_types.h |  4 ++++
> >>  drivers/gpu/drm/xe/xe_pci.c          |  3 +++
> >>  5 files changed, 42 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h
> >> b/drivers/gpu/drm/xe/regs/xe_regs.h
> >> index a646d13af03a..1b8de9b8daf1 100644
> >> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> >> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> >> @@ -70,6 +70,9 @@
> >>  #define XEHP_CLOCK_GATE_DIS			XE_REG(0x101014)
> >>  #define   SGSI_SIDECLK_DIS			REG_BIT(17)
> >>
> >> +#define DEVUID_LWORD				XE_REG(0x102008)
> >> +#define DEVUID_HWORD				XE_REG(0x10200C)
> >> +
> >>  #define GGC					XE_REG(0x108040)
> >>  #define   GMS_MASK				REG_GENMASK(15, 8)
> >>  #define   GGMS_MASK				REG_GENMASK(7, 6)
> >> diff --git a/drivers/gpu/drm/xe/xe_device.c
> >> b/drivers/gpu/drm/xe/xe_device.c index 515cdf599fab..266e0d5d7159
> >> 100644
> >> --- a/drivers/gpu/drm/xe/xe_device.c
> >> +++ b/drivers/gpu/drm/xe/xe_device.c
> >> @@ -344,6 +344,15 @@ static void xe_device_sanitize(struct drm_device
> *drm, void *arg)
> >>  		xe_gt_sanitize(gt);
> >>  }
> >>
> >> +static void xe_read_dev_uid(struct xe_device *xe) {
> >> +	if (xe->info.has_uid) {
> >> +		struct xe_gt *mmio =3D xe_root_mmio_gt(xe);
> >> +
> >> +		xe->info.uid  =3D xe_mmio_read64_2x32(mmio,
> DEVUID_LWORD);
> >> +	}
> >> +}
> >> +
> >>  int xe_device_probe(struct xe_device *xe)  {
> >>  	struct xe_tile *tile;
> >> @@ -368,6 +377,8 @@ int xe_device_probe(struct xe_device *xe)
> >>  	if (err)
> >>  		return err;
> >>
> >> +	xe_read_dev_uid(xe);
> >
> >as this function updates xe->info then maybe it should be a part of
> >xe_info_init() ?
>=20
> or not update info at all

We need mmio init before we access those regs, thus it needs to be in xe_de=
vice_probe() where mmio init is done.=20

@De Marchi, Lucas not update info at all? Do you mean read the reg everytim=
e sysfs asks? That would require GT to be awake everytime we need to read w=
hich does not look good.

Thanks,
Tejas
>=20
> >
> >> +
> >>  	err =3D drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
> >>  	if (err)
> >>  		return err;
> >> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
> >> b/drivers/gpu/drm/xe/xe_device_sysfs.c
> >> index 99113a5a2b84..66f69eada76f 100644
> >> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> >> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> >> @@ -65,11 +65,24 @@ vram_d3cold_threshold_store(struct device *dev,
> >> struct device_attribute *attr,
> >>
> >>  static DEVICE_ATTR_RW(vram_d3cold_threshold);
> >>
> >> +static ssize_t csc_unique_id_show(struct device *dev,
> >> +				  struct device_attribute *attr,
> >> +				  char *buf)
> >> +{
> >> +	struct pci_dev *pdev =3D to_pci_dev(dev);
> >> +	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> >> +
> >> +	return sysfs_emit(buf, "%llx\n", xe->info.uid);
> >
> >%#llx
> >
> >otherwise there will be no 0x prefix so could be treated as decimal
> >
> >> +}
> >> +
> >> +static DEVICE_ATTR_RO(csc_unique_id);
> >
> >what's "csc" ?
> >
> >in patch you use different names:
> > - csc_unique_id
> > - UID
> > - devuid
>=20
> Agreed. Besides that, the documentation and commit message need to
> answer the *why*, not only how.
>=20
> Why is this being exported, and what's userspace supposed to do with it.
> Btw, what's the accompanying userspace to use it.
>=20
> Why is this in sysfs rather than a query? Is this something to be used by=
 a
> sysadmin for something rather than the app using the device?
>=20
> Why is this special to ats-m? Bspec shows nothing for the register you ar=
e
> adding.
>=20
> Lucas De Marchi
>=20
> >
> >
> >> +
> >>  static void xe_device_sysfs_fini(struct drm_device *drm, void *arg)
> >> {
> >>  	struct xe_device *xe =3D arg;
> >>
> >>  	sysfs_remove_file(&xe->drm.dev->kobj,
> >> &dev_attr_vram_d3cold_threshold.attr);
> >> +	sysfs_remove_file(&xe->drm.dev->kobj,
> >> +&dev_attr_csc_unique_id.attr);
> >>  }
> >>
> >>  void xe_device_sysfs_init(struct xe_device *xe) @@ -83,6 +96,14 @@
> >> void xe_device_sysfs_init(struct xe_device *xe)
> >>  		return;
> >>  	}
> >>
> >> +	if (xe->info.has_uid) {
> >> +		ret =3D sysfs_create_file(&dev->kobj,
> &dev_attr_csc_unique_id.attr);
> >> +		if (ret) {
> >> +			drm_warn(&xe->drm, "UID sysfs setup failed\n");
> >
> >if you really want to print warn then maybe also include %pe to help
> >diagnose why it failed
> >
> >> +			return;
> >> +		}
> >> +	}
> >> +
> >>  	ret =3D drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini,
> xe);
> >>  	if (ret)
> >>  		drm_warn(&xe->drm, "Failed to add sysfs fini drm action\n");
> diff
> >> --git a/drivers/gpu/drm/xe/xe_device_types.h
> >> b/drivers/gpu/drm/xe/xe_device_types.h
> >> index 4119ef03fb7e..1cc8488f8c86 100644
> >> --- a/drivers/gpu/drm/xe/xe_device_types.h
> >> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> >> @@ -238,6 +238,8 @@ struct xe_device {
> >>  		u8 vm_max_level;
> >>  		/** @va_bits: Maximum bits of a virtual address */
> >>  		u8 va_bits;
> >> +		/** @uid: device uid, used for generating uuid */
> >> +		u64 uid;
> >>
> >>  		/** @is_dgfx: is discrete device */
> >>  		u8 is_dgfx:1;
> >> @@ -261,6 +263,8 @@ struct xe_device {
> >>  		u8 supports_mmio_ext:1;
> >>  		/** @has_heci_gscfi: device has heci gscfi */
> >>  		u8 has_heci_gscfi:1;
> >> +		/** @has_uid: device has uid, used for generating uuid */
> >> +		u8 has_uid:1;
> >
> >IMO introduction of has_uid capability flag should be done in separate
> >patch than sysfs and uid changes
> >
> >>
> >>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> >>  		struct {
> >> diff --git a/drivers/gpu/drm/xe/xe_pci.c
> >> b/drivers/gpu/drm/xe/xe_pci.c index 2fae45b9d88e..4d91ad049e59
> 100644
> >> --- a/drivers/gpu/drm/xe/xe_pci.c
> >> +++ b/drivers/gpu/drm/xe/xe_pci.c
> >> @@ -60,6 +60,7 @@ struct xe_device_desc {
> >>  	u8 has_heci_gscfi:1;
> >>
> >>  	u8 has_llc:1;
> >> +	u8 has_uid;
> >>  	u8 bypass_mtcfg:1;
> >>  	u8 supports_mmio_ext:1;
> >>  };
> >> @@ -298,6 +299,7 @@ static const struct xe_device_desc ats_m_desc =3D =
{
> >>
> >>  	DG2_FEATURES,
> >>  	.has_display =3D false,
> >> +	.has_uid =3D true,
> >>  };
> >>
> >>  static const struct xe_device_desc dg2_desc =3D { @@ -577,6 +579,7 @@
> >> static int xe_info_init(struct xe_device *xe,
> >>  	xe->info.graphics_name =3D graphics_desc->name;
> >>  	xe->info.media_name =3D media_desc ? media_desc->name : "none";
> >>  	xe->info.has_llc =3D desc->has_llc;
> >> +	xe->info.has_uid =3D desc->has_uid;
> >>  	xe->info.bypass_mtcfg =3D desc->bypass_mtcfg;
> >>  	xe->info.supports_mmio_ext =3D desc->supports_mmio_ext;
> >>  	xe->info.tile_mmio_ext_size =3D graphics_desc->tile_mmio_ext_size;
