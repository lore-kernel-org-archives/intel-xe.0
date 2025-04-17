Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406C8C369C9
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 18:25:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0235210E3A0;
	Thu, 17 Apr 2025 18:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wq2d+hzn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49ADE10E3A0
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 18:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744914309; x=1776450309;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tXPWn3CYv2wHkUnlZ55NurywE31BcIvcpv19B7Zw4so=;
 b=Wq2d+hznoSR2GWhXJ8kUYuHsVuRatU077LNPv6S/fxaY1RaqwJXt1hCC
 k3LkBRvAkY2vDoFVaBdhTf4RSj3mqjqPq+IVTaRAl+JYNMI0dcAmQedKk
 5yRivlCDlBjE3L8x27Wl1CjwDThkdAfwgFY8pz/U4y+dTW+AVL935uw03
 ScxQC2LICVyChOsHRKZBJ17tUR47cXVd3j6ajBZQ6Ye7eEgYL/KXRRJEq
 T7VBNNMi16J1tIWFFiAuRYWY2/2Q/LYtL/tCtVk9x2UGNe7NzvoBlJN5P
 YSvyZP+vXVobNnLXTJvdl6sQnvF6sAep4q4CanLAOWoSiLXkuINXdbYCj Q==;
X-CSE-ConnectionGUID: 4ZQyu1eLQruzcLVuUnJyYw==
X-CSE-MsgGUID: 5IFlmknrQjuHaewwZ8Dh3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="45657117"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="45657117"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 11:25:02 -0700
X-CSE-ConnectionGUID: CtJdeNl1TISLFoYqiK7GfQ==
X-CSE-MsgGUID: uf+Jy+e2RW2GevsmTAG0KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="130883009"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 11:25:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 11:25:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 11:25:01 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 11:24:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhFXlUAGoDYCI4BniorS5goun7y6gPEEUvs0VbrACH9IHa84rq+jeNRsu2hbBHom04TTeeCXuL3cDiv8mU7Zy6+KuNCsPBDhhIkv77Dngg44d5agpxCfY0F9TR5xPeVabNvvmFIyZPp2OKZIzb1WklHRi6pSkmTX0ZKmydlj737TGMvooP8Vp5HI2jAviNbM524WU2PD4tE+5Vnwzw9q3JYmNGOKHZKpLAk/OLA9KN0LGymeazjvYjyWyxW9CmPWhArzjfRhMuj08CxAME+ZkPyEkwJwY/wwHRCRyt73J8OV0zY4eyYIgPQUO33T16EbOR/QJ2rGltgeYsHQoh+elQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXPWn3CYv2wHkUnlZ55NurywE31BcIvcpv19B7Zw4so=;
 b=UjrdKS6p7INPBkQ4o4RkPigAzGN4lE7rNC6QTEU+maPJydELaCJ10umZjSO7m3Xj2lkEfImSbsPOkqCCgTy9LHAeErpyR6JbFXFoH6X1mjPn6ueQPpgfieR7a1p+4lwkkt7y8lyoEg9u1heB75Eyne8FtuH18k8nN/SQO/+4WZWQfBQJD3Lmr4mDg4s80DeNdeJSv6OvdlPI3ik5y6x3SsPGdcXzCT39dTJP86Dc3l1/UYNvnNb0q3PZD+L0JzHdfjsdPI+fV3zaBnbF1Um5Juq4a5msk3NGwwPKB4FYSMLAj2vUTcGrkCeEjcFqKVRlCP7di2AyBhVVyl2/FjGL4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CH3PR11MB8519.namprd11.prod.outlook.com (2603:10b6:610:1ba::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 18:24:17 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%6]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 18:24:17 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 17/32] drm/xe/uapi: Add madvise interface
Thread-Topic: [PATCH v2 17/32] drm/xe/uapi: Add madvise interface
Thread-Index: AQHbp6Lu7DD/vlYFq0a8UzzQfyhwEbOoO1iAgAABOgA=
Date: Thu, 17 Apr 2025 18:24:17 +0000
Message-ID: <e25bd47bce1167d576a42b231cabb26a7ca102be.camel@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-18-himal.prasad.ghimiray@intel.com>
 <023b0ec5c3e00b1779e0bbfde5a279042a86efa9.camel@intel.com>
In-Reply-To: <023b0ec5c3e00b1779e0bbfde5a279042a86efa9.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CH3PR11MB8519:EE_
x-ms-office365-filtering-correlation-id: 740d49b5-25b2-4a96-03c5-08dd7ddd10a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ekxxdldOcEpkd3AwRGt6MmtJN3k0bHdFWGI3MkEwQTBWdTMxN3l6ZnQ3d21o?=
 =?utf-8?B?MGRSZys3NnUxeU1lTG5TRXYzQkRaclhoWUQybkVYcWl0SkpucXJ2MXBEa1FV?=
 =?utf-8?B?NGhlWUY5L2FUenY1Z2ZXWTVaM0hlaXhxazFESFFXdUExTnFTNUkyemR4TTNk?=
 =?utf-8?B?TUloMXpHVVNDbGM4WHhySm9IV0pRcFVnOFg3azFTSHJZSkpUMkt3WWY5R0Js?=
 =?utf-8?B?bGZETXRhek0vMkxHbHBSejJ6T2JrVjdTK0xVeWJkTGQ1eTRFbzhUR2gzK0sz?=
 =?utf-8?B?U1hkM214c1JIRmFQbU5XeGtrVHlOZlEzcjAvaVNlbXltTmsyc1VFNUJmOEpp?=
 =?utf-8?B?dlhxTlprL29lb2RYQXFGV2VTSTg1TGxtZCtOSTRwd0tLb0M5TXNMRFNCVmVU?=
 =?utf-8?B?QnlTTi85NGV5TjE2OXFvYjdWN0tJeVlkRkZmSXdvSGdRZnp0dWJ2Vm5sSWJQ?=
 =?utf-8?B?UTBmbUkzY01lWFFobUdQdDByMTdVaXIxM09JeWtoVHF6QzZEeUFiT2EyUDhY?=
 =?utf-8?B?ZnJkejV2UTJ1S3FvN0dxSCtqQzBmclVjdW41WWhNclRteWRvRHh1cDltdXVk?=
 =?utf-8?B?Z1J2ZU5LQm9HdHpReHFDTmpUaXdpbkZUa2NNbGJRV2h5STRLYU1IbW0yUi93?=
 =?utf-8?B?d1FkREJyVjROdExpOEpEV05VYXNtaStZRzhrN3E5UnAvVlU5NWtscEQwb1Z1?=
 =?utf-8?B?N3VhY1RRdGFvSFVwNWg5N0FpbWJSVmRtOEpDbDVQNlR4cWtiV1RFc2ZOOWRG?=
 =?utf-8?B?MFpmMTQwMFhiZkp2amk2dEhjanV5eDJwNkduNjhWdGVBUWtrcjFjdUx5K1pV?=
 =?utf-8?B?VUl2dUx4YVBLdmwvRjJLcC8zRS9SZG1NY1l4UERQeFlUSmdHTFlpTmJQVC9v?=
 =?utf-8?B?YTBBdm4rc2N4N3lmSjVsNGJxWGtQN0RWaVhXRGtaT29ZamdkWExtZ0tRaTNB?=
 =?utf-8?B?bXVWUHFMRFVnUTNsN2d3OUU3ejNYVGVUTlhqVTFQdnJhWGJnVURBRFBLbXp5?=
 =?utf-8?B?SEliZ2J3SHA4Yjg3SFd2eHJFZkxleVBVajB5bE1NTGN2SW5SYjlvL2JVM0Jq?=
 =?utf-8?B?ZVc4enBYRWYxRlNDWFlqTVlQdVYwUDFGTHgxSVFCOU83L1htdit3VDBvdDgz?=
 =?utf-8?B?c2pGcm9Icit3YVpONkVTVklqQUpmRzZ2OE9JVFdBdTZaWlliWlFyRGFlSUhK?=
 =?utf-8?B?amkyM3czcjNKNnpZQytWTHhNVTZYdExDYkRSK0Z3YWhiaWdramVKSGNCd1kw?=
 =?utf-8?B?bGIwWjdyRkRxaG9FRytnSzJNSjREcFF3OW1FMFFXKzFiTytwZkdTRWNoSFVk?=
 =?utf-8?B?WkplMjlUcGhnbG56bU1oZnlNQnNMbm11NEo0UDlMaER4ek5tNUU4WW9rUlIx?=
 =?utf-8?B?eEZnSzIwTVJwTjRCQ0NuNFUzQmZqUVBOSWdzTDNxRVVvTzlqQlplOVk2Rlh5?=
 =?utf-8?B?WnRaemx0N0poclI2MVY4ampFU25KaU1lemYra3JvR0lGbUo1VHRUaklrWHZn?=
 =?utf-8?B?WENmM1dyQWhFcjZ5aytEeHN5OWFrZFBzQStmYkp2cFpPd280bm9sRE5CM3Fh?=
 =?utf-8?B?ZFEyRXdtcWV3dHliMFd2MEpESmtma1RvWjNGOGRlYWJLR05sOHZEaGNpOXlX?=
 =?utf-8?B?OVcwbFA4cUxzRy9qeGEyVnN6djdMS2x2YWhtb3VTdURTREdYR3ZiZWwwbHZK?=
 =?utf-8?B?cDIwaENDU1BCNUNndjFqOGNxK3lLakRhb3RmNjFIMWM3aVlaWlQwS1I1dFp1?=
 =?utf-8?B?VjlBNGJpVGtGMUlwcnVweUo2N2FpdWt5UnJGbE1WYTNiS1RjWlUrdmh3emMv?=
 =?utf-8?B?TDlGY2h6MUwyWVZBcXJZNjVMVnpFaXl2UXNKMW04MmZCOVY3aTNxRUhTa1Fa?=
 =?utf-8?B?bHNsamhuTjZQTVVpYk5IZlBsUmxsd0t6RlVFS0tXcEFEbmdOaGV4eThibjdh?=
 =?utf-8?B?citNVHFKM2x5Yk1tK1AxYWxIaEtuVjRwSzJpYW8rb25BaTcwSlc2b2tiaXVE?=
 =?utf-8?B?b3pKZXZLaU9nPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NHVwZ3BZOG1RMWdSVDhBWDVnem1IRlpoNnpmYnF4Mm9relU3aENtZXJXYmNT?=
 =?utf-8?B?enRnQmpWY0ZZTDJtL2VxdWY5NjN0a3JNNFlBaC9RNmsxWkxFNjdUWG1nQmo4?=
 =?utf-8?B?TG9ubEtEbTZUUFd2WHNETGRHNHltTGh4aTZqNE5tYlFjdERFN25zWG9DRW9J?=
 =?utf-8?B?cnZaWHI2NEZwaTdIQ2RjVFRYMWd0TlBkZENMR1dEU0ZSTHR4U0loL3EvZjl3?=
 =?utf-8?B?NW1KNWR6SGlYRWFGc1ZiTlhiL1laMjI3YzMzemFnenA1NFU0ek5lK1BJWFYv?=
 =?utf-8?B?bWVUNEFXNW04L3RCWXJXNmI1b3NyVnBNM1cycFBjbmVITnY4bGpZSWNFamJM?=
 =?utf-8?B?NCtzc2NmYUZjVnlyU0VHcmpvdTBnclZYdW05a01wdGVNWDE2aUdQYzg0K3ZO?=
 =?utf-8?B?LzVqakF0eG9MN2dUN1ZQZHh2L3JXWUZQeEZUOEVtNEI4TjR0elFlSlN2Z0Jo?=
 =?utf-8?B?U0NMNHRMWGtFdDhDSTlIV1UyQTFMSzZ5RDVyOHFtVWlrMktreVRuOWkwZ3Z4?=
 =?utf-8?B?bWtVVE44bWZERURLZVArYkdIbDM2Z0wwZ3FJT2VWL2J6ZFZTZ0srUU14Nk1v?=
 =?utf-8?B?LzlxU1dTM0FmT1dQYUxCTklNYlNweHNYaENIUXp0ejJpMFdIeFZDc1ErUVNO?=
 =?utf-8?B?djhlSXl0b2lZdnlGbFBhUFZDd1dnaXdCSnJYUDY3YXhuT09KRnQ1RkFpN3Fj?=
 =?utf-8?B?bXhQUXJTUGYzODJkWWJzWU9CT2hxbHdtMnd6eWlzTVpjaC90Y25BVFdYU0J4?=
 =?utf-8?B?VnVtVU1qaGsrSmRkblhXeVZlSEc0a0UvTTJ4Q2RsVm96VWpUZVhTUTN4c1VZ?=
 =?utf-8?B?SjBieVc2emozSmQyRVBKczVnNmt0R2FNOUpQUDNqa0dYdDdWa0dHdUthQVQw?=
 =?utf-8?B?cS94RURnOGxFV09KNUNJeXFtWldKN1VPNjJHUDBvOVJuMDJZMTVZbkhPWG5p?=
 =?utf-8?B?UnhRLzRheFhBSU1Oak5JZW94ZmM1NDAwL2pFUXRLeTVPTlRZV01qRkp6NGVs?=
 =?utf-8?B?MlV5Z0ppajhHUndBVGhnaWRQaEoyYkttLzhHLy8xSVBNQnAvTGRzT1NUTnUy?=
 =?utf-8?B?ZmpVazhpNUhCNUJzVnIxMTJ4VXZTUjZnTlNmcUlBNnlnZGZKS3NzVERFWlRz?=
 =?utf-8?B?bXBrdWRRZDVpOXJXWWRwWHlka2lMbzd2bExoWnpsbkNuRzlRbTExV1NtWjFs?=
 =?utf-8?B?SHd1c0w2cXhBUURKOFRBRTlDL3ZIbm4xZzFZaU9wY0F5QzZhZTFUcWQ2bkQ3?=
 =?utf-8?B?T05pR1g1Tlg5OGI2b2NwVkx0MUFnV21FSys1UW91TFo0QnJLWWU0bHBPWU9U?=
 =?utf-8?B?ZkliMkwwZDBFcmpKN09XN0s4R0JiQzRPNVFoQ0E2R2RodmExTDdnakU1NlhV?=
 =?utf-8?B?alVJTzRFMk9CZDVtaENpYkRKRUdudGtpRlhZUlQ4d1hQZFhYQWJPTUNqdHJp?=
 =?utf-8?B?VE42NncwNlBmU3JqbDBkVytrOXdjcTFaV3EwYUhteW52Y2hkSXlQQjdxM3Vj?=
 =?utf-8?B?VFZ1Q1pEbVI2aGJ3YjNjUnBjMWdWdTFBb3NkdDdVckp3ZnJMci9EOXFqUm92?=
 =?utf-8?B?ZlhubmVMSzVPTkJ0c1JjNXpCMFF4ckxIbVVMRDFrWVVSbDlBYlRuUnJpQjBw?=
 =?utf-8?B?aFNDcmdscldBNU5uaHVzcTFTODRycnZveG5MU3Y3eEVGMWNQYjJxMzViY2Ev?=
 =?utf-8?B?aUdWZFpScUpXZGhUSDRyOEdnQ0RoaHRsbG91bE0weXNXQXJmbWtLQkJKeXFD?=
 =?utf-8?B?SXAzU3hQQUNWK1RqQ01mNENiTmxyd0NNRVIrT0tsdEdWRllxSHk2YVY4TWs0?=
 =?utf-8?B?eU5SdGNPK28vQ0VYcHQwVGQxanpXdDB3QmtCd1hxVENRQmlTMDAxbm8zbC83?=
 =?utf-8?B?RjYzK0NiaTNQekIwY040YWVtaC82S0JJcjl6RUJDbHYxR3ZuL3M4MHoxdGJW?=
 =?utf-8?B?N1ZWSU9nNXJCU1h3cVhuaG9yelk4bWEyOHEwWSt5UUxIQlZSVWJPR3RFRGE4?=
 =?utf-8?B?a3FNOW5xVWZMT0xKTHVqSmpwcnlVc0F1M2hWK0dGS056dUhESkdDZHVwWXZC?=
 =?utf-8?B?ODVpRXg2MFlLdHZCVlR4Y1YyZ1hSK0pWQm1LUVdpNm1WZlliM0p2YVdKQXYy?=
 =?utf-8?B?NXBmT2dDTFFzT0ZLV0sxMm1INUZyKzBERTZNcm82eENLd3pob21CTWs3L2d1?=
 =?utf-8?B?VXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FAA691D8F3A0ED4BA56674378100AE8C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 740d49b5-25b2-4a96-03c5-08dd7ddd10a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 18:24:17.6568 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p++Q4y2a3/FFdE/O2eRXFuec0R0c6kwiW3StOY6OY3YtpbQN0yZ0oLPfhhV6eOUOgkvblP49BO7ObdI0WDUqcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8519
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

T24gVGh1LCAyMDI1LTA0LTE3IGF0IDExOjE5IC0wNzAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IHdyb3RlOg0KPiBPbiBNb24sIDIwMjUtMDQtMDcgYXQgMTU6NDcgKzA1MzAsIEhpbWFsIFByYXNh
ZCBHaGltaXJheSB3cm90ZToNCj4gPiBUaGlzIGNvbW1pdCBpbnRyb2R1Y2VzIGEgbmV3IG1hZHZp
c2UgaW50ZXJmYWNlIHRvIHN1cHBvcnQNCj4gPiBkcml2ZXItc3BlY2lmaWMgaW9jdGwgb3BlcmF0
aW9ucy4gVGhlIG1hZHZpc2UgaW50ZXJmYWNlIGFsbG93cyBmb3IgbW9yZQ0KPiA+IGVmZmljaWVu
dCBtZW1vcnkgbWFuYWdlbWVudCBieSBwcm92aWRpbmcgaGludHMgdG8gdGhlIGRyaXZlciBhYm91
dCB0aGUNCj4gPiBleHBlY3RlZCBtZW1vcnkgdXNhZ2UgYW5kIHB0ZSB1cGRhdGUgcG9saWN5IGZv
ciBncHV2bWEuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSGltYWwgUHJhc2FkIEdoaW1pcmF5
IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBpbmNsdWRl
L3VhcGkvZHJtL3hlX2RybS5oIHwgOTcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5NyBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJt
L3hlX2RybS5oDQo+ID4gaW5kZXggOWMwODczOGMzYjkxLi5hYWY1MTVkZjNhODMgMTAwNjQ0DQo+
ID4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+ICsrKyBiL2luY2x1ZGUvdWFw
aS9kcm0veGVfZHJtLmgNCj4gPiBAQCAtODEsNiArODEsNyBAQCBleHRlcm4gIkMiIHsNCj4gPiAg
ICogIC0gJkRSTV9JT0NUTF9YRV9FWEVDDQo+ID4gICAqICAtICZEUk1fSU9DVExfWEVfV0FJVF9V
U0VSX0ZFTkNFDQo+ID4gICAqICAtICZEUk1fSU9DVExfWEVfT0JTRVJWQVRJT04NCj4gPiArICog
IC0gJkRSTV9JT0NUTF9YRV9NQURWSVNFDQo+ID4gICAqLw0KPiA+ICANCj4gPiAgLyoNCj4gPiBA
QCAtMTAyLDYgKzEwMyw3IEBAIGV4dGVybiAiQyIgew0KPiA+ICAjZGVmaW5lIERSTV9YRV9FWEVD
CQkJMHgwOQ0KPiA+ICAjZGVmaW5lIERSTV9YRV9XQUlUX1VTRVJfRkVOQ0UJCTB4MGENCj4gPiAg
I2RlZmluZSBEUk1fWEVfT0JTRVJWQVRJT04JCTB4MGINCj4gPiArI2RlZmluZSBEUk1fWEVfTUFE
VklTRQkJCTB4MGMNCj4gPiAgDQo+ID4gIC8qIE11c3QgYmUga2VwdCBjb21wYWN0IC0tIG5vIGhv
bGVzICovDQo+ID4gIA0KPiA+IEBAIC0xMTcsNiArMTE5LDcgQEAgZXh0ZXJuICJDIiB7DQo+ID4g
ICNkZWZpbmUgRFJNX0lPQ1RMX1hFX0VYRUMJCQlEUk1fSU9XKERSTV9DT01NQU5EX0JBU0UgKyBE
Uk1fWEVfRVhFQywgc3RydWN0IGRybV94ZV9leGVjKQ0KPiA+ICAjZGVmaW5lIERSTV9JT0NUTF9Y
RV9XQUlUX1VTRVJfRkVOQ0UJCURSTV9JT1dSKERSTV9DT01NQU5EX0JBU0UgKyBEUk1fWEVfV0FJ
VF9VU0VSX0ZFTkNFLCBzdHJ1Y3QgZHJtX3hlX3dhaXRfdXNlcl9mZW5jZSkNCj4gPiAgI2RlZmlu
ZSBEUk1fSU9DVExfWEVfT0JTRVJWQVRJT04JCURSTV9JT1coRFJNX0NPTU1BTkRfQkFTRSArIERS
TV9YRV9PQlNFUlZBVElPTiwgc3RydWN0IGRybV94ZV9vYnNlcnZhdGlvbl9wYXJhbSkNCj4gPiAr
I2RlZmluZSBEUk1fSU9DVExfWEVfTUFEVklTRQkJCURSTV9JT1dSKERSTV9DT01NQU5EX0JBU0Ug
KyBEUk1fWEVfTUFEVklTRSwgc3RydWN0IGRybV94ZV9tYWR2aXNlKQ0KPiA+ICANCj4gPiAgLyoq
DQo+ID4gICAqIERPQzogWGUgSU9DVEwgRXh0ZW5zaW9ucw0KPiA+IEBAIC0xOTY1LDYgKzE5Njgs
MTAwIEBAIHN0cnVjdCBkcm1feGVfcXVlcnlfZXVfc3RhbGwgew0KPiA+ICAJX191NjQgc2FtcGxp
bmdfcmF0ZXNbXTsNCj4gPiAgfTsNCj4gPiAgDQo+ID4gK3N0cnVjdCBkcm1feGVfbWFkdmlzZV9v
cHMgew0KPiA+ICsJLyoqIEBzdGFydDogc3RhcnQgb2YgdGhlIHZpcnR1YWwgYWRkcmVzcyByYW5n
ZSAqLw0KPiA+ICsJX191NjQgc3RhcnQ7DQo+ID4gKw0KPiA+ICsJLyoqIEBzaXplOiBzaXplIG9m
IHRoZSB2aXJ0dWFsIGFkZHJlc3MgcmFuZ2UgKi8NCj4gPiArCV9fdTY0IHJhbmdlOw0KPiA+ICsN
Cj4gPiArI2RlZmluZSBEUk1fWEVfVk1BX0FUVFJfUFJFRkVSUkVEX0xPQwkwDQo+ID4gKyNkZWZp
bmUgRFJNX1hFX1ZNQV9BVFRSX0FUT01JQwkJMQ0KPiA+ICsjZGVmaW5lIERSTV9YRV9WTUFfQVRU
Ul9QQVQJCTINCj4gDQo+IEluIG15IG9waW5pb24gd2Ugc2hvdWxkIGRyb3AgRFJNX1hFX1ZNQV9B
VFRSX1BBVCBhcyB3ZSBjYW4gYWxyZWFkeSBjaGFuZ2UgdGhlIFBBVCBpbmRleCBieSB1bmJpbmRp
bmcgYW5kIGJpbmRpbmcgdGhlIFZNIHdpdGggdGhlIHdhbnRlZCBQQVQgaW5kZXguDQo+IFNpbWls
YXIgZm9yIERSTV9YRV9WTUFfQVRUUl9BVE9NSUMgYW5kIERSTV9YRV9WTUFfQVRUUl9QUkVGRVJS
RURfTE9DLCB3ZSBjb3VsZCBoYXZlIHRob3NlIHByb3BlcnRpZXMgaW4gdm0gYmluZCB1QVBJIGFu
ZCBpZiBuZWVkZWQgdG8gY2hhbmdlIHdlIGNvdWxkDQo+IHVuYmluZCBhbmQgYmluZCB0aGUgVk1B
IHdpdGggdGhlIHVwZGF0ZWQgYXR0cmlidXRlcy4NCg0KQWggYW5kIGlmIGl0IGlzIGNob3NlbiB0
byBtb3ZlIGZvcndhcmQgd2l0aCB0aG9zZSBJIHRoaW5rIHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSBk
cm1feGVfc3luYyBzbyB3ZSBjb3VsZCBzeW5jaHJvbml6ZSB0aGUgdXBkYXRlIG9mIHRoaXMgYXR0
cmlidXRlcyB3aXRoDQpwcmV2aW91cyBzdWJtaXNzaW9ucyBhbmQgZnV0dXJlIG9uZXMuDQoNCj4g
DQo+ID4gKyNkZWZpbmUgRFJNX1hFX1ZNQV9BVFRSX1BVUkdFQUJMRV9TVEFURQkzDQo+IA0KPiBN
ZXNhIGNhbiBtYWtlIHVzZSBvZiBEUk1fWEVfVk1BX0FUVFJfUFVSR0VBQkxFX1NUQVRFIGJ1dCBu
b3QgdGhlIG90aGVyIG9uZXMsIHNvIHlvdSB3aWxsIG5lZWQgb3RoZXIgVU1EcyB0byBsYW5kIHRo
b3NlLg0KPiANCj4gPiArCS8qKiBAdHlwZTogdHlwZSBvZiBhdHRyaWJ1dGUgKi8NCj4gPiArCV9f
dTMyIHR5cGU7DQo+ID4gKw0KPiA+ICsJLyoqIEBwYWQ6IE1CWiAqLw0KPiA+ICsJX191MzIgcGFk
Ow0KPiA+ICsNCj4gPiArCXVuaW9uIHsNCj4gPiArCQlzdHJ1Y3Qgew0KPiA+ICsjZGVmaW5lIERS
TV9YRV9WTUFfQVRPTUlDX1VOREVGSU5FRAkwDQo+ID4gKyNkZWZpbmUgRFJNX1hFX1ZNQV9BVE9N
SUNfREVWSUNFCTENCj4gPiArI2RlZmluZSBEUk1fWEVfVk1BX0FUT01JQ19HTE9CQUwJMg0KPiA+
ICsjZGVmaW5lIERSTV9YRV9WTUFfQVRPTUlDX0NQVQkJMw0KPiA+ICsJCS8qKiBAdmFsOiB2YWx1
ZSBvZiBhdG9taWMgb3BlcmF0aW9uKi8NCj4gPiArCQkJX191MzIgdmFsOw0KPiA+ICsNCj4gPiAr
CQkvKiogQHJlc2VydmVkOiBSZXNlcnZlZCAqLw0KPiA+ICsJCQlfX3UzMiByZXNlcnZlZDsNCj4g
PiArCQl9IGF0b21pYzsNCj4gPiArDQo+ID4gKwkJc3RydWN0IHsNCj4gPiArI2RlZmluZSBEUk1f
WEVfVk1BX1BVUkdFQUJMRV9TVEFURV9XSUxMTkVFRAkwDQo+ID4gKyNkZWZpbmUgRFJNX1hFX1ZN
QV9QVVJHRUFCTEVfU1RBVEVfRE9OVE5FRUQJMQ0KPiA+ICsjZGVmaW5lIERSTV9YRV9WTUFfUFVS
R0VBQkxFX1NUQVRFX1BVUkdFRAkyDQo+ID4gKwkJLyoqIEB2YWw6IHZhbHVlIGZvciBEUk1fWEVf
Vk1BX0FUVFJfUFVSR0VBQkxFX1NUQVRFICovDQo+ID4gKwkJCV9fdTMyIHZhbDsNCj4gPiArDQo+
ID4gKwkJLyoqIEByZXNlcnZlZDogUmVzZXJ2ZWQgKi8NCj4gPiArCQkJX191MzIgcmVzZXJ2ZWQ7
DQo+ID4gKwkJfSBwdXJnZV9zdGF0ZV92YWw7DQo+ID4gKw0KPiA+ICsJCXN0cnVjdCB7DQo+ID4g
KwkJCS8qKiBAcGF0X2luZGV4ICovDQo+ID4gKwkJCV9fdTMyIHZhbDsNCj4gPiArDQo+ID4gKwkJ
CS8qKiBAcmVzZXJ2ZWQ6IFJlc2VydmVkICovDQo+ID4gKwkJCV9fdTMyIHJlc2VydmVkOw0KPiA+
ICsJCX0gcGF0X2luZGV4Ow0KPiA+ICsNCj4gPiArCQkvKiogQHByZWZlcnJlZF9tZW1fbG9jOiBw
cmVmZXJyZWQgbWVtb3J5IGxvY2F0aW9uICovDQo+ID4gKwkJc3RydWN0IHsNCj4gPiArCQkJX191
MzIgZGV2bWVtX2ZkOw0KPiA+ICsNCj4gPiArI2RlZmluZSBNSUdSQVRFX0FMTF9QQUdFUyAwDQo+
ID4gKyNkZWZpbmUgTUlHUkFURV9PTkxZX1NZU1RFTV9QQUdFUyAxDQo+ID4gKwkJCV9fdTMyIG1p
Z3JhdGlvbl9wb2xpY3k7DQo+ID4gKwkJfSBwcmVmZXJyZWRfbWVtX2xvYzsNCj4gPiArCX07DQo+
ID4gKw0KPiA+ICsJLyoqIEByZXNlcnZlZDogUmVzZXJ2ZWQgKi8NCj4gPiArCV9fdTY0IHJlc2Vy
dmVkWzJdOw0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArLyoqDQo+ID4gKyAqIHN0cnVjdCBkcm1feGVf
bWFkdmlzZSAtIElucHV0IG9mICZEUk1fSU9DVExfWEVfTUFEVklTRQ0KPiA+ICsgKg0KPiA+ICsg
KiBTZXQgbWVtb3J5IGF0dHJpYnV0ZXMgdG8gYSB2aXJ0dWFsIGFkZHJlc3MgcmFuZ2UNCj4gPiAr
ICovDQo+ID4gK3N0cnVjdCBkcm1feGVfbWFkdmlzZSB7DQo+ID4gKwkvKiogQGV4dGVuc2lvbnM6
IFBvaW50ZXIgdG8gdGhlIGZpcnN0IGV4dGVuc2lvbiBzdHJ1Y3QsIGlmIGFueSAqLw0KPiA+ICsJ
X191NjQgZXh0ZW5zaW9uczsNCj4gPiArDQo+ID4gKwkvKiogQHZtX2lkOiB2bV9pZCBvZiB0aGUg
dmlydHVhbCByYW5nZSAqLw0KPiA+ICsJX191MzIgdm1faWQ7DQo+ID4gKw0KPiA+ICsJLyoqIEBu
dW1fb3BzOiBudW1iZXIgb2YgbWFkdmlzZXMgaW4gaW9jdGwgKi8NCj4gPiArCV9fdTMyIG51bV9v
cHM7DQo+ID4gKw0KPiA+ICsJdW5pb24gew0KPiA+ICsJCS8qKiBAb3BzOiB1c2VkIGlmIG51bV9v
cHMgPT0gMSAqLw0KPiA+ICsJCXN0cnVjdCBkcm1feGVfbWFkdmlzZV9vcHMgb3BzOw0KPiA+ICsN
Cj4gPiArCQkvKioNCj4gPiArCQkgKiBAdmVjdG9yX29mX29wczogdXNlcnB0ciB0byBhcnJheSBv
ZiBzdHJ1Y3QNCj4gPiArCQkgKiBkcm1feGVfdm1fbWFkdmlzZV9vcCBpZiBudW1fb3BzID4gMQ0K
PiA+ICsJCSAqLw0KPiA+ICsJCV9fdTY0IHZlY3Rvcl9vZl9vcHM7DQo+ID4gKwl9Ow0KPiA+ICsN
Cj4gPiArCS8qKiBAcmVzZXJ2ZWQ6IFJlc2VydmVkICovDQo+ID4gKwlfX3U2NCByZXNlcnZlZFsy
XTsNCj4gPiArDQo+ID4gK307DQo+ID4gKw0KPiA+ICAjaWYgZGVmaW5lZChfX2NwbHVzcGx1cykN
Cj4gPiAgfQ0KPiA+ICAjZW5kaWYNCg==
