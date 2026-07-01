Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3127C43327
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 18:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543E510F0B4;
	Wed,  1 Jul 2026 18:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IvlJqCmu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7ED110F0B4
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Jul 2026 18:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782930699; x=1814466699;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1s816oSib2bTOAhJspcqKvfCP5wR3NQYCqpNdjoixu8=;
 b=IvlJqCmup8swvU0dJv+dpMZiApld6gqQWcgYLK0GEuM//qHfzFH1Mrnw
 FzAemAhDRdCsQSMy2zqYpmyV3VAl6Rw9pCkjHeWGeQ3GPylTP2zR9M7+Y
 59F2ru4eXMZCcXz5ULHN1uA/+nyDHvjdzOIkuzBeGQeOb2Qru+enL5vMA
 THGGHAZSaDwcwlmO0jbOO6gGREJjrWLs3diXUUSBrUyt4PEgLnCwGsZXs
 9tsgOIQCMNr4ehDiEJsG0KTMj5wwxNPyauXzhNFHO+wOWlBbVHTGRgAsx
 yhLMIZF+Eg2y4YaVstSv37ztGs71WIi+NmVUTeuCt7E3lBeCY6DUFs4a/ w==;
X-CSE-ConnectionGUID: 5nwc2Sk5ToywH0Q78dLcuA==
X-CSE-MsgGUID: PeOZniP8SEKvtLPrG8PzeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82788972"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="82788972"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 11:31:38 -0700
X-CSE-ConnectionGUID: xAA+mja3TxqKy//2FYz2xg==
X-CSE-MsgGUID: kUa1ZReRTniDrR1mDbkdpw==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 11:31:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 11:31:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 1 Jul 2026 11:31:38 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 11:31:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stbO11p2pRz6rCQ+iYNjbGpHxZknH26rws6sWZGeJJ2cgM+GtZq2RtyZKF6oR9GJqiijRe2u41jc6B2afji3yHBtyYObQ1x0Dcs9hipfq3UaholkgXaWPMV53YvOv9mmahlBvoWmcB9mzgPTg0jHtVUzr/2A31Asv1CAix4UsDTyMbt0bC/63O5AsHnkdZyCcswE8gk8LH6ymDtOaSlEH1Rdg4EZOTUHjDBPyDWn1IEauuag1VHfOLLlG1MD1pmFz9BNtA3B8kdEc7RsPYUZZKnNU2rsNouRiglR12avKYvQ/WOIbwE/cb1aeP15FV1yvEOjoTmsCHBrTv4VUUt9yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imhcPaj6YJvJOhtoNZ24Hj6uIe8595hgk9KhYI1jNQQ=;
 b=lKmtCulXkWHFdB19cYxdEkSi+QmJVr5WFVMudo17niR/+WfiAImOzTpfLyTa8ZHnF4KzCDXIW7ldJlTYZbgefsKgdae4R21XE/9hzPv1pgPrJrLCSNvvoWNb0dApszbCKwm5Ipz9oqusoCGfYPJn6uVKvAraDI8Y/xJRZpzasCFOR6Ix7tep5KBuEqrgPzCSgMNRXyxwMXs9sjkxSzcte/V+h4Oh9X1z6cVtHngJdBpQBI/zooTdumgWEVN4d8SDTYk2gCZBxiyjCgL6D9qT0+Pn+Zg9X6VCpDXzC6FaTfKhLpyU2kkRdFPgo8qgiSASBFpUF8so3jqRmSNxo7rieg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by MW6PR11MB8311.namprd11.prod.outlook.com (2603:10b6:303:241::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 18:31:30 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf%4]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 18:31:30 +0000
Date: Wed, 1 Jul 2026 11:31:27 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/xe/eustall: Add WA 14027054324 support for
 graphics IP 35.11
Message-ID: <akVc_4Pp1MyCM5IH@intel.com>
References: <0bcb2f8bd8380544971d3036a01f28aaa8e9ffa7.1781650756.git.harish.chegondi@intel.com>
 <20260624205851.GP6214@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260624205851.GP6214@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY3PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:254::25) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|MW6PR11MB8311:EE_
X-MS-Office365-Filtering-Correlation-Id: ff48ecbe-8409-43ba-042a-08ded79ef833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: MoPE0zkk6GHsrlhM8TJDwtX5NX2tprJpaGsI3Kr2gRq2TFIwG8+Ae4vgEaW6y/DimJ2PRPY8ztWUF9W3YCXPQu2o0Q0aCGexxXpTIbfgTdtFrkTjny7GJBIU693nGdMojl+Sm34TeZp5b9zTdaKMlIRuTy9sUdlGmeGTjcyaipPPw8CIsG1C5da7muo5i8D80Hwu1UmIgOBwRPrf4MlBcI1QEDDpIMVFcCRgNOAw0gxCMDr78S1xSLYRTNfNUQx84xLdMKhF3ZppL4PkwjKNJ0oxzj/5eDO6aHL+ZlSAAUkuDEH8vVx08AkuWv6HQMsrZyVo1hYXLjtM9L7GgNTQiYZJzw60/jZPwEry9r1JAOk/zUH/NWq50lzE18JpGcn9xKCWP2HQDgMr2aYb7uXec6SiVQA82E11HUipoYt6ELh6dbYxOywEnwaZecXgjaql4D4YCvQ7qf6ilLkKyGTvOdbna+Zo7osYj7/dZJR03aagOZ0KcC/pu68pTro1q11mUxopGQ1BHT6yjsHOv2AUBDouii6aGiEH4tS8umpdnRqWCfPCt3fogbmDzyGpRiqql+QPHum6GwUMAsziBpxPObCyYGSeiFgDZVE6YSCr/CQ8/bmyDt/0qf/nJ2yCTzenQKceUm+ugNwEbkQ36cZ6iZF522wJzXfwG6W1Z92M94I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmkxRmkzUUxhWVhJb214WkRZS1RCYzROM2Y2S0RGNXJUayt2RWxvUlNsMjBs?=
 =?utf-8?B?bzB4UVZLOEt2OU14Mnh4b0g1Q0V0RU9vNG8vODE1N1ZCWkFONWJYN1A5dnhL?=
 =?utf-8?B?ZS9PMTBGa2hYMlZnK0t3bGlneVlhaE5xTGdmTjFzVlVYNXoxSnl1akdHNzlZ?=
 =?utf-8?B?Smo1bWpFdXNjbzM4NmE2NXJVazd2NDd0UU41eUFsbDlHeEU0cmdWc2E2eWJw?=
 =?utf-8?B?SWdzUFBoRTZVNlU1NVdKeWxGQzJtZExhMllUR3p0WXRsZlBQcURONWtxR3p2?=
 =?utf-8?B?MmwrTS9OeDlUQ2tUWGhmUGZCZEZ3bVhrTXJsTGt0ZDZaSHVDUkttTVJld1p4?=
 =?utf-8?B?c2czMWtGbFhNQ1FHUERGU0RUcDd3bXFjKzFFcjIybjUrVUlwZjZPS1V1dUhx?=
 =?utf-8?B?T1JkU1h4MEIzVk5pV2YzRU9jSmt4ZHc3Rm9UWS9Da0dObVJBOUtxR0JiQ291?=
 =?utf-8?B?bFBIVkF6RG92NGRzUGVYMzYrbXNTY0d3NUtGenVHVVdrVkVCY1FEM211L0xr?=
 =?utf-8?B?UDMyaXEwek4xTUFuWis5dE96QmN3anBJTFhJUkVDQUZHTnlDOUZabDhOcHhq?=
 =?utf-8?B?dFJWYVRmQmZuOWJkSWxudHkrUldCY1RITHBDT3ZwenB4U2duMEF3M3hJTFpZ?=
 =?utf-8?B?T0NWRGs2WnNZUXhQVXZOYmtERmJPTkJ0UFVQc0RhNEhVZXRadGJkNmFvR3dv?=
 =?utf-8?B?VzRYL0VSbEF6eVdKKzV6b3luQlFhS1VvWmd4Q1NiV2I2QW43K1ZzVmU1OCs3?=
 =?utf-8?B?cXVlSWJ5OE9YYWYvOGRCSU1EMVo5VDdESEtHRkcxSUJ5SkhwL1ZGNi85RVR6?=
 =?utf-8?B?SWpJcllLeFRoN202QkRXVEpNc0ErSzRrdWZ5a0Vra1FIRzRLZVhlUGtUZzFr?=
 =?utf-8?B?ZFlCZTB6VGZZMmlxaVBwYmhBajBZN0pxL24rVHFvSXRuUkh2b3NvVnZ5TW42?=
 =?utf-8?B?WUhiMmhKUitaUUJEWW9JSHQ3YTZUR050Y1VKWDF6bnAvZHFSNW4yL20xeHRG?=
 =?utf-8?B?TEZCbmFNV2YrZjlINjFRcEpnUHovWjVmSy8vaUdocmdYdGpmbnR1SWFBNDBW?=
 =?utf-8?B?dGxRSHQ1Slk2dkxid1pyZ1JvM3VUNFJpNzdPT3B6cUd6TnBNQjRzQllFemsv?=
 =?utf-8?B?V2J2djRSQXBkcDE1OHN6RUNwRlZlUmRBVDQ5SkloakJUQ1RKTTd2eVJ3U1Nr?=
 =?utf-8?B?RHgvQUNaTGpac3drUWhqTklwQUc2OEV2eU5pT244WndCSHptNVBTSE1tWFNs?=
 =?utf-8?B?ZUJzYWU5KzRPRmR0NVRlR3ZDU21YV2lwTnZBVDRPRG1EMkFsajBJZDI0TmNw?=
 =?utf-8?B?WWNsUnVqNnUvMlQ1bFBRVGVxU1ozdndsd08rRHgvS2oyNk9hN0gzRTVwcjRv?=
 =?utf-8?B?djMyZndxVURobmt3UTcyODA2WmxmeTVQbmVUU0dNQzNLU2poSkV4YXlIekNI?=
 =?utf-8?B?NzVBcWxYNDNlR05yTDdmekVBRllKME1rblFvbEZOcFV6U1JhYXpUT0FQaHNF?=
 =?utf-8?B?V3VCR2VLbm5pSTVaeC84L0NsMnh0WjZkb1dubUVsQ0VoZjFBM0FUeExTL1NL?=
 =?utf-8?B?dnFmZnpieGM2VU50V0JuWHNxTGlZdWtqTkNlNHAvZVpZVzZCRlMvMnRHdVV6?=
 =?utf-8?B?MFJqWWxYcVZpVXBqSk43K0ozMkR1TTg3SXRvdVpydmhxRnB0SnQvYkozaEZP?=
 =?utf-8?B?T2k0eTF4OWdmdjhMZEZ5ODFFZU4vMzdFRE5wbG5SdzBwY2JKM1VVVmk0RHd6?=
 =?utf-8?B?MjZCMW1LTXpaa3hOUktpS1EvK09SYlYxRWhyQ3lOUUdrdnNEYVNaNDEwalJ6?=
 =?utf-8?B?dTVsaDlIN1NEdTlLWGx2cFk2U3V2NTIvc052Q0xSYUtsOG5JSTJEVXZ5Q0oy?=
 =?utf-8?B?enJ6c2cyd3VpQ3VkZURiUGFXcEM2WGFnTHk2aDNPc1M2bnpEMHJZR0FaT0U3?=
 =?utf-8?B?NWtMOHZUelAxNm1iNU5BL0hSb1ZqZzU3RytxVStiZEVOMVZzSFFCaW9RL3dw?=
 =?utf-8?B?YUxUcFNJKzB2U3NHcHJSVERzSFdEenFQTWF4RGpJaTZ4R3ZNT1lLTXVlT29h?=
 =?utf-8?B?Z0hMUjAzNzk2MjBoWlpNOVB2NG1YejNUL3dkR051MkRHaTRXNHM0QWJ6bTlG?=
 =?utf-8?B?TW9POGxLSC9jS1lwaTcxYVhPUlBCMWlGajJnNXRXZThKcHJkaDNlLy9yL2d6?=
 =?utf-8?B?aHduUCs2dW1QeVI5SitoL3FUL1FOaElvZlVqWjNUS0pNc3lWNTdpaVIwd1Z2?=
 =?utf-8?B?Z21PcDVWTVhLUkF1a3JBVW5aZFRxQWQ4TjNuclpqaVFXL0Eva2wwcTZNMjJs?=
 =?utf-8?B?eU01d0Nqd1JQbjk3SU9BTXFPU3BBTWRSeUJSVEFzOEdsOHQ3WHhjSC9PQW9j?=
 =?utf-8?Q?gMMQb10c/24sdNzE=3D?=
X-Exchange-RoutingPolicyChecked: LltRgftj1tlpYIQaIlRIxKr725bbpuN+sMD7Gd/6ZF6YDVfBNysBoW124IeuyrnYtrIhpHWnMpwKZisXEDNpBuIY2fI6iXYF82JUlsjgAxDE/DpIwbrZTud8uhge0G+RXFSgcnttUPkhE8u/+sc16A6tQuEZJlpP2irRC8WirymaFfNW51Ui4MmHQRvhGulpXXmgALcCF8LzgLtB1Yqsmf+oZnmna6kB5OIl3xR2nICuxn4YkQnANCmcwtS/3RND6/rqgspX7glx/Lb3aNe+TjNSamlPHGpKG18lw8qDsAJhExNLIT3KQ7MHzmOJp3xR3suvzDq+AKonE3xi7+uDWQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ff48ecbe-8409-43ba-042a-08ded79ef833
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 18:31:30.3695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cM69xVFKa2Whzvt9Y893fnYW+J4xXbcX6J+CLk5BkmDOcn+yYAIBOCLBNXoPs0YojWaRCB9I2XywQ5pqz0+TPQH621LfvuLPco5H5Wg92Cg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8311
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

On Wed, Jun 24, 2026 at 01:58:51PM -0700, Matt Roper wrote:
> On Tue, Jun 16, 2026 at 04:00:18PM -0700, Harish Chegondi wrote:
> > WA 14027054324 is implemented in the firmware and is applied before
> > EU stall sampling and reverted after EU stall sampling. The driver
> > needs to notify the firmware whenever EU stall sampling is being
> > enabled/disabled so that the firmware takes the necessary action.
> > The driver uses a scratch pad register to communicate with the firmware.
> > 
> > Before enabling EU stall sampling, write 0x20 to the SWF scratch pad
> > register to request the firmware to apply the workaround. The firmware
> > applies the workaround and sets the scratch pad register to 0x60
> > as an ACK.
> > 
> > Before disabling EU stall sampling, write 0x40 to the SWF scratch pad
> > register to request the firmware to revert the workaround. The firmware
> > reverts the workaround and sets the scratch pad register to 0 as an ACK.
> > 
> > Bspec update for the SWF scratch pad register is still pending, but has
> > been confirmed offline with the firmware team.
> > 
> > Bspec: 53188
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
> >  drivers/gpu/drm/xe/xe_eu_stall.c     | 37 +++++++++++++++++++++++++---
> >  drivers/gpu/drm/xe/xe_wa_oob.rules   |  1 +
> >  3 files changed, 38 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 08251c7a1a4b..2a649d036660 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -616,6 +616,9 @@
> >  #define   CCS_MODE_CSLICE(cslice, ccs) \
> >  	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
> >  
> > +#define SWF_SCRATCHPAD				XE_REG(0x4f000)
> 
> This register isn't part of the GT, so we probably don't want the
> definition in this file.  xe_regs.h would be a better spot for a non-GT
> register that doesn't fall into one of the other unit-specific files.
> 
> Also, even if we're just using one of the scratchpad registers at the
> moment, there are technically 36 of them in hardware, so it might be
> best to make this a parameterized macro and use SWF_SCRATCHPAD(0) to
> make it explicit which one we're referring to (and to support future
> code that might need to use some of the other ones).

I will make the above changes in the next version of the patch.

> 
> > +#define   SWF_EUSTALL_MASK			REG_GENMASK(6, 5)
> > +
> >  #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
> >  
> >  /* Applicable for all FORCEWAKE_DOMAIN and FORCEWAKE_ACK_DOMAIN regs */
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > index d37770c58c5d..fa54187de5dc 100644
> > --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/fs.h>
> >  #include <linux/poll.h>
> >  #include <linux/types.h>
> > +#include <linux/iopoll.h>
> >  
> >  #include <drm/drm_drv.h>
> >  #include <generated/xe_wa_oob.h>
> > @@ -20,6 +21,7 @@
> >  #include "xe_gt_printk.h"
> >  #include "xe_gt_topology.h"
> >  #include "xe_macros.h"
> > +#include "xe_mmio.h"
> >  #include "xe_observation.h"
> >  #include "xe_pm.h"
> >  #include "xe_trace.h"
> > @@ -30,6 +32,11 @@
> >  
> >  #define POLL_PERIOD_MS	5
> >  
> > +#define REQ_EUSTALL_ENABLE	0x20
> > +#define ACK_EUSTALL_ENABLE	0x60
> > +#define REQ_EUSTALL_DISABLE	0x40
> > +#define ACK_EUSTALL_DISABLE	0
> > +
> >  static size_t per_xecore_buf_size = SZ_512K;
> >  
> >  struct per_xecore_buf {
> > @@ -682,7 +689,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
> >  	struct per_xecore_buf *xecore_buf;
> >  	struct xe_gt *gt = stream->gt;
> >  	u16 group, instance;
> > -	int xecore;
> > +	int xecore, ret = 0;
> >  
> >  	/* Take runtime pm ref and forcewake to disable RC6 */
> >  	xe_pm_runtime_get(gt_to_xe(gt));
> > @@ -693,6 +700,19 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
> >  		return -ETIMEDOUT;
> >  	}
> >  
> > +	if (XE_GT_WA(gt, 14027054324)) {
> > +		/* Request the firmware to apply the workaround and wait for an ACK */
> > +		xe_mmio_rmw32(&gt->mmio, SWF_SCRATCHPAD, SWF_EUSTALL_MASK, REQ_EUSTALL_ENABLE);
> 
> Since the workaround details still aren't updated yet, I think we need
> to get someone to explicitly confirm what the expectations are for this
> register:

I have requested for the workaround to be updated and they did update.
> 
>  * If they guarantee that this workaround is the sole owner of this
>    register (none of the other register bits will ever be used for other
>    purposes and/or other software/firmware clients), then we can go back
>    to just doing a direct write here.

I have sought clarification on this and I was told that as of now this
workaround is the sole user of this register. I was told that the Bspec
page of this scratchpad register will be updated soon.
> 
>  * If they can't guarantee that other bits of this register won't be
>    used for anything else, then they need to provide some coordination
>    strategy for updates.  Read-modify-write is racy, and it's not just
>    other KMD code running on the CPU that we're potentially racing with.
>    There could be firmware-to-firmware communication going on in other
>    bits that we have no visiblity of, so no way of knowing when it's
>    "safe" to do an RMW.  That's why things like MCR steering have
>    special "semaphore" registers that are used to temporarily acquire
>    exclusive access to the real register.

I was told that in theory the other bits of this register can be used
for a different purpose in the future but there are several of these
registers and usually other register instances are used for a different
purpose. Also, as per the updated workaround, the initial condition is:
SWF_0 == 0x00. So, is it safe to assume this workaround is the sole
user? If so, I will change the patch to doing a direct write.

> 
> > +		ret = read_poll_timeout(xe_mmio_read32, reg_value,
> > +					(reg_value & SWF_EUSTALL_MASK) == ACK_EUSTALL_ENABLE,
> > +					1000, 1000000, true, &gt->mmio, SWF_SCRATCHPAD);
> 
> Was the 1 second timeout here suggested by the firmware team or
> workaround owners, or are we just picking something that sounds like a
> long timeout and hoping that it's long enough?  If we're waiting for a
> formal update to the workaround text, it would be good if we could ask
> them to provide worst case timing information so that we know for sure
> what an appropriate timeout value would be.

I just picked 1 second hoping that it is long enough. I have requested
the worst case timing information to be updated in the workaround, but
it hasn't been updated yet. But it is mentioned in the workaround that
the system controller polls this register every 1ms. I was told that the
firmware response time to apply the workaround should be 1ms too. I
think the timeout can be reduced to maybe 100 milliseconds. I will
follow up on getting the worst case timeout into the workaround details.

Thank You
Harish.

> 
> 
> Matt
> 
> > +		if (ret) {
> > +			xe_gt_err(gt, "Timeout polling for EU stall enable ACK from firmware\n");
> > +			xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
> > +			xe_pm_runtime_put(gt_to_xe(gt));
> > +			return ret;
> > +		}
> > +	}
> >  	if (XE_GT_WA(gt, 22016596838))
> >  		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
> >  					  REG_MASKED_FIELD_ENABLE(DISABLE_DOP_GATING));
> > @@ -730,7 +750,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
> >  	reg_value |= XEHPC_EUSTALL_BASE_ENABLE_SAMPLING;
> >  	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
> >  
> > -	return 0;
> > +	return ret;
> >  }
> >  
> >  static void eu_stall_data_buf_poll_work_fn(struct work_struct *work)
> > @@ -840,6 +860,8 @@ static int xe_eu_stall_enable_locked(struct xe_eu_stall_data_stream *stream)
> >  static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
> >  {
> >  	struct xe_gt *gt = stream->gt;
> > +	u32 reg_value;
> > +	int ret = 0;
> >  
> >  	if (!stream->enabled)
> >  		return 0;
> > @@ -853,11 +875,20 @@ static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
> >  	if (XE_GT_WA(gt, 22016596838))
> >  		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
> >  					  REG_MASKED_FIELD_DISABLE(DISABLE_DOP_GATING));
> > +	if (XE_GT_WA(gt, 14027054324)) {
> > +		/* Request the firmware to revert the workaround and wait for an ACK */
> > +		xe_mmio_rmw32(&gt->mmio, SWF_SCRATCHPAD, SWF_EUSTALL_MASK, REQ_EUSTALL_DISABLE);
> > +		ret = read_poll_timeout(xe_mmio_read32, reg_value,
> > +					(reg_value & SWF_EUSTALL_MASK) == ACK_EUSTALL_DISABLE,
> > +					1000, 1000000, true, &gt->mmio, SWF_SCRATCHPAD);
> > +		if (ret)
> > +			xe_gt_err(gt, "Timeout polling for EU stall disable ACK from firmware\n");
> > +	}
> >  
> >  	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
> >  	xe_pm_runtime_put(gt_to_xe(gt));
> >  
> > -	return 0;
> > +	return ret;
> >  }
> >  
> >  static long xe_eu_stall_stream_ioctl_locked(struct xe_eu_stall_data_stream *stream,
> > diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > index 9027365f0043..41734b9672c5 100644
> > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > @@ -66,3 +66,4 @@
> >  14025883347	MEDIA_VERSION_RANGE(1301, 3503)
> >  		GRAPHICS_VERSION_RANGE(2004, 3005)
> >  16029380221	MEDIA_VERSION(3500)
> > +14027054324	GRAPHICS_VERSION(3511)
> > -- 
> > 2.43.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
