Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F834CD6E55
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 18:50:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB2B89CC4;
	Mon,  1 Jun 2026 18:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jo1GXIv/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D36DC89CC4
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 18:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780339845; x=1811875845;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j9dhFe367ZzOHsu9Pl5Meb54/vpSsgAdf/YmkT/4Xr4=;
 b=Jo1GXIv/cNZdWiWBPpwuyodFan5ZIJyI/ojiTJkdaqTvZ7qYKL/bstwh
 a52+pFRBJXJsbRNV9g5ZKSTupXteLSZzXtsB+qXYDMwPRUwItWfKIQQrI
 hFcnpd4d+IZMtBRqeTwcLJ+5Y/R10NOGL/ypkV1lQJlRYtQVxQCNcRN8M
 G+d6XY4UwDJiUYgjxa4b44w1M8vnhiVhMnyGg8Yll6KlH61W7QoLpopne
 Z5QtZs46IbnACI2DuE1yi98tlmXXKCWVayLhmJippRgoEhMqz/pYt9wR6
 kCRZJl9z7FHCu4FHBtjVvDTu6jjBIToAE2/ZJsfOsN8vr/IruT7KOGA4I g==;
X-CSE-ConnectionGUID: 7l4+2Z9MSjygR1UyNFBLzg==
X-CSE-MsgGUID: AvNnlMJ4Qwq4oeWpw/O6GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81099462"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="81099462"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 11:50:45 -0700
X-CSE-ConnectionGUID: tEWS22iBSpWT8byGL8BuoQ==
X-CSE-MsgGUID: LPxfm9ssQGWmwDy8OsAIsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="267303213"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 11:50:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 11:50:43 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 11:50:43 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 11:50:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GztaMqy7YB1099CaevWkTmHrUwJOD8hsEwtgy1PyCCtaaaOqWvoswClg1+FNr6FnIUqOi2eEPzNdj02VZNxcY8oSWfb5WIPCbUSioxu8Tc1493rlbJwtovx8p00WrX2nwiPncAIxu3sq276VP9a+jl0CrjZr8VihaoXX1Yc7EtdoOflRu/AT9NgG78QMrlNMNFJHTJzhgE1Yugcvf3rEuBPAQNhXSHE+Slpf3snxAIUiS362pa8LuL/2mEnQooEV0d1vuowVF76k2hFl9cFvjMDhRhF5OY+Tzl3krlbY4INWKKv3mu0mEruSAHpahefEIaTKx+Xo+r3eOSezYUaI0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BPW85g/Xe2Ow399CGilulcuXoTRBtGfp5zg8ohnicE=;
 b=RwuQzmpBUdPCtscF7hdho5t3lx0/uN7CqNGJehzOoxvfHn5xsrNVYwITu2y2hw7fykptUteLWpK7Ax+Q+SfREHMOpYQbsBi2cQH+TmEAgf4OcCBxtniORe854G0yewOEtO53X+czjtYiwFqaX0xFYVGX4CEAvGiFvzhzNtJNxJXDakZEWoImzC/VHhuys9o3IAYcKzgottV9F5n7zCPGIxcSUkVZRIRH+B1lbW6PILO4VyZ5gnmA8HUQPt6d5ZZs0/prm56NtNn47cE7HCfohzVWdO4BX7JTAzMnN8uSjXdI9hxw/liMm402ldCr+4ne3487QVrWYlFIU1f0GQoEhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by DS4PPF6915D992B.namprd11.prod.outlook.com (2603:10b6:f:fc02::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Mon, 1 Jun 2026
 18:50:30 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 18:50:30 +0000
Message-ID: <f3d289fa-3c26-45b9-bf30-e893049b1b83@intel.com>
Date: Mon, 1 Jun 2026 11:50:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] Revert "drm/xe/nvlp: Define GuC firmware for NVL-P"
To: "Sokolowski, Jan" <jan.sokolowski@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
References: <20260528215227.1282471-12-julia.filipchuk@intel.com>
 <20260528215227.1282471-13-julia.filipchuk@intel.com>
 <IA4PR11MB9251D6C02C4B289C5F6F699E99162@IA4PR11MB9251.namprd11.prod.outlook.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <IA4PR11MB9251D6C02C4B289C5F6F699E99162@IA4PR11MB9251.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0026.namprd06.prod.outlook.com
 (2603:10b6:303:2a::31) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|DS4PPF6915D992B:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e97d13f-f4cd-4994-e0e7-08dec00ea716
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: Ygr3vrLEhNw77v8ziU7Vny43fIvAtfx+E642WUHYaaPPDKVTyy23XjjasCm6iTE5+VRBxynlUNd0MLHNUYrNJOys+QJjQvAKX01lltaHtI4DRC3vWeM93F90mSFl+azvo2LpROdzmCV4Dk85W7UnCgQbiLoF2kIZfEteWI7tNbcIvzFlm/FgleYVmu0rCT7eCIWBd7zxeFAtWm3XC2Y9B1zHVme/62wuwkcwRBn78eF7vgmNCJ57/qkjcPfmu9V2w8tC9Z/voiJHUlJOoL819FbXEENfoGesOmkD8ym1kzo18Ma7BMEI3jSkfcvhILbrxWL0jDbY2Igl7IKz/ICOo4x3RrN4mnTdksHDIkRa8FgParT0/etDRbE4TQ6gdaWd+Lkod16OGP760+RF7gg39+HXD8TBowq0iEjX3gmHVWq5uDoKM6S28WnLs/px1/P2FqI/sF5mfB5FmsSgqAB+PitOLGxE0xHkcToTZimEkFJXzQaw6iS99l7A+jbfNWBd8beLD1izBcubpuHsxN3XLYBPLKanyFaLoJL+ny9kegdRLSKR9At5QtLsvBOsvVYZTbMIJK3cYDD5M1cqMTqpE7rRFX2p6hjaDaHyKSTvNpoXkthiiLrr9TgkbwWlFkHUYCLlzFVQldDFgPAYt6aN6txsbkn4dKEvSAQSx580fEChVGzSMAvDwT73y8Sze/s4rlPZPeqQ5f0//dWWANMLQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFFyOFVUUUFwdlptZ3FUekkrb2l6bHdnZFpLRHlDb1JoVGg4ZUVabTQ0WEQ2?=
 =?utf-8?B?UGgvamhSeGRuSlRzVGJmRlZjNnUyWUt2ZUJQVE8ycm5Qa0Fick1aYjNOV0U0?=
 =?utf-8?B?anBtVG9zMEwzSThIYncwbDVQWnp5YWV3KzhIRkNMWmxxOFEwK3p5R1ZTQWdp?=
 =?utf-8?B?MXhaaGwvQjZFMTRFeU0yQW8yamhmVE9TazMzS1NiY1JHcW03Z1o3ZWdVdTJZ?=
 =?utf-8?B?c3E4UmZqSHhzNkcwM3lwMkIwNUpJMlVhTS9BYlVKZjludDdJOU8xSWNUUHdZ?=
 =?utf-8?B?VzhkKzE0SVZkUG1jbFZaN0ZRUnFkWTZCaldmd1dodnFhME5jSmNJT0xCRVY0?=
 =?utf-8?B?ZGtDSW8rWEtHdkxSUW9qbHN0dWFGa2tzWG1laEorOXd0NUl2V1RGSWd0REUy?=
 =?utf-8?B?aDIwbk9mVXlLWFhGM3NFY0hoVk1BTXhHWW05T1R2eFI3YUxJZTNWamR4YjND?=
 =?utf-8?B?bDNlOXFTdkozSFFqTjV6OWdiL1dWdlJ1K3dqUjl6Rm9FZmliaElMT2JJSTdV?=
 =?utf-8?B?MWdzRk1tbGNqNHBIRGticitwc0R3amJrM1dxMnZ3RWRQUmRDS1hqUlJXSzFL?=
 =?utf-8?B?TldMSkxzc29tdGVuVFptMkU2OCtsb3FKOGovVjJBc003ZjF4blJ0bVpqS0N2?=
 =?utf-8?B?Rk85VE56N0NUZzYyZTFMRnFBVmZwMm5kVldpSlQ4Si83dm1YL0huYm9NN3BI?=
 =?utf-8?B?U00zWkxHWWZIVndrTzB5UDI5WGNiNmtmQy8xQ0FnenMraTRMZFpEcFlkUmIx?=
 =?utf-8?B?UDd5Y0RRaU5lSWJQN2YwSlRPdDhzZkdXamc0bkhxQlNQVkZ5ZERCeDBueWNy?=
 =?utf-8?B?ZTF2RElSV3hnS29adldLS3ZnZGdqanRxL1hGVFV1S0dGL3ZETHUzRzduL0JV?=
 =?utf-8?B?SG41VjU2QWxFa1h4MFo3S1VRUVo5N0xBUmNORFBjYjFBbkoxUEN0cXRxbEU1?=
 =?utf-8?B?ZVF0T1YxQ2tHR2p5cWlOeHpOTU0xVVl2ZEkvZ08xckdkdDFpYlA4aXBhY3pB?=
 =?utf-8?B?WUt3RGNHRWtRVTVhZWY5SnpuMVdUb2ZtbVVGMTRld2xuOXh2cVRRV2F5aFhx?=
 =?utf-8?B?SGhwWUQrc2xJN3h1bUFCZFVuNy96WTFYamJRU25teEdRUHM1NGNZNHRkRUlu?=
 =?utf-8?B?ZmMrSVUxU1NQcE5TV0hIVDVlcm5lTmZEazhWaWdiUWUyVERhZFZSSXFmeW56?=
 =?utf-8?B?Ym1ZYkVLbWR3WTJhVDJOaWZodDRTS0JnZDRQeUZ1cnR0NHI5dmgxRVNXbHRv?=
 =?utf-8?B?dGJ5VkczcUxBblRBQ1VJNFFwR0lDWjZjbmY3UmFGeTI1YWxhSFVmZmx4Y05V?=
 =?utf-8?B?SW1QaW51bzJiRTZnUU9xM2FOWUZhUmJOTWNKTVFBMGFrd0JiQjBiSkVIUWM4?=
 =?utf-8?B?aDVLZ1hjQTBwRG5hdE5qb1ZuRkNrU1VPUFVFQ0R4VkFSMTR4LzFTWG9BRmRx?=
 =?utf-8?B?K0F1SWZOa04xS0s2dHV4UmFmelVmQUM5N1JvN1R2Wk4vT2pOQUsyVE0vZHZD?=
 =?utf-8?B?OHN0OEFSZ3JkSFp4a1dqRURnd3pHa2N6N0lLNExCM2hKc2t1QUlTdjNtU3ZI?=
 =?utf-8?B?RExQa1ZXRmhVc0dVOGJ5REVpK3lXTVAyYm9oeXJsMVZaWVFIa0hZZGlxWExM?=
 =?utf-8?B?NEFPbnYyVTRSMGJTbERibncrLzZnKzd0NDNvMFNWdlAxUG9NUEJXQzJRdGZk?=
 =?utf-8?B?dVRNQjlweDd2VVlmTDN1YktNN3N6S1JTKzhlTnc0Z0JMY3hHejh1T2czbGs5?=
 =?utf-8?B?SysyQjlmZmdWUFZaVVhpZHVwWGJ4UzBUcXNTWXdGUmg4UERjTi9MeFViMVU5?=
 =?utf-8?B?YTBxUGJIZHlLUVZmTktwbnJKdkxWQm1vMC9HY3J6ektobVRRVlpoMC9Lc3dB?=
 =?utf-8?B?LzVsR2lGaEk2akdRUWNIaXRpMHc0K3dFekV0bHRRTXpLRkNVbVMxUXhwS3BF?=
 =?utf-8?B?MFRKS2RwVW1CMWJiV0l6ejZFazJTRjRvVUhzRkNGVUZrZm9xbmY4emR6NlQy?=
 =?utf-8?B?YzBMWnh0dGVNbWpnUFR6WmFRVFFBanRURWhPaU1QK0EvV1ZLbG42Nlg0SkJQ?=
 =?utf-8?B?YURBYlZ1Q2xhMUt5VFlSMFRBdTQ3Q09ZeFFCQ3JETDdsQ1ovVFVsdDlSeW5Y?=
 =?utf-8?B?SW12c2dad1V2VmRlY3ZwK3NNZmZXdkg0eWtNRWpvdk1xbEp0eFdBWWZ1VmVG?=
 =?utf-8?B?ZnV4SFJBM004NFFrV1c0R3lqeW85YlZ5TDgwUUw3RitRbEhmcUtnMVpFNTc5?=
 =?utf-8?B?RXdRbk1iWEFLcnVaeEZNNkZtQkpQMGUvYWtrbFVOTmFSZ3lvY0lLRUFtOVha?=
 =?utf-8?B?NEFTT0Eza0pESE9rRzFubjFRM2RHNXhCb09BRmk5VTVFZ3daWGxYQlZmZXZW?=
 =?utf-8?Q?zuDeYlaxoKAjzV8E=3D?=
X-Exchange-RoutingPolicyChecked: D6tHgwZ+aZYjnNXGnkmN8kYsfLe/53Q5SujbxejpQ5ZwJBwPRUYi4H+rKVNbzX+ommMejEUdFUvpL9/NSdhZwTp/jGrEtg/ZvGp10oXNTy49XYdcX5NHspDpJKiOiYHRXEf0IRDj8GRwA/iu++vVtX4gYOQO4Ok6DiWWTKuHkaLVtTq1Z1G8kOhoPdEBv2PfF7wuugCt9WRdapFpuWv7MB0nPa60dE6h8B0B9zgtnrd0BHo7o58fTxyMYIRyQw4SY3CoyR1Swy+PlhaBF5srlSOmG2sFE9DPaz0HnRRBu/rIGcPo7StyJV0GkzKvOZr3yoQZMNl7AryYA1WM+0qVyg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e97d13f-f4cd-4994-e0e7-08dec00ea716
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 18:50:29.9774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xtoTt7CPi1U5gWyT56BFw3J1ipaLgdjemHmJeCIisNncxpN6HWqbq7Gb3aNP+D5QQQaBrqhrV35gtQC4PDGbJ+KvEcgW19K88JF2iRdQezI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF6915D992B
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

On 5/29/2026 1:04 AM, Sokolowski, Jan wrote:
> I've seen you reverted some patches and added new ones just to change firmware version values. IMHO it would be better to just fix it all in one patch.
> 
While this is messy it is intended to allow maintainers to cleanly merge parts
of the patch set into separate trees and have CI runs against drm-tip function.
Individual patches outside of Revert/Re-apply will merge cleanly into
drm-xe-next and topic/xe-for-CI branch as labeled in cover.
