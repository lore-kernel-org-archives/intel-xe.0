Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF70C7EE2A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 19:10:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6B210E131;
	Wed, 25 Jun 2025 19:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AyxPc5Qw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D6510E131
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 19:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750878606; x=1782414606;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vTIuLMZnjzPlch7mWt1+cJtJiHGS1Oyy8GD+5Tvlw9Q=;
 b=AyxPc5Qwjcu9o4GpylxrXXMprx+SZzmQj6utbVo7qjNnxjzzHPOADu8P
 YAyezUEX8bbGNHGPt10UhO6U6X3PLEMgFQBISwytCn5JSNdbNdZ/y7jxk
 LxHY21QDEKBFFiicPz8XdS2ZREENKs6zqdjRu+v2S1RNTMOyjuFUsRHQ3
 FouqGDCCvSdK2JBh+nG72gU0O3JsV6qf7Eyqhr8xK8mEeOdikQ+ZRSqKW
 W1pl7xkM8Lm56UaqqIlL63hLaypyVBhFftVyCXv7f/nQGEuW2zhI3HNDN
 FsXSBnzCFLsndFAK7JFs4sUyTQcQpUk+NhGdjXQjJ0Hi6LQ6kSdST4yMW w==;
X-CSE-ConnectionGUID: VafjDjmzTRi45XOzXfwrKw==
X-CSE-MsgGUID: IUmk7mGwRoiWmZKsaWFnog==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53228350"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="53228350"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:10:05 -0700
X-CSE-ConnectionGUID: 77pXoVXKRzKUoASpJ/BDtA==
X-CSE-MsgGUID: LqSA7qE1TmOH7gNL3PDM0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="151819381"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:10:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 12:10:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 12:10:04 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 12:10:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/89PDrXygz3oHKo7C35q7E34OJr2VlF4kRgya+wZunkQ8I9UFH84An/xdkRJRf0byaMXCgL5s0GyHV0h9evj52f85nSjfUjv8IuqQdXtxOl5sTOlrkbe3yGY7vtf9puMba0lurIHvacZ2W8kE2wgJQgehdvVKakv6kqIs2MzXcA/vzL8unKv280ajqX3DJmdv25pdzNk4IAXjIc/cLvEtU9rQw2E8rruF5K5M4EutQ+4bzIQNqygD6pRPTogws/jDZ7KXFJTgNNXCUCeKBH/3N09T0zRS3YGbSdYUoD24zy60cHSf1vyKtIvTGq25f14YMGAm+TWmHgXk0v5lmxyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EuVGwgVwS0OMofLSaBY0aF5DBkOZssok5ItBK4l1JAg=;
 b=bDrGSqsQXX9nujZV5r1ikJOwvl+/dLZTSM7tcj+G8qoLbTlB2EEPPWu46gGNHUP7QmVxm5rzK9ic8Z42sx4PDiIhs07hEjioqfjaiH9bBWCPEaARGZtGxlHEauqsqgYXH6jvU2aDdeORWjH5krvutpVboqSCSUDph9Z/b76CMn2iOa4O1pFAMvMEblRxy9J1r1y2HZx7prCkU6fdeO1YBa0jmLYF56Ujr2+KnfT4QeHZeeL0LZOhweXsOGmwoGzRrJyf4c0p9wHSK0wRZX4pfzsspSA4HubIzGdKF0/MODpYGR/lm7crrfLU1YWNH9Cxsp0maIjFNRdjHDTiiSKpJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6168.namprd11.prod.outlook.com (2603:10b6:8:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 19:09:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Wed, 25 Jun 2025
 19:09:33 +0000
Date: Wed, 25 Jun 2025 14:09:31 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 06/11] drm/xe: Rename gt_init sub-functions
Message-ID: <4krrbxxlu4n2yigubqnt2yre7pm7526jplqvmnuhtlotd4v476@eb6toiwaokkf>
References: <20250619104858.418440-13-dev@lankhorst.se>
 <20250619104858.418440-19-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250619104858.418440-19-dev@lankhorst.se>
X-ClientProxiedBy: BY3PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:217::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: c58ac38f-b776-4e2d-1ecd-08ddb41bd202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p0fqGVe/o39iAiTq6bwlBODU2p4JAaZn0JWdOmB6sNsTzFOUvW5HnTSUZ38V?=
 =?us-ascii?Q?C11zWI6w5ud5oUlHL2uH0WQpZpotVS4oK3rLYP+9fUT25qU1I7fdZDPqZ4Kg?=
 =?us-ascii?Q?qhyrz2vOGqWrUBK5lnZzpYcFCgZrV4CskeQ3QGWmv4u9y9Zhoh2Fug2U+dz2?=
 =?us-ascii?Q?6bGQv1TLQkMRjQxyVZhqJKXC+LExNlWAEqLKEm36Mg2K9oQA3dFNQqhnUd56?=
 =?us-ascii?Q?fciXTAt3FRQi+JuW7IP0m2NS8Kfkq6JoMVGk4KXSt7h40uMW/QreGRPKh91m?=
 =?us-ascii?Q?ycuhLeNTByHhg1YeHcw4i7aY+o5npUNd3XcF7gohxLZiDd7u4jPD6g/x0EFe?=
 =?us-ascii?Q?Qz3LrKlVRpeW+y8xdOC9E4D5mRDbzUUYfdQyUNvO4FwKDPi4zpywaGJnVEA4?=
 =?us-ascii?Q?G7+KUcbJMLfHEHjd7zUdVG9SmGOKpv5jzO9AAiYFN7QD1qPIKPIDSC2i48Yo?=
 =?us-ascii?Q?cRWdHi4jAzL3N99jF3kO3Knlc3ajH4ELfZjjgys7upFpLnSvy3PqT+J0xcsh?=
 =?us-ascii?Q?TI5wJqyop7OTYFAuFWHykX55lSZHSIDZ+ee6uYnXcn3kcp4MclJsB1KFF3jw?=
 =?us-ascii?Q?o8sotZWlkBE6U0OOLM42VyrDC5drUSdPgXmbbfm+m+hBMfIkkveiVmcddW1u?=
 =?us-ascii?Q?EfM9F6EuysOpakRE7plnIxFl9AMPYivERa1Ks1YmQlSS/kCa9esi1Bpnsw9K?=
 =?us-ascii?Q?vJZOermK8rgz+tR2Kw1gd17OU88WaWGVkcxAsZ1WBPzWTJUXlFcGyKNCk7QN?=
 =?us-ascii?Q?Dcf4AqrF2HgOOiYak1iixlE78tcg21rvrcy3NM4s1wzh5Edc4cgpJIirP0uY?=
 =?us-ascii?Q?VvqS8QdIkhe0iqS3AZLst5Qq+1HgxBlRXhlrvM2DNsNqUPOcJ5pRIer/VwuC?=
 =?us-ascii?Q?ildkzZYhllD5lhN8hQRGyUZGH5kXgMSGC4cP4VMxETZD34If3TnBjsq88Y22?=
 =?us-ascii?Q?nm6utFYCF8HaDia8MKvpY6sh3QvyquXNoEd9xppq4HWoZEIE447U+kA/KsZU?=
 =?us-ascii?Q?IXK+BcHePRqVRwx+0e5teZEBd0n6jbdXpkAcx2bpT9cejRt6+dwfaFt+U8/O?=
 =?us-ascii?Q?6GIZUhym4C6eupfvAN9DJCtPOwVwmOXE69K8bRHxEs+ZQVZqSfAHh++CSYrs?=
 =?us-ascii?Q?XNocXlXxbyo65qdEBzUi49l3eTD3LK5H0kYmSNb1USFUIduEZk2DOfm7ply4?=
 =?us-ascii?Q?12QcauhwOzfSGDzSbksJwns4e8XO0QXfIRJeorI3p/Ih0cBjnT/x0llxodRm?=
 =?us-ascii?Q?zJvMKjjBbnq7O6366vyJDJD0AALOi9n/vMPpq8OGcPHM2H6ECXVhRp7Q/dMQ?=
 =?us-ascii?Q?DFf1kkQ8td5ei3TJvjTNAtfK2MQYiDZMK30iuE2hDvbWCY40jzHYEGEnNsIt?=
 =?us-ascii?Q?HNhdlpO89sBY8jb2hJ74QA0nnzj/EAP6u5qQIiK/RiL+uzH8tTSMwwVCXAA1?=
 =?us-ascii?Q?W2hrMMAvG9s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FfIRIiyMZLE+tGNH8+21Ll/bX5+F3QcmaLdaX0vY7W921sgeGjt4Q96xWXno?=
 =?us-ascii?Q?waHvJJz0biJLD7mrBFxPpBKG90tt7gTBy58WLDALonpyhgKyunbntsyfCIcT?=
 =?us-ascii?Q?ksx5Rk2CMWoZsFu6BXI9mBiK1Hyti1AlS/ODwyrhVFFJI34IBtlwSB1xrY77?=
 =?us-ascii?Q?MxNKyDre/bRLXZggnNEIto7LjOOwFXnnPkdPZuc6MF/HBfgSmyx9c/BeCGii?=
 =?us-ascii?Q?Z0Tkb/KJrp0Ms/XaQ27FvmCBVdBHay3BEUJfDHg9y3gwP0wwiBKxFn+PK8/y?=
 =?us-ascii?Q?IxrZukeRv5MV7GgRGPbOigkDWhHTEpzx6SReDfwvBhDj99w9rTlBFUVR6enr?=
 =?us-ascii?Q?xkMqsS6kym7USUJvFqNK9NdN3O4paSUuC3b+U4ltPAgVJn3hfOoXoGJ/qiL8?=
 =?us-ascii?Q?u/Q0qcrVrBNDMrXS2q+CQ216OY3esKQfZ6kNQZN5ujFujzcMzpVX5SBDrOhP?=
 =?us-ascii?Q?wFFKt1QBAJKvWWkH9+Xxn2Y1uBHomALm85cjR6DJDASpfIvi3ZjldIfuyS1t?=
 =?us-ascii?Q?SMNdYbjIQSR5rGDyuojREojRuC1A73k3Je9EBfeOJS0+0++zv0tT5ocZ6A7s?=
 =?us-ascii?Q?zaECc+BpE4MexKzHV4XohAswXEeN1VEe1xfzfekP4t8rDRktbnPZUx0U1j8J?=
 =?us-ascii?Q?yqpA3vjzURjIFuGw/dFnSPozw/RWP1829bQHm/kdenndcOv6z3qUeXXEgJC/?=
 =?us-ascii?Q?Gz5eXfcEzBuBd0GdMS1+4qXRllxuboZV1mu8+RG/jraBTvO0csS7DoASTZoB?=
 =?us-ascii?Q?UuW9Iyo5DHVeqhGcIOX/KH1j8j58aKdT2LBNQ+zdHufy+KeQxTu+hKo/+Y1I?=
 =?us-ascii?Q?p8aHsL9FutKhIoX4f2okuigY1u4PyCNO9qNLH5ZTVJ3ClL0vpHXG2zE15VP/?=
 =?us-ascii?Q?+6H/agMgBJNsrmeulo5L/gUvlQp33ZVcNvg8Xf55qZ+fkWQMLLBjS1/9UMjF?=
 =?us-ascii?Q?TRxrItTSXPJeys304onwY5GG+a7QZcxlOGKSJXuItKrotnKl1Ml/ndOKDBBf?=
 =?us-ascii?Q?oXAd32t/bcekXisMgwLr27mO6JrW7Sa2GHwiSWFFVFACyzKAxoMllmf8YIUg?=
 =?us-ascii?Q?v0q1bICC0/nFEBcnB2paDt8+yUsaeJOG6dVBTdGOKNaSvktEaoMqUE8KGGuF?=
 =?us-ascii?Q?YTxgQm07kHbcGhccBPOGLukNwVEPAd38ndzJvM0Tt2aBiP6TyDbViXk5AmZB?=
 =?us-ascii?Q?eWQ63AC6yyogAzyVWsj3LQGga3xevHfW3k3Gc6C/jjp1NmqCWZuy+QWKLUGX?=
 =?us-ascii?Q?UzhB3YLCOsSNcG+CONiiXjW1suiN5HBMwo1sD+RAsJ1eV8pHqn8AZEHv6UQV?=
 =?us-ascii?Q?c5xjUlyaWO3LUnmOo84L+eUpLWu6IB/zsEoGxBdRzPhLrQYIdhN79w3rck2G?=
 =?us-ascii?Q?n9ejBvWRgUo8uZFR/E+RjmH6MjvqnSWXOtB7tKND5nBcBnfgH2LHk1vJkQBw?=
 =?us-ascii?Q?aLmFBnhZEM4y8HyWPb4/quK6j3Aw2DL0kXR2xMFExhJySNR1kEsemAiENJ4Q?=
 =?us-ascii?Q?4pMGCQkFCRw7sogaZJ8xCbyXbH4z7Dv4LxofEQqxhLeQeylYVhxjhjJKS1cQ?=
 =?us-ascii?Q?Qq3zOE04G+mon3EJ69qIp3/fp2+7FzSuL+LKXOrtc9kZ2FOQoNGID1P97aoi?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c58ac38f-b776-4e2d-1ecd-08ddb41bd202
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 19:09:33.8770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oyFBpMofiLDRMukptcF05v01pd6GvCBcPG+IqqHAdlCcGlLC9NJD18AIwwegmghNhASdqbjx2X2A4MhydIJI6rXdezcUO/F9fWkCuUgbqTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6168
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

On Thu, Jun 19, 2025 at 12:49:05PM +0200, Maarten Lankhorst wrote:
>s/gt_fw_domain_init/gt_init_with_gt_forcewake()/
>s/all_fw_domain_init/gt_init_with_all_forcewake()/
>
>Clarify that the functions are the part of gt_init() that are called
>with the respective power domains held. all_domain() of course only
>works after discovering and initialisation of force_wake on all engines,
>that's why the split is needed in the first place.
>
>Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_gt.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 98360986df7db..435d888a1dfc8 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -440,7 +440,7 @@ static void dump_pat_on_error(struct xe_gt *gt)
> 	xe_pat_dump(gt, &p);
> }
>
>-static int gt_fw_domain_init(struct xe_gt *gt)
>+static int gt_init_with_gt_forcewake(struct xe_gt *gt)
> {
> 	unsigned int fw_ref;
> 	int err;
>@@ -493,7 +493,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> 	return err;
> }
>
>-static int all_fw_domain_init(struct xe_gt *gt)
>+static int gt_init_with_all_forcewake(struct xe_gt *gt)
> {
> 	unsigned int fw_ref;
> 	int err;
>@@ -648,7 +648,7 @@ int xe_gt_init(struct xe_gt *gt)
> 	if (err)
> 		return err;
>
>-	err = gt_fw_domain_init(gt);
>+	err = gt_init_with_gt_forcewake(gt);
> 	if (err)
> 		return err;
>
>@@ -662,7 +662,7 @@ int xe_gt_init(struct xe_gt *gt)
>
> 	xe_force_wake_init_engines(gt, gt_to_fw(gt));
>
>-	err = all_fw_domain_init(gt);
>+	err = gt_init_with_all_forcewake(gt);
> 	if (err)
> 		return err;
>
>-- 
>2.45.2
>
