Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B3DCD37AC
	for <intel-xe@archiver.kernel.org>; Sun, 17 May 2026 09:20:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79EB710E1F3;
	Sun, 17 May 2026 09:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dTSlGr0n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1600210E1F3
 for <intel-xe@lists.freedesktop.org>; Sun, 17 May 2026 09:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779009622; x=1810545622;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vZDSMrOteW+8h0J85iWa8civPj7Pj8qB/i6RjaFE0fw=;
 b=dTSlGr0ns+KrvAm+8TafDfieHtp6uUXtud9NGpNNU9JuVXS+XF3U4CWu
 yKI+yR2NUzu9exG62m+2tr6BHOUAsloqkOzlna2UN0TDOwz+eDrm6cDlG
 4L9jJhBUMliL0DFpJtFmpP+6rIPVGkztyregZrtBqMGBmXOUtq/DAiXmK
 YaehSDfnOYecIMj5Y1lqBLm3FmJnSEFD65nOlc/CJ22TjZ7drEwqQbsjZ
 s41GT6FROcllrKOqOyD//ISsSv5EOmVCxlVwjVZ0nfiFM8NRSMYJdIbLX
 S8MIVPmcqTcOwnvJ1YrAci0emnE9TLyBWnST9bt94I+RA62jZY8/q0K3C w==;
X-CSE-ConnectionGUID: wIQ9wyZeRGWvdcON1IrF1A==
X-CSE-MsgGUID: itcy+0GuS7mNNIJofLWcUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="90591299"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="90591299"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 02:20:22 -0700
X-CSE-ConnectionGUID: 2hFee+aUROWp+K6zkfX4Pg==
X-CSE-MsgGUID: A65dAfHWRxKlEk4et/WS2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="234682148"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 02:20:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 02:20:21 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 17 May 2026 02:20:21 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.26) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 02:20:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l5y8dldcg49anMdfak8ec2DIHDtosJwv/LuseeuVPouc7rV5H4FjNL0PK+nwVoXFmWUOms3RZrBDyQxOwliLF0JY4r/vRkazGQ1zdjl4Mrm3YzUhi99EtC3EfElmgHth8TLuOjTxpKCI8BzNSIGyT+BqPKxyu+y6HPhQceDf+MWP4SYTt3nN1fk6mZosKHlvADIoF6PR6KpI0ES0ZVU9kYo4BjYDRhzNAN/7mykFbf5ZQ9BY/vKfowdwkeEASIqvhY9EYjGCgchdlNTOzpPzOVpjzlKUCevIOxmSDbG93cIGHKwtS1ay1aBIn5EOj3up1go/mbq9NovWHmitakR7Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DajvuHdWdwcc+VBLNZFsgEwsXP+ypXVYSiwXrHxCUeI=;
 b=gG3IDq/r/AV3TWJi0hr+iMRtfIjijgnEC/NkITZrKOooyjZSvBS2kVwEGXNbfetAHypNI97uZq6DPTl3pJ+6H5vIF9CFzGjBPW0PZV7IDjTSOmjFqMIxqNFL7q2tgCfxyM606CIEwkUGvI1EYCOeVlKWdMEeXEmszCag0Mtu4Rogc3V0vgNSOR96No+xaDnzrIhwE9c4HKt2giXzqttSJRPA2NROuE8I00Z4RwDFKJUVOaKHOLNwYoXB/Qo5pkr3tAPkn40lqYFXz35NT3wF+GxxYKYToFB7bgnF23kEcxp9EN+cGlLW4wqbXv1h3jgr7VDa01bv38PjJv85uEcqhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by DM6PR11MB4676.namprd11.prod.outlook.com (2603:10b6:5:2a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Sun, 17 May
 2026 09:20:17 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563%3]) with mapi id 15.21.0025.020; Sun, 17 May 2026
 09:20:17 +0000
Message-ID: <9a9b8048-9680-4e60-bf6e-873102f19d3b@intel.com>
Date: Sun, 17 May 2026 12:20:12 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] drm/xe/memirq: Reduce buffer size
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260514150010.7123-1-michal.wajdeczko@intel.com>
 <20260514150010.7123-6-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <20260514150010.7123-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TLZP290CA0002.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::8)
 To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|DM6PR11MB4676:EE_
X-MS-Office365-Filtering-Correlation-Id: fd528f5d-9d68-4967-758c-08deb3f5826b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|11063799003|22082099003|18002099003|4143699003|56012099003;
X-Microsoft-Antispam-Message-Info: nBUDI/WF93zZVU6WCYJ1zBP1k84EYkpsGoEmyNqeohRfAs91kt+Ud1F+zNJzAbU5jEirTyDQEYgIiG3SjLwYJ+o3xW4tZ3SmNUJyFjoA3LeYh6lxuo+YdDm7LMnWg2ennfOiMjPwIhAXOW9G0gRW/dKjFB3RMx842ruYYt6UqK4k8Tj1mLu3CPVflpNHOh9HzJHeam7lhCtAD4a1iQRBXGxhJqNAvFOf82YEVHDgoqnc2TuV0Z9tx+i6pan56reTwV4TZGLQ69RWdGu6EGQYkTTcnDryA0POs24PMDGp5z4ebOGbqeh2pEThhoFLiCMZAmKrh/uYETI++TRdXVB3KwSNXTzfw6ngPWD/lUgJl8la85DcMTW+xK6qQg+OLxXhnq3zcfz1U4YJrVBa1JngVHIuxmZzhYEFtsq+B32dNsWcHNS/C5TBgTzRnc95Ac8bIkreVV1mOYoitZmxWNebo+Qbcmxgnk2qjXjaFafsLrVVdVlIeoFlRh5Yv+gy6zDi3GZdrhfESLyA9+YDYxvnjHUU4e2LGJ5fmcrkSXwp4XfqsqibYrkQ41QMPF8qwSBE4Q4+y7MLk8eWVdK0si5LzG1m7/uzjwmiuSGLFIla5NnpvN38l21pz63QWHJ7YBYflh+L9dYD1JGRZr5Z9FXQUemCFVaZCwXEs0rXPzPACRzpP1myUZxRhdMgl9BaXhkN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(11063799003)(22082099003)(18002099003)(4143699003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVl2K0FmTXJTYjBxcDVLVUtNUzFvUXhoeTBxTmkzTFg3R0JHVUo4QnNkakcv?=
 =?utf-8?B?ZkpPdzA0T0VOai9SQmppOGszazRlbm5vVzB1QmRjd0ZUM2p5ZHU2NHZIQ3NY?=
 =?utf-8?B?WUJEbWJpeXBHRlNKZlpuZjBNUDd0bHVIL1VqbE5YOG9jR1BRQlpWMXhQZ3Nm?=
 =?utf-8?B?d05VK3pJeWZGTi9yQzNZKzBFTW01Q3VSNzRGdmc3TktTWEdxRGFmcTM4UUNS?=
 =?utf-8?B?TzhUeHBsQ3RrSVU5bGhmSjM0T1ZmbXlwSE1ycjc2M0R2NmtMcEczaWtXTzFI?=
 =?utf-8?B?ZmwzL1VoWnlVTUUzVk5TMnphNTQrQkE5RFgyRHlwYWF2dmtFN1ROL2QwM29C?=
 =?utf-8?B?emxSd1djcHNxR0xhZ0drcHNaWW1xYUZIUmQ0aG5SRjFINmxwRXJ3dG1QUEF1?=
 =?utf-8?B?dG1kUmdNYzd6R2R6Um4vbERGMEVLLzZJZ3MzbUp1elI0RWx1Q0k4ZEVuN1BH?=
 =?utf-8?B?RVZaQVptTHlhZTFMMm1YWUcyNHhRTzI5T20xVmZhdGxwb256c3dwSDhSZjhr?=
 =?utf-8?B?R3FhMjBtc2Q5M0pLajNQYVR2YmFQNWFlQjZHMUUrUUhwaWdHTVBBamhDaTBR?=
 =?utf-8?B?Wmw0c09WZkV1ankxOGFsSTdtWWI4WWl5U2xKNUtkTndxZVQ0MFRLbU10R0ds?=
 =?utf-8?B?dVJoWEgwUCtYTFNWNlpHVWVwQ1h5akdKUGh3QjNySTFHdnhBdW1XWVRocHZ4?=
 =?utf-8?B?Rk5ZeEcvTXNINE1UZXVuVUo2b2lCQVVyRmhaSVVqZzgybFNJL1FNL0s0M3ZS?=
 =?utf-8?B?UnpwenlESWpmbVJUVUl5RGphMUNscTRSNURURjZWZlNPbUFIb2EzTzRDOGJK?=
 =?utf-8?B?NFVydjdmNTg1dlVWWm9vWDQ2Mmx2OTRuSE9CWlRzSFFrMTArSzBlS3B0czdx?=
 =?utf-8?B?WmtWblV4Z0U3bm16N3BvVW5COU1RS2xlalUwcXhIaEtVNS9UN1pKQmlGTGFt?=
 =?utf-8?B?ajQ1NlJPWDlEWlF1UFJnSzU4b3E3NU03bXNQcC9tYlduVndOVU9Nam5VOGwv?=
 =?utf-8?B?U2o0cE5KcU5YVmlwckVsUHc3czc0UW1USjYvWUdzdGFhdW5HbzBIaTJjektY?=
 =?utf-8?B?TkhvUFFrOEs1dkZta2x1bFpLR3NpV0k2U0w4TXQ5U2dBY1hLY0ZldzlFbEdp?=
 =?utf-8?B?dzBWRXpwekc4VXJRV0x0QWpXSlFTUHNsRTVrSG1lLzYrTC9KZWFWZlg3TUVS?=
 =?utf-8?B?bVNCZjJ4U2NSZkZQTGVPcmh0d3VKTWFMTVpZTjFHdHFuTHZya3hjendaYmVZ?=
 =?utf-8?B?eTlOQkhPdVZCVVR1MTlnakdnQWZXR1hDYkV1QUJwSTRQSWZlT1hqZ0NoQm1k?=
 =?utf-8?B?MjZwMlF0eW11OGNNdDdhd2hxMzdnTUVFYmhoSTNsdlBNdXlGS1hNZ3F6eE02?=
 =?utf-8?B?ck5mMjExQUN6MDVBKzZXVURNbFJXWFlGY0x2Y3UyL1BGbW01cnZkejluR3cw?=
 =?utf-8?B?aVZRQUsvVlV4cCsyV2VTaWJrdFQ0V1VDa2kvY09wT05LU25CaXByWVZDcFQ0?=
 =?utf-8?B?SDhSVGFnT1ROZ3V6Wm93SXI5YWJ3U09aNDBMaWI3ZDNqNnZxQm9QUVNramVt?=
 =?utf-8?B?L004MzcxanFualg5RUh0L0tiQmtWeWJ4bTlpeDFTM3VSTzVPYmVMYU0yM0F5?=
 =?utf-8?B?ZG56NWxqY2NCTFRXYVdPaEEzVVIwSWlDeTVwTzhXdWRoZTBxbWlCWlp0aFoz?=
 =?utf-8?B?dnRYM0pXZmhCVkpXNlhvd1FGV1VaRlUxWUNBeHA3S2k3K3liRVR2emNzVlND?=
 =?utf-8?B?TTNiaXU5enh5T3RzcE94a1pxOWdEblcrUmxtaGVRNHVQWlZQbVg3ZC9xcm9y?=
 =?utf-8?B?WWFjSDRQbGoyVThzSVhicklpcW1ZaW5ENjZmT1BnVXgzQ3NhUnk4cERPMGNq?=
 =?utf-8?B?Zi80UmlWbTVBMVh0cXpZc3VJYWkyOVFzMGMrRzlFa3ZnREhJbHVpeW1yblN2?=
 =?utf-8?B?TkdYK0NtQXl4VVNGY1dsVndHTENzNStWRmNoeDNpT0JrWGNHOW0reXFDRHJR?=
 =?utf-8?B?N2U2cU0vaERYSEphZGs0VkNwdXVVR1NQblQ4ZWhwSGIzZTFHajJuMkRTMjJV?=
 =?utf-8?B?V1ozV1RGQmw5aThtMmhEc25WOWZuYWVzTDFod3VJK0xjU3ZIaThQNWNHSFpi?=
 =?utf-8?B?VUEyZ0NQQzIxWld6Q1MwbFNQeWppRjBXM0NIOWxTZUhFZ3JUSHhnUGtLODl2?=
 =?utf-8?B?SEYxM1k3eXpSbExxWWlnMVhVaFpiSTdnY2RKaG9FNmZsUlFqbzZSSWhRNUlG?=
 =?utf-8?B?TE90Z3ZHaHFtSFVGS3BveERtQ3VQUEdtSFBvdS95cjNSS20yZ0RDc3ZkNGNV?=
 =?utf-8?B?UzJYKzJTVWdiMXRIQzlyNmZGSFZXMDljZkdVQWpSY1ZSNTA0MFk2UT09?=
X-Exchange-RoutingPolicyChecked: qMFQcqI/B2pvf5PgGi/gVyyja1HIqA78JOH/fW0u2TEYflaAZ5vEaZzIEAFdAoLE5LPvC7aL3ehApSTjzk3BpcPY6IVOCGsm51EHz4h0G+5+QUHEYdYgSWhYnjKB/ojs0nIEbzO4rkiTVscwvcMvhCuOfTDywu4T5J3siQ9hqMRW7ms+r55eHPzvrpjaai1GoY8l4rEY5FJHY4qv0gK1FID0Ur4JUs09za4F+5gQJxjuq5mT4gD0y/fq7JeYhJ4Lmrkwb+w+xx0PQbPERsOfYW7SffQNeNTDXkfNRWOdr5RfUnN4A0DWvuPwO+rHnXoMZJCFdVZPhdvP3O7awbZH4w==
X-MS-Exchange-CrossTenant-Network-Message-Id: fd528f5d-9d68-4967-758c-08deb3f5826b
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2026 09:20:17.2815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTGYmY5VNbj08rzlB+79eOJ5Jx/L34HYTHNFvLetayZiUasfFajXfRJer3/lfToEULwWL07RlhetWWNlRkQq2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4676
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

On 5/14/2026 6:00 PM, Michal Wajdeczko wrote:
> When using MSI-X, we don't have to allocate the largest possible
> buffer to accommodate all potential engine instances. Loop through
> available engines, find highest engine instance and reduce buffer
> size to avoid memory waste.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Ilia Levi <ilia.levi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_memirq.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 285fffea62d8..6ffc92f5a0f2 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -172,18 +172,35 @@ static inline bool hw_reports_to_instance_zero(struct xe_memirq *memirq)
>  	return xe_device_has_msix(memirq_to_xe(memirq));
>  }
>  
> +static unsigned int max_hwe_instance(struct xe_tile *tile)


NIT: perhaps something like hwe_max_count would be a better name to explain the +1.
This is also inline with the FIXME comment in xe_hw_engine_types.h:
/* FIXME: s/XE_HW_ENGINE_MAX_INSTANCE/XE_HW_ENGINE_MAX_COUNT */


With that,
Reviewed-by: Ilia Levi <ilia.levi@intel.com>

> +{
> +	unsigned int max_instance = 0;
> +	unsigned int gtid, hweid;
> +	struct xe_hw_engine *hwe;
> +	struct xe_gt *gt;
> +
> +	for_each_gt_on_tile(gt, tile, gtid)
> +		for_each_hw_engine(hwe, gt, hweid)
> +			max_instance = max(max_instance, hwe->instance);
> +
> +	return max_instance + 1;
> +}
> +
>  static int memirq_alloc_pages(struct xe_memirq *memirq)
>  {
>  	struct xe_device *xe = memirq_to_xe(memirq);
>  	struct xe_tile *tile = memirq_to_tile(memirq);
> -	size_t bo_size = hw_reports_to_instance_zero(memirq) ?
> -		XE_HW_ENGINE_MAX_INSTANCE * SZ_4K : SZ_4K;
> +	unsigned int num_pages;
>  	struct xe_bo *bo;
> +	size_t bo_size;
>  	int err;
>  
>  	BUILD_BUG_ON(!IS_ALIGNED(XE_MEMIRQ_SOURCE_OFFSET(0), SZ_64));
>  	BUILD_BUG_ON(!IS_ALIGNED(XE_MEMIRQ_STATUS_OFFSET(0), SZ_4K));
>  
> +	num_pages = hw_reports_to_instance_zero(memirq) ? max_hwe_instance(tile) : 1;
> +	bo_size = num_pages * SZ_4K;
> +
>  	bo = xe_managed_bo_create_pin_map(xe, tile, bo_size,
>  					  XE_BO_FLAG_SYSTEM |
>  					  XE_BO_FLAG_GGTT |


