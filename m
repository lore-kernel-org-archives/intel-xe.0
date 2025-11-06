Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7EDCCFA13
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 22:05:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE20210E5A6;
	Thu,  6 Nov 2025 22:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E6OuZHf9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA6C10E5A6
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Nov 2025 22:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762466707; x=1794002707;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Bu7v36pGQF106uIikVqmnO/HKB0PS5bnYDLkvjtC7wg=;
 b=E6OuZHf9D1P699RJkwO9dtgpN//0zoHEYHbYkzh+pRJWytxboAy2xG6E
 V/oUQaAZhqT57nvDqSIlEFxCjU3YWrcIDDw+sNZ8tHOyw7MJmbyCmZYf6
 bTlJFHHwQkzOeIegkkDUnga3vQ7nsGFY+SqN8nAQ3Of8TGaeEoAudrOqw
 26JG1AqsdkvqLpbA6DJcBn0he3q12okIX0vkfpcw2+tGlILucVOkFhLhQ
 Plc9xIvrVJ5a/IyYU/ANYjoxB6oYm05kbahx7Nb91NdI+Psm3xIaiTh4/
 QB/5+7bFdme5fpPWeN4h3PiF+uQ3Ecd99KuUhq/sHezYzSW6FzusBx/ed A==;
X-CSE-ConnectionGUID: 922kDQ2CTFKQ/2WO/woqSg==
X-CSE-MsgGUID: HDEKaa8URd+ybKcVhuzIiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="76066388"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="76066388"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 14:05:06 -0800
X-CSE-ConnectionGUID: 1MUgt82fQo+HibZbMZlwWg==
X-CSE-MsgGUID: fSL5e0b5SwCwSaRzyx159Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="218531816"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 14:05:06 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 14:05:05 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 14:05:05 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 14:05:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SMur+2hPIztdlTGA6VIAdzXOihVq3GdE2Rcp3q/HyJ44VAiDFHIF+bEu/WYvKUQCkg5r1qhYFOjYOu9v1XdsUbP2AoHJKZ2cVZmjCLjijXo8+TSXx9RFE3pDeNWJOiAXs0kwTX28+pjRiWdUsVLxPj6PLay6DYgrKP7ClG+j1gcmPB5rsWOSNyxasgqACniUUAIL7GGbDNUyucgtFB9m9B2yDzlbFO0Ht5dzHpYdhh5C3VvoNVfjHd7YCySwTnFfCuHWg00HjDtG/Igs/X70HC0VA18uurawLGnfhmxKymEGl5Wg7AtxO8jLymQRyZqwQZ43qkH2P7lufjbaXps4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bu7v36pGQF106uIikVqmnO/HKB0PS5bnYDLkvjtC7wg=;
 b=rMFjrN0tEqKr0OHeK4z3S+Lrm8858XtzDJgSaS1lvxnBpnJl6RF7VCsyuAA3jKiUMt2mdC4PPBJGCUvdWJP0iZyqNpJHat3RJei5hw0AmFYp7H4IGpoMOlOCQzEBCJfg73KQPVqmbKnDqlr7OfC3O1PpevVTKNUDprl3pTgDlQEnfrRWDovaUBAEm228Q2ztnquddF8MEVyrGn+68Lp77j+Wq4NYR39ZecyFnV1URKineSTAcbeF9JF4X2mbF6whMWsgYzQVMeMvz3I8+XElAkOR9Y/KrSHnM7MrOLjdQDuG8StXjbfxkXRjoyaWSpjAZNLMpvx5ekoSGLIaFULhhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM3PPF777B3455C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 22:05:02 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 22:05:02 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 06/12] drm/xe: Do not forward invalid TLB invalidation
 seqnos to upper layers
Thread-Topic: [PATCH v2 06/12] drm/xe: Do not forward invalid TLB invalidation
 seqnos to upper layers
Thread-Index: AQHcTcUgfaWwF48H4E6H1G3O5viatbTmNz0A
Date: Thu, 6 Nov 2025 22:05:01 +0000
Message-ID: <7f24c5e38256edad7efd007d45620b72e5e1c1ab.camel@intel.com>
References: <20251104195616.3339137-1-matthew.brost@intel.com>
 <20251104195616.3339137-7-matthew.brost@intel.com>
In-Reply-To: <20251104195616.3339137-7-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DM3PPF777B3455C:EE_
x-ms-office365-filtering-correlation-id: d420e352-0587-495c-ce72-08de1d8088ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?OGs3R3p4R1V2VXNEMG9GS0s3a1QwNjlyem9lSlpmdXdzaHNmQW1kclpDdmEx?=
 =?utf-8?B?QVlTUVdJL05xbnN4NExmdGVZWWpScEVsR3NrWkhtbCtqck5LMXN4R242U3dD?=
 =?utf-8?B?dGI4TEdDR2hVV2FkUklSMVdOVkFJcjBSbUtrNWpxcmFLcjdzU3Z1L0I5dkNy?=
 =?utf-8?B?NmswQTBWN21hWE9lSzV1cmNlS0JRU0oyYnlzMGNaekFGU1poUXJ2cFc3ZEZS?=
 =?utf-8?B?WDBndkIzQXZ2anRxN0MzT1crcm1XcG1jRjdxUnRqNmZQUmJyNmVyTjhaaWt1?=
 =?utf-8?B?WE1VR05jaWYxOC9sV2VxbGFOMWMvQUZOQ0pJVW8xb01sTnUzdHU5SWVkdjFB?=
 =?utf-8?B?TkV1MHdKRmt5SnlXUHdFaHNtWHVrTmRhaUtzcitTWjhGb1hXSS91YVlxM0ZB?=
 =?utf-8?B?eVZuM2V2TGNaOWIzWXAyN0xiZytxWi9Mb2FOT01WU0ZlMkdiVjN6L2lLbGRR?=
 =?utf-8?B?ZktCWVd3T3hJYTdKMmtUR1ZqaFZnYjd2MmNhY3ZLdWJ1MVR0SkdIN1lQQklG?=
 =?utf-8?B?SzV1LzVXcVI4azY3a2RJNGhkTkdBTEhJeGtHbTFpOTlBMWJyc29vYkRFVjFm?=
 =?utf-8?B?amFvbHV5ZGpDdzFKTE53VnQ2SW85MldVZG5sQnJKbzlTdW0raXd2L2Q0TmF5?=
 =?utf-8?B?R254N3FjSzIzWHhrZUlOVDM2VCt5U3VwanRQYWU2UDBpc0xiVjcraDF2bkRz?=
 =?utf-8?B?NHErY0lEemZNN09ZcVFsTnErUkE2bG1sUVh4aXpqRVVycmRXNHc0TGZPc0RD?=
 =?utf-8?B?N2wwUXZoQjdENmNnWUlyU01qZTJ3UjEwSklYUHBQcWFVZzcxeXIzOEdnODlY?=
 =?utf-8?B?dWw0WktoU1RrYTRzSmJGdEt0aXp5bElodldtWTIyYkxydC9XSnZHTjVnS3kr?=
 =?utf-8?B?VkF6NFkrUjIvLzROUjZNaG9HZ1M4UmJJbkpJRWdLWEcreDRCaHBMY2hoQ3Bx?=
 =?utf-8?B?VFBUUXlWWFd1Z2JTREpjanRobkxUTVAzNzVyb2NvMjIzdjRHbFFiOTB0TzZQ?=
 =?utf-8?B?NHRBTGxUektCRkx2UEFlN2tDUlBCelJDTFNSNC85Z1FXbUpOSmFXYi84NDZ2?=
 =?utf-8?B?Vms5b3lCd2xjbUsxUjlXU2gwOGpnQVZxZzk2T0lDM1JYNjAwK2N5eE9kK21B?=
 =?utf-8?B?UDJSNHlhazRNSVlqbWlCOWdDeWJkRDhNbXFEbnoxekRKTk54ZkwyZHZ3WWdi?=
 =?utf-8?B?ZzhvU2JVYnc3VDIyUUFLMXN4WnZvOFlZWGVMOFI5R2xiNDJhRWZieFZZbVRS?=
 =?utf-8?B?YjR6M3UzMFEwMmQwK3FHUkx6L1JUZ241VUFLTGZhR09JN2VUZ0o3UzE5N29F?=
 =?utf-8?B?Y1JhQjhzZzlmblJnZ2pwTkxxcHpEMjBmcE1iUnhiNEE2VkdQVksxS29YZlU5?=
 =?utf-8?B?Ky9lanZHWlN1VWVrbnUzNVgvYldpcG1Ea0JsYjFFUEZoem9Ia1JGMEJmUC9H?=
 =?utf-8?B?amZYUE84alYrWnRHeVAzcmFlR053WllwTkU1OVBFOU9EREVpV1NNaU9DUDAv?=
 =?utf-8?B?RmtjbitsMjJXSG1ZMEk0MVhWa0NjT21BR2FjMitWS2d2SCt3YXpTLzRLK1Bv?=
 =?utf-8?B?SVNCVjJyenlaaU1jMHBodzd1Zko3djdkN1JMcWY0Y2NBbGsreGxicmFDMEtU?=
 =?utf-8?B?YWRaT1NwOS84a2laUlhRclFkRU5hL3EwcXZQS3ZnZGJpUGc3NHB3Zy9yNnMy?=
 =?utf-8?B?UWhWL1pUU3FNazlhTzl1WmY3UkR0SGFsUWdRYkxsbFV2ZmZWanpXaFNjWFhP?=
 =?utf-8?B?TUJaNjJqOUlkSk9PaWhFUkllRWFtSVE2QWRnMG1TU0l3TDEvUUczU2pxdy9T?=
 =?utf-8?B?V1hHY2N1d2ZndndrbGxQVEhNOHI5U2IxNytxV3ZPWUpicFJPMjZWeDZuV2kw?=
 =?utf-8?B?WmJGUGNaVUl5dmpUTmVIdlBCQXM5ZS9vRFNPVE9oOVEzbkFsNklUakRvUFVp?=
 =?utf-8?B?Znp0VXl4R1BPS0lPTEpjajQ5ZmZtY0lOUW56aFF1LzNCNzlMSGRWb1ByS2hr?=
 =?utf-8?B?dUUrbS81WUJYektlNFNwWHAvZEFTRGo4QmxaUFZqTnNIbjZ3MFEzR2NlYTJX?=
 =?utf-8?Q?9zx1rg?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDhSQjg1QXBGaWc2U3lmRHN5T1ZlQTFROWwwVFZuTW1vU3hqd0ZVSVNKMHlU?=
 =?utf-8?B?U2VTVkpxN3I1aFJrbXRVY25NNmpQTDQ0OS9DZ0hCRFRKZGk0V0ExZjMrWWtF?=
 =?utf-8?B?cE0zZy94ZWE5cWlFbVpQTTRHWUtFV3N3WVpGMmJwZFg4dUM1ZXAva0xHUDYw?=
 =?utf-8?B?aEhxWm5mZk1vc3BKMDQ0VytLWTRSWnVXdCtJUy9QaGR2OTB6UTY2aTAwbFRj?=
 =?utf-8?B?bEFNODdSa21DVk5nOVJCNXB0MU5VaVZ4V0RrQjV1QTlIQkNUTVRHOXhRd1Nu?=
 =?utf-8?B?WHpRUHdjSWFaMEpjbStFdTlQMUEzQTBMb0F0eE5lRjZiNVlqN2NWalFyQldU?=
 =?utf-8?B?VER3TmQyeGg2VlZaQnI0dkpsU21FY2FJRXRBNEhaR1kzdER4Y1RDd2pqQ2to?=
 =?utf-8?B?bHFmRzcyZ0FqQXJKbEl0a3pkMlppYkp0cmVXM3V6SVZ1OVRnK0Q4MWV0QzNQ?=
 =?utf-8?B?azVRRWlkRG9Oc1o0UTZrN3dnaXlxWWZ6dXhENEFLT1orajVudjdsR0pHZWFY?=
 =?utf-8?B?czFxREhya3RkZVR5WEdWVjdQTEN4OVNCR2lhdTlFNFJDTXdWSWd5a3FaR1Ax?=
 =?utf-8?B?bGhRNW84OGkrZ0Fwd1FCR0VXWDFoT1MrbWozd2NIck1RVDNzeEY1N1I5ZCtP?=
 =?utf-8?B?VU8vdFRPZGFtME9OclJua3NqTUNHQURNWVI0VTl0WEdkTGZiTFFVT0MyUSt0?=
 =?utf-8?B?ZnVCQ0RJbmV4YUFmT1JiRE9meHNnNSt3SlU5UEFJVWVyUlJSQXNEME1PbFlD?=
 =?utf-8?B?ZEI3ZFNYem1uU0N4NVA3RzViY3JaQ2NSdiswOE5EMm9waTJNMWE5cWRDenNO?=
 =?utf-8?B?SXNrWDFJUmFWM1Y3SmdwSWVCQS9YTGxMdDhMZFhrYnNNazhCYXcxdThlNVd0?=
 =?utf-8?B?T0RUWDJuZjlmbmNpU0RBdkRZQ1c3NlE0dTFMY3lmVHI4VHJQTUJiNThiN2xx?=
 =?utf-8?B?VUNHT0I4SWNGRFBrd0h2RGNQZ0VTZVJJSE9mbk9FSXVwS0FuMWNOaE1iY1hQ?=
 =?utf-8?B?ck53ZUcvT3p6VEJGYWx5clBUR2xuZ2ZMamlkU01JWXJ4ZXdYY1E4UW1aR0h0?=
 =?utf-8?B?b1JoUXlPTDlWdWRZQ25IL3c4VS9KbnZsQjdTenpVODgzcWRvNWxtaEgwSVhs?=
 =?utf-8?B?enpHc241ZFFzRDlXRVFLNlhidXYzVEh6a2krcUNIcEQvVC9TUUh5dHhXVjk4?=
 =?utf-8?B?d3BkcFVUWnpvSDNvMzFIVFBRREF6cWg5elpJQU5GR2ZmUk9MblZ0Ylg0VEk2?=
 =?utf-8?B?K01vdUQzcnJWZmRNa3p3djFqWk1nNWN0d1RwUE03RG5yOWJyazRkdHVhZjh0?=
 =?utf-8?B?d2hSQzhLT1RJTzQ3UDVlY1BkOWg3NEUwVXpQbGp3bDdvU0drR2JIbXkvcmFM?=
 =?utf-8?B?cVVNSUVxWGVWbnNDb015d0QxZllETTkvcVFUQm9kdkp4ZGxLZ3o1dnlQWTA1?=
 =?utf-8?B?L1lkSjl4ZEtJaHRndy84L2YreEYydkNkcXkreXdrOExZbVYydWFRZVRHTm1u?=
 =?utf-8?B?V0V1aEVsc0hjQWlWUnJycDVRZzRnNzlPc29ZZ1FVcUJucWV3ZW5mVlF5Qk1X?=
 =?utf-8?B?dC9vN3gwMzNjL0xmU1ZEajRmUnoybFBKNmtURTJ6R0k5ek5HdzdtMEpwdElw?=
 =?utf-8?B?Z0lMb2xYVjEwZXlabTNnQndMZXh3YTZ3NVdHejcwcGw2MjJKcy9YWkhOTkFJ?=
 =?utf-8?B?cGsvcS9vSVBURXg0SnFTYThhMU52WVZVdWtLdFdCUUsxK0RrVVhMNndNNkp5?=
 =?utf-8?B?ZHNSZWFrYkZXeUxsZ0JyVDRwL3FVOXpIU1VPNmwvNjNoZGdpMGRCYVV3RFBw?=
 =?utf-8?B?aDNzdlp5ZExleEYvOWlMNFVWbUtkYWRmcmRJVnQrb3ByYlhwTkxueW43R1Bz?=
 =?utf-8?B?VnJvVHc2MHFPSmF5VCsrZ3FLZUJRbzFtZVY4SFJLbkwxL1RkbTE4YXFYM3hn?=
 =?utf-8?B?R1psbWRpa05ITzNiS09lbjR1T3RYMEVKb1JYVmkxR0ZhdDY5SGxDUVVWREpN?=
 =?utf-8?B?RzR0K0VqNFpRYUNIcEpNNW9WZi9Rd3pob0p6KzlzaFVsbTRGcG4xRi9aZmlO?=
 =?utf-8?B?Q0I0aEFKdVFmT0pNMkpMMS9Zc1RoNUZOampTd0NOTzhSYisxM29pTFRKRHh6?=
 =?utf-8?B?NXNwbFMrM2k0OFI3Y2plY2JsTlhpZm1aeXg3ZjNOaFJ5T1N3R1YwUXV5VEtz?=
 =?utf-8?B?bXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD7BFFA53DA04A449ECB5BC6AB25FD3C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d420e352-0587-495c-ce72-08de1d8088ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 22:05:01.9999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6k+fyh/20P8ZxaWCkRTgVcnWdY74NK3oPuNJzlwvK9Ra7Ckryo9qnRcgadK4WyjAWskaAhpwJbySL9wlY/1fekbIaHH08+6dVRn7ANiNHhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF777B3455C
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

T24gVHVlLCAyMDI1LTExLTA0IGF0IDExOjU2IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBDb250ZXh0LWJhc2VkIFRMQiBpbnZhbGlkYXRpb25zIHNlbmQgbXVsdGlwbGUgSDJHIG1lc3Nh
Z2VzIHBlciBzZXFubywNCj4gd2l0aCBvbmx5IHRoZSBmaW5hbCBIMkcgY29udGFpbmluZyBhIHZh
bGlkIHNlcW5vIOKAlCB0aGUgb3RoZXJzIGNhcnJ5DQo+IGFuDQo+IGludmFsaWQgc2Vxbm8uIFRo
ZSBHMkggaGFuZGxlciBkcm9wcyB0aGVzZSBpbnZhbGlkIHNlcW5vcyB0byBhdm9pZA0KPiBwcmVt
YXR1cmVseSBzaWduYWxpbmcgYSBUTEIgaW52YWxpZGF0aW9uIGZlbmNlLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+IC0tLQ0K
PiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfdGxiX2ludmFsLmPCoMKgIHwgMyArKy0NCj4g
wqBkcml2ZXJzL2dwdS9kcm0veGUveGVfdGxiX2ludmFsX3R5cGVzLmggfCAxICsNCj4gwqAyIGZp
bGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfdGxiX2ludmFsLmMNCj4gYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3VjX3RsYl9pbnZhbC5jDQo+IGluZGV4IDYxYmZhMGQ0ODVmNi4uOTk1
Nzg5ZjBkMzFmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3RsYl9p
bnZhbC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfdGxiX2ludmFsLmMNCj4g
QEAgLTIzNSw3ICsyMzUsOCBAQCBpbnQgeGVfZ3VjX3RsYl9pbnZhbF9kb25lX2hhbmRsZXIoc3Ry
dWN0IHhlX2d1Yw0KPiAqZ3VjLCB1MzIgKm1zZywgdTMyIGxlbikNCj4gwqDCoMKgwqDCoMKgwqDC
oGlmICh1bmxpa2VseShsZW4gIT0gMSkpDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcmV0dXJuIC1FUFJPVE87DQo+IMKgDQo+IC3CoMKgwqDCoMKgwqDCoHhlX3RsYl9pbnZhbF9k
b25lX2hhbmRsZXIoJmd0LT50bGJfaW52YWwsIG1zZ1swXSk7DQo+ICvCoMKgwqDCoMKgwqDCoGlm
IChtc2dbMF0gIT0gVExCX0lOVkFMSURBVElPTl9TRVFOT19JTlZBTElEKQ0KPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfdGxiX2ludmFsX2RvbmVfaGFuZGxlcigmZ3QtPnRsYl9p
bnZhbCwgbXNnWzBdKTsNCg0KSG9uZXN0bHkgSSBmZWVsIGxpa2UgdGhpcyBzaG91bGQgYmUgaW5j
bHVkZWQgYXMgcGFydCBvZiB0aGUgcGF0Y2ggdGhhdA0KYWN0dWFsbHkgdXNlcyBpdC4gTm8gcHJv
YmxlbSB3aXRoIHRoZSBhY3R1YWwgY29udGVudHMgdGhvdWdoLg0KDQpUaGFua3MsDQpTdHVhcnQN
Cg0KPiDCoA0KPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7DQo+IMKgfQ0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RsYl9pbnZhbF90eXBlcy5oDQo+IGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3RsYl9pbnZhbF90eXBlcy5oDQo+IGluZGV4IDhmOGIwNjBlOTAwNS4uN2E2
OTY3Y2UzYjc2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGxiX2ludmFs
X3R5cGVzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RsYl9pbnZhbF90eXBlcy5o
DQo+IEBAIC04MCw2ICs4MCw3IEBAIHN0cnVjdCB4ZV90bGJfaW52YWwgew0KPiDCoMKgwqDCoMKg
wqDCoMKgY29uc3Qgc3RydWN0IHhlX3RsYl9pbnZhbF9vcHMgKm9wczsNCj4gwqDCoMKgwqDCoMKg
wqDCoC8qKiBAdGxiX2ludmFsLnNlcW5vOiBUTEIgaW52YWxpZGF0aW9uIHNlcW5vLCBwcm90ZWN0
ZWQgYnkgQ1QNCj4gbG9jayAqLw0KPiDCoCNkZWZpbmUgVExCX0lOVkFMSURBVElPTl9TRVFOT19N
QVjCoMKgwqDCoMKgMHgxMDAwMDANCj4gKyNkZWZpbmUgVExCX0lOVkFMSURBVElPTl9TRVFOT19J
TlZBTElEwqBUTEJfSU5WQUxJREFUSU9OX1NFUU5PX01BWA0KPiDCoMKgwqDCoMKgwqDCoMKgaW50
IHNlcW5vOw0KPiDCoMKgwqDCoMKgwqDCoMKgLyoqIEB0bGJfaW52YWxpZGF0aW9uLnNlcW5vX2xv
Y2s6IHByb3RlY3RzDQo+IEB0bGJfaW52YWxpZGF0aW9uLnNlcW5vICovDQo+IMKgwqDCoMKgwqDC
oMKgwqBzdHJ1Y3QgbXV0ZXggc2Vxbm9fbG9jazsNCg0K
