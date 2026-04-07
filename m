Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461F9EDB7ED
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 10:32:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F9C10E3BD;
	Tue,  7 Apr 2026 10:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MHzedK1r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E33010E3BD
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 10:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775557945; x=1807093945;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=p2pCQD4LsWPEJzc3/cd8jvdD4cwsJtDZewvThAlsRRw=;
 b=MHzedK1rPb2tRhhJJnWe/0CoQipC57regd5VQwonUC9MwpBtkgU976Fb
 5b0isx72IqHRjTbFV8r+K9EFGuEhXnpngOAMDd6hdETvwK2S2PhyZ9N6T
 n6v02sYXr/4U/SCzhjJGnQJpO/dkRyv+5j81JNbWUPreSd24/JgretgZZ
 PsFzTSjjXrvTjxoK1EnNToUzwGSmaVq9hSC5+o6eKYbGN0jtQWHEAgSms
 nNecyxlNzKKItXfmjVMBqRJWOQrlLFhXkkvk6mF1gB1ha5+aFyhnl+FaZ
 9zBlUQ6GP9t0HOu3AuyyAD3KjOII8yuGPwReYNezh6tAGe2Oexb14LRmW g==;
X-CSE-ConnectionGUID: Fw7bUfJ+ToCRRxTN90GgNQ==
X-CSE-MsgGUID: 8wSjtHkUTDaeJaWX61RDIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76589571"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="76589571"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 03:32:25 -0700
X-CSE-ConnectionGUID: u9fdNNB7TVeEhlf+XWertA==
X-CSE-MsgGUID: 0UgsI6DqT0KZdSoFQICvrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="227295981"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 03:32:25 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 03:32:23 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 03:32:23 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.28) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 03:32:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NtFJp8iit9EWqYA/E1oSgPpujoFgIY6q3qPf68r163y7ZOO4yxENYPoCQLNYscPhMF5VG3DHxva9jb6OXYTVmD/L6KJf/YY2Y1jIXuCFCwzxDNZoKHCIszgBoJqeJEXIFTt8rkpNN+oZej4VYfwU8M6qekr/jUn7ZhBUhhKOnYavl8boWM4cVP1Atp9n8X7FH8sFBf4kmQL+PkoHdnTveH6y8ANXHsneID9X5zD4XRNvbGuPnuIVKvBNNhXmKGAWgO5pv10FMaqZ4fAjSYIcs8TWwLWHjO/UcMzBfMmitejq+IPKE/I24kcpn2hkGDp+8J4IRb75NqhJ1CxtVxT9HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFFwDeE6+szJmP2aNx2RjAbMzzmxehoe+QLuZ7wK2c4=;
 b=gxX69xesLSqf+LR9AKthfF1OSLQ/s2yp+P43YYH3RfSsuXwBurBp3kptzf2a/CAYdAQh8Yyejx9Jbg3OYvbtbEBYeOo7yCsGCYbmALebXvLwqG0+/pQTv9CttBfILKQslCMrByOQaUqZg5kYvR1cslHtgOUhlo8ZPF+0fvPhjyq0QegOJ5UwzzwLhNptLZWKQwKrZHcK8Yqcl4Sv14S2NMUv3Qpf4EC/u7SJ9ZL8Tgs2QsmA/YaOcOS9dzvvz4IHxj+a70JQ76d4JDuLviKJSRdDPbvPONID2YNACW4RXgIja5EPa7CKWXeWIfpM0kw+VYn9hbhdrhWv1MnVTLyDDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA1PR11MB7385.namprd11.prod.outlook.com (2603:10b6:208:423::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 7 Apr
 2026 10:32:15 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 10:32:15 +0000
Message-ID: <f0898b3e-71f8-4cc0-9662-cd3266df8e72@intel.com>
Date: Tue, 7 Apr 2026 12:32:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] drm/xe/pf: Derive admin-only PF mode from
 xe_device state
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260406114515.1043145-5-satyanarayana.k.v.p@intel.com>
 <20260406114515.1043145-7-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260406114515.1043145-7-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0049.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::7) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA1PR11MB7385:EE_
X-MS-Office365-Filtering-Correlation-Id: b168c06b-0469-4f66-0f37-08de9490efd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18092099006|18002099003;
X-Microsoft-Antispam-Message-Info: i6FkRmNba5gJFsJKQR/0pt5nu/8Gl3RbcRZQ0VPZqdZ0ZUZPqorlug86J7Blg8JjJjdEnTAfIgfVfs/UqvlbXUKIcw/WgUQ5Hlw6br95aVSYVSsxJLCviKGXUJw5fnJ8bZ7M9hd1XT2kfDgxAsU0NAs/p990erm8+wQ3kqWP54pCP66+NPavsYPc/CGXJZI5PG1C3ajj1UiCoUkUbnTub71dEq9ZBVxBduqHQK6+mPr1WUrpH/68s1coEFRxQ4ntvJRRduGr5onwbqbJKK3mQ895IF5nSyGIJlWUPVMPsHV6ET8RRth0VPH7gfhvTmRBM8GEa0qdiVF5meUyb5P33jTCHWfr4V96z2H5wuMp9nmOqaZ6ibdL9hvZBvfg3qY7Gu2/2g4hIvXP/baY3bSVmiD0T43e5+WJ/UBPuPTD6J2LWzHxE459bS6urQU5t4iewPrG900L6rmvWBbUb8ltQk5VSXcxGjJqAPddI3q7iUmu79sqM4mkpxPY6TRLzOq94oitnQmiYDlTJMPG70tuBJ+GfMLbwIXsZXOnuZakqK2wrzCPc9XS5ruRaA1L4ysnmt6feVJ7a5WD3HXbBahMrw+j9ugZAEQ3ktcmIG2ygu0Fbw9lFeNpBUnk6ITyyGarrlUuh6ZCPsCnwT4YFaWxGR3AyykFjOSIvQAIfEe9SvwxTHiHLH2ewjRYA2cZoACz/bX0TKQE44RwIJfr1LltnKiOPhQ65KaUM6CVjkjHqNA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18092099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjA3Tm5rclRsVC9OM0h2WkI5VlR3eEc3alFmbUVETW1rWWhCUE9jVnhXeDQ2?=
 =?utf-8?B?M3VhMmFreUZETUtxZkcxYVAwNFRYbU5sY1JkUlNFbjA4THRUNkJzajg2NW9E?=
 =?utf-8?B?dktwYWRiaWRrK3AvOXJ1T2cxMEQxVnI0R3pJZ2tFdXludDB1VzJKZTZnblJm?=
 =?utf-8?B?OEcvZzRscWFEYytuN1V3ZVYrTklpWm5CcVFwV21vc0NNZ2RIY1Y4QzY2QzVr?=
 =?utf-8?B?RWZJQ2RtRXRyYytPNXY3UFJlalQ2L0lQNVBWR1o4MHBnZnY5NE81MlV2Z3NL?=
 =?utf-8?B?bjVXeGMya1hReEpEL3lET1EvNDh3MFVsZkNud1ZySGlKdTZUUU1ack5Fc2kw?=
 =?utf-8?B?emx3ZFZVVG1zNWpzSFRHV0t1NTcveXUyMkxlejBJKzh0WW56S2IxUmMzQ1FZ?=
 =?utf-8?B?NGNPeDE4aXI2am5CcXIrbjFJRUxxY3JWbHhoTHB5SkQ4T2pxYWJvakdpODd5?=
 =?utf-8?B?a3RKYVFRajBDbkI0aWJZbVY0WTNQTC84V2tsSFhwaWxOUDB3OVgyQitXVmFE?=
 =?utf-8?B?bTBheXIvZnNMTXVDVFhEVDE0Y21aSnc2blA3dUQzSTJubnJlSkFxWHJNYS92?=
 =?utf-8?B?NzdTREV3ZzBib0NXa1pTKys5aXZBQlV5TXRJemFzd1ZzZ0JjYnZPcVNqV1ha?=
 =?utf-8?B?VURiMTFwWDl4NU5LbXpmdk8velMvZVU1RkdQT0djMkowQklLOGZ0U1FUODZZ?=
 =?utf-8?B?ZjNsbzNTY05QcnFBZFpJRndjTGkyditUeEowNGxtVnRiRnMwRmdxeEtVY0Zj?=
 =?utf-8?B?bE9nc2x5OHB4R2NmcVhkL2FRR0Z2THhXancxdEFRSUJ3TmZ2Yk5WWFEzdTFY?=
 =?utf-8?B?dGdjQ0dvYW8reXUvZS83aVRlV1FRU0pUSHdnTFNGbEJhVGtoekZ2YU5Odm9Y?=
 =?utf-8?B?c3VjazgzVllVZUZaeDVHMllTaTAwdE1TbHlma25WMExoOHI0YTdtWUxXbXN2?=
 =?utf-8?B?dzJ0NmViSjc2R2dBMEMvSUJ6MHEyaGRPT05GM3BQeWFEUVRTNGMwRlA4N3ls?=
 =?utf-8?B?eXVmN2lhby8rVXoxMWpERTd1NkE1bjY0bHRDdEF1Y3JyVVVkMFprU2RUWnVR?=
 =?utf-8?B?TzExN2o5dFBPSFZCR2Y1SGtxQ290WDNXNjVXd1RGZnpQcWdFQnpibFd3UE9Z?=
 =?utf-8?B?L1B5cFNjNk5oeTByTUxGTzVaQ2h4QzFFdjJnaFgrVDZUampIaEkwS3oyeWtR?=
 =?utf-8?B?R2VZU0FZS3Q5RDZSNis2UmFHbVVZVGZ0TXMxR00wdkVEbmptaDgvNlRpNktS?=
 =?utf-8?B?ZmxRT3BNZlMzbGx0TDYwSUpaVEJsVGg5RHRMem5IeWFGREVYdUZQaTByc3Zt?=
 =?utf-8?B?c0RRMkEyUnhrdlNLa2JJNmNBTFlPRE4wWVg0aXFHNjFnTWZhY0tVeEtnSy9k?=
 =?utf-8?B?bVFzVTJNR0c1NVFodFVyeXVEZHJMaGpaYUN5MXZ2SjNQUjlpaklXdzhNRjRL?=
 =?utf-8?B?alI1Tkh5QjdJRXdDU0p6dmc2cHp3cm5VVHhSYlg5Rm9ZczZMWjhtQlRyMkQ0?=
 =?utf-8?B?YTZMSkFZZGtDeisxdjN6bHIzZXc3T0RabEs3QUcyQW5STWRFa1g5WTFTa2hB?=
 =?utf-8?B?Y0FGcUM4Yk8zZFA3SzVDVG1mLzNTcmozUkxkbTUrQ0xRaWtZQ3ZrSGlkd0tT?=
 =?utf-8?B?Y2xDUm9IR1ludVA2SFNFRXJ5N0xhSERGUjFCNW8xdlR4cmZGSXNHcm8waWNt?=
 =?utf-8?B?OVlqb1JpazJsRHAySHRWZEpHQlh6UytVN0NjcmxJZzZoaW9nY242a1Vpd0Fy?=
 =?utf-8?B?NXZmMWxkOUowc0FPNFowY1FuM2FKZTZmQXN4KzdFdmJldERuUXUxR1RmR0RD?=
 =?utf-8?B?U2Y4K1JMOW1TWU55cTNVRlFMMW13MndEME1wc2J6UDNGRHgyZ3dnTlJJMWRP?=
 =?utf-8?B?bmV5YkJLbUdzU0xjRjAzTHNVcDRYcGJWeDl5a2xMTW5ISGZwaEdWZ2cvYlE5?=
 =?utf-8?B?VWkwbFUzTi9tVmVTdklWc3U2TStvT29RY0NSZlNiTXZGYU1rcVlQa201UFFw?=
 =?utf-8?B?MytsMis1K0xDcWo2ZzFNWHlYaEFjN3Zlb0FkUHhpdk55WGluMFlHV2V1UFdK?=
 =?utf-8?B?bXVuNmJMQ1lscTRwL1ZYWnMxNWlMY2NyMVpjdG9QMEJ3bE1MVzZGSERUdzI5?=
 =?utf-8?B?OTJiVXRVb0NhYlRXaXloYXBOQis1NmJJUkhVeXZBTmVVSFR4NzRLSFJtMlFp?=
 =?utf-8?B?OTF6aWQ4U0JuNFdLNWZnZWtQOWJVMWtBQzRMK2o5NEJHVDFHTVNDSVFYZFo3?=
 =?utf-8?B?VDR4aUtsR1BlZWFEUW1rNkExVXNxMncxd21nd01la05zak1BRGZVYXZhV2FM?=
 =?utf-8?B?UnFJVzFmSzFCek1LbUhYck5BV3l1S2JIZ1dXMGlDMFlUNmlmZzdvT29uSkRE?=
 =?utf-8?Q?5fUz8v6iebQso9GQ=3D?=
X-Exchange-RoutingPolicyChecked: Uwos8BdNZE6ki2WCHyb5ingEi0QOlIEUCa6r1SaCAmD2YPNWYMqh7n5hqzCYRe8bXawiHhAvzeh41dsH6u900QAZULy5pu+QAJsRwz0r0AoAZQurd8Bdh4ycdatRuWubsF8qfo9ArzWX+/OBWj5fFbD95looq2kw8UtMticmRz7EHTfJotTbH6M7rm8994gaSeiE4Ah+TYJQwwzPMh1ExBgFEBWwKZj2hkjCdE1qvFkh5AEHtv7u5JgaCgnKY0W+tZkfPLIM+Jnxjurf2JKHFhhrfDzm0ImAg+JpWNJogzi3bqTqxM26U6Es3wWG/6CsNXoL8Kx5rMNUIln7TuVEpg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b168c06b-0469-4f66-0f37-08de9490efd3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 10:32:15.5019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUFwHdnqGjswBMJEB876dhkuxV9fCR8RN7Wznv6+qH4wXChvXcB36UjY96sBLlVaxvWFGqtbfRmoF5mrY0+mvXjEG7WvzLdJG1Zh9GuaUV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7385
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



On 4/6/2026 1:45 PM, Satyanarayana K V P wrote:
> Stop tracking admin-only PF mode in a separate `xe->sriov.pf.admin_only`
> field and use `xe_device_is_admin_only(xe)` as the single source of

nit: "... and use recently added xe_device_is_admin_only() as ..."

> admin mode.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> 
> ---
> V8 -> V9:
> - New commit.
> ---
>  drivers/gpu/drm/xe/xe_sriov_pf.c         | 6 ------
>  drivers/gpu/drm/xe/xe_sriov_pf_helpers.h | 3 ++-
>  drivers/gpu/drm/xe/xe_sriov_pf_types.h   | 3 ---
>  3 files changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> index 47a6e0fd66e0..33bd754d138f 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> @@ -20,11 +20,6 @@
>  #include "xe_sriov_pf_sysfs.h"
>  #include "xe_sriov_printk.h"
>  
> -static bool wanted_admin_only(struct xe_device *xe)
> -{
> -	return xe_configfs_admin_only_pf(to_pci_dev(xe->drm.dev));
> -}
> -
>  static unsigned int wanted_max_vfs(struct xe_device *xe)
>  {
>  	return xe_configfs_get_max_vfs(to_pci_dev(xe->drm.dev));
> @@ -79,7 +74,6 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
>  
>  	pf_reduce_totalvfs(xe, newlimit);
>  
> -	xe->sriov.pf.admin_only = wanted_admin_only(xe);
>  	xe->sriov.pf.device_total_vfs = totalvfs;
>  	xe->sriov.pf.driver_max_vfs = newlimit;
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> index 0fcc6cec4afc..19f6f8331c8d 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> @@ -7,6 +7,7 @@
>  #define _XE_SRIOV_PF_HELPERS_H_
>  
>  #include "xe_assert.h"
> +#include "xe_device.h"
>  #include "xe_device_types.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_types.h"
> @@ -57,7 +58,7 @@ static inline unsigned int xe_sriov_pf_num_vfs(const struct xe_device *xe)
>  static inline bool xe_sriov_pf_admin_only(const struct xe_device *xe)
>  {
>  	xe_assert(xe, IS_SRIOV_PF(xe));
> -	return xe->sriov.pf.admin_only;
> +	return xe_device_is_admin_only(xe);
>  }
>  
>  static inline struct mutex *xe_sriov_pf_master_mutex(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> index 080cf10512f4..b0253e1ae5da 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> @@ -36,9 +36,6 @@ struct xe_sriov_metadata {
>   * @XE_SRIOV_MODE_PF mode.
>   */
>  struct xe_device_pf {
> -	/** @admin_only: PF functionality focused on VFs management only. */
> -	bool admin_only;
> -
>  	/** @device_total_vfs: Maximum number of VFs supported by the device. */
>  	u16 device_total_vfs;
>  

