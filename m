Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B81C55ABF
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 11:31:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C682310F18D;
	Thu,  6 Aug 2026 11:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DsPVYI++";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F06A10E31F
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 11:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786015889; x=1817551889;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lkqR2PNXGkDQjYjFuOnHAEoql9108urqKN4/6u7p3GY=;
 b=DsPVYI++bC/P1uv/vbLFeFNSFofJzJMmOSgPJ7R4Tt9XkcdEB9yLOWhl
 s5FcBPHbHxvCndu1chcCOSeN0olS76IIzBq8TOCbZ/LGlUsejSM+vjERX
 JWZcqrMldz3wCBMkaMefLacxXE6IkK8QU10AzAz6gcbpOT4R0eJhOCxJJ
 48QUuE+ayM3RjmWNEV4uAuzxUlh4yXHMw8AJTSEGpX4WfJV3IR6+ddBpX
 WKLXtbvFxHbth5EGZy6pG055yY7NW04YEWXoJwdBz/I46Twa9jmtCum+2
 kCqPw4vzb/So3FQ+AypX31m7whquHTppH58aQLMFUNxOGOBF9VKAIZ+f9 w==;
X-CSE-ConnectionGUID: Q7Jhl3KbTTum1DdDgA+muA==
X-CSE-MsgGUID: S7SfUBvKQJOpD9KABsHSwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86618161"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="86618161"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 04:31:29 -0700
X-CSE-ConnectionGUID: aj+rym4BRGOqOYjCa1WwNA==
X-CSE-MsgGUID: qqY81s6bTsKRYanpDCB0tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="258755502"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 04:31:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 04:31:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 6 Aug 2026 04:31:28 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 04:31:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MuGa4oeelfByTtWt3YHViXk5OyXhchyDAIhHNwlYriOYVoe2dOLJW0bu5rt9njpD+pZl1z1Y0cshXUboUJONGPAVm/syHf9E0lmP/p5rqIXMLesM/E+pNASd9Y5pqmnc3SHmmOtjgDRxlh1fiuCA31OoOtYQ4rZLIMWrXlGCMUmImBsRrTvDdDGsP11cwoxJOsaKjVMYB3r591WF2PaGigGnsuLV7VK/Lgy6F4DMHJLxYST9bbhPerMFVhUXkN8FSyyJJyQeAyUnb+Zh501WOkk8dA3m3rLPOgPBJyOb/ZF2xeTA8A4Pm+fFxAMt2brGvPSvjS3JnR04x9aQ7r1cQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+MXlSKbSlqO1J3RQ45jnTHwP4dDzmsAOY2J+mLiC1a0=;
 b=SPDEmX1CJ6HmB3obQV8FnBzap8fACW7/jUiyTB2dEqtAFqSfVYb/M8aPGqq2Pp9isJk7JfVR+w9bvPKy9sRjXAkpzHHMy+g0HqVg3rOlePgNr5B9C7BTmPaC43WbQyE8qnqO1wOyvWd50NvP4IfpVSR9WDRCD+YqGaDiaKl6gG6TkfF7Lhss+W+s90kRLhxvlkI4pRcTOmCuf9SwrITty/s7nVP6StnKKW11o0rxIuKUpBy7zNwqJQ+kGgiofvn5fW2wr+tZ3TFvxGjJdtMocIougx3k9EK0oaGImGUbeTvH/ViMMYTxlYbbGRLNxS5mDgDdpzd+JPwKK1m1lT0aoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ5PPFC4905B1D0.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::855) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Thu, 6 Aug
 2026 11:31:24 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 11:31:24 +0000
Message-ID: <8e65c45f-a8c0-40fe-96a3-da93d8e95aaa@intel.com>
Date: Thu, 6 Aug 2026 13:31:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/23] drm/xe/log: Add structured SIGID error logging
 infrastructure
To: "Summers, Stuart" <stuart.summers@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Tauro, 
 Riana" <riana.tauro@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>, "Levitt, 
 Yoni" <yoni.levitt@intel.com>, "Iddamsetty, Aravind"
 <aravind.iddamsetty@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-3-michal.wajdeczko@intel.com>
 <522ab2835b03dcd101d52fb752b3fb839ed0c15c.camel@intel.com>
 <anKTkC-thNA53RWy@intel.com>
 <b9e4c2b0ff6cb92797e75bd53a303f514b73322f.camel@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <b9e4c2b0ff6cb92797e75bd53a303f514b73322f.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0135.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::33) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ5PPFC4905B1D0:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f4927fe-b400-43b1-0513-08def3ae3f0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|10067099003|4143699003|6133799003|5023799004|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: Qr1DKt1n1qiz8NjiK97eBbfQRXshBS8aW/aObSBA6HUQZJcDuahFph8xfoOzIEcTn/fVXkeUgJxM6HCSDTVJdpbEBd7lMtsACPoUFcgGzXCblA1q2lWFpPBbB9QKAbo7sXTbtGlj/XHI9VU1FgCbClE8+dbhIFjEWMjht7uwMr2JfVSx5p/VUJDk3Y2UG0yOanPoKdQwn8lfD+H7XQeKqBAsDUpO2Jpe5sMpNqoHo/AK2rHLTcV4jjgd+fxhQzd524sCILZ8O+4mE0/Ex6xB/0HlB+0C/ZVoj+DKVE+gQU7FkQTe+R6dIXrAzxNBhTgGetV3n3CnbG2wqXbh5Rjxjd3hVkwKYvV/DbpBLllZ7zxC7oWD0Y18eQm7iQdep0Ness3E+Ez3bRM7gnQ4zpEIsymqoyhzb32u0WW4Iw1Faf3jNkNt6VmbXhNbmEQitIleiKLFhU3j17riwsTDwsa/LSF+v3vJC+DUk3dU7r+g0NwjdSB9kPtzt+/cK5l8GgBcHsbh6Tiky9sJV+mDswM+t3mQJZPzm4iRZgvu5B1ZCQzmCKyLQBdtR+8E48YAN4db7xOKvQNE46WIpi8FdYl6jXnVdcNqyehQjy7Veg7OFZIW/t9sVfrUeEfcT8XG5ahIICWfCX5U4TIDtnGe0vGPfHUxF5R2s84uJi0HCG7xz5A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(10067099003)(4143699003)(6133799003)(5023799004)(56012099006)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUtkTXRhSVBvN1RvOWhDYlZ2WDRWbW95dEZHVFlxTm9YTGJ5VytTVWx6ZDZB?=
 =?utf-8?B?a2ZCWW05WEdiVE5oU0ZzRE0rbCtrYmZhZE9HMUR2c0xCQkZia2MvK2dkR0tQ?=
 =?utf-8?B?Y2Q5M0tTRWhxTUM1M0RPWVBRU2M2UWkzRCtrWVhXdUNTVHBHMHpDcmhLU05U?=
 =?utf-8?B?SGwvdmJPME5wV1FTd3pveU5xanNNTTR5VmM5TU9ncHl6elZsVUxxY1cwb3dN?=
 =?utf-8?B?d2tqQjRQQVRzcEMxSWJEaEUwMEhYUXFzandKZFhYTzRUSFltWXJZaXRTM1VM?=
 =?utf-8?B?UWlRbGJ5U0hkNE5CQUZlMVFGTkRrbXZuamNFNlpmK04wNkQzWG1XOVdJSndP?=
 =?utf-8?B?YXNzeGowMU9iaUVVdS9qUkFkQWpJaDkwOHdOVS9vb1Vja1VJNFlFSHhkanYw?=
 =?utf-8?B?c2J5SkJLUVZtNE9MVm9nVDhReXBCdGhRSGtZbDhUZ3NRbkFNMm5Gd2RNWWlw?=
 =?utf-8?B?c2Jwa2IwV0d6Rk1YOFVCVUlnRzlYWVcyak9CK2phZ2plOThvcWNLbmlrSU5F?=
 =?utf-8?B?dHI4Lzliczg4M2l4WEZrK2dVMUJYaHBwaXhhZXpacmpTQUhlb0J0bjhMOThq?=
 =?utf-8?B?WC9rcDAzbXo3ZUNlZ003ZnBHOTB2Ujh4YVMybzRmNjdyZldoNlJQSmRVN0lx?=
 =?utf-8?B?WkJUSW5OTWF2QldVMXlnUWJ0OXl2ZzROUFlKVHoyQndldmZWRnUxTHN1bmJ5?=
 =?utf-8?B?YmNJaVRyR1BaY2JNRTNJTy94NERZNkV3WWYrRmZJL3JOOWo5S0g1VlNrSUVG?=
 =?utf-8?B?UUhZM0loNDBDQ0VMSFdXMkpVR0t0NjltdHhJMDVnSFpZYnlNOHR1cXAycHox?=
 =?utf-8?B?Ry9zZ0twMWU3U2wwUVNSZGdSazV0UmR6aXpjV0ZhaTBIcFRSRjkyMWxTSkpO?=
 =?utf-8?B?MzY1YTNqMzdja0F2VTRqbm9GaGhmZ05sZW4vRkI2cXhOanpyaTFwWXE0Z2d5?=
 =?utf-8?B?cFI5Ukp3eXRaSFI3NStCUFo4MldUcktMS1NiRFpGMUl5YXUySlJpeXVDUmFp?=
 =?utf-8?B?MWU0Z1hkZFVVNVQ1V1Z2WGtPSytMNUpUWmhBVDl4d0p3T1ByODJaTEZBSjEz?=
 =?utf-8?B?QmlvRHBLNUJaa3FScWp4NmtIYUp6bzE5RWIwb25EWWZ5a2RFbDYrU1RaeWVN?=
 =?utf-8?B?ZHo2SUIwUXdJMTZkVkVMSFNVbWIrbDdQYkh1TEkxSmVCS1QyZDdiaS9SY0hG?=
 =?utf-8?B?b2djbVdZTjloTitpQzdWNHVoZ2tUQUJhL3FVTVJhamZIRjUzUWNLQ1NhRkFE?=
 =?utf-8?B?SXJrZHJVNWFmMTUwLy9aMXMxOWhSUTZGSlpDbWpOUnMvOWF0WmczdlNveHhC?=
 =?utf-8?B?YUZFemc5dWJiYTZGMUovV2p2cEJnRjYrR2xUWFRMSGFRQ2hWTCtiUkxkM0g4?=
 =?utf-8?B?UnJCZENhYXhWcEoyWUtQRjN1WVV3MUVQN2RTdVFja0s4WndUa0duMGh1T2F1?=
 =?utf-8?B?cFdOaURyNXRPYXNxclpxTGR2cS85Mm4ra3A2dzRsZlpSQVpZc2Y0U3kvMXhS?=
 =?utf-8?B?eHk0UkZuZmxzZVFzTEZtMEI1NVN5cDdqc2xUMGRYWUxZamZPcG9PRWdSbXVR?=
 =?utf-8?B?NmppcHQxUGw4Z2s3TlFTbkVEOUVYdHBkOEdxQUZJdDBBeU5hMm9yM0ZSbFRS?=
 =?utf-8?B?OUloUHgyem1VTEROcVpVMDN1VzNFUUpBUjF3endnWXFGNEY0ODE5QzRxVENl?=
 =?utf-8?B?TllZUEdZcFNidGlLdmEyNVRZeWs4Zi9LcFVMaDdqc2wyU3NEenhnYmlCSHlF?=
 =?utf-8?B?MWp1WFI2OWl0aVFocGFMYjZSYW9KdUNvY0ZndXVseG1NcG4wY1Axc21CZkFC?=
 =?utf-8?B?OWtwNVk3TXNhcDNoa1NBYUdGVU52eE92a0lJd293S244Uk5vczhLcXdsQ3Zj?=
 =?utf-8?B?cUJ2ZVJrS1NnYTN0aElFclNta3JsLzRyZVQyZGI2dmpraElsMG5Idm4xVmE5?=
 =?utf-8?B?KytCV3EwRzlPUU1vZFpOYitaQWJJWnBxYTdLMHh6VlV0aE9aVDlBbTZ4MXBs?=
 =?utf-8?B?VC9Tc3d1WEtSSDNONy9aN3hLVW9EK3NyKzhmUk5FWGpodEJhZmxZdC9wUkx1?=
 =?utf-8?B?OTFrTGlOditrVzFJK1NGUGFEM3hHNXFSL3NXQUpxbzdUQTBiR09ZM1F4ODN3?=
 =?utf-8?B?YndsWE1XRjZiNUlDWWZEUnh1R1BPRStaNVBkRFRBWnYzZmFOTmZoOWxLQ2I3?=
 =?utf-8?B?Qk1zazdmSkRiL0FZM3hIaTl3UUNOaEJ5UmRHOG5YTEcvWDNhOEhoYVc1b1dN?=
 =?utf-8?B?bG5lSC9EUEVVaGhPdm9SeG55eFRvdlBiLzNrZERibjJSUUZjUVAwOWhMQ2V3?=
 =?utf-8?B?eWN6d1JJRkZlcFJuVWVhSkR2eXVWNGoybmc0TlV1cVVEUmEyZlNsWHo5U3RB?=
 =?utf-8?Q?tdoOt8yser6lcL74=3D?=
X-Exchange-RoutingPolicyChecked: mAVduK+Lgu3/iyRxtKaI1nkdC55SWYbe0QAf4XKxETpap47xz02hlyCiDaal5tdmImC30vxWm9GvtG3mOlcz3u+0K5zVV6bVXOptmOy8XQezor+3uuN4ezCK+QMZqxoTaWD88/8InKEVqkUaEIASVu6jQlluy4jSdkiQwOuRa/q1nSUgmyH8yEC4Ivxr35iDm3Jx/CpBg0eE5/iHgOLtUSzNTq8RfXJ6VHFlRKVb08Iu2MH5009rAe1NsbOV6GNk1O03G707Aq2MszGSdUJbvTA/raWHBp1U58c80u3JSuPLUL6zMCZiiFFG/2cXd+ftV1jF73OeN4KL8Vc8Ums+hQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4927fe-b400-43b1-0513-08def3ae3f0f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 11:31:24.3203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOrpuy2fyFGZe7ij9I464yQrt0nDDw7BZmC7/QY7jKjIQZVxJVnYr9vVlB9CuO5V4V3Wx260YEj+elZH+OKpWwkKpiXR+zoElGebTeOQem8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC4905B1D0
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



On 8/6/2026 12:24 AM, Summers, Stuart wrote:
> On Tue, 2026-08-04 at 21:36 -0400, Rodrigo Vivi wrote:
>> On Tue, Aug 04, 2026 at 05:21:05PM -0400, Summers, Stuart wrote:
>>> On Thu, 2026-07-30 at 17:20 +0200, Michal Wajdeczko wrote:
>>>> From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>>
>>>> Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
>>>> strings that have no stable shape. That is readable for a human,
>>>> but
>>>> it
>>>> gives fleet tooling nothing durable to match on: the wording
>>>> changes
>>>> between releases, lines can be rate-limited or dropped under an
>>>> error
>>>> storm, and there is no consistent way to ask "which recognised
>>>> fault
>>>> just happened?".
>>>>
>>>> Introduce a signature identifier (SIGID): a small, stable integer
>>>> that
>>>> names one recognised Xe fault situation and serves as the primary
>>>> handle
>>>> for triage. A SIGID maps, through published end-user
>>>> documentation,
>>>> to a
>>>> description and a recommended action; the driver only has to emit
>>>> the
>>>> right SIGID next to the usual human-readable text.
>>>
>>> I'm a little worried
>>
>> I understand your feeling. We've been all through that:
>>
>> https://lore.kernel.org/intel-xe/amqhoFzQaf1HsuFq@intel.com/
>>
>>> we're introducing some ABI with this that isn't
>>> really maintainable in the long term:
>>
>> I understand the fear and indeed the first proposals I got was
>> unmaintainable. My first record of pushing back on having something
>> like this was November last year.
>>
>> But I respectfully disagree here. This latest version is imho
>> organized and concise.
>>
>>> we might decide to change the
>>> flow or change the way an error is reported or the situation that
>>> triggers this error from firmware or hardware might change for some
>>> reason.
>>
>> You are right, dmesg is not ABI and it will never be. these logs
>> are aimed for developers and developers are free to change them as
>> needed. This was a big counter-requirement I gave to the original
>> idea.
>>
>> We are not moving all the logs to this format we are not promising
>> dmesg stability.
>>
>> The numbering stability however needs to be somewhat stable for
>> the CPER log in tracefs, that's the ABI. But then that meaning
>> shouldn't change if the code has to change. A new number should
>> be needed if the component/location/severity or recommended
>> recovery needs to be different.
>>
>> But like I told Raag as well, no developer needs to invent any
>> number, if they don't know just use regular log messages.
>> We are not going to move all the logs towards this thing.
>> Also, the location of the issue is what triggers the ID...
>> it is very simple by nature. And we need to keep it simple.
>>
>>> Does this lock us into a solution for all of this? I still need
>>> to go through the full patch series...
>>
>> Yes, please take a look to the series. All reviews are welcomed.
>>
>>>
>>> The dmesg entries are generally for human debuggability. I get the
>>> desire to make these easier to parse for an AI tool or generated
>>> script, but we also don't want to prevent debug related changes for
>>> error handling and reporting.
>>
>> We are not promising this. The stable ABI is only the CPER on
>> tracefs.
>>
>> We need to always keep this in mind as stated in
>> Documentation/core-api/printk-index.rst:
>>
>> """
>> The kernel messages are evolving together with the code. As a result,
>> particular kernel messages are not KABI and never will be!
>> """
>>
>> Thanks,
>> Rodrigo.
>>
>>>
>>> Thanks,
>>> Stuart
>>>
>>>>
>>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>> Assisted-by: Copilot:Opus-4.8
>>>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Co-developed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> ---
>>>> Cc: Yoni Levitt <yoni.levitt@intel.com>
>>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>> Cc: Raag Jadav <raag.jadav@intel.com>
>>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>> v2: CORRECTED is still an error (Michal)
>>>>     prepare to decorate dmesg with comp/loc (Michal)
>>>> ---
>>>>  Documentation/gpu/xe/index.rst        |   1 +
>>>>  Documentation/gpu/xe/xe_sigid.rst     |  14 ++
>>>>  drivers/gpu/drm/xe/Makefile           |   1 +
>>>>  drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 183
>>>> ++++++++++++++++++++++++++
>>>>  drivers/gpu/drm/xe/xe_log.c           | 135 +++++++++++++++++++
>>>>  drivers/gpu/drm/xe/xe_log.h           |  20 +++
>>>>  6 files changed, 354 insertions(+)
>>>>  create mode 100644 Documentation/gpu/xe/xe_sigid.rst
>>>>  create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>>>  create mode 100644 drivers/gpu/drm/xe/xe_log.c
>>>>  create mode 100644 drivers/gpu/drm/xe/xe_log.h
>>>>
>>>> diff --git a/Documentation/gpu/xe/index.rst
>>>> b/Documentation/gpu/xe/index.rst
>>>> index 665c0e93601c..0247a255f7e6 100644
>>>> --- a/Documentation/gpu/xe/index.rst
>>>> +++ b/Documentation/gpu/xe/index.rst
>>>> @@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for
>>>> drm/xe
>>>> is provided by
>>>>     xe-drm-usage-stats.rst
>>>>     xe_configfs
>>>>     xe_gt_stats
>>>> +   xe_sigid
>>>> diff --git a/Documentation/gpu/xe/xe_sigid.rst
>>>> b/Documentation/gpu/xe/xe_sigid.rst
>>>> new file mode 100644
>>>> index 000000000000..45d84a62f185
>>>> --- /dev/null
>>>> +++ b/Documentation/gpu/xe/xe_sigid.rst
>>>> @@ -0,0 +1,14 @@
>>>> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>>> +
>>>> +========
>>>> +Xe SIGID
>>>> +========
>>>> +
>>>> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>>> +   :doc: Xe Error Signatures (SIGID)
>>>> +
>>>> +Signature Identifiers
>>>> +=====================
>>>> +
>>>> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>>> +   :internal:
>>>> diff --git a/drivers/gpu/drm/xe/Makefile
>>>> b/drivers/gpu/drm/xe/Makefile
>>>> index 67ada1d6c2fb..7ac3954737f9 100644
>>>> --- a/drivers/gpu/drm/xe/Makefile
>>>> +++ b/drivers/gpu/drm/xe/Makefile
>>>> @@ -87,6 +87,7 @@ xe-y += xe_bb.o \
>>>>         xe_hw_fence.o \
>>>>         xe_irq.o \
>>>>         xe_late_bind_fw.o \
>>>> +       xe_log.o \
>>>>         xe_lrc.o \
>>>>         xe_mem_pool.o \
>>>>         xe_migrate.o \
>>>> diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>>> b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>>> new file mode 100644
>>>> index 000000000000..99717fdf74a6
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>>> @@ -0,0 +1,183 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright © 2026 Intel Corporation
>>>> + */
>>>> +
>>>> +#ifndef _ABI_XE_SIGID_ABI_H_
>>>> +#define _ABI_XE_SIGID_ABI_H_
>>>> +
>>>> +/**
>>>> + * DOC: Xe Error Signatures (SIGID)
>>>> + *
>>>> + * What SIGID stands for
>>>> + * ---------------------
>>>> + *
>>>> + * SIGID is short for *Signature Identifier*. A SIGID is a
>>>> small,
>>>> stable integer
>>>> + * that names one *recognised Xe fault situation* -- nothing
>>>> more.
>>>> It is the
>>>> + * primary handle used for triage: a SIGID maps to a human
>>>> description and a
>>>> + * recommended first action. A coarse first-order action is
>>>> documented in-tree
>>>> + * per SIGID (see "First-order action" below) so the id is
>>>> actionable on its
>>>> + * own; published end-user documentation refines it with finer,
>>>> cross-product
>>>> + * detail. The driver's only job is to emit the right SIGID next
>>>> to
>>>> the usual
>>>> + * human-readable text.
>>>> + *
>>>> + * Why this exists
>>>> + * ---------------
>>>> + *
>>>> + * Today the driver reports faults with ad-hoc ``drm_err()`` /
>>>> ``xe_gt_err()``
>>>> + * strings that have no stable shape. That is fine for a human
>>>> reading dmesg,
>>>> + * but it gives fleet tooling nothing durable to match on: the
>>>> wording changes
>>>> + * between releases, lines can be rate-limited or dropped under
>>>> an
>>>> error storm,
>>>> + * and there is no consistent way to ask "which recognised fault
>>>> just happened?"
>>>> + * A SIGID answers exactly that one question, identically across
>>>> driver and
>>>> + * firmware versions, and (eventually) across other Intel
>>>> devices in
>>>> a node.
>>>> + *
>>>> + * What a SIGID is (and is not)
>>>> + * ----------------------------
>>>> + *
>>>> + * A SIGID names *which situation* is being reported. It
>>>> deliberately does not
>>>> + * encode the detailed reason or the outcome. Those are carried
>>>> alongside it::
>>>> + *
>>>> + *   SIGID    -> which recognised situation is being reported
>>>> + *   severity -> how serious this instance is (see below -- not
>>>> fixed per SIGID)
>>>> + *   errno    -> the failing operation's error, shown with %pe
>>>> + *   message  -> free-form human-readable context
>>>> + *
>>>> + * Severity is independent of the SIGID. The same situation can
>>>> be
>>>> reported at
>>>> + * different severities depending on the instance and the
>>>> recovery
>>>> taken, so a
>>>> + * SIGID is never tied to one severity; the reporting site
>>>> chooses
>>>> it by calling
>>>> + * the matching xe_log_*() helper (see xe_log.h).
>>>> + *
>>>> + * How to pick a SIGID (the uniqueness rule)
>>>> + * -----------------------------------------
>>>> + *
>>>> + * Pick per *report site*, not per incident. Each site emits the
>>>> single most
>>>> + * specific recognised situation *for that site* -- so the
>>>> question
>>>> is never
>>>> + * "classify this whole failure", it is "what does this site
>>>> detect?", which has
>>>> + * one answer. A single underlying failure therefore
>>>> legitimately
>>>> produces a
>>>> + * *chain* of reports from different layers, each with its own
>>>> SIGID
>>>> -- e.g. a
>>>> + * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW
>>>> by
>>>> the firmware
>>>> + * path, the failed recovery as %XE_SIGID_GT_TDR by the reset
>>>> path,
>>>> and an
>>>> + * aborted bind as %XE_SIGID_PROBE by the probe path. That chain
>>>> lets triage
>>>> + * follow a fault from origin to final effect; it is not a
>>>> duplicate.
>>>> + *
>>>> + * If a site does not match any defined situation, keep using
>>>> the
>>>> ordinary
>>>> + * ``xe_err()`` / ``xe_gt_err()`` logging rather than forcing a
>>>> SIGID: a wrong
>>>> + * or over-broad classification is harder to retire than a
>>>> missing
>>>> one. When a
>>>> + * new situation is genuinely worth triaging, add it to the list
>>>> below.
>>>> + *
>>>> + * Scope: software-emitted signatures only
>>>> + * ---------------------------------------
>>>> + *
>>>> + * This header enumerates only the situations that the *driver
>>>> itself* detects
>>>> + * and reports from software: probe abort, wedged,
>>>> survivability,
>>>> driver-
>>>> + * detected firmware failures, engine TDR, memory faults and
>>>> IO/bus
>>>> faults.
>>>> + * These are the only values the driver assigns.
>>>> + *
>>>> + * Signatures that *originate* in firmware or hardware are a
>>>> different thing:
>>>> + * they are produced and identified by the firmware or the
>>>> hardware
>>>> itself
>>>> + * (e.g. via their own records or error counters), and the
>>>> driver
>>>> merely logs
>>>> + * them as they are given to us. They are deliberately *not*
>>>> enumerated here --
>>>> + * minting a driver-side id for a firmware/hardware-reported
>>>> error
>>>> would only
>>>> + * duplicate an identifier the reporting layer already owns. The
>>>> two
>>>> + * driver-detected firmware situations below
>>>> (%XE_SIGID_RUNTIME_FW,
>>>> + * %XE_SIGID_DEVICE_FW) are software signatures: they mark that
>>>> *the
>>>> driver*
>>>> + * observed a firmware problem, not a signature reported by the
>>>> firmware.
>>>> + *
>>>> + * Numbering
>>>> + * ---------
>>>> + *
>>>> + * SIGIDs are a single flat list numbered sequentially within
>>>> the
>>>> assigned range,
>>>> + * in the order the situations were introduced. Values are
>>>> stable:
>>>> once assigned
>>>> + * they are only ever appended, never renumbered or reused.
>>>> + *
>>>> + * A retired situation is deprecated in place, never re-
>>>> purposed.
>>>> + *
>>>> + * First-order action (resolution buckets)
>>>> + * ---------------------------------------
>>>> + *
>>>> + * So that a SIGID is actionable on its own, each one is tagged
>>>> with
>>>> a coarse
>>>> + * *resolution bucket*: the first thing an operator should do on
>>>> seeing it. The
>>>> + * bucket is a stable, driver-owned hint; external documentation
>>>> may
>>>> refine it,
>>>> + * but the in-tree value always stands on its own. Every new
>>>> SIGID
>>>> must pick a
>>>> + * bucket, which forces the question "what should someone do
>>>> about
>>>> this?" to be
>>>> + * answered up front. The buckets are::
>>>> + *
>>>> + *   COLLECT  -- capture logs and open a bug report
>>>> + *   RETRY    -- transient or already recovered; watch for
>>>> recurrence
>>>> + *   UPDATE   -- a firmware update / flash is required
>>>> + *   RECOVER  -- an explicit recovery step is needed (rebind,
>>>> bus
>>>> reset)
>>>> + *   IGNORE   -- ignore if the SIGID severity is INFORMATIONAL
>>>> + *
>>>> + * The bucket is documentation only -- it is recorded per SIGID
>>>> in
>>>> the enum
>>>> + * kernel-doc below and is not printed on the (deliberately
>>>> lean)
>>>> dmesg line.
>>>> + *
>>>> + * When to use SIGID logging
>>>> + * -------------------------
>>>> + *
>>>> + * The xe_log_*() helpers are for these recognised fault
>>>> situations
>>>> only --
>>>> + * important, operator-relevant faults and events. They are not
>>>> a
>>>> replacement
>>>> + * for ``xe_info()`` / ``xe_dbg()`` / tracing, nor for one-off
>>>> diagnostics;
>>>> + * using them for ordinary logging would dilute the fault
>>>> stream.
>>>> Not every
>>>> + * ``xe_err()`` needs to become a SIGID report -- only those
>>>> that
>>>> correspond to
>>>> + * a published situation.
>>>> + *
>>>> + * dmesg vs. the machine record
>>>> + * ----------------------------
>>>> + *
>>>> + * The dmesg line stays close to a normal xe error message so it
>>>> remains
>>>> + * readable for admins; the only stable, machine-matchable token
>>>> on
>>>> it is
>>>> + * ``SIGID=<n>`` (``dmesg | grep SIGID=``). dmesg is not an ABI:
>>>> the
>>>> surrounding
>>>> + * text may change freely, and lines may be dropped. The durable
>>>> record for
>>>> + * tooling is the CPER record carrying the same SIGID
>>>> (generation is
>>>> a planned
>>>> + * follow-up).
> 
> Ok I realize I'm coming late to the party here - I just haven't had the

(no worries, I was late too)

> time to review this in detail. I really don't like having this ABI-
> adjacent implementation. It feels like we will be on the hook for
> maintaining things in the future that will limit our ability to
> implement changes and debug. I get the notes that Rodrigo has above,
> but this just feels like the wrong approach to me.
> 
> That said, I don't want to block the work here. I know we have some
> users looking for this for their own debug.
> 
> You have "dmesg is not ABI" here which is a start. What happens if we
> decide to drop one of these messages? 

we don't require any use of xe_log() to be permanent (see below)
it can changed or dropped or replaced back with xe_err() any time.

> Is it only the ID itself that we
> want to be stable and monotonically incrementing? 

correct, just use of the same SIGID in the log will always mean the same

> Or is the message
> itself supposed to be stable? 

message can be changed any time, like in regular xe_err()

it is just an additional hint for debug (together with SEVERITY
and reported errno)

>If we drop all references to a particular
> ID is that ok? 

yes, if the ID is no longer applicable
and this was already stated in DOC

>What if we have 10s of IDs or more that have no use in
> the future and we move on to the next section? We don't care about
> cleanup of this kind of thing? 

legacy SIGIDs stays forever, there will be no ID value reuse
(also see DOC) but due to the way they are defined, it is unlikely
that we will drop them

> Or the line above about "dmesg is not
> ABI" means we can really do whatever we want with it?

I assume the only new requirement for us would be that we
should not drop all xe_logs for any SIGID which is still
applicable (and was not replaced with other SIGID)

> 
> Thanks,
> Stuart
> 
