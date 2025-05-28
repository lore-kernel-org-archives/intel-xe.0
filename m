Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B6DC3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 17:03:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653AD897E0;
	Wed, 28 May 2025 17:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CsfxUssH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CAF897E0
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 17:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748451792; x=1779987792;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=jCBJIE71BqHoIcQxG5kK+lGHgHtTyNrPwhLllwflIAk=;
 b=CsfxUssH6xxRvgtURLANcLvVL6yAtPZiLJJpjWl+6IEDdiX0woYt0VoH
 fGnBm44w+qjZ0Agwx8koedprrtCLSFzA3yFis56F67KIAwF8XndFoMoHM
 Ig31tonaC0G2TPTYi7IfMsXgci0CqBr2iRmpDXdBBT1iaWlU8kcyja0c5
 TnlFHJatVGcC/zepi33NRZWA2mE4Nps6qf2V2YDT70RICXr+khOiIYHij
 nRyatBMA+HpWeA4fJl65Ep3jVOmIvWQoIEVt+21DD8GhH63KSlmeMj4V6
 2XjWADz0s8ppHnEZBqPf8Iz5SsO94SG6flcX1Xk2TpX1etTYeGRJB3CYa g==;
X-CSE-ConnectionGUID: Fy2Ba7NCRtaS67K6oAN8Xg==
X-CSE-MsgGUID: Ov6HzzyCRxuhWz8Y5y3q4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50545656"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="50545656"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 10:03:11 -0700
X-CSE-ConnectionGUID: jOruf30SRuW4BqVziRvcmw==
X-CSE-MsgGUID: TBqa3bSmSFySRoqn6PDXiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="143927163"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 10:03:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 10:03:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 10:03:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.77) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 10:03:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qIVpD8GkRBAxVD96U8uW61WfBzFFO0WdQ2cpxInyYQ6xhmCI5urXlQiz0lw0+mgJFjcqjgHTlBV0XoIEP1+nEI2gAPuu5COOWfltei2U0Hnqlrn1uYiiWhvDfOOkuVIq2HHQ0SFTrVYGs4xObXS4qZIOfd6kPtU22ArFqapdoWvRUbYke0TLv+55B8pIzsOfR6vphv81R1RNfuk0fFtH4GD20EgQFX6v8nvvJ0kcpy5kMrv0Rqt4RwbgH3BbWnqWWIJ4+B1+4tSlVGZLtTGFceSxzZ1YLOSRVSRdtbcBOpNarRHYkVTIpVVH+aSGrz3EnP+uyl/2+/YVh2IAmgV9vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCBJIE71BqHoIcQxG5kK+lGHgHtTyNrPwhLllwflIAk=;
 b=P17H89jHS9lE4EHD1zHUGIanh2zZYiIKFD9rFs+MqKYcc+8Sjbz7VPSHKH4cDNdgn+CPtrFZYGtdJM1vZoy163oTo8gBZ+tQs1XrSXCQ4nEv20YeCnIrileyx9LecDnCw4GHqe2H095eZjkftgpcbTC9uqK4cQG6WB40HLyqloP4+udg4RUgVXgRCn0Fgw+mydi2tiTAeCGjrGGwqOwWm6nHenNPR6jtF6i20W4H8rs61PPQ7NPDmoZUEAgWlo2i1m7GotaqGAxf/y2XYijANCNvlTrNUpHtppa6nRk8gN6Z1iIEGqZOSGvm21E8qxVLngvKMgGmVhjpxwUED9fL3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DM4PR11MB6336.namprd11.prod.outlook.com (2603:10b6:8:b9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.26; Wed, 28 May 2025 17:03:07 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%3]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 17:03:07 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v3 02/19] drm/xe/uapi: Add madvise interface
Thread-Topic: [PATCH v3 02/19] drm/xe/uapi: Add madvise interface
Thread-Index: AQHbzyKoGnEKEoKA7EKZE0si4UDK+rPoRnmA
Date: Wed, 28 May 2025 17:03:07 +0000
Message-ID: <70dd9d0b7d94a81468576e51fbdcefa09e75de3f.camel@intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-3-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250527164003.1068118-3-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DM4PR11MB6336:EE_
x-ms-office365-filtering-correlation-id: 3bc4d458-5dc3-44ee-34d8-08dd9e098490
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cnFYcTBNbFBUNVQ1U0JxVCtFZEpSdzRCNURsMlpXck55THlVVmxmTDRJVnVZ?=
 =?utf-8?B?N285YVZqVXZuT3ZkakJVS0YrTUVGNUVEMTFkRlZkSkRUTGRNMTA5RkVUaFB4?=
 =?utf-8?B?bEdkQ2RlenY1TWdBMWpGWWZEejhDMVl2RExZS3N6L0lkcDRHckVjUUUrVU44?=
 =?utf-8?B?dVdpTVAvS242NHJpaE9GamVSanNPNyt0dEhOVGhaMnJOWUJqaURxYWw0NFk4?=
 =?utf-8?B?TWpRWlI3NnVudHR5T2EzSTh0RGVWbmFhdjJZYyt0VnRoNytNUXhrZjhmNmlx?=
 =?utf-8?B?TGVEbUpUbWkrZ05vZERJS1FiNnlyc0wxY0EvU0ZMdUg0dEpqeTJiSE9KdzRK?=
 =?utf-8?B?UEEwL01VU3VydjVQb3FJR3YxSmNoZE56bE9IdU1KYXJ5MVg2anVsUXhGMnNL?=
 =?utf-8?B?TTRkOW5WUHVVYTk2YXdvUE1NT1V0RGlvV3VKUURTNVM2S1hiUDlJU0Q2UEJ2?=
 =?utf-8?B?OWljQ2VUR0IzVVNDRDV2bVdZZVFVMVYvVXR6QUFLbUJ2Q2tlZUZ0ZDcxOTI5?=
 =?utf-8?B?YmY4T0tBcW1FOGYrMVl1TE1WcVNTQnd3VWhmMXFxcWtKU2xrWFVQVkdSd1gy?=
 =?utf-8?B?enRxRlZhcnZ2TExUbnRsUjJ2V0xHTTJzdG1aN2lHVWtieUwrN0UzdjZOSkdu?=
 =?utf-8?B?YmQrd2lVc0xQeUo4czlkcGQzY1R3bmtieHNNajQ2d3dlUWRyUmRkSGdicXdp?=
 =?utf-8?B?VkJSemZvcWVqdTdDZXZhQUhVWFdIaFZiK2JqdElPcWZMbDFldXpnUTJEM2xN?=
 =?utf-8?B?MjZFMkZKT3N2K3EwZkV4U2NzWWFqcGU3bjNFckdUMmxXQzViTTJQeFgzVm1V?=
 =?utf-8?B?QytVeHdLSzlTSmcxY21xVW94a2ZBUzBmVThDNm1Hb21RUThOdHNvVnFWRWhT?=
 =?utf-8?B?UmRHUjNTM2J3LzAzNjUzRjlxTEp2eUdobFc5RFFwVHcybk1LTG9wVVhnenZW?=
 =?utf-8?B?Sk8xWW4zaWJXdm9Bd05Jb2poR3dnS1JKR2o2bDNTdTg0cVg5NGFWd2ErWlhM?=
 =?utf-8?B?WWI1bXJwNWZ1L1E4QWh0Z3RiUlF5Z3U3SElwZ0NsbVFDYUhDZkJ4M0hMYzl1?=
 =?utf-8?B?Q1RGTm5FR0hvZFY2V1lvMi95U3k4Yy9TaHV1d0NvMUtwNDBibFpUNWFVd25y?=
 =?utf-8?B?ZHVDMUwyOFRBMjVubTMvUFFkQU1Za2xTajYyWDdaOHEyQXQvZVdDRlVvOFJh?=
 =?utf-8?B?UFltWGJjUE5KQVJmRUplRnh6MkxSQXJPOE9sQklSRDB5NXJRUXZyeElsdnR6?=
 =?utf-8?B?bHdFYWZqRWxRUVl2a0dBaldXdXorWDJOSVRWVHcvaXVob3JLQVI1Kzg3SUxk?=
 =?utf-8?B?OWpaRnBhRjhrMEZIUmxYdFM2TWxVN3gyU2FFVWN6RnJpckpHVnR3MTRTbHpR?=
 =?utf-8?B?RzIwbzZTc25vWFExcmthdVdHcEV2OUwxQjFIc0FIbkc1VDdFOFFBU3dxUkI3?=
 =?utf-8?B?eWkzTjZiRXFpQW5UUFVPbS9JZlVML3lvOURQeTM1UWlLb0d0U2tSSEFpN2U5?=
 =?utf-8?B?dDA1UUk0N1BXK1FRRm9IOUJVaEhaNkpERytya1lrSTVzTW14d3JkaWZnUjZN?=
 =?utf-8?B?bXA4SEhJU25iSSt2Z2Z3Z3lNbkJPSjNvaUlwU2xJelU3bUFzN2d6Y0pLa3lK?=
 =?utf-8?B?ai9lWk5mT3htV2cxTmFtaXhzc1NZbUhVSFFRSFVuaTBVMFdmMFhEZk5STXVX?=
 =?utf-8?B?eSthbXBySC9GcitVUEVQWDRqaFZxaFZRWFNvSXpxUUxrelplR3BseGhUWkt0?=
 =?utf-8?B?OCtMbXQ0Tm9mZEJMWlRabDRmZVNQS2wranYrZ2ljUU5kbURwUXliOWNHRWNo?=
 =?utf-8?B?VWFCUDlaNG96R2pVWWJyZVZJRXQySzNwR1JwRjBZTW5DR1BWRUxBNjVDcWlT?=
 =?utf-8?B?Y2ZPV2dUdlR6OHkwZ29za3I1bVRHVmFBVytQU2FRWkZxQ2J6Q21WeCtBcDlJ?=
 =?utf-8?B?Tm1aOWpKNG8yUlF0ZktQZHUxY1VEa2lBUXJ3U2VxQndEQStYVUVJQUNoVzJJ?=
 =?utf-8?B?MTRISnpmWkV3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3Q4WkhuTjdXREN1elpPcUFpdm9yTzZyOHVjMUVwOERSVkc3ZzBOYkpSb0pF?=
 =?utf-8?B?ZWJsQ1ZQM0FidGN2amJGMWtkSXVCRXhXWEhNbm42Y3FvRFFseExPOFcyMSty?=
 =?utf-8?B?WGl3RDVRL0dHcGtQZExzRm9WbUwxODZVWllIZjhFeFdXV1R6UjUraUxhcXZk?=
 =?utf-8?B?Q3RWcDFkcnNOSS8zS1ExWDk0aDVzQlFiUFJTQWlBM2drMkFVdkIvZFcrSk1y?=
 =?utf-8?B?WUx3TVR5KytwcmN6NHpBY2N4N3FuV1MrNGxUWGVHaWdGMDFvSmNTMStEQ2pF?=
 =?utf-8?B?REtnWlNiZHVVcGxMeWQyYnJ0T3Y3aHd3am0yUVNENUhoMzFsa2xaM2N6S2or?=
 =?utf-8?B?RnBHNzZ2cy9DdUVxV0kwMGltd3dyTU82UEJOWWRqcXNnYXMxdWtpbzY2WGVE?=
 =?utf-8?B?YXl1a0EzUUY4YzdGT0xpcWhIcmtGT0Z5eEp3T3ErL1FEVERQNnIrb3ZnMzEz?=
 =?utf-8?B?YjY2WGV0UGQ5dkJSOUJLYy85YS80anVsWjgwQlQ2cEhpN0J6Z25Mc21iazgz?=
 =?utf-8?B?d1BmZ3RFaDBhYnprQllqRkw0SGNuTnh6MVN5bzQvcVN4N3hJbVNFbHh3cXRr?=
 =?utf-8?B?Rzdvdlg0aElFVWwvcWRHVVprRW5FbERGOEZ0U0FJTmVsMEhaeUJmQ3ZZSy9I?=
 =?utf-8?B?aGk3M2tvekM5RkRsZzExYVJxZ1J6NDRKRW9qSnVXd3orb21aVXkyMUppYzg0?=
 =?utf-8?B?eVM2dVNUWEkrK0Jrang5dnBoOVMvbGhEcnExUWRqemNPQ3REUFJTWWd4QUVi?=
 =?utf-8?B?ZXRvdEhZNkE2SlE4TE9iWlZmeXRGRy9mbTZaaU9QZzJqQThTeFFJOTBtVzZI?=
 =?utf-8?B?bElwTTN6NVNQbTJUYjZ4b29yR1VJYzNXaW1QcnBLVzJUcFJHZVR5QWNId3lO?=
 =?utf-8?B?dnY4cFVkSHZuSVY5RFYrL1lxclphSEN6V21xaG5aY1ErRnNrUTVOVllwejNH?=
 =?utf-8?B?Y1RzdnNIRzdoQ3UwUGRWMGw2bTA1WndrTFExRzNmbWRqVURERk9DdS9xcDNS?=
 =?utf-8?B?aWZNcWlWeDlCY3Jzd2d0TVJjU015ckYzQWNENFJreXY5YzJ6YWhYLzBmdTVU?=
 =?utf-8?B?bzF0d3ExTngvTVI4bjc0aEp3bkZpS2JWRWQ5Wlo4L2FBUmxNK3RFaUVTMmQy?=
 =?utf-8?B?WFZ5cENySStKRnExbVl6dGgzV0pIaGxqaG94Y3VHeGdsSWdtc1RheWpncDJN?=
 =?utf-8?B?RHlacFQ3RlJuamtzNTgxdEZ4cjRSTEhzeUEzd2lxUTZJSkcwbTlxblVvV1lM?=
 =?utf-8?B?QWt2c3hPNkhoNytUL3ZLdTNrR01MWG9NM3cveTBjbVBUbVlhVVd0eTRCK3JK?=
 =?utf-8?B?NG5CRDZ0emtqaVkvdERrc0Jtb0RyMGJLL0E0UjkrMXF0UkRRSmNrY1hLU092?=
 =?utf-8?B?cVdtbFhpS0dTZGIvTGlJRWlGMHNRRlNCa3RPWnlwRWtHNGFDS0hQVXJuSEJs?=
 =?utf-8?B?S3lZQjNLU2x1cDhZQkd5WWNXNm50SGlVODlMTVp0bllNVDlyOWtxclJxU1d5?=
 =?utf-8?B?VVJIaG1QMlM0c0J5THZPeVpqd2xidWRkTEZrcy90QWRabytrU3B4ZHBMSTNv?=
 =?utf-8?B?ak5Vc04xcU9GeGRsK1hFcTNEUGFSc3cyODZKRmN0UzFXcDEwY0tOQmdYNnpq?=
 =?utf-8?B?TGxjbjVaZkxtWjVwRi9iQTNZMlVUWWc3Yk5FdGJ3NTRneTFERWt3Z2F5YmFQ?=
 =?utf-8?B?UWlEdkFhNHk2WS8xSnBFS2dOL1FuY1pQT3lpeG9BSnJ5Q29OV1VhQjZITFA2?=
 =?utf-8?B?VHJwT0VLbEUyWWpYQW5iWExhRHIvanlxNmd2SDFLbmVaQkVRSFhTamVTcWR3?=
 =?utf-8?B?RTRUWkZWSW1SMU9LT25tTU03Smp1dms0a2F0UjdpaXYvdzNxWEM5RklLVElv?=
 =?utf-8?B?ZDZmNnQvN1N5bmNnM3JiL0pKNDdOM0Z0T2FVdGNQbjJmcmNXSGtGSENVbjFy?=
 =?utf-8?B?alpVZnE1UklPdkRNSndHaS9taDMvc1B4YTJpendrMmVOSnQ5RWNoVmltR3Jq?=
 =?utf-8?B?VnVPcXpLZ3prekJvaW9NVFRacHpiSjhCZTZRYnFNWEp3czFzUkg2UFBDS0Mv?=
 =?utf-8?B?UjVpS2Uzc25Fbm1GaDBlaGsrdWVJQjcrRFBVcTQ5Y00yeitkMlF5NEdDVVlL?=
 =?utf-8?B?aUQzQmhwR25wMk00eXBNVFI1YzI0c0k3dlF6anE3eXBCUm8ybERMK3g1WFdT?=
 =?utf-8?B?d1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <22BBC88CA6C33F4EB0AD9A1AE9F17695@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc4d458-5dc3-44ee-34d8-08dd9e098490
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 17:03:07.1802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l0NY0Y4ocbKGLCdncOySTAhwm727bl1IseT3p1X0A3iECCZIjA7y9k/BR6auI4Jza0RjmrHl7Gaj2/xk5+4Vog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6336
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

T24gVHVlLCAyMDI1LTA1LTI3IGF0IDIyOjA5ICswNTMwLCBIaW1hbCBQcmFzYWQgR2hpbWlyYXkg
d3JvdGU6DQo+IFRoaXMgY29tbWl0IGludHJvZHVjZXMgYSBuZXcgbWFkdmlzZSBpbnRlcmZhY2Ug
dG8gc3VwcG9ydA0KPiBkcml2ZXItc3BlY2lmaWMgaW9jdGwgb3BlcmF0aW9ucy4gVGhlIG1hZHZp
c2UgaW50ZXJmYWNlIGFsbG93cyBmb3IgbW9yZQ0KPiBlZmZpY2llbnQgbWVtb3J5IG1hbmFnZW1l
bnQgYnkgcHJvdmlkaW5nIGhpbnRzIHRvIHRoZSBkcml2ZXIgYWJvdXQgdGhlDQo+IGV4cGVjdGVk
IG1lbW9yeSB1c2FnZSBhbmQgcHRlIHVwZGF0ZSBwb2xpY3kgZm9yIGdwdXZtYS4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEhpbWFsIFByYXNhZCBHaGltaXJheSA8aGltYWwucHJhc2FkLmdoaW1pcmF5
QGludGVsLmNvbT4NCj4gLS0tDQo+ICBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oIHwgOTcgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwg
OTcgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0veGVf
ZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+IGluZGV4IDljMDg3MzhjM2I5MS4u
ZTBkNzUyMjZhNzI0IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+
ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gQEAgLTgxLDYgKzgxLDcgQEAgZXh0
ZXJuICJDIiB7DQo+ICAgKiAgLSAmRFJNX0lPQ1RMX1hFX0VYRUMNCj4gICAqICAtICZEUk1fSU9D
VExfWEVfV0FJVF9VU0VSX0ZFTkNFDQo+ICAgKiAgLSAmRFJNX0lPQ1RMX1hFX09CU0VSVkFUSU9O
DQo+ICsgKiAgLSAmRFJNX0lPQ1RMX1hFX01BRFZJU0UNCj4gICAqLw0KPiAgDQo+ICAvKg0KPiBA
QCAtMTAyLDYgKzEwMyw3IEBAIGV4dGVybiAiQyIgew0KPiAgI2RlZmluZSBEUk1fWEVfRVhFQwkJ
CTB4MDkNCj4gICNkZWZpbmUgRFJNX1hFX1dBSVRfVVNFUl9GRU5DRQkJMHgwYQ0KPiAgI2RlZmlu
ZSBEUk1fWEVfT0JTRVJWQVRJT04JCTB4MGINCj4gKyNkZWZpbmUgRFJNX1hFX01BRFZJU0UJCQkw
eDBjDQo+ICANCj4gIC8qIE11c3QgYmUga2VwdCBjb21wYWN0IC0tIG5vIGhvbGVzICovDQo+ICAN
Cj4gQEAgLTExNyw2ICsxMTksNyBAQCBleHRlcm4gIkMiIHsNCj4gICNkZWZpbmUgRFJNX0lPQ1RM
X1hFX0VYRUMJCQlEUk1fSU9XKERSTV9DT01NQU5EX0JBU0UgKyBEUk1fWEVfRVhFQywgc3RydWN0
IGRybV94ZV9leGVjKQ0KPiAgI2RlZmluZSBEUk1fSU9DVExfWEVfV0FJVF9VU0VSX0ZFTkNFCQlE
Uk1fSU9XUihEUk1fQ09NTUFORF9CQVNFICsgRFJNX1hFX1dBSVRfVVNFUl9GRU5DRSwgc3RydWN0
IGRybV94ZV93YWl0X3VzZXJfZmVuY2UpDQo+ICAjZGVmaW5lIERSTV9JT0NUTF9YRV9PQlNFUlZB
VElPTgkJRFJNX0lPVyhEUk1fQ09NTUFORF9CQVNFICsgRFJNX1hFX09CU0VSVkFUSU9OLCBzdHJ1
Y3QgZHJtX3hlX29ic2VydmF0aW9uX3BhcmFtKQ0KPiArI2RlZmluZSBEUk1fSU9DVExfWEVfTUFE
VklTRQkJCURSTV9JT1dSKERSTV9DT01NQU5EX0JBU0UgKyBEUk1fWEVfTUFEVklTRSwgc3RydWN0
IGRybV94ZV9tYWR2aXNlKQ0KPiAgDQo+ICAvKioNCj4gICAqIERPQzogWGUgSU9DVEwgRXh0ZW5z
aW9ucw0KPiBAQCAtMTk2NSw2ICsxOTY4LDEwMCBAQCBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X2V1X3N0
YWxsIHsNCj4gIAlfX3U2NCBzYW1wbGluZ19yYXRlc1tdOw0KPiAgfTsNCj4gIA0KPiArc3RydWN0
IGRybV94ZV9tYWR2aXNlX29wcyB7DQo+ICsJLyoqIEBzdGFydDogc3RhcnQgb2YgdGhlIHZpcnR1
YWwgYWRkcmVzcyByYW5nZSAqLw0KPiArCV9fdTY0IHN0YXJ0Ow0KPiArDQo+ICsJLyoqIEBzaXpl
OiBzaXplIG9mIHRoZSB2aXJ0dWFsIGFkZHJlc3MgcmFuZ2UgKi8NCj4gKwlfX3U2NCByYW5nZTsN
Cj4gKw0KPiArI2RlZmluZSBEUk1fWEVfVk1BX0FUVFJfUFJFRkVSUkVEX0xPQwkwDQo+ICsjZGVm
aW5lIERSTV9YRV9WTUFfQVRUUl9BVE9NSUMJCTENCj4gKyNkZWZpbmUgRFJNX1hFX1ZNQV9BVFRS
X1BBVAkJMg0KPiArI2RlZmluZSBEUk1fWEVfVk1BX0FUVFJfUFVSR0VBQkxFX1NUQVRFCTMNCj4g
KwkvKiogQHR5cGU6IHR5cGUgb2YgYXR0cmlidXRlICovDQo+ICsJX191MzIgdHlwZTsNCj4gKw0K
PiArCS8qKiBAcGFkOiBNQlogKi8NCj4gKwlfX3UzMiBwYWQ7DQo+ICsNCj4gKwl1bmlvbiB7DQo+
ICsJCXN0cnVjdCB7DQo+ICsjZGVmaW5lIERSTV9YRV9WTUFfQVRPTUlDX1VOREVGSU5FRAkwDQo+
ICsjZGVmaW5lIERSTV9YRV9WTUFfQVRPTUlDX0RFVklDRQkxDQo+ICsjZGVmaW5lIERSTV9YRV9W
TUFfQVRPTUlDX0dMT0JBTAkyDQo+ICsjZGVmaW5lIERSTV9YRV9WTUFfQVRPTUlDX0NQVQkJMw0K
PiArCQkvKiogQHZhbDogdmFsdWUgb2YgYXRvbWljIG9wZXJhdGlvbiovDQo+ICsJCQlfX3UzMiB2
YWw7DQo+ICsNCj4gKwkJLyoqIEByZXNlcnZlZDogUmVzZXJ2ZWQgKi8NCj4gKwkJCV9fdTMyIHJl
c2VydmVkOw0KPiArCQl9IGF0b21pYzsNCj4gKw0KPiArCQlzdHJ1Y3Qgew0KPiArI2RlZmluZSBE
Uk1fWEVfVk1BX1BVUkdFQUJMRV9TVEFURV9XSUxMTkVFRAkwDQo+ICsjZGVmaW5lIERSTV9YRV9W
TUFfUFVSR0VBQkxFX1NUQVRFX0RPTlRORUVECTENCj4gKyNkZWZpbmUgRFJNX1hFX1ZNQV9QVVJH
RUFCTEVfU1RBVEVfUFVSR0VECTINCj4gKwkJLyoqIEB2YWw6IHZhbHVlIGZvciBEUk1fWEVfVk1B
X0FUVFJfUFVSR0VBQkxFX1NUQVRFICovDQo+ICsJCQlfX3UzMiB2YWw7DQo+ICsNCj4gKwkJLyoq
IEByZXNlcnZlZDogUmVzZXJ2ZWQgKi8NCj4gKwkJCV9fdTMyIHJlc2VydmVkOw0KPiArCQl9IHB1
cmdlX3N0YXRlX3ZhbDsNCg0KVGhlIHNldCBwdXJnZWFibGUgdUFQSSBsb29rcyBnb29kIHRvIG1l
LCBzbyB0aGlzIHBhcnQgaXMNCg0KQWNrZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpv
c2Uuc291emFAaW50ZWwuY29tPg0KDQo+ICsNCj4gKwkJc3RydWN0IHsNCj4gKwkJCS8qKiBAcGF0
X2luZGV4ICovDQo+ICsJCQlfX3UzMiB2YWw7DQo+ICsNCj4gKwkJCS8qKiBAcmVzZXJ2ZWQ6IFJl
c2VydmVkICovDQo+ICsJCQlfX3UzMiByZXNlcnZlZDsNCj4gKwkJfSBwYXRfaW5kZXg7DQo+ICsj
ZGVmaW5lIERSTV9YRV9QUkVGRVJSRURfTE9DX0RFRkFVTFRfREVWTUVNX0ZEIDANCj4gKwkJLyoq
IEBwcmVmZXJyZWRfbWVtX2xvYzogcHJlZmVycmVkIG1lbW9yeSBsb2NhdGlvbiAqLw0KPiArCQlz
dHJ1Y3Qgew0KPiArCQkJX191MzIgZGV2bWVtX2ZkOw0KPiArDQo+ICsjZGVmaW5lIE1JR1JBVEVf
QUxMX1BBR0VTIDANCj4gKyNkZWZpbmUgTUlHUkFURV9PTkxZX1NZU1RFTV9QQUdFUyAxDQo+ICsJ
CQlfX3UzMiBtaWdyYXRpb25fcG9saWN5Ow0KPiArCQl9IHByZWZlcnJlZF9tZW1fbG9jOw0KPiAr
CX07DQo+ICsNCj4gKwkvKiogQHJlc2VydmVkOiBSZXNlcnZlZCAqLw0KPiArCV9fdTY0IHJlc2Vy
dmVkWzJdOw0KPiArfTsNCj4gKw0KPiArLyoqDQo+ICsgKiBzdHJ1Y3QgZHJtX3hlX21hZHZpc2Ug
LSBJbnB1dCBvZiAmRFJNX0lPQ1RMX1hFX01BRFZJU0UNCj4gKyAqDQo+ICsgKiBTZXQgbWVtb3J5
IGF0dHJpYnV0ZXMgdG8gYSB2aXJ0dWFsIGFkZHJlc3MgcmFuZ2UNCj4gKyAqLw0KPiArc3RydWN0
IGRybV94ZV9tYWR2aXNlIHsNCj4gKwkvKiogQGV4dGVuc2lvbnM6IFBvaW50ZXIgdG8gdGhlIGZp
cnN0IGV4dGVuc2lvbiBzdHJ1Y3QsIGlmIGFueSAqLw0KPiArCV9fdTY0IGV4dGVuc2lvbnM7DQo+
ICsNCj4gKwkvKiogQHZtX2lkOiB2bV9pZCBvZiB0aGUgdmlydHVhbCByYW5nZSAqLw0KPiArCV9f
dTMyIHZtX2lkOw0KPiArDQo+ICsJLyoqIEBudW1fb3BzOiBudW1iZXIgb2YgbWFkdmlzZXMgaW4g
aW9jdGwgKi8NCj4gKwlfX3UzMiBudW1fb3BzOw0KPiArDQo+ICsJdW5pb24gew0KPiArCQkvKiog
QG9wczogdXNlZCBpZiBudW1fb3BzID09IDEgKi8NCj4gKwkJc3RydWN0IGRybV94ZV9tYWR2aXNl
X29wcyBvcHM7DQo+ICsNCj4gKwkJLyoqDQo+ICsJCSAqIEB2ZWN0b3Jfb2Zfb3BzOiB1c2VycHRy
IHRvIGFycmF5IG9mIHN0cnVjdA0KPiArCQkgKiBkcm1feGVfdm1fbWFkdmlzZV9vcCBpZiBudW1f
b3BzID4gMQ0KPiArCQkgKi8NCj4gKwkJX191NjQgdmVjdG9yX29mX29wczsNCj4gKwl9Ow0KPiAr
DQo+ICsJLyoqIEByZXNlcnZlZDogUmVzZXJ2ZWQgKi8NCj4gKwlfX3U2NCByZXNlcnZlZFsyXTsN
Cj4gKw0KPiArfTsNCj4gKw0KPiAgI2lmIGRlZmluZWQoX19jcGx1c3BsdXMpDQo+ICB9DQo+ICAj
ZW5kaWYNCg==
