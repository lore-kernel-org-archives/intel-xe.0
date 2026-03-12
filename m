Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5233EFED2CC
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 05:14:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1143310E960;
	Thu, 12 Mar 2026 05:14:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fBczpmAA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0BD10E960
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Mar 2026 05:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773292452; x=1804828452;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vQ+GkqLvwSycOlba94Amj1CU16+q7RV8UUYdhj5VdyU=;
 b=fBczpmAABYns/JdNCJ8httgw2aGE3Q1aaCoDbw5jOjaEA9q2SBWdsiiJ
 K9Ht1ZAGK35UKiYltjdlR+JIKvtVCoVhSsd9Bj5e3MVrMPxASMA01uizw
 8aUwJQsjMB6wgBWUpwX9hAXdb4/MDF4lsAnGSY410vVgJtex1rg6q3y4T
 X5wJKtw1NEJrqzQ5EQvYf+2TbP87Djf5e78onFHoRMXhZBY+jizWFQjV+
 OLymruDb2rLYQYGt2Ceol3zHrim41ylVl5Sxi7hoiftjc3ZyuieKQ+HQt
 dZDMqiX7wGvb2f+01ZeXyrFFc+tbWnqkYHJOX8mMLi2bplbEr81hz2k8Y g==;
X-CSE-ConnectionGUID: vyRpor4OSEasYJJEF6OWdg==
X-CSE-MsgGUID: VydEtk9SSvC56GVhO3K8PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="77979839"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="77979839"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 22:14:11 -0700
X-CSE-ConnectionGUID: 2JmjIrYUT4Kq7/T6ct86Iw==
X-CSE-MsgGUID: 8j0EdAlwQ5mQvULc1hItdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="220755870"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 22:14:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 22:14:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 22:14:11 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.31) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 22:14:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYkn1wXnZT+0Nm2o/YH4TBsbyWL028rMaJn1UGW+pH5ABTKaGsP4cV3H0j7mBmfvHaOeUiOU1CNM4G8HoMrFPTY6TpJZuMcc6qHoT2AmZk65ObVxkETwbOdB2ydKnDI/SS/R6JAMJxiXXk946qvNR+9uOEDz7OdjFgf5iZ8vzEkglzxPtZvrPDp93awE7HjdTHm7yKm2c6eEdLqSRettTJ7ejuRez5jU6QyU16mKhkxvHyZtfBLaV7GjiiOM1qObWry5onWNYWDxH6O6QVO4RyKpPwqqxnMAywbJnwMjYblUOHT8X8DfyiKvxsJcv8KHPo20PjpluGkE7pRq4CBklA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+YysUEmLPOHcAUqYOhhV7fEFRsfyaqIa8ZQNmEqH+c=;
 b=C443AzPTOSkUHAdkS/qVOZDWsNvEJ+U6RgvEI8DybC/8L1Fx1n1U2BRzwxWcP95gZMGS70N60m0LLpAJ45gC/dEZ9+V8Mzsv56JDzkPJLtHKAD9U7DZoH7wz3j+AQISG7qwJHpGWWOxKWC1GbuGGNXlBcMS/VYwnOXDbkUECgHPwZlGdqGzi8QKc3ELKcnzm6UcCKiDav8vbzj3hMy5rjEWOxE5eu/1xtSuAv9ZQ4jHBMEssEnfgHvPC8ddP/J1c7JyzPY1VC8dbfwI1ao1OP0LsI1IWDh/JxUPoOuYkZfAYOCdEpGGF99C1U6Hmcq3zpuhmRuME5RbLG9OBgf704g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by SA3PR11MB7655.namprd11.prod.outlook.com (2603:10b6:806:307::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.3; Thu, 12 Mar
 2026 05:14:01 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::6021:79ca:45d2:ae46]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::6021:79ca:45d2:ae46%4]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 05:14:01 +0000
Message-ID: <1fb27f15-0cdc-4157-99fa-a0ed88a30f17@intel.com>
Date: Thu, 12 Mar 2026 10:43:52 +0530
User-Agent: Mozilla Thunderbird
From: Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH v9 5/6] drm/xe/sysctrl: Add mailbox communication
 implementation
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>
CC: <umesh.nerlige.ramappa@intel.com>, <badal.nilawar@intel.com>,
 <aravind.iddamsetty@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20260310182336.611041-8-anoop.c.vijay@intel.com>
 <20260310182336.611041-13-anoop.c.vijay@intel.com>
Content-Language: en-US
In-Reply-To: <20260310182336.611041-13-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0043.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::6) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|SA3PR11MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 163b48be-0382-4762-64ac-08de7ff62bcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: +hL3HqU7K6alsP55ptGM4Bzuk8FV6BR0nVajRTFUVCtyczqrZYV0Ywh4yBR3pmAsF3zSAi4GDjoobpXungJC6rZxdMIafnwWiAyvUQnzhz8IzS691zeJjsG23etWGr+OHAvZ7vg3pX24bgoGEQi6D4xnR5R6R1vOI26CpZYeXrdh+K3INCnDnrnGPCHxfWeytTUJBhgRKt86z1mV/SJA1ddvNwFqt+LBwUT3M2FhrDP2e4SwMHPwoB2bc88qC/zHvnp5qhCr2UQoGyYR3r/e/aot9QwHDJtiUNumx+oPTXOBfOY0OAH/1zxWsQvq9cdxtfquqyJPjDhauPE8hXDVUXQdRYshNyrXLPOGYwWZZGoU5b1u7Iern/A/t47BajLrC/LMRhC9Wu+9wV/VdyEPK4VZKNHwXDMUimNus/MBeJiFKaCTArHd/TTr9RNeNrmrtLrvrn0rCuXhooHReLpD4oPL6Fnymy3+OLGf9ZRCWaE8kXiNj6mWFZ43TaiG9CKuna4EWrqa+ag94gun12T/t+7WiyKhevUJGKVbQEgqV5TiPuoYPSYbMQIS6yPF/oA1cx1KuUgs2kn+Psfvcm1QCAvz3dMKQHV15xUxiuASvvS0LzwHDJWY9w2mTObBLLMBQHTQl5cE6unRu5lPb9RJrHb5FvpYs6nX0680KDOUF0CqmucrH3zGGND/J8NEyrcYXXxO7zaCOqwQJ/qV8z/fziXia136l+IG+/mXvC+In6g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnI2WGpOYUFiM3dNdzZXaFp2bmJkUFd0bGQ3MDJkVnZRVzg1cDFEVWY2Nkll?=
 =?utf-8?B?SWVibkhSYWNxdmJBczFuYWV2c3kvS0JJV0NJaG5aUk53ZnNUSHVIaUxoWkpG?=
 =?utf-8?B?Zkhhdmh1NEF2dlg3azM1eTNNa21iU3dxNjVSM3Q0TkNjRkkrNkQ2MDFGUlZF?=
 =?utf-8?B?eFVLOEt0UUc1MWJXWWQ2anpaZnJZTmtSdDZ4RXh3eE1FY1lZbGo5STZyTXJv?=
 =?utf-8?B?Y1ZCMEd5K0RhVVhHdzNRMUNsRHUybmtVdHY0YnE4WnVRRXN0T2ZKenNXWXhQ?=
 =?utf-8?B?YzdpQWFwSlhwQ3VSaHpDY2pDUFgwaFNGQ21aaFE4L0JRbzFTQWJlQnpMQWZx?=
 =?utf-8?B?L0FucWJmMHlFTGRwa1pWYnl3VzlQbWhWUFpBNFpxZEo2dTZGenJ1NnBIcklJ?=
 =?utf-8?B?dm1zSG5WbmpMTTA5MWs2aldSTDNzVVV4cnF6M1FUVVB6NFBRT1h5SlJCb2dI?=
 =?utf-8?B?QzlJRkxuYWdOOWxCVEVzdnRHZnVmOFh5RXdTelhxRno5SXRBZjg4Rk9ubHE1?=
 =?utf-8?B?Ni9NMHpjSitaTm1iMWRkbE84TGI1UkZWd2FRQ0ZnV2RQT2VuQjBvUW1ITnBw?=
 =?utf-8?B?WjRpVTMzbUxtZythcjZWQVF2YmhYU1p4aU5SOHQ3SW1ndTVlVHFRYW5HaUhw?=
 =?utf-8?B?bVh5VTBrK09TUklZcTZuRTNyMlA2MmhXcnp6VW82Ym5hNmQydnBsVlFyYkV2?=
 =?utf-8?B?WkFQaEdEU2E5YkVMOWcxZVh5VXlFbEJ1ZTNhQVlheUIwZFpibXlPTHp1WHVo?=
 =?utf-8?B?OWdFVWpXQU1TdW9IWitnZ2Zma0liUFR2Z3BXcVdiR3FlVlNQbU5UeXJEZits?=
 =?utf-8?B?RithYnBoeU92bEFKd1ptWGF6ajJyaGtNMkxRL1RBWUVsLzVadEc5Vkx3N0hI?=
 =?utf-8?B?OUFrdTNtS0p2ODRIbkRoY3hZTVdqMllDbWp0b2dTaUtacGg3WHpibmw4TVNS?=
 =?utf-8?B?YVJjR08zOFJkSWJVY3ZxZlZMZEVPL3J6a09nay9XZXVxbFhwMWMxQ1JnMHFL?=
 =?utf-8?B?a21iWlFWZGVkZUl0RFlWM213VmRzY2dxT2xyR0ZLZ21hNDNZNlVRV2k4akhU?=
 =?utf-8?B?L2MxVndvN2lHazQvdTl0cng3M0V5S2dzUkl3aHY3MHFsNG5mYkJVZDhhNFhk?=
 =?utf-8?B?QTJzWEtLSTlrbm90WDlJMmt5cXJsZmlGZWZLYWd3ZjZRRDk3OS9TeHVpNjRK?=
 =?utf-8?B?NzFwWmszL3hCWGlBRnpkWEx0VkxBVHFiNThBL2hndTlXUlduWUdvczk0d3JL?=
 =?utf-8?B?em5FTlNwZzZObjVRVEc1RVZCaFZSdmhFYUcxd2UvQmF5K1hINFU1ZWVzeXB4?=
 =?utf-8?B?V0QzSDdHOTBKSVpjbGxPa2lFeEZ5N2tPekloU0hPRE9DckdsTGQraFdDMHpQ?=
 =?utf-8?B?MVNBTzZDMzkyVTVOc0Z3YkJyaG9DQ1dsWG9SOHFEYjljNmpGVkZkQTFPUkg5?=
 =?utf-8?B?blBwS3F0dkVWUFVoSjRzU295WENSYUhieUdtcXIxSXN0T1BGOGtSeklaZEFk?=
 =?utf-8?B?SDZaUkF6UzBXTEJEWVRFcTdGTTJFQXd0akYyOHI2eG13b2VpTjRycGhNYis3?=
 =?utf-8?B?ZnFlSlF1bG4rOWlDdEU3ZitnRGI0cHhRNk9wOTJoak8zcmJZaFNIOWhCTEpT?=
 =?utf-8?B?cWZucDhIa2hBYnFqTWtzWkdJU0dCaStTQ3psWEFtdDJNeVVRVVlRNm9Nay9w?=
 =?utf-8?B?TzViNElLcDZycnRkRUNJLzRTQ2FWTStoTk1sdm5jb2NRWHltamJUYlJYQnho?=
 =?utf-8?B?S0lNYU1mdFoweWs0eGUvd0JQOWF4a25Bdk1vSlk0YktXa1NyVGNPMEdxcmt5?=
 =?utf-8?B?eGtkYml5ZWdWaUQ4WXlMMGNXL3ZRdDVsMTZkd1BzVXVMUTdzbFBwT0RhaUFx?=
 =?utf-8?B?UGltYVBIbmkrcXo5Nzg3c2JCUTcwSit1M0dHcmdiUGZ6QXNCa2pYSVhCYXJU?=
 =?utf-8?B?ZUh5OTQ1NGQyWmZRb280V0IvbmR4YnBSZVBvVmUybWwwdUxzWTUrM1ErR3RD?=
 =?utf-8?B?c2dTT2o3bjZ5ak9LUW91eUxjWkVGVWF1bHhkczQ0aXNLUmJhRlBTb1VoTnZy?=
 =?utf-8?B?d24wSHZpUDN6cFNPVDdLV25la1hkekVNaEdlRWV3T0lsZjhVUGlUTFVkcWtm?=
 =?utf-8?B?ellQZktjVzZRVWVKbGdETTlvUFB3akNWWTF5RDJGVG1SNE1rK1Q1cEZzdlNB?=
 =?utf-8?B?NUtQZERFemFhVlJXYmRaUk1DZWEzbWxPUnUwZnEyQ1RFS1RzMnlzeHFOSGg4?=
 =?utf-8?B?RUpaU1FyZzZHdlEvMThVSnJ2T2E5RjU5Nm5lSVdHTURndjQzUFc3SGkzZHQw?=
 =?utf-8?B?N05KVHE5YjN2YlBUY0lqWFVUSUZicjV0RmYzYUVXbjYxVmd1WEJvZz09?=
X-Exchange-RoutingPolicyChecked: pcaxqRgjyMX9QZ77DvXswkAiW/g4rBKf7YEszx4LYI20hqq3jNaBOL4MBxQX2BD9YTGqywJc/NolN1RfltunDXooDqhCor7pnqmLS4afzk9Qv4pBDi6ID2AEniimqn0gW8mQ6hZi66yOQ23HMLF0mWHMr6vlY/q/sGmggLLBAXvop1NQbKTvOa/WdaX6E6JOIdO/DxJzVbn6aOV0HpNRC0zN9BYz9NBwnudh2ztBVwoe7gjWaJ70GIFblSbBXh3/xLAP2gck4shnOj3X0V+yV8DHeQRlp3QcyOYQFt2sfjbduhvkridX0xoVtzA82agZvqqp99YDASHUGRxL4QcjGA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 163b48be-0382-4762-64ac-08de7ff62bcd
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 05:14:01.1902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vio/CO/tWQ3zOzf/kZpHxtOBo0govyRELCX+MnCoGfY6PYjowDioE8eTrp9oaYaNkkm+WNSKHlNsxfyVCaPCAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7655
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

Hi Anoop

On 3/10/2026 11:53 PM, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Adding mailbox communication layer for System Controller
> interaction. The mailbox interface enables sending commands and
> receiving responses from embedded System Controller.
> 
> Key features:
> - Command/response protocol handling
> - Timeout and error management
> - Uses protocol headers defined in ABI
> 
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
> v4: (Matt, Mike)
> - Refactor MMIO access to use domain-specific accessor
> - Add input validation and buffer overflow protection
> - Add bounds checking for multi-frame operations
> - Fix potential NULL pointer dereference
> 
> v5: (Umesh, Riana)
> - Reset phase bit to 0 on error conditions
> - Refactor mailbox receive path
> - Updated xe_err messages for consistency
> 
> v6: (Matt)
> - Use SYSCTRL_MB_CTRL_MKHI_CMD macro instead of FIELD_PREP
> 
> v8: (Matt, Michal)
> - Reordered patches for logical flow
> - Static functions renamed with short prefix
> - Changed xe_sysctrl_send_command() function parameter from 'xe' to 'sc'
> - Added frame length validation and command overflow protection
> - Use REG_FIELD_PREP for hardware registers
> - Changed error format to %pe
> - Removed unnecessary NULL checks and explicit zeros
> - Fixed kernel-doc syntax
> 
> v9: (Umesh, Badal)
> - Renamed MKHI to SCHI (System Controller Host Interface)
> - Fixed kernel-doc syntax
> ---
> 
>   drivers/gpu/drm/xe/Makefile             |   1 +
>   drivers/gpu/drm/xe/xe_sysctrl.c         |   2 +
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 364 ++++++++++++++++++++++++
>   3 files changed, 367 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 76a86818986a..7d13a3e43c9f 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -124,6 +124,7 @@ xe-y += xe_bb.o \
>   	xe_survivability_mode.o \
>   	xe_sync.o \
>   	xe_sysctrl.o \
> +	xe_sysctrl_mailbox.o \
>   	xe_tile.o \
>   	xe_tile_sysfs.o \
>   	xe_tlb_inval.o \
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> index 2751fe25a6ff..365f73ef680d 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -78,5 +78,7 @@ int xe_sysctrl_init(struct xe_device *xe)
>   	if (ret)
>   		return ret;
>   
> +	xe_sysctrl_mailbox_init(sc);
> +
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> new file mode 100644
> index 000000000000..b08885cf8dd5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -0,0 +1,364 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/container_of.h>
> +#include <linux/errno.h>
> +#include <linux/minmax.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/types.h>

These are redundant includes that are already
included by below files.

I don't see an issue removing these

> +
> +#include "regs/xe_sysctrl_regs.h"
> +#include "xe_device.h"
> +#include "xe_device_types.h"
> +#include "xe_mmio.h"
> +#include "xe_pm.h"
> +#include "xe_printk.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
> +#include "xe_sysctrl_types.h"
> +
> +#define XE_SYSCTRL_SCHI_HDR_GROUP_ID(hdr) \
> +	FIELD_GET(SCHI_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
> +
> +#define XE_SYSCTRL_SCHI_HDR_COMMAND(hdr) \
> +	FIELD_GET(SCHI_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
> +
> +#define XE_SYSCTRL_SCHI_HDR_IS_RESPONSE(hdr) \
> +	FIELD_GET(SCHI_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
> +
> +#define XE_SYSCTRL_SCHI_HDR_RESULT(hdr) \
> +	FIELD_GET(SCHI_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
> +
> +static bool sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
> +				   unsigned int timeout_ms)
> +{
> +	int ret;
> +
> +	ret = xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
> +				 timeout_ms * 1000, NULL, false);
> +
> +	return ret == 0;
> +}
> +
> +static bool sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
> +				 unsigned int timeout_ms)
> +{
> +	int ret;
> +
> +	ret = xe_mmio_wait32(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
> +			     timeout_ms * 1000, NULL, false);
> +
> +	return ret == 0;
> +}
> +
> +static int sysctrl_write_frame(struct xe_sysctrl *sc, const void *frame,
> +			       size_t len)
> +{
> +	static const struct xe_reg regs[] = {
> +		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
> +	};
> +	struct xe_device *xe = sc_to_xe(sc);
> +	u32 val[XE_SYSCTRL_MB_FRAME_SIZE / sizeof(u32)] = {0};
> +	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
> +	u32 i;
> +
> +	xe_assert(xe, len > 0 && len <= XE_SYSCTRL_MB_FRAME_SIZE);
> +
> +	memcpy(val, frame, len);
> +
> +	for (i = 0; i < dw; i++)
> +		xe_mmio_write32(sc->mmio, regs[i], val[i]);
> +
> +	return 0;
> +}
> +
> +static int sysctrl_read_frame(struct xe_sysctrl *sc, void *frame,
> +			      size_t len)
> +{
> +	static const struct xe_reg regs[] = {
> +		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
> +	};
> +	struct xe_device *xe = sc_to_xe(sc);
> +	u32 val[XE_SYSCTRL_MB_FRAME_SIZE / sizeof(u32)] = {0};
> +	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
> +	u32 i;
> +
> +	xe_assert(xe, len > 0 && len <= XE_SYSCTRL_MB_FRAME_SIZE);
> +
> +	for (i = 0; i < dw; i++)
> +		val[i] = xe_mmio_read32(sc->mmio, regs[i]);
> +
> +	memcpy(frame, val, len);
> +
> +	return 0;
> +}
> +
> +static void sysctrl_clear_response(struct xe_sysctrl *sc)
> +{
> +	xe_mmio_rmw32(sc->mmio, SYSCTRL_MB_CTRL, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, 0);
> +}
> +
> +static int sysctrl_prepare_command(struct xe_device *xe,
> +				   u8 group_id, u8 command,
> +				   const void *data_in, size_t data_in_len,
> +				   u8 **mbox_cmd, size_t *cmd_size)
> +{
> +	struct xe_sysctrl_mailbox_schi_msg_hdr *schi_hdr;
> +	size_t size;
> +	u8 *buffer;
> +
> +	xe_assert(xe, command <= SCHI_HDR_COMMAND_MAX);
> +
> +	if (data_in_len > XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*schi_hdr)) {
> +		xe_err(xe, "sysctrl: Input data too large: %zu bytes\n", data_in_len);
> +		return -EINVAL;
> +	}
> +
> +	size = sizeof(*schi_hdr) + data_in_len;
> +
> +	buffer = kmalloc(size, GFP_KERNEL);
> +	if (!buffer)
> +		return -ENOMEM;
> +
> +	schi_hdr = (struct xe_sysctrl_mailbox_schi_msg_hdr *)buffer;
> +	schi_hdr->data = cpu_to_le32(FIELD_PREP(SCHI_HDR_GROUP_ID_MASK, group_id) |
> +				     FIELD_PREP(SCHI_HDR_COMMAND_MASK, command));
> +
> +	if (data_in && data_in_len)
> +		memcpy(buffer + sizeof(*schi_hdr), data_in, data_in_len);
> +
> +	*mbox_cmd = buffer;
> +	*cmd_size = size;
> +
> +	return 0;
> +}
> +
> +static int sysctrl_send_frames(struct xe_sysctrl *sc,
> +			       const u8 *mbox_cmd,
> +			       size_t cmd_size, unsigned int timeout_ms)
> +{
> +	struct xe_device *xe = sc_to_xe(sc);
> +	u32 ctrl_reg, total_frames, frame;
> +	size_t bytes_sent, frame_size;
> +
> +	total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
> +
> +	if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
> +		xe_err(xe, "sysctrl: Mailbox busy\n");
> +		return -EBUSY;
> +	}
> +
> +	sc->phase_bit ^= 1;
> +	bytes_sent = 0;
> +
> +	for (frame = 0; frame < total_frames; frame++) {
> +		frame_size = min_t(size_t, cmd_size - bytes_sent, XE_SYSCTRL_MB_FRAME_SIZE);
> +
> +		if (sysctrl_write_frame(sc, mbox_cmd + bytes_sent, frame_size)) {
> +			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
> +			sc->phase_bit = 0;
> +			return -EIO;
> +		}
> +
> +		ctrl_reg = SYSCTRL_MB_CTRL_RUN_BUSY |
> +			   REG_FIELD_PREP(SCHI_FRAME_CURRENT_MASK, frame) |
> +			   REG_FIELD_PREP(SCHI_FRAME_TOTAL_MASK, total_frames - 1) |
> +			   SYSCTRL_MB_CTRL_SCHI_CMD |
> +			   (sc->phase_bit ? SCHI_FRAME_PHASE : 0);
> +
> +		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
> +
> +		if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
> +			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
> +			sc->phase_bit = 0;
> +			return -ETIMEDOUT;
> +		}
> +
> +		bytes_sent += frame_size;
> +	}
> +
> +	return 0;
> +}
> +
> +static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
> +				 size_t frame_size, unsigned int timeout_ms,
> +				 bool *done)
> +{
> +	u32 curr_frame, total_frames, ctrl_reg;
> +	struct xe_device *xe = sc_to_xe(sc);
> +	int ret;
> +
> +	if (!sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
> +		xe_err(xe, "sysctrl: Response frame timeout\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
> +	total_frames = FIELD_GET(SCHI_FRAME_TOTAL_MASK, ctrl_reg);
> +	curr_frame = FIELD_GET(SCHI_FRAME_CURRENT_MASK, ctrl_reg);
> +
> +	ret = sysctrl_read_frame(sc, out, frame_size);
> +	if (ret)
> +		return ret;
> +
> +	sysctrl_clear_response(sc);
> +
> +	if (curr_frame == total_frames)
> +		*done = true;
> +
> +	return 0;
> +}
> +
> +static int sysctrl_receive_frames(struct xe_sysctrl *sc,
> +				  const struct xe_sysctrl_mailbox_schi_msg_hdr *req,
> +				  void *data_out, size_t data_out_len,
> +				  size_t *rdata_len, unsigned int timeout_ms)
> +{
> +	struct xe_sysctrl_mailbox_schi_msg_hdr *schi_hdr;
> +	struct xe_device *xe = sc_to_xe(sc);
> +	size_t remain = sizeof(*schi_hdr) + data_out_len;
> +	u8 *buffer __free(kfree) = kzalloc(remain, GFP_KERNEL);
> +	size_t frame_size;
> +	bool done = false;
> +	int ret = 0;
> +	u8 *out;
> +
> +	if (!buffer)
> +		return -ENOMEM;
> +
> +	out = buffer;
> +	while (!done && remain) {
> +		frame_size = min_t(size_t, remain, XE_SYSCTRL_MB_FRAME_SIZE);
> +
> +		ret = sysctrl_process_frame(sc, out, frame_size, timeout_ms,
> +					    &done);
> +		if (ret)
> +			return ret;
> +
> +		remain -= frame_size;
> +		out += frame_size;
> +	}
> +
> +	schi_hdr = (struct xe_sysctrl_mailbox_schi_msg_hdr *)buffer;
> +
> +	if (!XE_SYSCTRL_SCHI_HDR_IS_RESPONSE(schi_hdr) ||
> +	    XE_SYSCTRL_SCHI_HDR_GROUP_ID(schi_hdr) != XE_SYSCTRL_SCHI_HDR_GROUP_ID(req) ||
> +	    XE_SYSCTRL_SCHI_HDR_COMMAND(schi_hdr) != XE_SYSCTRL_SCHI_HDR_COMMAND(req)) {
> +		xe_err(xe, "sysctrl: Response header mismatch\n");
> +		return -EPROTO;
> +	}
> +
> +	if (XE_SYSCTRL_SCHI_HDR_RESULT(schi_hdr) != 0) {
> +		xe_err(xe, "sysctrl: Firmware error: 0x%02lx\n",
> +		       XE_SYSCTRL_SCHI_HDR_RESULT(schi_hdr));
> +		return -EIO;
> +	}
> +
> +	memcpy(data_out, schi_hdr + 1, data_out_len);
> +	*rdata_len = out - buffer - sizeof(*schi_hdr);
> +
> +	return 0;
> +}
> +
> +static int sysctrl_send_command(struct xe_sysctrl *sc,
> +				const u8 *mbox_cmd, size_t cmd_size,
> +				void *data_out, size_t data_out_len,
> +				size_t *rdata_len, unsigned int timeout_ms)
> +{
> +	const struct xe_sysctrl_mailbox_schi_msg_hdr *schi_hdr;
> +	size_t received;
> +	int ret;
> +
> +	ret = sysctrl_send_frames(sc, mbox_cmd, cmd_size, timeout_ms);
> +	if (ret)
> +		return ret;
> +
> +	if (!data_out || !rdata_len)
> +		return 0;
> +
> +	schi_hdr = (const struct xe_sysctrl_mailbox_schi_msg_hdr *)mbox_cmd;
> +
> +	ret = sysctrl_receive_frames(sc, schi_hdr, data_out, data_out_len,
> +				     &received, timeout_ms);
> +	if (ret)
> +		return ret;
> +
> +	*rdata_len = received;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sysctrl_mailbox_init - Initialize System Controller mailbox interface
> + * @sc: System controller structure
> + *
> + * Initialize system controller mailbox interface for communication.
> + */
> +void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc)
> +{
> +	u32 ctrl_reg;
> +
> +	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
> +	sc->phase_bit = (ctrl_reg & SCHI_FRAME_PHASE) ? 1 : 0;
> +}
> +
> +/**
> + * xe_sysctrl_send_command() - Send command to System Controller via mailbox
> + * @sc: System Controller instance
> + * @cmd: Pointer to xe_sysctrl_mailbox_command structure
> + * @rdata_len: Pointer to store actual response data size (can be NULL)
> + *
> + * Send a command to the System Controller using SCHI protocol. Handles

Same as other patches. SCHI protocol is undefined.

> + * command preparation, fragmentation, transmission, and response reception.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int xe_sysctrl_send_command(struct xe_sysctrl *sc,
> +			    struct xe_sysctrl_mailbox_command *cmd,
> +			    size_t *rdata_len)
> +{
> +	struct xe_device *xe = sc_to_xe(sc);
> +	u8 group_id, command_code;
> +	u8 *mbox_cmd = NULL;
> +	size_t cmd_size = 0;
> +	int ret = 0;

Initialization is unnecessary

> +
> +	xe_assert(xe, xe->info.has_sysctrl);
> +	xe_assert(xe, cmd->data_in || cmd->data_out);
> +	xe_assert(xe, !cmd->data_in || cmd->data_in_len);
> +	xe_assert(xe, !cmd->data_out || cmd->data_out_len);
> +
> +	group_id = XE_SYSCTRL_APP_HDR_GROUP_ID(&cmd->header);
> +	command_code = XE_SYSCTRL_APP_HDR_COMMAND(&cmd->header);
> +
> +	might_sleep();
> +
> +	ret = sysctrl_prepare_command(xe, group_id, command_code,
> +				      cmd->data_in, cmd->data_in_len,
> +				      &mbox_cmd, &cmd_size);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: Failed to prepare command: %pe\n", ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	guard(xe_pm_runtime)(xe);

Runtime pm should be in the outermost layer.
Should this be here or the upper layers?

++ @Rodrigo thoughts?


> +
> +	guard(mutex)(&sc->cmd_lock);
> +
> +	ret = sysctrl_send_command(sc, mbox_cmd, cmd_size,
> +				   cmd->data_out, cmd->data_out_len, rdata_len,
> +				   XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS);

Why not use the macro directly instead of sending it as a parameter?

Thanks
Riana

> +	if (ret)
> +		xe_err(xe, "sysctrl: Mailbox command failed: %pe\n", ERR_PTR(ret));
> +
> +	kfree(mbox_cmd);
> +
> +	return ret;
> +}

