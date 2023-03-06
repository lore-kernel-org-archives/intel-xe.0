Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012DDC64EC4
	for <intel-xe@archiver.kernel.org>; Mon,  6 Mar 2023 18:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD84110E420;
	Mon,  6 Mar 2023 18:17:41 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2677910E420
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Mar 2023 18:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678126660; x=1709662660;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pSNg5w4R7VsHJuAuMQkfCgOv6lZY7Lo3jsgQS22M3hM=;
 b=REJg2QrLJrSSFDdtdfQVt4eCppQXdUrIyJtG2fUsj6mWyKCGGWfWM9cg
 DwQ04zeO5BTkGqWckStp2YuB4zAM2pVdURS7YO+N8p+VYqalsDdvStWP2
 qKX36y3TkBSXR4cR5eFKTTaCb43oTvDP2t3Kl//XhqNF/ZNDwZ+5auzZ/
 npzvPGuNeW8Hky4L33+8SNcqlZvcPtNRGORmXCZVBbokSJy653VGGd7iC
 Put3fMjdEy1E/LkApdgBJchTq/AXEEwPuGsPme/PqA+Jq8umWDZQUx/R5
 sYV+FIgggVNnQzkPT2LxtK/7KZa9UxdEnzYydEiL/Zr556rDM96fN7nuD g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="363253777"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="363253777"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 10:17:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="786343860"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="786343860"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 06 Mar 2023 10:17:17 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Mar 2023 10:17:17 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Mar 2023 10:17:17 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 6 Mar 2023 10:17:17 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 6 Mar 2023 10:17:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=njVvaMk3ZyPytc78fCaZT6iqKKTKCMga0sitekc+8h3NFfra0cinK1VpKyl4ICIZ5Rlzc6rdaAEafb5NWOGxu9KVauZNyMXN8ybCxRKXqMn6/gBx/m82yRrv5A7hTygm9SX4DuqsIXmFTDqJ4gpypfThS+ZEIsa1bh39X8d2DVaszQDmz50zqFmn7MfosiaNRBxiw2tDn2Gml5rDnysI3eNx9ae5Es4QvT9t8dDORaYiL9SfGyxlX7YZfcYi6ZvyDvWZmv1isHYJj3loF3+0v5uL0CmzNv9eaE5Fn6W3AJkpg5TUVq05vOpKZmoyYni6LbUs9y9HUIe2Oio0svE1qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSNg5w4R7VsHJuAuMQkfCgOv6lZY7Lo3jsgQS22M3hM=;
 b=Hmbof4RAc3/dvNEBbZBD7Guhaz8ppTcZxU2XGGnlASzNn99WLUTlHE+cewwnese6OPAIgWtqMWWuYbbgMOCPFW2keOfiH3Ihpe+S3QzSmKrHtuKAlFvtkKtjHW186yvOlMtU1PcOcVcFtXGSgkj47Iv+9eJLRxL5GgxcpSglrMrSQClRvb+C31y+2ZL66x5pPTYep5fHX7YDhJOikfdmD7jxQ16MdSC8oa1+qk/6kQil3CzfOkWdZOFqTRz/ogoZcX0bNct/6BMpIe3l6GYNourhXg1QwEuL7ZOmpZKBOdkEjlhTCZzW0+gR0+77tjdukrWHwvQqiouwfgz8k6TavQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7895.namprd11.prod.outlook.com (2603:10b6:610:12f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Mon, 6 Mar
 2023 18:17:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%9]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 18:17:14 +0000
Date: Mon, 6 Mar 2023 10:17:11 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <20230306181711.e4lzhgxtwas35s27@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230306175025.720323-1-lucas.demarchi@intel.com>
 <20230306175025.720323-3-lucas.demarchi@intel.com>
 <874jqxu512.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <874jqxu512.fsf@intel.com>
X-ClientProxiedBy: SJ0PR03CA0230.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7895:EE_
X-MS-Office365-Filtering-Correlation-Id: b1f5556f-3b13-423a-2016-08db1e6f02d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I+IAghJc1Pf1mzOFi85r1H2/RB13N2VZQpJURuyjtgKse3pwZAtrDry9qlrelDMMn8K/wDiJlxFTVK0dggCIrKkILK1VuJwwKhrYbMZ54x6UgBt0wnRT7mlxkvOi1oxGAi+IyvH7SKS5JkbnWtjGNuKz/AfceXLG2HbLwidiHmB0tDJOEGTJHKmdL37Xye4++e2ky6/ypXZwmZ9Bo4s2v15ujv1dAmsylE2cBg8E2HF6tUrg76zQjlDXX7rernggJBm040NZ67nrhFNJe9obBSwia/ipEb783yc6zY8mD4gArn8hj6l51g4tB1roIAMntQi9PIcZAU0nqDG9+zg0+x2vuMCGqGX9dv+vliCoO6XfsUXzW5W1fO1tIM91ZEozvvp5n+EDmJ7kVCYYqKrsgciE+bBB5s2UsSC7EwRiVSDApVSwiZoDF9cGxx669OgJ6vsn09mCBRHr40LzhqOieZ9BBv5DkM5mQ9WlFznwgRkDp/awpsg2v9BNUK296mnBI3u363Drn/aNFoZeTkP1ziHqCZxs2zntGBGFqvyu8eIY8T8lpCzltFnrN4La0Fpc/6BQIkIiDmbpyUjXiBw7Zx+jmrccjauRboKCkxZnDbUGk+ZiqblCWUv0GfvLT5FQ2kYEX2QBuUyN6S0UZDsCzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199018)(83380400001)(4744005)(5660300002)(8936002)(2906002)(478600001)(41300700001)(6486002)(26005)(6506007)(4326008)(6916009)(66476007)(186003)(6512007)(8676002)(6666004)(66556008)(66946007)(9686003)(316002)(82960400001)(36756003)(86362001)(38100700002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mixzt32azFzYrCpN8lxibJ4koNhivQj2oRhw7YOgX3g7JDGADiTwQ8eBBEVq?=
 =?us-ascii?Q?WsLcwuAaHqJ+5G4Ps3V4KGh4SXu7LhWzM7KhaEMnPY9wdkhFAWUy80jRdhUJ?=
 =?us-ascii?Q?vC17tILogYvk7WbgVY6dM6iP27QFRmJswqirmtgc0kRtVMKguFfno//rSBe+?=
 =?us-ascii?Q?cx6b08Aar/u4taIDwb7O5uY/gf3ClVGBRpYbs/Fgt9ZrhNY8UliwpL0RpPK7?=
 =?us-ascii?Q?wVXBR6Wti+KZQ5JEqMDIfeV2XM2KRYcv1la+YqNH1mEvYNfnGiPV/4y0DaHe?=
 =?us-ascii?Q?D1NdpJHOIHKM05efz6Qp4/zmM2VcqBYITPaPE8zfBds1UCRRoZGvvw3It3dj?=
 =?us-ascii?Q?wKEUaCzxvXEPkA8hPHezJx0cMfWP0s86NhL2lc9RG5aYxeQtKNjGcLLM7NzA?=
 =?us-ascii?Q?3Btf2SadK0fhcxCpWa2QN9aFXk43Ff5V/yHMZFAfrABGAuzeynbExyQxXokg?=
 =?us-ascii?Q?K44fLcG6BfwUMhZ0aAzy48GlEG3OblAq3xbPWc++zIrIc33JvwXrjOR5nBQ1?=
 =?us-ascii?Q?Os12ckzWkW2dRCfif1EB5GnISvyWapkTkFG0EuslwpBufV1vDo8EwppyrmfJ?=
 =?us-ascii?Q?M4nkwCYu54koCOyXT0/UPiPAwznjymXOFk1ZQVEPZ0fea9ZZX4m6cg4163Kz?=
 =?us-ascii?Q?3HNCMpRqJImIihrljojTnCdyS8TTMvF/iIJj7iK3Epx9qdSQFm8f/MDmn05R?=
 =?us-ascii?Q?tat6AWqHeYDlxZLsMJ3MNMIagd1U5qMz6AfNRVlzjpks9KsmyOOvb5KGe6jJ?=
 =?us-ascii?Q?8uTWmCjfa7ENx5MW+BgEdByvil06yk2Co3ji2H/ivrPQm9fGmR3iqavhKqqX?=
 =?us-ascii?Q?gkB5AvboBpXtA8BNWJMuXF5o0QSjz67SepdIMiCPuHYY+f3jGfJdb1dp82mx?=
 =?us-ascii?Q?xxKDctZvWlZnyUX+0sAi6Ljjd6wj7CYIT41tfuJz8Uysb0GWjNNx+v6Iq9Gb?=
 =?us-ascii?Q?5L+MCAWiGpRf0OandbHqXopCmREsjVL6+p6JZnQG9B4f2IfyLsFfmDMK6FjL?=
 =?us-ascii?Q?NkOBkKo9yGNI5K/NVmIyfYo6O2h8XpNsYZ2BRnmzSfQ2UOtI6TpDOMZJG0oh?=
 =?us-ascii?Q?p8nKOKq4vEIvLwoDozHIedfX6ppmimDL0KPIKuVURlm5Hd3LHTFcdSNFyUXp?=
 =?us-ascii?Q?tKmmbEmapERvTLhExYb97bofDjFzdZVmBvys4doWkIljNsrJrF/28ySzIofu?=
 =?us-ascii?Q?o6pOS7KlWQe+tEtq6nJqM3k0CNVRJboJshqrdpeDSGhh25Ch5dKDivAy8Qc8?=
 =?us-ascii?Q?KfOpPotkmynaiD7Nh+A9EVKSMajMcqk7D72Oxv4+pixaW8JOGD37Z0xyju0N?=
 =?us-ascii?Q?OmdZPTiPwVNoXwwHYZfPZrlobJRfAO3Rts/TFRSx+un0gNJ4cFl4jVENKYUC?=
 =?us-ascii?Q?H3tiAOzQP2yio7mGqe49dj+I67EOIb+NQWZro49UNuJBHkj2ZMVaBq+GGgLC?=
 =?us-ascii?Q?qk1M+ebQlx7E8JPvkt2oaXYLkCJaTXXIfigcrlOt05Yy0CXuZy5XN7gj/KMe?=
 =?us-ascii?Q?dRezUU8BB4suXsrZuRXZcO2yc5tEZmCt31WxrO1v8Lh3qKVETy/j6Vhmi9p8?=
 =?us-ascii?Q?gCLeE6siNpxQ/6hdvZpSRxU0j4npLUfeuI6pAxzTcmhbFaUmi1OiAksh9Q/E?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f5556f-3b13-423a-2016-08db1e6f02d3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 18:17:14.2995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dgx0W1jUhCFEIWZ3TqcmZIfZvy955z4cMbmnPnCD2uAJ7NEJ7wxPLw5yuFBe0sHrQJkOhvGyCTVx+3uR1Zg/ARDIb8KGJkHe8zXnBfe937g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7895
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Constify xe_dss_mask_group_ffs()
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Mar 06, 2023 at 08:08:09PM +0200, Jani Nikula wrote:
>On Mon, 06 Mar 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> Due to how xe_dss_mask_t is implemented, the type is a pointer.
>
>Per coding style, the fact that something is a pointer should not be
>hidden.

I don't like that typedef much neither, but currently there isn't much
option when using include/linux/bitmap.h. The alternative of not using a
typedef would mean the size of the array would need to be encoded
everywhere this is used.

Maybe this commit message needs to be reworded as the issue here is
that the array decays to a pointer when passed as argument to a function.
And the issue being handled would exist regardless of using or not a
typedef.

Lucas De Marchi
