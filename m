Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F6DC77B71
	for <intel-xe@archiver.kernel.org>; Fri, 14 Apr 2023 16:26:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05C310EDB1;
	Fri, 14 Apr 2023 16:26:02 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A15B10EDB1
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Apr 2023 16:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681489561; x=1713025561;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=X95nh3uAljv+6UTebt1Gdf/dgt2z9Fc+6B51x+Y2M5Y=;
 b=Y7NBpYtEIYl5k8HJg4WeydvI6BpE3g5yqVwffwQxh2K3tD1H+WP47grd
 I+GOt2lsu9sPJwt0F1suUvI5/3q77kgYMnHG8WFvsuSbDkYaPo0qY++Xn
 0GSSGRMkRmAbroafw/fYKBiF/kA23n6A0ZPEn8JjTwUZu2EmDCJJ7dtTu
 mcWhQkYlUGwcljKTRBtAqvqg501F9ljJRig/o6FbXcAyitKpbh9Zx4uWO
 feXfK4Cxh8kxLsMGpp93zsKcpvGsP/ITmDuFUAyNZ1uUofVNxDB8CTseh
 XsxKK3nZV+A5sTnTs1L8HHT7seXT4RnnQIlv6ejS8ePsAMNBOIG1RYgtT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="341998012"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="341998012"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 09:25:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="779231648"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="779231648"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Apr 2023 09:25:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 09:25:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 14 Apr 2023 09:25:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 14 Apr 2023 09:25:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLsJft6UZVVg73Rnm5bF3xaUZCT3yY0c3nFAfP7m6MucI31S//2VNQE/ByuBTxCawOIBemqnV14TL7DGx1hgDUGjtRmbjJsPU/+JCHy/CGWkVs7JZO3uYgOvIuU1uuDYIh6WIwyeFxE6pcTMf2WqM77x8N85vRU9sSqP/yUcxsGs3T+oTe6vj4C3KW12How4zs4m55Gvbcm69RU0hc8iLWMExGhj8+jqAyxVBPD5Qnda/DP4LJI8Hbg+34WFLtNAR6v9ncMAi4lXcCWgiDkxx/BNkYdAxX7JikNXkuVUVYmahOaWJBuo82+XS4r1Dk3x8s9KaSFleqd/5fSGnp3hFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+yDxGVueNhx84LOAqsij9GTf0m+2OPMda9wStPxKYVc=;
 b=JOaH7s+ULPoSPiGHcp2DxTQi39OF6s4m+2uAxcxad27Jl6DkpU9KNE4wkwuFLyx8Gt7udp/UXvAWazXPCMHe4/+ykzX3efQDegs1UJVcsY7/VGVI6Fj88JS+8wxjPc0PbOEuT6mt+APnb9xIFyjWe87zMNgHLt8Pyz6tGAsa73DePbNe48+Fz2tUyVi6CdYF8/yU7BO77s5ux8WIg7TeCUAzccaPyop1aNDYQe5z4Ph3P2c5ivxcZX9LttYgddBQTomRzFFQnzK3+FQYtLKnV8lrvMJivow1fDjTjud3sR4AdmjU696n6OtLM0tErojVeqLT/b3QDFB9ANkaQwBEng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5002.namprd11.prod.outlook.com (2603:10b6:806:fb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 16:25:04 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 16:25:04 +0000
Date: Fri, 14 Apr 2023 09:25:02 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <3wzwqcf27xiqsytdzx6yymyoyeaynnnlieclxgzlueo7ormhuy@5achhlczkxfh>
References: <20230414102745.2848028-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230414102745.2848028-1-francois.dugast@intel.com>
X-ClientProxiedBy: BY3PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:254::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5002:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fed75d7-bbff-4eb8-e1a7-08db3d04cd77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s2QF5fUksPSurfEWnvDWLxYwZN4evv3/FybA/EIt7qpGJtrfNSDhNmZmavnCaDIfZaQKtUcxtdeMm5q0TIAWda4Wgzym5T+NFoU0Iys31yLBHkVj8FWMz0nJ//epfQ7NS6QMopVIH/6cNc5nyEk6TjGNsIPrcTYEAF4gMewHdswa/KxsTcBRB1ykNoxnqasL+v9O1jFTtXZ7afJTPN7a/ysBCo9SsMdWCpw40u1UsIfUC6e6JuXSrslbXf4JAmaVu7HJ20EKiT7towNxVBZ0j7OFXixHPpq6mARVoYHcMLJx0ZkAY/FjHtv4IP4/5Nmbt/anQRhM8P5/SpvbWlsIpL4eq4MEzRrOtqWhp8HmuCtWJSDo44VNu4+HOx+nPjmv8briEfTtoo45QkUVx/xzPnLOvD8AGn3oYZcQa+eQdMLJ8FyJDFfoO78eqQTZmGL0tphLcwbUljwTpi2oL1w6rV0ArPzJSa8MAlZQHqJvpIaIsVn2JlwoE+EssfZWoq4AX9h95t2T6mfHliiUis62ww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(366004)(39860400002)(136003)(396003)(376002)(451199021)(4744005)(5660300002)(2906002)(38100700002)(316002)(8676002)(86362001)(8936002)(6862004)(41300700001)(66556008)(66946007)(66476007)(82960400001)(4326008)(6506007)(83380400001)(186003)(6512007)(26005)(478600001)(9686003)(33716001)(6636002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q6L5Rnh9YdPRA4v0AxfNfZ2uPVVeVy/Z8SdZkmJ+iET9DE/Ec+M5blEzo+dY?=
 =?us-ascii?Q?0nxg6K8HgpwWNCuaK+A9NS+/77QiZ7ZaoW+mhupjPlXVTnxyAMJ0jJv26ME5?=
 =?us-ascii?Q?7i0csR5k5DoqvKtHFpPPMR5kQX1KropUza7oCRuxONjKQQjSc5q9dFBt8Ttq?=
 =?us-ascii?Q?rm+ck2dIpAB+kee1s3/TT8YYzchLEDX2a6oHA4DhUIFZPhRRVm6JmyOeO5/j?=
 =?us-ascii?Q?YrnMlGKRDk+P716lviUBuk1ff4/DHslQj20gYy/ZgJNcItl/NSIrrCATdOsH?=
 =?us-ascii?Q?as/TEeGPhawZLvU7ZFYkAHFHEcFPV6Ag+/uj1vTNwk4zObQyycZffAKLjwgz?=
 =?us-ascii?Q?SCx+TYgJ7f+lMef8MoL4Af8aV1T++2EUQQgOKiB+bJX5zmCDMH9RwI7rH6Eb?=
 =?us-ascii?Q?SlJQPOCzagr1AP9e+H6CZMc2nKKyCfmJEYzE1QTrd0TioIV8pzJZC/OQ2gBB?=
 =?us-ascii?Q?oLwPtQcOgiMeuPtlP1jqB2OUjZoRFuk0/iZ0UFsU/IkoyHQ3plPV9UK68+8b?=
 =?us-ascii?Q?fvqNkEL2lryh8TuBRz6MIYPnQLpmkdXypA3Y8mX2j8q09KPumKLF3EigIPQK?=
 =?us-ascii?Q?6qe2knQCuicoDZjlrenkZofx630b+WuoUKNmMDvNUrJjm01j1OGmIdar8uxO?=
 =?us-ascii?Q?zk1XPyXJjgQVhq3k9zZpKTS5iEi8XWgMwdAMoG0TWxZTtlnswhRl+iTpkxAn?=
 =?us-ascii?Q?Ladnp4Km1LeKZaZCNkiHS8slsu61w+0kjnOL8w3UQ2UIhZ6qTrPeAjjI87g+?=
 =?us-ascii?Q?xvwMZXqv47CrqA6wMMr6Cf5d/QRUnqt86xgKf+nP0sEV0xmNpzkhf+9VMm3P?=
 =?us-ascii?Q?/ijqle53hIjI85VqfgXTrV5o4GtPXEf0Ume3dvR5YTQOYzb+UrpQiq1DhEj2?=
 =?us-ascii?Q?hwfdAN+Y5WphhhZPiE4O771Ct7HJ82mIvb7f3nxvylUBFY/lFYsqoyqilQiv?=
 =?us-ascii?Q?dWkLRAQyBEocnL9G0uId3MFFD2QX1t6S4DO1SfZus2IqzqBJFLIUICbeEIAO?=
 =?us-ascii?Q?PyV1KlbuilQ0yQsTizZXlHmC6SMGI/rPNe2V1svxKsvjkHGqaA5JCFOdd4Rz?=
 =?us-ascii?Q?GpbyqIMOfycXiAhlpFGtWh/RDLYEwbQVzSBJH3du2szmocLpq/KPNKt8upE7?=
 =?us-ascii?Q?u2Y2gRILQaxLM3hynxcFh+PxpikqGE5GfXDXngD2Ajd7ZR1jj7Wl9hiJgJEa?=
 =?us-ascii?Q?QnqzNsB9SDCxKAJobjC/6Dto5m2KSFeHr2s7dlaUyMSaKqaulyOLFnyDnfk2?=
 =?us-ascii?Q?AihCulnFOa7Gb00rZWvziGYJRmQ3LZlxSC9N25WaWS+6GIx5k2uq+3rYhS9N?=
 =?us-ascii?Q?LU5U/WWDRxQTNSivqf07Qwsc2rSsaaMUjyKieYHbbrm/E/iLwc1NqZNWmKtP?=
 =?us-ascii?Q?/cI1cGk3QIGR8aNtxj3u+Ck2YYlayyrFqyw7pqUqMFAbeda45NCeCd5pjX5W?=
 =?us-ascii?Q?4epKgeMM+C1b0RpgPO3+PgR9MZn6rkJbrKv94l3I9no80w9ZR5chNgS2XfZs?=
 =?us-ascii?Q?8fh7ip7b9hGOqsoydvjsV13uEumEwsvI8Oysk7cxqWcCo41ICjGAXzHWlfD5?=
 =?us-ascii?Q?GEHKanv+M5lvSYV+cyUNXWbgLY+TQrnq/Gjd2UrTwquLMIMVLexZ2Upl5AT/?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fed75d7-bbff-4eb8-e1a7-08db3d04cd77
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 16:25:04.3230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TDG/hbemViwdaynFf3UE3CVnKOF9R9K8KbRiWdABBlrtRtV3LemiSkBXYl2NQ/RoK3716ZksM8ZaquOSWhYTWpaw0jGrJv0I1KAxKbiFA6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5002
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 0/1] drm/xe: switch to using drm_exec
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Apr 14, 2023 at 12:27:44PM +0200, Francois Dugast wrote:
>This makes Xe use the new drm_exec helpers provided by this series:
>https://patchwork.freedesktop.org/series/114464/
>
>Tested after also applying this patch:
>https://patchwork.freedesktop.org/patch/530670/?series=112994&rev=4
>
>Results look good in IGT tests.

maybe squash the deps as the first patch, making note here the first
patch is only so other people can easily test.... and CI can then
confirm it does in fact look good

Lucas De Marchi

>
>Francois Dugast (1):
>  drm/xe: switch to using drm_exec
>
> drivers/gpu/drm/xe/xe_bo.c           |  22 ++-
> drivers/gpu/drm/xe/xe_bo_types.h     |   1 -
> drivers/gpu/drm/xe/xe_exec.c         |  32 ++--
> drivers/gpu/drm/xe/xe_gt_pagefault.c |  67 +++++----
> drivers/gpu/drm/xe/xe_vm.c           | 217 +++++++++++----------------
> drivers/gpu/drm/xe/xe_vm.h           |  19 +--
> 6 files changed, 159 insertions(+), 199 deletions(-)
>
>-- 
>2.25.1
>
