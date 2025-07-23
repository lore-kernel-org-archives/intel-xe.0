Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EF0C83F1A
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 22:01:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3CB10E866;
	Wed, 23 Jul 2025 22:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FdYhWzrO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93EF610E866
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 22:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753308095; x=1784844095;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wxg7GxnU8B1IhuvOJbmF/4nqKoUaVdApEg9ZP0jRT2s=;
 b=FdYhWzrOEnP/WDiq20Rb0bfbK+56yer9MrSX7UMdPlxK/XpYUAnjQE0e
 qrKfFTVzU9KSaB6hiEfN4yBVQ5V2Vugj4dRbFyUQZZMvHcr1yyukyW0gT
 IZwpJ/bDw1aQh5jExaNbKTQevBIEXDgB5s8slbzkqZkom51eD9CTvqZ93
 0Zpzrxi1wGkvt+AxbWZxwk5Te9mr9EgEkUysas4lfte5mOQuojUnwI2rO
 U81LziBZ7vGyFs65iFlv7uXhx6cRiZgzkQz0H3esxG6bzt3po6VwptlsC
 NqJldFfCStkEQolia+xIQcoHf5V5840AuT/C260UH9SerdLdN/7SyjjMi Q==;
X-CSE-ConnectionGUID: SCa12UjxRjmQiYL3lNkXbg==
X-CSE-MsgGUID: BcJZiLODQ9yYHhq70SKr5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59263626"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="59263626"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 15:01:30 -0700
X-CSE-ConnectionGUID: 19BkL7snTF2AecoyyBoYoA==
X-CSE-MsgGUID: zrQ2qwd3RjSjwx9oV9ho0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="196895299"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 15:01:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 15:01:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 15:01:28 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.54) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 15:01:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YHeoSzxkdzSlns835M9lvh9W59Q3Cva8ULpUeQSQb94/Z/SCaqQBtjj6pBNASF+S9UiRdTZIo14i34PyGSMNZzcNeEqNu3U/UKiRfNuCaVbYLAXFj7qels8V+g9lztdD8N/o/Z3e26WiGe3EnQtPnxLAaYb4VnyRzXHNfksQGa4UEA1Itq96NzwgLw9u4mGEfSRwtxoE7idKqh2iVT2kQG7QvDnmpklYamtIM1T2TOic7mzIciTqG6lifMC4NQJWrsT0j6l7jj2Vb/iZ98Z/EY0orOXwGxSHK1KdZFmTNCKTK5Fn63p1DyzG0nOqQOr10kcmsZ81enwrp+N7y2YLKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vleYOI2L5vPiQW/juxG6YkvOWIyRobqhTDUgLVgX/I=;
 b=O4vlAwLsferVeus9olxk8u97AUtdbzBIC3O8OnP3HSw/Cj2O0HbrvSqXSZjmaJ9VsVrVlraFjf/QKGzPY7WtHckyxGFaRyemwu85qS3QX18Xvubrv9CzkXI//fKeGCpALRybqiSQrTZUvr7iSU72ja2bZ3Jc5socsIr7+t3U3jUcn1n+BmZkLUM8vxdYRmjpp+sDGAGATF0qJqYMtq5u7z0ZlCRXcRSHSFz/MrI3ihUSevAjOFZmAyAiQYuyQyM2laQDWUTiMC9s5hMu09SXLCD2d4y0O6EcSTmkpLKSBGnTFA48Dwn/WGmdtJiy85t7OoV0qCC8BZnpYNW9E8EkKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by SA3PR11MB8073.namprd11.prod.outlook.com (2603:10b6:806:301::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 22:01:23 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161%5]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 22:01:23 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Sousa, Gustavo" <gustavo.sousa@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/2] drm/xe: Probe for tile count during device info
 initialization
Thread-Topic: [PATCH 1/2] drm/xe: Probe for tile count during device info
 initialization
Thread-Index: AQHb/A9nZg4t/6ul9kqLZDvFM127qrRAP+1Q
Date: Wed, 23 Jul 2025 22:01:23 +0000
Message-ID: <BL1PR11MB54457CF0BCDF49B95235D47AE55FA@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20250723-gt_count-improvements-v1-0-3016134db9ea@intel.com>
 <20250723-gt_count-improvements-v1-1-3016134db9ea@intel.com>
In-Reply-To: <20250723-gt_count-improvements-v1-1-3016134db9ea@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5445:EE_|SA3PR11MB8073:EE_
x-ms-office365-filtering-correlation-id: b9a6c633-f53e-4780-5fbb-08ddca3476a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?X5+LsTtIYo97RHaBH1bD2rbG4ffg6D1DuzusyME0FUHFZ8kIuJrjxXOtDkPo?=
 =?us-ascii?Q?pyz6BWceihc4QMR7hxUZKWyLFX230afotguFuvm3TLy2XXD2RO/KOjAgSjv2?=
 =?us-ascii?Q?pbRjSEc+kcFQ1mDGoIM6nY4UxtkA3YRGZ3yCtjyca1CZaowGJXv3spO3aEkF?=
 =?us-ascii?Q?GVjATTadYv3PbapU/gwdy+NfePoX/h26P4R07QqTKZTTD2HbezHQ5UTdpGAC?=
 =?us-ascii?Q?Zf2vfRM7NtOY2OHD5gDbBxNnQ2iq6/es/9wgLlmwun/u5oX+RZCNu2+oxrU5?=
 =?us-ascii?Q?awcuQpTOseCcDvDZbIgvYVffOSb+9ym6z6f371lXLqpBQX5rEsyK/wHT/n6b?=
 =?us-ascii?Q?6hXEGXAt9Xc0FVSv/m8TQYGaLrbBlqjT16OvNdDud9NyCU4BF0JDDrim4mjV?=
 =?us-ascii?Q?QUbZzjs+YQZMuzbG+lPezkJ6gjfhA7VjdMKOPSm5LPY+RjrbGaaaR4catX2Z?=
 =?us-ascii?Q?9u56+RqpKPSPa999MzarqweaO6Ca0TFcEIgMw4rWtNVPy/d5kAZF9QnVFQDJ?=
 =?us-ascii?Q?mWcl4yuT8snhAKci2q0Cpek+UjpnAw3Yc6iPbbyXRCnyWEXE4++yPL/6hOAL?=
 =?us-ascii?Q?dQCImN6PAifsfpbnACxUXKN2FYxoHK11XiqM61wxN3GkEtz4JwCKHUXEAm1g?=
 =?us-ascii?Q?3smLXnYW1AycfJVde4ku2leABZxtodCNyKx1O195oXNDkB5qkeyf2TmEaYdh?=
 =?us-ascii?Q?HxTeRJCzoSoiuSq8SeBj7zvx2nbqzG7+VaiSRpB2X/35PQDlH2bJ8ujI0ZUg?=
 =?us-ascii?Q?ITY2LzP78P/qvaqQy0+TXhtL6uyzct6R1qxzPaAWzkQS4lmbv4y+o+92QqDa?=
 =?us-ascii?Q?rhBVY+cHnfgvHx3W1Nlz1Omeu9y6xW6aUEAhlH6O7SFwTELWGnEUHPsf/3BH?=
 =?us-ascii?Q?F0HAaJjD9nSeIb+CR6gMbSkxFDp7taA8lhgwFf/kmStB3qcIHbWbh5G0QtjV?=
 =?us-ascii?Q?0QolB7dEIq5MOppmTK2IVX1n5g7s3G4BnDxFRx8tUBtTrU65YArlQSR0cnlZ?=
 =?us-ascii?Q?T2x+AbfG0nt2hl/xjApPAIe9Tw/miy9beqgioV2EubKh0XtCk8t00gom7V1y?=
 =?us-ascii?Q?kFF7ZJiDMWzFPignMxeE6U21N6z0vPE24fFH5xvVH4ZcIKs1Im5ZexGd7NnH?=
 =?us-ascii?Q?5f5GopZORGJidaAP+4K65PqiDAMGJfO9+Km7kBZa/PxyAmO1Nclb9uLboQfl?=
 =?us-ascii?Q?Mlj/n3Tgohm4Kbw+kKaQ0f1D3NUXV24YntguMCb7FnKaZe/FAyHflvEDILui?=
 =?us-ascii?Q?3I6GZEwpDJT+PxOLWPARi3r1ZOgFmDpKc0cj0pjYmZ1VE7aAu9hWoT1kWTrA?=
 =?us-ascii?Q?jVFZuWLFbDyiGsG5amAuLM3tcmWYc2ay8kOtOrrTzL/jTblN9Hg6w7lKmDEq?=
 =?us-ascii?Q?0/4eru3umM1sH/nnS+0iOUMs8WuTt9lTf906gxTo69Ye2lUIC461uMLgehPj?=
 =?us-ascii?Q?UlxSWm787TGhEn0LjvrMtxQm6JnfiP/D+3RviKH0zfowmg3m+BoBbg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?D7QcVPoTkUayo82vpBVA6xtcy8IA33cuADKH5aqw/mV5ui6BROgbcNuDjI8+?=
 =?us-ascii?Q?n7pO3jVKeOh4x55WQOwod7vhpvO7HVaWkhH0n2KnGR0ycUgzZD4YrxQPOM7c?=
 =?us-ascii?Q?G6cBCx6Dz7Ssvb61IKxmALpzxVO69Hu6Scp1ivE4R2eiba/FhHoVLSI99jRl?=
 =?us-ascii?Q?Nn1u8SGBja4JRE6h4OeauZ1czG8l0l2LDmi66KBAKFrL6+bSe9SN8sv0CvSP?=
 =?us-ascii?Q?HwdUBNCzLCxl1U6LIf2F/1siAyy7rmipb//Kjpt4Kaz1i3NDP84C/ZH3tJLk?=
 =?us-ascii?Q?Hb7QQ57f8A3qOg2pVBY18lNlHRcf/OTrzMTyNYFJQRFIUAwqGcnLd/HpfQGn?=
 =?us-ascii?Q?dNFBRroqJUJ/Iswl1o1d2mMQCqrgNE4amklGvOgFlD1yKPCcU3ma+41sp0ah?=
 =?us-ascii?Q?RNNygIz+iVADo7litaA6HVe1er3LuLbDPHisW4qDW2T6KorAW89tneHgh1Xh?=
 =?us-ascii?Q?CkbmCHZksN0AzjdyEWlhRo7pGhoJL4zCZ4zpYPLD9AUzsoAsBQsixdWV16S9?=
 =?us-ascii?Q?oIHpzm3cbzLxa/iq4VHD+UrNDwlnXlBTiLe0sFgtehxRJM2RJ2e3c82PopDR?=
 =?us-ascii?Q?Rz7ApjLAM4EQrwynlAq5DF1HkoMCR4bdsPC0kAsNui6BwF2lysW8ZO6CBUR/?=
 =?us-ascii?Q?6BpQxsUTX539Aq1hfaXpxsf90n7UcZN/re1SQwlmHnqfOjOu+s6ae5xUrCyX?=
 =?us-ascii?Q?YhfQBKeWd5OtHZCQnMIj0PjCB3OTSPtsHZgMd+7trbeYB8rw5d/dLxnnKuzK?=
 =?us-ascii?Q?wQdT+OkKpzituKqGEOQXJdqVGD7w1SRNdDdpINcaovKiiAUuHvYmLcC6I6dA?=
 =?us-ascii?Q?jxqFkgc9PFeqj/nzJUlPfAV1sNccXIGgYTZlxEvn4P7OmNMNnUhce9+TuXlP?=
 =?us-ascii?Q?o2ZmJ3uZSUSHJ91W1EZc1F415pLgkls5pddelemwsyBwQ9xTKPcdCUJ2RqGT?=
 =?us-ascii?Q?DSDnJchRqxbr71QnA/wcqklT0IZ+rVac9rjJMaaoNIANwQlHIh3DAnWZbVVD?=
 =?us-ascii?Q?/gewdjCi69KQokI+vTwPGQJ4fzDUQ5FR+gtP+aLb5bHpZvmw+WnlFjIsVm5H?=
 =?us-ascii?Q?nRny9cMWLu0cxSO5je2bCcIoSDw9zJYlmolVuRNJypCbISafZpKhPGrwn6kU?=
 =?us-ascii?Q?yjNqr8doVDebYc5GLStMgpp3f97QfSO6jLRmwauS35HLqpfXZFxq1DjV+3Py?=
 =?us-ascii?Q?mHCCCj1JGG/xiLVfNX+oCvZqYAFojL3cBjhJEWLtrz4kqjdh9+Z+YekEJjUU?=
 =?us-ascii?Q?my5G09/qAPWtJiFrkKvBetgmvkhcCiyyfeYy7xMqqNt85qEs+BhOjGfX/3ri?=
 =?us-ascii?Q?MwWGHGqDQcShAePmZyoFiQE5xlXbGwEnLdIx30P4G24Pd7Si5DKmp8lJxEuK?=
 =?us-ascii?Q?uiEQgncamveXNVV+Jbzut1ei+dLWPR6Xd8om7CKzPSa9qoIUE9B/6D2N8JMa?=
 =?us-ascii?Q?ZjnScZriy+slJQGaU8wrq4ASba+2/MIEF2KG79sAXJYFMFdIoRpJ18If/A6P?=
 =?us-ascii?Q?LUGcxlEpCqom36HcPiiu7XoEe/SRaa8llN/A2OlyVoiMuitoBd4cpRRICREP?=
 =?us-ascii?Q?iaRc8IvBUiH3XnFhTMpIiOp+qGc+Q8N2rAa0PGOqf7k0TQ9dYVLbYaEn7zHx?=
 =?us-ascii?Q?LR4DXwARUjy2h4Z7uQXwrRo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9a6c633-f53e-4780-5fbb-08ddca3476a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 22:01:23.3194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XY4nwSPxVf6jrOzKh88PzbwEemglcIWXUDvohZYqe7SXRPGgPRzx9bdV8Of41Sj2GcYpMfssrYYPNnvX0nlQQIKf8BqaCUOjYxHIkE2SS84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8073
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Gustav=
o Sousa
Sent: Wednesday, July 23, 2025 1:20 PM
To: intel-xe@lists.freedesktop.org
Cc: Sousa, Gustavo <gustavo.sousa@intel.com>
Subject: [PATCH 1/2] drm/xe: Probe for tile count during device info initia=
lization
>=20
> The function mmio_multi_tile_setup() does not look like the proper
> location for probing for the number of existing tiles in the hardware.
> It should not be that function's responsibility and such information
> should instead be already available when it gets called.
>=20
> The fact that we need to adjust gt_count is a symptom of that.
>=20
> Move probing of available tile count to a dedicated function named
> xe_info_probe_tile_count() and call it from xe_info_init(), which seems
> like a more appropriate place for that.
>=20
> With that move, we don't need and should not adjust gt_count anymore,
> because the function gets called before the original initialization of
> that field.

I'd maybe reword this sentence to say something like:

"""
With that move, we no longer need to adjust gt_count as a part of the
xe_info_probe_tile_count function, as that field will be initialized later
in xe_info_init anyway.
"""

But other than that:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 33 ---------------------------------
>  drivers/gpu/drm/xe/xe_pci.c  | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 32 insertions(+), 33 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index e4db8d58ea2d..ef6f3ea573a2 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -58,7 +58,6 @@ static void tiles_fini(void *arg)
>  static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio=
_size)
>  {
>  	struct xe_tile *tile;
> -	struct xe_gt *gt;
>  	u8 id;
> =20
>  	/*
> @@ -68,38 +67,6 @@ static void mmio_multi_tile_setup(struct xe_device *xe=
, size_t tile_mmio_size)
>  	if (xe->info.tile_count =3D=3D 1)
>  		return;
> =20
> -	/* Possibly override number of tile based on configuration register */
> -	if (!xe->info.skip_mtcfg) {
> -		struct xe_mmio *mmio =3D xe_root_tile_mmio(xe);
> -		u8 tile_count, gt_count;
> -		u32 mtcfg;
> -
> -		/*
> -		 * Although the per-tile mmio regs are not yet initialized, this
> -		 * is fine as it's going to the root tile's mmio, that's
> -		 * guaranteed to be initialized earlier in xe_mmio_probe_early()
> -		 */
> -		mtcfg =3D xe_mmio_read32(mmio, XEHP_MTCFG_ADDR);
> -		tile_count =3D REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
> -
> -		if (tile_count < xe->info.tile_count) {
> -			drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
> -				 xe->info.tile_count, tile_count);
> -			xe->info.tile_count =3D tile_count;
> -
> -			/*
> -			 * We've already setup gt_count according to the full
> -			 * tile count.  Re-calculate it to only include the GTs
> -			 * that belong to the remaining tile(s).
> -			 */
> -			gt_count =3D 0;
> -			for_each_gt(gt, xe, id)
> -				if (gt->info.id < tile_count * xe->info.max_gt_per_tile)
> -					gt_count++;
> -			xe->info.gt_count =3D gt_count;
> -		}
> -	}
> -
>  	for_each_remote_tile(tile, xe, id)
>  		xe_mmio_init(&tile->mmio, tile, xe->mmio.regs + id * tile_mmio_size, S=
Z_4M);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index f4ea13527945..4f5d4f0a8173 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -17,6 +17,7 @@
> =20
>  #include "display/xe_display.h"
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_regs.h"
>  #include "xe_device.h"
>  #include "xe_drv.h"
>  #include "xe_gt.h"
> @@ -603,6 +604,35 @@ static int xe_info_init_early(struct xe_device *xe,
>  	return 0;
>  }
> =20
> +/*
> + * Possibly override number of tile based on configuration register.
> + */
> +static void xe_info_probe_tile_count(struct xe_device *xe)
> +{
> +	struct xe_mmio *mmio;
> +	u8 tile_count;
> +	u32 mtcfg;
> +
> +	if (xe->info.skip_mtcfg)
> +		return;
> +
> +	mmio =3D xe_root_tile_mmio(xe);
> +
> +	/*
> +	 * Although the per-tile mmio regs are not yet initialized, this
> +	 * is fine as it's going to the root tile's mmio, that's
> +	 * guaranteed to be initialized earlier in xe_mmio_probe_early()
> +	 */
> +	mtcfg =3D xe_mmio_read32(mmio, XEHP_MTCFG_ADDR);
> +	tile_count =3D REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
> +
> +	if (tile_count < xe->info.tile_count) {
> +		drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
> +			 xe->info.tile_count, tile_count);
> +		xe->info.tile_count =3D tile_count;
> +	}
> +}
> +
>  /*
>   * Initialize device info content that does require knowledge about
>   * graphics / media IP version.
> @@ -677,6 +707,8 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.has_usm =3D graphics_desc->has_usm;
>  	xe->info.has_64bit_timestamp =3D graphics_desc->has_64bit_timestamp;
> =20
> +	xe_info_probe_tile_count(xe);
> +
>  	for_each_remote_tile(tile, xe, id) {
>  		int err;
> =20
>=20
> --=20
> 2.50.1
>=20
>=20
