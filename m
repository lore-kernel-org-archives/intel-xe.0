Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B41C0218F
	for <intel-xe@archiver.kernel.org>; Sat,  1 Feb 2025 00:00:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58CF10E1FF;
	Sat,  1 Feb 2025 00:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OlBAjIGY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1646110E1FF
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Feb 2025 00:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738368038; x=1769904038;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=n6InhnnASkBTVjbGWezX+UitdNUafpBXGiYe1O1QVGg=;
 b=OlBAjIGYYsxAiJY5ACik05zZ0C0jCX13rSb2Zy2pkGb4/2tcvRm+BGBQ
 Mm2GFmft6S2SAEW7QNG1UqKV2BXiE1Iy+KLPFcKYdzj9mmuuvz+vs4RTX
 ThvlrnkhCIqOeD/2z2bWxSHKSSp5pu6Aq781VXaUSXCgCsVGHQnLynUiP
 mW/mJqTPZNyQ7CoeX72N8BmCeRp3+aiT7uBlDcNXi6vFGPYGHEo8fanXN
 DzNLmPCyVIOkJ6J73qV2lyLdUlXN0D3bK8kq8F5OeHs4TysOdy2rmXU+N
 jg0i7ZimNL2+UIZ2Y7Ci5jO6ELhoo/Mp/2uFeRJxN8fnbJeenKLxPhPUI Q==;
X-CSE-ConnectionGUID: kRxl6+wDT7+T3hRxHWFXXQ==
X-CSE-MsgGUID: Fr9z4eDnSfeLAt0KWAfL9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="56488883"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="56488883"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 16:00:37 -0800
X-CSE-ConnectionGUID: ykT0B2phQkqszOaJkQRrNw==
X-CSE-MsgGUID: hsuBLiZWTxaIOy+WIqduxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110209249"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 16:00:37 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 16:00:37 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 16:00:37 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 16:00:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=htmJ/nt8h4ch7kZ9JR9rj+yTxiyyLkr2B1PQzzx7QTVThTey89m0oy6KWNR7EBX5YAA2zSh0y40qd8JKCAENZtHlJ4UZRAgxIcB2jCG7dKSwEIGe58z7l7JaHf9H+8yAolxFP15gQS7zmpGjFREQ7tTScHc0mMFSLJ/GVG58HsXLMXd3l/g+gBnyu6iNS8Ce5PJVXXiuzkXxeBAIb3mzWePaPWWDtvUwlBBuz86EuFDTu+ZFreZJ6k2DN7SA5iEfTxCkLK76l+05mxK05BxuxIVXz0aENO6l/7q8xdWrBJH6SJ66DjnKvqV5SZB0UqpJF+F1l9wZe7TlyCZxucq+Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INZuIVV5ibElZ+zztnJ9AaBrOMujrLEqka9xwS9JSQ8=;
 b=Ed3zNMGcgNQg3iL91SVb65lR8n184rSjIsRq6ksux4ieTsKiVAGBxfxz82ulcHXbkdpoLoUnDz7pv9fGqasvnVWenIv9UW8AocKCp7YvD7J6ujRt7XuxUtk+bIGhX5u54ub/CPCyI5gNWapdJkfX6kExJRcGLZArwvvqtCWDrdKLAuNVQpmEtjQIEQvyTvsT18oM/b5Fbfk0RRXTcxjCbjYAkmcGxV8Bh+DhrOv4KTHjCwEbbyd86HdOnnYUGu1ExcZpHN1MnDkGUVzd8IJ6rbkNGS2UarBrQoJJnoeUlxJaBU5Kzvs7rEgWeTRH8L0iLz6XVw2sYik+TGb/1pADKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH8PR11MB6804.namprd11.prod.outlook.com (2603:10b6:510:1bc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Sat, 1 Feb
 2025 00:00:34 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8398.018; Sat, 1 Feb 2025
 00:00:34 +0000
Date: Fri, 31 Jan 2025 16:00:32 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v4 7/8] drm/xe/xe_pmu: Add pmu support for per-function
 engine activity stats
Message-ID: <Z51kID6zFnXiObWw@orsosgc001>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
 <20250129101653.1976699-8-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250129101653.1976699-8-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:303:8f::13) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH8PR11MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b924805-7da8-477d-fc3d-08dd42537338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WW1ORTc0M1ZRNm0yMDZsYWc4VjNybzdtc1JUT0ZwZmJwcXpSM3NKaUZiNDl3?=
 =?utf-8?B?RGd3djhLcXhwclhST0NISFJsM2NqUGJkQlVxcCt5MkJrR1FxK0NMT29lVXVp?=
 =?utf-8?B?d0Q5ZHlaQlBnamNoaFozMUUyODBPMHlpdnFpL3kzaXM3VGtURDZwWWRLMXNr?=
 =?utf-8?B?Rjdod1VmeCtsVmxxZVorWWtlc2w0V3F4ZUFOZzdSbkxIaGpWdThuRFdsNVhJ?=
 =?utf-8?B?R0RnYllSUDhkNzZFUFhJUlZGaGRjWG9oSU94OVovUGdicHc0N21HTUhnakdZ?=
 =?utf-8?B?bC8vK2V1Z3dtVWYvaEZtYmkrMXdNaDVVQk1ITm8rbndhUUpzNGQ1MXVwbGh1?=
 =?utf-8?B?Y0FJKzFBWDEwaU9wWHV3bUJ4Z1JLdWNKc0VqRVljb1BoRGJNSVk4a3I1TnU1?=
 =?utf-8?B?ajcveWZWdDRobXVsSWNta0NWL0pqQVZ5UjhadVROQUFBYk02ZXdTT1c2Y2JF?=
 =?utf-8?B?cmRMNlZBazRobDh0c2hnY1VOc2Z0bXBtY0NCRFZ3R2toZEdWSURPaFhKcDc5?=
 =?utf-8?B?OHQ5Z1ltMDZPdnpXTzJlQWZkbStJWjdqbzhYVjJRWHVoMEJIcU5MNUprRGx5?=
 =?utf-8?B?KzdXZy9IakdHanNCcHJiVDh5S0tiNnlnZmxKNSs3OVZwcytpeDcxODY1bzlV?=
 =?utf-8?B?NU5GM2xzNnZyMHNuem1HbnUwekQ4RnowY0d4ckNuR3Zwb1ZMQWgrbGRMbnRH?=
 =?utf-8?B?ZlRHYjFyYWVCZXNhUzJpd3ZFd1lkNEM1L00ybEFWNDVvRjM0NTVSc3BVRWh4?=
 =?utf-8?B?NFRvOXFDWjFIdkM5b292ai9leDV3QzBnVnlSUCtseEhTckx2OENjZU5jWTJO?=
 =?utf-8?B?c212cG5wQnJpRjV2WlhwbXVURnAzbTkreG9wL0MwOURDODhjVGdYeUdsajRx?=
 =?utf-8?B?MU9Ga05iY0JHNFRpZk94RHd2OHFMbmh5NXczZUxnMHZhVlI4SitjRlJ0UUxm?=
 =?utf-8?B?eDBCSndPQzdQcUxCZHQ3L0RqZnV1aWdaTWg3aDVjZU1RTENjSEw2N1d3ckJy?=
 =?utf-8?B?ampCTDFSZndWVk15ZGQzTktuaG9LMlBNdzV1NmRWcDl3M0ZlMWJWTEUvSXF0?=
 =?utf-8?B?RmJ2bDlnUnl5Tlc5TkZKUFN6QnB4bGlUY1dHS0ExVk41YThXOU9uVmlNVm80?=
 =?utf-8?B?R0ZEelVrYm1udGZMQnNCZ3ZjNU9xdFZleXhBUVdpKytHcTI5ZitLamJqbHZy?=
 =?utf-8?B?ZG9TQ1BtMWM5WGYwemJsMWgrOWptSmIyeTdiZjk5aHorWXh0VmFyYTA2cnky?=
 =?utf-8?B?QW1lbE1wQXJvQTZvWWF3ZHF4L1FXU2tQUHBWSGttZjNDZXVZR21hOW41NjRm?=
 =?utf-8?B?bnhrNlAvYStKK2RWMnlUaE0waXl5RmFVSGZqTUtSbHZmbzFVM29MVHdHYkgx?=
 =?utf-8?B?a09EVkd6eTZwdTRhOHVPWGdjUSs0RHN4SkdTM1pRbmdCQUFMRDVPZjhIMzRq?=
 =?utf-8?B?SVRhL1RVQUZqV3UyVldWc1orQkczWlRjSVBKN2l0dytGZXQ5S1pqUUVOUUhT?=
 =?utf-8?B?OG5WZUp3UFBKM011MDVxcHVXVTdrTVlOa0RFdmY5aVFjWTh6QWFMRHlnRElI?=
 =?utf-8?B?dXR5d3ZGOEpYc3k3S2QzVWlHRUtja1FnTEpDOFVEMVpnaXlBb3RtVnFLZEZT?=
 =?utf-8?B?Y0haSTZiclBaL1RRNmw4c05RMVBNV0Y1UHdWWjJ6V1RqLzNxaVlNUU94aU1P?=
 =?utf-8?B?dGpjQUtNdmZDNmZSd0tlV1JnQ3lCcnVSdkVsZ1hhTVRXRXlqdlNIUXlMSkpm?=
 =?utf-8?B?VUZiaXRQWXFmQjdJbXh2RnVkZlhkNzNXOWhZTk9HQ0ZjK0liaGw4MGdoOTdP?=
 =?utf-8?B?ZHNkRGtIZGVPV1dHQ2ltWGVPeVhQTEFnc213dnlRanVybWQwZ0ZIT2UzV2FI?=
 =?utf-8?Q?dWUHZ+K5L4H0r?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0hiTzMyM3I5dGNNWTRpNlVYeWdOc0g5TDVIQXpEcW1JZnFKS3F4QUJHbnpm?=
 =?utf-8?B?YlhhK3NiWi9JeHJ6WmJGT3Y0RzB2YTRGS0lTckFRY1RKb2ZmcThtQllRbG1s?=
 =?utf-8?B?bWh3cUNhZ09wNWltUy9yWktKTzRaNnRycDNMSm1yQ2FrYTFVcWUwcFFVRDVH?=
 =?utf-8?B?K1lWWXRCc3BqdGVGQmZFWUs3b1BjcFFjd3phZWFQRHdTc3NOM3NHZ2lYYnI0?=
 =?utf-8?B?RnVobnVpT29XbGN6REFucXZmQjMyWS9iN1A4RG9TcjRabUZDZ25DYStzb1p2?=
 =?utf-8?B?ZjM2RGtBendQUE91UUJPekNTcW8vaVRubWdLM0NGTm1wekpLNWZnWGw1R2pF?=
 =?utf-8?B?eTZNYjJQTVBIc29TRHRwMzFMQWVDaWNMOGl5SjR0MG9RQzk5b3hmSXpIQXIv?=
 =?utf-8?B?ZjB3UU9EN2E5QkxpYi9NZkhPWEFjaWpVamlMTHZzSDVsTEtMYUtiODkvZGo5?=
 =?utf-8?B?ZkFLQmcybFF0K2w4WEE2TG5vN2ZibnFJamVXMmNva0ZZdEJhNDZIZmpFYlQr?=
 =?utf-8?B?ekhrQjkzZGZ2ZUN4Z1NiSGwyVzlXSXo2MDltK2RiUmQyMmFUTCtVbkxJN3JK?=
 =?utf-8?B?eFR0YlNuL042QVpDbU9YSFc5KzR1OWUxdER5RXcxOHdDbGI0VGs5Y2xxSHVk?=
 =?utf-8?B?ZHhWTTlLZThjK0ljY08wbVRXV3p4OTUvZ2tkanhERmlvLy9abWkzdjlLendi?=
 =?utf-8?B?aS9aa0JKQjNBNThkdTRNalhZN0dVR3kxVi9qY25hTklHU2cwUWtaZmhQWTMv?=
 =?utf-8?B?aS91UU56cVpwcnNOQWJJL1I1WUlwUEZockhveGgxMzJoWUJnVHVaWkZXZUZa?=
 =?utf-8?B?emtaeGk1TnJLYWk3WXR1MllUdEFZUWJvV2NsNmV3RWNyU1BIRWpZQzN4SUx0?=
 =?utf-8?B?SGM3VTh6YWxsMHRlME9pNTRKNWl1Y1ZMR2c3S2k1RXRzT0FqK3N1TjBESzIy?=
 =?utf-8?B?S2hxbHFObTd5c3JodW8vODNiZkkwWkRWZ21MdVN5WVhVd2t5Z2xHaDlHN3ZH?=
 =?utf-8?B?TFpuN3MyQm1pT29HWDBjL3llQ2V4VGVURnVoRCsvSnRGYVdyQkVLQlpneEVB?=
 =?utf-8?B?VGhFNFFyZjRQUWFUVDBUMllpdmh5QWVQekFKSzk0b2U1cjlHMFZ6aTBGMjFF?=
 =?utf-8?B?em5IcysxNm9FU1gyUjh3ZldZT2xDWW9icXNuMW5aWVJqQnNBcUZub2R6eEVr?=
 =?utf-8?B?NXVJc0JUbFlIYUoyTXVkcEh3eFFwRkxYMW44QmhZaW5ZaXhTajlJeEdSQ0Fj?=
 =?utf-8?B?NzUxK0dZOGdUelZ1aWwxMktmRHJTMTR2bmFWMnRJQ0pnTGpjcWNSMld6ZW8x?=
 =?utf-8?B?Z3NwYWIzN29vaisxVkUxQUUxa2cwWlRFY0xnT3gzRHZDWUplY2ZYYkNoMmlD?=
 =?utf-8?B?VWV2czRXSis3djBVeTYvaDYzRWlXbStTd3ZOelZtczVJVzUxbXZFYTZvdGNj?=
 =?utf-8?B?T3hQK1krc0FTTHpINzNSemxiaTNkam11QlYzd1cxRXo0TCtzczROZ21MOWhB?=
 =?utf-8?B?WkV2STQrWkU2MEJ1VHlpSzZhWDRiWE43S1JIQ0RvS21LcWdBaVE2Qi9icWV4?=
 =?utf-8?B?UG5NOFdpbnFacUtWUlZyUzFLekxPVDdlYmRCMTdjbnRyMVVRc3pvS3BwN2pH?=
 =?utf-8?B?MmlqRmFqQUsvcS9HVlNYU0NRUHJVTmtxOTVsbXBTWWExRWFEbEJnM1puUHlW?=
 =?utf-8?B?VFVkeXc3VmxqbnUzVjdVSysxN2V1azJsR1RiUVdIeWNYREFMTG10NG5hWkhJ?=
 =?utf-8?B?dng2SThPNjZVN3Jtb2JBTXM0elhTV2Y5NUN0NS80a3pxWFo0MDgvYTVRdXF5?=
 =?utf-8?B?bDlkUkhXRE5Mc2lkWW45WXFzSkFDN1dKMHdCZnJwSGVuclFLOG1Qb3pyek0y?=
 =?utf-8?B?NEhvMkFISVFFZS9UNHlPNXRmOE1lb1lQUDBQdlZYUERicFdzeEZCazErRm50?=
 =?utf-8?B?ZmxhelViSTBMVEE0NXR5S25BMDdwRUQzK1BPVDQ0L1hveUdoS1R3YmREWC85?=
 =?utf-8?B?eC9GNjVEUHUzM1pKVk0rbG5Kc3p1azNRWm12c1pkVlpwcnFsTm1iZEhWdHJW?=
 =?utf-8?B?WWdwdDZib1NZUGFtb2tEbExvcjBOOFcvaHZxTmlQM2VyakJ2T0xEVjVWOEFq?=
 =?utf-8?B?dXB6NWQ0K1NhWUdITGp1UDhZZnZQWkNPTE5aaVhOWE9zdFhlRzEyRGt6RXdv?=
 =?utf-8?Q?zqqLi0a8s2LGmHBip4WOrUU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b924805-7da8-477d-fc3d-08dd42537338
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2025 00:00:34.0961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aORHqFjKzkk1pU0XvtjbFpii4MDuN6i2h4qcLurLdadrG/lV9jqnwrc+EJiub1xi606sSFiMxIEtqgcuJN0pTW6HOxDzvTynLAbS7obB7Rk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6804
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

On Wed, Jan 29, 2025 at 03:46:50PM +0530, Riana Tauro wrote:
>Add pmu support for per-function per-engine-class engine activity
>stats.
>
>per-function per-engine-class activity is enabled when num_vfs
>are set. If num_vfs is set to 2, then the applicable function ids
>are
>
>0 - Global per-engine-class activity
>1 - PF per-engine-class activity
>2,3 - per-VF per-engine-class activity from PF
>
>This can be read from perf tool as shown below
>
>./perf stat -e xe_<bdf>/engine-active-ticks,gt=0,engine_class=0,
>			 engine_instance=0,function=1/ -I 1000
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>

LGTM,
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> drivers/gpu/drm/xe/xe_pmu.c | 45 ++++++++++++++++++++++++++++++-------
> 1 file changed, 37 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>index 15e9a57aa429..2968fc9a358c 100644
>--- a/drivers/gpu/drm/xe/xe_pmu.c
>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>@@ -12,6 +12,7 @@
> #include "xe_hw_engine.h"
> #include "xe_pm.h"
> #include "xe_pmu.h"
>+#include "xe_sriov_pf_helpers.h"
>
> /**
>  * DOC: Xe PMU (Performance Monitoring Unit)
>@@ -29,15 +30,21 @@
>  *
>  *        60        56        52        48        44        40        36        32
>  * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - |
>- *   [ gt ]
>+ *   [ gt ]    [             function              ]
>  *
>  *        28        24        20        16        12         8         4         0
>  * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - |
>  *            [   engine_class  ] [ engine_instance ] [         event             ]
>  *
>- * engine_class and engine_instance bits will be applicable for
>+ * function, engine_class and engine_instance bits will be applicable for
>  * per-engine-class activity events (engine-active-ticks, engine-total-ticks)
>  *
>+ * Function id applicable for per-engine-class activity
>+ *
>+ * 0 - global per-engine-class activity
>+ * 1 - PF per-engine-class activity
>+ * 2 .. (num_vfs + 1) - per-VF per-engine-class activity from PF
>+ *
>  * The standard perf tool can be used to grep for a certain event as well.
>  * Example:
>  *
>@@ -49,6 +56,7 @@
>  */
>
> #define XE_PMU_EVENT_GT_MASK			GENMASK_ULL(63, 60)
>+#define XE_PMU_EVENT_FUNCTION_MASK		GENMASK_ULL(59, 44)
> #define XE_PMU_EVENT_ENGINE_CLASS_MASK		GENMASK_ULL(27, 20)
> #define XE_PMU_EVENT_ENGINE_INSTANCE_MASK	GENMASK_ULL(19, 12)
> #define XE_PMU_EVENT_ID_MASK			GENMASK_ULL(11, 0)
>@@ -58,6 +66,11 @@ static unsigned int config_to_event_id(u64 config)
> 	return FIELD_GET(XE_PMU_EVENT_ID_MASK, config);
> }
>
>+static unsigned int config_to_function_id(u64 config)
>+{
>+	return FIELD_GET(XE_PMU_EVENT_FUNCTION_MASK, config);
>+}
>+
> static unsigned int config_to_engine_class(u64 config)
> {
> 	return FIELD_GET(XE_PMU_EVENT_ENGINE_CLASS_MASK, config);
>@@ -116,7 +129,7 @@ static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
> static bool event_param_valid(struct perf_event *event)
> {
> 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>-	unsigned int engine_class, engine_instance;
>+	unsigned int engine_class, engine_instance, function_id;
> 	u64 config = event->attr.config;
> 	struct xe_gt *gt;
>
>@@ -124,18 +137,28 @@ static bool event_param_valid(struct perf_event *event)
> 	if (!gt)
> 		return false;
>
>+	function_id = config_to_function_id(config);
>+	if (function_id && !IS_SRIOV_PF(xe))
>+		return false;
>+
> 	engine_class = config_to_engine_class(config);
> 	engine_instance = config_to_engine_instance(config);
>
> 	switch (config_to_event_id(config)) {
> 	case XE_PMU_EVENT_GT_C6_RESIDENCY:
>-		if (engine_class || engine_instance)
>+		if (engine_class || engine_instance || function_id)
> 			return false;
> 		break;
> 	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
> 	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
> 		if (!event_to_hwe(event))
> 			return false;
>+		/*
>+		 * Two additional functions are required for global(0)
>+		 * and PF(1) when SRIOV is enabled
>+		 */
>+		if (function_id > xe_sriov_pf_get_totalvfs(xe) + 1)
>+			return false;
> 		break;
> 	}
>
>@@ -194,15 +217,19 @@ static u64 read_engine_events(struct perf_event *event)
> {
> 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
> 	struct xe_hw_engine *hwe;
>-	u64 val = 0;
>+	unsigned int function_id;
>+	u64 val = 0, config;
>+
>+	config = event->attr.config;
>+	function_id = config_to_function_id(config);
>
> 	hwe = event_to_hwe(event);
> 	if (!hwe)
> 		drm_warn(&xe->drm, "unknown pmu engine\n");
>-	else if (config_to_event_id(event->attr.config) == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
>-		val = xe_guc_engine_activity_active_ticks(hwe, 0);
>+	else if (config_to_event_id(config) == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
>+		val = xe_guc_engine_activity_active_ticks(hwe, function_id);
> 	else
>-		val = xe_guc_engine_activity_total_ticks(hwe, 0);
>+		val = xe_guc_engine_activity_total_ticks(hwe, function_id);
>
> 	return val;
> }
>@@ -305,6 +332,7 @@ static void xe_pmu_event_del(struct perf_event *event, int flags)
> }
>
> PMU_FORMAT_ATTR(gt,			"config:60-63");
>+PMU_FORMAT_ATTR(function,		"config:44-59");
> PMU_FORMAT_ATTR(engine_class,		"config:20-27");
> PMU_FORMAT_ATTR(engine_instance,	"config:12-19");
> PMU_FORMAT_ATTR(event,			"config:0-11");
>@@ -313,6 +341,7 @@ static struct attribute *pmu_format_attrs[] = {
> 	&format_attr_event.attr,
> 	&format_attr_engine_class.attr,
> 	&format_attr_engine_instance.attr,
>+	&format_attr_function.attr,
> 	&format_attr_gt.attr,
> 	NULL,
> };
>-- 
>2.47.1
>
