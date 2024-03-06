Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0C8C54798
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 00:46:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2092112DBE;
	Wed,  6 Mar 2024 00:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jrrHYxZY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73ABE112DBE
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Mar 2024 00:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709685978; x=1741221978;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=M1F/FPI/aG0VEX+QWVzc2C++sC/qgmZE8A/XiMk/GHc=;
 b=jrrHYxZYtfj7tqL1AmH1/rwAh1Li0A061qT8Avh7F2uW9/3/UxakEjux
 T1++7u9wY+bHqiTJBrZEa+4AoAqTEN4+v7w6a81VmTRUgqVZFG437xhLs
 sjjgiVIhqfE20OoKd2nhp58fxCC5hTd4f8sVOIZ9iiLMh30tnE4xg8ueW
 bYp2CaYx2XDapKhK2fqgaFprJzOAjQcQkiYFjJ9Y/7VjyqKprJflhGB13
 O2S1y9qaan689BdrfebImsfmUDpq4Y8hoMVkgA65ykuWpnmvTxN/JUoxO
 e+zOeFzuldJplwfcR9q6AwDRHv+kjafK8A10WUeXedptWeozsICt+2MuJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4133882"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="4133882"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 16:46:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="9727259"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2024 16:46:14 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 16:46:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 16:46:13 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 16:46:13 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 16:46:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0viXf/d8GEyoyOXrQ0TzrDBr8EAmSGwinl3vbQl/kiDRC/H4RROmtEYNGMsl3hDm5HmzggFkFJhuyhPgHe40sN3jAXJnF8pU0O5RxFaAjTFiNc2270jgpr5n3Mv5AqsEMV5yG2cZe39T8bF8PA1RTARnXwTfniuy+dKtvja7uccFOIeWQlno4kJ0gK/1RLgsiRFvWrDgixlfKkNpH65uzOkmbOQkEBu0aZW6svx4JX3sMClQoQG8AxNkLadTboMqgWCN64y39vTnBose7EPQ8I2R6Vc7CD9stAbUIpMQbgxtSw+aYwZ08mWj9RauA5TNqzCLrN7huZpFPL+DE2mPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ka/JAx3FEpiMEE989WoH+iXNaASRHsHOlaOtXA/rqSQ=;
 b=SnfZbvKBRoUZfZSDd2Qo3osZFotD2AlnNZbCE+YdAoQBtj0IPlJCxXAePvN6XXD59maaZsnZRGb2fay6crg9dVqOSGRRl9RLOxzeuvd2jEjJh1lrkvsXvvHVkbGUNL//Uqc/d1ANgMJvPpLxC6awie0QUCyOrciUgFQyZrHgEdyhBMzpxOvPQEeKEnUSiS/Gc6BKRqyKZWElun6wCZLYShHBDiPEOa8NCnwft9p5TU7tVDFNGy6FiP0zvAaTGn9AfvPLOJxP6+47sfEzwsg2lc2aGM4MPgZtZe6Qn9FN/Iy9IDRw+j6a2YUxCIiAGU2sOUEKgJN8bH8mVoiMqQ738A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB8206.namprd11.prod.outlook.com (2603:10b6:8:166::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 00:46:11 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 00:46:10 +0000
Date: Tue, 5 Mar 2024 16:46:08 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH V1 0/3] drm/xe/arl: Add Arrow Lake H support
Message-ID: <20240306004608.GW5347@mdroper-desk1.amr.corp.intel.com>
References: <20240229070806.3402641-1-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240229070806.3402641-1-dnyaneshwar.bhadane@intel.com>
X-ClientProxiedBy: SJ0PR05CA0119.namprd05.prod.outlook.com
 (2603:10b6:a03:334::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 39b97b66-4e67-4d04-0ea5-08dc3d76d0f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UR5g7ND9eUEMZwnMhjN7Ic0bFY7jGAxeqfIARTEK8xQGgULwMx1FGR1vR9agHbH4L/+pEPm6cQUqkBp/8PjWJXREDrtXObAZEYzsRqL8GjSz85LeNKWYVB8YlFOJxLq2EpDi8q6ro6DxxmDyVgVL+Yxhoz1vBKRjgBsgFjcECAAyLudMysaPeEHwGobSu3rPIRjycrlaHeCCF6gR8fcLUScAZJWoEQfFQDeP+Ekc6dFd8XKt+7YABKBT/j82GG6Dmpe7kdS9IDfv3Ju6XHBbFd2m5iX+7lTLbh5qEkKRVbkWdztZ2CYKG23u4Cv+w7KF2dhb9GPQwBsWJ3gF9ZmuvJ3KaB03w47Ay5jaB3kzEzpaEJJIqkGFw6ixtmSdPEEl5cvbnvNXdCquLAw41TKoskZhcYOTs6a1QZ1sfP8lxqvPt9ZtKwt1/JhEXM2+57r53H7NuaW0Pim+cyzIRvxsAF/LC0xRUgDzG3QHijaiBy9kmtmU0Q5tHq4ILT5hlAvPiwnCWZJThprH3Y+lGoK7n1wVQT64RMzXM0zb2CsDbr0CzMCBdGVSQJTRfuX1frlCZylPJ/wzClrNhtWJqwU06pUd5sckiFiJBZ7kL/G3WQdGbMPy4NNzUjxVDgLJcz/6aR0FCpxNMSC02b2JAypakg55igkd7zzI98bJB7UWdOM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qmdsbEAPS5WRog8DuG1mYHFIrTPQ3sA2P43ESL8gblVUNtZk5XKX7lolAbY1?=
 =?us-ascii?Q?dN19/M7qtSycsDiCP/iQB5GpRgxVxAD96YdcEQvzFovP3vd6Gke6GZBeV9C8?=
 =?us-ascii?Q?KiOTwQ8z8QjMxM11gAVt3BAHzBsFZIbUl+ah+usZdSREc1bcBTsrE1mYHMNc?=
 =?us-ascii?Q?AAV5vxeaK+v820tln+cg1E3RfucnBsOG64Ox2d6FBQYiRykq4e7L90M2Q6Nc?=
 =?us-ascii?Q?5mGInt9mx0MAwOzduuERfJAEarSPjo9JAuql04RoRsXedhCB/zN/TW9fvEUu?=
 =?us-ascii?Q?bO5+Ec4ht35FjijBbgJxT/GhmKKugAiYhxMwFw8iOgdLp9RtuLQCSNpjDK44?=
 =?us-ascii?Q?f8E+Ey8bYcWdHm1nE8wR/R4vHmDsH8nofsklxLneB0tJvFvcTVpSB3Nqb/16?=
 =?us-ascii?Q?+fiSGWIVXEp2gKya6mtDblRcvByDEiEnDWq0Wahg7UhwpQGZ0PkvEyj5FRHR?=
 =?us-ascii?Q?eyRLtO7tGrIvt1jAqaLMIPMVccXwvwW75Y8G8tt+mQqG0Kmyzhl/ZOy7s0du?=
 =?us-ascii?Q?rmTrpDzmDcMdDJnb04rcI679GGReD8RVIzO+LmahgHv4a8hFrj4AhVaMbUc9?=
 =?us-ascii?Q?h49Y4tQGU2RCA2ElUyaFNumBREy+o3g/zuFYSA6rkxht7I0+HC6D7PeFJw0R?=
 =?us-ascii?Q?fSbeKykI62kFFAt1N/d0kJ+0vyK/56fExccm79/gWgyGdK5/uH5558XMbFVD?=
 =?us-ascii?Q?efMr6gQIOn72f3a3UWPM9dk2BkrG6T7K01a+/Jtx2Q+fzkUAExovt0RvB3Na?=
 =?us-ascii?Q?WycvxxLzxMX/RM+UFl5VKImXdPDPXPE6hyStMS2ovoJm+5/3cToI64Gw6MGd?=
 =?us-ascii?Q?wIu0a38Sl0ANZKz63Q0bETFxPt8qLvR1Pt6JRcgx93NYcEfyPYFOciRbF9j4?=
 =?us-ascii?Q?fR6mQ0rvRrk8GlDDt035mUYRVKRQbr0QqmTm2EZEhunnQhBfxkGxqKaAELU1?=
 =?us-ascii?Q?cFlJAZZmtLAQj2GgXvF9SrropfCmnqjEHOjaEje2MfRc+oV4+YCCK+WENOuP?=
 =?us-ascii?Q?OxXAUQFb6i1BUVTczMTd0APPMyEbY9PVsmZWoL1/0KLv+LTp19qQOAzy6utb?=
 =?us-ascii?Q?VMSUjyZ59rAaLxPBRPUPktDqiJzgDRf/TOInrLDU7pSJnJ/BXiSMiBgBMqzR?=
 =?us-ascii?Q?LFqKqZBd/fUIClodxYc8ItYdXaUtIeabS30TLVW5jkn4jfiKBqh54Ri8Lm/G?=
 =?us-ascii?Q?QqFR0QS8nIbKB+rbQBlOh+RUVW3pMfPP9rsqWnWLmn4tS/iHdB4xj3VPNljY?=
 =?us-ascii?Q?xVwZbiCvi7qpNVAtzraL+jJxFGzARvao+r6GpBYYLEmioyHgN6QTlBpa+PKH?=
 =?us-ascii?Q?wWbtHdza1mL1F1rL//nQbrVTc+to6b1aTldy7q2kTsQNeMrnzODALoFbKNfU?=
 =?us-ascii?Q?BPLdjU9TdywTH8W2zFnDXBxfjCzwCPBYsGIWNZL8VaEdqaK4c3MkcKPHNFiR?=
 =?us-ascii?Q?mdhoBKMMWt5aDU2EG2r9VrqssAxmaDuv3uh+cU1D0grxX0OFLbxMF7S0Tx0S?=
 =?us-ascii?Q?bN8C/C4YG/Q9ccwYeP2lmN3V8w6a7YZOaI/Mbvz6T31mO5jZ11JvvgPHYwQV?=
 =?us-ascii?Q?7gNVW+8YAufBOGF3u3fGjIBVSjbf4wRgIzGL5wGbEktP73hZkBsqTXDLsHW5?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b97b66-4e67-4d04-0ea5-08dc3d76d0f9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 00:46:10.7553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dsTOOOgIZi6ucjRugAJsXOwlWjqSWo1/mPntq38Pp2yoI41rV3A+mSdYrOOgSujiiWIs1306KjoOASyGaAxoP3Nrj5Mr7jdWfx9/b/dI/D8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8206
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

On Thu, Feb 29, 2024 at 12:38:03PM +0530, Dnyaneshwar Bhadane wrote:
> These patches includes the new PCI ids and support of workarounds
> for ARL-H platform.
> 
> Graphics version 12.74 (which is technically called "Xe_LPG+") should
> be handled the same as versions Xe_LPG 12.70/12.71 by the KMD.
> 
> Dnyaneshwar Bhadane (1):
>   drm/xe/arl: Add Arrow Lake H support

It looks like things got a bit confused in the sending of this patch
series --- you sent three different versions all labelled "PATCH V1."
The second version lost the original authorship of the final patch, and
the third version only added your s-o-b to the final patch rather than
all three as intended.  I've fixed those up and applied the series to
drm-xe-next.  Thanks Matt Atwood for the reviews (which landed on the
second instance of the series rather than the third).


Matt

> 
> Matt Roper (2):
>   drm/xe/xelpg: Recognize graphics version 12.74 as Xe_LPG
>   drm/xe/xelpg: Extend some workarounds to graphics version 12.74
> 
>  drivers/gpu/drm/xe/tests/xe_wa_test.c | 1 +
>  drivers/gpu/drm/xe/xe_pci.c           | 1 +
>  drivers/gpu/drm/xe/xe_tuning.c        | 4 ++--
>  drivers/gpu/drm/xe/xe_wa.c            | 8 ++++----
>  include/drm/xe_pciids.h               | 3 +++
>  5 files changed, 11 insertions(+), 6 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
