Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04930C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 13:10:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53CD10E058;
	Thu,  1 Aug 2024 13:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DZUR4/Zl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF0A10E058
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 13:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722517832; x=1754053832;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=islXeIDA1Is5n+ChfSroGqdvtCSYPiKNO8doiOWlmek=;
 b=DZUR4/ZlI2ZnOQPGaXokZBGPBdZyDNvnBcQcK7jSFDfIz62r+wEnlIGS
 X465lKVjryfw5YFltR4F3OUH+cBKaFuyRU2X+06k12i877tEpgZ64wafG
 3bBiFxGeaeuFIY975kGKtiWZ+Ktz3a6OR1bJWcf+uINdUGd+Kc++Ly+Ym
 EtQibft3XmkiwXSXxlTFQqjQ2ZZtGLTYcwOvocBlrHFo6g3iPZT2XY+q+
 6X8mN6kyas5nFt4BMcm0UTV24nRnlKpCW2qLZRYrFT++cCWzKdyba7qHT
 egIJYMe1XeG6tW0hvIzzJUiK0bgCt/Sh6V/ilGQXsjzkzF6M9bLaVzfHm A==;
X-CSE-ConnectionGUID: jZsxq9reS/CQGGv0etFLKg==
X-CSE-MsgGUID: ua9MfdfPQmODtmbj8g+wqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20359596"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20359596"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 06:10:31 -0700
X-CSE-ConnectionGUID: /12AbhLiQbuQxFickI/PuQ==
X-CSE-MsgGUID: KchVI3/fRGeyyRZO51mFzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="60062437"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 06:10:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 06:10:30 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 06:10:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 06:10:30 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 06:10:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wl2HvGemBsyX7nxvpyNl+mAa557kSU5f9rB41zdAedhEofyUm+QHtCz76UYiZJxZkfxphdFGaWWUgofC1vt/jDdlLdfkuiwc/gRPxRBEs4iHTsss/1PabuwXIm12TrhUWIGJajW0bK7QLiBWV/sYopzvrZQSNEbh6Jp0m1UdzBGGnpnTEdSEySlNBSBw7Gcy+5w/I74L8SBdZyzmKZ2jAoQc4LWHgBQGXfay8ucUpmnJVTk+95Yodvso1mQyAXwNITZrilKSP7UPwKabh+vKAlPiy4jzfXIGJ8fbF7AkS3BXYB8i/+Z55EXplcDiAm2euTTNzku9TFgt4rUGKHpvEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xoBOc+O1rLXD/APBm19x376sz5wQG5BLwk1xst69a4g=;
 b=b7dc0kJriCcOmXPIZSMhO3PiEVqiznIWEOKEwvofBOj5/OzgxsSDwSDe4zcjECft/fMWfS82O7qjokUhGZ2rvI3tr20oObo+AcKDq/oJYcFdVRRnq6dAwE8cSsIiGZv8HgRLTvPd3GBajAmcxYaKCwVqtha2EL8Bxzh1mIx7mdvK+wwfJi7hNQeBq3pDL2v3kRH36nSu38xVFc4n0jzZjcU8dmWSuznN55nGME/QTC0SonQt4tLVVcdLUTLEEyDWfmci31TdyzP0PRzyoBnpZcCX+2XssrO88yJ0MamLzJrEb7vjy0yQbn70AnLBa7CYrf1Z5/Q+bvR+4aDlqDNtMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH8PR11MB6925.namprd11.prod.outlook.com (2603:10b6:510:227::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7807.28; Thu, 1 Aug 2024 13:10:27 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%5]) with mapi id 15.20.7828.016; Thu, 1 Aug 2024
 13:10:26 +0000
Message-ID: <fbc79914-d4cd-46bb-be28-7dc49c470467@intel.com>
Date: Thu, 1 Aug 2024 18:40:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe/xe_gt_idle: store powergate enable bits in
 gtidle
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <matthew.d.roper@intel.com>
References: <20240801095305.1209046-1-riana.tauro@intel.com>
 <20240801095305.1209046-2-riana.tauro@intel.com>
 <cfcf0bd5-6f45-4f82-9619-a5ca8dbc5e25@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <cfcf0bd5-6f45-4f82-9619-a5ca8dbc5e25@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH8PR11MB6925:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d8cda91-2a11-4ce8-b5ff-08dcb22b4f55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHIrM2gvZTlqWlRISDhPVDBXT3R5ZFEzbE82NEhXZktDK3YxNW8vSTR4VEM1?=
 =?utf-8?B?WDlFNGc3ZVpUS1ZuaytzTjdCVGdtVEtRQlM1b0o5eVVLVEtYQU9ZVTBJZjJQ?=
 =?utf-8?B?Slp6Z0djRVh1TVRzSlBYcjN6NzNVSW1WTk5qRnlXVW9oTjN5a3JkWmpTVTE4?=
 =?utf-8?B?N3d2MXhOdjExRGlDKzJGeVdnRG85YXc4amhTWndGeHJ4Y01zc1luK0tlSGoy?=
 =?utf-8?B?eUNCZ3greEorWm82d2JGWE9BK1pwZ0RYVk9KZlpCNHVQa3RQMnNjaHBCM1RV?=
 =?utf-8?B?QTlJK0kvRGFBeDBsbHRrakFLTjZVQTcxTHVTUy9tSXU4Z2NkWDNkYW5QSVVh?=
 =?utf-8?B?NXI2aGZrQTMranlUZTQ2aWorM2hGSXJMSkkzeFhxdS9DTXBGRzVudFpJNXh3?=
 =?utf-8?B?MWc1NEs1RW5uRVRKNklxMVpZbVl6d3FFaDQxRkNnV21Kd2xoUG9xcHlKUmhZ?=
 =?utf-8?B?a00zcGpQYjRVYzE1YkVWQ1NuOVlINk40bUFPMktUZXVBbXN6SWk3Y0dDK0hj?=
 =?utf-8?B?UzVxZE9QL2s0Q29kejZFT0hFUEIwOGYvVVp0eXFQOHhqU1BvZHhJVXIyWVJa?=
 =?utf-8?B?R2NWNTJUdnYzSlVyNVRPak13clhxSzlDaEhGbVdwQ1hrYlFRRml5MzhPeU5Z?=
 =?utf-8?B?d2tpSlZETkp5cVBRMUJnNjU2anQ5L2x4VUpZMWlmUFM3aGtIT0x5bVk0S3VQ?=
 =?utf-8?B?Q1FGQTRPYzUyVHg0MTVnYmVHUXU1ci9wcjBSb2p0a25RdVhsRUJMTVBVb0Ft?=
 =?utf-8?B?aE8yeU5SdjZndmZYazR5YW13YW1IMUlDKytyb2NiVGJaeE5TWWdrNkZKenE5?=
 =?utf-8?B?WS8vRU9kM1k3VVBIc0s1K0VUSE1iV29ua0NCVnY1Z3Bkbm5rSEhWLzhYUXBS?=
 =?utf-8?B?UTZjaE9nNTFqblQvcEZZSzRheEFyRmpnajNzc2NrdXhWQXRVY1JaQkVmQ0dS?=
 =?utf-8?B?L1JoYmFxbmppaHIxcDJkNVAwYmllS0E3Q3k2UlBrKzI0a3ZXaFBGazRCM01v?=
 =?utf-8?B?MmJaVmloSTdZdUdUcUxvanFuVXQ1OTNZWnVNRzFHeDRoZFFIdUplOFl1dXZN?=
 =?utf-8?B?dlUzUW9QNlhpQjBoMmxSRFVWNVlqQk4yRTNDQXdTbU03YTB5a1o3SXdPbkdW?=
 =?utf-8?B?UmIvR3NsZUkxL1JIUTByVVF1ZFU1bEMzbVZFTStCR0ZYR0VyNERrQnR1SXUy?=
 =?utf-8?B?dkZ6WW1CN3FnK3VtbnZ6em16aWc0djg1YUQrVXJtMTRYTnMzbjRFc1FkWFZH?=
 =?utf-8?B?LzJ5S08xd2pCU216Q2ZWMnhCc1NRQXdNMzhZZFJoanprZktKRmdITW51aHYw?=
 =?utf-8?B?NGxvTXg4UEYxR1VHQUlCTzcwTXBjMnJ5WDZPQXVZVHAyaElBbjFmSUl0U0kz?=
 =?utf-8?B?RzhWUTUyczBiaGhwbk9Zdnp2VFNodWY0dXNQNlJoVnNwQ2lvU3MxSUhIUC96?=
 =?utf-8?B?WnlKczNIYXV4bWxqSDQzMUc5cGNRcUlJOHRHUGhNRFRjaUJZUlNQV1JSNUF3?=
 =?utf-8?B?by80WXRwZ0F5bGdjMXduRG1OTWRnSlVOaVU4cmJWc0k3Rzc1Tmpwa2l1WHNx?=
 =?utf-8?B?Ykg5TXQxekkwenFrSGMrYm1DRjBlUzM1dXdxMWZYeEd5S1c3Q1B4T2VBbUFi?=
 =?utf-8?B?SUdqU24zbk1lSytWekhZVTBTVnJiQjRKUkFqZkc2M01rNWlxZGdRYnVXSldq?=
 =?utf-8?B?N0Vid05WeFEwMlprUCs0U09RNDg1ZDcxNHN6OURtektFTHFoNWdvSlQremYx?=
 =?utf-8?B?OHZ0VWtOamNYQTNuS0RYejE1RWpCZnRNYzBEZFJ0RGtuNTJrOXUzcVhnRzgy?=
 =?utf-8?B?bGZLNDVMdmlzYmp5VnVHUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NW1BRzZ6UldJU1ZSK281aVBUS3pVTjIxbUI3MzdNNnhkSFhyWllQRktyYkQ2?=
 =?utf-8?B?d2t5Z29DNTNlNkppYjNJL1g5RkZUcmlZN3IrcjVOYThHcXlsQXFrSVBKK1Qr?=
 =?utf-8?B?RXk5MXZmNFJkanNWY3JRa21sQWlFNjEwVEUrQ2pUZjU4MVBqZ3dwY0Y2QlJN?=
 =?utf-8?B?U3RwTDRaSC83SzluY0xacG9tVllzcEJmQVJKWmFiT0tNTGk0czB2emtQd0E0?=
 =?utf-8?B?OGNoTmFzdU9yUDFNOGI1dUFBaXUxZWZXY3RDYWVBK1cxZVk5RmorQmNMeEJK?=
 =?utf-8?B?TGc2bWFpWUNqdE5WVGNTVXR2YzRLUU9MMHhodVU5ME5xVkZTakxWYUhQQXZv?=
 =?utf-8?B?OHZrcHV5anMzNDUzNDR0YjZGcTQwTUVtNzFJUzkwRnM2VkJlL1hHWnI0Ym9l?=
 =?utf-8?B?bWt5Rit6UTlUcDhjaEIvNWtubUo5bCtwRzMyZjBZakMvT1dURDRhRDBGNzIv?=
 =?utf-8?B?TEltL3psWWduWE4xb1czQmJQNG9NemRMQ1lud2c0aXZubDhBNVVpeUVoQ3kx?=
 =?utf-8?B?L0NNV1YybnpNNUZSVXFsb2g1Q0JRL0VTZFpONHFRT0R5MUxlUUZoUU9XdUZU?=
 =?utf-8?B?Y1huWXBTZm1JckcweVZNWlRYQnBmQ09rM2NIMi9BRkdTMERiUkhzU3FMRWM4?=
 =?utf-8?B?Uk1XRG5hblJ3SmdOcWdsOUhRZVRCZTlnYTQ5djRQSEw1OHNxd2l1U0dQc0pk?=
 =?utf-8?B?Zm40YitLYU00SmdvM0tmckJTMmhmbGRUVlVGRmdPUFdvQVZ5K3laZXphLzBX?=
 =?utf-8?B?czc3Q1ZINEFQYjJLanU2Tk9HbGgxQWozWXloMHYzUHBhZlFVQ21Vd3FJSjZ2?=
 =?utf-8?B?eFExRTVoNDdFU1lLNTAreTdMZFhXQjJOMlQyeGhJKzlGelovS3VHa1QzdTUx?=
 =?utf-8?B?RjV3eEdZSEdaNjI5U0YrcWxVN3VJU2plZVJzSis2aDBXc1JtSzJxSGNyUmJy?=
 =?utf-8?B?WEUrM3k4dlhyZW9KOHhEZUFGV3F4UmZRMWQ3bEF1bDhOTHB0SDZPeThYcWRn?=
 =?utf-8?B?VlFjMGZYNGt6R0RiVzhZYkhYdzhQNjM5MXJwc21maWlFeDEvQW5WWE1oWDhm?=
 =?utf-8?B?YVNyMkNxVFR5NG03MUZCNVVhTExIVVRkWjVzUURjNUpkQnZtWlJveVJNaExh?=
 =?utf-8?B?c0REQmZSUVpKTkVmSDEyRXRobHdRU1c3a1BMVVdKOVlIMGV6UHR5UmJnRUlZ?=
 =?utf-8?B?OE54OWhURWZ6UDFrZFlJV28zd2xva0R3cnRPQUZDaXF5SGlZSlZZbXhvZFVt?=
 =?utf-8?B?Nm5EbEFibkphL1ZobnAwNDBDS3JxODBQaE9qTXdLbnZOcTllYnQ2V0c3dmpI?=
 =?utf-8?B?V0wrbFFjdUhBUW00MWtsSjA5aVI4WkVCQnVyQTd3WXEzdW4vOHl6czJIckYw?=
 =?utf-8?B?NTNYWDl1WjRDVEREUWdUeEo5UHhGMklTU1V1bDNjdnpSeFBuZjJvU25xWDRT?=
 =?utf-8?B?ZjA0eTRZeHdiS2lHUVhpWnlLbkFvYmIzMTBhcS9CazZ2V0JhVEN0UFkrQzR0?=
 =?utf-8?B?eUlmZVRQZklucm4zZWdVSFpwQVVsRDlha0VNV1gyb0xLWVRCcUVwSkROdkEr?=
 =?utf-8?B?OXlCS0w4bDJLS1VNYXA1S2dlbzVvdXV4QW5VL2lTc2czNXlGZHZKYm9WZSs4?=
 =?utf-8?B?QWpYdlZJdDM5ZC8vWm1EZmthMzBQNnFhZFFUS2RUdVpxYXQ1NmRMS3h4QXhZ?=
 =?utf-8?B?T29LdzJsQi9aeVFJb0pNMS9lT1lQamZnYVpTWUp2MU9XQ1NsbCtqUTZaNzhZ?=
 =?utf-8?B?bnB4U2JTQVBWMVNLNzZMKzVEL0k4dlZieWQxbDhnc2RWU0hXb3VTM0phdW1L?=
 =?utf-8?B?K0FwZEwrbGg3QUtpelhneWN1aW9xS3JGS2xvRTJvQkNrRm1FSmd4bnRCdndu?=
 =?utf-8?B?RDh4WllCUzBPUURrUlVxZTlHUGdQblMrYXY3K1BHWXpKczRRRUZhVXBhczN1?=
 =?utf-8?B?RXlWazJwdnFWQ0plN1AxSmZ2dkpibXgwM09qU1N5Mk95SjU5TSsyVGhSY0tT?=
 =?utf-8?B?UGZYZnE4T0hmUFRGN3dhMFZMU1BDTDI0RHVjSE9xajFrRGpuUFk0N3paOXB0?=
 =?utf-8?B?MDRrL3ErZjhJbzRoQmxyaVhOMWZzWTV0REY3VzdPTlY4R2l4TkFhMVllZzVB?=
 =?utf-8?Q?IR3wd9UN59JiAQw1egqiQfqB8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8cda91-2a11-4ce8-b5ff-08dcb22b4f55
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 13:10:26.8488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YmUG+Gvhx4vcJK3ODQqIMh4hI2NRdINS+8ap1o37pQtovfQwpAMX8YV+7v0hjUbD4t4RFuC9yMSkmZcaB6o6KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6925
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



On 8/1/2024 3:37 PM, Nilawar, Badal wrote:
> 
> 
> On 01-08-2024 15:23, Riana Tauro wrote:
>> Have a copy of the value written to powergate enable
>> register. No functional changes
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_idle.c       | 18 ++++++++++--------
>>   drivers/gpu/drm/xe/xe_gt_idle_types.h |  2 ++
>>   2 files changed, 12 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c 
>> b/drivers/gpu/drm/xe/xe_gt_idle.c
>> index 67aba4140510..7188542aea43 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>> @@ -98,7 +98,7 @@ static u64 get_residency_ms(struct xe_gt_idle 
>> *gtidle, u64 cur_residency)
>>   void xe_gt_idle_enable_pg(struct xe_gt *gt)
>>   {
>>       struct xe_device *xe = gt_to_xe(gt);
>> -    u32 pg_enable;
>> +    struct xe_gt_idle *gtidle = &gt->gtidle;
>>       int i, j;
>>       if (IS_SRIOV_VF(xe))
>> @@ -110,12 +110,12 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>>       xe_device_assert_mem_access(gt_to_xe(gt));
>> -    pg_enable = RENDER_POWERGATE_ENABLE | MEDIA_POWERGATE_ENABLE;
>> +    gtidle->powergate_enable = RENDER_POWERGATE_ENABLE | 
>> MEDIA_POWERGATE_ENABLE;
> Here I think we should have platform check. Like on MTL, LNL RPG 
> applicable for only for GT (GT0) and Media PG is applicable only for 
> Media GT (GT1) ?

We cannot have platform check for this as its applicable even for 
products that do not have a separate media gt

Thanks,
Riana
> 
> Regards,
> Badal
>>       for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, 
>> ++j) {
>>           if ((gt->info.engine_mask & BIT(i)))
>> -            pg_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
>> -                      VDN_MFXVDENC_POWERGATE_ENABLE(j));
>> +            gtidle->powergate_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
>> +                             VDN_MFXVDENC_POWERGATE_ENABLE(j));
>>       }
>>       XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>> @@ -128,20 +128,22 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>>           xe_mmio_write32(gt, RENDER_POWERGATE_IDLE_HYSTERESIS, 25);
>>       }
>> -    xe_mmio_write32(gt, POWERGATE_ENABLE, pg_enable);
>> +    xe_mmio_write32(gt, POWERGATE_ENABLE, gtidle->powergate_enable);
>>       XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>   }
>>   void xe_gt_idle_disable_pg(struct xe_gt *gt)
>>   {
>> +    struct xe_gt_idle *gtidle = &gt->gtidle;
>> +
>>       if (IS_SRIOV_VF(gt_to_xe(gt)))
>>           return;
>>       xe_device_assert_mem_access(gt_to_xe(gt));
>> -    XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>> -
>> -    xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
>> +    gtidle->powergate_enable = 0;
>> +    XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>> +    xe_mmio_write32(gt, POWERGATE_ENABLE, gtidle->powergate_enable);
>>       XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_types.h 
>> b/drivers/gpu/drm/xe/xe_gt_idle_types.h
>> index f99b447534f3..7a8e63f2ebcc 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle_types.h
>> @@ -23,6 +23,8 @@ enum xe_gt_idle_state {
>>   struct xe_gt_idle {
>>       /** @name: name */
>>       char name[16];
>> +    /** powergate_enable: copy of powergate enable bits*/
>> +    u32 powergate_enable;
>>       /** @residency_multiplier: residency multiplier in ns */
>>       u32 residency_multiplier;
>>       /** @cur_residency: raw driver copy of idle residency */
