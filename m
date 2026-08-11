Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F021C5CFCF
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 09:54:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD1F10E2EE;
	Tue, 11 Aug 2026 09:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SX7ERmdI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA6110E2E1
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 09:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786442096; x=1817978096;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NnUlJc7B2G0YYJDGaIpjfGiVBG4aRb8Vi8mkzyt/cDo=;
 b=SX7ERmdIOHOsYdPrQsitVpN1rpD2WjnyY6LUUJ5ohWVdNeCzJ/kAUFMn
 KJ31Tu9B7dpIGGRl8J5yz6/E5hNbpa5nkud8JUFVnSb72R5i8mOMXf1KG
 Qc6nYVfwaigaBuzmRjsEHLCo1S6dLx5x9iimbs7m541sbGB/GetXGcPnw
 KZa6d1qggEu4EiOafPgX611UFCDnM4M6K7/p5xTwdO8GTkNxvHnIVlC5G
 1VB7vnUNd3texBU4twtSXYVCggPYC5HnYsDUwsbmAb/8sMw3ZWdmfFOIh
 V2OyEoRzHoJcFsh1JxKIHS8LtmZBdIi3xW60mfluJsThxHoMVfPREX0Zv Q==;
X-CSE-ConnectionGUID: YX7u+XLaQ2ehLCWZk83bUQ==
X-CSE-MsgGUID: D/jw+3X+SySMB7CMH8oKmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="98116244"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="98116244"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 02:54:55 -0700
X-CSE-ConnectionGUID: wiq19CAcTxq4rkNLPy3qow==
X-CSE-MsgGUID: oUcrYK0VTfu57osTbJLyXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="263344803"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 02:54:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 02:54:53 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 02:54:53 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 02:54:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NRdg6JGP+qurZV33KUE8bq28KEfuiIs9sic8rXrHhR5z9fXpkicNB5zrc91IE1Sfjy0g+B6+oMuLw2OTlrvNxRUAnxpzXRXwa1vRlBmSM1h3y6GLZHcEQGgxbfzZBbzQypMu44HBsaIoeX4h3qyFyEtw6/BVaSjbPVgXGwZTpkMmv6Jl/uir2w6eMsU8M3zvkfcFWg4yT14cecjLQmjlTNYZYfGVongXjxln6+g4pbeCNa433Q28gxNsH1X2yIIJ4ij4xGQuCuqbsW+RSkikS/iaxDnOwhvXEdi8WfuI8Xh17E4cTfc0kC1qJybL59kaqO75bK3yVPAvOwFvq/yABA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztYJU7ksxdZlsPyARSXDfz7iFoIspFJbr1dN3FvuLaA=;
 b=OaEzgB5T3MByAAD99yfFtJndLPIJRsfNQFW9ouYjhH7mcd0Nwts0pm8yPxw7BSiIALXIyKyhxQgHijzE4EQlQwpqUogcS7cPyb1uEa6rh1LYZRwue9JKy+xhMMuC3rOy7nPtRKknfg3Geq3DMw15Swktik52/XuyLXKp7LNeRJkBj0qA5UGK08jWAer5OxwlXIJo/b6ajgA87jMwbmRIw+/UrSDlDXL45ipwQY+ZH8AU4tjXhhjrWyq92Qt+gXV4/TB7903I4HhXMmAk2+1eDkWAwa847UmNduRSgOhmmhK7UuH8n/eq2qs2t0tczFU22VIB4Lo4k/o8U4hgnPtMQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH0PR11MB4822.namprd11.prod.outlook.com (2603:10b6:510:39::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 09:54:50 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 09:54:50 +0000
Message-ID: <537d45d3-05de-4c73-8a98-5413967fb242@intel.com>
Date: Tue, 11 Aug 2026 15:24:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/23] drm/xe/pcode: Report 'Mailbox failed' error
 using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, Aravind Iddamsetty <aravind.iddamsetty@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-21-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260730152121.576-21-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0363.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::13) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH0PR11MB4822:EE_
X-MS-Office365-Filtering-Correlation-Id: 09d7f1bd-0b25-4c78-7d77-08def78e9563
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: G0kSc2hqa9HFnpQBBcrAP1XMDFc2yqfOQR2us5zY1okNOxBUmeawQGsQo0oNeAcK8NnIRqnSikSB0FLFy+HCydGR+w9XrBRucd3tmHp6u5753uxYNnRMJ8Gly2y/3SLPeT7SH7XCfDePVf6FNnPjLGGIUGZ/I4AEtVtN/QYJbYREgL3qyZWiJdtA/w5EkqM4TsSdPleluzO2zj6QMbazsJ1LbYX/syWjtQpclFW8sIz6QRVfbIpiYhOz/1Zi2rMgfAtj+0y39FYpvAZnwedHgxh0CJFLFCqzrSMsC7pUABIAWQMXZP4hO3gWCDdY4bFi2TZD0feV4kdUzF7ylFdadGrRL0KVQA4dWRs8a9j/8LwkzqSSElH/4FlCUJinFPg7NU4yhIpRIhJ8D+PiU0XbSzxEezf7eZAS/Y6GQG68jEBJGnYBRTRux19kk8R0BFeWFDKCP4uDw1GOBS3q0gSsOccT2uVTGHaM54kP4AZrK1pjPxYLpOT6az8vRq9CrNLOEv3vQdvfVmVPMt1n3GIGL+q0ioLQ6Q1msNiPdqvK+LrZItHtbKD9fVsrw4s8OS+bxNvxcW3q2sZbOTTD+R54Hkr7LeQDGQ3FjovWaJshE5ZKiH9iNwNucSwpogwLyfGg32BAklWEbqLU6lMuofUi/BT1jUZUGxUp8zLCyptlUS8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDdxMS90cjV5MzZYNnUrcEpEYXpWRk1aT0lOSjhjK0tTbmR6U2NRZHdac2V5?=
 =?utf-8?B?c2NDU1dQSS9jRTRvNi92VHFuaGxFTkg2UlhwK1pBL1lRaWViVHd5TEtMK2xq?=
 =?utf-8?B?V0xRSm8yc2hsWjNsbUtGbFlFaDFtdEVJaCs3d2EzWHBIeVZMeHRjZDZZcjd2?=
 =?utf-8?B?YWhwR3dxb2JGdjJyakRsSHdzRGRwM2pla21SbStHV0lpbktleTdXY3EyTHJs?=
 =?utf-8?B?S0VES0JUWkhwbTZseU5YeHhBQmdqZWx6US9MS2ppMTgxcElSR0ZiSXJnUTQv?=
 =?utf-8?B?WTFtUUxJMHNOSGlCQml6MFJ3QjNZQWdQZEpRZ2k1MFlMOWI2YWV0Ti9qWmR2?=
 =?utf-8?B?UXVJK25sQWhyS3E3cXBVQ1ZmdWdLdjd3c3hmN0hkOGtRN0VIRm9vYnNhVkVa?=
 =?utf-8?B?ZS95V3UxV29COXdTaVhmL2oyUitld0pUazJtQmlDZlRCMXBQaVFSYXVncmVT?=
 =?utf-8?B?UGh2UmdIYm5JbUdUdVlKVld4RzZ0VGMxeFV6OVgzeU12eWJoTlVpaWttWjZM?=
 =?utf-8?B?VGdqSnNsQUtaQ1NZQXFka2tmZDNkSWRycHhJQzMwaURYQ2MwWmNJemRDUUQ1?=
 =?utf-8?B?VjNJa1BtRlUzZlpxc2JoYWpTWlRxbXBmQ0thVUk2SDRDQi9wc0srN2w1ekRC?=
 =?utf-8?B?Z2wzVXRBK3RYRUdDOERaUUN2WXVML25zMXlHSTNRTjVUdkpxOUhVOUpqdDRw?=
 =?utf-8?B?QTZuS3hoQ3VyYjVVUnZRcnZ4V3NMemtUWEJrd3l1eFk5enlWUzFkWWFHUnhp?=
 =?utf-8?B?clMzSkt6dWE2TERrTlVVNlRSR1VSUDJmWWhQY2djaVRrUDcwS3VNN1hCamtr?=
 =?utf-8?B?NHZOZlU2aEFmdVBRVFlBbEpnT0pDZk5kaFdmS2VnWHNMSUZJY2lKeWN3eFN2?=
 =?utf-8?B?V1E3NEVVdldnNTFXTXd6ZUt5Wm1MZjlLYWFRT1dzenI3UEdrWVBSUlJodVps?=
 =?utf-8?B?K21vMTN4cFY5VXdUSHc3ZlJUaGJaNEhkWVdxVk1HUHl2bnlSSlVLb2xtV1Bm?=
 =?utf-8?B?aUhZV3hrRW1HSE5NczVlK1VuK3I2ek9mVHEvZlBZczlZSlR3VFBha1FsM0lh?=
 =?utf-8?B?ZVp1K0VBWllPbDdPYk13UUpMWlJPRldoNFdTeTA3L2tQc3F2eDJwNGg5ZlRE?=
 =?utf-8?B?aE1WNjFSTXRJaVlocmlTc0tiWHJGa3l2cVR4Z0dWYmw3clFNSkx2bnI2WDNp?=
 =?utf-8?B?cWd1blJSb3R4RXQ3bnJzUmwyZDU3R3hsZ0p2ek1IaVZFenhJQm13czZlZTdV?=
 =?utf-8?B?bzZLS1hXdEpndzNMRFJoUHhkZTh4ckJKOStGZ3RXQ0hHNk5xYlZYVlBoQTVr?=
 =?utf-8?B?dElpWGx4TW5pWW50amxGK3lzVmZJZXNhQmtxU1h3S0ZqVDA5N3J4Mm5HRFN5?=
 =?utf-8?B?V2ZWelR0SWhyNzlNUHdJOSsxYmJXcDNrd3VzS05LeEFxN1VTaUdXY25OUEFI?=
 =?utf-8?B?Z3hud1RQQlJoNE1nUHNsTGdUV04zL2lnaDBVa1FRSXdra3p5Z05lZjdMK2t4?=
 =?utf-8?B?TUhVVExnTlU4bmlPd1BodGJBV1VsU1M2Y3Z3TUdpZ1NLZjBzdXpNVk1FQzA3?=
 =?utf-8?B?Q0k0dnpmejdWNE5oZlRnUzRMWmlVQ1o5Wm9xajFTQVFKRk9nUCthczRDMWM1?=
 =?utf-8?B?S01ReVo4b1BhNmszaFRkQ1BaOTBaVFc5ZHgreHhtOTRqdkhLNTVUS2lWS3pX?=
 =?utf-8?B?Rm1ucGpEZDMyb1VKU29IN3htd0pBZ1hpcVIrZ3ZFRStjU0FJbyttUmM0RVZV?=
 =?utf-8?B?V2szVHV4YlJpWjRGNXR5bi9pVWxFa2tJelAzMXVndTFZQmRRMWFjTnhFODRC?=
 =?utf-8?B?aGNyYzZFcHJVRmlvTXRQdUlQYVE0eVBKOXFHT3NZRmtkRWwyYzNxZkFrbHJS?=
 =?utf-8?B?OWNKdndqRHFTY3RsUnpUdE4zbXdPaS9zamZSVGpOYk81MnN4bndkK3pqajlm?=
 =?utf-8?B?YnZ4SktLWUErcC9RZDRTdVY1VVRXZVo2eCtBSW5hcmg1MytxVlFPOVpXOXNr?=
 =?utf-8?B?STNCa0ViNUttOXFFa1FWSFEyRzdtRkFsakcrQ3hjNVNkdmtxVWNNZERrNFZl?=
 =?utf-8?B?RFhLb0dkMmpJT0xDem10RWU3c3dMcnJGVmt1a1NXVTNBWVVvK1BEdURmNG9Q?=
 =?utf-8?B?SHZJS04waEQ5L0UwTmhvc3lTUVdNVWd5eTRmd24xdlNXbEdMeGQ1dG9xWEhD?=
 =?utf-8?B?RFF1ZVBLMnZFOWtTZTc1K1hWRk5URTVZRUFCUU1BWXFEaHhxYU05UkJRbkFt?=
 =?utf-8?B?QUJCQjBvZ05RZ0xrdHE5NS90R1FXUXVBUnJVdjJPRFdEN2pEdDM1R01KRnBI?=
 =?utf-8?B?NXdGN2dTS05iWlZlaE82N2xUWXRYUGlibnZXdHg0VEdUTERqRkRrMWxuUzV6?=
 =?utf-8?Q?QaOwhvJNlbylePtU=3D?=
X-Exchange-RoutingPolicyChecked: dcYmnWzwAuXefNrgn2bZXYkCFzW4eYHNEDLxNuDaY81htsVseMyCgK2H1ouLLnzICr6MMtiwbrXIA+iSrWuUIq/TIGgKw3A0bx1+Flk6RUBhWf4RObXm7DneXPFBmYcHC9xvesLiceuvi6//Dodfa7gpz0dHTnbA2201m8P7pGF7Odz5FmNLRTuhBRpBwdNt7fRV97N6kwVlTcQ8l6VdS9FSUX7161CJEPX1crpdSOtFFTea9pZs0vipf4MVJceiFJnefwtdZv2doGfSE8r+oS8oOfBszkRaasLykzLCDY+3PR/A35dwvKeauTp+n9f4VRg5EGVDq73AYrOzpWmu+g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d7f1bd-0b25-4c78-7d77-08def78e9563
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 09:54:50.1272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8bfn1oC3Pwme/eIYBXJ9S7S5vWljjkIZwcbm28s7N6bX/7vsbKf4wyiNFWlCcmOBPPyzR80FyOdh1nyWQgnjSnF74N+vSNWQjAPClM+tF9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4822
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


On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
> Report 'Mailbox failed' error using xe_log() helper.

Please change to xe_log_err()

with that

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pcode.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index ccc3bdeed6bb..014632e11338 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -14,6 +14,7 @@
>   #include "regs/xe_pmt.h"
>   #include "xe_assert.h"
>   #include "xe_device.h"
> +#include "xe_log.h"
>   #include "xe_mmio.h"
>   #include "xe_pcode_api.h"
>   #include "xe_pm.h"
> @@ -61,9 +62,7 @@ static int pcode_mailbox_status(struct xe_tile *tile)
>   	}
>   
>   	if (err) {
> -		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
> -			err_decode, err_str);
> -
> +		xe_log_err(tile, PCODE, err_decode, "Mailbox failed: %s\n", err_str);
>   		return err_decode;
>   	}
>   
