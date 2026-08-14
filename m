Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B0DC5CFCF
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 04:23:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5790310E52B;
	Fri, 14 Aug 2026 04:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SDBc7bvK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F4710E078;
 Fri, 14 Aug 2026 04:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786681424; x=1818217424;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=L27dsX7GA6CJFYDaSaOux7BHDzck3LdKw7mVHY+S+r8=;
 b=SDBc7bvK9hfna7i8nr1WSJSqygab8YLcKCjitFkRP3ztgbq5s7iDi/tI
 D1O5hLmd0aTIeFyhgV0mx7TabtTLOf7Lv60GTk7OcJA47EO/yrsE1ous5
 hYqP0HwltM9K0ttae2KWGVQ+20r7YfCxeksyLT8MIUId4oJ5QDvs62Kpc
 79eZCZjNReHxqYqsy47hb60Gew37fQxbBOFU1UOIDf4ssfMzRaMeUUVKa
 s9vhx2YHufrPx1+aapcklWrG6/BT2Av22YfWgoLOI0FIQbc15o8gLZZU4
 JW1Seruk3RtNfIiH++DuOQsuDjVM5u6ihG2qB8PqGvwuGUA8xFL5xK+2S g==;
X-CSE-ConnectionGUID: nG1mxHZ9SRm04j10h3AplQ==
X-CSE-MsgGUID: hShSW0htRYacup4isT5uxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87123701"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208,217";a="87123701"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 21:23:44 -0700
X-CSE-ConnectionGUID: 5iah3UmWQwaNnEviaUHWFQ==
X-CSE-MsgGUID: jT6S99rDTi+FHQQTX2MksA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
 d="scan'208,217";a="268398858"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 21:23:44 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 21:23:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 21:23:43 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.7) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 21:23:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xMJaVBR/T3nKFK8tx3i8EeSEznP2sMII89lzoaFUJSzXmg4dM1t1Sa7XirErqNM7Ols29alcytW6P7gdtpqo+TMo1TssKjRYOlZdhWQAyft/c5gAJDz9Tkxzi9GtjhUV/LxsZbNeirVxdZTnWaA08OxK4BTZ2Y0KKZ3wOut0p3aRRKfi2lxJ7N3W9yofz2oDAdyiUMLl+h9OiB1k52uVGZhl1pb/+jd99R3KiWisoGxxEw4Egglgun1xWK4/oAYBA6aIAS4Q9megxwKO2//6Mc+Kuwuvmcj+6TevJa1uf95gxefnqe3SsX9bhwGbLaUkGm93kBWShBMSuDcKBBsx5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L27dsX7GA6CJFYDaSaOux7BHDzck3LdKw7mVHY+S+r8=;
 b=RMNMn4h5lQk9dCjp1DpUBq3Yh9LlhYZQLw+frDzwACPsb1aiPDNInhXDgYkFGv6FL3O0Bc1FND1Tay7tUW1uSynZE2eBIFRlDoPo8zGFELYtuwfgpLmA8VWOiY8ia35FbRcl6GaXpXiSFYNr0+VeV26F57w716EZ0hxaikVLIvmj3smqEi7bdVf+vpRzIf2cFEhdVRD7L65oR4VYtbE4M+KE3HcnVE+vvv+6fRk0NrL1g21AmfSQY/kh5J+HXGT8LInIC9GxcJjIET/bZ/mbsxJmFwUmMFx9E9Q/gtovy8AYW0bNY4ud8mUirIxiV1FhVD9eTEH8vnMXB+/mHW07SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by SN7PR11MB7667.namprd11.prod.outlook.com (2603:10b6:806:32a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 04:23:38 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 04:23:37 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "I915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: =?utf-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGUvZ3VjOiBo?=
 =?utf-8?Q?andle_exec_queue_teardown_after_hot-unplug?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1cmUgZm9yIGRybS94ZS9ndWM6IGhhbmRs?=
 =?utf-8?Q?e_exec_queue_teardown_after_hot-unplug?=
Thread-Index: AQHdKaDJcA964TsQ8UCAjq8MPRX/Xrac7dub
Date: Fri, 14 Aug 2026 04:23:37 +0000
Message-ID: <SA3PR11MB8118C82A655F20C94F76525BD0DA2@SA3PR11MB8118.namprd11.prod.outlook.com>
References: <20260811133753.1742666-4-nitin.r.gote@intel.com>
 <178645981127.39338.18416683848345830741@61270ab9df2a>
In-Reply-To: <178645981127.39338.18416683848345830741@61270ab9df2a>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8118:EE_|SN7PR11MB7667:EE_
x-ms-office365-filtering-correlation-id: 0bd821a8-b993-43f5-c460-08def9bbd01e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|13003099007|38070700021|56012099006|10067099003|5023799004|11063799006|4143699003|8096899003|18002099003|22082099003;
x-microsoft-antispam-message-info: 7Iw0jjNhBwkKS1l2R3T4k3pYiCMBRoHVEVwAsDPr4sMIZKql1KhOogsbLcTzeNGrDfkycrAMkkLB0mN+XH5qoptOn5UKg+z3ghW1UFZZqfAoCPiy8dsyDSwTlBbbZN+ELAYIcklv4ipVBPUSGEUNDY1Cz324eqNuNPQTuKThuWYaDRcuFC/awy2BUClpRFjOlQv6FDWKB1A/gNhtLT/pashyxioAugTLbjnHvU5wVahk8/nr/9slRv6Z3paK4KQq5NmFDwrQZMbFImbP1oXjo0Hq2EdJ1DVj7/k0OJJQ1DTFEVQKMZIcvE7OsqeK6TWyGLW4M/bxviGtcQ2R9+MjRx/v/JjSlBZpnlgsm7Yj30cRy6tN1HOYIsUz0GNPEgROkT8We78Kem7DhY9aNyH9lqXdbmfk+hhfPGfVwti2/CUXXl3O+NvjUjuJdV3MVpOfRpRnKpXEZkx0h6pF7iiEkT73HvoHJKU23e6WALj2YjNmGe4guGpvSgh6bwUsZ2QsdaUbXF2I6FXi1ODa/R7lZhzvXG/rWrmIEJgVFNblFXgUJtLVmZGJVjZuCtbV9hjHaEw+6h/HB5F7gI3KS3t7tJ3ltaq5QZTym+M8GDrMywjv7NyPM5eie4L9LLRSPtTQMOkNoWigDP9pG6rlMJs6Chy0DR+feyM8gFoB0ixoTwg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8118.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(13003099007)(38070700021)(56012099006)(10067099003)(5023799004)(11063799006)(4143699003)(8096899003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDJjanV1ZDVrYnprZ1RpTjllRHpMMTVReEdMYU11ZzlQZU9CRDZuM05GeVZi?=
 =?utf-8?B?eENoblNWRm50eFUzdlU1cGVPZUY0S2lNYThiWFU0Vm9MSm9tVmdxU21yR1dV?=
 =?utf-8?B?Y3FYOC94TEJGZkRWT29GeEwxVjd1Y0xrcnNkVkxVWW1id1JOekpUTVdrNlht?=
 =?utf-8?B?djNoQ0ZxekUyMXpuSGFORWNGc1lKOFFMTVZZMEpmanFVdE9WM09oYk1wSmcy?=
 =?utf-8?B?TEFOWTAzb1VWRzhwNVFRUWhDTWVGYmRMeVltKzJLb1lYdFhnMmhRWUhhbGFU?=
 =?utf-8?B?SVVhZmdwcUw1Syszc1l2b0hZVzBySzNkVlVjT0FFZWQ3amRYejk5YjdWcUpM?=
 =?utf-8?B?RlZ3VlpKSFc3OTg0K1VNaDRXRW0vYm1UWHliUFEwTW1SZDk2UjFBMURGYkRW?=
 =?utf-8?B?dWpKYVE0OFloUEU0VUo3eHE3THkxQ2dGanVGOVg0UlFQL2xxd0Q4T1JaejRM?=
 =?utf-8?B?T3QvS2tJQ0hqZy9WQ2NVcGF3WUZFQ1EwMnFES0cwQkJBdEgyajhKOVRzN2tj?=
 =?utf-8?B?WmQ2K3hYSkpaZHRYME1IeDA1K21nTnB1bmtxUFY4MHhoYUxEY1crcDJybTMw?=
 =?utf-8?B?Q3Fpa1lHMFE3dWc0RVBXM25NT21QdXpBRGFUU3N1R1JQbS9NWjR5ZnltM3hw?=
 =?utf-8?B?bW9VMkU2U3pLNC9FQ3JjTTRuTm1PNms0VVJwek41RzRFYkJoUGZIQ21pL3dG?=
 =?utf-8?B?VmQzaTh5dE1XalJYZWYzbVVudFFRQXVoaDFqOWI4UmJnbTZ3Q1V6eGt6R2Fh?=
 =?utf-8?B?cnpkYkltczBsN0FhYnRwZEFzOFM1Y0xTODZCbzIyNnJOQ0FXbjZPUlcyTVhp?=
 =?utf-8?B?OUpvamxxaHhZY3NTUFMvTXh1ODBkVmVucHhsWUJrM3BhNHc4eHZrYldVREhE?=
 =?utf-8?B?NzJoSmZGc3E2R3ZyRVBpaXdYZ0N3MUp4RU1xR01pMk4wQmFQbkZIYzgwN1JD?=
 =?utf-8?B?Vm1MRFo4eEltZC9BWGRGZjJyMGJrdXdCVnBJQTd1ZzRXSTZWYmJPVGE3OUxU?=
 =?utf-8?B?VTZieVZzdTNjZ0ZsaXhRb25ENlA0VVNwWk9RSHhkVXI3UWVXWForTHJncWlB?=
 =?utf-8?B?M3RwZm1QYkdSd1FPMEJQS1JVVXlGV1FhVi9BVWd3YXVoeFFmck1ZeWZkWkd0?=
 =?utf-8?B?ZlVCc0FhODBtR2NKSTJ6QnVhVk1iS1hUckhFZnZJRDdnVnQzNEhxaSsvSUcz?=
 =?utf-8?B?UjVPYWpQYmpWd3hQRmVJTXF5bDRBdGVQUWwxQXMwZEVVMHBhRnlybCtaWDhQ?=
 =?utf-8?B?U2xnRlpYTmdqRkF2SWc2QU1RVC83cTA3UklMdWtEcG15eE93TVdlODRibWtW?=
 =?utf-8?B?amdyZGI0Yk9oVEVxWnIrL3VSbEd5c3ViVzVRNjBKdEFwNndIZ2c5bE5KV0dM?=
 =?utf-8?B?Q21aN0E4TGNMUGoyTmtuTVRDRGJmSis2SUVxOGdpTm1WTnRVLzV0eGZURFhI?=
 =?utf-8?B?ekE5QnVzM2JIV2ZxdzhSVXhzOGFkcCt1QUdXVjBXeUNrTGszRzR3dzdpUlFu?=
 =?utf-8?B?K1JrNVd1MHkyMk05dUVqTFliVHltaXI1Z3BreW4yT2dUbTBWTXhQRlBWbDQz?=
 =?utf-8?B?L2k2S2RYOE9JRGFqejlBMXBHUXdGenhpcVF0cWZkc0FackFLTUtZUFZ5QUhs?=
 =?utf-8?B?QTljK0hJWmVIbktFeEVaYmEvT2x3ZE1KaEswdnArZlBYdWY3MjRqa2JDNTFD?=
 =?utf-8?B?amVkendSeXhXNEZsTDU0U1g2VlFONUQ4U0dJTzdEYVp1Y0YvMXdnQ3k2SkFE?=
 =?utf-8?B?QnIrTmtYMklYc2xjMzlPbmcrb09sbEVJT0ozSWVCSUlWUGpmWmF3NFA4RG1t?=
 =?utf-8?B?cW56bU9jMGRtQlVCYlY5aU8xR0RmcnBXcVFrVTB2ZzdWQ1V6WW5neU9KYU9H?=
 =?utf-8?B?dHprK2dhV2NRaFJTSVRBcnAwNEtWcFBaR0hITytndUdhZHFxOWlFdDJYRXBX?=
 =?utf-8?B?Q1ptNDJCT1hRcmt4VlhLeXN0aUNaWTI2RWdpSGxTbm4yOFZsajBuSFpWRUhv?=
 =?utf-8?B?eGF0eExyM1Jpc0VuUTQ1M0NIT3B6TThtd2doVmJFM1cyT3o2d0N4OXBXdHNI?=
 =?utf-8?B?WWtzangvOWVGYWdXVUVaOGJvMHA5dXBBK0VIM1ZnVlRRUFhtYzZMVHVUNmZ5?=
 =?utf-8?B?T013TFEvWkx3MlRueXNtWHhXWXdDUVduanJyd0ZmTGJDQy8vOXhxWkJMNzkz?=
 =?utf-8?B?alZ0Z0hJaloyazF1YVR4K0h2WEt0QjlKQWt5cThCV3czRWVPeWcxVUJpWXlh?=
 =?utf-8?B?bno0MlZ6MVhJcktIZ2pGQ0tublUyU0V0V3I1anpkbVlCUXNYdWxSeVQxbWM5?=
 =?utf-8?B?WTQwL25HbGQ1VWdqQUJKb0dodGsxVmh0VkIvdko2Mkh1L3VCajZHQT09?=
Content-Type: multipart/alternative;
 boundary="_000_SA3PR11MB8118C82A655F20C94F76525BD0DA2SA3PR11MB8118namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: sxoYxtKxBmuFYJ+V8dz7Vp4eMxb6hRaUGQgsGAehg2IuqVhR2yhgKArJpmSnZLjBAeM7ep+YYJuRbr4ZrAwHhGiPJPv0gS0cG/vE1KbudcXBHCmfiHS70W8cGGJAj9Lsq/RN84r1QgHrR3mtN9iC5jYXFtxxZzyenjS096Yvsp4xKqWTxe36xkSgLFUBvFNRsT9ysCjVjv2MdXu2QKNZA/n64LjzRpgp0S+DNzcWI1X8kkCWE1f4QgZjWhDKlok4EkWZlPbDwEUbE+qNUXPrB9ocl80vDjAiYopDvcEyL/NmNUlDwOrZOhwiCJloRty1L8xZM+veuNmJ5hieWXagIA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd821a8-b993-43f5-c460-08def9bbd01e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2026 04:23:37.8790 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aXV0pawnSwPtx/7zv5Nd4pmpcpf5lU8lMn7cqUbeIThPqMOAB5P+hBKydk0fviBMe5vNofY/DuXy7pHO8tVfAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7667
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

--_000_SA3PR11MB8118C82A655F20C94F76525BD0DA2SA3PR11MB8118namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQ0kgSW5mcmEsDQpUaGUgcmVwb3J0ZWQgZmFpbHVyZSBpcyBub3QgY2F1c2VkIGJ5IG15IHBh
dGNoLg0KSSBtYW51YWxseSB2ZXJpZmllZCB0aGF0IGlndEB4ZV9wYXRAcGF0LWluZGV4LWF1dG9A
Ymx0IHBhc3NlcyB3aXRoIG15IHBhdGNoIGFwcGxpZWQuDQoNClRoYW5rcywNCk5pdGluDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpGcm9tOiBQYXRjaHdvcmsgPHBhdGNod29y
a0BlbWVyaWwuZnJlZWRlc2t0b3Aub3JnPg0KU2VudDogVHVlc2RheSwgQXVndXN0IDExLCAyMDI2
IDg6MjAgUE0NClRvOiBHb3RlLCBOaXRpbiBSIDxuaXRpbi5yLmdvdGVAaW50ZWwuY29tPg0KQ2M6
IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZyA8aW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnPg0KU3ViamVjdDog4pyXIFhlLkNJLkZVTEw6IGZhaWx1cmUgZm9yIGRybS94ZS9ndWM6
IGhhbmRsZSBleGVjIHF1ZXVlIHRlYXJkb3duIGFmdGVyIGhvdC11bnBsdWcNCg0KUGF0Y2ggRGV0
YWlscw0KU2VyaWVzOg0KZHJtL3hlL2d1YzogaGFuZGxlIGV4ZWMgcXVldWUgdGVhcmRvd24gYWZ0
ZXIgaG90LXVucGx1Zw0KVVJMOg0KaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nl
cmllcy8xNzE5ODkvDQpTdGF0ZToNCmZhaWx1cmUNCkRldGFpbHM6DQpodHRwczovL2ludGVsLWdm
eC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS94ZS1wdy0xNzE5ODl2MS9pbmRleC5odG1sDQpDSSBC
dWcgTG9nIC0gY2hhbmdlcyBmcm9tIHhlLTU1NzUtZGM0NjJhYjc5MWI2ODZjNDg1NDVjMTYwZWNj
ODFiZTY0Zjc3YTg0Nl9GVUxMIC0+IHhlLXB3LTE3MTk4OXYxX0ZVTEwNClN1bW1hcnkNCg0KRkFJ
TFVSRQ0KDQpTZXJpb3VzIHVua25vd24gY2hhbmdlcyBjb21pbmcgd2l0aCB4ZS1wdy0xNzE5ODl2
MV9GVUxMIGFic29sdXRlbHkgbmVlZCB0byBiZQ0KdmVyaWZpZWQgbWFudWFsbHkuDQoNCklmIHlv
dSB0aGluayB0aGUgcmVwb3J0ZWQgY2hhbmdlcyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUg
Y2hhbmdlcw0KaW50cm9kdWNlZCBpbiB4ZS1wdy0xNzE5ODl2MV9GVUxMLCBwbGVhc2Ugbm90aWZ5
IHlvdXIgYnVnIHRlYW0gKEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnKSB0byBh
bGxvdyB0aGVtDQp0byBkb2N1bWVudCB0aGlzIG5ldyBmYWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwg
cmVkdWNlIGZhbHNlIHBvc2l0aXZlcyBpbiBDSS4NCg0KUGFydGljaXBhdGluZyBob3N0cyAoMiAt
PiAyKQ0KDQpObyBjaGFuZ2VzIGluIHBhcnRpY2lwYXRpbmcgaG9zdHMNCg0KUG9zc2libGUgbmV3
IGlzc3Vlcw0KDQpIZXJlIGFyZSB0aGUgdW5rbm93biBjaGFuZ2VzIHRoYXQgbWF5IGhhdmUgYmVl
biBpbnRyb2R1Y2VkIGluIHhlLXB3LTE3MTk4OXYxX0ZVTEw6DQoNCklHVCBjaGFuZ2VzDQpQb3Nz
aWJsZSByZWdyZXNzaW9ucw0KDQogICogICBpZ3RAeGVfcGF0QHBhdC1pbmRleC1hdXRvQGJsdDoN
CiAgICAgKiAgIHNoYXJkLWxubDogUEFTUzxodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJl
ZS9pbnRlbC14ZS94ZS01NTc1LWRjNDYyYWI3OTFiNjg2YzQ4NTQ1YzE2MGVjYzgxYmU2NGY3N2E4
NDYvc2hhcmQtbG5sLTgvaWd0QHhlX3BhdEBwYXQtaW5kZXgtYXV0b0BibHQuaHRtbD4gLT4gSU5D
T01QTEVURTxodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS94ZS1wdy0x
NzE5ODl2MS9zaGFyZC1sbmwtNy9pZ3RAeGVfcGF0QHBhdC1pbmRleC1hdXRvQGJsdC5odG1sPiAr
MSBvdGhlciB0ZXN0IGluY29tcGxldGUNCg0K

--_000_SA3PR11MB8118C82A655F20C94F76525BD0DA2SA3PR11MB8118namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29m
IiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01T
Rm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAx
MXB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpIaSBDSSBJbmZyYSw8L2Rpdj4NCjxkaXYgY2xh
c3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJl
ZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1z
ZXJpZjsgZm9udC1zaXplOiAxMXB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpUaGUgcmVwb3J0
ZWQgZmFpbHVyZSBpcyBub3QgY2F1c2VkIGJ5IG15IHBhdGNoLjwvZGl2Pg0KPGRpdiBjbGFzcz0i
ZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVk
Rm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlm
OyBmb250LXNpemU6IDExcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCkkgbWFudWFsbHkgdmVy
aWZpZWQgdGhhdCBpZ3RAeGVfcGF0QHBhdC1pbmRleC1hdXRvQGJsdCBwYXNzZXMgd2l0aCBteSBw
YXRjaCBhcHBsaWVkLjwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJm
b250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2Vydmlj
ZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDExcHQ7IGNvbG9y
OiByZ2IoMCwgMCwgMCk7Ij4NCjxicj4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJv
b2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3Nf
TVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6
IDExcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NClRoYW5rcyw8L2Rpdj4NCjxkaXYgc3R5bGU9
ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2
aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTFwdDsgY29s
b3I6IHJnYigwLCAwLCAwKTsiPg0KTml0aW48L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5
OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7
IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxicj4NCjwvZGl2Pg0KPGhyIHN0eWxlPSJkaXNwbGF5
OiBpbmxpbmUtYmxvY2s7IHdpZHRoOiA5OCU7Ij4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBD
YWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNv
bG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxiPkZyb206PC9iPiBQYXRjaHdvcmsgJmx0O3BhdGNod29y
a0BlbWVyaWwuZnJlZWRlc2t0b3Aub3JnJmd0Ozxicj4NCjxiPlNlbnQ6PC9iPiBUdWVzZGF5LCBB
dWd1c3QgMTEsIDIwMjYgODoyMCBQTTxicj4NCjxiPlRvOjwvYj4gR290ZSwgTml0aW4gUiAmbHQ7
bml0aW4uci5nb3RlQGludGVsLmNvbSZndDs8YnI+DQo8Yj5DYzo8L2I+IGludGVsLXhlQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZyAmbHQ7aW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnJmd0Ozxi
cj4NCjxiPlN1YmplY3Q6PC9iPiDinJcgWGUuQ0kuRlVMTDogZmFpbHVyZSBmb3IgZHJtL3hlL2d1
YzogaGFuZGxlIGV4ZWMgcXVldWUgdGVhcmRvd24gYWZ0ZXIgaG90LXVucGx1Zw0KPC9kaXY+DQo8
ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1z
ZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8YnI+DQo8L2Rp
dj4NCjxkaXY+PGI+UGF0Y2ggRGV0YWlsczwvYj48L2Rpdj4NCjx0YWJsZT4NCjx0Ym9keT4NCjx0
cj4NCjx0ZCBzdHlsZT0icGFkZGluZzogMnB0OyI+DQo8ZGl2PjxiPlNlcmllczo8L2I+PC9kaXY+
DQo8L3RkPg0KPHRkIHN0eWxlPSJwYWRkaW5nOiAycHQ7Ij4NCjxkaXY+ZHJtL3hlL2d1YzogaGFu
ZGxlIGV4ZWMgcXVldWUgdGVhcmRvd24gYWZ0ZXIgaG90LXVucGx1ZzwvZGl2Pg0KPC90ZD4NCjwv
dHI+DQo8dHI+DQo8dGQgc3R5bGU9InBhZGRpbmc6IDJwdDsiPg0KPGRpdj48Yj5VUkw6PC9iPjwv
ZGl2Pg0KPC90ZD4NCjx0ZCBzdHlsZT0icGFkZGluZzogMnB0OyI+DQo8ZGl2PjxhIGhyZWY9Imh0
dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTcxOTg5LyIgaWQ9Ik9XQWRj
OTg3YzUwLWI4YmUtZDQ3OC1lMGVjLWJhZmM3NjMxOWE0NSIgY2xhc3M9Ik9XQUF1dG9MaW5rIiBk
YXRhLWF1dGg9Ik5vdEFwcGxpY2FibGUiPmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9y
Zy9zZXJpZXMvMTcxOTg5LzwvYT48L2Rpdj4NCjwvdGQ+DQo8L3RyPg0KPHRyPg0KPHRkIHN0eWxl
PSJwYWRkaW5nOiAycHQ7Ij4NCjxkaXY+PGI+U3RhdGU6PC9iPjwvZGl2Pg0KPC90ZD4NCjx0ZCBz
dHlsZT0icGFkZGluZzogMnB0OyI+DQo8ZGl2PmZhaWx1cmU8L2Rpdj4NCjwvdGQ+DQo8L3RyPg0K
PHRyPg0KPHRkIHN0eWxlPSJwYWRkaW5nOiAycHQ7Ij4NCjxkaXY+PGI+RGV0YWlsczo8L2I+PC9k
aXY+DQo8L3RkPg0KPHRkIHN0eWxlPSJwYWRkaW5nOiAycHQ7Ij4NCjxkaXY+PGEgaHJlZj0iaHR0
cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvaW50ZWwteGUveGUtcHctMTcxOTg5djEvaW5k
ZXguaHRtbCIgaWQ9Ik9XQTIxY2Q2NTJmLTkxY2EtMjZkMi05Y2NkLTVmMDgyNTIxOWQ3ZCIgY2xh
c3M9Ik9XQUF1dG9MaW5rIiBkYXRhLWF1dGg9Ik5vdEFwcGxpY2FibGUiPmh0dHBzOi8vaW50ZWwt
Z2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL3hlLXB3LTE3MTk4OXYxL2luZGV4Lmh0bWw8L2E+
PC9kaXY+DQo8L3RkPg0KPC90cj4NCjwvdGJvZHk+DQo8L3RhYmxlPg0KPGgxPkNJIEJ1ZyBMb2cg
LSBjaGFuZ2VzIGZyb20geGUtNTU3NS1kYzQ2MmFiNzkxYjY4NmM0ODU0NWMxNjBlY2M4MWJlNjRm
NzdhODQ2X0ZVTEwgLSZndDsgeGUtcHctMTcxOTg5djFfRlVMTDwvaDE+DQo8aDI+U3VtbWFyeTwv
aDI+DQo8cCBzdHlsZT0ibWFyZ2luLXRvcDogMWVtOyBtYXJnaW4tYm90dG9tOiAxZW07Ij48Yj5G
QUlMVVJFPC9iPjwvcD4NCjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAxZW07IG1hcmdpbi1ib3R0b206
IDFlbTsiPlNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIHhlLXB3LTE3MTk4OXYx
X0ZVTEwgYWJzb2x1dGVseSBuZWVkIHRvIGJlPGJyPg0KdmVyaWZpZWQgbWFudWFsbHkuPC9wPg0K
PHAgc3R5bGU9Im1hcmdpbi10b3A6IDFlbTsgbWFyZ2luLWJvdHRvbTogMWVtOyI+SWYgeW91IHRo
aW5rIHRoZSByZXBvcnRlZCBjaGFuZ2VzIGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRoZSBjaGFu
Z2VzPGJyPg0KaW50cm9kdWNlZCBpbiB4ZS1wdy0xNzE5ODl2MV9GVUxMLCBwbGVhc2Ugbm90aWZ5
IHlvdXIgYnVnIHRlYW0gKEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnKSB0byBh
bGxvdyB0aGVtPGJyPg0KdG8gZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBtb2RlLCB3aGljaCB3
aWxsIHJlZHVjZSBmYWxzZSBwb3NpdGl2ZXMgaW4gQ0kuPC9wPg0KPGgyPlBhcnRpY2lwYXRpbmcg
aG9zdHMgKDIgLSZndDsgMik8L2gyPg0KPHAgc3R5bGU9Im1hcmdpbi10b3A6IDFlbTsgbWFyZ2lu
LWJvdHRvbTogMWVtOyI+Tm8gY2hhbmdlcyBpbiBwYXJ0aWNpcGF0aW5nIGhvc3RzPC9wPg0KPGgy
PlBvc3NpYmxlIG5ldyBpc3N1ZXM8L2gyPg0KPHAgc3R5bGU9Im1hcmdpbi10b3A6IDFlbTsgbWFy
Z2luLWJvdHRvbTogMWVtOyI+SGVyZSBhcmUgdGhlIHVua25vd24gY2hhbmdlcyB0aGF0IG1heSBo
YXZlIGJlZW4gaW50cm9kdWNlZCBpbiB4ZS1wdy0xNzE5ODl2MV9GVUxMOjwvcD4NCjxoMz5JR1Qg
Y2hhbmdlczwvaDM+DQo8aDQ+UG9zc2libGUgcmVncmVzc2lvbnM8L2g0Pg0KPHVsPg0KPGxpPmln
dEB4ZV9wYXRAcGF0LWluZGV4LWF1dG9AYmx0OjwvbGk+PHVsPg0KPGxpPnNoYXJkLWxubDogPGEg
aHJlZj0iaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvaW50ZWwteGUveGUtNTU3NS1k
YzQ2MmFiNzkxYjY4NmM0ODU0NWMxNjBlY2M4MWJlNjRmNzdhODQ2L3NoYXJkLWxubC04L2lndEB4
ZV9wYXRAcGF0LWluZGV4LWF1dG9AYmx0Lmh0bWwiIGlkPSJPV0EyNDUzMzM1NS0xY2Y1LTQ1NTUt
NTkwNC0zMzNhNzNlMmJmYWEiIGNsYXNzPSJPV0FBdXRvTGluayIgZGF0YS1hdXRoPSJOb3RBcHBs
aWNhYmxlIj4NClBBU1M8L2E+IC0mZ3Q7IDxhIGhyZWY9Imh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAx
Lm9yZy90cmVlL2ludGVsLXhlL3hlLXB3LTE3MTk4OXYxL3NoYXJkLWxubC03L2lndEB4ZV9wYXRA
cGF0LWluZGV4LWF1dG9AYmx0Lmh0bWwiIGlkPSJPV0FhNGY3YTk0YS1mNWIxLTQyYjUtZDJmMC1m
YzUxMTkxM2ZhY2EiIGNsYXNzPSJPV0FBdXRvTGluayIgZGF0YS1hdXRoPSJOb3RBcHBsaWNhYmxl
Ij4NCklOQ09NUExFVEU8L2E+ICsxIG90aGVyIHRlc3QgaW5jb21wbGV0ZTwvbGk+PC91bD4NCjwv
dWw+DQo8aDI+PGJyPg0KPC9oMj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_SA3PR11MB8118C82A655F20C94F76525BD0DA2SA3PR11MB8118namp_--
