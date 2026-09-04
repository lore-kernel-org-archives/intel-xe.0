Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD977C79F82
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 18:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E77810E1FD;
	Fri,  4 Sep 2026 18:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F/TAAfxe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D5F10E1FD
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 18:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788545918; x=1820081918;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xMRTL8hdhRVAHQrFXe6BthijzxvTry1g3Q+siAXis40=;
 b=F/TAAfxead4uR/M01PnlapWSMnk4q6IWOvPApbVe+nTMBvgucOvah+SQ
 /5v9tjFIZbHrlXB7JLKwT5DLRTEY+rFpdP3Ye4dkXeyZ2yQVfmY2PLKCr
 3tYf1FaERRofxAVZpB5/9GHfiHBC7ybAX5VZZVHWRa3zXY0PVyD9Mww42
 DFMFKVTk2AN8fMZC4bGL4VRI+Cg8/b8E7OfXOjmexag6BgvW8kyKDyXQX
 kadb86ETDVLWqK2okruMD/08Lmfk7yrhqUy+ltBOcvCMsbv7HHLh/AyEO
 TtlbuPBvj4y1N0rWMmwhJ6BKR72INUpwL5/RcKE+bGgfjwSZaDHjrQ7vo A==;
X-CSE-ConnectionGUID: vpcIOwaFRQqVprtGeAktCA==
X-CSE-MsgGUID: S6PWGy4ARuCDLTlRrsBRWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="99386050"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="99386050"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 11:18:38 -0700
X-CSE-ConnectionGUID: Ikp2dQFnQ2SNU3Kq4d5PwQ==
X-CSE-MsgGUID: ridPR7LsTSaNkFdKY+NGnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="268805339"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 11:18:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 11:18:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 11:18:37 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.23) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 11:18:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tS9TcLvgpwkrMp8BvNcAsJBd8GcAWCrb0Lx+U5C0JouSPncinDye9A0kJCXVmO008yE1PPDmc/2aYMNHdUESp1GWGQe/ryGEnDMLZtS4pRcP0XInacAa1tXG/8jZDfJeBjIFh3Pjy3HVwh5zv5Q2DwliPydlMUIMTnJVr4SEmIX57tV9yRCFtOkVY8rUsymDGKQSrPCuRanJbACBHzAHeASvxTKGmdjLEr564EAd6n7MTVeZxs5twiY6+fbBdG0k8IgW4GjFE08FenSqh6lG7ru3GXm4YFDSauWV3AfEEqivdCsmCj2Fh+Y6c86vlLhz6U77KlUWtvrMMSHBCZTxSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJjZtEnVR83lDOxGoBLEa/Y6YoKyy72uypb0f/bnnc8=;
 b=NNVB4TOgiI3vySzGtkVwbh7pC95DMjOxjJ5s26mpO9blCOnWzL6D/oxg8IwmWSr5gsw4VxZfUhkK5ivQO2EQI6gaXFTqmJ5+MvaQvXIN/M3s8+NEHJZnMdohAHUtG/erjpBqmMZWgx38QkCMr5Qb4INSXn6eCeKIYuYPdfMNLn06pj+Cv5n/q9+SlRuwUyW9+uJO+jTGOcUk6WPcxUd9I73Dt22+7j76PqQInfIDYitYqR+dVXZ9tGpdG23TxjHYaeTna2cgEc0zDIdA5FL90I8VdefInWFRns3HQokJO+AqqVT65CfI2azyZLX/HhOQtdMiRHh87fCjan0fze0rRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LVTPR11MB9911.namprd11.prod.outlook.com (2603:10b6:408:3c6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 18:18:35 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 18:18:35 +0000
Date: Fri, 4 Sep 2026 11:18:32 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v8 1/2] drm/xe/sysctrl: Add helper to query application
 status
Message-ID: <apsLeB/gQdk75ZqW@soc-5CG1426VCC.clients.intel.com>
References: <20260904134935.674507-4-anoop.c.vijay@intel.com>
 <20260904134935.674507-5-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260904134935.674507-5-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4PR03CA0064.namprd03.prod.outlook.com
 (2603:10b6:303:b6::9) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LVTPR11MB9911:EE_
X-MS-Office365-Filtering-Correlation-Id: fa1305a1-02ab-49e2-1b03-08df0ab0ef08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|4143699003|6133799003|5023799004|11063799006|22082099003|18002099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: Li6H1YuZ7l6osTZzstwDnqyrqQTT92Mqc1TPWKHfmT7sZqqJ+TD4dWqFAtxrEfqpKgShOkcULztNFDGTGg0WkdmUbPDaPChA57BwezECEk1zMWcZAMmVIptF5LqrPSSrFwOirz04AYHB9DGCYsGIUXuiYEkN4cJ9peGfLM4Vr1fgUVL+wb4xbMOdmVNDOqEkj25mtQhRKX5Ki4L+sT3IikqsGfsrIhTU5SR8AOblAEmaqcblWvv3hKC9h9htPkkdYWB6RdPRjXqZJypVesYA3IwFgzEnbWvtEY8NckZ/btSS9XmqGz48fmpi47k8ewzTmsNh2CQp4QVhx8QWrsjpevQO+C8G3rBljiJogTson7PaeO6CG8/lQs3OibF/LiwuqCRYiG0VYOIITcQUD1idtigXRfFzvRiWR64vTm7SRVXLkJtoiLEATD1kW6MRjGTOOBC42UletbGjND3Z1iYwscBpz3nHD8qPvebV9r5Dq4ze9GGX3S+HFOyajWFuXFvfOPiTQxv3VYlodWMdcwNT4a1XASBbG+BUa4Z7XwSoaa7QxWmiCBDUWiHpBpE9SVI2dGPIEXINn34SebeVmdxNBWJYUpiwvJl4TCu5UhcZdgI65BqiBnpNkvYVBCLCODqtsRhZQxzgOGR/8WUGgoRMkElUCtHlzugAWy3DzFz+eM8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(4143699003)(6133799003)(5023799004)(11063799006)(22082099003)(18002099003)(56012099006)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlhtOXZZamhnVzlld2VjaGRGREllTGNIcHdmRTZtQWh1cU9VTW9vSzJKSm5X?=
 =?utf-8?B?NHRBQjB2WGdMem5hUDVDZjFzbTJVK1VEbFd5VG9WeTRFTE95VTRtYW95NnZq?=
 =?utf-8?B?bE5HTmRqQ1FUYjB6OHJJY3pMV3VQcS9SbEEvYzBlTjQyd29JMmkybWZMaVZU?=
 =?utf-8?B?YlMxU0NzNG1hT1NDTU45M3UyZUM4cjBoZ29qcnhsdE91ZlRBRDN3OHFZQlB0?=
 =?utf-8?B?aGprZDcrMXVhZzQrV25VMFN5M3p6dlI3R2Z4WWI0SUYxeVk0am9WVmUwcFU3?=
 =?utf-8?B?eTVFTDR1THFPL0hTVTNCZGI4S1VxeDZSODRkSUgzRktQQjBjWVhiNStBYmNL?=
 =?utf-8?B?bjJkUG5ZOEFnaVBtNFFITElaUDZ3STVsMUtmYW1aMHVzZ2htVTVrSWZ2QjE5?=
 =?utf-8?B?SVJJbm1jeHV4WDBJclk3SlE3bk5pQkhRdk1RQWg5UHVweGpyZHV3Tk9CVVRW?=
 =?utf-8?B?Zkp4YThVNkt4Und4YUs5cnZzdk9uK09jNHhabldFVVJ5RitRb1hZalNBUmlG?=
 =?utf-8?B?bGlrL0pkSDR2b0sxOWkwV2l0LzdFVENxalhoRmllZDlMUm9SaGpwZG92ejVW?=
 =?utf-8?B?ak1lSVpWa2Ivd0hpaDFabk1MQ21PVUpucnNwSmFkU1QvMVkzZEJYTTFTNUE4?=
 =?utf-8?B?MVE0MGE0UG1tLzE2U0NNRlV2bkUxNTdjWENQekxFYVJQdFFMZTdZSzBIVjlB?=
 =?utf-8?B?eGE5K2dyL0JJdk1NSTgxbW1hVTE5cUxPYlQvY2VydzZHUVhud0VFMU9CNnZC?=
 =?utf-8?B?RForNEV2TmNlQ2c0NHQreDAzUXhZT29UcWJmb2ZjNmZtQU9CKzNkWkpQdlhL?=
 =?utf-8?B?TnNMakVzNlBlRjRvVEVsL2RSek53YTFkK0VjcVlITmY4eFZqdWxZcTdoWVk0?=
 =?utf-8?B?UnJ6SGNQUWdpZXFETWxpRWYydU1Ec1FHVmpFcHNBcFl1QTlWN2w1NDdRcCtl?=
 =?utf-8?B?MnVQTXpWME5FanZtM0JLb3E5cUtYWkQzbzhxa1BPWUtJM1UvbTd6UUVYTk82?=
 =?utf-8?B?aXNWRWNHNnpQTS9TMzR2WGV0SHlzMkVtY1pVblFUMW1KdVRES3duM2xrZ2Nh?=
 =?utf-8?B?c1J0ano4V3drTUVTcWNJamdCNDI4eks2bkRYTk1KMVNDT0RjTjVGK0hxQ2s5?=
 =?utf-8?B?eUFBUVZDWElIaWRrSnFwSFhSTzBLSUErRm9CczR3cXVKdmpuQ3lBUU9aRXlh?=
 =?utf-8?B?TlhwUm9CV1lBTnJOTkJTZlV5c2VDUVl1eUdaNlpobkU5YjJuYUVFWE1XYW9u?=
 =?utf-8?B?aHhKc1U2SkVKSkZuTkVxbjEzc2V5TVRTMmRBYVgwR0pxbUtsQW0wM0I3NXN6?=
 =?utf-8?B?VFR5VCtzVlRvOW9qU1FzVWcyOElYMThpZnBJVzZWU2p5RHgrMUZibkNDdXN0?=
 =?utf-8?B?VHJDdkd1WEtHV0xjcklkWWlZVGRwbUszdE5IQkZEL0ZzWlVuUE5hUk54RzIx?=
 =?utf-8?B?cWp1R3kyelRBSVBTVFhQRXplR3VzNHFzTndBa2JFR2owV2ptVEY1NDhrRUlY?=
 =?utf-8?B?QlluSWtaV3p6YkQ1eDdvQVppekkvMVZ1ejU3NVcvcnJiUE02cU5adjJrK2FY?=
 =?utf-8?B?bFF6NWd1ejFCOU13RUVKdC81bzVURjB5SkVJc3prR0F0a1V6QmlKZWZhSGh0?=
 =?utf-8?B?TTFzaU0wU0QzSytIOFYxTDU0R1BOQnd3YWR1cmg3aGZjZjlXZUhpL1A2U0h5?=
 =?utf-8?B?dWQrUTNVZll3WnRlbytqTVZnRU81ZTg1c2N4c1BaK0VzbUc4UW1RZnRIa2Zm?=
 =?utf-8?B?alFjVzdQQ1kwZ0kybTJxQ3gyYjhwN01tR09teElyV1RyaVhTay9Dc2N5Nlc5?=
 =?utf-8?B?LzVsWXpmWFU4eDhVZHdWbWxRVThBOXVhWlpYemdjbER1UWpxOGtTcEhZcWFT?=
 =?utf-8?B?Ymx4ZHR4MXQ3MUp0aUp1d0lCaTN3Y0QzTGNtLy9UWDVmQXhqYUZnYTEzRE9D?=
 =?utf-8?B?cVdvQ2Qxa1BUVm5kenB1Mmkxb3Y5VnVTSWhUMjhLSTY4VThOaUZPcndVd3Fo?=
 =?utf-8?B?VlRUakk0R1NoOTlKMGNkU2QzbWpqSThYSG96WlYrVDBXMkovbUk3K3FmQXpF?=
 =?utf-8?B?Y3hCRGlWbUFvZDJJUWViVU4rZURJdkd1ejQ2M1NORk1md2w5TzFldnE5YzN3?=
 =?utf-8?B?anU1Zm1xVU1JTnhGUTlteFZ6a3dRUERKWWQ1MXZZRUM3NXN4WXdtbUZlditK?=
 =?utf-8?B?aGVDbzkwSUk3K25CWFZKK1BielppN3p1TWNBUDVuZ2dYdEY4S1lBZjh5citq?=
 =?utf-8?B?Zmppak5RclQ5UHoyRk85V1hVa1V5TWRKam0ra0VXSlJEbWJ6RFUwZzJ6dFoy?=
 =?utf-8?B?Z3BoOG9aRTJDVFlTK2FybFlTcWFWM2RaeUZpTVMwZzl3dEVtNllrWnBNaVlV?=
 =?utf-8?Q?d9YICrVkotpS+O+I=3D?=
X-Exchange-RoutingPolicyChecked: PojU4zYaQ8BY5CHWAmPI3w4MPMUJiOy/KD6XwkqN5XuE2Rx6mDAYMBIC8vpc9X4o80x3cBXd1Ezz6UUuy9ttugg5xoXkG/Ty7+qcwlvn2wKi89Mu39rULHD+QfmwIoKM0kZRClP7ToGwcaQcvmUDYSjpxeEWMSwr/V+oeT753hPS6EyECQUX4wTI1ghG738G0nrq5xxXcjawkqtStMyiU7+S6qcHt/UQgZdS0tDFlCzDKso2h5rCX8mPAcybmJ8tpBIW8goF+mofw9ab5/5FtEjcpuMYlDLbzD8+lsmu9ln6ZWF/MnjOMHoXXgDylIgpvkvsLV9WnzWI2PueKJqT6Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1305a1-02ab-49e2-1b03-08df0ab0ef08
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 18:18:35.3072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MGG7d4j6Ul5zQ0QzwDqmNO0xTsFZgswaohvKK+pIdh9Fvcl2roLrm6aHHaa8jxpd1KNveyLdqY3L/Hv9SpD0CqJeofTpESmBNefYPO5Xihk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVTPR11MB9911
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

On Fri, Sep 04, 2026 at 06:49:36AM -0700, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add xe_sysctrl_check_app_status() to query the state of a System
>Controller application using get_app_status_by_id mailbox command.
>
>The helper maps xe_sysctrl_app_id values to firmware application
>IDs and returns the reported application state. Add a convenience
>wrapper to check diag firmware application readiness.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
>v2: (Badal)
>- Return SysCtrl firmware application states instead of errno for
>  application lifecycle conditions
>
>v3: (Riana, Badal)
>- Replace string-based app identifiers with enum xe_sysctrl_app_id
>- Use get_app_status_by_id (opcode 0x05)
>- Move mailbox definitions to xe_sysctrl_mailbox_types.h
>- Return enum xe_sysctrl_fw_status consistently
>- Map communication failures to COMM_FAILURE
>- Add INITIALIZED state and status helpers
>- Fix Diagnostics typo
>
>v4: (Anshuman)
>- Make xe_sysctrl_check_app_status() internal
>- Remove unused app identifier
>
>v5: (Anshuman)
>- Rename OOBMSM status helper to use xe_sysctrl_* prefix
>- Remove xe_is_diag_fw_ready() helper
>
>v6: (Riana)
>- Use xe_sysctrl_create_command() helper instead of manual FIELD_PREP
>  header packing
>- Rename xe_sysctrl_get_app_status_by_id_{req,resp} to shorter names
>- Use hex constant for application ID
>- Move oCode application readiness helper to a separate patch
>- Add xe_sysctrl_is_diag_fw_ready() helper.
>
>v7: (Umesh)
>- Clarify xe_sysctrl_is_diag_fw_ready() comment for sysctrl-less platforms
>- Move XE_SYSCTRL_APP_RESP_* flags and enum xe_sysctrl_app_id to xe_sysctrl.c
>
>v8: (Umesh, Rodrigo, Mike)
>- Drop XE_SYSCTRL_FIRMWARE_APP_NOTSUPP handling
>- Simplify diag readiness helpers to a single
>  XE_SYSCTRL_FIRMWARE_APP_INITIALIZED check
>---
> drivers/gpu/drm/xe/xe_sysctrl.c               | 73 +++++++++++++++++++
> drivers/gpu/drm/xe/xe_sysctrl.h               |  1 +
> drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 45 ++++++++++++
> 3 files changed, 119 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
>index 62ccc9be71b4..3b7fa2c9c333 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl.c
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>@@ -13,9 +13,11 @@
> #include "xe_device.h"
> #include "xe_mmio.h"
> #include "xe_pm.h"
>+#include "xe_printk.h"
> #include "xe_soc_remapper.h"
> #include "xe_sysctrl.h"
> #include "xe_sysctrl_mailbox.h"
>+#include "xe_sysctrl_mailbox_types.h"
> #include "xe_sysctrl_types.h"
>
> /**
>@@ -29,6 +31,20 @@
>  * This module provides initialization and support code for interacting
>  * with System Controller through the mailbox interface.
>  */
>+
>+/* Application status flags reported in xe_sysctrl_app_status_resp.flags */
>+#define XE_SYSCTRL_APP_RESP_VALID		BIT(0)
>+#define XE_SYSCTRL_APP_RESP_BOOTED		BIT(1)
>+#define XE_SYSCTRL_APP_RESP_INITIALIZED	BIT(2)
>+
>+/*
>+ * Known System Controller application identifiers, keyed by firmware
>+ * application ID.
>+ */
>+enum xe_sysctrl_app_id {
>+	XE_SYSCTRL_APP_DIAG	= 0x0D,
>+};
>+
> static void sysctrl_fini(void *arg)
> {
> 	struct xe_device *xe = arg;
>@@ -125,3 +141,60 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
>
> 	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
> }
>+
>+static enum xe_sysctrl_fw_status
>+xe_sysctrl_check_app_status(struct xe_device *xe, enum xe_sysctrl_app_id app_id)
>+{
>+	struct xe_sysctrl_app_status_req req = {};
>+	struct xe_sysctrl_app_status_resp resp = {};
>+	struct xe_sysctrl_mailbox_command cmd = {};
>+	size_t out_len = 0;
>+	u32 flags;
>+	int ret;
>+
>+	req.app_id = (u8)app_id;
>+
>+	xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_CORE, XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID,
>+				  &req, sizeof(req), &resp, sizeof(resp));
>+
>+	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
>+	if (ret)
>+		return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
>+
>+	if (out_len != sizeof(resp)) {
>+		xe_err(xe, "sysctrl: unexpected get app status response length %zu (expected %zu)\n",
>+		       out_len, sizeof(resp));
>+		return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
>+	}
>+
>+	flags = resp.flags;
>+
>+	if (!(flags & XE_SYSCTRL_APP_RESP_VALID))
>+		return XE_SYSCTRL_FIRMWARE_APP_INVALID;
>+
>+	if (!(flags & XE_SYSCTRL_APP_RESP_BOOTED))
>+		return XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED;
>+
>+	if (!(flags & XE_SYSCTRL_APP_RESP_INITIALIZED))
>+		return XE_SYSCTRL_FIRMWARE_APP_BOOTED;
>+
>+	return XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
>+}
>+
>+/**
>+ * xe_sysctrl_is_diag_fw_ready() - Check if diag firmware is fully initialized
>+ * @xe: xe device instance
>+ *
>+ * Returns true if diag firmware has reached the initialized state, indicating
>+ * it is ready to handle requests.
>+ *
>+ * Callers must only invoke this on platforms where System Controller is
>+ * present (xe->info.has_sysctrl).
>+ *
>+ * Return: true if diag firmware is initialized, false otherwise
>+ */
>+bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe)
>+{
>+	return xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_DIAG) ==
>+	       XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
>index 090dffb6d55f..8dc576796890 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl.h
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>@@ -20,5 +20,6 @@ void xe_sysctrl_event(struct xe_sysctrl *sc);
> int xe_sysctrl_init(struct xe_device *xe);
> void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
> void xe_sysctrl_pm_resume(struct xe_device *xe);
>+bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe);
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>index 66e7cbcc3f91..c236e5377f30 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>@@ -14,9 +14,11 @@
>  * enum xe_sysctrl_group - System Controller command groups
>  *
>  * @XE_SYSCTRL_GROUP_GFSP: GFSP group
>+ * @XE_SYSCTRL_GROUP_CORE: Core group
>  */
> enum xe_sysctrl_group {
> 	XE_SYSCTRL_GROUP_GFSP			= 0x01,
>+	XE_SYSCTRL_GROUP_CORE			= 0xFF,
> };
>
> /**
>@@ -42,6 +44,49 @@ enum xe_sysctrl_gfsp_cmd {
> 	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
> };
>
>+/**
>+ * enum xe_sysctrl_core_cmd - Commands supported by Core group
>+ *
>+ * @XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID: Retrieve application status by ID
>+ */
>+enum xe_sysctrl_core_cmd {
>+	XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID		= 0x05,
>+};
>+
>+/**
>+ * struct xe_sysctrl_app_status_req - Get application status request
>+ *
>+ * @app_id: Application ID for which to retrieve status
>+ */
>+struct xe_sysctrl_app_status_req {
>+	u8 app_id;
>+} __packed;
>+
>+/**
>+ * struct xe_sysctrl_app_status_resp - Get application status response
>+ * @flags: Application status flags interpreted by xe_sysctrl_check_app_status()
>+ */
>+struct xe_sysctrl_app_status_resp {
>+	u32 flags;
>+} __packed;
>+
>+/**
>+ * enum xe_sysctrl_fw_status - System Controller firmware application lifecycle states
>+ *
>+ * @XE_SYSCTRL_FIRMWARE_APP_INVALID: app_id is not recognized by firmware
>+ * @XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED: application is known but has not yet booted
>+ * @XE_SYSCTRL_FIRMWARE_APP_BOOTED: boot sequence completed, post-boot init pending
>+ * @XE_SYSCTRL_FIRMWARE_APP_INITIALIZED: application fully operational
>+ * @XE_SYSCTRL_FIRMWARE_COMM_FAILURE: communication with System Controller firmware failed
>+ */
>+enum xe_sysctrl_fw_status {
>+	XE_SYSCTRL_FIRMWARE_APP_INVALID,
>+	XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED,
>+	XE_SYSCTRL_FIRMWARE_APP_BOOTED,
>+	XE_SYSCTRL_FIRMWARE_APP_INITIALIZED,
>+	XE_SYSCTRL_FIRMWARE_COMM_FAILURE,
>+};
>+
> /**
>  * struct xe_sysctrl_mailbox_command - System Controller mailbox command
>  */
>-- 
>2.43.0
>
