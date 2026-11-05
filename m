Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AB7606A335
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 18:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OMmf9j90
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A95010E317;
	Thu,  5 Nov 2026 18:03:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9093010E317
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 18:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793901775; x=1825437775;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7gsnAwf+UhXBUjeCOkgwGakehRB4dbgm+0iE8PKfIj8=;
 b=OMmf9j9027cHPP351IEsFq0Mz7q8NJAqWTqAiidb196RW1CZO8O5bZyz
 7n//2ErgtrSL3/MOCIWDINqEMn0fwGmdS0xfA7SUkbSeT5HUzNPFUA9DT
 DezNMMNduHRcSyaMyzvv0AO8/7+OsVZehbj6s2siZWL8gL2HlOJLKMc63
 mjuV5DfLELIfuc0H/VkH7pLYqvFNlvNOWLdc5IbqYBuW+6lJ6I1I/0lsd
 iG93uRzlxVqNegeY7rEnJ+N3dcPPu9SqPmjAn0oxG8wdHiCtCoTkjKH5U
 xztSaefuA9PYGB56EFdKa+Ma0QDe1TXbFvEZWfTXUNphaWWywab+DkDZ3 g==;
X-CSE-ConnectionGUID: leQQJPSsSsaTHQOb0DVM9A==
X-CSE-MsgGUID: jCykO+MMQ+Gw6FXqLwI5pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2709333"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2709333"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 10:01:57 -0800
X-CSE-ConnectionGUID: d4QsXUaYQoah3cAbSKowzQ==
X-CSE-MsgGUID: Pnvr929eQ7y4dSO00zBjcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7492362"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 10:01:57 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 10:01:56 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 10:01:56 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 10:01:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SnPvDDfTBnzF5kqKu5L23Z+oimT8ZFZKp3138dwdwaowb32/YD92P1pYbZdDM9KOiD680qPq9G/A0s51p+R424/0aYkvDuw0mKj5HzqY6m8WadbMmYFPLDjXDzVqewicZHI95RufWswlpys9/hrI3KE1JzDVYwIktKwigHLn2DKSCVuL+UcwbHLJI2e2kj2PHKCO2muC9wWbrdpbMFNDqvEWuPHYBOJrDw42EPpKYxwFUXyaQxwyF3TJB+DqhP69KheSU/p9200MB57M8M/t5UVnNTD7tsiD/Vgc9ad/sN1kCyz9jSxw5Zyava+T3GDUCjC6x4cKF7+CrmMttXomyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTxCk3J48x5v7eEw2XDr3tsHv5yvCabFQz1eeNgtW/w=;
 b=G/AeVA5TOQUD9q5mfhY1C21khpwXZMGoiP+UTaYJ8/H7I1E3quHh+Fm1MSStSMTnwAiZ3cslaaf7oL8+FGia/sqHwwDLAWNmjdmcGAIhpu1ahwdbn/YOXXVg4S9KZEAtV7MokouYQpdtF9YbKXkYCYobUw5q3GHQX9J+QRAKuY7cLa+YIh7HT0X5H/HGu3f2FORAOzk/1kL9dx5cDh6gGGibKxXw/WD6oAisWPkJt8riAiMxrPap0HnpGrcvgffDJUTmYlfv6ua+S8K8rNDJiCUKyaEAFeNmGRz7z6XDaGSGsUB2w8GrEm8LY3QTwi16Li+O+YKl1FjpmFazY/cfMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by CHXPR11MB9627.namprd11.prod.outlook.com (2603:10b6:610:2f9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 18:01:54 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4%4]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 18:01:54 +0000
Date: Thu, 5 Nov 2026 10:01:52 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe/pf: Program LMTT directory pointer from
 each GT's init path
Message-ID: <20261105180152.GI6078@mdroper-desk1>
References: <20261105114923.880265-3-satyanarayana.k.v.p@intel.com>
 <20261105114923.880265-4-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261105114923.880265-4-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: SJ0PR03CA0335.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::10) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|CHXPR11MB9627:EE_
X-MS-Office365-Filtering-Correlation-Id: abae94e0-439c-456f-c4d2-08df3b66e03e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|4143699003|261026121527099003|11063799006|56012099006|261026140227099003|261022105027099003|261009223027099003|261021135927099003|261102123227099003|261021123027099003|261021121427099003|261022113327099003|261028144727099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: FM2uCSF6vxPzpUX2PFlv5dUJvyug2GnbkB2EB7+DzP/ABxrhiqLHxNZlZKIARUkg+X4NQwB7JcmROcpb9iV5y/+HGnhrx9S2MTH4SpViuJ7nUZvtixSG4WgzkRztevdUWWju1R9QNbZzHWAD2m/jYRN0iUQdJLzifuUx779tqIMBPGUyoqphocQdLfbjSOglrFPa1oexNDgCdub99s/6Ek1lYIHcOZtnZ6zmxae37FCnxlOfXDZkfSt24zGh9Amtve/7Fb5HyUWex9iVF3fGcATPXq4ILfAFpbMDQi3ImncEMPcMC5rRTa616rOvkRM24PYDUYLty+KzeOVMexCyQOaspGtvMunOoCHj+uNcOuMDokBkz5mv7H0hO0BO3UMOHGakaC6dp07onQYT6UdqCflpcrkdwWXz+QzDQjT5iE8epP8EvDwdI2FN/w+B2M/qgDPNoftg5s9kxG7T9VBb5oZ64QnsHNiFl1EzpFU/cmmyhp40sGo2SbUbkAj8pM5MQjNJtKCPp4uquyG2fXUhVN4a6IAgcrm470N1d6StGO25B2D35n7UwdbEZ/zSM+t8qXn0CTSlp5Vick3DpPRPMQ/jIF8xYX5HdZl6q80eyd59hQ5U6peoDsLSOGT19gm/ZyubF4l8G9JDBQa1NdtIOjgxvMs+RWvg100vvC3EvFc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(4143699003)(261026121527099003)(11063799006)(56012099006)(261026140227099003)(261022105027099003)(261009223027099003)(261021135927099003)(261102123227099003)(261021123027099003)(261021121427099003)(261022113327099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vmtac1h3bUovdkt3TnVtY3dndGgxN0ZTS2tzWHY1NzJRYW12V3ZaakttZ3VZ?=
 =?utf-8?B?Yy9hV2E2OXFEc1RwMUNPaXZvaENTTCt0MHNoQk1ENTdiNFg1bnp5OGR3NnBH?=
 =?utf-8?B?STdvNjdEYjVVK3M3eXBxWm1SejNManh6dEZmQWx5a2M5cGQwYVNpRG0zbGxo?=
 =?utf-8?B?dVJHT2pONEYrOUxRRkxDb253Tks4M1I0MTJ5M2NwYlp1RTM5clFmTngxeUFL?=
 =?utf-8?B?c2JQZi93VlZBRzhyMWNxVzI4ZHR1ejZtR1hhNFhuaTdHR3gveWVGdEIyWWt5?=
 =?utf-8?B?WEh3QVJQSXVFVE45cmZqb2RtRzIwdE9WVm4ydGJYL0NZcy9GNTdmcUo5SFFN?=
 =?utf-8?B?b0NLSktIK2dJbE9LNy91SVpyTUZyRHJORVVYQlhZOUZiUWhBc0xTc0FUTldz?=
 =?utf-8?B?dWRrRDZrUnNxT2wrd1JVMHhwWnJYQTRBWmNSTWlpNC91VXJTYlQ2OERmb2hI?=
 =?utf-8?B?OEtJbTZaOUg5aE53aDZrUzZSWGRqV2RyU2cwTXljdXRpODAwZDhlMHlDK1hB?=
 =?utf-8?B?T0IzSFZpaHlqV3phNWhGSHh0bFc1aHpFMGNycGk4MXdjcGxSeWhtWjVIZjF2?=
 =?utf-8?B?TmdxVDl6TVpoU3RZS1hRRXlZMWhSZEhTUVh4ZnRPY3FwbVZTVXp4aDVTM3pC?=
 =?utf-8?B?YVB0a0lHdlA0VVpDM2ptU3QzcTFHQ0U2aGE1MmdKWUlqVkVaUUo4dS9wNmJN?=
 =?utf-8?B?UWtBTnlxbWo1eFpYOVRXU09SSlh2ZGVwQWFQQmpTVGJTVUZ6TWxqT0hLRnNL?=
 =?utf-8?B?cEROazlvQ3dxVVo2QmlrNm9uMVM5WVBTZTU1V2RnMHNkem10VzIyclZadnRs?=
 =?utf-8?B?VGV0NzkyaGoyOE9yaTFYUTR5a285VXN4YUlnTmRtNzRhRitlZVM4VG1DTVVq?=
 =?utf-8?B?SlFBeDRwWDR1RnR5bWhITXhSRGJQMXdsYS8yK1MzSVlPVmlJWUtkcHN3TUdF?=
 =?utf-8?B?Z2V3cDNaakF5ZzZuNkd5Z29KOG1lMkNhSVh1U1pNdDk1RWFIZXdSbzBkdmZB?=
 =?utf-8?B?Yk9yamphUmVQYUhWOTVpVDdaTURySnE1cnZMcjZQYWJWTUZoczl4UkxTUnJk?=
 =?utf-8?B?YmNuRVk4Wm1aWHRqa0p0d3ZNL2hqSE1GZ3Z3d25MME54QU5IQ3hPaVpYU013?=
 =?utf-8?B?ZVRXWmpFRmZDbzFTaWJxRU4rVnZQeUV3bTBVMXBVY3BuanNtQ21TYkI3L1Q1?=
 =?utf-8?B?QlZKMThXV0VLOXNEQjFpeGFJOFJZYU5MZzl6aHVVOXV3NXZZYmFSYzJjUGNV?=
 =?utf-8?B?cVZMMDVJSHd1WEpyQ3ltNFZ0RlZxanhTZjJZKzhRRSs3b1R2RDg3RWxYdlFJ?=
 =?utf-8?B?dnB4WFY0YlA4Ri9XQWdFdEdHazlzMnQ3blZHMG5XaFA5OTBNSGVxbEoycTFK?=
 =?utf-8?B?bHFKd2IzSDBwUnJXMUp2M3BNajc0THV2dTZKRGRwb09sdEZFNEh6RWlzRDds?=
 =?utf-8?B?WVZZTkNOZmp0TTRhQzYrVWsyTU9qYzkwWWhPMTQ2UEJxQlVHQnlxSXBWdGlG?=
 =?utf-8?B?WHpGRTB1Q3NGNVZ5Q1Ewc2ptbHlUanUvRzlyUDFFdGp1SkMrZVdnOFVqWjNM?=
 =?utf-8?B?bUxYU3hjUm9ScUFYZXFzdjkyYmFmSjIyczhEVmhnZVhkRmJmUmtaVXR3R3Vw?=
 =?utf-8?B?R0lieEhJU1dUZnBaUkRDNzNPeGxBTHRsRjVML1VocTN1RXZUZlRYcXQ3TU9W?=
 =?utf-8?B?S3NGUW5zdnJ0V3R0MnIxZUxINGhDaWEydEY0cGswUGc1L3h5Vm81M0pOd2h2?=
 =?utf-8?B?azhVT1VKWjU4cm11dmliN0ZCMXNraFRpZzVtQ0ErRk1rZmtSRnI3aWZjUGxo?=
 =?utf-8?B?OVM0aEo0MlR1QVNsZzUxMzlVQnZLV29mNXhaNktmdG9JNDNSclM3OXFuZUpj?=
 =?utf-8?B?TisvaHEvR0tTb1hJTGFUckpSZ0NZZUlHTU1xL2Y1YjkzUXVCZnJuTndiRnVo?=
 =?utf-8?B?MEMxTXo4MVE5UXNnSGtYTDVkZjlOUkRKWEdzNms5WVAyeUFDRDlTSEdJS0lH?=
 =?utf-8?B?RUdZT0VQaDNZeWUvcFAwbGh4M1FsWm01dndwZ0hRNWtUMllIcHdJbGo1Q3Bp?=
 =?utf-8?B?bjUrUG5wakREV3phNSt2d3hCbDdyR2Vtb2lOcDZJZW5zUndsODhYMTN2WmRo?=
 =?utf-8?B?S2hBV0UzREVXZ1FXR1FlWVBpSzNwR3lUNlNITHBIV01MNm5lWnpwNXFTbUZI?=
 =?utf-8?B?b1FuZHB6b1VjbnhvUFNnVEh1bzEvSzdIOU1UMERkM09ENjMxNnN2bDc4YWxa?=
 =?utf-8?B?WmpsSDBqNjhGcTFTb2tyTWdNSmF6TzdRV09CWXh0bGF1M25tWFRJSnBqOGlL?=
 =?utf-8?B?Z0F2dXJjYytoTzRFajZ4SkkzcWduclBGWEJYQXZNV2Z0UXVPM1ZwUitlZ1lX?=
 =?utf-8?Q?zN/VRxDPn3ZbT+tI=3D?=
X-Exchange-RoutingPolicyChecked: S1O1ReQmVlOLnHepcuFqoY16umGLleDed5lsXMeiT9ZfXtX/onNv5MoHSKwMAq6lla6JcouJqp0zGAoUkOvZJZ5aMR/EOMwjICYcvaucFXJe7NBUHXPwX1sTiK+GWG6eJVgwb4Ja7/0ajI0OHZhPAR/V1usBBDWTk10rpmpzy9zEwtr/2C3NB2/9lZ7LFxgET8LS5ahLundoYkGwBqegVNNtNyvh1fBIxPL23dQoQmUPpnhhPIo+GvTLyxgN1oqh6Le354QhFPg0C3sav8V6Y7uLk01dfW9r3qymu6DCTiVLvEvypFNcb+tPbRPEnVFshn5lU2IDyWPFIFOhJHSIsw==
X-MS-Exchange-CrossTenant-Network-Message-Id: abae94e0-439c-456f-c4d2-08df3b66e03e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 18:01:54.5962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPJg8C5wOlwzN6Jde9TN650npiaoY8/b20gA7udkSYQkPhXhf7LTEimR1i2cmKpnr5VFyNbAbc/CNBMQL/F5P9laaDCBBZKTqyJUr5KMF/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR11MB9627
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 11:49:25AM +0000, Satyanarayana K V P wrote:
> The LMTT directory pointer is configured on every GT of the tile only
> from the primary GT's init/reset flow. On new platforms, both primary and
> media GTs have their own forcewake. Primary GT's init holds only its own
> forcewake, so the media GT write can be lost.
> 
> Program the LMTT directory pointer from each GT's own init and restart
> path, while that GT's forcewake is held.
> 
> Also use MCR registers for primary GT and unicast registers for media GT.
> 
> Fixes: ad69d62588cd ("drm/xe/pf: Program LMTT directory pointer on all GTs within a tile")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> 
> ---
> V1 -> V2:
> - Use MCR register for primary GT and unicast register for media GT
> (Roper Matt).
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_gt.c           | 14 +++----
>  drivers/gpu/drm/xe/xe_lmtt.c         | 58 +++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_lmtt.h         |  5 ++-
>  4 files changed, 55 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 73aa78d30679..90319e3d6046 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -109,6 +109,7 @@
>  #define GAMSTLB_CTRL2				XE_REG_MCR(0x4788)
>  #define   STLB_SINGLE_BANK_MODE			REG_BIT(11)
>  
> +#define XE2_LMEM_CFG_MCR			XE_REG_MCR(0x48b0)
>  #define XE2_LMEM_CFG				XE_REG(0x48b0)
>  
>  #define XE2_GAMWALK_CTRL			0x47e4
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index be79a0da2f2f..b751b5044f3c 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -675,11 +675,10 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
>  		xe_gt_apply_ccs_mode(gt);
>  	}
>  
> -	if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_is_main_type(gt))
> -		xe_lmtt_init_hw(&gt_to_tile(gt)->sriov.pf.lmtt);
> -
> -	if (IS_SRIOV_PF(gt_to_xe(gt)))
> +	if (IS_SRIOV_PF(gt_to_xe(gt))) {
> +		xe_lmtt_init_hw(gt);
>  		xe_gt_sriov_pf_init_hw(gt);
> +	}
>  
>  	/* Last action registered here so devres drains resets before teardown */
>  	err = devm_add_action_or_reset(xe->drm.dev, gt_worker_disable, gt);
> @@ -879,11 +878,10 @@ static int do_gt_restart(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> -	if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_is_main_type(gt))
> -		xe_lmtt_init_hw(&gt_to_tile(gt)->sriov.pf.lmtt);
> -
> -	if (IS_SRIOV_PF(gt_to_xe(gt)))
> +	if (IS_SRIOV_PF(gt_to_xe(gt))) {
> +		xe_lmtt_init_hw(gt);
>  		xe_gt_sriov_pf_init_hw(gt);
> +	}
>  
>  	xe_mocs_init(gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> index b6b3d892a35e..8fba3c01fac2 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.c
> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> @@ -12,7 +12,8 @@
>  
>  #include "xe_assert.h"
>  #include "xe_bo.h"
> -#include "xe_tlb_inval.h"
> +#include "xe_gt.h"
> +#include "xe_gt_mcr.h"
>  #include "xe_lmtt.h"
>  #include "xe_log.h"
>  #include "xe_map.h"
> @@ -22,6 +23,7 @@
>  #include "xe_sriov.h"
>  #include "xe_tile.h"
>  #include "xe_tile_sriov_printk.h"
> +#include "xe_tlb_inval.h"
>  
>  /**
>   * DOC: Local Memory Translation Table
> @@ -211,14 +213,43 @@ int xe_lmtt_init(struct xe_lmtt *lmtt)
>  	return err;
>  }
>  
> -static void lmtt_setup_dir_ptr(struct xe_lmtt *lmtt)
> +static void lmtt_setup_dir_ptr_gt(struct xe_gt *gt, u32 config)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_reg_mcr reg_mcr;
> +	struct xe_reg reg;
> +	u32 val_read;
> +
> +	if (GRAPHICS_VER(xe) < 20) {
> +		reg = LMEM_CFG;
> +		xe_mmio_write32(&gt->mmio, reg, config);
> +		return;
> +	}

Looking back at the old Xe1 platforms (which we don't officially support
with Xe, but that the driver can still load on for developer use):

 * DG1 (bspec 66696):  0xCF58 was in a non-MCR range
 * DG2/ATS-M (bspec 66534):  0xCF58 was in an MCR range (MSLICE)
 * PVC (bspec 67609):  0xCF58 was in an MCR range (HALFBSLICE)

I'm ignoring the igpu platforms since they don't have LMTT (which is
good because MTL/ARL had separate primary/media GTs with the same
annoying MCR vs non-MCR split that we see on Xe2 and later).

I think we can also ignore DG1 and PVC since it doesn't look like we
enabled SR-IOV on those platforms in the Xe driver, so this code will
never be called for them.

Unless I'm missing something, ATS-M is the sole platform that will ever
get into this function and then take the "< 20" condition here, right?
In that case, we probably need to define LMEM_CFG as REG_MCR and use
xe_gt_mcr_multicast_write() to avoid any MCR-related races.

Aside from that, everything else in the patch looks good so

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

with the Xe1 MCR change.


Matt

> +
> +	if (xe_gt_is_main_type(gt)) {
> +		reg_mcr = XE2_LMEM_CFG_MCR;
> +		xe_gt_mcr_multicast_write(gt, reg_mcr, config);
> +		val_read = xe_gt_mcr_unicast_read_any(gt, reg_mcr);
> +		xe_gt_assert_msg(gt, val_read == config, "LMEM_CFG_MCR: %#x != %#x\n",
> +				 config, val_read);
> +	} else {
> +		reg = XE2_LMEM_CFG;
> +		xe_mmio_write32(&gt->mmio, reg, config);
> +
> +		if (MEDIA_VER(xe) >= 35) {
> +			val_read = xe_mmio_read32(&gt->mmio, reg);
> +			xe_gt_assert_msg(gt, val_read == config, "LMEM_CFG: %#x != %#x\n",
> +					 config, val_read);
> +		}
> +	}
> +}
> +
> +static void lmtt_setup_dir_ptr(struct xe_lmtt *lmtt, struct xe_gt *gt)
>  {
>  	struct xe_tile *tile = lmtt_to_tile(lmtt);
>  	struct xe_device *xe = tile_to_xe(tile);
>  	dma_addr_t offset = xe_bo_main_addr(lmtt->pd->bo, XE_PAGE_SIZE);
> -	struct xe_gt *gt;
>  	u32 config;
> -	u8 id;
>  
>  	lmtt_debug(lmtt, "DIR offset %pad\n", &offset);
>  	lmtt_assert(lmtt, xe_bo_is_vram(lmtt->pd->bo));
> @@ -226,31 +257,32 @@ static void lmtt_setup_dir_ptr(struct xe_lmtt *lmtt)
>  
>  	config = LMEM_EN | REG_FIELD_PREP(LMTT_DIR_PTR, offset / SZ_64K);
>  
> -	for_each_gt_on_tile(gt, tile, id)
> -		xe_mmio_write32(&gt->mmio,
> -				GRAPHICS_VER(xe) >= 20 ? XE2_LMEM_CFG : LMEM_CFG,
> -				config);
> +	lmtt_setup_dir_ptr_gt(gt, config);
>  
> -	if (xe_device_has_mert(xe) && xe_tile_is_root(tile))
> +	if (xe_device_has_mert(xe) && xe_tile_is_root(tile) &&
> +	    xe_gt_is_main_type(gt))
>  		xe_mmio_write32(&tile->mmio, MERT_LMEM_CFG, config);
>  }
>  
>  /**
>   * xe_lmtt_init_hw - Perform LMTT hardware initialization.
> - * @lmtt: the &xe_lmtt to initialize
> + * @gt: the &xe_gt for which lmtt is initialized
>   *
>   * This function is a second step of the LMTT initialization.
> - * This function registers LMTT Root Directory prepared in xe_lmtt_init().
> + * This function registers LMTT Root Directory prepared in xe_lmtt_init()
> + * on the given GT.
>   *
>   * This function shall be called after every hardware reset.
>   * This function shall be called only when running as a PF driver.
>   */
> -void xe_lmtt_init_hw(struct xe_lmtt *lmtt)
> +void xe_lmtt_init_hw(struct xe_gt *gt)
>  {
> +	struct xe_lmtt *lmtt = &gt_to_tile(gt)->sriov.pf.lmtt;
> +
>  	if (!lmtt->pd)
>  		return;
>  
> -	lmtt_setup_dir_ptr(lmtt);
> +	lmtt_setup_dir_ptr(lmtt, gt);
>  }
>  
>  static int lmtt_invalidate_hw(struct xe_lmtt *lmtt)
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.h b/drivers/gpu/drm/xe/xe_lmtt.h
> index 8fa387b38c52..5ef065dd573c 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.h
> +++ b/drivers/gpu/drm/xe/xe_lmtt.h
> @@ -9,12 +9,13 @@
>  #include <linux/types.h>
>  
>  struct xe_bo;
> +struct xe_gt;
>  struct xe_lmtt;
>  struct xe_lmtt_ops;
>  
>  #ifdef CONFIG_PCI_IOV
>  int xe_lmtt_init(struct xe_lmtt *lmtt);
> -void xe_lmtt_init_hw(struct xe_lmtt *lmtt);
> +void xe_lmtt_init_hw(struct xe_gt *gt);
>  void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt);
>  int xe_lmtt_prepare_pages(struct xe_lmtt *lmtt, unsigned int vfid, u64 range);
>  int xe_lmtt_populate_pages(struct xe_lmtt *lmtt, unsigned int vfid, struct xe_bo *bo, u64 offset);
> @@ -23,7 +24,7 @@ u64 xe_lmtt_estimate_pt_size(struct xe_lmtt *lmtt, u64 size);
>  u64 xe_lmtt_page_size(struct xe_lmtt *lmtt);
>  #else
>  static inline int xe_lmtt_init(struct xe_lmtt *lmtt) { return 0; }
> -static inline void xe_lmtt_init_hw(struct xe_lmtt *lmtt) { }
> +static inline void xe_lmtt_init_hw(struct xe_gt *gt) { }
>  #endif
>  
>  #endif
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
