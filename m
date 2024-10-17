Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94CFD374A2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 14:35:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25D210E201;
	Thu, 17 Oct 2024 14:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b3btnf4C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D40E10E201
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 14:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729175747; x=1760711747;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ybn2zbV9G33t6pMIdtFZIHaH+OBC7m/hT/mcAeTZiWw=;
 b=b3btnf4CFq3RUAsU+w5cwx2vZWJPmpfNt+QDgljTTkXs+fropgLton4x
 e6RF8TP0LtNWl3THeb2kNhNT+T1/6x4ZsG/bKgJ9g5rMp+NzQrtzTHPZg
 yyX6uR50yHbwrvCf45x9jJ4WA/FYJVunRCxW/FFHlXtgs7htJ650zCOU8
 b8Vu4cLbe9+T6XEO91/neolPw8CNV0uS3nTrLE+yIZfmF5pNEjbjvmyVl
 6jcN5Xbx8sElIjd2tPqfxWvuGqpt/lSU0IyuuI3upQbldfkMsu7L4dd9F
 c/ZJtq8QDIgoouMyMCcV+dlMgg82XsGNKW8DEaBeApCdpwPiVeJ+UrWQh w==;
X-CSE-ConnectionGUID: vS9HuNE/ReO5W/IJALd25A==
X-CSE-MsgGUID: 0sp6XEAjRvmCkdJP187tNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39787432"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39787432"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:35:47 -0700
X-CSE-ConnectionGUID: p4LHa0qbQ8ieuCc9CguVJw==
X-CSE-MsgGUID: ZJVcASLvSjevl7sfHQzGsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="78591311"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 07:35:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 07:35:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 07:35:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 07:35:45 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 07:35:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOcQWiRZF+Lgwf2rjESzllPGtNnuuApseIc/8416jXTfJW//JuUDUeaIMu0P0T28Lc60cSLFua91znpbZONYbSLHBwhvrw1llX14ZkZ62ClcmoBCIlmq48w2KBmhWZnCbm37t/+9+FU2gT1lVzICke7jqHD31KVg5WpJamKaPWNU3VaoWABnzeWqCdQEpX6f2NOHxhrrj8m1bXkfn7AaYSK8HaAqh7ENiB1djGqhX7XQsaxVEju62/zHGHQa4I14tEsOxoI4IevIb8fEu/92WCfP85JRA+47/iaBr3AgDrCgTN3S4N4S+7wc98+qWFd9orQZfkH5DGkKzcnjgENWZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2fkAY85OVq/vh7Ht7aJb10IbDXJ56sEigXOlfDzRgA=;
 b=Aai1PSZ3K6VkmRblnEbrIl4mWL6IQS8nMXx4lub/3IFjTwcPg/VyXlBuRtX12EteWgofdhaMkGNUBkMYZM3rcnY0WHL51F71FXxONBXh5nuXrPejZogUsmRR7VlqH0Dz1rtE4dr/6viVUn77T3mFi9wciYcvo0rVd2Lp7fTB194ggyIIzZl/4v1l6eic8XMtbaMKk95Ia2PjKLx1GcsQcnU2xcYTBBPXjKbRcPJUKim0JkTbhL9FG9eqxKr3qhl+bw6pGIztL8Qs+RkjZj0NvukvU8+3oLaUwn3JfRSuE6Pd52m1lbREQKEDHE16J6EorJDnnWnlMiQmjSI7s6qoGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM6PR11MB4642.namprd11.prod.outlook.com (2603:10b6:5:2a2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Thu, 17 Oct
 2024 14:35:43 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 14:35:43 +0000
Message-ID: <577aeb3f-e20e-4066-90a4-a425f54aa16f@intel.com>
Date: Thu, 17 Oct 2024 20:05:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Log unreliable MMIO reads during forcewake
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Alex Zuo <alex.zuo@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20241017034026.1525693-1-shuicheng.lin@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241017034026.1525693-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::18) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM6PR11MB4642:EE_
X-MS-Office365-Filtering-Correlation-Id: d45c81b8-431d-4bb0-3021-08dceeb8faaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWE5NVExTklPSW41ZVlhWUFFMm53RDBRSTJWb0VsdXpMTWtVb3F3YkdyWDZV?=
 =?utf-8?B?Q1lZQXN5K0RDditmSm1zR2dIMHNGUXI5L3lRODRIejlpMTNvK3BQc3c4R1JO?=
 =?utf-8?B?UDluRjFNd2EwV3BSQW42NS9zS1gyNVJvTXRQcUdEeEJQQk4yTFVJSEcvUy9T?=
 =?utf-8?B?YWRCTDUvS3NvdGpRTnEvUVllS29pMlJrL2FybGUwNmllSzNVcGNibnVPRGZS?=
 =?utf-8?B?Q2Y3UldLSlc4Y1YyeHJRUkE5eXNEUUtKemtVM29helkzZGI4cWI3OVdLb2tn?=
 =?utf-8?B?NWUyTjZ5QXZYRDgzSTFmNlNQUjU4amQ0WjRFRnJQUDk5TTRSTFh0cGMxVC9q?=
 =?utf-8?B?MmN2WXlFL1FGcUNpclFGblB3Nmp5YWVzT0tEekNoZHVwemNscVZMbHh0cjYx?=
 =?utf-8?B?MFZyN2Q2QWhubms4ck5KQjZzSDNNbW9tNnJMOXdnUXZrMTVLWEhkL2xTQzlT?=
 =?utf-8?B?aUdydnY4Mi9zaWdaZDBrNXp0Q1VjVDdDZGttY0Rndy9FU2VHazNwSjN0MzA0?=
 =?utf-8?B?bVFqNU1VVVBhNU9uNHhDcXYrNkJwMWRDU0YzRzlSOU1kQ0FHUEYwWmlNZzNV?=
 =?utf-8?B?aGl4cEFxbzdtTkNCcE54eTZYbTVsRnlFcDg4SDc1MkF4RkQxRXdYWkswK1JL?=
 =?utf-8?B?UzE5UmRjN3A0R3NpL3pLU1hiVkxSNjhQUmUzeDBKWkp3bFE5Mm54NFV5UnNL?=
 =?utf-8?B?UmIzTUJRZjV6RUNJeVVrMkloTlZFV0g4cVFxanozd0dZSW5yeXpnZmZONmlN?=
 =?utf-8?B?bzdhUFJNTU5XdHlWeS9Bb1R5WmVCMjcybjB2Nk9zZ0xCV1J5Sy9qQlRMTzNo?=
 =?utf-8?B?eVM4WVRRWjdINVJBeDd5UWthSWh5Rkk1THM5WENTWEpPVG9RSDl0bFlQYUtW?=
 =?utf-8?B?cGhxVWthSHM3N1RoRFY5aUFRMHVrSjVGWVNyQlR5QjkrRHk2WXFhdy92S29y?=
 =?utf-8?B?S25ITkV5NVF0WW5ZbVc0RkNEMEtWaVpMUmI0ay9sYTd4K3l0cW5nNWZOTUY2?=
 =?utf-8?B?TzBueVNIaDl0RFBMemsrcER4dVpKVnNKd0ZqN1VvRnZyQnk1K1FqSndHbmRo?=
 =?utf-8?B?dzMrYlpzSGc1MjFvZ0E5MmlNWVdjVWVhRzBiY3dZQ2Z3QkJqeGpObWFGa1lp?=
 =?utf-8?B?a1d6ZWwza09yV2kzY1JIVEpRYWZtSkIxMXhGVlpleWFSUTNzMnZMN2xhd3Bq?=
 =?utf-8?B?aHZWR3l1NDJIMFFhaWhKVlFXeGo0WDB4eHpYQkpFRHUvR3ljRnBaT2doSzhs?=
 =?utf-8?B?Y2pxVGhiZWY2U2Y2cUQ1enBWRmlrS1R1UmpUM05kWVFnM3ZSMzdZbjh1Sjhs?=
 =?utf-8?B?R0RYbE1jeDlXSXNTMzNrazF1dFo2TGREMHlzQnZlS01meGJMRUc3d2RpREkr?=
 =?utf-8?B?cjE3djZLb05sYXRPeU9VejNkenVCb3ZZM0lzOWJOOFBFZmgvNC9WejU4bUhG?=
 =?utf-8?B?cUg5ck9uang0bTRoMHp5TjBNZFBWUUJLNWRyZGtEZHI4dGE2bFBJSVRxZ2Q5?=
 =?utf-8?B?OGgrK2NmdFRUS0N3SEI0MGcrYmxqZW9OVnJoVFlLamZRWnJGL1FvS1hRWlZH?=
 =?utf-8?B?QWViVmxqZjAvT281My82bE92Wk1mTXB0ZkdLZ0ZoWTFMWTlnQ2pKZk4rbkZj?=
 =?utf-8?B?d0FHK0NQMHhCTFNDbUlRTUdIWVFmL09OazJ2eGk2YjBjL2RwM3VndEo4a2Vq?=
 =?utf-8?B?bDJONldITGduL3M3N1BxV1dLNmNNdU1rUlQvQ0x1UnZGbEE5TnNrS21BNlFB?=
 =?utf-8?Q?Y+E2eDmJrsaNA8stR9/pXxNf3BkEFQLeplPNSpN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFVlQ3haczZrRHFCWC9DejJWeEozdUFuUmw5czY3dWNWUUJxWHJGZ3VlZklU?=
 =?utf-8?B?Mk1rTkdkQ1FWQThWOVNTL0VTNXB4cVBpZkp4aHJsY3pHS1Y0OGEzTHNpdXBo?=
 =?utf-8?B?ME01SE1pNUw4Q1RMZmRLMzlZRnV0d0RrempxQWFuWjh4M2hzbkcxSGdUS0tm?=
 =?utf-8?B?MFF4U3ZXNnpOZnJaUzIwT2w4ZUNCWGIzZ1dSVVFHdEl6bDBuZ2s1TTM0ZFBJ?=
 =?utf-8?B?Q2Zyc0diK2RXTlBQYmtMVWFOdk9JaC9LWjVDa1kwVUVpSWtuc0tNaE52U05N?=
 =?utf-8?B?b0h1SEFseTZ6MlBxYjJnRzdIaWFRODE0Ly9PellKSTFkWDRHbGVoRjQ4M1JX?=
 =?utf-8?B?THluUzNHM09ibzZPdWYrd0RZa3N6ai9xQ01DYzdJWmpUNzdsZjJMUDh0NGlt?=
 =?utf-8?B?QWtLT25RWndUYWR0RHBVZjdZc0VQNmVOYUV4ZllKWHFuaDAxQWU3eG95cVVB?=
 =?utf-8?B?Q3FDV3d5TnJjVWdEY1lrU3FlQ0FlYXltazNLdUJRWXBwS3AzalMraFFDRnBY?=
 =?utf-8?B?VWNkaEhlMDl5TDRWL3FDUG1vK0VLWHN6SVl5Q2dqaUlxaDRIUlpoWDZtNHJh?=
 =?utf-8?B?K0lML09xR0V5eEowdndtNUNUUk5RenJNNVZUdmNEdEZlYjZCUTRTL1ZMUVg0?=
 =?utf-8?B?dUdETkNCTWk0RWNia0txQmdsa2lkZ2F4dDBkd09IWER0YzZDbWh3QmNhdE1B?=
 =?utf-8?B?WVpvcjVYS2svLzZxdk5qZ1hMSFhQREsyOG9CVFF6WUJaUDJkOEQ4TFh2bnNn?=
 =?utf-8?B?MTBRZmJ5blJQNHg0Sm9HUEpGVm40U3BodFIxZDRSazVjOWx2bElOMWRSRStT?=
 =?utf-8?B?S3JzNDBtUHJWck9EN2F4SGh0VVc1VmlhQUlVSlloQUVXM1hhbFhrTC9TL3Jm?=
 =?utf-8?B?QWdubHhGL1ZiVGhIMElsQVdoMW0wcVNSY28xYzAyVVVUQVRPNU9hMEFzcGdm?=
 =?utf-8?B?VlNWQkxNalhPWTdzZVdUbTRPNGZ1cnhYWlBsUExBakF3SjRtRkFWMFQyMXhW?=
 =?utf-8?B?Y3NEaUhQSnlCcUZEdXNFNUE0UGN5NTBRTHpDOVdFSFBxYnZqcG5qNFpQb0Zy?=
 =?utf-8?B?Q2YwcS90a3FFS1NNWmNNQUdkUzA2MWF1SUlFdlVYb29ET2Z6ZHJlWFFQd2xj?=
 =?utf-8?B?T0J6ZzlEcFlaTmZJQjlxSVd0L2pNc2xVVCs0L3VaMENqK2ppWWRxaGVNQkts?=
 =?utf-8?B?bHNES3pFVkJhNCtDUG1kOE5iMmcyWlkzbDlFTWxrcGtQZjR4R1VkcXZ4WDBY?=
 =?utf-8?B?OTFmdWw0dTdNcDBDend6ZXZWRlhVaFA4MDhad1BhRTd5WVdsQ2lTVVlTT0V3?=
 =?utf-8?B?ajZuUWt4SXFlOW9RTTNRbUJYTjRvWW5yUDg2MTNYdHBINm94amQ0RjdiRnBP?=
 =?utf-8?B?M21NKzR1MURYcUtuOXFtNGNNU2pySm5pZi9YYWI0ZXovRGEvdEVlWlFSNWFa?=
 =?utf-8?B?RjBSQUZ6Q3E0QXQ0dXNhbVlKWHU1RGZBdFlWaC9LTzkvWDVTRHJNQjBpTndW?=
 =?utf-8?B?NTVhUHBVRjA3VmhwOXY3OExZL25YbldwSW5CaU45M0NpN2xBK0hPS3N0MFY4?=
 =?utf-8?B?Wld6cHNXYVBNNTcyK3E4MGxhemVuTUdtaWFOZW5hTFhsWGdiN01jNmxtSlFs?=
 =?utf-8?B?ajFlNXFLU29MZWtTckpCM1Z3WnFkZHlWdUdKdXA4V01jVDY0dDVuWjZUNzBN?=
 =?utf-8?B?M0EzTk1YSHVhM3ZxYzcrVUdQaXhobStZRXU1UkN5QjJ2TW0renVKZWxNcVND?=
 =?utf-8?B?NzZOTGZySzY0MHcyOXFUQnpnN0swbnZReFJUWlhoUEZYOXNpQXFFRXFUeTdm?=
 =?utf-8?B?alV4ZkZ0RE1Kdnc1Z0NoMVRNdzhId2pzbSt0S0J3RWxta1g5Mk1hSXlpSjk0?=
 =?utf-8?B?dE9kRjdkcDlZMjljcUdWUkZrd25GOWExVktqc2tYSTRwcHAvbXFCb0lnbGF3?=
 =?utf-8?B?T29QeEZMYjV2ODBYN2dkV0hMUlpBc1dIcWJSL2UxSkJHakFQYTJTR0xQQkJ2?=
 =?utf-8?B?MnRaR3BVdWJlL2wvbFNkRmxJZ0V3ZzV0L3ArRGRMQkJDcXNjRVJDSk1NUHNn?=
 =?utf-8?B?Qm5jc2hYay8wTTRXcGdGdzM2Z3dCWGFReFcrSUo4S2g0R0J6WjI2ZlhuY3NV?=
 =?utf-8?B?RmNPcXN2MVRkMmtEblBXcVZPZFJXZm1WRklyVzNNdmcvWHNwc0xvNHgwd2F6?=
 =?utf-8?Q?/DbQcalV9BnajcajGqEZo/E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d45c81b8-431d-4bb0-3021-08dceeb8faaf
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 14:35:43.0165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bTACHI/UcrnRZEQLqNwtXQbI5UEe5VsnXuOpKMB1eJCcnaHCm49iQEFzrOtFI111pDPEM93U/GNyV68rOKnG62S7E8h+Xvvah4hlkbvgbDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4642
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



On 17-10-2024 09:10, Shuicheng Lin wrote:
> In some cases, when the driver attempts to read an MMIO register,
> the hardware may return 0xFFFFFFFF. The current force wake path
> code treats this as a valid response, as it only checks the BIT.
> However, 0xFFFFFFFF should be considered an invalid value, indicating
> a potential issue. To address this, we should add a log entry to
> highlight this condition.
> 
> v2 (Matt Brost):
>    - set ret value (-EIO) to kick the error to upper layers
> 
> Suggested-by: Alex Zuo <alex.zuo@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_force_wake.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index a64c14757c84..49ceb16e82e4 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -115,10 +115,15 @@ static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain,
>   			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
>   			     &value, true);
>   	if (ret)
> -		xe_gt_notice(gt, "Force wake domain %d failed to ack %s (%pe) reg[%#x] = %#x\n",
> -			     domain->id, str_wake_sleep(wake), ERR_PTR(ret),
> -			     domain->reg_ack.addr, value);
> -
> +		xe_gt_err(gt, "Force wake domain %d failed to ack %s (%pe) reg[%#x] = %#x\n",
> +			  domain->id, str_wake_sleep(wake), ERR_PTR(ret),
> +			  domain->reg_ack.addr, value);
> +	if (value == ~0) {
> +		xe_gt_err(gt,
> +			  "Force wake domain %d: %s. MMIO unreliable (forcewake register returns 0xFFFFFFFF)!\n",
> +			  domain->id, str_wake_sleep(wake));
> +		ret = -EIO;
> +	}

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


>   	return ret;
>   }
>   

