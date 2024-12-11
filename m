Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307CBE7717D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 22:35:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85E710E08C;
	Wed, 11 Dec 2024 22:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U4c/TKuC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E156D10E08C
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 22:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733956542; x=1765492542;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EBP4zu49Aj4MP5JbBBE7FqmlyqTmXZtx3X1FaMCGfA4=;
 b=U4c/TKuCdlXh+RG9v8z3qIsrl+7K30RiBZjd2Hj63bZ1zkA1qeLUeZK4
 S4A47LL2If1OeKn4TexNHbnAcJilJWY5dpPPkVGqfx8TqKtPzfOdD5F14
 /iw1S19A6koWt+BzJSlDaBw/yygAt4Nc87pgXP3j09xEs+nlk76IR6jsS
 d40dZk339co/jayMEuHlj1pMoU0GXMX9N5uwJofYylzLCCy0YTK+CCPD+
 hYoJWSi+/5ZeJ0PzY+c/NvLc6MhXb+ePTTP7U2BCwW9+T37iGwq+qHYPS
 Vhz9oPTZMPMWnGxzN3dyPdr93cfM9yT7Vj2M0m0qBcK7mFKValMGxiBDO A==;
X-CSE-ConnectionGUID: 4+66Ok72S8GG0T65EKJAfw==
X-CSE-MsgGUID: t4wiIW8rRPOnM3XYk+NGsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38288537"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="38288537"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 14:35:41 -0800
X-CSE-ConnectionGUID: S5HpSpisTp2JLRF4p/13Lg==
X-CSE-MsgGUID: NxXGMm4RSvSNHf8wXXoeZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="95826114"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 14:35:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 14:35:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 14:35:38 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 14:35:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wH+pNPN7tXQtCrOYEQdxE+5B0q5Cv+h8grcfIm7ef4DqECBYn5QIjWJ2M2SUtMJYazl3MxWu3yFDaxKDp+SrLU8hRrfEUUBLRfBNcE13EtjSMTt/3tObNk4kRz1LY29Mp2FzDL8wMiudaUAmAVNraBqXE9s3biqM0gFax+lrLkjMYMHjRNUOU4LMm0tDJL/q8Z9YM0VzAkaq8p+D9IcbkMp1FzbmR8dLpZYIPoJevg1cKxXZ0LV3iUDogArL+cjucfpATZI7J94Jpc/1sPA9NrImeBoBLOZBw45BNwwsM+/XCdNo+ZeHhm8CxN0ZTm3HBULG6ChsnTRos9iJRKlhJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woL8VJqqtCVjVHChxELANiSUdwdor0zcFHKKiHfHqOc=;
 b=q2cy2OF99rmM2kNaNAoha2VfGjZUrNEYtINWvqMmQeQV07j0hqAUaS5NNw8D86+E+B22tCmxdOvDWLDekK8psmVBJ081S1vtogkYIOVyqBRBtU79sJ9X90rOnoJfz4jUquyF+9HwCKYVjgaP9WdHnNnAIMvbGmuIhFiHJAPB6dkMqseDr8j8TS5wW9yF31nWD/Xme5CDcj2sABDyt8C9S480by+usE642f/lJiVglXVMhwkyFRbpyLR+yXpSczfjnh/b2lrjp+Dxr2TIOwv7T0duDt1yw79I1389+SG2t/lx3EbEdSqRMRSalfj6aMio2EHXxuKhNPPQ6YQBRcPwgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7195.namprd11.prod.outlook.com (2603:10b6:930:93::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.17; Wed, 11 Dec
 2024 22:35:05 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 22:35:05 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Harrison, John C" <john.c.harrison@intel.com>, "Narvaez, Jesus"
 <jesus.narvaez@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2] drm/xe/guc: Enable WA_DUAL_QUEUE for newer platforms
Thread-Topic: [PATCH v2] drm/xe/guc: Enable WA_DUAL_QUEUE for newer platforms
Thread-Index: AQHbTBd8IoLyn0cio0SeC9TVuliujrLhnjRw
Date: Wed, 11 Dec 2024 22:35:05 +0000
Message-ID: <CH0PR11MB54442F4FEE467BF8BB54F2BFE53E2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241211215546.2053660-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20241211215546.2053660-1-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7195:EE_
x-ms-office365-filtering-correlation-id: 722ee251-f4c6-49bd-7aac-08dd1a340f43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?aygZIqVW5ceVO/nIHxxmj01GLZZdBHemn9V+UgHjtqRql5FJL+oCPEu88Cpd?=
 =?us-ascii?Q?zjhoU81zXgKjTK+EnIUKQq6mJ/s8jjSWk+SchirFz7NHIFg7ZMHxaMbLvTwr?=
 =?us-ascii?Q?m7ua6ZDr1oCBzG4xC40uCIYYGJe9eUDgFMP230x+6YdXFQvdO0B1a8Fv5Pv8?=
 =?us-ascii?Q?+SGP1rwJWsXYjWjZBkjxtlMRSqXwNvnOo1GXX3les6+gyL/2bCGXh8HjsG7c?=
 =?us-ascii?Q?FBzMzNRH83OCk54bDxot2GjqcxykOesGOTqOIgWabjdpsQiQMP60yUf0kVB8?=
 =?us-ascii?Q?QC5AuqA38Tn92hm++RUUsJj+GwPT8SrMlOkF+gJsud4LHmOlyA5RPiyBzlSq?=
 =?us-ascii?Q?xoRoSVnz/MQ9ZZIQBBdc8aobVRfysn1ANAU5k7ZjkLlau6tqPKkFW2D0E7KC?=
 =?us-ascii?Q?AYZsDSiemoPTR0IzpUzBUw0t6S12GeeouBntkTXtrd/uM4hmrpaBxsk2ZIgA?=
 =?us-ascii?Q?6uAp8jLGiRgAIompjBJW7REnM/TogZYqnoHc0MuOYDHhvkmWErcZcDI/de2z?=
 =?us-ascii?Q?/KOEFHufypLiBGPzURxUnRXZHjeAy16JtHS8Os1Grm3dpRnigxYBcZ7GqvHQ?=
 =?us-ascii?Q?/xtPdw/cxIZWlH+ajfPUEjhXI3cBrDLKP7KHh4lFHSiDZoY06bFTpby9mIx6?=
 =?us-ascii?Q?mHPsTiE+mGTA5wd7so+4DyL+8H4yecYtw+P4SqmOaC9er9by1VdpbsHsOBIZ?=
 =?us-ascii?Q?X3KD1MAPeKaHQp5ftUpbWnmlVSl+Hazoq3EZI3islUoCMbGsOX/B3sEXcBLu?=
 =?us-ascii?Q?oTDlfqPv4Nh+aM98m7FWZNrFlwMZVFQn7rg/WxZGalKHnjRqry6BC56Pte2X?=
 =?us-ascii?Q?qYA8z6+rCOC2Ca0IgMq8F+POxOWxhj8u4LD9SjXs6Xsxy8sE9qMsQWlDwYr/?=
 =?us-ascii?Q?gSr/Qr2uziDYI8ajq1jlMYNDfgCGSjzR3lVWoKksIvQRnKMPS/tp39Kc3Xvu?=
 =?us-ascii?Q?cS4p60n7w85Wz7QEeSnXrqEsnnPqeRYnVOu0Yg/7zbdAzd1YcbsGpJoWT5zv?=
 =?us-ascii?Q?0xoMAs8KFCwCRPHd8FbwZv9aYjkZynDJNSL+oUSX96rLrPwsQ2UEGG1pAx6p?=
 =?us-ascii?Q?GSn2Y4YcK5+Un5eUtZ1463qBZh5EerbNb7HYvSxpQZnAO81An8vwH7uzpnO5?=
 =?us-ascii?Q?wHARkho22txy9pw3BhfkPBAncKrl2wHJXRgkO6jnvq1bmx1paLsjZDqcaHRL?=
 =?us-ascii?Q?6N6ukzCa3sjn+YSB/8xt1wjhmRdRWI/iCWpMdG9LDR9bTWPc6tFPfs7mGb5B?=
 =?us-ascii?Q?QgtiJwAubLlTEhASYWgmBtge6nB2XBXnArQCOyxgNGKHLeQBfoD6UQD+wYJB?=
 =?us-ascii?Q?0ES810Qgg2bE2VKdzJU4sXrDQmA+wCM7/ZPPFqtmTwOeHfW1bXzaRWkCKVdp?=
 =?us-ascii?Q?a6pW3teRVPxJMivV37OgT0qQZBYsyChyQnNU2EZXn9J4xyDHWA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xD48gZiMPfi4rKaRO/oxunSbWaLII0ro98RUKTKfKY1rFf1tSZHSMXZ72DoT?=
 =?us-ascii?Q?9oore/oY5PUlpQH1LrT68lbr7tc2GWGXTSzUYDk3kKFa0QZ5j5y1/VzvXoVT?=
 =?us-ascii?Q?spih+n2osuGiKdv3JGDUkGAOEOYpf/gjLuCIyp/EvasvOIIcbGejARa6sX6a?=
 =?us-ascii?Q?kzpqIkVqVYSMHUAm2N5ikBREkBs+RUrt19mdBw8lrjJWIsBleHW5gks46mMZ?=
 =?us-ascii?Q?X5r5qrcL9F2KKY9lS64wNht8r8spSb3+J8oZJ+vlh5nKdUt+cNuS+TsAzr1v?=
 =?us-ascii?Q?usurO0Niov2mcfWfk2v6niYcWOyVwi5DFEey7hVYTK/BbHxZ757abeAr5cmh?=
 =?us-ascii?Q?PUygPvKtNxk0mhj5a++B53JMUlOprcQJohKFzMsBmx8h+E4swE7IRkW122mr?=
 =?us-ascii?Q?k5aUhklZLKtXA/S8FWPfQj4yWNBOCkUKGQ7xBx6eWitZNPuzCufcc+v244oJ?=
 =?us-ascii?Q?H+coY7XRjjzYmOT3wEXSY/1EK1OFvKbeSiosrhxJNyokWL6yQnVLmiDwyhg3?=
 =?us-ascii?Q?ydhiKNmLywJI6OFb5rBSY0A+UU1RG0v4poimDngBWp766+gN5ZNA3Um3W3Uj?=
 =?us-ascii?Q?1wRfUmcUYjeWC5uEX4heLAvWIRWocPezYL5gQCID3ehrqTw7AX2QMOpeya+6?=
 =?us-ascii?Q?KBCpA5JiaIem5wjylSgFyadq8LkXHmzsQBDvQd9aaAs4C2mkC+OelLZUnn0s?=
 =?us-ascii?Q?hxHvrNBLb63lUv1+1fHlJbhhaXEsSV1+72iLRcbyavUixn5jGNQ5mheYj0hc?=
 =?us-ascii?Q?p/rL6eNNdF/gvjiYvVuo7QlXpYQYI1mKbjH+EXwe+BDw5tosb/XsQH4ddgfg?=
 =?us-ascii?Q?GkB2kB5s9x4X3fP20aE5ySJ+RFa1gFlNw0WoUIU6NGHs5iqQd4QNB5FjFJ0+?=
 =?us-ascii?Q?ywII+OVj/wthsrwh+66FfBBK6ldhIKsXqhQZDXZdBGmc/ZgOxC+bAXOlC+oA?=
 =?us-ascii?Q?kd+a4RcM8kogOsXsArDTxEDOclHrXZ8+xCFnq8yfh1/q2L21CZu1/LvYxHGY?=
 =?us-ascii?Q?0RGbfv5QaEYXNChzSEDIhgXuKWfwIjgo9KuFAX0V9DrsZ6mO/M/xmZcB+QIf?=
 =?us-ascii?Q?N67iPPZ0TY39+hXaMd6kZo2TBjN9tIgZTjd5yIo78vrRAYsl4/ZRI+yp0gKS?=
 =?us-ascii?Q?sWDqrFCQ/JZMcdhNmDeNm63rD2ALQO66ASTiiTI8bA7DTOvsePu5kzFAxMU/?=
 =?us-ascii?Q?62ESs4QiwjhZAqoAcAY0GAAJM53c89DJxr2Kh5cqojL8eZI/j+pWdCc1yXTa?=
 =?us-ascii?Q?ooBc9cW3kYZQdvIYYJg4SmEaSR4lqhFQyMVoGhzyG/XHNOJDy8ZaybG5nsCT?=
 =?us-ascii?Q?vXxo6NtRu/bLAZN2A4cw7vrrgARd0c6vjOonLglovG0h6lzTRYwctUmMXB/E?=
 =?us-ascii?Q?dk28fN9KDfae3C5Gns1lTaJjvleLsf+ub8XlWNRfqaL35AXH24nDGRyFaYQ+?=
 =?us-ascii?Q?AYbt37R2xGxm26EqDNmpchcEa8B4kT7RpSBkCcP4S1gPEmYb0d8FrzZD7IT+?=
 =?us-ascii?Q?5x+hbznYoTVR+BWzbyi1WWxpQmMQTcwg33tJNtS0BvrlMHYBsRPL4+2zZTrE?=
 =?us-ascii?Q?KTYDq9TMx47n8ei56Ip1A6JkUPu8lsttuqOUIIqD?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 722ee251-f4c6-49bd-7aac-08dd1a340f43
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 22:35:05.2736 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BTM9XgYATNy/EQ8YihEro522Ii3ueVa9Wi+Ti9XT0VGmyhG40PK5yiUyJpiRt6M5XVl1kNlMJKDnlW+JIdRZLJsg94hy7nCHspkDOPzW3WA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7195
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
From: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>=20
Sent: Wednesday, December 11, 2024 1:56 PM
To: intel-xe@lists.freedesktop.org
Cc: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; Harrison, Jo=
hn C <john.c.harrison@intel.com>; Narvaez, Jesus <jesus.narvaez@intel.com>;=
 Cavitt, Jonathan <jonathan.cavitt@intel.com>
Subject: [PATCH v2] drm/xe/guc: Enable WA_DUAL_QUEUE for newer platforms
>=20
> The DUAL_QUEUE_WA tells the GuC to not allow concurrent submissions
> on RCS and CCSes with different address spaces, which on DG2 is
> required as a WA for an HW bug. On newer platforms, this block has
> been moved in HW at the CS level, by stalling the RCS/CCS context
> switch when one of the other RCS/CCSes is busy with a different
> address space. While functionally correct, having a submission
> stalled on the HW limits the GuC ability to shuffle things around and
> can cause complications if the non-stalled submission runs for a long
> time, because the GuC doesn't know that the stalled submission isn't
> actually running and might declare it as hung. Therefore, we enable
> the DUAL_QUEUE_WA on all newer platforms to move management back to
> the GuC.
>=20
> Note that the GuC specs also recommend enabling this for all platforms
> starting from MTL that have a CCS.
>=20
> v2: only set the flag on GTs that have CCS engines
>=20
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Jesus Narvaez <jesus.narvaez@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 4e2868efb620..1d87933d7d0f 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -147,6 +147,31 @@ static u32 guc_ctl_ads_flags(struct xe_guc *guc)
>  	return flags;
>  }
> =20
> +static bool needs_wa_dual_queue(struct xe_gt *gt)
> +{
> +	/*
> +	 * The DUAL_QUEUE_WA tells the GuC to not allow concurrent submissions
> +	 * on RCS and CCSes with different address spaces, which on DG2 is
> +	 * required as a WA for an HW bug. On newer platforms, this block has
> +	 * been moved in HW at the CS level, by stalling the RCS/CCS context
> +	 * switch when one of the other RCS/CCSes is busy with a different
> +	 * address space. While functionally correct, having a submission
> +	 * stalled on the HW limits the GuC ability to shuffle things around an=
d
> +	 * can cause complications if the non-stalled submission runs for a lon=
g
> +	 * time, because the GuC doesn't know that the stalled submission isn't
> +	 * actually running and might declare it as hung. Therefore, we enable
> +	 * the DUAL_QUEUE_WA on all newer platforms on GTs that have CCS engine=
s
> +	 * to move management back to the GuC.
> +	 */

LGTM, and my RB still stands.

However, we may want to split this comment up into explaining the two cases=
 where
we'd want to apply the workaround.  Specifically, we'd explain here that we=
're applying
the workaround for hardware reasons.  Then, below, we'd explain that we nee=
d the functionality
of the workaround extended to other platforms for non-hardware (GuC related=
) reasons.

So, the two comments would look something like:
"""
	/*
	 * The DUAL_QUEUE_WA tells the GuC to not allow concurrent submissions
	 * on RCS and CCSes with different address spaces, which on DG2 is
	 * required as a WA for an HW bug.
	 */
	if (XE_WA(gt, 22011391025))
		return true;

	/*
	 * On newer platforms, this block has
	 * been moved in HW at the CS level, by stalling the RCS/CCS context
	 * switch when one of the other RCS/CCSes is busy with a different
	 * address space. While functionally correct, having a submission
	 * stalled on the HW limits the GuC ability to shuffle things around and
	 * can cause complications if the non-stalled submission runs for a long
	 * time, because the GuC doesn't know that the stalled submission isn't
	 * actually running and might declare it as hung. Therefore, we enable
	 * the DUAL_QUEUE_WA on all newer platforms on GTs that have CCS engines
	 * to move management back to the GuC.
	 */
	if (CCS_MASK(gt) && GRAPHICS_VERx100(gt_to_xe(gt)) >=3D 1270)
		return true;
"""
Except, you know, cleaner than that.
-Jonathan Cavitt

> +	if (XE_WA(gt, 22011391025))
> +		return true;
> +
> +	if (CCS_MASK(gt) && GRAPHICS_VERx100(gt_to_xe(gt)) >=3D 1270)
> +		return true;
> +
> +	return false;
> +}
> +
>  static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  {
>  	struct xe_device *xe =3D guc_to_xe(guc);
> @@ -159,7 +184,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  	if (XE_WA(gt, 14014475959))
>  		flags |=3D GUC_WA_HOLD_CCS_SWITCHOUT;
> =20
> -	if (XE_WA(gt, 22011391025))
> +	if (needs_wa_dual_queue(gt))
>  		flags |=3D GUC_WA_DUAL_QUEUE;
> =20
>  	/*
> --=20
> 2.43.0
>=20
>=20
