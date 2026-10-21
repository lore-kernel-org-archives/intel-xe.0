Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4091606A332
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 13:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gPSU2kND
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9B310FE25;
	Wed, 21 Oct 2026 13:39:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A4C10FE22;
 Wed, 21 Oct 2026 13:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792589946; x=1824125946;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eTmis1Dc+9PD850zMnha9LXUqJYcHCFhdEW//WpVTUU=;
 b=gPSU2kND/6594ca48EsxGp8dE/kKgbSanajVS1lwRi4J8auUBv1l7O9r
 RGhhy4ojhwB/AugnSh3WbzRU69P2s10OF1cMhZmxEdlvgDdgHfuj09YXg
 yKQ8+39TnkhgUPcp1/YQ2leCFqOwDqohal3TuWjD8sCT6KMY/vmMrbq5a
 NIq7VsaWzLTxTn+F7ukLzaxiK2sEez56c9p8/IYRGAhFP42ssm7dt8Lnj
 MwgJSaVZhauTfIXiREHgxC48WojdcUyx/TMT0XqbGEh5ZGoV8dmE3lteo
 5BkWR+GwEKRvEkCMwv6R1BZIbo5gH7eyYohzqRDMZI3RhkjHn2OWIuO/d g==;
X-CSE-ConnectionGUID: TdQuicLYRdahj5Xo8sXTTA==
X-CSE-MsgGUID: gZdIsnJNTOaOWYIAKX6TCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1326240"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1326240"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 06:39:00 -0700
X-CSE-ConnectionGUID: LNJP8YBYTXqmDzUgUDEwMg==
X-CSE-MsgGUID: 1J0Cg7wJQz2glJGMC7EqxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3420323"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 06:39:01 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 06:39:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 06:39:00 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 06:39:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4EMGX0bAsMjwY6SFOFppW+19flJlxIPxgolO3EfoO0qo2RtE47v3G6ZBLii9KI7TmEoUwR0IxXmLGvbvPYFE5ZnoMPvU2ZEeBzjRubJDJsQ6Z7tP7yGkZEitJnmwaKljp6F4LrnX/NiXRkVp6F2P7mbLx8/oGm0WMDLWYNNccc3jg08pQ1t0DdjB+DzYkxRWF7CjEk/P94x1ZLm4VN+Kp6m5ITSPm4vbbMNp63Xvzj19zKHKFx12/a798useinFUMggTjLTcIRqtxQgEDMoEBDKvMyJ1dXoMtkAp5089TKvdM+7jjyFB+/6cS+6q2UJBM3vMxib0Z1c1j9iUP2UnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTmis1Dc+9PD850zMnha9LXUqJYcHCFhdEW//WpVTUU=;
 b=jqbnrBxBjPphdsDoCKHDAI5KMMJ5jyKKGTevVYgS7MZ70jsuI36a6Sz0xYPAxR2NMkkIFGJ2VMY3szvcsR8EVLxt6o9Vji1QmEk0F7oel1x3tUfpzLy3ipuYUbS4OHkiiS2AHykRq647d2MiYxWNG3giJBMXCAjm1D3aGhEtrA8Tgts9ECPZhkFPacf/FIPTpSd+qI3iFn6BnPio3C4rc0pBH6G+JiyadX9nVvU4u6Opvj1AEOPITEoT9tTRwTWfV+zrsB3Zo9ozy6NwD8k4dSJ4NByv90Jrgkse0v876wJSWUjlTwHDB5HT0ZGdD6DUG5CGNijzG0L8ODkntV2DLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DM4PR11MB6502.namprd11.prod.outlook.com (2603:10b6:8:89::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.19; Wed, 21 Oct 2026 13:38:57 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%4]) with mapi id 15.21.0496.021; Wed, 21 Oct 2026
 13:38:56 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/mst: let the branch-sink check uncompressed with
 18bpp
Thread-Topic: [PATCH] drm/i915/mst: let the branch-sink check uncompressed
 with 18bpp
Thread-Index: AQHdI/ebEu/tSD4yX0aPvFbhXkgfKbcFPLiAgAM6DiA=
Date: Wed, 21 Oct 2026 13:38:56 +0000
Message-ID: <IA0PR11MB7307AEB15F4A1E9C96DDC752BA662@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20260804094450.125307-1-arun.r.murthy@intel.com>
 <e533815b60c86e9a49aabd9f59096d282707e3d9@intel.com>
In-Reply-To: <e533815b60c86e9a49aabd9f59096d282707e3d9@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DM4PR11MB6502:EE_
x-ms-office365-filtering-correlation-id: 0a12b60c-c1ab-4ba8-5cba-08df2f78a7db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|38070700021|4143699003|11063799006|10067099003|261009223027099003|22082099003|56012099006|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info: uj0pukF8ihvMx7NmUnjkcBHMoUmOBa3BcsLvZUTTcq5Zr/XSga8WctzxxU3tFt79uEkXeOK9t7Jt9glPC6ApIG29QUsQZudCU+C8xBuMMHgvaoGAXFQl6CO6JdR3Zm2Sx23ozaerh76XwQqVbc6lFRi66Y1gB04VPwVfFi1gzYlRiLzWnIDJpMh39hi9/q591ysU/Xmjwv+Evi3HQPpwZCWGV5a0N9e90O2qHs453QXbjshm11VKde+rnW3d39TjMwJbvYxfoe10V5hm/f9xmOTYhf7mtlV1irWbqdjl9+9yVZ2dFS+YtZ/st6HXUBT0lFXJnD/yv50O1zdLNMeL9SyEGhZIby0Il8eTQRuTJ/JikL0vz/v1PgXi2T8AV3i1N0FHgCfCPO3EwbqvAX9emIk53Z43Fkl9dmbcdpKD6vqZtJpLvYJv0qwpdHZ72305YZeiXoDTkci6hXICvhlRqDwj11u6Jb0xevKh6JYvUm3YGSHwalJDNew8goFVCcEKHZNqVqm5B8qxavo9Mnbu5TEcxJQyJ2Bxr/gBL3IfjMyBAJW3JG73OfvwoQHBM/ioLD1X2FhPLr4hSVRvkcOgi89VSmeEDpJUBrBR59NMhL7+CX0XoNvetInSxNYJWeUHE3ta/WrQgc3Mzp0bw1HgsTIx5bzi2jErcz4CTKD4ne0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(4143699003)(11063799006)(10067099003)(261009223027099003)(22082099003)(56012099006)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a24zdXNXK0FwMnZHdW1sL09nbkUrbGEvRWJyUkVrZ2hJYmJlTUhCRjVoWjU2?=
 =?utf-8?B?amNsQzczOVlPa3FVc01XRTg3Uit0eXE5dElFTkZqdUswU214MHZBcXZEUmpx?=
 =?utf-8?B?LzUzVnRYZ3ByY01idXlGMm9QK0pJYmhtUVorMjJpSzg3bDBxWGhWNWI4cHNi?=
 =?utf-8?B?dVp5bkRDaERYMmVyRkIrajVFQW1FdWxLeDBmblJodi9qcUw1aTJsdFpNVS9F?=
 =?utf-8?B?L21xdVhvcG1GTGx0dGRTTE5XQWRTV2h3d0lmb0xab3BJaSt1Slc5RzJXS3Jm?=
 =?utf-8?B?MVFsaGw5QXJ6dVhROFJ0c0ZpQllSYmQ2UFVMd2prRVF4bEdGeDN4T3hwRng1?=
 =?utf-8?B?d1lnT1gxTGxxR3FqSEd0cDgxazhrcEFQRWxOU1pGeUFQL0JIOVE5eWNhcjE4?=
 =?utf-8?B?T01KYi9XU3Y0U0FaMmx0Vk81VnBOSXZCL3lvTWpON2ZJekFRZEF0WUoxZlNM?=
 =?utf-8?B?QzYwTmpFV3RoOG51SWprdTNkdXgyYnpDeW8vT250L2hicTV4ZjJiYmU0eHFF?=
 =?utf-8?B?aFZnNVJBRWtYUHRPRVFzc0JUSlNoUlc5WnR2Q01lZlZwSURaZU1jRkY3aWZD?=
 =?utf-8?B?ZTZjRHFSNGdmaDN5b2ZKSFMxMUw2TmlPVk1sUkNiR2JiY3k1cnN0R01zSC9S?=
 =?utf-8?B?a2psRXRRdkNEeUFNcm9jUkZjTVBUeGhRS0FpZnhsYmFPamlENStwb2RHVXlu?=
 =?utf-8?B?QkJHeWFxblZBUjBLaWVNOVlucnFZNjdzUllISVNLY2JsMWoxckFWVldPZFVZ?=
 =?utf-8?B?N2ZrU2dBelBHRHBuMmNReVBvNmNWQ21ZVTJaWm1UQ1lqZ2ExQlkxV3lvTG5G?=
 =?utf-8?B?NGpWS3kxY3J1dUxudDVxMzBLYTZIWHI1Q0o2UTJ5TGpZZTliVDE2UlZCOTVF?=
 =?utf-8?B?WFZDZGx0dGVyRVk5R1BzZzZjRmRFVi80TmJadHlOM0MxdjRYUkltbGhwRG02?=
 =?utf-8?B?ZFk0ajh3ZUh4Q1FrbWlvSHlzVHBIYVFrWkJwMi9DY04yTDVaWmx2WElETnJl?=
 =?utf-8?B?NUNsUURPQU9mZXhUQm1udlFXZ24vWU9way9LN3pXL2wvQk5INDRqWmdtazlV?=
 =?utf-8?B?QmE4a2JkbkRMQ1ZYNU1KM3lBRmFDTXZGbjhVMjRGYmRkdzJWamhhazhUQ2tG?=
 =?utf-8?B?ZzRpTWNHa0d5MndVaDNPd1diRmVPYmIzbWVpdlgreHhrYUltMHRkcmJGUkVa?=
 =?utf-8?B?MkcvMEEvMnkrb0FmalZOaTVMUytQTzl2VGNZK0YwZUtwTTZTb0d1bE1hZnJD?=
 =?utf-8?B?MXR5UWwrcjcyOVBBWm9yelFDM1YxQ2huTnl2Y1JESzJOM1NFMXhEaitpd0x3?=
 =?utf-8?B?ZVk3dXpFMUdhcEd3OXBkNEVJR3lWMXo0bkd6NXBxQmtwNFppVFA1MUhiRUc3?=
 =?utf-8?B?WWN0ZCtjcU1oL1RWQ21VcGZnd1BRR3hSUFZYTXpZUWQ2WXJYT0NackVsaHVR?=
 =?utf-8?B?ZzVjb1RpWk1MVng2WEZZZFJUaFRXTDFIbE11QUVuRy83angvb3NGamNqS3F1?=
 =?utf-8?B?ckx6N3BWVmVIbVpKOVlhU0VQYU01N05hN1psZkdRcGUrSGp5eVhKMnR6dWZE?=
 =?utf-8?B?UEJ6TVRiMWllczVSVmVLRXJySUdSZm1EZ1J5YVlUbkZuakp0THR6Rm1xck1i?=
 =?utf-8?B?RmhTVEpnQmEzOUc2TVpjVm5oWm92VjBjQ3BreC9tUDVYRWt0emZROEdpbzRW?=
 =?utf-8?B?dVNuQmxIODhmcTJBeG96SDVVZGR6dnpacnV1eXErblVwZEtWdjZRbUpFdHFx?=
 =?utf-8?B?THFzdlNtUGZ2RllwQ0hWU1JWaFRoNEduS05PVGtZYU1mNGFuOGJqdExmNmQz?=
 =?utf-8?B?YVBpT3FWNmlSZTJ3UENjS1BlcHFVWlV6Wmo1YUV3bnF5VWtCSWk1V3FlQWFz?=
 =?utf-8?B?ZzcrNFVBM3pDMjExY3ZsRS9qVndQQXZLQXFIcUc5U3NZNlRITFVwQ25vRmMy?=
 =?utf-8?B?VHcxTTFpbG00ZlU0K0lJVlVRc0lJUlFUeWVUclZUbTdxUFdydjc1Y3AyRjBT?=
 =?utf-8?B?OGZpeWpiVThuUk55Tnl6UmVMTFRhSmlZbXpHbjhsZ2JLQkdCc09EcUs2Y0x0?=
 =?utf-8?B?SFBXaTcxd3ZlYTA4ZFhQT084OTdZWjUwenBodnUyNno2YXVYR3JtdXArY05Z?=
 =?utf-8?B?QzV1cnRCbHNNSEVKdllHZjFtaVhHYnpiVUF0V2pnZ2RLTjh2Ykt1cldaY25X?=
 =?utf-8?B?b3QvVW03eVIvV2J0NmxtajFwd2sxVklZVU1oRU92bFpoa0NQNnUveUdtMVJJ?=
 =?utf-8?B?SzluSlhXTThQYlkrMzZ5eFJRZENDaWhyVUhVazhtZURzNEM1eWJmaUlwUkZH?=
 =?utf-8?B?ZkExYkRZaHFUY29sZHV1a25xcFdRQUJXOFBTbW1taXNlbmpaaFZVZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: uCSA0Kwl8LJp/NYP2y2bOgYuvzsIpqEMK3Q7Z4HcIUHrcKUZzQdyyks2iSnExfV8wvElRsuTNWXZdGryTm7NM+juuE2E1hBacebENg20O+H9ASeplU3unEhCnoP80LA/jzRHqcr5ovwq+jM2JacgZG7Eiu7XgFikXtZTvAhN5om/E6bv83r9iPSFXIAEU020suB1eTDa1w4mpGKhokR/sPSOR9b54/kHA7/aBdRp14ufXbo+KjaYrY6CUDhyaZD9WXx6H0TgBDXSeHVKbQo49Wgxai1FNeXH3k4oeF+wh2+9AWRNTch9t7zGnLOrZQ781VH19Un2b38UKrf6TqJUJw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a12b60c-c1ab-4ba8-5cba-08df2f78a7db
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 13:38:56.8095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GZN3zxietXXcSevKE75U11StvQXeUmCHrKKviCHvHqpgkkb+RK12PbHp62ZSwDqo7pXulv0ONSPlHx9JZAz+2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6502
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
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbmkgTmlrdWxhIDxqYW5p
Lm5pa3VsYUBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAxOSwgMjAy
NiA1OjM3IFBNDQo+IFRvOiBNdXJ0aHksIEFydW4gUiA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+
OyBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiBpbnRlbC14ZUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4gQ2M6IE11cnRoeSwgQXJ1biBSIDxhcnVuLnIubXVydGh5QGludGVsLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2k5MTUvbXN0OiBsZXQgdGhlIGJyYW5jaC1z
aW5rIGNoZWNrIHVuY29tcHJlc3NlZA0KPiB3aXRoIDE4YnBwDQo+IA0KPiBPbiBUdWUsIDA0IEF1
ZyAyMDI2LCBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4gd3JvdGU6DQo+
ID4gbXN0X2Nvbm5lY3Rvcl9tb2RlX3ZhbGlkX2N0eCgpIHVzZXMgYSBzaW5nbGUgMThicHAgZmxv
b3IgZm9yIGJvdGggdGhlDQo+ID4gc291cmNlLWxpbmsgQlcgY2hlY2sgYW5kIHRoZSBsYXN0LWJy
YW5jaOKGknNpbmsgUEJOIGNoZWNrLCBhbmQgb25seQ0KPiA+IGRyb3BzIGl0IHRvIHRoZSBEU0Mt
Y29tcHJlc3NlZCBtaW5pbXVtIHdoZW4gdGhlIGJyYW5jaCBpcyBpbiBEU0MNCj4gPiBwYXNzLXRo
cm91Z2ggbW9kZS4gVGhpcyByZWplY3RzIG1vZGVzIG9uIHRvcG9sb2dpZXMgd2hlcmUgdGhlIGJy
YW5jaA0KPiA+IGRlY29kZXMgRFNDIGxvY2FsbHkg4oCUIHRoZSBzb3VyY2XihpJicmFuY2ggc2Vn
bWVudCBpcyBhY3R1YWxseSBjb21wcmVzc2VkDQo+ID4gYW5kIHNob3VsZCBub3QgYmUgZ2F0ZWQg
YnkgdGhlIDE4YnBwIGZsb29yLCB3aGlsZSBvbmx5IHRoZQ0KPiA+IGxhc3QtYnJhbmNo4oaSc2lu
ayBzZWdtZW50IG5lZWRzIHRvIHJlbWFpbiBhdCAxOGJwcC4NCj4gPg0KPiA+IFRoZSBzb3VyY2Ut
dG8tZmlyc3QtYnJhbmNoIE1TVCBsaW5rIGNhcnJpZXMgRFNDLWNvbXByZXNzZWQgZGF0YQ0KPiA+
IHdoZW5ldmVyIGFueSBkZXZpY2UgYWxvbmcgdGhlIHBhdGggKGEgRFNDIHBhc3MtdGhyb3VnaCBi
cmFuY2gsIGFuDQo+ID4gaW50ZXJtZWRpYXRlIGRlY29kZXItaW4tYnJhbmNoLCBvciB0aGUgZW5k
cG9pbnQgc2luaykgaXMgYWJsZSB0bw0KPiA+IGRlY29kZSBEU0MuIEluIGFsbCB0aG9zZSBjYXNl
cyB0aGUgc291cmNlIGNhbiBlbWl0IHRoZSBzdHJlYW0NCj4gPiBjb21wcmVzc2VkIGFuZCB0aGUg
Y2hlY2sgYWdhaW5zdCB0aGUgc291cmNlIGxpbmsgQlcgc2hvdWxkIHVzZSB0aGUNCj4gPiBtaW5p
bXVtIGNvbXByZXNzZWQgYnBwLCBub3QgdGhlIHVuY29tcHJlc3NlZCAxOGJwcCBmbG9vci4NCj4g
Pg0KPiA+IFRoZSBsYXN0LWJyYW5jaC10by1zaW5rIHNlZ21lbnQgaG93ZXZlciBpcyBvbmx5IGNv
bXByZXNzZWQgd2hlbiB0aGUNCj4gPiBwYXRoIGlzIHRydWUgRFNDIHBhc3MtdGhyb3VnaDsgaWYg
dGhlIGJyYW5jaCBkZWNvZGVzIGxvY2FsbHkgYW5kDQo+ID4gcmUtdHJhbnNtaXRzIHVuY29tcHJl
c3NlZCwgdGhhdCBzZWdtZW50IG11c3Qgc3RpbGwgZml0IGF0IHRoZQ0KPiA+IHVuY29tcHJlc3Nl
ZCAxOGJwcCBmbG9vci4gVGhhdCBjYXNlIGlzIGhhbmRsZWQgdmlhIHBvcnQtPmZ1bGxfcGJuDQo+
ID4gYmVsb3cuDQo+ID4NCj4gPiBDbG9zZXM6DQo+ID4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0
b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8tL3dvcmtfaXRlbXMvMTY2NDANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gPiAtLS0NCj4g
PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYyB8IDIzDQo+ID4g
KysrKysrKysrLS0tLS0tLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspLCAxMyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2RwX21zdC5jDQo+ID4gaW5kZXggM2JlMTY0M2Y4ZDAzLi4yZThmNGMz
MWUwN2YgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kcF9tc3QuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZHBfbXN0LmMNCj4gPiBAQCAtMTUxOSw3ICsxNTE5LDggQEAgbXN0X2Nvbm5lY3Rvcl9tb2RlX3Zh
bGlkX2N0eChzdHJ1Y3QNCj4gZHJtX2Nvbm5lY3RvciAqX2Nvbm5lY3RvciwNCj4gPiAgCWludCBt
YXhfcmF0ZSwgbW9kZV9yYXRlLCBtYXhfbGFuZXMsIG1heF9saW5rX2Nsb2NrOw0KPiA+ICAJdW5z
aWduZWQgbG9uZyBid19vdmVyaGVhZF9mbGFncyA9DQo+ID4gIAkJRFJNX0RQX0JXX09WRVJIRUFE
X01TVCB8DQo+IERSTV9EUF9CV19PVkVSSEVBRF9TU0NfUkVGX0NMSzsNCj4gPiAtCWludCBtaW5f
bGlua19icHBfeDE2ID0gZnhwX3E0X2Zyb21faW50KDE4KTsNCj4gPiArCWludCBzcmNfbWluX2xp
bmtfYnBwX3gxNiA9IGZ4cF9xNF9mcm9tX2ludCgxOCk7DQo+ID4gKwlpbnQgc2lua19taW5fbGlu
a19icHBfeDE2ID0gZnhwX3E0X2Zyb21faW50KDE4KTsNCj4gDQo+IEkgZG9uJ3QgdW5kZXJzdGFu
ZCB3aGF0ICJzcmMgbGluayIgYW5kICJzaW5rIGxpbmsiIGFyZSBzdXBwb3NlZCB0byBtZWFuIGhl
cmUuDQo+IA0KU3JjIGxpbmsgc3RhbmRzIGZvciBzb3VyY2Ugc2lkZSBhbmQgdGhlIHNpbmsgbGlu
ayBzdGFuZHMgZm9yIHRoZSBicmFuY2ggbGluayBmb3IgTVNULg0KDQo+IFlvdSBoYXZlIGEgc291
cmNlIGFuZCBpdHMgY29uc3RyYWludHMuIFlvdSBoYXZlIGEgc2luayBhbmQgaXRzIGNvbnN0cmFp
bnRzLiBBbmQNCj4geW91IGhhdmUgYSBsaW5rIGJldHdlZW4gdGhlIHNvdXJjZSBhbmQgdGhlIHNp
bmssIHdpdGggdGhlIGNvbnN0cmFpbnRzIG9mIGJvdGguDQo+IA0KV2l0aCBicmFuY2ggRFNDIGNv
bXByZXNzaW9uLCB0aGUgc291cmNlIGxpbmsgY2FuIGNhcnJ5IGNvbXByZXNzZWQgZGF0YSB3aGls
ZSB0aGUgYnJhbmNoLXNpbmsgc2VnbWVudCBjYW4gY2FycnkgdW5jb21wcmVzc2VkIGRhdGEuIFdp
dGggRFNDIHBhc3N0aHJvdWdoIGJvdGggc2VnbWVudHMgY2FuIGNhcnJ5IGNvbXByZXNzZWQgZGF0
YS4NCg0KVGhhbmtzIGFuZCBSZWdhcmRzLA0KQXJ1biBSIE11cnRoeQ0KLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KPiBCUiwNCj4gSmFuaS4NCj4gDQo+ID4gIAlzdHJ1Y3QgaW50ZWxfZHBfbGlua19jb25m
aWcgbWF4X2J3X2NvbmZpZzsNCj4gPiAgCXN0YXRpYyBib29sIHN1cHBvcnRzX2RzYzsNCj4gPiAg
CWludCByZXQ7DQo+ID4gQEAgLTE1NDksOSArMTU1MCwxMyBAQCBtc3RfY29ubmVjdG9yX21vZGVf
dmFsaWRfY3R4KHN0cnVjdA0KPiBkcm1fY29ubmVjdG9yICpfY29ubmVjdG9yLA0KPiA+ICAJc3Vw
cG9ydHNfZHNjID0gaW50ZWxfZHBfaGFzX2RzYyhjb25uZWN0b3IpICYmDQo+ID4gIAkJICAgICAg
IGRybV9kcF9zaW5rX3N1cHBvcnRzX2ZlYyhjb25uZWN0b3ItPmRwLmZlY19jYXBhYmlsaXR5KTsN
Cj4gPg0KPiA+ICsJaWYgKHN1cHBvcnRzX2RzYyAmJiBjb25uZWN0b3ItPmRwLmRzY19kZWNvbXBy
ZXNzaW9uX2F1eCkNCj4gPiArCQlzcmNfbWluX2xpbmtfYnBwX3gxNiA9DQo+ID4gKw0KPiAJaW50
ZWxfZHBfY29tcHV0ZV9taW5fY29tcHJlc3NlZF9icHBfeDE2KGNvbm5lY3RvciwNCj4gPiArDQo+
IAlJTlRFTF9PVVRQVVRfRk9STUFUX1JHQik7DQo+ID4gKw0KPiA+ICAJaWYgKHN1cHBvcnRzX2Rz
YyAmJiBjb25uZWN0b3ItPm1zdC5wb3J0LT5wYXNzdGhyb3VnaF9hdXgpDQo+ID4gLQkJbWluX2xp
bmtfYnBwX3gxNiA9DQo+IGludGVsX2RwX2NvbXB1dGVfbWluX2NvbXByZXNzZWRfYnBwX3gxNihj
b25uZWN0b3IsDQo+ID4gLQ0KPiBJTlRFTF9PVVRQVVRfRk9STUFUX1JHQik7DQo+ID4gKwkJc2lu
a19taW5fbGlua19icHBfeDE2ID0gc3JjX21pbl9saW5rX2JwcF94MTY7DQo+ID4NCj4gPiAgCWlu
dGVsX2RwX2xpbmtfY2Fwc19nZXRfbWF4X2J3X2NvbmZpZyhpbnRlbF9kcC0+bGluay5jYXBzLA0K
PiAmbWF4X2J3X2NvbmZpZyk7DQo+ID4gIAltYXhfbGlua19jbG9jayA9IG1heF9id19jb25maWcu
cmF0ZTsgQEAgLTE1NjEsMTkgKzE1NjYsMTEgQEANCj4gPiBtc3RfY29ubmVjdG9yX21vZGVfdmFs
aWRfY3R4KHN0cnVjdCBkcm1fY29ubmVjdG9yICpfY29ubmVjdG9yLA0KPiA+ICAJCQkJCSAgICAg
ICBtYXhfbGlua19jbG9jaywgbWF4X2xhbmVzKTsNCj4gPiAgCW1vZGVfcmF0ZSA9IGludGVsX2Rw
X2xpbmtfcmVxdWlyZWQobWF4X2xpbmtfY2xvY2ssIG1heF9sYW5lcywNCj4gPiAgCQkJCQkgICBt
b2RlLT5jbG9jaywgbW9kZS0+aGRpc3BsYXksDQo+ID4gLQkJCQkJICAgbWluX2xpbmtfYnBwX3gx
NiwNCj4gPiArCQkJCQkgICBzcmNfbWluX2xpbmtfYnBwX3gxNiwNCj4gPiAgCQkJCQkgICBid19v
dmVyaGVhZF9mbGFncyk7DQo+ID4NCj4gPiAgCS8qDQo+ID4gIAkgKiBUT0RPOg0KPiA+IC0JICog
LSBBbHNvIGNoZWNrIGlmIGNvbXByZXNzaW9uIHdvdWxkIGFsbG93IGZvciB0aGUgbW9kZQ0KPiA+
IC0JICogICBpbiBub24tcGFzc3Rocm91Z2ggbW9kZSwgaS5lLiB0aGUgbGFzdCBicmFuY2ggZGV2
aWNlDQo+ID4gLQkgKiAgIGRlY29tcHJlc3NpbmcgdGhlIHN0cmVhbS4gVGhpcyBtYWtlcyBhIGRp
ZmZlcmVuY2Ugb25seSBpZg0KPiA+IC0JICogICB0aGUgQlcgb24gdGhlIGxpbmsgYmV0d2VlbiB0
aGUgbGFzdCBicmFuY2ggZGV2aWNlIGFuZCB0aGUNCj4gPiAtCSAqICAgc2luayBpcyBoaWdoZXIg
dGhhbiB0aGUgQlcgb24gdGhlIHdob2xlIE1TVCBwYXRoIGZyb20gdGhlDQo+ID4gLQkgKiAgIHNv
dXJjZSB0byB0aGUgbGFzdCBicmFuY2ggZGV2aWNlLiBSZWx5aW5nIG9uIHRoZSBleHRyYSBCVw0K
PiA+IC0JICogICB0aGlzIHByb3ZpZGVzIGFsc28gcmVxdWlyZXMgdGhlDQo+ID4gLQkgKiAgIERG
UF9MaW5rX0F2YWlsYWJsZV9QYXlsb2FkX0JhbmR3aWR0aF9OdW1iZXIgZGVzY3JpYmVkIGJlbG93
Lg0KPiA+ICAJICogLSBDYWxjdWxhdGUgdGhlIG92ZXJoZWFkIHVzaW5nIGRybV9kcF9id19vdmVy
aGVhZCgpIC8NCj4gPiAgCSAqICAgZHJtX2RwX2J3X2NoYW5uZWxfY29kaW5nX2VmZmljaWVuY3ko
KSwgc2ltaWxhcmx5IHRvIHRoZQ0KPiA+ICAJICogICBjb21wdXRlIGNvbmZpZyBjb2RlLCBhcyBk
cm1fZHBfY2FsY19wYm5fbW9kZSgpIGRvZXNuJ3QNCj4gPiBAQCAtMTU4OCw3ICsxNTg1LDcgQEAg
bXN0X2Nvbm5lY3Rvcl9tb2RlX3ZhbGlkX2N0eChzdHJ1Y3QNCj4gZHJtX2Nvbm5lY3RvciAqX2Nv
bm5lY3RvciwNCj4gPiAgCQlyZXR1cm4gcmV0Ow0KPiA+DQo+ID4gIAlpZiAobW9kZV9yYXRlID4g
bWF4X3JhdGUgfHwNCj4gPiAtCSAgICBkcm1fZHBfY2FsY19wYm5fbW9kZShtb2RlLT5jbG9jaywg
bWluX2xpbmtfYnBwX3gxNikgPiBwb3J0LQ0KPiA+ZnVsbF9wYm4pIHsNCj4gPiArCSAgICBkcm1f
ZHBfY2FsY19wYm5fbW9kZShtb2RlLT5jbG9jaywgc2lua19taW5fbGlua19icHBfeDE2KSA+DQo+
ID4gK3BvcnQtPmZ1bGxfcGJuKSB7DQo+ID4gIAkJKnN0YXR1cyA9IE1PREVfQ0xPQ0tfSElHSDsN
Cj4gPiAgCQlyZXR1cm4gMDsNCj4gPiAgCX0NCj4gDQo+IC0tDQo+IEphbmkgTmlrdWxhLCBJbnRl
bA0K
