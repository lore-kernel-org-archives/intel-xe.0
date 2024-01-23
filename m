Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EFAC47DDB
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 15:43:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD69610E711;
	Tue, 23 Jan 2024 15:43:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B2110E711
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 15:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706024613; x=1737560613;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0uAfEkv0/ZZEedZLMFHl6nSPdbuCQiYzm/n6X8ats2c=;
 b=KYSilACJEmsz8tXnvEfWJsMlz21In3MtdwxD8tqBYW4nHTu+BfU7+c0I
 x2nnEq7pabaY60cPLQVJxOE1O5WgC9MRborlJ8qZxKQmwyP731il1ndvW
 voIhCjAtIvZOdu9LxcDzLcJDpMnzPHYsV9X8lLKiE3J3Os7lM1wh+Dpm5
 njF74aDwzZoWex3B8FzajC753kluZhXSfGmYRxoa9REM46qbas7pcvnjZ
 DRG2Q6diwoS1usIj0XJqewAe7CoFBZ3Nn1jJdkp7Gy6tvpr+kw18hsBUY
 Pd4WkXtwkb80A/TUmxewW03P1GPCSxTZwHs1XSa7AEujCLMyoAE+naEVy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="391978204"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="391978204"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 07:43:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="876384071"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="876384071"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 07:43:30 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 07:43:29 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 07:43:29 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 07:43:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrQPp1bIzOachdP52GPv00u0fTFaL1RErlU/+DIdABA5/+JMDdGef0G9qcBz49Iwh1UDAcGH0yDQhTfBX//gCPsCM7m382Uo+JiK7fH9tQaLl6ZuSeWvEXnLE4fyM5W2AgJoZZ2n0rh9gvt7JPAS1fQZ4h0RfVZnFJnE9YmPY65k0Frziosc6wQc+yilW9a8t1s0ITvkAKvuQCl/qtlhFHnGZH/nLtktBT3SiN1p3ngt2VaOTZN6yqGD0s+ioo1FrA4//LQeriV0pnifIveeVZIHJx/y9X0kQSG4hXZTO06GlpoxWf5HgablOUCQ1h5y5KQPyZ8et+b3gL1iPik1zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UI0EBh/98vQOYywmJ1Yz70C455ZL9+3QDbu3Kxey2w=;
 b=lOMgWu8NbJTcbej+lCbpuAux0dG9KuUXiGiM1KbXeTSHvw35Xhjl6ZiRdrjn1o7VNDzkLlNyorvodiRjX5L6k65x+3F2R5IwZhvB6UAfIV45xuWBSmmbOLSQXEtaUXbvch2bzG5wqyZw3YNeZ7JLQfQ6vNgDafsdYa919Xi11XdK6cMXXjoseJJBCBsNdI44SGD+bWoWMd8/uRnXvHaGyTeapinEYblLkM7t6srOV0QnP+7O4fbgKaiPNgfKsj8XVCufHBF2wCq43eJmlUS5yCGbZStJUr2NyWcVpIXaiDqNTZXTfziauyyDHc+6l/8rjMvLSZJvaQVkjZl6Wd2qig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB8565.namprd11.prod.outlook.com (2603:10b6:a03:56b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 15:43:27 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 15:43:27 +0000
Date: Tue, 23 Jan 2024 07:43:25 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIENJLkJBVDogc3VjY2VzcyBm?= =?utf-8?Q?or?=
 drm/xe/xe2_lpg: Introduce performance guide changes (rev2)
Message-ID: <20240123154325.GF7083@mdroper-desk1.amr.corp.intel.com>
References: <20240123050552.2250699-1-shekhar.chauhan@intel.com>
 <170598903550.666240.1362026124381288329@5338d5abeb45>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <170598903550.666240.1362026124381288329@5338d5abeb45>
X-ClientProxiedBy: SJ0PR05CA0200.namprd05.prod.outlook.com
 (2603:10b6:a03:330::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: e6c6be73-a2a1-49a3-8e10-08dc1c2a0abb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EJ8aRZwJ2nJKvl1i6KvKG3NMR9B0R6088pBE8YiJTec5ldlUFDkNj2ckQjH9bTTOKlczfqVF/cNULr4b6KyEkiwU8/70le4AmJER3GlO8uAkMq7Nbt1QHGlmQrMQ9Mv5WIEud6wGyJe58NFWTR9beBd0SY4oIqcYHNLOmBkDdkGPIJZOZTejjxpRKaHljjEuEvaPAXFbnaI7yWrNotBsKhsgdh40XyEaPCggxqplHxAfkpfl2yoAzFOowU3IO9gBjvVSGgVQ1p6rcxg6ItDAevjw6o0lWaDqn+CoRPfLtBMYNKriKllYtoyXaZgobO7em4KH5E5AZTzrUYsda+x7t986yAwKrJLqut8nAaMc4cXQnguIym6juwfMjJyj8LZXBOuJmmzbqvszPJEBH2/G1PA9ykAL4F78aAizarEk4zpfc7P2Ba6s3oCzZr0dCVSTvPTwhxWj3ETHTpLLVAX/5p5KuJQ8yrmg5l8jhmformYSrNh2OMOXQA8mKsMhdMMhZhSgDJbkZ3PJAfQyMwwywmDRMnCsizcmqRDOyVrb23zph2Eo46bf1FiI7ycxqLH/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(366004)(396003)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(4326008)(8936002)(33656002)(86362001)(38100700002)(82960400001)(2906002)(41300700001)(5660300002)(6512007)(316002)(107886003)(6916009)(1076003)(6506007)(66556008)(66946007)(66476007)(478600001)(966005)(6486002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rS9WgRTxgdQFipV/b0uMDZFvWVBBMEtBjmS+UyuZFP4SvrDdO29C75tKf+6+?=
 =?us-ascii?Q?zOcfWdV1AYR7ATLnMFds1jMokTz2n6F+/T4OvL6Wqy+CGkhb+PrPGLIaPxN8?=
 =?us-ascii?Q?MlJWHlTCsgt6HPwqTHnkqxJtoMWsiZ33dmuiAXYhqx5vjd7BCxk+7iq1fdhd?=
 =?us-ascii?Q?mmdywTgN2bVBJs7Q1HXokxTXOG3xJkYzwr3rIvnUIDv5Qw1fdTrg/mCdK1qv?=
 =?us-ascii?Q?jPAYZW+uGeKc4AC+YCpUBVoAhpJ9b3DE2cTXKv3Ej88Bx6jZh3bSSe0ihyVz?=
 =?us-ascii?Q?sRg/0rtGYazipO0gNL27Y61qiOQL6EcFjwnwQCm+FB7b44xzDBhNV5PpObii?=
 =?us-ascii?Q?ewtIaPCtjUBF9wfMiKVoZTH4IiPih+uYaQ1qCPsR4nJSkNfBpNtVABnqa+Qp?=
 =?us-ascii?Q?2xN0GtuqPrETs861ihXZsGYEEpo57QpdAPASE8Vk0ydAlp9wZJ2rk5dXtOD4?=
 =?us-ascii?Q?ND+WHS/81jjZroFFz7Gv1E9ByrcGp1frrMCfS0LBgq10PnHH/AUayKOOn8IQ?=
 =?us-ascii?Q?vGMg26JImCGF1e+LVDigyHN85Q3+AR3IA80uhr8yrf6K0VBAk2UC7p2LlHa4?=
 =?us-ascii?Q?fePjxY9C4x7asbGF/qEuwR4IRDHYNkvyYBlg8suUj9uVKFmtIMpjyk3mjFsK?=
 =?us-ascii?Q?IKfWEiAabCKUft1b0dafH4DPEh/CMbURzJCQco8OV2rCb9lczPBQFqTY4H0i?=
 =?us-ascii?Q?x+DPt4TPQIvLeQIOpqIsyxlFJcHEAk5yDEA9LE806DG/YT03tMb6Gnrjqexm?=
 =?us-ascii?Q?bO4L0M9d83D0uu1qNbEABjr6yBDvJeiRg6EuCLXe1c4RYF0IjJ4d9jb8kK3q?=
 =?us-ascii?Q?UqMquGepfwBGVPcth3tAWDw7EFqDilTlc9dDrJpyzjQyTlEgoyAMvE5DRTBu?=
 =?us-ascii?Q?Cw8RUKZFyjJ8f0Xhc0IIG0g6UPKvDYXN5C6ICKx4oKMPDAPxqQ3Hgr4RdUzT?=
 =?us-ascii?Q?tnz66cSgW1O6wp6UvKxanTJFEs+sVrZWNTEdS2+VcQksdjkg6Zlx70wteNns?=
 =?us-ascii?Q?RbF+ddMUzxmoVM/SNjSqZCbAbXKB/kj3bHYfiJxqGIjsfLFzOQAPZapU72Gg?=
 =?us-ascii?Q?6gqQ/FLn+HHSWzusQRJsnXj8x6xIF/xkJ1dzpPn0eBLOIXRZIlwUtk6PvTW/?=
 =?us-ascii?Q?B6e5AMz8DiNvv+f3MetAYfb5sJ8wGg2ux3VGI1Frt0TsM9aBLzbZI6Z3gePv?=
 =?us-ascii?Q?MVMx2h0tOxX/I4NZL3m4+B3+k5cC/DydraxFCGbrXXyM3WKgpjLXRVw3rWWR?=
 =?us-ascii?Q?UagD2/zfwHGSdRrTRd7xKkZ4Lcm7rqNyeHeJiP61OqCu5NhppgfhT9dmI1Ud?=
 =?us-ascii?Q?DdLPW1ymse2MycdpEZAJnb/YbZ9O3wEfV3uN46ja6Jv424RQtwwCLWeaH2ba?=
 =?us-ascii?Q?+h+V/fUcwpLr0jU1BMpkWU++ovxJdmJnCZub0fvqlzgVj7Pa9UPeGzqewgso?=
 =?us-ascii?Q?u8xNrpgaivDch4xXz8hJpPkefDgo610R6DsmOJydO0BdpDFX8FzlJECPRe4x?=
 =?us-ascii?Q?Bzg5hUQ86oRP1tKm3Y3026Iv626YJcEyjZ5y580DLrmhIITown5++jgM/SCn?=
 =?us-ascii?Q?MWVBCclQIIBEaOZ26RAqsHifJa1LlmpONNcL7X8cKR9usdvt0Jeu/WV7L+dF?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c6be73-a2a1-49a3-8e10-08dc1c2a0abb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 15:43:27.5238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3jQlAjW3wgEogE7m/dN3xSr6Bo62/hQlBvLUSNIMKuK74JVfUEgvJZC2g5eCuNuHiRwP3DTb2wBU5+kpbbfSabzhAuc11e5F0eUg0mfjTrw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8565
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

On Tue, Jan 23, 2024 at 05:50:35AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe2_lpg: Introduce performance guide changes (rev2)
> URL   : https://patchwork.freedesktop.org/series/129010/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-666-1cd8b030edf847fb2aaf5dae007e93eea64f704f_BAT -> xe-pw-129010v2_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks for the patch.


Matt

> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> 
> Changes
> -------
> 
>   No changes found
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-666-1cd8b030edf847fb2aaf5dae007e93eea64f704f -> xe-pw-129010v2
> 
>   IGT_7685: 7685
>   xe-666-1cd8b030edf847fb2aaf5dae007e93eea64f704f: 1cd8b030edf847fb2aaf5dae007e93eea64f704f
>   xe-pw-129010v2: 129010v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129010v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
