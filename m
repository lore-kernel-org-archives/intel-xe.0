Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06993C55166
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 16:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE82510EFEA;
	Thu, 30 Jul 2026 16:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="csrWPJqR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9413D10EFDE
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 16:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785428878; x=1816964878;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8Ypm56zJFBOVmlT15RQlG85Q1RD0EFp6uW0qNDDB7fc=;
 b=csrWPJqRrbDWec413gDCuG7Iugin2mzbn6DY3C/8pTNGZql5/MKNHOgz
 uIv7lZiFktwRn0TwHAp2yZZc7SgA/j33nlGPaXIjecv39Xt/c4T5V5fj1
 4PBYlqD2m997PiBUNIKCMfLBkc1Ve3HfxYwCWA3ZC4hUg3OLEOG45lvjX
 NTTOei5QmjwFnpzhobSDMWs0/folgCuYqLXr26SW2lbTAvEOUhB/MFAXv
 kgS6FH+r3bIUd0b6o6OMSY7Sd8S6uLbFtRl/0kA9+7D1l8Xsj4V2Z7puU
 xf7pE73VhfxRTto7xPTTfrbwMaJRJAAhAtaQGvXjUJ3Yhem3fKDiCPkl+ Q==;
X-CSE-ConnectionGUID: nqVSev/aQhah5BAFkubKCw==
X-CSE-MsgGUID: uID0dAMwQNOGmqgSAm9m7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86068648"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="86068648"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 09:27:58 -0700
X-CSE-ConnectionGUID: /Xw0yf8fQPSrQjFAC/IQ5Q==
X-CSE-MsgGUID: nvskyO2YS2+bOZD8NqjHzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="260404716"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 09:27:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 09:27:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 30 Jul 2026 09:27:57 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 09:27:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oFq19VoY/JySyZqfhHpOE3nMqlwM6NzS2Y/rSPNK0nENb3b6BpRptLFLFjPfcmPsM5h31964nr2a9pGAVRynF3TJlom9H5FtvPVcdgtw4Qp5LdzDvy2HKv6GSFhc0awrlUuEXkpBZFYLRdpdJBy0WnZsLyAKtfMdleYA0+bOFVZ0E1kZ44WRwpAHiM5O3PbEgx1KH6HOPvXtJlsM6vHclRSPgsHfPowkeX58P39rbv4ryBKUaLxr5nClqRGN9DAQF+F6m2bvXpSmllNckhjxrNANWiWxjnstRWMl9dEM1bhwOIkMs/Vbgubki9aPkn+zrAaY5kBMn3zLZfMtnV+Pwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKE4HFhqOnIh+zhM1E7yNgmZlWKJln4zOpwvSZpUsf4=;
 b=LTmIXr29ssTuvqE1n5QCmwLep/ji5h90VYU+jBo01G6Xa93tJJ9I1GzFRA6k01sT3nIWlt3+0pB+/BgSi5yCwXZcSkswFtz4eAVqBT+ApfLb2sz3imw3NWxhTKM/983qEzlW0jn0C3qcvPRzTqza8gyjK1J4HlSTD/LQes+dKzQ0L64+irQP68txj5E4cDkabOO5d9eNjJAYtxKkipp+QvyofWETpZfCv3d1/2PXq14nIfBIJM56kXbNX/aG4IPDKmznwYU2eu7xlUa2yQLGL7gN4pnfwFUbvCxhG4s/Yh+GKFyw8tDo+a65rc1Nc4lxDTPt/QSka5qczByIBnXJnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by CH2PR11MB8815.namprd11.prod.outlook.com (2603:10b6:610:284::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 16:27:52 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 16:27:52 +0000
Date: Thu, 30 Jul 2026 12:27:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, <intel-xe@lists.freedesktop.org>, "Mallesh
 Koujalagi" <mallesh.koujalagi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH v2 00/22] drm/xe: Add structured SIGID error logging
 infrastructure
Message-ID: <amt7hNGssogp2YF3@intel.com>
References: <20260728161039.579-1-michal.wajdeczko@intel.com>
 <dfe82413d317aee8bd39dbbc45ece77f9b6d7610@intel.com>
 <amqhoFzQaf1HsuFq@intel.com> <amtWsQMoiyxk6H4k@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <amtWsQMoiyxk6H4k@black.igk.intel.com>
X-ClientProxiedBy: SJ0P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::20) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|CH2PR11MB8815:EE_
X-MS-Office365-Filtering-Correlation-Id: c25df604-1dcf-4eb5-dd24-08deee5780a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|4143699003|6133799003|5023799004|11063799006|3023799007|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: EOP+2rWRvJf6zKoS7NAonHFYPssGHCelssQYJ8OSarfKrnqi575ME5CAwNZH801Eh3EEaUcvIGw2W/ZUZ0+8ciZPrZfXEJ3d63DF0fZhfw5eYFvJCtg3TwxlItZsvPOlTGfM76xrk0N+t7rlCfyEmb3j7sM4R8bLUReRxV8IF5ZMwyLCQxDzEQJLbjLtkmZRoYym0WdUQ98Yy2OIl0CBZcGhVFU04xkV+PslOWA0Z0p6GL7A7mAe7fORVjoJI/9/C7fmSQhhCBxLcLVnBQ1AStK7iqDeAIrj3xg8eIad+CvO7R5LiTuF1ce87yNssep1+s0kt0FTb6hVgOgZUSnBRWL1QjFYcF3psI0aVtVngfs+GWlH1UuqNDvKOauTmldJBRbheOwHzVMRv6Dim7Nnk6mGXOEqx9OsocbM9emIHP0K9+4T1Pq8IkvajsbyE9S0eDXTaEkTxB2YWFkojX+0ZdQ7Bj0HOVxHqexogX6upNXwJg7BQxUIAbalBSdSgBWEhpErrspb7TNAB6ATLzFlR/swS3PamWl0+gtcWcdiRHsJAEoU4LK1JdDCeeZn6H3X0OxBX2z+Aj4WoEOcrjw4AulOzFzS6H1emdeNGIOxXn0dcUvPyurOCG8Zlh5ItJHd64Ol1Meokb45dyS7OcHmlJk1kJPXfHFIqcPxxXjayeI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(4143699003)(6133799003)(5023799004)(11063799006)(3023799007)(56012099006)(22082099003)(18002099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j2X2TmDQL06cWweZzWzIU+16joFZfYF++o9+t9CEgdb0sIC0Zvzv61zMb251?=
 =?us-ascii?Q?/d5IMVn3HZ9NOFLBf/A6ZPHcviBgckqSfl5vU5Z7xriLLNSB5XOSQRm+LXOp?=
 =?us-ascii?Q?oH7FogFqLwF75YqBEKL/Yz26gLTQ4flybHbTxv8nf8Y2rMa22UxJJm6DLJFE?=
 =?us-ascii?Q?k+/7q6xwkd7IiUncBTASiN7hXY1Px3cHMeM6AJQjyDSwVxt+C7vNZuqyxZId?=
 =?us-ascii?Q?QfSx+/k4ydk/rXYU0jgAdMnxFcbwr1/9TH8uASPbqHpwhujYeBwRRNEeOiFA?=
 =?us-ascii?Q?c95yKl8MEmvRdAEmimDHaz8U4k7lG0vkuw/SrsBa0NnH8qGvUlMrl4P2aUr3?=
 =?us-ascii?Q?feFiVz9VW2tWhYviLcT1fRlYdCYOOClYed3VcFQuoi0hEKzDuHm+ONuzy65u?=
 =?us-ascii?Q?k/4Mu6YJ2j/dZchi/RXfK0m1o+wSZeSVaGhnJQ8gvQl05dKjJmwE1eDP27OG?=
 =?us-ascii?Q?QIAU4fJGHWsY4h3clP1JF95uAFOTx2zbub5c/S8z7bEstHcNBtSj+FbFbx/r?=
 =?us-ascii?Q?pYN60Ap+VeFQmGfYgpJzkg10PfIUTxdmpCgx5EvAYoIj6AuWWB+UCIr2210L?=
 =?us-ascii?Q?MR1REEZYRKqv8Rxw4s2muowNijZE/kbnaBEY5+zYweM1M417MWXC0qnZ1w1v?=
 =?us-ascii?Q?3+HXq8kAtolJ+4I6gP7B6ddaSoZp3yigktK2eSv9U4INBaksBKBr7Y9FRGhD?=
 =?us-ascii?Q?Us/DmjFuZ6ft6EuesROYc7UZbf6OFeZ4f3nIHJx8fHLMPbW7fN/v8ooubqgE?=
 =?us-ascii?Q?fEj4WR4AJW+x3WBVT2PozeQkyCKlMcEHPK/fzCU9IWPccvAmRAo4GZCurw3O?=
 =?us-ascii?Q?iNimj9YBsrM6DnG+pmLH2UiUsXCc4wEwB6YnMJ09O2ESZv9XZYjZMzfCnovq?=
 =?us-ascii?Q?9YDMPM2mKTkGz2/rgRYUk2NrGg7ravrOTgqbUPfgy7kTZI9WCwbBCfaE/0fb?=
 =?us-ascii?Q?1iIDLE4KCwxGASTM1cFz/t4tePkMBPRO3F1k82emHP6lRd8Sdb45lVtWlN8q?=
 =?us-ascii?Q?uXSraPaNO2ShALUB00BhTj/KGr9MRxtBfsvjK0xrDzgqEQ2Hh8ID0dFRCWsi?=
 =?us-ascii?Q?KSE/fkz0hlrpKQXBrgLNPSd26YuIUWs4/IPCtOrfRjziQjyxx5ZSBpi+YmxJ?=
 =?us-ascii?Q?6gMiTX19TkRtky6Z3UfZQ4Sv6XyY6VyfK3L6SSuWxI7Z5UL//caHyQTqrzFt?=
 =?us-ascii?Q?3vcbXejEawocYQT2DfaowypgSKoqbhRKuKBk+FORlBVU2Zav9uXJdJ966Fpc?=
 =?us-ascii?Q?joRjhkgwAfDZE0Zrokf7yykV8nqsPIq8xxWgeWTyHrY8OBjo4+tNutcwhRRB?=
 =?us-ascii?Q?w7FMT50NMpblun9YOHbXSSfKU56RXVUsI+mXmbASwsytErI4gIQTIRbq2SF6?=
 =?us-ascii?Q?ZL13El0uW0kXFQf95M5sbI3txXw1jzA9CAY/Ad2+jJS5THsUy17BzZBnwGfq?=
 =?us-ascii?Q?p2BLX5guIBMcKMZ7jvubuAv7WrtoS3PrPzsinyjdIvKqjNdiRbMTJPn9j6+l?=
 =?us-ascii?Q?BrLh0T1dQNtG95056KCJtyWONjQ/cbuEhyIIdIWIsCqGRYUiw+HAy1+FLWpv?=
 =?us-ascii?Q?+cLJWrugDQITZR+vqQNg9ztT7QWueCGd4nKM+yI4xdbWCOPo6NQkr1FI9JTB?=
 =?us-ascii?Q?8VUXWhwdbVfymYzlgSgGHHDDGtWz5iHph5pw3MoQs47t3H7xFdXxQhAdz6xc?=
 =?us-ascii?Q?SjPdIwEfx9N/PWo1zhVa0nj3mP/VRRhBAaNUR+PKGOOqbJc9daxhHsQNMS/D?=
 =?us-ascii?Q?5AKCF7CFfw=3D=3D?=
X-Exchange-RoutingPolicyChecked: Y+qL6d0alEbqxX6GdABOCxJk2J1o4ClYIGkY22cmolE878DKg17RgSwa5qRmYCYodrm9Y6WOHlnh9aXSd3ua+fqXDkavBuMfFQpfhJjh6oFfdh+45qRb4RdaVXCqAYsmIuiB2Udx3N0SChw5n3oA6UxHM1U86jape/EEf9EpBOQSB6TdfJPwVc+8kbv0k1AN1SQX9ushd4620r6dwvF+ZYQFMfxKhyXTEu3nwV9P3etGoyMfe65di7L+MAMfSCcuOjGyDqZFtlrXX+YKsltXIqW4cNW5x+DT17RmRljJigO7ElnD7xSmXWXi94Ss7hILcZWNatfZA3XpQz6ylaPdNw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c25df604-1dcf-4eb5-dd24-08deee5780a8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 16:27:52.5417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r7Y1hxpT0QjT8GfNDmN/iYVkSZx8MdPulcqUooym/NQoepX8zuAxaSzmBSGfdk+dITXIVyUFWxzkNu9lYQWP3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8815
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

On Thu, Jul 30, 2026 at 03:50:41PM +0200, Raag Jadav wrote:
> On Wed, Jul 29, 2026 at 08:58:08PM -0400, Rodrigo Vivi wrote:
> > On Wed, Jul 29, 2026 at 11:31:46AM +0300, Jani Nikula wrote:
> > > On Tue, 28 Jul 2026, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> > > > Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
> > > > strings that have no stable shape. That is readable for a human, but it
> > > > gives fleet tooling nothing durable to match on: the wording changes
> > > > between releases, lines can be rate-limited or dropped under an error
> > > > storm, and there is no consistent way to ask "which recognised fault
> > > > just happened?".
> > > >
> > > > Introduce a signature identifier (SIGID): a small, stable integer that
> > > > names one recognised Xe fault situation and serves as the primary handle
> > > > for triage. A SIGID maps, through published end-user documentation, to a
> > > > description and a recommended action; the driver only has to emit the
> > > > right SIGID next to the usual human-readable text.
> > > >
> > > > Design decisions:
> > > >
> > > >  - Software-emitted signatures only. This header enumerates just the
> > > >    situations the driver detects and reports itself. Signatures that
> > > >    originate in firmware or hardware are identified by those layers (via
> > > >    their own records/counters) and are logged as received -- minting a
> > > >    driver-side id for them would duplicate an id the reporting layer
> > > >    already owns.
> > > >
> > > >  - Flat catalogue, chosen per report site. Each site emits the single
> > > >    most specific situation for that site, so a multi-layer failure
> > > >    produces a chain of reports rather than one ambiguous classification
> > > >    (e.g. a failed GT reset reports GT_TDR and then WEDGED). A site that
> > > >    matches no defined situation keeps using ordinary xe_err() /
> > > >    xe_gt_err() rather than forcing a wrong id.
> > > >
> > > >  - Stable numbering. A single flat list numbered sequentially from 1, in
> > > >    introduction order. Values are only ever appended, never renumbered
> > > >    or reused.
> > > >
> > > >  - First-order action. Each SIGID carries a coarse, in-tree resolution
> > > >    bucket (COLLECT / RETRY / UPDATE / RECOVER) so it is actionable
> > > >    without an external reference, and so every new id must declare what
> > > >    to do about it.
> > > >
> > > >  - Severity is decoupled from the SIGID and chosen at the call site via
> > > >    xe_ras_log_fatal() / _recoverable() / _info(); the same situation can
> > > >    be reported at different severities depending on the instance.
> > > >
> > > >  - dmesg stays close to a normal xe error line by reusing xe_err() /
> > > >    xe_gt_err() (and their Tile/GT decoration); the only stable,
> > > >    machine-matchable token added is SIGID=<n>. dmesg is not an ABI --
> > > >    the durable machine record is the CPER carrying the same SIGID (a
> > > >    planned follow-up, left as a TODO).
> > > >
> > > > Wire up a representative site for each software signature so the set is
> > > > exercised rather than merely declared:
> > > >
> > > >  - PROBE: xe workqueue allocation failure during early init
> > > >  - WEDGED: xe_device_declare_wedged() (drop redundant "CRITICAL" + BDF)
> > > >  - SURVIVABILITY: entering boot survivability mode
> > > >  - RUNTIME_FW: GuC mmio request failure
> > > >  - DEVICE_FW: PCODE mailbox failure
> > > >  - GT_TDR: GT reset failure (which then chains into a WEDGED report)
> > > >  - MEM_FAULT: page-fault queue overflow
> > > >  - IO_BUS: PCI re-enable failure after a bus reset
> > > 
> > > The idea is not new, see for example [1] and [2]. I'm not sure if that
> > > was ever merged, though. Would be good to know what came of it, and why.
> > > 
> > > There's also the printk index support already in the kernel [3]. Did you
> > > look into that? If not, please do. If yes, please iterate why that can't
> > > be used, or extended, and a local mechanism is required.
> > 
> > Well, I do agree with your feeling here. When this request first came to us,
> > it was framed similarly to the two older proposals you referenced.
> > I pushed back making it very clear that our kernel log is not an ABI and
> > it will never be... that our debug messages are for our own developers to
> > consume and edit as the code evolves. So, I refused and blocked any
> > attempt to modify all the messages and force them to follow this format.
> > 
> > So, this evolved a bit since. I hope. We have agreed that the ABI itself
> > is not the dmesg, but the CPER that is emitted on tracefs... that's the
> > ultimate goal. The message here is just an extra helper and it brings
> > both our CPER/tracefs and the dmesg helper. So, the printk index cannot
> > be used here. It has no mechanism to influence or annotate what goes
> > into CPER records. And even if we modified it, its volatile number
> > doesn't work with the CPER goals.
> > 
> > The goal is to have this SIGID mostly identifying FW/HW stuff and a few
> > of the key points that could help providing a guidance/map to a recovery
> > path. With an intentionally narrow scope.
> 
> So why not stick to a specific interface instead kernel logs having to
> bare the burden here?

Because dmesg is the first thing people look to understand the next step.
Just a fast first stop shop.

> CI results are already full of noise,

It is not extra noise. This was one of the things that I blocked on
the first design. There shouldn't be duplications nor multi-line
debugs.

In a matter of fact, if you look the examples that Michal already has
you will see that it looks cleaner than before.

> so it's a
> bit unclear how this makes developers' life any easier.

The goal is not to make developer life easier, but I explicit blocked
attempts to make developers life harder.

> I now have to
> figure out all the macros before reaching to the point of failure :)

You don't.

Developers can continue using all the other existing error functions for any case.
If you are not sure you need this sigid it is likely because you don't need.
So no trouble in wasting time trying to map or invent another id for a new case.

> 
> Raag
