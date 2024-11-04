Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E97D1BDE0
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 18:47:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2401B10E4B4;
	Mon,  4 Nov 2024 18:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hd8PxNJl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5926610E3FB
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 18:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730746029; x=1762282029;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+xFbpNEAp+Fv7+iB6SX5Fi8hNc2JsQB4fkkXry49ELE=;
 b=hd8PxNJlNPdMNb04TNvz+6hM+V44HlEH4HiyfTuOtwHZB5WPddIPxenD
 NTpNpzbJh6ABiApXhMdXl0k+mak7VeqwNTMAuL6CbDlHSj4u+iU7yEUoB
 t8pR+l7IySaYjqmMKPxChxAYant1Zp44RCzXyMOG7fnDg1aF2IxwthY+q
 KF7cUKOMum3qVir1deQWlXEuvnh4O+rlndW0YOgGuFLtgk11P52TFNKiS
 HBJkb/jFX6Q4/Xjeit41Ki5DGE3//Xd362KbSMwO0yGs5lpbJ96mEnb/j
 nvTpQFtR/6ekyZNBQWszaUQhtfU8dAzwu8WBSDcKPC0esXsYPxNWSP07c Q==;
X-CSE-ConnectionGUID: VthPCwddQEK9Y6bnECI4gw==
X-CSE-MsgGUID: Jsn1ALYfTuKjGDXB2rbwrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41567599"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41567599"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 10:47:09 -0800
X-CSE-ConnectionGUID: hoBZgBy2RUumQlujxehuyA==
X-CSE-MsgGUID: zcHf3psmTuuybhPGiS0hDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="84085965"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 10:47:08 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 10:47:07 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 10:47:07 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 10:47:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZ90344TdvvoOPKfFUWunQzrf9Uwm6KQWV0nXWoKrOQVKZDZ/+gYnVAim+7KJPVWdFJAX7C4RijDCDx2DIZ0dYiOHLS5/V7Xk1Tsw1v/NbE46x3p7Vy/Hcx8EqA2IFVPoldIjkJMqEd+eYKUVL/8gG+tRvAvzTw+wb9k1Eu8OvnYVvO3Kwi64rEVC4Wv3CFx5gkUY432i9/FGmvII16YVLutSe1xDQRtvsUHf3EYQHwOeQJgcTZyilwCLXyx44mpG21h1ucVpWpkHzEdhQeoAnp2Q5jsOW+kk0davZAAAV3ha4P90wfC++xvQZ2fDq3gvFQW0IQEMT+6qTiKgSZQ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TA5qxFkiUWjbV+WGmEpjXuFSbWT4r9Fxhfh2EuK1AwI=;
 b=AUnskDu+BS7hUiuvxpZZkZdnvIOZdtqk98MFNa67lf5xk4AHicRNk+xAVc3g4lXS3xchaT2EezcBWXCFFsZGp9ejQFZUzfwWZvUgg5ZY2RvZcasOR4qTyZpLeuoo346p3IhNJn7EsAubL7YGcSEE6/EwjZHEp+41hgI0fQ+pdiO3nmwkUKQ+1RSPn48i05ARt2GlerA7aIbpWYNVzXVN2EJY/pcn9Dw6WLA+78pRk9FCFzmi36E8Xo5nVtscbhdNRpeNzmgb2dEWqjPiUuHuqh+CTyK/wiqflD6nPhVFSypN+yzlVWfGz8Gqpw4fUXPMRadCPl3J9pnuJTi5YR4aug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by PH7PR11MB8060.namprd11.prod.outlook.com (2603:10b6:510:24f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 18:47:04 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 18:47:04 +0000
Message-ID: <93405f27-bc0e-4c48-97d7-d972bc1ee8e2@intel.com>
Date: Mon, 4 Nov 2024 19:46:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] drm/xe/vf: Document SRIOV VF restore flow
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20241029193956.1043614-1-tomasz.lis@intel.com>
 <20241029193956.1043614-3-tomasz.lis@intel.com>
 <36cdd46a-0105-4a59-b78d-3968be1f43de@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <36cdd46a-0105-4a59-b78d-3968be1f43de@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::24) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|PH7PR11MB8060:EE_
X-MS-Office365-Filtering-Correlation-Id: 358fbb5a-c23a-401d-e830-08dcfd011341
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWdhaDEvNDNKblpxK296RXVpb2FDVEkzNGJnTHN3TDZoUUFRblNmTlBhNWcz?=
 =?utf-8?B?L0FFam9DSm1iTXo4dlA5bmY0cGRXQjUxdHlsSGt2NnZaU0lOakJjdVRXcDFJ?=
 =?utf-8?B?bGcyOEVPdEx0T2NNMzhOK2xJT1FnUTFZRENhbHhJMThFQ0ZxMGk1cjU4T25O?=
 =?utf-8?B?RDJzR3BWWWJ0TVJydkZHS3p6cVBFS1pwNEVVVTBzdzVCYVY1WVFpcnB5ZVk3?=
 =?utf-8?B?cG9EM0JjcmpzaUYzU1dHRFZiaWcxOEtidzJYVHNqVFhaZjl6bGJjZExKNGYr?=
 =?utf-8?B?N0pxSVFiMVZLd1lPVnhHd3RQSnZpMTdVMWluWEUzc29WejNXM2lxTU1OdlFY?=
 =?utf-8?B?T1lyY1NaMnVOYjJQSVdFUHU0ODM2d3N4L053NWhxQXYzVnBMWk1MSVF0SHho?=
 =?utf-8?B?UHBCVktFbFZEZVM0d1dmUDhzdWIyOU1nL29lYXRFVnNSWTc4OXdUZEgyRmND?=
 =?utf-8?B?VGJpVWdwa3pma0ZCZmtScVJSUXJhSGExMWNqZy9xTkVsamdqaGgwNTk5eUZa?=
 =?utf-8?B?d015S1p3d0xWenk5S2JxbmFxSUE3N0I4V2ZrRDN3UGxNWlpGaU1HMEMyUk1F?=
 =?utf-8?B?U1FWLytRVWhMUTRvM0psYU1acjR6N1FlRll5VkJWbURocm4xMWx5aVNVZkJE?=
 =?utf-8?B?UXdudFBkU05pcmc2YmMwMVlKQnorbkNlU3ZwaE1xbDFDTE12Y0d0TWIzOEN6?=
 =?utf-8?B?c2hxMi9Jajlja21sNm9UcWpMQXZWSHQ0cXhGd3BsMGRGdE1pRFZtRnR0REha?=
 =?utf-8?B?Ym04TFhHSmJHUVZtUTBDVi9rT25yOFNRWE44Q0NwTVlySVJVTFM3MGhsU1dY?=
 =?utf-8?B?ZjVucS9sWXRFTDcvWi9tYjVLeXdYUWZIbmUvYzJUTnY1S2NlcmFKT2d4c0hF?=
 =?utf-8?B?dHZSRlRieko4czN0bkc5SEJPQVl1cnAvVVVwL3hRL3dsaHMvTFlxMnN2cW12?=
 =?utf-8?B?Tk9Mc2k3QWFhVFZ2RUNNTlNVTUFXL3FMd0dMamhqbmp0VElaY3ZvR0lsUUI2?=
 =?utf-8?B?MmJYOWUxVWwxVTMydFRJa0NIK2FZVmVCbzBZUUdMS0J2RmlucDBmRk1MUWhF?=
 =?utf-8?B?K2xyK0ozdDN5SzhoS0xHS1dhNUdjYkJrTHh1b1ZrckRPbW1uUjZZS21nemtQ?=
 =?utf-8?B?MEw1MTEwZ2VMR1lDSlBuVUJpOVlkeVROSDFUQzRKQ2t4NVp6QmFvTDFUS3Z2?=
 =?utf-8?B?ZHlQRWl1dS84aFlXQnk4bWp5Y0hndDRjYnhSZ1VLbkdScHFuWDJhWFV1RXFI?=
 =?utf-8?B?M2p5RW82WDRvUkd5YW5wcUE2dUluQ3pFR0tuUkVaYkhMSE9PK0g2bEhHREti?=
 =?utf-8?B?SVpaVnI4NEJpN3hNRElFcWVrVVQzNENuNWpGc0ZoOGJwaHBWQm1lSkhRbjVN?=
 =?utf-8?B?ZVdXcGJuS2VSRjJnTTRJemthcnIySjNXNElpSW5sR1RhSGgyTEJmVmNyalNz?=
 =?utf-8?B?WHhuTVRtQjhidCtrL1FmWnNTYk9rRUlua0RMdDE3TEJ1cndXTlYraUFrV2Nn?=
 =?utf-8?B?Tnl2YVZxR3lCQnl2WWMydXZyamsxdXAxbm8rNlg4TjZPbC9RZFJZMjZDazVU?=
 =?utf-8?B?U0tpa1RjZHBKK1ZiL2V0MFVPL3dvSnVRZExWTmpjUnpNV2ZIVEdmQVNtOU5Z?=
 =?utf-8?B?K0RWRXdUS3dBR0JZbkkrU3ozRE54YlRCS3Rwa1BMWFUvZEdUZGdOVWF2SjlE?=
 =?utf-8?B?TXZMTnpyNFlPWHVvdGtiTDhPTXVKOFR5Y0psemhnN3BqWE5nRW5oS1J5Q0tz?=
 =?utf-8?Q?/gAnTLETUPC+fm0ppGNQOb5+AZDcS3LyFD8DwsR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzRrR3BsdFdWVW54cDQvbzdSYU9RY1Rnenpla0FGMVVHUnlwc2Q4R2d5Q1RU?=
 =?utf-8?B?NnBkQit1ZElZK1FUL0E5VkxRZDEraDAzSXRBV1dOTk5iNTRTa283SEVJWkg0?=
 =?utf-8?B?b2V1RVA3NDhnRU1LTGtuZytOYit3OXN6M3NjVVpoRzdtdGRqSWRoQTdtTnBO?=
 =?utf-8?B?ZHVHckRLZmVCZnBhOFpUdExWKy9PTjZYT3lzb2hHV0VTc3B6NEZJUUhGakM4?=
 =?utf-8?B?QVJxOUdVeE1jVld6U1liRkNwV2RzWEpSaGYvbE5CM3drZisxY2pvYTlTL2VH?=
 =?utf-8?B?NFZMRmU1REVrMnJocVg4dUhFUm56d1VINzhkODYzdHFiL2NTZEZaSjhaelV6?=
 =?utf-8?B?WnN0blhHMnFOYlRUUGh0V1luV2M3VWNMalU4Z1ZHVmRCc0kwMkorOExzL2o0?=
 =?utf-8?B?SG82SUVGVGdZaVpCcCtBb3JldGhhUXpoVXlHbG55K2tQYmc2b2htWFF0Nm9l?=
 =?utf-8?B?NEh5QUhsekVEcjc1OWs0ZW9QdkYzeXh3ZHFaV3ZMN2wzYno1NmdJM3QraUFp?=
 =?utf-8?B?M3FaeXp2elY2QzhqZGhzYjFzOFBBaVZYWDJkNzF6NTRxdVNBWjdUUTgrckxW?=
 =?utf-8?B?a2ZOSWlYcHVVMkUyTzRCWDc3M3lwU2dNeW1SVzl2VXM2VVZYRUZCaFEyZW5T?=
 =?utf-8?B?TEo1c002TWRuY1ZYU0JuamJVSDFvREQvN1U2VTh2cnQveTZ1UUlhZDJrSmNk?=
 =?utf-8?B?Ui9hVnFiZGJLdzJBTHJKbkNYc0xpVjd3NzAxbVkxS1Uzbm9ZRWZHQURqUmNT?=
 =?utf-8?B?bGIxSGsxeVFLZ0JnaHc5cFdTdTVuMWJybUhiREc0WFpBdTl0eGljZlBMQkZJ?=
 =?utf-8?B?QkNRT0hEMFluOFc0K3MrdjNINUtZa2VmR2pySFIrN1ZDbmovNzRzWWlqallq?=
 =?utf-8?B?dUtZSEpyQ3lzVzgzaE1jNXlXYS9sMEVpQjZFd1ViWXpHOHp6dk5WYWtiM2Ny?=
 =?utf-8?B?WUluUExvNG9WWlozTFpIY0p6cHlQUWxFUHRKSis0cjlERWgrMjBUWDZwbzJi?=
 =?utf-8?B?Y2Y2Y2ROR0ppVGpJNDV0eU1RY0ZpNUdUeGM5RFkxa1dKYk9Hc1F4dDltRGl3?=
 =?utf-8?B?Q2dpYnczZ1E2VGtzVjhuSnpIUmtPS3FGZlNNTEFXQkNWSXJ6RStueCtPNWVa?=
 =?utf-8?B?QzZTK2NYS2dmOTZTblduYlRIZUFBTjhKclFhYWdlSVhzeWc4b1lyYk5xUGs1?=
 =?utf-8?B?OHlDSnVLbnIvREFxNmpiMERaVDBQWmEzL2xraE5aUmsvWlgyTitGaU9NdG9i?=
 =?utf-8?B?b2VDT2U5MDNwTmFaOHN0ZkVNeFZhekhRdnI2NXVPUHlvUlZ4STczWmdReDZ2?=
 =?utf-8?B?VDRia1hlTkU5MDYxQlBZd0RvbW5ycWhNZS9qbklFK0xCWUk1eEI1d2JlQk1z?=
 =?utf-8?B?Q0N5YnA3WVMwYlMweUQ2eWFIZFhJN0Y4a0hOOSs5YWE3eUdjS2Q3VWRFcGx3?=
 =?utf-8?B?RDRTNGlzM2swRW1rYzNwdmc0WlNIYXNnTFpTSVdaSzdZUWQ0d1RvZlVEZGtG?=
 =?utf-8?B?c0NPU2N5dlBBM3dZUDN6Z2xlNVZmcWVuVjFhb2QzSWh4bVUzb3ppUWc1WExH?=
 =?utf-8?B?ZVBSbkF3aXF4cTRHM3RQWGdKc2JXSzgwQnlrT21NZTVER29GWkhpdW5lQVpC?=
 =?utf-8?B?eElIQllPVlJGakYvOFdXQ0lLNlJndmcwcXhYTWRrQmMvOWNSd0V5cHB0YU5M?=
 =?utf-8?B?VlZKTzREM1Z5REVlbUY3bkhhc29SNmVPYUx3UUM3VXAreU1nOUs5L045ZmI0?=
 =?utf-8?B?bFVjUkVLNDRlaHpiTWJxYnk2YmtTVmMySWc3bHAxVjBSelIrZzZSS0tUN3Az?=
 =?utf-8?B?MFoxdmZsN1RaSVNlT3oyNlM0TFVtNENtVnVtMkhVem91cjZYUjNkTHQ0Nnp2?=
 =?utf-8?B?U0p5QlhZT2tsajB6Z1ROVDVSSW0wcGNqaEJmM0dOaHp6ZjExQ3h3dGdjV3dC?=
 =?utf-8?B?ZWlJK2VKRlBKaW5NdDNsSTJvZENWejlnR3Nkbm1MZlBYN3FIVVhYVlpXRm5u?=
 =?utf-8?B?TkJad0pHc3A3Y0pWTzMrbG5UcVZsYkdOMDl3ZTBJMDBPcjZvY1VIczU2bFFz?=
 =?utf-8?B?RjNjZG13LzRlWGVrRTFKMzZHRjllWGVNYXc1WGZJZFlaWkRGQzI1djdQMWRv?=
 =?utf-8?Q?pnLkIBAyGZNW0Lymt1Ql93ZTk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 358fbb5a-c23a-401d-e830-08dcfd011341
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 18:47:04.2442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ZjoCJwvRbWna9AHxsI8Erh5Ijn51gdm1SnaMPNNgpGsVVI1C6mG4vK4+mdjUVSoDRNb+rlqC+Kx8Y+yS3+LKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8060
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


On 03.11.2024 22:21, Michal Wajdeczko wrote:
>
> On 29.10.2024 20:39, Tomasz Lis wrote:
>> This adds a documentation chapter, containing high level flow
>> of VF restore procedure.
>>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_sriov_vf.h | 93 ++++++++++++++++++++++++++++++++
>>   1 file changed, 93 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
>> index 7b8622cff2b7..22683dd643f8 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
>> @@ -8,6 +8,99 @@
>>   
>>   struct xe_device;
>>   
>> +/**
>> + * DOC: VF restore procedure in PF KMD and VF KMD
>> + *
>> + * Restoring previously saved state of a VF is one of core features of
>> + * SR-IOV. All major VM Management applications allow saving and restoring
>> + * the VM state, and doing that to a VM which uses SRIOV VF as one of
>> + * the accessible devices requires support from KMD on both PF and VF side.
>> + * VMM initiates all required operations through VFIO module, which then
>> + * translates them into PF KMD calls. This description will focus on these
>> + * calls, leaving out the module which initiates these steps (VFIO).
>> + *
>> + * In order to start the restore procedure, GuC needs to keep the VF in
>> + * proper state. The PF driver can ensure VF entered this state by
>> + * performing Function Level Reset on said VF. The FLR procedure ends with
>> + * GuC sending message `GUC_PF_NOTIFY_VF_FLR_DONE`, and then the actual
>> + * restore can begin.
> hmm, I would do some rewording here, as it's not that VF_FLR_DONE
> message is a prerequisite for the restore flow, it's that VF must be in
> VF_READY state, which will be once the VF is successfully provisioned.
>
> The FLR is required only if the VF was previously used.
Will do. Though for what I understand, creation of a VF includes a FLR 
as well.
>
>> + *
>> + * During VF Restore, state of several resources is restored. These may
>> + * include local memory content (system memory is restored by VMM itself),
>> + * values of MMIO registers, stateless compression metadata and others.
>> + * The final resource which also needs restoring is state of the VF
>> + * submission maintained within GuC. For that, `GUC_PF_OPCODE_VF_RESTORE`
>> + * message is used, with reference to the state blob to be consumed by
>> + * GuC.
>> + *
>> + * Next, when VFIO is asked to set the VM into running state, the PF driver
>> + * sends `GUC_PF_TRIGGER_VF_RESUME` to GuC. When sent after restore, this
>> + * changes VF state within GuC to `VF_RESFIX_BLOCKED` rather than the
>> + * usual `VF_RUNNING`. At this point GuC triggers an interrupt to inform
>> + * the VF KMD within the VM that it was migrated.
>> + *
>> + * As soon as Virtual GPU of the VM starts, the VF driver within receives
>> + * the MIGRATED interrupt and schedules post-migration recovery worker.
>> + * That worker queries GuC for new provisioning (using MMIO communication),
>> + * and applies fixups to any non-virtualized resources used by the VF.
>> + *
>> + * When the VF driver is ready to continue operation on the newly connected
>> + * hardware, it sends `VF2GUC_NOTIFY_RESFIX_DONE` which causes it to
>> + * enter the long awaited `VF_RUNNING` state, and therefore start handling
>> + * CTB messages and scheduling workloads from the VF::
>> + *
> nit: maybe this would look little nicer with leading lines like:

no, it's not a matter of nice look. The lines start thin if the 
component does not currently participate in the execution.

Since it's not a proper diagram and just simplified ASCII art, we do not 
start the flow correctly with an actor initiating everything. So 
starting the lines thin would misrepresent the flow.

>
>> + *      PF                             GuC                              VF
>             |                               |
>> + *     [ ]                             [ ]                              |
>> + *     [ ] GUC_PF_NOTIFY_VF_FLR_DONE   [ ]                              |
> nit: this label should be aligned to the right, closer to GuC
this is a "return" label. These labels are bound to the position of arrow.
>
>> + *     [ ] <---------------------------[ ]                              |
> but IMO the whole diagram should start here, as it's about the restore
> flow, not the FLR flow (which is just a prerequisite, like a VF
> re-provisioning, that also must happen before the restore)
>
> if you really want to include prerequisite steps in diagram then maybe
> do it like this:
>
>            PF                             GuC
>             |                               |
>            [ ] VF provisioning/FLR          |
>            [ ] --------------------------> [ ]
>            [ ]                             [ ]--- VF_READY
>            [ ]                             [ ]<---|
>             |                               |

This is not ok because provisioning would need return arrow, it's not a 
one-way notify.

Will just delete.

>
>
>> + *     [ ]                              |                               |
>> + *     [ ] PF loads resources from the  |                               |
>> + *     [ ]------- saved image supplied  |                               |
>> + *     [ ]      |                       |                               |
>> + *     [ ] <-----                       |                               |
>> + *     [ ]                              |                               |
>> + *     [ ] GUC_PF_OPCODE_VF_RESTORE     |                               |
>> + *     [ ]---------------------------> [ ]                              |
>> + *     [ ]                             [ ]  GuC loads contexts and CTB  |
>> + *     [ ]                             [ ]------- state from image      |
> maybe also say that GuC moves VF to VF_RESFIX_PAUSED state?

The documentation is to explain kernel workings, not GuC states. So I 
don't really like putting all the GuC states here, especially because 
KMD doesn't even track all of them.

..But it does make sense at this point, especially because I will have 
to add VF_READY_PAUSED as well. So, will add.

>
>> + *     [ ]                             [ ]      |                       |
>> + *     [ ] success                     [ ] <-----                       |
>> + *     [ ] <---------------------------[ ]                              |
>> + *     [ ]                              |                               |
>> + *     [ ] GUC_PF_TRIGGER_VF_RESUME     |                               |
>> + *     [ ]---------------------------> [ ]                              |
>> + *     [ ]                             [ ]  GuC sets new VF state to    |
>> + *     [ ]                             [ ]------- VF_RESFIX_BLOCKED     |
>> + *     [ ]                             [ ]      |                       |
>> + *     [ ]                             [ ] <-----                       |
>> + *     [ ]                             [ ]                              |
>> + *     [ ]                             [ ] GUC_INTR_SW_INT_0            |
>> + *     [ ] success                     [ ]---------------------------> [ ]
>> + *     [ ] <---------------------------[ ]                             [ ]
>> + *      |                               |      VF2GUC_QUERY_SINGLE_KLV [ ]
>> + *      |                              [ ] <---------------------------[ ]
>> + *      |                              [ ]                             [ ]
>> + *      |                              [ ]        new VF provisioning  [ ]
>> + *      |                              [ ]---------------------------> [ ]
>> + *      |                               |                              [ ]
>> + *      |                               |       VF driver applies post [ ]
>> + *      |                               |      migration fixups -------[ ]
>> + *      |                               |                       |      [ ]
>> + *      |                               |                       -----> [ ]
>> + *      |                               |                              [ ]
>> + *      |                               |    VF2GUC_NOTIFY_RESFIX_DONE [ ]
>> + *      |                              [ ] <---------------------------[ ]
>> + *      |                              [ ]                             [ ]
>> + *      |                              [ ]  GuC sets new VF state to   [ ]
>> + *      |                              [ ]------- VF_READY             [ ]
> this should say VF_RUNNING state

ack

-Tomasz

>> + *      |                              [ ]      |                      [ ]
>> + *      |                              [ ] <-----                      [ ]
>> + *      |                              [ ]                     success [ ]
>> + *      |                              [ ]---------------------------> [ ]
>> + *      |                               |                               |
>> + *      |                               |                               |
>> + */
>> +
>>   void xe_sriov_vf_init_early(struct xe_device *xe);
>>   void xe_sriov_vf_start_migration_recovery(struct xe_device *xe);
>>   
