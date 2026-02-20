Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88607C531EA
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 00:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA8710E76D;
	Fri, 20 Feb 2026 00:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N3bDD7P5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6918D10E08F
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 00:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771546078; x=1803082078;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lR04YQSi/f5Arm3yoBSLQhkX/OURoKexZ4ZknisQoB0=;
 b=N3bDD7P5SDLarhQBWGKmaqgL9p1QHDrE0Gh/NbOU8TLsKNn375OrKx+h
 YnJlShvWNO4ZmNtCqU1uEBimHNRC8ZkN6tHmSXRUklqUhsJVZ+7mE+gn9
 y5WYAZKe4BwP/XF11rKzJdEZ54wBPEDAv9iX3/I5f6oj5GTKnGVvdcRYR
 RklzxH0h2FaWGBsLSpEx9J/+ZOHVfetnhQ5AKDya99UOlRozm9RKoVGfT
 dlo4ZsbrwCOVHf3FP/yD6l8tyqqkWocoDdlb1aVis8lK6rNSswRg6DspB
 BksQLdgYVzwBtDqu0Y4T0+oHfGwKgfEKF5yWHcY1kVuO/NxCHSu9rdnJB Q==;
X-CSE-ConnectionGUID: 5Yu3F/DOSPmP2rwFy8vV9A==
X-CSE-MsgGUID: NYZawnmxQviaxnElcLdrmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="76259019"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="76259019"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 16:07:58 -0800
X-CSE-ConnectionGUID: E/dXBXwUSqiZN+y5mOpbhA==
X-CSE-MsgGUID: pCwxIYLZROabs/pPN3h+aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="219211728"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 16:07:58 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 16:07:57 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 16:07:57 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.63) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 16:07:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+xiHvy2CWMIt8zVvLlPGKkTyB7V47K4gdV/qAUQbXGGfQFhzA7/A/K4HWvsW8XD4BxuDeafF/dl+eC8oL/9ELQ5B5xjd3oAol866yjzA/1AQ/EfOG1MlDysx1fn5CiHO8uEbKvvR2LbBpaR79jLubsfvRtRFoGVCuqt2L+AFcDQ2MGp0BeXHCj9AIou2/FvxsNfQ2axtJDX6VYaFGjEkakCpHv91zKDfbjhZkSdY5MZ6LGc2T0J00YVS/eX7tSrfPkAtPQDSJ5cOsINB68IO9UFB0UcvaedKEfduVlGc88a+MgCodh7yz4dUI7pAUaM3aXTknDfgHwnKxvrxBoFmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKk04SPm8MTJH/oohHHHiVoeIyiTG2+qUuihT4ofryk=;
 b=CL+4fjZAPczhKKbC43/NZIbHoY+rI4tpP9HdXbl7xK/KXCKRqkN79jVFeqdvNXZUM/Xde6nWjLKKz34dqsoHSbRB70/iVCvxaz7ENHIv2ddlfTMeM7obYdazH68deQkPfg7vpPaRuw6ejQw57+NrOjLQSciaf26yy/qy4g8pncli2Qh22x7BDVJy0S2afYtvcn7M2YJWPVsS7eAGwY8E+qmVLP5yMU2x3c55R5U1zwXrGqrPgy7ifE0e0kTXPrByCw7nGwNNIdPnA06Sfj03wq7XFF/wQc0DwVlDa/e5oP33eNqE2mYhDjpjfbIa3ZpCFI2dw3WgbAogDpnfMfgcAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS4PPFCAADA7A6C.namprd11.prod.outlook.com (2603:10b6:f:fc02::4d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Fri, 20 Feb
 2026 00:07:54 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 00:07:54 +0000
Date: Thu, 19 Feb 2026 16:07:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?=
 =?utf-8?Q?re_for_series_starting_wit?= =?utf-8?Q?h?= [1/3] drm/xe/xe2hpg:
 Remove SRIOV VF check for Wa_18041344222
Message-ID: <20260220000751.GD4694@mdroper-desk1.amr.corp.intel.com>
References: <4043a30d6a971cda3c13145e081e4eed7cc4e440.1770760591.git.harish.chegondi@intel.com>
 <177078945057.244838.94516784589253149@a3b018990fe9>
 <aZd15y2Xx2tvwZF7@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZd15y2Xx2tvwZF7@intel.com>
X-ClientProxiedBy: SJ0PR03CA0095.namprd03.prod.outlook.com
 (2603:10b6:a03:333::10) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS4PPFCAADA7A6C:EE_
X-MS-Office365-Filtering-Correlation-Id: 035f0f44-8e26-4ba2-55d0-08de7014182e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmR1TzdJTWplR1JsbHAzZnM2Tk1UOVl5dUNNaFZSRHdMRlR3ZzRoZG5acjFY?=
 =?utf-8?B?bWkrc0oycXdOT1pucSsyR3l0Wk4rQ3ZkQzZNOTJXeG1qSFFmTzlaZDkrclVp?=
 =?utf-8?B?QnpBMUlVc1VEUDZiQkhZN28zN2NvSW5hWkVTRElYZlR5V0U1eU1TaU4zSUFh?=
 =?utf-8?B?N25DM1VZZERvQ0F6REhJMDhDVUFiT3JNZjY1bmptSExpYitlNU5ITXZwOXB0?=
 =?utf-8?B?MXJFMHJBYWlEU1pUaDJjQ3hVN0dXclBxUGhzMGI5ejEyQWRDSVFRR0VWbXQ0?=
 =?utf-8?B?Q0N1ZjVZb3c3WHVpNDhtckhkenEzYXNJV3VlTmg5NkRVU0p0Q0JTVFRITEJL?=
 =?utf-8?B?ZDUySTl4RllMSGViMXd1Q1Z3bGFISnpvMTBzeUhEb2oyMmVNUXkvVlZsZGlV?=
 =?utf-8?B?bW1GTzZ2Q2REU1VDb050VzFrTnY4Wk9HY05BR1VKZzVPQkxGb2RIZURBdUFB?=
 =?utf-8?B?b0ZBeldkTlJnOUUrZThQTTRUb0ZseGZ4SjJTdUJnRElGNit5KzA4eWJjb2lN?=
 =?utf-8?B?Wm1BMW8zVmpnTXZKL1g0NC9YWENCZ0NVVlB4eGxXMXRmZklrZDA3S3YvQm4x?=
 =?utf-8?B?REduMXZXZ2NFRW1VdFYrdjJiWURibi9uV0s3RkcrQTdBUm9vSzg0dEFpL3oy?=
 =?utf-8?B?MGxaTExjMTBIQnB3VTZNL2UxREU2RXRzdHVVRjhlTGU3a0wrbGQ0VGhOc1hV?=
 =?utf-8?B?MVV3UWpHVXZKWGFka3pib2NEUUlEMmRxRDJQL3p3enE3WU9EKytiZ0dyZlg5?=
 =?utf-8?B?NVBrNDYrVnJpRzlMVUxpNG1qcGxIckd0WDhMWnNmSnkveWVJcWdRNWQ0cFc2?=
 =?utf-8?B?Umx4QlRoK28xTU4rMUR1eDJTdytNandsTDVzR0IyNEZVT3BzVElZdHUwMmlC?=
 =?utf-8?B?WmdkajZoZVc2TnJVaWc5SEhVS25Fdy9tcnRFdmFhOFU5SUJqYjFlV2RueDlE?=
 =?utf-8?B?ZFhBYWlRSXAwUjA5Y01BL00reVNZanBUQW1nTGhDM3NScSsyN2Y5ekhDb0Nt?=
 =?utf-8?B?NTNBSTNkUkdyZG1CaEFRUHdQZVFUa3VEbEhjazZsY04xNUxmYWR6b0gwd3ZW?=
 =?utf-8?B?R0l0YkNlU21GQU9yOTF1ME9MTFlMKy95R1h2Yk1uZXZtZXJOZ0RxVVpiMHhG?=
 =?utf-8?B?UkNHZ1Y1cE1YUEN4Z3hGRzY2aW43V3hHYUlISHBqNU1KQjJyUnBsekwwWUFQ?=
 =?utf-8?B?N2lxNmFsdkZqNGdqR1gyQi9GSm9aN2hXZlpnTE1udldyUWY4ZFY3VHpJOExu?=
 =?utf-8?B?cmZwVjlhNHIxa25hbGtHaFZGb0ppV2hxaE9iSmh3ck5LYlBXOGp2NEs4b2Nr?=
 =?utf-8?B?Mm1OckdtSjZJcm81Ym1rajgxSldkUWRKU0duMnVxeTc5UjVwZmJuNDVINlFj?=
 =?utf-8?B?MjRiQkNWRjRJckZSYnVpMFRkRm5qc0JDbGZtUmxmTDM4dzJxbmwrRVIxMmdo?=
 =?utf-8?B?b2laMUFCQ3dDaHRtVDY2OFdYayt4dzNZS1NQdVpocm9hQkdjOGlNRkt0cUMr?=
 =?utf-8?B?VjJlZGtpL25rV2FIMlBFYTgyZ2NGS0VUSzBIa3YrM3M2QlRlNWlKVFQ3b3NG?=
 =?utf-8?B?VVR6LzJxV3dPN0ZrNGM5VWx6dTJMU0lYZzZUb3grTFZGM21DSmxuWXE3MzJy?=
 =?utf-8?B?NFlLYTExNFNKbE5FWlo2UXc5Y0NpdXZPa0JkK0RJbzdkTmlsaVZTbnErcTNT?=
 =?utf-8?B?YlV3UDBjT2lFMkVkdEFkcS9ZZGg3U3VwTUdrTTg3bDBuYysrZHFxRGFoTzVN?=
 =?utf-8?B?WmJleHdkaXFZNndnb3NyOUk5cjZORytSYTFRWVZPUmNHeDBjdWhqWHNJV29m?=
 =?utf-8?B?U3o0TytHdGJvQmcrZWQrT25xVnJxbU9QdnhKQTVSWDN3Mis5VHl4U2ltblZY?=
 =?utf-8?B?d2YrNmdwcmpsZWU5ZE1RQnVNSDJMK1BxcE01V0lpTGNUc0YzdS8zSkkvZTJL?=
 =?utf-8?B?YUdOZjZTM2tMT2tBdVo1dkRtV3NvYitlTXBOdEZBazk1eHFsVWVWWXNNS3Bv?=
 =?utf-8?B?dFpIRjgxQTMzTjR4U2ZxUmJlbTYxQkxXTk9KU0MzSmhPY0gyM2VoMVQxTElV?=
 =?utf-8?Q?jeEmNT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3pQOXUvQTYzVnA4c2RxZjRNMStkR3AwczJHVS9YR1NlbVFXMWJuZDh1dEdI?=
 =?utf-8?B?QkF2bS9CeDVpMDRXK2c2OVZtdDAwWm9lTEhFbzN4Wi93SG5FSlNqbS9sSC9X?=
 =?utf-8?B?citleTBJSTFLOUc1bktzekNQTFdSU0JrbzM4SFVnTm9abWZyczBPYXl6UUFq?=
 =?utf-8?B?dVptbnRJMnZCUjhSNGhzWTJNSEMwN3pYdmRESUZvR1JaWXdzQ2tLSkRHSllI?=
 =?utf-8?B?VVpJR2hMdS83cnBLU2ZvaVgrVFl1TnlONjk1K2NUSjVubmZPS1pWK3RuY3FT?=
 =?utf-8?B?K3VDUlRNdzkzTmNFVStaVEZjR0YvQ29hUVI3ZTQrRWdJNWxlaUpyMDA0TVJx?=
 =?utf-8?B?Y1dJWTh5Rk9PT0VJV3BmdDFPNG9hWkQ4Y1E0aGp5TmdaM2tqbWhDRkhVckZu?=
 =?utf-8?B?dzFTdGZHWGNwak1NUnFrbjFVRTR1Mk80Q3FRTVltT1k4V2Nua0s4NHNjZ1VJ?=
 =?utf-8?B?K1RmNWpUQllGSzBpVjNqVlF3UGV5K2o5aVA4MHZibkxwb1d6bmdHTXpPRzQ0?=
 =?utf-8?B?ZEh1a1hIQWZhSWZnRy90VXRJTzM3UmNOZ1FKZCs5c1BSNGgwYUtCWHlZcUJF?=
 =?utf-8?B?L0lYakhJZ3YreGNQSk9od1NodEM0elI0MHFjUVg2NWhGd0pBVTRrZHdGcHFu?=
 =?utf-8?B?YzRyUHpCSWQvVHJ3K21nNnRmbWJFQ053OVV2SEZ2VnkvazhUS0lZVGtDWEw3?=
 =?utf-8?B?b2N6bDgvcFBwRi9lRXhtQ1lJaHV5SzVBL0xNdThTWnd3bHpUQWJlK0NHNWpR?=
 =?utf-8?B?WEVBQ1IrcTRVTEt3T3d1M1VpTzVhOXQrUGFMTENCdEMrSmNFYjlGMWhVZi9B?=
 =?utf-8?B?VWphTXl5WWo3cmxRbmZXN25pbjdxQlBPVnFva21MWHFUT1RFM3JRNks5YVVp?=
 =?utf-8?B?NlY3MFIwcmRMSFpTcmJuUXN1U0lvTlNUY29GNGxJUFBnL0FDMlR6aGh2cW1B?=
 =?utf-8?B?aHp6RDBDUVBNaTl2VEFBc1FqWmt1d1pkc2M2QXYwY1dYYkkvY00rbGRCYmtD?=
 =?utf-8?B?bFk0U000Yy96TTk0cWUzdmhSSE16UGdjS3RHZnR0SDQxSlFpTWlma29RWDlt?=
 =?utf-8?B?NXkwWTVmM2QxVmZMYXRlS1pPclQ5K1lZYUtQOTEybzVjaWJPSEcyM2M1RTRr?=
 =?utf-8?B?cENXajNxSzlCUHRYYWFmNjdvT3E4OXQ3YzZkZ0hzUnBreUV4ck50d0t0Y3Fw?=
 =?utf-8?B?TGhXTU8rZ3hHSlR3V1FTQnJidzZvK3JKVXgzQVZxNSttM1I3TjROcUkva3I3?=
 =?utf-8?B?amtjemdvcG5pSTNaUm0xc3NIcEVDNm1uYVYwMkMwN01LblpyMkVUSjJIMjY1?=
 =?utf-8?B?MldQQnN0WlhBMHRKbXkvNW5uWmpGUUY0UXE3UURNd2dXeU16V1N5Qm9uUnZs?=
 =?utf-8?B?UTdUZ2lzK0htTDQrR3FaOUpKQWJTYW05Y3Jib3IwTnc2RTU0WkM3Ni95WEdi?=
 =?utf-8?B?UkwwWE5uUncvQUh2ZHl1TDVETHdod0xsK2EzeElBd0Z6YmtNbjZTRUJ0T2VJ?=
 =?utf-8?B?MTZ0ZzFhZ1JzT0UvL3J1UHFDbTFyZ2tFVktJK1ZoekRpTmJvRjVleEdFRjhT?=
 =?utf-8?B?QTlKRE4yaWdESkVIREJyM251cUhZZHFZTHpnQlRhK2NsalJzVmp0SzJWQXlC?=
 =?utf-8?B?ZzJnV01rRTY1VTZ0eXlPZWRTUk52VnBWbEZqUXdjajA3bDhJU1djeGpnMTVo?=
 =?utf-8?B?ZDlXd1JGa0g2Nk1lS3BVU2Z4TkdvQjhuWmdUaFRHMzhrQVhjcXRvalhoMEtL?=
 =?utf-8?B?SWlqVG9ZSUNsVXRveHA0aFhxMllGcS9Cc2FmdnFCMjAwRjZwaW5TTXZQa2x5?=
 =?utf-8?B?SnFzb1lOOWhkaC9vVmZLclNRR1NKaldOblF5WUNLcVcxcmRDM2gxaUhpanVt?=
 =?utf-8?B?akVyaUFyWnJqalU2SHNzQ2NWVExUeVBhRGg5Z1NRMThDS3BCdGVXenl0MG9J?=
 =?utf-8?B?TTl3MTNoZmhXOGN2ZjNOUW5kSTJ3UkR5TlFsREVsUVdVeEloaG8vS29Wdk5U?=
 =?utf-8?B?VDlvWjljRDZvSlgyVURCRmV2MHk1Sk4xNWZpRVdmeUxaSVNkZEZ1SnlvTlVq?=
 =?utf-8?B?NDBnbHhQWlFxUWtZNzdmQ1BXZU5LZUd6K3p0eXljeks5UVkwbjVNdGpYOGZF?=
 =?utf-8?B?S1ozZmd0M0IzMW5iZ1lyKyttR25GbHZVVTUrVnNuYzFjR1JZVHIwSVI5Z29r?=
 =?utf-8?B?aUQ5cENqN3BSS1pGbVdLNUFaclFXbDh0YU9CeW9ITC9GMEJnOHowUis5RkhJ?=
 =?utf-8?B?SklRSjYxc0RIWkVLNzVsbUVITHF0bUZRamZIdVBudEtBVDRwSDY0MzM4dWRp?=
 =?utf-8?B?b0w3QUptaGdXallKVjAxeHUzcTNEbTlRSUJEYnd3ck1zdTJrR2FPajhOanlh?=
 =?utf-8?Q?T0KiFLa9DUXn19s4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 035f0f44-8e26-4ba2-55d0-08de7014182e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 00:07:54.2171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CdXo1zfoFvbdI9pZ5h8bc14jnF4bEgD2Jq6NGyQVP6+3kaXN71duZQfge7bjwxv9OUQwkuMKS8dmRetse7f6zwzXGHwOtMeRrJ1VYkkscN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFCAADA7A6C
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

On Thu, Feb 19, 2026 at 12:43:19PM -0800, Harish Chegondi wrote:
> On Wed, Feb 11, 2026 at 05:57:30AM +0000, Patchwork wrote:
> > Patch Details
> > 
> > Series:  series starting with [1/3] drm/xe/xe2hpg: Remove SRIOV VF check for
> >          Wa_18041344222
> > URL:     https://patchwork.freedesktop.org/series/161462/
> > State:   failure
> > Details: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161462v1/index.html
> > 
> > CI Bug Log - changes from xe-4541-8ef710cfb81579fbf4107d77134e6e8d2c864ef0_FULL
> > -> xe-pw-161462v1_FULL
> > 
> > Summary
> > 
> > FAILURE
> > 
> > Serious unknown changes coming with xe-pw-161462v1_FULL absolutely need to be
> > verified manually.
> > 
> > If you think the reported changes have nothing to do with the changes
> > introduced in xe-pw-161462v1_FULL, please notify your bug team
> > (I915-ci-infra@lists.freedesktop.org) to allow them
> > to document this new failure mode, which will reduce false positives in CI.
> > 
> > Participating hosts (2 -> 2)
> > 
> > No changes in participating hosts
> > 
> > Possible new issues
> > 
> > Here are the unknown changes that may have been introduced in
> > xe-pw-161462v1_FULL:
> > 
> > IGT changes
> > 
> > Possible regressions
> > 
> >   • igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode:
> >       □ shard-bmg: PASS -> ABORT
> 
> I have verified that the above test failure is unrelated to this patch
> series.

Applied to drm-xe-next.  Thanks for the patches.


Matt

> 
> -Harish.
> > 
> > Known issues
> > 
> > Here are the changes found in xe-pw-161462v1_FULL that come from known issues:
> > 
> > IGT changes
> > 
> > Issues hit
> > 
> >   • igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2370)
> >   • igt@kms_big_fb@4-tiled-16bpp-rotate-270:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2327) +2 other tests skip
> >   • igt@kms_big_fb@y-tiled-32bpp-rotate-0:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +4 other tests skip
> >   • igt@kms_big_fb@yf-tiled-addfb:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2328)
> >   • igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2314 / Intel XE#2894)
> >   • igt@kms_bw@linear-tiling-2-displays-3840x2160p:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#367)
> >   • igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2652 / Intel XE#787) +12 other
> >         tests skip
> >   • igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +4 other tests skip
> >   • igt@kms_chamelium_color@degamma:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2325) +1 other test skip
> >   • igt@kms_chamelium_hpd@vga-hpd:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +3 other tests skip
> >   • igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-hdmi-a-3:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#6969) +1 other test skip
> >   • igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-hdmi-a-3:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#6969 / Intel XE#7006)
> >   • igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
> > 
> >       □ shard-bmg: NOTRUN -> FAIL (Intel XE#3304) +2 other tests fail
> >   • igt@kms_content_protection@suspend-resume:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#6705)
> >   • igt@kms_content_protection@uevent-hdcp14:
> > 
> >       □ shard-bmg: NOTRUN -> FAIL (Intel XE#6707) +1 other test fail
> >   • igt@kms_cursor_crc@cursor-onscreen-64x21:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2320) +1 other test skip
> >   • igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> > 
> >       □ shard-bmg: PASS -> SKIP (Intel XE#2291) +6 other tests skip
> >   • igt@kms_dsc@dsc-with-output-formats:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2244)
> >   • igt@kms_fbcon_fbt@fbc-suspend:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#4156)
> >   • igt@kms_fbcon_fbt@psr:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#776)
> >   • igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
> > 
> >       □ shard-bmg: PASS -> SKIP (Intel XE#2316) +4 other tests skip
> >   • igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7178) +3 other tests skip
> >   • igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +6 other tests skip
> >   • igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7061)
> >   • igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2312) +4 other tests skip
> >   • igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#4141) +5 other tests skip
> >   • igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +17 other tests skip
> >   • igt@kms_hdr@static-swap:
> > 
> >       □ shard-bmg: PASS -> SKIP (Intel XE#1503)
> >   • igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#4090)
> >   • igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7111 / Intel XE#7130) +1 other test
> >         skip
> >   • igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7111 / Intel XE#7130 / Intel XE#
> >         7131)
> >   • igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7131)
> >   • igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7111 / Intel XE#7131)
> >   • igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-0:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7130) +8 other tests skip
> >   • igt@kms_plane_multiple@2x-tiling-none:
> > 
> >       □ shard-bmg: PASS -> SKIP (Intel XE#4596)
> >   • igt@kms_plane_multiple@2x-tiling-y:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#5021)
> >   • igt@kms_pm_backlight@bad-brightness:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#870)
> >   • igt@kms_pm_dc@dc6-psr:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2392)
> >   • igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#1489) +2 other
> >         tests skip
> >   • igt@kms_psr@fbc-psr2-cursor-plane-move:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2234 / Intel XE#
> >         2850) +5 other tests skip
> >   • igt@kms_setmode@clone-exclusive-crtc:
> > 
> >       □ shard-bmg: PASS -> SKIP (Intel XE#1435) +1 other test skip
> >   • igt@kms_sharpness_filter@filter-scaler-downscale:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#6503)
> >   • igt@kms_vrr@negative-basic:
> > 
> >       □ shard-bmg: PASS -> SKIP (Intel XE#1499)
> >   • igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
> > 
> >       □ shard-lnl: PASS -> FAIL (Intel XE#2142) +1 other test fail
> >   • igt@xe_eudebug@basic-vms:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#4837) +3 other tests skip
> >   • igt@xe_eudebug_online@pagefault-one-of-many:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#6665)
> >   • igt@xe_eudebug_online@resume-one:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#4837 / Intel XE#6665) +1 other test
> >         skip
> >   • igt@xe_evict@evict-beng-mixed-many-threads-small:
> > 
> >       □ shard-bmg: PASS -> INCOMPLETE (Intel XE#6321)
> >   • igt@xe_exec_basic@multigpu-once-null-rebind:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2322) +3 other tests skip
> >   • igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7136) +4 other tests skip
> >   • igt@xe_exec_multi_queue@max-queues-preempt-mode-basic:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#6874) +14 other tests skip
> >   • igt@xe_exec_system_allocator@once-large-mmap-huge:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#4943) +9 other tests skip
> >   • igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#7138) +4 other tests skip
> >   • igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#6281)
> >   • igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2229)
> >   • igt@xe_multigpu_svm@mgpu-coherency-fail-basic:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#6964) +1 other test skip
> >   • igt@xe_pm@s4-d3cold-basic-exec:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#2284)
> >   • igt@xe_pmu@engine-activity-accuracy-90:
> > 
> >       □ shard-lnl: PASS -> FAIL (Intel XE#7072) +2 other tests fail
> >   • igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#4733)
> >   • igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
> > 
> >       □ shard-bmg: NOTRUN -> SKIP (Intel XE#944) +1 other test skip
> > 
> > Possible fixes
> > 
> >   • igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> > 
> >       □ shard-bmg: SKIP (Intel XE#2314 / Intel XE#2894) -> PASS
> >   • igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> > 
> >       □ shard-bmg: SKIP (Intel XE#2291) -> PASS +3 other tests pass
> >   • igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
> > 
> >       □ shard-bmg: DMESG-FAIL (Intel XE#1727) -> PASS
> >   • igt@kms_feature_discovery@display-2x:
> > 
> >       □ shard-bmg: SKIP (Intel XE#2373) -> PASS
> >   • igt@kms_flip@2x-nonexisting-fb:
> > 
> >       □ shard-bmg: SKIP (Intel XE#2316) -> PASS +10 other tests pass
> >   • igt@kms_hdr@invalid-hdr:
> > 
> >       □ shard-bmg: SKIP (Intel XE#1503) -> PASS
> >   • igt@kms_joiner@invalid-modeset-force-big-joiner:
> > 
> >       □ shard-bmg: SKIP (Intel XE#7086) -> PASS +1 other test pass
> >   • igt@kms_setmode@basic@pipe-b-edp-1:
> > 
> >       □ shard-lnl: FAIL (Intel XE#6361) -> PASS +2 other tests pass
> >   • igt@xe_evict@evict-mixed-many-threads-small:
> > 
> >       □ shard-bmg: INCOMPLETE (Intel XE#6321) -> PASS
> >   • igt@xe_module_load@load:
> > 
> >       □ shard-bmg: (PASS, PASS, PASS, PASS, PASS, SKIP, PASS, PASS, PASS, PASS,
> >         PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
> >         PASS, PASS, PASS) (Intel XE#2457) -> (PASS, PASS, PASS, PASS, PASS,
> >         PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
> >         PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS)
> > 
> > Warnings
> > 
> >   • igt@kms_content_protection@lic-type-0-hdcp14:
> > 
> >       □ shard-bmg: SKIP (Intel XE#7194) -> FAIL (Intel XE#3304)
> >   • igt@kms_content_protection@srm:
> > 
> >       □ shard-bmg: FAIL (Intel XE#1178 / Intel XE#3304) -> SKIP (Intel XE#2341)
> >   • igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
> > 
> >       □ shard-bmg: SKIP (Intel XE#2311) -> SKIP (Intel XE#2312) +12 other tests
> >         skip
> >   • igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
> > 
> >       □ shard-bmg: SKIP (Intel XE#4141) -> SKIP (Intel XE#2312) +3 other tests
> >         skip
> >   • igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
> > 
> >       □ shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#4141) +5 other tests
> >         skip
> >   • igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
> > 
> >       □ shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2311) +9 other tests
> >         skip
> >   • igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
> > 
> >       □ shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2313) +10 other tests
> >         skip
> >   • igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
> > 
> >       □ shard-bmg: SKIP (Intel XE#2313) -> SKIP (Intel XE#2312) +14 other tests
> >         skip
> >   • igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> > 
> >       □ shard-bmg: SKIP (Intel XE#2426) -> SKIP (Intel XE#2509)
> >   • igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
> > 
> >       □ shard-bmg: ABORT (Intel XE#5466) -> ABORT (Intel XE#5466 / Intel XE#
> >         6652)
> > 
> > Build changes
> > 
> >   • Linux: xe-4541-8ef710cfb81579fbf4107d77134e6e8d2c864ef0 -> xe-pw-161462v1
> > 
> > IGT_8746: 8746
> > xe-4541-8ef710cfb81579fbf4107d77134e6e8d2c864ef0:
> > 8ef710cfb81579fbf4107d77134e6e8d2c864ef0
> > xe-pw-161462v1: 161462v1
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
