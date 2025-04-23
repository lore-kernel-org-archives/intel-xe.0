Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37460C369D3
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 10:37:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF93810E1CC;
	Wed, 23 Apr 2025 10:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ivrrAj4w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927A510E1CC
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Apr 2025 10:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745404677; x=1776940677;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FXv9cs5+WnMDlaH8rYFIOTPephIISIXR/zvLLii0azY=;
 b=ivrrAj4w0gd/Jk4KEtazAph/gSYR5jWC9NjLNgbYxBatEYkq7UMTTupU
 cGYlaFmqW8vyc/rzoiNd88Nl+4PF7ypGZZHNdpa/tjobK0ztDIgDeKyaP
 Q6rf02XI9FJpPp1lT6gW42TpP1ALWeTyfReTe3tMNejxFqM5j/4rUfD6h
 8HghTAtc1de7o/xODt9ZDIDe+NOF/3wZH0taFcCt3TgpBzbZGhgB9rpVg
 G2cJo8qXjwYiXyMgDOd5UDZjUKa8yoIW21+zE1yxemZ1kCNlCjCX5yoVG
 pzbkliAt8vfllV49DZw0+58E6hW3C0TKXwYvj8MLTnzGXTQbPWnKVOvS1 g==;
X-CSE-ConnectionGUID: pnJbKrtsQEeUF5uJkCxhzg==
X-CSE-MsgGUID: tevsSemORsCONAA66aN+0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="47091555"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="47091555"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 03:37:55 -0700
X-CSE-ConnectionGUID: Faqk9T3zTQGz0zF6gtSNZQ==
X-CSE-MsgGUID: 76OYxuCuQYiN6SBinKBvng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="132271637"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 03:37:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 03:37:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 03:37:52 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 03:37:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7lyX32v8UgwAyio0RO2ihgRmTEIAvX0p88lTrPeBQrmbnTheyRvvO+rlh/3KQN3uSb6H03pQG4pU+uNpTua0msLGbDSNpiuGJXmWOmrwYSyXT82ISRRC9Q0ENgWYkXS7CRS01bkP51T0XHC3puhNApcmRZRpCJ9VC06LqaEMG1jkpX27PQ3bhEwy8f2HHk8uO8a8ZByLaPpISLq5qL9sn2wfN3V/GJNvyFF2RvoUB9EHRaEpD3LMZ6RYJkUE+VqNjBomN43GBaa8m46X7dBJDbwYxzVyFvd1DoHVwDrsBsbMEUBoFwKORM+HzCzPVP7VTa7ZPicXlIEKPTCU8t6mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RV/EGsAYmDRhKXXbbGktebSGPSBAoeHNvpR5MsCxYIo=;
 b=xum9ZVpVR48y+hcVVsR5mZnauNFTrLF1zZCgVcgdrg7ukTU/Fm5Z24hx8AvsuAHAZPaIHe5NP22uKPfV2scUEnansyLu4kNwS0Hh65R0vNL4tw5NGoM70an3yHKPYus6Oub913ET9MjR0V1JqspjGInVTaW/FCKBuS7oPpCm4VCmUN5pBC8buwcLFfNCTbKfpZS/FrSa3a7ruUSO9+QQLhGNf3JJhT/TZVgH/YE40zTmfqRWYWaLI+9AMWuSrGXIKxmmKn+pkdfbx0qrFuWZ1an6iitsWN53X56nChaQExLoPa16gMvdp2Aqgv6cwVASweatryjAOuwSXIzcV6+PCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by IA3PR11MB9135.namprd11.prod.outlook.com (2603:10b6:208:579::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 10:37:23 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 10:37:23 +0000
Message-ID: <0bbda486-8b53-47ac-96bf-e11648891e32@intel.com>
Date: Wed, 23 Apr 2025 12:37:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/vf: Fix guc_info debugfs for VFs
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20250408213146.793855-1-daniele.ceraolospurio@intel.com>
 <20250408213146.793855-4-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20250408213146.793855-4-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::11) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|IA3PR11MB9135:EE_
X-MS-Office365-Filtering-Correlation-Id: c7273deb-c9df-4ff6-fdd3-08dd8252d531
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXhxaGNqSkxJY2JmdjdQa1BiZnlCNi81TFMyK1U1MkZSVWMyZ2pTd3UvNkwx?=
 =?utf-8?B?b1FhcHRKeElRMVlWbC9xcU9uUXVIZjVLdzRrVVlVakxuTWdIcys3NVgzQ2RL?=
 =?utf-8?B?MVlQRG5mK2lRSitrc0hVTU9GL0NGL243bFdnODNqK2kvdnZaQUhkTW8vWXRS?=
 =?utf-8?B?TWdHbTBQQlNqK1lFRllMdzBPQ3B4Yzh6cTNSZC9hQVIyWHloQkVTQzI4TnlI?=
 =?utf-8?B?RlFSdklGQmdVd0FwZGowM0N2bEJuVWpLN3U1Kyt3TzdHSDFSN21IZHhYbHBT?=
 =?utf-8?B?OXZoOERGVGZGa1ZGck9rVHNyZUw2QWN0d1QyOENRTUp2bHVjVk5HU3o4alp3?=
 =?utf-8?B?eFNiOWxzU0ZDakwxdFlMYnM4dXpBc3BFUno5SDdRdzBHUXQ1WXRyTmZ1OGVz?=
 =?utf-8?B?QnBCMkZ2Zkd6OEdQN3FuSzh6NHp5TnFPaGhqZUJldW5mS09ybkg4V3JHalc3?=
 =?utf-8?B?WmZVUSsxS1ZSSEF5RXJ1SUl1czgwL2h6TXdLN3h2Tnh6cmlYYk8xblZEWXp2?=
 =?utf-8?B?ZW41ZkNKcjc4eHRnSjVzMTF5a3JjL3p3MWVPOGRFVTIxRFQ1SHZjYnZwdkxX?=
 =?utf-8?B?LzQzMVBDaDN2RUJIanB4VXZncStPRjQ0RW9PeUE2WFRpMStveFBWVVFhbWk1?=
 =?utf-8?B?SVYzc29TUlhCNlBDUWcvT0dLc0FwT0liV2gxMS9VR1FOTUM3ZmF2ZkUxNHZt?=
 =?utf-8?B?dW84bkdvcHZmVkx4ejdhRzF2T2loV0JWMVlJUG8vbnQya2hJbWIrRkJ6dy8v?=
 =?utf-8?B?QTBMRUEzVXBDbWp3OEpqTEdsSnYyanRXV0tycjVGL3RLZmhsU1ZObFZLMW5h?=
 =?utf-8?B?S241cS9DNEgwYVROTGlzRmh1U1hUdHUxQ200ZUlDdnlJZ29qL2NRZy9IL0JD?=
 =?utf-8?B?eUdQZk9Xakx4QS9ZUGl3K1JtNXorYm52eEIyMEl3TmpDenFlY1RGTDhobUJ6?=
 =?utf-8?B?a3o1ZDZTTHRRSERJOHFwVXh4UHlaaktPeXQ0M1R3OVh4eDVWaFlzcUhoUGwy?=
 =?utf-8?B?UWdiYURKaElXem9vQVRVZldWY3hvS1BudUVqOTU0a2VjQWVURWFIenZ2M0lv?=
 =?utf-8?B?UkZkbXBtOEZLYUtXNWZKaThCMVlCamZWOG1icVZFemtBZUFqMy9qalFXbWhP?=
 =?utf-8?B?NWhCS1g0dmVjZm9vWHdUajdBdGhhTjQ3S1dzZFN3WXNqd2tPTlcvMFp5T3dG?=
 =?utf-8?B?UHZYVEF6N1NCcDNvQi9HVnltZEZVWnNjTVNKc1hpWEZKaGpJcDVCaTdBVk10?=
 =?utf-8?B?ZnZxZlJBcUw2NE9vMVFRVmN2QnNTTy9hb0VMbldWMTB1ZVRFK2dTanJ6MDEv?=
 =?utf-8?B?bHNMRDk3V2t3VzgxeFhFMnFzK2Q0bjg3aVRRbVRoRlcyM25oZnJxdXVHSUlo?=
 =?utf-8?B?dVN1MnFuNTI0VmQxSzVNamM5M1BWVCt2NGFUVHdsN0piTmRHRGRQRFBTQkxM?=
 =?utf-8?B?RWtRS2xPU2VyUDV0Z3U4REg5THdVblBJbktwaDI2S1I2SXlFNkFlL3o4elM0?=
 =?utf-8?B?YnlxSVpRWVh2V0E4dWtJZmV6ZTRKR0lsZjhYMHo1U2ZkSHp0VDVHbWNiN2c1?=
 =?utf-8?B?UHlhUEdJb2FHVjhqMUtZcERLYjc3STZaZXpNaHI1QlppV1RaQnJ4Rkw1azhV?=
 =?utf-8?B?eVNXYllUUkhkZ1UzSHVza1dOREpVQ05oQmw5Q1VwUFdvNE9IYmhQRmcrYmlr?=
 =?utf-8?B?RnNjZ0R1TWpPdDZXUmpvNkJGT0ZMUW8rM3c0dXpWaHRmSUlSSzRjZ1JoL2dv?=
 =?utf-8?B?SDlFNDlFQkFPVGJZQzNCd3NoMkZ3ZTFpOVVDN01HdlJKT09YRzR1dld6Z0Uy?=
 =?utf-8?B?dWYrT1V6VCs5OFg0dUZPaFRBaHgra2J3RzNwbSt5bGpCenRBQ1llSE40THRY?=
 =?utf-8?B?WlgvK2FrZ0NnbXptdjVMdkJNZmxmdEg5aUdPTEE2aG9VWmZTR0czRkZibThh?=
 =?utf-8?Q?zz2/d3WxX6o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2lkSFFyeUV2bldNSFB4S2wxdmRLeHBUbmkzRHg0R1lUdG0reFU0RFZNUlJZ?=
 =?utf-8?B?Ui9ha3pPTjRpaFdGUWJkSTZ3dE14S3JiZzRaYkRlMjZHZ0wrelc2K1p0cnd6?=
 =?utf-8?B?TUJmS1E2RTV1VDduZGN5M0RncGNEaWM2SEZ5d09BdUxONjlkOGVLUlNXeTRu?=
 =?utf-8?B?NFlSWVhqc3FNZVBWSERzam12cUlTQ3U3YTNsbG9HTU1iSVdSOE9pYklHZFZL?=
 =?utf-8?B?NEhnZ04rL0dRcTA0TTBVOHZ6Q3JzMnZlZEZJU3dzUjdscWk0eWJXN0o3S1FR?=
 =?utf-8?B?RDdDOVR6WnFsVjdTSWRCZmJiUUhUVVJmYjE3UERXTVVncldtSHhWWTJkUkJ5?=
 =?utf-8?B?UUVZeW02NEhqUjBUYm5EdFVtZkZBbDFGc056bm1IZ0dHTWdGczZzaUd0ekJs?=
 =?utf-8?B?SlQza0Z4eDY1NHR2WXhNdzRySjVJUXZPVTRJWHI3MUR0Rk05ZS90RERSTW1z?=
 =?utf-8?B?anJNRGtOS3JaOHVkZWFuVCt3VTY0cW9rVGRSakRGMzhZQ3Q4RjFJZ1VXZU01?=
 =?utf-8?B?YmlGcUVmS3QrMTVJM0xycGJ5d2I1N2taRE1OK1BseXA5UnRhdDhJZG9QS09W?=
 =?utf-8?B?aWZ5S0hHUFBlZWVSZzZrZTJLZm43STNpMUc4Nng3bkhGS2JSYVZObVF6ZzBV?=
 =?utf-8?B?dUF3enU1eTY5dGhxV29XWjdCWkxjSzJ0YkNKRk9sdTBVREYrOHNOc1NWOUVV?=
 =?utf-8?B?Rlovc2ZLSmd5eXVvWHBSTHNIZ3VuNWFZUEIwNG0ySzdjM1BHUnI2T3p5NWFw?=
 =?utf-8?B?bmpPaHRRdGd2K3ZUbEJ3WFNZOTRoWHRpWXFXRElCYjhhQ1JsellqVmhnQTVi?=
 =?utf-8?B?S0pWOVFwMGNHTnU2MjMzV09WWlh1ZDhvRmpxUWJsWCtGemlvbHpjQTNlNlRP?=
 =?utf-8?B?SGRzZGk1bjJ0VEpISzhKdjEzU253aU40ZW9Xbjc0NXJvNjMyS2lNV0ZtUmds?=
 =?utf-8?B?TVhBSUxIMmdlaERvOWZDWG9VYkM0dDVzOUk5d2lyVURHY3pZa0h1RlNoWkJl?=
 =?utf-8?B?aElLNnhLUzRBUDdzU3lybUhEa3NMbTF6QWRrVXU5N2dJS2tBUjdNQWxlSExk?=
 =?utf-8?B?OFZVdUErYVFaaFZLOU54c20wUVpmMzArUzE3a0JIZm4xWTUyYnFBdlM1eWll?=
 =?utf-8?B?T1E5SEtRcWM4VUs4dEtlWHlpVVFYWHM4ZFpOS1VMaGdhOWFucE1YbVBtNVU5?=
 =?utf-8?B?TEM5a1pMa3g0OGpWSjRNL0h2MXJ6dzRQeTE1SllKVWZNRFc2SFRIMm84QnR0?=
 =?utf-8?B?U3VualkvOHRpb1pFbzVrTjJRQm1BSkRHRFFjUkllbXQzQ05sSDZCaFhlS0Fo?=
 =?utf-8?B?OWRUK0c5VXdsYVVGUTNFWlprZHM0ZUxqNTNpT2NXYXA2RHdKanRISG5MZ0Ro?=
 =?utf-8?B?QzVGNFRLaDd6S0JWZ1BzbXFrcnE5dWtqdUdMV3dLM3JvQVNFUTlmUmlHUVJ1?=
 =?utf-8?B?U0tSOUpBS0dNNTVIY1dobm45eW1ZWEpocUVyMnZaTDJTOEdtWWxzQ0NjbU1h?=
 =?utf-8?B?QU1DZ2J0SlFaUWo3ZjY3emV5d1hUY2hWZ3Y0blJJR3N0bDhhbWdzbExFbU80?=
 =?utf-8?B?ZVdLYzBZRFVLam0xNlM4QWtxZ2UvSlBmV1ZXcmd1MWRkUFJMa3JGVW9FZnVD?=
 =?utf-8?B?OEhjZkc1aHlvQWg3bVlYejVRQ2l2cTlKZUVTMmxndEZwV0kzSUNaanZmcHFx?=
 =?utf-8?B?TDBmOUdvc2pYUXQ0b1VYRXJ2K2NjRU84N2dqa2Y4Y01XWHNQR1VReC90bXls?=
 =?utf-8?B?Y3VqU1VISGtOYkVqYVFiblJZa2dkdngxWGdQUkdBS2xUN0RwYllSZVQ1Smcv?=
 =?utf-8?B?M293N2hJdWNNbU4za0NDY2hwTzRLUXd5R1F0MUdWM3BRRDZxZUltWlR5Wksv?=
 =?utf-8?B?T05rUVpFN051T1BqazB3YTBDUklZTFR6a1ZnSXNScTZuSjUrYmo5N1BQZFgx?=
 =?utf-8?B?bUF2RXFoZTN0b1NNTm5DYk9MQ1ZGRk9BcmZvK3hpbnFQN2Y4T3AyYjEralZX?=
 =?utf-8?B?Y3NJT1F5SCtHN0hXaXMwU1RtaUp3RzBhdE92NExWUE1rQXkzL0hGVk9GWjlq?=
 =?utf-8?B?ZU1VVTR0ei9wRlRUSm1yZlpyb1plakVhR3Jub2VHQ3lxNlp4TEJOWkYzSzVR?=
 =?utf-8?Q?tzzPnTDbWgnR1sxg57z0Vt14w?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7273deb-c9df-4ff6-fdd3-08dd8252d531
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 10:37:23.4403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oNCoHgFOG/WVmRguD7nEqIuHHvWGidpAhz2N//fmBIuZy5ghv008IpWREkPjPLcSYbzVLgU0gI2Sd3KtKcT9yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9135
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


On 4/8/2025 23:31, Daniele Ceraolo Spurio wrote:
> The guc_info debugfs attempta to read a bunch of registers that the VFs

typo: attempta/attempt

> doesn't have access to, so fix it by skipping the reads.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_guc.c | 44 +++++++++++++++++++------------------
>   1 file changed, 23 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 38866135c019..17932006619a 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1509,30 +1509,32 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>   
>   	xe_uc_fw_print(&guc->fw, p);
>   
> -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (!fw_ref)
> -		return;
> +	if (!IS_SRIOV_VF(gt_to_xe(gt))) {
> +		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +		if (!fw_ref)
> +			return;
> +
> +		status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
> +
> +		drm_printf(p, "\nGuC status 0x%08x:\n", status);
> +		drm_printf(p, "\tBootrom status = 0x%x\n",
> +			   REG_FIELD_GET(GS_BOOTROM_MASK, status));
> +		drm_printf(p, "\tuKernel status = 0x%x\n",
> +			   REG_FIELD_GET(GS_UKERNEL_MASK, status));
> +		drm_printf(p, "\tMIA Core status = 0x%x\n",
> +			   REG_FIELD_GET(GS_MIA_MASK, status));
> +		drm_printf(p, "\tLog level = %d\n",
> +			   xe_guc_log_get_level(&guc->log));
> +
> +		drm_puts(p, "\nScratch registers:\n");
> +		for (i = 0; i < SOFT_SCRATCH_COUNT; i++) {
> +			drm_printf(p, "\t%2d: \t0x%x\n",
> +				   i, xe_mmio_read32(&gt->mmio, SOFT_SCRATCH(i)));
> +		}
>   
> -	status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
> -
> -	drm_printf(p, "\nGuC status 0x%08x:\n", status);
> -	drm_printf(p, "\tBootrom status = 0x%x\n",
> -		   REG_FIELD_GET(GS_BOOTROM_MASK, status));
> -	drm_printf(p, "\tuKernel status = 0x%x\n",
> -		   REG_FIELD_GET(GS_UKERNEL_MASK, status));
> -	drm_printf(p, "\tMIA Core status = 0x%x\n",
> -		   REG_FIELD_GET(GS_MIA_MASK, status));
> -	drm_printf(p, "\tLog level = %d\n",
> -		   xe_guc_log_get_level(&guc->log));
> -
> -	drm_puts(p, "\nScratch registers:\n");
> -	for (i = 0; i < SOFT_SCRATCH_COUNT; i++) {
> -		drm_printf(p, "\t%2d: \t0x%x\n",
> -			   i, xe_mmio_read32(&gt->mmio, SOFT_SCRATCH(i)));
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	}
>   
> -	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -
>   	drm_puts(p, "\n");
>   	xe_guc_ct_print(&guc->ct, p, false);
>   
