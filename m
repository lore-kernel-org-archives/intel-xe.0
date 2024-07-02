Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E196AC30658
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jul 2024 22:13:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B344810E6AB;
	Tue,  2 Jul 2024 22:13:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QnrBrwrv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619E310E6AB
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jul 2024 22:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719958402; x=1751494402;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=whFcCPu+w7yL8AI2AsR+0/0vCwitMxDiJCk25ADWoCY=;
 b=QnrBrwrvEsEXv5gw+Aac8RikCz1Suh3bERtdByTLzwxw5A1yXh3jmsJd
 gngHdUuO6A8Jv8sdHsexffPGafadlTEaHUiHvx293wvHQ9zvXQBKbT5Br
 Gc7yse+gc1MThO/XU0Gl3UMlYUxoXpMaMkNZosiwYoM0B8IFHrE7aVeoN
 sSjmJDenuRF7CEZ6NdzHBypLwxuIoAA/b1aeeel8nwOWKi8Jd3UDXYKkM
 ujUNnCp6p40I6tIoqzlYk3CKSgFAD/NBOsRFaV/P467atctAI99KoCn1H
 3GW8bcN9SBrgAVfYC3eK2d3SW8BAQDJNjF9LETrrELq7t0Bts46T7Ujgy g==;
X-CSE-ConnectionGUID: w3jT/CwrTKe4/RgSgxcd/g==
X-CSE-MsgGUID: HKWCJaxVRaSeOenIYCrsBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="27838466"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="27838466"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 15:13:22 -0700
X-CSE-ConnectionGUID: 1b2rCBGCSrSMSeOcULTpKA==
X-CSE-MsgGUID: 1ztmby2eSyGEI/UhWO4tPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="45960134"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jul 2024 15:13:21 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 15:13:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 15:13:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 2 Jul 2024 15:13:20 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 2 Jul 2024 15:13:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8ZWedPkUKHSbl4Hpo7cRZgVISI264GA7QJPdd+z1s4l8M8KtkbeeAfea4IjzYgGxXJR4vPaRHUDC9OW5mrIhWGIwbZUWc/Hdxsk1Asv/3ARdLX8I1HTYBvEDyQgT/7GjCIsULwiId8mAqRXXgve2bhh/Fe0aVy64ZAgwlMnEJbxIvifKkkik2Rn/qlLk6VzxsjMZIPmyQDZjDXED+RP9qS1EmGlnB5e/p579aj4QmgDqlIBc02St5Ng4lawNfPz5wy3NmB+pfsHDyrmryVZG7PjpG+wMDPyP7SB7f6xe885NpIE7bHrvLk6DYrjtCW3N/q5nAcbeel98urUioAl1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAHh1izmDA0OBr9gWKyLfQgLj5fckFCq9gSzTQG7kEI=;
 b=KJyzmPdMtz9y9RXdN9yBPfjwVPCv5S25ugFQ4+pPMEPo0CHjNo+ADXMyAWJXFXiV1bqh9yRqgGA4LV40yKs16ncHyjlTgD1/HT6jzKNcPje15/oqUatbNZbxqd5vS5ZhfylOJA27rjcTU3QFv/ICd/W2AzfQJ5PFzN278/AgZCC3yIuuK6LgXSvesCcVevcpqOoOZIldo80353E0zZnNkCB54mG6qeOq6w8RfBefVplBJ2qQpjYb/AGBtZJtZoj6XEbx6U9oy1zun49TmEaul5F+VcC2aXPL090Hgv7FSRu9nCy50wA43135h29B0yvWeUdzt96Qc9Wy29cCC+OLIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB6193.namprd11.prod.outlook.com (2603:10b6:208:3eb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Tue, 2 Jul
 2024 22:13:18 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 22:13:18 +0000
Date: Tue, 2 Jul 2024 15:13:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 0/3] drm/xe: Use VF_CAP_REG for device wmb
Message-ID: <20240702221315.GG2906448@mdroper-desk1.amr.corp.intel.com>
References: <20240702183704.1022-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240702183704.1022-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0184.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB6193:EE_
X-MS-Office365-Filtering-Correlation-Id: ed427ed2-f4ca-48bd-04ef-08dc9ae42d1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?juyiQJ1RWwUXHdRplgMtXYZCn8Huw27jB6H/WkhYWFRpBNhQRZfm7Sy/hV5G?=
 =?us-ascii?Q?45YaV7+bixnKK13+XloCSSS+YVJHXjlKiuThvgd7xd+w6DWvWHedPFIFo2mX?=
 =?us-ascii?Q?qXV4I4591SC8k8IYfN7BuRrq6TYlZE1Rl87l1pkghFlI2DMES77ZpoWIAkwj?=
 =?us-ascii?Q?U/sFK9TQC4yKbY3cFqopazqGPym4WUUErL3dKGXKnPAAOIC4dSMPbQrbl/C+?=
 =?us-ascii?Q?VrhjwKIeyw6QH/yTBAOXVV3FzqpEIsH6nOXv8WVQD+siuyAHDD1PInDCarlf?=
 =?us-ascii?Q?8+Dqax1w9QYbgleEP9NWJBlEEB/hUKy97ZnLQqOZqlRmZVQbp6CYz/Qj/24j?=
 =?us-ascii?Q?p7LFrehTr8WJuiOcrzF9TU7CZldD0DBPGktAWZJs4pIIZIpcEarWvVBPP1k6?=
 =?us-ascii?Q?8D9unCsMjinKqvFXmJlbaSFoBKP0C7RApCtUadWP0HWpD4kPTpy0hvQ4uX4p?=
 =?us-ascii?Q?95kVebJ1Eqye5TIqtfWSNEBTiT65qQJULY7FDPz97qp9I/ZY55aqb74ucMce?=
 =?us-ascii?Q?Ryopp6oHLkxi2OWJVW7XyHhUfx/b22cM4UhDVtwT7Vsh1up+ipUWf7E/jg8u?=
 =?us-ascii?Q?9DftDZR42AYQue0gOrlrrjsqF2/3ivDKtKpxtly4/fbHa6V6r6QmmaJJbAZE?=
 =?us-ascii?Q?nqoyJcnRQePvwhi15X0gkdbbx/BpMfdPc2QMh23nCfya0Xk3z7hd2CjHBCWF?=
 =?us-ascii?Q?rmqCzSekJywyy+D3IUR83b8wpzfQKpoFOahs55i9LO702DeA/wL1ruU3iHxw?=
 =?us-ascii?Q?M/ElHnUHUOFs/6S7idRQjnO0IV1564kvcNZPUK4ksE38YiLurAS99IgtWQ1v?=
 =?us-ascii?Q?mQC++goroCFkODdI315D6ksOxUbMhYLs6UD5wm3+TuVyNUc0kK7wkecJO4ve?=
 =?us-ascii?Q?GqutVmxaHS0Ivq8OaTJ4C9+FwEuDNuD9Ya/hULwBnL5Fw6ktYGI+d/ndGy4z?=
 =?us-ascii?Q?1BxkhGFG7foz85OtvsGsZsSbZeBXUJLGQh73DYDYQT1ynJWKrCp5aecqCCQ/?=
 =?us-ascii?Q?prrjj1juhN9p9KcNodEpvamqJi/cXsRHuyiLmK7rnxP/h5NMDgZRvWF4Hu5I?=
 =?us-ascii?Q?xfq6+VLxnumOSjHZwfdrgL/1CPVD2Oi+VwIxX+o7KshWsA9PzSTLV4gbFRXZ?=
 =?us-ascii?Q?V037H8ZEDJyFLdntY3FtneGz3ofOpeIMBk0UJo3P4PUs9eJ+3DKxN8AXwvlC?=
 =?us-ascii?Q?+i5QHVE12g3ECl7wqKs8bIJhIz7Fd3dQYTEpF47y+yhWcmtnoC3WeYh2wY4k?=
 =?us-ascii?Q?RB8Mm1Cqauu6DpbIx1uJ/gsC+3YYF+fv4wWQ0U64+IJI0D9GoIRMHbGDFC3C?=
 =?us-ascii?Q?DenalQUCks5OrbXUVDg6Uh4lpDQ11GUx+O8wQbxW0+C22w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w0o5h4R4L19ascClL0knMr4LqKOsHdAIchxJ9rnYZmOuGCrkg6azsBDoKUUi?=
 =?us-ascii?Q?d4JKdNvBDM5Z/8aRP+gXtQoR1GIpeSnAoZiBXgdbZeSteqgKiCJOVNXnf7l7?=
 =?us-ascii?Q?KT5LCVk92Xpn65o6Wiu5/US78GaplDIgESpFTz5mlqTiIt1dWTwwltNi6z5Y?=
 =?us-ascii?Q?XhHsk8VSujG3kXuzNBdy/RPI6GzNeqYN3dP4RpZmJ5HSRojyaaq12u7YQbY1?=
 =?us-ascii?Q?p/YVo3Cehj+C2kYxlXRQ5HW95JsOQx5Gvbn2qbhQz2aSBvgqIftRKzU4fJ2s?=
 =?us-ascii?Q?izs3AdyUsgz9qIs6xoQJUUax9RzPoPKQfmxa+vsfYSA4GLzLP4u6xS+oWayQ?=
 =?us-ascii?Q?QCacnreOZAphLnF87/2QptO+FI8aeSZ+iIo3Y4/QmMF+vQm7QIzlBSOGLXtu?=
 =?us-ascii?Q?caleh1t2PXhZ/N778b7S5dBFUcbo2FcSECd13yHXmE26+ccUhEWNxHa55TrY?=
 =?us-ascii?Q?zqjx6Q8N91DymBHD+H+c6Is2376cG/y7j7i/QmImwv0796sQBucg9xsom5pZ?=
 =?us-ascii?Q?ffsfAik1ODf7rz33GzJlUxVoB7AkDiHaWc6YiE+JTBmUX36TAOWkUbcplilg?=
 =?us-ascii?Q?a8IGVPLpvKtWUnttmDbcx/BYLTQcbgOWnJ9mXsPLLtcKwadPsTm8BEZGyiPz?=
 =?us-ascii?Q?lGOUaEjiHADVC1NALS19Z1R/OMPpDkzejAsN5hczR1yAluJIrhkEfVERuQ3x?=
 =?us-ascii?Q?FbcXlg+dmaMAbHrUKHGHsRg7xb2G+xJyqrni6AXH2JGjuxSA4+hfAkhFBwGX?=
 =?us-ascii?Q?Uy1JjHVgThfCaledFN0rQRJqxr3iAR0yXkYd7+86tq9SRc9bK7QC2BcClIHH?=
 =?us-ascii?Q?Vz2AyTMNnp6ax5wlFKggSioPrnALGDoMW/cr4/aWLdSV5P3k358yvG5x9tHs?=
 =?us-ascii?Q?bxAHvdGXwqDUoNqeEbROt5KKflr1wvKJeCjkFS+qhYjp9MVAkZX0VO6PG3hG?=
 =?us-ascii?Q?KlLB9uzrs1+wFdbZgtF7x5NLunzEKPFIib5BOlix9CRqtagpBA/XLLjE9Hec?=
 =?us-ascii?Q?EWwC/gfLsnjY0ElYBQhxMIpfeHjDCIV/3NnDLHjtPW/bQpZLHu3EQKfEJwxg?=
 =?us-ascii?Q?qVkfMLD516d6b6TJEMugKts9Hj4KAUCcMEibnhjvCsaRHfn1ak+WawxyCX48?=
 =?us-ascii?Q?dYYFNv6fg5mrfHyAUQlQdVRoazwkaXDbJ9s6UjfJDjryHUq0qvU4Uhmx8QmE?=
 =?us-ascii?Q?Si9TPIGslyooPt0/9bqRSNC2LgpdUCaFYXvNCSYzVdoB+s7QMtwyjaj3cpkD?=
 =?us-ascii?Q?zIRIfjEl5EpmeCGwvCJOUqTsaYTuKDsjEHt1VwnPx3xNmgctEADp/ZPixlMJ?=
 =?us-ascii?Q?JjKCrFzvb/Xv+GDt07NJPwfnqZgSLlyBd7EgMHno6Y6PoOKh4hRDa32IiXai?=
 =?us-ascii?Q?0kNisskr7t92aYikgqA8pYjcCS+YilrrXh7tfs+S5+tjz37dOwKJ4QH0EYW1?=
 =?us-ascii?Q?6y9EGTBu0+QNJ2Ky+q1I06QDgVztGaP4DFPjVECEW4j1dchizieOy8PptWBo?=
 =?us-ascii?Q?p0BRujzgG15PIbUwEYp4CwsZBNJc4HMQ+v6q83o9X+O3a0dbTtLBKiv8/YLl?=
 =?us-ascii?Q?f7VfDyZChfrzprp7lhcsJ3jkbc9qkvizBjPSp1RexqXgo9nfBNOO/iyQWTqV?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed427ed2-f4ca-48bd-04ef-08dc9ae42d1f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 22:13:18.1399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SLTRAH93emESNpDgGa/lbbnsQeXdD0oomPlii/HGdJfac9pDj5+QrgC4Vfu4ob5qVuvexSE5PLJEVjOiM6Jg5dlG0c3s7MUYSCYP8jmXv5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6193
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

On Tue, Jul 02, 2024 at 08:37:01PM +0200, Michal Wajdeczko wrote:
> Michal Wajdeczko (3):
>   drm/xe: Fix register definition order in xe_regs.h
>   drm/xe: Kill regs/xe_sriov_regs.h
>   drm/xe: Use VF_CAP_REG for device wmb

For the series:

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h    |  6 ++++++
>  drivers/gpu/drm/xe/regs/xe_regs.h       | 12 +++++++++---
>  drivers/gpu/drm/xe/regs/xe_sriov_regs.h | 23 -----------------------
>  drivers/gpu/drm/xe/xe_device.c          | 11 ++++++++++-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c     |  2 +-
>  drivers/gpu/drm/xe/xe_lmtt.c            |  2 +-
>  drivers/gpu/drm/xe/xe_sriov.c           |  2 +-
>  7 files changed, 28 insertions(+), 30 deletions(-)
>  delete mode 100644 drivers/gpu/drm/xe/regs/xe_sriov_regs.h
> 
> -- 
> 2.43.0
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
