Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4ECC4332F
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 22:57:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B9410E154;
	Mon, 11 Dec 2023 22:57:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B9B10E154
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 22:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702335454; x=1733871454;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sf3OxmFRE3lkMoTR6LXjwigKHUulFlQZS+AV1+cTqgI=;
 b=oKUgBcPpVIGRY4yETXGi9rgoiye2VmMb2OEIy1eFcZNaFKxDJaFrtPPl
 IDT8+pmlxQMj5wdJYOB6MutIezDmek7fV9Ac8HWpcRKhO+1DqFPofhCKN
 CAnjK9uFoK1ATs6JnoVBv4bnuBsgiN2c8O57XtjtRoz2D7isHLYM7BlCV
 87t5sMTDDgHYf3eRsoWCzplk8cdMTMzXUMlLBminU9BJiateWDJfuU9oQ
 oJTWtDVMLMUu0lAho9RdLJx23xu+VMMmRnq9W34g1lMocRc85CTbW5sYP
 ipXh79vM9ssqkmpMnFs3pVj16yiil6TtBCkitXOvV8roStPhN6thKTGVO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="385134962"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="385134962"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 14:57:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="896661874"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="896661874"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 14:57:16 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 14:57:15 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 14:57:15 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 14:57:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5n4bhH8XxRp4O5/T0T4xePIPkSxr4rlHHAr/bDe5zNLxhosFpSMhTYeTIV690Zhf7T1Ok4qiwRTXpKY934VR1T7x35ctvLkZAt4fsT1L6KPIOs3ArJg29azTGzXKomO1X6fOVdm2QvYznOyOde8QK9qRayjAvkxgFSRQPIW357eVxRKDs4RSh6qkXuST7R/P8ZaDG6XIh75S8UY5eOqNQ8vnXdz3sc/ixhXVLJYhGXvdHOusvBZG4BKw6PQNr50OSYtsCpKCk8jkBXR7zztV1MnbEyIojHWYaMT5RiX3BeGo6mA7aKNmciipmzxUNI34/W8iN20nRpaEH92tdzj7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TL1LcUa9F6YJlPdq5blfF9BJWmINhiBV1CDIYjtexbI=;
 b=hFuBHYycQfD/GuT8Ce4kZxpAVe2suLBPkH45T3TW8LEterVMz3lQLmYc7TQqu6cCEmq5zc7nq889kzUAaWXD+WCB+5t2Rb2AWcjYik17ol5UVF/qDVBOiiVGzvSYmCD9Dyemxj2WPbvT8vlLOvsv+9oCZhsBpjELWbu8b+NUeJrRAtJtECle80hze2lAMUSNIeLoqmQaGhwYTvaueWo0hlQimojsSeAKzrzwAOUUlYsp4UmO8dTLOACoUReiy1YcZxn7q6A5nB1N4COx07wpdlhmh21E9V1O3yvuXWW05ZPgnwzbfEK7VBxrIBHjJdcRMKCkTz56xlJbJAIXrcOvwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB6424.namprd11.prod.outlook.com (2603:10b6:8:c4::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 22:57:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 22:57:13 +0000
Date: Mon, 11 Dec 2023 17:57:09 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [v3 0/2] Add memory sysfs directory and attributes
Message-ID: <ZXeTxQzkD6U2T-Gq@intel.com>
References: <20231207151739.1241374-1-sujaritha.sundaresan@intel.com>
 <20231211224112.GA1327160@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231211224112.GA1327160@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0153.namprd03.prod.outlook.com
 (2603:10b6:a03:338::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB6424:EE_
X-MS-Office365-Filtering-Correlation-Id: 634e6e4d-1fd7-4d19-eccc-08dbfa9c8362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: URr7t3XcOTPd5ijcB9HQ5piBwkoifqytc4V92KROnrDMmbxIMOHWdquCUpBYtkz4KZ3ciApMcVAtr05nNwYenejNzYxNtP6XJKWknxuwDQf5y+QOzmFPQdpwm3x5FWF0MzljYoL+5TpieKNftpB4D76g7rFVQkttqN63yFP/voy4e3T/QUyWtffZ0yl9hFYhEx0ZOsQYhMW/fhKymcXE24dhSXfDBlOAjLcqnlc1xmhrncp9oFnirlwznfHaqhoEiKCzLAEzQoedBkO5jaGA0PKQm537BcfmWJ8e9ZjONjv18ch8K6rR5YA2QSI03ASQHmEu/YlW1Yjhwj4OL5R2yPfNAKaF2FVJaujmc994lp8DNorOjWV92ubh12RGU3mCJwR5LIakIxoXDowxZrew9/cD79I2ZtEXL2CAlwpQz5/kHQwx0Q2QyZ5XU/fV1hFRDLbBx6fxC3NPO260G7flyrBUpk7DgQasmw3wNpM+XYgDMrkR3X3KuiA0pKt6SPnHzOVYET1+tZMJi7YRZHJkfyAHrv7cHL3kzFXNWTVXV/VReIHkS2LWaGG8bOMCego4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(136003)(39860400002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(41300700001)(26005)(83380400001)(2616005)(82960400001)(86362001)(36756003)(38100700002)(44832011)(5660300002)(316002)(8676002)(8936002)(6862004)(4326008)(6636002)(2906002)(6666004)(6512007)(6506007)(66476007)(37006003)(66946007)(66556008)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aesQ+bsXyjaMLY1Cd4nJDlrQ8hrImNH1evq1eF+PJewEThiXsRyXJSHTYo19?=
 =?us-ascii?Q?bxXYMctvrLi890GMuN/bGRMIZt5oU9zyUA1nuSe6kksX6nIDFq3SkZuqY8gC?=
 =?us-ascii?Q?H26cDlMB1JT+g6NDzT7JJlGrIeaYwB0tZiVHPXIc8oYlssW5qjECxQFzpgf+?=
 =?us-ascii?Q?Fee5oixipSDx7hUzGdqhJ6BM7rzHvcO5HHNeG84Ydy+pqkw/h1kmHEMC7wNr?=
 =?us-ascii?Q?IHI/wLLJlWymtQ+pxbkHdFpaJyMCiPZNuJwPfb4DyQXVqLh/9pnw10SCpMzI?=
 =?us-ascii?Q?DJWF9nu1B78kpWPetQMghNVGe8QjnTzQ3xpk8faUcdpx6hCWa3sXEQEjFvIc?=
 =?us-ascii?Q?BHRzl1p5nxOIpbO6SYPwB3aDTcBeCSFp6vEcoX05VeazdkaPYNxNJWOYBOqY?=
 =?us-ascii?Q?eAZ14uyB+Dp5GzSsTc+6AZQkYYYoReEcmIIN6PGe7YguN8xFHlZvhpUDp5Xi?=
 =?us-ascii?Q?1+SDyX4m6SQdWitxyihYEMXxhzBt79AszjIZnQjAr7YuwjQPrEX+c06fgkal?=
 =?us-ascii?Q?2QLD5JNYhvUVsiFqua0yNXSWioimY6yPuHIluiAHrZ0+xR9sQPrqvQpTpTYY?=
 =?us-ascii?Q?Szz9DbkBhKBSByx/g+YnbRV6ffBE4VhKR/5LOd1QEHDLjbzJ5Z1u738HyntA?=
 =?us-ascii?Q?TBuoekxRqDwrmJePLKqKq/QaAbeOFE5j09UYxzdR8TPptEiXqQYW3dCaD5uk?=
 =?us-ascii?Q?JFYf/0bgBlbG2P14S3/kozG14ZrjkcpqBesYSka+6KzChk74rTKXeEOvBCm6?=
 =?us-ascii?Q?80Aoa1R92Dg42+41a9fY7JL+22vaDmd3F6BiGoKDWU0sJdtR48J8Mps5oepp?=
 =?us-ascii?Q?0SXn88RaXtpTE0qk8cfGiitfcXnWHWLAYydZB9Nnsn1+QqSN/73cYFYC3wWi?=
 =?us-ascii?Q?HhtsZJZDtgXtJXI3yV5EMouHZvB1rY+/uuylome1Y516MbmFtxGXV49zWpod?=
 =?us-ascii?Q?Td17AcuMTmXI2JX24vqrHin3tFOQJ+1igeZ5WIyvmfw1nJoKWS8jv4NTIHt6?=
 =?us-ascii?Q?0ughMbbv/ZQ4fpEZUazndFiImPAS58LLK7ddiY/gCw7RsIBsYye19qlJF7CZ?=
 =?us-ascii?Q?OijwRmQIEC4AjTnz0lqxI0zF/XdptwYYbTT8fcGrfoVC4P54qdniw4caHFnS?=
 =?us-ascii?Q?YmhkJERusqTpTCBpJOuyvdcev4z2XqpKJJQaPy3d0VEMkUFewrG8xMM8NctY?=
 =?us-ascii?Q?yiZaPUp4yltPMQ0ygpSo7RfcBU4MJq3z2aztbQid6vAGchSYij64vkRjk997?=
 =?us-ascii?Q?x9fC6jABYv4ifwoypIHYLgXRDltDYSuGJDleKjM1bUNGZ6xxU78mtvA1y95W?=
 =?us-ascii?Q?0n1D4hXBek71RfhU5C0e9Hcy55z4FI38iNbSgiYhOJZlW4wXC/KyEOFDWk2i?=
 =?us-ascii?Q?zgsi0YkqtqfLg//mgQ7CJ4qn6/P/ufPUVMFvv6qworRT2YorY1Q+T6vWzkRo?=
 =?us-ascii?Q?HXDZJUbXlBnuJvrL8+bUedVp+jn5UR8W/L3mM7AeSyco9k6IKkouba4ssmJt?=
 =?us-ascii?Q?uZ0+chZMh7cFFmeBQccGJM9/SqmB0nnZenQCY6kJiNwbybDtltbl3hqs4uO0?=
 =?us-ascii?Q?J1FZVMJt6yKfNveZwoW/Ihx5defcqiSLof3yJ7CG1AmR0G3LJ7JjP0UefW9N?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 634e6e4d-1fd7-4d19-eccc-08dbfa9c8362
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 22:57:13.2339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bGMzitArsPeXLYI6knGiGAgyXO5tevnHa1o92eNPeV4JPc09Tn9XcJeNWaOXg8kYFTyqekUyYmKiaDa08BEZkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6424
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Dec 11, 2023 at 02:41:12PM -0800, Matt Roper wrote:
> On Thu, Dec 07, 2023 at 08:47:37PM +0530, Sujaritha Sundaresan wrote:
> > Create another layer of sub directories to clean up memory/vram
> > related sysfs path. Additionally, introduce the vram frequency sysfs 
> > under a the new path.
> 
> What's the userspace consumer of this uAPI?  How will this wind up
> getting used in a real-world software stack?  Isn't stuff like the
> memory size already returned via the query interface?

Please notice that this is more for frequency management, nothing related
to the UMD information that we expose in the ioctl queries.

Like every other sysfs interface, it doesn't actually matter what wrapper
ends up using it. In general they are for system administrators to tune
the hardware, so we just need to ensure that it makes sense, it is clean
and something we will be able to maintain long term without breaking
compatibility.

> 
> 
> Matt
> 
> > 
> > Sujaritha Sundaresan (2):
> >   drm/xe: Add a new memory directory under tile
> >   drm/xe: Add vram frequency sysfs attributes
> > 
> >  drivers/gpu/drm/xe/xe_pcode_api.h  |   8 +++
> >  drivers/gpu/drm/xe/xe_tile_sysfs.c | 101 +++++++++++++++++++++++++++--
> >  2 files changed, 104 insertions(+), 5 deletions(-)
> > 
> > -- 
> > 2.25.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
