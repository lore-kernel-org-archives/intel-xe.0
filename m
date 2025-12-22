Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC42E6B257
	for <intel-xe@archiver.kernel.org>; Mon, 22 Dec 2025 22:38:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E46110E04B;
	Mon, 22 Dec 2025 22:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q4+JjgNd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9680710E04B
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Dec 2025 22:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766443080; x=1797979080;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pwNEZMUXFBMOLsSuk7ne16LfjRRmPM67/kZ82UwqxXY=;
 b=Q4+JjgNdcJrtbaKrFItRcRt3iy5VajVdkaVPj2i9fYCRvZ/CI3susv6B
 9q0NEP4boc5TOJdyx2nbtWsU8JYrVhXc6jcR4gtjKapyYK6CsBZyT5A1K
 nfQzJz/iJy7oRFzS9VdJtx7lT/eQroZ2ip/7R8JY+BGm1hZGbFI3d16HH
 kyAV9BlduQb740cxYn0LmeXTbG/dlhqsY7jn6izBCjK9OfNTch8siHy3X
 DtzPYIXCcpyviGTLFJ0NGpxYfvJfyfpVR70GR8s24V9+pEl7yHHmRODoJ
 rIb8NE6bJGbcPZHZJYoeL9nbd8SVA/wq7buRx03B3k19vWi8mhK/NnYuA A==;
X-CSE-ConnectionGUID: fJMIvC3nSfCmSDJRott3lg==
X-CSE-MsgGUID: UmCiKqWDRl+ktYHYyHo9WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68182351"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; d="scan'208";a="68182351"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 14:38:00 -0800
X-CSE-ConnectionGUID: DmY8ZsO8Roqdo5VksiNKBg==
X-CSE-MsgGUID: 5IihpmAkTuyQ948OXkc2og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; d="scan'208";a="199398734"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 14:38:00 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 14:37:59 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 22 Dec 2025 14:37:59 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 14:37:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xw5H/DCu7iBJc8c73X4E04UphHdf8A9S0o/GHVxWwDJ5XvnvA0dPBh+lVjACWC0/cIkK2/dSji2fzCh1wjmWTJr+eGRFcHQctdwArb39ifI/FAROx4e9YF+7Zr1nwcOLi1Lq29qaivrYFMs1kFcjsNz2gY/fJ6VN+kGxk0hhu3wkC+Gf9DpuKCxXgRxOtg6YGGsCNd2+CN+D4Ca0OHVju6YuSNF+tuw7zFJGlt2l8UReX8Q8fIl+nWEAHYXlDcTL3lusHONFkPh06JA8sxGZEmt9zsqda9FZx4xwuMoRlaqRNFAlPQidsYI23NJg0Phz8lu/y4gW+JGgt8dvSVCxaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QF62z0+7+dLQDxPqzrJn+4sE4Gk9r5qn0kStB1BKxlY=;
 b=hrAfzFifLGBPZSLNTvp82G9uK0Eyadc2o8f5gTit3f5rp9PKZor1Bl2wET8xjSKqba3jrQZy+fDNpb5Pwp01c6gD0qaNpBHQFFcr1iTQyrQHlrTkBRlMG5mVIkqu1/yzm4LciQt/CYs+fj3Fx6AcwQ21fEHhkk8SMm1JMyG0GxaYkeeLFNPPk4G5lskRxa6k6NodaeMoBCHeB5m43y9P471C3F3I6jOC7zw7GjAr/sv3a7i+dMttrdBPf5XO2MT9YAvxDD7KuH2KWl0KQcYnOW/mdpFqf4f+sNBwM+w+ovt9JOGoYpDieer/6vggNvrDMYKkQbWmjj8Ineg8g0phSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by PH7PR11MB6905.namprd11.prod.outlook.com (2603:10b6:510:201::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.10; Mon, 22 Dec
 2025 22:37:57 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%6]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 22:37:57 +0000
Date: Mon, 22 Dec 2025 14:37:53 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/eustall: Return EBADFD from read if EU stall
 registers get reset
Message-ID: <aUnIQQl7yQ9G7EwR@intel.com>
References: <6d78578c015b12e7ae243727ca7ed4b93551075d.1765174462.git.harish.chegondi@intel.com>
 <87fr97worl.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <87fr97worl.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0284.namprd04.prod.outlook.com
 (2603:10b6:303:89::19) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|PH7PR11MB6905:EE_
X-MS-Office365-Filtering-Correlation-Id: a10024c2-79e7-44d2-9075-08de41aac0ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEpaVEs0UDVJWmtYNVluNUpaSGsxYlA3L2dVcG1vOXo1TElWem5IaEpjUkRk?=
 =?utf-8?B?NmVtNVZpNWpSeWNpSzBiOHpORCt2dFk3ekJLUTJQejRERWZhQlQ1THRWZFk0?=
 =?utf-8?B?eWRMMFoyUlRpUk1qTDBzOHVZZHhMZ2FCZkNFM2kySE9rM0hkcVU0RERUUnpK?=
 =?utf-8?B?bThPakhWaGFQb2w0RWlmbG0vV0JQQnd5K043RXFxS2hVVXRvdnY2T3dIcy9k?=
 =?utf-8?B?ZUhMcTBrM3NoTGQ5blVnN0s3dFFhREUrdDJJeWJpdERGUk5kTXVFWXB0b2ho?=
 =?utf-8?B?dUplamM3ODQrYlpnTVFNTXE4cmhjcEs4U2lBSTNOV1ZmbkE3OHZ1cW8rQVFP?=
 =?utf-8?B?dWFQRHlsL2ZZT2phMzlNZ21WUjR2T1FtUVJ1SDFOVXZFUkJoZDRlSytoTmEw?=
 =?utf-8?B?L2Z3ZlMvT1Jvemd3NEZza09tZ2dQdUNsTC9MSnIvTXJocW9CMW4wajVxeit5?=
 =?utf-8?B?NXNpVXgwWkxyTWp6NHZqSk5IdDJwR0lMZXAzYzlwcEQ4MVFZWHVaMjh4dHp6?=
 =?utf-8?B?T2FSc28wSlAvTFFFWU1HbHp3UDhjeWhxc1k1UW8xUVdrdldoNmxsTDJCOFNK?=
 =?utf-8?B?Z1hpR1pKaVRLanJVaVh3WHl6dkxmdjZWcE00MVU1cXc2ZUZaTERrMHdxcmQ5?=
 =?utf-8?B?NVBna0VrR1lkU2hFb1ozaHFTR1hHR1RzYjN3Q21qbXk2SzE1OXhhYkNlMXZt?=
 =?utf-8?B?L2xYRFYwemhKZG5VK1RtWnFGZE5PNk1zNXF4NGVrTS9HZzVsYkNlNCsvUjBE?=
 =?utf-8?B?THFLZ0JHYm4rNHhodFA0ZXNBNEpLdUxpRUN5dEE4S0pMVGNsMXJFZC9KWHJU?=
 =?utf-8?B?MDMxVG93SUFxMkQ1Vmh4bTNqR2hzRHVwaXdjVWVRNTZORmlpaHpqZnMvczZq?=
 =?utf-8?B?cjB0UHBkYWxaczBQVlZFSThBSklkdkJkcWp4cWxsM3VpeVBGb3lVTUYwOXlK?=
 =?utf-8?B?WExjbjZna0RYbWZ2YUdGeTUzbzhXc2VMUHNVVVdWc0x1RnlPaEc1SS9Ka2xt?=
 =?utf-8?B?VS81S0YxUlB3RFY5YlFEaGVVeCtmWExpU29vOWUvWFZzME1KOHRpNnlaUWV3?=
 =?utf-8?B?dkgvYjhScUl2Wno4Q01vM2gycFFvbHF4elI2YlFuQ3F0dHF3UGNoL1V1Q3RU?=
 =?utf-8?B?OVUyRGhVbHYzR3Q3QmxSamlpZ24vdURMOW9IemkxOE43cXRUdFNzUGRmQm01?=
 =?utf-8?B?eWNGTkZWWUh4RS9GQkQ5UWV4YldteHc3bGNnQWY1a3dSSExHQk8rNnQxc2RK?=
 =?utf-8?B?cWhQbGlPQkozMDdXYzBDY3dGMG9lektRZkJKUElxalVIL2hRMmd2Nk1iNC9T?=
 =?utf-8?B?TVcrYW1rbzFkMGgxMWxkeFlaS2wvdlZRY002VUNWVS9WeDYxZTRKMGNWYVUy?=
 =?utf-8?B?a09nM0hLN3dWYURnTDF1WEJYYldtb0xlMXRyNG9IR2lVRE1FVXVPT2NSdnVM?=
 =?utf-8?B?Um8vWkZrZklzUnMxeSt6OElEa3BKTGF2cFhseFRGK3RqVktRMmI3alFhK1RU?=
 =?utf-8?B?bElIRmVWOFNpVk9OQU1ZSERMRm9McUNRcnBtNlFNMzgzWi9ObWVFT1FSckVP?=
 =?utf-8?B?MDEzVzBRZXhQeXZ3cGhaZGVMRFdZd2ZMZTdHNWZWK2NRV2NHaTk3dEZocTFi?=
 =?utf-8?B?TlFWcTNRVHhVcmEwRHdyaEJzd2NJL3IzMHpCb1A2MVU3M3JIcGFXcVFqSFc2?=
 =?utf-8?B?cHIrV29KUHk1VzZyZ0h6d0ZhSUV3MTlOWThLVmIwVWE1TXFZQitRcHh2b3dv?=
 =?utf-8?B?Y2dWWFpWL083MWxXSUdCWlVYTU9KY3NORVpmQmsrYTNHeUtmbkNQclgxdGl3?=
 =?utf-8?B?U3dHNGJvL2hZVnRJekZDUlJqdjhWcFd4eVk0QmdLN0hOU3k3Y210U2lDNVZa?=
 =?utf-8?B?Um9wYWllWDd0bmt4UEZhNlM5cGUyWHFaVFZOMkdLdVIrNWZWdGZSWWdETmJ1?=
 =?utf-8?Q?OdXGOlvcAjrrSjLrUsrXNGoKjjRKEhbE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFFuYkNtNEdydU9EaHVodWhqYUtYZGtPb1lNbmxkb3NSaFFaSWpWZ1V3ckxs?=
 =?utf-8?B?VTlHdE81N21iWlpROUY2dHYzV3JpOXBFVllBRFgyTUF2RzRzZEpwMVdScUFt?=
 =?utf-8?B?Y09mY1lLU2dqNm5US1V6ODZHU0FFd0tJV1JjWHlwZHMvY0hkUGZCUm9sUmp0?=
 =?utf-8?B?dU5McysrbkF1OVJrSmdkdjZ0UkxMUnpBSnJJUTZRcm45ZTEwSHk1VnhjS3V4?=
 =?utf-8?B?SnhQdWpraXNFZk1VcXdtU3RJWFc5UFpGeWNiODZ0UVJpeTh5cEpHOVQ4Wm43?=
 =?utf-8?B?U2JZU3MyNDBxQTJqL3V1Q1ErL1dZOXh1c0ZsN1pxOFRlTEZZRmVPTllmeUlR?=
 =?utf-8?B?c3N1aVhoaEo3YXMvZkYvSnZwb3NSYmVQeS90d2UzdWJrd1NYOFFYaDF3Zys5?=
 =?utf-8?B?Q0o1TzFCOTIxNHRONzJFS3pDTFJNV2pBTUc0Z0N4Z25OWGdjcUtvZ1o5cWpQ?=
 =?utf-8?B?VElINjFIajJTWlZ1b1E0bkY4YVVkczY2M1pNcnllb1Z0ZVRpWmY2aTZ3UE5Z?=
 =?utf-8?B?T2NWS2xuRjhJU2l3TFNicnRkb3QrdmJEWWpNSCs1TjhHKzRmanp6SGRhUDJr?=
 =?utf-8?B?dGRBdjYzcWVFa2FRa21UQWt4eVJBNG1wVjlHWVJFZDh0bkg5eXhtS25mY1I3?=
 =?utf-8?B?Y3NMZ2drN2dIUG0zSkhaMkNPZTZGcEcwaXhlaG9jUlUwdnFEWC8rQ0orbkoz?=
 =?utf-8?B?YjZWYUdOdkt3NHhiNjQ5T2orNXRKWVpLb01oZTB3N1FMVDVnbVY1cWtOajNP?=
 =?utf-8?B?N004aTdzYjFYZDNlWW1BSDVWRjJKY1FiN1ZwallhSHVaVi84NFJyY0dlK04v?=
 =?utf-8?B?OHJpS0U3ajZyRjdsOGI1dGdqRmRkOHVoaTRqMytqVFZMVk5vTlZFb3RQRTlq?=
 =?utf-8?B?dGxpZzlLcWZZa2pVQnVWYkd1b284YUZ6azZoWStWT3J0VTFRYmJNUzJTa2tI?=
 =?utf-8?B?eWlXVlpCcUJqUWJqdjdReTBVWGI4U0ZIWGlpOTlROElENmlUczhraDVwWmdW?=
 =?utf-8?B?STF5N3FLYVBvVVZrR21LSVhFSUl5ampzWUxyL2E3eXdTWnl5S2ZxKy93bXRF?=
 =?utf-8?B?KzIza2xWcXZjOGpQTFJoK0wxenM3NjNPYS85VDhNd0hkSCtPcDdqcnZUc0Nv?=
 =?utf-8?B?ZEJzTlhZZU9VOWFPUFRxQkhuMWtHVzZRak1EYTFwOGZUbTh6WEJuT2lxOHRm?=
 =?utf-8?B?U2tucitXbTJ2Q1M4a0R6SmVxajZBRTJFTXBqOWY2MEVZci9pQWJIQUFGYklU?=
 =?utf-8?B?ZTdONDdmOGVkSjlWK3ZRR3hHOEZEYVdqVlV6MXQvMDFXb0hnYzc2K3c4ZXk4?=
 =?utf-8?B?Rkhsc1gxSXlkV2lXY0xjakE4VGoxa3lGMEJFRWxxQU5rc1JDUDd6TXoxUmNG?=
 =?utf-8?B?YnEraEtwYTNEb2VyQnNjNjBQdWNLdU16SG5mTnlLMDZEdzhQYVJpdUtJNHE4?=
 =?utf-8?B?c1FlUUl2WWpoUUhlNlM5dVRFZmZVcnJqR29vcWc1cnBaRWdEOTJLdjBVSVM1?=
 =?utf-8?B?WnpQOXJaZFMyMXZKMlVjcjZTOEE0QmU4YXpnNGloL0ZxMDRaSU5WSXRCbDd3?=
 =?utf-8?B?SXE1OU5VcUY1NmJKUis3VHMxbFptKzVmWTgvdnRwNnQzZkFPQmM5TGxWRkxR?=
 =?utf-8?B?WXF3TzlMbzJtM3JIQmRlRXFTamR3MnBPdzNjOHZueUpvWEVxd0FCa1JjUFM1?=
 =?utf-8?B?T1NaWVg3Y2xDWndMNWRLVVc1T2NEVkhJdVltdHJCNHRlM1JVWHRGYzI1andW?=
 =?utf-8?B?VzZteCtPWTQvcFFsS3FVOXpBNVZ5Vk92TlhYRHlPQ0c0UFo2a3JlWlc1VGVX?=
 =?utf-8?B?WkZLeDRkcTlidFBISXliRVJuK2JBYkZqZjVVTS9MY3BlcEYwbm9sTlNNNU0z?=
 =?utf-8?B?eFExNmswS0hyZEIzQ3VzdGJWYy9WeVczNVRpeXc2M2ZnbU1JcWJ4QUhMelVR?=
 =?utf-8?B?MkZHLzZZQmJzeWNSbndnVHhoeHBweVlSTWtiZCtudEhlRG5KWmJ4eGRqbmhr?=
 =?utf-8?B?SHo0NDJVbC92L1p4eWRSYWdKWHpnUnlmV3E4N1lydlhkRkk2NkZ2L084RGpp?=
 =?utf-8?B?YzlBb0dYUndERzQrUFBhKy9lWHdNZEMrRmlGeGI2TjV4dlpyTENIby9NVlY4?=
 =?utf-8?B?bklhSkFFazc4M2hXMFNyOUJ0UXpUSkVrcFk3ZnVTR1JxOTF6elVSNjBHMHlP?=
 =?utf-8?B?eEJ0VzVIU1ZKaFRuQXRsWmxGNVBaZDc3RXNqMjUybkQ3WjQ5OEVTUlZiUnJl?=
 =?utf-8?B?ay8vRUNCSDZnbTZmZVZaYWhCNGd0V040Z3E0eGNWQ2M4M1A3TFFMdHhIWHpH?=
 =?utf-8?B?S2hxYmlkSmVhdHdhS0s2U3NFWC9zQ0w4bEk5Q3lNMk5KbHh5L2FCUUo4VEVt?=
 =?utf-8?Q?KGWjQgGJlv31/xSo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a10024c2-79e7-44d2-9075-08de41aac0ec
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 22:37:57.1579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9DRj8zTlmwmJ08uiyFVQBzgTaod2K5rtfMiVxeUhBMNjhl9voMzQAyJxm+nKi3t2PNgNU5BWhQ51FK/5pYlFLnhjK9Yi/TIL8s2zHPutVpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6905
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

On Thu, Dec 18, 2025 at 11:53:02AM -0800, Dixit, Ashutosh wrote:
> On Sun, 07 Dec 2025 22:16:11 -0800, Harish Chegondi wrote:
> >
> 
Hi Ashutosh,
> Hi Harish,
> 
> > If a reset (GT or engine) happens during EU stall data sampling, all the
> > EU stall registers can get reset to 0. This will result in EU stall data
> > buffers' read and write pointer register values to be out of sync with
> > the cached values. This can result in read() returning invalid data. To
> > prevent this, check the value of a EU stall base register. If it is zero,
> > it indicates a reset may have happened that wiped the register to zero.
> > If this happens, return EBADFD from read() upon which the user space
> > should close the fd and open a new fd for a new EU stall data
> > collection session.
> >
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_eu_stall.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > index 97dfb7945b7a..02c0beb4559f 100644
> > --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > @@ -541,9 +541,24 @@ static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
> >	size_t total_size = 0;
> >	u16 group, instance;
> >	unsigned int xecore;
> > +	u32 base_reg_value;
> >	int ret = 0;
> >
> >	mutex_lock(&stream->xecore_buf_lock);
> > +	/* If a GT or engine reset happens during EU stall data sampling,
> > +	 * all EU stall registers get reset to 0 and the cached values of
> > +	 * EU stall data buffers' read and write pointers are out of sync
> > +	 * with the register values. This can cause invalid data to be
> > +	 * returned from read(). To prevent this, check the value of a
> > +	 * EU stall base register. If it is zero, return -EBADFD. The
> > +	 * user is expected to close the fd and open a new fd.
> > +	 */
> > +	base_reg_value = xe_gt_mcr_unicast_read_any(gt, XEHPC_EUSTALL_BASE);
> > +	if (unlikely(!base_reg_value)) {
> > +		xe_gt_dbg(gt, "EU stall base register has been reset to 0\n");
> > +		mutex_unlock(&stream->xecore_buf_lock);
> > +		return -EBADFD;
> > +	}
> 
> So I am seeing two problems here:
> 
> 1. We are doing register read every read() call, rather than just when a
>    reset happens.
> 
> 2. The other issue is should reset itself unblock a blocked poll() or
>    blocking read() call? If we don't do that, it is possible that poll()
>    or blocking read() remains blocked indefinitely and so either the
>    non-blocking read() doesn't get called at all, or a blocking read()
>    remains indefinitely blocked. So that we never actually return -EBADFD
>    even though a reset has happened.
> 
>    (Note that, for exec(), I believe any blocked fences will unblock and
>    return error etc. if a reset happens during an exec() call (see
>    reset_status()), so EU stall should probably do something similar).
> 
> So to address these two issues how about doing something like this:
> 
> 1. Call an EU stall callback from xe_guc_exec_queue_reset_handler(). In the
>    callback, if an EU stall stream is open on that gt, check if
>    XEHPC_EUSTALL_BASE is 0 and set a stream variable stream->reset under a
>    suitable lock (likely xecore_buf_lock).
I thought about this and I think this can be racy - if read() is called
after the engine and the EU stall registers got reset but before the
stream->reset is set, the read() would return bad EU stall data. I think
the XEHPC_EUSTALL_BASE register should be checked either in the polling
thread or in read (as in this patch) to avoid any race conditions.

> 
> 2. From eu_stall_data_buf_poll(), if stream->reset is set, return true to
>    wake up any waiters. We may also need to set POLLERR or POLLHUP revents.
> 
> 3. Now from read(), if stream->reset is set return -EBADFD.
> 
> So I think something like this solves both problems mentioned above.
> 
> So could you please look into this and see if this is possible? Or any
> other thoughts about this?
> 
> Thanks.
> --
> Ashutosh
Thank You
Harish.
> 
> >	if (bitmap_weight(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS)) {
> >		if (!stream->data_drop.reported_to_user) {
> >			stream->data_drop.reported_to_user = true;
> > --
> > 2.43.0
> >
