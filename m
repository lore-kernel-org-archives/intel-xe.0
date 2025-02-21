Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0BBC021AA
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 08:27:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DEE10E387;
	Fri, 21 Feb 2025 08:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLeegqqM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D998E10E2D9
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 08:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740126421; x=1771662421;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ewmDcPmNQCvzwCZdIoKa8cprtLerI5P8/hBC7FwWLGs=;
 b=NLeegqqMBRCPNVK+dV/QyiCCpvCYMqFkj70xzOn6Kq3IsJ3KSCbzrJXf
 dc3bRX+b/PkYP00kPOHwuEAa1gEJF6ECSQHMYoqbcQ1IRB6RmEaG0ioiU
 34NQ+qOQ02zwJhYSSG8qj22QfByIBJkB/GmMxwj62QChr4OjROFTSkQdm
 6pCjx5pUuRMLABVt56r1dMqDfChITC6792FCuuNDsV6ji1sDZ6Uri7FPI
 0550Di6W07fitLded6/+WPOaP1m0FUGS9ayx5da3Ts/1/OgTEpkFvTN6T
 Suw0M9pXKyOLZ8JTvLtnq0x8rHj/WcSfaNSh7US+dFh/OBdj3tuBv2uAn Q==;
X-CSE-ConnectionGUID: jSU8ykIYSna8iCHyWQzv7g==
X-CSE-MsgGUID: p2/nMhmrTh2U8gp+hUC0HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52365412"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="52365412"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 00:26:59 -0800
X-CSE-ConnectionGUID: H3dpycm5SEakATcX+Eog7Q==
X-CSE-MsgGUID: IoyTcG9RRrmSokWmbnkgkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120547995"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 00:26:57 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Feb 2025 00:26:57 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 00:26:57 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 00:26:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dbtuIKW+8RYkrkWrEYqSCqc6b/skItYVLjGv0Dw0e3KhcrVouqNVIZ0kFmsf7dmWbtHTjp955dvRHUElG2+lXB7jFLe5wyRz385aVvRm6FKIdncGU09jCciyQq+UEps497qBo6xk03kP0yZczcBGetwfMJrXtJcCvBiniQNOFnhcc808g8PqSjbY8f4xoLZUMxBPUl6b2LdYOsPeGSm2DySL3dp2iiuABHKlW2Fy7NI0I724jSPTkYY0dVqFWnAScLD4ye5ujg60HqGG2RUt01/LNlD3NZvmPaEFDO4EpJQCwC7Y5CV1fTHp1/uzp3TMUUxLd8xZX0IUUo6+GjAU5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1JrfgomSe980xeNZPK01U3e0f+OCt6ecvgYVthkAfRk=;
 b=O0mvUsrJguGN7rjPhytG1R7Ib8b962uTcFHVUzBnYa8XoEiDRqcKPbnzxNBhUKjRM6zPkW5dZVk7CR2AxNqIy6V9AVH7iOb1/km2gwMqP2zbIaQ8mkwfw96Y+MLCp5IDNKSgFf1fPMdXIEERJO+0LsXR60MiNMNbRc9VtraTwsF21DIybqKz+llAyGwGz36bduvFdesXWl9SjNrLnPx2c6iA04BSHLMgddMxew5x+drtZN2W0DgSGB4AHwSr/i9hK2ZdK/mQL4qNPRp57mrFPTt727CqfNMhH6ajHUGZKEJVoEVvFoJsrf11s+RN+FfnvKUoUmhQZZ7PJ+aGXdu0tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MN0PR11MB6280.namprd11.prod.outlook.com (2603:10b6:208:3c0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Fri, 21 Feb
 2025 08:26:55 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%7]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 08:26:55 +0000
Date: Fri, 21 Feb 2025 09:26:52 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/vf: Retry sending MMIO request to GUC on
 timeout error
Message-ID: <20250221082652.yxic6gsa2gpdfnof@intel.com>
References: <20250221055722.21370-1-satyanarayana.k.v.p@intel.com>
 <20250221055722.21370-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250221055722.21370-3-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: DU2PR04CA0053.eurprd04.prod.outlook.com
 (2603:10a6:10:234::28) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MN0PR11MB6280:EE_
X-MS-Office365-Filtering-Correlation-Id: e9add09e-58bb-4148-0abd-08dd52517ff4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VERCZHJFV25mZ3FkM1plL1RQM0NTNzE3eFY5eXZtSGNIMEdnQ0U3eG00MXRt?=
 =?utf-8?B?MTRYakJtakRKKzZLMGlYNnNtdjJvbXh1d0RnYjUyUk1jVzJ5QmJYOFRjc2VH?=
 =?utf-8?B?bVlnRUVzSWtjK0tMekMzYlhTaEV1QWVsUGU4c1RUelp5bnBVWXlHY2l5UFh2?=
 =?utf-8?B?NE84eG81Zlg5TXVxbU1nWWVsRERzbXBwTUEwSWpEamNPRHhNczNPb0tGUXc0?=
 =?utf-8?B?bHNUcFhlM3EwcVdJcU9vYjRMYy81THpWa3NSS2dVZWgwM1dWNXNRUDBGaTNU?=
 =?utf-8?B?emhTM1JldFJoV2hVRHNWUXlwY1Z1Q3dZR2UzVGZrSXBmTmhFN0sraUdHZXNq?=
 =?utf-8?B?R0c0Q1RRdnpKUnFFWjlFQ0RTcnpZbzlkWEF4cDFNZWd3SUVlZi9rL1dESElM?=
 =?utf-8?B?SHJiTE9LNnE5cC9NNmM4eSt1ck00YmRXT0JkVnAzZG9rYW5seElqRmVmaFlN?=
 =?utf-8?B?MzU3VDZlMVdxeVVlM1JwaksyYzM0NW5lN1hNUFd3ZU5Wd0h1Y3JVQVpqY09Y?=
 =?utf-8?B?bm9Cd1pBd1krNGZlc3NXK1RuRUZEa1VpK1Q1SlNKMjVkcTc1MTRMa1ZiNS93?=
 =?utf-8?B?Q1V1azJwN2tKV0xTNUp2WUJCdkpSSlRUTGhBWCtoOGFTYkpMU1hmWWZmdXpn?=
 =?utf-8?B?SFVIcUE1UWdvMmczT0diY1lxUUxFR3NXVjZVYThkRHd0V2VyYWhnQWZzSVlP?=
 =?utf-8?B?UHNlV3VsWWdUdDF2RWRMNDhYRUlYK1dQei85UThVTVhzbzc1WkNZMEQrRmk4?=
 =?utf-8?B?c0x6ZUdpbW9oNkJhNEtSZjZHWkZDUkJjWmlJTWZCYWlMMVhnQVBGZk5VaTdh?=
 =?utf-8?B?dkUvR3pTOS8yejcxL2c3c2IvdTVNNXhpRUs0SXV4NmlwbHVKUGNVem1tMmtU?=
 =?utf-8?B?MkJFOU81dFdpT3hERVR3SzFibHVHalJORnRIM1pIQVQvMnFtem4vVEJ3MFhu?=
 =?utf-8?B?S3dzaHFuOE8ybmlMZDErWlE4TWp2OEFhblhYOG1BNlpNSWlaREpLdEplUjg4?=
 =?utf-8?B?SXZ3bEtLKzRUb3dxVFZwUmQ1RklRU2pSSGNzL3BROVpNRURON1dKVWZqbTFX?=
 =?utf-8?B?a3JTZFQwYmw5Vmh5RTJjcDNSVUtFQXorczZqMndaaTRhZkI3WGF2Y3FGWTh5?=
 =?utf-8?B?aXEvdWRiU3RCNXZ1ZldQc1BoT1dObXhUTUw0T3ZBcjVqSWlYN3lJMzdRblhL?=
 =?utf-8?B?RGhZQTA1SDVWTzJoa2xxd21zaSt0RjVHRnBQZzBCOXFEa25IMC9hc1JVd3hk?=
 =?utf-8?B?ckZmaU0zTzFaMjZXak5Fc0k5anJUWWI2OGZneUVnMTZ1dEtxQWlRb1FuQUVC?=
 =?utf-8?B?V1JsRHBSS0d3MUhYOUVIVVZSeVd4T3VGa2d1VmtkZ0p3aGdhL1RDZ2Fmb1Zm?=
 =?utf-8?B?cUgwNzM1V3lBNklZQ0VhQ3I4bEJmTlduY1FaQUp0WkNUdWlOUTFvMEI0NlNm?=
 =?utf-8?B?b01tQTFtaGFQMzBkSkpvbjczUlBubGl6ZUJQZG5waHhWalhpK2RtMTRRYjBt?=
 =?utf-8?B?d2pBUVl3cXp0VFhmdThZRjFxR1ZOMzRqMEFKTVpYWnExZXB0Z3FFajFTdmw5?=
 =?utf-8?B?bnVUbEh4UlM2M0w0TzBaWTYwY1JKV0NEV2ZreFdaYXdBRzg1OGJram9MeW1i?=
 =?utf-8?B?OGJ4TUhLNEZkcWNyd2dOSS9rMzE4TjFMdDVPcGxzcm81ZjBlYlZ2YVJDSnpU?=
 =?utf-8?B?SVd3THE2MWlUdUdYNWd3K0RhVEMwZWNORTNoN2l1M2RPcU9SNDVDUVZxb3ZQ?=
 =?utf-8?B?RHFGWDd5OTV5aVFmc0JBTlNwdXZvV0tVclpnYXg0L0xuVitlYmZ0UHZVQ1Na?=
 =?utf-8?B?Z1ZIMTlFNWdxMndZSE8rbnJsT3ZQM0wxMGVpS3VTRnAra2FsbWtPcHpXUmVq?=
 =?utf-8?Q?Tzz4CvvbO2JcN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWFuVjhNaFNyZld1bTVhTHRBVFdoNEk3dnhadWxOV0xSN29aYWlFZEJGK01V?=
 =?utf-8?B?QmRBVXA1b3ZBaXlXVU94RUZsQnZpaFRsVU5iVGhkY3J2Q1ZSOUJyQ3BOVnQ0?=
 =?utf-8?B?dXN5Nmh6RjVJZjI0UnBIUmpYeVNwRHluR0hrSURveUZaM2pmMDhpZzF3cEx3?=
 =?utf-8?B?K0xwTllNb0JaVTJxbllGL1ExZXU1SWp2ZGVLSVBJZUEwbk40T2hNcm1pemtY?=
 =?utf-8?B?QVJuV1ZrOUJpOU1qSkVlZWdJMzFQNW5MQ3g2Y0VKOWlpQy9lTXRjeko4VTA3?=
 =?utf-8?B?V3N1akhDOGo3V09SUUlEVlp0VTkrMm43Z09vbXkvNjVnK1F6N0U2MUc1eTRI?=
 =?utf-8?B?T1cyd3ROUlJQSnJuVURkbzVtb3hZZFhqN1RwRC9GZzFlUGlkTU9DclRQUm1Z?=
 =?utf-8?B?M2dGbHAwWEs3VFpuS3FPbHBLUDNuc1M1Z2Z1TVNGNXBOSWNkRHlzRUs1dm43?=
 =?utf-8?B?TkwveW5sMnJKOEh4OGNNdGY0UjZiUjFKTHN4WkY5SGM2NEJ5ODNzNkhZU3d3?=
 =?utf-8?B?NXIxT29wR01wNlB3Um93NmVZSHBaVmZ3RUVxQklVbDQvY2kzUkFGQmZORWxq?=
 =?utf-8?B?ZDF4TEQ2cFpTODB2VWYzZlozcVpXbDMrUDlHR0xEcE92UmdCMGd3WDJ0cTdz?=
 =?utf-8?B?M3grOUl4a1dNT29lU3VPRVMybE5zTlo3Skk4dEpUbXlaSCtwVFN0MndiSFdI?=
 =?utf-8?B?T2VlbDF2ZEpWUllNRTBKZTZjeFhiRVE1ZDI4QzE0VWxTQ3B6VTUwY1JFZEhG?=
 =?utf-8?B?dGFDVUQxS3d2blpUM3UwVWNuTVZGUFBWdFhKOGhEcnd5MkFMcHArY1poaVZm?=
 =?utf-8?B?a2tPS2ZqMy9JTDBTSkRaOWlXUFk5UWdkSXhBWGhDalVDOThGWHdEQUxqb0k1?=
 =?utf-8?B?cVhlYXZCazhPb1lsNGpvdlNvK1o5K1FXZXBBTmJabDhxS2JnVWtIM0kveVor?=
 =?utf-8?B?QnEzUDRJTDJqTUp6Rk9ybm5sN0FDZjdNYXppWlVQL0ZoZnlsanNGMC9XNUJE?=
 =?utf-8?B?VGRrMTM1VlhMMnFNM29GM2NNK3NOQlVjRVIwck5uSjRNUytWOFA1R2J1SndB?=
 =?utf-8?B?b051NE85aTNGaXBybGVIS01vNjBqSmtaakNEQk8rODk0bGlFa1B2NG5OamRY?=
 =?utf-8?B?bml1WHVscXBGVkwwV0YxQml1NXVmajFuL3A5ZTMwdU9TUmErbDI5TGN0Vldz?=
 =?utf-8?B?VjdJYy9iL2YvWWVXS3JWVHE2Z2VnOGNLYk1nRldZeWM5Q096S3ZuWE8wSDBX?=
 =?utf-8?B?RGlDalE1VFFjQTR0K1V0UXZ1YkJscDRaNUkrVFNaMEpqRW1HTzlQRkV1RUt1?=
 =?utf-8?B?VGJPajhtN3Z1MWRBMDZNVUhjZVEyRk9QN3kxcm1SQnI3TjQ5bUtHZ2VRdHhZ?=
 =?utf-8?B?TlI4b2NGYVpkdmRGOW1Oang1eE1WNUpUTXU0T09hRC9tZG9qNGlvMUFSeGUy?=
 =?utf-8?B?UVdVaDVpaDJQWGV4akdTLzNyVDEvNzBBNXpucTJWNmtxS3V6aXVjMDR2Rllx?=
 =?utf-8?B?aml6bm1nVGdrWGhFTGRCTFpOb2ZOTVRvcjJVd2cwZkoxaG03OStuOEJ0bTJv?=
 =?utf-8?B?WXJpQTQwamVOYnp0QnJXeVNiaEYxTG1ZV1lta2pnKzFBYWVCSlh1VWpINmM0?=
 =?utf-8?B?ZnJBQ3hvOXlFb0plQzJUd1NVYktxdGVaN2hsZHlWSTBKZ2lXRlBONkVVeWp0?=
 =?utf-8?B?d0NNcHYrbkhiTDl3RE16SFF1YXlpNHN0a1J3TXkySW9oMTlOY2lBcy9HZ0wr?=
 =?utf-8?B?eXRLM2NkbkpzUFZaampPRkV4bnZBVnIrZFBSNWU4OWVPYzVOZGhsWlVxK2Ni?=
 =?utf-8?B?Smh6bW9Wc3U2UG5aN3ZWWDYvWndMTTQxWUhlVGc0cS93YnVHRXRuNmhEWk1l?=
 =?utf-8?B?RGZlcXZ2WjVkb0pNVmV1UkJuclVMaDFqMy9OL3FNS1dQRllzY0sybEJLdjNH?=
 =?utf-8?B?blVyaFNoQVhlYWtaZnEyMmtNYVhoeFY5S09EdnpDUXhNNUUyYTEyUXpxa3lB?=
 =?utf-8?B?Ym9rc2NWcHplRnl0NHVLWEdLZ0tKTU40bjlnSmNRbXVRN0NOOGllL2hpcWFk?=
 =?utf-8?B?WWNRTTEwVjZlSEIwbEZlZDY4WUdVOHlOVlFJWVFhNVJtYjRQVVFWeDFrV1cz?=
 =?utf-8?B?eG5BdERKSXRaZUtmelh2WnFYQ240aTd0V2VkeFFTS2ZOODBJOTBudi9Kc3lx?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9add09e-58bb-4148-0abd-08dd52517ff4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 08:26:54.9992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RdTdTENOdXjScY6++35w1KxC0vVZIIayJHdzfdW3nYWdOt1gpSCxdyycZ8B79zuJlfwn8dgWd0QjGVqy/2nhfFgun05mZ2o6KYJrUR5iT6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6280
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

Satyanarayana K V P <satyanarayana.k.v.p@intel.com> wrote on pią [2025-lut-21 11:27:22 +0530]:
> Add support to allow retrying the sending of MMIO requests
> from the VF to the GUC in the event of an error. During the
> suspend/resume process, VFs begin resuming only after the PF has
> resumed. Although the PF resumes, the GUC reset and provisioning
> occur later in a separate worker process.
> 
> When there are a large number of VFs, some may attempt to resume
> before the PF has completed its provisioning. Therefore, if a
> MMIO request from a VF fails during this period, we will retry
> sending the request up to GUC_RESET_VF_STATE_RETRY_MAX times,
> which is set to a maximum of 10 attempts.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 4831549da319..a439261bf4d7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -47,12 +47,19 @@ static int guc_action_vf_reset(struct xe_guc *guc)
>  	return ret > 0 ? -EPROTO : ret;
>  }
>  
> +#define GUC_RESET_VF_STATE_RETRY_MAX	10
>  static int vf_reset_guc_state(struct xe_gt *gt)
>  {
> +	unsigned int retry = GUC_RESET_VF_STATE_RETRY_MAX;
>  	struct xe_guc *guc = &gt->uc.guc;
>  	int err;
>  
> -	err = guc_action_vf_reset(guc);
> +	do {
> +		err = guc_action_vf_reset(guc);
> +		if (!err || err != -ETIMEDOUT)
> +			break;
> +	} while (--retry);
> +

LGTM:
Reviewed-by: Piotr Piorkowski <piotr.piorkowski@intel.com>
>  	if (unlikely(err))
>  		xe_gt_sriov_err(gt, "Failed to reset GuC state (%pe)\n", ERR_PTR(err));
>  	return err;
> -- 
> 2.35.3
> 

-- 
