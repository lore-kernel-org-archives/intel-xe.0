Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3F8D73EA9
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 23:51:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2F810E8D9;
	Thu, 29 Jan 2026 23:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="brUAX4GT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A96B10E35B
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 23:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769730701; x=1801266701;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sc/fJ6dm0djILIpr/wfor5Fgx4gje7CNxT7t7tsrXPs=;
 b=brUAX4GTdClGX/4JQqIOy81JD4MVkYj1rf6GG4vgZystXNFcez+Az93o
 0KOM5eSUaxVyQi2Ny5G7Or3MroW8MHpS/CP3l0+Zbsmv1/op/igh2E0bl
 lLGNbgdaaK08llsoHUGm0ETb3kOGGCEDt578YoXioKwg8BigQKajKe074
 BXaFiblqrBUpY5i2mW5Z6irL0l9UngVpyQF4ydG5WdPrMV82FxKz6ObdT
 H1oGQ9mJGHT8mQlONP7mAGV7bvd+ytxbPclFFrYX2vWlZrYodqWs8jLFT
 H0BTY4kDDzLZC/Z8hNlKKojOZOV/YhNo19M3u5P34tQuwbFZfAw4TgOnY g==;
X-CSE-ConnectionGUID: pZpql1XDSNaZtwyFMzvQmw==
X-CSE-MsgGUID: 893xFojpQw2UvzMVZB5/zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71036476"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="71036476"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 15:51:41 -0800
X-CSE-ConnectionGUID: hUbY1ipySJ2Sx5uAiSZPQA==
X-CSE-MsgGUID: BGS0WMEyRO+HTOcJs5zE3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="208623724"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 15:51:40 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 15:51:40 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 15:51:40 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.11) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 15:51:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1cH4+HJj3QhZHX7xhsyR3wfqSxpYDkSwyzHheLIHK7vYkHbVKlOTFFxZBSjA/wMZWDubohDTswDm9zXSonIdTnfM9zIPdA2oQKP2u3AVLHTXx33qcQdebTekkwxnGukSyqo5cpOPVJcgeXAG260sNBdftP/KFmoxLuH+qkcueMdfVEwNUdNoRaw32d9QNdE4H5ExFdkuxgxAtMpYQVbigpXKvvn8lBNuq0e5bwhoFdQudJ1FwZsFTtHF4/8bK4gib2LsZeFyK1GlPGhlh5y2LunP2T1Pe9shnaH9qEn+PTo4X0dQn8hunkhLsHqP6UM6hNYZumayhRu2/vxwesSiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vrHR7i3nUsty0Sbx7dVk5Nlc6FwAVl0WbpWq6u6hnQQ=;
 b=YZmT00LOsPyYUMNVDIjUpvn1e6xIO1/NlSoAQWujW1layyM4CAC3M/RMLrexGKHQ6H8IGk6M2Wed+SVTu3SgSF6sAhppuiPUWinhoLvNqUOBo+UEMhIDw0522U+OSV1hGPk6r0VST7cYtJiDXGGesRc1spNXc8+I64XGHuN32kFvx4BgOCYy6gm8FcPrw73H5PCmWFrMbNeFygH1t6paXnv/RQlYBprD6nM/wCmoNhyoEzbJTVHaf85f+2fUgGp/h7UFTDQ0f+aHROO9ADOOfbw8QHPyxeAW5kKIsb2q2kOX8LAJkBcR6IpApRKZ9ZN7IpuIXqmsZibnuCfpjWLR3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by CH3PR11MB7868.namprd11.prod.outlook.com (2603:10b6:610:12e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 23:51:36 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%5]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 23:51:36 +0000
From: "Wang, X" <x.wang@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Nguyen, Brian3"
 <brian3.nguyen@intel.com>
Subject: RE: [PATCH] drm/xe: use entry_dump callbacks for xe2+ PAT dumps
Thread-Topic: [PATCH] drm/xe: use entry_dump callbacks for xe2+ PAT dumps
Thread-Index: AQHckXb0fC08qi3fn0KHzd0fPvtQg7Vp0T7Q
Date: Thu, 29 Jan 2026 23:51:36 +0000
Message-ID: <SA3PR11MB804646060BBD09D44574A35C869EA@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20260129232806.2197213-1-x.wang@intel.com>
In-Reply-To: <20260129232806.2197213-1-x.wang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|CH3PR11MB7868:EE_
x-ms-office365-filtering-correlation-id: cad1180b-cb29-44ee-9834-08de5f9156e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|42112799006|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Xv8jYMV789/difGuPCnaOwQL8hDrEk2tiQWGwB/8XrtlEpLzsFSsq3Rv/YzL?=
 =?us-ascii?Q?m9PBkK+AhVlHC24R+8iCyU/6BzdDTiKdwFetSaRRbKT240D94kJ5yZCiPt1o?=
 =?us-ascii?Q?6SNirBOusvt2mMhZaolN2yxPm3JTfb9O2R9XPU2RjsjthD7Bu2lQduiZ10hl?=
 =?us-ascii?Q?BuDmqrFCICSF1Jof2mXyl8xTIfr2PvnwU+3E2osGRVsf/dR4T7iRmtaNLt3/?=
 =?us-ascii?Q?VJi6kLthmqRtDRj2QnakPAuRFBFkB/KeXukUMo5ZSclwOFR6dGwC1IPjHn+F?=
 =?us-ascii?Q?pIACiItOueOUtnD8Pp9IwEyCpgcqFL+CKY1GZSFHUO6ONldV6pKuO9D7HefF?=
 =?us-ascii?Q?6pVsVMghl0dIV7a92F/HCAwPNv4h/iwwHdX/pC/qBPKhkQeTQPRLBsQP+NhB?=
 =?us-ascii?Q?cUaUIJ+uu2Wl+CkX0Ct4Vfc/toAQ9gmATKo4+Dr9uCm5+ukiZbb22VTS49OO?=
 =?us-ascii?Q?CUCXcxYnY88s7FY6kALtJDz8rzRhH4NWF7SnC/Wi8a+0z0Azaetg86X8+5OL?=
 =?us-ascii?Q?6CagxtxyYU8YucAiIFNqZtNSyhIJLMU2wcTSNl9+AI0xC4VmkCUERMXIUmSP?=
 =?us-ascii?Q?XOWxxFbvW4gr9nBx4YcNY/zG63R7j0V0ubDODR4sMMk/UMdvVXPOXS0lwyPP?=
 =?us-ascii?Q?Wi/KL/nLEr4Qnpf11ZlmRpxkHzaEku3XVFAfwGXLGNHvBoChaBsxzc4KWR2w?=
 =?us-ascii?Q?7Hll7i5EhBxsBmDf3EBzyjWY2AVYPcfIWyIJBJ4rKO+GsrDmzgbZ/xgWw9Jf?=
 =?us-ascii?Q?oVzLiwhC3rlts61MlwG4er52ixy37Q2IXgixcNYxx12wertitTfy4l3pX91R?=
 =?us-ascii?Q?NOEhbx3Wjm03N8UB8s1kJ29TJtRg+uNCW+g/LVT8K4TmjlN4ofdiQBHaClft?=
 =?us-ascii?Q?uPaeopKMlDWDkM3n3Um5gtt1CySc3KQdgAd4J2r3XusZ/7UOlSODk8pw8UXg?=
 =?us-ascii?Q?0fdXi6r34mCpk2G+tOvYPKgagcf718sqU4n3UAQFRQF2WpzIGnq2n2B0JUMe?=
 =?us-ascii?Q?ONAcfIMkENQYmgVTE73SKtPFZ3qCO02apuDsKciQHAq1fWY/qbJ2SYAQ7FmG?=
 =?us-ascii?Q?85+bF0XmxKbFKqn31EjfPG8oqEmPqfIg1B7wL04xwC8I6mS1Mp4UUJKZx7h9?=
 =?us-ascii?Q?m/a6v2dcvaNuqWyfVf7euTp+9sax5E7Zef1khFDQLfromUSy+4QeUbN/onWy?=
 =?us-ascii?Q?G6IkkZab6TUb0R77B4+n7mbSkUpQnIVwW+dheZsaKYZlxHKUrjAxs7Lh6eg2?=
 =?us-ascii?Q?wfnhEckKUUln4VpSfuHdWk/u1blnd/XlSstHINwoG9eO1mgG0qD2gK/YuEVM?=
 =?us-ascii?Q?ERlDCsxiPsl9IqFBmPY1Erk35ARvcsmjqSK9QTM/KQnbh2SSxQMD79HfM1RL?=
 =?us-ascii?Q?MebsBbaTtjB+hz2M8N8L/fcEpczaOTtAeNlyHHSKEsluiDzI8GnLK7QTv8xF?=
 =?us-ascii?Q?cYloAj99QbxjjS4WnNsBnu8rMkr7IATlQh/agxjb/Gj907ujsavscsRy+Fcv?=
 =?us-ascii?Q?EFmBmFkxEwl+rNoch2F2sxBDk3xRoTbcvc7c/3EYIaXg7BZkrbHdhaiNk1mY?=
 =?us-ascii?Q?5ULhdfxi/LWqGjE17TT/pdqrnlICaL8OZHwJpcRuRIlRfw8J7TvijX4uvh5z?=
 =?us-ascii?Q?B6C3duYpokyO0GN5Nyx3E5A=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(42112799006)(366016)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9TKu1G/PvGJmlyQCGgvgtmlrvha+Sv333eIDs26fFd6ftZK0LUyepzQ3JRJj?=
 =?us-ascii?Q?mCb41zcLwakFifJBCqF8kQBNQoqy5toibDOF7AVHrbcmLUOIl/2SIqAbggzJ?=
 =?us-ascii?Q?gdojQsi8V8kpebjHYyBM9MvKRg/xEPdx6fcEJHvrAEXmVFIjHn+KYbW4yc/Z?=
 =?us-ascii?Q?QF/bCHa4fKbiBX97YEdMSliTnFj9OlDKrUCfz0V7ksTRnYQcrCG/thBCFfjX?=
 =?us-ascii?Q?HxZrY91TV6A9P+o3Y61nHsAqHsCHQUphX6K9yy7GEtzeEgeR0i8MP2tdzcr8?=
 =?us-ascii?Q?8eO43ITCh+hRcjt1uLVNBPgpOihlHcn6iSWZJpq4NYewUQ4JrXsWAMk0fVMX?=
 =?us-ascii?Q?8earfFndef0znNv48h7hwRqOF9SKV7Qb32Qy2nybTm5K2QmvKg2SXyqQhwim?=
 =?us-ascii?Q?qnX6u2ZVSqEnh/cptTOvvwxWSzdkJP0u95gHMCl0wAYXElSr+GZLe0jsrPN2?=
 =?us-ascii?Q?lYh4yliixGjyTMEKNLnwx5bq6Ht/lIBHS06eyyu6Zs3G2hxzmeA6poqDv2Z0?=
 =?us-ascii?Q?82CZhdMAGA7CdkZycYkMeJKZe0v+uFm9xfZmE80sVmoCgJdUK3p1NtcFqESx?=
 =?us-ascii?Q?meQ5WiWVr422qBfxXoDSFD3mjZCcKUoMxrTxSY3gApUsz01yUzHARGWFzvtK?=
 =?us-ascii?Q?0hOvl4zjMnzj9RT2PubT1Ghii+UpWsT/y6nSG3gNm+NoL4xn/30ZflWBbNQk?=
 =?us-ascii?Q?6NWguYFEAojmZGjMthaZPRcmHWNDZapXAsAgON9YRTSAsALVA+hyTGtWvCKV?=
 =?us-ascii?Q?DIGeXLotetL+pXQYV5Y9AeFI8cKGMl9/lhqDUWx+dVavgA3jHl5P0h/nA2x2?=
 =?us-ascii?Q?AACLi7QkQTTQHENvAydthje0Hgpk+bHZYaCoWkyp3nQ6uFnbsbwcKGLMjKVr?=
 =?us-ascii?Q?ZzwMOI8BrMUCHwkRJdDck97BeqOdomzcd/xPqjKQ+0zkFV4rZNsLdacDyCkR?=
 =?us-ascii?Q?RJ4N3htcapIaBNBt8efI8SlBjZmYJb6Q7pbrIgHSFA+MdVkspbVNi0UFoQPH?=
 =?us-ascii?Q?+lLL8UB3CE/GCbe5/6D+8jhpF3N9ngo5hqRMj4I4svUHgXT8ack7Ao23/vKp?=
 =?us-ascii?Q?mGQHsCVq/fTmUnseDpC1/n8Y1m1cWCWvoQkhwHP/qqat2iXWMrLWRh+ILyCZ?=
 =?us-ascii?Q?174uuYF2vX4QubGxJom3MKod1gathVNCibvHAaWj5hap7T95ynT4fYSHUWPR?=
 =?us-ascii?Q?dzRbR/patKdclRmy0AAIYkryGzHep5V6CbNQtx1op3ChuvrkqTS+ulatexBx?=
 =?us-ascii?Q?fA6+d57r8KY2DiOxDvDF3dFftId7ix8B7UHVvPBZpSXiQGTCMgTCJX22a77P?=
 =?us-ascii?Q?8+EYjT4ODhMCp2FTio4rK7dr19cKIzqM+t9ubtJccRhjiq6kulYDVqfJPnGD?=
 =?us-ascii?Q?JYcip9tvly0HPF+COB+bKMWZxXeg9ss2b1Iuy+ECLNuVSFujIMsNuCbSGKoM?=
 =?us-ascii?Q?Jnz2lbvMXra3i5Q4ljbTlwbXq+JjwnFKjNFCBqhzvhbEArTpiEpjHDa12McH?=
 =?us-ascii?Q?84gwS+iyXzbRAGktAbF0fPAYD6J/fuDeo6ZWPVOCKBadJVQ+odv4g1v7B0SK?=
 =?us-ascii?Q?Mdxy+W21IZJxHUw5sNynpg1smLtY8zKO4oEdJtQXNqGmmK2swzzZFEGvJ85z?=
 =?us-ascii?Q?vyajjTBT70ESf5NSWJhFNJH9cYkBOtcdlaE9dwO52ArQp69le9ad8D1mjH6u?=
 =?us-ascii?Q?EmsN0v9hhzGGE0i5Ki7dxm1tOLVfMlUKk1KEjvQaTg91TUmn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cad1180b-cb29-44ee-9834-08de5f9156e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 23:51:36.5222 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AVsF64Xux1MvOP0lD00kNUs558GoPpn4xKaIE9jARaa+3ZCYHjpbWU987TsejMEKleIQCh6GR3gW3REkf2rpKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7868
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

This is not work for the SRIOV case. Will submit a new version.

> -----Original Message-----
> From: Wang, X <x.wang@intel.com>
> Sent: Thursday, January 29, 2026 15:28
> To: intel-xe@lists.freedesktop.org
> Cc: Wang, X <x.wang@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>; Nguyen, Brian3 <brian3.nguyen@intel.com>
> Subject: [PATCH] drm/xe: use entry_dump callbacks for xe2+ PAT dumps
>=20
> Move xe2+ PAT entry printing into the entry_dump op so platform specific
> logic stays localized, simplifying future maintenance.
>=20
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Suggested-by: Brian Nguyen <brian3.nguyen@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pat.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c in=
dex
> 14d0dce5190a..c33620478c99 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -88,6 +88,8 @@ struct xe_pat_ops {
>  	void (*program_media)(struct xe_gt *gt, const struct
> xe_pat_table_entry table[],
>  			      int n_entries);
>  	int (*dump)(struct xe_gt *gt, struct drm_printer *p);
> +	void (*entry_dump)(struct drm_printer *p, const char *label, u32 pat,
> +bool rsvd);
> +
>  };
>=20
>  static const struct xe_pat_table_entry xelp_pat_table[] =3D { @@ -480,6 =
+482,7
> @@ static const struct xe_pat_ops xe2_pat_ops =3D {
>  	.program_graphics =3D program_pat_mcr,
>  	.program_media =3D program_pat,
>  	.dump =3D xe2_dump,
> +	.entry_dump =3D xe2_pat_entry_dump,
>  };
>=20
>  static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p) @@ -51=
8,6
> +521,7 @@ static const struct xe_pat_ops xe3p_xpc_pat_ops =3D {
>  	.program_graphics =3D program_pat_mcr,
>  	.program_media =3D program_pat,
>  	.dump =3D xe3p_xpc_dump,
> +	.entry_dump =3D xe3p_xpc_pat_entry_dump,
>  };
>=20
>  void xe_pat_init_early(struct xe_device *xe) @@ -607,6 +611,9 @@ void
> xe_pat_init_early(struct xe_device *xe)
>  	xe_assert(xe, !xe->pat.ops || xe->pat.ops->dump);
>  	xe_assert(xe, !xe->pat.ops || xe->pat.ops->program_graphics);
>  	xe_assert(xe, !xe->pat.ops || MEDIA_VER(xe) < 13 || xe->pat.ops-
> >program_media);
> +	if (GRAPHICS_VER(xe) >=3D 20) {
> +		xe_assert(xe, !xe->pat.ops || xe->pat.ops->entry_dump);
> +	}
>  }
>=20
>  void xe_pat_init(struct xe_gt *gt)
> @@ -658,12 +665,9 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct
> drm_printer *p)
>  	for (u32 i =3D 0; i < xe->pat.n_entries; i++) {
>  		u32 pat =3D xe->pat.table[i].value;
>=20
> -		if (GRAPHICS_VERx100(xe) =3D=3D 3511) {
> -			xe_pat_index_label(label, sizeof(label), i);
> -			xe3p_xpc_pat_entry_dump(p, label, pat, !xe-
> >pat.table[i].valid);
> -		} else if (GRAPHICS_VER(xe) =3D=3D 30 || GRAPHICS_VER(xe) =3D=3D
> 20) {
> +		if (GRAPHICS_VERx100(xe) >=3D 20) {
>  			xe_pat_index_label(label, sizeof(label), i);
> -			xe2_pat_entry_dump(p, label, pat, !xe-
> >pat.table[i].valid);
> +			xe->pat.ops->entry_dump(p, label, pat, !xe-
> >pat.table[i].valid);
>  		} else if (xe->info.platform =3D=3D XE_METEORLAKE) {
>  			xelpg_pat_entry_dump(p, i, pat);
>  		} else if (xe->info.platform =3D=3D XE_PVC) { @@ -679,14 +683,14
> @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
>  		u32 pat =3D xe->pat.pat_pta->value;
>=20
>  		drm_printf(p, "Page Table Access:\n");
> -		xe2_pat_entry_dump(p, "PTA_MODE", pat, false);
> +		xe->pat.ops->entry_dump(p, "PTA_MODE", pat, false);
>  	}
>=20
>  	if (xe->pat.pat_ats) {
>  		u32 pat =3D xe->pat.pat_ats->value;
>=20
>  		drm_printf(p, "PCIe ATS/PASID:\n");
> -		xe2_pat_entry_dump(p, "PAT_ATS ", pat, false);
> +		xe->pat.ops->entry_dump(p, "PAT_ATS ", pat, false);
>  	}
>=20
>  	drm_printf(p, "Cache Level:\n");
> --
> 2.43.0

