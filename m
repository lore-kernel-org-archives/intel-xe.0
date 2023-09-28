Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629B1CE7AF9
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 04:00:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B50410E5CC;
	Thu, 28 Sep 2023 04:00:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E03F10E5CC
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 04:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695873619; x=1727409619;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=51+gxIY7OvY+RQnBC7IgYXF4iAwCFK2iE+4y1LFbLKE=;
 b=aDEXZ2I6kvl/t2R8r4cPlv4vkKWP9pGOg0FdA79L4XOS8fFHsbpkY4Ag
 7IG/SmxBSZwgjYSpK+I8VvM60nv1lh7TPEHRiSMM5boK//e+8mQpU06xp
 DKZrEXA2P/q65e91ldjRjUGzzoxpiPedClt5U/GhbrWRB+RXkoxKUEZ36
 yCmukxnpJJbsMrH1C3b0u2sTe/lcWt9v11VdM7zjXuE91p2rmMP4u6W1a
 3jQJUz/pxMuduupN4KRq2BZaPDy2KTERA3CMjqAqEoeLQ38Phz8vbrfKD
 1FkdGMichiBbiVmUbrE1MvVsZ+pe09vOkpXRckfhJEn/vTa7yYzAMvm7Z Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="362224157"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="362224157"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 21:00:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="752822473"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="752822473"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 21:00:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 21:00:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 21:00:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 21:00:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jIoMIsnkIBmwT6l5cYbvdYi1VYIlFv+Iz3aGQc+uKsmcA2X1GdByrZjiWo7XuyldetastqgtqMKxTr71tWaZIQrUUdkV1gtkYlyd0wdkLNyjhE5zg+i2MRe5SeCQc7vkjdtFFVDwxq8ESjzHGI2CZIkEvAWks0gDLSI6e+/i9UMdQC5Yuulz+WHlzVVoeY5sjpSY2QNhCxeOEQ6czgwY998ogIaYrGlY56VLnK22ekkKoLNmZNGhZyM6LObkhrtN21P5i37ac57jkOBc5AYZaZqMkO9zwV35MoAoCUYYqc0QbSmOmzOD4J8mU3zS4UJXefi7ZWm6FQ7hMxV5TB+O8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKQGVEVE6Dhu7JqNwk9vIsGfpD/mntPTabtqI7yZOIQ=;
 b=I7rzA9oiAgY8HhtmOaxy5KjIgNwIaVSMKM0ypWbG7oshKcGsiXd/AdND1kQlY4QLTfMTRfwMeoRTWb5Q2LY5lEtsMSmYOQpW6o2GNzrOe1C2jje4SQ/jsHDVUUjdEXb0i2SK77g6el6PZJQEMWj2mPTb4L0Rs8+OmToYoOuRlwA+P/Fs1ds0JJx8W77n31zJNLanRB4BGH6lKDahFDDxzFkHbktRdhwA83SM+FWWyDA2z4SudsKzavZNbA3mldFbRgIm2k1gImoGm+r1ewqF8/Y1zGy7u+JHoAK0RNuzSLJ3+6WXJltn6bSpYJKyKDtNZ8Vqp9Al6XUewPb/B++OnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM8PR11MB5589.namprd11.prod.outlook.com (2603:10b6:8:26::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.20; Thu, 28 Sep 2023 04:00:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%6]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 04:00:15 +0000
Date: Wed, 27 Sep 2023 23:00:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <kzk3d4a4an6xxtndxn3skxleia6jqfwrwe5znma4jzkkitu2gj@svho77shf23p>
References: <20230927193902.2849159-1-lucas.demarchi@intel.com>
 <169584631955.20758.2900463328601223815@emeril.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <169584631955.20758.2900463328601223815@emeril.freedesktop.org>
X-ClientProxiedBy: SJ0PR03CA0240.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM8PR11MB5589:EE_
X-MS-Office365-Filtering-Correlation-Id: e57e1335-3896-4b91-112c-08dbbfd76be6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h0EuYLYryV0P+gDNQK/W/u7Mr08GZ7HN0follS5ghu4WlucDCYh637iwwcHsyHfMi+zF4KJVgsF92Ugx/e+c5l2wMez2vz0cmB13SycbnKyKI6D7BaeCyPNhhE7vBKgzMMJ73MBb31gX/fo75I79SMrcViCeWbs8wn0eBYPYpX3+DRSAK5kHtIigUgPiNqoZQ6HZooHX1e3CN8Iz5NBEG8alvm1EtVeiuVigZN+Pw1w65PP9im49hgfeXWtQUAZauqwSp0IgCs7kvrjVh5/PR1gkQUFm1pocb1vyBys0q5yrpyKuCV5AjWZI+phN5tSDdiKv96sfV6XOjtvPNtFrNm4Z70g3FqtnQU63MfdyCFx3OkMVuiHXM3ShijRWicoIdTf0OcqCcpA846Uf1miare2wqQXoXEDPg5LusZL4ZJTY5BgQh6bCCau1EHb0PjdaR415duJxKBZxhuMw0h6DyQZWeROl0d2k925Kxq6O/eD4evLPBPmJNJdF3vP0wha8Cmlg7MMo6LFUqKrkYMoH3dZmZbNH4ow2hHVnLqZt1uY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(346002)(39860400002)(366004)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(5660300002)(38100700002)(4744005)(33716001)(41300700001)(26005)(82960400001)(86362001)(2906002)(8936002)(6486002)(6666004)(6512007)(9686003)(478600001)(6506007)(6916009)(966005)(66556008)(316002)(66476007)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hxuKx5k+IsK1zw4Sh+5ehmcqGaWEUyM2LRC+BArUQYDnY419eJgxX9uBHqwd?=
 =?us-ascii?Q?8DrSB2xElUlkTD9E0D2mLHZSj1BJBIWougud81wfUO+WZu69ZP3c+p41Lwmc?=
 =?us-ascii?Q?Ms5EI/NodLv7XJGTCsOHTHvtUZKTcQ24INtaFWH+3186T+zHm7R8nMDSALLk?=
 =?us-ascii?Q?YH1iKYhKTZDX2Oez4JeW1bmAdhcp3qUzkAH7WIT5fSWzMQe0U6BV9OP1T3ml?=
 =?us-ascii?Q?NCKed/Wdk9KHMNpklpXpZ9GlXCzkvHDgCYAV1i/mWzftFtrHNpkdns4NFljT?=
 =?us-ascii?Q?4oGORfhTYcxKjE67zdiKB7jgPh3d/J90rCyLZ7xVdk3zaPmfq6HTzofcL5Zm?=
 =?us-ascii?Q?+anp2w8OY1TFfjC7O6JQPhpsrWSif/5yjnDN0grJ+Y2assxoAyeiqxfty2YH?=
 =?us-ascii?Q?1FrsGKxtubObho3tsiDkh+FoM+Tfj05ghXIrZGyAoIfENW3CP4xr8+avtcYe?=
 =?us-ascii?Q?LUeGjURqcApKprLwu7m+haTb1Qb/MAkadCPMGr1b2murYlA/+DcuQGFqKMmu?=
 =?us-ascii?Q?mDFuf/jiy75UcanmihpaABXqMmqChaAM8bmbA5bdRBLtqC6U7E1oT7hCc5X8?=
 =?us-ascii?Q?h8/Y5Lb4EnDfJeHkBfcjLMCrGCemuaAKWKz10Tj1ylHOZ5wqvQySz5fTKOVR?=
 =?us-ascii?Q?P1ciy6mlW/UcsjR01aG5NJdgHcCRhjHqqQWGQNbQ75qRlJ10jAVeo969STcP?=
 =?us-ascii?Q?Sg5GERA+MVk9izLwZ6XqhyH81io5PqhYuu1YBAoKzIMCavLDvd68dgLguyeb?=
 =?us-ascii?Q?OaeupQAjQZrM350jOF3FzBxRDsey3+2kQUR3v0mgqZNP0q6yVs8q/pTvfTXh?=
 =?us-ascii?Q?GTzqS/HCMp6UtqwpTbNZ2EEvw3V0oMTQboHhXiNbUCX1nt8dV1CMVl+viZcJ?=
 =?us-ascii?Q?p68/zZe+1kvRiCzdgHbhxzYqAXmE69ERVnQtjQOdyH44yXevo1MXT+WsIM/7?=
 =?us-ascii?Q?pL5PG6dqpzG3zJzLY7BdEsBIn1SP+vMMIMI9s26Qw9vMQkqbxxwKtKYNBpOs?=
 =?us-ascii?Q?U0QJW9qU/JZ4izHRF7p5sRkpfUFmxQ3p7OhVWydWbKyvtJHJLWf/nfuZbrLd?=
 =?us-ascii?Q?PoS8zVLn0sR+wGSuFfNNqEXlges0p7MZrpZ5E9NVkx84Sczy6GE0Q+2e3BxL?=
 =?us-ascii?Q?YCwSG3w1se6wC3IVbc/KiL7WPaxp51PDK+iMGRaDwg2k4iux9wEUI0D6BrsE?=
 =?us-ascii?Q?Ghkyx5f0P7LZzQWy2uS59MGncG2PUp1o6YqCjO164pCSIXhMRd5j+c7GBykM?=
 =?us-ascii?Q?xmXIi2yyMnZIF2V0Q9ialQuR7FDg2Z+H6DYX8ckbZCVLagMh6BCasXo5PJvw?=
 =?us-ascii?Q?6xQnXje9PQS+iH5ODYoUd8l8M9eKuYi3bSs+b1omxJLfYy4kzXMKpaQ/VYae?=
 =?us-ascii?Q?MAEaiUaZlSyQVIn6OfWfwsAPfj96Lyo2rk+eO3xefrhdGr9+oprBeHWrtRaD?=
 =?us-ascii?Q?Sz+0EK7LJMIOUIn7jnIyt0KxqZV58indgiyVVa57cGK1l1wnOwjJuTiI1jmZ?=
 =?us-ascii?Q?+qs5PdI7yCum8vYUt5dDi9kEHWTLh4vOP+QLCRw/zzvGjMU5+kkVJvw9PTyj?=
 =?us-ascii?Q?xm/L4eqHx0V9tujtxkfsDX5rRubBQgIR+DZOttf2VyullSh/Vmt8hC4ezLhH?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e57e1335-3896-4b91-112c-08dbbfd76be6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 04:00:15.3685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dld4NixG/2r7/CDOS+Hr/XVkabD6gU9vXAf/XXc4SxwTypuycNsefxODL9iR1K399zdBysgl55HyChjZzznZiWGqPKeOtyRvcRJkuOi2XnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5589
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Refactor_?=
 =?utf-8?q?kernel_setting_of_PAT_=28rev3=29?=
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

On Wed, Sep 27, 2023 at 08:25:19PM -0000, Patchwork wrote:
>== Series Details ==
>
>Series: Refactor kernel setting of PAT (rev3)
>URL   : https://patchwork.freedesktop.org/series/124225/
>State : success
>
>== Summary ==
>
>CI Bug Log - changes from xe-397-bce60b0ff2937cb2ea51841a479bc1a2da65052b_BAT -> xe-pw-124225v3_BAT
>====================================================
>
>Summary
>-------
>
>  **SUCCESS**
>
>  No regressions found.

Patches applied. Thanks Matt Roper for the reviews.

Lucas De Marchi
