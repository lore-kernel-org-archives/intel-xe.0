Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CE5D1CDC6
	for <intel-xe@archiver.kernel.org>; Sun,  7 Dec 2025 15:35:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F5C10E07D;
	Sun,  7 Dec 2025 15:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XsWpA7pB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F049F10E07D
 for <intel-xe@lists.freedesktop.org>; Sun,  7 Dec 2025 15:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765121713; x=1796657713;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8F2jky07S2g65+7WRVnrGEP3WOkjhrXpz2kG8q/+bjQ=;
 b=XsWpA7pBjRkaIIim2np8jM8oMfMbtJIWDHcZfAkg7LS9SjO2N6wx1tkI
 7wSpilTetPHxg2C+7+p9fSjAtawZBXJY3uJ+s8gRl0L4Q6RqFGaNe53Li
 SrsrXwEMjTiDMt49jbhkab0NsqXrw5wOHdylEzouukvkKvRw6/SAk3W4w
 b8+eBOocPZ3p5A33gv59WMp5jahhr1zIiG6czM/Z18o9sHJQQPo2yQ2/r
 +/Z1KotIOasHWsq0cBFrZb5YUhy8Fr1qK6ffbpvWv0yJHOUf3mvx4Ddte
 bM4mEBAnJAEm/tb9Jx54ztTlpq3SHKEgzW9v3LJc7c19MtYVOTCceZfPA A==;
X-CSE-ConnectionGUID: ZrLpIdRLSCOVqA51Lnwqbw==
X-CSE-MsgGUID: cdR/l0xDSfaVPglDN5morw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="77768878"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="77768878"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2025 07:35:12 -0800
X-CSE-ConnectionGUID: mhfrl5ZkQ/KJg84TLlmw+w==
X-CSE-MsgGUID: M/Qy64pBTnKmRz2Yl5Tfeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="196188081"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2025 07:35:12 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 7 Dec 2025 07:35:12 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 7 Dec 2025 07:35:12 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 7 Dec 2025 07:35:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tIlYXfbQod1b9Uu7cEQb62gimQQ697ayGwyxg+Gj0dH3/CfyzaqeCT5oD6/eNdKYJXP9Of2A1NrVLdc6Sp6ydMHXDXKZoLRj8LV3+ZluAn0Qi6CA7XBQduIqCU1OSS3C9Gur9vBhq//Qre0GfS90bWIGfELMsit23NzBbTL0qJAYGwfbjC0CPpAnCQd4dgQLgKT2h3hP6fMecnwc1ov810nw9VbOij2Tjb7u/HfZl/K4o9cLXDxO5tskNcub7+4q6RKliIXdZ4BOm8VwgRn2c3P+fF2yNzY7iKHZsTsVIiu1v3gYIMO8GacRHwkqqB6tNodJkYYKipGBEgCxdKa+Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJxn5Oa9bLFKU8lMbNf17eOZJdcRg/IqY6Ob0pknhVY=;
 b=yiGj6ZZL/g/CTB0HKy2cRZgEjvFLLXaV6pq8bf1/5XFUuiIj8RlBhliUapVU6vI5saM+C4gchhHzcURNcetRU2wvtd/Q+fj1e5G8DGuYdw6F8Jyrzd22L9wXWkai2usb1fdHKN0J+rWT9hZ5/V9Y43JqVZl6R1Odni0Y8R5l2Talo7ceCBJq35GHIm7NvcKsfFAzPV/ZbUvgJuAQAHm+l3gC8N6VPoSjQqb4j7p9G1bjHfSA6l592Z5b5gIT3AnHLvAeZiqkI/g0+P0wCwctPr0rbhk1xc++dbeYEvF2FDx/w9nwZNd8ARULjIuADSpt1lAMx/jtg4VX/RWD6XVXHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by BL3PR11MB6532.namprd11.prod.outlook.com (2603:10b6:208:38f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Sun, 7 Dec
 2025 15:35:10 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.012; Sun, 7 Dec 2025
 15:35:10 +0000
Message-ID: <6e3d1cb6-af91-48ed-9a48-4d3c232f6386@intel.com>
Date: Sun, 7 Dec 2025 16:35:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] drm/xe/gt: Add engine masks for each class
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
 <20251206230356.3600292-14-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251206230356.3600292-14-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0255.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::22) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|BL3PR11MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: ded455d0-9928-4155-9e98-08de35a634b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3NzUWhlWWkzYVR0WitFbExKK0FDVmJEOGJ6OFF2VUZrYnRsWTJkb0pTRHNE?=
 =?utf-8?B?V1lpQ2d2VUdKdDlZdjJaajBHenJObk5jMThCSnc3YlJBVXJ0Q3hGd2t3N1NQ?=
 =?utf-8?B?VGlyZXlBMU00TG5kZjVCOHMwNmFFZDF4OENPbkx4d2dRUW1mVUNpQXl2WW5T?=
 =?utf-8?B?cmt6QjhsQXZyb0JGRTN6K2dWMTE2T0F1YmlpZk9TVFViK3MvNlZEM2psL0Na?=
 =?utf-8?B?elZ3WndlR3BPUzlBZGxwYStXWkduMkN6NzFROXAxSERoUk4xdjhoblRjVTJk?=
 =?utf-8?B?M3Y1NDF6WFk2UFhQbXQ4aWRsdjhIUlM5Q3RrL0dMWEU5aG9CTGZVUTdXdUF5?=
 =?utf-8?B?QWxpdnhBOGp6UG1Sem52OXRtSGR3OXlpcEZwZGhpT0pDOThHUVRidTZPOUs1?=
 =?utf-8?B?TVVzMFkwZ0JyVEQ1WHJtZWdra01VMWN3bjdPT3JKRUdGWjROMjhxNitqSFlZ?=
 =?utf-8?B?YnJCVUNvL2FueERrTUlUdEFtbkZobTlwcGhXL2NXNGI5MVAxMGlKMkRaMXpU?=
 =?utf-8?B?WTRCUk9XT3RHNXNmT1hrSks4b2RKWGc3Z1NsOUdrTTVSV1FwL0E0STIrSWZv?=
 =?utf-8?B?ZGdKZ2MvMVZ5TFNwdUFXeFRxR3QvN3lpN0l3VExrSE4xM2lMT2YvejVvaEZj?=
 =?utf-8?B?TXNqbUZHb09LWHJ2VUROVUl1R1FvVWUzN0gza1FwOTVUSEo2UmUzSkRnQmU3?=
 =?utf-8?B?LzBEOUlNTWY0bGp4eFI1dlFYTmhkMlVpdXQ5NEtFZTR1UEluTmRzSkxPcUgv?=
 =?utf-8?B?RkxBOWdUMDNiajFZRi9sNFhlSFpyRk51UDVONzhoNEdiRUI1UnFzVit4SGFs?=
 =?utf-8?B?cy93L0l2YW5MYTM3ZzJWc1QxS3BPcHJ4ZjlwL2Z6VnduZWRXbUNNR0xwRUlu?=
 =?utf-8?B?R3ZYUzVLWEk5WUM1TWkzc2t0b2ZlSzlHakZXUzIvaTJrZUxlZVNqeXpVRXNa?=
 =?utf-8?B?NE05c3F4MnVDV29mYjJMd1prc2ZRUEE4NlpTdk9zWGJxWWVRajN6VExiM25n?=
 =?utf-8?B?WExSNGlsSWdQdlZYWm5zdVFKYi96a1I2Y3kydkNaTUl6bU5CZnQzZHVRVk9Z?=
 =?utf-8?B?Y0JUSGc2bmhmRE9UQzNLUnl2emdQbkpVTXRHVER4K0M0NGlaVnQvWUhZTlQ0?=
 =?utf-8?B?M3RGM3p5Mmk0aXUzb0JUdGxHdFd3eUVSTit6Mm83Y211NnA1Uzc0NzRkRkJX?=
 =?utf-8?B?ODFhTTArTzFHQTEwdmxKSjllWTJBRVRMUFNxRUR5bEVZNDRSQmg0Zk1lZkxC?=
 =?utf-8?B?Y0g2M1NCdFp4ZTNuRnRpQ1ErODVNYXU5RHArbzNlNGIxSlZTTFQrdVVzTzdI?=
 =?utf-8?B?cWZsY25zYlNvUzhHdUQ0bnVKMENqYTh3d2dVNWZ5ZlltR1RJaEtncGJndEth?=
 =?utf-8?B?amVLLzUybXIyaUhXb0JXWHVtSjFHRGdsQ0ZLN2pEQ1NYaGl2K3d0NXlmWWhn?=
 =?utf-8?B?YXR1cjRHR3A0RzJEdWlHSC8rblZkSTBXOVVKSjdZendnRy9DS0k1enFLUG1Z?=
 =?utf-8?B?VEw4dVUwR1VJY0RJSng4YTF0OHJiOTdFSFR2UUpvdUxGS1lGajNzVjVXRGxk?=
 =?utf-8?B?ekRzTVZ3eE1KK1lDbmxERm01QXhUTm5NeDRsMUpCdnpwUWU3K3lGa01XVzFT?=
 =?utf-8?B?aHZreXl5UlFacVZ5aEhDMm1pR1dNc2daMVg0R2NlelM0MWp0bXZRRXVMSU1w?=
 =?utf-8?B?cmhxenZvODlmM2tpOTRRdzlHZCs4WTBxZnBtQ0lwTTZ3WHEySjMxb3BtSHU5?=
 =?utf-8?B?cnhjMjVnaURCWG11TEc2TlV5YTdhRkpIVUpzSzcyTDdubCtDbFo5Z3dsM2N1?=
 =?utf-8?B?TzVLS0FoODFleGVReGFtM0MxQ0lYWUZDa2prMU1iVjhCck56TElqQUpac1BI?=
 =?utf-8?B?bUJxZys2ZmhvdEMzOS8xamFDZjRINXRrUVUwZ0haVENYWGlVc0UyVlBNTHdW?=
 =?utf-8?Q?uQCpWSMzythA6fWDQ65F/r6F3olmUIWR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUhJRWk0bFc3SGF6azdzWVpRUUJjZG5rdTM4a0pWTHd0aHVnTU1LZXY5NjNN?=
 =?utf-8?B?aEdXRnpZTGdFdmtObDNhRjdnODhUVXNWQkNtUGRpL2RTNndycFFTbzJJdlVB?=
 =?utf-8?B?SEp3eGJEeWg1aVpyMkIrSUJrYkZVNnhETVZZcitEb05vY0JDamdsc21qdjMr?=
 =?utf-8?B?bGR0WDM3OUtIZVNJTkJZa0FRMnpJSTRDVnRIZm9hNFJ6YXQxY0tVS2FKUzJC?=
 =?utf-8?B?R3ZKVVBlQUFLVlIrblZsYmltR2ZlZ2ZXbnF3L1pKKzYxUmYzZnFpdFkycWhz?=
 =?utf-8?B?Y1F1KzdJSDk2SGF3MEx4NzBsVXJoc3c4YnVENlJhM1U1S1EySHdxYlp5dHRy?=
 =?utf-8?B?dUVRTFlXM0pPVWNXR1RkbWNlRXVvY0U2ODJXcXpmZnVvVW53eWxSNnRjV3da?=
 =?utf-8?B?NUZsVVFuTDQzNDU5Z2N3TmtoQTNLRFFyYVRuTU9PUkQxSEtWVW9lRjBGOFZl?=
 =?utf-8?B?WHg0SW4rMnppRXRJRWJSYUhuVXRuL3lyUVZHSDk2L21XZFd3QW80eEJ4dGhq?=
 =?utf-8?B?QUd0eXg3NFUxM1RjNUo1NlFmNEZPSjQ3VmxhVXRUY0NQRWNaSG1tcCtCYVpC?=
 =?utf-8?B?TXM2d1NkL21uZ3BjMkI0YmErdHNhdXVlODBralJVOHdOZFJWK01ETk4xOWla?=
 =?utf-8?B?VEU5TThHU2ZVL0tRQk9ySlJCS0dTSkFxaW9xVUxIZ1pMcmhkTVdTeEFpKzBh?=
 =?utf-8?B?b1lqalE5RXV2RGs5c1B0MjBqZEVIdldzcDljOWxFM0ltWkVWZXNBelVTeXJY?=
 =?utf-8?B?YWh4cHZkSFgrM285T1ZNNjBsZktuaDB3S2FDTWhlK3JRdDh6MU43TFJqTlli?=
 =?utf-8?B?VXRWL3VndWhuTHlqN09CYnlLS2NIMnYyUkp3NGRwTFNEUHdjVVc3dnUvZEVJ?=
 =?utf-8?B?RnpFN2d4Mm96YVlhYnFHNVJrREkrVEZoUEMwS2ZqcHEyQUZHWmJYNytPS1Z5?=
 =?utf-8?B?NnRtM0cxdTRoMUpweHZGU2lCWElUSWlwWkFBaGlSQ29McENHbkYvY3R4Qmhm?=
 =?utf-8?B?NUxLM2UzY1FXdHRHRFg2N2VQOUw1QTN2U04rUHZHSEZST012L0tMYzQ1anQz?=
 =?utf-8?B?QWVVSjkwVGwzSEIwWCttTWh6QmgxVkRZWUF4algxYlVjNklCUEF3NVhpaXl0?=
 =?utf-8?B?NWVXOGlwcXBjdWR3TFdjTHh4Qkw3blUrcWlYSlB6R0ZrcGdOTkFxcHZ2ZDkw?=
 =?utf-8?B?MDhiYU5mOFdFWXQ3eWlsRDNrS3NnRHhwdlUxaWdIcFpObnNnSDZkZzkyckx2?=
 =?utf-8?B?NFZRUEtIL25LNUpKYlNPOHdOUHJTcW8vTkFsRWw4akdVVE5xZnlRUll6Ungx?=
 =?utf-8?B?bzQ5VlFzZUJzSVQvRnk1U1o0QmFYZWJXRE1QN3ZzQzZKYjR5Yk9mTWdXeFAr?=
 =?utf-8?B?ejdDdmRIMDFoMGdZM2NIcVRoWDQzbkU4VzB1aXY3akhubmRtM1V4MGwwWk5M?=
 =?utf-8?B?MERYdFJ1OHlqOWtIUVh4aXhWeWtJYWxiN0o4bDJDbTViMWdtMTJ2UTFvQVQz?=
 =?utf-8?B?cE4zT1JncXZRU3BvTW4yS2pUMzF5cUluWlpid2swaFM0bTdxMkRyQVRYc0t2?=
 =?utf-8?B?ZVpzbHd3TUdjRGtNY3VJeHUvN0xYVDJWbzExd0czQzdmNDlmS1RsaE9CSkkr?=
 =?utf-8?B?WEFxY0tqcWVGTmJoemRmKzZXVnRtd0NiVk1meFcwOVNpbFZYTG5sanJGbEVD?=
 =?utf-8?B?NHRoaWJwYzEwNTk3WDg3MitydVg5QkxlcC80VmRMbllBK1FlbnNKU1pzYWxo?=
 =?utf-8?B?Rzdud2hCRzB6aG9rV0FhQVd1dU8wUGJKTlBQVXVlQnk2a1BOWXh4MTJsQ0Uw?=
 =?utf-8?B?a2NsbXJ4QUJUOW9TakMyckxnT1R1d2ttT3p0TlhNUXZEOWdLdHRuZ2NIREtI?=
 =?utf-8?B?TW10dTlyS3FuSms3QlVxVHh6WTVQZWNqci80WjZWRk5zZVpTaGk4RThLNjYw?=
 =?utf-8?B?UXhnSEFmTnV5WkxzTXFma0czTnhKcFhMOVF6RnVFamV4SXVWeENLNEgzWUdw?=
 =?utf-8?B?QjFtWTJmQ3RQWEM5akZCZldkWUtheEJZem9rS0sxTElvSUtaMlBzMG56UU0v?=
 =?utf-8?B?VmVtdVNCaHpQQTN2SXR5K2RQZG0xY0VvRW9FVGtLa2J2ZS9qOVZpT0FyaHlV?=
 =?utf-8?B?NDRYa3ZIaUxhUEgyT24vV29FREkwTENaOXdmSlJaZyt1YkxLbFpTRWIwQm9x?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ded455d0-9928-4155-9e98-08de35a634b3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2025 15:35:10.0544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DaIZnw+PBA7HTKdzk7RuEwbnaO3SuP3sIDOVT09fvXcMsbEa5wLgsGw8DpGGStT7EczpBI4lK5BwfRwxsTaQuQqWZQuBRQvcsffJde8+8y8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6532
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



On 12/7/2025 12:03 AM, Daniele Ceraolo Spurio wrote:
> Follow up patches will need the engine masks for VCS and VECS engines.
> Since we already have a macro for the CCS engines, just extend the same
> approach to all classes.
> 
> To avoid confusion with the XE_HW_ENGINE_*_MASK masks, the new macros
> use the _INSTANCES suffix instead. For consistency, rename CCS_MASK to
> CCS_INSTANCES as well.
> 
> v2: Use _INSTANCES suffix (Michal)
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.h          | 9 ++++++++-
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 8 ++++----
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.h | 2 +-
>  drivers/gpu/drm/xe/xe_guc.c         | 2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c  | 2 +-
>  5 files changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 94969ddd9d88..2eeeeeb6b912 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -20,7 +20,14 @@
>  		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
>  			  xe_hw_engine_is_valid((hwe__)))
>  
> -#define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
> +#define __ENGINE_INSTANCES_MASK(gt, name) \

nit: this MASK suffix here still suggests it returns some kind of mask
if you still want to have MASK tag here, then maybe name macro as:

   #define XE_ENGINE_MASK_TO_INSTANCES(gt, ENGINE)
or
   #define XE_ENGINE_INSTANCES_FROM_MASK(gt, ENGINE)

but final macros look fine, so with improved name of helper macro,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> +	(((gt)->info.engine_mask & XE_HW_ENGINE_##name##_MASK) >> XE_HW_ENGINE_##name##0)
> +
> +#define RCS_INSTANCES(gt) __ENGINE_INSTANCES_MASK(gt, RCS)
> +#define VCS_INSTANCES(gt) __ENGINE_INSTANCES_MASK(gt, VCS)
> +#define VECS_INSTANCES(gt) __ENGINE_INSTANCES_MASK(gt, VECS)
> +#define CCS_INSTANCES(gt) __ENGINE_INSTANCES_MASK(gt, CCS)
> +#define GSCCS_INSTANCES(gt) __ENGINE_INSTANCES_MASK(gt, GSCCS)
>  
>  #define GT_VER(gt) ({ \
>  	typeof(gt) gt_ = (gt); \
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> index 50fffc9ebf62..91ac22ef5703 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -17,7 +17,7 @@
>  static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>  {
>  	u32 mode = CCS_MODE_CSLICE_0_3_MASK; /* disable all by default */
> -	int num_slices = hweight32(CCS_MASK(gt));
> +	int num_slices = hweight32(CCS_INSTANCES(gt));
>  	struct xe_device *xe = gt_to_xe(gt);
>  	int width, cslice = 0;
>  	u32 config = 0;
> @@ -59,7 +59,7 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>  			config |= BIT(hwe->instance) << XE_HW_ENGINE_CCS0;
>  
>  			/* If a slice is fused off, leave disabled */
> -			while ((CCS_MASK(gt) & BIT(cslice)) == 0)
> +			while ((CCS_INSTANCES(gt) & BIT(cslice)) == 0)
>  				cslice++;
>  
>  			mode &= ~CCS_MODE_CSLICE(cslice, CCS_MODE_CSLICE_MASK);
> @@ -94,7 +94,7 @@ num_cslices_show(struct device *kdev,
>  {
>  	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
>  
> -	return sysfs_emit(buf, "%u\n", hweight32(CCS_MASK(gt)));
> +	return sysfs_emit(buf, "%u\n", hweight32(CCS_INSTANCES(gt)));
>  }
>  
>  static DEVICE_ATTR_RO(num_cslices);
> @@ -131,7 +131,7 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  	 * Ensure number of engines specified is valid and there is an
>  	 * exact multiple of engines for slices.
>  	 */
> -	num_slices = hweight32(CCS_MASK(gt));
> +	num_slices = hweight32(CCS_INSTANCES(gt));
>  	if (!num_engines || num_engines > num_slices || num_slices % num_engines) {
>  		xe_gt_dbg(gt, "Invalid compute config, %d engines %d slices\n",
>  			  num_engines, num_slices);
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
> index f8779852cf0d..ef3b853f5c8c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
> @@ -17,7 +17,7 @@ int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt);
>  static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
>  {
>  	/* Check if there are more than one compute engines available */
> -	return hweight32(CCS_MASK(gt)) > 1;
> +	return hweight32(CCS_INSTANCES(gt)) > 1;
>  }
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 88376bc2a483..ccc914563ca0 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -175,7 +175,7 @@ static bool needs_wa_dual_queue(struct xe_gt *gt)
>  	 * the DUAL_QUEUE_WA on all newer platforms on GTs that have CCS engines
>  	 * to move management back to the GuC.
>  	 */
> -	if (CCS_MASK(gt) && GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270)
> +	if (CCS_INSTANCES(gt) && GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270)
>  		return true;
>  
>  	return false;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 3ca2558c8c96..af43acf7baae 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -388,7 +388,7 @@ static int guc_init_global_schedule_policy(struct xe_guc *guc)
>  
>  	*emit++ = XE_GUC_ACTION_UPDATE_SCHEDULING_POLICIES_KLV;
>  
> -	if (CCS_MASK(guc_to_gt(guc)))
> +	if (CCS_INSTANCES(guc_to_gt(guc)))
>  		emit = emit_render_compute_yield_klv(emit);
>  
>  	count = emit - data;

