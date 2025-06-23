Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB476C77B7C
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 21:40:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719BD10E2A9;
	Mon, 23 Jun 2025 21:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EBN8inWS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06EA10E469
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 21:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750714831; x=1782250831;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1LOhJU//GnzFQw9ZSoZfgE6YlwdIwCJh+2LdrNMWQ8g=;
 b=EBN8inWSs3CYgU2iaxDOOv+E4tquemu4AcVxeU+mX6jQBJz65z+Lz0ke
 B9hcH+4xdBVsMz+sSmsrhDxrkiO7bg0IwDuUYC0giLbrbOGLzsqarY9gB
 tgcSuQBp6S1X9Ducf7OIkrtWA7LbSXc/GTCrlgRl2wM0iT+whd9w7lkuU
 4U3H8wfWF9P5zrrWVyadHOGAUxExWaVpvKVLzz1H/aZz1BV5cxw/ehZyk
 qoEa0LitBQLhHw9jRHIIkthB3oPmxhfL9wi9i2O07KQp4hS+vFPyX8eN/
 VFVD7up4ZCUauh5iD32GmY6O/IRq4llmgwZCBmSBKD+1yry1qkqb9DUXH Q==;
X-CSE-ConnectionGUID: w7eReI5vRrK8hFQq5HFmOw==
X-CSE-MsgGUID: X6NeLCF3TtqnZwDpw3/mpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="70503136"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="70503136"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 14:40:31 -0700
X-CSE-ConnectionGUID: jU32qWB5Tiy5W1T2CS3akA==
X-CSE-MsgGUID: dDvaS/cESO2NWAyAKwFrXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="151482950"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 14:40:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 14:40:29 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 14:40:29 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.87)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 14:40:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uVB+B6V2Twy9xOQb4Z310SvDyHqSYw6fptK1lAlS9PAuVjATMcliBQCR2qkV9OSKC3ECDwqiLBTuOKBoThX30/jfm8ci+ONI8HaHmjCB0lZ+6bQtb30Bsb55K8x9US4mQQrCNY1yHLosJ6Mb19CJD96q1226twhH513FHjgFCHD2atfu1tdgFZ3Ho2kWzKu+8jbQYmpAWWS3J7GRu/aXLKHiHwRiNoFQTYFvP5ynlYU6oOR0GNW/nTb4NTc6wUNuTcsvKqj8gwwRtMh8H+k9++oV8EqOJpW1yx6HNAb901kuPoGnQbMwXYtEeDtoVly3Dkwinveke8g8t4rtK9bSCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6yWBQC8lHJTfUuIbrvrGx2Ftkr1DxLlk3o5pwUHuNo=;
 b=KC3he3PLTE91Ais+grX7dqv/QqAZblYIm12HlUprwIlCzJHQpp9bebTPPvV/42b5hZe8QsOoR2Z185PC+ro1aqol2CfTAP8guxIispFWCihiPua3HgKdQoUWh78RaF9uumEHHpqiPKRJkbfKJXelsLcFmZydOqJ5kgwZ+OHCZs7eMcF+GJCbn/zpYyHblFUImO7ehKvXhCcaUymAj0FqxuUbZakOTsBFzP3UjdvnSSl0sURHTS0H403hFs747tA9c166bVK63X1v5iYQwmX+eSpHojHZUbVdG8eXZNZ47X75g9o6M8vkx7kvqM43vct2EfdYChcM1L71tNrIsDORjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPF6CF7B12C6.namprd11.prod.outlook.com (2603:10b6:f:fc02::2c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Mon, 23 Jun
 2025 21:40:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Mon, 23 Jun 2025
 21:40:22 +0000
Date: Mon, 23 Jun 2025 14:41:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>
Subject: Re: [PATCH v8 2/3] drm/xe/vf: Attach and detach CCS copy commands
 with BO
Message-ID: <aFnKJ5HGBrSjz9x2@lstrano-desk.jf.intel.com>
References: <20250619080459.27731-1-satyanarayana.k.v.p@intel.com>
 <20250619080459.27731-3-satyanarayana.k.v.p@intel.com>
 <aFWLbiiMQ8ZnIL2x@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFWLbiiMQ8ZnIL2x@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: CY5PR13CA0019.namprd13.prod.outlook.com (2603:10b6:930::35)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPF6CF7B12C6:EE_
X-MS-Office365-Filtering-Correlation-Id: dd19801c-17c6-43fc-b8c5-08ddb29e8e7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWFOZGVXbmUxaG9ib2k5YWRvSFlTQjY0NExBWW9XeUtqOStyb2RPeUtrK1pz?=
 =?utf-8?B?TGw4SEZmTXQwMGNuTUhtN20zczRpRXhleVhPSitNL3B6cnlrR21qNGVMdG1V?=
 =?utf-8?B?VnppWEFPNyswTEI2TDdIRzRPVGRUTGJWWlVsVUtqUjd2NElBVFIxSEZQTFFv?=
 =?utf-8?B?eHBwYWx5bTgvV3JjdC8rUU56N0FCOVVDVEI1emZMQzNlRkNOb1hiU1hCUERo?=
 =?utf-8?B?R2Q2UE85YnVEbTI4dnd6djFyRGk5TW41TjlrckhGWmpoSXZXejk0bW1hemtF?=
 =?utf-8?B?Y0NVN1VuS2FIK0JhTVpCTUJPWldjYW5ldjlsMXNtVlZRY0VBaS9wL0cyRWVG?=
 =?utf-8?B?SXFha0ltQU02b3ZtelVBZ0ptbHVBU3E2Ny95Y29VeThhalRJTFVob2hLTnh0?=
 =?utf-8?B?Zm9BZ29lOXVscnZ5aUo1ejF2dDQzV04xeE8zaTR3YXlmTGF6bmJGd3QwWVZz?=
 =?utf-8?B?M1JvMkgrRUsrVHhtYmtEMDhwQTdjN09WclJOZFBKRDVZWjJQaDVDdzRuVDRX?=
 =?utf-8?B?UGJSWjgzR1ljV3RyeGNGaFV1a3JPcVFzblZ4eXQ1QW0vNTAva0FvbmxDRTZo?=
 =?utf-8?B?OHhXRWhiQVg1RVpMWHNiYUNxWVNJdDV4bGk4TVZzeEhXUnVwNVBjOTNvOXlH?=
 =?utf-8?B?MDFObUZTYWhGTHFPTnpaYTBhUGxjek43eTJDL3N4aVBjQkYyY2ZtbUI5bXN2?=
 =?utf-8?B?ZWJUSmFCandlQ01RaXBzRFlOVVd6ejFzRHFpZmQrMzdKZUI5b01yOEttWjdF?=
 =?utf-8?B?OFc2b1Y5LzlIcWNQMXJLd2JicnVhUG5kbTk4ZytlMUJJZXlTakt0Nm43ZHho?=
 =?utf-8?B?R1c5TUhkeGhRMGllT2xpSkMwZ1RYWjQ2TVVWS3FyRmluV3JDM1FCWFVxU1lQ?=
 =?utf-8?B?Sk5nSGdIQithMWJtcjR1LzZaaUZsM3lUNWx5ZnFqVDNKUE54MENOdkFCZm80?=
 =?utf-8?B?dW9Rc05mR2Job29yVG5TbEpoR05BcHE2WjNWWCtrSTJmMTVZRzlwRllxTmJM?=
 =?utf-8?B?d0hCMUtJM3dsVjEyaERxdU9MVXRSS2lPaWY0ZldSdDI4Q2tpKzhOOFlDenNE?=
 =?utf-8?B?SW9VTkl5b0IxSm12Z2tVNjhsQTlUakRGZCtWRXQ2ZUhjdzZKclF4TU5FS3h2?=
 =?utf-8?B?VXRkTGpqaFQ4WjdJU1FiUStJa1lSYzNvRDBZZnQzYzBOTWlWZHFnMlFBc0dr?=
 =?utf-8?B?RGhsY0drS3JDK2plLzdmcCs5czRiMXRBQytoQk03dUdGWjMwOFBUUzVFaEky?=
 =?utf-8?B?OWNQRHdrczE3czM4MUJKd21rZXYvNlk5UmNIM2FIUmtiVndQMiszZUp4cFFs?=
 =?utf-8?B?eVFZWWZtcGE0NG9IMitVa0NRdzBOcGxmcGZHSHFISVNrbnJ4Z1o0c3BwZjNo?=
 =?utf-8?B?Y3pMNm10eDh6Y2tZd2dKVzl4VkNqRFFUL1I1RUorNnZyLytFSU8vYjFTQmE0?=
 =?utf-8?B?RUdpSGtuWGg5ZjNDNlgwbGFReGxUamVUb1daZTk1TlJHSDhjV2RHR1JaK0xE?=
 =?utf-8?B?NG5VM1JmTTIvaVM4am4vUGQ1aHlzU2UwQ2ZhdE90eWQ3bUpDNmpVNUFycjkv?=
 =?utf-8?B?ZXhRR3BYTGtiQlVIUnU0K3JzY05TSXE0K050NEVaSmhzOVdBYnRyY0dTUmxp?=
 =?utf-8?B?a3NZODRtRFdHaGkrNlEwU2NITUhUbXUxcUl1SFJlb1g3bTFTdEtzSnRDY2xu?=
 =?utf-8?B?NWcyYnJHRERwSTg1NWtTYmIrNDZiTHdWVGRFMGlNRjJFenl5STFlZy9qYTlN?=
 =?utf-8?B?U2o3dFBUR1R5b3FWRTlTdUFqVGVrZUJha0lSa0VVMjg3MjZSTG5vZ0lCaFFU?=
 =?utf-8?B?aXZxVFJrYnl3ckFsSDJRTEUrYzdsRTNPWnM5WW03QXdFS2l6QWhVV0NsLzN2?=
 =?utf-8?B?RkNKd3FqMG5vTDZWT3cwWXM5ekp2aDF0TU4vTEtMakpDMHRhVWxISlczekNy?=
 =?utf-8?Q?CmnWgC3kCxc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nm5Jd2NLUHEwYzhiV0VHUkEvc213R0MxVHByQnN6RE9YY3UyamlkSXZoQ3dq?=
 =?utf-8?B?eUt5N0k1UUR2cmdUVUptR1Nudk9IS1k5OE1mNW5wUEZFc1N6NDlOVlJncDhG?=
 =?utf-8?B?ejhlV3UxY0ZCT0JIZS9NQzVpaXpnbGhRcXJhblN5aUxwTmVlcWE5d3B2Qkhy?=
 =?utf-8?B?MG1aVnI1U3ZxN1huSk1DWmVOOWtFTmJFeVJucjRNTHNlL0FkVzBFTUszNmZQ?=
 =?utf-8?B?RDRqSy8wREJuQUxwaTFFOW5ZYWFXUjZEWmlueExxdkRoYXZVOXI5VU9hMG9U?=
 =?utf-8?B?TzE3WVZNMzZxU3pPWlpEQnZnU0F0SC9UVHdrWXZobzNtQmhaR09PSnNXdGdW?=
 =?utf-8?B?YTBhYVZSeWxzVmtrUGJjRFVEVFJ5NVlIdGtMempkaEUvcWtCV0tlOGJSd0xK?=
 =?utf-8?B?S0hSQWFiL0g1MDNlR2xzY2laMVkwc2ZPM2dGU0hSRXEwSVdIOXFrZVdvTHBw?=
 =?utf-8?B?V2R4TU9uKy9MSjJvR2VkbDE1Z1l5b0Q3Vy9vVlhINEE2dkpHSlkxVmpOdk10?=
 =?utf-8?B?RUhnb0FOa2JNL3IwQ0ovNW9TVzQ3eVpSTUdOcEpZZTNOa0NRTG1BSnlzWjlR?=
 =?utf-8?B?SzhmcnhIWUtqMmJ6Y05oMGNjSEQ4L2t5UXpYR3RLV0NqWXRQaDMxRUhHYUtP?=
 =?utf-8?B?QnZUVU1lYkpaemtJWUNXL0Nsd3ZWRS8rcVJWeXhWTG9mSk90OG5aRlJYRjZa?=
 =?utf-8?B?bmg5WXRLM1l3NWIrcnNWZE1iNWkxSXB2ZzFEVWdYU1RKWVZkODZLeE4zSkpW?=
 =?utf-8?B?MmVKSk9KSHlheGQxWXFrbTBWWWRWSnUrekdRc2JITnVLdVhpaGFRN093anpK?=
 =?utf-8?B?dE05ekNKOVpEZFRkRFJKNjhZU2NUS01ITUcwdkhUWFhERUluNDI4RlprWElF?=
 =?utf-8?B?T0dGdkVUemlxeDRaVnRwd0hadGJTd0lHakZ3TlpJVmtnaXdieStLc3pJNTFn?=
 =?utf-8?B?a2Y2cTlZNXE0UldySmVpak1ETWJWeFZ5YlE1enAzZUpETWFOc1l3N1AxMVEw?=
 =?utf-8?B?c0M1bjZteXErZytMcEwvQmNVVGVZYVN0eml1V3ZnakRSZ2FnVWQvRU15TFJD?=
 =?utf-8?B?eVkyeHVlSURrMndWaGtZaEJNZWxiYWN6QlI0V0k2b3RMODhRTXQ2eFVJS3Zy?=
 =?utf-8?B?UjBRb1lqM1FpSGRGMkNMeXVPUy9rM0YvWlhZZmh6SlhrOWJJeFFHeWtYL1pL?=
 =?utf-8?B?L2R4U3I5YnF1dmRKaWVFUUs2T3dlSlJzcWNOYnFDZ1pzNklOQzZERTZqdjVQ?=
 =?utf-8?B?dEhvWmhiTzdPcHM3Yjc3U3BSTUM3VDN6bGJkM0E2K2VoRUYzYk1IYmZ0M014?=
 =?utf-8?B?VEJ3RzlaaFlpNFdDNTlINHBSMi9FNGE2N0wyMDNocWtGNEphdVRkcjdIMmxL?=
 =?utf-8?B?T0lFZDFINXF6WEtqK1FJSVBDcWVPU1ovcGZFb3lhaEl3OEZNd1puaGxsdmhE?=
 =?utf-8?B?R1d0WTU1cnJYYkgrdWtKSEtHL1BXTUhWaEU1b0hCZzFySFhtL21VNytPdU9D?=
 =?utf-8?B?dHphTUtMb3pBb3dPK2t2YndQRkt5SVJjWGM2VWdrako4SEFXOGNiSVdWSSsv?=
 =?utf-8?B?Mm5MUnlFb05wYXJ4V2dWU1R1UzZOaGhKREw1K1JkTE5McUVjaU9LQWMydnBE?=
 =?utf-8?B?OVZtRXQ1UTFWWVZQUFIzTTdUS2hFSVJsVkZwRXhSb2dIdG5aRFVsOERVdFJm?=
 =?utf-8?B?eks3cWVnSmNVUUkrNUlrL1lyS1FLdDQwby81TCtzd3pBcUZxS083VVFiSWJx?=
 =?utf-8?B?VjdUWGV6bHp5RUh3Y2hNNk5JdGgvOCtlYmlBRmR6UDZpWGtnV2pRNTVZOXJL?=
 =?utf-8?B?c09Nby9idmQ4SnJlU3k5QkRDelZWRFZCUDZZakNHNzNxYlZyeUtmUG55d0hh?=
 =?utf-8?B?ejhkS0FZZlo1OENYemd6Wm1DS1ZKeDF3OEdMNWtPbGxOeGtreWtHQnV6YWJ0?=
 =?utf-8?B?U3YrTjBzWXcvSVJLMUJFMzZSSmFVUzRveGJvRUd3bjRiT1N6cFFrdkdSVWFZ?=
 =?utf-8?B?KzA1aFRVY3ZSRnZ3Tkd5UmppL0hOT2dxbXhlMFg5Ui9FbDQ3N3BnZmdpZWg3?=
 =?utf-8?B?RTlNNHlIRGs3RkJwL2dRMEtuUDRjS0JpajU3TTRVcGNZYnVhS213UkhncTZw?=
 =?utf-8?B?dVdNTGNsSWordzRHb2JVRVZ2NC9ReitsTmt1aCtBVTQwM1F5QVlwT2JpNTdF?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd19801c-17c6-43fc-b8c5-08ddb29e8e7d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 21:40:22.5373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JP/sO6ZRUY1tR5WbZrnQpfHzsDPE0FHNMrYB2Z7Qy167r9EPh2tgO3CXW0xHWl7/WPPUCzraII84ufUZ/Cc9VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF6CF7B12C6
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

On Fri, Jun 20, 2025 at 09:25:18AM -0700, Matthew Brost wrote:
> On Thu, Jun 19, 2025 at 01:34:58PM +0530, Satyanarayana K V P wrote:
> > Attach CCS read/write copy commands to BO for old and new mem types as
> > NULL -> tt or system -> tt.
> > Detach the CCS read/write copy commands from BO while deleting ttm bo
> > from xe_ttm_bo_delete_mem_notify().
> > 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> > Cc: Tomasz Lis <tomasz.lis@intel.com>
> > 
> > V7 -> V8:
> > - Removed xe_bb_ccs_realloc() and created a single BB by calculating the
> > BB size first and then emitting the commands. (Matthew Brost)
> > - Added xe_assert() if BB is not NULL in xe_sriov_vf_ccs_attach_bo().
> > 
> > V6 -> V7:
> > - Created xe_bb_ccs_realloc() to create a single BB instead of maintaining
> > a list. (Matthew Brost)
> > 
> > V5 -> V6:
> > - Removed dead code from xe_migrate_ccs_rw_copy() function. (Matthew Brost)
> > 
> > V4 -> V5:
> > - Create a list of BBs for the given BO and fixed memory leak while
> > detaching BOs. (Matthew Brost).
> > - Fixed review comments (Matthew Brost & Matthew Auld).
> > - Yet to cleanup xe_migrate_ccs_rw_copy() function.
> > 
> > V3 -> V4:
> > - Fixed issues reported by patchworks.
> > 
> > V2 -> V3:
> > - Attach and detach functions check for IS_VF_CCS_READY().
> > 
> > V1 -> V2:
> > - Fixed review comments.
> > ---
> >  drivers/gpu/drm/xe/xe_bb.c                 |  35 ++++++
> >  drivers/gpu/drm/xe/xe_bb.h                 |   3 +
> >  drivers/gpu/drm/xe/xe_bo.c                 |  23 ++++
> >  drivers/gpu/drm/xe/xe_bo_types.h           |   3 +
> >  drivers/gpu/drm/xe/xe_migrate.c            | 130 +++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_migrate.h            |   6 +
> >  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       |  72 ++++++++++++
> >  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |   3 +
> >  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |   8 ++
> >  9 files changed, 283 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> > index 9570672fce33..533352dc892f 100644
> > --- a/drivers/gpu/drm/xe/xe_bb.c
> > +++ b/drivers/gpu/drm/xe/xe_bb.c
> > @@ -60,6 +60,41 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
> >  	return ERR_PTR(err);
> >  }
> >  
> > +struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> > +			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
> > +{
> > +	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
> > +	struct xe_tile *tile = gt_to_tile(gt);
> > +	struct xe_sa_manager *bb_pool;
> > +	int err;
> > +
> > +	if (!bb)
> > +		return ERR_PTR(-ENOMEM);
> > +	/*
> > +	 * We need to allocate space for the requested number of dwords &
> > +	 * one additional MI_BATCH_BUFFER_END dword. Since the whole SA
> > +	 * is submitted to HW, we need to make sure that the last instruction
> > +	 * is not over written when the last chunk of SA is allocated for BB.
> > +	 * So, this extra DW acts as a guard here.
> > +	 */
> > +
> > +	bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
> > +	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1));
> > +
> > +	if (IS_ERR(bb->bo)) {
> > +		err = PTR_ERR(bb->bo);
> > +		goto err;
> > +	}
> > +
> > +	bb->cs = xe_sa_bo_cpu_addr(bb->bo);
> > +	bb->len = 0;
> > +
> > +	return bb;
> > +err:
> > +	kfree(bb);
> > +	return ERR_PTR(err);
> > +}
> > +
> >  static struct xe_sched_job *
> >  __xe_bb_create_job(struct xe_exec_queue *q, struct xe_bb *bb, u64 *addr)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
> > index fafacd73dcc3..32c9c4c5d2be 100644
> > --- a/drivers/gpu/drm/xe/xe_bb.h
> > +++ b/drivers/gpu/drm/xe/xe_bb.h
> > @@ -13,8 +13,11 @@ struct dma_fence;
> >  struct xe_gt;
> >  struct xe_exec_queue;
> >  struct xe_sched_job;
> > +enum xe_sriov_vf_ccs_rw_ctxs;
> >  
> >  struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 size, bool usm);
> > +struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> > +			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
> >  struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
> >  				      struct xe_bb *bb);
> >  struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 4e39188a021a..beaf8544bf08 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -31,6 +31,7 @@
> >  #include "xe_pxp.h"
> >  #include "xe_res_cursor.h"
> >  #include "xe_shrinker.h"
> > +#include "xe_sriov_vf_ccs.h"
> >  #include "xe_trace_bo.h"
> >  #include "xe_ttm_stolen_mgr.h"
> >  #include "xe_vm.h"
> > @@ -947,6 +948,20 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> >  	dma_fence_put(fence);
> >  	xe_pm_runtime_put(xe);
> >  
> > +	/*
> > +	 * CCS meta data is migrated from TT -> SMEM. So, let us detach the
> > +	 * BBs from BO as it is no longer needed.
> > +	 */
> > +	if (IS_VF_CCS_BB_VALID(xe, bo) && old_mem_type == XE_PL_TT &&
> > +	    new_mem->mem_type == XE_PL_SYSTEM)
> > +		xe_sriov_vf_ccs_detach_bo(bo);
> > +
> > +	if (IS_SRIOV_VF(xe) &&
> > +	    ((move_lacks_source && new_mem->mem_type == XE_PL_TT) ||
> > +	     (old_mem_type == XE_PL_SYSTEM && new_mem->mem_type == XE_PL_TT)) &&
> > +	    handle_system_ccs)
> > +		ret = xe_sriov_vf_ccs_attach_bo(bo);
> > +
> 
> You don't check the 'ret' value of xe_sriov_vf_ccs_attach_bo. That seems be an oversight.
> 
> >  out:
> >  	if ((!ttm_bo->resource || ttm_bo->resource->mem_type == XE_PL_SYSTEM) &&
> >  	    ttm_bo->ttm) {
> > @@ -957,6 +972,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> >  		if (timeout < 0)
> >  			ret = timeout;
> >  
> > +		if (IS_VF_CCS_BB_VALID(xe, bo))
> > +			xe_sriov_vf_ccs_detach_bo(bo);
> > +
> >  		xe_tt_unmap_sg(xe, ttm_bo->ttm);
> >  	}
> >  
> > @@ -1483,9 +1501,14 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
> >  
> >  static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
> >  {
> > +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> > +
> >  	if (!xe_bo_is_xe_bo(ttm_bo))
> >  		return;
> >  
> > +	if (IS_VF_CCS_BB_VALID(ttm_to_xe_device(ttm_bo->bdev), bo))
> > +		xe_sriov_vf_ccs_detach_bo(bo);
> > +
> >  	/*
> >  	 * Object is idle and about to be destroyed. Release the
> >  	 * dma-buf attachment.
> > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> > index eb5e83c5f233..642e519fcfd1 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > @@ -78,6 +78,9 @@ struct xe_bo {
> >  	/** @ccs_cleared */
> >  	bool ccs_cleared;
> >  
> > +	/** @bb_ccs_rw: BB instructions of CCS read/write. Valid only for VF */
> > +	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
> > +
> >  	/**
> >  	 * @cpu_caching: CPU caching mode. Currently only used for userspace
> >  	 * objects. Exceptions are system memory on DGFX, which is always
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index 8f8e9fdfb2a8..c730b34071ad 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -940,6 +940,136 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> >  	return fence;
> >  }
> >  
> > +/**
> > + * xe_migrate_ccs_rw_copy() - Copy content of TTM resources.
> > + * @m: The migration context.
> > + * @src_bo: The buffer object @src is currently bound to.
> > + * @read_write : Creates BB commands for CCS read/write.
> > + *
> > + * Creates batch buffer instructions to copy CCS metadata from CCS pool to
> > + * memory and vice versa.
> > + *
> > + * This function should only be called for IGPU.
> > + *
> > + * Return: 0 if successful, negative error code on failure.
> > + */
> > +int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
> > +			   struct xe_bo *src_bo,
> > +			   enum xe_sriov_vf_ccs_rw_ctxs read_write)
> > +
> > +{
> > +	bool src_is_pltt = read_write == XE_SRIOV_VF_CCS_WRITE_CTX;
> > +	bool dst_is_pltt = read_write == XE_SRIOV_VF_CCS_READ_CTX;
> > +	struct ttm_resource *src = src_bo->ttm.resource;
> > +	struct xe_gt *gt = m->tile->primary_gt;
> > +	u32 batch_size, batch_size_allocated;
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	struct xe_res_cursor src_it, ccs_it;
> > +	u64 size = src_bo->size;
> > +	struct xe_bb *bb = NULL;
> > +	u64 src_L0, src_L0_ofs;
> > +	u32 src_L0_pt;
> > +	int err;
> > +
> > +	xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &src_it);
> > +
> > +	xe_res_first_sg(xe_bo_sg(src_bo), xe_bo_ccs_pages_start(src_bo),
> > +			PAGE_ALIGN(xe_device_ccs_bytes(xe, size)),
> > +			&ccs_it);
> > +
> > +	/* Calculate Batch buffer size */
> > +	batch_size = 0;
> > +	while (size) {
> > +		batch_size += 6; /* Flush + 2 NOP */
> > +		u64 ccs_ofs, ccs_size;
> > +		u32 ccs_pt;
> > +
> > +		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> > +
> > +		src_L0 = min_t(u64, max_mem_transfer_per_pass(xe), size);
> > +
> > +		batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
> > +					      &src_L0_ofs, &src_L0_pt, 0, 0,
> > +					      avail_pts);
> > +
> > +		ccs_size = xe_device_ccs_bytes(xe, src_L0);
> > +		batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
> > +					      &ccs_pt, 0, avail_pts, avail_pts);
> > +		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
> > +
> > +		/* Add copy commands size here */
> > +		batch_size += EMIT_COPY_CCS_DW;
> > +
> > +		size -= src_L0;
> > +	}
> > +
> > +	bb = xe_bb_ccs_new(gt, batch_size, read_write);
> > +	if (IS_ERR(bb)) {
> > +		drm_err(&xe->drm, "BB allocation failed.\n");
> > +		err = PTR_ERR(bb);
> > +		goto err_ret;
> > +	}
> > +
> > +	batch_size_allocated = batch_size;
> > +	size = src_bo->size;
> > +	batch_size = 0;
> > +
> > +	/*
> > +	 * Emit PTE and copy commands here.
> > +	 * The CCS copy command can only support limited size. If the size to be
> > +	 * copied is more than the limit, divide copy into chunks. So, calculate
> > +	 * sizes here again before copy command is emitted.
> > +	 */
> > +	while (size) {
> > +		batch_size += 6; /* Flush + 2 NOP */
> > +		u32 flush_flags = 0;
> > +		u64 ccs_ofs, ccs_size;
> > +		u32 ccs_pt;
> > +
> > +		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> > +
> > +		src_L0 = xe_migrate_res_sizes(m, &src_it);
> > +
> > +		batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
> > +					      &src_L0_ofs, &src_L0_pt, 0, 0,
> > +					      avail_pts);
> > +
> > +		ccs_size = xe_device_ccs_bytes(xe, src_L0);
> > +		batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
> > +					      &ccs_pt, 0, avail_pts, avail_pts);
> > +		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
> > +		batch_size += EMIT_COPY_CCS_DW;
> > +
> > +		emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
> > +
> > +		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> > +
> > +		bb->cs[bb->len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > +					MI_FLUSH_IMM_DW;
> > +		bb->cs[bb->len++] = MI_NOOP;
> > +		bb->cs[bb->len++] = MI_NOOP;
> > +
> > +		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> > +						  src_L0_ofs, dst_is_pltt,
> > +						  src_L0, ccs_ofs, true);
> > +
> > +		bb->cs[bb->len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > +					MI_FLUSH_IMM_DW | flush_flags;

Missed this - you don't need MI_INVALIDATE_TLB here, just after emitting
the PTEs. I believe that should speedup this copy a little too.

This also looks wrong in emit_migration_job_gen12 too. Going to follow
up on this now.

Matt

> > +		bb->cs[bb->len++] = MI_NOOP;
> > +		bb->cs[bb->len++] = MI_NOOP;
> > +
> > +		size -= src_L0;
> > +	}
> > +
> > +	xe_assert(xe, (batch_size_allocated == bb->len));
> > +	src_bo->bb_ccs[read_write] = bb;
> > +
> > +	return 0;
> > +
> > +err_ret:
> > +	return err;
> > +}
> > +
> >  static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> >  				 u32 size, u32 pitch)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> > index fb9839c1bae0..96b0449e7edb 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > @@ -24,6 +24,8 @@ struct xe_vm;
> >  struct xe_vm_pgtable_update;
> >  struct xe_vma;
> >  
> > +enum xe_sriov_vf_ccs_rw_ctxs;
> > +
> >  /**
> >   * struct xe_migrate_pt_update_ops - Callbacks for the
> >   * xe_migrate_update_pgtables() function.
> > @@ -112,6 +114,10 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> >  				  struct ttm_resource *dst,
> >  				  bool copy_only_ccs);
> >  
> > +int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
> > +			   struct xe_bo *src_bo,
> > +			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
> > +
> >  int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
> >  			     unsigned long offset, void *buf, int len,
> >  			     int write);
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > index ff5ad472eb96..242a3da1ef27 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include "instructions/xe_mi_commands.h"
> >  #include "instructions/xe_gpu_commands.h"
> > +#include "xe_bb.h"
> >  #include "xe_bo.h"
> >  #include "xe_device.h"
> >  #include "xe_migrate.h"
> > @@ -208,3 +209,74 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
> >  err_ret:
> >  	return err;
> >  }
> > +
> > +/**
> > + * xe_sriov_vf_ccs_attach_bo - Insert CCS read write commands in the BO.
> > + * @bo: the &buffer object to which batch buffer commands will be added.
> > + *
> > + * This function shall be called only by VF. It inserts the PTEs and copy
> > + * command instructions in the BO by calling xe_migrate_ccs_rw_copy()
> > + * function.
> > + *
> > + * Returns: 0 if successful, negative error code on failure.
> > + */
> > +int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
> > +{
> > +	struct xe_device *xe = xe_bo_device(bo);
> > +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> > +	struct xe_migrate *migrate;
> > +	struct xe_tile *tile;
> > +	struct xe_bb *bb;
> > +	int tile_id;
> > +	int err = 0;
> > +
> > +	if (!IS_VF_CCS_READY(xe))
> > +		return 0;
> > +
> > +	for_each_tile(tile, xe, tile_id) {
> 
> Same comment as patch 1, I'd avoid for_each_tile and rather use
> xe_device_get_root_tile.
> 
> > +		for_each_ccs_rw_ctx(ctx_id) {
> > +			bb = bo->bb_ccs[ctx_id];
> > +			/* bb should be NULL here. Assert if not NULL */
> > +			xe_assert(xe, !bb);
> > +
> > +			migrate = tile->sriov.vf.ccs[ctx_id].migrate;
> > +			err = xe_migrate_ccs_rw_copy(migrate, bo, ctx_id);
> > +		}
> > +	}
> > +	return err;
> > +}
> > +
> > +/**
> > + * xe_sriov_vf_ccs_detach_bo - Remove CCS read write commands from the BO.
> > + * @bo: the &buffer object from which batch buffer commands will be removed.
> > + *
> > + * This function shall be called only by VF. It removes the PTEs and copy
> > + * command instructions from the BO. Make sure to update the BB with MI_NOOP
> > + * before freeing.
> > + *
> > + * Returns: 0 if successful.
> > + */
> > +int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
> > +{
> > +	struct xe_device *xe = xe_bo_device(bo);
> > +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> > +	struct xe_bb *bb;
> > +	struct xe_tile *tile;
> > +	int tile_id;
> > +
> > +	if (!IS_VF_CCS_READY(xe))
> > +		return 0;
> > +
> > +	for_each_tile(tile, xe, tile_id) {
> 
> Same here.
> 
> Matt
> 
> > +		for_each_ccs_rw_ctx(ctx_id) {
> > +			bb = bo->bb_ccs[ctx_id];
> > +			if (!bb)
> > +				continue;
> > +
> > +			memset(bb->cs, MI_NOOP, bb->len * sizeof(u32));
> > +			xe_bb_free(bb, NULL);
> > +			bo->bb_ccs[ctx_id] = NULL;
> > +		}
> > +	}
> > +	return 0;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> > index 5df9ba028d14..5d5e4bd25904 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> > @@ -7,7 +7,10 @@
> >  #define _XE_SRIOV_VF_CCS_H_
> >  
> >  struct xe_device;
> > +struct xe_bo;
> >  
> >  int xe_sriov_vf_ccs_init(struct xe_device *xe);
> > +int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
> > +int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> > index 6dc279d206ec..e240f3fd18af 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> > @@ -27,6 +27,14 @@ enum xe_sriov_vf_ccs_rw_ctxs {
> >  	XE_SRIOV_VF_CCS_CTX_COUNT
> >  };
> >  
> > +#define IS_VF_CCS_BB_VALID(xe, bo) ({ \
> > +		struct xe_device *___xe = (xe); \
> > +		struct xe_bo *___bo = (bo); \
> > +		IS_SRIOV_VF(___xe) && \
> > +		___bo->bb_ccs[XE_SRIOV_VF_CCS_READ_CTX] && \
> > +		___bo->bb_ccs[XE_SRIOV_VF_CCS_WRITE_CTX]; \
> > +		})
> > +
> >  struct xe_migrate;
> >  struct xe_sa_manager;
> >  
> > -- 
> > 2.43.0
> > 
