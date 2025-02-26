Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D835EC021B8
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 14:26:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A426D10E822;
	Wed, 26 Feb 2025 14:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BAdfe1kG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C075B10E822
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Feb 2025 14:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740579969; x=1772115969;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FXQZhlviJASLwWaomiwG+ET30z4XbZ5kXh0RlYqS+Xs=;
 b=BAdfe1kG5p5JFZMZVTkylHSYezcFHpvp2km/kr/zEGjBOEvNvQtQrun3
 QdocuKZ3pWoqj/idoSwa3Unat6ejFkRsFT6xJX6L6iOX0HQvCjCvl1180
 kTlA/HwW1kFa9/+89a3kQCLGtVBqqKXFyK+8gw5QF0UgXfvw41cJ/GkDe
 P+Zo6Z5R/xG1SBUE3V9HWhIiIsUeTIcoONcjJzI5S0lvfIKI0VhgCVpnx
 exlD+Pefwj4VtgOl4dCSLDkiQvgoboCAs6jUTb4jTtNunF/eggKIUIRDK
 aF0HKlTck2aNp/oH//kZk5p4ZgFX+qZp0DDOB7uq1JJxahq4NqtE9+kKQ A==;
X-CSE-ConnectionGUID: dk6UMYY7S9aXHoCLg1rWEQ==
X-CSE-MsgGUID: NOFeCRJVSUi3BaQBDbBuPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41270812"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="41270812"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 06:26:05 -0800
X-CSE-ConnectionGUID: Qv2/QUXnQMCKNT+hl2rmYQ==
X-CSE-MsgGUID: nQK5xjKzSjKWQVAUSKUVtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120823914"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 06:26:04 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 26 Feb 2025 06:26:03 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 26 Feb 2025 06:26:03 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Feb 2025 06:24:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZBlDIONTrcmsYtSNzLV47lF2AjBOTp/x+TQObyZoWeyQohi9m+RpjdsBzGV5vsI+hcg8PC9D1elOA7OazCvoIoeHZPpyxTD2RN4s1P1gpZzTSB3U0Cdhve5b1p2bB4j2YwhibFqNIl7sBCV0SOtYKZeVM41vy5E7+UeDF8QBjr0QrOnvgNA1HW1aunufWwO/Se09s2+przbHtThb/67MJAp3zebFYh3CnaVGIqKuCCGQQhHZSHrfiEoD2Fibqz9r4+KFbJXKXyrHfCX92faRjyxxm526fH42Qzcld4jfsuxV+wQ3b5/oORFsob1CMSSj66zFuzPYDnuDfD24D9TZEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNe17DcIEorBy/4zlPwCfKhBps2C9KKjMOkZk+ToVmE=;
 b=g14Cgn1bKvGyEZGvFgNiTRJMmSrOE5ehujJWGQZsy1dyJc1qNTgTiaKqOca4N3J57wxfHgp4kavLPyD9c+y7jIYrv+emdRUTOj2ZXG9Z9tQRJ3sHm5V9kJC0Fctx4G3qisioh9IRgXPnoJe9T4eFp7oj06CopVpGJa+I091S6SkGmE0cu55A7Ie0IUcnRPwgmVKK/EpsUo/8oiQLKFzYbDfmnHgp0FFI6JutTuO/uboY8oZv+FhoboqEvVSGNeIOtikBFcuhbtgSBwNCtFjlMe47ORNH7rNRGensKnTNqYnjqZHBsYsplWBZwmPHgMUbI7Zc9NhbUV1ac9V7fryxIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5365.namprd11.prod.outlook.com (2603:10b6:208:308::18)
 by BL1PR11MB5255.namprd11.prod.outlook.com (2603:10b6:208:31a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 14:24:56 +0000
Received: from BL1PR11MB5365.namprd11.prod.outlook.com
 ([fe80::8637:9cfc:1235:8987]) by BL1PR11MB5365.namprd11.prod.outlook.com
 ([fe80::8637:9cfc:1235:8987%7]) with mapi id 15.20.8466.020; Wed, 26 Feb 2025
 14:24:55 +0000
Date: Wed, 26 Feb 2025 15:24:51 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 1/5] drm/xe/rtp: Prepare RTP to define SR-IOV specific
 rules
Message-ID: <522upgrbedpstafvox76tbpj762zw6p6sg4fuotmto5lzakczu@mmu7xvrjew6d>
References: <20250224150700.1778-1-michal.wajdeczko@intel.com>
 <20250224150700.1778-2-michal.wajdeczko@intel.com>
 <20250224194113.GC5109@mdroper-desk1.amr.corp.intel.com>
 <954fb6cf-0298-4dd5-ba55-6c340c2f1fdc@intel.com>
 <20250225030409.GG4460@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250225030409.GG4460@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MR2P264CA0153.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::16) To BL1PR11MB5365.namprd11.prod.outlook.com
 (2603:10b6:208:308::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5365:EE_|BL1PR11MB5255:EE_
X-MS-Office365-Filtering-Correlation-Id: 6be5803e-3e52-4afe-6069-08dd567156b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkgyMThhYktzbXB2U2ZQTFVjLzBGNmJZYkFRSmJyelhmaTMrVnlxRWg2MVQx?=
 =?utf-8?B?bjIyQnNvcnNrMnlNdDZLWGJQTjdhNHdhTk14TEljRzdGVjU5Ujkza1Nwdm80?=
 =?utf-8?B?dEVsWm5qVDNyTktZbWdBcldXT0tvTDEyY3JRQjlSQVU0enNxeEJnTkZQZXlt?=
 =?utf-8?B?R1ZaWjIyVnh4TXNQcG5STEFyRXFOblFCOTZSVkFMUjVvc05rOUIzWnMwd3pK?=
 =?utf-8?B?OHdIOStmaCswT3Ivb0IrZEdqcjRCeTlZamFtTjlkaCttbGs0cXU3Vit5ck9B?=
 =?utf-8?B?anBRdXNaYkhBb2U4ZkNjZ3JZMiszWGVDNVZVRFh2Q2oreGxNbFFnemp0cmVV?=
 =?utf-8?B?dGhDM0FWZWRENHhBSDdOWDU3MmF0WDJkZVBiVk80M0gxSC96SG5KaXNUUXhJ?=
 =?utf-8?B?TTlqbWhKdndQQWhobFJvWFF6Z083MEJKOWFjQkFreTl1MkFYOWlmWlQyWk1a?=
 =?utf-8?B?aW5KcCtIVS9VYmRrK2dwMnpxaGdNUzRGR0JZMTdiQXRSSzFSVTBTeWR0TDhE?=
 =?utf-8?B?SDI3am5TSE1GM1JxSGxOaklUMFkveUhhaklJbW5KTXVFVitudjA5SFVtVkFm?=
 =?utf-8?B?Ukh4b2pwYUdYRlFpZ1lpWDlobnhrRnBiTDduVnROU0JlZlREdld0T01wWTY1?=
 =?utf-8?B?Rm9KOXROcXA5aC9tcU9sejNLbEx4RnJhL3kxRTA4MnVHMVVhUlZNV0xuWlZq?=
 =?utf-8?B?Q21vVWc1MzdsZTFxNFh1MXFKaWVhYWpJckwxbjZrUWptY0IxSi9HNjhMUkds?=
 =?utf-8?B?OGZ3YzZiajc3d3JUMzRtaW5rdlI3UFJ6aDJmVmN3ZjdNM1J5b01xeWkxZzRv?=
 =?utf-8?B?OTl4Uk5ZckluLzN4UEhuTjdZSWxFS25ZcU4xNjhTZ2VaakVCamkvVGdLRmgz?=
 =?utf-8?B?bGhxYnVUNTV4SmJQamo5emx6NG5QdWhCaDB1TFhzUVJ4aDZMb2hSZzlBTjho?=
 =?utf-8?B?cUpFNnY0dkRWTUtZcFk0bGMzSm91ZnRrUkpoZkxxVzRtdHV4ZlVicktJUDZV?=
 =?utf-8?B?Z1VWNGYvb3FpSlJjcVBjd1QvQWxVL2NialF4OGZFRnk3WmFtNWJjK0Y5UkZU?=
 =?utf-8?B?d1AvTko5cU1jcVhOMlBEdUpabGJISEg1UEVBbU5ZSmk0amJHcXlMWC9pNUlJ?=
 =?utf-8?B?S0htWU0rQlA5U2NNVkpFOGRrTE1lZFNkQS9PdmR1RERhKy9mRFBBOE9MUUJR?=
 =?utf-8?B?SnVOVG94d3MyQi83dWxLSEhSeUp6T0pnbnRWSC9vSWVnZjZxNlhaVG5TZFVZ?=
 =?utf-8?B?dnNqMGtFTXJYTVpOVjN3NDFtTnBZdnV5UkVoVW5qcERqUG4xL1ZVQ0IxMVFB?=
 =?utf-8?B?TlJUZnNYQkd1N2dFemhPMU1MVS9HZmo4RUlTSW5Ia1hpeEp6aC8vRTBqNjY2?=
 =?utf-8?B?akovRjZQb0RpblBCclc3bG5YMlU1dWU4VEN6OUl0TnhWSXZBOGdWSThScW94?=
 =?utf-8?B?dFJsdVZsN29veXpsRWUwS2hpYUFxYXFVYWlXY1dJSk9ybWMwa2JYMUZLSGh1?=
 =?utf-8?B?OVhxNFpMZmp5VnNjUmpyR1NnSWdwRWM2QUtDVmNBUE5yRDF0M1p1bmF2YU9R?=
 =?utf-8?B?RHNYNmNibXp5M2dhZ2lLMnkrWXZNaDNxWmJ2TGlJa0tCclBqTms4RC9CQUxR?=
 =?utf-8?B?V05hSzRWQ0l6dFQ4dDdGT3JWR252MmhhSlhVUkVjUE5KL3dDTXNYeEF0NFpN?=
 =?utf-8?B?YXRBdUZwOWUySzNHR0wreGpSQURoTlpnUG5WZTNuQkFLQTBMaEJKajNuck9N?=
 =?utf-8?B?ZzlBV3lyTWc3KzFpeVQrelJxWU9IUzBXNVFHTUZKTXlSNm5TVnhlQS9xbjFz?=
 =?utf-8?B?UlpZWHlGSVNZODRQZkJsTnR1ZDl4K0t4SStJMnhmNUJWK3cxWmRTZzhEb2dB?=
 =?utf-8?Q?pQdC1GjzdopUo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5365.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTVIZHI3WXFDYXdCTjBrOTZ3Zm14ODVYanBqbFNFMHh0eFFFc2ZzdHNacDc1?=
 =?utf-8?B?OWJweE85YmZTSWhBK01ZNlFWV0ZVclZEQjFlaXNNVWtSMVV3QzMrK21pNkRr?=
 =?utf-8?B?dU5VMXRBSSt5RFpyVkxCRndiRnBlYktzekI5MG5nRTMyMGFQTnhtck9PWXBN?=
 =?utf-8?B?YjVmMUVBbDFKRFM1K2V0YUtCeGp4N3h6Vk9NWTk5UHdiMlRKSHNGdXN2OFZ4?=
 =?utf-8?B?VzJNSUw1cWcwUEN3VndmcCswT2phanltQmxMczB4VlhsMFIzWDFpMkRBaFpz?=
 =?utf-8?B?ekgzdHpXS3lxd25leHczVFBDQlNXWit0M2VGMG93Z1Nxb012MkdJY3duWHk2?=
 =?utf-8?B?YXRHU296MU96TWRDdWFTSmZUMmg1TG0rbGNKL0ZXNVNIclRrYzRPdUdXY1dt?=
 =?utf-8?B?VUY3MlRQb25xVDB0TjJGalR0L0xuODZaK3Q4bUZma1FGREFacnd0TWU0ODB4?=
 =?utf-8?B?Y2U1RGtublJYbTA2MURQc2dBV1F6T3RBdnJtdU1Kc0NZQnpzTjluQlJxVzhO?=
 =?utf-8?B?MmxLa3hPMnZTZGo0R2ZSaHRpWnNrejhJd001RzB3TXhCUVBhOC8rRERKc3pl?=
 =?utf-8?B?TlBacVR1eUtZSWdEUWthbVNqbDhrUzI0TXNiVzk4WXlYakJKcFFza3U5YXpa?=
 =?utf-8?B?RjE2Z0ZGSkJGcmFobDFHKzg4MGRNRzhhYVprNEhmK3M5dmYzYmI0NWhJMDg1?=
 =?utf-8?B?S2RDMjVIZFJwdmFiSGtnSEZhK3BEbG5acUxwS1VKSnNicXNRbDJDNTNoWXJy?=
 =?utf-8?B?bXZFRmZJOTNJSUxmclpIMlFUWHdNaFdMYzdWb004WUNBTUs5bDNQQUxtdXlQ?=
 =?utf-8?B?SWp0dkpJMTR4aXhtNEJEV1grNHBDR0NObTRjdDBycU8vYVJHbWdFUU1oVHdG?=
 =?utf-8?B?aXZwcEJSaUU2YnZtb1pTK2wvdE9HcUVNYjNYRkdEejlua2t6K0lnUUppT0NX?=
 =?utf-8?B?Mlp5MlE4VmF5ZGFrSGU3aS8xWnI5Wm9KdUVQMkpQd3lQZGxNeXJFb2RWOVdy?=
 =?utf-8?B?T2JndmdrSWdOeU9aeE9Ndzh4T2I5d0M1Y3VMQXFJTjJLRnJUOGtFc05EZDFQ?=
 =?utf-8?B?ZDJOM28wVSs4TkhzbjVjSElzSmxCbExnTkZNRG50OGNtUFEzSjJ1c2FhMDc4?=
 =?utf-8?B?aEpGdlNYcVB0Q0xEeXJHU01uMmxEak4xK2l5TElWMmFkT3lRWGpJL1NrdFB1?=
 =?utf-8?B?NjcxQjIrZFFFWk9WcGgxcHdxNFFOaGZ4TEgwclQxNHVWWE9mR2k2WXQxZGZE?=
 =?utf-8?B?RGFwM1M5OW5IRFpuNWpPREhoVmxCZVhtRkovWFROeUNpZVdoMVpNeFJQOGlD?=
 =?utf-8?B?WEdZSEs5NCtpS2o3TGtEYTF3aGZDKzhTU29jdnpWKzVid0lnSzcvOFdhbkNW?=
 =?utf-8?B?aXl0MFNwNHFlYjhhSEZZbXMwUXBURDNzSDlOeEtneWhlRWZwdmd4Q2h0ekRo?=
 =?utf-8?B?aWNNSm5vbzFhdXg4M2QwS0QvblJ1K051aUlBYkplcVVTR2J1UGY5OTVPTlVy?=
 =?utf-8?B?NllXYTdWSEVtSnVhTDBsVEFpZm1Dem1rQUNONHdlT2xuSktiVGdnUlVWQXQw?=
 =?utf-8?B?cnF3VlZqT0xwZzg0NWhLVUZlNGpMSzFmNFFHOVNFK250VkpGQmF4eFpzbGZX?=
 =?utf-8?B?QzVwTlhwa3RMemJ6c0E4K05neFZ5VEdOY1RjOXIrdnJDeXBGcGluMUh3eS9x?=
 =?utf-8?B?dDNKaEx0T2kvbngyZFdLOThJK2dRVURteVlXa1BkOXJPL3FvckJWd3JoUlI4?=
 =?utf-8?B?d2JDYzNyQkVGSlFGUThvc1ZIay9iNDFCTk9ZdnpNbWNpR1Q1ZHhRREcrTmJM?=
 =?utf-8?B?UFJHOGs3U0hvd0JnTUMxRExSbjRNc1ZpeUxhUnBhMm1qUXNsQVhvQ1JwcW5W?=
 =?utf-8?B?V3E4d2R3d3BmUUlPTGhKaDVwc1hXTXBFYmc0ZVFFTVphNGRaUnc0bUhjUlNp?=
 =?utf-8?B?U3cya2prWEtWK2RiTUxYSmJVcjFYRnI3TG5TVjM2QktBNWZNaWsvREpXN2NJ?=
 =?utf-8?B?VU9WNytzWGxhRG9NalRRKzhFSzdJS2NLT21HeUhFSWZuUWcrRXg3aWY3b09Z?=
 =?utf-8?B?dnNGNmxHV2lkMnIrQmk0K1pxY1RzeGM4Y3V4eG40Y0hVazZmT0FhVTVudHJ6?=
 =?utf-8?B?SFc4c05BUis5dUxWYkY1RERYMlpsU1orbmFqNFF6SXhITEErZkdTSUhEYWtn?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be5803e-3e52-4afe-6069-08dd567156b8
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5365.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 14:24:55.6888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89/oc3fnM4SUl3QagDgPKWIOHEXvZ8dt6jkJ4GUeHiE5NPjsjEUm4r/Uk6aamYr+pKu4bR1ghLuqoB5BuyrS2tc0dGRNj7I7tmGRRqxNJOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5255
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

On Mon, Feb 24, 2025 at 07:04:09PM -0800, Matt Roper wrote:
> On Tue, Feb 25, 2025 at 12:36:25AM +0100, Michal Wajdeczko wrote:
> > 
> > 
> > On 24.02.2025 20:41, Matt Roper wrote:
> > > On Mon, Feb 24, 2025 at 04:06:56PM +0100, Michal Wajdeczko wrote:
> > >> Almost all currently defined workaround actions are dedicated
> > >> for the driver running in a privileged mode (native or SR-IOV PF)
> > >> and those actions should not be used when running in the VF mode.
> > >>
> > >> While we can easily skip any attempt to apply tile, engine or
> > >> LRC workarounds by doing early exit, it's not so easy with OOB
> > >> workarounds, as on exception basis, there could be some actions
> > >> expected to be done also by the VF driver.
> > > 
> > > A bit orthogonal to the specific patch you're adding here, but stepping
> > > back and thinking about this for a moment...does it actually make sense
> > > for LRC workarounds to not apply to VF?  I can understand the tile, gt,
> > > and engine workarounds not applying since presumably there's only one
> > > setting at the hardware level and the VFs would use the setting the PF
> > > had programmed into the hardware.  But LRC workarounds seem different
> > > because the hardware value is expected to update with each context
> > > switch to whatever is in the incoming context's LRC.  If we don't apply
> > > LRC workarounds in a VF, then the actual LRC getting switched in won't
> > > be inheriting anything from the VF, but rather using whatever unmodified
> > > value is present in the VF's default LRC.
> > > 
> > > Am I overlooking somoething here or should we actually be handling LRC
> > > workarounds in a different manner?
> > > 
> > 
> > from commit 9632dfb0def4 ("drm/xe/vf: Don't run any save-restore RTP
> > actions if VF") we are doing early exit from xe_rtp_process_to_sr() that
> > is also used for LRC WAs
> > 
> > and IIUC the Bspec:52398 says that VFs can write only to allowed
> > registers within the engines, which our chicken WA regs are not, so all
> > LRI will be NOP'ed anyway
> 
> Yeah, I don't think LRI's and such executed from batchbuffers work
> (i.e., the way we apply LRC workarounds today), but the statement in
> that table about allowing accesses to enable context save/restore makes
> it sound like the contents of the LRC in memory do still get loaded into
> the hardware (i.e., LRI's done as part of context switch take effect,
> even if LRI's done as part of batch/ring execution don't).
> 
> So that makes me wonder if we actually need to rethink how we do LRC
> workarounds, at least for VF's.  Today we do:
> 
>  1. Hardware comes out of reset with default register/state values
>  2. Context switch to context (A) with "restore inhibit" to make a
>     context active on the engine without actually doing a "context
>     restore" or changing any register values.
>  3. Submit a batchbuffer containing all the register + state adjustments
>     we want to make for the purposes of workarounds, tuning, etc.
>  4. Context switch to context (B) to force the current register/state
>     values to be written out to the LRC in memory of context (A).  We
>     grab a copy of this LRC to use as the "default LRC" that acts as the
>     starting point for all subsequent contexts created.
> 
> It sounds like in a VF, step 3 here is ineffective, at least for
> registers.  However in theory it should still be possible to apply the
> workarounds by skipping step 3, and instead manually poking the updated
> values into the proper place in the LRC in memory as a new step 5.  That
> would probably be a lot more fragile (i.e., we have to be careful that
> we're finding the correct offset in the LRC for the register or state
> instruction, and make sure that we don't accidentally clobber any
> non-workaround values that the default context is trying to set).  But
> in theory I think it should still be possible (and probably what we
> should be doing if we want the effect of the workarounds)?

I think LRC workarounds should be marked as VF_READY.

There shouldn't be any difference between editing the context image
in memory manually vs actually executing LRI on the engine.
LRI executed as part of context switch should be subject to the same access
control that LRIs executed from the ring.
VF should have access to everything that's part of context save/restore,
so assuming that our LRC workarounds are actually targetting
context-save-restored regs, it should just work the same way as on PF.

There's one tweak that we'll need to do for VF eventually (and perhaps
PF as well, to make things consistent on both environments), and that's
the step 1.
For VF, hardware is not coming out of reset, so when we're doing context
switch to context (A) with "restore inhibit", we're not getting a
"clean" state.
There's a way to get around that problem, and that's to program the
watchdog and reset the engine as part of step 3.
But that's something orthogonal, not really related to this series and
workarounds and more of a generic "golden context" prep for VF.

-Michał

> 
> > 
> > >>
> > >> Since we process OOB rules also in the SR-IOV VF mode, we had to
> > >> explicitly decline the ones that were not applicable for VF, by
> > >> using FUNC(xe_rtp_match_not_sriov_vf). However that may not
> > >> scale well, since most future workarounds will likely not be
> > >> needed in VF mode.
> > >>
> > >> Instead of forcing us to append more and more FUNC(not_sriov_vf)
> > >> to potentially every new OOB workaround, change the RTP logic
> > >> and assume that RTP rules are not applicable to VFs by default,
> > >> unless there will be added a special SRIOV(VF_READY) rule.
> > >>
> > >> As of today only no_media_l3 OOB workaround seems to be applicable
> > >> also for the VF mode, since the value of MIRROR_FUSE3(0x9118) from
> > >> the PF is likely unreliable, so mark that WA as VF_READY right away.
> > >>
> > >> For completeness define also SRIOV(ONLY) to require PF or VF mode,
> > >> SRIOV(PF_ONLY) to require PF mode and SRIOV(VF_ONLY) for VF mode.
> > > 
> > > For the purposes of a workaround, what would be the difference between
> > > PF mode and native?  
> > 
> > in PF mode (controlled by xe.max_vfs param) we must retain possibility
> > to enable VFs, so we might need to make different steps
> > 
> > > I.e., what kind of language in a workaround
> > > description would signal to us that we need PF_ONLY (or SRIOV(ONLY))?
> > 
> > what about "in PF mode we shouldn't modify XXX or enable YYY, or we must
> > use different setup for ZZZ, where XXX/YYY/ZZZ are native features, as
> > otherwise we would completely block VFs enabling"
> > 
> > > Do we have any historic examples of these?
> > 
> > not yet, but in rev1 I was also assuming that VF_READY is just a ready
> > to use solution for some future undefined yet exception case, but was
> > shortly pointed by the CI that there is one already (no_media_l3)
> 
> Okay, sounds good.  I just want to make sure we'll be able to recognize
> such workaround if/when they show up in the workaround database.
> 
> 
> Matt
> 
> > 
> > > 
> > > 
> > > Matt
> > > 
> > >>
> > >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > >> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > >> Cc: Matt Roper <matthew.d.roper@intel.com>
> > >> ---
> > >> v2: tag no_media_l3 workaround as VF_READY
> > >> ---
> > >>  drivers/gpu/drm/xe/xe_rtp.c        | 20 +++++++++++++++++++-
> > >>  drivers/gpu/drm/xe/xe_rtp.h        |  8 ++++++++
> > >>  drivers/gpu/drm/xe/xe_rtp_types.h  |  4 ++++
> > >>  drivers/gpu/drm/xe/xe_wa_oob.rules |  2 +-
> > >>  4 files changed, 32 insertions(+), 2 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> > >> index 7a1c78fdfc92..b607be981590 100644
> > >> --- a/drivers/gpu/drm/xe/xe_rtp.c
> > >> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> > >> @@ -37,6 +37,7 @@ static bool rule_matches(const struct xe_device *xe,
> > >>  {
> > >>  	const struct xe_rtp_rule *r;
> > >>  	unsigned int i, rcount = 0;
> > >> +	bool vf_ready = false;
> > >>  	bool match;
> > >>  
> > >>  	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
> > >> @@ -110,6 +111,22 @@ static bool rule_matches(const struct xe_device *xe,
> > >>  		case XE_RTP_MATCH_FUNC:
> > >>  			match = r->match_func(gt, hwe);
> > >>  			break;
> > >> +		case XE_RTP_MATCH_SRIOV_VF_READY:
> > >> +			match = true;
> > >> +			vf_ready = true;
> > >> +			break;
> > >> +		case XE_RTP_MATCH_SRIOV_VF_ONLY:
> > >> +			match = IS_SRIOV_VF(xe);
> > >> +			vf_ready = match;
> > >> +			break;
> > >> +		case XE_RTP_MATCH_SRIOV_PF_ONLY:
> > >> +			match = IS_SRIOV_PF(xe);
> > >> +			vf_ready = false;
> > >> +			break;
> > >> +		case XE_RTP_MATCH_SRIOV_ONLY:
> > >> +			match = IS_SRIOV(xe);
> > >> +			vf_ready = match;
> > >> +			break;
> > >>  		default:
> > >>  			drm_warn(&xe->drm, "Invalid RTP match %u\n",
> > >>  				 r->match_type);
> > >> @@ -128,6 +145,7 @@ static bool rule_matches(const struct xe_device *xe,
> > >>  				return false;
> > >>  
> > >>  			rcount = 0;
> > >> +			vf_ready = false;
> > >>  		} else {
> > >>  			rcount++;
> > >>  		}
> > >> @@ -137,7 +155,7 @@ static bool rule_matches(const struct xe_device *xe,
> > >>  	if (drm_WARN_ON(&xe->drm, !rcount))
> > >>  		return false;
> > >>  
> > >> -	return true;
> > >> +	return IS_SRIOV_VF(xe) ? vf_ready : true;
> > >>  }
> > >>  
> > >>  static void rtp_add_sr_entry(const struct xe_rtp_action *action,
> > >> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> > >> index 38b9f13bba5e..7874ea8588db 100644
> > >> --- a/drivers/gpu/drm/xe/xe_rtp.h
> > >> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> > >> @@ -207,6 +207,14 @@ struct xe_reg_sr;
> > >>  #define XE_RTP_RULE_IS_DISCRETE							\
> > >>  	{ .match_type = XE_RTP_MATCH_DISCRETE }
> > >>  
> > >> +/**
> > >> + * XE_RTP_RULE_SRIOV - Create a SR-IOV rule for Virtual Functions
> > >> + *
> > >> + * Refer to XE_RTP_RULES() for expected usage.
> > >> + */
> > >> +#define XE_RTP_RULE_SRIOV(TAG)							\
> > >> +	{ .match_type = XE_RTP_MATCH_SRIOV_##TAG }
> > >> +
> > >>  /**
> > >>   * XE_RTP_RULE_OR - Create an OR condition for rtp rules
> > >>   *
> > >> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> > >> index 1b76b947c706..02c4e67906cc 100644
> > >> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> > >> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> > >> @@ -53,6 +53,10 @@ enum {
> > >>  	XE_RTP_MATCH_ENGINE_CLASS,
> > >>  	XE_RTP_MATCH_NOT_ENGINE_CLASS,
> > >>  	XE_RTP_MATCH_FUNC,
> > >> +	XE_RTP_MATCH_SRIOV_VF_READY,
> > >> +	XE_RTP_MATCH_SRIOV_VF_ONLY,
> > >> +	XE_RTP_MATCH_SRIOV_PF_ONLY,
> > >> +	XE_RTP_MATCH_SRIOV_ONLY,
> > >>  	XE_RTP_MATCH_OR,
> > >>  };
> > >>  
> > >> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > >> index 228436532282..ff9da494efcf 100644
> > >> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > >> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > >> @@ -40,6 +40,6 @@
> > >>  16023588340	GRAPHICS_VERSION(2001)
> > >>  14019789679	GRAPHICS_VERSION(1255)
> > >>  		GRAPHICS_VERSION_RANGE(1270, 2004)
> > >> -no_media_l3	MEDIA_VERSION(3000)
> > >> +no_media_l3	MEDIA_VERSION(3000), SRIOV(VF_READY)
> > >>  14022866841	GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)
> > >>  		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
> > >> -- 
> > >> 2.47.1
> > >>
> > > 
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
