Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0D5F327CA
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 09:10:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27DC10E84A;
	Tue, 21 Apr 2026 09:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cD07jqSY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BB310E84A
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 09:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776762657; x=1808298657;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B/S5jMZ+SEOb+lY+ecNXqOWUYAVPnxXawiXq21aC3qw=;
 b=cD07jqSYAEtwGWfFb1v+GQFrNkIf9BBidwYoNcXnSZeftRCGtZztsM7m
 ETfGbZKzWfaIX2b8txF3PCCwK0j+Ph8j8XL/jjNzigfN84mjLhDsdxA+0
 /vAhBGQqTy+nj53ysBpRFYh9uMPyaANiEJmSdss6pyZjxjc271bdRO95/
 3S9JK5tDRiGEEGvu/a71n9fG6+qPJD4Fng4be86xRapiXP+JWZyiHeMHv
 vGIcem/F9xWeqYAyznjuM0q+fTyz9L6fWNC/nmQmdKfQzrmAoAqkur3SU
 SsPxIwAwEpzkwAeXkhpN7Iij9FR+S1rnSFwBEYLX2YAgldBmvCsYIcWuY A==;
X-CSE-ConnectionGUID: 2rAN26HGS+WhoqXB2BXkyw==
X-CSE-MsgGUID: 0kTGhI5vTKWMc5e2wVdZ/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77705478"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="77705478"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 02:10:56 -0700
X-CSE-ConnectionGUID: DNgCczMWSbeiDWdYqnBS1A==
X-CSE-MsgGUID: 7FuwSiv9QPK5bpwFyVyd/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="255446371"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 02:10:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 02:10:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 02:10:54 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 02:10:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8Rir7srqc3Q1ZGFdspFEf8yainy8O2e2LRFsuEODfizWy1ztklvrYekN+/ralfm4dAEGOZFUOsrdlInYeZb/VOseswvmryH2lCz9+R4E3demDt4/19fxnzJAj3hCrZNfDOPdvxXoAqqOFCFM1NcOVqst97Y5EiQa0X4dgKGxBXjnAdwrxVjDn7ALt6RkZGb1fgldasSJlpFcPibUvy46Pm3TTiwHn4rHltSh2uhzid9vwuzUvevuf9LMtG6wVAelYO5+kUazkImn1KFHATnkYN+BjXkBCdSqx2X6QnrvzfrxEyDJB28Fne5oi7Ik1A1PWqqKMaVop6cEn/x8ZfwQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zc0hYZWy6UnHH4ddpt3WPW4pOwFbLMMucYwu3u6dcM8=;
 b=A9u8NWGrkl6Dit8AgBaakZGL6VtiFMcEhlXV4ap1eKTz2x3vLrnsj3+MZ9mr/g+/i/rRtnwoXoqQtevW6y83s40AkAd6FpFBhmxwVchEzyyGLAbXJiXdJCn53uwBSltVMA2xDPJEDesLmqXB5NQ+oM7j6plo8N9ID0v7+uWPB8k6d0sDrMSeSuQXkTW9d4JUBUxeeY7WyWg1hc0cp7hrLMJD4lNGyVUwB0Yh9unO9nYnarrccFrbow65ipjodY6Beop+Wasxlhda65niViQdxGVq+SrYxFxxkVvtBEgZpvf1TrA0m3j0Pu/1VKW7+x8y+8MY6Nf+UPlj+4MlLmetxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3227.namprd11.prod.outlook.com (2603:10b6:5:5d::16) by
 IA3PR11MB9110.namprd11.prod.outlook.com (2603:10b6:208:576::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Tue, 21 Apr
 2026 09:10:50 +0000
Received: from DM6PR11MB3227.namprd11.prod.outlook.com
 ([fe80::2666:d656:48ff:cc9a]) by DM6PR11MB3227.namprd11.prod.outlook.com
 ([fe80::2666:d656:48ff:cc9a%4]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 09:10:50 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, 
 Mallesh" <mallesh.koujalagi@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH v4 11/13] drm/xe/xe_ras: Add support for page offline list
 and queue commands
Thread-Topic: [PATCH v4 11/13] drm/xe/xe_ras: Add support for page offline
 list and queue commands
Thread-Index: AQHczkPh79YWnBeS4EGOEQsY9ar4iLXpQF7A
Date: Tue, 21 Apr 2026 09:10:49 +0000
Message-ID: <DM6PR11MB32277AE94FAD89591953174B812C2@DM6PR11MB3227.namprd11.prod.outlook.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
 <20260417085812.4013309-26-riana.tauro@intel.com>
In-Reply-To: <20260417085812.4013309-26-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3227:EE_|IA3PR11MB9110:EE_
x-ms-office365-filtering-correlation-id: ec71fc4c-7a95-4d1d-696f-08de9f85e1d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: FCQ5Ccd2hqmjFZ07Z+DDQs+SfF7Fe2iH5HOI6xlAltlVqYhM6jenVGDL3iZs+1vYRUUnVsoPb2S0dp1tjvOSPcet7lFiTiy1V2AaBC+g02c5PwHGuPB86whcnjSOTwUSB2oex8hXpTdXLvDFnDUyqeurPUuAq1le5sLT5S+Gxfv+fZCf9qNPT15CSH8rg7hwzE+bndhYxHNmkv88YgtKg0uhlu2Foi8/PCpKsHVGLIXIKm3fALSb7hHVDsvpexU+PhjswdgojEOqzmP2nJOQRe+gGJxxqeFjQE8I1NEAzDPbj4zNyPDzZIBT8iPhmqOE06pGCOTctBqpbSyVoL/8mySuBi19pGR2jI4fwlH8lerUYas1w/PFUb9ShFoaHvy93YpONx1gxNPsxfPKtQZxuMxir2onmdzSY4P6nYaK5tbvSoBtZZbRW7UFFJcB7DUbzpv1YH0XPAYhdDQl7ZZWvXejQL3tLYyKv0QHx5cpQoB2Bj44XbnGZ0gbHYPNuMOs1SVliqcLsH1Ngirx+/aaOJenGZN9kyV010IjlQgRYxTt2Z4WTkEMvgeBB706PEFVv3vlxXvsA0EAqDqfBom7TBXIuySUofDZstBIWbOlYAgrBL4ka70N1niXsk2fdx3QFpAdZ8o3fRzTRolImzVjXj24L6q2aVeyYx1eQvW9VDfLP4xFsIHT/uVZlAz1ayOfb4C9xKnJWveke9o93TN0VhGrTS6O6FTXA09DMKn8uQxqUHZoXUbsw44Tq2LKIQUPIa/DBlVTTlig7hVIM62D6BCi7EjImjYjZ5oIY64nUz8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3227.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?muUnj1vK+WNgcjS+ltmLSaTJfTLyf8kkgJmwl4rulLGyjKtQgkCWPfMA9m3w?=
 =?us-ascii?Q?XQoh0EhPcemFB6eCqIc7mhdieD5OLub7KCbxJx/N0opwF3ohnk5Rmj1F1W3P?=
 =?us-ascii?Q?kTWJahT0ywE3xNAP2QrCiePGa+XAdqufO3SHToHBxtZhFwLRgJkJRZaYHOZh?=
 =?us-ascii?Q?uZw6K9ywLaiIGn4zvBKpL8CqdQ/7fzmEv2JDBCow3v2hROYf83MZZ5R/riHj?=
 =?us-ascii?Q?bqdWpT2dlz9HXIL+Kgm7L6BhFxBBFbS/HtfD15ouyuKpcPEsE+KI7UQJOJev?=
 =?us-ascii?Q?2ugnU5AzRLHpcAi3lkTuqHKGSeZKp4L1MIiYgtbobBKN89Ih9n7ZKSKGx04X?=
 =?us-ascii?Q?66mb0p+p5pYEiFSr6jQiRY9WTOPZSbof4jir2OZf8sRJS3s/xtV9BvPo9gBn?=
 =?us-ascii?Q?2FqtN1VSa9bbwP+PSR6L2S8/yrTKpB9HqJkLIQjq5GEwv07DKJ6Q+9D4ESFN?=
 =?us-ascii?Q?cpbSgeR8Y+fPz6n5X35RVxTWi4OuT36gF5u5P+VlPARa+jGomJ1FwjVnVE75?=
 =?us-ascii?Q?OAJM6quyaKK7d+u/AwHRXJcwYeJ/LNDD0bqTt7KiHtQfTVroD8If387LSenP?=
 =?us-ascii?Q?M3ZPyn0Z7gIp49rPe+M7+zSioxBGrNE+o2XK2/+L0pY2CJvVl7sodPWt6pMA?=
 =?us-ascii?Q?KiN19gMVJYDC8QQydfBd5k0cJEUladgYdUlReoTUg7akR+6vXT6dfBRuahxh?=
 =?us-ascii?Q?RDZIt89JErn+xy649F+OJCacoTUOyn/0vAafCXuiV46GhpR5CmF6YeN5/nJ0?=
 =?us-ascii?Q?kbdI6pPiE4F7yn216EC41XXbjY/eElmmhOcPXqheD2wCf2sGidGC5qn4dVHN?=
 =?us-ascii?Q?ltIfCZLodeBLVWniw7GQR4bJo3Jr01zn4jvBEaKI7xeyT1C0bDad6VldFTMG?=
 =?us-ascii?Q?oTSW4OAq5yQ7XaJTUTmziFOYzx+VWLua6D2QOBI2TTpCRAMfD7mxufX/yq5T?=
 =?us-ascii?Q?3I1H2IP3N7iIZsyH/BNsqv+J+H3zorluUCuz55E3mY/mvvOMoE4xmkVQ7SB2?=
 =?us-ascii?Q?o+FWlrGxtqj6MPXb2s9VLcjrrFPJIMr6U3CQ8ZPmZ71Uo5RxF52hVZdafpnk?=
 =?us-ascii?Q?Q8wTItnnQjq4y8D+KGSOPq/Vkz6Heof+BUjinLNJV12EaD4gu9Qeyd3u5ttE?=
 =?us-ascii?Q?NS51558UCblK/usvb1y3DgYdZvvqWpvCRn+Dl+qvh2n8LOgjgiHQLhT4xuJo?=
 =?us-ascii?Q?mNfx89B6b+sTHbjDe6lWR4P/d1qH74VCBHhn5EsYiRE3WSAoCukOVnf9+0M1?=
 =?us-ascii?Q?RwTUTsu+FEzpDZAfjCZ9lwMiupJMJygXY5gGYtQRP2vC4A2o9TZlEnOPhzlh?=
 =?us-ascii?Q?wgxmGfgPOaRA2yUutzcupt8bSZnAYJX1QiQjrfRhwEx9Q85NvADqqqz845+H?=
 =?us-ascii?Q?S00j9BIw8LDZAiNOBlxQ6wvWHZykjRnAE4JpsfDwyt7xYBTA4mfhRbf+OZho?=
 =?us-ascii?Q?ANCzN2AzlTg3oRzwtqG5l/plCxbl8Y9Koi0ENBt1Z1SNEKaDsMVUW6VSlJcR?=
 =?us-ascii?Q?Pv/XsDKTQfCNPvomZL3e2HHCB6zCDr9ACgIz3m0MjNo757PchvgqLaDIM9ll?=
 =?us-ascii?Q?0NyMpv+vHv6sfNuMb0cUgCJT8r2dH/3JiAIZcVVbfVatcbXznkZuUt760Vbi?=
 =?us-ascii?Q?q1UsOVIG45IT0l6iulb3NcOUrrW+2ss/F2CmsuT2BJPghUSBQjzjeW/AJoEf?=
 =?us-ascii?Q?CJjtQKDUlraHnN3nCc0ECxU4oxjohVlfZAgb9CUj/jHvmKzHYcfaz8D41D39?=
 =?us-ascii?Q?G1lHY6rihw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ZF0kpIRL8HJz9UV5Pjb7DQzYg/chJAvYovTXunlmQOiD7h1PDiEeVinWna6Of6Pg+md/ylkXFgU4+IUHcK3BNVPNtUbr28QHulC/tH2yf1harl/YM7aMtdWrygLcsjOPRG/JR4/113xuJ8Aea8L3QRutxYKFlqnhf00H/nbwZP7PBDSWA+MZm17SgbRC0RAtxu3fwqsRot5ivO/PfJxiEDCFYP0QzadjxxQf6xvr0Uo05QAlbwA22QUZDseu8AnzgWnotq2u8sr1JvQ3vycg86ChrPFkx9DJehYghCVe4Xx9Ryzb30kJtE7mKXdi+PmjAQp/2pIuBWFjW00feN0IqA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3227.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec71fc4c-7a95-4d1d-696f-08de9f85e1d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2026 09:10:50.0949 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W3WMU5CD91XAquZYnhdKKmtoFpgdZ1EQFKHcR6gFbvd+pWd7Cw0jRYnQq03mRlndaDkzHNUJtmv6Y9XdH/qlElq4srLIoBMUgrNwaxNu/0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9110
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



> -----Original Message-----
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: 17 April 2026 14:28
> To: intel-xe@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Koujalagi=
,
> Mallesh <mallesh.koujalagi@intel.com>; Purkait, Soham
> <soham.purkait@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Subject: [PATCH v4 11/13] drm/xe/xe_ras: Add support for page offline lis=
t
> and queue commands
>=20
> Add handling for page offline list and queue sysctrl commands. The page
> offline list command retrieves pages that are already offlined by the fir=
mware.
> The page offline queue command retrieves the pages pending to be offlined=
 by
> the firmware.
>=20
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ras.c                   | 85 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras_types.h             | 39 +++++++++
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  6 +-
>  3 files changed, 129 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c in=
dex
> cd1ac6441b92..42ec27c05e9a 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -319,6 +319,87 @@ int xe_ras_page_offline(struct xe_device *xe, enum
> xe_ras_page_action action, u6
>  	return 0;
>  }
>=20
> +static void get_queued_pages(struct xe_device *xe) {
> +	struct xe_sysctrl_mailbox_command command =3D {0};
> +	struct xe_ras_page_offline_queue response =3D {0};
> +	u32 count =3D 0;
> +	size_t rlen;
> +	int ret;
> +
> +	/* Supported only on platforms with system controller */
> +	if (!xe->info.has_sysctrl)
> +		return;
> +
> +	prepare_sysctrl_command(&command,
> XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE, NULL, 0,
> +				&response, sizeof(response));
> +
> +	do {
> +		memset(&response, 0, sizeof(response));
> +
> +		ret =3D xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +		if (ret) {
> +			xe_err(xe, "[RAS]: sysctrl: error ret %d\n", ret);
> +			return;
> +		}
> +
> +		if (rlen !=3D sizeof(response)) {
> +			xe_err(xe, "[RAS]: sysctrl: response size mismatch.
> Expected %zu, got %zu\n",
> +			       sizeof(response), rlen);
> +			return;
> +		}
> +
> +		/* TODO: Process pages and offline them */
> +
> +		count +=3D response.pages_returned;
> +		if (count > response.total_pages) {
> +			xe_err(xe, "[RAS]: sysctrl: Pages returned exceed total
> pages %u, returned %u\n",
> +			       response.total_pages, count);
> +			return;
> +		}
> +	} while (response.additional_data);
> +}
> +
> +static void get_offlined_list(struct xe_device *xe) {
> +	struct xe_sysctrl_mailbox_command command =3D {0};
> +	struct xe_ras_page_offline_list response =3D {0};
> +	int ret, count =3D 0;
> +	size_t rlen;
> +
> +	/* Supported only on platforms with system controller */
> +	if (!xe->info.has_sysctrl)
> +		return;
> +
> +	prepare_sysctrl_command(&command,
> XE_SYSCTRL_CMD_GET_OFFLINE_LIST, NULL, 0,
> +				&response, sizeof(response));
> +
> +	do {
> +		memset(&response, 0, sizeof(response));
> +
> +		ret =3D xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +		if (ret) {
> +			xe_err(xe, "[RAS]: sysctrl: error ret %d\n", ret);
> +			return;
> +		}
> +
> +		if (rlen !=3D sizeof(response)) {
> +			xe_err(xe, "[RAS]: sysctrl: response size mismatch.
> Expected %zu, got %zu\n",
> +			       sizeof(response), rlen);
> +			return;
> +		}
> +
> +		/* TODO: Process pages and offline them */
> +
> +		count +=3D response.pages_returned;
> +		if (count > response.total_pages) {
> +			xe_err(xe, "[RAS]: sysctrl: Pages returned exceed total
> pages %u, returned %u\n",
> +			       response.total_pages, count);
> +			return;
> +		}
> +	} while (response.additional_data);
> +}
> +
>  #ifdef CONFIG_PCIEAER
>  static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe=
)
> { @@ -394,4 +475,8 @@ void xe_ras_init(struct xe_device *xe)  #ifdef
> CONFIG_PCIEAER
>  	aer_unmask_and_downgrade_internal_error(xe);
>  #endif
> +
> +	/* Get any pages that need to be offlined from firmware and reserve
> them */
> +	get_offlined_list(xe);
> +	get_queued_pages(xe);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h
> b/drivers/gpu/drm/xe/xe_ras_types.h
> index d76310866da5..1a5de6cd16a1 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -10,6 +10,7 @@
>=20
>  #define XE_RAS_NUM_ERROR_ARR		3
>  #define XE_RAS_MAX_ERROR_DETAILS	16
> +#define XE_RAS_NUM_PAGES		25
>  #define XE_RAS_IEH_PUNIT_ERROR		BIT(1)
>=20
>  /**
> @@ -297,4 +298,42 @@ struct xe_ras_page_offline_response {
>  	/** @reserved: Reserved for future use */
>  	u32 reserved;
>  } __packed;
> +
> +/**
> + * struct xe_ras_page_offline_list - Response from get offline list
> +command
> + *
> + * This structure provides the details of offlined pages from flash.
> + */
> +struct xe_ras_page_offline_list {
> +	/** @max_entries: Total no of pages that can be stored in flash */
> +	u32 max_entries;
> +	/** @total_pages: Total number of permanently offlined pages */
> +	u32 total_pages;
> +	/** @pages_returned: Number of pages returned in this response */
> +	u32 pages_returned;
> +	/** @page_addresses: Array of permanently offlined page addresses
> (4KB aligned) */
> +	u64 page_addresses[XE_RAS_NUM_PAGES];
> +	/** @additional_data: Indicates if more data is available */
> +	u8 additional_data;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_page_offline_queue - Response from get offline queue
> +command
> + *
> + * This structure provides the details of queued offlined pages from fir=
mware.
> + */
> +struct xe_ras_page_offline_queue {
> +	/** @total_pages: Total number of queued pages */
> +	u32 total_pages;
> +	/** @pages_returned: Number of pages returned in this response */
> +	u32 pages_returned;
> +	/** @page_addresses: Array of offlined page addresses (4KB aligned)

I understand that we will have 4K aligned addresses reported to core offlin=
e API right? If yes can you also add double check before passing if its rea=
lly 4K aligned?

Tejas
> */
> +	u64 page_addresses[XE_RAS_NUM_PAGES];
> +	/** @additional_data: Indicates if more data is available */
> +	u8 additional_data;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 2cafa8a14cc3..b6139ac0eaca 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -15,10 +15,14 @@
>   *
>   * @XE_SYSCTRL_CMD_GET_SOC_ERROR: Get basic error information
>   * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/decline a
> page
> + * @XE_SYSCTRL_CMD_GET_OFFLINE_LIST: Get list of all offlined pages
> + from flash
> + * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Get list of offlined queued
> pages
> + from firmware
>   */
>  enum xe_sysctrl_mailbox_command_id {
>  	XE_SYSCTRL_CMD_GET_SOC_ERROR		=3D 0x01,
> -	XE_SYSCTRL_CMD_PAGE_OFFLINE		=3D 0x08
> +	XE_SYSCTRL_CMD_PAGE_OFFLINE		=3D 0x08,
> +	XE_SYSCTRL_CMD_GET_OFFLINE_LIST		=3D 0x09,
> +	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	=3D 0x0A
>  };
>=20
>  enum xe_sysctrl_group {
> --
> 2.47.1

