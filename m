Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFD9CAC5B0
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 15:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B929710E126;
	Fri,  3 Oct 2025 15:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LTdGKG8Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C32210E084
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 15:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759504222; x=1791040222;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TIi9B7oXNRuKw8oZBzuiNQ9nhW25idLkT+7/Ziown7M=;
 b=LTdGKG8QU1bpt6HwttZXnERCkqRa2Mndqc3i1S14iGzfiazWxVsNZIgc
 69WuvFKqPNbeYSML6yf8pOXM6hrb5B9obXrszbtMhQeGNdxMOXOIwcf5Z
 Hl+fzlZuPFw1XynN2cuEu/d/+Oo1EvgmOfnGRNho6eox67p9lECtSVt+j
 Q4hv81sGToOUkrOsHckHdUZJjkvqXev5QlkrChwyMEygBV783dTm24KB9
 ezvxYAnS7D7hG0mUA/JYA4TmOQhcKkOgQ6Opd7mR01FF+2W1e/zPWNp5j
 tLAOALa6dy6sNGEEGJ671M1TiMYCDmd/hFZpjrfhJo2Sb+u1ZViZ84YOx w==;
X-CSE-ConnectionGUID: JdYYdKqLQvSwjOtnKrTclw==
X-CSE-MsgGUID: jlnOEVffTQ+MDdgD2DMu6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="65636976"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="65636976"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 08:10:22 -0700
X-CSE-ConnectionGUID: swot3zi8RpS1xfhNtZC43A==
X-CSE-MsgGUID: Oy3lAarCSKKHrjPuX9Tong==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="183716694"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 08:10:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 08:10:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 08:10:21 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 08:10:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGAF/3K5T6DqT6S30k8zRdvIWOx/VASVi+X1/QzTFB1HoTimjBuxrWnskoVkS6WiE48KNXioGCwLEK347m+xpV+zOr76G4dVrV1WaMx/LU6uUykl+J7mZDE1Gzw9Iu+nUOwPtAqKww6WKKvTgyHRzqZRfdN66ZaF6UUKyVuyl8IYMYhJ8SpNZs3lYGq2TzxNQ4WWKi27cMdWxHUbOrMzFdAlvcIxvhy1qoK8GNvj6a+Rs+KNvYW/Ra5j1K0RAV12n8wiN3/lIm51L1BnMeV2cOSjdFm25GFKDW4f/TExSXop1Podidq47CPbTvj01UG2mia0kgO+LSIy6Z8dg01LDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LZ/wL8zrkolatWz7t7bWyxznvYV1PZyEnWTP2vNO/0=;
 b=GmBA0VSeNZw2NV37gCzYoMF5eRdS7ijFivEtkgzbrfgbLC0ZK1Wmwcg8xlOxJBjP0V0xQoOzzZRmYJ595R7CDjs/aSoj+JzuuUr4a8Yt8yEeRmZzHN47CfSsDxS5h+qU8OSiHJeFg3LpXZp6lUOZWp5/CVM+lEFs9El913dy6y0Y3SLlY7FlQ9K25l+IQ/bjzde8ZojlHx928AHA8wxs6x53a4NG7MrgUOoKZVi5ClhisVIGxyPL/FBlL61JAthU/7rGEuqywZiwbYnWIrODIU6hVyiiktHHId4gar62O1CQ1hy2tgwSAaGoVOeJH1NtZwaYSU5DCZQYgyITbBCuKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH8PR11MB8259.namprd11.prod.outlook.com (2603:10b6:510:1c2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 15:10:16 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 15:10:16 +0000
Message-ID: <0cfeca19-dd2c-4cc4-8725-c7526fe0611f@intel.com>
Date: Fri, 3 Oct 2025 17:10:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 24/34] drm/xe/vf: Start CTs before resfix VF post
 migration recovery
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-25-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251002055402.1865880-25-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0046.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::15) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH8PR11MB8259:EE_
X-MS-Office365-Filtering-Correlation-Id: d3cd5040-b731-4383-c42e-08de028ef576
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sm90RStGWFZEN3BVTjgzWDhseG1ZQzZhL3NqeGRyTm5oM1krQlh5QmtIcmhm?=
 =?utf-8?B?KzRVLy9OK2RxQVRES0s3Ujl1QXQzc0NleHRLNzFBR0ViQWxnc2R1QXRWYVYw?=
 =?utf-8?B?U05WTk5NeVpiQlNIL040SHgzWW9jbFBCV0tTcDJuV1IyUHRaemJvME9XMkR2?=
 =?utf-8?B?Y2ZUdm1BVGViWWtkS1MzbDVRN053clRKV3QxdDJuT2JGM1pZS3VLR2Nab3Yz?=
 =?utf-8?B?Qk01cUJYZkJmWEYvTFRNZmt0TGdWSUdGak5HSHNpaVZvaGlwcTh6VFdWaTFG?=
 =?utf-8?B?aU1pdFBVY3JrQXBUOHhwOUo2RlREQ1crTjNWR1pOUytpS1g2TmdscGk2b2I3?=
 =?utf-8?B?bldHWXNzSE5Hc0djQ29FaVIwaVlFZEp3NFh1RjRXb0NqOGdPMkZDcklLMFgr?=
 =?utf-8?B?YmdHc3M4WjdwV0o4WXBSVU1MSTJwM3k5UHU5dVJ6dnJiMWp3UDgxREx4bU11?=
 =?utf-8?B?ODBreGRqaDZ3S0Rwa09YYkdyTmxqSldUVytJNS9QMFdUYWxRd1F0T1pHUUI4?=
 =?utf-8?B?enVycWlxYVk4SlMwVmlZSDNDc05TS3RzRUFWL2tFdms0UUtLRXRPWDhWQWM4?=
 =?utf-8?B?aVQrNEtpR2FSS3lOWTN4U1hTVUVmNVRJTzZIYXcza0xKNkhSM1dZVGEyRk1x?=
 =?utf-8?B?V2dBMi8zbmFTbzI0WHBtT0hLSWZ4aVFsdGZtUXVVZ2xCNTZpTnNhVUtiQ1Yz?=
 =?utf-8?B?QkdnMGFaRnlUdFBSekpIYmVzRWptZFBpdTl0NzJOeG1EdDhkbWZPZkhhbGhI?=
 =?utf-8?B?SXR2RVRMWEJSa09JdlpWZkJ5VzhSV3FJWmdhMWVkaUR2ZTdOVzlGTHRkbmo4?=
 =?utf-8?B?ZkF3NEhxZ3JjeTA4dTJuM2ZxUS9pdmxkb21pM0tPbDBvU0MxUjFmUmtQbjJV?=
 =?utf-8?B?SGxHc2hDVVdoak9td1crdnlzMG54T2t1MEl3YUdNUzRMWVBLaHVyUFlUVlRs?=
 =?utf-8?B?aFoyWkdKUmV0dFVwMVFuSmduUmlOZ2Zpa2U4VUdRc1dBNWx0L2tZWE1HbDZs?=
 =?utf-8?B?QUkycDdyOWZteFNkaVVESnphMzByZzdVNGg1TXpKUkxOSEp2N1VUaEN4YVdP?=
 =?utf-8?B?RGkxYmN2RGdUQVZYVzNGOUs3TGdSajlKeEY2K01QNXlMZk5WQ1VaSkNXT2Vq?=
 =?utf-8?B?N1VtNDJHc0tZMFMxbzdHNTdVbXdTT1pZY3lydG5rTnRsUUdSb1V0eFo1UGFI?=
 =?utf-8?B?dFVlVGdvbEVWcHRqalhqUUxGc2Nxck56Y1BFQ2Y0QmlGYjBtL09PaTFQcy9r?=
 =?utf-8?B?MkdWeWxzNk5LNDFRWDBRRnZ6SFdVdFI3M29ZckNYOWhxNU5NQU5sOGdIOHNZ?=
 =?utf-8?B?TjM1Q1lxb2Z3V3RYRDBLcmVrWmpyaXFkbmF5aXpGd0JnTnVYV3JhN05ybkdR?=
 =?utf-8?B?a2FFRjFXRWk5QnZlZi8xZVBlSS9NSW5OaFV4WjJrdE96OTFuQjE4Ym1jdTNQ?=
 =?utf-8?B?anExLzdEaWpZVFNOU2hYT1Z2VVVja3RLSHV5VTd1dFJsNTRqK0U3SW9Nckxp?=
 =?utf-8?B?WkdHeEhRYXJFSEMxSFJHbngwYVNySlZYWU54TElheVRPQnJVUzJIYjhGazE0?=
 =?utf-8?B?Q2pDQkdyVjUyNXA0S2FwNkFRMXZEQWF0QXJ2TnJQZGMrbFZYa1o0ZVU1dmgx?=
 =?utf-8?B?NTJyNktTRCtCWTkvMnFTcHdwZHU5WGw5U3RwUmIvclc2WEpGbGFNUkNVWWlV?=
 =?utf-8?B?b0o3ci9iZnJQdzM3L2Q2SUcvNDlOM2I2cnlVSForNWk5RzlGZXNkWTNOSVZx?=
 =?utf-8?B?T09uTnZBWTU4UytzcVlnaHo0NVNLTWtiVlhqYmNNSVd4d3N4U3JkOWtmZ2pX?=
 =?utf-8?B?eUg5TFRKUGgxTllmQnA1Q0M0WTZGSGZwZzdJT1MvM1F1UmcrZ28wc2tOd2F3?=
 =?utf-8?B?MHpBTmZvdHVEUEpwejhrTGltTXlRdjl5NUI5OTZXbXNEUWxiWjdYRHR3djBa?=
 =?utf-8?Q?x4D3OYkEJ+IKQjNB8pwojEYGK2o6ojRD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXVMRTc2bTdSYW9ZTkZmMHZPQ210ZWFUSjJOVHg2OG4rRndQQ3JZUkxibkln?=
 =?utf-8?B?aG5KVmFuWkowMmxvYnlheS9ZekpTaEw1dFdMT1RXUDBBUFlkOUdpT2RGRy9C?=
 =?utf-8?B?aUhqb3hqbDlUWHlxL1djc3NZRzYxYlZ4VUd3T1BSMDZHN2hkVWRyMXA3akhF?=
 =?utf-8?B?YXczdmZ5N2VvWEt5MWIxSGUwSHhIT2Z6bndIU2thREgwcldHUE9GaU1Wbjg1?=
 =?utf-8?B?N2RoenZ1eVZzd2hBczNqbjNBbkRxVVJqdjZGNldLMjZYWUNLRk9VVEUxS0ZS?=
 =?utf-8?B?VG40L0x0d1p4U3grMzFZWVNJSFN4Umx1WVBIMVlLMlhmTGFlcnJNVlBKQk5E?=
 =?utf-8?B?dDJkK1czZU1OS2l4cmpSYTVsSFl1VHdYY3ZtTkdqcC9sdk9kOTlDS2dQRmk0?=
 =?utf-8?B?T0duZWdVajNJdXNEOVZVcGtrUWVwdWJKN0ozRWd2RHFwRk1XWW5SUVU0aklK?=
 =?utf-8?B?TUZVSldGR3FvbDVSZWNsK29RMEJpZGsyT2NLRzUrYW05eERCd0lZdTBrN2Iy?=
 =?utf-8?B?d0YwaXdBNVNBdE9teUt0Z2l4Um9iN2RJQTJ0QUV5N29kNSsybnBWSnJMRDdx?=
 =?utf-8?B?Q0xWekdhSEJyRzZkb01nOHNvdVpsS2ZTZ01HRGRIMWdtTzJSU1pXVjNqRTZ3?=
 =?utf-8?B?YkFHcHBqQUwwTEI2a3JxOTVHSU9BZjJ3c1BhTHdjRFVOVDUvY2VOcC84MS9R?=
 =?utf-8?B?cWJQUXQvbGw2anhUTFJ2Q1NYMVZTK1dqWEhjL2NXSFRnNW9pdFdBV0Nsdlpm?=
 =?utf-8?B?b3JIdmpDM1FFNGU3UUlnNDVYNmZVbGgwVHZuNmllZDVJT2p6UG9aZ2Nxa0lL?=
 =?utf-8?B?TWM0cWMwMkh1Sy8wcnUwSHRNeDVLKzZxYXlwMTJhWmRuRDdFWmxmTnRNTnpM?=
 =?utf-8?B?dDQxZytFRmttUkw0RUtFbFo5Mk9nYkJHTS93MUJzTGgyRGtxVWMzcm1nUVRL?=
 =?utf-8?B?Q20wNG9WblpRTm9kNWNrbDliYzR3dDd1b1g5Y29pdXduaExkamNIQUdmZm8r?=
 =?utf-8?B?Z3JIY1hYbi9Fd1lybEg1WXZNZXFpSXZxTWh2WDhtNHhCYk5jM0ZpeU5ESlc0?=
 =?utf-8?B?bDc2S0VZc2hsV1FCNk1vUTJlSjY2aGlaSU9nMFVLclpaakNsUjlURWRCcEdQ?=
 =?utf-8?B?Y0I5cVB1WU05QVVVK0RlcXRTUzlRakJHbzMzbldjVEgrcUhUSDBpQ0RBTEFT?=
 =?utf-8?B?TWRhU0xqbXdWb0NVbEYycytzZ1NYQUNhVFF1aS9tTmpDZGx6aG1FcEpFMUN6?=
 =?utf-8?B?Si9pbGlaK2FlK1NYRFo1SURUYTNQanhWME5CMlMzVWNINjZyKzRJZmJ4R21n?=
 =?utf-8?B?dFVaVWZ4R1VVZ2wwMDdVRWtQMGMvV1ZvZFNtTVdNTEt4R0pmNTNJQ3AwaWdN?=
 =?utf-8?B?cjJPU0c2UHhWU25pMjNJcjlXZmpTMFVFZ0dmdTRmdGQvT0RVNkxPY0J4ekdB?=
 =?utf-8?B?L0pmQk5YMnV4YkNReHdzaTV4MnVwUm9senRqU3pxQTRkUXRZU1Z1Nm43c1Aw?=
 =?utf-8?B?SVpwcTF6dnI2Q2Q5cno3UzlaOGNYRDB0czFMSHFvNkhHY1hiSnB2cTczZEpX?=
 =?utf-8?B?dTlzRk4wdFl3WmkzNHdrT0JBN29TeDVpamN2TEkyTXJMUG8vNUNXSlJIa09n?=
 =?utf-8?B?RW1BaXBSdGtjUmdJbWMva1B4cTU3ZmtwWUZiQVlxcXdmY2o0UmdyQm14SVdE?=
 =?utf-8?B?Z2RzOXh3ZGt0emQwS0FMQWF6WEZpa0I4K2hNQ05SMEpTWFBOUG95dlNJeDJC?=
 =?utf-8?B?TEVlZ2hUUTJMWUw3YzR1cTJTdjF4UnNGbnE4T2t6d29MQ0haKy9DYkdub3ZV?=
 =?utf-8?B?MktTOW52RWlWWGJGUEtsUTJ3U1p5aWU5MWNpamh5UUNQUWFySnBBTUtIZ1c0?=
 =?utf-8?B?Q2VNQXViYytQaHl3RFBvcWJlNmQzVjRzQ0UrWnl0bnFVcDhJVHh1Qnp0Zng1?=
 =?utf-8?B?dVM3dGQ5QW05N1B5dHVnRUlMdEdweVphQmo3clcyTEtqWHgwa2pEb2I0TDFa?=
 =?utf-8?B?R3ZPT0xjbUtWaGlaaFJIRHVQeGczYlgvTlMxUFZPWHNHK1VPTHgxSU1wVTBY?=
 =?utf-8?B?YU13czErWW55K01KZmF3ZjV1NS9oMmNEeDk1cEk0NHU1a1p3ZUd5NW0zeWNI?=
 =?utf-8?B?WWEzRGFnUXhRWlUrZGQzMWUyRVdmenJHRUxVdW1kRlZYQnhmOXJWS2gwOTc3?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3cd5040-b731-4383-c42e-08de028ef576
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 15:10:16.1777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xnJSPm+FPmVF/0yTmcffsPblH5vHat+TmXELp1mlZVLEBAhsegXsuES/6PuNin+asq/chK+aTkomRa3a7TYtoSlONfNAP9dS1S0s0V9zkOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8259
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



On 10/2/2025 7:53 AM, Matthew Brost wrote:
> Before `resfix`, all CTs stuck in the H2G queue need to be squashed, as
> they may contain stale or invalid data.
> 
> Starting the CTs clears all H2Gs in the queue. Any lost H2Gs are
> resubmitted by the GuC submission state machine.
> 
> v3:
>  - Don't mess with head / tail values (Michal)
> v4:
>  - Don't mess with broke (Michal)
>  - Add CTB_H2G_BUFFER_OFFSET (Michal)

I guess those small fixes shall be done separately

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  7 +++
>  drivers/gpu/drm/xe/xe_guc_ct.c      | 70 +++++++++++++++++++++--------
>  drivers/gpu/drm/xe/xe_guc_ct.h      |  1 +
>  3 files changed, 60 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index c7bd1f6e9dca..55662b9a4f5b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1137,6 +1137,11 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +static void vf_post_migration_rearm(struct xe_gt *gt)
> +{
> +	xe_guc_ct_restart(&gt->uc.guc.ct);
> +}
> +
>  static void vf_post_migration_kickstart(struct xe_gt *gt)
>  {
>  	xe_guc_submit_unpause(&gt->uc.guc);
> @@ -1188,6 +1193,8 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>  	if (err)
>  		goto fail;
>  
> +	vf_post_migration_rearm(gt);
> +
>  	err = vf_post_migration_notify_resfix_done(gt);
>  	if (err && err != -EAGAIN)
>  		goto fail;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index fd6e731c0395..92822d131612 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -166,6 +166,7 @@ ct_to_xe(struct xe_guc_ct *ct)
>   */
>  
>  #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
> +#define CTB_H2G_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
>  #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
>  #define CTB_G2H_BUFFER_SIZE	(SZ_128K)
>  #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 2)
> @@ -189,7 +190,7 @@ long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct)
>  
>  static size_t guc_ct_size(void)
>  {
> -	return 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE +
> +	return CTB_H2G_BUFFER_OFFSET + CTB_H2G_BUFFER_SIZE +
>  		CTB_G2H_BUFFER_SIZE;
>  }
>  
> @@ -330,7 +331,7 @@ static void guc_ct_ctb_h2g_init(struct xe_device *xe, struct guc_ctb *h2g,
>  	h2g->desc = *map;
>  	xe_map_memset(xe, &h2g->desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
>  
> -	h2g->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE * 2);
> +	h2g->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_H2G_BUFFER_OFFSET);
>  }
>  
>  static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
> @@ -348,7 +349,7 @@ static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
>  	g2h->desc = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE);
>  	xe_map_memset(xe, &g2h->desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
>  
> -	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE * 2 +
> +	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_H2G_BUFFER_OFFSET +
>  					    CTB_H2G_BUFFER_SIZE);
>  }
>  
> @@ -359,7 +360,7 @@ static int guc_ct_ctb_h2g_register(struct xe_guc_ct *ct)
>  	int err;
>  
>  	desc_addr = xe_bo_ggtt_addr(ct->bo);
> -	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE * 2;
> +	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET;
>  	size = ct->ctbs.h2g.info.size * sizeof(u32);
>  
>  	err = xe_guc_self_cfg64(guc,
> @@ -386,7 +387,7 @@ static int guc_ct_ctb_g2h_register(struct xe_guc_ct *ct)
>  	int err;
>  
>  	desc_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE;
> -	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE * 2 +
> +	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET +
>  		CTB_H2G_BUFFER_SIZE;
>  	size = ct->ctbs.g2h.info.size * sizeof(u32);
>  
> @@ -500,7 +501,7 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct)
>  		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
>  }
>  
> -int xe_guc_ct_enable(struct xe_guc_ct *ct)
> +static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
>  	struct xe_gt *gt = ct_to_gt(ct);
> @@ -508,21 +509,28 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  
>  	xe_gt_assert(gt, !xe_guc_ct_enabled(ct));
>  
> -	xe_map_memset(xe, &ct->bo->vmap, 0, 0, xe_bo_size(ct->bo));
> -	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
> -	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
> +	if (needs_register) {
> +		xe_map_memset(xe, &ct->bo->vmap, 0, 0, xe_bo_size(ct->bo));
> +		guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
> +		guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
>  
> -	err = guc_ct_ctb_h2g_register(ct);
> -	if (err)
> -		goto err_out;
> +		err = guc_ct_ctb_h2g_register(ct);
> +		if (err)
> +			goto err_out;
>  
> -	err = guc_ct_ctb_g2h_register(ct);
> -	if (err)
> -		goto err_out;
> +		err = guc_ct_ctb_g2h_register(ct);
> +		if (err)
> +			goto err_out;
>  
> -	err = guc_ct_control_toggle(ct, true);
> -	if (err)
> -		goto err_out;
> +		err = guc_ct_control_toggle(ct, true);
> +		if (err)
> +			goto err_out;
> +	} else {
> +		ct->ctbs.h2g.info.broken = false;
> +		ct->ctbs.g2h.info.broken = false;
> +		xe_map_memset(xe, &ct->bo->vmap, CTB_H2G_BUFFER_OFFSET, 0,
> +			      CTB_H2G_BUFFER_SIZE);

nit: we may want to add some debug dump to see what H2G actually are about to be lost by this memset

this would also allow us to verify test scenarios which may assume something was not processed by the source GuC before VF pause

but we can do that as follow up

> +	}
>  
>  	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
>  
> @@ -554,6 +562,32 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  	return err;
>  }
>  
> +/**
> + * xe_guc_ct_restart() - Restart GuC CT
> + * @ct: the &xe_guc_ct
> + *
> + * Restart GuC CT to an empty state without issuing a CT register MMIO command.
> + *
> + * Return: 0 on success, or a negative errno on failure.
> + */
> +int xe_guc_ct_restart(struct xe_guc_ct *ct)
> +{
> +	return __xe_guc_ct_start(ct, false);
> +}
> +
> +/**
> + * xe_guc_ct_enable() - Enable GuC CT
> + * @ct: the &xe_guc_ct
> + *
> + * Enable GuC CT to an empty state and issue a CT register MMIO command.
> + *
> + * Return: 0 on success, or a negative errno on failure.
> + */
> +int xe_guc_ct_enable(struct xe_guc_ct *ct)
> +{
> +	return __xe_guc_ct_start(ct, true);
> +}
> +
>  static void stop_g2h_handler(struct xe_guc_ct *ct)
>  {
>  	cancel_work_sync(&ct->g2h_worker);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 0a88f4e447fa..b1cba250c51c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -15,6 +15,7 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
>  int xe_guc_ct_init(struct xe_guc_ct *ct);
>  int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
>  int xe_guc_ct_enable(struct xe_guc_ct *ct);
> +int xe_guc_ct_restart(struct xe_guc_ct *ct);
>  void xe_guc_ct_disable(struct xe_guc_ct *ct);
>  void xe_guc_ct_stop(struct xe_guc_ct *ct);
>  void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);

otherwise, lgtm

