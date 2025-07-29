Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC9CC87FCA
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 18:40:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DCBF10E667;
	Tue, 29 Jul 2025 18:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OqZUJrT2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B798C10E667
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 18:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753814434; x=1785350434;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t/f7Q+JJ2nvZ4ZH+u3uu+8VEYR2QK1tz16YBABeirXI=;
 b=OqZUJrT2sj1Y8uGItsivRRs1Lel4XbetwDhsMxF5sxdNcBFtn3ozvvvI
 QakQUsHE8wUi48ARirI+8N/7587IrDFBb17y980mrWO86lmvzIjEsWZIu
 A4EBlhAk9s9RtGb9krF1qdidmVSLQFQzpdda1dtcpJlgnniFnN2o1XDRb
 kWPA1bq2WeZHFnfrg9NImBC6PIovnqkwBucETzF/UXJc8jsAQBpDFhDHB
 F28O3etK1hkheSYRixRummlRa0hMfEXyV4vr7OJ6UOAReXhfROiuki8ig
 z94F1RCUAWuAeUkMNaemoeHmGV6ZGx9Fc/jxBtOxFZlJXVIaUMMkDD1ZY g==;
X-CSE-ConnectionGUID: M5yR4pEuTWqatbOUddaeyw==
X-CSE-MsgGUID: DTCIbYTDR86YyuPgZaGPgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56247385"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56247385"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 11:40:34 -0700
X-CSE-ConnectionGUID: MAHk81oaR3+TtBGS28MVMQ==
X-CSE-MsgGUID: 73DaJtVVRpOmyC6W7/j1cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="168076954"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 11:40:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 11:40:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 11:40:33 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.59)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 11:40:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGlo/NEElNrFc0n25u93SFZ/0C73enZhvyJp1T59xPbRfhGInfej6RZT9Sz+ld9QlB5VoF7UlMUndilk2yOyIV3ClC2aMNyfNHGxU/pVsh4oktk/ShczQegmzG+e+06EWrDCIBIKl7SzW85uh8523x/mB80D7/wMiHJrOPHhqtHPZ8cobawdlY0tJhF13MkJXpRIyX/PKHRhqv738jCAGPdnAvs6TXQP7RDwr+qu8gpKnuLFBN0hUojbXzXO9PXks2ibx8OFL4ddnxWEP3w0Bzw7XCO+tlsiIeIX76WaOmIF926V0p8aH8cARWuIPKW8xU/ZnyelZZSN7CFRbJdjNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dLI5p2zTh8SDVjPuGy1G10qOCTOLYCQO+zGtXT+D+k=;
 b=Igsq3FKdNzGz6t7t/a9ca+YQie7wGS7UYow4FrtWXkoDregAbQZBeXVa0ju2VxTucrDfU4J/AjxAdd93bBXv2YLadHRUZSZXlRwZZGYjMF0hyInxHZZjtmKQ2fJZPbKMy3gm0VAPxBVXrGTXGNjPucBNuT18TXBMRLBgUWU0lChSQ9d4jYuOEQ0fSb+cQreWdemY79Pz2l37qjIxrZOujbX5taNLtFMZXDd24O4u5APAf0syFUmXzbCnk3r7SSRQtK5bECmXx3veS0zGA5/+VavEvu+XlZ3u5RUaG0cFi7k1t3XtCIPhOAWQl5YyMKVtwM2sD98Ykz/ZXF4eSY2Vsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by MW4PR11MB5912.namprd11.prod.outlook.com (2603:10b6:303:18a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 18:40:31 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161%5]) with mapi id 15.20.8964.024; Tue, 29 Jul 2025
 18:40:31 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/xe_oa: Fix unsigned to signed cast in
 xe_oa_get_oa_config
Thread-Topic: [PATCH] drm/xe/xe_oa: Fix unsigned to signed cast in
 xe_oa_get_oa_config
Thread-Index: AQHcALWsZnB4mfgb4Eqx+1GduDxhn7RJbLrA
Date: Tue, 29 Jul 2025 18:40:31 +0000
Message-ID: <BL1PR11MB54456E1F6968B0C75AD049AEE525A@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20250729182113.894152-2-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20250729182113.894152-2-umesh.nerlige.ramappa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5445:EE_|MW4PR11MB5912:EE_
x-ms-office365-filtering-correlation-id: 1c338d82-6c69-46e6-3fd2-08ddcecf65b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?scvanm/79GwAx/AsSpmyIIrvC0A+HK2kAbCO+HwTltuXlkkGNUqatdYi5txr?=
 =?us-ascii?Q?dXwyAuZhypTtLIYbLxYU057qoxq1+wb7c12HIF0SXDaiypw++TA2FLUec1rb?=
 =?us-ascii?Q?FCjatMiTXCWhJoBXqC4AoCos3/As2vq2sGCfukVPz6Y72hS1L2mmnw8G7wsc?=
 =?us-ascii?Q?pOKxUSa6c4ID9BpYl8YkzGs045/rg4w1f+bslYUHMYililvm6XXuK6DwSb/n?=
 =?us-ascii?Q?WJRbCpN4y1KqmLWhLWbziBNubapZgMMUAyIJZvPa31G1avPkUQ9ajTEMipGl?=
 =?us-ascii?Q?7noJWsi4wfHMfckYYsP9yXUaU4qoQq+FQ3Oa7EEPaOeG33uouERvOxGlAHlb?=
 =?us-ascii?Q?XMob8icckrf6c9nG2psYxfQTC998Sqso0zGWhhKgC7KeTISiDwFPsHBHA2Z2?=
 =?us-ascii?Q?TweUAcONwjG5uR/ylkMgbiuC1B1yvM7Ji/Ca9Ar0bxoSKX7yaPT1ObbtokRu?=
 =?us-ascii?Q?4P7KDxu1N0nnIxdTljzW3ZwT9iDo3G4OYadu/1reK4Y36HREeDLF7mCAczQE?=
 =?us-ascii?Q?PWN9JaooA4SvODZfmRPkXDo57b7O4j5jls4X3pVMGLCRGX8GlTs/xXQABGK5?=
 =?us-ascii?Q?xPiYkCUa32veuMzauCuuATVhVlXZbcunLvNP1yiXIzw77k4IMxfvnhZBxv4n?=
 =?us-ascii?Q?3ZITIrGUD5EQdP2PBzOWIC0Tqe26sWTstcOniuTuszpVcuGIhaz9dpZ4KPjU?=
 =?us-ascii?Q?Bt42Uxdw89W6lrEfQyRBuJ9r6wEwEeSPtqGlVlrjLORf1rL1n3j5LgyGOCZc?=
 =?us-ascii?Q?k0UWdwTzl4ahb5xg/XrQ34FAZQlwiCFZ3IDfdxw8aOqyVXVsZWYvYJ2BEjfU?=
 =?us-ascii?Q?nsuyFc5+4oSfcBk/XhbyuZmboI8Pg/OPgel7SJtHWkL9DUMIADbeNl65DwpK?=
 =?us-ascii?Q?RExVPfd9RInFNnbMcvf15qppEgxYeSe6qTiQXiMZid3EdaTpf662hARqus1E?=
 =?us-ascii?Q?Wsa+I8GBe5ThWCq9yPWSJ+LVP0LH8eh77aPkOjVmzxQjIiKXUZ46lvhEieOg?=
 =?us-ascii?Q?z5ERKBHzUhFCd9uuuiYPPxEqPpDEyp2Js8xZF8Tb582NF31bD3RSPkmaMisg?=
 =?us-ascii?Q?aktLq5KrxKcT6VPuXqddpxgdIWVshQLAM34i4y05WFGtzy8FsTCzI8JRWCBS?=
 =?us-ascii?Q?iQW5ip72SZ6uXnWpxgYVzitVS5fzmb61RWuLFeAWBXRM7VgmUZuOBsjlN5MW?=
 =?us-ascii?Q?slje1qNPHZE7ThuhAjvyvrnlU2zAwn1hQysL3h2GcyProSYMpprdxA8mp1iU?=
 =?us-ascii?Q?DsKCR7DXjI7lOq2zmdzdIFAFOk4D9JKpz1B5HyVYZMpawq8C9l15tKeQYVqy?=
 =?us-ascii?Q?MTYTrXG0wkweJ86K7pf+hYTNHLoQsv/AI7NkqlSPnBShgiTJpKKb4rU7iuDz?=
 =?us-ascii?Q?iUkMAihD20kHYpCb0sYA+9DN+iZxbVvHwilsUGoNasNOa8PHp/MkF0wskN+v?=
 =?us-ascii?Q?QHlTlSTFRoCm7y7F43ZOs18IF4S+DQzm9nixMqzuv5M5JhwKQW085w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?D1uEgysbC/JGqp1R6VlM7I6NHWATJJweGk9SxfhygjxZcbZi2wubD7J0RDpN?=
 =?us-ascii?Q?zaxAOhU/WM/ZTqcuJzHU0VDTSZ+jdEZ9MDLTR/++UrHYpYEUrdrqsTvwhN2A?=
 =?us-ascii?Q?0fXbKfL5TTjFgNl/vGhxbkbFq+Az312e4kkYHqN91NGsOAqdxxGYVfiUVA7V?=
 =?us-ascii?Q?33OEr8Bt+IPgZnLyOjcvIh9+I8qkuMzcqnKUugsduDxIhcjurYnH2uxLQiwG?=
 =?us-ascii?Q?agbq6S9/mNRmd/TnBmFYz8Y0oJeIESmPv4dnJhkOehIdLSPTfebwbXkRImgc?=
 =?us-ascii?Q?rFq4NgczknzUU0PLkm3pGg/AgITquRPq2IRz1zUND+BCRDSzSTH68Hh01p3b?=
 =?us-ascii?Q?HDMdSUYCQeagQG1qIlgtZqicUuJPGLuuKcrgo4sOeiGsJ+lvHpGW82MzYGfu?=
 =?us-ascii?Q?XF7zqjMv8uPogAhLNq/gyVnof8p4Xdf/CFfQz8ss9CSqHEAK6kTFPJsiQMBD?=
 =?us-ascii?Q?k6l4KKqCGJNzqKnT1ZunO5ZwZ/xhu0O1NexqcoZJpYpAZ1dOq5ud8oNiG/b8?=
 =?us-ascii?Q?I+39C6WmIPGH8lnwRjMR+6qI6MvJMkEsg9SepITIE0YpfptqKvADZyNAbR9I?=
 =?us-ascii?Q?vu4RTJiN8IUwPdXY1zMes6kLm932hJrQ8BrIqvfJ5Vc6TSFlQJs2RLTN0B4R?=
 =?us-ascii?Q?LuoRHRZzMXc8Pe5sSLAUjnoZmDAkO2QzhVr1A641WZwBY0QY6fABy6X+c+xk?=
 =?us-ascii?Q?Vn77JvvgXH6twuH0ViB6FbiTz2YUjCjRzNSFh4Aupt8qUa87wG4SWwmIBCrz?=
 =?us-ascii?Q?GprzBme4S3Y4uNyfUxulIAH8P2FRDCN6CPwHhLDzi7hiiIK5BIwCAoO3+8uT?=
 =?us-ascii?Q?xxR72Cne310Dv1lVUk9SnUazWqoggjJ19rjQ4tczagKCrTjZsolkiNuu22dk?=
 =?us-ascii?Q?IRyqoqZH3PWkni2n0two3PfUruaSHKKPsdeKBrV3VU+LL+mr8tSZJGVYka2a?=
 =?us-ascii?Q?JoxLgNvowojqLEMf8JTseUJKt9Nh+pgEHF8Z+afRfyCsKxvmhIQ1rPaM9IKK?=
 =?us-ascii?Q?ULtvOvY7HWgY4h3XD0A+E+pjqcx0wkEb+DVvXmrvAYokL+AVOb2jUcLKbzk7?=
 =?us-ascii?Q?XgHWBNqt+sXvoRxfvzklKR+AQdUUFgxdeLAfwgkP8TRTp09dl42vdXDTR2vY?=
 =?us-ascii?Q?0Eb62YVaKQbeiJvolSb+mRBbMgD4xdWlje+aolYcKEoxqoOsExCBn26YqvOe?=
 =?us-ascii?Q?ldFSrpKuoX/80EzVtXhpOGBcRIT7x9HGSbWTagQjbxbxaOIkTkkDLUbYcrpz?=
 =?us-ascii?Q?KorBcxewW+9qp4Wkv3GfNAFQAe5sqz72bR1hgHrAfo+OxMCMUmttumEehITe?=
 =?us-ascii?Q?T2oXe/ndK4M6sxBvMwHWt+q0hVY2C6nbtpQwASaVvZW9sevoqBKi5aTO0iiF?=
 =?us-ascii?Q?uG0EKB2AeqJj/5kcssKFqDn7ufr8luSWWPtIT7Q2oIohFY7b5g3d3YIHaEDO?=
 =?us-ascii?Q?sx80T7PyIBPrhoPTBGFzS4xh6o3AJ7vuDnka5+SeFWcfn4h/tT4bytfBAVJ8?=
 =?us-ascii?Q?SgXzutMhwKaOkZEIGUYpQYAS1UPB5DD0Hx2oUoLZl8zt+s9O1Q2YZpzIW6bS?=
 =?us-ascii?Q?vtx2byZtEjryzWhTr4HQ3Fy7RWbfMIJGUEoDwaqU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c338d82-6c69-46e6-3fd2-08ddcecf65b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2025 18:40:31.6379 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PRCpAgRAcs6trInWFUPpD3+XnoCw8o1rhY9Gb2MnQJ2wWOePj5Fsqlu2s0w/wGSZuVxk5cEtOv7p6tn03dJdMeye6DoA2dv2TQOz0VIvQdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5912
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Umesh =
Nerlige Ramappa
Sent: Tuesday, July 29, 2025 11:21 AM
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/xe_oa: Fix unsigned to signed cast in xe_oa_get_oa_=
config
>=20
> Static analysis flagged an issue with casting unsigned value to signed.
> Fix it by using an unsigned parameter in function definition.
>=20
> Fixes: 1db9a9dc90ae ("drm/xe/oa: OA stream initialization (OAG)")
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 5729e7d3e335..e166547f43e7 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -178,7 +178,7 @@ static struct xe_oa_config *xe_oa_config_get(struct x=
e_oa_config *oa_config)
>  	return kref_get_unless_zero(&oa_config->ref) ? oa_config : NULL;
>  }
> =20
> -static struct xe_oa_config *xe_oa_get_oa_config(struct xe_oa *oa, int me=
trics_set)
> +static struct xe_oa_config *xe_oa_get_oa_config(struct xe_oa *oa, u32 me=
trics_set)

I mean, the alternative is that we change the metric_set parameter in xe_oa=
_open_param
to be an integer instead of a u32, but that might cause the same static ana=
lysis problem with
xe_oa_set_prop_metric_set, so this is definitely the better solution of the=
 two.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>  {
>  	struct xe_oa_config *oa_config;
> =20
> --=20
> 2.43.0
>=20
>=20
