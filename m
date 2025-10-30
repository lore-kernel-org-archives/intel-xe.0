Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE80BCCF9E3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 14:55:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A022D10E9CF;
	Thu, 30 Oct 2025 14:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B20dMFd6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B772E10E9CF
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 14:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761836137; x=1793372137;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kiZ5s03+yaB+gMw3FFJMzS+GtbYIrrVhgZFKUXXZJPs=;
 b=B20dMFd6QW8FsPj9HURJv4tNptuJKbAfV6KFHlCGu3pHLyqK3Yh6NmJ4
 uIIJRY0SmB3W/BSckviqCRdM1yfg0aqGl9TfkKwvnXiR//QsUNDvYfvw1
 YEQvoxMrgNN+0PmSpDewOU7qK3i7eIcCamaWHTnY4IEgtDsO5ce0G7uIH
 QZDLuzQbCGjbooN9TJcau2lyrmzn3rtoTdFpeEBFohNBX5eDqAOVqnxSm
 As7f3Tri49q3jpRdfJLyn93FqKVsmOycoCm8HX71o+4Dtx8SRKxV7XnzC
 bXkwUuT22wWit92n4dekXkN2nBTO6qWPppgNTjk5QEwBT7b5DuKMNhSp8 g==;
X-CSE-ConnectionGUID: JWpFdLt2RAasUb//w6tCCQ==
X-CSE-MsgGUID: MNVV81OYSzOGPtt9AH++AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75430109"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="75430109"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 07:55:37 -0700
X-CSE-ConnectionGUID: iF1Q9xQrSVmREOumMkcDMg==
X-CSE-MsgGUID: huVGx66nQGCbKSkcp8rJEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185855267"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 07:55:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 07:55:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 07:55:35 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.48)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 07:55:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwvB6s5pbJCGrlkGbncfwK4IvvS2Ht9OucK6mLoGzOHJDRCfKBxXtEoIxpR32jf4T+LcuCAsKHnoNXUVw8CHREqnPiDbJXQ304k/fGZ32Gtw6Y64vR+NGmVitlK+qUOMcSaVOiUMg5DVLSEMBm5lHV63T5eER0A4DqtCFB9f4fKncJCvMXpBpqWhyfiEupZGov4pnCOrEsWybAFipyOcCHZ9dKgjBzgWd6N3xfLpsBTm33CnwGAk0LvfQFvsdTuhkIq5d+mZ4jQCWhCgBs6+9wkf6yTQIA/busHQdlNL6xPaSAu6YQd4QsrU4fNAO5udJHWx27PBJVAMl+XpijReUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ti8HLkIJMa0bLsZzYdHJXMZpSHrgE7blTaYgRpABvHw=;
 b=FUz06tgcGhR6nTyfigctZsV/Yudid0OELRLLc34JY18Rpzj3gPVOzcQDHcxpNSBBhGEFYLd0TI2xCx8fs0neIzkdQWSSgimVwzIaPgixb6qmJ8UuK7r8jlB3ZQJWPYBGf93VrhsbQgBjGFQQoTnfP4oQUZ4+90xE09tgg+ju4H06NAXQSx/uvY0NOhsaUd0hvf+yLIcROl9sbz01J1tgHoKdHJp6EyqX0QiV3yXVyYEXO+WIe+HOVs0KR+RjLzqm5lqDpHRTZZm5XtwgE3E9NftGG+WqsUFKCLybN4OAw3vAgIdtdizG8zZKs/6e3bEpTrJBYfPm3ETp3y1V/MIuiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV3PR11MB8529.namprd11.prod.outlook.com (2603:10b6:408:1b3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 14:55:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 14:55:33 +0000
Date: Thu, 30 Oct 2025 09:55:30 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3 8/8] drm/xe/gt_throttle: Avoid TOCTOU when monitoring
 reasons
Message-ID: <jnuis4h4uq7he4yq52rsb7ee6jffgclyf4skvftu3m3gsnk7xy@vhtbsgchkvyx>
References: <20251029-gt-throttle-cri-v3-0-d1f5abbb8114@intel.com>
 <20251029-gt-throttle-cri-v3-8-d1f5abbb8114@intel.com>
 <aQM1oKHBh0GvQQK5@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aQM1oKHBh0GvQQK5@black.igk.intel.com>
X-ClientProxiedBy: BY3PR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV3PR11MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: 29e24a9c-a1be-4c15-3555-08de17c4602f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2J4iJO3E8drcdXM7iqpLlHsdie3OkVmo2LGT0HeZFt61WXBUdFM5MPv6gP1e?=
 =?us-ascii?Q?MKdUDBBfkJeOw1ZiZiTSFZTsN0+Pt4pDe0TDpP+DsYnEIj59fvb9nnh89pCj?=
 =?us-ascii?Q?Fuy7UPs9lXOZmvqer/7K3WhPV8gAgUC6BsLdmNO6FmDXPuRSVWH7eDDOJNQh?=
 =?us-ascii?Q?fADmolPckqEgYsjN2tOYZdQRkF+ZBlU9Zw1COlTe7SHRlHjZjZ1FooKSMfLk?=
 =?us-ascii?Q?TvlGp2LOa3dnnLJNh3xqfMna+2+zC0sAJ+Eyhxt7GFJzK54MHUzLJq9zmMer?=
 =?us-ascii?Q?Kypww7WsU3wubku36epqG0JAEMOTW/GRXC2Bwn1LmSiaHZzke8spDnV6vkC/?=
 =?us-ascii?Q?vYYxtw9pSSGmYfFR968k8Wt3C7mt+WCqm27pd+ijRuk8/QkQqKdxU6IwezVC?=
 =?us-ascii?Q?fdKNJzXxjfoggGTUvJtp9eej2ImTNX4/ytWPOYg86+wuq0jXoEQoOV8YaaP3?=
 =?us-ascii?Q?q2c02h+1YH3iexh9S8hWZkQhOdEQwhDwO4Ie3e2z8l43e0R5npl0qm8/l7Ak?=
 =?us-ascii?Q?XRnBwVxB5UI+8ooWVOmY6851uUN/2KPz4svMc9XQVIOFoRFOpg+2TC4An6Gf?=
 =?us-ascii?Q?mEDg1aA/4UiANvi68CUg3T8Q8636XDImd9l9Bhlmh/TVRg9GZ/YYonVOa3e7?=
 =?us-ascii?Q?908APYYfRCRB+Fr1HTrgUDZymcVeHGfYWdJDMsKFsG3mhA4NZk7julIztjHF?=
 =?us-ascii?Q?oKgYK8NT5N8fB/qGqKTYN55aaUKIN9rkpJz03BrkWDzf9Xak0l3Sf/Qsi+wD?=
 =?us-ascii?Q?whwOn8IB0sI5SAjUNSniZDyqBlXvoBfS7zPvOG4Ylijpz3mnUCB0/d7oN8cG?=
 =?us-ascii?Q?cE8e4J2zSRuzaEDE8tnFbFv3d3kHhqYSqWKXIGQw4NsO11Pi1sTzcmIzp/QL?=
 =?us-ascii?Q?TyJrxu7CmVUVfxjpEiR3FCBEdSBedt3+ENhFvf3F84AImEffk9ZnZpEJ5z6a?=
 =?us-ascii?Q?NJT0jPVA2JMj8ArkS2Lm2aa1H8wvckfLnQRtdUKFlnUHuNED/WtkU4DDDdOr?=
 =?us-ascii?Q?5+EYs3R86EX6llGus6k6i54YL2vqPFQgND5G3M2zLuSvY4POC7ARPtmTG2Vu?=
 =?us-ascii?Q?VTHg0QsQc2j2W8BwVPWgodjzKOIcnsOPy80mtRTTky5DYaiNB9mnJP6ILKjA?=
 =?us-ascii?Q?+vkxroFz3tpAcJGiNs/BB0DF6/2nIr4hMhGelRhzTONXxj8cEiAfLg2LD27E?=
 =?us-ascii?Q?qJ33pybiQapj8gDORUTlte7FQQlq3+KkCd4UGYmO/cGKJINT7sz34pLC6hso?=
 =?us-ascii?Q?iUZ22dEzeTQFcURSlRFYiAMmoPLdGy/ft7S/DjJGvfeHIpfXMZVtBgJxIzZw?=
 =?us-ascii?Q?QxsIVhfMvX+Z2Sa09VB6uxL72MrIc4lhiKTs7eVoMwc3IuS0mDBJ9QvcPwaz?=
 =?us-ascii?Q?4KsQPRhD2ya/fTkvWEDb/S1sI+W96ilCf5AWLLETyOznBz0HRCFec9x7PQD7?=
 =?us-ascii?Q?M0W7cCO2SKdA+1ZzG6XRbkpP1wxwa3cL/bz/1osFQiaYLlrdFl4l03SIsAL6?=
 =?us-ascii?Q?o3Grjb9tvSnPMSMpeSnlsBudHRcf/fB2VMn7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/HNS0LcCVZ2ac7qC7/gE4YPC60gU55GmWFoU1CT5zJjqmXAs0fy5xhn8a/ys?=
 =?us-ascii?Q?XFSR1iH/P3Nx2FEUuu25kkaATYqctRT2jJ+eKBEjloh1D+CEvEu2uh/9WaDh?=
 =?us-ascii?Q?BO8xODu2X/r9t/p5Xn0zhc0iSDT7QQWhe7g6B1JEQxp+Jt5OIYaWpWxik2Tc?=
 =?us-ascii?Q?GhQo2wZaveTGCd8+WrL7hN+CYnPhByrwSc3nLItsNrDPqRL6z+8EU2F2VaEt?=
 =?us-ascii?Q?tw8vb7jkpPaSAK1/AO4hBM1TSu9yg2dKtJvAScqM8CDA7xvTay8EAzi9Kg0e?=
 =?us-ascii?Q?HnyKMjoh07obTjn9f+x+lfdPfQcERlaNIWzF6FB7LodiUilPGhDdertBesac?=
 =?us-ascii?Q?5kM8JyVQXUXGuM7/qjmgSeK2TXI/zWaOIIB0yVmhDCX86+2mCt37Mg666PhZ?=
 =?us-ascii?Q?/VMHJg6D0SB40Pni3SWwCR3/DVQABmAYe8ciFJcv6P+LIpoXKbqKb51R16Tt?=
 =?us-ascii?Q?nVv7Amh5UGpNXevPvSeaAAzb7LdwF5v5TAsBKTyAf3ryYellsQUc2VXQfDxW?=
 =?us-ascii?Q?42HAm0FWxu47UEWuPNanWA3TfB+IsZ9h0KkxVylF85eGmK1Y26yr+gQbueLY?=
 =?us-ascii?Q?5luoYogn41smUZxx7ZDKCuRk2I+apCUtzdG+TKViTLl9Ri5H68MCV4Rg90dM?=
 =?us-ascii?Q?UlGWQZpfLaQa5p13abnr8FIsfBp0wBqaIRhrrpYyGLsiCY5MWQ8lpMm0MZDX?=
 =?us-ascii?Q?ziFCrzy+ndCthLVS1AXJt6BgTz5Bxgttc4PiOuvQcYu3O5ygSO/khwPV8+xE?=
 =?us-ascii?Q?pf0xWs0/m7MEkCH1JAaCdps5FGdi+qRwpOrQb2hESfav5jaWC+shA5PHUobE?=
 =?us-ascii?Q?I1+BCByyeYrDLfUAjjoNbR0XEuhR+shF9QUzNpsj2r3OlDd6oHjBHf3OZLmL?=
 =?us-ascii?Q?4Dz6q5xEGitfky9Vxe6sSDvS6ulgrqtwfJeOfEuCeSoulDK7lBuFYi4Q7drK?=
 =?us-ascii?Q?9BPJzlZQW5UOK/T0Cf8IwsN0D/JRrVykrkMdsxPLINmJpRJCt2HSLyZTawUL?=
 =?us-ascii?Q?OXrPI5Pb6O4K0ho4R4oBJSgn0yrv3eng1458o+9klHi7vwGe35JYZELfWn1O?=
 =?us-ascii?Q?jaIm0jmWnWZ6rqM5jfOIxb5bLnv4wnGXz4+V6lRtDdwnjULvAiTUaduM/0hB?=
 =?us-ascii?Q?xAT5kC1VreDhUgPgrd/c4Cr8pa5Asw+G9vcDwyv7MGz1k50G+0LNFXsuoiEL?=
 =?us-ascii?Q?4l8LVwbigAoulTHIaLSxpVs/hPR0qKzYP9omRXS5+byhUxz6PIvYj2g6ukWN?=
 =?us-ascii?Q?jOEcVV5Z9lq4l0/McCLiBZg9Vu2npo2ve/i+JwiHFSh/Ev/GJmeAEFgVVs4h?=
 =?us-ascii?Q?gmryJFNeBN4vNrMVqiT0ltMpgID3snQvDzVjUO/GvfhVdLpV/lNop9MNY+kz?=
 =?us-ascii?Q?IQADZdcRYLXB6gNh9IF0b8NPZSOxwxnRS8x4eP4nTh/pC227vBQS976/sdhB?=
 =?us-ascii?Q?Jg9QBXo68/dxwEzHiaRZhCShS4zL6z5CZoxkC7kXxeerWXPaHKSag4JF1knf?=
 =?us-ascii?Q?rSSz43bIRAfIKJALjT/qof+CVLk230GTQxf7gr/POGAtAjQSYrESys1R24hG?=
 =?us-ascii?Q?6BpbF3lDSeezUIbM+IhhSRmT3lBdeKMUuD/aCgfcjHtFG5EBNw7QJ7DTuJIV?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e24a9c-a1be-4c15-3555-08de17c4602f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 14:55:33.1221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QjoU2Xvy1yJHAsVsV4tgBZjQDIbNCKmYlSQJzIJDkiLMdGqJcMZH4TbP2449qw36YaYPX5jr6XERleeLFpHfRnOAJKEQRuSid+UyqB+egyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8529
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

On Thu, Oct 30, 2025 at 10:53:36AM +0100, Raag Jadav wrote:
>On Wed, Oct 29, 2025 at 04:45:10PM -0700, Lucas De Marchi wrote:
>> It's currently not possible to safely monitor if there's throttling
>> happening and what are the reasons. The approach of reading the status
>> and then reading the reasons is not reliable as by the time sysadmin
>> reads the reason, the throttling could not be happening anymore.
>>
>> Previous tentative to fix that[1] was breaking the ABI and potentially
>> sysadmin's scripts. This takes a different approach of adding and
>> documenting the additional attribute. It's still valuable, though
>> redundant, to provide the simpler 0/1 interface.
>>
>> In order to avoid userspace knowledge on the bitmask meaning and to be
>> able to maintain the kernel side in sync with possible changes in
>> future, just walk the attribute group and check what are the masks that
>> match the value read.
>>
>> [1] https://lore.kernel.org/intel-xe/20241025092238.167042-1-raag.jadav@intel.com/
>
>...
>
>> +static const struct attribute_group *get_platform_throttle_group(struct xe_device *xe);
>> +
>> +static ssize_t status_reasons_show(struct kobject *kobj,
>> +				   struct kobj_attribute *attr, char *buff)
>> +{
>> +	struct xe_gt *gt = throttle_to_gt(kobj);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	const struct attribute_group *group;
>> +	struct attribute **pother;
>> +	ssize_t ret = 0;
>> +	u32 reasons;
>> +
>> +	reasons = xe_gt_throttle_get_limit_reasons(gt);
>> +	group = get_platform_throttle_group(xe);
>> +
>> +	for (pother = group->attrs; *pother; pother++) {
>> +		struct kobj_attribute *kattr = container_of(*pother, struct kobj_attribute, attr);
>> +		struct throttle_attribute *other_ta = kobj_attribute_to_throttle(kattr);
>> +
>> +		if (other_ta->mask != U32_MAX && reasons & other_ta->mask)
>> +			ret += sysfs_emit_at(buff, ret, "%s ", (*pother)->name);
>
>Much better.
>
>> +	}
>> +
>> +	/* Drop extra space from last iteration above */
>> +	if (ret)
>> +		ret--;
>> +
>> +	ret += sysfs_emit_at(buff, ret, "\n");
>
>I went through the documentation again and I couldn't find any rules
>related to empty files or whether it is allowed (just thinking out
>loud about no throttling cases).

do you mean if "empty" files are allowed in sysfs? I don't think there's
any problem with that. It's also not empty, it has a newline there ;)

Lucas De Marchi

>
>Thoughts?
>
>Raag
