Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9B9C43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 22:13:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995F510E51B;
	Thu,  2 Jul 2026 22:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DzPAT6W+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9756610E51B
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Jul 2026 22:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783030394; x=1814566394;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=LyiLmBjHKlgXy0bAvpnQiE3L5HpInoviu2amItjsPo4=;
 b=DzPAT6W+WH7P8vk4ZVYgtqMy6vsGXT2shnUKcydh74Jt4NmTfQ+2e9Sh
 Gov9oDeK1nKlqopRECwS2w1azbdpYSWvnrLh5UatqPnX8d/FNi5g8a7g/
 2DAoWc1EmBcVUhnUYsiEvj0aZt4EK7XtJfkzRSe/mXwLfbn3Av1NErFHk
 Gxt/c1CtMb3n8vg/o1mqqnrFy0kX9IWYMsyahMJPVD1s0DyLXnfm7r4K3
 54KwXPZW4AeONXVJKe9qfJmpI8hduJajhzvisQFI3zzv5jhe5EU5EqQaP
 zeTPXuFBEaltRn4sxdVCj9U9RKM6HwDzz1mU7vUbP/ByLD9YHHpWCoeuN g==;
X-CSE-ConnectionGUID: EGFrYfYcRTuPd7VYqWvXXA==
X-CSE-MsgGUID: CFeSlUZISEmoSs8/Bvn4Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="101326491"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="101326491"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 15:13:14 -0700
X-CSE-ConnectionGUID: 0NO0HWlXQraHrQFMFixpQw==
X-CSE-MsgGUID: ShrE+QG9RZGqozFTGl8zAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="248516340"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 15:13:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 15:13:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 2 Jul 2026 15:13:13 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 15:13:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbZtVmgMoh30nu9BxJNf5V2fnZMfoHFeo/qX/yb4aylAU7zZ6aFHWn1KytfHtYOkGVKBhsP6hmXLIuMat8A0VF/H61/HhNQsOsrY+PIoLcV70hAbGSxHoHdMlJPOB4RUdPhXzz47OEULGdH3Gy4amw6qLgsJytpbtqC7A8T/Wfvm+vN5ezdZLTAntG6gMuybX3Dm5E/yK886bu959AavSI7mJ0aGqX3LRbTU+gDnH+mSWv8DsOxLJJmH7ZSNktsGLSmbY3fDST4/Nm7syh3ieMWMgc15pY4Hon594v5f50bRnwxyYALXeYSYjzobWrcPxJG2x9E5agiKW0UwUp9Yyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9tWxQgngdqTSOns1l/9pXJTLohMP5G95Qpz+BQN9pw=;
 b=IlBJ0Z2xLR8DGlH838j5f1au9Of1IDEvOKhViRu4BGzAKl9HKhDB+gI8hjcHHozCjVAamLo81FIGXMMBd+9ytnc+ewvKLQW7dUq3dAXKtcnA+0fGwjRrRBpd1ZJOfc2LWWUNQhdqUzFGxxeVmu09oBVOdRcQ4nRPs4cLqCc2o1Abj1RyD0k6GHNrMVs5F2EBFjpE6tldWAkJXD/aio4xsfVtF42oA+ohc2jYP5py1qEjtbuypuyGLDjvHfdY03IV/ES5EgLyidDxy9xwsDu7I4SUXZa/IqNxawdC6e1z9pG22xXZOKcnDfuDKzZ3pVG9MgybnJWhGCH344Jt+SRH/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MN0PR11MB5962.namprd11.prod.outlook.com (2603:10b6:208:371::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 22:13:10 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 22:13:10 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Violet Monti <violet.monti@intel.com>
Subject: Re: [PATCH 0/9] drm/xe: Probe info outside of xe_info_init() and
 xe_info_init_early()
In-Reply-To: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
Date: Thu, 2 Jul 2026 19:13:05 -0300
Message-ID: <87jyrdyr9q.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0122.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::7) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MN0PR11MB5962:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f0ebec5-f519-479d-6676-08ded88719ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|3023799007|6133799003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: WcyiyNpY7lr3ykgY3Wr1Kjc3NlNZMDopFxu+RvUn6Hr7iQPSUpHO2mJmCMfQkjgMGWPiFqsOTcejLPzx64+SJgff5XjOIJzxHTXfkgNzDOq8bfg1xUK0mPWlyDgFUs8k2fERl/ocr8pMlJY8nxMKbFDvNl3ctkj7irtsAZoRSYf/YF36wFFV5B0OUJyLUOYAv/UwoLPb+ml1E57J2XzmMs7SmapldFu5X9NBW+0nBUUZPaR8p67pZN35P9Aa7WMspT3wNP5os2Zs/VhT/NLFlVONXyKs24lKbK2/oTQxokeKubEja6zZUxEGTo8rB5Osl/uAGAeN8EUw4hK3G+Zn5vHZHJ1Rep2rx1omEt/ZQDnC1aAsqK0QUq7xOA5MMeQE/a6VhGgBs79JaN9W7490gIJGWQAm22EhSbdpngs6prswDQL3JEz2IzTs+5Gy3tLNI+NkJ9Zv+ObMMn/mxfCHnScctcxfV0YiF3kPHonU03W7O76G6i5qc70UHY/cxmSGGQcnT9C1z53KbrzQZb/7YsTBzLNt9J7TG1GQkXIVRJmwUXGj/JqO2DxJi67RgZHb5MNLpdzapBPXPwO+BXeey6uZK5NTiUmBGtf3cR3ggz0VNm+IQCQAYIzLZNR5h4cYrw02nyNxgcdu5W1iBdZlWauciyn/Ij0bDlQeGRojTPU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(3023799007)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pbifD004wjeU18wAmPXlq6PgjJdCDa8htrPV6Jb9e2cAZ2H/ClT2L4TOMsxZ?=
 =?us-ascii?Q?JZK2a7CHpqxqR8d2Oj37rv3kxsvAEScDfXWS4wpR+ZSJo4M0WnubbTkjYMZh?=
 =?us-ascii?Q?CjXJGizr+RuW+t9CzNqKN/iiS/OpczuLMb5BmZWuQaL6YnvXMu9beCL5vohZ?=
 =?us-ascii?Q?EbrPNC1Nc1DOJee8lcnPLTl4pxYbui3HMd5l2f6NZNGfoWDRKFT8ynCpL4hd?=
 =?us-ascii?Q?vxFS22ShXYdkNGE4Ug5EKmPLQsD7V+NGT2+BIvvmP3rJ2DfNTvHhbochbcHp?=
 =?us-ascii?Q?BB54rrz3DDGDXbME9GzZNbDzFFTXNgxQRE8INHbSxO2EkrrI8HEoEiHOaqSY?=
 =?us-ascii?Q?H5MyjXa43jp0LH5cHRo+8gurtmDcy4yRrtmQzTvqlZhjFgaEzXIqDTOnMUxD?=
 =?us-ascii?Q?nQjvftvLf7ZmNt+9lBKYStkUeDqyzDWbrlNjvRa8aM2pqNXoXs0lb5C+EcP4?=
 =?us-ascii?Q?At3Iju6hjFvQD1SwMODVqex9j0Q1PAd0eFjNUiOasIsxE2iVDG8ywJ5SaUdu?=
 =?us-ascii?Q?aoLx791BK1lcfmrgz1mu3tYz4I8NCh4XESvtK4vfherUc4zBtBpAmwrrEzjB?=
 =?us-ascii?Q?H8kksCSgW4nUxGgCQGIM4F//Uf+JSJzlD/cz/OMm8DP/gAIUN3yH2KAH61Sk?=
 =?us-ascii?Q?fQC8vc9tJXlI7I0CmCHDpG5DPAL87HSj3kPlLbhp3TonIsR+32DjDocUC4Wr?=
 =?us-ascii?Q?bV0hTqFWaT1swfZcDp7fIK2ZT30eu7aF5mcSsGThOK6c9iPZ50yZC9zdaHqf?=
 =?us-ascii?Q?55dn1oXuvRv6AGDKeM2ns0mPzqVWANUwptaftSiFS1vlqeoUaNq1z4/Cq8lp?=
 =?us-ascii?Q?4LKTWL0S/iCTnGtb1pVbFlbYAPsFbbohlr4I6Ldqgik7PPxNXQ9ZIpsFDD5T?=
 =?us-ascii?Q?nkuk+vMX3radljV+YGk6EmFc/z+J32UIAOR5ksAOLH2F+p7i03zCFSPhKeKN?=
 =?us-ascii?Q?Q57hUMXin22CDiujZVDDWeKZ/11m92ftGCh2fOlSjW7D5VYjCD/z78x1ardS?=
 =?us-ascii?Q?iZNOsu1yeyGNY7Zi3fAhBBDfyRjS8XriRXikQ2aJ1+ceXHEM24FSbwfC68P0?=
 =?us-ascii?Q?eNnuf1YHOeHFVxF4GtLAapkDZQ2lOFyFxd8HLQD7VgA822RCrSbCA/Ie43v0?=
 =?us-ascii?Q?HOhJIBp/35Jt/NzOqVahg7mPTDaa/eFnuLhBU5ZPTf8sxpXtXpJRy6OHph3I?=
 =?us-ascii?Q?VtYkWPmmrRevU903n/ks6qOO8csHjVSCl0ZE0FudBjDZoi27bFmKAsok3rBH?=
 =?us-ascii?Q?YuK8BJvBdSC4sLL3anOXvgKBvVAfqKgtiAn/ux7NClnQ2/BDYZvQH5tGT2XY?=
 =?us-ascii?Q?AO+9nKld+uvZ8BUQqUXmqKQrqco8GPNtXfIiE3CEdsUJ8wg9i68rhqV9RSX5?=
 =?us-ascii?Q?q42bFlP+ERHmEb4V0oioofKxi0RYFKWXbLS6hLM1AhzG0wFcf+9ytBanJLDo?=
 =?us-ascii?Q?xLL9JcDjnYv3oTslO0LUv7vDuSj4VVWSr5TOD3l64a8itJXarF/YHDVsPt8F?=
 =?us-ascii?Q?KpgQZlMoE44rYqOvc8rBUbWk+xUpfC3qsDm67CFink51oq3p7N6/JruUo9Au?=
 =?us-ascii?Q?5DUM1OUmi0IiQanRrdBPXZyr7sLoyfWEeFPDwHtKMwMzhm1+k7tGFq3X2Emh?=
 =?us-ascii?Q?Zg5DBhc28ZfZ3Kzl/S5U3qp187rKWCwVqFDWxoTNT+Lyox0KpvNl87syYN2E?=
 =?us-ascii?Q?3Ey70vxnqaN37JyRsmEHGwOZfEcQS0I8iCCFbMx1aCGoB3CnVDA6TsqbEG+E?=
 =?us-ascii?Q?XABMS9b3Sg=3D=3D?=
X-Exchange-RoutingPolicyChecked: kOmLOuFY+IacYU8utw3mpa6/MZLAm2zdHOr+GWpxZJolFLwbPz/+Ed290OTIM47yJCdF8CQwmzfUHX/5You1lnyR0XWZwTMHA9O1Gx/bSVUGpMMDWJsundkPEgMz19wuXgR8lcLLqbWTj9z1Q4l/nV4CWK1h8IqhlBKHUWB/PyhCH6+0J467ZKXlfdTR2B+XJy1UErenlNfcIedEJBC7D4qKmvFX9HoSypg2Q6t3EwASSPjwAuPxt4RcmtUe1GkwxF9WtH4oZrUzMaEwvmxocpthPKMY21EIz4olyof2312UTx1xrcmmE5MZNWQ1PDQkSv6LuKclE3+Uu9W0ZCpz9Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0ebec5-f519-479d-6676-08ded88719ed
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 22:13:10.4213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8hpJQTXpIyw3lZlTO/WPf3lKWXG2Rd7M094N7WbXmijiXfzXxRIt7nPOzHniWo63KY89wGpU8V0zFvR1BGXwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5962
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

Gustavo Sousa <gustavo.sousa@intel.com> writes:

> Functions xe_info_init() and xe_info_init_early() are meant to
> initialize fields of xe->info, but they also probe the hardware as
> part of the process.  This mixed responsibilities issue makes kunit
> testing need to rely on static stubbing in order to initialize the
> fake device info.
>
> To make the design cleaner, let's do the necessary refactors so that
> those functions don't try to poke the hardware and receive and info
> that needs to be probed as parameters instead.  The end result is that
> functions xe_info_init() and xe_info_init_early() become better
> reusable and we have a cleaner tests/xe_pci.c.
>
> This will also be relevant for an upcoming series that is likely to
> attempt to do fake device initialization outside of tests/xe_pci.c.
> Nevertheless, even without it the refactor is arguably good in itself,
> as observed by the end result of tests/xe_pci.c.
>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
> Gustavo Sousa (9):
>       drm/xe: Add framework for info probing
>       drm/xe/step: Pass xe_step_info to xe_step_*_get() functions
>       drm/xe: Add devid and revid to xe_probed_info
>       drm/xe/step: Make xe_step_platform_get() independent from xe->info
>       drm/xe: Add platform-level step info to xe_probed_info
>       drm/xe/tests: Set non-GMDID graphics step in xe_pci_fake_device_init()
>       drm/xe: Add graphics/media IPs and their step info to xe_probed_info
>       drm/xe: Don't initialize tile_count in xe_info_init_early()
>       drm/xe: Add tile_count to xe_probed_info

Applied to drm-xe-next. Thank you all for the reviews and feedback!

--
Gustavo Sousa
