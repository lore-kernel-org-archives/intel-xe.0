Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D9ACD5BC0
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 13:10:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0480010E89A;
	Thu,  5 Sep 2024 13:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hxda6q+h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362CD10E89A
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 13:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725541842; x=1757077842;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xGJWkHd2zFiF2PBxdVoDuDVMzbvnIauoYT+KKh6BibA=;
 b=Hxda6q+hOEwwr+M9nG3B6yhzzbLOV6IkluMUzwrxABMwk88ky7PaGMMr
 quaW1DqDLZ9F3XPwlYAwm1zYOy48qefilEuoFjdOAhxPSmZJbOberOM6e
 7fkzafBA7cf8ghfk5atSFucjyrOjP0wbW2pYlrAB0VWrQRw/6VQrOsuyX
 kuQTwnZQDPkW2n3GEgd8JmqdS/jye3Gzxy5t5T9vNGO3T4G8bIUi/dwKI
 PiE9Mo9g5mxsj62Ub/My1G3rsvj7vEaBJoLMVLxM4HBeDn2gbSd8ZjbSM
 gyB97w3MlHR9DVagWo7mkkTVaKaqM0i78pgQ5BT2ij7Uro1VtHcdFw470 g==;
X-CSE-ConnectionGUID: OKVX92YaTCqdgZ1k19h7wg==
X-CSE-MsgGUID: 0YMUK3zbShOdR1yyTUU3Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="23812056"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="23812056"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 06:10:42 -0700
X-CSE-ConnectionGUID: EYing+1bQgOhUHHyPp96iw==
X-CSE-MsgGUID: JUPv55VgRHatx6lzXfiPHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="66138420"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 06:10:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 06:10:41 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 06:10:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 06:10:40 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 06:10:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0q6tXZ4nOngSUNeBwRgWN6gidZv6PH8YMpag0SFHSr4QE6g+GMZlzZmrL3TLqG6ceM9zJm7RA7yzPlEB/TPm7ut++kvYE6x4HIUpcsncjJ7ZwlHUhGWcznJvMv6csUeDPIKVokxZDgdHWSPuHhS/0F7q1fGrU7IWWg9nnLk22wSmzhsW/iSN7q4CJwSn7o5FLaBIqEkVjyO6GI+AvFX4+dgr3KA/aAlE9rDd+lPPPSchikm6eUMm8N2rxTz0k6Z6raU5Vz7Wc7ZsTV8RQgETZq9zWljfJoaSLJlp96wPeDqnCpxvbk/m8flqEkIFhl4PtYzOHSkoGFQBbchoFHDDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oz7CpG0kesThn22hhJd4dunKuY27U0l8r8P6ki1l3m0=;
 b=Y3OvoDm+4lR1ySAFJ/pVIFfJ/HPcHS4O1sUg55mdFdgQgv1vRwbezMzK6l8CGm3xkWoC/sA2i/6t/e9HVIgqUyM5CrnpuU3y7tpTxKEFMIFvTWFcoS6qabV09K6eeKksitRh0DPYPxb7359/2k9MYTr0gUvT55loJLO5N1SwxNRjRP57Oqbx+KO8+BCxbg4JZiFUN1pWqMMzNgSzeFI4D4/3mEPafx+0NWIh16eDiRWNtg6M3xYEuHTcDd8Mvx00PafG5SpkTUOcWP4jmUwa0r9RcXLrOTKYHSAZBAJ17gt0y+5k2QPJG7+thV+r1AR0u19Pt21NePSTyx6g3m7+vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Thu, 5 Sep
 2024 13:10:35 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 13:10:35 +0000
Message-ID: <2c32a188-0084-4a77-8347-aa2754884ff8@intel.com>
Date: Thu, 5 Sep 2024 18:40:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: use IS_ENABLED() instead of defined() on config
 options
To: Jani Nikula <jani.nikula@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240904145231.3902289-1-jani.nikula@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240904145231.3902289-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0151.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::21) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SJ0PR11MB4845:EE_
X-MS-Office365-Filtering-Correlation-Id: f989b933-d833-4aac-a93c-08dccdac20ea
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MS85aXFiQVRNcVpGQUFUS2hWMnhKZk9JeUdLQmcyaHJlN1UwaDc0MFkyU0JI?=
 =?utf-8?B?ckg4WEQ2MjVweGdScy9wNkV4QVZ2OFJzYTBWRFRGSW9lQXY2R3FFdmlhaEM2?=
 =?utf-8?B?WnlnNktFeEhRSVdmMWxkczZHR3lacEtjMzZWNmwzNExIbnVvVmc2bDZDcXBo?=
 =?utf-8?B?RG5YMi83bVRKY1VLaWlBelNCeHpLeS9aaXR3OWoyZ3JtNWxhbzhBcGFLMTJI?=
 =?utf-8?B?NUVuV2dHaUFkdytKU0E5Z0hPRVZlako2NkNXWWI5R2VwY1cxek5ybm9haVpm?=
 =?utf-8?B?S0dTL3RyZ0pTWk11MzFMV3NKNi83blZGZXhQdjZITm1HOXNtc1IxZTNxNnlI?=
 =?utf-8?B?cE1OaVorcUFzb1NkUFVWcUMvQVd0S3c3ZXoyRUdkZU9DZXJLZFpPandQT2tE?=
 =?utf-8?B?M2xRSURSdU4rT2t3ZTVOOXJMb0FTUFhyVVJaY1o0YnlxK0N2QTZRV3pBU093?=
 =?utf-8?B?UHZLWlBqdmpwblY1WCt6YnlqR3NGZU9QVDVVSTQ1VHdEcWQzejNHQWxxQ28x?=
 =?utf-8?B?WXZtTUIwU1R3WVFSU2RYeDc0VllySmh5L29TQmVmYkJNOG1QQit4RUsvWTdC?=
 =?utf-8?B?RElHSGxsUVBkYjZLWXZJVDB1WTFoSHBYbEVwN2lTdFZvbFIvSHU4K20yVFdk?=
 =?utf-8?B?UHZlemVRSjNYNFpPb2hSYjNTQU41MDJHRVlTYkFGUEFxcnB1aDVYOVNxSVZm?=
 =?utf-8?B?WWpxT0JPR3BOZHRkRDBsTXNJeUVlbE91SjFKOUtrQmlRV1Y4cFBtM3hQNzNu?=
 =?utf-8?B?Y2VFRnRZTXVua0F2ZDZ3VzNTYkJ1bHpTYlg4a202ZHVCd0JoL2tLNys4bHNj?=
 =?utf-8?B?b2N4NHBYcnR0eExOOTFxcWNqbktUdGhxVVJtYW9KdVdGSCs2enhVZ2Uxd3VP?=
 =?utf-8?B?cjNiQ0pjZ2tiOEZsWG1HTVdFVHYwU2JhNXlIQlJ4R292K3lrSCtqeU5uWG9s?=
 =?utf-8?B?U05yQkxqb3ZSbUxsWllldE1QbGlYM3ptdXQxeW5tVUF4RlJIMDdsL0NDbldr?=
 =?utf-8?B?cEM1ZGcveGR0NFpiZDgweTJhTEQ5enNFSkVXaUM4Ly9nY2N3RnlVaDBKQUdr?=
 =?utf-8?B?SXJhM2RLeWpLeDhvVzl3OWw5V3FkbnRRNjJWTElmWTVUOGNlV2htcVhnNXlC?=
 =?utf-8?B?YTY5RE44VVEvOHlKa1RJVmZZKzRqSjJ5R3NML0tySkUxL3hNbXpOWk5ON0Jx?=
 =?utf-8?B?MGxwZXM4MjFCN01jRUwzNlFRT21lMjBUbllpYm1wSmI0VFFxd3NmQmY3OThG?=
 =?utf-8?B?Y0dreHhXNS9OVStrTlJ3TVp4TVhMcXh5MDB3ZVF4dk9UdEFvV2pwbk1UL3ZO?=
 =?utf-8?B?ZjRINkZkSnVoSlc0WXJ4bkpRTTRGc1A3d1dNV1Y0V3ZxWFR1aWtVZzRzbTN5?=
 =?utf-8?B?K3p1Vk51aERIc203YjAzM3FXNzBqMnVWWlBRZEJhRVBVdHhhK29YUDRldjRE?=
 =?utf-8?B?UTdIVGpRV216TlVNSXVGRVQ1VHprc2NETTJxUWhzcG96Kzhzb0o3K0NxbmVx?=
 =?utf-8?B?ZFRVZytnM3ZDRlM0Q0JVSThUam9TR0hvUndDSlZrejFud2V0YTVpaEIrSzh2?=
 =?utf-8?B?eHQ1WWtTZm5BVm9YVkR1YWxCOFh2ZnNtRjlCcHhUNVd5alkzaGdkU09VdElJ?=
 =?utf-8?B?U0h4WVVsZ0xXY0RNdjNhcDFMNkNMSE92SDQ0VTZtQXQvSHJPMkNnZ2VkdU1F?=
 =?utf-8?B?cWRIQWtzcWxzWm9pcFduS1BaSmMzQXNTNTQvaVpubGcvTS8vRWk4WFZmelNt?=
 =?utf-8?B?TnlZTjNZK0QwY2dLNG1hMGRtVlpQcENYTWNpWEJpYVhmVTIrc0xDclZ6VHZO?=
 =?utf-8?B?L1VXeURrbW1lNWdTUVl2UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzVWY0lrYXNCQStXZzJQelFlaExpMXczWEVYdVdnZ0dVRnJWR21Gd1p5SW9E?=
 =?utf-8?B?UjE3YW90RTBZemxtTi9vb0pVc0R1SlU4Y0laaWhpMFkzcmRwOU5vYUtLMGUz?=
 =?utf-8?B?TlBJYWNoR2EzRmxzZDdqeUJzaVg0eHV3bFZ6UlZjZDVJVGR0VldpalRkeVlm?=
 =?utf-8?B?dC82ZThjT1VBUUJwVXdndXJRZUg0aWZxNGdCOGhqNzBoMFNNb25sR3FGazBV?=
 =?utf-8?B?Y3pQT2YwSnQ2K2orclhnVFhEU3V1Qko2SCs1QmN5K1pxUkJCQ1dGbE1hMDBs?=
 =?utf-8?B?a1AwdE5HK0d3dzl1M01zc1ZZUTF4c3NDbHkyNTZBbUxOZG9PSXduODkvZzdE?=
 =?utf-8?B?WHlPSWFMeC9HZzFYNER0MENpRHpTYnNzNFRaNE9RbkR5WEJzdEpBWUUva0oy?=
 =?utf-8?B?ZERPbkhjRGVKbDMyRFNubnVNK2FMcXJ2WU1wY0UwREFOMUNXQlBoN0h6Tlht?=
 =?utf-8?B?VUhvWUtnYWRNbFlNMXp3WXhteWw4aGpmRU80Y2d5QTBLOXB3MEt0WFpmYjM3?=
 =?utf-8?B?L0hOYjdrcURJaXFxUTkyenZiN01QcTl4QVg4VVJUU2JyVXlPalhJM1pwZllD?=
 =?utf-8?B?ZHBmclFZLzhjWTdxMkg3aVVZQit2WTk2YmNKMkl3MGQ5N3ZqK1pHSGw3VDVm?=
 =?utf-8?B?dGhLV2taWCttSFFqT2puTlNwT1l5cnpEeDFxdHc4c2U3VFRZOG5XTnRtajNh?=
 =?utf-8?B?TFFqLzNSVFpLVFhGTzI0YjFoeEt3RGptekhjNEx3dzFxUi82NG54cXpXK2hY?=
 =?utf-8?B?cHBndVBLTVdwUG9YQ0ZxREo1TmVrMmxwa0hSNmRkMXk3MXg0bEY1cGxmUGpI?=
 =?utf-8?B?Rkt5L0Zsd2ZsVEdyZ3F5MUNGNHRSdjk2RkQ1UzVrSnVhV0pFbmVXVUY0TzVY?=
 =?utf-8?B?emQ4eDd3N2tpNkE5S1V0bFpKWGFCTHpoUkxULzR4dDIzeFhvZXA4NGg4Rmho?=
 =?utf-8?B?VnBTKzNPNU02dEdSSnBxSXdkTmFQTFFjWjNXeEtOKzZWUmxHcm1SMHRnSE45?=
 =?utf-8?B?YzBYTnNpNVZZMjZ6WklQMkxMNlZTcUdHVXNLZG9wbE1NRzBMMFVrV1RBRVha?=
 =?utf-8?B?cVpTdFp0eHoyMkVQOTF4MiszUUVINFhPaDdlNTVqam1Bd2ViSDhkcWs0QTVQ?=
 =?utf-8?B?cCtaam1uNnViSnVXY1hLM0RuTTJPZmt0WVNaUWxvOTVYRmhmVHFVUXk0RHUy?=
 =?utf-8?B?dlJOQnJhV1crNFFlVk55UDJJa0lSWVV3MUhvR3BLc0kzbWE1dDY5OVl4NVpR?=
 =?utf-8?B?NDZLMWt2T0NVWnhRdUhIbGUwZUhmdzNCSEQyUmZSSzZUeCtJbzE5ZXRrNC92?=
 =?utf-8?B?ZTF3dHlsOWFLN1g0REtMb0drVXRoL0d0ZmtuVUo1ZWNwQVBHS0YzeHYzZHNq?=
 =?utf-8?B?aXBKNHFkemRRMHFXa2I2d0R4NGVKa0NqUVd1VG9YRzlBK28zbnB6OGlIOVBh?=
 =?utf-8?B?UnNoWjZPTE1BaXVxTTVUQzhVR2Q3Z1RLN1o2VTRlLy8wbUJDY0xFNHRJODJJ?=
 =?utf-8?B?dU5CQ1lkenU2cTU5RUNQNnNXRmZrS3FrS2R0REZFL2lFNHJDUC9XVTcvNFk1?=
 =?utf-8?B?dHFyU2JDOHlrbEgvZ0tBRWlVSXh6d1dWS3M2aU9mUjBTVUpSRW00U2QycG9C?=
 =?utf-8?B?VGRFQm5odkc1WUxvK01ZYjYyTnFXSm1ZWlh0b05ZN0NiVllpSHNGR1JKOFBY?=
 =?utf-8?B?OWk5d3YrNCtDKzY4eWtQbHpLMGV6bDh0RnFFb3lJUnM2QXZaSi9lam0waVJh?=
 =?utf-8?B?UUp3Znp4cGVlVnNMY0tUblMyQUs3bWErYlUyelZkclRtNFROOHFaTFdSOVRz?=
 =?utf-8?B?ODhGT1V2c1UxWmxXM0lOdHUrVzdUc1NlaGRmOHpYcHUxVk1VNit4NlJUUVZt?=
 =?utf-8?B?di91M2lqMElFZjZMclk0ak8rNnpvUm5ZdTVuUktXelUwNERaSmNlZkZDMGNh?=
 =?utf-8?B?WEc5Y0NrSC9iM045L1hkeHk1YXhLUFhTaklXalJHbDU2RnhMdkNwRWtWZ2lW?=
 =?utf-8?B?VXFZNDlGeEN3R1EvcW0xelFweFNBWDRFRmY5SUNHbmN1VzVxSEtITG5scnlh?=
 =?utf-8?B?bUlGL3JERUV0OEJCbmVVRy9uZ25QUFIxcW1rUkRpUzNoNlY2SG01WTl6ZFdl?=
 =?utf-8?B?RmVBdVhKcXVQaVBRV2Y2aEI0MVBzREZsZFVGWTNFb2pvOVkyWXVEMzdXcXlH?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f989b933-d833-4aac-a93c-08dccdac20ea
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 13:10:35.3041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uuwIXJsUYFD+YKJC47VPh++HOls6NC1hhBMFUx9WakJ6m9mHrq0g/v5aRiuWXi7MSzGOuuTJsiWv6NdK5o8E3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4845
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



On 04-09-2024 20:22, Jani Nikula wrote:
> Prefer IS_ENABLED() instead of defined() for checking whether a kconfig
> option is enabled.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal
> ---
>   drivers/gpu/drm/xe/xe_bo.c                  | 2 +-
>   drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c | 2 +-
>   drivers/gpu/drm/xe/xe_guc.c                 | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 06911e9a3bf5..53948a965404 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -468,7 +468,7 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
>   		mem->bus.offset += vram->io_start;
>   		mem->bus.is_iomem = true;
>   
> -#if  !defined(CONFIG_X86)
> +#if  !IS_ENABLED(CONFIG_X86)
>   		mem->bus.caching = ttm_write_combined;
>   #endif
>   		return 0;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
> index f3ddcbefc6bc..2ed5b6780d30 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
> @@ -33,7 +33,7 @@ static const struct drm_info_list vf_info[] = {
>   		.show = xe_gt_debugfs_simple_show,
>   		.data = xe_gt_sriov_vf_print_version,
>   	},
> -#if defined(CONFIG_DRM_XE_DEBUG) || defined(CONFIG_DRM_XE_DEBUG_SRIOV)
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG) || IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)
>   	{
>   		"runtime_regs",
>   		.show = xe_gt_debugfs_simple_show,
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 52df28032a6f..db667850c8b8 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -583,7 +583,7 @@ static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
>    * extreme thermal throttling. And a system that is that hot during boot is probably
>    * dead anyway!
>    */
> -#if defined(CONFIG_DRM_XE_DEBUG)
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>   #define GUC_LOAD_RETRY_LIMIT	20
>   #else
>   #define GUC_LOAD_RETRY_LIMIT	3
