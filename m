Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCECC54E58
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 03:22:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5FC110E673;
	Wed, 20 Mar 2024 03:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nCbnuYp5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3E510E673
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 03:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710904951; x=1742440951;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=l4WIJBjjIjsWqY9sEvxLMxMv1FYQM90AghsfxXOTnC4=;
 b=nCbnuYp5fFWqrSC4dKx75zH45Lvq9XMX3FyZd7nVgrxT46e2e2FcVN4k
 aikbC9pDlY3frZ3kk/Owz3Y0PWkEEhhVXiYyGeD9QuyhDTbhfVJK98l4l
 jeQ+6x2QAb2cEH20VhWJfm47kXUtltCF39Xf/K5iVm6R3y5NETa8Z/ni7
 eLNn7z9XtIMTVVmWrfBtj5nmvqA7tAN8ciEcrmvxolD2m/oKyAzh8PEs5
 4NBiEbj8oHTBgySNXXgEqWp3OBRpScfjU06AKmfOrtAUkqyzQIVdFwRRz
 8tHYrJCK8dx5OHalIZ5a7mpJSrIu4gpm7/q++Z5oJMTI49L2RX58C4kX4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="23270484"
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; d="scan'208";a="23270484"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 20:22:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; d="scan'208";a="44986066"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2024 20:22:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 20:22:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 20:22:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 20:22:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Mar 2024 20:22:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYm/YjJ20p3M/RzUloABTK7+6dCWHj4XU2dfRnN+inCJg/57/sJkqDbGgIFMK0kd+kMnU80/HRmCH+HxIn7ylW/vWWfi2XJXIkR+WxYY3UN4PqblNtf/R+aB8uS5OK0rksq10wPKtWG7xKEkCwXMUpIpcAq/Tzx+tHiSytlBSj5ZRyy2wsbGgRedeXix4pEEG8yzu+mi5H6ejTEVsfgA6hUlRBYNV56kzVTxTJKEPPW4f0mOBZ29unEHz0Y1MkCnKiz1Zyj/+OQ+YDlNkqgOLfh6cZ7jweNvfzslCgooIDL0WMvzoBobSuZqMLjb1HUa9pjq7T5RPfYb6hNucjG6rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wBSQSFHYo5fUlSsIT6bFpnKpQb7SrCudHJPlQz9JD0=;
 b=R1Wy6nG38ueTMJZEVox9cxd8fuWZi5Kr6CMaEtouuDh6OjTjRjnoCKkDEyBrL8kxo/OOLflrCVC6dZOc6+vH+phgYE2NyoS2f+04ueDDwMErIeYC+Fjlky4rEfN/dm6QwOMBUinvLkF/YhhVvoComR0aX1sZwQfGylGiG8cX2FYfQs8WEW9ak/Uk0fU9jPTMKk3hSlt21ycolGQ+5wVF0ahoeolqRLk+fcxF2CIvblU0cJ2Rx12X5F7NYJF+FjslW6YATsage2ZEHmR4d4Lrlo8nVczCkPqmqedr2sbvgv0hw2/qS/3Ar47cNLgtwAN5P34H17XRX/xe/qDqj55GiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6775.namprd11.prod.outlook.com (2603:10b6:806:264::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Wed, 20 Mar
 2024 03:22:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 03:22:28 +0000
Date: Tue, 19 Mar 2024 22:22:22 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe/gt: Remove continue statement which has no effect
Message-ID: <rfq67ysd35zqmzefqhdw2hz6sqbfu5szf4pxgm2jhf4w6x5kgk@sgduat4rzh7b>
References: <20240318114057.3831274-1-tejas.upadhyay@intel.com>
 <5ukhtlrlcyw4n5shqptrlpyxfaye57zrrqtmajoq24xqejvnvd@qdk4jvbnworx>
 <62620928-feb7-41ec-802a-828c27e76664@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62620928-feb7-41ec-802a-828c27e76664@intel.com>
X-ClientProxiedBy: SJ0PR03CA0165.namprd03.prod.outlook.com
 (2603:10b6:a03:338::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: a19ed407-7c64-4175-1ea6-08dc488cf885
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XRAOnfa6xCl+H9sNdd9LsylCDSUQvQzfClCH1PPggD9coNtqsB8j/sM+wrcIqA3swFj1X3y+ZGKKNRkAbEy6qPytc3McWNLlryhaUJMJLfi1eGS59Nv8HpCU11atKNshZ8zxQdJEpL+rbjraDai2zAVjwnL8KPmlzNsffztMVzKtbvZzSFjndCl+ukmw35elZoVO+j0nr1N24BE0aarjdewPkIt4a/MaZTQGwjmTjF1VWYlI6Cq8eMeP/zsoRJJjIzGUAw9ZMl0Qno0/RmmLYTYo081Bn/PByMzgB51W+CU1sOQV4KrXXSE1No8On6CKTWmHvFb2z+6KuhrRcW4+rQ1D7sYKdRugkHTgN7gKnlfiyGDysn5zbYybQgV8lOmadbrUgwAJZMW9MzPKlnA7l8U+jJIx2H0gmhCfA3BkYZ6VXclHXmju4Krp0oO9GRAkluOTmJquC90/rnnc1Kxw/Jkh4u4vOV2Fy2P3tdsXw4xynFiRyDStAVFqEgDLpB67TOeRkWSrAyPcUvEA9JgGE84iB0OtNPEk9ev/fATLDtdUgwoFiYdvNjek334h+mMUCHTFf7EqjmW7ibr+tTTEKnztEgFKfZ4UKk5vV0j4gy+2aMWfehv4VUCJVXQqEWmSvJS/DxuGLRjLZdIYGMKJtnBLofVSD/S3k9VyoMprdRY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Ip1PQtPcnbwXxmcNTRV+Cs3R/AZYEm48Nm7D/cuJK0ZcyuIRkTZ6C0+5Lr?=
 =?iso-8859-1?Q?is1OA7UDao9RW5ThESflmRsC8QP5gKTFn8ejXD/c4jogmDoWRLePI5YU80?=
 =?iso-8859-1?Q?8VqLIT9KX/rk6eCtJYlUdVKLLGbwRG2bAWN+CQxpzk5tqulYgL8qmZabLk?=
 =?iso-8859-1?Q?itzCyEZFeNYnil6uZdsC+uhG1GVgCN+KVZwZWatXPlbdqU+Rzh3URSQFre?=
 =?iso-8859-1?Q?sHQFq37gLIKEt+un+7N1nnTGVEGptCO2/4q8tb9WjFwj9xgZm+TE5gdwvC?=
 =?iso-8859-1?Q?6mQZxL72J29Isi0dUClFbAFc1wkqqzqgQ0t0Q8AYrSAmuksaaDRQ75YLFf?=
 =?iso-8859-1?Q?hepmwSseTkWP58gsaVUZkYJYHfn15nPUNf72s5ULfaWPmGAMl+zBHWzOA7?=
 =?iso-8859-1?Q?UVuXS9oPYhBdfin22U1WbT7gY7D9XlH+2zUpYtO4ag3n3iO7oxnYBui7dx?=
 =?iso-8859-1?Q?TBGXVWfOke5yLAa+QAyZ4IpJtMO9BYf4l0Pc4PAMzZ2HXjpIVenaJCXux+?=
 =?iso-8859-1?Q?S5y/rCZM6tszXIOMsN8L2LI9Mtj4CZ/IHuGJIHTZLPhnDli2h0046ngTeY?=
 =?iso-8859-1?Q?7B31hI7MMWR89fkvj26FA6NJ/PLpm4tO9uIC92dxpgkrCJcz0umggdHKYk?=
 =?iso-8859-1?Q?Jfup+lMHGX+k0w7H5A6W+GkiHyW8BOzR0EK0/QplpMcu8dD4TgDmGLhgRd?=
 =?iso-8859-1?Q?cP6WqFECOZ1KuMr/t0gJefYyIbpTMs+ENdZpsyONtKlzibzA87rLIxJwIc?=
 =?iso-8859-1?Q?aD68GHfWVqASiXXzA9KvrJUElKvk8J5DUvh09xrWzPHsBiY1PAYECxpd1+?=
 =?iso-8859-1?Q?xXhrgzcRyyMyYi3Hrji03aynxr9WQMU34AcBpO+EXJPgkRchEVffK75pZ3?=
 =?iso-8859-1?Q?Lk5aNPtYRtGnassZXrNO2bj6woNJH1AOBntmcpfTktSBR1ZxkXT9mN4NQ/?=
 =?iso-8859-1?Q?byJc8GYr5w7ry+YWcGi4zJeFZKO9JwYzkrgXd2349+cFHkGzO9j3JFipXF?=
 =?iso-8859-1?Q?1OWm/KBiJJdw2etfTgm1D8cJp5t0kvWIxV8VLlqMivLdLN1zlNByUoa5XY?=
 =?iso-8859-1?Q?oYG5iRnU1Wx0VHETiNP8mxdLzF3lAxsyGhc+GMLUbchQ74XGjVLffPpMyD?=
 =?iso-8859-1?Q?AYE7nxN9vPgMKd8XPwa9eSadPsJtsyQPhpbTFYzv2bgByVPZZZ71Shazj5?=
 =?iso-8859-1?Q?E7zB1rJ/fI40j2+8CbD6Qxgbyr5kZf6DsdLeJQBon9kw2TtXPlJF0pd2gO?=
 =?iso-8859-1?Q?K4mJQdyUxJZJHUgqMkAnwJeIzC1jSk0v+TvmOrhjNdSifUzcyvAkutZHrB?=
 =?iso-8859-1?Q?g7+/BWfC1hsbZW+uN5y109hJ3xqOB45LaJFUZWxCJh6dLrnECcXwa+6Als?=
 =?iso-8859-1?Q?A1tDcx1r0LojL5G+R8HAPTbSyZ8dNQejWotOGtjVya8ptihKlobwvpgUuC?=
 =?iso-8859-1?Q?MzCETO/fHo8sBBNIMewjaw38kB3rpeVg2mEqC/EaUZJzL3QXu7/PBUgtmI?=
 =?iso-8859-1?Q?jGVNGUriq09d7x4IkJpHyHNpaS6nr/HlRlD2Wy7QmFgxzmum5VC9kkKNwP?=
 =?iso-8859-1?Q?S4ygmVWpVgdYXzrHcsvOAaVxhTCMMZXK21IjVt4OzC2Dr9UE/TJn+KWUfj?=
 =?iso-8859-1?Q?yWiuA7e6LNm7I8jXNrGm6Yf6mU5Cu78T4nrlogeLG1h9WIMDMUd3kPuw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a19ed407-7c64-4175-1ea6-08dc488cf885
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 03:22:28.3166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svOMexLE5plv+lNhnXIrOpYr9pPFdoa3E6nlFSu8J0VDHkw+9xuH8DpyBtMeR8QIwSjUa1eQu6gR/GionYC2HHa0x8H2tzc1j1HQA6/lpz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6775
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

On Mon, Mar 18, 2024 at 08:15:12AM -0700, Daniele Ceraolo Spurio wrote:
>
>
>On 3/18/2024 7:48 AM, Lucas De Marchi wrote:
>>On Mon, Mar 18, 2024 at 05:10:57PM +0530, Tejas Upadhyay wrote:
>>>Remove continue statement which does not have real effect
>>>as no actions are to be taken post continue.
>>>
>>>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>
>>Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>
>>as this comes from commit 3d2b5d4e28d9 ("drm/xe: add GSCCS irq support")
>>
>>apparently we needed to invert the check for class since GSCCS is
>>OTHER_CLASS, but it's expected to return a hwe from xe_gt_hw_engine().
>
>I simply didn't remove a "continue" that was already there when I 
>removed the last statement after it. My idea was that this way we 
>wouldn't risk forgetting to add it back if we ever add something new 
>again at the end of that loop. I'd prefer to keep it in for that 
>reason, but CI should catch eventual problem so I'm ok with it being 
>removed if you think it makes the code cleaner.

I do think it makes it cleaner. The continue at the end seems odd
to me and made me think if there was a bracing missing somewhere.

Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>
>Daniele
>
>>
>>Lucas De Marchi
>>
>>>---
>>>drivers/gpu/drm/xe/xe_irq.c | 1 -
>>>1 file changed, 1 deletion(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>>>index 2275ca35a3c7..996806353171 100644
>>>--- a/drivers/gpu/drm/xe/xe_irq.c
>>>+++ b/drivers/gpu/drm/xe/xe_irq.c
>>>@@ -326,7 +326,6 @@ static void gt_irq_handler(struct xe_tile *tile,
>>>                    xe_heci_gsc_irq_handler(xe, intr_vec);
>>>                else
>>>                    gt_other_irq_handler(engine_gt, instance, intr_vec);
>>>-                continue;
>>>            }
>>>        }
>>>    }
>>>-- 
>>>2.25.1
>>>
>
