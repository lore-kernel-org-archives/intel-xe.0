Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24554C61DC4
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 15:04:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C764E10E088;
	Thu, 27 Aug 2026 15:04:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UFzK4+za";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4F510E088
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 15:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787843073; x=1819379073;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Vqxv0hVyl/YH5cedgWEu2/q+GKPNTtp5H4fIz7xjk7g=;
 b=UFzK4+zaYDI7EkgVe8ojdbPIXJEfVRUguIgqx9i/RlHryF0+/5kowz/e
 dJJd5pWhfES7YKIRCPWmy8HgnK/nu3m/iDINHHZJFNN20NtOInfGAJLXg
 kOxx6R/syjSeFJX6gttPubkeZO7/Jidthhr1zJTX3vucSVZ7Ge/q4Irux
 BhwGmXsATK25G7v9K8DpiL5QyQP/gOm/4C8mU7FyGskG2ztWSFj17fdDn
 xEZVBSiC7CpZbxPHMRe3o/Q3A8OC+Y68ifT7OIaqlCNxSA3QDZiVk9gaz
 PeF7va1QIHx2vulhU0cSceNVpuErlhFp0WQw16k8AT2oV6OpTn5ppKVCX A==;
X-CSE-ConnectionGUID: P0SM+39sSGeHqm6YnFrcBQ==
X-CSE-MsgGUID: 0JupAFw/RBuzFK7fSEpgVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88265122"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="88265122"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 08:04:32 -0700
X-CSE-ConnectionGUID: ctzf0DVVSRC5Vc96r+ySFg==
X-CSE-MsgGUID: RR7XFn0QS3erc9nxBZLn5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="269845983"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 08:04:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 08:04:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 08:04:31 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 08:04:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXAHnnWXDkShpevAKgMkcJ7HpmfkefKKlWxSr0lULRCS5iY/EybZcrz0M4MetDxmeQeT8cE86u6+AcWKojtndBObPUGd68EqeBe8YeNVaHMP2SMwlaxE1r6CQvKEzx9qHCNvHbIEUs28tWkbHJt4b+FzZkEKTjJPBdL7JnugJyseZSDbjiOjNZiwAEEB3Aq51vgKz4yknsbgSWDyMs7P1Tz2aAq2auxDc4B9KHcnEwSjnIBfN+pluOOgs38dRBf9ZSuLhF+pYLtncuH9i1+YU4/nJn0DcRA22JqIqneP3+/LISCilkttoc2e1tuWtZUFQXjmXoVKqU/4PKJtObpWmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NGM+1W5y8wNKoXksaEpc7jTzISpnim3rQJHBB2tiMg=;
 b=xO29260+E7eUouy2tXI0O3AypN3YB2xRoEjcb4PN8K7yQyuyDJBfA9VejfZpHRzcA9JTsD7hjGCDFxdzmuzU+59X0VdtJ45utHvJRGrMlw0coinzHujDCkjtZxavL9hKbbVvbuxg/gHQEmUxg2nkBv5n04O8vvpeu7T1XCaWe9ytIJB2X2zfvU7YDS6iQ+3+pZXrIrsE6tXk4jzAOnUoDmiAqJvHIflraVofMo9KCd54Bmy2ALxKUP0SDFEgy+jR6O+mCMp02fZW425vlWtSBiytk30kGebp7t9f8XPRPz7n5gqO6wwFA4xxtI2l8wtjkzQeqDb+twivUzO2Xb4HaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH0PR11MB5015.namprd11.prod.outlook.com (2603:10b6:510:39::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Thu, 27 Aug
 2026 15:04:29 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 15:04:29 +0000
Message-ID: <e579d9c6-2c46-4910-a0e8-9e95860ce650@intel.com>
Date: Thu, 27 Aug 2026 17:04:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V18 11/14] drm/xe/vram: Check bad_page_reservation policy
 in fault handler
To: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 <intel-xe@lists.freedesktop.org>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>
CC: <himal.prasad.ghimiray@intel.com>, <rodrigo.vivi@intel.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-27-tejas.upadhyay@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260826135136.204044-27-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0216.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::37) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH0PR11MB5015:EE_
X-MS-Office365-Filtering-Correlation-Id: 87c1de79-a4b9-4e68-79a0-08df044c7e44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|22082099003|56012099006|10067099003|11063799006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info: slwrAJRbJHH79X1Cg4i2ekZuQKrCQeC2ErnF+T8OvrZm3bXnlyM8N3zVqBr4MEl7jF8ODKIVRSnTZf1Ijc09T5hb+xBuBcLMSRmVDVnBN8h4tXmW5aYAhrJR8bpLHd4houMNrxGgbZcbYStEd7X9YXgKvXvPAsa2asb5D/Fq1kKUQGsVWYDjZbdZMHjCcNtTQpk5MLVxbPrFz0KSDqHtlxJgoErA+lBpb5yF0l4x2BUKEltin1i3Y0MZD+oCIlTR4uSlo0I3XaGa2bDwqUal360lv3Ylo7NHaCQMkKQEE6LGafF1LEHParqegGJ2051J+rpoQkC4B/Vly/FqT3O38znRd4svhcjWNDtCL3ZooUCGKfRFAUDVjYXbSRL5ywjcxWyNOEU96XLQNBIYVqoSaBmROXB9jaeACROQJd56O7H/IBD/ZRIwW/lwdMf+B9ic3ztBYRyAzWfLz6ngEnR3PEYGu5C91wLLAKeXwczdEIXXS1jN+iDREcm1ryNHWhCZC6gdbXl1XYJmNpMbIGuvnzYYeAsshOecUPhB27UwZUoUuSImLUfmQhKgLR2+jNslXO7/p3262sJghU3WxSXKtByQFHAJjvQOvyDOvRoZR01zTBgmlu7Xrd0QhBKm55qaVUf1GgkViw1FplAqyrsnnURrKVzGFt5hmQholKlMHjM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEhrNk1rS1dWbVBzSTdFMG9qaXhZSWtTd3VUSHZndnd0bXRFK1U3azdWY2hE?=
 =?utf-8?B?Q1BKVTI0Umt4VXI1eHNDTVhCeEdGU1dVT21yRm93c0cvMWhRc0VxbW1CSFdx?=
 =?utf-8?B?Y2tMdGs3eFlxUnhpRmMvcW50WTgvUXFiYzdPL01PQzBZdHZGRC9PdnJ6L1VH?=
 =?utf-8?B?d3lqWFhZTEZJSnBaeTdhOFk5TUZtZmtBdzF6ZGl4RVE2QnduTHhKYmNZYzBr?=
 =?utf-8?B?SXBQci9PMmZZaVdzSUV6MjFvM0JhVk5pZ3E4a2lBVkZON2xLQUhrZnlQbXlK?=
 =?utf-8?B?ZWpRb3VsYWVDVGtrbjVMSDA4R29pYnZvVWtCam5NU2pzT2dHakFVaFY3NTlZ?=
 =?utf-8?B?bGRoWmxKT3NXSjhNS3pQNElzeWVtMFBpUWp1TTFWSE1ZSitEVS9jNTBxUHhB?=
 =?utf-8?B?OG9waHQyMmN5YWx6OVE5enA1VnNFaTF6bFJsRW5kanJkVjE5dUp5cUhYUnQ4?=
 =?utf-8?B?NzkyTE9DUlMrcU1FVTNpbEhsN1dBSE5Qdlh4clZmNysxYjM5MG9aU3pYR25R?=
 =?utf-8?B?RURhc0VmNkJVSmppaC94Y3FjOFN4cHBxcXNYdURDdTRXN3FDVUxreTlrUG5B?=
 =?utf-8?B?OUt1TlZlMlEzWmo5WHdpUStGZ0xJai9BdjVDRlNxdFl1MWV2QVRDWDJPMVh4?=
 =?utf-8?B?K1kxejZVcWUzVzB0aDBBd1p6cHRUMG5zL3NidjBWQzVPZ1ZkbVFEUDhCVVZG?=
 =?utf-8?B?Q0xacnF5M1BuZEtOYzBTYWVIWTh0SEJyMFV0SzVQK2lNNXhHOHJOUnBWeGwz?=
 =?utf-8?B?YS85ZFRSK3Y4TFNqSUdzV25ReFptNWRXeEY2Vld5OUNXQml5ZytiSk9ML3V5?=
 =?utf-8?B?aVRqRDNzVGs2YUtGcVpLZUFpWUNZTnlMMWtoTTNSb0JJMCtobHFPT01oV2l4?=
 =?utf-8?B?UjBhd0lGYmlQN09iMjN5eXdDbGoyejR1ZTU3eGNyaVBhU0F1ZFY5dUhNOTdu?=
 =?utf-8?B?NktZWjRsSjEwVGJrd0NMRmE1ZFdmVnRIT0xac2tZamF1bVUwRW5YczQrWXRP?=
 =?utf-8?B?czlCT3NqeFZPQmFDNUJ6WDJlN3ZSWUQ2UGw2THliTEtnREVmL2dRWEVzamQr?=
 =?utf-8?B?QStYOVoyU05WbnZsaTBuam8zeUp3b0RUc25SSTBYS0taeUFzQ09OV0NiSUsz?=
 =?utf-8?B?QllPVmpzZkEwV05rQlNxRVNqV1ZzSmJsWkEzVzFXMG1rK0ZFREZQVUx1b2VI?=
 =?utf-8?B?R0ljZWlOZFBDSmtSYUxoUkIzTjBlNy9zc2Q0R1ZEMk5OSnZMaUhKMzJaL1hI?=
 =?utf-8?B?VGh4ZTlGM1UvUlNTK1U1LzNoc0p1RjFQMWNrUHhiOUQ2eFVKTlVodDRwOHpp?=
 =?utf-8?B?TG95cGZzTUpGdllRVlV3NE1wT3B6bk1VVjFZQ2MwVEsyeUx3WjdjM1lGeXRQ?=
 =?utf-8?B?OTc2RzUzL3hwUU5QYUkxMGVvczNvcG5ZUkVvNnVGdDN0R0ZEKzVpbi9GOE5N?=
 =?utf-8?B?WVZOd3RWeTVlZG53Riswc2NLaldkSWVYeXhDZjNnYWhBcFIvR3JJUVNuSTJB?=
 =?utf-8?B?SEdyVm1UWjgzenJtVWpETDZTWFllWXdwc0JVbGxBdWRtdC9sNFJpajhNOHFq?=
 =?utf-8?B?VU5iZlM4ZmRDSnlNUlFiZHpmWU84Wk16cHZwaHhEdUtjek4rNWpKaFVMMDUx?=
 =?utf-8?B?U3d0TzN4VzNWTlVlWk1jbjlKMWhQMzJ2YTlueHFzdTc4cm9LSjA0dVY4amI0?=
 =?utf-8?B?NG9CWExTMlBnOXVjNVRjMkhqaHZwVURlMmJzelZFOWxINDdNQkFEbGtLQjZs?=
 =?utf-8?B?R1VuWlFVbnlOWGVoQ3ZlQmh0dGJBV2lTU3I0aHFTODlaNi9MWmEvWHpTOVdR?=
 =?utf-8?B?MTkycFRlZzg0VGl1Vnk5b2N4NUhvT0dpMUdGMUY3cS9lTDRGVHo4WEl1UnhQ?=
 =?utf-8?B?dVdXeGdlOVNhWDNQNXowM1dvdjhEMkNKMnhQQjBHcTE2RXA1RGpOa0ZaSE1U?=
 =?utf-8?B?dXlqUGpBYzFEdjNCZFN6cHIyV2FlQUJBeFErOG8xd3BUWitwMWFrZWlSU21C?=
 =?utf-8?B?VjN3OGYxRmlzdlJaMFNmMGhpeU9HaHlTYjN1Wm1DMnVIcjFFdlU5YzFqVDkz?=
 =?utf-8?B?d2piYWNZQTRpaHA0UHpnSzUvUVlnZFl4d05nUXJudnNzSS9kcm0xZlVOeE5v?=
 =?utf-8?B?bm8yaE5FeXhrVnkrK3MzUjZpOGRmOGNwcHZVbjFoY0w3UitPZVlpV0RJRXlr?=
 =?utf-8?B?czhFcDAzVFBUL09IbDNhOEh0UVViWTg3bzlnYlJlbmNFWVZ1SjJNM2RaRkpl?=
 =?utf-8?B?VnB0VTlHUmJWeUhHMzRIYzN1QzVHSklTL2VEVWE2NitFRWMyNS9PUUlyWkhj?=
 =?utf-8?B?b21QMHo3eDZzUTFyVTVhbzJNWUlUS2NxYUhldEorRGdEM3BNQkxWRkU0c0xH?=
 =?utf-8?Q?o8cPaCh0lP0t5mfM=3D?=
X-Exchange-RoutingPolicyChecked: Ienrd7WwTp+xqORFsV/Dj51SLgp6971Q0j4WEJRt7gvdPEeJK27PL568HD8I15OSJv0DD9XunBkkeU3eMq0tKvx7pHWVJk6ZAYa4c0z+gHHtokcBYYS42rwkQ5JQM93xfDW5HKTLNmAkMwStk9UdpU1Dh785ePVQlZp1PW4/0XVGdHOwi8+wrMxDPXHO8Npopx8cab2HvH+zFUb2W591p24/bz5lE7R3SE17utbxgLOIzzorRbmtRI00cksKnJzoSVwbXVOcEd56ZNEs3SXkVQvZW8eg8jpUKIopA690UjV4CvZ/FX1PO9+VeXax/rs5cCpi0G9Ykj4XhTt+a7vhAw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 87c1de79-a4b9-4e68-79a0-08df044c7e44
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 15:04:29.4231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RVHGrFCA+wfbVMAlkxZCkiz5QkUurDdp1OkXOa9lek/AAw2gixRaEl77bhfQhYDu/ecS2IT6PQ5MuecfXqwUfph/auVNG9KbNN0sxoDciDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5015
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



On 8/26/2026 3:51 PM, Tejas Upadhyay wrote:
> Before reserving a page at a faulting address, check the cached
> bad_page_reservation policy from xe->ras. If the policy is disabled
> (logging only), log the corrupted address and return -EOPNOTSUPP so
> that RAS can report to firmware to drop the address from the SRAM
> queue without attempting to offline the page.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index b2b6c1bd2c55..24d134754265 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -864,6 +864,12 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
>  	vram_mgr = &vr->ttm;
>  	mm = &vram_mgr->mm;
>  
> +	if (!xe->ras.bad_page_reservation) {
> +		drm_err(&xe->drm, "0x%llx is reported as corrupted address by HW\n",
> +			addr);

we do have easier to use

	xe_err(xe, ...)

and also recently added SIGID logs:

	xe_log_err(xe, ...)

which maybe we should consider here?
or is it done by the other layer?

@Mallesh ?

> +		return -EOPNOTSUPP;
> +	}
> +
>  	/* Reserve page at address */
>  	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_mgr, mm);
>  }

