Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC4ED5C0EF
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 15:29:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C80410E9EB;
	Fri,  8 Nov 2024 15:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FptmHc+L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B0310E9EB
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 15:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731079790; x=1762615790;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cY40BqUXQzEQo88/sIl5Q8r7ARWJ60NCIGUE501jclY=;
 b=FptmHc+LI3MJz5eux02DI27Zh2mXMtFHNXyE6Q1CGeAMXANM6nNO5Tt2
 0B7DxWDNXMI8LewweT1C/IY5jv4ODc11MuuZyQ8s20upPHebqHX1StQFd
 bl2eKNWJAXFzDNEEJPBNdACI4eyhm3i36MyIw/oT/eQsW72g4zqrAp2RX
 9EZNm9r9yXKaxG7T8hDD8Pht/9bi1yXAZX61F6V2jcZyVGgmrwHHhtt+4
 AwWXK3EPEErrO04R8Fbw+KnjtsaJN9JPMxpBeUzcYEvjkObGzjsJwRgEo
 9spjgaNd9zJ/WU2jmmfTiAK2r1E5MGYVRdM1cTm/9a2/ic9atwx9E4BAM g==;
X-CSE-ConnectionGUID: bSzIM3GoRkq+C6uxGjUCgQ==
X-CSE-MsgGUID: yEFUwdu6RPedMsRLRsu+NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="48481123"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="48481123"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 07:29:50 -0800
X-CSE-ConnectionGUID: UoWOQu2TToaDeoTgRKbeRQ==
X-CSE-MsgGUID: 49bxnwciTNSa0LGSKHTPyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="89567000"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 07:29:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 07:29:49 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 07:29:49 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 07:29:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6dAiMPzJFziAU6OcTBwEY9Qkbz5J7uLwEQacvDD/tqVLvDDsbO8D05DGjCIGZ0/DkvbsH66YYmfcpmTTXLN/lLO8ik3z5yfnyKRnapeY3YdxKhfvzthucFDmvdQ6CJ+jHetlQjNg7yosZG5DrBb1NftuFxMeLzolHXZHlNk5FokorCzQ3++dffcgsN9QQwRj/0kYYev2ee2FUljQVfyonrVGRWhJaSxmhVg+8rWZtvtlMOb22cCnwQzB6awt2B6eRc5REX/DLcdViFi36m82uGXyXK7BMKE7ILd8zo8MQL8dBvD3Q9/L07kty8lCc4AjUuxU+TbW8M9T9SG+z2dDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ztn7AWudeKLXcapXfv7SYRD54UIjGUdkMFZQFfNe2/Y=;
 b=wohGyWNBfjFglgvpFaXwRNU7hk2/y6LvJ7F9vKKIbBeHcmN2ha8jVjgypdjFqBkozkLkzp1LARcFLQXK0WYHzkJ9GUrVUL8dO5Zj8PZf/MSOEVVTNK/CEFnMUq+hZbUy7Sd0bJDfBF9km4ofa6/cW0GfYMtUMjhktxRYgr1V6L3VkFwi+zFddL3qsWmu41/dCopVk+W/bgmTcty17nJiNgydQqSDWQAsMkhiaqUdVEyC0BNgrhSnBfsScNpmul4j4MFt3BwphzKIEtwbek7bdDqXO+Q0SR3W0BWorHDH4G1hQEFeFJq1X+RktqJDm+zqq70TBKY7YnHPlMIJBj+wfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by LV3PR11MB8728.namprd11.prod.outlook.com (2603:10b6:408:218::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 15:29:45 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 15:29:45 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v4 2/3] drm/xe: Sample gpu timestamp closer to exec queues
Thread-Topic: [PATCH v4 2/3] drm/xe: Sample gpu timestamp closer to exec queues
Thread-Index: AQHbMZ/Uhp5L32jnsk6EdJ5aQ8Y5KLKtghig
Date: Fri, 8 Nov 2024 15:29:45 +0000
Message-ID: <CH0PR11MB5444B16280BD86AB0982438FE55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241108053318.3483678-1-lucas.demarchi@intel.com>
 <20241108053318.3483678-3-lucas.demarchi@intel.com>
In-Reply-To: <20241108053318.3483678-3-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|LV3PR11MB8728:EE_
x-ms-office365-filtering-correlation-id: f8e2f78d-7911-450a-07a7-08dd000a2cb1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?rTBHw6RqSDrUR40+W3nGspXaNNAJRbgnb/I9FRnz+u149grANvcocCzmFbaN?=
 =?us-ascii?Q?Wo7+WSyQv+b1x78NXj4v8xgYdnI49FhDJD/wN157RpWNXM66GiIRrtq4MESP?=
 =?us-ascii?Q?6kBJKbCn27F9gsUnuyR9nRlgv63Q9BziKSOFWODzX50x7DeGSnnm+CymCXCe?=
 =?us-ascii?Q?sx46uRGS7lPTYLxHuW8VMalT3yHTRupIzPYWnXoswTGO+yZzredNLppbxIoe?=
 =?us-ascii?Q?lDTBC6GuwEuO8mDpI5i7Kund+WGsSx7ny7RxHuaF9YE81RZg7a8IrPKj1/xe?=
 =?us-ascii?Q?eUuAAq/fb5IMFTVrw00vwinAeMSnC1naLuu4JUMmrFsqYH/yOiGLNt6Lj4rD?=
 =?us-ascii?Q?eE1Yb4pfDm38gy+CX5QQFClPdQLjZkbUKruMxj1Scdj8p60ORqe38Z2qdtTo?=
 =?us-ascii?Q?hX3Ll2tWIz/cGcaDnqWLrBgj5PFg9X+SSrl0lyuUmCifZlIXt3h67resxzyn?=
 =?us-ascii?Q?fveP8E4VYnT0nE5GdHJnQWAfPLVbo3rNjiMSqmu3un7Vo6nRgRzaWVWdoSmK?=
 =?us-ascii?Q?Nik1gH1Fx1+AStPcig00E5YR4DY+Pvw/RhGIVk/tHonioU9sHYFKjZMO1NM9?=
 =?us-ascii?Q?l/dV+NWVM39UT59qzz2Qr3W8WgZ1CFkFByypoRG96MlYbhdJsyXhR/ChAm8I?=
 =?us-ascii?Q?rtQGJtjUPEZlPyfRjE0r9okjrEs255oUqNAtHERtKUuYTKyzdzj57Ql5hgjx?=
 =?us-ascii?Q?zYxMVAjLNS3vgSi0DD4r6f22VYHcU6cHbTMkmJOuHdwXL91ZgLJ1VP8/vgs3?=
 =?us-ascii?Q?cgN909nxnzhrLYItx0PX4AhTGq8t/+ikChKEchIhyZ5I4V1T9eIA8LnHco7Q?=
 =?us-ascii?Q?XBGSg5+etmVxnfG4HM04WHQFd4dKvcqv40o2m3vWDytOUT/yFA+mIhCoJ330?=
 =?us-ascii?Q?kh+P8oahRDDzHI4v/5KV4AXeRZF2buk3/60sj/UhiaaT9xjT+bFDov1RwtMh?=
 =?us-ascii?Q?amNngQSK1pcNB2GmOdgiR2sKv5r+FnOnGGAPX1TPajTbVpHCq9XQ17P7rBC7?=
 =?us-ascii?Q?re/WJDwRgFq2/8gxgWpL/lo1EYhxkH7qGcCUljtDafSGyeB7GgCFcR0uDBSr?=
 =?us-ascii?Q?4OCR3Qi17GKHXmXYSIP2ff9tIpF4hpyXvRy5hNQJ6rviThOkxqLF3F0ZP/9p?=
 =?us-ascii?Q?CFhcaLOB5SrxCvZDuXa7iHeJxHq3npawGJyZuBZbNGl9uIB/8c9ohQkB7mWp?=
 =?us-ascii?Q?R0wt15CroyQUYzr0ffYZyb2Kc+KJ1f+01fB+jEHaw0dR61osHe+1afOAP+nX?=
 =?us-ascii?Q?13oHkioffOaRhc5lEDiMFwEVAo3/8mecaZQz+g0x2pJ5mUY8i/AOfjrfW/Bg?=
 =?us-ascii?Q?4AQinTPYsZVcaRnRz7PJQwdkCHIqw0s6/qqpHvuRlwp/hd/28Uj4dM3gG+za?=
 =?us-ascii?Q?AOHjBBQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2SkgssToA1uQx7phzBOZTe5mir9G4285EzIP45NN7O63NWikXSSvsLDlIBOg?=
 =?us-ascii?Q?kqCsSg9HjhEihWhJYk+S2Bi3uDnjZHv55h2kHzJ/k1GRvlHao2WY9egKYUgX?=
 =?us-ascii?Q?DCKPCDN2qz+5qpjiQgnSQH5CVRuOzklU36BXoaqLtxSuaXx9WvpPER8w2hcW?=
 =?us-ascii?Q?7ZF2cwRgI0Y8eLHiwlLZTtZP0dc4zsf55XpLkrHVG4hoXEREWcL70zWhNfNP?=
 =?us-ascii?Q?K+JF+teIrMyUyQDfH0llkIZzwAD7Xa/18jibMUBJpjwbh6Leb+rUExkD+o/C?=
 =?us-ascii?Q?8WWMGBi4rF8MAyg8tnq7hWSQOLEK2WrBc+3mCHdd1Dz57Hh88u7DIZVpAnG5?=
 =?us-ascii?Q?kXXKM2ieDaQnumspX3gNaTS8CkG3fP7O8po1mNxWlLTPDRx+J0OteyIKcr01?=
 =?us-ascii?Q?E1aqWLWg+5agc1AaWnwyhDH9KNsmor5XADd1GDYCsdULhuDlwH6zi4IaYaSn?=
 =?us-ascii?Q?ba66KuxShg6hBeSozB5Smh0kc5khfG9aoaqIPNh8XNbpYhNgHzaip0TKlpem?=
 =?us-ascii?Q?XR2nsBq1HNAAzXyIRxJJfc44dLuONTmU6ia2majZZEwuYzq9l/DOu+vNn7Gy?=
 =?us-ascii?Q?Rrp6j4MsHTOvuvYa36tqjX/KxEOHYbPMphBW7y2KTcsZk42YHU2n4jrPUvW5?=
 =?us-ascii?Q?YI7xfkLQXRP52cT2d85j3eRZnT+V1useCQndeTgC+iFBSjHVHTwwYK6cDTvs?=
 =?us-ascii?Q?D9to3qk8gk6rjnkvJ2RMQCs2t6taluQCYcCcVgScT1hcizFb6TX+s71HMIb7?=
 =?us-ascii?Q?U7SCI7nkVDm2YyQknW+JZJiuIt1+ghCJrgluthcSqTm3tRJhLRyA7kXde/yC?=
 =?us-ascii?Q?sJ603T8Fppr66OFG/TPFXIDD7Nn6t/xH1lY7BWXWJDRSkik60gSXFHVlwGWo?=
 =?us-ascii?Q?o+yiwAufRwRDK6+yQXEdZeTF/sMiw0opQYoDAceYNdYVRbdIxBNgu1L8Y1ow?=
 =?us-ascii?Q?Kzz+Z+NzMjesZWrQCL9Bq84DmMazewpipdhiwi/szlVIWg9Jt6hoD29K0QTD?=
 =?us-ascii?Q?UqZ11e1JJz4sZlovNEruAtzA7iE2JFyCX7Ttx54dARwU9ZYXGzMFfJmvnr42?=
 =?us-ascii?Q?wQ4B2xmuoiPz59hve+qRx4dbdDzL1GpEkeZfy5CwXd9o9m9pu13+bfyXwknS?=
 =?us-ascii?Q?SyWCtSvs71OV40ipHnQFJHeRViKLgjoCmaOT2hI5A+dzWQmMrPmtCi95VHaA?=
 =?us-ascii?Q?sCMBhAiOCaeglp0LJhwU1muLFccZMhatInj7kmwolNcSA/0UvXzsKRy4ydHW?=
 =?us-ascii?Q?ytrgiBh3DNXJ6PlVeMQc2nbUJJhR0WjDAIvq7tkz1OpA+Tfv1/Nf0KWsgist?=
 =?us-ascii?Q?urfdaP/HhaMoC82MWI3RNPwCfemtPoIZ39sQ1A4djxl4MsgMHQhD+/tv6rDA?=
 =?us-ascii?Q?QiWLPhCVvpY6bS8fueG4VBLSgvY2qT6y3oHhkS5ciBOTmz7ELZva+0C1m3bO?=
 =?us-ascii?Q?gujhnuR3f9x3F6/WMYfRpb6kUTDqmIwC5LOKboq3JFrIZF/dDUpl0jMjSFt2?=
 =?us-ascii?Q?yBnciiA3AJyJ8uvh+8shqITVo/CApotkoy6drQtyoMHRQwAP9CSseMEPX/HP?=
 =?us-ascii?Q?kk/YJwzq/hOJBIOpxnvXHO1IyLnbU5FqL5tlT2Nz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e2f78d-7911-450a-07a7-08dd000a2cb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2024 15:29:45.5484 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lZpUj0fmS8Ah2fU1bunhYYcG7Wxq3p/h9qSR0eKrbvtIVB7rcKf32O4y8A+wrN3KNUN7AE6bN4Y9FgK/AQYd5qJMgv5wZJZzGAFPkBpBpLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8728
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

-----Original Message-----
From: De Marchi, Lucas <lucas.demarchi@intel.com>=20
Sent: Thursday, November 7, 2024 9:33 PM
To: intel-xe@lists.freedesktop.org
Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Nerlige Ramappa, Umesh <u=
mesh.nerlige.ramappa@intel.com>; Brost, Matthew <matthew.brost@intel.com>; =
De Marchi, Lucas <lucas.demarchi@intel.com>
Subject: [PATCH v4 2/3] drm/xe: Sample gpu timestamp closer to exec queues
>=20
> Move the force_wake_get to the beginning of the function so the gpu
> timestamp can be closer to the sampled value for exec queues. This
> avoids additional delays waiting for force wake ack which can make the
> proportion between cycles/total_cycles fluctuate around the real value.

Maybe add a newline here, but otherwise
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> For a gputop-like application getting 2 samples to calculate the
> utilization:
>=20
> 	sample 0:
> 		read_exec_queue_timestamp
> 					<<<< (A)
> 		read_gpu_timestamp
> 	sample 1:
> 		read_exec_queue_timestamp
> 					<<<<< (B)
> 		read_gpu_timestamp
>=20
> In the above case, utilization can be bigger or smaller than it should
> be, depending on if (A) or (B) receives additional delay, respectively.
>=20
> With this a LNL system that was failing on
> `xe_drm_fdinfo --r utilization-single-full-load` after ~60 iterations,
> get to run to 100 without a failure. This is still not perfect, and it's
> easy to introduce errors by just loading the CPU with `stress --cpu
> $(nproc)` - the same igt test in this case fails after 2 or 3
> iterations. That will be dealt with in the test itself, using a longer
> sampling period.
>=20
> v2: Rename function and add another to get "any engine", preparing for
>     caching the hwe in future (Umesh / Jonathan)
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_drm_client.c | 73 ++++++++++++++++++++----------
>  1 file changed, 49 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_d=
rm_client.c
> index dd4e16a84874c..298a587da7f17 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -269,6 +269,49 @@ static void show_meminfo(struct drm_printer *p, stru=
ct drm_file *file)
>  	}
>  }
> =20
> +static struct xe_hw_engine *any_engine(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	unsigned long gt_id;
> +
> +	for_each_gt(gt, xe, gt_id) {
> +		struct xe_hw_engine *hwe =3D xe_gt_any_hw_engine(gt);
> +
> +		if (hwe)
> +			return hwe;
> +	}
> +
> +	return NULL;
> +}
> +
> +static bool force_wake_get_any_engine(struct xe_device *xe,
> +				      struct xe_hw_engine **phwe,
> +				      unsigned int *pfw_ref)
> +{
> +	enum xe_force_wake_domains domain;
> +	unsigned int fw_ref;
> +	struct xe_hw_engine *hwe;
> +	struct xe_force_wake *fw;
> +
> +	hwe =3D any_engine(xe);
> +	if (!hwe)
> +		return false;
> +
> +	domain =3D xe_hw_engine_to_fw_domain(hwe);
> +	fw =3D gt_to_fw(hwe->gt);
> +
> +	fw_ref =3D xe_force_wake_get(fw, domain);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, domain)) {
> +		xe_force_wake_put(fw, fw_ref);
> +		return false;
> +	}
> +
> +	*phwe =3D hwe;
> +	*pfw_ref =3D fw_ref;
> +
> +	return true;
> +}
> +
>  static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>  {
>  	unsigned long class, i, gt_id, capacity[XE_ENGINE_CLASS_MAX] =3D { };
> @@ -288,6 +331,10 @@ static void show_run_ticks(struct drm_printer *p, st=
ruct drm_file *file)
>  		       !atomic_read(&xef->exec_queue.pending_removal));
> =20
>  	xe_pm_runtime_get(xe);
> +	if (!force_wake_get_any_engine(xe, &hwe, &fw_ref)) {
> +		xe_pm_runtime_put(xe);
> +		return;
> +	}
> =20
>  	/* Accumulate all the exec queues from this client */
>  	mutex_lock(&xef->exec_queue.lock);
> @@ -302,33 +349,11 @@ static void show_run_ticks(struct drm_printer *p, s=
truct drm_file *file)
>  	}
>  	mutex_unlock(&xef->exec_queue.lock);
> =20
> -	/* Get the total GPU cycles */
> -	for_each_gt(gt, xe, gt_id) {
> -		enum xe_force_wake_domains fw;
> -
> -		hwe =3D xe_gt_any_hw_engine(gt);
> -		if (!hwe)
> -			continue;
> -
> -		fw =3D xe_hw_engine_to_fw_domain(hwe);
> -
> -		fw_ref =3D xe_force_wake_get(gt_to_fw(gt), fw);
> -		if (!xe_force_wake_ref_has_domain(fw_ref, fw)) {
> -			hwe =3D NULL;
> -			xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -			break;
> -		}
> -
> -		gpu_timestamp =3D xe_hw_engine_read_timestamp(hwe);
> -		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -		break;
> -	}
> +	gpu_timestamp =3D xe_hw_engine_read_timestamp(hwe);
> =20
> +	xe_force_wake_put(gt_to_fw(hwe->gt), fw_ref);
>  	xe_pm_runtime_put(xe);
> =20
> -	if (unlikely(!hwe))
> -		return;
> -
>  	for (class =3D 0; class < XE_ENGINE_CLASS_MAX; class++) {
>  		const char *class_name;
> =20
> --=20
> 2.47.0
>=20
>=20
