Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114D3C61DFD
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 05:58:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F8910E46B;
	Wed,  2 Sep 2026 05:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="clv7mpeN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2247F10E47D
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 05:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788328689; x=1819864689;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=He6rqLV1kbwFb97mbFQmEHXKnhVyNxuTOiWFO1ub4GA=;
 b=clv7mpeND6hoWa9bGboFw5sexqRKKpAQOyzx5OWUrKZHWcDhQIk+K4eA
 ylsOdeo/hSNRCvlMwqmGiWYXf0I/wOT7CpSgvkTFGGEXWPBjWGtYua/rY
 6MyEJJYuaUCteuk+R8FaJzXWjHs/zXAJRvA0mRU1oOr8n8QylG0MvqMa7
 VIdGwXLAD3VKaWu5oiL286Nbhpv5wzZQOzci5WP5EHontYAmFdukLCyNL
 I9Df4LB0NHENW0LcJDlWBE9KrsMPY5dXurs6oGlAJJiFgCCnBv/Ds5foj
 whiWrMcki0PBDKB95THTFfhFG5IZUGTQhuWrBE7RSgC7YpZUmPvVX3EPd g==;
X-CSE-ConnectionGUID: kMCXltdDRxaJLR1jtLq52Q==
X-CSE-MsgGUID: IiHBhNc8QN2RRIzDNOrzew==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88899164"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208,217";a="88899164"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 22:58:07 -0700
X-CSE-ConnectionGUID: 2AdL2kN0Rum6Tk4R/uoNqA==
X-CSE-MsgGUID: YJz1XrUTTwCThgguML3/LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
 d="scan'208,217";a="265591973"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 22:58:06 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 22:58:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 22:58:05 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.27) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 22:58:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YUUUDEctVtFR6TPCdKNRc0LSDbOviY5t9kJZL6RXR6dXmT99iKDsO3aGFxyYZe+BW9Us1ueIuak/+ahIB53MdmMdexakoeXY8HdfJEX1QW2UyuNANNy8wgaaEaf5ey4bC4j1FllBcnwyLBxPqgmLPALtRc0hBtklv7kLQC7UemxtjxKLnvbh7zVeSIMgrbGoA+FQnA2lcvsw8syBTf+AHfal8R+yvqmcjfA5Xu/w96qmIGd9QWO6VfZ2V+DI6eiNZA7CGusTtulHsjxFQbbgkTe0weezwKiy+3ek8c5Y1i2oETAOPs7IEW7aEgnvOqBb0FoY9fJRY0wCYbaovOZ0Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRApiqJymfjQp3i0WAg0cN5X7raHcowfOSSY5RNR8cM=;
 b=GeoruxTll6lbFVYelvjaT8E5RehtC7ZwaGV/9ps+O/cI46WhjF/8iN5G5L+7jgnxDz7sLFPYv1XCgFjnv38ZTkvS6ERYQu8f5Oiv40DAi6HP6ChcdFT3D+zVG6JlxxsmsoKPwoIC+BCpdEZMzED8fKd7cXcVz2o4ETzCuC98qiEZDfGIef4H0kI0J4lkdMoxAe4pVyfjFH3NpdixvbpVZ1DxVSMdv7HTTOgKNGTS0i9ioFmW3Bgyir0i4a1JgLHyWm3UQvDbmqCRsoikrqq5I+8TgW4jsmplKPf2WVyxZQ9qhPv2y+/gJb4TKif7nzomyLTdpNIHzDMFByODGU3IPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by LV2PR11MB813179.namprd11.prod.outlook.com (2603:10b6:408:416::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 05:57:58 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 05:57:58 +0000
Content-Type: multipart/alternative;
 boundary="------------G5eCouMeIoTwehwWg7kePmu4"
Message-ID: <07319064-e31e-47d2-a95f-a6fcd3a9db82@intel.com>
Date: Wed, 2 Sep 2026 11:27:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] drm/xe/hwmon: expose pwm[1-3]_enable
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
 <20260717041757.2759084-6-karthik.poosa@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260717041757.2759084-6-karthik.poosa@intel.com>
X-ClientProxiedBy: MA0PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::19) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|LV2PR11MB813179:EE_
X-MS-Office365-Filtering-Correlation-Id: a6605aec-ffe3-44fe-e707-08df08b7237b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|4143699003|6133799003|8096899003|22082099003|5023799004|56012099006|18002099003|18092099006|11063799006;
X-Microsoft-Antispam-Message-Info: e3qIRgKd6QjtYz3nzWOQKrgh+onkGtQ7oeUej1j0lhCGpiYf5Yuc4N9tstNPWHxhIrZVUC+FkgC/3vgG1/5K/RxCYNT297VZ/bhJoeWtq0LQbK/iZNxftqmpEK5O6b37ik7ycREhSZDx0Y92GHPRmWGaUO0yUzPAGyeXNvslh9d2xDjNmK0oGQ1CXU6CxAuLBhHZ3RgYvukZmbVIVcXy9mrdN3Q77gLPnC/X5bB0lpylH+JbnmgngVqkhCgkx9XCWT/7Zo893/OM7RoOOSUVEqoqxgpyeWJ4PIRfLW5ztd2e5jpXHPZT9xY2UYEQRt96OKmU3lhrwwm/6dpLvxZ76vOSyOPl611iNOMeIJnUlppYiVFExaH+yvTsGaWp+sPpBcccP4nTgvrcLXux/9rhU1WvMYoKcuYdfUeB8WopgRoAwxmF/UzE2sfXlmEHYDPQ/73uEeHHCCgkCIv8jE/1UPxoMRMIys/qm5z8vBH58sQottDOMxUp4Ef5MjPyN9Z0eEPGRBqZHf8BC1EMVcMUkcK6j0leI//OvctlAIXZ4J0L9hAfp3m8C4bAa4pnCeQrCa5RZVAfwKyJCJsPzlMGJj507NWysa9XbKmc//WhBPCpEhiCPqMdJkEPFrK/1sP7oVMz7wqglLuCurLbte2ybsq9DU7DAOUDeoF7K2UK2oM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(4143699003)(6133799003)(8096899003)(22082099003)(5023799004)(56012099006)(18002099003)(18092099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VU5adytWSnk2Q0RRdkVVS1NSSmVTMGtIeFJFVlByTlFOb0tBM0o5UURsT2M4?=
 =?utf-8?B?Q3MxVGFKV25UOWtaWnFpNGtadDBnb01TdE5DUWdONHpjd3ZEVFNMRURrU2RO?=
 =?utf-8?B?MFJNanRocHM3NHB5THJPZjRIYWV5ZjBVWEdXbHE1RXBPVG9Db1piNkw5MDZI?=
 =?utf-8?B?OWtIa2IzTFFmVVR5d25mRElVNldqMEg3K3FxRlZsY1BORERZNlY5NXA1Qytl?=
 =?utf-8?B?VnovanJiZlE2ZVBQaXR1ZGR4YktPQVUwVkJnaTB4MllYbUw1NEJmLzd6T1lP?=
 =?utf-8?B?YlBSR3FJK1k5dzZTRTdNcDU3YmhKdTM2c2dHOWx6MzdFUDJqUFVpQnJmTkQ3?=
 =?utf-8?B?eDVIeVFzUllhSGhXLzBlR0Z0WW4xU1FZWjJIOWhXWlhXY3lEQm5mU3lNR0g0?=
 =?utf-8?B?NG0vbnlxdndUOU5PUGcwcHNhNVhYRDhqSUpyTStSSjNPTGxRaGFVaTU2am80?=
 =?utf-8?B?dXpMRml5NFBYbkk2elo0MEJzSUlOTjhONkpSU3owYlY2a3I3TFJQRTA2akJ0?=
 =?utf-8?B?WVFEbEJGYVdtZG1mLzgxUGx0T25WZ1NDUkVLNzZiRVROZ3RycFlSS212R0p4?=
 =?utf-8?B?azFoRk00VDk3OThsbW5ENCt6MVJaZElTbXYyd2hYcHN1MWEzeXJ5QnBzSHAz?=
 =?utf-8?B?YTZ2a3FJQnhxeG9wYzZ0a3lFUDRsN3B2THpoUjVWK2RYU1RncXNHbm1JRE9X?=
 =?utf-8?B?LzltSEQzalJGVDQ1M0IwRmJ1VlZhMExQd3FiRENONzkrSnlXU29qL2kxR3dC?=
 =?utf-8?B?OG9zQmY3bm5NRXh4NWJXc0U4dXllQ29nRGxxSTgxZTJ4aVVKUkExTDBUK3Vz?=
 =?utf-8?B?aUlJVGlSdGZva3ltUFRoeUZHdnRySVBpQXRncjhvNnYrK1lXMXZMM3B1eHZV?=
 =?utf-8?B?UFFOeTd1K2NlVXhqQUhiUWlkelZLL1hZOHFpY0JQbUs1cUNDVFdMbHpiOFBB?=
 =?utf-8?B?L05oQzlQTDZPYXdwdjBUUWtid1RjRjNtQXBmOGw4TzZycTRnbXN6TmFtNE83?=
 =?utf-8?B?czVIM0dOUXI1bXZSUFJtK05PWlhGUytWSHVPZ1ZidTUrWDRxendCNVpPbElH?=
 =?utf-8?B?aDFwTUVSVWVZMWFENy9xMDN1T20wb1NadFc2RVZiNTViRWZjTERIaFdXRmk4?=
 =?utf-8?B?a1BuMTJGZkNnamZzRFoxL25MaGQ2Y0YyMTRCVC9naG5vUUpFRVJhblpzMFpi?=
 =?utf-8?B?SFRBRUhrbjFTZ1RmdzZvZzZjclRhWFJKeTV6bzVNZ0FIa3l0QTdNdEdCQkUy?=
 =?utf-8?B?NUhKTVlNdE1La1JER2UyT0xpb0kzUGhaa3lYLzNnbmFXZWN0eHBiQm9USFY0?=
 =?utf-8?B?bWQyZjBVdVVFWEdOb2xuUEwwV2JZeTlpNWVzeTBHbVp6UzFDbnVIWDd5L3BK?=
 =?utf-8?B?eWdWK0dCTDlOTFBMVDRDVFZFL3F2WmVCZWd4bi9XM0FKcEh0czhRYXVRZUNI?=
 =?utf-8?B?VUVUSWNVZWE2cmNqS0UxR1BNQVJKK3lBb25mMWFQT0svUStZaTEyVVlLSFRT?=
 =?utf-8?B?N0wvNUhoaTF5MUh4dkd3aGhHTXhBTFg1N2wwRTNmVFVTNkRhYlpZTzRzUS85?=
 =?utf-8?B?TERrT2NrNDhDVTVXN3ZpdkIrem1yTDNQL2NaQ2RtK3hXYzVTTEs3S2FQeGN0?=
 =?utf-8?B?eE1XODdTbGc5Y3A2Qk1NQUVQVVNuUUpsYVdTU3h0Nmt1bDJxTG0yeGM2S3NC?=
 =?utf-8?B?aHNFVUtTNG1RdlhxdURzYTlLSS9PUW1MdlB5aHhkeHdoNHNlT296bWRYWFpI?=
 =?utf-8?B?UXNHRUw5Tk1ZNHVOcTl0U1RMcUdjL2tVOWRJbzlSWmU0WENkOGl4MlJibTRJ?=
 =?utf-8?B?ZXFnZCtqTlBsUENZUTZBQmpwUHY1UmJHRUFIQ2VGWXNoVjF2emtmYWszdFln?=
 =?utf-8?B?UGc2Yi9SVGVtenFWVGdwWUZyRFYwRkE1WC9SSEZibmM3akp0WGRmbkhaL0Z2?=
 =?utf-8?B?ZkNydDErN2lHdXIxNTlRbFJRSEMwTnU4OVV3QWdxbkJxVWF0YU91VVZhQkJi?=
 =?utf-8?B?QVFJYmNqZUdsRlBXNmZGVnFZY3E4elo2MkY5c2c1UkJYTktsamlHWGVqVnRV?=
 =?utf-8?B?ZGFkdnNmUEFXM3JrU3VIbWRHZ3NCTkZSaWNidVdzVEhEdjRTMzJWSXQyWkJL?=
 =?utf-8?B?QWRUVzQxU0FhOU81QXZQK1FoU1hna2orNjVPbFV3R3dsVXZjcVpKZndmei9u?=
 =?utf-8?B?dE4vZmlWUkF6QUN3OTR1UjNpd2hidG9TcWtjZHp2bS9qeUFCLzNlV1AzOE81?=
 =?utf-8?B?L2JGOHh6eHRESHp0Zm82TEk3NFBMNVlJWnZnS0RhOW5JbVRNUjIyUUtQYWp1?=
 =?utf-8?B?c2FZbzlDVVNwRHVacmJUd2I1eTlDa1A3aTNVd2M5UmlnK0N4YjlKUT09?=
X-Exchange-RoutingPolicyChecked: HGwDBk+hWA9FiZNHE1rCrI+zGSTJWtDZIIpsuV60CA1UxKB/wDHXOQNihmGxMYK8DOhAa+Rq8nY94lgEWER8sE4CClH+7/GUH9JFe+gUuYhyt3QjCZ2FQ8zp5JuEyzc0wxh8FgekO74Gt2Em8kLOfmK8d4Smsi8RoWw0xrZsGeoiGEKmCdqNWhZtwnSSxT0iPzkumbix3GpseO3rir59Y6lzaQMqyTecUUyH42NBiOlhjN2PVvtjSEMgT4WaLXgePevGkxSVtcwCvYOh+F5LBtlVSg7Q0WIA1EuSZKe3g+rvcZlXXkbWQEJ/KgVpkj9YiVidXfKe8mhrHpD6fgQLYg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a6605aec-ffe3-44fe-e707-08df08b7237b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 05:57:58.3240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ZYPViRz1QlQv6Zi+G8cesTZKKBN/qWP1p2B5bMx8+/pIJCqnKN477XCq01KkCL1T01yrou/sCcqBy6emha5fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB813179
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

--------------G5eCouMeIoTwehwWg7kePmu4
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Karthik,

On 17-07-2026 09:47, Karthik Poosa wrote:
> Expose pwm[1-3]_enable for fan control mode selection.
> Value of 0 runs fan at full speed.
> A value of 1 keeps user fan-table control active, while value 2
> switches back to firmware control.
>
> Update Xe hwmon ABI documentation for pwm[1-3]_enable.
>
> v2:
>   - Use xe helpers for dmesg logs.
>   - Update kernel version in Xe hwmon documentation.
>   - Correct level of some dmesg logs.
>
> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
> Assisted-by: Codex:gpt-5-4
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 11 +++
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 91 ++++++++++++++++++-
>   2 files changed, 100 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 7383898890aa..effc7d38ce1f 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -330,3 +330,14 @@ Description:    RW. Target fan PWM duty value in the range 0..255. 0 is zero
>                   fan speed and 255 is 100% fan speed.
>   
>                   Only supported for particular Intel Xe graphics platforms.
> +
> +What:          /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]_enable
> +Date:          July 2026
> +KernelVersion: 7.2
> +Contact:intel-xe@lists.freedesktop.org
> +Description:   RW. Fan control mode selector.
> +
> +               Use value 0 to run fans at full speed. Use value 1 to enable
> +               user table control and value 2 to use firmware default behavior.
> +
> +               Only supported for particular Intel Xe graphics platforms.
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index d3379727b1a9..fa9dbadd5fd6 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -123,6 +123,15 @@ struct xe_hwmon_energy_info {
>   	long accum_energy;
>   };
>   
> +enum xe_fan_pwm_enable_mode {
> +	/** @XE_FAN_PWM_FULL_SPEED: force all user table points to full speed */
> +	XE_FAN_PWM_FULL_SPEED = 0,
> +	/** @XE_FAN_PWM_MANUAL_USER_TABLE: use the driver-managed user table */
> +	XE_FAN_PWM_MANUAL_USER_TABLE = 1,
> +	/** @XE_FAN_PWM_AUTO_STOCK_TABLE: use the firmware stock table */
> +	XE_FAN_PWM_AUTO_STOCK_TABLE = 2,
> +};
> +
>   enum fan_table_type {
>   	/** @STOCK_FAN_TABLE: firmware-provided fan table */
>   	STOCK_FAN_TABLE,
> @@ -169,6 +178,10 @@ struct xe_hwmon_fan_info {
>   		u32 max_rps;
>   	/** @min_pwm: minimum fan PWM */
>   	u32 min_pwm;
> +	/** @pwm_enable_mode: current xe_fan_pwm_enable_mode */
> +	u8 pwm_enable_mode;
> +	/** @is_full_speed: flag indicating if fan is in full speed */
> +	bool is_full_speed;
>   };
>   
>   /**
> @@ -803,7 +816,9 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
>   	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, HWMON_F_INPUT | HWMON_F_MAX,
>   			   HWMON_F_INPUT | HWMON_F_MAX),
> -	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT),
> +	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> +			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> +			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
>   	NULL
>   };
>   
> @@ -1033,7 +1048,8 @@ static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
>   	}
>   
>   	fi->fan_table[USER_FAN_TABLE].fan_control_point_count = point_count;
> -
> +	fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
> +	fi->is_full_speed = is_full_speed;
>   	return 0;
>   }
>   
> @@ -1046,6 +1062,11 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
>   	int ret;
>   	int point;
>   
> +	if (fi->pwm_enable_mode == XE_FAN_PWM_AUTO_STOCK_TABLE) {
> +		xe_dbg(hwmon->xe, "fan %d manual table is not active, cannot set pwm\n", fan);
> +		return -EINVAL;
> +	}
> +
>   	/* Read user table fan point count, if it is not set, activate the user table */
>   	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
>   	if (ret)
> @@ -1078,6 +1099,9 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
>   		xe_dbg(hwmon->xe, "failed to update fan %d user table count, ret=%d\n", fan, ret);
>   		return ret;
>   	}
> +
> +	fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
> +	fi->is_full_speed = false;
>   	return 0;
>   }
>   
> @@ -1134,6 +1158,9 @@ static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>   			       fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed);
>   		}
>   
> +		/* Set PWM enable mode to automatic i.e stock table in use. */
> +		fi->pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
> +
>   		/* Read minimum fan PWM */
>   		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_FAN_MIN_PWM, fan,
>   						      &fi->min_pwm);
> @@ -1585,6 +1612,7 @@ xe_hwmon_pwm_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   
>   	switch (attr) {
>   	case hwmon_pwm_input:
> +	case hwmon_pwm_enable:
>   		return 0644;
>   	default:
>   		return 0;
> @@ -1669,6 +1697,9 @@ xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   		*val = DIV_ROUND_CLOSEST(fi->fan_table[USER_FAN_TABLE].fcp[0].speed *
>   						U8_MAX,	100);
>   		return 0;
> +	case hwmon_pwm_enable:
> +			*val = fi->is_full_speed ? XE_FAN_PWM_FULL_SPEED : fi->pwm_enable_mode;
> +		return 0;
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -1677,11 +1708,15 @@ xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   static int
>   xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
>   {
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	struct xe_hwmon_fan_info *fi;
>   	int ret = 0;
>   
>   	if (channel < 0 || channel >= FAN_MAX)
>   		return -EINVAL;
>   
> +	fi = &hwmon->fi[channel];
> +
>   	mutex_lock(&hwmon->hwmon_lock);
>   
>   	switch (attr) {
> @@ -1692,10 +1727,62 @@ xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
>   		}
>   		ret = xe_hwmon_set_user_fan_pwm(hwmon, channel, (u8)val);
>   		break;
> +	case hwmon_pwm_enable:
> +		if (val == XE_FAN_PWM_FULL_SPEED) {
> +			/* Set fans at full speed. */
> +			ret = xe_hwmon_activate_user_fan_table(hwmon, channel, true,
> +							       STOCK_FAN_TABLE);
> +			if (ret) {
> +				xe_warn(hwmon->xe,
> +					"full speed enable for fan %d failed, ret=%d\n",
> +					channel, ret);
> +			}
> +		} else if (val == XE_FAN_PWM_MANUAL_USER_TABLE) {
> +			/*
> +			 * Manual fan speed control using user fan table.
> +			 * If user fan table is not programmed, it would be initialized with
nit: s/programmed/populated/
> +			 * clamped stock points which allows manual control with some
> +			 * default points.
> +			 */
> +			ret = xe_hwmon_activate_user_fan_table(hwmon, channel, false,
> +							       USER_FAN_TABLE);

How can USER_FAN_TABLE be the source of itself ? Should it be 
STOCK_FAN_TABLE ?

Thanks, Soham

> +			if (ret) {
> +				xe_warn(hwmon->xe,
> +					"failed to activate user fan table for fan %d, ret=%d\n",
> +					channel, ret);
> +			}
> +		} else if (val == XE_FAN_PWM_AUTO_STOCK_TABLE) {
> +			/* Switch to stock table specifying the user points to 0. */
> +			ret = xe_pcode_write_timeout(root_tile,
> +						     PCODE_MBOX(FAN_SPEED_CONTROL,
> +								FSC_WRITE_NUM_FAN_CONTROL_POINTS,
> +								channel),
> +						      0, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
> +			if (ret) {
> +				xe_warn(hwmon->xe,
> +					"failed to disable user fan table for fan %d, ret=%d\n",
> +					channel, ret);
> +				break;
> +			}
> +			xe_dbg(hwmon->xe,
> +			       "automatic control enabled for fan %d using stock table\n",
> +			       channel);
> +			       ret = 0;
> +		} else {
> +			ret = -EINVAL;
> +		}
> +		break;
>   	default:
>   		ret = -EOPNOTSUPP;
>   		break;
>   	}
> +
> +	/* Update PWM enable mode and full speed status if no error occurred */
> +	if (!ret && attr == hwmon_pwm_enable) {
> +		fi->pwm_enable_mode = val;
> +		fi->is_full_speed = (val == XE_FAN_PWM_FULL_SPEED);
> +	}
> +
>   	mutex_unlock(&hwmon->hwmon_lock);
>   
>   	return ret;
--------------G5eCouMeIoTwehwWg7kePmu4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Karthik,</p>
    <div class="moz-cite-prefix">On 17-07-2026 09:47, Karthik Poosa
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260717041757.2759084-6-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">Expose pwm[1-3]_enable for fan control mode selection.
Value of 0 runs fan at full speed.
A value of 1 keeps user fan-table control active, while value 2
switches back to firmware control.

Update Xe hwmon ABI documentation for pwm[1-3]_enable.

v2:
 - Use xe helpers for dmesg logs.
 - Update kernel version in Xe hwmon documentation.
 - Correct level of some dmesg logs.

Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
Assisted-by: Codex:gpt-5-4
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 11 +++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 91 ++++++++++++++++++-
 2 files changed, 100 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 7383898890aa..effc7d38ce1f 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -330,3 +330,14 @@ Description:    RW. Target fan PWM duty value in the range 0..255. 0 is zero
                 fan speed and 255 is 100% fan speed.
 
                 Only supported for particular Intel Xe graphics platforms.
+
+What:          /sys/bus/pci/drivers/xe/.../hwmon/hwmon&lt;i&gt;/pwm[1-3]_enable
+Date:          July 2026
+KernelVersion: 7.2
+Contact:       <a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
+Description:   RW. Fan control mode selector.
+
+               Use value 0 to run fans at full speed. Use value 1 to enable
+               user table control and value 2 to use firmware default behavior.
+
+               Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index d3379727b1a9..fa9dbadd5fd6 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -123,6 +123,15 @@ struct xe_hwmon_energy_info {
 	long accum_energy;
 };
 
+enum xe_fan_pwm_enable_mode {
+	/** @XE_FAN_PWM_FULL_SPEED: force all user table points to full speed */
+	XE_FAN_PWM_FULL_SPEED = 0,
+	/** @XE_FAN_PWM_MANUAL_USER_TABLE: use the driver-managed user table */
+	XE_FAN_PWM_MANUAL_USER_TABLE = 1,
+	/** @XE_FAN_PWM_AUTO_STOCK_TABLE: use the firmware stock table */
+	XE_FAN_PWM_AUTO_STOCK_TABLE = 2,
+};
+
 enum fan_table_type {
 	/** @STOCK_FAN_TABLE: firmware-provided fan table */
 	STOCK_FAN_TABLE,
@@ -169,6 +178,10 @@ struct xe_hwmon_fan_info {
 		u32 max_rps;
 	/** @min_pwm: minimum fan PWM */
 	u32 min_pwm;
+	/** @pwm_enable_mode: current xe_fan_pwm_enable_mode */
+	u8 pwm_enable_mode;
+	/** @is_full_speed: flag indicating if fan is in full speed */
+	bool is_full_speed;
 };
 
 /**
@@ -803,7 +816,9 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, HWMON_F_INPUT | HWMON_F_MAX,
 			   HWMON_F_INPUT | HWMON_F_MAX),
-	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
 	NULL
 };
 
@@ -1033,7 +1048,8 @@ static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
 	}
 
 	fi-&gt;fan_table[USER_FAN_TABLE].fan_control_point_count = point_count;
-
+	fi-&gt;pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
+	fi-&gt;is_full_speed = is_full_speed;
 	return 0;
 }
 
@@ -1046,6 +1062,11 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
 	int ret;
 	int point;
 
+	if (fi-&gt;pwm_enable_mode == XE_FAN_PWM_AUTO_STOCK_TABLE) {
+		xe_dbg(hwmon-&gt;xe, &quot;fan %d manual table is not active, cannot set pwm\n&quot;, fan);
+		return -EINVAL;
+	}
+
 	/* Read user table fan point count, if it is not set, activate the user table */
 	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &amp;point_count, USER_FAN_TABLE);
 	if (ret)
@@ -1078,6 +1099,9 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
 		xe_dbg(hwmon-&gt;xe, &quot;failed to update fan %d user table count, ret=%d\n&quot;, fan, ret);
 		return ret;
 	}
+
+	fi-&gt;pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
+	fi-&gt;is_full_speed = false;
 	return 0;
 }
 
@@ -1134,6 +1158,9 @@ static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
 			       fi-&gt;fan_table[STOCK_FAN_TABLE].fcp[point].speed);
 		}
 
+		/* Set PWM enable mode to automatic i.e stock table in use. */
+		fi-&gt;pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
+
 		/* Read minimum fan PWM */
 		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_FAN_MIN_PWM, fan,
 						      &amp;fi-&gt;min_pwm);
@@ -1585,6 +1612,7 @@ xe_hwmon_pwm_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 
 	switch (attr) {
 	case hwmon_pwm_input:
+	case hwmon_pwm_enable:
 		return 0644;
 	default:
 		return 0;
@@ -1669,6 +1697,9 @@ xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 		*val = DIV_ROUND_CLOSEST(fi-&gt;fan_table[USER_FAN_TABLE].fcp[0].speed *
 						U8_MAX,	100);
 		return 0;
+	case hwmon_pwm_enable:
+			*val = fi-&gt;is_full_speed ? XE_FAN_PWM_FULL_SPEED : fi-&gt;pwm_enable_mode;
+		return 0;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -1677,11 +1708,15 @@ xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 static int
 xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
 {
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon-&gt;xe);
+	struct xe_hwmon_fan_info *fi;
 	int ret = 0;
 
 	if (channel &lt; 0 || channel &gt;= FAN_MAX)
 		return -EINVAL;
 
+	fi = &amp;hwmon-&gt;fi[channel];
+
 	mutex_lock(&amp;hwmon-&gt;hwmon_lock);
 
 	switch (attr) {
@@ -1692,10 +1727,62 @@ xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
 		}
 		ret = xe_hwmon_set_user_fan_pwm(hwmon, channel, (u8)val);
 		break;
+	case hwmon_pwm_enable:
+		if (val == XE_FAN_PWM_FULL_SPEED) {
+			/* Set fans at full speed. */
+			ret = xe_hwmon_activate_user_fan_table(hwmon, channel, true,
+							       STOCK_FAN_TABLE);
+			if (ret) {
+				xe_warn(hwmon-&gt;xe,
+					&quot;full speed enable for fan %d failed, ret=%d\n&quot;,
+					channel, ret);
+			}
+		} else if (val == XE_FAN_PWM_MANUAL_USER_TABLE) {
+			/*
+			 * Manual fan speed control using user fan table.
+			 * If user fan table is not programmed, it would be initialized with</pre>
    </blockquote>
    nit: s/programmed/populated/
    <blockquote type="cite" cite="mid:20260717041757.2759084-6-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			 * clamped stock points which allows manual control with some
+			 * default points.
+			 */
+			ret = xe_hwmon_activate_user_fan_table(hwmon, channel, false,
+							       USER_FAN_TABLE);</pre>
    </blockquote>
    <p>How can&nbsp;<span style="white-space: pre-wrap">USER_FAN_TABLE be </span>the&nbsp;<span style="white-space: pre-wrap">source of itself ? Should it be STOCK_FAN_TABLE ?</span></p>
    <p><span style="white-space: pre-wrap">Thanks,
Soham</span></p>
    <blockquote type="cite" cite="mid:20260717041757.2759084-6-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			if (ret) {
+				xe_warn(hwmon-&gt;xe,
+					&quot;failed to activate user fan table for fan %d, ret=%d\n&quot;,
+					channel, ret);
+			}
+		} else if (val == XE_FAN_PWM_AUTO_STOCK_TABLE) {
+			/* Switch to stock table specifying the user points to 0. */
+			ret = xe_pcode_write_timeout(root_tile,
+						     PCODE_MBOX(FAN_SPEED_CONTROL,
+								FSC_WRITE_NUM_FAN_CONTROL_POINTS,
+								channel),
+						      0, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
+			if (ret) {
+				xe_warn(hwmon-&gt;xe,
+					&quot;failed to disable user fan table for fan %d, ret=%d\n&quot;,
+					channel, ret);
+				break;
+			}
+			xe_dbg(hwmon-&gt;xe,
+			       &quot;automatic control enabled for fan %d using stock table\n&quot;,
+			       channel);
+			       ret = 0;
+		} else {
+			ret = -EINVAL;
+		}
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
 	}
+
+	/* Update PWM enable mode and full speed status if no error occurred */
+	if (!ret &amp;&amp; attr == hwmon_pwm_enable) {
+		fi-&gt;pwm_enable_mode = val;
+		fi-&gt;is_full_speed = (val == XE_FAN_PWM_FULL_SPEED);
+	}
+
 	mutex_unlock(&amp;hwmon-&gt;hwmon_lock);
 
 	return ret;
</pre>
    </blockquote>
  </body>
</html>

--------------G5eCouMeIoTwehwWg7kePmu4--
