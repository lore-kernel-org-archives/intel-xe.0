Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6787EE6426
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 06:34:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736C510E53B;
	Wed, 18 Sep 2024 06:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HRPvOpIB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3308C10E53B
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 06:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726641245; x=1758177245;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ityAXBkHft0udeY6kRUDN/2BEBVh+N8u6bvC02MlLdA=;
 b=HRPvOpIBqiY49BX0vSwYM6rk1t2pvfd+dbr028NzS93VJGcj/Pb4zFsB
 jwq46N+nDNhajf+ZqxkFpsWMWuG661daYJ8gRElQT9n2s3qiJGeDAhanZ
 +VEOZ6bwGXQUgApSDBFjzpmKuTo0YDD/Fg8f5Yl6B6XIqnviZKylLPjFN
 wDDakXEw/TWr1C3oBHBL6Vib2Htl6Lm5DVnJQM7++C8TV+/WhtmOdIo8c
 sgsgj7WOSwTM0uz0WUBIyWhfw11M4knaJlP1tuIwU0xewy8oiOJ/6J9Pt
 fId0N/kjVhAhNT87tZk+KkQ+BoUJhvOmiDBYMzpP8fGbi3C2ZVmIaE5B7 Q==;
X-CSE-ConnectionGUID: Vl7D3iC9RpWeGyK0Lu5GJg==
X-CSE-MsgGUID: eHPJ2o8+SSie6D0U2LnaYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="50945616"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="50945616"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 23:34:04 -0700
X-CSE-ConnectionGUID: mU5YAZzxTCi3/XUOC9FnrA==
X-CSE-MsgGUID: /0Z3bQ0bRI6GUcjeYSmIVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="74278087"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Sep 2024 23:34:04 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 17 Sep 2024 23:34:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 17 Sep 2024 23:34:03 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 17 Sep 2024 23:34:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0FBLiEbZiYLXN53XM80A+FOmYRYYwP1k93lsTD0/hVixcMPNd5y31cPylkvGYaSBOLF1MUeWpIWUxg0As0ReUL8Lirh/Y7ucQ4/ox+CLDh0GRzI/gv16D9dyeZ36I5aDiBqXiDZk5X2+K152HvSqO9Hv4IlC4q9qFgC7aHILnJSU2Qkad+jK77hzPTjGVjtw2c/lV3hev5Jcwkf2TTCGppqo6fmtPcsTO+8ot5yr1ebD47dttJer+zrCRP0L0kDD9mFGVhP1269dgCQBx+BNXP4eNwhKgiPWQcXZWdrfgzzsxoj8+3VmmSJY9ZlQQYlUFExSNN5Tg9Jqa5U18PEYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bB4pdJcvRM9+I8RSl60vlW2mJF2x4cWSZBp5gR1Zrs=;
 b=Uklnp0VUHnQMg1GVpegoERJ6B5kBHqZA4Vx0Au8raOYri/uU8g88fHxmYahnvOY56bYpZQhu/FERjNaIeKUs91z5ZYhCvmfvu6YyAGqBV7eQs7t2zZTv6ag8snn2DotFcJzsioFUdy5L4291Ixog/T7uzJ7smHtJV6oKRLMS9vY4/9YVF+zuvFs1ZrPemIHX7HxO0O+ibDnPJiS1Sd0qlWShRWOuKiwLXS9GtpDZcxqe+DZk/XEXOqjkWPYWH7Nho3HRSBVbISzH8p/rbXQxa+6Cu/qULna17PaCCqTZXU2xwXBG2MToVjPNzmhv4Mox68Q3Xw/l89Av2UyXAN/XJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CY8PR11MB7363.namprd11.prod.outlook.com (2603:10b6:930:86::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 06:34:01 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 06:34:01 +0000
Message-ID: <271c25c3-401c-43b3-8d9c-dc13027a6ea7@intel.com>
Date: Wed, 18 Sep 2024 12:02:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/23] drm/xe: Error handling in xe_force_wake_get()
To: Matthew Brost <matthew.brost@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
 <20240912191603.194964-2-himal.prasad.ghimiray@intel.com>
 <ad2bb8fa-bd4c-4880-b4a6-f3483e6a2b7d@intel.com>
 <31983baa-d613-4a79-b39b-3d315b87a14d@intel.com>
 <6ea536da-fed3-429f-82d4-f118d53309dc@intel.com>
 <4853d43b-0eb2-414c-816b-96e25bc6d604@intel.com>
 <7d1e6ccc-3dc1-4cdc-a30e-f0f1b0f12193@intel.com>
 <ZunPgOAndPtrl74H@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <ZunPgOAndPtrl74H@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::10) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CY8PR11MB7363:EE_
X-MS-Office365-Filtering-Correlation-Id: a15b5ce1-f20a-4a84-bdd4-08dcd7abe1d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TExNV0RwaGhQRDA3aVJiZkVENmRwK2RMbGttVEwwaEdkalpQTGU2SWYrZklV?=
 =?utf-8?B?WWVaMmRzSkovWStBcldIMWZmcGM4TGczTjJpVEFKVmU4UDVTOE40U081azRE?=
 =?utf-8?B?L2o0c3YvTStyOStQbU53emJqQ1hBS2dZNUF4bEtVclNkeHVwdVVYYk9ubWRl?=
 =?utf-8?B?SHV2M1Jvd0FVMEhST2E2WUJQRVVkcEh4TnliMENwNlRoL2t0SEI4cUcrVHIw?=
 =?utf-8?B?REN4UUUrd3dlODZ0MGw4UlpROGlSU2Y3QmE5UmNlU3ZhRkFza0c3bFZUYWpW?=
 =?utf-8?B?OWpzaUNtbzBta2xoWXNMYnV5TUV4NG5rQlRVQlhJY2Z2TUhQcHI3SnMvTUhU?=
 =?utf-8?B?NERMNTFZUlZ0QTV0eWZyRUdwWjAxRDhZbmN4UFk1YXFxRlBFQjZsUGpBVC9y?=
 =?utf-8?B?aGhZcEd2cWM5RzdmQUdnS0luWnVLWUQ0NlRqOG1nS3BwYnFWaDBmOWo4K1Vs?=
 =?utf-8?B?dDJIR1NuWEt3L1pGUG5BdmFPbHU0dlF0VVI5SEpLakR2QnJMUUpGM2wvUDZy?=
 =?utf-8?B?NzRHNk9MTlhJQnJ3SzNSNG9SQ1JqNisxQTUwQjQ2N0EvZkZWRVI5aUJXV0F2?=
 =?utf-8?B?ZFVmYTZKOW9IRlU5YXdaK2dyd2VxUVI5ODYvaENDMFJXMzZuZklRNC9wcGNG?=
 =?utf-8?B?Q3pHdmIybHcyeE1ldFl5T3Qzenp4amQ5RHFuMEt2MnZPckRCM3B2UkM4V0hY?=
 =?utf-8?B?R1BaZkFnNEpLMGlSZGVDZkM2YXF2emdoTnBjcjFxcFNlZGgyMmI5OURCd3BQ?=
 =?utf-8?B?UFlxNFcyclNKSGZjOWY4cG5mNmlaa0dZNDRwNmd1K3dGenRNY29Ua3Y4N2Qv?=
 =?utf-8?B?YWRuRHpMVkVTL2MyK1hrT0cwSUNhdHdyZnJ5ZDBSbndsQ3JBV3BoVzZYdWw2?=
 =?utf-8?B?QStOKzc3Zkh4aU5hVlZsNUk1akQ5aW9xTUV5WlFLVlZVKzgyOXFwa2RXaUR2?=
 =?utf-8?B?L2hrUTgxMlZsOXcvSzk2dU50a0laUytJWGw4ZjFobE43clU2UjlHTFpicVVE?=
 =?utf-8?B?NDZSS1U2ZGFTdXBGSlVsTk9uaUs5UmVHT0cvWVFCLys5eHR4cDhqaFY3RWNJ?=
 =?utf-8?B?NHBNYVcwb0h6UDZnQitTQ2dEUG9oL2JQcG5wNDJGSzhVR0dxOURzUWo4Wm5t?=
 =?utf-8?B?SmtFOWdPTjVZeWNBSlZvVjhKK1RaQ25mWXNHWDBsWFRRTm55R0lZTjhheVc2?=
 =?utf-8?B?NVpMdUdjazQ5cy9TNkxEemNMbHk2bG9VVzlPaFJ5N3VCOWZIRGN3RVJETmx0?=
 =?utf-8?B?SVZMNVdFNmlIb0VTdUM3OGo0bXFWaHNMcWYyM09aMFJoL2JKWGZzeUpYaUQ4?=
 =?utf-8?B?YVFQelpJemJ2dStNWjFzQXFIczZqU2hDWGF1UjhCbnF4bUN0Y203R0hTSVB3?=
 =?utf-8?B?azNueHNGMk12WWNSUVJxSFN3UTNvRmUrM1BXOW52amJtVTZaUW50cHVqUG4z?=
 =?utf-8?B?blpqdkRwUGtwQWYxTEZVQjIreUpZemNFdTJGdUNKR09Rb3puWHNGbUU0ajJ2?=
 =?utf-8?B?MnB5Z0lVM0dsNFlQcnJndTM1UkhCdDFZK2l3MER1cnhQYndxb0FHWGJtN01S?=
 =?utf-8?B?cXdsYm1Fby9ialR5NFB2Uzh5dVVKYkhLWXMwb09XV0tHYU51b1F1V3V3TFdQ?=
 =?utf-8?B?WWdYMElxb3BxTmtNWGNWN29mUGdCd2lRSk1iSGNiVVVoN0IwcFJ3cTVxSHpS?=
 =?utf-8?B?ejZIY3dyelFJWUh2UlFzL1RwVmN6MW9TWlpQTUh5eElUSS9LeFU5elh0dU5N?=
 =?utf-8?B?RWRYUG5mZ0xVUGgxSkdneDFGVHFFMmM4bEtXQkV4SDZpVjMzNFZSdHg1L0sw?=
 =?utf-8?Q?qWza6OrLOloiW6NX9cQ8GWVyoFby1b4XZnYVA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmVteVp0QTNGOHA3VVQ1UVRkNWNrOWgwNXdGaTN5Nk1xR3V0a25jMDNqMG5i?=
 =?utf-8?B?S3h2UzNzbXhxekpNZFlWTU5nemxFM25EaFFlcU5IOE1nR0ZBZ2JaUEMvdDV5?=
 =?utf-8?B?dDZ2MVhTbEYrY29vZGxKL3IvaTVMekpNU2dBN1RIRmFjeGlRb0hpejMvQmdI?=
 =?utf-8?B?U0I4VG1PdC9xME9WSlhnWnBQZDN3QzlCZnZxRkFzQ2ZJajJEN2dLS2VlcjMv?=
 =?utf-8?B?TWltYnFjc29vV0F3cHVGVGZvYWk1WlRIUXJuQWRUUGV5eVNlRzkvcURiZGdO?=
 =?utf-8?B?V3RTS1U5WXRTL2hVUHloMXVzNkxySzV1bzNhdmEvZ3lqT0hwbU5COHhEWU9X?=
 =?utf-8?B?ZVVOMVpzUWR2WElsQ1RQMHl3UDBBYzkyS3FLSnhoSTJsL0V5SXhIaTNFL0cx?=
 =?utf-8?B?WFVRNWs3MDB6NERyNVAvcVYyeEo3VmpYTjA0UkJMSUFWT0didk4rK25RaWwv?=
 =?utf-8?B?QWE5OXp1MHRVcVk2WnZSZUNheG0wQ3hPSGl3Q1d5U2Z6S1N5OXFxcUdlc2d1?=
 =?utf-8?B?d3FjMy9ETzMvOU52RzVwNUNXWWt6eUxXRnpoVDFTcHpobEFHTytUcDU0SHlh?=
 =?utf-8?B?N2ttOGZHRDVnTE1XRFRTck5XRXZndnZmSWhsWHJTRk8wTWZmL2xuTWtvZUlv?=
 =?utf-8?B?QzhMT1AwOWZsRTlPVzJmZ3hqSGpaNXhPNmxKazlNVmFuYkE3YkpPUkhsT0hn?=
 =?utf-8?B?SnN3R2RJNTkvSDNIZGVZeUE3Q1lmRGtxSEpsc2VuK3IveVRTUE5EYlpKcEE4?=
 =?utf-8?B?bmE2ajJqZFh4amVmWkoxZFJ6b3IxcG5mS2tiMjRvMjhzSjBKSlNWd1dnelgr?=
 =?utf-8?B?ekl0M1JDa1daZlBMUm9IN0VHQldQVkg2YVRCWjlCZ2diSGMyZXU4UWxGZS9z?=
 =?utf-8?B?bkgzeGZKU3RXQWF4SDBxd2tDNmxiRERoR0VkNnRtMjJMYUVlcEJEYUlOQW9I?=
 =?utf-8?B?empWNnA2dVN5OXlYVjhrMDh1K1BTR2RWMHJyRTBDQ3gwM1hDajBaZnoydEVW?=
 =?utf-8?B?S2VCcFB2OFhEaVlKSEt2dWNINFE1Z3lCbzRWRGdBSXFMQ3VzeHAwRnFqVmJm?=
 =?utf-8?B?cVY2V2xSRUdSbVd5MEtPL0VPYThvY3RwWjFJU1NEeDZzWFZXOTJjUXZtU1E1?=
 =?utf-8?B?YWs2RGZ3RTFaTmlpbHlPYWFDc3B5MmlScW0xWk1RRkZjeXpiQk1IRFR0V1Fa?=
 =?utf-8?B?K1BXbjdkWVdxT1JITVhQN0JFTCs1NzRnZExlakFoT3lpTGpBOHhVMThaM2VV?=
 =?utf-8?B?MU8vcGk4NTBkTWl6UmtOZ0R2UWxlMFF1UjgzT0FpeWgwcUE1d3RIOERybXM3?=
 =?utf-8?B?ZzJKdnFtbXhwMzU2dzZSTTlBaDFaWTd2NTQzcnpJTHh0MG15dmR2M0RqTnNk?=
 =?utf-8?B?YW9Ucy9vSy85SFY2OWRvSVVURjY3QUlHV1pwSmh6YmRRM2pmekZHcHJrRXZF?=
 =?utf-8?B?YWcvNnBESXBSMk1hUXlBSGtaeVR2NXhBWUVQWkFDMlJGOUdKQWlaK0V0emZp?=
 =?utf-8?B?M0g2aDdESmRQREZIWndubXFmUVB1VUJ1cTFiTzN2ejNubU95dTh2bkNUNVY2?=
 =?utf-8?B?TkpaWm5wTTNNRmxEK3BHaDRybVRGK1l0aWE2UWNjMGZEdUhhTTllY1dZMTNp?=
 =?utf-8?B?RmhBaDhZb3ZiOE1ONHV2NHJ1Ny8ySmlaQ3QwcFN4TjV2MTVPTkV2Sm41TmxJ?=
 =?utf-8?B?RmwvY0wvK0FFNW93SDBjMUUvaythUVM0SGFoc1B3YlZJb2JaNzk3MExUeXlD?=
 =?utf-8?B?YW9XOVI4Vmh6U3o1Uy9Ia2RxQlNSR3JUelo1Z29RcWwvZkFCOGdTamZQYTFu?=
 =?utf-8?B?emNXbGRUNDc5THZUV3pCbUx6TnFIL0pPTExNMllWallMQW8rYXpFc2FQS3RS?=
 =?utf-8?B?cWkzMkoycUh0OUN4VnpMWGJXbmJ4a0NzKy9xaHRSWC91MkhubUZBYzBGcm1t?=
 =?utf-8?B?diswekZjWTd5WjVaSWNLOFBXRmY2L29BTkNoKzBsUkZ3RFJrVjRXOHpsL3Vk?=
 =?utf-8?B?Y3dXR3JSSVRQc0lEMnRPMHdDUE0wRWNNQlB0MDF1ODgwVThLdE5hc01QWlF0?=
 =?utf-8?B?ZzNMeXgyeGxrWEE4MGRpQXNmNXQwc3l2VXU0b21oWjdic3FRVDVhbGN3cXVJ?=
 =?utf-8?B?UGZYdXYxL3lmbzZCT2FGS1h0UERWeDIraGJnZHdqSkhtcUNRbXlFVnRrRjZX?=
 =?utf-8?Q?TIlol6JS2tW+c2Q6lsjDctE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a15b5ce1-f20a-4a84-bdd4-08dcd7abe1d2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 06:34:01.1204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lh/BqtA4kLgJfcDC8kDxTZ1kVrlBJzH22458djvCP0gFXEGznjtrN6VM1rjwB6HL8+gNf1WTlAzqVxZkJr554h7TTUk7ADFsquKyugE0ZC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7363
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



On 18-09-2024 00:20, Matthew Brost wrote:
> On Tue, Sep 17, 2024 at 11:18:47AM +0530, Nilawar, Badal wrote:
>>
>>
>> On 13-09-2024 18:47, Ghimiray, Himal Prasad wrote:
>>>
>>>
>>> On 13-09-2024 16:56, Michal Wajdeczko wrote:
>>>>
>>>>
>>>> On 13.09.2024 05:59, Ghimiray, Himal Prasad wrote:
>>>>>
>>>>>
>>>>> On 13-09-2024 03:01, Michal Wajdeczko wrote:
>>>>>>
>>>>>>
>>>>>> On 12.09.2024 21:15, Himal Prasad Ghimiray wrote:
>>>>>>> If an acknowledgment timeout occurs for a domain awake request, do not
>>>>>>> increment the reference count for the domain. This ensures that
>>>>>>> subsequent _get calls do not incorrectly assume the
>>>>>>> domain is awake. The
>>>>>>> return value is a mask of domains whose reference counts were
>>>>>>> incremented, and these domains need to be released using
>>>>>>> xe_force_wake_put.
>>>>>>>
>>>>>>> The caller needs to compare the return value with the input domains to
>>>>>>> determine the success or failure of the operation and
>>>>>>> decide whether to
>>>>>>> continue or return accordingly.
>>>>>>>
>>>>>>> While at it, add simple kernel-doc for xe_force_wake_get()
>>>>>>>
>>>>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>>>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/xe/xe_force_wake.c | 35
>>>>>>> ++++++++++++++++++++++++ +-----
>>>>>>>     1 file changed, 29 insertions(+), 6 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c
>>>>>>> b/drivers/gpu/drm/xe/xe_force_wake.c
>>>>>>> index a64c14757c84..fa42d652d23f 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>>>>>>> @@ -150,26 +150,49 @@ static int domain_sleep_wait(struct xe_gt *gt,
>>>>>>>                          (ffs(tmp__) - 1))) && \
>>>>>>>                          domain__->reg_ctl.addr)
>>>>>>>     +/**
>>>>>>> + * xe_force_wake_get : Increase the domain refcount; if it was 0
>>>>>>> initially, wake the domain
>>>>>>
>>>>>> while likely this is still recognized by the kernel-doc tool, this is
>>>>>> not correct notation for the function() documentation
>>>>>
>>>>>
>>>>> I assume you are suggesting %s/xe_force_wake_get/xe_force_wake_get()
>>>>> will fix it.
>>>>>
>>>>>
>>>>>>
>>>>>> [1]
>>>>>> https://docs.kernel.org/doc-guide/kernel-doc.html#function-
>>>>>> documentation
>>>>>>
>>>>>>> + * @fw: struct xe_force_wake
>>>>>>> + * @domains: forcewake domains to get refcount on
>>>>>>> + *
>>>>>>> + * Increment refcount for the force-wake domain. If the domain is
>>>>>>> + * asleep, awaken it and wait for acknowledgment within the specified
>>>>>>> + * timeout. If a timeout occurs, decrement the refcount.
>>>>>>
>>>>>> not sure if doc shall be 1:1 of low level implementation details
>>>>>
>>>>> Does this sound okay ?
>>>>> This function takes references for the input @domains and wakes them if
>>>>> they are asleep.
>>>>>
>>>>>>
>>>>>>> + * The caller should compare the return value with the @domains to
>>>>>>> + * determine the success or failure of the operation.
>>>>>>> + *
>>>>>>> + * Return: mask of refcount increased domains.
>>>>>>
>>>>>> if we return a 'mask' then maybe it should be of 'unsigned int' type?
>>>>>
>>>>> Agreed. Will fix in next version.
>>>>>
>>>>>>
>>>>>>> If the return value is
>>>>>>> + * equal to the input parameter @domains, the operation is considered
>>>>>>> + * successful. Otherwise, the operation is considered a failure, and
>>>>>>> + * the caller should handle the failure case, potentially returning
>>>>>>> + * -ETIMEDOUT.
>>>>>>
>>>>>> it looks that all problems with the nice API is due to the
>>>>>> XE_FORCEWAKE_ALL that is not a single domain ID and requires extra care
>>>>>>
>>>>>> maybe there should be different pair of functions:
>>>>>
>>>>> I am not convinced with different pair of functions:
>>>>>
>>>>> In current implementation:
>>>>>
>>>>> int mask = xe_force_wake_get(fw, domains)
>>>>> if (mask != domains) {
>>>>>       Non critical path continue with warning;
>>>>>        or
>>>>>       critical path:
>>>>>           xe_force_wake_put(fw, mask);
>>>>>           return -ETIMEDOUT;
>>>>> }
>>>>>
>>>>> do_ops;
>>>>> xe_force_wake_put(fw, mask);
>>>>> return err;
>>>>>
>>>>> Above flow remains intact irrespective of individual domains or
>>>>> FORCEWAKE_ALL.
>>>>>
>>>>> In case of individual domains if (mask != domains) can be replaced with
>>>>> (!mask) and user can avoid xe_force_wake_put(fw, mask) in failure path
>>>>> since mask is 0;
>>>>
>>>> so maybe we should have (by reinventing i915?):
>>>>
>>>> // opaque, but zero means failure/no domains are awake
>>>> typedef unsigned long xe_wakeref_t;
>>>>
>>>>
>>>> // caller should test for ref != 0
>>>> // but shall call put if ref != 0
>>>> xe_wakeref_t xe_force_wake_get(fw, enum xe_force_wake_domains d)
>>>>
>>>> // safe to call with ref == 0
>>>> void xe_force_wake_put(fw, xe_wakeref_t ref)
>>>>
>>>>
>>>> // helpers for critical work that must be sure about domain
>>>>
>>>> // compares opaque ref with explicit domain != ALL
>>>> // can be used by the code that obtained the ref
>>>> bool xe_wakeref_has_domain(xe_wakeref_t, enum xe_force_wake_domains d)
>>>>
>>>> // compares fw with explicit domain != ALL
>>>> // can be used by the code that does not have direct access to the ref
>>>> bool xe_force_wake_is_awake(fw, enum xe_force_wake_domains d)
>>>>
>>>>
>>>> // helpers for checking correctness
>>>> void xe_force_wake_assert_held(fw, enum xe_force_wake_domains d)
>>>>
>>>>
>>>> then usage would be:
>>>>
>>>> xe_wakeref_t ref;
>>>>
>>>> ref = xe_force_wake_get(fw, d);
>>>> if (ref) {
>>>>      // ...
>>>>      xe_force_wake_put(fw, ref);
>>>> }
>>>>
>>>> or:
>>>>
>>>> xe_wakeref_t ref;
>>>>
>>>> ref = xe_force_wake_get(fw, ALL);
>>>> if (xe_wakeref_has_domain(ref, d1))
>>>>      // ... critical work1
>>>> if (xe_wakeref_has_domain(ref, d2))
>>>>      // ... critical work2
>>>> xe_force_wake_put(fw, ref);
>>>>
>>>>
>>>> so above will be very similar to what you have but by having explicit
>>>> types IMO it will help connect all functions into proper use-case flow
>>>
>>>
>>> Agreed implementation/usage will be same, will use explicit type for
>>> clarity.
>>> IMO typedef unsigned int xe_wakeref_t is sufficient instead of
>>> typedef unsigned long xe_wakeref_t;
>>
>> I agree with this.
>>
> 
> What? Really? I thought it was pretty clear rule in kernel programing
> not use typedefs [1]. Reading through conditions acceptable and I don't
> use anything applies to this series, maybe a) applies but not really
> convinced. The example in a) is a pte_t which can likely change based on
> platform target whereas here we only have one target and see no reason
> this needs to be opaque.
> 
> Matt
> 
> [1] https://www.kernel.org/doc/html/v4.14/process/coding-style.html#typedefs


While running checkpatch on my changes, patchwork had also issued a 
WARNING: NEW_TYPEDEFS: do not add new typedefs. I reviewed the usage in 
the Linux kernel tree and found it used in many places, which led me to 
assume it was safe. I now realize that I should have been more careful 
in understanding the context of its usage and referred to the kernel 
coding guidelines. This was an oversight on my part.

Since this doesn’t impact the CI or runtime, I will avoid reverting to 
unsigned int immediately and will hold off until I receive the other 
review comments. I will incorporate the changes to revert it in 
subsequent versions while also addressing the other review comments.
Thank you for bringing this to the attention.

BR
Himal

> 
>> Regards,
>> Badal
>>>
>>>
>>>>
>>>>>
>>>>>
>>>>>>
>>>>>> // for single domain where ret=0 is success, ret<0 is error
>>>>>
>>>>> This leads to caller only calling xe_force_wake_put incase of get
>>>>> success. so in case of caller continuing with failure, he will need to
>>>>> ensure the put is not called.
>>>>>
>>>>> for example:
>>>>> int ret;
>>>>>
>>>>> ret = xe_force_wake_get(fw, DOMAIN_GT);
>>>>> XE_WARN_ON(ret)
>>>>> if(!ret)
>>>>>       xe_force_wake_put(fw, DOMAIN_GT);
>>>>>
>>>>>> int xe_force_wake_get(fw, enum xe_force_wake_domain_id id);
>>>>>> void xe_force_wake_put(fw, enum xe_force_wake_domain_id id);
>>>>>>
>>>>>> and
>>>>>>
>>>>>> // for all domain where ret=0 is success, ret<0 is error
>>>>>> int int xe_force_wake_get_all(fw);
>>>>>> void xe_force_wake_put_all(fw);
>>>>>
>>>>> In case of xe_force_wake_get_all(fw) failure, how the caller will know
>>>>> which domains got awake and which failed ?
>>>>>
>>>>> ret = xe_force_wake_get_all(fw);
>>>>> if(!ret)
>>>>>      No way to put awake domains to sleep
>>>>
>>>> in case of failure, it would be the responsibility of the
>>>> xe_force_wake_get_all() to put all partial awakes immediately, since it
>>>> failed to awake all requested domains (same as in single domain case)
>>>>
>>>> but let's drop this idea
>>>>
>>>>>
>>>>>>
>>>>>> and
>>>>>>
>>>>>> // input: mask of domains, return: mask of domain
>>>>>> unsigned int xe_force_wake_get_mask(fw, mask);
>>>>>> void xe_force_wake_put_mask(fw, mask);
>>>>>>
>>>>>> this last one can be just main implementation (static or public if we
>>>>>> really want to continue with random set of enabled domains)
>>>>>>
>>>>>>> + */
>>>>>>>     int xe_force_wake_get(struct xe_force_wake *fw,
>>>>>>>                   enum xe_force_wake_domains domains)
>>>>>>>     {
>>>>>>>         struct xe_gt *gt = fw->gt;
>>>>>>>         struct xe_force_wake_domain *domain;
>>>>>>> -    enum xe_force_wake_domains tmp, woken = 0;
>>>>>>> +    enum xe_force_wake_domains tmp, awake_rqst = 0, awake_ack = 0;
>>>>>>
>>>>>> it looks that you're abusing even more all enum variables by treating
>>>>>> them as plain integers
>>>>>
>>>>> Miss at my end. Will address them in next version.
>>>>>
>>>>>>
>>>>>>>         unsigned long flags;
>>>>>>> -    int ret = 0;
>>>>>>> +    int ret = domains;
>>>>>>>           spin_lock_irqsave(&fw->lock, flags);
>>>>>>>         for_each_fw_domain_masked(domain, domains, fw, tmp) {
>>>>>>>             if (!domain->ref++) {
>>>>>>> -            woken |= BIT(domain->id);
>>>>>>> +            awake_rqst |= BIT(domain->id);
>>>>>>>                 domain_wake(gt, domain);
>>>>>>>             }
>>>>>>>         }
>>>>>>> -    for_each_fw_domain_masked(domain, woken, fw, tmp) {
>>>>>>> -        ret |= domain_wake_wait(gt, domain);
>>>>>>> +    for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
>>>>>>> +        if (domain_wake_wait(gt, domain) == 0) {
>>>>>>> +            awake_ack |= BIT(domain->id);
>>>>>>> +        } else {
>>>>>>> +            ret &= ~BIT(domain->id);
>>>>>>> +            --domain->ref;
>>>>>>> +        }
>>>>>>>         }
>>>>>>> -    fw->awake_domains |= woken;
>>>>>>> +
>>>>>>> +    fw->awake_domains |= awake_ack;
>>>>>>>         spin_unlock_irqrestore(&fw->lock, flags);
>>>>>>>           return ret;
>>
