Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA880C71157
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 02:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0AA10E1A7;
	Wed, 18 Jun 2025 02:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O0WNpPJ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3668D10E0B4
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Jun 2025 02:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750212888; x=1781748888;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RCas/r6AnUEOE1spKAllLICkCBS/O5KqUNUOp3VzudI=;
 b=O0WNpPJ3IoxnRJCWn+b4NYCgxpffHLQdSqVCiSBkt51IZxJBjC5XoK11
 aMLT6/JmUotgN/jKYfjApnUyJwekgw9Vu8Uj70WFTxDuXnA7JlAYHie+6
 eOR8U87uCdOo6ga35H9wtj29++aUcGKWBDeFXUlzMGRs3nf/xDiHUvbcp
 7JURsagqf68vonUzKM2NW6ydfhfE3xLC8+U2Lb4FUWGtgo0lUf3um4dZB
 y8Zba1r6ZnKZ5i7/wjaM2Ew+EhruOX8Z+UQ8MoLiYxIx2hi3G037V+/Lq
 bD4PjGym0Z6UFTGuV22uMksfvlDo0sz8T5Gvp+C89begWMModSqslE+jb A==;
X-CSE-ConnectionGUID: jlGzu1lqQAeA2O1KuXzhAQ==
X-CSE-MsgGUID: 2owtwFOAQTynU9+l5O0ZAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52277913"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="52277913"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 19:14:47 -0700
X-CSE-ConnectionGUID: dKZQUeHQTzyHnlUackn+EQ==
X-CSE-MsgGUID: 6zhy6cspRs+jBB2ljj3GCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="153780131"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 19:14:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 19:14:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 19:14:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.45)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 19:14:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B155ODh9M5blsQc8DdX9oPtGMHLAd560o0QLegVwCdkk8JLDEHRXnL2U9VZcjoqalPVb4KC+KfuEYieVwti+o0iDRmbyDzRkxYEThtzQAzF24F1y5hnlqPLDpHc0LX803ZyJdAHhwbR7EuF99ej5uoo8QhCr/F/hifSzKwXdQkcCYGBXtAcAx522xzslrKVCOj7r2HoJ078rI6VJwFpru4EJgZ/zNBg/ZMJg9tgYqy0MfOWU0YONqmIOZrfnhMFjU/wkp2d2GUtyNAfkDwotO3YbN6NtN0pkamErSCKqisttSG6Q6P+4N9XpqoMX77ADaURbwaymHpCRmTdmzpGi8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQBJjZy8to/OHZ2b0ZP+TVwSlLBj45ZIGY46CFx5cMI=;
 b=k4qzhwe05EJYqMLzBjaF1gshnCAlRCwJrVhJKyp8qY5SUSrg1w2VoGR3fJVHozo7W0V13hgtFOom6hzEkZKmsaRTLROBDtRpWZ9h76+kbq62n+dk89VNQ7XnxqD6TRZgc4SVzk1cEiOfXEeNy/w6ZAiJyirwwtpE4EK4Y2ReQuuC7k49gd8EqR1X3ynGfLgG+aeKTdAoiWZVOn7wlx4guFmeQpyt/nqQwVPuqAAT6gKu1//gUpDkQaJUFjOcuUYSrJCIk8chQgMBIQpbVHww22WZdzpY1MM7ofyS9mLrp5eJ8Su9BLZxMyjJMtltCjdFuRs+nGd4lzRM8HzGzHTY/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7541.namprd11.prod.outlook.com (2603:10b6:510:26d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 02:14:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 02:14:43 +0000
Date: Tue, 17 Jun 2025 19:16:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Tomasz Lis <tomasz.lis@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v7 1/3] drm/xe/vf: Create contexts for CCS read write
Message-ID: <aFIhdOgcReZgfLhi@lstrano-desk.jf.intel.com>
References: <20250616150805.26780-1-satyanarayana.k.v.p@intel.com>
 <20250616150805.26780-2-satyanarayana.k.v.p@intel.com>
 <aFH8CvE82sWl0DNd@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFH8CvE82sWl0DNd@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0115.namprd03.prod.outlook.com
 (2603:10b6:303:b7::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: 14b92d7f-1f71-4e7b-bc08-08ddae0de36a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXZGTm5rRnpHbzRqVWFqZXJ5NGZTckkvNWVMVnR1a3paVmE1VFpGTVNidEhr?=
 =?utf-8?B?ajg3YmxNZWVDQ1ZzdVp5RnZ3VnJUNTdDZ1lhcHNQZkJBVVd0Q1UxUlYrNUxG?=
 =?utf-8?B?YTBmM3N6ejg1b1hGaHUvUXRoeDNUdWtHaDR1eUZ6SjdEZ1RYR01SckdCY2tu?=
 =?utf-8?B?eU9kRmE3SjY5LzZ6Mnl6WVBKcVdpenhOSHp2RWxjRmFJa1M3eEZNbXlRankz?=
 =?utf-8?B?NkdGSG1XSHNsRzlMSGNGTEN5cTdYcG9BMHE4TWRveFhUYVFoamYrSjJIa3pQ?=
 =?utf-8?B?OEpmbGJXWEdPQyt5U2tsVkNESU9RM2UxekdMR1h3RmF0ZW5yd24wS1lJZlVE?=
 =?utf-8?B?WXdQbkhBcVlaQ2dOV283WG9ickZMSmFoZnE3WndobG9JZDBqSzdBTVFqOFMx?=
 =?utf-8?B?YUdUbXpMTG54dGIyMHNObjNwNWNOOWt1V3AvWnB2a2NoZUZ2b1hKMWtVYUNR?=
 =?utf-8?B?clJLK1BSYlR6VVg4TkhrVFJnTThmRitsR2R2QVlMM01xRXlCN1hmL2NGWUZO?=
 =?utf-8?B?QUtSQWNkbHNrNzd3OFh0aGNrT2V4ZTc4dk5objJmWVdSV3ZWL0JlSHBRTFVt?=
 =?utf-8?B?Z0RPL3FZS1RLUmRUenFMbThodmhiK0ZzcWJNMnJOa2lwV0ZiT01qcjBFelNh?=
 =?utf-8?B?TG9wWUtWVUNDaFVXb21ZdVQxa3hzd1NYVkhUbmQzNHVMdXh0RngrTVEwbzY0?=
 =?utf-8?B?ZVY3Wmp6SmdkK05Wc2VlK2p2c0ZGcmJzZEhnS3FUSmhidVByT0xiaVgxY2Vq?=
 =?utf-8?B?aXJGNVVmU01COEVKMGZkbklGall5M0w4S2dFZFdlVUc2MGJuTnBSM3ptcGc3?=
 =?utf-8?B?eDlBOTI3SEx6bVh2SUhDdy9zU3IrWitndnhyLy92MVJPMVdMTUJwUW9ZWEVq?=
 =?utf-8?B?REFLRmFndC9seEgwR2RIN2N1ek8yU3YrSEQvNHpVSm1BcnlEUWxOVTVQK055?=
 =?utf-8?B?UHVieURVQi9rdnZTd2pxZ1JaK3d1eDg0a2JLVWs0VUVPTWlOQTlYdjc0cjBy?=
 =?utf-8?B?S2N5YncrZ3dGUWxSZTNrV0hvSTREc1RPa08xNUZ1eE82bVFwNS9zT2s5SCts?=
 =?utf-8?B?dUYrM29oMzQ5RUFqd0NPeWE3Y2xmVzZ2aXVnM3BRZ1c5VUVBQ2hqTmU1ck5Z?=
 =?utf-8?B?cUgzMHRaU2VHc1JOaXlISGJLa1pjRnd1RGFaWUZGM3lUQlRqd3VMZ0JTVEpi?=
 =?utf-8?B?R0haWmVFeVYvL3BoQ0ozMjZZOE1va0M4b0Qyd0xzejNkY0lXWlhQRmt5SkU0?=
 =?utf-8?B?UE9wSmRwaks4TDdicG82RDhXUnJMM0ZWSTc1ZWVuaG05WDMxWGlTZkltMDlp?=
 =?utf-8?B?RmRMUFZoaGc3VTRTQmh4TUg3YWFXK0pzNjJ4cHpJV2wyNGlxVGtoT29leE82?=
 =?utf-8?B?L2UxdG1aTjB5Vnh3WS9iU1JYZ0d3YlhXUHhwd0xtbk94U1RvTkJtK0E4WjB0?=
 =?utf-8?B?ZnB0eFJkZStPQXNhRnNtYVQ0YzAxU2ZuRzlJYVhLMGxMYlJSUkltWWxaanlJ?=
 =?utf-8?B?b2tPYUNpMCtTTDFPTXY1Sk13WFU0TUZzWmdod2JLa2d0R0xEQlJaaTByOHo2?=
 =?utf-8?B?aHh6cDhnc1htNWhXSXZHRCtnUVNSWGNxTFdJUFB3U0VKZ2ZDQityUEFPZU5K?=
 =?utf-8?B?aEppbjVHd1VBNFFXdjFYWHpGZ0w4Sy9rb3c5VWVYbEthR2ZWYkhLcEtnZ0FX?=
 =?utf-8?B?b0QyeFF4QU4vWTNrQlIzanBFWThvb0hNRFBQZzI4NmlzMWJTMFRpZWUzSEwx?=
 =?utf-8?B?SGI2WmoyUXhVSXNjbTRkM1QwaldnYi85Rld0Uy9oTkQ4OEFUdVF0TkJDS1NQ?=
 =?utf-8?B?MS8rMG9RY3IxY1VoSlRscDhLbkJ5WjRDc1FYTkJGeW9vMWVCL3oxbEV4SDAv?=
 =?utf-8?B?MUpudmZzZ3dXdmt5dmNPN1FucGV0YzVrbDNIYk5DNzJDd3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE9RK0JxMUtDa3pjRFJyNU1pR21nZVo4RE5sNlV0cXlMd2ZNTmxHSVlmeFlL?=
 =?utf-8?B?QUE4R25MeWEvemtTU0hDWDUrdmR3QXRtcWxKMWRhR21pbDRLa2tFUGtTTUxX?=
 =?utf-8?B?OUh1Y1d4K3NHMnhOSmRTSjBtNkZZUlY1WGk3YTY1QW5IMkFrNzNxTEo1NU9z?=
 =?utf-8?B?V0lydnJwUUlvN1RwTU4rNnZ5MU1wVEpSdkRadW8xZmlsNU9zdTVsNThuZFVr?=
 =?utf-8?B?QWcxdHpMQTVyV2VFZlFRWnhvek1IMDBKSGh4YUhvaTBoeEN0bi9zRmluRUE1?=
 =?utf-8?B?SVVOckVRRDFnc2dSVVZvZndCMTdDZUJjK0JqbHVXeUhUSER1RCtkT3lMZWp5?=
 =?utf-8?B?ZmtIQ2d5WUNsVVhnaC9mcE1SdHpCNmEzQ1NQOXRjSjhtaGRCWGVERDhlNFVv?=
 =?utf-8?B?NEIwR0l1cEVtVGpSaTBMc0xTcXVQMHdQVE5YY3g3Z2gwVEUyMFU4UkQ2a01J?=
 =?utf-8?B?V1VCbUFjZVZSQkZlbnBpZnBSWmRiZkhrclhFNERBK2wxUWtxMjZFdThJQkc4?=
 =?utf-8?B?TWJPdXl0MXl6a2I3Qy9PWkpNTTVmR001T0FJTWJESEtxbEhaQmxLNGlOc0Zz?=
 =?utf-8?B?VDlWdVlFeG4rSnc5RkNmTWJLR2R3REhpMnVCMDVEdEdvRzBOTnRobDZCdWxQ?=
 =?utf-8?B?UGNxMzVrZGZFTFN2NzM1ZG1odzJiYlp2NnBYeU1LY252R2dkeTdRTTNuUnEz?=
 =?utf-8?B?NXRTa3RqdEZFamFhblpSYnhzZE1RYThFUENyNFhlSFBNUk80Q1JKdkhHOVVP?=
 =?utf-8?B?dEVyN2RCRWVCcVlaTVZlcjZrd2JFNUl1aUc1cTVGSm9nc0c2clhLaFR2NFV3?=
 =?utf-8?B?QjBUSUVNanYwbEUwM2hyc0g2cVVObzRXakJxT25BNFBlUi9zR3JTUGl6NU9n?=
 =?utf-8?B?ZVY2a1pwRFdneitVTWRWdkc0Slc5Zk5Gckl2WUY2M0ZpTXV5UjNEVDk0b0Vo?=
 =?utf-8?B?M3RHUlM3R0FIZFU4OFNzQ1Juc2tXSFhIWFJRY1oyeGpkYVNJVzFUbFFrbytS?=
 =?utf-8?B?c1FwbHNrcE9CZ01hVzkxa0Q3aDFlRmxEUkIrSTZYWHZVVExTUkNQdG5tU0tH?=
 =?utf-8?B?dmxZTWkxNTVtdWNJb2FNUURjZUdMT1J6TjlTcDQ3NzU0MzYwVFQxbDJySTV4?=
 =?utf-8?B?OFFEU0RRVk4xTXNLbzdOdEFaMmk0SHAzZE0vM0NSNHVSMFc0YXlmL3RCV0tW?=
 =?utf-8?B?YW5QeFFjZjZhSnNjc2FQVlU0b3NVUCs5VjExQmtlbG9iazZtSHlNZTc4eThM?=
 =?utf-8?B?dGI1VW5FbldSZWhUZTI3ZVA1clhkUFdjcVVJdzVpZ0Y2TlJCNUo4QUJoWGZl?=
 =?utf-8?B?c3lJT0s5QmdIZHA3OHFud0lrVlVOcFVFMURqaWhTY3hLQ1pMVyswVnVadnBx?=
 =?utf-8?B?aVh2SzBEbk9UL2w2dVE4bU90NlMrYXVHbWJndzVoMzUzVWZwVVZ3R0JOOEEx?=
 =?utf-8?B?ZVErZ2FGWnBERGV4MzJ3MHFsaDhVa0ZKZmdobkh4VFF5THdDSUJnSTQ0TUdp?=
 =?utf-8?B?V3MxaVlLclk4c1RFZDVxTVZzM2ZIRStVYWZ6ZmVUN2VXb2tzWm1maXFqcmp2?=
 =?utf-8?B?V21ZeUIvZzNMZjdITENtcDdVaE1ZamdNSnFrbTBSbEJ2REd4b0N1YjY4Yjkw?=
 =?utf-8?B?QkFYbWtHMzd1Wm1CMWE4RkFod3hsSVhla0tZVUlESzlUZVdpZDdXRGF0OWkr?=
 =?utf-8?B?Y0Ntbk1yenJIVEkrcWZ2RURQQnBKV0JrQkNnb0M5bFd1YVZMcDFOdVpIT1FO?=
 =?utf-8?B?cGM3dUVsVXFNeWtJT2MrL0lTdk9DN1d5WmxjWFFuY3dNL2xoZ25zdW5XajR3?=
 =?utf-8?B?MzZ2aDhmQ1NsNGFNSVVEZzJWQ0RYQlM3UUxJNU5lQ2wzYlJTMHJKTjN6Wnhi?=
 =?utf-8?B?ZHY1UHd0THFlOVhyNWtqc09lUERKcmdZWHBaa25JbGJHTWhpVlFGMHRKbVdw?=
 =?utf-8?B?QithRHVLaHhPWHRZWW5lS3BVb0M4aE5WVE1jYmlkam40aG9SS0ZFWjlEUzZF?=
 =?utf-8?B?eEVzeHdaZGxzcTJqb255VVh0akpZem9ieXpucWxISnh4b1BJVU9HVGpyK2VC?=
 =?utf-8?B?SkRGWks4QUZKVkpMMXA1azQ3MTJyZlZkemJWTmNrUFdzd0Z1TkR3SDBmbXll?=
 =?utf-8?B?ZDU4eDdLWWpGSmZBcytwTnBUSEQyOUJQSk1FMkl0S1l1eDFFczhLbytyckRj?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b92d7f-1f71-4e7b-bc08-08ddae0de36a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 02:14:43.2033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2jgv7sECw242dd+89dh8oVSu9GVG6Kw7F/PliZlIC6SmLrWYCv/VPfoKyxfjK+9cgqOp7ELB7TZ1Y47vhuMbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7541
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

On Tue, Jun 17, 2025 at 04:36:42PM -0700, Matthew Brost wrote:
> On Mon, Jun 16, 2025 at 08:38:03PM +0530, Satyanarayana K V P wrote:
> > Create two LRCs to handle CCS meta data read / write from CCS pool in the
> > VM. Read context is used to hold GPU instructions to be executed at save
> > time and write context is used to hold GPU instructions to be executed at
> > the restore time.
> > 
> > Allocate batch buffer pool using suballocator for both read and write
> > contexts.
> > 
> > Migration framework is reused to create LRCAs for read and write.
> > 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> > Cc: Tomasz Lis <tomasz.lis@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > 
> > V6 -> V7:
> > - Fixed review comments (Michal Wajdeczko & Matthew Brost).
> > 
> > V5 -> V6:
> > - Added id field in the xe_tile_vf_ccs structure for self identification.
> > 
> > V4 -> V5:
> > - Modified read/write contexts to enums from #defines (Matthew Brost).
> > - The CCS BB pool size is calculated based on the system memory size (Michal
> > Wajdeczko & Matthew Brost).
> > 
> > V3 -> V4:
> > - Fixed issues reported by patchworks.
> > 
> > V2 -> V3:
> > - Added new variable which denotes the initialization of contexts.
> > 
> > V1 -> V2:
> > - Fixed review comments.
> > ---
> >  drivers/gpu/drm/xe/Makefile                |   1 +
> >  drivers/gpu/drm/xe/xe_device.c             |   4 +
> >  drivers/gpu/drm/xe/xe_device_types.h       |   4 +
> >  drivers/gpu/drm/xe/xe_gt_debugfs.c         |  36 ++++
> >  drivers/gpu/drm/xe/xe_sriov.c              |  19 ++
> >  drivers/gpu/drm/xe/xe_sriov.h              |   1 +
> >  drivers/gpu/drm/xe/xe_sriov_types.h        |   5 +
> >  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 210 +++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  13 ++
> >  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  45 +++++
> >  10 files changed, 338 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> >  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index f5f5775acdc0..3b5241937742 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -140,6 +140,7 @@ xe-y += \
> >  	xe_memirq.o \
> >  	xe_sriov.o \
> >  	xe_sriov_vf.o \
> > +	xe_sriov_vf_ccs.o \
> >  	xe_tile_sriov_vf.o
> >  
> >  xe-$(CONFIG_PCI_IOV) += \
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 7e87344943cd..c45f105eab0e 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -926,6 +926,10 @@ int xe_device_probe(struct xe_device *xe)
> >  
> >  	xe_vsec_init(xe);
> >  
> > +	err = xe_sriov_late_init(xe);
> > +	if (err)
> > +		goto err_unregister_display;
> > +
> >  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
> >  
> >  err_unregister_display:
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index ac27389ccb8b..b932b679b40e 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -22,6 +22,7 @@
> >  #include "xe_pmu_types.h"
> >  #include "xe_pt_types.h"
> >  #include "xe_sriov_types.h"
> > +#include "xe_sriov_vf_ccs_types.h"
> >  #include "xe_step_types.h"
> >  #include "xe_survivability_mode_types.h"
> >  #include "xe_ttm_vram_mgr_types.h"
> > @@ -234,6 +235,9 @@ struct xe_tile {
> >  		struct {
> >  			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
> >  			struct xe_ggtt_node *ggtt_balloon[2];
> > +
> > +			/** @sriov.vf.ccs: CCS read and write contexts for VF. */
> > +			struct xe_tile_vf_ccs ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
> >  		} vf;
> >  	} sriov;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > index 848618acdca8..404844515523 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > @@ -134,6 +134,30 @@ static int sa_info(struct xe_gt *gt, struct drm_printer *p)
> >  	return 0;
> >  }
> >  
> > +static int sa_info_vf_ccs(struct xe_gt *gt, struct drm_printer *p)
> > +{
> > +	struct xe_tile *tile = gt_to_tile(gt);
> > +	struct xe_sa_manager *bb_pool;
> > +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> > +
> > +	if (!IS_VF_CCS_READY(gt_to_xe(gt)))
> > +		return 0;
> > +
> > +	xe_pm_runtime_get(gt_to_xe(gt));
> > +
> > +	for_each_ccs_rw_ctx(ctx_id) {
> > +		drm_printf(p, "ccs %s bb suballoc info\n", ctx_id ? "write" : "read");
> > +		drm_printf(p, "-------------------------\n");
> > +		bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
> > +		drm_suballoc_dump_debug_info(&bb_pool->base, p, bb_pool->gpu_addr);
> > +		drm_puts(p, "\n");
> > +	}
> > +
> > +	xe_pm_runtime_put(gt_to_xe(gt));
> > +
> > +	return 0;
> > +}
> > +
> >  static int topology(struct xe_gt *gt, struct drm_printer *p)
> >  {
> >  	xe_pm_runtime_get(gt_to_xe(gt));
> > @@ -303,6 +327,13 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
> >  	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
> >  };
> >  
> > +/*
> > + * only for GT debugfs files which are valid on VF. Not valid on PF.
> > + */
> > +static const struct drm_info_list vf_only_debugfs_list[] = {
> > +	{"sa_info_vf_ccs", .show = xe_gt_debugfs_simple_show, .data = sa_info_vf_ccs},
> > +};
> > +
> >  /* everything else should be added here */
> >  static const struct drm_info_list pf_only_debugfs_list[] = {
> >  	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
> > @@ -419,6 +450,11 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
> >  		drm_debugfs_create_files(pf_only_debugfs_list,
> >  					 ARRAY_SIZE(pf_only_debugfs_list),
> >  					 root, minor);
> > +	else
> > +		drm_debugfs_create_files(vf_only_debugfs_list,
> > +					 ARRAY_SIZE(vf_only_debugfs_list),
> > +					 root, minor);
> > +
> >  
> >  	xe_uc_debugfs_register(&gt->uc, root);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> > index a0eab44c0e76..87911fb4eea7 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov.c
> > @@ -15,6 +15,7 @@
> >  #include "xe_sriov.h"
> >  #include "xe_sriov_pf.h"
> >  #include "xe_sriov_vf.h"
> > +#include "xe_sriov_vf_ccs.h"
> >  
> >  /**
> >   * xe_sriov_mode_to_string - Convert enum value to string.
> > @@ -157,3 +158,21 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)
> >  		strscpy(buf, "PF", size);
> >  	return buf;
> >  }
> > +
> > +/**
> > + * xe_sriov_late_init() - SR-IOV late initialization functions.
> > + * @xe: the &xe_device to initialize
> > + *
> > + * On VF this function will initialize code for CCS migration.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_late_init(struct xe_device *xe)
> > +{
> > +	int err = 0;
> > +
> > +	if (IS_VF_CCS_INIT_NEEDED(xe))
> > +		err = xe_sriov_vf_ccs_init(xe);
> > +
> > +	return err;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
> > index 688fbabf08f1..0e0c1abf2d14 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov.h
> > @@ -18,6 +18,7 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t len);
> >  void xe_sriov_probe_early(struct xe_device *xe);
> >  void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
> >  int xe_sriov_init(struct xe_device *xe);
> > +int xe_sriov_late_init(struct xe_device *xe);
> >  
> >  static inline enum xe_sriov_mode xe_device_sriov_mode(const struct xe_device *xe)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
> > index ca94382a721e..8abfdb2c5ead 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_types.h
> > @@ -71,6 +71,11 @@ struct xe_device_vf {
> >  		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
> >  		unsigned long gt_flags;
> >  	} migration;
> > +
> > +	struct {
> > +		/** @initialized: Initilalization of vf ccs is completed or not */
> > +		bool initialized;
> > +	} ccs;
> >  };
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > new file mode 100644
> > index 000000000000..ff5ad472eb96
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > @@ -0,0 +1,210 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#include "instructions/xe_mi_commands.h"
> > +#include "instructions/xe_gpu_commands.h"
> > +#include "xe_bo.h"
> > +#include "xe_device.h"
> > +#include "xe_migrate.h"
> > +#include "xe_sa.h"
> > +#include "xe_sriov_printk.h"
> > +#include "xe_sriov_vf_ccs.h"
> > +#include "xe_sriov_vf_ccs_types.h"
> > +
> > +/**
> > + * DOC: VF save/restore of compression Meta Data
> > + *
> > + * VF KMD registers two special contexts/LRCAs.
> > + *
> > + * Save Context/LRCA: contain necessary cmds+page table to trigger Meta data /
> > + * compression control surface (Aka CCS) save in regular System memory in VM.
> > + *
> > + * Restore Context/LRCA: contain necessary cmds+page table to trigger Meta data /
> > + * compression control surface (Aka CCS) Restore from regular System memory in
> > + * VM to corresponding CCS pool.
> > + *
> > + * Below diagram explain steps needed for VF save/Restore of compression Meta Data::
> > + *
> > + *    CCS Save    CCS Restore          VF KMD                          Guc       BCS
> > + *     LRCA        LRCA
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |         |
> > + *      |     Create Save LRCA            |                              |         |
> > + *     [ ]<----------------------------- [ ]                             |         |
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |         |
> > + *      |           |                     |       Register save LRCA     |         |
> > + *      |           |                     |           with Guc           |         |
> > + *      |           |                    [ ]--------------------------->[ ]        |
> > + *      |           |                     |                              |         |
> > + *      |           | Create restore LRCA |                              |         |
> > + *      |          [ ]<------------------[ ]                             |         |
> > + *      |           |                     |                              |         |
> > + *      |           |                     |       Register restore LRCA  |         |
> > + *      |           |                     |           with Guc           |         |
> > + *      |           |                    [ ]--------------------------->[ ]        |
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |         |
> > + *      |           |                    [ ]-------------------------    |         |
> > + *      |           |                    [ ]  Allocate main memory.  |   |         |
> > + *      |           |                    [ ]  Allocate CCS memory.   |   |         |
> > + *      |           |                    [ ]  Update Main memory &   |   |         |
> > + *     [ ]<------------------------------[ ]  CCS pages PPGTT + BB   |   |         |
> > + *      |          [ ]<------------------[ ]  cmds to save & restore.|   |         |
> > + *      |           |                    [ ]<------------------------    |         |
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |         |
> > + *      :           :                     :                              :         :
> > + *      ---------------------------- VF Paused -------------------------------------
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |Schedule |
> > + *      |           |                     |                              |CCS Save |
> > + *      |           |                     |                              | LRCA    |
> > + *      |           |                     |                             [ ]------>[ ]
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |CCS save |
> > + *      |           |                     |                              |completed|
> > + *      |           |                     |                             [ ]<------[ ]
> > + *      |           |                     |                              |         |
> > + *      :           :                     :                              :         :
> > + *      ---------------------------- VM Migrated -----------------------------------
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |         |
> > + *      :           :                     :                              :         :
> > + *      ---------------------------- VF Resumed ------------------------------------
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |         |
> > + *      |           |                    [ ]--------------               |         |
> > + *      |           |                    [ ] Fix up GGTT  |              |         |
> > + *      |           |                    [ ]<-------------               |         |
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |         |
> > + *      |           |                     |  Notify VF_RESFIX_DONE       |         |
> > + *      |           |                    [ ]--------------------------->[ ]        |
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |Schedule |
> > + *      |           |                     |                              |CCS      |
> > + *      |           |                     |                              |Restore  |
> > + *      |           |                     |                              |LRCA     |
> > + *      |           |                     |                             [ ]------>[ ]
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |CCS      |
> > + *      |           |                     |                              |restore  |
> > + *      |           |                     |                              |completed|
> > + *      |           |                     |                             [ ]<------[ ]
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |         |
> > + *      |           |                     |  VF_RESFIX_DONE complete     |         |
> > + *      |           |                     |       notification           |         |
> > + *      |           |                    [ ]<---------------------------[ ]        |
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |         |
> > + *      :           :                     :                              :         :
> > + *      ------------------------- Continue VM restore ------------------------------
> > + */
> > +
> > +static u64 get_ccs_bb_pool_size(struct xe_device *xe)
> > +{
> > +	u64 sys_mem_size, ccs_mem_size, ptes, bb_pool_size;
> > +	struct sysinfo si;
> > +
> > +	si_meminfo(&si);
> > +	sys_mem_size = si.totalram * si.mem_unit;
> > +	ccs_mem_size = sys_mem_size / NUM_BYTES_PER_CCS_BYTE(xe);
> > +	ptes = DIV_ROUND_UP(sys_mem_size + ccs_mem_size, XE_PAGE_SIZE);
> > +
> > +	/**
> > +	 * We need below BB size to hold PTE mappings and some DWs for copy
> > +	 * command. In reality, we need space for many copy commands. So, let
> > +	 * us allocate double the calculated size which is enough to holds GPU
> > +	 * instructions for the whole region.
> > +	 */
> > +	bb_pool_size = ptes * sizeof(u32);
> > +
> > +	return round_up(bb_pool_size * 2, SZ_1M);
> > +}
> > +
> > +static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
> > +{
> > +	struct xe_device *xe = tile_to_xe(tile);
> > +	struct xe_sa_manager *sa_manager;
> > +	u64 bb_pool_size;
> > +	int offset, err;
> > +
> > +	bb_pool_size = get_ccs_bb_pool_size(xe);
> > +	xe_sriov_info(xe, "Allocating %s CCS BB pool size = %lldMB\n",
> > +		      ctx->ctx_id ? "Restore" : "Save", bb_pool_size / SZ_1M);
> > +
> > +	sa_manager = xe_sa_bo_manager_init(tile, bb_pool_size, SZ_16);
> > +
> > +	if (IS_ERR(sa_manager)) {
> > +		xe_sriov_err(xe, "Suballocator init failed with error: %pe\n",
> > +			     sa_manager);
> > +		err = PTR_ERR(sa_manager);
> > +		return err;
> > +	}
> > +
> > +	offset = 0;
> > +	xe_map_memset(xe, &sa_manager->bo->vmap, offset, MI_NOOP,
> > +		      bb_pool_size);
> > +
> > +	offset = bb_pool_size - sizeof(u32);
> > +	xe_map_wr(xe, &sa_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
> 
> Does this work? I'd expect the prefetch mechanism to fetch into the next
> and fault.
> 
> As I suggest in last patch I think this needs to be:
> 
> offset = bb_pool_size - sizeof(u32) - prefetch_size;
> 
> Then don't allocate the 'sizeof(u32) - prefetch_size' in the SA.
> 

Ignore this. I forgot we have GGTT scratch which makes prefetches ok.

Matt

> Matt
> 
> > +
> > +	ctx->mem.ccs_bb_pool = sa_manager;
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_sriov_vf_ccs_init - Setup LRCA for save & restore.
> > + * @xe: the &xe_device to start recovery on
> > + *
> > + * This function shall be called only by VF. It initializes
> > + * LRCA and suballocator needed for CCS save & restore.
> > + *
> > + * Return: 0 on success. Negative error code on failure.
> > + */
> > +int xe_sriov_vf_ccs_init(struct xe_device *xe)
> > +{
> > +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> > +	struct xe_migrate *migrate;
> > +	struct xe_tile_vf_ccs *ctx;
> > +	struct xe_tile *tile;
> > +	int tile_id, err;
> > +
> > +	xe_assert(xe, IS_SRIOV_VF(xe));
> > +	xe_assert(xe, !IS_DGFX(xe));
> > +	xe_assert(xe, xe_device_has_flat_ccs(xe));
> > +
> > +	for_each_tile(tile, xe, tile_id) {
> > +		for_each_ccs_rw_ctx(ctx_id) {
> > +			ctx = &tile->sriov.vf.ccs[ctx_id];
> > +			ctx->ctx_id = ctx_id;
> > +
> > +			migrate = xe_migrate_init(tile);
> > +			if (IS_ERR(migrate)) {
> > +				err = PTR_ERR(migrate);
> > +				goto err_ret;
> > +			}
> > +			ctx->migrate = migrate;
> > +
> > +			err = alloc_bb_pool(tile, ctx);
> > +			if (err)
> > +				goto err_ret;
> > +		}
> > +	}
> > +
> > +	xe->sriov.vf.ccs.initialized = 1;
> > +
> > +	return 0;
> > +
> > +err_ret:
> > +	return err;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> > new file mode 100644
> > index 000000000000..5df9ba028d14
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_SRIOV_VF_CCS_H_
> > +#define _XE_SRIOV_VF_CCS_H_
> > +
> > +struct xe_device;
> > +
> > +int xe_sriov_vf_ccs_init(struct xe_device *xe);
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> > new file mode 100644
> > index 000000000000..6dc279d206ec
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> > @@ -0,0 +1,45 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_SRIOV_VF_CCS_TYPES_H_
> > +#define _XE_SRIOV_VF_CCS_TYPES_H_
> > +
> > +#define for_each_ccs_rw_ctx(id__) \
> > +	for ((id__) = 0; (id__) < XE_SRIOV_VF_CCS_CTX_COUNT; (id__)++)
> > +
> > +#define IS_VF_CCS_READY(xe) ({ \
> > +		struct xe_device *___xe = (xe); \
> > +		xe_assert(___xe, IS_SRIOV_VF(___xe)); \
> > +		___xe->sriov.vf.ccs.initialized; \
> > +		})
> > +
> > +#define IS_VF_CCS_INIT_NEEDED(xe) ({\
> > +		struct xe_device *___xe = (xe); \
> > +		IS_SRIOV_VF(___xe) && !IS_DGFX(___xe) && \
> > +		xe_device_has_flat_ccs(___xe) && GRAPHICS_VER(___xe) >= 20; \
> > +		})
> > +
> > +enum xe_sriov_vf_ccs_rw_ctxs {
> > +	XE_SRIOV_VF_CCS_READ_CTX,
> > +	XE_SRIOV_VF_CCS_WRITE_CTX,
> > +	XE_SRIOV_VF_CCS_CTX_COUNT
> > +};
> > +
> > +struct xe_migrate;
> > +struct xe_sa_manager;
> > +
> > +struct xe_tile_vf_ccs {
> > +	/** @id: Id to which context it belongs to */
> > +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> > +	/** @migrate: Migration helper for save/restore of CCS data */
> > +	struct xe_migrate *migrate;
> > +
> > +	struct {
> > +		/** @ccs_rw_bb_pool: Pool from which batch buffers are allocated. */
> > +		struct xe_sa_manager *ccs_bb_pool;
> > +	} mem;
> > +};
> > +
> > +#endif
> > -- 
> > 2.43.0
> > 
