Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F674CD8C85
	for <intel-xe@archiver.kernel.org>; Sat,  6 Jun 2026 10:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CE810E75F;
	Sat,  6 Jun 2026 10:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cky6EGMV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5BE10E75F
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Jun 2026 10:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780743459; x=1812279459;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b9cj4m2GTIUEQ6T9b9vnnfg3XIGTIKBGjepXH+YibsQ=;
 b=cky6EGMVtnzAladNmkSwTmO4YoEDoTfSn4RY5v9BF2hP3wRE+o3hd34+
 HCn9ntp2xD4Cxtwe9aKutByMkskPQ9oUhU5fc+dAic0768LLtFSUCvPlJ
 uQufC97B94jC0/rZMbaVlVubdPelPBRH2S9d+uNSmWUlRGjI3qQgUYaTD
 tz8mPdAQ0mesBxfB0K0bEAQd7pgefmZkOuhv6xmiQ3ClMCZcih8FOAt/0
 wId0+e6WMqSET5SnZYAgfpcWJHemqn4NGfCmokxM5AIJBNtyJMDN8B1tH
 Y1rFEsK3gtfxZOVFpmgSxuvAA3PJ13P/CboITVqv4bEOkXoBcyal1S3gg w==;
X-CSE-ConnectionGUID: /vrpH9A6SPmIKXz/sQywOg==
X-CSE-MsgGUID: QNgOo2WHTlGq5uGvxFcsfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="81413248"
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; d="scan'208";a="81413248"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2026 03:57:39 -0700
X-CSE-ConnectionGUID: bKxrMqRVR+W7QgxLzbwXFA==
X-CSE-MsgGUID: v02MppStQyS7PI/gMS3xww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; d="scan'208";a="240615322"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2026 03:57:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 6 Jun 2026 03:57:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 6 Jun 2026 03:57:38 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 6 Jun 2026 03:57:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtnwDv8VWh6Dz1FZ9aMURQkWUajGz1EoYQfqfFaTwCBgekiDHRkLNtFv3hVvQ/XylP0rt8icH7fcFU44iJ7C/o7IbqR5d2Qr+x+Sqc4OZC8Qazy3kFdDeDdoCfxsTFk1lUCRj4XAgCUuSRwQM7IMmlUWRiI1ga9A4taY6CSM7hVEOObiDCKxz71BooU0oMTwS5PIJNm0kL71AtRrmX91dot//pyfxYSdkO+DkNAqwUxwT9SGBYAzGDORK7xvY5kVXA1aRuatZwFf9NX6fbgGUEYnG+xlOW4vsKDqeH+m61f2uRfqRSiX+ufU1jkHzaJMPXrxly6syPkV7jkN8d90WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTRHksZhUp4Hn3hn5cL8cruJgW2kUs0vDt5aayyk2AI=;
 b=ZTkbt46MyK7YKbsUfH7gzLbDMjfOdvd44rRSH+bjt5uUTYdNix5HAg7Eq1a+8aqCvloA7TUO6pdrsHgjUjODUA7XmgLrKMYqo86UupSB+J4DgiL5FJK7yl242fRZWfA7TlWhWKw5PcjjtZ/hkEUJUH6SGDjAn969Id3qq0x3BcrZsorZc2++rY7xpsuoKS6pjteVwq4tvGMTCYYU6uvD1OZWKnee3k+R1LBpKRVhOPU6s2DIvLpE2sk1xJE4kNxTz3XvMnSDJlI4Nic4kSCXdyOZHnx4ShVtmE/dfU7K5lXR9tC/GaHnFlpugekBRsSc397ZRrdZ6HjTeznDBZrZOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA0PR11MB4704.namprd11.prod.outlook.com (2603:10b6:806:9b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Sat, 6 Jun 2026
 10:57:30 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0092.010; Sat, 6 Jun 2026
 10:57:30 +0000
Message-ID: <afff928e-6e5f-45a7-999b-b9eb1e9f499a@intel.com>
Date: Sat, 6 Jun 2026 12:57:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] drm/xe: Change MSI-X assignment failure to drm_dbg
To: Stuart Summers <stuart.summers@intel.com>
CC: <ilia.levi@intel.com>, <x.wang@intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <alan.previn.teres.alexis@intel.com>
References: <20260605232108.674580-14-stuart.summers@intel.com>
 <20260605232108.674580-20-stuart.summers@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260605232108.674580-20-stuart.summers@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0029.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::29) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA0PR11MB4704:EE_
X-MS-Office365-Filtering-Correlation-Id: 74089ecb-c46b-45e4-b7c1-08dec3ba679f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: R8WIYAra4+D+xfJ1eKy4v/9Zf75ZDBSO2MIFz8yRSzHwKccC1H2iQY/SrBkpyK7yKyJosJOccrFXqZZA1nIZYIpg4ceyXWAKNz2afuetjls7h7Jq3gyrtGdeDjAtj9hLKGDzgiUpL7kak8dWn43932hONzu3QhyP6ABy1ARjUuiwGOnL9YMJUxmSe97MlvLg+Cogzs1bKyZgKbKBGkbf1rb/zyOAYTAYOAjhEzGJRzFreGp6tyeBEX3WJwMHg0fWLFB0QyZh4o7FTcJ6SSwg/eRRPDiG8og8wv0u+TRGeBtdUuOF/XrwypWOcriDwb5sPm/v4XoxQs+T6ANL8Q6VO+h1Xqq0ylvvaz1sh6xOkA0O+aOp+q/CoPOvT1P83SUyQ8DWBBumI8M+3d6FM6VA7ZRXnFxfQ6AbjJZXtKOBMNKtAFH5sE0XSAxDtTuSK9YgEo6TJbbkteHYmtE/wJrivSWbi6QQXHqZjOMqsJcQkhELE62L8k48EIQL7WP2mA6L8EJa5xiQY7wLRilh9qFJlMnCx/nRUyfMfV6IDV9lSQOMU1iMTWolp7t9YC10M+qt4GP6zwXC84rAELufU6MRBUVBY8P05x4+R3vPIG+syHeV03IzbuWtxPZNHOwovlCNMAVHVUSqdn8XB1SotIXGgBJb0EDvhMXPLALWsGnNb/Wv6lxC5tFRAEe8gH7OkTBj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djNQdS9yQjBhekJ1S25YVGc2Z1hVdUdWMmFKb2krdWQ4MFYxVkJPVUxsYTN2?=
 =?utf-8?B?d3JoampsR2l0R21hRmE1azZtaDNzdk54T1Z4M1NIbGQzZE5mZ1pRaSs0MDUw?=
 =?utf-8?B?emJQQjYwVFkrenp2U1dUOG05MEg0b3NWaXZKTkZhd0lLcWZ4SjNhMHNXMll2?=
 =?utf-8?B?VG9ZZUNNazdmS252bGlNblV0bUdoQm01aVhpTmJRL2VDVWVpYUhKdGdZTVFQ?=
 =?utf-8?B?bDFFR0F2MDZ2NXpodWtoT2ZtUlRub2JqNDdBRFZuZG8zc2kyOUlIVDZIZzNY?=
 =?utf-8?B?K0c4ODM4SHl2ZEhlQWdVSUttUFU2NHZTNmZzQlFTN0V0QUpvUDRQU2xVdXRU?=
 =?utf-8?B?VXJMZkozNHpPeGR6bDZFbzRhWC85Q25SMGE5ZVl1U2g5ZkV0L1NZRzVkUVRW?=
 =?utf-8?B?WWRua2pIMlZlaGlhTkNpcTA2bzVsbGlmZmxkRDdwVmRkVGlKYk5OajBDVDFl?=
 =?utf-8?B?c0RYZi9LcHNac2NoVENhMnpqaEoxMzlleTA0TEMyVld4VzVlcGFGL1N4MHJx?=
 =?utf-8?B?RHZYZW8vQkFtQjlnVmNzbXpMS1NhTWc4QXpvS29aT2dtT28wSThLajM0S1hD?=
 =?utf-8?B?OFFCSEtZSDJ2N0F3NXVPWFYxVXgyV3BqQnMzU2ZwdG95Z0xzQzZJM0FQMG0w?=
 =?utf-8?B?Wkg3TlBPbHhmcmU4UGNRc0oyUVNML0hNWTBWcVJCRkhEdmsyNGo5K3dsMy9q?=
 =?utf-8?B?VEpZM3E3aHAvT3RPcGVMRkwyYU93bllLM3RWdzExUU00Vnp1NytMVCtzUVVV?=
 =?utf-8?B?c1J1eHhwZWdVRklMSk9QNGhxbEJWMzBWbGs1aEQrY0dxOFBzSXVjUHV3bzQw?=
 =?utf-8?B?eE4rMFBZYkhpUXVKVEk3eWlFNWlEWi9TaEJCS2Q4YmFVKzRRZGxUTU85S21y?=
 =?utf-8?B?UU5mYVJ3NFFKSWVZdXNnZVQyYUtoRi8yaHVINWhGckhuYWdDRXcxQVpEWXlT?=
 =?utf-8?B?MHFWOVhJcWNTQzN3WkVvaW4rbVlUOGxuR2hSZnMwcHB0U2NreWJpKzRyRTNW?=
 =?utf-8?B?a1FDeXk1ZitLV2pmQ2Uyd0daRExiSGRtMTB5QytHeTFGdXV0TG5EWUR0VFpv?=
 =?utf-8?B?NU9JeklNSE1WNUh2SFhqV1h0cWhrdUpNcjhSZytpQ2UyekJla2lwYlFLTnVQ?=
 =?utf-8?B?MFBOM0drdG54NFZLRFBUOU9DNzhlQVBsSVBkVkU0NEJqUzVtTHp5UlB2dWpw?=
 =?utf-8?B?TDdCQ1U1LzdtaGhwZ216NlV3dXFGNGFzNHRtYm9GNFk3MFlLcW9pU0Nmamdl?=
 =?utf-8?B?bDZhQU8yUHNVSzIzNllibE1FSTZ2a3lsK2NVNkY4NDYzWnFjY09TcTR1K3pu?=
 =?utf-8?B?bFBNcGdOMHpUTXo0ZEV5SXFOamtzYUIvVTVhL2hwZzZuU3BLMUdhalo4Ym82?=
 =?utf-8?B?NHRCNTRkZ3lyQ3lLeUQrSTk0Wkc3djdFNjdzekNDV3hoVGFERmNVd3FmZ21q?=
 =?utf-8?B?TEFwUXcrZTdRR2c4THZnbHFxdlJIZmVHQlVjWXg0Q3pGWFczMkxkQkNtUUdV?=
 =?utf-8?B?a0tqMjUwbUxXRE0wTUZqSjUxNTVZV1ZvNXd1b1FweG9vcUw2UFlEUmc5Z2M0?=
 =?utf-8?B?WUFCOVJ2Z0NPbEFVU09ac3hCMVN3NXlMVm9MdUdHcnBlV2kxcUtjZmcvbDVa?=
 =?utf-8?B?dExHV09yemlBVmNlV1pEd2MzdUZaQXI3MTlPRnNDM1VqZmRkL0hWSEV0ZEw0?=
 =?utf-8?B?alkzTGtkRnY1djU0a25DRU9URHpNQmFuSlFkaUdVSGRVWUVMYytTMTEvd09X?=
 =?utf-8?B?MVZUREZDazZFb2pEb0RDVWQ1enVyWlNWcFFoYUVnbTQ5eHBWNVlZYzNwVTU4?=
 =?utf-8?B?QzBSeVllQmkxeXh0bFNMTUNjeGRmc2dVRUdGWjF0QVFkZ21nNSt1ZUlwa3lO?=
 =?utf-8?B?bXBYbnhDQW5zSkRFVWpSUUFJMmRacGJ0ZHpQVnZDYTFNZjVrSGZmcktTNnVh?=
 =?utf-8?B?Q1BoRTdmR1d1SGUrUnlCbzRDVDNBT1NJVFMrdHZxN2Uya05hU3JsQ0lhQlZa?=
 =?utf-8?B?ZVNOc3FiMVdEUmRYM21XYVNJSnEwWEJ6NnFlbUUzdTRlZWVqVnRjMjVkc1U4?=
 =?utf-8?B?ODM5Vyt5dXN6RmVhSmhUMTd6TW1WWTEvbTJTOWw3aHR4ZmtxZEsycDh6WllD?=
 =?utf-8?B?QXdoZExQQmF2M2hlZTVBa3gwMWg1VEcxSWo4aTRFVXM1UUxPWGhzVG5WYlVk?=
 =?utf-8?B?UGZIQWVzdEV5YmlvTlVScTZsR0NxZFN2SFl5UWZuQVRBZjJybmZGb3k0cnUz?=
 =?utf-8?B?QVVVd2I2cHRNVGw3UHpmVXl4a2JORWE3TGFQckVxbU9TZ09Ra0ZTaHBMWXFB?=
 =?utf-8?B?cG84bHhReE9uOWpaR0tEZDZuS2xyUTNiZ1BRSkg3QU1jRnpaZURFUjVaekNs?=
 =?utf-8?Q?7qyXmbRm5adpsrZU=3D?=
X-Exchange-RoutingPolicyChecked: DhA8pNFrm3/V38h5L8OvOrNzWfoG1p8/lHVi85Y21j0//DwY5whPwhsRIVUMJl8BSDCbcbXwbmAYVNE/AK34eN7QS5awaNg6Q2qOKh1dunWnW0ctBJaw/s7/qziK3Xybv7H1HWnB9VOe/QzMKOC2AwsfUfH1W9TvMreh9De9ldfAv45z2IM8UY5MuKbUCBenCAatnQrd4JLi1Ru+956Hw2jdKOwLlEMKeTKFDYLDkS1v4J39b1ev1SBCMXzsPiRwDjDXWaoqWXymxb4h8nDP22CydqdQMf+I+JXun7AaTz2l/oxYuLuZhOrmCt7/JYKYz5RzSGAP8TfIugx0hQTUSg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 74089ecb-c46b-45e4-b7c1-08dec3ba679f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 10:57:30.4194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3yg4AQ44qCn8IWZprCmZynTTocpcP9UfRWd+jjiHeiPpBY0mmgCj7gcanLSnfXAQgoNa98nKxLgtsm8810Sb0Q/pNtNhtRKhoL+qo27RG0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4704
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



On 6/6/2026 1:21 AM, Stuart Summers wrote:
> Now that we have queue based MSI-X vectors and a user
> can potentially create more queues than we have vectors
> available, don't spam dmesg with drm_err messages for
> every failure. Change that to a drm_dbg instead.

or maybe we should use _ratelimited or _once variants to
still have some insights about the failures (as drm.debug
could be disabled)

unless we do have a fallback plan in case of such errors
and can recover - but then we likely should mention that
in the commit message

> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Assisted-by: Copilot:claude-sonnet-4.6
> ---
>  drivers/gpu/drm/xe/xe_irq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 40d3d43e492f..871c6c5c4fac 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -768,7 +768,7 @@ static int xe_irq_msi_request_irqs(struct xe_device *xe)
>  	irq = pci_irq_vector(pdev, 0);
>  	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
>  	if (err < 0) {
> -		drm_err(&xe->drm, "Failed to request MSI IRQ %d\n", err);
> +		drm_dbg(&xe->drm, "Failed to request MSI IRQ %d\n", err);

nit: we can use xe_dbg(xe, ...)
nit: we can print error code using %pe

btw, maybe it's also a time to consider devm_request_irq() someday ?

>  		return err;
>  	}
>  

