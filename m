Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF942CAC5AC
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 17:25:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A610810E686;
	Tue, 23 Sep 2025 17:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mS/uuS2I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF8E10E686
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 17:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758648351; x=1790184351;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NaDFS4eigSnAfkP6qAKqCnNiQJE5ehMocMXWSN3hBX4=;
 b=mS/uuS2I14U6SgZUVdzNtYqINjSE6RRGr5FxfctqQTaEyxRWwa1jaFxn
 Y0WdYHrtZeq+HpM19qpbuKTb32Swv3BEu+BAh1OgcATGwbtSMbQNMPTd2
 asmVMjzEKld9+rRNqTZO2UMm9iwii/8+P/dC9tvTeW+LymJcCQCqtt4sB
 e/IEra/10wqR2WOrTRMzuA0IosXkmnOM2+xXKM67Qut20Y4KeyHzTS/aZ
 I5syHKdwfXcE29TuCZnRu3xJEmS/T3pMAR5z3Z1t/x8SkyP6O22ICd0rE
 9VE1sbH24Z+pxcjDLUXibNb8yQfKKg4QrPxkJ4O3kownsDlb2uYoxnhbg w==;
X-CSE-ConnectionGUID: bPIRTBPPQR+ikDHntj+lkw==
X-CSE-MsgGUID: nzDGU4D5St+pU9Te5gIk0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60986330"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60986330"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 10:25:50 -0700
X-CSE-ConnectionGUID: xQecraYERlW7kqQjTrlNFw==
X-CSE-MsgGUID: n/uHe+PnS6+nqolTvVN2FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="180814448"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 10:25:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 10:25:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 23 Sep 2025 10:25:49 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.8) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 10:25:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZvIlpUJpr7wF8+TumTZr+HM5R9VUxZQjR570FQ7gI69NxfwOSDnx7SdOXTzX9PdAspsnpdFb2o7v2glp51lTsem8+UFHLRL7N6d4eY0x3iqCveyV4BMj6v/8ODb3ycoiNOTYGFUQaedZQjZtV+9TkNm7++zx1OBM6zU2jmOJYB+vsoNpgEFLq2M194lUGqumAasUMG8lntQhzJ+5jfksQaGSUSnBUx4Tlx/PsfagNDjj1lFLS72c39+LrB7nqa1eYMzbWs1kOmXkKRL+OeZjHbJXhjQdo1RoiFg8KzclUixyW6cixAjAMekoN2EORSTitpaMZi8FKAcrHDXa0AHgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGr40xJQVv1q+QhzRzrK1kbZK10ZzN8ADPdaD9BA+lk=;
 b=WkRFJJ9QEcCC4+GxoO8UtICuKtgMJhFBXg89Bm8oqh1ruT/lfRopazgraRZx6WQF2pzi8/TlU4JgsXSZS27WYPp9EFX/zxVrx7s3rF8NvN6xN8c9INN8kg94RTuH97Lbraw3vCbXec0MAmn1DtgKxQieq6O+eGuGUuz/1VMnGS6aitfmO2/ruTt0pQwxfK/1FWXl+tAnGk6x66sD6cg6rcOk2kskiuyYOP6TUCb1k9DuRVIYF+WjV4at/+Z7AxYDBXJvLNOzwxVjk1fFA48wuFJZUYpMCKOveKP/IIsPDHnfGrOF47Uejjlv6GYZSKuVYYAZ2lNjr0D+RzAmlm8CAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA4PR11MB8914.namprd11.prod.outlook.com (2603:10b6:208:56b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 17:25:47 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%3]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 17:25:46 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/xe_vm: Remove unused DRM_GPUVA_OP_MAP case
Thread-Topic: [PATCH] drm/xe/xe_vm: Remove unused DRM_GPUVA_OP_MAP case
Thread-Index: AQHcLKr7ggihAPTgCk243j4Z/AH2T7Sg/rUAgAAEupA=
Date: Tue, 23 Sep 2025 17:25:46 +0000
Message-ID: <CH0PR11MB54449C2721A86616399B1442E51DA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250923165602.71755-2-jonathan.cavitt@intel.com>
 <aNLS8t4kP7+Fkt5P@lstrano-desk.jf.intel.com>
In-Reply-To: <aNLS8t4kP7+Fkt5P@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA4PR11MB8914:EE_
x-ms-office365-filtering-correlation-id: b9fd48f4-1b62-423a-8276-08ddfac63bb3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|10070799003|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?/f3ylQdaqtAEo7Dty+ZMqWnXImSktPGZ61Fv/Goqf62UOt486Wu6R/KsmtQD?=
 =?us-ascii?Q?7MLe8RkKMGO3x0Y7LOk256ep9mx8mL+WVGSof3Zz0PBaVm+z2nXTQkjD7JAn?=
 =?us-ascii?Q?UkYsfmAjv7pT0S+OkImMW4a7Z4mQQ8ZCLyGgiVlMwdgy26+bqF5UKGtRy/OQ?=
 =?us-ascii?Q?fgb4+epdTbmfAHeN3sLSJEekYMNjbx5icoC9xD9vel5psz0u0o82Nc1qnmyk?=
 =?us-ascii?Q?y6aur3B0KIhTJrL/1WRRUVxEqOJM5PMOGtGfr8jwC4fFGzVZHiMKtolBp+zs?=
 =?us-ascii?Q?ryR4CDVsI7sJx2dmgLEiEbwD3BIB74pT5smuWtgVttea5fiAFJX/v0o+b8c9?=
 =?us-ascii?Q?nOSqnBN3bqijTS3XfFTQTtWkUk6N8zBJrT8W/eOJry3/xBZS584iOUC3Jyb5?=
 =?us-ascii?Q?JJk7QRRRFEE0Prdpu+U3HbXWi2EdTKEx5psG53/KDkUq3mnVzpbQm+ciOPhU?=
 =?us-ascii?Q?gdo4Q5xy+ygwf+Zt5KLk8/7HCq2d2baCucIE2au7gswagrM4rxwBwjBD802X?=
 =?us-ascii?Q?iY8IOk0B3ENEakYwkpbbAcXM0NrHWeBpjIBa76RJ1EsEdIVd9Yar3KvsjN9J?=
 =?us-ascii?Q?+PEm9qQzZCSBbj2ZX3JWgqTG5AN2pkNyZXKAmkCEWVgG9uCkeSTtQ7pjj0E+?=
 =?us-ascii?Q?RqNCvdjqw4AP6pxhroNIkqjLrkjOr6z4ECdejZgHspVczrrWBwUa3i9wtM87?=
 =?us-ascii?Q?ytoLuuBi0zZu3Z0HQbsjZt4p+XpZWmvQuitczqa9HS3UWymH4rgIwro1ZVUx?=
 =?us-ascii?Q?RT69uTx/tqw8EZJuZIKBHkDy4KTAxurbgKngNaN+XN6e6ZLrUyoouvX00cUp?=
 =?us-ascii?Q?RMzm46zojc4uFrm2qsIrarlNOxnwQcEdYSz/mPnGEjtANPa77tmdItM/QT+y?=
 =?us-ascii?Q?+N7U+jdL+ZQZhNqWiVDDqoLbaQvYeYZ7quy8XWbR+VFQqEvn5n9KpYxra1sX?=
 =?us-ascii?Q?tZh4TuXPOdp+H7NCeh3P3VtxWJnTtx69FmPmcEnXdVlUDsnhbQDzub4rHc26?=
 =?us-ascii?Q?F4ba2KfRp7Jw265eAbt4gL6MeYOY5k9bfKVWLz2LBNktrpduBGWdQNIZKqS+?=
 =?us-ascii?Q?+htCMYYR7hFM8nLypl/NtXJYBeZ6EYtqzIOdpB3TiunIqMOt9Pdx1DIi4uo8?=
 =?us-ascii?Q?AB0gdKYP3zF9A7EwEKLgu0YI8O2SVb+bYyueAVvpKoTou1sCabew1qmVxs7p?=
 =?us-ascii?Q?rs5umk2QeCMGmEK5DCEBmw2O8KQjF9kxTLPZjK0a3V1mgpM8aVbTT+XsU0uY?=
 =?us-ascii?Q?pHD1EJmmJQ2R431d5z/DD44NU0nQc4eLq7q/m5wxty/dNWmNQFEwoWY+9c1U?=
 =?us-ascii?Q?hBRrTi17jtBu2kZE6La+Mz6ANYH55UTc7J61JUTzwaY5LobAbl7AXy2kOSde?=
 =?us-ascii?Q?bnCQsCACavGmAajKx84MwQr/5m0gktyLC5FPqZLy8fIZi/ABd9Y0/L/rV0F1?=
 =?us-ascii?Q?/wuMnUh/HobEVPyuV90deliJWps4yIVDQRWN3n8FwAdGxhVEvHcpIwt0lAnJ?=
 =?us-ascii?Q?JxTetG4qRplyj8c=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sALEnw9FNvVHaMn4V4X0hX6s3phymYKoyiA5VGlW+/vXHZvpmBWGTTNS/eVF?=
 =?us-ascii?Q?HlNKo4ZTYe02p4Q/Q4ZASNjpzCokJUeSlUwTBnWkD2nS6CppKCZiTsYvO3hF?=
 =?us-ascii?Q?hekmxMF9dvXpJ6jPOa32N2shZq9qudqOvqqFMvzYqD6OVMadhrSlIlhmrmWI?=
 =?us-ascii?Q?fAXdINpcMch8MS30zTugFv9pYVZJ/dZ489FjPYxgYqFlrFoElI1br517W3bn?=
 =?us-ascii?Q?pZibtZCMUC52cUjlOCrr2ct4yzKRBNE9NwL9NQDWFEa9+3xQM6vVarVmBmHX?=
 =?us-ascii?Q?wDiwxOpUFtHmaclX2vKplEp9naOUIQgrzIPO3aFvwYaW9/6BcOfbJ5dxIaLV?=
 =?us-ascii?Q?7ubD4ix/M3Xp6mEst2tzoj6X0qqCN48PMtcBffxj7kFQVMIzAj9T5iwThu77?=
 =?us-ascii?Q?F/O/ZfBFjkuDSyfuvLwbUEF0SECf1qDog4KIPdAxP0gmlkGHKtAv4MdvK5o2?=
 =?us-ascii?Q?31Z5H3ZP9uGmIOfjFY+hWN1xMS0KEpjWEiKFWMbe04lLYg6CyZiVZrX5VzAj?=
 =?us-ascii?Q?kLwO5/VPworZDufJ6INwkRTFa4qIWrmazgba2arY1zxpEjPU4L+gTcHGr9hk?=
 =?us-ascii?Q?/WneHETrQviZEdSMuWkSOFvk/cZLAxerKmF94OYQXMCLHZq88R91FYBud5+i?=
 =?us-ascii?Q?V3DUDULKYbof8/IoUaCLvi52MNB42ARtiiO1uLxRdHjeEfIIHlNQowfz6b8O?=
 =?us-ascii?Q?7Yr/BeZJsQd9NJ6taYHeyKSiphc2HNQ3HWoz0/rGcu/VKyIrKOmbDlLAjY70?=
 =?us-ascii?Q?5KJQYF0TKWA63pv9lZmdlTH9MhzWJKK2oE+xUI2h5UF0IlkF0qbiyNFxa1Uu?=
 =?us-ascii?Q?LFzsyd/kBe8VSxsHXWQExWSf+tM4KyVWCgitrGhS72w4sq+AOQh9fvRTjJAK?=
 =?us-ascii?Q?8A1qsvkwuNRQHksoXqSCZZ4XA0KIR6R6/WZtK4NKBgPkaf+J9sEnuh7LlGj3?=
 =?us-ascii?Q?r7BGYGVxwNK54CLfgX34mD383iVznGSbSKl9jmOl98cnEYG+rqc1GxZ4oQ+p?=
 =?us-ascii?Q?i86Y0FHRiOFxh3Fc+r7V5vz3PRiL6uBZoYsTZ6cCioE9bgJUWOrEr+elmaQO?=
 =?us-ascii?Q?aGhk+VqGf3v6dwNdTJESssLZzm0SOqNWUYg6Y6CRFw0Dwk7Yy2BF7/q2gGVR?=
 =?us-ascii?Q?h/k5Dv7x8zFHtS9gHyEE7PDy+B6XA7OvznUkSR7KLDyFKdq8BTSge2RhHRhX?=
 =?us-ascii?Q?q8EgnSFUwr+wvvxGIdTfUstQEC+kfQBTRzGjfx+7YeLI3mXNge3nuKBkifeI?=
 =?us-ascii?Q?coBOHNsfGEcJJl+i+x2hywlq9RwYUksqoSx0veFDmxoOInFL35JLq+NBvqCe?=
 =?us-ascii?Q?ksGr1zq+EwgsvOIUK6uXaSu2Le/MfEVaFN+EZ2jK03QbZPDAMfmObZ6AVnpC?=
 =?us-ascii?Q?RSSFgbsFGZjUNAsP+IhI4IoiQtxVQlSxCGwkBEf9P0ISzeyMkkxg6TSv66fs?=
 =?us-ascii?Q?TKYFbatzO89ypzIXnkbErAuCwvmwlnvbSW3CoywyIcgD63g8RfqCenv2Ui7p?=
 =?us-ascii?Q?8NNc4+pvRAk3UCr9iE5gfddOnVDDlsrwzGEHPS2guxKo9GG8szez5CDb/lNA?=
 =?us-ascii?Q?3IHbKlDNbkb2nPXw2iW7jM8HsvzGhzHRvYqXyyP5Hq5CkyYON6gPRAChgKgW?=
 =?us-ascii?Q?NjPgzwVqBrmrikPUpT2NZ+djLT9XBgSz/4LiOVU3hP+g?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9fd48f4-1b62-423a-8276-08ddfac63bb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 17:25:46.8190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 469LjIs/Sre68yy2mfRTqP81NLFST7KnhuCFH7akeBEbVN64WX+CGSzNd3QW8lp79rwLW3iCXHGQFwP3t/Z16jqCB2dZ1fnoubRLhQmNg7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8914
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
From: Brost, Matthew <matthew.brost@intel.com>=20
Sent: Tuesday, September 23, 2025 10:04 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>
Subject: Re: [PATCH] drm/xe/xe_vm: Remove unused DRM_GPUVA_OP_MAP case
>=20
> On Tue, Sep 23, 2025 at 04:56:03PM +0000, Jonathan Cavitt wrote:
> > The function xe_vm_alloc_vma uses drm_gpuvm_sm_map_ops_create to
> > generate an operations list when is_madvise is false.  This function is
> > unable to generate DRM_GPUVA_OP_MAP operations (at least with the
>=20
> No. drm_gpuvm_sm_map_ops_create in this will always output either
> DRM_GPUVA_OP_UNMAP or DRM_GPUVA_OP_REMAP followed by a DRM_GPUVA_OP_MAP
> in this call chain. static checkers do not understand this flow, which
> is triggering a false positive. The code is correct as is.

Okay, I see it now.  It happens at the very end of __drm_gpuvm_sm_map.  I t=
hought that was some
sort of default error case, I guess, and not something that's always perfor=
med.
-Jonathan Cavitt

>=20
> Matt
>=20
> > settings it's provided in this execution path), so the check in
> > drm_gpuva_for_each_op when !is_madvise cannot ever be true.  Remove it.
> >=20
> > Since this is the only location where the variable default_pat is used,
> > we can also remove that unused variable.
> >=20
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 8 --------
> >  1 file changed, 8 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 80b7f13ecd80..7fea3eab7062 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -4202,7 +4202,6 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
> >  	bool is_cpu_addr_mirror =3D false;
> >  	bool remap_op =3D false;
> >  	struct xe_vma_mem_attr tmp_attr;
> > -	u16 default_pat;
> >  	int err;
> > =20
> >  	lockdep_assert_held_write(&vm->lock);
> > @@ -4228,17 +4227,10 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
> >  			if (__op->op =3D=3D DRM_GPUVA_OP_UNMAP) {
> >  				vma =3D gpuva_to_vma(op->base.unmap.va);
> >  				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
> > -				default_pat =3D vma->attr.default_pat_index;
> >  			}
> > =20
> >  			if (__op->op =3D=3D DRM_GPUVA_OP_REMAP) {
> >  				vma =3D gpuva_to_vma(op->base.remap.unmap->va);
> > -				default_pat =3D vma->attr.default_pat_index;
> > -			}
> > -
> > -			if (__op->op =3D=3D DRM_GPUVA_OP_MAP) {
> > -				op->map.is_cpu_addr_mirror =3D true;
> > -				op->map.pat_index =3D default_pat;
> >  			}
> >  		} else {
> >  			if (__op->op =3D=3D DRM_GPUVA_OP_REMAP) {
> > --=20
> > 2.43.0
> >=20
>=20
