Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20926D116F5
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 21:32:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59EB10E6DF;
	Tue,  2 Dec 2025 21:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fUNwUVVc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5861410E6DF
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 21:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764711119; x=1796247119;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vOdCVMMzzKLMcLTD+y9oGcAnuMY+A6UUnRZoNPhNgEI=;
 b=fUNwUVVcqgl6Esy0EALGtvfdNpWquPEULyyk/oiWRR8ehANl1h1GTPq0
 tX90NoMLf0t2LS/WvF4Y0DB+BdMWmmXxQokxc4hGnFmJdAkIub2KLtqEA
 jQYaSGTA7qNyhXRwJEgefOhr94SKFOkCnvMK+5xlsQvf9AykJqtZNHCI8
 Fh+fw2kdEclq3BlXT5ZgDedDPfK6fKIZlggLykDEgm5ljFF1qhEfoMRFU
 Sg6paV68Z5ogjDPMcliTlGm9qNDBYO9lzZtZ4hNlb5e00FcHTv4AfRktn
 ha/hFdi+JJ7sGUX+QDhgFME+7Sqx+BIEf7g6/zfM9F08mhtR/Pl5yWHjV A==;
X-CSE-ConnectionGUID: IS0VnJ7/ShG/WEtZuuO3Uw==
X-CSE-MsgGUID: CgZKIsoaTmGn4v+OVhVILQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70312954"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="70312954"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:31:59 -0800
X-CSE-ConnectionGUID: w3HTjQsXSUugrY5+PENGjg==
X-CSE-MsgGUID: RqxOScABTZm4V/l1O8LFBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="199615603"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:32:00 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:31:58 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 13:31:58 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:31:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zd/novPYWdCAfIAkWa2pdgyTk9+B1fSFZVnGCa4M5fE18l3MZAM0Aw51vnb+357oQqOOqiVSu2UJ0VZlXggXNjKcqv32/FRUVxNqWhtVoodutgNO74coBLrG/20wyYF+b8LyK+vRtVraMmVljxYV4/G2uXuV697k35TvgfGgaCM4OsaekZ83Zzc1KloTSzErRunGpRWfl25Xz+72f2KAueW+AnppJTaIfNbBQzc5YDUyQJ7EdLXm6GP6oK5b6FbVJXZdIm9GvuKZ4n8Fn45PQuiy/cP5zVpzR94ZFHtFOzj1vf62wYSVYlg9jAQb0cx5axzl1PSf6OlLVuLtOLahYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyUlx0fepx/2yTsq6qWYmLQu2IUqWPB/hQhUkVuhUl0=;
 b=i+9iiR2p/+8NkjgJUqHT6WsUcfL/jqzKcBXhgK+2ChkH03BOLg58gWoah22j19DbLT+WNYQ9nm5zx7q7uemiojTLTKHJxYuUVndJzV96u2EhWrtaYZsiKPXYDjFYNv4sIgUsbwfuqvmUAFbzIrJ0Vd6+sk0WRSsOfs6vH3f8EwKjbH+bW2tK6a7ZTnVT/URc9LrgwGPJpHQ/sS3HDpN2XegkEfHIqhma1QNzHbZ0/uswe4kbCAcNkZc27lAiLSqwjyI70lhtKxAPEWlFBSwNZkkG+usI9XGmbefRr77mKG25sZHA02KFYqAkqgLf/IZDIltvNYV4ybG0nNupJDPNww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW4PR11MB6840.namprd11.prod.outlook.com (2603:10b6:303:222::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 21:31:46 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 21:31:46 +0000
Message-ID: <f4dc11d9-442f-48e1-806c-1451dd4fced6@intel.com>
Date: Tue, 2 Dec 2025 22:31:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] drm/xe/sriov: Add debugfs with scheduler groups
 information
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-18-daniele.ceraolospurio@intel.com>
 <f702edc8-b8b0-4c8e-abd9-5ff017b6c896@intel.com>
 <9993fbe8-fd20-48cf-b82d-b0c070c1d5a0@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <9993fbe8-fd20-48cf-b82d-b0c070c1d5a0@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0502CA0011.eurprd05.prod.outlook.com
 (2603:10a6:803:1::24) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW4PR11MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: f7d52f35-acd5-4a88-ee34-08de31ea31cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Uks4OHEwSGtzWGQ0YjVvL0paNDlBQ1F5WFprMUV1eHI5b3ZQUmkxVzJldC9s?=
 =?utf-8?B?dkR3YnFPOUFjSUk3cm1RMTJnak1NUU1WdnNQMHJPbENsWFRIdTlxMlZPbU12?=
 =?utf-8?B?a0tMaGN6REk0RTFjQmFIS0orMFRkemNrQkpYdUtHeDZ6cWNDazZFVTRTUVE4?=
 =?utf-8?B?QnR3WUFHYnRwUFNPZ2U2UUU5b0FIUERyemovbFFQQU1EVmFBNmVyUkExRFFq?=
 =?utf-8?B?S05BdS9PcC9LUWhtb0lCd0ptWlpDNW1xNElkU1FpSy82U2x5dmZ3RW5zSnZr?=
 =?utf-8?B?c0k1ZFROc2lkMjRQYkFRdGc4YkVVUHFoL2UzS1ZoT2hnTndNeVBsYmhvenlC?=
 =?utf-8?B?OFRocWtVNTdoaW1DYjZIWGx5VFFlcS9WWHp2aEpIWWtLbEVKTHlURnFYSlcz?=
 =?utf-8?B?Y1U5YjhmNnBQeXljL3QwZUcxcGN0aWZZOVZYcitRRmlOY3F3bE5wSmZDN2Z1?=
 =?utf-8?B?ZmR5Z1lRM3lQR3VERzl5SE8vNDlGNHBaaEY5UHY4MmZuTW5ac1FpWjBFN1gx?=
 =?utf-8?B?VXVsTEFKQU9VU1QzMGNHUWZYUCtucXFjTGllWE5SeGtiamhhRk0wVHVzeUlP?=
 =?utf-8?B?aGJuU1NveHdRQVBrVjNYZEhPbjFtQTBhY2NpSjU5Z0ZyTy9KaTVOa1I2aFdy?=
 =?utf-8?B?a0x6N0lrQ1RENlAxUVVKUkU1THhkdGJZdWRPV1o4MkJKVGZ2RmFJSHJWWld2?=
 =?utf-8?B?RTZnSkJONHM4L3FTRG9Ja1JNQnU2RmhrSllvcEpHdGJQdE51Q3B4Y1J3QnlZ?=
 =?utf-8?B?bGFCeWpXT0QzR3JWSzE3cFRWV05KMERNZDRxQmY0SWQrUWNTdlVTaTlyOWJL?=
 =?utf-8?B?R3Ntemt4RG5JczUwNjRsRU5tY2NhY2VoMWNlS1JMOHNMT3VTbXlTS3NLQXY1?=
 =?utf-8?B?VWNuSzFhbVcrckdFaWZ5MnIyUjVKQ29jbVpBRExoaXREWHdCa0FxK1FKNUFw?=
 =?utf-8?B?Q3A2Ti9Sd25jZzI1RWJwZTFlbTZvSERYbG5CbWhxWU1kSzFWd3BiMEFyaTdY?=
 =?utf-8?B?RHg2WUhHK2tTZnZkMXRubjI1cEdjdXN2dWI4QWhYU1lTZXJEUDFwK3NpUG5j?=
 =?utf-8?B?V2tiZUFlQitwZFE1V0lKVnBZbmdMTHhFNVRHUElIVkprZGVKNER0c2hkVTNu?=
 =?utf-8?B?OVhMUWgwNHRoOW4vWGlwZCtPQjBhWjJhT1cxQjJwNDJ4ZU5zT01aN212dmV1?=
 =?utf-8?B?NkdPM2NYYVVFVml3d0tqQ0U4aVpkcVcrRnUxaDRIYWVxOW53OEE1VTRTbjBV?=
 =?utf-8?B?SlFST1hyWHBUdWxiLzV1aVZrSllxZkNQVWYrL1I1c3IyQUxRMnBGbE1hUnZn?=
 =?utf-8?B?RG16d1FmQ3pKZnc1WXdJQm01aGZuRjJldHlqd3I2cjNQWHZjekc4R2VCZHRV?=
 =?utf-8?B?VWdGVWpaWDJtQ1BjOGxCMEFjd1h2KzBiditvZWYvNGt5QllMU3UrL1hvaHNS?=
 =?utf-8?B?OERXY2N3b1p5R2tBN1NBVmlJUSs3QkZQRTFUbVpqby96M3dCbTlyMUd6Z2hS?=
 =?utf-8?B?Y1YyMm80Z1h6S0Q2Z1YzNzkwb3VDR2I0TEM1NVU1NGh0TDc5N05vSWFaSk1B?=
 =?utf-8?B?TStsaVFvcGE0WUNkeHZYS2pobmNIUVdJSzUvTDR4SkZtTzNLSjhEZkVsbjFM?=
 =?utf-8?B?VENHZTlvNi9HNk5CWWNkQ1FtVlZZNVVGTFo5cExnSyt4VWRYc0o0YmVEdlN0?=
 =?utf-8?B?R0o2VHhqVUhpV2tLSkdDbTFpcUljT2dIK1F0dGFJelBhYVhYYm9lVzRndWFL?=
 =?utf-8?B?dGNyVjkwWkZtcDdtOWFGenRybHg1d1NVcXFpeHhuVlR3cDdsRy9jTnpqb0Np?=
 =?utf-8?B?NjRqdzJvVE1DektiZ3BWT1NNVW9NSWZ1S2FuajFtL29tQmZzdXV5aDdCMHgy?=
 =?utf-8?B?UEhWMThkR2E1aDZlekpjaE00NHJDYXpYU0h2YUEza3BTRmhYUklHNm5LSEVr?=
 =?utf-8?Q?eUtRjhWktnr3nUv12wiGskJZ09WQhSgG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mzc1dEhQN1NhbUIxNE5Fd3k2bnpDSVB1cVlnNGZ5Z1BDNzRBOWt6TWlKQWJu?=
 =?utf-8?B?dENhcExBTE9HVlZWRkdqSU9mRFN6UTF2a1FBeW4xQkVYV28xNWRjTWVCMTd3?=
 =?utf-8?B?ODFFUVM4b20wMVlZdXJJUGJERjVkN0pTajVVbGRMSDBib0cvOFlvMk5BZ2xM?=
 =?utf-8?B?VEdMVExkODRUNDBpN3dtamdYOStnM3BHTEFqSUJpMldYQno4T2UveWlIYU04?=
 =?utf-8?B?dFJ0RC93Ynp3aWRyR0thYXhnS3dYZWpacFJRYVQ5NnBHdVlRSmN2UjNzTkQx?=
 =?utf-8?B?SVlrWVNpelc5OHVFckNiUkI1dGdRSmpZdUF5VC9tTHJRM3hJSzJhZUpNL2hN?=
 =?utf-8?B?NWdRT2Fpak5uWk8xUjIzMGw4YXFQWFI3MkZuazdhRmFlNjJ2N3RlVmE3ZkZE?=
 =?utf-8?B?UTl0NjVkVzB1RW1UT3AreU1hYzZwRk9nM3pzaDY0WkN3dCtCNTR2QURpNXgw?=
 =?utf-8?B?K0hoRGdpTkdlV3RRdU03RFY4TXNYM2ROWGVqVU5EbCtmUzlHWWdQWDNIN0FH?=
 =?utf-8?B?dUZxeWRPaTdWc0Ewd1dEMkVRT0FRWGxoSy9DdXprOVB3OTJQMnBkMU1QUnBs?=
 =?utf-8?B?TFJuUEphSUx3eEtSNE9nNjhQMDROVWxxTUl3eThzcWZjc0plZlNjbThPRGxC?=
 =?utf-8?B?VFpZMXVya0VHcEczUiswK2d4cFo4L2M4VDhzSlBZeDZ0SlAyU09uVEZUaTRN?=
 =?utf-8?B?Ry9kNjhuQ1NMdHlZZVNiL0tUd045dTJEQ2xmTHhyRVppUEwzNDJzcis1Nzlr?=
 =?utf-8?B?WWdhcjN5SXdHOXg0SklqYlIrcDNoQVVBbmNQbDZQZ2QyamtZUTExNjgwV05l?=
 =?utf-8?B?NXlZTUJnaGhyeWxDOWxORERwUGlxNjJGWXBNeUVNb3hQQjFUa3NTUHk5Q00w?=
 =?utf-8?B?ZGIyWFpSRUYwTnhwbHBjQk5ibUVOOEZlbmdxdW1SWHBBbnFqbXhOYzE3Y0NK?=
 =?utf-8?B?Vm9hVXhKL202WW1SZjhteUFZM01vQ2xxclIwYXhXamdpcHBPQ1dhako3eUNN?=
 =?utf-8?B?M0hETTI4djcyOE9YT29waUJUU0tMR0JuM1ozSWRYMWI3bUo2ZmgwSmFndCta?=
 =?utf-8?B?bHJBOE0wTFg0ZVZKRkJpbS90dHA3TVFBZEFZUDlpbHRFUzRKUHZRK29aaDY4?=
 =?utf-8?B?VU9EVHkzRktIUzdwR09mUFM2cmxFZ0tPS2ZMVVhjaEE1UzhGVXd2VWdCWlBt?=
 =?utf-8?B?QVBMaWJPSUZrZUZTbko4WlpCN25TMUQrMG1QZmVmd044RzgyeFJsTE5pV3Zn?=
 =?utf-8?B?YmtGMXFEcmtJWXdUMk5Nc2pPTXUxQm9RK2FNWDdPTVRlTjlLWHpVYlk1dW9T?=
 =?utf-8?B?Y1JQWm9LbW1oQlVPM0RWV2VKTjZMSnZjTWxpZVI0TnBNbmd4Tk10VUZPWmx2?=
 =?utf-8?B?UnAvbE5Ka2FsQ1NJeWQyZUdPQkk0TGl6NDkxT2pEMHJDTmN2ckNXMk5TNVgz?=
 =?utf-8?B?Tm1lM1J4NkZWUWR0UU1mNHEyam1VNi9CdVBkVWk4aFBGK0VZckYrcTVIdjgx?=
 =?utf-8?B?MlZzU0o4amRBNlE3UnNuWHJjODZTVzJkc0tYZjFYeVUxNmRqWmdMNjFFcjBN?=
 =?utf-8?B?aDlTMkRZbUZiU1dEbjNKZVJOK3p6WkF0eWZ5SG5jOGFzeFU3eW1EZU9aWEpa?=
 =?utf-8?B?SVlLbFRCWlpQQ1ZsMko5K0d2MFM5eUVRUDRTVlJtcFVyMCtXa2lETjVSWGh4?=
 =?utf-8?B?Z1Q0YWRTWE9EVy9PMmFSKzV2Zkl4Ny9uRDNUelBXWkFDaVN0dmV3bFIyT1p0?=
 =?utf-8?B?dkhDaXNZenRDUTJZclRNVEowRVExcHFKSWtzeDdDS2R1bEZSd0pqY1FpaS9N?=
 =?utf-8?B?UW1DcDBlcXl3UnVOSURyVUZKK0kyNWhkVmZOYUxLU0pSTld2K0I4U1NLRHZJ?=
 =?utf-8?B?aG4zdm9PbWlMejFRYTN3YVRhUFNobXJuUXMrNXJUUGwwUnNLT2dJNFlTdHNZ?=
 =?utf-8?B?SXFMKzJaNWpSVW9xYURJZkUyNGxpa01rODMyOUhqLzFQTEhjOHJDc2ljNjdQ?=
 =?utf-8?B?dUk1akpLN0JvYXFVeXBobjhEQ1JPUjVkb2l3d2wzMVhkKytWVG1sYkZ0U2VF?=
 =?utf-8?B?MGlKS2VtMEtFcHR2dnFaWXExWE1JdzNJRW1mOUVMek03ekNMREF5Wjdpa2pj?=
 =?utf-8?B?UGtYdGp5U0I2UHN4ZUhuWUF2WFRYZjZFQXgyc2tqdGdHdWd2eTR5UmtFMEhE?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7d52f35-acd5-4a88-ee34-08de31ea31cf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 21:31:46.2073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YrFZoUUudlZ1l7pdIrIzHsjW1KMx6hxEO+XpeQoSATEiPRFYgqMN6tmR8MdBRJGMppVs7TGvThaY7tLuxsCj18EgEwUu+n7NKQY9ixgdgek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6840
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



On 12/2/2025 7:20 PM, Daniele Ceraolo Spurio wrote:
> 
> 
> On 12/2/2025 8:24 AM, Michal Wajdeczko wrote:
>>
>> On 11/27/2025 2:45 AM, Daniele Ceraolo Spurio wrote:
>>> When schedulers groups are enabled, we dynamically create new debugfs
>>> folders under the GT folder for the PF and each VF. The aim is to have
>> hmm, but since this is debugfs and groups (even uninitialized) still exist
>> then maybe it is easier (and safer) to create static list of groups (8 or 2)
>> and just print their configurations: either empty (if uninitialized) or with
>> engine names (after selecting predefined EGS mode)
> 
> ok
> 
>>
>> then debugfs files (not directories) will reflect currently used configuration
> 
> See below about the directories
> 
>>
>>> all the info for each VF under the sched_groups folder, with individual
>>> folders per-group under it. Right now the only info is the engine list,
>>> but follow up patches will add execution quantum and preemption timeout
>>> as well (which are configurable per-group-per-VF).
>> but groups EQ/PT configuration is not per-group, but only per-GT (GuC)
>> so it should be OK to have them level up
> 
> ok
> 
>>
>>> Note that the engine lists are not configurable per-VF and therefore not
>>> strictly needed in the VF folders. However, it is still useful to have
>>> them there because an admin might want to check the engine list while
>>> configuring the EQ/PT values for a specific VF.
>> duplicating RO entries per-VF seems odd, maybe it's better to use symlinks:
>>
>>
>> /sys/kernel/debug/dri/BDF/
>> ├── sriov
>> :   ├── pf
>>      :   ├── tile0
>>          :   ├── gt0
>>              :   ├── sched_groups_mode            # disabled [media_slices]
>>                  ├── sched_groups_exec_quantums_ms    # 20 20
>>                  ├── sched_groups_preempt_timeouts_us    # 2000 2000
>>                  ├── sched_groups
>>                  :   ├── group0                # vcs0 vcs1 vecs0
>>                  :   ├── group1                # vcs2 vcs3 vecs1
>>                  :   ├── group2                #
>>                      :
>>                      └── group7
>>      ├── vf1
>>      :   ├── tile0
>>          :   ├── gt0
>>                  ├── sched_groups_exec_quantums_ms    # 30 30
>>                  ├── sched_groups_preempt_timeouts_us    # 3000 3000
>>                  ├── sched_groups --> ../../../pf/tile0/gt0/sched_groups
>>
>>      ├── vf2
>>      :   ├── tile0
>>          :   ├── gt0
>>                  ├── sched_groups_exec_quantums_ms    # 40 40
>>                  ├── sched_groups_preempt_timeouts_us    # 4000 4000
>>                  ├── sched_groups --> ../../../pf/tile0/gt0/sched_groups
> 
> My idea here was to have exec quantum and preempt timeout configurable for a single group, so the end result would be something like this for PF and each VF:
> 
>         :   ├── gt1
>         :   ├── sched_groups
>             :   ├── group0
>             :   ├── engines
>                 ├── exec_quantum_ms
>                 └── preempt_timeout_us
>             :
>             └── groupN
>                 ├── engines
>                 ├── exec_quantum_ms
>                 └── preempt_timeout_us
> 
> 
> Which only works if groups are folders (which is also why I can't symlink the whole sched_groups folder). If you think that's overkill

yes, since GuC does not expose it, so why bother?

this whole EGS feature requires some experienced admin who should already know configs for all groups

> and that we should just keep the option to set all the groups at once then I can do that and not have folders. I can also just drop the engine lists from VF debufs, my idea here was that if an admin is setting the EQ/PT e.g. for VF1 group 1 from within the VF debugfs folder it might be useful to have a way to check which engines are in the group without having to go back to the PF folder, but it's not really an essential thing.

this useful hint how the groups look like can be done by symlink (which is also to some extend overkill, since it points to well know location)

my point is that we should expose only minimal set of files that are actually needed to exposes all required information

creating files with redundant info will just cause more test code to be developed ;)

> 
> 
>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 140 +++++++++++++++++++-
>>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h   |   4 +
>>>   2 files changed, 143 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>>> index 2953ef21a5ad..947e2b92d58a 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>>> @@ -5,6 +5,7 @@
>>>     #include <linux/debugfs.h>
>>>   +#include <drm/drm_managed.h>
>>>   #include <drm/drm_print.h>
>>>   #include <drm/drm_debugfs.h>
>>>   @@ -21,6 +22,7 @@
>>>   #include "xe_gt_sriov_pf_monitor.h"
>>>   #include "xe_gt_sriov_pf_policy.h"
>>>   #include "xe_gt_sriov_pf_service.h"
>>> +#include "xe_guc.h"
>>>   #include "xe_pm.h"
>>>   #include "xe_sriov_pf.h"
>>>   #include "xe_sriov_pf_provision.h"
>>> @@ -162,8 +164,127 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
>>>    *          :   ├── tile0
>>>    *              :   ├── gt0
>>>    *                  :   ├── sched_groups_mode
>>> + *                      ├── sched_groups
>>> + *                      :   ├── group0
>>> + *                          :   └── engines
>>> + *                          :
>>> + *                          └── groupN
>>> + *          :                   └── engines
>>> + *          ├── vf1
>>> + *          :   ├── tile0
>>> + *              :   ├── gt0
>>> + *                  :   ├── sched_groups
>>> + *                      :   ├── group0
>>> + *                          :   └── engines
>>>    */
>>>   +struct sched_group_info {
>>> +    struct xe_gt *gt;
>> we should be able to get gt and vfid from parents d_inode->i_private
> 
> In this implementation the parent of the engines folder is groupX, and that one doesn't have that info in d_inode->i_private. Might change if we drop the subfolders.

but grand-parent or grand-grand parent will eventually have expected priv data (and since we know the structure we should know how deep to search)

> 
> Daniele
> 
>>
>>> +    u32 *masks;
>>> +};
>>> +
>>> +static int sched_group_engines_info(struct seq_file *m, void *data)
>>> +{
>>> +    struct drm_printer p = drm_seq_file_printer(m);
>>> +    struct sched_group_info *gi = m->private;
>>> +    struct xe_gt *gt = gi->gt;
>>> +    struct xe_hw_engine *hwe;
>>> +    enum xe_hw_engine_id id;
>>> +    bool first = true;
>>> +
>>> +    for_each_hw_engine(hwe, gt, id) {
>>> +        u8 guc_class = xe_engine_class_to_guc_class(hwe->class);
>>> +        u32 mask = gi->masks[guc_class];
>>> +
>>> +        if (mask & BIT(hwe->logical_instance)) {
>>> +            drm_printf(&p, "%s%s", first ? "" : " ", hwe->name);
>>> +
>>> +            first = false;
>>> +        }
>>> +    }
>>> +
>>> +    drm_printf(&p, "\n");
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int sched_group_engines_open(struct inode *inode, struct file *file)
>>> +{
>>> +    return single_open(file, sched_group_engines_info, inode->i_private);
>>> +}
>>> +
>>> +static const struct file_operations sched_group_engines_fops = {
>>> +    .owner = THIS_MODULE,
>>> +    .open = sched_group_engines_open,
>>> +    .read = seq_read,
>>> +    .llseek = seq_lseek,
>>> +    .release = single_release,
>>> +};
>>> +
>>> +static void __sched_group_info_cleanup(struct xe_gt *gt, struct dentry *dent)
>>> +{
>>> +    if (dent->d_inode->i_private)
>>> +        drmm_kfree(&gt_to_xe(gt)->drm, dent->d_inode->i_private);
>>> +
>>> +    debugfs_remove_recursive(dent);
>>> +}
>>> +
>>> +#define GROUP_INFO_ROOT "sched_groups"
>>> +static void sched_group_info_register(struct xe_gt *gt, unsigned int vfid)
>>> +{
>>> +    struct xe_gt_sriov_pf_policy *policy = &gt->sriov.pf.policy;
>>> +    u32 mode = policy->guc.sched_groups.current_mode;
>>> +    u8 num_groups = policy->guc.sched_groups.modes[mode].num_masks / GUC_MAX_ENGINE_CLASSES;
>>> +    struct sched_group_info *infos;
>>> +    struct dentry *parent;
>>> +    struct dentry *old;
>>> +    u8 g;
>>> +
>>> +    if (!gt->sriov.pf.debugfs_roots)
>>> +        return;
>>> +
>>> +    /* remove existing debugfs entries for old groups */
>>> +    old = debugfs_lookup(GROUP_INFO_ROOT, gt->sriov.pf.debugfs_roots[vfid]);
>>> +    if (old)
>>> +        __sched_group_info_cleanup(gt, old);
>>> +
>>> +    /* re-create debugfs for new groups (if any)*/
>>> +    if (!num_groups)
>>> +        return;
>>> +
>>> +    parent = debugfs_create_dir(GROUP_INFO_ROOT, gt->sriov.pf.debugfs_roots[vfid]);
>>> +    if (IS_ERR(parent))
>>> +        return;
>>> +
>>> +    infos = drmm_kzalloc(&gt_to_xe(gt)->drm, sizeof(*infos) * num_groups, GFP_KERNEL);
>>> +    if (!infos)
>>> +        goto out_err;
>>> +    parent->d_inode->i_private = infos;
>>> +
>>> +    for (g = 0; g < num_groups; g++) {
>>> +        struct sched_group_info *info = &infos[g];
>>> +        u32 base = g * GUC_MAX_ENGINE_CLASSES;
>>> +        struct dentry *dent;
>>> +        char name[10];
>>> +
>>> +        snprintf(name, sizeof(name), "group%u", g);
>>> +        dent = debugfs_create_dir(name, parent);
>>> +        if (IS_ERR(dent))
>>> +            goto out_err;
>>> +
>>> +        info->gt = gt;
>>> +        info->masks = &policy->guc.sched_groups.modes[mode].masks[base];
>>> +
>>> +        dent->d_inode->i_private = info;
>>> +        debugfs_create_file("engines", 0644, dent, info, &sched_group_engines_fops);
>>> +    }
>>> +
>>> +    return;
>>> +
>>> +out_err:
>>> +    __sched_group_info_cleanup(gt, parent);
>>> +}
>>> +
>>>   static const char *sched_group_mode_to_string(enum xe_sriov_sched_group_modes mode)
>>>   {
>>>       switch (mode) {
>>> @@ -220,7 +341,7 @@ static ssize_t sched_groups_write(struct file *file, const char __user *ubuf,
>>>       struct xe_gt *gt = extract_gt(file_inode(file)->i_private);
>>>       char name[32];
>>>       int ret;
>>> -    int m;
>>> +    int m, i;
>>>         if (*pos)
>>>           return -ESPIPE;
>>> @@ -250,6 +371,10 @@ static ssize_t sched_groups_write(struct file *file, const char __user *ubuf,
>>>       ret = xe_gt_sriov_pf_policy_set_sched_groups_mode(gt, m);
>>>       xe_pm_runtime_put(gt_to_xe(gt));
>>>   +    if (!ret)
>>> +        for (i = 0; i <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)); i++)
>>> +            sched_group_info_register(gt, i);
>>> +
>>>       return (ret < 0) ? ret : size;
>>>   }
>>>   @@ -693,6 +818,19 @@ void xe_gt_sriov_pf_debugfs_populate(struct xe_gt *gt, struct dentry *parent, un
>>>           return;
>>>       dent->d_inode->i_private = gt;
>>>   +    /*
>>> +     * we allocate an array to store the GT-level dentries for PF and all
>>> +     * VFs when creating the PF folder. Failing to create this allocation
>>> +     * is not fatal.
>>> +     */
>>> +    if (vfid == 0)
>>> +        gt->sriov.pf.debugfs_roots =
>>> +            drmm_kcalloc(&gt_to_xe(gt)->drm,
>>> +                     1 + xe_sriov_pf_get_totalvfs(gt_to_xe(gt)),
>>> +                     sizeof(struct dentry *), GFP_KERNEL);
>>> +    if (gt->sriov.pf.debugfs_roots)
>>> +        gt->sriov.pf.debugfs_roots[vfid] = dent;
>> for per-VF data we have struct xe_gt_sriov_metadata that can be accessed from
>> struct xe_gt_sriov_pf
>>
>> but maybe it shouldn't be needed at all if we create static egs files as
>> suggested above
>>
>>
>>> +
>>>       xe_gt_assert(gt, extract_gt(dent) == gt);
>>>       xe_gt_assert(gt, extract_vfid(dent) == vfid);
>>>   diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
>>> index 667b8310478d..747ec5dae652 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
>>> @@ -15,6 +15,8 @@
>>>   #include "xe_gt_sriov_pf_policy_types.h"
>>>   #include "xe_gt_sriov_pf_service_types.h"
>>>   +struct dentry;
>>> +
>>>   /**
>>>    * struct xe_gt_sriov_metadata - GT level per-VF metadata.
>>>    */
>>> @@ -52,6 +54,7 @@ struct xe_gt_sriov_pf_workers {
>>>    * @migration: migration data.
>>>    * @spare: PF-only provisioning configuration.
>>>    * @vfs: metadata for all VFs.
>>> + * @debugfs_root: GT debugfs root for all VFs.
>>>    */
>>>   struct xe_gt_sriov_pf {
>>>       struct xe_gt_sriov_pf_workers workers;
>>> @@ -60,6 +63,7 @@ struct xe_gt_sriov_pf {
>>>       struct xe_gt_sriov_pf_policy policy;
>>>       struct xe_gt_sriov_spare_config spare;
>>>       struct xe_gt_sriov_metadata *vfs;
>>> +    struct dentry **debugfs_roots;
>>>   };
>>>     #endif
> 

