Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B4ECD6E55
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 14:32:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1110910FF2A;
	Wed,  3 Jun 2026 14:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jsxa2Z25";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC79310FF2A
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 14:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780497149; x=1812033149;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3PmJAR/UIXxRmD4NIHsK5gPQW1vCzPWGcI1v9S/8vqg=;
 b=Jsxa2Z25ZCkUXDyS7Up1jc83qSzjgKdzjedfTtD0QjHQAqbC8Ohy1dgA
 KJAJ5JIbnqJY5fpgfFIt87Lbite6DksKU7rr1T2vb50ohqFGnUlG0n/Jx
 p+DDNxIStRV+zmWRwlHZeoB7Ph9dJctbjT960GBgM2Tt8+Jin3nJ5uCc8
 SWdc2nx3VeNDc/X7P06c5ix84CSSQzyEmV4xyr4OqRnFkxtXqpuZrVmb2
 9MIc+otGHBi+SE9QAdWW9g+91d/r3IBcYsfSdLMfwtFwukUXUKHNL4woJ
 Sj7sebKTh7CvDGyERCdObxkT0SXMKO1jM417gRCsnWvboScYMAgDwQULU Q==;
X-CSE-ConnectionGUID: idYFgANtScyuzTLn8lBw5w==
X-CSE-MsgGUID: d5QMPiegS6mlGL4rEA7u2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81490487"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81490487"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 07:32:24 -0700
X-CSE-ConnectionGUID: oftmTaCtTgWNUumo8+BXdQ==
X-CSE-MsgGUID: UtzOIUGJSmei62gUqm23IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="249169238"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 07:32:22 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 07:32:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 07:32:21 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.1) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 07:32:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBLr8SY5ezt92cTgq8LhXJoxV9b87YipKIEQ11yT1cyErtTzU3IeQ7g+fI0aOc/7IF/FAV9/DLIA/eAIBGVMwcA/LOeF3UDKV5xMRJg5hMfNQCNwpDkmtBNnqXozDYLrnVOpJtK1MlJrZ1QqNSq8aTGfi35aCRuOP0CmhBb5s50P3YE9plfZnG66WpHH88Z5XASb55BBNRF3DiQEgqkdFfnuW2vwZwMgWxNQo4ZgrmVGc6cAcyg5q7a3+oqbodgOPwJXTGCDM6GKxuAgsCjkpg+0VY59Gy7cLx+d4jooT7VTubmnxLPzPwJvaSYVir4E0T5h+Omylu2RDHUrBHXiuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXXHg7znPIQJsS5F6gr9HFVxESiLxxKBec/sBjWBAbA=;
 b=GWshXeRLuo2nMQ1Bs78Pr5fODa2EXfT3Gsl9WCzjOagEykr0poRwdjIUIvfJ5thpJnJQ2+ClptcPrE9EGEAXPsiPdiKW6CCBqt88B1yD4DhVJOGfrg8Zw1lROgQP5rmFZVxAXM2tpnyP/uTfpjw6UCWrXhwRpIlO9t7eU/nvJoFbIL5OmBNu/2bCrDvf5xzQxqvvnqdZFdxSzHKMFcFb0+Wzni8X14kCXETpSPVnYRm0ZL3/ycZRKTqmrZ8rXDSggV905qvdok24A9OG36LTGvx51SLayL0Vss/bI6cD6T53TNkq22h+93ZUgs36IcqsdfICRVZS6OE922xqYCBJCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by DS7PR11MB6103.namprd11.prod.outlook.com (2603:10b6:8:84::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 14:32:18 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 14:32:18 +0000
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
Subject: RE: [RFC PATCH v6 15/15] drm/xe/xe_ras: Process pages from offlined
 list and queue
Thread-Topic: [RFC PATCH v6 15/15] drm/xe/xe_ras: Process pages from offlined
 list and queue
Thread-Index: AQHc7Cmj8o8Ml6bUr0m5eW485+ryV7Ys8w9Q
Date: Wed, 3 Jun 2026 14:32:18 +0000
Message-ID: <DS0PR11MB87184894E653C82F040E70FC81132@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260525100619.3155663-17-riana.tauro@intel.com>
 <20260525100619.3155663-32-riana.tauro@intel.com>
In-Reply-To: <20260525100619.3155663-32-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|DS7PR11MB6103:EE_
x-ms-office365-filtering-correlation-id: 78b2d7ec-f2f9-4366-b07f-08dec17cea64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|38070700021|18002099003|22082099003|11063799006|56012099006|4143699003;
x-microsoft-antispam-message-info: Q/myr/BfpSWXYKmN/RDcSMcoBO4GGkDAsIzY7hC8fqWuec7twZ4MHf5WcwDoP27xKOVziMWYZagC+vuoDrqHObT3BfwOey3fGm8c2t24L83BSbwcxkWPHR23RRwNzFrcKm3WmD3SedBy/nWGtYbZVrVmo4e+/xG/0ICd7EDAkBe1BBcbsYVbTCGTT3Dbvcf8xVMnOz354ac7ifFxBk5ehUOaJGBjAGpw4DOz3HWqliiMxi95aJUyT3BSfQZ3W7m9OgoPk00ENq66d36iODwH9BWibXGqk5uhxSf7uakguaBadUp8zmAFa2sVtgbk0csNbmKAmQPVk6+tEcCxV0j0bm8b8NIG9z9B4pNlylmZquPjAAb+e7/WinPx4ZXMSwTiScxp8rjvv7be+asiYnA1TGRTvEfbCyyhFUhhZr3vETGKh6iSse6I6g9fQrQrzEvrQf3DKIb8pdx7V41BKyw6SZUgM7uZTRR3Uqcuc97EClMspD9IeL58HlQiLZx85WnrqEYYjmFWSa+YeedpgMPvWls3XBXrRTPcwy8ePgKTK/+5vtS0F35xKJ+NIUcEZWwF6OElpfbDxtGME86H33Qwx0JiwN02Rw0XKlRNnf4Lsney5jK4HsnacoG8ddUov624Tid6Na/AuPQNdpExdToL7N0V6h3zaAM0AAgeQfTs3w5a/6HIrdlReFfRoqY5Bcbc+65cciJZ/8bhD0XqAdN2PVZJVro1xS+A/Nk1RXAg3ZxG6JqEnfEI49UXTvA2rsQm
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(38070700021)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?76fsCgtblzAykJvIUBt09om8rPzFzxD7G2qreuTLVk42/pxNyqXeb4AHHZrn?=
 =?us-ascii?Q?hyX96W1SuwsyCnV0j0aV9yWe//cVtbnF9ZCtNVmyzdPKIVlcc2GQHwI8hIIb?=
 =?us-ascii?Q?TSFsBAgC6MH1FZey6rVlEoMxFI5770QE7cg8slp8ZklMb3tsyaZz9OCbO0Bi?=
 =?us-ascii?Q?X/AuifQYydBxeuIE40ptwKsQOmXKD7tzX3VQ5h6L+0slUWiqVDOBBAUCkCcR?=
 =?us-ascii?Q?uigGMgBv7//Yldeq9m8BDS7SQ4iMcsvfDjZp76Nn0g942m2HJIhrayYri+9f?=
 =?us-ascii?Q?flSAVznY4PtpF6qhSqMMK1tJUA+jkPzpzgP+dcR/Bv7Y+O8ErxDcX0aDqi1j?=
 =?us-ascii?Q?ZvdN8JWQ+BCLfzcvUTkaM+/es9/TvrWRUvKMw+PpjZTtgscW+LLC51LEDhPW?=
 =?us-ascii?Q?E45ikp3Aoac+KXk/EzQ+ZX/viAtUjTToendqA6ej1LoLXDZlpdzFxWhKhmD+?=
 =?us-ascii?Q?TbE0lueSuqVyVTIra2hX/JK3FFfMC7u2uz+34ao9x3NntmHTPeFIfH2iIyyc?=
 =?us-ascii?Q?k9eqq+HEdhtufO/53f68YWo5QJkwKg6zfNJqZt3JO2Djb5MNQaDp8oSzebTV?=
 =?us-ascii?Q?cbSQ9NJHU3eNsbMgM+gel6rvkAwnNd3ayldi6gbY2NJlJZNM76zb2wxQwya/?=
 =?us-ascii?Q?zSx+mxbjLC0FWp6EfYvZmJE/bKmdgypERbrc3BdVHbGv8rRZTV4lb4tTgzaz?=
 =?us-ascii?Q?ouHHkn/gsUv/2H9Wwurg593AOXKV/tAkGC8FUKJa/GGLaCWiuwnuYArl5lHo?=
 =?us-ascii?Q?R2ERKyH/5U2lO2G0REGCvytBvEvdN3zlAo1W1NaRK/mAKgheOD7nqZjjDtF4?=
 =?us-ascii?Q?S/GPus+LHvJoSjA8ygg1qmB7tGr8KNf3DP+gW49hbbAXSoP0K4iutDRAG22S?=
 =?us-ascii?Q?E/zZGMpX2Sqg3KxllF03GIwcya8itvA59XY9d6po5taov2pfrd3MwZLXAVs1?=
 =?us-ascii?Q?VPaMt1YofqfjicU1vk7smqP5/RXkP441P0GXi2GKqeGgq+1GHM0Bg10T85SP?=
 =?us-ascii?Q?ZQ7JF3VEXEtVWHfITLyfMvX3e9yhfR3uXRNSxVhixX+IUtzZkSonY/uD1Bew?=
 =?us-ascii?Q?SF1kveooq4oGMRnsOJACXJTLxn6ySsTTkl0h0HChEK8e/yqX2VOLYEaf0bcs?=
 =?us-ascii?Q?P3agkYLXkvUHyLUds4gr2uywJE8S8kxpNJb3878Z7uED2MSDA1j1MIaOCKJl?=
 =?us-ascii?Q?Q2QCf1zBeHDzuZEdLw1a/ECXJz3mD6QzwTGh34v4UfKnHS8IoJ535ZXkImlO?=
 =?us-ascii?Q?OU7zFA9I4ppCppd6Pf7oaHxAimNFJgmg7agfIdY2hvrPJEwT+CJ5ryWDom9l?=
 =?us-ascii?Q?5EamUxw/2X0/B5W1XxL0+qEAqkWJxL9OkxY49BKxwig6pbbSuyKtKSoxGycA?=
 =?us-ascii?Q?5s9dfvy0Hn7utXumenG6fC/mNlwxTHn1hh0brd6hp3BbVAa4zPclcTG1FP5o?=
 =?us-ascii?Q?u/ILqs6LPP2gwhFVto0DN1h8SJ830nhSf5gvtkNZ2KYoZfToUX408QUm32Yh?=
 =?us-ascii?Q?H5krYsKTSoCJ+6GkbryHyVIytI+PyZSk4Egos21qGBGk3VPnRTKSe+huI7SM?=
 =?us-ascii?Q?1bOKKWNdWQ/+h27gKqjOiI5kPC5FkUHtarB0ESUD533EAWzTka9nK4PArNkY?=
 =?us-ascii?Q?VZa4k1t9rnHE0qYvidoYVNbCsifDnJCogtmTkTYpdUJ6p6nDBY79zXaVG1vT?=
 =?us-ascii?Q?EqEuZTMnc6a3dmYAoVc/y61qfjsPWvH9Thml/7oQ3H4/EWikX8fc0cfTAK/d?=
 =?us-ascii?Q?EEjld4tkopvbwjeeyet7wt33y+XgmpXRzwxTHK7DZnaMHwtvx1YXrGfnZQUH?=
x-ms-exchange-antispam-messagedata-1: lAMSYliqooR9xA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: O3ih9itzIsuq7vbQauVNNfICdk4OCWXVXcQKkctvX2hrgaCXIn8KjzADUuQz20IVlaizP39D4ScDFuOzJq4AwFtoUINBEmX7BKaYoHIeV8leFfEZtO1ju0VYolLa6GOC+2ZkiahHSLI8prJNA6zXD0cxkHdasJz/z35UrTA0PlMydzdd2qbwS873ThS4zDn0tTi/jDW39ADnX9sJiR0bSfLLU0nEovDzcxCj/XAtTOxBYnBdL7z++sQWihIDoKOwGB7wnx67OfaJvWtta+6FMBKk9jY1siuK3eLewqO2+hBqbRnzG8gu0q6I2CG5JzfYIw4dqu+K8PqpIM9Am5WLrw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b2d7ec-f2f9-4366-b07f-08dec17cea64
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 14:32:18.5458 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +IeJk8UCNC/pN5MXKosGFUl0rbhh8mkTa0XKCskiepwuJOpF+bdxl6FcQLaKSI4USLUHWsNmVT0S1UoX/eira9USGM+hcMU+esc74vYIK9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6103
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
> Sent: 25 May 2026 15:37
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
> Subject: [RFC PATCH v6 15/15] drm/xe/xe_ras: Process pages from offlined =
list
> and queue
>=20
> This will be integrated with the related address-fault handling flow once=
 this
> patch is merged.
> https://lore.kernel.org/intel-xe/20260506141143.4033299-12-
> tejas.upadhyay@intel.com/
> Sending for initial comments.
>=20
> On module load, process pages queued by firmware for offlining by reservi=
ng
> and sending the offline/decline command to firmware.
> For already offlined pages in the firmware list, reserve the pages.
>=20
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ras.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c in=
dex
> 32c8ab587e2e..bbe30c804513 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -272,7 +272,7 @@ static void get_queued_pages(struct xe_device *xe)
>  	struct xe_ras_page_offline_queue response =3D {0};
>  	u32 count =3D 0;
>  	size_t rlen;
> -	int ret;
> +	int ret, i;
>=20
>  	/* Supported only on platforms with system controller */
>  	if (!xe->info.has_sysctrl)
> @@ -296,7 +296,9 @@ static void get_queued_pages(struct xe_device *xe)
>  			return;
>  		}
>=20
> -		/* TODO: Process pages and offline them */
> +		for (i =3D 0; i < response.pages_returned && i <
> XE_RAS_NUM_PAGES; i++)
> +			handle_page_offline(xe, response.page_addresses[i],
> true);
> +

Extra newline!

Tejas
>=20
>  		count +=3D response.pages_returned;
>  		if (count > response.total_pages) {
> @@ -313,7 +315,7 @@ static void get_offlined_list(struct xe_device *xe)
>  	struct xe_ras_page_offline_list response =3D {0};
>  	u32 count =3D 0;
>  	size_t rlen;
> -	int ret;
> +	int ret, i;
>=20
>  	/* Supported only on platforms with system controller */
>  	if (!xe->info.has_sysctrl)
> @@ -337,7 +339,8 @@ static void get_offlined_list(struct xe_device *xe)
>  			return;
>  		}
>=20
> -		/* TODO: Process pages and offline them */
> +		for (i =3D 0; i < response.pages_returned && i <
> XE_RAS_NUM_PAGES; i++)
> +			handle_page_offline(xe, response.page_addresses[i],
> false);
>=20
>  		count +=3D response.pages_returned;
>  		if (count > response.total_pages) {
> --
> 2.47.1

