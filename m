Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41C6C624D3
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 18:07:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8E110F304;
	Wed,  2 Sep 2026 18:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7CFVwZj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B4A10F304
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 18:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788372448; x=1819908448;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LXs/C4UVvpBthQl2Gcb8SIJE+YL401LjayJ0W/TSUns=;
 b=W7CFVwZjaamihzigl2pbJNlyq32UH8qXDmYhAMcA0ObA1tYC4BHUXWjA
 juVTRiSEE4UrlwT7QUEEUDuYQ2TdgzcteuSornGAoBzR4kXXKMcwSZnn1
 lUn0kvGiFAgHIWOTBjynAAd7NOKnnQxX+WBpTwDhSsr9ar1viTwQEu+h6
 JuCJxm0SF8kyBrQWLcTC0xo6qmHQ/5b/H1v2dReAEMrJHJoNKR7noB1sM
 f2YsgNdB/XK3NnRX8UX+h3dpCGxEhbu9PLMkOwI3JhiVBY9JUSJygYqPc
 5vsAuPRmg5/XffTa9JrUBuA0mLmRMhrnx1XduY0/p86CEZIv1QqkFAh4G g==;
X-CSE-ConnectionGUID: zB0lkLEYSFeuPv7IJYaO3g==
X-CSE-MsgGUID: qeNu4K2KSCeCdaJ77EgP2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88690378"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88690378"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 11:07:27 -0700
X-CSE-ConnectionGUID: UtVUdH0tS3KEGI6h/K49iw==
X-CSE-MsgGUID: hWxopHr2T8OJVX18PXFAmw==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 11:07:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 11:07:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 11:07:25 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.45)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 11:07:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXjXGl6O9PkeqlSu9axTqUZmU9Mhs/Mkwn4qcwZLsUafx9CGT/mOGOiz4smm7U+kSb/Gy6mxbUoXMhJo3YUhJMXdMqPeB+3TVfKClbDaXJ0Hu9AJSdl7zCxEStvVzYQgSY+1k1CxT93uVMa+R2J4LwWRDWj5rG45EEKlvgZVeaAPl1Sv0Q274A6J2DhHyfDuw7Qlg4/joWAberqMAOpsDjzLrIjz0jvQa21ukP5dFbR1FwidmSKhAR9H4T+4GFDLA8JKb3POG1MJ2TNSqm1Fpq0E5iZ1JlrOgQTNG94njH3vnm0rkTOJflGkJfvcObuPoyQ6Xe7zcYW0KpZHigrXQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qG5PDwB5g+tUDkF5EkUj2HNoS3R9sj3ojw0PR4hqH9Y=;
 b=l0hkRnJhbFp+IzEW+E6e5AphnTYOimgDgXcmn3ARZTuZzU3xrCZkdBxcsrbKsMd+6eVs2rle2qfpRvXxN94gfKOA4k1QbqmA2B+1IAVmnOpDkm8w2WmhPwxJUzxW62Efe8G0bPKJCQA4CBlUMt+MTvY3FjJoCs/d0++W9b5yNDxWsJ9YQjrQNw3eGbYfNIOSU8k2EOSTHQS3ft5SlI9qDkvyaBRzxb0mtaftzOOM2ADi14gd+/0sprCA0/uPUG8B4qLGwWMzJ5GaLbaPgu6QXu+mbHvFAuP84PFmNsJ/B75Fgq98/4ScBR8/nkEC6jNA3/KA/YYxF03OLHKWg68OnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 18:07:23 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 18:07:23 +0000
Message-ID: <d7c7a2c6-11ec-488b-8a40-3e51388db116@intel.com>
Date: Wed, 2 Sep 2026 20:07:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] drm/xe/ggtt: Initialize GGTT pools by SR-IOV mode
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Maarten
 Lankhorst" <dev@lankhorst.se>
References: <20260901164435.1395260-1-piotr.piorkowski@intel.com>
 <20260901164435.1395260-3-piotr.piorkowski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260901164435.1395260-3-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P195CA0096.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::49) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|DS0PR11MB6541:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d6c17bc-ea0c-46ab-28f0-08df091d0980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|56012099006|10067099003|6133799003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 9uyhWkp026qrwZgQYofAo7nWJHNZ/z+DR5v/ggClqlchzgQJ+6ecoufqgMhb/SZG0Jg1BWTKH4iSp+W+Ov2/4zLsJac0XDOaI0/gHRk+BpwGI8Y7zCwFzXnvHSFrdS2tCgE1EkAn2ZSjkSCfTjC5iqQweJgbtVZKVwaK2VAxQI6cMXrtu6LHK/CER3LCILTfz/aAGPLn7f5HPWJgzAV/ZIQWc4oiUed2+d2k0WpH4kE0nBcXjfFzpj6U0BjKOKQ4VHRgCBxbq/nZVnbn+pluCWOANl8IjcT7ftFuP3Y/Gmyi5atMJih6oDGPE0ghcMs0uN6PjmVcqHwKGNXk2xz3Y2OjA4PiWvFDJO3GHhnBBogMt+WRLICet3XZZ7jt+BxKLH04baDhQBMe0D/+LCkhHMIYU0O9GBINoSuK2/VCZ0wKw5blqDGvSwXhuebXTgUZbTLlOlIFOxf89dLiEGXub8TdBN2iXOQhY/EK5h7tSSFHZ1jUuFf7D7rorzczopS5653Ma6XSdt/BlBrsesgzcJinTjRmdcNLVzZBUxaM/kh7oIlu0iOYg+nHlc/94DRTupNwCC85O9wcd3IWhiMiYRtLLC2oB67zGjXaeetK3HC16KrPUDSXWBE96OKS9IihsaAVYO3ASzS6LVGxM1gDn5qmH08pv+v+Fp2npwEl7VA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(10067099003)(6133799003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVRFZGlrc0RIVkN2VXZqN2xYeFhoa1hxSEJaZXJnb09uRFhqNTcrZExjQWkv?=
 =?utf-8?B?QUVIS0dmU2lhaGQ4czREQzh5WDlUYS9JcGpMcTV1eXY1a0tKS0lmTEplK1pT?=
 =?utf-8?B?MEN4cG1nTnNOMFR0Tk55blVlVmZNNUQxbWpIdEdNdzZaRzk3NGRpT0Ntd2Fm?=
 =?utf-8?B?UWVaamJZcVplclczOXV1bTJ4ZFlDUlIvSmpJeXpSdGJ3Slp1Ymd0WnJVcDBy?=
 =?utf-8?B?WGV3c3F1ckt5dXU4YmN1SThETy9IVHhKcnhlTTg1WGdJdmU2UzRwdCt3Y055?=
 =?utf-8?B?VllvN0VzMHpSeXVic0Qwa2N4L0JOTlhsYVU1bld0Q0c3ZkF3dDZvanRNQnlH?=
 =?utf-8?B?b2E0YkRoTC9tZ0M3Skl0cE1LUWxmVW5NN05Pd0p5WWIyTWdUbXZONFFlS0VI?=
 =?utf-8?B?NTBTVUFiLzFkUWl0RzBwSnBhUUczbyt3RmlmMzVEVTBzTGdYcnVpN3ZUckZx?=
 =?utf-8?B?NllKS0ZnRjU1eWc1TjVKYzdtUmh2c2xWdkxqUGw3d3dRK2d6ampuWStIenJ0?=
 =?utf-8?B?U3EwZlErVTcwcGlMZWxRekVOUmdINkJQN0hXWjlyczQzeXJpY0JrYkNpSE9y?=
 =?utf-8?B?UUh4WkRVWTRKamtlTU52WWhmc1R1TFdicnRhSzV2c01VU1ZJcy9tbldwb1hX?=
 =?utf-8?B?T1ZHdUVSQ2ZmaHMyb2R6VE5ZeUE3MjhDdW1YZXNiR2s2VXg5THozZCtvb1lz?=
 =?utf-8?B?bVZ0TnRiM1pOajlHV2NHdHRiTktRalppWEgvaTVpbWR3SkxMTHpMa09ldmlR?=
 =?utf-8?B?Q3U5TlRjdzdZRktQQ0MxTFRQT3JNZ244U2NYUlV1WnFSUm9TRG9BUnFDMWYy?=
 =?utf-8?B?UjA5OEp2RXZwTXVrbUlZb2VnSWR2eDhJTlczeGRGdGRzRXpCc3JOQUwzWm5t?=
 =?utf-8?B?b1IrejNObnJMRHpRL2Rub2hEcmhMRHpKRnhYbzlMQ3Q1N2Vxcll4M0hUY050?=
 =?utf-8?B?dW9NZDlaRk9McFAxdU5wNTRzUHk2NTN4RzJNaFQ2NzVPKzd2d0NZQ2gzQ2hz?=
 =?utf-8?B?RkxOVC9KM21KSFQvTUZjQ2Z3TXg5Sk9wMGIrUXBmRXNaczlRdTlMTklJWGpp?=
 =?utf-8?B?Umo2TW1VSDNRRjZDU01kbmVOc0RzWWpZRFBvV0tkekY5bmFuUTVpTWZYUnJZ?=
 =?utf-8?B?WlJ2SWlocmYrTDZyaC9neElZM242Um9aYTcxYVRCSll1eFJwQjV0cW15UGky?=
 =?utf-8?B?eVZWdXI0RmUvWWtWOUFLVUwyUUdHUXNzSmNIaGxJMGFHRXBrS0NEc3NxeUJB?=
 =?utf-8?B?bElLZktwTzh5eGYyaEpOZ0JNSGtUZXl1bjZiUStRaUFNNWVnUDNKWTdWVTVu?=
 =?utf-8?B?WEIybm1VYzVHbzlzdzQvV2d5bVNmMjY0QVozY3VpTzRzS0doZ1lHWWc0RWRh?=
 =?utf-8?B?MlV0czN6aGpTcms4U1hEemcxb2h0N2prNUJHUEwrajFZbHRZTHF0bTVST0oz?=
 =?utf-8?B?YUVFNkJRU3V6WEp4c2JURVdhdytFM1BkeDJadFFTVGJGQithOUc2U1RCeGVz?=
 =?utf-8?B?SzNXZkxJOWtLbnAxWHRrVFcwY2s1RjdyalFrbmJydUFQRVJMbTNPRGhHdEdh?=
 =?utf-8?B?dy9kVk1YVGlQUHhjbE90eDd0QjI0S3p6MXdHSWVsenZMc01BOEdoeXdkMFFz?=
 =?utf-8?B?c2tzbFdoa3owamFUM2hFU2psaWM3VFlpaVl6bVRjQ1l6NGR6YVJSY1N0RldG?=
 =?utf-8?B?NFdkeUxLc0pERzJsbWozZ2VqV1FXUXpZeXMybUxLVG83QVhNWWJzUFRwWVNH?=
 =?utf-8?B?aHk2UDNJMElBeHgwWGQ0VTNtTTM4SkZXczNzdW5GNkthSEgySzBidUcxNE50?=
 =?utf-8?B?cnA4S2N6YjBNVlh3Q3RqYWFjUGVFY1VRVGxISEM4cGE1RXdCY01NbWUyU0tF?=
 =?utf-8?B?UDNqbFozWFFHUDgyckVQMS9CRmlpWi91R2xJaGQzRlpJQ08zeDF1Yk41eW9n?=
 =?utf-8?B?VlYveHBpbk40d3g5VSsvYnQzdlduVHkzaG94RmpBVndHNFB1M3cwNTN5QVdn?=
 =?utf-8?B?c2RiVnJKNjFHaDR5VGlYOE5FWG8xU01hMnJkNGFhdDRjMDJKU0xPcitOU0J5?=
 =?utf-8?B?ajJQZEpGaElkd0ozTXRKU1h4eVR2OGhqZGwxQWIrcWVyU1ZjKytXWEw3ZVln?=
 =?utf-8?B?NDhjVW0rcjhvbHB0WG91V2EwTkpidmU1WGFtallZRWhON1UyQlhKSGR2Tkl0?=
 =?utf-8?B?NGhxM1czOExkT3FUQnN6QjN4YlhnUWhkV3o3SXNJem9rS0JwdHpFaXBvMjBJ?=
 =?utf-8?B?bEtFUWY3ZnY3OGh4MEhSbEl2UWx6QTlreVgyemVjS3JKM04xSG96azdyTHZM?=
 =?utf-8?B?OUZmWHFFelhJWGJhdG5uWU8rWUM0WkdocXRwbzRxVTQyalNGSGtlcUltQW45?=
 =?utf-8?Q?FpZBqTLfpQQVKOGA=3D?=
X-Exchange-RoutingPolicyChecked: ihYHh2XWqUOIEUzHPuCZCSTK+9zBnatXr+uy85+X6VmdVQi9XLH0eaKEj4n75RUpm2NpuG1s8sk6mkG7f+ax0x50/Y0dKHxpypPbnnIY2Uri8dLW/0fuf8hG9wXswB+Gj8vjk2mCtW/uuY2WUFsj0cPvyYYDCrheTNnOMd7gQI35vXWTBhGVTBTjp9B5O8UQgciIUr8faM7Nl/uZUkeVBrsgLHH4eHXUVPk321A4vJkje/cr9MaK15PnRFujxzN+hyJkmV9P1C27dgyBKIlKcdGJpCtIga5vHFNuAxxNLJItbxE6X8z6EYC4xwe86eH/0fLUOjfFYZMS1iolKts9eQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d6c17bc-ea0c-46ab-28f0-08df091d0980
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 18:07:23.0444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mtu/qWRrpM/SCHsKJatJKXCYC+OFFPxq3uFS3pcaPekLMgOwBcgEWnEucJoXZEzzO20yFqixRCO9fgZIwt095nqM1EpB/i+i64PebGhtvz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6541
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



On 9/1/2026 6:44 PM, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> GGTT initialization currently uses the full available range for both the
> usable and shareable pools, regardless of the SR-IOV mode. The range is
> read from hardware on native and PF devices and assigned by GuC on VFs.
> 
> Let's separate range discovery from pool setup and initialize the pools
> based on SR-IOV mode. Native and VF modes will use only the usable pool.
> Shared PF mode will use both pools over the same full range, so they fully
> overlap.
> 
> Assisted-by: Claude:claude-5-sonnet
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 132 +++++++++++++++++++++++++----------
>  1 file changed, 97 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 1f0bd876cb35..7fcd686f9729 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -366,8 +366,8 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
>  	.ggtt_get_pte = xe_ggtt_get_pte,
>  };
>  
> -static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 usable_size,
> -				 u64 shareable_size)
> +static void ggtt_init_ranges(struct xe_ggtt *ggtt, u64 start, u64 usable_size,
> +			     u64 shareable_size)

maybe this function rename could be done in patch 1/3 when we've changed its signature?

>  {
>  	struct xe_gt *gt = ggtt->tile->primary_gt;
>  
> @@ -387,10 +387,87 @@ static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 usable_siz
>  	drm_mm_init(&ggtt->mm, 0, ggtt->hw_size);
>  }
>  
> +static int ggtt_get_range_from_hw(struct xe_ggtt *ggtt, u64 *start, u64 *size)

ggtt_probe() ?

> +{
> +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	unsigned int gsm_size;
> +
> +	if (GRAPHICS_VERx100(xe) >= 1250)
> +		gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
> +	else
> +		gsm_size = probe_gsm_size(pdev);
> +
> +	if (!gsm_size) {
> +		xe_tile_err(ggtt->tile, "Hardware reported no preallocated GSM\n");
> +		return -ENOMEM;
> +	}
> +
> +	*start = xe_wopcm_size(xe);
> +	*size = (gsm_size / 8) * (u64)XE_PAGE_SIZE - *start;
> +
> +	return 0;
> +}
> +
> +static int ggtt_get_range_from_guc(struct xe_ggtt *ggtt, u64 *start, u64 *size)
> +{
> +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> +	u64 wopcm = xe_wopcm_size(xe);
> +
> +	*start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
> +	*size = xe_tile_sriov_vf_ggtt(ggtt->tile);
> +
> +	if (*start < wopcm || *start + *size > GUC_GGTT_TOP) {
> +		xe_tile_err(ggtt->tile, "Invalid GGTT configuration: %#llx-%#llx\n",
> +			    *start, *start + *size - 1);
> +		return -ERANGE;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ggtt_read_available_range(struct xe_ggtt *ggtt, u64 *start, u64 *size)
> +{
> +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> +	int err;
> +
> +	if (IS_SRIOV_VF(xe))
> +		err = ggtt_get_range_from_guc(ggtt, start, size);
> +	else
> +		err = ggtt_get_range_from_hw(ggtt, start, size);
> +	if (err)
> +		return err;
> +
> +	if (*start + *size > GUC_GGTT_TOP)
> +		*size = GUC_GGTT_TOP - *start;

we can make such adjustment only on native/PF

on VF, this should be treated as a fatal bug (like start < wopcm)
> +
> +	return 0;
> +}
> +
> +static void ggtt_init_native(struct xe_ggtt *ggtt, u64 start, u64 size)
> +{
> +	ggtt_init_ranges(ggtt, start, size, 0);
> +}
> +
> +static void ggtt_init_shared(struct xe_ggtt *ggtt, u64 start, u64 size)
> +{
> +	ggtt_init_ranges(ggtt, start, size, size);
> +}
> +
> +static void ggtt_init_generic(struct xe_ggtt *ggtt, u64 start, u64 size)
> +{
> +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> +
> +	if (!IS_SRIOV_PF(xe))
> +		ggtt_init_native(ggtt, start, size);
> +	else
> +		ggtt_init_shared(ggtt, start, size);
> +}
> +
>  int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
>  {
>  	ggtt->hw_size = size;
> -	__xe_ggtt_init_early(ggtt, start, size, 0);
> +	ggtt_init_ranges(ggtt, start, size, 0);
>  	return 0;
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
> @@ -418,43 +495,19 @@ static void dev_fini_ggtt(void *arg)
>  int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  {
>  	struct xe_device *xe = tile_to_xe(ggtt->tile);
> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	unsigned int gsm_size;
> -	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size;
> +	u64 ggtt_start, ggtt_size;
>  	int err;
>  
> -	if (!IS_SRIOV_VF(xe)) {
> -		if (GRAPHICS_VERx100(xe) >= 1250)
> -			gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
> -		else
> -			gsm_size = probe_gsm_size(pdev);
> -		if (gsm_size == 0) {
> -			xe_tile_err(ggtt->tile, "Hardware reported no preallocated GSM\n");
> -			return -ENOMEM;
> -		}
> -		ggtt_start = wopcm;
> -		ggtt_size = (gsm_size / 8) * (u64)XE_PAGE_SIZE - ggtt_start;
> -	} else {
> -		ggtt_start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
> -		ggtt_size = xe_tile_sriov_vf_ggtt(ggtt->tile);
> -
> -		if (ggtt_start < wopcm ||
> -		    ggtt_start + ggtt_size > GUC_GGTT_TOP) {
> -			xe_tile_err(ggtt->tile, "Invalid GGTT configuration: %#llx-%#llx\n",
> -				    ggtt_start, ggtt_start + ggtt_size - 1);
> -			return -ERANGE;
> -		}
> -	}
> +	err = ggtt_read_available_range(ggtt, &ggtt_start, &ggtt_size);
> +	if (err)
> +		return err;
> +
> +	ggtt->hw_size = ggtt_size;
>  
>  	ggtt->gsm = ggtt->tile->mmio.regs + SZ_8M;
>  	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
>  		ggtt->flags |= XE_GGTT_FLAGS_64K;
>  
> -	if (ggtt_size + ggtt_start > GUC_GGTT_TOP)
> -		ggtt_size = GUC_GGTT_TOP - ggtt_start;
> -
> -	ggtt->hw_size = ggtt_size;
> -
>  	if (GRAPHICS_VERx100(xe) >= 1270)
>  		ggtt->pt_ops =
>  			(ggtt->tile->media_gt && XE_GT_WA(ggtt->tile->media_gt, 22019338487)) ||
> @@ -467,8 +520,17 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	if (!ggtt->wq)
>  		return -ENOMEM;
>  
> -	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size,
> -			     IS_SRIOV_PF(xe) ? ggtt_size : 0);
> +	ggtt_init_generic(ggtt, ggtt_start, ggtt_size);
> +	xe_tile_info(ggtt->tile, "GGTT usable %#llx-%#llx = %lluK\n",
> +		     ggtt->start, ggtt->start + ggtt->size - 1,
> +		     ggtt->size / SZ_1K);

both info() could go to init_generic(), no?

> +#ifdef CONFIG_PCI_IOV
> +	if (IS_SRIOV_PF(xe))
> +		xe_tile_info(ggtt->tile, "GGTT shareable %#llx-%#llx = %lluK\n",
> +			     ggtt->start + ggtt->shareable.start,
> +			     ggtt->start + ggtt->shareable.start + ggtt->shareable.size - 1,
> +			     ggtt->shareable.size / SZ_1K);
> +#endif
>  
>  	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
>  	if (err)

