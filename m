Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C43DC19776
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 07:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0433310E217;
	Fri, 28 Feb 2025 07:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oAdt7RFA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F258C10E2B5
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 07:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740726160; x=1772262160;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bjY3lYlkB7CVGPU2qg7jUsqb+qnNe+bL7RpsNVM/ekc=;
 b=oAdt7RFAjEQVAf5/YA2qF5HluN0naqtz5YeBUI8x6VnVg0ciTeYiDpWu
 7Gztp+UwBHDUlHq3/CG+GjkndAAEUj+vmQXFqY9po5AzdX6zesk5wDZSa
 1iQtLMs68xmv/GdcOECxGIa0oQgnL9fm20c+a060gHCPkSVujc5TY0qRQ
 sXezgS3wTK4Hm+fOYtuuH298Z9tv1SEqBC8wapJLnR9qIMNlwgYyAnxtd
 H9yj9/SPYCI08yFSxeZBSaWUoR7HYxka7MkfHvjABTZbYiCn+KNIxQhrf
 kwr6qwJ4DDkHfSmZSUi6qMvbRkERL/bwDyQmc5zQk92nl7kQT+3BcQ4rj Q==;
X-CSE-ConnectionGUID: P0ntf468TBiSxSCTrDBrLA==
X-CSE-MsgGUID: vN4iBrl2SMmmXFofzSrz6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41528941"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="41528941"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 23:01:25 -0800
X-CSE-ConnectionGUID: keYW3eHASDWZlNVCIlsCMw==
X-CSE-MsgGUID: hfJjPldMTO63wnL3sNl8Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118184558"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2025 23:01:25 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Feb 2025 23:01:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 23:01:24 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 23:01:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KIy27kDBtINwlk2liYcKQ1ymTtYacF/CPk/BzMUVd08EiRxotLPcDHEzK6PMl5VZd8JkKaICIE98YPTPpT1QJrWhDZZfHDXMFtcxEX6bIDecovClU/DgwqnfT17pER0EJ6nL+VZHxbTSgCabAo1zhEOgtUw1yVDUVK2BoyzIqu1pB8nwVZ13mxIzmo/xXg/1inpLGtKS14rK8p7ZuBLb35jo1Z57igiMdX6VkQDVpTZ7z4QE3I2vhXVxe5CGRPo6SlWopmW0GbXTK4hNm59we2noRB4OxdBT9XaFCAIpghHpFUcNIdA74bblPEvOH5v89cOKzihAbzDqE8rz/Vw04g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlEBHVo4bdm92e8LbFihi0f73SH+JY+f85hZ/WlbcXc=;
 b=A2WU6OCpsJOIZ10hBGvRnNj5Dbs+fYxTuSuN1Nid4iSpB8O3n4ez7JbQ2iuKtf8C+7s8VZ9C5gk6xh2vdueODkKkQ1qYe7To3OyO0x7+VFcGTcWMM4ZHJ67c/eHErS32R5yI4DAammMDsunrWuArmAzZsi/0qpDjS5qkD5/hcDfeykEkh9hLehORTN+1LswNvhRRmbbSfKxNf7YSDt4uGko9xzNX99OiJ03tfviPuITUCm9kf+Dm07rNL4kNSz4y8nocjpN3rxJjZz8J5+skXOUQ9V0jMFEi3L0v7f5JW6JXlaFK+JM0dEkPiA1Xdxw3LBWnmYP+o6hHpHHU6BRsCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CYYPR11MB8385.namprd11.prod.outlook.com (2603:10b6:930:c1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.21; Fri, 28 Feb
 2025 07:01:22 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8489.019; Fri, 28 Feb 2025
 07:01:22 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Bhatia, Aradhya" <aradhya.bhatia@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
CC: Intel XE List <intel-xe@lists.freedesktop.org>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, 
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH 1/2] drm/xe_migrate: Switch from drm to dev managed actions
Thread-Topic: [PATCH 1/2] drm/xe_migrate: Switch from drm to dev managed
 actions
Thread-Index: AQHbia1m7Du5L4JG7EW+H7fUP4S1krNcSJ+Q
Date: Fri, 28 Feb 2025 07:01:22 +0000
Message-ID: <SJ1PR11MB620451D2E97D8394CB27FC4081CC2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250228065224.320811-1-aradhya.bhatia@intel.com>
 <20250228065224.320811-2-aradhya.bhatia@intel.com>
In-Reply-To: <20250228065224.320811-2-aradhya.bhatia@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CYYPR11MB8385:EE_
x-ms-office365-filtering-correlation-id: ebce8492-cdfb-46dc-f3ed-08dd57c5b588
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?mTavv9SCA27GMaLzePMhUNQWFn4fIjkp81l8mlnB4E3gbbB4MdXAve/aNAz0?=
 =?us-ascii?Q?G4ajEYDHzDGKJGqpXDeM93eh1XzHp1zssHIPJgvZfLkpn9J8UqK3snS+UsO0?=
 =?us-ascii?Q?idaWvb9d4/HlEbQgqkj9r2cfePYpHeqyxaxjqu22U9Qe0qcfrkp6KB8bTNrv?=
 =?us-ascii?Q?1vNJczlpibKRQGxr/yFkBer5RN/7zLjSVKa7vJjKQaU5h6yb5n1s1ODDNc6d?=
 =?us-ascii?Q?SiZdrctay1jsJ5X6355SxtoDKBPNZcYt3Uu8t3bRPVvTMtbZNMS4Ea8z2cLU?=
 =?us-ascii?Q?GffBcAjDy3krCmlv3r/9dSIEEEvnOOofiwzc9RDXjhwmrvkZKvbMFyUNNJSz?=
 =?us-ascii?Q?NU1+ib9FrEwH3vcVigflIpfXgyq/U1AlngzUYlexBOF95Fvz9h5JJhN1r6dC?=
 =?us-ascii?Q?tLB/p1B2pc1kHbgnfnOYQLKkmYAVSzhZWZJGngYnfKtB6rXEGoym88PJnwSp?=
 =?us-ascii?Q?udNeA+0Lv3umq1oo0Wvd57w+ygTWMwv8ChIQL2OQkVx+M5GBoR4QG3lFuiso?=
 =?us-ascii?Q?MbSJ2ofSbjTetgsBidv2Oqwydo0X9MFuUg7Hs00u/zrRAhkb35w+pHFJM8Uz?=
 =?us-ascii?Q?Krb+Hnjdu4sE238qRc8yUuqDmAezIJFL0HKJAuAo7YHRCo4XTEhFEqxoGbjh?=
 =?us-ascii?Q?7tUQRY9euVQD8sa6Ois3oxzLf7dzzg8z8BqCpNRgHdiRAZTROfM+EJlb1EjN?=
 =?us-ascii?Q?/4ML3px6FurpnYb/+rvPpZhoMOQmgZgnlAdAK8/HocJoGWu9fPIIb3DkHddL?=
 =?us-ascii?Q?YCOUd4LJTHW9bmLax+/G78cVoigU86YDfb57WmOpinAcl5ybnsYSS3vSgzVJ?=
 =?us-ascii?Q?hb7v8S7xQVHRJmk7kMbofxQ8wvtTCvXAAHgmyHAogZa/7RMps6lmCmjZ9+A6?=
 =?us-ascii?Q?UytbyafWilviOnlGaSkhAtv17FTh7e/yIjehFXPI5pzdPogh7juhMjh/PSxY?=
 =?us-ascii?Q?hDav/J3rYjSOfM51ln6QM26Bzf8XJSwnuGLIkWKSxSydceXpM0iYDiLZsk7d?=
 =?us-ascii?Q?17sGPmzrW5M3i1MC+VI8Ta/Lj5JxxJKugabeSyYEQuiA2VqWNzsGQ1m1dCed?=
 =?us-ascii?Q?kb9svfgpK3wmouM/5OP1vJo3uzTjAeoAPT0C0jEqNv71pY0sey6LbzexOGE5?=
 =?us-ascii?Q?bTTvnRlzrGX3rroUjFbJaUcQEQ7UkZo00X/Kcwx14mhWB8fLPZcR5/yO5jGK?=
 =?us-ascii?Q?VCZvwEzpzCUuK8Ru8neAKRxtX3A1kz83nICP83o4DPPtY8YGg6uWO++cpnJ3?=
 =?us-ascii?Q?dhOTtyjmdnKrTgKTtkj9/1Z4k7ZCFH7aqFBiYe0mJEcu6x2yYTndkfz1jDPz?=
 =?us-ascii?Q?vIKQgc+0vTo70VtKkEePI4rtpYmR2qiY+Ya6bBjMYtVy3yWthNl7oXi4cYBg?=
 =?us-ascii?Q?vHIfOEuRK7D8VcKJ+i7h+HZQBV+8lwdEjPUZ2M2mxjicIbdmLGz/k6qQOIZr?=
 =?us-ascii?Q?GvtINyT7VEEHHHxfmoa3L72zVFB0CCQD?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6l/ibxPAWFstgBKDhApSTJEaAxAF4rwfC27P+23bldwgCLm36zFcwSbrCO4i?=
 =?us-ascii?Q?M/Pia2h1Bc2cIfw8iyDRdZSeXN8Rm+2WFrocTu/sXocb0CpriP27Z9GP9rC8?=
 =?us-ascii?Q?p7zkwhmtZI3wRZaFHRCzbd9mAAv2G0E5tRQG8t5n1HGcCVk43ZydmkiLEa+L?=
 =?us-ascii?Q?cEaY7GWtunlxzt/wEQaDndPtbhg3DhBPQjQyaryeTLrty4Ym8rMukzWU+fa0?=
 =?us-ascii?Q?rzvosjPpMFzLbbSnvBZEikmWkeAeVUVzaR8z6ERdq+4MvS8LXhOAeUzzEVTQ?=
 =?us-ascii?Q?njlyIDWwkE0G7r785oXe+5+2PF1TQPZve0aRtGGWqfyBnshu5imDoPU+xBUS?=
 =?us-ascii?Q?/nfeD66DknFHC1umQ64jRYEoatYirr68poIcRFj9t1uwCC5BXHsYK1207PyO?=
 =?us-ascii?Q?gtzSikskhC6W/sG7JHoJUmVoEVWkn1PUc7PkwD6FNxEVLbnWwiD42YJqqzsf?=
 =?us-ascii?Q?JErixXnas/bGLc/t2SOu9pAsl91BAPiUkJmVP+uR2VwXaYsqW5LXbf3BzGRm?=
 =?us-ascii?Q?B7B5zR3HnuKNC52wTS7koMEP8Emgah4aVNnS+XfeNH3urL5TrMCjlAuZdbxd?=
 =?us-ascii?Q?BXuuvUWgWifFFW3uSzwAnFa6lSfwmr+CluRndMKVzwAPDRMIjeI/yf++kPZO?=
 =?us-ascii?Q?HxGMz/9jcSzJT9PlmSy4zPEKKmwEt7eIX8lCEHuJ0wPjSTO7+xLvRkxa0Rfr?=
 =?us-ascii?Q?dq1yaO2i+pIXfeBkxESIdjFkTKhUE/0uvdveWwE2Qe9BJhdXp4NJVTSu3aqS?=
 =?us-ascii?Q?VapLduKg083tdbgpys8jvV85u6RZOLdcNtrx2Rp0CDuIZiAOz5CAWNeW0I6s?=
 =?us-ascii?Q?2Mh1i5TJgb3EtRHE4jsRL3y1JQDdVF+IaC9ZQ6hxa7PpyLtK/7xKbxL1+qr/?=
 =?us-ascii?Q?y0RXqVv+by9KGIMd+YVLnmqWboN/jyCxIP2HLw2B3KrFeWo3u6wO0p8EcvTg?=
 =?us-ascii?Q?I/DjW+USItFJFeDriV7Inc2uYXYG4f8+LQNYlB5m/W+MolD6+T9Mb7xs8K8D?=
 =?us-ascii?Q?GwAegPizqACsqM6fwuxkm/XZVot2ieQxjHSVRzf0U0RyLS+R19NRyvbuDN7w?=
 =?us-ascii?Q?cSolPW/JTr6JMtaz6Mz1oAEFj/fk8KAIfqfjBAU3pbPP5qYmiQIYD71UkDV5?=
 =?us-ascii?Q?ejRfsYqKiAkyyWC0VJ4qnL5JUEN+eHoNJSePeoJn6sfixPjZhSnzeoofqleR?=
 =?us-ascii?Q?SXZTmYc2riGapvgZnBOMbqmn9VvxUZ0oFPdUEZmabpqLqio9F0Waff0h1nb3?=
 =?us-ascii?Q?wHEPMu94JOJZTelB68Os0303dp+hDm7xAnv05zcv4pfw67Hpj0LlKuk1A1Ri?=
 =?us-ascii?Q?kYfNN/TT7cogYBrbZ+XD8+VDXQXq+0xwqQuybwkPNiDGHnoHKMrqqxwPxhK2?=
 =?us-ascii?Q?hwrc5sirCsLiZMvJNjjki0FQz/HLibbHr1KcXo8h04ctrZwxSt9KzrqUhpsJ?=
 =?us-ascii?Q?AWx25Ur/4zG0aEVoXILU86jnOCs2QOpPXdmbkjVaE+KuH75jWRGhd7zorbb0?=
 =?us-ascii?Q?1k9iQqOq/4UL3ihuIHte9oerL9BoHiDFfO9g6lha8SPAhbhn/pBVXcZ7m17p?=
 =?us-ascii?Q?X2pAh911ka7SOkyS5Oy5V/w0wxZzfnxxk0mI2EEE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebce8492-cdfb-46dc-f3ed-08dd57c5b588
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 07:01:22.2232 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0SgHNrCdTB6hYNGJWYKTKh7YwEAsCvga5l07t+buRRpSch5eQJzUTQfy++mM48eC/A9Ejwjw40jEsKBLmuDnACsRJETXFTxAtwhJeY5vV0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8385
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
> From: Bhatia, Aradhya <aradhya.bhatia@intel.com>
> Sent: Friday, February 28, 2025 12:22 PM
> To: Roper, Matthew D <matthew.d.roper@intel.com>
> Cc: Intel XE List <intel-xe@lists.freedesktop.org>; De Marchi, Lucas
> <lucas.demarchi@intel.com>; Hellstrom, Thomas
> <thomas.hellstrom@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Bhatia, Aradhya
> <aradhya.bhatia@intel.com>
> Subject: [PATCH 1/2] drm/xe_migrate: Switch from drm to dev managed
> actions
>=20
> Change the scope of the migrate subsystem to be dev managed instead of
> drm managed.
>=20
> The parent pci struct &device, that the xe struct &drm_device is a part o=
f, gets
> removed when a hot unplug is triggered, which causes the underlying iommu
> group to get destroyed as well.
>=20
> The migrate subsystem, which handles the lifetime of the page-table tree
> (pt) BO, doesn't get a chance to keep the BO back during the hot unplug, =
as all
> the references to DRM haven't been put back.
> When all the references to DRM are indeed put back later, the migrate
> subsystem tries to put back the pt BO. Since the underlying iommu group h=
as
> been already destroyed, a kernel NULL ptr dereference takes place while
> attempting to keep back the pt BO.

Might be good to put short main crash dump as well here for issue clarifica=
tion.

>=20
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> b/drivers/gpu/drm/xe/xe_migrate.c index 278bc96cf593..4e23adfa208a
> 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -97,7 +97,7 @@ struct xe_exec_queue
> *xe_tile_migrate_exec_queue(struct xe_tile *tile)
>  	return tile->migrate->q;
>  }
>=20
> -static void xe_migrate_fini(struct drm_device *dev, void *arg)
> +static void xe_migrate_fini(void *arg)
>  {
>  	struct xe_migrate *m =3D arg;
>=20
> @@ -401,7 +401,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *ti=
le)
>  	struct xe_vm *vm;
>  	int err;
>=20
> -	m =3D drmm_kzalloc(&xe->drm, sizeof(*m), GFP_KERNEL);
> +	m =3D devm_kzalloc(xe->drm.dev, sizeof(*m), GFP_KERNEL);
>  	if (!m)
>  		return ERR_PTR(-ENOMEM);
>=20
> @@ -455,7 +455,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *ti=
le)
>  	might_lock(&m->job_mutex);
>  	fs_reclaim_release(GFP_KERNEL);
>=20
> -	err =3D drmm_add_action_or_reset(&xe->drm, xe_migrate_fini, m);
> +	err =3D devm_add_action_or_reset(xe->drm.dev, xe_migrate_fini, m);
>  	if (err)
>  		return ERR_PTR(err);

Apart from above nit,
LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>=20
> --
> 2.45.2

