Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8787C02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 19:11:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB8510E96D;
	Wed, 12 Feb 2025 19:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cqHvWZ4X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA19110E96D
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 19:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739387508; x=1770923508;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yMsft/A0BfaA8fBPCFJUubvq6I6P5iLY89ahblGjBEw=;
 b=cqHvWZ4XmKCTZpv5zZy6L790BRFNb95d3AKLeW0d9gjdEBmVUvpzp1wH
 O1rAaPIpS99ykN2uP50IE20Rpud8bsgJrvlTCVeSGroehH+ot/vvFSuVN
 sdCK7ANHo3WI/bYgD0R492x2W8VoRoBFco4pnnxUhph9led6bnyXH+DSG
 SEFLYIT6+dHQgr0X57HQ3CLt7mNnZcq1qtrR+4nVXwv3fnd+ha6WDdLRn
 r/8jwf3qWJxBgjE4WxLyj4CoTEwKi2mZx3crJZRYdOJlXQqTJ0518jnNI
 udK65fBXjbVTI3azYE6EwKZu05lfqH90hZG+NRe4Zmi15wiHsGPPTPTd2 w==;
X-CSE-ConnectionGUID: J9g5guztS5iCWyH4Z3JTAg==
X-CSE-MsgGUID: qRi8cmPvSSSFSks7l1ueaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40097693"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="40097693"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 11:11:48 -0800
X-CSE-ConnectionGUID: gptRnI6eRwykqQgQbEUzOw==
X-CSE-MsgGUID: d+sMp0RKTVGRDUFLqRNsoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="150088773"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 11:11:47 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 11:11:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 12 Feb 2025 11:11:47 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 11:11:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTtvj8ivB9VPNHSLeOkXnt18phl68OIfT8810ud+xKZhq5/Ha4RX/dSiLePSvX1dM0R1uMnoBCKZjBjtauyKIePSFeduMGy2ZhgoZecjLxB0HX7zsRabJ+aWca04cXrqH3IIwA1HYU+XryJNpxVgKnEiseYQqTmAx33avpvCyYBL9ofSaVbes59kNo5uFYT8/i1EYT35Ggf6BV7/fc+K1pPHFcFr6brurx8NtakvUXIu2ySgqevv3ccswpK6YJO8A9x3OY7kQoP18L/JDFXxL+abvo5v/kFVTi2vV5A2hwbrnfXr4LSEFh++3aSrz6TtduKDqTD8+29sHp4zRqXfLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMsft/A0BfaA8fBPCFJUubvq6I6P5iLY89ahblGjBEw=;
 b=S8pnWnWUa9kG6ULoGA8vPnKu9d8/9mrC68h2v3OkCD/lIpyJnwsofwvPRZRqfrrxUa3kLDhMtJ3rejgn5MZGrlvKvD9oHb96Ytguy4M5WJscRZtLBgP/17cemeHm4IX1DInEn4rDHTJGN0FsIguUl4uPWl4KofpZe3ZrrNMs9OEoqxBX7lDuLnasEoauXG6cTQfyn68Y5zOaPkkV6HpkfWNrf1xzEY7q0+w2yxLM0TV9iopQgVAY78hMMZ8RhxEaHqFo4HKk8ZG16uc74Pi77U/Oc/HIzyduTKd1w4xUZUWICK8tUd0oPpl/jTEFbfVg84z1KxgoBvXkFn7g9L6ARQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SJ0PR11MB6695.namprd11.prod.outlook.com (2603:10b6:a03:44e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Wed, 12 Feb
 2025 19:11:11 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8445.013; Wed, 12 Feb 2025
 19:11:11 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>
Subject: RE: [PATCH] drm/xe/guc: Escalate GuC load failure immediately
Thread-Topic: [PATCH] drm/xe/guc: Escalate GuC load failure immediately
Thread-Index: AQHbfB6KJmoRFqPpBUmo/4sJ8pALxrNB3PNQgAB5uICAAbSdgA==
Date: Wed, 12 Feb 2025 19:11:11 +0000
Message-ID: <SJ1PR11MB620474730184DDEBDADE589381FC2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250211004702.1872837-1-daniele.ceraolospurio@intel.com>
 <SJ1PR11MB6204F3EF51FC309DADA9782B81FD2@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <988cf01d-fca8-4151-82a8-36f6ea1698c8@intel.com>
In-Reply-To: <988cf01d-fca8-4151-82a8-36f6ea1698c8@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SJ0PR11MB6695:EE_
x-ms-office365-filtering-correlation-id: 40275ecb-53a9-4b8d-3558-08dd4b99036a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?Smd4Nm9vRllDekt0QXFhTlRZamp3QWovdXBjSTFaWWNwQmJ0MXBHVXEzR2Fv?=
 =?utf-8?B?RjBNdUw0OGM2R09VN2k5QWU5RGJoU3F2eFFDdGJEeFY0SkVDc09zZXZiUlZD?=
 =?utf-8?B?c3dlZGFHN2tVeHI0SzZLNUVGS3A3aWpnTVhUTXpPckZ4a0RPaWVRTkV5cDM4?=
 =?utf-8?B?ejJ2SFI0NHpVcWNsSGRwWVNKUmxYOG9GYXZLTERKL0Y5V2o3WGRLdVVqbFFV?=
 =?utf-8?B?RTBhZHNia0c1eDQ2QWxpM01ZeU41cHRySmZUYmVLUXg2cE1wV0ZmaHdXTXYy?=
 =?utf-8?B?cEVHdWhYY01MeERDVWZvSUg3aHhRNWhaMjZVbnNLZkRKQWNIdmE5N1oyampJ?=
 =?utf-8?B?Z1NFRWppWkpsUlljaUtReTdaRUs4MW5YOUZzNXUrMXpmNnJlaGl0cmY0a1Mr?=
 =?utf-8?B?d21TU3BNekdKODVtakMvQkp2eTJJbkZiSTlhSGFmblQ3aTNDcit6N2ZNZlFE?=
 =?utf-8?B?UDhwQkZaTm5ONWlQeFIzTmZWZnFnT3BIMW9hSVcvK1JGRVJ0MEprTk9LS1Zu?=
 =?utf-8?B?OGNSV1hoZXRSK1R5UGZpR3BMWHFFYWd6cS8rRmxabnpKbVlISzlNeEtFQ01n?=
 =?utf-8?B?bThSY2F2OGVWRWwwUmZlb3h6Y0swYmVBdCtZOHYydndiMVI4cjQvOWNwa1l3?=
 =?utf-8?B?OC95M25ITXc3UXBaU0UwOW0rdFpPRjlXQjM5RW9tSnE5ckl6UlFyWmN1Zk5h?=
 =?utf-8?B?ZkFyKzhMdHRQa2xuRU5RRllkZmNxMEZHQ1o4ZWUzanJvbGp1RXdYNXhRVVly?=
 =?utf-8?B?VmFZdDU5WVBhOTU0anFvV1daZUF3elZuN1k2cDgzREJlclBsZXlWQnRFSEs1?=
 =?utf-8?B?L3gza3dDOFBjZGNqalZKdlpuMzVHakFGa05LcjRCVis2bjl2TmRJSndrY1Bj?=
 =?utf-8?B?K3FjcjJDNTNZMnYyRWNSSkI3LzlvekY2NHIyWDdMQTA2QlppZ2MzZEVuQkFy?=
 =?utf-8?B?Nk13eVl5bkprMUZkQW5tRk5BM3hiNURPUHRsVno0UDhqZ3M3c1RWWm5VN1Fv?=
 =?utf-8?B?bnFoMUtmQ0MwcU9BVWhSNHlZNm56ZzkrQktmeVlXOGJBelRSYUhmYkhod3kw?=
 =?utf-8?B?NTViclZzY1dBdGRpYzkxSUhJMHJUZ3JWbTlxWUJVSFowdlZoUmZ6QkY4OU5C?=
 =?utf-8?B?N1hhZXhIYUg3aUpBS09oWlN2MXQyWjViY3djUkpxcXFqUEJtME1JYWRPb05n?=
 =?utf-8?B?TXRUb21RU1NaOTBSems5c2dXd21aYlREWjlTNklKNHdnUG1WbEtzaEVXZGlx?=
 =?utf-8?B?cjcvbGRwRDVNUnk0amkyTDJ0Z0dDUkt1ZU15YzY0MjU4b0hyaDFlalFONXBH?=
 =?utf-8?B?OGFBZEE5R0ZUakhoNUd3SVJ1MDMwOEdEWlpzTytvc2J1aTNiU2pwZ3JoSlNo?=
 =?utf-8?B?eFV6ZktSK2tkdjBYdDc5RnhCTWpGOTFnQ2w4eTBYclMzSkZmaUJRNjllbFRI?=
 =?utf-8?B?RTFTdWpUc3hOSEd4c0R4TklpcWhPVzRsUVVXNGVpZ3hieG1XMmdJOGJjOUE2?=
 =?utf-8?B?U1M2UW5IVkZoelEvZ0pMQ1k0UG5LMmZtTVRCelFlV0o5NXhkREVPM1pwWXpO?=
 =?utf-8?B?RG9CRnptaS8vL0xnYytVTjh3K09zRjhUcG9RWWJFNFBOai9EOG80VTNJT2VF?=
 =?utf-8?B?TzZYQllFTUNJSWl3cHNyY0UzcmtFL1A4b3paWi81ZWZIa0tvSDNRZUdTRTZo?=
 =?utf-8?B?ZjVyTVUxMkQ1L1RXVjhMVkhBZGRibFZNN0NTOWEyNHlJY0FsTjZERGk0UDJ2?=
 =?utf-8?B?a1dvaHEzb2Z2WHJZZWlNSG1hclBuK0cyYUxERFRFbVAremMzM0VqblpxRjJq?=
 =?utf-8?B?d3JLeGJhS0x0TDJOTUV2L1VXNTdHdHEvaU9abzFnOEFUOHZMbzZ0OHdWQ0Yy?=
 =?utf-8?B?MCtXVVYrczIrZVZveGsyeHlWY0pOU0p4aldCQ2lXMm5iaDd1endzZ0VuSEEw?=
 =?utf-8?Q?aHbS1GNhLjPb1JUiDBMThu4TGWbXeAYu?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2NreGRMV2pYaUFOQThmNDkyQnJXVjZPZmEzeFB2QkxkMThRcS9PMSt3d28r?=
 =?utf-8?B?ancxaW9uNjFZQU5VT0tGazViUEhzNTNNV1ROdEplVHF2SmVKY3dNWlZCYXh4?=
 =?utf-8?B?S3d2cjNIU1ptNkJwaDZadXBuU1lyRXlmL0hpd1QvbWhNNXQ1V3VTL2dlTkZu?=
 =?utf-8?B?bElkZjN4RU4zN2pySUs5NnNPV2g1U2x6V1NqRTM4MTZSOEZUa29pSHBqaHZp?=
 =?utf-8?B?NWVWZ1YvS2svWE5mOFU5Y05LTU5vbGhUZWxNbTBVTHMvZzllTlVIeXNTUHdZ?=
 =?utf-8?B?MlppYzJKNThnNUw0d28zOVhhRHVoN2I0Z0R0NUxKQVdqemRqT01oMWlKRG03?=
 =?utf-8?B?ODBOSy9FcEN4YkN3d1IzdmpGSzdnZlpvczYyTXFxMWY4MVIxY1RhL3Q5UEZJ?=
 =?utf-8?B?WUoxSkd1UUNUOTNQOUZsOEJuZkFGY3dsZ3VtWGdiV0g4QWVUY1NDcEYxZ3pR?=
 =?utf-8?B?WjNvcHVwak9QYzFwVjBUNnJNYUx4bzNHbEl3czNIcWFsdm11LzVOQVJoR0l4?=
 =?utf-8?B?Vmo2V0lZYXdTamUrYXJpN2hYTGVHaFEzcHNJRWU3Vk52enBKYkRYdGk0T1RX?=
 =?utf-8?B?UmZCL09GZzZoR0FMaG5JU0QxMDRhcDJYUW1DYUdIeGJ3RlZQY2RuOGxtekwz?=
 =?utf-8?B?S1pNY011VmVKQklsM3g3Wm05NWRaMWhUVkJkM1VYTWl0eXIzYXZVRy9uRzZL?=
 =?utf-8?B?N1RyeVp4ZVBnMXlvM2RMc3JJcVJWWFRWT3VDMGlCR29sSUU2dnlIOHM3YTB3?=
 =?utf-8?B?MHZmRFlITmVSQlFPT1hubUtiZ25PZ1d6QkcxWnF2WTRoSjRwek9hVTBuc3JC?=
 =?utf-8?B?WVRZbWlPQ0Q3SE1URFlBOUZNZjFRZVpjVVVLdG5MK3h4VGNGU0w5aStFRUpp?=
 =?utf-8?B?b2YyNFpWYXErY3lOZ05oekRSc2lzNEh4ZUFpODg3b0ozTzhRK0tKaWkreHFI?=
 =?utf-8?B?ekQrYVRXWmhvK0RIU01SVjQvaURiYzBpYnlFdHJxNitrbFNpaWtINDJOTnUw?=
 =?utf-8?B?MWZhbnJPRFF1OGpGUUk4TTR0a0hLbTRaMjZXR0NYeU1tb2NyU21ZNnlLZ0ZZ?=
 =?utf-8?B?eU11YWF1c0hJcDFEQkZKUWhhNlJOR2RCTWtYKzdyNmNRanZzMGFGRklrOWs5?=
 =?utf-8?B?RUlFZGpqbHhuM0ZGKzQ3dHpwZjJDT3QwcFpvQjRodVhnalk5VjIrdENIWlQx?=
 =?utf-8?B?SHlwNTZlTzJUTVpSNU1GYlBPNW1BdlZhcmtoeWZHeE9VQlVMbG5kQ3hFSk1h?=
 =?utf-8?B?b0I4ME5HL1IrZG9xK3dzVGdhK2gzU1NydTcyWk10ZlNITU5nS3pHeFRacHRW?=
 =?utf-8?B?N2UzaUFyOEt1ZVVMRHBGSDBmL0psT05wdUlibFptdVZXM01GYWlqa2k0ZFo5?=
 =?utf-8?B?anpJV3U4cjBBdkR1Q3JvK3VHbHlsektSWENzakF2c0x3QjJhcWk1SnhqT3Vk?=
 =?utf-8?B?ZGhJRG4xeEhlU3NyZ01PTm1PSVVJZ0RwSFRtUTJmZzMwbDFyc2RFRHY1UEhv?=
 =?utf-8?B?a3duV3VCT0lKMzJIRENldTZhUmJDVkZFV05zNkJzdWtzbEtqNkJFYnRyV2ZG?=
 =?utf-8?B?M1NST1l6YjR6Y1JMM3pIYVk1bmcxUVZraERQeHhSM3FUb1d5TDg1bkVDNm5R?=
 =?utf-8?B?QTFhSU1tYmYzS3M0a2dUNUhla3krSVhOVU9rZVU2RzU5UldkeHduanVINTA4?=
 =?utf-8?B?RCtTUnc3T2pQa0ZmNHZXNEFxOGJKc1JUNXBhbEFWVnlSMnVyZG4rck1xL2R2?=
 =?utf-8?B?Z3dFU3l5MCtVOEZ0UnRSZ0pGVTB4UUowVTVIY0dhUW92WWlRWXZYbDVweWhF?=
 =?utf-8?B?NjZlZmdZUnRLVEdkY1IxZVdYWW95dlBoWkFLd2l6cm44b1dieGduQUxqbG1M?=
 =?utf-8?B?RjdOSDR1dnBqT2ZaQjBFdi9SbFV3NXV3YzZoRGtHMUpuL1pNQWtUK09zZ3la?=
 =?utf-8?B?OXAvTit0bEg5S0hDZ3pXNnFCeTlIdVA4bnFjSktka2FBczdkeXRDVlNOSXdU?=
 =?utf-8?B?ei9OcEIvc1hudDY0am9rajlkWkg2L2hBUmsvQTg5SSt2a0hzTG5KRlhHRHZW?=
 =?utf-8?B?d0FOaENuUGM2bEVkaTRGZndOR20zQ3NTY1Z2a0NVUUVRWlQrWmZjUUZDQzY0?=
 =?utf-8?Q?jtTT0xjVGAxVGsb3hbKagImbo?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40275ecb-53a9-4b8d-3558-08dd4b99036a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 19:11:11.5713 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FoWMj3GyfhEmOSFkNluV9cbnqwTa00u/bqYX7jCMyjVBqN1YLKHpFXmoO87Wluo54vsjHy2rOhSVVUj9mmmPzTgYxLlpqeMzE94ukzoc6Ow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6695
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2VyYW9sbyBTcHVyaW8s
IERhbmllbGUgPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+IFNlbnQ6IFR1ZXNk
YXksIEZlYnJ1YXJ5IDExLCAyMDI1IDEwOjM4IFBNDQo+IFRvOiBVcGFkaHlheSwgVGVqYXMgPHRl
amFzLnVwYWRoeWF5QGludGVsLmNvbT47IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj4gQ2M6IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT47IEhhcnJp
c29uLCBKb2huIEMNCj4gPGpvaG4uYy5oYXJyaXNvbkBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0hdIGRybS94ZS9ndWM6IEVzY2FsYXRlIEd1QyBsb2FkIGZhaWx1cmUgaW1tZWRpYXRl
bHkNCj4gDQo+IA0KPiANCj4gT24gMi8xMS8yMDI1IDE6NTMgQU0sIFVwYWRoeWF5LCBUZWphcyB3
cm90ZToNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBJ
bnRlbC14ZSA8aW50ZWwteGUtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFs
ZiBPZg0KPiA+PiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvDQo+ID4+IFNlbnQ6IFR1ZXNkYXksIEZl
YnJ1YXJ5IDExLCAyMDI1IDY6MTcgQU0NCj4gPj4gVG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPiA+PiBDYzogQ2VyYW9sbyBTcHVyaW8sIERhbmllbGUgPGRhbmllbGUuY2VyYW9s
b3NwdXJpb0BpbnRlbC5jb20+OyBCcm9zdCwNCj4gPj4gTWF0dGhldyA8bWF0dGhldy5icm9zdEBp
bnRlbC5jb20+OyBIYXJyaXNvbiwgSm9obiBDDQo+ID4+IDxqb2huLmMuaGFycmlzb25AaW50ZWwu
Y29tPg0KPiA+PiBTdWJqZWN0OiBbUEFUQ0hdIGRybS94ZS9ndWM6IEVzY2FsYXRlIEd1QyBsb2Fk
IGZhaWx1cmUgaW1tZWRpYXRlbHkNCj4gPj4NCj4gPj4gV2hlbiB0aGUgWGUgd2FzIGZpcnN0IGlu
dHJvZHVjZWQsIHdlIGludGVudGlvbmFsbHkgYXZvaWRlZCBlc2NhbGF0aW5nDQo+ID4+IEd1QyBs
b2FkIGZhaWx1cmVzLCB0byBub3QgYWJvcnQgbWlkLXByb2JlLiBYZSBpcyBub3cgbWF0dXJlIGVu
b3VnaA0KPiA+PiBhbmQgd2UgZ3JhY2VmdWxseSBoYW5kbGUgcHJvYmUgZmFpbHVyZXMsIHNvIHdl
IGNhbiBzdGFydCBlc2NhbGF0aW5nDQo+IGltbWVkaWF0ZWx5Lg0KPiA+Pg0KPiA+PiBOb3RlIHRo
YXQgZXZlbiB3aXRob3V0IHRoaXMgcGF0Y2ggdGhlIHByb2JlIGlzIHN0aWxsIGFib3J0ZWQgYmVj
YXVzZQ0KPiA+PiB0aGUgYXR0ZW1wdCB0byBlbmFibGUgQ1RzIGFmdGVyIEd1QyBsb2FkIHdpbGwg
ZmFpbCBhbmQgdGhhdCBmYWlsdXJlDQo+ID4+IGlzIGFscmVhZHkgZXNjYWxhdGVkLg0KPiA+Pg0K
PiA+PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvDQo+ID4+IDxkYW5pZWxl
LmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPg0KPiA+PiBDYzogTWF0dGhldyBCcm9zdCA8bWF0dGhl
dy5icm9zdEBpbnRlbC5jb20+DQo+ID4+IENjOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlz
b25ASW50ZWwuY29tPg0KPiA+PiAtLS0NCj4gPj4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
LmMgfCAxMCArKysrKysrLS0tDQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWMuYw0KPiA+PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYyBpbmRleA0K
PiA+PiAxNjE5YzBhNTJkYjkuLjEzYzMwODRjNDJjMiAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d1Yy5jDQo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dWMuYw0KPiA+PiBAQCAtOTM4LDcgKzkzOCw3IEBAIHN0YXRpYyBzMzIgZ3VjX3BjX2dldF9jdXJf
ZnJlcShzdHJ1Y3QgeGVfZ3VjX3BjDQo+ID4+ICpndWNfcGMpICAjZW5kaWYNCj4gPj4gICAjZGVm
aW5lIEdVQ19MT0FEX1RJTUVfV0FSTl9NUyAgICAgIDIwMA0KPiA+Pg0KPiA+PiAtc3RhdGljIHZv
aWQgZ3VjX3dhaXRfdWNvZGUoc3RydWN0IHhlX2d1YyAqZ3VjKQ0KPiA+PiArc3RhdGljIGludCBn
dWNfd2FpdF91Y29kZShzdHJ1Y3QgeGVfZ3VjICpndWMpDQo+ID4+ICAgew0KPiA+PiAgIAlzdHJ1
Y3QgeGVfZ3QgKmd0ID0gZ3VjX3RvX2d0KGd1Yyk7DQo+ID4+ICAgCXN0cnVjdCB4ZV9tbWlvICpt
bWlvID0gJmd0LT5tbWlvOw0KPiA+PiBAQCAtMTA0NSw2ICsxMDQ1LDggQEAgc3RhdGljIHZvaWQg
Z3VjX3dhaXRfdWNvZGUoc3RydWN0IHhlX2d1YyAqZ3VjKQ0KPiA+PiAgIAkJCSAgZGVsdGFfbXMs
IHhlX2d1Y19wY19nZXRfYWN0X2ZyZXEoZ3VjX3BjKSwNCj4gPj4gZ3VjX3BjX2dldF9jdXJfZnJl
cShndWNfcGMpLA0KPiA+PiAgIAkJCSAgYmVmb3JlX2ZyZXEsIHN0YXR1cywgY291bnQpOw0KPiA+
PiAgIAl9DQo+ID4+ICsNCj4gPj4gKwlyZXR1cm4gbG9hZF9kb25lID8gMCA6IC1FSU87DQo+ID4g
RG8geW91IHNlZSBwb3NzaWJpbGl0eSBvZiBsb2FkX2RvbmUgdG8gYmUgLTEgYW5kIHlvdSB3aWxs
IHJldHVybiBzdWNjZXNzDQo+IGhlcmU/DQo+IA0KPiBZb3UncmUgcmlnaHQsIEknbGwgY2hhbmdl
IHRoaXMgdG8gbG9hZF9kb25lID09IDEuDQoNCk9rIHdpdGggdGhhdCBmaXhlZCwgTEdUTSwgDQpS
ZXZpZXdlZC1ieTogVGVqYXMgVXBhZGh5YXkgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT4NCg0K
VGVqYXMNCj4gDQo+IERhbmllbGUNCj4gDQo+ID4NCj4gPiBUZWphcw0KPiA+PiAgIH0NCj4gPj4N
Cj4gPj4gICBzdGF0aWMgaW50IF9feGVfZ3VjX3VwbG9hZChzdHJ1Y3QgeGVfZ3VjICpndWMpIEBA
IC0xMDc3LDE0ICsxMDc5LDE2DQo+ID4+IEBAIHN0YXRpYyBpbnQgX194ZV9ndWNfdXBsb2FkKHN0
cnVjdCB4ZV9ndWMgKmd1YykNCj4gPj4gICAJCWdvdG8gb3V0Ow0KPiA+Pg0KPiA+PiAgIAkvKiBX
YWl0IGZvciBhdXRoZW50aWNhdGlvbiAqLw0KPiA+PiAtCWd1Y193YWl0X3Vjb2RlKGd1Yyk7DQo+
ID4+ICsJcmV0ID0gZ3VjX3dhaXRfdWNvZGUoZ3VjKTsNCj4gPj4gKwlpZiAocmV0KQ0KPiA+PiAr
CQlnb3RvIG91dDsNCj4gPj4NCj4gPj4gICAJeGVfdWNfZndfY2hhbmdlX3N0YXR1cygmZ3VjLT5m
dywgWEVfVUNfRklSTVdBUkVfUlVOTklORyk7DQo+ID4+ICAgCXJldHVybiAwOw0KPiA+Pg0KPiA+
PiAgIG91dDoNCj4gPj4gICAJeGVfdWNfZndfY2hhbmdlX3N0YXR1cygmZ3VjLT5mdywgWEVfVUNf
RklSTVdBUkVfTE9BRF9GQUlMKTsNCj4gPj4gLQlyZXR1cm4gMAkvKiBGSVhNRTogcmV0LCBkb24n
dCB3YW50IHRvIHN0b3AgbG9hZCBjdXJyZW50bHkgKi87DQo+ID4+ICsJcmV0dXJuIHJldDsNCj4g
Pj4gICB9DQo+ID4+DQo+ID4+ICAgc3RhdGljIGludCB2Zl9ndWNfbWluX2xvYWRfZm9yX2h3Y29u
ZmlnKHN0cnVjdCB4ZV9ndWMgKmd1YykNCj4gPj4gLS0NCj4gPj4gMi40My4wDQoNCg==
