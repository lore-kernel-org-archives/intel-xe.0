Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B522CAC592
	for <intel-xe@archiver.kernel.org>; Fri, 19 Sep 2025 09:33:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003AA10E973;
	Fri, 19 Sep 2025 09:32:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jssbhAKk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD6910E973
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Sep 2025 09:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758274378; x=1789810378;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mkBgMbnb/BNMd0l4waZGpgHH9lU0VdGKA4MyUlGFcns=;
 b=jssbhAKkTyi4BQLcPFI+eJXbieOSUYWtIjuyYAH1HlERkKf/L1BEny+y
 G5d4A224TrpL7uvS3PAgF0DnugLCflfo8lYQWGMUNyCHdkbEOSovO1Tq1
 bPeYnq8O7cFTh9b8HJddkFPP44LFX0gpgtADQUICxKd1SpbkaNfB36+nI
 XbZ2FqjEMV1Uo4uIsB/xIdKo4F6IwjV66JuAIlXTYyfBNJaHRKn2hq8tz
 La5Gc3+ga/6R0EnA6iXE8mgRAcdft0k1gqEFAlapgwIkJCJwp4y0i9Mz5
 zB9ccfXLBYUekHPxQFuPm/OePDjexYQlrbNFlBUJXnofSlMHW9AvZisyQ g==;
X-CSE-ConnectionGUID: YhBMDt81TJuG6T40YOruDw==
X-CSE-MsgGUID: Amba5ebfR66UFAMOLGsCPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60672193"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60672193"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 02:32:57 -0700
X-CSE-ConnectionGUID: uG8xxA6sRymS1M54IsV/ig==
X-CSE-MsgGUID: admfe3WeRza8Zm3gAKsZhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="181068366"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 02:32:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 02:32:56 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 19 Sep 2025 02:32:56 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 02:32:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EU/xo5wwGRCtQuM/VHtt+aKGpIOurTLYu6l2Q8cfHQdGkVgNIUnI+lzRjpSxECENlN0sY7eBVHhd0cFHoPnkM32vCK3/EqDkeIDd5TXFoCmySVJTLmOveejfurzTvgYnXMWd9SO2wzTEb73+A6n/ifF8+gm8kz9jxT39+c6OGzJbv2LpqlyxAjHwT5CO2H6LhE3ZDyCl//xsSv8BnLF56CEIpsknsPsPBZn5xRnrVA/8WXYCVhUTxILPjQxJy3M2+VX95Fg2Did99gJ8QarmEHg2l92As/hPSL4KdDeFqkgvEqBL3Mq8EqCoXd+ULF5Ymkpt/mpiWvLlvs2EpKiDZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faSv+dpO6WpLiwUBeXaAiXPdghUz/21W+7NhKBsmwEw=;
 b=DFmy6nranE1iZaBnP3wZlLitTkoIMIyraH/VQf6vjDA1lgC1TclH/RO4VH84pDSExVWaUbfiNQ+LjQ23DI0c0/7Ik6gQTjPaNXrUtrRZFafQls9sU28CzKHHoOFwfP15N1vIn9GCmjszDsrf8GVdEajQnp/jbGbu/E/f71G2kqBxPp4HKNhgTWrtDCe+CmHdIKuGyOQyb3qrj0/e7MojvLTf7vhUBvcG/VGRaEpxDejJyelr2D87oLJ6frqmPgkHvrS8XslRkrDita6oqIMaXSuB+3spGQ5IkDQmRXcC1LJj5tEQfBlNtB0nYkuB5v2goIhvqz2oneUiuj/6Z4Yb+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by BL1PR11MB5269.namprd11.prod.outlook.com (2603:10b6:208:310::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 09:32:54 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.9115.020; Fri, 19 Sep 2025
 09:32:54 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: RE: [PATCH 1/2] drm/xe/huc: Adjust HuC check on primary GT
Thread-Topic: [PATCH 1/2] drm/xe/huc: Adjust HuC check on primary GT
Thread-Index: AQHcKOEfKwoYAyTsS0SD3sp8wH0Ab7SaPm/A
Date: Fri, 19 Sep 2025 09:32:53 +0000
Message-ID: <SJ1PR11MB6204C31D89684F8B6ADF05FF8111A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250918211319.603324-4-matthew.d.roper@intel.com>
 <20250918211319.603324-5-matthew.d.roper@intel.com>
In-Reply-To: <20250918211319.603324-5-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|BL1PR11MB5269:EE_
x-ms-office365-filtering-correlation-id: 475bf9fa-db1a-490a-8bc1-08ddf75f8297
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?RveIzFChfiBYTWSdP9UTb2AaUSrGtpX0SaswAgjy2URHDk3QnTZ+xr61cADK?=
 =?us-ascii?Q?dsnEREGqLLLIkMxQnFlB568opxLhwr99pb5r4UN+0pSoiC0gfjL0uDXB6eNF?=
 =?us-ascii?Q?heZZz8mt7HIO6JFdh0yiDrwOnOoX/ULqV/uBA5LVkR4zf5TxnxTu56mPiUPu?=
 =?us-ascii?Q?C2tiHz3r/yuDaVvq3JxFqzfNg0UCqAL+CluFTWYs1kzWIbmVjedCFk+gH/tu?=
 =?us-ascii?Q?Qcu8Vyeg5n34Rt+p5rK1shUTgKykJAU08csGPHu3TDnvtXlOG8I4Vr9UHvxo?=
 =?us-ascii?Q?PtDeYcTRIyNnaXa+H9E+iVREmmD4diSj1HEkGSkuXAmJKdvGkUZU12k4+vpo?=
 =?us-ascii?Q?9PPYQw/EaTmKWyAFdS9bUJEi2cAyBzLExSbvUwsyZzA04XBaOaMhuxISWlNY?=
 =?us-ascii?Q?P5GfT5/GGVBYkbfPPPL8sR0vlMK5SsCe8QTNxqfN7Xjq+SpCXdwlgNqAspgn?=
 =?us-ascii?Q?en6KIcPm5dvQN52ShC7WopnRSgNGyak9j4ycEReVjRG44gAWtuhvQFFwvFf7?=
 =?us-ascii?Q?oqUdoCAMaYRcHAdmCFNLoI+TQs8fGXHnigRuRWbjp3OKH7O5+xlq2MU+v4nU?=
 =?us-ascii?Q?M8kKwgaqcZcRaMEDq/puUr49PMDUNGl3TR6UUNFCdKz2OCRD0M5S4Buh8mrW?=
 =?us-ascii?Q?6LiyFT4FvFX6hKrU+nrKCtd7VPRfHWRCGGdhu/6CeMRCtbTLaQXI99tHiE0g?=
 =?us-ascii?Q?o1y2bxQm6T0AwXqaSg4u7JsuGlilMiF2hpxq1CLhJqK67ziw3QXd6Pf+SNJS?=
 =?us-ascii?Q?fYumcaYQcKYBk5BuKv4EfhNYw45TZ8U/URvtuj7BqoT+WguPwAwGITwhTckI?=
 =?us-ascii?Q?SHMznC9Sp9/TCD2iytgXBTGYGuXl6yFlnlzmGq7BZAnqw4Gd/RMoG4lT491s?=
 =?us-ascii?Q?d6x/h0Pnjr7wTvQoT6IQhXPQ2u+iIT+1FRPXnrHJj/hv4uF1WMP7cVDsfAoA?=
 =?us-ascii?Q?ySDI37uuiZPEyUz5VzsF32EpUb3qzY2fAI4eEFTgZu5l4rTU+MawmWPXNbaP?=
 =?us-ascii?Q?k8fEjExlOGXJSZIDGU9NBqHbjKLnBsnAk8C7k29oWG5As6x2icGapsUplP01?=
 =?us-ascii?Q?Y8ciG8xReYjGgcvd5f7wPxKlpf/AWgByKvK7ubcvhA0twrIdSwq+/2KVPrO+?=
 =?us-ascii?Q?9KOL0hYIfXO/0irM5/i8UArvsF6zjAqSXlfKJPhZhYoi3xmXBZ266JXIv9rB?=
 =?us-ascii?Q?/8at9ZKMlzUI4yR+xaRrm8/ZoDDC7OKEMu6l7kjlq0WJMTWynTl5oE6VcTYn?=
 =?us-ascii?Q?IptRarYviqZuC2B8VSsnvZ87LzR0VpuCKjCZJwowRuebiJELqEkTnHtMpJMN?=
 =?us-ascii?Q?q5k0yuG9NJ6OwcgwA/sq1APRw13lnzK3zLDX8CXJkuJY7sBLLmPemu64L0Ph?=
 =?us-ascii?Q?D0tyc0qUYfiKbqmWyz3ZjEvoV4ZA40LOJebMuLe6pAxuWIYu54xbdKSP3FCP?=
 =?us-ascii?Q?rn8xcbdDFr9jyF6WBbQhElGYvg4F+xMPd3DzlspIIRYhD5FEdfzrnw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VIb3IGRk9aSmlLib9XqIbvuIaeVZyoULF8Xi1DHfUunFpArYFyXPuIRLpKzl?=
 =?us-ascii?Q?fDxsSRRTTh2xqn8496DPlcuf8gGJj2I1RgyqFHD6qN8tY8B42KrjZHF6rgka?=
 =?us-ascii?Q?RdXOq94RL+fLIDSnwYgexI2MOEzyQFVHyoKbS4VJnFdIV+NUqx2JFgynvTrz?=
 =?us-ascii?Q?GgUPs90KHrC+Rpe7orD4KocipJxcsdTem+JztSpi3PNGEvapTUXrcEHvOtQw?=
 =?us-ascii?Q?Tu5UhHOO0uRpXgIXQ6MJ6iJ2ac3TWRasz6owt8SsfMvmAn3XLKPHfA6PMWa2?=
 =?us-ascii?Q?od6fHkFanyw0udr8Sj1pLi+z3XvkE7sZz/744/It2vAzIKVou2mTSeLtxTF1?=
 =?us-ascii?Q?mVpPEEyI5mfF78Zb2Zrl25+HB7KBSf0Af7z0UikPxnFxcT+FGbJD3nu2229z?=
 =?us-ascii?Q?v8Fpt5CwVICAnDxVrMLA3ySB00z337hd6reAc9zwYRkCDNqXcfccLcNgj5V1?=
 =?us-ascii?Q?ISc5dW3Py1AyKGV/jFFYjVbOoqwT7CaUigI3DtLbkOcZGhmaOIhU0mjnxSy1?=
 =?us-ascii?Q?Hs9B4QTzcMrz5CZ3xJ1ZYMt35DFbm1S3Xm3/v3WhlYxNz1QmrWtYjxB9cg82?=
 =?us-ascii?Q?+Yd2J9f5Fn4kisS7B1OmCJYyQcAqg9rVY7Z1GoR9Z/1fl3ZGTJQn8YW+ajvs?=
 =?us-ascii?Q?zuanoMxbFXo2KRG3SIPLqDnBGQ7F1VeWlKD7Gjmwbdnqg/b9kL45Xk6v9+4J?=
 =?us-ascii?Q?iIQFYRiERUfiueTQWS/xhIhbb6j5FPogxJC9Mi6j2IHcsRgKBQYkkvf9gZG1?=
 =?us-ascii?Q?agzxTsDkp7pzCUj2RV9mLYwc9FzlhoBzRmAiU2G0WK7zwBvjLurAp5k9f9OU?=
 =?us-ascii?Q?/ZWkP+o2Ms3mX5fY6Od01dcZNNWEqVTVVXqnMaF9VIikaI6S7d9+5IUT+RLF?=
 =?us-ascii?Q?WU93NJtFMN8Hc4cASP4vgjV2hlDLm8cPdKFBBQomn+2kvNUM9kYCqWqvX4au?=
 =?us-ascii?Q?tssKCI4Y4Myo2j4ZrrSo2DuTv/EWvtTB/kIfDFU/QE6t7yXDkM2m3bi3toGm?=
 =?us-ascii?Q?jQrvyEmWabBHvNI+m05EZGYkRf9fVqc4hZQGUyIjF4iFljgrbXuYc+uCN1pv?=
 =?us-ascii?Q?xaxXlnXVZnqmSHGohRNo+6x5GUaqc7fXmy7hUSFFLXUOsf9g6YoX/gHamEBK?=
 =?us-ascii?Q?jD7YVv5xPIDhsif/JPqS/eChsM+lNvZdxYcy2bBRklfr1iENsCbOy6uNZ+Ap?=
 =?us-ascii?Q?eN1lH6vOkU8YuHT+/bzdrJBHZbd8QCd0So97EHeLU5CipP1rVZBWsvBeUf8R?=
 =?us-ascii?Q?qHBdk+WVhgiLCoWw8GhQ73aWtvjwD3/yQ0zNOEakK+pDheAL6XyIpvQuD0sQ?=
 =?us-ascii?Q?Sldm0/BipQEHnPCOniHLKNONqG4h826CObvo3It64Mvg5F0J6+ZgWaMtu3ZC?=
 =?us-ascii?Q?LFXGiwou4f2wvJkoW3L8+ZuHDj6q1XxjLEyHGQbNprwKT46wxc+9eBZXexIN?=
 =?us-ascii?Q?Q9ZkjVE9Pi4moEssb7NUmGZlBmhVHi+dxYX0O3iJeRXliuAKavJVSGiuLpBF?=
 =?us-ascii?Q?qC5d4GJ0wg0daM5Jdef2PIUxm5C+q/MI/xgsAiy5NJq68SkVwRq9f0wRXfo8?=
 =?us-ascii?Q?zytUHcU9loHYy2dCtbg67lgsx+ZZV4ln90bo9tdZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 475bf9fa-db1a-490a-8bc1-08ddf75f8297
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2025 09:32:54.1250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cKwNgOWQKEJ9ZsrXL3JOMaa+yJkN8wmlXF8KJ+scWwK6q5eaiqoKRhvDRksuTCNNB+n8XtHJC8/uf69Sfn4MPQhSFoIVbq+DNM1IDHciibY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5269
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt
> Roper
> Sent: 19 September 2025 02:43
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Ceraolo Spurio, Daniele
> <daniele.ceraolospurio@intel.com>
> Subject: [PATCH 1/2] drm/xe/huc: Adjust HuC check on primary GT
>=20
> The HuC initialization code determines whether a platform can have a HuC =
on
> the primary GT by checking whether tile->media_gt is NULL; old Xe1 platfo=
rms
> that combined render+media into a single GT will always have a NULL
> media_gt pointer.  However once we allow media to be disabled via configf=
s,
> there will also be cases where tile->media_gt is NULL on more modern
> platforms, causing this condition to behave incorrectly.
>=20
> To handle cases where media gets disabled via configfs (or theoretical ca=
ses
> where media is truly fused off in hardware), change the condition to cons=
ider
> the graphics version of the primary GT; only the old Xe1 platforms with
> graphics versions 12.55 or earlier should try to initialize a HuC on the =
primary
> GT.
>=20
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_huc.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> index 7e43b2dd6a32..0a70c8924582 100644
> --- a/drivers/gpu/drm/xe/xe_huc.c
> +++ b/drivers/gpu/drm/xe/xe_huc.c
> @@ -66,14 +66,18 @@ static int huc_alloc_gsc_pkt(struct xe_huc *huc)  int
> xe_huc_init(struct xe_huc *huc)  {
>  	struct xe_gt *gt =3D huc_to_gt(huc);
> -	struct xe_tile *tile =3D gt_to_tile(gt);
>  	struct xe_device *xe =3D gt_to_xe(gt);
>  	int ret;
>=20
>  	huc->fw.type =3D XE_UC_FW_TYPE_HUC;
>=20
> -	/* On platforms with a media GT the HuC is only available there */
> -	if (tile->media_gt && (gt !=3D tile->media_gt)) {
> +	/*
> +	 * The HuC is only available on the media GT on most platforms.  The
> +	 * exception to that rule are the old Xe1 platforms where there was
> +	 * no separate GT for media IP, so the HuC was part of the primary
> +	 * GT.  Such platforms have graphics versions 12.55 and earlier.
> +	 */
> +	if (!xe_gt_is_media_type(gt) && GRAPHICS_VERx100(xe) > 1255) {

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>  		xe_uc_fw_change_status(&huc->fw,
> XE_UC_FIRMWARE_NOT_SUPPORTED);
>  		return 0;
>  	}
> --
> 2.51.0

