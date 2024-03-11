Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71084C5475B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 16:49:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136CE10FD82;
	Mon, 11 Mar 2024 16:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VVr0Y8HT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C9D10FD82
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 16:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710175788; x=1741711788;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=W00uCHKmj/V8cU4DIAtq6UfT4UDnETDca4VxjBLTTdk=;
 b=VVr0Y8HTP/y81x+cAb9wW7Wzdyc9XEPCzjOxoa1Ds9MQHs9eODXCF0lY
 IEwZuUvxuxdeYGT72DbA1xk+pXCIhcfHAMbYWX1gcH0vPRAHzd6aPvkYV
 N64OacGa6b9HGkpF8CTlqBYsRG3VzZzndMzw1QM+qTYZXU+8rJcUW2V96
 LLsbl1Hc161jQzIKDOAc14hSzQdmg2SlCp2PYXB0togDKe44gEtpExktD
 mzYMPypVBgXiH6Bm+RSOnAJaYJJ7bhE51YXTi8TCkf/Q4TD1KyMfnj/Vm
 hkb5wrmkDxR2tSASJSf3vsK8lk8cAn9OhCYp9vhIvE+Iko6nuKJGD+9yK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="15413687"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="15413687"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 09:49:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="11116566"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 09:49:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 09:49:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 09:49:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 09:49:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 09:49:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gySQpM3hXDpciFa3C5eIPMd38AvWUiZBxR/+JmtzhQQk+3s2SNgN3Aa9Y/qiaZzwSRuwikQWKOlv4uR+Gd+ObJAiHfU3AulXhmdmp10AZlN46XjMiOqwlJ0ZjS6olWG+ov/IZl45DPUL0/J/2OQtJnb1cguvew/YNxi6qHKUHRoXuTTi5T+iccUE3aS6tuhtrB3HTxVMWIjrrc0u1rPD/pZt0NVk+uFeh7YvnLv7z6/unZ/GgnxwWwDW0Fx/VBbrV4nHL9OcCSYBGNX9l0RhvJLH2UhFgoq/lIpH4b8iTn7ocH9dxFkQmhfGIqDvoYRo61T5FVQZ3uU4yMqlrCB5XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jK9reqidqNJNcueWoRt4bobu3kNlqNz16KnddvNwcE=;
 b=T0Fi1eBSii6iEQzWJ1hZ+tFywsD6AdcpLGiDdrcH5CgSd5chByz0MnS3dcvSUfMBbeEbU5nHht48jZaKhtW+INv1croc6JlqrX543jCusxepU1R3J3H65yqsHHVyfFu1aVARvkxbREp+x9xCsslZGudmFJLe1XrEXC9xJnWdGMVOBFEEQWqdtNtPI+iYpNwmi5FsAxgy1jp0QQmqOg8M6n2eNFOeU9HxXTdmMn4Z+yKvg4lYYj52vShn368HWq1mVaoP69xPBJdTDHH7vVkckIirrtpXWq6GQ3lG4XbACqxOhiwkHfQOvAt6Z7cAEm5Isj7dNKz8AWA0l9rKDWD+nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB7991.namprd11.prod.outlook.com (2603:10b6:510:25a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.14; Mon, 11 Mar
 2024 16:49:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 16:49:43 +0000
Date: Mon, 11 Mar 2024 12:49:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Remove unused xe_bo->props struct
Message-ID: <Ze82JHUo52CQp5Qc@intel.com>
References: <20240311151159.10036-1-nirmoy.das@intel.com>
 <Ze8yWTmHYScFSpax@intel.com>
 <5h56xqyuxiyspqklvqt4zzo23hgaqbevi6wt2bqimw7hnlfdlu@yyi7wlzmctxo>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5h56xqyuxiyspqklvqt4zzo23hgaqbevi6wt2bqimw7hnlfdlu@yyi7wlzmctxo>
X-ClientProxiedBy: BY3PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:a03:217::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: dfe6ebef-dfeb-437f-1f3b-08dc41eb4094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zqtUgm/HhNjVWdAbgGSJfidTaOrkvJ13z1xOVUPr5M9gjnqpDg4U9Aiw/nI1xUQjbkne+hCaLDFm+H5MW6QXXNU9kJtvsMI57h9V699uOZ6CzCDPGi9LE+tTvKG1n+qkWz7Cfi2The2TaAUECa50YAz8LT1nrQAtDH5nd80Y46pQK1a30bEROSRpVQ64q/U0bp16U5jrDps01j11jYy7PdzA95G1TVf3Yr120oJDcLnb/mGgW/ufgjlkTL/I929rkh7B6Bvbpgq0lKx0LUHHoFNycZjRXa9ORDwMZ9pqFRMgFKlFsL+E7sprlfn3zhPm6j1bBHA0hSirv7/1NbxUBChHTD13bHk8y9nxNxourpxc+LZAQH4t3fLq0L6aByyQuDSGJbA/KeawSgBxfpEnA77tkixlFPO3vwQbxgZW82pDOCrBjDniA1m2RVpbwmNNW3mD4Sd148AFr2uIUsIDJY1FYLEVfgyKhq3oxR88m2GitxQCs6FaaaTeVwiwksOnHahYNCTfdggAXTdjqsMrlcKQ0Wnh4ji+b+a9whn4uoEm133tkv3K65Jw5HhQ5TTzcDGXjiBHlk/wyNQ3ASlngLni8KyD99dAloiBU6sH+qH6fWyc3IHpNS9sWRj0CbyconMUhhqY7bdqgmCmNiGKwgMvh9dh/OGcHiY1pxZWl7Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zwd4ZBZh//sHVIFlkiJ0p76ttoJ4oRoHl6D1xVuKUxkTzYZMeLhkXXRJAt?=
 =?iso-8859-1?Q?0tLwXyqkOUx6J1GtODY9CvxtqgQoLuoD4m8IK62DQELxlITzgWSMGIXOGc?=
 =?iso-8859-1?Q?u/Kd4R5C/smequwA/JtymNaLYU9VNie9dmUrK83vcgO5EtVd51cn9+kz35?=
 =?iso-8859-1?Q?a2JCjmLIBFz4s1eQ5NBl/Nu6DYf7ksQbBwHPFnmh31yr8MzG+bjcS/RpHj?=
 =?iso-8859-1?Q?G+Ljwf28PevUJoDGQLOesxZFr1OFCLYJVIr8GEhTTwyiD7JyOHc2cKM/T8?=
 =?iso-8859-1?Q?mFGrIvZhdfZgq52d9b5ZMsslpFdBagemgnG+Hl9s6CH1rEaH+O5pj3xvXR?=
 =?iso-8859-1?Q?DNmUuvYN9YqdYJkS0/A1bRfRu7SzoQ3aqSiOQZMvcgUnI/Uet4YQsI3hbh?=
 =?iso-8859-1?Q?BAVmbCeLrtzrNh1PX5M2GKSdWgnAXyBAWXd0b+e64oAHhYoW7VClck6TJk?=
 =?iso-8859-1?Q?yfem6RwyF+ReLE+mUezIQGPyQttsATY4s98JAJ+YlF8nRi13LUxHRAcUG6?=
 =?iso-8859-1?Q?40zb9bFTkkZMgATmKlvqw95TuAEy80rUKg1sqPfSJ8SD0ZglYoc/oPwYTs?=
 =?iso-8859-1?Q?D+qZraspiO6I7T3M4CnjLLRurSUDJujRuKXDrUKicLWGbg5ySePEl8Gxbn?=
 =?iso-8859-1?Q?d6MwQjIg+ok2LFmZqySuKZ5y1XPF3kk4/kGl5ThxlcVA0/gDptaEombkVS?=
 =?iso-8859-1?Q?htctLaP+0z2s9l2Jy7MYOD9e6FA0C5ukgtLNIpWeiTmDHh2QuaxZPFmJeA?=
 =?iso-8859-1?Q?8BIevh+8sYTPIpEK0ccKxuchmcLE5Elr3EpJhpT5X3g4xvhD2448kZ2Pl2?=
 =?iso-8859-1?Q?6ZxpjXOWHxl9r7QjRhXNHaWxtQrhB7qNQ2ygBKzYIogzRREOdh1MMLVCCE?=
 =?iso-8859-1?Q?baLmsHsqp3yun20dswEfiUuBzkIxEkJYX9beCLSwmfxA4D6I0zf/PdcXiB?=
 =?iso-8859-1?Q?G44jRARJpwHoQA55eX3VnxLFS6OKA70EUVXuzu2kCRZT+en5T8qtQMsG+Y?=
 =?iso-8859-1?Q?JFQjL5JKVnlLNz1DjQ1XwYu3iwh7cGAFmgctzZuW9HDAOLpagQB57iqGAP?=
 =?iso-8859-1?Q?ISSP5b0562T1CajTWKRwPu5LnWXJmvIo9aaLGzYgSpH4IkMpkhWJiC8VLV?=
 =?iso-8859-1?Q?dGGn+nqA587nMI23tb/2fTLhy1mXmkETuz1MlITa1moki/AtxnrhZ5+klk?=
 =?iso-8859-1?Q?tYAx/eb1kDghhGQM+Bapzk66YDM8S2svO6nUGutJKuA37nlCzsYX0R5Tvm?=
 =?iso-8859-1?Q?YG3WthC4ZvhbeLWIAtMhFlX4uIuywtB73NgWebUPXdRodqZRFec30XRtF6?=
 =?iso-8859-1?Q?WksQvakahj7CPpghwLqZ0ITHwuClN7NUC7VXvBUATPE++t8+SofgwJZgLT?=
 =?iso-8859-1?Q?OLM8smPRU7PWakwEZumhR/QXjaT+RKZXWGriMuT9SOZ7GJZ4cPjAEIx+UI?=
 =?iso-8859-1?Q?Wu6jiTtIzkLlaA3hNnhFjl2BGlqoMuJTJV5SRSj9M38UaKV88xaJTSJnZF?=
 =?iso-8859-1?Q?0ezfoFY6guIosRJmjOSOI9GOIeNNEsl0HyUpD5YweeoWEHzIIVNWyRmQIt?=
 =?iso-8859-1?Q?Mq6yEDTAFskfxy8Wo+Z/rn4x4h60+VFxOmHPd+cdbdJcYWwqttdot5kfoo?=
 =?iso-8859-1?Q?SqSr69Sr8vlFd6SV7iL4axKdgltyTg5QenylKcMsG7g1OKJlwmkickPQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe6ebef-dfeb-437f-1f3b-08dc41eb4094
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 16:49:43.8404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nn/Wk7eTInMa5O4W0ExoTrEzfjT1DbOzwK9bnHsfdxv3dgjqthJtUoWBJn06B83piQgKjdKykUr/A8LCepqL6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7991
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

On Mon, Mar 11, 2024 at 11:43:54AM -0500, Lucas De Marchi wrote:
> On Mon, Mar 11, 2024 at 12:33:29PM -0400, Rodrigo Vivi wrote:
> > On Mon, Mar 11, 2024 at 04:11:59PM +0100, Nirmoy Das wrote:
> > > Property struct is not being used so remove it and related dead code.
> > > 
> > > Fixes: ddfa2d6a846a ("drm/xe/uapi: Kill VM_MADVISE IOCTL")
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> > > Cc: intel-xe@lists.freedesktop.org
> > > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> afaics this is only removing dead code since it was not possible to set
> those props. I'm wondering if we should really keep the Fixes since
> technically we don't need this in 6.8 or 6.9. Thoughts?

good point.
Fixes tag can be avoided here.
And perhaps just cheery-pick later to fixes if some future patch
conflict with this.

But also if we are in later states of -fixes flow we can drop
the patch itself when we are cherry-picking the fixes.

and if we are in earlier stages of the fixes there's no problem
on sending a clean up up.

Up to you there.

> 
> Lucas De Marchi
