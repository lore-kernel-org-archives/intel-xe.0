Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B6FC7115C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 16:08:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3BB10E766;
	Wed, 25 Jun 2025 16:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J7kF2Ep8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2EA10E766
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 16:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750867692; x=1782403692;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2qxFg5JAumg53kkAIg2SyJUnB55JHs4GkOIv1ukYVDw=;
 b=J7kF2Ep88o4DrJ8EoSx+OSaejdfsrkrqDtYWhMjW15bAUevZFmoE8KNj
 uM6zG4F5S0wuQ1e6DpLlPSbX7yJzH2AS5QCQ5mguM/4S/5BBvSaGY3X+H
 p9XcmYe8fRQADmBBlB2sCBGB0AIwktCcP99aDVuzEL5lwFztQwB27JccG
 ie+MRpxP62AWhENKBG8UK5Jq7UUKuUh53FL4WAiaH/LZMq4g6aoUpXmfD
 ztcOktzTj4mpZg7A3l17x3t4lc9gBQsC74qrOe4pEDOr5xYM5zTUKuUyW
 XGvndiPfCxCxPRQmYAKqWbOWAexf7SXMY6JN2CEMVf7sqQwgFyCpzraOJ w==;
X-CSE-ConnectionGUID: +L7kNYUJSy2TXcM9GBJxKg==
X-CSE-MsgGUID: RkEYBqdMTtqhWEQG9ctKuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="52865298"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="52865298"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 09:08:04 -0700
X-CSE-ConnectionGUID: TeM3W6smRC6PR1ikxaBfNg==
X-CSE-MsgGUID: ZYKibX/oSbqXt6yyeNXJXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="158014166"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 09:08:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 09:08:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 09:08:03 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 09:08:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Km7/9dUcpLhYyc136ygz89nO3NDb3uJvDb1DnCTZNEUWvqD3rpo7uO7QgzQcDKv13Y2bZvFTR3+51u/rirZhWPmGDR6PASY4//h3XcrFzK/wN5M5y43h6e4Z6NCKRMCSjzD5t/dNOCTC2F8i7atDSRtEAMgWM/gGBwh/6pa8B9e19qzaS6Ea1sAymWXGE6g4kiCtQvqERFQ6R1SxrNO03tWSKvLBWTx7luE44jBqC0qV/khYeqs3mJyjyy2dcmBQsIEY9baTsmZm69yTHzxBFfDTtSbqfQx4l3awlAE3hspcrq7SawndbFFTdJcT3JfYxzF5HQY6eg/bpLLQtwMmaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0sSBb7/Z58IKpiZcNhoNaJTeDiBBE3WH0fncXPxOVSE=;
 b=idrRtbeGYI9Jy4zkao6NtWwI6ejf+6u9OhCFKb5R9KB8O/gKYwhbJycYHxfqRY7U/BErhh4nCSQ5iWBo40AQqKM9EG+aVwRT1cb/CIoy6h5X+HTo/E6xAqA2JRa4adfd+WchIKkJY7bYjXkKJxIXSnpqotcVFp4WAjqVXoh5Us4E5nH9pk/L7nWNzuCmXlMEy1gr8zENxJp8I/OdsLU2YeNi6xcx3wYYbBC8UE6bH0kYk7uCJxxR+rMq+U8sxFMoNvtqlmdEvc8MRlrqwZnVX8+0uBE+DaivAVHKqNH3wiZcHq6bwDU0eVqcg8edlyrYSP/sVU7WMBiL4mPHCsLKvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CY5PR11MB6281.namprd11.prod.outlook.com (2603:10b6:930:23::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 16:08:00 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Wed, 25 Jun 2025
 16:07:59 +0000
Date: Wed, 25 Jun 2025 18:07:56 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/5] drm/xe/pf: Expose basic info about VFs in debugfs
Message-ID: <20250625160756.l4c5guyunsvehexd@intel.com>
References: <20250624200923.1348-1-michal.wajdeczko@intel.com>
 <20250624200923.1348-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250624200923.1348-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DUZPR01CA0327.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::17) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CY5PR11MB6281:EE_
X-MS-Office365-Filtering-Correlation-Id: b5015489-1893-495b-4973-08ddb4027455
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEFQUXJnMTVoUTFIU1RNK3p3UTdTb3haYnluWVdia3pRd3lIZlk3TXAybDhO?=
 =?utf-8?B?cHVjSnp5OVhXSGZGeVliSDRpcTNXd3pYbzZMcUloYjdGMXowL3FhRUlWc1J5?=
 =?utf-8?B?YUJvZVF1YXpIay91MUwzc3Nxb1N5THRad2x1VFhYUWtHN2ZpbGJjMVJTWFFs?=
 =?utf-8?B?SkVyZWc2UzV0UjZHVENYNWlpSjVzekM2L0ZrQVZEYlJvcWtOUHNqdXJyTWIz?=
 =?utf-8?B?SDIyNmk1bGFCak40aFVxeUI3REoyM20yZUROWXpxRzRSSzR0TjA1VmtFQ2xk?=
 =?utf-8?B?d2VuaFhTODNRUDVVaDNPckVXRkZXUm84SmVrVFhyV0VONGh2SjFMaURRejR6?=
 =?utf-8?B?SHJKY0pGSnhiN3ZYSG1jK1hqNEF2dEdFLzFTZkJTeDVza3FvRDNUa3Voai9u?=
 =?utf-8?B?RWN1MFlyQzlKZ3dlYWxXanBtZkc0b2JmSmtUc3AzZXB4N3RUTzJ1dExMb01V?=
 =?utf-8?B?bGNXMmViWFlCeWxFN01BVWFBcVN2Uk54bHBNRDIrUWYxRHJjQmZRN2I2Z3c1?=
 =?utf-8?B?S2xYQWZSQTY3SGNaQWlQTXp3OTNjVE1BaTFSTTRLbkozOWZWd0tqY2paMElw?=
 =?utf-8?B?VDdRUk9CdkRDbGNabWZYSzJoZyt3bWFwZGd3bS85L2pJRnlLalZ6TnQ1R1lm?=
 =?utf-8?B?dGlzRnRXbnVxejJkTnl0dWIzV3pFdm9rMC9vTy9UZ3RzK0xSVHcyZUZQUXNl?=
 =?utf-8?B?bjBhZUdRK1hmbVBteVVIVFNMQS9yNEk5azlxeHRGcFZ4NlhWQm45Rnh5eEFa?=
 =?utf-8?B?MmZ0cG9kT09VcUpUWVdhNmZVNU5Xc2YyOWdLaWc5LzdFWkpPRyt2blBZR1hk?=
 =?utf-8?B?a2xidFZrNWxHdGg0TVNwQy9pMzVvNTFoSjgzb2UxUDNVc0dXa0NjL3YvdHMz?=
 =?utf-8?B?M2doVWsvM0pIZEQveXhTM0I0RDNzeGV2dXpYcklHRlJqbjUwWnZndXJqd0lV?=
 =?utf-8?B?dytJdVpRTStSVEZBLzJ0NHN3aWlYczRyN1VSem56KzFUczBXL3JCdXpSN3JI?=
 =?utf-8?B?SUN2SkFuTlFodzFXRFpNY2FNWlZDZEVuMElKMC9vcHB4ZHEwN3gyV3ZhNSs5?=
 =?utf-8?B?dWlRUjlEVXp6MG5HZ3JpeVgwOWVoQ1orV3NQeDdTWTdqdjQ5YW9KbGpHZElv?=
 =?utf-8?B?Z29aanNlaElER1lnSzA1dWFkbUMzbDFQbmd3QnJrVHlweW8wMFJ1bDZIVTFV?=
 =?utf-8?B?Znh3T3EySkVXVm8yT2x2YXNFbUszLytOdWYvaWxyZ0xDNXNIZTZWTTZiZWlW?=
 =?utf-8?B?SHg4S0JKZjlFalpMSkNxSVg1eEUrZFBQOEZOOWx5bjJBVnpaTXRhQlBJaVhu?=
 =?utf-8?B?S0pMZFE1eFVuOUF0ZTlMWk5zdjIxaDVERmJYSWNmY1RFVVdMbzdyZzVjNW1V?=
 =?utf-8?B?T3VDakVoR1BHV1o5ZWRDa2xKVTFKWTV1Z2ZCSUdqL2Zxa2VTRCs5bmJ4N2Ir?=
 =?utf-8?B?NGo2ZjNiMENXeWFWSjVmOW1naTc3S0hhU3NmUE9LZG5hbGFIaG5qNGVleVRN?=
 =?utf-8?B?OVdveVhvd1Yyb1BGR2JkZFlHWm5RbWpwS0dLYVdPbk5RWE5URGdHTVdXZTRI?=
 =?utf-8?B?dGV0bXJpMmxnTzNaMDNUWDNjMWxLaUV0QVJIK0lMSFo5aGp1aEY4cWdmYUVN?=
 =?utf-8?B?NWlGYWk1S05mOVRMMjFNMUViT3VmNU1oUGRJS3V4T2FQRnVIcjhSVGQ2dnpC?=
 =?utf-8?B?S2wwRHZKY2hLN09HOUlzL1RBKzRpeHJBYjRyM3o3eVlCZ1FLSCthbjF6L1Na?=
 =?utf-8?B?Z1VzSnhDNTkrLzIwWW9HNlZ6NEdIcjlweEdQRFN6WWhaNm1XM0hzMUtkeTlZ?=
 =?utf-8?B?b25BUkIrZHNtcE1BSDhNaE05R3FoZ0ROY014Q3pndFV6LzloVnAza3Z1dUUv?=
 =?utf-8?B?UHlRVGYxaWVaNUdOSDZ1MGdqcm9JREdCQ1E0TXUwN1dWWDNLN3RrWE1hR2d1?=
 =?utf-8?Q?/OZ7xDCYYLg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXoxVFBTa0xkMWRsWWptMVJzN0JjZis0ZllVam1wZUdxUU5WN0l1SXhheXVq?=
 =?utf-8?B?enlRcm1GckZsNFVkeEdPSG5jSU1lQ2lFVWczU01sSm5mL0NFMUt3SzdDY0tr?=
 =?utf-8?B?TjFJVmRrdEhseS9OTDZpV0x5YzBIVXhiVDhiM3ZSME1UdXd3YkJKUmxxd1lM?=
 =?utf-8?B?RGdZRHA3RUpTNTAyUkU3TnFXb2hDSDFWSDVyd0lUM2ZPMzdnYjFzZy91NXFr?=
 =?utf-8?B?THBmcHJiVjdsR3BJRmtnVEg4WngvVlJQZnJZK1g0bkpiQ2JmeHZKTTR6d1FB?=
 =?utf-8?B?NXZtcCt4S2xFZko3bjZEWkpoeEthTk5kdnRnUTJKSmRHTlZCVzRSWjZ4cXh5?=
 =?utf-8?B?bTkzSmJReWJZQUZXWXdCYkQ3NVBYMDc3Nkc2QlJ4RjFzd04ydDNHQ3NPWEFM?=
 =?utf-8?B?Rm1GbnlrY1V4THdmaVBkY1hleWVKK1VxelNUczZhOTgwYXBRajNicXp2eVRK?=
 =?utf-8?B?YTZSSHgxeHNTSnZUMG1CM3FzeU5aZjgxREVDanh2MU1aZk5JWW5mZFVQTHZm?=
 =?utf-8?B?cktZYi8zK0dzczZMTWZySU1KUnFPUXRaQmFrUENFSW9qQnFpdVB6NEUrQkV0?=
 =?utf-8?B?emlMRzFiT1c5a3BNSUx3N0FVbDFXR0tmU0ZRd2FTV3dMUnlONnJxR3J6clUz?=
 =?utf-8?B?R0UxOGZJUlhTdFlZMHpGNkEwdFZRVDFaSkQvWlIxeEJsYWN0WVRhV01xMXZj?=
 =?utf-8?B?R0pDZkdqbGFnUmhZMzVrTTlodkdrUE1DeWdDYUdaRlBZeGlNMVZJdXdTeU9y?=
 =?utf-8?B?Tk9Hdk5xYkdsSHF5bUhIVG5zUEdxdTBuenpWZ09HQ3IxcklZWVc2cE5tS0h4?=
 =?utf-8?B?azY3Um42VXM1cE1ZaWU0blNOMXFSZnZzelhLbE5SYlNSNFhrSDlGWWZWalZL?=
 =?utf-8?B?REo2SVZFNTVHUCtzRXlGakxNeXJDeXhKTm5PVy9Qeit0NytCMXlSTXNRa093?=
 =?utf-8?B?dnNBNFpKWXNJL3E1T3NWWkZ6QmxKTERGeis1aXFIdjdTc2dvSFNIaDY0VlFy?=
 =?utf-8?B?eE5Tb0tFd2ZCVFRLWXYwSWx4TTA0OS9XRStOYUNLN2lzb3R3WnBuM1RFc0s1?=
 =?utf-8?B?L2pqSWxOVHdGNUJDSmYveXkyTGN5akJjNExpWXk0Q0VLM1B4ZnZRKytWSGdH?=
 =?utf-8?B?WkNGakV6eERDcGJ1dzhmbjdBSzFnUVZlaFlMZWdXRDI4emZ3RklTOGlaTkpH?=
 =?utf-8?B?ajJBcmN3anhjUEZsQ3pqTGJrWnJ2S0tHaFliUlB3SnVia1kxK0E4ZzgyUFZN?=
 =?utf-8?B?WlZuSk5YVEJWbUVoQStqN1NIY3A4OFpFaHpmay81NUpZRkVtZTI1ZjM3bkFz?=
 =?utf-8?B?RWVWRzZ2NWg3QlBtVk01Rk51Zmp5YTF4enNScHBaUlVhVnhzMVlkNkVVSDBE?=
 =?utf-8?B?b05wS3Q1RGJwQlpZVnBqYk9CZk1Fd09iU0h0OXNGVm4ybkZmbTF0dkFrNzh3?=
 =?utf-8?B?aGtKY3dIUlRhUjJVWis1OWxnWG0wSkM3KzBOSkloNi9LNWZHQVE2eTQwNmFl?=
 =?utf-8?B?ZThjd3dwVjcwRXMydVQrSDdtTUQ1NW1hWXdSc1RaQjBzVlJIQWZxYzArUmUy?=
 =?utf-8?B?dEJ4aktxV0EyV0huTExybklCUjAyR0krb1JIVlhJWVBhYlRNR3NPbXQ5YWZZ?=
 =?utf-8?B?MXAzc1NLYjUxTXpGUVovUjZWQ3lPcW9WbFZnU0Z0N2RBRE9UMUVXaC9OTmRO?=
 =?utf-8?B?T2RvNWVQUXRFUHRaZGx1TG5xQkZYTWlraURxRlhWckthbStWWmZkeHIwODNH?=
 =?utf-8?B?NjMyUHh4enBkeTUxZzFpSElVM3k1OFFWOEVzMGhaK0dwSVhKWWtDTmVuQ1Mw?=
 =?utf-8?B?Z0todkMxMUNNdGFEVFMxb090UmJUNWNjL0J4VVp3VVo5aTcvNk5mVTI1U1pC?=
 =?utf-8?B?eXl1UUN0NXcrdmdtTzJzK21EMjh1dXZ4SVNTK0FMekRldjhhN3hOREExUDlT?=
 =?utf-8?B?dE9CRUUrakNlb3o0SGMwbThISDFvL2dZQmxLck01eWZEUis4bmRxMmd0eGRY?=
 =?utf-8?B?VDgxbmZWRVFZak5USkZxUzBjenFDYTRYSXRNeFU4dXFSM2txY1ZGZ2Q0Rjcx?=
 =?utf-8?B?VzBHYi9nQUc1eVdEY2YzU1NyWUhMd2VFZXV2M2VXbit6NTJZSk1wMEd0WnF4?=
 =?utf-8?B?TG1lUFBqWEpIQTFuWmovM2JscE5keXEveUVYd3dYTmhUQjdMSkFRbVJhMkdo?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5015489-1893-495b-4973-08ddb4027455
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 16:07:59.3467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Icj0shISaO4eNRPjTPkBzmvYSqPB/0oUVsNSbv6QTlg+PZhGiVXI7NyGMEIkLwMLN7MdaSNU5ZVxEcZaar1kA5/zCGylwcFEUgsDvWfbmEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6281
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2025-cze-24 22:09:21 +0200]:
> We already have function to print summary about VFs, but we missed
> to add debugfs attribute to make it visible. Do it now.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c  |  4 +++
>  drivers/gpu/drm/xe/xe_sriov_pf.c | 46 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf.h |  6 +++++
>  3 files changed, 56 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index d83cd6ed3fa8..24a5f99ed52f 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -20,6 +20,7 @@
>  #include "xe_pm.h"
>  #include "xe_pxp_debugfs.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_pf.h"
>  #include "xe_step.h"
>  
>  #ifdef CONFIG_DRM_XE_DEBUG
> @@ -273,4 +274,7 @@ void xe_debugfs_register(struct xe_device *xe)
>  	xe_pxp_debugfs_register(xe->pxp);
>  
>  	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
> +
> +	if (IS_SRIOV_PF(xe))
> +		xe_sriov_pf_debugfs_register(xe, root);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> index 0f721ae17b26..32788b83b8bd 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2023-2024 Intel Corporation
>   */
>  
> +#include <linux/debugfs.h>
> +#include <drm/drm_debugfs.h>
>  #include <drm/drm_managed.h>
>  
>  #include "xe_assert.h"
> @@ -102,3 +104,47 @@ void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p)
>  	drm_printf(p, "supported: %u\n", xe->sriov.pf.driver_max_vfs);
>  	drm_printf(p, "enabled: %u\n", pci_num_vf(pdev));
>  }
> +
> +static int simple_show(struct seq_file *m, void *data)
> +{
> +	struct drm_printer p = drm_seq_file_printer(m);
> +	struct drm_info_node *node = m->private;
> +	struct dentry *parent = node->dent->d_parent;
> +	struct xe_device *xe = parent->d_inode->i_private;
> +	void (*print)(struct xe_device *, struct drm_printer *) = node->info_ent->data;
> +
> +	if (WARN_ON(!print))
> +		return -EINVAL;

NIT:
In my opinion, checking for null pointer dereference is unnecessary, and returning the error
to userspace can be omitted in this case.

> +
> +	print(xe, &p);
> +	return 0;
> +}
> +
> +static const struct drm_info_list debugfs_list[] = {
> +	{ .name = "vfs", .show = simple_show, .data = xe_sriov_pf_print_vfs_summary },
> +};
> +
> +/**
> + * xe_sriov_pf_debugfs_register - Register PF debugfs attributes.
> + * @xe: the &xe_device
> + * @root: the root &dentry
> + *
> + * Prepare debugfs attributes exposed by the PF.
> + */
> +void xe_sriov_pf_debugfs_register(struct xe_device *xe, struct dentry *root)
> +{
> +	struct drm_minor *minor = xe->drm.primary;
> +	struct dentry *parent;
> +
> +	/*
> +	 *      /sys/kernel/debug/dri/0/
> +	 *      ├── pf
> +	 *      │   ├── ...
> +	 */
> +	parent = debugfs_create_dir("pf", root);
> +	if (IS_ERR(parent))
> +		return;
> +	parent->d_inode->i_private = xe;
> +
> +	drm_debugfs_create_files(debugfs_list, ARRAY_SIZE(debugfs_list), parent, minor);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.h b/drivers/gpu/drm/xe/xe_sriov_pf.h
> index d1220e70e1c0..c392c3fcf085 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.h
> @@ -8,12 +8,14 @@
>  
>  #include <linux/types.h>
>  
> +struct dentry;
>  struct drm_printer;
>  struct xe_device;
>  
>  #ifdef CONFIG_PCI_IOV
>  bool xe_sriov_pf_readiness(struct xe_device *xe);
>  int xe_sriov_pf_init_early(struct xe_device *xe);
> +void xe_sriov_pf_debugfs_register(struct xe_device *xe, struct dentry *root);
>  void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p);
>  #else
>  static inline bool xe_sriov_pf_readiness(struct xe_device *xe)
> @@ -25,6 +27,10 @@ static inline int xe_sriov_pf_init_early(struct xe_device *xe)
>  {
>  	return 0;
>  }
> +
> +static inline void xe_sriov_pf_debugfs_register(struct xe_device *xe, struct dentry *root)
> +{
> +}

One minor comment above. Besides that, LGTM
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  #endif
>  
>  #endif
> -- 
> 2.47.1
> 

-- 
