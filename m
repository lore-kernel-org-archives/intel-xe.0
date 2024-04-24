Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556F9C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 02:26:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC84810F4CA;
	Wed, 24 Apr 2024 02:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NluKQKAc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17DE10F4CA
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 02:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713925612; x=1745461612;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=ThdKWMboux64koDNQ6frmZ7eiKS0eHCEaZfcC6VYATg=;
 b=NluKQKAcZhPLQeS0FxEz+9e3HYZ7ecj1OqatSreya/BKrfmlGMCW9vla
 LWkTH/SAF0OyjC14E0nnM+Etb0wWxs1uu+dnlPVVLWyLcUMoqQK38+2Z1
 P7QkGVBMdyyPT1LObDZR8Crx6L6qf9JRFxx5rkjm0H+AyLbIomhkPf96L
 ArcaSWWuMIYwUfpCyOhOqUsRUgeAclL1Bc8PJjL+tF1Y/MGab0nNQmS4W
 kHqW34x3zu0PkWT0SQeGmiezFk54qAJCzr0onrUROKSVgtRyCTQn0xQ0E
 99hpDm9adkVmx/fH84fYRAUHf2HY3nRpt+AlAUKJLStCcTtQ08uw65LZc Q==;
X-CSE-ConnectionGUID: 1GbYd+sgQtG0u5Z/Ubyx1w==
X-CSE-MsgGUID: kAlf0x5aRTSM+oabCxaRgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="27051423"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208,217";a="27051423"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 19:26:50 -0700
X-CSE-ConnectionGUID: 6Iz3jSUvQemHtaBBCfdh4A==
X-CSE-MsgGUID: jG99hHJ9Squ1VU97jesQlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208,217";a="24619988"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 19:26:50 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 19:26:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 19:26:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 19:26:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0sDIN0Ku+q6RRjcS9agg4qWRBSr27qwV1OrpqU3i7mORIsG5tloNLTxeTXd34WJ1frxLYYJw/q/r/0KR6ms5XMVPtN/f7BHq7iQBjn0k9y6T+8iid8/++CpYBrlvux556/2eRHoDsxaSBfd20PKjCuVDGj5k3l05yVKBRUQ6CXzkB83XmIkMCNtKexj0qbdkbYGS1xhXtzskMV/SDPGmE4P+i4fHa6UykuT8ogLKi0F3ywjwzlmXdwxsZSdkoGw6Lp5F9td9wO0ECBi3nT9RQV62Ity+WZulIp2ChSuAWrRkQmDdCcG1axfB48kjiHGCpm55UDNWUcjJTCYiQEztw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5rZuTsDWeCLJE+eoOIECwBE4xLUtgFVYnt1BPbQ/Dw=;
 b=ZDjRg9PDnQdG35ZjwsXi9kdXjesMjUOEKWiEE5WkkUpZedoghl/QCxuc7cVWTrvvyUM5BQkCPAVBfdy1RhRYPUycV3tQynWQTzYCGpG0QutflU6hMhJTjSNosuM9/Jyf0v2IK/+/7uQ+aKbVamE+UojD+8urwcVOiuXtTqGk2fedLVjfjTzhf0di9yV2tIL3q/dsqncEQZGK9A27bwRQQEil63OEKGDvi0pmLuycm6K5v1MllYPyooaiRY6z+nyfgV8T3sjf+ORfMwfo2V4iowEJqmtnioJGXNPeG9Jqb9e+fPDdxpYhOF47Rc9ZTHR9B4nu/6kBaWMhxVVc0C3//A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA1PR11MB6323.namprd11.prod.outlook.com (2603:10b6:208:389::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 02:26:42 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 02:26:42 +0000
Content-Type: multipart/alternative;
 boundary="------------cV8Gdx0nRmoW971dVPDpk4ND"
Message-ID: <bcc8f1f9-4f70-4951-a855-50222d1f9205@intel.com>
Date: Wed, 24 Apr 2024 07:56:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vm: Use xe_vm_lock() helper for locking
To: Matthew Brost <matthew.brost@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240423070332.2036539-1-himal.prasad.ghimiray@intel.com>
 <855xw8m7ep.wl-ashutosh.dixit@intel.com>
 <Zifs/D2+T9qwZNEj@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <Zifs/D2+T9qwZNEj@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: PN3PR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::9) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|IA1PR11MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: 3990b32d-d07c-4241-3fc9-08dc6405fa69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFJsNGlsbityT1hQR0J4NTdjYVVtelk4a0g3dWthMXV5SEtVaHFJaHJ4NnBK?=
 =?utf-8?B?SzlSbHdwdXR5bUFRTTJaMFgrdXA3K1BkblM1VHRDYUg3SDEzUGl1TFdIL3V4?=
 =?utf-8?B?RFBGSWNRQjZqbkpKWmt1VHZNUmNUWGthV25maGl5ejdXblhQaHAxQ1lSV0p6?=
 =?utf-8?B?RVd1elI0TzFZSEQwSzgwN0JEMWhwZ01wekVYMkJEemEzMmV3S0kwbFZXeStC?=
 =?utf-8?B?VUQxbm11eVJiOHlydXgxbnVvaGtIcGUrL1ZCZys1K1FTdUx4VVlhRTRsTEpQ?=
 =?utf-8?B?ai9xNGVYbnlvVkhyME9jUmdkMytWbUxINVRpLzBMbXhma0ovMzZ3aTNJNy9m?=
 =?utf-8?B?M2hFazJDbFV3WlAxb2hRQVV3VCtmS1BDWTZZamhQVXAra0E3REJHbDNJeFo1?=
 =?utf-8?B?STR4dUZDMi84S09YLzRvS29ZTG9iMVpHQTUvQ0V2SmErZmFqZEUrdU5EUGdB?=
 =?utf-8?B?MkNkc2RWUTJVc3Qrd1hSQTloZmY1UE5TRUtDK3dRQzRtUG52dGRMY01GbmNt?=
 =?utf-8?B?ZkRjOUcwNlU4NDdCTFJ0QXlqbjIwU2hSSVdHbnVqOUx5amVudXdFczkzQklw?=
 =?utf-8?B?cW1ZWm5NTVJ1d1pzRjIwUU81blB3K0Q2cUlHZHU1UG1vdXpjelNyQ2FnVllw?=
 =?utf-8?B?eXpqRWREOERFVDVyOVFuanNwNmJMS1kvRVpDNWNZTDJuZkJhRlFSZTh3VFRu?=
 =?utf-8?B?VXg1K0VGZlFYdHU5MTlJdzNtNVFYOGNSVGhzQ2IzRGx5VDNXYmJEMGc0R2FE?=
 =?utf-8?B?Qmo5OUwwNFBsZEhoMWVPTzBHd2FSbk5obE84TDM4TmY3SWs5NlFucUdKOGNO?=
 =?utf-8?B?UWRIWDZZMmVDeG9pZVJscDhudVlXZVpKdkM1SU9sNzFtUEgwL0lCR2dEWlVW?=
 =?utf-8?B?RDVzL0pqa0YvTFBoa3lKT0tFVFJTbzlLblR1VUUveEdZWE5GZ3RnaUdMY1du?=
 =?utf-8?B?cDI2elFZU3pZamN4NG1vdk9mZU5lNG5zb0lQWXg1WTRyMVFlZFNvaEtmTGxu?=
 =?utf-8?B?NXZjbS85RkE4dGp4WDNJSUhKK3puSVJnbEI4d2h3ZjgrVExUM1BQbHh4azlV?=
 =?utf-8?B?dnV5QXVVYXdweHFjcWNDUWR6NDFUbGRNdldzcGNSUmx0d0dZeWRFZ1BLamlp?=
 =?utf-8?B?UlQ5Ry9wclBHLy9uUFkvandicWs0VFVnK0NyWjVibmVnTHVnZnUrbmFUbG9Z?=
 =?utf-8?B?N1MrNDR3ejFEemtiQ0R4ZnQ5eERwWWhBVGZwM25nQ3kzL1BlVkkxNXFCblFw?=
 =?utf-8?B?Zkc2cGdvMnp5b0gxV2NkR1hnN1RwNVVRcTFBUjZEdER2Q1JaQmpOS0hKcEEr?=
 =?utf-8?B?SU1vU0p5QXl3b1F5QzI1djZkRm9mNDVhbnVvSHRtZEdGSGNPWS91b2twQ0Yr?=
 =?utf-8?B?SjdqeGI4M1R1eXpHbldmdEJDTXBNa3Jta1JJM0NGQ1djT3RkUEIyckQxTjgv?=
 =?utf-8?B?SUwwc2dCaVMyT3laSWRUTDhPM1hiYnVpRWlyQ2pwSGJuNkp0WFA1VG9vM3B1?=
 =?utf-8?B?U1lmak1qNy92ZE5JMVBLamhHczNvUTZVdGNhcHMxaUpJamwzYVNPZFYycUxI?=
 =?utf-8?B?TGFmS1UzbVRhZEJtbnJza3F2NmhpV0FiODQ2d0VMbVpOOVAzSFFSajBENzJU?=
 =?utf-8?B?Y21ueU1BU09xS1ZwSmJ2NE5mandyZytXYlZRWXU3bHRVbkN3YTdiRE0wam0w?=
 =?utf-8?B?VWN0dWdhbEhRQ2dDdzM5eURLbWRIL1ZXbXIwY2pVam43L0NxR2JxV3lBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWFpamFwTDY1Q2dRck8yVzkxeGxnQ3lYL1NqaFFYK1hEK2hoVjk5OFI2MUxl?=
 =?utf-8?B?R2dDNzZ1YVg2TDY2RWtNbk9JQWNraThmVFBnOHpwK0xXZUtEV2NCVzNQYzkw?=
 =?utf-8?B?Qy85bHJaZ3NpSEdvM05QTndzTnJLcm5RRytob3F2N3FVVTVPbkx6QWk2NXl5?=
 =?utf-8?B?dlBnS09OSW9ENktUMTI4Q1NCTE1NQ3kyUUYyMkQ5ZGdIdGwyTkdOcXJ1L3Js?=
 =?utf-8?B?L2pEOXdqQWdBa3drSkdYajdaQzNSQnNEekthKzNiQW9sSFJYVGZZcTRQSzZF?=
 =?utf-8?B?TE5GdTZwRE5LSHhSTjRJNDJUVUxwVnBqZklxYThEaCtzRng3V2pVYk1NOVZp?=
 =?utf-8?B?ZStLZWhMOFBlMWtkL3BxdjZRUHJSQktqVk1JYlpMTTM1UTc3QlMyYS9HbkpS?=
 =?utf-8?B?RzVqUDljdDdjb2JJRmtOb0FrS1RGeTQ3ang2OXFydzQ2WVJiaUZKOGN1TkpX?=
 =?utf-8?B?QnhPTkFFT213QTJSSUpXK1hNNlMraUZ1MWxPZFg2K2xNb1dtUk9IWkFqLzJx?=
 =?utf-8?B?UTJESmhBR0JLYmlhVGRzU1ZiNVFXTlZlVXFXNXJ5b0Ftc3Fxc2VvWkdvSGZI?=
 =?utf-8?B?Um1WZU50RDdnSlpZcVJKeVJzdHRCOW13KzYxcHQrY1pxYVU1Q3hIeTlNOXRz?=
 =?utf-8?B?VlZ3QUtyNmt1SUxmekUwMDkva3FlTlRwdmtrc1JrUXlTbHp2a29ad2pOazlE?=
 =?utf-8?B?SEwwNmFIQzlhL1BQcWx2WXEzNG41cTJUU21PRVpoVkE3WUV2S1RPbjVxRnRK?=
 =?utf-8?B?WXZDd1pQMU5pNzQ4dHVZVFRkVTczLzU1NkIrMXJxd2lMTkp5ekhxUFduelY1?=
 =?utf-8?B?Y3paQ1o3VktpQnp3VHJSK1BKQ0pIVldJTmpYRlJieHVlWW1USTltczNxRVEw?=
 =?utf-8?B?REN0cFRKYlFudUxQd3h1cW5NVEx2K0JzSW1tMUpOMkdzOTRBenlIRUR2OTNx?=
 =?utf-8?B?dmhkNVZCVGtiUHVSdzUzT1A3MUdFQzNkVWk1R09iZjZlc0JNWG12S2w0OXp3?=
 =?utf-8?B?RUVrbUlLRk5uTGpDVUpVVytBang4ZFpvcGoreDk3dnBqMklXWnREZ0ZYdU80?=
 =?utf-8?B?dWtZUzA5R1pZNUQvZWpOQXFvYkVwalBjZEtTaFhoL3JBdm1Na2s1Y1NjTFll?=
 =?utf-8?B?WkhWb1NIa0hVbzV1dXl2S0xENHlaRkMrb1F6YVZqNTJzU05Kb1FOaEt5VTds?=
 =?utf-8?B?bFYvUExnM0RZdGFNcU5QZnRnWC8zZ3Z0bXFlalordHVrdXVlMENLRElYOW5h?=
 =?utf-8?B?VEpJUHFaOXVST2d4Zy9lY0R5MFBJZ0o3d2Q5bHBQSDBrMHpBc0t3L1Zzb2hJ?=
 =?utf-8?B?RWJoTDNHMGdlVnhQdmtjdTBsUUgycUhGU2EzU2xzU2FJSlUzUGlJNkNPdWh3?=
 =?utf-8?B?SjBIalFKNklxV0F2elA5V2FVVXdsbUNGNmVxdS80bjJLTVYzYS9MWGRXRkYz?=
 =?utf-8?B?eGtjRjQydHp3ZG1SQXN2QnlKN2VJeHdIUFRmRkI3em15bDVRTVduSmdDRlAv?=
 =?utf-8?B?NmVYMGhUdHJsSFUydUNjUnlFcG4vOXordU96Q2Q4VjRYdFdENlRHWTdmRnBO?=
 =?utf-8?B?M0R4bXI5bEdUTnNXY0Rkcm1XT2txSUVlUnhkcnhJQk91TnRuQ0FoZWc2c3A4?=
 =?utf-8?B?dEVVN1hSMXIwZU1HZis2V1VQUUtKYXhkNWd5QnpXRHZ5alIrbXdVKzMzdkM3?=
 =?utf-8?B?MXB2cjRhemZMekM4eER1eHU5L05FeDFOMTVaQlNwaUx1clJLbkxhRFljaG8v?=
 =?utf-8?B?OTlWUi9Yem9EWGsxRkc4Z3J3SmpaRFZ4ZU40VmJwYmhzZStOT2hCS0FRK3Zt?=
 =?utf-8?B?dDh5VDRRYURYbFc1b0xqUCtuOEpBSlV4OXpHYWFWem8reG8wRTliRW5ab1Iw?=
 =?utf-8?B?S29rYmFpY1AyZkpLakF4ZTJFN1VwMmI0cTg5YUlRaXhTQ0tTaVl0M0RMRlFH?=
 =?utf-8?B?Z0FJdFVCMnVhTEV6a1B4K2xpZlA1YWZiWEtVZUptSHE4b0xyeWh5U1hnaEhS?=
 =?utf-8?B?bEkxSyt4cHNvc0pPenMrSmdNN3hpQmdIbzRDQ09NTjliUllhVGhPUXBQMUIx?=
 =?utf-8?B?SVlkNk13L0xlWWd6RGptbVBSdFlxcmZDblI3UlZXTm1kWFhxN0hXS243b01V?=
 =?utf-8?B?eXJSL2hpTERFQ3puS2pYaDlWbFN2Z2J5dDM5MU9BS0NpcmRRcHV3STA3aDNl?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3990b32d-d07c-4241-3fc9-08dc6405fa69
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 02:26:42.1741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MopQZug5Gat5eSIFsaHH571WRZE05H2z8n0Wwcr/j38iJaxNH2enlH/UuAGTGrTLDfVsBiJwGMtgELB22QtU9DsqvrMjEmLnOtXTBBMg1Jw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6323
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

--------------cV8Gdx0nRmoW971dVPDpk4ND
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 23-04-2024 22:46, Matthew Brost wrote:
> On Tue, Apr 23, 2024 at 08:21:34AM -0700, Dixit, Ashutosh wrote:
>> On Tue, 23 Apr 2024 00:03:32 -0700, Himal Prasad Ghimiray wrote:
>> Hi Himal,
>>
>>> There is no change in functionality. Using the helper function
>>> defined within the driver.
>>>
>>> Cc: Matthew Brost<matthew.brost@intel.com>
>>> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_vm.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> index 85d6f359142d..e9c8dc6d7b83 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -1279,7 +1279,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>>>
>>> 	drm_gem_object_put(vm_resv_obj);
>>>
>>> -	err = dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
>>> +	err = xe_vm_lock(vm, true);
>>> 	if (err)
>>> 		goto err_close;
>> But isn't dma_resv_lock coupled with dma_resv_unlock? So that should also
>> be changed, if at all? And what about other places in Xe which still
> Yes, this function should be updated with s/dma_resv_unlock/xe_vm_unlock
> now.


Thank you, Ashutosh/Matt, for bringing this to my attention. It was an 
oversight on my part, and I will update it in the next version

>
>> contain dma_resv_lock_interruptible?
>>
> I found two places that also could be updated to use the locking
> wrappers:
>
> xe_lrc_snapshot_capture_delayed should be updated with xe_bo_lock
> xe_vm_snapshot_capture_delayed should be updated with xe_bo_lock


Will upload a patch to take care of this.

Thanks.


>
> Matt
>
>> Ashutosh
--------------cV8Gdx0nRmoW971dVPDpk4ND
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 23-04-2024 22:46, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Zifs%2FD2+T9qwZNEj@DUT025-TGLU.fm.intel.com">
      <pre class="moz-quote-pre" wrap="">On Tue, Apr 23, 2024 at 08:21:34AM -0700, Dixit, Ashutosh wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Tue, 23 Apr 2024 00:03:32 -0700, Himal Prasad Ghimiray wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Hi Himal,

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">There is no change in functionality. Using the helper function
defined within the driver.

Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Signed-off-by: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 85d6f359142d..e9c8dc6d7b83 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1279,7 +1279,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)

	drm_gem_object_put(vm_resv_obj);

-	err = dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
+	err = xe_vm_lock(vm, true);
	if (err)
		goto err_close;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
But isn't dma_resv_lock coupled with dma_resv_unlock? So that should also
be changed, if at all? And what about other places in Xe which still
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yes, this function should be updated with s/dma_resv_unlock/xe_vm_unlock
now.</pre>
    </blockquote>
    <p><br>
    </p>
    <p><span style="color: rgb(13, 13, 13); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Thank you, Ashutosh/Matt, for bringing this to my attention. It was an oversight on my part, and I will update it in the next version</span></p>
    <p><span style="color: rgb(13, 13, 13); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
</span></p>
    <blockquote type="cite" cite="mid:Zifs%2FD2+T9qwZNEj@DUT025-TGLU.fm.intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">contain dma_resv_lock_interruptible?

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I found two places that also could be updated to use the locking
wrappers:

xe_lrc_snapshot_capture_delayed should be updated with xe_bo_lock
xe_vm_snapshot_capture_delayed should be updated with xe_bo_lock</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Will upload a patch to take care of this.<br>
    </p>
    <p>Thanks.</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:Zifs%2FD2+T9qwZNEj@DUT025-TGLU.fm.intel.com">
      <pre class="moz-quote-pre" wrap="">

Matt

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Ashutosh
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------cV8Gdx0nRmoW971dVPDpk4ND--
