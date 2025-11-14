Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EF5CE7AA8
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 10:07:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C119410EA2D;
	Fri, 14 Nov 2025 10:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TbINS7wQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C9C10EA2C
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 10:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763114850; x=1794650850;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=PPbMOFLAm+lIWpycjzyXyPN/F0wFvEWIHaX9SL3F3LI=;
 b=TbINS7wQpI0P2GnhVNWPxjRMZlIxX8EMKr0oOfvJVZOtAdY1OK8n0Zwt
 xX5GWlDPGtIUCrS1JvH94CiNTdMjpm3TRXNnOOytZej6r3dSAE4tNbIrd
 FDtxHs/8qT+G7RbJe0CPsCSzb3NHM+1mAnaf4IBUg97Dw0BgQMFVIkNRK
 XeIGNQWnNdMMmjm/3zULxbnsIctbAMcXkyAVV5ocZBCz1Pk1HZ1AarJ3b
 4KWJvWosFyu/tGuMfXk0805ImVJBwYjSaPyq9Z7otySLoU4pPc8qsp+Kk
 PkeHj7FnXAbtJxj9orlQp8M5V44LsJIKqBLxvsiKWw0zVCPw+YBlP0hHl w==;
X-CSE-ConnectionGUID: +rDfvMF0TCu9rb89YhOsXg==
X-CSE-MsgGUID: xxqSsKDOTpyx+GDO0EckFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65245763"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="65245763"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 02:07:29 -0800
X-CSE-ConnectionGUID: 0SWASwWTTR+G3/WPoKuqag==
X-CSE-MsgGUID: xuMFrqCGTyKmPrQVjd7vFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="189944570"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 02:07:30 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 02:07:29 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 02:07:29 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 02:07:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MN5NbGJz6FcwjfadfA3LhGxSyD2sLGEk0l8SwH7ULzlgdUQedXamAATrVJDmaWFdzSuxtrydWP3hoxuaw5n7hJV8HuBKcVxg/CW8AjOHXwxUaNSuyuPK2kqSb1cLxlHgDqXVEK3O5kk4qC5xgWBaAQ+AZzyVjuYLqbadAcraN3cD16QTaPwdqInI5aalIuzbF8xKKNpRuiYo8Bk4/XcQd8/z6iotiwM4Yvkxm4wAy7wItjM3SlVF3iVulhfDM7Bh+FNtLFvcqX3Z0TReZ2KH/bGjGJcOXQ655BkGXOdEYZd3IOGqbjTMy7+M4hIH0UqigFrnTr4bKYslfKgQtUkhOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XK6gI2yZA5tBLYJm1H/GqHrV0Pa8/WFtCpxchg7lolI=;
 b=cprXK/Umslp8v2geNuwBeFLyRN9JYTT+O7fccPS+625GOoUYHLjIflk3vgTWNMQ00TRGB0RrKveJMKFQEhMAniTbiM7icMinKfSNkCZlhajeGnJ1YtICjjhReTj5Q71ij426nSsXccys/excRrWCxoJd0OlYzFAeIwP/PCtmfFdwmUnVVV1y59JHpFYgfaeJ08grSr/BUY8wjqHDum4Rjb0jPXs3zUw8jbENklFjRiTYzY5HSKsrSHOn053xkxT+6fQ+h1yeY5HzL1yqiMCJEp84AvCJX27gVO+PWCSxEPkIfdifO7BOZANyvJ6hXYKQ4te8ttDUweMSpGhqNGs6aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB5056.namprd11.prod.outlook.com (2603:10b6:a03:2d5::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Fri, 14 Nov 2025 10:07:27 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 10:07:27 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lukasz Laguna <lukasz.laguna@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>, Adam Miszczak <adam.miszczak@linux.intel.com>
Subject: [PATCH] drm/xe/pf: Drop the VF VRAM BO reference on successful restore
Date: Fri, 14 Nov 2025 11:07:13 +0100
Message-ID: <20251114100713.1776073-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR10CA0089.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB5056:EE_
X-MS-Office365-Filtering-Correlation-Id: b1b1b0fd-6b94-441c-ee4e-08de23659d4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MU9OMWFZMjB3TmZpdEV2TGZZS2Q4eHZyZHFOVEU5M3ZTWHRkUGhyVEVkM0Er?=
 =?utf-8?B?RU9QbEgzMGVMZ0tjTERReDZUV002c3RWc1RLb3RubFhOekhKMU1XY1lCc0xO?=
 =?utf-8?B?ckJLRW1EY21LYUVyQkF1L0xrVUVHYzdtSWhSdU5lTHhlTms1WFBIWUljZmg3?=
 =?utf-8?B?QkY0WElrb3M4MFN4Wm9TU0ZXK293QXRBeXpxZnBVblhyQmRHSHBXUEhmMytz?=
 =?utf-8?B?LzBwWEVtSnhCVVdTbjNQZk9zNFoyT3FrWlNVWW5hSHpaSzV0cXVSKytzbkFp?=
 =?utf-8?B?bFBaQlFheGNVaXQybWhkanhxQ1o2bHFqY2JDWnVITWdJZUpPNnhOd0dQMWdi?=
 =?utf-8?B?N3MzUEs5Ly9zOCs2bXBDSExoVWdOUXJBemEyakFPREU4Z3IyZCtxcVExYXBy?=
 =?utf-8?B?QmJFWlgyS1JDZmNXMXVFNXFLOUZVa3ZNVFhPNjlzQisyZTFKL1JjQkloQUVV?=
 =?utf-8?B?dkp5d29YSVluMm9LUXVBUDI3eWNrRi9uc21VUUNaNXErblFJcWJVbHNHY3JV?=
 =?utf-8?B?VC8zOWVOZmJYUUozYzhEd3hVK3Y1RStwWit2REdQT1VuNGh5TEMrcDR4QUtj?=
 =?utf-8?B?VDdpUk56VnV6ZllpelZJSDZDMmljNnc0U3FrSDZmalYraWdvSXVjRVA4NlMz?=
 =?utf-8?B?dXB6ZFhodFdJM0lqZk5CMzdJL25MRkpIQ1JvS2VGa0dkUnJ5d3ArTzlPZmhT?=
 =?utf-8?B?MDhBaVNYWEladUo1UW4yUTVxaDJDSmZOcG1rNDBHS0M3enhqOWZmN3dKakZQ?=
 =?utf-8?B?TzRJMUNBRUZnSHdzRTM2SE1rYzQ5YXM4Z3I2UUVhQStsbFZjempEakx5U0tI?=
 =?utf-8?B?Y0dnNzJmSlYxV0Y3Z3ptS1lyeTg4VXpXeHVmSWFUT1hkdDBDai9ERUIreEdY?=
 =?utf-8?B?K2RHT3Zwb3FYdDFQVWFmS1A5UEY0emlYcmZ5Vy90VFJkRVo5Mjc4YTNXWTZ3?=
 =?utf-8?B?VUJCbExNVWRhbGtUVTBTcmFOb0x0UnhobExCMjBOaTNzcWNpNm9aaU5MQVlM?=
 =?utf-8?B?VDhQOFpCQ0p5R2xYRlFJSzhJQnkyZ1dXR2Z1ckp6VlFPL2kzVGFMSHdnUnZ2?=
 =?utf-8?B?Wm1zVTZNWlh1WVBUVCsyQTZET1dYemZNZk1uaVAwYy9LS2wxU3RZZ3Jhazlu?=
 =?utf-8?B?OFdqYXMwTGFrT3VjU1pEQ2xNUUNSdkVSN2FSUjdRQUNTUXdrZ2tmNXZmdmlv?=
 =?utf-8?B?YmwrR01oZjhxNGl4dzdNTG1lclNsaFRPdFlUNTRES1FmQ1lrV0YrSFNyeTh4?=
 =?utf-8?B?QTRnWEp6ZVFVNS80V29TT0NIelJtTWtIWWRrWERmckdKaGdvSjJLK2dTNlZ6?=
 =?utf-8?B?SklrNFhwVXlHRm56eTVYYU9DNlB0cFF5N2d5RG52bDZxcVAyV3NMcUl6dmZ1?=
 =?utf-8?B?VUpQMVRXQkI3V0ZJNk8zS3hJSWZPY1lwbjBtZjVWTFExeHkrWEJ3aWhEWHBy?=
 =?utf-8?B?WU1DYlJVeDloM0UrbFZGcHM3MGhnOEF3d0REU0hwMjdWUERudklhUEFHY3VU?=
 =?utf-8?B?Vm04K2FaekxOUmVpN0FEam8vTEFIdWcxSm0xcS93ZC9mRHozWENLMHZaYTJa?=
 =?utf-8?B?VTFqMmRiQ2dJeHBta1hDdDNqWDRMSEsxTXlSY05ZV2ZIdEJwbnpEOXpJSXgy?=
 =?utf-8?B?L1c0L3dycDJxb2g0c3U4NkppRWl2S0RONkE5UjdrR0Q3MkNEaTdjeUVzRCt2?=
 =?utf-8?B?MzlFSTA0Y0c5NVQ5ei9XUnlGcG0vQzRhVmVWSG1rMnZRT3k4YXRjUndhb1dS?=
 =?utf-8?B?di81eXVEbW9JTE1sOTNIbTJoWEFpeDk3K3EzYXluRkt4eFJCdk1DYzlxekc5?=
 =?utf-8?B?bUpSQm45R0F2TCs1b1ZLWVdUSTc1TTdyd0pmcGJ2UTVqZ25OMnF5Q1lWV0Fj?=
 =?utf-8?B?NHhNTC8ybUs2M0Q5Z251aFdmTmNPZVBoZU9YdzBoZDlCTVFmeDdjR1VqSXlK?=
 =?utf-8?Q?ax2+NnPZnfD0QsA9Bk+cSAkJGkafUk+A?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVM2ZWlDVjNEQmtCWU1QWDlIQm9lTjFxUDdNTldUaXJCeGl2UFpGWnRnaEYv?=
 =?utf-8?B?MEVmTjRWNFBvcS9zbFVCa2FQa2JLY2d3QTNmdjBYM3hDc3JBR0poTjdDRzhH?=
 =?utf-8?B?MjM5azBLcUdKNHdyQUdMWmNrY0tidmZ3U3FpNEh0aTVUd3Y5dnJTOTRqSEhs?=
 =?utf-8?B?OUJ3L3N1QUR3MXIzWVVtMWJybndKWHRCcHdxTUVzVzlHZ01EQVlKSVJtbi9M?=
 =?utf-8?B?bzVzMzBVQ3c1eVZiaGVRUnIvdnBneVFqODhaR0pma3ozb25nRElyYUxRNStX?=
 =?utf-8?B?bG1zOUU0RFo2VXl2ejIxK1VpcVBycTFaLzlxdytNemFWK2paUzRoY3RnQnNy?=
 =?utf-8?B?MktRV3I2b0NMcXhvaExXZVhaenZXTTJDaDkxS0pjaTlhdXA3WE9EaHZZdjda?=
 =?utf-8?B?Tk4yTzA2dkRUbWdzQ0FENUFaUEt1NUdURnQ5QjhhSVV5cldqOUxBdU5KbXpV?=
 =?utf-8?B?Y0lNZSs2dkJRQ2ZVSlo2Lzh3eUsyRVFEQUlpYXJ4Sy9JTHdRYVNRZE5ReXNu?=
 =?utf-8?B?MEd3cUgzd3l3bnhUblhtT2MwTkZFNERsT0tuNy95OTZnYlhOZkI3SXpPcWk1?=
 =?utf-8?B?emNGOStXMXF3eGRpeUlUd01JWUpLT1ROZjM5cjhhWGFoMUp1cGlqYWM3T09B?=
 =?utf-8?B?Sm1YeldJTmtYT0IwRlVHT3l1cW5DQTh2UnR4L3lxaG91ZkJra3V6VWtqQVFQ?=
 =?utf-8?B?Q1AzUFlkK2dFZUFCclFiMHJMYUkwVFZiVTAxbVZHcXBZSEhWT2VqSW1aMWR0?=
 =?utf-8?B?RFRtLzhvZEtZVWF4aUZ4S3NTenlDVGhPUTU5NnJtVU9yQTY0WDVjdFdGdWlC?=
 =?utf-8?B?RklQMkE0U1N4YTFvTms4VGNrMWlCQ2NCaTJ1TEdPS21UWW9PWEIyU3poOUYz?=
 =?utf-8?B?SjZ2SnZ4WnVQOHREYW5YMjE4NzBLNVdXWXZ6eVhxejdRbWNHNjBFdDVLRzgr?=
 =?utf-8?B?K3NObUpObUtNVk41S0praU8zaW85ZUU5OFMxd09oU1NFT0lFTytMVHUwdDJO?=
 =?utf-8?B?ekw1QmJtMjdUdjRockFHUHRpd051bVlVVzVBRk9KNkxwc0xVOUMrRXk1b3FO?=
 =?utf-8?B?UWtwbmNVSUpWWnFhajE0RjVGWk1Wc0dDOTNNSDlHVFZGVEFwL3NiVzBGMGt5?=
 =?utf-8?B?a1gvMHFHWnNTUVQyYWhTWG1yVUtZRjVsNkFwRDV6eE5VQ2tjR0pQY2diT3RB?=
 =?utf-8?B?TS9BbGhBVnRqSUgxcWs5TGlCNW55djZxbnJBWkpPWEx2NzA5T2k1Zk5mVDdC?=
 =?utf-8?B?cE1aTXBqdXpCWEdKb3RnM0c2NG4rNkJNZWpDNHdxRWtIRkZjUCtxZFlwUEJQ?=
 =?utf-8?B?ZlIvRlRDZlZBT1FacXVwTVRnZ21sQTlnL0hKM01jTVV3T0J4ZDBxT2xjWTJM?=
 =?utf-8?B?R1h3NVg4OTYvTTBRTjU3QlFuQ3NZZWRPWnh1RkpoNjZDdEQrdzJKV3k5ZE9w?=
 =?utf-8?B?eFVUY0VTYlpVNWMvaFFObldVcXZuOHZhVlFKNmpZWUQ1Q0FNMk1ndnkyT2NN?=
 =?utf-8?B?emJOd0pjYWxsRmdMMzh0ZW4rdzJuMS9WTEN3YjFuWEhlYnhXQVh2YnNld0pY?=
 =?utf-8?B?YnIyQlR6YmxJQjhUYkVtR0N0SlRFSi9Tc0x5Z1pka2ppblFKU2NHZ2pudzNw?=
 =?utf-8?B?cnVsVDkzSmVqL0NsOVJ6MGI4WXIrZXRDU282QVMycExTU0VKbXAvR1o2cU9H?=
 =?utf-8?B?VzRISkhKUzJpZTgwZGdqTzBmTE51c3RSb1UxR1czNTVhRHhtL2hXOUZLa2pt?=
 =?utf-8?B?K2hzekVoMHMxUzBOM0tzc1ZHRGdib0gvVFQ4eFhjRlUvcmpKaDNWUkM2dHJF?=
 =?utf-8?B?d3ZEd2wzUDBDQ2g2L0FKUjZ3WHYyLy82ckVsRWZldklHc2d4TlM2OWF6SGNO?=
 =?utf-8?B?bGM1aVBlOGJLaGRTM3E2bU80SlFha1c3SjdWS1RyRldkMHoxMmpBV0JSU28y?=
 =?utf-8?B?UlY2SU42bGl5N21WWEhadWhjUjF3bmZ0TE5TWXp5aU1kRFlJaW1ZNjNlS2c4?=
 =?utf-8?B?d2sxSTgybXltSjQ3azVLNk8xMCtxdXd0SysrMEVnbVpBU3VTRkp6ZDdBbUw4?=
 =?utf-8?B?MElrQ0NBYi9jVjRISHl5S2xobWlWemNISXdOTFVkcnd3K1RhaGN1QXlIRkFE?=
 =?utf-8?B?eDRJR0kzTEhFYUhGSVVBQWtGa3hOL01WVTcxTGhBbTNMYTlIZFlDRU5HSGlk?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b1b0fd-6b94-441c-ee4e-08de23659d4b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 10:07:27.3393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNEBjwR2ovf73/QCCrySwhiywBHlYhuMKJO0cR7pY7gaqrBpA8cwuWqK7t7xNcWCPhi1dxr02RuprutkzvHzPtWbaLG62gQ6hLI2f487Ezs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5056
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

The reference is only dropped on error. Fix it by adding the missing
xe_bo_put().

Fixes: 49cf1b9b609fe ("drm/xe/pf: Handle VRAM migration data as part of PF control")
Reported-by: Adam Miszczak <adam.miszczak@linux.intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 78f7b842fc624..6deb4835eb44f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -662,6 +662,8 @@ static int pf_restore_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid,
 		goto err;
 	}
 
+	xe_bo_put(vram);
+
 	return 0;
 err:
 	xe_bo_put(vram);
-- 
2.51.2

