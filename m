Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A624ECA0EC4
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 21:29:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B52010E54E;
	Mon, 11 Aug 2025 21:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YgfJZEe5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1822310E54E
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 21:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754947787; x=1786483787;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=n8ajwHTx61gkU7l7M+yz9f1Z0NTVz9qSym1fuAeKJBo=;
 b=YgfJZEe5Dju6NkOB/d9uUMSZQ07BCt+udSyQpueQQsWX9/jJi3zYiSUO
 Fme0BfuiCA19AbPRHdVxXsfyaqSwEjNHVmbK1OPiD72W704Bfq74/uc0i
 ZhS+ty3xs8EAPECLLGnWhI88VEhsm/aGDGm9rad3bb4/So/HHtodIpzFF
 w8LqoOBofDV+53xt8TPnmR6bMLiOD0U/1EvxNqo4lTcRKL9ilwsT2LjDK
 0C7uCdwf2UW99Knha7GqKBc8zYXPUkC6ZRrwBHaiA0FQbmrLMycR7fitg
 lXa94X2arG4YDjWDppjkcOaZeT+ei1AIv2TzNrDvYrA/gz1dkXAfj43LK g==;
X-CSE-ConnectionGUID: qbbGONqyTa+u39wVc9Da5w==
X-CSE-MsgGUID: LrNddpBdSXWyrWpLmovbUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57167039"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="57167039"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 14:28:11 -0700
X-CSE-ConnectionGUID: bihtXZoWRiKTHx6gwLJt/g==
X-CSE-MsgGUID: 7sKDJD1DTEm8t2yIBiy8RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="170235189"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 14:28:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 14:28:10 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 14:28:10 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.51)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 14:28:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MuXnJj9CASDk6YscG+2T8Aj4zwBQxFgOml4ufEQoIwbNetuCAyxQ1bcnXTejLt/SdOchV7hU6Flk7sO8Gz2fcDQVdo2OTGcC2vDIA1/skAMwctrZTSngfSyg0guAUe0D/zoSUuJP+5Vzktnf5f+T90dE7IJ2uCD83+TI7ZnLZZlgsQxDbjURYg4iEYVcLCWuO2o1WuiA+YADN4pTCIvlL7VFOVOcb3stZnRfoeHU4XFx5I+tCoDXyPDhS9PgzAqGu7DHXqPeB569juIgN+cQkbjYjX/NmIgTgDphx0TrvIqEtiV2yFaVSEZNegQQY6tWehrukEKLHplF8fZdbba6Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvySpP6T1lJhwxFO3wQcEobQdYeigo6Hqw9NkczedA0=;
 b=LI92iWAYk0keLrIJLqzpxKpDsKaW0bDCFDMp4Z9LLlfIxkvUfahqAI5oXYqhovuw7Aj19hNxqaxO87pI5CylqZIOWAf9+lHXthiIIrzCZ+a9aTXAj56RpXDOyVpeD8hC1gU55niPHJuAckoNbhO4c6wTgH+4hJfxtdcIyDa8oP/P0c7itIW3Knn/T0uTYqrkHk374VIMdDGPwdCKL5hSsqlrXiQx9PC8YvqTJMFkNqYS5oV3P/IaqPEhvWDx6hdh58GTPyEWQ9h1SuJ7XHQldoFHKNfDq6tiACtBuTxNGu2OlFo7WJw35PTc3PAJWtSK+7v6RhTbr6LrlHnsTFwosw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7887.namprd11.prod.outlook.com (2603:10b6:8:e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 21:28:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 21:28:07 +0000
Date: Mon, 11 Aug 2025 14:28:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: S Sebinraj <s.sebinraj@intel.com>, <intel-xe@lists.freedesktop.org>,
 <jeevaka.badrappan@intel.com>
Subject: Re: [PATCH v2] drm/xe: GPU frequency tracing support
Message-ID: <aJpgZX5fKEXtgEBG@lstrano-desk.jf.intel.com>
References: <20250811083414.3863103-1-s.sebinraj@intel.com>
 <i6iszloxcdb2olq5hspkzjefimracmqoawpu7t5gwlehgnyudv@usbccibofr7v>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <i6iszloxcdb2olq5hspkzjefimracmqoawpu7t5gwlehgnyudv@usbccibofr7v>
X-ClientProxiedBy: SJ0PR03CA0187.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7887:EE_
X-MS-Office365-Filtering-Correlation-Id: 70ebb2ff-d0d9-459c-7a12-08ddd91df6e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?OxEBfdQ3ECTg51H7pCxbMr2N33V+XeEgROT4U2CrLcO605ROvEsa2uGwcv?=
 =?iso-8859-1?Q?/wimr6SgzOr0XQFaHn0Ek2+CgWwsOOD/ocLawX6M3RPgM9BbqXgQ48cdCi?=
 =?iso-8859-1?Q?zVVCyL3uOUesSXjhcYGexAt4UMAImzs9v4ggsgcfIBBBO34mz9hT90FnsQ?=
 =?iso-8859-1?Q?s2SSX6MahLYyWAQ9EBOIrJKY1TkGAfnC0tfUUd6nv33ZeNdU87uBlQtc8F?=
 =?iso-8859-1?Q?YU9IMMz9Ayx4eVOknMCicCV+jgJ/HL/zTfntFnYwJPjfPX37IQHVngwl7D?=
 =?iso-8859-1?Q?xwBiweZb5T/JOZY+OzEQ8wasjjLgd3+rrG7QJtgF4tY4qgsXqV5O3Rb5AP?=
 =?iso-8859-1?Q?HTHOyYt5qG8u5P1jgmQW+BYOJ6ByJSF79OZmaOXJA+Mm5RdzyB1RVN1/JU?=
 =?iso-8859-1?Q?6HQLkIXkN0uQ4OcY1ptyC1VcPSI/EfBelg7T3D+kB4kMVf8Q8rIhWxYI1y?=
 =?iso-8859-1?Q?K63Nl97cPN/rzDn6Zu8Wcv4/IjwxG1fmrwHMTWIF+xTlBzM4DrI5jEXcVK?=
 =?iso-8859-1?Q?ylb25o9OfzAbok1OVuQCe+G3X/SOR7IMkJN2XSgA5jTeztBVdRXcrtgJJm?=
 =?iso-8859-1?Q?ZVlLqh1XbE5AgK5Y1uTlFKmuKfK0CxkkKjhXm6cMiY5smTmLsGusrVr7K6?=
 =?iso-8859-1?Q?XCTjNRrbHXxiB1ldrFfwUPyAEOrOPtgdv4U/+LtwYg+OdajrC2LTWp/rva?=
 =?iso-8859-1?Q?YbbFd6w7UTfQDEq9REpYcS+nOd1WmKhl5DeT/jqzjf14PpbHBPMXOKf2Ah?=
 =?iso-8859-1?Q?0titCWJpWxF3yfbJP4HZLsQapOIbRSYl/ZNTE7tAvCecfOZErJKBjX5tdO?=
 =?iso-8859-1?Q?prlHZ/nUSOT+Dkvr/MWUMnL0qHte7j7fDDxLZUWf+JG8L2KDu7e6p6tDlX?=
 =?iso-8859-1?Q?/MLqwDLhDOth+5IwzJMsZKoNnYEjhEnJYbyo/jquHT5pvIS56/3m8+IuGy?=
 =?iso-8859-1?Q?8kTSdWY35C1nFGGBBgOL+Etg2eIqs8iQLrq+nn7NbPpAEhzgNFkKIHM+ng?=
 =?iso-8859-1?Q?e4kNIfgmsjjyOEN+/wPeIC2iwRs7KBJm4F6XtKQvvX++SS153xA9VJia15?=
 =?iso-8859-1?Q?FAX4xpsLbzlIP57nOid9QEDgbBAmFyN5onlWD4oFKxxsKZawyFOyz94QmB?=
 =?iso-8859-1?Q?5AhQY98k75Q2Qa+2UBhYCvZpkjpKfvM50e8yWoWw4+Nfe7LGuCqKVj425d?=
 =?iso-8859-1?Q?oiu6HrPzKwdQz+1Anls+vuVCRKbXssP8wQ9IPbHT0VMaXelACp7vTy3r0r?=
 =?iso-8859-1?Q?di83ydo86KQp3N45ja/eW0+0H4tO4oZ7ZBW2868gAkm8IyMR6plOqTFYUR?=
 =?iso-8859-1?Q?K5ISsyX1aUytZruJxDxot8P5IsJm3c3YnRDnIU0JcvCXICjz7B26dhLWqU?=
 =?iso-8859-1?Q?Kkt3GpbrRLP+sT9Pt/q1iSHHRa9Rg9jL8wldfK9wa6ek5EROl2CB9/6Y8s?=
 =?iso-8859-1?Q?P6DHs71f3rgB/3TnDMH8XodfVClufbIdfeNW/bfFRDgRzKANV3zqEKMBwC?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ZvpdlgNFLINvD1tICyd2TvNoo2OhJS9z5yWsNgZwoj0TZECu4iMAkgpJCk?=
 =?iso-8859-1?Q?2dyJWRMOuB4NL3Dmg8WBsRPxQdkNkwhjzRQiRo64BgoCVCbG7Ta4hflSip?=
 =?iso-8859-1?Q?OBOOZNPogMIL1FzbwVSiTA3rDSp87uNHQ+L82VEsZ53DmjaCcMxvpm/pdm?=
 =?iso-8859-1?Q?LBZt7fZAtI3K9q0BdVKrPQ/D6qcwngM4YrbhLhRCwfVmtMNwQiUCaQSDnU?=
 =?iso-8859-1?Q?pUEP0vo7PXSRNNJtYPEpnqCMmAFFPRqt0LvvtWY10w9HaSPDkEgDdnPk1B?=
 =?iso-8859-1?Q?rYP/mMkUcP3BvlBSv97gnXFN8G9iV3Y6WWBCaWNNqP2YreQjMZdP18euHQ?=
 =?iso-8859-1?Q?3vWanlNWHJTi3GGTWq6m0NKt36Jn6kFYrsvVU49efkqwxPTr53AMpPnXzs?=
 =?iso-8859-1?Q?Rjmj446yshyZDgpZdYy4Jabd6GIc+5A4eFEfZJQWasdRYcyQ8L1Ar6FWhI?=
 =?iso-8859-1?Q?jU9z4S5lukm3fmZvtKfd0/t7BA1NxajtUHlE//BSNXIFuAfGA3/vYZttmX?=
 =?iso-8859-1?Q?PWt06NjAK5PrdgqItWa7D/H8hVnqV1eUD7TPb9b+Xw0MpmcQJl00CCWJSe?=
 =?iso-8859-1?Q?g9tCcSdKcWp6r2n8797mlUacaHJMFDV5nL5fLv/YKrahyq8M2wbq4EGygQ?=
 =?iso-8859-1?Q?Oj8+esEr6pkZ1xVrQTPmVTbVbo5oFxjc3aZYpBjHsOG/md3HYNT9HIABWm?=
 =?iso-8859-1?Q?1NfgnsNkhOrZ3wheOU7ipN+jAot0eoB+yWJkKqLNUjzwacsO/P+JI8tCIG?=
 =?iso-8859-1?Q?8WlW9SMytE9qjixMjuXNn10Lb/ZWmFJeMtTCNjvJPGOF80hOvmpKR1/45x?=
 =?iso-8859-1?Q?Ni964/Xurc4CDeo8TBjmZY+/0Q46bFLSlBFKtqFebW5t9Dsl3zwFiju8Mm?=
 =?iso-8859-1?Q?DJJe7qVZNGg/YnK1n1NHCY0u5NxkSqoPCXPQdfRg439WVUw9s08J6ESLf4?=
 =?iso-8859-1?Q?ADT+x0c7FBOSFmNwID1+QSw1Ho9jT/JoSVn7T4360186+3ya1swk6r+jNV?=
 =?iso-8859-1?Q?D7u6T5qqaE7q6mhlVvRklIiWTOppw/T5qF3z82sL0wt/4we18I+iFZqY5t?=
 =?iso-8859-1?Q?EEvf+Fv5armI54Gey6sIHi1SGrl8IJQa9Qen4H1rjL0ZTnabnS5g1W2Tbe?=
 =?iso-8859-1?Q?D7cBTcBWH3FYbVIze7pemy/EDGaYTZAS7jMhDXRleaDbJ9qCG3K/2qe9/U?=
 =?iso-8859-1?Q?nFqLe2xySYvyTa9ZBV3ioVHHLorrD+WHJPdJ9ncikqZNp44WZuhw3bXfnQ?=
 =?iso-8859-1?Q?lk/zWVe+YlVaIkOPtuLRybqlRsE3jXRR6/YRlmWq78zDBaua5ylAj15EUa?=
 =?iso-8859-1?Q?+DN7DZVBufxyWmv3HHbwihzmwhaUmlX5jhwmcioQWBXatnOCtjS6/7A1gD?=
 =?iso-8859-1?Q?SKm4VP0VebeAgtlTuOqXPGaTJcBpKjAappCRb10/PDHDGS4zqE13xU8JBh?=
 =?iso-8859-1?Q?9cvYk/b8ajDKwezF7cxdxDN3YU8o4NJxoszZZ/P9HdldkV5J1SIVWETM2s?=
 =?iso-8859-1?Q?eFoxcDlgJdkA21zZ3w12bk0Ndc7AMvwbTixVUfNGR1czsiCvXJjIV3/DjC?=
 =?iso-8859-1?Q?JL9vM7BOBE3zyRogLGMhKXbARxNvU509y818ICDnbAxg+70oab97v3GbUC?=
 =?iso-8859-1?Q?jMc519g2jEXnWDWxVBIKO1Ong4+/njdyrMTene4CyByfBcp6EjF4AgvA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70ebb2ff-d0d9-459c-7a12-08ddd91df6e8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 21:28:07.7493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VSvImJJYSnBRod7UuDgnJ4b9pHPn0FsQ6Xd/rc2CudbnPqOwGd27uQH1wkPYZWS6Q6gb/58XC8rDZKgfBRXEog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7887
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

On Mon, Aug 11, 2025 at 06:13:59PM -0300, Lucas De Marchi wrote:
> On Mon, Aug 11, 2025 at 02:04:14PM +0530, S Sebinraj wrote:
> > A periodic GPU frequency monitoring and tracing program for the
> > Xe driver. The implementation provides periodic sampling of
> > GPU frequency through the Linux ftrace infrastructure.
> > 
> > Key features:
> > - Periodic GPU frequency sampling with configurable intervals
> > - Immediate frequency change reporting via tracepoints
> > - Integration with Linux ftrace subsystem under 'power' events
> > - Per-GT (Graphics Technology) monitoring support
> > - Dedicated workqueue for non-blocking frequency sampling
> > - Configurable via CONFIG_DRM_XE_GPUFREQTRACER kernel option
> > - The monitoring interval can be configured at runtime via the sysfs
> >  (default 5sec).
> > 
> > The sysfs entry is at:
> > /sys/module/xe/parameters/gpufreq_monitoring_interval_ms
> 
> This is actually a module parameter, which is global to all devices xe
> binds to.
> 
> > 
> > The tracepoint is exposed at:
> > /sys/kernel/debug/tracing/events/power/gpu_frequency
> > 
> > Format: {unsigned int state, unsigned int gpu_id}
> > - state: GPU frequency in KHz
> > - gpu_id: GPU clock domain identifier
> > 
> > This enables userspace tools and system monitoring applications to track
> > GPU frequency changes for power management analysis, performance tuning,
> > and debugging purposes.
> > 
> > Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> > ---
> > drivers/gpu/drm/xe/Kconfig                  |  22 ++
> > drivers/gpu/drm/xe/Makefile                 |   3 +
> > drivers/gpu/drm/xe/xe_device.c              |   7 +
> > drivers/gpu/drm/xe/xe_device_types.h        |   4 +
> > drivers/gpu/drm/xe/xe_gpufreqtracer.c       | 292 ++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_gpufreqtracer.h       |  30 ++
> > drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h |  48 ++++
> > drivers/gpu/drm/xe/xe_module.c              |  12 +
> > drivers/gpu/drm/xe/xe_module.h              |   3 +
> > 9 files changed, 421 insertions(+)
> > create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer.c
> > create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer.h
> > create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> > index 714d5702dfd7..d9d07ec69875 100644
> > --- a/drivers/gpu/drm/xe/Kconfig
> > +++ b/drivers/gpu/drm/xe/Kconfig
> > @@ -129,6 +129,28 @@ config DRM_XE_FORCE_PROBE
> > 
> > 	  Use "!*" to block the probe of the driver for all known devices.
> > 
> > +config DRM_XE_GPUFREQTRACER
> > +	bool "Enable XE GPU frequency tracing"
> > +	depends on DRM_XE && FTRACE
> > +	default n
> > +	help
> > +	  Enable GPU frequency tracing support for Intel XE driver.
> > +	  This adds an ftrace tracepoint that reports GPU frequency changes
> > +	  at periodic boundaries (default 5 secs, configurable via the
> > +	  gpufreq_monitoring_interval_ms module parameter) and
> > +	  on direct frequency change events.
> > +
> > +	  The monitoring interval can be configured at runtime via the sysfs module parameter:
> > +	  /sys/module/xe/parameters/gpufreq_monitoring_interval_ms
> > +
> > +	  The tracepoint will be available at:
> > +	  /sys/kernel/debug/tracing/events/power/gpu_frequency
> > +
> > +	  Format: {unsigned int state, unsigned int gpu_id}
> > +	  Where state is the frequency in KHz and gpu_id is the GPU clock domain.
> > +
> > +	  If unsure, say N.
> > +
> > menu "drm/Xe Debugging"
> > depends on DRM_XE
> > depends on EXPERT
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 8e0c3412a757..61d46cc4dc25 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -170,6 +170,9 @@ xe-$(CONFIG_PCI_IOV) += \
> > 	xe_sriov_pf.o \
> > 	xe_sriov_pf_service.o
> > 
> > +# GPU frequency tracer
> > +xe-$(CONFIG_DRM_XE_GPUFREQTRACER) += xe_gpufreqtracer.o
> > +
> > # include helpers for tests even when XE is built-in
> > ifdef CONFIG_DRM_XE_KUNIT_TEST
> > xe-y += tests/xe_kunit_helpers.o
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 57edbc63da6f..88198ceb519b 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -34,6 +34,7 @@
> > #include "xe_exec_queue.h"
> > #include "xe_force_wake.h"
> > #include "xe_ggtt.h"
> > +#include "xe_gpufreqtracer.h"
> > #include "xe_gsc_proxy.h"
> > #include "xe_gt.h"
> > #include "xe_gt_mcr.h"
> > @@ -896,6 +897,12 @@ int xe_device_probe(struct xe_device *xe)
> > 	if (err)
> > 		return err;
> > 
> > +#if IS_ENABLED(CONFIG_DRM_XE_GPUFREQTRACER)
> > +	err = xe_gpufreqtracer_init(xe);
> > +	if (err)
> > +		return err;
> > +#endif
> > +
> > 	err = xe_oa_init(xe);
> > 	if (err)
> > 		return err;
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 01e8fa0d2f9f..0634dbbbdc3f 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -35,6 +35,7 @@ struct dram_info;
> > struct intel_display;
> > struct intel_dg_nvm_dev;
> > struct xe_ggtt;
> > +struct xe_gpufreqtracer_data;
> > struct xe_i2c;
> > struct xe_pat_ops;
> > struct xe_pxp;
> > @@ -529,6 +530,9 @@ struct xe_device {
> > 	/** @oa: oa observation subsystem */
> > 	struct xe_oa oa;
> > 
> > +	/** @gpufreqtracer_data: GPU frequency tracer data */
> > +	struct xe_gpufreqtracer_data *gpufreqtracer_data;
> > +
> > 	/** @pxp: Encapsulate Protected Xe Path support */
> > 	struct xe_pxp *pxp;
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gpufreqtracer.c b/drivers/gpu/drm/xe/xe_gpufreqtracer.c
> > new file mode 100644
> > index 000000000000..07eedfb79e93
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_gpufreqtracer.c
> > @@ -0,0 +1,292 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#include "xe_gpufreqtracer.h"
> > +
> > +#include <linux/workqueue.h>
> > +#include <linux/slab.h>
> > +#include <linux/jiffies.h>
> > +#include <linux/kernel.h>
> > +#include <linux/moduleparam.h>
> > +#include <linux/types.h>
> > +#include <linux/container_of.h>
> > +#include <linux/gfp.h>
> > +#include <linux/atomic.h>
> > +#include <drm/drm_managed.h>
> > +
> > +#include "xe_device.h"
> > +#include "xe_gt.h"
> > +#include "xe_gt_types.h"
> > +#include "xe_guc_pc.h"
> > +#include "xe_module.h"
> > +
> > +/* GPU frequency monitoring interval constants (in milliseconds) */
> > +#define XE_GPUFREQ_MONITORING_MIN_INTERVAL_MS	100
> > +#define XE_GPUFREQ_MONITORING_MAX_INTERVAL_MS	10000
> > +#define XE_GPUFREQ_MONITORING_DEFAULT_INTERVAL_MS	5000
> > +
> > +#define CREATE_TRACE_POINTS
> > +#include "xe_gpufreqtracer_trace.h"
> > +
> > +/**
> > + * struct xe_gpufreqtracer_gt_data - Per-GT frequency monitoring data
> > + * @gt: Reference to the GT
> > + * @delayed_work: Delayed work for periodic monitoring
> > + * @last_frequency: Last reported frequency to avoid duplicate reports
> > + * @monitoring_active: Whether monitoring is currently active
> > + */
> > +struct xe_gpufreqtracer_gt_data {
> > +	struct xe_gt *gt;
> > +	struct delayed_work delayed_work;
> > +	atomic_t last_frequency;
> > +	atomic_t monitoring_active;
> > +};
> > +
> > +/**
> > + * struct xe_gpufreqtracer_data - Per-device frequency tracer data
> > + * @xe: Reference to the XE device
> > + * @gt_data: Array of per-GT monitoring data
> > + */
> > +struct xe_gpufreqtracer_data {
> > +	struct xe_device *xe;
> > +	struct xe_gpufreqtracer_gt_data *gt_data;
> > +};
> > +
> > +
> > +/**
> > + * xe_gpufreqtracer_sample_work - Worker function to sample GPU frequency.
> > + * @work: Pointer to the delayed_work_struct representing the scheduled work.
> > + *
> > + * This function is executed in a workqueue context to periodically sample
> > + * the GPU frequency and perform any necessary tracing or logging operations.
> > + * It reschedules itself for the next sampling interval.
> > + */
> > +static void xe_gpufreqtracer_sample_work(struct work_struct *work)
> 
> this looks like a weird abstraction that creates issues (see Matt
> Brost's reply) that are already a solved problem. Why can't the
> userspace interested in it use perf for that? We already sample
> frequency changes there. See drivers/gpu/drm/xe/xe_pmu.c
> 

I was actually going to follow up with this question after looking into
the issues with hotplug, runtime PM, and FW, as xe_pmu.c appears to do
basically the same thing (monitoring the result of
xe_guc_pc_get_act_freq) and has all the correct hotplug, runtime PM, and
FW refs in place.

Matt

> Lucas De Marchi
