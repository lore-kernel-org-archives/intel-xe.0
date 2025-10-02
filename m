Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D48CAC5BB
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 01:09:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11EA10E753;
	Thu,  2 Oct 2025 01:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H7Lnxxbu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4E410E753
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 01:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759367397; x=1790903397;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NJc6dxJy33zoHRLLdIHfo2V4ko3hq3ZJfB0dQBkydSk=;
 b=H7LnxxbuIclX228sIxeZII7+hoFl7wbCcuvSCOqunS34vXkNPHOdVLYf
 o7SnYglcqhso2vwhA5lbHbCVgGpnkjbaOHZe9qRnV5ae5KPkTvbgTLZCk
 GE8+ODW70itiWwAZujeFcbTqPEotw3QVzg20j3r6vX+ZsU4M//MwcSKBY
 1B2KUK1YQAxx3IYbGojtSUsMBaN8a8F1AGjRig8B7l68P+4P01O8jKfpq
 5W0OE9lGQ2hVsGikkXkTI28pDiKNBXxTWdOAhFojqslvu5pVcqMP8to/7
 Xwiq35n9eNMZUmvi6L2WIAT7MibckTmgRe8zUUkMeHSLxRAot/w0qP7Ij A==;
X-CSE-ConnectionGUID: P04v+67/TiG6Ukw97yOzCQ==
X-CSE-MsgGUID: FMP91Y2XRrSn+IlxWqWP/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="73081756"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="73081756"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 18:09:56 -0700
X-CSE-ConnectionGUID: wHQk3wlpTKupEHPfvZFAMg==
X-CSE-MsgGUID: suIKSxJfSpmSgeVr88hxJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="179703009"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 18:09:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 18:09:55 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 18:09:55 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.8) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 18:09:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWrfaZtKnqlv4yLp+LU3GdknjvBZRaZP3vMwC08pQdb+ioKPEUv311hVHeWJ3jZljtooDi4tzj86xNIzlEuWCxLekTYbAOJ4/GnQOCMPFwrct3fbjY4zbwDp4Xtvxg0tBMjjSg6qya3BtD2ySE+AaxyXkEQHy+Yub5VJ+m72deVtQLzTBGCQxAWMf5hnjtGBdnuUywFTXM5dJqGlQgjtFWLjEgxJBw+qn/WOzLOqjklGPJE6mr1bLWjS3HO9L0YFdIFyCVxFTYPtJI/GxiV4nOHY9UyUqjKEV7hRhLH9HeORluCo99vdFU6dNQctYsElEZ/6n03MYqslM2qLJIgIAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sk/maAtyw4dAHScGOOe5ww1FKCMo5XRbQZxR1KPNgws=;
 b=YQ2sywOy8L/pldK6NLhzl0y4FovkBzDGGV/KhPEMYtlQmud7jX1P5JcRk4NTPF15NYQpKxkbGzzsrfR+XAK7IVIp2UwPVm1lRFxnteDFW3SiYIj9IDD0n2RBBwnJUjr+gjvCIto9bKa08MF57Bw6brrXJBsy15v/XmaS4ShAiJViVm3W2RrA3dImtL/N/+T4YoBTKULMoIfsS+XTGRFTrWqFYVO8IXlQSecGIcfa5mFVWGUye1qAXLCtmeSkqtsXnqnO7OE1MJFBJjQjDpK0ADYqo7z5dJxM6BeQE2yfmstzTE6TSoxRY/WmNw5GmA/pem4i3Ao3oWDl3Ndp7ILuww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by MN2PR11MB4741.namprd11.prod.outlook.com (2603:10b6:208:26a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 01:09:48 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Thu, 2 Oct 2025
 01:09:48 +0000
Message-ID: <bf310366-1824-4edc-89c9-817914ce4331@intel.com>
Date: Thu, 2 Oct 2025 03:09:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 31/36] drm/xe/vf: Workaround for race condition in GuC
 firmware during VF pause
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-32-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250929025542.1486303-32-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0216.eurprd08.prod.outlook.com
 (2603:10a6:802:15::25) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|MN2PR11MB4741:EE_
X-MS-Office365-Filtering-Correlation-Id: b10fcc54-ca08-42de-6f2d-08de015061d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3dvYXVEVGJGcUVXQkhCYkM3RUhURGZ4QWxLNGtGRHNUTWsvRHk2cU9lNUtT?=
 =?utf-8?B?ekQrK0lZTlg0RlQxREQrNXZrOHJ2OGw2UEdXSjdnZ3lhM2ZKK0RsRDAvUmhB?=
 =?utf-8?B?MGFLV2dhUytzYVQxMnJPRm82ckNXTUVXbmxlNkRTOGNncXVpY3RjYTQxUGtR?=
 =?utf-8?B?Rjk3dzBUbE5lNSt0L0xueWRKMnFXSC81eHNDTTh2ZW9XcDgxL3dSWnpHdThI?=
 =?utf-8?B?czhoMVh1MEpvbkxsOFZuWU92M3JNVUxnS25rOU9SVEtYT3dsZDc4bGlpbTdM?=
 =?utf-8?B?Z0tTS0dMcThmYUFuOFJUQTJ0TEFCZmorcE5FMXh5L21MaFQyQ09aUXpGK0p0?=
 =?utf-8?B?bFB5MkJkOUNNdGVSOExieGN0T3ljcGlIZXZmaUZKZEZzc1JvYWIwRkJvRkZL?=
 =?utf-8?B?MlZlK1Nrb3k2dkFVbW5jTzRidWhFaW5Qd1g0MmFxcXlYOGVrTzM2UTFBWmJm?=
 =?utf-8?B?R1VjNUp2NWhzdVlQL0pzMDBpWjhuK1c3RDFCb0h4V3laS3E2c29GbXRKMzN3?=
 =?utf-8?B?TFI3SGM4WWtqaXprTmhTNEUvbi9xY0cya2dJcXp4VkVKTWJyYjdpcXRMYktu?=
 =?utf-8?B?eVlVNUpwU0gzNkJnN1FtV0tFRDJORHVGVklNUkhocUhWcDhTbWpseDVweEVl?=
 =?utf-8?B?WWtvbmlMaWxwcnBTYVZlR0xPWmdYamVxUjJtdEVTaC9FRjR6RmFoVlhwN2E5?=
 =?utf-8?B?VWRPNjNYQzFtUzNVSVNIeUlEQjJ5dWp2SkNZUWJmNkJnMy8yaDZ0dno0UzZJ?=
 =?utf-8?B?SzBuY3VoMkZzMEVXb2xmZU1FNUwrZU5sU0E2eGd6WlAva2g5ZmlqdVRHbWxN?=
 =?utf-8?B?WVVzME82VHlnbnBkZXFFRW1sMExmTUd6ZnJyVGxMbEVlK044VkVKanI1SjEx?=
 =?utf-8?B?Q0tybjRtTjF4bWxYb1lsVDByVzlhdU5SM1NRZzFOK3ZhcEpDNWJyVVovNkdh?=
 =?utf-8?B?Q2M0cmpQY1F2WHhZa2NucWpkalV6S3p4SFo0N0xFM3MzNlFFVDM3QmtpL3Vk?=
 =?utf-8?B?S1ROa1Zwa21mdE5zeG96cHVrbDY5N1ltdnMzNVAzMjFGWnZGU1dKRDBRZnB5?=
 =?utf-8?B?eTNZckJQcXpOcUlWYVVmOURqVGppVElVQWhhblBtcVF2K0trRHYrNjlQbzdS?=
 =?utf-8?B?b0VXQUlYNVUxNnpIZUZxRnl6R1hrcDU3VXNVMTF6QktDY2JxdW1wYmwvY01L?=
 =?utf-8?B?SGFiYit6aDFwNHlsTDQvNEYwUXFjT1FaaFJydFhWOTJTTlN1TDU4Z1NWeUVo?=
 =?utf-8?B?a1dqVXJ1MTJScmZmcWFpWDA1SEI1TWd4M0RLRCtZUXRGbk5CYVpwUjNQTHZk?=
 =?utf-8?B?UkVSOUZmSENjOHlvdGlyWkc2VC9VUDVldFc1WWw5aFdlc25zR0VwbmpqNzlm?=
 =?utf-8?B?Q2g5OXc2dTBVeGZZRERKSnNHWmkwMmU1ekdwdVpMdmhYSmdDNkJXMDVqZXpi?=
 =?utf-8?B?RjdodVZ4N3VFcXZNaWNGTEZBcW1hSCtEZHg5cms1RmthcThtQnV3V0J1UVhj?=
 =?utf-8?B?QUg3aFhSUXNQM1pRN01zVHlRTFU4QWNYQlpSRGZpeW1JOHUxQys0UzRmS2VR?=
 =?utf-8?B?cFkyVVU2Y1dKbGJqM2tmaXIvYWZZUTVRN0xrNXdUR0luR1prUzRCTUNrOVBJ?=
 =?utf-8?B?dFQxdXJCbVVFemdBTzdQRUEyNkhxaUdhMFl6WmFjNzJyZC9TY3QxNzU5TU12?=
 =?utf-8?B?ekgrbC9tLzlNSDNCd0pOd21mOEFpVW84U3loV2xmcExWWDNkM1NFZ2F0Q1R4?=
 =?utf-8?B?V2N1dlJDYnI0dmRxc0VEeHJ2amhjQ0huTXJWRjRRNUVnN1BFSFZoalM2OXpl?=
 =?utf-8?B?UllSdHhPRUtYRiswMjZZQzR6bkpGZW1SWlNONFRpNmJqeldYaEFNZTZnN2Y5?=
 =?utf-8?B?cnlDNWFjRUE5NkVVbVlKOXNsZWpLcEY5ZVVxcWt1bS81U3RGa3VUUTRhZ0wz?=
 =?utf-8?Q?yce+1GYD3vy/+QtOxcxJivWGtWdk+znP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3I0RkFTcGJiYmVSeEYyQUtHZnA4bkNFM2V1bFp5K2lvL1FIQmlxS2JXS0U1?=
 =?utf-8?B?SWpTeDZzR29yQUcySEFsd2dia3lQRlYvczJMY2FNd1BVNU1WODBFemtkUGN0?=
 =?utf-8?B?bWo0OEZNTDJKZmhia2xtUkYyWnl2bUFSeE01ZHhESFZyZDZxL3pqZ1VNRzdh?=
 =?utf-8?B?NGM3dGxaTzFwallBbmhva3p6NmRkbXZVSnhCbkZ6dEk2RG1vZnNnais4UXBM?=
 =?utf-8?B?NnlraGNuaFhWVDQvWG1UZVdDd1hxRzZPM3VPdGcvRHVkZi9wN2d0ZnE3aEYx?=
 =?utf-8?B?cGRJL1oxbXVucENkem9XblA4UEhDekpuK2hQWWl6SVVzb1pWZVdUamVSZW5a?=
 =?utf-8?B?dmpKQjhKU2FxU2IvcUJWODgvWEpLN1IyZTRxRzRFNFYxTkZXdlpnazBrVlpq?=
 =?utf-8?B?VHJ4REdoQUlNRFo1Q0dibGtmYVZkQVNwMHpPN0p4dkdUNEVRSG1hZ2dxTVh2?=
 =?utf-8?B?ODl3bGloUElDdUEveWxGOS8yYVJjd3ExZE1HcE5XbGYzQXlUUGdQMlZrUHJU?=
 =?utf-8?B?U09KMURYWHh4L3RyUCtiS2pSQ01sZkJXVUl5ZzZYaUowb1FzN2VDaVhTMTEv?=
 =?utf-8?B?bU9TMFJ5blVBakFMTzZPZnd0Y2tMV2UwaHlDQWtQODdsU0UrYUp3aUluQVpT?=
 =?utf-8?B?N0FsdEdzZEIzK0xlWFJrdUNXZGpoRDNCZ2Fldnp1TGw5ZGNjdlRkQnBSSkQy?=
 =?utf-8?B?ZUlTTm00bHpNTTV3SnpscTJNWjAvZk5ia3NkN0RUbWNwUjJBZ2hzamdsRnRh?=
 =?utf-8?B?T09JcnFvd0dWMTRlakxXdXlYMFlqU3NwRkRlYmdkdU1BNjVMZEZKaGh0dnEy?=
 =?utf-8?B?d0dHYkpYUmNTc21aMzFBdXpmb3h5TTlvNnlBY01xaVFQeFI1QVNQc0VoeHJG?=
 =?utf-8?B?OWROTHJoaWJoSXJkUkJGQnBYQ1NJRXVxMHdjdXROL1gxVGZOWkNjc2RMT0pY?=
 =?utf-8?B?SkNTTzhBRE1oc3ZHTkE4S010c1FlcmRZVEJBVE9oZUszS3FRZXNYR1Rnc1BP?=
 =?utf-8?B?eTFhUk1mWDdkY2x5elFoOUhUZmw3N0V6N1VaQW84YlpVZXNUZ3FPQURRMHky?=
 =?utf-8?B?MzRHSndUMGdUZ2hkdzhWUnRFZlpKd1NDcE1ITXFhSlV2dVJ3T21iZTEzZEMw?=
 =?utf-8?B?d0hRbWh1WFF2aFAvMW5OVXFVcjZqRmV5UGRYUjg3bWhqdkY4NU5FNHlSL2RD?=
 =?utf-8?B?K2RKazRtbVp2cHpWTzBxWG1nR0I1RmFUc3NlK2dWb21IbTR6RFo4aTN6TU96?=
 =?utf-8?B?S3M0YzJmbzlrNUNRYWNVdEZQclFmUDNhb3diMEJaemgyOFNST0VXOTRNd1NI?=
 =?utf-8?B?ZVV0NGNGZGFTVHZuakZUTjlrL2RyVFlBNExrdWNuNnNQcndKTXRXSGV4NDhG?=
 =?utf-8?B?dkdXOE4xdmpsKzkrdmZNZWJkQXdPUzQrN0U1d05TWlJVeDRSY1RsUEN2OWtJ?=
 =?utf-8?B?dGcwU096SUFjVDVLK0tOTHJUZXowbUREb1JZK3dZSG1SekoyMHlVT0RvOFVi?=
 =?utf-8?B?M0dQcFZUb1JQdXpWa01FMXJEOTc4ZGVLeFJTZ3ZOb3ZtbmttWkNJZ0crMndj?=
 =?utf-8?B?UnNwcmM0UmpQNUc4WjBVS3BXanMwRll1b1FOOXIxZnkvdFdNNGF3bmVrRE0v?=
 =?utf-8?B?R2JXSmF3aWw5YzJRU29qbVR1SGJNWGhrZEVlRDN3amMzSWE0LzVIS1NmTERW?=
 =?utf-8?B?Y2RHWG9lVTlESjJLelpQUmNpM3pCK1pPZzdFcEV0SHZGdzRGQVN0d0Y2Vk9k?=
 =?utf-8?B?c2VOSDg2dWpxcFRrUkhmMjRGc0RXd0JCZkk3ZGt6MGtSQWdDbkpBZStib1BD?=
 =?utf-8?B?TVYxcjR6RVgwTmg1ZUFJYnRHYU01M2E5ZWlaS1l3elNGQm93Z0l0NzhnZDdj?=
 =?utf-8?B?OXV6emY4d1JHYVZHYXBrUm1PZWVaWGY5cWRDQkJIbHhabUt6cXJ0aE1vdFJV?=
 =?utf-8?B?OWVuN0ljT0VlK2E2UlFueEtLdUFicWJOKzJtZFRocXBpTVU5UnExaHc3VHVS?=
 =?utf-8?B?Y3phWVIrSit3QXdBWHJHYXpDaDlpaXRpcFp4UXllTDZxZ0NHSy9zSEQvSlhG?=
 =?utf-8?B?dXhsWGRraHlPaXJQOEVQYlZtcWtPMWFwV1U3b0NxeVJCTk14cElLd2R6cE51?=
 =?utf-8?Q?QTpxvKCfTVAS5R0fOJMXJzH68?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b10fcc54-ca08-42de-6f2d-08de015061d2
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 01:09:48.6013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qs9sDrA+e2TxHsT09pNhFJMYPs1KLHh+fHuMphp3gDLkjT1a6ZAvO536AEBf23q35iv+SjfvY9cx1B8bvVY/hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4741
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


On 9/29/2025 4:55 AM, Matthew Brost wrote:
> A race condition exists where a paused VF's H2G request can be processed
> and subsequently rejected. This rejection results in a FAST_REQ failure
> being delivered to the KMD, which then terminates the CT via a dead
> worker and triggers a GT reset—an undesirable outcome.
>
> This workaround mitigates the issue by checking if a VF post-migration
> recovery is in progress and aborting these adverse actions accordingly.
> The GuC firmware will address this bug in an upcoming release. Once that
> version is available and VF migration depends on it, this workaround can
> be safely removed.

Shouldn't this be tagged with the corresponding GuC issue reference?

-Tomasz

>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 25efc1f813ce..89ee68828f07 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1394,6 +1394,10 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   
>   		fast_req_report(ct, fence);
>   
> +		/* FIXME: W/A race in the GuC, will get in firmware soon */
> +		if (xe_gt_recovery_inprogress(gt))
> +			return 0;
> +
>   		CT_DEAD(ct, NULL, PARSE_G2H_RESPONSE);
>   
>   		return -EPROTO;
