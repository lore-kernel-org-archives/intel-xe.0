Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8959FC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 19:05:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E2210F7DC;
	Wed, 17 Apr 2024 19:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IcPgX1Rk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2BF10F7DC
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 19:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713380747; x=1744916747;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HQMGGmbxAi3ZqjX8MYsmrBYVlYrChU2X6ZyFSCH/tNo=;
 b=IcPgX1Rk4zVs+3PqubU6sOvsVBfmSLq7kFGG3gWUPb9ZWRo+ob6oWthC
 c6Yx+4eynTUemHdy4huDNa/mQh9WjrWBU95IZFTMeI8Y3z1stp4VJsruY
 7IWei3Sl9R8QZmR2ehqVVXZ+omxbEneSr7fF4Zn1toVXAa4Oc7CtpJILR
 gfUoyhzl81rqXnKvU2UVx0nH5jcuHu5J+PlGm1W8OkoDe9gwU47JBq45o
 mjxhjLJDMFtwPpScp6fjVIHuZsDvEljgxO66Skzu2zfhZJ3V9qilgi5D0
 qZvEUXz8LD270fC1nV4S3w33fJ+Ij2RpuNsJIPVaSnhnPAEpV0Kp8cbDS A==;
X-CSE-ConnectionGUID: SQRw1/azRZuSSmO0vgay4A==
X-CSE-MsgGUID: 2S9kP6SyRVKGrfX7N9ocTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19452077"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="19452077"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 12:05:46 -0700
X-CSE-ConnectionGUID: 2Jz/izjaSNKYTJ70kLkffQ==
X-CSE-MsgGUID: LQ3bpDkkT/uJHDV3WFGGqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="22606606"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 12:05:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 12:05:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 12:05:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 12:05:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 12:05:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HsB6YB+WwbjZC3yMEiw3Rs0mEFVvBTJD6w6++PQeme7K2cH6pe5UttrYI1PxwWrnYq4jKmN/YBykS/0yNXx7goxqRER1XMkCKs2vnlL01zNDFe4J/9oxwSkYxPzTKwuGZWKZIqKu/nwrjycRI4Rrdqkk2Eg8dPgwSnVRsg7TqGrXYTLP9LP+f9WVwib91WsjBWtTV+Spa6ECFuv0pn35+uY7o2nuT6JMbIku+7ITsO+xXKccLdaJeFru7O4WWG3xiPxybG1WVR17+8I/hV0iJj6T8ZleA/7htu6sOo+/g5atiQRVE+TTY2jgf6TwHGjxgwUMBC3DCK6ht27FFc5mHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=454QykvoQhtL1SCfFeIZZx5hUCp+H0BsepB2AApC0VI=;
 b=H5aYrJxFTbSwgFRBMeSYk7MUrVRKcqXsaxspMyPI25d4sTdFAuYAXQvOvOnaIa1J1p6IC5g6nfHTebtpdg0l4maQ+KJT5NA/Yn3ckl/tlK1hW4kyOCQRgyxJLX7GAZ8RJF9fsaKsb2MTEqUoVB+xifm4nTvWvtjNAn+gweO0yJeJIqr8Wf71bQug2zePZqhVWt5G+7rQJAlJJdk/dQ3mbvyjVPGWcN7+lBrHMB2ywKB2CosqFkqafcDO2GPdgVCPN1Uhr4YtbT1jlnkywKHomS8ssd/4p2aa3DxPXhC01d525nuNq5Wn8IJ8Gdga45cKc50MLRxqSxaK3L9iufuX7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Wed, 17 Apr
 2024 19:05:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7472.025; Wed, 17 Apr 2024
 19:05:42 +0000
Date: Wed, 17 Apr 2024 14:05:40 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 0/7] drm/xe: Per client usage
Message-ID: <fzl42hvf67tb7373gcpovcjjcufs3ba6jajmpt676uymsat4qs@qolxcmhfh6mz>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
 <f2c46934-e137-419d-ba34-cff864a988ce@ursulin.net>
 <zj3ccdsxwfv7yms67c2fycjfhevdzp3qy7yz6u6ffmv4aymo6n@5lu4otfylkbt>
 <foccqtfvgz65tg6yoar5tsqjo4bndmftgwlsm3vujjjdin2wts@7cc3m4fcapyb>
 <6490842a-65b3-4b84-9a8a-ebc9f7b9ac07@ursulin.net>
 <thplv5pk26br3tou6if2otdoq6owb5lmdhfzi3wcboni4vyeos@sqiu7zpgmgrf>
 <8e2af1d5-5d22-47d5-8cee-f8bd1e54c0ed@ursulin.net>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e2af1d5-5d22-47d5-8cee-f8bd1e54c0ed@ursulin.net>
X-ClientProxiedBy: SJ0PR03CA0371.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8182:EE_
X-MS-Office365-Filtering-Correlation-Id: 73eaac9a-143f-440e-f0fd-08dc5f1160f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tfolpL0DyTOjtyT+/flv3FJyg7nHRLHeMd3/ql4nIlalF+/tNnNjUZCv/OSWMZTEE3OCb/H5lz8KHJ1ZNaCs8NDiST9gPSFOGnEgWusZmf0TqcHWLeixmFWB8AHtvZK0ROSEOC1hnA80NoX922ISMBf3QPelAvdOSxzCN10K96oinP6app2vAYBtm8pgqgzBX+7gdBI7Io83awWm3wzngaiMxDL1bXhF4CznAoadSvoYURIxA9skS3//OSYAjqeK9nn3opH45NWgMfQ7MmGHtKASJPBZUAAVqoC3WjghpcVxqs831B81wDnbv/7MWCpgFQv3bw1T1/40MWBZ1WRQuQB7IzF0EM0cFF3p/+RijnltEDRmP3fLKUTR0cNXbDpf1DBNV4O9V1oQ+eDmUzyDdOiT2hbSyQ0t+7n1KHZghGVih2EBO3x6tUHFzEKPG64xsnQOU+PjWSUtYzOhfgYNogrzv9IEioSY118+jvaJ1Pw2izgvwfcHPF5hGlzhL3MQGVHLXpaEJjA2apeZ4tUpr/BvQgO2VFzdje35vxnqdZ6hOowMY5a1Axtm7oghet9WO/NcO/M29n8bkbZDXzaCwd3zWuE8RniV8ybFsiHktBSYBflPGp/tGXG65wBV6HEdUyzAntb7xNGIdgbSsEO3dHFV5aDxw6kPvJarNJj7DcM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3mtsvkvfJ4I1Bq8/N9lz6R8Lvf+yhtWI98aFSUSROz6qS4PWSfzb3k4qcx?=
 =?iso-8859-1?Q?s+GRK3qU0xh2Ka5TGB7N3JsEirUBSWTFp9J+WtbzU/yvm9BmibNZNS2Zwa?=
 =?iso-8859-1?Q?rDGUtGlRRwa/JheULYQnsUJx/lL39+tpR8WwKxVxPlzUz6BHdEdSYuH7Bn?=
 =?iso-8859-1?Q?QcQ46z+e3AvAvJJpk7UnZ/eEI5gWOlnsaR3erqaNqHZZwOJ78yyLA48OEE?=
 =?iso-8859-1?Q?u2+vr0XbiyVeBi5Zqa8+SchB6fahnNcaJOw0zygAX3UYHDVYq74cn8vGV2?=
 =?iso-8859-1?Q?u8VVXYA5vn3uf/qtodiUQZDIHo9d8MFe9091eCDToVCH186pvZg4Z4E/ep?=
 =?iso-8859-1?Q?ThqN+knNGgvgpHbz/Zk7ImARCpVBgEZlI6db9rpCABj+Rr7xwhU5IaKoKI?=
 =?iso-8859-1?Q?EmUyid1Cyhwqmuscdv90jbzsAcbJ+3tQBU4JaGAzeQPxtEUHeGi7S6xTUI?=
 =?iso-8859-1?Q?JsNwws70ZSSP411G6kc6/HLK8zsOVj3t0p+uESJIOOgDSmi1jKJHx+ulC3?=
 =?iso-8859-1?Q?Rn5xglrVQ0dgOrf6GdjGhXnTP/1RnncGBirwkxzw6LocuT/ShSS4ckgSJR?=
 =?iso-8859-1?Q?wWIMEu6bW9xXzJ8vkkflHi5HYzKbzf5K1OE2SMdnxL9wnUZkGf0xXbdbl2?=
 =?iso-8859-1?Q?v/Q4nc71hffNkBJdv9t6EDDLJphCmO8kSiIK1YvAhN9KguQCIfYA2NKvD8?=
 =?iso-8859-1?Q?IP61zA/VEsemG20FxFIk66qjw3pAKSxaYe93EDvhufZfPNKs9I0+4eDBeo?=
 =?iso-8859-1?Q?KxMwZOqxmRXhNwQnPgf5tkkSzNc4hWIEu5K0ce8sePL2uINQ9YMyd9gVkn?=
 =?iso-8859-1?Q?0g99npViO1yJlCSuQbsjM8jFfzu3A4Z4/plvK8vJVKYTO5jBhG8t76fIK9?=
 =?iso-8859-1?Q?z5q/vKEmvoURQHJGQbjndXe8HvzM3XklRN972p5wesougOSWJTIUp44boV?=
 =?iso-8859-1?Q?iYEtjrmo1zkL6rO6mjQheT6zjE4NJA5sTGOsBEe/r1uasEelqdk2tkLn/c?=
 =?iso-8859-1?Q?+2vZuqSSti0wdfwll9Q1NtSHZoGPhcJ2Ud1PHIJgl62Yr5nV+m7VpzsQLi?=
 =?iso-8859-1?Q?ePMIThsq/qvUaQOMVPowiopD0R6IwDCsXwZgY0q5hAmy3kSaGxISKCAsby?=
 =?iso-8859-1?Q?HiZ4r/tyi5wCoMadNmkto2BYYpj88X+pK9tXiQNbFc2Qgc9UTKxIvpYd8c?=
 =?iso-8859-1?Q?2cjt2eewMzezmaEjhi133pJ20hnCX+Mr+eVPF4cdffic+0nOtThB2Xrgo6?=
 =?iso-8859-1?Q?ssnxgIbdAp6HBBDjHxSj1i9DkVLOvBa1mfFNdmYUaJjjfgBuoCVLcNvdJX?=
 =?iso-8859-1?Q?ZtdGKCaL5DQSKkTwQK8R6jginr8iw9X6Vav5/qAFKP/bgmwL+UWuBbv2bz?=
 =?iso-8859-1?Q?ivI3E1rRVDtEtpPQ7xfjxJp7B5xme33IlczZjgImK3/zq1mx1NeKlDSRa8?=
 =?iso-8859-1?Q?k0knZCkL2E6v5baQBrrtCGQpKEvxUGx8fLy3RzA0h+nBhmKl08pay9rSRh?=
 =?iso-8859-1?Q?AtVcPmNbgY9Pth0BIv1FHKY94Z3rK67xy1ikmY+IfR+Zw1HroMAwxGp6Ae?=
 =?iso-8859-1?Q?zDly3Am+IGfj/pvfbiehP2STOlKsKu62TNfB+OHQ4cDXuhqxk8IOiQcc32?=
 =?iso-8859-1?Q?pGivi+4snY79ofOsaeBKFP+eKx4gcNog9kJNkxrVCkc9MA5iLtTZ/Azg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73eaac9a-143f-440e-f0fd-08dc5f1160f0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 19:05:42.7268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jrn2mKDudBAmpU6POLTLJmvoe8d2HzYsKFTVpeKK7EErKSx4F0YY+G2gknKsKNYfbjjZe8PTefJ/NkUYxbusYACjel/4PGtOurx4eLwlHuw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8182
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

On Wed, Apr 17, 2024 at 09:51:42AM GMT, Tvrtko Ursulin wrote:
>
>On 16/04/2024 19:29, Lucas De Marchi wrote:
>>On Tue, Apr 16, 2024 at 03:22:21PM +0100, Tvrtko Ursulin wrote:
>>>
>>>On 16/04/2024 14:51, Lucas De Marchi wrote:
>>>>Forgot to Cc Michal, doing now.
>>>>
>>>>Lucas De Marchi
>>>>
>>>>On Tue, Apr 16, 2024 at 08:30:33AM -0500, Lucas De Marchi wrote:
>>>>>On Tue, Apr 16, 2024 at 09:37:44AM +0100, Tvrtko Ursulin wrote:
>>>>>>
>>>>>>On 16/04/2024 04:04, Lucas De Marchi wrote:
>>>>>>>Add per-client usage statistics to xe. This ports xe to 
>>>>>>>use the common
>>>>>>>method in drm to export the usage to userspace per client (where 1
>>>>>>>client == 1 drm fd open).
>>>>>>>
>>>>>>>However insted of using the current format, this creates a 
>>>>>>>new one with
>>>>>>>the unit "ticks". The intention here is not to mix the GPU 
>>>>>>>clock domain
>>>>>>>with the CPU clock. It allows to cover a few more use cases without
>>>>>>>extra complications.
>>>>>>>
>>>>>>>Last patch was a quick implemenation of a gputop-like tool in python.
>>>>>>>I ended doing it to cross check the gputop implementation. I's not
>>>>>>>really meant to be applied here.
>>>>>>>
>>>>>>>I tested this on DG2 and TGL with kmscube (console-only) and vkcube
>>>>>>>(in a gnome session), but it would be good to soak this under more
>>>>>>>tests. The biggest goal for this patch series right now is to get
>>>>>>>consensus on the new UAPI.
>>>>>>>
>>>>>>>TODO: Add documentation on top with the new interface.
>>>>>>
>>>>>>Yeah a drm-usage-stats.rst patch would be nice to have in 
>>>>>>the RFC so one does not have to look into the driver 
>>>>>>implementation to discuss the proposed uapi.
>>>>>>
>>>>>>Nevertheless I understand the proposal is to add this:
>>>>>>
>>>>>>drm-engine-<class>: <GPU_TIMESTAMP> <RUNTIME> ticks
>>>>>
>>>>>yes, the gputop patch was more explicit about this. Should had added in
>>>>>the kernel patch series too.
>>>>>
>>>>>>
>>>>>>That's two values per key. I guess "one key value pair for 
>>>>>>per one line of text" does not get strictly broken and that 
>>>>>>you propose a heuristics in parsing to detect that the 
>>>>>><RUNTIME> cannot be mis-interpreted as the unit?
>>>>>
>>>>>the current format is
>>>>>
>>>>>    drm-engine-<class>: <RUNTIME> ns
>>>>>
>>>>>the "ns" in the end should be parsed by userspace to know
>>>>>what it is about.
>>>
>>>Right.
>>>
>>>>>
>>>>>>
>>>>>>Not sure it is a good idea though. If you instead added a 
>>>>>>new key for the gpu time what would be the downside in your 
>>>>>>view? Like:
>>>>>>
>>>>>>drm-engine-<class>: <uint> ticks
>>>>>>drm-ticks-<class>: <uint>
>>>>>>
>>>>>>Or maybe even obsfuscate/generalise as:
>>>>>>
>>>>>>drm-engine-<class>: <uint> gpu-time
>>>>>>drm-gpu-time-<class>: <uint>
>>>>>
>>>>>I think both work, but I fail to see the advantage. This alternative is
>>>>>slightly heavier on the parsing side since you have to correlate the
>>>>>values from 2 keys, possibly dealing with them appearing in different
>>>>>order. The only possible breakage remains with this alternative: if
>>>>>userspace didn't parse the unit before. I checked nvtop and htop and
>>>>>they were doing the right thing. I sent a fix to igt a few weeks back
>>>>>for it to consider the unit:
>>>>>https://lore.kernel.org/igt-dev/20240405060056.59379-8-lucas.demarchi@intel.com/
>>>
>>>Advantages are that "drm-engine-something: 1234 5678 ticks" isn't 
>>>self-explanatory (intuitively humanly readable) and that it 
>>>doesn't
>>
>>maybe I have a different expectation from procfs. When I do e.g.
>>
>># cat /proc/self/stat
>>3861283 (cat) R 3861233 3861283 3861231 34816 3861283 4194304 90 0 0 
>>0 0 0 0 0 20 0 1 0 1321348797 8560640 384 18446744073709551615 
>>93979016876032 93979016892449 140720658378704 0 0 0 0 0 0 0 0 0 17 
>>51 0 0 0 0 0 93979016907440 93979016908904 93979037196288 
>>140720658380605 140720658380625 140720658380625 140720658382827 0
>>
>>it doesn't seem to me "intuitively humanly readable" was the first
>>concern for people adding files in procfs :)... I'd rather think "machine
>>readable" was more important.
>
>I think you are pushing the argument a bit now :) since IMO we should 
>evaluate drm-usage-stats.rst proposal more in the context of 
>drm-usage-stats and other fdinfo files, rather than the whole of 
>procfs. In other words if there isn't a strong reason to regress this 
>particular file lets not do it.

:) I like pushing arguments if it helps revisit decisions (human vs
machine readable for things in procfs). I'm not
trying to push the 2 counter approaches though. I think other reasons
like discussed below are enough to consider the other keys.

TBH I was reluctant at first to add a separate uapi rather than re-using
drm-engine- without realizing there was already a second one (not
implemented in gputop).

So AFAICS i915 and amdgpu use drm-engine-. msm and panfrost use
drm-cycles + drm-maxfreq.  And none of them seem suitable to xe.

>
>>>diverge from the one value per key plus unit format. Latter we 
>>>would then document clearly.
>>>
>>>Different keys potentially appearing in different order does not 
>>>matter since userspace already has to handle that.
>>>
>>>>>>Potentially could also add a key saying how much wall time 
>>>>>>is one unit of GPU time.
>>>>>
>>>>>I wouldn't add it really as it may not make sense depending on the
>>>>>vendor and or usage. Examples: the gpu time may be different for
>>>>>different engines depending on where they are located (tile/gt). The
>>>>>correlation with CPU time is different when running in VF mode, and may
>>>>>change in runtime depending on the number of VFs. +Michal.
>>>
>>>Yes, that's why I said "potentially", which was supposed to mean 
>>>if and where it makes sense and perhaps adds value.
>>>
>>>>>Also, if the userspace side really wants to know (why would it?)
>>>>>it could be just calculate from 2 samples (possibly repeated a few
>>>>>times as it updates the output).
>>>>>
>>>>>>
>>>>>>Or.. would even the existing drm-cycles, plus abuse of 
>>>>>>drm-maxfreq, work? Ticks == cycles, maxfreq == ticks per 
>>>>>>wall second.
>>>>>
>>>>>I think it'd be up to gpu vendor what clock backs this time. For the
>>>>>current Intel cards, it's the refclock and it doesn't vary the
>>>>>frequency.
>>>
>>>Right, but that doesn't matter. What I was saying is that if you 
>>>exposed ticks in drm-cycles and tick frequency in drm-maxfreq it 
>>>would even work, no? (Assuming support for those two was actually 
>>>in igt_drm_fdinfo/clients/gputop and could be used as fallback to 
>>>time based stats.)
>>
>>oh... I was looking at the output for i915 and missed that we had
>>drm-cycles as currently i915 doesn't use it. It seems to be a similar
>>thing. I agree the drm-maxfreq- is unfortunate and that we don't
>>actually have support for that in gputop.
>>
>>So, instead of the 2 numbers + different unit, I can adapt this to
>>rather use drm-cycles. However for maxfreq, it doesn't seem to be
>>what we need since it doesn't scale for VF. It brings back the cpu clock
>>domain this series is trying to avoid. The difference is that using
>>drm-cycles- and drm-maxfreq- you are expecting the userspace to do
>>(let me know if I interpreted the docs wrong):
>>
>>     s1 = sample()
>>     sleep(period)
>>     s2 = sample()
>>     engine_utilization = ((s2.drm_cycles * s2.drm_max_freq) - 
>>(s1.drm_cycles * s1.drm_max_freq)) / period
>>
>>... considering the drm_max_freq may change from one call to the other.
>>if we simplify it and assume it doesn't change:
>>
>>     engine_utilization = ((s2.drm_cycles - s1.drm_cycles) * 
>>drm_max_freq) / period
>>
>>we'd need different drm_max_freq reported on VF driver that would need
>>to know the number of VFs enabled to scaled it correctly. Maybe this is
>>abusing the "drm-maxfreq" a little bit?
>
>Yes it would be bad if the observed VF GPU clock will be variable 
>since maxfreq is supposed to be static.
>
>So on VFs would reported GPU clock moves by the VF "used" quanta? 

s/used/available/. That's my understanding, yes. Each VF has a quanta
and the gpu clock moves according to that quanta.  Note that as I said,
this is not the case right now (we are just reading RING_TIMESTAMP), but
the intention is to have the UAPI side ready so it's already prepared
for that.

>Where "used" is defined as time given by the GuC, not necessarily used 

s/used/available/ as above

>GPU time. For instance 16ms quanta, VF GPU clock would move by 16ms if 
>the GuC decides not to switch out the idle VF? Or it could move by 
>less than 16ms if it switched it out earlier.

no, afaiu it's 16ms, not less. But the quanta depends on the number of
VFs enabled, which may change in runtime.

I'm not 100% certain and people in Cc may correct me.

>
>>What if we had
>>
>>drm-cycles-<keystr>: <uint>
>>drm-total-cycles-<keystr>: <uint>
>>
>>Then the utilization can be done:
>>
>>     s1 = sample()
>>     sleep(period)
>>     s2 = sample()
>>     engine_utilization = (s2.cycles - s1.cycles) / \
>>                  (s2.total_cycles - s1.total_cycles + 1);
>>
>>Capacity still to be added above, but we'd need to clarify if
>>drm-total-cycles-<keystr> already accounts for it.
>>
>>Here instead of the conversion to cpu clock, I'm expecting to read
>>"total_cycles" from HW and that being different (slower) for VF.
>>AFAICS this is not the case with this current polling implementation
>>since we are simply reading the RING_TIMESTAMP, but there are planned
>>changes to get it from GuC. Umesh/Michal Cc'ed may know better.
>
>I think this works and is clean.
>
>Although I have some doubts about the usefulness on VFs, if the clock 
>movements are at the mercy of the GuC scheduler. Like what does 100% 
>mean for a VF? Maybe it was full quanta, or maybe it was half a quanta 
>if GuC decided to switch it out early, either due going idle or due 
>some other scheduling decision.

in the scenario you described above the quanta could change according to
the scheduler and 100% wouldn't mean much. That's not my understanding.
100% always mean the VF used all the allocated time. I see this line
potentially getting blurred a little bit if the scheduler tries to
maximize the HW usage and distribute quanta unevenly, but I think the
interface already contemplates that.

Another case is the VF not being able to reach 100% because the PF is
submitting high prio work. But I still think the current interface is
sufficient and it's the implementation by GuC/HW that could be improved
(e.g. adapting the gpu time reported).

Michal / Umesh, please chime in if that is not accurate.


Thinking out loud: IFF the execution quanta is available for VF to query
and we are ok with just scaling drm-maxfreq, then maybe we could even
just use the current interface instead of adding a third one. Although
it could be confusing to have a that freq changing.

Lucas De Marchi
