Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAC7CAC59A
	for <intel-xe@archiver.kernel.org>; Fri, 19 Sep 2025 07:02:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A040710E93B;
	Fri, 19 Sep 2025 07:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mJHt/NRN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 214F210E93B
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Sep 2025 07:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758265330; x=1789801330;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GrrIUqLjD60cKeEaz5DCm3Qx0zWqgdLrvHEJJPECP1E=;
 b=mJHt/NRNS1W64+CaxPsdfxtLS6bkaf+PkGFMbtu4xmxpcuIIqD0qFs9k
 EPDOBtJBXAxlulsVexWS7z1Kli+J2iC7+dqDrEYC/vTcRd0kxv9zJwBX8
 IvStJSAh3bpljaHnMKko56b9sqzshWy1+x6PFYyYMISREKWcaRL1H1AgN
 CTrkf1Vz7AFgYqKIadWY/+jaBvnoEdWvitcQLTSFALVV00NgO0J41yI0o
 ZCCqU8Sf74I2X2TFcdpkHNPniOsS3CEA7/9InojwawFwnY3nLNbXOuQ6k
 b0M3IpLn/Ecdi2Dy1aMIBR202A9YeevEcB6zkAUYC6tigCpBjqMy16JE2 A==;
X-CSE-ConnectionGUID: oZvOK3BiTW6+Xr8DyU+PlQ==
X-CSE-MsgGUID: o7C2meZaRdyuoprV2WpnGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60495703"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="60495703"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 00:02:09 -0700
X-CSE-ConnectionGUID: o1sha1HUSuObTqQpQSKwGQ==
X-CSE-MsgGUID: 4Hj0ypCmQpOrds5XGIdTsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="180180537"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 00:02:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 00:00:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 19 Sep 2025 00:00:24 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 00:00:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JNBFQNpsXwztV+sROS/VyBdJkaN00LwV9pYIpE0aokkSJTtlhRZUvVOIsEVsXswB/7rvLyGTF5Mw8VpNtLhqH+T1FmJpCccTXWNsQFkQsYyAXeVvY/6+9c+zgo51CJODIHixIa1EqgoNgvnPNoOexODxSIX9BuHbqEAXGYswMKDUpMF076rXt0EFcGXN91tzY9f3wAFieyrFO3VuqEsNAcABxfEiT6x3ytBLIGcFtQ+LEweF7IDBDl/Ysu/SyCp3cWIr+XcxFwPPVJs+cwOQD4iiR2SXX+sVP9g146RG7aFQhSj9JmS2r0yQiNs5Amqr6heYljDlXBg7B4OsZnwlvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PomF7Ci8zy86yt8tmJD+GnopPSwaWdaMcUGTewrscE8=;
 b=JCaSPR9sM478+Mkeuk0SjH3jaDiuGP9OY5r6nhrnBlbXR8sS1ktGySQ8v5Jh7SsLRo8+snW5vjq7VsQAf2tMV59wHfjY+Q6Zmy4GVJyjrDfz28OswosvQkO/JvQ8LoO24zhRnLQDZqGLoss7ysXeLFqya/xaSCVKL3opG/8UiLHWgXVgB72mpqUOJ5UcVVJo4zGGf+tacY+OlPmjN118tEeGObC8ekLcaORiAC4NGaIW4yQGYuf9XNbI1Zm8ymv/+KxJtUMaRteh+Ij1nKJhTD63aNqeG3DadQatPo2jARRuhgt50Xt6JR3LqBpfWr3vx20yTQGZ+5VJ0kdFMAYzwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by DM3PPF5EA507B64.namprd11.prod.outlook.com (2603:10b6:f:fc00::f25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 07:00:21 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%7]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 07:00:21 +0000
Date: Fri, 19 Sep 2025 12:30:14 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/xe: Fix build with CONFIG_MODULES=n
Message-ID: <aMz_fi-OYDbyWwwV@bvivekan-mob1>
References: <20250912-fix-nomodule-build-v1-1-d11b70a92516@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250912-fix-nomodule-build-v1-1-d11b70a92516@intel.com>
X-ClientProxiedBy: MA5P287CA0034.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::11) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|DM3PPF5EA507B64:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e49ef38-c6af-41d6-9db2-08ddf74a332d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3kyc1M4UDc4eTFFMVN3R3MrbHRSYVVCamp3Y09aYUtJSU1CK0dWZ2xjaHl0?=
 =?utf-8?B?Z3RTQUxIUFY0bVJuaHdlaGoyK2NWUDVRVy9BdmswWGtDVytrRWJQcVVhYUdC?=
 =?utf-8?B?R0s1WkJLMFFtbTVjOUJsSFd5MmxUWitqblpVUDB0b3pieDVUOHpzNWZkWmYz?=
 =?utf-8?B?K08ybXF5bGFPTC9IWHNxM0YwM0NUaDJLc2ZBL1k0cVY4RWRZeVdjclJJT1hL?=
 =?utf-8?B?Yk1mL1JiQUlkcHVZMkNhMTlWT3J0UjBZcXhKRndZa1FHKzFqOVBMa1lGMVFy?=
 =?utf-8?B?aHZxdk9NcStzV1VPSXoxV3lBcXVHdzNVdnk2bkszWDR0S3lsdVVnajJWVHcr?=
 =?utf-8?B?ZE4zcWgzZW9nb25kaDN4a04xaXk3eUlGdGgzWTdnb3dMbW5UYkFwOXRwMm9j?=
 =?utf-8?B?Skx0Mm52bzhHQWNFVjY2T2Y0SzVRUm9JRGJENXY1aEJIcGZJb1FDSkRsemwv?=
 =?utf-8?B?emFuVTNSa0t3YWR6RVM1b3QrVFY4elVjQi9pSkFsRHdPK2gxdTRDbWNYbkhZ?=
 =?utf-8?B?dllyRTdVbmZoWGRodHU3TDExb3N3NjJJMnlTTFQxZS95TEptM0VwN0pKSCs0?=
 =?utf-8?B?MWgwMXVWZmZ1T2ZucGMzS0VVUngvT1lzV3hxQnZqZCtkM253Z3RZbDByM0h6?=
 =?utf-8?B?Nnh4QXpZbkVIejRPVFZjajZ6MXFCRDFyZ2EvcFQzMDRtZmRZaXIxR0o3YWNL?=
 =?utf-8?B?bnRDby9uNHZPa1EwM2tLa1JGbzMrVVpWNFJWYXgrVU8rVzg1cXowa1NuTkwz?=
 =?utf-8?B?SHJYQzcrLzl3akZwdnd4dUtQTllpMW43RjluQlNLN3NITzFkL2c4YXNkTTlY?=
 =?utf-8?B?c2diNE1uS3JranQrSUJZYlBFWGlRVkUvbWhHZ09JdGN2aTFDKyt2emVBMVFJ?=
 =?utf-8?B?L0p6dmp0dmhiUG4yTHQ4ZzA1SWxvcDZ3WkM4a2hHUHdlZnIvdnJHdU1OQlNq?=
 =?utf-8?B?WmluYU1qSTRjNzFCdytLdXpxQ0p3NTl0dkx4OTdQN3JQVmVnbUZ5TExxYWln?=
 =?utf-8?B?clZoUjM0RFlqZnV5aU05OENHSm9vUHhZNmJYR1RsY1Zwb0xwc1ZtSkxSZ2wv?=
 =?utf-8?B?ZlZlV0hLblJMUHpvYnF5cFFUWG1XZktPd2Z1VEkrY1NUbFpkRVRSQzRuelJL?=
 =?utf-8?B?SWw4Qld3bEh0TjZPTjlsYnZCblM3RlVRVjdBRXJWL2gwdWxtNHdoSXNJWHlh?=
 =?utf-8?B?MGt0T3d5Zkk2cFBkdU94cytGTmtwYmRCN2Z6UFFFaHI3ZCtrYlhWT0piRHFt?=
 =?utf-8?B?RUJFaDFkOFV3bjJDM0dRUlVaME13V3dCcngvWll3Qm5adDVTUFpsOEd4blMr?=
 =?utf-8?B?WkJOaUlnTDc4dFNrM2tYdjJVSXZCbFArbWxibHoyZmZPNndpQzkyd1JROURt?=
 =?utf-8?B?eDBDOUE1TFRzakJ1SHF3a3lJd2prMXFQZ3RKY2ltc2wzelpTV2VuS0xOVDh0?=
 =?utf-8?B?ek41Qyt5dzA3V0pXVUFhYSs2QkxveWhPMGZUSUdpbWFzQWFRcWZrbDlMbEc0?=
 =?utf-8?B?NXVqNzR1Sndhb2M4b2doQWNYSTMxZ0F6UTg5ZDZRZUZ6bVhDNk00WlBneXlD?=
 =?utf-8?B?TUQvclVtODNKNVcwWUgvL29QSkd3b2R2ZE9mbDBhZG84YStSMjRJMGRmbFhq?=
 =?utf-8?B?UWhxamdnMkNLSThpd0FJRlI4UXBXZ3E4WlRudTR0WW0weURNNXM0YW0zNWxF?=
 =?utf-8?B?dGxFdTJwdFB3alZJaUhRZjFnYW9tamcvZmVmV3RBbTMxcmJDWFhhdjU0TmMv?=
 =?utf-8?B?bllDQ0VNajczZWZFVXpsUDlwbkM2UFF4NnBodUJWQWtZZUxjR3k3V1J6bWtp?=
 =?utf-8?B?ZlJVTkdMT29aMHlkYVdsRmFoQlpIWkEvd29hMktibzdla2NKRVJBT29LUVJK?=
 =?utf-8?B?enRUaSs0a3dTTFFzaFlIOXdRY3VINDJML2NBcHo0ODFrOVR4UFMwUDJyUDBW?=
 =?utf-8?Q?TRMNfOJb87Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzhYM3RGWjdCdzdWYkhCU3VFUjd1bzBsVWRvNVhTMTVQWHdvdWFYU3RDRi9q?=
 =?utf-8?B?TzNNdGxiai84WXJTU1B1TWR4UXVFRzNVcEhJalMyd0hHTXJxSy85MjA4UFBB?=
 =?utf-8?B?enE4dVdFdUx3STRLbVNZa0IvZHNMWWdLd3lzckNJc1QrSVBNb3c1aGtEbERh?=
 =?utf-8?B?TDRrZE1HSGVTV3prTzVIQ0NpcFdxY0xmQmJZblh0a3BEekdtVitXblZrbTJU?=
 =?utf-8?B?Zml0Tm43RWlwYlJZZTBqM05iUUp4VHl2dUQraEpQbnJRd0hZRmgwUmdRa2tn?=
 =?utf-8?B?Q2NnSS9HOTNNejRGa0NDWjZzWnJqaUJ4Skc3LytGOVJkbVFBVUwrbldaWWd1?=
 =?utf-8?B?aUZpZS9YdTZiWm9RMVNuRzNkUzlMcnJsOEV3NDVzWkM1UEEyNENHNHdVNFlU?=
 =?utf-8?B?RmhFR3kxK0RYbGF2NnovTXZyRTdUc1Rna0JEK2FHVGU5OXdrR2ZWVzZxZStX?=
 =?utf-8?B?UzhjM0NMNTVIanJwamNucmFHODJTNWZaVmg3Qmw4L1h1djRWcmppZlN3VEp3?=
 =?utf-8?B?QmNsNjJFSk41Z0RTSnRGamJ6MjVXdTdUNHJDMXUyTVNsNVNjTnEyTDVyZDJw?=
 =?utf-8?B?anY1b2dYU0hBa0tGbFU2MW8zQ0E0WlhjZ0FpNHZFamRWbTF5VlJvalp2dXJE?=
 =?utf-8?B?cjluSVVpd1RVK3lTcGt2M0dFd0lOOVBqSUk3OVpYT2Nma0N3T001WFFTaUVj?=
 =?utf-8?B?blJ3NnNyYTJLa3NKZnBaTk1KRUxJZkZiellDTzczQmI2RStiaXROM1NaZjJF?=
 =?utf-8?B?RmJJSUdmeTQ0UGFWTnlUT3MyTjdQNW1jQUpnVFBQTVVNY2kwUnA1eU5wdWIw?=
 =?utf-8?B?aDc0TW0vRkI0ZTc1VmhYQ2xuZ0FITVBaTWdlb3dJR0o3WFJrYlVRMXcrNGVB?=
 =?utf-8?B?eW43OGE1UXVZQzBGK002NG9pelE0YUxBMVVKZG1sbjhKSGlYdU11cmpYQmpY?=
 =?utf-8?B?Um9hZnlad3hmazRSTitDTHo2WnpWaFNVK0ZIdklIK2dzakYyWnk3Y1B1V292?=
 =?utf-8?B?dWNNUTMxbWViTHg4bXMrWXJiS2tRNkpROFkyNXZ4cXkxNDZDNmRQZHIzcW8z?=
 =?utf-8?B?K2tRUUYrb25KRzY2YWhiVDhPOXBYY09iS01XQnR3QWNROGZvSTFKWmpaTkxT?=
 =?utf-8?B?VDRSMjZXbW5TeUVRMHN3czNHMkl5eHZCRjlwNEMveVZ0cVZ1N2ZZSkk0aGRF?=
 =?utf-8?B?cU1pNTlha2xvd2g5NFlDVHU5R1E2Z3NmTEk5ZU04UUVYaGlTTDZBOFlDSFk1?=
 =?utf-8?B?WkIwY0pGVTltRVJkOHNsOVIzWmVDOEV3NE41Y1BJRE15L0ZiUFVqWC9XY1dH?=
 =?utf-8?B?eXhuaTNRWElOMUtqQUU1eDhhUjNKbFQvb2o1QzFnb1V3ajNvQ3pXZ1F6dEcr?=
 =?utf-8?B?c1J4cXNLL3NyaXFjRXdOb1BKOE9ZdU90YjVkY2hNcEJuWlJMWFhOeTdUZXNZ?=
 =?utf-8?B?MUd0a2c1NS96K2dORnpEQXBGclY0RWJsWUF5L1ZkY2pzcUdwR1lKVTBSMWRW?=
 =?utf-8?B?RmRCM2JCS2V6WkNUVG1UT1UzTzQ3SFVLNlllZ3Q2cUFZbkRKOGxtRUNNcmN4?=
 =?utf-8?B?S2RVUTRVR2FJSFFFeGxPdmpZSUNLMmxvOVBabHFzYmFoTzJQWnlpUGhqZ3NU?=
 =?utf-8?B?aXVob1VEWVFkbHJFTVl2bm90Ym9MUllzaGtCdkdneHJvNFRldTk1T2NJQ2Nl?=
 =?utf-8?B?ZGJtbldRVVk0NXUyQlNQVlZPbThRaFdUQXVsLytPTFJLVjNGTmFYZHcyMFQ3?=
 =?utf-8?B?Yms1REFpZ2ozZHlici9ZWTlsRWxYMUVFbnltOFNQY2tyazZ5cVZlb1JSVjBI?=
 =?utf-8?B?ejR2SitrTWl1djQvUHlyTTM3c3RwUHVVK3J1czZLL08xK1Fod3gyVG9iWExB?=
 =?utf-8?B?b2V2OXhrNVBSb0NOZUVpY3lXWkpGaDd3cWFtUHYzL0ttaTVPVVg3YStzRWNJ?=
 =?utf-8?B?SGNKdURGWjVQdy94bGc3ZlNWMFoybkp4ajhqUC9WSWJQOWJsY0E5TjkwbDBH?=
 =?utf-8?B?Um9xSGpwOGI0Ukk5WktBOGpkZ0ptTS9wQzNQQ0xZbnE4QkZMSWRZRHJvYWhm?=
 =?utf-8?B?b2h0Nk0xUmtiR0J1SVQ4TmpWaVZ0Q2FsMUpPL1dNZHZFeUJaRHlzUFFoYkxO?=
 =?utf-8?B?Qy9rMTB1dmd2UWk0MzlZdi9RQ3laTEl2aWtBaDFUQkNJNmhxc1F4c2tZOENl?=
 =?utf-8?Q?o9mCQCdOG19qhonhTOl6uYo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e49ef38-c6af-41d6-9db2-08ddf74a332d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 07:00:21.6236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iqXuUhP8xFhsgVYB8tJ+jvV/6SYqpf2dWg37TNh0yHgVPqgr9KEyDiJbu3uq33J20YIGh7wlOwkBoCncqGlscC1F9bNIpfvPuD/bvo/2p1Xq4ch+sPWVXyW20MkTWD3C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF5EA507B64
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

On 12.09.2025 14:54, Lucas De Marchi wrote:
> When building with CONFIG_MODULES=n, the __exit functions are dropped.
> However our init functions may call them for error handling, so they are
> not good candidates for the exit sections.
> 
> Fix this error reported by 0day:
> 
> 	ld.lld: error: relocation refers to a symbol in a discarded section: xe_configfs_exit
> 	>>> defined in vmlinux.a(drivers/gpu/drm/xe/xe_configfs.o)
> 	>>> referenced by xe_module.c
> 	>>>               drivers/gpu/drm/xe/xe_module.o:(init_funcs) in archive vmlinux.a
> 
> This is the only exit function using __exit. Drop it to fix the build.
> 
> Cc: Riana Tauro <riana.tauro@intel.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506092221.1FmUQmI8-lkp@intel.com/
> Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index e52808e3199fc..392550844404d 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -618,7 +618,7 @@ int __init xe_configfs_init(void)
>  	return 0;
>  }
>  
> -void __exit xe_configfs_exit(void)
> +void xe_configfs_exit(void)
>  {
>  	configfs_unregister_subsystem(&xe_configfs);
>  	mutex_destroy(&xe_configfs.su_mutex);
> 
> 
> 
