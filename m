Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C879C021A9
	for <intel-xe@archiver.kernel.org>; Mon, 17 Feb 2025 12:43:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651BA10E08E;
	Mon, 17 Feb 2025 12:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aWddozKB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C104710E08E
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Feb 2025 12:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739796213; x=1771332213;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r8Rq1PQdma4vIniOa9ajUHMtLic/0MnVQONxMerR8hY=;
 b=aWddozKB5ihyQOIP+ky1yI4PwSFHASWvnRRq1pt1NKLeH2LfST1Hz74+
 xnu8c9S5mwaLMEigTPrikBU/hsvbZ2m1/UmZIGcFygdxLFw6HiJ23ay3H
 NnpZvmIH65TLtQesKghZG/DuGqGU+/6oDsdDwu5oxoSNMvU4ffZTH+fzQ
 gEn47KOOY0xXaQBfApu3jWnAU0DAD5dNnQsySJ4r3Zw8QmjQbHoLKEgEt
 F7SzUvBYdQVOsd/bKx3qxWdW4nLgJOhbr68uS7F9h+05TBGopKBVXNXqP
 gCeigmZbe2shCR8I5tfReDNpGhtggTVNS19KoN5lVcY16JeSloIyMUgag A==;
X-CSE-ConnectionGUID: kM0QgAsWQs+g484PEceZ3A==
X-CSE-MsgGUID: bDqWbFV6QNOl/N8Up1Flqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44404520"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="44404520"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 04:43:32 -0800
X-CSE-ConnectionGUID: dkGtJPBHRFaklve/rAFk+A==
X-CSE-MsgGUID: lcsnfpcuQpCAcnmpELwCnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="113853762"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Feb 2025 04:43:32 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 17 Feb 2025 04:43:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Feb 2025 04:43:31 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Feb 2025 04:43:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqOWipNhSRqDxiOQCo6JAfNhzwoNn/dNybYgI0ab5ohnwgGOF7QEDQIxoflzgF5hC/ecOC/t3Yq7JUwJFUBkAVlesla7o8F1Ns3bpix3H0belFwsGqH65Jc/mNOoQP30N3Ishgb7inapfSt/vbXeNquZ4n7T8JgFi7aOsNOMW8E7mk5tmXK1Ckx7A3f+uEmq/7liDDqRf8KA6AYGiq/UDlm7Rpjxru/FEOGwQ6CCKmV3V2HFcjIh4SEKfF6O3bzNQq43atii/4zICx2zsZ9yROH82VKZveKRWeFbYOwqiHYCb7s+88QL35YuhfOeBVakvmYRdQtN6FJd5lcSSy18PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fDi11GPaZA+x0dapv1LvMyT2FTbG8ZLzppjnZ321TE=;
 b=l8kGwRHUefKA7xsWFQf5LdujbxWFiA5PF4S+zDAevvRP80DqscRfSJd7z81oE/a3maolciTSkUmTAK8xwLCxG/lIjI91K6ChwOQxtpOBKjk8Pppn46eqFgKXOoNJQ91CyHrySbMbUekVC2bMNJAqN5NZe46gjhnd+34SugLZTt9jxKWu2AU66gbLhQRaC07zxf727ecPwyxJpvVGuzNWg1ORLUcrvIrhbbgv7Lo78iHj8J22EwLs8ATZZM5jPGObMdcAgGMp/szFSjTICCCDW9UyAZi87SMo055z2h1WDDcQf9pnvBCa3XpbTwQv8ysKqKGPpGen1CfEc/K6O25JCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by MN6PR11MB8242.namprd11.prod.outlook.com (2603:10b6:208:474::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.14; Mon, 17 Feb
 2025 12:43:01 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 12:43:01 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH 9/9] drm/xe: Stop ignoring errors from
 xe_ttm_sys_mgr_init()
Thread-Topic: [PATCH 9/9] drm/xe: Stop ignoring errors from
 xe_ttm_sys_mgr_init()
Thread-Index: AQHbfybP3uIlp5bqLk+5XoQ4hTdtM7NLdEoQ
Date: Mon, 17 Feb 2025 12:43:01 +0000
Message-ID: <SJ1PR11MB620425432D0FC2AC29B0EE3981FB2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250214212313.1767562-1-lucas.demarchi@intel.com>
 <20250214212313.1767562-10-lucas.demarchi@intel.com>
In-Reply-To: <20250214212313.1767562-10-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|MN6PR11MB8242:EE_
x-ms-office365-filtering-correlation-id: 6fa440e8-b6de-4810-2fbe-08dd4f509d58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?4WGIV73/+XFB64r+EohTrzfQ8WEe2R/pyw4EUrIcaDrcojy60k53Dw9dEKbs?=
 =?us-ascii?Q?RklX7F6VR92QoIWGvw2N7C4+dngE3s8RWWbMMT3EvtYlLWgQn8VRUWqa9qE7?=
 =?us-ascii?Q?ym1hdUYhHYthS92cIccqX2eCk2ZgHzh6n0+OZ9X7gcykJJrMJrOamy8gr/2q?=
 =?us-ascii?Q?TSEjkBnLhgaUKMEmD5Xhz4gHTFZSd18VaPEjZ28Q4jC6adkdCXTghprW08E8?=
 =?us-ascii?Q?KSrftZTIPTwiytUZVi5RDdf3BEGciV/Mhgq0i5QTqzxNVZ72dFo5kssXJJWY?=
 =?us-ascii?Q?qCmo3yORhScZ5cTE7kgzcjk5rSbdlQolHPCul7hhXQNjT1AXdSOttbMwdo1x?=
 =?us-ascii?Q?vyrvVNXJGhfGxMnAOclw5BlCn2i8mHKyl2BkeTkvo7T5UwWed+6eNQlkKnDn?=
 =?us-ascii?Q?LmmUaCaeQ35Fl3FFoT+w0zI98Jn4YBPyD1+Bb59iuIpuB7aToZubMwpQy9C8?=
 =?us-ascii?Q?UcolEGahGV74QgCYkv4sVFzf5Xu3bP1S4p69CZTPgYBzB4FruY5PdrN63Wxp?=
 =?us-ascii?Q?C2AIDCek55WKUiEe2nnq+rdvK5oXuDPNxI9MaIrq08T3EW0nghVcEH0ZxaqZ?=
 =?us-ascii?Q?ShMYqVlFBHfhiQEOXFPftMuW6wbxJ9JPAl8OG6+XMA+kX3fJbL9PlthjNuc4?=
 =?us-ascii?Q?5H0lGyd/597LQGlka/R2/ynTidoE+lPdfW9hGiMp0cSdmmsRY1b0EDO6wEIe?=
 =?us-ascii?Q?3sdKw9uhA2rQ0aFVbXmqICsETQZwbCq7Gm2Jf8BddgXoGT16Nsnb4HpBxcvq?=
 =?us-ascii?Q?m4/+1R+6EGRbdYd+sIpfyGhzcqaTCZh9bipIXovNa6RhW+6MpZAMBjT0eHvz?=
 =?us-ascii?Q?nTspZGAAyBeobYeYCbkFAgJXUnAyrkCGJuuCPXe3o2rYh8Dyh6AwnSig+7SR?=
 =?us-ascii?Q?BqQuCnVIt86Y3jEVJGGXQM8uy/n3Hv3HlHP92cqSEbpXLvb3Z66hfJvkGcN6?=
 =?us-ascii?Q?AENVSkSqCP8Oua46+hpGzUabveetQYwVyc3/79iQ1BUpCxqd14tIWN9JMfXo?=
 =?us-ascii?Q?OQ60m19XIkQ6pu9GZRI3jtcqmV1xDRODMm3AFzJHMBhMQCV971TyzZu2XDHA?=
 =?us-ascii?Q?SObkBl1bM7JsfhT57MyHVcA3z3dkX6WZH1wqpC6cpVKW0I8mssUAeVEL7dYs?=
 =?us-ascii?Q?4ybAyZ9nkCQNhv0srtfEt5ugrZFp/fdtZOLGbY8IXdtE+Vsgv2dCdqw/3bDL?=
 =?us-ascii?Q?kjdlV/gmH8uZ4o5yUwVUNtQxw9TOKcCAPpo26M9jTs6g6W/G6/i6kdvC+hxv?=
 =?us-ascii?Q?cEMmlxsoiLvB7R3mcsQKfyonNPhBRHBB0kjziEufCPoHUzGD4hUyDD5JLwLC?=
 =?us-ascii?Q?C3zInK7lzwLNUNuy6fIQExjxsq/IT52PLltSwWjwF8SWxRQ9EoHfVnP9/Wwq?=
 =?us-ascii?Q?AL4SfalyrLACVXzJyKZ4JYqmWqS630hcgRJoZt7hDXLxYib/Li6a3eikxUam?=
 =?us-ascii?Q?HtvJfTaBsFIbndquf4U71Qa0YEoY8xXq?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jKDmA98yRcvB3QAAViozqJkUnD5mXhiEBtFdZJP5ZfspXvouVYS24se+K/Wy?=
 =?us-ascii?Q?RKrBdHxTpwxStTh9G9GcWZ8igZnpt3a+fEDrzwp396s/eq36if6BWacRlD8B?=
 =?us-ascii?Q?m23qa8F8T1exHdJgfTU3MDbPCV97EWlucuxNnd1n9pk8jKy+cmnBNC1B7ceJ?=
 =?us-ascii?Q?D/+jR22YeJyGgkQ6UmX5KqU6qxmyc5+DdyBfrXSouRcX5RrLnyD8FNRAccy1?=
 =?us-ascii?Q?cEBJF/pFK23YJpPU5wPFkEjMZUayAOZhwFk2XA6tvkbD2tgFhhQwkMSrA8/P?=
 =?us-ascii?Q?2mbo6Ol9vT3WS5p0hu5Woig4FY/sWVON481ufVYAAFLrU1a+fS5EPE7vA+8o?=
 =?us-ascii?Q?mkyvIZaR5S7yh2I8FKXbfziwQacEMw3UujX0gI2AIuZjJb/dEriVpG5IQD+F?=
 =?us-ascii?Q?rVQMb9E6NHH6MV0njT8j0Oxshd9CVn6JFtdO4AGc2Kz7F+nOyrWdxsluADnI?=
 =?us-ascii?Q?OCmo5dWhvvye8gpwx1TinTGFU6lawZ8xj7ob8XPQbI35kaZ+odDfzpTLn8il?=
 =?us-ascii?Q?aRZAJebIBpK5Jw+tJS+Y3i/xV0jq/+O34qA+VOwWdRNPdidT1nRKDLipt9Vh?=
 =?us-ascii?Q?UMje2ZNNomZpZFuy5XTBfPED9nwqEOjEwDxLiO48IBjpDz9AIhxY9ZMKjgGU?=
 =?us-ascii?Q?P72c6F5D0HBHsmwaVkewom0m7xuCV7KQNkjOiqdIBMPulzfuv0DAWzMMLOU9?=
 =?us-ascii?Q?BaTBeXURmbRp9MQPse0ixlxO5nTzljGm7bW1v9f5OFOig3XkuDgvO6AdcsOr?=
 =?us-ascii?Q?eU0fn1F9wYeC3yhOiL1IrGdYgc2bSgSpWsZxCJDgJ1gMq+ZY4siKb0XMNOH1?=
 =?us-ascii?Q?FVhe/mJGhzgREkOXR2iQ1uHRbXaXTMTrKArBeftioN/LR33ZfeAnNHhAyYNO?=
 =?us-ascii?Q?CJ9ZbgDZAuI4Bub4J08xu5fZ0dvSeAww7p7Wwo9wklBUZd6DIoA+Oozwm4rD?=
 =?us-ascii?Q?rjmKwbLyEOrssCmc4a9ubFXZxXHfWRpqlpsvXV+2mAunXj5iBx7QLHosDOvt?=
 =?us-ascii?Q?00Y3MSqgyQmiBayJQZ5CrKaz/dWALFDNXxAIEPsIrJvfk+nvRgxKf7Vt9zVm?=
 =?us-ascii?Q?efvoSvPBc/abgDJIvvFh5Gk2NGwBowWlFfSG/ldf8KlnNfM1TuOx6FjG3y9+?=
 =?us-ascii?Q?+GaQRoql6z/lsaVnTvAH+wju7mtFGDA/Wm2Q0we4kp8/kefMAwL6D+cEkCcn?=
 =?us-ascii?Q?PFT7yr1MX6gb1vAyOPJW7NRF38X2UxFv+O7drvzz2TmuO/giEb+UaKyib5yh?=
 =?us-ascii?Q?3OTm9NsXkD73MM2uH1YjxAyT1zv93xQxvkPsh5TJu0d9KyktZTesF9yCx5oe?=
 =?us-ascii?Q?4C357JFAQonZAAZ1e1XWvH8nB1DLlXyoPmJJLT5AJRzDA1/jI3f6PUmmt/FR?=
 =?us-ascii?Q?iod+kmHKOFxrQx2ZEzGi7fQVCAFut6kpTtMTdnSSlXMisWrytcdUfFNvwr1R?=
 =?us-ascii?Q?9GaxmzlUX/GEje4w2fmBtOp05tXVTM+2yQQkyZnd17bNLaSSsgwYC3GBq678?=
 =?us-ascii?Q?KFiYqYq8i3TUDoL7HNVCa3qd9XIPp54R4KoOVKWm6pEPIen5V0N3zky4NLdm?=
 =?us-ascii?Q?AaVIEBNFDK6Od03Ba7Ls4seWsE4oGgPMyogPsxDs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa440e8-b6de-4810-2fbe-08dd4f509d58
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 12:43:01.1664 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5BSmkmdoPMKsLmB4bkWgJSpph7qnG/lEyykQRl1b5/tBJy73VgPD6IWGgrGmae2vD25nJfojexTqmFPHojpsmK8PLAZlw/ycM/PwSmwSezY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8242
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Luca=
s
> De Marchi
> Sent: Saturday, February 15, 2025 2:53 AM
> To: intel-xe@lists.freedesktop.org
> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>
> Subject: [PATCH 9/9] drm/xe: Stop ignoring errors from xe_ttm_sys_mgr_ini=
t()
>=20
> xe_ttm_sys_mgr_init() already cleans up after itself, just return error i=
f that
> failed.
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 3255c36700f60..8b13b22b62bd6 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -748,6 +748,7 @@ int xe_device_probe(struct xe_device *xe)
>  		return err;
>=20
>  	xe->info.mem_region_mask =3D 1;
> +
>  	err =3D xe_set_dma_info(xe);
>  	if (err)
>  		return err;
> @@ -756,7 +757,9 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>=20
> -	xe_ttm_sys_mgr_init(xe);
> +	err =3D xe_ttm_sys_mgr_init(xe);
> +	if (err)
> +		return err;

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>=20
>  	for_each_gt(gt, xe, id) {
>  		err =3D xe_gt_init_early(gt);
> --
> 2.48.1

