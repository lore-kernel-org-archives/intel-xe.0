Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66CA606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 06:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j+zaw3N7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7148D10E35A;
	Mon, 26 Oct 2026 06:35:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35CC10E35A
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 06:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792996541; x=1824532541;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qQ9SL8Bmq+KjyFZmhAmbKM0976KbYtvI6OfX1FV/ZAA=;
 b=j+zaw3N7TxgVCh1BHdQ89e2WqeX9emxz3Qk1HeWMQAD9Q2WW0XNv8MNm
 WzaQB0aioT0KFndKPqBzMJCmodaZdKswd1FwQKwvqGYlw9i+intcorWq4
 VDtPEe69ELxTgb/kcO+noReXhocJg0ZhlEzZ43fGmbE2YGTL5AEybWyh3
 t2e3y6Mi9WY0OSVxDgHsZDLwKVoOPOzcqeJNsxWXO8b3c5opJJ4IJHbH3
 dt5DIUU5mmuTK2t5vZH9zQ/TGXe7noFFKk6+2pjBQMcbbf0lqXciCYj/i
 kvhrUZKmiRPBBUx/HH2NkLa4NvdZJ5izMZIEsC9hu++JPutIEHzbeoVex g==;
X-CSE-ConnectionGUID: EDMydJSwR/eTSkjMD5DS+Q==
X-CSE-MsgGUID: 6lM/FieYQY6QxSrV9WBEHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1742939"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1742939"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:35:40 -0700
X-CSE-ConnectionGUID: OGOf8MH1TQGm4jN/zxsuIw==
X-CSE-MsgGUID: ltpWc9iUR/G3BbgO3t2G/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4159925"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:35:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 25 Oct 2026 23:35:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 25 Oct 2026 23:35:39 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 25 Oct 2026 23:35:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NmqZA/lmvCHMRxikG8nwD7etU0gI2nLnVVv6sZs1PTyfET5KZ7PN+j5dMlPXvLdP8VVCsBfqBvrHqxK2v/I5SBYU+iBOk0owUmM9IZYXMXoBw4JGDcEzCii31VtYiAaqTHFXC8Eyp4O3BSa3HaaxDvfqrf7GM96j7UJ5Fr/6nJo0IQh9N8MvO28EVTZiyaJCreN4ekP/u7Std1RVcrbCnh3QlajVGiWdOvzYeXqZizas1aL7Tz4QiXBYQrugsv90gbVMAnxWoj50Cw2yDxeILmhT9wnXSXdyujh6XiKm5zaArK8pH3a0IxCMsvryauW6bt9/lndBNwrL3gxRsflTFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoVuRIA7uFgVLRqpzxwGYooRYkLKyoyaTiQhnKvsFTQ=;
 b=XNzggJyptlXn+bQIrl8C2ZiXDs8mj44eNQMajW9H+KZuQuMKYLagIe6L2Xmp2dJXh+m0ukiaWp0/NDxUx9RKGacpHKOshzmUJBUX/SUmj2Iciu/r4CGjU40F2SmQHrQnwFlZETmsRzCdigVEd46O9CRAn0zvvNigdo6nX8kTVDacpJsKY02hVSqJsA3B/qeFaaCSY+hZcnp+4aSHtN/5BU3ulz3J/YVUuGUNqgjSzm79fc9Yf9j/vmJFYSOOCnygPS4iyF9dOD77fnUWeCXR/if1JmRoOpIuwsXlP4pkRNnH8It1N4rxhFcRHQ0GS8u8vOK4hGdiQb+ybmUP1bq5TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by LV3PR11MB8530.namprd11.prod.outlook.com (2603:10b6:408:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 06:35:37 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 06:35:37 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Kumar G, Naresh" <naresh.kumar.g@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v5 2/7] drm/xe/devcoredump: Add GuC register snapshot to
 devcoredump
Thread-Topic: [PATCH v5 2/7] drm/xe/devcoredump: Add GuC register snapshot to
 devcoredump
Thread-Index: AQHdYrTva9yawoFTPka3eETvqP5a0bcPYqxg
Date: Mon, 26 Oct 2026 06:35:37 +0000
Message-ID: <DS0PR11MB87180C685A2BE7BAB595940381612@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261023060554.2643515-1-naresh.kumar.g@intel.com>
 <20261023060554.2643515-3-naresh.kumar.g@intel.com>
In-Reply-To: <20261023060554.2643515-3-naresh.kumar.g@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|LV3PR11MB8530:EE_
x-ms-office365-filtering-correlation-id: ce91aa43-d8c8-4dd2-4d74-08df332b5890
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|23010399003|376014|1800799024|38070700021|4143699003|11063799006|56012099006|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261009221727099003|261009221227099003|261009220027099003|261009223327099003|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: /OaxLigIxlc6Oqwvua9TsNoRl14zQcQXYARieaGwU9436n+6VIbdK4KkdU/T4ZJD2USmeI5prdoiPpaUZBhgSq4J9rQd+Bdg22mwONN4jkqx22u3PjsuxJIwgX9Nc/Oen8l/yoEljZoJa7DipnboE21EA6K7FEw9FWAEowCaSLYWt0v8TfZiEGwq0BfJEmnOl9xxPQVNrEmbqUI6o9mEBPgg0APvEvOiDQfluQXyaEbYeyCbwLVzeJYM6JnvkgZt2tGJbSdORuu5y3JE8Zekh4NUhV98GGOYOtW6xVhmKuab7wK+PKI6gnEcjsJrlqM+QVkXbnArOyojuTbVHdv/+FdFdzdwmiznQfowHevCokT+opM8T/q2OmI8YkZboNw2ncI1OjVeJkeMfquLjTXxd7oBwFZ4/3xl+G+4bixLIfd33K0kJzXqa8U1Lh8p9lOlfe7f4hpvE5dmFU/H2ifTmMwSXkQNuXKCGkVl1+YF+adcB9Q9E/IbiVj2vXPuY6dzixicHxbjMyfnXJ1xwjI1otyOLPrpeXsU1naW93en50kCD5kWugUpw16HbxqPiONpf0NlGna7+R3gvOqi/Fakr+YaRINGustobmkgNUEArFFpleoowI1SxgrfMFu9frYN7Lvj0D2aqRSxBB/2MKq5KTJ5NixWXMr787SBY200QHQ4BpEh/Wm54LB/inIR706A4bar+YckKfzUrs1eAQu9srDQ7XgwaD78mcj44CCHte8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(23010399003)(376014)(1800799024)(38070700021)(4143699003)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261009221727099003)(261009221227099003)(261009220027099003)(261009223327099003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZAYOX/K8MyhWDJJwHve09rQFY7CVDzSpA6SZcf7iaM/m+PcrsJU63DSxbw77?=
 =?us-ascii?Q?DKNwKpDWTgCALSPWYl8G1sQnJ2IG1C79J+ubIk3p5h/I52p2PYw9ZWfS7iR4?=
 =?us-ascii?Q?MZjTIRjR6SAIIo8LRAblElYif8zfaehgObMkbvaLyUypFi46hEW1JJtmVjFW?=
 =?us-ascii?Q?TkVxqe3aE/xWAoa+kxRK+nJmULkPoeTKqrVKD4wgPKvavRsWtYFg0dmyYO6U?=
 =?us-ascii?Q?G/p9uiGotE0rdEKYD936F6glwuWatipN3V4q//PzJlPupf6g7k+yUx787oY0?=
 =?us-ascii?Q?pR9VY8YG8akpEJPOF8XtGqYhGuofVl40ZKepSeixkTWRpNgo8t+0ubZF5AqN?=
 =?us-ascii?Q?tA2zqNdJqMFd+5etx/kxEWefsuqSfqEG8GaonTZwhcmoqJgJeIyPM3zv9gXn?=
 =?us-ascii?Q?tJxY9ZHfU11Hni6sS3CXNqX2pbmreb3/A5Xz4BaVmoB2siHXHBp8ELqNwQpR?=
 =?us-ascii?Q?ODnWXtvkKKlq+xXzYr9soHYrVsyZsTVY7eG/59Uja8klYUVJeLdZLPQ5uDtt?=
 =?us-ascii?Q?9UBMsqn5Mgrdk1cQMqw6AqsjCu9/ya8e34FESbWKbmD1XsfJ2/39xetjrZdR?=
 =?us-ascii?Q?4Rgfk9SumsyzUpX+hJitsnLVRgEW826js9P2UdgvkkV5BMVbXwrUmimZ1OiN?=
 =?us-ascii?Q?MA3HQEANVvOZP6wWmtT833m3KANORgvk/3ODDt6iKxH8dPpyt1hLGiiVW51L?=
 =?us-ascii?Q?ImhgWi9CAO7zCB0I8Uss/8vSE2lxj+SadJvJwiiJwdcvFZlTzfotk7w/1UMG?=
 =?us-ascii?Q?1GZl/AP1hoX14zRQoVelujlf7OzENXFKoXxYxD0F592RDW4Dou8cFymjrc/a?=
 =?us-ascii?Q?isBW61/qyNQzYLHe4TCd3SUZX/OkMBtmTK+gNTEbOIo0ks6lTU3tuRSmaC2h?=
 =?us-ascii?Q?cD577Kcg0BsrPGndMpRlOuiMdXqG7PXBQMjPNPVVgIhCo0fjALjrCTnXfDmT?=
 =?us-ascii?Q?mwx46fvC+FFlcOVuDQh3i7PMARMyQgO6KcXVP4FvtZE4aiO3BYQKr4UsE3Oj?=
 =?us-ascii?Q?0DHL3n/622FjAGSAV4Gxku35S/H7HvUGB8+NJXZWVoQhw2uoz4mNhMj/NYf0?=
 =?us-ascii?Q?ken9IscAPzxzQwh0aVg6luAsN5WoSUBEXEoWAhvaVO4ye8gF9fP86z/k0zis?=
 =?us-ascii?Q?atDAgYSJb8Bi0rXwxnzkSNtyFlEGd0qtk212Sj6wDknkrTlZeE66vUyLLQUa?=
 =?us-ascii?Q?HZFS7CiOZQWnuZfXBSvrEIpSkqIVROd07hENuTqGRplxO7OCDnaSIbFLlFBG?=
 =?us-ascii?Q?Zjlz7I3owo+tphJsuhLRsRlHbVmWRURgEoyNLci1FkGkhItTFevu4zp1DAOA?=
 =?us-ascii?Q?8mhyblxooUQGxhv906gItf3Xj7jo4Ikbm2wnrP7zR48PcqOYabWHZcPuLNEL?=
 =?us-ascii?Q?vpbOBEPvbm9oEPKVRCuxGPXnNbQs3f2RcQbHkk/MUM70cxcIdFb41Q6xB75J?=
 =?us-ascii?Q?PIrAmPwanYP30UBybTfoTYtr6q2NvEWElr5+mcdGwtvfSJg0uy92VP6C4hEj?=
 =?us-ascii?Q?/arPnYXgem0uDFsibRHCq5FPfbJY7mxKRc4JBKFB57L8BP61LvL12yhC2yDX?=
 =?us-ascii?Q?cfXAksClEwZFLYXrii77ILz30s1OlzJBM3QJh4En/JEf1VmgUGydPZniVlxz?=
 =?us-ascii?Q?mDllUu1kCE3oD8HwRl5UPyY+jBOgpWXo+XfUdwdW/4qW5ewRPLKtEPdUqfMf?=
 =?us-ascii?Q?VzwNaqifu3F/cgV8+hBvRcA6VqYQ5MxZxGRgY00KsGPj+opZoSy1PJjcBySr?=
 =?us-ascii?Q?yhEIusnmZdLD2qf28T6H2/gAaIf892B31ZlqHXsRZ/kRhiGqVr71ocgSzyfX?=
x-ms-exchange-antispam-messagedata-1: OCcE3L+1xWu6Sg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: KDul7NS4oXbX1DyIPN0lUnixhjSJR81Gmusv0NZOlewNseqdsHWf05+E608u2yqURUB6HBTD8G/xy2x+8Q8Up7jBA5yFpTAasL3X5TfKPokk97AwaX+XvkUR1FEDZWz0Qtx/J8kpYHjeuVUsxx9V6Y7OHkQ0aPMjhy+OK38+P4Q315JHHHnULoQg4ECHYYrmtaSaU8dGskjj0vZzQYrThUHMDfDEUGlBuk2PDwgoh1z8bF1wUGaH/BB8URZHKAAiUQYG5oQx6TENalXQ6KOIeqBKKqkijXv5mTyVt3M8hIouGqaa1X8Ny7DrTi+4tAcjicVzJ/YV4RUIegNAVWtqoA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce91aa43-d8c8-4dd2-4d74-08df332b5890
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 06:35:37.2197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7hvV0SQ1sFDtN3EB3r4Dvg8glPO7o4Lek50peGlyhbIjAB2wPS8Kk5yhXfxBlPOcA/T57OjxgY8ChwHkdh3b/pYwyKdkIp8PBvdSlcqxO50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8530
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
> Subject: [PATCH v5 2/7] drm/xe/devcoredump: Add GuC register snapshot to
> devcoredump
>=20
> Add support for capturing GuC register state as part of the xe devcoredum=
p
> snapshot.
>=20
> Define a dedicated GuC register snapshot structure, record selected GT an=
d
> media GuC status/error registers during devcoredump capture, and free the
> snapshot during teardown.
>=20
> Keeping these register values in the devcoredump helps with post-mortem
> analysis of GuC-related failures.
>=20
> v2:(Sashiko)
> - Reuse the generic target GT snapshot helper for GuC register capture
> - Capture primary and media GuC registers using correct GT MMIO context
> - Avoid reading the same on SR-IOV VF
> - skip reading media GT GuC registers when media is not present
> - drop hardcoded media register address macros
>=20
> v5:
> - Rebase as per patch1 changes
>=20
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_guc_regs.h     |  5 ++++
>  drivers/gpu/drm/xe/xe_devcoredump.c       | 35
> +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_devcoredump_types.h |  5 ++++
>  3 files changed, 45 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index 5faac8316b66..c13ee6e21e37 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -150,6 +150,11 @@
>  #define GUC_INTR_SW_INT_1			REG_BIT(1)
>  #define GUC_INTR_SW_INT_0			REG_BIT(0)
>=20
> +#define GUC_DEVICEID				XE_REG(0xc008)
> +#define GUC_SHIM_ERR_TRAP			XE_REG(0xc070)
> +#define GUC_HW_FATL_ERR				XE_REG(0xc598)
> +#define GUC_HW_NOTIFY_ERR			XE_REG(0xc59c)
> +

Same comment for right GUC register names, with that this LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>  #define GUC_NUM_DOORBELLS			256
>=20
>  /* format of the HW-monitored doorbell cacheline */ diff --git
> a/drivers/gpu/drm/xe/xe_devcoredump.c
> b/drivers/gpu/drm/xe/xe_devcoredump.c
> index f59f93ba5949..49a7c020a161 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -27,6 +27,7 @@
>  #include "xe_vm.h"
>  #include "xe_mmio.h"
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_guc_regs.h"
>=20
>  /**
>   * DOC: Xe device coredump
> @@ -73,6 +74,16 @@
>=20
>  #define XE_REG_DESC(_reg, _name)	{ .reg =3D (_reg), .name =3D (_name) }
>=20
> +static const struct xe_reg_desc xe_dbg_gt_guc_reglist[] =3D {
> +	XE_REG_DESC(GUC_STATUS,	"GUC_STATUS"),
> +	XE_REG_DESC(GUC_WOPCM_SIZE,	"GUC_WOPCM_SIZE"),
> +	XE_REG_DESC(GUC_DEVICEID,	"GUC_DEVICEID"),
> +	XE_REG_DESC(DMA_CTRL,	"DMA_CTRL"),
> +	XE_REG_DESC(GUC_HW_FATL_ERR,	"GUC_HW_FATL_ERR"),
> +	XE_REG_DESC(GUC_HW_NOTIFY_ERR,	"GUC_HW_NOTIFY_ERR"),
> +	XE_REG_DESC(GUC_SHIM_ERR_TRAP,	"GUC_SHIM_ERR_TRAP"),
> +};
> +
>  static const struct xe_reg_desc xe_dbg_gt_fuse_reglist[] =3D {
>  	XE_REG_DESC(XELP_GT_GEOMETRY_DSS_ENABLE,
> "GT_GEOMETRY_DSS_ENABLE"),
>  	XE_REG_DESC(XEHP_GT_COMPUTE_DSS_ENABLE,
> "GT_COMPUTE_DSS_ENABLE"), @@ -121,11 +132,13 @@ struct
> xe_gt_regset {
>   * enum xe_dbg_regset_type - debug register set types
>   * @XE_DBG_REGSET_FUSE: Fuse register set
>   * @XE_DBG_REGSET_RPM: RPM register set
> + * @XE_DBG_REGSET_GUC: GUC register set
>   * @XE_DBG_REGSET_MAX: Number of debug register set types
>   */
>  enum xe_dbg_regset_type {
>  	XE_DBG_REGSET_FUSE,
>  	XE_DBG_REGSET_RPM,
> +	XE_DBG_REGSET_GUC,
>  	XE_DBG_REGSET_MAX,
>  };
>=20
> @@ -142,6 +155,12 @@ static const struct xe_gt_regset
> xe_dbg_regsets[XE_DBG_REGSET_MAX] =3D {
>  		.gt[XE_GT_TYPE_MEDIA] =3D { xe_dbg_media_gt_rpm_reglist,
>=20
> ARRAY_SIZE(xe_dbg_media_gt_rpm_reglist) },
>  	},
> +	[XE_DBG_REGSET_GUC] =3D {
> +		.gt[XE_GT_TYPE_MAIN] =3D { xe_dbg_gt_guc_reglist,
> +					ARRAY_SIZE(xe_dbg_gt_guc_reglist) },
> +		.gt[XE_GT_TYPE_MEDIA] =3D { xe_dbg_gt_guc_reglist,
> +					  ARRAY_SIZE(xe_dbg_gt_guc_reglist)
> },
> +	},
>  };
>=20
>  static void xe_dbg_reg_snapshot_print(struct drm_printer *p, @@ -288,6
> +307,8 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t coun=
t,
>  	xe_dbg_reg_snapshot_print(&p, "Media GT Fuse Register Dump", ss-
> >media_fuse);
>  	xe_gt_rpm_snapshot_print(&p, "GT RPM Register Dump", ss-
> >gt_rpm);
>  	xe_dbg_reg_snapshot_print(&p, "Media GT RPM Register Dump", ss-
> >media_gt_rpm);
> +	xe_dbg_reg_snapshot_print(&p, "GT GuC Register Dump", ss-
> >gt_guc_reg);
> +	xe_dbg_reg_snapshot_print(&p, "Media GT GuC Register Dump",
> +ss->media_gt_guc_reg);
>=20
>  	drm_puts(&p, "\n**** GuC Log ****\n");
>  	xe_guc_log_snapshot_print(ss->guc.log, &p, ss->gt); @@ -338,6
> +359,12 @@ static void xe_devcoredump_snapshot_free(struct
> xe_devcoredump_snapshot *ss)
>  	xe_dbg_reg_snapshot_free(ss->media_gt_rpm);
>  	ss->media_gt_rpm =3D NULL;
>=20
> +	xe_dbg_reg_snapshot_free(ss->gt_guc_reg);
> +	ss->gt_guc_reg =3D NULL;
> +
> +	xe_dbg_reg_snapshot_free(ss->media_gt_guc_reg);
> +	ss->media_gt_guc_reg =3D NULL;
> +
>  	if (!IS_ERR_OR_NULL(ss->gt))
>  		xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
>  	ss->matched_node =3D NULL;
> @@ -530,6 +557,14 @@ static void xe_devcoredump_capture_gt_regs(struct
> xe_devcoredump_snapshot *ss,
>  						      other_gt,
>  						      XE_DBG_REGSET_RPM,
>  						      XE_GT_TYPE_MEDIA);
> +	ss->gt_guc_reg =3D xe_dbg_gt_snapshot_capture(gt,
> +						    other_gt,
> +						    XE_DBG_REGSET_GUC,
> +						    XE_GT_TYPE_MAIN);
> +	ss->media_gt_guc_reg =3D xe_dbg_gt_snapshot_capture(gt,
> +							  other_gt,
> +
> XE_DBG_REGSET_GUC,
> +
> XE_GT_TYPE_MEDIA);
>  }
>=20
>  static void devcoredump_snapshot(struct xe_devcoredump *coredump, diff -
> -git a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index e2fac33dce09..52db64640f89 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -87,6 +87,11 @@ struct xe_devcoredump_snapshot {
>  	/** @media_gt_rpm: Media GT RPM snapshot */
>  	struct xe_dbg_reg_snapshot *media_gt_rpm;
>=20
> +	/** @gt_guc_reg: gt guc reg snapshot */
> +	struct xe_dbg_reg_snapshot *gt_guc_reg;
> +	/** @media_gt_guc_reg: media gt guc reg snapshot */
> +	struct xe_dbg_reg_snapshot *media_gt_guc_reg;
> +
>  	/** @work: Workqueue for deferred capture outside of signaling
> context */
>  	struct work_struct work;
>=20
> --
> 2.43.0

