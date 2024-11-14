Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A20D65C62
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 09:22:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F70610E7BF;
	Thu, 14 Nov 2024 09:22:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mVxM7BQW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E4810E7BF
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 09:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731576175; x=1763112175;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KGullXlqj3VdjEIQl9RInMBih1MqTUN4+HAPA99GsR4=;
 b=mVxM7BQWuS7dKv+/zXqBdB/A72lQWzBX6er1e4ln/RknMSdLpLE3ARvC
 vO4N/aRcaB7KAWCGfdEE13cXaJDHhIjbBlBV1VMUQwm5e0b+HSRE9jZDD
 GhUhCJfsgHwFJA/SC+B1N/m3cf0mLXilfrtYRIFztEDTdjDUXI83U+5/p
 kCgNIgq/tu8qDnRQ4RO2hLeJCTJlWwbCiN7ky74hwM5tpvS+qqrYQOfIL
 MLCEZpVLPt0VnILkBpUfe7JsfAcXjVmfr894BkGTcQ9sUdrdFRDVRJA04
 ueRqXApyZ9IYoZeevfksjrKuuxzMv1ydzPi5X49hKeoj14w6U5S+jY4SS g==;
X-CSE-ConnectionGUID: GiI7F1sqTieOuRpXgGWocQ==
X-CSE-MsgGUID: GuVdzmufQSuoMrKi+aXODQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="49022798"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="49022798"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 01:22:55 -0800
X-CSE-ConnectionGUID: 26MShHUXRrCR/POH01nhmw==
X-CSE-MsgGUID: iuP2n0JBRDWwGGb5/Ea9og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="87701768"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 01:22:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 01:22:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 01:22:53 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 01:22:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m08Z0EHKwzO+ZNZTjXNbMZQu2V8FnsRE1FCRbd7S37ZvL/pUxQao9Aqi1l1mD1g2TqqKnPGPvmN2mOS9+TCVfckSfI2jr+D7+wx9PhDOpj5DnGoybdH1FEn9IM46wbZVbpR2eJA4xd2SOnxpcUZoc/YNw8hF36Xp/leZ/u8AvVxpxpSsGioWvgIRYcBjTIF9L2zu/mHIBdFc93QuX0sPLExOlqATqJWhL2o8vPdCrCl+vSmYL3TcHlfJDf+mffObzgdv7R14q5hPwXlpQnCXGrZkxVEUIM3KX223J+6XN9JnLs7BSPTGJP6/xaASXelnLhBbJKOancYTBTPTDi6X+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BYkdM1/BP/EcrWBDBccfgMoXNJ+EXHQz1WcniY76po=;
 b=e4AGLBnGnJiAPzMke7qH4puJt8YeIUaak2jMzJPEAN2lK9gjyX4K8lwljpjPC6BV6+EahaqXVHaNftVDxeYwWjae6tzH7nL8zpZPJxa2YX1Ac1Nl1HbBVGfScRdQhSvuQB/1SonIzDclnKgSY3HtX+qyBmnPR8JeyiC9/EnuwraYMbRafsGhEDCXIeZAh+R4xYQeA3qd0L20HZXfft3sRThS/ai2atqcfKmz9plbgOhpwLquth6ZNJYAQAETh8+I4ezcGs4eJyXep0J5un+7y58qp1kK3NLK1MRdPbJbutSREfC4ujpZrah9ntj1ri3qSUCwRkU2t2GRfWmUe45Qag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5275.namprd11.prod.outlook.com (2603:10b6:408:134::24)
 by MN2PR11MB4743.namprd11.prod.outlook.com (2603:10b6:208:260::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 09:22:45 +0000
Received: from BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::d113:e69e:54bf:3fea]) by BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::d113:e69e:54bf:3fea%6]) with mapi id 15.20.8158.017; Thu, 14 Nov 2024
 09:22:45 +0000
From: "Mrozek, Michal" <michal.mrozek@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH V6] drm/xe/mmap: Add mmap support for PCI memory barrier
Thread-Topic: [PATCH V6] drm/xe/mmap: Add mmap support for PCI memory barrier
Thread-Index: AQHbJs1ZtW9MQfqNYk6L5cAyTlWevrK2lv4AgAAIrVA=
Date: Thu, 14 Nov 2024 09:22:45 +0000
Message-ID: <BN9PR11MB52755A0DFBBD6E4C4DE10974E75B2@BN9PR11MB5275.namprd11.prod.outlook.com>
References: <20241025110503.1014162-1-tejas.upadhyay@intel.com>
 <SJ1PR11MB6204271995164F13540EB694815B2@SJ1PR11MB6204.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6204271995164F13540EB694815B2@SJ1PR11MB6204.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5275:EE_|MN2PR11MB4743:EE_
x-ms-office365-filtering-correlation-id: 5c02d7ab-a0a6-46be-7570-08dd048de653
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Xd7hNPbmQuxPEZwu3cXftWD9NOLq710VGtSK5GzP7Q5Ct1nYjj4msmFvw58g?=
 =?us-ascii?Q?qJSHnYLqdcOYZkH4oVisTADNLHI0eQ99oqPwCgedYB4y0/+Iw3hIJnmRMzhX?=
 =?us-ascii?Q?hd+oRi8fFvnVyOZT8nb4w+MGqtluqn+puelafoyTCgbyC0adyAE86yFSvsS9?=
 =?us-ascii?Q?XEQjflCxmUUBiXY8gibxxmSDbpasvrQk+YzZGVI+gIGfjIN9VxtV464hga2s?=
 =?us-ascii?Q?D9KJ673JTmgbEj7o33aEG5oHgsPyZYv0ilAKb2Vy3JFnAPxP1rJL2qPIP3yY?=
 =?us-ascii?Q?794PatFGmFTcSjjShX1zKDBWDUCfMBeirpM+hybHA8UQYkMwU4975zxfFUW7?=
 =?us-ascii?Q?07UrXOKJk7mL4aDqPTcUaXf+21hu1wc0Kpx63Duk9P5dEQYhVZJW3LwHr3kG?=
 =?us-ascii?Q?BefIoVTczXUT0SqkqkxvxLkwp4RVSaFydi0agifLSvGG5pjF51O7dMuEtWZn?=
 =?us-ascii?Q?pRgApJpnln5r26q1PQ+GEsYZKlDFYgkX+neqZIz/wGDQgDFb5R1ZLHf+pMgM?=
 =?us-ascii?Q?qppjfzurMjfc2JyYpnTnRxB2v7MCAuIiDcGoEvs9cSlG9fgavXd9FKqoyJeV?=
 =?us-ascii?Q?upihGD+u9vewSUSAPXy/P5WuuD00UjT4ScD+sVdIDesl+7RxLk5DmYVpCz6t?=
 =?us-ascii?Q?Y1PV4GEAkEP0DrXI8C+GZH8exrY3e0BxtxdapJXPHVHsC8w9bVAWlk5lbg6k?=
 =?us-ascii?Q?wGMTo7FmCEbTa7Ua4S3XP5VPe9OxMIXpsj0v8qqK9tGMdX4/CJ8Vi8CsYphf?=
 =?us-ascii?Q?eEQiCx6pqtKKV6xvJlJ93KXEOHs2F+mzZpexQwg2aOR9RKT1owHapPZNTLZ5?=
 =?us-ascii?Q?s94qUNl7E2WsUedcHNQJetydszpYaR72LHVxQwxLC07GwqYS4VPv8GQ2mNof?=
 =?us-ascii?Q?ndWZc2WgxqFOnjFs2SM6f5YgyTyU8E+IY8xl+t0escqvwvrOunn57P2bSmnA?=
 =?us-ascii?Q?gHf2riRQaVzvuD8O+9H5lhkBdxJKAxyYXqAPkDV65X89p+yjQrW+RYPS7qRU?=
 =?us-ascii?Q?4SjD07tyh3Fej083QRUGNVUWFWrtwUxYHGWlUNK8JBwDhF3mk8+M6kglPh5W?=
 =?us-ascii?Q?+CGpAL/CCXKpkU7vlnQkjsfz3Zx6mlAz4BprTsvw9jaAtiqVGdHVVb4YAk7E?=
 =?us-ascii?Q?RAYfgGMbgShV/4iiOzc9bjCvuX+/fGXyPEo5OW8bErwoAd06acfNqC7VXfLq?=
 =?us-ascii?Q?xDViIZLR6vJG00V56QK7GAWvtqaTijbGM0fzjkMdi9tkanAcDZSrpjCWrKLO?=
 =?us-ascii?Q?L5kT85tLoBl6CkNL9Z64Fo+dzgmdrqxhxHMpGYdHgR9uFXZMl9q7OhxgI61s?=
 =?us-ascii?Q?H/Vm/UlAQddElCZ7AbqxzTGw?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5275.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?y+OC31BxfhsOL9+2UblI8tLadB6Kh0znbwMLWwFZG9bgetbi09MLftOvv4Cv?=
 =?us-ascii?Q?UFhG4pbn9g3uITpR4OLPnnaF2GccuuJfwEyAUeFZeazdlu2Gv7lKMRChSILc?=
 =?us-ascii?Q?M/L5S4woPCLs5BVAFL6mLQcnygxY3LtUzNsNoeeHQgT+lskCtOxJmuO7AhOW?=
 =?us-ascii?Q?8jAQ6mHO6HEKWIq3fDzu0+MtbKeSiEnkPp8OqZAoYk3ORqr2ZrSRPIOC6U4w?=
 =?us-ascii?Q?BZ5WGk+UEd5gz5Jo0GAhrC54kXGqzWmwPlEg6HR6G2Zc4gxo28XvzbHT8v39?=
 =?us-ascii?Q?MlVJRn03Pzg4BOC3EjS8zh/1AFgbAi0zFvPApK/fzpUCtn8ZqBAbyeJNYTnn?=
 =?us-ascii?Q?jGhdtvjUjk/cRAa/V8afzywSAz1DRGsN4U7BhYVoaA8JOBnX2P517Q9g1zly?=
 =?us-ascii?Q?qpSUyt8g4pniBmkHB/0f4JYM8x1bWVnJioNdhkoWRvTnpfA/ABzv+mvSpNt8?=
 =?us-ascii?Q?J+6nArSm5oDZaSpuqbubA9va7uVSKgGYOoNlpXwfRnB3ALnQA4gkP/z0PJ4P?=
 =?us-ascii?Q?tgvGjNXqHwJ6GJd1SzcLVggYGsKP3Zx0b43l4sgEH4cPLiYzWy143JQfbNOr?=
 =?us-ascii?Q?rCQ2xDzM1ePQpcFDER4q/Njv3E7xrjcASEKYPiGn0nRJ6na2T5zkXXPZ9rmK?=
 =?us-ascii?Q?gUeKUAQtmclHCWs70lVWVQWxexVzMPdv7pvCuwEGqZpduZce32EaXnrScRBC?=
 =?us-ascii?Q?kJdii38r4tQPJSQc+cjaZHH2hiHneoyh5ygOSevYhYc5PL3WgpXlWFg64TLO?=
 =?us-ascii?Q?+VCK/erxoFAfHlySU2/DpCYzdC2M4Ua0RXLjkDGkjVTAfdG+mnmWuV1iA5MY?=
 =?us-ascii?Q?aWduoQVN8ZKyK5QkJZy3wI+ACgtSmysbjgpnUiq3gdf3h6hGPpqoLASj762o?=
 =?us-ascii?Q?ZW/KsraaPuTYoKz+hWQ5C6gdDiopsbcdyZpnxbkF9pe+BJCPdxfMQB6CQ71D?=
 =?us-ascii?Q?MBK5N/iECRsytjmOrXgG3Rv1jvjuaUgYvti9FAFYzqj2bUqbZIjXzhFu2FJw?=
 =?us-ascii?Q?ujjP9Stkab9Bh2/8v/iVVUsaAUzXs6vOPn8VxrIVdW9qovDQfSXohXXGfHCy?=
 =?us-ascii?Q?lplRyt5oi44ghM8Olaoc6in/DcGkuGNIJbBoAYW4fn+cKz/JwG4HBOyEarTb?=
 =?us-ascii?Q?yfwZLKBsVH2mJrVQjTWpSaYJOTj+0K4NhgLPZzewvzXWDsphr874REEOMOqP?=
 =?us-ascii?Q?7znIxhqFY9gfkMXGx9Haxf9Nj1cOudXs0kwikJ0DVhZasDAUt6UAJdFSttVz?=
 =?us-ascii?Q?XglTHJTgfal4nHh4/Cz0tfsWevgeiTipNGdxACVMq/cBB0q7gXYOQoI2Xh2c?=
 =?us-ascii?Q?4andCibCew9r4OxyMdI6QyOP/0YqnoNGC7IJqZC3NTdGpLU7HQyn0ZGqkuGg?=
 =?us-ascii?Q?uWPVbAr6PdxDxU1xpKAyvdtBsVC+/+cPkKu/TyHSmf8n2ZecmmdvNzBoTuM4?=
 =?us-ascii?Q?feTXZusk96GypF/CdxjIB/WELcwYfwenZ5CeIrkGTajCRn3sPHSWD5JdA+fH?=
 =?us-ascii?Q?rDSR/WzI2QSKjU4SdsSW5LZyROhgaGBwnYVCXTnwsuozuVTlcMMBi9iKKkjk?=
 =?us-ascii?Q?wieGelurehPoPugYV+z0FvQwfz/YH8f7IUCX2erg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5275.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c02d7ab-a0a6-46be-7570-08dd048de653
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2024 09:22:45.7210 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H00IiDi7F28+9Pk5LG8u8Gdbo/nz/oud0nxpFk4FjwckoKUTZqNmJdEUoAlIMv845Y88ZRPjWxb4JZJA8GZRhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4743
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

> In order to avoid having userspace to use MI_MEM_FENCE, we are adding=20
> a mechanism for userspace to generate a PCI memory barrier with low=20
> overhead (avoiding IOCTL call as well as writing to VRAM will adds=20
> some overhead).
>=20
> This is implemented by memory-mapping a page as uncached that is=20
> backed by MMIO on the dGPU and thus allowing userspace to do memory=20
> write to the page without invoking an IOCTL.
> We are selecting the MMIO so that it is not accessible from the PCI=20
> bus so that the MMIO writes themselves are ignored, but the PCI memory=20
> barrier will still take action as the MMIO filtering will happen after th=
e memory barrier effect.
>=20
> When we detect special defined offset in mmap(), We are mapping 4K=20
> page which contains the last of page of doorbell MMIO range to=20
> userspace for same purpose.
>=20
> For user to query special offset we are adding special flag in=20
> mmap_offset ioctl which needs to be passed as follows, struct=20
> drm_xe_gem_mmap_offset mmo =3D {
>         .handle =3D 0, /* this must be 0 */
>         .flags =3D DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> };
> igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo); map =3D mmap(NULL,=20
> size, PROT_WRITE, MAP_SHARED, fd, mmo);
>=20
> Note: Test coverage for this is added by IGT
>       https://patchwork.freedesktop.org/series/140368/  here.
>       UMD implementing test, once PR is ready will attach with
>       this patch.
>=20
> V6(MAuld)
>   - Move physical mmap to fault handler
>   - Modify kernel-doc and attach UMD PR when ready
> V5(MAuld)
>   - Return invalid early in case of non 4K PAGE_SIZE
>   - Format kernel-doc and add note for 4K PAGE_SIZE HW limit
> V4(MAuld)
>   - Add kernel-doc for uapi change
>   - Restrict page size to 4K
> V3(MAuld)
>   - Remove offset defination from UAPI to be able to change later
>   - Edit commit message for special flag addition
> V2(MAuld)
>   - Add fault handler with dummy page to handle unplug device
>   - Add Build check for special offset to be below normal start page
>   - Test d3hot, mapping seems to be valid in d3hot as well
>   - Add more info to commit message
>=20
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Acked-by: Michal Mrozek <michal.mrozek@intel.com>

