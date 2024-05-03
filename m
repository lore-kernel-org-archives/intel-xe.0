Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30029C4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 21:11:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA4F1129E0;
	Fri,  3 May 2024 21:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FYYEfYnU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD7C1129E0
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 21:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714770717; x=1746306717;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nPw5BETiGMY+G6jXWIwozf+MVHzVNWSElYDuBgLIf6M=;
 b=FYYEfYnUOzDn/3TKKJSPZAK2vl5CCE6ene/J4xf0Vc5dKnRnd1zFerJA
 5JFQJ5ktNWz9AqQ3G/RAxt3xKT3T9UfaImf7rDkt+wAKXxpz1/EbuZ2cg
 roJ2drFzKus4q8bvBJmDqp4dxM2KPX0xeL2w5SV7V9kTujk12pFl4gNVv
 /85kTptHDwrftuhB9mfXcVjAOyam3pDpqS8aEjlotglype9B9ro5kOOuR
 1A/wYhFGFjRM+lrMXwKJ00yNZbube7F+Q7ceb8+fT3b/bkSNMeGyunpT2
 /qv8LTaGTlDuLNbOXzBLiYuzLLOsh+DQtSAGI+GE1LWvFogrBOM4d4O+W w==;
X-CSE-ConnectionGUID: Mk7QLIKnQCWV/R0rSwscwA==
X-CSE-MsgGUID: /Z2QiBxoS8Kh6XMHHw4DoQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14409447"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="14409447"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 14:11:56 -0700
X-CSE-ConnectionGUID: 2fjIeMEZQOOebsFlJZu8Hg==
X-CSE-MsgGUID: yVw7EDjZTB+bpU83gZ63bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="50755054"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 14:11:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 14:11:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 14:11:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 14:11:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 14:11:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmLNpsqJ4LVp0jM7tXXow+F8hwZeUuNXW3Hm+a3cBlNNRRamuSFmHy5mLhdG/Iokoi8seFIaDodAJrqNlFGWwj1MhevxTLKNQxk/03eXkaBFkclAzmmjBiEoxGxamhez8u23bxItJXKQ4S8o4JQrQvoygNkQNoerAEp9fsP7Va89ybvrUF/83FbS6xz7bF5mvRZFhPdU28lXUKu2QtvH7AoEV80bUFB4NMUSQoURJzdpmTrPU/rwVRibAPT+GL5IZH6PhYZbA2CNKhk1t9yqZHPuXxQAiOqitgWM6gXJL7uzZw0MPakMktI5OCQ4TgT7ghE4GPG1mLA1Umftzn4jTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPCEzh5YpMcmG+t8Qh/DzmR2MjmbTZ7+fnNh40Bb4Fk=;
 b=K1ttYKeDsFX0YbZqZVoojhu6MfSv6mIEUJ4ok1jWzS/fkyDSX6UC0Z7/7nzRQP8EfjUkU2gKcLat2OV49mft7qf/45XQdJ2BW4Pz1w8QBVd4Hr0W5z92aNedsEnCA3sUMzFz6Cu44hm21WiLyv8DObfhtSEMfCZNdXelcqLdCl52Av9C5QfIxYv6RxymdMXlhXWASSgXlfql1ORH4MW3csWKH+fKCiU3vTmEZaOweJ9u3NGAsi9rZepUrx4pjpqONXtATBdFeimDyZhn3EFgQcXPpcoK3hAE0LMGV/5VX8FiSF1R7iANFljijtO+/K6L7pJGPt3KqdeCqx5zwPw3Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB8092.namprd11.prod.outlook.com (2603:10b6:8:184::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.34; Fri, 3 May
 2024 21:11:53 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 21:11:53 +0000
Date: Fri, 3 May 2024 17:11:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>, Piotr
 =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/pf: Implement pci_driver.sriov_configure
 callback
Message-ID: <ZjVTFJoPn0AIgzom@intel.com>
References: <20240426132217.2351-1-michal.wajdeczko@intel.com>
 <20240426150713.ntnegd6r4s3qbpvk@intel.com>
 <29b2e173-55f3-48dc-9343-b107812fffac@intel.com>
 <3ab475e9-b5ae-4dca-8764-806a8236e883@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ab475e9-b5ae-4dca-8764-806a8236e883@intel.com>
X-ClientProxiedBy: MW4PR03CA0183.namprd03.prod.outlook.com
 (2603:10b6:303:b8::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB8092:EE_
X-MS-Office365-Filtering-Correlation-Id: 8de48ce2-7467-48e5-0f02-08dc6bb5a7c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjFyMVcxUUN0VkNTcmI1ZUlXc0JQM2dMb0d5SkIyTWhpVlF2K2oxUkpURmVw?=
 =?utf-8?B?ZjZlSkZCUFFkL3hFVXM5Q3dHb0ljZytmRlc0SzZad3lISHprQU9RSkNFcVFT?=
 =?utf-8?B?MEdiRmFmR2xsem9JdG9ndFZCRGIvWStDaENVMXZFNHVpQlJsOFlDVFp3bG1C?=
 =?utf-8?B?em0xQW8yZWtKRWh3cTRpbWw2VUlZUHlqVDloOFhxTk4yajRCWlRxVFB4dkc1?=
 =?utf-8?B?R3RYVjBSUkdhdDJsblVnL1VsNnJBWFpvSVhpQzFIZjZzZFVzYW41M052ZWt5?=
 =?utf-8?B?Z1F3OW0rTHV3Q3VnSUxUU3VIWkFqVlUxK3ZEb2VRUENrenpXTzdZSWNTeXJY?=
 =?utf-8?B?ZjZESnIzQlhvSGxWdzVmVHpDVmwydEQyVktSYkRyQzhrSmJzbE9wT0RFa2Vr?=
 =?utf-8?B?Mmh1cFNkYXl2V0cwOENORTVqYnk0UGozek54TGdJNUhsa2ZaQ3o4RmtPWHVD?=
 =?utf-8?B?SVU4ZkxJRldaQ0lzN0phckdqMEREWEJBNGtvUHY1UVp3MnVZWm5kbDRRRm9U?=
 =?utf-8?B?V1lOMUZIVFRTN0E1cHRkNGUycjBFd0lOc0QxalBCOUxkWStiZTdFbXJTOFY4?=
 =?utf-8?B?ckx6UkQ3blovUzMxNzRDblUrUE1MZDdQNzlOZ2hNYll0QlRDVnAycTRmN3pz?=
 =?utf-8?B?WXUyS0V5cmovQ3dOUHRocnFPV3Q1WkZRL0hDbEdlRWVaOSsrUEpHY0RYempo?=
 =?utf-8?B?ekVKUmJ3NjJtMU5lNW9tTGxMWTdaSHhYZUg1aW8xd2dMRW5Ua0dsZ0NKRTRF?=
 =?utf-8?B?c2FvdG1pNm5CNVBqM1RSTXg5a0dEbk0wcnhNT00vZ3lPZUFmWHFpamVCMmFq?=
 =?utf-8?B?UXNTV0p2VTVlRTFIb2FZcVBkWFBSSzdxQTJ2cXJGZk9vM1VudjUvWGdLUGlW?=
 =?utf-8?B?eElYRG40aTZSbGdmbnBXUGFFVnlUMWk3Q1VZM1RFbjF4b2xyeHZIRXhkOXNj?=
 =?utf-8?B?dlRyWG0rM1F4ZXdOUjNyOFVMaUh2QUZXOFZOM2w3ZEJtcS9JRDk3dWV5OVgv?=
 =?utf-8?B?WklPakQyS1FSRXEvbGFjS3hvZWNhQzJrT2tIZ0c1N29IUVp1a0dEVlhWNmp5?=
 =?utf-8?B?aWR5MTJCY1ZDNzJ3d3g1OGlySnhEOVRsL0NNTzhyNlVmemdTaUY4U0FuSkNx?=
 =?utf-8?B?WTl4L2NJclQ2akREZkZTM2VYOHFPdHd3WUsyTVFTRm5BdFgxWUhCOXh3L2wy?=
 =?utf-8?B?THZOdURaTU5yNlVlOEdVcVdzUVhndVh6L1RJTXhPQkdURXBNUWs4eEQxQUw3?=
 =?utf-8?B?MnA4U1FjUGVkUjZCRXUxN3VvVC9hYjN0RUVIQzJBU29hcG5rWGZ1cXNHY1hF?=
 =?utf-8?B?c3A4UHVxOGdMZkFSYnZDMnZETzBUNmlid3VhNWtjTjNuSkZ2QmEzV2JkYWo4?=
 =?utf-8?B?clJHWEFSM1F4WnRITTMyUTNDTE80ODd5L2d3NVpHaVBqNnNJaUdBblVNRlgy?=
 =?utf-8?B?bS9nY1J2aDhSZG1ITW9ldi9HUGU4Ly9ucnJnVDF2WVR6NW01bzNyTHd1MnEy?=
 =?utf-8?B?bGovZzBFOC9GWEc4d3loSCs3MGQ0amk0OEVqa0JoQUNKZXFIZmtBMmN5MkpP?=
 =?utf-8?B?anV4NlNXbWFkRm9UQzVsRUZrczUybTBvYWhudTdYcU5XYzRXT2F2YkErVGhN?=
 =?utf-8?B?WHFJVDBGRGRUWFAxV2tXWmNlUWgyR1pyNytWNDdpbXRqQWdHM3YvTitlcis3?=
 =?utf-8?B?dmJiOFo2eVBTcXo2TVM1OXY1d2s5MVRJa01oMzNQZDBFOUhaRThFTS9BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEFONkdadm56UHNuc2Y0L1dKQ1dLaXJwVloybzZ0YmVva2tXSXJMWlRLdEtD?=
 =?utf-8?B?TlNSYlZTQmJvUmlpWlAzZk0rQ1Zsekl6VGxOUUVFd3A0RmtkMjlKY3J0eXVw?=
 =?utf-8?B?RFdBNWZpR3JETHZXNXpya2lPSTZ6ZmMzajZDRElETHc2bmxSakgvcXJhZURT?=
 =?utf-8?B?SzNjejVHSlpiNUVmV3hha1RRNDNDZ0g2eWxxTkkxREk4WFFNQzdzSUpJT2lk?=
 =?utf-8?B?bmNBTGpVVm9QRUdhanl6WmdYK0pGWTlPTWdFRWdYYVNJSFRLNGg2L1RqUjEy?=
 =?utf-8?B?MjFLc1VTQ2tVNWRkS3pXWkRPTjNTSjEydWFieU5CMUxSaDBVWFZMdUFBRnhG?=
 =?utf-8?B?SmExSnNWVUttd2pvTmNQUHcxek5tNy9yTi9SK2tyNzE2bGw3eDBqcGl3RHlG?=
 =?utf-8?B?dDRjWG1vYXVtWVZhaDNZRVlnZXo4RU1KRnFhcjdObjVCR3AvbFVKb3lvaDBC?=
 =?utf-8?B?YmlSc2s0cmpMeWkySUkybVhWcGVYeThZbkFCa1lPbWQyYXJCTU9pQ1JhbEcr?=
 =?utf-8?B?djhnVGJWKy9BT2FKOWlkRlhORHBOQS9kMGs2UEFWa0ZOcU5QcWtZd1VlZE9q?=
 =?utf-8?B?ZnM5ekt2ZTJicS9jOXkyUFBLOUxmZ1dZU2ZIdzc5cGJhYUpCenFrOUthTC82?=
 =?utf-8?B?enpJK040V2tvU0gyOWh1Rll1dnUrRlNhUlNBcHB5WmxicUEyZ0tmTWljL3cy?=
 =?utf-8?B?ZS9SSGdxY2dORllIYXQzSDQrSkhtZ01Iam9XQ0p5dUM3WmZYYk5XZXlmYnd0?=
 =?utf-8?B?QlFPWHFsUHNFSEVJaUEzUzBDZndtLzRFQ3AxY0lSM05jNFBXdHdLOGd1d0Q2?=
 =?utf-8?B?QXl3dlYzekFRWERpYmtudEpGbjg1NVhPTWhNR2YrSEVLYjhYdmI3djUzL1hL?=
 =?utf-8?B?M2FnMm5ZWEZ0S0N1TVIvVVdKOEJDeE9zVldlb2NTcXZ0cEgrZisrdUNOYXNG?=
 =?utf-8?B?UVlMKy8yL1ErdUFTZjJZeGhYTDdsKzQ1WTFpNjRxM1pwMFZTdTBuelVlNWo3?=
 =?utf-8?B?c3U1SlJyVytqcSs3RVJaeGxtZVJ1QXFRV25WOGJjVGhTdVpsVnh0MVFzK0cx?=
 =?utf-8?B?VzFOL2hKU1RRSVlmR0dJYTEzMDNGWDNlQ2t4QkQ3M0s2cXA3M012cGNRZkRZ?=
 =?utf-8?B?TUpqYUVrdStEVDR3L1BaK2JWcEYybTVaK2gxc3AwcmFraG1WWTFRYktBdmxY?=
 =?utf-8?B?bmhGV2dIMmlxbHA0U3Y2YTZsZEhzNG1ndVFKeGliTHQ0K1Z4MGp1TDFkRUxR?=
 =?utf-8?B?S1JKY1BwR3lQVXo0NDU4MDdlRUQyUm55aThWdnp2d3lJczVFbzVjSE1keFgr?=
 =?utf-8?B?MkJ1TkpOTzJUQytzelJUWlFMQkNsc29kcHZySTB0UmJFUkdDbkd4OWVBVWZP?=
 =?utf-8?B?dk1HdVArN3kzREdYSFVvdFpXNFBESGw5R0ZxZHFLMDNCeHV4WWNIU1IwcmNP?=
 =?utf-8?B?VFRHR09ZNjFWMjVhdE5pazVWclpESkpNV3VjS3hIVkdPRlc0M2JaaXQ2Q1NT?=
 =?utf-8?B?eDJzTE5UcHZVLzFtL05IK21WK3gzcE5tamdIcXo5VkpUcFl2bGI3ZGU2L0s5?=
 =?utf-8?B?NGpxakhQVVc2ZncrSFRtOTZjdUxLWG5aT08yUHl6Tkx5cmUrdHlpWW10d1VR?=
 =?utf-8?B?dlRKZ2hqU3lSZUtIcnBKZC90SlY1MktOa1VzODZ0QVVpc3p6RXpINU9LK2tD?=
 =?utf-8?B?MG1Udm1IcXJQa2J2WlB2c2lldTN0S1ZKMTRSQm51N1UrYTFsbUNvV3Q4bkJE?=
 =?utf-8?B?M0ZjV2dJZWsyUzhYVjRYSHhudlBONlphQXdYMXk1MmJRS2FENWhOUy9jM0dN?=
 =?utf-8?B?c3pTWFFEQ0J0NkdMVTNURjI2TUZSbXhtS2M5WlVrYXpVSzBpMVNwbkZqeFJv?=
 =?utf-8?B?UzZLSXg2dlZaY0NHek1hQk5mNkd4Uk5RbmJOM0ZrRnVjQnBmQ01TOXBxaVZk?=
 =?utf-8?B?RHB1alNjQW1tRVlMUGEzZEFZZGhEcGc2bzhYd1czVURmYlliR0RkcEwvd2dM?=
 =?utf-8?B?cHY5cjkyaFZJWnAzbkZ6N29OV0FqOGFWTWQ4bzdtU0dpZVdJOGkwNDlFMTkz?=
 =?utf-8?B?OWtlbXJzcXFSYjMrK01BRGhyVVo5aXUvMVBpNTB4d3hhNlZ0VHBGL2taL3NK?=
 =?utf-8?B?YTM5UnFqVHlHSTV6SC9tWUJXM1VUM1dialpydkNCZjZpYW5sSnRITkRLZjgy?=
 =?utf-8?B?S0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de48ce2-7467-48e5-0f02-08dc6bb5a7c1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 21:11:53.0073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mARG/hOhwZqej/mCXA6Nu5jS2iijhVSNo/D02xm2R+g/40EdwW4MxjLyiPEFHPd3OlniKJA1ZfVR8UCuCWrcZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8092
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

On Thu, May 02, 2024 at 01:01:00PM +0200, Michal Wajdeczko wrote:
> + @Rodrigo
> 
> On 30.04.2024 13:25, Nilawar, Badal wrote:
> > 
> > 
> > On 26-04-2024 20:37, Piotr Piórkowski wrote:
> >> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią
> >> [2024-kwi-26 15:22:17 +0200]:
> >>> The PCI subsystem already exposes the "sriov_numvfs" attribute
> >>> that users can use to enable or disable SR-IOV VFs. Add custom
> >>> implementation of the .sriov_configure callback defined by the
> >>> pci_driver to perform additional steps, including fair VFs
> >>> provisioning with the resources, as required by our platforms.
> >>>
> >>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> >>> ---
> >>> v2: check result of VFs provisioning (Piotr)
> >>>      use xe_sriov_pf_get_totalvfs consistently (Piotr)
> >>>      prefer VFID instead of plain a VF number (Piotr)
> >>> ---
> >>>   drivers/gpu/drm/xe/Makefile       |   1 +
> >>>   drivers/gpu/drm/xe/xe_pci.c       |   4 +
> >>>   drivers/gpu/drm/xe/xe_pci_sriov.c | 138 ++++++++++++++++++++++++++++++
> >>>   drivers/gpu/drm/xe/xe_pci_sriov.h |  13 +++
> >>>   4 files changed, 156 insertions(+)
> >>>   create mode 100644 drivers/gpu/drm/xe/xe_pci_sriov.c
> >>>   create mode 100644 drivers/gpu/drm/xe/xe_pci_sriov.h
> >>>
> >>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> >>> index a67977edff5b..6acde66f0827 100644
> >>> --- a/drivers/gpu/drm/xe/Makefile
> >>> +++ b/drivers/gpu/drm/xe/Makefile
> >>> @@ -169,6 +169,7 @@ xe-$(CONFIG_PCI_IOV) += \
> >>>       xe_lmtt.o \
> >>>       xe_lmtt_2l.o \
> >>>       xe_lmtt_ml.o \
> >>> +    xe_pci_sriov.o \
> >>>       xe_sriov_pf.o
> >>>     # include helpers for tests even when XE is built-in
> >>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> >>> index a0cf5dd803c2..f3efde939df4 100644
> >>> --- a/drivers/gpu/drm/xe/xe_pci.c
> >>> +++ b/drivers/gpu/drm/xe/xe_pci.c
> >>> @@ -23,6 +23,7 @@
> >>>   #include "xe_macros.h"
> >>>   #include "xe_mmio.h"
> >>>   #include "xe_module.h"
> >>> +#include "xe_pci_sriov.h"
> >>>   #include "xe_pci_types.h"
> >>>   #include "xe_pm.h"
> >>>   #include "xe_sriov.h"
> >>> @@ -952,6 +953,9 @@ static struct pci_driver xe_pci_driver = {
> >>>       .probe = xe_pci_probe,
> >>>       .remove = xe_pci_remove,
> >>>       .shutdown = xe_pci_shutdown,
> >>> +#ifdef CONFIG_PCI_IOV
> >>> +    .sriov_configure = xe_pci_sriov_configure,
> >>> +#endif
> >>>   #ifdef CONFIG_PM_SLEEP
> >>>       .driver.pm = &xe_pm_ops,
> >>>   #endif
> >>> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c
> >>> b/drivers/gpu/drm/xe/xe_pci_sriov.c
> >>> new file mode 100644
> >>> index 000000000000..75248fdd6cee
> >>> --- /dev/null
> >>> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> >>> @@ -0,0 +1,138 @@
> >>> +// SPDX-License-Identifier: MIT
> >>> +/*
> >>> + * Copyright © 2023-2024 Intel Corporation
> >>> + */
> >>> +
> >>> +#include "xe_assert.h"
> >>> +#include "xe_device.h"
> >>> +#include "xe_gt_sriov_pf_config.h"
> >>> +#include "xe_pci_sriov.h"
> >>> +#include "xe_pm.h"
> >>> +#include "xe_sriov.h"
> >>> +#include "xe_sriov_pf_helpers.h"
> >>> +#include "xe_sriov_printk.h"
> >>> +
> >>> +static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
> >>> +{
> >>> +    struct xe_gt *gt;
> >>> +    unsigned int id;
> >>> +    int result = 0, err;
> >>> +
> >>> +    for_each_gt(gt, xe, id) {
> >>> +        err = xe_gt_sriov_pf_config_set_fair(gt, VFID(1), num_vfs);
> >>> +        result = result ?: err;
> >>> +    }
> >>> +
> >>> +    return result;
> >>> +}
> >>> +
> >>> +static void pf_unprovision_vfs(struct xe_device *xe, unsigned int
> >>> num_vfs)
> >>> +{
> >>> +    struct xe_gt *gt;
> >>> +    unsigned int id;
> >>> +    unsigned int n;
> >>> +
> >>> +    for_each_gt(gt, xe, id)
> >>> +        for (n = 1; n <= num_vfs; n++)
> >>> +            xe_gt_sriov_pf_config_release(gt, n, true);
> >>> +}
> >>> +
> >>> +static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
> >>> +{
> >>> +    struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> >>> +    int total_vfs = xe_sriov_pf_get_totalvfs(xe);
> >>> +    int err;
> >>> +
> >>> +    xe_assert(xe, IS_SRIOV_PF(xe));
> >>> +    xe_assert(xe, num_vfs > 0);
> >>> +    xe_assert(xe, num_vfs <= total_vfs);
> >>> +    xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs,
> >>> str_plural(num_vfs));
> >>> +
> >>> +    /*
> >>> +     * hold additional reference to the runtime PM as long as VFs are
> >>> +     * enabled to keep GuC alive - will be released in pf_disable_vfs()
> >>> +     */
> > AFAIK PF shouldn't be placed in lower power state than VF. With that in
> > above comment we should mention PF alive rather than GuC alive.
> 
> from the VFs provisioning POV we are more interested in that the GuC
> will be kept alive, and in result we will have PF also alive.
> 
> but maybe indeed it will be better to refer to the PCI level spec:
> 
> /*
>  * We must hold additional reference to the runtime PM to keep PF in D0
>  * during VFs lifetime, as our VFs do not implement the PM capability.
>  *
>  * With PF being in D0 state, all VFs will also behave as in D0 state.
>  * This will also keep GuC alive with all VFs' configurations.
>  *
>  * We will release this additional PM reference in pf_disable_vfs().
>  */
> 
> sounds better ?

it sounds very good to me.

another thought that occurred to me is that if only guc alive is
what really matters, perhaps you don't even need to hold the pm
reference, but just disallow d3cold. But well, grabbing the rpm
reference seems safer.

> 
> >>> +    xe_pm_runtime_get(xe);
> 
> @Rodrigo, is this ok, or based on below discussion this should be
> xe_pm_runtime_get_noresume() instead?

if this in inside bounds of your previous get from the configure
function, then the _noresume is likely the one you want indeed.

But if there's a risk of the configure to put ref back before
arriving here, so you still need to go with this main get().

> 
> >>> +
> >>> +    err = pf_provision_vfs(xe, num_vfs);
> >>> +    if (err < 0)
> >>> +        goto failed;
> >>> +
> >>> +    err = pci_enable_sriov(pdev, num_vfs);
> >>> +    if (err < 0)
> >>> +        goto failed;
> >>> +
> >>> +    xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
> >>> +              num_vfs, total_vfs, str_plural(total_vfs));
> >>> +    return num_vfs;
> >>> +
> >>> +failed:
> >>> +    pf_unprovision_vfs(xe, num_vfs);
> >>> +    xe_pm_runtime_put(xe);
> >>> +
> >>> +    xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
> >>> +            num_vfs, str_plural(num_vfs), ERR_PTR(err));
> >>> +    return err;
> >>> +}
> >>> +
> >>> +static int pf_disable_vfs(struct xe_device *xe)
> >>> +{
> >>> +    struct device *dev = xe->drm.dev;
> >>> +    struct pci_dev *pdev = to_pci_dev(dev);
> >>> +    u16 num_vfs = pci_num_vf(pdev);
> >>> +
> >>> +    xe_assert(xe, IS_SRIOV_PF(xe));
> >>> +    xe_sriov_dbg(xe, "disabling %u VF%s\n", num_vfs,
> >>> str_plural(num_vfs));
> >>> +
> >>> +    if (!num_vfs)
> >>> +        return 0;
> >>> +
> >>> +    pci_disable_sriov(pdev);
> >>> +
> >>> +    pf_unprovision_vfs(xe, num_vfs);
> >>> +
> >>> +    /* not needed anymore - see pf_enable_vfs() */
> >>> +    xe_pm_runtime_put(xe);
> >>> +
> >>> +    xe_sriov_info(xe, "Disabled %u VF%s\n", num_vfs,
> >>> str_plural(num_vfs));
> >>> +    return 0;
> >>> +}
> >>> +
> >>> +/**
> >>> + * xe_pci_sriov_configure - Configure SR-IOV (enable/disable VFs).
> >>> + * @pdev: the &pci_dev
> >>> + * @num_vfs: number of VFs to enable or zero to disable all VFs
> >>> + *
> >>> + * This is the Xe implementation of struct
> >>> pci_driver.sriov_configure callback.
> >>> + *
> >>> + * This callback will be called by the PCI subsystem to enable or
> >>> disable SR-IOV
> >>> + * Virtual Functions (VFs) as requested by the used via the PCI
> >>> sysfs interface.
> >>> + *
> >>> + * Return: number of configured VFs or a negative error code on
> >>> failure.
> >>> + */
> >>> +int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
> >>> +{
> >>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
> >>> +    int ret;
> >>> +
> >>> +    if (!IS_SRIOV_PF(xe))
> >>> +        return -ENODEV;
> >>> +
> >>> +    if (num_vfs < 0)
> >>> +        return -EINVAL;
> >>> +
> >>> +    if (num_vfs > xe_sriov_pf_get_totalvfs(xe))
> >>> +        return -ERANGE;
> >>> +
> >>> +    if (num_vfs && pci_num_vf(pdev))
> >>> +        return -EBUSY;
> >>> +
> >>> +    xe_pm_runtime_get(xe);
> > I think this is not needed as rpm ref is already being held and released
> > in vfs enable and disble function.
> 
> IMO this is the 'outer-bound' caller, as called by our PM doc, which
> should take the initial reference, while rpm calls in enable_vfs() and
> disable_vfs() are just additional one, SR-IOV VFs lifetime specific, to
> allow VFs to operate.
> 
> @Rodrigo, is my above understanding correct ?

yes, this looks correct to me. although I didn't look carefully the code
to know if the put of this configure case has any chance to occur before
the get_noresume from the inner case.

> 
> > 
> > Regards,
> > Badal
> >>> +    if (num_vfs > 0)
> >>> +        ret = pf_enable_vfs(xe, num_vfs);
> >>> +    else
> >>> +        ret = pf_disable_vfs(xe);
> >>> +    xe_pm_runtime_put(xe);
> >>> +
> >>> +    return ret;
> >>> +}
> >>> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.h
> >>> b/drivers/gpu/drm/xe/xe_pci_sriov.h
> >>> new file mode 100644
> >>> index 000000000000..3b8bfbf7e1d9
> >>> --- /dev/null
> >>> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.h
> >>> @@ -0,0 +1,13 @@
> >>> +/* SPDX-License-Identifier: MIT */
> >>> +/*
> >>> + * Copyright © 2023-2024 Intel Corporation
> >>> + */
> >>> +
> >>> +#ifndef _XE_PCI_SRIOV_H_
> >>> +#define _XE_PCI_SRIOV_H_
> >>> +
> >>> +struct pci_dev;
> >>> +
> >>> +int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs);
> >>> +
> >>> +#endif
> >>
> >>
> >> LGTM:
> >> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> >>
> >>> -- 
> >>> 2.43.0
> >>>
> >>
