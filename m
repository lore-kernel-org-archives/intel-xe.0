Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914DFFED2C7
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 04:24:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BACB10E1D9;
	Thu, 12 Mar 2026 04:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JYDEoLIZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD4E10E1D9
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Mar 2026 04:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773289465; x=1804825465;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=75Yl93ibn+VFSDhYPG6EuLgHogvyzcncQbeXsLosnEM=;
 b=JYDEoLIZ662W90bMIBcpHDdRdCCJABEiGJTXE8d/5LpzKxzAHWipcqcs
 Is5WV0kPY/Rhm8wHC3Kbn7+38/MbuBi1wU4cPp16PymPAHuJnzI2XH36X
 LBVIGb0za1QRidv3w0frianyHkjTRfK3zSJnKUvRMh8a2Ny9xKBckQ0Dg
 LocVylfjMsrJYDfUWu8eWHWfPwDV3JFMlDp38xa1LSL/OojQXZF6+r+j5
 YvRkf+vrpTkDzAk0wTZn6A8wCXllW6q0EhVSI8JokC4Jd08gF3Vl0nsMD
 6/hfSBu8G6GnKYJNOR3VT3o6SKklcZsUrnymqFK7FmsbfIoBT2qJ1HrhU Q==;
X-CSE-ConnectionGUID: /uNRiKvzSuudMoGtiMcRCw==
X-CSE-MsgGUID: swlgfJEMQfOgN1UtA/JGAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="73564462"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="73564462"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 21:24:25 -0700
X-CSE-ConnectionGUID: Qx4MODjtRsyAumR2xLSoRQ==
X-CSE-MsgGUID: Xfw4pOpPQ4edoZ27rbOeIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="225137376"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 21:24:24 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 21:24:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 21:24:24 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.53) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 21:24:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wpkd2yvM9Z8CmPWgS/J8Yc6i8S4gPU6iKmGxyZ9WtCb76Y0Dhvge2vwytOCxxhwfpwPWgdpll3AipfcInZEku502Pty1evk51F+pMWDyjo2ABd3n9khnxVt5F1HX5JlRUtH/bGZfYT1vUT9O37YThBnf9NcxsL0Usi4vyyWQAufPma6sg00zFeXpDzMZaXNL+n7SagBWNiRqnFgYuVkwWthyzAs1MdLoMTBDz7uCFtLzcUhhrhz4LTWrnUO4kIaNBXvl7J3K5czxSWB20jwNPX8NxbYUDmzffs+CbTG+qz7Q5YImu0+rOaMHXvfDFbZ13m4MvirfvQ9EUD7hEcq3Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhumH3Ld/lgVdhWw1zNAlN5xsnl/E4tHAQu/+XpehrU=;
 b=QDeKQRqp2FYSeKHL3+OI6Y5z0sVDyZNyQhZhx+JLo+xGw11TcJgiZy26UGEFJ5Dk4npZ2kQPKMfQ6soUVJCAw54WeKtTZsy1svZ70GJVLkwwC8gSJhSygh1ata0o0GSmcCk/30G779eNpsUpWr+nmMZ/b7+8+ehAdaFIL1ByxZH8YYpHr88n9lepegqBJGtMlXnebGLO3ZUPElQRy1yf/iNC1JKYztvfbJInHNEaF9+3BTeb2xBWhJlrTrTXwAh9dQEix37XnEDzJLHLpRdRg9LiZeszkcAm0houOrXF3jbJoiSmKkM/uV++mnh7MZn3emTJa0P4wMy+1C536x6S1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SN7PR11MB7137.namprd11.prod.outlook.com (2603:10b6:806:2a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Thu, 12 Mar
 2026 04:24:20 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 04:24:20 +0000
Date: Thu, 12 Mar 2026 09:54:14 +0530
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/oa: Allow reading after disabling OA stream
Message-ID: <abI/7h8lOy9NFpBX@soc-5CG1426VCC.clients.intel.com>
References: <20260311210107.3112353-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260311210107.3112353-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY3PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:254::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SN7PR11MB7137:EE_
X-MS-Office365-Filtering-Correlation-Id: cbbdb2b1-0e6b-4c4d-361c-08de7fef3b66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: flWin8EExSwYTUYGsKqG6cIVonvZBNsy8okAn16nnQ2xlPKI4lkso8GUErLAFcn180DNG2BBN4EhVlaG7NLOzDCjuAG/OytHSjGg2zbTY3eWGjw2H5TEz2TzMfdJjEoygGy2uzAaZ6240j50ZIgSgJbhpqKRdG+58+fsxifj+01gnvGhryDt3bPk/87wzjIBBfZLlFTWTirSde3v8nLJuY4aoUE0jfO84PN8Z2hdsIXOvnYlQp5kY5Fn2orIFdWgP3CBMVEvWqTQpFfeHBFKHs1NVmpV6IFbCOwEIQVw9e88f2FeHvL0YmV19GfP0Ssbl3bSp2XCilkDP1a1Gb8DjyRWw/0W3ktW/IvEXtQg/S8GgahbYDvXbzVHe0M9j/ZFtO2lDBUC0ord5525ebaUyJgloGoz66HoIrBRt4JlCOja4ePYURspejLGaQ/ex97TgEkAqyZ+7Y0aydKHlzamZbrANROhNkzdBZsGpUBkxpv9/EZSo9VdvtZWtGHsqR8orjz3VtvGp3vl8n6J9Uy58AJO6HiMWDyCdIEJJDJpE4+jx8IvvjbG4QsaLrSeA6Lss1GeTXgubD+e2YDP6ptt9NB0IoQcjoKR2Llgdnfs0mQGDwwCSki2J4hT+eMAxxZf9Q4cauZBkPZIO5pmFmt4Fkj8Sh7tKXYKWNqRiPRS3OJHrqd3FXkpYR/qv+SkClJ+x9W/CoP+xdUiBFDLNB5QiadiY95ql7beLRsxVoE1JAQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDZCTnhsckVIRFlRbVcrUFVYc2hGVHlhdG9RczM4Y3Bld0lEVFUvT083QXZh?=
 =?utf-8?B?SEdhK3hweHV0enFXalQzbHpjb0J1RHpJV2hGTHNZU2puOFphZDNSZVpRK09M?=
 =?utf-8?B?SUJWaWtiMkJuOG9lZFJzYXl4dVhlY0Y3MVROaGdiejRwOTFkVDVGeHZFUkx5?=
 =?utf-8?B?c2hRcUpGWGZacjBsN1dtNlE3SktZNDhrdWNwTU5QSEVwTEE5ZnUwZm1nZUhL?=
 =?utf-8?B?YTdQdmJzeGg0STZpcTlOVW1PMHk4bXhuT0t0MGVrNS9XaGZ0MXBKeCtSdXNj?=
 =?utf-8?B?dml6dko0MFN6ejE4ZVMwK1BPTytJYnBIZFRDdms0bFQxUi93QVZ4MjZPNkU5?=
 =?utf-8?B?dFhQbm1VVmxKeDJNbkl6b2liaGF0MnVDUFNVOFVxUERMQk16NzRvQzVHdTdp?=
 =?utf-8?B?Zk5lV1RBTlFLMWt4Q0IvZEI1QlpJMzhMMjU3SU52aFNQYlJ0eHlHUFdCemVT?=
 =?utf-8?B?ZXVkSnczVTJ0b0x1NDQ1LzkwcFNiMm1PQTNyaVJtcnFKNmtNOTdwamViVWc0?=
 =?utf-8?B?cmJwNVpHQzkyVTFBK2IrNU9EQ2wwcnJSbGdQQW1jMzdXYy9jcGZaRGVFdHV3?=
 =?utf-8?B?bzUxdEhtcTFDZlVRYW8vTDRBdGlIVjlPWlFLU1UyTFR1Mm5wM2tBRXZQNTZJ?=
 =?utf-8?B?VHJHNzNxUG5tZHBsR3VjVVRYMlAvUnBZRU5iVGxyMGJaS0hoenVBZTlXS0gw?=
 =?utf-8?B?N2pOWHc0UWljc0Q3a1ljTHVLODh4MmZqdXZQQUhYdzNPYnYvVzB6Y1pMNUNT?=
 =?utf-8?B?YndDR2xzYWFMOTB4QnZWdFc0QkpaTkxPVEZTYkxSWjY0YldoS2ozZ2c4Y3BV?=
 =?utf-8?B?MnA5UXk4YXkyN0xCSThlbDkwQ3piM2Z6KzNrTCtYUmhvRkloUHE2UTN2eVJN?=
 =?utf-8?B?WldaMGx5SzFZMFN0MEpIelhhUlBWWGZLRHhSSzRSZ1V6V0RUZTdLaytGcnRv?=
 =?utf-8?B?R3FOeW5hcEhxZmdRRkUvK0lEUStQL2xGRDVwM21VQjQraXIzTWZqcGVqOCtD?=
 =?utf-8?B?MFV6UGFvOG1WTFVBMFhqWWpTSTMvT0tLb2FwcUlwZnJKem1QTEs2VjhOVTVJ?=
 =?utf-8?B?Q0tJVDgrRVRqeFRYVGJqWldSSVZobklZWG1wcDRSb1FOSTY2MjZTUHB3aGlL?=
 =?utf-8?B?WWJraVBuaC9lc1ozS21LR0VvV2JlS1QrTTAwTFVHYkVrb2pLamJpLzEyNXlG?=
 =?utf-8?B?L2RMeUk3VXVKYXJkdEJ3NjIvTCtpQ2lENEo0M29sRlpkZEZkNzh6Rnd3QnVC?=
 =?utf-8?B?ZTk2ZC9kYmt2czY0cENmSEh2ak14SktZY24wb2ZVRHFhMERsMlFLS1RiNm5Z?=
 =?utf-8?B?TTE5U05hZGgySWtvZ01LcWk2ZjEwUEx2WWxzRTgvT1lFZXN4YVkyWWxWY1hV?=
 =?utf-8?B?ak5WVmF1SDR4b2l0dC8yMGgwcG5yNnFvdk91YnNtL1BoalZST1p0SEV3MmNq?=
 =?utf-8?B?aldRVlJCS1B5R2lReTc3aCtUMXBXb2orRGMyZ0NZd1k0OGdYbUhrVXE1Nm1k?=
 =?utf-8?B?WUVMOHpYY3htelpBL2dxUEl0UXZxL1BZVFNJRStvOEQ4VFlmMzRpUjFUS1VE?=
 =?utf-8?B?Q0EzOGcycldxbGsyckN6RlVFNDh5NDJUallZSFZpTGU5TWNUV2pkTG9HODdT?=
 =?utf-8?B?NTAxMmgzeTd4TXVjYWdyRThDTmhkRWlZSHVqYzVYSys1T3VHVnduU2NDdVh5?=
 =?utf-8?B?ckp5eTZrMUN1Z09VMFZDTWdXN0hpYmQ3RnJ2c00rdGsvdXBMaFgvcXZhZHow?=
 =?utf-8?B?V1RsMHZscVlUd2xsN1dhTHo0VHIyaDRQLzNMSWZOQnV3VFUySVNUdmVsWm5N?=
 =?utf-8?B?VTB0a1B3OU1pVTdabHduQXVubFlWMm9wQ3pxNW9aWXlkUDFPYWtmd1hGTUQ5?=
 =?utf-8?B?ZmR2bEJPMnpQZGh2TjExMnkyYWxzLy83eEtRY0Z6VkVRczZtMThkblh1dzY2?=
 =?utf-8?B?QWk1UWd6eE1DUVJCczJoSlZON3RadWVrWmlwRm9RT0VmTjQvMUNzWmVyK0NN?=
 =?utf-8?B?bTczOEdrUVB4TTlhZGdyYlN6Z3hhS1BTWjUza2ZBSVJkWVZQNFkxcWdhVHlB?=
 =?utf-8?B?TG9jWU45SmdVNm5jdDhmTlpzeTVFbmxqbm80TU1lcGE5SUxWMG9QV3hkVFNJ?=
 =?utf-8?B?ZWtWdmc1blZzbUMxd0haUWE2aEFweWx2VnAvb28zZ1B5WTA3RWlHSW9FZkt6?=
 =?utf-8?B?elRZOC9yMzNvM2k4QXJUV1lET2FKa2dXT3FhYy92WXc0TGJoNERycVRzTGpX?=
 =?utf-8?B?WSs0VGtyRjhqc3BRZk1icFNpVmJWVWxUZjRqZ0lxM3hOcG5LaVdFSE96ekFl?=
 =?utf-8?B?ZzZoaDh4TjVpWjdkMjk1UzgrelVGdm9mL2w1RUp4OGlYSFU0UFZna1JUN3hq?=
 =?utf-8?Q?gYOtEWOqfd/3u0mM=3D?=
X-Exchange-RoutingPolicyChecked: qOUEgsugzufs9Rzn/QjxAZsm2w23xbx1qrB1GzGjHuwHSe2AGmTHsnkrlB7/Is6iYJzRtqaPNw/8DEv91ppV0qSRHFzsREfyJ7HZrNacAuY+Es9yogNZ/UgTgossmKbBZ3gZ9HZu1PdxdhM0C3BkeTBMNfz3NhHbF5yP42twL6ZoSkjQm/qJgOXKpKLuom0xHSiUr9ecd5ZbvLzrzJ6iiTwfNCKnTD/eZKEoZPzKwdIdfb5HkH8Gr+NnfsuguwF2l6CyhOUqVgqGpy4JT8ZeYvUQLLTtX2xHhfSXDD9b1z/ts69IWzumfB3DsgIf2osf4S+DZ3vw3mfwUGEdRJh/OA==
X-MS-Exchange-CrossTenant-Network-Message-Id: cbbdb2b1-0e6b-4c4d-361c-08de7fef3b66
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 04:24:20.6649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kTO/dtXonXqCB6Q8e1sWilfH7+5kUH00Ny872G6JRXHkyFRhG1KoMtlfp3sgPcfelE0YxA5WO5AfY1ES3DDkg+J/MX2aP8WNYdXhHUlGx9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7137
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

On Wed, Mar 11, 2026 at 02:01:07PM -0700, Ashutosh Dixit wrote:
>Some OA data might be present in the OA buffer when OA stream is
>disabled. Allow UMD's to retrieve this data, so that all data till the
>point when OA stream is disabled can be retrieved.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 72fc4424017bf..f840827960eab 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -543,8 +543,7 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
> 	size_t offset = 0;
> 	int ret;
>
>-	/* Can't read from disabled streams */
>-	if (!stream->enabled || !stream->sample)
>+	if (!stream->sample)
> 		return -EINVAL;

What if there is no data to be read when the stream was disabled? In 
polled mode, we are probably fine, but in blocking mode, we may just 
wait forever here.

Regards,
Umesh


>
> 	if (!(file->f_flags & O_NONBLOCK)) {
>-- 
>2.48.1
>
