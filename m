Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552E5D31A0E
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 05:33:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0532B10E127;
	Wed, 14 Jan 2026 05:33:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e+GBXoC9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50FB10E127
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 05:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768368801; x=1799904801;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=emMTY9AY4FE+pRPcflx007XC/ds/XfwsUFxeklGlvDM=;
 b=e+GBXoC9FAH1u6JnfX+KPMCJqR2hBDkWBOPnITpoL+ac8Dpc6Wwn6rEX
 YJt66BixJmAGxT8BEzxEF8EZ2uIZ8r9H1ImKLL43huW2kud/et6M5O70H
 6O/Mh6i9hkVoySSok+4/MyERURNQaFuJT3cLocb+qJsY+UjUppWwz5feW
 8mkGEfxkWYsvuLvjFQ+gjc43iwYhGgbzaJD/9sKtOdB7Iyp0thkRIqcHu
 VvqoA1YMhJpMAO4hzPzklX9onj3oMzkFh86yXWzvd917obyrzsWOfLiBh
 ETQ6Rb/1y9R+cE+vzjCbzBsy9+wK3l4/BhLm/02qI2YvIbUjwBKo7y4AM Q==;
X-CSE-ConnectionGUID: IwkylSzoSheBjOiK7Z2nsg==
X-CSE-MsgGUID: FbWuDMyqRTyXMwmYrl9CPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80312257"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="80312257"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 21:33:21 -0800
X-CSE-ConnectionGUID: uLSIG/siRvaF5lfI5xR5yQ==
X-CSE-MsgGUID: tuXlb/KBSBquaUQK9qCiqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="209095761"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 21:33:21 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 21:33:20 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 21:33:20 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 21:33:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RIRm3fGsZy9LwXBSn4JHvBQpf4mphQeh03/44qGMdNt70OxphfSEFNiKzBbm7wke4USyhOi+xmvuJpMQ7rTRZZ7fgiq75183rb6/I0sIDnnOBgVeyVYBArpEOK+OCXy5h6IsrLXwsh4A8EBnfdcL91n69Vl3+NocF66xHdDo4me3pKc7OulaeGr4MpNUNEPw4bq4M6NAil0//f4DVzYGseN1kVjRPZpn09zIYWJAAd65iYEVFhgclHQcYj1bj24vxjyLIA6wyop1qXCoCahNU+txQd/+BfzUK/azV1i0Wv0x56mfDKypim+G6C5NWyRUJlFAixlDMtYEoreSRzf8Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xsrEiJElRjQCIYpH+QlLYjdOCr3QLx/dXD+Tj8+cQvc=;
 b=VbqbPHS81yr0fx/0MIIAqwxA2YygGsZ/T6twWBaDGpUsM5SZJBQVfBhZ7lZ/gY1NaCb4MuhoAIjiFL7TlNwACbuaVkDU1arrhKoQlFzIYqThBHEq4Kwk4JKSQ01d1s/TAJXIAk0Cge5OS10xvK4itR1l86Wo6Jl73OUYVuRgDsPBcCOZMxhSQJU3Bmc0UNnsOpSfpra3PDW5gCSCKoVmTHM2rbvkN+iRyG7xKTyNqY1kqW6W1IerbwJJrzV3xqc/RaBMYRcqfp2eS8cvUzdK6Fw2D8gI90LmgUsbL96t3ZiUnJgbuY/ky7fm1fmnwjc7+qkrqWH0mkn7DsxFiB62Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH3PPFF1A08ABF9.namprd11.prod.outlook.com (2603:10b6:518:1::d5f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 05:33:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Wed, 14 Jan 2026
 05:33:17 +0000
Date: Tue, 13 Jan 2026 21:33:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 00/79] Cleanup unused headers reported by clangd
Message-ID: <aWcqm1/R9ZQNOca/@lstrano-desk.jf.intel.com>
References: <20260113230315.3081153-81-matthew.d.roper@intel.com>
 <aWbe/6D9Fvmg9rzi@lstrano-desk.jf.intel.com>
 <20260114003608.GF458797@mdroper-desk1.amr.corp.intel.com>
 <aWcRi7SOBeZYQB/r@lstrano-desk.jf.intel.com>
 <aWcjgZ3zA-xPlexC@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aWcjgZ3zA-xPlexC@black.igk.intel.com>
X-ClientProxiedBy: BY5PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH3PPFF1A08ABF9:EE_
X-MS-Office365-Filtering-Correlation-Id: 47e6034d-2710-41a7-b13c-08de532e6bbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fjK7YjpH1Q6oK3yP78xZ2DcUGxhipSc/Gqga8CwqWo9Ggw3D1BqwlwgO9vS2?=
 =?us-ascii?Q?aFJ03EO6N/3EWtj0Ct55BBaWdbjPZeiNUb0MNolfHRD2cV/rZAAzq9j30Ibj?=
 =?us-ascii?Q?9YUYpU4hOncWQIJFbb0fpaOTTAD39hpklS8g9HZeHVTPbOzJxW1wvCHkUK/S?=
 =?us-ascii?Q?N61OTm58SpCfGdIvfvJgnheOhQ7OrtVJcN9hSAn6StK1VaQ1wzAMUPpCF6YO?=
 =?us-ascii?Q?ZB5TcX0uCU6TmXseLJAn49tBrGUo7vHD0l+YuVDAlLh2IKB8q2K+W1LkfUn5?=
 =?us-ascii?Q?UUywuHS5mvRQGCAY0C+fk5OeaSYuABD3IKNvdcBlXpPIabcR/kHy2B6C+Rwi?=
 =?us-ascii?Q?arcUCD43YCEjfly7tKCbBM1dPPWNgqPpBRCIzuQ6tf5tXhU19gGgfoTbl228?=
 =?us-ascii?Q?a0EH77l/xN6mFy/16lXZvhiqS8zjB1OpWijTPrAtfjdZz6zzRBH8VjimTQqK?=
 =?us-ascii?Q?91PatOWq9hiFyj+4JX9qOUyZEotD3AE6l0sb/jAmulk+tOoGOut7/X/QDqWY?=
 =?us-ascii?Q?AFF7YEW4kwMXTugY7dPYCTN1JJaEEwp7IuXsLyDNuUModmn/yieS45yMxpom?=
 =?us-ascii?Q?2XpZbHzyuO/dbALyGQQdOBIiyjWyUxbiZR8tlg/hb/hz+nY1GHdw4guS9WKv?=
 =?us-ascii?Q?YK5Z/o2gFZ6ctlKkAsLJewWyAGDM/fotPcnrNc5rUCDYgt8QoF2v13pNib9I?=
 =?us-ascii?Q?d8NCjVsorrezk4SbTMtOyuD40JVy/Z23pt3giqiM5t3zshugvUqdGHYAuj3J?=
 =?us-ascii?Q?tcf9xBMtiGUSyB9MXDYkBvDMdgDBQOfmtuNJv5pLUIbdamiPRqp8q+DczqsJ?=
 =?us-ascii?Q?937/gDOw9eeyBKQwlfOITUlg9EqaEXnlWuPD/ALAIgT6sp4oiGIxgqeJHMr/?=
 =?us-ascii?Q?tQRtU5xN7doRAFodXw2je+jZxca2BQ+xctfG7M2oXUa/EWZV6aGY9hwkh0+R?=
 =?us-ascii?Q?8GwljgmS+4bsAV0RmAe4fxqTc2/VfBj6PrBojgGdzSE7SCQ/MxDdVB/cMGV9?=
 =?us-ascii?Q?eNxpT1fyX6Dx+3SjRCVs9HpZZa26Vs2RJytkZ/ytbORorGH9qHdmonWJ8N1i?=
 =?us-ascii?Q?wV5BTihtc0HngAfjT9e3AQ1ivTpYzpWB5E/GUNnUdOe79vTzh9IE+JMU4ZVV?=
 =?us-ascii?Q?bWCip+V+r413pJCiu7kT5jmsEts7aBoWDA1fVB7jxfd19FxAW9Gwa5E7M0Nr?=
 =?us-ascii?Q?PUaE6ntCMarrDCYpGcmKdrtsiBC2wP6+79SgR9nbCvPEUDUU3w+W5M44p1aC?=
 =?us-ascii?Q?Zgo/TkOdWZuU1ryGrHg9X4I6UVsYVzOq/xXjNZV/Pz24vJ2KxmD+sNbCOIe+?=
 =?us-ascii?Q?uz3C7qp199FvN0D5TJESutSQKE6KJNv6TkweV9Y6ms1+4metBEM/Cs7xuzeg?=
 =?us-ascii?Q?SkT/G0hvAdJk3m05gNP/E94ReSHteMfcKJzCsUuTaUYe6HmGIg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?17MfKa+wh3h3XgPD+y0wnSzcn5heYaZeWqK1upfVjxOPeDTYy/1D3Ubbzo6Z?=
 =?us-ascii?Q?JNMZ35Pbn0W1ujd4+8QCwhpLgF2KxRj5ptZS4DZNuhtW96CuCxunjZXWHfVM?=
 =?us-ascii?Q?fulc+xT1qUVfnnGuDzEkALWjtMS5uvjuqpHPjUocORw9Yh4n8pBxjdGIW2Bb?=
 =?us-ascii?Q?GxmqaeWUurwkxRpUkZbiWPkbnw+L6URCwpSRuRKi73e4tfAGhqZT0vMSR7/O?=
 =?us-ascii?Q?B9WaMIhJs0c86MHNZT4CcDg4dQEM1Zo9XYtSTtH6M8BM1howOSlEUssrbzuY?=
 =?us-ascii?Q?AFWAbWkisjWXuVJS49PnqkMsU2ObzeQvYQ8KgPSNF/bAtQX05wfpSaGSfZSz?=
 =?us-ascii?Q?oInQXQHk3rrB2XPCZZQ0A7ETAaAIinvYKQ77V8aUATPGVyb4IKKwPza8GhN1?=
 =?us-ascii?Q?usEJadAqTPEErH+61ow74Ig9WtFYxelAXf73ND6CXGnDBWFWdJUXtKP0JIon?=
 =?us-ascii?Q?GDdPU04d6FkKG+s1TuzITqzH8gLOSUqbWQeBXwSEtIi2whfhNCGKz0vFktjN?=
 =?us-ascii?Q?y82uvDMbylhNA0/6JFaqEWXQ/4/BhcXoQCYbv2YFayEvJDmmx7PC6r5aIx94?=
 =?us-ascii?Q?MyzlgUem+7GP6JZtziITDqCLz3audKTWboJP4P96FgUudnNj+VZcxG4uNOxF?=
 =?us-ascii?Q?7m89vVgVE2dOgStGq8zixYr2LhAfNgPkTGXFteH/kkYJZ5ERtxEIpcUYDaEb?=
 =?us-ascii?Q?rEHr1TMhMqAfrgfQ4CMW4xsfUcRxdfGiOjoa5ikntLbZq1E/TCg2b1ZKp/7A?=
 =?us-ascii?Q?LliwTqz3R07UDij8QXtOThbJS/kPI+2f8uqgCTcOlccndjkJc3COssB0KJin?=
 =?us-ascii?Q?mp+RI1gaaYW5NZtLbXQwoq8a4cgA5g32knsEApUu/bvTSuI6X7VeYANYHXUO?=
 =?us-ascii?Q?Yf2nLIkDYKhE9EWNNyaKHQgjEwn6RdMu1WdXrd5gmQQxQhKLyqKQhThXggTz?=
 =?us-ascii?Q?9VgtAteyTj1N7AJQB5FGbgD28ye/UVCdYLYuoutOooLRNxct3OkdRG60r1A3?=
 =?us-ascii?Q?QQb/9h1CjgfFS35tY3fep5F55eXyPQda9bQAQFS/Cp2eSAEViUH1qB6tSZ7c?=
 =?us-ascii?Q?COnJtfzUD+V+6pae6Gsyz1JRn+iFSw4eNv8acUE6JAzPiwHoiQcD44Q6azC+?=
 =?us-ascii?Q?gnAEypMhOLv13SEE/rXqSMQ2JBCiYLPUlVaU0cvM/947ZZAVqCExo1TV+CUx?=
 =?us-ascii?Q?ohKjXjE59bB/jBVG1wvQjs1sgLMbBjF2VBdSvriF/z3zTk/GV1PCSPJDRBeO?=
 =?us-ascii?Q?vRZCH8T76c0ozg3hvZ9wRQHfibgXDPHc6xKdluvGTChQZAZVoS4dPSRJbj7C?=
 =?us-ascii?Q?LxLRG8ClG3L1K5Qcr+pUNTaw0hddB2OE8HnlXSFuEe4K/H25P7AGMRLnCxvQ?=
 =?us-ascii?Q?mnLMQrsyjs2HTRmV+hokiwk2B7JFTjeTLRTKWFv/mfymdCx2YI6gBJdQ23W4?=
 =?us-ascii?Q?8ldRmLpiyy595IyPM0nA6lBx8+ao3oI3yG4vVRTV45QBYGVGGjCYlNtIINZX?=
 =?us-ascii?Q?Og0eXksTU7lr3d+u09G+2ftw9RZRHAYekP6sxAHQ19L1b5xJWGaBvvmtOh28?=
 =?us-ascii?Q?swTGrLqvKhQoMjM8J8QA9dtvlGWArXZvio2gnT9qWvdNAovsO95FenSDwSRX?=
 =?us-ascii?Q?LkpWrKznuu8TdWU7KjfcTnpQfuZOW1EkA8HnRSb3KK07SMD4qZXR3d/iGq9T?=
 =?us-ascii?Q?uRFhmq1kdAmys8OAG/XN3a/Qz9e63Ai9LswaOcWtCspo5S0pgg7/19kqpsA/?=
 =?us-ascii?Q?FHpOzY6NnCwYENySHIzaAx9XnFcS1ok=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e6034d-2710-41a7-b13c-08de532e6bbb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 05:33:17.6056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v2J86MJZqTONTXMNLAZjJcx4JJl9NeprOoODB26nr7hT/tmcR8dFg+nqszH2bC/Z+/pqzASFWvpVunxfbGtJiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF1A08ABF9
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

On Wed, Jan 14, 2026 at 06:02:57AM +0100, Raag Jadav wrote:
> On Tue, Jan 13, 2026 at 07:46:19PM -0800, Matthew Brost wrote:
> > On Tue, Jan 13, 2026 at 04:36:08PM -0800, Matt Roper wrote:
> > > On Tue, Jan 13, 2026 at 04:10:39PM -0800, Matthew Brost wrote:
> > > > On Tue, Jan 13, 2026 at 03:03:05PM -0800, Matt Roper wrote:
> > > > > clangd[1] helpfully flags #include's of headers that aren't being
> > > > > directly used by the file including them.  In most cases we can either
> > > > > drop those #include statements or replace them with a more targeted
> > > > > include (such as xe_gt.h to xe_gt_types.h).  Let's drop/simplify a bunch
> > > > > of the unnecessary includes in our driver's .c files; this may help
> > > > > speed up partial rebuilds for developers since the build system won't
> > > > > see as many false dependencies.
> > > > > 
> > > > 
> > > > Yes, header situation isn't great.
> > > > 
> > > > > There's more header-related cleanup that could be done (e.g., some of
> > > > > our headers incorrectly include other headers they don't need), but that
> > > > > can wait for a follow-up series; this one is already long enough.
> > > > > 
> > > > > 
> > > > > [1] https://clangd.llvm.org/
> > > > > 
> > > > 
> > > > Once we get the headers into better shape can we get clangd in CI?
> > > > Without that a year from we will need another huge series of fixes to
> > > > undo all the mistakes we've made in the last year.
> > > 
> > > clangd is a language server intended to talk to plugins in editors
> > > (e.g., I just set it up in neovim); I don't think clangd specifically
> > > can be used in a CI-like setup.  However clang-tidy is a standalone lint
> > > tool that I think could be configured to print out the same kinds of
> > > warnings (the "misc-include-cleaner" check seems to be the one for this
> > > case), although I haven't tried it myself.
> > > 
> > 
> > Ok - for the series:
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > I'd personaly prefer this squashed into one patch as 79 patches is a
> > lot, maybe Rodrigo, Thomas, Dave, and Sima have a different preference?
> 
> Our CI doesn't test for other archs and we might risk breaking upstream
> builds.
> 

That's a good point which I didn't consider. I believe there are lists
which will pick up other archs / kernel test robot though. I do think
the risk is quite low of breaking other builds though given these are Xe
related clean ups - once you start messing with core header that have
platform defines it gets risker. Also if we break something - not say we
should aim for that - community will step in and send us fix.

Matt 

> I tried to dive[1] into some core headers but the situation seems
> impossible now. So fully agree, better to clean-up before the debt
> piles up.
> 
> [1] https://lore.kernel.org/dri-devel/2342b516-2c6e-42e5-b4f4-579b280823ba@app.fastmail.com/
> 
> Raag
> 
> > > > > Matt Roper (79):
> > > > >   drm/xe: Cleanup headers in xe_bb.c
> > > > >   drm/xe: Drop unused header in xe_bo.c
> > > > >   drm/xe: Cleanup headers in xe_devcoredump.c
> > > > >   drm/xe: Drop unused header in xe_device.c
> > > > >   drm/xe: Drop unused header in xe_exec.c
> > > > >   drm/xe: Cleanup headers in xe_execlist.c
> > > > >   drm/xe: Drop unused headers in xe_exec_queue.c
> > > > >   drm/xe: Simplify headers in xe_ggtt.c
> > > > >   drm/xe: Cleanup headers in xe_gsc_debugfs.c
> > > > >   drm/xe: Simplify header in xe_gsc_proxy.c
> > > > >   drm/xe: Drop unused headers in xe_gsc_submit.c
> > > > >   drm/xe: Drop unused headers in xe_gt.c
> > > > >   drm/xe: Cleanup headers in xe_gt_clock.c
> > > > >   drm/xe: Drop unused header in xe_gt_debugfs.c
> > > > >   drm/xe: Drop unused header in xe_gt_idle.c
> > > > >   drm/xe: Drop unused header in xe_gt_mcr.c
> > > > >   drm/xe: Drop unused headers in xe_gt_sriov_pf_config.c
> > > > >   drm/xe: Drop unused header in xe_gt_sriov_pf_debugfs.c
> > > > >   drm/xe: Simplify header in xe_gt_sriov_pf_migration.c
> > > > >   drm/xe: Drop unused header in xe_gt_sriov_pf_policy.c
> > > > >   drm/xe: Cleanup headers in xe_gt_sriov_pf_service.c
> > > > >   drm/xe: Drop unused header in xe_gt_sriov_vf.c
> > > > >   drm/xe: Simplify header in xe_gt_stats.c
> > > > >   drm/xe: Simplify header in xe_gt_sysfs.c
> > > > >   drm/xe: Simplify header in xe_gt_throttle.c
> > > > >   drm/xe: Drop unused headers in xe_guc_ads.c
> > > > >   drm/xe: Drop unused header in xe_guc_buf.c
> > > > >   drm/xe: Cleanup headers in xe_guc_capture.c
> > > > >   drm/xe: Cleanup headers in xe_guc_debugfs.c
> > > > >   drm/xe: Simplify headers in xe_guc_hwconfig.c
> > > > >   drm/xe: Simplify header in xe_guc_log.c
> > > > >   drm/xe: Cleanup headers in xe_guc_relay.c
> > > > >   drm/xe: Drop unused headers in xe_guc_submit.c
> > > > >   drm/xe: Drop unused header in xe_heci_gsc.c
> > > > >   drm/xe: Drop unused header in xe_huc.c
> > > > >   drm/xe: Clean up headers in xe_huc_debugfs.c
> > > > >   drm/xe: Drop unused header in xe_hw_engine.c
> > > > >   drm/xe: Simplify include in xe_hw_engine_class_sysfs.c
> > > > >   drm/xe: Simplify include in xe_hw_engine_group.c
> > > > >   drm/xe: Cleanup headers in xe_hw_fence.c
> > > > >   drm/xe: Cleanup headers in xe_i2c.c
> > > > >   drm/xe: Drop unused header in xe_irq.c
> > > > >   drm/xe: Drop unused headers in xe_memirq.c
> > > > >   drm/xe: Drop unused headers in xe_mmio.c
> > > > >   drm/xe: Drop unused headers in xe_mocs.c
> > > > >   drm/xe: Simplify include in xe_module.c
> > > > >   drm/xe: Drop unused header in xe_nvm.c
> > > > >   drm/xe: Drop unused headers in xe_page_reclaim.c
> > > > >   drm/xe: Drop unused header in xe_pci.c
> > > > >   drm/xe: Simplify include in xe_psmi.c
> > > > >   drm/xe: Drop unused header in xe_pxp.c
> > > > >   drm/xe: Simplify header in xe_pxp_debugfs.c
> > > > >   drm/xe: Cleanup headers in xe_reg_sr.c
> > > > >   drm/xe: Drop unused headers in xe_reg_whitelist.c
> > > > >   drm/xe: Cleanup headers in xe_ring_ops.c
> > > > >   drm/xe: Drop unused header in xe_rtp.c
> > > > >   drm/xe: Simplify header in xe_sa.c
> > > > >   drm/xe: Simplify header in xe_sched_job.c
> > > > >   drm/xe: Drop unused header in xe_sriov_packet.c
> > > > >   drm/xe: Drop unused header in xe_sriov_pf_debugfs.c
> > > > >   drm/xe: Drop unused header in xe_sriov_vf.c
> > > > >   drm/xe: Cleanup headers in xe_step.c
> > > > >   drm/xe: Drop unused header in xe_survivability_mode.c
> > > > >   drm/xe: Cleanup headers in xe_tile.c
> > > > >   drm/xe: Cleanup headers in xe_tlb_inval.c
> > > > >   drm/xe: Drop unused header in xe_ttm_stolen_mgr.c
> > > > >   drm/xe: Drop unused header in xe_ttm_sys_mgr.c
> > > > >   drm/xe: Drop unused header in xe_ttm_vram_mgr.c
> > > > >   drm/xe: Drop unused headers in xe_uc.c
> > > > >   drm/xe: Cleanup headers in xe_uc_debugfs.c
> > > > >   drm/xe: Simplify header in xe_uc_fw.c
> > > > >   drm/xe: Drop unused header in xe_validation.c
> > > > >   drm/xe: Drop unused header in xe_vm.c
> > > > >   drm/xe: Drop unused headers in xe_vram.c
> > > > >   drm/xe: Drop unused header in xe_vram_freq.c
> > > > >   drm/xe: Drop unused header in xe_vsec.c
> > > > >   drm/xe: Simplify header in xe_wa.c
> > > > >   drm/xe: Drop unused header in xe_wait_user_fence.c
> > > > >   drm/xe: Simplify header in xe_wopcm.c
> > > > > 
> > > > >  drivers/gpu/drm/xe/tests/xe_bo.c              | 1 +
> > > > >  drivers/gpu/drm/xe/xe_bb.c                    | 3 +--
> > > > >  drivers/gpu/drm/xe/xe_bo.c                    | 1 -
> > > > >  drivers/gpu/drm/xe/xe_devcoredump.c           | 3 +--
> > > > >  drivers/gpu/drm/xe/xe_device.c                | 1 -
> > > > >  drivers/gpu/drm/xe/xe_exec.c                  | 1 -
> > > > >  drivers/gpu/drm/xe/xe_exec_queue.c            | 2 --
> > > > >  drivers/gpu/drm/xe/xe_execlist.c              | 3 +--
> > > > >  drivers/gpu/drm/xe/xe_ggtt.c                  | 3 +--
> > > > >  drivers/gpu/drm/xe/xe_gsc_debugfs.c           | 5 ++---
> > > > >  drivers/gpu/drm/xe/xe_gsc_proxy.c             | 2 +-
> > > > >  drivers/gpu/drm/xe/xe_gsc_submit.c            | 2 --
> > > > >  drivers/gpu/drm/xe/xe_gt.c                    | 2 --
> > > > >  drivers/gpu/drm/xe/xe_gt_clock.c              | 6 +-----
> > > > >  drivers/gpu/drm/xe/xe_gt_debugfs.c            | 1 -
> > > > >  drivers/gpu/drm/xe/xe_gt_idle.c               | 1 -
> > > > >  drivers/gpu/drm/xe/xe_gt_mcr.c                | 1 -
> > > > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 2 --
> > > > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   | 1 -
> > > > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 2 +-
> > > > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 1 -
> > > > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c   | 5 ++---
> > > > >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 1 -
> > > > >  drivers/gpu/drm/xe/xe_gt_stats.c              | 2 +-
> > > > >  drivers/gpu/drm/xe/xe_gt_sysfs.c              | 2 +-
> > > > >  drivers/gpu/drm/xe/xe_gt_throttle.c           | 2 +-
> > > > >  drivers/gpu/drm/xe/xe_guc_ads.c               | 2 --
> > > > >  drivers/gpu/drm/xe/xe_guc_buf.c               | 1 -
> > > > >  drivers/gpu/drm/xe/xe_guc_capture.c           | 5 +----
> > > > >  drivers/gpu/drm/xe/xe_guc_debugfs.c           | 5 ++---
> > > > >  drivers/gpu/drm/xe/xe_guc_hwconfig.c          | 4 ++--
> > > > >  drivers/gpu/drm/xe/xe_guc_log.c               | 2 +-
> > > > >  drivers/gpu/drm/xe/xe_guc_relay.c             | 3 +--
> > > > >  drivers/gpu/drm/xe/xe_guc_submit.c            | 2 --
> > > > >  drivers/gpu/drm/xe/xe_heci_gsc.c              | 1 -
> > > > >  drivers/gpu/drm/xe/xe_huc.c                   | 1 -
> > > > >  drivers/gpu/drm/xe/xe_huc_debugfs.c           | 5 ++---
> > > > >  drivers/gpu/drm/xe/xe_hw_engine.c             | 1 -
> > > > >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 2 +-
> > > > >  drivers/gpu/drm/xe/xe_hw_engine_group.c       | 2 +-
> > > > >  drivers/gpu/drm/xe/xe_hw_fence.c              | 4 +---
> > > > >  drivers/gpu/drm/xe/xe_i2c.c                   | 4 ++--
> > > > >  drivers/gpu/drm/xe/xe_irq.c                   | 1 -
> > > > >  drivers/gpu/drm/xe/xe_memirq.c                | 2 --
> > > > >  drivers/gpu/drm/xe/xe_mmio.c                  | 4 ----
> > > > >  drivers/gpu/drm/xe/xe_mocs.c                  | 2 --
> > > > >  drivers/gpu/drm/xe/xe_module.c                | 2 +-
> > > > >  drivers/gpu/drm/xe/xe_nvm.c                   | 1 -
> > > > >  drivers/gpu/drm/xe/xe_page_reclaim.c          | 4 ----
> > > > >  drivers/gpu/drm/xe/xe_pci.c                   | 1 -
> > > > >  drivers/gpu/drm/xe/xe_psmi.c                  | 2 +-
> > > > >  drivers/gpu/drm/xe/xe_pxp.c                   | 1 -
> > > > >  drivers/gpu/drm/xe/xe_pxp_debugfs.c           | 2 +-
> > > > >  drivers/gpu/drm/xe/xe_reg_sr.c                | 5 +----
> > > > >  drivers/gpu/drm/xe/xe_reg_whitelist.c         | 1 -
> > > > >  drivers/gpu/drm/xe/xe_ring_ops.c              | 4 +---
> > > > >  drivers/gpu/drm/xe/xe_rtp.c                   | 1 -
> > > > >  drivers/gpu/drm/xe/xe_sa.c                    | 2 +-
> > > > >  drivers/gpu/drm/xe/xe_sched_job.c             | 2 +-
> > > > >  drivers/gpu/drm/xe/xe_sriov_packet.c          | 1 -
> > > > >  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 1 -
> > > > >  drivers/gpu/drm/xe/xe_sriov_vf.c              | 1 -
> > > > >  drivers/gpu/drm/xe/xe_step.c                  | 3 ++-
> > > > >  drivers/gpu/drm/xe/xe_survivability_mode.c    | 1 -
> > > > >  drivers/gpu/drm/xe/xe_tile.c                  | 3 +--
> > > > >  drivers/gpu/drm/xe/xe_tlb_inval.c             | 7 ++-----
> > > > >  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        | 1 -
> > > > >  drivers/gpu/drm/xe/xe_ttm_sys_mgr.c           | 1 -
> > > > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          | 1 -
> > > > >  drivers/gpu/drm/xe/xe_uc.c                    | 2 --
> > > > >  drivers/gpu/drm/xe/xe_uc_debugfs.c            | 2 +-
> > > > >  drivers/gpu/drm/xe/xe_uc_fw.c                 | 2 +-
> > > > >  drivers/gpu/drm/xe/xe_validation.c            | 1 -
> > > > >  drivers/gpu/drm/xe/xe_vm.c                    | 1 -
> > > > >  drivers/gpu/drm/xe/xe_vram.c                  | 2 --
> > > > >  drivers/gpu/drm/xe/xe_vram_freq.c             | 1 -
> > > > >  drivers/gpu/drm/xe/xe_vsec.c                  | 1 -
> > > > >  drivers/gpu/drm/xe/xe_wa.c                    | 2 +-
> > > > >  drivers/gpu/drm/xe/xe_wait_user_fence.c       | 1 -
> > > > >  drivers/gpu/drm/xe/xe_wopcm.c                 | 2 +-
> > > > >  80 files changed, 45 insertions(+), 129 deletions(-)
> > > > > 
> > > > > -- 
> > > > > 2.52.0
> > > > > 
> > > 
> > > -- 
> > > Matt Roper
> > > Graphics Software Engineer
> > > Linux GPU Platform Enablement
> > > Intel Corporation
