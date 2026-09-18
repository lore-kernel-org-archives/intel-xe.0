Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDC2C982DA
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 14:50:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7462510F3F0;
	Fri, 18 Sep 2026 14:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gn3oT5dC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D5EA10F3F0
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 14:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789743054; x=1821279054;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=a05gYZD27RkxaLGQwTqwLEN3fTLgtdKJ/J9IQ3fjdX4=;
 b=Gn3oT5dCbUweWtau/HOwG4okApBC2G6oLNtZu1lFde4rRbMFZRl/2tfO
 Kdck29aeNFjeR+dAt8NR27/hEKtQA/dnOOI/W8gM6HprJTRqkYny9NG5s
 28o0B1z4z2PEP9/SS8C8V/KoqYi/wKOivokuXqlT84RAPmSkD0REexYuM
 PWv6xpBzBtC3UKHts7+mtubzWGcKPVoW0UEvFqZI9bvVM5qXOtOGrc6iO
 e1rYCsX1/cz6Mm54NcRYfAmtPzYZBQ3jrw8SnPDlN9y/jYf8rCzrVy35S
 NBBHBubA4y6dcn2VYzHoPMWiyblwJj4/8syANRsFTjDb0/XfH1eRPt7tJ Q==;
X-CSE-ConnectionGUID: dZP3R6bQSBGtf6iHeVyR8A==
X-CSE-MsgGUID: zkFBZ2LZStCVHTltLCSr0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="759646"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="759646"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 07:50:51 -0700
X-CSE-ConnectionGUID: FiUSOeA5T7usQg+hovHOFQ==
X-CSE-MsgGUID: JEFYcssBS8aJW7BXofnoSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2666651"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 07:50:50 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 07:50:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 07:50:49 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 07:50:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pkhg651wrmreXQ3VU8IK1Po5pJiI55cjYDS/N3AE6x/v+NEWECdP+p1b4rTWCQW0nLnN2hWTPmly2Rku1oUXCae+O1TJld7dbKF3Tsk8ZJcwOacpnZW6sgDXieDPvZ1u0ByERJCusNM1ur1IJqJUoGPr/u0xmTivDcU7Nyg/Yq2LCe7k7ds99KNB9P0xFDX50EG2ESsapZGeTQnPDG/2sYT7H3Uz1Qh1L2xOgElLNjCH8MDYytcbPzt7rmRuzR3D1unmk9HJiLzoe8eJqLQz6e+XBTQY5ccvyoaspUJZnhuIjY/5A63e1aani9k8J9Vfy6UFgvUgKv5urGFIGOOwuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+25LbQpODDgL0MBvnI1V7Cu8O+ypAKa627YRS6FQMbc=;
 b=xJ7VcDiYIsyvqoLvgaVyIHh1/2x7an5HULIAdIIWGDBh+UQDQk84C+9lVQB5hn45qnJceG8VgqamgArN51D9Hc+g1RsyHhg7cXlGZ1OIes/UTG5xhE/J5EHXWCuu9L0M2MPQvXDlmbbiTKhA5X0luOTWxJeMJCOctPBQT0uFBy4evVkHAifWPQlk4PXzoE/Jr5h2bXlWcxwuB+gN/8DexWwuk/YTba6uKZnl0gMqyPRlq4f8GhMeWoZcIVNBeQftGFf68+r2Jh2Z1mVqUr29brTDtSlgeYXGPOLANw49JOBOZx1wtlRmImjPRVgvlY85gMmMTo0OsDcWEFJlIYbjZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH0PR11MB4839.namprd11.prod.outlook.com (2603:10b6:510:42::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 14:50:45 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 14:50:45 +0000
Date: Fri, 18 Sep 2026 10:50:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Keep VF LMEM BAR size low if no VFs enabled
Message-ID: <aq1PtZBFIVB4ORrZ@intel.com>
References: <20260918110130.700332-1-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260918110130.700332-1-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: SI2PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:194::7) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|PH0PR11MB4839:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fe35cba-22df-43fa-eada-08df159437c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|11063799006|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: 37gC4GQWa03N5cLnvjrV333ExxxFft/N/KYi4XPn3bRYqE9rD+j2ewbIkvMUTk5uszsRQsQHAjBj93yGI8CShLVXIHnAy9vL7VCYMx4+bnUOcXDR9dG7o2kbMEf7zSpk5xlvjsQZaRvAPpQZXhpYXrXk3UPezlVwI839V5pcHWC0Qgiyag7VMfBKpvyhal1oXiH4nGP+CnuAXURmqUZR81RdmowLBlclyNoyNxpc91P1noUfbAJv+6Sw6bImADj+XS4nDF5vfh0EL8hLJSxRNw3gWBMlYguR7Mt0XJKKXnhSt5y2XdVcy3SO1T/tYx27nrQJvMsryWulPJM9vke7e9nBX1vcIQGiYPosfPKJ8Fv6dnH2FdEOL6camwe+I2nfeOECaYVnsKVcsan60Obl2KWnkFG4mn5VFbLYnQbnaM2bfrJF0WorqlM7r6C5EyJC0ESkZ/imPAC2xTMOWXSPcRNuWf/iVs55+kpJKMSUnh0HdmLCRKx3AQmrDUI4HQ5XI0XZa049cN3OwteutQtLBdEguhMHxb1ZQg6Ca12EgSJz8zp+vlGlFf3wrK3R6QQIv/+Wwa9CqpQQpH+i9E0Q7y9bFj56O3TIDAtuqPfVez74bXZ9y9Anvrjuxu0VGgxm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmNLdGVmOU1UWlV6cEt4L1dESEQ4eTFxS2Uxb0Qrc2l3QjB3dUQxK2s3VmV4?=
 =?utf-8?B?MW9lcVgrSUY1eWxVKzRuVm1abTY1SHloSWs1VFNGUE1FSXNTU0R2emFUZS8v?=
 =?utf-8?B?QjZObjBidlV1Y3AvVXNYN3UwL29namtLdzRaYU9UL0M5SFhVU2RCSkp4eGpq?=
 =?utf-8?B?UCt0K3BUZzZyNEJTeGRzMmVNKzh2OWNyZ3U2UmhvcTEwUnQ0b1hyRjN0Um53?=
 =?utf-8?B?MTZGdmkyWFRSUmNLN3lIeVRTTFU4OVlKUGs5WEdzUGFwZE9CRWpFVnkxMHhB?=
 =?utf-8?B?d0ppbnZpUjRiMzFPMi9SZ3RGd29jQjU1bjBESy9zU0dvWEZWRi9LdTJOM21M?=
 =?utf-8?B?Y1VSVmdtRGVDbTdYZXBWM2ZmYnI1VG9GL1gvN2s2MW8rc3d2VXdnam9mUk9E?=
 =?utf-8?B?d3RtTlBkb3lKVjVlNERNd21hd0xZT0grN0ZXTk1pMFBzRHYwVHpaZTc5WEVH?=
 =?utf-8?B?V3dFRjlodElIOTdDVWR6R1dJUERocHVaN3I4enJuYWJkWHlKbE14ZEhScHY4?=
 =?utf-8?B?THNyU0w3elcxblp6ZHg3cndIMEg2SGtoNnQyNTh6WHJ4dTltQm5SbWNlOWVC?=
 =?utf-8?B?alNnS1NlYTFNbXpodWxhVUVZRTUydkNLQU1LVjJ4cjM2WkJ3T0o0T1ZMeEs5?=
 =?utf-8?B?VDdiWEo5aHZVNXh3eGtDNjVPWmNmVTg4eUNEVHJ3K3lzVTd6dE1kbEFXd0h2?=
 =?utf-8?B?Ym1jU0FtTWRscjRZYkRpOU11MGJiQTh4QUFaWDUvOEw2YXg3NnUyV1gzejZB?=
 =?utf-8?B?NTQ1M1R0MHNIL2VFUyttL1BZR0xnbEN6N3dVQUxRNWhVTzFZV24rejUxZ2VJ?=
 =?utf-8?B?a2VqVTh6UVNDY3ZkcFhNdGs1emxuV1BCMm00RXAxcG1iNFBqWjltQkVrUXVw?=
 =?utf-8?B?STZyb3JuK0Z1bVV2M3BiR0FwUmxSUzVUNzhiZWdQb1V0MHB1NEdWUHlXR0Nu?=
 =?utf-8?B?RjVXU3FycFBUbnNMdGN0OVYwUXB0Y0x1bndVM1BlSENKNUlRMi8vcldMUmJn?=
 =?utf-8?B?dUhBN2dPR3k2aWdYNzBUY3dRVjZtVmRXZ3FCdDdtdFJyMnY2aFU0UklTb0JK?=
 =?utf-8?B?OFBSUkF2ZFFVQmdZdHRxNHE0bWRrclNUM2NBQnI2TExVTTA2VC9Pbkd4UXVY?=
 =?utf-8?B?UmR3MVJvWUlTVU5CV3BSU04zOTNxVDNuS1RXRUMzU0ZmZ2dEUFdzQzV1Znl1?=
 =?utf-8?B?VUo5aDhKTnR4aHorK3ZPamRFNWYrMFZrZVg5Y2plRzF6K3BLYVJpZGNrQWhU?=
 =?utf-8?B?elRKRjlHY1l1ZDFMSTRXZjhPZlJXWVZOT21maU5pZnE0N0JSVmF4WE5ub2x4?=
 =?utf-8?B?MkFVakxWS2RRZG1hdC9KT3RteGxYeXJmT2l5MnVUSGp6eXhNeS9NRE96aWRv?=
 =?utf-8?B?K3JKYklpQXUrUy9FRktnMTVpanErTE8zcG9VbGRXbndxYjhIeU9KZ3Z4VnFm?=
 =?utf-8?B?MERVTkoxc1d1QjZ3c2dIYlBPeDYwclR2cENwckJzbGVoSU0vQWdTOTd2VGdY?=
 =?utf-8?B?RDVNeWtuYXJ5NGI1U0J1VEFTbklVN1JRcXNUeUNqd3M3VVBQSUFpUUc2OTBP?=
 =?utf-8?B?QnE1Q3RVYmttdEMwUFk3YlNMSDZ5TXJ6dk56MlJrMVVyYS9XRTdsWVpUTVMw?=
 =?utf-8?B?d0lpOTZtREN6NnlpSUtCaGZKbVptTnUrSUpnVXlReVdtVXJuM0NWc2JOaXRY?=
 =?utf-8?B?MXFGV1lPcFZBY2hKUy9CRXkwYjJHUTcrenk1bXhwMnlTU3lCM0NieTJuTFQ0?=
 =?utf-8?B?Mm9vczgrV3JSd0lkZlJxTU95cVo2dDRYTjZUQnc5SVBySGtJOGQ1eWR1Mnh4?=
 =?utf-8?B?TXlxdDhRMENjcDZjUlhaSEV0M0Y0Qm1zNGJneU0yc0tIQlAyQ2hXNVNVZ0Nl?=
 =?utf-8?B?RmdjUTY5dXRHb2ZyTE40UWZQNGYzWUpHdzJXUVNVazZjS3E5elQ0Y3V5VW1H?=
 =?utf-8?B?aU9sRVJCbVQ4UGJYOEVkTUZYSVNuQXJMTmJnSENsTWMyYjNIRkdFV2lQQUNm?=
 =?utf-8?B?MmM0V2xRbmd3aExVL0dZbmgrV3gwMC9GdTVyR3oxaFJnS0c1b0V4SWsxUEJX?=
 =?utf-8?B?bEpyL21hY2VkaGVrS1pxaFpVQUlQWStEMUJEUWVwczkwOXpvNDVCV2ZwZ2JS?=
 =?utf-8?B?UW0vNy92NWxIQzVOMUJNRkRVTk1MeStyMjIxdi9SbzZjdElzNzUyL3g4SDIr?=
 =?utf-8?B?bVcxYlJDSVJjT0VweVZpTlV5OHdPUEhuWERoTkZsQ0RKWjRoSEpVeEsreER6?=
 =?utf-8?B?aFRmd2dWS29FR3VpVDlFMEJycHRtTGpDSC93Wkh0ZGQ1YzlFYVhQYUtHZEN3?=
 =?utf-8?B?eDRvd3BtVXJXcVgwaHg4NUtobkVWMjMyU2FPTmpzeDNKbHdVRFJsQT09?=
X-Exchange-RoutingPolicyChecked: bUGy+qy2HjDLzybp4kN3AwcPqWvzZnUsYhKdPnW3v8x8kFq3jZyaZ9lNOvQWUMEudIYMT3L6m5M7YPwkN8cvyxihMzYKrQUzOKZX/AuS2vXbcp33CQ3+7qPa4usCEoj3DDV9m0ilcsA6IVGq2iWnYHpJbxL5qmwvXEgkIrafMLnYexAn0v5k9ouh8sXsuax3ih4iX0WirPE0OAnKVUw0x7ThKZF/z9sC1kIqBD+X4+cFX809X+r/Vo0PEqFajcvBaBonTXjn0hnYvPC3jVT+aKNMuNMP08fEVYdfjjAOgRFkxOeTfIiOvtd9f3pWT2a1BPimxLAmmxECk+yjirH5Vw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe35cba-22df-43fa-eada-08df159437c7
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 14:50:45.2816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Cdp8QIfzNzqq/FxcnKNXoGncqaCV0lGUemrGIGZIOp3cPDtBharbhXvn2ScY64ON+XksnsZfOBewyN2/BEmmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4839
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

On Fri, Sep 18, 2026 at 01:01:30PM +0200, Marcin Bernatowicz wrote:
> When VFs are enabled on dGFX the driver resizes the PF VF_LMEM_BAR to
> fit the requested layout. After VFs are disabled the PF VF BAR
> size is left as-is. On platforms with tight MMIO apertures a
> subsequent unplug/rescan followed by another enable may fail with:
> 
>   "VF BAR …: can't assign; no space"
> 
> because the PCI core reserves address space based on the (now large) VF
> template, often multiplied by totalvfs.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5937
> Fixes: 94eae6ee4c2d ("drm/xe/pf: Set VF LMEM BAR size")
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> ---
> v4:
>  - use directly pf_resize_vf_vram_bar helper with device_total_vfs value.
> v3:
>  - rebased to resolve conflicts, no other functional changes were done
> v2:
>  - Rename helper to restore_vf_vram_bar_size() (Michal)
>  - Use xe->sriov.pf.device_total_vfs instead of pci_sriov_get_totalvfs(),
>    which may be capped (Michal)
>  - Switch logging to %pe (Michal)
>  - Call restore unconditionally on enable-fail path (Michal)
>    (drop vf_vram_bar_resized flag)
> ---
> ---
>  drivers/gpu/drm/xe/xe_pci_sriov.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index c023a2a1fc17..31abcee55211 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -177,6 +177,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  	return num_vfs;
>  
>  failed:
> +	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);

should we resize before unprovisioning?
or it doesn't even matter at this point?!

>  	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
>  	xe_pm_runtime_put(xe);
>  	pf_finish_vfs_enabling(xe);
> @@ -204,6 +205,8 @@ static int pf_disable_vfs(struct xe_device *xe)
>  
>  	pci_disable_sriov(pdev);
>  
> +	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);

I just noticed that no users of this function handles the error.
Should we convert it to void? (I see it already prints some messages,
so not needed to duplicate anywhere)

this is not a blocker and if the order above is okay:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +
>  	xe_sriov_pf_reprovision_default(xe);
>  
>  	pf_reset_vfs(xe, num_vfs);
> -- 
> 2.43.0
> 
