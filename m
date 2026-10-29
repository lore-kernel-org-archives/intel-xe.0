Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6043606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 00:38:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5AB10E15E;
	Thu, 29 Oct 2026 00:38:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D23A10E15E
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 00:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793234323; x=1824770323;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=BufPFS85a44Xntj3P6mQEAZa/Cz6odu0TSc0VLRPcXo=;
 b=JTeysgsVVPzApzRWgOdkU2nhN5LZxvxboM+qRgcljbARsu1zFczfW99l
 aDz4DSE2DeVGy8MWHT+c3je0GsBIqXLyNJelSpJgH2j1fBmUmyFvzdyCk
 cc4wdE5jVJlknFDL+2ONvyqRXPeuz3SM6kW4JDp9KhC4vUZv8S1O3hHn6
 p+XpqJOpdTCNvcvGfXlG11I2ih0oV/Sm504XQUF6fTH9BWpuZxibNaKmw
 pXMhifSX5sDsjykBiZqoayw6yEt5TZkcSRBSOso8IffS5FPfOHaadqWjj
 DeNWNRgYJfEmvg/y+NK60/H6ODuLWxDne491GPClxTkFHBkJjRwQC5mmF Q==;
X-CSE-ConnectionGUID: xKjOFrBuTNuVTwA7K7e5gQ==
X-CSE-MsgGUID: MMjUILLmT5aml/SJNSr1BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1872139"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1872139"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 17:38:42 -0700
X-CSE-ConnectionGUID: qmA3LBXiStW7fclA+2cljg==
X-CSE-MsgGUID: Z5tF4lKzSeei8A0HzewU1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5330772"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 17:38:43 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 17:38:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 17:38:41 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 17:38:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QF1TgZytdPHdbPlFMzAzujie9Lmh42WGb6nFBvWfkTThQiE6T4KQmW/d9Xb5/WBQtVUh+bbd74/kZSaYX4bDF8KUEHUlkPmwR6bI4Wf9WKAUaC+IMSCZMJk9xpfI0nt3afZWZoBtlsk5uroA8+DYEcbCTEw+nc+7aJOVfoKpPA54iIa//LskZnWLvrSJO+p40SL/AZxkIC7HOfaNQLZWlZYwOQOO0r6zuGwEubaO5yugeYwc7eEvYozP8LG2akRKIH2dV99FwoAEsRgp2xtDR7HsSgRoBjSSqRaeWIpsWRwP+MaUsD024whTEY9PdRTaRPy5PpR2gor1ppXeV7DBbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9F/CV/YjoOKvcVwxBNXsnMDPJ/O6W1wULZCmQN3qQoY=;
 b=SIwWUZTusG0fdB5KVLGco/8ACARZ8JCCf/JpniVRZDo2wR6CJlyiDRT41p0CWNGDqujJERXG3W9zrBQtxLyGC0nPTaCppQ3NWp/Wmvo5qHPkSUfu7UMXOCnYC9UepEFIzPSV7YHLXeuiqHAmSeWQ7YhpsK+cDI+85Rjg2zSAlW/1c4A5NDTALKSKVnBRdSCDuhe0T1HD10WYwMaGnbxqnvfM06UPObsQvLgD938auQll+8Cn+aSGA+z88ANz0fSCBXDaOvDY2+LBMp4N7Lu7FeZozstI6pOIsXHb3FcL6nBu+XsXakDdM7O9LVb6UCPzvs2xxB22V52Fi/7JvgcmGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ5PPFC0624F2CA.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::850) by LVUPR11MB9834.namprd11.prod.outlook.com
 (2603:10b6:408:39d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 00:37:03 +0000
Received: from SJ5PPFC0624F2CA.namprd11.prod.outlook.com
 ([fe80::e489:366a:1177:5a0a]) by SJ5PPFC0624F2CA.namprd11.prod.outlook.com
 ([fe80::e489:366a:1177:5a0a%4]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 00:37:02 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe: Store GMD_ID subunit during GT init
Thread-Topic: [PATCH] drm/xe: Store GMD_ID subunit during GT init
Thread-Index: AQHdZoD1rsUggohL8Uqx0xkalKT1w7cTTjgAgABe5oA=
Date: Thu, 29 Oct 2026 00:37:02 +0000
Message-ID: <SJ5PPFC0624F2CAD01B6A7902A7CD5538B2826E2@SJ5PPFC0624F2CA.namprd11.prod.outlook.com>
References: <20261028020554.390714-1-pallavi.mishra@intel.com>
 <87ecd9mzbt.fsf@intel.com>
In-Reply-To: <87ecd9mzbt.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ5PPFC0624F2CA:EE_|LVUPR11MB9834:EE_
x-ms-office365-filtering-correlation-id: 4956f2d3-0a17-4a79-2c54-08df3554c001
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|38070700021|11063799006|56012099006|4143699003|261021121427099003|261022113327099003|261022075727099003|261021123027099003|261026121527099003|261022105027099003|261026140227099003|261009223027099003|10067099003|22082099003|18002099003|6133799003|261028144727099003;
x-microsoft-antispam-message-info: vLtPxKaY2wdfP9XQcq+lupO4cV51g8PAXvYHn/ASNxs4c2tk9/b5/zREf364X/tImrKHDNUxV7p0g0jPgEWqt/UnSlX0gZz0zlWOPP3+XFlkVaGU0nzWMhgwOcyQ6suedjTWbQf1V2MGG7NdjBvGsfF0tv9N3FL6VCec3b3AVquIyAQSNT5TTxtIzHlFHhLmnUx0jmOPOjuvYWQLBN+J74HAqU2vurM/yLi36RTVpkywXPaaJ824mMfmO7CbrqcokaYmr5FBYR9OAHSQhtQl1LjJxTnGnRc/DFne0qkK74TR8tT+cf9fnMYG5gh1bQtdgp6nPOHMj679TVY1bJ5CG550KGL08b2GOrA5he+ebs+1knAMnSSstHd/DWMvg//IuOvFKemGS8kLBjv04DPfSgwGNfqGeH8s0lqJkIdEqoMdrps2tDqxWsjqvGGV+V9YeprVI5pV87WmT+SSoxO3FJ7mm99KCf7X3dyLTqBeiWXFjYEwGHTJ9uUROGry2txbsusYeYx8r8xMCsLYE4UxmQKgMJNCXpWMnQw9r5Sp7kET7HeComDlh0DTvEBCder54l3EBoq27r5peZ3pN+Du0JV8dLb1wyYDkI/HTh4dRoZYdJjBl3CP7LANVcc1wzzwZdBYLu3WDfkTxps37hafQVzdLxoHg1RVfJb1mR/ba1PX3I4qmDpIoPLo0BUykFgCNz6vxBBUh2oWaolUk9gPUbggU8/0TYBeKKzJJc+j8vY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPFC0624F2CA.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(11063799006)(56012099006)(4143699003)(261021121427099003)(261022113327099003)(261022075727099003)(261021123027099003)(261026121527099003)(261022105027099003)(261026140227099003)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003)(261028144727099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yQ5iNYDyUuWLjxl/IvSfs14ZBExKQXUQafSCX8fWDV8ooteBrylixNaRUB+C?=
 =?us-ascii?Q?naKWM9om3i/o6zsXtgbQpCQ5zTBYXTlcV602h4y4A8VDCelx8HyRAxFgAcGn?=
 =?us-ascii?Q?RgM8PJ/uwojjdWuf2igopXcA0Yi1GYaNeAa3X5Xsf1ZqtMdEqHmBQ3H+CE0R?=
 =?us-ascii?Q?GyBqKAz69FNiazA5NK0gKroRtAV1s4FEAn2Ho8nfR17Zg0QFdhdnNN94HnYn?=
 =?us-ascii?Q?B9q5PpA5L54mdQkKuHNfdnNx5ihwDG11U9MYKo0o9Wa/JnSoPuUnUOC42cuq?=
 =?us-ascii?Q?9laOmlrFzq4wiM56vDmpe+5ZfDm/N/KyRCZfYatKHR43RtP/xfqgZpLctxt0?=
 =?us-ascii?Q?LRcVR/5KxXy0LC1yiOUTShYjxipmgw+9B3saJ1uGrTF2HnwfDoL+3LnSx+Lg?=
 =?us-ascii?Q?UwxxJ9IejNLfR/VPR+hPUR5nHGhQ95CXNCcleEeZOP3XhIt70vPMCYHKlqsb?=
 =?us-ascii?Q?Ie0G59ke0ovIct/wDPveQX15HfJ487YknmAUW1oZW1NRWK5j/s6ArbhAni2a?=
 =?us-ascii?Q?JgPqWfJI13oZ2xWdJnL5Ks9LPneNnQyPyo9umbEiN6mOtskBK/KqgDdJjv/y?=
 =?us-ascii?Q?yHyPHlbZE++jtBj4iuscn5qtlPL1ZjGpc80jZHwuQfArQHP+n4pHlBOeNUmb?=
 =?us-ascii?Q?14DOX512flW0oloQarU8leUXeIMkmqktQWd6dcsf452xuom8KaRLxHxA1SZj?=
 =?us-ascii?Q?cWkEgImrYqn/lPZgOs1chRwjJy7yGId5WzTNSd3KZrmhiYt5aT9neOgVPFkU?=
 =?us-ascii?Q?0DFGdsmK28BbWVbkpmvdfBmHyEWILXqJzmA3hPV+f9ZwySdm17mxYlZAd2J6?=
 =?us-ascii?Q?P3BTii744PDUWoCrd8RrO09AsHT2RdqDAjjccJfTSjzWMc4U2aLH0sVF9LMP?=
 =?us-ascii?Q?c79bBpptcnhQz6td6+/T9p5cp6CRnB9/biLzeU3D4RwAjAnMKdtQlMkuhgEo?=
 =?us-ascii?Q?FKOmv9Yd+baJUEsohr2pZ2L1pU/oi2S7sNkyPcm6WzN2qKidhMb3Kyvvja1P?=
 =?us-ascii?Q?mYEMOKmYgPi3KxKjzkdaHi0ohCQH86zSQXxr4Vec1lRubfyy81aU1rwIUFIa?=
 =?us-ascii?Q?QUeePPtSuoFRQlEgAzYW27pXLANu2J06pjRl06ICcIYd36hgeVHQhs4MelBe?=
 =?us-ascii?Q?dsJrzbTwNIrDKyJy4FK96EFLB0ImfED0kvwZZGqnB4ow1qP2lUI5Uh4N8Pxt?=
 =?us-ascii?Q?EOG5DA6X1SK8zw0n9FRQlMuZZvwFQ1fRLV4IK3czy5QjMzxfbL5vFCS5i7nB?=
 =?us-ascii?Q?IQXJXJzAzxgdhIb/QH027WrZ6XVm4FCU4GS2jYUXFgVLjJes27ucSm73/hhU?=
 =?us-ascii?Q?/yrnQsfnJAEEDmPb1GBr5yvbvNkshhedilB5zC5ksmnTuqekkLzzNJbxE2jE?=
 =?us-ascii?Q?q2n40KjC4ghoRbhSCQtGhw88PORfi2C5+SnZ9ZHig3dAfcHEbpcbjYh09ZAi?=
 =?us-ascii?Q?b28RMl0VrxysWNVWTNQ8GmWCHmsZWCcYPw27El9xrat85qDttf2JXoYpgJvx?=
 =?us-ascii?Q?yn0MQpzISQxov6OFqV0b6X2+027oUVUFVnUXoPjWhZ87NX6t7NO7HkjWfJzt?=
 =?us-ascii?Q?tclLh8PenaW3BHKU7eRqTclwb2jM8yjEhe0IMMkuW8Qk0zeUfdI+vzE+cFTC?=
 =?us-ascii?Q?sVi2mLr4HkEYYGzn5UVE4NhIWgGq6WqFFr3o3EQyTh8B9Ln89bmrbIaicRtH?=
 =?us-ascii?Q?S8wmol+rc6M4vV6IaW0jbvCB1Re7f+6o+t4TbUTBoLF/rv9qeJVwzAp1IlCJ?=
 =?us-ascii?Q?/vx87xQFWA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JMZRmuPJvNJrSQ/ivERtfA2M9ZlKrNpBRgQvhbLkjIwGZykPhecVoYtVUF+JxuO4DmcI5Ju+w9r9GStq6bnvDXBdr9cgEiRjXDuSihQxdYmxj4pVSLjl//erPEsjC/rN1e3pN+pAx3xEQ3Vo1VN6w0w7icALwpbVCdBwEBoLiq8Dhj3c12ko7s7FZNj9NUWxphvzOXMr88LyQrZUL0w/Z/31Nx9E2QDOkTXqW9fpAXRLlF150ydxhNEZ6mDRHGffgQy4vnHT8nyNf4ViUVql81bSXjdgg8oCwoAdTih5YjPsNbl9A2/sthCJB6qAI+KdmNzSESWOQE2B1ZBAU2IO0w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPFC0624F2CA.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4956f2d3-0a17-4a79-2c54-08df3554c001
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 00:37:02.4190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m87U/jTLbFfzD5gj8a+dYkRsUbtv+6Dr0gVbvmFecQFmzYq/eABwNgzbMVYk7j8AItahx9d/Ry3/haCiRHH2gAOAa1tFVfwjOVxopbx9NVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9834
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Sousa, Gustavo <gustavo.sousa@intel.com>
> Sent: Wednesday, October 28, 2026 11:53 AM
> To: Mishra, Pallavi <pallavi.mishra@intel.com>; intel-xe@lists.freedeskto=
p.org;
> Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: Re: [PATCH] drm/xe: Store GMD_ID subunit during GT init
>=20
> Pallavi Mishra <pallavi.mishra@intel.com> writes:
>=20
> > Read GMD_ID during GT forcewake initialization and store both the full
> > GMD_ID value and the subip field in gt->info.
> > Keeping the field in gt->info provides a common source for future
> > users and avoids additional GMD_ID reads.
> >
> > Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c       | 20 ++++++++++++++------
> >  drivers/gpu/drm/xe/xe_gt_types.h |  2 ++
> >  drivers/gpu/drm/xe/xe_guc.c      | 12 +++++-------
> >  3 files changed, 21 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 60d35ada2853..39ae7105aaa0 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -564,6 +564,18 @@ static void dump_pat_on_error(struct xe_gt *gt)
> >  	xe_pat_dump(gt, &p);
> >  }
> >
> > +/*
> > + * Store GMD_ID and sub-IP before GuC upload. Main GAMCTRL
> consumes
> > +the stored
> > + * subunit field during upload.
> > + */
> > +static void xe_gt_read_gmdid(struct xe_gt *gt) {
> > +	u32 gmdid =3D xe_mmio_read32(&gt->mmio, GMD_ID);
> > +
> > +	gt->info.gmdid =3D gmdid;
> > +	gt->info.subip =3D REG_FIELD_GET(GMD_ID_SUBIP_FLAG_MASK,
> gmdid);
>=20
> Why do we want to store a subip field? Shouldn't we simply use
> REG_FIELD_GET(GMD_ID_SUBIP_FLAG_MASK, gt->info.gmdid) when needed
> instead of adding another field to the struct?
>=20
> Furthermore, there is some exceptional use case for the "subip" bits on
> media version 35, but for other IPs they are tagged as reserved.  As such=
, I
> think we should limit ourselves to treat those bits as "subip"
> info only where it makes sense (i.e. the current approach inside
> xe_guc_using_main_gamctrl_queues()).
>=20
> --
> Gustavo Sousa

I agree that with only the current caller this does not buy much over REG_F=
IELD_GET(GMD_ID_SUBIP_FLAG_MASK, gt->info.gmdid).

The intent was to read the subunit once during GT init so later users can s=
hare that value instead of each time extracting this. The interpretation wo=
uld stay limited to the media versions where those bits are defined. Elsewh=
ere they remain reserved.

That said, I am happy to drop the field for now and add it with the next co=
nsumer if you would prefer that.

- Pallavi
>=20
> > +}
> > +
> >  static int gt_init_with_gt_forcewake(struct xe_gt *gt)  {
> >  	int err;
> > @@ -572,6 +584,8 @@ static int gt_init_with_gt_forcewake(struct xe_gt *=
gt)
> >  	if (!fw_ref.domains)
> >  		return -ETIMEDOUT;
> >
> > +	xe_gt_read_gmdid(gt);
> > +
> >  	err =3D xe_uc_init(&gt->uc);
> >  	if (err)
> >  		return err;
> > @@ -610,12 +624,6 @@ static int gt_init_with_gt_forcewake(struct xe_gt
> *gt)
> >  	if (err)
> >  		return err;
> >
> > -	/*
> > -	 * Stash hardware-reported version.  Since this register does not exi=
st
> > -	 * on pre-MTL platforms, reading it there will (correctly) return 0.
> > -	 */
> > -	gt->info.gmdid =3D xe_mmio_read32(&gt->mmio, GMD_ID);
> > -
> >  	if (GRAPHICS_VER(gt_to_xe(gt)) >=3D 20 && xe_gt_is_main_type(gt))
> >  		gt->info.has_wmtp_disabled =3D !!(xe_mmio_read32(&gt-
> >mmio, XEHP_FUSE4) &
> >  			CFEG_WMTP_DISABLE);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
> > b/drivers/gpu/drm/xe/xe_gt_types.h
> > index c00a7c171f80..c67fb0d512b0 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -153,6 +153,8 @@ struct xe_gt {
> >  		u64 engine_mask;
> >  		/** @info.gmdid: raw GMD_ID value from hardware */
> >  		u32 gmdid;
> > +		/** @info.subip: GMD_ID subunit field */
> > +		u8 subip;
> >  		/**
> >  		 * @info.multi_queue_engine_class_mask: Bitmask of engine
> classes with
> >  		 * multi queue support enabled.
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index b1f4e132fa0c..37d72ce1d589 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -1864,18 +1864,16 @@ bool
> xe_guc_using_main_gamctrl_queues(struct xe_guc *guc)
> >  	/*
> >  	 * For Xe3p media gt (35), the GuC and the CS subunits may be still
> Xe3
> >  	 * that lacks the Main GAMCTRL support. Reserved bits from the
> GMD_ID
> > -	 * inform the IP version of the subunits.
> > +	 * inform the IP version of the subunits. That field is captured once
> > +	 * at GT init and stored in gt->info.subip.
> >  	 */
> >  	if (xe_gt_is_media_type(gt) && MEDIA_VER(gt_to_xe(gt)) =3D=3D 35) {
> > -		u32 val =3D xe_mmio_read32(&gt->mmio, GMD_ID);
> > -		u32 subip =3D REG_FIELD_GET(GMD_ID_SUBIP_FLAG_MASK,
> val);
> > -
> > -		if (!subip)
> > +		if (!gt->info.subip)
> >  			return true;
> >
> > -		xe_gt_WARN(gt, subip !=3D 1,
> > +		xe_gt_WARN(gt, gt->info.subip !=3D 1,
> >  			   "GMD_ID has unknown value in the SUBIP_FLAG
> field - 0x%x\n",
> > -			   subip);
> > +			   gt->info.subip);
> >
> >  		return false;
> >  	}
> > --
> > 2.43.0
