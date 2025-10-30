Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA3FCCF9F8
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 18:54:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB37610E32C;
	Thu, 30 Oct 2025 18:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VwQhq80G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D231A10E32C
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 18:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761850462; x=1793386462;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:date:message-id:mime-version;
 bh=NNELkOo66L3Ynar0Q75QItLVhwbPyxhK5UCbrp7Cfck=;
 b=VwQhq80GPC+soQZlaEnLTjqHanekHWXZM3YmDRYxw17kNk5aZNuAPI3R
 3QpyXEZf2XNdjHuu3GUll5kpLiqBk69vxj77Ir5z0EUIz6R+u4RU6thIW
 ceA5mkipgaQr3J2WM0lNEcWhpT4fULnpTJXW9Sz0rQ3EZNFk0tl3D0TJI
 yv+h6xoD2XlAGdNLrJSDnfsmdAVmP5iz88sPYWy+1VKl+CKw0cN3kVcws
 T4WDPE3mYDHtXZkuKcSXp0WPBN2PZ9HgzGY2xseHv5s286P7JhOkfWq4k
 QKTABYmqrHinCVBOtuTFW6Ih0RdWfyBp2hJXl1UTwjdHHWVmCC0g6ZyOZ Q==;
X-CSE-ConnectionGUID: cxIiuCDDR/u33vv7jHcr+g==
X-CSE-MsgGUID: 3MnbAvWjTmiCjKhXvKFYDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75353146"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="75353146"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 11:54:21 -0700
X-CSE-ConnectionGUID: nMgDypL7TSKB8iGCqCDtug==
X-CSE-MsgGUID: 46T7LLxbROSFKd8L5zvJPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="186130183"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 11:54:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 11:54:20 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 11:54:20 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.34) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 11:54:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsMnabnqIflVLz0x0cNPBXkIhjJcLFUanEK/A7Z5k2DsJN/qn+KWUXozfJNeN71Gooddn7P3C1S8qmHvF0y7qN6LVPOq0C8B7FIKS8fJ8YV0p/gFQ4LMzlTR/QZz6ir9PnGSPKySArcjOoa43xMNxPiUZuqgNp6ShiZphUboF4gqv2eemEXkUh2VwPB6ACGmlBeNqmPIYWwyn2PrTmQyp8sqQRB6sBCKJ658umaEp7PKkUMI15uFQk9Jj9lJMYe8SK9TYt6oLdDIsFo9y38ioE6dDqec70k6wAxNruVBVNhFefEUVUQDVjeCppGcdeKBE/ZozeB1lFbc+H/ZqLnc5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qa3ekgFkn+yOlgmtuxCVOEorIjqi40ahYDPTGnyC9zQ=;
 b=zCDV9W9BEO6EZyOQYcJp5e1b5mGEu730wX1V3shDo8RdTtaaigfsvWpz0bGVhDtN5EeZ2fIGmtPkrv8+iYFfKe7qoAof1m1e4RF7QjMUUBInsjpfG8adE4sqXN6qiaIq0GHOCWJ59IYxm0+bvdk1RbGXpMSCgqNPyVT9dfkjbAJTW3QpR4Ypi/ZLSsVBD64nvXLk9lpN4p2EThY8DQ2Virq4qkqCpKDCMFLNzd9h03H7gqTUyc9LCjrrToeVvtyXoW0EmoW7rF+trpd9INRV9NAEwimBTwGP7QjylKfbfdrl3d/4Gmb2IDc5NnCkl2MA8XOlwT4pnJFJG2f7V8y4dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DM4PR11MB7326.namprd11.prod.outlook.com (2603:10b6:8:106::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 18:54:18 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 18:54:18 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251030184710.359870-9-dev@lankhorst.se>
References: <20251030184710.359870-1-dev@lankhorst.se>
 <20251030184710.359870-9-dev@lankhorst.se>
Subject: Re: [FOR CI 8/8] drm/i915/display: Use intel_de_write_fw in
 intel_pipe_fastset
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, <intel-xe@lists.freedesktop.org>
Date: Thu, 30 Oct 2025 15:54:14 -0300
Message-ID: <176185045446.3303.6205563147139756281@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR08CA0006.namprd08.prod.outlook.com
 (2603:10b6:a03:100::19) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DM4PR11MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ef9788a-ceef-4e98-c928-08de17e5bae2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2NQVkVJS2xqbHVvTUY2UktSYjd1ekFqUDNoU0FJYmRjZThBbFBhN2dLbUVN?=
 =?utf-8?B?VDdoNjdOdDNtUkQ3TDkyQkY1VEZNQStXQ1pzYmwzLzVhN1pzTzlHYkQ0RFBH?=
 =?utf-8?B?N1Zld2tHbUV0bFg2Um8zUG5mY2V5UWxaVmxRczg0dVc0VU1xbGlmMVQ5aDNJ?=
 =?utf-8?B?a09KNGtHUVMyREd5bC9KRHJYQmNnVkdNeFY5eEU1NDlhdVlDNFhKT2E0UFk5?=
 =?utf-8?B?OXJCTXdmSlZLbzFwTi9jUlZIUnA3M3BLUW9pNWExNW1MSGZkTHIrRzdFNXo4?=
 =?utf-8?B?UnB3QmJHQ1RCeUNvOU5aalJuTktKSHQzbWZrMzFXZXNDaENUeXFwT0FXK1B2?=
 =?utf-8?B?dERBNDFJS3E4aEZZNTkxWUtNUUR1R1IzQkJTMktPSnJPNnoxb1R2WXc1TEEx?=
 =?utf-8?B?UGxSSXBMelBaVHVhN2p0MmpFRE5mcVdoa1ZWVjF3dkUxT1FtMDdwWGt2Q1c5?=
 =?utf-8?B?aTQzUFZUbWlHQ1dSd244a3M2Z3BQMmtFR053cEhJQmFVMncwandQY29XV2Vk?=
 =?utf-8?B?cGV6bnNZaTJ2cjRuRmduQ1FrZ0s0Vzdha2dKWDF5MGh3end3Q1ZLS2t3Z0tO?=
 =?utf-8?B?ZzF5eUN4WktSbUVoY0dxcllLZzhINld3aXd4UDNXQzEyNXAzUy9PMHc4b1Zz?=
 =?utf-8?B?TVpvaGJXVnBMYlhOWVVDMnF1NWMvSVNuNWUwcHhVVHp2WElCaGdUeEcxN3lE?=
 =?utf-8?B?SUl2eldDRGdKSlhsdko4dDN0azU3ZTBVVVcxSGV0Yk1oQlQ1WnVTVDdUb0J2?=
 =?utf-8?B?dk9tK1VFYXZwUkdqOVU0Wm9USktmVVdPYUZRYlRYRng3d21UbjN5cytWbnZ0?=
 =?utf-8?B?MWliOEN1MXhxOEoyVy9BM1lPeVMzRUNNVzltVlU4WlNBdFJYNm8yUUlJdGFh?=
 =?utf-8?B?R01yZGZrMWF0VUpUYlRaWHJjUk5PdmpoUXhQdlRMWW53dEZ2dTVMU25Qckpk?=
 =?utf-8?B?aG96NU1wQjByWVYwRm9pVjByWjZYbGQrR3pFVEhkWXpaaXo5ejRTQi8rMW9I?=
 =?utf-8?B?Nyt2cExGeXgrMUx1TU1pWDZNZzBkN3JGQXZralFsWWRQTUNxQzB6M1g1UExh?=
 =?utf-8?B?OVFlNXNKa3Q2T0kyTmpsWUJFb0hweEVkRnRtaUdIR2liejM3UWd0d3NXbGtx?=
 =?utf-8?B?QTI2eE12bEtQWC8wenhjazVOK3B0Rnp1WFlTTzZMQWdURjZWekR1TEpDNnRV?=
 =?utf-8?B?cktUVTAvSzBHY0ZQY1Y2a21VNTNpY3ZZMjR4NXRBT3EyYWJ5SXo4MmxPaU5j?=
 =?utf-8?B?dVljRmFWb0J0cFZzYWRoVk5mdnhud0ZOSnRHbW5ic0kxS3BUVGFYZDFzVnVh?=
 =?utf-8?B?VVhoTFAzTkF1UVpGTFpSZUVuUHR6MnUzb1g0NXhSQ3VYUzV2WTFWMlJkZkgx?=
 =?utf-8?B?UVVQaVRyR0hFQ05ZbWJvcUpqRWFvR3VMSG14bTRhVlJaYnd4SzlFMUF5eTBJ?=
 =?utf-8?B?Si9ISHU2clN0OWdOVCtLMHhtQzlHVkF2UEJrVnJjbXJXa2FyQmsrLy9IVDQ1?=
 =?utf-8?B?RWhkdmdZRC9XNEc3dmNBb2E3LzEvZjFZcnByN3V4TVhkaWVka1p6d0Q0dXQx?=
 =?utf-8?B?ZHR4czRoMEh5VWNIcXlhMkpTcjZQaEd0aWRTNGRLM25ITjZ1ZVJUQkRrQVJH?=
 =?utf-8?B?eDAxZ2x6SkhVRzZYRks1QW5TMSthR1dDSWNMTFdZdzFiaE52b3g2K2lwbW1i?=
 =?utf-8?B?a21talpyT1F6Z1VZaExjNkYwcHp5eUdLUE16cUxGZnhrSHNtN3VLVVAra3dM?=
 =?utf-8?B?UnEyTi9vczY3UitBS0lZbndocjl3OTdsNG40M051eVpBZGNPdktEamNFRFhj?=
 =?utf-8?B?QlNSVlpibWRuSzl0cHlLdkYzem01RVVUNW1KRE1TaVdJSGFKTkp2MVowTkow?=
 =?utf-8?B?SmhSSnkyVjNCQVJFWVhzWlRwR1NFcGc1dSsrcWRzaFcvdkpXNi9ia0NFSlU4?=
 =?utf-8?Q?76ONXaq+ABsIi7vAYL/VJegFsoiuACOu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzNzVGoyK3NhcVF1TVk3emYvSDlpNTYwWmxNRERzbUdzKy9NMDA0eFNzcmlK?=
 =?utf-8?B?czJuaWdzdW9MMENhandwb3J5SnA1MHJramF4RzFPeElqOUlqTTdKOWJJWndi?=
 =?utf-8?B?SzE3MmRaM1ZRRHB2WXpUaTM4L1lHZDc4TWpxVUVqak01ejN0dlFuQ2FmZlRP?=
 =?utf-8?B?aDY2aFZrSkpPVkZac2g1clpHcEdiM0gzY3FBZ0w4cWxQWndEd3UxVFhRTVJn?=
 =?utf-8?B?cmJDSlJWekVpV1JpdkhPTzA2cElQbHJGTVhtOTFZc3NJZWMxWCtHZGdmclZG?=
 =?utf-8?B?VDkzMkNzZDlVbWhCUFVkMENIK1RNRE5rNml1dnQ1WHRFNnc2MW90eXh5TjRK?=
 =?utf-8?B?WlJVUWJOZE5vTVFBUzZZODZJRnl1Y1JNTEZieUNNRlZiWXA5UGd6NFRFNUNr?=
 =?utf-8?B?d3l3L3IxdjdlU0M0WEt6UE4xaUwwbEFCVGVhWXhPbGdzT3lrZi81ZXYwOWtB?=
 =?utf-8?B?a2NFQzJRT2lBMldTZ0VERk83amlBdGlRV1lJdTUvd2tzR2J2OHRPcUM2aXRQ?=
 =?utf-8?B?UU1DOElZMjArVlpwb2t3dlVwR2ZXVXg0ZC9yNDY5YzBzY2J1bU8rWGpzMHRw?=
 =?utf-8?B?OHlBTDFYcVA5ZjZaTEJMM0JsUFRHZnh6Z2t0NFFKQ2NIU0VPSEtkbEhLWXRZ?=
 =?utf-8?B?bzE4ZzdOY0liTXZJT25pTU9FZWRkYWMrRjdmVTB4R1VCSEtJcHorSHR6Szln?=
 =?utf-8?B?TTJueE9LWi9yVEVMckhiUTlHajdGNDhBU3ZNQTkrbzJCL2pFbTMraXZOaENx?=
 =?utf-8?B?OHhNcDdjUElqYk5WNDBFemovTURIZnh5elI2bEM1QWIrZDk4RUhDRXZROXJT?=
 =?utf-8?B?VVhWZVo2aXF1aFNoM0d3bFFNTkluN3I4b1ZlQ1pOZlhReDB4Z3gxbXJqSEFt?=
 =?utf-8?B?SUEzTlVSU25BdnA5aXVRd0xNTEhVTkR1UjdSUUZsb0VVRUlrM3l6eVRmWVJ5?=
 =?utf-8?B?eFY5dVRWZzRtSk5SYjdCWTErSC9UWHhkbTgwd1g4UlpJck96enpGRXhiaGNF?=
 =?utf-8?B?V25sMTJZZitmaGl4dEw3Y3h4SkYwdFBFa1BsNHBFZHJlU1I1dU5qWkorQ2dO?=
 =?utf-8?B?UjZxU3plbVZaV1ZidnloMHJsMXN0OXlDWjlKMmE5TjRRQm1JUCsyaVFyVnQ2?=
 =?utf-8?B?c1VHdUFCZHM5Rk5acm82TURGZVlZc2NvUDFIakNOYm91Uk92ejZUOXhoY1VH?=
 =?utf-8?B?OWtyeDNHdUxjeklaVXB3THdaZVMyOGhWRWcvR3lPS21sWG5nM2dnemQvdU1U?=
 =?utf-8?B?STRiOEpuc0tJcGF2c0wyblpVeVg1akwrbVVOaEo2ZW55alQ1b3dWcFlVWm9K?=
 =?utf-8?B?ajV1R0R5cnR5OXFMMzh4SmgrZnE5eXVQUkZNUGxDejNBeWFCdmk3M3p3Q3RY?=
 =?utf-8?B?TU1rbFVVbFpLRWw0MjhBd2c0N2YvUGdZYU9tVFZMUEg0aVdCV2RkUWdydEx4?=
 =?utf-8?B?WUNOV3BCS1Z0bEE2ZVRieVNNdlFxWTlZbXhYRStqdGNiaTBUSUIvZldXbTVo?=
 =?utf-8?B?K1BpSmI4OHo5WDBKOXZEeWwvbmRvZjVYRU81SExNY0RpVkU2R0VkTTNDdWRm?=
 =?utf-8?B?MWhIQVMycXJLVlEzdUduRVpLR3R0bDZDbHN4bDJsK3c1QTZQQ1VTM0d3czBT?=
 =?utf-8?B?Mm5VdW5jNnVmWVJTYmNteW1xTlFqM3kvUVdxTWU2b3l6N3BNaGtXdjVjcjMz?=
 =?utf-8?B?a2hEQnRnY3RSeTRQUStOKzV6UjNnMUtuUXhnY2Frcm0yZW9IdDdHeEU3MVlS?=
 =?utf-8?B?TXdTaGFlOTFKNGJtTWd1Z3lRQW5OYVFsV0VYYkdjRE1HRTJhZmVXVlRTbVNI?=
 =?utf-8?B?Z3dXVkVWN0dXMkluTjI1TDZRMTF6SmdQS1VaWjFGTlIwRml2b0Jvb3BxMDNK?=
 =?utf-8?B?SGo3ZUlra0hwUWxualdidkw0SGhEa01xMjE5c3haU1hxdGh3M1U1YTA0cDRa?=
 =?utf-8?B?aU1SSUJqUmJMMjBKNjhURXNKTWo0RXhmcTY2L2s5RWhYTDh4cE9mK01ER29I?=
 =?utf-8?B?Q1pBL0h3MWhIbk10UndZc1RaNDVrd05NQmw4TCsydVIxK0MwcFltKzE1NkRv?=
 =?utf-8?B?UkllbkR4RTJTQzJWOHlwUmpZZjNiSzFldkxMQXVTYklRM3RFUE03STdZU2xL?=
 =?utf-8?B?aFdIQVdWdG5MMlBieGNldVdZbStDZHkxVzkya1dpSElsbE8xb1kwcHBJN0Zs?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef9788a-ceef-4e98-c928-08de17e5bae2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 18:54:18.5084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kvSqBd/1of02Zsx8eP4Ulj06SjBE3BFDDhbh67nNHsvmIQohT4qgzjRLm8cuIh0qytN/ws7hWY7fO/VcFCvdYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7326
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

Quoting Maarten Lankhorst (2025-10-30 15:47:10-03:00)
>intel_set_pipe_src_size(), hsw_set_linetime_wm(),
>intel_cpu_transcoder_set_m1_n1() and intel_set_transcoder_timings_lrr()
>are called from an atomic context on PREEMPT_RT, and should be using the
>_fw functions.
>
>Again noticed when trying to disable preemption in vblank evasion:
><3> BUG: sleeping function called from invalid context at kernel/locking/s=
pinlock_rt.c:48
><3> in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1505, name: kms=
_cursor_lega
><3> preempt_count: 1, expected: 0
><3> RCU nest depth: 0, expected: 0
><4> 4 locks held by kms_cursor_lega/1505:
><4>  #0: ffffc90003c6f988 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_mod=
e_atomic_ioctl+0x13b/0xe90
><4>  #1: ffffc90003c6f9b0 (crtc_ww_class_mutex){+.+.}-{3:3}, at: drm_mode_=
atomic_ioctl+0x13b/0xe90
><4>  #2: ffff888135b838b8 (&intel_dp->psr.lock){+.+.}-{3:3}, at: intel_psr=
_lock+0xc5/0xf0 [xe]
><4>  #3: ffff88812607bbc0 (&wl->lock){+.+.}-{2:2}, at: intel_dmc_wl_get+0x=
3c/0x140 [xe]
><4> CPU: 6 UID: 0 PID: 1505 Comm: kms_cursor_lega Tainted: G     U        =
      6.18.0-rc3-lgci-xe-xe-pw-156729v1+ #1 PREEMPT_{RT,(lazy)}
><4> Tainted: [U]=3DUSER
><4> Hardware name: Intel Corporation Panther Lake Client Platform/PTL-UH L=
P5 T3 RVP1, BIOS PTLPFWI1.R00.3383.D02.2509240621 09/24/2025
><4> Call Trace:
><4>  <TASK>
><4>  dump_stack_lvl+0xc1/0xf0
><4>  dump_stack+0x10/0x20
><4>  __might_resched+0x174/0x260
><4>  rt_spin_lock+0x63/0x200
><4>  ? intel_dmc_wl_get+0x3c/0x140 [xe]
><4>  intel_dmc_wl_get+0x3c/0x140 [xe]

Isn't the real problem reported here that we are using a regular
spinlock for DMC wakelock instead of a raw spinlock?

--
Gustavo Sousa

><4>  intel_set_pipe_src_size+0x89/0xe0 [xe]
><4>  intel_update_crtc+0x3c1/0x950 [xe]
><4>  ? intel_pre_update_crtc+0x258/0x400 [xe]
><4>  skl_commit_modeset_enables+0x217/0x720 [xe]
><4>  intel_atomic_commit_tail+0xd4e/0x1af0 [xe]
><4>  ? lock_release+0xce/0x2a0
><4>  intel_atomic_commit+0x2e5/0x330 [xe]
><4>  ? intel_atomic_commit+0x2e5/0x330 [xe]
><4>  drm_atomic_commit+0xaf/0xf0
><4>  ? __pfx___drm_printfn_info+0x10/0x10
><4>  drm_mode_atomic_ioctl+0xbd5/0xe90
><4>  ? lock_acquire+0xc4/0x2e0
><4>  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
><4>  drm_ioctl_kernel+0xb6/0x120
><4>  drm_ioctl+0x2d7/0x5a0
><4>  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
><4>  ? rt_spin_unlock+0xa0/0x140
><4>  ? __pm_runtime_resume+0x53/0x90
><4>  xe_drm_ioctl+0x56/0x90 [xe]
><4>  __x64_sys_ioctl+0xa8/0x110
><4>  ? lock_acquire+0xc4/0x2e0
><4>  x64_sys_call+0x1144/0x26a0
><4>  do_syscall_64+0x93/0xae0
><4>  ? lock_release+0xce/0x2a0
><4>  ? __task_pid_nr_ns+0xd9/0x270
><4>  ? do_syscall_64+0x1b7/0xae0
><4>  ? find_held_lock+0x31/0x90
><4>  ? __task_pid_nr_ns+0xcf/0x270
><4>  ? __lock_acquire+0x43e/0x2860
><4>  ? __task_pid_nr_ns+0xd9/0x270
><4>  ? lock_acquire+0xc4/0x2e0
><4>  ? find_held_lock+0x31/0x90
><4>  ? __task_pid_nr_ns+0xcf/0x270
><4>  ? lock_release+0xce/0x2a0
><4>  ? __task_pid_nr_ns+0xd9/0x270
><4>  ? do_syscall_64+0x1b7/0xae0
><4>  ? do_syscall_64+0x1b7/0xae0
><4>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
>Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>---
> drivers/gpu/drm/i915/display/intel_display.c | 36 ++++++++++----------
> drivers/gpu/drm/i915/display/intel_vrr.c     | 16 ++++-----
> 2 files changed, 26 insertions(+), 26 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/dr=
m/i915/display/intel_display.c
>index 94fff7c5f8dcc..806dcc308d328 100644
>--- a/drivers/gpu/drm/i915/display/intel_display.c
>+++ b/drivers/gpu/drm/i915/display/intel_display.c
>@@ -1572,9 +1572,9 @@ static void hsw_set_linetime_wm(const struct intel_c=
rtc_state *crtc_state)
>         struct intel_display *display =3D to_intel_display(crtc_state);
>         struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
>=20
>-        intel_de_write(display, WM_LINETIME(crtc->pipe),
>-                       HSW_LINETIME(crtc_state->linetime) |
>-                       HSW_IPS_LINETIME(crtc_state->ips_linetime));
>+        intel_de_write_fw(display, WM_LINETIME(crtc->pipe),
>+                          HSW_LINETIME(crtc_state->linetime) |
>+                          HSW_IPS_LINETIME(crtc_state->ips_linetime));
> }
>=20
> static void hsw_set_frame_start_delay(const struct intel_crtc_state *crtc=
_state)
>@@ -2542,14 +2542,14 @@ void intel_set_m_n(struct intel_display *display,
>                    i915_reg_t data_m_reg, i915_reg_t data_n_reg,
>                    i915_reg_t link_m_reg, i915_reg_t link_n_reg)
> {
>-        intel_de_write(display, data_m_reg, TU_SIZE(m_n->tu) | m_n->data_=
m);
>-        intel_de_write(display, data_n_reg, m_n->data_n);
>-        intel_de_write(display, link_m_reg, m_n->link_m);
>+        intel_de_write_fw(display, data_m_reg, TU_SIZE(m_n->tu) | m_n->da=
ta_m);
>+        intel_de_write_fw(display, data_n_reg, m_n->data_n);
>+        intel_de_write_fw(display, link_m_reg, m_n->link_m);
>         /*
>          * On BDW+ writing LINK_N arms the double buffered update
>          * of all the M/N registers, so it must be written last.
>          */
>-        intel_de_write(display, link_n_reg, m_n->link_n);
>+        intel_de_write_fw(display, link_n_reg, m_n->link_n);
> }
>=20
> bool intel_cpu_transcoder_has_m2_n2(struct intel_display *display,
>@@ -2736,9 +2736,9 @@ static void intel_set_transcoder_timings_lrr(const s=
truct intel_crtc_state *crtc
>         }
>=20
>         if (DISPLAY_VER(display) >=3D 13) {
>-                intel_de_write(display,
>-                               TRANS_SET_CONTEXT_LATENCY(display, cpu_tra=
nscoder),
>-                               crtc_state->set_context_latency);
>+                intel_de_write_fw(display,
>+                                  TRANS_SET_CONTEXT_LATENCY(display, cpu_=
transcoder),
>+                                  crtc_state->set_context_latency);
>=20
>                 /*
>                  * VBLANK_START not used by hw, just clear it
>@@ -2754,9 +2754,9 @@ static void intel_set_transcoder_timings_lrr(const s=
truct intel_crtc_state *crtc
>          * The hardware actually ignores TRANS_VBLANK.VBLANK_END in DP mo=
de.
>          * But let's write it anyway to keep the state checker happy.
>          */
>-        intel_de_write(display, TRANS_VBLANK(display, cpu_transcoder),
>-                       VBLANK_START(crtc_vblank_start - 1) |
>-                       VBLANK_END(crtc_vblank_end - 1));
>+        intel_de_write_fw(display, TRANS_VBLANK(display, cpu_transcoder),
>+                          VBLANK_START(crtc_vblank_start - 1) |
>+                          VBLANK_END(crtc_vblank_end - 1));
>         /*
>          * For platforms that always use VRR Timing Generator, the VTOTAL=
.Vtotal
>          * bits are not required. Since the support for these bits is goi=
ng to
>@@ -2770,9 +2770,9 @@ static void intel_set_transcoder_timings_lrr(const s=
truct intel_crtc_state *crtc
>          * The double buffer latch point for TRANS_VTOTAL
>          * is the transcoder's undelayed vblank.
>          */
>-        intel_de_write(display, TRANS_VTOTAL(display, cpu_transcoder),
>-                       VACTIVE(crtc_vdisplay - 1) |
>-                       VTOTAL(crtc_vtotal - 1));
>+        intel_de_write_fw(display, TRANS_VTOTAL(display, cpu_transcoder),
>+                          VACTIVE(crtc_vdisplay - 1) |
>+                          VTOTAL(crtc_vtotal - 1));
>=20
>         intel_vrr_set_fixed_rr_timings(crtc_state);
>         intel_vrr_transcoder_enable(crtc_state);
>@@ -2789,8 +2789,8 @@ static void intel_set_pipe_src_size(const struct int=
el_crtc_state *crtc_state)
>         /* pipesrc controls the size that is scaled from, which should
>          * always be the user's requested size.
>          */
>-        intel_de_write(display, PIPESRC(display, pipe),
>-                       PIPESRC_WIDTH(width - 1) | PIPESRC_HEIGHT(height -=
 1));
>+        intel_de_write_fw(display, PIPESRC(display, pipe),
>+                          PIPESRC_WIDTH(width - 1) | PIPESRC_HEIGHT(heigh=
t - 1));
> }
>=20
> static bool intel_pipe_is_interlaced(const struct intel_crtc_state *crtc_=
state)
>diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i9=
15/display/intel_vrr.c
>index 00cbc126fb366..2e19673697fa4 100644
>--- a/drivers/gpu/drm/i915/display/intel_vrr.c
>+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
>@@ -300,12 +300,12 @@ void intel_vrr_set_fixed_rr_timings(const struct int=
el_crtc_state *crtc_state)
>         if (!intel_vrr_possible(crtc_state))
>                 return;
>=20
>-        intel_de_write(display, TRANS_VRR_VMIN(display, cpu_transcoder),
>-                       intel_vrr_fixed_rr_hw_vmin(crtc_state) - 1);
>-        intel_de_write(display, TRANS_VRR_VMAX(display, cpu_transcoder),
>-                       intel_vrr_fixed_rr_hw_vmax(crtc_state) - 1);
>-        intel_de_write(display, TRANS_VRR_FLIPLINE(display, cpu_transcode=
r),
>-                       intel_vrr_fixed_rr_hw_flipline(crtc_state) - 1);
>+        intel_de_write_fw(display, TRANS_VRR_VMIN(display, cpu_transcoder=
),
>+                          intel_vrr_fixed_rr_hw_vmin(crtc_state) - 1);
>+        intel_de_write_fw(display, TRANS_VRR_VMAX(display, cpu_transcoder=
),
>+                          intel_vrr_fixed_rr_hw_vmax(crtc_state) - 1);
>+        intel_de_write_fw(display, TRANS_VRR_FLIPLINE(display, cpu_transc=
oder),
>+                          intel_vrr_fixed_rr_hw_flipline(crtc_state) - 1)=
;
> }
>=20
> static
>@@ -693,7 +693,7 @@ static void intel_vrr_tg_enable(const struct intel_crt=
c_state *crtc_state,
>         enum transcoder cpu_transcoder =3D crtc_state->cpu_transcoder;
>         u32 vrr_ctl;
>=20
>-        intel_de_write(display, TRANS_PUSH(display, cpu_transcoder), TRAN=
S_PUSH_EN);
>+        intel_de_write_fw(display, TRANS_PUSH(display, cpu_transcoder), T=
RANS_PUSH_EN);
>=20
>         vrr_ctl =3D VRR_CTL_VRR_ENABLE | trans_vrr_ctl(crtc_state);
>=20
>@@ -705,7 +705,7 @@ static void intel_vrr_tg_enable(const struct intel_crt=
c_state *crtc_state,
>         if (cmrr_enable)
>                 vrr_ctl |=3D VRR_CTL_CMRR_ENABLE;
>=20
>-        intel_de_write(display, TRANS_VRR_CTL(display, cpu_transcoder), v=
rr_ctl);
>+        intel_de_write_fw(display, TRANS_VRR_CTL(display, cpu_transcoder)=
, vrr_ctl);
> }
>=20
> static void intel_vrr_tg_disable(const struct intel_crtc_state *old_crtc_=
state)
>--=20
>2.51.0
>
