Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47D7CCF9E9
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 13:59:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740B310E1FF;
	Wed, 29 Oct 2025 13:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VUCvAWuh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2E510E1FF
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 13:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761746362; x=1793282362;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IT5oDk/V7woKFbq63Cu92urdtKccIjvBjl4RJr9TRTs=;
 b=VUCvAWuhB9ibHpXGlUWKHiALDybnFPisxWoLPGRWwoGAhyMpVE8KtV7P
 EA0C6Nd4PVxcilT43obbvYx8+bpNxGwHRWiddJYjh25WMXNCuVh0W2CtU
 dsbAAWS0+NU8cJ/8TQ8NXvRG86J1Wk/6/L+BgluYkHv7P4+lLipx6AiI5
 HpeV2x2hjUDc+iNtDEzyocdKYwnycDcVHM9klIP+U2iGkaC/wjVa8ZLO8
 ug1zVAFGG6XjNnngtSlaY9YzhYFplBsw2MJnJAYg9jjqRcGEkqCdQ3xbZ
 rCYmHXrqTxkODJnKIRVXerJCV0P/p1V9PW7MLvyv0AUQ2pLyRuMS+oxDv w==;
X-CSE-ConnectionGUID: BcWMyOEHQ4OaDRAo4+jBYg==
X-CSE-MsgGUID: rIRdnwhCSXuNcZ3w+QvSWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="62893335"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="62893335"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 06:59:22 -0700
X-CSE-ConnectionGUID: B3hozMyQSEeDrtoAwk6xKQ==
X-CSE-MsgGUID: AArAh8/rRJyynr2O1w4cow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="186128644"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 06:59:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 06:59:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 06:59:21 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 06:59:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8pDSQ9C3GvRq7NbcWINbKqnz0A6qhAwl4SZoZtO2D5aV0u1d+WTahABvXISMryU2SoiUuZg8g7ja/nuztUQZXfAfQjpnwJ5ddFyKXYRfMIGc71NEDopANeDv3CCF+/HSiYGQVDiPAFq/8NxclcJVLdOCrQR4JkRUZiXVa9ePX406gn0lz4QqO/rD5cjzRRZGkZb8En7zZ345lCEGOZIhS2ySDxFDIcyT0XQYtmdHMTy+x5lky9YgSsCHfS8zJa4vF4l8jpWgutycO7HfOduiMJkM2AOWT2bjjww9U27UfqiBS4PhXMazF2Ds+s4ZDY9esxgQ9oFvHVgLoBRAAojPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzmpvrqlMlaPgwPZIHVrwW8ak7V++A/sDh9/zb9/h9Q=;
 b=T0sf4TYMenl6FIS31Kvzx8PQP/Lus5sSBs3Lw7Y7dXuhVWwiPsGJdgw49ISSoXQtrAmZyBxmt3yT6Ms3vUmjL3m0u8LiZyct+YqPsZV2HQVuu8uGnwqLYuDIXPcYuQjtkbI0jpXQx+BrpRzepLmgJ32GGFU7wbXoODgHhvK6oNpjEfYH2CR2TgamyIOVzgA4exYuqdI73glrIR5arjzUPqJe4/e/E/Al01ch+oNs7iS2GKzJD7P+H8LrWsSNLyPMhVqGo1DCNfR71b+xRSuHr3D3wAtS8ny94uF7o4IPldZyD3fKQv0lVPgH097a5/4oUZWuARzI+nUNjEOLhQUrsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH7PR11MB6833.namprd11.prod.outlook.com (2603:10b6:510:1ec::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 13:59:18 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 13:59:17 +0000
Date: Wed, 29 Oct 2025 14:59:15 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 08/17] drm/xe/pf: Add functions to bulk configure
 EQ/PT on GT
Message-ID: <20251029135915.xk6yfxn6cti2fppr@intel.com>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
 <20251028175832.184534-9-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251028175832.184534-9-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DUZPR01CA0184.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::7) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH7PR11MB6833:EE_
X-MS-Office365-Filtering-Correlation-Id: bbfabbcf-a376-4570-2cdd-08de16f359df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmlGVnpjZHhkeDJDMWNRVG5BVTcvWTlyQU9BWEFQZ1hidDB3VmZqaDZnZnpV?=
 =?utf-8?B?VkNIb2RtWDMrYm9PejA2eWFNU29TZ05QakhtOHhQc0FsOG9WMjhOQllXTDl3?=
 =?utf-8?B?Tm1Qb1pvWjg4ZjFzMzVZbmxkVHNtRnB5VmxtdW9EQWZ1Z1AxS21RUVJvbXpK?=
 =?utf-8?B?TERPK0xJL0I3TkZxZnIvc2I4SmZSaUFrbktrSlhTVzAvWmg5eUN0a05uNVYz?=
 =?utf-8?B?NHdrZlE5WldDL01RYzFiRnBEWU0zWWVuY2J6V0Qwang1ZjF1Ry9aRHRzOWZa?=
 =?utf-8?B?RkdRYzZTRjZ3UkpLeUhidUFhMC9wSWtnZ3hlbjc0YXlicEh4YXdWWFlmSllP?=
 =?utf-8?B?SjErYS9JOWJtSTBHRnJWdzlMeVNpRzRQTnBiRWdLWWZib2tydUNJNFZaNnhh?=
 =?utf-8?B?R0VsbWNSY3NVSUtQcjFiWTgxaGpvUkhhNDNyTVVhRGxLTytwU1hPNGRDQkR2?=
 =?utf-8?B?UVNYdkZtY3o4SERzMHNPUm0zTHZ3OWlWdFdKYWw2T2o3VUNBTGNMMmlmYnFn?=
 =?utf-8?B?b1VydE9sQ3BKMVBWWGFqcVgvSXd2ZkRzUU5LTm43VGc1MnhYcnZqaGVUM2pY?=
 =?utf-8?B?WS96ZU1TL3NJUG5tRDBmc0hubXhUMmNpbkpxVFhwazJOMmFERTE3c2JVTjU5?=
 =?utf-8?B?M0VBQ0hWSzhqY3A5My9sbUtBOXlkVFBSUHZFN1JKWkx1eWc3bkIzalRJdHpI?=
 =?utf-8?B?WXhKa2t2ZUhOUzN6Nk9NRVN5Y1hwZmFVWi9sNGlPMVR6R3VkOGkrc2pYalpo?=
 =?utf-8?B?NGY3RDJCclU3bmxFVWNsUmZKMWY5MnY4NDd6STJ1clA0b01pZGRQQ3F3dzBw?=
 =?utf-8?B?Z25uQnRlam00SC9kWVlSYTBJUWFUb0hlc2lQUVNtU0xmcjE5NVBVcE8veTV5?=
 =?utf-8?B?dXo2dG1UQjlQREVmZm1PdUx4cDY1UzNuU1VtVkRGYWttZ1BpSUlzMUxtWEUv?=
 =?utf-8?B?M3I1YXRMWkd4cStPamVhSlhiUXJLcnhQM3lMRnk2OGhoNFlsNmRIMklYRTdp?=
 =?utf-8?B?MDdRRTRmYm51b1loUDk3emRzbFVyODNabm5oenhTc3FYZDNUMDQycjNLdXcz?=
 =?utf-8?B?MzBEcnJFQTV2c0hhR0lxcVZDR3Nrd0lNSnZqckx5OU5VZkdLSUt1WGpuK3Zl?=
 =?utf-8?B?eUpiTkVhdWpZSzJwbmJIUVF3VE9LYnBZM2ZGSG5XRXZYTkJJeEQ4cVNqS3FO?=
 =?utf-8?B?bm5UV2FsUFRhVDlKNnQ2YWsyeGU2NHVzTnkzbWZCbFVVTE9BU21QTGdTUnZy?=
 =?utf-8?B?L2NQWXRpdFIwMW00UWloSFNFdGw2Q05KT05hck4vd05MNDNCZVVicW9jSXJL?=
 =?utf-8?B?UGtEYWZyMXZMWXZlOTFCblpTYXBqSTBUaENLdTJjRHBCR0ZQUld5SkQrd3Rh?=
 =?utf-8?B?bU1rR0lEWUFoMlpBbm5pQVBrZmpXZEtmSnJDQmdicEY0R09VWEYrUGhOaFhQ?=
 =?utf-8?B?ZEY1aFAzZFRXK0xCSjZXeWpyQlRURk9iRURBQ3NoWDJ5ZWRoTEozTmxUcEpm?=
 =?utf-8?B?bmcrRDh4UEUvOVlSNTJDUVlETFFxVmNPNTJNUy9rcUZiSXZQWFQxbGhHcE5F?=
 =?utf-8?B?ZnQ4UWdMOFFoWnhrZVZONDM0Y3RrZ3FRT2hOSVF5ckxaY1BRQWg1VGJXWDNN?=
 =?utf-8?B?Y0FXcGRyZHBiVndQR0laK1lFbkFDRDZmaTVTUGtqQmFqaE1LamlJc2tNUk1E?=
 =?utf-8?B?WFBqUkcyc3BqdFRIc2VqRFZDL1dONU1pWlgvT3JYMHowaDJmK3hPOGxtL1Y3?=
 =?utf-8?B?M2lTYXFMRlZDYjR0Q05kRVpUcU5nVDNVSENRSm9HRTVhcDFuZDlqMDZ2b3JE?=
 =?utf-8?B?UmY1d1VRalpOTFIxSGp6WlA1SjFqUC9DdDJtMTZHMDIvcWIrTDVOcHRITnRp?=
 =?utf-8?B?Ymlpamdpd0dibnU5WVNwSzF0V0VGbm11eXdtVlBjaHZRa3pYWjNaUFpZZUhz?=
 =?utf-8?Q?pZJStV3hd9le2YAYfSFzmCtIM+jDadNp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVJoemROS05LSzAvSzF1bS9UcXFvSCsvVWVTNnAwVTV5TTVqKy95MjdLWll0?=
 =?utf-8?B?ajJGb3ZLT21QajZWcTlkMkpFbHlhcll0SUNMYXlvMVZvaFNjdG1BaXVJaFUx?=
 =?utf-8?B?SnlsZ2lSRVplOFNHQmtJYkEzT2tsUGhFYjFra1ZaOWQ5WkZKOEhuWDVtQmVZ?=
 =?utf-8?B?WjlnRFpFbTdZSTZJVzhpUndCR0VVV1VzMGdRdWtPbHF1UTZPR0piYzJXRHA3?=
 =?utf-8?B?NnlYbjBheHJZZTQyazFXNWY1dG9uSEdhSEpEcFZiUlk1K1RHejVsUDdJK1la?=
 =?utf-8?B?YmpMQ2RLc21IY2pKOHZQUHNTR05SNHh1TGs5SjBZOWNZZ1o5Z0k4OFkwTU1Z?=
 =?utf-8?B?b1g1bFZ4N3drcmRpNGJjV1BPcTJCb0F6aGVUa2R4QUtnWWZ1Nzlva241Q2xH?=
 =?utf-8?B?MjRGbklKSllVQjZibmd1bkJ4NENoRXpQTW94eTZkRWR6cG16QVl5RDlCYVU0?=
 =?utf-8?B?c2VjeG9vK3B4cXN6N2VBdmVZby82cDJVNVptQmJKTWNpNTI0THkyVlBsd3hk?=
 =?utf-8?B?VjR3M3Y3VW52RmNSdmFHWU9UdTFqTVBYTmliT2xXTHByMmhKMmluZ2ZsRHdu?=
 =?utf-8?B?bHpJZGUybXpIbWxhVUxPZVlCdVRHcDlpVFROSXc4WG1QOUNQOGhyMHpNWHdr?=
 =?utf-8?B?dnprM2NNYTA2ZlNTRXF4R1YrSU1UWmNpQ0p1WmpPbW9YbFdvc0tlMXo0OUxG?=
 =?utf-8?B?MlJGYjhvZTAwWDg1akJ4OG5UMWt4bGdhdUFuMGNhYWVXeklsV3ptUVFpcktC?=
 =?utf-8?B?SENOWXQxYW9WMTV0dmhPeEJhcmVZS2NnNWNvSG96T1lBMTFQZXZWNUd4NEJ4?=
 =?utf-8?B?N1pDbGRSa0cxd1M5UzUrT0lNVXY3YkxjbldBL2RrSlN0THZ0Nzg1ZS9sODVl?=
 =?utf-8?B?SjBUZERyUXFIYi9ISjJ2Mk8rdEt0V0prYUZRSnNmYW1QWWk1b29XK0s2ZUFX?=
 =?utf-8?B?SmxGREpRaW5ySXpOYzREaGVaUHVicnNkTmRIRGZsTTAwa0pFUk5ReGxNdHh5?=
 =?utf-8?B?YkFIWW52OWY1TXY3d0h6aWRXREFHT2h5QVdnN0pyWUVMYUk4RjZna1k1UFcr?=
 =?utf-8?B?S1plSjF1TUdQVmVJQmw5NTk5cUpSQkh1WnFua282b0ZwY0x2YWRFemRnM2Iv?=
 =?utf-8?B?djRaYlVlQ2pnSEZBR1EzQ1VVZzVEQTB6dmVOUHd2Z2UvN2pwejVVbERSTHNX?=
 =?utf-8?B?d29SbHo5cW0xZ1dSN1d6V3JJeXZ5STcyaHF1Vm9kdUtBZ2xxU1V1eG5zeEF2?=
 =?utf-8?B?Z3JhUlN3VlUzSzNvNWppSlpETVRaeFJlVlBBVWliVXNpVVZNWTB0QnJUblJO?=
 =?utf-8?B?aDYzTk01ekxtQ1VmVWZrdmxLdkxteWpiR2VXMERXZlpyV0QxMVQzVTJmR0sz?=
 =?utf-8?B?NWxZQy9HdWkrZUlxTjRYSTB3LzNHM1BmUXRzQ0dQellPa21BdkwrTGFlcmdP?=
 =?utf-8?B?QVFGYjhjTDk4S3dGVzZSeUQ4MVdpTlYyV1RiSmc4T1R1WWs2VlFEdHh2bjY1?=
 =?utf-8?B?TjJjNDFHU2FsQ0N3c1RWRDlvRW1xNHlwZit0ejk3UFRRSVllVGltcDNFUWlV?=
 =?utf-8?B?cTlHN3JNK0hLMnpCVVVycEsvQ216VmQxWnhMZXRVQVJkcGRHSlp2L1ZZVkNT?=
 =?utf-8?B?YXh4ak5EQm8wWW5sbk01eWRKbm8zVnlLL25SQ3lQdEtGVmRITnVOSzc5Y05u?=
 =?utf-8?B?MEtCUUE1enVaa0J2RVAyL0tiWXlzMTc5djVodmh4eG9iNkxMWVAyMFhXYVJG?=
 =?utf-8?B?Q21DdWlNd3k1dDZVRUN0dHpibjJWcWl0eHZLR2w3QjBVVVErclR3Y0dTcG56?=
 =?utf-8?B?QThoWDl0cVFYTUwwVXVxOHpOK2JHU2JDQm9mTS9BeVFsNnhIVFVVdEJDT3Uv?=
 =?utf-8?B?OUg4eGpMT2hpYnd1VERlRk9uWDlzVHMxQkQzYXYxUU5jaGJIRmNQY0lSRnc4?=
 =?utf-8?B?MXBsMXcyMTlBbUtkR1FMWU93LzBkUE1GOGNkKzQxWTl6L2tRdjVuaTNLalBz?=
 =?utf-8?B?T3NWS3lheFkrUVlGVnNYb1NFRi9CYTdmK2NzUjRtYjJ5MkdNSWJFS0g4T1hk?=
 =?utf-8?B?aER5SkFiUlNqbGdTbFY0UUxETjV1blZKQ2pSbEo3aHZ0Nzd2TEJuM1hmczRS?=
 =?utf-8?B?TFFnL0pRNlFMeUtyQi83QlVKVVhXUnN5QW5xTFcxR2p2cFBkWGlSVG1paXBx?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbfabbcf-a376-4570-2cdd-08de16f359df
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 13:59:17.5679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AwsQ7BnjDSdh8+o1ecyb/KsUKwCxqIDiDxj4r6I31dKFPlh/ai3i9wNm2ptQyQZ3UoLYSqPlUyXJlnfTDsQb0mm9ecFmYoDttfdAOdZD2sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6833
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2025-paź-28 18:58:22 +0100]:
> We already have functions to bulk configure 'hard' resources like
> GGTT, LMEM or GuC context/doorbells IDs. Now add functions for the
> 'soft' scheduling parameters, as we will need them soon in the
> upcoming patches.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> v2: add _locked variants instead
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 56 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  2 +
>  2 files changed, 58 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 6365d5f2ae98..56048cd79d15 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1810,6 +1810,34 @@ u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
>  	return pf_get_exec_quantum(gt, vfid);
>  }
>  
> +/**
> + * xe_gt_sriov_pf_config_bulk_set_exec_quantum_locked() - Configure EQ for PF and VFs.
> + * @gt: the &xe_gt to configure
> + * @exec_quantum: requested execution quantum in milliseconds (0 is infinity)
> + *
> + * This function can only be called on PF with the master mutex hold.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_bulk_set_exec_quantum_locked(struct xe_gt *gt, u32 exec_quantum)
> +{
> +	unsigned int totalvfs = xe_gt_sriov_pf_get_totalvfs(gt);
> +	unsigned int n;
> +	int err = 0;
> +
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	for (n = 0; n <= totalvfs; n++) {
> +		err = pf_provision_exec_quantum(gt, VFID(n), exec_quantum);
> +		if (err)
> +			break;
> +	}
> +
> +	return pf_config_bulk_set_u32_done(gt, 0, 1 + totalvfs, exec_quantum,
> +					   pf_get_exec_quantum, "execution quantum",
> +					   exec_quantum_unit, n, err);
> +}
> +
>  static const char *preempt_timeout_unit(u32 preempt_timeout)
>  {
>  	return preempt_timeout ? "us" : "(infinity)";
> @@ -1912,6 +1940,34 @@ u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfi
>  	return pf_get_preempt_timeout(gt, vfid);
>  }
>  
> +/**
> + * xe_gt_sriov_pf_config_bulk_set_preempt_timeout_locked() - Configure PT for PF and VFs.
> + * @gt: the &xe_gt to configure
> + * @preempt_timeout: requested preemption timeout in microseconds (0 is infinity)
> + *
> + * This function can only be called on PF with the master mutex hold.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_bulk_set_preempt_timeout_locked(struct xe_gt *gt, u32 preempt_timeout)
> +{
> +	unsigned int totalvfs = xe_gt_sriov_pf_get_totalvfs(gt);
> +	unsigned int n;
> +	int err = 0;
> +
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	for (n = 0; n <= totalvfs; n++) {
> +		err = pf_provision_preempt_timeout(gt, VFID(n), preempt_timeout);
> +		if (err)
> +			break;
> +	}
> +
> +	return pf_config_bulk_set_u32_done(gt, 0, 1 + totalvfs, preempt_timeout,
> +					   pf_get_preempt_timeout, "preemption timeout",
> +					   preempt_timeout_unit, n, err);
> +}
> +
>  static const char *sched_priority_unit(u32 priority)
>  {
>  	return priority == GUC_SCHED_PRIORITY_LOW ? "(low)" :
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index 6bab5ad6c849..14d036790695 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -43,6 +43,7 @@ int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid,
>  u32 xe_gt_sriov_pf_config_get_exec_quantum_locked(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_config_set_exec_quantum_locked(struct xe_gt *gt, unsigned int vfid,
>  						  u32 exec_quantum);
> +int xe_gt_sriov_pf_config_bulk_set_exec_quantum_locked(struct xe_gt *gt, u32 exec_quantum);
>  
>  u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_config_set_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
> @@ -51,6 +52,7 @@ int xe_gt_sriov_pf_config_set_preempt_timeout(struct xe_gt *gt, unsigned int vfi
>  u32 xe_gt_sriov_pf_config_get_preempt_timeout_locked(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_config_set_preempt_timeout_locked(struct xe_gt *gt, unsigned int vfid,
>  						     u32 preempt_timeout);
> +int xe_gt_sriov_pf_config_bulk_set_preempt_timeout_locked(struct xe_gt *gt, u32 preempt_timeout);
>  
>  u32 xe_gt_sriov_pf_config_get_sched_priority(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_config_set_sched_priority(struct xe_gt *gt, unsigned int vfid, u32 priority);

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.47.1
> 

-- 
