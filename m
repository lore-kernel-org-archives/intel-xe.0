Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E53DC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 20:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C636112D52;
	Mon, 22 Apr 2024 20:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nXGr6jE7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812E5112D52
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 20:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713817708; x=1745353708;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xAcmT2idrmIMSQ6RmSn56rNc3F317u2ZmKW21PKPIyw=;
 b=nXGr6jE7xMkO0eoEgWcRvUoFMTxUMrEGvnSn3G8xZWz+cAunVPPSg5T/
 HQaOsbPXY6wEWcrHTBMzKTNnvdDdxyeiLKix8BB0Dhde8Xb0qsAzafu06
 tnn3hUP/P5q8vH4ASu1NNH577Ktil3/PODGJmcYH7cUisghqORX6zpT09
 1EXmp4f5Or8DZ6BhY6cLJL0GCM+/aF/VI/SyKavYHFr/0XPmDboMKuhss
 lqpgX1rs7SivTyLHXWbkxHJTOeRO04oVuUoAl5jH6U05B2crboqcqAcIT
 G3S0eUVX5fRNwE2ni0lq8qd6yZYMg5ApTS4kfzG6Or7yFku40Slr7M+AE w==;
X-CSE-ConnectionGUID: kYBjuqSFRUy6iSAeIT91mw==
X-CSE-MsgGUID: NSAd0tjjQGKxH7F3hzAwAg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20781028"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="20781028"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 13:28:27 -0700
X-CSE-ConnectionGUID: 30XN34FvQUyfqHbYZsICMQ==
X-CSE-MsgGUID: Y4fY/VI3SuST5ipGrE0pQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="28792254"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 13:28:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 13:28:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 13:28:26 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 13:28:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZhjl7r5vWzMHFF2YXnEpNCmD7h/OKQA2A7upwR8Oh+d7nf4QfK7SLJPbpmDCyETmpEoDGmVNpY1stktEWh4AssqscVmAzSzuUBSIXtka5AOrz3YM14lf22RMExfAbSESMEFC6kKgOZBhMuFGfr7elPC0I5zLrLGbb3yLBDVggVXfW6HttmIg+w3Q9oR77cXf8yx23/8/mDdmID7KNk/gMqm954SxoKCX87Udyy98fkytnqtaiFVCx2wvpbZc7+oCJW4c95Oy0PkMLc9mTUfqc+asaMNDjo21Cyw7sZgNdJBqYhR6pRY/XiywyG5H2L4/8as1sXoYf9jE0KxAB2cQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6cpoASkfnR8PZCN4BlrjHGBfTUdbr0OiwsIA4OLIP8=;
 b=GyILm6UhgMD6aaHYXpN31cD+LF7+FpxKWT4DbXHCP5lfmYaxPm1FN/BCTV28iZK0STk/+Us+IrJAiv0YpbPoeLwdJawO6Ca+bWHEk+xuLqGackeS0g/N+g/80ncmDIdOeWyM3nVF8z0MN5a/Q2AWIzo0fTJ3yfoOwYnar18GKMOvqO2kN9NtpJWvcPZZ1+Sj2AeqgDcqJqjZJY50345bQJmn8DzHIUk9RrLjPNEzeCnwB9pUvVWULxdetbqAYdV/00k3ypgoeOOqVEHMPqk9jWGcY/3bKJ0q1OtCTxKbhIHLRsYM+AfKySko8kuTGg87WJjtr53+vU5cmCo+flDPQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7034.namprd11.prod.outlook.com (2603:10b6:930:52::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Mon, 22 Apr
 2024 20:28:23 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 20:28:22 +0000
Date: Mon, 22 Apr 2024 16:28:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/pf: Expose SR-IOV policy settings over debugfs
Message-ID: <ZibIYmbbPuVSD26a@intel.com>
References: <20240418203442.226-1-michal.wajdeczko@intel.com>
 <20240418203442.226-4-michal.wajdeczko@intel.com>
 <Zia83fbRFA7XrXFh@intel.com>
 <3a6d8ca5-eb83-4c62-87cc-80bce1d04a4d@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a6d8ca5-eb83-4c62-87cc-80bce1d04a4d@intel.com>
X-ClientProxiedBy: SJ0PR05CA0123.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7034:EE_
X-MS-Office365-Filtering-Correlation-Id: 541268f8-a241-4e5d-bcfc-08dc630ac185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1NoaS9HOHB4MG1FZERzSW5JNkJqL1F1aHFHSkI2QitFdWpLbDY4ektKVnFt?=
 =?utf-8?B?UHRWdlc4SE1jclhQTEQvMjdtYlR6dS95ek8zWU1UTjBrQlRzRkVlcHFqcDcz?=
 =?utf-8?B?V1dFM2o3R2ZMdXRJTDZYcHhGSjdsbllkZmdmZ3p6RGEzaE41VnpGTytid0JW?=
 =?utf-8?B?eHJpVUJuTWprM3hFK2htOEN5dEVTK3Z4RGxMc2NpWTRneFBHSDRVbHpOOWty?=
 =?utf-8?B?a3loMGZEZWxWQVNrUnZvVkpVZGNHbWp1bzRGRGlLUHBwanZOU09VUG55YkpO?=
 =?utf-8?B?NDJibGpFOVd1WWVnRVZxbU95RTVYVkJuWS82bUw3c2hVaFFaM2pNRkRKeVA5?=
 =?utf-8?B?Mk4vcVl5OGJOMnYzVElkU1lPSWZzazBXempUVDBkTWZlc1VvV2Rna1Iyd2ht?=
 =?utf-8?B?YloybzJTWkdtby9RUXNjbmNyd2s0OWM4U3FSOW9vUk12aVZaUG1IaFA1bHo0?=
 =?utf-8?B?UUhQREpseCtYd1E3US96TVY4V3B4cWNadFVOTERINjNNYTFiOHplblNWb1l4?=
 =?utf-8?B?ODhYbUw2TjJqK2daVmtsL053OTRjU3A1SlJXRTY3K1FuZUVjYVV5OHVRMzJY?=
 =?utf-8?B?K1ljY255WTl3VlZqSHZzZjlTVDMzSHk3Smk4ZW9CZUdHcEl4b0hFU2xhd0M4?=
 =?utf-8?B?a214aG4rVWpYajdDZmNYWFhJWVV2L1lUMWxBOVVaOTR1dnBHMGJHTklzdENp?=
 =?utf-8?B?eHIxVStqRDVqZkV4UmlKRmpaNHhOOFQrcWNZT3FiY1dHTTAvRGFZSE83UUZr?=
 =?utf-8?B?emgxZjJEMjg1RjBXSDVzTTNLOGt6NjFTalZ3c0xBVTBVUVg4UEhyZFJ6WTlI?=
 =?utf-8?B?QW5sQzZsNTM3SEVNWDB0cjFYK2FGTElLYmtSaTd4Uk9YU21KVTl1SmxOTWxv?=
 =?utf-8?B?WWdTS3ZnL084N2hyZUZNekYxN2FHMDltd1pOWkpnWUt3SkpSRUd4OGVpRHND?=
 =?utf-8?B?QWcxTytMZm15RTgrRnVZSk5ZSWVHbm12RzZKMUl0SmtFMi9mRjhuWTJ2MjRt?=
 =?utf-8?B?QjBIOFF4bjhxUzNqelU5OGRGMktiNXM0aCtndzdDczhyVzBXY0FoMG1YUFhL?=
 =?utf-8?B?WUlxaEtRYTB2SksxcUJ4WkJ5alRqdnB5SzUvSmZ6cGJEWGswQlF4c01XNG10?=
 =?utf-8?B?OUxDL0lmWmVKeCs3a216U0VwaUFrUHNJNVh2MVYra0NHSGJvd2Z2bjdTM1Z1?=
 =?utf-8?B?N0VXMHN6WlRKY0FBMGY2SVc4Qm4rd0tuUFhpSnFKdmQ5Yjh5RXZDeUw5OW1v?=
 =?utf-8?B?bk9jWncvaW0wSTdxTFVWVDlWRTIzZGVJb2RDRzRSSTFZUE1kVElCeVI5STg2?=
 =?utf-8?B?cWthU24zM2xMdkh1QmVsbmN5L3ROLzdxZGNubEFzaXIwTTdkZ0N0R0IyTUli?=
 =?utf-8?B?alY5SDZ6RFp4TjlwbEpqT05mK1FhUzY2YlAwQ3ZuVGFPSGVia3BWREdSVFNM?=
 =?utf-8?B?L1Z1UjI1d0xHaVVsUHAxRVZEVjdERXRrRW0yWGx0dExjVThxK090OEpjRUVr?=
 =?utf-8?B?Q3B1WXJMTS84aVg0OUt6TzhrVU9OUXdTWDAxQithd2xpWWkrbjFlUDlmRnVF?=
 =?utf-8?B?alJQTFlUd0dUa3ZJa3NCempMUTV4MjdGTk5zeTZ2MGhySWlDZWlwcGZUdktk?=
 =?utf-8?B?b2ZpNmhPZng4UXI1Q0oxMlF5dUtUeEtZcXo5eWU4VkFsNVNDN3dKSkFrK0wy?=
 =?utf-8?B?aTUzUlo3cWVZSlZCZGd3Sk5xSXM2bHAzWjFteUE1dVVBdTFPUkxnVjh3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rng3OUZldVpUOER3ZnNXejIxa1RmcUU3SUQxRXEwTnh4Q0tWWk45ZXNNRmFj?=
 =?utf-8?B?MXRqZk9VWkIwb2lLaVY2MGZMTG5ka2o3cE51aWg0R1hIU2Z6Tnl0WHhsL1JE?=
 =?utf-8?B?TU1oSjBORnpoVTNOTFY3TFI0M091aklydnFZZjh4cVljdWNBWG5VNXBqelRH?=
 =?utf-8?B?TXc1NFhPTTNmcExVcm9vSG5Eb2Q5OWNiYlB5NzFWdzdsblh5ZS9kaTM1OFJB?=
 =?utf-8?B?YmtCbkh4OHJ4RmpOUXVsbnpSL2dBRVpteHZTVENSM1Q2OWh0dEk2MjBGZ1hz?=
 =?utf-8?B?d0VaRjZLK0c2aTFQNzV4NDhuTnNoSjBTclRyY244dDJ3bVJuNUxNUm5TTDZJ?=
 =?utf-8?B?RnFhc2hmQkEzTFoxTDVBVXh2a2lwNzJoUFpFd09rYWh6NHIyRmlYVG5ZTnZz?=
 =?utf-8?B?RHByU3I2UWJteXI0RlBRU2VlVUNZZGxQR3gyRE1QT0Uram1tYTNIWkNjYU85?=
 =?utf-8?B?T1dyWExCY2Z4MG1qUDd4OURvT0ZnVVE5SVZPaFFma2IyZnBVL0Q3d2FKMzBm?=
 =?utf-8?B?RWtpMksyNFVQVmFLMU9kMFVjVVphOC9iVWdVTVZQbU52WmNGOURYcC90aWJB?=
 =?utf-8?B?MzNEemJ6cklEOFVVRFltOHZpZThOTE41T2RCN1RrMjBiQ2VtNCtzVkwxelIw?=
 =?utf-8?B?ZzZudHNoTEwyN2ZOTEZHbndJVDZqSWE4NUdIcGhjUTAxS05pcVBTaGZvemZB?=
 =?utf-8?B?QyttckZIMVUrWDJVUVZIV0ViMmpMYVdkNG9WQVhyU0FvZDNQRVdUQTJzcE1z?=
 =?utf-8?B?QVVieE5DZWVCdWZQMlROd1YyS0tQMjl3L1ZZc3VGQWZHcWJubnNsSTUvSWVi?=
 =?utf-8?B?MTdYUnVVYW0wM3Y3R2IzNVpYazhwcU00S1dNU2pNTzFHQUU5ZTBhelI5aTlG?=
 =?utf-8?B?eWtpem5YTlZZakc4d2hINFFGS25kdFB2SzlYam9ySWlDMHl6YlZlc20vSVZS?=
 =?utf-8?B?OWwxWmMzMCsyOHZkSUg3aExIbUpDRUdWNGl2UGg5SitYQXVjQW1rMFhkQmM1?=
 =?utf-8?B?R1JkUUNXZEdCczJDNm9MNkJ0bXU0NmFuY3hyTGp3Y3A0bHprVXdUOG00UGVy?=
 =?utf-8?B?RDBnWmVGVDFjcXh3S1NQeTlGeHpBbEtxZWF4SWtrd3g1MGN1SXJlT00xVHNm?=
 =?utf-8?B?YVIxL0tRT1FzR213aGV1aEZjbE8rK3Z5YkdBQVhTb1Q4VnBEbSsvZDVtbVhX?=
 =?utf-8?B?NEVFNlprQk9JQm85cEhYMnpMUGxQWUJod0o2NzFDZ0F2V0ZWQjI3S2JUQ0Rq?=
 =?utf-8?B?TUo2L0p5Mk13WnJiaE1kWnZMeFFqZW8vK2dpZW5qMFRMQUlraTkvTElpeGhx?=
 =?utf-8?B?RXM1TUJ3M0FnZ05DdXFsbVFCd0hqR0hXQjJZMEhvOXByUEYyNVF5aHBVSEgx?=
 =?utf-8?B?c3VMeThkeUlFaks2MXdoN0RMZWVDckROZmNLVHBVVE5nNjJnUmhwRnEwSGdw?=
 =?utf-8?B?QkJsTmhLYXBFRkRDVDRYUU9lc3VpRDBVYWdjOVNSdXVWa3lyaS9WL1g1SnZJ?=
 =?utf-8?B?UEN1dVlnM1pXczhGekhqdGJQeXlNaXgrRkFMQ0l1bEp1Y2lMQjlibFJpZGwy?=
 =?utf-8?B?SDlaQ2I1TWovQWV0WHI5d0ZKSUViVFVMMzJpTDAvYmc1SEZsaDVnK0ZERy8z?=
 =?utf-8?B?VXViNU1VK21nZThXb0tYQzFnK0hxbUEzWDNTUGVyM0RxMEVDMU51Si9WaUFU?=
 =?utf-8?B?eTlPYTdYMExBeStDVitOQzI3Z3dxbFp6SDdxd1lqRWhYS3NKdlZQWHFLTXF1?=
 =?utf-8?B?TVlWbEhNTWpGZmV5OW9CV3dLMDFvL3dmckJtNExJRHZUcVowK0krZGkyYW4r?=
 =?utf-8?B?RVh2Tk1ReVdkMThwdGlRaFFnSkVVOVNBYnRqb2tqSjlCZUFYeDI4MGJtY25B?=
 =?utf-8?B?d21NaG1za1M2YVZmVnBGbkRCVVFVZUlrZGhHN1R0N25qWGNyMEJrV1BYbVBx?=
 =?utf-8?B?UDBHbUFtRU9PVTFIWXloRDVDM0NNUFEwNVBSTHFuTGJsNVc3Ui8xS2tQZzNW?=
 =?utf-8?B?Qm56djVZcXh2Rm95dDNYVUsyV3dDNnBLWkE4R3VqdDltWGxvTHFvNUpJMVA2?=
 =?utf-8?B?ZTdiUjljaitHWEF2Q2ozdFM5dUZLZTNnSjhGejdFVFZ4VUhadUtRMlZ1UldX?=
 =?utf-8?Q?VFD3hmaSiTBBeA+2jrjLiQB5Z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 541268f8-a241-4e5d-bcfc-08dc630ac185
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 20:28:22.9354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xKCOz7+wvxhakNPL0LLQHe6xxGjU8y14nroOvwdiu52Hu70cTCqhS1r2K1+xi3NjmmpdBOLYjfDAPlr8i6EIEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7034
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

On Mon, Apr 22, 2024 at 10:05:45PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 22.04.2024 21:39, Rodrigo Vivi wrote:
> > On Thu, Apr 18, 2024 at 10:34:42PM +0200, Michal Wajdeczko wrote:
> >> We already have functions to configure SR-IOV policies.
> >> Allow to tweak those policy settings over debugfs.
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 50 +++++++++++++++++++++
> >>  1 file changed, 50 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> >> index 8909bb950a8b..3a83af7aa039 100644
> >> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> >> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> >> @@ -17,6 +17,7 @@
> >>  #include "xe_gt_sriov_pf_control.h"
> >>  #include "xe_gt_sriov_pf_debugfs.h"
> >>  #include "xe_gt_sriov_pf_helpers.h"
> >> +#include "xe_gt_sriov_pf_policy.h"
> >>  #include "xe_pm.h"
> >>  
> >>  /*
> >> @@ -76,6 +77,54 @@ static const struct drm_info_list pf_info[] = {
> >>  	},
> >>  };
> >>  
> >> +/*
> >> + *      /sys/kernel/debug/dri/0/
> >> + *      ├── gt0
> >> + *      │   ├── pf
> >> + *      │   │   ├── reset_engine
> >> + *      │   │   ├── sample_period
> >> + *      │   │   ├── sched_if_idle
> >> + */
> >> +
> >> +#define DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(POLICY, TYPE, FORMAT)		\
> >> +										\
> >> +static int POLICY##_set(void *data, u64 val)					\
> >> +{										\
> >> +	struct xe_gt *gt = extract_gt(data);					\
> >> +	struct xe_device *xe = gt_to_xe(gt);					\
> >> +	int err;								\
> >> +										\
> >> +	xe_pm_runtime_get(xe);							\
> >> +	err = xe_gt_sriov_pf_policy_set_##POLICY(gt, val);			\
> >> +	xe_pm_runtime_put(xe);							\
> > 
> > I like that this takes care of the runtime_pm in a 'global' way without duplication...
> > 
> >> +										\
> >> +	return err;								\
> >> +}										\
> >> +										\
> >> +static int POLICY##_get(void *data, u64 *val)					\
> >> +{										\
> >> +	struct xe_gt *gt = extract_gt(data);					\
> >> +										\
> >> +	*val = xe_gt_sriov_pf_policy_get_##POLICY(gt);				\
> >> +	return 0;								\
> >> +}										\
> >> +										\
> >> +DEFINE_DEBUGFS_ATTRIBUTE(POLICY##_fops, POLICY##_get, POLICY##_set, FORMAT)
> >> +
> >> +DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(reset_engine, bool, "%llu\n");
> >> +DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(sched_if_idle, bool, "%llu\n");
> >> +DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(sample_period, u32, "%llu\n");
> > 
> > ... but, is there any other way we could accomplish this without this style
> > that hides function... I hate when I have to understand anything in i915-guc
> > code because you cannot navigate or grep for the functions that are declared
> > with magic macros like this.
> 
> but such template macros are quite widely used (at least for sysfs)
> 
> $ cgrep ssize_t.*\\#.*show.*\\\\ | wc -l
> 189
> 
> and IMO it's better to have one template than replicate very similar
> code N times with just one line difference
> 
> besides this are static functions, no need to grep anywhere else

good point indeed. it is not something we will be manually calling from
somewhere else, but never seeing the declaration anywhere like in that
i915 guc code.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> > 
> > but this is my only complain and no big suggestions. I would like to hear
> > from the xe maintainers here.
> > 
> > for the debugfs entries and rpm handling and everything I like that.
> > 
> >> +
> >> +static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
> >> +{
> >> +	xe_gt_assert(gt, gt == extract_gt(parent));
> >> +	xe_gt_assert(gt, PFID == extract_vfid(parent));
> >> +
> >> +	debugfs_create_file_unsafe("reset_engine", 0644, parent, parent, &reset_engine_fops);
> >> +	debugfs_create_file_unsafe("sched_if_idle", 0644, parent, parent, &sched_if_idle_fops);
> >> +	debugfs_create_file_unsafe("sample_period_ms", 0644, parent, parent, &sample_period_fops);
> >> +}
> >> +
> >>  /*
> >>   *      /sys/kernel/debug/dri/0/
> >>   *      ├── gt0
> >> @@ -261,6 +310,7 @@ void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root)
> >>  	pfdentry->d_inode->i_private = gt;
> >>  
> >>  	drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), pfdentry, minor);
> >> +	pf_add_policy_attrs(gt, pfdentry);
> >>  	pf_add_config_attrs(gt, pfdentry, PFID);
> >>  
> >>  	for (n = 1; n <= totalvfs; n++) {
> >> -- 
> >> 2.43.0
> >>
