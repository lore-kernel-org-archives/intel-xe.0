Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F058EC10F1A
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 19:17:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D2810F0A4;
	Thu,  9 May 2024 19:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JeepGLSV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994FB10F0C7
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 19:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715282234; x=1746818234;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=XQWf4eOuGkVqH1Owbg3RrMW+KW/VHhdUyhoaxSb7I4E=;
 b=JeepGLSVlHYOGyJGXrIcpX8unAqAC0J5LGsUGVfKip9JPdQxDS6AFC8C
 Y3MbzfXAsXcZl18Bah0fETlksigB1TLY8pZJPWPoB0xy24xAsctV93L3j
 PFXCwoUghDoVlyqwjG+XZyw81v9v96SCOOWEYnB3fJe2/017ksoY2CtLO
 RMAyvPhWwKPw8L3VB8Ap+9JD8rKOWEJb/jcXASNoBV7llLO/wFKOjrdDO
 mg5eTOSN/4zxKba5eML5i5XRkNwC///csKMJe4Iq8JtCziY4V8lFeZWtb
 S+0p9CrFg2jSp3aJkD/ykNkNjZaejz4tMkubA2CUg2ufIga0VM7Lx5Q/A g==;
X-CSE-ConnectionGUID: ojN6CxcYR8i3gYVndgXJ8Q==
X-CSE-MsgGUID: N1/tHipMRoCEmRWot2AiQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15038465"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="15038465"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:17:14 -0700
X-CSE-ConnectionGUID: ErAtznXjQh6QpvfZL1Y9tg==
X-CSE-MsgGUID: uNrbayaRSyunpwhTHcZnJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="33879278"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 12:17:15 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 12:17:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 12:17:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 12:17:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 12:17:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocio8HWJN2uRtlKtgRtdT44h2vPTs3KzIMONU32GbhfWFaIQ3G8CxbAy5kpPUKxMCeMuFRgDd40Dg+r9ISZFwCBl07nUt5qHAVIsAaCuLFmuRhVOWb0Bm1yW2yhKZRIZXjzGn0Y4U1HWvgEBdsdzWP7ROUpzIljrG3+aDOOsaDav1cRF5E8JBaDSvRJ744LVsZmpoplziTdrzLcuTJnqfo3pYo+aI9u1c80MZpsg8U4uLyYPD1P5IGb7axYrykMFTMKE045E15aYBMB94ND9zmhMccYYa5uxSDDPk4GU/KA2zZy0uBrujvEawKgqAI511qAYQUkAcAoYhNpLzi8JYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOXwQJ3XQu/XBqcQxV6wPvjkMpwKz9jpr0ZCppTdMyM=;
 b=ThdLwAou5i+ypl3ZOCikRZgrzcnCzde6NiMxAX4ZWD6ya1L1LqG0Sghv6fmA6XTgGRlolPMCkKIqMqv8IFzLpCcE0vJQovFgceyVJPnBf+FwJLOtE5ibWMfIpQXyHbq6FC2yfWAiWqaMoQVmon5z0w2YuzXpMkq+aQ3GRUZavP5oz3Q5jEFGhyUxsXcq5Z2i2CBlBeziqXbYyNdDBmQqiEqrVN/dieXjbhAWFSx0ZqqSO4wAemQ0DnlOcYD8Z1vIj//9G3uzU7/phwfV6QT08ipGzy1FzINDvWG3FDeV4dKx4yvWI+3lPRf8gS9AwEhqQrQMZj0eP80P+FGGoWR9bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5294.namprd11.prod.outlook.com (2603:10b6:5:391::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48; Thu, 9 May
 2024 19:17:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.047; Thu, 9 May 2024
 19:17:11 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Brost <matthew.brost@intel.com>, Francois
 Dugast <francois.dugast@intel.com>
Subject: [PATCH 4/7] drm/xe: Relax runtime pm protection around VM
Date: Thu, 9 May 2024 15:16:54 -0400
Message-ID: <20240509191657.504300-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509191657.504300-1-rodrigo.vivi@intel.com>
References: <20240509191657.504300-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0199.namprd04.prod.outlook.com
 (2603:10b6:303:86::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5294:EE_
X-MS-Office365-Filtering-Correlation-Id: 7850b86d-fa2b-40a4-2428-08dc705ca0b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0ZuRmdPNmc5REZKSk9mVGdCSERiMStRZE13V3ZZQkdDaS9ES2VZMmN0Ylcz?=
 =?utf-8?B?R0RjdHgvcmgybnVBek1HOW10SVV2ZFVqcUhIWWZrMmFzSURiZnVPemZJby9P?=
 =?utf-8?B?YnNWdEc1QVBua29QQnZjMGdvWU4wYWYxZjN3cFA4WjRmRjBDOTBJbElnZzlE?=
 =?utf-8?B?T3A2cjFJMU5nNmVWTmhXVDRSejczbzlLMVFuRW9VRTNqZURCSlI2cVJNUEx2?=
 =?utf-8?B?UTZlUTRlMS9WYVJmZDBNaENlOWVkaVE5MW5LaTlYOUpRNVJza2NLZ3lhZ2FZ?=
 =?utf-8?B?UFVRUHFCU2t1NUM3dVdKdFkva1BqV0h1WmxuVHRtZkFkaWdXSVkrd0NRQWdP?=
 =?utf-8?B?RDA1ZUF0eExoK1BJVVh1VDV2ZkZzaGNTdHEzNU9YL1dRV3Azb0tkS1U3ZEJs?=
 =?utf-8?B?c0pHdU81L0FTejg5MkYvUDdiTEZGRnRXcjlmTHlLNUxCeUFaOFZNbjJ2bUk0?=
 =?utf-8?B?aVZaUUtCRkZPdjVmRXJ2cGd0UXcxZ0xJSDM3bkZ4VTRNSXJkV3QyNDNzdzhq?=
 =?utf-8?B?SGNRUWZreWs2M003aWRqeWFCZXZjdzhIaWdMU2VnbFNBMGRYcEVwRnFBdTFV?=
 =?utf-8?B?YUVTb2FhYjU5SnBzWG5JN0tIR1NaRDQrTDdKRGNCcVN2c1J0K0JoYlZTUWdN?=
 =?utf-8?B?a2VUQ1IxcEtxUE9mNkgrLzZkS29oTGFxVVk3WlBKOE04V2dsOG1uR1o4Vmk2?=
 =?utf-8?B?ZTVsVWpxVXFwRFZvWXVqaTRnbCtTME92Vk9pK0wzVnlUVG95STg2RmdBUDRJ?=
 =?utf-8?B?RHZWbWFHYkJaNXJzSnpIUW5RWmw3eW5UQ2JwazBGemQybXU0WGM0SWhRcm1s?=
 =?utf-8?B?dDlUNmJqOFZyeFZCYUh5U1RvSjlYSHpzSitZUnBYTE1WZFlvZ001cmluc1dE?=
 =?utf-8?B?NzlEcjBKRk1kb3MxOTF1WWE0YWN5YWd4ZWhzOThzNVJlbktUUGNGc2RMdEVL?=
 =?utf-8?B?ZjZrMFJNVlg3MTRSUFVYd2xHRHZ0UzVRVXdDcVo3dS9wRG1XTy8vaVJPdENL?=
 =?utf-8?B?SkNtcGh5RE5zbTczTExnUWxSdzZRYWtiajQxMU9jWnZNWmYxNncrakhDd3dR?=
 =?utf-8?B?dXFNaHk1eXhpWmVsM0xxUGIvRHZTeDRCQ0JvYjJiVm91aHZUamJIUWlETHlQ?=
 =?utf-8?B?UHlZQndKakhJb2FIbmpqdGtiYklVaEZFTWN1U1lwOWFINmtleU9TNTdZR3RI?=
 =?utf-8?B?UVlUeXFlRE1iMk04T1grbGNaL2ZsNC9EQkRMWCtHYWkvRHNrekZQdWsySGtt?=
 =?utf-8?B?U0FaQTZVUy9ZYkN4Z3ZKK0dVckc2eTNEaFdxKy9ybjZob20xSitxdENDT0g0?=
 =?utf-8?B?UkR0a3ZWUWtFdlA0WWNGYVk4MHp1VEF6K0tuTmZRbFEvUGN4MzFhS0U1MFNB?=
 =?utf-8?B?dVdaY1pveXAzZzhYME9jT2hYT0QxWnNpYnNXWm0vcTBESHlSUEcvSjJKZCt4?=
 =?utf-8?B?STlucEVXcFNLSFgzRVpBRGxMeEpvZ0o1NFozSEh6T1lOWVBuZUpTa1lLaE9h?=
 =?utf-8?B?dVNjaXRCRlNYbzl6bUVzODZMaE9GdERURmdWQnNWY250ZmVoZ0VhR3VDWm9h?=
 =?utf-8?B?UWl4YTh0SEVmWnNaZC90eHY5U01xdVJtK21pY25nTjdOekgzcFN6eGQzOWxx?=
 =?utf-8?B?OVJVNmNGUmhLSkhGbmJJOWVrWXpjNWZza1hENWcrN3phOHBhcXB0UHJHaDBD?=
 =?utf-8?B?R09NKzRJNS9oSGZaNkJKdklvRVhMb1p2ZHpwdEZxV2ErNDBKTWVzLzVBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXQ4ekZQN3QvZ0RxWEovbkl3alBFN2dsY1dEL2xuT3lNc2xyRzE0UXd3aklO?=
 =?utf-8?B?aGhyS0YrU2pQR2EvR1MzKy9uTGFHR1ZtVlI1aFkrb3Z6dzRLSFhIZmVTQ0Qx?=
 =?utf-8?B?T2x4UWtYSFlzY040dTI2dDJ4SnNGOHVOamtqWmJuei8wNm1kOVNlTVV5Y2JT?=
 =?utf-8?B?QzBHbXpFa3lOc29FZ3ZWL1hBUndWRnpYd252SlV6cnFyaEt2WStTdGJCaVlT?=
 =?utf-8?B?UTY1ZkhVVUZNYmJZTFdmRHZTRHkvdkVGWWR0c0V0NHNIWXl2MWVlOTh0dStY?=
 =?utf-8?B?WE9aUHNaWmZWcnRiSkk2UmJLek5UUDJiOTNYaFMySkVwSWw1STRCZEkwa0Zs?=
 =?utf-8?B?QUVmUFJXWldOcHFPOEUxcUFhRzJCOVlyODh6dkZCWGVXeExGWUk3bi9aL0hs?=
 =?utf-8?B?WkMvZW5aTnRkYS9IdXlVSm1UQktMMlBzdVpJUUlkQ25MUXh0c1lib1VXS052?=
 =?utf-8?B?OGxwTzBuL2UxMUVnbjNSRVJKR1NoSkdUR3lVOFFPMzJQTDlONzEydCtvdWQ0?=
 =?utf-8?B?Si9iT29YeFhYQzFzdDhYeG1xT0RuVGtKWldrK20vRllJQk92bWkxWDJza1dn?=
 =?utf-8?B?TW9yWnBibkVFTXNIdjltQVQ3dXN6TldlNEtjRm9YY2FnbitFTTlYN0NqbXhI?=
 =?utf-8?B?eWtZWW5FUC9UMTFXajZ6WE9rN24yVmxZS2E1YkZGZTE2WGRLTmowc2NKc0Rt?=
 =?utf-8?B?U0xTTVpIOFh0aWp6ZXRScWRnbjhqbiszSktQSUVJbTZHdVNnOThtNG05YlNk?=
 =?utf-8?B?RHJWWm9oSTVna0c2UTY1V20zaWNaNWJCVENua1p0R1Z0c0VXNjl0TWNpN2R0?=
 =?utf-8?B?ZG01dnRpc3RkUmdCMFB0TTM3U2QzMkxhQ1l1c0ZHY0xMcmF6dXF2K1VEZVVw?=
 =?utf-8?B?WDFscW9FYlJnVm40SEdwYS9uNE82TUtjUGloY042K1RwUjFZWm5xQkY1b2oz?=
 =?utf-8?B?Y0R5ZWNER1MwUC9WbWlmYWc1WS9JaXVYbDBheVZMOGZTVHltdjU4eGZXN2VG?=
 =?utf-8?B?cVV6Z0s4SUZiaTkwV0tTKzFUSUJaMXlDWHl3akNYYnNRUytER3BYdzkxdFp5?=
 =?utf-8?B?WG5oSkNHdjd2OEg5Tzh5YkVMMUJUM2lKM0ZDRWlRcG1NbWdxQWgrV0crZ2po?=
 =?utf-8?B?MXJkSTIrZUE5ckMzMktJdHQ2U3A5cjFUNTUvY3gwc0VYRFNjSm0ybitlcjRk?=
 =?utf-8?B?Zm9iSVJBY1diaFpXelVVYkhOTXYxbFovdkJ3aHZPT1hzV2lOZmNpdmtZcEJO?=
 =?utf-8?B?WElvckFDVTBZVzBidS9kM3dpTi9rUDhKRW8wOXpmQ0xtMjdQWXR6eUh3Wk9I?=
 =?utf-8?B?djFqQjZEbmNXYUh3NFY5T2RKRCtQWGt5UVRYOHJFY2UyVWJmeXFUaG9OVGVC?=
 =?utf-8?B?elhweVN2MzJURjM0RGpZZUpORzEyOTFVT1dFSmdMbTF4L01odVdaSlR4ejhp?=
 =?utf-8?B?ZUJRUWN4TG5sWUhuRVVQQkd3Vk5LanZnNis3M0t2S3dSemZ6RmVaUkRDalpp?=
 =?utf-8?B?Y1o0Z2daeCt6dGRSR0JhZFdYV2ltOEtYNmZtOTdjTWhvNm9FTWVCcDE1SXEz?=
 =?utf-8?B?c2Fqb001c1dicWphQ01SRFRrclpDTmNuL3AzMjg3QnNRNmxXYy95b3YvSU12?=
 =?utf-8?B?U0VUcDdIU3BoQTFQV3I1bkhFcytoTkQ4NmxGSkE0Q0RBcHJLYjI5MEJQQW45?=
 =?utf-8?B?WGViMTNKcjhDQzFhM1hDT200SlZuVkhJT3ZFbU9TRlZ0YWwwOHNhNGN5cmtl?=
 =?utf-8?B?NDBuQ2tOZ0pPV0I1QTZpNUFrWWpPTStJcDJwajc4OUZibWltM2F3WXZOeUJ4?=
 =?utf-8?B?MFMrNmIrWFVCT2pFdHZFdEtLcFZtVURwVG1ZRHV3L1MzT1NwOGZFTThvUFhY?=
 =?utf-8?B?UnBvYUhNRVJ4NnNHZW9VNmpMTkRhV3RnM1NHdE1rSkdIR0p5TmhTbWZVL0s3?=
 =?utf-8?B?b2l5ODRSTGRNUlJxR0tCdUpwampYN3pURnRWRXRXSXpOUm14TXhlbzY4QWZH?=
 =?utf-8?B?cUZEYUtVRWRFUzU0TGV4NDhWVGRMbUNsSGR3Nm5iY0kxQjEzcFRMcVBiYjBS?=
 =?utf-8?B?ZmI4ZXBBSVM3MkJKNmlpNEtaVkt0L2FZZzdhOFU5TUpiSXNNeWRhams3OXd1?=
 =?utf-8?B?L2FzUkJrSTZTWkZidVpIVDZHU2t5OWhuMUlLOXMwNVppeHlIWExPU3hGeVBD?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7850b86d-fa2b-40a4-2428-08dc705ca0b5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 19:17:11.7245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /lzfhfOlr2NOQxU3MADEcSj8YPSCqlCUmMsbW7m97fDR07i30W8lZmzZuORBx5+E7QGOEMp8HEuqGc7vu15OGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5294
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

In the regular use case scenario, user space will create a
VM, and keep it alive for the entire duration of its workload.

For the regular desktop cases, it means that the VM
is alive even on idle scenarios where display goes off. This
is unacceptable since this would entirely block runtime PM
indefinitely, blocking deeper Package-C state. This would be
a waste drainage of power.

Limit the VM protection solely for long-running workloads that
are not protected by the scheduler references.
By design, run_job for long-running workloads returns NULL and
the scheduler drops all the references of it, hence protecting
the VM for this case is necessary.

v2: Update commit message to a more imperative language and to
    reflect why the VM protection is really needed.
    Also add a comment in the code to let the reason visbible.

v3: Remove vma_access case and the mentions to mmap. Mmap cases
    are already protected by the gem page fault.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Tested-by: Francois Dugast <francois.dugast@intel.com>
Acked-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c5b1694b292f..2a49dea231e7 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1347,7 +1347,13 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	vm->pt_ops = &xelp_pt_ops;
 
-	if (!(flags & XE_VM_FLAG_MIGRATION))
+	/*
+	 * Long-running workloads are not protected by the scheduler references.
+	 * By design, run_job for long-running workloads returns NULL and the
+	 * scheduler drops all the references of it, hence protecting the VM
+	 * for this case is necessary.
+	 */
+	if (flags & XE_VM_FLAG_LR_MODE)
 		xe_pm_runtime_get_noresume(xe);
 
 	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
@@ -1457,7 +1463,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
 	kfree(vm);
-	if (!(flags & XE_VM_FLAG_MIGRATION))
+	if (flags & XE_VM_FLAG_LR_MODE)
 		xe_pm_runtime_put(xe);
 	return ERR_PTR(err);
 }
@@ -1592,7 +1598,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 
 	mutex_destroy(&vm->snap_mutex);
 
-	if (!(vm->flags & XE_VM_FLAG_MIGRATION))
+	if (vm->flags & XE_VM_FLAG_LR_MODE)
 		xe_pm_runtime_put(xe);
 
 	for_each_tile(tile, xe, id)
-- 
2.44.0

