Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33672CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 07:35:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A5610E87A;
	Wed, 10 Sep 2025 07:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F/S1S8rB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B531C10E879
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 07:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757489755; x=1789025755;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=PuGmgETeN0uvSMAia6B9N517yomepVupITyrsMzSNeQ=;
 b=F/S1S8rBR5tg0Vli1SCGCanJYQ9pf9AcmpQ8E+d1resg1T/STepWPtqc
 jcC2DcKnNSDyTBUaG5n+gRukyf8aH7TUVVW7ckBhIXzny5hzJbZ/7AmBt
 cbaR+EQYzrI5mvfcNe15V793cwcZhqn9G3peZYKRE57ix1pByQzN399fG
 7NkrmQ9UWcBHAs8TckbX//v8ZBM9G1JWyoAheLaoNX5n7pj6ud3kRqUMi
 J3vYNeJNvX42AxNtWptJ+wj6aSi9+Oem0J1R+IKMXgzTb7y7O7XuDoM/A
 NW56S77Fmy3Rbee4vAzNhc1YNxV36cGn3bCya44vZob7PxuM2BuiloqZA g==;
X-CSE-ConnectionGUID: MyQUi8z6R/epfNGvTG3s0A==
X-CSE-MsgGUID: THzOmvofQteXWa8lk8yqyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59646029"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="59646029"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 00:35:45 -0700
X-CSE-ConnectionGUID: XnyUqYRYS+ykVjVodK3zYw==
X-CSE-MsgGUID: 93+ZRp/OSNi3tVoAAPoDUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="204304718"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 00:35:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:35:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 00:35:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.41)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:35:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tjfDh9v15tZzsoDLYKzsbpHNBXPQBn7vQ7GZSpc+eSiOZiG2adW7TVGfre0JvhC2SMXIu6imwLDxfqyXXWNlVHnWDWzxONilMAR9+OaDrzkfTqwYmI27uPlC7i6KyIb5rwwgL5GYgpKBoZiTiqHM3Bqnm29a2MfP+RBGqXU33HlvDaGhyytTmxtGBdTkol+2mdFBcUNIO7i8colE7hfYO06rbU4DQKXbIQpaX9OBFlG0rmvvYaJZS7Kkz3vUq6hKWTCYxxHYYJUDOGLWladu09EvVlRBIZSJS/eyIlWbgSaeqGwXrXeSEsaoHaqLMvmAnvKjYY0MpelXph/5zP6+uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SEBkPEL+DmCsSfpkzpWwZqh96oM4vn/kjq8MEFA2gl0=;
 b=BETWDw33ucuAGSHNfpMibC4x1D7YJAB0C/q0/oO8l9aSmSKCE+Ibvg8BPVpN8/1pioA/42z8KniDpk7C7oDjx9v6A1H0vI+r5I/BfC5GijhRoeSem6u0g89Q9gvgJI/wXyyxnkFk8GCYi6+AA7fIC+UaJKLUG+iSu1d1+Cwa8jTDGaiUrHWAl5XGpepklV8y/i8umRCosKMK6ffu+ZlnEuhKEqD0qCGnQ54nTaqE09+IleerNTYedVYylp0ANZ86IJJjKiGlwF2go7cuVy5RV0V+cZbAQ0Z//BoEzUfmp6403jxyja/hSE0tw7Km7GmrHOYn8HBQOvgI6SNylSP22w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB7902.namprd11.prod.outlook.com (2603:10b6:8:f6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Wed, 10 Sep 2025 07:35:35 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 07:35:35 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v2 2/4] drm/xe: Introduce new BO flag
 XE_BO_FLAG_FORCE_USER_VRAM
Date: Wed, 10 Sep 2025 09:35:08 +0200
Message-ID: <20250910073510.732250-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910073510.732250-1-piotr.piorkowski@intel.com>
References: <20250910073510.732250-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0012.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::16) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c9d9e19-9df0-4580-0965-08ddf03ca116
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHhNWWpiM3NUN2JnYktRVXpBaGFKaUdEY0FnV3E4M3BXaXpZdVFvd24xTzlI?=
 =?utf-8?B?b0xlZVUzZitVU3JhdnpuK1g2NDBDZ0lGQnc1bFpvdXEwc0RSTmVxbGwzbS9z?=
 =?utf-8?B?bEZ1RTBLcWFha1dwT3ZsdWpsL2JiL28rRUZBUllSaEdsNHBucUhoU0VlMWx2?=
 =?utf-8?B?M1dOdXdSR3p6VDRxRlV1U2pPVU5xbVZXSlRhbzUwekg4V1FnMnJDbHZMWm9q?=
 =?utf-8?B?eFYzZmNHNm40bXo0aXFXOGp0MVZpYm5JM2JxR1RXSkFMeHFoMlhici96VEhM?=
 =?utf-8?B?NDIvY2phWHFwcHk5b3phVEloaWw1Q1ZOd2hOd2VHenZhV1VpYTE3MGZxMTJ4?=
 =?utf-8?B?MWhYMGRMTS95d1F6V1lTbDJZaEw2YXpnbW5NNDUrOXRuaGVYN3lsbjdYK0gw?=
 =?utf-8?B?RDJJMXlHUnVGUzFMMlFzM2xqSmpjZkFpbWFNRTFzaUI5cUN2eEpFaG91VkQz?=
 =?utf-8?B?MTgrLzdYN3ZOdDEvaU0rZG5Za0dSOUJjYllZUXdTYm1xWUlVUUliK3JoNGVw?=
 =?utf-8?B?NHlnSVdXQ0xjQklsTGE2RzBkU25kWW4vMXVONWdxcW02TUs3Q285TG52eEdV?=
 =?utf-8?B?MTM5TjRVazJmUExaTnFnVWcvcWEzWklNdEVHMUpoUW0rMTB6V2c2eHVzNjVs?=
 =?utf-8?B?bFlHclRxMUZUOVNmaGFmNDFKWjB5YlJPcFVtSERudDZoSmF2RkRjSmpuNk9X?=
 =?utf-8?B?bjN4MTExTlA2cW9vUXJ1NWdXbWR5UXNPUzFDcU5DYm14V2JoQTlTV1ZIWXhl?=
 =?utf-8?B?QXhCdG9UYXJpd2lZT1FuWGpUZi9LdWtESEk0SWo2QWhYbElUSmkvb2hVNDds?=
 =?utf-8?B?anZrV0syYzAvTTZROEZEalUyMm0rQ2Foa2VUVHc1a05lcFZwWmtuQUtHSFdu?=
 =?utf-8?B?VzlKUU9NMWNZZENxdTZnREd1cHR5UFVSRXhnQkVKbE8xZklkSHlBYVhBdUZ2?=
 =?utf-8?B?WEllb0tpcnBOTVlYOTV5YUJkcXdVNVIzbm5uTUxIR2lvMmU5cVJGa0twcmRR?=
 =?utf-8?B?R0pNNTVnOUFpYVR0MTNvNndmMWdteStOcmJyN2x0alVndWNkbyt3aTRiU3Vo?=
 =?utf-8?B?UEFlRjRuQjdObE9Pb0dQZ3B4bVFMQ3pHTFVRbytXN1ZGcERha2JCTkFweG5r?=
 =?utf-8?B?Si9zS01MbjBVU3NNUXgvV2xNMytpK3lZb1NORnNtLzJBaElodk1xM2Iyb2cv?=
 =?utf-8?B?RU1NbytiUUdYUUMxQ3hKbTJMSzFCRWo3WVVIZ05xZlhwc3VZZEV3dkFDZ1cz?=
 =?utf-8?B?VERlYzZZUFJXNlFWVTRuUDJKWTNmbk1ERW9OVWJoM3NVWFc0RjhQaTlpV2xw?=
 =?utf-8?B?Um1XcUZBY1hBaXowV3dyNEt0QTlaVG1MM1lGak5rU0E5WWNDa245ejhiOUFR?=
 =?utf-8?B?TmsvMFJnT2VpaTJsY2FLOWIvKzczbkNkZ1JnUmY3bWw5R2N1R0hmdzdjUUNj?=
 =?utf-8?B?UldzVmJDbGFKakJ1THlmZWRrL0J2SWJRKzJEUzduOVgyMDZNM05sTmhIWHdm?=
 =?utf-8?B?V1oyQnhzb09VdHJlRmNIckwxZHJVVk9NS1hIM090NFJCVGpSenhwUkRWZGlH?=
 =?utf-8?B?SDlDa0dkV3FyZEhwQVpyT2xhQ1JadS8ramdNOHpobldWZUUvWW1JNUJMaWlG?=
 =?utf-8?B?RkR1L1pacHVZZExmc2hKekVuS3dINHNKeWVyTG1UaWNlRWlSeit5aCtRSXZi?=
 =?utf-8?B?RnIrb25WTGhpZmtlWkl5TEMrYmlDZEFSMUhIRkZ5d29ldHNyRDFvMmt2V3Jz?=
 =?utf-8?B?Nng3bVdRUlZId3k0WG1yL3RvTHdIU1liR2hicEI3emVBa05jSG84bWt4azVm?=
 =?utf-8?B?ODlvOW43eStlNUk5OGlXdnBhaWswR2hZNXFjT3hyTEVZVTBLb1RRYUFaYlA0?=
 =?utf-8?B?V3lGR1RYM2ZuRXJHNnRUeGJXeUxLcEtWdW1TODdOZ3Q0VFFwR0Q4U2N0eDFI?=
 =?utf-8?Q?RS+/0TGYQuI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1NSa2VUSVFIbHloQ0hZNWl6aWNRT2p4ZXJsM2R6TnpNTkJCNWZhUTMwODdL?=
 =?utf-8?B?NkdITm4wcFYxZ01BTXZmZGplUFN3UFJyUVVaRzlmT3VxWkRpMTFJcndXSnpO?=
 =?utf-8?B?WHhOWmdibTJjS3hQU1FvK211UTR6UTI0cWdjRDhrdVo4eHduck85RTJrZmRE?=
 =?utf-8?B?YXppQWhZUzcrb0NzRE1ISXFuYUtYSGxqMWJDaVM1V0NUeURIOTR0VjlMMlcx?=
 =?utf-8?B?NXR6eFl0ekdpYVU5NmFTaHZZendEOFdDUTVoczNybmlacEppazJuazJubzNs?=
 =?utf-8?B?QWh1VDBxK1N2NHVnYjlJVHlVa2NTWVlQZ1hXanFwdGRPMG9vMjdyaEYyOVor?=
 =?utf-8?B?NGFDU0t5eDFub0FYZmU2K0dkVHpZS3dTOTlKUkl3M2F4NmkwcFFWaThpSnk4?=
 =?utf-8?B?U1VyQWJUdmErR3o5bmU1WnhlYnN0b0g2YjZkSmdQbVBIamtqWGY4TnJMTTJC?=
 =?utf-8?B?M1BOaTAzb2dSZWZFMk9oYWJDOUErNFVGamJJUGt1ekZEODg5TzlyaWFSWUpG?=
 =?utf-8?B?TUI3Z3B1Qnh6aks4RHFOOTAyaCtrWDIzVjhjbXlRNEIvaHB0d1lxQTI5UnV1?=
 =?utf-8?B?Rzh4Vk1YQlNuenJxME1QaGZDR3hPWXZVdFp0N0pRYmxPUTNGUnNuZXRMM3NV?=
 =?utf-8?B?Z2xsN0lObHpCMjl5TlpJUDZudERFdWtWeGdIbVZVNGt6SWhmZVhoVDhaTDJR?=
 =?utf-8?B?aXR3TmFEQU5XVlF1OWlHWkdCemttaVZSazdZVDNPQkUySk53UWd3NnJTNDJQ?=
 =?utf-8?B?YzJYWTR6emF5ZjhXQmF1Szd3bUQ4Y1dmNTJuVmxPbHNsSkFDYkE4MVY3dFN1?=
 =?utf-8?B?Tyt5ZkhoZFF0MndoV2VwekpROFAvYzVQQysvSWNYVld1Wmk4RkExYVBqemJR?=
 =?utf-8?B?cFZ6ck1TRFNZaXFDaXJlUVc3b2NZTjl1YkJQOW5qYzc3K2Z0TmZlQzZ2ZTZm?=
 =?utf-8?B?eEZXY29UeURvOVRqK0xJMnFwQUwwcjNMNHQ3Mk1GWG5vZWlEeHQ2bWRnQ2hq?=
 =?utf-8?B?bjhEb2tIVlVLTFhPQXVrYlgrTEx5VTlLMFZrSng0aWhoc3NQV1NnYXBkMEhu?=
 =?utf-8?B?YTRDWnVDejVseEVqUndnKzFPZHlqem9GSnQ0TFoyc0hTdmtiUEJZVENielI2?=
 =?utf-8?B?WVJteDVlSStBOHYwdFY4eDlYYUVFMnlNenpDVGpmSU1hRzFzcnVRM0hjb3JV?=
 =?utf-8?B?MkhYS054TS83QnY0cnQrdUxwaWY5YnFzSm1vNTBwRE5rVDd2dUwwSlpvUHhO?=
 =?utf-8?B?TmY4MTlTMTlRV0ZoaUN1bzhPSktCcXVVSjNuanpId1lJTEpocUQzMklzb0sv?=
 =?utf-8?B?ZUJyM1ZQM3hwa3VlS0EwTXE1eXNnZ0RsMFpRWkJLeE5hMEZqc0duY0VoeWhs?=
 =?utf-8?B?WUh5SVluajJjbmJwYm9rU2gyaW9NamVPcnh4MGE3SzJUdDgvOVdHVFJTdjlB?=
 =?utf-8?B?cDlrS1dDZHNPWkZIQTN4bjBOUEo2eWlvWldEWmNHUEtEbGx1SGxxTXBtamFL?=
 =?utf-8?B?L0daYXFUajlQMjZiNFA3V3VMNUExSkpzbFNIYW1ZUEk4dTdyTVdJRkJpUXlR?=
 =?utf-8?B?bFVET2ZQRHRLcnVJa3A0NU5adzI1c3Q2RWwxeFltM2QvcWdiTXVkdW03QXJB?=
 =?utf-8?B?aVNBZFhHK3FqYjVYMnQ1TEtOS2xvaDRZOVdjMVFTQTBLWk5ZUVdoMGkvK0do?=
 =?utf-8?B?R3VFbEc4Z3BlckQ2b3RaS3BkTW5LbFhwM3dGa0s5VTd3OEsvSDQ4T2RaK2FN?=
 =?utf-8?B?V3A0RWRZUjFEM1FMM2tSM2ZYcVE0aTlGbGg3Nmd2WFBOVFdGZHBPV3VhQ3M4?=
 =?utf-8?B?SDl5ay9EeWtDM0JzQWRiTzlWak1YOUxia3RQZWV2UGtDNS9pdktkMHFKbWhJ?=
 =?utf-8?B?eE1TekZxMVFQNk54Vk02Zk5IeFgxR2taeDJCRkVLZXAvcVpWYTZPMWsvcUFH?=
 =?utf-8?B?L0pkdUs0dHE3REZuUDBJWnpQK0ZYRVdDZXpiQ0ljOEZFdDZVUStwbEdvR2Iv?=
 =?utf-8?B?cDZCTzEvRldsRllLMUREZDJDNVpaQVk1aVJEdHZLYmwvMmQxT1FMNUkrb0FR?=
 =?utf-8?B?VWE5a2pmOGlTckdkVlFyOGZLUXFuYkNxME5Tb2V1S3F6c3czeXZKc2xoNG93?=
 =?utf-8?B?aCs4akdCaDNRL1oydDJIdWNMOHJDRnFvZlpPRld6MzV1dTU4UCtGR2JyM1dl?=
 =?utf-8?B?WXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c9d9e19-9df0-4580-0965-08ddf03ca116
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:35:34.9357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRLFqS5DmL83c2pSJsrHKU0UV9igLXZWG+xWfKKOF1nWtIisrSeLAwGLZOBG4ke/u85aDuG0UawkUJOA6+g6s/v3od3dUn7+oLszrkEukCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7902
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

When using a separate VRAM region for kernel allocations,
some kernel structures, such as context userspace data,
should not reside in the VRAM region dedicated to the kernel.
The VRAM kernel region is intended only for allocations necessary
for driver operation. Allocations created via ioctl are long-lived
and not easily evictable. If this region runs out of space,
there may not be a fallback, which could cause failures.
To prevent this, add a new BO flag that explicitly forces the BO to be
allocated in the general-purpose VRAM region accessible to userspace,
avoiding the kernel-only VRAM region.

v2:
 - update commit message (Matthew)

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 11 ++++++-----
 drivers/gpu/drm/xe/xe_bo.h |  1 +
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 94838431288a..88c3ce3ef0c6 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -226,14 +226,14 @@ static u8 vram_bo_flag_to_tile_id(struct xe_device *xe, u32 vram_bo_flag)
 	return __ffs(vram_bo_flag >> (__ffs(XE_BO_FLAG_VRAM0) - 1)) - 1;
 }
 
-static u32 bo_vram_flags_to_vram_placement(struct xe_device *xe, u32 vram_flag,
+static u32 bo_vram_flags_to_vram_placement(struct xe_device *xe, u32 bo_flags, u32 vram_flag,
 					   enum ttm_bo_type type)
 {
 	u8 tile_id = vram_bo_flag_to_tile_id(xe, vram_flag);
 
 	xe_assert(xe, tile_id < xe->info.tile_count);
 
-	if (type == ttm_bo_type_kernel)
+	if (type == ttm_bo_type_kernel && !(bo_flags & XE_BO_FLAG_FORCE_USER_VRAM))
 		return xe->tiles[tile_id].mem.kernel_vram->placement;
 	else
 		return xe->tiles[tile_id].mem.vram->placement;
@@ -276,7 +276,7 @@ static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
 	u32 vram_flag;
 
 	for_each_set_bo_vram_flag(vram_flag, bo_flags) {
-		u32 pl = bo_vram_flags_to_vram_placement(xe, vram_flag, type);
+		u32 pl = bo_vram_flags_to_vram_placement(xe, bo_flags, vram_flag, type);
 
 		add_vram(xe, bo, bo->placements, bo_flags, pl, c);
 	}
@@ -2049,7 +2049,7 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
 	if (flags & XE_BO_FLAG_STOLEN)
 		place->mem_type = XE_PL_STOLEN;
 	else if (vram_flag)
-		place->mem_type = bo_vram_flags_to_vram_placement(xe, vram_flag, type);
+		place->mem_type = bo_vram_flags_to_vram_placement(xe, flags, vram_flag, type);
 	else
 		return -EINVAL;
 
@@ -2080,7 +2080,8 @@ __xe_bo_create_locked(struct xe_device *xe,
 	 * that we are using unified VRAM and we need fix VRAM BO flags.
 	 */
 	if (tile && type == ttm_bo_type_kernel && xe_tile_has_separate_kernel_vram(tile) &&
-	    (flags & XE_BO_FLAG_VRAM_MASK) && tile->mem.vram->id != tile->mem.kernel_vram->id) {
+	    (flags & XE_BO_FLAG_VRAM_MASK) && tile->mem.vram->id != tile->mem.kernel_vram->id &&
+	    !(flags & XE_BO_FLAG_FORCE_USER_VRAM)) {
 		flags &= ~XE_BO_FLAG_VRAM_MASK;
 		flags |= (XE_BO_FLAG_VRAM0 << tile->mem.kernel_vram->id);
 	}
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index ef3268e73489..522df758230a 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -48,6 +48,7 @@
 #define XE_BO_FLAG_GGTT2		BIT(22)
 #define XE_BO_FLAG_GGTT3		BIT(23)
 #define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(24)
+#define XE_BO_FLAG_FORCE_USER_VRAM	BIT(25)
 
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
-- 
2.34.1

