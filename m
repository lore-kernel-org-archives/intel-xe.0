Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A762C02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 00:16:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FDDF10E0F3;
	Fri, 17 Jan 2025 00:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fAxIZtd2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE4110E0F3
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jan 2025 00:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737072972; x=1768608972;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZmsjEsFhnq9oGSmzJpsH8sCmE+/jsReIDesJ6hsU6kw=;
 b=fAxIZtd29byAvsjSTjJZpRZFev2RHHa523cNhXzBe42grU0Giryq11+x
 deB53iv/MZH5fkB/0DGbXkJ3ZDyc7+84xVaPdmL1sS6s54fWpeJHCgDg+
 BrZcIuqdzG2gMLG1Ek3xXexiDWgadwWHLuQ+JQWp8giuklYI0+B9viPAX
 AnJ6iXSim/LE+zV2OlCtCKpX/jinLbIjVrr6dxKkX6GzFn3pFWgwnqZK9
 j7SlDD/lW08OhQqLfadR9ncC7rCZwluqzEvhZy5WkvwaaMvhl1A60vLrs
 MCKdsKvgfRxbfavEuR09hAfrQEJeumULk5zMAKmJ883eGNS2VziIZxfPz w==;
X-CSE-ConnectionGUID: qkEJgS4QSyaKn+7HlzOEAQ==
X-CSE-MsgGUID: GbMN/ozKRRaUBEscUlt+8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37646209"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="37646209"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 16:16:11 -0800
X-CSE-ConnectionGUID: q77dvONbSsGTtalWGqfPCA==
X-CSE-MsgGUID: ls59GTNjRwOtkQQQGDjg7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="105802683"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 16:16:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 16:16:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 16:16:10 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 16:16:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RWI+4NHaBJz5h8TbZO1z3oKsPaKwnDg3PBrkQRuBzCqIz9EB98WUJOkq4ieDNRZKYVfJwJ3o9MY/t5Of29DvyDfhp53I8RonAoGVqGl4CNy8NAbC1d3ewGIihmkQRjrYgqNpyuYf6SezRYBf4gZ7RalyMQqSjNb7+db7UwjVsNvQDDGbWbpZRBR0HqHGEfcdBCGGlM0fUtDTJtbY58qvP24Xwf6UkCvjD1R7xSlEUFHPBI5gwYOQP3rGuOoit06w5I0p6YneBIbJMSl38szCxnTdJtFOcN/cVwtxnmdtEf0fFtzd16fyefS+ZfxMkLE+yhTA7bjMVoqQVXa60xH2qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AvJVKAt9hrgS+3/7eZXXiDnTcjqhHe/gX8bRZRHyVv0=;
 b=Own9ov0X63yXxg/8+5dijkSNsC/Z4nCIw/510jDrUbcBXvvB97zkuEEZtAHxpMkDnIOvHULuID6cxxILTrHYrGKvsf+IPpBl6Wv4eNoH1UhFTqK6s7Hasxv34/Eo3EpsVa1bM5agAb/XIwSj/KSuIuXCgOtu05u6pijoEeeooc/8Keuyov9htr2eLQOE38Fr9sx6+zlVAQyLXg58wiiLoRpVUQIn8/q0V552IrYRzyH2INUgDz6cHSGH7HepppXPLe9lHp/DgvOOEWB4vBDNmVFF6ob9TKG7cpLCry2kRTmsvHwFLHlViL3TTR7X5Se+S64R2qM8DmuTxxV+hDnuHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB6371.namprd11.prod.outlook.com (2603:10b6:208:3ad::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Fri, 17 Jan
 2025 00:15:54 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 00:15:54 +0000
Date: Thu, 16 Jan 2025 16:15:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Aradhya Bhatia <aradhya.bhatia@intel.com>, Intel XE List
 <intel-xe@lists.freedesktop.org>, Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, Ayaz A Siddiqui
 <ayaz.siddiqui@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/xe: Add Wa_16021333562 and Wa_14016712196
Message-ID: <20250117001551.GL5109@mdroper-desk1.amr.corp.intel.com>
References: <20250116091004.3060996-1-aradhya.bhatia@intel.com>
 <20250116091004.3060996-2-aradhya.bhatia@intel.com>
 <2dssrgaez7pygz7m43tjx2h7zydrhj5obway6xdhuju7s6kqqs@2uaatfeyu3ad>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2dssrgaez7pygz7m43tjx2h7zydrhj5obway6xdhuju7s6kqqs@2uaatfeyu3ad>
X-ClientProxiedBy: BY3PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:254::7) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB6371:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b417702-1f6f-4481-130a-08dd368c1b7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?o4XjjllXCYQdXjERaJhpsEsxRzr4SZM+FvBHvGqegfJPU/m6UNarpQDyNZ?=
 =?iso-8859-1?Q?8eN85w/wiXAJuAQTSzZ8eUjwV2lWEAnknOX4MShsasnYvqak4D4KiAaDkC?=
 =?iso-8859-1?Q?qh+LKW1rLm/B7h1qEvud64cllKdBltQ5e2aJIsT3qHoasycTTJiZFKh5xN?=
 =?iso-8859-1?Q?GDNiUeCxfPiIIRTk4zBUwVAzwrn5AizSZPYgpRAKA7CPYOuf/679OGsKY+?=
 =?iso-8859-1?Q?XHzFpq+Q+oqWScruXaDVEZL5ouzTnIgc3LIMFHXPeXtziSnmBxLDwubLsc?=
 =?iso-8859-1?Q?fGpYowLGOof2HemgX7aZe8sEoMjYIOyF1fLjqV9IYk0xw06JmcU7+b6/HW?=
 =?iso-8859-1?Q?68pqEZSW30dTz8PuaAOfKYi/EQRDC6L2aKBVmsW4wmMG5h3NCvoZN7WG//?=
 =?iso-8859-1?Q?UX52MngfFXnGp0oZ4VruztoooOLqvb6oU+BppCyrNQAK4SVg5RY+YxJK8T?=
 =?iso-8859-1?Q?b1jn3h+wOWBjHVWnKFkxdEohF33SKqDvmUnA9sOle6vy1E4EHIy88nuEDy?=
 =?iso-8859-1?Q?iBeqqIJ/YsvLADmvqm5lguCcalA2uQqW3nnRAHrrbFgN5HQ8Hz9Qb3h5ZH?=
 =?iso-8859-1?Q?I33sbCZGomh0eRZ7QTNfXjkZGiq8ht9ERX9SRCVi4kh9tbOr/PGEuy1xK8?=
 =?iso-8859-1?Q?c7/7B/pHMvNAHENi7k2kTM3vgnL7tSNl0NAzvFmQcIh2Fup927JzOVmemR?=
 =?iso-8859-1?Q?vCuSuYthsyWzcd/bns6piQie9RmSMnRjU4I9801fWF7MUpY+W2yuYc//QN?=
 =?iso-8859-1?Q?EgiijXyFc0GurIZYEX8jFjxZPQZZaAxFVBU1klmGEfTjto6mKraDdQ82Lm?=
 =?iso-8859-1?Q?a9zH0qqnUQgUBZP5OkC9oraPtpea7++p33DMg/LB99NDbyVic4OrHrBgIW?=
 =?iso-8859-1?Q?rI00HGeMGRVrPlb76Zo4VrJWsimG/nilCVijokEUC/gJaXsKPoJHVfFTin?=
 =?iso-8859-1?Q?7lr69jbflAMAfsNBRLfDaNYP3GlkASvMZ1gXbiee068JKTRb4eQ2jihYKw?=
 =?iso-8859-1?Q?L5y+6P/Rp3o1PitRjKOXOCxkfqLvrXy0UksK5e4ykF7iWrUVNg95lUhtjw?=
 =?iso-8859-1?Q?adgYvz7bxfjHD13D8Qqq3qvi0CknNjaeNIFrPXCvgcnN8Q9juAQdOXykgT?=
 =?iso-8859-1?Q?+40YGVmCuRDHDqIijnARg/dvAqdQ05/PsCEmXi8ObQmGKl639z2m+PRqBh?=
 =?iso-8859-1?Q?G5UNqG19tb6QJ9txllPn96bhiFhg/2pWuSeNRIr70clsKVBxAdZzp8a2mm?=
 =?iso-8859-1?Q?Xax/zVXMntBodgogXiC9dzF81McS3wmPtfh25J+LV15RG+358zfXplrRpe?=
 =?iso-8859-1?Q?X24Cu4rM6pWqpS/Z/fibPr4ur9GpfKM3ku+hvUDdX3uYyLe8VegbfKHDM/?=
 =?iso-8859-1?Q?+yNaVai3z+zfdEEH+WarMjM4acKpQ4l6AAygIiSbSfRaSirJpQ5vutoflS?=
 =?iso-8859-1?Q?D/s7uYgPEUxb901G?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?eH6wpLzTQAgcd1z7JN804MNZ8zj/r0aQef2nn5Fqn/XnkqzmnUXkffG3Yq?=
 =?iso-8859-1?Q?5R8lyTAur2g12YmC+1hFj2v2hfVgJShtf/DbE7L4apb+9RFo9a/F0Yjeqz?=
 =?iso-8859-1?Q?gx5v3VzBtFN1H4pCMgX628CeZoidu5IxxCii4ipUIN0LCGTfGFAvcj1OU9?=
 =?iso-8859-1?Q?lyAaQBeef5JdrxUtBPl/1cRBPXccgzb4hqElui8STPjhOUGL3Wrjrueia2?=
 =?iso-8859-1?Q?15ClOBqEPTYzuM3bmoaO8aGX1kpWpEGpzaWX+fv8EkJFGxSHaMEkucYvlE?=
 =?iso-8859-1?Q?+q9ihSGiEFcdLXAyEPzmZu09+ZN75pIvhvndZ4npNXPbbSeNUl1Ijq/m/Q?=
 =?iso-8859-1?Q?7ZDJ0cjIXo4jVfj4eYtlmqRp+W6cLXLlmU7+Q7rzvnBM19tXGRlUG5jegM?=
 =?iso-8859-1?Q?2+LQNHzO8Ct3oyLNdvbZtdvlcJFxigUPxU3VWIQEGwG2abaAj187EzfBnC?=
 =?iso-8859-1?Q?z1tqRKR+NxV2ohh5Ag6dZn9pBTQOyHJhkd9Mi6W9njNotKg9Fz6Gy+tERE?=
 =?iso-8859-1?Q?SVyw2odiRZC4x4ydXvkcmfT+raZrHKctpqZOxMdpG9udwjDjxi+OCxCNJ6?=
 =?iso-8859-1?Q?DwTEFmSDgtuPReqnYi2q8WUL9KOkWtWp9PfdJsKpgE6v0X5Q+AHfzUuKc6?=
 =?iso-8859-1?Q?Yhw8EcAHWtc5FKEZXxpAyzZzccQF4D6BsnyyxLjh+XTJ5UuVayLrV8pOHR?=
 =?iso-8859-1?Q?nQOA0F0Ooq4kkdy91fGx+AsnJI+vMWRavDhhH1pzvsccwGNmVgeLqxH1jy?=
 =?iso-8859-1?Q?jicNw0sR8lfm2wX//XTDZ5L1Z9ueP0rYx1Eso5ZENrLa4185VO5Yjwpm72?=
 =?iso-8859-1?Q?dfQDM+cS5uqrS2PaFWQ3cuNG/Fo9wrZUr/0c1S9csrpYg6rInFt+c8aaIh?=
 =?iso-8859-1?Q?adTa/P181y3Lu8gWIDgCH/X1CI8ek4xIm7IQm3L5MYH0CfGREl1L41HmOG?=
 =?iso-8859-1?Q?FbS//ClwMQUhc25nazHQaB1M7PwW3VDwUhTfo1UBySG5MzOCuddfBJLNiN?=
 =?iso-8859-1?Q?l3AkKB/hVXbsIZcKf0m6WDzfkYSiOBXVRQgv3XkYqSdiT+Oh7IIrV5tzm3?=
 =?iso-8859-1?Q?Ce0koxtru/Z5CQD4MJnLCvt3vHYJK73fNvflQIyje5dRbJkoyPAiu44WTz?=
 =?iso-8859-1?Q?3ZLmai3xhPRoV7FD+DHmuiAivVWaKREDVXvochF2yOXDh4fH1DypYPsaGJ?=
 =?iso-8859-1?Q?Ojb93kE5JCp9jF8Tgq/WVnUYZv7HLv1IhxnL3bZRyo+2J+LVTd2dnH/7Ec?=
 =?iso-8859-1?Q?1cX7TbGQ8/hh3aRonk0mFxsZbJPSHdAIeOOo6E4Yb8o4CQgNRZATP5mIr4?=
 =?iso-8859-1?Q?UE3px9qs/mTDqUqoRoHzfGmcPRTnKPPGWTPLx7AkKCQJSKrz3pcR6G6MeT?=
 =?iso-8859-1?Q?gR3G0lmVR/0PpWRL8vqDRaa8k0d+2jUnMkKwIXPJfzZkXk8PANAR1NKIzW?=
 =?iso-8859-1?Q?QVIQuMw9RTI+VFa/J6Mj9tkCPnNemukWnEP3ClRsElfuU/9hbtrJ5yCky3?=
 =?iso-8859-1?Q?v020rza3WFfPC87aGZUl2i61pZuElXXUy0JNK2wdL3n3xehr1lOt1sOk5A?=
 =?iso-8859-1?Q?1zURqihHAyph9nbaP3NNgJqz6au5BOZ28bxwDmIJZfx3TUhUTbj2E1+qqV?=
 =?iso-8859-1?Q?aq8S6C8qPDy1qn7039l1jgy68rngqdPRS41wZ42ooQNNO+B7F39+dqGg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b417702-1f6f-4481-130a-08dd368c1b7a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 00:15:54.2237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BKvMPic6pxWn+iG9JPOhQrZZwFs5a2XrysX0nVOelPwIxVAWdtKh8oEt/t4QHYSO23BLrMKrZp+c0P3fTf8QbVr+D7O2GVBBdjm7ZQVdI08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6371
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

On Thu, Jan 16, 2025 at 08:45:26AM -0600, Lucas De Marchi wrote:
> On Thu, Jan 16, 2025 at 02:40:03PM +0530, Aradhya Bhatia wrote:
> > Wa_16021333562 and Wa_14016712196 are permanent workarounds that apply
> > to multiple platforms. Wa_16021333562 applies to platforms ranging from
> > TGL (12.00) to Xe_LPM (13.00), while Wa_14016712196 from DG2 (12.55) to
> > Xe_LPG (12.74).
> > 
> > Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_guc_ads.c    | 5 +++++
> > drivers/gpu/drm/xe/xe_ring_ops.c   | 3 +++
> > drivers/gpu/drm/xe/xe_wa_oob.rules | 2 ++
> > 3 files changed, 10 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > index fab259adc380..8ef044ddd682 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > @@ -376,6 +376,11 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
> > 					GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
> > 					&offset, &remain);
> > 
> > +	if (XE_WA(gt, 16021333562))
> > +		guc_waklv_enable_simple(ads,
> > +					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
> > +					&offset, &remain);
> > +
> > 	size = guc_ads_waklv_size(ads) - remain;
> > 	if (!size)
> > 		return;
> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> > index 9f327f27c072..22c226c30df9 100644
> > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > @@ -192,6 +192,9 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
> > 	else if (job->q->class == XE_ENGINE_CLASS_COMPUTE)
> > 		flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
> > 
> > +	if (XE_WA(gt, 14016712196))
> > +		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH, 0, 0);
> > +
> > 	return emit_pipe_control(dw, i, PIPE_CONTROL0_HDC_PIPELINE_FLUSH, flags, 0, 0);
> > }
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > index 40438c3d9b72..536b91cc4d3f 100644
> > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > @@ -42,3 +42,5 @@
> > no_media_l3	MEDIA_VERSION(3000)
> > 14022866841	GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)
> > 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
> > +16021333562	GRAPHICS_VERSION_RANGE(1200, 1300)
> 
> this doesn't match the wa db. I think it should be:
> 
> 16021333562	GRAPHICS_VERSION_RANGE(1200, 1274)
> 		MEDIA_VERSION(1300)
> 
> ... so it doesn´t mach more than it should for the graphics gt and less
> than it should for media gt.
> 
> Matt Roper, any idea why in i915 it's matching less than it should? Is
> it because prior to DG2, the platforms were not officially using GuC?
> There we have:
> 
> 	/* Wa_16021333562 */
> 	if ((GUC_FIRMWARE_VER(guc) >= MAKE_GUC_VER(70, 21, 1)) &&
> 	    (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 74)) ||
> 	     IS_MEDIA_GT_IP_RANGE(gt, IP_VER(13, 0), IP_VER(13, 0)) ||
> 	     IS_DG2(gt->i915)))
> 		guc_waklv_enable_simple(guc, &offset, &remain,
> 					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED);
> 
> or because GuC implements GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED
> only for newer platforms... ?
> 
> Also, why are we not using this graphics range?
> 
> 	IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 55), IP_VER(12, 74))
> 
> From the WA db, 12.60 (aka PVC) is also affected.

I think this is one of the ones that the hardware team added platforms
to one by one and when the code for MTL + DG2 was written the
workaround's status wasn't finalized for PVC (or other platforms) yet.
E.g., checking the internal database, it looks like they finalized the
status of this one on PVC on Sept 20th, whereas the i915 patch was
written four months earlier in May.


Matt

> 
> Lucas De Marchi
> 
> > +14016712196	GRAPHICS_VERSION_RANGE(1255, 1274)
> > -- 
> > 2.34.1
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
