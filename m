Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5637C3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 12:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733C610E5EE;
	Wed, 28 May 2025 12:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HsylVukE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E33A10E5EE
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 12:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748436596; x=1779972596;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=I3QerXcwHU5qEmR0ysjh0OXElIUIqKEuGsV3oBDWTdA=;
 b=HsylVukESIaev12ISHCxQudAgwcoGcamUGa4KUxXfostx3JFeVfXjiad
 9eueZDHGg9ZkRmAN318jJupKeSgPaJF+WmSw3ylHbiQJzDd0L3YL/+niC
 1ss7o5rpAxowezTDIBXKYszSLbl86KQzuUD61fd7S7SpfbIjgkftEudGN
 Vvt4N6qYJcLX5m0IOan0G4Ur+t26HZLzC2FOQzR9KbLlP59EAXS8AVRHJ
 sktx9K/UtdWQj7dA8GSIG8sBnnFvIahAYieKUV3oh0Lai9+WRg80SGkCA
 aS+0h0nV42NEmUvLHAzOScsPPx9U71IKtmpCbJFDxvxdZ2GsHhUB5J5WN g==;
X-CSE-ConnectionGUID: bxWTvrnURxi6iUI9m3K2+w==
X-CSE-MsgGUID: xPK/oILyTdGaClgCKVUhpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50614524"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="50614524"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 05:49:56 -0700
X-CSE-ConnectionGUID: WEr/cm5TRaeQQY8R5/0bxA==
X-CSE-MsgGUID: X1WYT7qkTYabtlRtN/sjpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="143217116"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 05:49:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 05:49:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 05:49:54 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.89) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 05:49:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1xV5iJz8hhoVF3MjxQKbg4J11LguJuf8h3nszjLb/7tkd06Eza+QtlYKcUOpfLG5C1DcprjfrGJHOiDJ2uhmzdLKUbp+aUTbaY1Wsmu6ru1Gi9SnDSfsgjQs5PtVBrq1zT1tB2l/UCQPnmijAIhwBFmlbvm+K8Jr5oqXKCXzdqA516OwnoT+mN2CRHlRLPzrT9VHt2uI6xCRjNa1hGQpq01r7uTme8+1HUWVstF9bSL3/T5ubCOvHMHPusgtN81I6cqugzXw8HY1bPKTlGOE9P2CEBd7EKsq1m5ua+rHqUToYl9WSkgCyOTPlf410tcrrTR30F6fCeos5rXWOs47g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NU+xT+TQqXanLMdseIZ1caJ7tkX6FH3Yz5M72ccwTqQ=;
 b=o9rpP1Xe+eFKO479XBIhaMt1B++tYhxDAhVyU51NNx8ViQ6cQ8V56mK64vFIQ1XWVIOLarnok9wTO24Usr9TUgFS7t7FZGa+lr3WXRsq98l8IT9X9LrFieYhL2z8gfR2EVIuJR1naqkThohAb/E1Bd+OpnHNfE9uFvbjafIdtec2YFao25p+fKvc1Uf3A8pDk4Atr7DA/YxtqTuZXvcwijATQsRrcLqk9K+I39K8jotYBNkGwkG5FFHZEF/V9aKZ1zVCRXMKsKGyxVK8Cdd4Sjz/QZ7siGCSRnuQpsmiBL8rKqs4qdW4RieNZVJXkcDYuG7uCeYl7IttqL4W65KNFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB5070.namprd11.prod.outlook.com (2603:10b6:a03:2d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 12:49:12 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 12:49:11 +0000
Date: Wed, 28 May 2025 14:49:08 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?utf-8?Q?Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 5/7] drm/xe/vf: Rebase HWSP of all contexts after
 migration
Message-ID: <l3qqejzjkimx5kssccsxx7vhoc3to3jow4wisskvx2cuivumhw@vzcpwqz3xbxl>
References: <20250519231925.3196154-1-tomasz.lis@intel.com>
 <20250519231925.3196154-6-tomasz.lis@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250519231925.3196154-6-tomasz.lis@intel.com>
X-ClientProxiedBy: VI1PR08CA0224.eurprd08.prod.outlook.com
 (2603:10a6:802:15::33) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB5070:EE_
X-MS-Office365-Filtering-Correlation-Id: b71dc20e-fb3e-48dc-143a-08dd9de60b3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGZpNlNSZGNxb3hFSkZpMVFNeXJsdVkyRlMyZE9FRk9yVll5blV0cTMvV0ZG?=
 =?utf-8?B?YytOR0xVdHJWUFV6V3JNa2Q4eFZ2WnBkZGgrSnNQVzhId1FsVVd0dVdpMHA5?=
 =?utf-8?B?QWRYUXc3RFJwSWZMQjVQdE9hemVyMVJxRjdxYVhNR0VBNnpmKzFDM1dWNDhm?=
 =?utf-8?B?Ykx2SFF6RGp4YSt6RFpaV2hGNG1RdmtlcmtTUDZ3ME8vM0orR1UvZHpuRDhw?=
 =?utf-8?B?ZUthbmZqcVd0ejZPOEZBOS9ZTHhFNTJwY09pZ1JhWVRERnZXNVg4eUFCVVB2?=
 =?utf-8?B?Vk5ZTjNsbW11VFF5VUJuR1Y5aFVZd25jaWswSUEzMEtsckJybndyMzNpc09a?=
 =?utf-8?B?TkV0aHU3clNxY2hreS9QTVFnSjhOT3BVSjFoNW9FcWJzNUJkYU9FKy9Bd0xI?=
 =?utf-8?B?bk1Uc0w2NzFPT3N2cVlYK0FWUkVGcUdIajdjUzZMczdiRU5vVU9nSW1Za1NI?=
 =?utf-8?B?U2g3c3dNeHVoTlQvSjNHam5jb0Y2Vno3Ly9rOGc3S3hMWm5CRmpsUWFMUUtE?=
 =?utf-8?B?cm03eEtOYzJZc1F5b0hGU0xBR0VseXZhVGZYTitGd2JKc1FGdm1aQWxsOWh6?=
 =?utf-8?B?S1ZUV09CeWRSZTJ2L1RScFc5dGJHMFNoSVNqZkRSdmJKMVlhcXZLamJTb1V2?=
 =?utf-8?B?c3lIemN5QzZCYkFPRDJMbHhwM2F1RGxLUGpsZVhPYmQwek1jZmNvNXl2TGV1?=
 =?utf-8?B?a3FZeFJCWHBJWDk3a3BtVldVVzU4eE1lV2ZaOEk0dGpMd2JNVVk4Z2tkQ3ZW?=
 =?utf-8?B?dkEydU9VbUJEMjB2N0FLM21yYU1Xd240dzdTNmhCd0lUcm82ZW4zZElrd3VY?=
 =?utf-8?B?SUVGbDZBdEVJaVNhSzVWQW9vbnBtZ1hMVVZISTJJRGFUNWJtT1lZeXRab2Fs?=
 =?utf-8?B?cVF6UjgxMmZIaGswWkpHaTBFUE9zT01EUXA5Vkd5TUtqemFBckhqcWV0bC9C?=
 =?utf-8?B?RThicnNrbkhEZU9jMUNHaFVQWDdzdzlTUG9kWmJ2ckNZRU0vaXdRT0ZmZDlw?=
 =?utf-8?B?Mm15N0xOYWFqVTVwRWp6RTVZOVRDMmN2WEpMVnRScytYNTMxNVF1cUk3NHFi?=
 =?utf-8?B?MWlUTm5Kc3N1SnZOQTJZUk5MUHFCajBTbjBUZDcyc1BhK3NvWEREa0VZdysz?=
 =?utf-8?B?VnhOc3d4YWVXbDdiOWwxWWR4Lzh4QVhhemVHeHVpK21KNlZmUlBXT0Z2eno2?=
 =?utf-8?B?NkJDTUN0ZkpmNmtRRm1UL1ZnMWZWUTV1aVY5VjhHVG5tK3Z2M3ZWMDk3QTAx?=
 =?utf-8?B?ZCtlNGVyM0lMZkhTZ0dXYmY5Z0d4OVRDVVd6d0lkT0owZk96c1kvdGZVd2dG?=
 =?utf-8?B?VmxjOVZkSGtmWFRyZnVVRFJaMEdSM2FObUd4TlZjdjdtSDVHUDR4LzgwNEFR?=
 =?utf-8?B?cmlHS3Z4SUovR0JSOXp0ZlRDejVJUHczanMzeE1hc2tKTWFBb2tRSFVEd09y?=
 =?utf-8?B?YzdxdTdIYkg2bmRROTNUMGlmZ3Z4WmlVeGtwY3NheVhDbklPUHJjUVVqSi9C?=
 =?utf-8?B?ZWxLaENRWDNBOW1qQ0xJTlZSdmQ3djFtRFV0VjczVFJKcHpXdTRmb2NnNVFs?=
 =?utf-8?B?K0dMMTU4d2tPNnVUWmZzUmlscmhyOUVsekhrbGt0c21udXVoajBmMi9KU2Z3?=
 =?utf-8?B?UDIxVkJvN2VJa2FhUGFOWnU2OFkvQnVGc1pJNW5zRlFxR0tjNjNBeDU1di9u?=
 =?utf-8?B?aDFSSVNxcHM2R2t4bFhBdkc1bkVhaXJvbTV3Um5UalRHQUoxMzd4N1BJYlo2?=
 =?utf-8?B?S0FzRWp5ZVE0Qmt3QWFKVUFpNU1KRXk0OS9mMmo4RGN2eTk5R2M0anpibW9r?=
 =?utf-8?B?eVFFQjBMdURlbXNWOXBwUXh1OFMzbVI1dHFLV2xpbDdqYlBZaXlUNkI5MGlm?=
 =?utf-8?B?eHlYNmFUM2hIb0lONE5DQVRjbEFmRVZyVWtVQkZHeE5ZTEp2SmM5MHIzakI0?=
 =?utf-8?Q?Pwte4M258wc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTlNbXdsMFdGUU44MVprV0huenJtTUFYb2lLSFN5WGU1SFRwaVRiOXF3ZmhJ?=
 =?utf-8?B?VmY2TDdzL0Zxek00WDI3KzhmT3dXTFVIRG5zbmViZVZqT081Y1krZ2lROXJK?=
 =?utf-8?B?aWM3MmZFZlBmZlpmS2liQkgwclY2K2M0UzVlRDF4UEF6aFFpaG9kU05XWkhM?=
 =?utf-8?B?bDBZTVZscHdzN2NFSTBMYnVRSU1oRGtINy9qNDBpMUtpNlN6eEVmc252N1Vm?=
 =?utf-8?B?Zm1ocGpxWWt6ekx4UE5aV3lMaU1LTDdUV2tORE55SlRPaytuWVlrU3BZeDJs?=
 =?utf-8?B?RFFGUDNrbEZoZXptbFZvS2JMMStUQWhyY1VvMEd1bWc3ZnBPNG9KS1o2eDZU?=
 =?utf-8?B?TGplVEZIN29aODNlSDNxdHQ3aWpiZk5LNXVhSzNZQUJLMUJFN1FlUjRvbEJh?=
 =?utf-8?B?YUJtekZCWXZOeEl5Smx4T2Y1YWM1WlJMU0lydWFHc1ljOW5Va2x6bW9LUlhR?=
 =?utf-8?B?UVB6eU55MDM4NFFrekdPZFdTdHVOZjVoYjFYWFhqZGVuM0M0bjk3NDIvNXN3?=
 =?utf-8?B?NG0vWFhuQWsyQkpFT0JDU2o3VUJ5TFJLT2s3eUVWbnhnWnV6NkU1QUkvaFJB?=
 =?utf-8?B?MHMyeUhyVnJWV1ZiRmhWL1ZQRHFxbERKYnB0WnhsdGJqeGJjUUg5dEQ5VXpL?=
 =?utf-8?B?TFFzVGtTOEFmRUV4L2pkSzc3TjQzZjV2SEd4alBReEx0VFRSSXBpVzlWc0gv?=
 =?utf-8?B?MkJ2UjFjREtMMWVtbGgxQU1ydEhzM1gxcTJNazY2Zm03Zy9KMkp0RjdBc3RZ?=
 =?utf-8?B?LzVldCs2aGV0dGFXR2JmVTdoWkI3RjBYM2RHV1pYUnp5SjU4U3NTMExBSGND?=
 =?utf-8?B?Y2xnMVpicVQzazlTSlpxTUdIbWl0VGQ1UTBVZlUzbFpVVnlXUlJybnBUUEdT?=
 =?utf-8?B?cWRsRDQvclJRczNGWFVJbkJhWlR3Z1RJcnVva2RSM29LQXhHM3UxWjJodTZk?=
 =?utf-8?B?WG1YaDR0YUQxTHVhaVJUWXU4K20rWElpMktIRnJMZXZxOTQ1cnE5eXVSY0dW?=
 =?utf-8?B?MXplYVFrRE9DeXJXSm01YktUVEhLQVB3NTc1NFB2cGNwcEhPNTFpNTRVUXg0?=
 =?utf-8?B?NmFwczZJOHdJeEx5Q05IV2w4bUZaR0ZMUmp3RmhSbFBKTG9NdmI3dTV3Wk5z?=
 =?utf-8?B?TjhlSEJDQ0l4T25kdUxZWUhGbnZBT0xTblJlUnFob3BrU1dSbitWQThFSjVV?=
 =?utf-8?B?Y0VDMGxnS0FOK2NBUlhxMnVZUzdHWk9LVDRrazJUSlZxdHAya1g0SzBYUnRS?=
 =?utf-8?B?Rmx4Y1hOdWZOSzRzcXlVWnk4VXVkbjJwVy9NMFN3SkZSbFdQY0M0bVNWZm94?=
 =?utf-8?B?SHYwaEZWWExZbE55d1RCT2JyV1NMM2s0NnBNcWhHeUVSMHpLMEVNTVdnOVVk?=
 =?utf-8?B?eTBjbGY4VHJTcE1pbGcrQWJWWUdzd2ZHSzI5VXVtcTZETWhGcmVhZy9JdWM3?=
 =?utf-8?B?ditvY09veWJmVDV2eWRWeklpc2pCZU84MmhFcWhtZXRrTk11WWtwV1BKd3l2?=
 =?utf-8?B?ZWtqVlBZT01ZM3h0eTJ4S0RYZFZQSVVBSTVrSkZvTjhCSlo4cWpzNE90YWFy?=
 =?utf-8?B?M0pnbWVmaTA2K3FLOFdneE1xNzkvRVlMRTZTek80N2JzVzdvalN3MmpXeTlU?=
 =?utf-8?B?QmUvdVVoaGVCSE82R3ZzbUthU1oyTWFZdVpIa0pwQVFEd0pCRGZFYlBkUjRk?=
 =?utf-8?B?b3pYdzlMWE1vMXdUVk9Zc0NSYjN5b2VhMFZ0NlZmZjZ6ZThxcXVpVzhESnJY?=
 =?utf-8?B?Q3M5anBpL1lKTVB2alQraG9DZkVxdGIySStlbFlNYnJpMFMzZEUwWVVmMkVl?=
 =?utf-8?B?OWRNZDdTcFJBM0p3eGtZVzNmMHR2azByM1RWc2g4OWt5MmdsR2VKalNzQjZq?=
 =?utf-8?B?OTZZZ0t3OHhxT1Zzd3RBM3FleWtJQ2V1L1ZJREtRSy9DSGd4a01UZzFTcW9T?=
 =?utf-8?B?KythOGZkNUM1WVNBUDV5bUl4YkdKSTJWQm8yaWdrdmZHSDB0eXNoR3NPVlBp?=
 =?utf-8?B?MkdMVmV4WHg2eWFlZEorOWFFdHpKVjYvK2dOeDUxYmJGQnZqc3VDcmhtWnBW?=
 =?utf-8?B?Z09BTGJMN1EwVlJYejA0aTBEMERNcEZPdHBUVEVOM0dhaGpGM2pPbVdsVUZH?=
 =?utf-8?B?aGxRYnZQS0dXdzdnVHQ2anJkbXBKYytmVlZqMFR5ejNPcEh6YTRBVUdRNnhX?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b71dc20e-fb3e-48dc-143a-08dd9de60b3a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 12:49:11.6180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yIbRTgtKd/w4RM6YXTnJWAv404f12MRw3v7+o/19dtq8CSVvNHMlSunoNxFpUNFpP7ULiM6zHKETomypfag+amz2x4emQCQtiMirA2jtz0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5070
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

On Tue, May 20, 2025 at 01:19:23AM +0200, Tomasz Lis wrote:
> All contexts require an update due to GGTT range shift, as that
> affects their HWSP.
> 
> The HW status page of a context contains GGTT references, which
> need to be shifted to a new range (or re-computed using the
> previously updated vma nodes). The references include ring start
> address and indirect state address.
> 
> v2: move some functions to better matched files
> v3: Add missing kerneldocs
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c | 16 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
>  drivers/gpu/drm/xe/xe_lrc.c        | 16 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_lrc.h        |  1 +
>  drivers/gpu/drm/xe/xe_sriov_vf.c   | 17 +++++++++++++++--
>  7 files changed, 65 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index ce78cee5dec6..d696c8410a32 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1041,3 +1041,16 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
>  
>  	return err;
>  }
> +
> +/**
> + * xe_exec_queue_contexts_hwsp_rebase - Re-compute GGTT references
> + *   within all LRCs of a queue.

Formatting. Extra space here. Note that similar thing happens in other
patches, please correct it there as well.

BTW... It doesn't look like this file is included anywhere in the
documentation. Or am I just missing something?

Other than that - LGTM.

-Michał

> + * @q: the &xe_exec_queue struct instance containing target LRCs
> + */
> +void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q)
> +{
> +	int i;
> +
> +	for (i = 0; i < q->width; ++i)
> +		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index 17bc50a7f05a..1d399a33c5c0 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -90,4 +90,6 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
>  				      struct xe_vm *vm);
>  void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
>  
> +void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 69ccfb2e1cff..990f3265c7ad 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2424,3 +2424,19 @@ void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
>  		guc_exec_queue_print(q, p);
>  	mutex_unlock(&guc->submission_state.lock);
>  }
> +
> +/**
> + * xe_guc_contexts_hwsp_rebase - Re-compute GGTT references within all
> + *   exec queues registered to given GuC.
> + * @guc: the &xe_guc struct instance
> + */
> +void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +
> +	mutex_lock(&guc->submission_state.lock);
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> +		xe_exec_queue_contexts_hwsp_rebase(q);
> +	mutex_unlock(&guc->submission_state.lock);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 2c2d2936440d..2cc44298465f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -44,4 +44,6 @@ void
>  xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapshot);
>  void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
>  
> +void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 61a2e87990a9..525565480aef 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1184,6 +1184,22 @@ void xe_lrc_destroy(struct kref *ref)
>  	kfree(lrc);
>  }
>  
> +/**
> + * xe_lrc_update_hwctx_regs_with_address - Re-compute GGTT references within given LRC.
> + * @lrc: the &xe_lrc struct instance
> + */
> +void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc)
> +{
> +	if (xe_lrc_has_indirect_ring_state(lrc)) {
> +		xe_lrc_write_ctx_reg(lrc, CTX_INDIRECT_RING_STATE,
> +				     __xe_lrc_indirect_ring_ggtt_addr(lrc));
> +
> +		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_START,
> +					      __xe_lrc_ring_ggtt_addr(lrc));
> +	} else
> +		xe_lrc_write_ctx_reg(lrc, CTX_RING_START, __xe_lrc_ring_ggtt_addr(lrc));
> +}
> +
>  void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail)
>  {
>  	if (xe_lrc_has_indirect_ring_state(lrc))
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index eb6e8de8c939..e7a99cfd0abe 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -88,6 +88,7 @@ bool xe_lrc_ring_is_idle(struct xe_lrc *lrc);
>  u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
>  u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
>  u32 *xe_lrc_regs(struct xe_lrc *lrc);
> +void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc);
>  
>  u32 xe_lrc_read_ctx_reg(struct xe_lrc *lrc, int reg_nr);
>  void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 82b3dd57de73..0f0d1a97ae1d 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -7,12 +7,14 @@
>  
>  #include "xe_assert.h"
>  #include "xe_device.h"
> +#include "xe_exec_queue_types.h"
>  #include "xe_gt.h"
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_submit.h"
>  #include "xe_irq.h"
> +#include "xe_lrc.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_printk.h"
> @@ -223,6 +225,15 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
>  	return ret;
>  }
>  
> +static void vf_post_migration_fixup_contexts(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +
> +	for_each_gt(gt, xe, id)
> +		xe_guc_contexts_hwsp_rebase(&gt->uc.guc);
> +}
> +
>  static void vf_post_migration_fixup_ctb(struct xe_device *xe)
>  {
>  	struct xe_gt *gt;
> @@ -303,9 +314,11 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>  		goto fail;
>  
>  	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
> -	/* FIXME: add the recovery steps */
> -	if (need_fixups)
> +	if (need_fixups) {
> +		vf_post_migration_fixup_contexts(xe);
> +		/* FIXME: add the recovery steps */
>  		vf_post_migration_fixup_ctb(xe);
> +	}
>  
>  	vf_post_migration_kickstart(xe);
>  	vf_post_migration_notify_resfix_done(xe);
> -- 
> 2.25.1
> 
