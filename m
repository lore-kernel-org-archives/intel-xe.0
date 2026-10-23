Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE0C606A31B
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 13:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ODS9sEXj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B53210E5EF;
	Fri, 23 Oct 2026 13:29:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FDD112ADD
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 13:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792762184; x=1824298184;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8F6S11gGzWBbItw2+O+rnSfcQ6iTk4QJxbtjOL1Rk/g=;
 b=ODS9sEXj5ErpDvb8Rjos8qojU4hfMUQYO5sf8QaK3iEPVw5wgmZZL3RX
 d2mdjjmX1SrRq956JSwZbvvq1eEccp4lerp/if8HJppufeAeS9NBHevvl
 6z6xEIR1vQ5AsJM4jDKYLgOjS4+jAK5C/bKw0e8pwj3aZHb9yJV4dh0z0
 VGZ8rHGtKpLprP6r3i5Kxswzu1s7792pYtzEXEfRx6IbrjEVhxxVMtnHC
 8tHwzkQK8yS/ww12TBU8dBLUZIbS9l04lg0bTRnld2icDhqHWVE2C6ru3
 L77HbptqDBUfkLPTrgt+/bqoUVZoKSCxHRLv0VzZUxPA/TZNKuuWEdfKr Q==;
X-CSE-ConnectionGUID: FaWRt/sUQeCfM+jumzWnWw==
X-CSE-MsgGUID: CVf5oJfsSx66CHCgRgW32Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1536264"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1536264"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 06:29:43 -0700
X-CSE-ConnectionGUID: vbOq65TfQDicHtOQkX3u2w==
X-CSE-MsgGUID: cd6yZg4nQXOurS176Z7d/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3533322"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 06:29:43 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 06:29:42 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 06:29:42 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 06:29:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GWJOJPUc2Xf0G0YD+zI4erYjJA09d7s80Q0mWbElMPYT31Wm83Bx/rW2UmNOaLBUbvkaS0zPbExmtSCAkhOmv14R5pz9hwdMIc821PIcKnwQWe4yVjI/vvh10bDVVT4OGWRwXb1kfxPKk0iMfhQsfRJm10GhId9w+NO0WJ0+XqdMk6fC2s4DEJ8MRculGc5AaP1AL5a8MU8k1q7IYnHsDfY9weErT4xRMxPhPbRD8mUmPsIOzeE/STNjBYX+EGqJGtfl4w/xPZmZxmC/6diV2FxxnzqPRtsH4Y9K9r5Of9f5BT26T/yqcxompQq3lVl9W42SFDoCte7+fz/+KrTi1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhPoCTaiQLx4ZZXj9GO5jVEVssa62QYRmou5IOf+aEM=;
 b=d9idT3QjrzGB/s4jHl65R9ymGyT2qhvqThj/a8Dc6R1CLTOT9XH9LUqbzTUSshuxRRpLGWR3GBkIgqOAz3Sd278Cc+7OIsRg6ZWFChH3DyQvN4mIP+BKGh45LUD/TG7NxUOSNzyjcqh5p/3eDU25M/cyP5kCTZCDC1C1woqiLYMPBU4QJTX2I8f8AIgb3kCchfeN0p+JVGXBnLx4FD92Y394aP7eTAuw7pHoVB0VJcDZAmwuBvgai/SIvZq/TH58ILnjFJN7lGTooq2GcchJ18YYKxNXc0mcJBViZp+7wFinp05JXxkD5EP92s4g/RLuVklEsYdLJ6/cKZeKGCabxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by DS0PR11MB6445.namprd11.prod.outlook.com (2603:10b6:8:c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 13:27:38 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0496.021; Fri, 23 Oct 2026
 13:27:38 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Kumar G, Naresh" <naresh.kumar.g@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v5 1/7] drm/xe/devcoredump: Capture GT fuse registers in
 devcoredump
Thread-Topic: [PATCH v5 1/7] drm/xe/devcoredump: Capture GT fuse registers in
 devcoredump
Thread-Index: AQHdYrTw0/Pcr/oeqUWVSvk8ZATEWLcLHmRQ
Date: Fri, 23 Oct 2026 13:27:38 +0000
Message-ID: <DS0PR11MB871863801EB2CCFA2A08DAD581642@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261023060554.2643515-1-naresh.kumar.g@intel.com>
 <20261023060554.2643515-2-naresh.kumar.g@intel.com>
In-Reply-To: <20261023060554.2643515-2-naresh.kumar.g@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|DS0PR11MB6445:EE_
x-ms-office365-filtering-correlation-id: 35fc6574-feb9-44ff-8f2e-08df31096835
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|261009223327099003|261009223027099003|261009221727099003|261009221227099003|261009220027099003|261021135927099003|261021130227099003|261021123027099003|261022105027099003|261022075727099003|261022113327099003|261021121427099003|261022115727099003|10067099003|56012099006|3023799007|6133799003|18002099003|22082099003|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info: M/IHVUto9G2ejP84UEwZItz8FGBMKalVaX/phAPrNDgrqXaNsv8osgitK3DK4YubfQgxaspnyw8IUQoUiODMdjXzz0HRBtt25+OLHDfMUo+xS7eX058PVAozvzGdHw9FaLRyjljbH0a9lkhllXhi0oFoJsv/ETSiQdYhg4kojVU9jdat73moPAW1PsteruNLEu5OOhCADKMIp8PKrNmOzRXb/p9lGuQtt7Pcz6RfB50eCP9uLhEHhRksgzEtwfUXEjs9WeLdWdIZ4dyMAnHs2oXYZvYwFr41shxtCR+7ieAHmUeWxfK/7V2FLqx12Glw5XCKmp+gcAtT3S4sLF6K+CEebWHQJGDgnQfLIPrIQiw+kK898/bLpapeUi+pnWbUSCnzLZ+Vrc7QU7vKsstAGMQpONtNrp6UvxYlLelYQejllzvSQirac9qk8CWvNny+9Qd0e7OyRKIDESFTHJ6+UPRWsd/RNyyYw7eHI16x8tPXZgP77z7yYAtvgdF1moMMCoQXunmzywug4QoAR6j7WJIw9BuVqT3xC0yDX2QUmjDnSxoxusSm8JE6ZawQsXge5MLDXaDMuXO87XyJtTuUd1ha8QFhA2Xh+PMSI1ZCHWSylpaBSd7BhBdOJco0dZf1eKEcxeB/lUUbt1naoXLEqnB2vzCsLJ9A9q8IVo6x2ua4CAiaAVz8vDmPfI26Bcl6LsnuJ5TF0FQ9JwjkLnTTLBvud5+JuOKCO8p2i5sRMKE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261009223327099003)(261009223027099003)(261009221727099003)(261009221227099003)(261009220027099003)(261021135927099003)(261021130227099003)(261021123027099003)(261022105027099003)(261022075727099003)(261022113327099003)(261021121427099003)(261022115727099003)(10067099003)(56012099006)(3023799007)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?t9rRBGmXZZsUgQmi03TeTKto6chfdPpR1Jvtto+yTn7vAviuKvoXUI/loXt9?=
 =?us-ascii?Q?yJS1FU+6ZKtzcDUpJewc2KmrTablOSLAhawZwPH5FWgGAzrYSH+5NPPxgGCd?=
 =?us-ascii?Q?36rWHinRq78KXPrNO7+xLJdos02/JpC8DfrusFtdkS8jUJeAylvrKvEJZ03I?=
 =?us-ascii?Q?6QnowI2rxeTIO85I/MkRkXNZi2hhu6nBXM2ntcvRsydajTWHiyO+RCKASNGu?=
 =?us-ascii?Q?XecdUImklZC6wbUz1zaQw39Oi8iRSC4zFu+x+03wDtO5jGzcLJTiz7/Hf9RQ?=
 =?us-ascii?Q?9E6bx+usBMCfL1ZyR/1VtDNk3avD+lBSzcQFYe38oVXFSPMkxY6SW82/DuPM?=
 =?us-ascii?Q?IWRLb0nEpKoaTptXZf7ctC4TNfey+bW/qTDUoc09NClWrqeG5WxsCpScR4CQ?=
 =?us-ascii?Q?6p/+ZaCY18t5gOdnOm9p3pbywdub5jVO56fTm6Eu/EGPBJsZ/cJK5kGvqF7m?=
 =?us-ascii?Q?o85p3xZlo1InOg8UHHV0zQIgBgb6pllVGT6NwOna3F7p06FleQzD95RFjyWb?=
 =?us-ascii?Q?/bxt89iqH2Ukbx9TjlXGN22hmOOL2AqL6kJTBcCxjAArMUI6qmcpKg2j77Bf?=
 =?us-ascii?Q?a2FFSmvmT66jJBdXcnE0SfVvhxtjlhiaEUyr8DSPuYBEKzlSpRmCW306LY/o?=
 =?us-ascii?Q?Y0qkTImWmL35OzF3Z0Xy2aWje75oPNqsT2C0GZpfYeGNel+p7rltHKyKw7kW?=
 =?us-ascii?Q?Fu47HsV4jt2YvhXhn36EUGSWQUIS7RWSOJN4eATxodgKmi7gGEm7ljwBRzSR?=
 =?us-ascii?Q?iS2bcJEXCyoHLiRWt7WxXe0ZTFBThKoLMzuA+f9zZNSzoFingvebvhWXu0r/?=
 =?us-ascii?Q?A/XCOmTHoHiNBKap1uvAPoNRSGLjcPA+M/BoMH7UU/FYKok2mg0jCGOWXTOZ?=
 =?us-ascii?Q?6ETWkUaNxCiWIsPrERKkEKn1RPt6TpHpjhGVkL1D3ma1NFXyxjJT2m2Slar9?=
 =?us-ascii?Q?fPX7DD0/KUH++JZ9p0+/ru3e8B+GpH2UF7UvKY6UYAx+UIZFX6xauyrerkph?=
 =?us-ascii?Q?AiUg0Ln+y7mynHCfL9hOprVA2jIBzL94vvHl7YxpAcKamAtX+HURXNO0aU8L?=
 =?us-ascii?Q?oKUM5pDpepx2Vwrf6CWix23xXrp9imZzrSJR2n7yLq6RGpUzN77fWdJl27cU?=
 =?us-ascii?Q?nRbzkhvl9kdUw9Nsf9XpwStqlyiYA2Rs4JOswCJsNs6WEjdZbh42FXjwSdPp?=
 =?us-ascii?Q?KhG6zveHA2K5KKi8SqSTz/S0A65Ksi2/xIhg3A6nGoa4jm7pA9EI/c7EZ+Z5?=
 =?us-ascii?Q?cyXqp+Ji4Bouts57BHKVPrqbcX2lmDLB0DQtEWWU6IiZHJP0fNfdCDv2sVlm?=
 =?us-ascii?Q?rDrjF2jzZrnShgvsyp64tm1cdLzMd8L274hQc80fqqoNSXBUw82c/h8gSMru?=
 =?us-ascii?Q?dafKk6YS1YiMpvMBAtqlput0ULql6djuOSQf9c3AEiCMFS5nJZuCDU2tw3JJ?=
 =?us-ascii?Q?+NHmAzl6S0T023AfZ0GjZsZL20ccqG0FAO6IwqWvdV05mi9KCHJeZ20uD4tj?=
 =?us-ascii?Q?iFSu6aMfMQp10Rac/CZtUZvO9Gkq7cEed5T857JRk0d5I8DGCxu0YWOgALLf?=
 =?us-ascii?Q?R3FFCbJnoqyBI3FHT5xNyU9M9MMqJ5Fd+STGKo6ulGEY2+rS4F/9PkCYYI6Z?=
 =?us-ascii?Q?n0tVrWOKPW4gs748NrErKXt288gKzD+ST064ajdHYlbE3/0rwXnaAXwtoX20?=
 =?us-ascii?Q?kUIP8CxyQz4for0sVjOjcsXnTuM1aVnj1AIAgGhA1y1VssCqZkobYRQ1j70k?=
 =?us-ascii?Q?5867YwuR8Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 1dujWn67tfVjchwCBvDRHfYLdGZ/oN4+zVrwCvyweMEBRX5ugrWxQpsZEf+HNHe2xZCdeQ9afpgLd5RjQk/4CZKz25k2UytoTpwwYDszO4hx+zvgdwXRK7sIaQz4/R5pnFTGxNPqHb1Xw9lZqYiCde5NVhBz0yn1nFCkkgNX1hOD9hXo7VdElEvUgGck/AqWAapw84z405X+J0zH9hMOmrvWg0/nBjWQafzQZCF09AWN0EQFkLKv5eicYguSuKmU6CBaxyg7BmnF52DBSdhyviIFxMAaH2nAnlpeEnkrWDUd6FD3iwNLv3P3ge7g9/fq3rBhqQaQhiakwO/AyppePA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35fc6574-feb9-44ff-8f2e-08df31096835
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 13:27:38.2110 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YsOOv/pHYkAU2O1UYip643aNbhCAv6SS5Oq9WbSLftRvqWKYfiAXUDLmmXGFkD0kNNWEy2vhZQlALBl7MkKe4C2N1aLnBSecwlMlWaxhKGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6445
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Kumar G, Naresh <naresh.kumar.g@intel.com>
> Sent: 23 October 2026 11:36
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Kumar G, Naresh
> <naresh.kumar.g@intel.com>
> Subject: [PATCH v5 1/7] drm/xe/devcoredump: Capture GT fuse registers in
> devcoredump
>=20
> Capture fuse-related GT register state in the Xe devcoredump to preserve
> additional hardware configuration information for postmortem debugging.
>=20
> Add generic register snapshot storage and helpers for capturing, printing=
, and
> freeing MMIO register dumps. Use them to record both primary GT and media
> GT fuse register state during devcoredump snapshot collection and print t=
he
> captured values in the coredump output.
>=20
> Also add the required GT register definitions for RPM and mirror copy-ena=
ble
> state used by the new dump paths.
>=20
> v2:(Sashiko)
> - Fix GT/media fuse snapshot capture to use the correct GT context.
> - Add non-fault GT force wake for cross-GT register capture.
> - Skip reading registers when SR-IOV VF.
> - Skip media GT capture when media GT is absent.
> - Add RPM snapshot print/free handling explicitly.
> - Add POWERGATE_ENABLE register to get render awake status
>=20
> v3:(Sashiko)
> - Check RENDER_POWERGATE_ENABLE of POWERGATE_ENABLE register
> - Replace "render is not awake" message with "render powergating
>   appears not enabled"
>=20
> v4:
> - Reduce multiple apis and optimize the suggest way of struct arrays(Teja=
s)
> - Add document for struct xe_gt_regset gt member(Hook failure)
> - Change struct reg_desc to header file
> - Remove Graphics version check for these registers set
>=20
> v5:
> - Fix possible Null dereference using valid gt instead of q->gt(sashiko)
> - refactor struct member commenting(Tejas)
> - Avoid using xe3p naming as the regs are for all platforms
>=20
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h      |   2 +
>  drivers/gpu/drm/xe/xe_devcoredump.c       | 228
> +++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_devcoredump_types.h |  52 +++++
>  3 files changed, 281 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index f5cd3a94e47f..e93895e0c731 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -22,6 +22,8 @@
>  #define   MTL_CC_MASK
> 	REG_GENMASK(12, 9)
>  #define   MTL_CRST					0xf
>=20
> +#define RPM_GCD
> 	XE_REG(0xc98)

#define MIRROR_PM_DEBUG ? Please make sure you use spec name as is. Apply t=
his to everywhere in this series.

> +
>  /* RPM unit config (Gen8+) */
>  #define RPM_CONFIG0
> 	XE_REG(0xd00)
>  #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK
> 	REG_GENMASK(5, 3)
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c
> b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 133cbe196d66..f59f93ba5949 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -25,6 +25,8 @@
>  #include "xe_pm.h"
>  #include "xe_sched_job.h"
>  #include "xe_vm.h"
> +#include "xe_mmio.h"
> +#include "regs/xe_gt_regs.h"
>=20
>  /**
>   * DOC: Xe device coredump
> @@ -69,6 +71,179 @@
>  /* 1 hour timeout */
>  #define XE_COREDUMP_TIMEOUT_JIFFIES (60 * 60 * HZ)
>=20
> +#define XE_REG_DESC(_reg, _name)	{ .reg =3D (_reg), .name =3D (_name) }
> +
> +static const struct xe_reg_desc xe_dbg_gt_fuse_reglist[] =3D {
> +	XE_REG_DESC(XELP_GT_GEOMETRY_DSS_ENABLE,
> "GT_GEOMETRY_DSS_ENABLE"),
> +	XE_REG_DESC(XEHP_GT_COMPUTE_DSS_ENABLE,
> "GT_COMPUTE_DSS_ENABLE"),
> +	XE_REG_DESC(XELP_EU_ENABLE, "EU_ENABLE"),
> +	XE_REG_DESC(MIRROR_FUSE1, "MIRROR_FUSE1"),
> +	XE_REG_DESC(GT_VEBOX_VDBOX_DISABLE,
> "GT_VEBOX_VDBOX_DISABLE"),
> +	XE_REG_DESC(SERVICE_COPY_ENABLE, "SERVICE_COPY_ENABLE"),
> +	XE_REG_DESC(RESOURCE_COPY_ENABLE,
> "COPY_ENABLE_GTFS_GCD"),
> +	XE_REG_DESC(XE2_GT_GEOMETRY_DSS_1, "GT_GEOMETRY_DSS_1"),
> +	XE_REG_DESC(XE2_GT_GEOMETRY_DSS_2, "GT_GEOMETRY_DSS_2"),
> +	XE_REG_DESC(XE2_GT_COMPUTE_DSS_2, "GT_COMPUTE_DSS_2"),
> +	XE_REG_DESC(XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
> "GT_COMPUTE_DSS_ENABLE_EXT"),
> +	XE_REG_DESC(XE3P_XPC_GT_GEOMETRY_DSS_3,
> "GT_GEOMETRY_DSS_3"),
> +	XE_REG_DESC(XE3P_XPC_GT_COMPUTE_DSS_3,
> "GT_COMPUTE_DSS_3"), };
> +
> +static const struct xe_reg_desc xe_dbg_media_gt_fuse_reglist[] =3D {
> +	XE_REG_DESC(SERVICE_COPY_ENABLE, "SERVICE_COPY_ENABLE"),
> +	XE_REG_DESC(RESOURCE_COPY_ENABLE,
> "COPY_ENABLE_GTFS_GCD"), };
> +
> +static const struct xe_reg_desc xe_dbg_gt_rpm_reglist[] =3D {
> +	XE_REG_DESC(RPM_GCD, "RPM_GCD"),
> +	XE_REG_DESC(POWERGATE_ENABLE, "POWERGATE_ENABLE"), };
> +
> +static const struct xe_reg_desc xe_dbg_media_gt_rpm_reglist[] =3D {
> +	XE_REG_DESC(RPM_GCD, "RPM_GCD"),
> +};
> +
> +/**
> + * struct xe_gt_regset - Struct for register descriptor list for GT
> + *
> + * This struct is used to reference the corresponding reglist of
> + * Main GT and media GT
> + */
> +struct xe_gt_regset {
> +	/**
> +	 * @gt: GT array indexed by enum xe_gt_type starting at 1
> +	 *	(UNINITIALIZED=3D0, MAIN=3D1, MEDIA=3D2)
> +	 */
> +	struct xe_reg_desc_list gt[XE_MAX_GT_PER_TILE + 1]; };
> +
> +/**
> + * enum xe_dbg_regset_type - debug register set types
> + * @XE_DBG_REGSET_FUSE: Fuse register set
> + * @XE_DBG_REGSET_RPM: RPM register set
> + * @XE_DBG_REGSET_MAX: Number of debug register set types  */ enum
> +xe_dbg_regset_type {
> +	XE_DBG_REGSET_FUSE,
> +	XE_DBG_REGSET_RPM,
> +	XE_DBG_REGSET_MAX,
> +};
> +
> +static const struct xe_gt_regset xe_dbg_regsets[XE_DBG_REGSET_MAX] =3D {
> +	[XE_DBG_REGSET_FUSE] =3D {
> +		.gt[XE_GT_TYPE_MAIN]  =3D { xe_dbg_gt_fuse_reglist,
> +					  ARRAY_SIZE(xe_dbg_gt_fuse_reglist)
> },
> +		.gt[XE_GT_TYPE_MEDIA] =3D { xe_dbg_media_gt_fuse_reglist,
> +
> ARRAY_SIZE(xe_dbg_media_gt_fuse_reglist) },
> +	},
> +	[XE_DBG_REGSET_RPM] =3D {
> +		.gt[XE_GT_TYPE_MAIN]  =3D { xe_dbg_gt_rpm_reglist,
> +					  ARRAY_SIZE(xe_dbg_gt_rpm_reglist)
> },
> +		.gt[XE_GT_TYPE_MEDIA] =3D { xe_dbg_media_gt_rpm_reglist,
> +
> ARRAY_SIZE(xe_dbg_media_gt_rpm_reglist) },
> +	},
> +};
> +
> +static void xe_dbg_reg_snapshot_print(struct drm_printer *p,
> +				      const char *title,
> +				      const struct xe_dbg_reg_snapshot *snap) {
> +	u32 i;
> +
> +	if (!snap)
> +		return;
> +
> +	if (title)
> +		drm_printf(p, "\n**** %s ****\n", title);
> +
> +	for (i =3D 0; i < snap->num_regs; i++)
> +		drm_printf(p, " %s [0x%x] =3D 0x%08x\n",
> +			   snap->desc->regs[i].name,
> +			   snap->desc->regs[i].reg.addr,
> +			   snap->values[i]);
> +}
> +
> +static void xe_dbg_reg_snapshot_free(struct xe_dbg_reg_snapshot *snap)
> +{
> +	kfree(snap);
> +}
> +
> +static const u32 *xe_dbg_find_value(const struct xe_dbg_reg_snapshot
> *snap,
> +				    struct xe_reg reg)
> +{
> +	int i;
> +
> +	if (!snap)
> +		return NULL;
> +
> +	for (i =3D 0; i < snap->num_regs; i++)
> +		if (snap->desc->regs[i].reg.addr =3D=3D reg.addr)
> +			return &snap->values[i];
> +
> +	return NULL;
> +}
> +
> +static void xe_gt_rpm_snapshot_print(struct drm_printer *p,
> +				     const char *title,
> +				     const struct xe_dbg_reg_snapshot *snap) {
> +	const u32 *val;
> +
> +	xe_dbg_reg_snapshot_print(p, title, snap);
> +
> +	if (!snap)
> +		return;
> +
> +	val =3D xe_dbg_find_value(snap, POWERGATE_ENABLE);
> +	if (val && !(*val & RENDER_POWERGATE_ENABLE))
> +		drm_puts(p, "render powergating appears not enabled\n"); }
> +
> +static struct xe_dbg_reg_snapshot *
> +xe_dbg_reg_snapshot_capture_target(struct xe_gt *gt,
> +				   const struct xe_reg_desc_list *reglist) {
> +	struct xe_dbg_reg_snapshot *snap;
> +	int i;
> +
> +	if (IS_SRIOV_VF(gt_to_xe(gt)))
> +		return NULL;
> +
> +	snap =3D kmalloc(struct_size(snap, values, reglist->num_regs),
> GFP_ATOMIC);
> +	if (!snap)
> +		return NULL;
> +
> +	snap->desc	=3D reglist;
> +	snap->num_regs =3D reglist->num_regs;
> +	for (i =3D 0; i < reglist->num_regs; i++)
> +		snap->values[i] =3D xe_mmio_read32(&gt->mmio, reglist-
> >regs[i].reg);
> +
> +	return snap;
> +}
> +
> +static struct xe_dbg_reg_snapshot *
> +xe_dbg_gt_snapshot_capture(struct xe_gt *fault_gt, struct xe_gt *other_g=
t,
> +			   enum xe_dbg_regset_type type,
> +			   enum xe_gt_type gt_type)
> +{
> +	struct xe_gt *target_gt;
> +
> +	if (!fault_gt || !fault_gt->tile)
> +		return NULL;
> +
> +	target_gt =3D gt_type =3D=3D XE_GT_TYPE_MEDIA ? fault_gt->tile->media_g=
t
> +						 : fault_gt->tile->primary_gt;
> +	if (!target_gt)
> +		return NULL;
> +
> +	/* non-fault GT needs the caller's confirmed forcewake */
> +	if (target_gt !=3D fault_gt && target_gt !=3D other_gt)
> +		return NULL;
> +
> +	return xe_dbg_reg_snapshot_capture_target(target_gt,
> +
> &xe_dbg_regsets[type].gt[gt_type]);
> +}
> +
>  static struct xe_device *coredump_to_xe(const struct xe_devcoredump
> *coredump)  {
>  	return container_of(coredump, struct xe_device, devcoredump); @@
> -109,6 +284,11 @@ static ssize_t __xe_devcoredump_read(char *buffer,
> ssize_t count,
>  	drm_printf(&p, "\n**** GT #%d ****\n", ss->gt->info.id);
>  	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
>=20
> +	xe_dbg_reg_snapshot_print(&p, "GT Fuse Register Dump", ss-
> >gt_fuse);
> +	xe_dbg_reg_snapshot_print(&p, "Media GT Fuse Register Dump", ss-
> >media_fuse);
> +	xe_gt_rpm_snapshot_print(&p, "GT RPM Register Dump", ss-
> >gt_rpm);
> +	xe_dbg_reg_snapshot_print(&p, "Media GT RPM Register Dump",
> +ss->media_gt_rpm);
> +
>  	drm_puts(&p, "\n**** GuC Log ****\n");
>  	xe_guc_log_snapshot_print(ss->guc.log, &p, ss->gt);
>  	drm_puts(&p, "\n**** GuC CT ****\n");
> @@ -146,6 +326,18 @@ static void xe_devcoredump_snapshot_free(struct
> xe_devcoredump_snapshot *ss)
>  	xe_guc_ct_snapshot_free(ss->guc.ct);
>  	ss->guc.ct =3D NULL;
>=20
> +	xe_dbg_reg_snapshot_free(ss->gt_fuse);
> +	ss->gt_fuse =3D NULL;
> +
> +	xe_dbg_reg_snapshot_free(ss->media_fuse);
> +	ss->media_fuse =3D NULL;
> +
> +	xe_dbg_reg_snapshot_free(ss->gt_rpm);
> +	ss->gt_rpm =3D NULL;
> +
> +	xe_dbg_reg_snapshot_free(ss->media_gt_rpm);
> +	ss->media_gt_rpm =3D NULL;
> +
>  	if (!IS_ERR_OR_NULL(ss->gt))
>  		xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
>  	ss->matched_node =3D NULL;
> @@ -319,6 +511,27 @@ static void
> xe_devcoredump_deferred_snap_work(struct work_struct *work)
>  	}
>  }
>=20
> +static void xe_devcoredump_capture_gt_regs(struct
> xe_devcoredump_snapshot *ss,
> +					   struct xe_gt *gt, struct xe_gt
> *other_gt) {
> +	ss->gt_fuse      =3D xe_dbg_gt_snapshot_capture(gt,
> +						      other_gt,
> +						      XE_DBG_REGSET_FUSE,
> +						      XE_GT_TYPE_MAIN);
> +	ss->media_fuse   =3D xe_dbg_gt_snapshot_capture(gt,
> +						      other_gt,
> +						      XE_DBG_REGSET_FUSE,
> +						      XE_GT_TYPE_MEDIA);
> +	ss->gt_rpm       =3D xe_dbg_gt_snapshot_capture(gt,
> +						      other_gt,
> +						      XE_DBG_REGSET_RPM,
> +						      XE_GT_TYPE_MAIN);
> +	ss->media_gt_rpm =3D xe_dbg_gt_snapshot_capture(gt,
> +						      other_gt,
> +						      XE_DBG_REGSET_RPM,
> +						      XE_GT_TYPE_MEDIA);
> +}
> +
>  static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>  				 struct xe_gt *gt,
>  				 struct xe_exec_queue *q,
> @@ -328,6 +541,7 @@ static void devcoredump_snapshot(struct
> xe_devcoredump *coredump,
>  	struct xe_guc *guc =3D &gt->uc.guc;
>  	const char *process_name =3D "no process";
>  	bool cookie;
> +	struct xe_gt *other_gt;
>=20
>  	ss->snapshot_time =3D ktime_get_real();
>  	ss->boot_time =3D ktime_get_boottime();
> @@ -342,11 +556,23 @@ static void devcoredump_snapshot(struct
> xe_devcoredump *coredump,
>  	ss->gt =3D gt;
>  	INIT_WORK(&ss->work, xe_devcoredump_deferred_snap_work);
>=20
> -	/* keep going if fw fails as we still want to save the memory and SW
> data */
> +	/* fw_ref_other must stay in scope through the register captures
> below
> +*/

May be misplaced comment? Needed below?

Tejas
>  	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>=20
>  	cookie =3D dma_fence_begin_signalling();
>=20
> +	other_gt =3D gt->tile->media_gt =3D=3D gt ? gt->tile->primary_gt
> +					    : gt->tile->media_gt;
> +	if (other_gt) {
> +		CLASS(xe_force_wake, fw_ref_other)(gt_to_fw(other_gt),
> +						   XE_FORCEWAKE_ALL);
> +		if (!xe_force_wake_ref_has_domain(fw_ref_other.domains,
> XE_FORCEWAKE_ALL))
> +			other_gt =3D NULL;
> +		xe_devcoredump_capture_gt_regs(ss, gt, other_gt);
> +	} else {
> +		xe_devcoredump_capture_gt_regs(ss, gt, NULL);
> +	}
> +
>  	ss->guc.log =3D xe_guc_log_snapshot_capture(&guc->log, true);
>  	ss->guc.ct =3D xe_guc_ct_snapshot_capture(&guc->ct);
>=20
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index a174385a6d83..e2fac33dce09 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -14,6 +14,48 @@
>  struct xe_device;
>  struct xe_gt;
>=20
> +/**
> + * struct xe_reg_desc - Register descriptor struct to make reg list
> + *
> + * This struct is used as descriptor containing reg address and name
> + * of the register to dump its value during coredump for debug purpose.
> + */
> +struct xe_reg_desc {
> +	/** @reg: The register */
> +	struct xe_reg reg;
> +	/** @name: Name of the register */
> +	const char *name;
> +};
> +
> +/**
> + * struct xe_reg_desc_list - Struct for register descriptor list
> + *
> + * This struct is used to reference the corresponding reglist of
> + * various component
> + */
> +struct xe_reg_desc_list {
> +	/** @regs: Pointer to an array of register descriptors. */
> +	const struct xe_reg_desc *regs;
> +	/** @num_regs: number of registers in the descriptor list*/
> +	u32 num_regs;
> +};
> +
> +/**
> + * struct xe_dbg_reg_snapshot - Register snapshot
> + *
> + * This struct contains the register values captured at the time of the =
crash.
> + * It is used to store the register values in a human-readable format
> +for
> + * debugging purposes.
> + */
> +struct xe_dbg_reg_snapshot {
> +	/** @desc: register descriptor list. */
> +	const struct xe_reg_desc_list *desc;
> +	/** @num_regs: Number of registers needed for capture. */
> +	u32 num_regs;
> +	/** @values: register values*/
> +	u32 values[];
> +};
> +
>  /**
>   * struct xe_devcoredump_snapshot - Crash snapshot
>   *
> @@ -35,6 +77,16 @@ struct xe_devcoredump_snapshot {
>=20
>  	/** @gt: Affected GT, used by forcewake for delayed capture */
>  	struct xe_gt *gt;
> +
> +	/** @gt_fuse: Fuse snapshot */
> +	struct xe_dbg_reg_snapshot *gt_fuse;
> +	/** @media_fuse: Media Fuse snapshot */
> +	struct xe_dbg_reg_snapshot *media_fuse;
> +	/** @gt_rpm: GT RPM snapshot */
> +	struct xe_dbg_reg_snapshot *gt_rpm;
> +	/** @media_gt_rpm: Media GT RPM snapshot */
> +	struct xe_dbg_reg_snapshot *media_gt_rpm;
> +
>  	/** @work: Workqueue for deferred capture outside of signaling
> context */
>  	struct work_struct work;
>=20
> --
> 2.43.0

