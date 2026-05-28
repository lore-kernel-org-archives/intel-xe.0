Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B3FCD5BD5
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 20:24:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C3B10E0C4;
	Thu, 28 May 2026 20:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hxmn6Gw+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A4010E0C4
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 20:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779999872; x=1811535872;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=v+5+IqHmxhQBagMPsu4MR9n7SXqqfkdHze6VQBYj7pk=;
 b=hxmn6Gw+nODhdNJrsWAV5U7O01PGSx34is98XZ2W7Gge5yT3uWMe+OuT
 z6IaxQb0lgboq4qlmCMDaFSBqTpqfg1AtOpVpNZFCtLz8ElR4v7Ld07IM
 kXGNY9TPUNgna2C7XWmMivMyZbP0DzvBghw70iIGj0f/5McEix0Zzj7Uk
 fNyGkGiafUWWdBtDtM6OwLSR78FAdmgTJjvkSzCnKtjgOBl5M5jsS6pm5
 yJFNhPyz1T+jM2R33YAVITFVJ+rj/lmKOpMf4kXhOyGqxxWsd/7tq1Tq/
 4kvCH7FDiePnsUsVVLBn/bFrvCF2xgip9Rx4IcHDColreVLvNKYknqVeE A==;
X-CSE-ConnectionGUID: qaVWbKGxT1iMBBs3abB6Ag==
X-CSE-MsgGUID: nMlV+BDHTuyw6m7cm8iTqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80964574"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; d="scan'208";a="80964574"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 13:24:32 -0700
X-CSE-ConnectionGUID: vFZuPxjiRUGdWC6bxMfjiA==
X-CSE-MsgGUID: 9V2u0IV0RFSvSi0FlH2wGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; d="scan'208";a="266266689"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 13:24:32 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 13:24:31 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 28 May 2026 13:24:31 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 13:24:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hj9rfe0yokPOS+td4MvUtJQDroD5qpploINuU4GKaXutHuhAUVXHQyof0lwDWFzswF8i38dv5BnKf7DZw092PAbcIrSVFxKKzMcCvmkQRu+bk2gNJj4S4jdMtjH8ABuifwkrx4M2gMtpNOAYpEB0THmFxqa0NTHRXOHR6GbfVlrcA8Un+HRL7n8Mt/Mfp/u9z7uDDM3cuTSxSAXsOwZJ6i2c8ue0rBlqGvZk4OG6GFFNT+r4GZ8ED+Ty7BS7wRG6eTjERraLsCkFbYIMnGvU6IOf0+1BPZ1UpCNkdmXVDNALklDdLYsTgzEINv8VsRl5lQJWJ+ZUDZnWBtpb7um05A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqaD5DYKSCWIBRKythSUPpj6iUGSH6ZxcWrMFYzB5RY=;
 b=Fxkyyy9GuHd78NnSH31UM+vQYPoTEXHLpq3Rbn+F37Kz9H/P5js/hps7h5K21OhGY8Yd/h8hmXwAaNBpHlyqG5fAslxpkdon7NKjxo9h7Qqy9En55ae2Z6Zz9PKUWklj18EM4bhCOhkzuyMHw7vAGq5YqTVS9LV5ITiFPlW4sImv/JO/fxitgP9XNeYODjrn0offIhPLrZVSj2USxLU03s/Z4HU8eG8RK6FFPdr2n9oJfsK46xFc9RQ0btFx9xv3VyDwEdtAUDISFXAxuGaH+stXY4tfTz2lOy7gzOw2uWsEP7piWpYPPiEvfnvYFvAeYgY7T7K3pvafUeMIXLnHdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by LV3PR11MB8580.namprd11.prod.outlook.com (2603:10b6:408:1ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 20:24:29 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 20:24:29 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Paulo Zanoni
 <paulo.r.zanoni@intel.com>
Subject: [PATCH] drm/xe: improve Kconfig.profile help text for scheduler
 timeouts
Date: Thu, 28 May 2026 16:24:26 -0400
Message-ID: <20260528202425.135065-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:a03:331::10) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|LV3PR11MB8580:EE_
X-MS-Office365-Filtering-Correlation-Id: ae21ec83-13ca-446b-595d-08debcf71e79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|3023799007|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: WWd4lUl1MYyrkygqvmp5rxiQBFPGEcP+taFjuFQwDEceh4kxwRGpXSe7tsKYZQ2E0jic7NtH4JW65mr5MrM8K3I9y7/dUMhsX2aP/xLHf4l1LeWGwG9rInBhjRXPCvTLNk+RrS33ufzf6sZSc9qKNBn1RBPMEVdNGXqZv0DALqs4Q0kiP5vm5QOfyAo+N5T958N9IrHVrdjNKN+tY/mKBCDncWC/B8NwYZoK+cwku8ejnBt7BCY/tRXlEHeY6IdRMiZtPxOCoQ8t7uidazyMvRyL1rUmye+QUoVj9J18iah9NJI50AuWFo9UQyaMJGD+OzMYNCLD82/ZaqA2KkPrKpSHJ7fSMBu7sPFyl3rkDSBlfO03ggTigHC6GtJVhK/NCIWmOu3aHX+VeBHFz3ejYX9268Ga0TdJweldZzlaZBWWwNRUtnaW7akCImtenQFB+oErHWBs3HLhxUoMT+7iY1vxQmUdkJJHTCwsNFeUWDzoAqklOmu+s/jfWDzWfoo6NJSnYXm5EmbyN3HLOOpKGf2tR3S+BYAChbLgWn+LGLfhTDIhfpBsDVad5JSHFmEpyBbTF3LNqyjjEGdLsyuqw/dvbrLKEbhImLH1zqLg9HBwNEukJXBPI64oFfQ38t0Yt/YJbVg3y+aQE8DYaL3GObHMEyPKqriohiZJXNnN0jMdmqlaX7BjPq69u0wjnZpf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(3023799007)(11063799006)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ksddE9yR03yI3ed3W6gmD88cwfb+NxnrkhFwNC+wxPJfMh7ZYBr5cnaUI997?=
 =?us-ascii?Q?yG2sm0akf3dl1LfY3zrsChpflTNy3iYWLm3FShmklto36KhTz/IaNpteBbVa?=
 =?us-ascii?Q?aFZtMf7cUG0I62TrrCFkSC3uI5n0rS8JnHWrgr6F2ExenulPM422o8wlCtFE?=
 =?us-ascii?Q?mSXYPL+NErM27i/ZApyW1L3+mOdIRQiiqUXeyDaDprXsXp2i9+Gk2xRTqSLm?=
 =?us-ascii?Q?HubDCnZid/6HOI1EK1Yg21TXs+ZD0m6bVufwzrwbjwsQmQx6b9/YptKvbu8N?=
 =?us-ascii?Q?HMjyy9LZZK1ei+r+Jyg/Kqsk/kaXpa8LsGBM+TcaVItcMhi4OqyupwJRHSEe?=
 =?us-ascii?Q?MOs5WwAYrYtN/wFPGXrPp1pmJTYg162ULlHi7arM2LRTfhHgS5cHQyX93I0m?=
 =?us-ascii?Q?6Jx54sP/vclW3xCVotC89HtQrpNlghRzAd4lOumzOU4y5TSJklkVJw9Kl8m4?=
 =?us-ascii?Q?qb9IU72ChIkcJrIoKhig1oIuxhicAzPi92SBYy4RGGRKRFGN993afhYayIfg?=
 =?us-ascii?Q?4irpmhhEjIVFAmZJF710Z5uQuxhu8aHP2XND+77lhg8gPlZKJi/AjE06Qb29?=
 =?us-ascii?Q?FfOBNnVJP7P92dl1V95xK0F4gHcMETy6A3nEurGKtucJIbDD+yrYM5ya2kWP?=
 =?us-ascii?Q?Qp1yKcVoh3p8BmMJf/S9MALxuCaE7+PiQlLk4OzaR/ITIZEZB/w3rZcmrBQ1?=
 =?us-ascii?Q?UlG3pkXaBoaNRT0E2TALBbGiQ/6vHCWEeqK/88ZM5iA/qYjX1gJ+QKc7mzUz?=
 =?us-ascii?Q?z6fl8owjEHcBsseRdAtrVXt0Fq193z5t8JRjXm7MgNwLtGlPzSEBDzA88X08?=
 =?us-ascii?Q?7xVCY/VBh+h56X9e6zqQKXdRXnY1W+oFsUDqRpFUTa7GRWUTdEHjfEnw4GJH?=
 =?us-ascii?Q?ltetWOZQLjUEy8ptpYao9S9wPNlmH79Vnnf3LQZa8DZcC/rHlzhWRw+KFAym?=
 =?us-ascii?Q?6TzKflil9eSfciQ6R2HoxE5tFZkGUltjF6UFUNytSOxEV+FNihB2px7vzu6D?=
 =?us-ascii?Q?LTVlAaf0ghIPfeLJj+cUZtanHZe8+3m9qNHA3zmyJ3rPuL2uz2BrJqke9M3V?=
 =?us-ascii?Q?1E1YNVVG59yAbPWQYmdABU5ZaO6kSf9qa2cmjOXS4adJ47MoIWjoSEczEA7L?=
 =?us-ascii?Q?4cLS0Z8ICKIjFYX++hU2uEizrcLbc6bpefDwfZfyo+ehwoUgJh0pFckT9sl7?=
 =?us-ascii?Q?l1FI2fQZ7OHdJqVaAY7O6hwEnI+oilv3r+Xr7V1F0r+PySjSL3zl9RIJa1cP?=
 =?us-ascii?Q?vy2M0y4/Nu7H+NjTrPxxo5LUxRP7E/U1Fpfu7lbkiY9jrHkJB6cJu9D3ABVL?=
 =?us-ascii?Q?P67zHKpw439QL11+TCZdhZ2JnDiFwP2PMD17IU5n2S/yn5OM3nGPmQc4lAyL?=
 =?us-ascii?Q?+Ci/l+Q2S5SYhY93TDu31fNqmLAoGqN6BHm0bTc1umqoFDm1+X9WrkEEtgXo?=
 =?us-ascii?Q?66fvjZsIH/5aqDLEWZ6F/KcFtE5kJXQTlZJBwyuTWPVjPouGjixW211tGbN4?=
 =?us-ascii?Q?Bud/eU8sM62XQrh4m8mccez+WD10Bk+VAItmx/ehtBLLcrMziSQwwcIqfdwX?=
 =?us-ascii?Q?2LzcAYY1IiaWI4eVeHglr3is+eqymAbuSrFrl6PnyVoUHFU47bCQ2zQHxtf4?=
 =?us-ascii?Q?CQH5Y85lASDP1ChbveNaywAx3An9EyLMu52V9FNoAxz1JWu9t8luMoyTZ7cQ?=
 =?us-ascii?Q?PfPbHvYWHKDJ7XK2ubEXjyikNwCnextubRi4S72V3YYz0zodS63NcplbAG9k?=
 =?us-ascii?Q?e+NpLyNP1A=3D=3D?=
X-Exchange-RoutingPolicyChecked: rxyKuRTbE8KfhDVetsdZwfue3QRiuM3t0ftH6gcubvgsSbwpjQLyYPeVt1YX1CeXD+/8dHbGvNsa6wNiPT4G8pZBz+DhCHBYV7jXyT8Bu24SrG6uGyG0nJ3lrupaLi5JPY8DcjQ/UaBN/fI90KYdqwC04G0thsy8db4Cc4Hm0jiyT7NtQXKFb12+e7kkMFfmIeNu/Jx7syJ9czTGTPOuqVyuF3uoX6PfRUjq5gib/iD32Lx5ixayZpXxb0tlg06UDHms3pC/e3nmESGe6RYnCx3/mN/dw4KiT2cIAKw0sbEXA1QjtC0vV3Ix9LuPlt4E+1k0lfCQilyAs7n5j1UkGg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ae21ec83-13ca-446b-595d-08debcf71e79
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 20:24:28.9584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X82hWgT6Bkjcy49bQDTI1+G/FG7SLcoe98AV3ELe/DE5PvFFUQ+AgZdPs2WFD7kxYvQEPNmRAXs9Fs4mdVhp9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8580
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

The existing help texts for JOB_TIMEOUT, TIMESLICE and PREEMPT_TIMEOUT
configs were brief and did not make clear the role each symbol plays:

 - _TIMEOUT  : the kernel default, used when no userspace application
               overrides it via the SET_PROPERTY UAPI.
 - _TIMEOUT_MIN: lower bound of the range accepted by the UAPI; requests
                 below this value are rejected.
 - _TIMEOUT_MAX: upper bound of the range accepted by the UAPI; requests
                 above this value are rejected.

Rewrite the help texts to reflect this distinction, name the relevant
UAPI properties explicitly, and clarify that the MIN/MAX limits are only
enforced when DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT is enabled.

Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.profile | 71 +++++++++++++++++++-----------
 1 file changed, 46 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
index 7530df998148..e07517d120e0 100644
--- a/drivers/gpu/drm/xe/Kconfig.profile
+++ b/drivers/gpu/drm/xe/Kconfig.profile
@@ -1,50 +1,71 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_XE_JOB_TIMEOUT_MAX
-	int "Default max job timeout (ms)"
+	int "Hard upper limit for job timeout (ms)"
 	default 10000 # milliseconds
 	help
-	  Configures the default max job timeout after which job will
-	  be forcefully taken away from scheduler.
+	  Absolute upper bound (in milliseconds) for the per-engine-class job
+	  timeout. This is the maximum value that can be written to the sysfs
+	  job_timeout_ms knob, regardless of privileges. To raise this ceiling,
+	  increase this value and rebuild the kernel.
 config DRM_XE_JOB_TIMEOUT_MIN
-	int "Default min job timeout (ms)"
+	int "Hard lower limit for job timeout (ms)"
 	default 1 # milliseconds
 	help
-	  Configures the default min job timeout after which job will
-	  be forcefully taken away from scheduler.
+	  Absolute lower bound (in milliseconds) for the per-engine-class job
+	  timeout. This is the minimum value that can be written to the sysfs
+	  job_timeout_ms knob, regardless of privileges.
+
+	  Note: the job timeout default (5000 ms) is hardcoded in the driver
+	  and is not configurable here. Use the sysfs job_timeout_ms knob at
+	  runtime to change the engine-class default.
 config DRM_XE_TIMESLICE_MAX
-	int "Default max timeslice duration (us)"
+	int "Hard upper limit for timeslice duration (us)"
 	default 10000000 # microseconds
 	help
-	  Configures the default max timeslice duration between multiple
-	  contexts by guc scheduling.
+	  Absolute upper bound (in microseconds) for the timeslice duration.
+	  This caps both the sysfs timeslice_duration_us knob and the value
+	  accepted via the DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE UAPI for
+	  processes with CAP_SYS_NICE when DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
+	  is enabled.
 config DRM_XE_TIMESLICE_MIN
-	int "Default min timeslice duration (us)"
+	int "Hard lower limit for timeslice duration (us)"
 	default 1 # microseconds
 	help
-	  Configures the default min timeslice duration between multiple
-	  contexts by guc scheduling.
+	  Absolute lower bound (in microseconds) for the timeslice duration.
+	  This caps both the sysfs timeslice_duration_us knob and the value
+	  accepted via the DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE UAPI for
+	  processes with CAP_SYS_NICE when DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
+	  is enabled.
 config DRM_XE_PREEMPT_TIMEOUT
-	int "Preempt timeout (us, jiffy granularity)"
+	int "Default preempt timeout (us, jiffy granularity)"
 	default 640000 # microseconds
 	help
-	  How long to wait (in microseconds) for a preemption event to occur
-	  when submitting a new context. If the current context does not hit
-	  an arbitration point and yield to HW before the timer expires, the
-	  HW will be reset to allow the more important context to execute.
+	  Initial per-engine-class preemption timeout (in microseconds). This
+	  is the value the driver programs at boot; it can be changed at
+	  runtime via the sysfs preempt_timeout_us knob.
+
+	  This is how long the driver waits for the current context to reach
+	  an arbitration point and yield the GPU voluntarily when a
+	  higher-priority context becomes runnable. If the context does not
+	  yield before the timer expires, the HW is reset to allow the
+	  higher-priority context to execute.
+
+	  The range userspace may write via sysfs is bounded by
+	  DRM_XE_PREEMPT_TIMEOUT_MIN and DRM_XE_PREEMPT_TIMEOUT_MAX.
 config DRM_XE_PREEMPT_TIMEOUT_MAX
-	int "Default max preempt timeout (us)"
+	int "Hard upper limit for preempt timeout (us)"
 	default 10000000 # microseconds
 	help
-	  Configures the default max preempt timeout after which context
-	  will be forcefully taken away and higher priority context will
-	  run.
+	  Absolute upper bound (in microseconds) for the per-engine-class
+	  preemption timeout. This is the maximum value that can be written to
+	  the sysfs preempt_timeout_us knob, regardless of privileges.
 config DRM_XE_PREEMPT_TIMEOUT_MIN
-	int "Default min preempt timeout (us)"
+	int "Hard lower limit for preempt timeout (us)"
 	default 1 # microseconds
 	help
-	  Configures the default min preempt timeout after which context
-	  will be forcefully taken away and higher priority context will
-	  run.
+	  Absolute lower bound (in microseconds) for the per-engine-class
+	  preemption timeout. This is the minimum value that can be written to
+	  the sysfs preempt_timeout_us knob, regardless of privileges.
 config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
 	bool "Default configuration of limitation on scheduler timeout"
 	default y
-- 
2.54.0

