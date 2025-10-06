Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE83CCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 12:11:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1574C10E353;
	Mon,  6 Oct 2025 12:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UpKwYayI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E3D10E353
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 12:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759752690; x=1791288690;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gJZz7DcOiAOyOstNYaELuwx0XomYB1w+dHpEYIdoDjs=;
 b=UpKwYayIW8JsayvLDFBrE2j/caOLgrxDzw899xIbQDJ4kCZmuPol9hPz
 sMIZA/NTkXGyn7qDn5o3X0jbz+7o4qy3zSQXd0At3Ilkf5dsQsBzAMB05
 Mbs+QEfuxjY5BF+/MvlIFzkNvNDuZY6KG3plx3lWv5EwMxZgyGs4WF7Ae
 6SCeGAIBtwGhuyoK5rH2lQdntkp03W6TLVO425oGyoU9H75oPd+ULVbOI
 qoxgsGhSe311RS/P7vG1GWHLbtbDclAfv0ufR4Ko42XZtA/coL2RLSePt
 hKiohd/PrpJXjZ1HZb+zog1HW01/6R9oBTpIfX6OofhCcZ3zSgJLDHysY Q==;
X-CSE-ConnectionGUID: jq29VLyTS5ySjy0VpKP52Q==
X-CSE-MsgGUID: VzK+omM4Q+myzhVaqw0NgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="64542745"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="64542745"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 05:11:30 -0700
X-CSE-ConnectionGUID: Rmc5y4zlRYyIYJL4OK1nKQ==
X-CSE-MsgGUID: G8UG1kgKRrSqUyr1K/sRMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="180666884"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 05:11:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 05:11:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 05:11:30 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 05:11:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xx3Vyk1YxEumAxjfDQawS4+8UXh4Kmj4iPdfh7/XqxDF9s2Qh6w66aSPXASsBlGM4V9fwleqUkVmZ/8Ve0nuYqDof1SzN7lmJbiN8+wsYPCdkx9XrvwLNYTjLRQ49rr0jkDAFaGXAcoOB6gxOfLDs6htp3dqDlNOkDUrD2bkbKPgtl6ycFk9MXimjRuD8Xge1KIErEhCnza9fPASUkGpBwblATB/LtFdCZFOjiMT+18E1C/IKI/LxGqJOX+utjRiGtAa4iH2l+B7LSflVwD9Fl7JOEOfgBCi86aOpIfKCJN67MoEMfZnWWXg6KCm3X5iHHqod/Uio73atH5wUdX3Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eH+Lgbh1FC28wNpK1CUqdFCYLggUr+BPs2F8FFMezr8=;
 b=a3OxmV3kzibZERKBqOYMgi7rA7wu1lshYhzcD80krd9dqMYP8GOBzCUzo0nwL0+2YPXXOiLBj/jRIYx+tLVQokll3cz8i8hJuQ0gHJAeaqhaZWFkiPsC8ylFS27bgolrjjAQxMq7f0IhBOjyr+xpjWMeafDT/NPpZ2yS3v4MEDYLVEK9c4VQKAk7s1VzS4hMNWFpDKj6Cui8shP31P+IFeAgbl6EeDJISMIqbw1Httw0ySVlB+i5QFiplKo1OK1EeZ3/Kd+wFy+RCqc3wPzk1qIkapDFqpDAM1WJSubsC7OZZc5+/HI0IaRTWtFnyWbGvYcsyXd2x/Gyrb9wEspvJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB8000.namprd11.prod.outlook.com (2603:10b6:8:128::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 12:11:23 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 12:11:23 +0000
Date: Mon, 6 Oct 2025 14:11:19 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Ratelimit diagnostic messages from the relay
Message-ID: <20251006121119.cs3etficmnld4yui@intel.com>
References: <20251005173946.2784-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251005173946.2784-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: TL2P290CA0022.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:3::6)
 To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB8000:EE_
X-MS-Office365-Filtering-Correlation-Id: edc5c722-84e0-4b79-3dff-08de04d177b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWFwdERuSDdIWkdxT1MxQVQ0NTkrYXQxK0toV2trYlFWWlBraVJscFRxTDdu?=
 =?utf-8?B?aHhQcHBtMmFxdXdYRXdZdlVNd3VELzcxSVZtRFRRUUduVTNFSDFSMVgyV3hR?=
 =?utf-8?B?aTVIRGE5d1h0RFdIN0llR3lFa2ZCeW5VYUVXQWxZTjRoN2ZQZ2lyL2FlRWRp?=
 =?utf-8?B?dThHVXA4UVlKRm95QStrcGFQMnd5S21aY2p0ZUp1S1Q1K1AraVZrTVdzQVFE?=
 =?utf-8?B?Z3A2R3BRV0pzakZkdE01MXo2Y2dubFo3Vi9GU1U1NVcwLzlRWDNrMGVMbTJH?=
 =?utf-8?B?QlpJZkdIOHF6dFlZcmdGRnZuTTMrMFBaaWUvL1c4RnMxNUsxY3JMV0s5YmZT?=
 =?utf-8?B?azJ3L05ORFlLVXBLYjY3aGhWSGs0dUgycTl6R0VXb2U5djN2ZHIrUTVNTTli?=
 =?utf-8?B?QTRGMTEvcERjTDRiZWlnYWpyaVNIbW1GQjZscTZGU3RmeHlCMm5veGozQzc0?=
 =?utf-8?B?SW5KbGovUDM3OWx2WHQvVVBsSUJYdHpXblkyY3J3bUVidy82d29WdkltdnZy?=
 =?utf-8?B?eDdWclZLR3dvOHF4MkU4M2pKYi91ZFVkeld6VDN0V1dKSVkzd1YraGZRTUEz?=
 =?utf-8?B?SmNYanZXUGFXNlVKZTJmMzRtdVQ4RXU1N0FPTXRCaFdkdFJ2WE1yeUc0QlBC?=
 =?utf-8?B?S1hoKzVXb01iWUw1VW9zcW9rV3ZBN29ZMkRPWVNhK0c4bFdUNDFDZkloQWFq?=
 =?utf-8?B?SjJEVVBCVUY2cVMvV0tnOXh5bXpEMkRONkltRVRQNFNxbklvK1lHSWI0Tjdi?=
 =?utf-8?B?ZVY0bGVEVVJYMjBWczRnK1ZUZDhzb0F4L3M2YkxIM1JSMXdaWi8zSXJadHpI?=
 =?utf-8?B?cEh5ejllclg1ZWFTVVYyUFM2a2g2Y0h5ZnRvci84U0VYaHBkWTArWkVYbi9s?=
 =?utf-8?B?TElEL3R6aFR5M3czV3FMMk1oN2ZGSmdRSUdBclJ2b0VmdllnejJpaDJzMnR2?=
 =?utf-8?B?OXBzaFcwZVhVUmt1T2F1VTJqVnM1WUpHOWVtUUVoZ2REd25la25GR0lKUU15?=
 =?utf-8?B?bUJCdGlJK3RLb2UxdlhZZkx2b2lHQWdlT1RxbERuTmR5MGw3WXdpNE10c0FE?=
 =?utf-8?B?ajhOUXAxQ2treXdib2hqQ0haY2pidm9jRk9yc0lBbnN3WnpXc3pqcDF3S0hP?=
 =?utf-8?B?KzdrV05UUy9WbHZyT0VWdHZIQm9WdC9RQzNnNzhzSXAxYUdWM3F0VFhBTThh?=
 =?utf-8?B?TE5HQmFaMW1Wajgya3VZaUo4TzllK0lRUytqSjFNYjQvOEtBempYdTMvZ1R6?=
 =?utf-8?B?WnY0eGU0Q203TzlrQmQveWd1bzE1K0tGMFd0VXE5WmJVcjdhQzh3SmpBNEpD?=
 =?utf-8?B?YW0yUGROcTF1bDM0QkhFSWxjS0tVTGtqNS8zWElHZmdSM09CTFoyTHlFeDlp?=
 =?utf-8?B?OUVZY2V1OUJGSFcxQ1p0RkZldWVHc2d3Rzd5TUF5R2hMMmtCcDR4akUzazFr?=
 =?utf-8?B?OStPNGtzZCs1cjlvaHVkeFVxTS9PVTZQZ1JlZ0IvZ0ROYzlEWlBtUXFHM3E4?=
 =?utf-8?B?WmNFVUdxaGNLSVA4UzVhdjhPclo4M2pXS2ZjOVlFTjNKZTh3S1Mrc2J4TExF?=
 =?utf-8?B?R3doam9kYXVUSjRxUFdMZW9XcjVVV2RSenJLa3N0dThOSXRWMGxoOTRNSGpI?=
 =?utf-8?B?RlErN2dLRU9sOTN1b0pUL3JSNFlvcytZTFJCQWp0dE94Wmt4RWxza2lBcEJY?=
 =?utf-8?B?b0xMb3o0RGZPZngvNHR2ek5PWGgzWmUyUGZtQnR3NjQ4WjFNV21DbkxkRWlK?=
 =?utf-8?B?bGszUHV2aCt2VkIzSlRxSWZrTm91dzRNcHJVWFovTWRjajZ4WEVwQ2ZlUURP?=
 =?utf-8?B?NnZqcFRlcncwRW92eWtqcGpOTEYwYmxCRGxIR01STVVBR1lSa2FuVzQ2ekpj?=
 =?utf-8?B?UGxyTE95WG5JNGpDbDJmSFZ2cEZqYXF1WVJDOGkxejRlWFd1MDltUStlYlhC?=
 =?utf-8?Q?LIh2+GicT8QdFKBgI7PULi/bADIBvwky?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzVqcXVNWVlLS3B2N3c4V3JXYnNsNU9TakV5dHU2RlFFVjdzenVyM2tuUXBr?=
 =?utf-8?B?VXh4ZUEvQkpyenNGbjhXSWthMXNrNlJtSFZueDBMcUJlZEdETHdFcEtPYWlr?=
 =?utf-8?B?dHladUpRRWpXMVhUNjl3U256azdNakRxaXFsN2l6cjZ3ak0rU2dLbERjYmQ3?=
 =?utf-8?B?a1hwTC93R0I5aTRnWE1TRC8zYi9sSGRWMDVaSTFzSTZZWVdpTWxmR0hJUEFw?=
 =?utf-8?B?Y1hDd0pXVnhRZWJEWDArYTR1T0VESi8rcHk0dmNxOWJUaTRPZE92OUZZSzdN?=
 =?utf-8?B?Ymd3SFBNaHRhUmNsT3NRQk5TVERSU2dNVVgyOWorN3dtWTZsd2FHeStTWmR0?=
 =?utf-8?B?OG9mZjZQOEpYcjVOb0dBNVQvYmhNS2prMTBBbUlPZkZvbTgvajc2bExVU1ZF?=
 =?utf-8?B?THM1WTFNMlV2RldYUktRc3kyRWNjRFpqY2h5L1RIb3ZMYWJaclorenNUNW1U?=
 =?utf-8?B?ZVNrVXlORXlmUGczL0hsR3dQSG1JMGd5U3VqR29adjlZbTVnSkptNmxJbWtN?=
 =?utf-8?B?aHpvb2hyMGhzbE9yckhuSWZPaGZJNEw1SUVpTHlXakw1STVjZmNkY2RkZ1Vq?=
 =?utf-8?B?OTlGRUpPUHZ5c3FQRExHOVJvTnc4ODJ2d0wrMkF5SjdleWIycjlaOHczWWc2?=
 =?utf-8?B?ZkgwTW96eDIxNHpTc29wRXZFNFQ3YkZvN0lMNTkvdGNUUmFkUEEyU2ZHYXlD?=
 =?utf-8?B?OGNQdjYwZHFUQkQwYnVLeVVaMCtTa3hLc0M4eCtYNk1ucjF1TVc2cU5YSVBi?=
 =?utf-8?B?TFRDNnNBQXpYQWNocm96SitxQ1JmSG1jazNFdFI3VkNHMWRUNW5tdzFySVJJ?=
 =?utf-8?B?N0pjeS9uYnlzcGlGV0xnU0x3MW1rTzhkUGlzVmFaTC9oS1U1Skh3ZWN0Lzhx?=
 =?utf-8?B?dnR6NU50bnhRa1k2aE9vNEpIM2J4a0o3aDNtd1VDd2toSjBKSHZ1QS96ZTl1?=
 =?utf-8?B?bmxUdkgzamJ4MFNkOENHZXZBczhySTBkRC8rQkRtUUcyeU1oazNLSTQxSkgv?=
 =?utf-8?B?Qk1HZmQ1ZXI5QTZGam5sSzBvcE1oSEoybHV2Ny9aT281cmlxYUhJT21neU1M?=
 =?utf-8?B?Y2kzK0srcDk4NUVFNHZGTExlMFB4cnlsS2V3a3JXREY5MGRkK01QSFpuVGJa?=
 =?utf-8?B?RW5lTzZSSzJmMnl3MkxrSjlSaitnN3Iyd1h4dDgxWG0xaFBQUi9HemdVcnEx?=
 =?utf-8?B?cWZLakw4NjA5RklDZlk3NmVRWWJaSXVMUUh6MVBNeEg4N1doczNYeTRUTXVm?=
 =?utf-8?B?QnM4cStpUlFqOUpRczNBdTRTa3pKWFNrUE93S25yZi9XT0krczMyQm9ZSk5H?=
 =?utf-8?B?SGk0VEFGNloxVDI1aXlybXNrby9Vb2c2azhZOW9DSTEzTzhPbFZFRzVyblpM?=
 =?utf-8?B?c1VwdnJMbGdaQUQ2akNFUVVsT3VOTFFuT3NFZ0NXcS9vazU1WUFRUk01SXR2?=
 =?utf-8?B?Y3ZhM3FUOFBKRG5rZVpUMXN3STVTZkFvUlc0OFVYS2JrNGNDamZ3WDA2ek1i?=
 =?utf-8?B?cUVGR05WcVpkNVFZMEZMZ0V1Z2dTeUZrdGRJWG5jd2ozekF3QmFDT3pSTkdH?=
 =?utf-8?B?TXBSMzVjbjYwTTAyYmExcmlySWVpQktTSktLQlFqaDJLL09sd09TMEZQbnJp?=
 =?utf-8?B?RksxakhHTEhLZnBYb0RVNFhJNFlmYnBaREJuZE4zSGV3ckhtaEEvREVPbkgr?=
 =?utf-8?B?TGlmV1Jwb241UGtPMTZxdnpJc1M0TXY5SXMxTndaMHhtaWFzbG5FdERFcWpG?=
 =?utf-8?B?VmxPaC9tdFp5Umx1U2t4UnVGMm1hU1F1RG5XS1RjdkxsbzhCRDNoYllhQ1c3?=
 =?utf-8?B?UVRSMUlOcSsyTnBxcklzcU9yQlBtUDkwRlQ5MFRwTGJTcWJNM0dLQ1l3cjNn?=
 =?utf-8?B?b2orZDBtRXhPQVJTWDdWWlM2N2c4d1EwUUQ3V2MvSXV5dnFWUmQvaWY1dlNz?=
 =?utf-8?B?dGpyRGF2ZXRKQmh6anEzOVFZZDJCRlgyN0p4cmQwcUxlbnlWREo3M0ZJWmJi?=
 =?utf-8?B?WllrbFZRQStsNXVwYWVuc3FuWUZMU0FId2hsTlpaclZ5M2JKbzI4MjJPUnNy?=
 =?utf-8?B?ZU9ET2VyVVlJUmVYem9MSnlYbnQwQjlkWUNzZU5qYVgram92empzUnBJV0xI?=
 =?utf-8?B?MmhxQlFCMkdLcG42Z2pjK00yVTFHN0ZyV1NENlZkcE51Ry9ldFpscit2V01q?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edc5c722-84e0-4b79-3dff-08de04d177b5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 12:11:23.8405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3E7G+807kOaxwBNUO416EyDXfE5AxsEqyqOH4L19V+oOaq5y3ryaHf4m9YBf9CH5I8f3iLyjh78P1e5ssug/be6mKjgyZ87zawX1vQ20/VE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8000
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2025-paź-05 19:39:46 +0200]:
> There might be some malicious VFs that by sending an invalid VF2PF
> relay messages will flood PF's dmesg with our diagnostics messages.
> 
> Rate limit all relay messages, unless running in DEBUG_SRIOV mode.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_relay.c       | 17 +++++++++++++++--
>  drivers/gpu/drm/xe/xe_guc_relay_types.h |  4 ++++
>  2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
> index e5dc94f3e618..0c0ff24ba62a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_relay.c
> +++ b/drivers/gpu/drm/xe/xe_guc_relay.c
> @@ -56,9 +56,19 @@ static struct xe_device *relay_to_xe(struct xe_guc_relay *relay)
>  	return gt_to_xe(relay_to_gt(relay));
>  }
>  
> +#define XE_RELAY_DIAG_RATELIMIT_INTERVAL	(10 * HZ)
> +#define XE_RELAY_DIAG_RATELIMIT_BURST		10
> +
> +#define relay_ratelimit_printk(relay, _level, fmt...) ({			\
> +	typeof(relay) _r = (relay);						\
> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ||				\
> +	    ___ratelimit(&_r->diag_ratelimit, "xe_guc_relay"))			\
> +		xe_gt_sriov_##_level(relay_to_gt(_r), "relay: " fmt);		\
> +})
> +
>  #define relay_assert(relay, condition)	xe_gt_assert(relay_to_gt(relay), condition)
> -#define relay_notice(relay, msg...)	xe_gt_sriov_notice(relay_to_gt(relay), "relay: " msg)
> -#define relay_debug(relay, msg...)	xe_gt_sriov_dbg_verbose(relay_to_gt(relay), "relay: " msg)
> +#define relay_notice(relay, msg...)	relay_ratelimit_printk((relay), notice, msg)
> +#define relay_debug(relay, msg...)	relay_ratelimit_printk((relay), dbg_verbose, msg)
>  
>  static int relay_get_totalvfs(struct xe_guc_relay *relay)
>  {
> @@ -345,6 +355,9 @@ int xe_guc_relay_init(struct xe_guc_relay *relay)
>  	INIT_WORK(&relay->worker, relays_worker_fn);
>  	INIT_LIST_HEAD(&relay->pending_relays);
>  	INIT_LIST_HEAD(&relay->incoming_actions);
> +	ratelimit_state_init(&relay->diag_ratelimit,
> +			     XE_RELAY_DIAG_RATELIMIT_INTERVAL,
> +			     XE_RELAY_DIAG_RATELIMIT_BURST);
>  
>  	err = mempool_init_kmalloc_pool(&relay->pool, XE_RELAY_MEMPOOL_MIN_NUM +
>  					relay_get_totalvfs(relay),
> diff --git a/drivers/gpu/drm/xe/xe_guc_relay_types.h b/drivers/gpu/drm/xe/xe_guc_relay_types.h
> index 5999fcb77e96..20eee10856b2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_relay_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_relay_types.h
> @@ -7,6 +7,7 @@
>  #define _XE_GUC_RELAY_TYPES_H_
>  
>  #include <linux/mempool.h>
> +#include <linux/ratelimit_types.h>
>  #include <linux/spinlock.h>
>  #include <linux/workqueue.h>
>  
> @@ -31,6 +32,9 @@ struct xe_guc_relay {
>  
>  	/** @last_rid: last Relay-ID used while sending a message. */
>  	u32 last_rid;
> +
> +	/** @diag_ratelimit: ratelimit state used to throttle diagnostics messages. */
> +	struct ratelimit_state diag_ratelimit;
>  };

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  
>  #endif
> -- 
> 2.47.1
> 

-- 
