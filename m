Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906D7F34C64
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 15:45:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC0A10E2E7;
	Mon, 13 Apr 2026 15:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mnsRHtuC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479A710E2E7
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 15:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776095110; x=1807631110;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=myflnZ1bJ7e572zgR9ccVrZrMpcdf3WSag/Gok2SG5E=;
 b=mnsRHtuC7coiLZU65j/fyui48po5S+ARBNCWr+xc35MCoq+xNsIlF0K+
 CHL+Vlq2h0k0dA6ev9FbcJSzI56kSqa+KCilRLMF+Jfuz9u53cUixZM27
 L5SKDMUdLyV7vRGnBjyauTVKLD0yI9CXod9hzVSg3GHxMDHa3Lr9iYglM
 KbfDq0FN9JaexmmpnoGfln3AN/XSd+L3gw7Ed28c5dtUNzo1zOIAsiR76
 ZWGRIOeim88C8pCR8zaXNVUlwW1dTgcUt5RWYQ0lmUxQm1M5qkG6cMlaT
 JDaaYAVGE4Pk5bPGlG8FPd+etG9kfK5QxjmtdVE5gzydXAPar6XrpeNGC Q==;
X-CSE-ConnectionGUID: FJJN8zxSS3+cjBGYc1LMnA==
X-CSE-MsgGUID: qjOkcQnGQN6/l71q3v64zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76998520"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="76998520"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 08:45:10 -0700
X-CSE-ConnectionGUID: 8xq2rDIRQPy7rn8PsG27+g==
X-CSE-MsgGUID: JHKvT40KRAGAUMyZznQ1BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="260258731"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 08:45:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 08:45:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 08:45:09 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 08:45:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0Zn2zoXy66jTBSf2oYbtGvqB8RmhvSwUW6QrItKQBZmHhDKjS1977OPk3E8a+hrnzFqgayauGCm/iGpOSGArJxeIoEdTIhyOEFUlIHbLnu3ZLPDximd7nUG01OxFtzXn6Ow43qGbtrbYDQcUeztt7V1E8miaYWwp1VMRzZOVDDt2kIIhpwToJ1I282JVUHLvkkyKwFTpz/u3CF1KRxWpqlXXmjOgbd/V6gt3Rgdv7LqurksB90HYGMwVeYET+4NTb+JcxUyoufCUJQK9eo8G8MWsUUAy6+eaT9GcHoDtKcrh5cRWxtyVwPhyB4fTtsYoR2/T62+7lhgaXij8CmkrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwnxKcJ99NYEbfvqpBOWDaRI+fVEYovBkoblZTUXW4Y=;
 b=bkzyiZsKDSWG865xV3wKmSLsqazHTTn4yXoIg6fvkvYbSoFc4iWHrsK3Yq1d9xCpu/VvVKN5N3jdlIWYog2cAXLOuOFgtZTG6KOir0uuI5rUNFcNhDopX/HSJ3nChoL9WXC/iimho0zZ11p3/8H+rmbjRC8gHk+t3T1ZUv76J3awD+iPf4wpEjMa+XaTUgkVUWsDdec6wQEFR41keIUjynB0svCHSiWHE/aVF4XqxVxpGYlybp4PC2c0H2pr8VKpgMpsuHrT6brpmKMBYwG1Je93arE9ZcRZvW5TcxHUlP00UPfxJ0k/oYsKT6yoTu1aLiOpBkKwNdBAGlG8NUR5SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DM4PR11MB7327.namprd11.prod.outlook.com (2603:10b6:8:105::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Mon, 13 Apr
 2026 15:45:04 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 15:45:02 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Mark ROW_CHICKEN5 as a masked register
In-Reply-To: <20260410-xe3p_tuning-v1-3-e206a62ee38f@intel.com>
References: <20260410-xe3p_tuning-v1-0-e206a62ee38f@intel.com>
 <20260410-xe3p_tuning-v1-3-e206a62ee38f@intel.com>
Date: Mon, 13 Apr 2026 12:44:58 -0300
Message-ID: <87h5peooed.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0049.namprd11.prod.outlook.com
 (2603:10b6:a03:80::26) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DM4PR11MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dcbde1d-aed4-43d1-7be3-08de9973a05d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: EDY2orFDrAyhAEOOf7kAuAP+lYoKMuYaYf97nUgvyBAYBDGE/PUD3uVBVxC6qoLlW4OR9EuCtXPNcanBfBxaOjpCh+PMUPpoujrCAdet9VC7RSqJvERvFGWg68FPUTSeDA1so1Z5OBab6Gsronj74hDGCwNRnCOe0c5AKE7IELf1DNr/51VLivR4OLMwypTFWyRaDRZYYBRhW7FKukSX2D7T4V57l7vTW/uyi3V8e1lypRoKkJyXbYMw8+ena7XUqoFOMtdeAliaTtzhxiIoDR0WXsB7bVHcHyIFZPWlBGPhVzwnUC3GK5usTXSt33AshbE6PrPB6B0qDrMNvCVWC+1yCREuyVKpwf9tmeoXOqV+hZsE4zs2coQIFdf0xB7x9YXS1h3rdy9pimSfZ+DHZPJQj8Kg+uc6J48F1WgA6h2tkJVS2MUY2NUDHwcTumiaoH6im8wFboljT+8TezMjdDoW0jXk5lYEp2UQ/v1h5SPqMAnjLB/yNHbRC0We2gjc62QKnY7SS4/0/RZk/unw414C+Nk20/iytYbIQQUFEo99SSrktteQfdxJ1SC7nV9Kt7A1SekwXhkgPpRHtvkyGw/rHAKBIvfaQmyt4AUcLWrTScWPg0Opsr5Cr4KjG0UysdeRmbEdo2E9lb+JdDo9OeXTUjzwFpeFpqQnfm0azaM0dx3bI0+XKNzopSbuVSNwym/dDwtqDx1rrG0hEKmdoccZ/4GkSxv27iQFF+4s/lM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QbgnERPBUGFrHgETgz1J0br5PpAwQ2wVaEo40YRyACSiYWZ7mwcwvIYK/3lS?=
 =?us-ascii?Q?t5ASdaUlQt2BMWdlr5GPIAhK4feUZgE8lHkaIc+UXZo076n1FRo141ssatQ2?=
 =?us-ascii?Q?j3TQRcaG5ez7G+pnu0mJ3upN/y7r4SplraTRMs6i9vHyR10jOh7Na+zI9lRl?=
 =?us-ascii?Q?Fr7bf+D+TsSkZKXm8HBy1rVa0k4olioQ1G720tNTwchgLRwzqpaXnS4zJ0oV?=
 =?us-ascii?Q?s3o4RbRcve+qlJzHwdJZ+cdlbv+KMMo8hgCvKQbetHdJjEzb0HfVuJeCjjGX?=
 =?us-ascii?Q?6VGN+owUtJijx+9WcWZxF3U3+0KXudeKNIXltsOo+gOLa19M7x+UFWi5QwEa?=
 =?us-ascii?Q?OBY3TQeY3dGATNCO2YOgt9Tm6nzg6BZkS6T45/fJNVYdAptBFpcquR0QmAE5?=
 =?us-ascii?Q?B+XR+CjwiyiN3nYIdTMAIGuhZVlUaikXAo4Xi2/pO8Oo585h85TV7i0MHv58?=
 =?us-ascii?Q?sso4B8yVJ4ILa+goGik7SwBCtjsJ5RQCYOfqLURLXZbpxP7Np/1az5LK7W9p?=
 =?us-ascii?Q?15NcJ2/cXutp1FiCuZ9FF3S/w5sqT1oyuAFjWHI8gkXWs4zYv0sX5d/CItyu?=
 =?us-ascii?Q?4mDqF19JKUv6x2fPQRBvh/tQ2WCBs7GZfW4UGAB8BKmSZqqfTCIDjGnFEyHs?=
 =?us-ascii?Q?wzpKbYy/4P4EruSdE4IZJ6ebzbsGxyMKHCJx34qmSJ+meGtGJ//g4sBKjFs9?=
 =?us-ascii?Q?Fch5GrioA8z/99v89jCv8Jh1/kwe/UtbFI5TEQ9fKO6pqABRfvlfYjpr/1rv?=
 =?us-ascii?Q?CwN/9qoZP0GSGqQgx8pAwPX9IBEblYZBHOBwYc4Ttjm7Mn3U+ht9MG0is9LZ?=
 =?us-ascii?Q?TZgVRXZYIF3tx6b3dkXeMeEwM6nHm9VdXDjXcCNPAl+DIwpnT17iyrE0XmtT?=
 =?us-ascii?Q?uP4WuHbFMvUX9iUZGip/Uf1E5zoCnIA+O1cYaJDZDEi2kiUaVFn9lEYlTxMu?=
 =?us-ascii?Q?hNlwwD94tyCfFo0x9/19U3icA5hzjTmZu0caY/eK74lC8lV2k6ZzCAUQpYfF?=
 =?us-ascii?Q?15Abs0P7pIygzs7BcOqrtfQPdXSps5cAeKs7ytbGI8tE8JmtTAWJxRx/g7PG?=
 =?us-ascii?Q?po1f5ekqXL18g3lBbb60LS0qf8SVbZ4oTlx/who3gfr1N7EjB7ykLEaqhcTo?=
 =?us-ascii?Q?nt1M/aXqn6zNsuz88nDDG/wspqrJqiuWWCpj0PnFem7ljLYm38Fdp/Z9pB4P?=
 =?us-ascii?Q?lD8gaFKCYK0c5ZO0hbpZrQR6uRN8vlhqM36Bh5fKyP7di8KpFAJA0PgDR/gF?=
 =?us-ascii?Q?ld++/PenPNmsxe4hzG5ymKJpKDcsvprHUb0MhcjhzQ2bJBQMvK/wF2UOPtbn?=
 =?us-ascii?Q?5zZMbLZk22OLKNC2egRq9IvXedJd87FsW5V/sasSSO3odnrbUjgNRuCjloX4?=
 =?us-ascii?Q?xpUR8QvbMHvn0ms8nB5mJHcgAib8eclhAEI5rlqJh07HQf7tUnZjSO5jWbSZ?=
 =?us-ascii?Q?268Xx3t63xgnZi3av+/YAn28mQktka5waqO6a62ClHS0dPG6O6K4LsZZb1jJ?=
 =?us-ascii?Q?K4DE8enfFUfW8Fi+iFWof2xJx2hgxDyaeeLzN6fx+I+vVKb78CP52wzW6e5J?=
 =?us-ascii?Q?c435rzdxhpwdDA81oZRyArKT6PEwkENigl5dH++KFAQhJ1a/pHS81fuAn+Uo?=
 =?us-ascii?Q?JPVt2qCRltQFcdvRyHqQffJfjKeWVnR7AllBBQkvH6l2IGgNaQ19iK7/NBwr?=
 =?us-ascii?Q?DJpf6w1LnR/pvps8bfvZJ6fSE5gBOE1YeTunSUXqGhtqxZFKnK1bctPfcwlJ?=
 =?us-ascii?Q?ljrv2CFQFw=3D=3D?=
X-Exchange-RoutingPolicyChecked: W1i+ObcdH/8ktjqIDe4hoN3PIaWcyB5dr8gdBdGSr12J3H0W4JoO99DzslcEvJOfvBt/dbsoHE5z5D/9l7cOj3qCaGcZFI7DQ3mXLx2jAoA0PZoI9wamI7Lv7naSTIn/noywqXqaolHJgrHrxjy3KWhTdCCRSj8nIR3p/kxo9CAVOdYZliwbdPq24Kgv78buC5iTD5GTLrHdtn0hEfU/n46EJXjRY2xFpj1Nvl/mZQJySbpAAgRi4Qt72G471iVB0HV7XIVaLN+n91R4yZMiKe580F/RMsLbSS7CX1E5uz71pw8lhyYvN5ZcKNuWPbhrECQSKrHnNlvU1U/rEDwUxg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dcbde1d-aed4-43d1-7be3-08de9973a05d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 15:45:02.6317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IAR2zIBMx6kWlQ9FFKX/KXNeW5fXo3Ll4mI7aaXjyuFRLyC+bS2N58Tb+QxyquI9IREKvGAgeYArlP/9CV4Hlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7327
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

Matt Roper <matthew.d.roper@intel.com> writes:

> ROW_CHICKEN5 is a masked register (i.e., to adjust the value of any of
> the lower 16 bits, the corresponding bit in the upper 16 bits must also
> be set).  Add the XE_REG_OPTION_MASKED to its definition; failure to do
> so will cause workaround updates of this register to not apply properly.
>
> Bspec: 56853
> Fixes: 835cd6cbb0d0 ("drm/xe/xe3p_lpg: Add initial workarounds for graphics version 35.10")
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

It appears there was a Bspec update that accidentally dropped the
mask bits from the register description and then later on those were
added back (although the "masked" access tag remained).  Maybe it is
likely that we were in between those those changes when this programming
was added to the driver?

--
Gustavo Sousa

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index aa267c2f6162..a4472b7acb18 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -584,7 +584,7 @@
>  #define   DISABLE_128B_EVICTION_COMMAND_UDW	REG_BIT(36 - 32)
>  #define   LSCFE_SAME_ADDRESS_ATOMICS_COALESCING_DISABLE	REG_BIT(35 - 32)
>  
> -#define ROW_CHICKEN5				XE_REG_MCR(0xe7f0)
> +#define ROW_CHICKEN5				XE_REG_MCR(0xe7f0, XE_REG_OPTION_MASKED)
>  #define   CPSS_AWARE_DIS			REG_BIT(3)
>  
>  #define SARB_CHICKEN1				XE_REG_MCR(0xe90c)
>
> -- 
> 2.53.0
