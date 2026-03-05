Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10554F513E7
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 23:39:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A121E10EC85;
	Thu,  5 Mar 2026 23:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BUU65477";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D6B10EC85
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 23:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772753943; x=1804289943;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=00kYEZBDE05S6ebuqELgwYIA3Z9p4+tdA1vJANL6DxI=;
 b=BUU65477Qtten+ASSMtnXrJdKF4P/cW9Blilgv0bJHoUAIN6QR8Momyl
 nLaAmn6DGGj4oRQjA+YtKTlip5EUYewgDS6reB+bxpvOEu3lEk+EEwB8x
 vlV8aFh3HKXifT60rmAZ4R+VDlcGPQJieCx5vvWqBkU6UXlwhIJi/Opij
 XVVvF15e8l+qMMozWgd9E7qo8eozCv0zA97yS1/0h61AXOpm+v1pJFWRt
 c2mQQoeWqDBHVK5yYjX2B7jb9Pa8nSWPvru1oDtYpWplW28qqOPqJgzIH
 Dcg5ENU4a6qkRFGRktiVyPucedT01H1GccUqTdxWGhBY3PY9Sp+wCr+1O w==;
X-CSE-ConnectionGUID: M1UgTLHcS1Gt3wDEAx02Pg==
X-CSE-MsgGUID: U7K/mt1FQyaWkvX7RVQEug==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73051939"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="73051939"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 15:39:03 -0800
X-CSE-ConnectionGUID: MS8MeUIYS+ynfK7s9W0Vig==
X-CSE-MsgGUID: XBo10w7AQs2HYwFJ7H7Fog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="218970546"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 15:39:03 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 15:39:02 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 15:39:02 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.0) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 15:39:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HbBrCXCNJLGLIyq8CKbUQDRqV2igwncN93dH4Q1aNq3KQAYoqqVZDBUMFx/H0ips19jyTvnZUi6io8bn2U00xc1EqUvssD96J0eVlyo4e1kT0woBtAhcMXotG8JPxE92RkGflWA7kkCEBlvtBNs+cslfrHqgIdMNbN19dxInM4G3Cr+vXc1xQDRw+oEuYTB7uoUwXkDeCIw6piJCYhSaV9vXSPq68r1X8RPM4apnoz9xLvubsTvdRuqOrI2Tzz7LMDnD+oMDzuoeF+dzpDlEaq98LV2jwuvuby/UwdrmOkCTUbvptHlCzLSlmtqwD8oOkk9dvXc3PVGOfw4p9kAGWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONewIzwiia4PCdcPRAGq87Q9I/7zADg3dLh63YpFJkA=;
 b=mtwN5tOQuNNuJd7noJxPMmr5UarKakacLoEnrsMhARfjxT1JmlMPJhC99e6QC3FrBHIzi1R7M9TWKXzFBsLn0z/YqAHDfstEd6WCf05s82Svb0bqiD9yixiiFouFG4nDd/aH6yp7wLUJU8XLsTP2lOE0+o8lbbiDuYl5LZHu+97qI9dwUw07i5awLSRDe+lUr0PYGjgMp/KOcUVfkkttirec2UIV+LsnsOSSFihX0pmCQqiUgXTsNXIPwBPzvMmPvaQobAISml8JuL0T7tAOh/ImrMhgjwWzuXawyvMB2X1ihDj1BDuIhla6iNdD7S9aS4El469twTvUC7VgwfU1BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MW4PR11MB6713.namprd11.prod.outlook.com (2603:10b6:303:1e8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 23:38:54 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 23:38:54 +0000
Message-ID: <de92b0f6-cee9-49ce-a1e2-3a4fc7ac3b7a@intel.com>
Date: Thu, 5 Mar 2026 15:38:53 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] drm/xe/xe_late_bind_fw: Add support to load Ocode
 firmware on CRI
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <michael.j.ruhl@intel.com>
References: <20260305104441.2857181-6-badal.nilawar@intel.com>
 <20260305104441.2857181-8-badal.nilawar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260305104441.2857181-8-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0183.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::8) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|MW4PR11MB6713:EE_
X-MS-Office365-Filtering-Correlation-Id: a9a5f444-ce68-4804-8f13-08de7b105cc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: 2KgLmBr+RMPsBA3cyKyIEp4YIjpLzpuKsl1AaDxJDp+GC7rZ89pDISDY0kQ7GRAu00BKtZ50CQeaspCX/xeRDiammhcLcjRB8Q0m1M5NVw1SJCRkgkyGozYAbhbxibxWGaseYAWxsgZ1sKkh3kr+IrHosj2MddM1VE6BcUJro4wqOHcj7r4B7qMApSQyC2rg9DzC8KXrvAQU7dVYgqC0wizpD6xlWxxQ5efpWsjygZkPxCVj+8tQkSGxJGQGTe3HOjtL+m38LJ+du8ufhRqpQ4vxwAgOmgS0nXRh0ysQhV1JqXTwgyNLei7KIYMrDwmKM7VlDyUhr/m3RY7blh91Mn+ZcJVvYctoABrXQyUgWIp8NpdxOGSpxcT6g+kUMv0bskjYQGhj1h3+iHNcPyqe7NR7qHI1POZZvSccfKu+gEPQh4DyFtFZMGWqeZYcRjobn/3JniGmj3dwZur4mNLjVKrUtUnqhNV5Mgz8HohD8dSjNrGdOaislzvnR3y5t63BD2P6+WlEFxs6X256zYtterDpuUMd2VBnoGONBF0DGxJTqtsAG8Cz8mxgenJG5z8p3BqXK8V+OAAz7EtSWGruWfjEWl+hA5fBKPIU4mY0Vq+Y3JGjd7s605UWN6uOzVdc/UhdCHpDgIl8eA+lUS4izibS03tu5TZJOTIZ+wJZ3knvuV3Lpft6EuWoaCBw+ComSc2O+WqdHFlyavrVfCwpxdVse3ruhV93Au2H7cB+ews=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7142099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjU2dGxURkoxTzN3OG9mSXRUMzRJb0VMQ3JGV3FuL3NrRWFlaVRpR2w1bmdr?=
 =?utf-8?B?RXhWRWY4TnoweTZ6TFNIZE1DUjF5Rk9INkVEeXJtVFYvdHluU0ZlZFR0QndP?=
 =?utf-8?B?a1djcTE1dnN3RS9lbGZNNTBBQ2drZzVhbU5xcUJwZ20rcG9vRnJVZXJYaHJk?=
 =?utf-8?B?K1g5R21sY2ppWkRwT3ZDK1lFWnZEOU15UVVPdjh3NVNVS1pyZm4zMGNBakRU?=
 =?utf-8?B?a1JjYXhPK21KdUpXdDZWZHRYcWJkdE03QmhHNWx0MWpJM2xEcFNPaE9RTWdQ?=
 =?utf-8?B?MzQyZnZicDh6TktWU2xkcEt5YW04Z0VIZHNHRDVSQldwVFlReGVicnRhTUVl?=
 =?utf-8?B?K3V6aFNKd1AxMjZsTGpENjlDSkM5akhKd2taazdMSEdBeXExNTFGelZTS2dm?=
 =?utf-8?B?Q3pka3NodUpRUllLVWtnRlQveHlqQ0FsM1dWazVTRlNQZFJ3bGhJZTNoaTFX?=
 =?utf-8?B?Q2F0OXVPSnZJdnhudjVyZThtUXVEY1FEQTB0bWUyeFlwTEVONlA0Sm9GSnpC?=
 =?utf-8?B?cmg5d3dQcklSeEVDN1dxMlJ6VTFpMnR2TklqbW8vOGlsb2haYU96UVlGNkYr?=
 =?utf-8?B?NURTN3Q2N0lUOE4xVWZkTTdZM0lScTV2aTNMSWV4Z2hDOFRZRmR5K0tTQXIw?=
 =?utf-8?B?K3p2eUZyMys0RzE1akhRUlJJSTE3eEZuUytxcXp1NXFrSm1uMjBSMjBIdWpl?=
 =?utf-8?B?Tm1reHNpUnpOMWs5eGhkMlRBM1JjTmxnZUM5VEsrQlhXRW5CeStGU1hyUjRr?=
 =?utf-8?B?MUMzVklmZnd0OHdrUVRkeGRzem10N2lUdTlQSUlMZE1HMkE4cVUweG9LdEFT?=
 =?utf-8?B?Nit0dlhiMnliTlRyV2pYelpuTFhCaFlaVDRmQnVsTE5vZjBKejllTzkzMHdN?=
 =?utf-8?B?R0xGMXdvd2pncVA3MzU4VnB4cEI2ZmE4L0JsRm9ZL0swUUYzRURHWFRsQUpV?=
 =?utf-8?B?VVBtdEp2eUhyMUQyeEkzV0x4dGFad3lIUnlaZXg1S2M2cDJzN29WNmFNSk51?=
 =?utf-8?B?V285R3BkZkNKUWs2QmdxZitHNGpHVzFxYVNqek9XVzUycStHekhXMDVtREN2?=
 =?utf-8?B?c0tHM0w5aHE1aGVldzJ1ekxaNkpTd0dsUlUzY1dhTEJSU0xtOWZTVWNxZGhL?=
 =?utf-8?B?bXRBQXhnVklEVUJLeVBHYXFzWERLcGtqMFlhZ0FBUkl5Z3BLalI4b2RZQWQz?=
 =?utf-8?B?Qlc3MWpJRjZ4RDN3NlU3b1haejNZOWNGNFhHNWh3QVphMzZrUTN3dEE3dHVt?=
 =?utf-8?B?M0xqR0o1MlU3aU1zTGc4NXpCclBuRDd4T1pHQnMyaWRLMStyQk56aHdzNDNs?=
 =?utf-8?B?dTQrLzM4eXE2aEhPMWVoTTNBVEFWZXJoSzVZY3oyOXNwajJHd21haG1uUmtP?=
 =?utf-8?B?ZTJjUDhpcUlFU0J3RldOcUFVRzhWelloWVBFOG1mYzlBRFY3MENreHBBY0hE?=
 =?utf-8?B?SFBxd0k1SXk4Tkl6TnJjNjhsalpEeVFzVFNncDl5bWErM25mOEhPbUlacFBG?=
 =?utf-8?B?RXhLbGcxaVQ0SVFJbTFhcUNTczFXNXdiWWFSc2tNK0VYRUdIUHA4Y0FrL0ZE?=
 =?utf-8?B?YVVRV2RNNnhqOHd5eDdJdSswK1NvYVNubk01S3RBZ0NiMXdoVU1WMHg3VFFT?=
 =?utf-8?B?VkJuSE5CVzQ0dkY5SEgxR3ZOUis1MlVyd1JWdXlXZWZPMEZvOFZBYVlZb2dU?=
 =?utf-8?B?KzBIMWdRUUNFb3NTRTNYM3p3UXRKeFNrR0tqTCt6U2tDR3lQZmdGUWQ5U2lw?=
 =?utf-8?B?RGRZSmdKbUZsdCs4dlFLMXRwMjZjMmdGR3o3bk5pS3VtZ3hCaXVKVGh2alFj?=
 =?utf-8?B?S3VuV0hLZnRZVFV4V2pBeENQMnB4YVcyTTBEQi9jUm5HaHBSczU2UnNoT3ZO?=
 =?utf-8?B?WVpJcFJ6Sm9pdkc1cE1mOVI1b1d5NDBKYlM1eUJKb1V5STd4eSt4MEp1SHZJ?=
 =?utf-8?B?QWZtN3FucnVvblJvZWhnQmFZVGF2endGQVFNQ3hLTEJBTkF0NDh2ZzRucks4?=
 =?utf-8?B?MTVmVjRKUnN3Y3kwbTBVdUVxSDI3eGVlek1WZ1hPL0U5N2cvNUhrckg3UVFH?=
 =?utf-8?B?eFJLL1BpRXVqK1NXaGVWQ1JtYjNNOG84OHcxRmZZeS9GTWdKN2hzeFk2a3RS?=
 =?utf-8?B?S1g4eGNTNjJJMUlZM25kQy9LZGs0enZla2ZKUVZ5MXEyRUhSZXpnblN3aDJ0?=
 =?utf-8?B?WGxyS1VRdFRoSW93cllHWk9Qd2tvNTFnT0habEVremp3VExZOURiaktqbTFV?=
 =?utf-8?B?M1J6ZDdhdit2Ulc0MGR3WmxEWitrbGRualFYaS92WXc2VDFIQTdCVHlBUkcv?=
 =?utf-8?B?MVZSTWtTVE41RGRBZDZMODhlenF5MGg3SzUrZmpUNTdjUTZRTS8xaWduTC95?=
 =?utf-8?Q?EG0Q67Ho2/dIOYKM=3D?=
X-Exchange-RoutingPolicyChecked: CvWq3ZSdX4OHoKTpTI4MlgKdMIVJt4iwfz0LklYZWxAQOPeSUfJcBUnfUmxOCREJ1Lm3BpMc5qTCETVi5CyhWE4AOi8IYSsEv1sdTzUAnSrZuLtZ51M8tfpr7bxs+cI3c1IUlHuiJawXcuqiF2k2PvG71mq3ByUdS56zlXEUFNBT6FVPdlEJRorxnPMYH8n+HJ228oL4zsEIgeJH6+MiRPI5R/TJqrPrVwlMFRp5VT4sk+smxRrJ1FyeAqgAW8baYW0ZWT9OClxmcSZlfE/L5In+J39BIiDEA7AhlJXxDwFuS3TlNm9YaGtooAvXZ9ozxBwrPRwFkvQ12f04x6LcgA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a5f444-ce68-4804-8f13-08de7b105cc1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 23:38:54.0376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ARePZEMbnYlOBfPROf6ENvXdQXdiTMaWwydF6NKqQMVsW5pl66A0P+CgMGk001Sx/lH93eBHwm7aJwpjrZHV8H9uUVPPb/JzFxA9aai5zYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6713
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



On 3/5/2026 2:44 AM, Badal Nilawar wrote:
> Ocode is the OOBMSM telemetry/manageability firmware, and on CRI it is
> loaded through late binding flow.
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 49 +++++++++++++++++-----
>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  2 +
>   2 files changed, 40 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 5ca25186dc0cc..d3ef2926517bd 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -33,10 +33,12 @@
>   
>   static const u32 fw_id_to_type[] = {
>   		[XE_LB_FW_FAN_CONTROL] = INTEL_LB_TYPE_FAN_CONTROL,
> +		[XE_LB_FW_OCODE] = INTEL_LB_TYPE_OCODE,
>   	};
>   
>   static const char * const fw_id_to_name[] = {
>   		[XE_LB_FW_FAN_CONTROL] = "fan_control",
> +		[XE_LB_FW_OCODE] = "ocode",
>   	};
>   
>   static struct xe_device *
> @@ -179,6 +181,34 @@ static const char *xe_late_bind_parse_status(uint32_t status)
>   		return "Invalid Payload";
>   	case INTEL_LB_STATUS_TIMEOUT:
>   		return "Timeout";
> +	case INTEL_LB_STATUS_INTERNAL_ERROR:
> +		return "Internal Error";
> +	case INTEL_LB_STATUS_INVALID_FPT_TABLE:
> +		return "Invalid FPT Table";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_VERIFICATION_ERROR:
> +		return "Signed Payload Verification Error";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_CPD:
> +		return "Signed Payload Invalid CPD";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_FW_VERSION_MISMATCH:
> +		return "Signed Payload FW Version Mismatch";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_MANIFEST:
> +		return "Signed Payload Invalid Manifest";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_HASH:
> +		return "Signed Payload Invalid Hash";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_BINDING_TYPE_MISMATCH:
> +		return "Signed Payload Binding type Mismatch";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_HANDLE_SVN_FAILED:
> +		return "Signed Payload Handle SVN Failed";
> +	case INTEL_LB_STATUS_DESTINATION_MBOX_FAILURE:
> +		return "Destination MBOX Failure";
> +	case INTEL_LB_STATUS_MISSING_LOADING_PATCH:
> +		return "Missing Loading Patch";
> +	case INTEL_LB_STATUS_INVALID_COMMAND:
> +		return "Invalid Command";
> +	case INTEL_LB_STATUS_INVALID_HECI_HEADER:
> +		return "Invalid HECI Header";
> +	case INTEL_LB_STATUS_IP_ERROR_START:
> +		return "IP Error Start";
>   	default:
>   		return "Unknown error";
>   	}
> @@ -264,7 +294,6 @@ static void xe_late_bind_work(struct work_struct *work)
>   	/* Do not re-attempt fw load */
>   	drmm_kfree(&xe->drm, (void *)lbfw->payload);
>   	lbfw->payload = NULL;
> -

I think it'd better to keep an empty line before the "out" label.

>   out:
>   	xe_pm_runtime_put(xe);
>   }
> @@ -314,9 +343,14 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>   			return 0;
>   	}
>   
> -	snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), "xe/%s_8086_%04x_%04x_%04x.bin",
> -		 fw_id_to_name[lb_fw->id], pdev->device,
> -		 pdev->subsystem_vendor, pdev->subsystem_device);
> +	if (lb_fw->type == INTEL_LB_TYPE_OCODE) {
> +		snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), "xe/%s_8086_%04x.bin",
> +			 fw_id_to_name[lb_fw->id], pdev->device);

Are we expecting different ocodes for each PCI id? if not, we could name 
this like the other fw binaries as <platform>_ocode.bin (e.g., 
cri_ocode.bin)

> +	} else {
> +		snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), "xe/%s_8086_%04x_%04x_%04x.bin",
> +			 fw_id_to_name[lb_fw->id], pdev->device,
> +			 pdev->subsystem_vendor, pdev->subsystem_device);
> +	}
>   
>   	drm_dbg(&xe->drm, "Request late binding firmware %s\n", lb_fw->blob_path);
>   	ret = firmware_request_nowarn(&fw, lb_fw->blob_path, xe->drm.dev);
> @@ -326,13 +360,6 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>   		return 0;
>   	}
>   
> -	if (fw->size > XE_LB_MAX_PAYLOAD_SIZE) {
> -		drm_err(&xe->drm, "Firmware %s size %zu is larger than max pay load size %u\n",
> -			lb_fw->blob_path, fw->size, XE_LB_MAX_PAYLOAD_SIZE);
> -		release_firmware(fw);
> -		return -ENODATA;
> -	}

Why is this check being removed? is MEI/CSC now going to accept bigger 
payloads?

> -
>   	ret = parse_lb_layout(lb_fw, fw->data, fw->size, "LTES");
>   	if (ret)
>   		return ret;
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> index 2a8a985c37e71..a128e3f638a6c 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> @@ -20,6 +20,8 @@
>   enum xe_late_bind_fw_id {
>   	/** @XE_LB_FW_FAN_CONTROL: Fan control */
>   	XE_LB_FW_FAN_CONTROL = 0,
> +	/** @XE_LB_FW_OCODE: Ocode firmware */
> +	XE_LB_FW_OCODE,

This will now automatically look for ocode for bmg as well. not an 
issue, but potentially noise in dmesg. Maybe we could change 
has_late_bind to be a mask of supported fw types? that way we can set it 
to BIT(XE_LB_FW_FAN_CONTROL) on BMG and BIT(XE_LB_FW_OCODE) on CRI and 
skip the FW type if not set in the mask. Not a blocker.

Daniele

>   	/** @XE_LB_FW_MAX_ID: Number of IDs */
>   	XE_LB_FW_MAX_ID
>   };

