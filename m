Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A485C87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 06:58:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C42E10E5DD;
	Tue,  5 Aug 2025 06:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JBzWDUEl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006FD10E5DD
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 06:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754377095; x=1785913095;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FG0CE9WEhj9i1PlEt/ZzXKEgGm7BbgAs4yxWIk91lgM=;
 b=JBzWDUElzspJE1UnrMP34wGP/RufYLyVARcn6kxzBZP6bUTwvUeClTCV
 inZukmXHAV1yXE0yrQuegr+rVRFmldHF9Qvcpep+rAOOHOcWckOgLqjoS
 mHAAPbHpxMmNUhneaXRq/kFgopbwvigOU+VS1ycQSXRTjYlBW9gfosuQz
 rPYoGRVsCtwiICMUfMADP4QilNZPXEutpnmgE6jYaa1LZzYdFMuQqWmbG
 myrWO4ZKfIFQRrLKRqfsf2uN0xhnjhehuut92qlf/snK6JhLhSuax8nQ2
 E8iZ6fOJLx+hn8NWYvhmsieU7RVGyh0imUPeG6uTxxmToepBDgIilvgXK g==;
X-CSE-ConnectionGUID: apL/oJCDQbC+0zo4sF0F0w==
X-CSE-MsgGUID: MyerY5CTSeWRwhJDGEnWgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="44250766"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="44250766"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 23:58:14 -0700
X-CSE-ConnectionGUID: HzjN8eOxRQq+eDoKwo2c4A==
X-CSE-MsgGUID: 5S+LxEJqQDKQrJbJ1XrTVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="164299513"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 23:58:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 23:58:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 23:58:13 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.66)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 23:58:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjXBKKOHdAS3mgZrKGRAHOygF6dv4y1CuXbrtpVePj/S9IiohZuWVuMTlHTmLV0ihSU9HsRZweF3sby8jYO95fFSR2bbAPutpSp7zq1xO56HbVT5k9rChcb9X3G477wtOf0FmhsRKpR22fL3njsyH9iorDYhq9KOPeLB15Evxk3989CtpXe6uT5M7oHImA6lDXXRPRQspWp74IxLyqL+N4PdkxNi+hXftrP+AYqG3ybiuete2Ed7RueMgB6p+bR6vBKS99s63tVg/LTxH8cmW0gXmuvk3yYSffmsfLRL7OSMSabpqfX29w6L2OE9nAP3DcuXqnptx/5icknspxgLjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mPqtuk3syC7TzlLDw4B/2/2nZuCLgtmq3SWEgF8KBg=;
 b=vS+dRs+QuNFbwz5dRjHe8rXelQYhci9+1HI/arcXSMCeVOVC9+xzt1Q3txmX3kPNdoY/MgC7lNojYXZbPMI9HJmsdA4ypkcNqM/fcK032bE8ZNRYv/S7y7+C2WMddHSR+ZOWytwTbNRm/8U+sAOYqQAYZOjLpei3/Yun74/SZs3alrBA9VoeIdC4SZuoWQIkiB8rD0imfwYL1xcodNLV1MXJrj/qS2R5lwq7JDDnhb2OA25/bZc9inNjgY+niMxH9xMbeaD3zMQWdOP1LbfIdG/RrxGCOoPZgDEaorqpo9iDIkNsND411d4s9Xngmy2topwdy9Pfy4UfH58FXtryrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by CH0PR11MB5267.namprd11.prod.outlook.com (2603:10b6:610:e2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 5 Aug
 2025 06:58:11 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%5]) with mapi id 15.20.8989.017; Tue, 5 Aug 2025
 06:58:11 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH] drm/xe: Fix coverity issue, cast_overflow
Thread-Topic: [PATCH] drm/xe: Fix coverity issue, cast_overflow
Thread-Index: AQHcBSIxKDfiQXGGbkypWYYw2KCus7RTamwAgAA3xkA=
Date: Tue, 5 Aug 2025 06:58:11 +0000
Message-ID: <BL1PR11MB55259FC35CF599D86A5F4E3D8422A@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20250804094038.3301004-1-pravalika.gurram@intel.com>
 <aJF8mvTFJFIYYMqs@lstrano-desk.jf.intel.com>
In-Reply-To: <aJF8mvTFJFIYYMqs@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|CH0PR11MB5267:EE_
x-ms-office365-filtering-correlation-id: 9c1b6816-ac41-4d48-91d5-08ddd3ed70f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?vW48FH3fCu2V3k1zzoUGVEP3DZ9XjHGLePNii1fjvKK80scuPa/3veiTY4BI?=
 =?us-ascii?Q?j9YZkeITRmyO2MDLgWc8jemG2tAuy4li7VsxmLLksqbDjOkFSV22uEEVQjQD?=
 =?us-ascii?Q?sLh05t4/6jIrVU3N3sH3mW2yUQxo0Q20rgc0GXvT6jhB9XbT8A0y8OIwVMPH?=
 =?us-ascii?Q?5iDJWobH69GnZN81ukSYFiKxNFcLT0maqlTsKdjLF1UdD55getgHRlnDBkc/?=
 =?us-ascii?Q?uy3OWufQ0Gnf3Ofu/76AQONRBSd11eY+CANZnfbR7oebpyX6cQGSQ8srtpdV?=
 =?us-ascii?Q?zeWpeqtFmZoZuctKcIK5zic/ndLVzKFfSQiIoyjUPSo6gE3moSLgvprgRldV?=
 =?us-ascii?Q?5ldTzDyenXMvrlp/PRr4OJX1OCJ+W2/AuWFifMARhF1izgSlatKt5HCrywJW?=
 =?us-ascii?Q?b8BpmAHZNyxNA0XoTg0/hZvOg7B2t1T2mrC9GNu9zfg2IBa4Fpu5Xjl4XBMA?=
 =?us-ascii?Q?+AtwnOHmv6eR6O+Lb4SPrHvGfFsRcz33FfKGMfhFKsuZdqPpxhqZP5f/ovqA?=
 =?us-ascii?Q?Tu1ny+BQTUL6J0OyjfXi6jgMlk8YRRz6VTorw38Rd1KTvyYp0i/Zed3hWzJi?=
 =?us-ascii?Q?mUbhMDsZInm+jmYLqZQ1dPCGtlXsgDmE7Jd4/boJH+pU2QK/ucqpDRSLZXd1?=
 =?us-ascii?Q?6MFxa+cerJ52P8fPYLiBHQc6lWLH3YRvzcg3F8xbGsKGX3VSaZItdbIKMxRB?=
 =?us-ascii?Q?lD8s3uTqCT7kPUkHDOYRmZgGQNN0fcxqfXxbQofZ0ksPl2HmthNTlrl74f5+?=
 =?us-ascii?Q?XlCKYUnqTaGLXttpNKxkuzpppoxnBu5+FbwLzlivYUWOlIyhkQs3aCTYG/TR?=
 =?us-ascii?Q?PX1XHkg84sba2zaxSwydBC/2axWzc9CipO+ppioS9Askr6O4KmzraODxrCRl?=
 =?us-ascii?Q?IJ4B6c8BYKl+M5AXM/0ms3gO3LBs16I5k8M20a9RvOJ28INUdZ7OlO5ISyrI?=
 =?us-ascii?Q?efeio6cpatclQsXAcrMT2MVn45CtLO5Si9qZkLPgbsINWxatkOVxNb1WOCrx?=
 =?us-ascii?Q?SmPdDjBKGQaxbQ1Lm1H3kyVwGHwQCOxWtXYc12pz7RTJv/nsXiP1zFkchple?=
 =?us-ascii?Q?nIhFjw2ho6GUbAvnfsgLpmsngfsRaGcxeKXArvY/j2ekOx70kTmHrP10oOj+?=
 =?us-ascii?Q?6fvRGMnQGY7of9Poq/wsqRU6+JidNk6+GEDULiMUJ3DX4ukH+6kwos0MezEA?=
 =?us-ascii?Q?9gnAAIKfI3sK0x8TZ/PaQ//JSJ17oVdLGX0Im0R/tKlfDI6J4eHsiIVCvfuA?=
 =?us-ascii?Q?WyRmTDmjzcLo8xWZ5RRdkJvoUFYTo5RZc/3WHY3us8l/vuh6VaNNAcoE8gRu?=
 =?us-ascii?Q?3iFxlKByL9bvz9nQRULOwMAaV+NxFQRKPX/g2s+zmSSUs7REiVumtSKHFjE3?=
 =?us-ascii?Q?prYFMfXSrDByPJ8PreQil7XQlWfgcrCIUAxqtav9HwKuXmT3umQdMWyt8Lw2?=
 =?us-ascii?Q?PfZ86gOnRc8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RgPScgQodhigBKr94MbO+1UGKEJbe9q8yTeMpFSUzc37YuOBdoZKbAELlXhn?=
 =?us-ascii?Q?jz6PdcxCkRDxdIGilY3jfpm/dSFTPNvM+0uANwDaMITfU0t6FnwMxTLSvEfm?=
 =?us-ascii?Q?PyWDapmSUDKUM8fXcngO1xZiXKH412bDkbi6xHRRO4zJQHbv6j3LPLdlDYbE?=
 =?us-ascii?Q?FVBFZut+fAEfbOm2iOCjBCd9C8C4Gs4hnZkyNXrOnaVpwWC0+lA5o21CkGIz?=
 =?us-ascii?Q?Iu8so/hx4+0FBfwcbZvmkNneplLYBIZUQ64qzf3WvyQIwRR79nYwDB83geX/?=
 =?us-ascii?Q?PCvvxWjHVbVDWhPv0FV04OaOAPFSXYCeyN9hJLahVa/33XbkqLEC+80TQa5e?=
 =?us-ascii?Q?6+x78WjWzx23qPjiYvTtSuOAjvvf3uNsKlf7Zc4/YphgjU9PDazM3B0cg/dc?=
 =?us-ascii?Q?Kq1P8lzo/a3Wznw0Gp1vkVme/WHFdFscCiGxC10XSOEC83ri6mg5Anc7osLC?=
 =?us-ascii?Q?4pwUjKdtJl23L2JxkeILlg+mG8lKxB2hW+sXndI3RemTBXLjeoC6C25AhTPh?=
 =?us-ascii?Q?nq3vR6noIe6rdKG1fwvUk3xdYA8drjDXwa8acfzGN5HEnZYbvuQ8UBvDgqMY?=
 =?us-ascii?Q?CdER9mJyGI486BQ/imSVLq8uPRNUkd86+gkS68FaQwNaoFNipM5MykXfuIJD?=
 =?us-ascii?Q?e0ftw0NU3deuyWTTTWBSJ+D1X5MbQYz8FaDLVrmBsvkB2h/RPiXK1dtgIk3y?=
 =?us-ascii?Q?7nbt+c+a0QU3qsDO6205KYOXF7QJTugoJ5NUykJk4vwEUx0NJfzkiwZ9qL6z?=
 =?us-ascii?Q?0GRpuT++rKwEIxJ3Op/KTT/7oCnzi1Rxmo6lJZWAneonGDbDHI4Gj8AqKrBb?=
 =?us-ascii?Q?oeqCCII5KqHjXyL8MYEfICyKRW/aakqb9aZd+MOALQ8ruoDClH0V52kmWBN7?=
 =?us-ascii?Q?LEc4PZ5PejKzz8zO28I1A7B/Wnj6XvhBCI7/bblHg9oz2kn6KuoxXHxZY7Mg?=
 =?us-ascii?Q?skAzJd8OAwOIA2gLl9NZvCMaJFsryJqFkzm9has5yXarQhN/Js6rJQnjjxXL?=
 =?us-ascii?Q?ynRr8uytWKTL8ThcasBVK32EQLvyymDOQwa7oSb5ouOn/Wj5O3RvLvTK3H7f?=
 =?us-ascii?Q?axgBZ0rTF3WNkXlSnwTmwux9UG9PS/bHtYgo6c1Z6yYI6yx2UW0JEgKgjSbe?=
 =?us-ascii?Q?0SbQbZvrvVXccpXrSLTap2PE1Uhla5rPHZ/h47/9lbSukIuLrMavfWqCFkqW?=
 =?us-ascii?Q?4PhcRid5XxkUey/5/+Nj/qJDiwNBtEJHfyZ1We4vKiwzZTQjRmMqX4fKbyEP?=
 =?us-ascii?Q?H9mxbdiraNwRE4RlZ0pizwbalkeg4g0W32DH4achZoZZYPUtfYyWAfMs8lET?=
 =?us-ascii?Q?F0hcm7CCglcJ1kqFSk/DyeoWIRivrAguKdC2bN0/NoQ//eiCB4XX/J4sHzby?=
 =?us-ascii?Q?KisOJxtKJZVUYYLn09Z6AgQtHfkRTEn40s97CTNZw4ZVcR0zoHS+49sISP8m?=
 =?us-ascii?Q?7YlqL1wTAdER18ROCdVol2mYNRauq+ysXIg6HJHmo7ky7Jnw4QP5yJdwPv/3?=
 =?us-ascii?Q?rGFCyIyJAc30yDAoo3+z9Gj6ADJ9jbr9w6HybL3M9w49xmE5WcGyR3gvANs3?=
 =?us-ascii?Q?g21yJLJbvtLlhlyFVUuF1By+6+s4Nza/NPXeE4nj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1b6816-ac41-4d48-91d5-08ddd3ed70f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2025 06:58:11.1504 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UAkHdEWR0DbxAGk1fRw0q0GXd/alu1MEF1TobQQMgNvHC36Q7F+tbTvMCzG1WNmZsH7JVpC20V+zZpMRXWrkBioJNc8AYpyF7EgVXzQ84iM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5267
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
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Tuesday, August 5, 2025 9:08 AM
> To: Gurram, Pravalika <pravalika.gurram@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Wajdeczko, Michal
> <Michal.Wajdeczko@intel.com>
> Subject: Re: [PATCH] drm/xe: Fix coverity issue, cast_overflow
>=20
> On Mon, Aug 04, 2025 at 03:10:38PM +0530, Pravalika Gurram wrote:
> > Add bounds check for error code assignment.
> > Prevent integer truncation when assigning 64-bit return values to
> > 32-bit error codes by validating the range before casting.
> > Fall back to -ETIMEDOUT for out-of-range values.
> >
> > Fixes: 16ba2b28df3a8 ("drm/xe/pf: Add function to sanitize VF
> > resources")
> >
> > Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > index f00cce81f1ff..2fa1a4fba1ca 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > @@ -2091,7 +2091,7 @@ static int pf_sanitize_lmem(struct xe_tile *tile,
> struct xe_bo *bo, long timeout
> >  	} else {
> >  		long ret =3D dma_fence_wait_timeout(fence, false, timeout);
> >
> > -		err =3D ret > 0 ? 0 : ret < 0 ? ret : -ETIMEDOUT;
> > +		err =3D ret > 0 ? 0 : (ret < 0 && ret >=3D INT_MIN) ? (int)ret :
> > +-ETIMEDOUT;
>=20
> This looks like false positive similar to [1]. 'ret' here will be positiv=
e (success), 0
> (timeout), or ERESTARTSYS.
>=20
> IMO we don't need aggesive defensive programing here as the returns from
> dma_fence_wait_timeout are well defined.
>=20
> Matt
>=20
> [1] https://patchwork.freedesktop.org/series/152488/
>=20
sure thanks for input will mark it as false positive=20
> >  		dma_fence_put(fence);
> >  		if (!err)
> >  			xe_gt_sriov_dbg_verbose(tile->primary_gt, "LMEM
> cleared in
> > %dms\n",
> > --
> > 2.34.1
> >
