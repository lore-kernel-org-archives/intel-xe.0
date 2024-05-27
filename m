Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CAAC25B7C
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 07:33:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7773710E0DA;
	Mon, 27 May 2024 07:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L+DzO5H4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B98310E0DA
 for <intel-xe@lists.freedesktop.org>; Mon, 27 May 2024 07:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716795210; x=1748331210;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RZDDRR+os5yit2WcMO6EB/NI1IzMqwCV8cTUFP0rH7c=;
 b=L+DzO5H4jMtbUO/JP8WVgOrJ007HcVCCS4+RoKx1T0Pzm4R+EvD9TMht
 T450+gQU13gNX9o+s0n6s38gwFl9XDmVeXiUCH+HAD4A8HdsFTLK/IEj9
 i3AAxOnBZBeHsHxVy/Xz7zNKebuey4sxKMe7H77zYB56zz7B2cFAS/KkQ
 NwNJfaw0sLCE+jwhJIVLudyMhVMNSov2FEh/vXFfRfFndg34ZrjGVm6wQ
 7xinxkcmf958rlZOZNZbSrwToEhX8eqhL+rDc7hHpoApAiSbN+OkFZG4e
 JajS5JTNbqiDl46Id/VgBtdrIp0bj+nRjy77tRRM6/krWz6M9vxp+r+Yz Q==;
X-CSE-ConnectionGUID: M3Zf12e6RI+/oLbbmHF1vg==
X-CSE-MsgGUID: lyaxCAfqTAKKbfpvThsr4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="12965249"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="12965249"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 00:33:24 -0700
X-CSE-ConnectionGUID: um2LwMZWQuir+ONmCXWVEg==
X-CSE-MsgGUID: /FMapUtXTLmT7WYMk7W5cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="34755643"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 May 2024 00:33:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 27 May 2024 00:33:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 27 May 2024 00:33:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 27 May 2024 00:33:23 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 27 May 2024 00:33:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSCTXPFx68Ftxh0UarNtagU5d6ibzZ08+rKUdEJTr6dY9ZfuFh8W1gG8yFEDa41ikqCnhQDsMLAo/Y9Ay94IOWP3IYgxJQuLWnZqeFt7mrZB/heNJtXcsS3Sgiw+AV0WMM6TSL2e94iAF57SuDFugS0/QVL8Fojol9nZrXyAnsW693QiEaM4PUqPVw1AyhHFg73q7Iz1yyI7dqpJJUaQyvD8A23VGVKkrauQua2W0duzEwazaofwcvfYavqHwJSdTo6QGlukgHGqRo0rJPPkfWgaUHgLFqOsmSPqPH1vuhOdGNRWnkjfJhLC4Ie/CYjSuK3JhoxwONyyRNg4A2EfMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEfcH4kTAgufjSf72NiubSAzVY6gxK3EDDQpMIcNroA=;
 b=XrwRZjNpIgnke4Ju2JpUeZFdpgZRGZ/oeem5T8/OXUEo1nakPJVBmwPFYMTGJrBJveKia/joRUq67nogq6jyQ2Kh3w8Sixd/vglqNyQ68QxyYaHxxbuPm38qs2P0cB6wX7ci1X5emHeWO05enZwrW/Yb69GYbrArUI05qqxGc0PZssTcvsEaVcKZVlaniVX1VB/kKiYoJGpDRQT78+KPiqyPvXDjOWZW2uJBguKNomVyhEXyLnaW1q710FLYOHIH/AKicMtkSjS5GHSV544DKgrj+zzWSBG2BftTtynzOEs938bIGgwok/m0Ur4eYB58VUF0fWrfKM/Fh9XE1NXgDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB6623.namprd11.prod.outlook.com (2603:10b6:a03:479::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Mon, 27 May
 2024 07:33:20 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%4]) with mapi id 15.20.7611.016; Mon, 27 May 2024
 07:33:20 +0000
Date: Mon, 27 May 2024 09:33:17 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/vf: Read VF configuration prior to GGTT
 initialization
Message-ID: <qmzw6owddaanlsq7pbf4t24n7lefrcltooudrn2fk265qgmq2w@apzynnivpdja>
References: <20240524113714.932-1-michal.wajdeczko@intel.com>
 <20240524113714.932-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240524113714.932-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI1P293CA0018.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::12) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB6623:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b8c3cea-abd5-415f-c34e-08dc7e1f4817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005|27256008;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VCtETmxGcjRsMjU5SC9TZWk2dFByTXFiN0tqSXBjZGFLVERHOFZDT0grY0tk?=
 =?utf-8?B?RzlsMnNzUDFnclQzZlNWbUo3NnlvZnV4N1pUTVUwbWpKdTRROGJVV2wvdkJH?=
 =?utf-8?B?MGpvZ3BxWWgvMnphZkVqODE5Nm10c3pSL1VZd2FCb3F4a3F1RldNTkNHQkhE?=
 =?utf-8?B?YWp6TTg5OW1PQ014cVQ2UGpkT24vN1NXTGZuUGJWaVE2bERWYlJtT1FWelJ0?=
 =?utf-8?B?UkYwTzIydjNBTWp1UTlrU3ZrSU5YOWhRVCtuc1BWQnoxVjNxb096NUxBYk43?=
 =?utf-8?B?Y3ZZMHI4bWt5UTNnUHNxTUkwS3d6Sk1tL1Z5UFFvbjVYVUZTRWdrWDl2cjNR?=
 =?utf-8?B?bjdQRkV4NEU4ZVlZL3pDQ1B1TEErNmRLZnFZNTkvcGxoNnExMnJvMjBkN2hK?=
 =?utf-8?B?NnhrSXB3cHFLMVZWWHBUd2VDVHI4RFBocnNjREIwcmZab3U1N1h4dzdtMlBY?=
 =?utf-8?B?MG82aFNOVWZFUU5vQUNkZkZDSSt5U3FwZWhuTzlEU3QvdGRvQmlyL0Y0dXhQ?=
 =?utf-8?B?M3V0MkhFRkhtL2FSYTBNM2VrQVBhTjlneXdweHFTakVRTmYrTEh4aXpZSHRv?=
 =?utf-8?B?TGNrSzFSR21mc3VRcGN1YktLd1JaWWNBcWdrL0NZby9Uajc5a2YrWjc5V01Z?=
 =?utf-8?B?dW5HWitLTWZsTExuTnFGL0hFQTVJbE15eWxlY2VJQUJRaVd6dHhVclE3cEZl?=
 =?utf-8?B?WXQ5aGMxTkRIckRTZ2grb1Y1WG5qSGlrbzNkNHhqWkdNb3hoUjFMMkpGMlJQ?=
 =?utf-8?B?dW1pOUpnRFRrNjJYZjE5Y0ZCc2xJMTRFUytVVjB3dkxWYXZWUHpPdEdxZHNO?=
 =?utf-8?B?UU9lSXpSVVZyQnNLQldKTFR1SGpMQjJMZi80L3ZvRHBnby9EVHRYZGVzejBy?=
 =?utf-8?B?MkZzVEYrR2gyL0JVU0tOYlZ2UzBoNHhQVWs0QVN1RGxpd09BM25RamU5YWRE?=
 =?utf-8?B?ckNWcTd1VEpOdnNIWENDRDczMFB5RTZHSkExV01GSU8vZzNpa0xXcWtlb1dr?=
 =?utf-8?B?ZkE2WkYzMlAyaEpSTkxFNUhjSWJ4M2ltVjlvUTVEbnRyWWNSL3lHcjBhQ0pt?=
 =?utf-8?B?WlcwZC9ndTlhYTNGZVUzSFZxcHJSdXpLY1N2aG5UL1pvU2o4REMxQ0NUeUVn?=
 =?utf-8?B?MGQ1b0RWaURReFlHNmwxN0ZVTUw4dUNubDhjVWhsZ1d2V2s3NHJjdUZMYWtq?=
 =?utf-8?B?WVU5eGM0V29DOWptOE9RT043aHZuMGFDektJYjIxQUYvT2FMT2VVYnRIdlZV?=
 =?utf-8?B?YnpPNUhuK2xMaDAyMGY0aWhEcnd1Ni9XNWs4RFhKME1hRUZnUHpkNmRJa0M5?=
 =?utf-8?B?WlRPdTdFbCs3TE9QY0pJRzVaMUhhRDJwMGJVaE1zeU00ZE9LR0l3dXRVQ0pV?=
 =?utf-8?B?Ymg3SzNHSWZrdG0ybWtpZW52Qmk0bTRtME1GUkxvQ2dqeTlaMHR4N0hJcVlD?=
 =?utf-8?B?MmZKTWtKeDNmTVNncEl3czRDSlRhanp6NEw0d3pERXp5WHlqZGlwWEMxL2xP?=
 =?utf-8?B?dDFiMTZONStGUk1YVW5RYWVKOVA5TkpuWW52eHhBUi83djVMMC9lcnJISEZB?=
 =?utf-8?B?eHFxSHFMTUd4US9nTGUvVE1ILzFaSEd2SHdCUUlxbTExaVlYRnliaVI5bjE0?=
 =?utf-8?B?emJoYUZUdS93bXFXZmR2U0dXa3g3eUc2SWczbW9Idkp2NTB1YXdRWk1tRCts?=
 =?utf-8?B?SVR6dWNnZDNXUzNIU3M2US85MGRhVXlzQkQzSzNtT25BTzVJbm9wTnVEVEJv?=
 =?utf-8?B?dm1GSjYwRjhXL1QweUhsMWFaQlliaEY4Y1lyRitSUEdUUklQSVNJNGN4ajcr?=
 =?utf-8?B?aDI5bm4reUxZS2t4Z2lQQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(27256008); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aW5SYy9laUdOV2NIZ24wcTlDbWxUczBwWHhwZ00zWTBWbzg1b2krMUZoRFBp?=
 =?utf-8?B?eE8yQWVxN3Y0OUNEYkk5LzNoS04vTmpWbjRvSWcvKzFuaUh6WXdaQWVXeFFp?=
 =?utf-8?B?OVh5dU9CRkM2TnJmUHZzcGE5SEp5MGFaMERYZjNJcTRSTHFJcTdlc3pLN0M0?=
 =?utf-8?B?dDR6RnYrazhtUEZ2WUVCV2R2dk9GOUZxaVJRMGFkTEZDZTd5bWI4VDJKaVUx?=
 =?utf-8?B?Qk8yOHVjSnBmNnZGTDRPUExJMXFDb0FwaC9LcGM3ZDBOS1lYSlNXRDNvY3Zt?=
 =?utf-8?B?Z2k2SVB5Z2V2cTl1RHV0U2NRalFCK3VPUWcyZWZiRXhMUTVjRU94T2drb2x6?=
 =?utf-8?B?OUxZQm5nK09KU08rS1BvRzB5U0RzeDZQR2tjRDVTVm9XazJNVGdCK3RTREpZ?=
 =?utf-8?B?SXN1dXpuVjZVREh6NU10UFpJOG1rS0xFeFV6QWFyQStXNk1XMVdZRlA2RTNT?=
 =?utf-8?B?UlNkUmhpcWdPQ0o2dmNTM1FNeWxNNFlIRmRYTG1xUUd4WThIbFUyak8wcjFl?=
 =?utf-8?B?RkpmdDZYdGFDS0VpUDZSNVNuclhRcEpZWjVseGlsYWcvbzBrZFdDTTdjczVM?=
 =?utf-8?B?cmt0R29YSW5QQWxjTWMydHJjUWNlc1ZnY05WTlZKN2czZ3ByamhadkNJKzBo?=
 =?utf-8?B?cndCSFNmR1VkdVM2VWNjeTBaRDQ2MEV0clIyV1B0TWJ6WEtSYWEzczJYOTVI?=
 =?utf-8?B?Mk5MWk12dkpiVWgwQkN0aitmYU5xaUlpUTMrZmhoVDMrdEJvS0ZXd1FyY2E3?=
 =?utf-8?B?UVhUdTRJcGlDNUJpdGFhbU1TQW43cHNRUk1MTVlpeElvSHJYQlhiNTJTWWM1?=
 =?utf-8?B?T0ZsZXdCTGZTY3pQbkVzS2d5WTZJWEtZUkl0djU4U3BKWWFXTjdISXNRdlVT?=
 =?utf-8?B?cFpCdVNYZklMei9ZMndrM3RwQVg3bDgxQ3puZzNYdXlUc2lCZmZPQlJ2T3Y2?=
 =?utf-8?B?c2pabnFFeGlSd0VQM3U4YktwMlNiaCsyR2NpVlVzaXJWQnRXTDk4ZUx3TU1Q?=
 =?utf-8?B?ZW92RFl1Skx5RStoUFJLMUxxb2pZSCtTZ0VXZWtVakw3SUExMW1SV1ViNk1R?=
 =?utf-8?B?T05xWFIyM0RpYWIyWVNVWWhmbXgvTkFVQVBaR1RlRDhzdDAwbmNYc0lrTS81?=
 =?utf-8?B?VnpNYThJbE5iT2hBU1RxdHJOU09JdzAwaVNnNEhnZlZ5bGErelFyTXphbFpl?=
 =?utf-8?B?K3Q4bnRQZFFQd2x1R1pCMUIxbThaNXVhVG5YZUoxeVZOamU0L3ZPbGhDQUZN?=
 =?utf-8?B?c1hiU1JqdzVxMTBPUHFwUTJBemdLTjU2VTNNcGJCZkVoaTl5ZTF0d0JrS1dL?=
 =?utf-8?B?TXZ5WXBJSHhveHRBaVA0eUR3cmFDWGZqemFWakk2UnVFUUNTazdNZDFKVTN0?=
 =?utf-8?B?KzZOYWFCL0c1QTQzUFNCVHI3aE16NVRKc0gzM1Q1Vm83MVZlYXhka01qbWZN?=
 =?utf-8?B?ZDYxL3c5Zys4Q0VoVFp0bUlmY0dFaFY1U05lMUk3QTJjV1lvbm1SZzJqTnFG?=
 =?utf-8?B?MVFwTndNNkFOdjExNUVkQk1NeU12OTdXUXNJRDFlemF1eEFQT3FGWGdXd0lK?=
 =?utf-8?B?MlpEdEYxR1FZWDV5QUdBMHUvZ0hJS3EwUHR4cHo5dkE0TmJtTllBazd4UkEz?=
 =?utf-8?B?THFseGErMXlhZlpHZTgwZCtvMko4cElEYndZanZkUkszeG9SZkw5TlJRbEo3?=
 =?utf-8?B?UXdTMys1a294QkxtOTB5Y2hxVE1OUExzUEtJdElMZFJuV2RFZ1grNElQcWI5?=
 =?utf-8?B?NHhxYStpM0E0MjQyZ0dmRkxOVmlDWHJmVi9EY3ZYVXZtTXRDZWxLdkdWVXd4?=
 =?utf-8?B?MVhPdFVEeSt2T3dvbmNOK28xS0xrbmFZV0pUVnQ2REV3OUJDV1pBZmxlcGdI?=
 =?utf-8?B?anRnK2xERmxvdUswRHQ1bjNDS3ZjZHc1Z2dVaUFydHFEd3ZIWldaY1J2YS9M?=
 =?utf-8?B?V3Zkb29ITFREY1dURHlOMVhkNGpjdlR1UG9HeGhGc2QzT3RQYldsQzN2N3RG?=
 =?utf-8?B?SlE1NUJEajdqTzQ4dUFDR0FjcTBUakdPTWgwTm5rZjhPQmJacVZGcHUvQktP?=
 =?utf-8?B?Q0tIeVNURS9yNXBBalF2blpZNFNkc0FoWktRWEgvOG13SmVOemRnSlZ6d2Q0?=
 =?utf-8?B?OGt0ZllEZlVINS84MHR6emhScWIyNGZaa09VVCtEK0RCMDNoNTN3dzk0VHpU?=
 =?utf-8?B?YXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8c3cea-abd5-415f-c34e-08dc7e1f4817
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2024 07:33:20.0788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RG7NvDAVvlHaTbU6wIlOCc7jpC3k7KLFhvdQJyHQiiAJSVlhbS0fgj7k25FceNb1jw/GZVaeFrEdyPok+PT/Hg6v2nBt+GQnzOvGFoNSRvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6623
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

On Fri, May 24, 2024 at 01:37:13PM +0200, Michal Wajdeczko wrote:
> Each VF will be assigned with only a limited range of the GGTT
> address space. Make sure that VF driver will read its own GGTT
> configuration before starting any GGTT initialization.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

-Michał

> ---
>  drivers/gpu/drm/xe/xe_device.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 5acf2c92789f..f04b11e45c2d 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -35,6 +35,8 @@
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_printk.h"
> +#include "xe_gt_sriov_vf.h"
> +#include "xe_guc.h"
>  #include "xe_hwmon.h"
>  #include "xe_irq.h"
>  #include "xe_memirq.h"
> @@ -569,6 +571,15 @@ int xe_device_probe(struct xe_device *xe)
>  	}
>  
>  	for_each_tile(tile, xe, id) {
> +		if (IS_SRIOV_VF(xe)) {
> +			xe_guc_comm_init_early(&tile->primary_gt->uc.guc);
> +			err = xe_gt_sriov_vf_bootstrap(tile->primary_gt);
> +			if (err)
> +				return err;
> +			err = xe_gt_sriov_vf_query_config(tile->primary_gt);
> +			if (err)
> +				return err;
> +		}
>  		err = xe_ggtt_init_early(tile->mem.ggtt);
>  		if (err)
>  			return err;
> -- 
> 2.43.0
> 
