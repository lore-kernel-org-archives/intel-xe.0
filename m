Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17584D116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 23:00:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C262910E4BE;
	Mon,  1 Dec 2025 23:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k+iAMW3b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0633A10E4BE
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 23:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764630052; x=1796166052;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AuKXxoAa2y33KgkOV5PVk8i9j8/1iAcnHUHrOAC61E0=;
 b=k+iAMW3bhZTnGZpi5oHFDoPbl/aW/f3crdUH69g4LQ6pVRSqxIvMt609
 oEyxtSAhyD2HZ6YBvTvNpxgzUBYB0Vf2ZSYetg3YY3mefg4bd6vfiizDV
 iE+/xxoz7szrP8dXVL5SfNiN5yPW4Nn+Zbx1UqvwUBRBHS+747znyzF9w
 /eMed8Q61Oyk0UvkxVFtB7TBxeLINDE1JOXvsoFg+Gz1v47UAQPG5Dn5h
 oug+gOZoC4s+vfiAttnGo/W8q9Ntp2ItmFIcNABgcKSfNx3Z8mxv3CDmr
 uV2mXtNZwsunAg8eocnvG0UzEu2d//IJZXaQCmotHqnOX1u0t7SFm/hPP Q==;
X-CSE-ConnectionGUID: sTnCI/XtTziEtBg8hOxolQ==
X-CSE-MsgGUID: QHHmn7MFSrqNq/gYA89CRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66748901"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66748901"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 15:00:51 -0800
X-CSE-ConnectionGUID: o47AIKlARQOefwrJEOQt7w==
X-CSE-MsgGUID: 8sVhiMyoRi2r/GN405sejA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194030505"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 15:00:52 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 15:00:50 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 15:00:50 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 15:00:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LN1lhWVjfCTI3Ii1v+N/x8ClmdAxuWNb/cDsTBDObDuYvbLzgK6OzxZELlF6Rvf7JZ4PoLFP4eL8Rc8zkRI/suH22PiRE4RF1ZwPgAerh9vkMHpZQEfCEp917O0e06y/CogLXIuNNnrOhlzW+0tvIXSVnLd7O85hltkgxWOC/0GIKomMEzcNMiKFD03VVD6vmwizjXUcpDRry5QuOc6Wh8gposxIjnJb30TnA5nhjA98zmOp2rYxX+Zntldl+QYgwls2rQeaRs2vGC/jdx7oqO1OQ1uEdce0S0I7dS7ajqrQNU5t4FMuMJx/vvxWvqmPzzUwGFlWk2nIowyj6Jb4uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAMc4ejuEeF1z3CqFf4F2HQmXkZ0FAKk9p4C5czP6A4=;
 b=LaxPLGM6no2Y3pJC/8vuTGN5vAqg+f8Rd/+fE9jtQ19bpski0zTzvqfB+HoHVoVxF0IheMz/rMWpYivYRtq0WicGeAl+r2/rRxB3ni8foWV8/FCmXLEDgsi9BA5CdNxx7Bh0twnEjJErtpfPHObRIiIfocSI4JASmNjtb/0AgRMvJ1+3No277g56pivCNnsFXlN6DZ9v1QRrQUfVXJRfralrnPY/5qNzd3dp6lICeF9rjGimZeg+MfvOyovSL3LMEzgdRbpzd/6bvIPQE4iKjAdX7GHp0tle998FLi6QTR7CA+ikjfP0KgahjwGZbUSVTiN0QXNdyosWDoSCtDZ5Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5020.namprd11.prod.outlook.com (2603:10b6:806:11f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 23:00:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 23:00:48 +0000
Date: Mon, 1 Dec 2025 15:00:45 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
Subject: Re: [RFC v2 1/9] drm/xe/uapi: Add UAPI support for purgeable buffer
 objects
Message-ID: <aS4eHV3H/qcb3uOz@lstrano-desk.jf.intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
 <20251201055309.854074-2-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251201055309.854074-2-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4PR03CA0344.namprd03.prod.outlook.com
 (2603:10b6:303:dc::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5020:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e734988-4d30-4a77-f678-08de312d7753
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?PLlfzzYz8v7+HjFMIst29PYhQkODFe7vQsSjpBI2XvH8n8mpxzkoJagtuu?=
 =?iso-8859-1?Q?Rabdr3jwEdMFHWRjfJe0Ex+rFvi+j+WvS6gZtZtQtrP5u6y6djxsjKZWtz?=
 =?iso-8859-1?Q?XCeWwMej9ShtrkuDwU4Hxo1JJW0xBLVT+UgpZs9ADdVsYUuH428qnsT57e?=
 =?iso-8859-1?Q?jpk4U6KZ/ZiJItfgp8oLJzUMLsd2cX3itwsxRMm7nZgYObN9PkuHBvmbRu?=
 =?iso-8859-1?Q?ojuvhJWjoHzRY0QbZf4Mg3CG37gizC53gCsx1xMDnMmCYlmJ5ABvjZWQ9z?=
 =?iso-8859-1?Q?howwnulDZVSP0lHPrc9Eli97oBlCingN/J3j30Vkd/Lmyn/zLfNAAYjUaZ?=
 =?iso-8859-1?Q?b22sHVdRge23Wmk0Dxl9ceWRYtEwLYvZIo69fRtZFNGw3/VQkDm8dQUmcc?=
 =?iso-8859-1?Q?PGD9LkAwQG8+U5Nr9XOu0S6oSNc1Zdt6YV20Ee3vXVsWxh5k+ZB/29WgzY?=
 =?iso-8859-1?Q?Br73VH/L8znC1RCSllWUASCpCnUArF6a93Ug654wCwXXd1x5c/XDfzsqgS?=
 =?iso-8859-1?Q?3sZ6/oqQIQ5eaF1faZavpQHVVQcxh2T58tCU4PlMrFViKwrbmChG4UfvA0?=
 =?iso-8859-1?Q?VpBGRWI4hGm7Wf159poLE8AuxwsSO0Y9Xlj9yg1poLxG8EnhgDarTZfeUY?=
 =?iso-8859-1?Q?K4wdJMF+zZ4yOPAhR2B9Orvq/6vCdks61CjnBg0PqNSbFO8E91Mycw9B8N?=
 =?iso-8859-1?Q?CV/F95qASuBR2ZWxdjnliGRfl20QrHjAkojPdmRudWGY9kz7HTSj6VC2qt?=
 =?iso-8859-1?Q?B3Xz9y3jbBbd2oHEqPXt83iVEyv54b1fzp/foYoCtK1FU+wFs+7lLt9eAp?=
 =?iso-8859-1?Q?qzegAY+QkqpUDxYII5qC3H8SAvS6yA3RjXY9bBp9iNImSpZc2XJphdQdux?=
 =?iso-8859-1?Q?Gd32s+Jt2qtgzzy1fnhjeP6tvgwTKg+Q6+PMKcD7n532xo9CdTDfG65en7?=
 =?iso-8859-1?Q?4vOosyjAKm/RZJOu46wipRXfuJq9qYGNIWN7gYaqWlAp55xEHdvrGF+l6e?=
 =?iso-8859-1?Q?4XUgfZPri+QkIcPgj4YUh+z+qfMNlUpD5JbluZcZzlUk5raHFpbEGC6Eo5?=
 =?iso-8859-1?Q?pgaDTylCLwRFu/IjXws2GQTZprVLyi/F6PPA/wg6/H+2dTCUxXbdm+sekv?=
 =?iso-8859-1?Q?3s2TBDd0mVOZ735IYeylxyqnwq2WQ/d1/y07zJ7NxAEmlba0dl+vkG63JA?=
 =?iso-8859-1?Q?jebt7A/NktaNArM6T+e7zd/3jtlxwZ2hjb461LyQQzV6rVya4iFw6OvH4Q?=
 =?iso-8859-1?Q?m/huBkFISUZoO8QEaRt0CA7e+IPCgLE3upt5ovB2twcpBnUsrwlzsdjmJf?=
 =?iso-8859-1?Q?+1KPAuSQRb5x8mvcmCWfqVRUdM3m+zxr5yfxfK8ZwZr87Zdy7F7/rlzBdb?=
 =?iso-8859-1?Q?/4NyJCDHkrxuhZC/Rmeji6pHcMrt4Jh0lkWwqkei2Yw63PD+gsGLBI4gZU?=
 =?iso-8859-1?Q?vRzU+AuHUj1VjEY5zvbQkX68nuiBUQdUWk3w7IhPaOdG+EWCtFwut4/Ln9?=
 =?iso-8859-1?Q?U3WYvamjyReLp6GvCONBBE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OoErVhACpJLX4f77xwUfGcGYbvhEMrf8auRvGjwYqT2kdgU3uMk4Cpa/Br?=
 =?iso-8859-1?Q?rdbcmvm+73tlCCx7j86HvCMxAq6IJSpah0nPTgfgczucxl94fDU5M+BhoD?=
 =?iso-8859-1?Q?FzICoJfSu64uqfJ30mHaBKoXmEcOXzxEQlCCyVtSUp3338hCgrpsmrdSKJ?=
 =?iso-8859-1?Q?aNGXLhEhafBnJ7rY0KBG3edujmZny8f2V0wXhQeB0x4Sx7kjrLoTkJIUt0?=
 =?iso-8859-1?Q?5q9MyY67xLp44e2k95vAgEYfgBhdlRJYlDeiK2DexZrD56ktYCNlS6bmqK?=
 =?iso-8859-1?Q?KtqIb9f9uqHDPwHRVNGlrWqiaJj/433gu5h432i9/T53/iDECYVBuDcgyR?=
 =?iso-8859-1?Q?WlhEJEN/llKjT81wi0wwif0qMkqG+FlKk9w4BjZyCSkoubSePW/nfLPdf5?=
 =?iso-8859-1?Q?YAFL8/QjqVKR/giB6JIqcqA87eW20YZ+3yx+ZmkZ40qkClwBtxnnC8JS5n?=
 =?iso-8859-1?Q?FvKWqxiomBChjaWSNCxeE1zZpbYoy26jB4F+aQe4JoCrA3FxcDQbEI0j+8?=
 =?iso-8859-1?Q?+8HT5OpWH2SCaJUnq7F80oQzuUcmI2e2vu0UUpBvjDpNMYhrT/c8im8Pue?=
 =?iso-8859-1?Q?zPYlOMLs5gurVfmpyG5h67cHGrpsSyni2iDO4pl2Ks67rXnvNx1ExwjELy?=
 =?iso-8859-1?Q?ZMyVnWPpJ4gvtpGuREGKSmdGBgFcH+Ci9rNevVPdr1+ozWsd4+RMuWaeXo?=
 =?iso-8859-1?Q?x9P4Jm58yrYhQrnsA2KPdn4vcKf8fmoLkLu/N/NDT/QZ1JC11svLamfEyF?=
 =?iso-8859-1?Q?jCKWZ4ZJlnqFbEl3ANkRTO8f4RhDEnZoLtJ3sQedAcJ8VSfSFVw8TN3fim?=
 =?iso-8859-1?Q?Xg2fklS1KyikrVTPmxxcSiWoOgFXwQoNOVwfEBeH/oOnAEgzEXv6B/zHu1?=
 =?iso-8859-1?Q?P+xvVJeIoeCHH3BgKkXNC4B4zCB1hO8gr7kaY3+IfpWUzX6zwuev9r39sj?=
 =?iso-8859-1?Q?p9helJTR0wSkdjwKGOhYCW3qwrSE+MU73IrZqwC4Pi2vXfhJk1v+DiI7tu?=
 =?iso-8859-1?Q?JAFs8/HGoqKo7xbVI2rOHVSgy8GQGaZHd8swkVLEHklrxGfVv7FXbUlq0/?=
 =?iso-8859-1?Q?jvGpMyG8OQTiAXAYTs4SbDfFDMiIzus0HfurrbIl5YvKZ/TuWp3nZubOpD?=
 =?iso-8859-1?Q?XAlEzNj0un8/p6Zf+jtrrS9O+9ioADapAJ2QjNKouKNoiqKmC7Ed02MOM5?=
 =?iso-8859-1?Q?vYMcNzEULIMvP3J+xn8qWmbJ646EPMf212NrXj3dv2xTnMVNlNcDAa/btJ?=
 =?iso-8859-1?Q?xwBSJPExtPA8L0TE8NQWX45gEBJcSxHeWuDsE1r1IuD7BkDMcH3WvAr5Ny?=
 =?iso-8859-1?Q?Mq3uSXHXzu3Yj2RJB/AAE7qxCIVw6TmVFCP2h+mppG58DKrxUiq8B4MBZr?=
 =?iso-8859-1?Q?/M1IyzmWgOvtzdRde7aBFVQxUVtFKs7l69Kn9lC9MyRk/QnOA4y6fucOUw?=
 =?iso-8859-1?Q?7k6tz2wfgb6T+aTyMwFcY/t5Ux2pIlCc8eg7AGsTcv4xAnCdDe8Pwd3Bnn?=
 =?iso-8859-1?Q?dqx86RkP+mmdPt/HVPzLOn6q+pnJTJ6/RfHS589EX66wta2qIMWQY9PFgE?=
 =?iso-8859-1?Q?aBgC1Mo2udreuEHs1PYWiX9y90Ky5hc1Q2qFnxEW9K0o7/Goh0Nt6Vc7gH?=
 =?iso-8859-1?Q?swhZIc3RIEEqlh8k4AvTURtiZzTa3mDny0RaT9EYxlefsxLOnlP1PwNg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e734988-4d30-4a77-f678-08de312d7753
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:00:47.9452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QWTz7U7jjIh5YTP5usg8MJohvKPryZng/bTkP4hdUJEU7MdMpufrSUcO9pZ5pmE52d2YIEjMp7mMGkJJumDMag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5020
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

On Mon, Dec 01, 2025 at 11:20:11AM +0530, Arvind Yadav wrote:
> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
> Extend the DRM_XE_MADVISE ioctl to support purgeable buffer object
> management by adding DRM_XE_VMA_ATTR_PURGEABLE_STATE attribute type.
> 
> This allows userspace applications to provide memory usage hints to
> the kernel for better memory management under pressure:
> 
> This allows userspace applications to provide memory usage hints to
> the kernel for better memory management under pressure:
> 
> - WILLNEED: Buffer is needed and should not be purged. If the BO was
>   previously purged, retained field returns 0 indicating backing store
>   was lost (once purged, always purged semantics matching i915).
> 
> - DONTNEED: Buffer is not currently needed and may be purged by the
>   kernel under memory pressure to free resources. Only applies to
>   non-shared BOs.
> 
> The implementation includes a 'retained' output field (matching i915's
> drm_i915_gem_madvise.retained) that indicates whether the BO's backing
> store still exists (1) or has been purged (0).
> 
> v2: Add PURGED state for read-only status, change ioctl to DRM_IOWR,
>     add retained field for i915 compatibility
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 37 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 47853659a705..02d63938d16f 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -121,7 +121,7 @@ extern "C" {
>  #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
> -#define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
> +#define DRM_IOCTL_XE_MADVISE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)

I'm not sure if this is something we are allowed to change per Linux
uAPI rules. I'd check with our maintainers (Thomas, Rodrigo) on this
one.

>  #define DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_MEM_RANGE_ATTRS, struct drm_xe_vm_query_mem_range_attr)
>  
>  /**
> @@ -2051,6 +2051,7 @@ struct drm_xe_madvise {
>  #define DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC	0
>  #define DRM_XE_MEM_RANGE_ATTR_ATOMIC		1
>  #define DRM_XE_MEM_RANGE_ATTR_PAT		2
> +#define DRM_XE_VMA_ATTR_PURGEABLE_STATE		3
>  	/** @type: type of attribute */
>  	__u32 type;
>  
> @@ -2129,6 +2130,40 @@ struct drm_xe_madvise {
>  			/** @pat_index.reserved: Reserved */
>  			__u64 reserved;
>  		} pat_index;
> +
> +		/**
> +		 * @purge_state_val: Purgeable state configuration
> +		 *
> +		 * Used when @type == DRM_XE_VMA_ATTR_PURGEABLE_STATE.
> +		 *
> +		 * Configures the purgeable state of buffer objects in the specified
> +		 * virtual address range. This allows applications to hint to the kernel
> +		 * about bo's usage patterns for better memory management.
> +		 *
> +		 * Supported values for @purge_state_val.val:
> +		 *  - DRM_XE_VMA_PURGEABLE_STATE_WILLNEED (0): Marks BO as needed.
> +		 *    If BO was purged, returns retained=0 (backing store lost).
> +		 *
> +		 *  - DRM_XE_VMA_PURGEABLE_STATE_DONTNEED (1): Hints that BO is not
> +		 *    currently needed. Kernel may purge it under memory pressure.
> +		 *    Only applies to non-shared BOs. Returns retained=1 if not purged.
> +		 */
> +		struct {
> +#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
> +#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
> +			/** @purge_state_val.val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
> +			__u32 val;
> +			/**
> +			 * @purge_state_val.retained: Whether the backing store still exists.
> +			 *
> +			 * Output field indicating if the BO's backing store is retained.
> +			 * Set to 1 if backing store exists, 0 if it has been purged.
> +			 * Similar to i915's drm_i915_gem_madvise.retained field.
> +			 */
> +			__u32 retained;

If we can't change the IOCTL to DRM_IOWR, then we could hack around this
restriction with making 'retained' a userptr which the madvise IOCTL
explictly copies back into rather than relying DRM IOCTL core to
implement the copy_to_user.

Matt

> +			/** @purge_state_val.reserved: Reserved */
> +			__u64 reserved;
> +		} purge_state_val;
>  	};
>  
>  	/** @reserved: Reserved */
> -- 
> 2.43.0
> 
