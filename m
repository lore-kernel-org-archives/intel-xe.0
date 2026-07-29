Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D92AC53200
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 22:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103E210E07A;
	Wed, 29 Jul 2026 22:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MsFcp3Bz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36C110E07A
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 22:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785363470; x=1816899470;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zoXYDLtU1vkWAWVAi6rCfWpAChFnRr2Rci+NI9B6j10=;
 b=MsFcp3BzMacZU4w/DL97BAcRnMItYbFojxbnqRxKcK4zYTigr01sc1/s
 TeDtV1tymBalAKlgL1wuS84rUFmUYhyVAgsvIfQDrUcxNDVT8H0q7cw8t
 SNH8o/07JTIPSZhcSAaDIwe9WFHMuxrGu2vEu0cWKn98JADZ59Iq2VuKJ
 pFzUVxKelwGd3mTA3XI3tJBIodsYjjaD5KhGOcnwIpkrboUYB55Fm1YQQ
 SaMNsN3xMLxI0fS9AFm7tew5B8Mx2hQ5u2kkhTEyiBEzo739w9zM3RCnq
 c+Fvmu7Uk9bhGAVEZMAE73vG2wLndElZDryKIdjUnZjYkAhiQBlfekiX3 A==;
X-CSE-ConnectionGUID: Ps1Jxl2pTV2Hbrw8UKcRhw==
X-CSE-MsgGUID: dK58e0r/SI2obQkt1QUUjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97494746"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="97494746"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 15:17:49 -0700
X-CSE-ConnectionGUID: 0YqnaRX1TwqKoFLrK/JB7Q==
X-CSE-MsgGUID: 66as4iN5Qxe2teFCMjniUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="257453897"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 15:17:49 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 15:17:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 15:17:48 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 15:17:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NLP/ld2cPPLam3kDsJrFogTbcTiyJyPe9WbLqTFhn4PQ90UJfsIW+Zvq2XH3W1KLHHApOeC5zhsHybcKAy9vWZRsdRUqRQiTxtNWgAjq77OwZpqWiwjst0oV6lyTavOj1c4XbXsxk0CD73JFl3A3TN/+JBAiaikADlpIxA4tanYuxc2uVJcC9hz8v+II4UveGiOjch5ZGMNjHTXa0OZ4sm7c9HXqztmZH6CeH2BxkSZzXrAykvl2X9OJEHPgNMyJGZcMpS/wsPdc6b8fGbPTL7oc+1skV2Ak/9B1dyDgCrUOnkGwoc2WQrNmhsYhZtdfzTeZvGu3Od+Pd/CT/cgDqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9BwxfW+Yk4m4gfjvU6/ddZPBVochzVC+5fuECYMAV8=;
 b=RxyZEH+xMu4hPULqQIH95logD6w+8j7ihRcOSlKtRfGS4bJ0JlSqsfPnFVkPBZoZnHKGKI/dT8OFqwWd8g8UC97Rz7QWUDwnZsOVbo1GgYNGjgFk80WGn4dNvOkLyRKQb04V+0kSLjAQhXwB8RiL2xMQnayz9NfHbQqeYCASLg7rpKtXGTuMu77fU2Hkqq/rfQnJELWVOk6Yi3t3IYJzVeDb6heQqfBPYqAo3VRhiqVptZco5OnTnaOsB8/blJQEPYHEWikJWFUSi67lUoBFTUkMMXbhWiXeONLJ7AjcrXC4unmyh3oQfApHtPL+B3naXWBOE251/24jCmq4ZKWXxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS0PR11MB8665.namprd11.prod.outlook.com (2603:10b6:8:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 22:17:41 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 22:17:41 +0000
Date: Wed, 29 Jul 2026 15:17:39 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/2] drm/xe/oa: Extend OAM unit hwe assignment for new
 dGfx
Message-ID: <amp8AwEXp6/jfkjY@soc-5CG1426VCC.clients.intel.com>
References: <20260727172712.2877706-1-ashutosh.dixit@intel.com>
 <20260727172712.2877706-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260727172712.2877706-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0259.namprd04.prod.outlook.com
 (2603:10b6:303:88::24) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS0PR11MB8665:EE_
X-MS-Office365-Filtering-Correlation-Id: 41412d46-974a-47bb-b89a-08deedbf34d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: lV/s4L16hWfX9VMxqv+5tgN/v2yApN3rAuzi2QHoyShNmSuvT8VkhxdTCSIS21vudQL9LSROVsi5QrpeT7FIj01v2ZqMnxEV28fpKjdaHqbNLguD6rBPkY2IV/6MeaHrkNU1SxrepQzhupCdE/Mxeb4XfyXzN93x4OebggoX5+3Xt8Rv1XOOwpgdltE9gm2Yw74xolHGyudXlkfZKr8/IuV8l/wbjw49/DZ/nua7KZoccQORB5MskQV8idB1zlE44ahPFKzPjNgdg61tpTeaZhmOcNYic4GN5VB+5m3+p1xql31ab1j0uFSWVZYafqzuFQq4Ijj8xqb00YzonOH7pyexGgIBrm9/m1ngQuBR6iJ37z8WN9WPO8YKhBevEkU9E7zbthhpcgr6iVeqrV6h8FKOamfLgOCSy+elb9EQEgk9BVNt8cdDIWKheODPCgaeA/G14Cxhh30PPbqBwJ/PM0WfhnMXTnI4MA6OU3/dZtUNIA84osjQ458tKFwzOJSSaTgkBVISwDteF7bUWL7/Rv1Rn7S3Nyz9y4GiZwZetbm1atYByToKGiy7bVS6Uti3GBIEkWStvdjuIIAR8DnCrpEQLSKe1R/VaOIgLK2NrumTvXu8xT6I0BDg1UFPeJLqIY3ytZdZOZm7Nwk1epuGJjoULsrU4O1jO8wR2kIgoi0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czM2a2FWalN1ZUZ3WXFtb1Nnb1VlamYzbVBqYk9FSWFjZnl1WnNDUStNZUpo?=
 =?utf-8?B?MWRQTmRFTHZIS01VTUtPdUdHMHNIV0Z5NXZhdU9Mak1YZjlOQXRvbmYvYnhG?=
 =?utf-8?B?R1FnOHA5cG1aZm9OVE1tZEdJeHIxdjF5VjlMWXZZallhOW9rT2toejN0TVVh?=
 =?utf-8?B?ZHM0Yno1VFpqV0VWVWhCRFlVQld3Wkt5V09UU0dCM2p4T2tPTTBKM1BpR041?=
 =?utf-8?B?cGFiZFJHbnN2RUgyU1pnN2lqaHNiSTRHVEFQKzVsbkN4anFIK3ZxSG1wVzRo?=
 =?utf-8?B?Z3N0TVhRMnhBYnZ2d2M3VEVRVkpDLzFWQk5FcldBU3hQM1BYcW5nMVZxK05V?=
 =?utf-8?B?WWJiaVA3QS85Uzc3cENDTU9DUlZHNWNwdDZvdXNmT3ZCUlNTSm16enMxQm53?=
 =?utf-8?B?VEVubFd2ZjI0Sk1xTEpYMnVLTXpPZTROU0MrYTFOMFJRWlpoaE5SL3ZKd0FD?=
 =?utf-8?B?MXJ5a3FpRHhqNm1WeUhmZWtZNVhtbzNRU2lGOFlXMDN4TlIyT0UvRU00cll6?=
 =?utf-8?B?bEFHODJZMjdDV1d3VDhBcFBSU0Y3QTdMOEtoenc5UWlIazMzWXZBK0Rhai9Q?=
 =?utf-8?B?OG11bGNZSzZyQmdOVE1tUHk3OWk4TWZnazQwZVpQdGozanlSRDIrVzdaUmZp?=
 =?utf-8?B?MmkzVjRyZ0J2b1kxSFJCL0p5L1NZcnR5VWdsTCs3bG5GSHZYNGp0R3hwZEIv?=
 =?utf-8?B?Wk1GZU9CVTd2eGdSV2tqTHlXUnNqVjBnT0xVQ200REVkUVNJdi8zcXdUcHhC?=
 =?utf-8?B?ZStDS2FmMnF2ODcxbnlrRWREOThKTUttbVNVeGV1STVLSnVhaUdUdko0Y0hC?=
 =?utf-8?B?SzRZSDNxanlIQWpZVlAzbmZqSXVkK3Urd080cWZOVEtVTW5scTh1WHlmREtC?=
 =?utf-8?B?M2ZBdUdhYWhPZjVSWEF1U1ArbGlvd0JFQ1RHRkZ5Vng2a3ZXc0VMS0I5Zjk5?=
 =?utf-8?B?NzA5SHNHNkIzenM2Y3ZVVVp3YjZXYzl1Y0R6MkN4V2ZBa3hRSWNySk00bkJF?=
 =?utf-8?B?L2IvMWIraVBBcmRYSy84Qjk1UTkyOTNtSVV2d2p4YmZ6dEFDMjYyMk4yaGRr?=
 =?utf-8?B?UDA1eEovZWRpQXhiMW90Q1VQU0xTdU1ERlNqQnpOQTh6NG82SzFjTm5HaG45?=
 =?utf-8?B?cFhnWXh5bjNuODRRdXRzWERCbXdBc1Y0ZXU3WHRTM0hWOEQxdDdkRHo4Sk93?=
 =?utf-8?B?TERSVmZpL0FEV0IzbzRPM1k0UEdjVTJoSnAxR0UyTFlJbHZsZU1vcG5pK0FM?=
 =?utf-8?B?SmUxT0ZlZUJGWHF3clJoeDl0b0EyM0RZbHNKclRvMDhWSWVFQVI4R2RiQ3ZX?=
 =?utf-8?B?Qy8zUUhVekVjaWFEbjRZNTA1cnJMWHd4V0hjdzd5MzVxRGtnOXd0MUx4OTg3?=
 =?utf-8?B?eUhQMkRza2NFdXBzc0VmNjB0enhEb1lhOVh4NTAyMXhNTmZKbVdBYis2clRj?=
 =?utf-8?B?bk9yUnJwamQ2L3FmbFY3dXkzY3F5dG0zYzRYSGdTdW9sR3doQkl6czkycE83?=
 =?utf-8?B?eE53QlU2MjVKcHRkZXlESFpFem9kVEZ4VVpJbG9pUkI1bW1xc2tPQkJWSlU4?=
 =?utf-8?B?SFlYWUlvVFlVOHVtdldObUFORmtYUDVKb0RYMTNzNEZKWDZlQTlRNFFVUEhH?=
 =?utf-8?B?SXdpSjZrRFpIWENaOXQvaTFscUI2NHBXaW5tdk9pZzczKzdkL2FoQ0JSK0JW?=
 =?utf-8?B?QkFTNzhKTVdCWjNiQXdBNFp6QWVWTE5mODhTYmdheHdKUHdTM1dCWDVjMjJh?=
 =?utf-8?B?N2o0NzFoczZBVkZSMDBlK3cybmM3UGs5T012WW56WWhUMXFzV0pKd2NMVFFn?=
 =?utf-8?B?aDgvM3FlcEhxS1VkMmhWL21KYkNTSlhmTDVxWlByYkR1Q0dhYmRBMm16YkxU?=
 =?utf-8?B?dVFwZWRySGNxOTdvSVdVU2ZoQUNXcHcyVjNabHlPSm1hWk5wSzFrR0hQa3BK?=
 =?utf-8?B?WEV3YzFYZmZhK1ZteGtLQjBGd2VreENJejlIWXFrS1ZTZDNyL1UxUFJsR25h?=
 =?utf-8?B?MzdWdXBEc2RQSmtveHpweUhpWDhXVU9iK2oxQlVOcW9vVWI4Q21ubDlPaEUr?=
 =?utf-8?B?SklwY3pUcWlwbUhFSVlnbExBT3lhTnVLMS9kekVHQitLakRrdjA5UXlKN0FZ?=
 =?utf-8?B?V0RMQ3V4c2FCRnZtcEJYUjE3d2Nvb2lVQ3lKaE1lK0NDTzg0L0FuMHI3VUkz?=
 =?utf-8?B?K3VraVNJemd2b3d2Z28zdDBZUlcvRkhQNUtIQkRCb2pKUzVZWVlidXFzN3By?=
 =?utf-8?B?bGNyby9sYzZvZ2VKVUNKSmJvckdFajQvOGQ0c2VQRjJsVCsrSFhHWEg0UGJD?=
 =?utf-8?B?QmRFNDNVRzZhNUxicjZwb3djaUJJcTUrbHlnUEhNbU5aam1xK2RDa1NLdnNZ?=
 =?utf-8?Q?K0Feouw1CDYbWPcALrOP+Mt5hz72/Y3GAZbny?=
X-Exchange-RoutingPolicyChecked: nBZ0wQpmXeM+7o1fcEF+49V1GSDk92lNGge9HSKelrT6e82MrsbR+Kn7PFY8uhOngKfcufzcX1d6nAjRVhpmRGOwlC/ffgTcCFw9zzuiEImMvZvJbmujeOwVFJoBrOH229hvn01GgmP4D1amdNfalOMTeq85GJX44OiVdGjkIwrmpnwj8QNv2sAhq4KjAQcvz7SXrmixSJQmhewklMPmgcvLXH01Gf4UJqGipeCFpTtCG2E0v47s3Odne5rPTJAvGdg0GlwA/ze0QyeOnRh/HcHKuhL8j8AmEx3sbNfjwjpE7rNY4CMJWWFRzyd0r5An6lZmWTMykes3czRRPxLh8g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 41412d46-974a-47bb-b89a-08deedbf34d7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 22:17:41.6254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tNvA5ts1cjfTOXr5u8foNVBKwb+C34hneA4V0jURQhuMzginGVpzB8LNsRcxdhlcIFcJmWbG9/VqwW8LV3tMgkGfdwVu+vU+RA0XUhw93mg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8665
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

On Mon, Jul 27, 2026 at 10:27:12AM -0700, Ashutosh Dixit wrote:
>dGfx vecs hwe's for media version 35.00 and later follow the same
>assignment to OAM units as vcs engines.
>
>Bspec: 77977
>
>Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> drivers/gpu/drm/xe/xe_oa.c | 7 ++++---
> 1 file changed, 4 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 21dbd98b2521f..56d51c40093df 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -2624,10 +2624,11 @@ static u32 __hwe_oam_unit(struct xe_hw_engine *hwe)
> 		return XE_OA_UNIT_INVALID;
> 	else if (!IS_DGFX(gt_to_xe(hwe->gt)))
> 		return XE_OAM_UNIT_SCMI_0;
>-	else if (hwe->class == XE_ENGINE_CLASS_VIDEO_DECODE)
>-		return (hwe->instance / 2 & 0x1) + 1;
>-	else if (hwe->class == XE_ENGINE_CLASS_VIDEO_ENHANCE)
>+	else if (hwe->class == XE_ENGINE_CLASS_VIDEO_ENHANCE &&
>+		 MEDIA_VERx100(gt_to_xe(hwe->gt)) < 3500)
> 		return (hwe->instance & 0x1) + 1;
>+	else
>+		return (hwe->instance / 2 & 0x1) + 1;
>
> 	return XE_OA_UNIT_INVALID;
> }
>-- 
>2.54.0
>
