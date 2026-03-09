Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81DBFCA19F
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 23:12:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A84210E5EA;
	Mon,  9 Mar 2026 23:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y4ly/Usf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB2210E5EA
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 23:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773097923; x=1804633923;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+Yv2x6KVwuLdZtrqAeHqbBFvwAIeaLGqRkFVT1890+0=;
 b=Y4ly/UsfHr2KtVri7tf13ktvCQszSG026D3pULXmNsKqd1V8brq74FXV
 YRC2Eg5q0haCBKPRiABqoKp+pGQeyaumDD3W0Rpec0tl9WaEwteSPIdqf
 VENj4jmTxj8H5gS4Emzuj6sUNjwaHswiR62rHj5Ye+ibaQjudMpKKeUXJ
 wAekRBRLCKrVVN969O0bY/Dp86rz8ozvBjdSrx7leaiGyqKEZ0EJhUkK5
 uWbM5c7LtW0tRxVXecZwZeROWYMIGt7l9LYhfWp66jzCDqWJH6F8gPj9U
 Sn4+vR2U3GtCMyuseFqnUyOIktJ6QcoGBU9NgueKstNwg/p7HqAoOjggX g==;
X-CSE-ConnectionGUID: 63omc0hGRaGVdYuQV3mXcA==
X-CSE-MsgGUID: 9KCnBGg3S6CEebCgrp2kJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="77741381"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="77741381"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 16:11:59 -0700
X-CSE-ConnectionGUID: +LyIKtAbToqvBLpWcdEaYg==
X-CSE-MsgGUID: cECinvDWRbOvM4fFrYDdJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="220034373"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 16:11:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 16:11:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 16:11:58 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 16:11:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kMfFdi5KvxZiK7o7fPYB4RgZlWpI6EFvS5es1k4NT1fCIxwS/E8Ci3IvdE87tCnGPmfdwTWcrqdI83CG5Rw1X1c+iW0h91QU5o1Trz+AWC+Qv2eopmE+uDdNvfBbMchH6VgwQ2vAhZlrfTOaZYeWivRTFUJq45rwlMgrXTHVdtHcKyB9gX/9rhYCpYwfffP2QGziDD0sd0szsfhRj00V56wHQFMZxW512ny3t+tI2eswQi4PGnNircKg8TkbU7+J5HZvozTACmpkfYtOpcMdiFsQyNDw6BUJqVnbBYidBqFqkrqnu9b5HjojCG3iotlcBAHn0mRWMG5Ou6iZmlFiGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DzlXdPxOtgjtZnzYnAq2Ir0ikS6sKmELCi4WJYTYB8o=;
 b=itArKep/ms8rbmp/45CulfE4lp0ozJgmhpbJTxc79efzeqgag1p2JEMMEkurKTdvEH6ePTp+KyU/WBM4DUnLQz3gt1VzvEElfrqCOMQ+ILo3F+mmqM8HRa9Yo2xOZInPFOxppsQxb0i8UxfZPmDnqM3SLUnmbmA7DEJoI5MENX9ZieLGkFeQxJ0sVfrCUmOUunvwUYoIDbSj/A6sDG56BlKtzBkwhID4c2jmY33Yp3DwXJ+tSDq/LM2Nz87QONrlFOUW7C+1WNem8/+OINAxI8jdqKOikGEFOclTM0xkelFX43Yl/9EKiESnVq+X6WdZi0aLuBVUnid74Lt0LYeEfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7396.namprd11.prod.outlook.com (2603:10b6:930:87::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 23:11:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 23:11:55 +0000
Date: Mon, 9 Mar 2026 16:11:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Yadav, Arvind"
 <arvind.yadav@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH v3 20/25] drm/xe: Add ULLS migration job support to
 migration layer
Message-ID: <aa9TuKG2YL6DVQWk@lstrano-desk.jf.intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
 <20260228013501.106680-21-matthew.brost@intel.com>
 <7be318280fc180267ce14a299de7315cb237137a.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7be318280fc180267ce14a299de7315cb237137a.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0205.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7396:EE_
X-MS-Office365-Filtering-Correlation-Id: 6da0d980-5651-47d6-2b42-08de7e314185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: tHN4aPbEfZpPeDuZm7bxUe+U6nhnUrotnkoAJ6wcYwgfEiAkT9/XXc6DcTxaqkB2oqvbIpCWXwEF0yFYf3OcWepmnaqvZxFKr5Lp4W+SuZZjV4UqbvFgpL2iCbZJQqxLZtNjQizLGI0Qe/5XynbIRV7iqAYcQsc8Qz+ifLWvajuduAmGaMv5JiKr+1t2IFGpM3ac2e2+7S/iSerF+7Qv6Xd9ngRnqjX/Lk4Y6cDkFiheEaHwSkvZ1mfvJmJUCmyA2jCPQbgilZ5SwF3pJG4FRFzMNJgK1BazocgstidskNLm/byo+6a99ckSMjGT+YHb0q+1tpaOKc3FshPLLyvK01F+MHDxSUs0ds7bkxDXg20SzQa+TGBpyUOdh+0HImd15rOhWdY8Gv9kk17vyaQf+R0lk5vxFRxCtBMajzzDxzqeLKaMd5PPoOtcBl3I70uUaDZ/+RdgfGKxbpWjmtd71rvqB4X+u2KcTpk73uF1bvq3NEg7Nxf5G+a/rn+wWRObXk4u2nkvRmHyFPgVHM5cGvg14VqZjwmdeTx4X/FQiG1QPBVZ3m6uZBLI8t1S7kb5UVHt3kY8773q3PRSRxw92sv+vLYdagJUVPSLjmtxg1o9QeNWnBut3UN6eQAS97C5ko181vIV6mPB1VKj1LThzgDJcGn5qfVCulEwmso7uzoXvYCrXiBMFFMjarf6gI1zqWCsYkxexBsqeLxQ62efqF/3+iA0ZP+Lsqp5bGlNetg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUY3Y21xN2xzL1JSL0t1N0U5SmQyT0N4OGNHZWtyWTBuaHEzTnJwOEhEMFhl?=
 =?utf-8?B?UjRlV0ZmN0w0YTcxbGVwK3FTTUMxUy8yTlFsd0x6VTFhZUpKclA4aWxYWlhW?=
 =?utf-8?B?MzZtZ1dKSFJ2dlB2eCtGTE9STzVNVTFReDNuTDVmaWFXU1A4NUQ5TWM3NzA5?=
 =?utf-8?B?bEpWWnRFVGRzcWtKOTd4YWs0RitvNE81T0xXTjdPOEMwTHNMaXR2RU9wNzZJ?=
 =?utf-8?B?b2UzVWJBYnQ5TjNWOE11ejU1UEJzM2hyU3diYnRLbU41N1BUQ2dvVllQZVUv?=
 =?utf-8?B?YTBrTUJqS3lOR1VFOXZmMndEMjFFcHp6V241elZaVzNsUXdEbFVyRHZnb3JI?=
 =?utf-8?B?bFZ5RmpOaEg0Uy9sNDlVK1JoM0hSU21VcFRQd2FzTlgrTEthVUVxbDBpWEVS?=
 =?utf-8?B?SUR3ZkZuanZZclNWdEtuWm9ZQm9hMFhIQ1J1TVhmSXFOWXNVYUQ4TjBtemFM?=
 =?utf-8?B?ODMzOEtUSC91UmtmYnA2OFQ1L1EwMnlCOTJyT0lVNWxsK1BmaVBzS2lmalkz?=
 =?utf-8?B?clZLWUdmSHA1bklqYUV4SzN3azFmTlU4Z2dCUmZNZWZueUU3dElTUEFwR04w?=
 =?utf-8?B?WGpZenFob05IWDRvUm9hMFZlK0FqWFFlWCs4WHVIbTljMjdhTTFOOEtDQVpu?=
 =?utf-8?B?cTFhYkUxSk9DZDMxdS9oYVpMUFFPYmhZR25ocTdsN3FXMGJWNmFiQUt3azRS?=
 =?utf-8?B?aEI1RzVkQTNVK0FFcDdISXJCek9lNmc5ZTYwcWVuVmdLZ3BrYjV3eHVzOXlH?=
 =?utf-8?B?VmJVZ3NGR3RRRC9LUFRweDhHVmxIN05UNnVJdFpVd2pqek1NOGdWOEYycS9y?=
 =?utf-8?B?TUdOZG1PRVVjYTFvQmoxTk5JREpQZkQwTzlNU1V4dWxpQnd0S2ZUSW5ZRUFY?=
 =?utf-8?B?ZE5IVW9FUGZFVXVGZFJUUGVENjdNa09hN2R2b1lHVjEwZldSSS8zSmFYQ1NY?=
 =?utf-8?B?Y1dVUm9qVm1OZ2V2S1hrcmJUOGVXVkVxZ0hmTzBvbFBRQWMrWVBOUnRuNHI0?=
 =?utf-8?B?amJNYlBjTFlIRkx5UkVzOFNiaGtXeFc4KzV2VGpEWjNxTkIrSUlSK041djZ2?=
 =?utf-8?B?VVprWDZMc1BNcDhNNXNpUW1GM0ZCdkhiU2k0dlJSMUdwM1BGTE1tSWlydDBG?=
 =?utf-8?B?azJmVEhVam4rQWZDaEdZajNNUFdMZkFjeTF3Q2JzczUreCtVZ01VTzB0azB3?=
 =?utf-8?B?L3ZESnVCbDhCK1Q3RmVHcW4yMnoydGZDaksydEZBVGZJSXNhUnJqeDVSMFZn?=
 =?utf-8?B?YjJ4WTJGMXV1c0hQYnp4MzdZa2RZUWV5cjU2aWE3VitqTGRsYmdxdUpNQU9Z?=
 =?utf-8?B?V1BqMk1VN1BjclNGTU96UUJ6c2U0TnVNdGhhbzkyS2l5VEtaU1FnTGtjWmty?=
 =?utf-8?B?NXNFT0VGUDFNMmFvK2hURUFDOE5EMnZOdVZUN0ZJR3d3dTFnZk1XcDZRbFhN?=
 =?utf-8?B?S25pSGtmcjY5Mzc0c3drMkpDZzFrWGNFWHVMNE1WUWVCRDFhemNYR3lKOU1Z?=
 =?utf-8?B?QzBDV2t1N0dtZTZVdCs2SGpBR0VmMldleEE1aTFDUFEzc3VQdFNlWnVrN25F?=
 =?utf-8?B?OXg0QU1YYUZKMnZhZXRwTjdTTy9uQ1JRNDg1dEVIbXVUd0dtczY0aGxEbGc4?=
 =?utf-8?B?Q2kxdm5sVnB5bExuLzdWVGtCSmNlR1pQTzF0cnBBTG95QkJIM3FKODQ0LzhQ?=
 =?utf-8?B?VmVwZjdwSkJBdnlUN1dVZUQwZDkzV3NlZFp0dFFpSTVYQzNOMHVvSndXNDNY?=
 =?utf-8?B?aGM2MVV2cTUrQ3lDZWFsVC81OG92TVRWRi84WlIwNWdrT0hqdk96V296Unlk?=
 =?utf-8?B?SkRjMHhEVWJtWTcvdlB3MHB1VnVOSHN6TjV6cEg5Z3RlTFFoeVF6empsYllZ?=
 =?utf-8?B?bENCUjNoSi92Mkx5TEZGSU5HWE9QWk5vcy8rR1B0dUJBY3E1OHprK2pqRUVD?=
 =?utf-8?B?eGlleHNOUlFQWCtKV3RnbENrdWNVM2toSGJkdUxFNHpoTzFTdEk2R0FKYjFZ?=
 =?utf-8?B?anEzNDZycFBYYk1aNlJic2RITVJUd2Y1dHRxdW1qS1VzTjU1SjlaK0Ercmwx?=
 =?utf-8?B?NC9yN1VvemlnRVlvWGdoTnpCeEhGYW1PM0Y3QnJnYzJpU3NoYkxBL215bE9o?=
 =?utf-8?B?SFVRNlI5UzR5ZzRzWXhkbERkQlFhQ29NU09FQnBJbUdFQWVpaGxUUnFqYk5r?=
 =?utf-8?B?d0dtQnJUZDBSeVRtbGVqanpiNEpnSDdaUjJRalRZZDJQRWtUeUlBMDI5YUNO?=
 =?utf-8?B?eGx6UCtkWC9RN3o1SkIwVEU1cFkzOHRienNmZVhPTm05eVRlUVJoWXJLRHg5?=
 =?utf-8?B?czV3bVdrNk1Da2l4WCt0ZVdBL2FhUHJJa3lDSmRIUUJwMVMxZThBQT09?=
X-Exchange-RoutingPolicyChecked: LsWqOsCPt+e2Ds+4FAeYCRqD5mXwxram2wuAqYkTHda4qhewSvqO6vbzzGZtQk2iZz63DR+Oe8qMHreFOeMtpZqVWepotb/7O5QZDk2O+eppCXQHNFX+CkYUpdGDZE/o98LDCjhyYsQHHkVGPT9OPydzd0OYpWQMdOzi2P9lmlVV7FpvzZtdTtJVQWkzKU1+a+o+eEEsDyTtAhQ4jPp1Bq9ORB87Tp9u5KpL/AW0box/CEgu8Y0ZMQQgfki3pOir7y7N99D/RDJ96G6GA5feMyG7GqXF2dQhQfcNVZa0HGoaahoA4+wd9McC4F9w8fJFbATeUNiH+fBauF3EYSatPA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da0d980-5651-47d6-2b42-08de7e314185
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 23:11:55.3266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eIYzJH2i6F27n2kPE/o54mB4Hg6yPCsYxe5gVXbpLKJd0aAY0ofHiJKjFBMb+NtdsMx8T+fwtfXD1P4o6sYBqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7396
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

On Thu, Mar 05, 2026 at 04:34:36PM -0700, Summers, Stuart wrote:
> On Fri, 2026-02-27 at 17:34 -0800, Matthew Brost wrote:
> > Add function to enter ULLS mode for migration job and delayed worker
> > to
> > exit (power saving). ULLS mode expected to entered upon page fault or
> > SVM prefetch. ULLS mode exit delay is currently set to 5us.
> > 
> > ULLS mode only support on DGFX and USM platforms where a hardware
> > engine
> > is reserved for migrations jobs. When in ULLS mode, set several flags
> > on
> > migration jobs so submission backend / ring ops can properly submit
> > in
> > ULLS mode.
> > 
> > Upon ULLS mode enter, send a job trigger waiting a semphore pipling
> > initial GuC / HW conetxt switch.
> > 
> > Upon ULLS mode exit, send a job to trigger that current ULLS
> > semaphore so the ring can be taken off the hardware.
> 
> Assuming we do go down the ULLS in the KMD route, can you add a little
> documentation for how this is being managed? Just in terms of how the
> KMD is interacting with GuC and HW to manage this basically, how you
> might configure, etc. Not specific to this patch, but maybe more for
> the ULLS portion of the series generally...
> 

I can write a proper kernel doc section for ULLS explaining the design -
I should have done that to make reviews easier. 

> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec_queue.c      |   5 +-
> >  drivers/gpu/drm/xe/xe_exec_queue.h      |   4 +-
> >  drivers/gpu/drm/xe/xe_migrate.c         | 180
> > ++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_migrate.h         |   2 +
> >  drivers/gpu/drm/xe/xe_pt.c              |   2 +-
> >  drivers/gpu/drm/xe/xe_sched_job_types.h |   6 +
> >  drivers/gpu/drm/xe/xe_vm.c              |   2 +-
> >  7 files changed, 195 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index ee2119cf45c1..4fa99f12c566 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -1348,6 +1348,7 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue
> > *q)
> >  /**
> >   * xe_exec_queue_is_idle() - Whether an exec_queue is idle.
> >   * @q: The exec_queue
> > + * @extra_jobs: Extra jobs on the queue
> >   *
> >   * FIXME: Need to determine what to use as the short-lived
> >   * timeline lock for the exec_queues, so that the return value
> > @@ -1359,9 +1360,9 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue
> > *q)
> >   *
> >   * Return: True if the exec_queue is idle, false otherwise.
> >   */
> > -bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
> > +bool xe_exec_queue_is_idle(struct xe_exec_queue *q, int extra_jobs)
> >  {
> > -       return !atomic_read(&q->job_cnt);
> > +       return !(atomic_read(&q->job_cnt) - extra_jobs);
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h
> > b/drivers/gpu/drm/xe/xe_exec_queue.h
> > index b5aabab388c1..a11648b62a98 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> > @@ -116,7 +116,7 @@ static inline struct xe_exec_queue
> > *xe_exec_queue_multi_queue_primary(struct xe_
> >  
> >  bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
> >  
> > -bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
> > +bool xe_exec_queue_is_idle(struct xe_exec_queue *q, int extra_jobs);
> 
> Is this extra_jobs bit something coming in a future patch? I might have
> missed, but I'm not seeing any non-zero usage here.
> 

It is used in xe_migrate_ulls_exit...

> >  
> >  void xe_exec_queue_kill(struct xe_exec_queue *q);
> >  
> > @@ -176,7 +176,7 @@ struct xe_lrc *xe_exec_queue_get_lrc(struct
> > xe_exec_queue *q, u16 idx);
> >   */
> >  static inline bool xe_exec_queue_idle_skip_suspend(struct
> > xe_exec_queue *q)
> >  {
> > -       return !xe_exec_queue_is_parallel(q) &&
> > xe_exec_queue_is_idle(q);
> > +       return !xe_exec_queue_is_parallel(q) &&
> > xe_exec_queue_is_idle(q, 0);
> >  }
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > index c9ee6325ec9d..62f27868f56b 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/bitfield.h>
> >  #include <linux/sizes.h>
> >  
> > +#include <drm/drm_drv.h>
> >  #include <drm/drm_managed.h>
> >  #include <drm/drm_pagemap.h>
> >  #include <drm/ttm/ttm_tt.h>
> > @@ -23,6 +24,7 @@
> >  #include "xe_bb.h"
> >  #include "xe_bo.h"
> >  #include "xe_exec_queue.h"
> > +#include "xe_force_wake.h"
> >  #include "xe_ggtt.h"
> >  #include "xe_gt.h"
> >  #include "xe_gt_printk.h"
> > @@ -30,6 +32,7 @@
> >  #include "xe_lrc.h"
> >  #include "xe_map.h"
> >  #include "xe_mocs.h"
> > +#include "xe_pm.h"
> >  #include "xe_printk.h"
> >  #include "xe_pt.h"
> >  #include "xe_res_cursor.h"
> > @@ -75,6 +78,14 @@ struct xe_migrate {
> >         struct dma_fence *fence;
> >         /** @min_chunk_size: For dgfx, Minimum chunk size */
> >         u64 min_chunk_size;
> > +       /** @ulls: ULLS support */
> > +       struct {
> > +               /** @ulls.enabled: ULLS is enabled */
> > +               bool enabled;
> > +#define ULLS_EXIT_JIFFIES      (HZ / 50)
> 
> It might be nice to make this configurable through sysfs or debugfs
> even...
> 

I agree. Will do in next rev.

> > +               /** @ulls.exit_work: ULLS exit worker */
> > +               struct delayed_work exit_work;
> > +       } ulls;
> >  };
> >  
> >  #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
> > @@ -96,6 +107,16 @@ struct xe_migrate {
> >  static void xe_migrate_fini(void *arg)
> >  {
> >         struct xe_migrate *m = arg;
> > +       struct xe_device *xe = tile_to_xe(m->tile);
> > +
> > +       disable_delayed_work_sync(&m->ulls.exit_work);
> > +       mutex_lock(&m->job_mutex);
> > +       if (m->ulls.enabled) {
> > +               xe_force_wake_put(gt_to_fw(m->q->hwe->gt), m->q->hwe-
> > >domain);
> > +               xe_pm_runtime_put(xe);
> > +               m->ulls.enabled = false;
> > +       }
> > +       mutex_unlock(&m->job_mutex);
> >  
> >         xe_vm_lock(m->q->vm, false);
> >         xe_bo_unpin(m->pt_bo);
> > @@ -410,6 +431,140 @@ static int xe_migrate_lock_prepare_vm(struct
> > xe_tile *tile, struct xe_migrate *m
> >         return err;
> >  }
> >  
> > +/**
> > + * xe_migrate_ulls_enter() - Enter ULLS mode
> > + * @m: The migration context.
> > + *
> > + * If DGFX and not a VF, enter ULLS mode bypassing GuC / HW context
> > + * switches by utilizing semaphore and continuously running batches.
> > + */
> > +void xe_migrate_ulls_enter(struct xe_migrate *m)
> > +{
> > +       struct xe_device *xe = tile_to_xe(m->tile);
> > +       struct xe_sched_job *job = NULL;
> > +       u64 batch_addr[2] = { 0, 0 };
> > +       bool alloc = false;
> > +
> > +       xe_assert(xe, xe->info.has_usm);
> > +
> > +       if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
> > +               return;
> > +
> > +job_alloc:
> > +       if (alloc) {
> > +               /*
> > +                * Must be done outside job_mutex as that lock is
> > tainted with
> > +                * reclaim.
> 
> Where is the reclaim happening for this? It seems ugly jumping back and
> forth like this to avoid the lock.
> 

The job_mutex is annotated with reclaim, because it is dma-fence
signaling path. I forgot the details here of why it is, but Thomas
figured this out a while back and fixed the bugs we had there and added
the annotation. I can try to page this information back in why the
job_mutex is reclaim and perhaps add some kernel doc explaining this.

> > +                */
> > +               job = xe_sched_job_create(m->q, batch_addr);
> > +               if (WARN_ON_ONCE(IS_ERR(job)))
> > +                       return;         /* Not fatal */
> > +       }
> > +
> > +       mutex_lock(&m->job_mutex);
> > +       if (!m->ulls.enabled) {
> > +               unsigned int fw_ref;
> > +
> > +               if (!job) {
> > +                       alloc = true;
> > +                       mutex_unlock(&m->job_mutex);
> > +                       goto job_alloc;
> 
> Why are you jumping through this alloc/!job hoop here? Can we just do
> this in one place instead of jumping back and forth?
> 

It could be rewritten - maybe I always just allocate the job and discard
it if it isn't needed.

> > +               }
> > +
> > +               /* Pairs with FW put on ULLS exit */
> > +               fw_ref = xe_force_wake_get(gt_to_fw(m->q->hwe->gt),
> > +                                          m->q->hwe->domain);
> > +               if (fw_ref) {
> > +                       struct xe_device *xe = tile_to_xe(m->tile);
> > +                       struct dma_fence *fence;
> > +
> > +                       /* Pairs with PM put on ULLS exit */
> > +                       xe_pm_runtime_get_noresume(xe);
> > +
> > +                       xe_sched_job_get(job);
> > +                       xe_sched_job_arm(job);
> > +                       job->is_ulls = true;
> > +                       job->is_ulls_first = true;
> > +                       fence = dma_fence_get(&job->drm.s_fence-
> > >finished);
> > +                       xe_sched_job_push(job);
> > +
> > +                       dma_fence_put(fence);
> > +
> > +                       xe_dbg(xe, "Migrate ULLS mode enter");
> > +                       m->ulls.enabled = true;
> > +               }
> > +       }
> > +       if (job)
> > +               xe_sched_job_put(job);
> > +       if (m->ulls.enabled)
> > +               mod_delayed_work(system_percpu_wq, &m-
> > >ulls.exit_work,
> > +                                ULLS_EXIT_JIFFIES);
> > +       mutex_unlock(&m->job_mutex);
> > +}
> > +
> > +static void xe_migrate_ulls_exit(struct work_struct *work)
> > +{
> > +       struct xe_migrate *m = container_of(work, struct xe_migrate,
> > +                                           ulls.exit_work.work);
> > +       struct xe_device *xe = tile_to_xe(m->tile);
> > +       struct xe_sched_job *job = NULL;
> > +       struct dma_fence *fence;
> > +       u64 batch_addr[2] = { 0, 0 };
> > +       int idx;
> > +
> > +       xe_assert(xe, m->ulls.enabled);
> > +
> > +       if (!drm_dev_enter(&xe->drm, &idx))
> > +               return;
> > +
> > +       /*
> > +        * Must be done outside job_mutex as that lock is tainted
> > with
> > +        * reclaim and must be done holding a pm ref.
> > +        */
> > +       job = xe_sched_job_create(m->q, batch_addr);
> > +       if (WARN_ON_ONCE(IS_ERR(job))) {
> > +               drm_dev_exit(idx);
> > +               mod_delayed_work(system_percpu_wq, &m-
> > >ulls.exit_work,
> > +                                ULLS_EXIT_JIFFIES);
> > +               return;         /* Not fatal */
> > +       }
> > +
> > +       mutex_lock(&m->job_mutex);
> > +
> > +       if (!xe_exec_queue_is_idle(m->q, 1))
> > +               goto unlock_exit;
> > +
> > +       xe_sched_job_get(job);
> > +       xe_sched_job_arm(job);
> > +       job->is_ulls = true;
> > +       job->is_ulls_last = true;
> > +       fence = dma_fence_get(&job->drm.s_fence->finished);
> > +       xe_sched_job_push(job);
> > +
> > +       /* Serialize force wake put */
> > +       dma_fence_wait(fence, false);
> > +       dma_fence_put(fence);
> > +
> > +       m->ulls.enabled = false;
> > +unlock_exit:
> > +       if (job)
> > +               xe_sched_job_put(job);
> > +       if (!m->ulls.enabled) {
> > +               /* Pairs with PM gets on enter */
> > +               xe_force_wake_put(gt_to_fw(m->q->hwe->gt), m->q->hwe-
> > >domain);
> > +               xe_pm_runtime_put(xe);
> 
> Maybe reverse these to match the gets above.
> 

Yes.

> > +
> > +               cancel_delayed_work(&m->ulls.exit_work);
> > +               xe_dbg(xe, "Migrate ULLS mode exit");
> > +       } else {
> > +               mod_delayed_work(system_percpu_wq, &m-
> > >ulls.exit_work,
> > +                                ULLS_EXIT_JIFFIES);
> > +       }
> > +
> > +       drm_dev_exit(idx);
> > +       mutex_unlock(&m->job_mutex);
> > +}
> > +
> >  /**
> >   * xe_migrate_init() - Initialize a migrate context
> >   * @m: The migration context
> > @@ -473,6 +628,8 @@ int xe_migrate_init(struct xe_migrate *m)
> >         might_lock(&m->job_mutex);
> >         fs_reclaim_release(GFP_KERNEL);
> >  
> > +       INIT_DELAYED_WORK(&m->ulls.exit_work, xe_migrate_ulls_exit);
> > +
> >         err = devm_add_action_or_reset(xe->drm.dev, xe_migrate_fini,
> > m);
> >         if (err)
> >                 return err;
> > @@ -818,6 +975,26 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate
> > *m,
> >         return flush_flags;
> >  }
> >  
> > +static bool xe_migrate_is_ulls(struct xe_migrate *m)
> > +{
> > +       lockdep_assert_held(&m->job_mutex);
> > +
> > +       return m->ulls.enabled;
> > +}
> > +
> > +static void xe_migrate_job_set_ulls_flags(struct xe_migrate *m,
> > +                                         struct xe_sched_job *job)
> > +{
> > +       lockdep_assert_held(&m->job_mutex);
> > +       xe_tile_assert(m->tile, m->q == job->q);
> 
> Nit: Should we have a helper here like you have for the bind queue?
> 

Let me see if there is a helper I can use here.

> > +
> > +       if (xe_migrate_is_ulls(m)) {
> > +               job->is_ulls = true;
> > +               mod_delayed_work(system_percpu_wq, &m-
> > >ulls.exit_work,
> > +                                ULLS_EXIT_JIFFIES);
> > +       }
> > +}
> > +
> >  /**
> >   * xe_migrate_copy() - Copy content of TTM resources.
> >   * @m: The migration context.
> > @@ -992,6 +1169,7 @@ struct dma_fence *xe_migrate_copy(struct
> > xe_migrate *m,
> >  
> >                 mutex_lock(&m->job_mutex);
> >                 xe_sched_job_arm(job);
> > +               xe_migrate_job_set_ulls_flags(m, job);
> >                 dma_fence_put(fence);
> >                 fence = dma_fence_get(&job->drm.s_fence->finished);
> >                 xe_sched_job_push(job);
> > @@ -1602,6 +1780,7 @@ struct dma_fence *xe_migrate_clear(struct
> > xe_migrate *m,
> >  
> >                 mutex_lock(&m->job_mutex);
> >                 xe_sched_job_arm(job);
> > +               xe_migrate_job_set_ulls_flags(m, job);
> >                 dma_fence_put(fence);
> >                 fence = dma_fence_get(&job->drm.s_fence->finished);
> >                 xe_sched_job_push(job);
> > @@ -1881,6 +2060,7 @@ static struct dma_fence *xe_migrate_vram(struct
> > xe_migrate *m,
> >  
> >         mutex_lock(&m->job_mutex);
> >         xe_sched_job_arm(job);
> > +       xe_migrate_job_set_ulls_flags(m, job);
> >         fence = dma_fence_get(&job->drm.s_fence->finished);
> >         xe_sched_job_push(job);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > b/drivers/gpu/drm/xe/xe_migrate.h
> > index f6fa23c6c4fb..71606fb4fad0 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > @@ -85,4 +85,6 @@ struct xe_vm *xe_migrate_get_vm(struct xe_migrate
> > *m);
> >  
> >  void xe_migrate_wait(struct xe_migrate *m);
> >  
> > +void xe_migrate_ulls_enter(struct xe_migrate *m);
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index ef34fbfc14f0..2c0f9a99d7a9 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -1317,7 +1317,7 @@ static int xe_pt_vm_dependencies(struct
> > xe_sched_job *job,
> >         if (!job && !no_in_syncs(vops->syncs, vops->num_syncs))
> >                 return -ETIME;
> >  
> > -       if (!job && !xe_exec_queue_is_idle(vops->q))
> > +       if (!job && !xe_exec_queue_is_idle(vops->q, 0))
> >                 return -ETIME;
> >  
> >         if (vops->flags & (XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP |
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h
> > b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > index 3a797de746ad..fe2d2ee12efc 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > @@ -89,6 +89,12 @@ struct xe_sched_job {
> >         bool last_replay;
> >         /** @is_pt_job: is a PT job */
> >         bool is_pt_job;
> > +       /** @is_ulls: is ULLS job */
> > +       bool is_ulls;
> > +       /** @is_ulls_first: is first ULLS job */
> 
> This flag I'm not fully understanding. Why do we need to separate this
> from is_ulls?
> 

This is where kernel doc would help. Let me explain:

The first ULLS job only submits ring operations to start spinning on a
semaphore in the ring (no BB execution). This is a GuC submission, if
that isn’t clear.

The middle ULLS jobs submit by moving the ring tail via an MMIO write,
signaling the spinning semaphore from the previous job (GuC bypass, BB
execution). The last instructions in the ring set up a new spinning
semaphore.

The last ULLS job submits by moving the ring tail via an MMIO write,
signaling the spinning semaphore from the previous job (GuC bypass, no
BB execution). There are no instructions in the ring for a spinning
semaphore, so the queue will context-switch off the hardware.

Also, if it isn’t clear, this whole scheme only works if it runs on a
dedicated hardware engine—which we have after CPU binds, since the
paging copy engine is mapped only to the migration queue. Also this
relies on MMIO write, this also doesn't work on VFs.

Matt

> Thanks,
> Stuart
> 
> > +       bool is_ulls_first;
> > +       /** @is_ulls_last: is last ULLS job */
> > +       bool is_ulls_last;
> >         union {
> >                 /** @ptrs: per instance pointers. */
> >                 DECLARE_FLEX_ARRAY(struct xe_job_ptrs, ptrs);
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index d4629e953b01..931d46696811 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -146,7 +146,7 @@ static bool xe_vm_is_idle(struct xe_vm *vm)
> >  
> >         xe_vm_assert_held(vm);
> >         list_for_each_entry(q, &vm->preempt.exec_queues, lr.link) {
> > -               if (!xe_exec_queue_is_idle(q))
> > +               if (!xe_exec_queue_is_idle(q, 0))
> >                         return false;
> >         }
> >  
> 
