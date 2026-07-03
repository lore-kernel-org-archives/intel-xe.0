Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0D2C43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 20:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C520010F919;
	Fri,  3 Jul 2026 20:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GcLHkOsn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2910710F919
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 20:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783111769; x=1814647769;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5utwDZWZqKhxvYf9C0mTlJi0x4w5jJC/XLaJCN01Vno=;
 b=GcLHkOsnl2V3bwXM5gnPM/n8hshn9oISmWI2DF2JIZ6NkvLKHM05OT5x
 KP+B7WbbN5T8t4kqxBrC4mTI6T49xmJ275ra1zT0XknO5CYGAViCDybd7
 1khcbFwCcxOmYW4KFLjQF3reZ/BNH+lqP47lcm/Gt7bscDn1s5Ic783gO
 MY0LVNpEun9EoePfZCtL/1GHZXJF2Qb6EtHaEottlnOrhz3aOGctZs0eb
 itZQsBgP6MuyrK+anedqVLk3/PhZwx8D4KzqYAhbxdawTOIuhsbfurDKt
 0qJAjAxELpbhiErV4CtUyXqZePsAmOxpnBP+cJDM06rdaD1mr8KAI4SgI w==;
X-CSE-ConnectionGUID: 8EqjF19GRY+9tX1MqEbrFA==
X-CSE-MsgGUID: q3tQ4oXxS0m9Gc5dzH+XUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83910300"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83910300"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 13:49:28 -0700
X-CSE-ConnectionGUID: 1ez9MK7QTp+c1YsXANhqrQ==
X-CSE-MsgGUID: sJnqAONXTvyrbsD5wBIYIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="255102412"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 13:49:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 13:49:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 13:49:28 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.33) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 13:49:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQESUGUt+KBgcdratrmLGITtX8H5CR11Sn+vIYLai9b7j5/lVd0A5y7cYW8UapTuMczosCEt0Iuy6BRZNrT4Oh67gz6KYIVbeBFLiztWLsvTCo4vWvMrNhazW8eRN4oP25xNDXzaGHQa9DXI4edNPBY+ANo1wcJ9/bkWdZSKGYhs2W6lvDCLelJDnAQgaKrQAf6w2ZgWuW4Z9RI+J+Mzep4xjLNJoGeyZy6jPogH10TIZI+jZF4UcJxvTDDvZqL3Xyd+9hdVI4T6+9P6TB7oa3gzFcnv7uHZ5iM9pnaU3lsVrmhtWeVKsfNc/zNKCedR9FLCAodaFxRJrACMWqemGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaWdYWo2+t7B4oTRNkLcHsHbOYzJt9jMwxGsC+jntp4=;
 b=JJNa9vfxakjGE+bCNHnJIu/VETcBIHgSLfek/oXxN9W8S5RYfGacUIoC8VXCTeL9HTD9XhYMsjgda9KKOQoyXXS9Bw0DjpUagynPgi/ftrhof9HIJPequcqLltf5thbTHgpshX0biV3v+IwBaDCP4vBbITgZdqA8+nJ5621n+ZrX1tnByExMPkjR3acx+auw7yKHTfZXZN5MBSJEWvhvf6o3NReMa9xtHs7c2vNG+9DTdUz3WsIIWw8La2sNGDy++jdhfKCWMuQhJz/3DepiEfx69/l+/X48aByYMyNj7sZlYkmPUK5ICmfHUGracMeMHnyPyWMlFOTxHUlkhNw6Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 3 Jul
 2026 20:49:21 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%3]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 20:49:20 +0000
Date: Fri, 3 Jul 2026 22:49:16 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 11/13] drm/xe/tests: Add GuC KLV printer test
Message-ID: <akggDqiFFnDd8EYo@nostramo>
References: <20260630132633.32804-1-michal.wajdeczko@intel.com>
 <20260630132633.32804-12-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630132633.32804-12-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR08CA0247.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::20) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|DM6PR11MB4532:EE_
X-MS-Office365-Filtering-Correlation-Id: b5ae4aaa-f938-4933-d6c4-08ded9448e58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 7q2c0ESzZUnhiaQ4EL1W6qFIKiWu7Ny8xk/NYBc4aW3J3KpvhvE1nJrkhKG6WzoGisuTMMLO/AKz0pW4bl5MT3p0gQxbkFfqisx1gyHBdtk0/M3/oAPX74EymeZITp45D3m+CPQc/nK+ZlxVRzlejdJlMTTjYgr+vF7NQUo+TGbOfHOemK6haP6wxdBth0nysjE38dcX3Mp1b5214BRApuP3X9wC1wDJzApNiWr66rX6zASitsp/sF/k7WM4Rz+efr2/7G53kdcESzYDPEIWNPkDxxW8pEe9FyDmeFXmE4/rxeJ0MjJCpy4mvBTTNyC5UlDdmSAiZ2EpV4gU9IWZ5hPUCA4Wq3CDk4vFsYKeQD6PmjcMzwe1M43IL23XkG1ZjdQiepsQHgiBzUpvWK3jMlxYyxJE+c3kfC3tz2J6QlkZFb3E6RwuQkOapG0TVknxG08XA23C8tGsEbcsxYEKY9ODyBH7yOLc98P3d6npb4O7sVPwYh6VCXHyz0ujdUtV7n8s7EBkn8M8+UW9yBhn06lPgyDVExaDQa3DZ2yI522XfIskgGKEatCb5SIFgLDpb7sPadrBk+61n85si30+p4Pri8Jg6fJZRaUYtdh9qLzxCv3fuE4gIVmGzYSZxWvf/gIYSLfJl5K6O8KIB8sSyO3AYTIomzI3zFzlkVFy5CQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFdJWlQ4cGt5d1RIYVF2T0xYTFliam1GQnQramhmWk11UGxjQzBkTys2aVVP?=
 =?utf-8?B?M1J3cEhrcldmVDVMQVdoUUhnTmtrZkl0VzY5S2tVUHA5bDJYdENXYWl6TW9i?=
 =?utf-8?B?SllSTHBsZERieWtFUkVKU3dPZ0xDaTlGS2xhM1FtMjRKdlYwc2lPUXhyNnRs?=
 =?utf-8?B?RlBhczlLNHhQaEZHVGNUNnZVQVVYTzdkM3R4b2N1cnNhWGZqOEV0WUxmenR6?=
 =?utf-8?B?SjNrbUpDT2Q4Q0prZnRRNklJYjROdkFWNkl1OEg3WkI0akhsTzRRQzVxL2k2?=
 =?utf-8?B?WDJGbWJGaWNDSVBnV2lUSkdlQjdNVFRxNFVmclpKOHhuOHpuQ003VFBHRUFJ?=
 =?utf-8?B?aDBjT1d6ZU1KZ2dCeEQ1a3NBem0yY0V4ZEhmblJ0MjVpcW10MGNvWXQ1aldT?=
 =?utf-8?B?MWsxdUtmakhnbGQ4YUJQK1ZxT1hsejVhbkovT2E0elBBUGlaTHFwd3ppekFn?=
 =?utf-8?B?cVJ2SlFpTk1RRGh4U3ZxcG1uVkx4M0VLbUR1OWVzc283bFh2eEUyNjA3Qkxt?=
 =?utf-8?B?MTRiNTdTbEM4UzhFSmpqNmw2b3EvWXlUYmRkYVlXREpDN0FhTG5NNE9RZGVG?=
 =?utf-8?B?c1VGV2JUM1U3YkJTMytUbHBocFRJMEpCdS9kZGY2WEpnVDQxWmJBVW5xZkll?=
 =?utf-8?B?OWlJb01mbFowNWZvdnBSa2RQQ2Vjc2lqcnp2MjMwZ0NhdlVDdUVKSmNuSTQ5?=
 =?utf-8?B?RE1JaEFiR1dzTDdRTEJURkhWN1VuTzJZNkFLTFRUcEwwSU1JcktxVnZJenlJ?=
 =?utf-8?B?TFhEYVVuc21PakRLV3Yva3djb2hPU0VTTzNhV0hUR3ZvdGkrcDNKZHRVOXM0?=
 =?utf-8?B?Qk1UTGVyT2ZYcWFGajQ1WENLRGUzVXJhdlRUNzFtbGlFQXBvd3lJekRFK1M4?=
 =?utf-8?B?akxEL05IaTYyWjJkMlkvK3BEVjFUSkJwdExBY0RqbUhvcFF4aGtZL1hmVlNw?=
 =?utf-8?B?aGNUYnBPdnlJR1VESTlzaU94Wlp0UTRMbWExSUtIV0xnRzBZV2Jnc2k3UUtp?=
 =?utf-8?B?cFBzUFowWGsvdDdKTERhVW9VNUdXUnpvdkNNdjhTZUh4Ykx0UUpyRndyaE9p?=
 =?utf-8?B?bHNXZ1BSNG9ISlI5Z3ZaaWgwUUxGZDNmL0FnZGp4WWhaRWJkS1drSlJ3SUJi?=
 =?utf-8?B?QnRLZm9kemZSYlBKWXMzMWd1M1o5QkhMeFU5TFN2cWdZVzNTVUJ0OE5hRklo?=
 =?utf-8?B?c0FybzMvRjVpSndobnFhd24xcWNnYit6OGxpdlhhdVc2NjJIcjNkSTZOdDU3?=
 =?utf-8?B?aCs4aG12ZDJHQW9PK0ZFNS9OVFRYUS8vNlpFWlpoNlhXemtBQW51dnNXVXdS?=
 =?utf-8?B?TWI4MlprUlNUQ1ByajZhVk5UTWJubzFsb0QyQmFiZlJSeG00UVkvVlR6N044?=
 =?utf-8?B?aGxMKzBkWXozWitqb2prcXBPckFlV0dyMHZlK3NMVVh2SXhBVThQSmxEWGFY?=
 =?utf-8?B?U1g3Yzk4MmoxM0NsOEdKTmdEeGpwR2lvVFl2Wjhmci9RdU84WjlsWkhQMmhF?=
 =?utf-8?B?MUhvRU1xM1I3OVdYcUsxTkNvc2Vsem5KR2VGNHNOK1IvOGR4dUM2Wks2dThP?=
 =?utf-8?B?YXp3N2lOV1pUOUJDdXdMV3B3bjRYUHpaeC9GM2FNNlRvZW9kOGxWQVNyRURS?=
 =?utf-8?B?NWd0V0UyR0Vrd2JJbElqSUpCYUMxSHoyNXptQUtFZS84cUdjdEVZVjFJZk1t?=
 =?utf-8?B?NGZnWHB4dUo3TWlPa0cwbFIrZVR2bmwwdVNaYXpqelo4elBPQ3ViOUs2Uzdk?=
 =?utf-8?B?QU5VZHRNVTBnV1JUNTBicFozRDU1UURjcUZiYVZLQ01HMXVhK3lGck5VMlpa?=
 =?utf-8?B?Sk1LY3JuNm1TRDdpQUtqeUFUbmhscU11cGVuNzBiYzhmV3h5Z3RMRnQwbHFH?=
 =?utf-8?B?UWpJL0NDSWpzZnNTZVpzVXlFSDhiMjNBWmlnUXlOVmJ0WGhyVXpvUCtGdk9I?=
 =?utf-8?B?U21zdVhVcjBlSE50SEJVSkRkeEpPWnQ3MGg4ejBEazVEbzdibGY1akNwSENC?=
 =?utf-8?B?QkdQOTljcnpNNDRDNThDMDc2QmJnMTJ3WEN5MEppTWZSVDZVWGh2RFdISWcr?=
 =?utf-8?B?emt5WGZJMUNBSzA4TnRneGw2T1Z6TEFYRTJJVmhtMzV2TzR0U2Z5U21uUWYv?=
 =?utf-8?B?UUYxQndkdHNiYytqWHdsblRSUFIwTGs3VzJEclhJNUhlTXJ0SUU5WXhEeW9Q?=
 =?utf-8?B?SEZ5OUVoMU80d1lvcHFZa296b0F2b2hRbFZlQW9zcC93Ym5SZnlUTnZnNGRG?=
 =?utf-8?B?Q0U1Z2U0eUVjN2l3UzFIek83RGdXc05iS3VEWVJTSXdjUFJMRlM2VG81b1VU?=
 =?utf-8?B?SUhndzFDOG5UNXJneHJjYUd3RTRTWlptQmttTzBqRlZocDdtcmEvK2hUU2Uv?=
 =?utf-8?Q?GxINmuYhOVDtwW8A=3D?=
X-Exchange-RoutingPolicyChecked: AEUs8ens794yo34aCjM7nlwa0i+G2EanxNkGQyqcLa/f1M3uY5UlUF6vImEnPeu9bkuT1+ini3DyOyGfPG+EHhWmphCamQH7E8cOilK3HY4qewWBXb8s1KYeJgLhIiXmWyimjUELkVtWFjVtqCzvJdApiyVwokPd12+6cZnzT1MGnN9v0w/D9oucB09dIAdqPZr5IokxeGYbYl2FiFIC39y6ps9WexWX8/liQgNZ7ihvp98k6/wbkiaIZJjiXnH+2HPd8/s2rqIXuqR5p7gSGjNqNp7AZlNAdaZCGBjXLCsjyLZb7KZqJCD0gIkeGcvCszzfHXpNzA6rZWaRDZjomg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ae4aaa-f938-4933-d6c4-08ded9448e58
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 20:49:20.4042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5WZEcakqlQXG9I5uLYGMfvYfriMDu00NqHoaFFfvEE19SuHt7IqXwSMRaY8wxhDAvfTF1oDOP2SJ08q0jvoi2eczge8k7CutTmkwn4H9ldU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4532
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

On Tue, Jun 30, 2026 at 03:26:30PM +0200, Michal Wajdeczko wrote:
> For completeness, add a simple test to exercise the KLV printer
> to make sure it doesn't crash at least.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
>  .../drm/xe/tests/xe_guc_klv_helpers_kunit.c   | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
