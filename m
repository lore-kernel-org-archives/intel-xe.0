Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1A0C02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 20:56:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721B910E0B4;
	Fri, 14 Feb 2025 20:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VSBE6rc+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8400110E0B4
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 20:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739566559; x=1771102559;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=717LUWCMf415eenGcCjuoiqte/g1sZER9OQwhAejYSQ=;
 b=VSBE6rc+gUuTwR3MbFjYLsMm6K4vlfxrV8GiEMJYed/pHi770TVHbVXc
 oR85NvlW58g51XRamSbqPfEnYP32EseNv/za21BQoLSQAuQq1qX1zAIY2
 hIQ1WvnZV1OWs08VQqLj55VmJaDgev7gQ62iGVMtj/9yLiMEVb2MXlvMc
 DWIzoYxrBqpWoxANqV2Y+GYCRtezNDAQE0h7RvT4Ts2jCljQgLU6f+/WZ
 FPIIQPjO1y2LBaa0UEXv9Aqwzu4SCJ76GC7AzkNwuHgSPUrwVe7MRr9CJ
 aLXGKNXOjBML9lzL8dn3xXSZgeievlV6KsoBBeB3rSFpGrd3oFqKl31uw w==;
X-CSE-ConnectionGUID: bZVqrE0WRBePZsPJ74mgiQ==
X-CSE-MsgGUID: fDiswQLOTfutB9PxkQ6ltA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="62795142"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="62795142"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 12:55:58 -0800
X-CSE-ConnectionGUID: QsVmctzhSXmecrDbA9HTIQ==
X-CSE-MsgGUID: i+tkYSVGQleKwVYJemrtZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="150716568"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 12:55:59 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 12:55:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 14 Feb 2025 12:55:57 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 12:55:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S6NnFiTa9x8m01i2M2saZGzA5CyeUu+8m6fpzTwrhtjfd9pRCr+4RL6niEFvTid5JaX32Bvm0yGmVkp5M9/n8gV3636g0PxvHEfRhwzl5K6aGtsunx2mMKh94UaJy6lDIUrRZkqLOxsOWgjuj/hBiNjRL5rKC/rcZQa2Tx11TPw21Td0u7KqXq/g/1oexapEY6OCvaIn+skHEZKPK4v3v3tDnC6rTRB2vrR3PRvGLYQViC9kpF2vngbfKKDkPn6UV3rXYqBuSQeGRC55bKukMDBLpMxtmGU8+9bACx+VqgkrMfJ1gQpPqaGtTGb+6wfJNQuTomta78twvfo1/BOwsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsHFu70oXer8ikuj0OqTqYHL8aDvZ+XlPJe2KekiP4g=;
 b=BEqsPZ1HRU1wMyUwNaTlVC1iNRY+bCPlAZ4sdLLEqmS+Q5Y6UEciVRopJ2jHng19v+ebDlUD7jKyfI+nVWIiwSsw4yl7VwyDcAZwqlg4NDCdXlyqfbuP8t1GcgvVYSVaoTLLIaMCJ1KXlrDaYJ+1MXGQjGKE70PqkwplILxCu2L1uZnR5CtHVj8bWcGDH2yNa9DzYofm0GFwei4LOq38rrldYCaTTK5/JxRIZIPG9yOouieHPzZxTt8ZMi3ON7WH30zpr55jhLAtC1UD/RlQ2fIelDdnNboPUmhmDb7pj+P5nXGD66Dio9YwhnGYdGrWgA1C8XsKFpkLu+ayAWjBLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA0PR11MB4591.namprd11.prod.outlook.com (2603:10b6:806:9c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Fri, 14 Feb
 2025 20:55:27 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8445.015; Fri, 14 Feb 2025
 20:55:27 +0000
Date: Fri, 14 Feb 2025 14:55:23 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Francois Dugast
 <francois.dugast@intel.com>, Matthew Auld <matthew.auld@intel.com>, "Daniele
 Ceraolo Spurio" <daniele.ceraolospurio@intel.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 01/13] drm/xe: Add callback support for driver remove
Message-ID: <boqjdidqhztq6g6qeogutfir6klugpesp46r7jrwv3ex4t6gae@z35ia52kzucx>
References: <20250212193600.475089-1-lucas.demarchi@intel.com>
 <20250212193600.475089-2-lucas.demarchi@intel.com>
 <Z6z-CHRbTtO137d7@intel.com>
 <y2la6txhtvpkpbru6uxfcogmpwmvoujlfk22qem65nvllxvrnp@afh54ajgo6co>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <y2la6txhtvpkpbru6uxfcogmpwmvoujlfk22qem65nvllxvrnp@afh54ajgo6co>
X-ClientProxiedBy: MW4PR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:303:16d::9) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA0PR11MB4591:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ef02705-d7b6-411b-469c-08dd4d39e901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?yXhN5KQ9yx9tQksH0qJFvTWyfrzbVjNvCYA4Wc8L4uSLbvGALHy+iyzlVW?=
 =?iso-8859-1?Q?tm1cflB+BEhgnEWgedDUdkK4CddEcum/1dEBk4nCdq9EJMpiWA6zZW1/37?=
 =?iso-8859-1?Q?Ju05uXqXE9lclVfj6aaXF2F1+c7CD4y+OMGT5EnGiiiJTABi1OjO5pMoMw?=
 =?iso-8859-1?Q?3ZSfG5B4qi+aJ0JSgvwL0W3IhiyFWHZ73EHJ6V38Vbshds9ptkqqQ/CZs0?=
 =?iso-8859-1?Q?emt+3H8k2aT7xojGOszmNIAmh6iQEeSEUxB5HcSXtIy7gnnLVkuwNqQnJv?=
 =?iso-8859-1?Q?NeEKC9VrHGVHX3hbZoGvA3E9oNj+SoACpEZsH+cToraEVuZwiF+gUYzTyD?=
 =?iso-8859-1?Q?fwdQwSVhcSKiei1yaVW1MGrAKNuD+u/untIhzscmB+6m++WjlFNTuioIJS?=
 =?iso-8859-1?Q?hrgB86eWKoBw0h0js210dOYC9CgbbqpVeDKxS4Rng5zE6nui7/RWYFdRLH?=
 =?iso-8859-1?Q?XOUiqK3eMmDP/V49gVUiwTF3nmX1+5RTMJ3h/u6JEKRuE1LE7BN7rkTNqk?=
 =?iso-8859-1?Q?UoZOZ1YCXq9JNq3+1bwVA/TyZnZ/rjuKoK8bqCNvmMohDXw0oFzEHezUak?=
 =?iso-8859-1?Q?19uzkg0qMMPQUag9CTIHBnQsISwPyvfkXFn4M4K0adAAuN4cITYm1Y9KSO?=
 =?iso-8859-1?Q?8kD9JmnLaBKmNZVbSAonuaQzF04NMNoDm50ToKbCrhYn5EoMB/FHquS2bx?=
 =?iso-8859-1?Q?kmyoYG28r53gJMC9Wv2IGYYxijvhYsRGun9b7BEqd9fgwe7AWrBfKxJHYW?=
 =?iso-8859-1?Q?WjQbKglxSFKXIXHxQNxEGuEu+lQZZ70PfIZRslAyCu1nj9poS9LCk7+E19?=
 =?iso-8859-1?Q?uLA+NtFubKReP6p+OjbNvTgIExQSpB+em0dpWWaJ/8YcqUo+UpO0L4fEYw?=
 =?iso-8859-1?Q?09JAGoSEYubIzx630WBjSFccAD6CwmXq1G7rDaVyVEp+2kdRPKc0KwKcnU?=
 =?iso-8859-1?Q?c1vRLCFfOi2rNVEp9vZzH2tyVBtDU2v6rskOb1ikfO+G73xAT9exkvbxTS?=
 =?iso-8859-1?Q?9cVOVFgLmeOB1EtfyIHYIND5+47SiIuTGD560exgM1bBgkUkOBUqQmjlNO?=
 =?iso-8859-1?Q?h8+zHb+j68PXHyHjC9Ni23LIE1NSUc9rXKBeitRpGmCqJXRFp650/9a4/v?=
 =?iso-8859-1?Q?B7xAa8BRN7z2t9f1amDg1el3U/JwkSGw0WfByd2WHh4GI5Qd6/Ix/+7bOU?=
 =?iso-8859-1?Q?aiWl9fvCQoHbvfQvjMNcBqjxWGZpX7mWCX5nSpMWe9Fxq/G0fTgQFVAZ/o?=
 =?iso-8859-1?Q?qJD8pCAHz0YAFwwNbzWW+0PAtWlUGBfXom7dkqINEo4mW8bR/S7p5bLmfv?=
 =?iso-8859-1?Q?jmUG9AoLusy7/X/bZejMnGPAuBENl/PVKlth9PZ1iVPonQ2HxAkjXlRq/W?=
 =?iso-8859-1?Q?P0ZRXHvMzTvUOA1tnc9gYEf+N4abkTKlZyswvblDJvfm1Am2R67SZ9wZzo?=
 =?iso-8859-1?Q?eZylv+hPeOZNneGQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?fKE9mUNuo6atXXSSj6bxYPv1hjnH7H0rOv4v2GbfSl7w9v8feuxTa594Zf?=
 =?iso-8859-1?Q?Av8oFnOLGk/HmSo9O4Zn9az/auJjZeunhaur6X3ucllZ2a1VP5crEMXw+L?=
 =?iso-8859-1?Q?Iu131M2DX6YyhoLDbWmzzeLH5eMwKXyc/F5vBHiwOtia7cNT/tgwpsBGtO?=
 =?iso-8859-1?Q?59FKoLyA5WgiKUxtsDXKQ0PvpaRWdOuyqQDqUgkLrxs8AbUPAhAyrT+XVK?=
 =?iso-8859-1?Q?XWneVlmMxwsYICQ7xeX8Mx1FLkBUoBWaQVp+TBtzAH5jExd4l4yWlDwqxE?=
 =?iso-8859-1?Q?m/wIQcX3tuLGWsy8AdZcE+5LRpsmq79aJpCITlg5oQpRSnOroDWN4+PNls?=
 =?iso-8859-1?Q?4Q33htVok6fc+XQAw2onNsQ/R//2cxCWid1RchWKskaRddhI5s0o/Mt/4B?=
 =?iso-8859-1?Q?ara+frKG4q/peCtpN0jV6vwq8T5QGmsdNznChsKx/pWuP+aBe3aeG6E66T?=
 =?iso-8859-1?Q?VIKFqFjSbovCsx8T0CDe65wxBn8qIvV3RE9dTk00Oi7n9nHFpZoTD4b49L?=
 =?iso-8859-1?Q?Jqb+KluzIibUmxsH1dyl9nZ30Q6bkruWvEiKvFVJzHEzJo19ForbJRmrLQ?=
 =?iso-8859-1?Q?nP4SoZ7NEKmlVIl9Brxz4U6NLwDubneiL2mmZu63Kin/nFidRQL0qplFeZ?=
 =?iso-8859-1?Q?XVxCy/Rk8vF5EpaBsgkEkVM99YQ7jRjVXLSISjOzs2JpR+mS4rHwdRvw7v?=
 =?iso-8859-1?Q?QIashiKe1+hgLqwHyu1ErJ0QVN8/7arKDUzHfeJPc3Skc05BwtJmyeBslX?=
 =?iso-8859-1?Q?eixW1X+EBiY2KJeVZihG4LJwTTTqM1Ks15hBWMlWQb0AuFLb3E4PKVvNlW?=
 =?iso-8859-1?Q?GZQSeJ+riBkFsZ93KOgLJEbV8cXjzn1IRpTeHVmqGx4QQqixeaZczV63oW?=
 =?iso-8859-1?Q?jZX9ek0Bu+eLt5/4pYku3Rzj8xSjMv0JfBPYjH2A6CgDROp+WpM1cEKyWT?=
 =?iso-8859-1?Q?SQw0yLJBSzpWV8yNe3GidG4Bt7DMqlbqZCJkpRGkSM7TyY9iFtyptF0P6x?=
 =?iso-8859-1?Q?P8eiEZrhA28tnzTYSUis7NIcAZ9RH4d26ubvmC5d3BDr8+zLka/0Q3gTHh?=
 =?iso-8859-1?Q?DOJG5a/RSj1OSfXgICofYGqAUcerqcXPI+2clDrY60Js7W84GFJNeuc6jP?=
 =?iso-8859-1?Q?r8jcqud8hoaiJr61Ggu33GddPXeuygrRFVLwpZkMRzf0l2eJ54sCMleEvA?=
 =?iso-8859-1?Q?U/7ID5FWqqez1mB5118YET43EeiyvJrEZwRjcFxmK3kUj57KY+3DHcaoIA?=
 =?iso-8859-1?Q?XgAFl6LjKbLtUBCTmUw2O9p5BR8KXHJyfo7xaiVMJ6lGF3lQMv5Ocj09iJ?=
 =?iso-8859-1?Q?4TJ+pLiQcw8f4+K1RJtsMj7iGYPAYaMgqMd37fJWKX4ik6EG+4JA0A/rwp?=
 =?iso-8859-1?Q?w6bzpTYeucYdo9PFQYWdYpW6uajXx4xUGeCehPuGlkIn1UENc338j/Zn9p?=
 =?iso-8859-1?Q?LlRlhKWQRBB5OwJ5fKiGbuqHl6FrdXdIveRwlhDGFkG8ehRVR/qKTJVWFL?=
 =?iso-8859-1?Q?2uIczXZdCgJzu2MtPEuEX0MYQuIwOLF0zLv9D1A2LBitSxcZ49+2REES2Q?=
 =?iso-8859-1?Q?evWkH0gnE998OI1B4zxpFsUCPRsW8JZGSuejPaQWYBgjOcZbqXOt2Zb710?=
 =?iso-8859-1?Q?nNpAJoX5U2LIAFaH7O15MDp83k7kZihMQhZ8j2fXFdsqerIYv5XizCGA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef02705-d7b6-411b-469c-08dd4d39e901
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 20:55:27.6373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vdSyRVHFuJ6WWks0kIAzFuOQzuLGSchBycLUviG0zlYkH/GpgcoUTE2DWhMSDq+BRh/OGHC8za/ykTMQIMJMJXpu/rKWSL6rlzjj2CcHdfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4591
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

On Wed, Feb 12, 2025 at 02:11:42PM -0600, Lucas De Marchi wrote:
>On Wed, Feb 12, 2025 at 03:01:12PM -0500, Rodrigo Vivi wrote:
>>On Wed, Feb 12, 2025 at 11:35:48AM -0800, Lucas De Marchi wrote:
>>>xe device probe uses devm cleanup in most places. However there are a
>>>few cases where this is not possible: when the driver interacts with
>>>component add/del. In that case, the resource group would be cleanup
>>>while the entire device resources are in the process of cleanup.  One
>>>example is the xe_gsc_proxy and display using that to interact with mei
>>>and audio.
>>>
>>>Add a callback-based remove so the exception doesn't make the probe
>>>use multiple error handling styles.
>>>
>>>v2: Change internal API to mimic the devm API. This will make it easier
>>>    to migrate in future when devm can be used.
>>>
>>>Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>---
>>> drivers/gpu/drm/xe/xe_device.c       | 79 ++++++++++++++++++++++++++++
>>> drivers/gpu/drm/xe/xe_device.h       |  4 ++
>>> drivers/gpu/drm/xe/xe_device_types.h | 17 ++++++
>>> drivers/gpu/drm/xe/xe_pci.c          |  4 +-
>>> 4 files changed, 103 insertions(+), 1 deletion(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>>index 36d7ffb3b4d90..69bde506ee87e 100644
>>>--- a/drivers/gpu/drm/xe/xe_device.c
>>>+++ b/drivers/gpu/drm/xe/xe_device.c
>>>@@ -65,6 +65,12 @@
>>>
>>> #include <generated/xe_wa_oob.h>
>>>
>>>+struct xe_device_remove_action {
>>>+	struct list_head node;
>>>+	xe_device_remove_action_t remove;
>>>+	void *data;
>>>+};
>>>+
>>> static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>>> {
>>> 	struct xe_device *xe = to_xe_device(dev);
>>>@@ -746,6 +752,9 @@ int xe_device_probe(struct xe_device *xe)
>>> 	u8 last_gt;
>>> 	u8 id;
>>>
>>>+	xe->probing = true;
>>>+	INIT_LIST_HEAD(&xe->remove_action_list);
>>>+
>>> 	xe_pat_init_early(xe);
>>>
>>> 	err = xe_sriov_init(xe);
>>>@@ -886,6 +895,8 @@ int xe_device_probe(struct xe_device *xe)
>>>
>>> 	xe_vsec_init(xe);
>>>
>>>+	xe->probing = false;
>>>+
>>> 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>>>
>>> err_fini_display:
>>>@@ -907,6 +918,72 @@ int xe_device_probe(struct xe_device *xe)
>>> 	return err;
>>> }
>>>
>>>+/**
>>>+ * xe_device_call_remove_actions - Call the remove actions
>>>+ * @xe: xe device instance
>>>+ *
>>>+ * This is only to be used by xe_pci and xe_device to call the remove actions
>>>+ * while removing the driver or handling probe failures.
>>>+ */
>>>+void xe_device_call_remove_actions(struct xe_device *xe)
>>>+{
>>>+	struct xe_device_remove_action *ra, *tmp;
>>>+
>>>+	list_for_each_entry_safe(ra, tmp, &xe->remove_action_list, node) {
>>>+		ra->remove(xe, ra->data);
>>>+		list_del(&ra->node);
>>>+		kfree(ra);
>>>+	}
>>>+
>>>+	xe->probing = false;
>>>+}
>>>+
>>>+/**
>>>+ * xe_device_add_action_or_reset - Add an action to run on driver removal
>>>+ * @xe: xe device instance
>>>+ * @ra: pointer to the object embedded into the object to cleanup
>>>+ * @remove: function to execute. The @ra is passed as argument
>>>+ *
>>>+ * Example:
>>>+ *
>>>+ * .. code-block:: c
>>>+ *
>>>+ *	static void foo_remove(struct xe_device_remove_action *ra)
>>>+ *	{
>>>+ *		struct xe_foo *foo = container_of(ra, struct xe_foo, remove_action);
>>>+ *		...
>>>+ *	}
>>>+ *
>>>+ *	int xe_foo_init(struct xe_foo *foo)
>>>+ *	{
>>>+ *		...
>>>+ *		xe_device_add_remove_action(xe, &foo->remove_action, foo_remove);
>>>+ *		...
>>>+ *		return 0;
>>>+ *	};
>>
>>I still believe we should add here a note here to highlight this is the
>>exception and that devm should be preferred. But up to you, the
>>explanation in the commit message makes more sense now and the patch
>>is right. I hope we can get some devm solution to handle this component
>
>arrgh, sorry. I was too entertained with the devm solution that I forgot
>the update in this doc that you requested in previous version. My bad.
>
>The devm part is here:
>https://lore.kernel.org/dri-devel/20250212200542.515493-1-lucas.demarchi@intel.com/
>
>In the end I could simplify it much more than I thought and what is
>required on devres side is just one patch, 2 lines diff. Hopefully I
>didn't simplify it too much. Let's see. If that one is accepted through
>intel-xe tree, then we may even drop this first patch and go straight
>with that solution.

let's not rush that other series and continue improving xe - there still
some work to do on the xe side that would otherwise be blocked.

Thank you all for reviews.  Series pushed to drm-xe-next.

Lucas De Marchi
